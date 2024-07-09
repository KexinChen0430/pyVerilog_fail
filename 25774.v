module  in_buf_iobuf_in_v0i
	(
	datain,
	dataout) ;
	input   [0:0]  datain;
	output   [0:0]  dataout;
	wire  [0:0]   wire_ibufa_o;
	cyclonev_io_ibuf   ibufa_0
	(
	.i(datain),
	.o(wire_ibufa_o[0:0])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_0.bus_hold = "false",
		ibufa_0.differential_mode = "false",
		ibufa_0.lpm_type = "cyclonev_io_ibuf";
	assign
		dataout = wire_ibufa_o;
endmodule