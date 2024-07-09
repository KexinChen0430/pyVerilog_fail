module delay
wire	[15:0]	sample_data_fix_dly;
wire				sample_valid_fix_dly;
SRL16E sv_fix(.A0(1'b1), .A1(1'b1), .A2(1'b0), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_valid), .Q(sample_valid_fix_dly));
SRL16E s0_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[0]), .Q(sample_data_fix_dly[0]));
SRL16E s1_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[1]), .Q(sample_data_fix_dly[1]));
SRL16E s2_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[2]), .Q(sample_data_fix_dly[2]));
SRL16E s3_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[3]), .Q(sample_data_fix_dly[3]));
SRL16E s4_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[4]), .Q(sample_data_fix_dly[4]));
SRL16E s5_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[5]), .Q(sample_data_fix_dly[5]));
SRL16E s6_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[6]), .Q(sample_data_fix_dly[6]));
SRL16E s7_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[7]), .Q(sample_data_fix_dly[7]));
SRL16E s8_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[8]), .Q(sample_data_fix_dly[8]));
SRL16E s9_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[9]), .Q(sample_data_fix_dly[9]));
SRL16E sa_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[10]), .Q(sample_data_fix_dly[10]));
SRL16E sb_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[11]), .Q(sample_data_fix_dly[11]));
SRL16E sc_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[12]), .Q(sample_data_fix_dly[12]));
SRL16E sd_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[13]), .Q(sample_data_fix_dly[13]));
SRL16E se_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[14]), .Q(sample_data_fix_dly[14]));
SRL16E sf_fix(.A0(1'b0), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(core_clk), .CE(1'b1), .D(sample_data[15]), .Q(sample_data_fix_dly[15]));
wire	sample_valid_dly;
SRL16E sv(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_valid_fix_dly), .Q(sample_valid_dly));
assign capture_valid_pre_nxt = capture_done_nxt ? 1'b0 :
			   sample_en & ~capture_done? sample_valid_dly : 1'b0;
always @(posedge core_clk or posedge core_rst)
begin
	if (core_rst)
		capture_valid_pre <= `D 1'b0;
	else
		capture_valid_pre <= `D capture_valid_pre_nxt;
