module  small_fifo_test_dpram
	(
	data,
	inclock,
	outclock,
	outclocken,
	q,
	rdaddress,
	wraddress,
	wren) /* synthesis synthesis_clearbox=1 */;
	input   [31:0]  data;
	input   inclock;
	input   outclock;
	input   outclocken;
	output   [31:0]  q;
	input   [4:0]  rdaddress;
	input   [4:0]  wraddress;
	input   wren;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   inclock;
	tri1   outclock;
	tri1   outclocken;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  [31:0]   wire_altsyncram2_q_b;
	small_fifo_test_altsyncram   altsyncram2
	(
	.address_a(wraddress),
	.address_b(rdaddress),
	.clock0(inclock),
	.clock1(outclock),
	.clocken1(outclocken),
	.data_a(data),
	.q_b(wire_altsyncram2_q_b),
	.wren_a(wren));
	assign
		q = wire_altsyncram2_q_b;
endmodule