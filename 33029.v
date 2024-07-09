module sky130_fd_sc_hvl__sdfstp (
    Q    ,
    CLK  ,
    D    ,
    SCD  ,
    SCE  ,
    SET_B,
    VPWR ,
    VGND ,
    VPB  ,
    VNB
);
    // Module ports
    output Q    ;
    input  CLK  ;
    input  D    ;
    input  SCD  ;
    input  SCE  ;
    input  SET_B;
    input  VPWR ;
    input  VGND ;
    input  VPB  ;
    input  VNB  ;
    // Local signals
    wire buf_Q     ;
    wire SET       ;
    wire mux_out   ;
    wire buf0_out_Q;
    //                                   Delay       Name         Output      Other arguments
    not                                              not0        (SET       , SET_B                          );
    sky130_fd_sc_hvl__udp_mux_2to1                   mux_2to10   (mux_out   , D, SCD, SCE                    );
    sky130_fd_sc_hvl__udp_dff$PS_pp$PG$N `UNIT_DELAY dff0        (buf_Q     , mux_out, CLK, SET, , VPWR, VGND);
    buf                                              buf0        (buf0_out_Q, buf_Q                          );
    sky130_fd_sc_hvl__udp_pwrgood_pp$PG              pwrgood_pp0 (Q         , buf0_out_Q, VPWR, VGND         );
endmodule