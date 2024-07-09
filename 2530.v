module  int16_float32_altpriority_encoder_be8
	(
	data,
	q,
	zero) ;
	input   [7:0]  data;
	output   [2:0]  q;
	output   zero;
	wire  [1:0]   wire_altpriority_encoder14_q;
	wire  wire_altpriority_encoder14_zero;
	wire  [1:0]   wire_altpriority_encoder15_q;
	wire  wire_altpriority_encoder15_zero;
	int16_float32_altpriority_encoder_6e8   altpriority_encoder14
	(
	.data(data[3:0]),
	.q(wire_altpriority_encoder14_q),
	.zero(wire_altpriority_encoder14_zero));
	int16_float32_altpriority_encoder_6e8   altpriority_encoder15
	(
	.data(data[7:4]),
	.q(wire_altpriority_encoder15_q),
	.zero(wire_altpriority_encoder15_zero));
	assign
		q = {(~ wire_altpriority_encoder15_zero), (({2{wire_altpriority_encoder15_zero}} & wire_altpriority_encoder14_q) | ({2{(~ wire_altpriority_encoder15_zero)}} & wire_altpriority_encoder15_q))},
		zero = (wire_altpriority_encoder14_zero & wire_altpriority_encoder15_zero);
endmodule