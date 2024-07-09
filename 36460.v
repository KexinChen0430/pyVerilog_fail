module foo_wrapper
  #(parameter bar_bits = 9)
   (output int bar_size);
   foo #(.bar (logic[bar_bits-1:0])) foo_inst (.bar_size (bar_size));
endmodule