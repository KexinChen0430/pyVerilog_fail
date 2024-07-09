module    stratixv_clkena    (
    inclk,
    ena,
    enaout,
    outclk);
// leda G_521_3_B off
    parameter    clock_type    =    "auto";
    parameter    ena_register_mode    =    "always enabled";
    parameter    lpm_type    =    "stratixv_clkena";
    parameter    ena_register_power_up    =    "high";
    parameter    disable_mode    =    "low";
    parameter    test_syn    =    "high";
// leda G_521_3_B on
    input    inclk;
    input    ena;
    output    enaout;
    output    outclk;
    stratixv_clkena_encrypted inst (
        .inclk(inclk),
        .ena(ena),
        .enaout(enaout),
        .outclk(outclk) );
    defparam inst.clock_type = clock_type;
    defparam inst.ena_register_mode = ena_register_mode;
    defparam inst.lpm_type = lpm_type;
    defparam inst.ena_register_power_up = ena_register_power_up;
    defparam inst.disable_mode = disable_mode;
    defparam inst.test_syn = test_syn;
endmodule