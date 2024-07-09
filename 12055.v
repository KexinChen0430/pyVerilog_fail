module binary_to_BCD_fourteen_bit_tb;
	// Inputs
	reg [13:0] in;
	// Outputs
	wire [3:0] ones;
	wire [3:0] tens;
	wire [3:0] hundreds;
	wire [3:0] thousands;
	// Instantiate the Unit Under Test (UUT)
	binary_to_BCD_fourteen_bit uut (
		.in(in),
		.ones(ones),
		.tens(tens),
		.hundreds(hundreds),
		.thousands(thousands)
	);
	initial begin
		// Initialize Inputs
		in = 0;
		for (in =0;in< 10000;in = in +1) begin
		#10
		$display(" in = %d thousands = %d hundreds = %d tens = %d ones = %d",in, thousands, hundreds, tens, ones);
		end
	end
endmodule