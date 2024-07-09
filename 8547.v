module sky130_fd_sc_hs__o32ai (
    VPWR,
    VGND,
    Y   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    B2
);
    // Module ports
    input  VPWR;
    input  VGND;
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  B2  ;
    // Local signals
    wire	B1 nor0_out          ;
    wire	B1 nor1_out          ;
    wire    or0_out_Y         ;
    wire    u_vpwr_vgnd0_out_Y;
    //                           Name          Output              Other arguments
    nor                          nor0         (nor0_out          , A3, A1, A2           );
    nor                          nor1         (nor1_out          , B1, B2               );
    or                           or0          (or0_out_Y         , nor1_out, nor0_out   );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_Y, or0_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , u_vpwr_vgnd0_out_Y   );
endmodule