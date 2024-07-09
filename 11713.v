module altera_primitive_sync_fifo_24in_24out_16depth (
	aclr,
	clock,
	data,
	rdreq,
	sclr,
	wrreq,
	almost_empty,
	almost_full,
	empty,
	full,
	q,
	usedw);
	input	  aclr;
	input	  clock;
	input	[23:0]  data;
	input	  rdreq;
	input	  sclr;
	input	  wrreq;
	output	  almost_empty;
	output	  almost_full;
	output	  empty;
	output	  full;
	output	[23:0]  q;
	output	[3:0]  usedw;
	wire  sub_wire0;
	wire [3:0] sub_wire1;
	wire  sub_wire2;
	wire  sub_wire3;
	wire [23:0] sub_wire4;
	wire  sub_wire5;
	wire  almost_full = sub_wire0;
	wire [3:0] usedw = sub_wire1[3:0];
	wire  empty = sub_wire2;
	wire  almost_empty = sub_wire3;
	wire [23:0] q = sub_wire4[23:0];
	wire  full = sub_wire5;
	scfifo	scfifo_component (
				.rdreq (rdreq),
				.sclr (sclr),
				.aclr (aclr),
				.clock (clock),
				.wrreq (wrreq),
				.data (data),
				.almost_full (sub_wire0),
				.usedw (sub_wire1),
				.empty (sub_wire2),
				.almost_empty (sub_wire3),
				.q (sub_wire4),
				.full (sub_wire5));
	defparam
		scfifo_component.add_ram_output_register = "OFF",
		scfifo_component.almost_empty_value = 2,
		scfifo_component.almost_full_value = 14,
		scfifo_component.intended_device_family = "Cyclone III",
		scfifo_component.lpm_numwords = 16,
		scfifo_component.lpm_showahead = "ON",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 24,
		scfifo_component.lpm_widthu = 4,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule