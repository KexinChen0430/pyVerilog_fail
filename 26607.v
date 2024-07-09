module xess_top (
);
`ifdef SRAM_INIT
sram_init sram_init1();
`endif
or1200_monitor or1200_monitor();
or1200_monitor2 or1200_monitor2();
reg		r_rstn;
reg		r_clk;
wire		rstn;
wire		clk;
// SPOOFER
`ifdef SPOOFER
wire [31:0]	clk_count;
wire [31:0]	spoof_out;
wire		trigger;
// SPOOFER
`endif
//reg   r_tx_clk;
//reg   r_rx_clk;
//wire		tx_clk;
//wire		rx_clk;
wire		flash_rstn;
wire		flash_oen;
wire		flash_cen;
wire		flash_wen;
wire		flash_rdy;
wire [7:0]	flash_d;
wire [20:0]	flash_a;
wire [31:0]	flash_vpp;		// Special flash inputs
wire [31:0]	flash_vcc;		// Special flash inputs
wire [1:0]	flash_rpblevel;		// Special flash inputs
wire          	sram_r_cen;
wire          	sram_r0_wen;
wire          	sram_r1_wen;
wire          	sram_r_oen;
wire [18:0]   	sram_r_a;
wire [15:0]    	sram_r_d;
wire          	sram_l_cen;
wire          	sram_l0_wen;
wire          	sram_l1_wen;
wire          	sram_l_oen;
wire [18:0]   	sram_l_a;
wire [15:0]    	sram_l_d;
wire	        codec_mclk;
wire          	codec_lrclk;
wire          	codec_sclk;
wire          	codec_sdin;
wire           	codec_sdout;
wire		vga_hsyncn;
wire		vga_vsyncn;
wire [1:0]	vga_r;
wire [1:0]	vga_g;
wire [1:0]	vga_b;
wire          	eth_tx_er;
wire           	eth_tx_clk;
wire          	eth_tx_en;
wire [4:0]    	eth_txd;
wire           	eth_rx_er;
wire           	eth_rx_clk;
wire           	eth_rx_dv;
wire [4:0]     	eth_rxd;
wire           	eth_col;
wire           	eth_crs;
wire          	eth_trste;
wire           	eth_fds_mdint;
wire           	eth_mdio;
wire          	eth_mdc;
wire [2:1]     	switch;
wire            USB_VPO;
wire            USB_VMO;
wire		gdb_tms;
wire		gdb_tck;
wire		gdb_trst;
wire		gdb_tdi;
wire		gdb_tdo;
wire	[6:3]	pps;
// Putting here the following blocks
// The xfpga_top
xsv_fpga_top i_xess_fpga(
	.clk( clk ),
	.rstn( rstn ),
        /*
	.tx_clk ( tx_clk ),
	.rx_clk ( rx_clk ),
        */
	// SPOOFER
	`ifdef SPOOFER
	.clk_count( clk_count ),
	.spoof_out( spoof_out ),
	.trigger( trigger ),
	`endif
        .flash_rstn( flash_rstn ),
        .flash_cen( flash_cen ),
        .flash_oen( flash_oen ),
        .flash_wen( flash_wen ),
        .flash_rdy( flash_rdy ),
        .flash_d( flash_d ),
        .flash_a( flash_a ),
        .sram_r_cen( sram_r_cen ),
        .sram_r_oen( sram_r_oen ),
        .sram_r0_wen( sram_r0_wen ),
        .sram_r1_wen( sram_r1_wen ),
        .sram_r_d( sram_r_d ),
        .sram_r_a( sram_r_a ),
	.sram_l_cen( sram_l_cen ),
        .sram_l_oen( sram_l_oen ),
        .sram_l0_wen( sram_l0_wen ),
        .sram_l1_wen( sram_l1_wen ),
        .sram_l_d( sram_l_d ),
        .sram_l_a( sram_l_a ),
/*
	.codec_mclk( codec_mclk ),
	.codec_lrclk( codec_lrclk ),
	.codec_sclk( codec_sclk ),
	.codec_sdin( codec_sdin ),
	.codec_sdout( codec_sdout ),
	.vga_blank(),
	.vga_pclk(),
	.vga_hsyncn( vga_hsyncn ),
	.vga_vsyncn( vga_vsyncn ),
	.vga_r( vga_r ),
	.vga_g( vga_g ),
	.vga_b( vga_b ),
	.eth_col( eth_col ),
	.eth_crs( eth_crs ),
	.eth_trste( eth_trste ),
	.eth_tx_clk( eth_tx_clk ),
	.eth_tx_en( eth_tx_en ),
	.eth_tx_er( eth_tx_er ),
	.eth_txd( eth_txd ),
	.eth_rx_clk( eth_rx_clk ),
	.eth_rx_dv( eth_rx_dv ),
        .eth_rx_er( eth_rx_er ),
        .eth_rxd( eth_rxd ),
        .eth_fds_mdint( eth_fds_mdint ),
        .eth_mdc( eth_mdc ),
        .eth_mdio( eth_mdio ),
 */
        .sw( switch ),
        /*
	.ps2_clk( ps2_clk ),
	.ps2_data( ps2_data ),
         */
	.tdmfrm(1'b0),
	.tdmrx(1'b0),
	.tdmtx()
//        .cpld_tdo(cpld_tdo)
);
// The Flash RAM
/*
assign flash_vpp = 32'h00002ee0;
assign flash_vcc = 32'h00001388;
assign flash_rpblevel = 2'b10;
i28f016s3 Flash (
        .rpb( flash_rstn ),
        .ceb( flash_cen ),
        .oeb( flash_oen ),
        .web( flash_wen ),
        .ryby( flash_rdy ),
        .dq( flash_d ),
        .addr( flash_a ),
	.vpp( flash_vpp ),
	.vcc( flash_vcc ),
	.rpblevel( flash_rpblevel )
);
*/
// The SRAM
/*
A512Kx8 Sram_r0 (
	.CE_bar( sram_r_cen ),
	.OE_bar( sram_r_oen ),
	.WE_bar( sram_r0_wen ),
	.dataIO( sram_r_d[7:0] ),
	.Address( sram_r_a )
);
A512Kx8 Sram_r1 (
	.CE_bar( sram_r_cen ),
	.OE_bar( sram_r_oen ),
	.WE_bar( sram_r1_wen ),
	.dataIO( sram_r_d[15:8] ),
	.Address( sram_r_a )
);
A512Kx8 Sram_l0 (
	.CE_bar( sram_l_cen ),
	.OE_bar( sram_l_oen ),
	.WE_bar( sram_l0_wen ),
	.dataIO( sram_l_d[7:0] ),
	.Address( sram_l_a )
);
A512Kx8 Sram_l1 (
	.CE_bar( sram_l_cen ),
	.OE_bar( sram_l_oen ),
	.WE_bar( sram_l1_wen ),
	.dataIO( sram_l_d[15:8] ),
	.Address( sram_l_a )
);
*/
// The Codec
/*
codec_model codec (
	.mclk( codec_mclk ),
	.lrclk( codec_lrclk ),
	.sclk( codec_sclk ),
	.sdin( codec_sdin ),
	.sdout( codec_sdout )
);
*/
/*
// The VGA
vga_model VGA (
	.pclk( clk ),
	.hsyncn( vga_hsyncn ),
	.vsyncn( vga_vsyncn ),
	.r( vga_r ),
	.g( vga_g ),
	.b( vga_b )
);
*/
/*
// We simulate CPLD because it has GDB JTAG multiplexer that
// works together with demultiplexer in FPGA to connect GDB to
// the RISC
`ifdef UNUSED
config_gdb xcpld (
	.clk(clk),
	.a(flash_a),
	.ceb(),
	.oeb(),
	.web(),
	.resetb(),
	.V_progb(),
	.V_cclk(),
	.V_csb(),
	.V_wrb(),
	.V_initb(cpld_tdo),
	.V_dout(1'b0),
	.V_done(1'b1),
	.V_m(),
	.ppd({2'b00, gdb_tms, gdb_tdi, gdb_trst, gdb_tck, 2'b00}),
	.pps(pps),
	.ppc(4'h0)
);
assign gdb_tdo = pps[4];
`else
assign flash_a[6] = flash_cen ? gdb_tms : 1'bz;
assign flash_a[7] = flash_cen ? gdb_tdi : 1'bz;
assign flash_a[8] = flash_cen ? gdb_trst : 1'bz;
assign flash_a[9] = flash_cen ? gdb_tck : 1'bz;
//assign gdb_tdo = cpld_tdo;
`endif
*/
// DBG i/f
`ifdef DBG_IF_COMM
dbg_comm dbg_comm(
`else
`ifdef DBG2_IF_COMM
dbg_comm2 dbg_comm(
	.P_TMS(gdb_tms),
	.P_TCK(gdb_tck),
	.P_TRST(gdb_trst),
	.P_TDI(gdb_tdi),
	.P_TDO(gdb_tdo)
);
`else
assign gdb_tms = 1'b0;
assign gdb_tck = 1'b0;
assign gdb_trst = rstn;
assign gdb_tdi = 1'b0;
`endif
`endif
	assign eth_tx_clk = 1'b0;
	assign eth_rx_er = 1'b0;
	assign eth_rx_clk = 1'b0;
	assign eth_rx_dv = 1'b0;
	assign eth_rxd = 5'b0;
	assign eth_col= 1'b0;
	assign eth_crs = 1'b0;
	assign eth_fds_mdint = 1'b0;
	assign eth_mdio = 1'bZ;
	assign switch = 2'b0;
	assign ps2_clk = 1'b0;
	assign ps2_data = 1'b0;
initial
begin
   #0 r_rstn = 1;
   #1 r_rstn = 0;
`ifdef SRAM_INIT
   sram_init1.init_sram;
`endif
   repeat (`BENCH_RESET_TIME) @(negedge r_clk);
   r_rstn = 1;
end
assign rstn = r_rstn;
initial begin
   r_clk = 1'b0;
   //r_tx_clk = 1'b0;
   //r_rx_clk = 1'b0;
end
always
begin
   #`BENCH_CLK_HALFPERIOD r_clk <= ~r_clk;
end
`ifdef SPOOFER
	assign clk_count = 32'b0000000000000000010000000;
`endif
assign clk = r_clk;
//assign tx_clk = r_tx_clk;
//assign rx_clk = r_rx_clk;
endmodule