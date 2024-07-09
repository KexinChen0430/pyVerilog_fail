module dpram_4kx32 (
	data,
	rdaddress,
	rdclock,
	wraddress,
	wrclock,
	wren,
	q);
	input	[31:0]  data;
	input	[11:0]  rdaddress;
	input	  rdclock;
	input	[11:0]  wraddress;
	input	  wrclock;
	input	  wren;
	output	[31:0]  q;
	wire [31:0] sub_wire0;
	wire [31:0] q = sub_wire0[31:0];
	altsyncram	altsyncram_component (
				.wren_a (wren),
				.clock0 (wrclock),
				.clock1 (rdclock),
				.address_a (wraddress),
				.address_b (rdaddress),
				.data_a (data),
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
				.data_b ({32{1'b1}}),
				.eccstatus (),
				.q_a (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_b = "NONE",
		altsyncram_component.address_reg_b = "CLOCK1",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_input_b = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.intended_device_family = "Cyclone III",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 4096,
		altsyncram_component.numwords_b = 4096,
		altsyncram_component.operation_mode = "DUAL_PORT",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_b = "UNREGISTERED",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.ram_block_type = "M9K",
		altsyncram_component.widthad_a = 12,
		altsyncram_component.widthad_b = 12,
		altsyncram_component.width_a = 32,
		altsyncram_component.width_b = 32,
		altsyncram_component.width_byteena_a = 1;
endmodule