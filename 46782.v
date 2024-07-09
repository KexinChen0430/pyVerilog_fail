module dsynN_method1 #(
	parameter [`BCH_PARAM_SZ-1:0] P = `BCH_SANE,
	parameter SYN = 0,
	parameter BITS = 1,
	parameter REG_RATIO = BITS > 8 ? 8 : BITS,
	parameter PIPELINE_STAGES = 0
) (
	input clk,
	input start,				/* Accept first bit of syndrome */
	input start_pipelined,			/* Start delayed by one if there are
	input ce,
	input [BITS-1:0] data_pipelined,	/* One stage delay (if necessary) */
	output reg [`BCH_M(P)-1:0] synN = 0
);
	`include "bch.vh"
	localparam TCQ = 1;
	localparam M = `BCH_M(P);
	localparam signed SKIP = `BCH_K(P) - `BCH_DATA_BITS(P);
	localparam LPOW_S_BITS = lpow(M, `BCH_N(P) - (SYN * BITS) % `BCH_N(P));
	localparam REGS = (BITS + REG_RATIO - 1) / REG_RATIO;
	if (PIPELINE_STAGES > 2)
		dsynN_method1_only_supports_2_pipeline_stage u_dm1os2ps();
	if (REG_RATIO > BITS)
		syndrome_reg_ratio_must_be_less_than_or_equal_to_bits u_srrmbltoeqb();
	function [REGS*M-1:0] pow_initial;
		input dummy;
		integer i;
	begin
		for (i = 0; i < REGS; i = i + 1)
			pow_initial[i*M+:M] = lpow(M, `BCH_N(P) - (SYN * (SKIP + BITS - i * REG_RATIO)) % `BCH_N(P));
	end
	endfunction
	localparam [REGS*M-1:0] POW_INITIAL = pow_initial(0);
	/*
	 */
	reg [REGS*M-1:0] pow = POW_INITIAL;
	wire [REGS*M-1:0] pow_next;
	wire [REGS*M-1:0] pow_curr;
	wire [BITS*M-1:0] pow_all;
	wire [BITS*M-1:0] terms;
	wire [M-1:0] terms_summed;
	wire [M-1:0] terms_summed_pipelined;
	genvar i;
	/* Not enough pipeline stages for set/reset, must use mux */
	assign pow_curr = (PIPELINE_STAGES < 2 && start) ? POW_INITIAL : pow;
	for (i = 0; i < BITS; i = i + 1) begin : GEN_TERMS
		wire [M-1:0] curr = pow_curr[(i/REG_RATIO)*M+:M];
		if (!(i % REG_RATIO))
			assign pow_all[i*M+:M] = curr;
		else begin
			localparam [M-1:0] LPOW = lpow(M, (SYN * (i % REG_RATIO)) % `BCH_N(P));
			if (`CONFIG_CONST_OP)
				parallel_standard_multiplier_const1 #(M, LPOW) u_mult(
					.standard_in(curr),
					.standard_out(pow_all[i*M+:M])
				);
			else
				parallel_standard_multiplier #(M) u_mult(
					.standard_in1(LPOW),
					.standard_in2(curr),
					.standard_out(pow_all[i*M+:M])
				);
		end
		assign terms[i*M+:M] = data_pipelined[i] ? pow_all[i*M+:M] : 0;
	end
	if (`CONFIG_CONST_OP)
		parallel_standard_multiplier_const1 #(M, LPOW_S_BITS[M-1:0]) u_mult [REGS-1:0] (
			.standard_in(pow_curr),
			.standard_out(pow_next)
		);
	else
		parallel_standard_multiplier #(M) u_mult [REGS-1:0] (
			.standard_in1(LPOW_S_BITS[M-1:0]),
			.standard_in2(pow_curr),
			.standard_out(pow_next)
		);
	finite_parallel_adder #(M, BITS) u_adder(
		.in(terms),
		.out(terms_summed)
	);
	pipeline_ce #(PIPELINE_STAGES > 0) u_summed_pipeline [M-1:0] (
		.clk(clk),
		.ce(ce),
		.i(terms_summed),
		.o(terms_summed_pipelined)
	);
	always @(posedge clk) begin
		if (ce) begin
			/* Utilize set/reset signal if possible */
			pow <= #TCQ (PIPELINE_STAGES > 1 && start) ? POW_INITIAL : pow_next;
			if (start_pipelined)
				synN <= #TCQ PIPELINE_STAGES ? 0 : terms_summed_pipelined;
			else
				synN <= #TCQ synN ^ terms_summed_pipelined;
		end
	end
endmodule