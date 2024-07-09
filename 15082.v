module
            begin
               toshift <= 5'd16 - toread[4:0];
               state <= `STATE_EMITTING;
            end
          {3'd`STATE_EMITTING, 1'b?, 1'b1, 1'b?, 5'b0, 5'b?}:
            // Data has been emitted and no data is scheduled for reception
            state <= `STATE_SIGNALLING;
          {3'd`STATE_EMITTING, 1'b?, 1'b1, 1'b?, 5'b?, 5'b?}:
            // Data has been emitted, start data reception
            state <= `STATE_RECEIVING;
          {3'd`STATE_RECEIVING, 1'b?, 1'b?, 1'b1, 5'b?, 5'b0}:
            // Data has been received and needs no shifting
            begin
               shiftinbuffer <= inbuffer;
               state <= `STATE_SIGNALLING;
            end
          {3'd`STATE_RECEIVING, 1'b1, 1'b?, 1'b1, 5'b?, 5'b?}:
            // Data has been received and needs shifting
            begin
               shiftinbuffer <= inbuffer;
               state <= `STATE_SHIFTING;
            end
          {3'd`STATE_SHIFTING, 1'b1, 1'b?, 1'b?, 5'b?, 5'b0}:
            // Shifting has ended
            state <= `STATE_SIGNALLING;
          {3'd`STATE_SHIFTING, 1'b1, 1'b?, 1'b?, 5'b?, 5'b?}:
            // We are shifting incoming data left 8 bits at a time
            begin
               shiftinbuffer <= {shiftinbuffer[119:0],8'b0};
               toshift <= toshift - 5'd1;
            end
        endcase
    always @(posedge clock or negedge reset)
      if (~reset) picready <= 0;
      else if (rts_edge) picready <= 1;
      else if (start_emitting | start_receiving) picready <= 0;
    // synchro du rts sur notre domaine de clock
    always @(posedge clock or negedge reset)
      if (~reset) begin rts_r <= 0; rts_rr <= 0; end
      else begin rts_r <= rts; rts_rr <= rts_r; end
    assign inbytes = toread[4:0];
    assign sclk = emit_sclk | receive_sclk;
    assign irq = state == `STATE_SIGNALLING;
    assign emit_enable = state == `STATE_EMITTING;
    assign receive_enable = state == `STATE_RECEIVING;
    assign indata = shiftinbuffer;
endmodule