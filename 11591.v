module VGA_Audio_PLL (
	areset,
	inclk0,
	c0,
	c1,
	c2);
	input	  areset;
	input	  inclk0;
	output	  c0;
	output	  c1;
	output	  c2;
	wire [5:0] sub_wire0;
	wire [0:0] sub_wire6 = 1'h0;
	wire [2:2] sub_wire3 = sub_wire0[2:2];
	wire [1:1] sub_wire2 = sub_wire0[1:1];
	wire [0:0] sub_wire1 = sub_wire0[0:0];
	wire  c0 = sub_wire1;
	wire  c1 = sub_wire2;
	wire  c2 = sub_wire3;
	wire  sub_wire4 = inclk0;
	wire [1:0] sub_wire5 = {sub_wire6, sub_wire4};
	altpll	altpll_component (
				.inclk (sub_wire5),
				.areset (areset),
				.clk (sub_wire0)
				// synopsys translate_off
				,
				.scanclk (),
				.pllena (),
				.sclkout1 (),
				.sclkout0 (),
				.fbin (),
				.scandone (),
				.clkloss (),
				.extclk (),
				.clkswitch (),
				.pfdena (),
				.scanaclr (),
				.clkena (),
				.clkbad (),
				.scandata (),
				.enable1 (),
				.scandataout (),
				.extclkena (),
				.enable0 (),
				.scanwrite (),
				.locked (),
				.activeclock (),
				.scanread ()
				// synopsys translate_on
				);
	defparam
		altpll_component.clk0_divide_by = 15,
		altpll_component.clk0_duty_cycle = 50,
		altpll_component.clk0_multiply_by = 14,
		altpll_component.clk0_phase_shift = "0",
		altpll_component.clk1_divide_by = 3,
		altpll_component.clk1_duty_cycle = 50,
		altpll_component.clk1_multiply_by = 2,
		altpll_component.clk1_phase_shift = "0",
		altpll_component.clk2_divide_by = 15,
		altpll_component.clk2_duty_cycle = 50,
		altpll_component.clk2_multiply_by = 14,
		altpll_component.clk2_phase_shift = "-9921",
		altpll_component.compensate_clock = "CLK0",
		altpll_component.inclk0_input_frequency = 37037,
		altpll_component.intended_device_family = "Cyclone II",
		altpll_component.lpm_type = "altpll",
		altpll_component.operation_mode = "NORMAL",
		altpll_component.pll_type = "FAST";
endmodule