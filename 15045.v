module sky130_fd_sc_hs__dlxbp (
    VPWR,
    VGND,
    Q   ,
    Q_N ,
    D   ,
    GATE
);
    // Module ports
    input  VPWR;
    input  VGND;
    output Q   ;
    output Q_N ;
    input  D   ;
    input  GATE;
    // Local signals
    wire	buf_Q GATE_delayed;
    wire	buf_Q D_delayed   ;
    wire       buf_Q       ;
    //                         Delay       Name        Output  Other arguments
    sky130_fd_sc_hs__u_dl_p_pg `UNIT_DELAY u_dl_p_pg0 (buf_Q , D, GATE, VPWR, VGND);
    buf                                    buf0       (Q     , buf_Q              );
    not                                    not0       (Q_N   , buf_Q              );
endmodule