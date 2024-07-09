module sky130_fd_sc_hs__a222oi (
    Y   ,
    A1  ,
    A2  ,
    B1  ,
    B2  ,
    C1  ,
    C2  ,
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
    input  C2  ;
    input  VPWR;
    input  VGND;
    // Local signals
    wire	B2 nand0_out         ;
    wire	B2 nand1_out         ;
    wire	B2 nand2_out         ;
    wire    and0_out_Y        ;
    wire    u_vpwr_vgnd0_out_Y;
    //                           Name          Output              Other arguments
    nand                         nand0        (nand0_out         , A2, A1                         );
    nand                         nand1        (nand1_out         , B2, B1                         );
    nand                         nand2        (nand2_out         , C2, C1                         );
    and                          and0         (and0_out_Y        , nand0_out, nand1_out, nand2_out);
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_Y, and0_out_Y, VPWR, VGND         );
    buf                          buf0         (Y                 , u_vpwr_vgnd0_out_Y             );
endmodule