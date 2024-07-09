module txc_engine_ultrascale
    #(
      parameter C_PCI_DATA_WIDTH = 128,
      parameter C_PIPELINE_INPUT = 1,
      parameter C_PIPELINE_OUTPUT = 1,
      parameter C_DEPTH_PACKETS = 10,
      parameter C_MAX_PAYLOAD_DWORDS = 256
      )
    (
     // Interface: Clocks
     input                                   CLK,
     // Interface: Resets
     input                                   RST_IN,
     // Interface: Configuration
     input [`SIG_CPLID_W-1:0]                CONFIG_COMPLETER_ID,
     // Interface: CC
     input                                   S_AXIS_CC_TREADY,
     output                                  S_AXIS_CC_TVALID,
     output                                  S_AXIS_CC_TLAST,
     output [C_PCI_DATA_WIDTH-1:0]           S_AXIS_CC_TDATA,
     output [(C_PCI_DATA_WIDTH/32)-1:0]      S_AXIS_CC_TKEEP,
     output [`SIG_CC_TUSER_W-1:0]            S_AXIS_CC_TUSER,
     // Interface: TXC Engine
     input                                   TXC_DATA_VALID,
     input [C_PCI_DATA_WIDTH-1:0]            TXC_DATA,
     input                                   TXC_DATA_START_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TXC_DATA_START_OFFSET,
     input                                   TXC_DATA_END_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TXC_DATA_END_OFFSET,
     output                                  TXC_DATA_READY,
     input                                   TXC_META_VALID,
     input [`SIG_FBE_W-1:0]                  TXC_META_FDWBE,
     input [`SIG_LBE_W-1:0]                  TXC_META_LDWBE,
     input [`SIG_LOWADDR_W-1:0]              TXC_META_ADDR,
     input [`SIG_TYPE_W-1:0]                 TXC_META_TYPE,
     input [`SIG_LEN_W-1:0]                  TXC_META_LENGTH,
     input [`SIG_BYTECNT_W-1:0]              TXC_META_BYTE_COUNT,
     input [`SIG_TAG_W-1:0]                  TXC_META_TAG,
     input [`SIG_REQID_W-1:0]                TXC_META_REQUESTER_ID,
     input [`SIG_TC_W-1:0]                   TXC_META_TC,
     input [`SIG_ATTR_W-1:0]                 TXC_META_ATTR,
     input                                   TXC_META_EP,
     output                                  TXC_META_READY
     );
