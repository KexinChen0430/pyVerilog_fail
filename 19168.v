module ME_FREGA_2_4 ( clk, hold, S, d0, d1, Q ) ;
   input clk, hold, S;
   input  [3:0] d0, d1;
   output [3:0] Q;
//   N1Z000 gnd (GND);
//   AMUXFFA ff ( .DA0(d0[0]), .DA1(d0[1]), .DA2(d0[2]), .DA3(d0[3]),
//		.DB0(d1[0]), .DB1(d1[1]), .DB2(d1[2]), .DB3(d1[3]),
//		.CK(clk), .HLD(hold), .SM(GND), .SI(GND), .S(S),
//		.DO0(Q[0]),  .DO1(Q[1]),  .DO2(Q[2]),  .DO3(Q[3]) );
   reg [3:0] mux_output;
   wire enable_low;
   always @ (S or d0 or d1)
	case (S)	// synopsys parallel_case full_case
		0: mux_output = d0;
		1: mux_output = d1;
		default mux_output = 'bx;
        endcase
   assign enable_low = ~hold;
   Mflipflop_4 f0 (.out(Q[3:0]), .din(mux_output[3:0]), .clock(clk), .enable_l(enable_low) );
endmodule