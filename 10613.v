module    stratixv_lvds_tx    (
    datain,
    clock0,
    enable0,
    serialdatain,
    postdpaserialdatain,
    devclrn,
    devpor,
    dpaclkin,
    dataout,
    serialfdbkout,
    observableout);
    parameter    bypass_serializer    =    "false";
    parameter    invert_clock    =    "false";
    parameter    use_falling_clock_edge    =    "false";
    parameter    use_serial_data_input    =    "false";
    parameter    use_post_dpa_serial_data_input    =    "false";
    parameter    is_used_as_outclk    =    "false";
    parameter    tx_output_path_delay_engineering_bits    =    -1;
    parameter    enable_dpaclk_to_lvdsout    =    "false";
    parameter    lpm_type    =    "stratixv_lvds_tx";
    parameter    data_width    =    10;
    input    [data_width-1:0]    datain;
    input    clock0;
    input    enable0;
    input    serialdatain;
    input    postdpaserialdatain;
    input    devclrn;
    input    devpor;
    input    dpaclkin;
    output    dataout;
    output    serialfdbkout;
    output    [2:0]    observableout;
    stratixv_lvds_tx_encrypted inst (
        .datain(datain),
        .clock0(clock0),
        .enable0(enable0),
        .serialdatain(serialdatain),
        .postdpaserialdatain(postdpaserialdatain),
        .devclrn(devclrn),
        .devpor(devpor),
        .dpaclkin(dpaclkin),
        .dataout(dataout),
        .serialfdbkout(serialfdbkout),
        .observableout(observableout) );
    defparam inst.bypass_serializer = bypass_serializer;
    defparam inst.invert_clock = invert_clock;
    defparam inst.use_falling_clock_edge = use_falling_clock_edge;
    defparam inst.use_serial_data_input = use_serial_data_input;
    defparam inst.use_post_dpa_serial_data_input = use_post_dpa_serial_data_input;
    defparam inst.is_used_as_outclk = is_used_as_outclk;
    defparam inst.tx_output_path_delay_engineering_bits = tx_output_path_delay_engineering_bits;
    defparam inst.enable_dpaclk_to_lvdsout = enable_dpaclk_to_lvdsout;
    defparam inst.lpm_type = lpm_type;
    defparam inst.data_width = data_width;
endmodule