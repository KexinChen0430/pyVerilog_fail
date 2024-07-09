module __TFFSR_PNP_ (C, S, R, T, Q);
	input C, S, R, T;
	output wire Q;
	wire xorout;
	$_XOR_ xorgate (
		.A(T),
		.B(Q),
		.Y(xorout),
	);
	$_DFFSR_PNP_ dff (
		.C(C),
		.D(xorout),
		.Q(Q),
		.S(S),
		.R(R),
	);
endmodule