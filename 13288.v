module _80_xilinx_alu (A, B, CI, BI, X, Y, CO);
	parameter A_SIGNED = 0;
	parameter B_SIGNED = 0;
	parameter A_WIDTH = 1;
	parameter B_WIDTH = 1;
	parameter Y_WIDTH = 1;
	parameter _TECHMAP_CONSTVAL_CI_ = 0;
	parameter _TECHMAP_CONSTMSK_CI_ = 0;
	(* force_downto *)
	input [A_WIDTH-1:0] A;
	(* force_downto *)
	input [B_WIDTH-1:0] B;
	(* force_downto *)
	output [Y_WIDTH-1:0] X, Y;
	input CI, BI;
	(* force_downto *)
	output [Y_WIDTH-1:0] CO;
	wire _TECHMAP_FAIL_ = Y_WIDTH <= 2;
	(* force_downto *)
	wire [Y_WIDTH-1:0] A_buf, B_buf;
	\$pos #(.A_SIGNED(A_SIGNED), .A_WIDTH(A_WIDTH), .Y_WIDTH(Y_WIDTH)) A_conv (.A(A), .Y(A_buf));
	\$pos #(.A_SIGNED(B_SIGNED), .A_WIDTH(B_WIDTH), .Y_WIDTH(Y_WIDTH)) B_conv (.A(B), .Y(B_buf));
	(* force_downto *)
	wire [Y_WIDTH-1:0] AA = A_buf;
	(* force_downto *)
	wire [Y_WIDTH-1:0] BB = BI ? ~B_buf : B_buf;
	genvar i;
generate if (`LUT_SIZE == 4) begin
	(* force_downto *)
	wire [Y_WIDTH-1:0] C = {CO, CI};
	(* force_downto *)
	wire [Y_WIDTH-1:0] S  = {AA ^ BB};
	genvar i;
	generate for (i = 0; i < Y_WIDTH; i = i + 1) begin:slice
		MUXCY muxcy (
			.CI(C[i]),
			.DI(AA[i]),
			.S(S[i]),
			.O(CO[i])
		);
		XORCY xorcy (
			.CI(C[i]),
			.LI(S[i]),
			.O(Y[i])
		);
	end endgenerate
end else begin
	localparam CARRY4_COUNT = (Y_WIDTH + 3) / 4;
	localparam MAX_WIDTH    = CARRY4_COUNT * 4;
	localparam PAD_WIDTH    = MAX_WIDTH - Y_WIDTH;
	(* force_downto *)
	wire [MAX_WIDTH-1:0] S  = {{PAD_WIDTH{1'b0}}, AA ^ BB};
	(* force_downto *)
	wire [MAX_WIDTH-1:0] DI = {{PAD_WIDTH{1'b0}}, AA};
	(* force_downto *)
	wire [MAX_WIDTH-1:0] O;
	(* force_downto *)
	wire [MAX_WIDTH-1:0] C;
	assign Y = O, CO = C;
	genvar i;
	generate for (i = 0; i < CARRY4_COUNT; i = i + 1) begin:slice
		if (i == 0) begin
			CARRY4 carry4
			(
			.CYINIT(CI),
			.CI    (1'd0),
			.DI    (DI[i*4 +: 4]),
			.S     (S [i*4 +: 4]),
			.O     (O [i*4 +: 4]),
			.CO    (C [i*4 +: 4])
			);
		end else begin
		    CARRY4 carry4
		    (
			.CYINIT(1'd0),
			.CI    (C [i*4 - 1]),
			.DI    (DI[i*4 +: 4]),
			.S     (S [i*4 +: 4]),
			.O     (O [i*4 +: 4]),
			.CO    (C [i*4 +: 4])
		    );
		end
	end endgenerate
end endgenerate
	assign X = S;
endmodule