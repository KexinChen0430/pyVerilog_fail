module sky130_fd_sc_lp__bufinv_8 (
    Y,
    A
);
    output Y;
    input  A;
    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;
    sky130_fd_sc_lp__bufinv base (
        .Y(Y),
        .A(A)
    );
endmodule