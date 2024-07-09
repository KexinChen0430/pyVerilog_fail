module hexToSSEG_tb;
	// Inputs
	reg [3:0] hex;
	reg dp;
	// Outputs
	wire [7:0] sseg;
	// Instantiate the Unit Under Test (UUT)
	hex_to_sseg uut (
		.hex(hex),
		.sseg(sseg),
		.dp(dp)
	);
	initial begin
		// Initialize Inputs
		hex = 0;
		dp = 0;
		// Wait 100 ns for global reset to finish
		#100 hex = 1;
		#200 hex = 3;
		// Add stimulus here
		#400 $finish;
	end
endmodule