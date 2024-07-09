module sky130_fd_sc_lp__srsdfrtp (
    Q      ,
    CLK    ,
    D      ,
    SCD    ,
    SCE    ,
    RESET_B,
    SLEEP_B
);
    // Module ports
    output Q      ;
    input  CLK    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  RESET_B;
    input  SLEEP_B;
    // Module supplies
    supply1 KAPWR;
    supply1 VPWR ;
    supply0 VGND ;
    supply1 VPB  ;
    supply0 VNB  ;
    // Local signals
    wire RESET            ;
    wire mux_out          ;
    wire buf_Q            ;
    wire pwrgood_pp0_out_Q;
    //                                    Delay       Name         Output             Other arguments
    not                                               not0        (RESET            , RESET_B                                          );
    sky130_fd_sc_lp__udp_mux_2to1                     mux_2to10   (mux_out          , D, SCD, SCE                                      );
    sky130_fd_sc_lp__udp_dff$PR_pp$PKG$sN `UNIT_DELAY dff0        (buf_Q            , mux_out, CLK, RESET, SLEEP_B, , KAPWR, VGND, VPWR);
    sky130_fd_sc_lp__udp_pwrgood_pp$PG                pwrgood_pp0 (pwrgood_pp0_out_Q, buf_Q, VPWR, VGND                                );
    buf                                               buf0        (Q                , pwrgood_pp0_out_Q                                );
endmodule