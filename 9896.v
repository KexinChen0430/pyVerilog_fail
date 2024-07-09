module asyn_64_1 (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty);
	input	  aclr;
	input	[0:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[0:0]  q;
	output	  rdempty;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [0:0] sub_wire0;
	wire  sub_wire1;
	wire [0:0] q = sub_wire0[0:0];
	wire  rdempty = sub_wire1;
	dcfifo	dcfifo_component (
				.aclr (aclr),
				.data (data),
				.rdclk (rdclk),
				.rdreq (rdreq),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.q (sub_wire0),
				.rdempty (sub_wire1),
				.rdfull (),
				.rdusedw (),
				.wrempty (),
				.wrfull (),
				.wrusedw ());
	defparam
		dcfifo_component.intended_device_family = "Stratix V",
		dcfifo_component.lpm_numwords = 64,
		dcfifo_component.lpm_showahead = "ON",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 1,
		dcfifo_component.lpm_widthu = 6,
		dcfifo_component.overflow_checking = "ON",
		dcfifo_component.rdsync_delaypipe = 5,
		dcfifo_component.read_aclr_synch = "OFF",
		dcfifo_component.underflow_checking = "ON",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.write_aclr_synch = "OFF",
		dcfifo_component.wrsync_delaypipe = 5;
endmodule