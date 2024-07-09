module RAMB16_S4_2_altera (
	clock,
	data,
	rdaddress,
	wraddress,
	wren,
	q);
	input	  clock;
	input	[3:0]  data;
	input	[11:0]  rdaddress;
	input	[11:0]  wraddress;
	input	  wren;
	output	[3:0]  q;
	parameter init_file = "";
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clock;
	tri0	  wren;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [3:0] sub_wire0;
	wire [3:0] q = sub_wire0[3:0];
	altsyncram	altsyncram_component (
				.address_a (wraddress),
				.clock0 (clock),
				.data_a (data),
				.wren_a (wren),
				.address_b (rdaddress),
				.q_b (sub_wire0),
				.aclr0 (1'b0),
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
				.data_b ({4{1'b1}}),
				.eccstatus (),
				.q_a (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_b = "NONE",
		altsyncram_component.address_reg_b = "CLOCK0",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_input_b = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.init_file = init_file,
		//altsyncram_component.init_file = "lr_latest_00.mif",
		altsyncram_component.intended_device_family = "Stratix IV",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 4096,
		altsyncram_component.numwords_b = 4096,
		altsyncram_component.operation_mode = "DUAL_PORT",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_b = "UNREGISTERED",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.read_during_write_mode_mixed_ports = "DONT_CARE",
		altsyncram_component.widthad_a = 12,
		altsyncram_component.widthad_b = 12,
		altsyncram_component.width_a = 4,
		altsyncram_component.width_b = 4,
		altsyncram_component.width_byteena_a = 1;
endmodule