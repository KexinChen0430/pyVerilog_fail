module sky130_fd_sc_hvl__dlclkp (
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
    wire m0    ;
    wire clkn  ;
    wire GCLK_b;
    //                                     Name         Output  Other arguments
    not                                    not0        (clkn  , CLK                     );
    sky130_fd_sc_hvl__udp_dlatch$P_pp$PG$N dlatch0     (m0    , GATE, clkn, , VPWR, VGND);
    and                                    and0        (GCLK_b, m0, CLK                 );
    sky130_fd_sc_hvl__udp_pwrgood_pp$PG    pwrgood_pp0 (GCLK  , GCLK_b, VPWR, VGND      );
endmodule