module txr_engine_classic
    #(
      parameter C_PCI_DATA_WIDTH = 128,
      parameter C_PIPELINE_INPUT = 1,
      parameter C_PIPELINE_OUTPUT = 0,
      parameter C_MAX_PAYLOAD_DWORDS = 64,
      parameter C_DEPTH_PACKETS = 10,
      parameter C_VENDOR = "ALTERA"
      )
    (
     // Interface: Clocks
     input                                    CLK,
     // Interface: Resets
     input                                    RST_IN,
     // Interface: Configuration
     input [`SIG_CPLID_W-1:0]                 CONFIG_COMPLETER_ID,
     // Interface: TXR Classic
     input                                    TXR_TLP_READY,
     output [C_PCI_DATA_WIDTH-1:0]            TXR_TLP,
     output                                   TXR_TLP_VALID,
     output                                   TXR_TLP_START_FLAG,
     output [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TXR_TLP_START_OFFSET,
     output                                   TXR_TLP_END_FLAG,
     output [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TXR_TLP_END_OFFSET,
     // Interface: TXR Engine
     input                                    TXR_DATA_VALID,
     input [C_PCI_DATA_WIDTH-1:0]             TXR_DATA,
     input                                    TXR_DATA_START_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0]  TXR_DATA_START_OFFSET,
     input                                    TXR_DATA_END_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0]  TXR_DATA_END_OFFSET,
     output                                   TXR_DATA_READY,
     input                                    TXR_META_VALID,
     input [`SIG_FBE_W-1:0]                   TXR_META_FDWBE,
     input [`SIG_LBE_W-1:0]                   TXR_META_LDWBE,
     input [`SIG_ADDR_W-1:0]                  TXR_META_ADDR,
     input [`SIG_LEN_W-1:0]                   TXR_META_LENGTH,
     input [`SIG_TAG_W-1:0]                   TXR_META_TAG,
     input [`SIG_TC_W-1:0]                    TXR_META_TC,
     input [`SIG_ATTR_W-1:0]                  TXR_META_ATTR,
     input [`SIG_TYPE_W-1:0]                  TXR_META_TYPE,
     input                                    TXR_META_EP,
     output                                   TXR_META_READY
     );
    localparam C_DATA_WIDTH = C_PCI_DATA_WIDTH;
    localparam C_MAX_HDR_WIDTH = `TLP_MAXHDR_W;
    localparam C_MAX_ALIGN_WIDTH = (C_VENDOR == "ALTERA") ? 32:
                                   (C_VENDOR == "XILINX") ? 0  :
                                   0;
    localparam C_PIPELINE_FORMATTER_INPUT = C_PIPELINE_INPUT;
    localparam C_PIPELINE_FORMATTER_OUTPUT = C_PIPELINE_OUTPUT;
    localparam C_FORMATTER_DELAY = C_PIPELINE_FORMATTER_OUTPUT + C_PIPELINE_FORMATTER_INPUT;
    /*AUTOWIRE*/
    /*AUTOINPUT*/
    wire                                      wTxHdrReady;
    wire                                      wTxHdrValid;
    wire [C_MAX_HDR_WIDTH-1:0]                wTxHdr;
    wire [`SIG_TYPE_W-1:0]                    wTxType;
    wire [`SIG_NONPAY_W-1:0]                  wTxHdrNonpayLen;
    wire [`SIG_PACKETLEN_W-1:0]               wTxHdrPacketLen;
    wire [`SIG_LEN_W-1:0]                     wTxHdrPayloadLen;
    wire                                      wTxHdrNopayload;
    txr_formatter_classic
        #(
          .C_PIPELINE_OUTPUT            (C_PIPELINE_FORMATTER_OUTPUT),
          .C_PIPELINE_INPUT             (C_PIPELINE_FORMATTER_INPUT),
          /*AUTOINSTPARAM*/
          // Parameters
          .C_PCI_DATA_WIDTH             (C_PCI_DATA_WIDTH),
          .C_MAX_HDR_WIDTH              (C_MAX_HDR_WIDTH),
          .C_MAX_ALIGN_WIDTH            (C_MAX_ALIGN_WIDTH),
          .C_VENDOR                     (C_VENDOR))
    txr_formatter_inst
        (
         // Outputs
         .TX_HDR_VALID                  (wTxHdrValid),
         .TX_HDR                        (wTxHdr[C_MAX_HDR_WIDTH-1:0]),
         .TX_HDR_NOPAYLOAD              (wTxHdrNopayload),
         .TX_HDR_PAYLOAD_LEN            (wTxHdrPayloadLen[`SIG_LEN_W-1:0]),
         .TX_HDR_NONPAY_LEN             (wTxHdrNonpayLen[`SIG_NONPAY_W-1:0]),
         .TX_HDR_PACKET_LEN             (wTxHdrPacketLen[`SIG_PACKETLEN_W-1:0]),
         // Inputs
         .TX_HDR_READY                  (wTxHdrReady),
         /*AUTOINST*/
         // Outputs
         .TXR_META_READY                (TXR_META_READY),
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN),
         .CONFIG_COMPLETER_ID           (CONFIG_COMPLETER_ID[`SIG_CPLID_W-1:0]),
         .TXR_META_VALID                (TXR_META_VALID),
         .TXR_META_FDWBE                (TXR_META_FDWBE[`SIG_FBE_W-1:0]),
         .TXR_META_LDWBE                (TXR_META_LDWBE[`SIG_LBE_W-1:0]),
         .TXR_META_ADDR                 (TXR_META_ADDR[`SIG_ADDR_W-1:0]),
         .TXR_META_LENGTH               (TXR_META_LENGTH[`SIG_LEN_W-1:0]),
         .TXR_META_TAG                  (TXR_META_TAG[`SIG_TAG_W-1:0]),
         .TXR_META_TC                   (TXR_META_TC[`SIG_TC_W-1:0]),
         .TXR_META_ATTR                 (TXR_META_ATTR[`SIG_ATTR_W-1:0]),
         .TXR_META_TYPE                 (TXR_META_TYPE[`SIG_TYPE_W-1:0]),
         .TXR_META_EP                   (TXR_META_EP));
    tx_engine
        #(
          .C_DATA_WIDTH                 (C_PCI_DATA_WIDTH),
          /*AUTOINSTPARAM*/
          // Parameters
          .C_DEPTH_PACKETS              (C_DEPTH_PACKETS),
          .C_PIPELINE_INPUT             (C_PIPELINE_INPUT),
          .C_PIPELINE_OUTPUT            (C_PIPELINE_OUTPUT),
          .C_FORMATTER_DELAY            (C_FORMATTER_DELAY),
          .C_MAX_HDR_WIDTH              (C_MAX_HDR_WIDTH),
          .C_MAX_PAYLOAD_DWORDS         (C_MAX_PAYLOAD_DWORDS),
          .C_VENDOR                     (C_VENDOR))
    txr_engine_inst
        (
         // Outputs
         .TX_HDR_READY                  (wTxHdrReady),
         .TX_DATA_READY                 (TXR_DATA_READY),
         .TX_PKT                        (TXR_TLP[C_DATA_WIDTH-1:0]),
         .TX_PKT_START_FLAG             (TXR_TLP_START_FLAG),
         .TX_PKT_START_OFFSET           (TXR_TLP_START_OFFSET[clog2s(C_DATA_WIDTH/32)-1:0]),
         .TX_PKT_END_FLAG               (TXR_TLP_END_FLAG),
         .TX_PKT_END_OFFSET             (TXR_TLP_END_OFFSET[clog2s(C_DATA_WIDTH/32)-1:0]),
         .TX_PKT_VALID                  (TXR_TLP_VALID),
         // Inputs
         .TX_HDR_VALID                  (wTxHdrValid),
         .TX_HDR                        (wTxHdr[C_MAX_HDR_WIDTH-1:0]),
         .TX_HDR_NOPAYLOAD              (wTxHdrNopayload),
         .TX_HDR_PAYLOAD_LEN            (wTxHdrPayloadLen[`SIG_LEN_W-1:0]),
         .TX_HDR_NONPAY_LEN             (wTxHdrNonpayLen[`SIG_NONPAY_W-1:0]),
         .TX_HDR_PACKET_LEN             (wTxHdrPacketLen[`SIG_PACKETLEN_W-1:0]),
         .TX_DATA_VALID                 (TXR_DATA_VALID),
         .TX_DATA                       (TXR_DATA[C_DATA_WIDTH-1:0]),
         .TX_DATA_START_FLAG            (TXR_DATA_START_FLAG),
         .TX_DATA_START_OFFSET          (TXR_DATA_START_OFFSET[clog2s(C_DATA_WIDTH/32)-1:0]),
         .TX_DATA_END_FLAG              (TXR_DATA_END_FLAG),
         .TX_DATA_END_OFFSET            (TXR_DATA_END_OFFSET[clog2s(C_DATA_WIDTH/32)-1:0]),
         .TX_PKT_READY                  (TXR_TLP_READY),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
endmodule