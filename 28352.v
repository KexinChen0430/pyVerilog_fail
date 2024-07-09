module altpcie_pll_125_250 (
	areset,
	inclk0,
	c0);
	input	  areset;
	input	  inclk0;
	output	  c0;
	wire [5:0] sub_wire0;
	wire [0:0] sub_wire2 = 1'h0;
	wire [0:0] sub_wire4 = 1'h1;
	wire [0:0] sub_wire1 = sub_wire0[0:0];
	wire  c0 = sub_wire1;
	wire [5:0] sub_wire3 = {sub_wire2, sub_wire2, sub_wire2, sub_wire2, sub_wire2, sub_wire4};
	wire  sub_wire5 = inclk0;
	wire [1:0] sub_wire6 = {sub_wire2, sub_wire5};
	wire [3:0] sub_wire7 = {sub_wire2, sub_wire2, sub_wire2, sub_wire2};
	altpll	altpll_component (
				.clkena (sub_wire3),
				.inclk (sub_wire6),
				.extclkena (sub_wire7),
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
				.clkbad (),
				.scandata (),
				.enable1 (),
				.scandataout (),
				.enable0 (),
				.scanwrite (),
				.locked (),
				.activeclock (),
				.scanread ()
				// synopsys translate_on
				);
	defparam
		altpll_component.bandwidth = 500000,
		altpll_component.bandwidth_type = "CUSTOM",
		altpll_component.clk0_divide_by = 1,
		altpll_component.clk0_duty_cycle = 50,
		altpll_component.clk0_multiply_by = 2,
		altpll_component.clk0_phase_shift = "0",
		altpll_component.compensate_clock = "CLK0",
		altpll_component.inclk0_input_frequency = 8000,
		altpll_component.intended_device_family = "Stratix GX",
		altpll_component.lpm_type = "altpll",
		altpll_component.operation_mode = "NORMAL",
		altpll_component.pll_type = "ENHANCED",
		altpll_component.spread_frequency = 0;
endmodule