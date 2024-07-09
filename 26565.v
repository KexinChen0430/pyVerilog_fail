module to be verified
	count4 uut (
		.clk(clk),
		.rst(rst),
		.en(en),
		.dir(dir),
		.cnt(cnt),
		.ovw(ovw)
	);
	// Generate clock signal
	initial
		begin
			clk = 1'b0;
			#100;     // Wait 100 ns for global reset to finish
			forever
				#50 clk = ~clk;	// 10 MHz clock signal
		end
	// Generate other input signals
	initial
		begin
			rst = 1'b0;  // set initial value of input signals
			en = 1'b0;
			dir = 1'b1;
			#100 rst = 1'b1;	// reset pulse begins after 100 ns
			@(negedge clk) rst = 1'b0;  // ends at next clk falling edge
			#200;		// wait 2 clock cycles
			en = 1'b1;	// enable the counter
			repeat(10)
				@(negedge clk);	// wait 10 clock cycles to see counting
			en = 1'b0;	// disable count
			#200 en = 1'b1;	// resume after 2 clock cycles
			wait (cnt == 4'd3);		// wait until count is 3
			@(negedge clk) dir = 1'b0;	// then change to down counting
			wait (cnt == 4'd0);	// wait until count gets to 0
			@(negedge clk)	en = 1'b0;	// then disable counting
			#200 en = 1'b1;		// enable again
			#300 rst = 1'b1;	// after 3 clock cycles, reset
			#100 dir = 1'b1;	// change direction while reset active
			#100 rst = 1'b0;	// normal operation again
			#200 dir = 1'b0;	// counting down again
			wait (cnt == 4'd0)  // wait for zero
			#350 dir = 1'b1;	// after 3.5 clock cycles, count up again
			wait (cnt == 4'd15)  // wait for max value
			@(negedge clk)	dir = 1'b0;	// then change direction
			#300;
			$stop;
		end
endmodule