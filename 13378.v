module fifo64_clock_crossing (
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdusedw,
	wrfull);
	input	[63:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[63:0]  q;
	output	[12:0]  rdusedw;
	output	  wrfull;
	wire [63:0] sub_wire0;
	wire [12:0] sub_wire1;
	wire  sub_wire2;
	wire [63:0] q = sub_wire0[63:0];
	wire [12:0] rdusedw = sub_wire1[12:0];
	wire  wrfull = sub_wire2;
	dcfifo	dcfifo_component (
				.data (data),
				.rdclk (rdclk),
				.rdreq (rdreq),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.q (sub_wire0),
				.rdusedw (sub_wire1),
				.wrfull (sub_wire2),
				.aclr (),
				.eccstatus (),
				.rdempty (),
				.rdfull (),
				.wrempty (),
				.wrusedw ());
	defparam
		dcfifo_component.add_usedw_msb_bit = "ON",
		dcfifo_component.intended_device_family = "Cyclone IV E",
		dcfifo_component.lpm_numwords = 4096,
		dcfifo_component.lpm_showahead = "OFF",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 64,
		dcfifo_component.lpm_widthu = 13,
		dcfifo_component.overflow_checking = "ON",
		dcfifo_component.rdsync_delaypipe = 5,
		dcfifo_component.underflow_checking = "ON",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.wrsync_delaypipe = 5;
endmodule