module  pll
	(
	address,
	areset,
	c0,
	clk,
	locked,
	phasedone,
	read,
	readdata,
	reset,
	write,
	writedata) /* synthesis synthesis_clearbox=1 */;
	input   [1:0]  address;
	input   areset;
	output   c0;
	input   clk;
	output   locked;
	output   phasedone;
	input   read;
	output   [31:0]  readdata;
	input   reset;
	input   write;
	input   [31:0]  writedata;
	wire  wire_stdsync2_dout;
	wire  [5:0]   wire_sd1_clk;
	wire  wire_sd1_locked;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=HIGH"} *)
	reg	pfdena_reg;
	wire	wire_pfdena_reg_ena;
	reg	prev_reset;
	wire  w_locked;
	wire  w_pfdena;
	wire  w_phasedone;
	wire  w_pll_areset_in;
	wire  w_reset;
	wire  w_select_control;
	wire  w_select_status;
	pll_stdsync_sv6   stdsync2
	(
	.clk(clk),
	.din(wire_sd1_locked),
	.dout(wire_stdsync2_dout),
	.reset_n((~ reset)));
	altpll   sd1
	(
	.activeclock(),
	.areset((w_pll_areset_in | areset)),
	.clk(wire_sd1_clk),
	.clkbad(),
	.clkloss(),
	.enable0(),
	.enable1(),
	.extclk(),
	.fbout(),
	.fref(),
	.icdrclk(),
	.inclk({{1{1'b0}}, clk}),
	.locked(wire_sd1_locked),
	.phasedone(),
	.scandataout(),
	.scandone(),
	.sclkout0(),
	.sclkout1(),
	.vcooverrange(),
	.vcounderrange()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clkena({6{1'b1}}),
	.clkswitch(1'b0),
	.configupdate(1'b0),
	.extclkena({4{1'b1}}),
	.fbin(1'b1),
	.pfdena(1'b1),
	.phasecounterselect({4{1'b1}}),
	.phasestep(1'b1),
	.phaseupdown(1'b1),
	.pllena(1'b1),
	.scanaclr(1'b0),
	.scanclk(1'b0),
	.scanclkena(1'b1),
	.scandata(1'b0),
	.scanread(1'b0),
	.scanwrite(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		sd1.clk0_divide_by = 2,
		sd1.clk0_duty_cycle = 50,
		sd1.clk0_multiply_by = 1,
		sd1.clk0_phase_shift = "0",
		sd1.compensate_clock = "CLK0",
		sd1.inclk0_input_frequency = 20000,
		sd1.operation_mode = "normal",
		sd1.port_clk0 = "PORT_USED",
		sd1.port_clk1 = "PORT_UNUSED",
		sd1.port_clk2 = "PORT_UNUSED",
		sd1.port_clk3 = "PORT_UNUSED",
		sd1.port_clk4 = "PORT_UNUSED",
		sd1.port_clk5 = "PORT_UNUSED",
		sd1.port_extclk0 = "PORT_UNUSED",
		sd1.port_extclk1 = "PORT_UNUSED",
		sd1.port_extclk2 = "PORT_UNUSED",
		sd1.port_extclk3 = "PORT_UNUSED",
		sd1.port_inclk1 = "PORT_UNUSED",
		sd1.port_phasecounterselect = "PORT_UNUSED",
		sd1.port_phasedone = "PORT_UNUSED",
		sd1.port_scandata = "PORT_UNUSED",
		sd1.port_scandataout = "PORT_UNUSED",
		sd1.intended_device_family = "Cyclone II",
		sd1.lpm_type = "altpll";
	// synopsys translate_off
	initial
		pfdena_reg = {1{1'b1}};
	// synopsys translate_on
	always @ ( posedge clk or  posedge reset)
		if (reset == 1'b1) pfdena_reg <= {1{1'b1}};
		else if  (wire_pfdena_reg_ena == 1'b1)   pfdena_reg <= writedata[1];
	assign
		wire_pfdena_reg_ena = (write & w_select_control);
	// synopsys translate_off
	initial
		prev_reset = 0;
	// synopsys translate_on
	always @ ( posedge clk or  posedge reset)
		if (reset == 1'b1) prev_reset <= 1'b0;
		else  prev_reset <= w_reset;
	assign
		c0 = wire_sd1_clk[0],
		locked = wire_sd1_locked,
		phasedone = 1'b0,
		readdata = {{30{1'b0}}, (read & ((w_select_control & w_pfdena) | (w_select_status & w_phasedone))), (read & ((w_select_control & w_pll_areset_in) | (w_select_status & w_locked)))},
		w_locked = wire_stdsync2_dout,
		w_pfdena = pfdena_reg,
		w_phasedone = 1'b1,
		w_pll_areset_in = prev_reset,
		w_reset = ((write & w_select_control) & writedata[0]),
		w_select_control = ((~ address[1]) & address[0]),
		w_select_status = ((~ address[1]) & (~ address[0]));
endmodule