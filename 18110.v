module sky130_fd_sc_hs__a32oi (
    VPWR,
    VGND,
    Y   ,
    A1  ,
    A2  ,
    A3  ,
    B1  ,
    B2
);
    // Module ports
    input  VPWR;
    input  VGND;
    output Y   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  B2  ;
    // Local signals
    wire	B1 nand0_out         ;
    wire	B1 nand1_out         ;
    wire    and0_out_Y        ;
    wire    u_vpwr_vgnd0_out_Y;
    //                           Name          Output              Other arguments
    nand                         nand0        (nand0_out         , A2, A1, A3            );
    nand                         nand1        (nand1_out         , B2, B1                );
    and                          and0         (and0_out_Y        , nand0_out, nand1_out  );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_Y, and0_out_Y, VPWR, VGND);
    buf                          buf0         (Y                 , u_vpwr_vgnd0_out_Y    );
endmodule