module level1b_mk2_m (
                      input [15:0]   cpu_adr,
                      input          resetb,
                      input          cpu_vpb,
                      input          cpu_e,
                      input          cpu_vda,
                      input          cpu_vpa,
                      input          bbc_phi0,
                      input          hsclk,
                      input          cpu_rnw,
                      input [1:0]    j,
                      output [1:0]   tp,
`ifdef MARK2B
                      input          rdy,
                      input          nmib,
                      input          irqb,
                      output         cpu_rstb,
                      output         cpu_rdy,
                      output         cpu_nmib,
                      output         cpu_irqb,
                      output [15:0]  bbc_adr,
`else
                      input          dec_shadow_reg,
                      input          dec_rom_reg,
                      input          dec_fe4x,
                      inout          rdy,
                      inout          nmib,
                      inout          irqb,
                      output         lat_en,
                      output [15:12] bbc_adr,
`endif
                      inout [7:0]    cpu_data,
                      inout [7:0]    bbc_data,
                      output         ram_web,
                      output         ram_ceb,
                      output         ram_oeb,
                      output [18:14] ram_adr,
                      output         bbc_sync,
                      output         bbc_rnw,
                      output         bbc_phi1,
                      output         bbc_phi2,
                      output         cpu_phi2
                  );
  reg [7:0]                            cpu_hiaddr_lat_q;
  reg [7:0]                            cpu_data_r;
  reg                                  mos_vdu_sync_q;
  reg                                  write_thru_lat_q;
  reg                                  rom_wr_protect_lat_q;
  reg [7:0]                            bbc_data_lat_q;
  // This is the internal register controlling which features like high speed clocks etc are enabled
  reg [ `CPLD_REG_SEL_SZ-1:0]           cpld_reg_sel_q;
  wire [ `CPLD_REG_SEL_SZ-1:0]          cpld_reg_sel_d;
  // This will be a copy of the BBC ROM page register so we know which ROM is selected
  reg [`BBC_PAGEREG_SZ-1:0]            bbc_pagereg_q;
  reg [`MAP_CC_DATA_SZ-1:0]            map_data_q;
  reg                                  remapped_rom47_access_r ;
  reg                                  remapped_romAB_access_r ;
  reg                                  remapped_romCF_access_r ;
  reg                                  remapped_mos_access_r ;
  reg                                  remapped_ram_access_r ;
  reg                                  cpu_a15_lat_d;
  reg                                  cpu_a14_lat_d;
  reg                                  cpu_a15_lat_q;
  reg                                  cpu_a14_lat_q;
  reg [7:0]                            cpu_hiaddr_lat_d;
  reg [ `IO_ACCESS_DELAY_SZ-1:0]       io_access_pipe_q;
`ifdef ALLOW_BBC_MASTER_HOST
  reg                                  ram_at_8000;
  reg                                  mos_vdu_sync_acccon_q;
  reg                                  acccon_y; // bit 3 of FE34
  reg                                  acccon_x; // bit 2 of FE34
  reg                                  acccon_e; // bit 1 of FE34
`endif
  reg                                  rdy_q;
  wire                                 io_access_pipe_d;
  reg                                  write_thru_d;
`ifdef FORCE_KEEP_CLOCK
  (* KEEP="TRUE" *) wire               cpu_phi1_w;
  (* KEEP="TRUE" *) wire               cpu_phi2_w;
`else
  wire                                 cpu_phi1_w;
  wire                                 cpu_phi2_w;
`endif
  wire                                 hs_selected_w;
  wire                                 ls_selected_w;
  wire                                 dummy_access_w;
  wire                                 sel_hs_w;
  wire                                 native_mode_int_w;
  wire                                 himem_w;
  wire                                 hisync_w;
  wire [ `CPLD_REG_SEL_SZ-1:0]         cpld_reg_sel_w;
  wire                                 ckdel_w;
  wire                                 fast_clk_w;
