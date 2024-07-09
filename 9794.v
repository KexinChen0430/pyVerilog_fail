module ram_128_134 (
	aclr,
	clock,
	data,
	rdaddress,
	rden,
	wraddress,
	wren,
	q);
	input	  aclr;
	input	  clock;
	input	[133:0]  data;
	input	[6:0]  rdaddress;
	input	  rden;
	input	[6:0]  wraddress;
	input	  wren;
	output	[133:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
	tri1	  clock;
	tri1	  rden;
	tri0	  wren;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [133:0] sub_wire0;
	wire [133:0] q = sub_wire0[133:0];
	altsyncram	altsyncram_component (
				.aclr0 (aclr),
				.address_a (wraddress),
				.address_b (rdaddress),
				.clock0 (clock),
				.data_a (data),
				.rden_b (rden),
				.wren_a (wren),
				.q_b (sub_wire0),
				.aclr1 (1'b0),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_b ({134{1'b1}}),
				.eccstatus (),
				.q_a (),
				.rden_a (1'b1),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_b = "CLEAR0",
		altsyncram_component.address_reg_b = "CLOCK0",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_input_b = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.intended_device_family = "Stratix V",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 128,
		altsyncram_component.numwords_b = 128,
		altsyncram_component.operation_mode = "DUAL_PORT",
		altsyncram_component.outdata_aclr_b = "CLEAR0",
		altsyncram_component.outdata_reg_b = "CLOCK0",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.rdcontrol_reg_b = "CLOCK0",
		altsyncram_component.read_during_write_mode_mixed_ports = "DONT_CARE",
		altsyncram_component.widthad_a = 7,
		altsyncram_component.widthad_b = 7,
		altsyncram_component.width_a = 134,
		altsyncram_component.width_b = 134,
		altsyncram_component.width_byteena_a = 1;
endmodule