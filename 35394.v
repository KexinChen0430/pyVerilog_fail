module zero_new2 (
	address,
	clock,
	q);
	input	[9:0]  address;
	input	  clock;
	output	[11:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
endmodule