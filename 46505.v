module \complex_mult_pipe_vec_mult_inst_gen_mults.2.mult_3  (
  out_i_vec_mult_3,
  out_r_vec_mult_3,
  out_inner_prod_r,
  vec_out_r_AQ_3,
  out_inv_sqrt_0,
  out_inv_sqrt_1,
  out_inv_sqrt_2,
  out_inv_sqrt_7,
  out_inv_sqrt_8,
  out_inv_sqrt_9,
  out_inv_sqrt_10,
  out_inv_sqrt_11,
  in_b_vec_mult_sel,
  vec_out_i_AQ_3,
  out_inner_prod_i,
  in_b_i_reg,
  clk,
  N_425_i,
  N_428_i,
  N_431_i,
  N_434_i
)
;
output [11:0] out_i_vec_mult_3 ;
output [11:0] out_r_vec_mult_3 ;
input [11:0] out_inner_prod_r ;
input [11:0] vec_out_r_AQ_3 ;
input out_inv_sqrt_0 ;
input out_inv_sqrt_1 ;
input out_inv_sqrt_2 ;
input out_inv_sqrt_7 ;
input out_inv_sqrt_8 ;
input out_inv_sqrt_9 ;
input out_inv_sqrt_10 ;
input out_inv_sqrt_11 ;
input [0:0] in_b_vec_mult_sel ;
input [11:0] vec_out_i_AQ_3 ;
input [11:0] out_inner_prod_i ;
input [11:0] in_b_i_reg ;
input clk ;
input N_425_i ;
input N_428_i ;
input N_431_i ;
input N_434_i ;
wire out_inv_sqrt_0 ;
wire out_inv_sqrt_1 ;
wire out_inv_sqrt_2 ;
wire out_inv_sqrt_7 ;
wire out_inv_sqrt_8 ;
wire out_inv_sqrt_9 ;
wire out_inv_sqrt_10 ;
wire out_inv_sqrt_11 ;
wire clk ;
wire N_425_i ;
wire N_428_i ;
wire N_431_i ;
wire N_434_i ;
wire [23:7] pre_out_r;
wire [23:7] pre_out_i;
wire [23:23] mult2_out;
wire [23:23] mult1_out;
wire [23:23] mult3_out;
wire [23:23] mult4_out;
wire [11:11] pos_out_r;
wire [11:11] pos_out_i;
wire [10:0] un1_rnd_out_i;
wire [10:0] pos_out_i_iv_i;
wire [10:0] un2_rnd_out_r;
wire [10:0] pos_out_r_iv_i;
wire [23:0] mult1_out_0;
wire [47:24] P_uc_28_0;
wire [23:0] mult4_out_0;
wire [47:24] P_uc_31_0;
wire un2_rnd_out_r_axb_1 ;
wire un2_rnd_out_r_axb_2 ;
wire un2_rnd_out_r_axb_3 ;
wire un2_rnd_out_r_axb_4 ;
wire un2_rnd_out_r_axb_5 ;
wire un2_rnd_out_r_axb_6 ;
wire un2_rnd_out_r_axb_7 ;
wire un2_rnd_out_r_axb_8 ;
wire un2_rnd_out_r_axb_9 ;
wire un2_rnd_out_r_axb_10 ;
wire un2_rnd_out_r_axb_11 ;
wire un1_rnd_out_i_axb_1 ;
wire un1_rnd_out_i_axb_2 ;
wire un1_rnd_out_i_axb_3 ;
wire un1_rnd_out_i_axb_4 ;
wire un1_rnd_out_i_axb_5 ;
wire un1_rnd_out_i_axb_6 ;
wire un1_rnd_out_i_axb_7 ;
wire un1_rnd_out_i_axb_8 ;
wire un1_rnd_out_i_axb_9 ;
wire un1_rnd_out_i_axb_10 ;
wire un1_rnd_out_i_axb_11 ;
wire un1_rnd_out_i_axb_12 ;
wire un2_rnd_out_r_axb_12 ;
wire un4_rnd_sat_out_i_3 ;
wire un5_rnd_sat_out_r_3 ;
wire un1_pos_out_r_2 ;
wire un1_pos_out_i_2 ;
wire PATTERNDETECT_6 ;
wire un2_rnd_out_r_s_12_1 ;
wire PATTERNDETECT_5 ;
wire un1_rnd_out_i_s_12_1 ;
wire un1_rnd_out_i_cry_11 ;
wire un1_rnd_out_i_cry_10 ;
wire GND ;
wire un1_rnd_out_i_cry_9 ;
wire un1_rnd_out_i_cry_8 ;
wire un1_rnd_out_i_cry_7 ;
wire un1_rnd_out_i_cry_6 ;
wire un1_rnd_out_i_cry_5 ;
wire un1_rnd_out_i_cry_4 ;
wire un1_rnd_out_i_cry_3 ;
wire un1_rnd_out_i_cry_2 ;
wire un1_rnd_out_i_cry_1 ;
wire un2_rnd_out_r_cry_11 ;
wire un2_rnd_out_r_cry_10 ;
wire un2_rnd_out_r_cry_9 ;
wire un2_rnd_out_r_cry_8 ;
wire un2_rnd_out_r_cry_7 ;
wire un2_rnd_out_r_cry_6 ;
wire un2_rnd_out_r_cry_5 ;
wire un2_rnd_out_r_cry_4 ;
wire un2_rnd_out_r_cry_3 ;
wire un2_rnd_out_r_cry_2 ;
wire un2_rnd_out_r_cry_1 ;
wire VCC ;
// @17:140
  LUT1 un2_rnd_out_r_axb_1_cZ (
	.I0(pre_out_r[8]),
	.O(un2_rnd_out_r_axb_1)
);
defparam un2_rnd_out_r_axb_1_cZ.INIT=2'h2;
// @17:140
  LUT1 un2_rnd_out_r_axb_2_cZ (
	.I0(pre_out_r[9]),
	.O(un2_rnd_out_r_axb_2)
);
defparam un2_rnd_out_r_axb_2_cZ.INIT=2'h2;
// @17:140
  LUT1 un2_rnd_out_r_axb_3_cZ (
	.I0(pre_out_r[10]),
	.O(un2_rnd_out_r_axb_3)
);
defparam un2_rnd_out_r_axb_3_cZ.INIT=2'h2;
// @17:140
  LUT1 un2_rnd_out_r_axb_4_cZ (
	.I0(pre_out_r[11]),
	.O(un2_rnd_out_r_axb_4)
);
defparam un2_rnd_out_r_axb_4_cZ.INIT=2'h2;
// @17:140
  LUT1 un2_rnd_out_r_axb_5_cZ (
	.I0(pre_out_r[12]),
	.O(un2_rnd_out_r_axb_5)
);
defparam un2_rnd_out_r_axb_5_cZ.INIT=2'h2;
// @17:140
  LUT1 un2_rnd_out_r_axb_6_cZ (
	.I0(pre_out_r[13]),
	.O(un2_rnd_out_r_axb_6)
);
defparam un2_rnd_out_r_axb_6_cZ.INIT=2'h2;
// @17:140
  LUT1 un2_rnd_out_r_axb_7_cZ (
	.I0(pre_out_r[14]),
	.O(un2_rnd_out_r_axb_7)
);
defparam un2_rnd_out_r_axb_7_cZ.INIT=2'h2;
// @17:140
  LUT1 un2_rnd_out_r_axb_8_cZ (
	.I0(pre_out_r[15]),
	.O(un2_rnd_out_r_axb_8)
);
defparam un2_rnd_out_r_axb_8_cZ.INIT=2'h2;
// @17:140
  LUT1 un2_rnd_out_r_axb_9_cZ (
	.I0(pre_out_r[16]),
	.O(un2_rnd_out_r_axb_9)
);
defparam un2_rnd_out_r_axb_9_cZ.INIT=2'h2;
// @17:140
  LUT1 un2_rnd_out_r_axb_10_cZ (
	.I0(pre_out_r[17]),
	.O(un2_rnd_out_r_axb_10)
);
defparam un2_rnd_out_r_axb_10_cZ.INIT=2'h2;
// @17:140
  LUT1 un2_rnd_out_r_axb_11_cZ (
	.I0(pre_out_r[18]),
	.O(un2_rnd_out_r_axb_11)
);
defparam un2_rnd_out_r_axb_11_cZ.INIT=2'h2;
// @17:154
  LUT1 un1_rnd_out_i_axb_1_cZ (
	.I0(pre_out_i[8]),
	.O(un1_rnd_out_i_axb_1)
);
defparam un1_rnd_out_i_axb_1_cZ.INIT=2'h2;
// @17:154
  LUT1 un1_rnd_out_i_axb_2_cZ (
	.I0(pre_out_i[9]),
	.O(un1_rnd_out_i_axb_2)
);
defparam un1_rnd_out_i_axb_2_cZ.INIT=2'h2;
// @17:154
  LUT1 un1_rnd_out_i_axb_3_cZ (
	.I0(pre_out_i[10]),
	.O(un1_rnd_out_i_axb_3)
);
defparam un1_rnd_out_i_axb_3_cZ.INIT=2'h2;
// @17:154
  LUT1 un1_rnd_out_i_axb_4_cZ (
	.I0(pre_out_i[11]),
	.O(un1_rnd_out_i_axb_4)
);
defparam un1_rnd_out_i_axb_4_cZ.INIT=2'h2;
// @17:154
  LUT1 un1_rnd_out_i_axb_5_cZ (
	.I0(pre_out_i[12]),
	.O(un1_rnd_out_i_axb_5)
);
defparam un1_rnd_out_i_axb_5_cZ.INIT=2'h2;
// @17:154
  LUT1 un1_rnd_out_i_axb_6_cZ (
	.I0(pre_out_i[13]),
	.O(un1_rnd_out_i_axb_6)
);
defparam un1_rnd_out_i_axb_6_cZ.INIT=2'h2;
// @17:154
  LUT1 un1_rnd_out_i_axb_7_cZ (
	.I0(pre_out_i[14]),
	.O(un1_rnd_out_i_axb_7)
);
defparam un1_rnd_out_i_axb_7_cZ.INIT=2'h2;
// @17:154
  LUT1 un1_rnd_out_i_axb_8_cZ (
	.I0(pre_out_i[15]),
	.O(un1_rnd_out_i_axb_8)
);
defparam un1_rnd_out_i_axb_8_cZ.INIT=2'h2;
// @17:154
  LUT1 un1_rnd_out_i_axb_9_cZ (
	.I0(pre_out_i[16]),
	.O(un1_rnd_out_i_axb_9)
);
defparam un1_rnd_out_i_axb_9_cZ.INIT=2'h2;
// @17:154
  LUT1 un1_rnd_out_i_axb_10_cZ (
	.I0(pre_out_i[17]),
	.O(un1_rnd_out_i_axb_10)
);
defparam un1_rnd_out_i_axb_10_cZ.INIT=2'h2;
// @17:154
  LUT1 un1_rnd_out_i_axb_11_cZ (
	.I0(pre_out_i[18]),
	.O(un1_rnd_out_i_axb_11)
);
defparam un1_rnd_out_i_axb_11_cZ.INIT=2'h2;
// @17:154
  LUT1 un1_rnd_out_i_axb_12_cZ (
	.I0(pre_out_i[19]),
	.O(un1_rnd_out_i_axb_12)
);
defparam un1_rnd_out_i_axb_12_cZ.INIT=2'h2;
// @17:140
  LUT1 un2_rnd_out_r_axb_12_cZ (
	.I0(pre_out_r[19]),
	.O(un2_rnd_out_r_axb_12)
);
defparam un2_rnd_out_r_axb_12_cZ.INIT=2'h2;
// @17:156
  LUT4 un4_rnd_sat_out_i_3_cZ (
	.I0(pre_out_i[20]),
	.I1(pre_out_i[21]),
	.I2(pre_out_i[22]),
	.I3(pre_out_i[19]),
	.O(un4_rnd_sat_out_i_3)
);
defparam un4_rnd_sat_out_i_3_cZ.INIT=16'h8000;
// @17:144
  LUT4 un5_rnd_sat_out_r_3_cZ (
	.I0(pre_out_r[20]),
	.I1(pre_out_r[21]),
	.I2(pre_out_r[22]),
	.I3(pre_out_r[19]),
	.O(un5_rnd_sat_out_r_3)
);
defparam un5_rnd_sat_out_r_3_cZ.INIT=16'h8000;
// @17:172
  LUT3 un1_pos_out_r (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.O(un1_pos_out_r_2)
);
defparam un1_pos_out_r.INIT=8'h04;
// @17:177
  LUT3 un1_pos_out_i (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.O(un1_pos_out_i_2)
);
defparam un1_pos_out_i.INIT=8'h08;
// @17:172
  LUT6_L \pos_out_r_iv[11]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_6),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un2_rnd_out_r_s_12_1),
	.LO(pos_out_r[11])
);
defparam \pos_out_r_iv[11] .INIT=64'hDBD0DBD00000D0D0;
// @17:177
  LUT6_L \pos_out_i_iv[11]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_5),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un1_rnd_out_i_s_12_1),
	.LO(pos_out_i[11])
);
defparam \pos_out_i_iv[11] .INIT=64'hE7E0E7E00000E0E0;
// @17:183
  LUT6_L \out_i_RNO[10]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_5),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un1_rnd_out_i[10]),
	.LO(pos_out_i_iv_i[10])
);
defparam \out_i_RNO[10] .INIT=64'hFFFF1F1F181F181F;
// @17:183
  LUT6_L \out_i_RNO[9]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_5),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un1_rnd_out_i[9]),
	.LO(pos_out_i_iv_i[9])
);
defparam \out_i_RNO[9] .INIT=64'hFFFF1F1F181F181F;
// @17:183
  LUT6_L \out_i_RNO[8]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_5),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un1_rnd_out_i[8]),
	.LO(pos_out_i_iv_i[8])
);
defparam \out_i_RNO[8] .INIT=64'hFFFF1F1F181F181F;
// @17:183
  LUT6_L \out_i_RNO[7]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_5),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un1_rnd_out_i[7]),
	.LO(pos_out_i_iv_i[7])
);
defparam \out_i_RNO[7] .INIT=64'hFFFF1F1F181F181F;
// @17:183
  LUT6_L \out_i_RNO[6]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_5),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un1_rnd_out_i[6]),
	.LO(pos_out_i_iv_i[6])
);
defparam \out_i_RNO[6] .INIT=64'hFFFF1F1F181F181F;
// @17:183
  LUT6_L \out_i_RNO[5]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_5),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un1_rnd_out_i[5]),
	.LO(pos_out_i_iv_i[5])
);
defparam \out_i_RNO[5] .INIT=64'hFFFF1F1F181F181F;
// @17:183
  LUT6_L \out_i_RNO[4]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_5),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un1_rnd_out_i[4]),
	.LO(pos_out_i_iv_i[4])
);
defparam \out_i_RNO[4] .INIT=64'hFFFF1F1F181F181F;
// @17:183
  LUT6_L \out_i_RNO[3]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_5),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un1_rnd_out_i[3]),
	.LO(pos_out_i_iv_i[3])
);
defparam \out_i_RNO[3] .INIT=64'hFFFF1F1F181F181F;
// @17:183
  LUT6_L \out_i_RNO[2]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_5),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un1_rnd_out_i[2]),
	.LO(pos_out_i_iv_i[2])
);
defparam \out_i_RNO[2] .INIT=64'hFFFF1F1F181F181F;
// @17:183
  LUT6_L \out_i_RNO[1]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(PATTERNDETECT_5),
	.I4(un4_rnd_sat_out_i_3),
	.I5(un1_rnd_out_i[1]),
	.LO(pos_out_i_iv_i[1])
);
defparam \out_i_RNO[1] .INIT=64'hFFFF1F1F181F181F;
// @17:183
  LUT6_L \out_i_RNO[0]  (
	.I0(mult3_out[23]),
	.I1(mult4_out[23]),
	.I2(pre_out_i[23]),
	.I3(un1_rnd_out_i[0]),
	.I4(PATTERNDETECT_5),
	.I5(un4_rnd_sat_out_i_3),
	.LO(pos_out_i_iv_i[0])
);
defparam \out_i_RNO[0] .INIT=64'hFF18FF1F1F181F1F;
// @17:183
  LUT6_L \out_r_RNO[10]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_6),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un2_rnd_out_r[10]),
	.LO(pos_out_r_iv_i[10])
);
defparam \out_r_RNO[10] .INIT=64'hFFFF2F2F242F242F;
// @17:183
  LUT6_L \out_r_RNO[9]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_6),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un2_rnd_out_r[9]),
	.LO(pos_out_r_iv_i[9])
);
defparam \out_r_RNO[9] .INIT=64'hFFFF2F2F242F242F;
// @17:183
  LUT6_L \out_r_RNO[8]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_6),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un2_rnd_out_r[8]),
	.LO(pos_out_r_iv_i[8])
);
defparam \out_r_RNO[8] .INIT=64'hFFFF2F2F242F242F;
// @17:183
  LUT6_L \out_r_RNO[7]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_6),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un2_rnd_out_r[7]),
	.LO(pos_out_r_iv_i[7])
);
defparam \out_r_RNO[7] .INIT=64'hFFFF2F2F242F242F;
// @17:183
  LUT6_L \out_r_RNO[6]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_6),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un2_rnd_out_r[6]),
	.LO(pos_out_r_iv_i[6])
);
defparam \out_r_RNO[6] .INIT=64'hFFFF2F2F242F242F;
// @17:183
  LUT6_L \out_r_RNO[5]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_6),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un2_rnd_out_r[5]),
	.LO(pos_out_r_iv_i[5])
);
defparam \out_r_RNO[5] .INIT=64'hFFFF2F2F242F242F;
// @17:183
  LUT6_L \out_r_RNO[4]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_6),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un2_rnd_out_r[4]),
	.LO(pos_out_r_iv_i[4])
);
defparam \out_r_RNO[4] .INIT=64'hFFFF2F2F242F242F;
// @17:183
  LUT6_L \out_r_RNO[3]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_6),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un2_rnd_out_r[3]),
	.LO(pos_out_r_iv_i[3])
);
defparam \out_r_RNO[3] .INIT=64'hFFFF2F2F242F242F;
// @17:183
  LUT6_L \out_r_RNO[2]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_6),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un2_rnd_out_r[2]),
	.LO(pos_out_r_iv_i[2])
);
defparam \out_r_RNO[2] .INIT=64'hFFFF2F2F242F242F;
// @17:183
  LUT6_L \out_r_RNO[1]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(PATTERNDETECT_6),
	.I4(un5_rnd_sat_out_r_3),
	.I5(un2_rnd_out_r[1]),
	.LO(pos_out_r_iv_i[1])
);
defparam \out_r_RNO[1] .INIT=64'hFFFF2F2F242F242F;
// @17:183
  LUT6_L \out_r_RNO[0]  (
	.I0(mult2_out[23]),
	.I1(mult1_out[23]),
	.I2(pre_out_r[23]),
	.I3(un2_rnd_out_r[0]),
	.I4(PATTERNDETECT_6),
	.I5(un5_rnd_sat_out_r_3),
	.LO(pos_out_r_iv_i[0])
);
defparam \out_r_RNO[0] .INIT=64'hFF24FF2F2F242F2F;
// @17:154
  XORCY un1_rnd_out_i_s_12 (
	.LI(un1_rnd_out_i_axb_12),
	.CI(un1_rnd_out_i_cry_11),
	.O(un1_rnd_out_i_s_12_1)
);
// @17:154
  XORCY un1_rnd_out_i_s_11 (
	.LI(un1_rnd_out_i_axb_11),
	.CI(un1_rnd_out_i_cry_10),
	.O(un1_rnd_out_i[10])
);
// @17:154
  MUXCY_L un1_rnd_out_i_cry_11_cZ (
	.DI(GND),
	.CI(un1_rnd_out_i_cry_10),
	.S(un1_rnd_out_i_axb_11),
	.LO(un1_rnd_out_i_cry_11)
);
// @17:154
  XORCY un1_rnd_out_i_s_10 (
	.LI(un1_rnd_out_i_axb_10),
	.CI(un1_rnd_out_i_cry_9),
	.O(un1_rnd_out_i[9])
);
// @17:154
  MUXCY_L un1_rnd_out_i_cry_10_cZ (
	.DI(GND),
	.CI(un1_rnd_out_i_cry_9),
	.S(un1_rnd_out_i_axb_10),
	.LO(un1_rnd_out_i_cry_10)
);
// @17:154
  XORCY un1_rnd_out_i_s_9 (
	.LI(un1_rnd_out_i_axb_9),
	.CI(un1_rnd_out_i_cry_8),
	.O(un1_rnd_out_i[8])
);
// @17:154
  MUXCY_L un1_rnd_out_i_cry_9_cZ (
	.DI(GND),
	.CI(un1_rnd_out_i_cry_8),
	.S(un1_rnd_out_i_axb_9),
	.LO(un1_rnd_out_i_cry_9)
);
// @17:154
  XORCY un1_rnd_out_i_s_8 (
	.LI(un1_rnd_out_i_axb_8),
	.CI(un1_rnd_out_i_cry_7),
	.O(un1_rnd_out_i[7])
);
// @17:154
  MUXCY_L un1_rnd_out_i_cry_8_cZ (
	.DI(GND),
	.CI(un1_rnd_out_i_cry_7),
	.S(un1_rnd_out_i_axb_8),
	.LO(un1_rnd_out_i_cry_8)
);
// @17:154
  XORCY un1_rnd_out_i_s_7 (
	.LI(un1_rnd_out_i_axb_7),
	.CI(un1_rnd_out_i_cry_6),
	.O(un1_rnd_out_i[6])
);
// @17:154
  MUXCY_L un1_rnd_out_i_cry_7_cZ (
	.DI(GND),
	.CI(un1_rnd_out_i_cry_6),
	.S(un1_rnd_out_i_axb_7),
	.LO(un1_rnd_out_i_cry_7)
);
// @17:154
  XORCY un1_rnd_out_i_s_6 (
	.LI(un1_rnd_out_i_axb_6),
	.CI(un1_rnd_out_i_cry_5),
	.O(un1_rnd_out_i[5])
);
// @17:154
  MUXCY_L un1_rnd_out_i_cry_6_cZ (
	.DI(GND),
	.CI(un1_rnd_out_i_cry_5),
	.S(un1_rnd_out_i_axb_6),
	.LO(un1_rnd_out_i_cry_6)
);
// @17:154
  XORCY un1_rnd_out_i_s_5 (
	.LI(un1_rnd_out_i_axb_5),
	.CI(un1_rnd_out_i_cry_4),
	.O(un1_rnd_out_i[4])
);
// @17:154
  MUXCY_L un1_rnd_out_i_cry_5_cZ (
	.DI(GND),
	.CI(un1_rnd_out_i_cry_4),
	.S(un1_rnd_out_i_axb_5),
	.LO(un1_rnd_out_i_cry_5)
);
// @17:154
  XORCY un1_rnd_out_i_s_4 (
	.LI(un1_rnd_out_i_axb_4),
	.CI(un1_rnd_out_i_cry_3),
	.O(un1_rnd_out_i[3])
);
// @17:154
  MUXCY_L un1_rnd_out_i_cry_4_cZ (
	.DI(GND),
	.CI(un1_rnd_out_i_cry_3),
	.S(un1_rnd_out_i_axb_4),
	.LO(un1_rnd_out_i_cry_4)
);
// @17:154
  XORCY un1_rnd_out_i_s_3 (
	.LI(un1_rnd_out_i_axb_3),
	.CI(un1_rnd_out_i_cry_2),
	.O(un1_rnd_out_i[2])
);
// @17:154
  MUXCY_L un1_rnd_out_i_cry_3_cZ (
	.DI(GND),
	.CI(un1_rnd_out_i_cry_2),
	.S(un1_rnd_out_i_axb_3),
	.LO(un1_rnd_out_i_cry_3)
);
// @17:154
  XORCY un1_rnd_out_i_s_2 (
	.LI(un1_rnd_out_i_axb_2),
	.CI(un1_rnd_out_i_cry_1),
	.O(un1_rnd_out_i[1])
);
// @17:154
  MUXCY_L un1_rnd_out_i_cry_2_cZ (
	.DI(GND),
	.CI(un1_rnd_out_i_cry_1),
	.S(un1_rnd_out_i_axb_2),
	.LO(un1_rnd_out_i_cry_2)
);
// @17:154
  XORCY un1_rnd_out_i_s_1 (
	.LI(un1_rnd_out_i_axb_1),
	.CI(pre_out_i[7]),
	.O(un1_rnd_out_i[0])
);
// @17:154
  MUXCY_L un1_rnd_out_i_cry_1_cZ (
	.DI(GND),
	.CI(pre_out_i[7]),
	.S(un1_rnd_out_i_axb_1),
	.LO(un1_rnd_out_i_cry_1)
);
// @17:140
  XORCY un2_rnd_out_r_s_12 (
	.LI(un2_rnd_out_r_axb_12),
	.CI(un2_rnd_out_r_cry_11),
	.O(un2_rnd_out_r_s_12_1)
);
// @17:140
  XORCY un2_rnd_out_r_s_11 (
	.LI(un2_rnd_out_r_axb_11),
	.CI(un2_rnd_out_r_cry_10),
	.O(un2_rnd_out_r[10])
);
// @17:140
  MUXCY_L un2_rnd_out_r_cry_11_cZ (
	.DI(GND),
	.CI(un2_rnd_out_r_cry_10),
	.S(un2_rnd_out_r_axb_11),
	.LO(un2_rnd_out_r_cry_11)
);
// @17:140
  XORCY un2_rnd_out_r_s_10 (
	.LI(un2_rnd_out_r_axb_10),
	.CI(un2_rnd_out_r_cry_9),
	.O(un2_rnd_out_r[9])
);
// @17:140
  MUXCY_L un2_rnd_out_r_cry_10_cZ (
	.DI(GND),
	.CI(un2_rnd_out_r_cry_9),
	.S(un2_rnd_out_r_axb_10),
	.LO(un2_rnd_out_r_cry_10)
);
// @17:140
  XORCY un2_rnd_out_r_s_9 (
	.LI(un2_rnd_out_r_axb_9),
	.CI(un2_rnd_out_r_cry_8),
	.O(un2_rnd_out_r[8])
);
// @17:140
  MUXCY_L un2_rnd_out_r_cry_9_cZ (
	.DI(GND),
	.CI(un2_rnd_out_r_cry_8),
	.S(un2_rnd_out_r_axb_9),
	.LO(un2_rnd_out_r_cry_9)
);
// @17:140
  XORCY un2_rnd_out_r_s_8 (
	.LI(un2_rnd_out_r_axb_8),
	.CI(un2_rnd_out_r_cry_7),
	.O(un2_rnd_out_r[7])
);
// @17:140
  MUXCY_L un2_rnd_out_r_cry_8_cZ (
	.DI(GND),
	.CI(un2_rnd_out_r_cry_7),
	.S(un2_rnd_out_r_axb_8),
	.LO(un2_rnd_out_r_cry_8)
);
// @17:140
  XORCY un2_rnd_out_r_s_7 (
	.LI(un2_rnd_out_r_axb_7),
	.CI(un2_rnd_out_r_cry_6),
	.O(un2_rnd_out_r[6])
);
// @17:140
  MUXCY_L un2_rnd_out_r_cry_7_cZ (
	.DI(GND),
	.CI(un2_rnd_out_r_cry_6),
	.S(un2_rnd_out_r_axb_7),
	.LO(un2_rnd_out_r_cry_7)
);
// @17:140
  XORCY un2_rnd_out_r_s_6 (
	.LI(un2_rnd_out_r_axb_6),
	.CI(un2_rnd_out_r_cry_5),
	.O(un2_rnd_out_r[5])
);
// @17:140
  MUXCY_L un2_rnd_out_r_cry_6_cZ (
	.DI(GND),
	.CI(un2_rnd_out_r_cry_5),
	.S(un2_rnd_out_r_axb_6),
	.LO(un2_rnd_out_r_cry_6)
);
// @17:140
  XORCY un2_rnd_out_r_s_5 (
	.LI(un2_rnd_out_r_axb_5),
	.CI(un2_rnd_out_r_cry_4),
	.O(un2_rnd_out_r[4])
);
// @17:140
  MUXCY_L un2_rnd_out_r_cry_5_cZ (
	.DI(GND),
	.CI(un2_rnd_out_r_cry_4),
	.S(un2_rnd_out_r_axb_5),
	.LO(un2_rnd_out_r_cry_5)
);
// @17:140
  XORCY un2_rnd_out_r_s_4 (
	.LI(un2_rnd_out_r_axb_4),
	.CI(un2_rnd_out_r_cry_3),
	.O(un2_rnd_out_r[3])
);
// @17:140
  MUXCY_L un2_rnd_out_r_cry_4_cZ (
	.DI(GND),
	.CI(un2_rnd_out_r_cry_3),
	.S(un2_rnd_out_r_axb_4),
	.LO(un2_rnd_out_r_cry_4)
);
// @17:140
  XORCY un2_rnd_out_r_s_3 (
	.LI(un2_rnd_out_r_axb_3),
	.CI(un2_rnd_out_r_cry_2),
	.O(un2_rnd_out_r[2])
);
// @17:140
  MUXCY_L un2_rnd_out_r_cry_3_cZ (
	.DI(GND),
	.CI(un2_rnd_out_r_cry_2),
	.S(un2_rnd_out_r_axb_3),
	.LO(un2_rnd_out_r_cry_3)
);
// @17:140
  XORCY un2_rnd_out_r_s_2 (
	.LI(un2_rnd_out_r_axb_2),
	.CI(un2_rnd_out_r_cry_1),
	.O(un2_rnd_out_r[1])
);
// @17:140
  MUXCY_L un2_rnd_out_r_cry_2_cZ (
	.DI(GND),
	.CI(un2_rnd_out_r_cry_1),
	.S(un2_rnd_out_r_axb_2),
	.LO(un2_rnd_out_r_cry_2)
);
// @17:140
  XORCY un2_rnd_out_r_s_1 (
	.LI(un2_rnd_out_r_axb_1),
	.CI(pre_out_r[7]),
	.O(un2_rnd_out_r[0])
);
// @17:140
  MUXCY_L un2_rnd_out_r_cry_1_cZ (
	.DI(GND),
	.CI(pre_out_r[7]),
	.S(un2_rnd_out_r_axb_1),
	.LO(un2_rnd_out_r_cry_1)
);
// @17:183
  FDS \out_i_Z[11]  (
	.Q(out_i_vec_mult_3[11]),
	.D(pos_out_i[11]),
	.C(clk),
	.S(un1_pos_out_i_2)
);
// @17:183
  FDR \out_i_Z[10]  (
	.Q(out_i_vec_mult_3[10]),
	.D(pos_out_i_iv_i[10]),
	.C(clk),
	.R(un1_pos_out_i_2)
);
// @17:183
  FDR \out_i_Z[9]  (
	.Q(out_i_vec_mult_3[9]),
	.D(pos_out_i_iv_i[9]),
	.C(clk),
	.R(un1_pos_out_i_2)
);
// @17:183
  FDR \out_i_Z[8]  (
	.Q(out_i_vec_mult_3[8]),
	.D(pos_out_i_iv_i[8]),
	.C(clk),
	.R(un1_pos_out_i_2)
);
// @17:183
  FDR \out_i_Z[7]  (
	.Q(out_i_vec_mult_3[7]),
	.D(pos_out_i_iv_i[7]),
	.C(clk),
	.R(un1_pos_out_i_2)
);
// @17:183
  FDR \out_i_Z[6]  (
	.Q(out_i_vec_mult_3[6]),
	.D(pos_out_i_iv_i[6]),
	.C(clk),
	.R(un1_pos_out_i_2)
);
// @17:183
  FDR \out_i_Z[5]  (
	.Q(out_i_vec_mult_3[5]),
	.D(pos_out_i_iv_i[5]),
	.C(clk),
	.R(un1_pos_out_i_2)
);
// @17:183
  FDR \out_i_Z[4]  (
	.Q(out_i_vec_mult_3[4]),
	.D(pos_out_i_iv_i[4]),
	.C(clk),
	.R(un1_pos_out_i_2)
);
// @17:183
  FDR \out_i_Z[3]  (
	.Q(out_i_vec_mult_3[3]),
	.D(pos_out_i_iv_i[3]),
	.C(clk),
	.R(un1_pos_out_i_2)
);
// @17:183
  FDR \out_i_Z[2]  (
	.Q(out_i_vec_mult_3[2]),
	.D(pos_out_i_iv_i[2]),
	.C(clk),
	.R(un1_pos_out_i_2)
);
// @17:183
  FDR \out_i_Z[1]  (
	.Q(out_i_vec_mult_3[1]),
	.D(pos_out_i_iv_i[1]),
	.C(clk),
	.R(un1_pos_out_i_2)
);
// @17:183
  FDR \out_i_Z[0]  (
	.Q(out_i_vec_mult_3[0]),
	.D(pos_out_i_iv_i[0]),
	.C(clk),
	.R(un1_pos_out_i_2)
);
// @17:183
  FDS \out_r_Z[11]  (
	.Q(out_r_vec_mult_3[11]),
	.D(pos_out_r[11]),
	.C(clk),
	.S(un1_pos_out_r_2)
);
// @17:183
  FDR \out_r_Z[10]  (
	.Q(out_r_vec_mult_3[10]),
	.D(pos_out_r_iv_i[10]),
	.C(clk),
	.R(un1_pos_out_r_2)
);
// @17:183
  FDR \out_r_Z[9]  (
	.Q(out_r_vec_mult_3[9]),
	.D(pos_out_r_iv_i[9]),
	.C(clk),
	.R(un1_pos_out_r_2)
);
// @17:183
  FDR \out_r_Z[8]  (
	.Q(out_r_vec_mult_3[8]),
	.D(pos_out_r_iv_i[8]),
	.C(clk),
	.R(un1_pos_out_r_2)
);
// @17:183
  FDR \out_r_Z[7]  (
	.Q(out_r_vec_mult_3[7]),
	.D(pos_out_r_iv_i[7]),
	.C(clk),
	.R(un1_pos_out_r_2)
);
// @17:183
  FDR \out_r_Z[6]  (
	.Q(out_r_vec_mult_3[6]),
	.D(pos_out_r_iv_i[6]),
	.C(clk),
	.R(un1_pos_out_r_2)
);
// @17:183
  FDR \out_r_Z[5]  (
	.Q(out_r_vec_mult_3[5]),
	.D(pos_out_r_iv_i[5]),
	.C(clk),
	.R(un1_pos_out_r_2)
);
// @17:183
  FDR \out_r_Z[4]  (
	.Q(out_r_vec_mult_3[4]),
	.D(pos_out_r_iv_i[4]),
	.C(clk),
	.R(un1_pos_out_r_2)
);
// @17:183
  FDR \out_r_Z[3]  (
	.Q(out_r_vec_mult_3[3]),
	.D(pos_out_r_iv_i[3]),
	.C(clk),
	.R(un1_pos_out_r_2)
);
// @17:183
  FDR \out_r_Z[2]  (
	.Q(out_r_vec_mult_3[2]),
	.D(pos_out_r_iv_i[2]),
	.C(clk),
	.R(un1_pos_out_r_2)
);
// @17:183
  FDR \out_r_Z[1]  (
	.Q(out_r_vec_mult_3[1]),
	.D(pos_out_r_iv_i[1]),
	.C(clk),
	.R(un1_pos_out_r_2)
);
// @17:183
  FDR \out_r_Z[0]  (
	.Q(out_r_vec_mult_3[0]),
	.D(pos_out_r_iv_i[0]),
	.C(clk),
	.R(un1_pos_out_r_2)
);
// @17:80
  mult_pipe_16 mult1 (
	.mult1_out_23(mult1_out[23]),
	.mult1_out_0(mult1_out_0[23:0]),
	.P_uc_28_0(P_uc_28_0[47:24]),
	.out_inner_prod_r(out_inner_prod_r[11:0]),
	.vec_out_r_AQ_3(vec_out_r_AQ_3[11:0]),
	.out_inv_sqrt_0(out_inv_sqrt_0),
	.out_inv_sqrt_1(out_inv_sqrt_1),
	.out_inv_sqrt_2(out_inv_sqrt_2),
	.out_inv_sqrt_7(out_inv_sqrt_7),
	.out_inv_sqrt_8(out_inv_sqrt_8),
	.out_inv_sqrt_9(out_inv_sqrt_9),
	.out_inv_sqrt_10(out_inv_sqrt_10),
	.out_inv_sqrt_11(out_inv_sqrt_11),
	.in_b_vec_mult_sel(in_b_vec_mult_sel[0]),
	.clk(clk),
	.N_425_i(N_425_i),
	.N_428_i(N_428_i),
	.N_431_i(N_431_i),
	.N_434_i(N_434_i)
);
// @17:88
  mult_pipe_17 mult2 (
	.mult2_out_23(mult2_out[23]),
	.vec_out_i_AQ_3(vec_out_i_AQ_3[11:0]),
	.out_inner_prod_i(out_inner_prod_i[11:0]),
	.in_b_vec_mult_sel(in_b_vec_mult_sel[0]),
	.clk(clk)
);
// @17:96
  mult_pipe_18 mult3 (
	.mult3_out_23(mult3_out[23]),
	.vec_out_r_AQ_3(vec_out_r_AQ_3[11:0]),
	.out_inner_prod_i(out_inner_prod_i[11:0]),
	.in_b_vec_mult_sel(in_b_vec_mult_sel[0]),
	.clk(clk)
);
// @17:104
  mult_pipe_19 mult4 (
	.mult4_out_23(mult4_out[23]),
	.mult4_out_0(mult4_out_0[23:0]),
	.P_uc_31_0(P_uc_31_0[47:24]),
	.out_inner_prod_r(out_inner_prod_r[11:0]),
	.vec_out_i_AQ_3(vec_out_i_AQ_3[11:0]),
	.out_inv_sqrt_0(out_inv_sqrt_0),
	.out_inv_sqrt_1(out_inv_sqrt_1),
	.out_inv_sqrt_2(out_inv_sqrt_2),
	.out_inv_sqrt_7(out_inv_sqrt_7),
	.out_inv_sqrt_8(out_inv_sqrt_8),
	.out_inv_sqrt_9(out_inv_sqrt_9),
	.out_inv_sqrt_10(out_inv_sqrt_10),
	.out_inv_sqrt_11(out_inv_sqrt_11),
	.in_b_vec_mult_sel(in_b_vec_mult_sel[0]),
	.clk(clk),
	.N_425_i(N_425_i),
	.N_428_i(N_428_i),
	.N_431_i(N_431_i),
	.N_434_i(N_434_i)
);
// @17:112
  add_subZ2_4 sub (
	.pre_out_r(pre_out_r[23:7]),
	.vec_out_i_AQ_3(vec_out_i_AQ_3[11:0]),
	.in_b_i_reg(in_b_i_reg[11:0]),
	.mult1_out_0(mult1_out_0[23:0]),
	.P_uc_28_0(P_uc_28_0[47:24]),
	.PATTERNDETECT_6(PATTERNDETECT_6),
	.clk(clk)
);
// @17:122
  add_subZ1_4 add (
	.pre_out_i(pre_out_i[23:7]),
	.vec_out_r_AQ_3(vec_out_r_AQ_3[11:0]),
	.in_b_i_reg(in_b_i_reg[11:0]),
	.mult4_out_0(mult4_out_0[23:0]),
	.P_uc_31_0(P_uc_31_0[47:24]),
	.PATTERNDETECT_5(PATTERNDETECT_5),
	.clk(clk)
);
  GND GND_cZ (
	.G(GND)
);
  VCC VCC_cZ (
	.P(VCC)
);
endmodule