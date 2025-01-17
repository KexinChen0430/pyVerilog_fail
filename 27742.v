module rcswitch_test;
	reg in;
	initial begin
		#0 	 in = 1;
		// Garbage
		#30	 in = 1;	// 1000 - 1
		#10	 in = 0;
		#22	 in = 1;	// 1000
		#10	 in = 0;
		#30	 in = 1;	// 1000 - 2
		#10	 in = 0;
		#30	 in = 1;	// 1000
		#11	 in = 0;
		// Sync 10000000_00000000_00000000_00000000
		#30	 in = 1;	// 1000 - 1
		#10	 in = 0;
		#30	 in = 0;	// 0000
		#30	 in = 0;
		#10	 in = 0;	// 0000 - 2
		#30	 in = 0;
		#10	 in = 0;	// 0000
		#30	 in = 0;
		#10	 in = 0;	// 0000 - 3
		#30	 in = 0;
		#10	 in = 0;	// 0000
		#30	 in = 0;
		#10	 in = 0;	// 0000 - 4
		#30	 in = 0;
		#10	 in = 0;	// 0000
		#30	 in = 0;
		// Address 10001000_10001000_10001000_10001000_10001000
		#10	 in = 1;	// 1000 - 1
		#18	 in = 0;
		#30	 in = 1;	// 1000
		#08	 in = 0;
		#30	 in = 1;	// 1000 - 2
		#10	 in = 0;
		#25	 in = 1;	// 1000
		#10	 in = 0;
		#30	 in = 1;	// 1000 - 3
		#10	 in = 0;
		#22	 in = 1;	// 1000
		#10	 in = 0;
		#30	 in = 1;	// 1000 - 4
		#10	 in = 0;
		#30	 in = 1;	// 1000
		#11	 in = 0;
		#30	 in = 1;	// 1000 - 5
		#10	 in = 0;
		#30	 in = 1;	// 1000
		#10	 in = 0;
		// Channel 10001000_10001110_10001110_10001110_10001110
		#30	 in = 1;	// 1000 - 1
		#17	 in = 0;
		#30	 in = 1;	// 1000
		#10	 in = 0;
		#30	 in = 1;	// 1000 - 2
		#10	 in = 0;
		#30	 in = 1;	// 1110
		#30	 in = 0;
		#10	 in = 1;	// 1000 - 3
		#10	 in = 0;
		#30	 in = 1;	// 1110
		#30	 in = 0;
		#10	 in = 1;	// 1000 - 4
		#10	 in = 0;
		#30	 in = 1;	// 1110
		#30	 in = 0;
		#10	 in = 1;	// 1000 - 5
		#10	 in = 0;
		#30	 in = 1;	// 1110
		#30	 in = 0;
		// Stat 10001110_10001000
		#10	 in = 1;	// 1000 - 1
		#10	 in = 0;
		#30	 in = 1;	// 1110
		#30	 in = 0;
		#10	 in = 1;	// 1000 - 2
		#10	 in = 0;
		#30	 in = 1;	// 1000
		#10	 in = 0;
		// Sync 10000000_00000000_00000000_00000000
		#30	 in = 1;	// 1000 - 1
		#10	 in = 0;
		#30	 in = 0;	// 0000
		#30	 in = 0;
		#10	 in = 0;	// 0000 - 2
		#30	 in = 0;
		#10	 in = 0;	// 0000
		#30	 in = 0;
		#10	 in = 0;	// 0000 - 3
		#30	 in = 0;
		#10	 in = 0;	// 0000
		#30	 in = 0;
		#10	 in = 0;	// 0000 - 4
		#30	 in = 0;
		#10	 in = 0;	// 0000
		#30	 in = 0;
		#100 $finish;
	end
	// clock
	reg clk = 0;
	always #1 clk = !clk;
	wire [31:0] count_h;
	wire [31:0] count_l;
	wire detected;
	tri_state_detect tsd_inst (
		.clk(clk),
		.rst(1'b0),
		.in(in),
		.count_h(count_h),
		.count_l(count_l),
		.detected(detected)
	);
	initial
	begin
    	$dumpfile("rcswitch_pt.vcd");
		$dumpvars(0, tsd_inst);
	end
	always @(posedge detected) begin
		$display("Pulse with H=%d, L=%d detected.", count_h, count_l);
	end
endmodule