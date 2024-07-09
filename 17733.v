module sky130_fd_sc_hs__dlxtn (
    Q     ,
    D     ,
    GATE_N,
    VPWR  ,
    VGND
);
    // Module ports
    output Q     ;
    input  D     ;
    input  GATE_N;
    input  VPWR  ;
    input  VGND  ;
    // Local signals
    wire	gate buf_Q         ;
    wire	gate GATE_N_delayed;
    wire	gate D_delayed     ;
    reg       notifier      ;
    wire      GATE          ;
    wire      awake         ;
    //                            Name           Output  Other arguments
    not                           not0          (GATE  , GATE_N_delayed                       );
    sky130_fd_sc_hs__u_dl_p_no_pg u_dl_p_no_pg0 (buf_Q , D_delayed, GATE, notifier, VPWR, VGND);
    buf                           buf0          (Q     , buf_Q                                );
    assign awake = ( VPWR === 1'b1 );
endmodule