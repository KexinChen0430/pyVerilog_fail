module sky130_fd_sc_hs__o41ai (
    VPWR,
    VGND,
    Y   ,
    A1  ,
    A2  ,
    A3  ,
    A4  ,
    B1
);
    // Module ports
    input  VPWR;
    input  VGND;
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  A4  ;
    input  B1  ;
    // Local signals
    wire	A4 or0_out           ;
    wire    nand0_out_Y       ;
    wire    u_vpwr_vgnd0_out_Y;
    //                           Name          Output              Other arguments
    or                           or0          (or0_out           , A4, A3, A2, A1         );
    nand                         nand0        (nand0_out_Y       , B1, or0_out            );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , u_vpwr_vgnd0_out_Y     );
endmodule