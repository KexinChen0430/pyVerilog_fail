module bmod
  (input  clk,
   input [31:0] n);
`ifdef INLINE_B //verilator inline_module
`else  //verilator no_inline_module
`endif
   cmod csub (.clk, .n);
endmodule