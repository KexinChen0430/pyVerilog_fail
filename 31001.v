module sky130_fd_sc_hs__nor4b (
    VPWR,
    VGND,
    Y   ,
    A   ,
    B   ,
    C   ,
    D_N
);
    // Module ports
    input  VPWR;
    input  VGND;
    output Y   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  D_N ;
    // Local signals
    wire	DN not0_out          ;
    wire    nor0_out_Y        ;
    wire    u_vpwr_vgnd0_out_Y;
    //                           Name          Output              Other arguments
    not                          not0         (not0_out          , D_N                   );
    nor                          nor0         (nor0_out_Y        , A, B, C, not0_out     );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , u_vpwr_vgnd0_out_Y    );
endmodule