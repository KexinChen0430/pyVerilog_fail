module  CLK_LOCK_altclkctrl_tb8
	(
	clkselect,
	ena,
	inclk,
	outclk) /* synthesis synthesis_clearbox=1 */;
	input   [1:0]  clkselect;
	input   ena;
	input   [3:0]  inclk;
	output   outclk;
	wire  wire_clkctrl1_outclk;
	cycloneii_clkctrl   clkctrl1
	(
	.clkselect(clkselect),
	.ena(ena),
	.inclk(inclk),
	.outclk(wire_clkctrl1_outclk));
	defparam
		clkctrl1.clock_type = "Global Clock",
		clkctrl1.ena_register_mode = "none",
		clkctrl1.lpm_type = "cycloneii_clkctrl";
	assign
		outclk = wire_clkctrl1_outclk;
endmodule