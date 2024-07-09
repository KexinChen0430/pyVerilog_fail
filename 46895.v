module txr_engine_ultrascale
    #(parameter C_PCI_DATA_WIDTH = 128,
      parameter C_PIPELINE_INPUT = 1,
      parameter C_PIPELINE_OUTPUT = 1,
      parameter C_DEPTH_PACKETS = 10,
      parameter C_MAX_PAYLOAD_DWORDS = 256)
    (// Interface: Clocks
     input                                   CLK,
     // Interface: Resets
     input                                   RST_BUS, // Replacement for generic RST_IN
     input                                   RST_LOGIC, // Addition for RIFFA_RST
     output                                  DONE_TXR_RST,
     // Interface: Configuration
     input [`SIG_CPLID_W-1:0]                CONFIG_COMPLETER_ID,
     // Interface: RQ
     input                                   S_AXIS_RQ_TREADY,
     output                                  S_AXIS_RQ_TVALID,
     output                                  S_AXIS_RQ_TLAST,
     output [C_PCI_DATA_WIDTH-1:0]           S_AXIS_RQ_TDATA,
     output [(C_PCI_DATA_WIDTH/32)-1:0]      S_AXIS_RQ_TKEEP,
     output [`SIG_RQ_TUSER_W-1:0]            S_AXIS_RQ_TUSER,
     // Interface: TXR Engine
     input                                   TXR_DATA_VALID,
     input [C_PCI_DATA_WIDTH-1:0]            TXR_DATA,
     input                                   TXR_DATA_START_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TXR_DATA_START_OFFSET,
     input                                   TXR_DATA_END_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TXR_DATA_END_OFFSET,
     output                                  TXR_DATA_READY,
     input                                   TXR_META_VALID,
     input [`SIG_FBE_W-1:0]                  TXR_META_FDWBE,
     input [`SIG_LBE_W-1:0]                  TXR_META_LDWBE,
     input [`SIG_ADDR_W-1:0]                 TXR_META_ADDR,
     input [`SIG_LEN_W-1:0]                  TXR_META_LENGTH,
     input [`SIG_TAG_W-1:0]                  TXR_META_TAG,
     input [`SIG_TC_W-1:0]                   TXR_META_TC,
     input [`SIG_ATTR_W-1:0]                 TXR_META_ATTR,
     input [`SIG_TYPE_W-1:0]                 TXR_META_TYPE,
     input                                   TXR_META_EP,
     output                                  TXR_META_READY
     );
