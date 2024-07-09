module sky130_fd_sc_lp__a21o_m (
    X ,
    A1,
    A2,
    B1
);
    output X ;
    input  A1;
    input  A2;
    input  B1;
    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;
    sky130_fd_sc_lp__a21o base (
        .X(X),
        .A1(A1),
        .A2(A2),
        .B1(B1)
    );
endmodule