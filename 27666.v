module cycloneii_clk_delay_ctrl (
                        clk,
                        delayctrlin,
                        disablecalibration,
                        pllcalibrateclkdelayedin,
                        devpor,
                        devclrn,
                        clkout
                        );
input clk;
input [5:0] delayctrlin;
input disablecalibration;
input pllcalibrateclkdelayedin;
input devpor;
input devclrn;
output clkout;
parameter behavioral_sim_delay = 0;
parameter delay_chain          = "54";  // or "1362ps"
parameter delay_chain_mode     = "static";
parameter uses_calibration     = "false";
parameter use_new_style_dq_detection  = "false";
parameter tan_delay_under_delay_ctrl_signal = "unused";
parameter delay_ctrl_sim_delay_15_0  = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter delay_ctrl_sim_delay_31_16 = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter delay_ctrl_sim_delay_47_32 = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter delay_ctrl_sim_delay_63_48 = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter lpm_type  = "cycloneii_clk_delay_ctrl";
tri1 devclrn;
tri1 devpor;
// BUFFERED BUS INPUTS
wire [5:0] delayctrl_in;
// TMP OUTPUTS
wire clk_out_w;
wire clk_after_calib_mux_w;
reg clk_after_dly_chain_r;
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
// TIMING HOOKS
wire clk_in;
wire delayctrl_in5;
wire delayctrl_in4;
wire delayctrl_in3;
wire delayctrl_in2;
wire delayctrl_in1;
wire delayctrl_in0;
wire disablecalibration_in;
wire pllcalibrateclkdelayed_in;
buf (clk_in, clk);
buf (delayctrl_in5, delayctrlin[5]);
buf (delayctrl_in4, delayctrlin[4]);
buf (delayctrl_in3, delayctrlin[3]);
buf (delayctrl_in2, delayctrlin[2]);
buf (delayctrl_in1, delayctrlin[1]);
buf (delayctrl_in0, delayctrlin[0]);
buf (disablecalibration_in, disablecalibration);
buf (pllcalibrateclkdelayed_in, pllcalibrateclkdelayedin);
assign delayctrl_in = {delayctrl_in5, delayctrl_in4, delayctrl_in3,
                       delayctrl_in2,delayctrl_in1,delayctrl_in0};
specify
    (clk => clkout) = (0,0);
    (disablecalibration => clkout) = (0,0);
    (pllcalibrateclkdelayedin => clkout) = (0,0);
endspecify
// MODEL
initial
begin
    delay_ctrl_sim_delay_all_r = {delay_ctrl_sim_delay_63_48, delay_ctrl_sim_delay_47_32, delay_ctrl_sim_delay_31_16, delay_ctrl_sim_delay_15_0};
    // dly_table_r = delay_ctrl_sim_delay_all_r;
    for (i=0; i<64; i=i+1)
    begin
        // dly_table_r[i] = delay_ctrl_sim_delay_all_r[32*i+31 : 32*i];
        for (j=0; j<32; j=j+1)
            a_val_r[j] = delay_ctrl_sim_delay_all_r[32*i+j];
        dly_table_r[i] = a_val_r;
    end
`ifdef CYCLONEII_CLK_DELAY_CTRL_DEBUG
    $display("DEBUG: CLK_DELAY_CTRL instance %m has dynamic delay table ...");
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
// generating post delay chain clock
always @(clk_in)
begin
    if (delay_chain_mode == "dynamic")
        clk_after_dly_chain_r <= #(dqs_dynamic_dly_i) clk_in;
    else if (delay_chain_mode == "static")
        clk_after_dly_chain_r <= #(behavioral_sim_delay) clk_in;
end
// generating post calib mux clock
assign clk_after_calib_mux_w = (uses_calibration == "true" && disablecalibration_in === 1'b0) ?
                                pllcalibrateclkdelayed_in : clk_after_dly_chain_r;
// final clock
assign clk_out_w = (delay_chain_mode == "none") ? clk_in : clk_after_calib_mux_w;
and (clkout, clk_out_w, 1'b1);
endmodule