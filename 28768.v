module
	always @ (*) begin
		next_state = current_state;
		case (current_state)
			state_rst : begin  // 0
				if (!send_data) begin
					next_state = state_idle;
				end
			end
			// Step used to reinit the counter register
			state_idle : begin  // 1
				next_state = state_delay;
			end
			// Check: is this the time to send a 32 bit data to fifo_spi ?
			state_delay : begin  // 2
				if (delay_cnt >= delay) begin
					next_state = state_check_block;
				end
			end
			// Check: is the SPI blocked (CC3200 TCP conn slow) ?
			state_check_block : begin  // 3
				if ( (!fifo_busy) && (!fifo_full)) begin
					next_state = state_start_send;
				end
			end
			state_start_send : begin  // 4
				next_state = state_cnt_increase;
			end
			state_cnt_increase : begin  // 5
				next_state = state_idle;
			end
			default : next_state = state_rst;
		endcase
	end
endmodule