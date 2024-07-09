module outputs)
   wire [2:0] out2;                     // From foobar0 of foobar.v
   // End of automatics
   assign itf.out3  = out2;
   foobar foobar0
     (/*AUTOINST*/
      // Outputs
      .out2                             (out2[2:0]),
      // Inputs
      .in2                              (in2[2:0]));
endmodule