module sky130_fd_sc_ms__dlxbn (
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
    reg  notifier      ;
    wire awake         ;
    wire 1             ;
    //                                    Name     Output  Other arguments
    not                                   not0    (GATE  , GATE_N_delayed                       );
    sky130_fd_sc_ms__udp_dlatch$P_pp$PG$N dlatch0 (buf_Q , D_delayed, GATE, notifier, VPWR, VGND);
    assign awake = ( VPWR === 1 );
    buf                                   buf0    (Q     , buf_Q                                );
    not                                   not1    (Q_N   , buf_Q                                );
endmodule