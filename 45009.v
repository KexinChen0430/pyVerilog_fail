module will barrelshift the data from the FIFO when unaligned accesses is enabled (we are using
     part of the FIFO word when off boundary).  When unaligned accesses is disabled then the data passes
     as wires.  The byte enable generator might require multiple cycles to perform partial accesses so a
     'stall' bit is used (triggers a stall like waitrequest)
   */
  ST_to_MM_Adapter the_ST_to_MM_Adapter (
    .clk (clk),
    .reset (reset),
    .enable (st_to_mm_adapter_enable),
    .address (descriptor_address[ADDRESS_WIDTH-1:0]),
    .start (go),
    .waitrequest (master_waitrequest),
    .stall (write_stall_from_byte_enable_generator | write_stall_from_write_burst_control),
    .write_data (master_writedata),
    .fifo_data (buffered_data),
    .fifo_empty (fifo_empty),
    .fifo_readack (fifo_read)
  );
  defparam the_ST_to_MM_Adapter.DATA_WIDTH = DATA_WIDTH;
  defparam the_ST_to_MM_Adapter.BYTEENABLE_WIDTH_LOG2 = BYTE_ENABLE_WIDTH_LOG2;
  defparam the_ST_to_MM_Adapter.ADDRESS_WIDTH = ADDRESS_WIDTH;
  defparam the_ST_to_MM_Adapter.UNALIGNED_ACCESS_ENABLE = UNALIGNED_ACCESSES_ENABLE;
  /* this block is responsible for presenting the fabric with supported byte enable combinations which can
     take multiple cycles, if full word only support is enabled this block will reduce to wires during synthesis */
  byte_enable_generator the_byte_enable_generator (
    .clk (clk),
    .reset (reset),
    .write_in (write),
    .byteenable_in (unsupported_byteenable),
    .waitrequest_out (write_stall_from_byte_enable_generator),
    .byteenable_out (supported_byteenable),
    .waitrequest_in (master_waitrequest | write_stall_from_write_burst_control)
  );
  defparam the_byte_enable_generator.BYTEENABLE_WIDTH = BYTE_ENABLE_WIDTH;
  // this block will be used to drive write, address, and burstcount to the fabric
  write_burst_control the_write_burst_control (
    .clk (clk),
    .reset (reset),
    .sw_reset (sw_reset_in),
	  .sw_stop (sw_stop_in),
    .length (length_counter),
    .eop_enabled (descriptor_end_on_eop_enable_d1),
    .eop (snk_eop),
    .ready (snk_ready),
    .valid (snk_valid),
    .early_termination (early_termination),
    .address_in (address),
    .write_in (write),
    .max_burst_count (maximum_burst_count),
    .write_fifo_used ({fifo_full,fifo_used}),
    .waitrequest (master_waitrequest),
    .short_first_access_enable (short_first_access_enable),
    .short_last_access_enable (short_last_access_enable),
    .short_first_and_last_access_enable (short_first_and_last_access_enable),
    .address_out (master_address),
    .write_out (master_write),  // filtered version of 'write'
    .burst_count (master_burstcount),
    .stall (write_stall_from_write_burst_control),
    .reset_taken (reset_taken_from_write_burst_control),
	.stopped (stopped_from_write_burst_control)
  );
  defparam the_write_burst_control.BURST_ENABLE = BURST_ENABLE;
  defparam the_write_burst_control.BURST_COUNT_WIDTH = MAX_BURST_COUNT_WIDTH;
  defparam the_write_burst_control.WORD_SIZE = BYTE_ENABLE_WIDTH;
  defparam the_write_burst_control.WORD_SIZE_LOG2 = (DATA_WIDTH == 8)? 0 : BYTE_ENABLE_WIDTH_LOG2;  // need to make sure log2(word size) is 0 instead of 1 here when the data width is 8 bits
  defparam the_write_burst_control.ADDRESS_WIDTH = ADDRESS_WIDTH;
  defparam the_write_burst_control.LENGTH_WIDTH = LENGTH_WIDTH;
  defparam the_write_burst_control.WRITE_FIFO_USED_WIDTH = FIFO_DEPTH_LOG2;
  defparam the_write_burst_control.BURST_WRAPPING_SUPPORT = BURST_WRAPPING_SUPPORT;
