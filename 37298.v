module rom_botao (
	address,
	clock,
	q);
	input	[6:0]  address;
	input	  clock;
	output	[20:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
endmodule