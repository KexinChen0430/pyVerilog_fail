module MISTRAL_ALUT5(input A, B, C, D, E, output Q);
parameter [31:0] LUT = 32'h0000_0000;
`LCELL #(.lut_mask({2{LUT}})) _TECHMAP_REPLACE_ (.dataa(A), .datab(B), .datac(C), .datad(D), .datae(E), .combout(Q));
endmodule