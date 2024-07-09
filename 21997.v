module  sin_altpriority_encoder_rf8
	(
	data,
	q,
	zero) ;
	input   [15:0]  data;
	output   [3:0]  q;
	output   zero;
	wire  [2:0]   wire_altpriority_encoder15_q;
	wire  wire_altpriority_encoder15_zero;
	wire  [2:0]   wire_altpriority_encoder16_q;
	wire  wire_altpriority_encoder16_zero;
	sin_altpriority_encoder_be8   altpriority_encoder15
	(
	.data(data[7:0]),
	.q(wire_altpriority_encoder15_q),
	.zero(wire_altpriority_encoder15_zero));
	sin_altpriority_encoder_be8   altpriority_encoder16
	(
	.data(data[15:8]),
	.q(wire_altpriority_encoder16_q),
	.zero(wire_altpriority_encoder16_zero));
	assign
		q = {(~ wire_altpriority_encoder16_zero), (({3{wire_altpriority_encoder16_zero}} & wire_altpriority_encoder15_q) | ({3{(~ wire_altpriority_encoder16_zero)}} & wire_altpriority_encoder16_q))},
		zero = (wire_altpriority_encoder15_zero & wire_altpriority_encoder16_zero);
endmodule