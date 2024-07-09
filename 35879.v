module __TFF_PP1_ (T, C, R, Q);
	input T, C, R;
	output wire Q;
	wire xorout;
	$_XOR_ xorgate (
		.A(T),
		.B(Q),
		.Y(xorout),
	);
	$_DFF_PP1_ dff (
		.C(C),
		.D(xorout),
		.Q(Q),
		.R(R),
	);
endmodule