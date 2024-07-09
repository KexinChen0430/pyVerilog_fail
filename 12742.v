module rominout2 (
	address_a,
	address_b,
	clock,
	q_a,
	q_b);
	input	[8:0]  address_a;
	input	[8:0]  address_b;
	input	  clock;
	output	[31:0]  q_a;
	output	[31:0]  q_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire [31:0] sub_wire0;
	wire [31:0] sub_wire1;
	wire  sub_wire2 = 1'h0;
	wire [31:0] sub_wire3 = 32'h0;
	wire [31:0] q_b = sub_wire0[31:0];
	wire [31:0] q_a = sub_wire1[31:0];
	altsyncram	altsyncram_component (
				.clock0 (clock),
				.wren_a (sub_wire2),
				.address_b (address_b),
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
				.clock1 (),
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
		altsyncram_component.address_reg_b = "CLOCK0",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_input_b = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.clock_enable_output_b = "BYPASS",
		altsyncram_component.indata_reg_b = "CLOCK0",
		altsyncram_component.init_file = "./MIF/rominit.mif",
		altsyncram_component.intended_device_family = "Cyclone II",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 512,
		altsyncram_component.numwords_b = 512,
		altsyncram_component.operation_mode = "BIDIR_DUAL_PORT",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_a = "CLOCK0",
		altsyncram_component.outdata_reg_b = "CLOCK0",
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.widthad_a = 9,
		altsyncram_component.widthad_b = 9,
		altsyncram_component.width_a = 32,
		altsyncram_component.width_b = 32,
		altsyncram_component.width_byteena_a = 1,
		altsyncram_component.width_byteena_b = 1,
		altsyncram_component.wrcontrol_wraddress_reg_b = "CLOCK0";
endmodule