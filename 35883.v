module __TFFSR_NPP_ (C, S, R, T, Q);
	input C, S, R, T;
	output wire Q;
	wire xorout;
	$_XOR_ xorgate (
		.A(T),
		.B(Q),
		.Y(xorout),
	);
	$_DFFSR_NPP_ dff (
		.C(C),
		.D(xorout),
		.Q(Q),
		.S(S),
		.R(R),
	);
endmodule