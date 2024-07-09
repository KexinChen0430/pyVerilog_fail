module PULLUP (O);
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED";
`endif
    output O;
    wire A;
    pullup (A);
    buf (weak0,weak1) #(100,100) (O,A);
endmodule