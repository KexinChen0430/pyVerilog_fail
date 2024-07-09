module    stratixv_clkselect    (
    inclk,
    clkselect,
    outclk);
// leda G_521_3_B off
    parameter    lpm_type    =    "stratixv_clkselect";
    parameter    test_cff    =    "low";
// leda G_521_3_B on
    input    [3:0]    inclk;
    input    [1:0]    clkselect;
    output   outclk;
    stratixv_clkselect_encrypted inst (
        .inclk(inclk),
        .clkselect(clkselect),
        .outclk(outclk) );
    defparam inst.lpm_type = lpm_type;
    defparam inst.test_cff = test_cff;
endmodule