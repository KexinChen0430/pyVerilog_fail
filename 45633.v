module  fp_add_v1_altpriority_encoder_ina
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
	wire  [4:0]   wire_altpriority_encoder25_q;
	wire  wire_altpriority_encoder25_zero;
	wire  [4:0]   wire_altpriority_encoder26_q;
	reg	[5:0]	pipeline_q_dffe;
	wire  [5:0]  tmp_q_wire;
	fp_add_v1_altpriority_encoder_hi9   altpriority_encoder25
	(
	.data(data[31:0]),
	.q(wire_altpriority_encoder25_q),
	.zero(wire_altpriority_encoder25_zero));
	fp_add_v1_altpriority_encoder_h39   altpriority_encoder26
	(
	.data(data[63:32]),
	.q(wire_altpriority_encoder26_q));
	// synopsys translate_off
	initial
		pipeline_q_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) pipeline_q_dffe <= 6'b0;
		else if  (clk_en == 1'b1)   pipeline_q_dffe <= (~ tmp_q_wire);
	assign
		q = (~ pipeline_q_dffe),
		tmp_q_wire = {wire_altpriority_encoder25_zero, (({5{wire_altpriority_encoder25_zero}} & wire_altpriority_encoder26_q) | ({5{(~ wire_altpriority_encoder25_zero)}} & wire_altpriority_encoder25_q))};
endmodule