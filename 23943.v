module sky130_fd_sc_lp__inputisolatch (
    Q      ,
    D      ,
    SLEEP_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);
    // Module ports
    output Q      ;
    input  D      ;
    input  SLEEP_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;
    // Local signals
    wire buf_Q          ;
    wire SLEEP_B_delayed;
    wire D_delayed      ;
    //                                    Delay       Name     Output  Other arguments
    sky130_fd_sc_lp__udp_dlatch$P_pp$PG$N `UNIT_DELAY dlatch0 (buf_Q , D, SLEEP_B, , VPWR, VGND);
    buf                                               buf0    (Q     , buf_Q                   );
endmodule