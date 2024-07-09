module)
  // This code takes Q bits of our rn as the new slot counter.
  // If we get a query or queryAdj, the state machine will
  //   set slotcounter = newslotcounter as defined here:
  wire [14:0] newslotcounter;
  wire [3:0] q_ctl;
  assign q_ctl = (rx_cmd == QUERY) ? rx_q : q_adj;
  reg [14:0] slotcountermask;
  always @ (q_ctl) begin
  case(q_ctl)
    0:  slotcountermask = 15'b000000000000000;
    1:  slotcountermask = 15'b000000000000001;
    2:  slotcountermask = 15'b000000000000011;
    3:  slotcountermask = 15'b000000000000111;
    4:  slotcountermask = 15'b000000000001111;
    5:  slotcountermask = 15'b000000000011111;
    6:  slotcountermask = 15'b000000000111111;
    7:  slotcountermask = 15'b000000001111111;
    8:  slotcountermask = 15'b000000011111111;
    9:  slotcountermask = 15'b000000111111111;
    10: slotcountermask = 15'b000001111111111;
    11: slotcountermask = 15'b000011111111111;
    12: slotcountermask = 15'b000111111111111;
    13: slotcountermask = 15'b001111111111111;
    14: slotcountermask = 15'b011111111111111;
    15: slotcountermask = 15'b111111111111111;
    default: slotcountermask = 15'b000000000000000;
  endcase
  end
  assign newslotcounter = currentrn[14:0] & slotcountermask;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      commstate <= STATE_RX;
      bitsrcselect    <= 2'd0;
      docrc     <= 0;
      tx_en     <= 0;
      rx_en     <= 0;
      tagisopen <= 0;
      rx_q_reg  <= 0;
      slotcounter  <= 0;
      storedhandle <= 0;
      readfrommsp  <= 0;
    end else if (commstate == STATE_TX) begin
      if(txsetupdone) begin
        rx_en <= 0;
      end
      if(tx_done) begin // tx_done
        tx_en     <= 0;
        commstate <= STATE_RX;
      end else begin
        tx_en <= 1;
      end
      end else if (commstate == STATE_RX) begin  // rx mode
        if(packet_complete) begin
          case (rx_cmd)
           QUERYREP: begin
             tagisopen   <= 0;
             slotcounter <= slotcounter - 15'd1;
             if (comm_enable & ((slotcounter-15'd1)==0 | ~use_q)) begin
               commstate     <= STATE_TX;
               bitsrcselect        <= bitsrcselect_RNG;
               docrc         <= 0;
             end else begin
               rx_en <= 0;  // reset rx
             end
           end
           ACK: begin
             tagisopen <= 0;
             if (comm_enable && handlematch) begin
               commstate <= STATE_TX; // send ack.
               bitsrcselect    <= use_uid ? bitsrcselect_UID : bitsrcselect_EPC;
               docrc     <= 1;
             end else begin
             rx_en <= 0;  // reset rx
             end
           end
           QUERY: begin
             tagisopen <= 0;
             rx_q_reg  <= rx_q;
             // load slot counter
             slotcounter <= newslotcounter;
             if (comm_enable & (newslotcounter==0 | ~use_q)) begin
               commstate     <= STATE_TX;
               bitsrcselect        <= bitsrcselect_RNG;
               docrc         <= 0;
             end else begin
               rx_en <= 0;  // reset rx
             end
           end
           QUERYADJ: begin
             tagisopen <= 0;
             rx_q_reg  <= q_adj;
             // load slot counter
             slotcounter <= newslotcounter;
             if (comm_enable & (newslotcounter==0 | ~use_q)) begin
               commstate     <= STATE_TX;
               bitsrcselect        <= bitsrcselect_RNG;
               docrc         <= 0;
             end else begin
               rx_en <= 0;  // reset rx
             end
           end
           SELECT: begin
             tagisopen <= 0;
             rx_en <= 0;  // reset rx
           end
           NACK: begin
             tagisopen <= 0;
             rx_en     <= 0;  // reset rx
           end
           REQRN: begin
             if (comm_enable && handlematch) begin
               // First request RN opens tag, sets handle
               if (!tagisopen) begin
                 storedhandle <= currentrn;
                 tagisopen    <= 1;
               end
               commstate <= STATE_TX;
               bitsrcselect    <= bitsrcselect_RNG;
               docrc     <= 1;
             end else begin
               rx_en <= 0;  // reset rx
             end
           end
           READ: begin
             if (comm_enable && handlematch) begin
               if (readwriteptr == 0) readfrommsp <= 0;
               else                   readfrommsp <= 1;
               commstate  <= STATE_TX;
               bitsrcselect     <= bitsrcselect_ADC;
               docrc      <= 1;
             end else begin
               rx_en <= 0;  // reset rx
             end
           end
           WRITE: begin
             rx_en <= 0;  // reset rx
           end
          default begin
             rx_en <= 0;  // reset rx
          end
          endcase
        end else if(rx_overflow) begin
          rx_en <= 0;
        end else begin
          rx_en <= 1;
          tx_en <= 0;
        end
      end
    end
endmodule