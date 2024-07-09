module MISTRAL_ALUT4(input A, B, C, D, output Q);
parameter [15:0] LUT = 16'h0000;
`LCELL #(.lut_mask({4{LUT}})) _TECHMAP_REPLACE_ (.dataa(A), .datab(B), .datac(C), .datad(D), .combout(Q));
endmodule