module Memory(
	dout,
	din,
	address,
	size,
	read_write,
	enable,
	clk,
	reset
);
	`include "definition/Definition.v"
	parameter	MFILE		= BLANKFILE;
	output				[WORD-1:0]								dout;
	input				[WORD-1:0]								din;
	input				[WORD-1:0]								address;
	input				[LOGWORDBYTE-1:0]						size;
	input														read_write;
	input														enable;
	input														clk;
	input														reset;
			wire		[WORD-1:0]								dout0;
			wire		[WORD-1:0]								dout1;
	wire[WORD-1:0] xaddress;
	assign xaddress = address;
	assign dout = xaddress[9]==0 ? dout0 : dout1;
	RAMB16_S36 #(
		.INIT(36'h000000000),
		.SRVAL(36'h000000000),
		.WRITE_MODE("READ_FIRST")
	) RAMB16_S36_inst0 (
		.DO(dout0),										// 32-bit Data Output
		.DOP(),											// 4-bit parity Output
		.ADDR(xaddress[8:0]),							// 9-bit Address Input
		.CLK(clk),										// Clock
		.DI(din),										// 32-bit Data Input
		.DIP(4'b0000),									// 4-bit parity Input
		.EN(enable && (xaddress[9]==0)),				// RAM Enable Input
		.SSR(0),										// Synchronous Set/Reset Input
		.WE((read_write == WRITE) && (xaddress[9]==0))	// Write Enable Input
	);
	RAMB16_S36 #(
		.INIT(36'h000000000),
		.SRVAL(36'h000000000),
		.WRITE_MODE("READ_FIRST")
	) RAMB16_S36_inst1 (
		.DO(dout1),										// 32-bit Data Output
		.DOP(),											// 4-bit parity Output
		.ADDR(xaddress[8:0]),							// 9-bit Address Input
		.CLK(clk),										// Clock
		.DI(din),										// 32-bit Data Input
		.DIP(4'b0000),									// 4-bit parity Input
		.EN(enable && (xaddress[9]==1)),				// RAM Enable Input
		.SSR(0),										// Synchronous Set/Reset Input
		.WE((read_write == WRITE) && (xaddress[9]==1))	// Write Enable Input
	);
endmodule