module  Raster_Laser_Projector_Clock_Generators
	(
	address,
	areset,
	c0,
	c1,
	c2,
	clk,
	configupdate,
	locked,
	phasecounterselect,
	phasedone,
	phasestep,
	phaseupdown,
	read,
	readdata,
	reset,
	scanclk,
	scanclkena,
	scandata,
	scandataout,
	scandone,
	write,
	writedata) /* synthesis synthesis_clearbox=1 */;
	input   [1:0]  address;
	input   areset;
	output   c0;
	output   c1;
	output   c2;
	input   clk;
	input   configupdate;
	output   locked;
	input   [3:0]  phasecounterselect;
	output   phasedone;
	input   phasestep;
	input   phaseupdown;
	input   read;
	output   [31:0]  readdata;
	input   reset;
	input   scanclk;
	input   scanclkena;
	input   scandata;
	output   scandataout;
	output   scandone;
	input   write;
	input   [31:0]  writedata;
	wire  wire_stdsync2_dout;
	wire  [4:0]   wire_sd1_clk;
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
	Raster_Laser_Projector_Clock_Generators_stdsync_sv6   stdsync2
	(
	.clk(clk),
	.din(wire_sd1_locked),
	.dout(wire_stdsync2_dout),
	.reset_n((~ reset)));
	Raster_Laser_Projector_Clock_Generators_altpll_udh2   sd1
	(
	.areset((w_pll_areset_in | areset)),
	.clk(wire_sd1_clk),
	.inclk({{1{1'b0}}, clk}),
	.locked(wire_sd1_locked));
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
		c1 = wire_sd1_clk[1],
		c2 = wire_sd1_clk[2],
		locked = wire_sd1_locked,
		phasedone = 1'b0,
		readdata = {{30{1'b0}}, (read & ((w_select_control & w_pfdena) | (w_select_status & w_phasedone))), (read & ((w_select_control & w_pll_areset_in) | (w_select_status & w_locked)))},
		scandataout = 1'b0,
		scandone = 1'b0,
		w_locked = wire_stdsync2_dout,
		w_pfdena = pfdena_reg,
		w_phasedone = 1'b1,
		w_pll_areset_in = prev_reset,
		w_reset = ((write & w_select_control) & writedata[0]),
		w_select_control = ((~ address[1]) & address[0]),
		w_select_status = ((~ address[1]) & (~ address[0]));
endmodule