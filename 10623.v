module    stratixv_rublock    (
    clk,
    shiftnld,
    captnupdt,
    regin,
    rsttimer,
    rconfig,
    regout);
    parameter    sim_init_watchdog_value    =    0;
    parameter    sim_init_status    =    0;
    parameter    sim_init_config_is_application    =    "false";
    parameter    sim_init_watchdog_enabled    =    "false";
    parameter    lpm_type    =    "stratixv_rublock";
    input    clk;
    input    shiftnld;
    input    captnupdt;
    input    regin;
    input    rsttimer;
    input    rconfig;
    output    regout;
    stratixv_rublock_encrypted inst (
        .clk(clk),
        .shiftnld(shiftnld),
        .captnupdt(captnupdt),
        .regin(regin),
        .rsttimer(rsttimer),
        .rconfig(rconfig),
        .regout(regout) );
    defparam inst.sim_init_watchdog_value = sim_init_watchdog_value;
    defparam inst.sim_init_status = sim_init_status;
    defparam inst.sim_init_config_is_application = sim_init_config_is_application;
    defparam inst.sim_init_watchdog_enabled = sim_init_watchdog_enabled;
    defparam inst.lpm_type = lpm_type;
endmodule