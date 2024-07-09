module __TFF_N_ALWAYS_ (C, Q);
input C;
output wire Q;
wire notout;
$_NOT_ notgate (
    .A(Q),
    .Y(notout),
);
$_DFF_N_ dff (
    .C(C),
    .D(notout),
    .Q(Q),
);
endmodule