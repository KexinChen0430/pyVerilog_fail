module  float_add_sub_altpriority_encoder_6e8
	(
	data,
	q,
	zero) ;
	input   [3:0]  data;
	output   [1:0]  q;
	output   zero;
	wire  [0:0]   wire_altpriority_encoder13_q;
	wire  wire_altpriority_encoder13_zero;
	wire  [0:0]   wire_altpriority_encoder14_q;
	wire  wire_altpriority_encoder14_zero;
	float_add_sub_altpriority_encoder_3e8   altpriority_encoder13
	(
	.data(data[1:0]),
	.q(wire_altpriority_encoder13_q),
	.zero(wire_altpriority_encoder13_zero));
	float_add_sub_altpriority_encoder_3e8   altpriority_encoder14
	(
	.data(data[3:2]),
	.q(wire_altpriority_encoder14_q),
	.zero(wire_altpriority_encoder14_zero));
	assign
		q = {(~ wire_altpriority_encoder14_zero), ((wire_altpriority_encoder14_zero & wire_altpriority_encoder13_q) | ((~ wire_altpriority_encoder14_zero) & wire_altpriority_encoder14_q))},
		zero = (wire_altpriority_encoder13_zero & wire_altpriority_encoder14_zero);
endmodule