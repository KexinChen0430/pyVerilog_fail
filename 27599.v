module  frac_rom_altsyncram
	(
	address_a,
	clock0,
	q_a) /* synthesis synthesis_clearbox=1 */;
	input   [3:0]  address_a;
	input   clock0;
	output   [7:0]  q_a;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   clock0;
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
	wire  [3:0]  address_a_wire;
	cycloneii_ram_block   ram_block1a_0
	(
	.clk0(clock0),
	.portaaddr({address_a_wire[3:0]}),
	.portadataout(wire_ram_block1a_0portadataout[0:0]),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portadatain({1{1'b0}}),
	.portawe(1'b0),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbrewe(1'b0)
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
		ram_block1a_0.init_file = "qrom.hex",
		ram_block1a_0.init_file_layout = "port_a",
		ram_block1a_0.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_0.mem_init0 = 16'hDE9F,
		ram_block1a_0.operation_mode = "rom",
		ram_block1a_0.port_a_address_width = 4,
		ram_block1a_0.port_a_data_out_clear = "none",
		ram_block1a_0.port_a_data_out_clock = "clock0",
		ram_block1a_0.port_a_data_width = 1,
		ram_block1a_0.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_0.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_0.port_a_first_address = 0,
		ram_block1a_0.port_a_first_bit_number = 0,
		ram_block1a_0.port_a_last_address = 15,
		ram_block1a_0.port_a_logical_ram_depth = 16,
		ram_block1a_0.port_a_logical_ram_width = 8,
		ram_block1a_0.ram_block_type = "AUTO",
		ram_block1a_0.lpm_type = "cycloneii_ram_block";
	cycloneii_ram_block   ram_block1a_1
	(
	.clk0(clock0),
	.portaaddr({address_a_wire[3:0]}),
	.portadataout(wire_ram_block1a_1portadataout[0:0]),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portadatain({1{1'b0}}),
	.portawe(1'b0),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbrewe(1'b0)
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
		ram_block1a_1.init_file = "qrom.hex",
		ram_block1a_1.init_file_layout = "port_a",
		ram_block1a_1.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_1.mem_init0 = 16'hB4BB,
		ram_block1a_1.operation_mode = "rom",
		ram_block1a_1.port_a_address_width = 4,
		ram_block1a_1.port_a_data_out_clear = "none",
		ram_block1a_1.port_a_data_out_clock = "clock0",
		ram_block1a_1.port_a_data_width = 1,
		ram_block1a_1.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_1.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_1.port_a_first_address = 0,
		ram_block1a_1.port_a_first_bit_number = 1,
		ram_block1a_1.port_a_last_address = 15,
		ram_block1a_1.port_a_logical_ram_depth = 16,
		ram_block1a_1.port_a_logical_ram_width = 8,
		ram_block1a_1.ram_block_type = "AUTO",
		ram_block1a_1.lpm_type = "cycloneii_ram_block";
	cycloneii_ram_block   ram_block1a_2
	(
	.clk0(clock0),
	.portaaddr({address_a_wire[3:0]}),
	.portadataout(wire_ram_block1a_2portadataout[0:0]),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portadatain({1{1'b0}}),
	.portawe(1'b0),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbrewe(1'b0)
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
		ram_block1a_2.init_file = "qrom.hex",
		ram_block1a_2.init_file_layout = "port_a",
		ram_block1a_2.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_2.mem_init0 = 16'h8DCF,
		ram_block1a_2.operation_mode = "rom",
		ram_block1a_2.port_a_address_width = 4,
		ram_block1a_2.port_a_data_out_clear = "none",
		ram_block1a_2.port_a_data_out_clock = "clock0",
		ram_block1a_2.port_a_data_width = 1,
		ram_block1a_2.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_2.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_2.port_a_first_address = 0,
		ram_block1a_2.port_a_first_bit_number = 2,
		ram_block1a_2.port_a_last_address = 15,
		ram_block1a_2.port_a_logical_ram_depth = 16,
		ram_block1a_2.port_a_logical_ram_width = 8,
		ram_block1a_2.ram_block_type = "AUTO",
		ram_block1a_2.lpm_type = "cycloneii_ram_block";
	cycloneii_ram_block   ram_block1a_3
	(
	.clk0(clock0),
	.portaaddr({address_a_wire[3:0]}),
	.portadataout(wire_ram_block1a_3portadataout[0:0]),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portadatain({1{1'b0}}),
	.portawe(1'b0),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbrewe(1'b0)
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
		ram_block1a_3.init_file = "qrom.hex",
		ram_block1a_3.init_file_layout = "port_a",
		ram_block1a_3.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_3.mem_init0 = 16'h83AB,
		ram_block1a_3.operation_mode = "rom",
		ram_block1a_3.port_a_address_width = 4,
		ram_block1a_3.port_a_data_out_clear = "none",
		ram_block1a_3.port_a_data_out_clock = "clock0",
		ram_block1a_3.port_a_data_width = 1,
		ram_block1a_3.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_3.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_3.port_a_first_address = 0,
		ram_block1a_3.port_a_first_bit_number = 3,
		ram_block1a_3.port_a_last_address = 15,
		ram_block1a_3.port_a_logical_ram_depth = 16,
		ram_block1a_3.port_a_logical_ram_width = 8,
		ram_block1a_3.ram_block_type = "AUTO",
		ram_block1a_3.lpm_type = "cycloneii_ram_block";
	cycloneii_ram_block   ram_block1a_4
	(
	.clk0(clock0),
	.portaaddr({address_a_wire[3:0]}),
	.portadataout(wire_ram_block1a_4portadataout[0:0]),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portadatain({1{1'b0}}),
	.portawe(1'b0),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbrewe(1'b0)
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
		ram_block1a_4.init_file = "qrom.hex",
		ram_block1a_4.init_file_layout = "port_a",
		ram_block1a_4.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_4.mem_init0 = 16'h7F9F,
		ram_block1a_4.operation_mode = "rom",
		ram_block1a_4.port_a_address_width = 4,
		ram_block1a_4.port_a_data_out_clear = "none",
		ram_block1a_4.port_a_data_out_clock = "clock0",
		ram_block1a_4.port_a_data_width = 1,
		ram_block1a_4.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_4.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_4.port_a_first_address = 0,
		ram_block1a_4.port_a_first_bit_number = 4,
		ram_block1a_4.port_a_last_address = 15,
		ram_block1a_4.port_a_logical_ram_depth = 16,
		ram_block1a_4.port_a_logical_ram_width = 8,
		ram_block1a_4.ram_block_type = "AUTO",
		ram_block1a_4.lpm_type = "cycloneii_ram_block";
	cycloneii_ram_block   ram_block1a_5
	(
	.clk0(clock0),
	.portaaddr({address_a_wire[3:0]}),
	.portadataout(wire_ram_block1a_5portadataout[0:0]),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portadatain({1{1'b0}}),
	.portawe(1'b0),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbrewe(1'b0)
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
		ram_block1a_5.init_file = "qrom.hex",
		ram_block1a_5.init_file_layout = "port_a",
		ram_block1a_5.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_5.mem_init0 = 16'h007B,
		ram_block1a_5.operation_mode = "rom",
		ram_block1a_5.port_a_address_width = 4,
		ram_block1a_5.port_a_data_out_clear = "none",
		ram_block1a_5.port_a_data_out_clock = "clock0",
		ram_block1a_5.port_a_data_width = 1,
		ram_block1a_5.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_5.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_5.port_a_first_address = 0,
		ram_block1a_5.port_a_first_bit_number = 5,
		ram_block1a_5.port_a_last_address = 15,
		ram_block1a_5.port_a_logical_ram_depth = 16,
		ram_block1a_5.port_a_logical_ram_width = 8,
		ram_block1a_5.ram_block_type = "AUTO",
		ram_block1a_5.lpm_type = "cycloneii_ram_block";
	cycloneii_ram_block   ram_block1a_6
	(
	.clk0(clock0),
	.portaaddr({address_a_wire[3:0]}),
	.portadataout(wire_ram_block1a_6portadataout[0:0]),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portadatain({1{1'b0}}),
	.portawe(1'b0),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbrewe(1'b0)
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
		ram_block1a_6.init_file = "qrom.hex",
		ram_block1a_6.init_file_layout = "port_a",
		ram_block1a_6.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_6.mem_init0 = 16'h0007,
		ram_block1a_6.operation_mode = "rom",
		ram_block1a_6.port_a_address_width = 4,
		ram_block1a_6.port_a_data_out_clear = "none",
		ram_block1a_6.port_a_data_out_clock = "clock0",
		ram_block1a_6.port_a_data_width = 1,
		ram_block1a_6.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_6.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_6.port_a_first_address = 0,
		ram_block1a_6.port_a_first_bit_number = 6,
		ram_block1a_6.port_a_last_address = 15,
		ram_block1a_6.port_a_logical_ram_depth = 16,
		ram_block1a_6.port_a_logical_ram_width = 8,
		ram_block1a_6.ram_block_type = "AUTO",
		ram_block1a_6.lpm_type = "cycloneii_ram_block";
	cycloneii_ram_block   ram_block1a_7
	(
	.clk0(clock0),
	.portaaddr({address_a_wire[3:0]}),
	.portadataout(wire_ram_block1a_7portadataout[0:0]),
	.portbdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1(1'b0),
	.clr0(1'b0),
	.clr1(1'b0),
	.ena0(1'b1),
	.ena1(1'b1),
	.portaaddrstall(1'b0),
	.portabyteenamasks({1{1'b1}}),
	.portadatain({1{1'b0}}),
	.portawe(1'b0),
	.portbaddr({1{1'b0}}),
	.portbaddrstall(1'b0),
	.portbbyteenamasks({1{1'b1}}),
	.portbdatain({1{1'b0}}),
	.portbrewe(1'b0)
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
		ram_block1a_7.init_file = "qrom.hex",
		ram_block1a_7.init_file_layout = "port_a",
		ram_block1a_7.logical_ram_name = "ALTSYNCRAM",
		ram_block1a_7.mem_init0 = 16'h0001,
		ram_block1a_7.operation_mode = "rom",
		ram_block1a_7.port_a_address_width = 4,
		ram_block1a_7.port_a_data_out_clear = "none",
		ram_block1a_7.port_a_data_out_clock = "clock0",
		ram_block1a_7.port_a_data_width = 1,
		ram_block1a_7.port_a_disable_ce_on_input_registers = "on",
		ram_block1a_7.port_a_disable_ce_on_output_registers = "on",
		ram_block1a_7.port_a_first_address = 0,
		ram_block1a_7.port_a_first_bit_number = 7,
		ram_block1a_7.port_a_last_address = 15,
		ram_block1a_7.port_a_logical_ram_depth = 16,
		ram_block1a_7.port_a_logical_ram_width = 8,
		ram_block1a_7.ram_block_type = "AUTO",
		ram_block1a_7.lpm_type = "cycloneii_ram_block";
	assign
		address_a_wire = address_a,
		q_a = {wire_ram_block1a_7portadataout[0], wire_ram_block1a_6portadataout[0], wire_ram_block1a_5portadataout[0], wire_ram_block1a_4portadataout[0], wire_ram_block1a_3portadataout[0], wire_ram_block1a_2portadataout[0], wire_ram_block1a_1portadataout[0], wire_ram_block1a_0portadataout[0]};
endmodule