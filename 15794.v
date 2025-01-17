module
	reg [9:0] x_bin; //binary value of input
	reg start;
	wire done;
	wire [9:0] z_bin; //binary value of output
	reg [9:0] expected_z; //expected output
	reg clk;
	reg reset;
	ReSC_wrapper_paper_example ReSC (
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
		#2 x_bin = 10'd510;
		expected_z = 10'd512;
		start = 0;
		#2054 x_bin = 10'd84;
		expected_z = 10'd339;
		start = 0;
		#2054 x_bin = 10'd858;
		expected_z = 10'd626;
		start = 0;
		#2054 x_bin = 10'd1;
		expected_z = 10'd257;
		start = 0;
		#2054 x_bin = 10'd632;
		expected_z = 10'd537;
		start = 0;
		#2054 x_bin = 10'd623;
		expected_z = 10'd534;
		start = 0;
		#2054 x_bin = 10'd1018;
		expected_z = 10'd761;
		start = 0;
		#2054 x_bin = 10'd675;
		expected_z = 10'd548;
		start = 0;
		#2054 x_bin = 10'd450;
		expected_z = 10'd500;
		start = 0;
		#2054 x_bin = 10'd426;
		expected_z = 10'd495;
		start = 0;
		#2054 x_bin = 10'd644;
		expected_z = 10'd539;
		start = 0;
		#2068 $stop;
	end
	always @(posedge done) begin
		$display("x: %b, z: %b, expected_z: %b", x_bin, z_bin, expected_z);
		start = 1;
	end
endmodule