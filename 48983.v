module hardcopyii_lvds_tx_out_block (clk,
                                    datain,
                                    dataout,
                                    devclrn,
                                    devpor
                                   );
    parameter bypass_serializer = "false";
    parameter invert_clock = "false";
    parameter use_falling_clock_edge = "false";
    // INPUT PORTS
    input datain;
    input clk;
    input devclrn;
    input devpor;
    // OUTPUT PORTS
    output dataout;
    // INTERNAL VARIABLES AND NETS
    reg dataout_tmp;
    reg clk_last_value;
    wire bypass_mode;
    wire invert_mode;
    wire falling_clk_out;
    // BUFFER INPUTS
    wire clk_in;
    wire datain_in;
    buf (clk_in, clk);
    buf (datain_in, datain);
    // TEST PARAMETER VALUES
    assign falling_clk_out = (use_falling_clock_edge == "true")?1'b1:1'b0;
    assign bypass_mode = (bypass_serializer == "true")?1'b1:1'b0;
    assign invert_mode = (invert_clock == "true")?1'b1:1'b0;
    // TIMING PATHS
    specify
        if (bypass_mode == 1'b1)
            (clk => dataout) = (0, 0);
        if (bypass_mode == 1'b0 && falling_clk_out == 1'b1)
            (negedge clk => (dataout +: dataout_tmp)) = (0, 0);
        if (bypass_mode == 1'b0 && falling_clk_out == 1'b0)
            (datain => (dataout +: dataout_tmp)) = (0, 0);
    endspecify
    initial
    begin
        clk_last_value = 0;
        dataout_tmp = 0;
    end
    always @(clk_in or datain_in or devclrn or devpor)
    begin
        if ((devpor === 1'b0) || (devclrn === 1'b0))
        begin
            dataout_tmp <= 0;
        end
        else begin
            if (bypass_serializer == "false")
            begin
                if (use_falling_clock_edge == "false")
                    dataout_tmp <= datain_in;
                if ((clk_in === 1'b0) && (clk_last_value !== clk_in))
                begin
                    if (use_falling_clock_edge == "true")
                        dataout_tmp <= datain_in;
                end
            end // bypass is off
            else begin
                // generate clk_out
                if (invert_clock == "false")
                    dataout_tmp <= clk_in;
                else
                    dataout_tmp <= !clk_in;
            end // clk output
        end
        clk_last_value <= clk_in;
    end // always
    and (dataout, dataout_tmp, 1'b1);
endmodule