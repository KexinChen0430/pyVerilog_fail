module add_subZ2_4 (
  pre_out_r,
  vec_out_i_AQ_3,
  in_b_i_reg,
  mult1_out_0,
  P_uc_28_0,
  PATTERNDETECT_6,
  clk
)
;
output [23:7] pre_out_r ;
input [11:0] vec_out_i_AQ_3 ;
input [11:0] in_b_i_reg ;
input [23:0] mult1_out_0 ;
input [47:24] P_uc_28_0 ;
output PATTERNDETECT_6 ;
input clk ;
wire PATTERNDETECT_6 ;
wire clk ;
wire [29:0] ACOUT_6;
wire [17:0] BCOUT_6;
wire [3:0] CARRYOUT_6;
wire [6:0] output_Z;
wire [47:24] P_uc_6;
wire [47:0] PCOUT_6;
wire CARRYCASCOUT_6 ;
wire MULTSIGNOUT_6 ;
wire OVERFLOW_6 ;
wire PATTERNBDETECT_6 ;
wire UNDERFLOW_6 ;
wire VCC ;
wire GND ;
// @14:30
  DSP48E1 \output[23:0]  (
	.ACOUT(ACOUT_6[29:0]),
	.BCOUT(BCOUT_6[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_6),
	.CARRYOUT(CARRYOUT_6[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_6),
	.OVERFLOW(OVERFLOW_6),
	.P({P_uc_6[47:24], pre_out_r[23:7], output_Z[6:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_6),
	.PATTERNDETECT(PATTERNDETECT_6),
	.PCOUT(PCOUT_6[47:0]),
	.UNDERFLOW(UNDERFLOW_6),
	.A({vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11:0]}),
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
	.PCIN({P_uc_28_0[47:24], mult1_out_0[23:0]}),
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