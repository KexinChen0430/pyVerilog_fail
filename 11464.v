module sky130_fd_sc_hdll__dfstp (
    Q    ,
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
    input  CLK  ;
    input  D    ;
    input  SET_B;
    input  VPWR ;
    input  VGND ;
    input  VPB  ;
    input  VNB  ;
    // Local signals
    wire buf_Q;
    wire SET  ;
    //                                    Delay       Name  Output  Other arguments
    not                                               not0 (SET   , SET_B                    );
    sky130_fd_sc_hdll__udp_dff$PS_pp$PG$N `UNIT_DELAY dff0 (buf_Q , D, CLK, SET, , VPWR, VGND);
    buf                                               buf0 (Q     , buf_Q                    );
endmodule