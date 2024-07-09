module __TFFE_NN_ (T, C, E, Q);
	input T, C, E;
	output wire Q;
	wire xorout;
	$_XOR_ xorgate (
		.A(T),
		.B(Q),
		.Y(xorout),
	);
	$_DFFE_NN_ dff (
		.C(C),
		.D(xorout),
		.Q(Q),
		.E(E),
	);
endmodule