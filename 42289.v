module buf_fifo
#(
   parameter AWIDTH = 8,
   parameter DWIDTH = 64
)
(
	aclr,
	clock,
	data,
	rdreq,
	wrreq,
	almost_full,
	empty,
	full,
	q,
	usedw);
	input	  aclr;
	input	  clock;
	input	[DWIDTH-1:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  almost_full;
	output	  empty;
	output	  full;
	output	[DWIDTH-1:0]  q;
	output	[AWIDTH-1:0]  usedw;
	wire  sub_wire0;
	wire  sub_wire1;
	wire  sub_wire2;
	wire [DWIDTH-1:0] sub_wire3;
	wire [AWIDTH-1:0] sub_wire4;
	wire  almost_full = sub_wire0;
	wire  empty = sub_wire1;
	wire  full = sub_wire2;
	wire [DWIDTH-1:0] q = sub_wire3[DWIDTH-1:0];
	wire [AWIDTH-1:0] usedw = sub_wire4[AWIDTH-1:0];
	scfifo	scfifo_component (
				.aclr (aclr),
				.clock (clock),
				.data (data),
				.rdreq (rdreq),
				.wrreq (wrreq),
				.almost_full (sub_wire0),
				.empty (sub_wire1),
				.full (sub_wire2),
				.q (sub_wire3),
				.usedw (sub_wire4),
				.almost_empty (),
				.sclr ());
	defparam
		scfifo_component.add_ram_output_register = "ON",
		scfifo_component.almost_full_value = 2**AWIDTH - 16,
		scfifo_component.intended_device_family = "Cyclone V",
		scfifo_component.lpm_numwords = 2**AWIDTH,
		scfifo_component.lpm_showahead = "OFF",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = DWIDTH,
		scfifo_component.lpm_widthu = AWIDTH,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule