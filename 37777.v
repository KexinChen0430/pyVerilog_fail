module sky130_fd_sc_hs__or2b (
    VPWR,
    VGND,
    X   ,
    A   ,
    B_N
);
    // Module ports
    input  VPWR;
    input  VGND;
    output X   ;
    input  A   ;
    input  B_N ;
    // Local signals
    wire	X not0_out          ;
    wire   or0_out_X         ;
    wire   u_vpwr_vgnd0_out_X;
    //                           Name          Output              Other arguments
    not                          not0         (not0_out          , B_N                  );
    or                           or0          (or0_out_X         , not0_out, A          );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_X, or0_out_X, VPWR, VGND);
    buf                          buf0         (X                 , u_vpwr_vgnd0_out_X   );
endmodule