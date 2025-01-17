module altera_up_video_dma_to_memory (
	// Inputs
	clk,
	reset,
	stream_data,
	stream_startofpacket,
	stream_endofpacket,
	stream_empty,
	stream_valid,
	master_waitrequest,
	// Bidirectional
	// Outputs
	stream_ready,
	master_write,
	master_writedata,
	inc_address,
	reset_address
);
/*****************************************************************************
parameter DW	=  15; // Frame's datawidth
parameter EW	=   0; // Frame's empty width
parameter MDW	=  15; // Avalon master's datawidth
/*****************************************************************************
// Inputs
input						clk;
input						reset;
input			[DW: 0]	stream_data;
input						stream_startofpacket;
input						stream_endofpacket;
input			[EW: 0]	stream_empty;
input						stream_valid;
input						master_waitrequest;
// Bidirectional
// Outputs
output					stream_ready;
output					master_write;
output		[MDW:0]	master_writedata;
output					inc_address;
output					reset_address;
/*****************************************************************************
/*****************************************************************************
// Internal Wires
// Internal Registers
reg			[DW: 0]	temp_data;
reg						temp_valid;
// State Machine Registers
// Integers
/*****************************************************************************
/*****************************************************************************
// Output Registers
// Internal Registers
always @(posedge clk)
begin
	if (reset & ~master_waitrequest)
	begin
		temp_data	<=  'h0;
		temp_valid	<= 1'b0;
	end
	else if (stream_ready)
	begin
		temp_data	<= stream_data;
		temp_valid	<= stream_valid;
	end
end
/*****************************************************************************
// Output Assignments
assign stream_ready		= ~reset & (~temp_valid | ~master_waitrequest);
assign master_write		= temp_valid;
assign master_writedata	= temp_data;
assign inc_address		= stream_ready & stream_valid;
assign reset_address		= inc_address & stream_startofpacket;
// Internal Assignments
/*****************************************************************************
endmodule