module v6c3aff_v34955f #(
 parameter ON = 0
) (
 input i,
 output o
);
 // 1-Pull up
 SB_IO
   #(
     .PIN_TYPE(6'b 1010_01),
     .PULLUP(ON)
   ) input_pin (
     .PACKAGE_PIN(i),
     .D_IN_0(o),
     .OUTPUT_ENABLE(1'b0),
     .D_OUT_0(1'b0)
   );
endmodule