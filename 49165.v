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
    reg        notifier    ;
    wire       buf_Q       ;
    wire       awake       ;
    //                            Name           Output  Other arguments
    sky130_fd_sc_hs__u_dl_p_no_pg u_dl_p_no_pg0 (buf_Q , D_delayed, GATE_delayed, notifier, VPWR, VGND);
    buf                           buf0          (Q     , buf_Q                                        );
    assign awake = ( VPWR === 1'b1 );
endmodule