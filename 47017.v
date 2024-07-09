module \$__QLF_FACTOR_BRAM36_SDP (CLK2, CLK3, A1ADDR, A1DATA, A1EN, B1ADDR, B1DATA, B1EN);
	parameter CFG_ABITS = 10;
	parameter CFG_DBITS = 36;
	parameter CFG_ENABLE_B = 4;
	parameter CLKPOL2 = 1;
	parameter CLKPOL3 = 1;
	parameter [36863:0] INIT = 36864'bx;
	localparam MODE_36  = 3'b111;	// 36 or 32-bit
	localparam MODE_18  = 3'b110;	// 18 or 16-bit
	localparam MODE_9   = 3'b101;	// 9 or 8-bit
	localparam MODE_4   = 3'b100;	// 4-bit
	localparam MODE_2   = 3'b010;	// 32-bit
	localparam MODE_1   = 3'b001;	// 32-bit
	input CLK2;
	input CLK3;
	input [CFG_ABITS-1:0] A1ADDR;
	output [CFG_DBITS-1:0] A1DATA;
	input A1EN;
	input [CFG_ABITS-1:0] B1ADDR;
	input [CFG_DBITS-1:0] B1DATA;
	input [CFG_ENABLE_B-1:0] B1EN;
	wire [14:0] A1ADDR_15;
	wire [14:0] B1ADDR_15;
	wire [35:0] DOBDO;
	wire [14:CFG_ABITS] A1ADDR_CMPL;
	wire [14:CFG_ABITS] B1ADDR_CMPL;
	wire [35:CFG_DBITS] A1DATA_CMPL;
	wire [35:CFG_DBITS] B1DATA_CMPL;
	wire [14:0] A1ADDR_TOTAL;
	wire [14:0] B1ADDR_TOTAL;
	wire [35:0] A1DATA_TOTAL;
	wire [35:0] B1DATA_TOTAL;
	wire FLUSH1;
	wire FLUSH2;
	wire [15:0] RAM_ID;
	wire PL_INIT_i;
	wire PL_ENA_i;
	wire PL_REN_i;
	wire PL_CLK_i;
	wire [1:0] PL_WEN_i;
	wire [23:0] PL_ADDR_i;
	wire [35:0] PL_DATA_i;
	reg PL_INIT_o;
	reg PL_ENA_o;
	reg PL_REN_o;
	reg PL_CLK_o;
	reg [1:0] PL_WEN_o;
	reg [23:0] PL_ADDR_o;
	wire [35:0] PL_DATA_o;
	wire [2:0] WMODE;
	wire [2:0] RMODE;
	assign A1ADDR_CMPL = {15-CFG_ABITS{1'b0}};
	assign B1ADDR_CMPL = {15-CFG_ABITS{1'b0}};
	assign A1ADDR_TOTAL = {A1ADDR_CMPL, A1ADDR};
	assign B1ADDR_TOTAL = {B1ADDR_CMPL, B1ADDR};
	assign A1DATA_TOTAL = {A1DATA_CMPL, A1DATA};
	assign B1DATA_TOTAL = {B1DATA_CMPL, B1DATA};
	case (CFG_DBITS)
		1: begin
			assign A1ADDR_15 = A1ADDR_TOTAL;
			assign B1ADDR_15 = B1ADDR_TOTAL;
			defparam _TECHMAP_REPLACE_.WMODE_A1_i = `MODE_1;
			defparam _TECHMAP_REPLACE_.WMODE_A2_i = `MODE_1;
			defparam _TECHMAP_REPLACE_.RMODE_A1_i = `MODE_1;
			defparam _TECHMAP_REPLACE_.RMODE_A2_i = `MODE_1;
			defparam _TECHMAP_REPLACE_.WMODE_B1_i = `MODE_1;
			defparam _TECHMAP_REPLACE_.WMODE_B2_i = `MODE_1;
			defparam _TECHMAP_REPLACE_.RMODE_B1_i = `MODE_1;
			defparam _TECHMAP_REPLACE_.RMODE_B2_i = `MODE_1;
		end
		2: begin
			assign A1ADDR_15 = A1ADDR_TOTAL << 1;
			assign B1ADDR_15 = B1ADDR_TOTAL << 1;
			defparam _TECHMAP_REPLACE_.WMODE_A1_i = `MODE_2;
			defparam _TECHMAP_REPLACE_.WMODE_A2_i = `MODE_2;
			defparam _TECHMAP_REPLACE_.RMODE_A1_i = `MODE_2;
			defparam _TECHMAP_REPLACE_.RMODE_A2_i = `MODE_2;
			defparam _TECHMAP_REPLACE_.WMODE_B1_i = `MODE_2;
			defparam _TECHMAP_REPLACE_.WMODE_B2_i = `MODE_2;
			defparam _TECHMAP_REPLACE_.RMODE_B1_i = `MODE_2;
			defparam _TECHMAP_REPLACE_.RMODE_B2_i = `MODE_2;
		end
		4: begin
			assign A1ADDR_15 = A1ADDR_TOTAL << 2;
			assign B1ADDR_15 = B1ADDR_TOTAL << 2;
			defparam _TECHMAP_REPLACE_.WMODE_A1_i = `MODE_4;
			defparam _TECHMAP_REPLACE_.WMODE_A2_i = `MODE_4;
			defparam _TECHMAP_REPLACE_.RMODE_A1_i = `MODE_4;
			defparam _TECHMAP_REPLACE_.RMODE_A2_i = `MODE_4;
			defparam _TECHMAP_REPLACE_.WMODE_B1_i = `MODE_4;
			defparam _TECHMAP_REPLACE_.WMODE_B2_i = `MODE_4;
			defparam _TECHMAP_REPLACE_.RMODE_B1_i = `MODE_4;
			defparam _TECHMAP_REPLACE_.RMODE_B2_i = `MODE_4;
		end
		8, 9: begin
			assign A1ADDR_15 = A1ADDR_TOTAL << 3;
			assign B1ADDR_15 = B1ADDR_TOTAL << 3;
			defparam _TECHMAP_REPLACE_.WMODE_A1_i = `MODE_9;
			defparam _TECHMAP_REPLACE_.WMODE_A2_i = `MODE_9;
			defparam _TECHMAP_REPLACE_.RMODE_A1_i = `MODE_9;
			defparam _TECHMAP_REPLACE_.RMODE_A2_i = `MODE_9;
			defparam _TECHMAP_REPLACE_.WMODE_B1_i = `MODE_9;
			defparam _TECHMAP_REPLACE_.WMODE_B2_i = `MODE_9;
			defparam _TECHMAP_REPLACE_.RMODE_B1_i = `MODE_9;
			defparam _TECHMAP_REPLACE_.RMODE_B2_i = `MODE_9;
		end
		16, 18: begin
			assign A1ADDR_15 = A1ADDR_TOTAL << 4;
			assign B1ADDR_15 = B1ADDR_TOTAL << 4;
			defparam _TECHMAP_REPLACE_.WMODE_A1_i = `MODE_18;
			defparam _TECHMAP_REPLACE_.WMODE_A2_i = `MODE_18;
			defparam _TECHMAP_REPLACE_.RMODE_A1_i = `MODE_18;
			defparam _TECHMAP_REPLACE_.RMODE_A2_i = `MODE_18;
			defparam _TECHMAP_REPLACE_.WMODE_B1_i = `MODE_18;
			defparam _TECHMAP_REPLACE_.WMODE_B2_i = `MODE_18;
			defparam _TECHMAP_REPLACE_.RMODE_B1_i = `MODE_18;
			defparam _TECHMAP_REPLACE_.RMODE_B2_i = `MODE_18;
		end
		32, 36: begin
			assign A1ADDR_15 = A1ADDR_TOTAL << 5;
			assign B1ADDR_15 = B1ADDR_TOTAL << 5;
			defparam _TECHMAP_REPLACE_.WMODE_A1_i = `MODE_36;
			defparam _TECHMAP_REPLACE_.WMODE_A2_i = `MODE_36;
			defparam _TECHMAP_REPLACE_.RMODE_A1_i = `MODE_36;
			defparam _TECHMAP_REPLACE_.RMODE_A2_i = `MODE_36;
			defparam _TECHMAP_REPLACE_.WMODE_B1_i = `MODE_36;
			defparam _TECHMAP_REPLACE_.WMODE_B2_i = `MODE_36;
			defparam _TECHMAP_REPLACE_.RMODE_B1_i = `MODE_36;
			defparam _TECHMAP_REPLACE_.RMODE_B2_i = `MODE_36;
		end
		default: begin
			assign A1ADDR_15 = A1ADDR_TOTAL;
			assign B1ADDR_15 = B1ADDR_TOTAL;
			defparam _TECHMAP_REPLACE_.WMODE_A1_i = `MODE_36;
			defparam _TECHMAP_REPLACE_.WMODE_A2_i = `MODE_36;
			defparam _TECHMAP_REPLACE_.RMODE_A1_i = `MODE_36;
			defparam _TECHMAP_REPLACE_.RMODE_A2_i = `MODE_36;
			defparam _TECHMAP_REPLACE_.WMODE_B1_i = `MODE_36;
			defparam _TECHMAP_REPLACE_.WMODE_B2_i = `MODE_36;
			defparam _TECHMAP_REPLACE_.RMODE_B1_i = `MODE_36;
			defparam _TECHMAP_REPLACE_.RMODE_B2_i = `MODE_36;
		end
	endcase
	assign FLUSH1 = 1'b0;
	assign FLUSH2 = 1'b0;
	assign RAM_ID = 16'b0;
	assign PL_INIT_i = 1'b0;
	assign PL_ENA_i = 1'b0;
	assign PL_REN_i = 1'b0;
	assign PL_CLK_i = 1'b0;
	assign PL_WEN_i = 2'b0;
	assign PL_ADDR_i = 24'b0;
	assign PL_DATA_i = 36'b0;
	TDP_BRAM36 #(
		.UPAE1_i(12'd10),
		.UPAF1_i(12'd10),
		.UPAE2_i(12'd10),
		.UPAF2_i(12'd10),
		.SYNC_FIFO1_i(1'b0),
		.SYNC_FIFO2_i(1'b0),
		.FMODE1_i(1'b0),
		.FMODE2_i(1'b0),
		.POWERDN1_i(1'b0),
		.POWERDN2_i(1'b0),
		.SLEEP1_i(1'b0),
		.SLEEP2_i(1'b0),
		.PROTECT1_i(1'b0),
		.PROTECT2_i(1'b0),
		.SPLIT_i(1'b0)
	) _TECHMAP_REPLACE_ (
		.WDATA_A1_i(18'h3FFFF),
		.WDATA_A2_i(18'h3FFFF),
		.RDATA_A1_o(A1DATA_TOTAL[17:0]),
		.RDATA_A2_o(A1DATA_TOTAL[35:18]),
		.ADDR_A1_i(A1ADDR_15),
		.ADDR_A2_i(A1ADDR_15),
		.CLK_A1_i(CLK2),
		.CLK_A2_i(CLK2),
		.REN_A1_i(A1EN),
		.REN_A2_i(A1EN),
		.WEN_A1_i(1'b0),
		.WEN_A2_i(1'b0),
		.BE_A1_i({A1EN, A1EN}),
		.BE_A2_i({A1EN, A1EN}),
		.WDATA_B1_i(B1DATA[17:0]),
		.WDATA_B2_i(B1DATA[35:18]),
		.RDATA_B1_o(DOBDO[17:0]),
		.RDATA_B2_o(DOBDO[35:18]),
		.ADDR_B1_i(B1ADDR_15),
		.ADDR_B2_i(B1ADDR_15),
		.CLK_B1_i(CLK3),
		.CLK_B2_i(CLK3),
		.REN_B1_i(1'b0),
		.REN_B2_i(1'b0),
		.WEN_B1_i(B1EN[0]),
		.WEN_B2_i(B1EN[0]),
		.BE_B1_i(B1EN[1:0]),
		.BE_B2_i(B1EN[3:2]),
		.FLUSH1_i(FLUSH1),
		.FLUSH2_i(FLUSH2),
		.RAM_ID_i(RAM_ID),
		.PL_INIT_i(PL_INIT_i),
		.PL_ENA_i(PL_ENA_i),
		.PL_WEN_i(PL_WEN_i),
		.PL_REN_i(PL_REN_i),
		.PL_CLK_i(PL_CLK_i),
		.PL_ADDR_i(PL_ADDR_i),
		.PL_DATA_i(PL_DATA_i),
		.PL_INIT_o(PL_INIT_o),
		.PL_ENA_o(PL_ENA_o),
		.PL_WEN_o(PL_WEN_o),
		.PL_REN_o(PL_REN_o),
		.PL_CLK_o(PL_CLK_o),
		.PL_ADDR_o(),
		.PL_DATA_o(PL_DATA_o)
	);
endmodule