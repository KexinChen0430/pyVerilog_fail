module hardcopyii_lvds_rx_deser (clk,
                                datain,
                                devclrn,
                                devpor,
                                dataout
                               );
    parameter channel_width = 10;
    // INPUT PORTS
    input clk;
    input datain;
    input devclrn;
    input devpor;
    // OUTPUT PORTS
    output [channel_width - 1:0] dataout;
    // INTERNAL VARIABLES AND NETS
    reg [channel_width - 1:0] dataout_tmp;
    reg clk_last_value;
    integer i;
wire clk_ipd;
wire [channel_width - 1:0] datain_ipd;
buf buf_clk (clk_ipd,clk);
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
    always @(clk_ipd or devclrn or devpor)
    begin
        if (devclrn === 1'b0 || devpor === 1'b0)
        begin
            dataout_tmp <= 'b0;
        end
        else if (clk_ipd === 1'b1 && clk_last_value === 1'b0)
        begin
            for (i = (channel_width-1); i > 0; i=i-1)
                dataout_tmp[i] <= dataout_tmp[i-1];
            dataout_tmp[0] <= datain_ipd;
        end
        clk_last_value <= clk_ipd;
    end
    assign dataout_opd = dataout_tmp;
endmodule