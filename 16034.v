module sky130_fd_sc_hs__a31oi (
    VPWR,
    VGND,
    Y   ,
    A1  ,
    A2  ,
    A3  ,
    B1
);
    // Module ports
    input  VPWR;
    input  VGND;
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    // Local signals
    wire	B1 and0_out          ;
    wire    nor0_out_Y        ;
    wire    u_vpwr_vgnd0_out_Y;
    //                           Name          Output              Other arguments
    and                          and0         (and0_out          , A3, A1, A2            );
    nor                          nor0         (nor0_out_Y        , B1, and0_out          );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , u_vpwr_vgnd0_out_Y    );
endmodule