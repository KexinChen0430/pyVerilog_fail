module bch_chien_expand #(
	parameter [`BCH_PARAM_SZ-1:0] P = `BCH_SANE,
	parameter REG = 1,
	parameter SKIP = 1
) (
	input [`BCH_M(P)-1:0] in,
	output [`BCH_M(P)-1:0] out
);
	`include "bch.vh"
	localparam TCQ = 1;
	localparam M = `BCH_M(P);
	parallel_standard_multiplier_const1 #(M, lpow(M, REG * SKIP)) u_mult(
		.standard_in(in),
		.standard_out(out)
	);
endmodule