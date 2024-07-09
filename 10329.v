module sky130_fd_sc_hvl__sdlclkp (
    GCLK,
    SCE ,
    GATE,
    CLK ,
    VPWR,
    VGND,
    VPB ,
    VNB
);
    // Module ports
    output GCLK;
    input  SCE ;
    input  GATE;
    input  CLK ;
    input  VPWR;
    input  VGND;
    input  VPB ;
    input  VNB ;
    // Local signals
    wire m0      ;
    wire m0n     ;
    wire clkn    ;
    wire SCE_GATE;
    wire GCLK_b  ;
    //                                     Name         Output    Other arguments
    not                                    not0        (m0n     , m0                          );
    not                                    not1        (clkn    , CLK                         );
    nor                                    nor0        (SCE_GATE, GATE, SCE                   );
    sky130_fd_sc_hvl__udp_dlatch$P_pp$PG$N dlatch0     (m0      , SCE_GATE, clkn, , VPWR, VGND);
    and                                    and0        (GCLK_b  , m0n, CLK                    );
    sky130_fd_sc_hvl__udp_pwrgood_pp$PG    pwrgood_pp0 (GCLK    , GCLK_b, VPWR, VGND          );
endmodule