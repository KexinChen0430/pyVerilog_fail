module sky130_fd_sc_hs__and4b (
    X   ,
    A_N ,
    B   ,
    C   ,
    D   ,
    VPWR,
    VGND
);
    // Module ports
    output X   ;
    input  A_N ;
    input  B   ;
    input  C   ;
    input  D   ;
    input  VPWR;
    input  VGND;
    // Local signals
    wire	D not0_out          ;
    wire   and0_out_X        ;
    wire   u_vpwr_vgnd0_out_X;
    //                           Name          Output              Other arguments
    not                          not0         (not0_out          , A_N                   );
    and                          and0         (and0_out_X        , not0_out, B, C, D     );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_X, and0_out_X, VPWR, VGND);
    buf                          buf0         (X                 , u_vpwr_vgnd0_out_X    );
endmodule