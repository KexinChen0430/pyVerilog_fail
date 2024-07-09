module  adc_pll_altpll
	(
	clk,
	inclk) /* synthesis synthesis_clearbox=1 */;
	output   [4:0]  clk;
	input   [1:0]  inclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [1:0]  inclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  [4:0]   wire_pll1_clk;
	wire  wire_pll1_fbout;
	cycloneive_pll   pll1
	(
	.activeclock(),
	.clk(wire_pll1_clk),
	.clkbad(),
	.fbin(wire_pll1_fbout),
	.fbout(wire_pll1_fbout),
	.inclk(inclk),
	.locked(),
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
		pll1.bandwidth_type = "auto",
		pll1.clk0_divide_by = 125,
		pll1.clk0_duty_cycle = 50,
		pll1.clk0_multiply_by = 8,
		pll1.clk0_phase_shift = "0",
		pll1.inclk0_input_frequency = 20000,
		pll1.operation_mode = "no_compensation",
		pll1.pll_type = "auto",
		pll1.lpm_type = "cycloneive_pll";
	assign
		clk = {wire_pll1_clk[4:0]};
endmodule