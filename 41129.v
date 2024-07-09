module sky130_fd_sc_ls__edfxbp (
    Q   ,
    Q_N ,
    CLK ,
    D   ,
    DE  ,
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
    input  DE  ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;
    // Local signals
    wire buf_Q  ;
    wire mux_out;
    //                                 Delay       Name       Output   Other arguments
    sky130_fd_sc_ls__udp_mux_2to1                  mux_2to10 (mux_out, buf_Q, D, DE              );
    sky130_fd_sc_ls__udp_dff$P_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, , VPWR, VGND);
    buf                                            buf0      (Q      , buf_Q                     );
    not                                            not0      (Q_N    , buf_Q                     );
endmodule