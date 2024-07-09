module rcswitch_test;
	reg in;
	initial begin
		#0 	 in = 0;
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
		#10	 in = 0;
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
		#11	 in = 0;
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
		// Garbage
		#30	 in = 1;	// 1000 - 1
		#10	 in = 0;
		#22	 in = 1;	// 1000
		#10	 in = 0;
		#30	 in = 1;	// 1000 - 2
		#10	 in = 0;
		#30	 in = 1;	// 1000
		#11	 in = 0;
		#100 $finish;
	end
	// clock
	reg clk = 0;
	always #1 clk = !clk;
	wire [39:0] addr;
	wire [39:0] chan;
	wire [15:0] stat;
	wire ready;
	rcswitch_receive rcswitch_receive_inst (
		.clk(clk),
		.rst(1'b0),
		.in(in),
		.addr(addr),
		.chan(chan),
		.stat(stat),
		.ready(ready)
	);
	initial
	begin
    	$dumpfile("rcswitch_receive.vcd");
		$dumpvars(0, rcswitch_receive_inst);
	end
	always @(posedge ready) begin
		$display("RECEIVED:");
		$display(" addr=%b", addr);
		$display(" chan=%b", chan);
		$display(" stat=%b", stat);
/*
		if(addr == 40'h8888888888) begin
			$display("MATCH: addr");
		end
		if(chan == 40'h888E8E8E8E) begin
			$display("MATCH: chan");
		end
		if(stat == 16'h8E88) begin
			$display("MATCH: stat");
		end
*/
	end
endmodule