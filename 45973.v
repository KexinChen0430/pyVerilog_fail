module const_matrix_multiplyT #(
	parameter C = 4,
	parameter R = C,
	parameter [R*C-1:0] MATRIX = 0
) (
	input [C-1:0] vector,
	output [R-1:0] out
);
	`include "matrix.vh"
	const_matrix_multiply #(.C(R), .MATRIX(rotate_matrix(MATRIX)), .R(C)) u_mult(vector, out);
endmodule