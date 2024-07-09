module sky130_fd_sc_hd__dlxbp (
    Q   ,
    Q_N ,
    D   ,
    GATE,
    VPWR,
    VGND,
    VPB ,
    VNB
);
    // Module ports
    output Q   ;
    output Q_N ;
    input  D   ;
    input  GATE;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;
    // Local signals
    wire buf_Q;
    //                                    Delay       Name     Output  Other arguments
    sky130_fd_sc_hd__udp_dlatch$P_pp$PG$N `UNIT_DELAY dlatch0 (buf_Q , D, GATE, , VPWR, VGND);
    buf                                               buf0    (Q     , buf_Q                );
    not                                               not0    (Q_N   , buf_Q                );
endmodule