module fifo_36x128 (
	clock,
	data,
	rdreq,
	wrreq,
	empty,
	full,
	q,
	usedw);
	input	  clock;
	input	[35:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  empty;
	output	  full;
	output	[35:0]  q;
	output	[6:0]  usedw;
	wire [6:0] sub_wire0;
	wire  sub_wire1;
	wire  sub_wire2;
	wire [35:0] sub_wire3;
	wire [6:0] usedw = sub_wire0[6:0];
	wire  empty = sub_wire1;
	wire  full = sub_wire2;
	wire [35:0] q = sub_wire3[35:0];
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
		scfifo_component.intended_device_family = "Arria II GX",
		scfifo_component.lpm_numwords = 128,
		scfifo_component.lpm_showahead = "OFF",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 36,
		scfifo_component.lpm_widthu = 7,
		scfifo_component.overflow_checking = "OFF",
		scfifo_component.underflow_checking = "OFF",
		scfifo_component.use_eab = "ON";
endmodule