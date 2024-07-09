module mult_pipe_17 (
  mult2_out_23,
  vec_out_i_AQ_3,
  out_inner_prod_i,
  in_b_vec_mult_sel,
  clk
)
;
output mult2_out_23 ;
input [11:0] vec_out_i_AQ_3 ;
input [11:0] out_inner_prod_i ;
input [0:0] in_b_vec_mult_sel ;
input clk ;
wire mult2_out_23 ;
wire clk ;
wire [29:0] ACOUT_29;
wire [17:0] BCOUT_29;
wire [3:0] CARRYOUT_29;
wire [22:0] mult2_out;
wire [47:24] P_uc_29;
wire [47:0] PCOUT_29;
wire CARRYCASCOUT_29 ;
wire MULTSIGNOUT_29 ;
wire OVERFLOW_29 ;
wire PATTERNBDETECT_29 ;
wire PATTERNDETECT_29 ;
wire UNDERFLOW_29 ;
wire VCC ;
wire GND ;
// @14:30
  DSP48E1 \pre_out[23:0]  (
	.ACOUT(ACOUT_29[29:0]),
	.BCOUT(BCOUT_29[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_29),
	.CARRYOUT(CARRYOUT_29[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_29),
	.OVERFLOW(OVERFLOW_29),
	.P({P_uc_29[47:24], mult2_out_23, mult2_out[22:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_29),
	.PATTERNDETECT(PATTERNDETECT_29),
	.PCOUT(PCOUT_29[47:0]),
	.UNDERFLOW(UNDERFLOW_29),
	.A({vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11], vec_out_i_AQ_3[11:0]}),
	.ACIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.ALUMODE({GND, GND, GND, GND}),
	.B({out_inner_prod_i[11], out_inner_prod_i[11], out_inner_prod_i[11], out_inner_prod_i[11], out_inner_prod_i[11], out_inner_prod_i[11], out_inner_prod_i[11:0]}),
	.BCIN({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.C({VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC, VCC}),
	.CARRYCASCIN(GND),
	.CARRYIN(GND),
	.CARRYINSEL({GND, GND, GND}),
	.CEA1(GND),
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
	.RSTB(in_b_vec_mult_sel[0]),
	.RSTC(GND),
	.RSTCTRL(GND),
	.RSTD(GND),
	.RSTINMODE(GND),
	.RSTM(GND),
	.RSTP(GND)
);
defparam \pre_out[23:0] .ACASCREG=1;
defparam \pre_out[23:0] .ADREG=0;
defparam \pre_out[23:0] .ALUMODEREG=0;
defparam \pre_out[23:0] .AREG=1;
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