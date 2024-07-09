module  float_add_sub_altpriority_encoder_fj8
	(
	data,
	q,
	zero) ;
	input   [15:0]  data;
	output   [3:0]  q;
	output   zero;
	wire  [2:0]   wire_altpriority_encoder23_q;
	wire  wire_altpriority_encoder23_zero;
	wire  [2:0]   wire_altpriority_encoder24_q;
	wire  wire_altpriority_encoder24_zero;
	float_add_sub_altpriority_encoder_vh8   altpriority_encoder23
	(
	.data(data[7:0]),
	.q(wire_altpriority_encoder23_q),
	.zero(wire_altpriority_encoder23_zero));
	float_add_sub_altpriority_encoder_vh8   altpriority_encoder24
	(
	.data(data[15:8]),
	.q(wire_altpriority_encoder24_q),
	.zero(wire_altpriority_encoder24_zero));
	assign
		q = {wire_altpriority_encoder23_zero, (({3{wire_altpriority_encoder23_zero}} & wire_altpriority_encoder24_q) | ({3{(~ wire_altpriority_encoder23_zero)}} & wire_altpriority_encoder23_q))},
		zero = (wire_altpriority_encoder23_zero & wire_altpriority_encoder24_zero);
endmodule