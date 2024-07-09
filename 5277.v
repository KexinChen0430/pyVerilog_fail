module will not accept new data from the FIFO
  assign hold = 1'b0;
  usb_input usbtest(
    .clk(clock),
    .reset(reset),
    // USB FTDI I/O
    .data(data[7:0]),
    .rxf(rxf),
    .rd(rd),
    // Interface
    .out(out[7:0]),
    .newout(newout),
    .hold(hold)
  );
  wire [3:0] hundreds;
  wire [3:0] tens;
  wire [3:0] ones;
  BCD inputToBCD(
    .number({1'b0, audioSelector}),
    .hundreds(hundreds),
    .tens(tens),
    .ones(ones)
  );
  reg lastAudioTrigger;
  reg [2:0] third = 0;
  reg lastReady;
  // Set of 4 addresses that represent a playback sequence
  // First track in bottom 23 bits[22:0]. Last track in top bits [91:68].
  reg [91:0] playbackSeq = 2;
  reg [22:0] trackEndAddr = 0;
  reg playing = 0;
  reg lastPlaying = 0;
  reg [15:0] bytesRxed = 0;
  assign hexdisp = {playbackSeq[30:23], playbackSeq[7:0], 1'h0 ,trackEndAddr, 1'h0, raddr[22:0]};
  reg [7:0] dataFromFifo;
  always @ (posedge rd) begin
    dataFromFifo <= out; // out & data have same results
  end
  always @ (posedge clock) begin
    lastAudioTrigger <= audioTrigger;
    lastReady <= ready;
    lastPlaying <= playing;
    if (startSwitch) begin
      // write USB RX data if switch is up
      if (writeSwitch) begin
        writemode <= 1'b1;
        doread <= 1'b0;
        //dowrite <= 1'b0; // only write on new data // WATCH OUT!!
        if (newout) begin
          bytesRxed <= bytesRxed + 1;
          wdata <= {dataFromFifo, 8'b0};//{out, 8'b0};
          dowrite <= 1'b1;
        end
      end
      // if button is DOWN - scroll through addresses via buttons
      if (~writeSwitch) begin
        dowrite <= 1'b0;
        writemode <= 1'b0;
        doread <= 1'b1;
        if (playing & ready) begin // REMOVE audioTrigger
          if (raddr < trackEndAddr) begin
            // Normal 48K Playback
            raddr <= raddr + 1;
            to_ac97_data <= frdata[15:8]; // PUT BACK
          end
          else begin
            if (playbackSeq[45:23] < UNUSED_INDEX) begin
              // change raddr to next track
              raddr <= playbackSeq[45:23] * TRACK_LENGTH;
              // shift playbackSeq down
              playbackSeq <= {UNUSED_INDEX, playbackSeq[91:23]};
              // update trackEndAddr
              trackEndAddr <= playbackSeq[45:23] * TRACK_LENGTH + TRACK_LENGTH;
            end
            else if (playbackSeq[45:23] == UNUSED_INDEX) begin
              playing <= 0;
              raddr <= 0; // reset for safety - lower than UNUSED_ADDR
            end
          end
        end // if (playing & audioTrigger & ready)
        // if entering this state, assign start address
        if (audioTrigger & ~lastAudioTrigger) begin
          playing <= 1;
          case(ones)
            0: playbackSeq[91:23] <= {UNUSED_INDEX, USED_INDEX, PERCENT_INDEX};
            1: playbackSeq[91:23] <= {USED_INDEX, PERCENT_INDEX, ONE_INDEX};
            2: playbackSeq[91:23] <= {USED_INDEX, PERCENT_INDEX, TWO_INDEX};
            3: playbackSeq[91:23] <= {USED_INDEX, PERCENT_INDEX, THREE_INDEX};
            4: playbackSeq[91:23] <= {USED_INDEX, PERCENT_INDEX, FOUR_INDEX};
            5: playbackSeq[91:23] <= {USED_INDEX, PERCENT_INDEX, FIVE_INDEX};
            6: playbackSeq[91:23] <= {USED_INDEX, PERCENT_INDEX, SIX_INDEX};
            7: playbackSeq[91:23] <= {USED_INDEX, PERCENT_INDEX, SEVEN_INDEX};
            8: playbackSeq[91:23] <= {USED_INDEX, PERCENT_INDEX, EIGHT_INDEX};
            9: playbackSeq[91:23] <= {USED_INDEX, PERCENT_INDEX, NINE_INDEX};
            default:  playbackSeq <= {USED_INDEX, PERCENT_INDEX, UNUSED_INDEX}; // error
          endcase
          case (tens)
            0: playbackSeq[22:0] <= SKIP_INDEX;
            1: playbackSeq[22:0] <= TEN_INDEX;
            2: playbackSeq[22:0] <= TWENTY_INDEX;
            3: playbackSeq[22:0] <= THIRTY_INDEX;
            4: playbackSeq[22:0] <= FOURTY_INDEX;
            5: playbackSeq[22:0] <= FIFTY_INDEX;
            6: playbackSeq[22:0] <= SIXTY_INDEX;
            7: playbackSeq[22:0] <= SEVENTY_INDEX;
            8: playbackSeq[22:0] <= EIGHTY_INDEX;
            9: playbackSeq[22:0] <= NINETY_INDEX;
            default: playbackSeq[22:0] <= UNUSED_INDEX;
          endcase
          case (hundreds)
            0: begin end
            1: playbackSeq <= {UNUSED_INDEX, USED_INDEX, PERCENT_INDEX, HUNDRED_INDEX}; // error
          endcase
          case (audioSelector)
            11: playbackSeq <= {UNUSED_INDEX, USED_INDEX, PERCENT_INDEX, ELEVEN_INDEX};
            12: playbackSeq <= {UNUSED_INDEX, USED_INDEX, PERCENT_INDEX, TWELVE_INDEX};
            13: playbackSeq <= {UNUSED_INDEX, USED_INDEX, PERCENT_INDEX, THIRTEEN_INDEX};
            14: playbackSeq <= {UNUSED_INDEX, USED_INDEX, PERCENT_INDEX, FOURTEEN_INDEX};
            15: playbackSeq <= {UNUSED_INDEX, USED_INDEX, PERCENT_INDEX, FIFTEEN_INDEX};
            16: playbackSeq <= {USED_INDEX, PERCENT_INDEX, TEEN_INDEX, SIX_INDEX};
            17: playbackSeq <= {USED_INDEX, PERCENT_INDEX, TEEN_INDEX, SEVEN_INDEX};
            18: playbackSeq <= {USED_INDEX, PERCENT_INDEX, TEEN_INDEX, EIGHT_INDEX};
            19: playbackSeq <= {USED_INDEX, PERCENT_INDEX, TEEN_INDEX, NINE_INDEX};
            default: begin end
          endcase
        end // if (audioTrigger & ~lastAudioTrigger)
        // just started playing - need to set raddr
        // Assuming this happens once playbackSeq has been properly set
        if (playing & ~lastPlaying) begin
          if (playbackSeq[22:0] == SKIP_INDEX) begin
            playbackSeq <= {UNUSED_INDEX, playbackSeq[91:23]};
            raddr <= playbackSeq[45:23] * TRACK_LENGTH;
            trackEndAddr <= playbackSeq[45:23] * TRACK_LENGTH + TRACK_LENGTH;
          end
          else begin
            raddr <= playbackSeq[22:0] * TRACK_LENGTH;
            trackEndAddr <= playbackSeq[22:0] * TRACK_LENGTH + TRACK_LENGTH;
          end
        end
      end // if (~writeSwitch)
    end // if (startSwitch)
    else begin
      // TO ENABLE RESET:
      // writemode <= 1
      // dowrite <= 0
      // doread <= 0 // to be safe
      // Reset First, Write Second, Read Later
      writemode <= 1'h1;
      doread <= 1'h0;
      dowrite <= 1'h0;
    end
  end // always @
endmodule