module \$__ICE40_RAM4K (
	output [15:0] RDATA,
	input         RCLK, RCLKE, RE,
	input  [10:0] RADDR,
	input         WCLK, WCLKE, WE,
	input  [10:0] WADDR,
	input  [15:0] MASK, WDATA
);
	parameter [1:0] READ_MODE = 0;
	parameter [1:0] WRITE_MODE = 0;
	parameter [0:0] NEGCLK_R = 0;
	parameter [0:0] NEGCLK_W = 0;
	parameter [255:0] INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter [255:0] INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter [255:0] INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter [255:0] INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter [255:0] INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter [255:0] INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter [255:0] INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter [255:0] INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter [255:0] INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter [255:0] INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter [255:0] INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter [255:0] INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter [255:0] INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter [255:0] INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter [255:0] INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	parameter [255:0] INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
	generate
		case ({NEGCLK_R, NEGCLK_W})
			2'b00:
				SB_RAM40_4K #(
					.READ_MODE(READ_MODE),
					.WRITE_MODE(WRITE_MODE),
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
					.RDATA(RDATA),
					.RCLK (RCLK ),
					.RCLKE(RCLKE),
					.RE   (RE   ),
					.RADDR(RADDR),
					.WCLK (WCLK ),
					.WCLKE(WCLKE),
					.WE   (WE   ),
					.WADDR(WADDR),
					.MASK (MASK ),
					.WDATA(WDATA)
				);
			2'b01:
				SB_RAM40_4KNW #(
					.READ_MODE(READ_MODE),
					.WRITE_MODE(WRITE_MODE),
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
					.RDATA(RDATA),
					.RCLK (RCLK ),
					.RCLKE(RCLKE),
					.RE   (RE   ),
					.RADDR(RADDR),
					.WCLKN(WCLK ),
					.WCLKE(WCLKE),
					.WE   (WE   ),
					.WADDR(WADDR),
					.MASK (MASK ),
					.WDATA(WDATA)
				);
			2'b10:
				SB_RAM40_4KNR #(
					.READ_MODE(READ_MODE),
					.WRITE_MODE(WRITE_MODE),
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
					.RDATA(RDATA),
					.RCLKN(RCLK ),
					.RCLKE(RCLKE),
					.RE   (RE   ),
					.RADDR(RADDR),
					.WCLK (WCLK ),
					.WCLKE(WCLKE),
					.WE   (WE   ),
					.WADDR(WADDR),
					.MASK (MASK ),
					.WDATA(WDATA)
				);
			2'b11:
				SB_RAM40_4KNRNW #(
					.READ_MODE(READ_MODE),
					.WRITE_MODE(WRITE_MODE),
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
					.RDATA(RDATA),
					.RCLKN(RCLK ),
					.RCLKE(RCLKE),
					.RE   (RE   ),
					.RADDR(RADDR),
					.WCLKN(WCLK ),
					.WCLKE(WCLKE),
					.WE   (WE   ),
					.WADDR(WADDR),
					.MASK (MASK ),
					.WDATA(WDATA)
				);
		endcase
	endgenerate
endmodule