`ifdef OBSERVE_CLOCKS
  assign tp = { bbc_phi2, fast_clk_w} ; // or cpu_phi2  for switched clock
`endif
  // Deglitch PHI0 input for feeding to clock switch only (mainly helps Elk, but
  // also provides opportunity to extend PHI1 slightly to give more time to clock
  // switch). Delay needed to CPU clock because 1MHz clock is much delayed on the
  // motherboard and hold fails occur on 1Mhz bus otherwise.
  (* KEEP="TRUE" *) wire ckdel_1_b;
  (* KEEP="TRUE" *) wire ckdel_2;
  INV    ckdel0   ( .I(bbc_phi0), .O(ckdel_1_b));
  INV    ckdel2   ( .I(ckdel_1_b), .O(ckdel_2));
  assign ckdel_w = !(bbc_phi0 & ckdel_2);
`define XC95108_7 1
`ifdef XC95108_7
  (* KEEP="TRUE" *) wire ckdel_3_b;
  (* KEEP="TRUE" *) wire ckdel_4;
  INV    ckdel3   ( .I(ckdel_2), .O(ckdel_3_b));
  INV    ckdel4   ( .I(ckdel_3_b), .O(ckdel_4));
  assign bbc_phi1 = ckdel_3_b;
  assign bbc_phi2 = ckdel_4;
`else
  assign bbc_phi1 = ckdel_1_b;
  assign bbc_phi2 = !ckdel_1_b;
`endif
  clkctrl_phi2 U_0 (
                    .hsclk_in(hsclk),
                    .lsclk_in(ckdel_w),
                    .rst_b(resetb),
                    .hsclk_sel(sel_hs_w),
                    .hsclk_selected(hs_selected_w),
                    .cpuclk_div_sel(`CLKDIV4NOT2),
                    .delay_bypass(`L1_MASTER_MODE),
                    .lsclk_selected(ls_selected_w),
                    .clkout(cpu_phi1_w),
                    .fast_clkout(fast_clk_w)
                    );
  assign cpu_phi2_w = !cpu_phi1_w ;
  assign cpu_phi2 =  cpu_phi2_w ;
  assign bbc_sync = (cpu_vpa & cpu_vda) | dummy_access_w;
`ifdef MARK2B
  // CPLD must do 5V/3V3 shifting on all control signals from host
  assign cpu_irqb = irqb;
  assign cpu_nmib = nmib;
  assign cpu_rdy =  rdy;
  assign cpu_rstb = resetb;
`else
  assign irqb = 1'bz;
  assign nmib = 1'bz;
  assign rdy =  1'bz;
