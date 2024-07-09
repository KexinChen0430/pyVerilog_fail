module fifo (
	clock,
	data,
	rdreq,
	wrreq,
	empty,
	q);
	input	  clock;
	input	[7:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  empty;
	output	[7:0]  q;
	wire  sub_wire0;
	wire [7:0] sub_wire1;
	wire  empty = sub_wire0;
	wire [7:0] q = sub_wire1[7:0];
	scfifo	scfifo_component (
				.clock (clock),
				.data (data),
				.rdreq (rdreq),
				.wrreq (wrreq),
				.empty (sub_wire0),
				.q (sub_wire1),
				.aclr (),
				.almost_empty (),
				.almost_full (),
				.full (),
				.sclr (),
				.usedw ());
	defparam
		scfifo_component.add_ram_output_register = "OFF",
		scfifo_component.intended_device_family = "Cyclone III",
		scfifo_component.lpm_numwords = 16,
		scfifo_component.lpm_showahead = "OFF",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 8,
		scfifo_component.lpm_widthu = 4,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "OFF",
		scfifo_component.use_eab = "ON";
endmodule