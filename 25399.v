module  fp_add_sub_altpriority_encoder_ue9
	(
	data,
	q,
	zero) ;
	input   [15:0]  data;
	output   [3:0]  q;
	output   zero;
	wire  [2:0]   wire_altpriority_encoder19_q;
	wire  wire_altpriority_encoder19_zero;
	wire  [2:0]   wire_altpriority_encoder20_q;
	wire  wire_altpriority_encoder20_zero;
	fp_add_sub_altpriority_encoder_be8   altpriority_encoder19
	(
	.data(data[7:0]),
	.q(wire_altpriority_encoder19_q),
	.zero(wire_altpriority_encoder19_zero));
	fp_add_sub_altpriority_encoder_be8   altpriority_encoder20
	(
	.data(data[15:8]),
	.q(wire_altpriority_encoder20_q),
	.zero(wire_altpriority_encoder20_zero));
	assign
		q = {(~ wire_altpriority_encoder20_zero), (({3{wire_altpriority_encoder20_zero}} & wire_altpriority_encoder19_q) | ({3{(~ wire_altpriority_encoder20_zero)}} & wire_altpriority_encoder20_q))},
		zero = (wire_altpriority_encoder19_zero & wire_altpriority_encoder20_zero);
endmodule