module fifo_144x128 (
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
	input	[143:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  empty;
	output	  full;
	output	[143:0]  q;
	output	[6:0]  usedw;
	wire [6:0] sub_wire0;
	wire  sub_wire1;
	wire [143:0] sub_wire2;
	wire  sub_wire3;
	wire [6:0] usedw = sub_wire0[6:0];
	wire  empty = sub_wire1;
	wire [143:0] q = sub_wire2[143:0];
	wire  full = sub_wire3;
	scfifo	scfifo_component (
				.rdreq (rdreq),
				.aclr (aclr),
				.clock (clock),
				.wrreq (wrreq),
				.data (data),
				.usedw (sub_wire0),
				.empty (sub_wire1),
				.q (sub_wire2),
				.full (sub_wire3)
				// synopsys translate_off
				,
				.almost_empty (),
				.sclr (),
				.almost_full ()
				// synopsys translate_on
				);
	defparam
		scfifo_component.add_ram_output_register = "ON",
		scfifo_component.intended_device_family = "Cyclone II",
		scfifo_component.lpm_numwords = 128,
		scfifo_component.lpm_showahead = "OFF",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 144,
		scfifo_component.lpm_widthu = 7,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule