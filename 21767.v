module altera_up_video_fb_color_rom (
	// Inputs
	clk,
	clk_en,
	color_index,
	// Bidirectionals
	// Outputs
	red,
	green,
	blue
);
/*****************************************************************************
/*****************************************************************************
// Inputs
input						clk;
input						clk_en;
input			[ 3: 0]	color_index;
// Bidirectionals
// Outputs
output		[ 9: 0]	red;
output		[ 9: 0]	green;
output		[ 9: 0]	blue;
/*****************************************************************************
/*****************************************************************************
// Internal Wires
wire			[29: 0]	color_data;
// Internal Registers
// State Machine Registers
/*****************************************************************************
/*****************************************************************************
/*****************************************************************************
assign red		= color_data[29:20];
assign green	= color_data[19:10];
assign blue		= color_data[ 9: 0];
/*****************************************************************************
altsyncram	color_data_rom (
	// Inputs
	.clock0				(clk),
	.clocken0			(clk_en),
	.address_a			(color_index),
	// Bidirectionals
	// Outputs
	.q_a					(color_data),
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
	color_data_rom.clock_enable_input_a						= "NORMAL",
	color_data_rom.clock_enable_output_a					= "NORMAL",
	color_data_rom.init_file					= "altera_up_video_fb_color_rom.mif",
	color_data_rom.intended_device_family					= "Cyclone II",
	color_data_rom.lpm_hint										= "ENABLE_RUNTIME_MOD=NO",
	color_data_rom.lpm_type										= "altsyncram",
	color_data_rom.numwords_a									= 16,
	color_data_rom.operation_mode								= "ROM",
	color_data_rom.outdata_aclr_a								= "NONE",
	color_data_rom.outdata_reg_a								= "CLOCK0",
	color_data_rom.power_up_uninitialized					= "FALSE",
	color_data_rom.read_during_write_mode_mixed_ports	= "DONT_CARE",
	color_data_rom.widthad_a									= 4,
	color_data_rom.width_a										= 30,
	color_data_rom.width_byteena_a							= 1;
endmodule