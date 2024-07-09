module  fp_sub_altpriority_encoder_te9
	(
	data,
	q,
	zero) ;
	input   [31:0]  data;
	output   [4:0]  q;
	output   zero;
	wire  [3:0]   wire_altpriority_encoder23_q;
	wire  wire_altpriority_encoder23_zero;
	wire  [3:0]   wire_altpriority_encoder24_q;
	wire  wire_altpriority_encoder24_zero;
	fp_sub_altpriority_encoder_rf8   altpriority_encoder23
	(
	.data(data[15:0]),
	.q(wire_altpriority_encoder23_q),
	.zero(wire_altpriority_encoder23_zero));
	fp_sub_altpriority_encoder_rf8   altpriority_encoder24
	(
	.data(data[31:16]),
	.q(wire_altpriority_encoder24_q),
	.zero(wire_altpriority_encoder24_zero));
	assign
		q = {(~ wire_altpriority_encoder24_zero), (({4{wire_altpriority_encoder24_zero}} & wire_altpriority_encoder23_q) | ({4{(~ wire_altpriority_encoder24_zero)}} & wire_altpriority_encoder24_q))},
		zero = (wire_altpriority_encoder23_zero & wire_altpriority_encoder24_zero);
endmodule