module  PH2_CLK_altclkctrl_6df
	(
	clkselect,
	ena,
	inclk,
	outclk) ;
	input   [1:0]  clkselect;
	input   ena;
	input   [3:0]  inclk;
	output   outclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [1:0]  clkselect;
	tri1   ena;
	tri0   [3:0]  inclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  wire_clkctrl1_outclk;
	wire  [1:0]  clkselect_wire;
	wire  [3:0]  inclk_wire;
	cycloneii_clkctrl   clkctrl1
	(
	.clkselect(clkselect_wire),
	.ena(ena),
	.inclk(inclk_wire),
	.outclk(wire_clkctrl1_outclk)
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		clkctrl1.clock_type = "Global Clock",
		clkctrl1.ena_register_mode = "falling edge",
		clkctrl1.lpm_type = "cycloneii_clkctrl";
	assign
		clkselect_wire = {clkselect},
		inclk_wire = {inclk},
		outclk = wire_clkctrl1_outclk;
endmodule