end
SRL16E s0(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[0]), .Q(capture_data_pre[0]));
SRL16E s1(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[1]), .Q(capture_data_pre[1]));
SRL16E s2(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[2]), .Q(capture_data_pre[2]));
SRL16E s3(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[3]), .Q(capture_data_pre[3]));
SRL16E s4(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[4]), .Q(capture_data_pre[4]));
SRL16E s5(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[5]), .Q(capture_data_pre[5]));
SRL16E s6(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[6]), .Q(capture_data_pre[6]));
SRL16E s7(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[7]), .Q(capture_data_pre[7]));
SRL16E s8(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[8]), .Q(capture_data_pre[8]));
SRL16E s9(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[9]), .Q(capture_data_pre[9]));
SRL16E sa(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[10]), .Q(capture_data_pre[10]));
SRL16E sb(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[11]), .Q(capture_data_pre[11]));
SRL16E sc(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[12]), .Q(capture_data_pre[12]));
SRL16E sd(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[13]), .Q(capture_data_pre[13]));
SRL16E se(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[14]), .Q(capture_data_pre[14]));
SRL16E sf(.A0(trig_dly[0]), .A1(trig_dly[1]), .A2(trig_dly[2]), .A3(trig_dly[3]), .CLK(core_clk), .CE(1'b1), .D(sample_data_fix_dly[15]), .Q(capture_data_pre[15]));
reg			dso_zero = 1'b0;
wire			dso_zero_nxt;
wire			dso_setZero_done_nxt;
reg	[15:0]	dso_zero_cnt = 16'b0;
wire	[15:0]	dso_zero_cnt_nxt;
reg	[7:0]	ch0_offset = 8'h0;
reg	[7:0]	ch1_offset = 8'h0;
wire	[7:0]	ch0_offset_nxt;
wire	[7:0]	ch1_offset_nxt;
reg			ch0_sign = 1'b0;
reg			ch1_sign = 1'b0;
wire			ch0_sign_nxt;
wire			ch1_sign_nxt;
reg	[15:0]	capture_data_fix;
wire	[15:0]	capture_data_fix_nxt;
reg	[15:0]	capture_data_zero;
wire	[15:0]	capture_data_zero_nxt;
reg			capture_valid_pre_1T;
reg			capture_valid_pre_2T;
wire			capture_valid_zero;
reg			zero_capture;
wire			zero_capture_nxt;
assign dso_zero_nxt = dso_setZero ? 1'b1 :
                      dso_setZero_done_nxt ? 1'b0 : dso_zero;
assign dso_zero_cnt_nxt = dso_setZero ? 16'b0 :
                          (dso_zero & capture_valid_pre) ? dso_zero_cnt + 1'b1 : dso_zero_cnt;
assign dso_setZero_done_nxt = dso_setZero_done ? 1'b0 :
                              (dso_zero & &dso_zero_cnt) ? 1'b1 : dso_setZero_done;
assign capture_data_fix_nxt = capture_valid_pre ? 16'hffff - capture_data_pre : capture_data_fix;
assign capture_data_zero_nxt[7:0] = (ch0_sign & (capture_data_fix[7:0] > ch0_offset))? capture_data_fix[7:0] - ch0_offset : capture_data_fix[7:0] + ch0_offset;
assign capture_data_zero_nxt[15:8] = (ch1_sign & (capture_data_fix[15:8] > ch1_offset))? capture_data_fix[15:8] - ch1_offset : capture_data_fix[15:8] + ch1_offset;
assign ch0_sign_nxt = dso_zero ? ((capture_data_fix[7:0] > 8'h80) ? 1'b1 : 1'b0) : ch0_sign;
assign ch1_sign_nxt = dso_zero ? ((capture_data_fix[15:8] > 8'h80) ? 1'b1 : 1'b0) : ch1_sign;
assign ch0_offset_nxt = (dso_zero & dso_zero_cnt[15] & ch0_sign) ? (capture_data_fix[7:0] - 8'h80 + ch0_offset) >> 1 :
							   (dso_zero & dso_zero_cnt[15] & ~ch0_sign) ? (8'h80 - capture_data_fix[7:0] + ch0_offset) >> 1 : ch0_offset;
assign ch1_offset_nxt = (dso_zero & dso_zero_cnt[15] & ch1_sign) ? (capture_data_fix[15:8] - 8'h80 + ch1_offset) >> 1 :
							   (dso_zero & dso_zero_cnt[15] & ~ch1_sign) ? (8'h80 - capture_data_fix[15:8] + ch1_offset) >> 1 : ch1_offset;
assign zero_capture_nxt = dso_setZero ? 1'b1 :
                          (capture_valid_pre_2T & ~capture_valid_pre_1T) ? 1'b0 : zero_capture;
always @(posedge core_clk)
begin
		dso_zero <= `D dso_zero_nxt;
		dso_zero_cnt <= `D dso_zero_cnt_nxt;
		dso_setZero_done <= `D dso_setZero_done_nxt;
end
always @(posedge core_clk)
begin
		capture_valid_pre_1T <= `D capture_valid_pre;
		capture_valid_pre_2T <= `D capture_valid_pre_1T;
		capture_data_fix <= `D capture_data_fix_nxt;
		capture_data_zero <= `D capture_data_zero_nxt;
		ch0_sign <= `D ch0_sign_nxt;
		ch1_sign <= `D ch1_sign_nxt;
		ch0_offset <= `D ch0_offset_nxt;
		ch1_offset <= `D ch1_offset_nxt;
		zero_capture <= `D zero_capture_nxt;
end
assign capture_valid_zero = capture_valid_pre_1T & ~zero_capture;
assign capture_data = (cons_mode & !wireless_mode) ? capture_data_zero : capture_data_pre;
assign capture_valid = (cons_mode & !wireless_mode) ? capture_valid_zero : capture_valid_pre;
endmodule