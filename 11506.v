module clb_OUT (input clk, input [7:0] din, output [7:0] dout);
    wire o6;
    assign dout[0] = o6;
	(* LOC="SLICE_X67Y330", BEL="B6LUT", KEEP, DONT_TOUCH *)
	LUT6 #(
		.INIT(64'h8000_0000_0000_0001)
	) lut (
		.I0(din[0]),
		.I1(din[1]),
		.I2(din[2]),
		.I3(din[3]),
		.I4(din[4]),
		.I5(din[5]),
		.O(o6));
	(* LOC="SLICE_X67Y330", BEL="BFF" *)
	FDPE ff (
		.C(clk),
		.Q(dout[1]),
		.CE(din[0]),
		.PRE(din[1]),
		.D(o6));
endmodule