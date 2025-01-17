module
	reg [5:0] x_bin; //binary value of input
	reg start;
	wire done;
	wire [9:0] z_bin; //binary value of output
	reg [9:0] expected_z; //expected output
	reg clk;
	reg reset;
	ReSC_wrapper_varied_bin_lengths_test ReSC (
		.x_bin (x_bin),
		.start (start),
		.done (done),
		.z_bin (z_bin),
		.clk (clk),
		.reset (reset)
	);
	always begin
		#1 clk <= ~clk;
	end
	initial begin
		clk = 0;
		reset = 1;
		#1 reset = 0;
		start = 1;
		#2 x_bin = 6'd45;
		expected_z = 10'd578;
		start = 0;
		#2054 x_bin = 6'd1;
		expected_z = 10'd107;
		start = 0;
		#2054 x_bin = 6'd63;
		expected_z = 10'd811;
		start = 0;
		#2054 x_bin = 6'd4;
		expected_z = 10'd137;
		start = 0;
		#2054 x_bin = 6'd20;
		expected_z = 10'd273;
		start = 0;
		#2054 x_bin = 6'd59;
		expected_z = 10'd763;
		start = 0;
		#2054 x_bin = 6'd15;
		expected_z = 10'd226;
		start = 0;
		#2054 x_bin = 6'd4;
		expected_z = 10'd134;
		start = 0;
		#2054 x_bin = 6'd40;
		expected_z = 10'd506;
		start = 0;
		#2054 x_bin = 6'd16;
		expected_z = 10'd231;
		start = 0;
		#2054 x_bin = 6'd54;
		expected_z = 10'd702;
		start = 0;
		#2068 $stop;
	end
	always @(posedge done) begin
		$display("x: %b, z: %b, expected_z: %b", x_bin, z_bin, expected_z);
		start = 1;
	end
endmodule