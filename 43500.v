module sky130_fd_sc_hs__o2111a (
    X   ,
    A1  ,
    A2  ,
    B1  ,
    C1  ,
    D1  ,
    VPWR,
    VGND
);
    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  C1  ;
    input  D1  ;
    input  VPWR;
    input  VGND;
    // Local signals
    wire	C1 or0_out           ;
    wire    and0_out_X        ;
    wire    u_vpwr_vgnd0_out_X;
    //                           Name          Output              Other arguments
    or                           or0          (or0_out           , A2, A1                );
    and                          and0         (and0_out_X        , B1, C1, or0_out, D1   );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_X, and0_out_X, VPWR, VGND);
    buf                          buf0         (X                 , u_vpwr_vgnd0_out_X    );
endmodule