module  small_fifo_test_a_fefifo
	(
	aclr,
	clock,
	empty,
	full,
	rreq,
	sclr,
	usedw_out,
	wreq) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	input   clock;
	output   empty;
	output   full;
	input   rreq;
	input   sclr;
	output   [4:0]  usedw_out;
	input   wreq;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri0   rreq;
	tri0   sclr;
	tri0   wreq;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	reg	b_full;
	reg	b_non_empty;
	wire  [4:0]   wire_count_usedw_q;
	wire  [4:0]  equal_af1;
	wire  [4:0]  equal_one;
	wire  is_almost_empty0;
	wire  is_almost_empty1;
	wire  is_almost_empty2;
	wire  is_almost_empty3;
	wire  is_almost_empty4;
	wire  is_almost_full0;
	wire  is_almost_full1;
	wire  is_almost_full2;
	wire  is_almost_full3;
	wire  is_almost_full4;
	wire  [4:0]  usedw;
	wire  valid_rreq;
	wire  valid_wreq;
	// synopsys translate_off
	initial
		b_full = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_full <= 1'b0;
		else  b_full <= ((b_full & (b_full ^ (sclr | rreq))) | (((~ b_full) & b_non_empty) & ((~ sclr) & ((is_almost_full4 & wreq) & (~ rreq)))));
	// synopsys translate_off
	initial
		b_non_empty = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) b_non_empty <= 1'b0;
		else  b_non_empty <= (((b_full & (b_full ^ sclr)) | (((~ b_non_empty) & wreq) & (~ sclr))) | (((~ b_full) & b_non_empty) & (((~ b_full) & b_non_empty) ^ (sclr | ((is_almost_empty4 & rreq) & (~ wreq))))));
	small_fifo_test_cntr   count_usedw
	(
	.aclr(aclr),
	.clock(clock),
	.cnt_en((valid_wreq ^ valid_rreq)),
	.q(wire_count_usedw_q),
	.sclr(sclr),
	.updown(valid_wreq));
	assign
		empty = (~ b_non_empty),
		equal_af1 = {5{1'b0}},
		equal_one = {{4{1'b1}}, 1'b0},
		full = b_full,
		is_almost_empty0 = (usedw[0] ^ equal_one[0]),
		is_almost_empty1 = ((usedw[1] ^ equal_one[1]) & is_almost_empty0),
		is_almost_empty2 = ((usedw[2] ^ equal_one[2]) & is_almost_empty1),
		is_almost_empty3 = ((usedw[3] ^ equal_one[3]) & is_almost_empty2),
		is_almost_empty4 = ((usedw[4] ^ equal_one[4]) & is_almost_empty3),
		is_almost_full0 = (usedw[0] ^ equal_af1[0]),
		is_almost_full1 = ((usedw[1] ^ equal_af1[1]) & is_almost_full0),
		is_almost_full2 = ((usedw[2] ^ equal_af1[2]) & is_almost_full1),
		is_almost_full3 = ((usedw[3] ^ equal_af1[3]) & is_almost_full2),
		is_almost_full4 = ((usedw[4] ^ equal_af1[4]) & is_almost_full3),
		usedw = wire_count_usedw_q,
		usedw_out = usedw,
		valid_rreq = (rreq & b_non_empty),
		valid_wreq = (wreq & (~ b_full));
endmodule