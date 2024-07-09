module sky130_fd_sc_lp__isolatch (
    Q      ,
    D      ,
    SLEEP_B,
    KAPWR  ,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);
    // Module ports
    output Q      ;
    input  D      ;
    input  SLEEP_B;
    input  KAPWR  ;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;
    // Local signals
    wire buf_Q          ;
    wire SLEEP_B_delayed;
    wire D_delayed      ;
    //                                      Delay       Name          Output  Other arguments
    sky130_fd_sc_lp__udp_isolatch_pp$PKG$sN `UNIT_DELAY isolatch_pp0 (buf_Q , D, SLEEP_B, , KAPWR, VGND, VPWR);
    buf                                                 buf0         (Q     , buf_Q                          );
endmodule