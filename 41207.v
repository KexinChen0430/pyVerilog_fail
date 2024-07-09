module outputs)
   logic [7:0]        stage2_bus;               // From i_first of sub_module.v
   // End of automatics
   /*AUTOREG*/
   /* sub_module AUTO_TEMPLATE
    (
    .i_\(.*\)      (stage1_\1[]),
    .o_\(.*\)      (stage2_\1[]),
    );  */
   sub_module i_first (/*AUTOINST*/
                       // Outputs
                       .o_bus           (stage2_bus[7:0]),       // Templated
                       // Inputs
                       .i_bus           (stage1_bus[7:0]));      // Templated
   /* sub_module AUTO_TEMPLATE
    (
    .i_\(.*\)      (stage2_\1[]),
    .o_\(.*\)      (stage3_\1[]),
    ); */
   sub_module i_second (/*AUTOINST*/
                        // Outputs
                        .o_bus          (stage3_bus[7:0]),       // Templated
                        // Inputs
                        .i_bus          (stage2_bus[7:0]));      // Templated
endmodule