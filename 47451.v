module actually).
  // Until CS# asserts though keep the bits counter reset...
  if (cs) next_bits = 0;
  // Output on falling edge of sclk when cs asserted...
  if (!cs && dly_sclk && !sclk && !byteDone)
    begin
//      next_txBuffer = {txBuffer,1'b1};
      next_bits = bits + 1'b1;
      next_byteDone = &bits;
    end
  next_tx = (cs || byteDone) ? 1'b1 : next_txBuffer[~bits];
end
// Control FSM for sending 32 bit words out SPI interface...
parameter [1:0] INIT = 0, IDLE = 1, SEND = 2, POLL = 3;
reg [1:0] state, next_state;
initial state = INIT;
always @(posedge clock or posedge extReset)
begin
  if (extReset)
    begin
      state = INIT;
      sampled_send_data = 32'h0;
      sampled_send_valid = 4'h0;
      bytesel = 3'h0;
      busy = 1'b0;
    end
  else
    begin
      state = next_state;
      sampled_send_data = next_sampled_send_data;
      sampled_send_valid = next_sampled_send_valid;
      bytesel = next_bytesel;
      busy = next_busy;
    end
end
always @*
begin
  #1;
  next_state = state;
  next_sampled_send_data = sampled_send_data;
  next_sampled_send_valid = sampled_send_valid;
  next_bytesel = bytesel;
  next_busy = (state != IDLE) || send || !byteDone;
  writeReset = 1'b0;
  writeByte = 1'b0;
  case (state) // when write is '1', data will be available with next cycle
    INIT :
      begin
	writeReset = 1'b1;
        next_sampled_send_data = 32'h0;
        next_sampled_send_valid = 4'hF;
        next_bytesel = 3'h0;
        next_busy = 1'b0;
	next_state = IDLE;
      end
    IDLE :
      begin
        next_sampled_send_data = send_data;
        next_sampled_send_valid = send_valid;
	next_bytesel = 0;
        if (send)
          next_state = SEND;
        else if (query_id) // output dword containing "SLA1" signature
	  begin
            next_sampled_send_data = 32'h534c4131; // "SLA1"
            next_sampled_send_valid = 4'hF;
            next_state = SEND;
          end
        else if (query_dataIn)
	  begin
            next_sampled_send_data = dataIn;
            next_sampled_send_valid = 4'hF;
            next_state = SEND;
	  end
      end
    SEND : // output dword send by controller...
      begin
        writeByte = 1'b1;
        next_bytesel = bytesel + 1'b1;
	next_state = POLL;
      end
    POLL :
      begin
        if (byteDone)
	  next_state = (~|bytesel) ? IDLE : SEND;
      end
    default : next_state = INIT;
  endcase
end
endmodule