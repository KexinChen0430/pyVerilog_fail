module eq_cla #(
	parameter N = 7,
	parameter [N-1:0] CONST = 0,
	parameter W = 1
) (
	input [N-1:0] in,
	output out
);
	compare_cla #(N, CONST, 1, W) u_cla(in, out);
endmodule