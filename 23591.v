module Contemplator #(
		      parameter IMPL = 0,
		      parameter M    = 5,
		      parameter N    = 1 )
   (
    input logic clk,
    the_intf.i out [N-1:0]
    );
   the_intf #(.M(M)) inp[N-1:0] ();
   DeepThought #(
		 .N    ( N   ))
   ultimateAnswerer(
		    .src  ( inp ),
		    .dst  ( out ));
endmodule