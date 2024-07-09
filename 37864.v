module sky130_fd_sc_hs__o221ai (
    Y   ,
    A1  ,
    A2  ,
    B1  ,
    B2  ,
    C1  ,
    VPWR,
    VGND
);
    // Module ports
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  B2  ;
    input  C1  ;
    input  VPWR;
    input  VGND;
    // Local signals
    wire	B2 or0_out           ;
    wire	B2 or1_out           ;
    wire    nand0_out_Y       ;
    wire    u_vpwr_vgnd0_out_Y;
    //                           Name          Output              Other arguments
    or                           or0          (or0_out           , B2, B1                 );
    or                           or1          (or1_out           , A2, A1                 );
    nand                         nand0        (nand0_out_Y       , or1_out, or0_out, C1   );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_Y, nand0_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , u_vpwr_vgnd0_out_Y     );
endmodule