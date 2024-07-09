module  small_fifo_test_altsyncram
	(
	address_a,
	address_b,
	clock0,
	clock1,
	clocken1,
	data_a,
	q_b,
	wren_a) /* synthesis synthesis_clearbox=1 */;
	input   [4:0]  address_a;
	input   [4:0]  address_b;
	input   clock0;
	input   clock1;
	input   clocken1;
	input   [31:0]  data_a;
	output   [31:0]  q_b;
	input   wren_a;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   [4:0]  address_b;
	tri1   clock0;
	tri1   clock1;
	tri1   clocken1;
	tri1   [31:0]  data_a;
	tri0   wren_a;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  [0:0]   wire_ram_block3a_0portbdataout;
	wire  [0:0]   wire_ram_block3a_1portbdataout;
	wire  [0:0]   wire_ram_block3a_2portbdataout;
	wire  [0:0]   wire_ram_block3a_3portbdataout;
	wire  [0:0]   wire_ram_block3a_4portbdataout;
	wire  [0:0]   wire_ram_block3a_5portbdataout;
	wire  [0:0]   wire_ram_block3a_6portbdataout;
	wire  [0:0]   wire_ram_block3a_7portbdataout;
	wire  [0:0]   wire_ram_block3a_8portbdataout;
	wire  [0:0]   wire_ram_block3a_9portbdataout;
	wire  [0:0]   wire_ram_block3a_10portbdataout;
	wire  [0:0]   wire_ram_block3a_11portbdataout;
	wire  [0:0]   wire_ram_block3a_12portbdataout;
	wire  [0:0]   wire_ram_block3a_13portbdataout;
	wire  [0:0]   wire_ram_block3a_14portbdataout;
	wire  [0:0]   wire_ram_block3a_15portbdataout;
	wire  [0:0]   wire_ram_block3a_16portbdataout;
	wire  [0:0]   wire_ram_block3a_17portbdataout;
	wire  [0:0]   wire_ram_block3a_18portbdataout;
	wire  [0:0]   wire_ram_block3a_19portbdataout;
	wire  [0:0]   wire_ram_block3a_20portbdataout;
	wire  [0:0]   wire_ram_block3a_21portbdataout;
	wire  [0:0]   wire_ram_block3a_22portbdataout;
	wire  [0:0]   wire_ram_block3a_23portbdataout;
	wire  [0:0]   wire_ram_block3a_24portbdataout;
	wire  [0:0]   wire_ram_block3a_25portbdataout;
	wire  [0:0]   wire_ram_block3a_26portbdataout;
	wire  [0:0]   wire_ram_block3a_27portbdataout;
	wire  [0:0]   wire_ram_block3a_28portbdataout;
	wire  [0:0]   wire_ram_block3a_29portbdataout;
	wire  [0:0]   wire_ram_block3a_30portbdataout;
	wire  [0:0]   wire_ram_block3a_31portbdataout;
	wire  [4:0]  address_a_wire;
	wire  [4:0]  address_b_wire;
	stratixii_ram_block   ram_block3a_0
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[0]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_0portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_0.connectivity_checking = "OFF",
		ram_block3a_0.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_0.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_0.operation_mode = "dual_port",
		ram_block3a_0.port_a_address_width = 5,
		ram_block3a_0.port_a_data_width = 1,
		ram_block3a_0.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_0.port_a_first_address = 0,
		ram_block3a_0.port_a_first_bit_number = 0,
		ram_block3a_0.port_a_last_address = 31,
		ram_block3a_0.port_a_logical_ram_depth = 32,
		ram_block3a_0.port_a_logical_ram_width = 32,
		ram_block3a_0.port_b_address_clock = "clock1",
		ram_block3a_0.port_b_address_width = 5,
		ram_block3a_0.port_b_data_out_clear = "none",
		ram_block3a_0.port_b_data_out_clock = "none",
		ram_block3a_0.port_b_data_width = 1,
		ram_block3a_0.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_0.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_0.port_b_first_address = 0,
		ram_block3a_0.port_b_first_bit_number = 0,
		ram_block3a_0.port_b_last_address = 31,
		ram_block3a_0.port_b_logical_ram_depth = 32,
		ram_block3a_0.port_b_logical_ram_width = 32,
		ram_block3a_0.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_0.ram_block_type = "AUTO",
		ram_block3a_0.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_1
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[1]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_1portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_1.connectivity_checking = "OFF",
		ram_block3a_1.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_1.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_1.operation_mode = "dual_port",
		ram_block3a_1.port_a_address_width = 5,
		ram_block3a_1.port_a_data_width = 1,
		ram_block3a_1.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_1.port_a_first_address = 0,
		ram_block3a_1.port_a_first_bit_number = 1,
		ram_block3a_1.port_a_last_address = 31,
		ram_block3a_1.port_a_logical_ram_depth = 32,
		ram_block3a_1.port_a_logical_ram_width = 32,
		ram_block3a_1.port_b_address_clock = "clock1",
		ram_block3a_1.port_b_address_width = 5,
		ram_block3a_1.port_b_data_out_clear = "none",
		ram_block3a_1.port_b_data_out_clock = "none",
		ram_block3a_1.port_b_data_width = 1,
		ram_block3a_1.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_1.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_1.port_b_first_address = 0,
		ram_block3a_1.port_b_first_bit_number = 1,
		ram_block3a_1.port_b_last_address = 31,
		ram_block3a_1.port_b_logical_ram_depth = 32,
		ram_block3a_1.port_b_logical_ram_width = 32,
		ram_block3a_1.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_1.ram_block_type = "AUTO",
		ram_block3a_1.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_2
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[2]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_2portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_2.connectivity_checking = "OFF",
		ram_block3a_2.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_2.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_2.operation_mode = "dual_port",
		ram_block3a_2.port_a_address_width = 5,
		ram_block3a_2.port_a_data_width = 1,
		ram_block3a_2.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_2.port_a_first_address = 0,
		ram_block3a_2.port_a_first_bit_number = 2,
		ram_block3a_2.port_a_last_address = 31,
		ram_block3a_2.port_a_logical_ram_depth = 32,
		ram_block3a_2.port_a_logical_ram_width = 32,
		ram_block3a_2.port_b_address_clock = "clock1",
		ram_block3a_2.port_b_address_width = 5,
		ram_block3a_2.port_b_data_out_clear = "none",
		ram_block3a_2.port_b_data_out_clock = "none",
		ram_block3a_2.port_b_data_width = 1,
		ram_block3a_2.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_2.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_2.port_b_first_address = 0,
		ram_block3a_2.port_b_first_bit_number = 2,
		ram_block3a_2.port_b_last_address = 31,
		ram_block3a_2.port_b_logical_ram_depth = 32,
		ram_block3a_2.port_b_logical_ram_width = 32,
		ram_block3a_2.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_2.ram_block_type = "AUTO",
		ram_block3a_2.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_3
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[3]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_3portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_3.connectivity_checking = "OFF",
		ram_block3a_3.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_3.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_3.operation_mode = "dual_port",
		ram_block3a_3.port_a_address_width = 5,
		ram_block3a_3.port_a_data_width = 1,
		ram_block3a_3.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_3.port_a_first_address = 0,
		ram_block3a_3.port_a_first_bit_number = 3,
		ram_block3a_3.port_a_last_address = 31,
		ram_block3a_3.port_a_logical_ram_depth = 32,
		ram_block3a_3.port_a_logical_ram_width = 32,
		ram_block3a_3.port_b_address_clock = "clock1",
		ram_block3a_3.port_b_address_width = 5,
		ram_block3a_3.port_b_data_out_clear = "none",
		ram_block3a_3.port_b_data_out_clock = "none",
		ram_block3a_3.port_b_data_width = 1,
		ram_block3a_3.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_3.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_3.port_b_first_address = 0,
		ram_block3a_3.port_b_first_bit_number = 3,
		ram_block3a_3.port_b_last_address = 31,
		ram_block3a_3.port_b_logical_ram_depth = 32,
		ram_block3a_3.port_b_logical_ram_width = 32,
		ram_block3a_3.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_3.ram_block_type = "AUTO",
		ram_block3a_3.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_4
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[4]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_4portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_4.connectivity_checking = "OFF",
		ram_block3a_4.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_4.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_4.operation_mode = "dual_port",
		ram_block3a_4.port_a_address_width = 5,
		ram_block3a_4.port_a_data_width = 1,
		ram_block3a_4.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_4.port_a_first_address = 0,
		ram_block3a_4.port_a_first_bit_number = 4,
		ram_block3a_4.port_a_last_address = 31,
		ram_block3a_4.port_a_logical_ram_depth = 32,
		ram_block3a_4.port_a_logical_ram_width = 32,
		ram_block3a_4.port_b_address_clock = "clock1",
		ram_block3a_4.port_b_address_width = 5,
		ram_block3a_4.port_b_data_out_clear = "none",
		ram_block3a_4.port_b_data_out_clock = "none",
		ram_block3a_4.port_b_data_width = 1,
		ram_block3a_4.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_4.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_4.port_b_first_address = 0,
		ram_block3a_4.port_b_first_bit_number = 4,
		ram_block3a_4.port_b_last_address = 31,
		ram_block3a_4.port_b_logical_ram_depth = 32,
		ram_block3a_4.port_b_logical_ram_width = 32,
		ram_block3a_4.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_4.ram_block_type = "AUTO",
		ram_block3a_4.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_5
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[5]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_5portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_5.connectivity_checking = "OFF",
		ram_block3a_5.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_5.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_5.operation_mode = "dual_port",
		ram_block3a_5.port_a_address_width = 5,
		ram_block3a_5.port_a_data_width = 1,
		ram_block3a_5.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_5.port_a_first_address = 0,
		ram_block3a_5.port_a_first_bit_number = 5,
		ram_block3a_5.port_a_last_address = 31,
		ram_block3a_5.port_a_logical_ram_depth = 32,
		ram_block3a_5.port_a_logical_ram_width = 32,
		ram_block3a_5.port_b_address_clock = "clock1",
		ram_block3a_5.port_b_address_width = 5,
		ram_block3a_5.port_b_data_out_clear = "none",
		ram_block3a_5.port_b_data_out_clock = "none",
		ram_block3a_5.port_b_data_width = 1,
		ram_block3a_5.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_5.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_5.port_b_first_address = 0,
		ram_block3a_5.port_b_first_bit_number = 5,
		ram_block3a_5.port_b_last_address = 31,
		ram_block3a_5.port_b_logical_ram_depth = 32,
		ram_block3a_5.port_b_logical_ram_width = 32,
		ram_block3a_5.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_5.ram_block_type = "AUTO",
		ram_block3a_5.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_6
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[6]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_6portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_6.connectivity_checking = "OFF",
		ram_block3a_6.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_6.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_6.operation_mode = "dual_port",
		ram_block3a_6.port_a_address_width = 5,
		ram_block3a_6.port_a_data_width = 1,
		ram_block3a_6.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_6.port_a_first_address = 0,
		ram_block3a_6.port_a_first_bit_number = 6,
		ram_block3a_6.port_a_last_address = 31,
		ram_block3a_6.port_a_logical_ram_depth = 32,
		ram_block3a_6.port_a_logical_ram_width = 32,
		ram_block3a_6.port_b_address_clock = "clock1",
		ram_block3a_6.port_b_address_width = 5,
		ram_block3a_6.port_b_data_out_clear = "none",
		ram_block3a_6.port_b_data_out_clock = "none",
		ram_block3a_6.port_b_data_width = 1,
		ram_block3a_6.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_6.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_6.port_b_first_address = 0,
		ram_block3a_6.port_b_first_bit_number = 6,
		ram_block3a_6.port_b_last_address = 31,
		ram_block3a_6.port_b_logical_ram_depth = 32,
		ram_block3a_6.port_b_logical_ram_width = 32,
		ram_block3a_6.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_6.ram_block_type = "AUTO",
		ram_block3a_6.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_7
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[7]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_7portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_7.connectivity_checking = "OFF",
		ram_block3a_7.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_7.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_7.operation_mode = "dual_port",
		ram_block3a_7.port_a_address_width = 5,
		ram_block3a_7.port_a_data_width = 1,
		ram_block3a_7.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_7.port_a_first_address = 0,
		ram_block3a_7.port_a_first_bit_number = 7,
		ram_block3a_7.port_a_last_address = 31,
		ram_block3a_7.port_a_logical_ram_depth = 32,
		ram_block3a_7.port_a_logical_ram_width = 32,
		ram_block3a_7.port_b_address_clock = "clock1",
		ram_block3a_7.port_b_address_width = 5,
		ram_block3a_7.port_b_data_out_clear = "none",
		ram_block3a_7.port_b_data_out_clock = "none",
		ram_block3a_7.port_b_data_width = 1,
		ram_block3a_7.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_7.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_7.port_b_first_address = 0,
		ram_block3a_7.port_b_first_bit_number = 7,
		ram_block3a_7.port_b_last_address = 31,
		ram_block3a_7.port_b_logical_ram_depth = 32,
		ram_block3a_7.port_b_logical_ram_width = 32,
		ram_block3a_7.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_7.ram_block_type = "AUTO",
		ram_block3a_7.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_8
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[8]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_8portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_8.connectivity_checking = "OFF",
		ram_block3a_8.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_8.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_8.operation_mode = "dual_port",
		ram_block3a_8.port_a_address_width = 5,
		ram_block3a_8.port_a_data_width = 1,
		ram_block3a_8.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_8.port_a_first_address = 0,
		ram_block3a_8.port_a_first_bit_number = 8,
		ram_block3a_8.port_a_last_address = 31,
		ram_block3a_8.port_a_logical_ram_depth = 32,
		ram_block3a_8.port_a_logical_ram_width = 32,
		ram_block3a_8.port_b_address_clock = "clock1",
		ram_block3a_8.port_b_address_width = 5,
		ram_block3a_8.port_b_data_out_clear = "none",
		ram_block3a_8.port_b_data_out_clock = "none",
		ram_block3a_8.port_b_data_width = 1,
		ram_block3a_8.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_8.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_8.port_b_first_address = 0,
		ram_block3a_8.port_b_first_bit_number = 8,
		ram_block3a_8.port_b_last_address = 31,
		ram_block3a_8.port_b_logical_ram_depth = 32,
		ram_block3a_8.port_b_logical_ram_width = 32,
		ram_block3a_8.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_8.ram_block_type = "AUTO",
		ram_block3a_8.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_9
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[9]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_9portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_9.connectivity_checking = "OFF",
		ram_block3a_9.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_9.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_9.operation_mode = "dual_port",
		ram_block3a_9.port_a_address_width = 5,
		ram_block3a_9.port_a_data_width = 1,
		ram_block3a_9.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_9.port_a_first_address = 0,
		ram_block3a_9.port_a_first_bit_number = 9,
		ram_block3a_9.port_a_last_address = 31,
		ram_block3a_9.port_a_logical_ram_depth = 32,
		ram_block3a_9.port_a_logical_ram_width = 32,
		ram_block3a_9.port_b_address_clock = "clock1",
		ram_block3a_9.port_b_address_width = 5,
		ram_block3a_9.port_b_data_out_clear = "none",
		ram_block3a_9.port_b_data_out_clock = "none",
		ram_block3a_9.port_b_data_width = 1,
		ram_block3a_9.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_9.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_9.port_b_first_address = 0,
		ram_block3a_9.port_b_first_bit_number = 9,
		ram_block3a_9.port_b_last_address = 31,
		ram_block3a_9.port_b_logical_ram_depth = 32,
		ram_block3a_9.port_b_logical_ram_width = 32,
		ram_block3a_9.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_9.ram_block_type = "AUTO",
		ram_block3a_9.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_10
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[10]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_10portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_10.connectivity_checking = "OFF",
		ram_block3a_10.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_10.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_10.operation_mode = "dual_port",
		ram_block3a_10.port_a_address_width = 5,
		ram_block3a_10.port_a_data_width = 1,
		ram_block3a_10.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_10.port_a_first_address = 0,
		ram_block3a_10.port_a_first_bit_number = 10,
		ram_block3a_10.port_a_last_address = 31,
		ram_block3a_10.port_a_logical_ram_depth = 32,
		ram_block3a_10.port_a_logical_ram_width = 32,
		ram_block3a_10.port_b_address_clock = "clock1",
		ram_block3a_10.port_b_address_width = 5,
		ram_block3a_10.port_b_data_out_clear = "none",
		ram_block3a_10.port_b_data_out_clock = "none",
		ram_block3a_10.port_b_data_width = 1,
		ram_block3a_10.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_10.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_10.port_b_first_address = 0,
		ram_block3a_10.port_b_first_bit_number = 10,
		ram_block3a_10.port_b_last_address = 31,
		ram_block3a_10.port_b_logical_ram_depth = 32,
		ram_block3a_10.port_b_logical_ram_width = 32,
		ram_block3a_10.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_10.ram_block_type = "AUTO",
		ram_block3a_10.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_11
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[11]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_11portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_11.connectivity_checking = "OFF",
		ram_block3a_11.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_11.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_11.operation_mode = "dual_port",
		ram_block3a_11.port_a_address_width = 5,
		ram_block3a_11.port_a_data_width = 1,
		ram_block3a_11.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_11.port_a_first_address = 0,
		ram_block3a_11.port_a_first_bit_number = 11,
		ram_block3a_11.port_a_last_address = 31,
		ram_block3a_11.port_a_logical_ram_depth = 32,
		ram_block3a_11.port_a_logical_ram_width = 32,
		ram_block3a_11.port_b_address_clock = "clock1",
		ram_block3a_11.port_b_address_width = 5,
		ram_block3a_11.port_b_data_out_clear = "none",
		ram_block3a_11.port_b_data_out_clock = "none",
		ram_block3a_11.port_b_data_width = 1,
		ram_block3a_11.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_11.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_11.port_b_first_address = 0,
		ram_block3a_11.port_b_first_bit_number = 11,
		ram_block3a_11.port_b_last_address = 31,
		ram_block3a_11.port_b_logical_ram_depth = 32,
		ram_block3a_11.port_b_logical_ram_width = 32,
		ram_block3a_11.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_11.ram_block_type = "AUTO",
		ram_block3a_11.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_12
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[12]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_12portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_12.connectivity_checking = "OFF",
		ram_block3a_12.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_12.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_12.operation_mode = "dual_port",
		ram_block3a_12.port_a_address_width = 5,
		ram_block3a_12.port_a_data_width = 1,
		ram_block3a_12.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_12.port_a_first_address = 0,
		ram_block3a_12.port_a_first_bit_number = 12,
		ram_block3a_12.port_a_last_address = 31,
		ram_block3a_12.port_a_logical_ram_depth = 32,
		ram_block3a_12.port_a_logical_ram_width = 32,
		ram_block3a_12.port_b_address_clock = "clock1",
		ram_block3a_12.port_b_address_width = 5,
		ram_block3a_12.port_b_data_out_clear = "none",
		ram_block3a_12.port_b_data_out_clock = "none",
		ram_block3a_12.port_b_data_width = 1,
		ram_block3a_12.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_12.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_12.port_b_first_address = 0,
		ram_block3a_12.port_b_first_bit_number = 12,
		ram_block3a_12.port_b_last_address = 31,
		ram_block3a_12.port_b_logical_ram_depth = 32,
		ram_block3a_12.port_b_logical_ram_width = 32,
		ram_block3a_12.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_12.ram_block_type = "AUTO",
		ram_block3a_12.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_13
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[13]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_13portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_13.connectivity_checking = "OFF",
		ram_block3a_13.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_13.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_13.operation_mode = "dual_port",
		ram_block3a_13.port_a_address_width = 5,
		ram_block3a_13.port_a_data_width = 1,
		ram_block3a_13.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_13.port_a_first_address = 0,
		ram_block3a_13.port_a_first_bit_number = 13,
		ram_block3a_13.port_a_last_address = 31,
		ram_block3a_13.port_a_logical_ram_depth = 32,
		ram_block3a_13.port_a_logical_ram_width = 32,
		ram_block3a_13.port_b_address_clock = "clock1",
		ram_block3a_13.port_b_address_width = 5,
		ram_block3a_13.port_b_data_out_clear = "none",
		ram_block3a_13.port_b_data_out_clock = "none",
		ram_block3a_13.port_b_data_width = 1,
		ram_block3a_13.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_13.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_13.port_b_first_address = 0,
		ram_block3a_13.port_b_first_bit_number = 13,
		ram_block3a_13.port_b_last_address = 31,
		ram_block3a_13.port_b_logical_ram_depth = 32,
		ram_block3a_13.port_b_logical_ram_width = 32,
		ram_block3a_13.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_13.ram_block_type = "AUTO",
		ram_block3a_13.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_14
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[14]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_14portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_14.connectivity_checking = "OFF",
		ram_block3a_14.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_14.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_14.operation_mode = "dual_port",
		ram_block3a_14.port_a_address_width = 5,
		ram_block3a_14.port_a_data_width = 1,
		ram_block3a_14.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_14.port_a_first_address = 0,
		ram_block3a_14.port_a_first_bit_number = 14,
		ram_block3a_14.port_a_last_address = 31,
		ram_block3a_14.port_a_logical_ram_depth = 32,
		ram_block3a_14.port_a_logical_ram_width = 32,
		ram_block3a_14.port_b_address_clock = "clock1",
		ram_block3a_14.port_b_address_width = 5,
		ram_block3a_14.port_b_data_out_clear = "none",
		ram_block3a_14.port_b_data_out_clock = "none",
		ram_block3a_14.port_b_data_width = 1,
		ram_block3a_14.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_14.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_14.port_b_first_address = 0,
		ram_block3a_14.port_b_first_bit_number = 14,
		ram_block3a_14.port_b_last_address = 31,
		ram_block3a_14.port_b_logical_ram_depth = 32,
		ram_block3a_14.port_b_logical_ram_width = 32,
		ram_block3a_14.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_14.ram_block_type = "AUTO",
		ram_block3a_14.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_15
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[15]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_15portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_15.connectivity_checking = "OFF",
		ram_block3a_15.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_15.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_15.operation_mode = "dual_port",
		ram_block3a_15.port_a_address_width = 5,
		ram_block3a_15.port_a_data_width = 1,
		ram_block3a_15.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_15.port_a_first_address = 0,
		ram_block3a_15.port_a_first_bit_number = 15,
		ram_block3a_15.port_a_last_address = 31,
		ram_block3a_15.port_a_logical_ram_depth = 32,
		ram_block3a_15.port_a_logical_ram_width = 32,
		ram_block3a_15.port_b_address_clock = "clock1",
		ram_block3a_15.port_b_address_width = 5,
		ram_block3a_15.port_b_data_out_clear = "none",
		ram_block3a_15.port_b_data_out_clock = "none",
		ram_block3a_15.port_b_data_width = 1,
		ram_block3a_15.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_15.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_15.port_b_first_address = 0,
		ram_block3a_15.port_b_first_bit_number = 15,
		ram_block3a_15.port_b_last_address = 31,
		ram_block3a_15.port_b_logical_ram_depth = 32,
		ram_block3a_15.port_b_logical_ram_width = 32,
		ram_block3a_15.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_15.ram_block_type = "AUTO",
		ram_block3a_15.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_16
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[16]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_16portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_16.connectivity_checking = "OFF",
		ram_block3a_16.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_16.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_16.operation_mode = "dual_port",
		ram_block3a_16.port_a_address_width = 5,
		ram_block3a_16.port_a_data_width = 1,
		ram_block3a_16.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_16.port_a_first_address = 0,
		ram_block3a_16.port_a_first_bit_number = 16,
		ram_block3a_16.port_a_last_address = 31,
		ram_block3a_16.port_a_logical_ram_depth = 32,
		ram_block3a_16.port_a_logical_ram_width = 32,
		ram_block3a_16.port_b_address_clock = "clock1",
		ram_block3a_16.port_b_address_width = 5,
		ram_block3a_16.port_b_data_out_clear = "none",
		ram_block3a_16.port_b_data_out_clock = "none",
		ram_block3a_16.port_b_data_width = 1,
		ram_block3a_16.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_16.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_16.port_b_first_address = 0,
		ram_block3a_16.port_b_first_bit_number = 16,
		ram_block3a_16.port_b_last_address = 31,
		ram_block3a_16.port_b_logical_ram_depth = 32,
		ram_block3a_16.port_b_logical_ram_width = 32,
		ram_block3a_16.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_16.ram_block_type = "AUTO",
		ram_block3a_16.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_17
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[17]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_17portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_17.connectivity_checking = "OFF",
		ram_block3a_17.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_17.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_17.operation_mode = "dual_port",
		ram_block3a_17.port_a_address_width = 5,
		ram_block3a_17.port_a_data_width = 1,
		ram_block3a_17.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_17.port_a_first_address = 0,
		ram_block3a_17.port_a_first_bit_number = 17,
		ram_block3a_17.port_a_last_address = 31,
		ram_block3a_17.port_a_logical_ram_depth = 32,
		ram_block3a_17.port_a_logical_ram_width = 32,
		ram_block3a_17.port_b_address_clock = "clock1",
		ram_block3a_17.port_b_address_width = 5,
		ram_block3a_17.port_b_data_out_clear = "none",
		ram_block3a_17.port_b_data_out_clock = "none",
		ram_block3a_17.port_b_data_width = 1,
		ram_block3a_17.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_17.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_17.port_b_first_address = 0,
		ram_block3a_17.port_b_first_bit_number = 17,
		ram_block3a_17.port_b_last_address = 31,
		ram_block3a_17.port_b_logical_ram_depth = 32,
		ram_block3a_17.port_b_logical_ram_width = 32,
		ram_block3a_17.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_17.ram_block_type = "AUTO",
		ram_block3a_17.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_18
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[18]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_18portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_18.connectivity_checking = "OFF",
		ram_block3a_18.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_18.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_18.operation_mode = "dual_port",
		ram_block3a_18.port_a_address_width = 5,
		ram_block3a_18.port_a_data_width = 1,
		ram_block3a_18.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_18.port_a_first_address = 0,
		ram_block3a_18.port_a_first_bit_number = 18,
		ram_block3a_18.port_a_last_address = 31,
		ram_block3a_18.port_a_logical_ram_depth = 32,
		ram_block3a_18.port_a_logical_ram_width = 32,
		ram_block3a_18.port_b_address_clock = "clock1",
		ram_block3a_18.port_b_address_width = 5,
		ram_block3a_18.port_b_data_out_clear = "none",
		ram_block3a_18.port_b_data_out_clock = "none",
		ram_block3a_18.port_b_data_width = 1,
		ram_block3a_18.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_18.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_18.port_b_first_address = 0,
		ram_block3a_18.port_b_first_bit_number = 18,
		ram_block3a_18.port_b_last_address = 31,
		ram_block3a_18.port_b_logical_ram_depth = 32,
		ram_block3a_18.port_b_logical_ram_width = 32,
		ram_block3a_18.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_18.ram_block_type = "AUTO",
		ram_block3a_18.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_19
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[19]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_19portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_19.connectivity_checking = "OFF",
		ram_block3a_19.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_19.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_19.operation_mode = "dual_port",
		ram_block3a_19.port_a_address_width = 5,
		ram_block3a_19.port_a_data_width = 1,
		ram_block3a_19.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_19.port_a_first_address = 0,
		ram_block3a_19.port_a_first_bit_number = 19,
		ram_block3a_19.port_a_last_address = 31,
		ram_block3a_19.port_a_logical_ram_depth = 32,
		ram_block3a_19.port_a_logical_ram_width = 32,
		ram_block3a_19.port_b_address_clock = "clock1",
		ram_block3a_19.port_b_address_width = 5,
		ram_block3a_19.port_b_data_out_clear = "none",
		ram_block3a_19.port_b_data_out_clock = "none",
		ram_block3a_19.port_b_data_width = 1,
		ram_block3a_19.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_19.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_19.port_b_first_address = 0,
		ram_block3a_19.port_b_first_bit_number = 19,
		ram_block3a_19.port_b_last_address = 31,
		ram_block3a_19.port_b_logical_ram_depth = 32,
		ram_block3a_19.port_b_logical_ram_width = 32,
		ram_block3a_19.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_19.ram_block_type = "AUTO",
		ram_block3a_19.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_20
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[20]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_20portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_20.connectivity_checking = "OFF",
		ram_block3a_20.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_20.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_20.operation_mode = "dual_port",
		ram_block3a_20.port_a_address_width = 5,
		ram_block3a_20.port_a_data_width = 1,
		ram_block3a_20.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_20.port_a_first_address = 0,
		ram_block3a_20.port_a_first_bit_number = 20,
		ram_block3a_20.port_a_last_address = 31,
		ram_block3a_20.port_a_logical_ram_depth = 32,
		ram_block3a_20.port_a_logical_ram_width = 32,
		ram_block3a_20.port_b_address_clock = "clock1",
		ram_block3a_20.port_b_address_width = 5,
		ram_block3a_20.port_b_data_out_clear = "none",
		ram_block3a_20.port_b_data_out_clock = "none",
		ram_block3a_20.port_b_data_width = 1,
		ram_block3a_20.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_20.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_20.port_b_first_address = 0,
		ram_block3a_20.port_b_first_bit_number = 20,
		ram_block3a_20.port_b_last_address = 31,
		ram_block3a_20.port_b_logical_ram_depth = 32,
		ram_block3a_20.port_b_logical_ram_width = 32,
		ram_block3a_20.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_20.ram_block_type = "AUTO",
		ram_block3a_20.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_21
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[21]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_21portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_21.connectivity_checking = "OFF",
		ram_block3a_21.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_21.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_21.operation_mode = "dual_port",
		ram_block3a_21.port_a_address_width = 5,
		ram_block3a_21.port_a_data_width = 1,
		ram_block3a_21.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_21.port_a_first_address = 0,
		ram_block3a_21.port_a_first_bit_number = 21,
		ram_block3a_21.port_a_last_address = 31,
		ram_block3a_21.port_a_logical_ram_depth = 32,
		ram_block3a_21.port_a_logical_ram_width = 32,
		ram_block3a_21.port_b_address_clock = "clock1",
		ram_block3a_21.port_b_address_width = 5,
		ram_block3a_21.port_b_data_out_clear = "none",
		ram_block3a_21.port_b_data_out_clock = "none",
		ram_block3a_21.port_b_data_width = 1,
		ram_block3a_21.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_21.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_21.port_b_first_address = 0,
		ram_block3a_21.port_b_first_bit_number = 21,
		ram_block3a_21.port_b_last_address = 31,
		ram_block3a_21.port_b_logical_ram_depth = 32,
		ram_block3a_21.port_b_logical_ram_width = 32,
		ram_block3a_21.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_21.ram_block_type = "AUTO",
		ram_block3a_21.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_22
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[22]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_22portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_22.connectivity_checking = "OFF",
		ram_block3a_22.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_22.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_22.operation_mode = "dual_port",
		ram_block3a_22.port_a_address_width = 5,
		ram_block3a_22.port_a_data_width = 1,
		ram_block3a_22.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_22.port_a_first_address = 0,
		ram_block3a_22.port_a_first_bit_number = 22,
		ram_block3a_22.port_a_last_address = 31,
		ram_block3a_22.port_a_logical_ram_depth = 32,
		ram_block3a_22.port_a_logical_ram_width = 32,
		ram_block3a_22.port_b_address_clock = "clock1",
		ram_block3a_22.port_b_address_width = 5,
		ram_block3a_22.port_b_data_out_clear = "none",
		ram_block3a_22.port_b_data_out_clock = "none",
		ram_block3a_22.port_b_data_width = 1,
		ram_block3a_22.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_22.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_22.port_b_first_address = 0,
		ram_block3a_22.port_b_first_bit_number = 22,
		ram_block3a_22.port_b_last_address = 31,
		ram_block3a_22.port_b_logical_ram_depth = 32,
		ram_block3a_22.port_b_logical_ram_width = 32,
		ram_block3a_22.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_22.ram_block_type = "AUTO",
		ram_block3a_22.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_23
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[23]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_23portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_23.connectivity_checking = "OFF",
		ram_block3a_23.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_23.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_23.operation_mode = "dual_port",
		ram_block3a_23.port_a_address_width = 5,
		ram_block3a_23.port_a_data_width = 1,
		ram_block3a_23.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_23.port_a_first_address = 0,
		ram_block3a_23.port_a_first_bit_number = 23,
		ram_block3a_23.port_a_last_address = 31,
		ram_block3a_23.port_a_logical_ram_depth = 32,
		ram_block3a_23.port_a_logical_ram_width = 32,
		ram_block3a_23.port_b_address_clock = "clock1",
		ram_block3a_23.port_b_address_width = 5,
		ram_block3a_23.port_b_data_out_clear = "none",
		ram_block3a_23.port_b_data_out_clock = "none",
		ram_block3a_23.port_b_data_width = 1,
		ram_block3a_23.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_23.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_23.port_b_first_address = 0,
		ram_block3a_23.port_b_first_bit_number = 23,
		ram_block3a_23.port_b_last_address = 31,
		ram_block3a_23.port_b_logical_ram_depth = 32,
		ram_block3a_23.port_b_logical_ram_width = 32,
		ram_block3a_23.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_23.ram_block_type = "AUTO",
		ram_block3a_23.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_24
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[24]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_24portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_24.connectivity_checking = "OFF",
		ram_block3a_24.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_24.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_24.operation_mode = "dual_port",
		ram_block3a_24.port_a_address_width = 5,
		ram_block3a_24.port_a_data_width = 1,
		ram_block3a_24.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_24.port_a_first_address = 0,
		ram_block3a_24.port_a_first_bit_number = 24,
		ram_block3a_24.port_a_last_address = 31,
		ram_block3a_24.port_a_logical_ram_depth = 32,
		ram_block3a_24.port_a_logical_ram_width = 32,
		ram_block3a_24.port_b_address_clock = "clock1",
		ram_block3a_24.port_b_address_width = 5,
		ram_block3a_24.port_b_data_out_clear = "none",
		ram_block3a_24.port_b_data_out_clock = "none",
		ram_block3a_24.port_b_data_width = 1,
		ram_block3a_24.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_24.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_24.port_b_first_address = 0,
		ram_block3a_24.port_b_first_bit_number = 24,
		ram_block3a_24.port_b_last_address = 31,
		ram_block3a_24.port_b_logical_ram_depth = 32,
		ram_block3a_24.port_b_logical_ram_width = 32,
		ram_block3a_24.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_24.ram_block_type = "AUTO",
		ram_block3a_24.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_25
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[25]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_25portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_25.connectivity_checking = "OFF",
		ram_block3a_25.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_25.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_25.operation_mode = "dual_port",
		ram_block3a_25.port_a_address_width = 5,
		ram_block3a_25.port_a_data_width = 1,
		ram_block3a_25.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_25.port_a_first_address = 0,
		ram_block3a_25.port_a_first_bit_number = 25,
		ram_block3a_25.port_a_last_address = 31,
		ram_block3a_25.port_a_logical_ram_depth = 32,
		ram_block3a_25.port_a_logical_ram_width = 32,
		ram_block3a_25.port_b_address_clock = "clock1",
		ram_block3a_25.port_b_address_width = 5,
		ram_block3a_25.port_b_data_out_clear = "none",
		ram_block3a_25.port_b_data_out_clock = "none",
		ram_block3a_25.port_b_data_width = 1,
		ram_block3a_25.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_25.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_25.port_b_first_address = 0,
		ram_block3a_25.port_b_first_bit_number = 25,
		ram_block3a_25.port_b_last_address = 31,
		ram_block3a_25.port_b_logical_ram_depth = 32,
		ram_block3a_25.port_b_logical_ram_width = 32,
		ram_block3a_25.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_25.ram_block_type = "AUTO",
		ram_block3a_25.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_26
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[26]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_26portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_26.connectivity_checking = "OFF",
		ram_block3a_26.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_26.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_26.operation_mode = "dual_port",
		ram_block3a_26.port_a_address_width = 5,
		ram_block3a_26.port_a_data_width = 1,
		ram_block3a_26.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_26.port_a_first_address = 0,
		ram_block3a_26.port_a_first_bit_number = 26,
		ram_block3a_26.port_a_last_address = 31,
		ram_block3a_26.port_a_logical_ram_depth = 32,
		ram_block3a_26.port_a_logical_ram_width = 32,
		ram_block3a_26.port_b_address_clock = "clock1",
		ram_block3a_26.port_b_address_width = 5,
		ram_block3a_26.port_b_data_out_clear = "none",
		ram_block3a_26.port_b_data_out_clock = "none",
		ram_block3a_26.port_b_data_width = 1,
		ram_block3a_26.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_26.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_26.port_b_first_address = 0,
		ram_block3a_26.port_b_first_bit_number = 26,
		ram_block3a_26.port_b_last_address = 31,
		ram_block3a_26.port_b_logical_ram_depth = 32,
		ram_block3a_26.port_b_logical_ram_width = 32,
		ram_block3a_26.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_26.ram_block_type = "AUTO",
		ram_block3a_26.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_27
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[27]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_27portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_27.connectivity_checking = "OFF",
		ram_block3a_27.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_27.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_27.operation_mode = "dual_port",
		ram_block3a_27.port_a_address_width = 5,
		ram_block3a_27.port_a_data_width = 1,
		ram_block3a_27.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_27.port_a_first_address = 0,
		ram_block3a_27.port_a_first_bit_number = 27,
		ram_block3a_27.port_a_last_address = 31,
		ram_block3a_27.port_a_logical_ram_depth = 32,
		ram_block3a_27.port_a_logical_ram_width = 32,
		ram_block3a_27.port_b_address_clock = "clock1",
		ram_block3a_27.port_b_address_width = 5,
		ram_block3a_27.port_b_data_out_clear = "none",
		ram_block3a_27.port_b_data_out_clock = "none",
		ram_block3a_27.port_b_data_width = 1,
		ram_block3a_27.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_27.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_27.port_b_first_address = 0,
		ram_block3a_27.port_b_first_bit_number = 27,
		ram_block3a_27.port_b_last_address = 31,
		ram_block3a_27.port_b_logical_ram_depth = 32,
		ram_block3a_27.port_b_logical_ram_width = 32,
		ram_block3a_27.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_27.ram_block_type = "AUTO",
		ram_block3a_27.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_28
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[28]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_28portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_28.connectivity_checking = "OFF",
		ram_block3a_28.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_28.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_28.operation_mode = "dual_port",
		ram_block3a_28.port_a_address_width = 5,
		ram_block3a_28.port_a_data_width = 1,
		ram_block3a_28.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_28.port_a_first_address = 0,
		ram_block3a_28.port_a_first_bit_number = 28,
		ram_block3a_28.port_a_last_address = 31,
		ram_block3a_28.port_a_logical_ram_depth = 32,
		ram_block3a_28.port_a_logical_ram_width = 32,
		ram_block3a_28.port_b_address_clock = "clock1",
		ram_block3a_28.port_b_address_width = 5,
		ram_block3a_28.port_b_data_out_clear = "none",
		ram_block3a_28.port_b_data_out_clock = "none",
		ram_block3a_28.port_b_data_width = 1,
		ram_block3a_28.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_28.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_28.port_b_first_address = 0,
		ram_block3a_28.port_b_first_bit_number = 28,
		ram_block3a_28.port_b_last_address = 31,
		ram_block3a_28.port_b_logical_ram_depth = 32,
		ram_block3a_28.port_b_logical_ram_width = 32,
		ram_block3a_28.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_28.ram_block_type = "AUTO",
		ram_block3a_28.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_29
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[29]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_29portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_29.connectivity_checking = "OFF",
		ram_block3a_29.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_29.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_29.operation_mode = "dual_port",
		ram_block3a_29.port_a_address_width = 5,
		ram_block3a_29.port_a_data_width = 1,
		ram_block3a_29.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_29.port_a_first_address = 0,
		ram_block3a_29.port_a_first_bit_number = 29,
		ram_block3a_29.port_a_last_address = 31,
		ram_block3a_29.port_a_logical_ram_depth = 32,
		ram_block3a_29.port_a_logical_ram_width = 32,
		ram_block3a_29.port_b_address_clock = "clock1",
		ram_block3a_29.port_b_address_width = 5,
		ram_block3a_29.port_b_data_out_clear = "none",
		ram_block3a_29.port_b_data_out_clock = "none",
		ram_block3a_29.port_b_data_width = 1,
		ram_block3a_29.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_29.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_29.port_b_first_address = 0,
		ram_block3a_29.port_b_first_bit_number = 29,
		ram_block3a_29.port_b_last_address = 31,
		ram_block3a_29.port_b_logical_ram_depth = 32,
		ram_block3a_29.port_b_logical_ram_width = 32,
		ram_block3a_29.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_29.ram_block_type = "AUTO",
		ram_block3a_29.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_30
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[30]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_30portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_30.connectivity_checking = "OFF",
		ram_block3a_30.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_30.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_30.operation_mode = "dual_port",
		ram_block3a_30.port_a_address_width = 5,
		ram_block3a_30.port_a_data_width = 1,
		ram_block3a_30.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_30.port_a_first_address = 0,
		ram_block3a_30.port_a_first_bit_number = 30,
		ram_block3a_30.port_a_last_address = 31,
		ram_block3a_30.port_a_logical_ram_depth = 32,
		ram_block3a_30.port_a_logical_ram_width = 32,
		ram_block3a_30.port_b_address_clock = "clock1",
		ram_block3a_30.port_b_address_width = 5,
		ram_block3a_30.port_b_data_out_clear = "none",
		ram_block3a_30.port_b_data_out_clock = "none",
		ram_block3a_30.port_b_data_width = 1,
		ram_block3a_30.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_30.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_30.port_b_first_address = 0,
		ram_block3a_30.port_b_first_bit_number = 30,
		ram_block3a_30.port_b_last_address = 31,
		ram_block3a_30.port_b_logical_ram_depth = 32,
		ram_block3a_30.port_b_logical_ram_width = 32,
		ram_block3a_30.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_30.ram_block_type = "AUTO",
		ram_block3a_30.lpm_type = "stratixii_ram_block";
	stratixii_ram_block   ram_block3a_31
	(
	.clk0(clock0),
	.clk1(clock1),
	.ena0(wren_a),
	.ena1(clocken1),
	.portaaddr({address_a_wire[4:0]}),
	.portadatain({data_a[31]}),
	.portadataout(),
	.portawe(wren_a),
	.portbaddr({address_b_wire[4:0]}),
	.portbdataout(wire_ram_block3a_31portbdataout[0:0]),
	.portbrewe(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clr0(1'b0),
	.clr1(1'b0),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}})
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
		ram_block3a_31.connectivity_checking = "OFF",
		ram_block3a_31.logical_ram_name = "ALTSYNCRAM",
		ram_block3a_31.mixed_port_feed_through_mode = "dont_care",
		ram_block3a_31.operation_mode = "dual_port",
		ram_block3a_31.port_a_address_width = 5,
		ram_block3a_31.port_a_data_width = 1,
		ram_block3a_31.port_a_disable_ce_on_input_registers = "off",
		ram_block3a_31.port_a_first_address = 0,
		ram_block3a_31.port_a_first_bit_number = 31,
		ram_block3a_31.port_a_last_address = 31,
		ram_block3a_31.port_a_logical_ram_depth = 32,
		ram_block3a_31.port_a_logical_ram_width = 32,
		ram_block3a_31.port_b_address_clock = "clock1",
		ram_block3a_31.port_b_address_width = 5,
		ram_block3a_31.port_b_data_out_clear = "none",
		ram_block3a_31.port_b_data_out_clock = "none",
		ram_block3a_31.port_b_data_width = 1,
		ram_block3a_31.port_b_disable_ce_on_input_registers = "off",
		ram_block3a_31.port_b_disable_ce_on_output_registers = "on",
		ram_block3a_31.port_b_first_address = 0,
		ram_block3a_31.port_b_first_bit_number = 31,
		ram_block3a_31.port_b_last_address = 31,
		ram_block3a_31.port_b_logical_ram_depth = 32,
		ram_block3a_31.port_b_logical_ram_width = 32,
		ram_block3a_31.port_b_read_enable_write_enable_clock = "clock1",
		ram_block3a_31.ram_block_type = "AUTO",
		ram_block3a_31.lpm_type = "stratixii_ram_block";
	assign
		address_a_wire = address_a,
		address_b_wire = address_b,
		q_b = {wire_ram_block3a_31portbdataout[0], wire_ram_block3a_30portbdataout[0], wire_ram_block3a_29portbdataout[0], wire_ram_block3a_28portbdataout[0], wire_ram_block3a_27portbdataout[0], wire_ram_block3a_26portbdataout[0], wire_ram_block3a_25portbdataout[0], wire_ram_block3a_24portbdataout[0], wire_ram_block3a_23portbdataout[0], wire_ram_block3a_22portbdataout[0], wire_ram_block3a_21portbdataout[0], wire_ram_block3a_20portbdataout[0], wire_ram_block3a_19portbdataout[0], wire_ram_block3a_18portbdataout[0], wire_ram_block3a_17portbdataout[0], wire_ram_block3a_16portbdataout[0], wire_ram_block3a_15portbdataout[0], wire_ram_block3a_14portbdataout[0], wire_ram_block3a_13portbdataout[0], wire_ram_block3a_12portbdataout[0], wire_ram_block3a_11portbdataout[0], wire_ram_block3a_10portbdataout[0], wire_ram_block3a_9portbdataout[0], wire_ram_block3a_8portbdataout[0], wire_ram_block3a_7portbdataout[0], wire_ram_block3a_6portbdataout[0], wire_ram_block3a_5portbdataout[0], wire_ram_block3a_4portbdataout[0], wire_ram_block3a_3portbdataout[0], wire_ram_block3a_2portbdataout[0], wire_ram_block3a_1portbdataout[0], wire_ram_block3a_0portbdataout[0]};
endmodule