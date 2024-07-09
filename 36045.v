module ExampInst;
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input [9:0] i; // To instName of InstModule.v
   // End of automatics
   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output      upper_t o;                          // From instName of InstModule.v
   // End of automatics
   InstModule
     #(.WIDTH(10),
       ,.OUT_t(upper_t))
   instName
     (/*AUTOINST*/
      // Outputs
      .o                        (o),
      // Inputs
      .i                        (i[9:0]));
endmodule