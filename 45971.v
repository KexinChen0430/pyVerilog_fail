module matrix_vector_multiplyT #(
	parameter C = 4,
	parameter R = C
) (
	input [R*C-1:0] matrix,
	input [R-1:0] vector,
	output [C-1:0] out
);
	`include "matrix.vh"
	matrix_vector_multiply #(R, C) u_mult(rotate_matrix(matrix), vector, out);
endmodule