module hififo_tpc_fifo
  (
   input 	 clock,
   input 	 reset,
   output [31:0] status,
   output 	 interrupt,
   // writes and read completions
   input [63:0]  rx_data,
   input 	 rx_data_valid,
   // to PCI TX
   output reg 	 wr_valid = 0,
   input 	 wr_ready,
   output [63:0] wr_data,
   output [63:0] wr_addr,
   output reg 	 wr_last,
   // FIFO
   input 	 fifo_clock,
   input 	 fifo_write,
   input [63:0]  fifo_data,
   output 	 fifo_ready
   );
   reg [4:0] 	 state = 0;
   wire 	 o_almost_empty;
   wire 	 request_valid;
   wire 	 fifo_read = (wr_ready && wr_valid)
		 || ((state != 0) && (state < 30));
   always @ (posedge clock)
     begin
	if(reset)
	  wr_valid <= 1'b0;
	else
	  wr_valid <= ((state == 0) || (state > 29))
	    && request_valid && ~o_almost_empty;
	wr_last <= state == 29;
	if(reset)
	  state <= 1'b0;
	else if(state == 0)
	  state <= wr_ready ? 5'd15 : 5'd0;
	else
	  state <= state + 1'b1;
     end
   fwft_fifo #(.NBITS(64)) data_fifo
     (
      .reset(reset),
      .i_clock(fifo_clock),
      .i_data(fifo_data),
      .i_valid(fifo_write),
      .i_ready(fifo_ready),
      .o_clock(clock),
      .o_read(fifo_read),
      .o_data(wr_data),
      .o_valid(),
      .o_almost_empty(o_almost_empty)
      );
    hififo_fetch_descriptor #(.BS(3)) fetch_descriptor
     (
      .clock(clock),
      .reset(reset),
      .request_addr(wr_addr),
      .request_valid(request_valid),
      .request_ack(fifo_read),
      .wvalid(rx_data_valid),
      .wdata(rx_data),
      .status(status),
      .interrupt(interrupt)
      );
endmodule