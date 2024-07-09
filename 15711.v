module RPCv3RouterTransmitter_buffering
#(
	//Data width (must be one of 16, 32, 64, 128).
	parameter OUT_DATA_WIDTH = 32,
	parameter IN_DATA_WIDTH = 32
)
(
	//Interface clock
	input wire clk,
	//Network interface, outbound side
	output reg						rpc_tx_en				= 0,
	output reg[OUT_DATA_WIDTH-1:0]	rpc_tx_data				= 0,
	input wire						rpc_tx_ready,
	//Router interface, inbound side
	output wire[5:0]				rpc_fab_tx_fifo_size,
	input wire						rpc_fab_tx_packet_start,
	input wire						rpc_fab_tx_wr_en,
	input wire[IN_DATA_WIDTH-1:0]	rpc_fab_tx_wr_data,
	output reg						rpc_fab_tx_packet_done	= 0
	`ifdef FORMAL
	, output fifo_rdata_valid
	`endif
);
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Synthesis-time sanity checking
	initial begin
		case(IN_DATA_WIDTH)
			16: begin
			end
			32: begin
			end
			64: begin
			end
			128: begin
			end
			default: begin
				$display("ERROR: RPCv3RouterTransmitter_buffering IN_DATA_WIDTH must be 16/32/64/128");
				$finish;
			end
		endcase
		case(OUT_DATA_WIDTH)
			16: begin
			end
			32: begin
			end
			64: begin
			end
			128: begin
			end
			default: begin
				$display("ERROR: RPCv3RouterTransmitter_buffering OUT_DATA_WIDTH must be 16/32/64/128");
				$finish;
			end
		endcase
		if(IN_DATA_WIDTH != OUT_DATA_WIDTH) begin
			$display("ERROR: RPCv3RouterTransmitter_buffering IN_DATA_WIDTH must be equal to OUT_DATA_WIDTH");
			$finish;
		end
	end
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Compute some useful values
	//Number of clocks it takes to send/receive a message
	localparam MESSAGE_CYCLES = 128 / IN_DATA_WIDTH;
	localparam MESSAGE_MAX = MESSAGE_CYCLES - 1;
	//Number of bits we need in the cycle counter
	`include "../../synth_helpers/clog2.vh"
	localparam CYCLE_BITS = clog2(MESSAGE_CYCLES);
	localparam CYCLE_MAX = CYCLE_BITS ? CYCLE_BITS-1 : 0;
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// The actual outbound data FIFO
	reg						fifo_rdata_valid		= 0;
	reg						fifo_rd					= 0;
	wire					fifo_empty;
	wire					fifo_rdata_packet_start;
	wire[IN_DATA_WIDTH-1:0]	fifo_rdata_data;
	wire					unused_overflow;
	wire					unused_underflow;
	wire					unused_full;
	wire[5:0]				unused_rsize;
	SingleClockShiftRegisterFifo #(
		.WIDTH(IN_DATA_WIDTH + 1),
		.DEPTH(32),
		.OUT_REG(1)
	) tx_fifo (
		.clk(clk),
		.wr(rpc_fab_tx_wr_en),
		.din({rpc_fab_tx_packet_start, rpc_fab_tx_wr_data}),
		.rd(fifo_rd),
		.dout({fifo_rdata_packet_start, fifo_rdata_data}),
		.overflow(unused_overflow),
		.underflow(unused_underflow),
		.empty(fifo_empty),
		.full(unused_full),
		.rsize(unused_rsize),
		.wsize(rpc_fab_tx_fifo_size),
		.reset(1'b0)		//never reset the fifo
	);
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Main state machine
	//Position within the message (in DATA_WIDTH-bit units)
	reg[CYCLE_MAX:0] tx_count		= 0;
	//True if we're starting a transmit this cycle
	wire		tx_starting			= fifo_rdata_valid && (tx_count == 0) && rpc_tx_ready;
	//True if a transmit is in progress
	wire		tx_active			= (tx_count != 0) || tx_starting;
	//True if we're ending a transmit this cycle.
	//The AND of tx_active is important to avoid staying high with 128-bit data width
	wire		tx_ending			= (tx_count == MESSAGE_MAX) && tx_active;
	//If we have data ready to read, read it.
	//If we already have data in the outbox, don't read unless we're actively sending (and ready for more next clock)
	always @(*) begin
		fifo_rd	<= (!fifo_empty && (!fifo_rdata_valid || tx_active) && !tx_ending );
	end
	//Push fifo output to the network
	always @(*) begin
		rpc_tx_en				<= tx_starting;
		rpc_tx_data				<= fifo_rdata_data;
		rpc_fab_tx_packet_done	<= tx_ending;
	end
	//Keep track of position in the message
	always @(posedge clk) begin
		if(tx_active)
			tx_count			<= tx_count + 1'h1;
		//Read data is not valid after the end of the packet
		if(tx_ending)
			fifo_rdata_valid	<= 0;
		//Read data is valid next cycle if we're reading this cycle
		if(fifo_rd)
			fifo_rdata_valid	<= 1;
	end
endmodule