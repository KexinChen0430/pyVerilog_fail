module  fp_sub_altpriority_encoder_uu8
	(
	aclr,
	clk_en,
	clock,
	data,
	q) ;
	input   aclr;
	input   clk_en;
	input   clock;
	input   [63:0]  data;
	output   [5:0]  q;
	wire  [4:0]   wire_altpriority_encoder7_q;
	wire  [4:0]   wire_altpriority_encoder8_q;
	wire  wire_altpriority_encoder8_zero;
	reg	[5:0]	pipeline_q_dffe;
	wire  [5:0]  tmp_q_wire;
	fp_sub_altpriority_encoder_tv8   altpriority_encoder7
	(
	.data(data[31:0]),
	.q(wire_altpriority_encoder7_q));
	fp_sub_altpriority_encoder_te9   altpriority_encoder8
	(
	.data(data[63:32]),
	.q(wire_altpriority_encoder8_q),
	.zero(wire_altpriority_encoder8_zero));
	// synopsys translate_off
	initial
		pipeline_q_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) pipeline_q_dffe <= 6'b0;
		else if  (clk_en == 1'b1)   pipeline_q_dffe <= tmp_q_wire;
	assign
		q = pipeline_q_dffe,
		tmp_q_wire = {(~ wire_altpriority_encoder8_zero), (({5{wire_altpriority_encoder8_zero}} & wire_altpriority_encoder7_q) | ({5{(~ wire_altpriority_encoder8_zero)}} & wire_altpriority_encoder8_q))};
endmodule