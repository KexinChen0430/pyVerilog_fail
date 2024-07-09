module stratix_lvds_transmitter (clk0,
                                 enable0,
                                 datain,
                                 dataout,
                                 devclrn,
                                 devpor
                                );
    parameter bypass_serializer = "false";
    parameter invert_clock = "false";
    parameter use_falling_clock_edge = "false";
    parameter lpm_type = "stratix_lvds_transmitter";
// SIMULATION_ONLY_PARAMETERS_BEGIN
    parameter channel_width = 4;
// SIMULATION_ONLY_PARAMETERS_END
    // INPUT PORTS
    input [channel_width - 1:0] datain;
    input clk0;
    input enable0;
    input devclrn;
    input devpor;
    // OUTPUT PORTS
    output dataout;
    tri1 devclrn;
    tri1 devpor;
    // INTERNAL VARIABLES
    reg shift_out;
    reg clk0_last_value;
    wire [channel_width - 1:0] input_data;
    reg [channel_width - 1:0] shift_data;
    wire txload0;
    wire txload1;
    wire txload2;
    wire bypass_mode;
    reg [channel_width - 1:0] datain_dly;
    reg [channel_width - 1:0] datain_dly2;
    reg tmp_bit;
    // INPUT BUFFERS
    wire clk0_in;
    buf (clk0_in, clk0);
    initial
    begin
        clk0_last_value = 1'b0;
        shift_out = 1'b0;
        shift_data = {channel_width{1'b0}};
    end
    stratix_dffe txload0_reg (.D(enable0),
                              .CLRN(1'b1),
                              .PRN(1'b1),
                              .ENA(1'b1),
                              .CLK(clk0_in),
                              .Q(txload0));
    stratix_dffe txload1_reg (.D(txload0),
                              .CLRN(1'b1),
                              .PRN(1'b1),
                              .ENA(1'b1),
                              .CLK(clk0_in),
                              .Q(txload1));
    stratix_dffe txload2_reg (.D(txload1),
                              .CLRN(1'b1),
                              .PRN(1'b1),
                              .ENA(1'b1),
                              .CLK(!clk0_in),
                              .Q(txload2));
    stratix_lvds_tx_out_block output_module (.clk(clk0_in),
                                             .datain(shift_out),
                                             .dataout(dataout),
                                             .devclrn(devclrn),
                                             .devpor(devpor));
    defparam output_module.bypass_serializer = bypass_serializer;
    defparam output_module.invert_clock = invert_clock;
    defparam output_module.use_falling_clock_edge = use_falling_clock_edge;
    stratix_lvds_tx_parallel_register input_reg (.clk(txload0),
                                                 .enable(1'b1),
                                                 .datain(datain_dly2),
                                                 .dataout(input_data),
                                                 .devclrn(devclrn),
                                                 .devpor(devpor));
    defparam input_reg.channel_width = channel_width;
    always @(datain)
    begin
	    datain_dly <= datain;
    end
    always @(datain_dly)
    begin
	    datain_dly2 <= datain_dly;
    end
    always @(clk0_in or devclrn or devpor)
    begin
        if ((devpor == 'b0) || (devclrn == 'b0))
        begin
            shift_out <= 1'b0;
            shift_data <= {channel_width{1'b0}};
        end
        else
        begin
            if (bypass_serializer == "false")
            begin
                if ((clk0_in === 1'b1) && (clk0_last_value !== clk0_in))
                begin
                    if (txload2 === 1'b1)
                    begin
                        shift_out <= input_data[channel_width - 1];
                        {tmp_bit, shift_data} <= {input_data, input_data[0]};
                    end
                    else
                    begin
                        shift_out <= shift_data[channel_width - 1];
                        {tmp_bit, shift_data} <= {shift_data, shift_data[0]};
                    end
                end
            end //bypass is off
        end //devpor
        clk0_last_value <= clk0_in;
    end // always
endmodule