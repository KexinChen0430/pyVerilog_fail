module pix_pll_bt (
	areset,
	inclk0,
	c0,
	c1,
	locked);
	input	  areset;
	input	  inclk0;
	output	  c0;
	output	  c1;
	output	  locked;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  areset;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
endmodule