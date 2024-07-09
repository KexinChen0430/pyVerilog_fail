module add_subZ3_5 (
  pre_out_i_m,
  out_i_vec_mult_1,
  in_a_i_reg_1,
  pre_out,
  un5_output
)
;
output [0:0] pre_out_i_m ;
input [11:0] out_i_vec_mult_1 ;
input [11:0] in_a_i_reg_1 ;
output [11:1] pre_out ;
output un5_output ;
wire un5_output ;
wire [0:0] pre_out_i;
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
wire GND ;
// @15:57
  LUT2 pre_out_axb_0 (
	.I0(out_i_vec_mult_1[0]),
	.I1(in_a_i_reg_1[0]),
	.O(pre_out_i[0])
);
defparam pre_out_axb_0.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_1_cZ (
	.I0(out_i_vec_mult_1[1]),
	.I1(in_a_i_reg_1[1]),
	.O(pre_out_axb_1)
);
defparam pre_out_axb_1_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_2_cZ (
	.I0(out_i_vec_mult_1[2]),
	.I1(in_a_i_reg_1[2]),
	.O(pre_out_axb_2)
);
defparam pre_out_axb_2_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_3_cZ (
	.I0(out_i_vec_mult_1[3]),
	.I1(in_a_i_reg_1[3]),
	.O(pre_out_axb_3)
);
defparam pre_out_axb_3_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_4_cZ (
	.I0(out_i_vec_mult_1[4]),
	.I1(in_a_i_reg_1[4]),
	.O(pre_out_axb_4)
);
defparam pre_out_axb_4_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_5_cZ (
	.I0(out_i_vec_mult_1[5]),
	.I1(in_a_i_reg_1[5]),
	.O(pre_out_axb_5)
);
defparam pre_out_axb_5_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_6_cZ (
	.I0(out_i_vec_mult_1[6]),
	.I1(in_a_i_reg_1[6]),
	.O(pre_out_axb_6)
);
defparam pre_out_axb_6_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_7_cZ (
	.I0(out_i_vec_mult_1[7]),
	.I1(in_a_i_reg_1[7]),
	.O(pre_out_axb_7)
);
defparam pre_out_axb_7_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_8_cZ (
	.I0(out_i_vec_mult_1[8]),
	.I1(in_a_i_reg_1[8]),
	.O(pre_out_axb_8)
);
defparam pre_out_axb_8_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_9_cZ (
	.I0(out_i_vec_mult_1[9]),
	.I1(in_a_i_reg_1[9]),
	.O(pre_out_axb_9)
);
defparam pre_out_axb_9_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_10_cZ (
	.I0(out_i_vec_mult_1[10]),
	.I1(in_a_i_reg_1[10]),
	.O(pre_out_axb_10)
);
defparam pre_out_axb_10_cZ.INIT=4'h9;
// @15:57
  LUT2 pre_out_axb_11_cZ (
	.I0(out_i_vec_mult_1[11]),
	.I1(in_a_i_reg_1[11]),
	.O(pre_out_axb_11)
);
defparam pre_out_axb_11_cZ.INIT=4'h9;
// @15:57
  XORCY pre_out_s_11 (
	.LI(pre_out_axb_11),
	.CI(pre_out_cry_10),
	.O(pre_out[11])
);
// @15:57
  XORCY pre_out_s_10 (
	.LI(pre_out_axb_10),
	.CI(pre_out_cry_9),
	.O(pre_out[10])
);
// @15:57
  MUXCY_L pre_out_cry_10_cZ (
	.DI(in_a_i_reg_1[10]),
	.CI(pre_out_cry_9),
	.S(pre_out_axb_10),
	.LO(pre_out_cry_10)
);
// @15:57
  XORCY pre_out_s_9 (
	.LI(pre_out_axb_9),
	.CI(pre_out_cry_8),
	.O(pre_out[9])
);
// @15:57
  MUXCY_L pre_out_cry_9_cZ (
	.DI(in_a_i_reg_1[9]),
	.CI(pre_out_cry_8),
	.S(pre_out_axb_9),
	.LO(pre_out_cry_9)
);
// @15:57
  XORCY pre_out_s_8 (
	.LI(pre_out_axb_8),
	.CI(pre_out_cry_7),
	.O(pre_out[8])
);
// @15:57
  MUXCY_L pre_out_cry_8_cZ (
	.DI(in_a_i_reg_1[8]),
	.CI(pre_out_cry_7),
	.S(pre_out_axb_8),
	.LO(pre_out_cry_8)
);
// @15:57
  XORCY pre_out_s_7 (
	.LI(pre_out_axb_7),
	.CI(pre_out_cry_6),
	.O(pre_out[7])
);
// @15:57
  MUXCY_L pre_out_cry_7_cZ (
	.DI(in_a_i_reg_1[7]),
	.CI(pre_out_cry_6),
	.S(pre_out_axb_7),
	.LO(pre_out_cry_7)
);
// @15:57
  XORCY pre_out_s_6 (
	.LI(pre_out_axb_6),
	.CI(pre_out_cry_5),
	.O(pre_out[6])
);
// @15:57
  MUXCY_L pre_out_cry_6_cZ (
	.DI(in_a_i_reg_1[6]),
	.CI(pre_out_cry_5),
	.S(pre_out_axb_6),
	.LO(pre_out_cry_6)
);
// @15:57
  XORCY pre_out_s_5 (
	.LI(pre_out_axb_5),
	.CI(pre_out_cry_4),
	.O(pre_out[5])
);
// @15:57
  MUXCY_L pre_out_cry_5_cZ (
	.DI(in_a_i_reg_1[5]),
	.CI(pre_out_cry_4),
	.S(pre_out_axb_5),
	.LO(pre_out_cry_5)
);
// @15:57
  XORCY pre_out_s_4 (
	.LI(pre_out_axb_4),
	.CI(pre_out_cry_3),
	.O(pre_out[4])
);
// @15:57
  MUXCY_L pre_out_cry_4_cZ (
	.DI(in_a_i_reg_1[4]),
	.CI(pre_out_cry_3),
	.S(pre_out_axb_4),
	.LO(pre_out_cry_4)
);
// @15:57
  XORCY pre_out_s_3 (
	.LI(pre_out_axb_3),
	.CI(pre_out_cry_2),
	.O(pre_out[3])
);
// @15:57
  MUXCY_L pre_out_cry_3_cZ (
	.DI(in_a_i_reg_1[3]),
	.CI(pre_out_cry_2),
	.S(pre_out_axb_3),
	.LO(pre_out_cry_3)
);
// @15:57
  XORCY pre_out_s_2 (
	.LI(pre_out_axb_2),
	.CI(pre_out_cry_1),
	.O(pre_out[2])
);
// @15:57
  MUXCY_L pre_out_cry_2_cZ (
	.DI(in_a_i_reg_1[2]),
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
	.DI(in_a_i_reg_1[1]),
	.CI(pre_out_cry_0),
	.S(pre_out_axb_1),
	.LO(pre_out_cry_1)
);
// @15:57
  MUXCY_L pre_out_cry_0_cZ (
	.DI(in_a_i_reg_1[0]),
	.CI(VCC),
	.S(pre_out_i[0]),
	.LO(pre_out_cry_0)
);
  VCC VCC_cZ (
	.P(VCC)
);
  GND GND_cZ (
	.G(GND)
);
// @15:66
  LUT3 \gen_sub.gen_sat_sub.un5_output_lut6_2_o6  (
	.I0(out_i_vec_mult_1[11]),
	.I1(in_a_i_reg_1[11]),
	.I2(pre_out[11]),
	.O(un5_output)
);
defparam \gen_sub.gen_sat_sub.un5_output_lut6_2_o6 .INIT=8'hFB;
// @15:66
  LUT5 \gen_sub.gen_sat_sub.un5_output_lut6_2_o5  (
	.I0(out_i_vec_mult_1[0]),
	.I1(in_a_i_reg_1[0]),
	.I2(out_i_vec_mult_1[11]),
	.I3(in_a_i_reg_1[11]),
	.I4(pre_out[11]),
	.O(pre_out_i_m[0])
);
defparam \gen_sub.gen_sat_sub.un5_output_lut6_2_o5 .INIT=32'h99099099;
endmodule