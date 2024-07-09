module compact_matrix_vector_multiply #(
	parameter C = 4,
	parameter R = C
) (
	input [C+R-2:0] matrix,
	input [C-1:0] vector,
	output [R-1:0] out
);
	`include "matrix.vh"
	matrix_vector_multiply #(C, R) u_mult(expand_matrix(matrix), vector, out);
endmodule