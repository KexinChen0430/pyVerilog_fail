module MISTRAL_ALUT3(input A, B, C, output Q);
parameter [7:0] LUT = 8'h00;
`LCELL #(.lut_mask({8{LUT}})) _TECHMAP_REPLACE_ (.dataa(A), .datab(B), .datac(C), .combout(Q));
endmodule