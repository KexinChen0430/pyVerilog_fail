module sky130_fd_sc_hvl__sdfrtp (
    Q      ,
    CLK    ,
    D      ,
    SCD    ,
    SCE    ,
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
    input  SCD    ;
    input  SCE    ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;
    // Local signals
    wire buf_Q     ;
    wire RESET     ;
    wire mux_out   ;
    wire buf0_out_Q;
    //                                   Delay       Name         Output      Other arguments
    not                                              not0        (RESET     , RESET_B                          );
    sky130_fd_sc_hvl__udp_mux_2to1                   mux_2to10   (mux_out   , D, SCD, SCE                      );
    sky130_fd_sc_hvl__udp_dff$PR_pp$PG$N `UNIT_DELAY dff0        (buf_Q     , mux_out, CLK, RESET, , VPWR, VGND);
    buf                                              buf0        (buf0_out_Q, buf_Q                            );
    sky130_fd_sc_hvl__udp_pwrgood_pp$PG              pwrgood_pp0 (Q         , buf0_out_Q, VPWR, VGND           );
endmodule