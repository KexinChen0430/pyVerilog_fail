module sky130_fd_sc_hs__nand2b (
    VPWR,
    VGND,
    Y   ,
    A_N ,
    B
);
    // Module ports
    input  VPWR;
    input  VGND;
    output Y   ;
    input  A_N ;
    input  B   ;
    // Local signals
    wire	Y not0_out          ;
    wire   or0_out_Y         ;
    wire   u_vpwr_vgnd0_out_Y;
    //                           Name          Output              Other arguments
    not                          not0         (not0_out          , B                    );
    or                           or0          (or0_out_Y         , not0_out, A_N        );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_Y, or0_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , u_vpwr_vgnd0_out_Y   );
endmodule