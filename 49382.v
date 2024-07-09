module sky130_fd_sc_lp__bushold0_1 (
    X    ,
    RESET,
    VPWR ,
    VGND ,
    VPB  ,
    VNB
);
    inout X    ;
    input RESET;
    input VPWR ;
    input VGND ;
    input VPB  ;
    input VNB  ;
    sky130_fd_sc_lp__bushold0 base (
        .X(X),
        .RESET(RESET),
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPB),
        .VNB(VNB)
    );
endmodule