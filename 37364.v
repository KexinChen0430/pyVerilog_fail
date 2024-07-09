module boothMultiplierTest;
	// Inputs
	reg [3:0] multiplicand;
	reg [3:0] multiplier;
	reg clock;
	reg reset;
	// Outputs
	wire [7:0] product;
	// Instantiate the Unit Under Test (UUT)
	boothMultiplier uut (
		.multiplicand(multiplicand),
		.multiplier(multiplier),
		.product(product),
		.clock(clock),
		.reset(reset)
	);
	initial begin
		// Initialize Inputs
		clock = 0;
		multiplicand = 3;
		multiplier = 2;
		reset = 1;
		#10
		reset=0;
		#40
		multiplicand = 7;
		multiplier = 7;
		reset = 1;
		#10
		reset=0;
		#40
		$stop;
	end
	always
		begin
			clock = !clock;
			#5;
		end
endmodule