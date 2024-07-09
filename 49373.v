module sky130_fd_sc_hs__dfrtp (
    VPWR   ,
    VGND   ,
    Q      ,
    CLK    ,
    D      ,
    RESET_B
);
    // Module ports
    input  VPWR   ;
    input  VGND   ;
    output Q      ;
    input  CLK    ;
    input  D      ;
    input  RESET_B;
    // Local signals
    wire buf_Q;
    wire RESET;
    //                           Delay       Name          Output  Other arguments
    not                                      not0         (RESET , RESET_B                  );
    sky130_fd_sc_hs__u_df_p_r_pg `UNIT_DELAY u_df_p_r_pg0 (buf_Q , D, CLK, RESET, VPWR, VGND);
    buf                                      buf0         (Q     , buf_Q                    );
endmodule