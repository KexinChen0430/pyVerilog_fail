module __TFF_PN0_ (T, C, R, Q);
	input T, C, R;
	output wire Q;
	wire xorout;
	$_XOR_ xorgate (
		.A(T),
		.B(Q),
		.Y(xorout),
	);
	$_DFF_PN0_ dff (
		.C(C),
		.D(xorout),
		.Q(Q),
		.R(R),
	);
endmodule