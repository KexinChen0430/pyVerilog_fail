module a_h
  // Verilog 2001 style
  #(parameter M=5, N=3)
   (
    // Outputs
    output [N-1:0] [M-1:0] a_o1         // From Ia of autoinst_sv_kulkarni_base.v
    // End of automatics
    // AUTOINPUT*/
    );
   /*AUTOWIRE*/
   autoinst_sv_kulkarni_base
     #(/*AUTOINSTPARAM*/
       // Parameters
       .M                               (M),
       .N                               (N))
   Ia
     (/*AUTOINST*/
      // Outputs
      .a_o1                             (a_o1/*[N-1:0][M-1:0]*/),
      // Inputs
      .a_i1                             (a_i1/*[N-1:0][M-1:0]*/)); // <---- BUG?
endmodule