module fifo_64_12 (
	aclr,
	clock,
	data,
	rdreq,
	wrreq,
	empty,
	q);
	input	  aclr;
	input	  clock;
	input	[11:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  empty;
	output	[11:0]  q;
	wire  sub_wire0;
	wire [11:0] sub_wire1;
	wire  empty = sub_wire0;
	wire [11:0] q = sub_wire1[11:0];
	scfifo	scfifo_component (
				.aclr (aclr),
				.clock (clock),
				.data (data),
				.rdreq (rdreq),
				.wrreq (wrreq),
				.empty (sub_wire0),
				.q (sub_wire1),
				.almost_empty (),
				.almost_full (),
				.full (),
				.sclr (),
				.usedw ());
	defparam
		scfifo_component.add_ram_output_register = "ON",
		scfifo_component.intended_device_family = "Stratix V",
		scfifo_component.lpm_numwords = 64,
		scfifo_component.lpm_showahead = "ON",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 12,
		scfifo_component.lpm_widthu = 6,
		scfifo_component.overflow_checking = "OFF",
		scfifo_component.underflow_checking = "OFF",
		scfifo_component.use_eab = "ON";
endmodule