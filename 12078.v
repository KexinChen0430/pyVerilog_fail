module at the start
	 */
	always begin
		// Clock frequency is arbitrarily chosen
		#5 clk = 0;
		#5 clk = 1;
		// Period = 10 ns
	end
	/**
	 */
	initial
	begin
		// "$time" indicates the current time in the simulation
		$display(" << Starting the simulation >>");
		// @t=0,
		ip = 2'd0;
		rst = 1'd0;
		// @t=9,
		#9
		ip = 2'd1;
		rst = 1'd0;
		// @t=19,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=29,
		#10
		ip = 2'd2;
		rst = 1'd0;
		// @t=39,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=49,
		#10
		ip = 2'd3;
		rst = 1'd0;
		// @t=59,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=69,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=79,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=89,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=99,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=109,
		#10
		ip = 2'd3;
		rst = 1'd0;
		// @t=119,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=129,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=139,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=149,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=159,
		#10
		ip = 2'd2;
		rst = 1'd0;
		// @t=169,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=179,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=189,
		#10
		ip = 2'd2;
		rst = 1'd0;
		// @t=199,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=209,
		#10
		ip = 2'd3;
		rst = 1'd0;
		// @t=219,
		#10
		ip = 2'd3;
		rst = 1'd0;
		// @t=229,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=239,
		#10
		ip = 2'd2;
		rst = 1'd0;
		// @t=249,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=259,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=269,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=279,
		#10
		ip = 2'd2;
		rst = 1'd1;
		// @t=289,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=299,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=309,
		#10
		ip = 2'd2;
		rst = 1'd0;
		// @t=319,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=329,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=339,
		#10
		ip = 2'd2;
		rst = 1'd0;
		// @t=349,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=359,
		#10
		ip = 2'd3;
		rst = 1'd0;
		// @t=369,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=379,
		#10
		ip = 2'd2;
		rst = 1'd0;
		// @t=389,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=399,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=409,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=419,
		#10
		ip = 2'd2;
		rst = 1'd0;
		// @t=429,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=439,
		#10
		ip = 2'd3;
		rst = 1'd0;
		// @t=449,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=459,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=469,
		#10
		ip = 2'd2;
		rst = 1'd0;
		// @t=479,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=489,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=499,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=509,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=519,
		#10
		ip = 2'd2;
		rst = 1'd0;
		// @t=529,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=539,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=549,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=559,
		#10
		ip = 2'd3;
		rst = 1'd0;
		// @t=569,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=579,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=589,
		#10
		ip = 2'd0;
		rst = 1'd0;
		// @t=599,
		#10
		ip = 2'd1;
		rst = 1'd0;
		// @t=609,
		#10
		ip = 2'd0;
		rst = 1'd0;
		#20;
		$display(" << Finishing the simulation >>");
		$finish;
	end
endmodule