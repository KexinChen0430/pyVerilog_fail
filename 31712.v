module \$__XILINX_RAMB36_SDP (CLK2, CLK3, A1ADDR, A1DATA, A1EN, B1ADDR, B1DATA, B1EN);
	parameter CLKPOL2 = 1;
	parameter CLKPOL3 = 1;
	parameter [36863:0] INIT = 36864'bx;
	input CLK2;
	input CLK3;
	input [8:0] A1ADDR;
	output [71:0] A1DATA;
	input A1EN;
	input [8:0] B1ADDR;
	input [71:0] B1DATA;
	input [7:0] B1EN;
	wire [15:0] A1ADDR_16 = {A1ADDR, 6'b0};
	wire [15:0] B1ADDR_16 = {B1ADDR, 6'b0};
	wire [7:0] DIP, DOP;
	wire [63:0] DI, DO;
	assign A1DATA = { DOP[7], DO[63:56], DOP[6], DO[55:48], DOP[5], DO[47:40], DOP[4], DO[39:32],
	                  DOP[3], DO[31:24], DOP[2], DO[23:16], DOP[1], DO[15: 8], DOP[0], DO[ 7: 0] };
	assign { DIP[7], DI[63:56], DIP[6], DI[55:48], DIP[5], DI[47:40], DIP[4], DI[39:32],
	         DIP[3], DI[31:24], DIP[2], DI[23:16], DIP[1], DI[15: 8], DIP[0], DI[ 7: 0] } = B1DATA;
	RAMB36E1 #(
		.RAM_MODE("SDP"),
		.READ_WIDTH_A(72),
		.WRITE_WIDTH_B(72),
		.WRITE_MODE_A("READ_FIRST"),
		.WRITE_MODE_B("READ_FIRST"),
		.IS_CLKARDCLK_INVERTED(!CLKPOL2),
		.IS_CLKBWRCLK_INVERTED(!CLKPOL3),
		`include "brams_init_36.vh"
		.SIM_DEVICE("7SERIES")
	) _TECHMAP_REPLACE_ (
		.DOBDO(DO[63:32]),
		.DOADO(DO[31:0]),
		.DOPBDOP(DOP[7:4]),
		.DOPADOP(DOP[3:0]),
		.DIBDI(DI[63:32]),
		.DIADI(DI[31:0]),
		.DIPBDIP(DIP[7:4]),
		.DIPADIP(DIP[3:0]),
		.ADDRARDADDR(A1ADDR_16),
		.CLKARDCLK(CLK2),
		.ENARDEN(A1EN),
		.REGCEAREGCE(|1),
		.RSTRAMARSTRAM(|0),
		.RSTREGARSTREG(|0),
		.WEA(4'b0),
		.ADDRBWRADDR(B1ADDR_16),
		.CLKBWRCLK(CLK3),
		.ENBWREN(|1),
		.REGCEB(|0),
		.RSTRAMB(|0),
		.RSTREGB(|0),
		.WEBWE(B1EN)
	);
endmodule