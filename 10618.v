module    stratixv_chipidblock    (
    clk,
    shiftnld,
    regout);
    parameter    lpm_type    =    "stratixv_chipidblock";
    input    clk;
    input    shiftnld;
    output    regout;
    stratixv_chipidblock_encrypted inst (
        .clk(clk),
        .shiftnld(shiftnld),
        .regout(regout) );
    defparam inst.lpm_type = lpm_type;
endmodule