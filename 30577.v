module Comparator_tf;
	// Inputs
	reg clock;
	reg [63:0] data;
	reg [63:0] key;
	// Outputs
	wire match;
	// Instantiate the Unit Under Test (UUT)
	Comparator uut (
		.clock(clock),
		.data(data),
		.key(key),
		.match(match)
	);
	initial begin
		clock = 0;
		repeat (1_000_000)
			#1 clock =~ clock;
	end
	initial begin
		// Initialize 64-bit data and a template of the same 64-bit data.
		// Expect: match = 1
		data = 64'b0010000011000111101000010111011010101010111110100110100111100111;
		key  = 64'b0010000011000111101000010111011010101010111110100110100111100111;
		@(posedge clock);
		// Change template to a different 64-bit data.
		// Expect: match = 0
		@(negedge clock) key = 64'b0010000011000110101000010111011010101010111110100110100111100111;
		// Change template to a smaller size.
		// Expect: match = 0
		@(negedge clock) key = 6'b001000;
		// Change data to same size as template and same data.
		// Expect: match = 1
		@(negedge clock) data = 6'b001000;
		// Change the data of same size to different data.
		// Expect: match = 0
		@(negedge clock) data = 6'b001100;
	end
endmodule