module fifo_69x256 (
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	wrfull);
	input	[68:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[68:0]  q;
	output	  rdempty;
	output	  wrfull;
	wire  sub_wire0;
	wire  sub_wire1;
	wire [68:0] sub_wire2;
	wire  rdempty = sub_wire0;
	wire  wrfull = sub_wire1;
	wire [68:0] q = sub_wire2[68:0];
	dcfifo	dcfifo_component (
				.wrclk (wrclk),
				.rdreq (rdreq),
				.rdclk (rdclk),
				.wrreq (wrreq),
				.data (data),
				.rdempty (sub_wire0),
				.wrfull (sub_wire1),
				.q (sub_wire2)
				// synopsys translate_off
				,
				.aclr (),
				.rdfull (),
				.rdusedw (),
				.wrempty (),
				.wrusedw ()
				// synopsys translate_on
				);
	defparam
		dcfifo_component.intended_device_family = "Cyclone III",
		dcfifo_component.lpm_numwords = 256,
		dcfifo_component.lpm_showahead = "OFF",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 69,
		dcfifo_component.lpm_widthu = 8,
		dcfifo_component.overflow_checking = "OFF",
		dcfifo_component.rdsync_delaypipe = 4,
		dcfifo_component.underflow_checking = "OFF",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.wrsync_delaypipe = 4;
endmodule