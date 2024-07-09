module  int_to_fp_altfp_convert_0jn
	(
	clk_en,
	clock,
	dataa,
	result) ;
	input   clk_en;
	input   clock;
	input   [31:0]  dataa;
	output   [63:0]  result;
	wire  [31:0]   wire_altbarrel_shift5_result;
	wire  [4:0]   wire_altpriority_encoder2_q;
	reg	[10:0]	exponent_bus_pre_reg;
	reg	[10:0]	exponent_bus_pre_reg2;
	reg	[10:0]	exponent_bus_pre_reg3;
	reg	[30:0]	mag_int_a_reg;
	reg	[30:0]	mag_int_a_reg2;
	reg	[52:0]	mantissa_pre_round_reg;
	reg	[4:0]	priority_encoder_reg;
	reg	[63:0]	result_reg;
	reg	sign_int_a_reg1;
	reg	sign_int_a_reg2;
	reg	sign_int_a_reg3;
	reg	sign_int_a_reg4;
	reg	sign_int_a_reg5;
	wire  [30:0]   wire_add_sub1_result;
	wire  [10:0]   wire_add_sub3_result;
	wire  wire_cmpr4_alb;
	wire aclr;
	wire  [10:0]  bias_value_w;
	wire  [10:0]  const_bias_value_add_width_int_w;
	wire  [10:0]  exceptions_value;
	wire  [10:0]  exponent_bus;
	wire  [10:0]  exponent_bus_pre;
	wire  [10:0]  exponent_output_w;
	wire  [10:0]  exponent_rounded;
	wire  [10:0]  exponent_zero_w;
	wire  [30:0]  int_a;
	wire  [30:0]  int_a_2s;
	wire  [30:0]  invert_int_a;
	wire  [4:0]  leading_zeroes;
	wire  [30:0]  mag_int_a;
	wire  [51:0]  mantissa_bus;
	wire  [52:0]  mantissa_pre_round;
	wire  [52:0]  mantissa_rounded;
	wire  max_neg_value_selector;
	wire  [10:0]  max_neg_value_w;
	wire  [10:0]  minus_leading_zero;
	wire  [31:0]  prio_mag_int_a;
	wire  [63:0]  result_w;
	wire  [30:0]  shifted_mag_int_a;
	wire  sign_bus;
	wire  sign_int_a;
	wire  [5:0]  zero_padding_w;
	int_to_fp_altbarrel_shift_brf   altbarrel_shift5
	(
	.aclr(aclr),
	.clk_en(clk_en),
	.clock(clock),
	.data({1'b0, mag_int_a_reg2}),
	.distance(leading_zeroes),
	.result(wire_altbarrel_shift5_result));
	int_to_fp_altpriority_encoder_qb6   altpriority_encoder2
	(
	.data(prio_mag_int_a),
	.q(wire_altpriority_encoder2_q));
	// synopsys translate_off
	initial
		exponent_bus_pre_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exponent_bus_pre_reg <= 11'b0;
		else if  (clk_en == 1'b1)   exponent_bus_pre_reg <= exponent_bus_pre_reg2;
	// synopsys translate_off
	initial
		exponent_bus_pre_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exponent_bus_pre_reg2 <= 11'b0;
		else if  (clk_en == 1'b1)   exponent_bus_pre_reg2 <= exponent_bus_pre_reg3;
	// synopsys translate_off
	initial
		exponent_bus_pre_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exponent_bus_pre_reg3 <= 11'b0;
		else if  (clk_en == 1'b1)   exponent_bus_pre_reg3 <= exponent_bus_pre;
	// synopsys translate_off
	initial
		mag_int_a_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) mag_int_a_reg <= 31'b0;
		else if  (clk_en == 1'b1)   mag_int_a_reg <= mag_int_a;
	// synopsys translate_off
	initial
		mag_int_a_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) mag_int_a_reg2 <= 31'b0;
		else if  (clk_en == 1'b1)   mag_int_a_reg2 <= mag_int_a_reg;
	// synopsys translate_off
	initial
		mantissa_pre_round_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) mantissa_pre_round_reg <= 53'b0;
		else if  (clk_en == 1'b1)   mantissa_pre_round_reg <= mantissa_pre_round;
	// synopsys translate_off
	initial
		priority_encoder_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) priority_encoder_reg <= 5'b0;
		else if  (clk_en == 1'b1)   priority_encoder_reg <= wire_altpriority_encoder2_q;
	// synopsys translate_off
	initial
		result_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) result_reg <= 64'b0;
		else if  (clk_en == 1'b1)   result_reg <= result_w;
	// synopsys translate_off
	initial
		sign_int_a_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_int_a_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_int_a_reg1 <= sign_int_a;
	// synopsys translate_off
	initial
		sign_int_a_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_int_a_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_int_a_reg2 <= sign_int_a_reg1;
	// synopsys translate_off
	initial
		sign_int_a_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_int_a_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_int_a_reg3 <= sign_int_a_reg2;
	// synopsys translate_off
	initial
		sign_int_a_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_int_a_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_int_a_reg4 <= sign_int_a_reg3;
	// synopsys translate_off
	initial
		sign_int_a_reg5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_int_a_reg5 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_int_a_reg5 <= sign_int_a_reg4;
	lpm_add_sub   add_sub1
	(
	.cout(),
	.dataa(invert_int_a),
	.datab(31'b0000000000000000000000000000001),
	.overflow(),
	.result(wire_add_sub1_result)
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
		add_sub1.lpm_direction = "ADD",
		add_sub1.lpm_width = 31,
		add_sub1.lpm_type = "lpm_add_sub",
		add_sub1.lpm_hint = "ONE_INPUT_IS_CONSTANT=YES";
	lpm_add_sub   add_sub3
	(
	.cout(),
	.dataa(const_bias_value_add_width_int_w),
	.datab(minus_leading_zero),
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
		add_sub3.lpm_width = 11,
		add_sub3.lpm_type = "lpm_add_sub",
		add_sub3.lpm_hint = "ONE_INPUT_IS_CONSTANT=YES";
	lpm_compare   cmpr4
	(
	.aeb(),
	.agb(),
	.ageb(),
	.alb(wire_cmpr4_alb),
	.aleb(),
	.aneb(),
	.dataa(exponent_output_w),
	.datab(bias_value_w)
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
		cmpr4.lpm_representation = "UNSIGNED",
		cmpr4.lpm_width = 11,
		cmpr4.lpm_type = "lpm_compare";
	assign
		aclr = 1'b0,
		bias_value_w = 11'b01111111111,
		const_bias_value_add_width_int_w = 11'b10000011101,
		exceptions_value = (({11{(~ max_neg_value_selector)}} & exponent_zero_w) | ({11{max_neg_value_selector}} & max_neg_value_w)),
		exponent_bus = exponent_rounded,
		exponent_bus_pre = (({11{(~ wire_cmpr4_alb)}} & exponent_output_w) | ({11{wire_cmpr4_alb}} & exceptions_value)),
		exponent_output_w = wire_add_sub3_result,
		exponent_rounded = exponent_bus_pre_reg,
		exponent_zero_w = {11{1'b0}},
		int_a = dataa[30:0],
		int_a_2s = wire_add_sub1_result,
		invert_int_a = (~ int_a),
		leading_zeroes = (~ priority_encoder_reg),
		mag_int_a = (({31{(~ sign_int_a)}} & int_a) | ({31{sign_int_a}} & int_a_2s)),
		mantissa_bus = mantissa_rounded[51:0],
		mantissa_pre_round = {shifted_mag_int_a[30:0], 22'b0000000000000000000000},
		mantissa_rounded = mantissa_pre_round_reg,
		max_neg_value_selector = (wire_cmpr4_alb & sign_int_a_reg2),
		max_neg_value_w = 11'b10000011110,
		minus_leading_zero = {zero_padding_w, leading_zeroes},
		prio_mag_int_a = {mag_int_a_reg, 1'b1},
		result = result_reg,
		result_w = {sign_bus, exponent_bus, mantissa_bus},
		shifted_mag_int_a = wire_altbarrel_shift5_result[30:0],
		sign_bus = sign_int_a_reg5,
		sign_int_a = dataa[31],
		zero_padding_w = {6{1'b0}};
endmodule