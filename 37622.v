module COMMAND_RAM (
	clock,
	data,
	rdaddress,
	wraddress,
	wren,
	q);
	input	  clock;
	input	[15:0]  data;
	input	[10:0]  rdaddress;
	input	[11:0]  wraddress;
	input	  wren;
	output	[31:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clock;
	tri0	  wren;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
endmodule