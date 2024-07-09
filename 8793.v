module testbench;
	reg clk;
	reg rstn;
	reg datain_ch0;
	reg datain_ch1;
	reg datain_ch2;
	reg datain_ch3;
	integer i;
	wire serialout;
	wire testout0;
	wire testout1;
	wire testout2;
	wire testout3;
	root test_root(
		.clk(clk),
		.rstn(rstn),
		.datain_ch0(datain_ch0),
		.datain_ch1(datain_ch1),
		.datain_ch2(datain_ch2),
		.datain_ch3(datain_ch3),
		.serialout(serialout),
		.testout0(testout0),
		.testout1(testout1),
		.testout2(testout2),
		.testout3(testout3)
	);
	initial begin
		$dumpvars(0, testbench);
		clk = 0;
		rstn = 0;
		datain_ch0 = 0;
		datain_ch1 = 0;
		datain_ch2 = 0;
		datain_ch3 = 0;
		#10
		rstn = 1;
		#5000000
		datain_ch1 = 1;
		#1090
		datain_ch0 = 1;
		#610
		datain_ch0 = 0;
		#8300
		datain_ch1 = 0;
		//datain_ch0 = 1;
		//#2
		//datain_ch0 = 0;
		#10000000 $finish;
	end
	always #5 clk = ~clk;
endmodule