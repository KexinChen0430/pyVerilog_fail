module  fp_add_sub_altpriority_encoder_2h9
	(
	data,
	q,
	zero) ;
	input   [7:0]  data;
	output   [2:0]  q;
	output   zero;
	wire  [1:0]   wire_altpriority_encoder25_q;
	wire  wire_altpriority_encoder25_zero;
	wire  [1:0]   wire_altpriority_encoder26_q;
	wire  wire_altpriority_encoder26_zero;
	fp_add_sub_altpriority_encoder_qh8   altpriority_encoder25
	(
	.data(data[3:0]),
	.q(wire_altpriority_encoder25_q),
	.zero(wire_altpriority_encoder25_zero));
	fp_add_sub_altpriority_encoder_qh8   altpriority_encoder26
	(
	.data(data[7:4]),
	.q(wire_altpriority_encoder26_q),
	.zero(wire_altpriority_encoder26_zero));
	assign
		q = {wire_altpriority_encoder25_zero, (({2{wire_altpriority_encoder25_zero}} & wire_altpriority_encoder26_q) | ({2{(~ wire_altpriority_encoder25_zero)}} & wire_altpriority_encoder25_q))},
		zero = (wire_altpriority_encoder25_zero & wire_altpriority_encoder26_zero);
endmodule