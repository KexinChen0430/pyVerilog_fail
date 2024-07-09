module cycloneii_mac_data_reg (clk,
                               data,
                               ena,
                               aclr,
                               dataout
                              );
    parameter data_width = 18;
    // INPUT PORTS
    input clk;
    input [17 : 0] data;
    input ena;
    input aclr;
    // OUTPUT PORTS
    output [17:0] dataout;
    // INTERNAL VARIABLES AND NETS
    reg clk_last_value;
    reg [17:0] dataout_tmp;
    wire [17:0] dataout_wire;
    // INTERNAL VARIABLES
    wire [17:0] data_ipd;
    wire enable;
    wire no_clr;
    reg d_viol;
    reg ena_viol;
    wire clk_ipd;
    wire ena_ipd;
    wire aclr_ipd;
    // BUFFER INPUTS
    buf (clk_ipd, clk);
    buf (ena_ipd, ena);
    buf (aclr_ipd, aclr);
    buf (data_ipd[0], data[0]);
    buf (data_ipd[1], data[1]);
    buf (data_ipd[2], data[2]);
    buf (data_ipd[3], data[3]);
    buf (data_ipd[4], data[4]);
    buf (data_ipd[5], data[5]);
    buf (data_ipd[6], data[6]);
    buf (data_ipd[7], data[7]);
    buf (data_ipd[8], data[8]);
    buf (data_ipd[9], data[9]);
    buf (data_ipd[10], data[10]);
    buf (data_ipd[11], data[11]);
    buf (data_ipd[12], data[12]);
    buf (data_ipd[13], data[13]);
    buf (data_ipd[14], data[14]);
    buf (data_ipd[15], data[15]);
    buf (data_ipd[16], data[16]);
    buf (data_ipd[17], data[17]);
    assign enable = (!aclr_ipd) && (ena_ipd);
    assign no_clr = (!aclr_ipd);
    // TIMING PATHS
    specify
        $setuphold (posedge clk &&& enable, data, 0, 0, d_viol);
        $setuphold (posedge clk &&& no_clr, ena, 0, 0, ena_viol);
        (posedge clk => (dataout +: dataout_tmp)) = (0, 0);
        (posedge aclr => (dataout +: 1'b0)) = (0, 0);
    endspecify
    initial
    begin
        clk_last_value <= 'b0;
        dataout_tmp <= 18'b0;
    end
    always @(clk_ipd or aclr_ipd)
    begin
        if (d_viol == 1'b1 || ena_viol == 1'b1)
        begin
            dataout_tmp <= 'bX;
        end
        else if (aclr_ipd == 1'b1)
        begin
            dataout_tmp <= 'b0;
        end
        else
        begin
            if ((clk_ipd === 1'b1) && (clk_last_value == 1'b0))
                if (ena_ipd === 1'b1)
                    dataout_tmp <= data_ipd;
        end
        clk_last_value <= clk_ipd;
    end // always
    assign dataout_wire = dataout_tmp;
    and (dataout[0], dataout_wire[0], 1'b1);
    and (dataout[1], dataout_wire[1], 1'b1);
    and (dataout[2], dataout_wire[2], 1'b1);
    and (dataout[3], dataout_wire[3], 1'b1);
    and (dataout[4], dataout_wire[4], 1'b1);
    and (dataout[5], dataout_wire[5], 1'b1);
    and (dataout[6], dataout_wire[6], 1'b1);
    and (dataout[7], dataout_wire[7], 1'b1);
    and (dataout[8], dataout_wire[8], 1'b1);
    and (dataout[9], dataout_wire[9], 1'b1);
    and (dataout[10], dataout_wire[10], 1'b1);
    and (dataout[11], dataout_wire[11], 1'b1);
    and (dataout[12], dataout_wire[12], 1'b1);
    and (dataout[13], dataout_wire[13], 1'b1);
    and (dataout[14], dataout_wire[14], 1'b1);
    and (dataout[15], dataout_wire[15], 1'b1);
    and (dataout[16], dataout_wire[16], 1'b1);
    and (dataout[17], dataout_wire[17], 1'b1);
endmodule