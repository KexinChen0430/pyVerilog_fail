module hw2problem3Test;
	reg X, RESET, CLOCK;
	wire Y;
	wire [1:0] CurrentState;
	hw2problem3 uut(X, Y, RESET, CLOCK, CurrentState);
	always #5 CLOCK = ~CLOCK;
	initial begin
		CLOCK = 0; RESET = 0; X = 0; #1;
		RESET = 1; #13;	// Start at 00
		X = 1; #10;	// Go to 01
		X = 1; #10;	// Go to 11
		X = 1; #10;	// Go to 10
		X = 1; #10;	// Stay at 10
		X = 0; #10;	// Go to 00
		X = 0; #10; // Stay at 00
		X = 1; #10; // Go to 01
		X = 0; #10; // Go to 00
		X = 1; #10; // Go to 01
		X = 1; #10; // Go to 11
		X = 0; #10; // Go to 00
		X = 1; #7;	// Go to 01
		RESET = 0; #10	// Reset to 00 asynchronously
		$stop;
	end
endmodule