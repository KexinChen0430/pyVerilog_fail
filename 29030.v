module  ddr3_s4_uniphy_example_sim_ddr3_s4_uniphy_example_sim_e0_if0_p0_oct_control
	(
	parallelterminationcontrol,
	rdn,
	rup,
	seriesterminationcontrol) /* synthesis synthesis_clearbox=1 */;
	output   [13:0]  parallelterminationcontrol;
	input   [0:0]  rdn;
	input   [0:0]  rup;
	output   [13:0]  seriesterminationcontrol;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [0:0]  rdn;
	tri0   [0:0]  rup;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  [0:0]   wire_sd1a_serializerenableout;
	wire  [0:0]   wire_sd1a_terminationcontrol;
	wire  [13:0]   wire_sd2a_parallelterminationcontrol;
	wire  [13:0]   wire_sd2a_seriesterminationcontrol;
	stratixiv_termination   sd1a_0
	(
	.incrdn(),
	.incrup(),
	.rdn(rdn),
	.rup(rup),
	.scanout(),
	.serializerenableout(wire_sd1a_serializerenableout[0:0]),
	.shiftregisterprobe(),
	.terminationcontrol(wire_sd1a_terminationcontrol[0:0]),
	.terminationcontrolprobe()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.otherserializerenable({9{1'b0}}),
	.scanen(1'b0),
	.serializerenable(1'b0),
	.terminationclear(1'b0),
	.terminationclock(1'b0),
	.terminationcontrolin(1'b0),
	.terminationenable(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	stratixiv_termination_logic   sd2a_0
	(
	.parallelterminationcontrol(wire_sd2a_parallelterminationcontrol[13:0]),
	.serialloadenable(wire_sd1a_serializerenableout),
	.seriesterminationcontrol(wire_sd2a_seriesterminationcontrol[13:0]),
	.terminationdata(wire_sd1a_terminationcontrol)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.parallelloadenable(1'b0),
	.terminationclock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	assign
		parallelterminationcontrol = wire_sd2a_parallelterminationcontrol,
		seriesterminationcontrol = wire_sd2a_seriesterminationcontrol;
endmodule