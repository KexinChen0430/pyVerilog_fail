module buffer_dp (
	data,
	rdaddress,
	rdclock,
	wraddress,
	wrclock,
	wren,
	q);
	input	[7:0]  data;
	input	[8:0]  rdaddress;
	input	  rdclock;
	input	[8:0]  wraddress;
	input	  wrclock;
	input	  wren;
	output	[7:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  wrclock;
	tri0	  wren;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
endmodule