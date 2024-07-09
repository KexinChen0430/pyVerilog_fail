module  mi_nios_pll_altpll_vh92
	(
	areset,
	clk,
	inclk,
	locked) /* synthesis synthesis_clearbox=1 */;
	input   areset;
	output   [4:0]  clk;
	input   [1:0]  inclk;
	output   locked;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   areset;
	tri0   [1:0]  inclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	reg	pll_lock_sync;
	wire  [4:0]   wire_pll7_clk;
	wire  wire_pll7_fbout;
	wire  wire_pll7_locked;
	// synopsys translate_off
	initial
		pll_lock_sync = 0;
	// synopsys translate_on
	always @ ( posedge wire_pll7_locked or  posedge areset)
		if (areset == 1'b1) pll_lock_sync <= 1'b0;
		else  pll_lock_sync <= 1'b1;
	fiftyfivenm_pll   pll7
	(
	.activeclock(),
	.areset(areset),
	.clk(wire_pll7_clk),
	.clkbad(),
	.fbin(wire_pll7_fbout),
	.fbout(wire_pll7_fbout),
	.inclk(inclk),
	.locked(wire_pll7_locked),
	.phasedone(),
	.scandataout(),
	.scandone(),
	.vcooverrange(),
	.vcounderrange()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
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
		pll7.bandwidth_type = "auto",
		pll7.clk0_divide_by = 5,
		pll7.clk0_duty_cycle = 50,
		pll7.clk0_multiply_by = 8,
		pll7.clk0_phase_shift = "0",
		pll7.clk1_divide_by = 5,
		pll7.clk1_duty_cycle = 50,
		pll7.clk1_multiply_by = 8,
		pll7.clk1_phase_shift = "-3125",
		pll7.compensate_clock = "clk0",
		pll7.inclk0_input_frequency = 20000,
		pll7.operation_mode = "normal",
		pll7.pll_type = "auto",
		pll7.lpm_type = "fiftyfivenm_pll";
	assign
		clk = {wire_pll7_clk[4:0]},
		locked = (wire_pll7_locked & pll_lock_sync);
endmodule