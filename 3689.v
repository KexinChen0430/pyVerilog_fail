module sky130_fd_sc_ls__sdfxbp (
    Q   ,
    Q_N ,
    CLK ,
    D   ,
    SCD ,
    SCE ,
    VPWR,
    VGND,
    VPB ,
    VNB
);
    // Module ports
    output Q   ;
    output Q_N ;
    input  CLK ;
    input  D   ;
    input  SCD ;
    input  SCE ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;
    // Local signals
    wire buf_Q  ;
    wire mux_out;
    //                                 Delay       Name       Output   Other arguments
    sky130_fd_sc_ls__udp_mux_2to1                  mux_2to10 (mux_out, D, SCD, SCE               );
    sky130_fd_sc_ls__udp_dff$P_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, , VPWR, VGND);
    buf                                            buf0      (Q      , buf_Q                     );
    not                                            not0      (Q_N    , buf_Q                     );
endmodule