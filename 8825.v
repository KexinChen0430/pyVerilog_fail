module  int_to_fp_altpriority_encoder_be8
	(
	data,
	q,
	zero) ;
	input   [7:0]  data;
	output   [2:0]  q;
	output   zero;
	wire  [1:0]   wire_altpriority_encoder16_q;
	wire  wire_altpriority_encoder16_zero;
	wire  [1:0]   wire_altpriority_encoder17_q;
	wire  wire_altpriority_encoder17_zero;
	int_to_fp_altpriority_encoder_6e8   altpriority_encoder16
	(
	.data(data[3:0]),
	.q(wire_altpriority_encoder16_q),
	.zero(wire_altpriority_encoder16_zero));
	int_to_fp_altpriority_encoder_6e8   altpriority_encoder17
	(
	.data(data[7:4]),
	.q(wire_altpriority_encoder17_q),
	.zero(wire_altpriority_encoder17_zero));
	assign
		q = {(~ wire_altpriority_encoder17_zero), (({2{wire_altpriority_encoder17_zero}} & wire_altpriority_encoder16_q) | ({2{(~ wire_altpriority_encoder17_zero)}} & wire_altpriority_encoder17_q))},
		zero = (wire_altpriority_encoder16_zero & wire_altpriority_encoder17_zero);
endmodule