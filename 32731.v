module RAMB16_S9_altera (
	address,
	clock,
	data,
	rden,
	wren,
	q);
	input	[10:0]  address;
	input	  clock;
	input	[7:0]  data;
	input	  rden;
	input	  wren;
	output	[7:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clock;
	tri1	  rden;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	parameter init_file = "";
	wire [7:0] sub_wire0;
	wire [7:0] q = sub_wire0[7:0];
	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.data_a (data),
				.wren_a (wren),
				.rden_a (rden),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_b (1'b1),
				.wren_b (1'b0));
	defparam
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = init_file,
		//altsyncram_component.init_file = "./sources_ngnp_multicore/src/bb_ram00.mif",
		altsyncram_component.intended_device_family = "Stratix IV",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 2048,
		altsyncram_component.operation_mode = "SINGLE_PORT",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.read_during_write_mode_port_a = "DONT_CARE",
		altsyncram_component.widthad_a = 11,
		altsyncram_component.width_a = 8,
		altsyncram_component.width_byteena_a = 1;
endmodule