module fifo_84x256 (
	clock,
	data,
	rdreq,
	wrreq,
	empty,
	full,
	q,
	usedw);
	input	  clock;
	input	[83:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  empty;
	output	  full;
	output	[83:0]  q;
	output	[7:0]  usedw;
	wire [7:0] sub_wire0;
	wire  sub_wire1;
	wire [83:0] sub_wire2;
	wire  sub_wire3;
	wire [7:0] usedw = sub_wire0[7:0];
	wire  empty = sub_wire1;
	wire [83:0] q = sub_wire2[83:0];
	wire  full = sub_wire3;
	scfifo	scfifo_component (
				.rdreq (rdreq),
				.clock (clock),
				.wrreq (wrreq),
				.data (data),
				.usedw (sub_wire0),
				.empty (sub_wire1),
				.q (sub_wire2),
				.full (sub_wire3)
				// synopsys translate_off
				,
				.aclr (),
				.almost_empty (),
				.almost_full (),
				.sclr ()
				// synopsys translate_on
				);
	defparam
		scfifo_component.add_ram_output_register = "OFF",
		scfifo_component.intended_device_family = "Cyclone III",
		scfifo_component.lpm_hint = "RAM_BLOCK_TYPE=M9K",
		scfifo_component.lpm_numwords = 256,
		scfifo_component.lpm_showahead = "OFF",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 84,
		scfifo_component.lpm_widthu = 8,
		scfifo_component.overflow_checking = "OFF",
		scfifo_component.underflow_checking = "OFF",
		scfifo_component.use_eab = "ON";
endmodule