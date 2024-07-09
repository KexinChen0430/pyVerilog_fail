module cmod
  (input   clk, input [31:0] n);
`ifdef INLINE_C //verilator inline_module
`else  //verilator no_inline_module
`endif
   reg [31:0] clocal;
   always @ (posedge clk) clocal <= n;
   dmod dsub (.clk, .n);
endmodule