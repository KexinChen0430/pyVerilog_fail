module ME_FREGA_2_55 ( clk, a, b, c, d0, d1, Q ) ;
   input clk, a, b, c;
   input  [54:0] d0, d1;
   output [54:0] Q;
   reg [54:0] mux_outputx;
   wire enable_low;
   wire hold;
   wire sel;
   ME_O2A1 iu_hold_gate_1 (.a(a), .b(b), .c(c), .z(hold) );
   ME_NOR2_D iu_hold_gate_2 (.a(a), .b(b), .z(sel) );
   always @ (sel or d0 or d1)
       case (sel)
 		1'b0: mux_outputx[54:0] = d0[54:0];
 		1'b1: mux_outputx[54:0] = d1[54:0];
		default mux_outputx = 'bx;
       endcase
//   assign enable_low = ~hold;
   Mflipflop_32 f0 (.out(Q[31:0]),  .din(mux_outputx[31:0]),  .clock(clk), .enable_l(hold) );
   Mflipflop_8  f1 (.out(Q[39:32]), .din(mux_outputx[39:32]), .clock(clk), .enable_l(hold) );
   Mflipflop_8  f2 (.out(Q[47:40]), .din(mux_outputx[47:40]), .clock(clk), .enable_l(hold) );
   Mflipflop_4  f3 (.out(Q[51:48]), .din(mux_outputx[51:48]), .clock(clk), .enable_l(hold) );
   Mflipflop_3  f4 (.out(Q[54:52]), .din(mux_outputx[54:52]), .clock(clk), .enable_l(hold) );
endmodule