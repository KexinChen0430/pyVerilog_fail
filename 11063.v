module CHARMAP (
	address,
	clock,
	q);
	input	[8:0]  address;
	input	  clock;
	output	[17:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
endmodule