/********************************************* END MODULE INSTANTIATIONS ************************************************************************/
/********************************************* CONTROL AND COMBINATIONAL SIGNALS ****************************************************************/
  // breakout the descriptor information into more manageable names
  assign descriptor_address = {snk_command_data[123:92], snk_command_data[31:0]};  // 64-bit addressing support
  assign descriptor_length = snk_command_data[63:32];
  assign descriptor_programmable_burst_count = snk_command_data[75:68];
  assign descriptor_stride = snk_command_data[91:76];
  assign descriptor_end_on_eop_enable = snk_command_data[64];
  assign sw_stop_in = snk_command_data[66];
  assign sw_reset_in = snk_command_data[67];
  assign stride_amount = (STRIDE_ENABLE == 1)? stride_d1[STRIDE_WIDTH-1:0] : FIXED_STRIDE;  // hardcoding to FIXED_STRIDE when stride capabilities are disabled
  assign maximum_burst_count = (PROGRAMMABLE_BURST_ENABLE == 1)? programmable_burst_count_d1 : MAX_BURST_COUNT;
  assign eop_enable = (PACKET_ENABLE == 1)? descriptor_end_on_eop_enable_d1 : 1'b0;  // no eop or early termination support when packet support is disabled
  assign done_strobe = (done == 1) & (done_d1 == 0) & (reset_taken == 0);  // set_done asserts the done register so this strobe fires when the last write completes
  assign response_error = (ERROR_ENABLE == 1)? error : 8'b00000000;
  assign response_actual_bytes_transferred = (PACKET_ENABLE == 1)? actual_bytes_transferred_counter : 32'h00000000;
  // transfer size amounts for special cases (starting unaligned, ending with a partial word, starting unaligned and ending with a partial word on the same write)
  assign short_first_access_size = BYTE_ENABLE_WIDTH - start_byte_address;
  assign short_last_access_size = (eop_enable == 1)? (packet_beat_size + packet_bytes_buffered_d1) : (length_counter & LSB_MASK);
  assign short_first_and_last_access_size = (eop_enable == 1)? (BYTE_ENABLE_WIDTH - buffered_empty) : (length_counter & LSB_MASK);
  /* special case transfer enables and counter increment values (address_counter, length_counter, and actual_bytes_transferred)
     short_first_access_enable is for transfers that start aligned but reach the next word boundary
     short_last_access_enable is for transfers that are not the first transfer but don't end with on a word boundary
     short_first_and_last_access_enable is for transfers that start and end with a single transfer and don't end on a word boundary (may or may not be aligned)
  */
  generate
    if (UNALIGNED_ACCESSES_ENABLE == 1)
    begin
      // all three enables are mutually exclusive to provide one-hot encoding for the bytes to transfer mux
      assign short_first_access_enable = (start_byte_address != 0) & (first_access == 1) & ((eop_enable == 1)? ((start_byte_address + BYTE_ENABLE_WIDTH - buffered_empty) >= BYTE_ENABLE_WIDTH) : (first_word_boundary_not_reached_d1 == 0));
      assign short_last_access_enable = (first_access == 0) & ((eop_enable == 1)? ((packet_beat_size + packet_bytes_buffered_d1) < BYTE_ENABLE_WIDTH): (length_counter < BYTE_ENABLE_WIDTH));
      assign short_first_and_last_access_enable = (first_access == 1) & ((eop_enable == 1)? ((start_byte_address + BYTE_ENABLE_WIDTH - buffered_empty) < BYTE_ENABLE_WIDTH) : (first_word_boundary_not_reached_d1 == 1));
      assign bytes_to_transfer = bytes_to_transfer_mux;
      assign address_increment = bytes_to_transfer_mux;  // can't use stride when unaligned accesses are enabled
    end
    else if (ONLY_FULL_ACCESS_ENABLE == 1)
    begin
      assign short_first_access_enable = 0;
      assign short_last_access_enable = 0;
      assign short_first_and_last_access_enable = 0;
      assign bytes_to_transfer = BYTE_ENABLE_WIDTH;
      if (STRIDE_ENABLE == 1)
      begin
        assign address_increment = BYTE_ENABLE_WIDTH * stride_amount;  // the byte address portion of the address_counter is grounded to make sure the address presented to the fabric is aligned
      end
      else
      begin
        assign address_increment = BYTE_ENABLE_WIDTH;  // the byte address portion of the address_counter is grounded to make sure the address presented to the fabric is aligned
      end
    end
    else  // must be aligned but can end with any number of bytes
    begin
      assign short_first_access_enable = 0;
      assign short_last_access_enable = (eop_enable == 1)? (buffered_eop == 1) : (length_counter < BYTE_ENABLE_WIDTH);    // less than a word to transfer
      assign short_first_and_last_access_enable = 0;
      assign bytes_to_transfer = bytes_to_transfer_mux;
      if (STRIDE_ENABLE == 1)
      begin
        assign address_increment = BYTE_ENABLE_WIDTH * stride_amount;
      end
      else
      begin
        assign address_increment = BYTE_ENABLE_WIDTH;
      end
    end
  endgenerate
  // the control logic ensures this mux is one-hot with the fall through being the typical full word aligned access
  always @ (short_first_access_enable or short_last_access_enable or short_first_and_last_access_enable or short_first_access_size or short_last_access_size or short_first_and_last_access_size)
  begin
    case ({short_first_and_last_access_enable, short_last_access_enable, short_first_access_enable})
      3'b001: bytes_to_transfer_mux = short_first_access_size;            // unaligned and reaches the next word boundary
      3'b010: bytes_to_transfer_mux = short_last_access_size;             // aligned and does not reach the next word boundary
      3'b100: bytes_to_transfer_mux = short_first_and_last_access_size;   // unaligned and does not reach the next word boundary
      default: bytes_to_transfer_mux = BYTE_ENABLE_WIDTH;                 // aligned and reaches the next word boundary (i.e. a full word transfer)
    endcase
  end
  // Avalon-ST is network order (a.k.a. big endian) so we need to reverse the symbols before jamming them into the FIFO, changing the symbol width to something other than 8 might break something...
  generate
    genvar i;
    for(i = 0; i < DATA_WIDTH; i = i + SYMBOL_WIDTH)  // the data width is always a multiple of the symbol width
    begin: symbol_swap
      assign fifo_write_data[i +SYMBOL_WIDTH -1: i] = snk_data[DATA_WIDTH -i -1: DATA_WIDTH -i - SYMBOL_WIDTH];
    end
  endgenerate
  // sticking the error, empty, eop, and eop bits at the top of the FIFO write data, flooring empty to zero when eop is not asserted (empty is only valid on eop cycles)
  assign fifo_write_data[FIFO_WIDTH-1:DATA_WIDTH] = {snk_error, (snk_eop == 1)? snk_empty:0, snk_sop, snk_eop};
  // swap the bytes if big endian is enabled (remember that this isn't tested so use at your own risk and make sure you understand the software impact this has)
  generate
  if(BIG_ENDIAN_ACCESS == 1)
  begin
    genvar j;
    for(j=0; j < DATA_WIDTH; j = j + 8)
    begin: byte_swap
      assign fifo_read_data_rearranged[j +8 -1: j] = fifo_read_data[DATA_WIDTH -j -1: DATA_WIDTH -j - 8];
      assign master_byteenable[j/8] = supported_byteenable[(DATA_WIDTH -j -1)/8];
    end
  end
  else
  begin
    assign fifo_read_data_rearranged = fifo_read_data[DATA_WIDTH-1:0];  // little endian so no byte swapping necessary
    assign master_byteenable = supported_byteenable;    // dito
  end
  endgenerate
  // fifo read data is in the format of {error, empty, sop, eop, data} with the following widths {ERROR_WIDTH, NUMBER_OF_SYMBOLS_LOG2, 1, 1, DATA_WIDTH}
  assign buffered_data = fifo_read_data_rearranged;
  assign buffered_error = fifo_read_data[DATA_WIDTH +2 +NUMBER_OF_SYMBOLS_LOG2 + ERROR_WIDTH -1: DATA_WIDTH +2 +NUMBER_OF_SYMBOLS_LOG2];
  generate
  if (PACKET_ENABLE == 1)
  begin
    assign buffered_eop = fifo_read_data[DATA_WIDTH];
    assign buffered_sop = fifo_read_data[DATA_WIDTH +1];
    if (ONLY_FULL_ACCESS_ENABLE == 1)
    begin
      assign buffered_empty = 0;  // ignore the empty signal and assume it was a full beat
    end
    else
    begin
      assign buffered_empty = fifo_read_data[DATA_WIDTH +2 +NUMBER_OF_SYMBOLS_LOG2 -1: DATA_WIDTH +2];  // empty is packed into the upper FIFO bits
    end
  end
  else
  begin
    assign buffered_empty = 0;
    assign buffered_eop = 0;
    assign buffered_sop = 0;
  end
  endgenerate
  /*  Generating mask bits based on the size of the transfer before the unaligned access adjustment.  This is based on the
      transfer size to determine how many byte enables would be asserted in the aligned case.  Afterwards the
      byte enables will be shifted left based on how far out of alignment the address counter is (should only happen for the
      first transfer).  If the data path is 32 bits wide then the following masks are generated:
      Transfer Size       Index           Mask
            1               0             0001
            2               1             0011
            3               2             0111
            4               3             1111
      Note that the index is just the transfer size minus one
  */
  generate if (BYTE_ENABLE_WIDTH > 1)
  begin
    genvar k;
    for (k = 0; k < BYTE_ENABLE_WIDTH; k = k + 1)
    begin: byte_enable_loop
      assign byteenable_masks[k] = { {(BYTE_ENABLE_WIDTH-k-1){1'b0}}, {(k+1){1'b1}} };  // Byte enable width - k zeros followed by k ones
    end
  end
  else
  begin
    assign byteenable_masks[0] = 1'b1;  // will be stubbed at top level
  end
  endgenerate
  /* byteenable_mask is based on an aligned access determined by the transfer size.  This value is then shifted
     to the left by the unaligned offset (first transfer only) to compensate for the unaligned offset so that the
     correct byte enables are enabled.  When the accesses are aligned then no barrelshifting is needed and when full
     accesses are used then all byte enables will be asserted always. */
  generate if (ONLY_FULL_ACCESS_ENABLE == 1)
  begin
    assign unsupported_byteenable = {BYTE_ENABLE_WIDTH{1'b1}};  // always full accesses so the byte enables are all ones
  end
  else if (UNALIGNED_ACCESSES_ENABLE == 0)
  begin
    assign unsupported_byteenable = byteenable_masks[bytes_to_transfer_mux - 1];  // aligned so no unaligned adjustment required
  end
  else  // unaligned case
  begin
    assign unsupported_byteenable = byteenable_masks[bytes_to_transfer_mux - 1] << (address_counter & LSB_MASK);  // barrelshift adjusts for unaligned start address
  end
  endgenerate
  generate if (BYTE_ENABLE_WIDTH > 1)
  begin
    assign address = address_counter & { {(ADDRESS_WIDTH-BYTE_ENABLE_WIDTH_LOG2){1'b1}}, {BYTE_ENABLE_WIDTH_LOG2{1'b0}} };  // masking LSBs (byte offsets) since the address counter might not be aligned for the first transfer
  end
  else
  begin
    assign address = address_counter;  // don't need to mask any bits as the address will only advance one byte at a time
  end
  endgenerate
  assign done = (length_counter == 0) | ((PACKET_ENABLE == 1) & (eop_enable == 1) & (eop_seen == 1) & (extra_write == 0));
  assign packet_beat_size = (eop_seen == 1) ? 0 : (BYTE_ENABLE_WIDTH - buffered_empty);  // when the eop arrives we can't add more to packet_bytes_buffered_d1
  assign packet_bytes_buffered = packet_beat_size + packet_bytes_buffered_d1 - bytes_to_transfer;
  // extra_write is only applicable when unaligned accesses are performed.  This extra access gets the remaining data buffered in the ST to MM adapter block written to memory
  assign extra_write = (UNALIGNED_ACCESSES_ENABLE == 1) & (((PACKET_ENABLE == 1) & (eop_enable == 1))?
                       ((eop_seen == 1) & (packet_bytes_buffered_d1 != 0)) : // when packets are used if there are left over bytes buffered after eop is seen perform an extra write
                       ((first_access == 0) & (start_byte_address != 0) & (short_last_access_enable == 1) & (start_byte_address >= length_counter[BYTE_ENABLE_WIDTH_LOG2-1:0])));  // non-packet transfer and there are extra bytes buffered so performing an extra access
  assign first_word_boundary_not_reached = (descriptor_length < BYTE_ENABLE_WIDTH) &  // length is less than the word size
                                           (((descriptor_length & LSB_MASK) + (descriptor_address & LSB_MASK)) < BYTE_ENABLE_WIDTH);  // start address + length doesn't reach the next word boundary (not used for packet transfers)
  assign write = ((fifo_empty == 0) | (extra_write == 1)) & (done == 0) & (stopped == 0);
  assign st_to_mm_adapter_enable = (done == 0) & (extra_write == 0);
  assign write_complete = (write == 1) & (master_waitrequest == 0) & (write_stall_from_byte_enable_generator == 0) & (write_stall_from_write_burst_control == 0);  // writing still occuring and no reasons to prevent the write cycle from completing
  assign increment_address = ((write == 1) & (write_complete == 1)) & (stopped == 0);
  assign go = (snk_command_valid == 1) & (snk_command_ready == 1);  // go with be one cycle since done will be set to 0 on the next cycle (length will be non-zero)
  assign snk_ready = (fifo_full == 0) & // need to make sure more streaming data doesn't come in when the FIFO is full
                     (((PACKET_ENABLE == 1) & (snk_sop == 1) & (fifo_empty == 0)) != 1);  // need to make sure that only one packet is buffered at any given time (sop will continue to be asserted until the buffer is written out)
  assign length_sync_reset = (((reset_taken == 1) | (early_termination_d1 == 1)) & (done == 0)) | (done_strobe == 1); // abrupt stop cases or packet transfer just completed (otherwise the length register will reach 0 by itself)
  assign fifo_write = (snk_ready == 1) & (snk_valid == 1);
  assign early_termination = (eop_enable == 1) & (write_complete == 1) & (length_counter < bytes_to_transfer);  // packet transfer and the length counter is about to roll over so stop transfering
  assign stop_state = stopped;
  assign reset_delayed = (reset_taken == 0) & (sw_reset_in == 1);
  assign src_response_data = {{212{1'b0}}, done_strobe, early_termination_d1, response_error, stop_state, reset_delayed, response_actual_bytes_transferred};
/********************************************* END CONTROL AND COMBINATIONAL SIGNALS ************************************************************/
endmodule