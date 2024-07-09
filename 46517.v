module shifterZ1 (
  ret_val,
  un20_output_2,
  ret_val_m2,
  shift_amount_1,
  un26_output_0_iv_3,
  ret_val_d_a1,
  ret_val_d_a0,
  un26_output_6,
  un26_output_2,
  un26_output_4,
  un26_output_3,
  un26_output_0,
  un1_poly_odd_i,
  input_reg,
  un26_output_0_iv_2_0_1,
  input_shifted_4,
  input_shifted_0,
  input_shifted_3,
  un1_input_shifted,
  un1_poly_odd,
  un9_0_axb_8,
  un20_output_0_0_a2_0_0_lut6_2_O5,
  N_100_i,
  N_65,
  un3_shift_right,
  N_2502_i,
  un4_overflow_2,
  N_454,
  N_72,
  ret_val_ss0,
  N_458,
  N_45,
  N_70,
  N_73,
  N_71,
  N_441,
  un9_0_axb_4
)
;
input [3:1] ret_val ;
output [14:14] un20_output_2 ;
input [3:3] ret_val_m2 ;
input [1:1] shift_amount_1 ;
output [6:6] un26_output_0_iv_3 ;
input [1:1] ret_val_d_a1 ;
input [1:1] ret_val_d_a0 ;
output un26_output_6 ;
output un26_output_2 ;
output un26_output_4 ;
output un26_output_3 ;
output un26_output_0 ;
output [6:6] un1_poly_odd_i ;
input [11:0] input_reg ;
output un26_output_0_iv_2_0_1 ;
output input_shifted_4 ;
output input_shifted_0 ;
output input_shifted_3 ;
input [4:4] un1_input_shifted ;
input [8:8] un1_poly_odd ;
input un9_0_axb_8 ;
output un20_output_0_0_a2_0_0_lut6_2_O5 ;
output N_100_i ;
output N_65 ;
input un3_shift_right ;
output N_2502_i ;
input un4_overflow_2 ;
input N_454 ;
output N_72 ;
input ret_val_ss0 ;
input N_458 ;
output N_45 ;
output N_70 ;
output N_73 ;
output N_71 ;
input N_441 ;
output un9_0_axb_4 ;
wire un26_output_6 ;
wire un26_output_2 ;
wire un26_output_4 ;
wire un26_output_3 ;
wire un26_output_0 ;
wire un26_output_0_iv_2_0_1 ;
wire input_shifted_4 ;
wire input_shifted_0 ;
wire input_shifted_3 ;
wire un9_0_axb_8 ;
wire un20_output_0_0_a2_0_0_lut6_2_O5 ;
wire N_100_i ;
wire N_65 ;
wire un3_shift_right ;
wire N_2502_i ;
wire un4_overflow_2 ;
wire N_454 ;
wire N_72 ;
wire ret_val_ss0 ;
wire N_458 ;
wire N_45 ;
wire N_70 ;
wire N_73 ;
wire N_71 ;
wire N_441 ;
wire un9_0_axb_4 ;
wire [4:4] input_m_s;
wire [5:5] un26_output_0_iv_2_0;
wire [3:3] input_m_0;
wire [2:2] output_a1_0;
wire [3:3] un26_output_0_iv_0;
wire [4:4] un26_output_0_iv_2_a0;
wire [1:0] input_m_4;
wire [0:0] input_m_2;
wire [2:2] input_m_3;
wire [7:7] un26_output_0_iv_0_a2_xx;
wire [7:7] un26_output_0_iv_0_a2_yy;
wire [0:0] input_m_4_a0_0;
wire [2:2] output_0_2;
wire GND ;
wire VCC ;
wire un20_output_0_0_a2_0_0 ;
wire N_47 ;
wire un20_output_0_2_a0_0 ;
wire un20_output_3_0_0_a2_s ;
wire un26_m3_i_0 ;
wire N_46 ;
wire N_443 ;
wire N_445 ;
// @23:226
  LUT4 \un26_output_0_iv_0_RNICACH2[7]  (
	.I0(N_65),
	.I1(un26_output_6),
	.I2(un3_shift_right),
	.I3(un9_0_axb_8),
	.O(N_2502_i)
);
defparam \un26_output_0_iv_0_RNICACH2[7] .INIT=16'h00AC;
// @8:59
  LUT4 un20_output_0 (
	.I0(input_reg[4]),
	.I1(input_reg[5]),
	.I2(un20_output_0_2_a0_0),
	.I3(ret_val[3]),
	.O(un20_output_2[14])
);
defparam un20_output_0.INIT=16'h00DF;
// @8:59
  LUT5 un20_output_1_0_0_a2_0 (
	.I0(input_reg[3]),
	.I1(un4_overflow_2),
	.I2(ret_val_m2[3]),
	.I3(N_454),
	.I4(un9_0_axb_8),
	.O(un20_output_3_0_0_a2_s)
);
defparam un20_output_1_0_0_a2_0.INIT=32'h000037FF;
// @8:60
  LUT5 \un26_output_0_iv_3_cZ[6]  (
	.I0(input_reg[3]),
	.I1(input_reg[6]),
	.I2(un9_0_axb_8),
	.I3(input_m_s[4]),
	.I4(shift_amount_1[1]),
	.O(un26_output_0_iv_3[6])
);
defparam \un26_output_0_iv_3_cZ[6] .INIT=32'hFF0ACCC0;
// @8:60
  LUT3 \un26_output_0_iv_2_0_cZ[5]  (
	.I0(input_reg[4]),
	.I1(input_reg[5]),
	.I2(un9_0_axb_8),
	.O(un26_output_0_iv_2_0[5])
);
defparam \un26_output_0_iv_2_0_cZ[5] .INIT=8'hCA;
// @8:60
  LUT4 \input_m_0_cZ[3]  (
	.I0(input_reg[3]),
	.I1(ret_val[2]),
	.I2(ret_val[1]),
	.I3(un9_0_axb_8),
	.O(input_m_0[3])
);
defparam \input_m_0_cZ[3] .INIT=16'h2A00;
  LUT5 \un22_output_0_lut6_2_RNIRGBD6[5]  (
	.I0(input_reg[8]),
	.I1(input_reg[7]),
	.I2(un9_0_axb_8),
	.I3(N_47),
	.I4(shift_amount_1[1]),
	.O(N_72)
);
defparam \un22_output_0_lut6_2_RNIRGBD6[5] .INIT=32'hCACAFF00;
// @8:59
  LUT6 \output_a1_0_cZ[2]  (
	.I0(input_reg[2]),
	.I1(ret_val_ss0),
	.I2(ret_val_d_a1[1]),
	.I3(N_458),
	.I4(ret_val_d_a0[1]),
	.I5(N_454),
	.O(output_a1_0[2])
);
defparam \output_a1_0_cZ[2] .INIT=64'h1155115055555050;
// @8:60
  LUT6 \un26_output_0_iv[3]  (
	.I0(input_reg[2]),
	.I1(un9_0_axb_8),
	.I2(un20_output_2[14]),
	.I3(input_m_0[3]),
	.I4(shift_amount_1[1]),
	.I5(un26_output_0_iv_0[3]),
	.O(un26_output_2)
);
defparam \un26_output_0_iv[3] .INIT=64'hFFFFFFFF0000FF20;
// @8:60
  LUT6 \un26_output_0_iv_2_0_RNIASV9C[5]  (
	.I0(input_reg[2]),
	.I1(un9_0_axb_8),
	.I2(un26_output_0_iv_2_0[5]),
	.I3(un26_m3_i_0),
	.I4(input_m_0[3]),
	.I5(shift_amount_1[1]),
	.O(un26_output_4)
);
defparam \un26_output_0_iv_2_0_RNIASV9C[5] .INIT=64'hFFFFFF22FFF0FFF0;
// @8:60
  LUT6 \un26_output_0_iv[4]  (
	.I0(input_reg[3]),
	.I1(un9_0_axb_8),
	.I2(un20_output_2[14]),
	.I3(input_m_s[4]),
	.I4(un26_output_0_iv_2_a0[4]),
	.I5(shift_amount_1[1]),
	.O(un26_output_3)
);
defparam \un26_output_0_iv[4] .INIT=64'h0000FFFFFF20FF2F;
  LUT6 \un22_output_0_RNIKL1V6[3]  (
	.I0(input_reg[5]),
	.I1(input_reg[6]),
	.I2(un9_0_axb_8),
	.I3(un20_output_2[14]),
	.I4(N_45),
	.I5(shift_amount_1[1]),
	.O(N_70)
);
defparam \un22_output_0_RNIKL1V6[3] .INIT=64'hAC00AC00FF000000;
  LUT6 \un22_output_xx_mm[6]  (
	.I0(input_reg[9]),
	.I1(input_reg[8]),
	.I2(input_reg[7]),
	.I3(input_reg[6]),
	.I4(un9_0_axb_8),
	.I5(shift_amount_1[1]),
	.O(N_73)
);
defparam \un22_output_xx_mm[6] .INIT=64'hCCCCAAAAFF00F0F0;
  LUT6 \un22_output_0_RNINO1V6[4]  (
	.I0(input_reg[7]),
	.I1(input_reg[6]),
	.I2(un9_0_axb_8),
	.I3(un20_output_2[14]),
	.I4(N_46),
	.I5(shift_amount_1[1]),
	.O(N_71)
);
defparam \un22_output_0_RNINO1V6[4] .INIT=64'hCACACACAFF000000;
// @8:60
  LUT4 \un26_output_0_iv_2_RNO_1[6]  (
	.I0(input_reg[1]),
	.I1(ret_val[3]),
	.I2(ret_val[1]),
	.I3(un9_0_axb_8),
	.O(input_m_4[1])
);
defparam \un26_output_0_iv_2_RNO_1[6] .INIT=16'h0008;
// @8:60
  LUT4 \input_m_1_s[4]  (
	.I0(input_reg[4]),
	.I1(ret_val[2]),
	.I2(ret_val[1]),
	.I3(un9_0_axb_8),
	.O(input_m_s[4])
);
defparam \input_m_1_s[4] .INIT=16'h2A00;
// @8:60
  LUT4_L \un26_output_0_iv_2_a0_RNO[4]  (
	.I0(input_reg[0]),
	.I1(ret_val[2]),
	.I2(ret_val[1]),
	.I3(un9_0_axb_8),
	.LO(input_m_2[0])
);
defparam \un26_output_0_iv_2_a0_RNO[4] .INIT=16'h8000;
// @8:60
  LUT4 \un26_output_0_iv_2_RNO[6]  (
	.I0(input_reg[2]),
	.I1(ret_val[2]),
	.I2(ret_val[1]),
	.I3(un9_0_axb_8),
	.O(input_m_3[2])
);
defparam \un26_output_0_iv_2_RNO[6] .INIT=16'h8000;
// @8:60
  LUT5_L \un26_output_0_iv_0_cZ[3]  (
	.I0(input_reg[0]),
	.I1(input_reg[1]),
	.I2(un9_0_axb_8),
	.I3(un20_output_2[14]),
	.I4(shift_amount_1[1]),
	.LO(un26_output_0_iv_0[3])
);
defparam \un26_output_0_iv_0_cZ[3] .INIT=32'hCA000000;
// @8:60
  LUT5 \un26_output_0_iv_2_a0_cZ[4]  (
	.I0(input_reg[1]),
	.I1(input_reg[2]),
	.I2(un9_0_axb_8),
	.I3(un20_output_2[14]),
	.I4(input_m_2[0]),
	.O(un26_output_0_iv_2_a0[4])
);
defparam \un26_output_0_iv_2_a0_cZ[4] .INIT=32'h000035FF;
// @8:60
  LUT5 \un26_output_0_iv[1]  (
	.I0(input_reg[0]),
	.I1(input_reg[1]),
	.I2(un9_0_axb_8),
	.I3(un20_output_0_0_a2_0_0),
	.I4(shift_amount_1[1]),
	.O(un26_output_0)
);
defparam \un26_output_0_iv[1] .INIT=32'h0000CA00;
// @8:60
  LUT5 \un26_output_0_iv_0[7]  (
	.I0(N_443),
	.I1(N_445),
	.I2(un26_output_0_iv_0_a2_xx[7]),
	.I3(un26_output_0_iv_0_a2_yy[7]),
	.I4(shift_amount_1[1]),
	.O(un26_output_6)
);
defparam \un26_output_0_iv_0[7] .INIT=32'hFFAAFCFC;
// @23:226
  LUT5 \output_RNI1PDK2[6]  (
	.I0(un9_0_axb_8),
	.I1(un3_shift_right),
	.I2(N_65),
	.I3(un26_output_6),
	.I4(input_shifted_4),
	.O(un1_poly_odd_i[6])
);
defparam \output_RNI1PDK2[6] .INIT=32'hF7D5A280;
// @8:59
  LUT3 \un22_output_0[3]  (
	.I0(input_reg[3]),
	.I1(input_reg[4]),
	.I2(un9_0_axb_8),
	.O(N_45)
);
defparam \un22_output_0[3] .INIT=8'hAC;
// @8:59
  LUT3 \un22_output_0[4]  (
	.I0(input_reg[4]),
	.I1(input_reg[5]),
	.I2(un9_0_axb_8),
	.O(N_46)
);
defparam \un22_output_0[4] .INIT=8'hAC;
// @8:60
  LUT3 \un26_output_0_iv_0_m2_4[7]  (
	.I0(input_reg[7]),
	.I1(input_reg[6]),
	.I2(un9_0_axb_8),
	.O(N_445)
);
defparam \un26_output_0_iv_0_m2_4[7] .INIT=8'hAC;
// @8:60
  LUT3 \un26_output_0_iv_0_m2_2[7]  (
	.I0(input_reg[4]),
	.I1(input_reg[5]),
	.I2(un9_0_axb_8),
	.O(N_443)
);
defparam \un26_output_0_iv_0_m2_2[7] .INIT=8'hCA;
// @8:59
  LUT6 un20_output_0_2_a0_0_0 (
	.I0(input_reg[9]),
	.I1(input_reg[8]),
	.I2(input_reg[7]),
	.I3(input_reg[10]),
	.I4(input_reg[11]),
	.I5(input_reg[6]),
	.O(un20_output_0_2_a0_0)
);
defparam un20_output_0_2_a0_0_0.INIT=64'h0000000000000001;
// @8:60
  LUT6 \un26_output_0_iv_2_RNO_2[6]  (
	.I0(input_reg[0]),
	.I1(input_reg[7]),
	.I2(input_reg[11]),
	.I3(input_reg[6]),
	.I4(un4_overflow_2),
	.I5(N_441),
	.O(input_m_4_a0_0[0])
);
defparam \un26_output_0_iv_2_RNO_2[6] .INIT=64'hAAAAAAAAA0A2A0A0;
// @8:60
  LUT4 \un26_output_0_iv_2_RNO_0[6]  (
	.I0(input_m_4_a0_0[0]),
	.I1(ret_val[3]),
	.I2(ret_val[1]),
	.I3(un9_0_axb_8),
	.O(input_m_4[0])
);
defparam \un26_output_0_iv_2_RNO_0[6] .INIT=16'h0800;
// @8:59
  LUT6 \output_0_2_cZ[2]  (
	.I0(input_reg[0]),
	.I1(input_reg[1]),
	.I2(ret_val[2]),
	.I3(output_a1_0[2]),
	.I4(ret_val[3]),
	.I5(un9_0_axb_8),
	.O(output_0_2[2])
);
defparam \output_0_2_cZ[2] .INIT=64'h000000AF0000CFCF;
// @8:60
  LUT6 un26_m3_i_0_cZ (
	.I0(input_reg[0]),
	.I1(input_reg[1]),
	.I2(ret_val[2]),
	.I3(ret_val[3]),
	.I4(ret_val[1]),
	.I5(un9_0_axb_8),
	.O(un26_m3_i_0)
);
defparam un26_m3_i_0_cZ.INIT=64'h00C0000000000A00;
// @8:60
  LUT6 \un26_output_0_iv_0_a2_yy_cZ[7]  (
	.I0(input_reg[0]),
	.I1(input_reg[1]),
	.I2(ret_val[2]),
	.I3(ret_val[3]),
	.I4(ret_val[1]),
	.I5(un9_0_axb_8),
	.O(un26_output_0_iv_0_a2_yy[7])
);
defparam \un26_output_0_iv_0_a2_yy_cZ[7] .INIT=64'h00C00C000A000A00;
// @8:60
  LUT6 \un26_output_0_iv_0_a2_xx_cZ[7]  (
	.I0(input_reg[2]),
	.I1(input_reg[3]),
	.I2(ret_val[2]),
	.I3(ret_val[3]),
	.I4(ret_val[1]),
	.I5(un9_0_axb_8),
	.O(un26_output_0_iv_0_a2_xx[7])
);
defparam \un26_output_0_iv_0_a2_xx_cZ[7] .INIT=64'h00C00C000A000A00;
// @8:59
  LUT6 \un22_output_2[7]  (
	.I0(input_reg[9]),
	.I1(input_reg[8]),
	.I2(input_reg[7]),
	.I3(input_reg[10]),
	.I4(un9_0_axb_8),
	.I5(shift_amount_1[1]),
	.O(N_65)
);
defparam \un22_output_2[7] .INIT=64'hAAAAFF00F0F0CCCC;
// @8:59
  LUT6 \output_0[2]  (
	.I0(input_reg[3]),
	.I1(ret_val[2]),
	.I2(ret_val[1]),
	.I3(un9_0_axb_8),
	.I4(output_0_2[2]),
	.I5(N_46),
	.O(input_shifted_0)
);
defparam \output_0[2] .INIT=64'h3F2F00003C2C0000;
// @8:60
  LUT6 \un26_output_0_iv_2[6]  (
	.I0(input_reg[5]),
	.I1(un20_output_3_0_0_a2_s),
	.I2(input_m_3[2]),
	.I3(input_m_4[0]),
	.I4(input_m_4[1]),
	.I5(shift_amount_1[1]),
	.O(un26_output_0_iv_2_0_1)
);
defparam \un26_output_0_iv_2[6] .INIT=64'hFFFFFFF0FFFFFFF8;
// @8:59
  LUT3 \output[5]  (
	.I0(un3_shift_right),
	.I1(N_72),
	.I2(un26_output_4),
	.O(input_shifted_3)
);
defparam \output[5] .INIT=8'hD8;
// @8:59
  LUT4 \output[6]  (
	.I0(un3_shift_right),
	.I1(N_73),
	.I2(un26_output_0_iv_3[6]),
	.I3(un26_output_0_iv_2_0_1),
	.O(input_shifted_4)
);
defparam \output[6] .INIT=16'hDDD8;
  LUT5 \output_RNIOO962[5]  (
	.I0(un9_0_axb_8),
	.I1(input_shifted_3),
	.I2(un1_input_shifted[4]),
	.I3(un1_poly_odd[8]),
	.I4(input_shifted_4),
	.O(un9_0_axb_4)
);
defparam \output_RNIOO962[5] .INIT=32'hEBB1411B;
  GND GND_cZ (
	.G(GND)
);
  VCC VCC_cZ (
	.P(VCC)
);
// @8:59
  LUT3 \un22_output_0_lut6_2_o6[5]  (
	.I0(input_reg[5]),
	.I1(input_reg[6]),
	.I2(un9_0_axb_8),
	.O(N_47)
);
defparam \un22_output_0_lut6_2_o6[5] .INIT=8'hAC;
// @8:59
  LUT3 \un22_output_0_lut6_2_o5[5]  (
	.I0(ret_val[3]),
	.I1(ret_val[1]),
	.I2(un9_0_axb_8),
	.O(N_100_i)
);
defparam \un22_output_0_lut6_2_o5[5] .INIT=8'h7F;
// @8:59
  LUT3 un20_output_0_0_a2_0_0_lut6_2_o6 (
	.I0(ret_val[2]),
	.I1(ret_val[3]),
	.I2(ret_val[1]),
	.O(un20_output_0_0_a2_0_0)
);
defparam un20_output_0_0_a2_0_0_lut6_2_o6.INIT=8'h13;
// @8:59
  LUT4 un20_output_0_0_a2_0_0_lut6_2_o5 (
	.I0(ret_val[2]),
	.I1(ret_val[3]),
	.I2(ret_val[1]),
	.I3(un9_0_axb_8),
	.O(un20_output_0_0_a2_0_0_lut6_2_O5)
);
defparam un20_output_0_0_a2_0_0_lut6_2_o5.INIT=16'h2444;
endmodule