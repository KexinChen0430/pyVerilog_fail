module sky130_fd_sc_hs__a32o (
    X   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    B2  ,
    VPWR,
    VGND
);
    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
    // Local signals
    wire	B1 and0_out          ;
    wire	B1 and1_out          ;
    wire    or0_out_X         ;
    wire    u_vpwr_vgnd0_out_X;
    //                           Name          Output              Other arguments
    and                          and0         (and0_out          , A3, A1, A2           );
    and                          and1         (and1_out          , B1, B2               );
    or                           or0          (or0_out_X         , and1_out, and0_out   );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_X, or0_out_X, VPWR, VGND);
    buf                          buf0         (X                 , u_vpwr_vgnd0_out_X   );
endmodule