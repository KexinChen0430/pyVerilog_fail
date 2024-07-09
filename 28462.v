module sky130_fd_sc_lp__dfxtp (
    Q   ,
    CLK ,
    D   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);
    // Module ports
    output Q   ;
    input  CLK ;
    input  D   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;
    // Local signals
    wire buf_Q;
    //                                 Delay       Name  Output  Other arguments
    sky130_fd_sc_lp__udp_dff$P_pp$PG$N `UNIT_DELAY dff0 (buf_Q , D, CLK, , VPWR, VGND);
    buf                                            buf0 (Q     , buf_Q               );
endmodule