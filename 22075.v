module sky130_fd_sc_hs__nor4bb (
    VPWR,
    VGND,
    Y   ,
    A   ,
    B   ,
    C_N ,
    D_N
);
    // Module ports
    input  VPWR;
    input  VGND;
    output Y   ;
    input  A   ;
    input  B   ;
    input  C_N ;
    input  D_N ;
    // Local signals
    wire	DN nor0_out          ;
    wire    and0_out_Y        ;
    wire    u_vpwr_vgnd0_out_Y;
    //                           Name          Output              Other arguments
    nor                          nor0         (nor0_out          , A, B                  );
    and                          and0         (and0_out_Y        , nor0_out, C_N, D_N    );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_Y, and0_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , u_vpwr_vgnd0_out_Y    );
endmodule