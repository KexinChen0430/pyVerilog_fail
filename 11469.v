module  fp_divide_altfp_div_b6h
	(
	clock,
	dataa,
	datab,
	result) ;
	input   clock;
	input   [31:0]  dataa;
	input   [31:0]  datab;
	output   [31:0]  result;
	wire  [31:0]   wire_altfp_div_pst1_result;
	wire aclr;
	wire clk_en;
	fp_divide_altfp_div_pst_8qe   altfp_div_pst1
	(
	.aclr(aclr),
	.clk_en(clk_en),
	.clock(clock),
	.dataa(dataa),
	.datab(datab),
	.result(wire_altfp_div_pst1_result));
	assign
		aclr = 1'b0,
		clk_en = 1'b1,
		result = wire_altfp_div_pst1_result;
endmodule