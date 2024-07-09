module  small_fifo_test_a_dpfifo
	(
	clock,
	data,
	empty,
	full,
	q,
	rreq,
	sclr,
	usedw,
	wreq) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   [31:0]  data;
	output   empty;
	output   full;
	output   [31:0]  q;
	input   rreq;
	input   sclr;
	output   [4:0]  usedw;
	input   wreq;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   sclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  wire_fifo_state_empty;
	wire  wire_fifo_state_full;
	wire  [4:0]   wire_fifo_state_usedw_out;
	wire  [31:0]   wire_FIFOram_q;
	wire  [4:0]   wire_rd_ptr_count_q;
	wire  [4:0]   wire_wr_ptr_q;
	wire aclr;
	wire  [4:0]  rd_ptr;
	wire  valid_rreq;
	wire  valid_wreq;
	small_fifo_test_a_fefifo   fifo_state
	(
	.aclr(aclr),
	.clock(clock),
	.empty(wire_fifo_state_empty),
	.full(wire_fifo_state_full),
	.rreq(rreq),
	.sclr(sclr),
	.usedw_out(wire_fifo_state_usedw_out),
	.wreq(wreq));
	small_fifo_test_dpram   FIFOram
	(
	.data(data),
	.inclock(clock),
	.outclock(clock),
	.outclocken((valid_rreq | sclr)),
	.q(wire_FIFOram_q),
	.rdaddress(({5{(~ sclr)}} & rd_ptr)),
	.wraddress(wire_wr_ptr_q),
	.wren(valid_wreq));
	small_fifo_test_cntr1   rd_ptr_count
	(
	.aclr(aclr),
	.clock(clock),
	.cnt_en(valid_rreq),
	.q(wire_rd_ptr_count_q),
	.sclr(sclr));
	small_fifo_test_cntr1   wr_ptr
	(
	.aclr(aclr),
	.clock(clock),
	.cnt_en(valid_wreq),
	.q(wire_wr_ptr_q),
	.sclr(sclr));
	assign
		aclr = 1'b0,
		empty = wire_fifo_state_empty,
		full = wire_fifo_state_full,
		q = wire_FIFOram_q,
		rd_ptr = wire_rd_ptr_count_q,
		usedw = wire_fifo_state_usedw_out,
		valid_rreq = (rreq & (~ wire_fifo_state_empty)),
		valid_wreq = (wreq & (~ wire_fifo_state_full));
endmodule