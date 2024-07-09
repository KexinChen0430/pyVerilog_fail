module testbench;
   reg clk, reset;
   always
      #100 clk =~clk;
   initial begin
      clk = 1'b0;
      reset = 1'b0;
      #20 assign reset= 1'b1;
      #100 assign reset = 1'b0;
   end
   mips_pipeline A1(clk, reset);
   //always @(negedge clk)
     // reset = 1'b0;
endmodule