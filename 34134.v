module txc_formatter_ultrascale
    #(
      parameter C_PCI_DATA_WIDTH = 128,
      parameter C_PIPELINE_INPUT = 1,
      parameter C_PIPELINE_OUTPUT = 1,
      parameter C_MAX_HDR_WIDTH = `UPKT_TXC_MAXHDR_W
      )
    (
     // Interface: Clocks
     input                         CLK,
     // Interface: Resets
     input                         RST_IN,
     // Interface: Configuration
     input [`SIG_CPLID_W-1:0]      CONFIG_COMPLETER_ID,
     // Interface: TXC
     input                         TXC_META_VALID,
     input [`SIG_FBE_W-1:0]        TXC_META_FDWBE,
     input [`SIG_LBE_W-1:0]        TXC_META_LDWBE,
     input [`SIG_LOWADDR_W-1:0]    TXC_META_ADDR,
     input [`SIG_LEN_W-1:0]        TXC_META_LENGTH,
     input [`SIG_TYPE_W-1:0]       TXC_META_TYPE,
     input [`SIG_BYTECNT_W-1:0]    TXC_META_BYTE_COUNT,
     input [`SIG_TAG_W-1:0]        TXC_META_TAG,
     input [`SIG_REQID_W-1:0]      TXC_META_REQUESTER_ID,
     input [`SIG_TC_W-1:0]         TXC_META_TC,
     input [`SIG_ATTR_W-1:0]       TXC_META_ATTR,
     input                         TXC_META_EP,
     output                        TXC_META_READY,
     // Interface: TX HDR
     output                        TX_HDR_VALID,
     output [C_MAX_HDR_WIDTH-1:0]  TX_HDR,
     output [`SIG_LEN_W-1:0]       TX_HDR_PAYLOAD_LEN,
     output [`SIG_NONPAY_W-1:0]    TX_HDR_NONPAY_LEN,
     output [`SIG_PACKETLEN_W-1:0] TX_HDR_PACKET_LEN,
     output                        TX_HDR_NOPAYLOAD,
     input                         TX_HDR_READY
     );
    wire [`UPKT_TXC_MAXHDR_W-1:0]  wHdr;
    wire                           wTxHdrReady;
    wire                           wTxHdrValid;
    wire [C_MAX_HDR_WIDTH-1:0]     wTxHdr;
    wire [`SIG_TYPE_W-1:0]         wTxType;
    wire [`SIG_NONPAY_W-1:0]       wTxHdrNonpayLen;
    wire [`SIG_PACKETLEN_W-1:0]    wTxHdrPacketLen;
    wire [`SIG_LEN_W-1:0]          wTxHdrPayloadLen;
    wire                           wTxHdrNopayload;
    // Generic Header Fields
    // ATYPE Should be copied from the request parameters, but we only use 0
    assign wHdr[`UPKT_TXC_ADDRLOW_R] = TXC_META_ADDR;
    assign wHdr[`UPKT_TXC_RSVD0_R] = `UPKT_TXC_RSVD0_W'd0;
    assign wHdr[`UPKT_TXC_ATYPE_R] = `UPKT_TXC_ATYPE_W'd0;
    assign wHdr[`UPKT_TXC_RSVD1_R] = `UPKT_TXC_RSVD1_W'd0;
    assign wHdr[`UPKT_TXC_BYTECNT_R] = {1'b0,TXC_META_BYTE_COUNT};
    assign wHdr[`UPKT_TXC_LOCKED_R] = `UPKT_TXC_LOCKED_W'd0;
    assign wHdr[`UPKT_TXC_RSVD2_R] = `UPKT_TXC_RSVD2_W'd0;
    assign wHdr[`UPKT_TXC_LENGTH_R] = {1'b0, TXC_META_LENGTH};
    assign wHdr[`UPKT_TXC_STATUS_R] = `UPKT_TXC_STATUS_W'd0;
    assign wHdr[`UPKT_TXC_EP_R] = TXC_META_EP;
    assign wHdr[`UPKT_TXC_RSVD3_R] = `UPKT_TXC_RSVD3_W'd0;
    assign wHdr[`UPKT_TXC_REQID_R] = TXC_META_REQUESTER_ID;
    assign wHdr[`UPKT_TXC_TAG_R] = TXC_META_TAG;
    assign wHdr[`UPKT_TXC_CPLID_R] = CONFIG_COMPLETER_ID;
    assign wHdr[`UPKT_TXC_CPLIDEN_R] = 1'b0;
    assign wHdr[`UPKT_TXC_TC_R] = TXC_META_TC;
    assign wHdr[`UPKT_TXC_ATTR_R] = TXC_META_ATTR;
    assign wHdr[`UPKT_TXC_TD_R] = `UPKT_TXC_TD_W'd0;
    assign wTxHdrNopayload = ~wTxType[`TRLS_TYPE_PAY_I];
    assign wTxHdrNonpayLen = 3;
    assign wTxHdrPayloadLen = wTxHdrNopayload ? 0 : wTxHdr[`UPKT_TXC_LENGTH_I +: `SIG_LEN_W];
    assign wTxHdrPacketLen = wTxHdrPayloadLen + wTxHdrNonpayLen;
    pipeline
        #(
          // Parameters
          .C_DEPTH                         (C_PIPELINE_INPUT?1:0),
          .C_WIDTH                         (C_MAX_HDR_WIDTH + `SIG_TYPE_W),
          .C_USE_MEMORY                    (0)
          /*AUTOINSTPARAM*/)
    input_inst
        (
         // Outputs
         .WR_DATA_READY                  (TXC_META_READY),
         .RD_DATA                        ({wTxHdr,wTxType}),
         .RD_DATA_VALID                  (wTxHdrValid),
         // Inputs
         .WR_DATA                        ({32'b0,wHdr,TXC_META_TYPE}),
         .WR_DATA_VALID                  (TXC_META_VALID),
         .RD_DATA_READY                  (wTxHdrReady),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
    pipeline
        #(
          // Parameters
          .C_DEPTH                         (C_PIPELINE_OUTPUT?1:0),
          .C_WIDTH                         (C_MAX_HDR_WIDTH+ 1 + `SIG_PACKETLEN_W + `SIG_LEN_W + `SIG_NONPAY_W),
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