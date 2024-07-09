module \$__ICE40_RAM4K_M123 (CLK2, CLK3, A1ADDR, A1DATA, A1EN, B1ADDR, B1DATA, B1EN);
	parameter CFG_ABITS = 9;
	parameter CFG_DBITS = 8;
	parameter [0:0] CLKPOL2 = 1;
	parameter [0:0] CLKPOL3 = 1;
	parameter [4095:0] INIT = 4096'bx;
	localparam MODE =
		CFG_ABITS ==  9 ? 1 :
		CFG_ABITS == 10 ? 2 :
		CFG_ABITS == 11 ? 3 : 'bx;
	input CLK2;
	input CLK3;
	input [CFG_ABITS-1:0] A1ADDR;
	output [CFG_DBITS-1:0] A1DATA;
	input A1EN;
	input [CFG_ABITS-1:0] B1ADDR;
	input [CFG_DBITS-1:0] B1DATA;
	input B1EN;
	wire [10:0] A1ADDR_11 = A1ADDR;
	wire [10:0] B1ADDR_11 = B1ADDR;
	wire [15:0] A1DATA_16, B1DATA_16;
	generate
		if (MODE == 1) begin
			assign A1DATA = {A1DATA_16[14], A1DATA_16[12], A1DATA_16[10], A1DATA_16[ 8],
			                 A1DATA_16[ 6], A1DATA_16[ 4], A1DATA_16[ 2], A1DATA_16[ 0]};
			assign {B1DATA_16[14], B1DATA_16[12], B1DATA_16[10], B1DATA_16[ 8],
			        B1DATA_16[ 6], B1DATA_16[ 4], B1DATA_16[ 2], B1DATA_16[ 0]} = B1DATA;
			`include "brams_init1.vh"
		end
		if (MODE == 2) begin
			assign A1DATA = {A1DATA_16[13], A1DATA_16[9], A1DATA_16[5], A1DATA_16[1]};
			assign {B1DATA_16[13], B1DATA_16[9], B1DATA_16[5], B1DATA_16[1]} = B1DATA;
			`include "brams_init2.vh"
		end
		if (MODE == 3) begin
			assign A1DATA = {A1DATA_16[11], A1DATA_16[3]};
			assign {B1DATA_16[11], B1DATA_16[3]} = B1DATA;
			`include "brams_init3.vh"
		end
	endgenerate
	\$__ICE40_RAM4K #(
		.READ_MODE(MODE),
		.WRITE_MODE(MODE),
		.NEGCLK_R(!CLKPOL2),
		.NEGCLK_W(!CLKPOL3),
		.INIT_0(INIT_0),
		.INIT_1(INIT_1),
		.INIT_2(INIT_2),
		.INIT_3(INIT_3),
		.INIT_4(INIT_4),
		.INIT_5(INIT_5),
		.INIT_6(INIT_6),
		.INIT_7(INIT_7),
		.INIT_8(INIT_8),
		.INIT_9(INIT_9),
		.INIT_A(INIT_A),
		.INIT_B(INIT_B),
		.INIT_C(INIT_C),
		.INIT_D(INIT_D),
		.INIT_E(INIT_E),
		.INIT_F(INIT_F)
	) _TECHMAP_REPLACE_ (
		.RDATA(A1DATA_16),
		.RADDR(A1ADDR_11),
		.RCLK(CLK2),
		.RCLKE(A1EN),
		.RE(1'b1),
		.WDATA(B1DATA_16),
		.WADDR(B1ADDR_11),
		.WCLK(CLK3),
		.WCLKE(|B1EN),
		.WE(1'b1)
	);
endmodule