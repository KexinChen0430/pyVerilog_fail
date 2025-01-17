module response_block (
  clk,
  reset,
  mm_response_readdata,
  mm_response_read,
  mm_response_address,
  mm_response_byteenable,
  mm_response_waitrequest,
  src_response_data,
  src_response_valid,
  src_response_ready,
  sw_reset,
  response_watermark,
  response_fifo_full,
  response_fifo_empty,
  done_strobe,
  actual_bytes_transferred,
  error,
  early_termination,
  transfer_complete_IRQ_mask,
  error_IRQ_mask,
  early_termination_IRQ_mask,
  descriptor_buffer_full
);
  parameter RESPONSE_PORT = 0;   // when disabled all the outputs will be disconnected by the component wrapper
  parameter FIFO_DEPTH = 256;    // needs to be double the descriptor FIFO depth
  parameter FIFO_DEPTH_LOG2 = 8;
  localparam FIFO_WIDTH = (RESPONSE_PORT == 0)? 41 : 51;  // when 'RESPONSE_PORT' is 1 then the response port is set to streaming and must pass the interrupt masks as well
  input clk;
  input reset;
  output wire [31:0] mm_response_readdata;
  input mm_response_read;
  input mm_response_address;  // only have 2 addresses
  input [3:0] mm_response_byteenable;
  output wire mm_response_waitrequest;
  output wire [255:0] src_response_data;  // not going to use all these bits, the remainder will be grounded
  output wire src_response_valid;
  input src_response_ready;
  input sw_reset;
  output wire [15:0] response_watermark;
  output wire response_fifo_full;
  output wire response_fifo_empty;
  input done_strobe;
  input [31:0] actual_bytes_transferred;
  input [7:0] error;
  input early_termination;
  // all of these signals are only used the ST source response port since the pre-fetching master component will handle the interrupt generation as apposed to the CSR block
  input transfer_complete_IRQ_mask;
  input [7:0] error_IRQ_mask;
  input early_termination_IRQ_mask;
  input descriptor_buffer_full;  // handy signal for the prefetching master to use so that it known when to blast a new descriptor into the dispatcher
  /* internal signals and registers */
  wire [FIFO_DEPTH_LOG2-1:0] fifo_used;
  wire fifo_full;
  wire fifo_empty;
  wire fifo_read;
  wire [FIFO_WIDTH-1:0] fifo_input;
  wire [FIFO_WIDTH-1:0] fifo_output;
  generate
    if (RESPONSE_PORT == 0)  // slave port used for response data
    begin
      assign fifo_input = {early_termination, error, actual_bytes_transferred};
      assign fifo_read = (mm_response_read == 1) & (fifo_empty == 0) & (mm_response_address == 1) & (mm_response_byteenable[3] == 1);  // reading from the upper byte (byte offset 7) pops the fifo
      scfifo the_response_FIFO (
        .clock (clk),
        .aclr (reset),
        .sclr (sw_reset),
        .data (fifo_input),
        .wrreq (done_strobe),
        .rdreq (fifo_read),
        .q (fifo_output),
        .full (fifo_full),
        .empty (fifo_empty),
        .usedw (fifo_used)
      );
      defparam the_response_FIFO.lpm_width = FIFO_WIDTH;
      defparam the_response_FIFO.lpm_numwords = FIFO_DEPTH;
      defparam the_response_FIFO.lpm_widthu = FIFO_DEPTH_LOG2;
      defparam the_response_FIFO.lpm_showahead = "ON";
      defparam the_response_FIFO.use_eab = "ON";
      defparam the_response_FIFO.overflow_checking = "OFF";
      defparam the_response_FIFO.underflow_checking = "OFF";
      defparam the_response_FIFO.add_ram_output_register = "ON";
      defparam the_response_FIFO.lpm_type = "scfifo";
      // either actual bytes transfered when address == 0 or {zero padding, early_termination, error[7:0]} when address = 1
      assign mm_response_readdata = (mm_response_address == 0)? fifo_output[31:0] : {{23{1'b0}}, fifo_output[40:32]};
      assign mm_response_waitrequest = fifo_empty;
      assign response_watermark = {{(16-(FIFO_DEPTH_LOG2+1)){1'b0}}, fifo_full, fifo_used};  // zero padding plus the 'true used' FIFO amount
      assign response_fifo_full = fifo_full;
      assign response_fifo_empty = fifo_empty;
      // no streaming port so ground all of its outputs
      assign src_response_data = 0;
      assign src_response_valid = 0;
    end
    else if (RESPONSE_PORT == 1)  // streaming source port used for response data (prefetcher will catch this data)
    begin
      assign fifo_input = {early_termination_IRQ_mask, error_IRQ_mask, transfer_complete_IRQ_mask, early_termination, error, actual_bytes_transferred};
      assign fifo_read = (fifo_empty == 0) & (src_response_ready == 1);
      scfifo the_response_FIFO (
        .clock (clk),
        .aclr (reset | sw_reset),
        .data (fifo_input),
        .wrreq (done_strobe),
        .rdreq (fifo_read),
        .q (fifo_output),
        .full (fifo_full),
        .empty (fifo_empty),
        .usedw (fifo_used)
      );
      defparam the_response_FIFO.lpm_width = FIFO_WIDTH;
      defparam the_response_FIFO.lpm_numwords = FIFO_DEPTH;
      defparam the_response_FIFO.lpm_widthu = FIFO_DEPTH_LOG2;
      defparam the_response_FIFO.lpm_showahead = "ON";
      defparam the_response_FIFO.use_eab = "ON";
      defparam the_response_FIFO.overflow_checking = "OFF";
      defparam the_response_FIFO.underflow_checking = "OFF";
      defparam the_response_FIFO.add_ram_output_register = "ON";
      defparam the_response_FIFO.lpm_type = "scfifo";
      assign src_response_data = {{204{1'b0}}, descriptor_buffer_full, fifo_output};  // zero padding the upper bits, also sending out the descriptor buffer full signal to simplify the throttling in the prefetching master (bit 52)
      assign src_response_valid = (fifo_empty == 0);
      assign response_watermark = {{(16-(FIFO_DEPTH_LOG2+1)){1'b0}}, fifo_full, fifo_used};  // zero padding plus the 'true used' FIFO amount;
      assign response_fifo_full = fifo_full;
      assign response_fifo_empty = fifo_empty;
      // no slave port so ground all of its outputs
      assign mm_response_readdata = 0;
      assign mm_response_waitrequest = 0;
    end
    else  // no response port so grounding all outputs
    begin
      assign fifo_input = 0;
      assign fifo_output = 0;
      assign mm_response_readdata = 0;
      assign mm_response_waitrequest = 0;
      assign src_response_data = 0;
      assign src_response_valid = 0;
      assign response_watermark = 0;
      assign response_fifo_full = 0;
      assign response_fifo_empty = 0;
    end
  endgenerate
endmodule