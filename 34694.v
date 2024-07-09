module sky130_fd_sc_lp__srsdfxtp (
    Q      ,
    CLK    ,
    D      ,
    SCD    ,
    SCE    ,
    SLEEP_B
);
    // Module ports
    output Q      ;
    input  CLK    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  SLEEP_B;
    // Module supplies
    supply1 KAPWR;
    supply1 VPWR ;
    supply0 VGND ;
    supply1 VPB  ;
    supply0 VNB  ;
    // Local signals
    wire buf_Q            ;
    wire mux_out          ;
    wire pwrgood_pp0_out_Q;
    //                                   Delay       Name         Output             Other arguments
    sky130_fd_sc_lp__udp_mux_2to1                    mux_2to10   (mux_out          , D, SCD, SCE                               );
    sky130_fd_sc_lp__udp_dff$P_pp$PKG$sN `UNIT_DELAY dff0        (buf_Q            , mux_out, CLK, SLEEP_B, , KAPWR, VGND, VPWR);
    sky130_fd_sc_lp__udp_pwrgood_pp$PG               pwrgood_pp0 (pwrgood_pp0_out_Q, buf_Q, VPWR, VGND                         );
    buf                                              buf0        (Q                , pwrgood_pp0_out_Q                         );
endmodule