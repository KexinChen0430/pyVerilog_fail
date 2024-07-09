module    stratixv_dqs_enable_ctrl    (
    dqsenablein,
    zerophaseclk,
    enaphasetransferreg,
    levelingclk,
    dffin,
    dffphasetransfer,
    dffextenddqsenable,
    dqsenableout,
    prevphasevalid,
    enatrackingreset,
    enatrackingevent,
    enatrackingupdwn,
    nextphasealign,
    prevphasealign,
    prevphasedelaysetting);
    parameter    bypass_output_register    =    "false";
    parameter    delay_dqs_enable_by_half_cycle    =    "false";
    parameter    add_phase_transfer_reg    =    "false";
    parameter    ext_delay_chain_setting = 0;
    parameter    int_delay_chain_setting = 0;
    parameter    use_enable_tracking = "false";
    parameter    use_on_die_variation_tracking = "false";
    parameter    use_pvt_compensation = "false";
    parameter    sim_dqsenablein_pre_delay = 0;
    input    dqsenablein;
    input    zerophaseclk;
    input    enaphasetransferreg;
    input    levelingclk;
    input    enatrackingreset;
    output    dffin;
    output    dffphasetransfer;
    output    dffextenddqsenable;
    output    dqsenableout;
    output   prevphasevalid;
    output   enatrackingevent;
    output   enatrackingupdwn;
    output   nextphasealign;
    output   prevphasealign;
    output   [5:0] prevphasedelaysetting;
    stratixv_dqs_enable_ctrl_encrypted inst (
        .dqsenablein(dqsenablein),
        .zerophaseclk(zerophaseclk),
        .enaphasetransferreg(enaphasetransferreg),
        .levelingclk(levelingclk),
        .dffin(dffin),
        .dffphasetransfer(dffphasetransfer),
        .dffextenddqsenable(dffextenddqsenable),
        .dqsenableout(dqsenableout),
        .prevphasevalid(prevphasevalid),
        .enatrackingreset(enatrackingreset),
        .enatrackingevent(enatrackingevent),
        .enatrackingupdwn(enatrackingupdwn),
        .nextphasealign(nextphasealign),
        .prevphasealign(prevphasealign),
        .prevphasedelaysetting(prevphasedelaysetting));
    defparam inst.bypass_output_register = bypass_output_register;
    defparam inst.delay_dqs_enable_by_half_cycle = delay_dqs_enable_by_half_cycle;
    defparam inst.add_phase_transfer_reg = add_phase_transfer_reg;
    defparam inst.sim_dqsenablein_pre_delay = sim_dqsenablein_pre_delay;
    defparam inst.ext_delay_chain_setting = ext_delay_chain_setting;
    defparam inst.int_delay_chain_setting = int_delay_chain_setting;
    defparam inst.use_enable_tracking = use_enable_tracking;
    defparam inst.use_on_die_variation_tracking = use_on_die_variation_tracking;
    defparam inst.use_pvt_compensation = use_pvt_compensation;
endmodule