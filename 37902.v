module xilinx_error_tmec #(
	parameter T = 2,
	parameter DATA_BITS = 5,
	parameter BITS = 1,
	parameter REG_RATIO = 1,
	parameter PIPELINE_STAGES = 0,
	parameter ACCUM = 1
) (
	input clk_in,
	input in,
	output reg out = 0
);
	`include "bch_params.vh"
	localparam TCQ = 1;
	localparam P = bch_params(DATA_BITS, T);
	localparam IN = `BCH_SIGMA_SZ(P) + 1;
	localparam OUT = 1 + BITS;
	wire clk;
	(* KEEP = "TRUE" *)
	reg [IN-1:0] all_in;
	(* KEEP = "TRUE" *)
	reg [OUT-1:0] all_out;
	wire start;			/* Latch inputs, start calculating */
	wire [`BCH_SIGMA_SZ(P)-1:0] sigma;
	wire ready;
	wire first;			/* First valid output data */
	wire [BITS-1:0] err;
	(* KEEP = "TRUE" *)
	reg in1 = 0, in2 = 0, out1 = 0;
	BUFG u_bufg (
		.I(clk_in),
		.O(clk)
	);
	assign start = all_in[0];
	assign sigma = all_in >> 1;
	always @(posedge clk) begin
		in1 <= #TCQ in;
		in2 <= #TCQ in1;
		out <= #TCQ out1;
		out1 <= #TCQ all_out[0];
		all_in <= #TCQ (all_in << 1) | in2;
		all_out <= #TCQ (all_out >> 1) ^ {first, err};
	end
	bch_error_tmec #(P, BITS, REG_RATIO, PIPELINE_STAGES, ACCUM) u_error_tmec(
		.clk(clk),
		.start(start),
		.sigma(sigma),
		.first(first),
		.err(err)
	);
endmodule