module    stratixv_io_config    (
    datain,
    clk,
    ena,
    update,
    outputdelaysetting1,
    outputdelaysetting2,
    padtoinputregisterdelaysetting,
    padtoinputregisterrisefalldelaysetting,
    inputclkdelaysetting,
    inputclkndelaysetting,
    dutycycledelaymode,
    dutycycledelaysetting,
    dataout);
    parameter    lpm_type    =    "stratixv_io_config";
    input    datain;
    input    clk;
    input    ena;
    input    update;
    output    [5:0] outputdelaysetting1;
    output    [5:0] outputdelaysetting2;
    output    [5:0] padtoinputregisterdelaysetting;
    output    [5:0] padtoinputregisterrisefalldelaysetting;
    output    [1:0] inputclkdelaysetting;
    output    [1:0] inputclkndelaysetting;
    output    dutycycledelaymode;
    output    [3:0] dutycycledelaysetting;
    output    dataout;
    stratixv_io_config_encrypted inst (
        .datain(datain),
        .clk(clk),
        .ena(ena),
        .update(update),
        .outputdelaysetting1(outputdelaysetting1),
        .outputdelaysetting2(outputdelaysetting2),
        .padtoinputregisterdelaysetting(padtoinputregisterdelaysetting),
        .padtoinputregisterrisefalldelaysetting(padtoinputregisterrisefalldelaysetting),
        .inputclkdelaysetting(inputclkdelaysetting),
        .inputclkndelaysetting(inputclkndelaysetting),
        .dutycycledelaymode(dutycycledelaymode),
        .dutycycledelaysetting(dutycycledelaysetting),
        .dataout(dataout) );
    defparam inst.lpm_type = lpm_type;
endmodule