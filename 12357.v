module sky130_fd_sc_hd__sedfxtp (
    Q   ,
    CLK ,
    D   ,
    DE  ,
    SCD ,
    SCE ,
    VPWR,
    VGND,
    VPB ,
    VNB
);
    // Module ports
    output Q   ;
    input  CLK ;
    input  D   ;
    input  DE  ;
    input  SCD ;
    input  SCE ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;
    // Local signals
    wire buf_Q  ;
    wire mux_out;
    wire de_d   ;
    //                                 Delay       Name       Output   Other arguments
    sky130_fd_sc_hd__udp_mux_2to1                  mux_2to10 (mux_out, de_d, SCD, SCE            );
    sky130_fd_sc_hd__udp_mux_2to1                  mux_2to11 (de_d   , buf_Q, D, DE              );
    sky130_fd_sc_hd__udp_dff$P_pp$PG$N `UNIT_DELAY dff0      (buf_Q  , mux_out, CLK, , VPWR, VGND);
    buf                                            buf0      (Q      , buf_Q                     );
endmodule