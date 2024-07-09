module altera_up_sync_fifo (
	// Inputs
	clk,
	reset,
	write_en,
	write_data,
	read_en,
	// Bidirectionals
	// Outputs
	fifo_is_empty,
	fifo_is_full,
	words_used,
	read_data
);
/*****************************************************************************
parameter	DW				= 31;
parameter	DATA_DEPTH	= 128;
parameter	AW				= 6;
/*****************************************************************************
// Inputs
input						clk;
input						reset;
input						write_en;
input			[DW: 0]	write_data;
input						read_en;
// Bidirectionals
// Outputs
output					fifo_is_empty;
output					fifo_is_full;
output		[AW: 0]	words_used;
output		[DW: 0]	read_data;
/*****************************************************************************
/*****************************************************************************
// Internal Wires
// Internal Registers
// State Machine Registers
/*****************************************************************************
/*****************************************************************************
/*****************************************************************************
/*****************************************************************************
scfifo	Sync_FIFO (
	// Inputs
	.clock			(clk),
	.sclr				(reset),
	.data				(write_data),
	.wrreq			(write_en),
	.rdreq			(read_en),
	// Bidirectionals
	// Outputs
	.empty			(fifo_is_empty),
	.full				(fifo_is_full),
	.usedw			(words_used),
	.q					(read_data),
	// Unused
	// synopsys translate_off
	.aclr				(),
	.almost_empty	(),
	.almost_full	()
	// synopsys translate_on
);
defparam
	Sync_FIFO.add_ram_output_register	= "OFF",
	Sync_FIFO.intended_device_family		= "Cyclone II",
	Sync_FIFO.lpm_numwords					= DATA_DEPTH,
	Sync_FIFO.lpm_showahead					= "ON",
	Sync_FIFO.lpm_type						= "scfifo",
	Sync_FIFO.lpm_width						= DW + 1,
	Sync_FIFO.lpm_widthu						= AW + 1,
	Sync_FIFO.overflow_checking			= "OFF",
	Sync_FIFO.underflow_checking			= "OFF",
	Sync_FIFO.use_eab							= "ON";
endmodule