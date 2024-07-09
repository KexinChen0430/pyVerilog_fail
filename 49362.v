module sky130_fd_sc_ms__o221ai_4 (
    Y ,
    A1,
    A2,
    B1,
    B2,
    C1
);
    output Y ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;
    input  C1;
    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;
    sky130_fd_sc_ms__o221ai base (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .B2(B2),
        .C1(C1)
    );
endmodule