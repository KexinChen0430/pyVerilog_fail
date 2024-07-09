module bch_chien #(
	parameter [`BCH_PARAM_SZ-1:0] P = `BCH_SANE,
	parameter BITS = 1,
	/*
	 */
	parameter REG_RATIO = BITS > 8 ? 8 : BITS
) (
	input clk,
	input start,
	input [`BCH_SIGMA_SZ(P)-1:0] sigma,
	output first,			/* First valid output data */
	output [`BCH_CHIEN_SZ(P)*BITS-1:0] chien
);
	`include "bch.vh"
	localparam TCQ = 1;
	localparam M = `BCH_M(P);
	localparam T = `BCH_T(P);
	localparam SKIP = `BCH_K(P) - `BCH_DATA_BITS(P);
	if (REG_RATIO > BITS)
		chien_reg_ratio_must_be_less_than_or_equal_to_bits u_crrmbltoeqb();
	genvar i, b;
	generate
	for (b = 0; b < BITS; b = b + 1) begin : BIT
		for (i = 0; i <= T; i = i + 1) begin : REG
			if (!(b % REG_RATIO)) begin : ORIG
				bch_chien_reg #(M, i + 1, SKIP + b - BITS + 1 + `BCH_N(P), BITS) u_chien_reg(
					.clk(clk),
					.start(start),
					.in(sigma[i*M+:M]),
					.out(chien[((BITS-b-1)*(T+1)+i)*M+:M])
				);
			end else begin : EXPAND
				bch_chien_expand #(M, i + 1, b % REG_RATIO) u_chien_expand(
					.in(chien[((BITS-b+(b%REG_RATIO)-1)*(T+1)+i)*M+:M]),
					.out(chien[((BITS-b-1)*(T+1)+i)*M+:M])
				);
			end
		end
	end
	endgenerate
	pipeline #(2) u_first_pipeline (
		.clk(clk),
		.i(start),
		.o(first)
	);
endmodule