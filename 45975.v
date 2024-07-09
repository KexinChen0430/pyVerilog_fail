module const_vector_multiplyT #(
	parameter C = 4,
	parameter R = C,
	parameter [R-1:0] VECTOR = 0
) (
	input [C*R-1:0] matrix,
	output [C-1:0] out
);
	`include "matrix.vh"
	const_vector_multiply #(R, VECTOR, C) u_mult(rotate_matrix(matrix), out);
endmodule