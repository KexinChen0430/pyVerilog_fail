module fifo (
	clock,
	data,
	rdreq,
	wrreq,
	empty,
	full,
	q,
	usedw);
	input	  clock;
	input	[15:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  empty;
	output	  full;
	output	[15:0]  q;
	output	[7:0]  usedw;
	wire  sub_wire0;
	wire  sub_wire1;
	wire [15:0] sub_wire2;
	wire [7:0] sub_wire3;
	wire  empty = sub_wire0;
	wire  full = sub_wire1;
	wire [15:0] q = sub_wire2[15:0];
	wire [7:0] usedw = sub_wire3[7:0];
	scfifo	scfifo_component (
				.clock (clock),
				.data (data),
				.rdreq (rdreq),
				.wrreq (wrreq),
				.empty (sub_wire0),
				.full (sub_wire1),
				.q (sub_wire2),
				.usedw (sub_wire3),
				.aclr (),
				.almost_empty (),
				.almost_full (),
				.eccstatus (),
				.sclr ());
	defparam
		scfifo_component.add_ram_output_register = "OFF",
		scfifo_component.intended_device_family = "Cyclone V",
		scfifo_component.lpm_numwords = 256,
		scfifo_component.lpm_showahead = "ON",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 16,
		scfifo_component.lpm_widthu = 8,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule