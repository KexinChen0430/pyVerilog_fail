module ff_40x32_fwft (
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
	input	[39:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  empty;
	output	  full;
	output	[39:0]  q;
	output	[4:0]  usedw;
	wire [4:0] sub_wire0;
	wire  sub_wire1;
	wire  sub_wire2;
	wire [39:0] sub_wire3;
	wire [4:0] usedw = sub_wire0[4:0];
	wire  empty = sub_wire1;
	wire  full = sub_wire2;
	wire [39:0] q = sub_wire3[39:0];
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
		scfifo_component.add_ram_output_register = "ON",
		scfifo_component.intended_device_family = "Cyclone V",
		scfifo_component.lpm_hint = "RAM_BLOCK_TYPE=MLAB",
		scfifo_component.lpm_numwords = 32,
		scfifo_component.lpm_showahead = "ON",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 40,
		scfifo_component.lpm_widthu = 5,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule