module  fp_add_v1_altpriority_encoder_fj8
	(
	data,
	q,
	zero) ;
	input   [15:0]  data;
	output   [3:0]  q;
	output   zero;
	wire  [2:0]   wire_altpriority_encoder29_q;
	wire  wire_altpriority_encoder29_zero;
	wire  [2:0]   wire_altpriority_encoder30_q;
	wire  wire_altpriority_encoder30_zero;
	fp_add_v1_altpriority_encoder_vh8   altpriority_encoder29
	(
	.data(data[7:0]),
	.q(wire_altpriority_encoder29_q),
	.zero(wire_altpriority_encoder29_zero));
	fp_add_v1_altpriority_encoder_vh8   altpriority_encoder30
	(
	.data(data[15:8]),
	.q(wire_altpriority_encoder30_q),
	.zero(wire_altpriority_encoder30_zero));
	assign
		q = {wire_altpriority_encoder29_zero, (({3{wire_altpriority_encoder29_zero}} & wire_altpriority_encoder30_q) | ({3{(~ wire_altpriority_encoder29_zero)}} & wire_altpriority_encoder29_q))},
		zero = (wire_altpriority_encoder29_zero & wire_altpriority_encoder30_zero);
endmodule