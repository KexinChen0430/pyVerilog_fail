module FREG_2byte ( clk, E, notA, A, d0, d1, Q ) ;
   input clk, notA, A, E;
   input  [7:0] d0, d1;
   output [7:0] Q;
   reg [7:0] mux_output1;
   wire enable_low;
   always @ (A or d0 or d1)
       case (A)
 		0: mux_output1 = d0;
 		1: mux_output1 = d1;
		default mux_output1 = 'bx;
       endcase
   assign enable_low = ~E;
   Mflipflop_8 f0 (.out(Q), .din(mux_output1), .clock(clk), .enable_l(enable_low) );
endmodule