module nios_system_video_clipper_0 (
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
	stream_out_data,
	stream_out_startofpacket,
	stream_out_endofpacket,
	stream_out_empty,
	stream_out_valid
);
/*****************************************************************************
parameter DW							= 29; // Frame's data width
parameter EW							= 1; // Frame's empty width
parameter WIDTH_IN					= 640; // Incoming frame's width in pixels
parameter HEIGHT_IN					= 480; // Incoming frame's height in lines
parameter WW_IN						= 9; // Incoming frame's width's address width
parameter HW_IN						= 8; // Incoming frame's height's address width
parameter DROP_PIXELS_AT_START	= 192;
parameter DROP_PIXELS_AT_END		= 192;
parameter DROP_LINES_AT_START		= 120;
parameter DROP_LINES_AT_END		= 120;
parameter WIDTH_OUT					= 256; // Final frame's width in pixels
parameter HEIGHT_OUT					= 240; // Final frame's height in lines
parameter WW_OUT						= 7; // Final frame's width's address width
parameter HW_OUT						= 7; // Final frame's height's address width
parameter ADD_PIXELS_AT_START		= 0;
parameter ADD_PIXELS_AT_END		= 0;
parameter ADD_LINES_AT_START		= 0;
parameter ADD_LINES_AT_END			= 0;
parameter ADD_DATA					= 30'd0; // Data value for added pixels
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
output		[DW: 0]	stream_out_data;
output					stream_out_startofpacket;
output					stream_out_endofpacket;
output		[EW: 0]	stream_out_empty;
output					stream_out_valid;
/*****************************************************************************
/*****************************************************************************
// Internal Wires
wire			[DW: 0]	internal_data;
wire						internal_startofpacket;
wire						internal_endofpacket;
wire			[EW: 0]	internal_empty;
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
// Internal Assignments
/*****************************************************************************
altera_up_video_clipper_drop Clipper_Drop (
	// Inputs
	.clk								(clk),
	.reset							(reset),
	.stream_in_data				(stream_in_data),
	.stream_in_startofpacket	(stream_in_startofpacket),
	.stream_in_endofpacket		(stream_in_endofpacket),
	.stream_in_empty				(stream_in_empty),
	.stream_in_valid				(stream_in_valid),
	.stream_out_ready				(internal_ready),
	// Bidirectional
	// Outputs
	.stream_in_ready				(stream_in_ready),
	.stream_out_data				(internal_data),
	.stream_out_startofpacket	(internal_startofpacket),
	.stream_out_endofpacket		(internal_endofpacket),
	.stream_out_empty				(internal_empty),
	.stream_out_valid				(internal_valid)
);
defparam
	Clipper_Drop.DW							= DW,
	Clipper_Drop.EW							= EW,
	Clipper_Drop.IMAGE_WIDTH				= WIDTH_IN,
	Clipper_Drop.IMAGE_HEIGHT				= HEIGHT_IN,
	Clipper_Drop.WW							= WW_IN,
	Clipper_Drop.HW							= HW_IN,
	Clipper_Drop.DROP_PIXELS_AT_START	= DROP_PIXELS_AT_START,
	Clipper_Drop.DROP_PIXELS_AT_END		= DROP_PIXELS_AT_END,
	Clipper_Drop.DROP_LINES_AT_START		= DROP_LINES_AT_START,
	Clipper_Drop.DROP_LINES_AT_END 		= DROP_LINES_AT_END,
	Clipper_Drop.ADD_DATA					= ADD_DATA;
altera_up_video_clipper_add Clipper_Add (
	// Inputs
	.clk								(clk),
	.reset							(reset),
	.stream_in_data				(internal_data),
	.stream_in_startofpacket	(internal_startofpacket),
	.stream_in_endofpacket		(internal_endofpacket),
	.stream_in_empty				(internal_empty),
	.stream_in_valid				(internal_valid),
	.stream_out_ready				(stream_out_ready),
	// Bidirectional
	// Outputs
	.stream_in_ready				(internal_ready),
	.stream_out_data				(stream_out_data),
	.stream_out_startofpacket	(stream_out_startofpacket),
	.stream_out_endofpacket		(stream_out_endofpacket),
	.stream_out_empty				(stream_out_empty),
	.stream_out_valid				(stream_out_valid)
);
defparam
	Clipper_Add.DW							= DW,
	Clipper_Add.EW							= EW,
	Clipper_Add.IMAGE_WIDTH				= WIDTH_OUT,
	Clipper_Add.IMAGE_HEIGHT			= HEIGHT_OUT,
	Clipper_Add.WW							= WW_OUT,
	Clipper_Add.HW							= HW_OUT,
	Clipper_Add.ADD_PIXELS_AT_START	= ADD_PIXELS_AT_START,
	Clipper_Add.ADD_PIXELS_AT_END		= ADD_PIXELS_AT_END,
	Clipper_Add.ADD_LINES_AT_START	= ADD_LINES_AT_START,
	Clipper_Add.ADD_LINES_AT_END 		= ADD_LINES_AT_END,
	Clipper_Add.ADD_DATA					= ADD_DATA;
endmodule