module altera_up_video_clipper_counters (
	// Inputs
	clk,
	reset,
	increment_counters,
	// Bi-Directional
	// Outputs
	start_of_outer_frame,
	end_of_outer_frame,
	start_of_inner_frame,
	end_of_inner_frame,
	inner_frame_valid
);
/*****************************************************************************
parameter IMAGE_WIDTH	= 640; // Final image width in pixels
parameter IMAGE_HEIGHT	= 480; // Final image height in lines
parameter WW				=   9; // Final image width address width
parameter HW				=   8; // Final image height address width
parameter LEFT_OFFSET	=   0;
parameter RIGHT_OFFSET	=   0;
parameter TOP_OFFSET		=   0;
parameter BOTTOM_OFFSET	=   0;
/*****************************************************************************
// Inputs
input						clk;
input						reset;
input						increment_counters;
// Bi-Directional
// Outputs
output					start_of_outer_frame;
output					end_of_outer_frame;
output					start_of_inner_frame;
output					end_of_inner_frame;
output					inner_frame_valid;
/*****************************************************************************
/*****************************************************************************
// Internal Wires
// Internal Registers
reg			[WW: 0]	width;
reg			[HW: 0]	height;
reg						inner_width_valid;
reg						inner_height_valid;
// State Machine Registers
/*****************************************************************************
/*****************************************************************************
// Output registers
// Internal registers
always @(posedge clk)
begin
	if (reset)
		width <= 'h0;
	else if (increment_counters & (width == (IMAGE_WIDTH - 1)))
		width <= 'h0;
	else if (increment_counters)
		width <= width + 1;
end
always @(posedge clk)
begin
	if (reset)
		height <= 'h0;
	else if (increment_counters & (width == (IMAGE_WIDTH - 1)))
	begin
		if (height == (IMAGE_HEIGHT - 1))
			height <= 'h0;
		else
			height <= height + 1;
	end
end
always @(posedge clk)
begin
	if (reset)
		inner_width_valid <= (LEFT_OFFSET == 0);
	else if (increment_counters)
	begin
		if (width == (IMAGE_WIDTH - 1))
			inner_width_valid <= (LEFT_OFFSET == 0);
		else if (width == (IMAGE_WIDTH - RIGHT_OFFSET - 1))
			inner_width_valid <= 1'b0;
		else if (width == (LEFT_OFFSET - 1))
			inner_width_valid <= 1'b1;
	end
end
always @(posedge clk)
begin
	if (reset)
		inner_height_valid <= (TOP_OFFSET == 0);
	else if (increment_counters & (width == (IMAGE_WIDTH - 1)))
	begin
		if (height == (IMAGE_HEIGHT - 1))
			inner_height_valid <= (TOP_OFFSET == 0);
		else if (height == (IMAGE_HEIGHT - BOTTOM_OFFSET - 1))
			inner_height_valid <= 1'b0;
		else if (height == (TOP_OFFSET - 1))
			inner_height_valid <= 1'b1;
	end
end
/*****************************************************************************
// Output assignments
assign start_of_outer_frame	=	(width == 'h0) & (height == 'h0);
assign end_of_outer_frame		=	(width == (IMAGE_WIDTH - 1)) &
											(height == (IMAGE_HEIGHT - 1));
assign start_of_inner_frame	=	(width == LEFT_OFFSET) &
											(height == TOP_OFFSET);
assign end_of_inner_frame		=	(width == (IMAGE_WIDTH - RIGHT_OFFSET - 1)) &
											(height == (IMAGE_HEIGHT - BOTTOM_OFFSET - 1));
assign inner_frame_valid		=	inner_width_valid & inner_height_valid;
// Internal assignments
/*****************************************************************************
endmodule