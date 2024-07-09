module sky130_fd_sc_hs__a2bb2o (
    X   ,
    A1_N,
    A2_N,
    B1  ,
    B2  ,
    VPWR,
    VGND
);
    // Module ports
    output X   ;
    input  A1_N;
    input  A2_N;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
    // Local signals
    wire	B2 and0_out          ;
    wire	B2 nor0_out          ;
    wire    or0_out_X         ;
    wire    u_vpwr_vgnd0_out_X;
    //                           Name          Output              Other arguments
    and                          and0         (and0_out          , B1, B2               );
    nor                          nor0         (nor0_out          , A1_N, A2_N           );
    or                           or0          (or0_out_X         , nor0_out, and0_out   );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_X, or0_out_X, VPWR, VGND);
    buf                          buf0         (X                 , u_vpwr_vgnd0_out_X   );
endmodule