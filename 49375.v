module sky130_fd_sc_hd__sdfrtp (
    Q      ,
    CLK    ,
    D      ,
    SCD    ,
    SCE    ,
    RESET_B
);
    // Module ports
    output Q      ;
    input  CLK    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  RESET_B;
    // Module supplies
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;
    // Local signals
    wire buf_Q          ;
    wire RESET          ;
    wire mux_out        ;
    reg  notifier       ;
    wire D_delayed      ;
    wire SCD_delayed    ;
    wire SCE_delayed    ;
    wire RESET_B_delayed;
    wire CLK_delayed    ;
    wire awake          ;
    wire cond0          ;
    wire cond1          ;
    wire cond2          ;
    wire cond3          ;
    wire cond4          ;
    //                                  Name       Output   Other arguments
    not                                 not0      (RESET  , RESET_B_delayed                                  );
    sky130_fd_sc_hd__udp_mux_2to1       mux_2to10 (mux_out, D_delayed, SCD_delayed, SCE_delayed              );
    sky130_fd_sc_hd__udp_dff$PR_pp$PG$N dff0      (buf_Q  , mux_out, CLK_delayed, RESET, notifier, VPWR, VGND);
    assign awake = ( VPWR === 1'b1 );
    assign cond0 = ( ( RESET_B_delayed === 1'b1 ) && awake );
    assign cond1 = ( ( SCE_delayed === 1'b0 ) && cond0 );
    assign cond2 = ( ( SCE_delayed === 1'b1 ) && cond0 );
    assign cond3 = ( ( D_delayed !== SCD_delayed ) && cond0 );
    assign cond4 = ( ( RESET_B === 1'b1 ) && awake );
    buf                                 buf0      (Q      , buf_Q                                            );
endmodule