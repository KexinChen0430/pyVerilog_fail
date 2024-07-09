module  int_to_fp_altpriority_encoder_rf8
	(
	data,
	q,
	zero) ;
	input   [15:0]  data;
	output   [3:0]  q;
	output   zero;
	wire  [2:0]   wire_altpriority_encoder18_q;
	wire  wire_altpriority_encoder18_zero;
	wire  [2:0]   wire_altpriority_encoder19_q;
	wire  wire_altpriority_encoder19_zero;
	int_to_fp_altpriority_encoder_be8   altpriority_encoder18
	(
	.data(data[7:0]),
	.q(wire_altpriority_encoder18_q),
	.zero(wire_altpriority_encoder18_zero));
	int_to_fp_altpriority_encoder_be8   altpriority_encoder19
	(
	.data(data[15:8]),
	.q(wire_altpriority_encoder19_q),
	.zero(wire_altpriority_encoder19_zero));
	assign
		q = {(~ wire_altpriority_encoder19_zero), (({3{wire_altpriority_encoder19_zero}} & wire_altpriority_encoder18_q) | ({3{(~ wire_altpriority_encoder19_zero)}} & wire_altpriority_encoder19_q))},
		zero = (wire_altpriority_encoder18_zero & wire_altpriority_encoder19_zero);
endmodule