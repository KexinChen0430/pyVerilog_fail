module p24_tb();
	reg clk, reset;
	wire [7:0] count;
	jerk_ct device(count, clk, reset);
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	initial begin
		reset = 0;
		reset = 1;
		#10 reset = 0;
		$dumpfile("p24a.vcd");
		$dumpvars(0, device);
		fork
			#201 reset = 1;
			#205 reset = 0;
			#300 reset = 1;
			#320 reset = 0;
			#500 $finish;
		join
	end
endmodule