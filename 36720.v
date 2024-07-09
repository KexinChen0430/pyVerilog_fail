module ddr_in_20 ( clk, ddr, data_hi, data_lo );
	// synthesis attribute keep_hierarchy ddr_in_20 "true";
	input clk;
	input [19:0] ddr;
	output [19:0] data_hi;
	output [19:0] data_lo;
	defparam d0.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d0 (
	.D(ddr[0]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[0]),
	.Q2(data_lo[0]));
	defparam d1.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d1 (
	.D(ddr[1]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[1]),
	.Q2(data_lo[1]));
	defparam d2.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d2 (
	.D(ddr[2]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[2]),
	.Q2(data_lo[2]));
	defparam d3.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d3 (
	.D(ddr[3]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[3]),
	.Q2(data_lo[3]));
	defparam d4.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d4 (
	.D(ddr[4]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[4]),
	.Q2(data_lo[4]));
	defparam d5.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d5 (
	.D(ddr[5]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[5]),
	.Q2(data_lo[5]));
	defparam d6.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d6 (
	.D(ddr[6]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[6]),
	.Q2(data_lo[6]));
	defparam d7.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d7 (
	.D(ddr[7]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[7]),
	.Q2(data_lo[7]));
	defparam d8.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d8 (
	.D(ddr[8]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[8]),
	.Q2(data_lo[8]));
	defparam d9.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d9 (
	.D(ddr[9]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[9]),
	.Q2(data_lo[9]));
	defparam d10.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d10 (
	.D(ddr[10]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[10]),
	.Q2(data_lo[10]));
	defparam d11.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d11 (
	.D(ddr[11]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[11]),
	.Q2(data_lo[11]));
	defparam d12.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d12 (
	.D(ddr[12]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[12]),
	.Q2(data_lo[12]));
	defparam d13.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d13 (
	.D(ddr[13]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[13]),
	.Q2(data_lo[13]));
	defparam d14.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d14 (
	.D(ddr[14]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[14]),
	.Q2(data_lo[14]));
	defparam d15.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d15 (
	.D(ddr[15]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[15]),
	.Q2(data_lo[15]));
	defparam d16.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d16 (
	.D(ddr[16]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[16]),
	.Q2(data_lo[16]));
	defparam d17.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d17 (
	.D(ddr[17]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[17]),
	.Q2(data_lo[17]));
	defparam d18.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d18 (
	.D(ddr[18]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[18]),
	.Q2(data_lo[18]));
	defparam d19.DDR_CLK_EDGE = "SAME_EDGE_PIPELINED";
	IDDR d19 (
	.D(ddr[19]),
	.C(clk),
	.CE(1'b1),
	.S(1'b0),
	.R(1'b0),
	.Q1(data_hi[19]),
	.Q2(data_lo[19]));
endmodule