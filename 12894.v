module  LVDS_AD_lvds_rx
	(
	rx_in,
	rx_inclock,
	rx_locked,
	rx_out,
	rx_outclock) /* synthesis synthesis_clearbox=1 */;
	input   [7:0]  rx_in;
	input   rx_inclock;
	output   rx_locked;
	output   [95:0]  rx_out;
	output   rx_outclock;
	wire  [7:0]   wire_ddio_in_dataout_h;
	wire  [7:0]   wire_ddio_in_dataout_l;
	reg	[5:0]	h_shiftreg10a;
	reg	[5:0]	h_shiftreg12a;
	reg	[5:0]	h_shiftreg14a;
	reg	[5:0]	h_shiftreg16a;
	reg	[5:0]	h_shiftreg2a;
	reg	[5:0]	h_shiftreg4a;
	reg	[5:0]	h_shiftreg6a;
	reg	[5:0]	h_shiftreg8a;
	reg	[5:0]	l_shiftreg11a;
	reg	[5:0]	l_shiftreg13a;
	reg	[5:0]	l_shiftreg15a;
	reg	[5:0]	l_shiftreg1a;
	reg	[5:0]	l_shiftreg3a;
	reg	[5:0]	l_shiftreg5a;
	reg	[5:0]	l_shiftreg7a;
	reg	[5:0]	l_shiftreg9a;
	reg	[95:0]	rx_reg;
	wire  [7:0]   wire_h_dffpipe_q;
	wire  [7:0]   wire_l_dffpipe_q;
	wire  [4:0]   wire_lvds_rx_pll_clk;
	wire  wire_lvds_rx_pll_fbout;
	wire  wire_lvds_rx_pll_locked;
	wire  [7:0]  ddio_dataout_h;
	wire  [7:0]  ddio_dataout_h_int;
	wire  [7:0]  ddio_dataout_l;
	wire  [7:0]  ddio_dataout_l_int;
	wire  fast_clock;
	wire  [95:0]  rx_out_wire;
	wire  slow_clock;
	LVDS_AD_lvds_ddio_in   ddio_in
	(
	.clock(fast_clock),
	.datain(rx_in),
	.dataout_h(wire_ddio_in_dataout_h),
	.dataout_l(wire_ddio_in_dataout_l));
	// synopsys translate_off
	initial
		h_shiftreg10a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg10a <= {h_shiftreg10a[4:0], ddio_dataout_l[4]};
	// synopsys translate_off
	initial
		h_shiftreg12a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg12a <= {h_shiftreg12a[4:0], ddio_dataout_l[5]};
	// synopsys translate_off
	initial
		h_shiftreg14a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg14a <= {h_shiftreg14a[4:0], ddio_dataout_l[6]};
	// synopsys translate_off
	initial
		h_shiftreg16a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg16a <= {h_shiftreg16a[4:0], ddio_dataout_l[7]};
	// synopsys translate_off
	initial
		h_shiftreg2a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg2a <= {h_shiftreg2a[4:0], ddio_dataout_l[0]};
	// synopsys translate_off
	initial
		h_shiftreg4a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg4a <= {h_shiftreg4a[4:0], ddio_dataout_l[1]};
	// synopsys translate_off
	initial
		h_shiftreg6a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg6a <= {h_shiftreg6a[4:0], ddio_dataout_l[2]};
	// synopsys translate_off
	initial
		h_shiftreg8a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  h_shiftreg8a <= {h_shiftreg8a[4:0], ddio_dataout_l[3]};
	// synopsys translate_off
	initial
		l_shiftreg11a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg11a <= {l_shiftreg11a[4:0], ddio_dataout_h[5]};
	// synopsys translate_off
	initial
		l_shiftreg13a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg13a <= {l_shiftreg13a[4:0], ddio_dataout_h[6]};
	// synopsys translate_off
	initial
		l_shiftreg15a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg15a <= {l_shiftreg15a[4:0], ddio_dataout_h[7]};
	// synopsys translate_off
	initial
		l_shiftreg1a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg1a <= {l_shiftreg1a[4:0], ddio_dataout_h[0]};
	// synopsys translate_off
	initial
		l_shiftreg3a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg3a <= {l_shiftreg3a[4:0], ddio_dataout_h[1]};
	// synopsys translate_off
	initial
		l_shiftreg5a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg5a <= {l_shiftreg5a[4:0], ddio_dataout_h[2]};
	// synopsys translate_off
	initial
		l_shiftreg7a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg7a <= {l_shiftreg7a[4:0], ddio_dataout_h[3]};
	// synopsys translate_off
	initial
		l_shiftreg9a = 0;
	// synopsys translate_on
	always @ ( posedge fast_clock)
		  l_shiftreg9a <= {l_shiftreg9a[4:0], ddio_dataout_h[4]};
	// synopsys translate_off
	initial
		rx_reg = 0;
	// synopsys translate_on
	always @ ( posedge slow_clock)
		  rx_reg <= rx_out_wire;
	LVDS_AD_dffpipe   h_dffpipe
	(
	.clock(fast_clock),
	.d(ddio_dataout_h_int),
	.q(wire_h_dffpipe_q));
	LVDS_AD_dffpipe   l_dffpipe
	(
	.clock(fast_clock),
	.d(ddio_dataout_l_int),
	.q(wire_l_dffpipe_q));
	cycloneiii_pll   lvds_rx_pll
	(
	.activeclock(),
	.clk(wire_lvds_rx_pll_clk),
	.clkbad(),
	.fbin(wire_lvds_rx_pll_fbout),
	.fbout(wire_lvds_rx_pll_fbout),
	.inclk({1'b0, rx_inclock}),
	.locked(wire_lvds_rx_pll_locked),
	.phasedone(),
	.scandataout(),
	.scandone(),
	.vcooverrange(),
	.vcounderrange()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.areset(1'b0),
	.clkswitch(1'b0),
	.configupdate(1'b0),
	.pfdena(1'b1),
	.phasecounterselect({3{1'b0}}),
	.phasestep(1'b0),
	.phaseupdown(1'b0),
	.scanclk(1'b0),
	.scanclkena(1'b1),
	.scandata(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		lvds_rx_pll.clk0_divide_by = 1,
		lvds_rx_pll.clk0_multiply_by = 6,
		lvds_rx_pll.clk0_phase_shift = "-312",
		lvds_rx_pll.clk1_divide_by = 6,
		lvds_rx_pll.clk1_multiply_by = 6,
		lvds_rx_pll.clk1_phase_shift = "-312",
		lvds_rx_pll.inclk0_input_frequency = 20000,
		lvds_rx_pll.operation_mode = "source_synchronous",
		lvds_rx_pll.self_reset_on_loss_lock = "on",
		lvds_rx_pll.lpm_type = "cycloneiii_pll";
	assign
		ddio_dataout_h = wire_h_dffpipe_q,
		ddio_dataout_h_int = wire_ddio_in_dataout_h,
		ddio_dataout_l = wire_l_dffpipe_q,
		ddio_dataout_l_int = wire_ddio_in_dataout_l,
		fast_clock = wire_lvds_rx_pll_clk[0],
		rx_locked = wire_lvds_rx_pll_locked,
		rx_out = rx_reg,
		rx_out_wire = {l_shiftreg15a[5], h_shiftreg16a[5], l_shiftreg15a[4], h_shiftreg16a[4], l_shiftreg15a[3], h_shiftreg16a[3], l_shiftreg15a[2], h_shiftreg16a[2], l_shiftreg15a[1], h_shiftreg16a[1], l_shiftreg15a[0], h_shiftreg16a[0], l_shiftreg13a[5], h_shiftreg14a[5], l_shiftreg13a[4], h_shiftreg14a[4], l_shiftreg13a[3], h_shiftreg14a[3], l_shiftreg13a[2], h_shiftreg14a[2], l_shiftreg13a[1], h_shiftreg14a[1], l_shiftreg13a[0], h_shiftreg14a[0], l_shiftreg11a[5], h_shiftreg12a[5], l_shiftreg11a[4], h_shiftreg12a[4], l_shiftreg11a[3], h_shiftreg12a[3], l_shiftreg11a[2], h_shiftreg12a[2], l_shiftreg11a[1], h_shiftreg12a[1], l_shiftreg11a[0], h_shiftreg12a[0], l_shiftreg9a[5], h_shiftreg10a[5], l_shiftreg9a[4], h_shiftreg10a[4], l_shiftreg9a[3], h_shiftreg10a[3], l_shiftreg9a[2], h_shiftreg10a[2], l_shiftreg9a[1], h_shiftreg10a[1], l_shiftreg9a[0], h_shiftreg10a[0], l_shiftreg7a[5], h_shiftreg8a[5], l_shiftreg7a[4], h_shiftreg8a[4], l_shiftreg7a[3], h_shiftreg8a[3], l_shiftreg7a[2], h_shiftreg8a[2], l_shiftreg7a[1], h_shiftreg8a[1], l_shiftreg7a[0], h_shiftreg8a[0], l_shiftreg5a[5], h_shiftreg6a[5], l_shiftreg5a[4], h_shiftreg6a[4], l_shiftreg5a[3], h_shiftreg6a[3], l_shiftreg5a[2], h_shiftreg6a[2], l_shiftreg5a[1], h_shiftreg6a[1], l_shiftreg5a[0], h_shiftreg6a[0], l_shiftreg3a[5], h_shiftreg4a[5], l_shiftreg3a[4], h_shiftreg4a[4], l_shiftreg3a[3], h_shiftreg4a[3], l_shiftreg3a[2], h_shiftreg4a[2], l_shiftreg3a[1], h_shiftreg4a[1], l_shiftreg3a[0], h_shiftreg4a[0], l_shiftreg1a[5], h_shiftreg2a[5], l_shiftreg1a[4], h_shiftreg2a[4], l_shiftreg1a[3], h_shiftreg2a[3], l_shiftreg1a[2], h_shiftreg2a[2], l_shiftreg1a[1], h_shiftreg2a[1], l_shiftreg1a[0], h_shiftreg2a[0]},
		rx_outclock = slow_clock,
		slow_clock = wire_lvds_rx_pll_clk[1];
endmodule