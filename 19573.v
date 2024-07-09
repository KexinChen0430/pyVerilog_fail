module MISTRAL_MUL18X18(input [17:0] A, B, output [35:0] Y);
parameter A_SIGNED = 1;
parameter B_SIGNED = 1;
`MAC #(
    .ax_width(18),
    .signed_max(A_SIGNED ? "true" : "false"),
    .ay_scan_in_width(18),
    .signed_may(B_SIGNED ? "true" : "false"),
    .result_a_width(36),
    .operation_mode("M18x18_FULL")
) _TECHMAP_REPLACE_ (
    .ax(A),
    .ay(B),
    .resulta(Y)
);
endmodule