`include "functions.vh"
    localparam C_VENDOR = "XILINX";
    localparam C_DATA_WIDTH = C_PCI_DATA_WIDTH;
    localparam C_MAX_HDR_WIDTH = 128; // It's really 96... But it gets trimmed
    localparam C_MAX_HDR_DWORDS = C_MAX_HDR_WIDTH/32;
    localparam C_MAX_ALIGN_DWORDS = 0;
    localparam C_MAX_NONPAY_DWORDS = C_MAX_HDR_DWORDS + C_MAX_ALIGN_DWORDS;
    localparam C_PIPELINE_FORMATTER_INPUT = C_PIPELINE_INPUT;
    localparam C_PIPELINE_FORMATTER_OUTPUT = C_PIPELINE_OUTPUT;
    localparam C_FORMATTER_DELAY = C_PIPELINE_FORMATTER_OUTPUT + C_PIPELINE_FORMATTER_INPUT;
    /*AUTOWIRE*/
    /*AUTOINPUT*/
    wire                                     wTxHdrReady;
    wire                                     wTxHdrValid;
    wire [C_MAX_HDR_WIDTH-1:0]               wTxHdr;
    wire [`SIG_NONPAY_W-1:0]                 wTxHdrNonpayLen;
    wire [`SIG_PACKETLEN_W-1:0]              wTxHdrPacketLen;
    wire [`SIG_LEN_W-1:0]                    wTxHdrPayloadLen;
    wire                                     wTxHdrNopayload;
    wire                                     wTxDataReady;
    wire [C_PCI_DATA_WIDTH-1:0]              wTxData;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]   wTxDataEndOffset;
    wire                                     wTxDataStartFlag;
    wire [(C_PCI_DATA_WIDTH/32)-1:0]         wTxDataEndFlags;
    wire [(C_PCI_DATA_WIDTH/32)-1:0]         wTxDataWordValid;
    wire [(C_PCI_DATA_WIDTH/32)-1:0]         wTxDataWordReady;
    wire [C_PCI_DATA_WIDTH-1:0]              wTxcPkt;
    wire                                     wTxcPktEndFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]   wTxcPktEndOffset;
    wire                                     wTxcPktStartFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]   wTxcPktStartOffset;
    wire                                     wTxcPktValid;
    wire                                     wTxcPktReady;
    txc_formatter_ultrascale
        #(
          .C_PIPELINE_OUTPUT            (C_PIPELINE_FORMATTER_OUTPUT),
          .C_PIPELINE_INPUT             (C_PIPELINE_FORMATTER_INPUT),
          /*AUTOINSTPARAM*/
          // Parameters
          .C_PCI_DATA_WIDTH             (C_PCI_DATA_WIDTH),
          .C_MAX_HDR_WIDTH              (C_MAX_HDR_WIDTH))
    txc_formatter_inst
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
         .TXC_META_READY                (TXC_META_READY),
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN),
         .CONFIG_COMPLETER_ID           (CONFIG_COMPLETER_ID[`SIG_CPLID_W-1:0]),
         .TXC_META_VALID                (TXC_META_VALID),
         .TXC_META_FDWBE                (TXC_META_FDWBE[`SIG_FBE_W-1:0]),
         .TXC_META_LDWBE                (TXC_META_LDWBE[`SIG_LBE_W-1:0]),
         .TXC_META_ADDR                 (TXC_META_ADDR[`SIG_LOWADDR_W-1:0]),
         .TXC_META_LENGTH               (TXC_META_LENGTH[`SIG_LEN_W-1:0]),
         .TXC_META_TYPE                 (TXC_META_TYPE[`SIG_TYPE_W-1:0]),
         .TXC_META_BYTE_COUNT           (TXC_META_BYTE_COUNT[`SIG_BYTECNT_W-1:0]),
         .TXC_META_TAG                  (TXC_META_TAG[`SIG_TAG_W-1:0]),
         .TXC_META_REQUESTER_ID         (TXC_META_REQUESTER_ID[`SIG_REQID_W-1:0]),
         .TXC_META_TC                   (TXC_META_TC[`SIG_TC_W-1:0]),
         .TXC_META_ATTR                 (TXC_META_ATTR[`SIG_ATTR_W-1:0]),
         .TXC_META_EP                   (TXC_META_EP));
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
    txc_engine_inst
        (
         // Outputs
         .TX_HDR_READY                  (wTxHdrReady),
         .TX_DATA_READY                 (TXC_DATA_READY),
         .TX_PKT                        (wTxcPkt[C_DATA_WIDTH-1:0]),
         .TX_PKT_START_FLAG             (wTxcPktStartFlag),
         .TX_PKT_START_OFFSET           (wTxcPktStartOffset[clog2s(C_DATA_WIDTH/32)-1:0]),
         .TX_PKT_END_FLAG               (wTxcPktEndFlag),
         .TX_PKT_END_OFFSET             (wTxcPktEndOffset[clog2s(C_DATA_WIDTH/32)-1:0]),
         .TX_PKT_VALID                  (wTxcPktValid),
         // Inputs
         .TX_HDR_VALID                  (wTxHdrValid),
         .TX_HDR                        (wTxHdr[C_MAX_HDR_WIDTH-1:0]),
         .TX_HDR_NOPAYLOAD              (wTxHdrNopayload),
         .TX_HDR_PAYLOAD_LEN            (wTxHdrPayloadLen[`SIG_LEN_W-1:0]),
         .TX_HDR_NONPAY_LEN             (wTxHdrNonpayLen[`SIG_NONPAY_W-1:0]),
         .TX_HDR_PACKET_LEN             (wTxHdrPacketLen[`SIG_PACKETLEN_W-1:0]),
         .TX_DATA_VALID                 (TXC_DATA_VALID),
         .TX_DATA                       (TXC_DATA[C_DATA_WIDTH-1:0]),
         .TX_DATA_START_FLAG            (TXC_DATA_START_FLAG),
         .TX_DATA_START_OFFSET          (TXC_DATA_START_OFFSET[clog2s(C_DATA_WIDTH/32)-1:0]),
         .TX_DATA_END_FLAG              (TXC_DATA_END_FLAG),
         .TX_DATA_END_OFFSET            (TXC_DATA_END_OFFSET[clog2s(C_DATA_WIDTH/32)-1:0]),
         .TX_PKT_READY                  (wTxcPktReady),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
    txc_translation_layer
        #(
          // Parameters
          .C_PCI_DATA_WIDTH             (C_PCI_DATA_WIDTH),
          .C_PIPELINE_INPUT             (C_PIPELINE_INPUT),
          .C_PIPELINE_OUTPUT            (C_PIPELINE_OUTPUT)
          /*AUTOINSTPARAM*/)
    txc_trans_inst
        (
         // Outputs
         .TXC_PKT_READY                 (wTxcPktReady),
         .S_AXIS_CC_TVALID              (S_AXIS_CC_TVALID),
         .S_AXIS_CC_TLAST               (S_AXIS_CC_TLAST),
         .S_AXIS_CC_TDATA               (S_AXIS_CC_TDATA[C_PCI_DATA_WIDTH-1:0]),
         .S_AXIS_CC_TKEEP               (S_AXIS_CC_TKEEP[(C_PCI_DATA_WIDTH/32)-1:0]),
         .S_AXIS_CC_TUSER               (S_AXIS_CC_TUSER[`SIG_CC_TUSER_W-1:0]),
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN),
         .TXC_PKT                       (wTxcPkt),
         .TXC_PKT_VALID                 (wTxcPktValid),
         .TXC_PKT_START_FLAG            (wTxcPktStartFlag),
         .TXC_PKT_START_OFFSET          (wTxcPktStartOffset),
         .TXC_PKT_END_FLAG              (wTxcPktEndFlag),
         .TXC_PKT_END_OFFSET            (wTxcPktEndOffset),
         .S_AXIS_CC_TREADY              (S_AXIS_CC_TREADY)
         /*AUTOINST*/);
endmodule