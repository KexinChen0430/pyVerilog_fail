module  sin_altfp_sincos_range_b6c
	(
	aclr,
	circle,
	clken,
	clock,
	data,
	negcircle) ;
	input   aclr;
	output   [35:0]  circle;
	input   clken;
	input   clock;
	input   [31:0]  data;
	output   [35:0]  negcircle;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clken;
	tri0   clock;
	tri0   [31:0]  data;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  [35:0]   wire_fp_range_table1_basefraction;
	wire  [7:0]   wire_fp_range_table1_incexponent;
	wire  [55:0]   wire_fp_range_table1_incmantissa;
	wire  [4:0]   wire_clz23_q;
	reg	[35:0]	basefractiondelff;
	reg	[35:0]	basefractionff;
	reg	[35:0]	cbfd_0;
	reg	[35:0]	cbfd_1;
	reg	[35:0]	cbfd_2;
	reg	[35:0]	cbfd_3;
	reg	[35:0]	cbfd_4;
	reg	[35:0]	cbfd_5;
	reg	[36:0]	circleff;
	reg	[7:0]	exponentff;
	reg	[7:0]	incexponentff;
	reg	[55:0]	incmantissaff;
	reg	[4:0]	leadff;
	reg	[22:0]	mantissadelff;
	reg	[22:0]	mantissaff;
	reg	[22:0]	mantissamultiplierff;
	reg	[77:0]	multipliernormff;
	reg	[35:0]	negbasefractiondelff;
	reg	[36:0]	negcircleff;
	reg	[8:0]	negrangeexponentff4;
	reg	[8:0]	negrangeexponentff5;
	reg	[8:0]	rangeexponentff_0;
	reg	[8:0]	rangeexponentff_1;
	reg	[8:0]	rangeexponentff_2;
	reg	[8:0]	rangeexponentff_3;
	reg	[8:0]	rangeexponentff_4;
	reg	[8:0]	rangeexponentff_5;
	reg	[77:0]	rotateff;
	reg	[7:0]	tableaddressff;
	wire  [36:0]   wire_circle_add_result;
	wire  [8:0]   wire_exponent_adjust_sub_result;
	wire  [35:0]   wire_negbasedractiondel_sub_result;
	wire  [36:0]   wire_negcircle_add_result;
	wire  [8:0]   wire_negrangeexponent_sub4_result;
	wire  [8:0]   wire_negrangeexponent_sub5_result;
	wire  [8:0]   wire_rangeexponent_sub1_result;
	wire  [8:0]   wire_rangeexponent_sub5_result;
	wire  [22:0]   wire_csftin_result;
	wire  [77:0]   wire_fp_lsft_rsft78_result;
	wire  [78:0]   wire_mult23x56_result;
	wire  [35:0]  basefractiondelnode_w;
	wire  [35:0]  basefractionnode_w;
	wire  [36:0]  circlenode_w;
	wire  [8:0]  const_23_w;
	wire  [7:0]  incexponentnode_w;
	wire  [55:0]  incmantissanode_w;
	wire  [4:0]  leadnode_w;
	wire  [8:0]  mantissaexponentnode_w;
	wire  [22:0]  mantissamultipliernode_w;
	wire  [78:0]  multipliernode_w;
	wire  [77:0]  multipliernormnode_w;
	wire  [35:0]  negbasefractiondelnode_w;
	wire  [36:0]  negcirclenode_w;
	wire  [35:0]  negrotatenode_w;
	wire  [77:0]  rotatenode_w;
	sin_altfp_sincos_srrt_koa   fp_range_table1
	(
	.address(tableaddressff),
	.basefraction(wire_fp_range_table1_basefraction),
	.incexponent(wire_fp_range_table1_incexponent),
	.incmantissa(wire_fp_range_table1_incmantissa));
	sin_altpriority_encoder_qb6   clz23
	(
	.data({mantissaff, {9{1'b1}}}),
	.q(wire_clz23_q));
	// synopsys translate_off
	initial
		basefractiondelff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) basefractiondelff <= 36'b0;
		else if  (clken == 1'b1)   basefractiondelff <= basefractiondelnode_w;
	// synopsys translate_off
	initial
		basefractionff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) basefractionff <= 36'b0;
		else if  (clken == 1'b1)   basefractionff <= basefractionnode_w;
	// synopsys translate_off
	initial
		cbfd_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) cbfd_0 <= 36'b0;
		else if  (clken == 1'b1)   cbfd_0 <= basefractionff;
	// synopsys translate_off
	initial
		cbfd_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) cbfd_1 <= 36'b0;
		else if  (clken == 1'b1)   cbfd_1 <= cbfd_0;
	// synopsys translate_off
	initial
		cbfd_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) cbfd_2 <= 36'b0;
		else if  (clken == 1'b1)   cbfd_2 <= cbfd_1;
	// synopsys translate_off
	initial
		cbfd_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) cbfd_3 <= 36'b0;
		else if  (clken == 1'b1)   cbfd_3 <= cbfd_2;
	// synopsys translate_off
	initial
		cbfd_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) cbfd_4 <= 36'b0;
		else if  (clken == 1'b1)   cbfd_4 <= cbfd_3;
	// synopsys translate_off
	initial
		cbfd_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) cbfd_5 <= 36'b0;
		else if  (clken == 1'b1)   cbfd_5 <= cbfd_4;
	// synopsys translate_off
	initial
		circleff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) circleff <= 37'b0;
		else if  (clken == 1'b1)   circleff <= circlenode_w;
	// synopsys translate_off
	initial
		exponentff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exponentff <= 8'b0;
		else if  (clken == 1'b1)   exponentff <= data[30:23];
	// synopsys translate_off
	initial
		incexponentff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) incexponentff <= 8'b0;
		else if  (clken == 1'b1)   incexponentff <= incexponentnode_w;
	// synopsys translate_off
	initial
		incmantissaff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) incmantissaff <= 56'b0;
		else if  (clken == 1'b1)   incmantissaff <= incmantissanode_w;
	// synopsys translate_off
	initial
		leadff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) leadff <= 5'b0;
		else if  (clken == 1'b1)   leadff <= leadnode_w;
	// synopsys translate_off
	initial
		mantissadelff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) mantissadelff <= 23'b0;
		else if  (clken == 1'b1)   mantissadelff <= mantissaff;
	// synopsys translate_off
	initial
		mantissaff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) mantissaff <= 23'b0;
		else if  (clken == 1'b1)   mantissaff <= data[22:0];
	// synopsys translate_off
	initial
		mantissamultiplierff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) mantissamultiplierff <= 23'b0;
		else if  (clken == 1'b1)   mantissamultiplierff <= mantissamultipliernode_w;
	// synopsys translate_off
	initial
		multipliernormff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) multipliernormff <= 78'b0;
		else if  (clken == 1'b1)   multipliernormff <= multipliernormnode_w;
	// synopsys translate_off
	initial
		negbasefractiondelff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) negbasefractiondelff <= 36'b0;
		else if  (clken == 1'b1)   negbasefractiondelff <= negbasefractiondelnode_w;
	// synopsys translate_off
	initial
		negcircleff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) negcircleff <= 37'b0;
		else if  (clken == 1'b1)   negcircleff <= negcirclenode_w;
	// synopsys translate_off
	initial
		negrangeexponentff4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) negrangeexponentff4 <= 9'b0;
		else if  (clken == 1'b1)   negrangeexponentff4 <= wire_negrangeexponent_sub4_result;
	// synopsys translate_off
	initial
		negrangeexponentff5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) negrangeexponentff5 <= 9'b0;
		else if  (clken == 1'b1)   negrangeexponentff5 <= wire_negrangeexponent_sub5_result;
	// synopsys translate_off
	initial
		rangeexponentff_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rangeexponentff_0 <= 9'b0;
		else if  (clken == 1'b1)   rangeexponentff_0 <= mantissaexponentnode_w;
	// synopsys translate_off
	initial
		rangeexponentff_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rangeexponentff_1 <= 9'b0;
		else if  (clken == 1'b1)   rangeexponentff_1 <= wire_rangeexponent_sub1_result;
	// synopsys translate_off
	initial
		rangeexponentff_2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rangeexponentff_2 <= 9'b0;
		else if  (clken == 1'b1)   rangeexponentff_2 <= rangeexponentff_1;
	// synopsys translate_off
	initial
		rangeexponentff_3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rangeexponentff_3 <= 9'b0;
		else if  (clken == 1'b1)   rangeexponentff_3 <= rangeexponentff_2;
	// synopsys translate_off
	initial
		rangeexponentff_4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rangeexponentff_4 <= 9'b0;
		else if  (clken == 1'b1)   rangeexponentff_4 <= rangeexponentff_3;
	// synopsys translate_off
	initial
		rangeexponentff_5 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rangeexponentff_5 <= 9'b0;
		else if  (clken == 1'b1)   rangeexponentff_5 <= wire_rangeexponent_sub5_result;
	// synopsys translate_off
	initial
		rotateff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) rotateff <= 78'b0;
		else if  (clken == 1'b1)   rotateff <= rotatenode_w;
	// synopsys translate_off
	initial
		tableaddressff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) tableaddressff <= 8'b0;
		else if  (clken == 1'b1)   tableaddressff <= exponentff;
	lpm_add_sub   circle_add
	(
	.cout(),
	.dataa({1'b0, basefractiondelff}),
	.datab({1'b0, rotateff[77:42]}),
	.overflow(),
	.result(wire_circle_add_result)
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
		circle_add.lpm_direction = "ADD",
		circle_add.lpm_representation = "UNSIGNED",
		circle_add.lpm_width = 37,
		circle_add.lpm_type = "lpm_add_sub";
	lpm_add_sub   exponent_adjust_sub
	(
	.cout(),
	.dataa(const_23_w),
	.datab({{4{1'b0}}, leadff}),
	.overflow(),
	.result(wire_exponent_adjust_sub_result)
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
		exponent_adjust_sub.lpm_direction = "SUB",
		exponent_adjust_sub.lpm_representation = "UNSIGNED",
		exponent_adjust_sub.lpm_width = 9,
		exponent_adjust_sub.lpm_type = "lpm_add_sub";
	lpm_add_sub   negbasedractiondel_sub
	(
	.cout(),
	.dataa({36{1'b0}}),
	.datab(basefractiondelnode_w[35:0]),
	.overflow(),
	.result(wire_negbasedractiondel_sub_result)
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
		negbasedractiondel_sub.lpm_direction = "SUB",
		negbasedractiondel_sub.lpm_representation = "UNSIGNED",
		negbasedractiondel_sub.lpm_width = 36,
		negbasedractiondel_sub.lpm_type = "lpm_add_sub";
	lpm_add_sub   negcircle_add
	(
	.cin(1'b1),
	.cout(),
	.dataa({1'b1, negbasefractiondelff}),
	.datab({1'b1, negrotatenode_w}),
	.overflow(),
	.result(wire_negcircle_add_result)
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
		negcircle_add.lpm_direction = "ADD",
		negcircle_add.lpm_representation = "UNSIGNED",
		negcircle_add.lpm_width = 37,
		negcircle_add.lpm_type = "lpm_add_sub";
	lpm_add_sub   negrangeexponent_sub4
	(
	.cout(),
	.dataa({1'b1, {8{1'b0}}}),
	.datab(rangeexponentff_3),
	.overflow(),
	.result(wire_negrangeexponent_sub4_result)
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
		negrangeexponent_sub4.lpm_direction = "SUB",
		negrangeexponent_sub4.lpm_representation = "UNSIGNED",
		negrangeexponent_sub4.lpm_width = 9,
		negrangeexponent_sub4.lpm_type = "lpm_add_sub";
	lpm_add_sub   negrangeexponent_sub5
	(
	.cout(),
	.dataa(negrangeexponentff4),
	.datab({{8{1'b0}}, (~ multipliernode_w[78])}),
	.overflow(),
	.result(wire_negrangeexponent_sub5_result)
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
		negrangeexponent_sub5.lpm_direction = "ADD",
		negrangeexponent_sub5.lpm_representation = "UNSIGNED",
		negrangeexponent_sub5.lpm_width = 9,
		negrangeexponent_sub5.lpm_type = "lpm_add_sub";
	lpm_add_sub   rangeexponent_sub1
	(
	.cout(),
	.dataa(rangeexponentff_0),
	.datab({1'b0, incexponentff}),
	.overflow(),
	.result(wire_rangeexponent_sub1_result)
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
		rangeexponent_sub1.lpm_direction = "SUB",
		rangeexponent_sub1.lpm_representation = "UNSIGNED",
		rangeexponent_sub1.lpm_width = 9,
		rangeexponent_sub1.lpm_type = "lpm_add_sub";
	lpm_add_sub   rangeexponent_sub5
	(
	.cout(),
	.dataa(rangeexponentff_4),
	.datab({{8{1'b0}}, (~ multipliernode_w[78])}),
	.overflow(),
	.result(wire_rangeexponent_sub5_result)
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
		rangeexponent_sub5.lpm_direction = "SUB",
		rangeexponent_sub5.lpm_representation = "UNSIGNED",
		rangeexponent_sub5.lpm_width = 9,
		rangeexponent_sub5.lpm_type = "lpm_add_sub";
	lpm_clshift   csftin
	(
	.data(mantissadelff),
	.direction(1'b0),
	.distance(leadff),
	.overflow(),
	.result(wire_csftin_result),
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
		csftin.lpm_width = 23,
		csftin.lpm_widthdist = 5,
		csftin.lpm_type = "lpm_clshift";
	lpm_clshift   fp_lsft_rsft78
	(
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.data(multipliernormff),
	.direction(negrangeexponentff5[8]),
	.distance((({7{(~ negrangeexponentff5[8])}} & rangeexponentff_5[6:0]) | ({7{negrangeexponentff5[8]}} & negrangeexponentff5[6:0]))),
	.overflow(),
	.result(wire_fp_lsft_rsft78_result),
	.underflow());
	defparam
		fp_lsft_rsft78.lpm_pipeline = 1,
		fp_lsft_rsft78.lpm_width = 78,
		fp_lsft_rsft78.lpm_widthdist = 7,
		fp_lsft_rsft78.lpm_type = "lpm_clshift";
	lpm_mult   mult23x56
	(
	.aclr(aclr),
	.clken(clken),
	.clock(clock),
	.dataa(mantissamultiplierff),
	.datab(incmantissaff),
	.result(wire_mult23x56_result)
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
		mult23x56.lpm_pipeline = 4,
		mult23x56.lpm_representation = "UNSIGNED",
		mult23x56.lpm_widtha = 23,
		mult23x56.lpm_widthb = 56,
		mult23x56.lpm_widthp = 79,
		mult23x56.lpm_type = "lpm_mult";
	assign
		basefractiondelnode_w = cbfd_5,
		basefractionnode_w = wire_fp_range_table1_basefraction,
		circle = circleff[35:0],
		circlenode_w = wire_circle_add_result,
		const_23_w = 9'b000010111,
		incexponentnode_w = wire_fp_range_table1_incexponent,
		incmantissanode_w = wire_fp_range_table1_incmantissa,
		leadnode_w = (~ wire_clz23_q),
		mantissaexponentnode_w = wire_exponent_adjust_sub_result,
		mantissamultipliernode_w = wire_csftin_result,
		multipliernode_w = wire_mult23x56_result,
		multipliernormnode_w = {((multipliernode_w[78] & multipliernode_w[78]) | (multipliernode_w[77] & (~ multipliernode_w[78]))), ((multipliernode_w[77] & multipliernode_w[78]) | (multipliernode_w[76] & (~ multipliernode_w[78]))), ((multipliernode_w[76] & multipliernode_w[78]) | (multipliernode_w[75] & (~ multipliernode_w[78]))), ((multipliernode_w[75] & multipliernode_w[78]) | (multipliernode_w[74] & (~ multipliernode_w[78]))), ((multipliernode_w[74] & multipliernode_w[78]) | (multipliernode_w[73] & (~ multipliernode_w[78]))), ((multipliernode_w[73] & multipliernode_w[78]) | (multipliernode_w[72] & (~ multipliernode_w[78]))), ((multipliernode_w[72] & multipliernode_w[78]) | (multipliernode_w[71] & (~ multipliernode_w[78]))), ((multipliernode_w[71] & multipliernode_w[78]) | (multipliernode_w[70] & (~ multipliernode_w[78]))), ((multipliernode_w[70] & multipliernode_w[78]) | (multipliernode_w[69] & (~ multipliernode_w[78]))), ((multipliernode_w[69] & multipliernode_w[78]) | (multipliernode_w[68] & (~ multipliernode_w[78]))), ((multipliernode_w[68] & multipliernode_w[78]) | (multipliernode_w[67] & (~ multipliernode_w[78]))), ((multipliernode_w[67] & multipliernode_w[78]) | (multipliernode_w[66] & (~ multipliernode_w[78]))), ((multipliernode_w[66] & multipliernode_w[78]) | (multipliernode_w[65] & (~ multipliernode_w[78]))), ((multipliernode_w[65] & multipliernode_w[78]) | (multipliernode_w[64] & (~ multipliernode_w[78]))), ((multipliernode_w[64] & multipliernode_w[78]) | (multipliernode_w[63] & (~ multipliernode_w[78]))), ((multipliernode_w[63] & multipliernode_w[78]) | (multipliernode_w[62] & (~ multipliernode_w[78]))), ((multipliernode_w[62] & multipliernode_w[78]) | (multipliernode_w[61] & (~ multipliernode_w[78]))), ((multipliernode_w[61] & multipliernode_w[78]) | (multipliernode_w[60] & (~ multipliernode_w[78]))), ((multipliernode_w[60] & multipliernode_w[78]) | (multipliernode_w[59] & (~ multipliernode_w[78]))), ((multipliernode_w[59] & multipliernode_w[78]) | (multipliernode_w[58] & (~ multipliernode_w[78]))), ((multipliernode_w[58]
 & multipliernode_w[78]) | (multipliernode_w[57] & (~ multipliernode_w[78]))), ((multipliernode_w[57] & multipliernode_w[78]) | (multipliernode_w[56] & (~ multipliernode_w[78]))), ((multipliernode_w[56] & multipliernode_w[78]) | (multipliernode_w[55] & (~ multipliernode_w[78]))), ((multipliernode_w[55] & multipliernode_w[78]) | (multipliernode_w[54] & (~ multipliernode_w[78]))), ((multipliernode_w[54] & multipliernode_w[78]) | (multipliernode_w[53] & (~ multipliernode_w[78]))), ((multipliernode_w[53] & multipliernode_w[78]) | (multipliernode_w[52] & (~ multipliernode_w[78]))), ((multipliernode_w[52] & multipliernode_w[78]) | (multipliernode_w[51] & (~ multipliernode_w[78]))), ((multipliernode_w[51] & multipliernode_w[78]) | (multipliernode_w[50] & (~ multipliernode_w[78]))), ((multipliernode_w[50] & multipliernode_w[78]) | (multipliernode_w[49] & (~ multipliernode_w[78]))), ((multipliernode_w[49] & multipliernode_w[78]) | (multipliernode_w[48] & (~ multipliernode_w[78]))), ((multipliernode_w[48] & multipliernode_w[78]) | (multipliernode_w[47] & (~ multipliernode_w[78]))), ((multipliernode_w[47] & multipliernode_w[78]) | (multipliernode_w[46] & (~ multipliernode_w[78]))), ((multipliernode_w[46] & multipliernode_w[78]) | (multipliernode_w[45] & (~ multipliernode_w[78]))), ((multipliernode_w[45] & multipliernode_w[78]) | (multipliernode_w[44] & (~ multipliernode_w[78]))), ((multipliernode_w[44] & multipliernode_w[78]) | (multipliernode_w[43] & (~ multipliernode_w[78]))), ((multipliernode_w[43] & multipliernode_w[78]) | (multipliernode_w[42] & (~ multipliernode_w[78]))), ((multipliernode_w[42] & multipliernode_w[78]) | (multipliernode_w[41] & (~ multipliernode_w[78]))), ((multipliernode_w[41] & multipliernode_w[78]) | (multipliernode_w[40] & (~ multipliernode_w[78]))), ((multipliernode_w[40] & multipliernode_w[78]) | (multipliernode_w[39] & (~ multipliernode_w[78]))), ((multipliernode_w[39] & multipliernode_w[78]) | (multipliernode_w[38] & (~ multipliernode_w[78]))), ((multipliernode_w[38] & multipliernode_w[78]) | (multipliernode_w[37]
 & (~ multipliernode_w[78]))), ((multipliernode_w[37] & multipliernode_w[78]) | (multipliernode_w[36] & (~ multipliernode_w[78]))), ((multipliernode_w[36] & multipliernode_w[78]) | (multipliernode_w[35] & (~ multipliernode_w[78]))), ((multipliernode_w[35] & multipliernode_w[78]) | (multipliernode_w[34] & (~ multipliernode_w[78]))), ((multipliernode_w[34] & multipliernode_w[78]) | (multipliernode_w[33] & (~ multipliernode_w[78]))), ((multipliernode_w[33] & multipliernode_w[78]) | (multipliernode_w[32] & (~ multipliernode_w[78]))), ((multipliernode_w[32] & multipliernode_w[78]) | (multipliernode_w[31] & (~ multipliernode_w[78]))), ((multipliernode_w[31] & multipliernode_w[78]) | (multipliernode_w[30] & (~ multipliernode_w[78]))), ((multipliernode_w[30] & multipliernode_w[78]) | (multipliernode_w[29] & (~ multipliernode_w[78]))), ((multipliernode_w[29] & multipliernode_w[78]) | (multipliernode_w[28] & (~ multipliernode_w[78]))), ((multipliernode_w[28] & multipliernode_w[78]) | (multipliernode_w[27] & (~ multipliernode_w[78]))), ((multipliernode_w[27] & multipliernode_w[78]) | (multipliernode_w[26] & (~ multipliernode_w[78]))), ((multipliernode_w[26] & multipliernode_w[78]) | (multipliernode_w[25] & (~ multipliernode_w[78]))), ((multipliernode_w[25] & multipliernode_w[78]) | (multipliernode_w[24] & (~ multipliernode_w[78]))), ((multipliernode_w[24] & multipliernode_w[78]) | (multipliernode_w[23] & (~ multipliernode_w[78]))), ((multipliernode_w[23] & multipliernode_w[78]) | (multipliernode_w[22] & (~ multipliernode_w[78]))), ((multipliernode_w[22] & multipliernode_w[78]) | (multipliernode_w[21] & (~ multipliernode_w[78]))), ((multipliernode_w[21] & multipliernode_w[78]) | (multipliernode_w[20] & (~ multipliernode_w[78]))), ((multipliernode_w[20] & multipliernode_w[78]) | (multipliernode_w[19] & (~ multipliernode_w[78]))), ((multipliernode_w[19] & multipliernode_w[78]) | (multipliernode_w[18] & (~ multipliernode_w[78]))), ((multipliernode_w[18] & multipliernode_w[78]) | (multipliernode_w[17] & (~ multipliernode_w[78]))
), ((multipliernode_w[17] & multipliernode_w[78]) | (multipliernode_w[16] & (~ multipliernode_w[78]))), ((multipliernode_w[16] & multipliernode_w[78]) | (multipliernode_w[15] & (~ multipliernode_w[78]))), ((multipliernode_w[15] & multipliernode_w[78]) | (multipliernode_w[14] & (~ multipliernode_w[78]))), ((multipliernode_w[14] & multipliernode_w[78]) | (multipliernode_w[13] & (~ multipliernode_w[78]))), ((multipliernode_w[13] & multipliernode_w[78]) | (multipliernode_w[12] & (~ multipliernode_w[78]))), ((multipliernode_w[12] & multipliernode_w[78]) | (multipliernode_w[11] & (~ multipliernode_w[78]))), ((multipliernode_w[11] & multipliernode_w[78]) | (multipliernode_w[10] & (~ multipliernode_w[78]))), ((multipliernode_w[10] & multipliernode_w[78]) | (multipliernode_w[9] & (~ multipliernode_w[78]))), ((multipliernode_w[9] & multipliernode_w[78]) | (multipliernode_w[8] & (~ multipliernode_w[78]))), ((multipliernode_w[8] & multipliernode_w[78]) | (multipliernode_w[7] & (~ multipliernode_w[78]))), ((multipliernode_w[7] & multipliernode_w[78]) | (multipliernode_w[6] & (~ multipliernode_w[78]))), ((multipliernode_w[6] & multipliernode_w[78]) | (multipliernode_w[5] & (~ multipliernode_w[78]))), ((multipliernode_w[5] & multipliernode_w[78]) | (multipliernode_w[4] & (~ multipliernode_w[78]))), ((multipliernode_w[4] & multipliernode_w[78]) | (multipliernode_w[3] & (~ multipliernode_w[78]))), ((multipliernode_w[3] & multipliernode_w[78]) | (multipliernode_w[2] & (~ multipliernode_w[78]))), ((multipliernode_w[2] & multipliernode_w[78]) | (multipliernode_w[1] & (~ multipliernode_w[78]))), ((multipliernode_w[1] & multipliernode_w[78]) | (multipliernode_w[0] & (~ multipliernode_w[78])))},
		negbasefractiondelnode_w = wire_negbasedractiondel_sub_result,
		negcircle = negcircleff[35:0],
		negcirclenode_w = wire_negcircle_add_result,
		negrotatenode_w = {(~ rotateff[77]), (~ rotateff[76]), (~ rotateff[75]), (~ rotateff[74]), (~ rotateff[73]), (~ rotateff[72]), (~ rotateff[71]), (~ rotateff[70]), (~ rotateff[69]), (~ rotateff[68]), (~ rotateff[67]), (~ rotateff[66]), (~ rotateff[65]), (~ rotateff[64]), (~ rotateff[63]), (~ rotateff[62]), (~ rotateff[61]), (~ rotateff[60]), (~ rotateff[59]), (~ rotateff[58]), (~ rotateff[57]), (~ rotateff[56]), (~ rotateff[55]), (~ rotateff[54]), (~ rotateff[53]), (~ rotateff[52]), (~ rotateff[51]), (~ rotateff[50]), (~ rotateff[49]), (~ rotateff[48]), (~ rotateff[47]), (~ rotateff[46]), (~ rotateff[45]), (~ rotateff[44]), (~ rotateff[43]), (~ rotateff[42])},
		rotatenode_w = wire_fp_lsft_rsft78_result;
endmodule