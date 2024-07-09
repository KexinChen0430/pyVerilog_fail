module mult_pipe (
  mult1_out,
  in_a_r_reg,
  in_b_r_reg,
  clk
)
;
output [23:23] mult1_out ;
input [11:0] in_a_r_reg ;
input [11:0] in_b_r_reg ;
input clk ;
wire clk ;
wire [29:0] ACOUT_33;
wire [17:0] BCOUT_33;
wire [3:0] CARRYOUT_33;
wire [22:0] pre_out_P_0;
wire [47:24] P_uc_33;
wire [47:0] PCOUT_33;
wire CARRYCASCOUT_33 ;
wire MULTSIGNOUT_33 ;
wire OVERFLOW_33 ;
wire PATTERNBDETECT_33 ;
wire PATTERNDETECT_33 ;
wire UNDERFLOW_33 ;
wire VCC ;
wire GND ;
// @14:30
  DSP48E1 \pre_out[23:0]  (
	.ACOUT(ACOUT_33[29:0]),
	.BCOUT(BCOUT_33[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_33),
	.CARRYOUT(CARRYOUT_33[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_33),
	.OVERFLOW(OVERFLOW_33),
	.P({P_uc_33[47:24], mult1_out[23], pre_out_P_0[22:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_33),
	.PATTERNDETECT(PATTERNDETECT_33),
	.PCOUT(PCOUT_33[47:0]),
	.UNDERFLOW(UNDERFLOW_33),
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
defparam \pre_out[23:0] .MREG=1;
defparam \pre_out[23:0] .OPMODEREG=0;
defparam \pre_out[23:0] .PREG=0;
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