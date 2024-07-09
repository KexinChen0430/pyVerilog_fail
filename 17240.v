module Test
  (
   input clk,
   input toggle,
   input [31:0] cyc
   );
   // Don't flatten out these modules please:
   // verilator no_inline_module
   // Labeled cover
   cyc_eq_5: cover property (@(posedge clk) cyc==5) $display("*COVER: Cyc==5");
endmodule