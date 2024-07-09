module compact_const_matrix_multiply #(
	parameter C = 4,
	parameter R = C,
	parameter [C+R-2:0] MATRIX = 0
) (
	input [C-1:0] vector,
	output [R-1:0] out
);
	`include "matrix.vh"
	const_matrix_multiply #(.C(R), .MATRIX(expand_matrix(MATRIX)), .R(C)) u_mult(vector, out);
endmodule