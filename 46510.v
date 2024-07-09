module add_subZ3_3 (
  out_r_vec_mult_3,
  in_a_r_reg_3,
  pre_out_i_m,
  pre_out_10,
  pre_out_9,
  pre_out_8,
  pre_out_7,
  pre_out_6,
  pre_out_5,
  pre_out_4,
  pre_out_3,
  pre_out_2,
  pre_out_1,
  un5_output
)
;
input [11:0] out_r_vec_mult_3 ;
input [11:0] in_a_r_reg_3 ;
output [1:0] pre_out_i_m ;
output pre_out_10 ;
output pre_out_9 ;
output pre_out_8 ;
output pre_out_7 ;
output pre_out_6 ;
output pre_out_5 ;
output pre_out_4 ;
output pre_out_3 ;
output pre_out_2 ;
output pre_out_1 ;
output un5_output ;
wire pre_out_10 ;
wire pre_out_9 ;
wire pre_out_8 ;
wire pre_out_7 ;
wire pre_out_6 ;
wire pre_out_5 ;
wire pre_out_4 ;
wire pre_out_3 ;
wire pre_out_2 ;
wire pre_out_1 ;
wire un5_output ;
wire [1:1] pre_out;
wire [0:0] pre_out_i;
wire GND ;
wire VCC ;
wire pre_out_axb_1 ;
wire pre_out_axb_2 ;
wire pre_out_axb_3 ;
wire pre_out_axb_4 ;
wire pre_out_axb_5 ;
wire pre_out_axb_6 ;
wire pre_out_axb_7 ;
wire pre_out_axb_8 ;
wire pre_out_axb_9 ;
wire pre_out_axb_10 ;
wire pre_out_axb_11 ;
wire pre_out_cry_10 ;
wire pre_out_cry_9 ;
wire pre_out_cry_8 ;
wire pre_out_cry_7 ;
wire pre_out_cry_6 ;
wire pre_out_cry_5 ;
wire pre_out_cry_4 ;
wire pre_out_cry_3 ;
wire pre_out_cry_2 ;
wire pre_out_cry_1 ;
wire pre_out_cry_0 ;
// @15:57
  LUT2 pre_out_axb_0 (
	.I0(out_r_vec_mult_3[0]),
	.I1(in_a_r_reg_3[0]),
	.O(pre_out_i[0])
);
defparam pre_out_axb_0.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_1_cZ (
	.I0(out_r_vec_mult_3[1]),
	.I1(in_a_r_reg_3[1]),
	.O(pre_out_axb_1)
);
defparam pre_out_axb_1_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_2_cZ (
	.I0(out_r_vec_mult_3[2]),
	.I1(in_a_r_reg_3[2]),
	.O(pre_out_axb_2)
);
defparam pre_out_axb_2_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_3_cZ (
	.I0(out_r_vec_mult_3[3]),
	.I1(in_a_r_reg_3[3]),
	.O(pre_out_axb_3)
);
defparam pre_out_axb_3_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_4_cZ (
	.I0(out_r_vec_mult_3[4]),
	.I1(in_a_r_reg_3[4]),
	.O(pre_out_axb_4)
);
defparam pre_out_axb_4_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_5_cZ (
	.I0(out_r_vec_mult_3[5]),
	.I1(in_a_r_reg_3[5]),
	.O(pre_out_axb_5)
);
defparam pre_out_axb_5_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_6_cZ (
	.I0(out_r_vec_mult_3[6]),
	.I1(in_a_r_reg_3[6]),
	.O(pre_out_axb_6)
);
defparam pre_out_axb_6_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_7_cZ (
	.I0(out_r_vec_mult_3[7]),
	.I1(in_a_r_reg_3[7]),
	.O(pre_out_axb_7)
);
defparam pre_out_axb_7_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_8_cZ (
	.I0(out_r_vec_mult_3[8]),
	.I1(in_a_r_reg_3[8]),
	.O(pre_out_axb_8)
);
defparam pre_out_axb_8_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_9_cZ (
	.I0(out_r_vec_mult_3[9]),
	.I1(in_a_r_reg_3[9]),
	.O(pre_out_axb_9)
);
defparam pre_out_axb_9_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_10_cZ (
	.I0(out_r_vec_mult_3[10]),
	.I1(in_a_r_reg_3[10]),
	.O(pre_out_axb_10)
);
defparam pre_out_axb_10_cZ.INIT=4'h9;
// @15:65
  LUT5 pre_out_s_11_RNI6TNU (
	.I0(out_r_vec_mult_3[0]),
	.I1(in_a_r_reg_3[0]),
	.I2(out_r_vec_mult_3[11]),
	.I3(in_a_r_reg_3[11]),
	.I4(pre_out_10),
	.O(pre_out_i_m[0])
);
defparam pre_out_s_11_RNI6TNU.INIT=32'h99099099;
// @15:57
  LUT2 pre_out_axb_11_cZ (
	.I0(out_r_vec_mult_3[11]),
	.I1(in_a_r_reg_3[11]),
	.O(pre_out_axb_11)
);
defparam pre_out_axb_11_cZ.INIT=4'h9;
// @15:57
  XORCY pre_out_s_11 (
	.LI(pre_out_axb_11),
	.CI(pre_out_cry_10),
	.O(pre_out_10)
);
// @15:57
  XORCY pre_out_s_10 (
	.LI(pre_out_axb_10),
	.CI(pre_out_cry_9),
	.O(pre_out_9)
);
// @15:57
  MUXCY_L pre_out_cry_10_cZ (
	.DI(in_a_r_reg_3[10]),
	.CI(pre_out_cry_9),
	.S(pre_out_axb_10),
	.LO(pre_out_cry_10)
);
// @15:57
  XORCY pre_out_s_9 (
	.LI(pre_out_axb_9),
	.CI(pre_out_cry_8),
	.O(pre_out_8)
);
// @15:57
  MUXCY_L pre_out_cry_9_cZ (
	.DI(in_a_r_reg_3[9]),
	.CI(pre_out_cry_8),
	.S(pre_out_axb_9),
	.LO(pre_out_cry_9)
);
// @15:57
  XORCY pre_out_s_8 (
	.LI(pre_out_axb_8),
	.CI(pre_out_cry_7),
	.O(pre_out_7)
);
// @15:57
  MUXCY_L pre_out_cry_8_cZ (
	.DI(in_a_r_reg_3[8]),
	.CI(pre_out_cry_7),
	.S(pre_out_axb_8),
	.LO(pre_out_cry_8)
);
// @15:57
  XORCY pre_out_s_7 (
	.LI(pre_out_axb_7),
	.CI(pre_out_cry_6),
	.O(pre_out_6)
);
// @15:57
  MUXCY_L pre_out_cry_7_cZ (
	.DI(in_a_r_reg_3[7]),
	.CI(pre_out_cry_6),
	.S(pre_out_axb_7),
	.LO(pre_out_cry_7)
);
// @15:57
  XORCY pre_out_s_6 (
	.LI(pre_out_axb_6),
	.CI(pre_out_cry_5),
	.O(pre_out_5)
);
// @15:57
  MUXCY_L pre_out_cry_6_cZ (
	.DI(in_a_r_reg_3[6]),
	.CI(pre_out_cry_5),
	.S(pre_out_axb_6),
	.LO(pre_out_cry_6)
);
// @15:57
  XORCY pre_out_s_5 (
	.LI(pre_out_axb_5),
	.CI(pre_out_cry_4),
	.O(pre_out_4)
);
// @15:57
  MUXCY_L pre_out_cry_5_cZ (
	.DI(in_a_r_reg_3[5]),
	.CI(pre_out_cry_4),
	.S(pre_out_axb_5),
	.LO(pre_out_cry_5)
);
// @15:57
  XORCY pre_out_s_4 (
	.LI(pre_out_axb_4),
	.CI(pre_out_cry_3),
	.O(pre_out_3)
);
// @15:57
  MUXCY_L pre_out_cry_4_cZ (
	.DI(in_a_r_reg_3[4]),
	.CI(pre_out_cry_3),
	.S(pre_out_axb_4),
	.LO(pre_out_cry_4)
);
// @15:57
  XORCY pre_out_s_3 (
	.LI(pre_out_axb_3),
	.CI(pre_out_cry_2),
	.O(pre_out_2)
);
// @15:57
  MUXCY_L pre_out_cry_3_cZ (
	.DI(in_a_r_reg_3[3]),
	.CI(pre_out_cry_2),
	.S(pre_out_axb_3),
	.LO(pre_out_cry_3)
);
// @15:57
  XORCY pre_out_s_2 (
	.LI(pre_out_axb_2),
	.CI(pre_out_cry_1),
	.O(pre_out_1)
);
// @15:57
  MUXCY_L pre_out_cry_2_cZ (
	.DI(in_a_r_reg_3[2]),
	.CI(pre_out_cry_1),
	.S(pre_out_axb_2),
	.LO(pre_out_cry_2)
);
// @15:57
  XORCY pre_out_s_1 (
	.LI(pre_out_axb_1),
	.CI(pre_out_cry_0),
	.O(pre_out[1])
);
// @15:57
  MUXCY_L pre_out_cry_1_cZ (
	.DI(in_a_r_reg_3[1]),
	.CI(pre_out_cry_0),
	.S(pre_out_axb_1),
	.LO(pre_out_cry_1)
);
// @15:57
  MUXCY_L pre_out_cry_0_cZ (
	.DI(in_a_r_reg_3[0]),
	.CI(VCC),
	.S(pre_out_i[0]),
	.LO(pre_out_cry_0)
);
  GND GND_cZ (
	.G(GND)
);
  VCC VCC_cZ (
	.P(VCC)
);
// @15:65
  LUT4 pre_out_s_1_RNIQIL91_o6 (
	.I0(out_r_vec_mult_3[11]),
	.I1(in_a_r_reg_3[11]),
	.I2(pre_out[1]),
	.I3(pre_out_10),
	.O(pre_out_i_m[1])
);
defparam pre_out_s_1_RNIQIL91_o6.INIT=16'h0D0B;
// @15:65
  LUT3 pre_out_s_1_RNIQIL91_o5 (
	.I0(out_r_vec_mult_3[11]),
	.I1(in_a_r_reg_3[11]),
	.I2(pre_out_10),
	.O(un5_output)
);
defparam pre_out_s_1_RNIQIL91_o5.INIT=8'hFB;
endmodule