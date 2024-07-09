module outputs)
   wire        signal_c; // From u_abc of abc.v
   wire        signal_f;                // From u_def of def.v
   // End of automatics
   /* abc AUTO_TEMPLATE
    (
    // Outputs
    .signal_c                           (signal_c),
    // Inputs
    .signal_a                           ({1'b0, signal_f}),
    .signal_b                           (signal_b[2:0]));
    */
   abc u_abc
     (/*AUTOINST*/
      // Outputs
      .signal_c                         (signal_c),              // Templated
      // Inputs
      .signal_a                         ({1'b0, signal_f}),      // Templated
      .signal_b                         (signal_b[2:0]));        // Templated
   /* def AUTO_TEMPLATE
    (// Outputs
    .signal_f                           (signal_f),
    // Inputs
    .signal_d                           ({1'b1, signal_c}),
    .signal_e                           ({2'b11, signal_e}),
    .signal_e2                  (({2'b11, signal_e2})),
    .signal_e3                  ((signal_e3)) );
    */
   def u_def
     (/*AUTOINST*/
      // Outputs
      .signal_f                         (signal_f),              // Templated
      // Inputs
      .signal_d                         ({1'b1, signal_c}),      // Templated
      .signal_e                         ({2'b11, signal_e}),     // Templated
      .signal_e2                        (({2'b11, signal_e2})),  // Templated
      .signal_e3                        ((signal_e3)));          // Templated
endmodule