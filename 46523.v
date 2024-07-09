module qr_decomp_ctl_mux (
  single_in_R_sel,
  single_in_R_sel_0,
  w_col_sel_AQ_int,
  col_sel_AQ,
  wr_en_AQ_sel,
  w_col_sel_AQ_mux_i_m3_lut6_2_O6,
  w_col_sel_AQ_mux_i_m3_lut6_2_O5,
  col_sel_AQ2_int,
  col_sel_AQ2_mux_i_m3_lut6_2_O6,
  col_sel_AQ2_mux_i_m3_lut6_2_O5,
  state_0,
  state_2,
  state_5,
  wr_en_AQ_sel_0,
  col_sel_R,
  col_sel_R_int,
  col_sel_R_mux_i_m3_lut6_2_O6,
  col_sel_R_mux_i_m3_lut6_2_O5,
  in_a_r_reg_0_0,
  in_a_r_reg_0_11,
  out_r_vec_sub_0,
  in_a_i_reg_1,
  vec_in_AQ_sel,
  in_a_r_reg_3,
  in_a_i_reg_0,
  in_a_i_reg_3,
  in_a_r_reg_1,
  pre_out_4,
  pre_out_0,
  in_a_r_reg_2,
  pre_out_5,
  pre_out_1,
  in_a_i_reg_2,
  pre_out_6,
  pre_out_3_9,
  pre_out_3_1,
  pre_out_3_7,
  pre_out_3_3,
  pre_out_3_8,
  pre_out_3_5,
  pre_out_3_6,
  pre_out_3_0,
  pre_out_2,
  out_inner_prod_i,
  pre_out_10,
  pre_out_9,
  pre_out_0_d0,
  pre_out_1_d0,
  pre_out_3_d0,
  pre_out_6_d0,
  pre_out_7,
  pre_out_8,
  pre_out_5_d0,
  pre_out_4_d0,
  pre_out_2_d0,
  pre_out_18,
  pre_out_19,
  pre_out_20,
  pre_out_21,
  pre_out_reg,
  out_r_vec_mult_2,
  vec_in_r_AQ_mux_2,
  out_r_vec_mult_1,
  vec_in_r_AQ_mux_1,
  pre_out_i_m,
  out_i_vec_mult_3,
  pre_out_i_m_1,
  vec_in_i_AQ_mux_3,
  output_iv,
  out_i_vec_mult_0,
  vec_in_i_AQ_mux_0_11,
  vec_in_i_AQ_mux_0_1,
  vec_in_i_AQ_mux_0_5,
  vec_in_i_AQ_mux_0_0,
  vec_in_i_AQ_mux_0_8,
  vec_in_i_AQ_mux_0_10,
  vec_in_i_AQ_mux_0_7,
  vec_in_i_AQ_mux_0_6,
  vec_in_i_AQ_mux_0_9,
  vec_in_i_AQ_mux_0_4,
  out_r_vec_mult_0,
  output_iv_0_2,
  output_iv_0_4,
  output_iv_0_1,
  output_iv_0_0,
  output_iv_0_9,
  output_iv_0_6,
  output_iv_0_8,
  output_iv_0_3,
  output_iv_0_7,
  vec_in_r_AQ_mux_0_10,
  vec_in_r_AQ_mux_0_2,
  vec_in_r_AQ_mux_0_4,
  vec_in_r_AQ_mux_0_3,
  vec_in_r_AQ_mux_0_6,
  vec_in_r_AQ_mux_0_1,
  vec_in_r_AQ_mux_0_9,
  vec_in_r_AQ_mux_0_8,
  vec_in_r_AQ_mux_0_0,
  vec_in_r_AQ_mux_0_7,
  pre_out_i_m_0_0,
  pre_out_i_m_0_6,
  pre_out_i_m_0_4,
  pre_out_i_m_0_1,
  in_A_r,
  out_r_vec_mult_3,
  pre_out_i_m_2,
  vec_in_r_AQ_mux_3,
  out_i_vec_mult_2,
  pre_out_i_m_3,
  vec_in_i_AQ_mux_2,
  in_A_i,
  out_i_vec_mult_1,
  pre_out_i_m_4,
  vec_in_i_AQ_mux_1,
  un8_rnd_out_P,
  single_in_r_R_mux,
  out_inner_prod_r,
  un8_rnd_out,
  N_390_i,
  N_393_i,
  done_inv_sqrt,
  N_391_i,
  N_394_i,
  N_396_i,
  N_395_i,
  N_397_i,
  N_398_i,
  N_400_i,
  N_399_i,
  N_401_i,
  wr_en_AQ_int,
  wr_A_QR,
  start_QR,
  wr_en_AQ_mux_i_m3_lut6_2_O6,
  N_501,
  N_392_i,
  PATTERNDETECT_32,
  N_500,
  N_508,
  N_507,
  N_506,
  N_505,
  un5_output,
  un5_output_0,
  un5_output_1,
  un5_output_2,
  un5_output_3,
  un5_output_4,
  N_389_i,
  N_388_i,
  N_387_i,
  N_386_i,
  N_385_i,
  N_384_i,
  N_383_i,
  N_34_i,
  N_32_i,
  N_30_i,
  N_28_i
)
;
input [0:0] single_in_R_sel ;
output [0:0] single_in_R_sel_0 ;
input [1:0] w_col_sel_AQ_int ;
input [1:0] col_sel_AQ ;
input [0:0] wr_en_AQ_sel ;
output [0:0] w_col_sel_AQ_mux_i_m3_lut6_2_O6 ;
output [0:0] w_col_sel_AQ_mux_i_m3_lut6_2_O5 ;
input [1:0] col_sel_AQ2_int ;
output [0:0] col_sel_AQ2_mux_i_m3_lut6_2_O6 ;
output [0:0] col_sel_AQ2_mux_i_m3_lut6_2_O5 ;
input state_0 ;
input state_2 ;
input state_5 ;
output [0:0] wr_en_AQ_sel_0 ;
input [1:0] col_sel_R ;
input [1:0] col_sel_R_int ;
output [0:0] col_sel_R_mux_i_m3_lut6_2_O6 ;
output [0:0] col_sel_R_mux_i_m3_lut6_2_O5 ;
input in_a_r_reg_0_0 ;
input in_a_r_reg_0_11 ;
output [11:11] out_r_vec_sub_0 ;
input [11:11] in_a_i_reg_1 ;
input [1:0] vec_in_AQ_sel ;
input [11:11] in_a_r_reg_3 ;
input [11:11] in_a_i_reg_0 ;
input [11:11] in_a_i_reg_3 ;
input [11:11] in_a_r_reg_1 ;
input [11:11] pre_out_4 ;
input [11:1] pre_out_0 ;
input [11:11] in_a_r_reg_2 ;
input [11:11] pre_out_5 ;
input [11:1] pre_out_1 ;
input [11:11] in_a_i_reg_2 ;
input [11:11] pre_out_6 ;
input pre_out_3_9 ;
input pre_out_3_1 ;
input pre_out_3_7 ;
input pre_out_3_3 ;
input pre_out_3_8 ;
input pre_out_3_5 ;
input pre_out_3_6 ;
input pre_out_3_0 ;
input [11:1] pre_out_2 ;
input [11:0] out_inner_prod_i ;
input pre_out_10 ;
input pre_out_9 ;
input pre_out_0_d0 ;
input pre_out_1_d0 ;
input pre_out_3_d0 ;
input pre_out_6_d0 ;
input pre_out_7 ;
input pre_out_8 ;
input pre_out_5_d0 ;
input pre_out_4_d0 ;
input pre_out_2_d0 ;
input pre_out_18 ;
input pre_out_19 ;
input pre_out_20 ;
input pre_out_21 ;
input [23:23] pre_out_reg ;
input [11:0] out_r_vec_mult_2 ;
output [11:0] vec_in_r_AQ_mux_2 ;
input [11:0] out_r_vec_mult_1 ;
output [11:0] vec_in_r_AQ_mux_1 ;
input [10:0] pre_out_i_m ;
input [11:0] out_i_vec_mult_3 ;
input [0:0] pre_out_i_m_1 ;
output [11:0] vec_in_i_AQ_mux_3 ;
input [10:0] output_iv ;
input [11:0] out_i_vec_mult_0 ;
output vec_in_i_AQ_mux_0_11 ;
output vec_in_i_AQ_mux_0_1 ;
output vec_in_i_AQ_mux_0_5 ;
output vec_in_i_AQ_mux_0_0 ;
output vec_in_i_AQ_mux_0_8 ;
output vec_in_i_AQ_mux_0_10 ;
output vec_in_i_AQ_mux_0_7 ;
output vec_in_i_AQ_mux_0_6 ;
output vec_in_i_AQ_mux_0_9 ;
output vec_in_i_AQ_mux_0_4 ;
input [11:0] out_r_vec_mult_0 ;
input output_iv_0_2 ;
input output_iv_0_4 ;
input output_iv_0_1 ;
input output_iv_0_0 ;
input output_iv_0_9 ;
input output_iv_0_6 ;
input output_iv_0_8 ;
input output_iv_0_3 ;
input output_iv_0_7 ;
output vec_in_r_AQ_mux_0_10 ;
output vec_in_r_AQ_mux_0_2 ;
output vec_in_r_AQ_mux_0_4 ;
output vec_in_r_AQ_mux_0_3 ;
output vec_in_r_AQ_mux_0_6 ;
output vec_in_r_AQ_mux_0_1 ;
output vec_in_r_AQ_mux_0_9 ;
output vec_in_r_AQ_mux_0_8 ;
output vec_in_r_AQ_mux_0_0 ;
output vec_in_r_AQ_mux_0_7 ;
input pre_out_i_m_0_0 ;
input pre_out_i_m_0_6 ;
input pre_out_i_m_0_4 ;
input pre_out_i_m_0_1 ;
input [47:0] in_A_r ;
input [11:0] out_r_vec_mult_3 ;
input [0:0] pre_out_i_m_2 ;
output [11:0] vec_in_r_AQ_mux_3 ;
input [11:0] out_i_vec_mult_2 ;
input [0:0] pre_out_i_m_3 ;
output [11:0] vec_in_i_AQ_mux_2 ;
input [47:0] in_A_i ;
input [11:0] out_i_vec_mult_1 ;
input [0:0] pre_out_i_m_4 ;
output [11:0] vec_in_i_AQ_mux_1 ;
input [19:19] un8_rnd_out_P ;
output [11:11] single_in_r_R_mux ;
input [11:0] out_inner_prod_r ;
input [10:0] un8_rnd_out ;
output N_390_i ;
output N_393_i ;
input done_inv_sqrt ;
output N_391_i ;
output N_394_i ;
output N_396_i ;
output N_395_i ;
output N_397_i ;
output N_398_i ;
output N_400_i ;
output N_399_i ;
output N_401_i ;
input wr_en_AQ_int ;
input wr_A_QR ;
input start_QR ;
output wr_en_AQ_mux_i_m3_lut6_2_O6 ;
output N_501 ;
output N_392_i ;
input PATTERNDETECT_32 ;
input N_500 ;
output N_508 ;
output N_507 ;
output N_506 ;
output N_505 ;
input un5_output ;
input un5_output_0 ;
input un5_output_1 ;
input un5_output_2 ;
input un5_output_3 ;
input un5_output_4 ;
output N_389_i ;
output N_388_i ;
output N_387_i ;
output N_386_i ;
output N_385_i ;
output N_384_i ;
output N_383_i ;
output N_34_i ;
output N_32_i ;
output N_30_i ;
output N_28_i ;
wire state_0 ;
wire state_2 ;
wire state_5 ;
wire in_a_r_reg_0_0 ;
wire in_a_r_reg_0_11 ;
wire pre_out_3_9 ;
wire pre_out_3_1 ;
wire pre_out_3_7 ;
wire pre_out_3_3 ;
wire pre_out_3_8 ;
wire pre_out_3_5 ;
wire pre_out_3_6 ;
wire pre_out_3_0 ;
wire pre_out_10 ;
wire pre_out_9 ;
wire pre_out_0_d0 ;
wire pre_out_1_d0 ;
wire pre_out_3_d0 ;
wire pre_out_6_d0 ;
wire pre_out_7 ;
wire pre_out_8 ;
wire pre_out_5_d0 ;
wire pre_out_4_d0 ;
wire pre_out_2_d0 ;
wire pre_out_18 ;
wire pre_out_19 ;
wire pre_out_20 ;
wire pre_out_21 ;
wire vec_in_i_AQ_mux_0_11 ;
wire vec_in_i_AQ_mux_0_1 ;
wire vec_in_i_AQ_mux_0_5 ;
wire vec_in_i_AQ_mux_0_0 ;
wire vec_in_i_AQ_mux_0_8 ;
wire vec_in_i_AQ_mux_0_10 ;
wire vec_in_i_AQ_mux_0_7 ;
wire vec_in_i_AQ_mux_0_6 ;
wire vec_in_i_AQ_mux_0_9 ;
wire vec_in_i_AQ_mux_0_4 ;
wire output_iv_0_2 ;
wire output_iv_0_4 ;
wire output_iv_0_1 ;
wire output_iv_0_0 ;
wire output_iv_0_9 ;
wire output_iv_0_6 ;
wire output_iv_0_8 ;
wire output_iv_0_3 ;
wire output_iv_0_7 ;
wire vec_in_r_AQ_mux_0_10 ;
wire vec_in_r_AQ_mux_0_2 ;
wire vec_in_r_AQ_mux_0_4 ;
wire vec_in_r_AQ_mux_0_3 ;
wire vec_in_r_AQ_mux_0_6 ;
wire vec_in_r_AQ_mux_0_1 ;
wire vec_in_r_AQ_mux_0_9 ;
wire vec_in_r_AQ_mux_0_8 ;
wire vec_in_r_AQ_mux_0_0 ;
wire vec_in_r_AQ_mux_0_7 ;
wire pre_out_i_m_0_0 ;
wire pre_out_i_m_0_6 ;
wire pre_out_i_m_0_4 ;
wire pre_out_i_m_0_1 ;
wire N_390_i ;
wire N_393_i ;
wire done_inv_sqrt ;
wire N_391_i ;
wire N_394_i ;
wire N_396_i ;
wire N_395_i ;
wire N_397_i ;
wire N_398_i ;
wire N_400_i ;
wire N_399_i ;
wire N_401_i ;
wire wr_en_AQ_int ;
wire wr_A_QR ;
wire start_QR ;
wire wr_en_AQ_mux_i_m3_lut6_2_O6 ;
wire N_501 ;
wire N_392_i ;
wire PATTERNDETECT_32 ;
wire N_500 ;
wire N_508 ;
wire N_507 ;
wire N_506 ;
wire N_505 ;
wire un5_output ;
wire un5_output_0 ;
wire un5_output_1 ;
wire un5_output_2 ;
wire un5_output_3 ;
wire un5_output_4 ;
wire N_389_i ;
wire N_388_i ;
wire N_387_i ;
wire N_386_i ;
wire N_385_i ;
wire N_384_i ;
wire N_383_i ;
wire N_34_i ;
wire N_32_i ;
wire N_30_i ;
wire N_28_i ;
wire GND ;
wire VCC ;
wire N_161 ;
wire N_162 ;
wire N_163 ;
wire N_164 ;
wire N_165 ;
wire N_148 ;
wire N_166 ;
wire N_167 ;
wire N_168 ;
wire N_169 ;
wire N_149 ;
wire N_150 ;
wire N_151 ;
wire N_152 ;
wire N_153 ;
wire N_154 ;
wire N_155 ;
wire N_143 ;
wire N_156 ;
wire N_157 ;
wire N_37 ;
wire N_38 ;
wire N_39 ;
wire N_40 ;
wire N_41 ;
wire N_50 ;
wire N_60 ;
wire N_66 ;
wire N_61 ;
wire N_62 ;
wire N_64 ;
wire N_65 ;
wire N_68 ;
wire N_69 ;
wire N_48 ;
wire N_49 ;
wire N_51 ;
wire N_52 ;
wire N_54 ;
wire N_55 ;
wire N_56 ;
wire N_57 ;
wire N_42 ;
wire N_43 ;
wire N_44 ;
wire N_45 ;
wire N_160 ;
wire N_95 ;
wire N_122 ;
// @21:112
  LUT6 \vec_in_i_AQ_mux[13]  (
	.I0(out_i_vec_mult_1[11]),
	.I1(in_a_i_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_169),
	.I4(pre_out_9),
	.I5(pre_out_0[11]),
	.O(vec_in_i_AQ_mux_1[10])
);
defparam \vec_in_i_AQ_mux[13] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[22]  (
	.I0(out_i_vec_mult_1[11]),
	.I1(in_a_i_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_160),
	.I4(pre_out_0_d0),
	.I5(pre_out_0[11]),
	.O(vec_in_i_AQ_mux_1[1])
);
defparam \vec_in_i_AQ_mux[22] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[21]  (
	.I0(out_i_vec_mult_1[11]),
	.I1(in_a_i_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_161),
	.I4(pre_out_1_d0),
	.I5(pre_out_0[11]),
	.O(vec_in_i_AQ_mux_1[2])
);
defparam \vec_in_i_AQ_mux[21] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[19]  (
	.I0(out_i_vec_mult_1[11]),
	.I1(in_a_i_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_163),
	.I4(pre_out_3_d0),
	.I5(pre_out_0[11]),
	.O(vec_in_i_AQ_mux_1[4])
);
defparam \vec_in_i_AQ_mux[19] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[16]  (
	.I0(out_i_vec_mult_1[11]),
	.I1(in_a_i_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_166),
	.I4(pre_out_6_d0),
	.I5(pre_out_0[11]),
	.O(vec_in_i_AQ_mux_1[7])
);
defparam \vec_in_i_AQ_mux[16] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[15]  (
	.I0(out_i_vec_mult_1[11]),
	.I1(in_a_i_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_167),
	.I4(pre_out_7),
	.I5(pre_out_0[11]),
	.O(vec_in_i_AQ_mux_1[8])
);
defparam \vec_in_i_AQ_mux[15] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[14]  (
	.I0(out_i_vec_mult_1[11]),
	.I1(in_a_i_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_168),
	.I4(pre_out_8),
	.I5(pre_out_0[11]),
	.O(vec_in_i_AQ_mux_1[9])
);
defparam \vec_in_i_AQ_mux[14] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[17]  (
	.I0(out_i_vec_mult_1[11]),
	.I1(in_a_i_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_165),
	.I4(pre_out_5_d0),
	.I5(pre_out_0[11]),
	.O(vec_in_i_AQ_mux_1[6])
);
defparam \vec_in_i_AQ_mux[17] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[18]  (
	.I0(out_i_vec_mult_1[11]),
	.I1(in_a_i_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_164),
	.I4(pre_out_4_d0),
	.I5(pre_out_0[11]),
	.O(vec_in_i_AQ_mux_1[5])
);
defparam \vec_in_i_AQ_mux[18] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[20]  (
	.I0(out_i_vec_mult_1[11]),
	.I1(in_a_i_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_162),
	.I4(pre_out_2_d0),
	.I5(pre_out_0[11]),
	.O(vec_in_i_AQ_mux_1[3])
);
defparam \vec_in_i_AQ_mux[20] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[41]  (
	.I0(out_r_vec_mult_3[11]),
	.I1(in_a_r_reg_3[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_41),
	.I4(pre_out_0[6]),
	.I5(pre_out_1[11]),
	.O(vec_in_r_AQ_mux_3[6])
);
defparam \vec_in_r_AQ_mux[41] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[38]  (
	.I0(out_r_vec_mult_3[11]),
	.I1(in_a_r_reg_3[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_44),
	.I4(pre_out_0[9]),
	.I5(pre_out_1[11]),
	.O(vec_in_r_AQ_mux_3[9])
);
defparam \vec_in_r_AQ_mux[38] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[45]  (
	.I0(out_r_vec_mult_3[11]),
	.I1(in_a_r_reg_3[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_37),
	.I4(pre_out_0[2]),
	.I5(pre_out_1[11]),
	.O(vec_in_r_AQ_mux_3[2])
);
defparam \vec_in_r_AQ_mux[45] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[43]  (
	.I0(out_r_vec_mult_3[11]),
	.I1(in_a_r_reg_3[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_39),
	.I4(pre_out_0[4]),
	.I5(pre_out_1[11]),
	.O(vec_in_r_AQ_mux_3[4])
);
defparam \vec_in_r_AQ_mux[43] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[42]  (
	.I0(out_r_vec_mult_3[11]),
	.I1(in_a_r_reg_3[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_40),
	.I4(pre_out_0[5]),
	.I5(pre_out_1[11]),
	.O(vec_in_r_AQ_mux_3[5])
);
defparam \vec_in_r_AQ_mux[42] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[37]  (
	.I0(out_r_vec_mult_3[11]),
	.I1(in_a_r_reg_3[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_45),
	.I4(pre_out_0[10]),
	.I5(pre_out_1[11]),
	.O(vec_in_r_AQ_mux_3[10])
);
defparam \vec_in_r_AQ_mux[37] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[44]  (
	.I0(out_r_vec_mult_3[11]),
	.I1(in_a_r_reg_3[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_38),
	.I4(pre_out_0[3]),
	.I5(pre_out_1[11]),
	.O(vec_in_r_AQ_mux_3[3])
);
defparam \vec_in_r_AQ_mux[44] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[40]  (
	.I0(out_r_vec_mult_3[11]),
	.I1(in_a_r_reg_3[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_42),
	.I4(pre_out_0[7]),
	.I5(pre_out_1[11]),
	.O(vec_in_r_AQ_mux_3[7])
);
defparam \vec_in_r_AQ_mux[40] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[39]  (
	.I0(out_r_vec_mult_3[11]),
	.I1(in_a_r_reg_3[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_43),
	.I4(pre_out_0[8]),
	.I5(pre_out_1[11]),
	.O(vec_in_r_AQ_mux_3[8])
);
defparam \vec_in_r_AQ_mux[39] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[0]  (
	.I0(in_A_i[47]),
	.I1(out_i_vec_mult_0[11]),
	.I2(in_a_i_reg_0[11]),
	.I3(vec_in_AQ_sel[0]),
	.I4(vec_in_AQ_sel[1]),
	.I5(pre_out_2[11]),
	.O(vec_in_i_AQ_mux_0_11)
);
defparam \vec_in_i_AQ_mux[0] .INIT=64'hF3F3CCAA3030CCAA;
// @21:109
  LUT6 \vec_in_r_AQ_mux[0]  (
	.I0(in_A_r[47]),
	.I1(out_r_vec_mult_0[11]),
	.I2(in_a_r_reg_0_11),
	.I3(vec_in_AQ_sel[0]),
	.I4(vec_in_AQ_sel[1]),
	.I5(pre_out_10),
	.O(vec_in_r_AQ_mux_0_10)
);
defparam \vec_in_r_AQ_mux[0] .INIT=64'hF3F3CCAA3030CCAA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[39]  (
	.I0(out_i_vec_mult_3[11]),
	.I1(in_a_i_reg_3[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_143),
	.I4(pre_out_1[8]),
	.I5(pre_out_3_9),
	.O(vec_in_i_AQ_mux_3[8])
);
defparam \vec_in_i_AQ_mux[39] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[20]  (
	.I0(out_r_vec_mult_1[11]),
	.I1(in_a_r_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_62),
	.I4(pre_out_1[3]),
	.I5(pre_out_4[11]),
	.O(vec_in_r_AQ_mux_1[3])
);
defparam \vec_in_r_AQ_mux[20] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[17]  (
	.I0(out_r_vec_mult_1[11]),
	.I1(in_a_r_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_65),
	.I4(pre_out_1[6]),
	.I5(pre_out_4[11]),
	.O(vec_in_r_AQ_mux_1[6])
);
defparam \vec_in_r_AQ_mux[17] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[18]  (
	.I0(out_r_vec_mult_1[11]),
	.I1(in_a_r_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_64),
	.I4(pre_out_1[5]),
	.I5(pre_out_4[11]),
	.O(vec_in_r_AQ_mux_1[5])
);
defparam \vec_in_r_AQ_mux[18] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[13]  (
	.I0(out_r_vec_mult_1[11]),
	.I1(in_a_r_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_69),
	.I4(pre_out_1[10]),
	.I5(pre_out_4[11]),
	.O(vec_in_r_AQ_mux_1[10])
);
defparam \vec_in_r_AQ_mux[13] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[22]  (
	.I0(out_r_vec_mult_1[11]),
	.I1(in_a_r_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_60),
	.I4(pre_out_0[1]),
	.I5(pre_out_4[11]),
	.O(vec_in_r_AQ_mux_1[1])
);
defparam \vec_in_r_AQ_mux[22] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[14]  (
	.I0(out_r_vec_mult_1[11]),
	.I1(in_a_r_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_68),
	.I4(pre_out_1[9]),
	.I5(pre_out_4[11]),
	.O(vec_in_r_AQ_mux_1[9])
);
defparam \vec_in_r_AQ_mux[14] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[21]  (
	.I0(out_r_vec_mult_1[11]),
	.I1(in_a_r_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_61),
	.I4(pre_out_1[2]),
	.I5(pre_out_4[11]),
	.O(vec_in_r_AQ_mux_1[2])
);
defparam \vec_in_r_AQ_mux[21] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[16]  (
	.I0(out_r_vec_mult_1[11]),
	.I1(in_a_r_reg_1[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_66),
	.I4(pre_out_1[7]),
	.I5(pre_out_4[11]),
	.O(vec_in_r_AQ_mux_1[7])
);
defparam \vec_in_r_AQ_mux[16] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[31]  (
	.I0(out_r_vec_mult_2[11]),
	.I1(in_a_r_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_51),
	.I4(pre_out_1[4]),
	.I5(pre_out_5[11]),
	.O(vec_in_r_AQ_mux_2[4])
);
defparam \vec_in_r_AQ_mux[31] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[27]  (
	.I0(out_r_vec_mult_2[11]),
	.I1(in_a_r_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_55),
	.I4(pre_out_2[8]),
	.I5(pre_out_5[11]),
	.O(vec_in_r_AQ_mux_2[8])
);
defparam \vec_in_r_AQ_mux[27] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[28]  (
	.I0(out_r_vec_mult_2[11]),
	.I1(in_a_r_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_54),
	.I4(pre_out_2[7]),
	.I5(pre_out_5[11]),
	.O(vec_in_r_AQ_mux_2[7])
);
defparam \vec_in_r_AQ_mux[28] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[34]  (
	.I0(out_r_vec_mult_2[11]),
	.I1(in_a_r_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_48),
	.I4(pre_out_1[1]),
	.I5(pre_out_5[11]),
	.O(vec_in_r_AQ_mux_2[1])
);
defparam \vec_in_r_AQ_mux[34] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[32]  (
	.I0(out_r_vec_mult_2[11]),
	.I1(in_a_r_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_50),
	.I4(pre_out_2[3]),
	.I5(pre_out_5[11]),
	.O(vec_in_r_AQ_mux_2[3])
);
defparam \vec_in_r_AQ_mux[32] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[25]  (
	.I0(out_r_vec_mult_2[11]),
	.I1(in_a_r_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_57),
	.I4(pre_out_2[10]),
	.I5(pre_out_5[11]),
	.O(vec_in_r_AQ_mux_2[10])
);
defparam \vec_in_r_AQ_mux[25] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[30]  (
	.I0(out_r_vec_mult_2[11]),
	.I1(in_a_r_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_52),
	.I4(pre_out_2[5]),
	.I5(pre_out_5[11]),
	.O(vec_in_r_AQ_mux_2[5])
);
defparam \vec_in_r_AQ_mux[30] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[33]  (
	.I0(out_r_vec_mult_2[11]),
	.I1(in_a_r_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_49),
	.I4(pre_out_2[2]),
	.I5(pre_out_5[11]),
	.O(vec_in_r_AQ_mux_2[2])
);
defparam \vec_in_r_AQ_mux[33] .INIT=64'hFFF02F20BFB00F00;
// @21:109
  LUT6 \vec_in_r_AQ_mux[26]  (
	.I0(out_r_vec_mult_2[11]),
	.I1(in_a_r_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_56),
	.I4(pre_out_2[9]),
	.I5(pre_out_5[11]),
	.O(vec_in_r_AQ_mux_2[9])
);
defparam \vec_in_r_AQ_mux[26] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[32]  (
	.I0(out_i_vec_mult_2[11]),
	.I1(in_a_i_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_150),
	.I4(pre_out_3_1),
	.I5(pre_out_6[11]),
	.O(vec_in_i_AQ_mux_2[3])
);
defparam \vec_in_i_AQ_mux[32] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[26]  (
	.I0(out_i_vec_mult_2[11]),
	.I1(in_a_i_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_156),
	.I4(pre_out_3_7),
	.I5(pre_out_6[11]),
	.O(vec_in_i_AQ_mux_2[9])
);
defparam \vec_in_i_AQ_mux[26] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[30]  (
	.I0(out_i_vec_mult_2[11]),
	.I1(in_a_i_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_152),
	.I4(pre_out_3_3),
	.I5(pre_out_6[11]),
	.O(vec_in_i_AQ_mux_2[5])
);
defparam \vec_in_i_AQ_mux[30] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[25]  (
	.I0(out_i_vec_mult_2[11]),
	.I1(in_a_i_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_157),
	.I4(pre_out_3_8),
	.I5(pre_out_6[11]),
	.O(vec_in_i_AQ_mux_2[10])
);
defparam \vec_in_i_AQ_mux[25] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[31]  (
	.I0(out_i_vec_mult_2[11]),
	.I1(in_a_i_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_151),
	.I4(pre_out_2[4]),
	.I5(pre_out_6[11]),
	.O(vec_in_i_AQ_mux_2[4])
);
defparam \vec_in_i_AQ_mux[31] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[28]  (
	.I0(out_i_vec_mult_2[11]),
	.I1(in_a_i_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_154),
	.I4(pre_out_3_5),
	.I5(pre_out_6[11]),
	.O(vec_in_i_AQ_mux_2[7])
);
defparam \vec_in_i_AQ_mux[28] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[27]  (
	.I0(out_i_vec_mult_2[11]),
	.I1(in_a_i_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_155),
	.I4(pre_out_3_6),
	.I5(pre_out_6[11]),
	.O(vec_in_i_AQ_mux_2[8])
);
defparam \vec_in_i_AQ_mux[27] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[33]  (
	.I0(out_i_vec_mult_2[11]),
	.I1(in_a_i_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_149),
	.I4(pre_out_3_0),
	.I5(pre_out_6[11]),
	.O(vec_in_i_AQ_mux_2[2])
);
defparam \vec_in_i_AQ_mux[33] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[29]  (
	.I0(out_i_vec_mult_2[11]),
	.I1(in_a_i_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_153),
	.I4(pre_out_2[6]),
	.I5(pre_out_6[11]),
	.O(vec_in_i_AQ_mux_2[6])
);
defparam \vec_in_i_AQ_mux[29] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT6 \vec_in_i_AQ_mux[34]  (
	.I0(out_i_vec_mult_2[11]),
	.I1(in_a_i_reg_2[11]),
	.I2(vec_in_AQ_sel[1]),
	.I3(N_148),
	.I4(pre_out_2[1]),
	.I5(pre_out_6[11]),
	.O(vec_in_i_AQ_mux_2[1])
);
defparam \vec_in_i_AQ_mux[34] .INIT=64'hFFF02F20BFB00F00;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0[22]  (
	.I0(in_A_i[25]),
	.I1(out_i_vec_mult_1[1]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_160)
);
defparam \vec_in_i_AQ_mux_0[22] .INIT=8'hCA;
// @19:70
  LUT2 N_392_i_c (
	.I0(out_inner_prod_i[2]),
	.I1(single_in_R_sel[0]),
	.O(N_392_i)
);
defparam N_392_i_c.INIT=4'h8;
// @21:125
  LUT6 single_in_r_R_mux_i_a3_a (
	.I0(single_in_R_sel[0]),
	.I1(pre_out_18),
	.I2(pre_out_19),
	.I3(pre_out_20),
	.I4(pre_out_21),
	.I5(PATTERNDETECT_32),
	.O(N_95)
);
defparam single_in_r_R_mux_i_a3_a.INIT=64'h1555555500000000;
// @21:125
  LUT6 \single_in_r_R_mux_i_a4[0]  (
	.I0(single_in_R_sel[0]),
	.I1(pre_out_reg[23]),
	.I2(pre_out_18),
	.I3(pre_out_19),
	.I4(pre_out_20),
	.I5(pre_out_21),
	.O(N_122)
);
defparam \single_in_r_R_mux_i_a4[0] .INIT=64'h4444444444444445;
// @21:109
  LUT5 \vec_in_r_AQ_mux_1_m3[5]  (
	.I0(in_A_r[42]),
	.I1(out_r_vec_mult_0[6]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(N_500),
	.O(N_508)
);
defparam \vec_in_r_AQ_mux_1_m3[5] .INIT=32'h00CAFFCA;
// @21:109
  LUT5 \vec_in_r_AQ_mux_i_m2[11]  (
	.I0(in_A_r[36]),
	.I1(out_r_vec_mult_0[0]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(N_501),
	.O(N_507)
);
defparam \vec_in_r_AQ_mux_i_m2[11] .INIT=32'h00CAFFCA;
// @21:112
  LUT5 \vec_in_i_AQ_mux_i_m3[8]  (
	.I0(in_A_i[39]),
	.I1(out_i_vec_mult_0[3]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv[3]),
	.O(N_506)
);
defparam \vec_in_i_AQ_mux_i_m3[8] .INIT=32'h00CAFFCA;
// @21:112
  LUT5 \vec_in_i_AQ_mux_i_m3[9]  (
	.I0(in_A_i[38]),
	.I1(out_i_vec_mult_0[2]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv[2]),
	.O(N_505)
);
defparam \vec_in_i_AQ_mux_i_m3[9] .INIT=32'h00CAFFCA;
// @21:109
  LUT5 \vec_in_r_AQ_mux[8]  (
	.I0(in_A_r[39]),
	.I1(out_r_vec_mult_0[3]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv_0_2),
	.O(vec_in_r_AQ_mux_0_2)
);
defparam \vec_in_r_AQ_mux[8] .INIT=32'h00CAFFCA;
// @21:109
  LUT6 \vec_in_r_AQ_mux[36]  (
	.I0(in_A_r[11]),
	.I1(out_r_vec_mult_3[11]),
	.I2(in_a_r_reg_3[11]),
	.I3(vec_in_AQ_sel[0]),
	.I4(vec_in_AQ_sel[1]),
	.I5(pre_out_1[11]),
	.O(vec_in_r_AQ_mux_3[11])
);
defparam \vec_in_r_AQ_mux[36] .INIT=64'hF3F3CCAA3030CCAA;
// @21:109
  LUT6 \vec_in_r_AQ_mux[24]  (
	.I0(in_A_r[23]),
	.I1(out_r_vec_mult_2[11]),
	.I2(in_a_r_reg_2[11]),
	.I3(vec_in_AQ_sel[0]),
	.I4(vec_in_AQ_sel[1]),
	.I5(pre_out_5[11]),
	.O(vec_in_r_AQ_mux_2[11])
);
defparam \vec_in_r_AQ_mux[24] .INIT=64'hF3F3CCAA3030CCAA;
// @21:109
  LUT6 \vec_in_r_AQ_mux[29]  (
	.I0(in_A_r[18]),
	.I1(out_r_vec_mult_2[6]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m[6]),
	.I5(un5_output),
	.O(vec_in_r_AQ_mux_2[6])
);
defparam \vec_in_r_AQ_mux[29] .INIT=64'h00CAFFCA00CA00CA;
// @21:109
  LUT6 \vec_in_r_AQ_mux[35]  (
	.I0(in_A_r[12]),
	.I1(out_r_vec_mult_2[0]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m[0]),
	.I5(un5_output),
	.O(vec_in_r_AQ_mux_2[0])
);
defparam \vec_in_r_AQ_mux[35] .INIT=64'h00CAFFCA00CA00CA;
// @21:109
  LUT6 \vec_in_r_AQ_mux[12]  (
	.I0(in_A_r[35]),
	.I1(out_r_vec_mult_1[11]),
	.I2(in_a_r_reg_1[11]),
	.I3(vec_in_AQ_sel[0]),
	.I4(vec_in_AQ_sel[1]),
	.I5(pre_out_4[11]),
	.O(vec_in_r_AQ_mux_1[11])
);
defparam \vec_in_r_AQ_mux[12] .INIT=64'hF3F3CCAA3030CCAA;
// @21:109
  LUT6 \vec_in_r_AQ_mux[15]  (
	.I0(in_A_r[32]),
	.I1(out_r_vec_mult_1[8]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m[8]),
	.I5(un5_output_0),
	.O(vec_in_r_AQ_mux_1[8])
);
defparam \vec_in_r_AQ_mux[15] .INIT=64'h00CAFFCA00CA00CA;
// @21:109
  LUT6 \vec_in_r_AQ_mux[19]  (
	.I0(in_A_r[28]),
	.I1(out_r_vec_mult_1[4]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m[4]),
	.I5(un5_output_0),
	.O(vec_in_r_AQ_mux_1[4])
);
defparam \vec_in_r_AQ_mux[19] .INIT=64'h00CAFFCA00CA00CA;
// @21:109
  LUT6 \vec_in_r_AQ_mux[23]  (
	.I0(in_A_r[24]),
	.I1(out_r_vec_mult_1[0]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m_0_0),
	.I5(un5_output_0),
	.O(vec_in_r_AQ_mux_1[0])
);
defparam \vec_in_r_AQ_mux[23] .INIT=64'h00CAFFCA00CA00CA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[36]  (
	.I0(in_A_i[11]),
	.I1(out_i_vec_mult_3[11]),
	.I2(in_a_i_reg_3[11]),
	.I3(vec_in_AQ_sel[0]),
	.I4(vec_in_AQ_sel[1]),
	.I5(pre_out_3_9),
	.O(vec_in_i_AQ_mux_3[11])
);
defparam \vec_in_i_AQ_mux[36] .INIT=64'hF3F3CCAA3030CCAA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[37]  (
	.I0(in_A_i[10]),
	.I1(out_i_vec_mult_3[10]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m[10]),
	.I5(un5_output_1),
	.O(vec_in_i_AQ_mux_3[10])
);
defparam \vec_in_i_AQ_mux[37] .INIT=64'h00CAFFCA00CA00CA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[38]  (
	.I0(in_A_i[9]),
	.I1(out_i_vec_mult_3[9]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m[9]),
	.I5(un5_output_1),
	.O(vec_in_i_AQ_mux_3[9])
);
defparam \vec_in_i_AQ_mux[38] .INIT=64'h00CAFFCA00CA00CA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[40]  (
	.I0(in_A_i[7]),
	.I1(out_i_vec_mult_3[7]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m[7]),
	.I5(un5_output_1),
	.O(vec_in_i_AQ_mux_3[7])
);
defparam \vec_in_i_AQ_mux[40] .INIT=64'h00CAFFCA00CA00CA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[41]  (
	.I0(in_A_i[6]),
	.I1(out_i_vec_mult_3[6]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m_0_6),
	.I5(un5_output_1),
	.O(vec_in_i_AQ_mux_3[6])
);
defparam \vec_in_i_AQ_mux[41] .INIT=64'h00CAFFCA00CA00CA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[42]  (
	.I0(in_A_i[5]),
	.I1(out_i_vec_mult_3[5]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m[5]),
	.I5(un5_output_1),
	.O(vec_in_i_AQ_mux_3[5])
);
defparam \vec_in_i_AQ_mux[42] .INIT=64'h00CAFFCA00CA00CA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[43]  (
	.I0(in_A_i[4]),
	.I1(out_i_vec_mult_3[4]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m_0_4),
	.I5(un5_output_1),
	.O(vec_in_i_AQ_mux_3[4])
);
defparam \vec_in_i_AQ_mux[43] .INIT=64'h00CAFFCA00CA00CA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[44]  (
	.I0(in_A_i[3]),
	.I1(out_i_vec_mult_3[3]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m[3]),
	.I5(un5_output_1),
	.O(vec_in_i_AQ_mux_3[3])
);
defparam \vec_in_i_AQ_mux[44] .INIT=64'h00CAFFCA00CA00CA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[45]  (
	.I0(in_A_i[2]),
	.I1(out_i_vec_mult_3[2]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m[2]),
	.I5(un5_output_1),
	.O(vec_in_i_AQ_mux_3[2])
);
defparam \vec_in_i_AQ_mux[45] .INIT=64'h00CAFFCA00CA00CA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[46]  (
	.I0(in_A_i[1]),
	.I1(out_i_vec_mult_3[1]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m[1]),
	.I5(un5_output_1),
	.O(vec_in_i_AQ_mux_3[1])
);
defparam \vec_in_i_AQ_mux[46] .INIT=64'h00CAFFCA00CA00CA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[47]  (
	.I0(in_A_i[0]),
	.I1(out_i_vec_mult_3[0]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m_1[0]),
	.I5(un5_output_1),
	.O(vec_in_i_AQ_mux_3[0])
);
defparam \vec_in_i_AQ_mux[47] .INIT=64'h00CAFFCA00CA00CA;
// @21:112
  LUT5 \vec_in_i_AQ_mux[10]  (
	.I0(in_A_i[37]),
	.I1(out_i_vec_mult_0[1]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv[1]),
	.O(vec_in_i_AQ_mux_0_1)
);
defparam \vec_in_i_AQ_mux[10] .INIT=32'h00CAFFCA;
// @21:109
  LUT5 \vec_in_r_AQ_mux[6]  (
	.I0(in_A_r[41]),
	.I1(out_r_vec_mult_0[5]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv[5]),
	.O(vec_in_r_AQ_mux_0_4)
);
defparam \vec_in_r_AQ_mux[6] .INIT=32'h00CAFFCA;
// @21:109
  LUT5 \vec_in_r_AQ_mux[7]  (
	.I0(in_A_r[40]),
	.I1(out_r_vec_mult_0[4]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv[4]),
	.O(vec_in_r_AQ_mux_0_3)
);
defparam \vec_in_r_AQ_mux[7] .INIT=32'h00CAFFCA;
// @21:112
  LUT5 \vec_in_i_AQ_mux[6]  (
	.I0(in_A_i[41]),
	.I1(out_i_vec_mult_0[5]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv_0_4),
	.O(vec_in_i_AQ_mux_0_5)
);
defparam \vec_in_i_AQ_mux[6] .INIT=32'h00CAFFCA;
// @21:112
  LUT5 \vec_in_i_AQ_mux[11]  (
	.I0(in_A_i[36]),
	.I1(out_i_vec_mult_0[0]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv[0]),
	.O(vec_in_i_AQ_mux_0_0)
);
defparam \vec_in_i_AQ_mux[11] .INIT=32'h00CAFFCA;
// @21:109
  LUT5 \vec_in_r_AQ_mux[4]  (
	.I0(in_A_r[43]),
	.I1(out_r_vec_mult_0[7]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv[7]),
	.O(vec_in_r_AQ_mux_0_6)
);
defparam \vec_in_r_AQ_mux[4] .INIT=32'h00CAFFCA;
// @21:109
  LUT5 \vec_in_r_AQ_mux[9]  (
	.I0(in_A_r[38]),
	.I1(out_r_vec_mult_0[2]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv_0_1),
	.O(vec_in_r_AQ_mux_0_1)
);
defparam \vec_in_r_AQ_mux[9] .INIT=32'h00CAFFCA;
// @21:112
  LUT5 \vec_in_i_AQ_mux[3]  (
	.I0(in_A_i[44]),
	.I1(out_i_vec_mult_0[8]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv[8]),
	.O(vec_in_i_AQ_mux_0_8)
);
defparam \vec_in_i_AQ_mux[3] .INIT=32'h00CAFFCA;
// @21:109
  LUT5 \vec_in_r_AQ_mux[1]  (
	.I0(in_A_r[46]),
	.I1(out_r_vec_mult_0[10]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv[10]),
	.O(vec_in_r_AQ_mux_0_9)
);
defparam \vec_in_r_AQ_mux[1] .INIT=32'h00CAFFCA;
// @21:109
  LUT5 \vec_in_r_AQ_mux[2]  (
	.I0(in_A_r[45]),
	.I1(out_r_vec_mult_0[9]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv[9]),
	.O(vec_in_r_AQ_mux_0_8)
);
defparam \vec_in_r_AQ_mux[2] .INIT=32'h00CAFFCA;
// @21:109
  LUT5 \vec_in_r_AQ_mux[10]  (
	.I0(in_A_r[37]),
	.I1(out_r_vec_mult_0[1]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv_0_0),
	.O(vec_in_r_AQ_mux_0_0)
);
defparam \vec_in_r_AQ_mux[10] .INIT=32'h00CAFFCA;
// @21:112
  LUT5 \vec_in_i_AQ_mux[1]  (
	.I0(in_A_i[46]),
	.I1(out_i_vec_mult_0[10]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv_0_9),
	.O(vec_in_i_AQ_mux_0_10)
);
defparam \vec_in_i_AQ_mux[1] .INIT=32'h00CAFFCA;
// @21:112
  LUT5 \vec_in_i_AQ_mux[4]  (
	.I0(in_A_i[43]),
	.I1(out_i_vec_mult_0[7]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv_0_6),
	.O(vec_in_i_AQ_mux_0_7)
);
defparam \vec_in_i_AQ_mux[4] .INIT=32'h00CAFFCA;
// @21:112
  LUT5 \vec_in_i_AQ_mux[5]  (
	.I0(in_A_i[42]),
	.I1(out_i_vec_mult_0[6]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv[6]),
	.O(vec_in_i_AQ_mux_0_6)
);
defparam \vec_in_i_AQ_mux[5] .INIT=32'h00CAFFCA;
// @21:112
  LUT5 \vec_in_i_AQ_mux[2]  (
	.I0(in_A_i[45]),
	.I1(out_i_vec_mult_0[9]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv_0_8),
	.O(vec_in_i_AQ_mux_0_9)
);
defparam \vec_in_i_AQ_mux[2] .INIT=32'h00CAFFCA;
// @21:112
  LUT5 \vec_in_i_AQ_mux[7]  (
	.I0(in_A_i[40]),
	.I1(out_i_vec_mult_0[4]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv_0_3),
	.O(vec_in_i_AQ_mux_0_4)
);
defparam \vec_in_i_AQ_mux[7] .INIT=32'h00CAFFCA;
// @21:109
  LUT5 \vec_in_r_AQ_mux[3]  (
	.I0(in_A_r[44]),
	.I1(out_r_vec_mult_0[8]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(output_iv_0_7),
	.O(vec_in_r_AQ_mux_0_7)
);
defparam \vec_in_r_AQ_mux[3] .INIT=32'h00CAFFCA;
// @21:109
  LUT6 \vec_in_r_AQ_mux[46]  (
	.I0(in_A_r[1]),
	.I1(out_r_vec_mult_3[1]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m_0_1),
	.I5(un5_output_2),
	.O(vec_in_r_AQ_mux_3[1])
);
defparam \vec_in_r_AQ_mux[46] .INIT=64'h00CAFFCA00CA00CA;
// @21:109
  LUT6 \vec_in_r_AQ_mux[47]  (
	.I0(in_A_r[0]),
	.I1(out_r_vec_mult_3[0]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(pre_out_i_m_2[0]),
	.I5(un5_output_2),
	.O(vec_in_r_AQ_mux_3[0])
);
defparam \vec_in_r_AQ_mux[47] .INIT=64'h00CAFFCA00CA00CA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[24]  (
	.I0(in_A_i[23]),
	.I1(out_i_vec_mult_2[11]),
	.I2(in_a_i_reg_2[11]),
	.I3(vec_in_AQ_sel[0]),
	.I4(vec_in_AQ_sel[1]),
	.I5(pre_out_6[11]),
	.O(vec_in_i_AQ_mux_2[11])
);
defparam \vec_in_i_AQ_mux[24] .INIT=64'hF3F3CCAA3030CCAA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[35]  (
	.I0(in_A_i[12]),
	.I1(out_i_vec_mult_2[0]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(un5_output_3),
	.I5(pre_out_i_m_3[0]),
	.O(vec_in_i_AQ_mux_2[0])
);
defparam \vec_in_i_AQ_mux[35] .INIT=64'h00CA00CAFFCA00CA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[12]  (
	.I0(in_A_i[35]),
	.I1(out_i_vec_mult_1[11]),
	.I2(in_a_i_reg_1[11]),
	.I3(vec_in_AQ_sel[0]),
	.I4(vec_in_AQ_sel[1]),
	.I5(pre_out_0[11]),
	.O(vec_in_i_AQ_mux_1[11])
);
defparam \vec_in_i_AQ_mux[12] .INIT=64'hF3F3CCAA3030CCAA;
// @21:112
  LUT6 \vec_in_i_AQ_mux[23]  (
	.I0(in_A_i[24]),
	.I1(out_i_vec_mult_1[0]),
	.I2(vec_in_AQ_sel[0]),
	.I3(vec_in_AQ_sel[1]),
	.I4(un5_output_4),
	.I5(pre_out_i_m_4[0]),
	.O(vec_in_i_AQ_mux_1[0])
);
defparam \vec_in_i_AQ_mux[23] .INIT=64'h00CA00CAFFCA00CA;
// @21:125
  LUT5 \single_in_r_R_mux_0[11]  (
	.I0(single_in_R_sel[0]),
	.I1(out_inner_prod_r[11]),
	.I2(un8_rnd_out_P[19]),
	.I3(N_122),
	.I4(N_95),
	.O(single_in_r_R_mux[11])
);
defparam \single_in_r_R_mux_0[11] .INIT=32'hFFFFF888;
// @19:70
  LUT5 \single_in_r_R_mux_i_a4_RNI2PN21[0]  (
	.I0(out_inner_prod_r[10]),
	.I1(single_in_R_sel[0]),
	.I2(un8_rnd_out[10]),
	.I3(N_122),
	.I4(N_95),
	.O(N_389_i)
);
defparam \single_in_r_R_mux_i_a4_RNI2PN21[0] .INIT=32'h0000B0BB;
// @19:70
  LUT5 \single_in_r_R_mux_i_a4_RNIQTA81[0]  (
	.I0(out_inner_prod_r[9]),
	.I1(single_in_R_sel[0]),
	.I2(un8_rnd_out[9]),
	.I3(N_122),
	.I4(N_95),
	.O(N_388_i)
);
defparam \single_in_r_R_mux_i_a4_RNIQTA81[0] .INIT=32'h0000B0BB;
// @19:70
  LUT5 \single_in_r_R_mux_i_a4_RNIPSA81[0]  (
	.I0(out_inner_prod_r[8]),
	.I1(single_in_R_sel[0]),
	.I2(un8_rnd_out[8]),
	.I3(N_122),
	.I4(N_95),
	.O(N_387_i)
);
defparam \single_in_r_R_mux_i_a4_RNIPSA81[0] .INIT=32'h0000B0BB;
// @19:70
  LUT5 \single_in_r_R_mux_i_a4_RNIORA81[0]  (
	.I0(out_inner_prod_r[7]),
	.I1(single_in_R_sel[0]),
	.I2(un8_rnd_out[7]),
	.I3(N_122),
	.I4(N_95),
	.O(N_386_i)
);
defparam \single_in_r_R_mux_i_a4_RNIORA81[0] .INIT=32'h0000B0BB;
// @19:70
  LUT5 \single_in_r_R_mux_i_a4_RNINQA81[0]  (
	.I0(out_inner_prod_r[6]),
	.I1(single_in_R_sel[0]),
	.I2(un8_rnd_out[6]),
	.I3(N_122),
	.I4(N_95),
	.O(N_385_i)
);
defparam \single_in_r_R_mux_i_a4_RNINQA81[0] .INIT=32'h0000B0BB;
// @19:70
  LUT5 \single_in_r_R_mux_i_a4_RNIMPA81[0]  (
	.I0(out_inner_prod_r[5]),
	.I1(single_in_R_sel[0]),
	.I2(un8_rnd_out[5]),
	.I3(N_122),
	.I4(N_95),
	.O(N_384_i)
);
defparam \single_in_r_R_mux_i_a4_RNIMPA81[0] .INIT=32'h0000B0BB;
// @19:70
  LUT5 \single_in_r_R_mux_i_a4_RNILOA81[0]  (
	.I0(out_inner_prod_r[4]),
	.I1(single_in_R_sel[0]),
	.I2(un8_rnd_out[4]),
	.I3(N_122),
	.I4(N_95),
	.O(N_383_i)
);
defparam \single_in_r_R_mux_i_a4_RNILOA81[0] .INIT=32'h0000B0BB;
// @19:70
  LUT5 \single_in_r_R_mux_i_a4_RNIKNA81[0]  (
	.I0(out_inner_prod_r[3]),
	.I1(single_in_R_sel[0]),
	.I2(un8_rnd_out[3]),
	.I3(N_122),
	.I4(N_95),
	.O(N_34_i)
);
defparam \single_in_r_R_mux_i_a4_RNIKNA81[0] .INIT=32'h0000B0BB;
// @19:70
  LUT5 \single_in_r_R_mux_i_a4_RNIJMA81[0]  (
	.I0(out_inner_prod_r[2]),
	.I1(single_in_R_sel[0]),
	.I2(un8_rnd_out[2]),
	.I3(N_122),
	.I4(N_95),
	.O(N_32_i)
);
defparam \single_in_r_R_mux_i_a4_RNIJMA81[0] .INIT=32'h0000B0BB;
// @19:70
  LUT5 \single_in_r_R_mux_i_a4_RNIILA81[0]  (
	.I0(out_inner_prod_r[1]),
	.I1(single_in_R_sel[0]),
	.I2(un8_rnd_out[1]),
	.I3(N_122),
	.I4(N_95),
	.O(N_30_i)
);
defparam \single_in_r_R_mux_i_a4_RNIILA81[0] .INIT=32'h0000B0BB;
// @19:70
  LUT5 \single_in_r_R_mux_i_a4_RNIHKA81[0]  (
	.I0(out_inner_prod_r[0]),
	.I1(single_in_R_sel[0]),
	.I2(un8_rnd_out[0]),
	.I3(N_122),
	.I4(N_95),
	.O(N_28_i)
);
defparam \single_in_r_R_mux_i_a4_RNIHKA81[0] .INIT=32'h0000B0BB;
  GND GND_cZ (
	.G(GND)
);
  VCC VCC_cZ (
	.P(VCC)
);
// @21:109
  LUT5 \vec_in_r_AQ_mux_i_o3_lut6_2_o6[11]  (
	.I0(out_r_vec_mult_0[0]),
	.I1(in_a_r_reg_0_0),
	.I2(out_r_vec_mult_0[11]),
	.I3(in_a_r_reg_0_11),
	.I4(pre_out_10),
	.O(N_501)
);
defparam \vec_in_r_AQ_mux_i_o3_lut6_2_o6[11] .INIT=32'h99099F99;
// @21:109
  LUT3 \vec_in_r_AQ_mux_i_o3_lut6_2_o5[11]  (
	.I0(out_r_vec_mult_0[11]),
	.I1(in_a_r_reg_0_11),
	.I2(pre_out_10),
	.O(out_r_vec_sub_0[11])
);
defparam \vec_in_r_AQ_mux_i_o3_lut6_2_o5[11] .INIT=8'hD4;
// @21:131
  LUT3 \col_sel_R_mux_i_m3_lut6_2_o6[0]  (
	.I0(col_sel_R_int[0]),
	.I1(col_sel_R[0]),
	.I2(wr_en_AQ_sel[0]),
	.O(col_sel_R_mux_i_m3_lut6_2_O6[0])
);
defparam \col_sel_R_mux_i_m3_lut6_2_o6[0] .INIT=8'hAC;
// @21:131
  LUT3 \col_sel_R_mux_i_m3_lut6_2_o5[0]  (
	.I0(col_sel_R[1]),
	.I1(col_sel_R_int[1]),
	.I2(wr_en_AQ_sel[0]),
	.O(col_sel_R_mux_i_m3_lut6_2_O5[0])
);
defparam \col_sel_R_mux_i_m3_lut6_2_o5[0] .INIT=8'hCA;
// @21:121
  LUT3 wr_en_AQ_mux_i_m3_lut6_2_o6 (
	.I0(wr_en_AQ_int),
	.I1(wr_A_QR),
	.I2(wr_en_AQ_sel[0]),
	.O(wr_en_AQ_mux_i_m3_lut6_2_O6)
);
defparam wr_en_AQ_mux_i_m3_lut6_2_o6.INIT=8'hAC;
// @21:121
  LUT3 wr_en_AQ_mux_i_m3_lut6_2_o5 (
	.I0(start_QR),
	.I1(state_5),
	.I2(wr_en_AQ_sel[0]),
	.O(wr_en_AQ_sel_0[0])
);
defparam wr_en_AQ_mux_i_m3_lut6_2_o5.INIT=8'hB8;
// @21:117
  LUT3 \col_sel_AQ2_mux_i_m3_lut6_2_o6[0]  (
	.I0(col_sel_AQ[0]),
	.I1(col_sel_AQ2_int[0]),
	.I2(wr_en_AQ_sel[0]),
	.O(col_sel_AQ2_mux_i_m3_lut6_2_O6[0])
);
defparam \col_sel_AQ2_mux_i_m3_lut6_2_o6[0] .INIT=8'hCA;
// @21:117
  LUT3 \col_sel_AQ2_mux_i_m3_lut6_2_o5[0]  (
	.I0(col_sel_AQ[1]),
	.I1(col_sel_AQ2_int[1]),
	.I2(wr_en_AQ_sel[0]),
	.O(col_sel_AQ2_mux_i_m3_lut6_2_O5[0])
);
defparam \col_sel_AQ2_mux_i_m3_lut6_2_o5[0] .INIT=8'hCA;
// @21:141
  LUT3 \w_col_sel_AQ_mux_i_m3_lut6_2_o6[0]  (
	.I0(w_col_sel_AQ_int[0]),
	.I1(col_sel_AQ[0]),
	.I2(wr_en_AQ_sel[0]),
	.O(w_col_sel_AQ_mux_i_m3_lut6_2_O6[0])
);
defparam \w_col_sel_AQ_mux_i_m3_lut6_2_o6[0] .INIT=8'hAC;
// @21:141
  LUT3 \w_col_sel_AQ_mux_i_m3_lut6_2_o5[0]  (
	.I0(w_col_sel_AQ_int[1]),
	.I1(col_sel_AQ[1]),
	.I2(wr_en_AQ_sel[0]),
	.O(w_col_sel_AQ_mux_i_m3_lut6_2_O5[0])
);
defparam \w_col_sel_AQ_mux_i_m3_lut6_2_o5[0] .INIT=8'hAC;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o6[38]  (
	.I0(in_A_r[9]),
	.I1(out_r_vec_mult_3[9]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_44)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o6[38] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o5[38]  (
	.I0(in_A_r[10]),
	.I1(out_r_vec_mult_3[10]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_45)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o5[38] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o6[40]  (
	.I0(in_A_r[7]),
	.I1(out_r_vec_mult_3[7]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_42)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o6[40] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o5[40]  (
	.I0(in_A_r[8]),
	.I1(out_r_vec_mult_3[8]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_43)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o5[40] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o6[26]  (
	.I0(in_A_r[21]),
	.I1(out_r_vec_mult_2[9]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_56)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o6[26] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o5[26]  (
	.I0(in_A_r[22]),
	.I1(out_r_vec_mult_2[10]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_57)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o5[26] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o6[28]  (
	.I0(in_A_r[19]),
	.I1(out_r_vec_mult_2[7]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_54)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o6[28] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o5[28]  (
	.I0(in_A_r[20]),
	.I1(out_r_vec_mult_2[8]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_55)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o5[28] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o6[31]  (
	.I0(in_A_r[16]),
	.I1(out_r_vec_mult_2[4]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_51)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o6[31] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o5[31]  (
	.I0(in_A_r[17]),
	.I1(out_r_vec_mult_2[5]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_52)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o5[31] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o6[34]  (
	.I0(in_A_r[13]),
	.I1(out_r_vec_mult_2[1]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_48)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o6[34] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o5[34]  (
	.I0(in_A_r[14]),
	.I1(out_r_vec_mult_2[2]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_49)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o5[34] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o6[14]  (
	.I0(in_A_r[33]),
	.I1(out_r_vec_mult_1[9]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_68)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o6[14] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o5[14]  (
	.I0(in_A_r[34]),
	.I1(out_r_vec_mult_1[10]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_69)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o5[14] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o6[18]  (
	.I0(in_A_r[29]),
	.I1(out_r_vec_mult_1[5]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_64)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o6[18] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o5[18]  (
	.I0(in_A_r[30]),
	.I1(out_r_vec_mult_1[6]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_65)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o5[18] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o6[21]  (
	.I0(in_A_r[26]),
	.I1(out_r_vec_mult_1[2]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_61)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o6[21] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o5[21]  (
	.I0(in_A_r[27]),
	.I1(out_r_vec_mult_1[3]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_62)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o5[21] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o6[22]  (
	.I0(in_A_r[25]),
	.I1(out_r_vec_mult_1[1]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_60)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o6[22] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o5[22]  (
	.I0(in_A_r[31]),
	.I1(out_r_vec_mult_1[7]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_66)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o5[22] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o6[41]  (
	.I0(in_A_r[6]),
	.I1(out_r_vec_mult_3[6]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_41)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o6[41] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o5[41]  (
	.I0(in_A_r[15]),
	.I1(out_r_vec_mult_2[3]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_50)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o5[41] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o6[43]  (
	.I0(in_A_r[4]),
	.I1(out_r_vec_mult_3[4]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_39)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o6[43] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o5[43]  (
	.I0(in_A_r[5]),
	.I1(out_r_vec_mult_3[5]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_40)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o5[43] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o6[45]  (
	.I0(in_A_r[2]),
	.I1(out_r_vec_mult_3[2]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_37)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o6[45] .INIT=8'hCA;
// @21:109
  LUT3 \vec_in_r_AQ_mux_0_lut6_2_o5[45]  (
	.I0(in_A_r[3]),
	.I1(out_r_vec_mult_3[3]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_38)
);
defparam \vec_in_r_AQ_mux_0_lut6_2_o5[45] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o6[26]  (
	.I0(in_A_i[21]),
	.I1(out_i_vec_mult_2[9]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_156)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o6[26] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o5[26]  (
	.I0(in_A_i[22]),
	.I1(out_i_vec_mult_2[10]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_157)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o5[26] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o6[27]  (
	.I0(in_A_i[20]),
	.I1(out_i_vec_mult_2[8]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_155)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o6[27] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o5[27]  (
	.I0(in_A_i[8]),
	.I1(out_i_vec_mult_3[8]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_143)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o5[27] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o6[29]  (
	.I0(in_A_i[18]),
	.I1(out_i_vec_mult_2[6]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_153)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o6[29] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o5[29]  (
	.I0(in_A_i[19]),
	.I1(out_i_vec_mult_2[7]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_154)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o5[29] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o6[31]  (
	.I0(in_A_i[16]),
	.I1(out_i_vec_mult_2[4]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_151)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o6[31] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o5[31]  (
	.I0(in_A_i[17]),
	.I1(out_i_vec_mult_2[5]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_152)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o5[31] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o6[33]  (
	.I0(in_A_i[14]),
	.I1(out_i_vec_mult_2[2]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_149)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o6[33] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o5[33]  (
	.I0(in_A_i[15]),
	.I1(out_i_vec_mult_2[3]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_150)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o5[33] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o6[14]  (
	.I0(in_A_i[33]),
	.I1(out_i_vec_mult_1[9]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_168)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o6[14] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o5[14]  (
	.I0(in_A_i[34]),
	.I1(out_i_vec_mult_1[10]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_169)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o5[14] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o6[16]  (
	.I0(in_A_i[31]),
	.I1(out_i_vec_mult_1[7]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_166)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o6[16] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o5[16]  (
	.I0(in_A_i[32]),
	.I1(out_i_vec_mult_1[8]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_167)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o5[16] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o6[17]  (
	.I0(in_A_i[30]),
	.I1(out_i_vec_mult_1[6]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_165)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o6[17] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o5[17]  (
	.I0(in_A_i[13]),
	.I1(out_i_vec_mult_2[1]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_148)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o5[17] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o6[19]  (
	.I0(in_A_i[28]),
	.I1(out_i_vec_mult_1[4]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_163)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o6[19] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o5[19]  (
	.I0(in_A_i[29]),
	.I1(out_i_vec_mult_1[5]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_164)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o5[19] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o6[21]  (
	.I0(in_A_i[26]),
	.I1(out_i_vec_mult_1[2]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_161)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o6[21] .INIT=8'hCA;
// @21:112
  LUT3 \vec_in_i_AQ_mux_0_lut6_2_o5[21]  (
	.I0(in_A_i[27]),
	.I1(out_i_vec_mult_1[3]),
	.I2(vec_in_AQ_sel[0]),
	.O(N_162)
);
defparam \vec_in_i_AQ_mux_0_lut6_2_o5[21] .INIT=8'hCA;
// @19:70
  LUT2 N_399_i_lut6_2_o6 (
	.I0(out_inner_prod_i[9]),
	.I1(single_in_R_sel[0]),
	.O(N_399_i)
);
defparam N_399_i_lut6_2_o6.INIT=4'h8;
// @19:70
  LUT2 N_399_i_lut6_2_o5 (
	.I0(single_in_R_sel[0]),
	.I1(out_inner_prod_i[11]),
	.O(N_401_i)
);
defparam N_399_i_lut6_2_o5.INIT=4'h8;
// @19:70
  LUT2 N_398_i_lut6_2_o6 (
	.I0(out_inner_prod_i[8]),
	.I1(single_in_R_sel[0]),
	.O(N_398_i)
);
defparam N_398_i_lut6_2_o6.INIT=4'h8;
// @19:70
  LUT2 N_398_i_lut6_2_o5 (
	.I0(out_inner_prod_i[10]),
	.I1(single_in_R_sel[0]),
	.O(N_400_i)
);
defparam N_398_i_lut6_2_o5.INIT=4'h8;
// @19:70
  LUT2 N_395_i_lut6_2_o6 (
	.I0(out_inner_prod_i[5]),
	.I1(single_in_R_sel[0]),
	.O(N_395_i)
);
defparam N_395_i_lut6_2_o6.INIT=4'h8;
// @19:70
  LUT2 N_395_i_lut6_2_o5 (
	.I0(out_inner_prod_i[7]),
	.I1(single_in_R_sel[0]),
	.O(N_397_i)
);
defparam N_395_i_lut6_2_o5.INIT=4'h8;
// @19:70
  LUT2 N_394_i_lut6_2_o6 (
	.I0(out_inner_prod_i[4]),
	.I1(single_in_R_sel[0]),
	.O(N_394_i)
);
defparam N_394_i_lut6_2_o6.INIT=4'h8;
// @19:70
  LUT2 N_394_i_lut6_2_o5 (
	.I0(out_inner_prod_i[6]),
	.I1(single_in_R_sel[0]),
	.O(N_396_i)
);
defparam N_394_i_lut6_2_o5.INIT=4'h8;
// @19:70
  LUT2 N_391_i_lut6_2_o6 (
	.I0(out_inner_prod_i[1]),
	.I1(single_in_R_sel[0]),
	.O(N_391_i)
);
defparam N_391_i_lut6_2_o6.INIT=4'h8;
// @19:70
  LUT4 N_391_i_lut6_2_o5 (
	.I0(state_0),
	.I1(state_2),
	.I2(single_in_R_sel[0]),
	.I3(done_inv_sqrt),
	.O(single_in_R_sel_0[0])
);
defparam N_391_i_lut6_2_o5.INIT=16'hBAFA;
// @19:70
  LUT2 N_390_i_lut6_2_o6 (
	.I0(out_inner_prod_i[0]),
	.I1(single_in_R_sel[0]),
	.O(N_390_i)
);
defparam N_390_i_lut6_2_o6.INIT=4'h8;
// @19:70
  LUT2 N_390_i_lut6_2_o5 (
	.I0(out_inner_prod_i[3]),
	.I1(single_in_R_sel[0]),
	.O(N_393_i)
);
defparam N_390_i_lut6_2_o5.INIT=4'h8;
endmodule