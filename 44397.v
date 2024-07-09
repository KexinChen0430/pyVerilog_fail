module altera_up_video_128_character_rom (
	// Inputs
	clk,
	clk_en,
	character,
	x_coordinate,
	y_coordinate,
	// Bidirectionals
	// Outputs
	character_data
);
/*****************************************************************************
/*****************************************************************************
// Inputs
input						clk;
input						clk_en;
input			[ 6: 0]	character;
input			[ 2: 0]	x_coordinate;
input			[ 2: 0]	y_coordinate;
// Bidirectionals
// Outputs
output					character_data;
/*****************************************************************************
/*****************************************************************************
// Internal Wires
wire			[12: 0]	character_address;
// Internal Registers
// State Machine Registers
/*****************************************************************************
/*****************************************************************************
/*****************************************************************************
assign character_address = {character, y_coordinate, x_coordinate};
/*****************************************************************************
altsyncram	character_data_rom (
	// Inputs
	.clock0				(clk),
	.clocken0			(clk_en),
	.address_a			(character_address),
	// Bidirectionals
	// Outputs
	.q_a					(character_data),
	// Unused
	.aclr0				(1'b0),
	.aclr1				(1'b0),
	.q_b					(),
	.clocken1			(1'b1),
	.data_b				(1'b1),
	.wren_a				(1'b0),
	.data_a				(1'b1),
	.rden_b				(1'b1),
	.address_b			(1'b1),
	.wren_b				(1'b0),
	.byteena_b			(1'b1),
	.addressstall_a	(1'b0),
	.byteena_a			(1'b1),
	.addressstall_b	(1'b0),
	.clock1				(1'b1)
);
defparam
	character_data_rom.clock_enable_input_a 					= "NORMAL",
	character_data_rom.clock_enable_output_a	 				= "NORMAL",
	character_data_rom.init_file 									= "altera_up_video_char_mode_rom_128.mif",
	character_data_rom.intended_device_family 				= "Cyclone II",
	character_data_rom.lpm_hint 									= "ENABLE_RUNTIME_MOD=NO",
	character_data_rom.lpm_type			 						= "altsyncram",
	character_data_rom.numwords_a						 			= 8192,
	character_data_rom.operation_mode	 						= "ROM",
	character_data_rom.outdata_aclr_a 							= "NONE",
	character_data_rom.outdata_reg_a 							= "CLOCK0",
	character_data_rom.power_up_uninitialized 				= "FALSE",
	character_data_rom.read_during_write_mode_mixed_ports = "DONT_CARE",
	character_data_rom.widthad_a 									= 13,
	character_data_rom.width_a 									= 1,
	character_data_rom.width_byteena_a							= 1;
endmodule