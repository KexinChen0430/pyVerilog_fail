module  fp_exp_altfp_exp_5fc
	(
	clock,
	data,
	result) ;
	input   clock;
	input   [31:0]  data;
	output   [31:0]  result;
	reg	[0:0]	barrel_shifter_underflow_dffe2_15_pipes0;
	reg	[0:0]	barrel_shifter_underflow_dffe2_15_pipes1;
	reg	[0:0]	barrel_shifter_underflow_dffe2_15_pipes2;
	reg	[0:0]	barrel_shifter_underflow_dffe2_15_pipes3;
	reg	[0:0]	barrel_shifter_underflow_dffe2_15_pipes4;
	reg	[0:0]	barrel_shifter_underflow_dffe2_15_pipes5;
	reg	[0:0]	barrel_shifter_underflow_dffe2_15_pipes6;
	reg	[0:0]	barrel_shifter_underflow_dffe2_15_pipes7;
	reg	[0:0]	barrel_shifter_underflow_dffe2_15_pipes8;
	reg	[0:0]	barrel_shifter_underflow_dffe2_15_pipes9;
	reg	[0:0]	barrel_shifter_underflow_dffe2_15_pipes10;
	reg	[0:0]	barrel_shifter_underflow_dffe2_15_pipes11;
	reg	[0:0]	barrel_shifter_underflow_dffe2_15_pipes12;
	reg	[0:0]	barrel_shifter_underflow_dffe2_15_pipes13;
	reg	[0:0]	barrel_shifter_underflow_dffe2_15_pipes14;
	reg	[0:0]	distance_overflow_dffe2_15_pipes0;
	reg	[0:0]	distance_overflow_dffe2_15_pipes1;
	reg	[0:0]	distance_overflow_dffe2_15_pipes2;
	reg	[0:0]	distance_overflow_dffe2_15_pipes3;
	reg	[0:0]	distance_overflow_dffe2_15_pipes4;
	reg	[0:0]	distance_overflow_dffe2_15_pipes5;
	reg	[0:0]	distance_overflow_dffe2_15_pipes6;
	reg	[0:0]	distance_overflow_dffe2_15_pipes7;
	reg	[0:0]	distance_overflow_dffe2_15_pipes8;
	reg	[0:0]	distance_overflow_dffe2_15_pipes9;
	reg	[0:0]	distance_overflow_dffe2_15_pipes10;
	reg	[0:0]	distance_overflow_dffe2_15_pipes11;
	reg	[0:0]	distance_overflow_dffe2_15_pipes12;
	reg	[0:0]	distance_overflow_dffe2_15_pipes13;
	reg	[0:0]	distance_overflow_dffe2_15_pipes14;
	reg	[7:0]	exp_value_b4_bias_dffe_0;
	reg	[7:0]	exp_value_b4_bias_dffe_1;
	reg	[7:0]	exp_value_b4_bias_dffe_10;
	reg	[7:0]	exp_value_b4_bias_dffe_2;
	reg	[7:0]	exp_value_b4_bias_dffe_3;
	reg	[7:0]	exp_value_b4_bias_dffe_4;
	reg	[7:0]	exp_value_b4_bias_dffe_5;
	reg	[7:0]	exp_value_b4_bias_dffe_6;
	reg	[7:0]	exp_value_b4_bias_dffe_7;
	reg	[7:0]	exp_value_b4_bias_dffe_8;
	reg	[7:0]	exp_value_b4_bias_dffe_9;
	reg	[8:0]	exp_value_dffe1;
	reg	extra_ln2_dffe_0;
	reg	extra_ln2_dffe_1;
	reg	extra_ln2_dffe_2;
	reg	extra_ln2_dffe_3;
	reg	extra_ln2_dffe_4;
	reg	extra_ln2_dffe_5;
	reg	[22:0]	fraction_dffe1;
	reg	[0:0]	input_is_infinity_16_pipes0;
	reg	[0:0]	input_is_infinity_16_pipes1;
	reg	[0:0]	input_is_infinity_16_pipes2;
	reg	[0:0]	input_is_infinity_16_pipes3;
	reg	[0:0]	input_is_infinity_16_pipes4;
	reg	[0:0]	input_is_infinity_16_pipes5;
	reg	[0:0]	input_is_infinity_16_pipes6;
	reg	[0:0]	input_is_infinity_16_pipes7;
	reg	[0:0]	input_is_infinity_16_pipes8;
	reg	[0:0]	input_is_infinity_16_pipes9;
	reg	[0:0]	input_is_infinity_16_pipes10;
	reg	[0:0]	input_is_infinity_16_pipes11;
	reg	[0:0]	input_is_infinity_16_pipes12;
	reg	[0:0]	input_is_infinity_16_pipes13;
	reg	[0:0]	input_is_infinity_16_pipes14;
	reg	[0:0]	input_is_infinity_16_pipes15;
	reg	[0:0]	input_is_nan_16_pipes0;
	reg	[0:0]	input_is_nan_16_pipes1;
	reg	[0:0]	input_is_nan_16_pipes2;
	reg	[0:0]	input_is_nan_16_pipes3;
	reg	[0:0]	input_is_nan_16_pipes4;
	reg	[0:0]	input_is_nan_16_pipes5;
	reg	[0:0]	input_is_nan_16_pipes6;
	reg	[0:0]	input_is_nan_16_pipes7;
	reg	[0:0]	input_is_nan_16_pipes8;
	reg	[0:0]	input_is_nan_16_pipes9;
	reg	[0:0]	input_is_nan_16_pipes10;
	reg	[0:0]	input_is_nan_16_pipes11;
	reg	[0:0]	input_is_nan_16_pipes12;
	reg	[0:0]	input_is_nan_16_pipes13;
	reg	[0:0]	input_is_nan_16_pipes14;
	reg	[0:0]	input_is_nan_16_pipes15;
	reg	[0:0]	input_is_zero_16_pipes0;
	reg	[0:0]	input_is_zero_16_pipes1;
	reg	[0:0]	input_is_zero_16_pipes2;
	reg	[0:0]	input_is_zero_16_pipes3;
	reg	[0:0]	input_is_zero_16_pipes4;
	reg	[0:0]	input_is_zero_16_pipes5;
	reg	[0:0]	input_is_zero_16_pipes6;
	reg	[0:0]	input_is_zero_16_pipes7;
	reg	[0:0]	input_is_zero_16_pipes8;
	reg	[0:0]	input_is_zero_16_pipes9;
	reg	[0:0]	input_is_zero_16_pipes10;
	reg	[0:0]	input_is_zero_16_pipes11;
	reg	[0:0]	input_is_zero_16_pipes12;
	reg	[0:0]	input_is_zero_16_pipes13;
	reg	[0:0]	input_is_zero_16_pipes14;
	reg	[0:0]	input_is_zero_16_pipes15;
	reg	man_overflow_dffe15;
	reg	[61:0]	man_prod_dffe14;
	reg	[22:0]	man_round_dffe15;
	reg	[30:0]	result_pipe_dffe16;
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
	reg	[0:0]	tbl1_compare_dffe11_4_pipes0;
	reg	[0:0]	tbl1_compare_dffe11_4_pipes1;
	reg	[0:0]	tbl1_compare_dffe11_4_pipes2;
	reg	[0:0]	tbl1_compare_dffe11_4_pipes3;
	reg	[30:0]	tbl1_tbl2_prod_dffe12;
	reg	[30:0]	tbl3_taylor_prod_dffe12;
	reg	[37:0]	x_fixed_dffe_0;
	reg	[37:0]	x_fixed_dffe_1;
	reg	[37:0]	x_fixed_dffe_2;
	reg	[37:0]	x_fixed_dffe_3;
	reg	[37:0]	x_fixed_dffe_4;
	reg	[37:0]	xf_pre_2_dffe10;
	reg	[37:0]	xf_pre_dffe9;
	reg	[7:0]	xi_exp_value_dffe4;
	reg	[45:0]	xi_ln2_prod_dffe7;
	reg	[20:0]	xi_prod_dffe3;
	wire  [8:0]   wire_exp_minus_bias_result;
	wire  [8:0]   wire_exp_value_add_bias_result;
	wire  [8:0]   wire_exp_value_man_over_result;
	wire  [7:0]   wire_invert_exp_value_result;
	wire  [22:0]   wire_man_round_result;
	wire  [30:0]   wire_one_minus_xf_result;
	wire  [37:0]   wire_x_fixed_minus_xiln2_result;
	wire  [30:0]   wire_xf_minus_ln2_result;
	wire  [7:0]   wire_xi_add_one_result;
	wire  [37:0]   wire_rbarrel_shift_result;
	wire  wire_distance_overflow_comp_agb;
	wire  wire_tbl1_compare_ageb;
	wire  wire_underflow_compare_agb;
	wire  [61:0]   wire_man_prod_result;
	wire  [63:0]   wire_tbl1_tbl2_prod_result;
	wire  [61:0]   wire_tbl3_taylor_prod_result;
	wire  [45:0]   wire_xi_ln2_prod_result;
	wire  [20:0]   wire_xi_prod_result;
	wire  [31:0]   wire_table_one_result;
	wire  [20:0]   wire_table_three_result;
	wire  [25:0]   wire_table_two_result;
	wire	wire_cin_to_bias_dataout;
	wire	[7:0]wire_exp_result_mux_prea_dataout;
	wire	[7:0]wire_exp_value_b4_biasa_dataout;
	wire	[5:0]wire_exp_value_selecta_dataout;
	wire	[7:0]wire_exp_value_to_compare_muxa_dataout;
	wire	[7:0]wire_exp_value_to_ln2a_dataout;
	wire	[30:0]wire_extra_ln2_muxa_dataout;
	wire	[22:0]wire_man_result_muxa_dataout;
	wire	[30:0]wire_xf_muxa_dataout;
	wire aclr;
	wire  [4:0]  addr_val_more_than_one;
	wire  [37:0]  barrel_shifter_data;
	wire  [5:0]  barrel_shifter_distance;
	wire  barrel_shifter_underflow;
	wire  barrel_shifter_underflow_wi;
	wire clk_en;
	wire  distance_overflow;
	wire  [7:0]  distance_overflow_val_w;
	wire  distance_overflow_wi;
	wire  [7:0]  exp_bias;
	wire  [7:0]  exp_bias_all_ones_w;
	wire  [7:0]  exp_data_all_one_w;
	wire  [7:0]  exp_data_not_zero_w;
	wire  [7:0]  exp_invert;
	wire  [7:0]  exp_one;
	wire  [7:0]  exp_out_all_one_w;
	wire  [7:0]  exp_out_not_zero_w;
	wire  [7:0]  exp_result_out;
	wire  [7:0]  exp_result_w;
	wire  [8:0]  exp_value;
	wire  [8:0]  exp_value_wi;
	wire  [8:0]  exp_value_wo;
	wire  [7:0]  exp_w;
	wire  extra_ln2;
	wire  [22:0]  fraction;
	wire  [22:0]  fraction_wi;
	wire  [22:0]  fraction_wo;
	wire  gnd_w;
	wire  guard_bit;
	wire  input_is_infinity_wi;
	wire  input_is_infinity_wo;
	wire  input_is_nan_wi;
	wire  input_is_nan_wo;
	wire  input_is_zero_wi;
	wire  input_is_zero_wo;
	wire  [37:0]  ln2_w;
	wire  [22:0]  man_data_not_zero_w;
	wire  man_overflow;
	wire  man_overflow_wi;
	wire  man_overflow_wo;
	wire  [61:0]  man_prod_result;
	wire  [61:0]  man_prod_shifted;
	wire  [61:0]  man_prod_wi;
	wire  [61:0]  man_prod_wire;
	wire  [61:0]  man_prod_wo;
	wire  [22:0]  man_result_all_ones;
	wire  [22:0]  man_result_w;
	wire  [22:0]  man_round_wi;
	wire  [22:0]  man_round_wo;
	wire  nan_w;
	wire  negative_infinity;
	wire  [8:0]  one_over_ln2_w;
	wire  overflow_w;
	wire  positive_infinity;
	wire  [30:0]  result_pipe_wi;
	wire  [30:0]  result_pipe_wo;
	wire  result_underflow_w;
	wire  round_bit;
	wire  round_up;
	wire  round_up_wi;
	wire  round_up_wo;
	wire  shifted_value;
	wire  sign_w;
	wire  [4:0]  sticky_bits;
	wire  [1023:0]  table_one_data;
	wire  [31:0]  table_one_out;
	wire  [671:0]  table_three_data;
	wire  [31:0]  table_three_out;
	wire  [20:0]  table_three_out_tmp;
	wire  [831:0]  table_two_data;
	wire  [31:0]  table_two_out;
	wire  [25:0]  table_two_out_tmp;
	wire  tbl1_compare_wi;
	wire  tbl1_compare_wo;
	wire  [30:0]  tbl1_tbl2_prod_wi;
	wire  [30:0]  tbl1_tbl2_prod_wo;
	wire  [30:0]  tbl3_taylor_prod_wi;
	wire  [30:0]  tbl3_taylor_prod_wo;
	wire  [7:0]  underflow_compare_val_w;
	wire  underflow_w;
	wire  [37:0]  x_fixed;
	wire  [30:0]  xf;
	wire  [37:0]  xf_pre;
	wire  [37:0]  xf_pre_2_wi;
	wire  [37:0]  xf_pre_2_wo;
	wire  [37:0]  xf_pre_wi;
	wire  [37:0]  xf_pre_wo;
	wire  [7:0]  xi_exp_value;
	wire  [7:0]  xi_exp_value_wi;
	wire  [7:0]  xi_exp_value_wo;
	wire  [45:0]  xi_ln2_prod_wi;
	wire  [45:0]  xi_ln2_prod_wo;
	wire  [20:0]  xi_prod_wi;
	wire  [20:0]  xi_prod_wo;
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_15_pipes0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_15_pipes0 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_15_pipes0 <= barrel_shifter_underflow_wi;
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_15_pipes1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_15_pipes1 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_15_pipes1 <= barrel_shifter_underflow_dffe2_15_pipes0[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_15_pipes2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_15_pipes2 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_15_pipes2 <= barrel_shifter_underflow_dffe2_15_pipes1[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_15_pipes3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_15_pipes3 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_15_pipes3 <= barrel_shifter_underflow_dffe2_15_pipes2[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_15_pipes4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_15_pipes4 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_15_pipes4 <= barrel_shifter_underflow_dffe2_15_pipes3[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_15_pipes5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_15_pipes5 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_15_pipes5 <= barrel_shifter_underflow_dffe2_15_pipes4[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_15_pipes6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_15_pipes6 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_15_pipes6 <= barrel_shifter_underflow_dffe2_15_pipes5[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_15_pipes7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_15_pipes7 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_15_pipes7 <= barrel_shifter_underflow_dffe2_15_pipes6[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_15_pipes8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_15_pipes8 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_15_pipes8 <= barrel_shifter_underflow_dffe2_15_pipes7[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_15_pipes9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_15_pipes9 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_15_pipes9 <= barrel_shifter_underflow_dffe2_15_pipes8[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_15_pipes10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_15_pipes10 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_15_pipes10 <= barrel_shifter_underflow_dffe2_15_pipes9[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_15_pipes11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_15_pipes11 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_15_pipes11 <= barrel_shifter_underflow_dffe2_15_pipes10[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_15_pipes12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_15_pipes12 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_15_pipes12 <= barrel_shifter_underflow_dffe2_15_pipes11[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_15_pipes13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_15_pipes13 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_15_pipes13 <= barrel_shifter_underflow_dffe2_15_pipes12[0:0];
	// synopsys translate_off
	initial
		barrel_shifter_underflow_dffe2_15_pipes14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_shifter_underflow_dffe2_15_pipes14 <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_shifter_underflow_dffe2_15_pipes14 <= barrel_shifter_underflow_dffe2_15_pipes13[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_15_pipes0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_15_pipes0 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_15_pipes0 <= distance_overflow_wi;
	// synopsys translate_off
	initial
		distance_overflow_dffe2_15_pipes1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_15_pipes1 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_15_pipes1 <= distance_overflow_dffe2_15_pipes0[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_15_pipes2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_15_pipes2 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_15_pipes2 <= distance_overflow_dffe2_15_pipes1[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_15_pipes3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_15_pipes3 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_15_pipes3 <= distance_overflow_dffe2_15_pipes2[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_15_pipes4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_15_pipes4 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_15_pipes4 <= distance_overflow_dffe2_15_pipes3[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_15_pipes5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_15_pipes5 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_15_pipes5 <= distance_overflow_dffe2_15_pipes4[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_15_pipes6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_15_pipes6 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_15_pipes6 <= distance_overflow_dffe2_15_pipes5[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_15_pipes7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_15_pipes7 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_15_pipes7 <= distance_overflow_dffe2_15_pipes6[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_15_pipes8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_15_pipes8 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_15_pipes8 <= distance_overflow_dffe2_15_pipes7[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_15_pipes9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_15_pipes9 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_15_pipes9 <= distance_overflow_dffe2_15_pipes8[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_15_pipes10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_15_pipes10 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_15_pipes10 <= distance_overflow_dffe2_15_pipes9[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_15_pipes11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_15_pipes11 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_15_pipes11 <= distance_overflow_dffe2_15_pipes10[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_15_pipes12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_15_pipes12 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_15_pipes12 <= distance_overflow_dffe2_15_pipes11[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_15_pipes13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_15_pipes13 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_15_pipes13 <= distance_overflow_dffe2_15_pipes12[0:0];
	// synopsys translate_off
	initial
		distance_overflow_dffe2_15_pipes14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) distance_overflow_dffe2_15_pipes14 <= 1'b0;
		else if  (clk_en == 1'b1)   distance_overflow_dffe2_15_pipes14 <= distance_overflow_dffe2_15_pipes13[0:0];
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_0 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_0 <= wire_exp_value_b4_biasa_dataout;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_1 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_1 <= exp_value_b4_bias_dffe_0;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_10 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_10 <= exp_value_b4_bias_dffe_9;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_2 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_2 <= exp_value_b4_bias_dffe_1;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_3 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_3 <= exp_value_b4_bias_dffe_2;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_4 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_4 <= exp_value_b4_bias_dffe_3;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_5 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_5 <= exp_value_b4_bias_dffe_4;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_6 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_6 <= exp_value_b4_bias_dffe_5;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_7 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_7 <= exp_value_b4_bias_dffe_6;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_8 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_8 <= exp_value_b4_bias_dffe_7;
	// synopsys translate_off
	initial
		exp_value_b4_bias_dffe_9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_b4_bias_dffe_9 <= 8'b0;
		else if  (clk_en == 1'b1)   exp_value_b4_bias_dffe_9 <= exp_value_b4_bias_dffe_8;
	// synopsys translate_off
	initial
		exp_value_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_value_dffe1 <= 9'b0;
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
		fraction_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) fraction_dffe1 <= 23'b0;
		else if  (clk_en == 1'b1)   fraction_dffe1 <= fraction_wi;
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes0 <= input_is_infinity_wi;
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes1 <= input_is_infinity_16_pipes0[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes2 <= input_is_infinity_16_pipes1[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes3 <= input_is_infinity_16_pipes2[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes4 <= input_is_infinity_16_pipes3[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes5 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes5 <= input_is_infinity_16_pipes4[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes6 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes6 <= input_is_infinity_16_pipes5[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes7 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes7 <= input_is_infinity_16_pipes6[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes8 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes8 <= input_is_infinity_16_pipes7[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes9 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes9 <= input_is_infinity_16_pipes8[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes10 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes10 <= input_is_infinity_16_pipes9[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes11 <= input_is_infinity_16_pipes10[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes12 <= input_is_infinity_16_pipes11[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes13 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes13 <= input_is_infinity_16_pipes12[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes14 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes14 <= input_is_infinity_16_pipes13[0:0];
	// synopsys translate_off
	initial
		input_is_infinity_16_pipes15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_16_pipes15 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_16_pipes15 <= input_is_infinity_16_pipes14[0:0];
	// synopsys translate_off
	initial
		input_is_nan_16_pipes0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes0 <= input_is_nan_wi;
	// synopsys translate_off
	initial
		input_is_nan_16_pipes1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes1 <= input_is_nan_16_pipes0[0:0];
	// synopsys translate_off
	initial
		input_is_nan_16_pipes2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes2 <= input_is_nan_16_pipes1[0:0];
	// synopsys translate_off
	initial
		input_is_nan_16_pipes3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes3 <= input_is_nan_16_pipes2[0:0];
	// synopsys translate_off
	initial
		input_is_nan_16_pipes4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes4 <= input_is_nan_16_pipes3[0:0];
	// synopsys translate_off
	initial
		input_is_nan_16_pipes5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes5 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes5 <= input_is_nan_16_pipes4[0:0];
	// synopsys translate_off
	initial
		input_is_nan_16_pipes6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes6 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes6 <= input_is_nan_16_pipes5[0:0];
	// synopsys translate_off
	initial
		input_is_nan_16_pipes7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes7 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes7 <= input_is_nan_16_pipes6[0:0];
	// synopsys translate_off
	initial
		input_is_nan_16_pipes8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes8 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes8 <= input_is_nan_16_pipes7[0:0];
	// synopsys translate_off
	initial
		input_is_nan_16_pipes9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes9 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes9 <= input_is_nan_16_pipes8[0:0];
	// synopsys translate_off
	initial
		input_is_nan_16_pipes10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes10 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes10 <= input_is_nan_16_pipes9[0:0];
	// synopsys translate_off
	initial
		input_is_nan_16_pipes11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes11 <= input_is_nan_16_pipes10[0:0];
	// synopsys translate_off
	initial
		input_is_nan_16_pipes12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes12 <= input_is_nan_16_pipes11[0:0];
	// synopsys translate_off
	initial
		input_is_nan_16_pipes13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes13 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes13 <= input_is_nan_16_pipes12[0:0];
	// synopsys translate_off
	initial
		input_is_nan_16_pipes14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes14 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes14 <= input_is_nan_16_pipes13[0:0];
	// synopsys translate_off
	initial
		input_is_nan_16_pipes15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_16_pipes15 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_16_pipes15 <= input_is_nan_16_pipes14[0:0];
	// synopsys translate_off
	initial
		input_is_zero_16_pipes0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes0 <= input_is_zero_wi;
	// synopsys translate_off
	initial
		input_is_zero_16_pipes1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes1 <= input_is_zero_16_pipes0[0:0];
	// synopsys translate_off
	initial
		input_is_zero_16_pipes2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes2 <= input_is_zero_16_pipes1[0:0];
	// synopsys translate_off
	initial
		input_is_zero_16_pipes3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes3 <= input_is_zero_16_pipes2[0:0];
	// synopsys translate_off
	initial
		input_is_zero_16_pipes4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes4 <= input_is_zero_16_pipes3[0:0];
	// synopsys translate_off
	initial
		input_is_zero_16_pipes5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes5 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes5 <= input_is_zero_16_pipes4[0:0];
	// synopsys translate_off
	initial
		input_is_zero_16_pipes6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes6 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes6 <= input_is_zero_16_pipes5[0:0];
	// synopsys translate_off
	initial
		input_is_zero_16_pipes7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes7 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes7 <= input_is_zero_16_pipes6[0:0];
	// synopsys translate_off
	initial
		input_is_zero_16_pipes8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes8 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes8 <= input_is_zero_16_pipes7[0:0];
	// synopsys translate_off
	initial
		input_is_zero_16_pipes9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes9 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes9 <= input_is_zero_16_pipes8[0:0];
	// synopsys translate_off
	initial
		input_is_zero_16_pipes10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes10 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes10 <= input_is_zero_16_pipes9[0:0];
	// synopsys translate_off
	initial
		input_is_zero_16_pipes11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes11 <= input_is_zero_16_pipes10[0:0];
	// synopsys translate_off
	initial
		input_is_zero_16_pipes12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes12 <= input_is_zero_16_pipes11[0:0];
	// synopsys translate_off
	initial
		input_is_zero_16_pipes13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes13 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes13 <= input_is_zero_16_pipes12[0:0];
	// synopsys translate_off
	initial
		input_is_zero_16_pipes14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes14 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes14 <= input_is_zero_16_pipes13[0:0];
	// synopsys translate_off
	initial
		input_is_zero_16_pipes15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_zero_16_pipes15 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_zero_16_pipes15 <= input_is_zero_16_pipes14[0:0];
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
		if (aclr == 1'b1) man_prod_dffe14 <= 62'b0;
		else if  (clk_en == 1'b1)   man_prod_dffe14 <= man_prod_wi;
	// synopsys translate_off
	initial
		man_round_dffe15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_round_dffe15 <= 23'b0;
		else if  (clk_en == 1'b1)   man_round_dffe15 <= man_round_wi;
	// synopsys translate_off
	initial
		result_pipe_dffe16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) result_pipe_dffe16 <= 31'b0;
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
		tbl1_compare_dffe11_4_pipes0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_compare_dffe11_4_pipes0 <= 1'b0;
		else if  (clk_en == 1'b1)   tbl1_compare_dffe11_4_pipes0 <= tbl1_compare_wi;
	// synopsys translate_off
	initial
		tbl1_compare_dffe11_4_pipes1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_compare_dffe11_4_pipes1 <= 1'b0;
		else if  (clk_en == 1'b1)   tbl1_compare_dffe11_4_pipes1 <= tbl1_compare_dffe11_4_pipes0[0:0];
	// synopsys translate_off
	initial
		tbl1_compare_dffe11_4_pipes2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_compare_dffe11_4_pipes2 <= 1'b0;
		else if  (clk_en == 1'b1)   tbl1_compare_dffe11_4_pipes2 <= tbl1_compare_dffe11_4_pipes1[0:0];
	// synopsys translate_off
	initial
		tbl1_compare_dffe11_4_pipes3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_compare_dffe11_4_pipes3 <= 1'b0;
		else if  (clk_en == 1'b1)   tbl1_compare_dffe11_4_pipes3 <= tbl1_compare_dffe11_4_pipes2[0:0];
	// synopsys translate_off
	initial
		tbl1_tbl2_prod_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl1_tbl2_prod_dffe12 <= 31'b0;
		else if  (clk_en == 1'b1)   tbl1_tbl2_prod_dffe12 <= tbl1_tbl2_prod_wi;
	// synopsys translate_off
	initial
		tbl3_taylor_prod_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tbl3_taylor_prod_dffe12 <= 31'b0;
		else if  (clk_en == 1'b1)   tbl3_taylor_prod_dffe12 <= tbl3_taylor_prod_wi;
	// synopsys translate_off
	initial
		x_fixed_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) x_fixed_dffe_0 <= 38'b0;
		else if  (clk_en == 1'b1)   x_fixed_dffe_0 <= x_fixed;
	// synopsys translate_off
	initial
		x_fixed_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) x_fixed_dffe_1 <= 38'b0;
		else if  (clk_en == 1'b1)   x_fixed_dffe_1 <= x_fixed_dffe_0;
	// synopsys translate_off
	initial
		x_fixed_dffe_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) x_fixed_dffe_2 <= 38'b0;
		else if  (clk_en == 1'b1)   x_fixed_dffe_2 <= x_fixed_dffe_1;
	// synopsys translate_off
	initial
		x_fixed_dffe_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) x_fixed_dffe_3 <= 38'b0;
		else if  (clk_en == 1'b1)   x_fixed_dffe_3 <= x_fixed_dffe_2;
	// synopsys translate_off
	initial
		x_fixed_dffe_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) x_fixed_dffe_4 <= 38'b0;
		else if  (clk_en == 1'b1)   x_fixed_dffe_4 <= x_fixed_dffe_3;
	// synopsys translate_off
	initial
		xf_pre_2_dffe10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) xf_pre_2_dffe10 <= 38'b0;
		else if  (clk_en == 1'b1)   xf_pre_2_dffe10 <= xf_pre_2_wi;
	// synopsys translate_off
	initial
		xf_pre_dffe9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) xf_pre_dffe9 <= 38'b0;
		else if  (clk_en == 1'b1)   xf_pre_dffe9 <= xf_pre_wi;
	// synopsys translate_off
	initial
		xi_exp_value_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) xi_exp_value_dffe4 <= 8'b0;
		else if  (clk_en == 1'b1)   xi_exp_value_dffe4 <= xi_exp_value_wi;
	// synopsys translate_off
	initial
		xi_ln2_prod_dffe7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) xi_ln2_prod_dffe7 <= 46'b0;
		else if  (clk_en == 1'b1)   xi_ln2_prod_dffe7 <= xi_ln2_prod_wi;
	// synopsys translate_off
	initial
		xi_prod_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) xi_prod_dffe3 <= 21'b0;
		else if  (clk_en == 1'b1)   xi_prod_dffe3 <= xi_prod_wi;
	lpm_add_sub   exp_minus_bias
	(
	.cout(),
	.dataa({1'b0, exp_w}),
	.datab({1'b0, exp_bias}),
	.overflow(),
	.result(wire_exp_minus_bias_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		exp_minus_bias.lpm_direction = "SUB",
		exp_minus_bias.lpm_representation = "SIGNED",
		exp_minus_bias.lpm_width = 9,
		exp_minus_bias.lpm_type = "lpm_add_sub";
	lpm_add_sub   exp_value_add_bias
	(
	.aclr(aclr),
	.cin(wire_cin_to_bias_dataout),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa({1'b0, exp_value_b4_bias_dffe_10}),
	.datab({1'b0, exp_bias[7:1], (~ extra_ln2_dffe_5)}),
	.overflow(),
	.result(wire_exp_value_add_bias_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		exp_value_add_bias.lpm_direction = "ADD",
		exp_value_add_bias.lpm_pipeline = 1,
		exp_value_add_bias.lpm_representation = "SIGNED",
		exp_value_add_bias.lpm_width = 9,
		exp_value_add_bias.lpm_type = "lpm_add_sub";
	lpm_add_sub   exp_value_man_over
	(
	.cout(),
	.dataa(wire_exp_value_add_bias_result),
	.datab({{8{1'b0}}, man_overflow_wo}),
	.overflow(),
	.result(wire_exp_value_man_over_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		exp_value_man_over.lpm_direction = "ADD",
		exp_value_man_over.lpm_representation = "SIGNED",
		exp_value_man_over.lpm_width = 9,
		exp_value_man_over.lpm_type = "lpm_add_sub";
	lpm_add_sub   invert_exp_value
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa({8{1'b0}}),
	.datab(exp_value[7:0]),
	.overflow(),
	.result(wire_invert_exp_value_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		invert_exp_value.lpm_direction = "SUB",
		invert_exp_value.lpm_pipeline = 1,
		invert_exp_value.lpm_representation = "SIGNED",
		invert_exp_value.lpm_width = 8,
		invert_exp_value.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_round
	(
	.cout(),
	.dataa(man_round_wo),
	.datab({{22{1'b0}}, round_up_wo}),
	.overflow(),
	.result(wire_man_round_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		man_round.lpm_direction = "ADD",
		man_round.lpm_representation = "SIGNED",
		man_round.lpm_width = 23,
		man_round.lpm_type = "lpm_add_sub";
	lpm_add_sub   one_minus_xf
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa({1'b1, {30{1'b0}}}),
	.datab(wire_extra_ln2_muxa_dataout),
	.overflow(),
	.result(wire_one_minus_xf_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		one_minus_xf.lpm_direction = "SUB",
		one_minus_xf.lpm_pipeline = 1,
		one_minus_xf.lpm_representation = "SIGNED",
		one_minus_xf.lpm_width = 31,
		one_minus_xf.lpm_type = "lpm_add_sub";
	lpm_add_sub   x_fixed_minus_xiln2
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(x_fixed_dffe_4),
	.datab({1'b0, xi_ln2_prod_wo[45:9]}),
	.overflow(),
	.result(wire_x_fixed_minus_xiln2_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		x_fixed_minus_xiln2.lpm_direction = "SUB",
		x_fixed_minus_xiln2.lpm_pipeline = 1,
		x_fixed_minus_xiln2.lpm_representation = "SIGNED",
		x_fixed_minus_xiln2.lpm_width = 38,
		x_fixed_minus_xiln2.lpm_type = "lpm_add_sub";
	lpm_add_sub   xf_minus_ln2
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(xf_pre[30:0]),
	.datab({{2{1'b0}}, ln2_w[37:9]}),
	.overflow(),
	.result(wire_xf_minus_ln2_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		xf_minus_ln2.lpm_direction = "SUB",
		xf_minus_ln2.lpm_pipeline = 1,
		xf_minus_ln2.lpm_representation = "SIGNED",
		xf_minus_ln2.lpm_width = 31,
		xf_minus_ln2.lpm_type = "lpm_add_sub";
	lpm_add_sub   xi_add_one
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(xi_exp_value),
	.datab(8'b00000001),
	.overflow(),
	.result(wire_xi_add_one_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1),
	.cin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		xi_add_one.lpm_direction = "ADD",
		xi_add_one.lpm_pipeline = 1,
		xi_add_one.lpm_representation = "SIGNED",
		xi_add_one.lpm_width = 8,
		xi_add_one.lpm_type = "lpm_add_sub";
	lpm_clshift   rbarrel_shift
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.data(barrel_shifter_data),
	.direction(exp_value_wo[8]),
	.distance(barrel_shifter_distance),
	.overflow(),
	.result(wire_rbarrel_shift_result),
	.underflow());
	defparam
		rbarrel_shift.lpm_pipeline = 2,
		rbarrel_shift.lpm_shifttype = "LOGICAL",
		rbarrel_shift.lpm_width = 38,
		rbarrel_shift.lpm_widthdist = 6,
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
		distance_overflow_comp.lpm_representation = "UNSIGNED",
		distance_overflow_comp.lpm_width = 8,
		distance_overflow_comp.lpm_type = "lpm_compare";
	lpm_compare   tbl1_compare
	(
	.aeb(),
	.agb(),
	.ageb(wire_tbl1_compare_ageb),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(xf[28:24]),
	.datab(addr_val_more_than_one)
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
		tbl1_compare.lpm_representation = "UNSIGNED",
		tbl1_compare.lpm_width = 5,
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
		underflow_compare.lpm_representation = "UNSIGNED",
		underflow_compare.lpm_width = 8,
		underflow_compare.lpm_type = "lpm_compare";
	lpm_mult   man_prod
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(tbl1_tbl2_prod_wo),
	.datab(tbl3_taylor_prod_wo),
	.result(wire_man_prod_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		man_prod.lpm_pipeline = 1,
		man_prod.lpm_representation = "UNSIGNED",
		man_prod.lpm_widtha = 31,
		man_prod.lpm_widthb = 31,
		man_prod.lpm_widthp = 62,
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
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		tbl1_tbl2_prod.lpm_pipeline = 1,
		tbl1_tbl2_prod.lpm_representation = "UNSIGNED",
		tbl1_tbl2_prod.lpm_widtha = 32,
		tbl1_tbl2_prod.lpm_widthb = 32,
		tbl1_tbl2_prod.lpm_widthp = 64,
		tbl1_tbl2_prod.lpm_type = "lpm_mult",
		tbl1_tbl2_prod.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mult   tbl3_taylor_prod
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(table_three_out),
	.datab({1'b1, {15{1'b0}}, xf[13:0]}),
	.result(wire_tbl3_taylor_prod_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		tbl3_taylor_prod.lpm_pipeline = 1,
		tbl3_taylor_prod.lpm_representation = "UNSIGNED",
		tbl3_taylor_prod.lpm_widtha = 32,
		tbl3_taylor_prod.lpm_widthb = 30,
		tbl3_taylor_prod.lpm_widthp = 62,
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
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		xi_ln2_prod.lpm_pipeline = 2,
		xi_ln2_prod.lpm_representation = "UNSIGNED",
		xi_ln2_prod.lpm_widtha = 8,
		xi_ln2_prod.lpm_widthb = 38,
		xi_ln2_prod.lpm_widthp = 46,
		xi_ln2_prod.lpm_type = "lpm_mult",
		xi_ln2_prod.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mult   xi_prod
	(
	.dataa(x_fixed[37:26]),
	.datab(one_over_ln2_w),
	.result(wire_xi_prod_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0),
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		xi_prod.lpm_representation = "UNSIGNED",
		xi_prod.lpm_widtha = 12,
		xi_prod.lpm_widthb = 9,
		xi_prod.lpm_widthp = 21,
		xi_prod.lpm_type = "lpm_mult",
		xi_prod.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	lpm_mux   table_one
	(
	.data(table_one_data),
	.result(wire_table_one_result),
	.sel(xf[28:24])
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
		table_one.lpm_size = 32,
		table_one.lpm_width = 32,
		table_one.lpm_widths = 5,
		table_one.lpm_type = "lpm_mux";
	lpm_mux   table_three
	(
	.data(table_three_data),
	.result(wire_table_three_result),
	.sel(xf[18:14])
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
		table_three.lpm_size = 32,
		table_three.lpm_width = 21,
		table_three.lpm_widths = 5,
		table_three.lpm_type = "lpm_mux";
	lpm_mux   table_two
	(
	.data(table_two_data),
	.result(wire_table_two_result),
	.sel(xf[23:19])
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
		table_two.lpm_size = 32,
		table_two.lpm_width = 26,
		table_two.lpm_widths = 5,
		table_two.lpm_type = "lpm_mux";
	assign
		wire_cin_to_bias_dataout = shifted_value;
	assign		wire_exp_result_mux_prea_dataout = (((((barrel_shifter_underflow | overflow_w) | input_is_zero_wo) | nan_w) | positive_infinity) === 1'b1) ? exp_one : exp_result_w;
	assign		wire_exp_value_b4_biasa_dataout = (sign_dffe3[0:0] === 1'b1) ? exp_invert : xi_exp_value;
	assign		wire_exp_value_selecta_dataout = (exp_value_wo[8] === 1'b1) ? wire_invert_exp_value_result[5:0] : exp_value_wo[5:0];
	assign		wire_exp_value_to_compare_muxa_dataout = (exp_value_wo[8] === 1'b1) ? wire_invert_exp_value_result : exp_value_wo[7:0];
	assign		wire_exp_value_to_ln2a_dataout = (sign_dffe4[0:0] === 1'b1) ? wire_xi_add_one_result : xi_exp_value_wo;
	assign		wire_extra_ln2_muxa_dataout = (extra_ln2_dffe_0 === 1'b1) ? wire_xf_minus_ln2_result : xf_pre_wo[30:0];
	assign		wire_man_result_muxa_dataout = (((((overflow_w | underflow_w) | nan_w) | input_is_zero_wo) | input_is_infinity_wo) === 1'b1) ? {nan_w, {22{1'b0}}} : wire_man_round_result;
	assign		wire_xf_muxa_dataout = (sign_dffe10[0:0] === 1'b1) ? wire_one_minus_xf_result : xf_pre_2_wo[30:0];
	assign
		aclr = 1'b0,
		addr_val_more_than_one = 5'b10111,
		barrel_shifter_data = {{8{1'b0}}, 1'b1, fraction_wo, {6{1'b0}}},
		barrel_shifter_distance = wire_exp_value_selecta_dataout,
		barrel_shifter_underflow = barrel_shifter_underflow_dffe2_15_pipes14[0:0],
		barrel_shifter_underflow_wi = (wire_underflow_compare_agb & exp_value_wo[8]),
		clk_en = 1'b1,
		distance_overflow = distance_overflow_dffe2_15_pipes14[0:0],
		distance_overflow_val_w = 8'b00000110,
		distance_overflow_wi = (wire_distance_overflow_comp_agb & (~ exp_value_wo[8])),
		exp_bias = 8'b01111111,
		exp_bias_all_ones_w = {8{1'b1}},
		exp_data_all_one_w = {(data[30] & exp_data_all_one_w[6]), (data[29] & exp_data_all_one_w[5]), (data[28] & exp_data_all_one_w[4]), (data[27] & exp_data_all_one_w[3]), (data[26] & exp_data_all_one_w[2]), (data[25] & exp_data_all_one_w[1]), (data[24] & exp_data_all_one_w[0]), data[23]},
		exp_data_not_zero_w = {(data[30] | exp_data_not_zero_w[6]), (data[29] | exp_data_not_zero_w[5]), (data[28] | exp_data_not_zero_w[4]), (data[27] | exp_data_not_zero_w[3]), (data[26] | exp_data_not_zero_w[2]), (data[25] | exp_data_not_zero_w[1]), (data[24] | exp_data_not_zero_w[0]), data[23]},
		exp_invert = (xi_exp_value ^ exp_bias_all_ones_w),
		exp_one = {((overflow_w | nan_w) | positive_infinity), {7{1'b1}}},
		exp_out_all_one_w = {(exp_result_w[7] & exp_out_all_one_w[6]), (exp_result_w[6] & exp_out_all_one_w[5]), (exp_result_w[5] & exp_out_all_one_w[4]), (exp_result_w[4] & exp_out_all_one_w[3]), (exp_result_w[3] & exp_out_all_one_w[2]), (exp_result_w[2] & exp_out_all_one_w[1]), (exp_result_w[1] & exp_out_all_one_w[0]), exp_result_w[0]},
		exp_out_not_zero_w = {(exp_result_w[7] | exp_out_not_zero_w[6]), (exp_result_w[6] | exp_out_not_zero_w[5]), (exp_result_w[5] | exp_out_not_zero_w[4]), (exp_result_w[4] | exp_out_not_zero_w[3]), (exp_result_w[3] | exp_out_not_zero_w[2]), (exp_result_w[2] | exp_out_not_zero_w[1]), (exp_result_w[1] | exp_out_not_zero_w[0]), exp_result_w[0]},
		exp_result_out = (wire_exp_result_mux_prea_dataout & {8{(~ ((underflow_w & (~ barrel_shifter_underflow)) | negative_infinity))}}),
		exp_result_w = wire_exp_value_man_over_result[7:0],
		exp_value = wire_exp_minus_bias_result,
		exp_value_wi = exp_value,
		exp_value_wo = exp_value_dffe1,
		exp_w = data[30:23],
		extra_ln2 = ((~ xf_pre[37]) & sign_dffe8[0:0]),
		fraction = {data[22:0]},
		fraction_wi = fraction,
		fraction_wo = fraction_dffe1,
		gnd_w = 1'b0,
		guard_bit = man_prod_result[35],
		input_is_infinity_wi = (exp_data_all_one_w[7] & (~ man_data_not_zero_w[22])),
		input_is_infinity_wo = input_is_infinity_16_pipes15[0:0],
		input_is_nan_wi = (exp_data_all_one_w[7] & man_data_not_zero_w[22]),
		input_is_nan_wo = input_is_nan_16_pipes15[0:0],
		input_is_zero_wi = (~ exp_data_not_zero_w[7]),
		input_is_zero_wo = input_is_zero_16_pipes15[0:0],
		ln2_w = 38'b10110001011100100001011111110111110100,
		man_data_not_zero_w = {(data[22] | man_data_not_zero_w[21]), (data[21] | man_data_not_zero_w[20]), (data[20] | man_data_not_zero_w[19]), (data[19] | man_data_not_zero_w[18]), (data[18] | man_data_not_zero_w[17]), (data[17] | man_data_not_zero_w[16]), (data[16] | man_data_not_zero_w[15]), (data[15] | man_data_not_zero_w[14]), (data[14] | man_data_not_zero_w[13]), (data[13] | man_data_not_zero_w[12]), (data[12] | man_data_not_zero_w[11]), (data[11] | man_data_not_zero_w[10]), (data[10] | man_data_not_zero_w[9]), (data[9] | man_data_not_zero_w[8]), (data[8] | man_data_not_zero_w[7]), (data[7] | man_data_not_zero_w[6]), (data[6] | man_data_not_zero_w[5]), (data[5] | man_data_not_zero_w[4]), (data[4] | man_data_not_zero_w[3]), (data[3] | man_data_not_zero_w[2]), (data[2] | man_data_not_zero_w[1]), (data[1] | man_data_not_zero_w[0]), data[0]},
		man_overflow = (round_up & man_result_all_ones[22]),
		man_overflow_wi = man_overflow,
		man_overflow_wo = man_overflow_dffe15,
		man_prod_result = ((man_prod_shifted & {62{man_prod_wo[59]}}) | (man_prod_wire & {62{(~ man_prod_wo[59])}})),
		man_prod_shifted = {gnd_w, man_prod_wo[61:1]},
		man_prod_wi = wire_man_prod_result,
		man_prod_wire = man_prod_wo,
		man_prod_wo = man_prod_dffe14,
		man_result_all_ones = {(man_round_wi[22] & man_result_all_ones[21]), (man_round_wi[21] & man_result_all_ones[20]), (man_round_wi[20] & man_result_all_ones[19]), (man_round_wi[19] & man_result_all_ones[18]), (man_round_wi[18] & man_result_all_ones[17]), (man_round_wi[17] & man_result_all_ones[16]), (man_round_wi[16] & man_result_all_ones[15]), (man_round_wi[15] & man_result_all_ones[14]), (man_round_wi[14] & man_result_all_ones[13]), (man_round_wi[13] & man_result_all_ones[12]), (man_round_wi[12] & man_result_all_ones[11]), (man_round_wi[11] & man_result_all_ones[10]), (man_round_wi[10] & man_result_all_ones[9]), (man_round_wi[9] & man_result_all_ones[8]), (man_round_wi[8] & man_result_all_ones[7]), (man_round_wi[7] & man_result_all_ones[6]), (man_round_wi[6] & man_result_all_ones[5]), (man_round_wi[5] & man_result_all_ones[4]), (man_round_wi[4] & man_result_all_ones[3]), (man_round_wi[3] & man_result_all_ones[2]), (man_round_wi[2] & man_result_all_ones[1]), (man_round_wi[1] & man_result_all_ones[0]), man_round_wi[0]},
		man_result_w = wire_man_result_muxa_dataout,
		man_round_wi = man_prod_result[57:35],
		man_round_wo = man_round_dffe15,
		nan_w = input_is_nan_wo,
		negative_infinity = (sign_dffe15[0:0] & input_is_infinity_wo),
		one_over_ln2_w = 9'b101110001,
		overflow_w = ((((~ sign_dffe15[0:0]) & (((distance_overflow | wire_exp_value_add_bias_result[8]) | exp_out_all_one_w[7]) | wire_exp_value_man_over_result[8])) & (~ underflow_w)) & (~ input_is_nan_wo)),
		positive_infinity = ((~ sign_dffe15[0:0]) & input_is_infinity_wo),
		result = {1'b0, result_pipe_wo},
		result_pipe_wi = {exp_result_out, man_result_w},
		result_pipe_wo = result_pipe_dffe16,
		result_underflow_w = ((~ exp_out_not_zero_w[7]) & (((~ wire_exp_value_man_over_result[8]) & (~ sign_dffe15[0:0])) | sign_dffe15[0:0])),
		round_bit = man_prod_result[34],
		round_up = (round_bit & (guard_bit | sticky_bits[4])),
		round_up_wi = round_up,
		round_up_wo = round_up_dffe15,
		shifted_value = (tbl1_compare_wo | man_prod_wo[59]),
		sign_w = data[31],
		sticky_bits = {(man_prod_result[29] | sticky_bits[3]), (man_prod_result[30] | sticky_bits[2]), (man_prod_result[31] | sticky_bits[1]), (man_prod_result[32] | sticky_bits[0]), man_prod_result[33]},
		table_one_data = {32'b10101000100111100001011100110110, 32'b10100011011011100000001001111010, 32'b10011110011001101100101000011001, 32'b10011001100001110010110000111101, 32'b10010100110011011111000011111001, 32'b10010000001110011110100111111000, 32'b10001011110010011111001000110010, 32'b10000111011111001110110110100011, 32'b10000011010100011100100100000011, 32'b11111110100011101111001100001100, 32'b11110110101110011111100100100000, 32'b11101111001000101010111011111100, 32'b11100111110001110010111011000010, 32'b11100000101001011010000110001001, 32'b11011001101111000011111011100100, 32'b11010011000010010100110001110000, 32'b11001100100010110001110101101010, 32'b11000110010000000001001000111011, 32'b11000000001001101001100000011010, 32'b10111010001111010010100010011110, 32'b10110100100000100100100101100101, 32'b10101110111101001000101110110000, 32'b10101001100100101000110000000110, 32'b10100100010110101111000111100001, 32'b10011111010011000110111101010101, 32'b10011010011001011100000010111000, 32'b10010101101001011010110001011001, 32'b10010001000010110000001000101101, 32'b10001100100101001001101110000011, 32'b10001000010000010101101010111011, 32'b10000100000100000010101100000000, 32'b10000000000000000000000000000000},
		table_one_out = wire_table_one_result,
		table_three_data = {21'b111110000001111000001, 21'b111100000001110000100, 21'b111010000001101001001, 21'b111000000001100010000, 21'b110110000001011011001, 21'b110100000001010100100, 21'b110010000001001110001, 21'b110000000001001000000, 21'b101110000001000010001, 21'b101100000000111100100, 21'b101010000000110111001, 21'b101000000000110010000, 21'b100110000000101101001, 21'b100100000000101000100, 21'b100010000000100100001, 21'b100000000000100000000, 21'b011110000000011100001, 21'b011100000000011000100, 21'b011010000000010101001, 21'b011000000000010010000, 21'b010110000000001111001, 21'b010100000000001100100, 21'b010010000000001010001, 21'b010000000000001000000, 21'b001110000000000110001, 21'b001100000000000100100, 21'b001010000000000011001, 21'b001000000000000010000, 21'b000110000000000001001, 21'b000100000000000000100, 21'b000010000000000000001, {21{1'b0}}},
		table_three_out = {1'b1, {10{1'b0}}, table_three_out_tmp},
		table_three_out_tmp = wire_table_three_result,
		table_two_data = {26'b11111011110010101100010101, 26'b11110011100011001101101010, 26'b11101011010100001111111011, 26'b11100011000101110011000111, 26'b11011010110111110111001100, 26'b11010010101010011100001000, 26'b11001010011101100001111000, 26'b11000010010001001000011011, 26'b10111010000101001111101110, 26'b10110001111001110111110000, 26'b10101001101111000000011110, 26'b10100001100100101001110111, 26'b10011001011010110011111000, 26'b10010001010001011110100000, 26'b10001001001000101001101100, 26'b10000001000000010101011010, 26'b01111000111000100001101001, 26'b01110000110001001110010101, 26'b01101000101010011011011110, 26'b01100000100100001001000001, 26'b01011000011110010110111100, 26'b01010000011001000101001110, 26'b01001000010100010011110011, 26'b01000000010000000010101011, 26'b00111000001100010001110010, 26'b00110000001001000001001000, 26'b00101000000110010000101001, 26'b00100000000100000000010101, 26'b00011000000010010000001001, 26'b00010000000001000000000010, 26'b00001000000000010000000000, {26{1'b0}}},
		table_two_out = {1'b1, {5{1'b0}}, table_two_out_tmp},
		table_two_out_tmp = wire_table_two_result,
		tbl1_compare_wi = wire_tbl1_compare_ageb,
		tbl1_compare_wo = tbl1_compare_dffe11_4_pipes3[0:0],
		tbl1_tbl2_prod_wi = wire_tbl1_tbl2_prod_result[63:33],
		tbl1_tbl2_prod_wo = tbl1_tbl2_prod_dffe12,
		tbl3_taylor_prod_wi = wire_tbl3_taylor_prod_result[61:31],
		tbl3_taylor_prod_wo = tbl3_taylor_prod_dffe12,
		underflow_compare_val_w = 8'b00011101,
		underflow_w = (((((result_underflow_w | barrel_shifter_underflow) | (sign_dffe15[0:0] & (distance_overflow | (~ wire_exp_value_add_bias_result[8])))) & (~ input_is_zero_wo)) & (~ input_is_infinity_wo)) & (~ input_is_nan_wo)),
		x_fixed = wire_rbarrel_shift_result,
		xf = wire_xf_muxa_dataout,
		xf_pre = wire_x_fixed_minus_xiln2_result,
		xf_pre_2_wi = xf_pre_wo,
		xf_pre_2_wo = xf_pre_2_dffe10,
		xf_pre_wi = xf_pre,
		xf_pre_wo = xf_pre_dffe9,
		xi_exp_value = xi_prod_wo[18:11],
		xi_exp_value_wi = xi_exp_value,
		xi_exp_value_wo = xi_exp_value_dffe4,
		xi_ln2_prod_wi = wire_xi_ln2_prod_result,
		xi_ln2_prod_wo = xi_ln2_prod_dffe7,
		xi_prod_wi = wire_xi_prod_result,
		xi_prod_wo = xi_prod_dffe3;
endmodule