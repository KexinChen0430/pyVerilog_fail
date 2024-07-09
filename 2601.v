module DPR16X4(
	input [3:0] RAD, DI, WAD,
	input WRE, WCK,
	output [3:0] DO
);
	parameter INITVAL = "0x0000000000000000";
`include "parse_init.vh"
	localparam [63:0] parsed_init = parse_init_64(INITVAL);
	reg [3:0] mem[0:15];
	integer i;
	initial begin
		for (i = 0; i < 15; i++)
			mem[i] = parsed_init[i * 4 +: 4];
	end
	always @(posedge WCK)
		if (WRE)
			mem[WAD] <= DI;
	assign DO = mem[RAD];
endmodule