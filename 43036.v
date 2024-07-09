module fifo_lcd (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	wrusedw);
	input	  aclr;
	input	[15:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[15:0]  q;
	output	[8:0]  wrusedw;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [15:0] sub_wire0;
	wire [8:0] sub_wire1;
	wire [15:0] q = sub_wire0[15:0];
	wire [8:0] wrusedw = sub_wire1[8:0];
	dcfifo	dcfifo_component (
				.aclr (aclr),
				.data (data),
				.rdclk (rdclk),
				.rdreq (rdreq),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.q (sub_wire0),
				.wrusedw (sub_wire1),
				.eccstatus (),
				.rdempty (),
				.rdfull (),
				.rdusedw (),
				.wrempty (),
				.wrfull ());
	defparam
		dcfifo_component.intended_device_family = "Cyclone V",
		dcfifo_component.lpm_numwords = 512,
		dcfifo_component.lpm_showahead = "OFF",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 16,
		dcfifo_component.lpm_widthu = 9,
		dcfifo_component.overflow_checking = "ON",
		dcfifo_component.rdsync_delaypipe = 5,
		dcfifo_component.read_aclr_synch = "OFF",
		dcfifo_component.underflow_checking = "ON",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.write_aclr_synch = "OFF",
		dcfifo_component.wrsync_delaypipe = 5;
endmodule