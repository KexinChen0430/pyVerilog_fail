module  fp_add_v1_altpriority_encoder_be8
	(
	data,
	q,
	zero) ;
	input   [7:0]  data;
	output   [2:0]  q;
	output   zero;
	wire  [1:0]   wire_altpriority_encoder13_q;
	wire  wire_altpriority_encoder13_zero;
	wire  [1:0]   wire_altpriority_encoder14_q;
	wire  wire_altpriority_encoder14_zero;
	fp_add_v1_altpriority_encoder_6e8   altpriority_encoder13
	(
	.data(data[3:0]),
	.q(wire_altpriority_encoder13_q),
	.zero(wire_altpriority_encoder13_zero));
	fp_add_v1_altpriority_encoder_6e8   altpriority_encoder14
	(
	.data(data[7:4]),
	.q(wire_altpriority_encoder14_q),
	.zero(wire_altpriority_encoder14_zero));
	assign
		q = {(~ wire_altpriority_encoder14_zero), (({2{wire_altpriority_encoder14_zero}} & wire_altpriority_encoder13_q) | ({2{(~ wire_altpriority_encoder14_zero)}} & wire_altpriority_encoder14_q))},
		zero = (wire_altpriority_encoder13_zero & wire_altpriority_encoder14_zero);
endmodule