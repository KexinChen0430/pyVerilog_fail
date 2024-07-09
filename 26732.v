module  complex_mult_altmult_complex_ifp
	(
	aclr,
	clock,
	dataa_imag,
	dataa_real,
	datab_imag,
	datab_real,
	result_imag,
	result_real) ;
	input   aclr;
	input   clock;
	input   [31:0]  dataa_imag;
	input   [31:0]  dataa_real;
	input   [9:0]  datab_imag;
	input   [9:0]  datab_real;
	output   [41:0]  result_imag;
	output   [41:0]  result_real;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  [41:0]   wire_mult_add1_result;
	wire  [41:0]   wire_mult_add2_result;
	wire ena;
	wire  [63:0]  mult_add1_inputa;
	wire  [19:0]  mult_add1_inputb;
	wire  [19:0]  mult_add2_inputb;
	complex_mult_mult_add_frt1   mult_add1
	(
	.aclr0(aclr),
	.clock0(clock),
	.dataa(mult_add1_inputa),
	.datab(mult_add1_inputb),
	.ena0(ena),
	.result(wire_mult_add1_result));
	complex_mult_mult_add_eqt1   mult_add2
	(
	.aclr0(aclr),
	.clock0(clock),
	.dataa(mult_add1_inputa),
	.datab(mult_add2_inputb),
	.ena0(ena),
	.result(wire_mult_add2_result));
	assign
		ena = 1'b1,
		mult_add1_inputa = {dataa_imag[31:0], dataa_real[31:0]},
		mult_add1_inputb = {datab_imag[9:0], datab_real[9:0]},
		mult_add2_inputb = {datab_real[9:0], datab_imag[9:0]},
		result_imag = wire_mult_add2_result,
		result_real = wire_mult_add1_result;
endmodule