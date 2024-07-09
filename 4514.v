module t (/*AUTOARG*/
   // Inputs
   clk
   );
   input clk;
`ifdef INLINE_A //verilator inline_module
`else  //verilator no_inline_module
`endif
   bmod bsub3 (.clk, .n(3));
   bmod bsub2 (.clk, .n(2));
   bmod bsub1 (.clk, .n(1));
   bmod bsub0 (.clk, .n(0));
endmodule