module stratixiigx_lvds_rx_parallel_reg (clk,
                                       enable,
                                       datain,
                                       dataout,
//                                       reset,
                                       devclrn,
                                       devpor
                                      );
    parameter channel_width = 10;
    // INPUT PORTS
    input [channel_width - 1:0] datain;
    input clk;
    input enable;
//    input reset;
    input devclrn;
    input devpor;
    // OUTPUT PORTS
    output [channel_width - 1:0] dataout;
    // INTERNAL VARIABLES AND NETS
    reg clk_last_value;
    reg [channel_width - 1:0] dataout_tmp;
wire clk_ipd;
wire enable_ipd;
wire [channel_width - 1:0] datain_ipd;
buf buf_clk (clk_ipd,clk);
buf buf_enable (enable_ipd,enable);
buf buf_datain [channel_width - 1:0] (datain_ipd,datain);
wire  [channel_width - 1:0] dataout_opd;
buf buf_dataout  [channel_width - 1:0] (dataout,dataout_opd);
    specify
       (posedge clk => (dataout +: dataout_tmp)) = (0, 0);
    endspecify
    initial
    begin
        clk_last_value = 0;
        dataout_tmp = 'b0;
    end
    always @(clk_ipd or devpor or devclrn)
    begin
        if ((devpor === 1'b0) || (devclrn === 1'b0))
        begin
            dataout_tmp <= 'b0;
        end
        else begin
            if ((clk_ipd === 1) && (clk_last_value !== clk_ipd))
            begin
//                if (reset === 1)
//                begin
//                    dataout_tmp <= 10'b0;
//                end
//                else if (enable_in === 1)
                if (enable_ipd === 1)
                begin
                    dataout_tmp <= datain_ipd;
                end
            end
        end
        clk_last_value <= clk_ipd;
    end //always
    assign dataout_opd = dataout_tmp;
endmodule