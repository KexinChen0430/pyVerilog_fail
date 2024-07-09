module \$__QLF_FACTOR_BRAM36_TDP (A1ADDR, A1DATA, A1EN, B1ADDR, B1DATA, B1EN, C1ADDR, C1DATA, C1EN, CLK1, CLK2, D1ADDR, D1DATA, D1EN);
	parameter CFG_ABITS = 10;
	parameter CFG_DBITS = 36;
	parameter CFG_ENABLE_B = 4;
	parameter CFG_ENABLE_D = 4;
	parameter CLKPOL2 = 1;
	parameter CLKPOL3 = 1;
	parameter [36863:0] INIT = 36864'bx;
	input CLK1;
	input CLK2;
	input [CFG_ABITS-1:0] A1ADDR;
	output [CFG_DBITS-1:0] A1DATA;
	input A1EN;
	input [CFG_ABITS-1:0] B1ADDR;
	input [CFG_DBITS-1:0] B1DATA;
	input [CFG_ENABLE_B-1:0] B1EN;
	input [CFG_ABITS-1:0] C1ADDR;
	output [CFG_DBITS-1:0] C1DATA;
	input C1EN;
	input [CFG_ABITS-1:0] D1ADDR;
	input [CFG_DBITS-1:0] D1DATA;
	input [CFG_ENABLE_B-1:0] D1EN;
	wire FLUSH1;
	wire FLUSH2;
	wire SPLIT;
	wire [14:CFG_ABITS] A1ADDR_CMPL = {15-CFG_ABITS{1'b0}};
	wire [14:CFG_ABITS] B1ADDR_CMPL = {15-CFG_ABITS{1'b0}};
	wire [14:CFG_ABITS] C1ADDR_CMPL = {15-CFG_ABITS{1'b0}};
	wire [14:CFG_ABITS] D1ADDR_CMPL = {15-CFG_ABITS{1'b0}};
	wire [14:0] A1ADDR_TOTAL = {A1ADDR_CMPL, A1ADDR};
	wire [14:0] B1ADDR_TOTAL = {B1ADDR_CMPL, B1ADDR};
	wire [14:0] C1ADDR_TOTAL = {C1ADDR_CMPL, C1ADDR};
	wire [14:0] D1ADDR_TOTAL = {D1ADDR_CMPL, D1ADDR};
	wire [35:CFG_DBITS] A1DATA_CMPL;
	wire [35:CFG_DBITS] C1DATA_CMPL;
	wire [35:0] A1DATA_TOTAL = {A1DATA_CMPL, A1DATA};
	wire [35:0] C1DATA_TOTAL = {C1DATA_CMPL, C1DATA};
	wire [14:0] PORT_A_ADDR;
	wire [14:0] PORT_B_ADDR;
	case (CFG_DBITS)
		1: begin
			assign PORT_A_ADDR = A1EN ? A1ADDR_TOTAL : (B1EN ? B1ADDR_TOTAL : 15'd0);
			assign PORT_B_ADDR = C1EN ? C1ADDR_TOTAL : (D1EN ? D1ADDR_TOTAL : 15'd0);
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_1, `MODE_1, `MODE_1, `MODE_1, 1'd0
            };
		end
		2: begin
			assign PORT_A_ADDR = A1EN ? (A1ADDR_TOTAL << 1) : (B1EN ? (B1ADDR_TOTAL << 1) : 15'd0);
			assign PORT_B_ADDR = C1EN ? (C1ADDR_TOTAL << 1) : (D1EN ? (D1ADDR_TOTAL << 1) : 15'd0);
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_2, `MODE_2, `MODE_2, `MODE_2, 1'd0
            };
		end
		4: begin
			assign PORT_A_ADDR = A1EN ? (A1ADDR_TOTAL << 2) : (B1EN ? (B1ADDR_TOTAL << 2) : 15'd0);
			assign PORT_B_ADDR = C1EN ? (C1ADDR_TOTAL << 2) : (D1EN ? (D1ADDR_TOTAL << 2) : 15'd0);
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_4, `MODE_4, `MODE_4, `MODE_4, 1'd0
            };
		end
		8, 9: begin
			assign PORT_A_ADDR = A1EN ? (A1ADDR_TOTAL << 3) : (B1EN ? (B1ADDR_TOTAL << 3) : 15'd0);
			assign PORT_B_ADDR = C1EN ? (C1ADDR_TOTAL << 3) : (D1EN ? (D1ADDR_TOTAL << 3) : 15'd0);
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_9, `MODE_9, `MODE_9, `MODE_9, 1'd0
            };
		end
		16, 18: begin
			assign PORT_A_ADDR = A1EN ? (A1ADDR_TOTAL << 4) : (B1EN ? (B1ADDR_TOTAL << 4) : 15'd0);
			assign PORT_B_ADDR = C1EN ? (C1ADDR_TOTAL << 4) : (D1EN ? (D1ADDR_TOTAL << 4) : 15'd0);
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_18, `MODE_18, `MODE_18, `MODE_18, 1'd0
            };
		end
		32, 36: begin
			assign PORT_A_ADDR = A1EN ? (A1ADDR_TOTAL << 5) : (B1EN ? (B1ADDR_TOTAL << 5) : 15'd0);
			assign PORT_B_ADDR = C1EN ? (C1ADDR_TOTAL << 5) : (D1EN ? (D1ADDR_TOTAL << 5) : 15'd0);
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0
            };
		end
		default: begin
			assign PORT_A_ADDR = A1EN ? A1ADDR_TOTAL : (B1EN ? B1ADDR_TOTAL : 15'd0);
			assign PORT_B_ADDR = C1EN ? C1ADDR_TOTAL : (D1EN ? D1ADDR_TOTAL : 15'd0);
            defparam _TECHMAP_REPLACE_.MODE_BITS = { 1'b0,
                11'd10, 11'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0,
                12'd10, 12'd10, 4'd0, `MODE_36, `MODE_36, `MODE_36, `MODE_36, 1'd0
            };
		end
	endcase
	assign SPLIT = 1'b0;
	assign FLUSH1 = 1'b0;
	assign FLUSH2 = 1'b0;
	TDP36K _TECHMAP_REPLACE_ (
		.RESET_ni(1'b1),
		.WDATA_A1_i(B1DATA[17:0]),
		.WDATA_A2_i(B1DATA[35:18]),
		.RDATA_A1_o(A1DATA_TOTAL[17:0]),
		.RDATA_A2_o(A1DATA_TOTAL[35:18]),
		.ADDR_A1_i(PORT_A_ADDR),
		.ADDR_A2_i(PORT_A_ADDR),
		.CLK_A1_i(CLK1),
		.CLK_A2_i(CLK1),
		.REN_A1_i(A1EN),
		.REN_A2_i(A1EN),
		.WEN_A1_i(B1EN[0]),
		.WEN_A2_i(B1EN[0]),
		.BE_A1_i({B1EN[1],B1EN[0]}),
		.BE_A2_i({B1EN[3],B1EN[2]}),
		.WDATA_B1_i(D1DATA[17:0]),
		.WDATA_B2_i(D1DATA[35:18]),
		.RDATA_B1_o(C1DATA_TOTAL[17:0]),
		.RDATA_B2_o(C1DATA_TOTAL[35:18]),
		.ADDR_B1_i(PORT_B_ADDR),
		.ADDR_B2_i(PORT_B_ADDR),
		.CLK_B1_i(CLK2),
		.CLK_B2_i(CLK2),
		.REN_B1_i(C1EN),
		.REN_B2_i(C1EN),
		.WEN_B1_i(D1EN[0]),
		.WEN_B2_i(D1EN[0]),
		.BE_B1_i({D1EN[1],D1EN[0]}),
		.BE_B2_i({D1EN[3],D1EN[2]}),
		.FLUSH1_i(FLUSH1),
		.FLUSH2_i(FLUSH2)
	);
endmodule