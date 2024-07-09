module ram_16x512_dp (
	address_a,
	address_b,
	byteena_a,
	byteena_b,
	clock_a,
	clock_b,
	data_a,
	data_b,
	enable_a,
	enable_b,
	wren_a,
	wren_b,
	q_a,
	q_b);
	input	[8:0]  address_a;
	input	[8:0]  address_b;
	input	[1:0]  byteena_a;
	input	[1:0]  byteena_b;
	input	  clock_a;
	input	  clock_b;
	input	[15:0]  data_a;
	input	[15:0]  data_b;
	input	  enable_a;
	input	  enable_b;
	input	  wren_a;
	input	  wren_b;
	output	[15:0]  q_a;
	output	[15:0]  q_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	[1:0]  byteena_a;
	tri1	[1:0]  byteena_b;
	tri1	  clock_a;
	tri1	  enable_a;
	tri1	  enable_b;
	tri0	  wren_a;
	tri0	  wren_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [15:0] sub_wire0;
	wire [15:0] sub_wire1;
	wire [15:0] q_a = sub_wire0[15:0];
	wire [15:0] q_b = sub_wire1[15:0];
	altsyncram	altsyncram_component (
				.address_a (address_a),
				.address_b (address_b),
				.byteena_a (byteena_a),
				.byteena_b (byteena_b),
				.clock0 (clock_a),
				.clock1 (clock_b),
				.clocken0 (enable_a),
				.clocken1 (enable_b),
				.data_a (data_a),
				.data_b (data_b),
				.wren_a (wren_a),
				.wren_b (wren_b),
				.q_a (sub_wire0),
				.q_b (sub_wire1),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.eccstatus (),
				.rden_a (1'b1),
				.rden_b (1'b1));
	defparam
		altsyncram_component.address_reg_b = "CLOCK1",
		altsyncram_component.byteena_reg_b = "CLOCK1",
		altsyncram_component.byte_size = 8,
		altsyncram_component.clock_enable_input_a = "NORMAL",
		altsyncram_component.clock_enable_input_b = "NORMAL",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.indata_reg_b = "CLOCK1",
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 512,
		altsyncram_component.numwords_b = 512,
		altsyncram_component.operation_mode = "BIDIR_DUAL_PORT",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.outdata_reg_b = "UNREGISTERED",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.read_during_write_mode_port_a = "NEW_DATA_NO_NBE_READ",
		altsyncram_component.read_during_write_mode_port_b = "NEW_DATA_NO_NBE_READ",
		altsyncram_component.widthad_a = 9,
		altsyncram_component.widthad_b = 9,
		altsyncram_component.width_a = 16,
		altsyncram_component.width_b = 16,
		altsyncram_component.width_byteena_a = 2,
		altsyncram_component.width_byteena_b = 2,
		altsyncram_component.wrcontrol_wraddress_reg_b = "CLOCK1";
endmodule