module sky130_fd_sc_ms__dfbbn (
    Q      ,
    Q_N    ,
    D      ,
    CLK_N  ,
    SET_B  ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);
    // Module ports
    output Q      ;
    output Q_N    ;
    input  D      ;
    input  CLK_N  ;
    input  SET_B  ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;
    // Local signals
    wire RESET;
    wire SET  ;
    wire CLK  ;
    wire buf_Q;
    //                                   Delay       Name  Output  Other arguments
    not                                              not0 (RESET , RESET_B                         );
    not                                              not1 (SET   , SET_B                           );
    not                                              not2 (CLK   , CLK_N                           );
    sky130_fd_sc_ms__udp_dff$NSR_pp$PG$N `UNIT_DELAY dff0 (buf_Q , SET, RESET, CLK, D, , VPWR, VGND);
    buf                                              buf0 (Q     , buf_Q                           );
    not                                              not3 (Q_N   , buf_Q                           );
endmodule