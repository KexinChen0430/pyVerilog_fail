module fifo_181x128a (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q);
	input	  aclr;
	input	[191:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[191:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [191:0] sub_wire0;
	wire [191:0] q = sub_wire0[191:0];
	dcfifo	dcfifo_component (
				.aclr (aclr),
				.data (data),
				.rdclk (rdclk),
				.rdreq (rdreq),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.q (sub_wire0),
				.rdempty (),
				.rdfull (),
				.rdusedw (),
				.wrempty (),
				.wrfull (),
				.wrusedw ());
	defparam
		dcfifo_component.intended_device_family = "Arria II GX",
		dcfifo_component.lpm_numwords = 128,
		dcfifo_component.lpm_showahead = "ON",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 192,
		dcfifo_component.lpm_widthu = 7,
		dcfifo_component.overflow_checking = "ON",
		dcfifo_component.rdsync_delaypipe = 4,
		dcfifo_component.underflow_checking = "ON",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.write_aclr_synch = "OFF",
		dcfifo_component.wrsync_delaypipe = 4;
endmodule