module gen_task_fifo  #(
  parameter DWIDTH = 32,
  parameter AWIDTH = 8
)(
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
	input	[DWIDTH-1:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  empty;
	output	  full;
	output	[DWIDTH-1:0]  q;
	output	[AWIDTH-1:0]  usedw;
	wire  sub_wire0;
	wire  sub_wire1;
	wire [DWIDTH-1:0] sub_wire2;
	wire [AWIDTH-1:0] sub_wire3;
	wire  empty = sub_wire0;
	wire  full = sub_wire1;
	wire [DWIDTH-1:0] q = sub_wire2[DWIDTH-1:0];
	wire [AWIDTH-1:0] usedw = sub_wire3[AWIDTH-1:0];
	scfifo	scfifo_component (
				.aclr (aclr),
				.clock (clock),
				.data (data),
				.rdreq (rdreq),
				.wrreq (wrreq),
				.empty (sub_wire0),
				.full (sub_wire1),
				.q (sub_wire2),
				.usedw (sub_wire3),
				.almost_empty (),
				.almost_full (),
				.sclr ());
	defparam
		scfifo_component.add_ram_output_register = "ON",
		scfifo_component.intended_device_family = "Cyclone IV GX",
		scfifo_component.lpm_numwords = 2**AWIDTH,
		scfifo_component.lpm_showahead = "ON",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = DWIDTH,
		scfifo_component.lpm_widthu = AWIDTH,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule