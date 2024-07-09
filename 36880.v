module sky130_fd_sc_hvl__dfxbp (
    Q   ,
    Q_N ,
    CLK ,
    D   ,
    VPWR,
    VGND,
    VPB ,
    VNB
);
    // Module ports
    output Q   ;
    output Q_N ;
    input  CLK ;
    input  D   ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;
    // Local signals
    wire buf_Q      ;
    wire buf0_out_Q ;
    wire not0_out_qn;
    //                                  Delay       Name         Output       Other arguments
    sky130_fd_sc_hvl__udp_dff$P_pp$PG$N `UNIT_DELAY dff0        (buf_Q      , D, CLK, , VPWR, VGND   );
    buf                                             buf0        (buf0_out_Q , buf_Q                  );
    sky130_fd_sc_hvl__udp_pwrgood_pp$PG             pwrgood_pp0 (Q          , buf0_out_Q, VPWR, VGND );
    not                                             not0        (not0_out_qn, buf_Q                  );
    sky130_fd_sc_hvl__udp_pwrgood_pp$PG             pwrgood_pp1 (Q_N        , not0_out_qn, VPWR, VGND);
endmodule