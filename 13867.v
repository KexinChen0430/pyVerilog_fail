module Raster_Laser_Projector_Video_In_video_scaler_0 (
	// Inputs
	clk,
	reset,
	stream_in_data,
	stream_in_startofpacket,
	stream_in_endofpacket,
	stream_in_empty,
	stream_in_valid,
	stream_out_ready,
	// Bidirectional
	// Outputs
	stream_in_ready,
	stream_out_channel,
	stream_out_data,
	stream_out_startofpacket,
	stream_out_endofpacket,
	stream_out_empty,
	stream_out_valid
);
/*****************************************************************************
parameter CW					= 0; // Frame's Channel Width
parameter DW					= 7; // Frame's Data Width
parameter EW					= 0; // Frame's Empty Width
parameter WIW					= 9; // Incoming frame's width's address width
parameter HIW					= 7; // Incoming frame's height's address width
parameter WIDTH_IN			= 640;
parameter WIDTH_DROP_MASK	= 4'b0000;
parameter HEIGHT_DROP_MASK	= 4'b0000;
parameter MH_WW				= 9; // Multiply height's incoming width's address width
parameter MH_WIDTH_IN		= 640; // Multiply height's incoming width
parameter MH_CW				= 0; // Multiply height's counter width
parameter MW_CW				= 0; // Multiply width's counter width
/*****************************************************************************
// Inputs
input						clk;
input						reset;
input			[DW: 0]	stream_in_data;
input						stream_in_startofpacket;
input						stream_in_endofpacket;
input			[EW: 0]	stream_in_empty;
input						stream_in_valid;
input						stream_out_ready;
// Bidirectional
// Outputs
output					stream_in_ready;
output		[CW: 0]	stream_out_channel;
output		[DW: 0]	stream_out_data;
output					stream_out_startofpacket;
output					stream_out_endofpacket;
output		[EW: 0]	stream_out_empty;
output					stream_out_valid;
/*****************************************************************************
/*****************************************************************************
// Internal Wires
wire			[CW: 0]	internal_channel;
wire			[DW: 0]	internal_data;
wire						internal_startofpacket;
wire						internal_endofpacket;
wire						internal_valid;
wire						internal_ready;
// Internal Registers
// State Machine Registers
// Integers
/*****************************************************************************
/*****************************************************************************
// Output Registers
// Internal Registers
/*****************************************************************************
// Output Assignments
assign stream_out_empty		= 'h0;
// Internal Assignments
/*****************************************************************************
altera_up_video_scaler_multiply_height Multiply_Height (
	// Inputs
	.clk								(clk),
	.reset							(reset),
	.stream_in_data				(stream_in_data),
	.stream_in_startofpacket	(stream_in_startofpacket),
	.stream_in_endofpacket		(stream_in_endofpacket),
	.stream_in_valid				(stream_in_valid),
	.stream_out_ready				(stream_out_ready),
	// Bi-Directional
	// Outputs
	.stream_in_ready				(stream_in_ready),
	.stream_out_channel			(stream_out_channel),
	.stream_out_data				(stream_out_data),
	.stream_out_startofpacket	(stream_out_startofpacket),
	.stream_out_endofpacket		(stream_out_endofpacket),
	.stream_out_valid				(stream_out_valid)
);
defparam
	Multiply_Height.DW		= DW,
	Multiply_Height.WW		= MH_WW,
	Multiply_Height.WIDTH	= MH_WIDTH_IN,
	Multiply_Height.MCW		= MH_CW;
endmodule