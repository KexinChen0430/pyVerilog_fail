module mc_cache_fifo_256 (
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
	input	[255:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  almost_full;
	output	  empty;
	output	  full;
	output	[255:0]  q;
	output	[7:0]  usedw;
	wire [7:0] sub_wire0;
	wire  sub_wire1;
	wire  sub_wire2;
	wire [255:0] sub_wire3;
	wire  sub_wire4;
	wire [7:0] usedw = sub_wire0[7:0];
	wire  empty = sub_wire1;
	wire  full = sub_wire2;
	wire [255:0] q = sub_wire3[255:0];
	wire  almost_full = sub_wire4;
	scfifo	scfifo_component (
				.clock (clock),
				.wrreq (wrreq),
				.aclr (aclr),
				.data (data),
				.rdreq (rdreq),
				.usedw (sub_wire0),
				.empty (sub_wire1),
				.full (sub_wire2),
				.q (sub_wire3),
				.almost_full (sub_wire4),
				.almost_empty (),
				.sclr ());
	defparam
		scfifo_component.add_ram_output_register = "ON",
		scfifo_component.almost_full_value = 128,
		scfifo_component.intended_device_family = "Arria II GX",
		scfifo_component.lpm_numwords = 256,
		scfifo_component.lpm_showahead = "ON",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 256,
		scfifo_component.lpm_widthu = 8,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule