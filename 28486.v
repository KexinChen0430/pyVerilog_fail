module txr_formatter_classic
    #(
      parameter C_PCI_DATA_WIDTH = 128,
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
`include "functions.vh"
    wire                           wWrReq;
    wire [`TLP_FMT_W-1:0]          wHdrLoFmt;
    wire [63:0]                    wHdrLo;
    wire [63:0]                    _wTxHdr;
    wire                           wTxHdrReady;
    wire                           wTxHdrValid;
    wire [(`TLP_REQADDR_W/2)-1:0]  wTxHdrAddr[1:0];
    wire [(`TLP_REQADDR_W/2)-1:0]  wTxHdrAddrDW0;
    wire                           wTxHdr4DW;
    wire                           wTxHdrAlignmentNeeded;
    wire [C_MAX_HDR_WIDTH-1:0]     wTxHdr;
    wire [`SIG_TYPE_W-1:0]         wTxType;
    wire [`SIG_NONPAY_W-1:0]       wTxHdrNonpayLen;
    wire [`SIG_PACKETLEN_W-1:0]    wTxHdrPacketLen;
    wire [`SIG_LEN_W-1:0]          wTxHdrPayloadLen;
    wire                           wTxHdrNopayload;
    assign wHdrLoFmt = {1'b0, TXR_META_TYPE[`TRLS_TYPE_PAY_I],1'bx};
    // Reserved Fields
    assign wHdrLo[`TLP_RSVD0_R] = `TLP_RSVD0_V;
    assign wHdrLo[`TLP_ADDRTYPE_R] = `TLP_ADDRTYPE_W'b0;
    assign wHdrLo[`TLP_TH_R] = `TLP_TH_W'b0;
    assign wHdrLo[`TLP_RSVD1_R] = `TLP_RSVD1_V;
    assign wHdrLo[`TLP_RSVD2_R] = `TLP_RSVD2_V;
    // Generic Header Fields
    assign wHdrLo[`TLP_LEN_R] = TXR_META_LENGTH;
    assign wHdrLo[`TLP_EP_R] = TXR_META_EP;
    assign wHdrLo[`TLP_TD_R] = `TLP_NODIGEST_V;
    assign wHdrLo[`TLP_ATTR0_R] = TXR_META_ATTR[1:0];
    assign wHdrLo[`TLP_ATTR1_R] = TXR_META_ATTR[2];
    assign wHdrLo[`TLP_TYPE_R] = TXR_META_TYPE; // WORKAROUND
    assign wHdrLo[`TLP_TC_R] = TXR_META_TC;
    assign wHdrLo[`TLP_FMT_R] = wHdrLoFmt;
    // Request Specific Fields
    assign wHdrLo[`TLP_REQFBE_R] = TXR_META_FDWBE;
    assign wHdrLo[`TLP_REQLBE_R] = TXR_META_LDWBE;
    assign wHdrLo[`TLP_REQTAG_R] = TXR_META_TAG;
    assign wHdrLo[`TLP_REQREQID_R] = CONFIG_COMPLETER_ID;
    // Second header formatting stage
    assign wTxHdr4DW = wTxHdrAddr[1] != 32'b0;
    assign {wTxHdr[`TLP_FMT_R],wTxHdr[`TLP_TYPE_R]} = trellis_to_tlp_type(_wTxHdr[`TLP_TYPE_I +: `SIG_TYPE_W],wTxHdr4DW);
    assign wTxHdr[`TLP_TYPE_I-1:0] = _wTxHdr[`TLP_TYPE_I-1:0];
    assign wTxHdr[63:32] = _wTxHdr[63:32];
    assign wTxHdr[127:64] = {wTxHdrAddr[~wTxHdr4DW],wTxHdrAddr[wTxHdr4DW]};
    // Metadata, to the aligner
    assign wTxHdrNopayload = ~wTxHdr[`TLP_PAYBIT_I];
    assign wTxHdrAddrDW0 = wTxHdrAddr[0];
    assign wTxHdrAlignmentNeeded = (wTxHdrAddrDW0[2] == wTxHdr4DW);
    assign wTxHdrNonpayLen = {1'b0,{wTxHdr4DW,~wTxHdr4DW,~wTxHdr4DW}} + ((C_VENDOR == "ALTERA") ? {3'b0,(wTxHdrAlignmentNeeded & ~wTxHdrNopayload)}:0);
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
         .WR_DATA_READY                  (TXR_META_READY),
         .RD_DATA                        ({wTxHdrAddr[1],wTxHdrAddr[0],_wTxHdr[63:0]}),
         .RD_DATA_VALID                  (wTxHdrValid),
         // Inputs
         .WR_DATA                        ({TXR_META_ADDR, wHdrLo}),
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