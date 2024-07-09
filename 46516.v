module mult_with_reg (
  un8_rnd_out,
  un8_rnd_out_P_19,
  out_inv_sqrt_0,
  out_inv_sqrt_1,
  out_inv_sqrt_2,
  out_inv_sqrt_7,
  out_inv_sqrt_8,
  out_inv_sqrt_9,
  out_inv_sqrt_10,
  out_inv_sqrt_11,
  out_inner_prod_r,
  pre_out_19,
  pre_out_20,
  pre_out_21,
  pre_out_22,
  pre_out_reg,
  N_425_i,
  N_428_i,
  N_431_i,
  N_434_i,
  N_512_i,
  clk,
  PATTERNDETECT_32
)
;
output [10:0] un8_rnd_out ;
output un8_rnd_out_P_19 ;
input out_inv_sqrt_0 ;
input out_inv_sqrt_1 ;
input out_inv_sqrt_2 ;
input out_inv_sqrt_7 ;
input out_inv_sqrt_8 ;
input out_inv_sqrt_9 ;
input out_inv_sqrt_10 ;
input out_inv_sqrt_11 ;
input [11:0] out_inner_prod_r ;
output pre_out_19 ;
output pre_out_20 ;
output pre_out_21 ;
output pre_out_22 ;
output [23:23] pre_out_reg ;
input N_425_i ;
input N_428_i ;
input N_431_i ;
input N_434_i ;
input N_512_i ;
input clk ;
output PATTERNDETECT_32 ;
wire un8_rnd_out_P_19 ;
wire out_inv_sqrt_0 ;
wire out_inv_sqrt_1 ;
wire out_inv_sqrt_2 ;
wire out_inv_sqrt_7 ;
wire out_inv_sqrt_8 ;
wire out_inv_sqrt_9 ;
wire out_inv_sqrt_10 ;
wire out_inv_sqrt_11 ;
wire pre_out_19 ;
wire pre_out_20 ;
wire pre_out_21 ;
wire pre_out_22 ;
wire N_425_i ;
wire N_428_i ;
wire N_431_i ;
wire N_434_i ;
wire N_512_i ;
wire clk ;
wire PATTERNDETECT_32 ;
wire [29:0] ACOUT_12;
wire [17:0] BCOUT_12;
wire [3:0] CARRYOUT_12;
wire [6:0] un8_rnd_out_P;
wire [23:20] P_uc_2;
wire [47:24] P_uc_12;
wire [47:0] PCOUT_12;
wire [29:0] ACOUT_32;
wire [17:0] BCOUT_32;
wire [3:0] CARRYOUT_32;
wire [18:0] pre_out;
wire [47:24] P_uc_32;
wire [47:0] PCOUT_32;
wire CARRYCASCOUT_12 ;
wire MULTSIGNOUT_12 ;
wire OVERFLOW_12 ;
wire N_3 ;
wire PATTERNBDETECT_12 ;
wire PATTERNDETECT_12 ;
wire UNDERFLOW_12 ;
wire VCC ;
wire GND ;
wire CARRYCASCOUT_32 ;
wire MULTSIGNOUT_32 ;
wire OVERFLOW_32 ;
wire PATTERNBDETECT_32 ;
wire UNDERFLOW_32 ;
// @13:37
  DSP48E1 \un8_rnd_out[11:0],un8_rnd_out_un0  (
	.ACOUT(ACOUT_12[29:0]),
	.BCOUT(BCOUT_12[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_12),
	.CARRYOUT(CARRYOUT_12[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_12),
	.OVERFLOW(OVERFLOW_12),
	.P({P_uc_12[47:24], P_uc_2[23:20], un8_rnd_out_P_19, un8_rnd_out[10:0], N_3, un8_rnd_out_P[6:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_12),
	.PATTERNDETECT(PATTERNDETECT_12),
	.PCOUT(PCOUT_12[47:0]),
	.UNDERFLOW(UNDERFLOW_12),
	.A({out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_10, out_inv_sqrt_9, out_inv_sqrt_8, out_inv_sqrt_7, N_434_i, N_431_i, N_428_i, N_425_i, out_inv_sqrt_2, out_inv_sqrt_1, out_inv_sqrt_0}),
	.ACIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.ALUMODE({GND, GND, GND, GND}),
	.B({out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11:0]}),
	.BCIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.C({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, VCC, GND, GND, GND, GND, GND, GND, GND}),
	.CARRYCASCIN(GND),
	.CARRYIN(GND),
	.CARRYINSEL({GND, GND, GND}),
	.CEA1(N_512_i),
	.CEA2(VCC),
	.CEAD(GND),
	.CEALUMODE(GND),
	.CEB1(GND),
	.CEB2(VCC),
	.CEC(GND),
	.CECARRYIN(GND),
	.CECTRL(GND),
	.CED(GND),
	.CEINMODE(GND),
	.CEM(GND),
	.CEP(GND),
	.CLK(clk),
	.D({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND}),
	.INMODE({GND, GND, GND, GND, GND}),
	.MULTSIGNIN(GND),
	.OPMODE({GND, VCC, VCC, GND, VCC, GND, VCC}),
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
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .ACASCREG=2;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .ADREG=0;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .ALUMODEREG=0;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .AREG=2;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .AUTORESET_PATDET="NO_RESET";
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .A_INPUT="DIRECT";
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .BCASCREG=1;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .BREG=1;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .B_INPUT="DIRECT";
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .CARRYINREG=0;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .CARRYINSELREG=0;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .CREG=0;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .DREG=0;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .INMODEREG=0;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .MREG=0;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .OPMODEREG=0;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .PREG=0;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .USE_DPORT="FALSE";
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .USE_MULT="MULTIPLY";
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .USE_SIMD="ONE48";
// @13:37
  DSP48E1 \pre_out[23:0]  (
	.ACOUT(ACOUT_32[29:0]),
	.BCOUT(BCOUT_32[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_32),
	.CARRYOUT(CARRYOUT_32[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_32),
	.OVERFLOW(OVERFLOW_32),
	.P({P_uc_32[47:24], pre_out_reg[23], pre_out_22, pre_out_21, pre_out_20, pre_out_19, pre_out[18:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_32),
	.PATTERNDETECT(PATTERNDETECT_32),
	.PCOUT(PCOUT_32[47:0]),
	.UNDERFLOW(UNDERFLOW_32),
	.A({out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_11, out_inv_sqrt_10, out_inv_sqrt_9, out_inv_sqrt_8, out_inv_sqrt_7, N_434_i, N_431_i, N_428_i, N_425_i, out_inv_sqrt_2, out_inv_sqrt_1, out_inv_sqrt_0}),
	.ACIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.ALUMODE({GND, GND, GND, GND}),
	.B({out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11:0]}),
	.BCIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.C({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.CARRYCASCIN(GND),
	.CARRYIN(GND),
	.CARRYINSEL({GND, GND, GND}),
	.CEA1(N_512_i),
	.CEA2(VCC),
	.CEAD(GND),
	.CEALUMODE(GND),
	.CEB1(GND),
	.CEB2(VCC),
	.CEC(GND),
	.CECARRYIN(GND),
	.CECTRL(GND),
	.CED(GND),
	.CEINMODE(GND),
	.CEM(GND),
	.CEP(GND),
	.CLK(clk),
	.D({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND}),
	.INMODE({GND, GND, GND, GND, GND}),
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
defparam \pre_out[23:0] .ACASCREG=2;
defparam \pre_out[23:0] .ADREG=0;
defparam \pre_out[23:0] .ALUMODEREG=0;
defparam \pre_out[23:0] .AREG=2;
defparam \pre_out[23:0] .AUTORESET_PATDET="NO_RESET";
defparam \pre_out[23:0] .A_INPUT="DIRECT";
defparam \pre_out[23:0] .BCASCREG=1;
defparam \pre_out[23:0] .BREG=1;
defparam \pre_out[23:0] .B_INPUT="DIRECT";
defparam \pre_out[23:0] .CARRYINREG=0;
defparam \pre_out[23:0] .CARRYINSELREG=0;
defparam \pre_out[23:0] .CREG=1;
defparam \pre_out[23:0] .DREG=0;
defparam \pre_out[23:0] .INMODEREG=0;
defparam \pre_out[23:0] .MASK=48'b111111111111111111111111011111111111111111111111;
defparam \pre_out[23:0] .MREG=0;
defparam \pre_out[23:0] .OPMODEREG=0;
defparam \pre_out[23:0] .PATTERN=48'b111111111111111111111111111111111111111111111111;
defparam \pre_out[23:0] .PREG=0;
defparam \pre_out[23:0] .SEL_MASK="MASK";
defparam \pre_out[23:0] .USE_DPORT="FALSE";
defparam \pre_out[23:0] .USE_MULT="MULTIPLY";
defparam \pre_out[23:0] .USE_PATTERN_DETECT="PATDET";
defparam \pre_out[23:0] .USE_SIMD="ONE48";
  VCC VCC_cZ (
	.P(VCC)
);
  GND GND_cZ (
	.G(GND)
);
endmodule