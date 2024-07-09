module complex_mult_pipe_prod (
  mult_out_r,
  mult_out_i,
  in_a_r_reg,
  in_b_r_reg,
  in_a_i_reg,
  in_b_i_reg,
  clk
)
;
output [11:0] mult_out_r ;
output [11:0] mult_out_i ;
input [11:0] in_a_r_reg ;
input [11:0] in_b_r_reg ;
input [11:0] in_a_i_reg ;
input [11:0] in_b_i_reg ;
input clk ;
wire clk ;
wire [23:7] pre_out_i;
wire [23:7] pre_out_r;
wire [23:23] mult2_out;
wire [23:23] mult1_out;
wire [23:23] mult3_out;
wire [23:23] mult4_out;
wire [11:11] pos_out_r;
wire [11:11] pos_out_i;
wire [10:0] un7_rnd_out_r;
wire [10:0] pos_out_r_iv_i;
wire [10:0] un5_rnd_out_i;
wire [10:0] pos_out_i_iv_i;
wire [23:0] mult2_out_0;
wire [47:24] P_uc_34_0;
wire [23:0] mult3_out_0;
wire [47:24] P_uc_35_0;
wire un5_rnd_out_i_axb_1 ;
wire un5_rnd_out_i_axb_2 ;
wire un5_rnd_out_i_axb_3 ;
wire un5_rnd_out_i_axb_4 ;
wire un5_rnd_out_i_axb_5 ;
wire un5_rnd_out_i_axb_6 ;
wire un5_rnd_out_i_axb_7 ;
wire un5_rnd_out_i_axb_8 ;
wire un5_rnd_out_i_axb_9 ;
wire un5_rnd_out_i_axb_10 ;
wire un5_rnd_out_i_axb_11 ;
wire un7_rnd_out_r_axb_1 ;
wire un7_rnd_out_r_axb_2 ;
wire un7_rnd_out_r_axb_3 ;
wire un7_rnd_out_r_axb_4 ;
wire un7_rnd_out_r_axb_5 ;
wire un7_rnd_out_r_axb_6 ;
wire un7_rnd_out_r_axb_7 ;
wire un7_rnd_out_r_axb_8 ;
wire un7_rnd_out_r_axb_9 ;
wire un7_rnd_out_r_axb_10 ;
wire un7_rnd_out_r_axb_11 ;
wire un7_rnd_out_r_axb_12 ;
wire un5_rnd_out_i_axb_12 ;
wire un4_rnd_sat_out_i_3 ;
wire un5_rnd_sat_out_r_3 ;
wire un1_pos_out_r_3 ;
wire un1_pos_out_i_3 ;
wire PATTERNDETECT_7 ;
wire un7_rnd_out_r_s_12 ;
wire PATTERNDETECT_8 ;
wire un5_rnd_out_i_s_12 ;
wire un7_rnd_out_r_cry_11 ;
wire un7_rnd_out_r_cry_10 ;
wire GND ;
wire un7_rnd_out_r_cry_9 ;
wire un7_rnd_out_r_cry_8 ;
wire un7_rnd_out_r_cry_7 ;
wire un7_rnd_out_r_cry_6 ;
wire un7_rnd_out_r_cry_5 ;
wire un7_rnd_out_r_cry_4 ;
wire un7_rnd_out_r_cry_3 ;
wire un7_rnd_out_r_cry_2 ;
wire un7_rnd_out_r_cry_1 ;
wire un5_rnd_out_i_cry_11 ;
wire un5_rnd_out_i_cry_10 ;
wire un5_rnd_out_i_cry_9 ;
wire un5_rnd_out_i_cry_8 ;
wire un5_rnd_out_i_cry_7 ;
wire un5_rnd_out_i_cry_6 ;
wire un5_rnd_out_i_cry_5 ;
wire un5_rnd_out_i_cry_4 ;
wire un5_rnd_out_i_cry_3 ;
wire un5_rnd_out_i_cry_2 ;
wire un5_rnd_out_i_cry_1 ;
wire VCC ;
// @24:156
  LUT1 un5_rnd_out_i_axb_1_cZ (
	.I0(pre_out_i[8]),
	.O(un5_rnd_out_i_axb_1)
);
defparam un5_rnd_out_i_axb_1_cZ.INIT=2'h2;
// @24:156
  LUT1 un5_rnd_out_i_axb_2_cZ (
	.I0(pre_out_i[9]),
	.O(un5_rnd_out_i_axb_2)
);
defparam un5_rnd_out_i_axb_2_cZ.INIT=2'h2;
// @24:156
  LUT1 un5_rnd_out_i_axb_3_cZ (
	.I0(pre_out_i[10]),
	.O(un5_rnd_out_i_axb_3)
);
defparam un5_rnd_out_i_axb_3_cZ.INIT=2'h2;
// @24:156
  LUT1 un5_rnd_out_i_axb_4_cZ (
	.I0(pre_out_i[11]),
	.O(un5_rnd_out_i_axb_4)
);
defparam un5_rnd_out_i_axb_4_cZ.INIT=2'h2;
// @24:156
  LUT1 un5_rnd_out_i_axb_5_cZ (
	.I0(pre_out_i[12]),
	.O(un5_rnd_out_i_axb_5)
);
defparam un5_rnd_out_i_axb_5_cZ.INIT=2'h2;
// @24:156
  LUT1 un5_rnd_out_i_axb_6_cZ (
	.I0(pre_out_i[13]),
	.O(un5_rnd_out_i_axb_6)
);
defparam un5_rnd_out_i_axb_6_cZ.INIT=2'h2;
// @24:156
  LUT1 un5_rnd_out_i_axb_7_cZ (
	.I0(pre_out_i[14]),
	.O(un5_rnd_out_i_axb_7)
);
defparam un5_rnd_out_i_axb_7_cZ.INIT=2'h2;
// @24:156
  LUT1 un5_rnd_out_i_axb_8_cZ (
	.I0(pre_out_i[15]),
	.O(un5_rnd_out_i_axb_8)
);
defparam un5_rnd_out_i_axb_8_cZ.INIT=2'h2;
// @24:156
  LUT1 un5_rnd_out_i_axb_9_cZ (
	.I0(pre_out_i[16]),
	.O(un5_rnd_out_i_axb_9)
);
defparam un5_rnd_out_i_axb_9_cZ.INIT=2'h2;
// @24:156
  LUT1 un5_rnd_out_i_axb_10_cZ (
	.I0(pre_out_i[17]),
	.O(un5_rnd_out_i_axb_10)
);
defparam un5_rnd_out_i_axb_10_cZ.INIT=2'h2;
// @24:156
  LUT1 un5_rnd_out_i_axb_11_cZ (
	.I0(pre_out_i[18]),
	.O(un5_rnd_out_i_axb_11)
);
defparam un5_rnd_out_i_axb_11_cZ.INIT=2'h2;
// @24:142
  LUT1 un7_rnd_out_r_axb_1_cZ (
	.I0(pre_out_r[8]),
	.O(un7_rnd_out_r_axb_1)
);
defparam un7_rnd_out_r_axb_1_cZ.INIT=2'h2;
// @24:142
  LUT1 un7_rnd_out_r_axb_2_cZ (
	.I0(pre_out_r[9]),
	.O(un7_rnd_out_r_axb_2)
);
defparam un7_rnd_out_r_axb_2_cZ.INIT=2'h2;
// @24:142
  LUT1 un7_rnd_out_r_axb_3_cZ (
	.I0(pre_out_r[10]),
	.O(un7_rnd_out_r_axb_3)
);
defparam un7_rnd_out_r_axb_3_cZ.INIT=2'h2;
// @24:142
  LUT1 un7_rnd_out_r_axb_4_cZ (
	.I0(pre_out_r[11]),
	.O(un7_rnd_out_r_axb_4)
);
defparam un7_rnd_out_r_axb_4_cZ.INIT=2'h2;
// @24:142
  LUT1 un7_rnd_out_r_axb_5_cZ (
	.I0(pre_out_r[12]),
	.O(un7_rnd_out_r_axb_5)
);
defparam un7_rnd_out_r_axb_5_cZ.INIT=2'h2;
// @24:142
  LUT1 un7_rnd_out_r_axb_6_cZ (
	.I0(pre_out_r[13]),
	.O(un7_rnd_out_r_axb_6)
);
defparam un7_rnd_out_r_axb_6_cZ.INIT=2'h2;
// @24:142
  LUT1 un7_rnd_out_r_axb_7_cZ (
	.I0(pre_out_r[14]),
	.O(un7_rnd_out_r_axb_7)
);
defparam un7_rnd_out_r_axb_7_cZ.INIT=2'h2;
// @24:142
  LUT1 un7_rnd_out_r_axb_8_cZ (
	.I0(pre_out_r[15]),
	.O(un7_rnd_out_r_axb_8)
);
defparam un7_rnd_out_r_axb_8_cZ.INIT=2'h2;
// @24:142
  LUT1 un7_rnd_out_r_axb_9_cZ (
	.I0(pre_out_r[16]),
	.O(un7_rnd_out_r_axb_9)
);
defparam un7_rnd_out_r_axb_9_cZ.INIT=2'h2;
// @24:142
  LUT1 un7_rnd_out_r_axb_10_cZ (
	.I0(pre_out_r[17]),
	.O(un7_rnd_out_r_axb_10)
);
defparam un7_rnd_out_r_axb_10_cZ.INIT=2'h2;
// @24:142
  LUT1 un7_rnd_out_r_axb_11_cZ (
	.I0(pre_out_r[18]),
	.O(un7_rnd_out_r_axb_11)
);
defparam un7_rnd_out_r_axb_11_cZ.INIT=2'h2;
// @24:142
  LUT1 un7_rnd_out_r_axb_12_cZ (
	.I0(pre_out_r[19]),
	.O(un7_rnd_out_r_axb_12)
);
defparam un7_rnd_out_r_axb_12_cZ.INIT=2'h2;
// @24:156
  LUT1 un5_rnd_out_i_axb_12_cZ (
	.I0(pre_out_i[19]),
	.O(un5_rnd_out_i_axb_12)
);
defparam un5_rnd_out_i_axb_12_cZ.INIT=2'h2;
// @24:158
  LUT4 un4_rnd_sat_out_i_3_cZ (
	.I0(pre_out_i[20]),
	.I1(pre_out_i[21]),
	.I2(pre_out_i[22]),
	.I3(pre_out_i[19]),
	.O(un4_rnd_sat_out_i_3)
);
defparam un4_rnd_sat_out_i_3_cZ.INIT=16'h8000;
// @24:146
  LUT4 un5_rnd_sat_out_r_3_cZ (
	.I0(pre_out_r[20]),
	.I1(pre_out_r[21]),
	.I2(pre_out_r[22]),
	.I3(pre_out_r[19]),
	.O(un5_rnd_sat_out_r_3)
);
defparam un5_rnd_sat_out_r_3_cZ.INIT=16'h8000;
// @24:174
  LUT3 un1_pos_out_r (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.O(un1_pos_out_r_3)
);
defparam un1_pos_out_r.INIT=8'h08;
// @24:179
  LUT3 un1_pos_out_i (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.O(un1_pos_out_i_3)
);
defparam un1_pos_out_i.INIT=8'h02;
// @24:174
  LUT6_L \pos_out_r_iv[11]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_7),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un7_rnd_out_r_s_12),
	.LO(pos_out_r[11])
);
defparam \pos_out_r_iv[11] .INIT=64'hE7E0E7E00000E0E0;
// @24:179
  LUT6_L \pos_out_i_iv[11]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_8),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un5_rnd_out_i_s_12),
	.LO(pos_out_i[11])
);
defparam \pos_out_i_iv[11] .INIT=64'hBDB0BDB00000B0B0;
// @24:185
  LUT6_L \out_r_RNO[0]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(un7_rnd_out_r[0]),
	.I4(PATTERNDETECT_7),
	.I5(un5_rnd_sat_out_r_3),
	.LO(pos_out_r_iv_i[0])
);
defparam \out_r_RNO[0] .INIT=64'hFF18FF1F1F181F1F;
// @24:185
  LUT6_L \out_r_RNO[1]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_7),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un7_rnd_out_r[1]),
	.LO(pos_out_r_iv_i[1])
);
defparam \out_r_RNO[1] .INIT=64'hFFFF1F1F181F181F;
// @24:185
  LUT6_L \out_r_RNO[2]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_7),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un7_rnd_out_r[2]),
	.LO(pos_out_r_iv_i[2])
);
defparam \out_r_RNO[2] .INIT=64'hFFFF1F1F181F181F;
// @24:185
  LUT6_L \out_r_RNO[3]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_7),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un7_rnd_out_r[3]),
	.LO(pos_out_r_iv_i[3])
);
defparam \out_r_RNO[3] .INIT=64'hFFFF1F1F181F181F;
// @24:185
  LUT6_L \out_r_RNO[4]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_7),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un7_rnd_out_r[4]),
	.LO(pos_out_r_iv_i[4])
);
defparam \out_r_RNO[4] .INIT=64'hFFFF1F1F181F181F;
// @24:185
  LUT6_L \out_r_RNO[5]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_7),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un7_rnd_out_r[5]),
	.LO(pos_out_r_iv_i[5])
);
defparam \out_r_RNO[5] .INIT=64'hFFFF1F1F181F181F;
// @24:185
  LUT6_L \out_r_RNO[6]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_7),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un7_rnd_out_r[6]),
	.LO(pos_out_r_iv_i[6])
);
defparam \out_r_RNO[6] .INIT=64'hFFFF1F1F181F181F;
// @24:185
  LUT6_L \out_r_RNO[7]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_7),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un7_rnd_out_r[7]),
	.LO(pos_out_r_iv_i[7])
);
defparam \out_r_RNO[7] .INIT=64'hFFFF1F1F181F181F;
// @24:185
  LUT6_L \out_r_RNO[8]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_7),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un7_rnd_out_r[8]),
	.LO(pos_out_r_iv_i[8])
);
defparam \out_r_RNO[8] .INIT=64'hFFFF1F1F181F181F;
// @24:185
  LUT6_L \out_r_RNO[9]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_7),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un7_rnd_out_r[9]),
	.LO(pos_out_r_iv_i[9])
);
defparam \out_r_RNO[9] .INIT=64'hFFFF1F1F181F181F;
// @24:185
  LUT6_L \out_r_RNO[10]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_7),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un7_rnd_out_r[10]),
	.LO(pos_out_r_iv_i[10])
);
defparam \out_r_RNO[10] .INIT=64'hFFFF1F1F181F181F;
// @24:185
  LUT6_L \out_i_RNO[0]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(un5_rnd_out_i[0]),
	.I4(PATTERNDETECT_8),
	.I5(un4_rnd_sat_out_i_3),
	.LO(pos_out_i_iv_i[0])
);
defparam \out_i_RNO[0] .INIT=64'hFF42FF4F4F424F4F;
// @24:185
  LUT6_L \out_i_RNO[1]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_8),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un5_rnd_out_i[1]),
	.LO(pos_out_i_iv_i[1])
);
defparam \out_i_RNO[1] .INIT=64'hFFFF4F4F424F424F;
// @24:185
  LUT6_L \out_i_RNO[2]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_8),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un5_rnd_out_i[2]),
	.LO(pos_out_i_iv_i[2])
);
defparam \out_i_RNO[2] .INIT=64'hFFFF4F4F424F424F;
// @24:185
  LUT6_L \out_i_RNO[3]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_8),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un5_rnd_out_i[3]),
	.LO(pos_out_i_iv_i[3])
);
defparam \out_i_RNO[3] .INIT=64'hFFFF4F4F424F424F;
// @24:185
  LUT6_L \out_i_RNO[4]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_8),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un5_rnd_out_i[4]),
	.LO(pos_out_i_iv_i[4])
);
defparam \out_i_RNO[4] .INIT=64'hFFFF4F4F424F424F;
// @24:185
  LUT6_L \out_i_RNO[5]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_8),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un5_rnd_out_i[5]),
	.LO(pos_out_i_iv_i[5])
);
defparam \out_i_RNO[5] .INIT=64'hFFFF4F4F424F424F;
// @24:185
  LUT6_L \out_i_RNO[6]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_8),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un5_rnd_out_i[6]),
	.LO(pos_out_i_iv_i[6])
);
defparam \out_i_RNO[6] .INIT=64'hFFFF4F4F424F424F;
// @24:185
  LUT6_L \out_i_RNO[7]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_8),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un5_rnd_out_i[7]),
	.LO(pos_out_i_iv_i[7])
);
defparam \out_i_RNO[7] .INIT=64'hFFFF4F4F424F424F;
// @24:185
  LUT6_L \out_i_RNO[8]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_8),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un5_rnd_out_i[8]),
	.LO(pos_out_i_iv_i[8])
);
defparam \out_i_RNO[8] .INIT=64'hFFFF4F4F424F424F;
// @24:185
  LUT6_L \out_i_RNO[9]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_8),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un5_rnd_out_i[9]),
	.LO(pos_out_i_iv_i[9])
);
defparam \out_i_RNO[9] .INIT=64'hFFFF4F4F424F424F;
// @24:185
  LUT6_L \out_i_RNO[10]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_8),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un5_rnd_out_i[10]),
	.LO(pos_out_i_iv_i[10])
);
defparam \out_i_RNO[10] .INIT=64'hFFFF4F4F424F424F;
// @24:142
  XORCY un7_rnd_out_r_s_12_cZ (
	.LI(un7_rnd_out_r_axb_12),
	.CI(un7_rnd_out_r_cry_11),
	.O(un7_rnd_out_r_s_12)
);
// @24:142
  XORCY un7_rnd_out_r_s_11 (
	.LI(un7_rnd_out_r_axb_11),
	.CI(un7_rnd_out_r_cry_10),
	.O(un7_rnd_out_r[10])
);
// @24:142
  MUXCY_L un7_rnd_out_r_cry_11_cZ (
	.DI(GND),
	.CI(un7_rnd_out_r_cry_10),
	.S(un7_rnd_out_r_axb_11),
	.LO(un7_rnd_out_r_cry_11)
);
// @24:142
  XORCY un7_rnd_out_r_s_10 (
	.LI(un7_rnd_out_r_axb_10),
	.CI(un7_rnd_out_r_cry_9),
	.O(un7_rnd_out_r[9])
);
// @24:142
  MUXCY_L un7_rnd_out_r_cry_10_cZ (
	.DI(GND),
	.CI(un7_rnd_out_r_cry_9),
	.S(un7_rnd_out_r_axb_10),
	.LO(un7_rnd_out_r_cry_10)
);
// @24:142
  XORCY un7_rnd_out_r_s_9 (
	.LI(un7_rnd_out_r_axb_9),
	.CI(un7_rnd_out_r_cry_8),
	.O(un7_rnd_out_r[8])
);
// @24:142
  MUXCY_L un7_rnd_out_r_cry_9_cZ (
	.DI(GND),
	.CI(un7_rnd_out_r_cry_8),
	.S(un7_rnd_out_r_axb_9),
	.LO(un7_rnd_out_r_cry_9)
);
// @24:142
  XORCY un7_rnd_out_r_s_8 (
	.LI(un7_rnd_out_r_axb_8),
	.CI(un7_rnd_out_r_cry_7),
	.O(un7_rnd_out_r[7])
);
// @24:142
  MUXCY_L un7_rnd_out_r_cry_8_cZ (
	.DI(GND),
	.CI(un7_rnd_out_r_cry_7),
	.S(un7_rnd_out_r_axb_8),
	.LO(un7_rnd_out_r_cry_8)
);
// @24:142
  XORCY un7_rnd_out_r_s_7 (
	.LI(un7_rnd_out_r_axb_7),
	.CI(un7_rnd_out_r_cry_6),
	.O(un7_rnd_out_r[6])
);
// @24:142
  MUXCY_L un7_rnd_out_r_cry_7_cZ (
	.DI(GND),
	.CI(un7_rnd_out_r_cry_6),
	.S(un7_rnd_out_r_axb_7),
	.LO(un7_rnd_out_r_cry_7)
);
// @24:142
  XORCY un7_rnd_out_r_s_6 (
	.LI(un7_rnd_out_r_axb_6),
	.CI(un7_rnd_out_r_cry_5),
	.O(un7_rnd_out_r[5])
);
// @24:142
  MUXCY_L un7_rnd_out_r_cry_6_cZ (
	.DI(GND),
	.CI(un7_rnd_out_r_cry_5),
	.S(un7_rnd_out_r_axb_6),
	.LO(un7_rnd_out_r_cry_6)
);
// @24:142
  XORCY un7_rnd_out_r_s_5 (
	.LI(un7_rnd_out_r_axb_5),
	.CI(un7_rnd_out_r_cry_4),
	.O(un7_rnd_out_r[4])
);
// @24:142
  MUXCY_L un7_rnd_out_r_cry_5_cZ (
	.DI(GND),
	.CI(un7_rnd_out_r_cry_4),
	.S(un7_rnd_out_r_axb_5),
	.LO(un7_rnd_out_r_cry_5)
);
// @24:142
  XORCY un7_rnd_out_r_s_4 (
	.LI(un7_rnd_out_r_axb_4),
	.CI(un7_rnd_out_r_cry_3),
	.O(un7_rnd_out_r[3])
);
// @24:142
  MUXCY_L un7_rnd_out_r_cry_4_cZ (
	.DI(GND),
	.CI(un7_rnd_out_r_cry_3),
	.S(un7_rnd_out_r_axb_4),
	.LO(un7_rnd_out_r_cry_4)
);
// @24:142
  XORCY un7_rnd_out_r_s_3 (
	.LI(un7_rnd_out_r_axb_3),
	.CI(un7_rnd_out_r_cry_2),
	.O(un7_rnd_out_r[2])
);
// @24:142
  MUXCY_L un7_rnd_out_r_cry_3_cZ (
	.DI(GND),
	.CI(un7_rnd_out_r_cry_2),
	.S(un7_rnd_out_r_axb_3),
	.LO(un7_rnd_out_r_cry_3)
);
// @24:142
  XORCY un7_rnd_out_r_s_2 (
	.LI(un7_rnd_out_r_axb_2),
	.CI(un7_rnd_out_r_cry_1),
	.O(un7_rnd_out_r[1])
);
// @24:142
  MUXCY_L un7_rnd_out_r_cry_2_cZ (
	.DI(GND),
	.CI(un7_rnd_out_r_cry_1),
	.S(un7_rnd_out_r_axb_2),
	.LO(un7_rnd_out_r_cry_2)
);
// @24:142
  XORCY un7_rnd_out_r_s_1 (
	.LI(un7_rnd_out_r_axb_1),
	.CI(pre_out_r[7]),
	.O(un7_rnd_out_r[0])
);
// @24:142
  MUXCY_L un7_rnd_out_r_cry_1_cZ (
	.DI(GND),
	.CI(pre_out_r[7]),
	.S(un7_rnd_out_r_axb_1),
	.LO(un7_rnd_out_r_cry_1)
);
// @24:156
  XORCY un5_rnd_out_i_s_12_cZ (
	.LI(un5_rnd_out_i_axb_12),
	.CI(un5_rnd_out_i_cry_11),
	.O(un5_rnd_out_i_s_12)
);
// @24:156
  XORCY un5_rnd_out_i_s_11 (
	.LI(un5_rnd_out_i_axb_11),
	.CI(un5_rnd_out_i_cry_10),
	.O(un5_rnd_out_i[10])
);
// @24:156
  MUXCY_L un5_rnd_out_i_cry_11_cZ (
	.DI(GND),
	.CI(un5_rnd_out_i_cry_10),
	.S(un5_rnd_out_i_axb_11),
	.LO(un5_rnd_out_i_cry_11)
);
// @24:156
  XORCY un5_rnd_out_i_s_10 (
	.LI(un5_rnd_out_i_axb_10),
	.CI(un5_rnd_out_i_cry_9),
	.O(un5_rnd_out_i[9])
);
// @24:156
  MUXCY_L un5_rnd_out_i_cry_10_cZ (
	.DI(GND),
	.CI(un5_rnd_out_i_cry_9),
	.S(un5_rnd_out_i_axb_10),
	.LO(un5_rnd_out_i_cry_10)
);
// @24:156
  XORCY un5_rnd_out_i_s_9 (
	.LI(un5_rnd_out_i_axb_9),
	.CI(un5_rnd_out_i_cry_8),
	.O(un5_rnd_out_i[8])
);
// @24:156
  MUXCY_L un5_rnd_out_i_cry_9_cZ (
	.DI(GND),
	.CI(un5_rnd_out_i_cry_8),
	.S(un5_rnd_out_i_axb_9),
	.LO(un5_rnd_out_i_cry_9)
);
// @24:156
  XORCY un5_rnd_out_i_s_8 (
	.LI(un5_rnd_out_i_axb_8),
	.CI(un5_rnd_out_i_cry_7),
	.O(un5_rnd_out_i[7])
);
// @24:156
  MUXCY_L un5_rnd_out_i_cry_8_cZ (
	.DI(GND),
	.CI(un5_rnd_out_i_cry_7),
	.S(un5_rnd_out_i_axb_8),
	.LO(un5_rnd_out_i_cry_8)
);
// @24:156
  XORCY un5_rnd_out_i_s_7 (
	.LI(un5_rnd_out_i_axb_7),
	.CI(un5_rnd_out_i_cry_6),
	.O(un5_rnd_out_i[6])
);
// @24:156
  MUXCY_L un5_rnd_out_i_cry_7_cZ (
	.DI(GND),
	.CI(un5_rnd_out_i_cry_6),
	.S(un5_rnd_out_i_axb_7),
	.LO(un5_rnd_out_i_cry_7)
);
// @24:156
  XORCY un5_rnd_out_i_s_6 (
	.LI(un5_rnd_out_i_axb_6),
	.CI(un5_rnd_out_i_cry_5),
	.O(un5_rnd_out_i[5])
);
// @24:156
  MUXCY_L un5_rnd_out_i_cry_6_cZ (
	.DI(GND),
	.CI(un5_rnd_out_i_cry_5),
	.S(un5_rnd_out_i_axb_6),
	.LO(un5_rnd_out_i_cry_6)
);
// @24:156
  XORCY un5_rnd_out_i_s_5 (
	.LI(un5_rnd_out_i_axb_5),
	.CI(un5_rnd_out_i_cry_4),
	.O(un5_rnd_out_i[4])
);
// @24:156
  MUXCY_L un5_rnd_out_i_cry_5_cZ (
	.DI(GND),
	.CI(un5_rnd_out_i_cry_4),
	.S(un5_rnd_out_i_axb_5),
	.LO(un5_rnd_out_i_cry_5)
);
// @24:156
  XORCY un5_rnd_out_i_s_4 (
	.LI(un5_rnd_out_i_axb_4),
	.CI(un5_rnd_out_i_cry_3),
	.O(un5_rnd_out_i[3])
);
// @24:156
  MUXCY_L un5_rnd_out_i_cry_4_cZ (
	.DI(GND),
	.CI(un5_rnd_out_i_cry_3),
	.S(un5_rnd_out_i_axb_4),
	.LO(un5_rnd_out_i_cry_4)
);
// @24:156
  XORCY un5_rnd_out_i_s_3 (
	.LI(un5_rnd_out_i_axb_3),
	.CI(un5_rnd_out_i_cry_2),
	.O(un5_rnd_out_i[2])
);
// @24:156
  MUXCY_L un5_rnd_out_i_cry_3_cZ (
	.DI(GND),
	.CI(un5_rnd_out_i_cry_2),
	.S(un5_rnd_out_i_axb_3),
	.LO(un5_rnd_out_i_cry_3)
);
// @24:156
  XORCY un5_rnd_out_i_s_2 (
	.LI(un5_rnd_out_i_axb_2),
	.CI(un5_rnd_out_i_cry_1),
	.O(un5_rnd_out_i[1])
);
// @24:156
  MUXCY_L un5_rnd_out_i_cry_2_cZ (
	.DI(GND),
	.CI(un5_rnd_out_i_cry_1),
	.S(un5_rnd_out_i_axb_2),
	.LO(un5_rnd_out_i_cry_2)
);
// @24:156
  XORCY un5_rnd_out_i_s_1 (
	.LI(un5_rnd_out_i_axb_1),
	.CI(pre_out_i[7]),
	.O(un5_rnd_out_i[0])
);
// @24:156
  MUXCY_L un5_rnd_out_i_cry_1_cZ (
	.DI(GND),
	.CI(pre_out_i[7]),
	.S(un5_rnd_out_i_axb_1),
	.LO(un5_rnd_out_i_cry_1)
);
// @24:185
  FDR \out_r_Z[0]  (
	.Q(mult_out_r[0]),
	.D(pos_out_r_iv_i[0]),
	.C(clk),
	.R(un1_pos_out_r_3)
);
// @24:185
  FDR \out_r_Z[1]  (
	.Q(mult_out_r[1]),
	.D(pos_out_r_iv_i[1]),
	.C(clk),
	.R(un1_pos_out_r_3)
);
// @24:185
  FDR \out_r_Z[2]  (
	.Q(mult_out_r[2]),
	.D(pos_out_r_iv_i[2]),
	.C(clk),
	.R(un1_pos_out_r_3)
);
// @24:185
  FDR \out_r_Z[3]  (
	.Q(mult_out_r[3]),
	.D(pos_out_r_iv_i[3]),
	.C(clk),
	.R(un1_pos_out_r_3)
);
// @24:185
  FDR \out_r_Z[4]  (
	.Q(mult_out_r[4]),
	.D(pos_out_r_iv_i[4]),
	.C(clk),
	.R(un1_pos_out_r_3)
);
// @24:185
  FDR \out_r_Z[5]  (
	.Q(mult_out_r[5]),
	.D(pos_out_r_iv_i[5]),
	.C(clk),
	.R(un1_pos_out_r_3)
);
// @24:185
  FDR \out_r_Z[6]  (
	.Q(mult_out_r[6]),
	.D(pos_out_r_iv_i[6]),
	.C(clk),
	.R(un1_pos_out_r_3)
);
// @24:185
  FDR \out_r_Z[7]  (
	.Q(mult_out_r[7]),
	.D(pos_out_r_iv_i[7]),
	.C(clk),
	.R(un1_pos_out_r_3)
);
// @24:185
  FDR \out_r_Z[8]  (
	.Q(mult_out_r[8]),
	.D(pos_out_r_iv_i[8]),
	.C(clk),
	.R(un1_pos_out_r_3)
);
// @24:185
  FDR \out_r_Z[9]  (
	.Q(mult_out_r[9]),
	.D(pos_out_r_iv_i[9]),
	.C(clk),
	.R(un1_pos_out_r_3)
);
// @24:185
  FDR \out_r_Z[10]  (
	.Q(mult_out_r[10]),
	.D(pos_out_r_iv_i[10]),
	.C(clk),
	.R(un1_pos_out_r_3)
);
// @24:185
  FDS \out_r_Z[11]  (
	.Q(mult_out_r[11]),
	.D(pos_out_r[11]),
	.C(clk),
	.S(un1_pos_out_r_3)
);
// @24:185
  FDR \out_i_Z[0]  (
	.Q(mult_out_i[0]),
	.D(pos_out_i_iv_i[0]),
	.C(clk),
	.R(un1_pos_out_i_3)
);
// @24:185
  FDR \out_i_Z[1]  (
	.Q(mult_out_i[1]),
	.D(pos_out_i_iv_i[1]),
	.C(clk),
	.R(un1_pos_out_i_3)
);
// @24:185
  FDR \out_i_Z[2]  (
	.Q(mult_out_i[2]),
	.D(pos_out_i_iv_i[2]),
	.C(clk),
	.R(un1_pos_out_i_3)
);
// @24:185
  FDR \out_i_Z[3]  (
	.Q(mult_out_i[3]),
	.D(pos_out_i_iv_i[3]),
	.C(clk),
	.R(un1_pos_out_i_3)
);
// @24:185
  FDR \out_i_Z[4]  (
	.Q(mult_out_i[4]),
	.D(pos_out_i_iv_i[4]),
	.C(clk),
	.R(un1_pos_out_i_3)
);
// @24:185
  FDR \out_i_Z[5]  (
	.Q(mult_out_i[5]),
	.D(pos_out_i_iv_i[5]),
	.C(clk),
	.R(un1_pos_out_i_3)
);
// @24:185
  FDR \out_i_Z[6]  (
	.Q(mult_out_i[6]),
	.D(pos_out_i_iv_i[6]),
	.C(clk),
	.R(un1_pos_out_i_3)
);
// @24:185
  FDR \out_i_Z[7]  (
	.Q(mult_out_i[7]),
	.D(pos_out_i_iv_i[7]),
	.C(clk),
	.R(un1_pos_out_i_3)
);
// @24:185
  FDR \out_i_Z[8]  (
	.Q(mult_out_i[8]),
	.D(pos_out_i_iv_i[8]),
	.C(clk),
	.R(un1_pos_out_i_3)
);
// @24:185
  FDR \out_i_Z[9]  (
	.Q(mult_out_i[9]),
	.D(pos_out_i_iv_i[9]),
	.C(clk),
	.R(un1_pos_out_i_3)
);
// @24:185
  FDR \out_i_Z[10]  (
	.Q(mult_out_i[10]),
	.D(pos_out_i_iv_i[10]),
	.C(clk),
	.R(un1_pos_out_i_3)
);
// @24:185
  FDS \out_i_Z[11]  (
	.Q(mult_out_i[11]),
	.D(pos_out_i[11]),
	.C(clk),
	.S(un1_pos_out_i_3)
);
// @24:82
  mult_pipe mult1 (
	.mult1_out(mult1_out[23]),
	.in_a_r_reg(in_a_r_reg[11:0]),
	.in_b_r_reg(in_b_r_reg[11:0]),
	.clk(clk)
);
// @24:90
  mult_pipe_1 mult2 (
	.mult2_out_23(mult2_out[23]),
	.mult2_out_0(mult2_out_0[23:0]),
	.P_uc_34_0(P_uc_34_0[47:24]),
	.in_a_i_reg(in_a_i_reg[11:0]),
	.in_b_i_reg(in_b_i_reg[11:0]),
	.clk(clk)
);
// @24:98
  mult_pipe_2 mult3 (
	.mult3_out_23(mult3_out[23]),
	.mult3_out_0(mult3_out_0[23:0]),
	.P_uc_35_0(P_uc_35_0[47:24]),
	.in_a_r_reg(in_a_r_reg[11:0]),
	.in_b_i_reg(in_b_i_reg[11:0]),
	.clk(clk)
);
// @24:106
  mult_pipe_3 mult4 (
	.mult4_out(mult4_out[23]),
	.in_a_i_reg(in_a_i_reg[11:0]),
	.in_b_r_reg(in_b_r_reg[11:0]),
	.clk(clk)
);
// @24:114
  add_subZ1 add (
	.pre_out_r(pre_out_r[23:7]),
	.in_a_r_reg(in_a_r_reg[11:0]),
	.in_b_r_reg(in_b_r_reg[11:0]),
	.mult2_out_0(mult2_out_0[23:0]),
	.P_uc_34_0(P_uc_34_0[47:24]),
	.PATTERNDETECT_7(PATTERNDETECT_7),
	.clk(clk)
);
// @24:124
  add_subZ2 sub (
	.pre_out_i(pre_out_i[23:7]),
	.in_a_i_reg(in_a_i_reg[11:0]),
	.in_b_r_reg(in_b_r_reg[11:0]),
	.mult3_out_0(mult3_out_0[23:0]),
	.P_uc_35_0(P_uc_35_0[47:24]),
	.PATTERNDETECT_8(PATTERNDETECT_8),
	.clk(clk)
);
  GND GND_cZ (
	.G(GND)
);
  VCC VCC_cZ (
	.P(VCC)
);
endmodule