module sky130_fd_sc_hs__a2111o (
    VPWR,
    VGND,
    X   ,
    A1  ,
    A2  ,
    B1  ,
    C1  ,
    D1
);
    // Module ports
    input  VPWR;
    input  VGND;
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  C1  ;
    input  D1  ;
    // Local signals
    wire	C1 and0_out          ;
    wire    or0_out_X         ;
    wire    u_vpwr_vgnd0_out_X;
    //                           Name          Output              Other arguments
    and                          and0         (and0_out          , A1, A2               );
    or                           or0          (or0_out_X         , C1, B1, and0_out, D1 );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_X, or0_out_X, VPWR, VGND);
    buf                          buf0         (X                 , u_vpwr_vgnd0_out_X   );
endmodule