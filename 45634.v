module  fp_add_v1_altfp_add_sub_o7j
	(
	clock,
	dataa,
	datab,
	result) ;
	input   clock;
	input   [63:0]  dataa;
	input   [63:0]  datab;
	output   [63:0]  result;
	wire  [54:0]   wire_lbarrel_shift_result;
	wire  [54:0]   wire_rbarrel_shift_result;
	wire  [5:0]   wire_leading_zeroes_cnt_q;
	wire  [5:0]   wire_trailing_zeros_cnt_q;
	reg	[11:0]	aligned_dataa_exp_dffe12;
	reg	[11:0]	aligned_dataa_exp_dffe13;
	reg	[11:0]	aligned_dataa_exp_dffe14;
	reg	[52:0]	aligned_dataa_man_dffe12;
	reg	[52:0]	aligned_dataa_man_dffe13;
	reg	[52:0]	aligned_dataa_man_dffe14;
	reg	aligned_dataa_sign_dffe12;
	reg	aligned_dataa_sign_dffe13;
	reg	aligned_dataa_sign_dffe14;
	reg	[11:0]	aligned_datab_exp_dffe12;
	reg	[11:0]	aligned_datab_exp_dffe13;
	reg	[11:0]	aligned_datab_exp_dffe14;
	reg	[52:0]	aligned_datab_man_dffe12;
	reg	[52:0]	aligned_datab_man_dffe13;
	reg	[52:0]	aligned_datab_man_dffe14;
	reg	aligned_datab_sign_dffe12;
	reg	aligned_datab_sign_dffe13;
	reg	aligned_datab_sign_dffe14;
	reg	both_inputs_are_infinite_dffe1;
	reg	[10:0]	data_exp_dffe1;
	reg	[63:0]	dataa_dffe11;
	reg	[54:0]	dataa_man_dffe1;
	reg	dataa_sign_dffe1;
	reg	[63:0]	datab_dffe11;
	reg	[54:0]	datab_man_dffe1;
	reg	datab_sign_dffe1;
	reg	denormal_res_dffe3;
	reg	denormal_res_dffe4;
	reg	denormal_res_dffe41;
	reg	[1:0]	exp_adj_dffe21;
	reg	[1:0]	exp_adj_dffe23;
	reg	exp_amb_mux_dffe13;
	reg	exp_amb_mux_dffe14;
	reg	[10:0]	exp_intermediate_res_dffe41;
	reg	[10:0]	exp_out_dffe5;
	reg	[10:0]	exp_res_dffe2;
	reg	[10:0]	exp_res_dffe21;
	reg	[10:0]	exp_res_dffe23;
	reg	[10:0]	exp_res_dffe27;
	reg	[10:0]	exp_res_dffe3;
	reg	[10:0]	exp_res_dffe4;
	reg	infinite_output_sign_dffe1;
	reg	infinite_output_sign_dffe2;
	reg	infinite_output_sign_dffe21;
	reg	infinite_output_sign_dffe23;
	reg	infinite_output_sign_dffe27;
	reg	infinite_output_sign_dffe3;
	reg	infinite_output_sign_dffe31;
	reg	infinite_output_sign_dffe4;
	reg	infinite_output_sign_dffe41;
	reg	infinite_res_dffe3;
	reg	infinite_res_dffe4;
	reg	infinite_res_dffe41;
	reg	infinity_magnitude_sub_dffe2;
	reg	infinity_magnitude_sub_dffe21;
	reg	infinity_magnitude_sub_dffe23;
	reg	infinity_magnitude_sub_dffe27;
	reg	infinity_magnitude_sub_dffe3;
	reg	infinity_magnitude_sub_dffe31;
	reg	infinity_magnitude_sub_dffe4;
	reg	infinity_magnitude_sub_dffe41;
	reg	input_dataa_denormal_dffe11;
	reg	input_dataa_infinite_dffe11;
	reg	input_dataa_infinite_dffe12;
	reg	input_dataa_infinite_dffe13;
	reg	input_dataa_infinite_dffe14;
	reg	input_dataa_nan_dffe11;
	reg	input_dataa_nan_dffe12;
	reg	input_dataa_zero_dffe11;
	reg	input_datab_denormal_dffe11;
	reg	input_datab_infinite_dffe11;
	reg	input_datab_infinite_dffe12;
	reg	input_datab_infinite_dffe13;
	reg	input_datab_infinite_dffe14;
	reg	input_datab_nan_dffe11;
	reg	input_datab_nan_dffe12;
	reg	input_datab_zero_dffe11;
	reg	input_is_infinite_dffe1;
	reg	input_is_infinite_dffe2;
	reg	input_is_infinite_dffe21;
	reg	input_is_infinite_dffe23;
	reg	input_is_infinite_dffe27;
	reg	input_is_infinite_dffe3;
	reg	input_is_infinite_dffe31;
	reg	input_is_infinite_dffe4;
	reg	input_is_infinite_dffe41;
	reg	input_is_nan_dffe1;
	reg	input_is_nan_dffe13;
	reg	input_is_nan_dffe14;
	reg	input_is_nan_dffe2;
	reg	input_is_nan_dffe21;
	reg	input_is_nan_dffe23;
	reg	input_is_nan_dffe27;
	reg	input_is_nan_dffe3;
	reg	input_is_nan_dffe31;
	reg	input_is_nan_dffe4;
	reg	input_is_nan_dffe41;
	reg	[54:0]	man_add_sub_res_mag_dffe21;
	reg	[54:0]	man_add_sub_res_mag_dffe23;
	reg	[56:0]	man_add_sub_res_mag_dffe27;
	reg	man_add_sub_res_sign_dffe21;
	reg	man_add_sub_res_sign_dffe23;
	reg	man_add_sub_res_sign_dffe27;
	reg	[54:0]	man_dffe31;
	reg	[5:0]	man_leading_zeros_dffe31;
	reg	[51:0]	man_out_dffe5;
	reg	[51:0]	man_res_dffe4;
	reg	man_res_is_not_zero_dffe3;
	reg	man_res_is_not_zero_dffe31;
	reg	man_res_is_not_zero_dffe4;
	reg	man_res_is_not_zero_dffe41;
	reg	man_res_not_zero_dffe23;
	reg	[54:0]	man_res_rounding_add_sub_result_reg;
	reg	[52:0]	man_smaller_dffe13;
	reg	need_complement_dffe2;
	reg	round_bit_dffe21;
	reg	round_bit_dffe23;
	reg	round_bit_dffe3;
	reg	round_bit_dffe31;
	reg	rounded_res_infinity_dffe4;
	reg	[5:0]	rshift_distance_dffe13;
	reg	[5:0]	rshift_distance_dffe14;
	reg	sign_dffe31;
	reg	sign_out_dffe5;
	reg	sign_res_dffe3;
	reg	sign_res_dffe4;
	reg	sign_res_dffe41;
	reg	sticky_bit_dffe1;
	reg	sticky_bit_dffe2;
	reg	sticky_bit_dffe21;
	reg	sticky_bit_dffe23;
	reg	sticky_bit_dffe27;
	reg	sticky_bit_dffe3;
	reg	sticky_bit_dffe31;
	reg	zero_man_sign_dffe2;
	reg	zero_man_sign_dffe21;
	reg	zero_man_sign_dffe23;
	reg	zero_man_sign_dffe27;
	wire  [11:0]   wire_add_sub1_result;
	wire  [11:0]   wire_add_sub2_result;
	wire  [6:0]   wire_add_sub3_result;
	wire  [11:0]   wire_add_sub4_result;
	wire  [11:0]   wire_add_sub5_result;
	wire  [11:0]   wire_add_sub6_result;
	wire  wire_man_2comp_res_lower_cout;
	wire  [28:0]   wire_man_2comp_res_lower_result;
	wire  [27:0]   wire_man_2comp_res_upper0_result;
	wire  [27:0]   wire_man_2comp_res_upper1_result;
	wire  wire_man_add_sub_lower_cout;
	wire  [28:0]   wire_man_add_sub_lower_result;
	wire  [27:0]   wire_man_add_sub_upper0_result;
	wire  [27:0]   wire_man_add_sub_upper1_result;
	wire  wire_man_res_rounding_add_sub_lower_cout;
	wire  [27:0]   wire_man_res_rounding_add_sub_lower_result;
	wire  [26:0]   wire_man_res_rounding_add_sub_upper1_result;
	wire  wire_trailing_zeros_limit_comparator_agb;
	wire aclr;
	wire  add_sub_dffe25_wi;
	wire  add_sub_dffe25_wo;
	wire  add_sub_w2;
	wire  [26:0]  adder_upper_w;
	wire  [11:0]  aligned_dataa_exp_dffe12_wi;
	wire  [11:0]  aligned_dataa_exp_dffe12_wo;
	wire  [11:0]  aligned_dataa_exp_dffe13_wi;
	wire  [11:0]  aligned_dataa_exp_dffe13_wo;
	wire  [11:0]  aligned_dataa_exp_dffe14_wi;
	wire  [11:0]  aligned_dataa_exp_dffe14_wo;
	wire  [11:0]  aligned_dataa_exp_dffe15_wi;
	wire  [11:0]  aligned_dataa_exp_dffe15_wo;
	wire  [11:0]  aligned_dataa_exp_w;
	wire  [52:0]  aligned_dataa_man_dffe12_wi;
	wire  [52:0]  aligned_dataa_man_dffe12_wo;
	wire  [52:0]  aligned_dataa_man_dffe13_wi;
	wire  [52:0]  aligned_dataa_man_dffe13_wo;
	wire  [52:0]  aligned_dataa_man_dffe14_wi;
	wire  [52:0]  aligned_dataa_man_dffe14_wo;
	wire  [54:0]  aligned_dataa_man_dffe15_w;
	wire  [52:0]  aligned_dataa_man_dffe15_wi;
	wire  [52:0]  aligned_dataa_man_dffe15_wo;
	wire  [54:0]  aligned_dataa_man_w;
	wire  aligned_dataa_sign_dffe12_wi;
	wire  aligned_dataa_sign_dffe12_wo;
	wire  aligned_dataa_sign_dffe13_wi;
	wire  aligned_dataa_sign_dffe13_wo;
	wire  aligned_dataa_sign_dffe14_wi;
	wire  aligned_dataa_sign_dffe14_wo;
	wire  aligned_dataa_sign_dffe15_wi;
	wire  aligned_dataa_sign_dffe15_wo;
	wire  aligned_dataa_sign_w;
	wire  [11:0]  aligned_datab_exp_dffe12_wi;
	wire  [11:0]  aligned_datab_exp_dffe12_wo;
	wire  [11:0]  aligned_datab_exp_dffe13_wi;
	wire  [11:0]  aligned_datab_exp_dffe13_wo;
	wire  [11:0]  aligned_datab_exp_dffe14_wi;
	wire  [11:0]  aligned_datab_exp_dffe14_wo;
	wire  [11:0]  aligned_datab_exp_dffe15_wi;
	wire  [11:0]  aligned_datab_exp_dffe15_wo;
	wire  [11:0]  aligned_datab_exp_w;
	wire  [52:0]  aligned_datab_man_dffe12_wi;
	wire  [52:0]  aligned_datab_man_dffe12_wo;
	wire  [52:0]  aligned_datab_man_dffe13_wi;
	wire  [52:0]  aligned_datab_man_dffe13_wo;
	wire  [52:0]  aligned_datab_man_dffe14_wi;
	wire  [52:0]  aligned_datab_man_dffe14_wo;
	wire  [54:0]  aligned_datab_man_dffe15_w;
	wire  [52:0]  aligned_datab_man_dffe15_wi;
	wire  [52:0]  aligned_datab_man_dffe15_wo;
	wire  [54:0]  aligned_datab_man_w;
	wire  aligned_datab_sign_dffe12_wi;
	wire  aligned_datab_sign_dffe12_wo;
	wire  aligned_datab_sign_dffe13_wi;
	wire  aligned_datab_sign_dffe13_wo;
	wire  aligned_datab_sign_dffe14_wi;
	wire  aligned_datab_sign_dffe14_wo;
	wire  aligned_datab_sign_dffe15_wi;
	wire  aligned_datab_sign_dffe15_wo;
	wire  aligned_datab_sign_w;
	wire  borrow_w;
	wire  both_inputs_are_infinite_dffe1_wi;
	wire  both_inputs_are_infinite_dffe1_wo;
	wire  both_inputs_are_infinite_dffe25_wi;
	wire  both_inputs_are_infinite_dffe25_wo;
	wire clk_en;
	wire  [10:0]  data_exp_dffe1_wi;
	wire  [10:0]  data_exp_dffe1_wo;
	wire  [63:0]  dataa_dffe11_wi;
	wire  [63:0]  dataa_dffe11_wo;
	wire  [54:0]  dataa_man_dffe1_wi;
	wire  [54:0]  dataa_man_dffe1_wo;
	wire  dataa_sign_dffe1_wi;
	wire  dataa_sign_dffe1_wo;
	wire  dataa_sign_dffe25_wi;
	wire  dataa_sign_dffe25_wo;
	wire  [63:0]  datab_dffe11_wi;
	wire  [63:0]  datab_dffe11_wo;
	wire  [54:0]  datab_man_dffe1_wi;
	wire  [54:0]  datab_man_dffe1_wo;
	wire  datab_sign_dffe1_wi;
	wire  datab_sign_dffe1_wo;
	wire  denormal_flag_w;
	wire  denormal_res_dffe32_wi;
	wire  denormal_res_dffe32_wo;
	wire  denormal_res_dffe33_wi;
	wire  denormal_res_dffe33_wo;
	wire  denormal_res_dffe3_wi;
	wire  denormal_res_dffe3_wo;
	wire  denormal_res_dffe41_wi;
	wire  denormal_res_dffe41_wo;
	wire  denormal_res_dffe42_wi;
	wire  denormal_res_dffe42_wo;
	wire  denormal_res_dffe4_wi;
	wire  denormal_res_dffe4_wo;
	wire  denormal_result_w;
	wire  [10:0]  exp_a_all_one_w;
	wire  [10:0]  exp_a_not_zero_w;
	wire  [9:0]  exp_adj_0pads;
	wire  [1:0]  exp_adj_dffe21_wi;
	wire  [1:0]  exp_adj_dffe21_wo;
	wire  [1:0]  exp_adj_dffe23_wi;
	wire  [1:0]  exp_adj_dffe23_wo;
	wire  [1:0]  exp_adj_dffe26_wi;
	wire  [1:0]  exp_adj_dffe26_wo;
	wire  [1:0]  exp_adjust_by_add1;
	wire  [1:0]  exp_adjust_by_add2;
	wire  [11:0]  exp_adjustment2_add_sub_dataa_w;
	wire  [11:0]  exp_adjustment2_add_sub_datab_w;
	wire  [11:0]  exp_adjustment2_add_sub_w;
	wire  [11:0]  exp_adjustment_add_sub_dataa_w;
	wire  [11:0]  exp_adjustment_add_sub_datab_w;
	wire  [11:0]  exp_adjustment_add_sub_w;
	wire  [10:0]  exp_all_ones_w;
	wire  [10:0]  exp_all_zeros_w;
	wire  exp_amb_mux_dffe13_wi;
	wire  exp_amb_mux_dffe13_wo;
	wire  exp_amb_mux_dffe14_wi;
	wire  exp_amb_mux_dffe14_wo;
	wire  exp_amb_mux_dffe15_wi;
	wire  exp_amb_mux_dffe15_wo;
	wire  exp_amb_mux_w;
	wire  [11:0]  exp_amb_w;
	wire  [10:0]  exp_b_all_one_w;
	wire  [10:0]  exp_b_not_zero_w;
	wire  [11:0]  exp_bma_w;
	wire  [4:0]  exp_diff_abs_exceed_max_w;
	wire  [5:0]  exp_diff_abs_max_w;
	wire  [10:0]  exp_diff_abs_w;
	wire  [10:0]  exp_intermediate_res_dffe41_wi;
	wire  [10:0]  exp_intermediate_res_dffe41_wo;
	wire  [10:0]  exp_intermediate_res_dffe42_wi;
	wire  [10:0]  exp_intermediate_res_dffe42_wo;
	wire  [10:0]  exp_intermediate_res_w;
	wire  [10:0]  exp_out_dffe5_wi;
	wire  [10:0]  exp_out_dffe5_wo;
	wire  [10:0]  exp_res_dffe21_wi;
	wire  [10:0]  exp_res_dffe21_wo;
	wire  [10:0]  exp_res_dffe22_wi;
	wire  [10:0]  exp_res_dffe22_wo;
	wire  [10:0]  exp_res_dffe23_wi;
	wire  [10:0]  exp_res_dffe23_wo;
	wire  [10:0]  exp_res_dffe25_wi;
	wire  [10:0]  exp_res_dffe25_wo;
	wire  [10:0]  exp_res_dffe26_wi;
	wire  [10:0]  exp_res_dffe26_wo;
	wire  [10:0]  exp_res_dffe27_wi;
	wire  [10:0]  exp_res_dffe27_wo;
	wire  [10:0]  exp_res_dffe2_wi;
	wire  [10:0]  exp_res_dffe2_wo;
	wire  [10:0]  exp_res_dffe32_wi;
	wire  [10:0]  exp_res_dffe32_wo;
	wire  [10:0]  exp_res_dffe33_wi;
	wire  [10:0]  exp_res_dffe33_wo;
	wire  [10:0]  exp_res_dffe3_wi;
	wire  [10:0]  exp_res_dffe3_wo;
	wire  [10:0]  exp_res_dffe4_wi;
	wire  [10:0]  exp_res_dffe4_wo;
	wire  [10:0]  exp_res_max_w;
	wire  [11:0]  exp_res_not_zero_w;
	wire  [11:0]  exp_res_rounding_adder_dataa_w;
	wire  [11:0]  exp_res_rounding_adder_w;
	wire  exp_rounded_res_infinity_w;
	wire  [10:0]  exp_rounded_res_max_w;
	wire  [10:0]  exp_rounded_res_w;
	wire  [11:0]  exp_rounding_adjustment_w;
	wire  [11:0]  exp_value;
	wire  force_infinity_w;
	wire  force_nan_w;
	wire  force_zero_w;
	wire  guard_bit_dffe3_wo;
	wire  infinite_output_sign_dffe1_wi;
	wire  infinite_output_sign_dffe1_wo;
	wire  infinite_output_sign_dffe21_wi;
	wire  infinite_output_sign_dffe21_wo;
	wire  infinite_output_sign_dffe22_wi;
	wire  infinite_output_sign_dffe22_wo;
	wire  infinite_output_sign_dffe23_wi;
	wire  infinite_output_sign_dffe23_wo;
	wire  infinite_output_sign_dffe25_wi;
	wire  infinite_output_sign_dffe25_wo;
	wire  infinite_output_sign_dffe26_wi;
	wire  infinite_output_sign_dffe26_wo;
	wire  infinite_output_sign_dffe27_wi;
	wire  infinite_output_sign_dffe27_wo;
	wire  infinite_output_sign_dffe2_wi;
	wire  infinite_output_sign_dffe2_wo;
	wire  infinite_output_sign_dffe31_wi;
	wire  infinite_output_sign_dffe31_wo;
	wire  infinite_output_sign_dffe32_wi;
	wire  infinite_output_sign_dffe32_wo;
	wire  infinite_output_sign_dffe33_wi;
	wire  infinite_output_sign_dffe33_wo;
	wire  infinite_output_sign_dffe3_wi;
	wire  infinite_output_sign_dffe3_wo;
	wire  infinite_output_sign_dffe41_wi;
	wire  infinite_output_sign_dffe41_wo;
	wire  infinite_output_sign_dffe42_wi;
	wire  infinite_output_sign_dffe42_wo;
	wire  infinite_output_sign_dffe4_wi;
	wire  infinite_output_sign_dffe4_wo;
	wire  infinite_res_dff32_wi;
	wire  infinite_res_dff32_wo;
	wire  infinite_res_dff33_wi;
	wire  infinite_res_dff33_wo;
	wire  infinite_res_dffe3_wi;
	wire  infinite_res_dffe3_wo;
	wire  infinite_res_dffe41_wi;
	wire  infinite_res_dffe41_wo;
	wire  infinite_res_dffe42_wi;
	wire  infinite_res_dffe42_wo;
	wire  infinite_res_dffe4_wi;
	wire  infinite_res_dffe4_wo;
	wire  infinity_magnitude_sub_dffe21_wi;
	wire  infinity_magnitude_sub_dffe21_wo;
	wire  infinity_magnitude_sub_dffe22_wi;
	wire  infinity_magnitude_sub_dffe22_wo;
	wire  infinity_magnitude_sub_dffe23_wi;
	wire  infinity_magnitude_sub_dffe23_wo;
	wire  infinity_magnitude_sub_dffe26_wi;
	wire  infinity_magnitude_sub_dffe26_wo;
	wire  infinity_magnitude_sub_dffe27_wi;
	wire  infinity_magnitude_sub_dffe27_wo;
	wire  infinity_magnitude_sub_dffe2_wi;
	wire  infinity_magnitude_sub_dffe2_wo;
	wire  infinity_magnitude_sub_dffe31_wi;
	wire  infinity_magnitude_sub_dffe31_wo;
	wire  infinity_magnitude_sub_dffe32_wi;
	wire  infinity_magnitude_sub_dffe32_wo;
	wire  infinity_magnitude_sub_dffe33_wi;
	wire  infinity_magnitude_sub_dffe33_wo;
	wire  infinity_magnitude_sub_dffe3_wi;
	wire  infinity_magnitude_sub_dffe3_wo;
	wire  infinity_magnitude_sub_dffe41_wi;
	wire  infinity_magnitude_sub_dffe41_wo;
	wire  infinity_magnitude_sub_dffe42_wi;
	wire  infinity_magnitude_sub_dffe42_wo;
	wire  infinity_magnitude_sub_dffe4_wi;
	wire  infinity_magnitude_sub_dffe4_wo;
	wire  input_dataa_denormal_dffe11_wi;
	wire  input_dataa_denormal_dffe11_wo;
	wire  input_dataa_denormal_w;
	wire  input_dataa_infinite_dffe11_wi;
	wire  input_dataa_infinite_dffe11_wo;
	wire  input_dataa_infinite_dffe12_wi;
	wire  input_dataa_infinite_dffe12_wo;
	wire  input_dataa_infinite_dffe13_wi;
	wire  input_dataa_infinite_dffe13_wo;
	wire  input_dataa_infinite_dffe14_wi;
	wire  input_dataa_infinite_dffe14_wo;
	wire  input_dataa_infinite_dffe15_wi;
	wire  input_dataa_infinite_dffe15_wo;
	wire  input_dataa_infinite_w;
	wire  input_dataa_nan_dffe11_wi;
	wire  input_dataa_nan_dffe11_wo;
	wire  input_dataa_nan_dffe12_wi;
	wire  input_dataa_nan_dffe12_wo;
	wire  input_dataa_nan_w;
	wire  input_dataa_zero_dffe11_wi;
	wire  input_dataa_zero_dffe11_wo;
	wire  input_dataa_zero_w;
	wire  input_datab_denormal_dffe11_wi;
	wire  input_datab_denormal_dffe11_wo;
	wire  input_datab_denormal_w;
	wire  input_datab_infinite_dffe11_wi;
	wire  input_datab_infinite_dffe11_wo;
	wire  input_datab_infinite_dffe12_wi;
	wire  input_datab_infinite_dffe12_wo;
	wire  input_datab_infinite_dffe13_wi;
	wire  input_datab_infinite_dffe13_wo;
	wire  input_datab_infinite_dffe14_wi;
	wire  input_datab_infinite_dffe14_wo;
	wire  input_datab_infinite_dffe15_wi;
	wire  input_datab_infinite_dffe15_wo;
	wire  input_datab_infinite_w;
	wire  input_datab_nan_dffe11_wi;
	wire  input_datab_nan_dffe11_wo;
	wire  input_datab_nan_dffe12_wi;
	wire  input_datab_nan_dffe12_wo;
	wire  input_datab_nan_w;
	wire  input_datab_zero_dffe11_wi;
	wire  input_datab_zero_dffe11_wo;
	wire  input_datab_zero_w;
	wire  input_is_infinite_dffe1_wi;
	wire  input_is_infinite_dffe1_wo;
	wire  input_is_infinite_dffe21_wi;
	wire  input_is_infinite_dffe21_wo;
	wire  input_is_infinite_dffe22_wi;
	wire  input_is_infinite_dffe22_wo;
	wire  input_is_infinite_dffe23_wi;
	wire  input_is_infinite_dffe23_wo;
	wire  input_is_infinite_dffe25_wi;
	wire  input_is_infinite_dffe25_wo;
	wire  input_is_infinite_dffe26_wi;
	wire  input_is_infinite_dffe26_wo;
	wire  input_is_infinite_dffe27_wi;
	wire  input_is_infinite_dffe27_wo;
	wire  input_is_infinite_dffe2_wi;
	wire  input_is_infinite_dffe2_wo;
	wire  input_is_infinite_dffe31_wi;
	wire  input_is_infinite_dffe31_wo;
	wire  input_is_infinite_dffe32_wi;
	wire  input_is_infinite_dffe32_wo;
	wire  input_is_infinite_dffe33_wi;
	wire  input_is_infinite_dffe33_wo;
	wire  input_is_infinite_dffe3_wi;
	wire  input_is_infinite_dffe3_wo;
	wire  input_is_infinite_dffe41_wi;
	wire  input_is_infinite_dffe41_wo;
	wire  input_is_infinite_dffe42_wi;
	wire  input_is_infinite_dffe42_wo;
	wire  input_is_infinite_dffe4_wi;
	wire  input_is_infinite_dffe4_wo;
	wire  input_is_nan_dffe13_wi;
	wire  input_is_nan_dffe13_wo;
	wire  input_is_nan_dffe14_wi;
	wire  input_is_nan_dffe14_wo;
	wire  input_is_nan_dffe15_wi;
	wire  input_is_nan_dffe15_wo;
	wire  input_is_nan_dffe1_wi;
	wire  input_is_nan_dffe1_wo;
	wire  input_is_nan_dffe21_wi;
	wire  input_is_nan_dffe21_wo;
	wire  input_is_nan_dffe22_wi;
	wire  input_is_nan_dffe22_wo;
	wire  input_is_nan_dffe23_wi;
	wire  input_is_nan_dffe23_wo;
	wire  input_is_nan_dffe25_wi;
	wire  input_is_nan_dffe25_wo;
	wire  input_is_nan_dffe26_wi;
	wire  input_is_nan_dffe26_wo;
	wire  input_is_nan_dffe27_wi;
	wire  input_is_nan_dffe27_wo;
	wire  input_is_nan_dffe2_wi;
	wire  input_is_nan_dffe2_wo;
	wire  input_is_nan_dffe31_wi;
	wire  input_is_nan_dffe31_wo;
	wire  input_is_nan_dffe32_wi;
	wire  input_is_nan_dffe32_wo;
	wire  input_is_nan_dffe33_wi;
	wire  input_is_nan_dffe33_wo;
	wire  input_is_nan_dffe3_wi;
	wire  input_is_nan_dffe3_wo;
	wire  input_is_nan_dffe41_wi;
	wire  input_is_nan_dffe41_wo;
	wire  input_is_nan_dffe42_wi;
	wire  input_is_nan_dffe42_wo;
	wire  input_is_nan_dffe4_wi;
	wire  input_is_nan_dffe4_wo;
	wire  [56:0]  man_2comp_res_dataa_w;
	wire  [56:0]  man_2comp_res_datab_w;
	wire  [56:0]  man_2comp_res_w;
	wire  [51:0]  man_a_not_zero_w;
	wire  [56:0]  man_add_sub_dataa_w;
	wire  [56:0]  man_add_sub_datab_w;
	wire  [54:0]  man_add_sub_res_mag_dffe21_wi;
	wire  [54:0]  man_add_sub_res_mag_dffe21_wo;
	wire  [54:0]  man_add_sub_res_mag_dffe23_wi;
	wire  [54:0]  man_add_sub_res_mag_dffe23_wo;
	wire  [54:0]  man_add_sub_res_mag_dffe26_wi;
	wire  [54:0]  man_add_sub_res_mag_dffe26_wo;
	wire  [56:0]  man_add_sub_res_mag_dffe27_wi;
	wire  [56:0]  man_add_sub_res_mag_dffe27_wo;
	wire  [56:0]  man_add_sub_res_mag_w2;
	wire  man_add_sub_res_sign_dffe21_wo;
	wire  man_add_sub_res_sign_dffe23_wi;
	wire  man_add_sub_res_sign_dffe23_wo;
	wire  man_add_sub_res_sign_dffe26_wi;
	wire  man_add_sub_res_sign_dffe26_wo;
	wire  man_add_sub_res_sign_dffe27_wi;
	wire  man_add_sub_res_sign_dffe27_wo;
	wire  man_add_sub_res_sign_w2;
	wire  [56:0]  man_add_sub_w;
	wire  [51:0]  man_all_zeros_w;
	wire  [51:0]  man_b_not_zero_w;
	wire  [54:0]  man_dffe31_wo;
	wire  [54:0]  man_intermediate_res_w;
	wire  [5:0]  man_leading_zeros_cnt_w;
	wire  [5:0]  man_leading_zeros_dffe31_wi;
	wire  [5:0]  man_leading_zeros_dffe31_wo;
	wire  [51:0]  man_nan_w;
	wire  [51:0]  man_out_dffe5_wi;
	wire  [51:0]  man_out_dffe5_wo;
	wire  [51:0]  man_res_dffe4_wi;
	wire  [51:0]  man_res_dffe4_wo;
	wire  man_res_is_not_zero_dffe31_wi;
	wire  man_res_is_not_zero_dffe31_wo;
	wire  man_res_is_not_zero_dffe32_wi;
	wire  man_res_is_not_zero_dffe32_wo;
	wire  man_res_is_not_zero_dffe33_wi;
	wire  man_res_is_not_zero_dffe33_wo;
	wire  man_res_is_not_zero_dffe3_wi;
	wire  man_res_is_not_zero_dffe3_wo;
	wire  man_res_is_not_zero_dffe41_wi;
	wire  man_res_is_not_zero_dffe41_wo;
	wire  man_res_is_not_zero_dffe42_wi;
	wire  man_res_is_not_zero_dffe42_wo;
	wire  man_res_is_not_zero_dffe4_wi;
	wire  man_res_is_not_zero_dffe4_wo;
	wire  [54:0]  man_res_mag_w2;
	wire  man_res_not_zero_dffe23_wi;
	wire  man_res_not_zero_dffe23_wo;
	wire  man_res_not_zero_dffe26_wi;
	wire  man_res_not_zero_dffe26_wo;
	wire  [53:0]  man_res_not_zero_w2;
	wire  [54:0]  man_res_rounding_add_sub_datab_w;
	wire  [54:0]  man_res_rounding_add_sub_w;
	wire  [52:0]  man_res_w3;
	wire  [51:0]  man_rounded_res_w;
	wire  man_rounding_add_value_w;
	wire  [52:0]  man_smaller_dffe13_wi;
	wire  [52:0]  man_smaller_dffe13_wo;
	wire  [52:0]  man_smaller_w;
	wire  need_complement_dffe22_wi;
	wire  need_complement_dffe22_wo;
	wire  need_complement_dffe2_wi;
	wire  need_complement_dffe2_wo;
	wire  [1:0]  pos_sign_bit_ext;
	wire  [5:0]  priority_encoder_1pads_w;
	wire  round_bit_dffe21_wi;
	wire  round_bit_dffe21_wo;
	wire  round_bit_dffe23_wi;
	wire  round_bit_dffe23_wo;
	wire  round_bit_dffe26_wi;
	wire  round_bit_dffe26_wo;
	wire  round_bit_dffe31_wi;
	wire  round_bit_dffe31_wo;
	wire  round_bit_dffe32_wi;
	wire  round_bit_dffe32_wo;
	wire  round_bit_dffe33_wi;
	wire  round_bit_dffe33_wo;
	wire  round_bit_dffe3_wi;
	wire  round_bit_dffe3_wo;
	wire  round_bit_w;
	wire  rounded_res_infinity_dffe4_wi;
	wire  rounded_res_infinity_dffe4_wo;
	wire  [5:0]  rshift_distance_dffe13_wi;
	wire  [5:0]  rshift_distance_dffe13_wo;
	wire  [5:0]  rshift_distance_dffe14_wi;
	wire  [5:0]  rshift_distance_dffe14_wo;
	wire  [5:0]  rshift_distance_dffe15_wi;
	wire  [5:0]  rshift_distance_dffe15_wo;
	wire  [5:0]  rshift_distance_w;
	wire  sign_dffe31_wi;
	wire  sign_dffe31_wo;
	wire  sign_dffe32_wi;
	wire  sign_dffe32_wo;
	wire  sign_dffe33_wi;
	wire  sign_dffe33_wo;
	wire  sign_out_dffe5_wi;
	wire  sign_out_dffe5_wo;
	wire  sign_res_dffe3_wi;
	wire  sign_res_dffe3_wo;
	wire  sign_res_dffe41_wi;
	wire  sign_res_dffe41_wo;
	wire  sign_res_dffe42_wi;
	wire  sign_res_dffe42_wo;
	wire  sign_res_dffe4_wi;
	wire  sign_res_dffe4_wo;
	wire  [6:0]  sticky_bit_cnt_dataa_w;
	wire  [6:0]  sticky_bit_cnt_datab_w;
	wire  [6:0]  sticky_bit_cnt_res_w;
	wire  sticky_bit_dffe1_wi;
	wire  sticky_bit_dffe1_wo;
	wire  sticky_bit_dffe21_wi;
	wire  sticky_bit_dffe21_wo;
	wire  sticky_bit_dffe22_wi;
	wire  sticky_bit_dffe22_wo;
	wire  sticky_bit_dffe23_wi;
	wire  sticky_bit_dffe23_wo;
	wire  sticky_bit_dffe25_wi;
	wire  sticky_bit_dffe25_wo;
	wire  sticky_bit_dffe26_wi;
	wire  sticky_bit_dffe26_wo;
	wire  sticky_bit_dffe27_wi;
	wire  sticky_bit_dffe27_wo;
	wire  sticky_bit_dffe2_wi;
	wire  sticky_bit_dffe2_wo;
	wire  sticky_bit_dffe31_wi;
	wire  sticky_bit_dffe31_wo;
	wire  sticky_bit_dffe32_wi;
	wire  sticky_bit_dffe32_wo;
	wire  sticky_bit_dffe33_wi;
	wire  sticky_bit_dffe33_wo;
	wire  sticky_bit_dffe3_wi;
	wire  sticky_bit_dffe3_wo;
	wire  sticky_bit_w;
	wire  [6:0]  trailing_zeros_limit_w;
	wire  zero_man_sign_dffe21_wi;
	wire  zero_man_sign_dffe21_wo;
	wire  zero_man_sign_dffe22_wi;
	wire  zero_man_sign_dffe22_wo;
	wire  zero_man_sign_dffe23_wi;
	wire  zero_man_sign_dffe23_wo;
	wire  zero_man_sign_dffe26_wi;
	wire  zero_man_sign_dffe26_wo;
	wire  zero_man_sign_dffe27_wi;
	wire  zero_man_sign_dffe27_wo;
	wire  zero_man_sign_dffe2_wi;
	wire  zero_man_sign_dffe2_wo;
	fp_add_v1_altbarrel_shift_v4e   lbarrel_shift
	(
	.aclr(aclr),
	.clk_en(clk_en),
	.clock(clock),
	.data(man_dffe31_wo),
	.distance(man_leading_zeros_cnt_w),
	.result(wire_lbarrel_shift_result));
	fp_add_v1_altbarrel_shift_58g   rbarrel_shift
	(
	.aclr(aclr),
	.clk_en(clk_en),
	.clock(clock),
	.data({man_smaller_dffe13_wo, 2'b00}),
	.distance(rshift_distance_dffe13_wo),
	.result(wire_rbarrel_shift_result));
	fp_add_v1_altpriority_encoder_uu8   leading_zeroes_cnt
	(
	.aclr(aclr),
	.clk_en(clk_en),
	.clock(clock),
	.data({man_add_sub_res_mag_dffe21_wo[54:1], 1'b1, 9'b000000000}),
	.q(wire_leading_zeroes_cnt_q));
	fp_add_v1_altpriority_encoder_ina   trailing_zeros_cnt
	(
	.aclr(aclr),
	.clk_en(clk_en),
	.clock(clock),
	.data({12'b111111111111, man_smaller_dffe13_wo[51:0]}),
	.q(wire_trailing_zeros_cnt_q));
	// synopsys translate_off
	initial
		aligned_dataa_exp_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_dataa_exp_dffe12 <= 12'b0;
		else if  (clk_en == 1'b1)   aligned_dataa_exp_dffe12 <= aligned_dataa_exp_dffe12_wi;
	// synopsys translate_off
	initial
		aligned_dataa_exp_dffe13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_dataa_exp_dffe13 <= 12'b0;
		else if  (clk_en == 1'b1)   aligned_dataa_exp_dffe13 <= aligned_dataa_exp_dffe13_wi;
	// synopsys translate_off
	initial
		aligned_dataa_exp_dffe14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_dataa_exp_dffe14 <= 12'b0;
		else if  (clk_en == 1'b1)   aligned_dataa_exp_dffe14 <= aligned_dataa_exp_dffe14_wi;
	// synopsys translate_off
	initial
		aligned_dataa_man_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_dataa_man_dffe12 <= 53'b0;
		else if  (clk_en == 1'b1)   aligned_dataa_man_dffe12 <= aligned_dataa_man_dffe12_wi;
	// synopsys translate_off
	initial
		aligned_dataa_man_dffe13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_dataa_man_dffe13 <= 53'b0;
		else if  (clk_en == 1'b1)   aligned_dataa_man_dffe13 <= aligned_dataa_man_dffe13_wi;
	// synopsys translate_off
	initial
		aligned_dataa_man_dffe14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_dataa_man_dffe14 <= 53'b0;
		else if  (clk_en == 1'b1)   aligned_dataa_man_dffe14 <= aligned_dataa_man_dffe14_wi;
	// synopsys translate_off
	initial
		aligned_dataa_sign_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_dataa_sign_dffe12 <= 1'b0;
		else if  (clk_en == 1'b1)   aligned_dataa_sign_dffe12 <= aligned_dataa_sign_dffe12_wi;
	// synopsys translate_off
	initial
		aligned_dataa_sign_dffe13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_dataa_sign_dffe13 <= 1'b0;
		else if  (clk_en == 1'b1)   aligned_dataa_sign_dffe13 <= aligned_dataa_sign_dffe13_wi;
	// synopsys translate_off
	initial
		aligned_dataa_sign_dffe14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_dataa_sign_dffe14 <= 1'b0;
		else if  (clk_en == 1'b1)   aligned_dataa_sign_dffe14 <= aligned_dataa_sign_dffe14_wi;
	// synopsys translate_off
	initial
		aligned_datab_exp_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_datab_exp_dffe12 <= 12'b0;
		else if  (clk_en == 1'b1)   aligned_datab_exp_dffe12 <= aligned_datab_exp_dffe12_wi;
	// synopsys translate_off
	initial
		aligned_datab_exp_dffe13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_datab_exp_dffe13 <= 12'b0;
		else if  (clk_en == 1'b1)   aligned_datab_exp_dffe13 <= aligned_datab_exp_dffe13_wi;
	// synopsys translate_off
	initial
		aligned_datab_exp_dffe14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_datab_exp_dffe14 <= 12'b0;
		else if  (clk_en == 1'b1)   aligned_datab_exp_dffe14 <= aligned_datab_exp_dffe14_wi;
	// synopsys translate_off
	initial
		aligned_datab_man_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_datab_man_dffe12 <= 53'b0;
		else if  (clk_en == 1'b1)   aligned_datab_man_dffe12 <= aligned_datab_man_dffe12_wi;
	// synopsys translate_off
	initial
		aligned_datab_man_dffe13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_datab_man_dffe13 <= 53'b0;
		else if  (clk_en == 1'b1)   aligned_datab_man_dffe13 <= aligned_datab_man_dffe13_wi;
	// synopsys translate_off
	initial
		aligned_datab_man_dffe14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_datab_man_dffe14 <= 53'b0;
		else if  (clk_en == 1'b1)   aligned_datab_man_dffe14 <= aligned_datab_man_dffe14_wi;
	// synopsys translate_off
	initial
		aligned_datab_sign_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_datab_sign_dffe12 <= 1'b0;
		else if  (clk_en == 1'b1)   aligned_datab_sign_dffe12 <= aligned_datab_sign_dffe12_wi;
	// synopsys translate_off
	initial
		aligned_datab_sign_dffe13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_datab_sign_dffe13 <= 1'b0;
		else if  (clk_en == 1'b1)   aligned_datab_sign_dffe13 <= aligned_datab_sign_dffe13_wi;
	// synopsys translate_off
	initial
		aligned_datab_sign_dffe14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) aligned_datab_sign_dffe14 <= 1'b0;
		else if  (clk_en == 1'b1)   aligned_datab_sign_dffe14 <= aligned_datab_sign_dffe14_wi;
	// synopsys translate_off
	initial
		both_inputs_are_infinite_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) both_inputs_are_infinite_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   both_inputs_are_infinite_dffe1 <= both_inputs_are_infinite_dffe1_wi;
	// synopsys translate_off
	initial
		data_exp_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) data_exp_dffe1 <= 11'b0;
		else if  (clk_en == 1'b1)   data_exp_dffe1 <= data_exp_dffe1_wi;
	// synopsys translate_off
	initial
		dataa_dffe11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dataa_dffe11 <= 64'b0;
		else if  (clk_en == 1'b1)   dataa_dffe11 <= dataa_dffe11_wi;
	// synopsys translate_off
	initial
		dataa_man_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dataa_man_dffe1 <= 55'b0;
		else if  (clk_en == 1'b1)   dataa_man_dffe1 <= dataa_man_dffe1_wi;
	// synopsys translate_off
	initial
		dataa_sign_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dataa_sign_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   dataa_sign_dffe1 <= dataa_sign_dffe1_wi;
	// synopsys translate_off
	initial
		datab_dffe11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) datab_dffe11 <= 64'b0;
		else if  (clk_en == 1'b1)   datab_dffe11 <= datab_dffe11_wi;
	// synopsys translate_off
	initial
		datab_man_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) datab_man_dffe1 <= 55'b0;
		else if  (clk_en == 1'b1)   datab_man_dffe1 <= datab_man_dffe1_wi;
	// synopsys translate_off
	initial
		datab_sign_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) datab_sign_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   datab_sign_dffe1 <= datab_sign_dffe1_wi;
	// synopsys translate_off
	initial
		denormal_res_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) denormal_res_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   denormal_res_dffe3 <= denormal_res_dffe3_wi;
	// synopsys translate_off
	initial
		denormal_res_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) denormal_res_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   denormal_res_dffe4 <= denormal_res_dffe4_wi;
	// synopsys translate_off
	initial
		denormal_res_dffe41 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) denormal_res_dffe41 <= 1'b0;
		else if  (clk_en == 1'b1)   denormal_res_dffe41 <= denormal_res_dffe41_wi;
	// synopsys translate_off
	initial
		exp_adj_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_adj_dffe21 <= 2'b0;
		else if  (clk_en == 1'b1)   exp_adj_dffe21 <= exp_adj_dffe21_wi;
	// synopsys translate_off
	initial
		exp_adj_dffe23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_adj_dffe23 <= 2'b0;
		else if  (clk_en == 1'b1)   exp_adj_dffe23 <= exp_adj_dffe23_wi;
	// synopsys translate_off
	initial
		exp_amb_mux_dffe13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_amb_mux_dffe13 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_amb_mux_dffe13 <= exp_amb_mux_dffe13_wi;
	// synopsys translate_off
	initial
		exp_amb_mux_dffe14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_amb_mux_dffe14 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_amb_mux_dffe14 <= exp_amb_mux_dffe14_wi;
	// synopsys translate_off
	initial
		exp_intermediate_res_dffe41 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_intermediate_res_dffe41 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_intermediate_res_dffe41 <= exp_intermediate_res_dffe41_wi;
	// synopsys translate_off
	initial
		exp_out_dffe5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_out_dffe5 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_out_dffe5 <= exp_out_dffe5_wi;
	// synopsys translate_off
	initial
		exp_res_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_res_dffe2 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_res_dffe2 <= exp_res_dffe2_wi;
	// synopsys translate_off
	initial
		exp_res_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_res_dffe21 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_res_dffe21 <= exp_res_dffe21_wi;
	// synopsys translate_off
	initial
		exp_res_dffe23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_res_dffe23 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_res_dffe23 <= exp_res_dffe23_wi;
	// synopsys translate_off
	initial
		exp_res_dffe27 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_res_dffe27 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_res_dffe27 <= exp_res_dffe27_wi;
	// synopsys translate_off
	initial
		exp_res_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_res_dffe3 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_res_dffe3 <= exp_res_dffe3_wi;
	// synopsys translate_off
	initial
		exp_res_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_res_dffe4 <= 11'b0;
		else if  (clk_en == 1'b1)   exp_res_dffe4 <= exp_res_dffe4_wi;
	// synopsys translate_off
	initial
		infinite_output_sign_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_output_sign_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_output_sign_dffe1 <= infinite_output_sign_dffe1_wi;
	// synopsys translate_off
	initial
		infinite_output_sign_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_output_sign_dffe2 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_output_sign_dffe2 <= infinite_output_sign_dffe2_wi;
	// synopsys translate_off
	initial
		infinite_output_sign_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_output_sign_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_output_sign_dffe21 <= infinite_output_sign_dffe21_wi;
	// synopsys translate_off
	initial
		infinite_output_sign_dffe23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_output_sign_dffe23 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_output_sign_dffe23 <= infinite_output_sign_dffe23_wi;
	// synopsys translate_off
	initial
		infinite_output_sign_dffe27 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_output_sign_dffe27 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_output_sign_dffe27 <= infinite_output_sign_dffe27_wi;
	// synopsys translate_off
	initial
		infinite_output_sign_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_output_sign_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_output_sign_dffe3 <= infinite_output_sign_dffe3_wi;
	// synopsys translate_off
	initial
		infinite_output_sign_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_output_sign_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_output_sign_dffe31 <= infinite_output_sign_dffe31_wi;
	// synopsys translate_off
	initial
		infinite_output_sign_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_output_sign_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_output_sign_dffe4 <= infinite_output_sign_dffe4_wi;
	// synopsys translate_off
	initial
		infinite_output_sign_dffe41 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_output_sign_dffe41 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_output_sign_dffe41 <= infinite_output_sign_dffe41_wi;
	// synopsys translate_off
	initial
		infinite_res_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_res_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_res_dffe3 <= infinite_res_dffe3_wi;
	// synopsys translate_off
	initial
		infinite_res_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_res_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_res_dffe4 <= infinite_res_dffe4_wi;
	// synopsys translate_off
	initial
		infinite_res_dffe41 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinite_res_dffe41 <= 1'b0;
		else if  (clk_en == 1'b1)   infinite_res_dffe41 <= infinite_res_dffe41_wi;
	// synopsys translate_off
	initial
		infinity_magnitude_sub_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_magnitude_sub_dffe2 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_magnitude_sub_dffe2 <= infinity_magnitude_sub_dffe2_wi;
	// synopsys translate_off
	initial
		infinity_magnitude_sub_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_magnitude_sub_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_magnitude_sub_dffe21 <= infinity_magnitude_sub_dffe21_wi;
	// synopsys translate_off
	initial
		infinity_magnitude_sub_dffe23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_magnitude_sub_dffe23 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_magnitude_sub_dffe23 <= infinity_magnitude_sub_dffe23_wi;
	// synopsys translate_off
	initial
		infinity_magnitude_sub_dffe27 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_magnitude_sub_dffe27 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_magnitude_sub_dffe27 <= infinity_magnitude_sub_dffe27_wi;
	// synopsys translate_off
	initial
		infinity_magnitude_sub_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_magnitude_sub_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_magnitude_sub_dffe3 <= infinity_magnitude_sub_dffe3_wi;
	// synopsys translate_off
	initial
		infinity_magnitude_sub_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_magnitude_sub_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_magnitude_sub_dffe31 <= infinity_magnitude_sub_dffe31_wi;
	// synopsys translate_off
	initial
		infinity_magnitude_sub_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_magnitude_sub_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_magnitude_sub_dffe4 <= infinity_magnitude_sub_dffe4_wi;
	// synopsys translate_off
	initial
		infinity_magnitude_sub_dffe41 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) infinity_magnitude_sub_dffe41 <= 1'b0;
		else if  (clk_en == 1'b1)   infinity_magnitude_sub_dffe41 <= infinity_magnitude_sub_dffe41_wi;
	// synopsys translate_off
	initial
		input_dataa_denormal_dffe11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_dataa_denormal_dffe11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_dataa_denormal_dffe11 <= input_dataa_denormal_dffe11_wi;
	// synopsys translate_off
	initial
		input_dataa_infinite_dffe11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_dataa_infinite_dffe11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_dataa_infinite_dffe11 <= input_dataa_infinite_dffe11_wi;
	// synopsys translate_off
	initial
		input_dataa_infinite_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_dataa_infinite_dffe12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_dataa_infinite_dffe12 <= input_dataa_infinite_dffe12_wi;
	// synopsys translate_off
	initial
		input_dataa_infinite_dffe13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_dataa_infinite_dffe13 <= 1'b0;
		else if  (clk_en == 1'b1)   input_dataa_infinite_dffe13 <= input_dataa_infinite_dffe13_wi;
	// synopsys translate_off
	initial
		input_dataa_infinite_dffe14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_dataa_infinite_dffe14 <= 1'b0;
		else if  (clk_en == 1'b1)   input_dataa_infinite_dffe14 <= input_dataa_infinite_dffe14_wi;
	// synopsys translate_off
	initial
		input_dataa_nan_dffe11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_dataa_nan_dffe11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_dataa_nan_dffe11 <= input_dataa_nan_dffe11_wi;
	// synopsys translate_off
	initial
		input_dataa_nan_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_dataa_nan_dffe12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_dataa_nan_dffe12 <= input_dataa_nan_dffe12_wi;
	// synopsys translate_off
	initial
		input_dataa_zero_dffe11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_dataa_zero_dffe11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_dataa_zero_dffe11 <= input_dataa_zero_dffe11_wi;
	// synopsys translate_off
	initial
		input_datab_denormal_dffe11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_datab_denormal_dffe11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_datab_denormal_dffe11 <= input_datab_denormal_dffe11_wi;
	// synopsys translate_off
	initial
		input_datab_infinite_dffe11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_datab_infinite_dffe11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_datab_infinite_dffe11 <= input_datab_infinite_dffe11_wi;
	// synopsys translate_off
	initial
		input_datab_infinite_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_datab_infinite_dffe12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_datab_infinite_dffe12 <= input_datab_infinite_dffe12_wi;
	// synopsys translate_off
	initial
		input_datab_infinite_dffe13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_datab_infinite_dffe13 <= 1'b0;
		else if  (clk_en == 1'b1)   input_datab_infinite_dffe13 <= input_datab_infinite_dffe13_wi;
	// synopsys translate_off
	initial
		input_datab_infinite_dffe14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_datab_infinite_dffe14 <= 1'b0;
		else if  (clk_en == 1'b1)   input_datab_infinite_dffe14 <= input_datab_infinite_dffe14_wi;
	// synopsys translate_off
	initial
		input_datab_nan_dffe11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_datab_nan_dffe11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_datab_nan_dffe11 <= input_datab_nan_dffe11_wi;
	// synopsys translate_off
	initial
		input_datab_nan_dffe12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_datab_nan_dffe12 <= 1'b0;
		else if  (clk_en == 1'b1)   input_datab_nan_dffe12 <= input_datab_nan_dffe12_wi;
	// synopsys translate_off
	initial
		input_datab_zero_dffe11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_datab_zero_dffe11 <= 1'b0;
		else if  (clk_en == 1'b1)   input_datab_zero_dffe11 <= input_datab_zero_dffe11_wi;
	// synopsys translate_off
	initial
		input_is_infinite_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinite_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinite_dffe1 <= input_is_infinite_dffe1_wi;
	// synopsys translate_off
	initial
		input_is_infinite_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinite_dffe2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinite_dffe2 <= input_is_infinite_dffe2_wi;
	// synopsys translate_off
	initial
		input_is_infinite_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinite_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinite_dffe21 <= input_is_infinite_dffe21_wi;
	// synopsys translate_off
	initial
		input_is_infinite_dffe23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinite_dffe23 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinite_dffe23 <= input_is_infinite_dffe23_wi;
	// synopsys translate_off
	initial
		input_is_infinite_dffe27 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinite_dffe27 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinite_dffe27 <= input_is_infinite_dffe27_wi;
	// synopsys translate_off
	initial
		input_is_infinite_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinite_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinite_dffe3 <= input_is_infinite_dffe3_wi;
	// synopsys translate_off
	initial
		input_is_infinite_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinite_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinite_dffe31 <= input_is_infinite_dffe31_wi;
	// synopsys translate_off
	initial
		input_is_infinite_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinite_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinite_dffe4 <= input_is_infinite_dffe4_wi;
	// synopsys translate_off
	initial
		input_is_infinite_dffe41 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinite_dffe41 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinite_dffe41 <= input_is_infinite_dffe41_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe1 <= input_is_nan_dffe1_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe13 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe13 <= input_is_nan_dffe13_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe14 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe14 <= input_is_nan_dffe14_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe2 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe2 <= input_is_nan_dffe2_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe21 <= input_is_nan_dffe21_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe23 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe23 <= input_is_nan_dffe23_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe27 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe27 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe27 <= input_is_nan_dffe27_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe3 <= input_is_nan_dffe3_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe31 <= input_is_nan_dffe31_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe4 <= input_is_nan_dffe4_wi;
	// synopsys translate_off
	initial
		input_is_nan_dffe41 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe41 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe41 <= input_is_nan_dffe41_wi;
	// synopsys translate_off
	initial
		man_add_sub_res_mag_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_add_sub_res_mag_dffe21 <= 55'b0;
		else if  (clk_en == 1'b1)   man_add_sub_res_mag_dffe21 <= man_add_sub_res_mag_dffe21_wi;
	// synopsys translate_off
	initial
		man_add_sub_res_mag_dffe23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_add_sub_res_mag_dffe23 <= 55'b0;
		else if  (clk_en == 1'b1)   man_add_sub_res_mag_dffe23 <= man_add_sub_res_mag_dffe23_wi;
	// synopsys translate_off
	initial
		man_add_sub_res_mag_dffe27 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_add_sub_res_mag_dffe27 <= 57'b0;
		else if  (clk_en == 1'b1)   man_add_sub_res_mag_dffe27 <= man_add_sub_res_mag_dffe27_wi;
	// synopsys translate_off
	initial
		man_add_sub_res_sign_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_add_sub_res_sign_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   man_add_sub_res_sign_dffe21 <= man_add_sub_res_sign_dffe27_wo;
	// synopsys translate_off
	initial
		man_add_sub_res_sign_dffe23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_add_sub_res_sign_dffe23 <= 1'b0;
		else if  (clk_en == 1'b1)   man_add_sub_res_sign_dffe23 <= man_add_sub_res_sign_dffe23_wi;
	// synopsys translate_off
	initial
		man_add_sub_res_sign_dffe27 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_add_sub_res_sign_dffe27 <= 1'b0;
		else if  (clk_en == 1'b1)   man_add_sub_res_sign_dffe27 <= man_add_sub_res_sign_dffe27_wi;
	// synopsys translate_off
	initial
		man_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_dffe31 <= 55'b0;
		else if  (clk_en == 1'b1)   man_dffe31 <= man_add_sub_res_mag_dffe26_wo;
	// synopsys translate_off
	initial
		man_leading_zeros_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_leading_zeros_dffe31 <= 6'b0;
		else if  (clk_en == 1'b1)   man_leading_zeros_dffe31 <= man_leading_zeros_dffe31_wi;
	// synopsys translate_off
	initial
		man_out_dffe5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_out_dffe5 <= 52'b0;
		else if  (clk_en == 1'b1)   man_out_dffe5 <= man_out_dffe5_wi;
	// synopsys translate_off
	initial
		man_res_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_res_dffe4 <= 52'b0;
		else if  (clk_en == 1'b1)   man_res_dffe4 <= man_res_dffe4_wi;
	// synopsys translate_off
	initial
		man_res_is_not_zero_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_res_is_not_zero_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   man_res_is_not_zero_dffe3 <= man_res_is_not_zero_dffe3_wi;
	// synopsys translate_off
	initial
		man_res_is_not_zero_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_res_is_not_zero_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   man_res_is_not_zero_dffe31 <= man_res_is_not_zero_dffe31_wi;
	// synopsys translate_off
	initial
		man_res_is_not_zero_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_res_is_not_zero_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   man_res_is_not_zero_dffe4 <= man_res_is_not_zero_dffe4_wi;
	// synopsys translate_off
	initial
		man_res_is_not_zero_dffe41 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_res_is_not_zero_dffe41 <= 1'b0;
		else if  (clk_en == 1'b1)   man_res_is_not_zero_dffe41 <= man_res_is_not_zero_dffe41_wi;
	// synopsys translate_off
	initial
		man_res_not_zero_dffe23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_res_not_zero_dffe23 <= 1'b0;
		else if  (clk_en == 1'b1)   man_res_not_zero_dffe23 <= man_res_not_zero_dffe23_wi;
	// synopsys translate_off
	initial
		man_res_rounding_add_sub_result_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_res_rounding_add_sub_result_reg <= 55'b0;
		else if  (clk_en == 1'b1)   man_res_rounding_add_sub_result_reg <= {(({27{(~ wire_man_res_rounding_add_sub_lower_cout)}} & adder_upper_w) | ({27{wire_man_res_rounding_add_sub_lower_cout}} & wire_man_res_rounding_add_sub_upper1_result)), wire_man_res_rounding_add_sub_lower_result};
	// synopsys translate_off
	initial
		man_smaller_dffe13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_smaller_dffe13 <= 53'b0;
		else if  (clk_en == 1'b1)   man_smaller_dffe13 <= man_smaller_dffe13_wi;
	// synopsys translate_off
	initial
		need_complement_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) need_complement_dffe2 <= 1'b0;
		else if  (clk_en == 1'b1)   need_complement_dffe2 <= need_complement_dffe2_wi;
	// synopsys translate_off
	initial
		round_bit_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) round_bit_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   round_bit_dffe21 <= round_bit_dffe21_wi;
	// synopsys translate_off
	initial
		round_bit_dffe23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) round_bit_dffe23 <= 1'b0;
		else if  (clk_en == 1'b1)   round_bit_dffe23 <= round_bit_dffe23_wi;
	// synopsys translate_off
	initial
		round_bit_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) round_bit_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   round_bit_dffe3 <= round_bit_dffe3_wi;
	// synopsys translate_off
	initial
		round_bit_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) round_bit_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   round_bit_dffe31 <= round_bit_dffe31_wi;
	// synopsys translate_off
	initial
		rounded_res_infinity_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rounded_res_infinity_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   rounded_res_infinity_dffe4 <= rounded_res_infinity_dffe4_wi;
	// synopsys translate_off
	initial
		rshift_distance_dffe13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rshift_distance_dffe13 <= 6'b0;
		else if  (clk_en == 1'b1)   rshift_distance_dffe13 <= rshift_distance_dffe13_wi;
	// synopsys translate_off
	initial
		rshift_distance_dffe14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rshift_distance_dffe14 <= 6'b0;
		else if  (clk_en == 1'b1)   rshift_distance_dffe14 <= rshift_distance_dffe14_wi;
	// synopsys translate_off
	initial
		sign_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_dffe31 <= sign_dffe31_wi;
	// synopsys translate_off
	initial
		sign_out_dffe5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_out_dffe5 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_out_dffe5 <= sign_out_dffe5_wi;
	// synopsys translate_off
	initial
		sign_res_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_res_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_res_dffe3 <= sign_res_dffe3_wi;
	// synopsys translate_off
	initial
		sign_res_dffe4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_res_dffe4 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_res_dffe4 <= sign_res_dffe4_wi;
	// synopsys translate_off
	initial
		sign_res_dffe41 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_res_dffe41 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_res_dffe41 <= sign_res_dffe41_wi;
	// synopsys translate_off
	initial
		sticky_bit_dffe1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sticky_bit_dffe1 <= 1'b0;
		else if  (clk_en == 1'b1)   sticky_bit_dffe1 <= sticky_bit_dffe1_wi;
	// synopsys translate_off
	initial
		sticky_bit_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sticky_bit_dffe2 <= 1'b0;
		else if  (clk_en == 1'b1)   sticky_bit_dffe2 <= sticky_bit_dffe2_wi;
	// synopsys translate_off
	initial
		sticky_bit_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sticky_bit_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   sticky_bit_dffe21 <= sticky_bit_dffe21_wi;
	// synopsys translate_off
	initial
		sticky_bit_dffe23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sticky_bit_dffe23 <= 1'b0;
		else if  (clk_en == 1'b1)   sticky_bit_dffe23 <= sticky_bit_dffe23_wi;
	// synopsys translate_off
	initial
		sticky_bit_dffe27 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sticky_bit_dffe27 <= 1'b0;
		else if  (clk_en == 1'b1)   sticky_bit_dffe27 <= sticky_bit_dffe27_wi;
	// synopsys translate_off
	initial
		sticky_bit_dffe3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sticky_bit_dffe3 <= 1'b0;
		else if  (clk_en == 1'b1)   sticky_bit_dffe3 <= sticky_bit_dffe3_wi;
	// synopsys translate_off
	initial
		sticky_bit_dffe31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sticky_bit_dffe31 <= 1'b0;
		else if  (clk_en == 1'b1)   sticky_bit_dffe31 <= sticky_bit_dffe31_wi;
	// synopsys translate_off
	initial
		zero_man_sign_dffe2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_man_sign_dffe2 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_man_sign_dffe2 <= zero_man_sign_dffe2_wi;
	// synopsys translate_off
	initial
		zero_man_sign_dffe21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_man_sign_dffe21 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_man_sign_dffe21 <= zero_man_sign_dffe21_wi;
	// synopsys translate_off
	initial
		zero_man_sign_dffe23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_man_sign_dffe23 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_man_sign_dffe23 <= zero_man_sign_dffe23_wi;
	// synopsys translate_off
	initial
		zero_man_sign_dffe27 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_man_sign_dffe27 <= 1'b0;
		else if  (clk_en == 1'b1)   zero_man_sign_dffe27 <= zero_man_sign_dffe27_wi;
	lpm_add_sub   add_sub1
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(aligned_dataa_exp_w),
	.datab(aligned_datab_exp_w),
	.overflow(),
	.result(wire_add_sub1_result)
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
		add_sub1.lpm_direction = "SUB",
		add_sub1.lpm_pipeline = 1,
		add_sub1.lpm_representation = "SIGNED",
		add_sub1.lpm_width = 12,
		add_sub1.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub2
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(aligned_datab_exp_w),
	.datab(aligned_dataa_exp_w),
	.overflow(),
	.result(wire_add_sub2_result)
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
		add_sub2.lpm_direction = "SUB",
		add_sub2.lpm_pipeline = 1,
		add_sub2.lpm_representation = "SIGNED",
		add_sub2.lpm_width = 12,
		add_sub2.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub3
	(
	.cout(),
	.dataa(sticky_bit_cnt_dataa_w),
	.datab(sticky_bit_cnt_datab_w),
	.overflow(),
	.result(wire_add_sub3_result)
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
		add_sub3.lpm_direction = "SUB",
		add_sub3.lpm_representation = "SIGNED",
		add_sub3.lpm_width = 7,
		add_sub3.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub4
	(
	.cout(),
	.dataa(exp_adjustment_add_sub_dataa_w),
	.datab(exp_adjustment_add_sub_datab_w),
	.overflow(),
	.result(wire_add_sub4_result)
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
		add_sub4.lpm_direction = "ADD",
		add_sub4.lpm_representation = "SIGNED",
		add_sub4.lpm_width = 12,
		add_sub4.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub5
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(exp_adjustment2_add_sub_dataa_w),
	.datab(exp_adjustment2_add_sub_datab_w),
	.overflow(),
	.result(wire_add_sub5_result)
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
		add_sub5.lpm_direction = "ADD",
		add_sub5.lpm_pipeline = 1,
		add_sub5.lpm_representation = "SIGNED",
		add_sub5.lpm_width = 12,
		add_sub5.lpm_type = "lpm_add_sub";
	lpm_add_sub   add_sub6
	(
	.cout(),
	.dataa(exp_res_rounding_adder_dataa_w),
	.datab(exp_rounding_adjustment_w),
	.overflow(),
	.result(wire_add_sub6_result)
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
		add_sub6.lpm_direction = "ADD",
		add_sub6.lpm_representation = "SIGNED",
		add_sub6.lpm_width = 12,
		add_sub6.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_2comp_res_lower
	(
	.aclr(aclr),
	.add_sub(add_sub_w2),
	.cin(borrow_w),
	.clken(clk_en),
	.clock(clock),
	.cout(wire_man_2comp_res_lower_cout),
	.dataa(man_2comp_res_dataa_w[28:0]),
	.datab(man_2comp_res_datab_w[28:0]),
	.overflow(),
	.result(wire_man_2comp_res_lower_result));
	defparam
		man_2comp_res_lower.lpm_pipeline = 1,
		man_2comp_res_lower.lpm_representation = "SIGNED",
		man_2comp_res_lower.lpm_width = 29,
		man_2comp_res_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_2comp_res_upper0
	(
	.aclr(aclr),
	.add_sub(add_sub_w2),
	.cin(1'b0),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(man_2comp_res_dataa_w[56:29]),
	.datab(man_2comp_res_datab_w[56:29]),
	.overflow(),
	.result(wire_man_2comp_res_upper0_result));
	defparam
		man_2comp_res_upper0.lpm_pipeline = 1,
		man_2comp_res_upper0.lpm_representation = "SIGNED",
		man_2comp_res_upper0.lpm_width = 28,
		man_2comp_res_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_2comp_res_upper1
	(
	.aclr(aclr),
	.add_sub(add_sub_w2),
	.cin(1'b1),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(man_2comp_res_dataa_w[56:29]),
	.datab(man_2comp_res_datab_w[56:29]),
	.overflow(),
	.result(wire_man_2comp_res_upper1_result));
	defparam
		man_2comp_res_upper1.lpm_pipeline = 1,
		man_2comp_res_upper1.lpm_representation = "SIGNED",
		man_2comp_res_upper1.lpm_width = 28,
		man_2comp_res_upper1.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_add_sub_lower
	(
	.aclr(aclr),
	.add_sub(add_sub_w2),
	.cin(borrow_w),
	.clken(clk_en),
	.clock(clock),
	.cout(wire_man_add_sub_lower_cout),
	.dataa(man_add_sub_dataa_w[28:0]),
	.datab(man_add_sub_datab_w[28:0]),
	.overflow(),
	.result(wire_man_add_sub_lower_result));
	defparam
		man_add_sub_lower.lpm_pipeline = 1,
		man_add_sub_lower.lpm_representation = "SIGNED",
		man_add_sub_lower.lpm_width = 29,
		man_add_sub_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_add_sub_upper0
	(
	.aclr(aclr),
	.add_sub(add_sub_w2),
	.cin(1'b0),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(man_add_sub_dataa_w[56:29]),
	.datab(man_add_sub_datab_w[56:29]),
	.overflow(),
	.result(wire_man_add_sub_upper0_result));
	defparam
		man_add_sub_upper0.lpm_pipeline = 1,
		man_add_sub_upper0.lpm_representation = "SIGNED",
		man_add_sub_upper0.lpm_width = 28,
		man_add_sub_upper0.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_add_sub_upper1
	(
	.aclr(aclr),
	.add_sub(add_sub_w2),
	.cin(1'b1),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa(man_add_sub_dataa_w[56:29]),
	.datab(man_add_sub_datab_w[56:29]),
	.overflow(),
	.result(wire_man_add_sub_upper1_result));
	defparam
		man_add_sub_upper1.lpm_pipeline = 1,
		man_add_sub_upper1.lpm_representation = "SIGNED",
		man_add_sub_upper1.lpm_width = 28,
		man_add_sub_upper1.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_res_rounding_add_sub_lower
	(
	.cout(wire_man_res_rounding_add_sub_lower_cout),
	.dataa(man_intermediate_res_w[27:0]),
	.datab(man_res_rounding_add_sub_datab_w[27:0]),
	.overflow(),
	.result(wire_man_res_rounding_add_sub_lower_result)
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
		man_res_rounding_add_sub_lower.lpm_direction = "ADD",
		man_res_rounding_add_sub_lower.lpm_representation = "SIGNED",
		man_res_rounding_add_sub_lower.lpm_width = 28,
		man_res_rounding_add_sub_lower.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_res_rounding_add_sub_upper1
	(
	.cin(1'b1),
	.cout(),
	.dataa(man_intermediate_res_w[54:28]),
	.datab(man_res_rounding_add_sub_datab_w[54:28]),
	.overflow(),
	.result(wire_man_res_rounding_add_sub_upper1_result)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifdef FORMAL_VERIFICATION
	`else
	// synopsys translate_on
	`endif
	);
	defparam
		man_res_rounding_add_sub_upper1.lpm_direction = "ADD",
		man_res_rounding_add_sub_upper1.lpm_representation = "SIGNED",
		man_res_rounding_add_sub_upper1.lpm_width = 27,
		man_res_rounding_add_sub_upper1.lpm_type = "lpm_add_sub";
	lpm_compare   trailing_zeros_limit_comparator
	(
	.aeb(),
	.agb(wire_trailing_zeros_limit_comparator_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(sticky_bit_cnt_res_w),
	.datab(trailing_zeros_limit_w)
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
		trailing_zeros_limit_comparator.lpm_representation = "SIGNED",
		trailing_zeros_limit_comparator.lpm_width = 7,
		trailing_zeros_limit_comparator.lpm_type = "lpm_compare";
	assign
		aclr = 1'b0,
		add_sub_dffe25_wi = add_sub_w2,
		add_sub_dffe25_wo = add_sub_dffe25_wi,
		add_sub_w2 = (~ (dataa_sign_dffe1_wo ^ datab_sign_dffe1_wo)),
		adder_upper_w = man_intermediate_res_w[54:28],
		aligned_dataa_exp_dffe12_wi = aligned_dataa_exp_w,
		aligned_dataa_exp_dffe12_wo = aligned_dataa_exp_dffe12,
		aligned_dataa_exp_dffe13_wi = aligned_dataa_exp_dffe12_wo,
		aligned_dataa_exp_dffe13_wo = aligned_dataa_exp_dffe13,
		aligned_dataa_exp_dffe14_wi = aligned_dataa_exp_dffe13_wo,
		aligned_dataa_exp_dffe14_wo = aligned_dataa_exp_dffe14,
		aligned_dataa_exp_dffe15_wi = aligned_dataa_exp_dffe14_wo,
		aligned_dataa_exp_dffe15_wo = aligned_dataa_exp_dffe15_wi,
		aligned_dataa_exp_w = {1'b0, ({11{(~ input_dataa_denormal_dffe11_wo)}} & dataa_dffe11_wo[62:52])},
		aligned_dataa_man_dffe12_wi = aligned_dataa_man_w[54:2],
		aligned_dataa_man_dffe12_wo = aligned_dataa_man_dffe12,
		aligned_dataa_man_dffe13_wi = aligned_dataa_man_dffe12_wo,
		aligned_dataa_man_dffe13_wo = aligned_dataa_man_dffe13,
		aligned_dataa_man_dffe14_wi = aligned_dataa_man_dffe13_wo,
		aligned_dataa_man_dffe14_wo = aligned_dataa_man_dffe14,
		aligned_dataa_man_dffe15_w = {aligned_dataa_man_dffe15_wo, 2'b00},
		aligned_dataa_man_dffe15_wi = aligned_dataa_man_dffe14_wo,
		aligned_dataa_man_dffe15_wo = aligned_dataa_man_dffe15_wi,
		aligned_dataa_man_w = {(((~ input_dataa_infinite_dffe11_wo) & (~ input_dataa_denormal_dffe11_wo)) & (~ input_dataa_zero_dffe11_wo)), ({52{(~ input_dataa_denormal_dffe11_wo)}} & dataa_dffe11_wo[51:0]), 2'b00},
		aligned_dataa_sign_dffe12_wi = aligned_dataa_sign_w,
		aligned_dataa_sign_dffe12_wo = aligned_dataa_sign_dffe12,
		aligned_dataa_sign_dffe13_wi = aligned_dataa_sign_dffe12_wo,
		aligned_dataa_sign_dffe13_wo = aligned_dataa_sign_dffe13,
		aligned_dataa_sign_dffe14_wi = aligned_dataa_sign_dffe13_wo,
		aligned_dataa_sign_dffe14_wo = aligned_dataa_sign_dffe14,
		aligned_dataa_sign_dffe15_wi = aligned_dataa_sign_dffe14_wo,
		aligned_dataa_sign_dffe15_wo = aligned_dataa_sign_dffe15_wi,
		aligned_dataa_sign_w = dataa_dffe11_wo[63],
		aligned_datab_exp_dffe12_wi = aligned_datab_exp_w,
		aligned_datab_exp_dffe12_wo = aligned_datab_exp_dffe12,
		aligned_datab_exp_dffe13_wi = aligned_datab_exp_dffe12_wo,
		aligned_datab_exp_dffe13_wo = aligned_datab_exp_dffe13,
		aligned_datab_exp_dffe14_wi = aligned_datab_exp_dffe13_wo,
		aligned_datab_exp_dffe14_wo = aligned_datab_exp_dffe14,
		aligned_datab_exp_dffe15_wi = aligned_datab_exp_dffe14_wo,
		aligned_datab_exp_dffe15_wo = aligned_datab_exp_dffe15_wi,
		aligned_datab_exp_w = {1'b0, ({11{(~ input_datab_denormal_dffe11_wo)}} & datab_dffe11_wo[62:52])},
		aligned_datab_man_dffe12_wi = aligned_datab_man_w[54:2],
		aligned_datab_man_dffe12_wo = aligned_datab_man_dffe12,
		aligned_datab_man_dffe13_wi = aligned_datab_man_dffe12_wo,
		aligned_datab_man_dffe13_wo = aligned_datab_man_dffe13,
		aligned_datab_man_dffe14_wi = aligned_datab_man_dffe13_wo,
		aligned_datab_man_dffe14_wo = aligned_datab_man_dffe14,
		aligned_datab_man_dffe15_w = {aligned_datab_man_dffe15_wo, 2'b00},
		aligned_datab_man_dffe15_wi = aligned_datab_man_dffe14_wo,
		aligned_datab_man_dffe15_wo = aligned_datab_man_dffe15_wi,
		aligned_datab_man_w = {(((~ input_datab_infinite_dffe11_wo) & (~ input_datab_denormal_dffe11_wo)) & (~ input_datab_zero_dffe11_wo)), ({52{(~ input_datab_denormal_dffe11_wo)}} & datab_dffe11_wo[51:0]), 2'b00},
		aligned_datab_sign_dffe12_wi = aligned_datab_sign_w,
		aligned_datab_sign_dffe12_wo = aligned_datab_sign_dffe12,
		aligned_datab_sign_dffe13_wi = aligned_datab_sign_dffe12_wo,
		aligned_datab_sign_dffe13_wo = aligned_datab_sign_dffe13,
		aligned_datab_sign_dffe14_wi = aligned_datab_sign_dffe13_wo,
		aligned_datab_sign_dffe14_wo = aligned_datab_sign_dffe14,
		aligned_datab_sign_dffe15_wi = aligned_datab_sign_dffe14_wo,
		aligned_datab_sign_dffe15_wo = aligned_datab_sign_dffe15_wi,
		aligned_datab_sign_w = datab_dffe11_wo[63],
		borrow_w = ((~ sticky_bit_dffe1_wo) & (~ add_sub_w2)),
		both_inputs_are_infinite_dffe1_wi = (input_dataa_infinite_dffe15_wo & input_datab_infinite_dffe15_wo),
		both_inputs_are_infinite_dffe1_wo = both_inputs_are_infinite_dffe1,
		both_inputs_are_infinite_dffe25_wi = both_inputs_are_infinite_dffe1_wo,
		both_inputs_are_infinite_dffe25_wo = both_inputs_are_infinite_dffe25_wi,
		clk_en = 1'b1,
		data_exp_dffe1_wi = (({11{(~ exp_amb_mux_dffe15_wo)}} & aligned_dataa_exp_dffe15_wo[10:0]) | ({11{exp_amb_mux_dffe15_wo}} & aligned_datab_exp_dffe15_wo[10:0])),
		data_exp_dffe1_wo = data_exp_dffe1,
		dataa_dffe11_wi = dataa,
		dataa_dffe11_wo = dataa_dffe11,
		dataa_man_dffe1_wi = (({55{(~ exp_amb_mux_dffe15_wo)}} & aligned_dataa_man_dffe15_w) | ({55{exp_amb_mux_dffe15_wo}} & wire_rbarrel_shift_result)),
		dataa_man_dffe1_wo = dataa_man_dffe1,
		dataa_sign_dffe1_wi = aligned_dataa_sign_dffe15_wo,
		dataa_sign_dffe1_wo = dataa_sign_dffe1,
		dataa_sign_dffe25_wi = dataa_sign_dffe1_wo,
		dataa_sign_dffe25_wo = dataa_sign_dffe25_wi,
		datab_dffe11_wi = datab,
		datab_dffe11_wo = datab_dffe11,
		datab_man_dffe1_wi = (({55{(~ exp_amb_mux_dffe15_wo)}} & wire_rbarrel_shift_result) | ({55{exp_amb_mux_dffe15_wo}} & aligned_datab_man_dffe15_w)),
		datab_man_dffe1_wo = datab_man_dffe1,
		datab_sign_dffe1_wi = aligned_datab_sign_dffe15_wo,
		datab_sign_dffe1_wo = datab_sign_dffe1,
		denormal_flag_w = ((((~ force_nan_w) & (~ force_infinity_w)) & (~ force_zero_w)) & denormal_res_dffe4_wo),
		denormal_res_dffe32_wi = denormal_result_w,
		denormal_res_dffe32_wo = denormal_res_dffe32_wi,
		denormal_res_dffe33_wi = denormal_res_dffe32_wo,
		denormal_res_dffe33_wo = denormal_res_dffe33_wi,
		denormal_res_dffe3_wi = denormal_res_dffe33_wo,
		denormal_res_dffe3_wo = denormal_res_dffe3,
		denormal_res_dffe41_wi = denormal_res_dffe42_wo,
		denormal_res_dffe41_wo = denormal_res_dffe41,
		denormal_res_dffe42_wi = denormal_res_dffe3_wo,
		denormal_res_dffe42_wo = denormal_res_dffe42_wi,
		denormal_res_dffe4_wi = denormal_res_dffe41_wo,
		denormal_res_dffe4_wo = denormal_res_dffe4,
		denormal_result_w = ((~ exp_res_not_zero_w[11]) | exp_adjustment2_add_sub_w[11]),
		exp_a_all_one_w = {(dataa[62] & exp_a_all_one_w[9]), (dataa[61] & exp_a_all_one_w[8]), (dataa[60] & exp_a_all_one_w[7]), (dataa[59] & exp_a_all_one_w[6]), (dataa[58] & exp_a_all_one_w[5]), (dataa[57] & exp_a_all_one_w[4]), (dataa[56] & exp_a_all_one_w[3]), (dataa[55] & exp_a_all_one_w[2]), (dataa[54] & exp_a_all_one_w[1]), (dataa[53] & exp_a_all_one_w[0]), dataa[52]},
		exp_a_not_zero_w = {(dataa[62] | exp_a_not_zero_w[9]), (dataa[61] | exp_a_not_zero_w[8]), (dataa[60] | exp_a_not_zero_w[7]), (dataa[59] | exp_a_not_zero_w[6]), (dataa[58] | exp_a_not_zero_w[5]), (dataa[57] | exp_a_not_zero_w[4]), (dataa[56] | exp_a_not_zero_w[3]), (dataa[55] | exp_a_not_zero_w[2]), (dataa[54] | exp_a_not_zero_w[1]), (dataa[53] | exp_a_not_zero_w[0]), dataa[52]},
		exp_adj_0pads = {10{1'b0}},
		exp_adj_dffe21_wi = (({2{man_add_sub_res_mag_dffe27_wo[55]}} & exp_adjust_by_add2) | ({2{(~ man_add_sub_res_mag_dffe27_wo[55])}} & exp_adjust_by_add1)),
		exp_adj_dffe21_wo = exp_adj_dffe21,
		exp_adj_dffe23_wi = exp_adj_dffe21_wo,
		exp_adj_dffe23_wo = exp_adj_dffe23,
		exp_adj_dffe26_wi = exp_adj_dffe23_wo,
		exp_adj_dffe26_wo = exp_adj_dffe26_wi,
		exp_adjust_by_add1 = 2'b01,
		exp_adjust_by_add2 = 2'b10,
		exp_adjustment2_add_sub_dataa_w = exp_value,
		exp_adjustment2_add_sub_datab_w = exp_adjustment_add_sub_w,
		exp_adjustment2_add_sub_w = wire_add_sub5_result,
		exp_adjustment_add_sub_dataa_w = {priority_encoder_1pads_w, wire_leading_zeroes_cnt_q},
		exp_adjustment_add_sub_datab_w = {exp_adj_0pads, exp_adj_dffe26_wo},
		exp_adjustment_add_sub_w = wire_add_sub4_result,
		exp_all_ones_w = {11{1'b1}},
		exp_all_zeros_w = {11{1'b0}},
		exp_amb_mux_dffe13_wi = exp_amb_mux_w,
		exp_amb_mux_dffe13_wo = exp_amb_mux_dffe13,
		exp_amb_mux_dffe14_wi = exp_amb_mux_dffe13_wo,
		exp_amb_mux_dffe14_wo = exp_amb_mux_dffe14,
		exp_amb_mux_dffe15_wi = exp_amb_mux_dffe14_wo,
		exp_amb_mux_dffe15_wo = exp_amb_mux_dffe15_wi,
		exp_amb_mux_w = exp_amb_w[11],
		exp_amb_w = wire_add_sub1_result,
		exp_b_all_one_w = {(datab[62] & exp_b_all_one_w[9]), (datab[61] & exp_b_all_one_w[8]), (datab[60] & exp_b_all_one_w[7]), (datab[59] & exp_b_all_one_w[6]), (datab[58] & exp_b_all_one_w[5]), (datab[57] & exp_b_all_one_w[4]), (datab[56] & exp_b_all_one_w[3]), (datab[55] & exp_b_all_one_w[2]), (datab[54] & exp_b_all_one_w[1]), (datab[53] & exp_b_all_one_w[0]), datab[52]},
		exp_b_not_zero_w = {(datab[62] | exp_b_not_zero_w[9]), (datab[61] | exp_b_not_zero_w[8]), (datab[60] | exp_b_not_zero_w[7]), (datab[59] | exp_b_not_zero_w[6]), (datab[58] | exp_b_not_zero_w[5]), (datab[57] | exp_b_not_zero_w[4]), (datab[56] | exp_b_not_zero_w[3]), (datab[55] | exp_b_not_zero_w[2]), (datab[54] | exp_b_not_zero_w[1]), (datab[53] | exp_b_not_zero_w[0]), datab[52]},
		exp_bma_w = wire_add_sub2_result,
		exp_diff_abs_exceed_max_w = {(exp_diff_abs_exceed_max_w[3] | exp_diff_abs_w[10]), (exp_diff_abs_exceed_max_w[2] | exp_diff_abs_w[9]), (exp_diff_abs_exceed_max_w[1] | exp_diff_abs_w[8]), (exp_diff_abs_exceed_max_w[0] | exp_diff_abs_w[7]), exp_diff_abs_w[6]},
		exp_diff_abs_max_w = {6{1'b1}},
		exp_diff_abs_w = (({11{(~ exp_amb_mux_w)}} & exp_amb_w[10:0]) | ({11{exp_amb_mux_w}} & exp_bma_w[10:0])),
		exp_intermediate_res_dffe41_wi = exp_intermediate_res_dffe42_wo,
		exp_intermediate_res_dffe41_wo = exp_intermediate_res_dffe41,
		exp_intermediate_res_dffe42_wi = exp_intermediate_res_w,
		exp_intermediate_res_dffe42_wo = exp_intermediate_res_dffe42_wi,
		exp_intermediate_res_w = exp_res_dffe3_wo,
		exp_out_dffe5_wi = (({11{force_nan_w}} & exp_all_ones_w) | ({11{(~ force_nan_w)}} & (({11{force_infinity_w}} & exp_all_ones_w) | ({11{(~ force_infinity_w)}} & (({11{(force_zero_w | denormal_flag_w)}} & exp_all_zeros_w) | ({11{(~ (force_zero_w | denormal_flag_w))}} & exp_res_dffe4_wo)))))),
		exp_out_dffe5_wo = exp_out_dffe5,
		exp_res_dffe21_wi = exp_res_dffe27_wo,
		exp_res_dffe21_wo = exp_res_dffe21,
		exp_res_dffe22_wi = exp_res_dffe2_wo,
		exp_res_dffe22_wo = exp_res_dffe22_wi,
		exp_res_dffe23_wi = exp_res_dffe21_wo,
		exp_res_dffe23_wo = exp_res_dffe23,
		exp_res_dffe25_wi = data_exp_dffe1_wo,
		exp_res_dffe25_wo = exp_res_dffe25_wi,
		exp_res_dffe26_wi = exp_res_dffe23_wo,
		exp_res_dffe26_wo = exp_res_dffe26_wi,
		exp_res_dffe27_wi = exp_res_dffe22_wo,
		exp_res_dffe27_wo = exp_res_dffe27,
		exp_res_dffe2_wi = exp_res_dffe25_wo,
		exp_res_dffe2_wo = exp_res_dffe2,
		exp_res_dffe32_wi = ({11{(~ denormal_result_w)}} & exp_adjustment2_add_sub_w[10:0]),
		exp_res_dffe32_wo = exp_res_dffe32_wi,
		exp_res_dffe33_wi = exp_res_dffe32_wo,
		exp_res_dffe33_wo = exp_res_dffe33_wi,
		exp_res_dffe3_wi = exp_res_dffe33_wo,
		exp_res_dffe3_wo = exp_res_dffe3,
		exp_res_dffe4_wi = exp_rounded_res_w,
		exp_res_dffe4_wo = exp_res_dffe4,
		exp_res_max_w = {(exp_res_max_w[9] & exp_adjustment2_add_sub_w[10]), (exp_res_max_w[8] & exp_adjustment2_add_sub_w[9]), (exp_res_max_w[7] & exp_adjustment2_add_sub_w[8]), (exp_res_max_w[6] & exp_adjustment2_add_sub_w[7]), (exp_res_max_w[5] & exp_adjustment2_add_sub_w[6]), (exp_res_max_w[4] & exp_adjustment2_add_sub_w[5]), (exp_res_max_w[3] & exp_adjustment2_add_sub_w[4]), (exp_res_max_w[2] & exp_adjustment2_add_sub_w[3]), (exp_res_max_w[1] & exp_adjustment2_add_sub_w[2]), (exp_res_max_w[0] & exp_adjustment2_add_sub_w[1]), exp_adjustment2_add_sub_w[0]},
		exp_res_not_zero_w = {(exp_res_not_zero_w[10] | exp_adjustment2_add_sub_w[11]), (exp_res_not_zero_w[9] | exp_adjustment2_add_sub_w[10]), (exp_res_not_zero_w[8] | exp_adjustment2_add_sub_w[9]), (exp_res_not_zero_w[7] | exp_adjustment2_add_sub_w[8]), (exp_res_not_zero_w[6] | exp_adjustment2_add_sub_w[7]), (exp_res_not_zero_w[5] | exp_adjustment2_add_sub_w[6]), (exp_res_not_zero_w[4] | exp_adjustment2_add_sub_w[5]), (exp_res_not_zero_w[3] | exp_adjustment2_add_sub_w[4]), (exp_res_not_zero_w[2] | exp_adjustment2_add_sub_w[3]), (exp_res_not_zero_w[1] | exp_adjustment2_add_sub_w[2]), (exp_res_not_zero_w[0] | exp_adjustment2_add_sub_w[1]), exp_adjustment2_add_sub_w[0]},
		exp_res_rounding_adder_dataa_w = {1'b0, exp_intermediate_res_dffe41_wo},
		exp_res_rounding_adder_w = wire_add_sub6_result,
		exp_rounded_res_infinity_w = exp_rounded_res_max_w[10],
		exp_rounded_res_max_w = {(exp_rounded_res_max_w[9] & exp_rounded_res_w[10]), (exp_rounded_res_max_w[8] & exp_rounded_res_w[9]), (exp_rounded_res_max_w[7] & exp_rounded_res_w[8]), (exp_rounded_res_max_w[6] & exp_rounded_res_w[7]), (exp_rounded_res_max_w[5] & exp_rounded_res_w[6]), (exp_rounded_res_max_w[4] & exp_rounded_res_w[5]), (exp_rounded_res_max_w[3] & exp_rounded_res_w[4]), (exp_rounded_res_max_w[2] & exp_rounded_res_w[3]), (exp_rounded_res_max_w[1] & exp_rounded_res_w[2]), (exp_rounded_res_max_w[0] & exp_rounded_res_w[1]), exp_rounded_res_w[0]},
		exp_rounded_res_w = exp_res_rounding_adder_w[10:0],
		exp_rounding_adjustment_w = {11'b00000000000, man_res_rounding_add_sub_w[53]},
		exp_value = {1'b0, exp_res_dffe26_wo},
		force_infinity_w = ((input_is_infinite_dffe4_wo | rounded_res_infinity_dffe4_wo) | infinite_res_dffe4_wo),
		force_nan_w = (infinity_magnitude_sub_dffe4_wo | input_is_nan_dffe4_wo),
		force_zero_w = (~ man_res_is_not_zero_dffe4_wo),
		guard_bit_dffe3_wo = man_res_w3[0],
		infinite_output_sign_dffe1_wi = (((~ input_datab_infinite_dffe15_wo) & aligned_dataa_sign_dffe15_wo) | (input_datab_infinite_dffe15_wo & aligned_datab_sign_dffe15_wo)),
		infinite_output_sign_dffe1_wo = infinite_output_sign_dffe1,
		infinite_output_sign_dffe21_wi = infinite_output_sign_dffe27_wo,
		infinite_output_sign_dffe21_wo = infinite_output_sign_dffe21,
		infinite_output_sign_dffe22_wi = infinite_output_sign_dffe2_wo,
		infinite_output_sign_dffe22_wo = infinite_output_sign_dffe22_wi,
		infinite_output_sign_dffe23_wi = infinite_output_sign_dffe21_wo,
		infinite_output_sign_dffe23_wo = infinite_output_sign_dffe23,
		infinite_output_sign_dffe25_wi = infinite_output_sign_dffe1_wo,
		infinite_output_sign_dffe25_wo = infinite_output_sign_dffe25_wi,
		infinite_output_sign_dffe26_wi = infinite_output_sign_dffe23_wo,
		infinite_output_sign_dffe26_wo = infinite_output_sign_dffe26_wi,
		infinite_output_sign_dffe27_wi = infinite_output_sign_dffe22_wo,
		infinite_output_sign_dffe27_wo = infinite_output_sign_dffe27,
		infinite_output_sign_dffe2_wi = infinite_output_sign_dffe25_wo,
		infinite_output_sign_dffe2_wo = infinite_output_sign_dffe2,
		infinite_output_sign_dffe31_wi = infinite_output_sign_dffe26_wo,
		infinite_output_sign_dffe31_wo = infinite_output_sign_dffe31,
		infinite_output_sign_dffe32_wi = infinite_output_sign_dffe31_wo,
		infinite_output_sign_dffe32_wo = infinite_output_sign_dffe32_wi,
		infinite_output_sign_dffe33_wi = infinite_output_sign_dffe32_wo,
		infinite_output_sign_dffe33_wo = infinite_output_sign_dffe33_wi,
		infinite_output_sign_dffe3_wi = infinite_output_sign_dffe33_wo,
		infinite_output_sign_dffe3_wo = infinite_output_sign_dffe3,
		infinite_output_sign_dffe41_wi = infinite_output_sign_dffe42_wo,
		infinite_output_sign_dffe41_wo = infinite_output_sign_dffe41,
		infinite_output_sign_dffe42_wi = infinite_output_sign_dffe3_wo,
		infinite_output_sign_dffe42_wo = infinite_output_sign_dffe42_wi,
		infinite_output_sign_dffe4_wi = infinite_output_sign_dffe41_wo,
		infinite_output_sign_dffe4_wo = infinite_output_sign_dffe4,
		infinite_res_dff32_wi = (exp_res_max_w[10] & (~ exp_adjustment2_add_sub_w[11])),
		infinite_res_dff32_wo = infinite_res_dff32_wi,
		infinite_res_dff33_wi = infinite_res_dff32_wo,
		infinite_res_dff33_wo = infinite_res_dff33_wi,
		infinite_res_dffe3_wi = infinite_res_dff33_wo,
		infinite_res_dffe3_wo = infinite_res_dffe3,
		infinite_res_dffe41_wi = infinite_res_dffe42_wo,
		infinite_res_dffe41_wo = infinite_res_dffe41,
		infinite_res_dffe42_wi = infinite_res_dffe3_wo,
		infinite_res_dffe42_wo = infinite_res_dffe42_wi,
		infinite_res_dffe4_wi = infinite_res_dffe41_wo,
		infinite_res_dffe4_wo = infinite_res_dffe4,
		infinity_magnitude_sub_dffe21_wi = infinity_magnitude_sub_dffe27_wo,
		infinity_magnitude_sub_dffe21_wo = infinity_magnitude_sub_dffe21,
		infinity_magnitude_sub_dffe22_wi = infinity_magnitude_sub_dffe2_wo,
		infinity_magnitude_sub_dffe22_wo = infinity_magnitude_sub_dffe22_wi,
		infinity_magnitude_sub_dffe23_wi = infinity_magnitude_sub_dffe21_wo,
		infinity_magnitude_sub_dffe23_wo = infinity_magnitude_sub_dffe23,
		infinity_magnitude_sub_dffe26_wi = infinity_magnitude_sub_dffe23_wo,
		infinity_magnitude_sub_dffe26_wo = infinity_magnitude_sub_dffe26_wi,
		infinity_magnitude_sub_dffe27_wi = infinity_magnitude_sub_dffe22_wo,
		infinity_magnitude_sub_dffe27_wo = infinity_magnitude_sub_dffe27,
		infinity_magnitude_sub_dffe2_wi = ((~ add_sub_dffe25_wo) & both_inputs_are_infinite_dffe25_wo),
		infinity_magnitude_sub_dffe2_wo = infinity_magnitude_sub_dffe2,
		infinity_magnitude_sub_dffe31_wi = infinity_magnitude_sub_dffe26_wo,
		infinity_magnitude_sub_dffe31_wo = infinity_magnitude_sub_dffe31,
		infinity_magnitude_sub_dffe32_wi = infinity_magnitude_sub_dffe31_wo,
		infinity_magnitude_sub_dffe32_wo = infinity_magnitude_sub_dffe32_wi,
		infinity_magnitude_sub_dffe33_wi = infinity_magnitude_sub_dffe32_wo,
		infinity_magnitude_sub_dffe33_wo = infinity_magnitude_sub_dffe33_wi,
		infinity_magnitude_sub_dffe3_wi = infinity_magnitude_sub_dffe33_wo,
		infinity_magnitude_sub_dffe3_wo = infinity_magnitude_sub_dffe3,
		infinity_magnitude_sub_dffe41_wi = infinity_magnitude_sub_dffe42_wo,
		infinity_magnitude_sub_dffe41_wo = infinity_magnitude_sub_dffe41,
		infinity_magnitude_sub_dffe42_wi = infinity_magnitude_sub_dffe3_wo,
		infinity_magnitude_sub_dffe42_wo = infinity_magnitude_sub_dffe42_wi,
		infinity_magnitude_sub_dffe4_wi = infinity_magnitude_sub_dffe41_wo,
		infinity_magnitude_sub_dffe4_wo = infinity_magnitude_sub_dffe4,
		input_dataa_denormal_dffe11_wi = input_dataa_denormal_w,
		input_dataa_denormal_dffe11_wo = input_dataa_denormal_dffe11,
		input_dataa_denormal_w = ((~ exp_a_not_zero_w[10]) & man_a_not_zero_w[51]),
		input_dataa_infinite_dffe11_wi = input_dataa_infinite_w,
		input_dataa_infinite_dffe11_wo = input_dataa_infinite_dffe11,
		input_dataa_infinite_dffe12_wi = input_dataa_infinite_dffe11_wo,
		input_dataa_infinite_dffe12_wo = input_dataa_infinite_dffe12,
		input_dataa_infinite_dffe13_wi = input_dataa_infinite_dffe12_wo,
		input_dataa_infinite_dffe13_wo = input_dataa_infinite_dffe13,
		input_dataa_infinite_dffe14_wi = input_dataa_infinite_dffe13_wo,
		input_dataa_infinite_dffe14_wo = input_dataa_infinite_dffe14,
		input_dataa_infinite_dffe15_wi = input_dataa_infinite_dffe14_wo,
		input_dataa_infinite_dffe15_wo = input_dataa_infinite_dffe15_wi,
		input_dataa_infinite_w = (exp_a_all_one_w[10] & (~ man_a_not_zero_w[51])),
		input_dataa_nan_dffe11_wi = input_dataa_nan_w,
		input_dataa_nan_dffe11_wo = input_dataa_nan_dffe11,
		input_dataa_nan_dffe12_wi = input_dataa_nan_dffe11_wo,
		input_dataa_nan_dffe12_wo = input_dataa_nan_dffe12,
		input_dataa_nan_w = (exp_a_all_one_w[10] & man_a_not_zero_w[51]),
		input_dataa_zero_dffe11_wi = input_dataa_zero_w,
		input_dataa_zero_dffe11_wo = input_dataa_zero_dffe11,
		input_dataa_zero_w = ((~ exp_a_not_zero_w[10]) & (~ man_a_not_zero_w[51])),
		input_datab_denormal_dffe11_wi = input_datab_denormal_w,
		input_datab_denormal_dffe11_wo = input_datab_denormal_dffe11,
		input_datab_denormal_w = ((~ exp_b_not_zero_w[10]) & man_b_not_zero_w[51]),
		input_datab_infinite_dffe11_wi = input_datab_infinite_w,
		input_datab_infinite_dffe11_wo = input_datab_infinite_dffe11,
		input_datab_infinite_dffe12_wi = input_datab_infinite_dffe11_wo,
		input_datab_infinite_dffe12_wo = input_datab_infinite_dffe12,
		input_datab_infinite_dffe13_wi = input_datab_infinite_dffe12_wo,
		input_datab_infinite_dffe13_wo = input_datab_infinite_dffe13,
		input_datab_infinite_dffe14_wi = input_datab_infinite_dffe13_wo,
		input_datab_infinite_dffe14_wo = input_datab_infinite_dffe14,
		input_datab_infinite_dffe15_wi = input_datab_infinite_dffe14_wo,
		input_datab_infinite_dffe15_wo = input_datab_infinite_dffe15_wi,
		input_datab_infinite_w = (exp_b_all_one_w[10] & (~ man_b_not_zero_w[51])),
		input_datab_nan_dffe11_wi = input_datab_nan_w,
		input_datab_nan_dffe11_wo = input_datab_nan_dffe11,
		input_datab_nan_dffe12_wi = input_datab_nan_dffe11_wo,
		input_datab_nan_dffe12_wo = input_datab_nan_dffe12,
		input_datab_nan_w = (exp_b_all_one_w[10] & man_b_not_zero_w[51]),
		input_datab_zero_dffe11_wi = input_datab_zero_w,
		input_datab_zero_dffe11_wo = input_datab_zero_dffe11,
		input_datab_zero_w = ((~ exp_b_not_zero_w[10]) & (~ man_b_not_zero_w[51])),
		input_is_infinite_dffe1_wi = (input_dataa_infinite_dffe15_wo | input_datab_infinite_dffe15_wo),
		input_is_infinite_dffe1_wo = input_is_infinite_dffe1,
		input_is_infinite_dffe21_wi = input_is_infinite_dffe27_wo,
		input_is_infinite_dffe21_wo = input_is_infinite_dffe21,
		input_is_infinite_dffe22_wi = input_is_infinite_dffe2_wo,
		input_is_infinite_dffe22_wo = input_is_infinite_dffe22_wi,
		input_is_infinite_dffe23_wi = input_is_infinite_dffe21_wo,
		input_is_infinite_dffe23_wo = input_is_infinite_dffe23,
		input_is_infinite_dffe25_wi = input_is_infinite_dffe1_wo,
		input_is_infinite_dffe25_wo = input_is_infinite_dffe25_wi,
		input_is_infinite_dffe26_wi = input_is_infinite_dffe23_wo,
		input_is_infinite_dffe26_wo = input_is_infinite_dffe26_wi,
		input_is_infinite_dffe27_wi = input_is_infinite_dffe22_wo,
		input_is_infinite_dffe27_wo = input_is_infinite_dffe27,
		input_is_infinite_dffe2_wi = input_is_infinite_dffe25_wo,
		input_is_infinite_dffe2_wo = input_is_infinite_dffe2,
		input_is_infinite_dffe31_wi = input_is_infinite_dffe26_wo,
		input_is_infinite_dffe31_wo = input_is_infinite_dffe31,
		input_is_infinite_dffe32_wi = input_is_infinite_dffe31_wo,
		input_is_infinite_dffe32_wo = input_is_infinite_dffe32_wi,
		input_is_infinite_dffe33_wi = input_is_infinite_dffe32_wo,
		input_is_infinite_dffe33_wo = input_is_infinite_dffe33_wi,
		input_is_infinite_dffe3_wi = input_is_infinite_dffe33_wo,
		input_is_infinite_dffe3_wo = input_is_infinite_dffe3,
		input_is_infinite_dffe41_wi = input_is_infinite_dffe42_wo,
		input_is_infinite_dffe41_wo = input_is_infinite_dffe41,
		input_is_infinite_dffe42_wi = input_is_infinite_dffe3_wo,
		input_is_infinite_dffe42_wo = input_is_infinite_dffe42_wi,
		input_is_infinite_dffe4_wi = input_is_infinite_dffe41_wo,
		input_is_infinite_dffe4_wo = input_is_infinite_dffe4,
		input_is_nan_dffe13_wi = (input_dataa_nan_dffe12_wo | input_datab_nan_dffe12_wo),
		input_is_nan_dffe13_wo = input_is_nan_dffe13,
		input_is_nan_dffe14_wi = input_is_nan_dffe13_wo,
		input_is_nan_dffe14_wo = input_is_nan_dffe14,
		input_is_nan_dffe15_wi = input_is_nan_dffe14_wo,
		input_is_nan_dffe15_wo = input_is_nan_dffe15_wi,
		input_is_nan_dffe1_wi = input_is_nan_dffe15_wo,
		input_is_nan_dffe1_wo = input_is_nan_dffe1,
		input_is_nan_dffe21_wi = input_is_nan_dffe27_wo,
		input_is_nan_dffe21_wo = input_is_nan_dffe21,
		input_is_nan_dffe22_wi = input_is_nan_dffe2_wo,
		input_is_nan_dffe22_wo = input_is_nan_dffe22_wi,
		input_is_nan_dffe23_wi = input_is_nan_dffe21_wo,
		input_is_nan_dffe23_wo = input_is_nan_dffe23,
		input_is_nan_dffe25_wi = input_is_nan_dffe1_wo,
		input_is_nan_dffe25_wo = input_is_nan_dffe25_wi,
		input_is_nan_dffe26_wi = input_is_nan_dffe23_wo,
		input_is_nan_dffe26_wo = input_is_nan_dffe26_wi,
		input_is_nan_dffe27_wi = input_is_nan_dffe22_wo,
		input_is_nan_dffe27_wo = input_is_nan_dffe27,
		input_is_nan_dffe2_wi = input_is_nan_dffe25_wo,
		input_is_nan_dffe2_wo = input_is_nan_dffe2,
		input_is_nan_dffe31_wi = input_is_nan_dffe26_wo,
		input_is_nan_dffe31_wo = input_is_nan_dffe31,
		input_is_nan_dffe32_wi = input_is_nan_dffe31_wo,
		input_is_nan_dffe32_wo = input_is_nan_dffe32_wi,
		input_is_nan_dffe33_wi = input_is_nan_dffe32_wo,
		input_is_nan_dffe33_wo = input_is_nan_dffe33_wi,
		input_is_nan_dffe3_wi = input_is_nan_dffe33_wo,
		input_is_nan_dffe3_wo = input_is_nan_dffe3,
		input_is_nan_dffe41_wi = input_is_nan_dffe42_wo,
		input_is_nan_dffe41_wo = input_is_nan_dffe41,
		input_is_nan_dffe42_wi = input_is_nan_dffe3_wo,
		input_is_nan_dffe42_wo = input_is_nan_dffe42_wi,
		input_is_nan_dffe4_wi = input_is_nan_dffe41_wo,
		input_is_nan_dffe4_wo = input_is_nan_dffe4,
		man_2comp_res_dataa_w = {pos_sign_bit_ext, datab_man_dffe1_wo},
		man_2comp_res_datab_w = {pos_sign_bit_ext, dataa_man_dffe1_wo},
		man_2comp_res_w = {(({28{(~ wire_man_2comp_res_lower_cout)}} & wire_man_2comp_res_upper0_result) | ({28{wire_man_2comp_res_lower_cout}} & wire_man_2comp_res_upper1_result)), wire_man_2comp_res_lower_result},
		man_a_not_zero_w = {(dataa[51] | man_a_not_zero_w[50]), (dataa[50] | man_a_not_zero_w[49]), (dataa[49] | man_a_not_zero_w[48]), (dataa[48] | man_a_not_zero_w[47]), (dataa[47] | man_a_not_zero_w[46]), (dataa[46] | man_a_not_zero_w[45]), (dataa[45] | man_a_not_zero_w[44]), (dataa[44] | man_a_not_zero_w[43]), (dataa[43] | man_a_not_zero_w[42]), (dataa[42] | man_a_not_zero_w[41]), (dataa[41] | man_a_not_zero_w[40]), (dataa[40] | man_a_not_zero_w[39]), (dataa[39] | man_a_not_zero_w[38]), (dataa[38] | man_a_not_zero_w[37]), (dataa[37] | man_a_not_zero_w[36]), (dataa[36] | man_a_not_zero_w[35]), (dataa[35] | man_a_not_zero_w[34]), (dataa[34] | man_a_not_zero_w[33]), (dataa[33] | man_a_not_zero_w[32]), (dataa[32] | man_a_not_zero_w[31]), (dataa[31] | man_a_not_zero_w[30]), (dataa[30] | man_a_not_zero_w[29]), (dataa[29] | man_a_not_zero_w[28]), (dataa[28] | man_a_not_zero_w[27]), (dataa[27] | man_a_not_zero_w[26]), (dataa[26] | man_a_not_zero_w[25]), (dataa[25] | man_a_not_zero_w[24]), (dataa[24] | man_a_not_zero_w[23]), (dataa[23] | man_a_not_zero_w[22]), (dataa[22] | man_a_not_zero_w[21]), (dataa[21] | man_a_not_zero_w[20]), (dataa[20] | man_a_not_zero_w[19]), (dataa[19] | man_a_not_zero_w[18]), (dataa[18] | man_a_not_zero_w[17]), (dataa[17] | man_a_not_zero_w[16]), (dataa[16] | man_a_not_zero_w[15]), (dataa[15] | man_a_not_zero_w[14]), (dataa[14] | man_a_not_zero_w[13]), (dataa[13] | man_a_not_zero_w[12]), (dataa[12] | man_a_not_zero_w[11]), (dataa[11] | man_a_not_zero_w[10]), (dataa[10] | man_a_not_zero_w[9]), (dataa[9] | man_a_not_zero_w[8]), (dataa[8] | man_a_not_zero_w[7]), (dataa[7] | man_a_not_zero_w[6]), (dataa[6] | man_a_not_zero_w[5]), (dataa[5] | man_a_not_zero_w[4]), (dataa[4] | man_a_not_zero_w[3]), (dataa[3] | man_a_not_zero_w[2]), (dataa[2] | man_a_not_zero_w[1]), (dataa[1] | man_a_not_zero_w[0]), dataa[0]},
		man_add_sub_dataa_w = {pos_sign_bit_ext, dataa_man_dffe1_wo},
		man_add_sub_datab_w = {pos_sign_bit_ext, datab_man_dffe1_wo},
		man_add_sub_res_mag_dffe21_wi = man_res_mag_w2,
		man_add_sub_res_mag_dffe21_wo = man_add_sub_res_mag_dffe21,
		man_add_sub_res_mag_dffe23_wi = man_add_sub_res_mag_dffe21_wo,
		man_add_sub_res_mag_dffe23_wo = man_add_sub_res_mag_dffe23,
		man_add_sub_res_mag_dffe26_wi = man_add_sub_res_mag_dffe23_wo,
		man_add_sub_res_mag_dffe26_wo = man_add_sub_res_mag_dffe26_wi,
		man_add_sub_res_mag_dffe27_wi = man_add_sub_res_mag_w2,
		man_add_sub_res_mag_dffe27_wo = man_add_sub_res_mag_dffe27,
		man_add_sub_res_mag_w2 = (({57{man_add_sub_w[56]}} & man_2comp_res_w) | ({57{(~ man_add_sub_w[56])}} & man_add_sub_w)),
		man_add_sub_res_sign_dffe21_wo = man_add_sub_res_sign_dffe21,
		man_add_sub_res_sign_dffe23_wi = man_add_sub_res_sign_dffe21_wo,
		man_add_sub_res_sign_dffe23_wo = man_add_sub_res_sign_dffe23,
		man_add_sub_res_sign_dffe26_wi = man_add_sub_res_sign_dffe23_wo,
		man_add_sub_res_sign_dffe26_wo = man_add_sub_res_sign_dffe26_wi,
		man_add_sub_res_sign_dffe27_wi = man_add_sub_res_sign_w2,
		man_add_sub_res_sign_dffe27_wo = man_add_sub_res_sign_dffe27,
		man_add_sub_res_sign_w2 = ((need_complement_dffe22_wo & (~ man_add_sub_w[56])) | ((~ need_complement_dffe22_wo) & man_add_sub_w[56])),
		man_add_sub_w = {(({28{(~ wire_man_add_sub_lower_cout)}} & wire_man_add_sub_upper0_result) | ({28{wire_man_add_sub_lower_cout}} & wire_man_add_sub_upper1_result)), wire_man_add_sub_lower_result},
		man_all_zeros_w = {52{1'b0}},
		man_b_not_zero_w = {(datab[51] | man_b_not_zero_w[50]), (datab[50] | man_b_not_zero_w[49]), (datab[49] | man_b_not_zero_w[48]), (datab[48] | man_b_not_zero_w[47]), (datab[47] | man_b_not_zero_w[46]), (datab[46] | man_b_not_zero_w[45]), (datab[45] | man_b_not_zero_w[44]), (datab[44] | man_b_not_zero_w[43]), (datab[43] | man_b_not_zero_w[42]), (datab[42] | man_b_not_zero_w[41]), (datab[41] | man_b_not_zero_w[40]), (datab[40] | man_b_not_zero_w[39]), (datab[39] | man_b_not_zero_w[38]), (datab[38] | man_b_not_zero_w[37]), (datab[37] | man_b_not_zero_w[36]), (datab[36] | man_b_not_zero_w[35]), (datab[35] | man_b_not_zero_w[34]), (datab[34] | man_b_not_zero_w[33]), (datab[33] | man_b_not_zero_w[32]), (datab[32] | man_b_not_zero_w[31]), (datab[31] | man_b_not_zero_w[30]), (datab[30] | man_b_not_zero_w[29]), (datab[29] | man_b_not_zero_w[28]), (datab[28] | man_b_not_zero_w[27]), (datab[27] | man_b_not_zero_w[26]), (datab[26] | man_b_not_zero_w[25]), (datab[25] | man_b_not_zero_w[24]), (datab[24] | man_b_not_zero_w[23]), (datab[23] | man_b_not_zero_w[22]), (datab[22] | man_b_not_zero_w[21]), (datab[21] | man_b_not_zero_w[20]), (datab[20] | man_b_not_zero_w[19]), (datab[19] | man_b_not_zero_w[18]), (datab[18] | man_b_not_zero_w[17]), (datab[17] | man_b_not_zero_w[16]), (datab[16] | man_b_not_zero_w[15]), (datab[15] | man_b_not_zero_w[14]), (datab[14] | man_b_not_zero_w[13]), (datab[13] | man_b_not_zero_w[12]), (datab[12] | man_b_not_zero_w[11]), (datab[11] | man_b_not_zero_w[10]), (datab[10] | man_b_not_zero_w[9]), (datab[9] | man_b_not_zero_w[8]), (datab[8] | man_b_not_zero_w[7]), (datab[7] | man_b_not_zero_w[6]), (datab[6] | man_b_not_zero_w[5]), (datab[5] | man_b_not_zero_w[4]), (datab[4] | man_b_not_zero_w[3]), (datab[3] | man_b_not_zero_w[2]), (datab[2] | man_b_not_zero_w[1]), (datab[1] | man_b_not_zero_w[0]), datab[0]},
		man_dffe31_wo = man_dffe31,
		man_intermediate_res_w = {2'b00, man_res_w3},
		man_leading_zeros_cnt_w = man_leading_zeros_dffe31_wo,
		man_leading_zeros_dffe31_wi = (~ wire_leading_zeroes_cnt_q),
		man_leading_zeros_dffe31_wo = man_leading_zeros_dffe31,
		man_nan_w = 52'b1000000000000000000000000000000000000000000000000000,
		man_out_dffe5_wi = (({52{force_nan_w}} & man_nan_w) | ({52{(~ force_nan_w)}} & (({52{force_infinity_w}} & man_all_zeros_w) | ({52{(~ force_infinity_w)}} & (({52{(force_zero_w | denormal_flag_w)}} & man_all_zeros_w) | ({52{(~ (force_zero_w | denormal_flag_w))}} & man_res_dffe4_wo)))))),
		man_out_dffe5_wo = man_out_dffe5,
		man_res_dffe4_wi = man_rounded_res_w,
		man_res_dffe4_wo = man_res_dffe4,
		man_res_is_not_zero_dffe31_wi = man_res_not_zero_dffe26_wo,
		man_res_is_not_zero_dffe31_wo = man_res_is_not_zero_dffe31,
		man_res_is_not_zero_dffe32_wi = man_res_is_not_zero_dffe31_wo,
		man_res_is_not_zero_dffe32_wo = man_res_is_not_zero_dffe32_wi,
		man_res_is_not_zero_dffe33_wi = man_res_is_not_zero_dffe32_wo,
		man_res_is_not_zero_dffe33_wo = man_res_is_not_zero_dffe33_wi,
		man_res_is_not_zero_dffe3_wi = man_res_is_not_zero_dffe33_wo,
		man_res_is_not_zero_dffe3_wo = man_res_is_not_zero_dffe3,
		man_res_is_not_zero_dffe41_wi = man_res_is_not_zero_dffe42_wo,
		man_res_is_not_zero_dffe41_wo = man_res_is_not_zero_dffe41,
		man_res_is_not_zero_dffe42_wi = man_res_is_not_zero_dffe3_wo,
		man_res_is_not_zero_dffe42_wo = man_res_is_not_zero_dffe42_wi,
		man_res_is_not_zero_dffe4_wi = man_res_is_not_zero_dffe41_wo,
		man_res_is_not_zero_dffe4_wo = man_res_is_not_zero_dffe4,
		man_res_mag_w2 = (({55{man_add_sub_res_mag_dffe27_wo[55]}} & man_add_sub_res_mag_dffe27_wo[55:1]) | ({55{(~ man_add_sub_res_mag_dffe27_wo[55])}} & man_add_sub_res_mag_dffe27_wo[54:0])),
		man_res_not_zero_dffe23_wi = man_res_not_zero_w2[53],
		man_res_not_zero_dffe23_wo = man_res_not_zero_dffe23,
		man_res_not_zero_dffe26_wi = man_res_not_zero_dffe23_wo,
		man_res_not_zero_dffe26_wo = man_res_not_zero_dffe26_wi,
		man_res_not_zero_w2 = {(man_res_not_zero_w2[52] | man_add_sub_res_mag_dffe21_wo[54]), (man_res_not_zero_w2[51] | man_add_sub_res_mag_dffe21_wo[53]), (man_res_not_zero_w2[50] | man_add_sub_res_mag_dffe21_wo[52]), (man_res_not_zero_w2[49] | man_add_sub_res_mag_dffe21_wo[51]), (man_res_not_zero_w2[48] | man_add_sub_res_mag_dffe21_wo[50]), (man_res_not_zero_w2[47] | man_add_sub_res_mag_dffe21_wo[49]), (man_res_not_zero_w2[46] | man_add_sub_res_mag_dffe21_wo[48]), (man_res_not_zero_w2[45] | man_add_sub_res_mag_dffe21_wo[47]), (man_res_not_zero_w2[44] | man_add_sub_res_mag_dffe21_wo[46]), (man_res_not_zero_w2[43] | man_add_sub_res_mag_dffe21_wo[45]), (man_res_not_zero_w2[42] | man_add_sub_res_mag_dffe21_wo[44]), (man_res_not_zero_w2[41] | man_add_sub_res_mag_dffe21_wo[43]), (man_res_not_zero_w2[40] | man_add_sub_res_mag_dffe21_wo[42]), (man_res_not_zero_w2[39] | man_add_sub_res_mag_dffe21_wo[41]), (man_res_not_zero_w2[38] | man_add_sub_res_mag_dffe21_wo[40]), (man_res_not_zero_w2[37] | man_add_sub_res_mag_dffe21_wo[39]), (man_res_not_zero_w2[36] | man_add_sub_res_mag_dffe21_wo[38]), (man_res_not_zero_w2[35] | man_add_sub_res_mag_dffe21_wo[37]), (man_res_not_zero_w2[34] | man_add_sub_res_mag_dffe21_wo[36]), (man_res_not_zero_w2[33] | man_add_sub_res_mag_dffe21_wo[35]), (man_res_not_zero_w2[32] | man_add_sub_res_mag_dffe21_wo[34]), (man_res_not_zero_w2[31] | man_add_sub_res_mag_dffe21_wo[33]), (man_res_not_zero_w2[30] | man_add_sub_res_mag_dffe21_wo[32]), (man_res_not_zero_w2[29] | man_add_sub_res_mag_dffe21_wo[31]), (man_res_not_zero_w2[28] | man_add_sub_res_mag_dffe21_wo[30]), (man_res_not_zero_w2[27] | man_add_sub_res_mag_dffe21_wo[29]), (man_res_not_zero_w2[26] | man_add_sub_res_mag_dffe21_wo[28]), (man_res_not_zero_w2[25] | man_add_sub_res_mag_dffe21_wo[27]), (man_res_not_zero_w2[24] | man_add_sub_res_mag_dffe21_wo[26]), (man_res_not_zero_w2[23] | man_add_sub_res_mag_dffe21_wo[25]), (man_res_not_zero_w2[22] | man_add_sub_res_mag_dffe21_wo[24]), (man_res_not_zero_w2[21] | man_add_sub_res_mag_dffe21_wo[23]), (man_res_not_zero_w2[20]
 | man_add_sub_res_mag_dffe21_wo[22]), (man_res_not_zero_w2[19] | man_add_sub_res_mag_dffe21_wo[21]), (man_res_not_zero_w2[18] | man_add_sub_res_mag_dffe21_wo[20]), (man_res_not_zero_w2[17] | man_add_sub_res_mag_dffe21_wo[19]), (man_res_not_zero_w2[16] | man_add_sub_res_mag_dffe21_wo[18]), (man_res_not_zero_w2[15] | man_add_sub_res_mag_dffe21_wo[17]), (man_res_not_zero_w2[14] | man_add_sub_res_mag_dffe21_wo[16]), (man_res_not_zero_w2[13] | man_add_sub_res_mag_dffe21_wo[15]), (man_res_not_zero_w2[12] | man_add_sub_res_mag_dffe21_wo[14]), (man_res_not_zero_w2[11] | man_add_sub_res_mag_dffe21_wo[13]), (man_res_not_zero_w2[10] | man_add_sub_res_mag_dffe21_wo[12]), (man_res_not_zero_w2[9] | man_add_sub_res_mag_dffe21_wo[11]), (man_res_not_zero_w2[8] | man_add_sub_res_mag_dffe21_wo[10]), (man_res_not_zero_w2[7] | man_add_sub_res_mag_dffe21_wo[9]), (man_res_not_zero_w2[6] | man_add_sub_res_mag_dffe21_wo[8]), (man_res_not_zero_w2[5] | man_add_sub_res_mag_dffe21_wo[7]), (man_res_not_zero_w2[4] | man_add_sub_res_mag_dffe21_wo[6]), (man_res_not_zero_w2[3] | man_add_sub_res_mag_dffe21_wo[5]), (man_res_not_zero_w2[2] | man_add_sub_res_mag_dffe21_wo[4]), (man_res_not_zero_w2[1] | man_add_sub_res_mag_dffe21_wo[3]), (man_res_not_zero_w2[0] | man_add_sub_res_mag_dffe21_wo[2]), man_add_sub_res_mag_dffe21_wo[1]},
		man_res_rounding_add_sub_datab_w = {54'b000000000000000000000000000000000000000000000000000000, man_rounding_add_value_w},
		man_res_rounding_add_sub_w = man_res_rounding_add_sub_result_reg,
		man_res_w3 = wire_lbarrel_shift_result[54:2],
		man_rounded_res_w = (({52{man_res_rounding_add_sub_w[53]}} & man_res_rounding_add_sub_w[52:1]) | ({52{(~ man_res_rounding_add_sub_w[53])}} & man_res_rounding_add_sub_w[51:0])),
		man_rounding_add_value_w = (round_bit_dffe3_wo & (sticky_bit_dffe3_wo | guard_bit_dffe3_wo)),
		man_smaller_dffe13_wi = man_smaller_w,
		man_smaller_dffe13_wo = man_smaller_dffe13,
		man_smaller_w = (({53{exp_amb_mux_w}} & aligned_dataa_man_dffe12_wo) | ({53{(~ exp_amb_mux_w)}} & aligned_datab_man_dffe12_wo)),
		need_complement_dffe22_wi = need_complement_dffe2_wo,
		need_complement_dffe22_wo = need_complement_dffe22_wi,
		need_complement_dffe2_wi = dataa_sign_dffe25_wo,
		need_complement_dffe2_wo = need_complement_dffe2,
		pos_sign_bit_ext = {2{1'b0}},
		priority_encoder_1pads_w = {6{1'b1}},
		result = {sign_out_dffe5_wo, exp_out_dffe5_wo, man_out_dffe5_wo},
		round_bit_dffe21_wi = round_bit_w,
		round_bit_dffe21_wo = round_bit_dffe21,
		round_bit_dffe23_wi = round_bit_dffe21_wo,
		round_bit_dffe23_wo = round_bit_dffe23,
		round_bit_dffe26_wi = round_bit_dffe23_wo,
		round_bit_dffe26_wo = round_bit_dffe26_wi,
		round_bit_dffe31_wi = round_bit_dffe26_wo,
		round_bit_dffe31_wo = round_bit_dffe31,
		round_bit_dffe32_wi = round_bit_dffe31_wo,
		round_bit_dffe32_wo = round_bit_dffe32_wi,
		round_bit_dffe33_wi = round_bit_dffe32_wo,
		round_bit_dffe33_wo = round_bit_dffe33_wi,
		round_bit_dffe3_wi = round_bit_dffe33_wo,
		round_bit_dffe3_wo = round_bit_dffe3,
		round_bit_w = ((((((~ man_add_sub_res_mag_dffe27_wo[55]) & (~ man_add_sub_res_mag_dffe27_wo[54])) & man_add_sub_res_mag_dffe27_wo[0]) | (((~ man_add_sub_res_mag_dffe27_wo[55]) & man_add_sub_res_mag_dffe27_wo[54]) & man_add_sub_res_mag_dffe27_wo[1])) | ((man_add_sub_res_mag_dffe27_wo[55] & (~ man_add_sub_res_mag_dffe27_wo[54])) & man_add_sub_res_mag_dffe27_wo[2])) | ((man_add_sub_res_mag_dffe27_wo[55] & man_add_sub_res_mag_dffe27_wo[54]) & man_add_sub_res_mag_dffe27_wo[2])),
		rounded_res_infinity_dffe4_wi = exp_rounded_res_infinity_w,
		rounded_res_infinity_dffe4_wo = rounded_res_infinity_dffe4,
		rshift_distance_dffe13_wi = rshift_distance_w,
		rshift_distance_dffe13_wo = rshift_distance_dffe13,
		rshift_distance_dffe14_wi = rshift_distance_dffe13_wo,
		rshift_distance_dffe14_wo = rshift_distance_dffe14,
		rshift_distance_dffe15_wi = rshift_distance_dffe14_wo,
		rshift_distance_dffe15_wo = rshift_distance_dffe15_wi,
		rshift_distance_w = (({6{exp_diff_abs_exceed_max_w[4]}} & exp_diff_abs_max_w) | ({6{(~ exp_diff_abs_exceed_max_w[4])}} & exp_diff_abs_w[5:0])),
		sign_dffe31_wi = ((man_res_not_zero_dffe26_wo & man_add_sub_res_sign_dffe26_wo) | ((~ man_res_not_zero_dffe26_wo) & zero_man_sign_dffe26_wo)),
		sign_dffe31_wo = sign_dffe31,
		sign_dffe32_wi = sign_dffe31_wo,
		sign_dffe32_wo = sign_dffe32_wi,
		sign_dffe33_wi = sign_dffe32_wo,
		sign_dffe33_wo = sign_dffe33_wi,
		sign_out_dffe5_wi = ((~ force_nan_w) & ((force_infinity_w & infinite_output_sign_dffe4_wo) | ((~ force_infinity_w) & sign_res_dffe4_wo))),
		sign_out_dffe5_wo = sign_out_dffe5,
		sign_res_dffe3_wi = sign_dffe33_wo,
		sign_res_dffe3_wo = sign_res_dffe3,
		sign_res_dffe41_wi = sign_res_dffe42_wo,
		sign_res_dffe41_wo = sign_res_dffe41,
		sign_res_dffe42_wi = sign_res_dffe3_wo,
		sign_res_dffe42_wo = sign_res_dffe42_wi,
		sign_res_dffe4_wi = sign_res_dffe41_wo,
		sign_res_dffe4_wo = sign_res_dffe4,
		sticky_bit_cnt_dataa_w = {1'b0, rshift_distance_dffe15_wo},
		sticky_bit_cnt_datab_w = {1'b0, wire_trailing_zeros_cnt_q},
		sticky_bit_cnt_res_w = wire_add_sub3_result,
		sticky_bit_dffe1_wi = wire_trailing_zeros_limit_comparator_agb,
		sticky_bit_dffe1_wo = sticky_bit_dffe1,
		sticky_bit_dffe21_wi = sticky_bit_w,
		sticky_bit_dffe21_wo = sticky_bit_dffe21,
		sticky_bit_dffe22_wi = sticky_bit_dffe2_wo,
		sticky_bit_dffe22_wo = sticky_bit_dffe22_wi,
		sticky_bit_dffe23_wi = sticky_bit_dffe21_wo,
		sticky_bit_dffe23_wo = sticky_bit_dffe23,
		sticky_bit_dffe25_wi = sticky_bit_dffe1_wo,
		sticky_bit_dffe25_wo = sticky_bit_dffe25_wi,
		sticky_bit_dffe26_wi = sticky_bit_dffe23_wo,
		sticky_bit_dffe26_wo = sticky_bit_dffe26_wi,
		sticky_bit_dffe27_wi = sticky_bit_dffe22_wo,
		sticky_bit_dffe27_wo = sticky_bit_dffe27,
		sticky_bit_dffe2_wi = sticky_bit_dffe25_wo,
		sticky_bit_dffe2_wo = sticky_bit_dffe2,
		sticky_bit_dffe31_wi = sticky_bit_dffe26_wo,
		sticky_bit_dffe31_wo = sticky_bit_dffe31,
		sticky_bit_dffe32_wi = sticky_bit_dffe31_wo,
		sticky_bit_dffe32_wo = sticky_bit_dffe32_wi,
		sticky_bit_dffe33_wi = sticky_bit_dffe32_wo,
		sticky_bit_dffe33_wo = sticky_bit_dffe33_wi,
		sticky_bit_dffe3_wi = sticky_bit_dffe33_wo,
		sticky_bit_dffe3_wo = sticky_bit_dffe3,
		sticky_bit_w = ((((((~ man_add_sub_res_mag_dffe27_wo[55]) & (~ man_add_sub_res_mag_dffe27_wo[54])) & sticky_bit_dffe27_wo) | (((~ man_add_sub_res_mag_dffe27_wo[55]) & man_add_sub_res_mag_dffe27_wo[54]) & (sticky_bit_dffe27_wo | man_add_sub_res_mag_dffe27_wo[0]))) | ((man_add_sub_res_mag_dffe27_wo[55] & (~ man_add_sub_res_mag_dffe27_wo[54])) & ((sticky_bit_dffe27_wo | man_add_sub_res_mag_dffe27_wo[0]) | man_add_sub_res_mag_dffe27_wo[1]))) | ((man_add_sub_res_mag_dffe27_wo[55] & man_add_sub_res_mag_dffe27_wo[54]) & ((sticky_bit_dffe27_wo | man_add_sub_res_mag_dffe27_wo[0]) | man_add_sub_res_mag_dffe27_wo[1]))),
		trailing_zeros_limit_w = 7'b0000010,
		zero_man_sign_dffe21_wi = zero_man_sign_dffe27_wo,
		zero_man_sign_dffe21_wo = zero_man_sign_dffe21,
		zero_man_sign_dffe22_wi = zero_man_sign_dffe2_wo,
		zero_man_sign_dffe22_wo = zero_man_sign_dffe22_wi,
		zero_man_sign_dffe23_wi = zero_man_sign_dffe21_wo,
		zero_man_sign_dffe23_wo = zero_man_sign_dffe23,
		zero_man_sign_dffe26_wi = zero_man_sign_dffe23_wo,
		zero_man_sign_dffe26_wo = zero_man_sign_dffe26_wi,
		zero_man_sign_dffe27_wi = zero_man_sign_dffe22_wo,
		zero_man_sign_dffe27_wo = zero_man_sign_dffe27,
		zero_man_sign_dffe2_wi = (dataa_sign_dffe25_wo & add_sub_dffe25_wo),
		zero_man_sign_dffe2_wo = zero_man_sign_dffe2;
endmodule