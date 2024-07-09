module sky130_fd_sc_lp__bushold0_1 (
    X    ,
    RESET
);
    inout X    ;
    input RESET;
    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;
    sky130_fd_sc_lp__bushold0 base (
        .X(X),
        .RESET(RESET)
    );
endmodule