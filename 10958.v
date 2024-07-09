module rcswitch_test;
	reg [39:0] addr;
	reg [39:0] chan;
	reg [15:0] stat;
	reg send;
	initial begin
		#0   addr = 40'b10001000_10001000_10001000_10001000_10001000;	// 11111
		#0   chan = 40'b10001000_10001110_10001110_10001110_10001110; 	// 0FFFF = A
		#0   stat = 16'b10001110_10001000;								// F0 = ON
		#2   send = 1;
		#100 send = 0;
		#300 $finish;
	end
	// clock
	reg clk = 0;
	always #1 clk = !clk;
	wire ready;
	wire out;
	rcswitch_send rcswitch_send_inst (
		.clk(clk),
		.rst(1'b0),
		.send(send),
		.addr(addr),
		.chan(chan),
		.stat(stat),
		.ready(ready),
		.out(out)
	);
	initial
	begin
    	$dumpfile("rcswitch_send.vcd");
		$dumpvars(0, rcswitch_send_inst);
	end
endmodule