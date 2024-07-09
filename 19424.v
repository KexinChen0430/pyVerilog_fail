module sky130_fd_sc_hvl__dlrtp (
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
    wire RESET     ;
    wire buf_Q     ;
    wire buf0_out_Q;
    //                                      Delay       Name         Output      Other arguments
    not                                                 not0        (RESET     , RESET_B                     );
    sky130_fd_sc_hvl__udp_dlatch$PR_pp$PG$N `UNIT_DELAY dlatch0     (buf_Q     , D, GATE, RESET, , VPWR, VGND);
    buf                                                 buf0        (buf0_out_Q, buf_Q                       );
    sky130_fd_sc_hvl__udp_pwrgood_pp$PG                 pwrgood_pp0 (Q         , buf0_out_Q, VPWR, VGND      );
endmodule