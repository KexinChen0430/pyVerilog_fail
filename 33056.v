module Raster_Laser_Projector_Video_In_video_csc (
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
parameter IW 	= 23;
parameter OW 	= 23;
parameter EIW 	= 1;
parameter EOW 	= 1;
/*****************************************************************************
// Inputs
input						clk;
input						reset;
input			[IW: 0]	stream_in_data;
input						stream_in_startofpacket;
input						stream_in_endofpacket;
input			[EIW:0]	stream_in_empty;
input						stream_in_valid;
input						stream_out_ready;
// Bidirectional
// Outputs
output					stream_in_ready;
output reg	[OW: 0]	stream_out_data;
output reg				stream_out_startofpacket;
output reg				stream_out_endofpacket;
output reg	[EOW:0]	stream_out_empty;
output reg				stream_out_valid;
/*****************************************************************************
/*****************************************************************************
// Internal Wires
wire						transfer_data;
wire			[OW: 0]	converted_data;
wire						converted_startofpacket;
wire						converted_endofpacket;
wire			[EOW:0]	converted_empty;
wire						converted_valid;
// Internal Registers
reg			[IW: 0]	data;
reg						startofpacket;
reg						endofpacket;
reg			[EIW:0]	empty;
reg						valid;
// State Machine Registers
// Integers
/*****************************************************************************
/*****************************************************************************
// Output Registers
always @(posedge clk)
begin
	if (reset)
	begin
		stream_out_data				<=  'h0;
		stream_out_startofpacket	<= 1'b0;
		stream_out_endofpacket		<= 1'b0;
		stream_out_empty				<= 2'h0;
		stream_out_valid				<= 1'b0;
	end
	else if (transfer_data)
	begin
		stream_out_data				<= converted_data;
		stream_out_startofpacket	<= converted_startofpacket;
		stream_out_endofpacket		<= converted_endofpacket;
		stream_out_empty				<= converted_empty;
		stream_out_valid				<= converted_valid;
	end
end
// Internal Registers
always @(posedge clk)
begin
	if (reset)
	begin
		data								<=	'h0;
		startofpacket					<= 1'b0;
		endofpacket						<= 1'b0;
		empty								<=  'h0;
		valid								<= 1'b0;
	end
	else if (stream_in_ready)
	begin
		data								<= stream_in_data;
		startofpacket					<= stream_in_startofpacket;
		endofpacket						<= stream_in_endofpacket;
		empty								<= stream_in_empty;
		valid								<= stream_in_valid;
	end
	else if (transfer_data)
	begin
		data								<=  'b0;
		startofpacket					<= 1'b0;
		endofpacket						<= 1'b0;
		empty								<=  'h0;
		valid								<= 1'b0;
	end
end
/*****************************************************************************
// Output Assignments
assign stream_in_ready 				= stream_in_valid & (~valid | transfer_data);
// Internal Assignments
assign transfer_data					= ~stream_out_valid |
												(stream_out_ready & stream_out_valid);
/*****************************************************************************
altera_up_YCrCb_to_RGB_converter YCrCb_to_RGB (
	// Inputs
	.clk								(clk),
	.clk_en							(transfer_data),
	.reset							(reset),
	.Y									(data[ 7: 0]),
	.Cr								(data[23:16]),
	.Cb								(data[15: 8]),
	.stream_in_startofpacket	(startofpacket),
	.stream_in_endofpacket		(endofpacket),
	.stream_in_empty				(empty),
	.stream_in_valid				(valid),
	// Bidirectionals
	// Outputs
	.R									(converted_data[23:16]),
	.G									(converted_data[15: 8]),
	.B									(converted_data[ 7: 0]),
	.stream_out_startofpacket	(converted_startofpacket),
	.stream_out_endofpacket		(converted_endofpacket),
	.stream_out_empty				(converted_empty),
	.stream_out_valid				(converted_valid)
);
endmodule