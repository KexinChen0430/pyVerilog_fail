module MISTRAL_MUL9X9(input [8:0] A, B, output [17:0] Y);
parameter A_SIGNED = 1;
parameter B_SIGNED = 1;
`MAC #(
    .ax_width(9),
    .signed_max(A_SIGNED ? "true" : "false"),
    .ay_scan_in_width(9),
    .signed_may(B_SIGNED ? "true" : "false"),
    .result_a_width(18),
    .operation_mode("M9x9")
) _TECHMAP_REPLACE_ (
    .ax(A),
    .ay(B),
    .resulta(Y)
);
endmodule