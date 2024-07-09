module fifo32_clk_crossing_with_usage (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdusedw,
	wrusedw);
	input	  aclr;
	input	[31:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[31:0]  q;
	output	[12:0]  rdusedw;
	output	[12:0]  wrusedw;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [31:0] sub_wire0;
	wire [12:0] sub_wire1;
	wire [12:0] sub_wire2;
	wire [31:0] q = sub_wire0[31:0];
	wire [12:0] rdusedw = sub_wire1[12:0];
	wire [12:0] wrusedw = sub_wire2[12:0];
	dcfifo	dcfifo_component (
				.aclr (aclr),
				.data (data),
				.rdclk (rdclk),
				.rdreq (rdreq),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.q (sub_wire0),
				.rdusedw (sub_wire1),
				.wrusedw (sub_wire2),
				.eccstatus (),
				.rdempty (),
				.rdfull (),
				.wrempty (),
				.wrfull ());
	defparam
		dcfifo_component.add_usedw_msb_bit = "ON",
		dcfifo_component.intended_device_family = "Cyclone IV E",
		dcfifo_component.lpm_numwords = 4096,
		dcfifo_component.lpm_showahead = "OFF",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 32,
		dcfifo_component.lpm_widthu = 13,
		dcfifo_component.overflow_checking = "ON",
		dcfifo_component.rdsync_delaypipe = 4,
		dcfifo_component.read_aclr_synch = "OFF",
		dcfifo_component.underflow_checking = "ON",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.write_aclr_synch = "OFF",
		dcfifo_component.wrsync_delaypipe = 4;
endmodule