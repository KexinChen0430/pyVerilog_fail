module    stratixv_clk_phase_select    (
    clkin,
    phasectrlin,
    phaseinvertctrl,
    powerdown,
    clkout);
    parameter    use_phasectrlin    =    "true";
    parameter    phase_setting    =    0;
    parameter    invert_phase    =    "false";
	parameter    physical_clock_source	= "auto";
    input    [3:0]    clkin;
    input    [1:0]    phasectrlin;
    input    phaseinvertctrl;
    input    powerdown;
    output    clkout;
    stratixv_clk_phase_select_encrypted inst (
        .clkin(clkin),
        .phasectrlin(phasectrlin),
        .phaseinvertctrl(phaseinvertctrl),
        .powerdown(powerdown),
        .clkout(clkout) );
    defparam inst.use_phasectrlin = use_phasectrlin;
    defparam inst.phase_setting = phase_setting;
    defparam inst.invert_phase = invert_phase;
    defparam inst.physical_clock_source = physical_clock_source;
endmodule