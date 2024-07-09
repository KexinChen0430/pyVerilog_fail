module fifo_1kx16 (
	aclr,
	clock,
	data,
	rdreq,
	wrreq,
	almost_empty,
	empty,
	full,
	q,
	usedw);
	input	  aclr;
	input	  clock;
	input	[15:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  almost_empty;
	output	  empty;
	output	  full;
	output	[15:0]  q;
	output	[9:0]  usedw;
	wire [9:0] sub_wire0;
	wire  sub_wire1;
	wire  sub_wire2;
	wire [15:0] sub_wire3;
	wire  sub_wire4;
	wire [9:0] usedw = sub_wire0[9:0];
	wire  empty = sub_wire1;
	wire  almost_empty = sub_wire2;
	wire [15:0] q = sub_wire3[15:0];
	wire  full = sub_wire4;
	scfifo	scfifo_component (
				.rdreq (rdreq),
				.aclr (aclr),
				.clock (clock),
				.wrreq (wrreq),
				.data (data),
				.usedw (sub_wire0),
				.empty (sub_wire1),
				.almost_empty (sub_wire2),
				.q (sub_wire3),
				.full (sub_wire4)
				// synopsys translate_off
				,
				.sclr (),
				.almost_full ()
				// synopsys translate_on
				);
	defparam
		scfifo_component.add_ram_output_register = "OFF",
		scfifo_component.almost_empty_value = 504,
		scfifo_component.intended_device_family = "Cyclone",
		scfifo_component.lpm_hint = "RAM_BLOCK_TYPE=M4K",
		scfifo_component.lpm_numwords = 1024,
		scfifo_component.lpm_showahead = "OFF",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 16,
		scfifo_component.lpm_widthu = 10,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule