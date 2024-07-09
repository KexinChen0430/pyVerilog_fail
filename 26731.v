module  complex_mult_mult_add_eqt1
	(
	aclr0,
	clock0,
	dataa,
	datab,
	ena0,
	result) ;
	input   aclr0;
	input   clock0;
	input   [63:0]  dataa;
	input   [19:0]  datab;
	input   ena0;
	output   [41:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr0;
	tri1   clock0;
	tri0   [63:0]  dataa;
	tri0   [19:0]  datab;
	tri1   ena0;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  [41:0]   wire_altera_mult_add3_result;
	wire ena1;
	wire ena2;
	wire ena3;
	complex_mult_altera_mult_add_5e4g   altera_mult_add3
	(
	.aclr0(aclr0),
	.clock0(clock0),
	.dataa(dataa),
	.datab(datab),
	.ena0(ena0),
	.ena1(ena1),
	.ena2(ena2),
	.ena3(ena3),
	.result(wire_altera_mult_add3_result));
	assign
		ena1 = 1'b1,
		ena2 = 1'b1,
		ena3 = 1'b1,
		result = wire_altera_mult_add3_result;
endmodule