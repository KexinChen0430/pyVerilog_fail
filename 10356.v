module sky130_fd_sc_hs__o2bb2a (
    X   ,
    A1_N,
    A2_N,
    B1  ,
    B2  ,
    VPWR,
    VGND
);
    // Module ports
    output X   ;
    input  A1_N;
    input  A2_N;
    input  B1  ;
    input  B2  ;
    input  VPWR;
    input  VGND;
    // Local signals
    wire	B2 nand0_out         ;
    wire	B2 or0_out           ;
    wire    and0_out_X        ;
    wire    u_vpwr_vgnd0_out_X;
    //                           Name          Output              Other arguments
    nand                         nand0        (nand0_out         , A2_N, A1_N            );
    or                           or0          (or0_out           , B2, B1                );
    and                          and0         (and0_out_X        , nand0_out, or0_out    );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_X, and0_out_X, VPWR, VGND);
    buf                          buf0         (X                 , u_vpwr_vgnd0_out_X    );
endmodule