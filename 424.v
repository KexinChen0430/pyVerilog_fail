module fifo_4kx16_dc (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdempty,
	rdusedw,
	wrfull,
	wrusedw);
	input	  aclr;
	input	[15:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[15:0]  q;
	output	  rdempty;
	output	[11:0]  rdusedw;
	output	  wrfull;
	output	[11:0]  wrusedw;
	wire  sub_wire0;
	wire [11:0] sub_wire1;
	wire  sub_wire2;
	wire [15:0] sub_wire3;
	wire [11:0] sub_wire4;
	wire  rdempty = sub_wire0;
	wire [11:0] wrusedw = sub_wire1[11:0];
	wire  wrfull = sub_wire2;
	wire [15:0] q = sub_wire3[15:0];
	wire [11:0] rdusedw = sub_wire4[11:0];
	dcfifo	dcfifo_component (
				.wrclk (wrclk),
				.rdreq (rdreq),
				.aclr (aclr),
				.rdclk (rdclk),
				.wrreq (wrreq),
				.data (data),
				.rdempty (sub_wire0),
				.wrusedw (sub_wire1),
				.wrfull (sub_wire2),
				.q (sub_wire3),
				.rdusedw (sub_wire4)
				// synopsys translate_off
				,
				.wrempty (),
				.rdfull ()
				// synopsys translate_on
				);
	defparam
		dcfifo_component.add_ram_output_register = "OFF",
		dcfifo_component.clocks_are_synchronized = "FALSE",
		dcfifo_component.intended_device_family = "Cyclone",
		dcfifo_component.lpm_numwords = 4096,
		dcfifo_component.lpm_showahead = "ON",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_width = 16,
		dcfifo_component.lpm_widthu = 12,
		dcfifo_component.overflow_checking = "OFF",
		dcfifo_component.underflow_checking = "OFF",
		dcfifo_component.use_eab = "ON";
endmodule