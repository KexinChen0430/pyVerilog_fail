module subtract13 ( x, y, z) ;
input  [12:0] x, y ;
output [12:0] z ;
	// special 1's comp. subtractor
   adder13 sub13 ( 1'b1, 1'b0, x, y, z, ) ;
endmodule