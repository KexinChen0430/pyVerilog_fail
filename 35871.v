module __TFFE_PP_ (T, C, E, Q);
	input T, C, E;
	output wire Q;
	wire xorout;
	$_XOR_ xorgate (
		.A(T),
		.B(Q),
		.Y(xorout),
	);
	$_DFFE_PP_ dff (
		.C(C),
		.D(xorout),
		.Q(Q),
		.E(E),
	);
endmodule