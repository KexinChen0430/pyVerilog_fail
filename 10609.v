module    stratixv_io_clock_divider    (
    clk,
    phaseinvertctrl,
    masterin,
    clkout,
    slaveout);
    parameter    power_up    =    "low";
    parameter    invert_phase    =    "false";
    parameter    use_masterin    =    "false";
    parameter    lpm_type    =    "stratixv_io_clock_divider";
    input    clk;
    input    phaseinvertctrl;
    input    masterin;
    output    clkout;
    output    slaveout;
    stratixv_io_clock_divider_encrypted inst (
        .clk(clk),
        .phaseinvertctrl(phaseinvertctrl),
        .masterin(masterin),
        .clkout(clkout),
        .slaveout(slaveout) );
    defparam inst.power_up = power_up;
    defparam inst.invert_phase = invert_phase;
    defparam inst.use_masterin = use_masterin;
    defparam inst.lpm_type = lpm_type;
endmodule