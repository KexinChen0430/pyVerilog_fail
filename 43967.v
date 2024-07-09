module ImaDRAM (
	data,
	inclock,
	outclock,
	rdaddress,
	wraddress,
	wren,
	q);
	input	[7:0]  data;
	input	  inclock;
	input	  outclock;
	input	[13:0]  rdaddress;
	input	[13:0]  wraddress;
	input	  wren;
	output	[7:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  wren;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
endmodule