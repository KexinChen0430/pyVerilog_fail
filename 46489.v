module add_subZ2_2 (
  pre_out_r,
  vec_out_i_AQ_1,
  in_b_i_reg,
  mult1_out_0,
  P_uc_20_0,
  PATTERNDETECT_2,
  clk
)
;
output [23:7] pre_out_r ;
input [11:0] vec_out_i_AQ_1 ;
input [11:0] in_b_i_reg ;
input [23:0] mult1_out_0 ;
input [47:24] P_uc_20_0 ;
output PATTERNDETECT_2 ;
input clk ;
wire PATTERNDETECT_2 ;
wire clk ;
wire [29:0] ACOUT_2;
wire [17:0] BCOUT_2;
wire [3:0] CARRYOUT_2;
wire [6:0] output_Z;
wire [47:24] P_uc_2;
wire [47:0] PCOUT_2;
wire CARRYCASCOUT_2 ;
wire MULTSIGNOUT_2 ;
wire OVERFLOW_2 ;
wire PATTERNBDETECT_2 ;
wire UNDERFLOW_2 ;
wire VCC ;
wire GND ;
// @14:30
  DSP48E1 \output[23:0]  (
	.ACOUT(ACOUT_2[29:0]),
	.BCOUT(BCOUT_2[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_2),
	.CARRYOUT(CARRYOUT_2[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_2),
	.OVERFLOW(OVERFLOW_2),
	.P({P_uc_2[47:24], pre_out_r[23:7], output_Z[6:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_2),
	.PATTERNDETECT(PATTERNDETECT_2),
	.PCOUT(PCOUT_2[47:0]),
	.UNDERFLOW(UNDERFLOW_2),
	.A({vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11], vec_out_i_AQ_1[11:0]}),
	.ACIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.ALUMODE({GND, GND, VCC, VCC}),
	.B({in_b_i_reg[11], in_b_i_reg[11], in_b_i_reg[11], in_b_i_reg[11], in_b_i_reg[11], in_b_i_reg[11], in_b_i_reg[11:0]}),
	.BCIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.C({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.CARRYCASCIN(GND),
	.CARRYIN(GND),
	.CARRYINSEL({GND, GND, GND}),
	.CEA1(VCC),
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
	.OPMODE({GND, GND, VCC, GND, VCC, GND, VCC}),
	.PCIN({P_uc_20_0[47:24], mult1_out_0[23:0]}),
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
defparam \output[23:0] .ACASCREG=2;
defparam \output[23:0] .ADREG=0;
defparam \output[23:0] .ALUMODEREG=0;
defparam \output[23:0] .AREG=2;
defparam \output[23:0] .AUTORESET_PATDET="NO_RESET";
defparam \output[23:0] .A_INPUT="DIRECT";
defparam \output[23:0] .BCASCREG=1;
defparam \output[23:0] .BREG=1;
defparam \output[23:0] .B_INPUT="DIRECT";
defparam \output[23:0] .CARRYINREG=0;
defparam \output[23:0] .CARRYINSELREG=0;
defparam \output[23:0] .CREG=1;
defparam \output[23:0] .DREG=0;
defparam \output[23:0] .INMODEREG=0;
defparam \output[23:0] .MASK=48'b111111111111111111111111100001111111111111111111;
defparam \output[23:0] .MREG=0;
defparam \output[23:0] .OPMODEREG=0;
defparam \output[23:0] .PATTERN=48'b111111111111111111111111100001111111111111111111;
defparam \output[23:0] .PREG=0;
defparam \output[23:0] .SEL_MASK="MASK";
defparam \output[23:0] .USE_DPORT="FALSE";
defparam \output[23:0] .USE_MULT="MULTIPLY";
defparam \output[23:0] .USE_PATTERN_DETECT="PATDET";
defparam \output[23:0] .USE_SIMD="ONE48";
  VCC VCC_cZ (
	.P(VCC)
);
  GND GND_cZ (
	.G(GND)
);
endmodule