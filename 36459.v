module foo
  #(parameter type bar = logic)
   (output int bar_size);
   localparam baz = $bits(bar);
   assign bar_size = baz;
endmodule