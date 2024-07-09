module __TFF_N_ (T, C, Q);
	input T, C;
	output wire Q;
	wire xorout;
	$_XOR_ xorgate (
		.A(T),
		.B(Q),
		.Y(xorout),
	);
	$_DFF_N_ dff (
		.C(C),
		.D(xorout),
		.Q(Q),
	);
endmodule