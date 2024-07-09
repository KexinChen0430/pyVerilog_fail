module clb_g (input clk, input [15:0] din, output [15:0] dout);
	wire a, b, c;
	(* LOC="SLICE_X0Y246", BEL="D6LUT", LOCK_PINS="I0:A1", DONT_TOUCH *)
	LUT1 #(
		.INIT(2'b01)
	) lut (
		.I0(din[2]),
		.O(a)
	);
	(* LOC="SLICE_X0Y246", BEL="F7MUX_CD", DONT_TOUCH *)
	MUXF7 mux1 (
		.I0(a),
		.I1(din[3]),
		.S(din[4]),
		.O(b)
	);
	(* LOC="SLICE_X0Y246", BEL="F8MUX_BOT", DONT_TOUCH *)
	MUXF8 mux2 (
		.I0(b),
		.I1(din[5]),
		.S(din[6]),
		.O(c)
	);
	(* LOC="SLICE_X0Y246", BEL="BFF", DONT_TOUCH *)
	FDRE ff (
		.C(clk),
		.Q(dout[0]),
		.CE(din[0]),
		.R(din[1]),
		.D(c)
	);
	assign dout[15:1] = 0;
endmodule