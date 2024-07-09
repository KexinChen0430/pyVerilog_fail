module nios_system_Dual_Clock_FIFO (
	// Inputs
	clk_stream_in,
	reset_stream_in,
	clk_stream_out,
	reset_stream_out,
	stream_in_data,
	stream_in_startofpacket,
	stream_in_endofpacket,
	stream_in_empty,
	stream_in_valid,
	stream_out_ready,
	// Bi-Directional
	// Outputs
	stream_in_ready,
	stream_out_data,
	stream_out_startofpacket,
	stream_out_endofpacket,
	stream_out_empty,
	stream_out_valid
);
/*****************************************************************************
parameter DW	= 29; // Frame's data width
parameter EW	= 1; // Frame's empty width
/*****************************************************************************
// Inputs
input						clk_stream_in;
input						reset_stream_in;
input						clk_stream_out;
input						reset_stream_out;
input			[DW: 0]	stream_in_data;
input						stream_in_startofpacket;
input						stream_in_endofpacket;
input			[EW: 0]	stream_in_empty;
input						stream_in_valid;
input						stream_out_ready;
// Bi-Directional
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
wire			[ 6: 0]	fifo_wr_used;
wire						fifo_empty;
// Internal Registers
// State Machine Registers
/*****************************************************************************
/*****************************************************************************
/*****************************************************************************
// Output assignments
assign stream_in_ready	= ~(&(fifo_wr_used[6:4]));
assign stream_out_empty	= 'h0;
assign stream_out_valid	= ~fifo_empty;
/*****************************************************************************
dcfifo	Data_FIFO (
	// Inputs
	.wrclk	(clk_stream_in),
	.wrreq	(stream_in_ready & stream_in_valid),
	.data		({stream_in_data, stream_in_endofpacket, stream_in_startofpacket}),
	.rdclk	(clk_stream_out),
	.rdreq	(stream_out_ready & ~fifo_empty),
	// Outputs
	.wrusedw	(fifo_wr_used),
	.rdempty	(fifo_empty),
	.q			({stream_out_data, stream_out_endofpacket, stream_out_startofpacket})
	// synopsys translate_off
	,
	.aclr		(),
	.wrfull	(),
	.wrempty	(),
	.rdfull	(),
	.rdusedw	()
	// synopsys translate_on
);
defparam
	Data_FIFO.intended_device_family	= "Cyclone II",
	Data_FIFO.lpm_hint					= "MAXIMIZE_SPEED=7",
	Data_FIFO.lpm_numwords				= 128,
	Data_FIFO.lpm_showahead				= "ON",
	Data_FIFO.lpm_type					= "dcfifo",
	Data_FIFO.lpm_width					= DW + 3,
	Data_FIFO.lpm_widthu					= 7,
	Data_FIFO.overflow_checking		= "OFF",
	Data_FIFO.rdsync_delaypipe			= 5,
	Data_FIFO.underflow_checking		= "OFF",
	Data_FIFO.use_eab						= "ON",
	Data_FIFO.wrsync_delaypipe			= 5;
endmodule