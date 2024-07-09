module video_fifo (
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
	input	[31:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[7:0]  q;
	output	  rdempty;
	output	  wrfull;
	output	[6:0]  wrusedw;
	wire  sub_wire0;
	wire [6:0] sub_wire1;
	wire  sub_wire2;
	wire [7:0] sub_wire3;
	wire  rdempty = sub_wire0;
	wire [6:0] wrusedw = sub_wire1[6:0];
	wire  wrfull = sub_wire2;
	wire [7:0] q = sub_wire3[7:0];
	dcfifo_mixed_widths	dcfifo_mixed_widths_component (
				.wrclk (wrclk),
				.rdreq (rdreq),
				.aclr (aclr),
				.rdclk (rdclk),
				.wrreq (wrreq),
				.data (data),
				.rdempty (sub_wire0),
				.wrusedw (sub_wire1),
				.wrfull (sub_wire2),
				.q (sub_wire3)
				// synopsys translate_off
				,
				.rdfull (),
				.rdusedw (),
				.wrempty ()
				// synopsys translate_on
				);
	defparam
		dcfifo_mixed_widths_component.intended_device_family = "Cyclone II",
		dcfifo_mixed_widths_component.lpm_hint = "MAXIMIZE_SPEED=5,",
		dcfifo_mixed_widths_component.lpm_numwords = 128,
		dcfifo_mixed_widths_component.lpm_showahead = "ON",
		dcfifo_mixed_widths_component.lpm_type = "dcfifo",
		dcfifo_mixed_widths_component.lpm_width = 32,
		dcfifo_mixed_widths_component.lpm_widthu = 7,
		dcfifo_mixed_widths_component.lpm_widthu_r = 9,
		dcfifo_mixed_widths_component.lpm_width_r = 8,
		dcfifo_mixed_widths_component.overflow_checking = "ON",
		dcfifo_mixed_widths_component.rdsync_delaypipe = 4,
		dcfifo_mixed_widths_component.underflow_checking = "ON",
		dcfifo_mixed_widths_component.use_eab = "ON",
		dcfifo_mixed_widths_component.write_aclr_synch = "ON",
		dcfifo_mixed_widths_component.wrsync_delaypipe = 4;
endmodule