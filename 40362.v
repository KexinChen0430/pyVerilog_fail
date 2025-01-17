module sky130_fd_sc_hd__dlrbn (
    Q      ,
    Q_N    ,
    RESET_B,
    D      ,
    GATE_N ,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);
    // Module ports
    output Q      ;
    output Q_N    ;
    input  RESET_B;
    input  D      ;
    input  GATE_N ;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;
    // Local signals
    wire RESET  ;
    wire intgate;
    wire buf_Q  ;
    //                                     Delay       Name     Output   Other arguments
    not                                                not0    (RESET  , RESET_B                        );
    not                                                not1    (intgate, GATE_N                         );
    sky130_fd_sc_hd__udp_dlatch$PR_pp$PG$N `UNIT_DELAY dlatch0 (buf_Q  , D, intgate, RESET, , VPWR, VGND);
    buf                                                buf0    (Q      , buf_Q                          );
    not                                                not2    (Q_N    , buf_Q                          );
endmodule