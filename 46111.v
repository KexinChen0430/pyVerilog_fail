module spll_pll (
	areset,
	inclk0,
	pllena,
	c0,
	c1,
	locked);
	input	  areset;
	input	  inclk0;
	input	  pllena;
	output	  c0;
	output	  c1;
	output	  locked;
	wire [5:0] sub_wire0;
	wire  sub_wire3;
	wire [0:0] sub_wire6 = 1'h0;
	wire [1:1] sub_wire2 = sub_wire0[1:1];
	wire [0:0] sub_wire1 = sub_wire0[0:0];
	wire  c0 = sub_wire1;
	wire  c1 = sub_wire2;
	wire  locked = sub_wire3;
	wire  sub_wire4 = inclk0;
	wire [1:0] sub_wire5 = {sub_wire6, sub_wire4};
	altpll	altpll_component (
				.inclk (sub_wire5),
				.pllena (pllena),
				.areset (areset),
				.clk (sub_wire0),
				.locked (sub_wire3),
				.activeclock (),
				.clkbad (),
				.clkena ({6{1'b1}}),
				.clkloss (),
				.clkswitch (1'b0),
				.enable0 (),
				.enable1 (),
				.extclk (),
				.extclkena ({4{1'b1}}),
				.fbin (1'b1),
				.pfdena (1'b1),
				.scanaclr (1'b0),
				.scanclk (1'b0),
				.scandata (1'b0),
				.scandataout (),
				.scandone (),
				.scanread (1'b0),
				.scanwrite (1'b0),
				.sclkout0 (),
				.sclkout1 ());
	defparam
		altpll_component.clk0_divide_by = 1,
		altpll_component.clk0_duty_cycle = 50,
		altpll_component.clk0_multiply_by = 1,
		altpll_component.clk0_phase_shift = "0",
		altpll_component.clk1_divide_by = 1,
		altpll_component.clk1_duty_cycle = 50,
		altpll_component.clk1_multiply_by = 1,
		altpll_component.clk1_phase_shift = "-2174",
		altpll_component.compensate_clock = "CLK0",
		altpll_component.gate_lock_signal = "NO",
		altpll_component.inclk0_input_frequency = 8695,
		altpll_component.intended_device_family = "Cyclone II",
		altpll_component.invalid_lock_multiplier = 5,
		altpll_component.lpm_type = "altpll",
		altpll_component.operation_mode = "NORMAL",
		altpll_component.pll_type = "FAST",
		altpll_component.port_activeclock = "PORT_UNUSED",
		altpll_component.port_areset = "PORT_USED",
		altpll_component.port_clkbad0 = "PORT_UNUSED",
		altpll_component.port_clkbad1 = "PORT_UNUSED",
		altpll_component.port_clkloss = "PORT_UNUSED",
		altpll_component.port_clkswitch = "PORT_UNUSED",
		altpll_component.port_fbin = "PORT_UNUSED",
		altpll_component.port_inclk0 = "PORT_USED",
		altpll_component.port_inclk1 = "PORT_UNUSED",
		altpll_component.port_locked = "PORT_USED",
		altpll_component.port_pfdena = "PORT_UNUSED",
		altpll_component.port_pllena = "PORT_USED",
		altpll_component.port_scanaclr = "PORT_UNUSED",
		altpll_component.port_scanclk = "PORT_UNUSED",
		altpll_component.port_scandata = "PORT_UNUSED",
		altpll_component.port_scandataout = "PORT_UNUSED",
		altpll_component.port_scandone = "PORT_UNUSED",
		altpll_component.port_scanread = "PORT_UNUSED",
		altpll_component.port_scanwrite = "PORT_UNUSED",
		altpll_component.port_clk0 = "PORT_USED",
		altpll_component.port_clk1 = "PORT_USED",
		altpll_component.port_clk2 = "PORT_UNUSED",
		altpll_component.port_clk3 = "PORT_UNUSED",
		altpll_component.port_clk4 = "PORT_UNUSED",
		altpll_component.port_clk5 = "PORT_UNUSED",
		altpll_component.port_clkena0 = "PORT_UNUSED",
		altpll_component.port_clkena1 = "PORT_UNUSED",
		altpll_component.port_clkena2 = "PORT_UNUSED",
		altpll_component.port_clkena3 = "PORT_UNUSED",
		altpll_component.port_clkena4 = "PORT_UNUSED",
		altpll_component.port_clkena5 = "PORT_UNUSED",
		altpll_component.port_enable0 = "PORT_UNUSED",
		altpll_component.port_enable1 = "PORT_UNUSED",
		altpll_component.port_extclk0 = "PORT_UNUSED",
		altpll_component.port_extclk1 = "PORT_UNUSED",
		altpll_component.port_extclk2 = "PORT_UNUSED",
		altpll_component.port_extclk3 = "PORT_UNUSED",
		altpll_component.port_extclkena0 = "PORT_UNUSED",
		altpll_component.port_extclkena1 = "PORT_UNUSED",
		altpll_component.port_extclkena2 = "PORT_UNUSED",
		altpll_component.port_extclkena3 = "PORT_UNUSED",
		altpll_component.port_sclkout0 = "PORT_UNUSED",
		altpll_component.port_sclkout1 = "PORT_UNUSED",
		altpll_component.valid_lock_multiplier = 1;
endmodule