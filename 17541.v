module UART (
  clk,
  reset,      // To reset, this should be HIGH when clk RISES
  tx_line,    // The external line between devices driven by this UART
  tx_data,    // The data to be transmitted
  tx_request, // RISING edge while tx_state is IDLE causes transmission to be initiated
);
  input       clk;
  input       reset;
  output      tx_line;
  input [7:0] tx_data;
  input       tx_request;
  parameter  TX_STATE_IDLE =          0;
  parameter  TX_STATE_TRANSMITTING =  1;
  parameter  CLK_RATE = 12*1000*1000;
  parameter  BAUD_RATE = 9600;
  // For baud rates lower than 9600, check that `tx_countdown` has enough bits
  // to store CLK_DIV.
  // When `clk` is 12 MHz, dividing by 1250 yields exactly 9600 bps
  parameter  CLK_DIV = CLK_RATE / BAUD_RATE;
  // The frame currently being transmitted.  If this is changed during a
  // transmission then it will screw up the transmission but that's OK because
  // the driver should *not* do that.
  reg [10:0]  frame = framed (8'h00);
  // The bit position in `frame` that is being driven on tx_line right now
  reg [3:0]   frame_bit_id = 0;
  reg         tx_state = TX_STATE_IDLE;
  reg [11:0]  tx_countdown = CLK_DIV;
  assign  tx_line = frame [frame_bit_id];
  always @ (posedge clk) begin
    if (reset) begin
      frame = framed (8'h00);
      frame_bit_id = 0;
      tx_state = TX_STATE_IDLE;
    end
    case (tx_state)
      // If the transmitter is not currently transmitting a frame..
      TX_STATE_IDLE: begin
        // If a request to send a frame has been received..
        // FIXME: This is a bit poo.  The frame will be sent multiple times if
        // `tx_request` is not driven low before the frame is sent
        if (tx_request) begin
          frame = framed (tx_data);
          frame_bit_id = 0;
          tx_countdown = CLK_DIV;
          tx_state = TX_STATE_TRANSMITTING;
        end
      end
      TX_STATE_TRANSMITTING: begin
        tx_countdown = tx_countdown - 1;
        // `tx_line` has been driven for a whole bit period when `tx_countdown`
        // reaches zero.  `frame_bit_id` therefore indicates the bit position
        // within frame that has *been* transmitted.
        if (tx_countdown == 0) begin
          if (frame_bit_id != 10) begin
            frame_bit_id = frame_bit_id + 1;
            tx_countdown = CLK_DIV;
          end else begin
            tx_state = TX_STATE_IDLE;
          end
        end
      end // TX_STATE_TRANSMITTING
    endcase // tx_state
  end // posedge clk
endmodule