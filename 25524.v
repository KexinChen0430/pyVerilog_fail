module pix_pll0 (
	areset,
	inclk0,
	c0,
	c1,
	c2,
	c3,
	c4,
	c5,
	c6,
	locked);
	input	  areset;
	input	  inclk0;
	output	  c0;
	output	  c1;
	output	  c2;
	output	  c3;
	output	  c4;
	output	  c5;
	output	  c6;
	output	  locked;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  areset;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [6:0] sub_wire0;
	wire  sub_wire8;
	wire [0:0] sub_wire11 = 1'h0;
	wire [3:3] sub_wire7 = sub_wire0[3:3];
	wire [6:6] sub_wire6 = sub_wire0[6:6];
	wire [4:4] sub_wire5 = sub_wire0[4:4];
	wire [2:2] sub_wire4 = sub_wire0[2:2];
	wire [0:0] sub_wire3 = sub_wire0[0:0];
	wire [5:5] sub_wire2 = sub_wire0[5:5];
	wire [1:1] sub_wire1 = sub_wire0[1:1];
	wire  c1 = sub_wire1;
	wire  c5 = sub_wire2;
	wire  c0 = sub_wire3;
	wire  c2 = sub_wire4;
	wire  c4 = sub_wire5;
	wire  c6 = sub_wire6;
	wire  c3 = sub_wire7;
	wire  locked = sub_wire8;
	wire  sub_wire9 = inclk0;
	wire [1:0] sub_wire10 = {sub_wire11, sub_wire9};
	altpll	altpll_component (
				.areset (areset),
				.inclk (sub_wire10),
				.clk (sub_wire0),
				.locked (sub_wire8),
				.activeclock (),
				.clkbad (),
				.clkena ({6{1'b1}}),
				.clkloss (),
				.clkswitch (1'b0),
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
		altpll_component.bandwidth_type = "AUTO",
		altpll_component.clk0_divide_by = 68,
		altpll_component.clk0_duty_cycle = 50,
		altpll_component.clk0_multiply_by = 69,
		altpll_component.clk0_phase_shift = "0",
		altpll_component.clk1_divide_by = 8,
		altpll_component.clk1_duty_cycle = 50,
		altpll_component.clk1_multiply_by = 9,
		altpll_component.clk1_phase_shift = "0",
		altpll_component.clk2_divide_by = 164,
		altpll_component.clk2_duty_cycle = 50,
		altpll_component.clk2_multiply_by = 207,
		altpll_component.clk2_phase_shift = "0",
		altpll_component.clk3_divide_by = 104,
		altpll_component.clk3_duty_cycle = 50,
		altpll_component.clk3_multiply_by = 207,
		altpll_component.clk3_phase_shift = "0",
		altpll_component.clk4_divide_by = 68,
		altpll_component.clk4_duty_cycle = 50,
		altpll_component.clk4_multiply_by = 207,
		altpll_component.clk4_phase_shift = "0",
		altpll_component.clk5_divide_by = 35,
		altpll_component.clk5_duty_cycle = 50,
		altpll_component.clk5_multiply_by = 151,
		altpll_component.clk5_phase_shift = "0",
		altpll_component.clk6_divide_by = 40,
		altpll_component.clk6_duty_cycle = 50,
		altpll_component.clk6_multiply_by = 259,
		altpll_component.clk6_phase_shift = "0",
		altpll_component.compensate_clock = "CLK0",
		altpll_component.inclk0_input_frequency = 40000,
		altpll_component.intended_device_family = "Arria II GX",
		altpll_component.lpm_hint = "CBX_MODULE_PREFIX=pix_pll0",
		altpll_component.lpm_type = "altpll",
		altpll_component.operation_mode = "NORMAL",
		altpll_component.pll_type = "Left_Right",
		altpll_component.port_activeclock = "PORT_UNUSED",
		altpll_component.port_areset = "PORT_USED",
		altpll_component.port_clkbad0 = "PORT_UNUSED",
		altpll_component.port_clkbad1 = "PORT_UNUSED",
		altpll_component.port_clkloss = "PORT_UNUSED",
		altpll_component.port_clkswitch = "PORT_UNUSED",
		altpll_component.port_configupdate = "PORT_UNUSED",
		altpll_component.port_fbin = "PORT_UNUSED",
		altpll_component.port_fbout = "PORT_UNUSED",
		altpll_component.port_inclk0 = "PORT_USED",
		altpll_component.port_inclk1 = "PORT_UNUSED",
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
		altpll_component.port_clk1 = "PORT_USED",
		altpll_component.port_clk2 = "PORT_USED",
		altpll_component.port_clk3 = "PORT_USED",
		altpll_component.port_clk4 = "PORT_USED",
		altpll_component.port_clk5 = "PORT_USED",
		altpll_component.port_clk6 = "PORT_USED",
		altpll_component.port_clk7 = "PORT_UNUSED",
		altpll_component.port_clk8 = "PORT_UNUSED",
		altpll_component.port_clk9 = "PORT_UNUSED",
		altpll_component.port_clkena0 = "PORT_UNUSED",
		altpll_component.port_clkena1 = "PORT_UNUSED",
		altpll_component.port_clkena2 = "PORT_UNUSED",
		altpll_component.port_clkena3 = "PORT_UNUSED",
		altpll_component.port_clkena4 = "PORT_UNUSED",
		altpll_component.port_clkena5 = "PORT_UNUSED",
		altpll_component.self_reset_on_loss_lock = "OFF",
		altpll_component.using_fbmimicbidir_port = "OFF",
		altpll_component.width_clock = 7;
endmodule