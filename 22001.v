module  sin_altpriority_encoder_qf8
	(
	data,
	q,
	zero) ;
	input   [31:0]  data;
	output   [4:0]  q;
	output   zero;
	wire  [3:0]   wire_altpriority_encoder21_q;
	wire  wire_altpriority_encoder21_zero;
	wire  [3:0]   wire_altpriority_encoder22_q;
	wire  wire_altpriority_encoder22_zero;
	sin_altpriority_encoder_rf8   altpriority_encoder21
	(
	.data(data[15:0]),
	.q(wire_altpriority_encoder21_q),
	.zero(wire_altpriority_encoder21_zero));
	sin_altpriority_encoder_rf8   altpriority_encoder22
	(
	.data(data[31:16]),
	.q(wire_altpriority_encoder22_q),
	.zero(wire_altpriority_encoder22_zero));
	assign
		q = {(~ wire_altpriority_encoder22_zero), (({4{wire_altpriority_encoder22_zero}} & wire_altpriority_encoder21_q) | ({4{(~ wire_altpriority_encoder22_zero)}} & wire_altpriority_encoder22_q))},
		zero = (wire_altpriority_encoder21_zero & wire_altpriority_encoder22_zero);
endmodule