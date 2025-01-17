module altera_primitive_sync_fifo_8in_8out_16depth (
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
	input	[7:0]  data;
	input	  rdreq;
	input	  sclr;
	input	  wrreq;
	output	  almost_empty;
	output	  almost_full;
	output	  empty;
	output	  full;
	output	[7:0]  q;
	output	[3:0]  usedw;
	wire [3:0] sub_wire0;
	wire  sub_wire1;
	wire  sub_wire2;
	wire [7:0] sub_wire3;
	wire  sub_wire4;
	wire  sub_wire5;
	wire [3:0] usedw = sub_wire0[3:0];
	wire  empty = sub_wire1;
	wire  full = sub_wire2;
	wire [7:0] q = sub_wire3[7:0];
	wire  almost_empty = sub_wire4;
	wire  almost_full = sub_wire5;
	scfifo	scfifo_component (
				.clock (clock),
				.sclr (sclr),
				.wrreq (wrreq),
				.aclr (aclr),
				.data (data),
				.rdreq (rdreq),
				.usedw (sub_wire0),
				.empty (sub_wire1),
				.full (sub_wire2),
				.q (sub_wire3),
				.almost_empty (sub_wire4),
				.almost_full (sub_wire5));
	defparam
		scfifo_component.add_ram_output_register = "ON",
		scfifo_component.almost_empty_value = 2,
		scfifo_component.almost_full_value = 14,
		scfifo_component.intended_device_family = "Cyclone IV GX",
		scfifo_component.lpm_numwords = 16,
		scfifo_component.lpm_showahead = "ON",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 8,
		scfifo_component.lpm_widthu = 4,
		scfifo_component.overflow_checking = "OFF",
		scfifo_component.underflow_checking = "OFF",
		scfifo_component.use_eab = "ON";
endmodule