module g_ram (
	aclr,
	address_a,
	address_b,
	clock,
	data_a,
	data_b,
	rden_a,
	rden_b,
	wren_a,
	wren_b,
	q_a,
	q_b);
	input	  aclr;
	input	[8:0]  address_a;
	input	[8:0]  address_b;
	input	  clock;
	input	[31:0]  data_a;
	input	[31:0]  data_b;
	input	  rden_a;
	input	  rden_b;
	input	  wren_a;
	input	  wren_b;
	output	[31:0]  q_a;
	output	[31:0]  q_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
	tri1	  clock;
	tri1	  rden_a;
	tri1	  rden_b;
	tri0	  wren_a;
	tri0	  wren_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [31:0] sub_wire0;
	wire [31:0] sub_wire1;
	wire [31:0] q_a = sub_wire0[31:0];
	wire [31:0] q_b = sub_wire1[31:0];
	altsyncram	altsyncram_component (
				.aclr0 (aclr),
				.address_a (address_a),
				.address_b (address_b),
				.clock0 (clock),
				.data_a (data_a),
				.data_b (data_b),
				.rden_a (rden_a),
				.rden_b (rden_b),
				.wren_a (wren_a),
				.wren_b (wren_b),
				.q_a (sub_wire0),
				.q_b (sub_wire1),
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
				.eccstatus ());
	defparam
		altsyncram_component.address_reg_b = "CLOCK0",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_input_b = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.indata_reg_b = "CLOCK0",
/*
`ifdef MODEL_TECH
		altsyncram_component.init_file = "../sim/g_ram_test.hex",
`endif //MODEL_TECH
*/
		altsyncram_component.intended_device_family = "Arria V",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 512,
		altsyncram_component.numwords_b = 512,
		altsyncram_component.operation_mode = "BIDIR_DUAL_PORT",
		altsyncram_component.outdata_aclr_a = "CLEAR0",
		altsyncram_component.outdata_aclr_b = "CLEAR0",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.outdata_reg_b = "UNREGISTERED",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.read_during_write_mode_mixed_ports = "OLD_DATA",
		altsyncram_component.read_during_write_mode_port_a = "NEW_DATA_NO_NBE_READ",
		altsyncram_component.read_during_write_mode_port_b = "NEW_DATA_NO_NBE_READ",
		altsyncram_component.widthad_a = 9,
		altsyncram_component.widthad_b = 9,
		altsyncram_component.width_a = 32,
		altsyncram_component.width_b = 32,
		altsyncram_component.width_byteena_a = 1,
		altsyncram_component.width_byteena_b = 1,
		altsyncram_component.wrcontrol_wraddress_reg_b = "CLOCK0";
endmodule