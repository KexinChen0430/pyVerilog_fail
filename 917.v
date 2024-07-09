module _80_efinix_alu (A, B, CI, BI, X, Y, CO);
	parameter A_SIGNED = 0;
	parameter B_SIGNED = 0;
	parameter A_WIDTH  = 1;
	parameter B_WIDTH  = 1;
	parameter Y_WIDTH  = 1;
	(* force_downto *)
	input [A_WIDTH-1:0] A;
	(* force_downto *)
	input [B_WIDTH-1:0] B;
	(* force_downto *)
	output [Y_WIDTH-1:0] X, Y;
	input CI, BI;
	(* force_downto *)
	output [Y_WIDTH-1:0] CO;
    wire CIx;
    (* force_downto *)
    wire [Y_WIDTH-1:0] COx;
	wire _TECHMAP_FAIL_ = Y_WIDTH <= 2;
	(* force_downto *)
	wire [Y_WIDTH-1:0] A_buf, B_buf;
	\$pos #(.A_SIGNED(A_SIGNED), .A_WIDTH(A_WIDTH), .Y_WIDTH(Y_WIDTH)) A_conv (.A(A), .Y(A_buf));
	\$pos #(.A_SIGNED(B_SIGNED), .A_WIDTH(B_WIDTH), .Y_WIDTH(Y_WIDTH)) B_conv (.A(B), .Y(B_buf));
	(* force_downto *)
	wire [Y_WIDTH-1:0] AA = A_buf;
	(* force_downto *)
	wire [Y_WIDTH-1:0] BB = BI ? ~B_buf : B_buf;
	(* force_downto *)
	wire [Y_WIDTH-1:0] C = { COx, CIx };
    EFX_ADD #(.I0_POLARITY(1'b1),.I1_POLARITY(1'b1))
    adder_cin  (
        .I0(CI),
        .I1(1'b1),
        .CI(1'b0),
        .CO(CIx)
	);
	genvar i;
	generate for (i = 0; i < Y_WIDTH; i = i + 1) begin: slice
		EFX_ADD #(.I0_POLARITY(1'b1),.I1_POLARITY(1'b1))
		adder_i (
			.I0(AA[i]),
			.I1(BB[i]),
			.CI(C[i]),
			.O(Y[i]),
			.CO(COx[i])
		);
		EFX_ADD #(.I0_POLARITY(1'b1),.I1_POLARITY(1'b1))
		adder_cout  (
			.I0(1'b0),
			.I1(1'b0),
			.CI(COx[i]),
			.O(CO[i])
		);
	  end: slice
	endgenerate
   /* End implementation */
   assign X = AA ^ BB;
endmodule