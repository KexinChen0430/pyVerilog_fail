module    stratixv_lvds_rx    (
    clock0,
    datain,
    enable0,
    dpareset,
    dpahold,
    dpaswitch,
    fiforeset,
    bitslip,
    bitslipreset,
    serialfbk,
    devclrn,
    devpor,
    dpaclkin,
    dataout,
    dpalock,
    bitslipmax,
    serialdataout,
    postdpaserialdataout,
    divfwdclk,
    dpaclkout,
    observableout);
    parameter    data_align_rollover    =    2;
    parameter    enable_dpa    =    "false";
    parameter    lose_lock_on_one_change    =    "false";
    parameter    reset_fifo_at_first_lock    =    "true";
    parameter    align_to_rising_edge_only    =    "true";
    parameter    use_serial_feedback_input    =    "off";
    parameter    dpa_debug    =    "false";
    parameter    x_on_bitslip    =    "true";
    parameter    enable_soft_cdr    =    "false";
    parameter    dpa_clock_output_phase_shift    =    0;
    parameter    enable_dpa_initial_phase_selection    =    "false";
    parameter    dpa_initial_phase_value    =    0;
    parameter    enable_dpa_align_to_rising_edge_only    =    "false";
    parameter    net_ppm_variation    =    0;
    parameter    is_negative_ppm_drift    =    "false";
    parameter    rx_input_path_delay_engineering_bits    =    2;
    parameter    lpm_type    =    "stratixv_lvds_rx";
    parameter    data_width    =    10;
    input    clock0;
    input    datain;
    input    enable0;
    input    dpareset;
    input    dpahold;
    input    dpaswitch;
    input    fiforeset;
    input    bitslip;
    input    bitslipreset;
    input    serialfbk;
    input    devclrn;
    input    devpor;
    input    [7:0]    dpaclkin;
    output    [data_width-1:0]    dataout;
    output    dpalock;
    output    bitslipmax;
    output    serialdataout;
    output    postdpaserialdataout;
    output    divfwdclk;
    output    dpaclkout;
    output    [3:0]    observableout;
    stratixv_lvds_rx_encrypted inst (
        .clock0(clock0),
        .datain(datain),
        .enable0(enable0),
        .dpareset(dpareset),
        .dpahold(dpahold),
        .dpaswitch(dpaswitch),
        .fiforeset(fiforeset),
        .bitslip(bitslip),
        .bitslipreset(bitslipreset),
        .serialfbk(serialfbk),
        .devclrn(devclrn),
        .devpor(devpor),
        .dpaclkin(dpaclkin),
        .dataout(dataout),
        .dpalock(dpalock),
        .bitslipmax(bitslipmax),
        .serialdataout(serialdataout),
        .postdpaserialdataout(postdpaserialdataout),
        .divfwdclk(divfwdclk),
        .dpaclkout(dpaclkout),
        .observableout(observableout) );
    defparam inst.data_align_rollover = data_align_rollover;
    defparam inst.enable_dpa = enable_dpa;
    defparam inst.lose_lock_on_one_change = lose_lock_on_one_change;
    defparam inst.reset_fifo_at_first_lock = reset_fifo_at_first_lock;
    defparam inst.align_to_rising_edge_only = align_to_rising_edge_only;
    defparam inst.use_serial_feedback_input = use_serial_feedback_input;
    defparam inst.dpa_debug = dpa_debug;
    defparam inst.x_on_bitslip = x_on_bitslip;
    defparam inst.enable_soft_cdr = enable_soft_cdr;
    defparam inst.dpa_clock_output_phase_shift = dpa_clock_output_phase_shift;
    defparam inst.enable_dpa_initial_phase_selection = enable_dpa_initial_phase_selection;
    defparam inst.dpa_initial_phase_value = dpa_initial_phase_value;
    defparam inst.enable_dpa_align_to_rising_edge_only = enable_dpa_align_to_rising_edge_only;
    defparam inst.net_ppm_variation = net_ppm_variation;
    defparam inst.is_negative_ppm_drift = is_negative_ppm_drift;
    defparam inst.rx_input_path_delay_engineering_bits = rx_input_path_delay_engineering_bits;
    defparam inst.lpm_type = lpm_type;
    defparam inst.data_width = data_width;
endmodule