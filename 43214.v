module sky130_fd_sc_ms__dlrtp (
    Q      ,
    RESET_B,
    D      ,
    GATE   ,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);
    // Module ports
    output Q      ;
    input  RESET_B;
    input  D      ;
    input  GATE   ;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;
    // Local signals
    wire RESET;
    wire buf_Q;
    //                                     Delay       Name     Output  Other arguments
    not                                                not0    (RESET , RESET_B                     );
    sky130_fd_sc_ms__udp_dlatch$PR_pp$PG$N `UNIT_DELAY dlatch0 (buf_Q , D, GATE, RESET, , VPWR, VGND);
    buf                                                buf0    (Q     , buf_Q                       );
endmodule