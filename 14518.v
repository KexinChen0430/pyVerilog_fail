module vga_ram (
	address_a,
	address_b,
	clock_a,
	clock_b,
	data_a,
	data_b,
	wren_a,
	wren_b,
	q_a,
	q_b);
	input	[11:0]  address_a;
	input	[11:0]  address_b;
	input	  clock_a;
	input	  clock_b;
	input	[7:0]  data_a;
	input	[7:0]  data_b;
	input	  wren_a;
	input	  wren_b;
	output	[7:0]  q_a;
	output	[7:0]  q_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clock_a;
	tri0	  wren_a;
	tri0	  wren_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [7:0] sub_wire0;
	wire [7:0] sub_wire1;
	wire [7:0] q_a = sub_wire0[7:0];
	wire [7:0] q_b = sub_wire1[7:0];
	altsyncram	altsyncram_component (
				.clock0 (clock_a),
				.wren_a (wren_a),
				.address_b (address_b),
				.clock1 (clock_b),
				.data_b (data_b),
				.wren_b (wren_b),
				.address_a (address_a),
				.data_a (data_a),
				.q_a (sub_wire0),
				.q_b (sub_wire1),
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
				.eccstatus (),
				.rden_a (1'b1),
				.rden_b (1'b1));
	defparam
		altsyncram_component.address_reg_b = "CLOCK1",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_input_b = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.indata_reg_b = "CLOCK1",
`ifdef NO_PLI
		altsyncram_component.init_file = "test_screen.rif"
`else
		altsyncram_component.init_file = "test_screen.hex"
`endif
,
		altsyncram_component.intended_device_family = "Cyclone II",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 4096,
		altsyncram_component.numwords_b = 4096,
		altsyncram_component.operation_mode = "BIDIR_DUAL_PORT",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.outdata_reg_b = "UNREGISTERED",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.widthad_a = 12,
		altsyncram_component.widthad_b = 12,
		altsyncram_component.width_a = 8,
		altsyncram_component.width_b = 8,
		altsyncram_component.width_byteena_a = 1,
		altsyncram_component.width_byteena_b = 1,
		altsyncram_component.wrcontrol_wraddress_reg_b = "CLOCK1";
endmodule