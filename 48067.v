module fifo_108x256 (
	clock,
	data,
	rdreq,
	wrreq,
	almost_full,
	empty,
	full,
	q,
	usedw);
	input	  clock;
	input	[107:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  almost_full;
	output	  empty;
	output	  full;
	output	[107:0]  q;
	output	[7:0]  usedw;
	wire  sub_wire0;
	wire [7:0] sub_wire1;
	wire  sub_wire2;
	wire [107:0] sub_wire3;
	wire  sub_wire4;
	wire  almost_full = sub_wire0;
	wire [7:0] usedw = sub_wire1[7:0];
	wire  empty = sub_wire2;
	wire [107:0] q = sub_wire3[107:0];
	wire  full = sub_wire4;
	scfifo	scfifo_component (
				.rdreq (rdreq),
				.clock (clock),
				.wrreq (wrreq),
				.data (data),
				.almost_full (sub_wire0),
				.usedw (sub_wire1),
				.empty (sub_wire2),
				.q (sub_wire3),
				.full (sub_wire4)
				// synopsys translate_off
				,
				.aclr (),
				.almost_empty (),
				.sclr ()
				// synopsys translate_on
				);
	defparam
		scfifo_component.add_ram_output_register = "ON",
		scfifo_component.almost_full_value = 250,
		scfifo_component.intended_device_family = "Cyclone III",
		scfifo_component.lpm_hint = "RAM_BLOCK_TYPE=M9K",
		scfifo_component.lpm_numwords = 256,
		scfifo_component.lpm_showahead = "OFF",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 108,
		scfifo_component.lpm_widthu = 8,
		scfifo_component.overflow_checking = "OFF",
		scfifo_component.underflow_checking = "OFF",
		scfifo_component.use_eab = "ON";
endmodule