module sky130_fd_sc_lp__dfrtn (
    Q      ,
    CLK_N  ,
    D      ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);
    // Module ports
    output Q      ;
    input  CLK_N  ;
    input  D      ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;
    // Local signals
    wire buf_Q ;
    wire RESET ;
    wire intclk;
    //                                  Delay       Name  Output  Other arguments
    not                                             not0 (RESET , RESET_B                       );
    not                                             not1 (intclk, CLK_N                         );
    sky130_fd_sc_lp__udp_dff$PR_pp$PG$N `UNIT_DELAY dff0 (buf_Q , D, intclk, RESET, , VPWR, VGND);
    buf                                             buf0 (Q     , buf_Q                         );
endmodule