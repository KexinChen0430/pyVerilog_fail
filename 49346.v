module sky130_fd_sc_ls__nand2b_4 (
    Y  ,
    A_N,
    B
);
    output Y  ;
    input  A_N;
    input  B  ;
    // Voltage supply signals
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;
    sky130_fd_sc_ls__nand2b base (
        .Y(Y),
        .A_N(A_N),
        .B(B)
    );
endmodule