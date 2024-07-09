module async_fifo_256x72_to_36 (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	rdusedw,
	wrfull);
	input	  aclr;
	input	[71:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[35:0]  q;
	output	  rdempty;
	output	[8:0]  rdusedw;
	output	  wrfull;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  sub_wire0;
	wire [35:0] sub_wire1;
	wire  sub_wire2;
	wire [8:0] sub_wire3;
	wire  wrfull = sub_wire0;
	wire [35:0] q = sub_wire1[35:0];
	wire  rdempty = sub_wire2;
	wire [8:0] rdusedw = sub_wire3[8:0];
	dcfifo_mixed_widths	dcfifo_mixed_widths_component (
				.rdclk (rdclk),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.aclr (aclr),
				.data (data),
				.rdreq (rdreq),
				.wrfull (sub_wire0),
				.q (sub_wire1),
				.rdempty (sub_wire2),
				.rdusedw (sub_wire3),
				.rdfull (),
				.wrempty (),
				.wrusedw ());
	defparam
		dcfifo_mixed_widths_component.intended_device_family = "Stratix IV",
		dcfifo_mixed_widths_component.lpm_numwords = 256,
		dcfifo_mixed_widths_component.lpm_showahead = "ON",
		dcfifo_mixed_widths_component.lpm_type = "dcfifo_mixed_widths",
		dcfifo_mixed_widths_component.lpm_width = 72,
		dcfifo_mixed_widths_component.lpm_widthu = 8,
		dcfifo_mixed_widths_component.lpm_widthu_r = 9,
		dcfifo_mixed_widths_component.lpm_width_r = 36,
		dcfifo_mixed_widths_component.overflow_checking = "ON",
		dcfifo_mixed_widths_component.rdsync_delaypipe = 3,
		dcfifo_mixed_widths_component.underflow_checking = "ON",
		dcfifo_mixed_widths_component.use_eab = "ON",
		dcfifo_mixed_widths_component.write_aclr_synch = "OFF",
		dcfifo_mixed_widths_component.wrsync_delaypipe = 3;
endmodule