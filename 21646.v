module sky130_fd_sc_hs__nor2b (
    VPWR,
    VGND,
    Y   ,
    A   ,
    B_N
);
    // Module ports
    input  VPWR;
    input  VGND;
    output Y   ;
    input  A   ;
    input  B_N ;
    // Local signals
    wire	Y not0_out          ;
    wire   and0_out_Y        ;
    wire   u_vpwr_vgnd0_out_Y;
    //                           Name          Output              Other arguments
    not                          not0         (not0_out          , A                     );
    and                          and0         (and0_out_Y        , not0_out, B_N         );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_Y, and0_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , u_vpwr_vgnd0_out_Y    );
endmodule