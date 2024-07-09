module MISTRAL_ALUT_ARITH(input A, B, C, D0, D1, CI, output SO, CO);
parameter LUT0 = 16'h0000;
parameter LUT1 = 16'h0000;
`LCELL #(.lut_mask({16'h0, LUT1, 16'h0, LUT0})) _TECHMAP_REPLACE_ (.dataa(A), .datab(B), .datac(C), .datad(D0), .dataf(D1), .cin(CI), .sumout(SO), .cout(CO));
endmodule