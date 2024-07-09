module add_subZ1_3 (
  pre_out_i,
  vec_out_r_AQ_0,
  in_b_i_reg,
  mult4_out_0,
  P_uc_19_0,
  PATTERNDETECT,
  clk
)
;
output [23:7] pre_out_i ;
input [11:0] vec_out_r_AQ_0 ;
input [11:0] in_b_i_reg ;
input [23:0] mult4_out_0 ;
input [47:24] P_uc_19_0 ;
output PATTERNDETECT ;
input clk ;
wire PATTERNDETECT ;
wire clk ;
wire [29:0] ACOUT;
wire [17:0] BCOUT;
wire [3:0] CARRYOUT;
wire [6:0] un2_pre_out;
wire [47:24] P_uc;
wire [47:0] PCOUT;
wire CARRYCASCOUT ;
wire MULTSIGNOUT ;
wire OVERFLOW ;
wire PATTERNBDETECT ;
wire UNDERFLOW ;
wire VCC ;
wire GND ;
// @14:30
  DSP48E1 \un2_pre_out[23:0]  (
	.ACOUT(ACOUT[29:0]),
	.BCOUT(BCOUT[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT),
	.CARRYOUT(CARRYOUT[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT),
	.OVERFLOW(OVERFLOW),
	.P({P_uc[47:24], pre_out_i[23:7], un2_pre_out[6:0]}),
	.PATTERNBDETECT(PATTERNBDETECT),
	.PATTERNDETECT(PATTERNDETECT),
	.PCOUT(PCOUT[47:0]),
	.UNDERFLOW(UNDERFLOW),
	.A({vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11:0]}),
	.ACIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.ALUMODE({GND, GND, GND, GND}),
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
	.PCIN({P_uc_19_0[47:24], mult4_out_0[23:0]}),
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
defparam \un2_pre_out[23:0] .ACASCREG=2;
defparam \un2_pre_out[23:0] .ADREG=0;
defparam \un2_pre_out[23:0] .ALUMODEREG=0;
defparam \un2_pre_out[23:0] .AREG=2;
defparam \un2_pre_out[23:0] .AUTORESET_PATDET="NO_RESET";
defparam \un2_pre_out[23:0] .A_INPUT="DIRECT";
defparam \un2_pre_out[23:0] .BCASCREG=1;
defparam \un2_pre_out[23:0] .BREG=1;
defparam \un2_pre_out[23:0] .B_INPUT="DIRECT";
defparam \un2_pre_out[23:0] .CARRYINREG=0;
defparam \un2_pre_out[23:0] .CARRYINSELREG=0;
defparam \un2_pre_out[23:0] .CREG=1;
defparam \un2_pre_out[23:0] .DREG=0;
defparam \un2_pre_out[23:0] .INMODEREG=0;
defparam \un2_pre_out[23:0] .MASK=48'b111111111111111111111111100001111111111111111111;
defparam \un2_pre_out[23:0] .MREG=0;
defparam \un2_pre_out[23:0] .OPMODEREG=0;
defparam \un2_pre_out[23:0] .PATTERN=48'b111111111111111111111111100001111111111111111111;
defparam \un2_pre_out[23:0] .PREG=0;
defparam \un2_pre_out[23:0] .SEL_MASK="MASK";
defparam \un2_pre_out[23:0] .USE_DPORT="FALSE";
defparam \un2_pre_out[23:0] .USE_MULT="MULTIPLY";
defparam \un2_pre_out[23:0] .USE_PATTERN_DETECT="PATDET";
defparam \un2_pre_out[23:0] .USE_SIMD="ONE48";
  VCC VCC_cZ (
	.P(VCC)
);
  GND GND_cZ (
	.G(GND)
);
endmodule