module sky130_fd_sc_hdll__dfrtp (
    Q      ,
    CLK    ,
    D      ,
    RESET_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);
    // Module ports
    output Q      ;
    input  CLK    ;
    input  D      ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;
    // Local signals
    wire buf_Q;
    wire RESET;
    //                                    Delay       Name  Output  Other arguments
    not                                               not0 (RESET , RESET_B                    );
    sky130_fd_sc_hdll__udp_dff$PR_pp$PG$N `UNIT_DELAY dff0 (buf_Q , D, CLK, RESET, , VPWR, VGND);
    buf                                               buf0 (Q     , buf_Q                      );
endmodule