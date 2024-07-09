module add_subZ1 (
  pre_out_r,
  in_a_r_reg,
  in_b_r_reg,
  mult2_out_0,
  P_uc_34_0,
  PATTERNDETECT_7,
  clk
)
;
output [23:7] pre_out_r ;
input [11:0] in_a_r_reg ;
input [11:0] in_b_r_reg ;
input [23:0] mult2_out_0 ;
input [47:24] P_uc_34_0 ;
output PATTERNDETECT_7 ;
input clk ;
wire PATTERNDETECT_7 ;
wire clk ;
wire [29:0] ACOUT_7;
wire [17:0] BCOUT_7;
wire [3:0] CARRYOUT_7;
wire [6:0] un2_pre_out;
wire [47:24] P_uc_7;
wire [47:0] PCOUT_7;
wire CARRYCASCOUT_7 ;
wire MULTSIGNOUT_7 ;
wire OVERFLOW_7 ;
wire PATTERNBDETECT_7 ;
wire UNDERFLOW_7 ;
wire VCC ;
wire GND ;
// @14:30
  DSP48E1 \un2_pre_out[23:0]  (
	.ACOUT(ACOUT_7[29:0]),
	.BCOUT(BCOUT_7[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_7),
	.CARRYOUT(CARRYOUT_7[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_7),
	.OVERFLOW(OVERFLOW_7),
	.P({P_uc_7[47:24], pre_out_r[23:7], un2_pre_out[6:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_7),
	.PATTERNDETECT(PATTERNDETECT_7),
	.PCOUT(PCOUT_7[47:0]),
	.UNDERFLOW(UNDERFLOW_7),
	.A({in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11:0]}),
	.ACIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.ALUMODE({GND, GND, GND, GND}),
	.B({in_b_r_reg[11], in_b_r_reg[11], in_b_r_reg[11], in_b_r_reg[11], in_b_r_reg[11], in_b_r_reg[11], in_b_r_reg[11:0]}),
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
	.CEM(VCC),
	.CEP(GND),
	.CLK(clk),
	.D({GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND, GND}),
	.INMODE({GND, GND, GND, GND, GND}),
	.MULTSIGNIN(GND),
	.OPMODE({GND, GND, VCC, GND, VCC, GND, VCC}),
	.PCIN({P_uc_34_0[47:24], mult2_out_0[23:0]}),
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
defparam \un2_pre_out[23:0] .ACASCREG=0;
defparam \un2_pre_out[23:0] .ADREG=0;
defparam \un2_pre_out[23:0] .ALUMODEREG=0;
defparam \un2_pre_out[23:0] .AREG=0;
defparam \un2_pre_out[23:0] .AUTORESET_PATDET="NO_RESET";
defparam \un2_pre_out[23:0] .A_INPUT="DIRECT";
defparam \un2_pre_out[23:0] .BCASCREG=0;
defparam \un2_pre_out[23:0] .BREG=0;
defparam \un2_pre_out[23:0] .B_INPUT="DIRECT";
defparam \un2_pre_out[23:0] .CARRYINREG=0;
defparam \un2_pre_out[23:0] .CARRYINSELREG=0;
defparam \un2_pre_out[23:0] .CREG=1;
defparam \un2_pre_out[23:0] .DREG=0;
defparam \un2_pre_out[23:0] .INMODEREG=0;
defparam \un2_pre_out[23:0] .MASK=48'b111111111111111111111111100001111111111111111111;
defparam \un2_pre_out[23:0] .MREG=1;
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