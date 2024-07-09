module ptype
  (
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input              foo_t a, // To b0 of ptype_buf.v, ...
   // End of automatics
   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output             foo_t y0, // From b0 of ptype_buf.v
   output logic [7:0] y1, // From b1 of ptype_buf.v
   output             TYPE_T y2                 // From b2 of ptype_buf.v
   // End of automatics
   );
   ptype_buf #(.TYPE_T(foo_t)) b0
     (// Outputs
      .y                                (y0),
      /*AUTOINST*/
      // Inputs
      .a                                (a));
   ptype_buf #(.TYPE_T(logic [7:0])) b1
     (// Outputs
      .y                                (y1),
      /*AUTOINST*/
      // Inputs
      .a                                (a));
   ptype_buf #(.WIDTH(8)) b2
     (// Outputs
      .y                                (y2),
      /*AUTOINST*/
      // Inputs
      .a                                (a));
endmodule