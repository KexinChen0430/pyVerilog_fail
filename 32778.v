module novena_fpga_tb;
   // CPU EIM register interface mapping
   reg EIM_BCLK;
   reg [1:0] EIM_CS;
   reg [18:16] EIM_A;
   reg 	       EIM_LBA;
   reg 	       EIM_OE;
   reg 	       EIM_RW;
   wire [15:0] EIM_DA;
   reg [15:0]  EIM_DA_out;
   wire [15:0] EIM_DA_in;
   wire        EIM_DA_t;
   // CPU->DUT mappings bank A
   wire 	     F_LVDS_P15;
   wire 	     F_LVDS_N15;
   wire 	     F_LVDS_P0;
   wire 	     F_LVDS_N0;
   wire 	     F_LVDS_CK1_P;
   wire 	     F_LVDS_CK1_N;
   wire 	     F_DX14;
   wire 	     F_LVDS_P4;
   // CPU->DUT mappings bank B
   wire 	     F_LVDS_P11;
   wire 	     F_LVDS_N11;
   wire 	     F_DX1;
   wire 	     F_LVDS_NC;
   wire 	     F_LVDS_PC;
   wire 	     F_DX17;
   wire 	     F_LVDS_NB;
   wire 	     F_LVDS_PB;
   wire 	     F_LVDS_P7; // OE_N control for CPU->DUT bank A mappings
   wire 	     F_LVDS_N7; // OE_N control for CPU->DUT bank B mappings
   // DUT->CPU mappings
   reg 		     F_DX18;
   reg 		     F_LVDS_CK0_N;
   reg 		     F_LVDS_CK0_P;
   reg 		     F_LVDS_P9;
   reg 		     F_DX0;
   reg 		     F_DX3;
   reg 		     F_DX2;
   reg 		     F_DX11;
   wire 	     F_DX15;    // output voltage select; 1 = Low V; 0 = 5V
   reg 		     F_LVDS_NA;  // OC flag
   wire 	     F_DX13; // CS
   wire 	     F_DX7;  // SCLK
   wire 	     F_DX6;  // DIN
   reg 		     F_DX12;  // DOUT
   reg 		     I2C3_SCL;
   wire 	     I2C3_SDA;
   reg 		     I2C3_SDA_out;
   wire 	     I2C3_SDA_in;
   reg 		     I2C3_SDA_t;
   reg 		     CLK2_N; // free-runs at 50 MHz
   reg 		     CLK2_P;
   wire 	     FPGA_LED2;
   reg 		     RESETBMCU;
   wire 	     APOPTOSIS;
   wire [15:0] 		      eim_dout;
   wire [15:0] 		      eim_din;
   wire 		      clk;   // free-runs at 50 MHz, unbuffered
   wire 		      clk50; // zero-delay, DLL version of above. Use this.
   wire 		      bclk;  // NOTE: doesn't run until first CPU access to EIM; then free-runs at 133 MHz
   reg [23:0] 		      counter;
   wire 		      reset;
   wire 		      bclk_dll, bclk_div2_dll, bclk_div4_dll, bclk_locked;
   wire 		      bclk_early;
   wire 		      bclk_i, bclk_o;
   wire 		      clk25;
   // This code section is specific to the GPBB
   // The rest of the code is generic to creating EIM/I2C interfaces in the FPGA
   wire [7:0] 		      cpu_to_dutA; // this set of wires connected to EIM registers below
   wire [7:0] 		      cpu_to_dutB;
   wire 		      drive_dutA_N;
   wire 		      drive_dutB_N;
   wire [7:0] 		      dut_to_cpu;
   wire [15:0] 		      gpbb_ctl;
   wire [15:0] 		      gpbb_stat;
   // CPU->DUT mappings bank A
   assign F_LVDS_P15 = cpu_to_dutA[0];
   assign F_LVDS_N15 = cpu_to_dutA[1];
   assign F_LVDS_P0 =  cpu_to_dutA[2];
   assign F_LVDS_N0 =  cpu_to_dutA[3];
   assign F_LVDS_CK1_P =  cpu_to_dutA[4];
   assign F_LVDS_CK1_N =  cpu_to_dutA[5];
   assign F_DX14 =  cpu_to_dutA[6];
   assign F_LVDS_P4 =  cpu_to_dutA[7];
   // CPU->DUT mappings bank B
   assign F_LVDS_P11 = cpu_to_dutB[0];   // LED 0
   assign F_LVDS_N11 = cpu_to_dutB[1];   // LED 1
   assign F_DX1 = cpu_to_dutB[2];        // LED 2
   assign F_LVDS_NC = cpu_to_dutB[3];    // LED 3
   assign F_LVDS_PC = cpu_to_dutB[4];
   assign F_DX17 = cpu_to_dutB[5];
   assign F_LVDS_NB = cpu_to_dutB[6];
   assign F_LVDS_PB = cpu_to_dutB[7];
   assign F_LVDS_P7 = drive_dutA_N; // OE_N control for CPU->DUT mappings
   assign F_LVDS_N7 = drive_dutB_N; // OE_N control for CPU->DUT mappings
   assign drive_dutA_N = !gpbb_ctl[0]; // invert so drive is true from programming model
   assign drive_dutB_N = !gpbb_ctl[1]; // invert so drive is true from programming model
   assign F_DX15 = !gpbb_ctl[15];  // bit 15 selects output voltage
   // invert so from software, default 0 = low voltage; 1 = drive 5V
   // DUT->CPU mappings
   assign dut_to_cpu[0] = F_DX18;
   assign dut_to_cpu[1] = F_LVDS_CK0_N;
   assign dut_to_cpu[2] = F_LVDS_CK0_P;
   assign dut_to_cpu[3] = F_LVDS_P9;
   assign dut_to_cpu[4] = F_DX0;
   assign dut_to_cpu[5] = F_DX3;
   assign dut_to_cpu[6] = F_DX2;
   assign dut_to_cpu[7] = F_DX11;
   assign gpbb_stat[15:0] = {15'b0, F_LVDS_NA};  // tie unused lines to 0
   // bit 0 is overcurrent flag
   // right, so fwiw, we map the ADC to the I2C bus.
   // you can also map this to EIM by making registers that
   // map to ADC wires, but this is an instructive example of
   // how to use I2C-to-FPGA mappings with something reasonably generic.
   // the I2C interface block is called i2c_slave and is near the bottom of this file
   wire       adc_go;
   wire [2:0] adc_chan;
   wire [9:0] adc_in;
   wire       adc_valid;
   wire       slowclk;
   adc10cs022 adc10cs022 (
			  .DIG_ADC_CS(F_DX13),
			  .DIG_ADC_IN(F_DX6),
			  .DIG_ADC_OUT(F_DX12),
			  .DIG_ADC_SCLK(F_DX7),
			  .adc_in(adc_in),
			  .adc_chan(adc_chan),
			  .adc_valid(adc_valid),
			  .adc_go(adc_go),
			  .clk_3p2MHz(slowclk),
			  .reset(reset)
			  );
   // Minor version 0001, October 19 2014
   //   Initial design to validate GPBB
   reg 		      cs0_r, rw_r;
   reg [15:0] 	      din_r;
   reg [18:0] 	      bus_addr_r;
   reg 		      adv_r;
   reg 		      cs0_in, rw_in, adv_in;
   reg [15:0] 	      din_in;
   reg [2:0] 	      a_in;
   always @(posedge bclk_i) begin
      cs0_in <= EIM_CS[0];
      rw_in <= EIM_RW;
      din_in <= eim_din;
      adv_in <= !EIM_LBA; // latch address on LBA low
      a_in <= EIM_A[18:16];
      cs0_r <= cs0_in;
      rw_r <= rw_in;
      din_r <= din_in;
      adv_r <= adv_in;
   end
   always @(posedge bclk_i) begin
      if( adv_in ) begin
	 bus_addr_r <= {a_in, din_in};
      end else begin
	 bus_addr_r <= bus_addr_r;
      end
   end
   wire [15:0]               ro_d_b;
   reg [15:0]		     ro_d_r;
   reg [15:0] 		     ro_d_b_r;
   reg [1:0] 		     eim_rdcs;
   reg [15:0] 		     eim_dout_pipe;
   reg [15:0] 		     eim_dout_pipe2;
   always @(posedge bclk_i) begin
      ro_d_b_r[15:0] <= ro_d_b[15:0];
   end
   always @(posedge bclk_dll) begin
      ro_d_r <= ro_d;
      eim_rdcs[1:0] <= EIM_CS[1:0];
      eim_dout_pipe <= (eim_rdcs[1:0] == 2'b10) ? ro_d_r : ro_d_b_r;
   end
   always @(posedge bclk_o) begin
      eim_dout_pipe2 <= eim_dout_pipe; // retime near the source to allow max time for wire delay
   end;
   wire [15:0] r40000wo;
   wire [15:0] r40002wo;
   wire [15:0] ro_d;
   reg_wo reg_wo_40000 ( .clk(bclk_dll), .bus_a(bus_addr_r), .my_a(19'h40000),
			 .bus_d(din_r), .we(!cs0_r && !rw_r), .re(!cs0_r && rw_r), .rbk_d(ro_d),
			 .reg_d( r40000wo[15:0] ) );
   reg_wo reg_wo_40002 ( .clk(bclk_dll), .bus_a(bus_addr_r), .my_a(19'h40002),
			 .bus_d(din_r), .we(!cs0_r && !rw_r), .re(1'b0), .rbk_d(ro_d), // unreadable for testing
			 .reg_d( r40002wo[15:0] ) );
   reg_wo reg_wo_40010 ( .clk(bclk_dll), .bus_a(bus_addr_r), .my_a(19'h40010),
			 .bus_d(din_r), .we(!cs0_r && !rw_r), .re(!cs0_r && rw_r), .rbk_d(ro_d),
			 .reg_d( {cpu_to_dutB[7:0], cpu_to_dutA[7:0]} ) );
   reg_wo reg_wo_40012 ( .clk(bclk_dll), .bus_a(bus_addr_r), .my_a(19'h40012),
			 .bus_d(din_r), .we(!cs0_r && !rw_r), .re(!cs0_r && rw_r), .rbk_d(ro_d),
			 .reg_d( gpbb_ctl[15:0] ) );
   // loopback readback
   reg_ro reg_ro_41000 ( .clk(bclk_dll), .bus_a(bus_addr_r), .my_a(19'h41000),
			 .bus_d(ro_d), .re(!cs0_r && rw_r),
			 .reg_d( r40000wo[15:0] ) );
   reg_ro reg_ro_41002 ( .clk(bclk_dll), .bus_a(bus_addr_r), .my_a(19'h41002),
			 .bus_d(ro_d), .re(!cs0_r && rw_r),
			 .reg_d( r40002wo[15:0] ) );
   reg_ro reg_ro_41010 ( .clk(bclk_dll), .bus_a(bus_addr_r), .my_a(19'h41010),
			 .bus_d(ro_d), .re(!cs0_r && rw_r),
			 .reg_d( {8'b0,dut_to_cpu[7:0]} ) );
   reg_ro reg_ro_41012 ( .clk(bclk_dll), .bus_a(bus_addr_r), .my_a(19'h41012),
			 .bus_d(ro_d), .re(!cs0_r && rw_r),
			 .reg_d( gpbb_stat[15:0] ) );
   // CS1 bank registers: minimum size here is 64-bit, tuned for synchronous burst access only
   wire [63:0] 	     rC04_0000wo;
   wire [63:0] 	     rC04_0008wo;
   // loopback test
   reg_wo_4burst reg_wo_4b_C04_0000( .clk(bclk_i), .bus_ad(eim_din), .my_a(19'h4_0000),
				     .bus_a(EIM_A[18:16]), .adv(!EIM_LBA), .rw(EIM_RW), .cs(!EIM_CS[1]),
				     .reg_d( rC04_0000wo[63:0] ), .rbk_d(ro_d_b) );
   reg_wo_4burst reg_wo_4b_C04_0008( .clk(bclk_i), .bus_ad(eim_din), .my_a(19'h4_0008),
				     .bus_a(EIM_A[18:16]), .adv(!EIM_LBA), .rw(EIM_RW), .cs(!EIM_CS[1]),
				     .reg_d( rC04_0008wo[63:0] ), .rbk_d(ro_d_b) );
   // loopback test
   reg_ro_4burst reg_ro_4b_C04_1000( .clk(bclk_i), .bus_ad(eim_din), .my_a(19'h4_1000),
				     .bus_a(EIM_A[18:16]), .adv(!EIM_LBA), .rw(EIM_RW), .cs(!EIM_CS[1]),
				     .reg_d( rC04_0000wo[63:0] ), .rbk_d(ro_d_b) );
   reg_ro_4burst reg_ro_4b_C04_1008( .clk(bclk_i), .bus_ad(eim_din), .my_a(19'h4_1008),
				     .bus_a(EIM_A[18:16]), .adv(!EIM_LBA), .rw(EIM_RW), .cs(!EIM_CS[1]),
				     .reg_d( rC04_0008wo[63:0] ), .rbk_d(ro_d_b) );
   // FPGA minor version code
   reg_ro reg_ro_41FFC ( .clk(bclk_dll), .bus_a(bus_addr_r), .my_a(19'h41FFC),
			 .bus_d(ro_d), .re(!cs0_r && rw_r),
			 .reg_d( 16'h0001 ) ); // minor version
   // FPGA major version code
   reg_ro reg_ro_41FFE ( .clk(bclk_dll), .bus_a(bus_addr_r), .my_a(19'h41FFE),
			 .bus_d(ro_d), .re(!cs0_r && rw_r),
			 .reg_d( 16'h000B ) ); // 000B is for GPBB release
   wire [7:0] 	      reg_0_test;
   wire       SDA_pd;
   wire       SDA_int;
   IOBUF #(.DRIVE(8), .SLEW("SLOW")) IOBUF_sda (.IO(I2C3_SDA), .I(1'b0), .T(!SDA_pd), .O(SDA_int));
   i2c_slave i2c_slave(
		       .SCL(I2C3_SCL),
		       .SDA(SDA_int),
		       .SDA_pd(SDA_pd),
		       .clk(clk25), // nominally 26 MHz, this is close enough
		       .glbl_reset(reset),
		       .i2c_device_addr(8'h3C),
		       // outputs from I2C block (CPU->FPGA) 0-3F
		       .reg_0(reg_0_test),
		       .reg_2({adc_go,adc_chan[2:0]}),
		       // bit 2-0:  ADC channel
		       // bit 3:    initiate conversion
		       // inputs to I2C block (FPGA->CPU) 40-7F
		       .reg_40(adc_in[7:0]),
		       .reg_41({6'b0,adc_in[9:8]}),
		       .reg_42({7'b0, adc_valid}),
		       // ID / version code
		       // minor / major
		       .reg_fc(8'h00), .reg_fd(8'h02), .reg_fe(8'h00), .reg_ff(8'h04)
		       );
   // synced to a 3.2MHz clock
   sync_reset dll_res_sync( .glbl_reset(!RESETBMCU), .clk(slowclk), .reset(reset) );
   wire 	      bclk_int_in, bclk_io_in;
   IBUFG   clkibufg (.I(EIM_BCLK), .O(bclk) );
   BUFG    bclk_dll_bufg(.I(bclk), .O(bclk_int_in) );
   bclk_dll bclk_dll_mod( .clk133in(bclk_int_in), .clk133(bclk_dll),
			  .RESET(reset), .LOCKED(bclk_locked));
   wire 	      o_reset, o_locked;
   wire 	      i_fbk_out, i_fbk_in;
   wire 	      o_fbk_out, o_fbk_in;
   dcm_delay bclk_i_dll( .clk133(bclk_int_in), .clk133out(bclk_i),
			  .CLKFB_IN(i_fbk_in), .CLKFB_OUT(i_fbk_out),
			  .RESET(reset), .LOCKED(i_locked));
   dcm_delay bclk_o_dll( .clk133(bclk_int_in), .clk133out(bclk_o),
			  .CLKFB_IN(o_fbk_in), .CLKFB_OUT(o_fbk_out),
			  .RESET(reset), .LOCKED(o_locked));
   // lock it to the input path
   BUFIO2FB bclk_o_fbk(.I(bclk_o), .O(o_fbk_in));  // was this
//   assign o_fbk_in = bclk_o;
//   BUFG bclk_io_fbk(.I(bclk_io), .O(io_fbk_in));
   assign i_fbk_in = bclk_i;
   wire       dll_locked;
   clk_dll clk_dll
     (// Clock in ports
      .clk50in(clk),      // IN
      // Clock out ports
      .clk50(clk50),     // OUT
      .clk25(clk25),     // OUT
      .clk3p2(slowclk),     // OUT
      // Status and control signals
      .RESET(!RESETBMCU),// IN
      .LOCKED(dll_locked));      // OUT
   // Output pipeline registers -- explicit instantiation as their LOCs are controlled in the UCF.
   FDSE oddr2_eim0( .D( eim_dout_pipe2[0] ),
		     .C( bclk_o ),
		     .Q( eim_dout[0] ),
		     .CE( 1'b1 ), .S(1'b0) );
   FDSE oddr2_eim1( .D( eim_dout_pipe2[1] ),
		     .C( bclk_o ),
		     .Q( eim_dout[1] ),
		     .CE( 1'b1 ), .S(1'b0) );
   FDSE oddr2_eim2( .D( eim_dout_pipe2[2] ),
		     .C( bclk_o ),
		     .Q( eim_dout[2] ),
		     .CE( 1'b1 ), .S(1'b0) );
   FDSE oddr2_eim3( .D( eim_dout_pipe2[3] ),
		     .C( bclk_o ),
		     .Q( eim_dout[3] ),
		     .CE( 1'b1 ), .S(1'b0) );
   FDSE oddr2_eim4( .D( eim_dout_pipe2[4] ),
		     .C( bclk_o ),
		     .Q( eim_dout[4] ),
		     .CE( 1'b1 ), .S(1'b0) );
   FDSE oddr2_eim5( .D( eim_dout_pipe2[5] ),
		     .C( bclk_o ),
		     .Q( eim_dout[5] ),
		     .CE( 1'b1 ), .S(1'b0) );
   FDSE oddr2_eim6( .D( eim_dout_pipe2[6] ),
		     .C( bclk_o ),
		     .Q( eim_dout[6] ),
		     .CE( 1'b1 ), .S(1'b0) );
   FDSE oddr2_eim7( .D( eim_dout_pipe2[7] ),
		     .C( bclk_o ),
		     .Q( eim_dout[7] ),
		     .CE( 1'b1 ), .S(1'b0) );
   FDSE oddr2_eim8( .D( eim_dout_pipe2[8] ),
		     .C( bclk_o ),
		     .Q( eim_dout[8] ),
		     .CE( 1'b1 ), .S(1'b0) );
   FDSE oddr2_eim9( .D( eim_dout_pipe2[9] ),
		     .C( bclk_o ),
		     .Q( eim_dout[9] ),
		     .CE( 1'b1 ), .S(1'b0) );
   FDSE oddr2_eimA( .D( eim_dout_pipe2[10] ),
		     .C( bclk_o ),
		     .Q( eim_dout[10] ),
		     .CE( 1'b1 ), .S(1'b0) );
   FDSE oddr2_eimB( .D( eim_dout_pipe2[11] ),
		     .C( bclk_o ),
		     .Q( eim_dout[11] ),
		     .CE( 1'b1 ), .S(1'b0) );
   FDSE oddr2_eimC( .D( eim_dout_pipe2[12] ),
		     .C( bclk_o ),
		     .Q( eim_dout[12] ),
		     .CE( 1'b1 ), .S(1'b0) );
   FDSE oddr2_eimD( .D( eim_dout_pipe2[13] ),
		     .C( bclk_o ),
		     .Q( eim_dout[13] ),
		     .CE( 1'b1 ), .S(1'b0) );
   FDSE oddr2_eimE( .D( eim_dout_pipe2[14] ),
		     .C( bclk_o ),
		     .Q( eim_dout[14] ),
		     .CE( 1'b1 ), .S(1'b0) );
   FDSE oddr2_eimF( .D( eim_dout_pipe2[15] ),
		     .C( bclk_o ),
		     .Q( eim_dout[15] ),
		     .CE( 1'b1 ), .S(1'b0) );
   always @(posedge clk50) begin
      counter <= counter + 1;
   end
   assign FPGA_LED2 = counter[23];
   // IOBUFs as required by design
   IBUFGDS clkibufgds( .I(CLK2_P), .IB(CLK2_N), .O(clk) );
   reg [15:0]	      eim_d_t;
   reg 		      eim_lba_reg;
   reg 		      eim_oe_reg;
   always @(posedge bclk_i) begin
      eim_lba_reg <= EIM_LBA;
      eim_oe_reg <= EIM_OE;
   end
   always @(posedge bclk_o) begin
      eim_d_t[ 0] = eim_oe_reg | !eim_lba_reg;
      eim_d_t[ 1] = eim_oe_reg | !eim_lba_reg;
      eim_d_t[ 2] = eim_oe_reg | !eim_lba_reg;
      eim_d_t[ 3] = eim_oe_reg | !eim_lba_reg;
      eim_d_t[ 4] = eim_oe_reg | !eim_lba_reg;
      eim_d_t[ 5] = eim_oe_reg | !eim_lba_reg;
      eim_d_t[ 6] = eim_oe_reg | !eim_lba_reg;
      eim_d_t[ 7] = eim_oe_reg | !eim_lba_reg;
      eim_d_t[ 8] = eim_oe_reg | !eim_lba_reg;
      eim_d_t[ 9] = eim_oe_reg | !eim_lba_reg;
      eim_d_t[10] = eim_oe_reg | !eim_lba_reg;
      eim_d_t[11] = eim_oe_reg | !eim_lba_reg;
      eim_d_t[12] = eim_oe_reg | !eim_lba_reg;
      eim_d_t[13] = eim_oe_reg | !eim_lba_reg;
      eim_d_t[14] = eim_oe_reg | !eim_lba_reg;
      eim_d_t[15] = eim_oe_reg | !eim_lba_reg;
   end
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim0 (.IO(EIM_DA[ 0]), .I(eim_dout[ 0]), .T(eim_d_t[0]), .O(eim_din[ 0]));
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim1 (.IO(EIM_DA[ 1]), .I(eim_dout[ 1]), .T(eim_d_t[1]), .O(eim_din[ 1]));
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim2 (.IO(EIM_DA[ 2]), .I(eim_dout[ 2]), .T(eim_d_t[2]), .O(eim_din[ 2]));
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim3 (.IO(EIM_DA[ 3]), .I(eim_dout[ 3]), .T(eim_d_t[3]), .O(eim_din[ 3]));
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim4 (.IO(EIM_DA[ 4]), .I(eim_dout[ 4]), .T(eim_d_t[4]), .O(eim_din[ 4]));
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim5 (.IO(EIM_DA[ 5]), .I(eim_dout[ 5]), .T(eim_d_t[5]), .O(eim_din[ 5]));
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim6 (.IO(EIM_DA[ 6]), .I(eim_dout[ 6]), .T(eim_d_t[6]), .O(eim_din[ 6]));
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim7 (.IO(EIM_DA[ 7]), .I(eim_dout[ 7]), .T(eim_d_t[7]), .O(eim_din[ 7]));
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim8 (.IO(EIM_DA[ 8]), .I(eim_dout[ 8]), .T(eim_d_t[8]), .O(eim_din[ 8]));
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim9 (.IO(EIM_DA[ 9]), .I(eim_dout[ 9]), .T(eim_d_t[9]), .O(eim_din[ 9]));
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim10 (.IO(EIM_DA[10]), .I(eim_dout[10]), .T(eim_d_t[10]), .O(eim_din[10]));
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim11 (.IO(EIM_DA[11]), .I(eim_dout[11]), .T(eim_d_t[11]), .O(eim_din[11]));
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim12 (.IO(EIM_DA[12]), .I(eim_dout[12]), .T(eim_d_t[12]), .O(eim_din[12]));
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim13 (.IO(EIM_DA[13]), .I(eim_dout[13]), .T(eim_d_t[13]), .O(eim_din[13]));
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim14 (.IO(EIM_DA[14]), .I(eim_dout[14]), .T(eim_d_t[14]), .O(eim_din[14]));
   IOBUF #(.DRIVE(12), .SLEW("FAST")) IOBUF_eim15 (.IO(EIM_DA[15]), .I(eim_dout[15]), .T(eim_d_t[15]), .O(eim_din[15]));
   // tie downs (unused signals as of this rev of design)
   assign APOPTOSIS = 1'b0; // make apoptosis inactive, tigh high to force reboot on config
   // Simulation testbench code
   parameter PERIOD_CLK = 16'd8; // 125 MHz
   always begin
      EIM_BCLK = 1'b0;
      #(PERIOD_CLK/2) EIM_BCLK = 1'b1;
      #(PERIOD_CLK/2);
   end
   parameter PERIOD_CLK2 = 16'd20; // 50 MHz
   always begin
      CLK2_N = 1'b0;
      #(PERIOD_CLK2/2) CLK2_N = 1'b1;
      #(PERIOD_CLK2/2);
   end
   always begin
      CLK2_P = 1'b1;
      #(PERIOD_CLK2/2) CLK2_P = 1'b0;
      #(PERIOD_CLK2/2);
   end
   assign EIM_DA = EIM_DA_t ? 16'hZZZZ : EIM_DA_out;
   assign EIM_DA_in = EIM_DA;
   assign I2C3_SDA = I2C3_SDA_t ? 1'bZ : I2C3_SDA_out;
   assign I2C3_SDA_in = I2C3_SDA;
   assign EIM_DA_t = EIM_LBA;
   task eim_rd_cycle_cs0;
      input [18:0] adr;
      begin
	 EIM_LBA = 0;
	 EIM_CS = 2'b10;
	 EIM_A[18:16] = adr[18:16];
	 EIM_RW = 1'b1;
	 EIM_DA_out = 16'h3042;
	 #(PERIOD_CLK);
	 EIM_DA_out = adr[15:0];
	 #(PERIOD_CLK);
	 EIM_LBA = 1;
	 EIM_DA_out = 16'hzzzz;
	 #(PERIOD_CLK*5);
	 #(PERIOD_CLK*16); // readback data here
	 EIM_CS = 2'b11;
      end
   endtask; // eim_rd_cycle_cs0
   initial begin
      EIM_CS = 2'b11;
      EIM_A[18:16] = 3'b000;
      EIM_LBA = 1'b0;
      EIM_OE = 1'b1;
      EIM_RW = 1'b0;
      EIM_DA_out = 16'b0;
      F_DX18 = 1'b0;
      F_LVDS_CK0_N = 1'b0;
      F_LVDS_CK0_P = 1'b0;
      F_LVDS_P9 = 1'b0;
      F_DX0 = 1'b0;
      F_DX3 = 1'b0;
      F_DX2 = 1'b0;
      F_DX11 = 1'b0;
      F_LVDS_NA = 1'b0;
      F_DX12 = 1'b0;
      I2C3_SDA_out = 1'b0;
      I2C3_SDA_t = 1'b1;
      RESETBMCU = 1'b0;
      counter = 24'b0;
      #(PERIOD_CLK*16);
      RESETBMCU = 1'b1;
      $stop;
      #(PERIOD_CLK*16);
      repeat( 10 ) begin
	 eim_rd_cycle_cs0(19'h41FFE); // read the version ID registers
	 #(PERIOD_CLK*30);
	 eim_rd_cycle_cs0(19'h41FFC);
	 #(PERIOD_CLK*30);
      end
      $stop;
   end
endmodule