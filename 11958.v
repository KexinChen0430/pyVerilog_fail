module sky130_fd_sc_hs__o22a (
    X   ,
    A1  ,
    A2  ,
    B1  ,
    B2  ,
    VPWR,
    VGND
);
    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
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