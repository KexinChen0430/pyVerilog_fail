module ff_10x1024_fwft (
	aclr,
	clock,
	data,
	rdreq,
	wrreq,
	empty,
	full,
	q,
	usedw);
	input	  aclr;
	input	  clock;
	input	[9:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  empty;
	output	  full;
	output	[9:0]  q;
	output	[9:0]  usedw;
	wire [9:0] sub_wire0;
	wire  sub_wire1;
	wire  sub_wire2;
	wire [9:0] sub_wire3;
	wire [9:0] usedw = sub_wire0[9:0];
	wire  empty = sub_wire1;
	wire  full = sub_wire2;
	wire [9:0] q = sub_wire3[9:0];
	scfifo	scfifo_component (
				.clock (clock),
				.wrreq (wrreq),
				.aclr (aclr),
				.data (data),
				.rdreq (rdreq),
				.usedw (sub_wire0),
				.empty (sub_wire1),
				.full (sub_wire2),
				.q (sub_wire3),
				.almost_empty (),
				.almost_full (),
				.sclr ());
	defparam
		scfifo_component.add_ram_output_register = "OFF",
		scfifo_component.intended_device_family = "Cyclone V",
		scfifo_component.lpm_hint = "RAM_BLOCK_TYPE=M10K",
		scfifo_component.lpm_numwords = 1024,
		scfifo_component.lpm_showahead = "ON",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 10,
		scfifo_component.lpm_widthu = 10,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule