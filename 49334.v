module sky130_fd_sc_hd__dlxtp (
    Q   ,
    D   ,
    GATE,
    VPWR,
    VGND,
    VPB ,
    VNB
);
    // Module ports
    output Q   ;
    input  D   ;
    input  GATE;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;
    // Local signals
    wire buf_Q;
    //                                    Name     Output  Other arguments
    sky130_fd_sc_hd__udp_dlatch$P_pp$PG$N dlatch0 (buf_Q , D, GATE, , VPWR, VGND);
    buf                                   buf0    (Q     , buf_Q                );
endmodule