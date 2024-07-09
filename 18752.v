module Test2 (/*AUTOARG*/
   // Inputs
   clk, in
   );
   input clk;
   input [31:0] in;
   reg [31:0]   dly0;
   reg [31:0]   dly1;
   default clocking @(posedge clk); endclocking
   assert property (@(posedge clk) dly1 == $past(in, 2));
endmodule