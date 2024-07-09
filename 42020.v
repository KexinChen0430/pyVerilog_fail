module
  wire [3:0] bitsrc;
  wire rngbitsrc, epcbitsrc, readbitsrc, uidbitsrc;
  assign bitsrc[0] = rngbitsrc;
  assign bitsrc[1] = epcbitsrc;
  assign bitsrc[2] = readbitsrc;
  assign bitsrc[3] = uidbitsrc;
  assign txbitsrc  = bitsrc[bitsrcselect];
  // mux control for data source done flag
  wire [3:0] datadone;
  wire rngdatadone, epcdatadone, readdatadone, uiddatadone;
  assign datadone[0] = rngdatadone;
  assign datadone[1] = epcdatadone;
  assign datadone[2] = readdatadone;
  assign datadone[3] = uiddatadone;
  assign txdatadone  = datadone[bitsrcselect];
  // mux control for tx data clock
  wire   rngbitclk, epcbitclk, readbitclk, uidbitclk;
  assign rngbitclk  = (bitsrcselect == BITSRC_RNG ) ? txbitclk : 1'b0;
  assign epcbitclk  = (bitsrcselect == BITSRC_EPC ) ? txbitclk : 1'b0;
  assign readbitclk = (bitsrcselect == BITSRC_READ) ? txbitclk : 1'b0;
  assign uidbitclk  = (bitsrcselect == BITSRC_UID ) ? txbitclk : 1'b0;
  // MUX connection from READ to MSP or ADC
  wire readfrommsp;
  wire readfromadc = !readfrommsp;
  wire read_sample_ctl, read_sample_clk, read_sample_datain;
  // ADC connections
  assign adc_sample_ctl     = read_sample_ctl    & readfromadc;
  assign adc_sample_clk     = read_sample_clk    & readfromadc;
  // MSP430 connections
  assign msp_sample_ctl     = read_sample_ctl    & readfrommsp;
  assign msp_sample_clk     = read_sample_clk    & readfrommsp;
  assign read_sample_datain = readfromadc ? adc_sample_datain : msp_sample_datain;
  // Serial debug interface for viewing registers:
  reg [3:0] debug_address;
  reg debug_out;
  always @ (posedge debug_clk or posedge reset) begin
    if(reset) begin
      debug_address <= 4'd0;
    end else begin
      debug_address <= debug_address + 4'd1;
    end
  end
  always @ (debug_address) begin
  case(debug_address)
    0:  debug_out = packet_complete;
    1:  debug_out = cmd_complete;
    2:  debug_out = handlematch;
    3:  debug_out = docrc;
    4:  debug_out = rx_en;
    5:  debug_out = tx_en;
    6:  debug_out = bitout;
    7:  debug_out = bitclk;
    8:  debug_out = rngbitin;
    9:  debug_out = rx_overflow;
    10: debug_out = tx_done;
    11: debug_out = txsetupdone;
    12: debug_out = 1'b0;
    13: debug_out = 1'b1;
    14: debug_out = 1'b0;
    15: debug_out = 1'b1;
    default: debug_out = 1'b0;
  endcase
  end
  // MODULES! :)
  controller U_CTL (reset, clk, rx_overflow, rx_cmd, currentrn, currenthandle,
                    packet_complete, txsetupdone, tx_done,
                    rx_en, tx_en, docrc, handlematch,
                    bitsrcselect, readfrommsp, readwriteptr, rx_q, rx_updn,
                    use_uid, use_q, comm_enable);
  txsettings U_SET (reset, trcal_in,  m_in,  dr_in,  trext_in, query_complete,
                           trcal_out, m_out, dr_out, trext_out);
  rx        U_RX  (rx_reset, clk, demodin, bitout, bitclk, rx_overflow, trcal_in, rngbitin);
  cmdparser U_CMD (rxtop_reset, bitout, bitclk, rx_cmd, packet_complete, cmd_complete,
                   m_in, trext_in, dr_in);
  packetparse U_PRSE (rx_reset, bitout, bitclk, rx_cmd, rx_q, rx_updn,
                      currenthandle, currentrn, handlematch,
                      readwritebank, readwriteptr, readwords,
                      writedataout, writedataclk );
  rng       U_RNG  (tx_reset, reset, rngbitin, rngbitinclk, rngbitclk, rngbitsrc, rngdatadone, currentrn);
  epc       U_EPC  (tx_reset, epcbitclk, epcbitsrc, epcdatadone);
  read      U_READ (tx_reset, readbitclk, readbitsrc, readdatadone,
                    read_sample_ctl, read_sample_clk, read_sample_datain,
                    currenthandle);
  uid       U_UID  (tx_reset, uidbitclk, uidbitsrc, uiddatadone,
                    uid_byte_in, uid_addr_out, uid_clk_out);
  sequencer U_SEQ (tx_reset, rx_overflow, clk, m_out, dr_out, docrc, trext_out,
                   trcal_out, txbitsrc, txdatadone, txbitclk, modout, txsetupdone, tx_done);
endmodule