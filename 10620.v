module    stratixv_crcblock    (
    clk,
    shiftnld,
    crcerror,
    regout);
    parameter    oscillator_divider    =    256;
    parameter    lpm_type    =    "stratixv_crcblock";
    input    clk;
    input    shiftnld;
    output    crcerror;
    output    regout;
    stratixv_crcblock_encrypted inst (
        .clk(clk),
        .shiftnld(shiftnld),
        .crcerror(crcerror),
        .regout(regout) );
    defparam inst.oscillator_divider = oscillator_divider;
    defparam inst.lpm_type = lpm_type;
endmodule