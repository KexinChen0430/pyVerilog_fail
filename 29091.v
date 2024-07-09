module sky130_fd_sc_hs__nand4b (
    Y   ,
    A_N ,
    B   ,
    C   ,
    D   ,
    VPWR,
    VGND
);
    // Module ports
    output Y   ;
    input  A_N ;
    input  B   ;
    input  C   ;
    input  D   ;
    input  VPWR;
    input  VGND;
    // Local signals
    wire	D not0_out          ;
    wire   nand0_out_Y       ;
    wire   u_vpwr_vgnd0_out_Y;
    //                           Name          Output              Other arguments
    not                          not0         (not0_out          , A_N                    );
    nand                         nand0        (nand0_out_Y       , D, C, B, not0_out      );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , u_vpwr_vgnd0_out_Y     );
endmodule