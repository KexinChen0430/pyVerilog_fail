module sky130_fd_sc_hvl__dfxtp (
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
    wire buf_Q     ;
    wire buf0_out_Q;
    //                                  Delay       Name         Output      Other arguments
    sky130_fd_sc_hvl__udp_dff$P_pp$PG$N `UNIT_DELAY dff0        (buf_Q     , D, CLK, , VPWR, VGND  );
    buf                                             buf0        (buf0_out_Q, buf_Q                 );
    sky130_fd_sc_hvl__udp_pwrgood_pp$PG             pwrgood_pp0 (Q         , buf0_out_Q, VPWR, VGND);
endmodule