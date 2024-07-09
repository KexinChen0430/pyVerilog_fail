module sky130_fd_sc_hs__dlxtp (
    VPWR,
    VGND,
    Q   ,
    D   ,
    GATE
);
    // Module ports
    input  VPWR;
    input  VGND;
    output Q   ;
    input  D   ;
    input  GATE;
    // Local signals
    wire	buf_Q GATE_delayed;
    wire	buf_Q D_delayed   ;
    wire       buf_Q       ;
    //                         Name        Output  Other arguments
    sky130_fd_sc_hs__u_dl_p_pg u_dl_p_pg0 (buf_Q , D, GATE, VPWR, VGND);
    buf                        buf0       (Q     , buf_Q              );
endmodule