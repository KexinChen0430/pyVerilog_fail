module fifo #(
	parameter log2_addr = 3, data_width = 8
	) (
	input n_reset_i,
	input wclk_i,
	input [data_width-1:0] data_i,
	input wr_i,
	input rclk_i,
	output [data_width-1:0] data_o,
	input rd_i,
	output fifo_empty_o,
	output fifo_full_o
	);
	// Wire definitions
	wire [log2_addr-1:0] gray_head;
	wire [log2_addr-1:0] gray_tail;
	// Full/empty tracking
	wire fifo_full;
	wire fifo_empty;
	// Rd/Wr edge tracking
	wire rd_rise, rd_fall, wr_rise, wr_fall;
	// Registers
	reg [data_width-1:0] out = 0;						// Output register
	reg [data_width-1:0] fifo_buffer [0:2**log2_addr-1] /* synthesis ramstyle = "M10K" */;
	reg [log2_addr:0] 	fifo_head = 0;				// Counters have one more bit to indicate full/empty
	reg [log2_addr:0] 	fifo_tail = 0;				// If lowest bits are the same then the high bit inicates full (high bits different)
																// Or empty (high bits same)
	reg 						rd = 0, wr = 0;			// RD/WR tracking
	// Assignments
	assign gray_head = fifo_head[log2_addr-1:0] ^ {1'b0, fifo_head[log2_addr-1:1]};
	assign gray_tail = fifo_tail[log2_addr-1:0] ^ {1'b0, fifo_tail[log2_addr-1:1]};
	assign data_o = out; //fifo_buffer[fifo_tail];
	assign fifo_full = (gray_head == gray_tail) & (fifo_head[log2_addr] != fifo_tail[log2_addr]);
	assign fifo_empty = (gray_head == gray_tail) & (fifo_head[log2_addr] == fifo_tail[log2_addr]);
	assign fifo_empty_o = fifo_empty;
	assign fifo_full_o = fifo_full;
	// Module connections
	// Rise/fall tracking
	always @(posedge wclk_i) wr <= wr_i;
	always @(posedge rclk_i) rd <= rd_i;
	// Move Write Pointers
	always @(negedge wclk_i)
	begin
		if( n_reset_i == 0 ) fifo_head <= 0;
		else // Was the last op a write, then increment counter
		if( !fifo_full && wr ) fifo_head = fifo_head + 1'b1;
	end
	// Store data
	always @(posedge wclk_i)
		if( !fifo_full && wr_i ) fifo_buffer[fifo_head] = data_i;
	// Move Read Pointers
	always @(negedge rclk_i)
	begin
		if( n_reset_i == 0 ) fifo_tail <= 0;
		else // Was the last op a read, then increment counter
		if( !fifo_empty && rd ) fifo_tail <= fifo_tail + 1'b1;
	end
	// Retrieve data on posedge read signal
	always @(posedge rclk_i)
		if( rd_i ) out <= fifo_buffer[fifo_tail];
endmodule