module Memory_16x256 (
	aclr,
	address,
	clock,
	data,
	wren,
	q);
	input	  aclr;
	input	[7:0]  address;
	input	  clock;
	input	[15:0]  data;
	input	  wren;
	output	[15:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
	tri1	  clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
endmodule