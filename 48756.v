module Sdram_FIFO (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	rdusedw,
	wrfull,
	wrusedw);
	input	  aclr;
	input	[15:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[15:0]  q;
	output	  rdempty;
	output	[9:0]  rdusedw;
	output	  wrfull;
	output	[9:0]  wrusedw;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  sub_wire0;
	wire [15:0] sub_wire1;
	wire  sub_wire2;
	wire [9:0] sub_wire3;
	wire [9:0] sub_wire4;
	wire  wrfull = sub_wire0;
	wire [15:0] q = sub_wire1[15:0];
	wire  rdempty = sub_wire2;
	wire [9:0] wrusedw = sub_wire3[9:0];
	wire [9:0] rdusedw = sub_wire4[9:0];
	dcfifo	dcfifo_component (
				.rdclk (rdclk),
				.wrclk (wrclk),
				.wrreq (wrreq),
				.aclr (aclr),
				.data (data),
				.rdreq (rdreq),
				.wrfull (sub_wire0),
				.q (sub_wire1),
				.rdempty (sub_wire2),
				.wrusedw (sub_wire3),
				.rdusedw (sub_wire4),
				.rdfull (),
				.wrempty ());
	defparam
		dcfifo_component.add_ram_output_register = "OFF",
		dcfifo_component.clocks_are_synchronized = "FALSE",
		dcfifo_component.intended_device_family = "Cyclone",
		dcfifo_component.lpm_hint = "RAM_BLOCK_TYPE=M4K",
		dcfifo_component.lpm_numwords = 1024,
		dcfifo_component.lpm_showahead = "OFF",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 16,
		dcfifo_component.lpm_widthu = 10,
		dcfifo_component.overflow_checking = "ON",
		dcfifo_component.underflow_checking = "ON",
		dcfifo_component.use_eab = "ON";
endmodule