module  nios_mem_if_ddr2_emif_0_p0_clock_pair_generator
	(
	datain,
	dataout,
	dataout_b) /* synthesis synthesis_clearbox=1 */;
	input   [0:0]  datain;
	output   [0:0]  dataout;
	output   [0:0]  dataout_b;
	wire  [0:0]   wire_obuf_ba_o;
	wire  [0:0]   wire_obuf_ba_oe;
	wire  [0:0]   wire_obufa_o;
	wire  [0:0]   wire_obufa_oe;
	wire  [0:0]   wire_pseudo_diffa_o;
	wire  [0:0]   wire_pseudo_diffa_obar;
	wire  [0:0]   wire_pseudo_diffa_oebout;
	wire  [0:0]   wire_pseudo_diffa_oein;
	wire  [0:0]   wire_pseudo_diffa_oeout;
	wire  [0:0]  oe_w;
	cyclonev_io_obuf   obuf_ba_0
	(
	.i(wire_pseudo_diffa_obar),
	.o(wire_obuf_ba_o[0:0]),
	.obar(),
	.oe(wire_obuf_ba_oe[0:0])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.parallelterminationcontrol({16{1'b0}}),
	.seriesterminationcontrol({16{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devoe(1'b1)
	// synopsys translate_on
	);
	defparam
		obuf_ba_0.bus_hold = "false",
		obuf_ba_0.open_drain_output = "false",
		obuf_ba_0.lpm_type = "cyclonev_io_obuf";
	assign
		wire_obuf_ba_oe = {(~ wire_pseudo_diffa_oebout[0])};
	cyclonev_io_obuf   obufa_0
	(
	.i(wire_pseudo_diffa_o),
	.o(wire_obufa_o[0:0]),
	.obar(),
	.oe(wire_obufa_oe[0:0])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.parallelterminationcontrol({16{1'b0}}),
	.seriesterminationcontrol({16{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devoe(1'b1)
	// synopsys translate_on
	);
	defparam
		obufa_0.bus_hold = "false",
		obufa_0.open_drain_output = "false",
		obufa_0.lpm_type = "cyclonev_io_obuf";
	assign
		wire_obufa_oe = {(~ wire_pseudo_diffa_oeout[0])};
	cyclonev_pseudo_diff_out   pseudo_diffa_0
	(
	.dtc(),
	.dtcbar(),
	.i(datain),
	.o(wire_pseudo_diffa_o[0:0]),
	.obar(wire_pseudo_diffa_obar[0:0]),
	.oebout(wire_pseudo_diffa_oebout[0:0]),
	.oein(wire_pseudo_diffa_oein[0:0]),
	.oeout(wire_pseudo_diffa_oeout[0:0])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dtcin(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	assign
		wire_pseudo_diffa_oein = {(~ oe_w[0])};
	assign
		dataout = wire_obufa_o,
		dataout_b = wire_obuf_ba_o,
		oe_w = 1'b1;
endmodule