module fifo_65_256 (
	aclr,
	clock,
	data,
	rdreq,
	wrreq,
	empty,
	q);
	input	  aclr;
	input	  clock;
	input	[64:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  empty;
	output	[64:0]  q;
	wire  sub_wire0;
	wire [64:0] sub_wire1;
	wire  empty = sub_wire0;
	wire [64:0] q = sub_wire1[64:0];
	scfifo	scfifo_component (
				.aclr (aclr),
				.clock (clock),
				.data (data),
				.rdreq (rdreq),
				.wrreq (wrreq),
				.empty (sub_wire0),
				.q (sub_wire1),
				.almost_empty (),
				.almost_full (),
				.full (),
				.sclr (),
				.usedw ());
	defparam
		scfifo_component.add_ram_output_register = "OFF",
		scfifo_component.intended_device_family = "Arria II GX",
		scfifo_component.lpm_numwords = 256,
		scfifo_component.lpm_showahead = "ON",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = 65,
		scfifo_component.lpm_widthu = 8,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule