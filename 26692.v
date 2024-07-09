module denise_colortable_ram_mf (
	byteena_a,
	clock,
	data,
	enable,
	rdaddress,
	wraddress,
	wren,
	q);
	input	[3:0]  byteena_a;
	input	  clock;
	input	[31:0]  data;
	input	  enable;
	input	[7:0]  rdaddress;
	input	[7:0]  wraddress;
	input	  wren;
	output	[31:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	[3:0]  byteena_a;
	tri1	  clock;
	tri1	  enable;
	tri0	  wren;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [31:0] sub_wire0;
	wire [31:0] q = sub_wire0[31:0];
	altsyncram	altsyncram_component (
				.address_a (wraddress),
				.byteena_a (byteena_a),
				.clock0 (clock),
				.data_a (data),
				.wren_a (wren),
				.address_b (rdaddress),
				.clocken0 (enable),
				.q_b (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_b (1'b1),
				.clock1 (1'b1),
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
		altsyncram_component.address_reg_b = "CLOCK0",
		altsyncram_component.byte_size = 8,
		altsyncram_component.clock_enable_input_a = "NORMAL",
		altsyncram_component.clock_enable_input_b = "NORMAL",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.intended_device_family = "Cyclone III",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 256,
		altsyncram_component.numwords_b = 256,
		altsyncram_component.operation_mode = "DUAL_PORT",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_b = "UNREGISTERED",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.read_during_write_mode_mixed_ports = "OLD_DATA",
		altsyncram_component.widthad_a = 8,
		altsyncram_component.widthad_b = 8,
		altsyncram_component.width_a = 32,
		altsyncram_component.width_b = 32,
		altsyncram_component.width_byteena_a = 4;
endmodule