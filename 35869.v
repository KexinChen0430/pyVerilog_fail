module __TFFE_NP_ (T, C, E, Q);
	input T, C, E;
	output wire Q;
	wire xorout;
	$_XOR_ xorgate (
		.A(T),
		.B(Q),
		.Y(xorout),
	);
	$_DFFE_NP_ dff (
		.C(C),
		.D(xorout),
		.Q(Q),
		.E(E),
	);
endmodule