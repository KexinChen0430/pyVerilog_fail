module rxlengthfifo_128x13 (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	wrfull);
	input	  aclr;
	input	[14:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[14:0]  q;
	output	  rdempty;
	output	  wrfull;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  sub_wire0;
	wire [14:0] sub_wire1;
	wire  sub_wire2;
	wire  wrfull = sub_wire0;
	wire [14:0] q = sub_wire1[14:0];
	wire  rdempty = sub_wire2;
	dcfifo_mixed_widths	dcfifo_mixed_widths_component (
				.rdclk (rdclk),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.aclr (aclr),
				.data (data),
				.rdreq (rdreq),
				.wrfull (sub_wire0),
				.q (sub_wire1),
				.rdempty (sub_wire2),
				.rdfull (),
				.rdusedw (),
				.wrempty (),
				.wrusedw ());
	defparam
		dcfifo_mixed_widths_component.intended_device_family = "Stratix IV",
		dcfifo_mixed_widths_component.lpm_numwords = 512,
		dcfifo_mixed_widths_component.lpm_showahead = "OFF",
		dcfifo_mixed_widths_component.lpm_type = "dcfifo_mixed_widths",
		dcfifo_mixed_widths_component.lpm_width = 15,
		dcfifo_mixed_widths_component.lpm_widthu = 9,
		dcfifo_mixed_widths_component.lpm_widthu_r = 9,
		dcfifo_mixed_widths_component.lpm_width_r = 15,
		dcfifo_mixed_widths_component.overflow_checking = "ON",
		dcfifo_mixed_widths_component.rdsync_delaypipe = 4,
		dcfifo_mixed_widths_component.underflow_checking = "ON",
		dcfifo_mixed_widths_component.use_eab = "ON",
		dcfifo_mixed_widths_component.write_aclr_synch = "OFF",
		dcfifo_mixed_widths_component.wrsync_delaypipe = 4;
endmodule