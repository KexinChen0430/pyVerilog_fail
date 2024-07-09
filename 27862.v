module RAMB16_S4_altera_new (
	address,
	clken,
	clock,
	data,
	wren,
	q);
	input	[7:0]  address;
	input	  clken;
	input	  clock;
	input	[11:0]  data;
	input	  wren;
	output	[11:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clken;
	tri1	  clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
endmodule