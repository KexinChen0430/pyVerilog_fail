module FIFO_SUM_IN_SQUARED (
	clock,
	data,
	rdreq,
	sclr,
	wrreq,
	empty,
	full,
	q);
	input	  clock;
	input	[25:0]  data;
	input	  rdreq;
	input	  sclr;
	input	  wrreq;
	output	  empty;
	output	  full;
	output	[25:0]  q;
	wire  sub_wire0;
	wire  sub_wire1;
	wire [25:0] sub_wire2;
	wire  empty = sub_wire0;
	wire  full = sub_wire1;
	wire [25:0] q = sub_wire2[25:0];
	scfifo	scfifo_component (
				.clock (clock),
				.data (data),
				.rdreq (rdreq),
				.sclr (sclr),
				.wrreq (wrreq),
				.empty (sub_wire0),
				.full (sub_wire1),
				.q (sub_wire2),
				.aclr (),
				.almost_empty (),
				.almost_full (),
				.usedw ());
	defparam
		scfifo_component.add_ram_output_register = "ON",
		scfifo_component.intended_device_family = "Cyclone II",
		scfifo_component.lpm_numwords = 16,
		scfifo_component.lpm_showahead = "OFF",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 26,
		scfifo_component.lpm_widthu = 4,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule