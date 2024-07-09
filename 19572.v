module MISTRAL_MUL27X27(input [26:0] A, B, output [53:0] Y);
parameter A_SIGNED = 1;
parameter B_SIGNED = 1;
`MAC #(
    .ax_width(27),
    .signed_max(A_SIGNED ? "true" : "false"),
    .ay_scan_in_width(27),
    .signed_may(B_SIGNED ? "true" : "false"),
    .result_a_width(54),
    .operation_mode("M27x27")
) _TECHMAP_REPLACE_ (
    .ax(A),
    .ay(B),
    .resulta(Y)
);
endmodule