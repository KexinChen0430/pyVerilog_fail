module fifo_181x128a (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	wrempty,
	wrusedw);
	input	  aclr;
	input	[180:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[180:0]  q;
	output	  rdempty;
	output	  wrempty;
	output	[6:0]  wrusedw;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  sub_wire0;
	wire [180:0] sub_wire1;
	wire  sub_wire2;
	wire [6:0] sub_wire3;
	wire  wrempty = sub_wire0;
	wire [180:0] q = sub_wire1[180:0];
	wire  rdempty = sub_wire2;
	wire [6:0] wrusedw = sub_wire3[6:0];
	dcfifo	dcfifo_component (
				.rdclk (rdclk),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.aclr (aclr),
				.data (data),
				.rdreq (rdreq),
				.wrempty (sub_wire0),
				.q (sub_wire1),
				.rdempty (sub_wire2),
				.wrusedw (sub_wire3),
				.rdfull (),
				.rdusedw (),
				.wrfull ());
	defparam
		dcfifo_component.intended_device_family = "Arria II GX",
		dcfifo_component.lpm_numwords = 128,
		dcfifo_component.lpm_showahead = "ON",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 181,
		dcfifo_component.lpm_widthu = 7,
		dcfifo_component.overflow_checking = "ON",
		dcfifo_component.rdsync_delaypipe = 4,
		dcfifo_component.underflow_checking = "ON",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.write_aclr_synch = "OFF",
		dcfifo_component.wrsync_delaypipe = 4;
endmodule