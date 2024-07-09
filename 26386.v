module RPCv3RouterReceiver_collapsing
#(
	//Data width (must be one of 16, 32, 64, 128).
	parameter OUT_DATA_WIDTH = 16,
	parameter IN_DATA_WIDTH = 32
)
(
	//Interface clock
	input wire clk,
	//Network interface, inbound side
	input wire						rpc_rx_en,
	input wire[IN_DATA_WIDTH-1:0]	rpc_rx_data,
	output reg						rpc_rx_ready = 0,
	//Router interface, outbound side
	input wire						rpc_fab_rx_space_available,
	output wire						rpc_fab_rx_packet_start,
	output reg						rpc_fab_rx_data_valid	= 0,
	output reg[OUT_DATA_WIDTH-1:0]	rpc_fab_rx_data			= 0,
	output reg						rpc_fab_rx_packet_done	= 0
);
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Synthesis-time sanity checking
	initial begin
		case(IN_DATA_WIDTH)
			32: begin
			end
			64: begin
			end
			128: begin
			end
			default: begin
				$display("ERROR: RPCv3RouterReceiver_collapsing IN_DATA_WIDTH must be 16/32/64/128");
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
			default: begin
				$display("ERROR: RPCv3RouterReceiver_collapsing OUT_DATA_WIDTH must be 16/32/64");
				$finish;
			end
		endcase
		if(IN_DATA_WIDTH <= OUT_DATA_WIDTH) begin
			$display("ERROR: RPCv3RouterReceiver_collapsing IN_DATA_WIDTH must be greater than OUT_DATA_WIDTH");
			$finish;
		end
	end
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Compute some useful values
	//Number of clocks it takes to receive a message
	localparam MESSAGE_CYCLES = 128 / IN_DATA_WIDTH;
	localparam MESSAGE_MAX = MESSAGE_CYCLES - 1;
	//Number of clocks it takes to re-send a message
	localparam OUT_CYCLES = 128 / OUT_DATA_WIDTH;
	//Number of bits we need in the cycle counter
	`include "../../synth_helpers/clog2.vh"
	localparam CYCLE_BITS = clog2(MESSAGE_CYCLES);
	localparam CYCLE_MAX = CYCLE_BITS ? CYCLE_BITS-1 : 0;
	localparam OUT_CYCLE_BITS = clog2(OUT_CYCLES);
	localparam OUT_CYCLE_MAX = OUT_CYCLE_BITS ? OUT_CYCLE_BITS-1 : 0;
	//Calculate the collapsing ratio (number of output words per input word)
	//Always 2, 4, or 8
	localparam COLLAPSE_RATIO = IN_DATA_WIDTH / OUT_DATA_WIDTH;
	localparam COLLAPSE_MAX = COLLAPSE_RATIO - 1;
	localparam COLLAPSE_BITS = clog2(COLLAPSE_RATIO);
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// FIFO of data being received
	wire						fifo_wr;
	reg							fifo_rd		= 0;
	wire						fifo_empty;
	wire[IN_DATA_WIDTH-1:0]		fifo_dout;
	wire						unused_full;
	wire						unused_underflow;
	wire						unused_overflow;
	wire[CYCLE_BITS:0]			unused_rsize;
	wire[CYCLE_BITS:0]			unused_wsize;
	generate
		if(IN_DATA_WIDTH < 128) begin
			SingleClockShiftRegisterFifo #(
				.WIDTH(IN_DATA_WIDTH),
				.DEPTH(MESSAGE_CYCLES),
				.OUT_REG(1)
			) rx_fifo (
				.clk(clk),
				.wr(fifo_wr),
				.din(rpc_rx_data),
				.rd(fifo_rd),
				.dout(fifo_dout),
				.overflow(unused_overflow),
				.underflow(unused_underflow),
				.empty(fifo_empty),
				.full(unused_full),
				.rsize(unused_rsize),
				.wsize(unused_wsize),
				.reset(1'b0)		//never reset the fifo
			);
		end
		//Special stuff for 128-bit link width - no fifo, just a buffer
		else begin
			reg[127:0] fifo_data = 0;
			reg fifo_valid = 0;
			always @(posedge clk) begin
				if(fifo_wr) begin
					fifo_valid	<= 1;
					fifo_data 	<= rpc_rx_data;
				end
				if(fifo_rd)
					fifo_valid	<= 0;
			end
			assign fifo_dout = fifo_data;
			assign fifo_empty = !fifo_valid;
		end
	endgenerate
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Main RX logic
	//True if we are in the first cycle of an incoming message
	wire					rx_starting				= (rpc_rx_en && rpc_rx_ready);
	assign					rpc_fab_rx_packet_start	= rx_starting;
	//Position within the message (in IN_DATA_WIDTH-bit units)
	reg[2:0]				rx_count		= 0;
	//True if a receive is in progress
	wire					rx_active		= (rx_count != 0) || rx_starting;
	assign 					fifo_wr			= rx_active;
	//True if fifo_dout contains a valid data word
	reg						fifo_dout_valid	= 0;
	//Position within the output word (in OUT_DATA_WIDTH-bit units)
	reg[COLLAPSE_BITS-1:0]	out_pos		= 0;
	//True if a transmit (to our host) is active
	wire					tx_active		= (fifo_dout_valid || !fifo_empty);
	//True if we are currently at the last word in fifo_dout
	wire					last_word_in_buffer = (out_pos == COLLAPSE_MAX);
	//If we have data in the FIFO, and our current word is missing or done, go read another one
	always @(*) begin
		fifo_rd							<= !fifo_empty && (!fifo_dout_valid || last_word_in_buffer);
	end
	//Combinatorial muxing of the output to save a bit of time
	integer i;
	always @(*) begin
		rpc_fab_rx_data_valid			<= fifo_dout_valid;
		rpc_fab_rx_packet_done			<= fifo_empty && last_word_in_buffer;
		rpc_fab_rx_data					<= 0;
		for(i=0; i<COLLAPSE_RATIO; i=i+1) begin
			if(i == out_pos)
				rpc_fab_rx_data			<= fifo_dout[OUT_DATA_WIDTH*(COLLAPSE_MAX - i) +: OUT_DATA_WIDTH];
		end
	end
	always @(posedge clk) begin
		//Update status flags as we read data from the FIFO
		if(fifo_rd)
			fifo_dout_valid				<= 1;
		//Keep track of position in the output word
		if(fifo_dout_valid)
			out_pos						<= out_pos + 1'h1;
		//Clear state on the last word
		if(rpc_fab_rx_packet_done) begin
			rx_count					<= 0;
			fifo_dout_valid				<= 0;
			out_pos						<= 0;
		end
		//Process incoming data words
		if(rx_active) begin
			//Clear some status flags at the start of a new message
			if(rx_starting) begin
				out_pos					<= 0;
				fifo_dout_valid			<= 0;
			end
			//Update word count as we move through the message
			if(rx_starting)
				rx_count				<= 1;
			else
				rx_count				<= rx_count + 1'h1;
			//When we hit the end of the message, stop
			if(rx_count == MESSAGE_MAX)
				rx_count				<= 0;
		end
	end
	//Ready to receive if the fabric side is ready.
	//Once we go ready, go un-ready when a message comes in.
	reg		rpc_rx_ready_ff	= 0;
	always @(posedge clk) begin
		if(rpc_rx_en)
			rpc_rx_ready_ff		<= 0;
		if(rpc_fab_rx_space_available && !rx_active && !tx_active)
			rpc_rx_ready_ff		<= 1;
	end
	always @(*) begin
		rpc_rx_ready			<= rpc_rx_ready_ff;
	end
endmodule