module ffoo (
	clock,
	data,
	rdreq,
	wrreq,
	empty,
	full,
	q,
	usedw);
	input	  clock;
	input	[7:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  empty;
	output	  full;
	output	[7:0]  q;
	output	[3:0]  usedw;
	wire [3:0] sub_wire0;
	wire  sub_wire1;
	wire  sub_wire2;
	wire [7:0] sub_wire3;
	wire [3:0] usedw = sub_wire0[3:0];
	wire  empty = sub_wire1;
	wire  full = sub_wire2;
	wire [7:0] q = sub_wire3[7:0];
	scfifo	scfifo_component (
				.clock (clock),
				.data (data),
				.rdreq (rdreq),
				.wrreq (wrreq),
				.usedw (sub_wire0),
				.empty (sub_wire1),
				.full (sub_wire2),
				.q (sub_wire3),
				.aclr (),
				.almost_empty (),
				.almost_full (),
				.sclr ());
	defparam
		scfifo_component.add_ram_output_register = "OFF",
		scfifo_component.intended_device_family = "Cyclone IV E",
		scfifo_component.lpm_numwords = 16,
		scfifo_component.lpm_showahead = "OFF",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 8,
		scfifo_component.lpm_widthu = 4,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule