module ddr_out_32 ( clk, data_hi, data_lo, ddr );
	// synthesis attribute keep_hierarchy ddr_out_32 "true";
	input clk;
	input [31:0] data_hi;
	input [31:0] data_lo;
	output [31:0] ddr;
	defparam d0.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d0 (
	.D1(data_hi[0]),
	.D2(data_lo[0]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[0]));
	defparam d1.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d1 (
	.D1(data_hi[1]),
	.D2(data_lo[1]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[1]));
	defparam d2.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d2 (
	.D1(data_hi[2]),
	.D2(data_lo[2]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[2]));
	defparam d3.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d3 (
	.D1(data_hi[3]),
	.D2(data_lo[3]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[3]));
	defparam d4.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d4 (
	.D1(data_hi[4]),
	.D2(data_lo[4]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[4]));
	defparam d5.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d5 (
	.D1(data_hi[5]),
	.D2(data_lo[5]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[5]));
	defparam d6.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d6 (
	.D1(data_hi[6]),
	.D2(data_lo[6]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[6]));
	defparam d7.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d7 (
	.D1(data_hi[7]),
	.D2(data_lo[7]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[7]));
	defparam d8.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d8 (
	.D1(data_hi[8]),
	.D2(data_lo[8]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[8]));
	defparam d9.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d9 (
	.D1(data_hi[9]),
	.D2(data_lo[9]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[9]));
	defparam d10.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d10 (
	.D1(data_hi[10]),
	.D2(data_lo[10]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[10]));
	defparam d11.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d11 (
	.D1(data_hi[11]),
	.D2(data_lo[11]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[11]));
	defparam d12.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d12 (
	.D1(data_hi[12]),
	.D2(data_lo[12]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[12]));
	defparam d13.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d13 (
	.D1(data_hi[13]),
	.D2(data_lo[13]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[13]));
	defparam d14.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d14 (
	.D1(data_hi[14]),
	.D2(data_lo[14]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[14]));
	defparam d15.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d15 (
	.D1(data_hi[15]),
	.D2(data_lo[15]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[15]));
	defparam d16.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d16 (
	.D1(data_hi[16]),
	.D2(data_lo[16]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[16]));
	defparam d17.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d17 (
	.D1(data_hi[17]),
	.D2(data_lo[17]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[17]));
	defparam d18.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d18 (
	.D1(data_hi[18]),
	.D2(data_lo[18]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[18]));
	defparam d19.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d19 (
	.D1(data_hi[19]),
	.D2(data_lo[19]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[19]));
	defparam d20.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d20 (
	.D1(data_hi[20]),
	.D2(data_lo[20]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[20]));
	defparam d21.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d21 (
	.D1(data_hi[21]),
	.D2(data_lo[21]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[21]));
	defparam d22.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d22 (
	.D1(data_hi[22]),
	.D2(data_lo[22]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[22]));
	defparam d23.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d23 (
	.D1(data_hi[23]),
	.D2(data_lo[23]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[23]));
	defparam d24.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d24 (
	.D1(data_hi[24]),
	.D2(data_lo[24]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[24]));
	defparam d25.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d25 (
	.D1(data_hi[25]),
	.D2(data_lo[25]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[25]));
	defparam d26.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d26 (
	.D1(data_hi[26]),
	.D2(data_lo[26]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[26]));
	defparam d27.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d27 (
	.D1(data_hi[27]),
	.D2(data_lo[27]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[27]));
	defparam d28.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d28 (
	.D1(data_hi[28]),
	.D2(data_lo[28]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[28]));
	defparam d29.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d29 (
	.D1(data_hi[29]),
	.D2(data_lo[29]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[29]));
	defparam d30.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d30 (
	.D1(data_hi[30]),
	.D2(data_lo[30]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[30]));
	defparam d31.DDR_CLK_EDGE = "SAME_EDGE";
	ODDR d31 (
	.D1(data_hi[31]),
	.D2(data_lo[31]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q(ddr[31]));
endmodule