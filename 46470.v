module mult_pipe_2 (
  mult3_out_23,
  mult3_out_0,
  P_uc_35_0,
  in_a_r_reg,
  in_b_i_reg,
  clk
)
;
output mult3_out_23 ;
output [23:0] mult3_out_0 ;
output [47:24] P_uc_35_0 ;
input [11:0] in_a_r_reg ;
input [11:0] in_b_i_reg ;
input clk ;
wire mult3_out_23 ;
wire clk ;
wire [29:0] ACOUT_35;
wire [17:0] BCOUT_35;
wire [3:0] CARRYOUT_35;
wire [22:0] mult3_out;
wire [47:24] P_uc_35;
wire CARRYCASCOUT_35 ;
wire MULTSIGNOUT_35 ;
wire OVERFLOW_35 ;
wire PATTERNBDETECT_35 ;
wire PATTERNDETECT_35 ;
wire UNDERFLOW_35 ;
wire VCC ;
wire GND ;
// @14:30
  DSP48E1 \pre_out[23:0]  (
	.ACOUT(ACOUT_35[29:0]),
	.BCOUT(BCOUT_35[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_35),
	.CARRYOUT(CARRYOUT_35[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_35),
	.OVERFLOW(OVERFLOW_35),
	.P({P_uc_35[47:24], mult3_out_23, mult3_out[22:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_35),
	.PATTERNDETECT(PATTERNDETECT_35),
	.PCOUT({P_uc_35_0[47:24], mult3_out_0[23:0]}),
	.UNDERFLOW(UNDERFLOW_35),
	.A({in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11], in_a_r_reg[11:0]}),
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