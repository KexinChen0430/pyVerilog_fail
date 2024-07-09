module TestNonAnsi (/*AUTOARG*/
   // Outputs
   out,
   // Inputs
   clk, in
   );
   parameter type p_t = shortint;
   input clk;
   input p_t in;
   output p_t out;
   always @(posedge clk) begin
      out <= ~in;
   end
endmodule