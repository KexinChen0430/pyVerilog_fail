module small_fifo_test (
	clock,
	data,
	rdreq,
	sclr,
	wrreq,
	empty,
	full,
	q,
	usedw);
	input	  clock;
	input	[71:0]  data;
	input	  rdreq;
	input	  sclr;
	input	  wrreq;
	output	  empty;
	output	  full;
	output	[71:0]  q;
	output	[2:0]  usedw;
	wire [2:0] sub_wire0;
	wire  sub_wire1;
	wire [71:0] sub_wire2;
	wire  sub_wire3;
	wire [2:0] usedw = sub_wire0[2:0];
	wire  empty = sub_wire1;
	wire [71:0] q = sub_wire2[71:0];
	wire  full = sub_wire3;
	scfifo	scfifo_component (
				.rdreq (rdreq),
				.sclr (sclr),
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
				.almost_full ()
				// synopsys translate_on
				);
	defparam
		scfifo_component.add_ram_output_register = "OFF",
		scfifo_component.intended_device_family = "Stratix II",
		scfifo_component.lpm_numwords = 8,
		scfifo_component.lpm_showahead = "OFF",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 72,
		scfifo_component.lpm_widthu = 3,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule