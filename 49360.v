module sky130_fd_sc_ms__clkbuf_16 (
    X,
    A
);
    output X;
    input  A;
    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;
    sky130_fd_sc_ms__clkbuf base (
        .X(X),
        .A(A)
    );
endmodule