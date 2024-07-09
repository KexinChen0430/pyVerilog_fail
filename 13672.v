module sky130_fd_sc_hs__a221o (
    VPWR,
    VGND,
    X   ,
    A1  ,
    A2  ,
    B1  ,
    B2  ,
    C1
);
    // Module ports
    input  VPWR;
    input  VGND;
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  B2  ;
    input  C1  ;
    // Local signals
    wire	B2 and0_out          ;
    wire	B2 and1_out          ;
    wire    or0_out_X         ;
    wire    u_vpwr_vgnd0_out_X;
    //                           Name          Output              Other arguments
    and                          and0         (and0_out          , B1, B2                );
    and                          and1         (and1_out          , A1, A2                );
    or                           or0          (or0_out_X         , and1_out, and0_out, C1);
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_X, or0_out_X, VPWR, VGND );
    buf                          buf0         (X                 , u_vpwr_vgnd0_out_X    );
endmodule