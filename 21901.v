module playback_fifo (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	rdfull,
	wrempty,
	wrfull,
	wrusedw);
	input	  aclr;
	input	[31:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[63:0]  q;
	output	  rdempty;
	output	  rdfull;
	output	  wrempty;
	output	  wrfull;
	output	[4:0]  wrusedw;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [63:0] sub_wire0;
	wire  sub_wire1;
	wire  sub_wire2;
	wire  sub_wire3;
	wire  sub_wire4;
	wire [4:0] sub_wire5;
	wire [63:0] q = sub_wire0[63:0];
	wire  rdempty = sub_wire1;
	wire  rdfull = sub_wire2;
	wire  wrempty = sub_wire3;
	wire  wrfull = sub_wire4;
	wire [4:0] wrusedw = sub_wire5[4:0];
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
				.wrempty (sub_wire3),
				.wrfull (sub_wire4),
				.wrusedw (sub_wire5),
				.eccstatus (),
				.rdusedw ());
	defparam
		dcfifo_mixed_widths_component.intended_device_family = "Cyclone V",
		dcfifo_mixed_widths_component.lpm_numwords = 32,
		dcfifo_mixed_widths_component.lpm_showahead = "ON",
		dcfifo_mixed_widths_component.lpm_type = "dcfifo_mixed_widths",
		dcfifo_mixed_widths_component.lpm_width = 32,
		dcfifo_mixed_widths_component.lpm_widthu = 5,
		dcfifo_mixed_widths_component.lpm_widthu_r = 4,
		dcfifo_mixed_widths_component.lpm_width_r = 64,
		dcfifo_mixed_widths_component.overflow_checking = "OFF",
		dcfifo_mixed_widths_component.rdsync_delaypipe = 4,
		dcfifo_mixed_widths_component.read_aclr_synch = "OFF",
		dcfifo_mixed_widths_component.underflow_checking = "OFF",
		dcfifo_mixed_widths_component.use_eab = "ON",
		dcfifo_mixed_widths_component.write_aclr_synch = "ON",
		dcfifo_mixed_widths_component.wrsync_delaypipe = 4;
endmodule