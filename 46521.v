module \multiplier_enabled_nr.mult3  (
  un8_rnd_out_un0_P_9,
  un8_rnd_out_un0_P_10,
  un8_rnd_out_un0_P_11,
  un8_rnd_out_un0_P_12,
  un8_rnd_out_un0_P_13,
  un8_rnd_out_un0_P_14,
  un8_rnd_out_un0_P_15,
  un8_rnd_out_un0_P_16,
  un8_rnd_out_un0_P_17,
  un8_rnd_out_un0_P_18,
  un8_rnd_out_un0_P_19,
  mult1_out,
  mult2_out,
  pre_out_23,
  un2_output_3,
  PATTERNDETECT_15
)
;
output un8_rnd_out_un0_P_9 ;
output un8_rnd_out_un0_P_10 ;
output un8_rnd_out_un0_P_11 ;
output un8_rnd_out_un0_P_12 ;
output un8_rnd_out_un0_P_13 ;
output un8_rnd_out_un0_P_14 ;
output un8_rnd_out_un0_P_15 ;
output un8_rnd_out_un0_P_16 ;
output un8_rnd_out_un0_P_17 ;
output un8_rnd_out_un0_P_18 ;
output un8_rnd_out_un0_P_19 ;
input [11:0] mult1_out ;
input [11:0] mult2_out ;
output pre_out_23 ;
output un2_output_3 ;
output PATTERNDETECT_15 ;
wire un8_rnd_out_un0_P_9 ;
wire un8_rnd_out_un0_P_10 ;
wire un8_rnd_out_un0_P_11 ;
wire un8_rnd_out_un0_P_12 ;
wire un8_rnd_out_un0_P_13 ;
wire un8_rnd_out_un0_P_14 ;
wire un8_rnd_out_un0_P_15 ;
wire un8_rnd_out_un0_P_16 ;
wire un8_rnd_out_un0_P_17 ;
wire un8_rnd_out_un0_P_18 ;
wire un8_rnd_out_un0_P_19 ;
wire pre_out_23 ;
wire un2_output_3 ;
wire PATTERNDETECT_15 ;
wire [22:0] pre_out;
wire [29:0] ACOUT_11;
wire [17:0] BCOUT_11;
wire [3:0] CARRYOUT_11;
wire [8:0] un8_rnd_out_un0_P;
wire [23:20] P_uc_1;
wire [47:24] P_uc_11;
wire [47:0] PCOUT_11;
wire [29:0] ACOUT_15;
wire [17:0] BCOUT_15;
wire [3:0] CARRYOUT_15;
wire [47:24] P_uc_15;
wire [47:0] PCOUT_15;
wire CARRYCASCOUT_11 ;
wire MULTSIGNOUT_11 ;
wire OVERFLOW_11 ;
wire PATTERNBDETECT_11 ;
wire PATTERNDETECT_11 ;
wire UNDERFLOW_11 ;
wire VCC ;
wire GND ;
wire CARRYCASCOUT_15 ;
wire MULTSIGNOUT_15 ;
wire OVERFLOW_15 ;
wire PATTERNBDETECT_15 ;
wire UNDERFLOW_15 ;
// @12:39
  LUT4 \gen_sat.un2_output_3  (
	.I0(pre_out[19]),
	.I1(pre_out[20]),
	.I2(pre_out[21]),
	.I3(pre_out[22]),
	.O(un2_output_3)
);
defparam \gen_sat.un2_output_3 .INIT=16'h0001;
// @12:35
  DSP48E1 \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0  (
	.ACOUT(ACOUT_11[29:0]),
	.BCOUT(BCOUT_11[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_11),
	.CARRYOUT(CARRYOUT_11[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_11),
	.OVERFLOW(OVERFLOW_11),
	.P({P_uc_11[47:24], P_uc_1[23:20], un8_rnd_out_un0_P_19, un8_rnd_out_un0_P_18, un8_rnd_out_un0_P_17, un8_rnd_out_un0_P_16, un8_rnd_out_un0_P_15, un8_rnd_out_un0_P_14, un8_rnd_out_un0_P_13, un8_rnd_out_un0_P_12, un8_rnd_out_un0_P_11, un8_rnd_out_un0_P_10, un8_rnd_out_un0_P_9, un8_rnd_out_un0_P[8:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_11),
	.PATTERNDETECT(PATTERNDETECT_11),
	.PCOUT(PCOUT_11[47:0]),
	.UNDERFLOW(UNDERFLOW_11),
	.A({mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11:0]}),
	.ACIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.ALUMODE({GND, GND, GND, GND}),
	.B({mult2_out[11], mult2_out[11], mult2_out[11], mult2_out[11], mult2_out[11], mult2_out[11], mult2_out[11:0]}),
	.BCIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.C({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, VCC, GND, GND, GND, GND, GND, GND, GND}),
	.CARRYCASCIN(GND),
	.CARRYIN(GND),
	.CARRYINSEL({GND, GND, GND}),
	.CEA1(GND),
	.CEA2(GND),
	.CEAD(GND),
	.CEALUMODE(GND),
	.CEB1(GND),
	.CEB2(GND),
	.CEC(GND),
	.CECARRYIN(GND),
	.CECTRL(GND),
	.CED(GND),
	.CEINMODE(GND),
	.CEM(GND),
	.CEP(GND),
	.CLK(GND),
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
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .ACASCREG=0;
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .ADREG=0;
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .ALUMODEREG=0;
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .AREG=0;
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .AUTORESET_PATDET="NO_RESET";
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .A_INPUT="DIRECT";
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .BCASCREG=0;
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .BREG=0;
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .B_INPUT="DIRECT";
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .CARRYINREG=0;
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .CARRYINSELREG=0;
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .CREG=0;
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .DREG=0;
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .INMODEREG=0;
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .MREG=0;
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .OPMODEREG=0;
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .PREG=0;
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .USE_DPORT="FALSE";
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .USE_MULT="MULTIPLY";
defparam \un8_rnd_out[11:0],enabled_nr.mult3.un8_rnd_out_un0 .USE_SIMD="ONE48";
// @12:35
  DSP48E1 \pre_out[23:0]  (
	.ACOUT(ACOUT_15[29:0]),
	.BCOUT(BCOUT_15[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_15),
	.CARRYOUT(CARRYOUT_15[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_15),
	.OVERFLOW(OVERFLOW_15),
	.P({P_uc_15[47:24], pre_out_23, pre_out[22:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_15),
	.PATTERNDETECT(PATTERNDETECT_15),
	.PCOUT(PCOUT_15[47:0]),
	.UNDERFLOW(UNDERFLOW_15),
	.A({mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11], mult1_out[11:0]}),
	.ACIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.ALUMODE({GND, GND, GND, GND}),
	.B({mult2_out[11], mult2_out[11], mult2_out[11], mult2_out[11], mult2_out[11], mult2_out[11], mult2_out[11:0]}),
	.BCIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.C({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.CARRYCASCIN(GND),
	.CARRYIN(GND),
	.CARRYINSEL({GND, GND, GND}),
	.CEA1(GND),
	.CEA2(GND),
	.CEAD(GND),
	.CEALUMODE(GND),
	.CEB1(GND),
	.CEB2(GND),
	.CEC(GND),
	.CECARRYIN(GND),
	.CECTRL(GND),
	.CED(GND),
	.CEINMODE(GND),
	.CEM(GND),
	.CEP(GND),
	.CLK(GND),
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
defparam \pre_out[23:0] .ACASCREG=0;
defparam \pre_out[23:0] .ADREG=0;
defparam \pre_out[23:0] .ALUMODEREG=0;
defparam \pre_out[23:0] .AREG=0;
defparam \pre_out[23:0] .AUTORESET_PATDET="NO_RESET";
defparam \pre_out[23:0] .A_INPUT="DIRECT";
defparam \pre_out[23:0] .BCASCREG=0;
defparam \pre_out[23:0] .BREG=0;
defparam \pre_out[23:0] .B_INPUT="DIRECT";
defparam \pre_out[23:0] .CARRYINREG=0;
defparam \pre_out[23:0] .CARRYINSELREG=0;
defparam \pre_out[23:0] .CREG=1;
defparam \pre_out[23:0] .DREG=0;
defparam \pre_out[23:0] .INMODEREG=0;
defparam \pre_out[23:0] .MASK=48'b111111111111111111111111100001111111111111111111;
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