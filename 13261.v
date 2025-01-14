module  float_cmp_altfp_compare_5ac
	(
	ageb,
	aleb,
	clk_en,
	clock,
	dataa,
	datab) ;
	output   ageb;
	output   aleb;
	input   clk_en;
	input   clock;
	input   [31:0]  dataa;
	input   [31:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   clk_en;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	reg	out_ageb_w_dffe3;
	reg	out_aleb_w_dffe3;
	wire  wire_cmpr1_aeb;
	wire  wire_cmpr1_agb;
	wire  wire_cmpr2_aeb;
	wire  wire_cmpr2_agb;
	wire  wire_cmpr3_aeb;
	wire  wire_cmpr3_agb;
	wire  wire_cmpr4_aeb;
	wire  wire_cmpr4_agb;
	wire aclr;
	wire  aligned_dataa_sign_adjusted_dffe2_wi;
	wire  aligned_dataa_sign_adjusted_dffe2_wo;
	wire  aligned_dataa_sign_adjusted_w;
	wire  aligned_dataa_sign_dffe1_wi;
	wire  aligned_dataa_sign_dffe1_wo;
	wire  aligned_dataa_sign_w;
	wire  [30:0]  aligned_dataa_w;
	wire  aligned_datab_sign_adjusted_dffe2_wi;
	wire  aligned_datab_sign_adjusted_dffe2_wo;
	wire  aligned_datab_sign_adjusted_w;
	wire  aligned_datab_sign_dffe1_wi;
	wire  aligned_datab_sign_dffe1_wo;
	wire  aligned_datab_sign_w;
	wire  [30:0]  aligned_datab_w;
	wire  both_inputs_zero;
	wire  both_inputs_zero_dffe2_wi;
	wire  both_inputs_zero_dffe2_wo;
	wire  exp_a_all_one_dffe1_wi;
	wire  exp_a_all_one_dffe1_wo;
	wire  [7:0]  exp_a_all_one_w;
	wire  exp_a_not_zero_dffe1_wi;
	wire  exp_a_not_zero_dffe1_wo;
	wire  [7:0]  exp_a_not_zero_w;
	wire  [3:0]  exp_aeb;
	wire  [3:0]  exp_aeb_tmp_w;
	wire  exp_aeb_w;
	wire  exp_aeb_w_dffe2_wi;
	wire  exp_aeb_w_dffe2_wo;
	wire  [3:0]  exp_agb;
	wire  [3:0]  exp_agb_tmp_w;
	wire  exp_agb_w;
	wire  exp_agb_w_dffe2_wi;
	wire  exp_agb_w_dffe2_wo;
	wire  exp_b_all_one_dffe1_wi;
	wire  exp_b_all_one_dffe1_wo;
	wire  [7:0]  exp_b_all_one_w;
	wire  exp_b_not_zero_dffe1_wi;
	wire  exp_b_not_zero_dffe1_wo;
	wire  [7:0]  exp_b_not_zero_w;
	wire  [2:0]  exp_eq_grp;
	wire  [3:0]  exp_eq_gt_grp;
	wire  flip_outputs_dffe2_wi;
	wire  flip_outputs_dffe2_wo;
	wire  flip_outputs_w;
	wire  input_dataa_nan_dffe2_wi;
	wire  input_dataa_nan_dffe2_wo;
	wire  input_dataa_nan_w;
	wire  input_dataa_zero_w;
	wire  input_datab_nan_dffe2_wi;
	wire  input_datab_nan_dffe2_wo;
	wire  input_datab_nan_w;
	wire  input_datab_zero_w;
	wire  [1:0]  man_a_not_zero_dffe1_wi;
	wire  [1:0]  man_a_not_zero_dffe1_wo;
	wire  [1:0]  man_a_not_zero_merge_w;
	wire  [22:0]  man_a_not_zero_w;
	wire  [1:0]  man_b_not_zero_dffe1_wi;
	wire  [1:0]  man_b_not_zero_dffe1_wo;
	wire  [1:0]  man_b_not_zero_merge_w;
	wire  [22:0]  man_b_not_zero_w;
	wire  out_aeb_w;
	wire  out_agb_w;
	wire  out_ageb_dffe3_wi;
	wire  out_ageb_dffe3_wo;
	wire  out_ageb_w;
	wire  out_alb_w;
	wire  out_aleb_dffe3_wi;
	wire  out_aleb_dffe3_wo;
	wire  out_aleb_w;
	wire  out_unordered_w;
	// synopsys translate_off
	initial
		out_ageb_w_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) out_ageb_w_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   out_ageb_w_dffe3 <= out_ageb_dffe3_wi;
	// synopsys translate_off
	initial
		out_aleb_w_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) out_aleb_w_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   out_aleb_w_dffe3 <= out_aleb_dffe3_wi;
	lpm_compare   cmpr1
	(
	.aeb(wire_cmpr1_aeb),
	.agb(wire_cmpr1_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(aligned_dataa_w[30:23]),
	.datab(aligned_datab_w[30:23])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr1.lpm_representation = "UNSIGNED",
		cmpr1.lpm_width = 8,
		cmpr1.lpm_type = "lpm_compare";
	lpm_compare   cmpr2
	(
	.aeb(wire_cmpr2_aeb),
	.agb(wire_cmpr2_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(aligned_dataa_w[22:15]),
	.datab(aligned_datab_w[22:15])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr2.lpm_representation = "UNSIGNED",
		cmpr2.lpm_width = 8,
		cmpr2.lpm_type = "lpm_compare";
	lpm_compare   cmpr3
	(
	.aeb(wire_cmpr3_aeb),
	.agb(wire_cmpr3_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(aligned_dataa_w[14:7]),
	.datab(aligned_datab_w[14:7])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr3.lpm_representation = "UNSIGNED",
		cmpr3.lpm_width = 8,
		cmpr3.lpm_type = "lpm_compare";
	lpm_compare   cmpr4
	(
	.aeb(wire_cmpr4_aeb),
	.agb(wire_cmpr4_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(aligned_dataa_w[6:0]),
	.datab(aligned_datab_w[6:0])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cmpr4.lpm_representation = "UNSIGNED",
		cmpr4.lpm_width = 7,
		cmpr4.lpm_type = "lpm_compare";
	assign
		aclr = 1'b0,
		ageb = out_ageb_dffe3_wo,
		aleb = out_aleb_dffe3_wo,
		aligned_dataa_sign_adjusted_dffe2_wi = aligned_dataa_sign_adjusted_w,
		aligned_dataa_sign_adjusted_dffe2_wo = aligned_dataa_sign_adjusted_dffe2_wi,
		aligned_dataa_sign_adjusted_w = (aligned_dataa_sign_dffe1_wo & (~ input_dataa_zero_w)),
		aligned_dataa_sign_dffe1_wi = aligned_dataa_sign_w,
		aligned_dataa_sign_dffe1_wo = aligned_dataa_sign_dffe1_wi,
		aligned_dataa_sign_w = dataa[31],
		aligned_dataa_w = {dataa[30:0]},
		aligned_datab_sign_adjusted_dffe2_wi = aligned_datab_sign_adjusted_w,
		aligned_datab_sign_adjusted_dffe2_wo = aligned_datab_sign_adjusted_dffe2_wi,
		aligned_datab_sign_adjusted_w = (aligned_datab_sign_dffe1_wo & (~ input_datab_zero_w)),
		aligned_datab_sign_dffe1_wi = aligned_datab_sign_w,
		aligned_datab_sign_dffe1_wo = aligned_datab_sign_dffe1_wi,
		aligned_datab_sign_w = datab[31],
		aligned_datab_w = {datab[30:0]},
		both_inputs_zero = (input_dataa_zero_w & input_datab_zero_w),
		both_inputs_zero_dffe2_wi = both_inputs_zero,
		both_inputs_zero_dffe2_wo = both_inputs_zero_dffe2_wi,
		exp_a_all_one_dffe1_wi = exp_a_all_one_w[7],
		exp_a_all_one_dffe1_wo = exp_a_all_one_dffe1_wi,
		exp_a_all_one_w = {(dataa[30] & exp_a_all_one_w[6]), (dataa[29] & exp_a_all_one_w[5]), (dataa[28] & exp_a_all_one_w[4]), (dataa[27] & exp_a_all_one_w[3]), (dataa[26] & exp_a_all_one_w[2]), (dataa[25] & exp_a_all_one_w[1]), (dataa[24] & exp_a_all_one_w[0]), dataa[23]},
		exp_a_not_zero_dffe1_wi = exp_a_not_zero_w[7],
		exp_a_not_zero_dffe1_wo = exp_a_not_zero_dffe1_wi,
		exp_a_not_zero_w = {(dataa[30] | exp_a_not_zero_w[6]), (dataa[29] | exp_a_not_zero_w[5]), (dataa[28] | exp_a_not_zero_w[4]), (dataa[27] | exp_a_not_zero_w[3]), (dataa[26] | exp_a_not_zero_w[2]), (dataa[25] | exp_a_not_zero_w[1]), (dataa[24] | exp_a_not_zero_w[0]), dataa[23]},
		exp_aeb = {wire_cmpr4_aeb, wire_cmpr3_aeb, wire_cmpr2_aeb, wire_cmpr1_aeb},
		exp_aeb_tmp_w = {(exp_aeb[3] & exp_aeb_tmp_w[2]), (exp_aeb[2] & exp_aeb_tmp_w[1]), (exp_aeb[1] & exp_aeb_tmp_w[0]), exp_aeb[0]},
		exp_aeb_w = exp_aeb_tmp_w[3],
		exp_aeb_w_dffe2_wi = exp_aeb_w,
		exp_aeb_w_dffe2_wo = exp_aeb_w_dffe2_wi,
		exp_agb = {wire_cmpr4_agb, wire_cmpr3_agb, wire_cmpr2_agb, wire_cmpr1_agb},
		exp_agb_tmp_w = {(exp_agb_tmp_w[2] | exp_eq_gt_grp[3]), (exp_agb_tmp_w[1] | exp_eq_gt_grp[2]), (exp_agb_tmp_w[0] | exp_eq_gt_grp[1]), exp_eq_gt_grp[0]},
		exp_agb_w = exp_agb_tmp_w[3],
		exp_agb_w_dffe2_wi = exp_agb_w,
		exp_agb_w_dffe2_wo = exp_agb_w_dffe2_wi,
		exp_b_all_one_dffe1_wi = exp_b_all_one_w[7],
		exp_b_all_one_dffe1_wo = exp_b_all_one_dffe1_wi,
		exp_b_all_one_w = {(datab[30] & exp_b_all_one_w[6]), (datab[29] & exp_b_all_one_w[5]), (datab[28] & exp_b_all_one_w[4]), (datab[27] & exp_b_all_one_w[3]), (datab[26] & exp_b_all_one_w[2]), (datab[25] & exp_b_all_one_w[1]), (datab[24] & exp_b_all_one_w[0]), datab[23]},
		exp_b_not_zero_dffe1_wi = exp_b_not_zero_w[7],
		exp_b_not_zero_dffe1_wo = exp_b_not_zero_dffe1_wi,
		exp_b_not_zero_w = {(datab[30] | exp_b_not_zero_w[6]), (datab[29] | exp_b_not_zero_w[5]), (datab[28] | exp_b_not_zero_w[4]), (datab[27] | exp_b_not_zero_w[3]), (datab[26] | exp_b_not_zero_w[2]), (datab[25] | exp_b_not_zero_w[1]), (datab[24] | exp_b_not_zero_w[0]), datab[23]},
		exp_eq_grp = {(exp_eq_grp[1] & exp_aeb[2]), (exp_eq_grp[0] & exp_aeb[1]), exp_aeb[0]},
		exp_eq_gt_grp = {(exp_eq_grp[2] & exp_agb[3]), (exp_eq_grp[1] & exp_agb[2]), (exp_eq_grp[0] & exp_agb[1]), exp_agb[0]},
		flip_outputs_dffe2_wi = flip_outputs_w,
		flip_outputs_dffe2_wo = flip_outputs_dffe2_wi,
		flip_outputs_w = (aligned_dataa_sign_adjusted_w & aligned_datab_sign_adjusted_w),
		input_dataa_nan_dffe2_wi = input_dataa_nan_w,
		input_dataa_nan_dffe2_wo = input_dataa_nan_dffe2_wi,
		input_dataa_nan_w = (exp_a_all_one_dffe1_wo & man_a_not_zero_merge_w[1]),
		input_dataa_zero_w = (~ exp_a_not_zero_dffe1_wo),
		input_datab_nan_dffe2_wi = input_datab_nan_w,
		input_datab_nan_dffe2_wo = input_datab_nan_dffe2_wi,
		input_datab_nan_w = (exp_b_all_one_dffe1_wo & man_b_not_zero_merge_w[1]),
		input_datab_zero_w = (~ exp_b_not_zero_dffe1_wo),
		man_a_not_zero_dffe1_wi = {man_a_not_zero_w[22], man_a_not_zero_w[11]},
		man_a_not_zero_dffe1_wo = man_a_not_zero_dffe1_wi,
		man_a_not_zero_merge_w = {(man_a_not_zero_dffe1_wo[1] | man_a_not_zero_merge_w[0]), man_a_not_zero_dffe1_wo[0]},
		man_a_not_zero_w = {(dataa[22] | man_a_not_zero_w[21]), (dataa[21] | man_a_not_zero_w[20]), (dataa[20] | man_a_not_zero_w[19]), (dataa[19] | man_a_not_zero_w[18]), (dataa[18] | man_a_not_zero_w[17]), (dataa[17] | man_a_not_zero_w[16]), (dataa[16] | man_a_not_zero_w[15]), (dataa[15] | man_a_not_zero_w[14]), (dataa[14] | man_a_not_zero_w[13]), (dataa[13] | man_a_not_zero_w[12]), dataa[12], (dataa[11] | man_a_not_zero_w[10]), (dataa[10] | man_a_not_zero_w[9]), (dataa[9] | man_a_not_zero_w[8]), (dataa[8] | man_a_not_zero_w[7]), (dataa[7] | man_a_not_zero_w[6]), (dataa[6] | man_a_not_zero_w[5]), (dataa[5] | man_a_not_zero_w[4]), (dataa[4] | man_a_not_zero_w[3]), (dataa[3] | man_a_not_zero_w[2]), (dataa[2] | man_a_not_zero_w[1]), (dataa[1] | man_a_not_zero_w[0]), dataa[0]},
		man_b_not_zero_dffe1_wi = {man_b_not_zero_w[22], man_b_not_zero_w[11]},
		man_b_not_zero_dffe1_wo = man_b_not_zero_dffe1_wi,
		man_b_not_zero_merge_w = {(man_b_not_zero_dffe1_wo[1] | man_b_not_zero_merge_w[0]), man_b_not_zero_dffe1_wo[0]},
		man_b_not_zero_w = {(datab[22] | man_b_not_zero_w[21]), (datab[21] | man_b_not_zero_w[20]), (datab[20] | man_b_not_zero_w[19]), (datab[19] | man_b_not_zero_w[18]), (datab[18] | man_b_not_zero_w[17]), (datab[17] | man_b_not_zero_w[16]), (datab[16] | man_b_not_zero_w[15]), (datab[15] | man_b_not_zero_w[14]), (datab[14] | man_b_not_zero_w[13]), (datab[13] | man_b_not_zero_w[12]), datab[12], (datab[11] | man_b_not_zero_w[10]), (datab[10] | man_b_not_zero_w[9]), (datab[9] | man_b_not_zero_w[8]), (datab[8] | man_b_not_zero_w[7]), (datab[7] | man_b_not_zero_w[6]), (datab[6] | man_b_not_zero_w[5]), (datab[5] | man_b_not_zero_w[4]), (datab[4] | man_b_not_zero_w[3]), (datab[3] | man_b_not_zero_w[2]), (datab[2] | man_b_not_zero_w[1]), (datab[1] | man_b_not_zero_w[0]), datab[0]},
		out_aeb_w = ((((~ (aligned_dataa_sign_adjusted_dffe2_wo ^ aligned_datab_sign_adjusted_dffe2_wo)) & exp_aeb_w_dffe2_wo) | both_inputs_zero_dffe2_wo) & (~ out_unordered_w)),
		out_agb_w = (((((~ aligned_dataa_sign_adjusted_dffe2_wo) & aligned_datab_sign_adjusted_dffe2_wo) | ((exp_agb_w_dffe2_wo & (~ aligned_dataa_sign_adjusted_dffe2_wo)) & (~ both_inputs_zero_dffe2_wo))) | ((flip_outputs_dffe2_wo & (~ exp_agb_w_dffe2_wo)) & (~ out_aeb_w))) & (~ out_unordered_w)),
		out_ageb_dffe3_wi = out_ageb_w,
		out_ageb_dffe3_wo = out_ageb_w_dffe3,
		out_ageb_w = ((out_agb_w | out_aeb_w) & (~ out_unordered_w)),
		out_alb_w = (((~ out_agb_w) & (~ out_aeb_w)) & (~ out_unordered_w)),
		out_aleb_dffe3_wi = out_aleb_w,
		out_aleb_dffe3_wo = out_aleb_w_dffe3,
		out_aleb_w = ((out_alb_w | out_aeb_w) & (~ out_unordered_w)),
		out_unordered_w = (input_dataa_nan_dffe2_wo | input_datab_nan_dffe2_wo);
endmodule