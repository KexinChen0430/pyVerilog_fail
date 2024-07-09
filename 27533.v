module
	      .rst(reset),                      // Synchronous reset
	      .rx(RS232_Rx),                // Incoming serial line
	      .tx(RS232_Tx),                // Outgoing serial line
	      .transmit(transmit),              // Signal to transmit
	      .tx_byte(tx_byte),                // Byte to transmit
	      .received(received),              // Indicated that a byte has been received
	      .rx_byte(rx_byte),                // Byte received
	      .is_receiving(is_receiving),      // Low when receive line is idle
	      .is_transmitting(is_transmitting),// Low when transmit line is idle
	      .recv_error(recv_error)           // Indicates error in receiving packet.
	      );
   // input and output to be communicated
   reg [31:0] 		   vinput;  // input and output are reserved keywords
   reg [7:0] 		   vcontrol; // Control byte, the MSB (most significant byte) of the transmission
   reg [7:0] 		   voutput;
   reg [7:0] 		   vcheck; // Checksum byte; the input bytes are summed and sent back as output
   // We need to receive multiple bytes sequentially, so this sets up both
   // reading and writing. Adapted from the uart-adder from
   // https://github.com/cyrozap/iCEstick-UART-Demo/pull/3/files
   parameter read_A                 = 1'd0;
   parameter read_wait              = 1'd1;
   parameter write_A                = 1'd0;
   parameter write_done             = 1'd1;
   reg 			   writestate = write_A;
   reg [5:0] 		   writecount = 0;
   reg [1:0] 		   readstate = read_A;
   reg [5:0] 		   readcount = 0;
   parameter STATE_RECEIVING   = 2'd0;
   parameter STATE_CALCULATING = 2'd1;
   parameter STATE_SENDING     = 2'd2;
   // These set the behavior based on the control byte
   parameter CONT_SET_DELAY = 8'd0;
   parameter CONT_SET_PERIOD = 8'd1;
   parameter CONT_SET_PUMP = 8'd2;
   parameter CONT_SET_PROBE = 8'd3;
   parameter CONT_TOGGLE_PUMP = 8'd4;
   parameter CONT_SET_ATT = 8'd5;
   parameter CONT_READ_TEST = 8'd6;
   reg [2:0] 		   state = STATE_RECEIVING;
      // The communication runs at the 12 MHz clock rather than the 200 MHz clock.
   always @(posedge clk) begin
      case (state)
        STATE_RECEIVING: begin
           transmit <= 0;
	   case (readstate)
	     read_A: begin
		if(received) begin
		   if(readcount == 6'd32) begin // Last byte in the transmission
		      vcontrol <= rx_byte;
		      state<=STATE_CALCULATING;
		      readcount <= 0;
		      readstate <= read_A;
		   end
		   else begin // Read the first bytes into vinput
		      vinput[readcount +: 8]=rx_byte;
		      readcount = readcount + 8;
		      readstate <= read_wait;
		   end
		end
	     end // case: read_A
	     read_wait: begin // Wait for the next byte to arrive
		if(~received) begin
		   readstate <= read_A;
		end
	     end
	   endcase // case (readstate)
	end // case: STATE_RECEIVING
	// Based on the control byte, assign a new value to the desired pulse parameter
        STATE_CALCULATING: begin
           writestate   <= write_A;
	   vcheck = vinput[31:24] + vinput[23:16] + vinput[15:8] + vinput[7:0];
	   case (vcontrol)
	     CONT_SET_DELAY: begin
		delay <= vinput;
		voutput <= vcheck;
	     end
	     CONT_SET_PERIOD: begin
		period <= vinput;
		voutput <= vcheck;
	     end
	     CONT_SET_PUMP: begin
		p1width <= vinput;
	     end
	     CONT_SET_PROBE: begin
		p2width <= vinput;
		voutput <= vcheck;
	     end
	     CONT_TOGGLE_PUMP: begin
		pump <= vinput[0];
		voutput <= vcheck;
	     end
	     CONT_SET_ATT: begin
		pp_probe <= vinput[7:0];
		Att1 <= vinput[7:0];
		Att3 <= vinput[15:8];
		pp_pump <= vinput[23:16];
		pp_on <= vinput[24];
		voutput <= vcheck;
	     end
	     CONT_READ_TEST: begin
		voutput <= vcheck;
	     end
	   endcase // case (vcontrol)
//           state <= STATE_SENDING;
           state <= STATE_RECEIVING;
        end
        /*
           case (writestate)
	     write_A: begin
		if (~ is_transmitting) begin
                   transmit <= 1;
		   writestate  <= write_done;
                   tx_byte <= voutput;
                   state     <= STATE_SENDING;
		end
	     end
	     write_done: begin
		if (~ is_transmitting) begin
                   writestate <= write_A;
                   state     <= STATE_RECEIVING;
                   transmit <= 0;
		end
	     end
           endcase
        end
	 */
        default: begin
           // should not be reached
           state     <= STATE_RECEIVING;
           readcount <= read_A;
        end
      endcase // case (state)
      // After each change, update the pulse parameters
      p2start <= p1width + delay;
      sync_up <= p2start + p2width;
      att_down <= sync_up + att_delay;
   end // always @ (posedge iCE_CLK)
endmodule