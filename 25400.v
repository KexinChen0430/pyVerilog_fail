module  fp_add_sub_altpriority_encoder_ou8
	(
	aclr,
	clk_en,
	clock,
	data,
	q) ;
	input   aclr;
	input   clk_en;
	input   clock;
	input   [31:0]  data;
	output   [4:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clk_en;
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  [3:0]   wire_altpriority_encoder7_q;
	wire  [3:0]   wire_altpriority_encoder8_q;
	wire  wire_altpriority_encoder8_zero;
	reg	[4:0]	pipeline_q_dffe;
	wire  [4:0]  tmp_q_wire;
	fp_add_sub_altpriority_encoder_uv8   altpriority_encoder7
	(
	.data(data[15:0]),
	.q(wire_altpriority_encoder7_q));
	fp_add_sub_altpriority_encoder_ue9   altpriority_encoder8
	(
	.data(data[31:16]),
	.q(wire_altpriority_encoder8_q),
	.zero(wire_altpriority_encoder8_zero));
	// synopsys translate_off
	initial
		pipeline_q_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) pipeline_q_dffe <= 5'b0;
		else if  (clk_en == 1'b1)   pipeline_q_dffe <= tmp_q_wire;
	assign
		q = pipeline_q_dffe,
		tmp_q_wire = {(~ wire_altpriority_encoder8_zero), (({4{wire_altpriority_encoder8_zero}} & wire_altpriority_encoder7_q) | ({4{(~ wire_altpriority_encoder8_zero)}} & wire_altpriority_encoder8_q))};
endmodule