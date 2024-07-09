module fifo_256_134 (
	aclr,
	clock,
	data,
	rdreq,
	wrreq,
	empty,
	q,
	usedw);
	input	  aclr;
	input	  clock;
	input	[133:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  empty;
	output	[133:0]  q;
	output	[7:0]  usedw;
	wire  sub_wire0;
	wire [133:0] sub_wire1;
	wire [7:0] sub_wire2;
	wire  empty = sub_wire0;
	wire [133:0] q = sub_wire1[133:0];
	wire [7:0] usedw = sub_wire2[7:0];
	scfifo	scfifo_component (
				.aclr (aclr),
				.clock (clock),
				.data (data),
				.rdreq (rdreq),
				.wrreq (wrreq),
				.empty (sub_wire0),
				.q (sub_wire1),
				.usedw (sub_wire2),
				.almost_empty (),
				.almost_full (),
				.full (),
				.sclr ());
	defparam
		scfifo_component.add_ram_output_register = "ON",
		scfifo_component.intended_device_family = "Stratix V",
		scfifo_component.lpm_numwords = 256,
		scfifo_component.lpm_showahead = "ON",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 134,
		scfifo_component.lpm_widthu = 8,
		scfifo_component.overflow_checking = "OFF",
		scfifo_component.underflow_checking = "OFF",
		scfifo_component.use_eab = "ON";
endmodule