module ram_128x8_dp_be (
	address_a,
	address_b,
	byteena_a,
	clock_a,
	clock_b,
	data_a,
	data_b,
	wren_a,
	wren_b,
	q_a,
	q_b);
	input	[2:0]  address_a;
	input	[2:0]  address_b;
	input	[15:0]  byteena_a;
	input	  clock_a;
	input	  clock_b;
	input	[127:0]  data_a;
	input	[127:0]  data_b;
	input	  wren_a;
	input	  wren_b;
	output	[127:0]  q_a;
	output	[127:0]  q_b;
	wire [127:0] sub_wire0;
	wire [127:0] sub_wire1;
	wire [127:0] q_a = sub_wire0[127:0];
	wire [127:0] q_b = sub_wire1[127:0];
	altsyncram	altsyncram_component (
				.wren_a (wren_a),
				.clock0 (clock_a),
				.wren_b (wren_b),
				.clock1 (clock_b),
				.byteena_a (byteena_a),
				.address_a (address_a),
				.address_b (address_b),
				.data_a (data_a),
				.data_b (data_b),
				.q_a (sub_wire0),
				.q_b (sub_wire1),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.clocken1 (1'b1),
				.clocken0 (1'b1),
				.rden_b (1'b1),
				.byteena_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0));
	defparam
		altsyncram_component.address_reg_b = "CLOCK1",
		altsyncram_component.byte_size = 8,
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_input_b = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.indata_reg_b = "CLOCK1",
		altsyncram_component.intended_device_family = "Cyclone II",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 8,
		altsyncram_component.numwords_b = 8,
		altsyncram_component.operation_mode = "BIDIR_DUAL_PORT",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.outdata_reg_b = "UNREGISTERED",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.ram_block_type = "M4K",
		altsyncram_component.widthad_a = 3,
		altsyncram_component.widthad_b = 3,
		altsyncram_component.width_a = 128,
		altsyncram_component.width_b = 128,
		altsyncram_component.width_byteena_a = 16,
		altsyncram_component.width_byteena_b = 1,
		altsyncram_component.wrcontrol_wraddress_reg_b = "CLOCK1";
endmodule