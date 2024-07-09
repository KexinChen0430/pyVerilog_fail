module */
   // set blt[0-2][0-2]_out to BLT0, BLT1, BLT2 by C_BLT
   function [63:0] GET_V;
      input [1:0] J;
      input [1:0] C_BLT;
      input [63:0] blt0;   // j - 1
      input [63:0] blt1;   // j
      input [63:0] blt2;   // j + 1
      begin
	 if      ( C_BLT == 2'd0 && J == 2'd0 )
	   GET_V = blt2;
	 else if ( C_BLT == 2'd0 && J == 2'd1 )
	   GET_V = blt0;
	 else if ( C_BLT == 2'd0 && J == 2'd2 )
	   GET_V = blt1;
	 else if ( C_BLT == 2'd1 && J == 2'd0 )
	   GET_V = blt1;
	 else if ( C_BLT == 2'd1 && J == 2'd1 )
	   GET_V = blt2;
	 else if ( C_BLT == 2'd1 && J == 2'd2 )
	   GET_V = blt0;
	 else if ( C_BLT == 2'd2 && J == 2'd0 )
	   GET_V = blt0;
	 else if ( C_BLT == 2'd2 && J == 2'd1 )
	   GET_V = blt1;
	 else if ( C_BLT == 2'd2 && J == 2'd2 )
	   GET_V = blt2;
	 else
	   GET_V = 64'd0;
      end
   endfunction
   ltcppg u_ltcppg
     (
      .v0       ( GET_V( 2'd0, C_BLT, blt00_out, blt10_out, blt20_out) ),
      .v1       ( GET_V( 2'd0, C_BLT, blt01_out, blt11_out, blt21_out) ),
      .v2       ( GET_V( 2'd0, C_BLT, blt02_out, blt12_out, blt22_out) ),
      .v3       ( GET_V( 2'd1, C_BLT, blt00_out, blt10_out, blt20_out) ),
      .v4       ( GET_V( 2'd1, C_BLT, blt01_out, blt11_out, blt21_out) ),
      .v5       ( GET_V( 2'd1, C_BLT, blt02_out, blt12_out, blt22_out) ),
      .v6       ( GET_V( 2'd2, C_BLT, blt00_out, blt10_out, blt20_out) ),
      .v7       ( GET_V( 2'd2, C_BLT, blt01_out, blt11_out, blt21_out) ),
      .v8       ( GET_V( 2'd2, C_BLT, blt02_out, blt12_out, blt22_out) ),
      .out_data ( calc_data )
      );
endmodule