module.
                STATE_RESTART: begin
/* verilator lint_off WIDTH */
                    pc <= CMD_ADDRESS/8;
/* verilator lint_on WIDTH */
                    state <= STATE_FLUSHING_READS;
                end
                // Wait for pending reads to flush.
                STATE_FLUSHING_READS: begin
                    if (pending_reads == 0) begin
                        // Now that all reads have been enqueued, we
                        // can clear the FIFO.
                        fifo_sclr <= 1'b1;
                        state <= STATE_CLEAR_FIFO_WAIT;
                    end
                end
                STATE_CLEAR_FIFO_WAIT: begin
                    // Wait one clock for the sync clear to take effect.
                    fifo_sclr <= 1'b0;
                    state <= STATE_COPY_COMMANDS;
                end
                STATE_COPY_COMMANDS: begin
                    // If we're being told to hold our request, do so.
                    if (read_read && read_waitrequest) begin
                        // Do nothing.
/* verilator lint_off WIDTH */
                    end else if (fifo_size + pending_reads < FIFO_DEPTH - 3) begin
/* verilator lint_on WIDTH */
                        // Initiate read from memory.
                        read_address <= pc;
                        read_read <= 1'b1;
                        pc <= pc + 1'b1;
                        if (read_readdatavalid) begin
                            // Override subtraction above.
                            pending_reads <= pending_reads;
                        end else begin
                            pending_reads <= pending_reads + 1'b1;
                        end
                    end else begin
                        // Not reading and can't fit any more into FIFO.
                        read_read <= 1'b0;
                    end
                end
                default: begin
                    // Bug, restart.
                    state <= STATE_INIT;
                end
            endcase
        end
    end
endmodule