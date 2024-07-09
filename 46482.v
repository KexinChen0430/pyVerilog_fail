module add_subZ2_1 (
  pre_out_r,
  vec_out_i_AQ_2,
  in_b_i_reg,
  mult1_out_0,
  P_uc_24_0,
  PATTERNDETECT_4,
  clk
)
;
output [23:7] pre_out_r ;
input [11:0] vec_out_i_AQ_2 ;
input [11:0] in_b_i_reg ;
input [23:0] mult1_out_0 ;
input [47:24] P_uc_24_0 ;
output PATTERNDETECT_4 ;
input clk ;
wire PATTERNDETECT_4 ;
wire clk ;
wire [29:0] ACOUT_4;
wire [17:0] BCOUT_4;
wire [3:0] CARRYOUT_4;
wire [6:0] output_Z;
wire [47:24] P_uc_4;
wire [47:0] PCOUT_4;
wire CARRYCASCOUT_4 ;
wire MULTSIGNOUT_4 ;
wire OVERFLOW_4 ;
wire PATTERNBDETECT_4 ;
wire UNDERFLOW_4 ;
wire VCC ;
wire GND ;
// @14:30
  DSP48E1 \output[23:0]  (
	.ACOUT(ACOUT_4[29:0]),
	.BCOUT(BCOUT_4[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_4),
	.CARRYOUT(CARRYOUT_4[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_4),
	.OVERFLOW(OVERFLOW_4),
	.P({P_uc_4[47:24], pre_out_r[23:7], output_Z[6:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_4),
	.PATTERNDETECT(PATTERNDETECT_4),
	.PCOUT(PCOUT_4[47:0]),
	.UNDERFLOW(UNDERFLOW_4),
	.A({vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11], vec_out_i_AQ_2[11:0]}),
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
	.PCIN({P_uc_24_0[47:24], mult1_out_0[23:0]}),
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