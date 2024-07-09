module sky130_fd_sc_ls__nand2b_4 (
    Y   ,
    A_N ,
    B   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);
    output Y   ;
    input  A_N ;
    input  B   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;
    sky130_fd_sc_ls__nand2b base (
        .Y(Y),
        .A_N(A_N),
        .B(B),
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB)
    );
endmodule