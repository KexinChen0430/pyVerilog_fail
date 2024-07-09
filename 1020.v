module testREG32;
	// Inputs
	reg [31:0] in;
	reg clk;
	reg R;
	// Outputs
	wire [31:0] out;
	// Instantiate the DESIGN Under Test (DUT)
	REG32 dut (
		.in(in),
		.clk(clk),
		.R(R),
		.out(out)
	);
	always begin
	clk = 0;
	#100;
	clk = 1;
	#100;
	end
	initial begin
		// Initialize Inputs
		in = 0;
		R = 1;
		// Wait 100 ns for global reset to finish
		#50
		#300;
		R = 0;
		in=32'hEEEEEEEE	;
		#300;
		in=32'hEE0E5EA0	;
		#300;
		in=32'hEEEE5EEE	;
		#300;
		R = 1;
		in=32'h000050A0	;
		#300;
		in=32'hEE3EEEEE	;
		#300;
		R = 0;
		in=32'h0AB000A0	;
		#300;
		in=32'hEE0E5EEE	;
		#300;
		in=32'h0AB000B0	;
		#300;
		R=1;
		in=32'hEE0E5EAE	;
		#300;
		R=0;
		in=32'hEA003070	;
		#300;
		in=32'h100200E5	;
		#300;
		in=32'hD0D020E0	;
		#300;
		in=32'h0607A061	;
		#300;
		in=32'h09005E00	;
		// Add stimulus here
	end
endmodule