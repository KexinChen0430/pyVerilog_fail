module    stratixv_half_rate_input    (
    datain,
    directin,
    clk,
    areset,
    dataoutbypass,
    dataout,
    dffin);
    parameter    power_up    =    "low";
    parameter    async_mode    =    "no_reset";
    parameter    use_dataoutbypass    =    "false";
    input    [1:0]    datain;
    input    directin;
    input    clk;
    input    areset;
    input    dataoutbypass;
    output    [3:0]    dataout;
    output    [1:0]    dffin;
    stratixv_half_rate_input_encrypted inst (
        .datain(datain),
        .directin(directin),
        .clk(clk),
        .areset(areset),
        .dataoutbypass(dataoutbypass),
        .dataout(dataout),
        .dffin(dffin) );
    defparam inst.power_up = power_up;
    defparam inst.async_mode = async_mode;
    defparam inst.use_dataoutbypass = use_dataoutbypass;
endmodule