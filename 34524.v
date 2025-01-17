module  fpconv_altfp_convert_45n
	(
	clock,
	dataa,
	nan,
	result) ;
	input   clock;
	input   [31:0]  dataa;
	output   nan;
	output   [31:0]  result;
	wire  [53:0]   wire_altbarrel_shift6_result;
	reg	[5:0]	added_power2_reg;
	reg	below_lower_limit1_reg1;
	reg	below_lower_limit1_reg2;
	reg	below_lower_limit1_reg3;
	reg	below_lower_limit2_reg1;
	reg	below_lower_limit2_reg2;
	reg	below_lower_limit2_reg3;
	reg	below_lower_limit2_reg4;
	reg	[31:0]	dataa_reg;
	reg	equal_upper_limit_reg1;
	reg	equal_upper_limit_reg2;
	reg	equal_upper_limit_reg3;
	reg	exceed_upper_limit_reg1;
	reg	exceed_upper_limit_reg2;
	reg	exceed_upper_limit_reg3;
	reg	exceed_upper_limit_reg4;
	reg	exp_and_reg1;
	reg	exp_and_reg2;
	reg	exp_and_reg3;
	reg	exp_and_reg4;
	reg	exp_or_reg1;
	reg	exp_or_reg2;
	reg	exp_or_reg3;
	reg	exp_or_reg4;
	reg	int_or1_reg1;
	reg	int_or2_reg1;
	reg	int_or_reg2;
	reg	int_or_reg3;
	reg	[31:0]	integer_result_reg;
	reg	[30:0]	integer_rounded_reg;
	reg	lowest_int_sel_reg;
	reg	man_or1_reg1;
	reg	man_or2_reg1;
	reg	man_or_reg2;
	reg	man_or_reg3;
	reg	man_or_reg4;
	reg	[22:0]	mantissa_input_reg;
	reg	max_shift_exceeder_reg;
	reg	max_shift_reg;
	reg	nan_reg;
	reg	[5:0]	power2_value_reg;
	reg	sign_input_reg1;
	reg	sign_input_reg2;
	reg	sign_input_reg3;
	reg	sign_input_reg4;
	wire  [7:0]   wire_add_sub4_result;
	wire  [5:0]   wire_add_sub5_result;
	wire  wire_add_sub7_cout;
	wire  [30:0]   wire_add_sub7_result;
	wire  wire_add_sub8_cout;
	wire  [14:0]   wire_add_sub8_result;
	wire  [15:0]   wire_add_sub9_result;
	wire  wire_cmpr1_aeb;
	wire  wire_cmpr1_agb;
	wire  wire_cmpr2_aeb;
	wire  wire_cmpr3_alb;
	wire  wire_max_shift_compare_agb;
	wire aclr;
	wire  add_1_cout_w;
	wire  add_1_w;
	wire  [31:0]  all_zeroes_w;
	wire  [53:0]  barrel_mantissa_input;
	wire  [29:0]  barrel_zero_padding_w;
	wire  below_limit_exceeders;
	wire  [31:0]  below_limit_integer;
	wire  below_lower_limit1_w;
	wire  below_lower_limit2_w;
	wire  [7:0]  bias_value_less_1_w;
	wire  [7:0]  bias_value_w;
	wire clk_en;
	wire  [7:0]  const_bias_value_add_width_res_w;
	wire  denormal_input_w;
	wire  equal_upper_limit_w;
	wire  exceed_limit_exceeders;
	wire  [31:0]  exceed_limit_integer;
	wire  exceed_upper_limit_w;
	wire  [7:0]  exp_and;
	wire  exp_and_w;
	wire  [7:0]  exp_bus;
	wire  [7:0]  exp_or;
	wire  exp_or_w;
	wire  [7:0]  exponent_input;
	wire  guard_bit_w;
	wire  [23:0]  implied_mantissa_input;
	wire  infinity_input_w;
	wire  [31:0]  infinity_value_w;
	wire  int_or1_w;
	wire  int_or2_w;
	wire  [31:0]  integer_output;
	wire  [30:0]  integer_post_round;
	wire  [30:0]  integer_pre_round;
	wire  [31:0]  integer_result;
	wire  [30:0]  integer_rounded;
	wire  [30:0]  integer_rounded_tmp;
	wire  [30:0]  integer_tmp_output;
	wire  [14:0]  inv_add_1_adder1_w;
	wire  [15:0]  inv_add_1_adder2_w;
	wire  [30:0]  inv_integer;
	wire  [53:0]  lbarrel_shift_result_w;
	wire  [30:0]  lbarrel_shift_w;
	wire  lower_limit_selector;
	wire  lowest_integer_selector;
	wire  [30:0]  lowest_integer_value;
	wire  [10:0]  man_bus1;
	wire  [11:0]  man_bus2;
	wire  [10:0]  man_or1;
	wire  man_or1_w;
	wire  [11:0]  man_or2;
	wire  man_or2_w;
	wire  man_or_w;
	wire  [22:0]  mantissa_input;
	wire  max_shift_reg_w;
	wire  [5:0]  max_shift_w;
	wire  more_than_max_shift_w;
	wire  nan_input_w;
	wire  [31:0]  neg_infi_w;
	wire  [7:0]  padded_exponent_input;
	wire  [31:0]  pos_infi_w;
	wire  [5:0]  power2_value_w;
	wire  [31:0]  result_w;
	wire  round_bit_w;
	wire  sign_input;
	wire  sign_input_w;
	wire  [30:0]  signed_integer;
	wire  sticky_bit_w;
	wire  [21:0]  sticky_bus;
	wire  [21:0]  sticky_or;
	wire  [30:0]  unsigned_integer;
	wire  upper_limit_w;
	wire  zero_input_w;
	fpconv_altbarrel_shift_kof   altbarrel_shift6
	(
	.aclr(aclr),
	.clk_en(clk_en),
	.clock(clock),
	.data(barrel_mantissa_input),
	.distance(power2_value_reg),
	.result(wire_altbarrel_shift6_result));
	// synopsys translate_off
	initial
		added_power2_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) added_power2_reg <= 6'b0;
		else if  (clk_en == 1'b1)   added_power2_reg <= wire_add_sub5_result;
	// synopsys translate_off
	initial
		below_lower_limit1_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) below_lower_limit1_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   below_lower_limit1_reg1 <= below_lower_limit1_w;
	// synopsys translate_off
	initial
		below_lower_limit1_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) below_lower_limit1_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   below_lower_limit1_reg2 <= below_lower_limit1_reg1;
	// synopsys translate_off
	initial
		below_lower_limit1_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) below_lower_limit1_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   below_lower_limit1_reg3 <= below_lower_limit1_reg2;
	// synopsys translate_off
	initial
		below_lower_limit2_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) below_lower_limit2_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   below_lower_limit2_reg1 <= below_lower_limit2_w;
	// synopsys translate_off
	initial
		below_lower_limit2_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) below_lower_limit2_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   below_lower_limit2_reg2 <= below_lower_limit2_reg1;
	// synopsys translate_off
	initial
		below_lower_limit2_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) below_lower_limit2_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   below_lower_limit2_reg3 <= below_lower_limit2_reg2;
	// synopsys translate_off
	initial
		below_lower_limit2_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) below_lower_limit2_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   below_lower_limit2_reg4 <= below_lower_limit2_reg3;
	// synopsys translate_off
	initial
		dataa_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dataa_reg <= 32'b0;
		else if  (clk_en == 1'b1)   dataa_reg <= dataa;
	// synopsys translate_off
	initial
		equal_upper_limit_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) equal_upper_limit_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   equal_upper_limit_reg1 <= equal_upper_limit_w;
	// synopsys translate_off
	initial
		equal_upper_limit_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) equal_upper_limit_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   equal_upper_limit_reg2 <= equal_upper_limit_reg1;
	// synopsys translate_off
	initial
		equal_upper_limit_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) equal_upper_limit_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   equal_upper_limit_reg3 <= equal_upper_limit_reg2;
	// synopsys translate_off
	initial
		exceed_upper_limit_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exceed_upper_limit_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   exceed_upper_limit_reg1 <= exceed_upper_limit_w;
	// synopsys translate_off
	initial
		exceed_upper_limit_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exceed_upper_limit_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   exceed_upper_limit_reg2 <= exceed_upper_limit_reg1;
	// synopsys translate_off
	initial
		exceed_upper_limit_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exceed_upper_limit_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   exceed_upper_limit_reg3 <= exceed_upper_limit_reg2;
	// synopsys translate_off
	initial
		exceed_upper_limit_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exceed_upper_limit_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   exceed_upper_limit_reg4 <= upper_limit_w;
	// synopsys translate_off
	initial
		exp_and_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_and_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_and_reg1 <= exp_and_w;
	// synopsys translate_off
	initial
		exp_and_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_and_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_and_reg2 <= exp_and_reg1;
	// synopsys translate_off
	initial
		exp_and_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_and_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_and_reg3 <= exp_and_reg2;
	// synopsys translate_off
	initial
		exp_and_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_and_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_and_reg4 <= exp_and_reg3;
	// synopsys translate_off
	initial
		exp_or_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_or_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_or_reg1 <= exp_or_w;
	// synopsys translate_off
	initial
		exp_or_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_or_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_or_reg2 <= exp_or_reg1;
	// synopsys translate_off
	initial
		exp_or_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_or_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_or_reg3 <= exp_or_reg2;
	// synopsys translate_off
	initial
		exp_or_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_or_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_or_reg4 <= exp_or_reg3;
	// synopsys translate_off
	initial
		int_or1_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) int_or1_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   int_or1_reg1 <= int_or1_w;
	// synopsys translate_off
	initial
		int_or2_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) int_or2_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   int_or2_reg1 <= int_or2_w;
	// synopsys translate_off
	initial
		int_or_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) int_or_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   int_or_reg2 <= (int_or1_reg1 | int_or2_reg1);
	// synopsys translate_off
	initial
		int_or_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) int_or_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   int_or_reg3 <= int_or_reg2;
	// synopsys translate_off
	initial
		integer_result_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) integer_result_reg <= 32'b0;
		else if  (clk_en == 1'b1)   integer_result_reg <= integer_result;
	// synopsys translate_off
	initial
		integer_rounded_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) integer_rounded_reg <= 31'b0;
		else if  (clk_en == 1'b1)   integer_rounded_reg <= integer_rounded;
	// synopsys translate_off
	initial
		lowest_int_sel_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lowest_int_sel_reg <= 1'b0;
		else if  (clk_en == 1'b1)   lowest_int_sel_reg <= lowest_integer_selector;
	// synopsys translate_off
	initial
		man_or1_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_or1_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   man_or1_reg1 <= man_or1_w;
	// synopsys translate_off
	initial
		man_or2_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_or2_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   man_or2_reg1 <= man_or2_w;
	// synopsys translate_off
	initial
		man_or_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_or_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   man_or_reg2 <= man_or_w;
	// synopsys translate_off
	initial
		man_or_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_or_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   man_or_reg3 <= man_or_reg2;
	// synopsys translate_off
	initial
		man_or_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_or_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   man_or_reg4 <= man_or_reg3;
	// synopsys translate_off
	initial
		mantissa_input_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) mantissa_input_reg <= 23'b0;
		else if  (clk_en == 1'b1)   mantissa_input_reg <= mantissa_input;
	// synopsys translate_off
	initial
		max_shift_exceeder_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) max_shift_exceeder_reg <= 1'b0;
		else if  (clk_en == 1'b1)   max_shift_exceeder_reg <= more_than_max_shift_w;
	// synopsys translate_off
	initial
		max_shift_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) max_shift_reg <= 1'b0;
		else if  (clk_en == 1'b1)   max_shift_reg <= wire_max_shift_compare_agb;
	// synopsys translate_off
	initial
		nan_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_reg <= 1'b0;
		else if  (clk_en == 1'b1)   nan_reg <= nan_input_w;
	// synopsys translate_off
	initial
		power2_value_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) power2_value_reg <= 6'b0;
		else if  (clk_en == 1'b1)   power2_value_reg <= power2_value_w;
	// synopsys translate_off
	initial
		sign_input_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_input_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_input_reg1 <= sign_input;
	// synopsys translate_off
	initial
		sign_input_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_input_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_input_reg2 <= sign_input_reg1;
	// synopsys translate_off
	initial
		sign_input_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_input_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_input_reg3 <= sign_input_reg2;
	// synopsys translate_off
	initial
		sign_input_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_input_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_input_reg4 <= sign_input_reg3;
	lpm_add_sub   add_sub4
	(
	.cout(),
	.dataa(exponent_input),
	.datab(bias_value_w),
	.overflow(),
	.result(wire_add_sub4_result)
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
		add_sub4.lpm_direction = "SUB",
		add_sub4.lpm_width = 8,
		add_sub4.lpm_type = "lpm_add_sub",
		add_sub4.lpm_hint = "ONE_INPUT_IS_CONSTANT=YES";
	lpm_add_sub   add_sub5
	(
	.cout(),
	.dataa(power2_value_reg),
	.datab(6'b000001),
	.overflow(),
	.result(wire_add_sub5_result)
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
		add_sub5.lpm_direction = "ADD",
		add_sub5.lpm_width = 6,
		add_sub5.lpm_type = "lpm_add_sub",
		add_sub5.lpm_hint = "ONE_INPUT_IS_CONSTANT=YES";
	lpm_add_sub   add_sub7
	(
	.cout(wire_add_sub7_cout),
	.dataa(integer_pre_round),
	.datab(31'b0000000000000000000000000000001),
	.overflow(),
	.result(wire_add_sub7_result)
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
		add_sub7.lpm_direction = "ADD",
		add_sub7.lpm_width = 31,
		add_sub7.lpm_type = "lpm_add_sub",
		add_sub7.lpm_hint = "ONE_INPUT_IS_CONSTANT=YES";
	lpm_add_sub   add_sub8
	(
	.cout(wire_add_sub8_cout),
	.dataa(inv_integer[14:0]),
	.datab(15'b000000000000001),
	.overflow(),
	.result(wire_add_sub8_result)
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
		add_sub8.lpm_direction = "ADD",
		add_sub8.lpm_width = 15,
		add_sub8.lpm_type = "lpm_add_sub",
		add_sub8.lpm_hint = "ONE_INPUT_IS_CONSTANT=YES";
	lpm_add_sub   add_sub9
	(
	.cout(),
	.dataa(inv_integer[30:15]),
	.datab(16'b0000000000000001),
	.overflow(),
	.result(wire_add_sub9_result)
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
		add_sub9.lpm_direction = "ADD",
		add_sub9.lpm_width = 16,
		add_sub9.lpm_type = "lpm_add_sub",
		add_sub9.lpm_hint = "ONE_INPUT_IS_CONSTANT=YES";
	lpm_compare   cmpr1
	(
	.aeb(wire_cmpr1_aeb),
	.agb(wire_cmpr1_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(padded_exponent_input),
	.datab(const_bias_value_add_width_res_w)
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
	.agb(),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(exponent_input),
	.datab(bias_value_less_1_w)
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
	.aeb(),
	.agb(),
	.ageb(),
	.alb(wire_cmpr3_alb),
	.aleb(),
	.aneb(),
	.dataa(exponent_input),
	.datab(bias_value_w)
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
	lpm_compare   max_shift_compare
	(
	.aeb(),
	.agb(wire_max_shift_compare_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(added_power2_reg),
	.datab(max_shift_w)
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
		max_shift_compare.lpm_representation = "UNSIGNED",
		max_shift_compare.lpm_width = 6,
		max_shift_compare.lpm_type = "lpm_compare";
	assign
		aclr = 1'b0,
		add_1_cout_w = ((wire_add_sub7_cout & add_1_w) & (~ sign_input_reg3)),
		add_1_w = ((((~ guard_bit_w) & round_bit_w) & sticky_bit_w) | (guard_bit_w & round_bit_w)),
		all_zeroes_w = {1'b0, {31{1'b0}}},
		barrel_mantissa_input = {barrel_zero_padding_w, implied_mantissa_input},
		barrel_zero_padding_w = {30{1'b0}},
		below_limit_exceeders = (((denormal_input_w | zero_input_w) | lower_limit_selector) | nan_input_w),
		below_limit_integer = (({32{(~ below_limit_exceeders)}} & integer_output) | ({32{below_limit_exceeders}} & all_zeroes_w)),
		below_lower_limit1_w = wire_cmpr2_aeb,
		below_lower_limit2_w = wire_cmpr3_alb,
		bias_value_less_1_w = 8'b01111110,
		bias_value_w = 8'b01111111,
		clk_en = 1'b1,
		const_bias_value_add_width_res_w = 8'b10011110,
		denormal_input_w = ((~ exp_or_reg4) & man_or_reg4),
		equal_upper_limit_w = wire_cmpr1_aeb,
		exceed_limit_exceeders = (((infinity_input_w | max_shift_exceeder_reg) | exceed_upper_limit_reg4) & (~ nan_input_w)),
		exceed_limit_integer = (({32{(~ exceed_limit_exceeders)}} & below_limit_integer) | ({32{exceed_limit_exceeders}} & infinity_value_w)),
		exceed_upper_limit_w = wire_cmpr1_agb,
		exp_and = {(exp_and[6] & exp_bus[7]), (exp_and[5] & exp_bus[6]), (exp_and[4] & exp_bus[5]), (exp_and[3] & exp_bus[4]), (exp_and[2] & exp_bus[3]), (exp_and[1] & exp_bus[2]), (exp_and[0] & exp_bus[1]), exp_bus[0]},
		exp_and_w = exp_and[7],
		exp_bus = exponent_input,
		exp_or = {(exp_or[6] | exp_bus[7]), (exp_or[5] | exp_bus[6]), (exp_or[4] | exp_bus[5]), (exp_or[3] | exp_bus[4]), (exp_or[2] | exp_bus[3]), (exp_or[1] | exp_bus[2]), (exp_or[0] | exp_bus[1]), exp_bus[0]},
		exp_or_w = exp_or[7],
		exponent_input = dataa_reg[30:23],
		guard_bit_w = wire_altbarrel_shift6_result[23],
		implied_mantissa_input = {1'b1, mantissa_input_reg},
		infinity_input_w = (exp_and_reg4 & (~ man_or_reg4)),
		infinity_value_w = (({32{(~ sign_input_w)}} & pos_infi_w) | ({32{sign_input_w}} & neg_infi_w)),
		int_or1_w = man_or2[0],
		int_or2_w = man_or1[0],
		integer_output = {sign_input_w, integer_tmp_output},
		integer_post_round = wire_add_sub7_result,
		integer_pre_round = lbarrel_shift_w,
		integer_result = exceed_limit_integer,
		integer_rounded = (({31{(~ lowest_integer_selector)}} & integer_rounded_tmp) | ({31{lowest_integer_selector}} & lowest_integer_value)),
		integer_rounded_tmp = (({31{(~ add_1_w)}} & integer_pre_round) | ({31{add_1_w}} & integer_post_round)),
		integer_tmp_output = (({31{(~ sign_input_w)}} & unsigned_integer) | ({31{sign_input_w}} & signed_integer)),
		inv_add_1_adder1_w = wire_add_sub8_result,
		inv_add_1_adder2_w = (({16{(~ wire_add_sub8_cout)}} & inv_integer[30:15]) | ({16{wire_add_sub8_cout}} & wire_add_sub9_result)),
		inv_integer = (~ integer_rounded_reg),
		lbarrel_shift_result_w = wire_altbarrel_shift6_result,
		lbarrel_shift_w = lbarrel_shift_result_w[53:23],
		lower_limit_selector = (((below_lower_limit2_reg4 & (~ zero_input_w)) & (~ denormal_input_w)) & (~ lowest_int_sel_reg)),
		lowest_integer_selector = (below_lower_limit1_reg3 & man_or_reg3),
		lowest_integer_value = {barrel_zero_padding_w, 1'b1},
		man_bus1 = mantissa_input[10:0],
		man_bus2 = mantissa_input[22:11],
		man_or1 = {man_bus1[10], (man_or1[10] | man_bus1[9]), (man_or1[9] | man_bus1[8]), (man_or1[8] | man_bus1[7]), (man_or1[7] | man_bus1[6]), (man_or1[6] | man_bus1[5]), (man_or1[5] | man_bus1[4]), (man_or1[4] | man_bus1[3]), (man_or1[3] | man_bus1[2]), (man_or1[2] | man_bus1[1]), (man_or1[1] | man_bus1[0])},
		man_or1_w = man_or1[0],
		man_or2 = {man_bus2[11], (man_or2[11] | man_bus2[10]), (man_or2[10] | man_bus2[9]), (man_or2[9] | man_bus2[8]), (man_or2[8] | man_bus2[7]), (man_or2[7] | man_bus2[6]), (man_or2[6] | man_bus2[5]), (man_or2[5] | man_bus2[4]), (man_or2[4] | man_bus2[3]), (man_or2[3] | man_bus2[2]), (man_or2[2] | man_bus2[1]), (man_or2[1] | man_bus2[0])},
		man_or2_w = man_or2[0],
		man_or_w = (man_or1_reg1 | man_or2_reg1),
		mantissa_input = dataa_reg[22:0],
		max_shift_reg_w = max_shift_reg,
		max_shift_w = 6'b011110,
		more_than_max_shift_w = ((max_shift_reg_w & add_1_cout_w) & (~ below_lower_limit2_reg3)),
		nan = nan_reg,
		nan_input_w = (exp_and_reg4 & man_or_reg4),
		neg_infi_w = {1'b1, {31{1'b0}}},
		padded_exponent_input = exponent_input,
		pos_infi_w = {1'b0, {31{1'b1}}},
		power2_value_w = wire_add_sub4_result[5:0],
		result = result_w,
		result_w = integer_result_reg,
		round_bit_w = wire_altbarrel_shift6_result[22],
		sign_input = dataa_reg[31],
		sign_input_w = sign_input_reg4,
		signed_integer = {inv_add_1_adder2_w, inv_add_1_adder1_w},
		sticky_bit_w = sticky_or[21],
		sticky_bus = wire_altbarrel_shift6_result[21:0],
		sticky_or = {(sticky_or[20] | sticky_bus[21]), (sticky_or[19] | sticky_bus[20]), (sticky_or[18] | sticky_bus[19]), (sticky_or[17] | sticky_bus[18]), (sticky_or[16] | sticky_bus[17]), (sticky_or[15] | sticky_bus[16]), (sticky_or[14] | sticky_bus[15]), (sticky_or[13] | sticky_bus[14]), (sticky_or[12] | sticky_bus[13]), (sticky_or[11] | sticky_bus[12]), (sticky_or[10] | sticky_bus[11]), (sticky_or[9] | sticky_bus[10]), (sticky_or[8] | sticky_bus[9]), (sticky_or[7] | sticky_bus[8]), (sticky_or[6] | sticky_bus[7]), (sticky_or[5] | sticky_bus[6]), (sticky_or[4] | sticky_bus[5]), (sticky_or[3] | sticky_bus[4]), (sticky_or[2] | sticky_bus[3]), (sticky_or[1] | sticky_bus[2]), (sticky_or[0] | sticky_bus[1]), sticky_bus[0]},
		unsigned_integer = integer_rounded_reg,
		upper_limit_w = (((~ sign_input_reg3) & (exceed_upper_limit_reg3 | equal_upper_limit_reg3)) | (sign_input_reg3 & (exceed_upper_limit_reg3 | (equal_upper_limit_reg3 & (int_or_reg3 | add_1_w))))),
		zero_input_w = ((~ exp_or_reg4) & (~ man_or_reg4));
endmodule