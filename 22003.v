module  sin_altfp_sincos_47e
	(
	clock,
	data,
	result) ;
	input   clock;
	input   [31:0]  data;
	output   [31:0]  result;
	wire  [33:0]   wire_ccc_cordic_m_sincos;
	wire  [35:0]   wire_crr_fp_range1_circle;
	wire  [35:0]   wire_crr_fp_range1_negcircle;
	wire  [5:0]   wire_clz_q;
	reg	[5:0]	countff;
	reg	[7:0]	exponentinff;
	reg	[7:0]	exponentnormff;
	reg	[7:0]	exponentoutff;
	reg	[35:0]	fixed_sincosff;
	reg	[31:0]	input_delay_ff_0;
	reg	[31:0]	input_delay_ff_1;
	reg	[31:0]	input_delay_ff_10;
	reg	[31:0]	input_delay_ff_11;
	reg	[31:0]	input_delay_ff_12;
	reg	[31:0]	input_delay_ff_13;
	reg	[31:0]	input_delay_ff_14;
	reg	[31:0]	input_delay_ff_15;
	reg	[31:0]	input_delay_ff_16;
	reg	[31:0]	input_delay_ff_17;
	reg	[31:0]	input_delay_ff_18;
	reg	[31:0]	input_delay_ff_19;
	reg	[31:0]	input_delay_ff_2;
	reg	[31:0]	input_delay_ff_20;
	reg	[31:0]	input_delay_ff_21;
	reg	[31:0]	input_delay_ff_22;
	reg	[31:0]	input_delay_ff_23;
	reg	[31:0]	input_delay_ff_24;
	reg	[31:0]	input_delay_ff_25;
	reg	[31:0]	input_delay_ff_26;
	reg	[31:0]	input_delay_ff_27;
	reg	[31:0]	input_delay_ff_28;
	reg	[31:0]	input_delay_ff_29;
	reg	[31:0]	input_delay_ff_3;
	reg	[31:0]	input_delay_ff_30;
	reg	[31:0]	input_delay_ff_31;
	reg	[31:0]	input_delay_ff_32;
	reg	[31:0]	input_delay_ff_33;
	reg	[31:0]	input_delay_ff_34;
	reg	[31:0]	input_delay_ff_4;
	reg	[31:0]	input_delay_ff_5;
	reg	[31:0]	input_delay_ff_6;
	reg	[31:0]	input_delay_ff_7;
	reg	[31:0]	input_delay_ff_8;
	reg	[31:0]	input_delay_ff_9;
	reg	[22:0]	mantissanormff;
	reg	[22:0]	mantissaoutff;
	reg	[35:0]	quadrant_sumff;
	reg	[3:0]	select_sincosff;
	reg	[33:0]	selectoutputff;
	reg	[23:0]	signcalcff;
	reg	[10:0]	signinff;
	reg	signoutff;
	wire  [8:0]   wire_exponentcheck_sub_result;
	wire  [7:0]   wire_exponentnorm_add_result;
	wire  [7:0]   wire_exponentnormmode_sub_result;
	wire  [22:0]   wire_mantissanorm_add_result;
	wire  [35:0]   wire_quadrantsum_add_result;
	wire  [35:0]   wire_sft_result;
	wire  [33:0]   wire_cmul_result;
	wire aclr;
	wire  [35:0]  circle_w;
	wire clk_en;
	wire  [5:0]  countnode_w;
	wire  [8:0]  exponentcheck_w;
	wire  [7:0]  exponentnormmode_w;
	wire  [33:0]  fixed_sincos_w;
	wire  [35:0]  fixed_sincosnode_w;
	wire  [35:0]  fraction_quadrant_w;
	wire  indexbit_w;
	wire  [15:0]  indexcheck_w;
	wire  [31:0]  input_number_delay_w;
	wire  [31:0]  input_number_w;
	wire  [35:0]  mantissanormnode_w;
	wire  [35:0]  negative_quadrant_w;
	wire  [35:0]  negcircle_w;
	wire  [35:0]  one_term_w;
	wire  [23:0]  overflownode_w;
	wire  [35:0]  piovertwo_w;
	wire  [35:0]  positive_quadrant_w;
	wire  [33:0]  quadrant_w;
	wire  quadrantselect_w;
	wire  quadrantsign_w;
	wire  [33:0]  radiansnode_w;
	wire  [7:0]  value_128_w;
	wire  [7:0]  value_x73_w;
	wire  [35:0]  zerovec_w;
	sin_altfp_sincos_cordic_m_e5e   ccc_cordic_m
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.indexbit(indexbit_w),
	.radians(radiansnode_w),
	.sincos(wire_ccc_cordic_m_sincos),
	.sincosbit(select_sincosff[3]));
	sin_altfp_sincos_range_b6c   crr_fp_range1
	(
	.aclr(aclr),
	.circle(wire_crr_fp_range1_circle),
	.clken(clk_en),
	.clock(clock),
	.data(data),
	.negcircle(wire_crr_fp_range1_negcircle));
	sin_altpriority_encoder_0c6   clz
	(
	.data({fixed_sincosnode_w, {28{1'b1}}}),
	.q(wire_clz_q));
	// synopsys translate_off
	initial
		countff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) countff <= 6'b0;
		else if  (clk_en == 1'b1)   countff <= countnode_w;
	// synopsys translate_off
	initial
		exponentinff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exponentinff <= 8'b0;
		else if  (clk_en == 1'b1)   exponentinff <= data[30:23];
	// synopsys translate_off
	initial
		exponentnormff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exponentnormff <= 8'b0;
		else if  (clk_en == 1'b1)   exponentnormff <= wire_exponentnorm_add_result;
	// synopsys translate_off
	initial
		exponentoutff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exponentoutff <= 8'b0;
		else if  (clk_en == 1'b1)   exponentoutff <= ((exponentnormff & {8{(~ selectoutputff[33])}}) | (input_number_delay_w[30:23] & {8{selectoutputff[33]}}));
	// synopsys translate_off
	initial
		fixed_sincosff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) fixed_sincosff <= 36'b0;
		else if  (clk_en == 1'b1)   fixed_sincosff <= fixed_sincosnode_w;
	// synopsys translate_off
	initial
		input_delay_ff_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_0 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_0 <= input_number_w;
	// synopsys translate_off
	initial
		input_delay_ff_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_1 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_1 <= input_delay_ff_0;
	// synopsys translate_off
	initial
		input_delay_ff_10 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_10 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_10 <= input_delay_ff_9;
	// synopsys translate_off
	initial
		input_delay_ff_11 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_11 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_11 <= input_delay_ff_10;
	// synopsys translate_off
	initial
		input_delay_ff_12 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_12 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_12 <= input_delay_ff_11;
	// synopsys translate_off
	initial
		input_delay_ff_13 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_13 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_13 <= input_delay_ff_12;
	// synopsys translate_off
	initial
		input_delay_ff_14 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_14 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_14 <= input_delay_ff_13;
	// synopsys translate_off
	initial
		input_delay_ff_15 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_15 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_15 <= input_delay_ff_14;
	// synopsys translate_off
	initial
		input_delay_ff_16 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_16 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_16 <= input_delay_ff_15;
	// synopsys translate_off
	initial
		input_delay_ff_17 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_17 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_17 <= input_delay_ff_16;
	// synopsys translate_off
	initial
		input_delay_ff_18 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_18 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_18 <= input_delay_ff_17;
	// synopsys translate_off
	initial
		input_delay_ff_19 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_19 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_19 <= input_delay_ff_18;
	// synopsys translate_off
	initial
		input_delay_ff_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_2 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_2 <= input_delay_ff_1;
	// synopsys translate_off
	initial
		input_delay_ff_20 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_20 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_20 <= input_delay_ff_19;
	// synopsys translate_off
	initial
		input_delay_ff_21 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_21 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_21 <= input_delay_ff_20;
	// synopsys translate_off
	initial
		input_delay_ff_22 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_22 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_22 <= input_delay_ff_21;
	// synopsys translate_off
	initial
		input_delay_ff_23 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_23 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_23 <= input_delay_ff_22;
	// synopsys translate_off
	initial
		input_delay_ff_24 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_24 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_24 <= input_delay_ff_23;
	// synopsys translate_off
	initial
		input_delay_ff_25 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_25 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_25 <= input_delay_ff_24;
	// synopsys translate_off
	initial
		input_delay_ff_26 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_26 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_26 <= input_delay_ff_25;
	// synopsys translate_off
	initial
		input_delay_ff_27 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_27 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_27 <= input_delay_ff_26;
	// synopsys translate_off
	initial
		input_delay_ff_28 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_28 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_28 <= input_delay_ff_27;
	// synopsys translate_off
	initial
		input_delay_ff_29 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_29 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_29 <= input_delay_ff_28;
	// synopsys translate_off
	initial
		input_delay_ff_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_3 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_3 <= input_delay_ff_2;
	// synopsys translate_off
	initial
		input_delay_ff_30 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_30 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_30 <= input_delay_ff_29;
	// synopsys translate_off
	initial
		input_delay_ff_31 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_31 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_31 <= input_delay_ff_30;
	// synopsys translate_off
	initial
		input_delay_ff_32 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_32 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_32 <= input_delay_ff_31;
	// synopsys translate_off
	initial
		input_delay_ff_33 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_33 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_33 <= input_delay_ff_32;
	// synopsys translate_off
	initial
		input_delay_ff_34 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_34 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_34 <= input_delay_ff_33;
	// synopsys translate_off
	initial
		input_delay_ff_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_4 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_4 <= input_delay_ff_3;
	// synopsys translate_off
	initial
		input_delay_ff_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_5 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_5 <= input_delay_ff_4;
	// synopsys translate_off
	initial
		input_delay_ff_6 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_6 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_6 <= input_delay_ff_5;
	// synopsys translate_off
	initial
		input_delay_ff_7 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_7 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_7 <= input_delay_ff_6;
	// synopsys translate_off
	initial
		input_delay_ff_8 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_8 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_8 <= input_delay_ff_7;
	// synopsys translate_off
	initial
		input_delay_ff_9 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_delay_ff_9 <= 32'b0;
		else if  (clk_en == 1'b1)   input_delay_ff_9 <= input_delay_ff_8;
	// synopsys translate_off
	initial
		mantissanormff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) mantissanormff <= 23'b0;
		else if  (clk_en == 1'b1)   mantissanormff <= wire_mantissanorm_add_result;
	// synopsys translate_off
	initial
		mantissaoutff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) mantissaoutff <= 23'b0;
		else if  (clk_en == 1'b1)   mantissaoutff <= ((mantissanormff & {23{(~ selectoutputff[33])}}) | (input_number_delay_w[22:0] & {23{selectoutputff[33]}}));
	// synopsys translate_off
	initial
		quadrant_sumff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) quadrant_sumff <= 36'b0;
		else if  (clk_en == 1'b1)   quadrant_sumff <= wire_quadrantsum_add_result;
	// synopsys translate_off
	initial
		select_sincosff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) select_sincosff <= 4'b0;
		else if  (clk_en == 1'b1)   select_sincosff <= {select_sincosff[2:0], quadrant_w[33]};
	// synopsys translate_off
	initial
		selectoutputff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) selectoutputff <= 34'b0;
		else if  (clk_en == 1'b1)   selectoutputff <= {selectoutputff[32:0], exponentcheck_w[8]};
	// synopsys translate_off
	initial
		signcalcff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) signcalcff <= 24'b0;
		else if  (clk_en == 1'b1)   signcalcff <= {signcalcff[22:0], (quadrantsign_w ^ signinff[10])};
	// synopsys translate_off
	initial
		signinff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) signinff <= 11'b0;
		else if  (clk_en == 1'b1)   signinff <= {signinff[9:0], data[31]};
	// synopsys translate_off
	initial
		signoutff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) signoutff <= 1'b0;
		else if  (clk_en == 1'b1)   signoutff <= ((signcalcff[23] & (~ selectoutputff[33])) | (input_number_delay_w[31] & selectoutputff[33]));
	lpm_add_sub   exponentcheck_sub
	(
	.cout(),
	.dataa({1'b0, exponentinff}),
	.datab({1'b0, value_x73_w}),
	.overflow(),
	.result(wire_exponentcheck_sub_result)
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
		exponentcheck_sub.lpm_direction = "SUB",
		exponentcheck_sub.lpm_representation = "UNSIGNED",
		exponentcheck_sub.lpm_width = 9,
		exponentcheck_sub.lpm_type = "lpm_add_sub";
	lpm_add_sub   exponentnorm_add
	(
	.cout(),
	.dataa(exponentnormmode_w[7:0]),
	.datab({{7{1'b0}}, overflownode_w[23]}),
	.overflow(),
	.result(wire_exponentnorm_add_result)
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
		exponentnorm_add.lpm_direction = "ADD",
		exponentnorm_add.lpm_representation = "UNSIGNED",
		exponentnorm_add.lpm_width = 8,
		exponentnorm_add.lpm_type = "lpm_add_sub";
	lpm_add_sub   exponentnormmode_sub
	(
	.cout(),
	.dataa(value_128_w),
	.datab({{2{1'b0}}, countff}),
	.overflow(),
	.result(wire_exponentnormmode_sub_result)
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
		exponentnormmode_sub.lpm_direction = "SUB",
		exponentnormmode_sub.lpm_representation = "UNSIGNED",
		exponentnormmode_sub.lpm_width = 8,
		exponentnormmode_sub.lpm_type = "lpm_add_sub";
	lpm_add_sub   mantissanorm_add
	(
	.cout(),
	.dataa(mantissanormnode_w[34:12]),
	.datab({{22{1'b0}}, mantissanormnode_w[11]}),
	.overflow(),
	.result(wire_mantissanorm_add_result)
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
		mantissanorm_add.lpm_direction = "ADD",
		mantissanorm_add.lpm_representation = "UNSIGNED",
		mantissanorm_add.lpm_width = 23,
		mantissanorm_add.lpm_type = "lpm_add_sub";
	lpm_add_sub   quadrantsum_add
	(
	.cin((~ quadrant_w[33])),
	.cout(),
	.dataa(one_term_w),
	.datab(fraction_quadrant_w),
	.overflow(),
	.result(wire_quadrantsum_add_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		quadrantsum_add.lpm_direction = "ADD",
		quadrantsum_add.lpm_representation = "UNSIGNED",
		quadrantsum_add.lpm_width = 36,
		quadrantsum_add.lpm_type = "lpm_add_sub";
	lpm_clshift   sft
	(
	.data(fixed_sincosff),
	.direction(1'b0),
	.distance(countff),
	.overflow(),
	.result(wire_sft_result),
	.underflow()
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
		sft.lpm_width = 36,
		sft.lpm_widthdist = 6,
		sft.lpm_type = "lpm_clshift";
	lpm_mult   cmul
	(
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa(quadrant_sumff),
	.datab(piovertwo_w),
	.result(wire_cmul_result)
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
		cmul.lpm_pipeline = 3,
		cmul.lpm_representation = "UNSIGNED",
		cmul.lpm_widtha = 36,
		cmul.lpm_widthb = 36,
		cmul.lpm_widthp = 34,
		cmul.lpm_type = "lpm_mult";
	assign
		aclr = 1'b0,
		circle_w = wire_crr_fp_range1_circle,
		clk_en = 1'b1,
		countnode_w = (~ wire_clz_q),
		exponentcheck_w = wire_exponentcheck_sub_result,
		exponentnormmode_w = wire_exponentnormmode_sub_result,
		fixed_sincos_w = wire_ccc_cordic_m_sincos,
		fixed_sincosnode_w = {fixed_sincos_w, zerovec_w[1:0]},
		fraction_quadrant_w = ((positive_quadrant_w & {36{quadrant_w[33]}}) | (negative_quadrant_w & {36{(~ quadrant_w[33])}})),
		indexbit_w = (~ indexcheck_w[3]),
		indexcheck_w = {(indexcheck_w[14] | radiansnode_w[18]), (indexcheck_w[13] | radiansnode_w[19]), (indexcheck_w[12] | radiansnode_w[20]), (indexcheck_w[11] | radiansnode_w[21]), (indexcheck_w[10] | radiansnode_w[22]), (indexcheck_w[9] | radiansnode_w[23]), (indexcheck_w[8] | radiansnode_w[24]), (indexcheck_w[7] | radiansnode_w[25]), (indexcheck_w[6] | radiansnode_w[26]), (indexcheck_w[5] | radiansnode_w[27]), (indexcheck_w[4] | radiansnode_w[28]), (indexcheck_w[3] | radiansnode_w[29]), (indexcheck_w[2] | radiansnode_w[30]), (indexcheck_w[1] | radiansnode_w[31]), (indexcheck_w[0] | radiansnode_w[32]), radiansnode_w[32]},
		input_number_delay_w = input_delay_ff_34,
		input_number_w = data,
		mantissanormnode_w = wire_sft_result,
		negative_quadrant_w = (~ positive_quadrant_w),
		negcircle_w = wire_crr_fp_range1_negcircle,
		one_term_w = {(~ quadrant_w[33]), zerovec_w[34:0]},
		overflownode_w = {(mantissanormnode_w[34] & overflownode_w[22]), (mantissanormnode_w[33] & overflownode_w[21]), (mantissanormnode_w[32] & overflownode_w[20]), (mantissanormnode_w[31] & overflownode_w[19]), (mantissanormnode_w[30] & overflownode_w[18]), (mantissanormnode_w[29] & overflownode_w[17]), (mantissanormnode_w[28] & overflownode_w[16]), (mantissanormnode_w[27] & overflownode_w[15]), (mantissanormnode_w[26] & overflownode_w[14]), (mantissanormnode_w[25] & overflownode_w[13]), (mantissanormnode_w[24] & overflownode_w[12]), (mantissanormnode_w[23] & overflownode_w[11]), (mantissanormnode_w[22] & overflownode_w[10]), (mantissanormnode_w[21] & overflownode_w[9]), (mantissanormnode_w[20] & overflownode_w[8]), (mantissanormnode_w[19] & overflownode_w[7]), (mantissanormnode_w[18] & overflownode_w[6]), (mantissanormnode_w[17] & overflownode_w[5]), (mantissanormnode_w[16] & overflownode_w[4]), (mantissanormnode_w[15] & overflownode_w[3]), (mantissanormnode_w[14] & overflownode_w[2]), (mantissanormnode_w[13] & overflownode_w[1]), (mantissanormnode_w[12] & overflownode_w[0]), mantissanormnode_w[11]},
		piovertwo_w = 36'b110010010000111111011010101000100010,
		positive_quadrant_w = {1'b0, quadrant_w, 1'b0},
		quadrant_w = ((circle_w[33:0] & {34{(~ quadrantselect_w)}}) | (negcircle_w[33:0] & {34{quadrantselect_w}})),
		quadrantselect_w = circle_w[34],
		quadrantsign_w = circle_w[35],
		radiansnode_w = wire_cmul_result,
		result = {signoutff, exponentoutff, mantissaoutff},
		value_128_w = 8'b10000000,
		value_x73_w = 8'b01110011,
		zerovec_w = {36{1'b0}};
endmodule