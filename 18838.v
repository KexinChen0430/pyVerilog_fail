module clb_e (input clk, input [15:0] din, output [15:0] dout);
	wire tmp;
	(* LOC="SLICE_X0Y244", BEL="D6LUT", LOCK_PINS="I0:A1", DONT_TOUCH *)
	LUT1 #(
		.INIT(2'b01)
	) lut (
		.I0(din[2]),
		.O(tmp)
	);
	(* LOC="SLICE_X0Y244", BEL="BFF", DONT_TOUCH *)
	FDRE ff (
		.C(clk),
		.Q(dout[0]),
		.CE(din[0]),
		.R(din[1]),
		.D(tmp)
	);
	assign dout[15:1] = 0;
endmodule