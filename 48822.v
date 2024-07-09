module ps2_cache (
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	wrfull);
	input	[21:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[21:0]  q;
	output	  rdempty;
	output	  wrfull;
	wire  sub_wire0;
	wire [21:0] sub_wire1;
	wire  sub_wire2;
	wire  wrfull = sub_wire0;
	wire [21:0] q = sub_wire1[21:0];
	wire  rdempty = sub_wire2;
	dcfifo	dcfifo_component (
				.data (data),
				.rdclk (rdclk),
				.rdreq (rdreq),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.wrfull (sub_wire0),
				.q (sub_wire1),
				.rdempty (sub_wire2),
				.aclr (),
				.rdfull (),
				.rdusedw (),
				.wrempty (),
				.wrusedw ());
	defparam
		dcfifo_component.intended_device_family = "Cyclone III",
		dcfifo_component.lpm_numwords = 256,
		dcfifo_component.lpm_showahead = "OFF",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 22,
		dcfifo_component.lpm_widthu = 8,
		dcfifo_component.overflow_checking = "ON",
		dcfifo_component.rdsync_delaypipe = 4,
		dcfifo_component.underflow_checking = "ON",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.wrsync_delaypipe = 4;
endmodule