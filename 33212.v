module cycloneii_clk_delay_cal_ctrl(
    pllcalibrateclk, plldataclk, delayctrlin, disablecalibration,
    devclrn, devpor,
    calibratedata, pllcalibrateclkdelayedout);
input pllcalibrateclk;
input plldataclk;
input [5:0] delayctrlin;
input disablecalibration;
input devclrn;
input devpor;
output calibratedata;
output pllcalibrateclkdelayedout;
parameter delay_ctrl_sim_delay_15_0  = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter delay_ctrl_sim_delay_31_16 = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter delay_ctrl_sim_delay_47_32 = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter delay_ctrl_sim_delay_63_48 = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter lpm_type  = "cycloneii_clk_delay_cal_ctrl";
// BUFFERED BUS INPUTS
wire [5:0] delayctrl_in;
// TIMING HOOKS
wire plldataclk_in;
wire pllcalibrateclk_in;
wire delayctrl_in5;
wire delayctrl_in4;
wire delayctrl_in3;
wire delayctrl_in2;
wire delayctrl_in1;
wire delayctrl_in0;
wire disablecalibration_in;
buf (plldataclk_in, plldataclk);
buf (pllcalibrateclk_in, pllcalibrateclk);
buf (delayctrl_in5, delayctrlin[5]);
buf (delayctrl_in4, delayctrlin[4]);
buf (delayctrl_in3, delayctrlin[3]);
buf (delayctrl_in2, delayctrlin[2]);
buf (delayctrl_in1, delayctrlin[1]);
buf (delayctrl_in0, delayctrlin[0]);
buf (disablecalibration_in, disablecalibration);
// TMP OUTPUTS
wire cal_clk_out_w;
wire cal_data_out_w;
reg clk_after_dly_chain_r;
reg cal_clk_by2_r;
reg cal_data_by2_r;
reg cal_clk_prev;
reg cal_data_prev;
integer dqs_dynamic_dly_index_i;
integer dqs_dynamic_dly_i;
// Dynamic Delay Table
reg [31:0] dly_table_r [0:63];
reg [2047:0] delay_ctrl_sim_delay_all_r;
reg [31:0] a_val_r;
integer i;
integer j;
// FUNCTIONS
// INTERNAL NETS AND VARIABLES
assign delayctrl_in = {delayctrl_in5, delayctrl_in4, delayctrl_in3,
                       delayctrl_in2,delayctrl_in1,delayctrl_in0};
specify
    (plldataclk => calibratedata) = (0,0);
    (disablecalibration => calibratedata) = (0,0);
    (pllcalibrateclk => pllcalibrateclkdelayedout) = (0,0);
    (disablecalibration => pllcalibrateclkdelayedout) = (0,0);
endspecify
// MODEL
initial
begin
    delay_ctrl_sim_delay_all_r = {delay_ctrl_sim_delay_63_48, delay_ctrl_sim_delay_47_32, delay_ctrl_sim_delay_31_16, delay_ctrl_sim_delay_15_0};
    for (i=0; i<64; i=i+1)
    begin
        for (j=0; j<32; j=j+1)
            a_val_r[j] = delay_ctrl_sim_delay_all_r[32*i+j];
        dly_table_r[i] = a_val_r;
    end
`ifdef CYCLONEII_CLK_DELAY_CTRL_DEBUG
    $display("DEBUG: CLK_DELAY_CAL_CTRL instance %m has dynamic delay table ...");
    for (i=0; i<64; i=i+1)
        $display("%0d", dly_table_r[i]);
`endif
end
// generate dynamic delay value
initial
begin
    dqs_dynamic_dly_index_i = 0;
    dqs_dynamic_dly_i = 0;
end
always @(delayctrl_in)
begin
    dqs_dynamic_dly_index_i = delayctrl_in;
	if (dqs_dynamic_dly_index_i >= 0 && dqs_dynamic_dly_index_i < 64)
        dqs_dynamic_dly_i = dly_table_r[dqs_dynamic_dly_index_i];
end
// generate divided by 2 clocks
initial
begin
    cal_clk_by2_r = 1'b0;
end
always @(pllcalibrateclk_in or posedge disablecalibration_in or negedge devclrn or negedge devpor)
begin
    if (disablecalibration_in === 1'b1 || devclrn === 1'b0 || devpor === 1'b0)
        begin
            cal_clk_prev <= 1'bx;
            cal_clk_by2_r <= 1'b0;
        end
    else
        begin
            cal_clk_prev <= pllcalibrateclk_in;
            if (pllcalibrateclk_in === 1'b1 && cal_clk_prev === 1'b0)
                cal_clk_by2_r <= ~cal_clk_by2_r;
        end
end
initial
begin
    cal_data_by2_r = 1'b0;
end
always @(plldataclk_in or posedge disablecalibration_in or negedge devclrn or negedge devpor)
begin
    if (disablecalibration_in === 1'b1 || devclrn === 1'b0 || devpor === 1'b0)
        begin
            cal_data_prev <= 1'bx;
            cal_data_by2_r <= 1'b0;
        end
    else
        begin
            cal_data_prev <= plldataclk_in;
            if (plldataclk_in === 1'b1 && cal_data_prev === 1'b0)
                cal_data_by2_r <= ~cal_data_by2_r;
        end
end
// generating post delay chain clock
always @(cal_clk_by2_r)
begin
    clk_after_dly_chain_r <= #(dqs_dynamic_dly_i) cal_clk_by2_r;
end
// final clocks
assign cal_clk_out_w = clk_after_dly_chain_r;
assign cal_data_out_w = cal_data_by2_r;
and (calibratedata, cal_data_out_w, 1'b1);
and (pllcalibrateclkdelayedout, cal_clk_out_w, 1'b1);
endmodule