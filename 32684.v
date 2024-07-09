module TEST_FA;
	// Inputs
	reg A;
	reg B;
	reg C;
	// Outputs
	wire F;
	// Instantiate the Unit Under Test (UUT)
	FA uut (
		.A(A),
		.B(B),
		.C(C),
		.F(F),
	);
	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		A = 0;
		B = 0;
		C = 1;
		// Wait 100 ns for global reset to finish
		#100;
		A = 0;
		B = 1;
		C = 0;
		// Wait 100 ns for global reset to finish
		#100;
		A = 0;
		B = 1;
		C = 1;
		// Wait 100 ns for global reset to finish
		#100;
		A = 1;
		B = 0;
		C = 0;
		// Wait 100 ns for global reset to finish
		#100;
		A = 1;
		B = 1;
		C = 0;
		// Wait 100 ns for global reset to finish
		#100;
		A = 1;
		B = 1;
		C = 1;
		// Wait 100 ns for global reset to finish
		#100;
	end
endmodule