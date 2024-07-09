module  fp_sub_altpriority_encoder_vh8
	(
	data,
	q,
	zero) ;
	input   [7:0]  data;
	output   [2:0]  q;
	output   zero;
	wire  [1:0]   wire_altpriority_encoder31_q;
	wire  wire_altpriority_encoder31_zero;
	wire  [1:0]   wire_altpriority_encoder32_q;
	wire  wire_altpriority_encoder32_zero;
	fp_sub_altpriority_encoder_qh8   altpriority_encoder31
	(
	.data(data[3:0]),
	.q(wire_altpriority_encoder31_q),
	.zero(wire_altpriority_encoder31_zero));
	fp_sub_altpriority_encoder_qh8   altpriority_encoder32
	(
	.data(data[7:4]),
	.q(wire_altpriority_encoder32_q),
	.zero(wire_altpriority_encoder32_zero));
	assign
		q = {wire_altpriority_encoder31_zero, (({2{wire_altpriority_encoder31_zero}} & wire_altpriority_encoder32_q) | ({2{(~ wire_altpriority_encoder31_zero)}} & wire_altpriority_encoder31_q))},
		zero = (wire_altpriority_encoder31_zero & wire_altpriority_encoder32_zero);
endmodule