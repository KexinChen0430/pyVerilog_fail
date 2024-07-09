module fifo_128x128a (
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
	input	[127:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[127:0]  q;
	output	  rdempty;
	output	  wrfull;
	output	[6:0]  wrusedw;
	wire  sub_wire0;
	wire [6:0] sub_wire1;
	wire  sub_wire2;
	wire [127:0] sub_wire3;
	wire  rdempty = sub_wire0;
	wire [6:0] wrusedw = sub_wire1[6:0];
	wire  wrfull = sub_wire2;
	wire [127:0] q = sub_wire3[127:0];
	dcfifo	dcfifo_component (
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
		dcfifo_component.intended_device_family = "Cyclone II",
		dcfifo_component.lpm_hint = "RAM_BLOCK_TYPE=M4K",
		dcfifo_component.lpm_numwords = 128,
		dcfifo_component.lpm_showahead = "OFF",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 128,
		dcfifo_component.lpm_widthu = 7,
		dcfifo_component.overflow_checking = "OFF",
		dcfifo_component.rdsync_delaypipe = 4,
		dcfifo_component.underflow_checking = "OFF",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.wrsync_delaypipe = 4;
endmodule