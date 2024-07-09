module ME_FREGA_2_32 ( clk, hold, S, d0, d1, Q ) ;
   input clk, hold, S;
   input  [31:0] d0, d1;
   output [31:0] Q;
//   N1Z000 gnd (GND);
//   AMUXFFA f0 ( .DA0(d0[0]), .DA1(d0[1]), .DA2(d0[2]), .DA3(d0[3]),
//		.DB0(d1[0]), .DB1(d1[1]), .DB2(d1[2]), .DB3(d1[3]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[0]),  .DO1(Q[1]),  .DO2(Q[2]),  .DO3(Q[3]) );
//   AMUXFFA f1 ( .DA0(d0[4]), .DA1(d0[5]), .DA2(d0[6]), .DA3(d0[7]),
//		.DB0(d1[4]), .DB1(d1[5]), .DB2(d1[6]), .DB3(d1[7]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[4]),  .DO1(Q[5]),  .DO2(Q[6]),  .DO3(Q[7]) );
//   AMUXFFA f2 ( .DA0(d0[8]), .DA1(d0[9]), .DA2(d0[10]), .DA3(d0[11]),
//		.DB0(d1[8]), .DB1(d1[9]), .DB2(d1[10]), .DB3(d1[11]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[8]),  .DO1(Q[9]),  .DO2(Q[10]),  .DO3(Q[11]) );
//   AMUXFFA f3 ( .DA0(d0[12]), .DA1(d0[13]), .DA2(d0[14]), .DA3(d0[15]),
//		.DB0(d1[12]), .DB1(d1[13]), .DB2(d1[14]), .DB3(d1[15]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[12]),  .DO1(Q[13]),  .DO2(Q[14]),  .DO3(Q[15]) );
//   AMUXFFA f4 ( .DA0(d0[16]), .DA1(d0[17]), .DA2(d0[18]), .DA3(d0[19]),
//		.DB0(d1[16]), .DB1(d1[17]), .DB2(d1[18]), .DB3(d1[19]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[16]),  .DO1(Q[17]),  .DO2(Q[18]),  .DO3(Q[19]) );
//   AMUXFFA f5 ( .DA0(d0[20]), .DA1(d0[21]), .DA2(d0[22]), .DA3(d0[23]),
//		.DB0(d1[20]), .DB1(d1[21]), .DB2(d1[22]), .DB3(d1[23]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[20]),  .DO1(Q[21]),  .DO2(Q[22]),  .DO3(Q[23]) );
//   AMUXFFA f6 ( .DA0(d0[24]), .DA1(d0[25]), .DA2(d0[26]), .DA3(d0[27]),
//		.DB0(d1[24]), .DB1(d1[25]), .DB2(d1[26]), .DB3(d1[27]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[24]),  .DO1(Q[25]),  .DO2(Q[26]),  .DO3(Q[27]) );
//   AMUXFFA f7 ( .DA0(d0[28]), .DA1(d0[29]), .DA2(d0[30]), .DA3(d0[31]),
//		.DB0(d1[28]), .DB1(d1[29]), .DB2(d1[30]), .DB3(d1[31]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[28]),  .DO1(Q[29]),  .DO2(Q[30]),  .DO3(Q[31]) );
   reg [31:0] mux_output;
   wire enable_low;
   always @ (S or d0 or d1)
	case (S)	// synopsys parallel_case full_case
		0: mux_output[31:0] = d0[31:0];
		1: mux_output[31:0] = d1[31:0];
		default mux_output = 'bx;
        endcase
   assign enable_low = ~hold;
   Mflipflop_32 f0 (.out(Q[31:0]), .din(mux_output[31:0]), .clock(clk), .enable_l(enable_low) );
endmodule