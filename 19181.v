module FREG_8bit_s ( clk, E, _A, _B, C, d0, d1, d2, d3, d4, d5, d6, d7, Q, Qbuf, QTs, Qs) ;
   input clk, E, _A, _B, C, d0, d1, d2, d3, d4, d5, d6, d7 ;
   output Q, Qbuf, QTs, Qs;
   // Bit 56 is critical and so contains two extra latches which
   // drive the rounding select value
   ME_INV_A   i0 ( _A, A);
   ME_INV_A   i1 ( _B, B);
   ME_MUX8B_B n0 ( A, B, C, d0, d1, d2, d3, d4, d5, d6, d7, x );
   ME_FD1E_B   f0 ( clk, E, x, Q, QN);
   ME_INV_B   b0 ( QN, Qbuf);
   ME_NMUX2B_B sm0 ( E, QNs, x, Ds );
   ME_FD1_B   sf0  ( clk, Ds, Qs, QNs);
   ME_FD1E_B   f1 ( clk, E, x, QTs, );
endmodule