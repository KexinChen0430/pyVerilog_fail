module at all.
	.USRCCLKO(w_qspi_sck),
	// USRCCLKTS, 1'b input: User CCLK 3-state enable input
	//	An active high here places the clock into a high impedence
	//	state.  Since we wish to use the clock as an active output
	//	always, we drive this pin low.
	.USRCCLKTS(1'b0),
	// USRDONEO, 1'b input: User DONE pin output control
	//	Set this to "high" to make sure that the DONE LED pin is
	//	high.
	.USRDONEO(1'b1),
	// USRDONETS, 1'b input: User DONE 3-state enable output
	//	This enables the FPGA DONE pin to be active.  Setting this
	//	active high sets the DONE pin to high impedence, setting it
	//	low allows the output of this pin to be as stated above.
	.USRDONETS(1'b1)
	);
	xiddr	rx0(i_net_rx_clk, i_net_rxd[0], { w_net_rxd[4], w_net_rxd[0] });
	xiddr	rx1(i_net_rx_clk, i_net_rxd[1], { w_net_rxd[5], w_net_rxd[1] });
	xiddr	rx2(i_net_rx_clk, i_net_rxd[2], { w_net_rxd[6], w_net_rxd[2] });
	xiddr	rx3(i_net_rx_clk, i_net_rxd[3], { w_net_rxd[7], w_net_rxd[3] });
	xiddr	rxc(i_net_rx_clk, i_net_rx_ctl, { w_net_rxdv,   w_net_rxerr });
	xoddr	tx0(s_clk_125mhz, { w_net_txd[0], w_net_txd[4] }, o_net_txd[0]);
	xoddr	tx1(s_clk_125mhz, { w_net_txd[1], w_net_txd[5] }, o_net_txd[1]);
	xoddr	tx2(s_clk_125mhz, { w_net_txd[2], w_net_txd[6] }, o_net_txd[2]);
	xoddr	tx3(s_clk_125mhz, { w_net_txd[3], w_net_txd[7] }, o_net_txd[3]);
	xoddr	txc(s_clk_125mhz, { w_net_txctl,  w_net_txctl  }, o_net_tx_ctl);
	xoddr	txck(s_clk_125d,{w_net_tx_clk[1],w_net_tx_clk[0]},o_net_tx_clk);
	// Wires for setting up the SD Card Controller
	// IOBUF sd_cmd_buf(.T(w_sd_cmd),.O(i_sd_cmd), .I(1'b0), .IO(io_sd_cmd));
	IOBUF sd_dat0_bf(.T(1'b1),.O(i_sd[0]),.I(1'b1),.IO(io_sd[0]));
	IOBUF sd_dat1_bf(.T(1'b1),.O(i_sd[1]),.I(1'b1),.IO(io_sd[1]));
	IOBUF sd_dat2_bf(.T(1'b1),.O(i_sd[2]),.I(1'b1),.IO(io_sd[2]));
	// IOBUF sd_dat3_bf(.T(w_sd_data[3]),.O(i_sd[3]),.I(1'b0),.IO(io_sd[3]));
	IOBUF sd_cmd_buf(.T(1'b0),.O(i_sd_cmd), .I(w_sd_cmd), .IO(io_sd_cmd));
	IOBUF sd_dat3_bf(.T(1'b0),.O(i_sd[3]),.I(w_sd_data[3]),.IO(io_sd[3]));
	// First, let's get our clock up and running
	// 1. Convert from differential to single
	IBUFDS	hdmi_in_clk_ibuf(
			.I(i_hdmi_in_clk_p), .IB(i_hdmi_in_clk_n),
			.O(w_hdmi_in_clk_raw));
	BUFG	rawckbuf(.I(w_hdmi_in_clk_raw), .O(w_hdmi_in_clk_no_buf));
	// 3. Use that signal to generate a clock
	xhdmiiclk xhclkin(s_clk, w_hdmi_in_clk_no_buf, o_hdmi_in_txen,
			w_hdmi_in_hsclk, w_hdmi_in_logic_clk,
			w_hdmi_in_pll_locked);
	xhdmiin xhin_r(w_hdmi_in_logic_clk, w_hdmi_in_hsclk,
		o_hdmi_in_txen,
		w_hdmi_in_delay, w_hdmi_in_actual_delay_r,
		{ i_hdmi_in_p[2], i_hdmi_in_n[2] }, w_hdmi_in_red);
	xhdmiin	xhin_g(w_hdmi_in_logic_clk, w_hdmi_in_hsclk,
		o_hdmi_in_txen,
		w_hdmi_in_delay, w_hdmi_in_actual_delay_g,
		{ i_hdmi_in_p[1], i_hdmi_in_n[1] }, w_hdmi_in_green);
	xhdmiin xhin_b(w_hdmi_in_logic_clk, w_hdmi_in_hsclk,
		o_hdmi_in_txen,
		w_hdmi_in_delay, w_hdmi_in_actual_delay_b,
		{ i_hdmi_in_p[0], i_hdmi_in_n[0] }, w_hdmi_in_blue);
	// Xilinx requires an IDELAYCTRL to be added any time the IDELAY
	// element is included in the design.  Strangely, this doesn't need
	// to be conencted to the IDELAY in any fashion, it just needs to be
	// provided with a clock.
	// I should associate this delay with a delay group --- just haven't
	// done that yet.
	wire	delay_reset;
	assign	delay_reset = 1'b0;
	/*
	always @(posedge s_clk)
		delay_reset <= !sys_clk_locked;
	*/
	IDELAYCTRL dlyctrl(.REFCLK(s_clk_200mhz), .RDY(), .RST(delay_reset));
	assign	io_eth_mdio = (w_mdwe)?w_mdio : 1'bz;
	// The EDID I2C port for the HDMI source port
	// We need to make certain we only force the pin to a zero (drain)
	// when trying to do so.  Otherwise we let it float (back) high.
	assign	io_hdmi_out_scl = ((w_hdmi_bypass_scl)&&(w_hdmi_out_scl)) ? 1'bz : 1'b0;
	assign	io_hdmi_out_sda = ((w_hdmi_bypass_sda)&&(w_hdmi_out_sda)) ? 1'bz : 1'b0;
	wire	[31:0]	sdram_debug;
	migsdram #(.AXIDWIDTH(1), .WBDATAWIDTH(128),
			.DDRWIDTH(16),
			.RAMABITS(29)) sdrami(
		.i_clk(i_clk_buffered),
		.i_clk_200mhz(s_clk_200mhz),
		.o_sys_clk(s_clk),
		// .i_rst(!i_cpu_resetn),
		.i_rst(upper_plls_stable[3:2] != 2'b11),
		.o_sys_reset(s_reset),
		.i_wb_cyc(sdram_cyc), .i_wb_stb(sdram_stb),
		.i_wb_we(sdram_we), .i_wb_addr(sdram_addr),
			.i_wb_data(sdram_wdata), .i_wb_sel(sdram_sel),
		.o_wb_stall(sdram_stall),    .o_wb_ack(sdram_ack),
			.o_wb_data(sdram_rdata), .o_wb_err(sdram_err),
		.o_ddr_ck_p(ddr3_ck_p), .o_ddr_ck_n(ddr3_ck_n),
		.o_ddr_reset_n(ddr3_reset_n), .o_ddr_cke(ddr3_cke),
		// .o_ddr_cs_n(ddr3_cs_n),	// No CS on this chip
		.o_ddr_ras_n(ddr3_ras_n),
		.o_ddr_cas_n(ddr3_cas_n), .o_ddr_we_n(ddr3_we_n),
		.o_ddr_ba(ddr3_ba), .o_ddr_addr(ddr3_addr),
		.o_ddr_odt(ddr3_odt), .o_ddr_dm(ddr3_dm),
		.io_ddr_dqs_p(ddr3_dqs_p), .io_ddr_dqs_n(ddr3_dqs_n),
		.io_ddr_data(ddr3_dq)
		,  .o_ram_dbg(sdram_dbg)
		);
	assign	o_led = { w_led[8-1:2], (w_led[1] || !clocks_locked),
			w_led[0] | s_reset };
	// WB-Mouse
	// Adjustments necessary to turn the PS/2 logic to pull-up logic,
	// with a high impedence state if not used.
	assign	io_ps2_clk  = (w_ps2[1])? 1'bz:1'b0;
	assign	io_ps2_data = (w_ps2[0])? 1'bz:1'b0;
	// The EDID I2C port for the HDMI source port
	// We need to make certain we only force the pin to a zero (drain)
	// when trying to do so.  Otherwise we let it float (back) high.
	assign	io_hdmi_in_scl = (w_hdmi_in_scl) ? 1'bz : 1'b0;
	assign	io_hdmi_in_sda = (w_hdmi_in_sda) ? 1'bz : 1'b0;
endmodule