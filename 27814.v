module fifo_128x512a (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	wrfull,
	wrusedw);
	input	  aclr;
	input	[127:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[127:0]  q;
	output	  rdempty;
	output	  wrfull;
	output	[9:0]  wrusedw;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  sub_wire0;
	wire [127:0] sub_wire1;
	wire  sub_wire2;
	wire [9:0] sub_wire3;
	wire  wrfull = sub_wire0;
	wire [127:0] q = sub_wire1[127:0];
	wire  rdempty = sub_wire2;
	wire [9:0] wrusedw = sub_wire3[9:0];
	dcfifo	dcfifo_component (
				.rdclk (rdclk),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.aclr (aclr),
				.data (data),
				.rdreq (rdreq),
				.wrfull (sub_wire0),
				.q (sub_wire1),
				.rdempty (sub_wire2),
				.wrusedw (sub_wire3),
				.rdfull (),
				.rdusedw (),
				.wrempty ());
	defparam
		dcfifo_component.intended_device_family = "Cyclone II",
		dcfifo_component.lpm_numwords = 1024,
		dcfifo_component.lpm_showahead = "OFF",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 128,
		dcfifo_component.lpm_widthu = 10,
		dcfifo_component.overflow_checking = "OFF",
		dcfifo_component.rdsync_delaypipe = 4,
		dcfifo_component.underflow_checking = "OFF",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.write_aclr_synch = "OFF",
		dcfifo_component.wrsync_delaypipe = 4;
endmodule