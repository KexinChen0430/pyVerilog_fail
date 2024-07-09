module sky130_fd_sc_lp__invlp (
    Y,
    A
);
    // Module ports
    output Y;
    input  A;
    // Local signals
    wire not0_out_Y;
    //  Name  Output      Other arguments
    not not0 (not0_out_Y, A              );
    buf buf0 (Y         , not0_out_Y     );
endmodule