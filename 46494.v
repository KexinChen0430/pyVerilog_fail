module mult_pipe_14 (
  mult3_out_23,
  vec_out_r_AQ_0,
  out_inner_prod_i,
  in_b_vec_mult_sel,
  clk
)
;
output mult3_out_23 ;
input [11:0] vec_out_r_AQ_0 ;
input [11:0] out_inner_prod_i ;
input [0:0] in_b_vec_mult_sel ;
input clk ;
wire mult3_out_23 ;
wire clk ;
wire [29:0] ACOUT_18;
wire [17:0] BCOUT_18;
wire [3:0] CARRYOUT_18;
wire [22:0] mult3_out;
wire [47:24] P_uc_18;
wire [47:0] PCOUT_18;
wire CARRYCASCOUT_18 ;
wire MULTSIGNOUT_18 ;
wire OVERFLOW_18 ;
wire PATTERNBDETECT_18 ;
wire PATTERNDETECT_18 ;
wire UNDERFLOW_18 ;
wire VCC ;
wire GND ;
// @14:30
  DSP48E1 \pre_out[23:0]  (
	.ACOUT(ACOUT_18[29:0]),
	.BCOUT(BCOUT_18[17:0]),
	.CARRYCASCOUT(CARRYCASCOUT_18),
	.CARRYOUT(CARRYOUT_18[3:0]),
	.MULTSIGNOUT(MULTSIGNOUT_18),
	.OVERFLOW(OVERFLOW_18),
	.P({P_uc_18[47:24], mult3_out_23, mult3_out[22:0]}),
	.PATTERNBDETECT(PATTERNBDETECT_18),
	.PATTERNDETECT(PATTERNDETECT_18),
	.PCOUT(PCOUT_18[47:0]),
	.UNDERFLOW(UNDERFLOW_18),
	.A({vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11], vec_out_r_AQ_0[11:0]}),
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