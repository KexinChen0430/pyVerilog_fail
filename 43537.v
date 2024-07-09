module RAMB4_S2 (
    CLK,
    RST,
    ADDR,
    DI,
    EN,
    WE,
    DO,
);
parameter dw = 2;
parameter aw = 11;
input CLK, RST, EN, WE;
input [dw-1:0] DI;
output [dw-1:0] DO;
input [aw-1:0] ADDR;
reg	[dw-1:0]	mem [(1<<aw)-1:0];	// RAM content
reg	[aw-1:0]	addr_reg;		// RAM address register
// Data output drivers
assign DO = mem[addr_reg][dw-1:0];
// RAM address register
always @(posedge CLK or posedge RST)
    if ( RST == 1'b1 )
        addr_reg <= #1 {aw{1'b0}};
    else if ( EN )
        addr_reg <= #1 ADDR;
// RAM write
always @(posedge CLK)
	if (EN && WE)
		mem[ADDR] <= #1 DI;
endmodule