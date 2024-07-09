module FIFO_READ (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	wrfull);
	input	  aclr;
	input	[7:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[7:0]  q;
	output	  rdempty;
	output	  wrfull;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  sub_wire0;
	wire  sub_wire1;
	wire [7:0] sub_wire2;
	wire  rdempty = sub_wire0;
	wire  wrfull = sub_wire1;
	wire [7:0] q = sub_wire2[7:0];
	dcfifo	dcfifo_component (
				.wrclk (wrclk),
				.rdreq (rdreq),
				.aclr (aclr),
				.rdclk (rdclk),
				.wrreq (wrreq),
				.data (data),
				.rdempty (sub_wire0),
				.wrfull (sub_wire1),
				.q (sub_wire2)
				// synopsys translate_off
				,
				.rdfull (),
				.rdusedw (),
				.wrempty (),
				.wrusedw ()
				// synopsys translate_on
				);
	defparam
		dcfifo_component.intended_device_family = "Cyclone II",
		dcfifo_component.lpm_hint = "MAXIMIZE_SPEED=5,",
		dcfifo_component.lpm_numwords = 512,
		dcfifo_component.lpm_showahead = "OFF",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 8,
		dcfifo_component.lpm_widthu = 9,
		dcfifo_component.overflow_checking = "ON",
		dcfifo_component.rdsync_delaypipe = 4,
		dcfifo_component.underflow_checking = "ON",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.write_aclr_synch = "OFF",
		dcfifo_component.wrsync_delaypipe = 4;
endmodule