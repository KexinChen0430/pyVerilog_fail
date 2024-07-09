module sky130_fd_sc_hs__a2111oi (
    Y   ,
    A1  ,
    A2  ,
    B1  ,
    C1  ,
    D1  ,
    VPWR,
    VGND
);
    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  C1  ;
    input  D1  ;
    input  VPWR;
    input  VGND;
    // Local signals
    wire	C1 and0_out          ;
    wire    nor0_out_Y        ;
    wire    u_vpwr_vgnd0_out_Y;
    //                           Name          Output              Other arguments
    and                          and0         (and0_out          , A1, A2                );
    nor                          nor0         (nor0_out_Y        , B1, C1, D1, and0_out  );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_Y, nor0_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , u_vpwr_vgnd0_out_Y    );
endmodule