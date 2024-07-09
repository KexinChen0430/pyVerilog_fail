module Terminal(
	dout,
	din,
	address,
	size,
	read_write,
	enable,
	interrupt,
	reset,
	clk
);
	`include "definition/Definition.v"
	output	reg			[WORD-1:0]								dout;
	input	wire		[WORD-1:0]								din;
	input	wire		[WORD-1:0]								address;
	input	wire		[LOGWORDBYTE-1:0]						size;
	input	wire												read_write;
	input	wire												enable;
	output	reg													interrupt;
	input														reset;
	input														clk;
	// negate the clock for signal stability
	always @(negedge clk) begin
		$terminal(dout, din, address, size, read_write, enable, interrupt);
	end
endmodule