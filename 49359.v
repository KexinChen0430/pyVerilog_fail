module sky130_fd_sc_ms__clkbuf_16 (
    X   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);
    output X   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;
    sky130_fd_sc_ms__clkbuf base (
        .X(X),
        .A(A),
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB)
    );
endmodule