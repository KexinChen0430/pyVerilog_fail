module dispatcher (
  clk,
  reset,
  // 128/256 bit write only port for feeding the dispatcher descriptors, no address since it's only one word wide, blocking when too many descriptors are buffered
  descriptor_writedata,
  descriptor_byteenable,
  descriptor_write,
  descriptor_waitrequest,
  // control and status port, 32 bits wide with a read latency of 2 and non-blocking
  csr_writedata,
  csr_byteenable,
  csr_write,
  csr_readdata,
  csr_read,
  csr_address,  // 4 addresses when ENHANCED_FEATURES is off (zero) otherwise 8 addresses are available
  csr_irq,  // only available if the response port is not an ST source (in that case the SGDMA pre-fetching block will issue interrupts)
  // response slave port (when "RESPONSE_PORT" is set to 0), 32 bits wide, read only, and a read latency of 3 cycles
  mm_response_readdata,
  mm_response_read,
  mm_response_address,  // only two addresses
  mm_response_byteenable,  // last byte read pops the response FIFO
  mm_response_waitrequest,
  // response source port (when "RESPONSE_PORT" is set to 1),
  src_response_data,
  src_response_valid,
  src_response_ready,
  // write master source port (sends commands to write master)
  src_write_master_data,
  src_write_master_valid,
  src_write_master_ready,
  // write master sink port (recieves response from write master)
  snk_write_master_data,
  snk_write_master_valid,
  snk_write_master_ready,
  // read master source port (sends commands to read master)
  src_read_master_data,
  src_read_master_valid,
  src_read_master_ready,
  // read master sink port (recieves response from the read master)
  snk_read_master_data,
  snk_read_master_valid,
  snk_read_master_ready
);
  // y = log2(x)
  function integer log2;
    input integer x;
  begin
    x = x-1;
    for(log2=0; x>0; log2=log2+1)
      x = x>>1;
  end
  endfunction
  parameter MODE = 0;                           // 0 for MM->MM, 1 for MM->ST, 2 for ST->MM
  parameter RESPONSE_PORT = 0;                  // 0 for MM, 1 for ST, 2 for Disabled  // normally disabled for all but ST->MM transfers
  parameter DESCRIPTOR_FIFO_DEPTH = 128;        // 16-1024 in powers of 2
  parameter ENHANCED_FEATURES = 1;              // 1 for Enabled, 0 for Disabled
  parameter DESCRIPTOR_WIDTH = 256;             // 256 when enhanced mode is on, 128 for off (needs to be controlled by callback since it influences data width)
  parameter DESCRIPTOR_BYTEENABLE_WIDTH = 32;   // 32 when enhanced mode is on, 16 for off (needs to be controlled by callback since it influences byte enable width)
  parameter CSR_ADDRESS_WIDTH = 3;              // always 3 bits wide
  localparam RESPONSE_FIFO_DEPTH = 2 * DESCRIPTOR_FIFO_DEPTH;
  localparam DESCRIPTOR_FIFO_DEPTH_LOG2 = log2(DESCRIPTOR_FIFO_DEPTH);
  localparam RESPONSE_FIFO_DEPTH_LOG2 = log2(RESPONSE_FIFO_DEPTH);
  input clk;
  input reset;
  input [DESCRIPTOR_WIDTH-1:0] descriptor_writedata;
  input [DESCRIPTOR_BYTEENABLE_WIDTH-1:0] descriptor_byteenable;
  input descriptor_write;
  output wire descriptor_waitrequest;
  input [31:0] csr_writedata;
  input [3:0] csr_byteenable;
  input csr_write;
  output wire [31:0] csr_readdata;
  input csr_read;
  input [CSR_ADDRESS_WIDTH-1:0] csr_address;
  output wire csr_irq;
  // Used by a host with a master (like Nios II)
  output wire [31:0] mm_response_readdata;
  input mm_response_read;
  input mm_response_address;
  input [3:0] mm_response_byteenable;
  output wire mm_response_waitrequest;
  // Used by a pre-fetching master
  output wire [255:0] src_response_data;      // making wide in case we need to jam more signals in here, unnecessary bits will be grounded/optimized away
  output wire src_response_valid;
  input src_response_ready;
  output wire [255:0] src_write_master_data;  // don't know how many bits the master will use, unnecessary bits will be grounded/optimized away
  output wire src_write_master_valid;
  input src_write_master_ready;
  input [255:0] snk_write_master_data;       // might need to jam more bits in......
  input snk_write_master_valid;
  output wire snk_write_master_ready;
  output wire [255:0] src_read_master_data;  // don't know how many bits the master will use, unnecessary bits will be grounded/optimized away
  output wire src_read_master_valid;
  input src_read_master_ready;
  input [255:0] snk_read_master_data;       // might need to jam more bits in......
  input snk_read_master_valid;
  output wire snk_read_master_ready;
  /* Internal wires and registers */
  // descriptor information
  wire read_command_valid;
  wire read_command_ready;
  wire [255:0] read_command_data;
  wire read_command_empty;
  wire read_command_full;
  wire [DESCRIPTOR_FIFO_DEPTH_LOG2:0] read_command_used;  // true used signal so extra MSB is included
  wire write_command_valid;
  wire write_command_ready;
  wire [255:0] write_command_data;
  wire write_command_empty;
  wire write_command_full;
  wire [DESCRIPTOR_FIFO_DEPTH_LOG2:0] write_command_used;  // true used signal so extra MSB is included
  wire [31:0] sequence_number;
  wire transfer_complete_IRQ_mask;
  wire early_termination_IRQ_mask;
  wire [7:0] error_IRQ_mask;
  wire descriptor_buffer_empty;
  wire descriptor_buffer_full;
  wire [15:0] write_descriptor_watermark;
  wire [15:0] read_descriptor_watermark;
  wire [31:0] descriptor_watermark;
  wire busy;
  wire done;
  wire done_strobe;
  wire stop_issuing_commands;
  wire stop;
  wire sw_reset;
  wire stop_on_error;
  wire stop_on_early_termination;
  wire stop_descriptors;
  wire reset_stalled;
  wire master_stop_state;
  wire descriptors_stop_state;
  wire stop_state;
  wire stopped_on_error;
  wire stopped_on_early_termination;
  wire response_fifo_full;
  wire response_fifo_empty;
  wire [15:0] response_watermark;
  wire [7:0] response_error;
  wire response_early_termination;
  wire [31:0] response_actual_bytes_transferred;
  /************************************************ REGISTERS *******************************************************/
  /********************************************** END REGISTERS *****************************************************/
  /******************************************* MODULE DECLERATIONS **************************************************/
  // the descriptor buffers block instantiates the descriptor FIFOs and handshaking logic with the master command ports
  descriptor_buffers the_descriptor_buffers (
    .clk (clk),
    .reset (reset),
    .writedata (descriptor_writedata),
    .write (descriptor_write),
    .byteenable (descriptor_byteenable),
    .waitrequest (descriptor_waitrequest),
    .read_command_valid (read_command_valid),
    .read_command_ready (read_command_ready),
    .read_command_data (read_command_data),
    .read_command_empty (read_command_empty),
    .read_command_full (read_command_full),
    .read_command_used (read_command_used),
    .write_command_valid (write_command_valid),
    .write_command_ready (write_command_ready),
    .write_command_data (write_command_data),
    .write_command_empty (write_command_empty),
    .write_command_full (write_command_full),
    .write_command_used (write_command_used),
    .stop_issuing_commands (stop_issuing_commands),
    .stop (stop),
    .sw_reset (sw_reset),
    .sequence_number (sequence_number),
    .transfer_complete_IRQ_mask (transfer_complete_IRQ_mask),
    .early_termination_IRQ_mask (early_termination_IRQ_mask),
    .error_IRQ_mask (error_IRQ_mask)
  );
  defparam the_descriptor_buffers.MODE = MODE;
  defparam the_descriptor_buffers.DATA_WIDTH = DESCRIPTOR_WIDTH;
  defparam the_descriptor_buffers.BYTE_ENABLE_WIDTH = DESCRIPTOR_WIDTH/8;
  defparam the_descriptor_buffers.FIFO_DEPTH = DESCRIPTOR_FIFO_DEPTH;
  defparam the_descriptor_buffers.FIFO_DEPTH_LOG2 = DESCRIPTOR_FIFO_DEPTH_LOG2;
  // Control and status registers (and interrupts when a host connects directly to this block)
  csr_block the_csr_block (
    .clk (clk),
    .reset (reset),
    .csr_writedata (csr_writedata),
    .csr_write (csr_write),
    .csr_byteenable (csr_byteenable),
    .csr_readdata (csr_readdata),
    .csr_read (csr_read),
    .csr_address (csr_address),
    .csr_irq (csr_irq),
    .done_strobe (done_strobe),
    .busy (busy),
    .descriptor_buffer_empty (descriptor_buffer_empty),
    .descriptor_buffer_full (descriptor_buffer_full),
    .stop_state (stop_state),
    .stopped_on_error (stopped_on_error),
    .stopped_on_early_termination (stopped_on_early_termination),
    .stop_descriptors (stop_descriptors),
    .reset_stalled (reset_stalled),    // from the master(s) to tell the CSR block that it's still resetting
    .stop (stop),
    .sw_reset (sw_reset),
    .stop_on_error (stop_on_error),
    .stop_on_early_termination (stop_on_early_termination),
    .sequence_number (sequence_number),
    .descriptor_watermark (descriptor_watermark),
    .response_watermark (response_watermark),
    .response_buffer_empty (response_fifo_empty),
    .response_buffer_full (response_fifo_full),
    .transfer_complete_IRQ_mask (transfer_complete_IRQ_mask),
    .error_IRQ_mask (error_IRQ_mask),
    .early_termination_IRQ_mask (early_termination_IRQ_mask),
    .error (response_error),
    .early_termination (response_early_termination)
  );
  defparam the_csr_block.ADDRESS_WIDTH = CSR_ADDRESS_WIDTH;
  // Optional response port.  When using a directly connected host it'll be a slave port and using a pre-fetching descriptor master it will be a streaming source port.
  response_block the_response_block (
    .clk (clk),
    .reset (reset),
    .mm_response_readdata (mm_response_readdata),
    .mm_response_read (mm_response_read),
    .mm_response_address (mm_response_address),
    .mm_response_byteenable (mm_response_byteenable),
    .mm_response_waitrequest (mm_response_waitrequest),
    .src_response_data (src_response_data),
    .src_response_valid (src_response_valid),
    .src_response_ready (src_response_ready),
    .sw_reset (sw_reset),
    .response_watermark (response_watermark),
    .response_fifo_full (response_fifo_full),
    .response_fifo_empty (response_fifo_empty),
    .done_strobe (done_strobe),
    .actual_bytes_transferred (response_actual_bytes_transferred),
    .error (response_error),
    .early_termination (response_early_termination),
    .transfer_complete_IRQ_mask (transfer_complete_IRQ_mask),
    .error_IRQ_mask (error_IRQ_mask),
    .early_termination_IRQ_mask (early_termination_IRQ_mask),
    .descriptor_buffer_full (descriptor_buffer_full)
  );
  defparam the_response_block.RESPONSE_PORT = RESPONSE_PORT;
  defparam the_response_block.FIFO_DEPTH = RESPONSE_FIFO_DEPTH;
  defparam the_response_block.FIFO_DEPTH_LOG2 = RESPONSE_FIFO_DEPTH_LOG2;
  /***************************************** END MODULE DECLERATIONS ************************************************/
  /****************************************** COMBINATIONAL SIGNALS *************************************************/
  // this block issues the commands so it's always ready for a response.  The response FIFO fill level will be used to
  // make sure additional ST-->MM commands are not issued if there is no room to catch the response.
  assign snk_write_master_ready = 1'b1;
  assign snk_read_master_ready = 1'b1;
  assign done = (MODE == 1)? snk_read_master_ready : snk_write_master_ready;
  assign done_strobe = (MODE == 1)? (snk_read_master_ready & snk_read_master_valid) : (snk_write_master_ready & snk_write_master_valid);
  assign stop_issuing_commands = (response_fifo_full == 1) | (stop_descriptors == 1);
  assign src_write_master_valid = write_command_valid;
  assign write_command_ready = src_write_master_ready;
  assign src_write_master_data = write_command_data;
  assign src_read_master_valid = read_command_valid;
  assign read_command_ready = src_read_master_ready;
  assign src_read_master_data = read_command_data;
  assign busy = (read_command_empty == 0) | (write_command_empty == 0) |  // still have descriptors buffered in the FIFOs
                (done == 0);  // current transfer is still occuring
  assign descriptor_buffer_empty = (read_command_empty == 1) & (write_command_empty == 1);
  assign descriptor_buffer_full = (read_command_full == 1) | (write_command_full == 1);
  assign write_descriptor_watermark = 16'h0000 | write_command_used;  // zero padding the upper unused bits
  assign read_descriptor_watermark = 16'h0000 | read_command_used;  // zero padding the upper unused bits
  assign descriptor_watermark = {write_descriptor_watermark, read_descriptor_watermark};
  assign reset_stalled = snk_read_master_data[0] | snk_write_master_data[32];
  assign master_stop_state = ((MODE == 0)? (snk_read_master_data[1] & snk_write_master_data[33]) :
                              (MODE == 1)? snk_read_master_data[1] : snk_write_master_data[33]);
  assign descriptors_stop_state = (stop_descriptors == 1) & ((MODE == 0)? ((src_read_master_ready == 1) & (src_write_master_ready == 1)) :
                                                           (MODE == 1)? (src_read_master_ready == 1) : (src_write_master_ready == 1));
  assign stop_state = (master_stop_state == 1) | (descriptors_stop_state == 1);
  assign response_actual_bytes_transferred = snk_write_master_data[31:0];
  assign response_error = snk_write_master_data[41:34];
  assign response_early_termination = snk_write_master_data[42];
  /**************************************** END COMBINATIONAL SIGNALS ***********************************************/
endmodule