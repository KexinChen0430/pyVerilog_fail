module compact_const_vector_multiply #(
	parameter C = 4,
	parameter [C-1:0] VECTOR = 0,
	parameter R = C
) (
	input [C+R-2:0] matrix,
	output [R-1:0] out
);
	`include "matrix.vh"
	const_vector_multiply #(R, VECTOR, C) u_mult(expand_matrix(matrix), out);
endmodule