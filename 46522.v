module inv_sqrt (
  out_inner_prod_r,
  out_inv_sqrt_9,
  out_inv_sqrt_10,
  out_inv_sqrt_8,
  out_inv_sqrt_7,
  out_inv_sqrt_2,
  out_inv_sqrt_1,
  out_inv_sqrt_11,
  out_inv_sqrt_0,
  done_inv_sqrt,
  clk,
  rst,
  start_inv_sqrt,
  N_434_i,
  N_431_i,
  N_428_i,
  N_425_i
)
;
input [11:0] out_inner_prod_r ;
output out_inv_sqrt_9 ;
output out_inv_sqrt_10 ;
output out_inv_sqrt_8 ;
output out_inv_sqrt_7 ;
output out_inv_sqrt_2 ;
output out_inv_sqrt_1 ;
output out_inv_sqrt_11 ;
output out_inv_sqrt_0 ;
output done_inv_sqrt ;
input clk ;
input rst ;
input start_inv_sqrt ;
output N_434_i ;
output N_431_i ;
output N_428_i ;
output N_425_i ;
wire out_inv_sqrt_9 ;
wire out_inv_sqrt_10 ;
wire out_inv_sqrt_8 ;
wire out_inv_sqrt_7 ;
wire out_inv_sqrt_2 ;
wire out_inv_sqrt_1 ;
wire out_inv_sqrt_11 ;
wire out_inv_sqrt_0 ;
wire done_inv_sqrt ;
wire clk ;
wire rst ;
wire start_inv_sqrt ;
wire N_434_i ;
wire N_431_i ;
wire N_428_i ;
wire N_425_i ;
wire [2:2] ret_val_m10;
wire [3:1] ret_val;
wire [11:11] un1_poly_odd_s_lut6_2_O6;
wire [11:0] input_reg;
wire [3:0] counter;
wire [0:0] state;
wire [3:1] counter_4;
wire [11:0] un14_pos_outputf;
wire [11:0] pre_outputf;
wire [1:1] out_shift_amount;
wire [6:5] un7_output_2_1;
wire [6:5] un11_output;
wire [11:0] pre_output;
wire [7:1] un26_output;
wire [7:4] un1_input_shifted;
wire [0:0] state_i;
wire [11:1] un14_pos_output;
wire [9:9] un11_output_6_d_0;
wire [11:0] z_5;
wire [3:3] ret_val_m2;
wire [1:1] ret_val_d_a1;
wire [1:1] ret_val_d_a0;
wire [10:7] un1_poly_odd;
wire [10:9] un7;
wire [6:2] input_shifted;
wire [0:0] ret_val_d_0;
wire [1:1] shift_amount_1;
wire [2:2] shift_amount_1_i;
wire [11:11] z_5_i;
wire [19:9] un8_rnd_out_un0_P;
wire [23:23] pre_out;
wire [14:14] un20_output_2;
wire [11:11] un1_poly_odd_d;
wire [6:6] un26_output_0_iv_3;
wire [6:6] un26_output_0_iv_2_0;
wire [4:4] output_d;
wire [6:6] un7_output_2_0_0;
wire [6:6] un1_poly_odd_i;
wire [11:0] mult1_out;
wire [11:0] mult2_out;
wire N_454 ;
wire un3_shift_right_c2_0_0_a0_1 ;
wire un9_0_axb_8 ;
wire VCC ;
wire m9_a1_1 ;
wire GND ;
wire N_439 ;
wire done ;
wire output_reg_pipe_11 ;
wire N_419 ;
wire un3_shift_right ;
wire z_5_axb_5 ;
wire N_71 ;
wire N_50_i ;
wire output_reg_pipe_12_RNIPJ901_O6 ;
wire N_420 ;
wire output_reg_pipe_17 ;
wire z_axb_0_i ;
wire un9_0_s_2 ;
wire m9_0_0 ;
wire CO1 ;
wire N_62 ;
wire z_5_8_d ;
wire N_414 ;
wire N_417 ;
wire N_33 ;
wire N_31 ;
wire z_5_axb_10 ;
wire un1_apply_nrlt8_1 ;
wire SUM1_0_i_a2_a0_1 ;
wire SUM1_0_i_1_1 ;
wire ret_val_ss0 ;
wire N_458 ;
wire N_378 ;
wire N_13_0 ;
wire N_410 ;
wire N_413 ;
wire N_18_0 ;
wire z_5_axb_7 ;
wire N_80 ;
wire N_51 ;
wire z_5_axb_3 ;
wire N_65 ;
wire un9_0_o5_2 ;
wire N_72 ;
wire un9_0_axb_1 ;
wire un9_0_o5_1 ;
wire un9_0_cry_0_RNO ;
wire N_100_i ;
wire N_79 ;
wire N_50 ;
wire z_5_axb_2 ;
wire un9_0_axb_3 ;
wire un9_0_axb_2 ;
wire ret_val_sm0 ;
wire un4_overflow_2 ;
wire get_m8_0_o4_2 ;
wire N_441 ;
wire un3_shift_right_axb0_i ;
wire un9_0_cry_0_cy ;
wire ret_val_ss3 ;
wire un4_overflow_0 ;
wire PATTERNDETECT_15 ;
wire un2_output_3 ;
wire z_axb_10 ;
wire un1_apply_nrlt7 ;
wire z_axb_9 ;
wire z_axb_8 ;
wire z_axb_7 ;
wire z_axb_6 ;
wire z_axb_5 ;
wire z_axb_4 ;
wire z_axb_3 ;
wire z_axb_2 ;
wire z_axb_1 ;
wire z_axb_0 ;
wire N_45 ;
wire N_70 ;
wire N_73 ;
wire un20_output_0_0_a2_0_0_lut6_2_O5 ;
wire z_5_axb_8 ;
wire un9_0_axb_0 ;
wire N_56 ;
wire N_49 ;
wire z_5_axb_1 ;
wire N_33_0 ;
wire z_5_axb_4 ;
wire z_5_axb_6 ;
wire z_5_axb_9 ;
wire z_5_cry_10 ;
wire z_5_cry_9 ;
wire z_5_cry_8 ;
wire z_5_cry_7 ;
wire z_5_cry_6 ;
wire z_5_cry_5 ;
wire z_5_cry_4 ;
wire z_5_cry_3 ;
wire z_5_cry_2 ;
wire z_5_cry_1 ;
wire z_5_cry_0 ;
wire z_cry_10 ;
wire z_cry_9 ;
wire z_cry_8 ;
wire z_cry_7 ;
wire z_cry_6 ;
wire z_cry_5 ;
wire z_cry_4 ;
wire z_cry_3 ;
wire z_cry_2 ;
wire z_cry_1 ;
wire z_cry_0 ;
wire un9_0_cry_7 ;
wire un9_0_s_8 ;
wire un9_0_cry_6 ;
wire un9_0_s_7 ;
wire N_2502_i ;
wire un9_0_cry_5 ;
wire un9_0_s_6 ;
wire un9_0_cry_4 ;
wire un9_0_s_5 ;
wire un9_0_axb_4 ;
wire un9_0_cry_3 ;
wire un9_0_s_4 ;
wire un9_0_cry_2 ;
wire un9_0_s_3 ;
wire un9_0_cry_1 ;
wire un9_0_cry_0 ;
wire un9_0_s_1 ;
wire un9_0_s_0 ;
  LUT4 \enabled_nr.un14_pos_output.z_5_axb_5  (
	.I0(un3_shift_right),
	.I1(un7_output_2_1[5]),
	.I2(un11_output[5]),
	.I3(pre_output[6]),
	.O(z_5_axb_5)
);
defparam \enabled_nr.un14_pos_output.z_5_axb_5 .INIT=16'h27D8;
// @23:226
  LUT4 \un1_input_shifted_cZ[7]  (
	.I0(N_71),
	.I1(un26_output[4]),
	.I2(un3_shift_right),
	.I3(un9_0_axb_8),
	.O(un1_input_shifted[7])
);
defparam \un1_input_shifted_cZ[7] .INIT=16'hFFAC;
// @23:140
  FDC done_Z (
	.Q(done_inv_sqrt),
	.D(done),
	.C(clk),
	.CLR(rst)
);
// @23:140
  FDC \counter_Z[0]  (
	.Q(counter[0]),
	.D(state_i[0]),
	.C(clk),
	.CLR(rst)
);
// @23:140
  FDC \counter_Z[1]  (
	.Q(counter[1]),
	.D(counter_4[1]),
	.C(clk),
	.CLR(rst)
);
// @23:140
  FDC \counter_Z[2]  (
	.Q(counter[2]),
	.D(counter_4[2]),
	.C(clk),
	.CLR(rst)
);
// @23:140
  FDC \counter_Z[3]  (
	.Q(counter[3]),
	.D(counter_4[3]),
	.C(clk),
	.CLR(rst)
);
// @23:140
  FDC \state_Z[0]  (
	.Q(state[0]),
	.D(N_50_i),
	.C(clk),
	.CLR(rst)
);
// @23:174
  FDE \input_reg_Z[11]  (
	.Q(input_reg[11]),
	.D(out_inner_prod_r[11]),
	.C(clk),
	.CE(start_inv_sqrt)
);
// @23:174
  FDE \input_reg_Z[10]  (
	.Q(input_reg[10]),
	.D(out_inner_prod_r[10]),
	.C(clk),
	.CE(start_inv_sqrt)
);
// @23:174
  FDE \input_reg_Z[9]  (
	.Q(input_reg[9]),
	.D(out_inner_prod_r[9]),
	.C(clk),
	.CE(start_inv_sqrt)
);
// @23:174
  FDE \input_reg_Z[8]  (
	.Q(input_reg[8]),
	.D(out_inner_prod_r[8]),
	.C(clk),
	.CE(start_inv_sqrt)
);
// @23:174
  FDE \input_reg_Z[7]  (
	.Q(input_reg[7]),
	.D(out_inner_prod_r[7]),
	.C(clk),
	.CE(start_inv_sqrt)
);
// @23:174
  FDE \input_reg_Z[6]  (
	.Q(input_reg[6]),
	.D(out_inner_prod_r[6]),
	.C(clk),
	.CE(start_inv_sqrt)
);
// @23:174
  FDE \input_reg_Z[5]  (
	.Q(input_reg[5]),
	.D(out_inner_prod_r[5]),
	.C(clk),
	.CE(start_inv_sqrt)
);
// @23:174
  FDE \input_reg_Z[4]  (
	.Q(input_reg[4]),
	.D(out_inner_prod_r[4]),
	.C(clk),
	.CE(start_inv_sqrt)
);
// @23:174
  FDE \input_reg_Z[3]  (
	.Q(input_reg[3]),
	.D(out_inner_prod_r[3]),
	.C(clk),
	.CE(start_inv_sqrt)
);
// @23:174
  FDE \input_reg_Z[2]  (
	.Q(input_reg[2]),
	.D(out_inner_prod_r[2]),
	.C(clk),
	.CE(start_inv_sqrt)
);
// @23:174
  FDE \input_reg_Z[1]  (
	.Q(input_reg[1]),
	.D(out_inner_prod_r[1]),
	.C(clk),
	.CE(start_inv_sqrt)
);
// @23:174
  FDE \input_reg_Z[0]  (
	.Q(input_reg[0]),
	.D(out_inner_prod_r[0]),
	.C(clk),
	.CE(start_inv_sqrt)
);
  FDRE output_reg_pipe_Z (
	.Q(pre_outputf[1]),
	.D(pre_output[1]),
	.C(clk),
	.R(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDSE output_reg_pipe_1_Z (
	.Q(un14_pos_outputf[1]),
	.D(un14_pos_output[1]),
	.C(clk),
	.S(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDRE output_reg_pipe_3_Z (
	.Q(pre_outputf[2]),
	.D(pre_output[2]),
	.C(clk),
	.R(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDSE output_reg_pipe_4_Z (
	.Q(un14_pos_outputf[2]),
	.D(un14_pos_output[2]),
	.C(clk),
	.S(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDRE output_reg_pipe_6_Z (
	.Q(pre_outputf[7]),
	.D(pre_output[7]),
	.C(clk),
	.R(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDSE output_reg_pipe_7_Z (
	.Q(un14_pos_outputf[7]),
	.D(un14_pos_output[7]),
	.C(clk),
	.S(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDRE output_reg_pipe_9_Z (
	.Q(pre_outputf[8]),
	.D(pre_output[8]),
	.C(clk),
	.R(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDSE output_reg_pipe_10_Z (
	.Q(un14_pos_outputf[8]),
	.D(un14_pos_output[8]),
	.C(clk),
	.S(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDSE output_reg_pipe_11_Z (
	.Q(output_reg_pipe_11),
	.D(N_420),
	.C(clk),
	.S(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDRE output_reg_pipe_12_Z (
	.Q(pre_outputf[10]),
	.D(pre_output[10]),
	.C(clk),
	.R(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDSE output_reg_pipe_13_Z (
	.Q(un14_pos_outputf[10]),
	.D(un14_pos_output[10]),
	.C(clk),
	.S(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDRE output_reg_pipe_15_Z (
	.Q(pre_outputf[11]),
	.D(pre_output[11]),
	.C(clk),
	.R(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDRE output_reg_pipe_16_Z (
	.Q(un14_pos_outputf[11]),
	.D(un14_pos_output[11]),
	.C(clk),
	.R(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDRE output_reg_pipe_17_Z (
	.Q(output_reg_pipe_17),
	.D(N_420),
	.C(clk),
	.R(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDRE output_reg_pipe_18_Z (
	.Q(pre_outputf[0]),
	.D(pre_output[0]),
	.C(clk),
	.R(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDSE output_reg_pipe_19_Z (
	.Q(un14_pos_outputf[0]),
	.D(z_axb_0_i),
	.C(clk),
	.S(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDRE output_reg_pipe_21_Z (
	.Q(pre_outputf[9]),
	.D(pre_output[9]),
	.C(clk),
	.R(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  FDSE output_reg_pipe_22_Z (
	.Q(un14_pos_outputf[9]),
	.D(un14_pos_output[9]),
	.C(clk),
	.S(output_reg_pipe_12_RNIPJ901_O6),
	.CE(done_inv_sqrt)
);
  LUT4 \enabled_nr.un14_pos_output.z_5_0_d  (
	.I0(ret_val[3]),
	.I1(m9_a1_1),
	.I2(un9_0_s_2),
	.I3(m9_0_0),
	.O(pre_output[0])
);
defparam \enabled_nr.un14_pos_output.z_5_0_d .INIT=16'h5540;
  LUT5 \enabled_nr.un14_pos_output.z_5_8_d  (
	.I0(ret_val[2]),
	.I1(ret_val[3]),
	.I2(CO1),
	.I3(un11_output_6_d_0[9]),
	.I4(N_62),
	.O(z_5_8_d)
);
defparam \enabled_nr.un14_pos_output.z_5_8_d .INIT=32'hFE24DA00;
  LUT5 \enabled_nr.un14_pos_output.z_5_axb_10  (
	.I0(ret_val[3]),
	.I1(N_414),
	.I2(N_417),
	.I3(N_33),
	.I4(N_31),
	.O(z_5_axb_10)
);
defparam \enabled_nr.un14_pos_output.z_5_axb_10 .INIT=32'h0F0FF2F8;
  LUT5 \enabled_nr.un14_pos_output.z_5_axb_0  (
	.I0(ret_val[3]),
	.I1(m9_a1_1),
	.I2(un9_0_s_2),
	.I3(m9_0_0),
	.I4(pre_output[1]),
	.O(z_5[0])
);
defparam \enabled_nr.un14_pos_output.z_5_axb_0 .INIT=32'hAABF5540;
// @23:264
  LUT4 \enabled_nr.un1_apply_nrlto7_1  (
	.I0(un3_shift_right),
	.I1(un7_output_2_1[6]),
	.I2(un11_output[6]),
	.I3(pre_output[7]),
	.O(un1_apply_nrlt8_1)
);
defparam \enabled_nr.un1_apply_nrlto7_1 .INIT=16'hD800;
// @23:99
  LUT6 \get_leading_zeros.ret_val[3]  (
	.I0(input_reg[3]),
	.I1(input_reg[4]),
	.I2(input_reg[5]),
	.I3(input_reg[6]),
	.I4(ret_val_m2[3]),
	.I5(N_454),
	.O(ret_val[3])
);
defparam \get_leading_zeros.ret_val[3] .INIT=64'h0003000200000000;
// @23:201
  LUT6 \input_reg_RNIS93U1[4]  (
	.I0(input_reg[4]),
	.I1(input_reg[5]),
	.I2(input_reg[10]),
	.I3(input_reg[11]),
	.I4(ret_val_m2[3]),
	.I5(SUM1_0_i_a2_a0_1),
	.O(SUM1_0_i_1_1)
);
defparam \input_reg_RNIS93U1[4] .INIT=64'hFFF0FFF1FFF0FFF0;
// @23:236
  LUT6 \get_leading_zeros.ret_val_d_a0_RNID7JG2[1]  (
	.I0(ret_val_ss0),
	.I1(ret_val_d_a1[1]),
	.I2(N_458),
	.I3(ret_val_d_a0[1]),
	.I4(N_454),
	.I5(un9_0_axb_8),
	.O(N_378)
);
defparam \get_leading_zeros.ret_val_d_a0_RNID7JG2[1] .INIT=64'h5F5CFFCCA0A30033;
// @23:201
  LUT6 \get_leading_zeros.ret_val_d_a0_RNID7JG2_0[1]  (
	.I0(ret_val_ss0),
	.I1(ret_val_d_a1[1]),
	.I2(N_458),
	.I3(ret_val_d_a0[1]),
	.I4(N_454),
	.I5(un9_0_axb_8),
	.O(CO1)
);
defparam \get_leading_zeros.ret_val_d_a0_RNID7JG2_0[1] .INIT=64'h5F5CFFCC00000000;
  LUT6 \enabled_nr.un14_pos_output.z_5_axb_7  (
	.I0(ret_val[3]),
	.I1(CO1),
	.I2(N_13_0),
	.I3(N_410),
	.I4(N_413),
	.I5(N_18_0),
	.O(z_5_axb_7)
);
defparam \enabled_nr.un14_pos_output.z_5_axb_7 .INIT=64'h08807FF77FF70880;
  LUT6 \enabled_nr.un14_pos_output.z_5_axb_3  (
	.I0(ret_val[3]),
	.I1(CO1),
	.I2(un3_shift_right),
	.I3(N_80),
	.I4(N_51),
	.I5(pre_output[4]),
	.O(z_5_axb_3)
);
defparam \enabled_nr.un14_pos_output.z_5_axb_3 .INIT=64'h080FF8FFF7F00700;
// @23:226
  LUT6 un9_0_o5_2_cZ (
	.I0(un9_0_axb_8),
	.I1(un3_shift_right),
	.I2(N_65),
	.I3(un26_output[7]),
	.I4(un1_input_shifted[5]),
	.I5(un1_poly_odd[9]),
	.O(un9_0_o5_2)
);
defparam un9_0_o5_2_cZ.INIT=64'hFFFF5D7F5D7F0000;
// @23:226
  LUT6 un9_0_axb_1_cZ (
	.I0(un9_0_axb_8),
	.I1(un3_shift_right),
	.I2(N_72),
	.I3(un26_output[5]),
	.I4(un7[10]),
	.I5(un1_poly_odd[10]),
	.O(un9_0_axb_1)
);
defparam un9_0_axb_1_cZ.INIT=64'h5140AEBFAEBF5140;
// @23:226
  LUT6 un9_0_o5_1_cZ (
	.I0(un9_0_axb_8),
	.I1(un3_shift_right),
	.I2(N_72),
	.I3(un26_output[5]),
	.I4(un7[10]),
	.I5(un1_poly_odd[10]),
	.O(un9_0_o5_1)
);
defparam un9_0_o5_1_cZ.INIT=64'hFFFF514051400000;
  LUT4 un9_0_cry_0_RNO_cZ (
	.I0(un9_0_axb_8),
	.I1(un3_shift_right),
	.I2(N_72),
	.I3(un26_output[5]),
	.O(un9_0_cry_0_RNO)
);
defparam un9_0_cry_0_RNO_cZ.INIT=16'h082A;
  LUT5 un9_0_cry_4_RNO (
	.I0(un9_0_axb_8),
	.I1(un3_shift_right),
	.I2(N_72),
	.I3(un26_output[5]),
	.I4(input_shifted[6]),
	.O(un1_poly_odd[7])
);
defparam un9_0_cry_4_RNO.INIT=32'h0415AEBF;
  LUT6 \enabled_nr.un14_pos_output.z_5_axb_2  (
	.I0(N_100_i),
	.I1(un3_shift_right),
	.I2(N_79),
	.I3(N_50),
	.I4(N_80),
	.I5(N_51),
	.O(z_5_axb_2)
);
defparam \enabled_nr.un14_pos_output.z_5_axb_2 .INIT=64'h02CE20ECCE02EC20;
// @23:226
  LUT6 un9_0_axb_3_cZ (
	.I0(un9_0_axb_8),
	.I1(un1_input_shifted[4]),
	.I2(un7[9]),
	.I3(un1_poly_odd[8]),
	.I4(un1_input_shifted[5]),
	.I5(un1_poly_odd[9]),
	.O(un9_0_axb_3)
);
defparam un9_0_axb_3_cZ.INIT=64'h6699699669969966;
// @23:226
  LUT6 un9_0_axb_2_cZ (
	.I0(un1_input_shifted[6]),
	.I1(un7[9]),
	.I2(un1_input_shifted[5]),
	.I3(un7[10]),
	.I4(un1_poly_odd[10]),
	.I5(un1_poly_odd[9]),
	.O(un9_0_axb_2)
);
defparam un9_0_axb_2_cZ.INIT=64'h3C6969C3C396963C;
// @23:99
  LUT6 \get_leading_zeros.ret_val_m2s2_RNILJ2K1_0  (
	.I0(ret_val_sm0),
	.I1(un4_overflow_2),
	.I2(get_m8_0_o4_2),
	.I3(ret_val_ss0),
	.I4(N_441),
	.I5(ret_val_d_0[0]),
	.O(un3_shift_right_axb0_i)
);
defparam \get_leading_zeros.ret_val_m2s2_RNILJ2K1_0 .INIT=64'h00000408FFFFF7FB;
// @23:226
  MUXCY_L un9_0_cry_0_cy_cZ (
	.DI(GND),
	.CI(VCC),
	.S(un1_input_shifted[7]),
	.LO(un9_0_cry_0_cy)
);
// @23:99
  LUT5 \get_leading_zeros.ret_val[1]  (
	.I0(ret_val_ss0),
	.I1(ret_val_d_a1[1]),
	.I2(N_458),
	.I3(ret_val_d_a0[1]),
	.I4(N_454),
	.O(ret_val[1])
);
defparam \get_leading_zeros.ret_val[1] .INIT=32'h5F5CFFCC;
// @23:201
  LUT4 \get_leading_zeros.ret_vals2_i_a2_RNI12FC4  (
	.I0(N_454),
	.I1(SUM1_0_i_1_1),
	.I2(ret_val[1]),
	.I3(un9_0_axb_8),
	.O(shift_amount_1[1])
);
defparam \get_leading_zeros.ret_vals2_i_a2_RNI12FC4 .INIT=16'hCFEC;
// @23:201
  LUT5 \op_lt.op_lt.un3_shift_right_c2_0_0_a0_1_RNIHAV73  (
	.I0(N_454),
	.I1(un3_shift_right_c2_0_0_a0_1),
	.I2(ret_val[2]),
	.I3(ret_val[1]),
	.I4(un9_0_axb_8),
	.O(shift_amount_1_i[2])
);
defparam \op_lt.op_lt.un3_shift_right_c2_0_0_a0_1_RNIHAV73 .INIT=32'h0F7D7D7D;
// @23:226
  LUT4 \un1_input_shifted_cZ[4]  (
	.I0(un9_0_axb_8),
	.I1(un3_shift_right),
	.I2(N_65),
	.I3(un26_output[7]),
	.O(un1_input_shifted[4])
);
defparam \un1_input_shifted_cZ[4] .INIT=16'hFBEA;
// @23:226
  LUT4 \un7_cZ[9]  (
	.I0(un9_0_axb_8),
	.I1(un3_shift_right),
	.I2(N_65),
	.I3(un26_output[7]),
	.O(un7[9])
);
defparam \un7_cZ[9] .INIT=16'h5D7F;
// @26:414
  LUT1_L \enabled_nr.un14_pos_output.z_s_11_RNO  (
	.I0(z_5[11]),
	.LO(z_5_i[11])
);
defparam \enabled_nr.un14_pos_output.z_s_11_RNO .INIT=2'h1;
// @23:99
  LUT2 \get_leading_zeros.ret_val_m2s2  (
	.I0(input_reg[1]),
	.I1(input_reg[2]),
	.O(ret_val_sm0)
);
defparam \get_leading_zeros.ret_val_m2s2 .INIT=4'hE;
// @6:277
  LUT2 \op_lt.op_lt.un4_overflowlto11_2  (
	.I0(input_reg[4]),
	.I1(input_reg[5]),
	.O(un4_overflow_2)
);
defparam \op_lt.op_lt.un4_overflowlto11_2 .INIT=4'h1;
// @23:140
  LUT1_L \counter_RNO[0]  (
	.I0(state[0]),
	.LO(state_i[0])
);
defparam \counter_RNO[0] .INIT=2'h1;
// @23:287
  LUT3 \pos_output_0[11]  (
	.I0(un14_pos_outputf[11]),
	.I1(output_reg_pipe_17),
	.I2(pre_outputf[11]),
	.O(out_inv_sqrt_11)
);
defparam \pos_output_0[11] .INIT=8'hB8;
// @23:287
  LUT3 \pos_output_0[0]  (
	.I0(un14_pos_outputf[0]),
	.I1(pre_outputf[0]),
	.I2(output_reg_pipe_11),
	.O(out_inv_sqrt_0)
);
defparam \pos_output_0[0] .INIT=8'hAC;
// @23:99
  LUT4 \input_reg_RNI6Q9J[3]  (
	.I0(input_reg[3]),
	.I1(input_reg[7]),
	.I2(input_reg[11]),
	.I3(input_reg[6]),
	.O(get_m8_0_o4_2)
);
defparam \input_reg_RNI6Q9J[3] .INIT=16'hFFFE;
// @23:99
  LUT4 \get_leading_zeros.ret_val_m10_0_a2_0[2]  (
	.I0(input_reg[3]),
	.I1(input_reg[4]),
	.I2(input_reg[5]),
	.I3(input_reg[6]),
	.O(N_458)
);
defparam \get_leading_zeros.ret_val_m10_0_a2_0[2] .INIT=16'h0001;
  LUT3 \input_reg_RNIUHJH[0]  (
	.I0(input_reg[0]),
	.I1(input_reg[1]),
	.I2(input_reg[2]),
	.O(ret_val_m2[3])
);
defparam \input_reg_RNIUHJH[0] .INIT=8'hFE;
// @23:99
  LUT4 \get_leading_zeros.ret_val_d_a1[1]  (
	.I0(input_reg[9]),
	.I1(input_reg[8]),
	.I2(input_reg[10]),
	.I3(input_reg[11]),
	.O(ret_val_d_a1[1])
);
defparam \get_leading_zeros.ret_val_d_a1[1] .INIT=16'h000E;
// @23:99
  LUT3 \get_leading_zeros.ret_val_m10_0_o2_0[2]  (
	.I0(input_reg[9]),
	.I1(input_reg[8]),
	.I2(input_reg[10]),
	.O(N_441)
);
defparam \get_leading_zeros.ret_val_m10_0_o2_0[2] .INIT=8'hFE;
// @23:99
  LUT3_L \get_leading_zeros.ret_val_ss3_0  (
	.I0(input_reg[4]),
	.I1(input_reg[5]),
	.I2(input_reg[6]),
	.LO(ret_val_ss3)
);
defparam \get_leading_zeros.ret_val_ss3_0 .INIT=8'hF2;
// @23:99
  LUT3 \get_leading_zeros.ret_val_ss0  (
	.I0(input_reg[0]),
	.I1(input_reg[1]),
	.I2(input_reg[2]),
	.O(ret_val_ss0)
);
defparam \get_leading_zeros.ret_val_ss0 .INIT=8'hF1;
// @23:140
  LUT3_L \state_RNO[0]  (
	.I0(counter[3]),
	.I1(state[0]),
	.I2(start_inv_sqrt),
	.LO(N_50_i)
);
defparam \state_RNO[0] .INIT=8'h74;
// @23:201
  LUT5_L \input_reg_RNIE5CT[9]  (
	.I0(input_reg[9]),
	.I1(input_reg[8]),
	.I2(input_reg[3]),
	.I3(input_reg[7]),
	.I4(input_reg[6]),
	.LO(SUM1_0_i_a2_a0_1)
);
defparam \input_reg_RNIE5CT[9] .INIT=32'h00000001;
// @23:99
  LUT5 \get_leading_zeros.ret_vals2_i_a2  (
	.I0(input_reg[9]),
	.I1(input_reg[8]),
	.I2(input_reg[7]),
	.I3(input_reg[10]),
	.I4(input_reg[11]),
	.O(N_454)
);
defparam \get_leading_zeros.ret_vals2_i_a2 .INIT=32'h00000001;
// @23:99
  LUT6 \get_leading_zeros.ret_val_d_a0[1]  (
	.I0(input_reg[4]),
	.I1(input_reg[5]),
	.I2(input_reg[7]),
	.I3(input_reg[10]),
	.I4(input_reg[11]),
	.I5(input_reg[6]),
	.O(ret_val_d_a0[1])
);
defparam \get_leading_zeros.ret_val_d_a0[1] .INIT=64'h000000000000000E;
// @6:277
  LUT6 \op_lt.op_lt.un4_overflowlto11_0  (
	.I0(input_reg[2]),
	.I1(input_reg[3]),
	.I2(input_reg[7]),
	.I3(input_reg[6]),
	.I4(N_439),
	.I5(un4_overflow_2),
	.O(un4_overflow_0)
);
defparam \op_lt.op_lt.un4_overflowlto11_0 .INIT=64'h0000000100000000;
// @23:99
  LUT6 \get_leading_zeros.ret_val_d_0[0]  (
	.I0(input_reg[9]),
	.I1(input_reg[8]),
	.I2(input_reg[7]),
	.I3(input_reg[10]),
	.I4(input_reg[11]),
	.I5(ret_val_ss3),
	.O(ret_val_d_0[0])
);
defparam \get_leading_zeros.ret_val_d_0[0] .INIT=64'h0000FF450000FF44;
// @23:99
  LUT6 \get_leading_zeros.ret_val[2]  (
	.I0(input_reg[4]),
	.I1(input_reg[5]),
	.I2(input_reg[7]),
	.I3(input_reg[11]),
	.I4(input_reg[6]),
	.I5(N_441),
	.O(ret_val[2])
);
defparam \get_leading_zeros.ret_val[2] .INIT=64'h0000000000FF00FE;
// @6:277
  LUT6 \op_lt.op_lt.un3_shift_right_c2_0_0_a0_1  (
	.I0(input_reg[3]),
	.I1(input_reg[7]),
	.I2(input_reg[6]),
	.I3(un4_overflow_2),
	.I4(ret_val_m2[3]),
	.I5(N_441),
	.O(un3_shift_right_c2_0_0_a0_1)
);
defparam \op_lt.op_lt.un3_shift_right_c2_0_0_a0_1 .INIT=64'h00000F0000000D00;
// @26:414
  LUT5_L \enabled_nr.un14_pos_output.z_5_s_10_RNIMG3R  (
	.I0(z_5[10]),
	.I1(un8_rnd_out_un0_P[19]),
	.I2(pre_out[23]),
	.I3(PATTERNDETECT_15),
	.I4(un2_output_3),
	.LO(z_axb_10)
);
defparam \enabled_nr.un14_pos_output.z_5_s_10_RNIMG3R .INIT=32'h99A995A5;
// @23:264
  LUT6 \enabled_nr.un1_apply_nrlto5  (
	.I0(pre_output[0]),
	.I1(pre_output[1]),
	.I2(pre_output[2]),
	.I3(pre_output[4]),
	.I4(pre_output[3]),
	.I5(pre_output[5]),
	.O(un1_apply_nrlt7)
);
defparam \enabled_nr.un1_apply_nrlto5 .INIT=64'hFFFFFFFFFF00E000;
// @23:99
  LUT6 \get_leading_zeros.ret_val_m2s2_RNILJ2K1  (
	.I0(ret_val_sm0),
	.I1(un4_overflow_2),
	.I2(get_m8_0_o4_2),
	.I3(ret_val_ss0),
	.I4(N_441),
	.I5(ret_val_d_0[0]),
	.O(un9_0_axb_8)
);
defparam \get_leading_zeros.ret_val_m2s2_RNILJ2K1 .INIT=64'hFFFFFBF700000804;
// @26:414
  LUT5_L \enabled_nr.un14_pos_output.z_5_s_9_RNIESNT  (
	.I0(z_5[9]),
	.I1(un8_rnd_out_un0_P[18]),
	.I2(pre_out[23]),
	.I3(PATTERNDETECT_15),
	.I4(un2_output_3),
	.LO(z_axb_9)
);
defparam \enabled_nr.un14_pos_output.z_5_s_9_RNIESNT .INIT=32'h99599A5A;
// @26:414
  LUT5_L \enabled_nr.un14_pos_output.z_5_s_8_RNIDSNT  (
	.I0(z_5[8]),
	.I1(un8_rnd_out_un0_P[17]),
	.I2(pre_out[23]),
	.I3(PATTERNDETECT_15),
	.I4(un2_output_3),
	.LO(z_axb_8)
);
defparam \enabled_nr.un14_pos_output.z_5_s_8_RNIDSNT .INIT=32'h99599A5A;
// @26:414
  LUT5_L \enabled_nr.un14_pos_output.z_5_s_7_RNICSNT  (
	.I0(z_5[7]),
	.I1(un8_rnd_out_un0_P[16]),
	.I2(pre_out[23]),
	.I3(PATTERNDETECT_15),
	.I4(un2_output_3),
	.LO(z_axb_7)
);
defparam \enabled_nr.un14_pos_output.z_5_s_7_RNICSNT .INIT=32'h99599A5A;
// @26:414
  LUT5_L \enabled_nr.un14_pos_output.z_5_s_6_RNIBSNT  (
	.I0(z_5[6]),
	.I1(un8_rnd_out_un0_P[15]),
	.I2(pre_out[23]),
	.I3(PATTERNDETECT_15),
	.I4(un2_output_3),
	.LO(z_axb_6)
);
defparam \enabled_nr.un14_pos_output.z_5_s_6_RNIBSNT .INIT=32'h99599A5A;
// @26:414
  LUT5_L \enabled_nr.un14_pos_output.z_5_s_5_RNIASNT  (
	.I0(z_5[5]),
	.I1(un8_rnd_out_un0_P[14]),
	.I2(pre_out[23]),
	.I3(PATTERNDETECT_15),
	.I4(un2_output_3),
	.LO(z_axb_5)
);
defparam \enabled_nr.un14_pos_output.z_5_s_5_RNIASNT .INIT=32'h99599A5A;
// @26:414
  LUT5_L \enabled_nr.un14_pos_output.z_5_s_4_RNI9SNT  (
	.I0(z_5[4]),
	.I1(un8_rnd_out_un0_P[13]),
	.I2(pre_out[23]),
	.I3(PATTERNDETECT_15),
	.I4(un2_output_3),
	.LO(z_axb_4)
);
defparam \enabled_nr.un14_pos_output.z_5_s_4_RNI9SNT .INIT=32'h99599A5A;
// @26:414
  LUT5_L \enabled_nr.un14_pos_output.z_5_s_3_RNI8SNT  (
	.I0(z_5[3]),
	.I1(un8_rnd_out_un0_P[12]),
	.I2(pre_out[23]),
	.I3(PATTERNDETECT_15),
	.I4(un2_output_3),
	.LO(z_axb_3)
);
defparam \enabled_nr.un14_pos_output.z_5_s_3_RNI8SNT .INIT=32'h99599A5A;
// @26:414
  LUT5_L \enabled_nr.un14_pos_output.z_5_s_2_RNI7SNT  (
	.I0(z_5[2]),
	.I1(un8_rnd_out_un0_P[11]),
	.I2(pre_out[23]),
	.I3(PATTERNDETECT_15),
	.I4(un2_output_3),
	.LO(z_axb_2)
);
defparam \enabled_nr.un14_pos_output.z_5_s_2_RNI7SNT .INIT=32'h99599A5A;
// @26:414
  LUT5_L \enabled_nr.un14_pos_output.z_5_s_1_RNI6SNT  (
	.I0(z_5[1]),
	.I1(un8_rnd_out_un0_P[10]),
	.I2(pre_out[23]),
	.I3(PATTERNDETECT_15),
	.I4(un2_output_3),
	.LO(z_axb_1)
);
defparam \enabled_nr.un14_pos_output.z_5_s_1_RNI6SNT .INIT=32'h99599A5A;
// @26:414
  LUT5 \enabled_nr.un14_pos_output.z_cry_0_RNO  (
	.I0(z_5[0]),
	.I1(un8_rnd_out_un0_P[9]),
	.I2(pre_out[23]),
	.I3(PATTERNDETECT_15),
	.I4(un2_output_3),
	.O(z_axb_0)
);
defparam \enabled_nr.un14_pos_output.z_cry_0_RNO .INIT=32'h99599A5A;
  LUT5_L \enabled_nr.un14_pos_output.z_axb_0_i  (
	.I0(z_5[0]),
	.I1(un8_rnd_out_un0_P[9]),
	.I2(pre_out[23]),
	.I3(PATTERNDETECT_15),
	.I4(un2_output_3),
	.LO(z_axb_0_i)
);
defparam \enabled_nr.un14_pos_output.z_axb_0_i .INIT=32'h66A665A5;
// @6:277
  LUT5 \op_lt.op_lt.un3_shift_right_c2_0_0  (
	.I0(ret_val_m10[2]),
	.I1(N_454),
	.I2(un3_shift_right_c2_0_0_a0_1),
	.I3(ret_val[1]),
	.I4(un9_0_axb_8),
	.O(un3_shift_right)
);
defparam \op_lt.op_lt.un3_shift_right_c2_0_0 .INIT=32'h00D1D1D1;
// @23:226
  LUT6 \un1_poly_odd_d_cZ[11]  (
	.I0(input_reg[2]),
	.I1(un9_0_axb_8),
	.I2(un20_output_2[14]),
	.I3(N_45),
	.I4(shift_amount_1[1]),
	.I5(input_shifted[2]),
	.O(un1_poly_odd_d[11])
);
defparam \un1_poly_odd_d_cZ[11] .INIT=64'h03331313CFFFDFDF;
// @23:226
  LUT5 \un1_poly_odd_cZ[10]  (
	.I0(un9_0_axb_8),
	.I1(un3_shift_right),
	.I2(input_shifted[2]),
	.I3(N_70),
	.I4(un26_output[3]),
	.O(un1_poly_odd[10])
);
defparam \un1_poly_odd_cZ[10] .INIT=32'h058D27AF;
// @23:226
  LUT4 \un1_input_shifted_cZ[6]  (
	.I0(un9_0_axb_8),
	.I1(un3_shift_right),
	.I2(N_72),
	.I3(un26_output[5]),
	.O(un1_input_shifted[6])
);
defparam \un1_input_shifted_cZ[6] .INIT=16'h5140;
// @23:226
  LUT6 \un1_poly_odd_cZ[9]  (
	.I0(un9_0_axb_8),
	.I1(un3_shift_right),
	.I2(N_70),
	.I3(N_71),
	.I4(un26_output[4]),
	.I5(un26_output[3]),
	.O(un1_poly_odd[9])
);
defparam \un1_poly_odd_cZ[9] .INIT=64'h048C26AE159D37BF;
// @23:226
  LUT6 \un1_poly_odd_cZ[8]  (
	.I0(un9_0_axb_8),
	.I1(un3_shift_right),
	.I2(N_71),
	.I3(un26_output[4]),
	.I4(N_72),
	.I5(un26_output[5]),
	.O(un1_poly_odd[8])
);
defparam \un1_poly_odd_cZ[8] .INIT=64'h04158C9D2637AEBF;
// @23:226
  LUT5 \un1_input_shifted_cZ[5]  (
	.I0(un9_0_axb_8),
	.I1(un3_shift_right),
	.I2(N_73),
	.I3(un26_output_0_iv_3[6]),
	.I4(un26_output_0_iv_2_0[6]),
	.O(un1_input_shifted[5])
);
defparam \un1_input_shifted_cZ[5] .INIT=32'h51515140;
// @23:226
  LUT5 \un7_cZ[10]  (
	.I0(un9_0_axb_8),
	.I1(un3_shift_right),
	.I2(N_73),
	.I3(un26_output_0_iv_3[6]),
	.I4(un26_output_0_iv_2_0[6]),
	.O(un7[10])
);
defparam \un7_cZ[10] .INIT=32'h0808082A;
// @26:414
  LUT5 \enabled_nr.un14_pos_output.z_5_axb_8  (
	.I0(un20_output_0_0_a2_0_0_lut6_2_O5),
	.I1(un3_shift_right),
	.I2(un11_output_6_d_0[9]),
	.I3(N_62),
	.I4(pre_output[8]),
	.O(z_5_axb_8)
);
defparam \enabled_nr.un14_pos_output.z_5_axb_8 .INIT=32'hCDEF3210;
  LUT5 \un1_poly_odd_s_lut6_2_RNIMJIV1[11]  (
	.I0(un9_0_axb_8),
	.I1(un1_poly_odd_s_lut6_2_O6[11]),
	.I2(un26_output[1]),
	.I3(un1_poly_odd_d[11]),
	.I4(input_shifted[5]),
	.O(un9_0_axb_0)
);
defparam \un1_poly_odd_s_lut6_2_RNIMJIV1[11] .INIT=32'h3F0C95A6;
  LUT5 \enabled_nr.un14_pos_output.z_5_axb_1  (
	.I0(un20_output_2[14]),
	.I1(un3_shift_right),
	.I2(N_56),
	.I3(N_49),
	.I4(pre_output[2]),
	.O(z_5_axb_1)
);
defparam \enabled_nr.un14_pos_output.z_5_axb_1 .INIT=32'h13DFEC20;
  LUT5 \enabled_nr.un14_pos_output.z_5_axb_4  (
	.I0(N_419),
	.I1(un3_shift_right),
	.I2(N_33_0),
	.I3(output_d[4]),
	.I4(pre_output[5]),
	.O(z_5_axb_4)
);
defparam \enabled_nr.un14_pos_output.z_5_axb_4 .INIT=32'h087FF780;
  LUT5 \enabled_nr.un14_pos_output.z_5_axb_6  (
	.I0(un3_shift_right),
	.I1(un7_output_2_0_0[6]),
	.I2(un7_output_2_1[6]),
	.I3(un11_output[6]),
	.I4(pre_output[7]),
	.O(z_5_axb_6)
);
defparam \enabled_nr.un14_pos_output.z_5_axb_6 .INIT=32'h2A7FD580;
  LUT5 \enabled_nr.un14_pos_output.z_5_axb_9  (
	.I0(un20_output_0_0_a2_0_0_lut6_2_O5),
	.I1(un3_shift_right),
	.I2(un11_output_6_d_0[9]),
	.I3(N_62),
	.I4(pre_output[10]),
	.O(z_5_axb_9)
);
defparam \enabled_nr.un14_pos_output.z_5_axb_9 .INIT=32'hCDEF3210;
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_5_s_11  (
	.LI(pre_output[11]),
	.CI(z_5_cry_10),
	.O(z_5[11])
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_5_s_10  (
	.LI(z_5_axb_10),
	.CI(z_5_cry_9),
	.O(z_5[10])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_5_cry_10  (
	.DI(pre_output[10]),
	.CI(z_5_cry_9),
	.S(z_5_axb_10),
	.LO(z_5_cry_10)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_5_s_9  (
	.LI(z_5_axb_9),
	.CI(z_5_cry_8),
	.O(z_5[9])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_5_cry_9  (
	.DI(z_5_8_d),
	.CI(z_5_cry_8),
	.S(z_5_axb_9),
	.LO(z_5_cry_9)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_5_s_8  (
	.LI(z_5_axb_8),
	.CI(z_5_cry_7),
	.O(z_5[8])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_5_cry_8  (
	.DI(z_5_8_d),
	.CI(z_5_cry_7),
	.S(z_5_axb_8),
	.LO(z_5_cry_8)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_5_s_7  (
	.LI(z_5_axb_7),
	.CI(z_5_cry_6),
	.O(z_5[7])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_5_cry_7  (
	.DI(pre_output[7]),
	.CI(z_5_cry_6),
	.S(z_5_axb_7),
	.LO(z_5_cry_7)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_5_s_6  (
	.LI(z_5_axb_6),
	.CI(z_5_cry_5),
	.O(z_5[6])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_5_cry_6  (
	.DI(pre_output[6]),
	.CI(z_5_cry_5),
	.S(z_5_axb_6),
	.LO(z_5_cry_6)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_5_s_5  (
	.LI(z_5_axb_5),
	.CI(z_5_cry_4),
	.O(z_5[5])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_5_cry_5  (
	.DI(pre_output[5]),
	.CI(z_5_cry_4),
	.S(z_5_axb_5),
	.LO(z_5_cry_5)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_5_s_4  (
	.LI(z_5_axb_4),
	.CI(z_5_cry_3),
	.O(z_5[4])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_5_cry_4  (
	.DI(pre_output[4]),
	.CI(z_5_cry_3),
	.S(z_5_axb_4),
	.LO(z_5_cry_4)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_5_s_3  (
	.LI(z_5_axb_3),
	.CI(z_5_cry_2),
	.O(z_5[3])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_5_cry_3  (
	.DI(pre_output[3]),
	.CI(z_5_cry_2),
	.S(z_5_axb_3),
	.LO(z_5_cry_3)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_5_s_2  (
	.LI(z_5_axb_2),
	.CI(z_5_cry_1),
	.O(z_5[2])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_5_cry_2  (
	.DI(pre_output[2]),
	.CI(z_5_cry_1),
	.S(z_5_axb_2),
	.LO(z_5_cry_2)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_5_s_1  (
	.LI(z_5_axb_1),
	.CI(z_5_cry_0),
	.O(z_5[1])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_5_cry_1  (
	.DI(pre_output[1]),
	.CI(z_5_cry_0),
	.S(z_5_axb_1),
	.LO(z_5_cry_1)
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_5_cry_0  (
	.DI(pre_output[0]),
	.CI(GND),
	.S(z_5[0]),
	.LO(z_5_cry_0)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_s_11  (
	.LI(z_5_i[11]),
	.CI(z_cry_10),
	.O(un14_pos_output[11])
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_s_10  (
	.LI(z_axb_10),
	.CI(z_cry_9),
	.O(un14_pos_output[10])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_cry_10  (
	.DI(z_5[10]),
	.CI(z_cry_9),
	.S(z_axb_10),
	.LO(z_cry_10)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_s_9  (
	.LI(z_axb_9),
	.CI(z_cry_8),
	.O(un14_pos_output[9])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_cry_9  (
	.DI(z_5[9]),
	.CI(z_cry_8),
	.S(z_axb_9),
	.LO(z_cry_9)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_s_8  (
	.LI(z_axb_8),
	.CI(z_cry_7),
	.O(un14_pos_output[8])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_cry_8  (
	.DI(z_5[8]),
	.CI(z_cry_7),
	.S(z_axb_8),
	.LO(z_cry_8)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_s_7  (
	.LI(z_axb_7),
	.CI(z_cry_6),
	.O(un14_pos_output[7])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_cry_7  (
	.DI(z_5[7]),
	.CI(z_cry_6),
	.S(z_axb_7),
	.LO(z_cry_7)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_s_6  (
	.LI(z_axb_6),
	.CI(z_cry_5),
	.O(un14_pos_output[6])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_cry_6  (
	.DI(z_5[6]),
	.CI(z_cry_5),
	.S(z_axb_6),
	.LO(z_cry_6)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_s_5  (
	.LI(z_axb_5),
	.CI(z_cry_4),
	.O(un14_pos_output[5])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_cry_5  (
	.DI(z_5[5]),
	.CI(z_cry_4),
	.S(z_axb_5),
	.LO(z_cry_5)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_s_4  (
	.LI(z_axb_4),
	.CI(z_cry_3),
	.O(un14_pos_output[4])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_cry_4  (
	.DI(z_5[4]),
	.CI(z_cry_3),
	.S(z_axb_4),
	.LO(z_cry_4)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_s_3  (
	.LI(z_axb_3),
	.CI(z_cry_2),
	.O(un14_pos_output[3])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_cry_3  (
	.DI(z_5[3]),
	.CI(z_cry_2),
	.S(z_axb_3),
	.LO(z_cry_3)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_s_2  (
	.LI(z_axb_2),
	.CI(z_cry_1),
	.O(un14_pos_output[2])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_cry_2  (
	.DI(z_5[2]),
	.CI(z_cry_1),
	.S(z_axb_2),
	.LO(z_cry_2)
);
// @26:414
  XORCY \enabled_nr.un14_pos_output.z_s_1  (
	.LI(z_axb_1),
	.CI(z_cry_0),
	.O(un14_pos_output[1])
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_cry_1  (
	.DI(z_5[1]),
	.CI(z_cry_0),
	.S(z_axb_1),
	.LO(z_cry_1)
);
// @26:414
  MUXCY_L \enabled_nr.un14_pos_output.z_cry_0  (
	.DI(z_5[0]),
	.CI(VCC),
	.S(z_axb_0),
	.LO(z_cry_0)
);
// @23:226
  XORCY un9_0_s_8_cZ (
	.LI(un9_0_axb_8),
	.CI(un9_0_cry_7),
	.O(un9_0_s_8)
);
// @23:226
  XORCY un9_0_s_7_cZ (
	.LI(un3_shift_right_axb0_i),
	.CI(un9_0_cry_6),
	.O(un9_0_s_7)
);
// @23:226
  MUXCY_L un9_0_cry_7_cZ (
	.DI(VCC),
	.CI(un9_0_cry_6),
	.S(un3_shift_right_axb0_i),
	.LO(un9_0_cry_7)
);
// @23:226
  XORCY un9_0_s_6_cZ (
	.LI(N_2502_i),
	.CI(un9_0_cry_5),
	.O(un9_0_s_6)
);
// @23:226
  MUXCY_L un9_0_cry_6_cZ (
	.DI(VCC),
	.CI(un9_0_cry_5),
	.S(N_2502_i),
	.LO(un9_0_cry_6)
);
// @23:226
  XORCY un9_0_s_5_cZ (
	.LI(un1_poly_odd_i[6]),
	.CI(un9_0_cry_4),
	.O(un9_0_s_5)
);
// @23:226
  MUXCY_L un9_0_cry_5_cZ (
	.DI(VCC),
	.CI(un9_0_cry_4),
	.S(un1_poly_odd_i[6]),
	.LO(un9_0_cry_5)
);
// @23:226
  XORCY un9_0_s_4_cZ (
	.LI(un9_0_axb_4),
	.CI(un9_0_cry_3),
	.O(un9_0_s_4)
);
// @23:226
  MUXCY_L un9_0_cry_4_cZ (
	.DI(un1_poly_odd[7]),
	.CI(un9_0_cry_3),
	.S(un9_0_axb_4),
	.LO(un9_0_cry_4)
);
// @23:226
  XORCY un9_0_s_3_cZ (
	.LI(un9_0_axb_3),
	.CI(un9_0_cry_2),
	.O(un9_0_s_3)
);
// @23:226
  MUXCY_L un9_0_cry_3_cZ (
	.DI(un9_0_o5_2),
	.CI(un9_0_cry_2),
	.S(un9_0_axb_3),
	.LO(un9_0_cry_3)
);
// @23:226
  XORCY un9_0_s_2_cZ (
	.LI(un9_0_axb_2),
	.CI(un9_0_cry_1),
	.O(un9_0_s_2)
);
// @23:226
  MUXCY_L un9_0_cry_2_cZ (
	.DI(un9_0_o5_1),
	.CI(un9_0_cry_1),
	.S(un9_0_axb_2),
	.LO(un9_0_cry_2)
);
// @23:226
  XORCY un9_0_s_1_cZ (
	.LI(un9_0_axb_1),
	.CI(un9_0_cry_0),
	.O(un9_0_s_1)
);
// @23:226
  MUXCY_L un9_0_cry_1_cZ (
	.DI(GND),
	.CI(un9_0_cry_0),
	.S(un9_0_axb_1),
	.LO(un9_0_cry_1)
);
// @23:226
  XORCY un9_0_s_0_cZ (
	.LI(un9_0_axb_0),
	.CI(un9_0_cry_0_cy),
	.O(un9_0_s_0)
);
// @23:226
  MUXCY_L un9_0_cry_0_cZ (
	.DI(un9_0_cry_0_RNO),
	.CI(un9_0_cry_0_cy),
	.S(un9_0_axb_0),
	.LO(un9_0_cry_0)
);
// @23:205
  shifterZ1 in_shift (
	.ret_val(ret_val[3:1]),
	.un20_output_2(un20_output_2[14]),
	.ret_val_m2(ret_val_m2[3]),
	.shift_amount_1(shift_amount_1[1]),
	.un26_output_0_iv_3(un26_output_0_iv_3[6]),
	.ret_val_d_a1(ret_val_d_a1[1]),
	.ret_val_d_a0(ret_val_d_a0[1]),
	.un26_output_6(un26_output[7]),
	.un26_output_2(un26_output[3]),
	.un26_output_4(un26_output[5]),
	.un26_output_3(un26_output[4]),
	.un26_output_0(un26_output[1]),
	.un1_poly_odd_i(un1_poly_odd_i[6]),
	.input_reg(input_reg[11:0]),
	.un26_output_0_iv_2_0_1(un26_output_0_iv_2_0[6]),
	.input_shifted_4(input_shifted[6]),
	.input_shifted_0(input_shifted[2]),
	.input_shifted_3(input_shifted[5]),
	.un1_input_shifted(un1_input_shifted[4]),
	.un1_poly_odd(un1_poly_odd[8]),
	.un9_0_axb_8(un9_0_axb_8),
	.un20_output_0_0_a2_0_0_lut6_2_O5(un20_output_0_0_a2_0_0_lut6_2_O5),
	.N_100_i(N_100_i),
	.N_65(N_65),
	.un3_shift_right(un3_shift_right),
	.N_2502_i(N_2502_i),
	.un4_overflow_2(un4_overflow_2),
	.N_454(N_454),
	.N_72(N_72),
	.ret_val_ss0(ret_val_ss0),
	.N_458(N_458),
	.N_45(N_45),
	.N_70(N_70),
	.N_73(N_73),
	.N_71(N_71),
	.N_441(N_441),
	.un9_0_axb_4(un9_0_axb_4)
);
// @23:239
  shifterZ0 out_shift (
	.input_reg(input_reg[11:10]),
	.shift_amount_1(shift_amount_1[1]),
	.un14_pos_output(un14_pos_output[6:3]),
	.ret_val(ret_val[3:1]),
	.un11_output_6_d_0(un11_output_6_d_0[9]),
	.out_shift_amount(out_shift_amount[1]),
	.un7_output_2_0_0(un7_output_2_0_0[6]),
	.un7_output_2_1(un7_output_2_1[6:5]),
	.output_d(output_d[4]),
	.shift_amount_1_i(shift_amount_1_i[2]),
	.un11_output_1(un11_output[5]),
	.un11_output_2(un11_output[6]),
	.un20_output_2(un20_output_2[14]),
	.pre_output(pre_output[11:1]),
	.done_inv_sqrt(done_inv_sqrt),
	.un4_overflow_0(un4_overflow_0),
	.output_reg_pipe_12_RNIPJ901_O6(output_reg_pipe_12_RNIPJ901_O6),
	.un9_0_axb_8(un9_0_axb_8),
	.un9_0_s_6(un9_0_s_6),
	.un9_0_s_7(un9_0_s_7),
	.N_414(N_414),
	.N_33(N_33),
	.clk(clk),
	.N_420(N_420),
	.un3_shift_right(un3_shift_right),
	.N_410(N_410),
	.un9_0_s_5(un9_0_s_5),
	.un9_0_s_8(un9_0_s_8),
	.N_79(N_79),
	.N_50(N_50),
	.un9_0_s_4(un9_0_s_4),
	.un9_0_s_3(un9_0_s_3),
	.N_13_0(N_13_0),
	.N_100_i(N_100_i),
	.N_31(N_31),
	.N_18_0(N_18_0),
	.N_378(N_378),
	.N_33_0(N_33_0),
	.N_80(N_80),
	.N_51(N_51),
	.un9_0_s_0(un9_0_s_0),
	.un9_0_s_1(un9_0_s_1),
	.m9_0_0(m9_0_0),
	.N_417(N_417),
	.N_62(N_62),
	.N_454(N_454),
	.SUM1_0_i_1_1(SUM1_0_i_1_1),
	.N_56(N_56),
	.N_434_i(N_434_i),
	.N_431_i(N_431_i),
	.N_428_i(N_428_i),
	.N_425_i(N_425_i),
	.un9_0_s_2(un9_0_s_2),
	.N_419(N_419),
	.N_49(N_49),
	.N_413(N_413),
	.un20_output_0_0_a2_0_0_lut6_2_O5(un20_output_0_0_a2_0_0_lut6_2_O5),
	.un1_apply_nrlt8_1(un1_apply_nrlt8_1),
	.un1_apply_nrlt7(un1_apply_nrlt7)
);
// @23:266
  multiplier \enabled_nr.mult1  (
	.mult1_out(mult1_out[11:0]),
	.pre_output(pre_output[11:0])
);
// @23:273
  multiplier_1 \enabled_nr.mult2  (
	.mult2_out(mult2_out[11:0]),
	.pre_output(pre_output[11:0]),
	.out_inner_prod_r(out_inner_prod_r[11:0]),
	.start_inv_sqrt(start_inv_sqrt),
	.clk(clk)
);
// @23:280
  \multiplier_enabled_nr.mult3  \enabled_nr.mult3  (
	.un8_rnd_out_un0_P_9(un8_rnd_out_un0_P[9]),
	.un8_rnd_out_un0_P_10(un8_rnd_out_un0_P[10]),
	.un8_rnd_out_un0_P_11(un8_rnd_out_un0_P[11]),
	.un8_rnd_out_un0_P_12(un8_rnd_out_un0_P[12]),
	.un8_rnd_out_un0_P_13(un8_rnd_out_un0_P[13]),
	.un8_rnd_out_un0_P_14(un8_rnd_out_un0_P[14]),
	.un8_rnd_out_un0_P_15(un8_rnd_out_un0_P[15]),
	.un8_rnd_out_un0_P_16(un8_rnd_out_un0_P[16]),
	.un8_rnd_out_un0_P_17(un8_rnd_out_un0_P[17]),
	.un8_rnd_out_un0_P_18(un8_rnd_out_un0_P[18]),
	.un8_rnd_out_un0_P_19(un8_rnd_out_un0_P[19]),
	.mult1_out(mult1_out[11:0]),
	.mult2_out(mult2_out[11:0]),
	.pre_out_23(pre_out[23]),
	.un2_output_3(un2_output_3),
	.PATTERNDETECT_15(PATTERNDETECT_15)
);
  VCC VCC_cZ (
	.P(VCC)
);
  GND GND_cZ (
	.G(GND)
);
// @23:236
  LUT4 \out_shift_amount_lut6_2_o6[1]  (
	.I0(N_454),
	.I1(ret_val[2]),
	.I2(ret_val[1]),
	.I3(un9_0_axb_8),
	.O(out_shift_amount[1])
);
defparam \out_shift_amount_lut6_2_o6[1] .INIT=16'hC623;
// @23:236
  LUT4 \out_shift_amount_lut6_2_o5[1]  (
	.I0(N_454),
	.I1(ret_val[2]),
	.I2(ret_val[1]),
	.I3(un9_0_axb_8),
	.O(N_419)
);
defparam \out_shift_amount_lut6_2_o5[1] .INIT=16'h1DDC;
// @23:146
  LUT2 \counter_4_lut6_2_o6[2]  (
	.I0(counter[1]),
	.I1(state[0]),
	.O(counter_4[2])
);
defparam \counter_4_lut6_2_o6[2] .INIT=4'h8;
// @23:146
  LUT2 \counter_4_lut6_2_o5[2]  (
	.I0(counter[2]),
	.I1(state[0]),
	.O(counter_4[3])
);
defparam \counter_4_lut6_2_o5[2] .INIT=4'h8;
// @23:287
  LUT3 \pos_output_0_lut6_2_o6[2]  (
	.I0(un14_pos_outputf[2]),
	.I1(pre_outputf[2]),
	.I2(output_reg_pipe_11),
	.O(out_inv_sqrt_2)
);
defparam \pos_output_0_lut6_2_o6[2] .INIT=8'hAC;
// @23:287
  LUT3 \pos_output_0_lut6_2_o5[2]  (
	.I0(un14_pos_outputf[1]),
	.I1(pre_outputf[1]),
	.I2(output_reg_pipe_11),
	.O(out_inv_sqrt_1)
);
defparam \pos_output_0_lut6_2_o5[2] .INIT=8'hAC;
// @23:287
  LUT3 \pos_output_0_lut6_2_o6[8]  (
	.I0(un14_pos_outputf[8]),
	.I1(pre_outputf[8]),
	.I2(output_reg_pipe_11),
	.O(out_inv_sqrt_8)
);
defparam \pos_output_0_lut6_2_o6[8] .INIT=8'hAC;
// @23:287
  LUT3 \pos_output_0_lut6_2_o5[8]  (
	.I0(un14_pos_outputf[7]),
	.I1(pre_outputf[7]),
	.I2(output_reg_pipe_11),
	.O(out_inv_sqrt_7)
);
defparam \pos_output_0_lut6_2_o5[8] .INIT=8'hAC;
// @23:287
  LUT3 \pos_output_0_lut6_2_o6[9]  (
	.I0(un14_pos_outputf[9]),
	.I1(pre_outputf[9]),
	.I2(output_reg_pipe_11),
	.O(out_inv_sqrt_9)
);
defparam \pos_output_0_lut6_2_o6[9] .INIT=8'hAC;
// @23:287
  LUT3 \pos_output_0_lut6_2_o5[9]  (
	.I0(un14_pos_outputf[10]),
	.I1(pre_outputf[10]),
	.I2(output_reg_pipe_11),
	.O(out_inv_sqrt_10)
);
defparam \pos_output_0_lut6_2_o5[9] .INIT=8'hAC;
// @23:140
  LUT3 done_e_lut6_2_o6 (
	.I0(counter[3]),
	.I1(state[0]),
	.I2(done_inv_sqrt),
	.O(done)
);
defparam done_e_lut6_2_o6.INIT=8'hC8;
// @23:140
  LUT2 done_e_lut6_2_o5 (
	.I0(counter[0]),
	.I1(state[0]),
	.O(counter_4[1])
);
defparam done_e_lut6_2_o5.INIT=4'h8;
// @23:99
  LUT4 \get_leading_zeros.ret_val_m10_0_a2_lut6_2_o6[2]  (
	.I0(input_reg[9]),
	.I1(input_reg[8]),
	.I2(input_reg[10]),
	.I3(input_reg[11]),
	.O(ret_val_m10[2])
);
defparam \get_leading_zeros.ret_val_m10_0_a2_lut6_2_o6[2] .INIT=16'h0001;
// @23:99
  LUT2 \get_leading_zeros.ret_val_m10_0_a2_lut6_2_o5[2]  (
	.I0(input_reg[9]),
	.I1(input_reg[8]),
	.O(N_439)
);
defparam \get_leading_zeros.ret_val_m10_0_a2_lut6_2_o5[2] .INIT=4'hE;
// @23:226
  LUT4 \un1_poly_odd_s_lut6_2_o6[11]  (
	.I0(ret_val_m10[2]),
	.I1(N_454),
	.I2(un3_shift_right_c2_0_0_a0_1),
	.I3(un9_0_axb_8),
	.O(un1_poly_odd_s_lut6_2_O6[11])
);
defparam \un1_poly_odd_s_lut6_2_o6[11] .INIT=16'h002E;
// @23:226
  LUT5 \un1_poly_odd_s_lut6_2_o5[11]  (
	.I0(ret_val_m10[2]),
	.I1(N_454),
	.I2(un3_shift_right_c2_0_0_a0_1),
	.I3(ret_val[1]),
	.I4(un9_0_axb_8),
	.O(m9_a1_1)
);
defparam \un1_poly_odd_s_lut6_2_o5[11] .INIT=32'h000000D1;
endmodule