module    stratixv_input_phase_alignment    (
    datain,
    levelingclk,
    zerophaseclk,
    areset,
    enainputcycledelay,
    enaphasetransferreg,
    dataout,
    dffin,
    dff1t,
    dffphasetransfer);
    parameter    power_up    =    "low";
    parameter    async_mode    =    "no_reset";
    parameter    add_input_cycle_delay    =    "false";
    parameter    bypass_output_register    =    "false";
    parameter    add_phase_transfer_reg    =    "false";
    parameter    lpm_type    =    "stratixv_input_phase_alignment";
    input    datain;
    input    levelingclk;
    input    zerophaseclk;
    input    areset;
    input    enainputcycledelay;
    input    enaphasetransferreg;
    output    dataout;
    output    dffin;
    output    dff1t;
    output    dffphasetransfer;
    stratixv_input_phase_alignment_encrypted inst (
        .datain(datain),
        .levelingclk(levelingclk),
        .zerophaseclk(zerophaseclk),
        .areset(areset),
        .enainputcycledelay(enainputcycledelay),
        .enaphasetransferreg(enaphasetransferreg),
        .dataout(dataout),
        .dffin(dffin),
        .dff1t(dff1t),
        .dffphasetransfer(dffphasetransfer) );
    defparam inst.power_up = power_up;
    defparam inst.async_mode = async_mode;
    defparam inst.add_input_cycle_delay = add_input_cycle_delay;
    defparam inst.bypass_output_register = bypass_output_register;
    defparam inst.add_phase_transfer_reg = add_phase_transfer_reg;
    defparam inst.lpm_type = lpm_type;
endmodule