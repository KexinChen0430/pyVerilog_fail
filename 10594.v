module    stratixv_dll    (
    aload,
    clk,
    upndnin,
    upndninclkena,
    delayctrlout,
    dqsupdate,
    offsetdelayctrlout,
    offsetdelayctrlclkout,
    upndnout,
    dffin,
    locked);
    parameter    input_frequency    =    "0 MHz";
    parameter    delayctrlout_mode    =    "normal";
    parameter    jitter_reduction    =    "false";
    parameter    use_upndnin    =    "false";
    parameter    use_upndninclkena    =    "false";
    parameter    dual_phase_comparators    =    "true";
    parameter    sim_valid_lock    =    16;
    parameter    sim_valid_lockcount    =    0;
    parameter    sim_buffer_intrinsic_delay    =    175;
    parameter    sim_buffer_delay_increment    =    10;
    parameter    static_delay_ctrl    =    0;
    parameter    lpm_type    =    "stratixv_dll";
    parameter    delay_chain_length    =    8;
    input    aload;
    input    clk;
    input    upndnin;
    input    upndninclkena;
    output    [6:0]    delayctrlout;
    output    dqsupdate;
    output    [6:0]    offsetdelayctrlout;
    output    offsetdelayctrlclkout;
    output    upndnout;
    output    dffin;
    output    locked;
    stratixv_dll_encrypted inst (
        .aload(aload),
        .clk(clk),
        .upndnin(upndnin),
        .upndninclkena(upndninclkena),
        .delayctrlout(delayctrlout),
        .dqsupdate(dqsupdate),
        .offsetdelayctrlout(offsetdelayctrlout),
        .offsetdelayctrlclkout(offsetdelayctrlclkout),
        .upndnout(upndnout),
        .dffin(dffin),
        .locked(locked));
    defparam inst.input_frequency = input_frequency;
    defparam inst.delayctrlout_mode = delayctrlout_mode;
    defparam inst.jitter_reduction = jitter_reduction;
    defparam inst.use_upndnin = use_upndnin;
    defparam inst.use_upndninclkena = use_upndninclkena;
    defparam inst.dual_phase_comparators = dual_phase_comparators;
    defparam inst.sim_valid_lock = sim_valid_lock;
    defparam inst.sim_valid_lockcount = sim_valid_lockcount;
    defparam inst.sim_buffer_intrinsic_delay = sim_buffer_intrinsic_delay;
    defparam inst.sim_buffer_delay_increment = sim_buffer_delay_increment;
    defparam inst.static_delay_ctrl = static_delay_ctrl;
    defparam inst.lpm_type = lpm_type;
    defparam inst.delay_chain_length = delay_chain_length;
endmodule