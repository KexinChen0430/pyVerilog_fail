module arr (
  input clk
); // arr
   parameter LENGTH = 1;
   reg [LENGTH-1:0] sig0 `EXM_VLTOR_PUBLIC_RW;
   reg [LENGTH-1:0] sig1 `EXM_VLTOR_PUBLIC_RW;
   reg verbose           `EXM_VLTOR_PUBLIC_RW;
   always @(posedge clk)
     begin
       if (sig0 != sig1) `EXM_ERROR("%m : %x != %x", sig0, sig1);
       else if (verbose) `EXM_INFORMATION("%m : %x == %x", sig0, sig1);
     end
endmodule