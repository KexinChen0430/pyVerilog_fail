module  sin_altpriority_encoder_6e8
	(
	data,
	q,
	zero) ;
	input   [3:0]  data;
	output   [1:0]  q;
	output   zero;
	wire  [0:0]   wire_altpriority_encoder11_q;
	wire  wire_altpriority_encoder11_zero;
	wire  [0:0]   wire_altpriority_encoder12_q;
	wire  wire_altpriority_encoder12_zero;
	sin_altpriority_encoder_3e8   altpriority_encoder11
	(
	.data(data[1:0]),
	.q(wire_altpriority_encoder11_q),
	.zero(wire_altpriority_encoder11_zero));
	sin_altpriority_encoder_3e8   altpriority_encoder12
	(
	.data(data[3:2]),
	.q(wire_altpriority_encoder12_q),
	.zero(wire_altpriority_encoder12_zero));
	assign
		q = {(~ wire_altpriority_encoder12_zero), ((wire_altpriority_encoder12_zero & wire_altpriority_encoder11_q) | ((~ wire_altpriority_encoder12_zero) & wire_altpriority_encoder12_q))},
		zero = (wire_altpriority_encoder11_zero & wire_altpriority_encoder12_zero);
endmodule