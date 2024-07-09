module sky130_fd_sc_hs__and4bb (
    VPWR,
    VGND,
    X   ,
    A_N ,
    B_N ,
    C   ,
    D
);
    // Module ports
    input  VPWR;
    input  VGND;
    output X   ;
    input  A_N ;
    input  B_N ;
    input  C   ;
    input  D   ;
    // Local signals
    wire	D nor0_out          ;
    wire   and0_out_X        ;
    wire   u_vpwr_vgnd0_out_X;
    //                           Name          Output              Other arguments
    nor                          nor0         (nor0_out          , A_N, B_N              );
    and                          and0         (and0_out_X        , nor0_out, C, D        );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_X, and0_out_X, VPWR, VGND);
    buf                          buf0         (X                 , u_vpwr_vgnd0_out_X    );
endmodule