`endif
  // Native mode interrupts will be redirected to himem
  assign native_mode_int_w = !cpu_vpb & !cpu_e ;
  // Drive the all RAM address pins, allowing for 512K RAM connection
  assign ram_adr = { cpu_hiaddr_lat_q[2:0], cpu_a15_lat_q, cpu_a14_lat_q } ;
  assign lat_en = !dummy_access_w;
`ifdef DELAY_RAMOEB_BY_1
  (* KEEP="TRUE" *) wire ramoeb_del_1;
  BUF    ramoedel1   ( .I(!cpu_rnw | cpu_phi1_w), .O(ramoeb_del_1));
  `define DELAYOEB ramoeb_del_1
`elsif DELAY_RAMOEB_BY_2
  (* KEEP="TRUE" *) wire ramoeb_del_1, ramoeb_del_2;
  BUF    ramoedel1   ( .I(!cpu_rnw | cpu_phi1_w), .O(ramoeb_del_1));
  BUF    ramoedel2   ( .I(ramoeb_del_1), .O(ramoeb_del_2));
  `define DELAYOEB ramoeb_del_2
`elsif DELAY_RAMOEB_BY_3
  (* KEEP="TRUE" *) wire ramoeb_del_1, ramoeb_del_2, ramoeb_del_3;
  BUF    ramoedel1   ( .I(!cpu_rnw | cpu_phi1_w), .O(ramoeb_del_1));
  BUF    ramoedel2   ( .I(ramoeb_del_1), .O(ramoeb_del_2));
  BUF    ramoedel3   ( .I(ramoeb_del_2), .O(ramoeb_del_3));
  `define DELAYOEB ramoeb_del_3
`else
  `define DELAYOEB 1'b0
`endif
  // All addresses starting 0b11 go to the on-board RAM and 0b10 to IO space, so check just bit 6
  // SRAM is enabled only in PHI2 for best operation with faster SRAM parts
  assign ram_ceb = cpu_phi1_w | !(cpu_hiaddr_lat_q[6] & (cpu_vda|cpu_vpa)) ;
  assign ram_web = cpu_rnw | cpu_phi1_w | rom_wr_protect_lat_q ;
  assign ram_oeb = !cpu_rnw | cpu_phi1_w | `DELAYOEB ;
  // All addresses starting with 0b10 go to internal IO registers which update on the
  // rising edge of cpu_phi1 - use the cpu_data bus directly for the high address
  // bits since it's stable by the end of phi1
  assign cpld_reg_sel_w = cpld_reg_sel_q;
  assign cpld_reg_sel_d[`CPLD_REG_SEL_MAP_CC_IDX] =  ( cpu_data[7:6]== 2'b10);
  assign cpld_reg_sel_d[`CPLD_REG_SEL_BBC_PAGEREG_IDX] = (cpu_data[7]== 1'b0) && `DECODED_ROM_REG ;
  assign cpld_reg_sel_d[`CPLD_REG_SEL_BBC_SHADOW_IDX] = (cpu_data[7]== 1'b0) && `DECODED_SHADOW_REG ;
  // Force dummy read access when accessing himem explicitly but not for remapped RAM accesses which can still complete
`ifdef MARK2B
`ifdef ALLOW_BBC_MASTER_HOST
  assign bbc_adr = { (dummy_access_w) ? (mos_vdu_sync_q ? 16'hC000 : 16'hE000) : cpu_adr };
`else
  assign bbc_adr = { (dummy_access_w) ? 16'hC000 : cpu_adr };
`endif
`else
  assign bbc_adr = { (dummy_access_w) ? 4'b1100 : cpu_adr[15:12] };
`endif
  // Build delay chain for use with Electron to improve xtalk (will be bypassed for other machines)
`ifdef ALLOW_ELK_HOST
  (* KEEP="TRUE" *) wire bbc_rnw_pre, bbc_rnw_del, bbc_rnw_del2;
  assign bbc_rnw_pre = cpu_rnw | dummy_access_w ;
  BUF    bbc_rnw_0( .I(bbc_rnw_pre), .O(bbc_rnw_del) );
  BUF    bbc_rnw_1( .I(bbc_rnw_del), .O(bbc_rnw_del2) );
  // Electron needs delay on RNW to reduce xtalk
  assign bbc_rnw = (`L1_ELK_MODE) ? (bbc_rnw_del2 | bbc_rnw_pre) : bbc_rnw_pre ;
`else
  assign bbc_rnw = cpu_rnw | dummy_access_w ;
`endif
  assign bbc_data = ( !bbc_rnw & bbc_phi2) ? cpu_data : { 8{1'bz}};
  assign cpu_data = cpu_data_r;
  // Check for write accesses to some of IO space (FE4x) in case we need to delay switching back to HS clock
  // so that min pulse widths to sound chip/reading IO are respected
  assign io_access_pipe_d = !cpu_hiaddr_lat_q[7] & `DECODED_FE4X & cpu_vda ;
  // Sel the high speed clock only
  assign himem_w =  cpu_hiaddr_lat_q[7] & (!write_thru_lat_q | cpu_rnw );
  // Allow hisync to be set for any valid program address (was opcode fetch only - ie vpa & vda)
  assign hisync_w = (cpu_vpa) & cpu_hiaddr_lat_q[7];
  assign sel_hs_w = (( hisync_w & !io_access_pipe_q[0] ) |
                     ( himem_w & hs_selected_w) |
                     (!cpu_vpa & !cpu_vda & hs_selected_w)
                     ) ;
  assign dummy_access_w =  himem_w | !ls_selected_w;
  // ROM remapping
  always @ ( * ) begin
    // Split ROM and MOS identification to allow them to go to different banks later
    remapped_mos_access_r = 0;
    remapped_rom47_access_r = 0;
    remapped_romAB_access_r = 0;
    remapped_romCF_access_r = 0;
    if (!cpu_data[7] & cpu_adr[15] & (cpu_vpa|cpu_vda) & map_data_q[`MAP_ROM_IDX]) begin
`ifdef ALLOW_BBC_MASTER_HOST
      if (!cpu_adr[14]) begin
        // ram_at_8000 always zero for non-Master machines
        remapped_romCF_access_r = (bbc_pagereg_q[3:2] == 2'b11) & (cpu_adr[12] | cpu_adr[13] | !ram_at_8000);
        remapped_romAB_access_r = (bbc_pagereg_q[3:1] == 3'b101) & (cpu_adr[12] | cpu_adr[13] | !ram_at_8000);
        remapped_rom47_access_r = (bbc_pagereg_q[3:2] == 2'b01) & (cpu_adr[12] | cpu_adr[13] | !ram_at_8000);
      end
      else
        // Remap MOS from C000-FBFF only (exclude IO space and vectors)
        remapped_mos_access_r = !(&(cpu_adr[13:10])) & (cpu_adr[13] | !acccon_y);
`else
      if (!cpu_adr[14]) begin
        remapped_romCF_access_r = (bbc_pagereg_q[3:2] == 2'b11) ;
        remapped_romAB_access_r = (bbc_pagereg_q[3:1] == 3'b101) ;
        remapped_rom47_access_r = (bbc_pagereg_q[3:2] == 2'b01) ;
      end
      else
        // Remap MOS from C000-FBFF only (exclude IO space and vectors)
        remapped_mos_access_r = !(&(cpu_adr[13:10]));
`endif
    end // if (!cpu_data[7] & cpu_adr[15] & (cpu_vpa|cpu_vda) & map_data_q[`MAP_ROM_IDX])
  end // always @ ( * )
  always @ ( * ) begin
    // Remap all of RAM area now and deal with video accesses separately
    remapped_ram_access_r = !cpu_data[7] & !cpu_adr[15] ;
  end
  always @ ( * ) begin
    // Default assignments
    cpu_a15_lat_d = cpu_adr[15];
    cpu_a14_lat_d = cpu_adr[14];
    cpu_hiaddr_lat_d = cpu_data;
    write_thru_d = 1'b0;
    // Native mode interrupts go to bank 0xFF (with other native 816 code)
    if ( native_mode_int_w )
      cpu_hiaddr_lat_d = 8'hFF;
    else if ( remapped_mos_access_r )
      cpu_hiaddr_lat_d = 8'hFF;
    else if ( remapped_ram_access_r ) begin
      if ( `LOWMEM_1K )
        // All hosts, all access to bottom 1K is high speed to bank &FF
        cpu_hiaddr_lat_d = 8'hFF;
`ifdef ALLOW_BBC_MASTER_HOST
      else if ( `L1_MASTER_MODE ) begin
        // All accesses from Master to memory above the 1K base is write-through
        write_thru_d = 1'b1;
        if (`LOWMEM_12K )
          // All accesses to memory below LYNNE go to main bank
          cpu_hiaddr_lat_d = 8'hFF;
        else if (mos_vdu_sync_acccon_q )
          // Shadow mode accesses using VDU calls go to alternate bank (Shadow mode
          // is always enabled in Master mode)
          cpu_hiaddr_lat_d = 8'hFD;
        else
          // Shadow mode accesses _not_ using VDU calls and non Shadow mode accesses
          cpu_hiaddr_lat_d = 8'hFF;
      end // if ( `L1_MASTER_MODE )
`endif //  `ifdef ALLOW_BBC_MASTER_HOST
`ifdef ALLOW_BEEB_OR_ELK_HOST
      else if ( !map_data_q[`SHADOW_MEM_IDX] ) begin
        // Beeb/Elk accesses to rest of RAM in non-shadow mode
        cpu_hiaddr_lat_d = 8'hFF;
        write_thru_d = 1'b1;
      end
      else if ( mos_vdu_sync_q ) begin
        // Beeb/Elk accesses to rest of RAM in Shadow mode but via VDU calls
        cpu_hiaddr_lat_d = 8'hFF;
        write_thru_d = 1'b1;
      end
      else begin
        // Beeb/Elk accesses to rest of RAM in Shadow mode, non VDU calls
        cpu_hiaddr_lat_d = 8'hFD;
      end
`endif
    end // if ( remapped_ram_access_r )
    else if (remapped_rom47_access_r | remapped_romCF_access_r | remapped_romAB_access_r) begin
      if ( remapped_rom47_access_r )
        cpu_hiaddr_lat_d = 8'hFC;
      else if ( remapped_romAB_access_r )
        cpu_hiaddr_lat_d = 8'hFD;
      else if ( remapped_romCF_access_r)
        cpu_hiaddr_lat_d = 8'hFE;
      cpu_a15_lat_d = bbc_pagereg_q[1];
      cpu_a14_lat_d = bbc_pagereg_q[0];
    end
  end
  // drive cpu data if we're reading internal register or making a non dummy read from lomem
  always @ ( * )
    if ( cpu_phi2_w & cpu_rnw )
      begin
        if (cpu_hiaddr_lat_q[7]) begin
          if (cpld_reg_sel_w[`CPLD_REG_SEL_MAP_CC_IDX] ) begin
            // Not all bits are used so assign default first, then individual bits
            cpu_data_r = 8'b0  ;
            cpu_data_r[`MAP_HSCLK_EN_IDX]      = map_data_q[`MAP_HSCLK_EN_IDX] ;
            cpu_data_r[`SHADOW_MEM_IDX]        = map_data_q[`SHADOW_MEM_IDX];
            cpu_data_r[`HOST_TYPE_1_IDX]       = map_data_q[`HOST_TYPE_1_IDX];
            cpu_data_r[`HOST_TYPE_0_IDX]       = map_data_q[`HOST_TYPE_0_IDX];
            cpu_data_r[`MAP_ROM_IDX]           = map_data_q[`MAP_ROM_IDX];
          end
          else //must be RAM access
            cpu_data_r = {8{1'bz}};
        end
        else
          cpu_data_r = bbc_data_lat_q;
      end
    else
      cpu_data_r = {8{1'bz}};
  // All inferred flops and latches below this point
  // Internal registers update on the rising edge of cpu_phi1
  always @ ( negedge cpu_phi2_w )
    // Synchronous reset for this register
    if ( !resetb )
      begin
        // DIP2 = MASTER MODE startup - shadow ON, host ID, bypass clock delay, VRAM size set
        map_data_q[`MAP_HSCLK_EN_IDX]    <= 1'b0;
        map_data_q[`MAP_ROM_IDX]         <= 1'b0;
        map_data_q[`HOST_TYPE_1_IDX]     <= j[1];  // DIP2
        map_data_q[`HOST_TYPE_0_IDX]     <= j[1];  // DIP2
        map_data_q[`SHADOW_MEM_IDX]      <= j[1];  // DIP2
        bbc_pagereg_q <= {`BBC_PAGEREG_SZ{1'b0}};
`ifdef ALLOW_BBC_MASTER_HOST
        ram_at_8000 <= 1'b0;
        {acccon_y, acccon_x, acccon_e} <= { 2'b00, !(`L1_MASTER_MODE) } ;
`endif
      end
    else
      begin
        if (cpld_reg_sel_w[`CPLD_REG_SEL_MAP_CC_IDX] & !cpu_rnw) begin
          map_data_q[`MAP_HSCLK_EN_IDX]   <= cpu_data[`MAP_HSCLK_EN_IDX] ;
          map_data_q[`SHADOW_MEM_IDX]     <= cpu_data[`SHADOW_MEM_IDX];
          map_data_q[`HOST_TYPE_1_IDX]    <= cpu_data[`HOST_TYPE_1_IDX];
          map_data_q[`HOST_TYPE_0_IDX]    <= cpu_data[`HOST_TYPE_0_IDX];
          map_data_q[`MAP_ROM_IDX]        <= cpu_data[`MAP_ROM_IDX];
        end // if (cpld_reg_sel_w[`CPLD_REG_SEL_MAP_CC_IDX] & !cpu_rnw)
        else if (cpld_reg_sel_w[`CPLD_REG_SEL_BBC_PAGEREG_IDX] & !cpu_rnw ) begin
          bbc_pagereg_q <= cpu_data;
`ifdef ALLOW_BBC_MASTER_HOST
          ram_at_8000 <= cpu_data[7] & `L1_MASTER_MODE;
`endif
        end
        else if (cpld_reg_sel_w[`CPLD_REG_SEL_BBC_SHADOW_IDX] & !cpu_rnw ) begin
`ifdef ALLOW_BEEB_OR_ELK_HOST
          if `L1_BPLUS_MODE
            map_data_q[`SHADOW_MEM_IDX] <= cpu_data[`SHADOW_MEM_IDX];
`endif
`ifdef ALLOW_BBC_MASTER_HOST
          if `L1_MASTER_MODE
            {acccon_y, acccon_x, acccon_e} <= cpu_data[3:1];
`endif
        end
      end // else: !if( !resetb )
  // Sample Rdy at the start of the cycle, so it remains stable for the remainder of the cycle
  always @ ( negedge cpu_phi2_w)
    rdy_q <= rdy;
  // Flop all the internal register sel bits on falling edge of phi1
  always @ ( posedge cpu_phi2_w or negedge resetb )
    if ( !resetb )
        cpld_reg_sel_q <= {`CPLD_REG_SEL_SZ{1'b0}};
    else
        cpld_reg_sel_q <= (rdy_q & cpu_vda) ? cpld_reg_sel_d : {`CPLD_REG_SEL_SZ{1'b0}};
  // Short pipeline to delay switching back to hs clock after an IO access to ensure any instruction
  // timed delays are respected. This pipeline is initialised to all 1's for force slow clock on startup
  // and will fill with the value of the HS clock enable register as instructions are executed.
  always @ ( negedge cpu_phi2_w or negedge resetb) begin
    if ( !resetb )
      io_access_pipe_q <= {`IO_ACCESS_DELAY_SZ{1'b1}};
    else begin
      if (io_access_pipe_d )
        io_access_pipe_q <= {`IO_ACCESS_DELAY_SZ{1'b1}};
      else if ( cpu_vpa & cpu_vda & rdy)
        io_access_pipe_q <= { !map_data_q[`MAP_HSCLK_EN_IDX], io_access_pipe_q[`IO_ACCESS_DELAY_SZ-2:1] } ;
    end
  end
  // Instruction was fetched from VDU routines in MOS if
  always @ ( negedge cpu_phi2_w )
    if ( cpu_vpa & cpu_vda ) begin
`ifdef ALLOW_BBC_MASTER_HOST
      if ( acccon_y ) begin
        mos_vdu_sync_q <= 1'b0;
      end
      else if ( map_data_q[`MAP_ROM_IDX]) begin
        mos_vdu_sync_q <= ({cpu_hiaddr_lat_q[7], cpu_hiaddr_lat_q[4:0],cpu_adr[15:13]}==9'b1_11111_110);
      end
      else begin
        mos_vdu_sync_q <= ({cpu_hiaddr_lat_q[7],cpu_adr[15:13]}==4'b0_110);
      end
`else
      if ( map_data_q[`MAP_ROM_IDX])
        mos_vdu_sync_q <= ({cpu_hiaddr_lat_q[7], cpu_hiaddr_lat_q[4:0],cpu_adr[15:13]}==9'b1_11111_110) ;
      else
        mos_vdu_sync_q <= ({cpu_hiaddr_lat_q[7],cpu_adr[15:13]}==4'b0_110) ;
`endif
    end // if ( cpu_vpa & cpu_vda )
`ifdef ALLOW_BBC_MASTER_HOST
  always @ ( posedge cpu_phi2_w )
    mos_vdu_sync_acccon_q <= (mos_vdu_sync_q) ? acccon_e: acccon_x;
`endif
  // Latches for the high address bits open during PHI1
  always @ ( * )
    if ( rdy & rdy_q & !cpu_phi2_w )
      begin
        cpu_hiaddr_lat_q <= cpu_hiaddr_lat_d ;
        cpu_a15_lat_q <= cpu_a15_lat_d;
        cpu_a14_lat_q <= cpu_a14_lat_d;
        write_thru_lat_q <= write_thru_d;
        rom_wr_protect_lat_q <= remapped_mos_access_r| remapped_romCF_access_r | remapped_romAB_access_r;
      end
  // Latches for the BBC data open during PHI2 to be stable beyond cycle end
  always @ ( * )
    if ( !bbc_phi1 )
      bbc_data_lat_q <= bbc_data;
endmodule