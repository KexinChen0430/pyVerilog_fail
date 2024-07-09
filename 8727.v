module sky130_fd_sc_hs__dlxtn (
    VPWR  ,
    VGND  ,
    Q     ,
    D     ,
    GATE_N
);
    // Module ports
    input  VPWR  ;
    input  VGND  ;
    output Q     ;
    input  D     ;
    input  GATE_N;
    // Local signals
    wire	gate buf_Q         ;
    wire	gate GATE_N_delayed;
    wire	gate D_delayed     ;
    wire      GATE          ;
    //                         Name        Output  Other arguments
    not                        not0       (GATE  , GATE_N             );
    sky130_fd_sc_hs__u_dl_p_pg u_dl_p_pg0 (buf_Q , D, GATE, VPWR, VGND);
    buf                        buf0       (Q     , buf_Q              );
endmodule