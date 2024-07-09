module mult_pipe_1 (
  mult2_out_23,
  mult2_out_0,
  P_uc_34_0,
  in_a_i_reg,
  in_b_i_reg,
  clk
)
;
output mult2_out_23 ;
output [23:0] mult2_out_0 ;
output [47:24] P_uc_34_0 ;
input [11:0] in_a_i_reg ;
input [11:0] in_b_i_reg ;
input clk ;
wire mult2_out_23 ;
wire clk ;
wire [29:0] ACOUT_34;
wire [17:0] BCOUT_34;
wire [3:0] CARRYOUT_34;
wire [22:0] mult2_out;
wire [47:24] P_uc_34;
wire CARRYCASCOUT_34 ;
wire MULTSIGNOUT_34 ;
wire OVERFLOW_34 ;
wire PATTERNBDETECT_34 ;
wire PATTERNDETECT_34 ;
wire UNDERFLOW_34 ;
wire VCC ;
wire GND ;
// @14:30
  DSP48E1 \pre_out[23:0]  (
	.ACOUT(ACOUT_34[29:0]),
	.BCOUT(BCOUT_34[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_34),
	.CARRYOUT(CARRYOUT_34[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_34),
	.OVERFLOW(OVERFLOW_34),
	.P({P_uc_34[47:24], mult2_out_23, mult2_out[22:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_34),
	.PATTERNDETECT(PATTERNDETECT_34),
	.PCOUT({P_uc_34_0[47:24], mult2_out_0[23:0]}),
	.UNDERFLOW(UNDERFLOW_34),
	.A({in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11], in_a_i_reg[11:0]}),
	.ACIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.ALUMODE({GND, GND, GND, GND}),
	.B({in_b_i_reg[11], in_b_i_reg[11], in_b_i_reg[11], in_b_i_reg[11], in_b_i_reg[11], in_b_i_reg[11], in_b_i_reg[11:0]}),
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
	.CEP(VCC),
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
defparam \pre_out[23:0] .BCASCREG=0;
defparam \pre_out[23:0] .BREG=0;
defparam \pre_out[23:0] .B_INPUT="DIRECT";
defparam \pre_out[23:0] .CARRYINREG=0;
defparam \pre_out[23:0] .CARRYINSELREG=0;
defparam \pre_out[23:0] .CREG=1;
defparam \pre_out[23:0] .DREG=0;
defparam \pre_out[23:0] .INMODEREG=0;
defparam \pre_out[23:0] .MREG=0;
defparam \pre_out[23:0] .OPMODEREG=0;
defparam \pre_out[23:0] .PREG=1;
defparam \pre_out[23:0] .USE_DPORT="FALSE";
defparam \pre_out[23:0] .USE_MULT="MULTIPLY";
defparam \pre_out[23:0] .USE_SIMD="ONE48";
  VCC VCC_cZ (
	.P(VCC)
);
  GND GND_cZ (
	.G(GND)
);
endmodule