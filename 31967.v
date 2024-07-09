module  altera_mem_if_ddr3_phy_0001_clock_pair_generator
	(
	datain,
	dataout,
	dataout_b) /* synthesis synthesis_clearbox=1 */;
	input   [0:0]  datain;
	output   [0:0]  dataout;
	output   [0:0]  dataout_b;
	wire  [0:0]   wire_obuf_ba_o;
	wire  [0:0]   wire_obufa_o;
	wire  [0:0]   wire_pseudo_diffa_o;
	wire  [0:0]   wire_pseudo_diffa_obar;
	wire [0:0]  oe_b;
	wire  [0:0]  oe_w;
	stratixiv_io_obuf   obuf_ba_0
	(
	.i(wire_pseudo_diffa_obar),
	.o(wire_obuf_ba_o[0:0]),
	.obar(),
	.oe(oe_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.parallelterminationcontrol({14{1'b0}}),
	.seriesterminationcontrol({14{1'b0}})
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
		obuf_ba_0.lpm_type = "stratixiv_io_obuf";
	stratixiv_io_obuf   obufa_0
	(
	.i(wire_pseudo_diffa_o),
	.o(wire_obufa_o[0:0]),
	.obar(),
	.oe(oe_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.parallelterminationcontrol({14{1'b0}}),
	.seriesterminationcontrol({14{1'b0}})
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
		obufa_0.shift_series_termination_control = "false",
		obufa_0.lpm_type = "stratixiv_io_obuf";
	stratixiv_pseudo_diff_out   pseudo_diffa_0
	(
	.i(datain),
	.o(wire_pseudo_diffa_o[0:0]),
	.obar(wire_pseudo_diffa_obar[0:0]));
	assign
		dataout = wire_obufa_o,
		dataout_b = wire_obuf_ba_o,
		oe_b = 1'b1,
		oe_w = 1'b1;
endmodule