module sfifo_65x128 (
	data,
	wrreq,
	rdreq,
	clock,
	aclr,
	q,
	full,
	empty,
	usedw,
	almost_full);
	input	[64:0]  data;
	input	  wrreq;
	input	  rdreq;
	input	  clock;
	input	  aclr;
	output	[64:0]  q;
	output	  full;
	output	  empty;
	output	[6:0]  usedw;
	output	  almost_full;
	wire  sub_wire0;
	wire [6:0] sub_wire1;
	wire  sub_wire2;
	wire [64:0] sub_wire3;
	wire  sub_wire4;
	wire  almost_full = sub_wire0;
	wire [6:0] usedw = sub_wire1[6:0];
	wire  empty = sub_wire2;
	wire [64:0] q = sub_wire3[64:0];
	wire  full = sub_wire4;
	scfifo	scfifo_component (
				.rdreq (rdreq),
				.aclr (aclr),
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
				.almost_empty (),
				.sclr ()
				// synopsys translate_on
				);
	defparam
		scfifo_component.lpm_width = 65,
		scfifo_component.lpm_numwords = 128,
		scfifo_component.lpm_widthu = 7,
		scfifo_component.intended_device_family = "Cyclone II",
		scfifo_component.almost_full_value = 3,
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_showahead = "OFF",
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON",
		scfifo_component.add_ram_output_register = "OFF";
endmodule