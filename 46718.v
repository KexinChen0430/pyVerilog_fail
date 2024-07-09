module top;
   parameter fwidth = 8;   // field width of sbn operand
   parameter dwidth = 32;
   parameter maximum = 200;
   parameter maxmone = maximum - 1;
   parameter step = 10;
   reg clk;
   wire [2:0] state;
   wire [fwidth-1:0] pc;
   wire [dwidth-1:0] a, b;
   sbn #(fwidth,dwidth) mach1 (clk, state, pc, a, b);
   initial begin
      $display("=== start ===");
      clk = 0;
      #maxmone $display("=== end ===");
      #1 $finish;
   end
   always
     #step clk = ~clk;
endmodule