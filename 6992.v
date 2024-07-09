module testMUX4_UDP();
	// Inputs
	reg [3:0] in;
	reg [1:0] sel;
	// Outputs
	wire out;
	// Instantiate the DESIGN Under Test (DUT)
	MUX4 dut (
		.in(in),
		.sel(sel),
		.out(out)
	);
	initial begin
		$monitor(" in = %b sel = %b  out = %b",in,sel,out);
		// Initialize Inputs
		in = 4'b0000;
		sel = 2'b00;
		#5 in = 4'b0000; sel = 2'b00;
		#5 in = 4'b0001; sel = 2'b00;
		#5 in = 4'b0010; sel = 2'b01;
		#5 in = 4'b0100; sel = 2'b01;
		#5 in = 4'bXXX0; sel = 2'b00;
		#5 in = 4'b1X10; sel = 2'b11;
		#5 in = 4'b1101; sel = 2'b10;
		#5 in = 4'b1001; sel = 2'b10;
		#1  $finish;
	end
endmodule