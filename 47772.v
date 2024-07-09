module pkt_ff_async_mem #(DWIDTH=32,  DEPTH=128) (
	data,
	rdaddress,
	rdclock,
	wraddress,
	wrclock,
	wren,
	q);
  localparam  AWIDTH  = $clog2(DEPTH);
	input	[DWIDTH-1:0]  data;
	input	[AWIDTH-1:0]  rdaddress;
	input	  rdclock;
	input	[AWIDTH-1:0]  wraddress;
	input	  wrclock;
	input	  wren;
	output	[DWIDTH-1:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  wrclock;
	tri0	  wren;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [DWIDTH-1:0] sub_wire0;
	wire [DWIDTH-1:0] q = sub_wire0[DWIDTH-1:0];
	altsyncram	altsyncram_component (
				.address_a (wraddress),
				.clock0 (wrclock),
				.data_a (data),
				.wren_a (wren),
				.address_b (rdaddress),
				.clock1 (rdclock),
				.q_b (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_b ({DWIDTH{1'b1}}),
				.eccstatus (),
				.q_a (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_reg_b = "CLOCK1",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_input_b = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.intended_device_family = "Cyclone II",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = DEPTH,
		altsyncram_component.numwords_b = DEPTH,
		altsyncram_component.operation_mode = "DUAL_PORT",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_b = "UNREGISTERED",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.ram_block_type = "M4K",
		altsyncram_component.widthad_a = AWIDTH,
		altsyncram_component.widthad_b = AWIDTH,
		altsyncram_component.width_a = DWIDTH,
		altsyncram_component.width_b = DWIDTH,
		altsyncram_component.width_byteena_a = 1;
endmodule