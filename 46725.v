module syndrome_expand_method2 #(
	parameter [`BCH_PARAM_SZ-1:0] P = `BCH_SANE,
	parameter DAT = 0
) (
	input [`BCH_M(P)-1:0] in,
	output [`BCH_M(P)-1:0] out
);
	localparam M = `BCH_M(P);
	/* Perform b_j(alpha^j) */
	parallel_standard_power #(M, DAT) u_power(
		.standard_in(in),
		.standard_out(out)
	);
endmodule