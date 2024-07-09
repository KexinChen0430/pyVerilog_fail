module cyclone3_dmem (
	address,
	byteena,
	clken,
	clock,
	data,
	wren,
	q);
	input	[9:0]  address;
	input	[1:0]  byteena;
	input	  clken;
	input	  clock;
	input	[15:0]  data;
	input	  wren;
	output	[15:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	[1:0]  byteena;
	tri1	  clken;
	tri1	  clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [15:0] sub_wire0;
	wire [15:0] q = sub_wire0[15:0];
	altsyncram	altsyncram_component (
				.clocken0 (clken),
				.wren_a (wren),
				.clock0 (clock),
				.byteena_a (byteena),
				.address_a (address),
				.data_a (data),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_b (1'b0));
	defparam
		altsyncram_component.byte_size = 8,
		altsyncram_component.clock_enable_input_a = "NORMAL",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.intended_device_family = "Cyclone III",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1024,
		altsyncram_component.operation_mode = "SINGLE_PORT",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.read_during_write_mode_port_a = "NEW_DATA_NO_NBE_READ",
		altsyncram_component.widthad_a = 10,
		altsyncram_component.width_a = 16,
		altsyncram_component.width_byteena_a = 2;
endmodule