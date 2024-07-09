module t (/*AUTOARG*/
   // Inputs
   clk
   );
   input clk;
   sub #(.IDX(0), .CHK(10)) i0;
   sub #(.IDX(2), .CHK(12)) i2;
   sub #(.IDX(7), .CHK(17)) i7;
   always @ (posedge clk) begin
      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule