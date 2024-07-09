module  fp_add_v1_altpriority_encoder_qh8
	(
	data,
	q,
	zero) ;
	input   [3:0]  data;
	output   [1:0]  q;
	output   zero;
	wire  [0:0]   wire_altpriority_encoder33_q;
	wire  wire_altpriority_encoder33_zero;
	wire  [0:0]   wire_altpriority_encoder34_q;
	wire  wire_altpriority_encoder34_zero;
	fp_add_v1_altpriority_encoder_nh8   altpriority_encoder33
	(
	.data(data[1:0]),
	.q(wire_altpriority_encoder33_q),
	.zero(wire_altpriority_encoder33_zero));
	fp_add_v1_altpriority_encoder_nh8   altpriority_encoder34
	(
	.data(data[3:2]),
	.q(wire_altpriority_encoder34_q),
	.zero(wire_altpriority_encoder34_zero));
	assign
		q = {wire_altpriority_encoder33_zero, ((wire_altpriority_encoder33_zero & wire_altpriority_encoder34_q) | ((~ wire_altpriority_encoder33_zero) & wire_altpriority_encoder33_q))},
		zero = (wire_altpriority_encoder33_zero & wire_altpriority_encoder34_zero);
endmodule