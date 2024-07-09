module sky130_fd_sc_lp__dlxbn (
    Q     ,
    Q_N   ,
    D     ,
    GATE_N,
    VPWR  ,
    VGND  ,
    VPB   ,
    VNB
);
    // Module ports
    output Q     ;
    output Q_N   ;
    input  D     ;
    input  GATE_N;
    input  VPWR  ;
    input  VGND  ;
    input  VPB   ;
    input  VNB   ;
    // Local signals
    wire GATE          ;
    wire buf_Q         ;
    wire GATE_N_delayed;
    wire D_delayed     ;
    //                                    Delay       Name     Output  Other arguments
    sky130_fd_sc_lp__udp_dlatch$P_pp$PG$N `UNIT_DELAY dlatch0 (buf_Q , D, GATE, , VPWR, VGND);
    not                                               not0    (GATE  , GATE_N               );
    buf                                               buf0    (Q     , buf_Q                );
    not                                               not1    (Q_N   , buf_Q                );
endmodule