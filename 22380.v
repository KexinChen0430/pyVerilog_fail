module ddr3_s4_amphy_phy_alt_mem_phy_pll (
	areset,
	inclk0,
	phasecounterselect,
	phasestep,
	phaseupdown,
	scanclk,
	c0,
	c1,
	c2,
	c3,
	c4,
	c5,
	c6,
	locked,
	phasedone);
	input	  areset;
	input	  inclk0;
	input	[3:0]  phasecounterselect;
	input	  phasestep;
	input	  phaseupdown;
	input	  scanclk;
	output	  c0;
	output	  c1;
	output	  c2;
	output	  c3;
	output	  c4;
	output	  c5;
	output	  c6;
	output	  locked;
	output	  phasedone;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  areset;
	tri0	[3:0]  phasecounterselect;
	tri0	  phasestep;
	tri0	  phaseupdown;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [9:0] sub_wire0;
	wire  sub_wire6;
	wire  sub_wire9;
	wire [0:0] sub_wire12 = 1'h0;
	wire [4:4] sub_wire8 = sub_wire0[4:4];
	wire [0:0] sub_wire7 = sub_wire0[0:0];
	wire [3:3] sub_wire5 = sub_wire0[3:3];
	wire [6:6] sub_wire4 = sub_wire0[6:6];
	wire [2:2] sub_wire3 = sub_wire0[2:2];
	wire [5:5] sub_wire2 = sub_wire0[5:5];
	wire [1:1] sub_wire1 = sub_wire0[1:1];
	wire  c1 = sub_wire1;
	wire  c5 = sub_wire2;
	wire  c2 = sub_wire3;
	wire  c6 = sub_wire4;
	wire  c3 = sub_wire5;
	wire  locked = sub_wire6;
	wire  c0 = sub_wire7;
	wire  c4 = sub_wire8;
	wire  phasedone = sub_wire9;
	wire  sub_wire10 = inclk0;
	wire [1:0] sub_wire11 = {sub_wire12, sub_wire10};
	altpll	altpll_component (
				.areset (areset),
				.inclk (sub_wire11),
				.phasecounterselect (phasecounterselect),
				.phasestep (phasestep),
				.scanclk (scanclk),
				.phaseupdown (phaseupdown),
				.clk (sub_wire0),
				.locked (sub_wire6),
				.phasedone (sub_wire9),
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
				.pllena (1'b1),
				.scanaclr (1'b0),
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
		altpll_component.clk0_divide_by = 2,
		altpll_component.clk0_duty_cycle = 50,
		altpll_component.clk0_multiply_by = 3,
		altpll_component.clk0_phase_shift = "556",
		altpll_component.clk1_divide_by = 1,
		altpll_component.clk1_duty_cycle = 50,
		altpll_component.clk1_multiply_by = 3,
		altpll_component.clk1_phase_shift = "0",
		altpll_component.clk2_divide_by = 1,
		altpll_component.clk2_duty_cycle = 50,
		altpll_component.clk2_multiply_by = 3,
		altpll_component.clk2_phase_shift = "556",
		altpll_component.clk3_divide_by = 1,
		altpll_component.clk3_duty_cycle = 50,
		altpll_component.clk3_multiply_by = 3,
		altpll_component.clk3_phase_shift = "-833",
		altpll_component.clk4_divide_by = 1,
		altpll_component.clk4_duty_cycle = 50,
		altpll_component.clk4_multiply_by = 3,
		altpll_component.clk4_phase_shift = "0",
		altpll_component.clk5_divide_by = 2,
		altpll_component.clk5_duty_cycle = 50,
		altpll_component.clk5_multiply_by = 3,
		altpll_component.clk5_phase_shift = "0",
		altpll_component.clk6_divide_by = 2,
		altpll_component.clk6_duty_cycle = 50,
		altpll_component.clk6_multiply_by = 3,
		altpll_component.clk6_phase_shift = "4444",
		altpll_component.inclk0_input_frequency = 10000,
		altpll_component.intended_device_family = "Stratix IV",
		altpll_component.lpm_type = "altpll",
		altpll_component.operation_mode = "NO_COMPENSATION",
		altpll_component.pll_type = "AUTO",
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
		altpll_component.port_phasecounterselect = "PORT_USED",
		altpll_component.port_phasedone = "PORT_USED",
		altpll_component.port_phasestep = "PORT_USED",
		altpll_component.port_phaseupdown = "PORT_USED",
		altpll_component.port_pllena = "PORT_UNUSED",
		altpll_component.port_scanaclr = "PORT_UNUSED",
		altpll_component.port_scanclk = "PORT_USED",
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
		altpll_component.vco_frequency_control = "MANUAL_PHASE",
		altpll_component.vco_phase_shift_step = 83,
		altpll_component.width_clock = 10;
endmodule