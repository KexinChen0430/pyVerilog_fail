module capture_fifo (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	rdfull,
	rdusedw,
	wrempty,
	wrfull);
	input	  aclr;
	input	[63:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[31:0]  q;
	output	  rdempty;
	output	  rdfull;
	output	[4:0]  rdusedw;
	output	  wrempty;
	output	  wrfull;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [31:0] sub_wire0;
	wire  sub_wire1;
	wire  sub_wire2;
	wire [4:0] sub_wire3;
	wire  sub_wire4;
	wire  sub_wire5;
	wire [31:0] q = sub_wire0[31:0];
	wire  rdempty = sub_wire1;
	wire  rdfull = sub_wire2;
	wire [4:0] rdusedw = sub_wire3[4:0];
	wire  wrempty = sub_wire4;
	wire  wrfull = sub_wire5;
	dcfifo_mixed_widths	dcfifo_mixed_widths_component (
				.aclr (aclr),
				.data (data),
				.rdclk (rdclk),
				.rdreq (rdreq),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.q (sub_wire0),
				.rdempty (sub_wire1),
				.rdfull (sub_wire2),
				.rdusedw (sub_wire3),
				.wrempty (sub_wire4),
				.wrfull (sub_wire5),
				.eccstatus (),
				.wrusedw ());
	defparam
		dcfifo_mixed_widths_component.intended_device_family = "Cyclone V",
		dcfifo_mixed_widths_component.lpm_numwords = 16,
		dcfifo_mixed_widths_component.lpm_showahead = "ON",
		dcfifo_mixed_widths_component.lpm_type = "dcfifo_mixed_widths",
		dcfifo_mixed_widths_component.lpm_width = 64,
		dcfifo_mixed_widths_component.lpm_widthu = 4,
		dcfifo_mixed_widths_component.lpm_widthu_r = 5,
		dcfifo_mixed_widths_component.lpm_width_r = 32,
		dcfifo_mixed_widths_component.overflow_checking = "OFF",
		dcfifo_mixed_widths_component.rdsync_delaypipe = 4,
		dcfifo_mixed_widths_component.read_aclr_synch = "ON",
		dcfifo_mixed_widths_component.underflow_checking = "OFF",
		dcfifo_mixed_widths_component.use_eab = "ON",
		dcfifo_mixed_widths_component.write_aclr_synch = "OFF",
		dcfifo_mixed_widths_component.wrsync_delaypipe = 4;
endmodule