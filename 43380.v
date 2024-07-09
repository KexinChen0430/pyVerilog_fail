module syncfifo_512x32 (
	clock,
	data,
	rdreq,
	sclr,
	wrreq,
	empty,
	full,
	q);
	input	  clock;
	input	[31:0]  data;
	input	  rdreq;
	input	  sclr;
	input	  wrreq;
	output	  empty;
	output	  full;
	output	[31:0]  q;
	wire  sub_wire0;
	wire  sub_wire1;
	wire [31:0] sub_wire2;
	wire  empty = sub_wire0;
	wire  full = sub_wire1;
	wire [31:0] q = sub_wire2[31:0];
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
		scfifo_component.add_ram_output_register = "OFF",
		scfifo_component.intended_device_family = "Stratix IV",
		scfifo_component.lpm_numwords = 512,
		scfifo_component.lpm_showahead = "OFF",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 32,
		scfifo_component.lpm_widthu = 9,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule