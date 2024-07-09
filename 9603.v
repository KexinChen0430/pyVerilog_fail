module sky130_fd_sc_hs__and2b (
    VPWR,
    VGND,
    X   ,
    A_N ,
    B
);
    // Module ports
    input  VPWR;
    input  VGND;
    output X   ;
    input  A_N ;
    input  B   ;
    // Local signals
    wire	X not0_out          ;
    wire   and0_out_X        ;
    wire   u_vpwr_vgnd0_out_X;
    //                           Name          Output              Other arguments
    not                          not0         (not0_out          , A_N                   );
    and                          and0         (and0_out_X        , not0_out, B           );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_X, and0_out_X, VPWR, VGND);
    buf                          buf0         (X                 , u_vpwr_vgnd0_out_X    );
endmodule