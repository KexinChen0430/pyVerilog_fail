module  fp_add_v1_altpriority_encoder_rf8
	(
	data,
	q,
	zero) ;
	input   [15:0]  data;
	output   [3:0]  q;
	output   zero;
	wire  [2:0]   wire_altpriority_encoder11_q;
	wire  wire_altpriority_encoder11_zero;
	wire  [2:0]   wire_altpriority_encoder12_q;
	wire  wire_altpriority_encoder12_zero;
	fp_add_v1_altpriority_encoder_be8   altpriority_encoder11
	(
	.data(data[7:0]),
	.q(wire_altpriority_encoder11_q),
	.zero(wire_altpriority_encoder11_zero));
	fp_add_v1_altpriority_encoder_be8   altpriority_encoder12
	(
	.data(data[15:8]),
	.q(wire_altpriority_encoder12_q),
	.zero(wire_altpriority_encoder12_zero));
	assign
		q = {(~ wire_altpriority_encoder12_zero), (({3{wire_altpriority_encoder12_zero}} & wire_altpriority_encoder11_q) | ({3{(~ wire_altpriority_encoder12_zero)}} & wire_altpriority_encoder12_q))},
		zero = (wire_altpriority_encoder11_zero & wire_altpriority_encoder12_zero);
endmodule