module altpll1 (
	areset,
	clkswitch,
	inclk0,
	inclk1,
	activeclock,
	c0,
	c1,
	c2,
	c3,
	locked);
	input	  areset;
	input	  clkswitch;
	input	  inclk0;
	input	  inclk1;
	output	  activeclock;
	output	  c0;
	output	  c1;
	output	  c2;
	output	  c3;
	output	  locked;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  areset;
	tri0	  clkswitch;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
endmodule