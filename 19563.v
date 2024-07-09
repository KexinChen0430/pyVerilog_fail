module MISTRAL_ALUT6(input A, B, C, D, E, F, output Q);
parameter [63:0] LUT = 64'h0000_0000_0000_0000;
`LCELL #(.lut_mask(LUT)) _TECHMAP_REPLACE_ (.dataa(A), .datab(B), .datac(C), .datad(D), .datae(E), .dataf(F), .combout(Q));
endmodule