`include "functions.vh"
    localparam C_VENDOR = "XILINX";
    localparam C_DATA_WIDTH = C_PCI_DATA_WIDTH;
    localparam C_MAX_HDR_WIDTH = `UPKT_TXR_MAXHDR_W;
    localparam C_MAX_HDR_DWORDS = C_MAX_HDR_WIDTH/32;
    localparam C_MAX_ALIGN_DWORDS = 0;
    localparam C_MAX_NONPAY_DWORDS = C_MAX_HDR_DWORDS + C_MAX_ALIGN_DWORDS + 1;
    localparam C_MAX_PACKET_DWORDS = C_MAX_NONPAY_DWORDS + C_MAX_PAYLOAD_DWORDS;
    localparam C_PIPELINE_FORMATTER_INPUT = C_PIPELINE_INPUT;
    localparam C_PIPELINE_FORMATTER_OUTPUT = C_PIPELINE_OUTPUT;
    localparam C_FORMATTER_DELAY = C_PIPELINE_FORMATTER_OUTPUT + C_PIPELINE_FORMATTER_INPUT;
    localparam C_RST_COUNT = 10;
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
    wire [C_PCI_DATA_WIDTH-1:0]              wTxrPkt;
    wire                                     wTxrPktEndFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]   wTxrPktEndOffset;
    wire                                     wTxrPktStartFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]   wTxrPktStartOffset;
    wire                                     wTxrPktValid;
    wire                                     wTxrPktReady;
    wire                                     wTransDoneRst;
    wire                                     wTransRstOut;
    wire                                     wDoneEngRst;
    wire                                     wRst;
    wire [C_RST_COUNT:0]                     wShiftRegRst;
    assign DONE_TXR_RST = wTransDoneRst & wDoneEngRst;
    assign wRst = wShiftRegRst[C_RST_COUNT-3];
    assign wDoneEngRst = ~wShiftRegRst[C_RST_COUNT];
    shiftreg
        #(// Parameters
          .C_DEPTH                      (C_RST_COUNT),
          .C_WIDTH                      (1),
          .C_VALUE                      (1)
          /*AUTOINSTPARAM*/)
    rst_shiftreg
        (// Outputs
         .RD_DATA                       (wShiftRegRst),
         // Inputs
         .RST_IN                        (RST_BUS),
         .WR_DATA                       (wTransRstOut),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK));
    txr_formatter_ultrascale
        #(.C_PIPELINE_OUTPUT            (C_PIPELINE_FORMATTER_OUTPUT),
          .C_PIPELINE_INPUT             (C_PIPELINE_FORMATTER_INPUT),
          /*AUTOINSTPARAM*/
          // Parameters
          .C_PCI_DATA_WIDTH             (C_PCI_DATA_WIDTH),
          .C_MAX_HDR_WIDTH              (C_MAX_HDR_WIDTH),
          .C_MAX_NONPAY_DWORDS          (C_MAX_NONPAY_DWORDS),
          .C_MAX_PACKET_DWORDS          (C_MAX_PACKET_DWORDS))
    txr_formatter_inst
        (// Outputs
         .TX_HDR_VALID                  (wTxHdrValid),
         .TX_HDR                        (wTxHdr[C_MAX_HDR_WIDTH-1:0]),
         .TX_HDR_NOPAYLOAD              (wTxHdrNopayload),
         .TX_HDR_PAYLOAD_LEN            (wTxHdrPayloadLen[`SIG_LEN_W-1:0]),
         .TX_HDR_NONPAY_LEN             (wTxHdrNonpayLen[`SIG_NONPAY_W-1:0]),
         .TX_HDR_PACKET_LEN             (wTxHdrPacketLen[`SIG_PACKETLEN_W-1:0]),
         // Inputs
         .TX_HDR_READY                  (wTxHdrReady),
         .RST_IN                        (wRst),
         /*AUTOINST*/
         // Outputs
         .TXR_META_READY                (TXR_META_READY),
         // Inputs
         .CLK                           (CLK),
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
        #(.C_DATA_WIDTH                 (C_PCI_DATA_WIDTH),
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
        (// Outputs
         .TX_HDR_READY                  (wTxHdrReady),
         .TX_DATA_READY                 (TXR_DATA_READY),
         .TX_PKT                        (wTxrPkt[C_DATA_WIDTH-1:0]),
         .TX_PKT_START_FLAG             (wTxrPktStartFlag),
         .TX_PKT_START_OFFSET           (wTxrPktStartOffset[clog2s(C_DATA_WIDTH/32)-1:0]),
         .TX_PKT_END_FLAG               (wTxrPktEndFlag),
         .TX_PKT_END_OFFSET             (wTxrPktEndOffset[clog2s(C_DATA_WIDTH/32)-1:0]),
         .TX_PKT_VALID                  (wTxrPktValid),
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
         .TX_PKT_READY                  (wTxrPktReady),
         .RST_IN                        (wRst),// TODO:
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK));
    txr_translation_layer
        #(/*AUTOINSTPARAM*/
          // Parameters
          .C_PCI_DATA_WIDTH             (C_PCI_DATA_WIDTH),
          .C_PIPELINE_INPUT             (C_PIPELINE_INPUT),
          .C_RST_COUNT                  (C_RST_COUNT))
    txr_trans_inst
        (// Outputs
         .TXR_PKT_READY                 (wTxrPktReady),
         .DONE_RST                      (wTransDoneRst),
         .RST_OUT                       (wTransRstOut),
         // Inputs
         .TXR_PKT                       (wTxrPkt),
         .TXR_PKT_VALID                 (wTxrPktValid),
         .TXR_PKT_START_FLAG            (wTxrPktStartFlag),
         .TXR_PKT_START_OFFSET          (wTxrPktStartOffset),
         .TXR_PKT_END_FLAG              (wTxrPktEndFlag),
         .TXR_PKT_END_OFFSET            (wTxrPktEndOffset),
         /*AUTOINST*/
         // Outputs
         .S_AXIS_RQ_TVALID              (S_AXIS_RQ_TVALID),
         .S_AXIS_RQ_TLAST               (S_AXIS_RQ_TLAST),
         .S_AXIS_RQ_TDATA               (S_AXIS_RQ_TDATA[C_PCI_DATA_WIDTH-1:0]),
         .S_AXIS_RQ_TKEEP               (S_AXIS_RQ_TKEEP[(C_PCI_DATA_WIDTH/32)-1:0]),
         .S_AXIS_RQ_TUSER               (S_AXIS_RQ_TUSER[`SIG_RQ_TUSER_W-1:0]),
         // Inputs
         .CLK                           (CLK),
         .RST_BUS                       (RST_BUS),
         .RST_LOGIC                     (RST_LOGIC),
         .S_AXIS_RQ_TREADY              (S_AXIS_RQ_TREADY));
endmodule