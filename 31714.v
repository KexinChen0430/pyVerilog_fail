module \$__XILINX_RAMB36_TDP (CLK2, CLK3, A1ADDR, A1DATA, A1EN, B1ADDR, B1DATA, B1EN);
	parameter CFG_ABITS = 10;
	parameter CFG_DBITS = 36;
	parameter CFG_ENABLE_B = 4;
	parameter CLKPOL2 = 1;
	parameter CLKPOL3 = 1;
	parameter [36863:0] INIT = 36864'bx;
	input CLK2;
	input CLK3;
	input [CFG_ABITS-1:0] A1ADDR;
	output [CFG_DBITS-1:0] A1DATA;
	input A1EN;
	input [CFG_ABITS-1:0] B1ADDR;
	input [CFG_DBITS-1:0] B1DATA;
	input [CFG_ENABLE_B-1:0] B1EN;
	wire [15:0] A1ADDR_16 = A1ADDR << (15 - CFG_ABITS);
	wire [15:0] B1ADDR_16 = B1ADDR << (15 - CFG_ABITS);
	wire [7:0] B1EN_8 = B1EN;
	wire [3:0] DIP, DOP;
	wire [31:0] DI, DO;
	wire [31:0] DOBDO;
	wire [3:0] DOPBDOP;
	assign A1DATA = { DOP[3], DO[31:24], DOP[2], DO[23:16], DOP[1], DO[15: 8], DOP[0], DO[ 7: 0] };
	assign { DIP[3], DI[31:24], DIP[2], DI[23:16], DIP[1], DI[15: 8], DIP[0], DI[ 7: 0] } = B1DATA;
	generate if (CFG_DBITS > 8) begin
		RAMB36E1 #(
			.RAM_MODE("TDP"),
			.READ_WIDTH_A(CFG_DBITS),
			.READ_WIDTH_B(CFG_DBITS),
			.WRITE_WIDTH_A(CFG_DBITS),
			.WRITE_WIDTH_B(CFG_DBITS),
			.WRITE_MODE_A("READ_FIRST"),
			.WRITE_MODE_B("READ_FIRST"),
			.IS_CLKARDCLK_INVERTED(!CLKPOL2),
			.IS_CLKBWRCLK_INVERTED(!CLKPOL3),
			`include "brams_init_36.vh"
			.SIM_DEVICE("7SERIES")
		) _TECHMAP_REPLACE_ (
			.DIADI(32'd0),
			.DIPADIP(4'd0),
			.DOADO(DO[31:0]),
			.DOPADOP(DOP[3:0]),
			.ADDRARDADDR(A1ADDR_16),
			.CLKARDCLK(CLK2),
			.ENARDEN(A1EN),
			.REGCEAREGCE(|1),
			.RSTRAMARSTRAM(|0),
			.RSTREGARSTREG(|0),
			.WEA(4'b0),
			.DIBDI(DI),
			.DIPBDIP(DIP),
			.DOBDO(DOBDO),
			.DOPBDOP(DOPBDOP),
			.ADDRBWRADDR(B1ADDR_16),
			.CLKBWRCLK(CLK3),
			.ENBWREN(|1),
			.REGCEB(|0),
			.RSTRAMB(|0),
			.RSTREGB(|0),
			.WEBWE(B1EN_8)
		);
	end else begin
		RAMB36E1 #(
			.RAM_MODE("TDP"),
			.READ_WIDTH_A(CFG_DBITS),
			.READ_WIDTH_B(CFG_DBITS),
			.WRITE_WIDTH_A(CFG_DBITS),
			.WRITE_WIDTH_B(CFG_DBITS),
			.WRITE_MODE_A("READ_FIRST"),
			.WRITE_MODE_B("READ_FIRST"),
			.IS_CLKARDCLK_INVERTED(!CLKPOL2),
			.IS_CLKBWRCLK_INVERTED(!CLKPOL3),
			`include "brams_init_32.vh"
			.SIM_DEVICE("7SERIES")
		) _TECHMAP_REPLACE_ (
			.DIADI(32'd0),
			.DIPADIP(4'd0),
			.DOADO(DO[31:0]),
			.DOPADOP(DOP[3:0]),
			.ADDRARDADDR(A1ADDR_16),
			.CLKARDCLK(CLK2),
			.ENARDEN(A1EN),
			.REGCEAREGCE(|1),
			.RSTRAMARSTRAM(|0),
			.RSTREGARSTREG(|0),
			.WEA(4'b0),
			.DIBDI(DI),
			.DIPBDIP(DIP),
			.DOBDO(DOBDO),
			.DOPBDOP(DOPBDOP),
			.ADDRBWRADDR(B1ADDR_16),
			.CLKBWRCLK(CLK3),
			.ENBWREN(|1),
			.REGCEB(|0),
			.RSTRAMB(|0),
			.RSTREGB(|0),
			.WEBWE(B1EN_8)
		);
	end endgenerate
endmodule