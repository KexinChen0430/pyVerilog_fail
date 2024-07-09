module sky130_fd_sc_lp__bufinv_8 (
    Y   ,
    A   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);
    output Y   ;
    input  A   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;
    sky130_fd_sc_lp__bufinv base (
        .Y(Y),
        .A(A),
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB)
    );
endmodule