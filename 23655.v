module edc_generator #() (
input   [31:0]  i_data,                  // Input data bus
input   [7:0]   i_ecc, // Input ECC (only relevant when write_enabled_i == 0)
input           i_write_enabled,         // Write enabled flag
output  [7:0]   o_ecc_syndrome           // Generated ecc (write_enabled_i == 1) or Syndrome (write_enabled_i == 0)
);
wire [31:0] parity_check_matrix[0:7];
wire [7:0] generated_ecc;
// Parity check matrix definition
generate
// Parity check matrix
	assign parity_check_matrix[7] = 40'b10101010_10101010_11000000_11000000;//10000000;
	assign parity_check_matrix[6] = 40'b01010101_01010101_00110000_00110000;//01000000;
	assign parity_check_matrix[5] = 40'b11111111_00000000_00001100_00001100;//00100000;
	assign parity_check_matrix[4] = 40'b00000000_11111111_00000011_00000011;//00010000;
	assign parity_check_matrix[3] = 40'b11000000_11000000_11111111_00000000;//00001000;
	assign parity_check_matrix[2] = 40'b00110000_00110000_00000000_11111111;//00000100;
	assign parity_check_matrix[1] = 40'b00001100_00001100_10101010_10101010;//00000010;
	assign parity_check_matrix[0] = 40'b00000011_00000011_01010101_01010101;//00000001;
endgenerate
// ECC computation
genvar r,c;
generate
	for (r=0; r<8; r=r+1) begin
		// Compute the ECC as the 'sum-product' of all elements of the row by the elements of the word
		// Product: logic AND; Sum (mod 2): logic XOR
		assign generated_ecc[r] = ( ^ ( parity_check_matrix[r] & i_data ));
		// Return either difference (XOR) between generated ecc and input ecc or just the generated one
		// depending if we are performing a READ operation (first case) or a WRITE (second case).
		assign o_ecc_syndrome[r] = i_write_enabled ? generated_ecc[r] : generated_ecc[r] ^ i_ecc[r];
	end
endgenerate
endmodule