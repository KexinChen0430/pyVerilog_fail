module sky130_fd_sc_hs__a41oi (
    Y   ,
    A1  ,
    A2  ,
    A3  ,
    A4  ,
    B1  ,
    VPWR,
    VGND
);
    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  A4  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    // Local signals
    wire	A4 and0_out          ;
    wire    nor0_out_Y        ;
    wire    u_vpwr_vgnd0_out_Y;
    //                           Name          Output              Other arguments
    and                          and0         (and0_out          , A1, A2, A3, A4        );
    nor                          nor0         (nor0_out_Y        , B1, and0_out          );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , u_vpwr_vgnd0_out_Y    );
endmodule