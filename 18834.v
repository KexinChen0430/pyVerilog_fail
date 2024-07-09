module clb_a (input clk, input [15:0] din, output [15:0] dout);
	(* LOC="SLICE_X0Y240", BEL="AFF", DONT_TOUCH *)
	FDRE ff (
		.C(clk),
		.Q(dout[0]),
		.CE(din[0]),
		.R(din[1]),
		.D(din[2])
	);
	assign dout[15:1] = 0;
endmodule