module SHIFTREGRAM (
	clken,
	clock,
	shiftin,
	shiftout,
	taps);
	input	  clken;
	input	  clock;
	input	[12:0]  shiftin;
	output	[12:0]  shiftout;
	output	[168:0]  taps;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clken;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
endmodule