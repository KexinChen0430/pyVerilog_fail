module outputs)
   wire [1:0]           out10;                  // From test of Test.v
   wire [1:0]           out32;                  // From test of Test.v
   // End of automatics
   Test test (/*AUTOINST*/
              // Outputs
              .out32                    (out32[1:0]),
              .out10                    (out10[1:0]),
              // Inputs
              .in                       (in[1:0]));
   // Test loop
   always @ (posedge clk) begin
      in <= in + 1;
`ifdef TEST_VERBOSE
      $write("[%0t] in=%d out32=%d out10=%d\n",$time, in, out32, out10);
`endif
      if (in==3) begin
         $write("*-* All Finished *-*\n");
         $finish;
      end
   end
endmodule