module IPfifo (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	rdusedw,
	wrempty,
	wrusedw);
	input	  aclr;
	input	[9:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[9:0]  q;
	output	  rdempty;
	output	[13:0]  rdusedw;
	output	  wrempty;
	output	[13:0]  wrusedw;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [9:0] sub_wire0;
	wire  sub_wire1;
	wire [13:0] sub_wire2;
	wire  sub_wire3;
	wire [13:0] sub_wire4;
	wire [9:0] q = sub_wire0[9:0];
	wire  rdempty = sub_wire1;
	wire [13:0] rdusedw = sub_wire2[13:0];
	wire  wrempty = sub_wire3;
	wire [13:0] wrusedw = sub_wire4[13:0];
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
				.wrempty (sub_wire3),
				.wrusedw (sub_wire4),
				.eccstatus (),
				.rdfull (),
				.wrfull ());
	defparam
		dcfifo_component.add_usedw_msb_bit = "ON",
		dcfifo_component.intended_device_family = "Cyclone IV E",
		dcfifo_component.lpm_numwords = 8192,
		dcfifo_component.lpm_showahead = "ON",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 10,
		dcfifo_component.lpm_widthu = 14,
		dcfifo_component.overflow_checking = "ON",
		dcfifo_component.rdsync_delaypipe = 5,
		dcfifo_component.read_aclr_synch = "OFF",
		dcfifo_component.underflow_checking = "ON",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.write_aclr_synch = "ON",
		dcfifo_component.wrsync_delaypipe = 5;
endmodule