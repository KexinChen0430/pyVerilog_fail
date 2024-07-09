module StickyPairNC (StkIn, notCin, X, Y, StkOut, notCout);
   input  StkIn, notCin ;
   input [1:0] X, Y ;
   output StkOut, notCout ;
   ME_XNOR2_B  g10 ( X[0], Y[0], notZ0 );
   ME_XNOR2_B  g11 ( X[1], Y[1], notZ1 );
   ME_OR2_B    g13 ( notZ0, notZ1, notProp );
   // generate logic
   //ME_NMUX2B g12 ( Z1, x[1], x[0], notglo ) ;
   ME_NAND3    g20 ( X[0], Y[0], X[1], g1 );
   ME_NAND3    g21 ( X[0], Y[0], Y[1], g2 );
   ME_NAND2    g22 ( X[1], Y[1], g3 );
   ME_NAND3    g23 ( g1, g2, g3, generate );
   // local sticky
   ME_NAND2    g14 ( X[0], Y[0], notgenlo);
   ME_XOR3_B   g26 ( notgenlo, X[1], Y[1], bit1);
   ME_NAND3    g24 ( notZ0, bit1, notCin, StkGen);
   ME_NMUX2B   g28 ( notProp, notCin, StkGen, notStk ) ;
   // bypasses
   ME_INV_A    g31 ( StkIn, notStkIn );
   ME_NAND2    g32 ( notStkIn, notStk, StkOut );
   ME_INVA     g27 ( notCin, Cin );
   ME_NMUX2B_B g34 ( notProp, Cin, generate, notCout );
endmodule