module stratix_lvds_receiver (clk0,
                              enable0,
                              enable1,
                              datain,
                              dataout,
                              devclrn,
                              devpor
                             );
    parameter channel_width = 4;
    parameter use_enable1 = "false";
    parameter lpm_type = "stratix_lvds_receiver";
    // INPUT PORTS
    input datain;
    input clk0;
    input enable0;
    input enable1;
    input devclrn;
    input devpor;
    // OUTPUT PORTS
    output [channel_width - 1:0] dataout;
    tri1 devclrn;
    tri1 devpor;
    // INTERNAL VARIABLES
    reg clk0_last_value;
    reg [channel_width - 1:0] shift_data;
    wire [channel_width - 1:0] load_data;
    wire rxload0;
    wire rxload1;
    wire rxload2;
    wire txload_in;
    wire txload_out;
    wire clk0_in;
    wire datain_in;
    reg rxload2_dly;
    reg tmp_bit;
    initial
    begin
        clk0_last_value = 0;
        shift_data = {channel_width{1'b0}};
    end
    stratix_and1 clkdelaybuffer (.Y(clk0_in),
                         .IN1(clk0));
    stratix_and1 dataindelaybuffer (.Y(datain_in),
                            .IN1(datain));
    stratix_dffe rxload0_reg (.D(enable0),
    						.CLRN(1'b1),
    						.PRN(1'b1),
    						.ENA(1'b1),
    						.CLK(clk0_in),
    						.Q(rxload0));
    stratix_dffe rxload1_reg (.D(rxload0),
    						.CLRN(1'b1),
    						.PRN(1'b1),
    						.ENA(1'b1),
    						.CLK(clk0_in),
    						.Q(rxload1));
    stratix_dffe rxload2_reg (.D(rxload1),
    						.CLRN(1'b1),
    						.PRN(1'b1),
    						.ENA(1'b1),
    						.CLK(!clk0_in),
    						.Q(rxload2));
    assign txload_in = (use_enable1 == "true") ? enable1 : enable0;
    stratix_dffe txload_reg (.D(txload_in),
    						.CLRN(1'b1),
    						.PRN(1'b1),
    						.ENA(1'b1),
    						.CLK(clk0_in),
    						.Q(txload_out));
    stratix_lvds_rx_parallel_register load_reg (.clk(!clk0_in),
    															.enable(rxload2_dly),
    															.datain(shift_data),
    															.dataout(load_data),
    															.devclrn(devclrn),
    															.devpor(devpor));
        defparam load_reg.channel_width = channel_width;
    stratix_lvds_rx_parallel_register output_reg (.clk(txload_out),
                                                  .enable(1'b1),
                                                  .datain(load_data),
                                                  .dataout(dataout),
                                                  .devclrn(devclrn),
                                                  .devpor(devpor));
        defparam output_reg.channel_width = channel_width;
    always @(rxload2)
    begin
        rxload2_dly <= rxload2;
    end
    always @(clk0_in or devpor or devclrn)
    begin
        if ((devpor === 'b0) || (devclrn === 'b0))
             shift_data <= {channel_width{1'b0}};
        else
        begin
            if ((clk0_in === 0) && (clk0_last_value !== clk0_in))
                {tmp_bit, shift_data} <= {shift_data, datain_in};
        end //devpor
        clk0_last_value <= clk0_in;
    end //always
endmodule