module bch_syndrome #(
	parameter [`BCH_PARAM_SZ-1:0] P = `BCH_SANE,
	parameter BITS = 1,
	parameter REG_RATIO = 1,
	parameter PIPELINE_STAGES = 0
) (
	input clk,
	input start,		/* Accept first syndrome bit (assumes ce) */
	input ce,
	input [BITS-1:0] data_in,
	output ready,
	output [`BCH_SYNDROMES_SZ(P)-1:0] syndromes,
	output reg done = 0
);
	localparam M = `BCH_M(P);
	localparam [`MAX_M*(1<<(`MAX_M-1))-1:0] TBL = syndrome_build_table(M, `BCH_T(P));
	`include "bch_syndrome.vh"
	localparam TCQ = 1;
	genvar idx;
	localparam CYCLES = PIPELINE_STAGES + (`BCH_CODE_BITS(P)+BITS-1) / BITS;
	localparam DONE = lfsr_count(M, CYCLES - 2);
	localparam REM = `BCH_CODE_BITS(P) % BITS;
	localparam RUNT = BITS - REM;
	localparam SYN_COUNT = TBL[0+:`MAX_M];
	wire [M-1:0] count;
	wire [BITS-1:0] data_pipelined;
	wire [BITS-1:0] shifted_in;
	wire [BITS-1:0] shifted_pipelined;
	wire start_pipelined;
	reg busy = 0;
	if (CYCLES > 2) begin : COUNTER
		lfsr_counter #(M) u_counter(
			.clk(clk),
			.reset(start && ce),
			.ce(busy && ce),
			.count(count)
		);
	end else
		assign count = DONE;
	assign ready = !busy;
	always @(posedge clk) begin
		if (ce) begin
			if (start) begin
				done <= #TCQ CYCLES == 1;
				busy <= #TCQ CYCLES > 1;
			end else if (busy && count == DONE) begin
				done <= #TCQ 1;
				busy <= #TCQ 0;
			end else
				done <= #TCQ 0;
		end
	end
	 /*
	  */
	generate
		if (REM) begin
			reg [RUNT-1:0] runt = 0;
			assign shifted_in = {start ? {RUNT{1'b0}} : runt, data_in[BITS-1:RUNT]};
			always @(posedge clk)
				if (ce)
					runt <= #TCQ data_in;
		end else
			assign shifted_in = data_in;
	endgenerate
	/* Pipelined data for method1 */
	pipeline_ce #(PIPELINE_STAGES > 1) u_data_pipeline [BITS-1:0] (
		.clk(clk),
		.ce(ce),
		.i(data_in),
		.o(data_pipelined)
	);
	/* Pipelined data for method2 */
	pipeline_ce #(PIPELINE_STAGES > 0) u_shifted_pipeline [BITS-1:0] (
		.clk(clk),
		.ce(ce),
		.i(shifted_in),
		.o(shifted_pipelined)
	);
	pipeline_ce #(PIPELINE_STAGES > 1) u_start_pipeline (
		.clk(clk),
		.ce(ce),
		.i(start),
		.o(start_pipelined)
	);
	/* LFSR registers */
	generate
	for (idx = 0; idx < SYN_COUNT; idx = idx + 1) begin : SYNDROMES
		localparam SYN = idx2syn(idx);
		if (syndrome_method(`BCH_T(P), SYN) == 0) begin : METHOD1
			dsynN_method1 #(P, SYN, BITS, REG_RATIO, PIPELINE_STAGES) u_syn1a(
				.clk(clk),
				.start(start),
				.start_pipelined(start_pipelined),
				.ce((busy || start) && ce),
				.data_pipelined(data_pipelined),
				.synN(syndromes[idx*M+:M])
			);
		end else begin : METHOD2
			dsynN_method2 #(P, SYN, syndrome_degree(M, SYN), BITS, PIPELINE_STAGES) u_syn2a(
				.clk(clk),
				.start(start),
				.start_pipelined(start_pipelined),
				.ce((busy || start) && ce),
				.data_in(shifted_in),
				.data_pipelined(shifted_pipelined),
				.synN(syndromes[idx*M+:M])
			);
		end
	end
	endgenerate
endmodule