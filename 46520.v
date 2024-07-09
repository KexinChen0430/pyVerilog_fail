module multiplier_1 (
  mult2_out,
  pre_output,
  out_inner_prod_r,
  start_inv_sqrt,
  clk
)
;
output [11:0] mult2_out ;
input [11:0] pre_output ;
input [11:0] out_inner_prod_r ;
input start_inv_sqrt ;
input clk ;
wire start_inv_sqrt ;
wire clk ;
wire [23:0] pre_out;
wire [18:0] un8_rnd_out_P_0;
wire [19:19] un8_rnd_out_P_1;
wire [29:0] ACOUT_10;
wire [17:0] BCOUT_10;
wire [3:0] CARRYOUT_10;
wire [23:20] P_uc_0;
wire [47:24] P_uc_10;
wire [47:0] PCOUT_10;
wire [29:0] ACOUT_14;
wire [17:0] BCOUT_14;
wire [3:0] CARRYOUT_14;
wire [47:24] P_uc_14;
wire [47:0] PCOUT_14;
wire un5_output_3_0 ;
wire PATTERNDETECT_14 ;
wire CARRYCASCOUT_10 ;
wire MULTSIGNOUT_10 ;
wire OVERFLOW_10 ;
wire N_3 ;
wire PATTERNBDETECT_10 ;
wire PATTERNDETECT_10 ;
wire UNDERFLOW_10 ;
wire VCC ;
wire GND ;
wire CARRYCASCOUT_14 ;
wire MULTSIGNOUT_14 ;
wire OVERFLOW_14 ;
wire PATTERNBDETECT_14 ;
wire UNDERFLOW_14 ;
// @12:39
  LUT2 \gen_sat.un5_output_3_0  (
	.I0(pre_out[21]),
	.I1(pre_out[22]),
	.O(un5_output_3_0)
);
defparam \gen_sat.un5_output_3_0 .INIT=4'h8;
// @12:39
  LUT6 \output_f0[0]  (
	.I0(un8_rnd_out_P_0[8]),
	.I1(pre_out[19]),
	.I2(pre_out[20]),
	.I3(pre_out[23]),
	.I4(un5_output_3_0),
	.I5(PATTERNDETECT_14),
	.O(mult2_out[0])
);
defparam \output_f0[0] .INIT=64'h80AA00AA80FF00FF;
// @12:39
  LUT6 \output_f0[1]  (
	.I0(un8_rnd_out_P_0[9]),
	.I1(pre_out[19]),
	.I2(pre_out[20]),
	.I3(pre_out[23]),
	.I4(un5_output_3_0),
	.I5(PATTERNDETECT_14),
	.O(mult2_out[1])
);
defparam \output_f0[1] .INIT=64'h80AA00AA80FF00FF;
// @12:39
  LUT6 \output_f0[2]  (
	.I0(un8_rnd_out_P_0[10]),
	.I1(pre_out[19]),
	.I2(pre_out[20]),
	.I3(pre_out[23]),
	.I4(un5_output_3_0),
	.I5(PATTERNDETECT_14),
	.O(mult2_out[2])
);
defparam \output_f0[2] .INIT=64'h80AA00AA80FF00FF;
// @12:39
  LUT6 \output_f0[3]  (
	.I0(un8_rnd_out_P_0[11]),
	.I1(pre_out[19]),
	.I2(pre_out[20]),
	.I3(pre_out[23]),
	.I4(un5_output_3_0),
	.I5(PATTERNDETECT_14),
	.O(mult2_out[3])
);
defparam \output_f0[3] .INIT=64'h80AA00AA80FF00FF;
// @12:39
  LUT6 \output_f0[4]  (
	.I0(un8_rnd_out_P_0[12]),
	.I1(pre_out[19]),
	.I2(pre_out[20]),
	.I3(pre_out[23]),
	.I4(un5_output_3_0),
	.I5(PATTERNDETECT_14),
	.O(mult2_out[4])
);
defparam \output_f0[4] .INIT=64'h80AA00AA80FF00FF;
// @12:39
  LUT6 \output_f0[5]  (
	.I0(un8_rnd_out_P_0[13]),
	.I1(pre_out[19]),
	.I2(pre_out[20]),
	.I3(pre_out[23]),
	.I4(un5_output_3_0),
	.I5(PATTERNDETECT_14),
	.O(mult2_out[5])
);
defparam \output_f0[5] .INIT=64'h80AA00AA80FF00FF;
// @12:39
  LUT6 \output_f0[6]  (
	.I0(un8_rnd_out_P_0[14]),
	.I1(pre_out[19]),
	.I2(pre_out[20]),
	.I3(pre_out[23]),
	.I4(un5_output_3_0),
	.I5(PATTERNDETECT_14),
	.O(mult2_out[6])
);
defparam \output_f0[6] .INIT=64'h80AA00AA80FF00FF;
// @12:39
  LUT6 \output_f0[7]  (
	.I0(un8_rnd_out_P_0[15]),
	.I1(pre_out[19]),
	.I2(pre_out[20]),
	.I3(pre_out[23]),
	.I4(un5_output_3_0),
	.I5(PATTERNDETECT_14),
	.O(mult2_out[7])
);
defparam \output_f0[7] .INIT=64'h80AA00AA80FF00FF;
// @12:39
  LUT6 \output_f0[8]  (
	.I0(un8_rnd_out_P_0[16]),
	.I1(pre_out[19]),
	.I2(pre_out[20]),
	.I3(pre_out[23]),
	.I4(un5_output_3_0),
	.I5(PATTERNDETECT_14),
	.O(mult2_out[8])
);
defparam \output_f0[8] .INIT=64'h80AA00AA80FF00FF;
// @12:39
  LUT6 \output_f0[9]  (
	.I0(un8_rnd_out_P_0[17]),
	.I1(pre_out[19]),
	.I2(pre_out[20]),
	.I3(pre_out[23]),
	.I4(un5_output_3_0),
	.I5(PATTERNDETECT_14),
	.O(mult2_out[9])
);
defparam \output_f0[9] .INIT=64'h80AA00AA80FF00FF;
// @12:39
  LUT6 \output_f0[10]  (
	.I0(un8_rnd_out_P_0[18]),
	.I1(pre_out[19]),
	.I2(pre_out[20]),
	.I3(pre_out[23]),
	.I4(un5_output_3_0),
	.I5(PATTERNDETECT_14),
	.O(mult2_out[10])
);
defparam \output_f0[10] .INIT=64'h80AA00AA80FF00FF;
// @12:39
  LUT6 \output_f0_0[11]  (
	.I0(un8_rnd_out_P_1[19]),
	.I1(pre_out[19]),
	.I2(pre_out[20]),
	.I3(pre_out[23]),
	.I4(un5_output_3_0),
	.I5(PATTERNDETECT_14),
	.O(mult2_out[11])
);
defparam \output_f0_0[11] .INIT=64'hBFAAFFAABF00FF00;
// @12:35
  DSP48E1 \un8_rnd_out[11:0],un8_rnd_out_un0  (
	.ACOUT(ACOUT_10[29:0]),
	.BCOUT(BCOUT_10[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_10),
	.CARRYOUT(CARRYOUT_10[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_10),
	.OVERFLOW(OVERFLOW_10),
	.P({P_uc_10[47:24], P_uc_0[23:20], un8_rnd_out_P_1[19], un8_rnd_out_P_0[18:8], N_3, un8_rnd_out_P_0[6:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_10),
	.PATTERNDETECT(PATTERNDETECT_10),
	.PCOUT(PCOUT_10[47:0]),
	.UNDERFLOW(UNDERFLOW_10),
	.A({pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11:0]}),
	.ACIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.ALUMODE({GND, GND, GND, GND}),
	.B({out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11:0]}),
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
	.CEB2(start_inv_sqrt),
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
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .ACASCREG=0;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .ADREG=0;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .ALUMODEREG=0;
defparam \un8_rnd_out[11:0],un8_rnd_out_un0 .AREG=0;
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
// @12:35
  DSP48E1 \pre_out[23:0]  (
	.ACOUT(ACOUT_14[29:0]),
	.BCOUT(BCOUT_14[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_14),
	.CARRYOUT(CARRYOUT_14[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_14),
	.OVERFLOW(OVERFLOW_14),
	.P({P_uc_14[47:24], pre_out[23:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_14),
	.PATTERNDETECT(PATTERNDETECT_14),
	.PCOUT(PCOUT_14[47:0]),
	.UNDERFLOW(UNDERFLOW_14),
	.A({pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11], pre_output[11:0]}),
	.ACIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.ALUMODE({GND, GND, GND, GND}),
	.B({out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11], out_inner_prod_r[11:0]}),
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
	.CEB2(start_inv_sqrt),
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
defparam \pre_out[23:0] .ACASCREG=0;
defparam \pre_out[23:0] .ADREG=0;
defparam \pre_out[23:0] .ALUMODEREG=0;
defparam \pre_out[23:0] .AREG=0;
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
defparam \pre_out[23:0] .MASK=48'b111111111111111111111111100001111111111111111111;
defparam \pre_out[23:0] .MREG=0;
defparam \pre_out[23:0] .OPMODEREG=0;
defparam \pre_out[23:0] .PATTERN=48'b111111111111111111111111100001111111111111111111;
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