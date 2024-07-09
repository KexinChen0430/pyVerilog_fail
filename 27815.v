module rom16x2048 (
	address,
	clken,
	clock,
	q);
	input	[10:0]  address;
	input	  clken;
	input	  clock;
	output	[15:0]  q;
	wire [15:0] sub_wire0;
	wire [15:0] q = sub_wire0[15:0];
	altsyncram	altsyncram_component (
				.clocken0 (clken),
				.clock0 (clock),
				.address_a (address),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({16{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.clock_enable_input_a = "NORMAL",
		altsyncram_component.clock_enable_output_a = "BYPASS",
`ifdef OPENMSP430_SIMULATION
		altsyncram_component.init_file = "./pmem.mif",
`else
		altsyncram_component.init_file = "../../software/memledtest/memledtest.mif",
`endif
		altsyncram_component.intended_device_family = "Cyclone II",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=YES, INSTANCE_NAME=ROM",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 2048,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.ram_block_type = "M4K",
		altsyncram_component.widthad_a = 11,
		altsyncram_component.width_a = 16,
		altsyncram_component.width_byteena_a = 1;
endmodule