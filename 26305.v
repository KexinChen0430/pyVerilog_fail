module bch_chien_reg #(
	parameter [`BCH_PARAM_SZ-1:0] P = `BCH_SANE,
	parameter REG = 1,
	parameter SKIP = 0,
	parameter STRIDE = 1
) (
	input clk,
	input start,
	input [`BCH_M(P)-1:0] in,
	output reg [`BCH_M(P)-1:0] out = 0
);
	`include "bch.vh"
	localparam TCQ = 1;
	localparam M = `BCH_M(P);
	wire [M-1:0] mul_out;
	wire [M-1:0] mul_out_start;
	if (!SKIP)
		assign mul_out_start = in;
	else begin
		/* Initialize with coefficients of the error location polynomial */
		if (`CONFIG_CONST_OP)
			parallel_standard_multiplier_const2 #(M, lpow(M, REG * SKIP)) u_mult_start(
				.standard_in(in),
				.standard_out(mul_out_start)
			);
		else
			parallel_standard_multiplier #(M) u_mult_start(
				.standard_in1(in),
				.standard_in2(lpow(M, REG * SKIP)),
				.standard_out(mul_out_start)
			);
	end
	/* Multiply by alpha^P */
	if (`CONFIG_CONST_OP)
		parallel_standard_multiplier_const1 #(M, lpow(M, REG * STRIDE)) u_mult(
			.standard_in(out),
			.standard_out(mul_out)
		);
	else
		parallel_standard_multiplier #(M) u_mult(
			.standard_in1(lpow(M, REG * STRIDE)),
			.standard_in2(out),
			.standard_out(mul_out)
		);
	always @(posedge clk)
		out <= #TCQ start ? mul_out_start : mul_out;
endmodule