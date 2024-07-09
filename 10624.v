module    stratixv_tsdblock    (
    clk,
    ce,
    clr,
    tsdcalo,
    tsdcaldone);
    parameter    clock_divider_enable    =    "on";
    parameter    clock_divider_value    =    40;
    parameter    sim_tsdcalo    =    0;
    parameter    lpm_type    =    "stratixv_tsdblock";
    input    clk;
    input    ce;
    input    clr;
    output    [7:0]    tsdcalo;
    output    tsdcaldone;
    stratixv_tsdblock_encrypted inst (
        .clk(clk),
        .ce(ce),
        .clr(clr),
        .tsdcalo(tsdcalo),
        .tsdcaldone(tsdcaldone) );
    defparam inst.clock_divider_enable = clock_divider_enable;
    defparam inst.clock_divider_value = clock_divider_value;
    defparam inst.sim_tsdcalo = sim_tsdcalo;
    defparam inst.lpm_type = lpm_type;
endmodule