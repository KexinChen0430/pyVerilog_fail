module __TFF_P_ (T, C, Q);
	input T, C;
	output wire Q;
	wire xorout;
	$_XOR_ xorgate (
		.A(T),
		.B(Q),
		.Y(xorout),
	);
	$_DFF_P_ dff (
		.C(C),
		.D(xorout),
		.Q(Q),
	);
endmodule