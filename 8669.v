module altera_dpram_16x32 (
	clock,
	data,
	rdaddress,
	wraddress,
	wren,
	q);
	input	  clock;
	input	[31:0]  data;
	input	[3:0]  rdaddress;
	input	[3:0]  wraddress;
	input	  wren;
	output	[31:0]  q;
	wire [31:0] sub_wire0;
	wire [31:0] q = sub_wire0[31:0];
	altsyncram	altsyncram_component (
				.wren_a (wren),
				.clock0 (clock),
				.address_a (wraddress),
				.address_b (rdaddress),
				.data_a (data),
				.q_b (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.clocken1 (1'b1),
				.clocken0 (1'b1),
				.q_a (),
				.data_b ({32{1'b1}}),
				.rden_b (1'b1),
				.wren_b (1'b0),
				.byteena_b (1'b1),
				.addressstall_a (1'b0),
				.byteena_a (1'b1),
				.addressstall_b (1'b0),
				.clock1 (1'b1));
	defparam
		altsyncram_component.address_reg_b = "CLOCK0",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_input_b = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.intended_device_family = "Cyclone II",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 16,
		altsyncram_component.numwords_b = 16,
		altsyncram_component.operation_mode = "DUAL_PORT",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_b = "UNREGISTERED",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.read_during_write_mode_mixed_ports = "DONT_CARE",
		altsyncram_component.widthad_a = 4,
		altsyncram_component.widthad_b = 4,
		altsyncram_component.width_a = 32,
		altsyncram_component.width_b = 32,
		altsyncram_component.width_byteena_a = 1;
endmodule