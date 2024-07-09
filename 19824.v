module sky130_fd_sc_hs__or4bb (
    X   ,
    A   ,
    B   ,
    C_N ,
    D_N ,
    VPWR,
    VGND
);
    // Module ports
    output X   ;
    input  A   ;
    input  B   ;
    input  C_N ;
    input  D_N ;
    input  VPWR;
    input  VGND;
    // Local signals
    wire	DN nand0_out         ;
    wire    or0_out_X         ;
    wire    u_vpwr_vgnd0_out_X;
    //                           Name          Output              Other arguments
    nand                         nand0        (nand0_out         , D_N, C_N             );
    or                           or0          (or0_out_X         , B, A, nand0_out      );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_X, or0_out_X, VPWR, VGND);
    buf                          buf0         (X                 , u_vpwr_vgnd0_out_X   );
endmodule