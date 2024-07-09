module    stratixv_delay_chain    (
    datain,
    delayctrlin,
    dataout);
    parameter    sim_intrinsic_rising_delay    =    200;
    parameter    sim_intrinsic_falling_delay    =    200;
    parameter    sim_rising_delay_increment    =    10;
    parameter    sim_falling_delay_increment    =    10;
    parameter    lpm_type    =    "stratixv_delay_chain";
    input    datain;
    input    [7:0]    delayctrlin;
    output    dataout;
    stratixv_delay_chain_encrypted inst (
        .datain(datain),
        .delayctrlin(delayctrlin),
        .dataout(dataout) );
    defparam inst.sim_intrinsic_rising_delay = sim_intrinsic_rising_delay;
    defparam inst.sim_intrinsic_falling_delay = sim_intrinsic_falling_delay;
    defparam inst.sim_rising_delay_increment = sim_rising_delay_increment;
    defparam inst.sim_falling_delay_increment = sim_falling_delay_increment;
    defparam inst.lpm_type = lpm_type;
endmodule