module fifo_uart (
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
	input	[7:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[7:0]  q;
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
	wire [7:0] sub_wire1;
	wire  sub_wire2;
	wire  wrfull = sub_wire0;
	wire [7:0] q = sub_wire1[7:0];
	wire  rdempty = sub_wire2;
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
				.rdfull (),
				.rdusedw (),
				.wrempty (),
				.wrusedw ());
	defparam
		dcfifo_component.intended_device_family = "Cyclone IV E",
		dcfifo_component.lpm_numwords = 4096,
		dcfifo_component.lpm_showahead = "OFF",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 8,
		dcfifo_component.lpm_widthu = 12,
		dcfifo_component.overflow_checking = "ON",
		dcfifo_component.rdsync_delaypipe = 5,
		dcfifo_component.read_aclr_synch = "OFF",
		dcfifo_component.underflow_checking = "ON",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.write_aclr_synch = "OFF",
		dcfifo_component.wrsync_delaypipe = 5;
endmodule