module simply takes the output of the descriptor buffer and reformats the data
   */
  read_signal_breakout the_read_signal_breakout (
    .read_command_data_in (read_fifo_output),
    .read_command_data_out (read_command_data),
    .read_address (read_address),
    .read_length (read_length),
    .read_transmit_channel (read_transmit_channel),
    .read_generate_sop (read_generate_sop),
    .read_generate_eop (read_generate_eop),
    .read_park (read_park),
    .read_transfer_complete_IRQ_mask (read_transfer_complete_IRQ_mask),
    .read_burst_count (read_burst_count),
    .read_stride (read_stride),
    .read_sequence_number (read_sequence_number),
    .read_transmit_error (read_transmit_error),
    .read_early_done_enable (read_early_done_enable),
    .read_stop (stop),
    .read_sw_reset (sw_reset)
  );
  defparam the_read_signal_breakout.DATA_WIDTH = DATA_WIDTH;
  // Descriptor FIFO allows for each byte lane to be written to and the data is not committed to the FIFO until the 'push' signal is asserted.
  // This differs from scfifo which commits the data any time the write signal is asserted.
  fifo_with_byteenables the_read_command_FIFO (
    .clk (clk),
    .areset (reset),
    .sreset (sw_reset),
    .write_data (writedata),
    .write_byteenables (byteenable),
    .write (write),
    .push (push_read_fifo),
    .read_data (read_fifo_output),
    .pop (pop_read_fifo),
    .used (read_command_used),  // this is a 'true used' signal with the full bit accounted for
    .full (read_command_full),
    .empty (read_command_empty)
  );
  defparam the_read_command_FIFO.DATA_WIDTH = DATA_WIDTH;  // we are not actually going to use all these bits and byte lanes left unconnected at the output will get optimized away
  defparam the_read_command_FIFO.FIFO_DEPTH = FIFO_DEPTH;
  defparam the_read_command_FIFO.FIFO_DEPTH_LOG2 = FIFO_DEPTH_LOG2;
  defparam the_read_command_FIFO.LATENCY = 2;
  // Descriptor FIFO allows for each byte lane to be written to and the data is not committed to the FIFO until the 'push' signal is asserted.
  // This differs from scfifo which commits the data any time the write signal is asserted.
  fifo_with_byteenables the_write_command_FIFO (
    .clk (clk),
    .areset (reset),
    .sreset (sw_reset),
    .write_data (writedata),
    .write_byteenables (byteenable),
    .write (write),
    .push (push_write_fifo),
    .read_data (write_fifo_output),
    .pop (pop_write_fifo),
    .used (write_command_used),  // this is a 'true used' signal with the full bit accounted for
    .full (write_command_full),
    .empty (write_command_empty)
  );
  defparam the_write_command_FIFO.DATA_WIDTH = DATA_WIDTH;  // we are not actually going to use all these bits and byte lanes left unconnected at the output will get optimized away
  defparam the_write_command_FIFO.FIFO_DEPTH = FIFO_DEPTH;
  defparam the_write_command_FIFO.FIFO_DEPTH_LOG2 = FIFO_DEPTH_LOG2;
  defparam the_write_command_FIFO.LATENCY = 2;
  /**************************************** End Module Instantiations ************************************************/
  /****************************************** Combinational Signals **************************************************/
  generate  // all unnecessary signals and drivers will be optimized away
    if (MODE == 0)  // MM-->MM
    begin
      assign waitrequest = (read_command_full == 1) | (write_command_full == 1);
      // information for the CSR or response blocks to use
      assign sequence_number = {write_sequence_number_d1, read_sequence_number_d1};
      assign transfer_complete_IRQ_mask = write_transfer_complete_IRQ_mask_d1;
      assign early_termination_IRQ_mask = 1'b0;
      assign error_IRQ_mask = 8'h00;
      // read buffer flow control
      assign push_read_fifo = go_bit;
      assign read_park_enable = (read_park == 1) & (read_command_used == 1);  // we want to keep the descriptor in the FIFO when the park bit is set
      assign read_command_valid = (stop == 0) & (sw_reset == 0) & (stop_issuing_commands == 0) &
                                  (read_command_empty == 0) & (read_command_empty_d1 == 0) & (read_command_empty_d2 == 0);  // command buffer has two cycles of latency so the empty deassertion need to delayed two cycles but asserted in zero cycles, the time between commands will be at least 2 cycles so this delay is only needed coming out of the empty condition
      assign issue_read_descriptor = (read_command_valid == 1) & (read_command_ready == 1);
      assign pop_read_fifo = (issue_read_descriptor == 1) & (read_park_enable == 0);  // don't want to pop the fifo if we are in parked mode
      // write buffer flow control
      assign push_write_fifo = go_bit;
      assign write_park_enable = (write_park == 1) & (write_command_used == 1);  // we want to keep the descriptor in the FIFO when the park bit is set
      assign write_command_valid = (stop == 0) & (sw_reset == 0) & (stop_issuing_commands == 0) &
                                   (write_command_empty == 0) & (write_command_empty_d1 == 0) & (write_command_empty_d2 == 0);  // command buffer has two cycles of latency so the empty deassertion need to delayed two cycles but asserted in zero cycles, the time between commands will be at least 2 cycles so this delay is only needed coming out of the empty condition
      assign issue_write_descriptor = (write_command_valid == 1) & (write_command_ready == 1);
      assign pop_write_fifo = (issue_write_descriptor == 1) & (write_park_enable == 0);  // don't want to pop the fifo if we are in parked mode
    end
    else if (MODE == 1)  // MM-->ST
    begin
      // information for the CSR or response blocks to use
      assign sequence_number = {16'h0000, read_sequence_number_d1};
      assign transfer_complete_IRQ_mask = read_transfer_complete_IRQ_mask_d1;
      assign early_termination_IRQ_mask = 1'b0;
      assign error_IRQ_mask = 8'h00;
      assign waitrequest = (read_command_full == 1);
      // read buffer flow control
      assign push_read_fifo = go_bit;
      assign read_park_enable = (read_park == 1) & (read_command_used == 1);  // we want to keep the descriptor in the FIFO when the park bit is set
      assign read_command_valid = (stop == 0) & (sw_reset == 0) & (stop_issuing_commands == 0) &
                                  (read_command_empty == 0) & (read_command_empty_d1 == 0) & (read_command_empty_d2 == 0);  // command buffer has two cycles of latency so the empty deassertion need to delayed two cycles but asserted in zero cycles, the time between commands will be at least 2 cycles so this delay is only needed coming out of the empty condition
      assign issue_read_descriptor = (read_command_valid == 1) & (read_command_ready == 1);
      assign pop_read_fifo = (issue_read_descriptor == 1) & (read_park_enable == 0);  // don't want to pop the fifo if we are in parked mode
      // write buffer flow control
      assign push_write_fifo = 0;
      assign write_park_enable = 0;
      assign write_command_valid = 0;
      assign issue_write_descriptor = 0;
      assign pop_write_fifo = 0;
    end
    else  // ST-->MM
    begin
      // information for the CSR or response blocks to use
      assign sequence_number = {write_sequence_number_d1, 16'h0000};
      assign transfer_complete_IRQ_mask = write_transfer_complete_IRQ_mask_d1;
      assign early_termination_IRQ_mask = write_early_termination_IRQ_mask_d1;
      assign error_IRQ_mask = write_error_IRQ_mask_d1;
      assign waitrequest = (write_command_full == 1);
      // read buffer flow control
      assign push_read_fifo = 0;
      assign read_park_enable = 0;
      assign read_command_valid = 0;
      assign issue_read_descriptor = 0;
      assign pop_read_fifo = 0;
      // write buffer flow control
      assign push_write_fifo = go_bit;
      assign write_park_enable = (write_park == 1) & (write_command_used == 1);  // we want to keep the descriptor in the FIFO when the park bit is set
      assign write_command_valid = (stop == 0) & (sw_reset == 0) & (stop_issuing_commands == 0) &
                                   (write_command_empty == 0) & (write_command_empty_d1 == 0) & (write_command_empty_d2 == 0);  // command buffer has two cycles of latency so the empty deassertion need to delayed two cycles but asserted in zero cycles, the time between commands will be at least 2 cycles so this delay is only needed coming out of the empty condition
      assign issue_write_descriptor = (write_command_valid == 1) & (write_command_ready == 1);
      assign pop_write_fifo = (issue_write_descriptor == 1) & (write_park_enable == 0);  // don't want to pop the fifo if we are in parked mode
    end
  endgenerate
  generate  // go bit is in a different location depending on the width of the slave port
    if (DATA_WIDTH == 256)
    begin
      assign go_bit = (writedata[255] == 1) & (write == 1) & (byteenable[31] == 1) & (waitrequest == 0);
    end
    else
    begin
      assign go_bit = (writedata[127] == 1) & (write == 1) & (byteenable[15] == 1) & (waitrequest == 0);
    end
  endgenerate
  /**************************************** End Combinational Signals ************************************************/
endmodule