module  fp_exp_altfp_exp_o7d
	(
	clk_en,
	clock,
	data,
	result) ;
	input   clk_en;
	input   clock;
	input   [63:0]  data;
	output   [63:0]  result;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes0;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes1;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes2;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes3;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes4;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes5;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes6;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes7;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes8;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes9;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes10;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes11;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes12;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes13;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes14;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes15;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes16;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes17;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes18;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes19;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes20;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes21;
	reg	[0:0]	barrel_shifter_underflow_dffe2_23_pipes22;
	reg	[0:0]	distance_overflow_dffe2_23_pipes0;
	reg	[0:0]	distance_overflow_dffe2_23_pipes1;
	reg	[0:0]	distance_overflow_dffe2_23_pipes2;
	reg	[0:0]	distance_overflow_dffe2_23_pipes3;
	reg	[0:0]	distance_overflow_dffe2_23_pipes4;
	reg	[0:0]	distance_overflow_dffe2_23_pipes5;
	reg	[0:0]	distance_overflow_dffe2_23_pipes6;
	reg	[0:0]	distance_overflow_dffe2_23_pipes7;
	reg	[0:0]	distance_overflow_dffe2_23_pipes8;
	reg	[0:0]	distance_overflow_dffe2_23_pipes9;
	reg	[0:0]	distance_overflow_dffe2_23_pipes10;
	reg	[0:0]	distance_overflow_dffe2_23_pipes11;
	reg	[0:0]	distance_overflow_dffe2_23_pipes12;
	reg	[0:0]	distance_overflow_dffe2_23_pipes13;
	reg	[0:0]	distance_overflow_dffe2_23_pipes14;
	reg	[0:0]	distance_overflow_dffe2_23_pipes15;
	reg	[0:0]	distance_overflow_dffe2_23_pipes16;
	reg	[0:0]	distance_overflow_dffe2_23_pipes17;
	reg	[0:0]	distance_overflow_dffe2_23_pipes18;
	reg	[0:0]	distance_overflow_dffe2_23_pipes19;
	reg	[0:0]	distance_overflow_dffe2_23_pipes20;
	reg	[0:0]	distance_overflow_dffe2_23_pipes21;
	reg	[0:0]	distance_overflow_dffe2_23_pipes22;
	reg	[10:0]	exp_value_b4_bias_dffe_0;
	reg	[10:0]	exp_value_b4_bias_dffe_1;
	reg	[10:0]	exp_value_b4_bias_dffe_10;
	reg	[10:0]	exp_value_b4_bias_dffe_11;
	reg	[10:0]	exp_value_b4_bias_dffe_12;
	reg	[10:0]	exp_value_b4_bias_dffe_13;
	reg	[10:0]	exp_value_b4_bias_dffe_14;
	reg	[10:0]	exp_value_b4_bias_dffe_15;
	reg	[10:0]	exp_value_b4_bias_dffe_16;
	reg	[10:0]	exp_value_b4_bias_dffe_17;
	reg	[10:0]	exp_value_b4_bias_dffe_18;
	reg	[10:0]	exp_value_b4_bias_dffe_2;
	reg	[10:0]	exp_value_b4_bias_dffe_3;
	reg	[10:0]	exp_value_b4_bias_dffe_4;
	reg	[10:0]	exp_value_b4_bias_dffe_5;
	reg	[10:0]	exp_value_b4_bias_dffe_6;
	reg	[10:0]	exp_value_b4_bias_dffe_7;
	reg	[10:0]	exp_value_b4_bias_dffe_8;
	reg	[10:0]	exp_value_b4_bias_dffe_9;
	reg	[11:0]	exp_value_dffe1;
	reg	extra_ln2_dffe_0;
	reg	extra_ln2_dffe_1;
	reg	extra_ln2_dffe_10;
	reg	extra_ln2_dffe_11;
	reg	extra_ln2_dffe_2;
	reg	extra_ln2_dffe_3;
	reg	extra_ln2_dffe_4;
	reg	extra_ln2_dffe_5;
	reg	extra_ln2_dffe_6;
	reg	extra_ln2_dffe_7;
	reg	extra_ln2_dffe_8;
	reg	extra_ln2_dffe_9;
	reg	[51:0]	fraction_dffe1;
	reg	[0:0]	input_is_infinity_24_pipes0;
	reg	[0:0]	input_is_infinity_24_pipes1;
	reg	[0:0]	input_is_infinity_24_pipes2;
	reg	[0:0]	input_is_infinity_24_pipes3;
	reg	[0:0]	input_is_infinity_24_pipes4;
	reg	[0:0]	input_is_infinity_24_pipes5;
	reg	[0:0]	input_is_infinity_24_pipes6;
	reg	[0:0]	input_is_infinity_24_pipes7;
	reg	[0:0]	input_is_infinity_24_pipes8;
	reg	[0:0]	input_is_infinity_24_pipes9;
	reg	[0:0]	input_is_infinity_24_pipes10;
	reg	[0:0]	input_is_infinity_24_pipes11;
	reg	[0:0]	input_is_infinity_24_pipes12;
	reg	[0:0]	input_is_infinity_24_pipes13;
	reg	[0:0]	input_is_infinity_24_pipes14;
	reg	[0:0]	input_is_infinity_24_pipes15;
	reg	[0:0]	input_is_infinity_24_pipes16;
	reg	[0:0]	input_is_infinity_24_pipes17;
	reg	[0:0]	input_is_infinity_24_pipes18;
	reg	[0:0]	input_is_infinity_24_pipes19;
	reg	[0:0]	input_is_infinity_24_pipes20;
	reg	[0:0]	input_is_infinity_24_pipes21;
	reg	[0:0]	input_is_infinity_24_pipes22;
	reg	[0:0]	input_is_infinity_24_pipes23;
	reg	[0:0]	input_is_nan_24_pipes0;
	reg	[0:0]	input_is_nan_24_pipes1;
	reg	[0:0]	input_is_nan_24_pipes2;
	reg	[0:0]	input_is_nan_24_pipes3;
	reg	[0:0]	input_is_nan_24_pipes4;
	reg	[0:0]	input_is_nan_24_pipes5;
	reg	[0:0]	input_is_nan_24_pipes6;
	reg	[0:0]	input_is_nan_24_pipes7;
	reg	[0:0]	input_is_nan_24_pipes8;
	reg	[0:0]	input_is_nan_24_pipes9;
	reg	[0:0]	input_is_nan_24_pipes10;
	reg	[0:0]	input_is_nan_24_pipes11;
	reg	[0:0]	input_is_nan_24_pipes12;
	reg	[0:0]	input_is_nan_24_pipes13;
	reg	[0:0]	input_is_nan_24_pipes14;
	reg	[0:0]	input_is_nan_24_pipes15;
	reg	[0:0]	input_is_nan_24_pipes16;
	reg	[0:0]	input_is_nan_24_pipes17;
	reg	[0:0]	input_is_nan_24_pipes18;
	reg	[0:0]	input_is_nan_24_pipes19;
	reg	[0:0]	input_is_nan_24_pipes20;
	reg	[0:0]	input_is_nan_24_pipes21;
	reg	[0:0]	input_is_nan_24_pipes22;
	reg	[0:0]	input_is_nan_24_pipes23;
	reg	[0:0]	input_is_zero_24_pipes0;
	reg	[0:0]	input_is_zero_24_pipes1;
	reg	[0:0]	input_is_zero_24_pipes2;
	reg	[0:0]	input_is_zero_24_pipes3;
	reg	[0:0]	input_is_zero_24_pipes4;
	reg	[0:0]	input_is_zero_24_pipes5;
	reg	[0:0]	input_is_zero_24_pipes6;
	reg	[0:0]	input_is_zero_24_pipes7;
	reg	[0:0]	input_is_zero_24_pipes8;
	reg	[0:0]	input_is_zero_24_pipes9;
	reg	[0:0]	input_is_zero_24_pipes10;
	reg	[0:0]	input_is_zero_24_pipes11;
	reg	[0:0]	input_is_zero_24_pipes12;
	reg	[0:0]	input_is_zero_24_pipes13;
	reg	[0:0]	input_is_zero_24_pipes14;
	reg	[0:0]	input_is_zero_24_pipes15;
	reg	[0:0]	input_is_zero_24_pipes16;
	reg	[0:0]	input_is_zero_24_pipes17;
	reg	[0:0]	input_is_zero_24_pipes18;
	reg	[0:0]	input_is_zero_24_pipes19;
	reg	[0:0]	input_is_zero_24_pipes20;
	reg	[0:0]	input_is_zero_24_pipes21;
	reg	[0:0]	input_is_zero_24_pipes22;
	reg	[0:0]	input_is_zero_24_pipes23;
	reg	man_overflow_dffe15;
	reg	[119:0]	man_prod_dffe14;
	reg	[51:0]	man_round_dffe15;
	reg	[62:0]	result_pipe_dffe16;
	reg	round_up_dffe15;
	reg	[0:0]	sign_dffe0;
	reg	[0:0]	sign_dffe1;
	reg	[0:0]	sign_dffe2;
	reg	[0:0]	sign_dffe3;
	reg	[0:0]	sign_dffe4;
	reg	[0:0]	sign_dffe5;
	reg	[0:0]	sign_dffe6;
	reg	[0:0]	sign_dffe7;
	reg	[0:0]	sign_dffe8;
	reg	[0:0]	sign_dffe9;
	reg	[0:0]	sign_dffe10;
	reg	[0:0]	sign_dffe11;
	reg	[0:0]	sign_dffe12;
	reg	[0:0]	sign_dffe13;
	reg	[0:0]	sign_dffe14;
	reg	[0:0]	sign_dffe15;
	reg	[0:0]	sign_dffe16;
	reg	[0:0]	sign_dffe17;
	reg	[0:0]	sign_dffe18;
	reg	[0:0]	sign_dffe19;
	reg	[0:0]	sign_dffe20;
	reg	[0:0]	sign_dffe21;
	reg	[0:0]	sign_dffe22;
	reg	[0:0]	sign_dffe23;
	reg	[0:0]	tbl1_compare_dffe11_10_pipes0;
	reg	[0:0]	tbl1_compare_dffe11_10_pipes1;
	reg	[0:0]	tbl1_compare_dffe11_10_pipes2;
	reg	[0:0]	tbl1_compare_dffe11_10_pipes3;
	reg	[0:0]	tbl1_compare_dffe11_10_pipes4;
	reg	[0:0]	tbl1_compare_dffe11_10_pipes5;
	reg	[0:0]	tbl1_compare_dffe11_10_pipes6;
	reg	[0:0]	tbl1_compare_dffe11_10_pipes7;
	reg	[0:0]	tbl1_compare_dffe11_10_pipes8;
	reg	[0:0]	tbl1_compare_dffe11_10_pipes9;
	reg	[59:0]	tbl1_tbl2_prod_dffe12;
	reg	[59:0]	tbl3_taylor_prod_dffe12;
	reg	[69:0]	x_fixed_dffe_0;
	reg	[69:0]	x_fixed_dffe_1;
	reg	[69:0]	x_fixed_dffe_2;
	reg	[69:0]	x_fixed_dffe_3;
	reg	[69:0]	x_fixed_dffe_4;
	reg	[69:0]	x_fixed_dffe_5;
	reg	[69:0]	x_fixed_dffe_6;
	reg	[69:0]	xf_pre_2_dffe10;
	reg	[69:0]	xf_pre_dffe9;
	reg	[10:0]	xi_exp_value_dffe4;
	reg	[80:0]	xi_ln2_prod_dffe7;
	reg	[26:0]	xi_prod_dffe3;
	wire  [11:0]   wire_exp_minus_bias_result;
	wire  [11:0]   wire_exp_value_add_bias_result;
	wire  [11:0]   wire_exp_value_man_over_result;
	wire  [10:0]   wire_invert_exp_value_result;
	wire  [51:0]   wire_man_round_result;
	wire  [59:0]   wire_one_minus_xf_result;
	wire  [69:0]   wire_x_fixed_minus_xiln2_result;
	wire  [59:0]   wire_xf_minus_ln2_result;
	wire  [10:0]   wire_xi_add_one_result;
	wire  [69:0]   wire_rbarrel_shift_result;
	wire  wire_distance_overflow_comp_agb;
	wire  wire_tbl1_compare_ageb;
	wire  wire_underflow_compare_agb;
	wire  [119:0]   wire_man_prod_result;
	wire  [121:0]   wire_tbl1_tbl2_prod_result;
	wire  [119:0]   wire_tbl3_taylor_prod_result;
	wire  [80:0]   wire_xi_ln2_prod_result;
	wire  [26:0]   wire_xi_prod_result;
	wire  [60:0]   wire_table_one_result;
	wire  [41:0]   wire_table_three_result;
	wire  [50:0]   wire_table_two_result;
	wire	wire_cin_to_bias_dataout;
	wire	[10:0]wire_exp_result_mux_prea_dataout;
	wire	[10:0]wire_exp_value_b4_biasa_dataout;
	wire	[6:0]wire_exp_value_selecta_dataout;
	wire	[10:0]wire_exp_value_to_compare_muxa_dataout;
	wire	[10:0]wire_exp_value_to_ln2a_dataout;
	wire	[59:0]wire_extra_ln2_muxa_dataout;
	wire	[51:0]wire_man_result_muxa_dataout;
	wire	[59:0]wire_xf_muxa_dataout;
	wire aclr;
	wire  [8:0]  addr_val_more_than_one;
	wire  [69:0]  barrel_shifter_data;
	wire  [6:0]  barrel_shifter_distance;
	wire  barrel_shifter_underflow;
	wire  barrel_shifter_underflow_wi;
	wire  distance_overflow;
	wire  [10:0]  distance_overflow_val_w;
	wire  distance_overflow_wi;
	wire  [10:0]  exp_bias;
	wire  [10:0]  exp_bias_all_ones_w;
	wire  [10:0]  exp_data_all_one_w;
	wire  [10:0]  exp_data_not_zero_w;
	wire  [10:0]  exp_invert;
	wire  [10:0]  exp_one;
	wire  [10:0]  exp_out_all_one_w;
	wire  [10:0]  exp_out_not_zero_w;
	wire  [10:0]  exp_result_out;
	wire  [10:0]  exp_result_w;
	wire  [11:0]  exp_value;
	wire  [11:0]  exp_value_wi;
	wire  [11:0]  exp_value_wo;
	wire  [10:0]  exp_w;
	wire  extra_ln2;
	wire  [51:0]  fraction;
	wire  [51:0]  fraction_wi;
	wire  [51:0]  fraction_wo;
	wire  gnd_w;
	wire  guard_bit;
	wire  input_is_infinity_wi;
	wire  input_is_infinity_wo;
	wire  input_is_nan_wi;
	wire  input_is_nan_wo;
	wire  input_is_zero_wi;
	wire  input_is_zero_wo;
	wire  [69:0]  ln2_w;
	wire  [51:0]  man_data_not_zero_w;
	wire  man_overflow;
	wire  man_overflow_wi;
	wire  man_overflow_wo;
	wire  [119:0]  man_prod_result;
	wire  [119:0]  man_prod_shifted;
	wire  [119:0]  man_prod_wi;
	wire  [119:0]  man_prod_wire;
	wire  [119:0]  man_prod_wo;
	wire  [51:0]  man_result_all_ones;
	wire  [51:0]  man_result_w;
	wire  [51:0]  man_round_wi;
	wire  [51:0]  man_round_wo;
	wire  nan_w;
	wire  negative_infinity;
	wire  [11:0]  one_over_ln2_w;
	wire  overflow_w;
	wire  positive_infinity;
	wire  [62:0]  result_pipe_wi;
	wire  [62:0]  result_pipe_wo;
	wire  result_underflow_w;
	wire  round_bit;
	wire  round_up;
	wire  round_up_wi;
	wire  round_up_wo;
	wire  shifted_value;
	wire  sign_w;
	wire  [4:0]  sticky_bits;
	wire  [31231:0]  table_one_data;
	wire  [60:0]  table_one_out;
	wire  [21503:0]  table_three_data;
	wire  [60:0]  table_three_out;
	wire  [41:0]  table_three_out_tmp;
	wire  [26111:0]  table_two_data;
	wire  [60:0]  table_two_out;
	wire  [50:0]  table_two_out_tmp;
	wire  tbl1_compare_wi;
	wire  tbl1_compare_wo;
	wire  [59:0]  tbl1_tbl2_prod_wi;
	wire  [59:0]  tbl1_tbl2_prod_wo;
	wire  [59:0]  tbl3_taylor_prod_wi;
	wire  [59:0]  tbl3_taylor_prod_wo;
	wire  [10:0]  underflow_compare_val_w;
	wire  underflow_w;
	wire  [69:0]  x_fixed;
	wire  [59:0]  xf;
	wire  [69:0]  xf_pre;
	wire  [69:0]  xf_pre_2_wi;
	wire  [69:0]  xf_pre_2_wo;
	wire  [69:0]  xf_pre_wi;
	wire  [69:0]  xf_pre_wo;
	wire  [10:0]  xi_exp_value;
	wire  [10:0]  xi_exp_value_wi;
	wire  [10:0]  xi_exp_value_wo;
	wire  [80:0]  xi_ln2_prod_wi;
	wire  [80:0]  xi_ln2_prod_wo;
	wire  [26:0]  xi_prod_wi;
	wire  [26:0]  xi_prod_wo;
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes0 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes0 <= barrel_shifter_underflow_wi;
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes1 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes1 <= barrel_shifter_underflow_dffe2_23_pipes0[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes2 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes2 <= barrel_shifter_underflow_dffe2_23_pipes1[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes3 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes3 <= barrel_shifter_underflow_dffe2_23_pipes2[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes4 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes4 <= barrel_shifter_underflow_dffe2_23_pipes3[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes5 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes5 <= barrel_shifter_underflow_dffe2_23_pipes4[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes6 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes6 <= barrel_shifter_underflow_dffe2_23_pipes5[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes7 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes7 <= barrel_shifter_underflow_dffe2_23_pipes6[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes8 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes8 <= barrel_shifter_underflow_dffe2_23_pipes7[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes9 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes9 <= barrel_shifter_underflow_dffe2_23_pipes8[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes10 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes10 <= barrel_shifter_underflow_dffe2_23_pipes9[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes11 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes11 <= barrel_shifter_underflow_dffe2_23_pipes10[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes12 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes12 <= barrel_shifter_underflow_dffe2_23_pipes11[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes13 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes13 <= barrel_shifter_underflow_dffe2_23_pipes12[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes14 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes14 <= barrel_shifter_underflow_dffe2_23_pipes13[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes15 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes15 <= barrel_shifter_underflow_dffe2_23_pipes14[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes16 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes16 <= barrel_shifter_underflow_dffe2_23_pipes15[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes17 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes17 <= barrel_shifter_underflow_dffe2_23_pipes16[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes18 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes18 <= barrel_shifter_underflow_dffe2_23_pipes17[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes19 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes19 <= barrel_shifter_underflow_dffe2_23_pipes18[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes20 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes20 <= barrel_shifter_underflow_dffe2_23_pipes19[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes21 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes21 <= barrel_shifter_underflow_dffe2_23_pipes20[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_23_pipes22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_23_pipes22 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_23_pipes22 <= barrel_shifter_underflow_dffe2_23_pipes21[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes0 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes0 <= distance_overflow_wi;
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes1 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes1 <= distance_overflow_dffe2_23_pipes0[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes2 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes2 <= distance_overflow_dffe2_23_pipes1[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes3 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes3 <= distance_overflow_dffe2_23_pipes2[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes4 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes4 <= distance_overflow_dffe2_23_pipes3[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes5 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes5 <= distance_overflow_dffe2_23_pipes4[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes6 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes6 <= distance_overflow_dffe2_23_pipes5[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes7 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes7 <= distance_overflow_dffe2_23_pipes6[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes8 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes8 <= distance_overflow_dffe2_23_pipes7[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes9 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes9 <= distance_overflow_dffe2_23_pipes8[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes10 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes10 <= distance_overflow_dffe2_23_pipes9[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes11 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes11 <= distance_overflow_dffe2_23_pipes10[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes12 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes12 <= distance_overflow_dffe2_23_pipes11[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes13 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes13 <= distance_overflow_dffe2_23_pipes12[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes14 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes14 <= distance_overflow_dffe2_23_pipes13[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes15 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes15 <= distance_overflow_dffe2_23_pipes14[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes16 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes16 <= distance_overflow_dffe2_23_pipes15[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes17 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes17 <= distance_overflow_dffe2_23_pipes16[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes18 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes18 <= distance_overflow_dffe2_23_pipes17[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes19 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes19 <= distance_overflow_dffe2_23_pipes18[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes20 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes20 <= distance_overflow_dffe2_23_pipes19[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes21 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes21 <= distance_overflow_dffe2_23_pipes20[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_23_pipes22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_23_pipes22 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_23_pipes22 <= distance_overflow_dffe2_23_pipes21[0:0];
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_0 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_0 <= wire_exp_value_b4_biasa_dataout;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_1 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_1 <= exp_value_b4_bias_dffe_0;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_10 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_10 <= exp_value_b4_bias_dffe_9;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_11 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_11 <= exp_value_b4_bias_dffe_10;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_12 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_12 <= exp_value_b4_bias_dffe_11;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_13 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_13 <= exp_value_b4_bias_dffe_12;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_14 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_14 <= exp_value_b4_bias_dffe_13;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_15 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_15 <= exp_value_b4_bias_dffe_14;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_16 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_16 <= exp_value_b4_bias_dffe_15;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_17 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_17 <= exp_value_b4_bias_dffe_16;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_18 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_18 <= exp_value_b4_bias_dffe_17;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_2 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_2 <= exp_value_b4_bias_dffe_1;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_3 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_3 <= exp_value_b4_bias_dffe_2;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_4 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_4 <= exp_value_b4_bias_dffe_3;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_5 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_5 <= exp_value_b4_bias_dffe_4;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_6 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_6 <= exp_value_b4_bias_dffe_5;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_7 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_7 <= exp_value_b4_bias_dffe_6;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_8 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_8 <= exp_value_b4_bias_dffe_7;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_9 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_9 <= exp_value_b4_bias_dffe_8;
	// synopsys translate_off
	initial
		exp_value_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_dffe1 <= 12'b0;
		else if  (clk_en == 1'b1)   exp_value_dffe1 <= exp_value_wi;
	// synopsys translate_off
	initial
		extra_ln2_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) extra_ln2_dffe_0 <= 1'b0;
		else if  (clk_en == 1'b1)   extra_ln2_dffe_0 <= extra_ln2;
	// synopsys translate_off
	initial
		extra_ln2_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) extra_ln2_dffe_1 <= 1'b0;
		else if  (clk_en == 1'b1)   extra_ln2_dffe_1 <= extra_ln2_dffe_0;
	// synopsys translate_off
	initial
		extra_ln2_dffe_10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) extra_ln2_dffe_10 <= 1'b0;
		else if  (clk_en == 1'b1)   extra_ln2_dffe_10 <= extra_ln2_dffe_9;
	// synopsys translate_off
	initial
		extra_ln2_dffe_11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) extra_ln2_dffe_11 <= 1'b0;
		else if  (clk_en == 1'b1)   extra_ln2_dffe_11 <= extra_ln2_dffe_10;
	// synopsys translate_off
	initial
		extra_ln2_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) extra_ln2_dffe_2 <= 1'b0;
		else if  (clk_en == 1'b1)   extra_ln2_dffe_2 <= extra_ln2_dffe_1;
	// synopsys translate_off
	initial
		extra_ln2_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) extra_ln2_dffe_3 <= 1'b0;
		else if  (clk_en == 1'b1)   extra_ln2_dffe_3 <= extra_ln2_dffe_2;
	// synopsys translate_off
	initial
		extra_ln2_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) extra_ln2_dffe_4 <= 1'b0;
		else if  (clk_en == 1'b1)   extra_ln2_dffe_4 <= extra_ln2_dffe_3;
	// synopsys translate_off
	initial
		extra_ln2_dffe_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) extra_ln2_dffe_5 <= 1'b0;
		else if  (clk_en == 1'b1)   extra_ln2_dffe_5 <= extra_ln2_dffe_4;
	// synopsys translate_off
	initial
		extra_ln2_dffe_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) extra_ln2_dffe_6 <= 1'b0;
		else if  (clk_en == 1'b1)   extra_ln2_dffe_6 <= extra_ln2_dffe_5;
	// synopsys translate_off
	initial
		extra_ln2_dffe_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) extra_ln2_dffe_7 <= 1'b0;
		else if  (clk_en == 1'b1)   extra_ln2_dffe_7 <= extra_ln2_dffe_6;
	// synopsys translate_off
	initial
		extra_ln2_dffe_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) extra_ln2_dffe_8 <= 1'b0;
		else if  (clk_en == 1'b1)   extra_ln2_dffe_8 <= extra_ln2_dffe_7;
	// synopsys translate_off
	initial
		extra_ln2_dffe_9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) extra_ln2_dffe_9 <= 1'b0;
		else if  (clk_en == 1'b1)   extra_ln2_dffe_9 <= extra_ln2_dffe_8;
	// synopsys translate_off
	initial
		fraction_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) fraction_dffe1 <= 52'b0;
		else if  (clk_en == 1'b1)   fraction_dffe1 <= fraction_wi;
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes0 <= input_is_infinity_wi;
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes1 <= input_is_infinity_24_pipes0[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes2 <= input_is_infinity_24_pipes1[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes3 <= input_is_infinity_24_pipes2[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes4 <= input_is_infinity_24_pipes3[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes5 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes5 <= input_is_infinity_24_pipes4[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes6 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes6 <= input_is_infinity_24_pipes5[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes7 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes7 <= input_is_infinity_24_pipes6[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes8 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes8 <= input_is_infinity_24_pipes7[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes9 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes9 <= input_is_infinity_24_pipes8[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes10 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes10 <= input_is_infinity_24_pipes9[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes11 <= input_is_infinity_24_pipes10[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes12 <= input_is_infinity_24_pipes11[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes13 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes13 <= input_is_infinity_24_pipes12[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes14 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes14 <= input_is_infinity_24_pipes13[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes15 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes15 <= input_is_infinity_24_pipes14[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes16 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes16 <= input_is_infinity_24_pipes15[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes17 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes17 <= input_is_infinity_24_pipes16[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes18 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes18 <= input_is_infinity_24_pipes17[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes19 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes19 <= input_is_infinity_24_pipes18[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes20 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes20 <= input_is_infinity_24_pipes19[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes21 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes21 <= input_is_infinity_24_pipes20[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes22 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes22 <= input_is_infinity_24_pipes21[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_24_pipes23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_24_pipes23 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_24_pipes23 <= input_is_infinity_24_pipes22[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes0 <= input_is_nan_wi;
	// synopsys translate_off
	initial
		input_is_nan_24_pipes1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes1 <= input_is_nan_24_pipes0[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes2 <= input_is_nan_24_pipes1[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes3 <= input_is_nan_24_pipes2[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes4 <= input_is_nan_24_pipes3[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes5 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes5 <= input_is_nan_24_pipes4[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes6 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes6 <= input_is_nan_24_pipes5[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes7 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes7 <= input_is_nan_24_pipes6[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes8 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes8 <= input_is_nan_24_pipes7[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes9 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes9 <= input_is_nan_24_pipes8[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes10 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes10 <= input_is_nan_24_pipes9[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes11 <= input_is_nan_24_pipes10[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes12 <= input_is_nan_24_pipes11[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes13 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes13 <= input_is_nan_24_pipes12[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes14 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes14 <= input_is_nan_24_pipes13[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes15 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes15 <= input_is_nan_24_pipes14[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes16 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes16 <= input_is_nan_24_pipes15[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes17 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes17 <= input_is_nan_24_pipes16[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes18 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes18 <= input_is_nan_24_pipes17[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes19 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes19 <= input_is_nan_24_pipes18[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes20 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes20 <= input_is_nan_24_pipes19[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes21 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes21 <= input_is_nan_24_pipes20[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes22 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes22 <= input_is_nan_24_pipes21[0:0];
	// synopsys translate_off
	initial
		input_is_nan_24_pipes23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_24_pipes23 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_24_pipes23 <= input_is_nan_24_pipes22[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes0 <= input_is_zero_wi;
	// synopsys translate_off
	initial
		input_is_zero_24_pipes1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes1 <= input_is_zero_24_pipes0[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes2 <= input_is_zero_24_pipes1[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes3 <= input_is_zero_24_pipes2[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes4 <= input_is_zero_24_pipes3[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes5 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes5 <= input_is_zero_24_pipes4[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes6 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes6 <= input_is_zero_24_pipes5[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes7 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes7 <= input_is_zero_24_pipes6[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes8 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes8 <= input_is_zero_24_pipes7[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes9 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes9 <= input_is_zero_24_pipes8[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes10 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes10 <= input_is_zero_24_pipes9[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes11 <= input_is_zero_24_pipes10[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes12 <= input_is_zero_24_pipes11[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes13 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes13 <= input_is_zero_24_pipes12[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes14 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes14 <= input_is_zero_24_pipes13[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes15 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes15 <= input_is_zero_24_pipes14[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes16 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes16 <= input_is_zero_24_pipes15[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes17 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes17 <= input_is_zero_24_pipes16[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes18 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes18 <= input_is_zero_24_pipes17[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes19 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes19 <= input_is_zero_24_pipes18[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes20 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes20 <= input_is_zero_24_pipes19[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes21 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes21 <= input_is_zero_24_pipes20[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes22 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes22 <= input_is_zero_24_pipes21[0:0];
	// synopsys translate_off
	initial
		input_is_zero_24_pipes23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_24_pipes23 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_24_pipes23 <= input_is_zero_24_pipes22[0:0];
	// synopsys translate_off
	initial
		man_overflow_dffe15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_overflow_dffe15 <= 1'b0;
		else if  (clk_en == 1'b1)   man_overflow_dffe15 <= man_overflow_wi;
	// synopsys translate_off
	initial
		man_prod_dffe14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_prod_dffe14 <= 120'b0;
		else if  (clk_en == 1'b1)   man_prod_dffe14 <= man_prod_wi;
	// synopsys translate_off
	initial
		man_round_dffe15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_round_dffe15 <= 52'b0;
		else if  (clk_en == 1'b1)   man_round_dffe15 <= man_round_wi;
	// synopsys translate_off
	initial
		result_pipe_dffe16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) result_pipe_dffe16 <= 63'b0;
		else if  (clk_en == 1'b1)   result_pipe_dffe16 <= result_pipe_wi;
	// synopsys translate_off
	initial
		round_up_dffe15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) round_up_dffe15 <= 1'b0;
		else if  (clk_en == 1'b1)   round_up_dffe15 <= round_up_wi;
	// synopsys translate_off
	initial
		sign_dffe0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe0 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe0 <= sign_w;
	// synopsys translate_off
	initial
		sign_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe1 <= sign_dffe0[0:0];
	// synopsys translate_off
	initial
		sign_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe2 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe2 <= sign_dffe1[0:0];
	// synopsys translate_off
	initial
		sign_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe3 <= sign_dffe2[0:0];
	// synopsys translate_off
	initial
		sign_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe4 <= sign_dffe3[0:0];
	// synopsys translate_off
	initial
		sign_dffe5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe5 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe5 <= sign_dffe4[0:0];
	// synopsys translate_off
	initial
		sign_dffe6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe6 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe6 <= sign_dffe5[0:0];
	// synopsys translate_off
	initial
		sign_dffe7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe7 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe7 <= sign_dffe6[0:0];
	// synopsys translate_off
	initial
		sign_dffe8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe8 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe8 <= sign_dffe7[0:0];
	// synopsys translate_off
	initial
		sign_dffe9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe9 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe9 <= sign_dffe8[0:0];
	// synopsys translate_off
	initial
		sign_dffe10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe10 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe10 <= sign_dffe9[0:0];
	// synopsys translate_off
	initial
		sign_dffe11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe11 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe11 <= sign_dffe10[0:0];
	// synopsys translate_off
	initial
		sign_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe12 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe12 <= sign_dffe11[0:0];
	// synopsys translate_off
	initial
		sign_dffe13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe13 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe13 <= sign_dffe12[0:0];
	// synopsys translate_off
	initial
		sign_dffe14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe14 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe14 <= sign_dffe13[0:0];
	// synopsys translate_off
	initial
		sign_dffe15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe15 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe15 <= sign_dffe14[0:0];
	// synopsys translate_off
	initial
		sign_dffe16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe16 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe16 <= sign_dffe15[0:0];
	// synopsys translate_off
	initial
		sign_dffe17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe17 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe17 <= sign_dffe16[0:0];
	// synopsys translate_off
	initial
		sign_dffe18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe18 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe18 <= sign_dffe17[0:0];
	// synopsys translate_off
	initial
		sign_dffe19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe19 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe19 <= sign_dffe18[0:0];
	// synopsys translate_off
	initial
		sign_dffe20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe20 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe20 <= sign_dffe19[0:0];
	// synopsys translate_off
	initial
		sign_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe21 <= sign_dffe20[0:0];
	// synopsys translate_off
	initial
		sign_dffe22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe22 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe22 <= sign_dffe21[0:0];
	// synopsys translate_off
	initial
		sign_dffe23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe23 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe23 <= sign_dffe22[0:0];
	// synopsys translate_off
	initial
		tbl1_compare_dffe11_10_pipes0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_compare_dffe11_10_pipes0 <= 1'b0;
		else if  (clk_en == 1'b1)   tbl1_compare_dffe11_10_pipes0 <= tbl1_compare_wi;
	// synopsys translate_off
	initial
		tbl1_compare_dffe11_10_pipes1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_compare_dffe11_10_pipes1 <= 1'b0;
		else if  (clk_en == 1'b1)   tbl1_compare_dffe11_10_pipes1 <= tbl1_compare_dffe11_10_pipes0[0:0];
	// synopsys translate_off
	initial
		tbl1_compare_dffe11_10_pipes2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_compare_dffe11_10_pipes2 <= 1'b0;
		else if  (clk_en == 1'b1)   tbl1_compare_dffe11_10_pipes2 <= tbl1_compare_dffe11_10_pipes1[0:0];
	// synopsys translate_off
	initial
		tbl1_compare_dffe11_10_pipes3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_compare_dffe11_10_pipes3 <= 1'b0;
		else if  (clk_en == 1'b1)   tbl1_compare_dffe11_10_pipes3 <= tbl1_compare_dffe11_10_pipes2[0:0];
	// synopsys translate_off
	initial
		tbl1_compare_dffe11_10_pipes4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_compare_dffe11_10_pipes4 <= 1'b0;
		else if  (clk_en == 1'b1)   tbl1_compare_dffe11_10_pipes4 <= tbl1_compare_dffe11_10_pipes3[0:0];
	// synopsys translate_off
	initial
		tbl1_compare_dffe11_10_pipes5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_compare_dffe11_10_pipes5 <= 1'b0;
		else if  (clk_en == 1'b1)   tbl1_compare_dffe11_10_pipes5 <= tbl1_compare_dffe11_10_pipes4[0:0];
	// synopsys translate_off
	initial
		tbl1_compare_dffe11_10_pipes6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_compare_dffe11_10_pipes6 <= 1'b0;
		else if  (clk_en == 1'b1)   tbl1_compare_dffe11_10_pipes6 <= tbl1_compare_dffe11_10_pipes5[0:0];
	// synopsys translate_off
	initial
		tbl1_compare_dffe11_10_pipes7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_compare_dffe11_10_pipes7 <= 1'b0;
		else if  (clk_en == 1'b1)   tbl1_compare_dffe11_10_pipes7 <= tbl1_compare_dffe11_10_pipes6[0:0];
	// synopsys translate_off
	initial
		tbl1_compare_dffe11_10_pipes8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_compare_dffe11_10_pipes8 <= 1'b0;
		else if  (clk_en == 1'b1)   tbl1_compare_dffe11_10_pipes8 <= tbl1_compare_dffe11_10_pipes7[0:0];
	// synopsys translate_off
	initial
		tbl1_compare_dffe11_10_pipes9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_compare_dffe11_10_pipes9 <= 1'b0;
		else if  (clk_en == 1'b1)   tbl1_compare_dffe11_10_pipes9 <= tbl1_compare_dffe11_10_pipes8[0:0];
	// synopsys translate_off
	initial
		tbl1_tbl2_prod_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_tbl2_prod_dffe12 <= 60'b0;
		else if  (clk_en == 1'b1)   tbl1_tbl2_prod_dffe12 <= tbl1_tbl2_prod_wi;
	// synopsys translate_off
	initial
		tbl3_taylor_prod_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl3_taylor_prod_dffe12 <= 60'b0;
		else if  (clk_en == 1'b1)   tbl3_taylor_prod_dffe12 <= tbl3_taylor_prod_wi;
	// synopsys translate_off
	initial
		x_fixed_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) x_fixed_dffe_0 <= 70'b0;
		else if  (clk_en == 1'b1)   x_fixed_dffe_0 <= x_fixed;
	// synopsys translate_off
	initial
		x_fixed_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) x_fixed_dffe_1 <= 70'b0;
		else if  (clk_en == 1'b1)   x_fixed_dffe_1 <= x_fixed_dffe_0;
	// synopsys translate_off
	initial
		x_fixed_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) x_fixed_dffe_2 <= 70'b0;
		else if  (clk_en == 1'b1)   x_fixed_dffe_2 <= x_fixed_dffe_1;
	// synopsys translate_off
	initial
		x_fixed_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) x_fixed_dffe_3 <= 70'b0;
		else if  (clk_en == 1'b1)   x_fixed_dffe_3 <= x_fixed_dffe_2;
	// synopsys translate_off
	initial
		x_fixed_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) x_fixed_dffe_4 <= 70'b0;
		else if  (clk_en == 1'b1)   x_fixed_dffe_4 <= x_fixed_dffe_3;
	// synopsys translate_off
	initial
		x_fixed_dffe_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) x_fixed_dffe_5 <= 70'b0;
		else if  (clk_en == 1'b1)   x_fixed_dffe_5 <= x_fixed_dffe_4;
	// synopsys translate_off
	initial
		x_fixed_dffe_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) x_fixed_dffe_6 <= 70'b0;
		else if  (clk_en == 1'b1)   x_fixed_dffe_6 <= x_fixed_dffe_5;
	// synopsys translate_off
	initial
		xf_pre_2_dffe10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) xf_pre_2_dffe10 <= 70'b0;
		else if  (clk_en == 1'b1)   xf_pre_2_dffe10 <= xf_pre_2_wi;
	// synopsys translate_off
	initial
		xf_pre_dffe9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) xf_pre_dffe9 <= 70'b0;
		else if  (clk_en == 1'b1)   xf_pre_dffe9 <= xf_pre_wi;
	// synopsys translate_off
	initial
		xi_exp_value_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) xi_exp_value_dffe4 <= 11'b0;
		else if  (clk_en == 1'b1)   xi_exp_value_dffe4 <= xi_exp_value_wi;
	// synopsys translate_off
	initial
		xi_ln2_prod_dffe7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) xi_ln2_prod_dffe7 <= 81'b0;
		else if  (clk_en == 1'b1)   xi_ln2_prod_dffe7 <= xi_ln2_prod_wi;
	// synopsys translate_off
	initial
		xi_prod_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) xi_prod_dffe3 <= 27'b0;
		else if  (clk_en == 1'b1)   xi_prod_dffe3 <= xi_prod_wi;
	lpm_add_sub   exp_minus_bias
	(
	.cout(),
	.dataa({1'b0, exp_w}),
	.datab({1'b0, exp_bias}),
	.overflow(),
	.result(wire_exp_minus_bias_result)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		exp_minus_bias.lpm_direction = "SUB",
		exp_minus_bias.lpm_representation = "SIGNED",
		exp_minus_bias.lpm_width = 12,
		exp_minus_bias.lpm_type = "lpm_add_sub";
	lpm_add_sub   exp_value_add_bias
	(
	.aclr(aclr),
	.cin(wire_cin_to_bias_dataout),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa({1'b0, exp_value_b4_bias_dffe_18}),
	.datab({1'b0, exp_bias[10:1], (~ extra_ln2_dffe_11)}),
	.overflow(),
	.result(wire_exp_value_add_bias_result)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		exp_value_add_bias.lpm_direction = "ADD",
		exp_value_add_bias.lpm_pipeline = 1,
		exp_value_add_bias.lpm_representation = "SIGNED",
		exp_value_add_bias.lpm_width = 12,
		exp_value_add_bias.lpm_type = "lpm_add_sub";
	lpm_add_sub   exp_value_man_over
	(
	.cout(),
	.dataa(wire_exp_value_add_bias_result),
	.datab({11'b00000000000, man_overflow_wo}),
	.overflow(),
	.result(wire_exp_value_man_over_result)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		exp_value_man_over.lpm_direction = "ADD",
		exp_value_man_over.lpm_representation = "SIGNED",
		exp_value_man_over.lpm_width = 12,
		exp_value_man_over.lpm_type = "lpm_add_sub";
	lpm_add_sub   invert_exp_value
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa({11{1'b0}}),
	.datab(exp_value[10:0]),
	.overflow(),
	.result(wire_invert_exp_value_result)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		invert_exp_value.lpm_direction = "SUB",
		invert_exp_value.lpm_pipeline = 1,
		invert_exp_value.lpm_representation = "SIGNED",
		invert_exp_value.lpm_width = 11,
		invert_exp_value.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_round
	(
	.cout(),
	.dataa(man_round_wo),
	.datab({51'b000000000000000000000000000000000000000000000000000, round_up_wo}),
	.overflow(),
	.result(wire_man_round_result)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		man_round.lpm_direction = "ADD",
		man_round.lpm_representation = "SIGNED",
		man_round.lpm_width = 52,
		man_round.lpm_type = "lpm_add_sub";
	lpm_add_sub   one_minus_xf
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa({1'b1, 59'b00000000000000000000000000000000000000000000000000000000000}),
	.datab(wire_extra_ln2_muxa_dataout),
	.overflow(),
	.result(wire_one_minus_xf_result)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		one_minus_xf.lpm_direction = "SUB",
		one_minus_xf.lpm_pipeline = 1,
		one_minus_xf.lpm_representation = "SIGNED",
		one_minus_xf.lpm_width = 60,
		one_minus_xf.lpm_type = "lpm_add_sub";
	lpm_add_sub   x_fixed_minus_xiln2
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(x_fixed_dffe_6),
	.datab({1'b0, xi_ln2_prod_wo[80:12]}),
	.overflow(),
	.result(wire_x_fixed_minus_xiln2_result)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		x_fixed_minus_xiln2.lpm_direction = "SUB",
		x_fixed_minus_xiln2.lpm_pipeline = 1,
		x_fixed_minus_xiln2.lpm_representation = "SIGNED",
		x_fixed_minus_xiln2.lpm_width = 70,
		x_fixed_minus_xiln2.lpm_type = "lpm_add_sub";
	lpm_add_sub   xf_minus_ln2
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(xf_pre[59:0]),
	.datab({2'b00, ln2_w[69:12]}),
	.overflow(),
	.result(wire_xf_minus_ln2_result)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		xf_minus_ln2.lpm_direction = "SUB",
		xf_minus_ln2.lpm_pipeline = 1,
		xf_minus_ln2.lpm_representation = "SIGNED",
		xf_minus_ln2.lpm_width = 60,
		xf_minus_ln2.lpm_type = "lpm_add_sub";
	lpm_add_sub   xi_add_one
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(xi_exp_value),
	.datab(11'b00000000001),
	.overflow(),
	.result(wire_xi_add_one_result)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		xi_add_one.lpm_direction = "ADD",
		xi_add_one.lpm_pipeline = 1,
		xi_add_one.lpm_representation = "SIGNED",
		xi_add_one.lpm_width = 11,
		xi_add_one.lpm_type = "lpm_add_sub";
	lpm_clshift   rbarrel_shift
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.data(barrel_shifter_data),
	.direction(exp_value_wo[11]),
	.distance(barrel_shifter_distance),
	.overflow(),
	.result(wire_rbarrel_shift_result),
	.underflow());
	defparam
		rbarrel_shift.lpm_pipeline = 2,
		rbarrel_shift.lpm_shifttype = "LOGICAL",
		rbarrel_shift.lpm_width = 70,
		rbarrel_shift.lpm_widthdist = 7,
		rbarrel_shift.lpm_type = "lpm_clshift";
	lpm_compare   distance_overflow_comp
	(
	.aeb(),
	.agb(wire_distance_overflow_comp_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(wire_exp_value_to_compare_muxa_dataout),
	.datab(distance_overflow_val_w)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		distance_overflow_comp.lpm_representation = "UNSIGNED",
		distance_overflow_comp.lpm_width = 11,
		distance_overflow_comp.lpm_type = "lpm_compare";
	lpm_compare   tbl1_compare
	(
	.aeb(),
	.agb(),
	.ageb(wire_tbl1_compare_ageb),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(xf[57:49]),
	.datab(addr_val_more_than_one)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		tbl1_compare.lpm_representation = "UNSIGNED",
		tbl1_compare.lpm_width = 9,
		tbl1_compare.lpm_type = "lpm_compare";
	lpm_compare   underflow_compare
	(
	.aeb(),
	.agb(wire_underflow_compare_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(wire_exp_value_to_compare_muxa_dataout),
	.datab(underflow_compare_val_w)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		underflow_compare.lpm_representation = "UNSIGNED",
		underflow_compare.lpm_width = 11,
		underflow_compare.lpm_type = "lpm_compare";
	lpm_mult   man_prod
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(tbl1_tbl2_prod_wo),
	.datab(tbl3_taylor_prod_wo),
	.result(wire_man_prod_result)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		man_prod.lpm_pipeline = 4,
		man_prod.lpm_representation = "UNSIGNED",
		man_prod.lpm_widtha = 60,
		man_prod.lpm_widthb = 60,
		man_prod.lpm_widthp = 120,
		man_prod.lpm_type = "lpm_mult",
		man_prod.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mult   tbl1_tbl2_prod
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(table_one_out),
	.datab(table_two_out),
	.result(wire_tbl1_tbl2_prod_result)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		tbl1_tbl2_prod.lpm_pipeline = 4,
		tbl1_tbl2_prod.lpm_representation = "UNSIGNED",
		tbl1_tbl2_prod.lpm_widtha = 61,
		tbl1_tbl2_prod.lpm_widthb = 61,
		tbl1_tbl2_prod.lpm_widthp = 122,
		tbl1_tbl2_prod.lpm_type = "lpm_mult",
		tbl1_tbl2_prod.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mult   tbl3_taylor_prod
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(table_three_out),
	.datab({1'b1, 27'b000000000000000000000000000, xf[30:0]}),
	.result(wire_tbl3_taylor_prod_result)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		tbl3_taylor_prod.lpm_pipeline = 4,
		tbl3_taylor_prod.lpm_representation = "UNSIGNED",
		tbl3_taylor_prod.lpm_widtha = 61,
		tbl3_taylor_prod.lpm_widthb = 59,
		tbl3_taylor_prod.lpm_widthp = 120,
		tbl3_taylor_prod.lpm_type = "lpm_mult",
		tbl3_taylor_prod.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mult   xi_ln2_prod
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(wire_exp_value_to_ln2a_dataout),
	.datab(ln2_w),
	.result(wire_xi_ln2_prod_result)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		xi_ln2_prod.lpm_pipeline = 4,
		xi_ln2_prod.lpm_representation = "UNSIGNED",
		xi_ln2_prod.lpm_widtha = 11,
		xi_ln2_prod.lpm_widthb = 70,
		xi_ln2_prod.lpm_widthp = 81,
		xi_ln2_prod.lpm_type = "lpm_mult",
		xi_ln2_prod.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mult   xi_prod
	(
	.dataa(x_fixed[69:55]),
	.datab(one_over_ln2_w),
	.result(wire_xi_prod_result)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0),
	.sum({1{1'b0}})
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		xi_prod.lpm_representation = "UNSIGNED",
		xi_prod.lpm_widtha = 15,
		xi_prod.lpm_widthb = 12,
		xi_prod.lpm_widthp = 27,
		xi_prod.lpm_type = "lpm_mult",
		xi_prod.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mux   table_one
	(
	.data(table_one_data),
	.result(wire_table_one_result),
	.sel(xf[57:49])
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		table_one.lpm_size = 512,
		table_one.lpm_width = 61,
		table_one.lpm_widths = 9,
		table_one.lpm_type = "lpm_mux";
	lpm_mux   table_three
	(
	.data(table_three_data),
	.result(wire_table_three_result),
	.sel(xf[39:31])
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		table_three.lpm_size = 512,
		table_three.lpm_width = 42,
		table_three.lpm_widths = 9,
		table_three.lpm_type = "lpm_mux";
	lpm_mux   table_two
	(
	.data(table_two_data),
	.result(wire_table_two_result),
	.sel(xf[48:40])
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		table_two.lpm_size = 512,
		table_two.lpm_width = 51,
		table_two.lpm_widths = 9,
		table_two.lpm_type = "lpm_mux";
	assign
		wire_cin_to_bias_dataout = shifted_value;
	assign		wire_exp_result_mux_prea_dataout = (((((barrel_shifter_underflow | overflow_w) | input_is_zero_wo) | nan_w) | positive_infinity) === 1'b1) ? exp_one : exp_result_w;
	assign		wire_exp_value_b4_biasa_dataout = (sign_dffe3[0:0] === 1'b1) ? exp_invert : xi_exp_value;
	assign		wire_exp_value_selecta_dataout = (exp_value_wo[11] === 1'b1) ? wire_invert_exp_value_result[6:0] : exp_value_wo[6:0];
	assign		wire_exp_value_to_compare_muxa_dataout = (exp_value_wo[11] === 1'b1) ? wire_invert_exp_value_result : exp_value_wo[10:0];
	assign		wire_exp_value_to_ln2a_dataout = (sign_dffe4[0:0] === 1'b1) ? wire_xi_add_one_result : xi_exp_value_wo;
	assign		wire_extra_ln2_muxa_dataout = (extra_ln2_dffe_0 === 1'b1) ? wire_xf_minus_ln2_result : xf_pre_wo[59:0];
	assign		wire_man_result_muxa_dataout = (((((overflow_w | underflow_w) | nan_w) | input_is_zero_wo) | input_is_infinity_wo) === 1'b1) ? {nan_w, 51'b000000000000000000000000000000000000000000000000000} : wire_man_round_result;
	assign		wire_xf_muxa_dataout = (sign_dffe12[0:0] === 1'b1) ? wire_one_minus_xf_result : xf_pre_2_wo[59:0];
	assign
		aclr = 1'b0,
		addr_val_more_than_one = 9'b101100011,
		barrel_shifter_data = {11'b00000000000, 1'b1, fraction_wo, 6'b000000},
		barrel_shifter_distance = wire_exp_value_selecta_dataout,
		barrel_shifter_underflow = barrel_shifter_underflow_dffe2_23_pipes22[0:0],
		barrel_shifter_underflow_wi = (wire_underflow_compare_agb & exp_value_wo[11]),
		distance_overflow = distance_overflow_dffe2_23_pipes22[0:0],
		distance_overflow_val_w = 11'b00000001001,
		distance_overflow_wi = (wire_distance_overflow_comp_agb & (~ exp_value_wo[11])),
		exp_bias = 11'b01111111111,
		exp_bias_all_ones_w = {11{1'b1}},
		exp_data_all_one_w = {(data[62] & exp_data_all_one_w[9]), (data[61] & exp_data_all_one_w[8]), (data[60] & exp_data_all_one_w[7]), (data[59] & exp_data_all_one_w[6]), (data[58] & exp_data_all_one_w[5]), (data[57] & exp_data_all_one_w[4]), (data[56] & exp_data_all_one_w[3]), (data[55] & exp_data_all_one_w[2]), (data[54] & exp_data_all_one_w[1]), (data[53] & exp_data_all_one_w[0]), data[52]},
		exp_data_not_zero_w = {(data[62] | exp_data_not_zero_w[9]), (data[61] | exp_data_not_zero_w[8]), (data[60] | exp_data_not_zero_w[7]), (data[59] | exp_data_not_zero_w[6]), (data[58] | exp_data_not_zero_w[5]), (data[57] | exp_data_not_zero_w[4]), (data[56] | exp_data_not_zero_w[3]), (data[55] | exp_data_not_zero_w[2]), (data[54] | exp_data_not_zero_w[1]), (data[53] | exp_data_not_zero_w[0]), data[52]},
		exp_invert = (xi_exp_value ^ exp_bias_all_ones_w),
		exp_one = {((overflow_w | nan_w) | positive_infinity), 10'b1111111111},
		exp_out_all_one_w = {(exp_result_w[10] & exp_out_all_one_w[9]), (exp_result_w[9] & exp_out_all_one_w[8]), (exp_result_w[8] & exp_out_all_one_w[7]), (exp_result_w[7] & exp_out_all_one_w[6]), (exp_result_w[6] & exp_out_all_one_w[5]), (exp_result_w[5] & exp_out_all_one_w[4]), (exp_result_w[4] & exp_out_all_one_w[3]), (exp_result_w[3] & exp_out_all_one_w[2]), (exp_result_w[2] & exp_out_all_one_w[1]), (exp_result_w[1] & exp_out_all_one_w[0]), exp_result_w[0]},
		exp_out_not_zero_w = {(exp_result_w[10] | exp_out_not_zero_w[9]), (exp_result_w[9] | exp_out_not_zero_w[8]), (exp_result_w[8] | exp_out_not_zero_w[7]), (exp_result_w[7] | exp_out_not_zero_w[6]), (exp_result_w[6] | exp_out_not_zero_w[5]), (exp_result_w[5] | exp_out_not_zero_w[4]), (exp_result_w[4] | exp_out_not_zero_w[3]), (exp_result_w[3] | exp_out_not_zero_w[2]), (exp_result_w[2] | exp_out_not_zero_w[1]), (exp_result_w[1] | exp_out_not_zero_w[0]), exp_result_w[0]},
		exp_result_out = (wire_exp_result_mux_prea_dataout & {11{(~ ((underflow_w & (~ barrel_shifter_underflow)) | negative_infinity))}}),
		exp_result_w = wire_exp_value_man_over_result[10:0],
		exp_value = wire_exp_minus_bias_result,
		exp_value_wi = exp_value,
		exp_value_wo = exp_value_dffe1,
		exp_w = data[62:52],
		extra_ln2 = ((~ xf_pre[69]) & sign_dffe10[0:0]),
		fraction = {data[51:0]},
		fraction_wi = fraction,
		fraction_wo = fraction_dffe1,
		gnd_w = 1'b0,
		guard_bit = man_prod_result[64],
		input_is_infinity_wi = (exp_data_all_one_w[10] & (~ man_data_not_zero_w[51])),
		input_is_infinity_wo = input_is_infinity_24_pipes23[0:0],
		input_is_nan_wi = (exp_data_all_one_w[10] & man_data_not_zero_w[51]),
		input_is_nan_wo = input_is_nan_24_pipes23[0:0],
		input_is_zero_wi = (~ exp_data_not_zero_w[10]),
		input_is_zero_wo = input_is_zero_24_pipes23[0:0],
		ln2_w = 70'b1011000101110010000101111111011111010001110011110111100110101011110010,
		man_data_not_zero_w = {(data[51] | man_data_not_zero_w[50]), (data[50] | man_data_not_zero_w[49]), (data[49] | man_data_not_zero_w[48]), (data[48] | man_data_not_zero_w[47]), (data[47] | man_data_not_zero_w[46]), (data[46] | man_data_not_zero_w[45]), (data[45] | man_data_not_zero_w[44]), (data[44] | man_data_not_zero_w[43]), (data[43] | man_data_not_zero_w[42]), (data[42] | man_data_not_zero_w[41]), (data[41] | man_data_not_zero_w[40]), (data[40] | man_data_not_zero_w[39]), (data[39] | man_data_not_zero_w[38]), (data[38] | man_data_not_zero_w[37]), (data[37] | man_data_not_zero_w[36]), (data[36] | man_data_not_zero_w[35]), (data[35] | man_data_not_zero_w[34]), (data[34] | man_data_not_zero_w[33]), (data[33] | man_data_not_zero_w[32]), (data[32] | man_data_not_zero_w[31]), (data[31] | man_data_not_zero_w[30]), (data[30] | man_data_not_zero_w[29]), (data[29] | man_data_not_zero_w[28]), (data[28] | man_data_not_zero_w[27]), (data[27] | man_data_not_zero_w[26]), (data[26] | man_data_not_zero_w[25]), (data[25] | man_data_not_zero_w[24]), (data[24] | man_data_not_zero_w[23]), (data[23] | man_data_not_zero_w[22]), (data[22] | man_data_not_zero_w[21]), (data[21] | man_data_not_zero_w[20]), (data[20] | man_data_not_zero_w[19]), (data[19] | man_data_not_zero_w[18]), (data[18] | man_data_not_zero_w[17]), (data[17] | man_data_not_zero_w[16]), (data[16] | man_data_not_zero_w[15]), (data[15] | man_data_not_zero_w[14]), (data[14] | man_data_not_zero_w[13]), (data[13] | man_data_not_zero_w[12]), (data[12] | man_data_not_zero_w[11]), (data[11] | man_data_not_zero_w[10]), (data[10] | man_data_not_zero_w[9]), (data[9] | man_data_not_zero_w[8]), (data[8] | man_data_not_zero_w[7]), (data[7] | man_data_not_zero_w[6]), (data[6] | man_data_not_zero_w[5]), (data[5] | man_data_not_zero_w[4]), (data[4] | man_data_not_zero_w[3]), (data[3] | man_data_not_zero_w[2]), (data[2] | man_data_not_zero_w[1]), (data[1] | man_data_not_zero_w[0]), data[0]},
		man_overflow = (round_up & man_result_all_ones[51]),
		man_overflow_wi = man_overflow,
		man_overflow_wo = man_overflow_dffe15,
		man_prod_result = ((man_prod_shifted & {120{man_prod_wo[117]}}) | (man_prod_wire & {120{(~ man_prod_wo[117])}})),
		man_prod_shifted = {gnd_w, man_prod_wo[119:1]},
		man_prod_wi = wire_man_prod_result,
		man_prod_wire = man_prod_wo,
		man_prod_wo = man_prod_dffe14,
		man_result_all_ones = {(man_round_wi[51] & man_result_all_ones[50]), (man_round_wi[50] & man_result_all_ones[49]), (man_round_wi[49] & man_result_all_ones[48]), (man_round_wi[48] & man_result_all_ones[47]), (man_round_wi[47] & man_result_all_ones[46]), (man_round_wi[46] & man_result_all_ones[45]), (man_round_wi[45] & man_result_all_ones[44]), (man_round_wi[44] & man_result_all_ones[43]), (man_round_wi[43] & man_result_all_ones[42]), (man_round_wi[42] & man_result_all_ones[41]), (man_round_wi[41] & man_result_all_ones[40]), (man_round_wi[40] & man_result_all_ones[39]), (man_round_wi[39] & man_result_all_ones[38]), (man_round_wi[38] & man_result_all_ones[37]), (man_round_wi[37] & man_result_all_ones[36]), (man_round_wi[36] & man_result_all_ones[35]), (man_round_wi[35] & man_result_all_ones[34]), (man_round_wi[34] & man_result_all_ones[33]), (man_round_wi[33] & man_result_all_ones[32]), (man_round_wi[32] & man_result_all_ones[31]), (man_round_wi[31] & man_result_all_ones[30]), (man_round_wi[30] & man_result_all_ones[29]), (man_round_wi[29] & man_result_all_ones[28]), (man_round_wi[28] & man_result_all_ones[27]), (man_round_wi[27] & man_result_all_ones[26]), (man_round_wi[26] & man_result_all_ones[25]), (man_round_wi[25] & man_result_all_ones[24]), (man_round_wi[24] & man_result_all_ones[23]), (man_round_wi[23] & man_result_all_ones[22]), (man_round_wi[22] & man_result_all_ones[21]), (man_round_wi[21] & man_result_all_ones[20]), (man_round_wi[20] & man_result_all_ones[19]), (man_round_wi[19] & man_result_all_ones[18]), (man_round_wi[18] & man_result_all_ones[17]), (man_round_wi[17] & man_result_all_ones[16]), (man_round_wi[16] & man_result_all_ones[15]), (man_round_wi[15] & man_result_all_ones[14]), (man_round_wi[14] & man_result_all_ones[13]), (man_round_wi[13] & man_result_all_ones[12]), (man_round_wi[12] & man_result_all_ones[11]), (man_round_wi[11] & man_result_all_ones[10]), (man_round_wi[10] & man_result_all_ones[9]), (man_round_wi[9] & man_result_all_ones[8]), (man_round_wi[8] & man_result_all_ones[7]), (man_round_wi[7]
 & man_result_all_ones[6]), (man_round_wi[6] & man_result_all_ones[5]), (man_round_wi[5] & man_result_all_ones[4]), (man_round_wi[4] & man_result_all_ones[3]), (man_round_wi[3] & man_result_all_ones[2]), (man_round_wi[2] & man_result_all_ones[1]), (man_round_wi[1] & man_result_all_ones[0]), man_round_wi[0]},
		man_result_w = wire_man_result_muxa_dataout,
		man_round_wi = man_prod_result[115:64],
		man_round_wo = man_round_dffe15,
		nan_w = input_is_nan_wo,
		negative_infinity = (sign_dffe23[0:0] & input_is_infinity_wo),
		one_over_ln2_w = 12'b101110001010,
		overflow_w = ((((~ sign_dffe23[0:0]) & (((distance_overflow | wire_exp_value_add_bias_result[11]) | exp_out_all_one_w[10]) | wire_exp_value_man_over_result[11])) & (~ underflow_w)) & (~ input_is_nan_wo)),
		positive_infinity = ((~ sign_dffe23[0:0]) & input_is_infinity_wo),
		result = {1'b0, result_pipe_wo},
		result_pipe_wi = {exp_result_out, man_result_w},
		result_pipe_wo = result_pipe_dffe16,
		result_underflow_w = ((~ exp_out_not_zero_w[10]) & (((~ wire_exp_value_man_over_result[11]) & (~ sign_dffe23[0:0])) | sign_dffe23[0:0])),
		round_bit = man_prod_result[63],
		round_up = (round_bit & (guard_bit | sticky_bits[4])),
		round_up_wi = round_up,
		round_up_wo = round_up_dffe15,
		shifted_value = (tbl1_compare_wo | man_prod_wo[117]),
		sign_w = data[63],
		sticky_bits = {(man_prod_result[58] | sticky_bits[3]), (man_prod_result[59] | sticky_bits[2]), (man_prod_result[60] | sticky_bits[1]), (man_prod_result[61] | sticky_bits[0]), man_prod_result[62]},
		table_one_data = {61'b1010110110100001011011011110100111100001100100011101100101101, 61'b1010110101001010101100101110001101111100110010100110001010000, 61'b1010110011110100001000110010111111000101101000101101100100011, 61'b1010110010011101101111101011100100011000001011011101101111110, 61'b1010110001000111100001010110100111011011010011010100110010000, 61'b1010101111110001011101110010110010000000101011001110100010011, 61'b1010101110011011100100111110101110000100101111001110011011010, 61'b1010101101000101110110111001000101101110101011001001010110101, 61'b1010101011110000010011100000100011010000011001001111110101011, 61'b1010101010011010111010110011110001000110100000111000010000110, 61'b1010101001000101101100110001011001111000010101001001010111101, 61'b1010100111110000101001011000001000010111110011100100110101001, 61'b1010100110011011110000100110100111100001100010110010000011011, 61'b1010100101000111000010011011100010011100110001001001000111010, 61'b1010100011110010011110110101100100011011010011011101111000000, 61'b1010100010011110000101110011011000111001100011101011010001100, 61'b1010100001001001110111010011101011011110011111011110101111101, 61'b1010011111110101110011010101000111111011100111000011110110010, 61'b1010011110100001111001110110011010001100111011110000000010001, 61'b1010011101001110001010110110001110011000111110101110100101000, 61'b1010011011111010100110010011010000110000101111101100101100101, 61'b1010011010100111001100001100001101101111101011100101110010110, 61'b1010011001010011111100011111110001111011101011001111111001110, 61'b1010011000000000110111001100101010000101000010001000010001011, 61'b1010010110101101111100010001100011000110011101000000001000000, 61'b1010010101011011001011101101001010000101000000101001100100111, 61'b1010010100001000100101011110001100010000001000100100101101000, 61'b1010010010110110001001100011010111000001100101101100110011001, 61'b1010010001100011110111111011010111111101011101000101110001000, 61'b1010010000010001110000100100111100110010000110101001101011101, 61'b1010001110111111110011011110110011011000001011110110100001111
, 61'b1010001101101110000000100111101001110010100110011100000100101, 61'b1010001100011100010111111110001110001110011111001001111010000, 61'b1010001011001010111001100001001111000011001100011101101010100, 61'b1010001001111001100101001111011010110010010001010001011000011, 61'b1010001000101000011011000111100000000111011011101010000001000, 61'b1010000111010111011011001000001101111000100011100110001000110, 61'b1010000110000110100101010000010011000101101001101100110000101, 61'b1010000100110101111001011110011110111000110101111100010110101, 61'b1010000011100101010111110001100000100110010110011001111111101, 61'b1010000010010101000000001000000111101100011110000000101011101, 61'b1010000001000100110010100001000011110011100011010000110100001, 61'b1001111111110100101110111011000100101101111110111111110100100, 61'b1001111110100100110101010100111010011000001011000111111100000, 61'b1001111101010101000101101101010100111000100001011000001010111, 61'b1001111100000101100000000011000100011111011010000100011000001, 61'b1001111010110110000100010100111001100111001010110101100010001, 61'b1001111001100110110010100001100100110100000101011010001001000, 61'b1001111000010111101010100111110110110100010110010110110010111, 61'b1001110111001000101100100110100000100000000011110110111010000, 61'b1001110101111001111000011100010010111001001100011101100101000, 61'b1001110100101011001110000111111111001011100101110110101000100, 61'b1001110011011100101101101000010110101100111011100111110011101, 61'b1001110010001110010110111100001010111100101110000010000100101, 61'b1001110001000000001010000010001101100100010000110011001001110, 61'b1001101111110010000110111001010000010110101001110111001001011, 61'b1001101110100100001101100000000101010000110000001010010101100, 61'b1001101101010110011101110101011110011001001010011011001000111, 61'b1001101100001000110111111000001110000000001101111100001101010, 61'b1001101010111011011011100111000110011111111101010110101011111, 61'b1001101001101110001001000000111010011100000111011100100111011, 61'b1001101000100001000000000100011100100010000101111011011111111
, 61'b1001100111010100000000110000011111101000111100001110111111111, 61'b1001100110000111001011000011110110110001010110010011110011100, 61'b1001100100111010011110111101010101000101100111011010101001011, 61'b1001100011101101111100011011101101111001101000111011011100111, 61'b1001100010100001100011011101110100101010111001001000101001110, 61'b1001100001010101010100000010011101000000011010000010101001110, 61'b1001100000001001001110001000011010101010110000001011011011111, 61'b1001011110111101010001101110100001100100000001011010010100110, 61'b1001011101110001011110110011100101101111110011101111111000011, 61'b1001011100100101110101010110011011011011001100001001111110011, 61'b1001011011011010010101010101110110111100101101010111111110110, 61'b1001011010001110111110110000101100110100010110101111001000011, 61'b1001011001000011110001100101110001101011100010111111000000111, 61'b1001010111111000101101110011111010010101000111000110001110011, 61'b1001010110101101110011011001111011101101010001000111001010001, 61'b1001010101100011000010010110101010111001100110111100111100111, 61'b1001010100011000011010101000111101001001000101010000100100001, 61'b1001010011001101111100001111100111110011111110001110000001011, 61'b1001010010000011100111001001100000011011111000011001110010010, 61'b1001010000111001011011010101011100101011101101100110010010011, 61'b1001001111101111011000110010010010010111101001101001100101110, 61'b1001001110100101011111011110110111011101001001010011001101101, 61'b1001001101011011101111011010000010000010111001000010000101010, 61'b1001001100010010001000100010101000011000110011111010101001001, 61'b1001001011001000101010110111100000111000000010011101000110100, 61'b1001001001111111010110010111100010000010111001011011110100111, 61'b1001001000110110001011000001100010100100111000110001111000000, 61'b1001000111101101001000110100011001010010101010011001101011101, 61'b1001000110100100001111101110111101001010000001000011111000000, 61'b1001000101011011011111110000000101010001110111001110001111110, 61'b1001000100010010111000110110101000111010001101111010110110110
, 61'b1001000011001010011011000001011111011100001011100111010010000, 61'b1001000010000010000110001111100000011001111011000100000001000, 61'b1001000000111001111010011111100011011110101010001011111111111, 61'b1000111111110001110111110000100000011110101000111100010010010, 61'b1000111110101001111110000001001111010111001000001011111000000, 61'b1000111101100010001101010000101000001110011000100011101010001, 61'b1000111100011010100101011101100011010011101001010110100001000, 61'b1000111011010011000110100110111000111111000111011001100100000, 61'b1000111010001011110000101011100001110001111011111100100001011, 61'b1000111001000100100011101010010110010110001011100010001111011, 61'b1000110111111101011111100010001111011110110100111001010110101, 61'b1000110110110110100100010010000110000111101111110101000100110, 61'b1000110101101111110001111000110011010101101100000110001000010, 61'b1000110100101001001000010101010000010110010000010011110101101, 61'b1000110011100010100111100110010110011111111000110101010100101, 61'b1000110010011100001111101010111111010001110110101010110110111, 61'b1000110001010110000000100010000100010100001110010111010111000, 61'b1000110000001111111010001010011111010111110110111010000000101, 61'b1000101111001001111100100011001010010110011000101000000001110, 61'b1000101110000100000111101010111111010010001100000110100011101, 61'b1000101100111110011011100000111000010110011001000100101101110, 61'b1000101011111000111000000011101111110110110101010101110000100, 61'b1000101010110011011101010010100000010000000011101011011001100, 61'b1000101001101110001011001100000100000111010010110000001111110, 61'b1000101000101001000001101111010110001010011100000010011000110, 61'b1000100111100100000000111011010001010000000010101110000111001, 61'b1000100110011111001000101110110000010111010010101000110000011, 61'b1000100101011010011001001000101110100111111111001011101100010, 61'b1000100100010101110010001000000111010010100010001111011100111, 61'b1000100011010001010011101011110101101111111011000110111111000, 61'b1000100010001100111101110010110101100001101101011011000010101
, 61'b1000100001001000110000011100000010010010000000000101101101001, 61'b1000100000000100101011100110010111110011011100001110000011001, 61'b1000011111000000101111010000110010000001001100000011111010110, 61'b1000011101111100111011011010001100111110111001111011110111101, 61'b1000011100111001010000000001100100111000101111001011001101101, 61'b1000011011110101101101000101110110000011010011000100001101110, 61'b1000011010110010010010100101111100111011101001110010011010011, 61'b1000011001101111000000100000110110000111010011010111000100001, 61'b1000011000101011110110110101011110010100001010100101110000000, 61'b1000010111101000110101100010110010011000100100000001000100101, 61'b1000010110100101111100100111101111010011001100110111100000111, 61'b1000010101100011001100000011010010001011001010000000011010110, 61'b1000010100100000100011110100011000001111110110111001000110010, 61'b1000010011011110000011111001111110111001000100100010000100100, 61'b1000010010011011101100010011000011100110111000011100011100010, 61'b1000010001011001011100111110100100000001101011100111011001001, 61'b1000010000010111010101111011011101111010001001011101110100111, 61'b1000001111010101010111001000101111001001001110110100000111011, 61'b1000001110010011100000100101010101110000001000110101111111101, 61'b1000001101010001110010010000001111111000010100000100100101011, 61'b1000001100010000001100001000011011110011011011010100100010100, 61'b1000001011001110101110001100110111111011010110101100010011111, 61'b1000001010001101011000011100100010110010001010100010100100101, 61'b1000001001001100001010110110011011000010000110011100101110111, 61'b1000001000001011000101011001011111011101100100001101100110110, 61'b1000000111001010001000000100101110111111000110110100001100110, 61'b1000000110001001010010110111001000101001011001011010100111111, 61'b1000000101001000100101101111101011100111001110010101001000101, 61'b1000000100001000000000101101010111001011011110000001010011111, 61'b1000000011000111100011101111001010110001000110000101010101010, 61'b1000000010000111001110110100000101111011001000001111011010110
, 61'b1000000001000111000001111011001000010100101001010101010111010, 61'b1000000000000110111101000011010001110000110000010100001110000, 61'b1111111110001110000000010111000100010101001010100000001010011, 61'b1111111100001110010110100101110011001010100000101000000011100, 61'b1111111010001110111100110000110000010111110001100100010011101, 61'b1111111000001111110010110101111100100011001000000111100000101, 61'b1111110110010000111000110011011000100010101001010011001111101, 61'b1111110100010010001110100111000101011100010010011000111011100, 61'b1111110010010011110100001111000100100101110110111010111010010, 61'b1111110000010101101001101001010111100100111110101101110011010, 61'b1111101110010111101110110100000000001111000011111010000100110, 61'b1111101100011010000011101101000000101001010000111101111001010, 61'b1111101010011100101000010010011011001000011110101111001100101, 61'b1111101000011111011100100010010010010001010010011110000001010, 61'b1111100110100010100000011010101000110111111011110111000100010, 61'b1111100100100101110011111001100010000000010011000110100010000, 61'b1111100010101001010110111101000000111101110110111011001001110, 61'b1111100000101101001001100011001001010011101010101001100001010, 61'b1111011110110001001011101001111110110100010100001111100111111, 61'b1111011100110101011101001111100101100001111010011000101001010, 61'b1111011010111001111110010010000001101110000010100000111111000, 61'b1111011000111110101110101111010111111001101110111010100010101, 61'b1111010111000011101110100101101100110101011100110001001110110, 61'b1111010101001000111101110011000101100001000010001111101110110, 61'b1111010011001110011100010101100111001011101100100100011111110, 61'b1111010001010100001010001011010111010011111110000110111110110, 61'b1111001111011010000111010010011011100111101100011101001000000, 61'b1111001101100000010011101000111010000011111110100001000100010, 61'b1111001011100110101111001100111000110101001010100111000110010, 61'b1111001001101101011001111100011110010110110100100011110110101, 61'b1111000111110100010011110101110001010011101011110010110000000
, 61'b1111000101111011011100110110111000100101101001011100101001100, 61'b1111000100000010110100111101111011010101101110011110110000011, 61'b1111000010001010011100001001000000111100000001110001110001100, 61'b1111000000010010010010010110010000111111101110010001010000111, 61'b1110111110011010010111100011110011010111000001000011010001110, 61'b1110111100100010101011101111110000000111000111100000001011100, 61'b1110111010101011001110111000001111100100001101011010110000001, 61'b1110111000110100000000111011011010010001011011001000011111100, 61'b1110110110111101000001110111011001000000110011101010001011010, 61'b1110110101000110010001101010010100110011010010110100100111111, 61'b1110110011001111110000010010010110111000101011011001101110101, 61'b1110110001011001011101101101101000101111100101010001101100111, 61'b1110101111100011011001111010010100000101011011100100100010100, 61'b1110101101101101100100110110100010110110011010110011101111110, 61'b1110101011110111111110100000011111001101011111000100010001001, 61'b1110101010000010100110110110010011100100010010001000101010110, 61'b1110101000001101011101110110001010100011001001101011100001001, 61'b1110100110011000100011011110001111000001000101011010000010100, 61'b1110100100100011110111101100101100000011101101001110111101011, 61'b1110100010101111011010011111101100111111001111011101100110000, 61'b1110100000111011001011110101011101010110011110111101001010110, 61'b1110011111000111001011101100001000111010110001010100010110111, 61'b1110011101010011011010000001111011101011111101000101000100010, 61'b1110011011011111110110110101000001111000010111111000011010100, 61'b1110011001101100100010000011100111111100110100101010111101101, 61'b1110010111111001011011101011111010100100100001111001001011001, 61'b1110010110000110100011101100000110101001000111101100000100111, 61'b1110010100010011111010000010011001010010100110000110001010110, 61'b1110010010100001011110101100111111110111010011010000100010110, 61'b1110010000101111010001101010000111111011111001101000001111011, 61'b1110001110111101010010110111111111010011010110001011110100000
, 61'b1110001101001011100010010100110011111110110110101001001000011, 61'b1110001011011001111111111110110100001101110111101011011001000, 61'b1110001001101000101011110100001110011110000011001001010111101, 61'b1110000111110111100101110011010001011011001110010011111000000, 61'b1110000110000110101101111010001011111111011000000100011100001, 61'b1110000100010110000100000111001101010010100111001100001110001, 61'b1110000010100101101000011000100100101011001000100011001000100, 61'b1110000000110101011010101100100001101101001101010111001100000, 61'b1101111111000101011011000001010100001011001001011100000100011, 61'b1101111101010101101001010101001100000101010001011010111010001, 61'b1101111011100110000101100110011001101001111001000010010011011, 61'b1101111001110110101111110011001101010101010001010110100001101, 61'b1101111000000111100111111001110111110001100111000001111110100, 61'b1101110110011000101101111000101001110111000000100101110101110, 61'b1101110100101010000001101101110100101011011100101010111101001, 61'b1101110010111011100011010111101001100010110000010010111010111, 61'b1101110001001101010010110100011001111110100101001001011000111, 61'b1101101111011111010000000010010111101110010111110101100111010, 61'b1101101101110001011010111111110100101111010110001100001010101, 61'b1101101100000011110011101011000011001100011101100000111010010, 61'b1101101010010110011010000010010101011110011000111001001010110, 61'b1101101000101001001110000011111110001011011111011110000110100, 61'b1101100110111100001111101110010000000111110010101111010100010, 61'b1101100101001111011110111111011110010100111100110101101011010, 61'b1101100011100010111011110101111100000010001110110110010100011, 61'b1101100001110110100110001111111100101100011111000101111010001, 61'b1101100000001010011110001011110011111110000111011100000100111, 61'b1101011110011110100011100111110101101111000011100111000101110, 61'b1101011100110010110110100010010110000100101111011111101101111, 61'b1101011011000111010110111001101001010010000101011101010100110, 61'b1101011001011100000100101100000011110111011100101010001010011
, 61'b1101010111110000111111110111111010100010100111010111110111110, 61'b1101010110000110001000011011100010001110110001010100001101001, 61'b1101010100011011011110010101010000000100011101111101111100110, 61'b1101010010110001000001100011011001011001100110111010000011011, 61'b1101010001000110110010000100010011110001011010001000111110011, 61'b1101001111011100101111110110010100111100011000011100001111000, 61'b1101001101110010111010110111110010111000010011101100001010110, 61'b1101001100001001010011000111000011110000001101001101111001001, 61'b1101001010011111111000100010011101111100010100001001011110101, 61'b1101001000110110101011001000011000000010000011110000010101001, 61'b1101000111001101101010110111001000110100000001110011110001011, 61'b1101000101100100110111101101000111010001111100111011110101010, 61'b1101000011111100010001101000101010101000101010111110001111110, 61'b1101000010010011111000101000001010010010000111010101101001111, 61'b1101000000101011101100101001111101110101010001011001000000000, 61'b1100111111000011101101101100011101000110001010110011001010000, 61'b1100111101011011111011101110000000000101110101111010101101111, 61'b1100111011110100010110101100111111000010010100001010000010000, 61'b1100111010001100111110100111110010010110100100010111011010011, 61'b1100111000100101110011011100110010101010100001001101100011111, 61'b1100110110111110110101001010011000110010111111100100001100010, 61'b1100110101011000000011101110111101110001101100111000110110110, 61'b1100110011110001011111001000111010110101001101100111111110000, 61'b1100110010001011000111010110101001011000111011100110000010011, 61'b1100110000100100111100010110100011000101000100011001000101101, 61'b1100101110111110111110000111000001101110100111110010010011001, 61'b1100101101011001001100100110011111010111010110000111110100011, 61'b1100101011110011100111110011010110001101101110101110110011011, 61'b1100101010001110001111101100000000101100111110010101101000111, 61'b1100101000101001000100001110111001011100111101011110010111010, 61'b1100100111000100000101011010011011010010001110111001010011000
, 61'b1100100101011111010011001101000001001101111101111111110110111, 61'b1100100011111010101101100101000110011101111101001111100100111, 61'b1100100010010110010100100001000110011100100100100101010100111, 61'b1100100000110010000111111111011100110000101111111000101101101, 61'b1100011111001110000111111110100101001101111101010111101101011, 61'b1100011101101010010100011100111011110100001100000010011011101, 61'b1100011100000110101101011000111100101111111010000111001010100, 61'b1100011010100011010010110001000100011010000011011110100010100, 61'b1100011001000000000100100011101111011000000000000111111011100, 61'b1100010111011101000010101111011010011011100010100110000010001, 61'b1100010101111010001101010010100010100010110110011011101010000, 61'b1100010100010111100100001011100100111000011110101000101011001, 61'b1100010010110101000111011000111110110011010100000111001101001, 61'b1100010001010010110110111001001101110110100100001000111101111, 61'b1100001111110000110010101010101111110001101110110100110100010, 61'b1100001110001110111010101100000010100000100101100100100000110, 61'b1100001100101101001110111011100100001011001001100010101000001, 61'b1100001011001011101111010111110011000101101010001000101011111, 61'b1100001001101010011011111111001101110000100011011101011110101, 61'b1100001000001001010100110000010010111000011100110011100100010, 61'b1100000110101000011001101001100001010110000111000111111110110, 61'b1100000101000111101010101001011000001110011011100001000110111, 61'b1100000011100111000111101110010110110010011001101101110001000, 61'b1100000010000110110000110110111100011111000110100100011110010, 61'b1100000000100110100110000001101000111101101010100010111001011, 61'b1011111111000110100111001100111100000011010000001101100000000, 61'b1011111101100110110100010111010101110001000010101111010111111, 61'b1011111100000111001101011111010110010100001100011010001111111, 61'b1011111010100111110010100011011110000101110101000110101101010, 61'b1011111001001000100011100010001101101011000000110100100100101, 61'b1011110111101001100000011010000101110100101110001011011111011
, 61'b1011110110001010101001001001100111011111110100111011101100010, 61'b1011110100101011111101101111010011110101000100011110111100011, 61'b1011110011001101011110001001101100001001000010011001101100001, 61'b1011110001101111001010010111010001111100001000111100010111011, 61'b1011110000010001000010010110100110111010100101100100111010011, 61'b1011101110110011000110000110001100111100010111100000011101101, 61'b1011101101010101010101100100100110000101001110001101001101101, 61'b1011101011110111110000110000010100100100100111111100011111011, 61'b1011101010011010010111100111111010110101110000010100111111010, 61'b1011101000111101001010001001111011011111011110110101001100010, 61'b1011100111100000001000010100111001010100010101010101111110111, 61'b1011100110000011010010000111010111010010011110101101011011111, 61'b1011100100100110100111011111111000100011101101010001110010010, 61'b1011100011001010001000011101000000011101011001011100100101000, 61'b1011100001101101110100111101010010100000100000001110000000100, 61'b1011100000010001101100111111010010011001100001110000011011101, 61'b1011011110110101110000100001100100000000011111111100000100001, 61'b1011011101011001111111100010101011011000111100111010110110100, 61'b1011011011111110011010000001001100110001111001101100100001111, 61'b1011011010100010111111111011101100100101110100101010110110101, 61'b1011011001000111110001010000101111011010101000001110000001010, 61'b1011010111101100101101111110111010000001101001010001001111111, 61'b1011010110010001110110000100110001010111100101110111100100001, 61'b1011010100110111001001100000111010100100100011110000101111001, 61'b1011010011011100101000010001111010111011111110111110011010001, 61'b1011010010000010010010010110010111111100101000011001011001111, 61'b1011010000101000000111101100110111010000100100010111001101010, 61'b1011001111001110001000010011111110101101001001001111100111001, 61'b1011001101110100010100001010010100010010111110000010100100001, 61'b1011001100011010101011001110011110001101111000111110001011010, 61'b1011001011000001001101011111000010110100111110000100111001001
, 61'b1011001001100111111010111010101000101010011101110011110111111, 61'b1011001000001110110011011111110110011011110011101001100000101, 61'b1011000110110101110111001101010011000001100100101100001001101, 61'b1011000101011101000110000001100101011111011110010000111110000, 61'b1011000100000100011111111011010101000100010100100011000010100, 61'b1011000010101100000100111001001001001010000001001010100011011, 61'b1011000001010011110100111001101001010101100001110100001110101, 61'b1010111111111011101111111011011101010110110110111000111001001, 61'b1010111110100011110101111101001101001001000010000101001110101, 61'b1010111101001100000110111101100000110010000101000001101100011, 61'b1010111011110100100010111011000000100010111111111010100111011, 61'b1010111010011101001001110100010100110111110000001000011101101, 61'b1010111001000101111011101000000110010111001110111000010001111, 61'b1010110111101110111000010100111101110011001111110100010010011, 61'b1010110110010111111111111001100100001000011111101100101010111, 61'b1010110101000001010010010100100010011110100011000000100001001, 61'b1010110011101010101111100100100010000111110100100110111100111, 61'b1010110010010100010111101000001100100001100100011000011001110, 61'b1010110000111110001010011110001011010011110101111000000100111, 61'b1010101111101000001000000101001000010001011110111101100100110, 61'b1010101110010010010000011011101101011000000110011110101100001, 61'b1010101100111100100011100000100100110000000010111001010111101, 61'b1010101011100111000001010010011000101100011000111101110110010, 61'b1010101010010001101001101111110011101010111010011000111100000, 61'b1010101000111100011100110111100000010100000100011110100000010, 61'b1010100111100111011010101000001001011010111110110100000101101, 61'b1010100110010010100011000000011001111101011001111011101101100, 61'b1010100100111101110101111110111101000011101101111110110101110, 61'b1010100011101001010011100010011110000000111001011001100001000, 61'b1010100010010100111011101001101000010010011111100101101001011, 61'b1010100001000000101110010011000111100000100111100110011110101
, 61'b1010011111101100101011011101100111011101111010110100001101110, 61'b1010011110011000110011000111110100000111100011100111110011110, 61'b1010011101000101000101010000011001100101001100000110111010111, 61'b1010011011110001100001110110000100001000111100110000000010011, 61'b1010011010011110001000110111100000001111011011000110110000011, 61'b1010011001001010111010010011011010011111101000100000001110100, 61'b1010010111110111110110001000011111101011000000101111110001001, 61'b1010010110100100111100010101011100101101011000110011101000110, 61'b1010010101010010001100111000111110101100111101100001111101011, 61'b1010010011111111100111110001110010111010010010010101110101100, 61'b1010010010101101001100111110100110110000001111111100100101110, 61'b1010010001011010111100011110000111110100000011000011001100111, 61'b1010010000001000110110001111000011110101001011000011110111110, 61'b1010001110110110111010010000001000101101011000110011110001101, 61'b1010001101100101001000100000000100100000101101010000111101110, 61'b1010001100010011100000111101100101011101011000010000011011011, 61'b1010001011000010000011100111011001111011110111001100010011110, 61'b1010001001110000110000011100010000011110110011110010010011000, 61'b1010001000011111100111011010110111110011000010110010001010100, 61'b1010000111001110101000100001111110101111100010101100011101110, 61'b1010000101111101110011110000010100010101011010100001011001001, 61'b1010000100101101001001000100100111101111111000011111110011110, 61'b1010000011011100101000011101101000010100010000110100011001101, 61'b1010000010001100010001111010000101100001111100011001000001111, 61'b1010000000111100000101011000101111000010010111100100001101100, 61'b1001111111101100000010111000010100101001000000111000110001011, 61'b1001111110011100001010010111100110010011010111110101101001001, 61'b1001111101001100011011110101010100001000111011100101110101010, 61'b1001111011111100110111010000001110011011001001110000100001111, 61'b1001111010101101011100100111000101100101011101001001011001000, 61'b1001111001011110001011111000101010001101001100100000111101011
, 61'b1001111000001111000101000011101101000001101001010101001111111, 61'b1001110111000000001000000110111110111011111110100010011111010, 61'b1001110101110001010101000001010000111111001111010100000000100, 61'b1001110100100010101011110001010100011000010101110101010010111, 61'b1001110011010100001100010101111010011110000010000011001011111, 61'b1001110010000101110110101101110100110000111000011101001110101, 61'b1001110000110111101010110111110100111011010000110111001100010, 61'b1001101111101001101000110010101100110001010101001010101110000, 61'b1001101110011011110000011101001110010001000000001001001001111, 61'b1001101101001110000001110110001011100001111100001101100000001, 61'b1001101100000000011100111100010110110101100010001110100011001, 61'b1001101010110011000001101110100010100110111000010001001000111, 61'b1001101001100101110000001011100001011010110000011010100101101, 61'b1001101000011000101000010010000101111111100111100011010001001, 61'b1001100111001011101010000001000011001101100100001001010101000, 61'b1001100101111110110101010111001100000110010101000011100100101, 61'b1001100100110010001010010011010011110101010000010100011111001, 61'b1001100011100101101000110100001101101111010001111101011010011, 61'b1001100010011001010000111000101101010010111010110001111000010, 61'b1001100001001101000010011111100110001000001111001011000101010, 61'b1001100000000000111101100111101100000000110101111011100000000, 61'b1001011110110101000010001111110010110111110111000010101011100, 61'b1001011101101001010000010110101110110001111010100001001001101, 61'b1001011100011101100111111011010011111101000111001100100000100, 61'b1001011011010010001000111100010110110001000001100011100111110, 61'b1001011010000110110011011000101011101110101010100011000000111, 61'b1001011000111011100111001111000111100000011110011001010111101, 61'b1001010111110000100100011110011110111010010011011100001100110, 61'b1001010110100101101011000101100110111001011000111100101010000, 61'b1001010101011010111011000011010100100100010101111100011110111, 61'b1001010100010000010100010110011101001011001000000011000111101
, 61'b1001010011000101110110111101110110000111000010010010111101011, 61'b1001010001111011100010111000010100111010101011111110101110101, 61'b1001010000110001011000000100101111010001111111011111000010111, 61'b1001001111100111010110100001111011000010001001001000000101111, 61'b1001001110011101011110001110101110001001100101111111011100111, 61'b1001001101010011101111001001111110110000000010110010000101011, 61'b1001001100001010001001010010100011000110011010101010011100100, 61'b1001001011000000101100100111010001100110110110000110110000010, 61'b1001001001110111011001000111000000110100101001101111011001001, 61'b1001001000101110001110110000100111011100010101001101011110010, 61'b1001000111100101001101100010111100010011100010000001100000111, 61'b1001000110011100010101011100110110011001000010011010010010111, 61'b1001000101010011100110011101001100110100110000001011110101000, 61'b1001000100001011000000100010110110110111101011100110011111001, 61'b1001000011000010100011101100101011111011111010001110010001001, 61'b1001000001111010001111111001100011100100100101110010001100100, 61'b1001000000110010000101001000010101011101111011000011111000101, 61'b1000111111101010000011010111111001011101001000101111001101110, 61'b1000111110100010001010100111000111100000011110010010001011000, 61'b1000111101011010011010110100110111101111001010110100110100011, 61'b1000111100010010110100000000000010011001011100000001011001110, 61'b1000111011001011010110000111011111111000011100111100100111101, 61'b1000111010000100000001001010001000101110010100111101111111110, 61'b1000111000111100110101000110110101100110000110101000011011110, 61'b1000110111110101110001111100011111010011101110100010110111100, 61'b1000110110101110110111101001111110110100000010010001000110000, 61'b1000110101101000000110001110001101001100101111001100101101001, 61'b1000110100100001011101101000000011101100011001011110001100001, 61'b1000110011011010111101110110011011101010011010110110001010001, 61'b1000110010010100100110111000001110100111000001100110101101000, 61'b1000110001001110011000101100010110001011001111011100111010010
, 61'b1000110000001000010011010001101100001000111000011010011111011, 61'b1000101111000010010110100111001010011010100001101111100100011, 61'b1000101101111100100010101011101011000011100000110100100101111, 61'b1000101100110110110111011110001000001111111010000100011000011, 61'b1000101011110001010100111101011100010100011111110110010100110, 61'b1000101010101011111011001000100001101110110001011000101100111, 61'b1000101001100110101001111110010011000100111001101011001000101, 61'b1000101000100001100001011101101011000101101110011001001100110, 61'b1000100111011100100001100101100100101000101110110101001001100, 61'b1000100110010111101010010100111010101110000010110010110001110, 61'b1000100101010010111011101010101000011110011001100010011011101, 61'b1000100100001110010101100101101001001011001000101100001000111, 61'b1000100011001001111000000100111000001110001011001010111000100, 61'b1000100010000101100011000111010001001010000000001000000000010, 61'b1000100001000001010110101011101111101001101001110110101111101, 61'b1000011111111101010010110001001111100000101100101111111010100, 61'b1000011110111001010111010110101100101011001110001101101101001, 61'b1000011101110101100100011011000011001101110011100111100111100, 61'b1000011100110001111001111101001111010101100001001110100010111, 61'b1000011011101110010111111100001101010111111001001000111101111, 61'b1000011010101010111110010110111001110010111010001111010010110, 61'b1000011001100111101101001100010001001100111111001000010101001, 61'b1000011000100100100100011011010000010100111101000101111000010, 61'b1000010111100001100100000010110100000010000011000001011110001, 61'b1000010110011110101100000001111001010011111000011001001110011, 61'b1000010101011011111100010111011101010010011100001100110110001, 61'b1000010100011001010101000010011101001110000011111010110000001, 61'b1000010011010110110110000001110110011111011010011101010100101, 61'b1000010010010100011111010100100110100111011111001000010010011, 61'b1000010001010010010000111001101011001111100100100110001111100, 61'b1000010000010000001010110000000010001001001111110110010011000
, 61'b1000001111001110001100110110101001001110010111001001110110001, 61'b1000001110001100010111001100011110100001000001000010011101111, 61'b1000001101001010101001110000100000001011100011001111111110000, 61'b1000001100001001000100100001101100100000100001101110100010100, 61'b1000001011000111100111011111000001111010101101100101000010101, 61'b1000001010000110010010100111011110111101000100000011011011100, 61'b1000001001000101000101111010000010010010101101100001010010111, 61'b1000001000000100000001010101101010101110111100011100100010111, 61'b1000000111000011000100111001010111001101001100011000001100101, 61'b1000000110000010010000100100000110110001000000111011010100000, 61'b1000000101000001100100010100111000100110000100110000000011001, 61'b1000000100000001000000001010101100000000001000100010110110000, 61'b1000000011000000100100000100100000011011000010000001101110100, 61'b1000000010000000010000000001010101011010101010111011101111101, 61'b1000000001000000000100000000001010101011000000000000100010001, 61'b1000000000000000000000000000000000000000000000000000000000000},
		table_one_out = wire_table_one_result,
		table_three_data = {42'b111111111000000000011111111000000000101010, 42'b111111110000000000011111110000000010001010, 42'b111111101000000000011111101000000100101010, 42'b111111100000000000011111100000001000001010, 42'b111111011000000000011111011000001100101010, 42'b111111010000000000011111010000010010001010, 42'b111111001000000000011111001000011000101010, 42'b111111000000000000011111000000100000001010, 42'b111110111000000000011110111000101000101010, 42'b111110110000000000011110110000110010001010, 42'b111110101000000000011110101000111100101001, 42'b111110100000000000011110100001001000001001, 42'b111110011000000000011110011001010100101001, 42'b111110010000000000011110010001100010001001, 42'b111110001000000000011110001001110000101001, 42'b111110000000000000011110000010000000001001, 42'b111101111000000000011101111010010000101001, 42'b111101110000000000011101110010100010001001, 42'b111101101000000000011101101010110100101001, 42'b111101100000000000011101100011001000001001, 42'b111101011000000000011101011011011100101001, 42'b111101010000000000011101010011110010001001, 42'b111101001000000000011101001100001000101001, 42'b111101000000000000011101000100100000001001, 42'b111100111000000000011100111100111000101001, 42'b111100110000000000011100110101010010001001, 42'b111100101000000000011100101101101100101001, 42'b111100100000000000011100100110001000001001, 42'b111100011000000000011100011110100100101000, 42'b111100010000000000011100010111000010001000, 42'b111100001000000000011100001111100000101000, 42'b111100000000000000011100001000000000001000, 42'b111011111000000000011100000000100000101000, 42'b111011110000000000011011111001000010001000, 42'b111011101000000000011011110001100100101000, 42'b111011100000000000011011101010001000001000, 42'b111011011000000000011011100010101100101000, 42'b111011010000000000011011011011010010001000, 42'b111011001000000000011011010011111000101000, 42'b111011000000000000011011001100100000001000, 42'b111010111000000000011011000101001000101000, 42'b111010110000000000011010111101110010001000, 42'b111010101000000000011010110110011100101000
, 42'b111010100000000000011010101111001000001000, 42'b111010011000000000011010100111110100101000, 42'b111010010000000000011010100000100010001000, 42'b111010001000000000011010011001010000100111, 42'b111010000000000000011010010010000000000111, 42'b111001111000000000011010001010110000100111, 42'b111001110000000000011010000011100010000111, 42'b111001101000000000011001111100010100100111, 42'b111001100000000000011001110101001000000111, 42'b111001011000000000011001101101111100100111, 42'b111001010000000000011001100110110010000111, 42'b111001001000000000011001011111101000100111, 42'b111001000000000000011001011000100000000111, 42'b111000111000000000011001010001011000100111, 42'b111000110000000000011001001010010010000111, 42'b111000101000000000011001000011001100100111, 42'b111000100000000000011000111100001000000111, 42'b111000011000000000011000110101000100100111, 42'b111000010000000000011000101110000010000111, 42'b111000001000000000011000100111000000100111, 42'b111000000000000000011000100000000000000111, 42'b110111111000000000011000011001000000100111, 42'b110111110000000000011000010010000010000111, 42'b110111101000000000011000001011000100100111, 42'b110111100000000000011000000100001000000110, 42'b110111011000000000010111111101001100100110, 42'b110111010000000000010111110110010010000110, 42'b110111001000000000010111101111011000100110, 42'b110111000000000000010111101000100000000110, 42'b110110111000000000010111100001101000100110, 42'b110110110000000000010111011010110010000110, 42'b110110101000000000010111010011111100100110, 42'b110110100000000000010111001101001000000110, 42'b110110011000000000010111000110010100100110, 42'b110110010000000000010110111111100010000110, 42'b110110001000000000010110111000110000100110, 42'b110110000000000000010110110010000000000110, 42'b110101111000000000010110101011010000100110, 42'b110101110000000000010110100100100010000110, 42'b110101101000000000010110011101110100100110, 42'b110101100000000000010110010111001000000110, 42'b110101011000000000010110010000011100100110, 42'b110101010000000000010110001001110010000110
, 42'b110101001000000000010110000011001000100110, 42'b110101000000000000010101111100100000000110, 42'b110100111000000000010101110101111000100110, 42'b110100110000000000010101101111010010000101, 42'b110100101000000000010101101000101100100101, 42'b110100100000000000010101100010001000000101, 42'b110100011000000000010101011011100100100101, 42'b110100010000000000010101010101000010000101, 42'b110100001000000000010101001110100000100101, 42'b110100000000000000010101001000000000000101, 42'b110011111000000000010101000001100000100101, 42'b110011110000000000010100111011000010000101, 42'b110011101000000000010100110100100100100101, 42'b110011100000000000010100101110001000000101, 42'b110011011000000000010100100111101100100101, 42'b110011010000000000010100100001010010000101, 42'b110011001000000000010100011010111000100101, 42'b110011000000000000010100010100100000000101, 42'b110010111000000000010100001110001000100101, 42'b110010110000000000010100000111110010000101, 42'b110010101000000000010100000001011100100101, 42'b110010100000000000010011111011001000000101, 42'b110010011000000000010011110100110100100101, 42'b110010010000000000010011101110100010000101, 42'b110010001000000000010011101000010000100101, 42'b110010000000000000010011100010000000000101, 42'b110001111000000000010011011011110000100101, 42'b110001110000000000010011010101100010000101, 42'b110001101000000000010011001111010100100100, 42'b110001100000000000010011001001001000000100, 42'b110001011000000000010011000010111100100100, 42'b110001010000000000010010111100110010000100, 42'b110001001000000000010010110110101000100100, 42'b110001000000000000010010110000100000000100, 42'b110000111000000000010010101010011000100100, 42'b110000110000000000010010100100010010000100, 42'b110000101000000000010010011110001100100100, 42'b110000100000000000010010011000001000000100, 42'b110000011000000000010010010010000100100100, 42'b110000010000000000010010001100000010000100, 42'b110000001000000000010010000110000000100100, 42'b110000000000000000010010000000000000000100, 42'b101111111000000000010001111010000000100100
, 42'b101111110000000000010001110100000010000100, 42'b101111101000000000010001101110000100100100, 42'b101111100000000000010001101000001000000100, 42'b101111011000000000010001100010001100100100, 42'b101111010000000000010001011100010010000100, 42'b101111001000000000010001010110011000100100, 42'b101111000000000000010001010000100000000100, 42'b101110111000000000010001001010101000100100, 42'b101110110000000000010001000100110010000100, 42'b101110101000000000010000111110111100100100, 42'b101110100000000000010000111001001000000100, 42'b101110011000000000010000110011010100100100, 42'b101110010000000000010000101101100010000100, 42'b101110001000000000010000100111110000100011, 42'b101110000000000000010000100010000000000011, 42'b101101111000000000010000011100010000100011, 42'b101101110000000000010000010110100010000011, 42'b101101101000000000010000010000110100100011, 42'b101101100000000000010000001011001000000011, 42'b101101011000000000010000000101011100100011, 42'b101101010000000000001111111111110010000011, 42'b101101001000000000001111111010001000100011, 42'b101101000000000000001111110100100000000011, 42'b101100111000000000001111101110111000100011, 42'b101100110000000000001111101001010010000011, 42'b101100101000000000001111100011101100100011, 42'b101100100000000000001111011110001000000011, 42'b101100011000000000001111011000100100100011, 42'b101100010000000000001111010011000010000011, 42'b101100001000000000001111001101100000100011, 42'b101100000000000000001111001000000000000011, 42'b101011111000000000001111000010100000100011, 42'b101011110000000000001110111101000010000011, 42'b101011101000000000001110110111100100100011, 42'b101011100000000000001110110010001000000011, 42'b101011011000000000001110101100101100100011, 42'b101011010000000000001110100111010010000011, 42'b101011001000000000001110100001111000100011, 42'b101011000000000000001110011100100000000011, 42'b101010111000000000001110010111001000100011, 42'b101010110000000000001110010001110010000011, 42'b101010101000000000001110001100011100100011, 42'b101010100000000000001110000111001000000011
, 42'b101010011000000000001110000001110100100011, 42'b101010010000000000001101111100100010000011, 42'b101010001000000000001101110111010000100011, 42'b101010000000000000001101110010000000000011, 42'b101001111000000000001101101100110000100010, 42'b101001110000000000001101100111100010000010, 42'b101001101000000000001101100010010100100010, 42'b101001100000000000001101011101001000000010, 42'b101001011000000000001101010111111100100010, 42'b101001010000000000001101010010110010000010, 42'b101001001000000000001101001101101000100010, 42'b101001000000000000001101001000100000000010, 42'b101000111000000000001101000011011000100010, 42'b101000110000000000001100111110010010000010, 42'b101000101000000000001100111001001100100010, 42'b101000100000000000001100110100001000000010, 42'b101000011000000000001100101111000100100010, 42'b101000010000000000001100101010000010000010, 42'b101000001000000000001100100101000000100010, 42'b101000000000000000001100100000000000000010, 42'b100111111000000000001100011011000000100010, 42'b100111110000000000001100010110000010000010, 42'b100111101000000000001100010001000100100010, 42'b100111100000000000001100001100001000000010, 42'b100111011000000000001100000111001100100010, 42'b100111010000000000001100000010010010000010, 42'b100111001000000000001011111101011000100010, 42'b100111000000000000001011111000100000000010, 42'b100110111000000000001011110011101000100010, 42'b100110110000000000001011101110110010000010, 42'b100110101000000000001011101001111100100010, 42'b100110100000000000001011100101001000000010, 42'b100110011000000000001011100000010100100010, 42'b100110010000000000001011011011100010000010, 42'b100110001000000000001011010110110000100010, 42'b100110000000000000001011010010000000000010, 42'b100101111000000000001011001101010000100010, 42'b100101110000000000001011001000100010000010, 42'b100101101000000000001011000011110100100010, 42'b100101100000000000001010111111001000000010, 42'b100101011000000000001010111010011100100010, 42'b100101010000000000001010110101110010000010, 42'b100101001000000000001010110001001000100010
, 42'b100101000000000000001010101100100000000010, 42'b100100111000000000001010100111111000100010, 42'b100100110000000000001010100011010010000010, 42'b100100101000000000001010011110101100100001, 42'b100100100000000000001010011010001000000001, 42'b100100011000000000001010010101100100100001, 42'b100100010000000000001010010001000010000001, 42'b100100001000000000001010001100100000100001, 42'b100100000000000000001010001000000000000001, 42'b100011111000000000001010000011100000100001, 42'b100011110000000000001001111111000010000001, 42'b100011101000000000001001111010100100100001, 42'b100011100000000000001001110110001000000001, 42'b100011011000000000001001110001101100100001, 42'b100011010000000000001001101101010010000001, 42'b100011001000000000001001101000111000100001, 42'b100011000000000000001001100100100000000001, 42'b100010111000000000001001100000001000100001, 42'b100010110000000000001001011011110010000001, 42'b100010101000000000001001010111011100100001, 42'b100010100000000000001001010011001000000001, 42'b100010011000000000001001001110110100100001, 42'b100010010000000000001001001010100010000001, 42'b100010001000000000001001000110010000100001, 42'b100010000000000000001001000010000000000001, 42'b100001111000000000001000111101110000100001, 42'b100001110000000000001000111001100010000001, 42'b100001101000000000001000110101010100100001, 42'b100001100000000000001000110001001000000001, 42'b100001011000000000001000101100111100100001, 42'b100001010000000000001000101000110010000001, 42'b100001001000000000001000100100101000100001, 42'b100001000000000000001000100000100000000001, 42'b100000111000000000001000011100011000100001, 42'b100000110000000000001000011000010010000001, 42'b100000101000000000001000010100001100100001, 42'b100000100000000000001000010000001000000001, 42'b100000011000000000001000001100000100100001, 42'b100000010000000000001000001000000010000001, 42'b100000001000000000001000000100000000100001, 42'b100000000000000000001000000000000000000001, 42'b011111111000000000000111111100000000100001, 42'b011111110000000000000111111000000010000001
, 42'b011111101000000000000111110100000100100001, 42'b011111100000000000000111110000001000000001, 42'b011111011000000000000111101100001100100001, 42'b011111010000000000000111101000010010000001, 42'b011111001000000000000111100100011000100001, 42'b011111000000000000000111100000100000000001, 42'b011110111000000000000111011100101000100001, 42'b011110110000000000000111011000110010000001, 42'b011110101000000000000111010100111100100001, 42'b011110100000000000000111010001001000000001, 42'b011110011000000000000111001101010100100001, 42'b011110010000000000000111001001100010000001, 42'b011110001000000000000111000101110000100001, 42'b011110000000000000000111000010000000000001, 42'b011101111000000000000110111110010000100001, 42'b011101110000000000000110111010100010000001, 42'b011101101000000000000110110110110100100001, 42'b011101100000000000000110110011001000000001, 42'b011101011000000000000110101111011100100001, 42'b011101010000000000000110101011110010000001, 42'b011101001000000000000110101000001000100001, 42'b011101000000000000000110100100100000000000, 42'b011100111000000000000110100000111000100000, 42'b011100110000000000000110011101010010000000, 42'b011100101000000000000110011001101100100000, 42'b011100100000000000000110010110001000000000, 42'b011100011000000000000110010010100100100000, 42'b011100010000000000000110001111000010000000, 42'b011100001000000000000110001011100000100000, 42'b011100000000000000000110001000000000000000, 42'b011011111000000000000110000100100000100000, 42'b011011110000000000000110000001000010000000, 42'b011011101000000000000101111101100100100000, 42'b011011100000000000000101111010001000000000, 42'b011011011000000000000101110110101100100000, 42'b011011010000000000000101110011010010000000, 42'b011011001000000000000101101111111000100000, 42'b011011000000000000000101101100100000000000, 42'b011010111000000000000101101001001000100000, 42'b011010110000000000000101100101110010000000, 42'b011010101000000000000101100010011100100000, 42'b011010100000000000000101011111001000000000, 42'b011010011000000000000101011011110100100000
, 42'b011010010000000000000101011000100010000000, 42'b011010001000000000000101010101010000100000, 42'b011010000000000000000101010010000000000000, 42'b011001111000000000000101001110110000100000, 42'b011001110000000000000101001011100010000000, 42'b011001101000000000000101001000010100100000, 42'b011001100000000000000101000101001000000000, 42'b011001011000000000000101000001111100100000, 42'b011001010000000000000100111110110010000000, 42'b011001001000000000000100111011101000100000, 42'b011001000000000000000100111000100000000000, 42'b011000111000000000000100110101011000100000, 42'b011000110000000000000100110010010010000000, 42'b011000101000000000000100101111001100100000, 42'b011000100000000000000100101100001000000000, 42'b011000011000000000000100101001000100100000, 42'b011000010000000000000100100110000010000000, 42'b011000001000000000000100100011000000100000, 42'b011000000000000000000100100000000000000000, 42'b010111111000000000000100011101000000100000, 42'b010111110000000000000100011010000010000000, 42'b010111101000000000000100010111000100100000, 42'b010111100000000000000100010100001000000000, 42'b010111011000000000000100010001001100100000, 42'b010111010000000000000100001110010010000000, 42'b010111001000000000000100001011011000100000, 42'b010111000000000000000100001000100000000000, 42'b010110111000000000000100000101101000100000, 42'b010110110000000000000100000010110010000000, 42'b010110101000000000000011111111111100100000, 42'b010110100000000000000011111101001000000000, 42'b010110011000000000000011111010010100100000, 42'b010110010000000000000011110111100010000000, 42'b010110001000000000000011110100110000100000, 42'b010110000000000000000011110010000000000000, 42'b010101111000000000000011101111010000100000, 42'b010101110000000000000011101100100010000000, 42'b010101101000000000000011101001110100100000, 42'b010101100000000000000011100111001000000000, 42'b010101011000000000000011100100011100100000, 42'b010101010000000000000011100001110010000000, 42'b010101001000000000000011011111001000100000, 42'b010101000000000000000011011100100000000000
, 42'b010100111000000000000011011001111000100000, 42'b010100110000000000000011010111010010000000, 42'b010100101000000000000011010100101100100000, 42'b010100100000000000000011010010001000000000, 42'b010100011000000000000011001111100100100000, 42'b010100010000000000000011001101000010000000, 42'b010100001000000000000011001010100000100000, 42'b010100000000000000000011001000000000000000, 42'b010011111000000000000011000101100000100000, 42'b010011110000000000000011000011000010000000, 42'b010011101000000000000011000000100100100000, 42'b010011100000000000000010111110001000000000, 42'b010011011000000000000010111011101100100000, 42'b010011010000000000000010111001010010000000, 42'b010011001000000000000010110110111000100000, 42'b010011000000000000000010110100100000000000, 42'b010010111000000000000010110010001000100000, 42'b010010110000000000000010101111110010000000, 42'b010010101000000000000010101101011100100000, 42'b010010100000000000000010101011001000000000, 42'b010010011000000000000010101000110100100000, 42'b010010010000000000000010100110100010000000, 42'b010010001000000000000010100100010000100000, 42'b010010000000000000000010100010000000000000, 42'b010001111000000000000010011111110000100000, 42'b010001110000000000000010011101100010000000, 42'b010001101000000000000010011011010100100000, 42'b010001100000000000000010011001001000000000, 42'b010001011000000000000010010110111100100000, 42'b010001010000000000000010010100110010000000, 42'b010001001000000000000010010010101000100000, 42'b010001000000000000000010010000100000000000, 42'b010000111000000000000010001110011000100000, 42'b010000110000000000000010001100010010000000, 42'b010000101000000000000010001010001100100000, 42'b010000100000000000000010001000001000000000, 42'b010000011000000000000010000110000100100000, 42'b010000010000000000000010000100000010000000, 42'b010000001000000000000010000010000000100000, 42'b010000000000000000000010000000000000000000, 42'b001111111000000000000001111110000000100000, 42'b001111110000000000000001111100000010000000, 42'b001111101000000000000001111010000100100000
, 42'b001111100000000000000001111000001000000000, 42'b001111011000000000000001110110001100100000, 42'b001111010000000000000001110100010010000000, 42'b001111001000000000000001110010011000100000, 42'b001111000000000000000001110000100000000000, 42'b001110111000000000000001101110101000100000, 42'b001110110000000000000001101100110010000000, 42'b001110101000000000000001101010111100100000, 42'b001110100000000000000001101001001000000000, 42'b001110011000000000000001100111010100100000, 42'b001110010000000000000001100101100010000000, 42'b001110001000000000000001100011110000100000, 42'b001110000000000000000001100010000000000000, 42'b001101111000000000000001100000010000100000, 42'b001101110000000000000001011110100010000000, 42'b001101101000000000000001011100110100100000, 42'b001101100000000000000001011011001000000000, 42'b001101011000000000000001011001011100100000, 42'b001101010000000000000001010111110010000000, 42'b001101001000000000000001010110001000100000, 42'b001101000000000000000001010100100000000000, 42'b001100111000000000000001010010111000100000, 42'b001100110000000000000001010001010010000000, 42'b001100101000000000000001001111101100100000, 42'b001100100000000000000001001110001000000000, 42'b001100011000000000000001001100100100100000, 42'b001100010000000000000001001011000010000000, 42'b001100001000000000000001001001100000100000, 42'b001100000000000000000001001000000000000000, 42'b001011111000000000000001000110100000100000, 42'b001011110000000000000001000101000010000000, 42'b001011101000000000000001000011100100100000, 42'b001011100000000000000001000010001000000000, 42'b001011011000000000000001000000101100100000, 42'b001011010000000000000000111111010010000000, 42'b001011001000000000000000111101111000100000, 42'b001011000000000000000000111100100000000000, 42'b001010111000000000000000111011001000100000, 42'b001010110000000000000000111001110010000000, 42'b001010101000000000000000111000011100100000, 42'b001010100000000000000000110111001000000000, 42'b001010011000000000000000110101110100100000, 42'b001010010000000000000000110100100010000000
, 42'b001010001000000000000000110011010000100000, 42'b001010000000000000000000110010000000000000, 42'b001001111000000000000000110000110000100000, 42'b001001110000000000000000101111100010000000, 42'b001001101000000000000000101110010100100000, 42'b001001100000000000000000101101001000000000, 42'b001001011000000000000000101011111100100000, 42'b001001010000000000000000101010110010000000, 42'b001001001000000000000000101001101000100000, 42'b001001000000000000000000101000100000000000, 42'b001000111000000000000000100111011000100000, 42'b001000110000000000000000100110010010000000, 42'b001000101000000000000000100101001100100000, 42'b001000100000000000000000100100001000000000, 42'b001000011000000000000000100011000100100000, 42'b001000010000000000000000100010000010000000, 42'b001000001000000000000000100001000000100000, 42'b001000000000000000000000100000000000000000, 42'b000111111000000000000000011111000000100000, 42'b000111110000000000000000011110000010000000, 42'b000111101000000000000000011101000100100000, 42'b000111100000000000000000011100001000000000, 42'b000111011000000000000000011011001100100000, 42'b000111010000000000000000011010010010000000, 42'b000111001000000000000000011001011000100000, 42'b000111000000000000000000011000100000000000, 42'b000110111000000000000000010111101000100000, 42'b000110110000000000000000010110110010000000, 42'b000110101000000000000000010101111100100000, 42'b000110100000000000000000010101001000000000, 42'b000110011000000000000000010100010100100000, 42'b000110010000000000000000010011100010000000, 42'b000110001000000000000000010010110000100000, 42'b000110000000000000000000010010000000000000, 42'b000101111000000000000000010001010000100000, 42'b000101110000000000000000010000100010000000, 42'b000101101000000000000000001111110100100000, 42'b000101100000000000000000001111001000000000, 42'b000101011000000000000000001110011100100000, 42'b000101010000000000000000001101110010000000, 42'b000101001000000000000000001101001000100000, 42'b000101000000000000000000001100100000000000, 42'b000100111000000000000000001011111000100000
, 42'b000100110000000000000000001011010010000000, 42'b000100101000000000000000001010101100100000, 42'b000100100000000000000000001010001000000000, 42'b000100011000000000000000001001100100100000, 42'b000100010000000000000000001001000010000000, 42'b000100001000000000000000001000100000100000, 42'b000100000000000000000000001000000000000000, 42'b000011111000000000000000000111100000100000, 42'b000011110000000000000000000111000010000000, 42'b000011101000000000000000000110100100100000, 42'b000011100000000000000000000110001000000000, 42'b000011011000000000000000000101101100100000, 42'b000011010000000000000000000101010010000000, 42'b000011001000000000000000000100111000100000, 42'b000011000000000000000000000100100000000000, 42'b000010111000000000000000000100001000100000, 42'b000010110000000000000000000011110010000000, 42'b000010101000000000000000000011011100100000, 42'b000010100000000000000000000011001000000000, 42'b000010011000000000000000000010110100100000, 42'b000010010000000000000000000010100010000000, 42'b000010001000000000000000000010010000100000, 42'b000010000000000000000000000010000000000000, 42'b000001111000000000000000000001110000100000, 42'b000001110000000000000000000001100010000000, 42'b000001101000000000000000000001010100100000, 42'b000001100000000000000000000001001000000000, 42'b000001011000000000000000000000111100100000, 42'b000001010000000000000000000000110010000000, 42'b000001001000000000000000000000101000100000, 42'b000001000000000000000000000000100000000000, 42'b000000111000000000000000000000011000100000, 42'b000000110000000000000000000000010010000000, 42'b000000101000000000000000000000001100100000, 42'b000000100000000000000000000000001000000000, 42'b000000011000000000000000000000000100100000, 42'b000000010000000000000000000000000010000000, 42'b000000001000000000000000000000000000100000, 42'b000000000000000000000000000000000000000000},
		table_three_out = {1'b1, 18'b000000000000000000, table_three_out_tmp},
		table_three_out_tmp = wire_table_three_result,
		table_two_data = {51'b111111111011111111001010101011000000010101110111110, 51'b111111110011111110001010110011000001101011001001011, 51'b111111101011111101001011000011000100000000001111000, 51'b111111100011111100001011011011000111010101000000101, 51'b111111011011111011001011111011001011101001010110001, 51'b111111010011111010001100100011010000111101000111101, 51'b111111001011111001001101010011010111010000001100111, 51'b111111000011111000001110001011011110100010011110001, 51'b111110111011110111001111001011100110110011110011010, 51'b111110110011110110010000010011110000000100000100010, 51'b111110101011110101010001100011111010010011001001001, 51'b111110100011110100010010111100000101100000111001110, 51'b111110011011110011010100011100010001101101001110010, 51'b111110010011110010010110000100011110110111111110101, 51'b111110001011110001010111110100101101000001000010101, 51'b111110000011110000011001101100111100001000010010100, 51'b111101111011101111011011101101001100001101100110001, 51'b111101110011101110011101110101011101010000110101011, 51'b111101101011101101100000000101101111010001111000100, 51'b111101100011101100100010011110000010010000100111010, 51'b111101011011101011100100111110010110001100111001110, 51'b111101010011101010100111100110101011000110100111111, 51'b111101001011101001101010010111000000111101101001110, 51'b111101000011101000101101001111010111110001110111010, 51'b111100111011100111110000001111101111100011001000011, 51'b111100110011100110110011011000001000010001010101000, 51'b111100101011100101110110101000100001111100010101011, 51'b111100100011100100111010000000111100100100000001011, 51'b111100011011100011111101100001011000001000010000111, 51'b111100010011100011000001001001110100101000111011111, 51'b111100001011100010000100111010010010000101111010100, 51'b111100000011100001001000110010110000011111000100101, 51'b111011111011100000001100110011001111110100010010011, 51'b111011110011011111010000111011110000000101011011100, 51'b111011101011011110010101001100010001010010011000001, 51'b111011100011011101011001100100110011011011000000010
, 51'b111011011011011100011110000101010110011111001011111, 51'b111011010011011011100010101101111010011110110010111, 51'b111011001011011010100111011110011111011001101101011, 51'b111011000011011001101100010111000101001111110011010, 51'b111010111011011000110001010111101100000000111100100, 51'b111010110011010111110110100000010011101101000001010, 51'b111010101011010110111011110000111100010011111001010, 51'b111010100011010110000001001001100101110101011100101, 51'b111010011011010101000110101010010000010001100011011, 51'b111010010011010100001100010010111011101000000101100, 51'b111010001011010011010010000011100111111000111010111, 51'b111010000011010010010111111100010101000011111011100, 51'b111001111011010001011101111101000011001000111111100, 51'b111001110011010000100100000101110010000111111110110, 51'b111001101011001111101010010110100010000000110001010, 51'b111001100011001110110000101111010010110011001111000, 51'b111001011011001101110111010000000100011111010000000, 51'b111001010011001100111101111000110111000100101100010, 51'b111001001011001100000100101001101010100011011011101, 51'b111001000011001011001011100010011110111011010110010, 51'b111000111011001010010010100011010100001100010100000, 51'b111000110011001001011001101100001010010110001101000, 51'b111000101011001000100000111101000001011000111001000, 51'b111000100011000111101000010101111001010100010000010, 51'b111000011011000110101111110110110010001000001010100, 51'b111000010011000101110111011111101011110100100000000, 51'b111000001011000100111111010000100110011001001000100, 51'b111000000011000100000111001001100001110101111100001, 51'b110111111011000011001111001010011110001010110010110, 51'b110111110011000010010111010011011011010111100100100, 51'b110111101011000001011111100100011001011100001001010, 51'b110111100011000000100111111101011000011000011001000, 51'b110111011010111111110000011110011000001100001011111, 51'b110111010010111110111001000111011000110111011001101, 51'b110111001010111110000001111000011010011001111010011, 51'b110111000010111101001010110001011100110011100110001
, 51'b110110111010111100010011110010100000000100010100110, 51'b110110110010111011011100111011100100001011111110100, 51'b110110101010111010100110001100101001001010011011000, 51'b110110100010111001101111100101101110111111100010100, 51'b110110011010111000111001000110110101101011001100111, 51'b110110010010111000000010101111111101001101010010001, 51'b110110001010110111001100100001000101100101101010010, 51'b110110000010110110010110011010001110110100001101010, 51'b110101111010110101100000011011011000111000110011001, 51'b110101110010110100101010100100100011110011010011111, 51'b110101101010110011110100110101101111100011100111011, 51'b110101100010110010111111001110111100001001100101101, 51'b110101011010110010001001110000001001100101000110110, 51'b110101010010110001010100011001010111110110000010110, 51'b110101001010110000011111001010100110111100010001011, 51'b110101000010101111101010000011110110110111101010111, 51'b110100111010101110110101000101000111101000000111000, 51'b110100110010101110000000001110011001001101011101111, 51'b110100101010101101001011011111101011100111100111100, 51'b110100100010101100010110111000111110110110011011111, 51'b110100011010101011100010011010010010111001110010111, 51'b110100010010101010101110000011100111110001100100101, 51'b110100001010101001111001110100111101011101101001000, 51'b110100000010101001000101101110010011111101111000000, 51'b110011111010101000010001101111101011010010001001110, 51'b110011110010100111011101111001000011011010010110000, 51'b110011101010100110101010001010011100010110010100111, 51'b110011100010100101110110100011110110000101111110100, 51'b110011011010100101000011000101010000101001001010100, 51'b110011010010100100001111101110101011111111110001010, 51'b110011001010100011011100100000001000001001101010100, 51'b110011000010100010101001011001100101000110101110011, 51'b110010111010100001110110011011000010110110110100101, 51'b110010110010100001000011100100100001011001110101101, 51'b110010101010100000010000110110000000101111101001000, 51'b110010100010011111011110001111100000111000000110111
, 51'b110010011010011110101011110001000001110011000111010, 51'b110010010010011101111001011010100011100000100010001, 51'b110010001010011101000111001100000110000000001111100, 51'b110010000010011100010101000101101001010010000111010, 51'b110001111010011011100011000111001101010110000001100, 51'b110001110010011010110001010000110010001011110110010, 51'b110001101010011001111111100010010111110011011101010, 51'b110001100010011001001101111011111110001100101110110, 51'b110001011010011000011100011101100101010111100010101, 51'b110001010010010111101011000111001101010011110001000, 51'b110001001010010110111001111000110110000001010001101, 51'b110001000010010110001000110010011111011111111100101, 51'b110000111010010101010111110100001001101111101001111, 51'b110000110010010100100110111101110100110000010001101, 51'b110000101010010011110110001111100000100001101011101, 51'b110000100010010011000101101001001101000011101111111, 51'b110000011010010010010101001010111010010110010110100, 51'b110000010010010001100100110100101000011001010111011, 51'b110000001010010000110100100110010111001100101010101, 51'b110000000010010000000100100000000110110000001000000, 51'b101111111010001111010100100001110111000011100111110, 51'b101111110010001110100100101011101000000111000001101, 51'b101111101010001101110100111101011001111010001101110, 51'b101111100010001101000101010111001100011101000100001, 51'b101111011010001100010101111000111111101111011100110, 51'b101111010010001011100110100010110011110001001111100, 51'b101111001010001010110111010100101000100010010100100, 51'b101111000010001010001000001110011110000010100011101, 51'b101110111010001001011001010000010100010001110100111, 51'b101110110010001000101010011010001011010000000000010, 51'b101110101010000111111011101100000010111100111101111, 51'b101110100010000111001101000101111011011000100101100, 51'b101110011010000110011110100111110100100010101111010, 51'b101110010010000101110000010001101110011011010011010, 51'b101110001010000101000010000011101001000010001001001, 51'b101110000010000100010011111101100100010111001001010
, 51'b101101111010000011100101111111100000011010001011011, 51'b101101110010000010111000001001011101001011000111100, 51'b101101101010000010001010011011011010101001110101110, 51'b101101100010000001011100110101011000110110001110000, 51'b101101011010000000101111010111010111110000001000011, 51'b101101010010000000000010000001010111010111011100101, 51'b101101001001111111010100110011010111101100000010111, 51'b101101000001111110100111101101011000101101110011010, 51'b101100111001111101111010101111011010011100100101100, 51'b101100110001111101001101111001011100111000010001110, 51'b101100101001111100100001001011100000000000101111111, 51'b101100100001111011110100100101100011110101111000000, 51'b101100011001111011001000000111101000010111100010001, 51'b101100010001111010011011110001101101100101100110001, 51'b101100001001111001101111100011110011011111111100000, 51'b101100000001111001000011011101111010000110011011111, 51'b101011111001111000010111100000000001011000111101100, 51'b101011110001110111101011101010001001010111011001001, 51'b101011101001110110111111111100010010000001100110101, 51'b101011100001110110010100010110011011010111011101111, 51'b101011011001110101101000111000100101011000110111000, 51'b101011010001110100111101100010110000000101101010000, 51'b101011001001110100010010010100111011011101101110111, 51'b101011000001110011100111001111000111100000111101100, 51'b101010111001110010111100010001010100001111001110000, 51'b101010110001110010010001011011100001101000011000010, 51'b101010101001110001100110101101101111101100010100010, 51'b101010100001110000111100000111111110011010111010001, 51'b101010011001110000010001101010001101110100000001101, 51'b101010010001101111100111010100011101110111100011000, 51'b101010001001101110111101000110101110100101010110000, 51'b101010000001101110010011000000111111111101010010111, 51'b101001111001101101101001000011010001111111010001011, 51'b101001110001101100111111001101100100101011001001101, 51'b101001101001101100010101011111111000000000110011100, 51'b101001100001101011101011111010001100000000000111010
, 51'b101001011001101011000010011100100000101000111100100, 51'b101001010001101010011001000110110101111011001011100, 51'b101001001001101001101111111001001011110110101100001, 51'b101001000001101001000110110011100010011011010110100, 51'b101000111001101000011101110101111001101001000010011, 51'b101000110001100111110101000000010001011111101000000, 51'b101000101001100111001100010010101001111110111111010, 51'b101000100001100110100011101101000011000111000000000, 51'b101000011001100101111011001111011100110111100010011, 51'b101000010001100101010010111001110111010000011110011, 51'b101000001001100100101010101100010010010001101100000, 51'b101000000001100100000010100110101101111011000011010, 51'b100111111001100011011010101001001010001100011011111, 51'b100111110001100010110010110011100111000101101110010, 51'b100111101001100010001011000110000100100110110010000, 51'b100111100001100001100011100000100010101111011111011, 51'b100111011001100000111100000011000001011111101110010, 51'b100111010001100000010100101101100000110111010110101, 51'b100111001001011111101101100000000000110110010000101, 51'b100111000001011111000110011010100001011100010100000, 51'b100110111001011110011111011101000010101001011000111, 51'b100110110001011101111000100111100100011101010111010, 51'b100110101001011101010001111010000110111000000111000, 51'b100110100001011100101011010100101001111001100000011, 51'b100110011001011100000100110111001101100001011011001, 51'b100110010001011011011110100001110001101111101111010, 51'b100110001001011010111000010100010110100100010100111, 51'b100110000001011010010010001110111011111111000011111, 51'b100101111001011001101100010001100001111111110100010, 51'b100101110001011001000110011100001000100110011110001, 51'b100101101001011000100000101110101111110010111001011, 51'b100101100001010111111011001001010111100100111110000, 51'b100101011001010111010101101011111111111100100100000, 51'b100101010001010110110000010110101000111001100011010, 51'b100101001001010110001011001001010010011011110100000, 51'b100101000001010101100110000011111100100011001110001
, 51'b100100111001010101000001000110100111001111101001100, 51'b100100110001010100011100010001010010100000111110001, 51'b100100101001010011110111100011111110010111000100010, 51'b100100100001010011010010111110101010110001110011100, 51'b100100011001010010101110100001010111110001000100010, 51'b100100010001010010001010001100000101010100101110001, 51'b100100001001010001100101111110110011011100101001011, 51'b100100000001010001000001111001100010001000101101111, 51'b100011111001010000011101111100010001011000110011101, 51'b100011110001001111111010000111000001001100110010101, 51'b100011101001001111010110011001110001100100100010111, 51'b100011100001001110110010110100100010011111111100011, 51'b100011011001001110001111010111010011111110110111001, 51'b100011010001001101101100000010000110000001001011001, 51'b100011001001001101001000110100111000100110110000010, 51'b100011000001001100100101101111101011101111011110110, 51'b100010111001001100000010110010011111011011001110010, 51'b100010110001001011011111111101010011101001110111000, 51'b100010101001001010111101010000001000011011010001000, 51'b100010100001001010011010101010111101101111010100001, 51'b100010011001001001111000001101110011100101111000011, 51'b100010010001001001010101111000101001111110110101111, 51'b100010001001001000110011101011100000111010000100011, 51'b100010000001001000010001100110011000010111011100001, 51'b100001111001000111101111101001010000010110110101000, 51'b100001110001000111001101110100001000111000000111000, 51'b100001101001000110101100000111000001111011001010000, 51'b100001100001000110001010100001111011011111110110010, 51'b100001011001000101101001000100110101100110000011100, 51'b100001010001000101000111101111110000001101101001111, 51'b100001001001000100100110100010101011010110100001011, 51'b100001000001000100000101011101100111000000100001111, 51'b100000111001000011100100100000100011001011100011100, 51'b100000110001000011000011101011011111110111011110001, 51'b100000101001000010100010111110011101000100001001110, 51'b100000100001000010000010011001011010110001011110100
, 51'b100000011001000001100001111100011000111111010100010, 51'b100000010001000001000001100111010111101101100011000, 51'b100000001001000000100001011010010110111100000010111, 51'b100000000001000000000001010101010110101010101011101, 51'b011111111000111111100001011000010110111001010101100, 51'b011111110000111111000001100011010111100111111000010, 51'b011111101000111110100001110110011000110110001100001, 51'b011111100000111110000010010001011010100100001000111, 51'b011111011000111101100010110100011100110001100110101, 51'b011111010000111101000011011111011111011110011101010, 51'b011111001000111100100100010010100010101010100100111, 51'b011111000000111100000101001101100110010101110101100, 51'b011110111000111011100110010000101010100000000111000, 51'b011110110000111011000111011011101111001001010001100, 51'b011110101000111010101000101110110100010001001100111, 51'b011110100000111010001010001001111001110111110001010, 51'b011110011000111001101011101100111111111100110110011, 51'b011110010000111001001101011000000110100000010100100, 51'b011110001000111000101111001011001101100010000011100, 51'b011110000000111000010001000110010101000001111011100, 51'b011101111000110111110011001001011100111111110100010, 51'b011101110000110111010101010100100101011011100101111, 51'b011101101000110110110111100111101110010101001000011, 51'b011101100000110110011010000010110111101100010011110, 51'b011101011000110101111100100110000001100001000000000, 51'b011101010000110101011111010001001011110011000101000, 51'b011101001000110101000010000100010110100010011011000, 51'b011101000000110100100100111111100001101110111001101, 51'b011100111000110100001000000010101101011000011001010, 51'b011100110000110011101011001101111001011110110001101, 51'b011100101000110011001110100001000110000001111010110, 51'b011100100000110010110001111100010011000001101100110, 51'b011100011000110010010101011111100000011101111111100, 51'b011100010000110001111001001010101110010110101011000, 51'b011100001000110001011100111101111100101011100111011, 51'b011100000000110001000000111001001011011100101100100
, 51'b011011111000110000100100111100011010101001110010011, 51'b011011110000110000001001000111101010010010110001000, 51'b011011101000101111101101011010111010010111100000011, 51'b011011100000101111010001110110001010110111111000100, 51'b011011011000101110110110011001011011110011110001011, 51'b011011010000101110011011000100101101001011000011000, 51'b011011001000101101111111110111111110111101100101010, 51'b011011000000101101100100110011010001001011010000011, 51'b011010111000101101001001110110100011110011111100001, 51'b011010110000101100101111000001110110110111100000100, 51'b011010101000101100010100010101001010010101110101101, 51'b011010100000101011111001110000011110001110110011100, 51'b011010011000101011011111010011110010100010010010001, 51'b011010010000101011000100111111000111010000001001010, 51'b011010001000101010101010110010011100011000010001001, 51'b011010000000101010010000101101110001111010100001110, 51'b011001111000101001110110110001000111110110110011000, 51'b011001110000101001011100111100011110001100111100111, 51'b011001101000101001000011001111110100111100110111011, 51'b011001100000101000101001101011001100000110011010100, 51'b011001011000101000010000001110100011101001011110010, 51'b011001010000100111110110111001111011100101111010110, 51'b011001001000100111011101101101010011111011100111110, 51'b011001000000100111000100101000101100101010011101011, 51'b011000111000100110101011101100000101110010010011110, 51'b011000110000100110010010110111011111010011000010101, 51'b011000101000100101111010001010111001001100100010000, 51'b011000100000100101100001100110010011011110101010001, 51'b011000011000100101001001001001101110001001010010110, 51'b011000010000100100110000110101001001001100010100000, 51'b011000001000100100011000101000100100100111100101111, 51'b011000000000100100000000100100000000011011000000010, 51'b010111111000100011101000100111011100100110011011001, 51'b010111110000100011010000110010111001001001101110101, 51'b010111101000100010111001000110010110000100110010101, 51'b010111100000100010100001100001110011010111011111010
, 51'b010111011000100010001010000101010001000001101100011, 51'b010111010000100001110010110000101111000011010010001, 51'b010111001000100001011011100100001101011100001000010, 51'b010111000000100001000100011111101100001100000111000, 51'b010110111000100000101101100011001011010011000110010, 51'b010110110000100000010110101110101010110000111110000, 51'b010110101000100000000000000010001010100101100110010, 51'b010110100000011111101001011101101010110000110111000, 51'b010110011000011111010011000001001011010010101000010, 51'b010110010000011110111100101100101100001010110010000, 51'b010110001000011110100110100000001101011001001100001, 51'b010110000000011110010000011011101110111101101110111, 51'b010101111000011101111010011111010000111000010010000, 51'b010101110000011101100100101010110011001000101101101, 51'b010101101000011101001110111110010101101110111001110, 51'b010101100000011100111001011001111000101010101110010, 51'b010101011000011100100011111101011011111100000011011, 51'b010101010000011100001110101000111111100010110000110, 51'b010101001000011011111001011100100011011110101110101, 51'b010101000000011011100100011000000111101111110101000, 51'b010100111000011011001111011011101100010101111011110, 51'b010100110000011010111010100111010001010000111010111, 51'b010100101000011010100101111010110110100000101010100, 51'b010100100000011010010001010110011100000101000010101, 51'b010100011000011001111100111010000001111101111011000, 51'b010100010000011001101000100101101000001011001011111, 51'b010100001000011001010100011001001110101100101101001, 51'b010100000000011001000000010100110101100010010110110, 51'b010011111000011000101100011000011100101100000000110, 51'b010011110000011000011000100100000100001001100011001, 51'b010011101000011000000100110111101011111010110101111, 51'b010011100000010111110001010011010011111111110001001, 51'b010011011000010111011101110110111100011000001100101, 51'b010011010000010111001010100010100101000100000000100, 51'b010011001000010110110111010110001110000011000100111, 51'b010011000000010110100100010001110111010101010001100
, 51'b010010111000010110010001010101100000111010011110011, 51'b010010110000010101111110100001001010110010100011110, 51'b010010101000010101101011110100110100111101011001011, 51'b010010100000010101011001010000011111011010110111011, 51'b010010011000010101000110110100001010001010110101110, 51'b010010010000010100110100011111110101001101001100011, 51'b010010001000010100100010010011100000100001110011011, 51'b010010000000010100010000001111001100001000100010110, 51'b010001111000010011111110010010111000000001010010011, 51'b010001110000010011101100011110100100001011111010011, 51'b010001101000010011011010110010010000101000010010101, 51'b010001100000010011001001001101111101010110010011001, 51'b010001011000010010110111110001101010010101110100000, 51'b010001010000010010100110011101010111100110101101001, 51'b010001001000010010010101010001000101001000110110101, 51'b010001000000010010000100001100110010111100001000011, 51'b010000111000010001110011010000100001000000011010011, 51'b010000110000010001100010011100001111010101100100101, 51'b010000101000010001010001101111111101111011011111001, 51'b010000100000010001000001001011101100110010000010000, 51'b010000011000010000110000101111011011111001000101001, 51'b010000010000010000100000011011001011010000100000100, 51'b010000001000010000010000001110111010111000001100001, 51'b010000000000010000000000001010101010110000000000000, 51'b001111111000001111110000001110011010110111110100001, 51'b001111110000001111100000011010001011001111100000100, 51'b001111101000001111010000101101111011110110111101001, 51'b001111100000001111000001001001101100101110000001111, 51'b001111011000001110110001101101011101110100100111000, 51'b001111010000001110100010011001001111001010100100011, 51'b001111001000001110010011001101000000101111110001111, 51'b001111000000001110000100001000110010100100000111101, 51'b001110111000001101110101001100100100100111011101101, 51'b001110110000001101100110011000010110111001101011111, 51'b001110101000001101010111101100001001011010101010010, 51'b001110100000001101001001000111111100001010010000111
, 51'b001110011000001100111010101011101111001000010111110, 51'b001110010000001100101100010111100010010100110110110, 51'b001110001000001100011110001011010101101111100110000, 51'b001110000000001100010000000111001001011000011101011, 51'b001101111000001100000010001010111101001111010101000, 51'b001101110000001011110100010110110001010100000100110, 51'b001101101000001011100110101010100101100110100100110, 51'b001101100000001011011001000110011010000110101101000, 51'b001101011000001011001011101010001110110100010101010, 51'b001101010000001010111110010110000011101111010101111, 51'b001101001000001010110001001001111000110111100110100, 51'b001101000000001010100100000101101110001100111111011, 51'b001100111000001010010111001001100011101111011000011, 51'b001100110000001010001010010101011001011110101001101, 51'b001100101000001001111101101001001111011010101010111, 51'b001100100000001001110001000101000101100011010100011, 51'b001100011000001001100100101000111011111000011110001, 51'b001100010000001001011000010100110010011001111111111, 51'b001100001000001001001100001000101001000111110001111, 51'b001100000000001001000000000100100000000001101100000, 51'b001011111000001000110100001000010111000111100110001, 51'b001011110000001000101000010100001110011001011000100, 51'b001011101000001000011100101000000101110110111011001, 51'b001011100000001000010001000011111101100000000101110, 51'b001011011000001000000101100111110101010100110000100, 51'b001011010000000111111010010011101101010100110011011, 51'b001011001000000111101111000111100101100000000110011, 51'b001011000000000111100100000011011101110110100001100, 51'b001010111000000111011001000111010110010111111100110, 51'b001010110000000111001110010011001111000100010000001, 51'b001010101000000111000011100111000111111011010011101, 51'b001010100000000110111001000011000000111100111111010, 51'b001010011000000110101110100110111010001001001011000, 51'b001010010000000110100100010010110011011111101110110, 51'b001010001000000110011010000110101101000000100010101, 51'b001010000000000110010000000010100110101011011110110
, 51'b001001111000000110000110000110100000100000011010110, 51'b001001110000000101111100010010011010011111001111000, 51'b001001101000000101110010100110010100100111110011010, 51'b001001100000000101101001000010001110111001111111110, 51'b001001011000000101011111100110001001010101101100001, 51'b001001010000000101010110010010000011111010110000110, 51'b001001001000000101001101000101111110101001000101011, 51'b001001000000000101000100000001111001100000100010001, 51'b001000111000000100111011000101110100100000111110111, 51'b001000110000000100110010010001101111101010010011110, 51'b001000101000000100101001100101101010111100011000110, 51'b001000100000000100100001000001100110010111000101110, 51'b001000011000000100011000100101100001111010010010111, 51'b001000010000000100010000010001011101100101111000001, 51'b001000001000000100001000000101011001011001101101010, 51'b001000000000000100000000000001010101010101101010101, 51'b000111111000000011111000000101010001011001101000000, 51'b000111110000000011110000010001001101100101011101011, 51'b000111101000000011101000100101001001111001000010111, 51'b000111100000000011100001000001000110010100010000011, 51'b000111011000000011011001100101000010110110111110000, 51'b000111010000000011010010010000111111100001000011101, 51'b000111001000000011001011000100111100010010011001011, 51'b000111000000000011000100000000111001001010110111001, 51'b000110111000000010111101000100110110001010010100111, 51'b000110110000000010110110010000110011010000101010110, 51'b000110101000000010101111100100110000011101110000101, 51'b000110100000000010101001000000101101110001011110101, 51'b000110011000000010100010100100101011001011101100100, 51'b000110010000000010011100010000101000101100010010100, 51'b000110001000000010010110000100100110010011001000101, 51'b000110000000000010010000000000100100000000000110101, 51'b000101111000000010001010000100100001110011000100110, 51'b000101110000000010000100010000011111101011111011000, 51'b000101101000000001111110100100011101101010100001001, 51'b000101100000000001111001000000011011101110101111011
, 51'b000101011000000001110011100100011001111000011101101, 51'b000101010000000001101110010000011000000111100011111, 51'b000101001000000001101001000100010110011011111010010, 51'b000101000000000001100100000000010100110101011000100, 51'b000100111000000001011111000100010011010011110110111, 51'b000100110000000001011010010000010001110111001101010, 51'b000100101000000001010101100100010000011111010011101, 51'b000100100000000001010001000000001111001100000010001, 51'b000100011000000001001100100100001101111101010000100, 51'b000100010000000001001000010000001100110010110111000, 51'b000100001000000001000100000100001011101100101101100, 51'b000100000000000001000000000000001010101010101011111, 51'b000011111000000000111100000100001001101100101010100, 51'b000011110000000000111000010000001000110010100001000, 51'b000011101000000000110100100100000111111100000111100, 51'b000011100000000000110001000000000111001001010110000, 51'b000011011000000000101101100100000110011010000100101, 51'b000011010000000000101010010000000101101110001011001, 51'b000011001000000000100111000100000101000101100001110, 51'b000011000000000000100100000000000100100000000000011, 51'b000010111000000000100001000100000011111101011111000, 51'b000010110000000000011110010000000011011101110101101, 51'b000010101000000000011011100100000011000000111100001, 51'b000010100000000000011001000000000010100110101010110, 51'b000010011000000000010110100100000010001110111001011, 51'b000010010000000000010100010000000001111001100000001, 51'b000010001000000000010010000100000001100110010110110, 51'b000010000000000000010000000000000001010101010101011, 51'b000001111000000000001110000100000001000110010100000, 51'b000001110000000000001100010000000000111001001010101, 51'b000001101000000000001010100100000000101101110001010, 51'b000001100000000000001001000000000000100100000000000, 51'b000001011000000000000111100100000000011011101110101, 51'b000001010000000000000110010000000000010100110101010, 51'b000001001000000000000101000100000000001111001100000, 51'b000001000000000000000100000000000000001010101010101
, 51'b000000111000000000000011000100000000000111001001010, 51'b000000110000000000000010010000000000000100100000000, 51'b000000101000000000000001100100000000000010100110101, 51'b000000100000000000000001000000000000000001010101010, 51'b000000011000000000000000100100000000000000100011111, 51'b000000010000000000000000010000000000000000001010101, 51'b000000001000000000000000000100000000000000000001010, 51'b000000000000000000000000000000000000000000000000000},
		table_two_out = {1'b1, 9'b000000000, table_two_out_tmp},
		table_two_out_tmp = wire_table_two_result,
		tbl1_compare_wi = wire_tbl1_compare_ageb,
		tbl1_compare_wo = tbl1_compare_dffe11_10_pipes9[0:0],
		tbl1_tbl2_prod_wi = wire_tbl1_tbl2_prod_result[121:62],
		tbl1_tbl2_prod_wo = tbl1_tbl2_prod_dffe12,
		tbl3_taylor_prod_wi = wire_tbl3_taylor_prod_result[119:60],
		tbl3_taylor_prod_wo = tbl3_taylor_prod_dffe12,
		underflow_compare_val_w = 11'b00000111010,
		underflow_w = (((((result_underflow_w | barrel_shifter_underflow) | (sign_dffe23[0:0] & (distance_overflow | (~ wire_exp_value_add_bias_result[11])))) & (~ input_is_zero_wo)) & (~ input_is_infinity_wo)) & (~ input_is_nan_wo)),
		x_fixed = wire_rbarrel_shift_result,
		xf = wire_xf_muxa_dataout,
		xf_pre = wire_x_fixed_minus_xiln2_result,
		xf_pre_2_wi = xf_pre_wo,
		xf_pre_2_wo = xf_pre_2_dffe10,
		xf_pre_wi = xf_pre,
		xf_pre_wo = xf_pre_dffe9,
		xi_exp_value = xi_prod_wo[24:14],
		xi_exp_value_wi = xi_exp_value,
		xi_exp_value_wo = xi_exp_value_dffe4,
		xi_ln2_prod_wi = wire_xi_ln2_prod_result,
		xi_ln2_prod_wo = xi_ln2_prod_dffe7,
		xi_prod_wi = wire_xi_prod_result,
		xi_prod_wo = xi_prod_dffe3;
endmodule