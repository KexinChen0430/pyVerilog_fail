module asyn_1024_134 (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	rdusedw,
	wrusedw);
	input	  aclr;
	input	[133:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[133:0]  q;
	output	  rdempty;
	output	[10:0]  rdusedw;
	output	[10:0]  wrusedw;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [133:0] sub_wire0;
	wire  sub_wire1;
	wire [10:0] sub_wire2;
	wire [10:0] sub_wire3;
	wire [133:0] q = sub_wire0[133:0];
	wire  rdempty = sub_wire1;
	wire [10:0] rdusedw = sub_wire2[10:0];
	wire [10:0] wrusedw = sub_wire3[10:0];
	dcfifo	dcfifo_component (
				.aclr (aclr),
				.data (data),
				.rdclk (rdclk),
				.rdreq (rdreq),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.q (sub_wire0),
				.rdempty (sub_wire1),
				.rdusedw (sub_wire2),
				.wrusedw (sub_wire3),
				.rdfull (),
				.wrempty (),
				.wrfull ());
	defparam
		dcfifo_component.intended_device_family = "Stratix V",
		dcfifo_component.lpm_numwords = 2048,
		dcfifo_component.lpm_showahead = "ON",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 134,
		dcfifo_component.lpm_widthu = 11,
		dcfifo_component.overflow_checking = "ON",
		dcfifo_component.rdsync_delaypipe = 5,
		dcfifo_component.read_aclr_synch = "OFF",
		dcfifo_component.underflow_checking = "ON",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.write_aclr_synch = "OFF",
		dcfifo_component.wrsync_delaypipe = 5;
endmodule