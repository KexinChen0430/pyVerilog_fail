module sfifo_144x256 (
	aclr,
	clock,
	data,
	rdreq,
	wrreq,
	empty,
	full,
	q);
	input	  aclr;
	input	  clock;
	input	[143:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  empty;
	output	  full;
	output	[143:0]  q;
	wire  sub_wire0;
	wire  sub_wire1;
	wire [143:0] sub_wire2;
	wire  empty = sub_wire0;
	wire  full = sub_wire1;
	wire [143:0] q = sub_wire2[143:0];
	scfifo	scfifo_component (
				.aclr (aclr),
				.clock (clock),
				.data (data),
				.rdreq (rdreq),
				.wrreq (wrreq),
				.empty (sub_wire0),
				.full (sub_wire1),
				.q (sub_wire2),
				.almost_empty (),
				.almost_full (),
				.sclr (),
				.usedw ());
	defparam
		scfifo_component.add_ram_output_register = "OFF",
		scfifo_component.intended_device_family = "Arria II GX",
		scfifo_component.lpm_numwords = 256,
		scfifo_component.lpm_showahead = "OFF",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 144,
		scfifo_component.lpm_widthu = 8,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule