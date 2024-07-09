module
		rst, 					// Synchronous reset.
		rx, 					// Incoming serial line
		tx, 					// Outgoing serial line
		transmit, 				// Signal to transmit
		tx_byte, 				// Byte to transmit
		received, 				// Indicated that a byte has been received.
		rx_byte, 				// Byte received
		is_receiving, 			// Low when receive line is idle.
		is_transmitting, 		// Low when transmit line is idle.
		recv_error 				// Indicates error in receiving packet.
    );
	////
	// communication loop
	////
	always @(posedge clk_96M) begin
		if(rst) begin
			rst <= DISABLE;
		end
		else if(received) begin
			case(state)
				STATE_RCV_REG:
					begin
						register[6:0] = rx_byte[6:0];
						// check if bit 7 is 0, this means read access
						if(rx_byte[7] == 0) begin
							////
							// handle register command
							////
							case(register)
								REG_STATUS			: tx_byte[7:0] = status[7:0];
								REG_LED				: tx_byte[7:0] = r_led[7:0];
								REG_MEMADR_RD_LO	: tx_byte[7:0] = memadr_rd[7:0];
								REG_MEMADR_RD_HI	: tx_byte[7:0] = memadr_rd[13:8];
								REG_MEMADR_WR_LO	: tx_byte[7:0] = memadr_wr[7:0];
								REG_MEMADR_WR_HI	: tx_byte[7:0] = memadr_wr[13:8];
								REG_MEM				: state <= STATE_RCV_VAL;				// this takes the number of bytes as a parameter
								REG_TRIG_EN			: tx_byte[7:0] = trig_en[7:0];
								REG_TRIG_VAL		: tx_byte[7:0] = trig_val[7:0];
								REG_CLKDIV_LO		: tx_byte[7:0] = clkdiv[7:0];
								REG_CLKDIV_HI		: tx_byte[7:0] = clkdiv[15:8];
								default				: tx_byte[7:0] = 8'hff;
							endcase
							// for single read access, begin data transfer
							if(register != REG_MEM) begin
								transmit <= ENABLE;
							end
						end
						else begin
							// write access always takes a parameter
							state <= STATE_RCV_VAL;
						end
					end
				STATE_RCV_VAL:
					begin
						value[7:0] = rx_byte[7:0];
						////
						// handle parameter
						////
						case(register)
							REG_STATUS			:
								begin
									status[0] = value[0];	// start sampling
									status[2] = value[2];	// enable trigger
								end
							REG_LED				: r_led[7:0] = value[7:0];
							REG_MEMADR_RD_LO	: memadr_rd[7:0] = value[7:0];
							REG_MEMADR_RD_HI	: memadr_rd[13:8] = value[5:0];
							REG_MEM				: memcnt_rd[7:0] = value[7:0];
							REG_TRIG_EN			: trig_en[7:0] = value[7:0];
							REG_TRIG_VAL		: trig_val[7:0] = value[7:0];
							REG_CLKDIV_LO		: clkdiv[7:0] = value[7:0];
							REG_CLKDIV_HI		: clkdiv[15:8] = value[7:0];
						endcase
						// reset sample clk
						if(register == REG_CLKDIV_LO || register == REG_CLKDIV_HI) begin
							clk_sample_rst = ENABLE;
						end
						// ready to receive next command
						state <= STATE_RCV_REG;
					end
			endcase
		end
		else if(is_transmitting) begin
			transmit <= DISABLE;
		end
		else if(!transmit && memcnt_rd) begin
			// send the requested bytes from memory until count is zero
			tx_byte[7:0] = memdata_out[7:0];
			memadr_rd = memadr_rd + 1;
			memcnt_rd = memcnt_rd - 1;
			transmit <= ENABLE;
		end
		else if(status[1] && status[0]) begin
			status[0] = 1'b0;
		end
		else begin
			// enable sample clk in case it was disabled
			clk_sample_rst = DISABLE;
		end
	end
	////
	// sampling loop
	////
	always @(posedge clk_sample) begin
		// stop writing to memory
		memwe = DISABLE;
		// start sampling is requesetd but sampling not started
		if(status[0] && !status[1] &&
			// check trigger if enabled
			(!status[2] || (status[2] && (pin[7:0] & trig_en[7:0]) == trig_val[7:0])))
			begin
			memadr_wr = 14'h00;			// start writing samples to address 0
			status[1] = ENABLE;			// sampling started
		end
		// sampling already in progress
		else if(status[1]) begin
			memdata_in[7:0] = pin[7:0];		// put sample to memory
			memadr_wr = memadr_wr + 1;		// auto advance to next address
			memwe = ENABLE;				// write to memory
			// when address is 0 again, whole sample memory is written - done sampling
			if(!memadr_wr) begin
				status[1] = DISABLE;
			end
		end
	end
	reg [7:0] r_pout = 8'h0;
	// create some test data on the output
	always @(posedge clk_24M) begin
		r_pout <= r_pout + 1;
	end
	assign x2en = 1'b1;
	assign led[7:0] = ~r_led[7:0];
	assign pout = r_pout;
endmodule