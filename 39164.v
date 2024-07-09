module sky130_fd_sc_hs__a211o (
    X   ,
    A1  ,
    A2  ,
    B1  ,
    C1  ,
    VPWR,
    VGND
);
    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  C1  ;
    input  VPWR;
    input  VGND;
    // Local signals
    wire	C1 and0_out          ;
    wire    or0_out_X         ;
    wire    u_vpwr_vgnd0_out_X;
    //                           Name          Output              Other arguments
    and                          and0         (and0_out          , A1, A2               );
    or                           or0          (or0_out_X         , and0_out, C1, B1     );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_X, or0_out_X, VPWR, VGND);
    buf                          buf0         (X                 , u_vpwr_vgnd0_out_X   );
endmodule