module
chipscope_ila ila1 (
    .CONTROL(control1),
    .CLK(clk357),
    .TRIG0(trig0)
    );
assign trig0={242'd0, p1_xdif_data, store_strb};
*/
// %%%%%%%%%%%%%%%%%%%   CHIPSCOPE CORES FOR DEBUGGING   %%%%%%%%%%%%%%%%%%%
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
  wire [35:0] control0;
  wire [35:0] control1;
  wire [35:0] control2;
  font5_icon i_font5_icon
    (
      .control0(control0),
      .control1(control1),
      .control2(control2)
    );
  wire [127:0] async_in;
  wire [127:0] async_out;
  font5_vio i_font5_vio
    (
      .control(control0),
      .async_in(async_in),
      .async_out(async_out)
    );
  wire [47:0] ila_p1_data_trig;
  font5_p1_ila i_font5_p1_ila
    (
      .control(control1),
      .clk(clk357),
      .trig0(ila_p1_data_trig)
    );
	assign ila_p1_data_trig = {18'b0, p1_xdif_data, p1_store_strb};
  wire [41:0] ila_p1_monitor_trigger;
  font5_p1_mon_ila i_font5_p1_mon_ila
    (
      .control(control2),
      .clk(clk40),
      .trig0(ila_p1_monitor_trigger)
    );
assign ila_p1_monitor_trigger ={p1_mon_total_drdy_del, p1_mon_total_data_del, p1_mon_delay_mod, p1_mon_count1, p1_mon_count2, p1_mon_count3, p1_mon_saturated, p1_mon_strb};
// Assign VIO signals for debugging (128 bits for now)
//assign p1_xdif_polarity = async_out[12:0];
//assign p1_ydif_polarity = async_out[25:13];
//assign p1_sum_polarity  = async_out[38:26];
//assign cr_p1_offset_delay = async_out[5:0];
//assign trim_cnt_stop = async_out[8:0];
//assign trim_dac_addr = async_out[12:9];
//assign trim_dac_cmd = async_out[16:13];
//assign trim_ld_polarity = async_out[17];
// Assign VIO signals to monitor (~128 bits total)
 assign async_in[5:0] = clk357_idelay_mon;
 assign async_in[6] = pll_clk357_locked;
 assign async_in[7] = dcm200_locked;
 assign async_in[8] = idelayctrl_rdy;
 assign async_in[15:9] = cr_trig_delay;
 assign async_in[22:16] = cr_trig_out_delay;
 assign async_in[23] = cr_trig_out_en;
 assign async_in[24] = cr_clk2_16_edge_sel;
 assign async_in[30:25] = cr_p1_offset_delay;
 assign async_in[36:31] = cr_p1_scan_delay;
 assign async_in[42:37] = p1_mon_adc_clk_del;
//output 	[7:0]		p1_bunch1pos;
//output 	[7:0]		p1_bunch2pos;
//output 	[7:0]		p1_bunch3pos;
//output  	[7:0]		p2_bunch1pos;
//output 	[7:0]		p2_bunch2pos;
//output 	[7:0]		p2_bunch3pos;
//output 	[7:0]		p3_bunch1pos;
//output 	[7:0]		p3_bunch2pos;
//output 	[7:0]		p3_bunch3pos;
//output 				k1_fb_on;
//output 				k2_fb_on;
//output			 	k1_delayloop_on;
//output 				k2_delayloop_on;
//output 				k1_const_dac_en;
//output 				k2_const_dac_en;
//output 	[13:0]	k1_const_dac_out;
//output  	[13:0]	k2_const_dac_out;
*/
endmodule