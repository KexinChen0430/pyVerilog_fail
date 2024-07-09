module __TFF_P_ALWAYS_ (C, Q);
input C;
output wire Q;
wire notout;
$_NOT_ notgate (
    .A(Q),
    .Y(notout),
);
$_DFF_P_ dff (
    .C(C),
    .D(notout),
    .Q(Q),
);
endmodule