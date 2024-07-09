module  small_fifo_test_scfifo
	(
	clock,
	data,
	empty,
	full,
	q,
	rdreq,
	sclr,
	usedw,
	wrreq) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   [31:0]  data;
	output   empty;
	output   full;
	output   [31:0]  q;
	input   rdreq;
	input   sclr;
	output   [4:0]  usedw;
	input   wrreq;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   sclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  wire_dpfifo_empty;
	wire  wire_dpfifo_full;
	wire  [31:0]   wire_dpfifo_q;
	wire  [4:0]   wire_dpfifo_usedw;
	small_fifo_test_a_dpfifo   dpfifo
	(
	.clock(clock),
	.data(data),
	.empty(wire_dpfifo_empty),
	.full(wire_dpfifo_full),
	.q(wire_dpfifo_q),
	.rreq(rdreq),
	.sclr(sclr),
	.usedw(wire_dpfifo_usedw),
	.wreq(wrreq));
	assign
		empty = wire_dpfifo_empty,
		full = wire_dpfifo_full,
		q = wire_dpfifo_q,
		usedw = wire_dpfifo_usedw;
endmodule