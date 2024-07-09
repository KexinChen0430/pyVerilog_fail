module CARRY4_VPR(O0, O1, O2, O3, CO0, CO1, CO2, CO3, CYINIT, CIN, DI0, DI1, DI2, DI3, S0, S1, S2, S3);
  parameter CYINIT_AX = 1'b0;
  parameter CYINIT_C0 = 1'b0;
  parameter CYINIT_C1 = 1'b0;
  (* DELAY_CONST_CYINIT="0.491e-9" *)
  (* DELAY_CONST_CIN="0.235e-9" *)
  (* DELAY_CONST_S0="0.223e-9" *)
  output wire O0;
  (* DELAY_CONST_CYINIT="0.613e-9" *)
  (* DELAY_CONST_CIN="0.348e-9" *)
  (* DELAY_CONST_S0="0.400e-9" *)
  (* DELAY_CONST_S1="0.205e-9" *)
  (* DELAY_CONST_DI0="0.337e-9" *)
  output wire O1;
  (* DELAY_CONST_CYINIT="0.600e-9" *)
  (* DELAY_CONST_CIN="0.256e-9" *)
  (* DELAY_CONST_S0="0.523e-9" *)
  (* DELAY_CONST_S1="0.558e-9" *)
  (* DELAY_CONST_S2="0.226e-9" *)
  (* DELAY_CONST_DI0="0.486e-9" *)
  (* DELAY_CONST_DI1="0.471e-9" *)
  output wire O2;
  (* DELAY_CONST_CYINIT="0.657e-9" *)
  (* DELAY_CONST_CIN="0.329e-9" *)
  (* DELAY_CONST_S0="0.582e-9" *)
  (* DELAY_CONST_S1="0.618e-9" *)
  (* DELAY_CONST_S2="0.330e-9" *)
  (* DELAY_CONST_S3="0.227e-9" *)
  (* DELAY_CONST_DI0="0.545e-9" *)
  (* DELAY_CONST_DI1="0.532e-9" *)
  (* DELAY_CONST_DI2="0.372e-9" *)
  output wire O3;
  (* DELAY_CONST_CYINIT="0.578e-9" *)
  (* DELAY_CONST_CIN="0.293e-9" *)
  (* DELAY_CONST_S0="0.340e-9" *)
  (* DELAY_CONST_DI0="0.329e-9" *)
  output wire CO0;
  (* DELAY_CONST_CYINIT="0.529e-9" *)
  (* DELAY_CONST_CIN="0.178e-9" *)
  (* DELAY_CONST_S0="0.433e-9" *)
  (* DELAY_CONST_S1="0.469e-9" *)
  (* DELAY_CONST_DI0="0.396e-9" *)
  (* DELAY_CONST_DI1="0.376e-9" *)
  output wire CO1;
  (* DELAY_CONST_CYINIT="0.617e-9" *)
  (* DELAY_CONST_CIN="0.250e-9" *)
  (* DELAY_CONST_S0="0.512e-9" *)
  (* DELAY_CONST_S1="0.548e-9" *)
  (* DELAY_CONST_S2="0.292e-9" *)
  (* DELAY_CONST_DI0="0.474e-9" *)
  (* DELAY_CONST_DI1="0.459e-9" *)
  (* DELAY_CONST_DI2="0.289e-9" *)
  output wire CO2;
  (* DELAY_CONST_CYINIT="0.580e-9" *)
  (* DELAY_CONST_CIN="0.114e-9" *)
  (* DELAY_CONST_S0="0.508e-9" *)
  (* DELAY_CONST_S1="0.528e-9" *)
  (* DELAY_CONST_S2="0.376e-9" *)
  (* DELAY_CONST_S3="0.380e-9" *)
  (* DELAY_CONST_DI0="0.456e-9" *)
  (* DELAY_CONST_DI1="0.443e-9" *)
  (* DELAY_CONST_DI2="0.324e-9" *)
  (* DELAY_CONST_DI3="0.327e-9" *)
  output wire CO3;
  input wire DI0, DI1, DI2, DI3;
  input wire S0, S1, S2, S3;
  input wire CYINIT;
  input wire CIN;
  wire CI0;
  wire CI1;
  wire CI2;
  wire CI3;
  wire CI4;
  assign CI0 = CYINIT_AX ? CYINIT :
               CYINIT_C1 ? 1'b1 :
               CYINIT_C0 ? 1'b0 :
               CIN;
  assign CI1 = S0 ? CI0 : DI0;
  assign CI2 = S1 ? CI1 : DI1;
  assign CI3 = S2 ? CI2 : DI2;
  assign CI4 = S3 ? CI3 : DI3;
  assign CO0 = CI1;
  assign CO1 = CI2;
  assign CO2 = CI3;
  assign CO3 = CI4;
  assign O0 = CI0 ^ S0;
  assign O1 = CI1 ^ S1;
  assign O2 = CI2 ^ S2;
  assign O3 = CI3 ^ S3;
  specify
    // https://github.com/SymbiFlow/prjxray-db/blob/34ea6eb08a63d21ec16264ad37a0a7b142ff6031/artix7/timings/CLBLL_L.sdf#L11-L46
    (CYINIT => O0) = 482;
    (S0     => O0) = 223;
    (CIN    => O0) = 222;
    (CYINIT => O1) = 598;
    (DI0    => O1) = 407;
    (S0     => O1) = 400;
    (S1     => O1) = 205;
    (CIN    => O1) = 334;
    (CYINIT => O2) = 584;
    (DI0    => O2) = 556;
    (DI1    => O2) = 537;
    (S0     => O2) = 523;
    (S1     => O2) = 558;
    (S2     => O2) = 226;
    (CIN    => O2) = 239;
    (CYINIT => O3) = 642;
    (DI0    => O3) = 615;
    (DI1    => O3) = 596;
    (DI2    => O3) = 438;
    (S0     => O3) = 582;
    (S1     => O3) = 618;
    (S2     => O3) = 330;
    (S3     => O3) = 227;
    (CIN    => O3) = 313;
    (CYINIT => CO0) = 536;
    (DI0    => CO0) = 379;
    (S0     => CO0) = 340;
    (CIN    => CO0) = 271;
    (CYINIT => CO1) = 494;
    (DI0    => CO1) = 465;
    (DI1    => CO1) = 445;
    (S0     => CO1) = 433;
    (S1     => CO1) = 469;
    (CIN    => CO1) = 157;
    (CYINIT => CO2) = 592;
    (DI0    => CO2) = 540;
    (DI1    => CO2) = 520;
    (DI2    => CO2) = 356;
    (S0     => CO2) = 512;
    (S1     => CO2) = 548;
    (S2     => CO2) = 292;
    (CIN    => CO2) = 228;
    (CYINIT => CO3) = 580;
    (DI0    => CO3) = 526;
    (DI1    => CO3) = 507;
    (DI2    => CO3) = 398;
    (DI3    => CO3) = 385;
    (S0     => CO3) = 508;
    (S1     => CO3) = 528;
    (S2     => CO3) = 378;
    (S3     => CO3) = 380;
    (CIN    => CO3) = 114;
  endspecify
endmodule