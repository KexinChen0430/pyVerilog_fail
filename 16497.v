module sky130_fd_sc_hs__o41a (
    X   ,
    A1  ,
    A2  ,
    A3  ,
    A4  ,
    B1  ,
    VPWR,
    VGND
);
    // Module ports
    output X   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  A4  ;
    input  B1  ;
    input  VPWR;
    input  VGND;
    // Local signals
    wire	A4 or0_out           ;
    wire    and0_out_X        ;
    wire    u_vpwr_vgnd0_out_X;
    //                           Name          Output              Other arguments
    or                           or0          (or0_out           , A4, A3, A2, A1        );
    and                          and0         (and0_out_X        , or0_out, B1           );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_X, and0_out_X, VPWR, VGND);
    buf                          buf0         (X                 , u_vpwr_vgnd0_out_X    );
endmodule