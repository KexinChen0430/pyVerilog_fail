module ddr_out_1 ( clk, data_hi, data_lo, ddr );
	// synthesis attribute keep_hierarchy ddr_out_1 "true";
	input clk;
	input data_hi;
	input data_lo;
	output ddr;
	defparam d0.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d0 (
	.D1(data_hi),
	.D2(data_lo),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr));
endmodule