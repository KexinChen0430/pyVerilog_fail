module  RAM16_s36_s36_altera_altsyncram
	(
	aclr0,
	aclr1,
	address_a,
	address_b,
	clock0,
	clock1,
	data_a,
	data_b,
	q_a,
	q_b,
	wren_a,
	wren_b) /* synthesis synthesis_clearbox=1 */;
	input   aclr0;
	input   aclr1;
	input   [8:0]  address_a;
	input   [8:0]  address_b;
	input   clock0;
	input   clock1;
	input   [31:0]  data_a;
	input   [31:0]  data_b;
	output   [31:0]  q_a;
	output   [31:0]  q_b;
	input   wren_a;
	input   wren_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr0;
	tri0   aclr1;
	tri1   [8:0]  address_b;
	tri1   clock0;
	tri1   clock1;
	tri1   [31:0]  data_a;
	tri1   [31:0]  data_b;
	tri0   wren_a;
	tri0   wren_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  [0:0]   wire_ram_block1a_0portadataout;
	wire  [0:0]   wire_ram_block1a_1portadataout;
	wire  [0:0]   wire_ram_block1a_2portadataout;
	wire  [0:0]   wire_ram_block1a_3portadataout;
	wire  [0:0]   wire_ram_block1a_4portadataout;
	wire  [0:0]   wire_ram_block1a_5portadataout;
	wire  [0:0]   wire_ram_block1a_6portadataout;
	wire  [0:0]   wire_ram_block1a_7portadataout;
	wire  [0:0]   wire_ram_block1a_8portadataout;
	wire  [0:0]   wire_ram_block1a_9portadataout;
	wire  [0:0]   wire_ram_block1a_10portadataout;
	wire  [0:0]   wire_ram_block1a_11portadataout;
	wire  [0:0]   wire_ram_block1a_12portadataout;
	wire  [0:0]   wire_ram_block1a_13portadataout;
	wire  [0:0]   wire_ram_block1a_14portadataout;
	wire  [0:0]   wire_ram_block1a_15portadataout;
	wire  [0:0]   wire_ram_block1a_16portadataout;
	wire  [0:0]   wire_ram_block1a_17portadataout;
	wire  [0:0]   wire_ram_block1a_18portadataout;
	wire  [0:0]   wire_ram_block1a_19portadataout;
	wire  [0:0]   wire_ram_block1a_20portadataout;
	wire  [0:0]   wire_ram_block1a_21portadataout;
	wire  [0:0]   wire_ram_block1a_22portadataout;
	wire  [0:0]   wire_ram_block1a_23portadataout;
	wire  [0:0]   wire_ram_block1a_24portadataout;
	wire  [0:0]   wire_ram_block1a_25portadataout;
	wire  [0:0]   wire_ram_block1a_26portadataout;
	wire  [0:0]   wire_ram_block1a_27portadataout;
	wire  [0:0]   wire_ram_block1a_28portadataout;
	wire  [0:0]   wire_ram_block1a_29portadataout;
	wire  [0:0]   wire_ram_block1a_30portadataout;
	wire  [0:0]   wire_ram_block1a_31portadataout;
	wire  [0:0]   wire_ram_block1a_0portbdataout;
	wire  [0:0]   wire_ram_block1a_1portbdataout;
	wire  [0:0]   wire_ram_block1a_2portbdataout;
	wire  [0:0]   wire_ram_block1a_3portbdataout;
	wire  [0:0]   wire_ram_block1a_4portbdataout;
	wire  [0:0]   wire_ram_block1a_5portbdataout;
	wire  [0:0]   wire_ram_block1a_6portbdataout;
	wire  [0:0]   wire_ram_block1a_7portbdataout;
	wire  [0:0]   wire_ram_block1a_8portbdataout;
	wire  [0:0]   wire_ram_block1a_9portbdataout;
	wire  [0:0]   wire_ram_block1a_10portbdataout;
	wire  [0:0]   wire_ram_block1a_11portbdataout;
	wire  [0:0]   wire_ram_block1a_12portbdataout;
	wire  [0:0]   wire_ram_block1a_13portbdataout;
	wire  [0:0]   wire_ram_block1a_14portbdataout;
	wire  [0:0]   wire_ram_block1a_15portbdataout;
	wire  [0:0]   wire_ram_block1a_16portbdataout;
	wire  [0:0]   wire_ram_block1a_17portbdataout;
	wire  [0:0]   wire_ram_block1a_18portbdataout;
	wire  [0:0]   wire_ram_block1a_19portbdataout;
	wire  [0:0]   wire_ram_block1a_20portbdataout;
	wire  [0:0]   wire_ram_block1a_21portbdataout;
	wire  [0:0]   wire_ram_block1a_22portbdataout;
	wire  [0:0]   wire_ram_block1a_23portbdataout;
	wire  [0:0]   wire_ram_block1a_24portbdataout;
	wire  [0:0]   wire_ram_block1a_25portbdataout;
	wire  [0:0]   wire_ram_block1a_26portbdataout;
	wire  [0:0]   wire_ram_block1a_27portbdataout;
	wire  [0:0]   wire_ram_block1a_28portbdataout;
	wire  [0:0]   wire_ram_block1a_29portbdataout;
	wire  [0:0]   wire_ram_block1a_30portbdataout;
	wire  [0:0]   wire_ram_block1a_31portbdataout;
	wire  [8:0]  address_a_wire;
	wire  [8:0]  address_b_wire;
	stratixii_ram_block   ram_block1a_0
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[0]}),
	.portadataout(wire_ram_block1a_0portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[0]}),
	.portbdataout(wire_ram_block1a_0portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_0.connectivity_checking = "OFF",
		ram_block1a_0.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_0.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_0.operation_mode = "bidir_dual_port",
		ram_block1a_0.port_a_address_width = 9,
		ram_block1a_0.port_a_data_out_clear = "clear0",
		ram_block1a_0.port_a_data_out_clock = "clock0",
		ram_block1a_0.port_a_data_width = 1,
		ram_block1a_0.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_0.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_0.port_a_first_address = 0,
		ram_block1a_0.port_a_first_bit_number = 0,
		ram_block1a_0.port_a_last_address = 511,
		ram_block1a_0.port_a_logical_ram_depth = 512,
		ram_block1a_0.port_a_logical_ram_width = 32,
		ram_block1a_0.port_b_address_clock = "clock1",
		ram_block1a_0.port_b_address_width = 9,
		ram_block1a_0.port_b_data_in_clock = "clock1",
		ram_block1a_0.port_b_data_out_clear = "clear1",
		ram_block1a_0.port_b_data_out_clock = "clock1",
		ram_block1a_0.port_b_data_width = 1,
		ram_block1a_0.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_0.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_0.port_b_first_address = 0,
		ram_block1a_0.port_b_first_bit_number = 0,
		ram_block1a_0.port_b_last_address = 511,
		ram_block1a_0.port_b_logical_ram_depth = 512,
		ram_block1a_0.port_b_logical_ram_width = 32,
		ram_block1a_0.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_0.power_up_uninitialized = "false",
		ram_block1a_0.ram_block_type = "AUTO",
		ram_block1a_0.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_1
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[1]}),
	.portadataout(wire_ram_block1a_1portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[1]}),
	.portbdataout(wire_ram_block1a_1portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_1.connectivity_checking = "OFF",
		ram_block1a_1.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_1.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_1.operation_mode = "bidir_dual_port",
		ram_block1a_1.port_a_address_width = 9,
		ram_block1a_1.port_a_data_out_clear = "clear0",
		ram_block1a_1.port_a_data_out_clock = "clock0",
		ram_block1a_1.port_a_data_width = 1,
		ram_block1a_1.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_1.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_1.port_a_first_address = 0,
		ram_block1a_1.port_a_first_bit_number = 1,
		ram_block1a_1.port_a_last_address = 511,
		ram_block1a_1.port_a_logical_ram_depth = 512,
		ram_block1a_1.port_a_logical_ram_width = 32,
		ram_block1a_1.port_b_address_clock = "clock1",
		ram_block1a_1.port_b_address_width = 9,
		ram_block1a_1.port_b_data_in_clock = "clock1",
		ram_block1a_1.port_b_data_out_clear = "clear1",
		ram_block1a_1.port_b_data_out_clock = "clock1",
		ram_block1a_1.port_b_data_width = 1,
		ram_block1a_1.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_1.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_1.port_b_first_address = 0,
		ram_block1a_1.port_b_first_bit_number = 1,
		ram_block1a_1.port_b_last_address = 511,
		ram_block1a_1.port_b_logical_ram_depth = 512,
		ram_block1a_1.port_b_logical_ram_width = 32,
		ram_block1a_1.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_1.power_up_uninitialized = "false",
		ram_block1a_1.ram_block_type = "AUTO",
		ram_block1a_1.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_2
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[2]}),
	.portadataout(wire_ram_block1a_2portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[2]}),
	.portbdataout(wire_ram_block1a_2portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_2.connectivity_checking = "OFF",
		ram_block1a_2.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_2.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_2.operation_mode = "bidir_dual_port",
		ram_block1a_2.port_a_address_width = 9,
		ram_block1a_2.port_a_data_out_clear = "clear0",
		ram_block1a_2.port_a_data_out_clock = "clock0",
		ram_block1a_2.port_a_data_width = 1,
		ram_block1a_2.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_2.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_2.port_a_first_address = 0,
		ram_block1a_2.port_a_first_bit_number = 2,
		ram_block1a_2.port_a_last_address = 511,
		ram_block1a_2.port_a_logical_ram_depth = 512,
		ram_block1a_2.port_a_logical_ram_width = 32,
		ram_block1a_2.port_b_address_clock = "clock1",
		ram_block1a_2.port_b_address_width = 9,
		ram_block1a_2.port_b_data_in_clock = "clock1",
		ram_block1a_2.port_b_data_out_clear = "clear1",
		ram_block1a_2.port_b_data_out_clock = "clock1",
		ram_block1a_2.port_b_data_width = 1,
		ram_block1a_2.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_2.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_2.port_b_first_address = 0,
		ram_block1a_2.port_b_first_bit_number = 2,
		ram_block1a_2.port_b_last_address = 511,
		ram_block1a_2.port_b_logical_ram_depth = 512,
		ram_block1a_2.port_b_logical_ram_width = 32,
		ram_block1a_2.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_2.power_up_uninitialized = "false",
		ram_block1a_2.ram_block_type = "AUTO",
		ram_block1a_2.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_3
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[3]}),
	.portadataout(wire_ram_block1a_3portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[3]}),
	.portbdataout(wire_ram_block1a_3portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_3.connectivity_checking = "OFF",
		ram_block1a_3.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_3.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_3.operation_mode = "bidir_dual_port",
		ram_block1a_3.port_a_address_width = 9,
		ram_block1a_3.port_a_data_out_clear = "clear0",
		ram_block1a_3.port_a_data_out_clock = "clock0",
		ram_block1a_3.port_a_data_width = 1,
		ram_block1a_3.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_3.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_3.port_a_first_address = 0,
		ram_block1a_3.port_a_first_bit_number = 3,
		ram_block1a_3.port_a_last_address = 511,
		ram_block1a_3.port_a_logical_ram_depth = 512,
		ram_block1a_3.port_a_logical_ram_width = 32,
		ram_block1a_3.port_b_address_clock = "clock1",
		ram_block1a_3.port_b_address_width = 9,
		ram_block1a_3.port_b_data_in_clock = "clock1",
		ram_block1a_3.port_b_data_out_clear = "clear1",
		ram_block1a_3.port_b_data_out_clock = "clock1",
		ram_block1a_3.port_b_data_width = 1,
		ram_block1a_3.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_3.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_3.port_b_first_address = 0,
		ram_block1a_3.port_b_first_bit_number = 3,
		ram_block1a_3.port_b_last_address = 511,
		ram_block1a_3.port_b_logical_ram_depth = 512,
		ram_block1a_3.port_b_logical_ram_width = 32,
		ram_block1a_3.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_3.power_up_uninitialized = "false",
		ram_block1a_3.ram_block_type = "AUTO",
		ram_block1a_3.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_4
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[4]}),
	.portadataout(wire_ram_block1a_4portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[4]}),
	.portbdataout(wire_ram_block1a_4portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_4.connectivity_checking = "OFF",
		ram_block1a_4.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_4.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_4.operation_mode = "bidir_dual_port",
		ram_block1a_4.port_a_address_width = 9,
		ram_block1a_4.port_a_data_out_clear = "clear0",
		ram_block1a_4.port_a_data_out_clock = "clock0",
		ram_block1a_4.port_a_data_width = 1,
		ram_block1a_4.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_4.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_4.port_a_first_address = 0,
		ram_block1a_4.port_a_first_bit_number = 4,
		ram_block1a_4.port_a_last_address = 511,
		ram_block1a_4.port_a_logical_ram_depth = 512,
		ram_block1a_4.port_a_logical_ram_width = 32,
		ram_block1a_4.port_b_address_clock = "clock1",
		ram_block1a_4.port_b_address_width = 9,
		ram_block1a_4.port_b_data_in_clock = "clock1",
		ram_block1a_4.port_b_data_out_clear = "clear1",
		ram_block1a_4.port_b_data_out_clock = "clock1",
		ram_block1a_4.port_b_data_width = 1,
		ram_block1a_4.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_4.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_4.port_b_first_address = 0,
		ram_block1a_4.port_b_first_bit_number = 4,
		ram_block1a_4.port_b_last_address = 511,
		ram_block1a_4.port_b_logical_ram_depth = 512,
		ram_block1a_4.port_b_logical_ram_width = 32,
		ram_block1a_4.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_4.power_up_uninitialized = "false",
		ram_block1a_4.ram_block_type = "AUTO",
		ram_block1a_4.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_5
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[5]}),
	.portadataout(wire_ram_block1a_5portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[5]}),
	.portbdataout(wire_ram_block1a_5portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_5.connectivity_checking = "OFF",
		ram_block1a_5.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_5.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_5.operation_mode = "bidir_dual_port",
		ram_block1a_5.port_a_address_width = 9,
		ram_block1a_5.port_a_data_out_clear = "clear0",
		ram_block1a_5.port_a_data_out_clock = "clock0",
		ram_block1a_5.port_a_data_width = 1,
		ram_block1a_5.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_5.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_5.port_a_first_address = 0,
		ram_block1a_5.port_a_first_bit_number = 5,
		ram_block1a_5.port_a_last_address = 511,
		ram_block1a_5.port_a_logical_ram_depth = 512,
		ram_block1a_5.port_a_logical_ram_width = 32,
		ram_block1a_5.port_b_address_clock = "clock1",
		ram_block1a_5.port_b_address_width = 9,
		ram_block1a_5.port_b_data_in_clock = "clock1",
		ram_block1a_5.port_b_data_out_clear = "clear1",
		ram_block1a_5.port_b_data_out_clock = "clock1",
		ram_block1a_5.port_b_data_width = 1,
		ram_block1a_5.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_5.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_5.port_b_first_address = 0,
		ram_block1a_5.port_b_first_bit_number = 5,
		ram_block1a_5.port_b_last_address = 511,
		ram_block1a_5.port_b_logical_ram_depth = 512,
		ram_block1a_5.port_b_logical_ram_width = 32,
		ram_block1a_5.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_5.power_up_uninitialized = "false",
		ram_block1a_5.ram_block_type = "AUTO",
		ram_block1a_5.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_6
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[6]}),
	.portadataout(wire_ram_block1a_6portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[6]}),
	.portbdataout(wire_ram_block1a_6portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_6.connectivity_checking = "OFF",
		ram_block1a_6.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_6.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_6.operation_mode = "bidir_dual_port",
		ram_block1a_6.port_a_address_width = 9,
		ram_block1a_6.port_a_data_out_clear = "clear0",
		ram_block1a_6.port_a_data_out_clock = "clock0",
		ram_block1a_6.port_a_data_width = 1,
		ram_block1a_6.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_6.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_6.port_a_first_address = 0,
		ram_block1a_6.port_a_first_bit_number = 6,
		ram_block1a_6.port_a_last_address = 511,
		ram_block1a_6.port_a_logical_ram_depth = 512,
		ram_block1a_6.port_a_logical_ram_width = 32,
		ram_block1a_6.port_b_address_clock = "clock1",
		ram_block1a_6.port_b_address_width = 9,
		ram_block1a_6.port_b_data_in_clock = "clock1",
		ram_block1a_6.port_b_data_out_clear = "clear1",
		ram_block1a_6.port_b_data_out_clock = "clock1",
		ram_block1a_6.port_b_data_width = 1,
		ram_block1a_6.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_6.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_6.port_b_first_address = 0,
		ram_block1a_6.port_b_first_bit_number = 6,
		ram_block1a_6.port_b_last_address = 511,
		ram_block1a_6.port_b_logical_ram_depth = 512,
		ram_block1a_6.port_b_logical_ram_width = 32,
		ram_block1a_6.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_6.power_up_uninitialized = "false",
		ram_block1a_6.ram_block_type = "AUTO",
		ram_block1a_6.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_7
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[7]}),
	.portadataout(wire_ram_block1a_7portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[7]}),
	.portbdataout(wire_ram_block1a_7portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_7.connectivity_checking = "OFF",
		ram_block1a_7.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_7.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_7.operation_mode = "bidir_dual_port",
		ram_block1a_7.port_a_address_width = 9,
		ram_block1a_7.port_a_data_out_clear = "clear0",
		ram_block1a_7.port_a_data_out_clock = "clock0",
		ram_block1a_7.port_a_data_width = 1,
		ram_block1a_7.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_7.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_7.port_a_first_address = 0,
		ram_block1a_7.port_a_first_bit_number = 7,
		ram_block1a_7.port_a_last_address = 511,
		ram_block1a_7.port_a_logical_ram_depth = 512,
		ram_block1a_7.port_a_logical_ram_width = 32,
		ram_block1a_7.port_b_address_clock = "clock1",
		ram_block1a_7.port_b_address_width = 9,
		ram_block1a_7.port_b_data_in_clock = "clock1",
		ram_block1a_7.port_b_data_out_clear = "clear1",
		ram_block1a_7.port_b_data_out_clock = "clock1",
		ram_block1a_7.port_b_data_width = 1,
		ram_block1a_7.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_7.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_7.port_b_first_address = 0,
		ram_block1a_7.port_b_first_bit_number = 7,
		ram_block1a_7.port_b_last_address = 511,
		ram_block1a_7.port_b_logical_ram_depth = 512,
		ram_block1a_7.port_b_logical_ram_width = 32,
		ram_block1a_7.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_7.power_up_uninitialized = "false",
		ram_block1a_7.ram_block_type = "AUTO",
		ram_block1a_7.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_8
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[8]}),
	.portadataout(wire_ram_block1a_8portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[8]}),
	.portbdataout(wire_ram_block1a_8portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_8.connectivity_checking = "OFF",
		ram_block1a_8.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_8.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_8.operation_mode = "bidir_dual_port",
		ram_block1a_8.port_a_address_width = 9,
		ram_block1a_8.port_a_data_out_clear = "clear0",
		ram_block1a_8.port_a_data_out_clock = "clock0",
		ram_block1a_8.port_a_data_width = 1,
		ram_block1a_8.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_8.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_8.port_a_first_address = 0,
		ram_block1a_8.port_a_first_bit_number = 8,
		ram_block1a_8.port_a_last_address = 511,
		ram_block1a_8.port_a_logical_ram_depth = 512,
		ram_block1a_8.port_a_logical_ram_width = 32,
		ram_block1a_8.port_b_address_clock = "clock1",
		ram_block1a_8.port_b_address_width = 9,
		ram_block1a_8.port_b_data_in_clock = "clock1",
		ram_block1a_8.port_b_data_out_clear = "clear1",
		ram_block1a_8.port_b_data_out_clock = "clock1",
		ram_block1a_8.port_b_data_width = 1,
		ram_block1a_8.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_8.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_8.port_b_first_address = 0,
		ram_block1a_8.port_b_first_bit_number = 8,
		ram_block1a_8.port_b_last_address = 511,
		ram_block1a_8.port_b_logical_ram_depth = 512,
		ram_block1a_8.port_b_logical_ram_width = 32,
		ram_block1a_8.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_8.power_up_uninitialized = "false",
		ram_block1a_8.ram_block_type = "AUTO",
		ram_block1a_8.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_9
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[9]}),
	.portadataout(wire_ram_block1a_9portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[9]}),
	.portbdataout(wire_ram_block1a_9portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_9.connectivity_checking = "OFF",
		ram_block1a_9.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_9.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_9.operation_mode = "bidir_dual_port",
		ram_block1a_9.port_a_address_width = 9,
		ram_block1a_9.port_a_data_out_clear = "clear0",
		ram_block1a_9.port_a_data_out_clock = "clock0",
		ram_block1a_9.port_a_data_width = 1,
		ram_block1a_9.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_9.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_9.port_a_first_address = 0,
		ram_block1a_9.port_a_first_bit_number = 9,
		ram_block1a_9.port_a_last_address = 511,
		ram_block1a_9.port_a_logical_ram_depth = 512,
		ram_block1a_9.port_a_logical_ram_width = 32,
		ram_block1a_9.port_b_address_clock = "clock1",
		ram_block1a_9.port_b_address_width = 9,
		ram_block1a_9.port_b_data_in_clock = "clock1",
		ram_block1a_9.port_b_data_out_clear = "clear1",
		ram_block1a_9.port_b_data_out_clock = "clock1",
		ram_block1a_9.port_b_data_width = 1,
		ram_block1a_9.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_9.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_9.port_b_first_address = 0,
		ram_block1a_9.port_b_first_bit_number = 9,
		ram_block1a_9.port_b_last_address = 511,
		ram_block1a_9.port_b_logical_ram_depth = 512,
		ram_block1a_9.port_b_logical_ram_width = 32,
		ram_block1a_9.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_9.power_up_uninitialized = "false",
		ram_block1a_9.ram_block_type = "AUTO",
		ram_block1a_9.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_10
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[10]}),
	.portadataout(wire_ram_block1a_10portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[10]}),
	.portbdataout(wire_ram_block1a_10portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_10.connectivity_checking = "OFF",
		ram_block1a_10.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_10.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_10.operation_mode = "bidir_dual_port",
		ram_block1a_10.port_a_address_width = 9,
		ram_block1a_10.port_a_data_out_clear = "clear0",
		ram_block1a_10.port_a_data_out_clock = "clock0",
		ram_block1a_10.port_a_data_width = 1,
		ram_block1a_10.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_10.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_10.port_a_first_address = 0,
		ram_block1a_10.port_a_first_bit_number = 10,
		ram_block1a_10.port_a_last_address = 511,
		ram_block1a_10.port_a_logical_ram_depth = 512,
		ram_block1a_10.port_a_logical_ram_width = 32,
		ram_block1a_10.port_b_address_clock = "clock1",
		ram_block1a_10.port_b_address_width = 9,
		ram_block1a_10.port_b_data_in_clock = "clock1",
		ram_block1a_10.port_b_data_out_clear = "clear1",
		ram_block1a_10.port_b_data_out_clock = "clock1",
		ram_block1a_10.port_b_data_width = 1,
		ram_block1a_10.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_10.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_10.port_b_first_address = 0,
		ram_block1a_10.port_b_first_bit_number = 10,
		ram_block1a_10.port_b_last_address = 511,
		ram_block1a_10.port_b_logical_ram_depth = 512,
		ram_block1a_10.port_b_logical_ram_width = 32,
		ram_block1a_10.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_10.power_up_uninitialized = "false",
		ram_block1a_10.ram_block_type = "AUTO",
		ram_block1a_10.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_11
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[11]}),
	.portadataout(wire_ram_block1a_11portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[11]}),
	.portbdataout(wire_ram_block1a_11portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_11.connectivity_checking = "OFF",
		ram_block1a_11.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_11.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_11.operation_mode = "bidir_dual_port",
		ram_block1a_11.port_a_address_width = 9,
		ram_block1a_11.port_a_data_out_clear = "clear0",
		ram_block1a_11.port_a_data_out_clock = "clock0",
		ram_block1a_11.port_a_data_width = 1,
		ram_block1a_11.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_11.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_11.port_a_first_address = 0,
		ram_block1a_11.port_a_first_bit_number = 11,
		ram_block1a_11.port_a_last_address = 511,
		ram_block1a_11.port_a_logical_ram_depth = 512,
		ram_block1a_11.port_a_logical_ram_width = 32,
		ram_block1a_11.port_b_address_clock = "clock1",
		ram_block1a_11.port_b_address_width = 9,
		ram_block1a_11.port_b_data_in_clock = "clock1",
		ram_block1a_11.port_b_data_out_clear = "clear1",
		ram_block1a_11.port_b_data_out_clock = "clock1",
		ram_block1a_11.port_b_data_width = 1,
		ram_block1a_11.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_11.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_11.port_b_first_address = 0,
		ram_block1a_11.port_b_first_bit_number = 11,
		ram_block1a_11.port_b_last_address = 511,
		ram_block1a_11.port_b_logical_ram_depth = 512,
		ram_block1a_11.port_b_logical_ram_width = 32,
		ram_block1a_11.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_11.power_up_uninitialized = "false",
		ram_block1a_11.ram_block_type = "AUTO",
		ram_block1a_11.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_12
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[12]}),
	.portadataout(wire_ram_block1a_12portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[12]}),
	.portbdataout(wire_ram_block1a_12portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_12.connectivity_checking = "OFF",
		ram_block1a_12.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_12.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_12.operation_mode = "bidir_dual_port",
		ram_block1a_12.port_a_address_width = 9,
		ram_block1a_12.port_a_data_out_clear = "clear0",
		ram_block1a_12.port_a_data_out_clock = "clock0",
		ram_block1a_12.port_a_data_width = 1,
		ram_block1a_12.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_12.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_12.port_a_first_address = 0,
		ram_block1a_12.port_a_first_bit_number = 12,
		ram_block1a_12.port_a_last_address = 511,
		ram_block1a_12.port_a_logical_ram_depth = 512,
		ram_block1a_12.port_a_logical_ram_width = 32,
		ram_block1a_12.port_b_address_clock = "clock1",
		ram_block1a_12.port_b_address_width = 9,
		ram_block1a_12.port_b_data_in_clock = "clock1",
		ram_block1a_12.port_b_data_out_clear = "clear1",
		ram_block1a_12.port_b_data_out_clock = "clock1",
		ram_block1a_12.port_b_data_width = 1,
		ram_block1a_12.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_12.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_12.port_b_first_address = 0,
		ram_block1a_12.port_b_first_bit_number = 12,
		ram_block1a_12.port_b_last_address = 511,
		ram_block1a_12.port_b_logical_ram_depth = 512,
		ram_block1a_12.port_b_logical_ram_width = 32,
		ram_block1a_12.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_12.power_up_uninitialized = "false",
		ram_block1a_12.ram_block_type = "AUTO",
		ram_block1a_12.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_13
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[13]}),
	.portadataout(wire_ram_block1a_13portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[13]}),
	.portbdataout(wire_ram_block1a_13portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_13.connectivity_checking = "OFF",
		ram_block1a_13.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_13.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_13.operation_mode = "bidir_dual_port",
		ram_block1a_13.port_a_address_width = 9,
		ram_block1a_13.port_a_data_out_clear = "clear0",
		ram_block1a_13.port_a_data_out_clock = "clock0",
		ram_block1a_13.port_a_data_width = 1,
		ram_block1a_13.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_13.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_13.port_a_first_address = 0,
		ram_block1a_13.port_a_first_bit_number = 13,
		ram_block1a_13.port_a_last_address = 511,
		ram_block1a_13.port_a_logical_ram_depth = 512,
		ram_block1a_13.port_a_logical_ram_width = 32,
		ram_block1a_13.port_b_address_clock = "clock1",
		ram_block1a_13.port_b_address_width = 9,
		ram_block1a_13.port_b_data_in_clock = "clock1",
		ram_block1a_13.port_b_data_out_clear = "clear1",
		ram_block1a_13.port_b_data_out_clock = "clock1",
		ram_block1a_13.port_b_data_width = 1,
		ram_block1a_13.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_13.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_13.port_b_first_address = 0,
		ram_block1a_13.port_b_first_bit_number = 13,
		ram_block1a_13.port_b_last_address = 511,
		ram_block1a_13.port_b_logical_ram_depth = 512,
		ram_block1a_13.port_b_logical_ram_width = 32,
		ram_block1a_13.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_13.power_up_uninitialized = "false",
		ram_block1a_13.ram_block_type = "AUTO",
		ram_block1a_13.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_14
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[14]}),
	.portadataout(wire_ram_block1a_14portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[14]}),
	.portbdataout(wire_ram_block1a_14portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_14.connectivity_checking = "OFF",
		ram_block1a_14.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_14.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_14.operation_mode = "bidir_dual_port",
		ram_block1a_14.port_a_address_width = 9,
		ram_block1a_14.port_a_data_out_clear = "clear0",
		ram_block1a_14.port_a_data_out_clock = "clock0",
		ram_block1a_14.port_a_data_width = 1,
		ram_block1a_14.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_14.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_14.port_a_first_address = 0,
		ram_block1a_14.port_a_first_bit_number = 14,
		ram_block1a_14.port_a_last_address = 511,
		ram_block1a_14.port_a_logical_ram_depth = 512,
		ram_block1a_14.port_a_logical_ram_width = 32,
		ram_block1a_14.port_b_address_clock = "clock1",
		ram_block1a_14.port_b_address_width = 9,
		ram_block1a_14.port_b_data_in_clock = "clock1",
		ram_block1a_14.port_b_data_out_clear = "clear1",
		ram_block1a_14.port_b_data_out_clock = "clock1",
		ram_block1a_14.port_b_data_width = 1,
		ram_block1a_14.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_14.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_14.port_b_first_address = 0,
		ram_block1a_14.port_b_first_bit_number = 14,
		ram_block1a_14.port_b_last_address = 511,
		ram_block1a_14.port_b_logical_ram_depth = 512,
		ram_block1a_14.port_b_logical_ram_width = 32,
		ram_block1a_14.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_14.power_up_uninitialized = "false",
		ram_block1a_14.ram_block_type = "AUTO",
		ram_block1a_14.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_15
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[15]}),
	.portadataout(wire_ram_block1a_15portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[15]}),
	.portbdataout(wire_ram_block1a_15portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_15.connectivity_checking = "OFF",
		ram_block1a_15.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_15.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_15.operation_mode = "bidir_dual_port",
		ram_block1a_15.port_a_address_width = 9,
		ram_block1a_15.port_a_data_out_clear = "clear0",
		ram_block1a_15.port_a_data_out_clock = "clock0",
		ram_block1a_15.port_a_data_width = 1,
		ram_block1a_15.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_15.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_15.port_a_first_address = 0,
		ram_block1a_15.port_a_first_bit_number = 15,
		ram_block1a_15.port_a_last_address = 511,
		ram_block1a_15.port_a_logical_ram_depth = 512,
		ram_block1a_15.port_a_logical_ram_width = 32,
		ram_block1a_15.port_b_address_clock = "clock1",
		ram_block1a_15.port_b_address_width = 9,
		ram_block1a_15.port_b_data_in_clock = "clock1",
		ram_block1a_15.port_b_data_out_clear = "clear1",
		ram_block1a_15.port_b_data_out_clock = "clock1",
		ram_block1a_15.port_b_data_width = 1,
		ram_block1a_15.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_15.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_15.port_b_first_address = 0,
		ram_block1a_15.port_b_first_bit_number = 15,
		ram_block1a_15.port_b_last_address = 511,
		ram_block1a_15.port_b_logical_ram_depth = 512,
		ram_block1a_15.port_b_logical_ram_width = 32,
		ram_block1a_15.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_15.power_up_uninitialized = "false",
		ram_block1a_15.ram_block_type = "AUTO",
		ram_block1a_15.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_16
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[16]}),
	.portadataout(wire_ram_block1a_16portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[16]}),
	.portbdataout(wire_ram_block1a_16portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_16.connectivity_checking = "OFF",
		ram_block1a_16.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_16.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_16.operation_mode = "bidir_dual_port",
		ram_block1a_16.port_a_address_width = 9,
		ram_block1a_16.port_a_data_out_clear = "clear0",
		ram_block1a_16.port_a_data_out_clock = "clock0",
		ram_block1a_16.port_a_data_width = 1,
		ram_block1a_16.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_16.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_16.port_a_first_address = 0,
		ram_block1a_16.port_a_first_bit_number = 16,
		ram_block1a_16.port_a_last_address = 511,
		ram_block1a_16.port_a_logical_ram_depth = 512,
		ram_block1a_16.port_a_logical_ram_width = 32,
		ram_block1a_16.port_b_address_clock = "clock1",
		ram_block1a_16.port_b_address_width = 9,
		ram_block1a_16.port_b_data_in_clock = "clock1",
		ram_block1a_16.port_b_data_out_clear = "clear1",
		ram_block1a_16.port_b_data_out_clock = "clock1",
		ram_block1a_16.port_b_data_width = 1,
		ram_block1a_16.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_16.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_16.port_b_first_address = 0,
		ram_block1a_16.port_b_first_bit_number = 16,
		ram_block1a_16.port_b_last_address = 511,
		ram_block1a_16.port_b_logical_ram_depth = 512,
		ram_block1a_16.port_b_logical_ram_width = 32,
		ram_block1a_16.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_16.power_up_uninitialized = "false",
		ram_block1a_16.ram_block_type = "AUTO",
		ram_block1a_16.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_17
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[17]}),
	.portadataout(wire_ram_block1a_17portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[17]}),
	.portbdataout(wire_ram_block1a_17portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_17.connectivity_checking = "OFF",
		ram_block1a_17.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_17.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_17.operation_mode = "bidir_dual_port",
		ram_block1a_17.port_a_address_width = 9,
		ram_block1a_17.port_a_data_out_clear = "clear0",
		ram_block1a_17.port_a_data_out_clock = "clock0",
		ram_block1a_17.port_a_data_width = 1,
		ram_block1a_17.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_17.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_17.port_a_first_address = 0,
		ram_block1a_17.port_a_first_bit_number = 17,
		ram_block1a_17.port_a_last_address = 511,
		ram_block1a_17.port_a_logical_ram_depth = 512,
		ram_block1a_17.port_a_logical_ram_width = 32,
		ram_block1a_17.port_b_address_clock = "clock1",
		ram_block1a_17.port_b_address_width = 9,
		ram_block1a_17.port_b_data_in_clock = "clock1",
		ram_block1a_17.port_b_data_out_clear = "clear1",
		ram_block1a_17.port_b_data_out_clock = "clock1",
		ram_block1a_17.port_b_data_width = 1,
		ram_block1a_17.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_17.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_17.port_b_first_address = 0,
		ram_block1a_17.port_b_first_bit_number = 17,
		ram_block1a_17.port_b_last_address = 511,
		ram_block1a_17.port_b_logical_ram_depth = 512,
		ram_block1a_17.port_b_logical_ram_width = 32,
		ram_block1a_17.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_17.power_up_uninitialized = "false",
		ram_block1a_17.ram_block_type = "AUTO",
		ram_block1a_17.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_18
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[18]}),
	.portadataout(wire_ram_block1a_18portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[18]}),
	.portbdataout(wire_ram_block1a_18portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_18.connectivity_checking = "OFF",
		ram_block1a_18.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_18.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_18.operation_mode = "bidir_dual_port",
		ram_block1a_18.port_a_address_width = 9,
		ram_block1a_18.port_a_data_out_clear = "clear0",
		ram_block1a_18.port_a_data_out_clock = "clock0",
		ram_block1a_18.port_a_data_width = 1,
		ram_block1a_18.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_18.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_18.port_a_first_address = 0,
		ram_block1a_18.port_a_first_bit_number = 18,
		ram_block1a_18.port_a_last_address = 511,
		ram_block1a_18.port_a_logical_ram_depth = 512,
		ram_block1a_18.port_a_logical_ram_width = 32,
		ram_block1a_18.port_b_address_clock = "clock1",
		ram_block1a_18.port_b_address_width = 9,
		ram_block1a_18.port_b_data_in_clock = "clock1",
		ram_block1a_18.port_b_data_out_clear = "clear1",
		ram_block1a_18.port_b_data_out_clock = "clock1",
		ram_block1a_18.port_b_data_width = 1,
		ram_block1a_18.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_18.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_18.port_b_first_address = 0,
		ram_block1a_18.port_b_first_bit_number = 18,
		ram_block1a_18.port_b_last_address = 511,
		ram_block1a_18.port_b_logical_ram_depth = 512,
		ram_block1a_18.port_b_logical_ram_width = 32,
		ram_block1a_18.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_18.power_up_uninitialized = "false",
		ram_block1a_18.ram_block_type = "AUTO",
		ram_block1a_18.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_19
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[19]}),
	.portadataout(wire_ram_block1a_19portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[19]}),
	.portbdataout(wire_ram_block1a_19portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_19.connectivity_checking = "OFF",
		ram_block1a_19.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_19.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_19.operation_mode = "bidir_dual_port",
		ram_block1a_19.port_a_address_width = 9,
		ram_block1a_19.port_a_data_out_clear = "clear0",
		ram_block1a_19.port_a_data_out_clock = "clock0",
		ram_block1a_19.port_a_data_width = 1,
		ram_block1a_19.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_19.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_19.port_a_first_address = 0,
		ram_block1a_19.port_a_first_bit_number = 19,
		ram_block1a_19.port_a_last_address = 511,
		ram_block1a_19.port_a_logical_ram_depth = 512,
		ram_block1a_19.port_a_logical_ram_width = 32,
		ram_block1a_19.port_b_address_clock = "clock1",
		ram_block1a_19.port_b_address_width = 9,
		ram_block1a_19.port_b_data_in_clock = "clock1",
		ram_block1a_19.port_b_data_out_clear = "clear1",
		ram_block1a_19.port_b_data_out_clock = "clock1",
		ram_block1a_19.port_b_data_width = 1,
		ram_block1a_19.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_19.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_19.port_b_first_address = 0,
		ram_block1a_19.port_b_first_bit_number = 19,
		ram_block1a_19.port_b_last_address = 511,
		ram_block1a_19.port_b_logical_ram_depth = 512,
		ram_block1a_19.port_b_logical_ram_width = 32,
		ram_block1a_19.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_19.power_up_uninitialized = "false",
		ram_block1a_19.ram_block_type = "AUTO",
		ram_block1a_19.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_20
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[20]}),
	.portadataout(wire_ram_block1a_20portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[20]}),
	.portbdataout(wire_ram_block1a_20portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_20.connectivity_checking = "OFF",
		ram_block1a_20.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_20.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_20.operation_mode = "bidir_dual_port",
		ram_block1a_20.port_a_address_width = 9,
		ram_block1a_20.port_a_data_out_clear = "clear0",
		ram_block1a_20.port_a_data_out_clock = "clock0",
		ram_block1a_20.port_a_data_width = 1,
		ram_block1a_20.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_20.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_20.port_a_first_address = 0,
		ram_block1a_20.port_a_first_bit_number = 20,
		ram_block1a_20.port_a_last_address = 511,
		ram_block1a_20.port_a_logical_ram_depth = 512,
		ram_block1a_20.port_a_logical_ram_width = 32,
		ram_block1a_20.port_b_address_clock = "clock1",
		ram_block1a_20.port_b_address_width = 9,
		ram_block1a_20.port_b_data_in_clock = "clock1",
		ram_block1a_20.port_b_data_out_clear = "clear1",
		ram_block1a_20.port_b_data_out_clock = "clock1",
		ram_block1a_20.port_b_data_width = 1,
		ram_block1a_20.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_20.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_20.port_b_first_address = 0,
		ram_block1a_20.port_b_first_bit_number = 20,
		ram_block1a_20.port_b_last_address = 511,
		ram_block1a_20.port_b_logical_ram_depth = 512,
		ram_block1a_20.port_b_logical_ram_width = 32,
		ram_block1a_20.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_20.power_up_uninitialized = "false",
		ram_block1a_20.ram_block_type = "AUTO",
		ram_block1a_20.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_21
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[21]}),
	.portadataout(wire_ram_block1a_21portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[21]}),
	.portbdataout(wire_ram_block1a_21portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_21.connectivity_checking = "OFF",
		ram_block1a_21.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_21.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_21.operation_mode = "bidir_dual_port",
		ram_block1a_21.port_a_address_width = 9,
		ram_block1a_21.port_a_data_out_clear = "clear0",
		ram_block1a_21.port_a_data_out_clock = "clock0",
		ram_block1a_21.port_a_data_width = 1,
		ram_block1a_21.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_21.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_21.port_a_first_address = 0,
		ram_block1a_21.port_a_first_bit_number = 21,
		ram_block1a_21.port_a_last_address = 511,
		ram_block1a_21.port_a_logical_ram_depth = 512,
		ram_block1a_21.port_a_logical_ram_width = 32,
		ram_block1a_21.port_b_address_clock = "clock1",
		ram_block1a_21.port_b_address_width = 9,
		ram_block1a_21.port_b_data_in_clock = "clock1",
		ram_block1a_21.port_b_data_out_clear = "clear1",
		ram_block1a_21.port_b_data_out_clock = "clock1",
		ram_block1a_21.port_b_data_width = 1,
		ram_block1a_21.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_21.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_21.port_b_first_address = 0,
		ram_block1a_21.port_b_first_bit_number = 21,
		ram_block1a_21.port_b_last_address = 511,
		ram_block1a_21.port_b_logical_ram_depth = 512,
		ram_block1a_21.port_b_logical_ram_width = 32,
		ram_block1a_21.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_21.power_up_uninitialized = "false",
		ram_block1a_21.ram_block_type = "AUTO",
		ram_block1a_21.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_22
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[22]}),
	.portadataout(wire_ram_block1a_22portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[22]}),
	.portbdataout(wire_ram_block1a_22portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_22.connectivity_checking = "OFF",
		ram_block1a_22.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_22.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_22.operation_mode = "bidir_dual_port",
		ram_block1a_22.port_a_address_width = 9,
		ram_block1a_22.port_a_data_out_clear = "clear0",
		ram_block1a_22.port_a_data_out_clock = "clock0",
		ram_block1a_22.port_a_data_width = 1,
		ram_block1a_22.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_22.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_22.port_a_first_address = 0,
		ram_block1a_22.port_a_first_bit_number = 22,
		ram_block1a_22.port_a_last_address = 511,
		ram_block1a_22.port_a_logical_ram_depth = 512,
		ram_block1a_22.port_a_logical_ram_width = 32,
		ram_block1a_22.port_b_address_clock = "clock1",
		ram_block1a_22.port_b_address_width = 9,
		ram_block1a_22.port_b_data_in_clock = "clock1",
		ram_block1a_22.port_b_data_out_clear = "clear1",
		ram_block1a_22.port_b_data_out_clock = "clock1",
		ram_block1a_22.port_b_data_width = 1,
		ram_block1a_22.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_22.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_22.port_b_first_address = 0,
		ram_block1a_22.port_b_first_bit_number = 22,
		ram_block1a_22.port_b_last_address = 511,
		ram_block1a_22.port_b_logical_ram_depth = 512,
		ram_block1a_22.port_b_logical_ram_width = 32,
		ram_block1a_22.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_22.power_up_uninitialized = "false",
		ram_block1a_22.ram_block_type = "AUTO",
		ram_block1a_22.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_23
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[23]}),
	.portadataout(wire_ram_block1a_23portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[23]}),
	.portbdataout(wire_ram_block1a_23portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_23.connectivity_checking = "OFF",
		ram_block1a_23.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_23.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_23.operation_mode = "bidir_dual_port",
		ram_block1a_23.port_a_address_width = 9,
		ram_block1a_23.port_a_data_out_clear = "clear0",
		ram_block1a_23.port_a_data_out_clock = "clock0",
		ram_block1a_23.port_a_data_width = 1,
		ram_block1a_23.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_23.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_23.port_a_first_address = 0,
		ram_block1a_23.port_a_first_bit_number = 23,
		ram_block1a_23.port_a_last_address = 511,
		ram_block1a_23.port_a_logical_ram_depth = 512,
		ram_block1a_23.port_a_logical_ram_width = 32,
		ram_block1a_23.port_b_address_clock = "clock1",
		ram_block1a_23.port_b_address_width = 9,
		ram_block1a_23.port_b_data_in_clock = "clock1",
		ram_block1a_23.port_b_data_out_clear = "clear1",
		ram_block1a_23.port_b_data_out_clock = "clock1",
		ram_block1a_23.port_b_data_width = 1,
		ram_block1a_23.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_23.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_23.port_b_first_address = 0,
		ram_block1a_23.port_b_first_bit_number = 23,
		ram_block1a_23.port_b_last_address = 511,
		ram_block1a_23.port_b_logical_ram_depth = 512,
		ram_block1a_23.port_b_logical_ram_width = 32,
		ram_block1a_23.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_23.power_up_uninitialized = "false",
		ram_block1a_23.ram_block_type = "AUTO",
		ram_block1a_23.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_24
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[24]}),
	.portadataout(wire_ram_block1a_24portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[24]}),
	.portbdataout(wire_ram_block1a_24portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_24.connectivity_checking = "OFF",
		ram_block1a_24.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_24.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_24.operation_mode = "bidir_dual_port",
		ram_block1a_24.port_a_address_width = 9,
		ram_block1a_24.port_a_data_out_clear = "clear0",
		ram_block1a_24.port_a_data_out_clock = "clock0",
		ram_block1a_24.port_a_data_width = 1,
		ram_block1a_24.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_24.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_24.port_a_first_address = 0,
		ram_block1a_24.port_a_first_bit_number = 24,
		ram_block1a_24.port_a_last_address = 511,
		ram_block1a_24.port_a_logical_ram_depth = 512,
		ram_block1a_24.port_a_logical_ram_width = 32,
		ram_block1a_24.port_b_address_clock = "clock1",
		ram_block1a_24.port_b_address_width = 9,
		ram_block1a_24.port_b_data_in_clock = "clock1",
		ram_block1a_24.port_b_data_out_clear = "clear1",
		ram_block1a_24.port_b_data_out_clock = "clock1",
		ram_block1a_24.port_b_data_width = 1,
		ram_block1a_24.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_24.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_24.port_b_first_address = 0,
		ram_block1a_24.port_b_first_bit_number = 24,
		ram_block1a_24.port_b_last_address = 511,
		ram_block1a_24.port_b_logical_ram_depth = 512,
		ram_block1a_24.port_b_logical_ram_width = 32,
		ram_block1a_24.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_24.power_up_uninitialized = "false",
		ram_block1a_24.ram_block_type = "AUTO",
		ram_block1a_24.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_25
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[25]}),
	.portadataout(wire_ram_block1a_25portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[25]}),
	.portbdataout(wire_ram_block1a_25portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_25.connectivity_checking = "OFF",
		ram_block1a_25.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_25.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_25.operation_mode = "bidir_dual_port",
		ram_block1a_25.port_a_address_width = 9,
		ram_block1a_25.port_a_data_out_clear = "clear0",
		ram_block1a_25.port_a_data_out_clock = "clock0",
		ram_block1a_25.port_a_data_width = 1,
		ram_block1a_25.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_25.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_25.port_a_first_address = 0,
		ram_block1a_25.port_a_first_bit_number = 25,
		ram_block1a_25.port_a_last_address = 511,
		ram_block1a_25.port_a_logical_ram_depth = 512,
		ram_block1a_25.port_a_logical_ram_width = 32,
		ram_block1a_25.port_b_address_clock = "clock1",
		ram_block1a_25.port_b_address_width = 9,
		ram_block1a_25.port_b_data_in_clock = "clock1",
		ram_block1a_25.port_b_data_out_clear = "clear1",
		ram_block1a_25.port_b_data_out_clock = "clock1",
		ram_block1a_25.port_b_data_width = 1,
		ram_block1a_25.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_25.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_25.port_b_first_address = 0,
		ram_block1a_25.port_b_first_bit_number = 25,
		ram_block1a_25.port_b_last_address = 511,
		ram_block1a_25.port_b_logical_ram_depth = 512,
		ram_block1a_25.port_b_logical_ram_width = 32,
		ram_block1a_25.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_25.power_up_uninitialized = "false",
		ram_block1a_25.ram_block_type = "AUTO",
		ram_block1a_25.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_26
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[26]}),
	.portadataout(wire_ram_block1a_26portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[26]}),
	.portbdataout(wire_ram_block1a_26portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_26.connectivity_checking = "OFF",
		ram_block1a_26.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_26.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_26.operation_mode = "bidir_dual_port",
		ram_block1a_26.port_a_address_width = 9,
		ram_block1a_26.port_a_data_out_clear = "clear0",
		ram_block1a_26.port_a_data_out_clock = "clock0",
		ram_block1a_26.port_a_data_width = 1,
		ram_block1a_26.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_26.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_26.port_a_first_address = 0,
		ram_block1a_26.port_a_first_bit_number = 26,
		ram_block1a_26.port_a_last_address = 511,
		ram_block1a_26.port_a_logical_ram_depth = 512,
		ram_block1a_26.port_a_logical_ram_width = 32,
		ram_block1a_26.port_b_address_clock = "clock1",
		ram_block1a_26.port_b_address_width = 9,
		ram_block1a_26.port_b_data_in_clock = "clock1",
		ram_block1a_26.port_b_data_out_clear = "clear1",
		ram_block1a_26.port_b_data_out_clock = "clock1",
		ram_block1a_26.port_b_data_width = 1,
		ram_block1a_26.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_26.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_26.port_b_first_address = 0,
		ram_block1a_26.port_b_first_bit_number = 26,
		ram_block1a_26.port_b_last_address = 511,
		ram_block1a_26.port_b_logical_ram_depth = 512,
		ram_block1a_26.port_b_logical_ram_width = 32,
		ram_block1a_26.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_26.power_up_uninitialized = "false",
		ram_block1a_26.ram_block_type = "AUTO",
		ram_block1a_26.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_27
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[27]}),
	.portadataout(wire_ram_block1a_27portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[27]}),
	.portbdataout(wire_ram_block1a_27portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_27.connectivity_checking = "OFF",
		ram_block1a_27.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_27.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_27.operation_mode = "bidir_dual_port",
		ram_block1a_27.port_a_address_width = 9,
		ram_block1a_27.port_a_data_out_clear = "clear0",
		ram_block1a_27.port_a_data_out_clock = "clock0",
		ram_block1a_27.port_a_data_width = 1,
		ram_block1a_27.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_27.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_27.port_a_first_address = 0,
		ram_block1a_27.port_a_first_bit_number = 27,
		ram_block1a_27.port_a_last_address = 511,
		ram_block1a_27.port_a_logical_ram_depth = 512,
		ram_block1a_27.port_a_logical_ram_width = 32,
		ram_block1a_27.port_b_address_clock = "clock1",
		ram_block1a_27.port_b_address_width = 9,
		ram_block1a_27.port_b_data_in_clock = "clock1",
		ram_block1a_27.port_b_data_out_clear = "clear1",
		ram_block1a_27.port_b_data_out_clock = "clock1",
		ram_block1a_27.port_b_data_width = 1,
		ram_block1a_27.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_27.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_27.port_b_first_address = 0,
		ram_block1a_27.port_b_first_bit_number = 27,
		ram_block1a_27.port_b_last_address = 511,
		ram_block1a_27.port_b_logical_ram_depth = 512,
		ram_block1a_27.port_b_logical_ram_width = 32,
		ram_block1a_27.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_27.power_up_uninitialized = "false",
		ram_block1a_27.ram_block_type = "AUTO",
		ram_block1a_27.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_28
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[28]}),
	.portadataout(wire_ram_block1a_28portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[28]}),
	.portbdataout(wire_ram_block1a_28portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_28.connectivity_checking = "OFF",
		ram_block1a_28.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_28.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_28.operation_mode = "bidir_dual_port",
		ram_block1a_28.port_a_address_width = 9,
		ram_block1a_28.port_a_data_out_clear = "clear0",
		ram_block1a_28.port_a_data_out_clock = "clock0",
		ram_block1a_28.port_a_data_width = 1,
		ram_block1a_28.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_28.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_28.port_a_first_address = 0,
		ram_block1a_28.port_a_first_bit_number = 28,
		ram_block1a_28.port_a_last_address = 511,
		ram_block1a_28.port_a_logical_ram_depth = 512,
		ram_block1a_28.port_a_logical_ram_width = 32,
		ram_block1a_28.port_b_address_clock = "clock1",
		ram_block1a_28.port_b_address_width = 9,
		ram_block1a_28.port_b_data_in_clock = "clock1",
		ram_block1a_28.port_b_data_out_clear = "clear1",
		ram_block1a_28.port_b_data_out_clock = "clock1",
		ram_block1a_28.port_b_data_width = 1,
		ram_block1a_28.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_28.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_28.port_b_first_address = 0,
		ram_block1a_28.port_b_first_bit_number = 28,
		ram_block1a_28.port_b_last_address = 511,
		ram_block1a_28.port_b_logical_ram_depth = 512,
		ram_block1a_28.port_b_logical_ram_width = 32,
		ram_block1a_28.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_28.power_up_uninitialized = "false",
		ram_block1a_28.ram_block_type = "AUTO",
		ram_block1a_28.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_29
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[29]}),
	.portadataout(wire_ram_block1a_29portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[29]}),
	.portbdataout(wire_ram_block1a_29portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_29.connectivity_checking = "OFF",
		ram_block1a_29.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_29.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_29.operation_mode = "bidir_dual_port",
		ram_block1a_29.port_a_address_width = 9,
		ram_block1a_29.port_a_data_out_clear = "clear0",
		ram_block1a_29.port_a_data_out_clock = "clock0",
		ram_block1a_29.port_a_data_width = 1,
		ram_block1a_29.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_29.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_29.port_a_first_address = 0,
		ram_block1a_29.port_a_first_bit_number = 29,
		ram_block1a_29.port_a_last_address = 511,
		ram_block1a_29.port_a_logical_ram_depth = 512,
		ram_block1a_29.port_a_logical_ram_width = 32,
		ram_block1a_29.port_b_address_clock = "clock1",
		ram_block1a_29.port_b_address_width = 9,
		ram_block1a_29.port_b_data_in_clock = "clock1",
		ram_block1a_29.port_b_data_out_clear = "clear1",
		ram_block1a_29.port_b_data_out_clock = "clock1",
		ram_block1a_29.port_b_data_width = 1,
		ram_block1a_29.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_29.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_29.port_b_first_address = 0,
		ram_block1a_29.port_b_first_bit_number = 29,
		ram_block1a_29.port_b_last_address = 511,
		ram_block1a_29.port_b_logical_ram_depth = 512,
		ram_block1a_29.port_b_logical_ram_width = 32,
		ram_block1a_29.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_29.power_up_uninitialized = "false",
		ram_block1a_29.ram_block_type = "AUTO",
		ram_block1a_29.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_30
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[30]}),
	.portadataout(wire_ram_block1a_30portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[30]}),
	.portbdataout(wire_ram_block1a_30portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_30.connectivity_checking = "OFF",
		ram_block1a_30.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_30.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_30.operation_mode = "bidir_dual_port",
		ram_block1a_30.port_a_address_width = 9,
		ram_block1a_30.port_a_data_out_clear = "clear0",
		ram_block1a_30.port_a_data_out_clock = "clock0",
		ram_block1a_30.port_a_data_width = 1,
		ram_block1a_30.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_30.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_30.port_a_first_address = 0,
		ram_block1a_30.port_a_first_bit_number = 30,
		ram_block1a_30.port_a_last_address = 511,
		ram_block1a_30.port_a_logical_ram_depth = 512,
		ram_block1a_30.port_a_logical_ram_width = 32,
		ram_block1a_30.port_b_address_clock = "clock1",
		ram_block1a_30.port_b_address_width = 9,
		ram_block1a_30.port_b_data_in_clock = "clock1",
		ram_block1a_30.port_b_data_out_clear = "clear1",
		ram_block1a_30.port_b_data_out_clock = "clock1",
		ram_block1a_30.port_b_data_width = 1,
		ram_block1a_30.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_30.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_30.port_b_first_address = 0,
		ram_block1a_30.port_b_first_bit_number = 30,
		ram_block1a_30.port_b_last_address = 511,
		ram_block1a_30.port_b_logical_ram_depth = 512,
		ram_block1a_30.port_b_logical_ram_width = 32,
		ram_block1a_30.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_30.power_up_uninitialized = "false",
		ram_block1a_30.ram_block_type = "AUTO",
		ram_block1a_30.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block1a_31
	(
	.clk0(clock0),
	.clk1(clock1),
	.clr0(aclr0),
	.clr1(aclr1),
	.portaaddr({address_a_wire[8:0]}),
	.portadatain({data_a[31]}),
	.portadataout(wire_ram_block1a_31portadataout[0:0]),
	.portawe(wren_a),
	.portbaddr({address_b_wire[8:0]}),
	.portbdatain({data_b[31]}),
	.portbdataout(wire_ram_block1a_31portbdataout[0:0]),
	.portbrewe(wren_b)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devclrn(1'b1),
	.devpor(1'b1)
	// synopsys translate_on
	);
	defparam
		ram_block1a_31.connectivity_checking = "OFF",
		ram_block1a_31.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_31.mixed_port_feed_through_mode = "dont_care",
		ram_block1a_31.operation_mode = "bidir_dual_port",
		ram_block1a_31.port_a_address_width = 9,
		ram_block1a_31.port_a_data_out_clear = "clear0",
		ram_block1a_31.port_a_data_out_clock = "clock0",
		ram_block1a_31.port_a_data_width = 1,
		ram_block1a_31.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_31.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_31.port_a_first_address = 0,
		ram_block1a_31.port_a_first_bit_number = 31,
		ram_block1a_31.port_a_last_address = 511,
		ram_block1a_31.port_a_logical_ram_depth = 512,
		ram_block1a_31.port_a_logical_ram_width = 32,
		ram_block1a_31.port_b_address_clock = "clock1",
		ram_block1a_31.port_b_address_width = 9,
		ram_block1a_31.port_b_data_in_clock = "clock1",
		ram_block1a_31.port_b_data_out_clear = "clear1",
		ram_block1a_31.port_b_data_out_clock = "clock1",
		ram_block1a_31.port_b_data_width = 1,
		ram_block1a_31.port_b_disable_ce_on_input_registers = "on",
		ram_block1a_31.port_b_disable_ce_on_output_registers = "on",
		ram_block1a_31.port_b_first_address = 0,
		ram_block1a_31.port_b_first_bit_number = 31,
		ram_block1a_31.port_b_last_address = 511,
		ram_block1a_31.port_b_logical_ram_depth = 512,
		ram_block1a_31.port_b_logical_ram_width = 32,
		ram_block1a_31.port_b_read_enable_write_enable_clock = "clock1",
		ram_block1a_31.power_up_uninitialized = "false",
		ram_block1a_31.ram_block_type = "AUTO",
		ram_block1a_31.lpm_type = "stratixii_ram_block";
	assign
		address_a_wire = address_a,
		address_b_wire = address_b,
		q_a = {wire_ram_block1a_31portadataout[0], wire_ram_block1a_30portadataout[0], wire_ram_block1a_29portadataout[0], wire_ram_block1a_28portadataout[0], wire_ram_block1a_27portadataout[0], wire_ram_block1a_26portadataout[0], wire_ram_block1a_25portadataout[0], wire_ram_block1a_24portadataout[0], wire_ram_block1a_23portadataout[0], wire_ram_block1a_22portadataout[0], wire_ram_block1a_21portadataout[0], wire_ram_block1a_20portadataout[0], wire_ram_block1a_19portadataout[0], wire_ram_block1a_18portadataout[0], wire_ram_block1a_17portadataout[0], wire_ram_block1a_16portadataout[0], wire_ram_block1a_15portadataout[0], wire_ram_block1a_14portadataout[0], wire_ram_block1a_13portadataout[0], wire_ram_block1a_12portadataout[0], wire_ram_block1a_11portadataout[0], wire_ram_block1a_10portadataout[0], wire_ram_block1a_9portadataout[0], wire_ram_block1a_8portadataout[0], wire_ram_block1a_7portadataout[0], wire_ram_block1a_6portadataout[0], wire_ram_block1a_5portadataout[0], wire_ram_block1a_4portadataout[0], wire_ram_block1a_3portadataout[0], wire_ram_block1a_2portadataout[0], wire_ram_block1a_1portadataout[0], wire_ram_block1a_0portadataout[0]},
		q_b = {wire_ram_block1a_31portbdataout[0], wire_ram_block1a_30portbdataout[0], wire_ram_block1a_29portbdataout[0], wire_ram_block1a_28portbdataout[0], wire_ram_block1a_27portbdataout[0], wire_ram_block1a_26portbdataout[0], wire_ram_block1a_25portbdataout[0], wire_ram_block1a_24portbdataout[0], wire_ram_block1a_23portbdataout[0], wire_ram_block1a_22portbdataout[0], wire_ram_block1a_21portbdataout[0], wire_ram_block1a_20portbdataout[0], wire_ram_block1a_19portbdataout[0], wire_ram_block1a_18portbdataout[0], wire_ram_block1a_17portbdataout[0], wire_ram_block1a_16portbdataout[0], wire_ram_block1a_15portbdataout[0], wire_ram_block1a_14portbdataout[0], wire_ram_block1a_13portbdataout[0], wire_ram_block1a_12portbdataout[0], wire_ram_block1a_11portbdataout[0], wire_ram_block1a_10portbdataout[0], wire_ram_block1a_9portbdataout[0], wire_ram_block1a_8portbdataout[0], wire_ram_block1a_7portbdataout[0], wire_ram_block1a_6portbdataout[0], wire_ram_block1a_5portbdataout[0], wire_ram_block1a_4portbdataout[0], wire_ram_block1a_3portbdataout[0], wire_ram_block1a_2portbdataout[0], wire_ram_block1a_1portbdataout[0], wire_ram_block1a_0portbdataout[0]};
endmodule