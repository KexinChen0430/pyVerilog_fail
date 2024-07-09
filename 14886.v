module sky130_fd_sc_hs__a2bb2oi (
    VPWR,
    VGND,
    Y   ,
    A1_N,
    A2_N,
    B1  ,
    B2
);
    // Module ports
    input  VPWR;
    input  VGND;
    output Y   ;
    input  A1_N;
    input  A2_N;
    input  B1  ;
    input  B2  ;
    // Local signals
    wire	B2 and0_out          ;
    wire	B2 nor0_out          ;
    wire    nor1_out_Y        ;
    wire    u_vpwr_vgnd0_out_Y;
    //                           Name          Output              Other arguments
    and                          and0         (and0_out          , B1, B2                );
    nor                          nor0         (nor0_out          , A1_N, A2_N            );
    nor                          nor1         (nor1_out_Y        , nor0_out, and0_out    );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_Y, nor1_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , u_vpwr_vgnd0_out_Y    );
endmodule