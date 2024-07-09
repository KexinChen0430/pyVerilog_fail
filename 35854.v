module to make changing */
  /* the rev field easier with mask changes          */
  /* Now an FPGA, so it goes away                    */
  assign sh_rev = 3'b011;
  //assign the interrupt pin & interrpt register
  assign intrp_pin[7:0] = 8'h01; /* connecting SILVERHAMMER interrupt
  assign intrp_reg[7:0] = interrupt_line[7:0];//read back the register
  //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  //          MUXING ALL HBI REGISTERS
  //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  always @* begin
    casex ({cs_draw_a_regs_n,
            cs_global_intrp_reg_n,
	    cs_window_regs_n,
            cs_pci_config_regs_n,
	    cs_blk_config_regs_n,
	    hbi_addr_in[8:2]}) /*synopsys parallel_case */
      12'b1_1_1_1_0_X00000_1: //RBASE_W
	hb_regs_dout =  {rbase_w_dout,8'h0};
      12'b1_1_1_1_0_X00000_0: //RBASE_G
	hb_regs_dout =  {rbase_g_dout,8'h0};
      12'b1_1_1_1_0_X00001_0: // RBASE_A
	hb_regs_dout = {rbase_a_dout,9'h0};
      12'b1_1_1_1_0_X00010_1: //RBASE_I
	hb_regs_dout = {rbase_e_dout,16'h0};
      12'b1_1_1_1_0_X00010_0: //RBASE_I
	hb_regs_dout = {rbase_i_dout,8'h0};
      12'b1_1_1_1_0_X00011_1: //CONFIG1
	hb_regs_dout =
		      // CONFIG1
		      {8'b0,    // byte3
		       3'b0, enable_xy_de_a_p, 2'h0, enable_mem_window1_p,
		       enable_mem_window0_p, 2'h0, enable_rbase_e_p,
		       enable_rbase_i_p, 1'h0, // byte1
		       enable_rbase_a_p, enable_rbase_w_p, enable_rbase_g_p,
		       2'h0, se_clk_sel, 2'h0, soft_reset_p,
		       dac_soft_reset};  // byte0
      12'b1_1_1_1_0_X00011_0: // ID
	hb_regs_dout =
		      { 1'b0, rom_present, 1'b0, pci_class_config, 1'b1,
		       3'h0,                                    // byte3
		       2'h0, subsytem_id[5:0],                  // byte2
		       3'b0, pci_base0_1size, 1'b0, dden,       // byte1
		       pci_base0_1size, 2'b0, 1'b1, sh_rev};    // byte0
      12'b1_1_1_1_0_X00100_1: //SGRAM
	hb_regs_dout = sgram_reg[31:0];
      12'b1_1_1_1_0_X00100_0: // CONFIG2 REG
	hb_regs_dout =
		      { 8'h0,
		       cfg_reg2_mc, 1'h0, cfg_reg2_dws,
		       4'h0, cfg_reg2_ews,
		       cfg_reg2_cn, cfg_reg2_ref_cnt, cfg_reg2_rcd,
		       cfg_reg2_jv,
		       cfg_reg2_tr, cfg_reg2_sgr, cfg_reg2_ide};
      12'b1_1_1_1_0_X00101_1: //SOFT SWITCHS REG & M_INFO.
	hb_regs_dout =
		      {
			6'h0,                // 6      64
			m_info_dout[7:6],    // 2      58
			4'h0,                // 4      56
			ddc_clk_in_1,        // 1      52
 		        m_info_dout[5],      // 1      51
			ddc1_dat_sync_1,     // 1      50
			m_info_dout[4],      // 1      49
			6'h0,                // 6      48
			m_info_dout[3:2],    // 2      42
			2'h0,                // 2      40
			2'h0,                // 2      38
			ddc_clk_in_0,        // 1      36
 		        m_info_dout[1],      // 1      35
			ddc1_dat_sync_0,     // 1      34
			m_info_dout[0]};      // 1      33
      12'b1_1_1_1_0_X00101_0: //SOFT SWITCHS REG & M_INFO.
	hb_regs_dout = {
			16'h0,
			soft_switch_in,      // 8
			soft_switch_out      // 8
			};
      12'b1_1_1_1_0_X00110_0: //VGA_CTRL & RESERVED
	hb_regs_dout =
		      {24'h0, vga_ctrl_dout[7:0]};
      12'b1_1_1_1_0_X01101_1: //BIOS REG 2
	hb_regs_dout = bios_2_dout[31:0];
      12'b1_1_1_1_0_X01101_0: //BIOS REG 1
	hb_regs_dout = bios_1_dout[31:0];
      12'b1_1_1_1_0_X01110_1: //BIOS REG 4
	hb_regs_dout = bios_4_dout[31:0];
      12'b1_1_1_1_0_X01110_0: //BIOS REG 3
	hb_regs_dout = bios_3_dout[31:0];
      12'b1_1_1_1_0_X11010_1: //DMAC_SRC
	hb_regs_dout = REG_RESERVED;
      12'b1_1_1_1_0_X11010_0: //DMAC_DST
	hb_regs_dout = REG_RESERVED;
      12'b1_1_1_1_0_X11011_1: //Serial Eprom Control
        hb_regs_dout = {sepm_busy, 4'b0,
		        sepm_addr[18:16],
                        sepm_addr[15:8],
                        sepm_addr[7:0],
                        4'b0, sepm_cmd};
      12'b1_1_1_1_0_X11011_0: //DMAC_CMD
        hb_regs_dout = REG_RESERVED;
      12'b1_1_1_1_0_X11100_1: //PCIM_MASKS
	hb_regs_dout = {10'h0, pcim_masks};
      12'b1_1_1_1_0_X11100_0: //PCI_WR_ADDR
	hb_regs_dout = {pci_wr_addr, 2'h0};
      // PCI configuration registers
      12'b1_1_1_0_1_X00000_1: //STATUS/COMMAND & DEVICE ID REG
	hb_regs_dout = {5'h0, DEVSEL_MEDIUM, 1'b0, 1'b1, //Status Reg
			1'b0, m66_en, CAP_LIST, 4'h0,
			10'h0, vga_palette_snoop_n, 2'b00,      //Command Reg
			pci_mstr_en, pci_mem_enable_p, pci_io_enable_p};
      12'b1_1_1_0_1_X00000_0: //STATUS/COMMAND & DEVICE ID REG
	hb_regs_dout = { devid,                              //Device ID
			VENDOR_ID};                             //Vendor ID
      12'b1_1_1_0_1_X00001_1: //BIST & CLASS REG
	hb_regs_dout = { BIST,
		       SINGLE_FUNCTION, 7'h0,
		       LATENCY_TIMER,
		       CACHE_LINE_SIZE};
      12'b1_1_1_0_1_X00001_0: //BIST & CLASS REG
	hb_regs_dout = { DISPLAY_CONTROLLER,
		       sub_class[7:0],
		       PROG_IF,
		       5'h0, sh_rev};
      12'b1_1_1_0_1_X00010_1: //BASE1
	hb_regs_dout = {base_addr_reg1[9:0], 18'h0,
		       PREFETCHABLE, 2'h0, MEM_SPACE};
      12'b1_1_1_0_1_X00010_0: //BASE0
	hb_regs_dout = {base_addr_reg0[9:0], 18'h0,
		       PREFETCHABLE, 2'h0, MEM_SPACE};
      12'b1_1_1_0_1_X00011_0: //BASE2 REG
	hb_regs_dout =
		      { base_addr_reg2[31:12], 8'h0,
		       NON_PREFETCHABLE, 2'h0, MEM_SPACE};
      12'b1_1_1_0_1_X00100_1: //BASE5 & BASE4 REG
	hb_regs_dout = {base_addr_reg5[23:0],
		       6'h0, 1'b0, IO_SPACE};
      12'b1_1_1_0_1_X00100_0: //BASE5 & BASE4 REG
	hb_regs_dout = { base_addr_reg4[15:0],
		       12'h0, NON_PREFETCHABLE, 2'h0, MEM_SPACE};
      12'b1_1_1_0_1_X00101_1: //SUB_VENDOR ID
	hb_regs_dout = {subsytem_id, sub_vendor_id};
      12'b1_1_1_0_1_X00110_1: //CAPABILITIES POINTER
	hb_regs_dout = {24'h0, CAP_PTR};
      12'b1_1_1_0_1_X00110_0: //ROM BASE
	hb_regs_dout = { rbase_e_dout[31:16], 15'h0,
			pci_eprom_enable_p};
      12'b1_1_1_0_1_X00111_1: //INTERRUPT LINE & RESERVED REG
	hb_regs_dout =
		      {MAX_LAT,
		       MIN_GNT,
		       intrp_pin[7:0],
		       intrp_reg[7:0]};
      12'b1_1_1_0_1_X01XXX_X: //REGISTERS FROM 40h-7Fh ARE RESERVED
	hb_regs_dout = REG_RESERVED;
      12'b1_1_1_0_1_X10000_1: //AGP STATUS
	hb_regs_dout = {AGP_RQ, 14'h0, subsytem_id[5], 7'h0, AGP_RATE};
      12'b1_1_1_0_1_X10000_0: // CAPABILITIES ID
	hb_regs_dout = {8'h0, REV_MAJ, REV_MIN, PM_PTR, AGP_ID};
      12'b1_1_1_0_1_X10001_X: //RESERVED REG & AGP COMMAND REG (No more AGP)
	hb_regs_dout = REG_RESERVED;
      12'b1_1_1_0_1_X10010_1: //Power Managment STATUS
	hb_regs_dout = {30'h0, pm_ps};
      12'b1_1_1_0_1_X10010_0: //STATUS & CAPABILITIES ID
	hb_regs_dout = {16'h21, NO_PTR, PM_ID};
      //Remainder of registers in config space are reserved
      12'b1_1_1_0_1_X10011_X,
	12'b1_1_1_0_1_X101XX_X,
	12'b1_1_1_0_1_X11XXX_X:
	  hb_regs_dout = REG_RESERVED;
      // Window registers
      // window 0
      12'b1_1_0_1_1_X00000_1: // MW0_AD
	hb_regs_dout = {mw0_ad_dout,12'h0};
      12'b1_1_0_1_1_X00000_0: //MW0_CTRL
	hb_regs_dout = {mw0_ctrl_dout[24:17], mw0_ctrl_dout[16:9],
		       7'h0,mw0_ctrl_dout[8],mw0_ctrl_dout[7:0]};
      12'b1_1_0_1_1_X00001_0: //MW0_SZ
	hb_regs_dout =
		      {5'h0,
		       mw0_sz_dout_flush[1], 1'b0,
		       mw0_sz_dout_flush[0],
		       20'h0, mw0_sz_dout[3:0]};
      12'b1_1_0_1_1_X00010_X: //MW0_ORG
	hb_regs_dout = {6'h0, mw0_org_dout[25:12],12'h0};
      // window 1
      12'b1_1_0_1_1_X00101_1: // MW1_AD
	hb_regs_dout = {mw1_ad_dout,12'h0};
      12'b1_1_0_1_1_X00101_0: //MW1_CTRL
	hb_regs_dout = {mw1_ctrl_dout[24:17],
		       mw1_ctrl_dout[16:9],
		       7'h0,mw1_ctrl_dout[8],mw1_ctrl_dout[7:0]};
      12'b1_1_1_1_0_X01000_1: //MW1_CTRL & MW1_AD
	hb_regs_dout = {mw1_ad_dout,12'h0};
      12'b1_1_1_1_0_X01000_0: //MW1_CTRL & MW1_AD
	hb_regs_dout = { mw1_ctrl_dout[24:17],
		       mw1_ctrl_dout[16:9],
		       7'h0,mw1_ctrl_dout[8],mw1_ctrl_dout[7:0]};
      12'b1_1_0_1_1_X00110_0: //MW1_SZ
	hb_regs_dout = {5'h0, mw1_sz_dout_flush[1], 1'b0,
		       mw1_sz_dout_flush[0],
 		       20'h0, mw1_sz_dout[3:0]};
      12'b1_1_1_1_0_X01001_0: //MW1_SZ
	hb_regs_dout = {5'h0, mw1_sz_dout_flush[1], 1'b0,
		       mw1_sz_dout_flush[0],
 		       20'h0, mw1_sz_dout[3:0]};
      12'b1_1_0_1_1_X00111_X: //MW1_ORG
	hb_regs_dout = {6'h0,mw1_org_dout[25:12],12'h0};
      12'b1_1_1_1_0_X01010_X: //MW1_ORG
	hb_regs_dout = {6'h0,mw1_org_dout[25:12],12'h0};
      // global interrupt registers
      12'b1_0_1_1_1_X00000_1: // GINTM
	hb_regs_dout = {15'h0,gintm_dout[2], 14'h0, gintm_dout[1:0]};
      12'b1_0_1_1_1_X00000_0: // GINTP
	hb_regs_dout = {22'h0, gintp_dout[3:2], 6'h0,gintp_dout[1:0]};
      12'b1_0_1_1_1_X10000_1: //RBASE_G & RBASE_W(IN MEM SPACE)
	hb_regs_dout = {rbase_w_dout,8'h0};
      12'b1_0_1_1_1_X10000_0: //RBASE_G & RBASE_W(IN MEM SPACE)
	hb_regs_dout = {rbase_g_dout,8'h0};
      12'b1_0_1_1_1_X10001_0: //RBASE_B & RBASE_A(IN MEM SPACE)
	hb_regs_dout = {rbase_a_dout,9'h0};
      12'b1_0_1_1_1_X10010_1: // RBASE_E(IN MEM SPACE)
	hb_regs_dout = {rbase_e_dout, 16'h0};
      12'b1_0_1_1_1_X10010_0: //RBASE_I
	hb_regs_dout = {rbase_i_dout,8'h0};
      12'b1_0_1_1_1_X10011_1: //CONFIG1 & ID(IN MEM SPACE)
	hb_regs_dout =
		      // CONFIG1
		      {8'b0,    // byte3
		       3'b0, enable_xy_de_a_p, 2'h0, enable_mem_window1_p,
		       enable_mem_window0_p,
		       2'h0, enable_rbase_e_p, enable_rbase_i_p, 1'h0, // byte1
		       enable_rbase_a_p, enable_rbase_w_p, enable_rbase_g_p,
		       2'h0, se_clk_sel, 2'h0, soft_reset_p,
		       dac_soft_reset};  // byte0
      12'b1_0_1_1_1_X10011_0: //CONFIG1 & ID(IN MEM SPACE)
	hb_regs_dout =
		       // ID
		       {1'b0, rom_present, 1'b0, pci_class_config, 1'b1,
		       3'h0,                                     // byte3
		       2'h0, subsytem_id [5:0],                  // byte2
		       3'b0, pci_base0_1size, 1'b0, dden,        // byte1
		       pci_base0_1size, 2'b0, 1'b1, sh_rev};  // byte0
      12'b1_0_1_1_1_X10100_1: //SGRAM
	hb_regs_dout = sgram_reg[31:0];
      12'b1_0_1_1_1_X10100_0: // CONFIG2 REG (MEM SPACE)
	hb_regs_dout =
		       {8'h0,
		       cfg_reg2_mc, 1'h0, cfg_reg2_dws,
		       4'h0, cfg_reg2_ews,
		       cfg_reg2_cn, cfg_reg2_ref_cnt, cfg_reg2_rcd,
		       cfg_reg2_jv,
		       cfg_reg2_tr, cfg_reg2_sgr, cfg_reg2_ide};
      12'b1_0_1_1_1_X10101_1: // SOFT SWITCHS & M_INFO(MEM SPACE)
	hb_regs_dout = {
			6'h0,                // 6      64
			m_info_dout[7:6],    // 2      58
			4'h0,                // 4      56
			ddc_clk_in_1,        // 1      52
 		        m_info_dout[5],      // 1      51
			ddc1_dat_sync_1,     // 1      50
			m_info_dout[4],      // 1      49
			6'h0,                // 6      48
			m_info_dout[3:2],    // 2      42
			2'h0,                // 2      40
			2'h0,                // 2      38
			ddc_clk_in_0,        // 1      36
 		        m_info_dout[1],      // 1      35
			ddc1_dat_sync_0,     // 1      34
			m_info_dout[0]};     // 1      33
      12'b1_0_1_1_1_X10101_0: // SOFT SWITCHS
	hb_regs_dout = {
			soft_switch_in,      // 16     32
			soft_switch_out      // 16
			};
      12'b1_0_1_1_1_X10110_1: //BIOS REG 1
	hb_regs_dout = bios_1_dout[31:0];
      12'b1_0_1_1_1_X10110_0: //VGA_CTRL REG
	hb_regs_dout = {24'h0, vga_ctrl_dout[7:0]};
      12'b1_0_1_1_1_X10111_1: //BIOS REG 3
	hb_regs_dout = bios_3_dout[31:0];
      12'b1_0_1_1_1_X10111_0: // BIOS REG 2
	hb_regs_dout = bios_2_dout[31:0];
      12'b1_0_1_1_1_X11000_0: // BIOS REG 4
	hb_regs_dout = bios_4_dout[31:0];
      12'b1_0_1_1_1_X11010_X: //DMAC_SRC & DMAC_DST
	hb_regs_dout = REG_RESERVED;
      12'b1_0_1_1_1_X11011_X: //DMAC_CMD & RESERVED
	hb_regs_dout = 32'h0;
      12'b1_0_1_1_1_X11100_1: //PCI_WR_ADDR & PCIM_MASKS
	hb_regs_dout = {10'h0, pcim_masks};
      12'b1_0_1_1_1_X11100_0: //PCI_WR_ADDR & PCIM_MASKS
	hb_regs_dout = {pci_wr_addr, 2'h0};
      // drawing engine A registers
      12'b0_1_1_1_1_000000_1: //INTM_A
	hb_regs_dout = {30'h0, intm_a_dout[1:0]};
      12'b0_1_1_1_1_000000_0: //INTP_A
	hb_regs_dout = {30'h0, intp_a_dout[1:0]};
      12'b0_1_1_1_1_000001_1: //BUSY_A
	hb_regs_dout = {31'h0,busy_a};
      12'b0_1_1_1_1_000001_0: //BUSY_A & FLOW_A
	hb_regs_dout = {27'h0,flow_a_dout[4:0]};
      12'b0_1_1_1_1_000010_0: //XYW_AD
	hb_regs_dout = {xyw_a_dout[31:12],12'h0};
      default:
	hb_regs_dout = 32'h0;
    endcase
  end
  assign de_pl_busy = busy_a;
  assign flow_reg = flow_a_dout;
endmodule