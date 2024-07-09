module sky130_fd_sc_lp__sregsbp (
    Q    ,
    Q_N  ,
    CLK  ,
    D    ,
    SCD  ,
    SCE  ,
    ASYNC,
    VPWR ,
    VGND ,
    VPB  ,
    VNB
);
    // Module ports
    output Q    ;
    output Q_N  ;
    input  CLK  ;
    input  D    ;
    input  SCD  ;
    input  SCE  ;
    input  ASYNC;
    input  VPWR ;
    input  VGND ;
    input  VPB  ;
    input  VNB  ;
    // Local signals
    wire buf_Q  ;
    wire set    ;
    wire mux_out;
    //                                  Delay       Name       Output   Other arguments
    not                                             not0      (set    , ASYNC                          );
    sky130_fd_sc_lp__udp_mux_2to1                   mux_2to10 (mux_out, D, SCD, SCE                    );
    sky130_fd_sc_lp__udp_dff$PS_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, set, , VPWR, VGND);
    buf                                             buf0      (Q      , buf_Q                          );
    not                                             not1      (Q_N    , buf_Q                          );
endmodule