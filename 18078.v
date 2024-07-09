module txc_formatter_classic
    #(
      parameter C_PCI_DATA_WIDTH = 10'd128,
      parameter C_MAX_HDR_WIDTH = `TLP_MAXHDR_W,
      parameter C_MAX_ALIGN_WIDTH = 32,
      parameter C_PIPELINE_INPUT = 1,
      parameter C_PIPELINE_OUTPUT = 1,
      parameter C_VENDOR = "ALTERA"
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
     input [`SIG_BYTECNT_W-1:0]    TXC_META_BYTE_COUNT,
     input [`SIG_TAG_W-1:0]        TXC_META_TAG,
     input [`SIG_TYPE_W-1:0]       TXC_META_TYPE,
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
`include "functions.vh"
    wire [C_MAX_HDR_WIDTH-1:0]     wCplHdr;
    wire                           wTxHdrReady;
    wire                           wTxHdrValid;
    wire [C_MAX_HDR_WIDTH-1:0]     wTxHdr;
    wire [`SIG_TYPE_W-1:0]         wTxType;
    wire [`SIG_NONPAY_W-1:0]       wTxHdrNonpayLen;
    wire [`SIG_PACKETLEN_W-1:0]    wTxHdrPacketLen;
    wire [`SIG_LEN_W-1:0]          wTxHdrPayloadLen;
    wire                           wTxHdrNopayload;
    wire [`TLP_CPLADDR_W-1:0]      wTxLoAddr;
    // Reserved Fields
    assign wCplHdr[`TLP_RSVD0_R] = `TLP_RSVD0_V;
    assign wCplHdr[`TLP_ADDRTYPE_R] = `TLP_ADDRTYPE_W'b0;
    assign wCplHdr[`TLP_TH_R] = `TLP_TH_W'b0;
    assign wCplHdr[`TLP_RSVD1_R] = `TLP_RSVD1_V;
    assign wCplHdr[`TLP_RSVD2_R] = `TLP_RSVD2_V;
    assign wCplHdr[`TLP_CPLBCM_R] = `TLP_CPLBCM_W'b0;
    assign wCplHdr[`TLP_CPLRSVD0_R] = `TLP_CPLRSVD0_W'b0;
    assign wCplHdr[127:96] = 32'b0;
    // Generic Header Fields
    assign wCplHdr[`TLP_LEN_R] = TXC_META_LENGTH;
    assign wCplHdr[`TLP_EP_R] = TXC_META_EP;
    assign wCplHdr[`TLP_TD_R] = `TLP_NODIGEST_V;
    assign wCplHdr[`TLP_ATTR0_R] = TXC_META_ATTR[1:0];
    assign wCplHdr[`TLP_ATTR1_R] = TXC_META_ATTR[2];
    assign {wCplHdr[`TLP_FMT_R], wCplHdr[`TLP_TYPE_R]} = trellis_to_tlp_type(TXC_META_TYPE,0);
    assign wCplHdr[`TLP_TC_R] = TXC_META_TC;
    // Completion Specific Fields
    assign wCplHdr[`TLP_CPLBYTECNT_R] = TXC_META_BYTE_COUNT;
    assign wCplHdr[`TLP_CPLSTAT_R] = 0;
    assign wCplHdr[`TLP_CPLCPLID_R] = CONFIG_COMPLETER_ID;
    assign wCplHdr[`TLP_CPLADDR_R] = TXC_META_ADDR;
    assign wCplHdr[`TLP_CPLTAG_R] = TXC_META_TAG;
    assign wCplHdr[`TLP_CPLREQID_R] = TXC_META_REQUESTER_ID;
    // Metadata, to the aligner
    assign wTxLoAddr = wTxHdr[`TLP_CPLADDR_R];
    assign wTxHdrNopayload = ~wTxHdr[`TLP_PAYBIT_I];
    assign wTxHdrNonpayLen = 3 + ((C_VENDOR == "ALTERA")? {3'b0,(~wTxLoAddr[2] & ~wTxHdrNopayload)} : 4'b0);
    assign wTxHdrPayloadLen = wTxHdrNopayload ? 0 : wTxHdr[`TLP_LEN_R];
    assign wTxHdrPacketLen = wTxHdrPayloadLen + wTxHdrNonpayLen;
    pipeline
        #(// Parameters
          .C_DEPTH                         (C_PIPELINE_INPUT?1:0),
          .C_WIDTH                         (C_MAX_HDR_WIDTH),
          .C_USE_MEMORY                    (0)
          /*AUTOINSTPARAM*/)
    input_inst
        (// Outputs
         .WR_DATA_READY                  (TXC_META_READY),
         .RD_DATA                        (wTxHdr),
         .RD_DATA_VALID                  (wTxHdrValid),
         // Inputs
         .WR_DATA                        (wCplHdr),
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