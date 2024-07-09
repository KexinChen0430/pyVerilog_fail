module _80_xilinx_lcu (P, G, CI, CO);
	parameter WIDTH = 2;
	(* force_downto *)
	input [WIDTH-1:0] P, G;
	input CI;
	(* force_downto *)
	output [WIDTH-1:0] CO;
	wire _TECHMAP_FAIL_ = WIDTH <= 2;
	genvar i;
generate if (`LUT_SIZE == 4) begin
	(* force_downto *)
	wire [WIDTH-1:0] C = {CO, CI};
	(* force_downto *)
	wire [WIDTH-1:0] S = P & ~G;
	generate for (i = 0; i < WIDTH; i = i + 1) begin:slice
		MUXCY muxcy (
			.CI(C[i]),
			.DI(G[i]),
			.S(S[i]),
			.O(CO[i])
		);
	end endgenerate
end else begin
	localparam CARRY4_COUNT = (WIDTH + 3) / 4;
	localparam MAX_WIDTH    = CARRY4_COUNT * 4;
	localparam PAD_WIDTH    = MAX_WIDTH - WIDTH;
	(* force_downto *)
	wire [MAX_WIDTH-1:0] S =  {{PAD_WIDTH{1'b0}}, P & ~G};
	(* force_downto *)
	wire [MAX_WIDTH-1:0] GG = {{PAD_WIDTH{1'b0}}, G};
	(* force_downto *)
	wire [MAX_WIDTH-1:0] C;
	assign CO = C;
	generate for (i = 0; i < CARRY4_COUNT; i = i + 1) begin:slice
		if (i == 0) begin
			CARRY4 carry4
			(
			.CYINIT(CI),
			.CI    (1'd0),
			.DI    (GG[i*4 +: 4]),
			.S     (S [i*4 +: 4]),
			.CO    (C [i*4 +: 4]),
			);
		end else begin
			CARRY4 carry4
			(
			.CYINIT(1'd0),
			.CI    (C [i*4 - 1]),
			.DI    (GG[i*4 +: 4]),
			.S     (S [i*4 +: 4]),
			.CO    (C [i*4 +: 4]),
			);
		end
	end endgenerate
end endgenerate
endmodule