module test_gen
  #( parameter
     SIZE = `MAX_SIZE,
     MASK = `MAX_SIZE'b0)
 (/*AUTOARG*/
   // Inputs
   clk
   );
   input clk;
   // Generate blocks that all have errors in applying short-circuting to
   // generate "if" conditionals.
   // Attempt to access invalid bits of MASK in different ways
   generate
      genvar g;
      for (g = 0; g < `MAX_SIZE; g = g + 1) begin
         if ((g < (SIZE + 1)) && MASK[g]) begin
            always @(posedge clk) begin
`ifdef TEST_VERBOSE
               $write ("Logical AND generate if MASK [%1d] = %d\n", g, MASK[g]);
`endif
            end
         end
      end
   endgenerate
   generate
      for (g = 0; g < `MAX_SIZE; g = g + 1) begin
         if ((g < SIZE) && MASK[g + 1]) begin
            always @(posedge clk) begin
`ifdef TEST_VERBOSE
               $write ("Logical AND generate if MASK [%1d] = %d\n", g, MASK[g]);
`endif
            end
         end
      end
   endgenerate
   // Attempt to short-circuit bitwise AND
   generate
      for (g = 0; g < `MAX_SIZE; g = g + 1) begin
         if ((g < (SIZE)) & MASK[g]) begin
            always @(posedge clk) begin
`ifdef TEST_VERBOSE
               $write ("Bitwise AND generate if MASK [%1d] = %d\n", g, MASK[g]);
`endif
            end
         end
      end
   endgenerate
   // Attempt to short-circuit bitwise OR
   generate
      for (g = 0; g < `MAX_SIZE; g = g + 1) begin
         if (!((g >= SIZE) | ~MASK[g])) begin
            always @(posedge clk) begin
`ifdef TEST_VERBOSE
               $write ("Bitwise OR generate if MASK [%1d] = %d\n", g, MASK[g]);
`endif
            end
         end
      end
   endgenerate
endmodule