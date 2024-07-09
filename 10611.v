module    stratixv_leveling_delay_chain    (
    clkin,
    delayctrlin,
    clkout);
    parameter    physical_clock_source    =    "dqs";
    parameter    sim_buffer_intrinsic_delay    =    175;
    parameter    sim_buffer_delay_increment    =    10;
    parameter    use_duty_cycle_correction = "false";
    parameter    test_mode = "false";
    input    clkin;
    input    [6:0]    delayctrlin;
    output    [3:0]    clkout;
    stratixv_leveling_delay_chain_encrypted inst (
        .clkin(clkin),
        .delayctrlin(delayctrlin),
        .clkout(clkout) );
    //defparam inst.use_duty_cycle_correction = use_duty_cycle_correction;
    defparam inst.physical_clock_source = physical_clock_source;
    defparam inst.sim_buffer_intrinsic_delay = sim_buffer_intrinsic_delay;
    defparam inst.sim_buffer_delay_increment = sim_buffer_delay_increment;
endmodule