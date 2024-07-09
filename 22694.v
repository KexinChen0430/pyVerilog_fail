module hardcopyiii_lvds_rx_parallel_reg (
                                   clk,
                                   enable,
                                   datain,
                                   dataout,
                                   devclrn,
                                   devpor
                                  );
    parameter channel_width = 10;
    // INPUT PORTS
    input [channel_width - 1:0] datain;
    input clk;
    input enable;
    input devclrn;
    input devpor;
    // OUTPUT PORTS
    output [channel_width - 1:0] dataout;
    // INTERNAL VARIABLES AND NETS
    reg clk_last_value;
    reg [channel_width - 1:0] dataout_tmp;
    specify
       (posedge clk => (dataout +: dataout_tmp)) = (0, 0);
    endspecify
initial
    begin
        clk_last_value = 0;
        dataout_tmp = 'b0;
    end
always @(clk or devpor or devclrn)
    begin
        if ((devpor === 1'b0) || (devclrn === 1'b0))
            begin
                dataout_tmp <= 'b0;
            end
        else
            begin
                if ((clk === 1) && (clk_last_value !== clk))
                    begin
                        if (enable === 1)
                            begin
                                dataout_tmp <= datain;
                            end
                    end
            end
        clk_last_value <= clk;
    end //always
assign dataout = dataout_tmp;
endmodule