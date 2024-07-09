module txr_formatter_ultrascale
    #(
      parameter C_PCI_DATA_WIDTH = 128,
      parameter C_PIPELINE_INPUT = 1,
      parameter C_PIPELINE_OUTPUT = 1,
      parameter C_MAX_HDR_WIDTH = `UPKT_TXR_MAXHDR_W,
      parameter C_MAX_NONPAY_DWORDS = 5,
      parameter C_MAX_PACKET_DWORDS = 10
      )
    (
     // Interface: Clocks
     input                         CLK,
     // Interface: Resets
     input                         RST_IN,
     // Interface: Configuration
     input [`SIG_CPLID_W-1:0]      CONFIG_COMPLETER_ID,
     // Interface: TXR
     input                         TXR_META_VALID,
     input [`SIG_FBE_W-1:0]        TXR_META_FDWBE,
     input [`SIG_LBE_W-1:0]        TXR_META_LDWBE,
     input [`SIG_ADDR_W-1:0]       TXR_META_ADDR,
     input [`SIG_LEN_W-1:0]        TXR_META_LENGTH,
     input [`SIG_TAG_W-1:0]        TXR_META_TAG,
     input [`SIG_TC_W-1:0]         TXR_META_TC,
     input [`SIG_ATTR_W-1:0]       TXR_META_ATTR,
     input [`SIG_TYPE_W-1:0]       TXR_META_TYPE,
     input                         TXR_META_EP,
     output                        TXR_META_READY,
     // Interface: TX HDR
     output                        TX_HDR_VALID,
     output [C_MAX_HDR_WIDTH-1:0]  TX_HDR,
     output [`SIG_LEN_W-1:0]       TX_HDR_PAYLOAD_LEN,
     output [`SIG_NONPAY_W-1:0]    TX_HDR_NONPAY_LEN,
     output [`SIG_PACKETLEN_W-1:0] TX_HDR_PACKET_LEN,
     output                        TX_HDR_NOPAYLOAD,
     input                         TX_HDR_READY
     );
    wire                           wHdrNoPayload;
    wire [`UPKT_TXR_MAXHDR_W-1:0]  wHdr;
    wire                           wTxHdrReady;
    wire                           wTxHdrValid;
    wire [`UPKT_TXR_MAXHDR_W-1:0]  wTxHdr;
    wire [`SIG_NONPAY_W-1:0]       wTxHdrNonpayLen;
    wire [`SIG_PACKETLEN_W-1:0]    wTxHdrPacketLen;
    wire [`SIG_LEN_W-1:0]          wTxHdrPayloadLen;
    wire                           wTxHdrNopayload;
    wire [`SIG_TYPE_W-1:0]         wTxHdrType;
    // Generic Header Fields
    assign wHdr[`UPKT_TXR_ATYPE_R] = `UPKT_TXR_ATYPE_W'd0;
    assign wHdr[`UPKT_TXR_ADDR_R] = TXR_META_ADDR[63:2];
    assign wHdr[`UPKT_TXR_LENGTH_R] = {1'b0,TXR_META_LENGTH};
    assign wHdr[`UPKT_TXR_EP_R] = TXR_META_EP;
`ifdef BE_HACK
    assign wHdr[`UPKT_TXR_FBE_R] = TXR_META_FDWBE;
    assign wHdr[`UPKT_TXR_LBE_R] = TXR_META_LDWBE;
    assign wHdr[`UPKT_TXR_RSVD0_R] = 0;
`else
    assign wHdr[`UPKT_TXR_REQID_R] = CONFIG_COMPLETER_ID;
`endif
    //assign wHdr[`UPKT_TXR_REQID_R] = `UPKT_TXR_REQID_W'd0;
    assign wHdr[`UPKT_TXR_TAG_R] = TXR_META_TAG;
    assign wHdr[`UPKT_TXR_CPLID_R] = `UPKT_TXR_CPLID_W'd0;
    assign wHdr[`UPKT_TXR_REQIDEN_R] = 0;
    assign wHdr[`UPKT_TXR_TC_R] = TXR_META_TC;
    assign wHdr[`UPKT_TXR_ATTR_R] = TXR_META_ATTR;
    assign wHdr[`UPKT_TXR_TD_R] = `UPKT_TXR_TD_W'd0;
    assign wTxHdr[`UPKT_TXR_TYPE_R] = trellis_to_upkt_type(wTxHdrType);
    assign wTxHdrNopayload = ~wTxHdrType[`TRLS_TYPE_PAY_I];
    assign wTxHdrNonpayLen = 4;
    assign wTxHdrPayloadLen = wTxHdrNopayload ? 0 : wTxHdr[`UPKT_TXR_LENGTH_R];
    assign wTxHdrPacketLen = wTxHdrNonpayLen + wTxHdrPayloadLen;
    pipeline
        #(
          // Parameters
          .C_DEPTH                         (C_PIPELINE_INPUT?1:0),
          .C_WIDTH                         (`UPKT_TXR_MAXHDR_W-1),
          .C_USE_MEMORY                    (0)
          /*AUTOINSTPARAM*/)
    input_inst
        (
         // Outputs
         .WR_DATA_READY                  (TXR_META_READY),
         .RD_DATA                        ({wTxHdr[`UPKT_TXR_MAXHDR_W-1:(`UPKT_TXR_TYPE_I + `UPKT_TXR_TYPE_W)],
                                           wTxHdr[`UPKT_TXR_TYPE_I-1:0],
                                           wTxHdrType}),
         .RD_DATA_VALID                  (wTxHdrValid),
         // Inputs
         .WR_DATA                        ({wHdr[`UPKT_TXR_MAXHDR_W-1:(`UPKT_TXR_TYPE_I + `UPKT_TXR_TYPE_W)],
                                           wHdr[`UPKT_TXR_TYPE_I-1:0],
                                           TXR_META_TYPE}),
         .WR_DATA_VALID                  (TXR_META_VALID),
         .RD_DATA_READY                  (wTxHdrReady),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
    pipeline
        #(
          // Parameters
          .C_DEPTH                         (C_PIPELINE_OUTPUT?1:0),
          .C_WIDTH                         (`UPKT_TXR_MAXHDR_W + 1 + `SIG_PACKETLEN_W + `SIG_LEN_W + `SIG_NONPAY_W),
          .C_USE_MEMORY                    (0)
          /*AUTOINSTPARAM*/)
    output_inst
        (
         // Outputs
         .WR_DATA_READY                  (wTxHdrReady),
         .RD_DATA                        ({TX_HDR,TX_HDR_NOPAYLOAD,TX_HDR_PACKET_LEN,TX_HDR_PAYLOAD_LEN,TX_HDR_NONPAY_LEN}),
         .RD_DATA_VALID                  (TX_HDR_VALID),
         // Inputs
         .WR_DATA                        ({wTxHdr,wTxHdrNopayload,wTxHdrPacketLen,wTxHdrPayloadLen,wTxHdrNonpayLen}),
         .WR_DATA_VALID                  (wTxHdrValid),
         .RD_DATA_READY                  (TX_HDR_READY),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
endmodule