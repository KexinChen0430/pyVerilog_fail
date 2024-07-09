module bch_errors_present #(
	parameter [`BCH_PARAM_SZ-1:0] P = `BCH_SANE,
	parameter PIPELINE_STAGES = 0
) (
	input clk,
	input start,
	input [`BCH_SYNDROMES_SZ(P)-1:0] syndromes,
	output done,
	output errors_present			/* Valid during done cycle */
);
	localparam M = `BCH_M(P);
	genvar i;
	wire [(`BCH_SYNDROMES_SZ(P)/M)-1:0] syndrome_zero;
	wire [(`BCH_SYNDROMES_SZ(P)/M)-1:0] syndrome_zero_pipelined;
	generate
		for (i = 0; i < `BCH_SYNDROMES_SZ(P)/M; i = i + 1) begin : ZEROS
			assign syndrome_zero[i] = |syndromes[i*M+:M];
		end
	endgenerate
	pipeline #(PIPELINE_STAGES > 0) u_sz_pipeline [`BCH_SYNDROMES_SZ(P)/M-1:0] (
		.clk(clk),
		.i(syndrome_zero),
		.o(syndrome_zero_pipelined)
	);
	pipeline #(PIPELINE_STAGES > 1) u_present_pipeline (
		.clk(clk),
		.i(|syndrome_zero_pipelined),
		.o(errors_present)
	);
	pipeline #(PIPELINE_STAGES) u_done_pipeline (
		.clk(clk),
		.i(start),
		.o(done)
	);
endmodule