module sky130_fd_sc_lp__dlclkp (
    GCLK,
    GATE,
    CLK ,
    VPWR,
    VGND,
    VPB ,
    VNB
);
    // Module ports
    output GCLK;
    input  GATE;
    input  CLK ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;
    // Local signals
    wire m0          ;
    wire clkn        ;
    wire CLK_delayed ;
    wire GATE_delayed;
    //                                    Delay       Name     Output  Other arguments
    not                                               not0    (clkn  , CLK                     );
    sky130_fd_sc_lp__udp_dlatch$P_pp$PG$N `UNIT_DELAY dlatch0 (m0    , GATE, clkn, , VPWR, VGND);
    and                                               and0    (GCLK  , m0, CLK                 );
endmodule