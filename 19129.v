module ME_SUB_13 ( sub, CarryIn, x, y, z );
   input sub, CarryIn;
   input  [12:0] x, y ;
   output [12:0] z ;
   adder13 sub13 ( sub, CarryIn, x, y, z, ) ;
endmodule