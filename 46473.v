module add_subZ2 (
  pre_out_i,
  in_a_i_reg,
  in_b_r_reg,
  mult3_out_0,
  P_uc_35_0,
  PATTERNDETECT_8,
  clk
)
;
output [23:7] pre_out_i ;
input [11:0] in_a_i_reg ;
input [11:0] in_b_r_reg ;
input [23:0] mult3_out_0 ;
input [47:24] P_uc_35_0 ;
output PATTERNDETECT_8 ;
input clk ;
wire PATTERNDETECT_8 ;
wire clk ;
wire [29:0] ACOUT_8;
wire [17:0] BCOUT_8;
wire [3:0] CARRYOUT_8;
wire [6:0] output_Z;
wire [47:24] P_uc_8;
wire [47:0] PCOUT_8;
wire CARRYCASCOUT_8 ;
wire MULTSIGNOUT_8 ;
wire OVERFLOW_8 ;
wire PATTERNBDETECT_8 ;
wire UNDERFLOW_8 ;
wire VCC ;
wire GND ;
// @14:30
  DSP48E1 \output[23:0]  (
	.ACOUT(ACOUT_8[29:0]),
	.BCOUT(BCOUT_8[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_8),
	.CARRYOUT(CARRYOUT_8[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_8),
	.OVERFLOW(OVERFLOW_8),
	.P({P_uc_8[47:24], pre_out_i[23:7], output_Z[6:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_8),
	.PATTERNDETECT(PATTERNDETECT_8),
	.PCOUT(PCOUT_8[47:0]),
	.UNDERFLOW(UNDERFLOW_8),
	.A({in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11:0]}),
	.ACIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.ALUMODE({GND, GND, VCC, VCC}),
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
	.PCIN({P_uc_35_0[47:24], mult3_out_0[23:0]}),
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
defparam \output[23:0] .ACASCREG=0;
defparam \output[23:0] .ADREG=0;
defparam \output[23:0] .ALUMODEREG=0;
defparam \output[23:0] .AREG=0;
defparam \output[23:0] .AUTORESET_PATDET="NO_RESET";
defparam \output[23:0] .A_INPUT="DIRECT";
defparam \output[23:0] .BCASCREG=0;
defparam \output[23:0] .BREG=0;
defparam \output[23:0] .B_INPUT="DIRECT";
defparam \output[23:0] .CARRYINREG=0;
defparam \output[23:0] .CARRYINSELREG=0;
defparam \output[23:0] .CREG=1;
defparam \output[23:0] .DREG=0;
defparam \output[23:0] .INMODEREG=0;
defparam \output[23:0] .MASK=48'b111111111111111111111111100001111111111111111111;
defparam \output[23:0] .MREG=1;
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