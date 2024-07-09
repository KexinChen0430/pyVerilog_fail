module pll_hdmi (
	areset,
	configupdate,
	inclk0,
	scanclk,
	scanclkena,
	scandata,
	c0,
	c1,
	locked,
	scandataout,
	scandone);
	input	  areset;
	input	  configupdate;
	input	  inclk0;
	input	  scanclk;
	input	  scanclkena;
	input	  scandata;
	output	  c0;
	output	  c1;
	output	  locked;
	output	  scandataout;
	output	  scandone;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  areset;
	tri0	  configupdate;
	tri0	  scanclkena;
	tri0	  scandata;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [0:0] sub_wire2 = 1'h0;
	wire [4:0] sub_wire3;
	wire  sub_wire6;
	wire  sub_wire7;
	wire  sub_wire8;
	wire  sub_wire0 = inclk0;
	wire [1:0] sub_wire1 = {sub_wire2, sub_wire0};
	wire [1:1] sub_wire5 = sub_wire3[1:1];
	wire [0:0] sub_wire4 = sub_wire3[0:0];
	wire  c0 = sub_wire4;
	wire  c1 = sub_wire5;
	wire  locked = sub_wire6;
	wire  scandataout = sub_wire7;
	wire  scandone = sub_wire8;
	altpll	altpll_component (
				.areset (areset),
				.configupdate (configupdate),
				.inclk (sub_wire1),
				.scanclk (scanclk),
				.scanclkena (scanclkena),
				.scandata (scandata),
				.clk (sub_wire3),
				.locked (sub_wire6),
				.scandataout (sub_wire7),
				.scandone (sub_wire8),
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
				.scanread (1'b0),
				.scanwrite (1'b0),
				.sclkout0 (),
				.sclkout1 (),
				.vcooverrange (),
				.vcounderrange ());
	defparam
		altpll_component.bandwidth_type = "AUTO",
		altpll_component.clk0_divide_by = 1,
		altpll_component.clk0_duty_cycle = 50,
		altpll_component.clk0_multiply_by = 2,
		altpll_component.clk0_phase_shift = "0",
		altpll_component.clk1_divide_by = 1,
		altpll_component.clk1_duty_cycle = 50,
		altpll_component.clk1_multiply_by = 2,
		altpll_component.clk1_phase_shift = "0",
		altpll_component.inclk0_input_frequency = 13468,
		altpll_component.intended_device_family = "Cyclone 10 LP",
		altpll_component.lpm_hint = "CBX_MODULE_PREFIX=pll_hdmi",
		altpll_component.lpm_type = "altpll",
		altpll_component.operation_mode = "NO_COMPENSATION",
		altpll_component.pll_type = "AUTO",
		altpll_component.port_activeclock = "PORT_UNUSED",
		altpll_component.port_areset = "PORT_USED",
		altpll_component.port_clkbad0 = "PORT_UNUSED",
		altpll_component.port_clkbad1 = "PORT_UNUSED",
		altpll_component.port_clkloss = "PORT_UNUSED",
		altpll_component.port_clkswitch = "PORT_UNUSED",
		altpll_component.port_configupdate = "PORT_USED",
		altpll_component.port_fbin = "PORT_UNUSED",
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
		altpll_component.port_scanclk = "PORT_USED",
		altpll_component.port_scanclkena = "PORT_USED",
		altpll_component.port_scandata = "PORT_USED",
		altpll_component.port_scandataout = "PORT_USED",
		altpll_component.port_scandone = "PORT_USED",
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
		altpll_component.port_extclk0 = "PORT_UNUSED",
		altpll_component.port_extclk1 = "PORT_UNUSED",
		altpll_component.port_extclk2 = "PORT_UNUSED",
		altpll_component.port_extclk3 = "PORT_UNUSED",
		altpll_component.self_reset_on_loss_lock = "OFF",
		altpll_component.width_clock = 5,
		altpll_component.scan_chain_mif_file = "pll_hdmi/config/148.5_MHz.mif";
endmodule