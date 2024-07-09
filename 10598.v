module    stratixv_duty_cycle_adjustment    (
    clkin,
    delaymode,
    delayctrlin,
    clkout);
    parameter    duty_cycle_delay_mode    =    "none";
    parameter    lpm_type    =    "stratixv_duty_cycle_adjustment";
    input    clkin;
    input    delaymode;
    input    [3:0]    delayctrlin;
    output    clkout;
    stratixv_duty_cycle_adjustment_encrypted inst (
        .clkin(clkin),
        .delaymode(delaymode),
        .delayctrlin(delayctrlin),
        .clkout(clkout) );
    defparam inst.duty_cycle_delay_mode = duty_cycle_delay_mode;
    defparam inst.lpm_type = lpm_type;
endmodule