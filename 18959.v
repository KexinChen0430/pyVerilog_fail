module ddr3_s4_amphy_phy_alt_mem_phy_pll (
	areset,
	inclk0,
	phasecounterselect,
	phasestep,
	phaseupdown,
	scanclk,
	c0,
	c1,
	c2,
	c3,
	c4,
	c5,
	c6,
	locked,
	phasedone);
	input	  areset;
	input	  inclk0;
	input	[3:0]  phasecounterselect;
	input	  phasestep;
	input	  phaseupdown;
	input	  scanclk;
	output	  c0;
	output	  c1;
	output	  c2;
	output	  c3;
	output	  c4;
	output	  c5;
	output	  c6;
	output	  locked;
	output	  phasedone;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  areset;
	tri0	[3:0]  phasecounterselect;
	tri0	  phasestep;
	tri0	  phaseupdown;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
endmodule