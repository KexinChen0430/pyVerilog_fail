module bch_syndrome_shuffle #(
	parameter [`BCH_PARAM_SZ-1:0] P = `BCH_SANE
) (
	input clk,
	input start,		/* Accept first syndrome bit */
	input ce,		/* Shuffle cycle */
	input [`BCH_SYNDROMES_SZ(P)-1:0] syndromes,
	output reg [(2*`BCH_T(P)-1)*`BCH_M(P)-1:0] syn_shuffled = 0
);
	localparam M = `BCH_M(P);
	localparam [`MAX_M*(1<<(`MAX_M-1))-1:0] TBL = syndrome_build_table(M, `BCH_T(P));
	`include "bch_syndrome.vh"
	localparam TCQ = 1;
	localparam T = `BCH_T(P);
	genvar i;
	wire [(2*T-1)*M-1:0] bypass_in_shifted;
	wire [(2*T-1)*M-1:0] syndromes_pre_expand;
	wire [(2*T-1)*M-1:0] expand_in;
	wire [(2*T-1)*M-1:0] expand_in1;
	wire [(2*T-1)*M-1:0] syn_expanded;
	for (i = 0; i < 2 * T - 1; i = i + 1) begin : ASSIGN
		assign syndromes_pre_expand[i*M+:M] = syndromes[dat2idx(i+1)*M+:M] & {M{start}};
	end
	/* Shuffle syndromes */
	rotate_right #((2*T-1)*M, 3*M) u_rol_e(syndromes_pre_expand, expand_in1);
	reverse_words #(M, 2*T-1) u_rev(expand_in1, expand_in);
	rotate_left #((2*T-1)*M, 2*M) u_rol_b(syn_shuffled, bypass_in_shifted);
	/*
	 */
	for (i = 0; i < 2 * T - 1; i = i + 1) begin : EXPAND
		localparam PRE = (2 * T - 1 + 2 - i) % (2 * T - 1); /* Pre-shuffle value */
		if (syndrome_method(T, dat2syn(PRE+1)) == 0) begin : METHOD1
			syndrome_expand_method1 #(P) u_expand(
				.in(expand_in[i*M+:M]),
				.out(syn_expanded[i*M+:M])
			);
		end else begin : METHOD2
			syndrome_expand_method2 #(P, PRE+1) u_expand(
				.in(expand_in[i*M+:M]),
				.out(syn_expanded[i*M+:M])
			);
		end
	end
	always @(posedge clk)
		if (start || ce)
			syn_shuffled <= #TCQ syn_expanded ^ ({(2*T-1)*M{!start}} & bypass_in_shifted);
endmodule