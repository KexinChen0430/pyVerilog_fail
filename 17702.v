module MISTRAL_ALUT_ARITH(input A, B, C, D0, D1, (* abc9_carry *) input CI, output SO, (* abc9_carry *) output CO);
parameter LUT0 = 16'h0000;
parameter LUT1 = 16'h0000;
`ifdef cyclonev
specify
    (A  => SO) = 1342;
    (B  => SO) = 1323;
    (C  => SO) = 927;
    (D0 => SO) = 887;
    (D1 => SO) = 785;
    (CI => SO) = 368;
    (A  => CO) = 1082;
    (B  => CO) = 1062;
    (C  => CO) = 813;
    (D0 => CO) = 866;
    (D1 => CO) = 1198;
    (CI => CO) = 36; // Divided by 2 to account for there being two ALUT_ARITHs in an ALM)
endspecify
`endif
`ifdef cyclone10gx
specify
    (A  => SO) = 644;
    (B  => SO) = 477;
    (C  => SO) = 416;
    (D0 => SO) = 380;
    (D1 => SO) = 431;
    (CI => SO) = 276;
    (A  => CO) = 525;
    (B  => CO) = 433;
    (C  => CO) = 712;
    (D0 => CO) = 653;
    (D1 => CO) = 593;
    (CI => CO) = 16;
endspecify
`endif
wire q0, q1;
assign q0 = LUT0 >> {D0, C, B, A};
assign q1 = LUT1 >> {D1, C, B, A};
assign {CO, SO} = q0 + !q1 + CI;
endmodule