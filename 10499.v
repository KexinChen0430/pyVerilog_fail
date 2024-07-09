module sky130_fd_sc_hvl__dfsbp (
    Q    ,
    Q_N  ,
    CLK  ,
    D    ,
    SET_B,
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
    input  SET_B;
    input  VPWR ;
    input  VGND ;
    input  VPB  ;
    input  VNB  ;
    // Local signals
    wire buf_Q      ;
    wire SET        ;
    wire buf0_out_Q ;
    wire not1_out_qn;
    //                                   Delay       Name         Output       Other arguments
    not                                              not0        (SET        , SET_B                    );
    sky130_fd_sc_hvl__udp_dff$PS_pp$PG$N `UNIT_DELAY dff0        (buf_Q      , D, CLK, SET, , VPWR, VGND);
    buf                                              buf0        (buf0_out_Q , buf_Q                    );
    sky130_fd_sc_hvl__udp_pwrgood_pp$PG              pwrgood_pp0 (Q          , buf0_out_Q, VPWR, VGND   );
    not                                              not1        (not1_out_qn, buf_Q                    );
    sky130_fd_sc_hvl__udp_pwrgood_pp$PG              pwrgood_pp1 (Q_N        , not1_out_qn, VPWR, VGND  );
endmodule