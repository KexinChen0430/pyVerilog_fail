module altpll2 (
	areset,
	clkswitch,
	inclk0,
	inclk1,
	activeclock,
	c0,
	clkbad0,
	clkbad1,
	locked);
	input	  areset;
	input	  clkswitch;
	input	  inclk0;
	input	  inclk1;
	output	  activeclock;
	output	  c0;
	output	  clkbad0;
	output	  clkbad1;
	output	  locked;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  areset;
	tri0	  clkswitch;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  sub_wire0;
	wire [4:0] sub_wire1;
	wire [1:0] sub_wire3;
	wire  sub_wire6;
	wire  sub_wire9 = inclk1;
	wire  activeclock = sub_wire0;
	wire [0:0] sub_wire2 = sub_wire1[0:0];
	wire  c0 = sub_wire2;
	wire [1:1] sub_wire5 = sub_wire3[1:1];
	wire [0:0] sub_wire4 = sub_wire3[0:0];
	wire  clkbad0 = sub_wire4;
	wire  clkbad1 = sub_wire5;
	wire  locked = sub_wire6;
	wire  sub_wire7 = inclk0;
	wire [1:0] sub_wire8 = {sub_wire9, sub_wire7};
	altpll	altpll_component (
				.areset (areset),
				.clkswitch (clkswitch),
				.inclk (sub_wire8),
				.activeclock (sub_wire0),
				.clk (sub_wire1),
				.clkbad (sub_wire3),
				.locked (sub_wire6),
				.clkena ({6{1'b1}}),
				.clkloss (),
				.configupdate (1'b0),
				.enable0 (),
				.enable1 (),
				.extclk (),
				.extclkena ({4{1'b1}}),
				.fbin (1'b1),
				.fbmimicbidir (),
				.fbout (),
				.fref (),
				.icdrclk (),
				.pfdena (1'b1),
				.phasecounterselect ({4{1'b1}}),
				.phasedone (),
				.phasestep (1'b1),
				.phaseupdown (1'b1),
				.pllena (1'b1),
				.scanaclr (1'b0),
				.scanclk (1'b0),
				.scanclkena (1'b1),
				.scandata (1'b0),
				.scandataout (),
				.scandone (),
				.scanread (1'b0),
				.scanwrite (1'b0),
				.sclkout0 (),
				.sclkout1 (),
				.vcooverrange (),
				.vcounderrange ());
	defparam
		altpll_component.bandwidth_type = "HIGH",
		altpll_component.clk0_divide_by = 1,
		altpll_component.clk0_duty_cycle = 50,
		altpll_component.clk0_multiply_by = 2,
		altpll_component.clk0_phase_shift = "0",
		altpll_component.compensate_clock = "CLK0",
		altpll_component.inclk0_input_frequency = 25000,
		altpll_component.inclk1_input_frequency = 25000,
		altpll_component.intended_device_family = "Cyclone III",
		altpll_component.lpm_hint = "CBX_MODULE_PREFIX=altpll2",
		altpll_component.lpm_type = "altpll",
		altpll_component.operation_mode = "NORMAL",
		altpll_component.pll_type = "AUTO",
		altpll_component.port_activeclock = "PORT_USED",
		altpll_component.port_areset = "PORT_USED",
		altpll_component.port_clkbad0 = "PORT_USED",
		altpll_component.port_clkbad1 = "PORT_USED",
		altpll_component.port_clkloss = "PORT_UNUSED",
		altpll_component.port_clkswitch = "PORT_USED",
		altpll_component.port_configupdate = "PORT_UNUSED",
		altpll_component.port_fbin = "PORT_UNUSED",
		altpll_component.port_inclk0 = "PORT_USED",
		altpll_component.port_inclk1 = "PORT_USED",
		altpll_component.port_locked = "PORT_USED",
		altpll_component.port_pfdena = "PORT_UNUSED",
		altpll_component.port_phasecounterselect = "PORT_UNUSED",
		altpll_component.port_phasedone = "PORT_UNUSED",
		altpll_component.port_phasestep = "PORT_UNUSED",
		altpll_component.port_phaseupdown = "PORT_UNUSED",
		altpll_component.port_pllena = "PORT_UNUSED",
		altpll_component.port_scanaclr = "PORT_UNUSED",
		altpll_component.port_scanclk = "PORT_UNUSED",
		altpll_component.port_scanclkena = "PORT_UNUSED",
		altpll_component.port_scandata = "PORT_UNUSED",
		altpll_component.port_scandataout = "PORT_UNUSED",
		altpll_component.port_scandone = "PORT_UNUSED",
		altpll_component.port_scanread = "PORT_UNUSED",
		altpll_component.port_scanwrite = "PORT_UNUSED",
		altpll_component.port_clk0 = "PORT_USED",
		altpll_component.port_clk1 = "PORT_UNUSED",
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
		altpll_component.port_extclk0 = "PORT_UNUSED",
		altpll_component.port_extclk1 = "PORT_UNUSED",
		altpll_component.port_extclk2 = "PORT_UNUSED",
		altpll_component.port_extclk3 = "PORT_UNUSED",
		altpll_component.primary_clock = "inclk0",
		altpll_component.self_reset_on_loss_lock = "OFF",
		altpll_component.switch_over_type = "MANUAL",
		altpll_component.width_clock = 5;
endmodule