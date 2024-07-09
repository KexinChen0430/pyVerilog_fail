module \$__QLF_FACTOR_BRAM18_TDP (CLK2, CLK3, A1ADDR, A1DATA, A1EN, B1ADDR, B1DATA, B1EN);
	parameter CFG_ABITS = 10;
	parameter CFG_DBITS = 18;
	parameter CFG_ENABLE_B = 2;
	parameter CLKPOL2 = 1;
	parameter CLKPOL3 = 1;
	parameter [18431:0] INIT = 18432'bx;
	input CLK2;
	input CLK3;
	input [CFG_ABITS-1:0] A1ADDR;
	output [CFG_DBITS-1:0] A1DATA;
	input A1EN;
	input [CFG_ABITS-1:0] B1ADDR;
	input [CFG_DBITS-1:0] B1DATA;
	input [CFG_ENABLE_B-1:0] B1EN;
	wire [13:0] A1ADDR_14;
	wire [13:0] B1ADDR_14;
	//wire [3:0] B1EN_4 = B1EN;
	wire [1:0] DIP, DOP;
	wire [15:0] DI, DO;
	wire [15:0] DOBDO;
	wire [1:0] DOPBDOP;
	assign A1DATA = { DOP[1], DO[15: 8], DOP[0], DO[ 7: 0] };
	assign { DIP[1], DI[15: 8], DIP[0], DI[ 7: 0] } = B1DATA;
        assign A1ADDR_14[13:CFG_ABITS]  = 0;
        assign A1ADDR_14[CFG_ABITS-1:0] = A1ADDR;
        assign B1ADDR_14[13:CFG_ABITS]  = 0;
        assign B1ADDR_14[CFG_ABITS-1:0] = B1ADDR;
	/*if (CFG_DBITS == 1) begin
	  assign WRITEDATAWIDTHB = 3'b000;
	  assign READDATAWIDTHA = 3'b000;
	end else if (CFG_DBITS == 2) begin
          assign WRITEDATAWIDTHB = 3'b001;
          assign READDATAWIDTHA = 3'b001;
        end else if (CFG_DBITS > 2 && CFG_DBITS <= 4) begin
          assign WRITEDATAWIDTHB = 3'b010;
          assign READDATAWIDTHA = 3'b010;
        end else if (CFG_DBITS > 4 && CFG_DBITS <= 9) begin
          assign WRITEDATAWIDTHB = 3'b011;
          assign READDATAWIDTHA = 3'b011;
        end else if (CFG_DBITS > 9 && CFG_DBITS <= 18) begin
          //assign WRITEDATAWIDTHB = 3'b100;
          assign READDATAWIDTHA = 3'b100;
	end*/
	generate if (CFG_DBITS > 8) begin
		TDP_BRAM18 #(
			//`include "brams_init_18.vh"
                        .READ_WIDTH_A(CFG_DBITS),
                        .READ_WIDTH_B(CFG_DBITS),
                        .WRITE_WIDTH_A(CFG_DBITS),
                        .WRITE_WIDTH_B(CFG_DBITS),
		) _TECHMAP_REPLACE_ (
			.WRITEDATAA(16'hFFFF),
			.WRITEDATAAP(2'b11),
			.READDATAA(DO[15:0]),
			.READDATAAP(DOP[2:0]),
			.ADDRA(A1ADDR_14),
			.CLOCKA(CLK2),
			.READENABLEA(A1EN),
			.WRITEENABLEA(1'b0),
			.BYTEENABLEA(2'b0),
			//.WRITEDATAWIDTHA(3'b0),
			//.READDATAWIDTHA(READDATAWIDTHA),
			.WRITEDATAB(DI),
			.WRITEDATABP(DIP),
			.READDATAB(DOBDO),
			.READDATABP(DOPBDOP),
			.ADDRB(B1ADDR_14),
			.CLOCKB(CLK3),
			.READENABLEB(1'b0),
			.WRITEENABLEB(1'b1),
			.BYTEENABLEB(B1EN)
			//.WRITEDATAWIDTHB(WRITEDATAWIDTHB),
			//.READDATAWIDTHB(3'b0)
		);
	end else begin
		TDP_BRAM18 #(
			//`include "brams_init_16.vh"
		) _TECHMAP_REPLACE_ (
			.WRITEDATAA(16'hFFFF),
			.WRITEDATAAP(2'b11),
			.READDATAA(DO[15:0]),
			.READDATAAP(DOP[2:0]),
			.ADDRA(A1ADDR_14),
			.CLOCKA(CLK2),
			.READENABLEA(A1EN),
			.WRITEENABLEA(1'b0),
			.BYTEENABLEA(2'b0),
			//.WRITEDATAWIDTHA(3'b0),
		//	.READDATAWIDTHA(READDATAWIDTHA),
			.WRITEDATAB(DI),
			.WRITEDATABP(DIP),
			.READDATAB(DOBDO),
			.READDATABP(DOPBDOP),
			.ADDRB(B1ADDR_14),
			.CLOCKB(CLK3),
			.READENABLEB(1'b0),
			.WRITEENABLEB(1'b1),
			.BYTEENABLEB(B1EN)
			//.WRITEDATAWIDTHB(WRITEDATAWIDTHB),
			//.READDATAWIDTHB(3'b0)
		);
	end endgenerate
endmodule