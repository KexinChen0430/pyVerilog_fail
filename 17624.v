module B
   /* moduleB AUTO_TEMPLATE (
    .[iot]_\(.*\)        (@"(vl-prefix-i-o vl-dir)"\1[]),
    ); */
   moduleB u1(
              /*AUTOINST*/
              // Outputs
              .o_B_outsideo             (o_B_outsideo),          // Templated
              .o_B_internal             (o_B_internal),          // Templated
              // Inputs
              .i_B_outsidei             (i_B_outsidei),          // Templated
              .i_A_internal             (i_A_internal));                 // Templated
endmodule