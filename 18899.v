module pins along the bottom of the board
assign nRESET = mcu_is_transmitting_sync[2]; //DEBUG
assign D[7] = serial_mcu_to_cpld; //DEBUG
assign D[6] = serial_cpld_to_mcu; //serial_buffer_empty; //DEBUG
assign D[5] = serial_input_buffer_full; //DEBUG
assign D[4] = econet_initiate_abort; //DEBUG
assign D[3] = econet_transmitting; //DEBUG
assign D[2] = outputting_frame; //DEBUG
always @(negedge clock_24m) begin
    // FALLING edge of serial clock: update value on serial_cpld_to_mcu
    serial_cpld_to_mcu <= mcu_is_transmitting_sync[2] ? 1'b1 : serial_shifter[0];
    // if (!mcu_is_transmitting && serial_bit_count != 0) $display("outputting bit to serial port: %b", serial_shifter[0]);
end
always @(posedge clock_24m) begin
    // RISING edge of serial clock: sample value on serial_mcu_to_cpld
    // To save on CPLD space, the entire system is half-duplex, driven by the
    // mcu_is_transmitting line.  When this line changes, the whole system is
    // reset, throwing away any half-transmitted or half-received data.
    // Synchronize signals from the Econet line.  tRDS = 50ns and tRDH = 60ns,
    // and our clock period is 42ns, so we'll have a tight enough sample.
    econet_clock_sync <= {econet_clock_sync[1:0], econet_clock};
    econet_data_sync <= {econet_data_sync[1:0], (econet_data_R ^ buggy_rev1_pcb)};
    mcu_is_transmitting_sync <= {mcu_is_transmitting_sync[1:0], mcu_is_transmitting};
    if (mcu_is_transmitting_sync[2] != mcu_is_transmitting_sync[1]) begin  // DIRECTION CHANGE
        serial_bit_count <= 0;
        serial_input_buffer_full <= 1'b0;
        serial_shifter[0] <= 1'b1;
        econet_initiate_abort <= 1'b0;
        econet_transmitting <= 1'b0;
        econet_bit_count <= 0;
        econet_ones_count <= 7;
    end else if (mcu_is_transmitting_sync[2] == 1'b1) begin  // RECEIVE FROM MCU, TRANSMIT TO ECONET
        // TODO figure out if we need to synchronize mcu_is_transmitting, or
        // if it's already synchronous w.r.t the USRT clock
        // SERIAL PORT RECEIVER
        if (serial_bit_count == 0) begin
            if (serial_mcu_to_cpld == 1'b0) begin
                // Received a start bit; start a transfer
                serial_bit_count <= 10;
            end
        end else if (serial_bit_count == 1) begin
            // Receiving a stop bit
            if (serial_mcu_to_cpld == 1'b1) begin
                // Received data!
                if (serial_input_buffer_full == 1'b1) begin
                    // Buffer overrun; abort the frame.
                    econet_initiate_abort <= 1'b1;
                end else begin
                    serial_input_buffer_full <= 1'b1;
                end
            end else begin
                // Frame error; ignore byte and crash
                //TODO
            end
            serial_bit_count <= 0;
        end else begin
            // Receiving 9 bits from the serial port, LSB-first
            serial_shifter <= {serial_mcu_to_cpld, serial_shifter[8:1]};
            serial_bit_count <= serial_bit_count - 1;
        end
        // COPY FROM SERIAL PORT TO ECONET REGISTER
        // Push a byte into the output shift register if necessary
        if (econet_transmitting == 1'b0) begin
            if (econet_initiate_abort == 1'b1) begin
                // We're sending an abort, probably because we got a buffer
                // overrun (on receiption).  This will cancel the current frame.
                // If we get a buffer underrun on transmission, we probably
                // just bomb out and let the line idle state abort our frame.
                serial_input_buffer_full <= 1'b0;
                outputting_frame <= 1'b1;
                econet_transmitting <= 1'b1;
                econet_output_raw <= 1'b1;
                econet_shifter <= 8'b11111111;
                econet_bit_count <= 3'b0;
            end else if (serial_input_buffer_full == 1'b1) begin
                // We've received a byte from the MCU and want to transmit it.
                // Make room for the next byte from the MCU.
                serial_input_buffer_full <= 1'b0;
                // When we're not transmitting, we ignore anything without
                // the 'raw' byte.
                if (serial_shifter[8] == 1'b1) begin
                    // new frames always start with a raw (flag) byte
                    outputting_frame <= 1'b1;
                end
                econet_transmitting <= 1'b1;
                // 0x1XX = 8 raw bits; 0x0XX = 8 bits with zero stuffing
                econet_output_raw <= serial_shifter[8];
                econet_shifter <= serial_shifter[7:0];
                econet_bit_count <= 3'b0;
            end
        end
        // ECONET TRANSMITTER
        if (econet_clock_sync[2] == 1'b1 && econet_clock_sync[1] == 1'b0) begin
            // FALLING ECONET CLOCK EDGE: FLIP OUTPUT
            if (outputting_frame == 1'b1) begin
                if (econet_transmitting == 1'b0) begin
                    // Buffer underrun: we're in a frame and it's time to output a bit, but we have nothing
                    outputting_frame <= 1'b0;
                    // Reset line to '1' when idling, so we don't get a glitch when we start driving again
                    econet_data_out <= 1'b1;
                end
            end
            if (econet_transmitting == 1'b0) begin
                // econet_data_D should idle high
                // econet_data_out <= 1'b1;
            end else begin
                // Transmit even if we're not inside a frame, to avoid deadlocks
                // shift out a bit (LSB first) and increment/zero ones count as necessary
                econet_data_out <= econet_shifter[0];
                // TODO verify that this always sends a 0 after five 1 bits,
                // even at the end of a transmission (i.e. verify that sending
                // 00011111 then a flag results in 000111110 01111110).
                // See: https://stardot.org.uk/forums/viewtopic.php?p=130412#p130412
                if (econet_output_raw == 1'b0 && econet_ones_count == 4 && econet_shifter[0] == 1'b1) begin
                    // set next bit to 0 for stuffing
                    econet_ones_count <= 0;
                    econet_shifter[0] <= 1'b0;
                end else begin
                    if (econet_shifter[0] == 1'b1) begin
                        econet_ones_count <= econet_ones_count + 1;
                    end else begin
                        econet_ones_count <= 0;
                    end
                    econet_shifter <= {1'b1, econet_shifter[7:1]};
                    econet_bit_count <= econet_bit_count + 1;
                end
                // econet_bit_count counts from 0-7 as the 8 bits are shifted out.
                if (econet_bit_count == 7) begin
                    // we just finished transmitting a byte.  signal to controller
                    // that we need our shifter refilled.
                    econet_transmitting <= 1'b0;
                end
            end
        end
    end else begin  // mcu_is_transmitting == 1'b0; TRANSMIT TO MCU, RECEIVE FROM ECONET
        // SERIAL PORT TRANSMITTER
        if (serial_bit_count != 0) begin
            serial_shifter <= {1'b1, serial_shifter[9:1]};
            serial_bit_count <= serial_bit_count - 1;
        end
        // ECONET RECEIVER
        if (econet_clock_sync[2] == 1'b0 && econet_clock_sync[1] == 1'b1) begin
            // RISING ECONET CLOCK EDGE: SAMPLE INPUT
            if (econet_ones_count == 7 && econet_data_sync[2] == 1'b1) begin
                // Stay in reset
            end else if (econet_ones_count == 6 && econet_data_sync[2] == 1'b1) begin
                // Reset!
                econet_ones_count <= econet_ones_count + 1;
                econet_bit_count <= 0;
            end else if (econet_ones_count == 6 && econet_data_sync[2] == 1'b0) begin
                // Just received a flag
                // Probably safe to assume this will never cause a serial overrun, as this would require an Econet line rate over 2MHz.
                $display("received flag: put 1+%02x (1+%b) in serial shifter", {econet_shifter[6:0], 1'b0}, {econet_shifter[6:0], 1'b0});
                serial_shifter <= {
                    1'b1, // it's a flag
                    {econet_data_sync[2],
                     econet_shifter[0],
                     econet_shifter[1],
                     econet_shifter[2],
                     econet_shifter[3],
                     econet_shifter[4],
                     econet_shifter[5],
                     econet_shifter[6]}, // flag byte
                    1'b0  // start bit
                };
                serial_bit_count <= 11;
                econet_ones_count <= 1'b0;
                econet_bit_count <= 0;
            end else if (econet_ones_count == 5 && econet_data_sync[2] == 1'b0) begin
                // Just read a stuffed zero
                // Reset ones count and skip this bit
                econet_ones_count <= 0;
            end else begin
                // Read a normal bit
                // Increment or reset ones count
                if (econet_data_sync[2] == 1'b1) begin
                    econet_ones_count <= econet_ones_count + 1;
                end else begin
                    econet_ones_count <= 0;
                end
                // Shift it into the receive register
                econet_shifter <= {econet_shifter[6:0], econet_data_sync[2]};
                // $display("econet_shifter about to be %b", {econet_shifter[6:0], econet_data_sync[2]});
                econet_bit_count <= econet_bit_count + 1;
                if (econet_bit_count == 7) begin
                    // Probably safe to assume this will never cause a serial overrun, as this would require an Econet line rate over 2MHz.
                    $display("received byte: put 0+%02x (0+%b) in serial shifter", {econet_shifter[6:0], econet_data_sync[2]}, {econet_shifter[6:0], econet_data_sync[2]});
                    serial_shifter <= {
                        1'b0, // it's data (not a flag)
                        {econet_data_sync[2],
                         econet_shifter[0],
                         econet_shifter[1],
                         econet_shifter[2],
                         econet_shifter[3],
                         econet_shifter[4],
                         econet_shifter[5],
                         econet_shifter[6]}, // data byte
                        1'b0  // start bit
                    };
                    serial_bit_count <= 11;
                end
            end
        end  // rising econet_clock edge
    end  // !mcu_is_transmitting
end
endmodule