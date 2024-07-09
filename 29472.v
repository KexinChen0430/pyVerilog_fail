module testbench;
	reg clk;
	reg clk184;
	reg ce;
	reg rstn;
	reg load;
	reg [7:0] inbyte;
	wire busy;
	utx utx0(
		.clk(clk),
		.rstn(rstn),
		.inbyte(inbyte),
		.load(load),
		.busy(busy)
	);
	initial begin
		$dumpvars(0, testbench);
		clk = 0;
		rstn = 0;
		load = 0;
		inbyte = 8'h55;
		# 10
		rstn = 1;
		# 10
		load = 1;
		# 10
		load = 0;
		#8700
		inbyte = 8'haa;
		load = 1;
		# 10
		load = 0;
		#100000 $finish;
	end
	always #5 clk = ~clk;
endmodule