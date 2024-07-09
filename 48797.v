module _80_mul (A, B, Y);
	parameter A_SIGNED = 0;
	parameter B_SIGNED = 0;
	parameter A_WIDTH = 1;
	parameter B_WIDTH = 1;
	parameter Y_WIDTH = 1;
	(* force_downto *)
	input [A_WIDTH-1:0] A;
	(* force_downto *)
	input [B_WIDTH-1:0] B;
	(* force_downto *)
	output [Y_WIDTH-1:0] Y;
	parameter _TECHMAP_CELLTYPE_ = "";
	generate
	if (0) begin end
`ifdef DSP_A_MINWIDTH
	else if (A_WIDTH < `DSP_A_MINWIDTH)
		wire _TECHMAP_FAIL_ = 1;
`endif
`ifdef DSP_B_MINWIDTH
	else if (B_WIDTH < `DSP_B_MINWIDTH)
		wire _TECHMAP_FAIL_ = 1;
`endif
`ifdef DSP_Y_MINWIDTH
	else if (Y_WIDTH < `DSP_Y_MINWIDTH)
		wire _TECHMAP_FAIL_ = 1;
`endif
`ifdef DSP_SIGNEDONLY
	else if (_TECHMAP_CELLTYPE_ == "$mul" && !A_SIGNED && !B_SIGNED)
		\$mul #(
			.A_SIGNED(1),
			.B_SIGNED(1),
			.A_WIDTH(A_WIDTH + 1),
			.B_WIDTH(B_WIDTH + 1),
			.Y_WIDTH(Y_WIDTH)
		) _TECHMAP_REPLACE_ (
			.A({1'b0, A}),
			.B({1'b0, B}),
			.Y(Y)
		);
`endif
	else if (_TECHMAP_CELLTYPE_ == "$mul" && A_WIDTH < B_WIDTH)
		\$mul #(
			.A_SIGNED(B_SIGNED),
			.B_SIGNED(A_SIGNED),
			.A_WIDTH(B_WIDTH),
			.B_WIDTH(A_WIDTH),
			.Y_WIDTH(Y_WIDTH)
		) _TECHMAP_REPLACE_ (
			.A(B),
			.B(A),
			.Y(Y)
		);
	else begin
		wire [1023:0] _TECHMAP_DO_ = "proc; clean";
`ifdef DSP_SIGNEDONLY
		localparam sign_headroom = 1;
`else
		localparam sign_headroom = 0;
`endif
		genvar i;
		if (A_WIDTH > `DSP_A_MAXWIDTH) begin
			localparam n = (A_WIDTH-`DSP_A_MAXWIDTH+`DSP_A_MAXWIDTH_PARTIAL-sign_headroom-1) / (`DSP_A_MAXWIDTH_PARTIAL-sign_headroom);
			localparam partial_Y_WIDTH = `MIN(Y_WIDTH, B_WIDTH+`DSP_A_MAXWIDTH_PARTIAL);
			localparam last_A_WIDTH = A_WIDTH-n*(`DSP_A_MAXWIDTH_PARTIAL-sign_headroom);
			localparam last_Y_WIDTH = B_WIDTH+last_A_WIDTH;
			if (A_SIGNED && B_SIGNED) begin
				(* force_downto *)
				wire signed [partial_Y_WIDTH-1:0] partial [n-1:0];
				(* force_downto *)
				wire signed [last_Y_WIDTH-1:0] last_partial;
				(* force_downto *)
				wire signed [Y_WIDTH-1:0] partial_sum [n:0];
			end
			else begin
				(* force_downto *)
				wire [partial_Y_WIDTH-1:0] partial [n-1:0];
				(* force_downto *)
				wire [last_Y_WIDTH-1:0] last_partial;
				(* force_downto *)
				wire [Y_WIDTH-1:0] partial_sum [n:0];
			end
			for (i = 0; i < n; i=i+1) begin:sliceA
				\$__mul #(
					.A_SIGNED(sign_headroom),
					.B_SIGNED(B_SIGNED),
					.A_WIDTH(`DSP_A_MAXWIDTH_PARTIAL),
					.B_WIDTH(B_WIDTH),
					.Y_WIDTH(partial_Y_WIDTH)
				) mul (
					.A({{sign_headroom{1'b0}}, A[i*(`DSP_A_MAXWIDTH_PARTIAL-sign_headroom) +: `DSP_A_MAXWIDTH_PARTIAL-sign_headroom]}),
					.B(B),
					.Y(partial[i])
				);
				// TODO: Currently a 'cascade' approach to summing the partial
				//       products is taken here, but a more efficient 'binary
				//       reduction' approach also exists...
				if (i == 0)
					assign partial_sum[i] = partial[i];
				else
					assign partial_sum[i] = (partial[i] << (* mul2dsp *) i*(`DSP_A_MAXWIDTH_PARTIAL-sign_headroom)) + (* mul2dsp *) partial_sum[i-1];
			end
			\$__mul #(
				.A_SIGNED(A_SIGNED),
				.B_SIGNED(B_SIGNED),
				.A_WIDTH(last_A_WIDTH),
				.B_WIDTH(B_WIDTH),
				.Y_WIDTH(last_Y_WIDTH)
			) sliceA.last (
				.A(A[A_WIDTH-1 -: last_A_WIDTH]),
				.B(B),
				.Y(last_partial)
			);
			assign partial_sum[n] = (last_partial << (* mul2dsp *) n*(`DSP_A_MAXWIDTH_PARTIAL-sign_headroom)) + (* mul2dsp *) partial_sum[n-1];
			assign Y = partial_sum[n];
		end
		else if (B_WIDTH > `DSP_B_MAXWIDTH) begin
			localparam n = (B_WIDTH-`DSP_B_MAXWIDTH+`DSP_B_MAXWIDTH_PARTIAL-sign_headroom-1) / (`DSP_B_MAXWIDTH_PARTIAL-sign_headroom);
			localparam partial_Y_WIDTH = `MIN(Y_WIDTH, A_WIDTH+`DSP_B_MAXWIDTH_PARTIAL);
			localparam last_B_WIDTH = B_WIDTH-n*(`DSP_B_MAXWIDTH_PARTIAL-sign_headroom);
			localparam last_Y_WIDTH = A_WIDTH+last_B_WIDTH;
			if (A_SIGNED && B_SIGNED) begin
				(* force_downto *)
				wire signed [partial_Y_WIDTH-1:0] partial [n-1:0];
				(* force_downto *)
				wire signed [last_Y_WIDTH-1:0] last_partial;
				(* force_downto *)
				wire signed [Y_WIDTH-1:0] partial_sum [n:0];
			end
			else begin
				(* force_downto *)
				wire [partial_Y_WIDTH-1:0] partial [n-1:0];
				(* force_downto *)
				wire [last_Y_WIDTH-1:0] last_partial;
				(* force_downto *)
				wire [Y_WIDTH-1:0] partial_sum [n:0];
			end
			for (i = 0; i < n; i=i+1) begin:sliceB
				\$__mul #(
					.A_SIGNED(A_SIGNED),
					.B_SIGNED(sign_headroom),
					.A_WIDTH(A_WIDTH),
					.B_WIDTH(`DSP_B_MAXWIDTH_PARTIAL),
					.Y_WIDTH(partial_Y_WIDTH)
				) mul (
					.A(A),
					.B({{sign_headroom{1'b0}}, B[i*(`DSP_B_MAXWIDTH_PARTIAL-sign_headroom) +: `DSP_B_MAXWIDTH_PARTIAL-sign_headroom]}),
					.Y(partial[i])
				);
				// TODO: Currently a 'cascade' approach to summing the partial
				//       products is taken here, but a more efficient 'binary
				//       reduction' approach also exists...
				if (i == 0)
					assign partial_sum[i] = partial[i];
				else
					assign partial_sum[i] = (partial[i] << (* mul2dsp *) i*(`DSP_B_MAXWIDTH_PARTIAL-sign_headroom)) + (* mul2dsp *) partial_sum[i-1];
			end
			\$__mul #(
				.A_SIGNED(A_SIGNED),
				.B_SIGNED(B_SIGNED),
				.A_WIDTH(A_WIDTH),
				.B_WIDTH(last_B_WIDTH),
				.Y_WIDTH(last_Y_WIDTH)
			) mul_sliceB_last (
				.A(A),
				.B(B[B_WIDTH-1 -: last_B_WIDTH]),
				.Y(last_partial)
			);
			assign partial_sum[n] = (last_partial << (* mul2dsp *) n*(`DSP_B_MAXWIDTH_PARTIAL-sign_headroom)) + (* mul2dsp *) partial_sum[n-1];
			assign Y = partial_sum[n];
		end
		else begin
			if (A_SIGNED)
				wire signed [`DSP_A_MAXWIDTH-1:0] Aext = $signed(A);
			else
				wire [`DSP_A_MAXWIDTH-1:0] Aext = A;
			if (B_SIGNED)
				wire signed [`DSP_B_MAXWIDTH-1:0] Bext = $signed(B);
			else
				wire [`DSP_B_MAXWIDTH-1:0] Bext = B;
			`DSP_NAME #(
				.A_SIGNED(A_SIGNED),
				.B_SIGNED(B_SIGNED),
				.A_WIDTH(`DSP_A_MAXWIDTH),
				.B_WIDTH(`DSP_B_MAXWIDTH),
				.Y_WIDTH(`MIN(Y_WIDTH,`DSP_A_MAXWIDTH+`DSP_B_MAXWIDTH)),
			) _TECHMAP_REPLACE_ (
				.A(Aext),
				.B(Bext),
				.Y(Y)
			);
		end
	end
	endgenerate
endmodule