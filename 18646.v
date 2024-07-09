module foo2 #(parameter QUX = 0);
   genvar x;
   generate
      for (x = 0; x < 2; x++) begin: foo2_loop
         foo #(.BAR (QUX + x)) foo_in_foo2_inst();
      end
   endgenerate
endmodule