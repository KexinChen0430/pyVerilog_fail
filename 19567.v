module MISTRAL_ALUT2(input A, B, output Q);
parameter [3:0] LUT = 4'h0;
`LCELL #(.lut_mask({16{LUT}})) _TECHMAP_REPLACE_ (.dataa(A), .datab(B), .combout(Q));
endmodule