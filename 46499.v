module mult_pipe_16 (
  mult1_out_23,
  mult1_out_0,
  P_uc_28_0,
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
  clk,
  N_425_i,
  N_428_i,
  N_431_i,
  N_434_i
)
;
output mult1_out_23 ;
output [23:0] mult1_out_0 ;
output [47:24] P_uc_28_0 ;
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
input clk ;
input N_425_i ;
input N_428_i ;
input N_431_i ;
input N_434_i ;
wire mult1_out_23 ;
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
wire [29:0] ACOUT_28;
wire [17:0] BCOUT_28;
wire [3:0] CARRYOUT_28;
wire [22:0] mult1_out;
wire [47:24] P_uc_28;
wire CARRYCASCOUT_28 ;
wire MULTSIGNOUT_28 ;
wire OVERFLOW_28 ;
wire PATTERNBDETECT_28 ;
wire PATTERNDETECT_28 ;
wire UNDERFLOW_28 ;
wire VCC ;
wire GND ;
// @14:30
  DSP48E1 \pre_out[23:0]  (
	.ACOUT(ACOUT_28[29:0]),
	.BCOUT(BCOUT_28[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_28),
	.CARRYOUT(CARRYOUT_28[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_28),
	.OVERFLOW(OVERFLOW_28),
	.P({P_uc_28[47:24], mult1_out_23, mult1_out[22:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_28),
	.PATTERNDETECT(PATTERNDETECT_28),
	.PCOUT({P_uc_28_0[47:24], mult1_out_0[23:0]}),
	.UNDERFLOW(UNDERFLOW_28),
	.A({out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11:0]}),
	.ACIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.ALUMODE({GND, GND, GND, GND}),
	.B({vec_out_r_AQ_3[11], vec_out_r_AQ_3[11], vec_out_r_AQ_3[11], vec_out_r_AQ_3[11], vec_out_r_AQ_3[11], vec_out_r_AQ_3[11], vec_out_r_AQ_3[11:0]}),
	.BCIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.C({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.CARRYCASCIN(GND),
	.CARRYIN(GND),
	.CARRYINSEL({GND, GND, GND}),
	.CEA1(GND),
	.CEA2(VCC),
	.CEAD(VCC),
	.CEALUMODE(GND),
	.CEB1(VCC),
	.CEB2(VCC),
	.CEC(GND),
	.CECARRYIN(GND),
	.CECTRL(GND),
	.CED(VCC),
	.CEINMODE(VCC),
	.CEM(GND),
	.CEP(GND),
	.CLK(clk),
	.D({out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_10, out_inv_sqrt_9, out_inv_sqrt_8, out_inv_sqrt_7, N_434_i, N_431_i, N_428_i, N_425_i, out_inv_sqrt_2, out_inv_sqrt_1, out_inv_sqrt_0}),
	.INMODE({GND, GND, in_b_vec_mult_sel[0], in_b_vec_mult_sel[0], GND}),
	.MULTSIGNIN(GND),
	.OPMODE({GND, GND, GND, GND, VCC, GND, VCC}),
	.PCIN({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND}),
	.RSTA(GND),
	.RSTALLCARRYIN(GND),
	.RSTALUMODE(GND),
	.RSTB(GND),
	.RSTC(GND),
	.RSTCTRL(GND),
	.RSTD(GND),
	.RSTINMODE(GND),
	.RSTM(GND),
	.RSTP(GND)
);
defparam \pre_out[23:0] .ACASCREG=1;
defparam \pre_out[23:0] .ADREG=1;
defparam \pre_out[23:0] .ALUMODEREG=0;
defparam \pre_out[23:0] .AREG=1;
defparam \pre_out[23:0] .AUTORESET_PATDET="NO_RESET";
defparam \pre_out[23:0] .A_INPUT="DIRECT";
defparam \pre_out[23:0] .BCASCREG=2;
defparam \pre_out[23:0] .BREG=2;
defparam \pre_out[23:0] .B_INPUT="DIRECT";
defparam \pre_out[23:0] .CARRYINREG=0;
defparam \pre_out[23:0] .CARRYINSELREG=0;
defparam \pre_out[23:0] .CREG=1;
defparam \pre_out[23:0] .DREG=1;
defparam \pre_out[23:0] .INMODEREG=1;
defparam \pre_out[23:0] .MREG=0;
defparam \pre_out[23:0] .OPMODEREG=0;
defparam \pre_out[23:0] .PREG=0;
defparam \pre_out[23:0] .USE_DPORT="TRUE";
defparam \pre_out[23:0] .USE_MULT="MULTIPLY";
defparam \pre_out[23:0] .USE_SIMD="ONE48";
  VCC VCC_cZ (
	.P(VCC)
);
  GND GND_cZ (
	.G(GND)
);
endmodule