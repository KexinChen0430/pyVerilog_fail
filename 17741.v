module FROM (
	address_a,
	address_b,
	clock_a,
	clock_b,
	q_a,
	q_b);
	input	[7:0]  address_a;
	input	[7:0]  address_b;
	input	  clock_a;
	input	  clock_b;
	output	[15:0]  q_a;
	output	[15:0]  q_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clock_a;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [15:0] sub_wire0;
	wire [15:0] sub_wire1;
	wire  sub_wire2 = 1'h0;
	wire [15:0] sub_wire3 = 16'h0;
	wire [15:0] q_b = sub_wire0[15:0];
	wire [15:0] q_a = sub_wire1[15:0];
	altsyncram	altsyncram_component (
				.clock0 (clock_a),
				.wren_a (sub_wire2),
				.address_b (address_b),
				.clock1 (clock_b),
				.data_b (sub_wire3),
				.wren_b (sub_wire2),
				.address_a (address_a),
				.data_a (sub_wire3),
				.q_b (sub_wire0),
				.q_a (sub_wire1)
				// synopsys translate_off
				,
				.aclr0 (),
				.aclr1 (),
				.addressstall_a (),
				.addressstall_b (),
				.byteena_a (),
				.byteena_b (),
				.clocken0 (),
				.clocken1 (),
				.clocken2 (),
				.clocken3 (),
				.eccstatus (),
				.rden_a (),
				.rden_b ()
				// synopsys translate_on
				);
	defparam
		altsyncram_component.address_reg_b = "CLOCK1",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_input_b = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.indata_reg_b = "CLOCK1",
		altsyncram_component.init_file = "FROM.mif",
		altsyncram_component.intended_device_family = "Cyclone IV E",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 256,
		altsyncram_component.numwords_b = 256,
		altsyncram_component.operation_mode = "BIDIR_DUAL_PORT",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.outdata_reg_b = "UNREGISTERED",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.widthad_a = 8,
		altsyncram_component.widthad_b = 8,
		altsyncram_component.width_a = 16,
		altsyncram_component.width_b = 16,
		altsyncram_component.width_byteena_a = 1,
		altsyncram_component.width_byteena_b = 1,
		altsyncram_component.wrcontrol_wraddress_reg_b = "CLOCK1";
endmodule