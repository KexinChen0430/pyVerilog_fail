module sky130_fd_sc_hs__nand4bb (
    VPWR,
    VGND,
    Y   ,
    A_N ,
    B_N ,
    C   ,
    D
);
    // Module ports
    input  VPWR;
    input  VGND;
    output Y   ;
    input  A_N ;
    input  B_N ;
    input  C   ;
    input  D   ;
    // Local signals
    wire	D nand0_out         ;
    wire   or0_out_Y         ;
    wire   u_vpwr_vgnd0_out_Y;
    //                           Name          Output              Other arguments
    nand                         nand0        (nand0_out         , D, C                 );
    or                           or0          (or0_out_Y         , B_N, A_N, nand0_out  );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_Y, or0_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , u_vpwr_vgnd0_out_Y   );
endmodule