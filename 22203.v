module halfband_reorder(input c, s, input [23:0] i0, i1, output reg [23:0] o0, o1);
   parameter N = 2; // number of input TDM channels
   wire [23:0] i0d2, i1d2, i1d4;
   delay #(.NB(24), .DEL(N)) delay_1(.c(c), .i(i0), .o(i0d2));
   delay #(.NB(24), .DEL(N)) delay_2(.c(c), .i(i1), .o(i1d2));
   delay #(.NB(24), .DEL(N*2)) delay_3(.c(c), .i(i1), .o(i1d4));
   o0 <= s ? i1d4 : i0d2;
   o1 <= s ? i1d2 : i0;
endmodule