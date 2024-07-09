module dpram_32_32x16_be (
	data,
	wren,
	wraddress,
	rdaddress,
	byteena_a,
	wrclock,
	rdclock,
	q);
	input	[31:0]  data;
	input	  wren;
	input	[3:0]  wraddress;
	input	[3:0]  rdaddress;
	input	[3:0]  byteena_a;
	input	  wrclock;
	input	  rdclock;
	output	[31:0]  q;
	wire [31:0] sub_wire0;
	wire [31:0] q = sub_wire0[31:0];
	altsyncram	altsyncram_component (
				.wren_a (wren),
				.clock0 (wrclock),
				.clock1 (rdclock),
				.byteena_a (byteena_a),
				.address_a (wraddress),
				.address_b (rdaddress),
				.data_a (data),
				.q_b (sub_wire0)
				// synopsys translate_off
				,
				.aclr0 (),
				.aclr1 (),
				.addressstall_a (),
				.addressstall_b (),
				.byteena_b (),
				.clocken0 (),
				.clocken1 (),
				.data_b (),
				.q_a (),
				.rden_b (),
				.wren_b ()
				// synopsys translate_on
				);
	defparam
		altsyncram_component.intended_device_family = "Cyclone II",
		altsyncram_component.operation_mode = "DUAL_PORT",
		altsyncram_component.width_a = 32,
		altsyncram_component.widthad_a = 4,
		altsyncram_component.numwords_a = 16,
		altsyncram_component.width_b = 32,
		altsyncram_component.widthad_b = 4,
		altsyncram_component.numwords_b = 16,
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.width_byteena_a = 4,
		altsyncram_component.byte_size = 8,
		altsyncram_component.outdata_reg_b = "UNREGISTERED",
		altsyncram_component.address_reg_b = "CLOCK1",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_input_b = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.power_up_uninitialized = "FALSE";
endmodule