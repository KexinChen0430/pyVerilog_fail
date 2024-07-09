module nonzero_cla #(
	parameter N = 7,
	parameter W = 1
) (
	input [N-1:0] in,
	output out
);
	neq_cla #(N, 0, W) u_cla(in, out);
endmodule