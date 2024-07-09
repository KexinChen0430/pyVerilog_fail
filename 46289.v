module  fp_sub_altpriority_encoder_ej8
	(
	data,
	q,
	zero) ;
	input   [31:0]  data;
	output   [4:0]  q;
	output   zero;
	wire  [3:0]   wire_altpriority_encoder27_q;
	wire  wire_altpriority_encoder27_zero;
	wire  [3:0]   wire_altpriority_encoder28_q;
	wire  wire_altpriority_encoder28_zero;
	fp_sub_altpriority_encoder_fj8   altpriority_encoder27
	(
	.data(data[15:0]),
	.q(wire_altpriority_encoder27_q),
	.zero(wire_altpriority_encoder27_zero));
	fp_sub_altpriority_encoder_fj8   altpriority_encoder28
	(
	.data(data[31:16]),
	.q(wire_altpriority_encoder28_q),
	.zero(wire_altpriority_encoder28_zero));
	assign
		q = {wire_altpriority_encoder27_zero, (({4{wire_altpriority_encoder27_zero}} & wire_altpriority_encoder28_q) | ({4{(~ wire_altpriority_encoder27_zero)}} & wire_altpriority_encoder27_q))},
		zero = (wire_altpriority_encoder27_zero & wire_altpriority_encoder28_zero);
endmodule