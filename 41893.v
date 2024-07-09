module sky130_fd_sc_hs__o22a (
    VPWR,
    VGND,
    X   ,
    A1  ,
    A2  ,
    B1  ,
    B2
);
    // Module ports
    input  VPWR;
    input  VGND;
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  B2  ;
    // Local signals
    wire	B2 or0_out           ;
    wire	B2 or1_out           ;
    wire    and0_out_X        ;
    wire    u_vpwr_vgnd0_out_X;
    //                           Name          Output              Other arguments
    or                           or0          (or0_out           , A2, A1                );
    or                           or1          (or1_out           , B2, B1                );
    and                          and0         (and0_out_X        , or0_out, or1_out      );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_X, and0_out_X, VPWR, VGND);
    buf                          buf0         (X                 , u_vpwr_vgnd0_out_X    );
endmodule