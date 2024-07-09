module stratixiigx_lvds_transmitter (clk0,
                                   enable0,
                                   datain,
                                   serialdatain,
                                   postdpaserialdatain,
                                   dataout,
                                   serialfdbkout,
                                   devclrn,
                                   devpor
                                  );
    parameter bypass_serializer              = "false";
    parameter invert_clock                   = "false";
    parameter use_falling_clock_edge         = "false";
    parameter use_serial_data_input          = "false";
    parameter use_post_dpa_serial_data_input = "false";
    parameter preemphasis_setting            = 0;
    parameter vod_setting                    = 0;
    parameter differential_drive             = 0;
    parameter lpm_type                       = "stratixiigx_lvds_transmitter";
// SIMULATION_ONLY_PARAMETERS_BEGIN
    parameter channel_width                  = 10;
// SIMULATION_ONLY_PARAMETERS_END
    // INPUT PORTS
    input [channel_width - 1:0] datain;
    input clk0;
    input enable0;
    input serialdatain;
    input postdpaserialdatain;
    input devclrn;
    input devpor;
    // OUTPUT PORTS
    output dataout;
    output serialfdbkout;
    tri1 devclrn;
    tri1 devpor;
    // INTERNAL VARIABLES AND NETS
    integer i;
    wire dataout_tmp;
    wire dataout_wire;
    wire shift_out;
    reg clk0_last_value;
    wire [channel_width - 1:0] input_data;
    reg [channel_width - 1:0] shift_data;
    wire txload0;
    reg [channel_width - 1:0] datain_dly;
    wire bypass_mode;
    wire [channel_width - 1:0] datain_in;
    wire serial_din_mode;
    wire postdpa_serial_din_mode;
    wire clk0_in;
    wire serialdatain_in;
    wire postdpaserialdatain_in;
    buf (clk0_in, clk0);
    buf datain_buf [channel_width - 1:0] (datain_in, datain);
    buf (serialdatain_in, serialdatain);
    buf (postdpaserialdatain_in, postdpaserialdatain);
    // TEST PARAMETER VALUES
    assign serial_din_mode = (use_serial_data_input == "true") ? 1'b1 : 1'b0;
    assign postdpa_serial_din_mode = (use_post_dpa_serial_data_input == "true") ? 1'b1 : 1'b0;
    // TIMING PATHS
    specify
        if (serial_din_mode == 1'b1)
            (serialdatain => dataout) = (0, 0);
        if (postdpa_serial_din_mode == 1'b1)
            (postdpaserialdatain => dataout) = (0, 0);
    endspecify
    initial
    begin
        i = 0;
        clk0_last_value = 0;
        shift_data = 'b0;
    end
    stratixiigx_lvds_tx_reg txload0_reg (.d(enable0),
                             .clrn(1'b1),
                             .prn(1'b1),
                             .ena(1'b1),
                             .clk(clk0_in),
                             .q(txload0)
                            );
    stratixiigx_lvds_tx_out_block output_module (.clk(clk0_in),
                                               .datain(shift_out),
                                               .dataout(dataout_tmp),
                                               .devclrn(devclrn),
                                               .devpor(devpor)
                                              );
    defparam output_module.bypass_serializer      = bypass_serializer;
    defparam output_module.invert_clock           = invert_clock;
    defparam output_module.use_falling_clock_edge = use_falling_clock_edge;
    stratixiigx_lvds_tx_parallel_register input_reg (.clk(txload0),
                                                   .enable(1'b1),
                                                   .datain(datain_dly),
                                                   .dataout(input_data),
                                                   .devclrn(devclrn),
                                                   .devpor(devpor)
                                                  );
    defparam input_reg.channel_width = channel_width;
    always @(datain_in)
    begin
        datain_dly <= #1 datain_in;
    end
    assign shift_out = shift_data[channel_width - 1];
    always @(clk0_in or devclrn or devpor)
    begin
        if ((devpor === 1'b0) || (devclrn === 1'b0))
        begin
            shift_data <= 'b0;
        end
        else begin
            if (bypass_serializer == "false")
            begin
                if ((clk0_in === 1'b1) && (clk0_last_value !== clk0_in))
                begin
                    if (txload0 === 1'b1)
                    begin
                        for (i = 0; i < channel_width; i = i + 1)
                            shift_data[i] <= input_data[i];
                    end
                    else begin
                        for (i = (channel_width - 1); i > 0; i = i - 1 )
                             shift_data[i] <= shift_data[i-1];
                    end
                end
            end // bypass is off
        end // devpor
        clk0_last_value <= clk0_in;
    end // always
    assign dataout_wire = (use_serial_data_input == "true") ? serialdatain_in :
                          (use_post_dpa_serial_data_input == "true") ? postdpaserialdatain_in :
                           dataout_tmp;
    and (dataout, dataout_wire, 1'b1);
    and (serialfdbkout, dataout_wire, 1'b1);
endmodule