module    stratixv_dqs_delay_chain    (
    dqsin,
    dqsenable,
    dqsdisablen,
    delayctrlin,
    offsetctrlin,
    dqsupdateen,
    phasectrlin,
    testin,
    dffin,
    dqsbusout);
    parameter    dqs_input_frequency    =    "unused";
    parameter    dqs_phase_shift    =    0;
    parameter    use_phasectrlin    =    "false";
    parameter    phase_setting    =    0;
    parameter    dqs_offsetctrl_enable    =    "false";
    parameter    dqs_ctrl_latches_enable    =    "false";
    parameter    use_alternate_input_for_first_stage_delayctrl    =    "false";
    parameter    sim_buffer_intrinsic_delay    =    175;
    parameter    sim_buffer_delay_increment    =    10;
    parameter    test_enable    =    "false";
    input    dqsin;
    input    dqsenable;
    input    [6:0]    delayctrlin;
    input    [6:0]    offsetctrlin;
    input    dqsupdateen;
    input    [1:0]    phasectrlin;
    input    testin;
    input    dqsdisablen;
    output    dffin;
    output    dqsbusout;
    stratixv_dqs_delay_chain_encrypted inst (
        .dqsin(dqsin),
        .dqsenable(dqsenable),
        .delayctrlin(delayctrlin),
        .offsetctrlin(offsetctrlin),
        .dqsupdateen(dqsupdateen),
        .phasectrlin(phasectrlin),
        .testin(testin),
        .dqsdisablen(dqsdisablen),
        .dffin(dffin),
        .dqsbusout(dqsbusout) );
    defparam inst.dqs_input_frequency = dqs_input_frequency;
    defparam inst.dqs_phase_shift = dqs_phase_shift;
    defparam inst.use_phasectrlin = use_phasectrlin;
    defparam inst.phase_setting = phase_setting;
    defparam inst.dqs_offsetctrl_enable = dqs_offsetctrl_enable;
    defparam inst.dqs_ctrl_latches_enable = dqs_ctrl_latches_enable;
    defparam inst.use_alternate_input_for_first_stage_delayctrl = use_alternate_input_for_first_stage_delayctrl;
    defparam inst.sim_buffer_intrinsic_delay = sim_buffer_intrinsic_delay;
    defparam inst.sim_buffer_delay_increment = sim_buffer_delay_increment;
    defparam inst.test_enable = test_enable;
endmodule