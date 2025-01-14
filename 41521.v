module
	reg [11:0] x_1_bin; //binary value of input 1
	reg [11:0] x_2_bin; //binary value of input 2
	reg [11:0] x_3_bin; //binary value of input 3
	reg start;
	wire done;
	wire [11:0] z_bin; //binary value of output
	reg [11:0] expected_z; //expected output
	reg clk;
	reg reset;
	MReSC_wrapper_example ReSC (
		.x_1_bin (x_1_bin),
		.x_2_bin (x_2_bin),
		.x_3_bin (x_3_bin),
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
		#2
		x_1_bin = 12'd1874;
		x_2_bin = 12'd2842;
		x_3_bin = 12'd1226;
		expected_z = 12'd2134;
		start = 0;
		#8198
		x_1_bin = 12'd433;
		x_2_bin = 12'd1026;
		x_3_bin = 12'd2237;
		expected_z = 12'd2408;
		start = 0;
		#8198
		x_1_bin = 12'd4010;
		x_2_bin = 12'd3347;
		x_3_bin = 12'd1641;
		expected_z = 12'd2290;
		start = 0;
		#8198
		x_1_bin = 12'd808;
		x_2_bin = 12'd3270;
		x_3_bin = 12'd1757;
		expected_z = 12'd1792;
		start = 0;
		#8198
		x_1_bin = 12'd1750;
		x_2_bin = 12'd1646;
		x_3_bin = 12'd3535;
		expected_z = 12'd2292;
		start = 0;
		#8198
		x_1_bin = 12'd3402;
		x_2_bin = 12'd3455;
		x_3_bin = 12'd1332;
		expected_z = 12'd2499;
		start = 0;
		#8198
		x_1_bin = 12'd989;
		x_2_bin = 12'd1453;
		x_3_bin = 12'd1048;
		expected_z = 12'd2361;
		start = 0;
		#8198
		x_1_bin = 12'd1365;
		x_2_bin = 12'd3676;
		x_3_bin = 12'd1649;
		expected_z = 12'd1732;
		start = 0;
		#8198
		x_1_bin = 12'd2588;
		x_2_bin = 12'd1242;
		x_3_bin = 12'd3022;
		expected_z = 12'd2096;
		start = 0;
		#8198
		x_1_bin = 12'd2730;
		x_2_bin = 12'd1219;
		x_3_bin = 12'd861;
		expected_z = 12'd2050;
		start = 0;
		#8198
		x_1_bin = 12'd2094;
		x_2_bin = 12'd2070;
		x_3_bin = 12'd726;
		expected_z = 12'd2235;
		start = 0;
		#8212 $stop;
	end
	always @(posedge done) begin
		$display("x: %b, %b, %b, z: %b, expected_z: %b",x_1_bin, x_2_bin, x_3_bin, z_bin, expected_z);
		start = 1;
	end
endmodule