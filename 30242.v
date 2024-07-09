module to send CMD58
         STATE_CMD58_SEND: begin
            spi_cmd_send_index <= 6'd58;
            spi_cmd_send_arg <= 32'h00000000;
            spi_cmd_send_crc <= 7'b0000000; // Shouldn't be checked
            spi_cmd_send_en <= 1;
            state <= STATE_R3_R7_SEND;
            next_state <= STATE_CMD58_RECV;
         end
         // Wait for response from CMD58, check for errors, and then
         // check if the CCS (Card Capacity Status) flag is set. This
         // indicates 512-byte block level addressing
         STATE_CMD58_RECV: begin
            if (spi_r3_r7_recv_done) begin
               if (8'b0 == spi_r3_r7_recv_out[39:32] &&
                   spi_r3_r7_recv_out[30]) begin
                  state <= STATE_CALIB_WAIT;
               end else begin
                  state <= STATE_ERROR;
               end
            end
         end
         // Wait for memory calibration to be done, then start
         // reading from SD card and storing in RAM
         STATE_CALIB_WAIT: begin
            if (calib_done) begin
               state <= STATE_0xFF_WAIT;
               next_state <= STATE_CMD17_SEND;
            end
         end
         // Send CMD17, single block read
         STATE_CMD17_SEND: begin
            spi_cmd_send_index <= 6'd17;
            spi_cmd_send_arg <= { 17'b0, program_index, block_addr }; // Block address
            spi_cmd_send_crc <= 7'b0000000; // Shouldn't be checked
            spi_cmd_send_en <= 1;
            state <= STATE_R1_SEND;
            next_state <= STATE_CMD17_RECV;
         end
         // Wait for response from CMD17, check for errors, then move
         // to handle the incoming data packet
         STATE_CMD17_RECV: begin
            if (spi_r1_recv_done) begin
               if (8'b0 == spi_r1_recv_out) begin
                  spi_data_read_en <= 1;
                  state <= STATE_DATA_RECV;
               end else begin
                  state <= STATE_ERROR;
               end
            end
         end
         // Handle receiving an incoming data packet, and send to RAM
         STATE_DATA_RECV: begin
            if (spi_data_read_error) begin
               state <= STATE_ERROR;
            end else if (spi_data_read_done) begin
               progress <= progress + 2;
               if (127 == block_addr) begin
                  state <= STATE_DONE;
               end else begin
                  block_addr <= block_addr + 1;
                  state <= STATE_0xFF_WAIT;
                  next_state <= STATE_CMD17_SEND;
               end
            end
         end
         // Done reading from the card
         STATE_DONE: begin
            sclk_reset <= 1;
            sdcard_cs <= 1;
            done <= 1;
         end
         // There was an error reading from the SD card
         STATE_ERROR: begin
            sclk_reset <= 1;
            sdcard_cs <= 1;
            error <= 1;
         end
      endcase
   end
endmodule