module ultra_slice_memory_lut #(
	parameter [1023:0] LOC = "",
	parameter [1023:0] BEL5 = "",
	parameter [1023:0] BEL6 = "",
	parameter [1023:0] MODE = "LOGIC",
	parameter [63:0] INIT = 64'h0,
	parameter CLKINV = 0, WA6USED = 0, WA7USED = 0, WA8USED = 0, OUTPUT_MC31 = 0
) (
	input CLK, CE,
	input [5:0] A,
	input [8:0] WA,
	input [1:0] DI,
	output [1:0] DO,
	output MC31
);
	generate
		if (MODE == "LOGIC") begin
			(* keep, dont_touch *) LUT5 #(.INIT(INIT[63:32])) lut6 (.I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]), .I4(A[4]), .O(DO[1]));
			(* keep, dont_touch *) LUT5 #(.INIT(INIT[31:0])) lut5 (.I0(A[0]), .I1(A[1]), .I2(A[2]), .I3(A[3]), .I4(A[4]), .O(DO[0]));
			assign MC31 = DO[1];
		end else if (MODE == "SRL16") begin
			(* keep, dont_touch *) SRL16E #(.INIT(INIT[63:32]), .IS_CLK_INVERTED(CLKINV)) srl6 (.A0(1'b1), .A1(1'b1), .A2(1'b1), .A3(1'b1), .D(DI[1]), .CLK(CLK), .CE(CE), .Q(DO[1]));
			(* keep, dont_touch *) SRL16E #(.INIT(INIT[31:0]), .IS_CLK_INVERTED(CLKINV)) srl5 (.A0(1'b1), .A1(1'b1), .A2(1'b1), .A3(1'b1), .D(DI[0]), .CLK(CLK), .CE(CE), .Q(DO[0]));
			assign MC31 = DO[1];
		end else if (MODE == "SRL32") begin
			if (OUTPUT_MC31) begin
				(* keep, dont_touch *) SRLC32E #(.INIT(INIT[31:0]), .IS_CLK_INVERTED(CLKINV)) srl6(.A(5'b11111), .D(DI[0]), .CLK(CLK), .CE(CE), .Q(DO[1]), .Q31(MC31));
			end else begin
				(* keep, dont_touch *) SRLC32E #(.INIT(INIT[31:0]), .IS_CLK_INVERTED(CLKINV)) srl6(.A(5'b11111), .D(DI[0]), .CLK(CLK), .CE(CE), .Q(DO[1]));
			end
			assign DO[0] = DO[1];
		end else if (MODE == "RAMD64") begin
			if (WA6USED && WA7USED) begin
				(* keep, dont_touch *) RAMD64E #(.INIT(INIT), .IS_CLK_INVERTED(CLKINV)) ram_i (
					.RADR0(A[0]), .RADR1(A[1]), .RADR2(A[2]), .RADR3(A[3]), .RADR4(A[4]), .RADR5(A[5]),
					.WADR0(WA[0]), .WADR1(WA[1]), .WADR2(WA[2]), .WADR3(WA[3]), .WADR4(WA[4]), .WADR5(WA[5]), .WADR6(WA[6]), .WADR7(WA[7]),
					.CLK(CLK), .WE(CE),
					.I(DI[0]), .O(DO[1])
				);
			end else if (WA6USED) begin
				(* keep, dont_touch *) RAMD64E #(.INIT(INIT), .IS_CLK_INVERTED(CLKINV)) ram_i (
					.RADR0(A[0]), .RADR1(A[1]), .RADR2(A[2]), .RADR3(A[3]), .RADR4(A[4]), .RADR5(A[5]),
					.WADR0(WA[0]), .WADR1(WA[1]), .WADR2(WA[2]), .WADR3(WA[3]), .WADR4(WA[4]), .WADR5(WA[5]), .WADR6(WA[6]),
					.CLK(CLK), .WE(CE),
					.I(DI[0]), .O(DO[1])
				);
			end else begin
				(* keep, dont_touch *) RAMD64E #(.INIT(INIT), .IS_CLK_INVERTED(CLKINV)) ram_i (
					.RADR0(A[0]), .RADR1(A[1]), .RADR2(A[2]), .RADR3(A[3]), .RADR4(A[4]), .RADR5(A[5]),
					.WADR0(WA[0]), .WADR1(WA[1]), .WADR2(WA[2]), .WADR3(WA[3]), .WADR4(WA[4]), .WADR5(WA[5]),
					.CLK(CLK), .WE(CE),
					.I(DI[0]), .O(DO[1])
				);
			end
			assign DO[0] = DO[1];
			assign MC31 = DO[1];
		end else if (MODE == "RAMS64") begin
			if (WA6USED && WA7USED && WA8USED) begin
				(* keep, dont_touch *) RAMS64E1 #(.INIT(INIT), .IS_CLK_INVERTED(CLKINV)) ram_i (
					.ADR0(WA[0]), .ADR1(WA[1]), .ADR2(WA[2]), .ADR3(WA[3]), .ADR4(WA[4]), .ADR5(WA[5]),
					.WADR6(WA[6]), .WADR7(WA[7]), .WADR8(WA[8]),
					.CLK(CLK), .WE(CE),
					.I(DI[0]), .O(DO[1])
				);
			end else if (WA6USED && WA7USED) begin
				(* keep, dont_touch *) RAMS64E1 #(.INIT(INIT), .IS_CLK_INVERTED(CLKINV)) ram_i (
					.ADR0(WA[0]), .ADR1(WA[1]), .ADR2(WA[2]), .ADR3(WA[3]), .ADR4(WA[4]), .ADR5(WA[5]),
					.WADR6(WA[6]), .WADR7(WA[7]),
					.CLK(CLK), .WE(CE),
					.I(DI[0]), .O(DO[1])
				);
			end else if (WA6USED) begin
				(* keep, dont_touch *) RAMS64E1 #(.INIT(INIT), .IS_CLK_INVERTED(CLKINV)) ram_i (
					.ADR0(WA[0]), .ADR1(WA[1]), .ADR2(WA[2]), .ADR3(WA[3]), .ADR4(WA[4]), .ADR5(WA[5]),
					.WADR6(WA[6]),
					.CLK(CLK), .WE(CE),
					.I(DI[0]), .O(DO[1])
				);
			end else begin
				(* keep, dont_touch *) RAMS64E1 #(.INIT(INIT), .IS_CLK_INVERTED(CLKINV)) ram_i (
					.ADR0(WA[0]), .ADR1(WA[1]), .ADR2(WA[2]), .ADR3(WA[3]), .ADR4(WA[4]), .ADR5(WA[5]),
					.CLK(CLK), .WE(CE),
					.I(DI[0]), .O(DO[1])
				);
			end
			assign DO[0] = DO[1];
			assign MC31 = DO[1];
		end else if (MODE == "RAMS32") begin
			(* keep, dont_touch *) RAMS32 #(.INIT(INIT[63:32]), .IS_CLK_INVERTED(CLKINV)) ram1_i (
				.ADR0(WA[0]), .ADR1(WA[1]), .ADR2(WA[2]), .ADR3(WA[3]), .ADR4(WA[4]),
				.CLK(CLK), .WE(CE),
				.I(DI[1]), .O(DO[1])
			);
			(* keep, dont_touch *) RAMS32 #(.INIT(INIT[31:0]), .IS_CLK_INVERTED(CLKINV)) ram0_i (
				.ADR0(WA[0]), .ADR1(WA[1]), .ADR2(WA[2]), .ADR3(WA[3]), .ADR4(WA[4]),
				.CLK(CLK), .WE(CE),
				.I(DI[0]), .O(DO[0])
			);
			assign MC31 = DO[1];
		end else if (MODE == "RAMD32") begin
			(* keep, dont_touch *) RAMD32 #(.INIT(INIT[63:32]), .IS_CLK_INVERTED(CLKINV)) ram1_i (
				.WADR0(WA[0]), .WADR1(WA[1]), .WADR2(WA[2]), .WADR3(WA[3]), .WADR4(WA[4]),
				.RADR0(A[0]), .RADR1(A[1]), .RADR2(A[2]), .RADR3(A[3]), .RADR4(A[4]),
				.CLK(CLK), .WE(CE),
				.I(DI[1]), .O(DO[1])
			);
			(* keep, dont_touch *) RAMD32 #(.INIT(INIT[31:0]), .IS_CLK_INVERTED(CLKINV)) ram0_i (
				.WADR0(WA[0]), .WADR1(WA[1]), .WADR2(WA[2]), .WADR3(WA[3]), .WADR4(WA[4]),
				.RADR0(A[0]), .RADR1(A[1]), .RADR2(A[2]), .RADR3(A[3]), .RADR4(A[4]),
				.CLK(CLK), .WE(CE),
				.I(DI[0]), .O(DO[0])
			);
			assign MC31 = DO[1];
		end else begin
			$error("unsupported mode");
		end
	endgenerate
endmodule