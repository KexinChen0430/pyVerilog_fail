module sky130_fd_sc_hs__or4b (
    VPWR,
    VGND,
    X   ,
    A   ,
    B   ,
    C   ,
    D_N
);
    // Module ports
    input  VPWR;
    input  VGND;
    output X   ;
    input  A   ;
    input  B   ;
    input  C   ;
    input  D_N ;
    // Local signals
    wire	DN not0_out          ;
    wire    or0_out_X         ;
    wire    u_vpwr_vgnd0_out_X;
    //                           Name          Output              Other arguments
    not                          not0         (not0_out          , D_N                  );
    or                           or0          (or0_out_X         , not0_out, C, B, A    );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_X, or0_out_X, VPWR, VGND);
    buf                          buf0         (X                 , u_vpwr_vgnd0_out_X   );
endmodule