module    stratixv_output_alignment    (
    datain,
    clk,
    areset,
    sreset,
    enaoutputcycledelay,
    enaphasetransferreg,
    dataout,
    dffin,
    dff1t,
    dff2t,
    dffphasetransfer);
    parameter    power_up    =    "low";
    parameter    async_mode    =    "none";
    parameter    sync_mode    =    "none";
    parameter    add_output_cycle_delay    =    "false";
    parameter    add_phase_transfer_reg    =    "false";
    input    datain;
    input    clk;
    input    areset;
    input    sreset;
    input [2:0] enaoutputcycledelay;
    input    enaphasetransferreg;
    output    dataout;
    output    dffin;
    output    dff1t;
    output    dff2t;
    output    dffphasetransfer;
    stratixv_output_alignment_encrypted inst (
        .datain(datain),
        .clk(clk),
        .areset(areset),
        .sreset(sreset),
        .enaoutputcycledelay(enaoutputcycledelay),
        .enaphasetransferreg(enaphasetransferreg),
        .dataout(dataout),
        .dffin(dffin),
        .dff1t(dff1t),
        .dff2t(dff2t),
        .dffphasetransfer(dffphasetransfer) );
    defparam inst.power_up = power_up;
    defparam inst.async_mode = async_mode;
    defparam inst.sync_mode = sync_mode;
    defparam inst.add_output_cycle_delay = add_output_cycle_delay;
    defparam inst.add_phase_transfer_reg = add_phase_transfer_reg;
endmodule