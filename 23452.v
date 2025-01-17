module sky130_fd_sc_ls__sdfbbp (
    Q      ,
    Q_N    ,
    D      ,
    SCD    ,
    SCE    ,
    CLK    ,
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
    input  SCD    ;
    input  SCE    ;
    input  CLK    ;
    input  SET_B  ;
    input  RESET_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;
    // Local signals
    wire RESET  ;
    wire SET    ;
    wire buf_Q  ;
    wire mux_out;
    //                                   Delay       Name       Output   Other arguments
    not                                              not0      (RESET  , RESET_B                               );
    not                                              not1      (SET    , SET_B                                 );
    sky130_fd_sc_ls__udp_mux_2to1                    mux_2to10 (mux_out, D, SCD, SCE                           );
    sky130_fd_sc_ls__udp_dff$NSR_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , SET, RESET, CLK, mux_out, , VPWR, VGND);
    buf                                              buf0      (Q      , buf_Q                                 );
    not                                              not2      (Q_N    , buf_Q                                 );
endmodule