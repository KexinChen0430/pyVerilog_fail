module add_subZ0_add_r_1 (
  mult_out_i,
  out_inner_prod_i,
  un2_pre_out_10,
  un2_pre_out_9,
  un2_pre_out_8,
  un2_pre_out_7,
  un2_pre_out_6,
  un2_pre_out_5,
  un2_pre_out_4,
  un2_pre_out_3,
  un2_pre_out_2,
  un2_pre_out_1,
  un2_pre_out_s_11_0
)
;
input [11:0] mult_out_i ;
input [11:0] out_inner_prod_i ;
output un2_pre_out_10 ;
output un2_pre_out_9 ;
output un2_pre_out_8 ;
output un2_pre_out_7 ;
output un2_pre_out_6 ;
output un2_pre_out_5 ;
output un2_pre_out_4 ;
output un2_pre_out_3 ;
output un2_pre_out_2 ;
output un2_pre_out_1 ;
output un2_pre_out_s_11_0 ;
wire un2_pre_out_10 ;
wire un2_pre_out_9 ;
wire un2_pre_out_8 ;
wire un2_pre_out_7 ;
wire un2_pre_out_6 ;
wire un2_pre_out_5 ;
wire un2_pre_out_4 ;
wire un2_pre_out_3 ;
wire un2_pre_out_2 ;
wire un2_pre_out_1 ;
wire un2_pre_out_s_11_0 ;
wire [0:0] un2_pre_out;
wire un2_pre_out_axb_1 ;
wire un2_pre_out_axb_2 ;
wire un2_pre_out_axb_3 ;
wire un2_pre_out_axb_4 ;
wire un2_pre_out_axb_5 ;
wire un2_pre_out_axb_6 ;
wire un2_pre_out_axb_7 ;
wire un2_pre_out_axb_8 ;
wire un2_pre_out_axb_9 ;
wire un2_pre_out_axb_10 ;
wire un2_pre_out_axb_11 ;
wire un2_pre_out_cry_10 ;
wire un2_pre_out_cry_9 ;
wire un2_pre_out_cry_8 ;
wire un2_pre_out_cry_7 ;
wire un2_pre_out_cry_6 ;
wire un2_pre_out_cry_5 ;
wire un2_pre_out_cry_4 ;
wire un2_pre_out_cry_3 ;
wire un2_pre_out_cry_2 ;
wire un2_pre_out_cry_1 ;
wire un2_pre_out_cry_0 ;
wire GND ;
wire VCC ;
// @15:37
  LUT2 un2_pre_out_axb_0 (
	.I0(mult_out_i[0]),
	.I1(out_inner_prod_i[0]),
	.O(un2_pre_out[0])
);
defparam un2_pre_out_axb_0.INIT=4'h6;
// @15:37
  LUT2 un2_pre_out_axb_1_cZ (
	.I0(mult_out_i[1]),
	.I1(out_inner_prod_i[1]),
	.O(un2_pre_out_axb_1)
);
defparam un2_pre_out_axb_1_cZ.INIT=4'h6;
// @15:37
  LUT2 un2_pre_out_axb_2_cZ (
	.I0(mult_out_i[2]),
	.I1(out_inner_prod_i[2]),
	.O(un2_pre_out_axb_2)
);
defparam un2_pre_out_axb_2_cZ.INIT=4'h6;
// @15:37
  LUT2 un2_pre_out_axb_3_cZ (
	.I0(mult_out_i[3]),
	.I1(out_inner_prod_i[3]),
	.O(un2_pre_out_axb_3)
);
defparam un2_pre_out_axb_3_cZ.INIT=4'h6;
// @15:37
  LUT2 un2_pre_out_axb_4_cZ (
	.I0(mult_out_i[4]),
	.I1(out_inner_prod_i[4]),
	.O(un2_pre_out_axb_4)
);
defparam un2_pre_out_axb_4_cZ.INIT=4'h6;
// @15:37
  LUT2 un2_pre_out_axb_5_cZ (
	.I0(mult_out_i[5]),
	.I1(out_inner_prod_i[5]),
	.O(un2_pre_out_axb_5)
);
defparam un2_pre_out_axb_5_cZ.INIT=4'h6;
// @15:37
  LUT2 un2_pre_out_axb_6_cZ (
	.I0(mult_out_i[6]),
	.I1(out_inner_prod_i[6]),
	.O(un2_pre_out_axb_6)
);
defparam un2_pre_out_axb_6_cZ.INIT=4'h6;
// @15:37
  LUT2 un2_pre_out_axb_7_cZ (
	.I0(mult_out_i[7]),
	.I1(out_inner_prod_i[7]),
	.O(un2_pre_out_axb_7)
);
defparam un2_pre_out_axb_7_cZ.INIT=4'h6;
// @15:37
  LUT2 un2_pre_out_axb_8_cZ (
	.I0(mult_out_i[8]),
	.I1(out_inner_prod_i[8]),
	.O(un2_pre_out_axb_8)
);
defparam un2_pre_out_axb_8_cZ.INIT=4'h6;
// @15:37
  LUT2 un2_pre_out_axb_9_cZ (
	.I0(mult_out_i[9]),
	.I1(out_inner_prod_i[9]),
	.O(un2_pre_out_axb_9)
);
defparam un2_pre_out_axb_9_cZ.INIT=4'h6;
// @15:37
  LUT2 un2_pre_out_axb_10_cZ (
	.I0(mult_out_i[10]),
	.I1(out_inner_prod_i[10]),
	.O(un2_pre_out_axb_10)
);
defparam un2_pre_out_axb_10_cZ.INIT=4'h6;
// @15:37
  LUT2 un2_pre_out_axb_11_cZ (
	.I0(mult_out_i[11]),
	.I1(out_inner_prod_i[11]),
	.O(un2_pre_out_axb_11)
);
defparam un2_pre_out_axb_11_cZ.INIT=4'h6;
// @15:37
  XORCY un2_pre_out_s_11 (
	.LI(un2_pre_out_axb_11),
	.CI(un2_pre_out_cry_10),
	.O(un2_pre_out_s_11_0)
);
// @15:37
  XORCY un2_pre_out_s_10 (
	.LI(un2_pre_out_axb_10),
	.CI(un2_pre_out_cry_9),
	.O(un2_pre_out_10)
);
// @15:37
  MUXCY_L un2_pre_out_cry_10_cZ (
	.DI(mult_out_i[10]),
	.CI(un2_pre_out_cry_9),
	.S(un2_pre_out_axb_10),
	.LO(un2_pre_out_cry_10)
);
// @15:37
  XORCY un2_pre_out_s_9 (
	.LI(un2_pre_out_axb_9),
	.CI(un2_pre_out_cry_8),
	.O(un2_pre_out_9)
);
// @15:37
  MUXCY_L un2_pre_out_cry_9_cZ (
	.DI(mult_out_i[9]),
	.CI(un2_pre_out_cry_8),
	.S(un2_pre_out_axb_9),
	.LO(un2_pre_out_cry_9)
);
// @15:37
  XORCY un2_pre_out_s_8 (
	.LI(un2_pre_out_axb_8),
	.CI(un2_pre_out_cry_7),
	.O(un2_pre_out_8)
);
// @15:37
  MUXCY_L un2_pre_out_cry_8_cZ (
	.DI(mult_out_i[8]),
	.CI(un2_pre_out_cry_7),
	.S(un2_pre_out_axb_8),
	.LO(un2_pre_out_cry_8)
);
// @15:37
  XORCY un2_pre_out_s_7 (
	.LI(un2_pre_out_axb_7),
	.CI(un2_pre_out_cry_6),
	.O(un2_pre_out_7)
);
// @15:37
  MUXCY_L un2_pre_out_cry_7_cZ (
	.DI(mult_out_i[7]),
	.CI(un2_pre_out_cry_6),
	.S(un2_pre_out_axb_7),
	.LO(un2_pre_out_cry_7)
);
// @15:37
  XORCY un2_pre_out_s_6 (
	.LI(un2_pre_out_axb_6),
	.CI(un2_pre_out_cry_5),
	.O(un2_pre_out_6)
);
// @15:37
  MUXCY_L un2_pre_out_cry_6_cZ (
	.DI(mult_out_i[6]),
	.CI(un2_pre_out_cry_5),
	.S(un2_pre_out_axb_6),
	.LO(un2_pre_out_cry_6)
);
// @15:37
  XORCY un2_pre_out_s_5 (
	.LI(un2_pre_out_axb_5),
	.CI(un2_pre_out_cry_4),
	.O(un2_pre_out_5)
);
// @15:37
  MUXCY_L un2_pre_out_cry_5_cZ (
	.DI(mult_out_i[5]),
	.CI(un2_pre_out_cry_4),
	.S(un2_pre_out_axb_5),
	.LO(un2_pre_out_cry_5)
);
// @15:37
  XORCY un2_pre_out_s_4 (
	.LI(un2_pre_out_axb_4),
	.CI(un2_pre_out_cry_3),
	.O(un2_pre_out_4)
);
// @15:37
  MUXCY_L un2_pre_out_cry_4_cZ (
	.DI(mult_out_i[4]),
	.CI(un2_pre_out_cry_3),
	.S(un2_pre_out_axb_4),
	.LO(un2_pre_out_cry_4)
);
// @15:37
  XORCY un2_pre_out_s_3 (
	.LI(un2_pre_out_axb_3),
	.CI(un2_pre_out_cry_2),
	.O(un2_pre_out_3)
);
// @15:37
  MUXCY_L un2_pre_out_cry_3_cZ (
	.DI(mult_out_i[3]),
	.CI(un2_pre_out_cry_2),
	.S(un2_pre_out_axb_3),
	.LO(un2_pre_out_cry_3)
);
// @15:37
  XORCY un2_pre_out_s_2 (
	.LI(un2_pre_out_axb_2),
	.CI(un2_pre_out_cry_1),
	.O(un2_pre_out_2)
);
// @15:37
  MUXCY_L un2_pre_out_cry_2_cZ (
	.DI(mult_out_i[2]),
	.CI(un2_pre_out_cry_1),
	.S(un2_pre_out_axb_2),
	.LO(un2_pre_out_cry_2)
);
// @15:37
  XORCY un2_pre_out_s_1 (
	.LI(un2_pre_out_axb_1),
	.CI(un2_pre_out_cry_0),
	.O(un2_pre_out_1)
);
// @15:37
  MUXCY_L un2_pre_out_cry_1_cZ (
	.DI(mult_out_i[1]),
	.CI(un2_pre_out_cry_0),
	.S(un2_pre_out_axb_1),
	.LO(un2_pre_out_cry_1)
);
// @15:37
  MUXCY_L un2_pre_out_cry_0_cZ (
	.DI(mult_out_i[0]),
	.CI(GND),
	.S(un2_pre_out[0]),
	.LO(un2_pre_out_cry_0)
);
  GND GND_cZ (
	.G(GND)
);
  VCC VCC_cZ (
	.P(VCC)
);
endmodule