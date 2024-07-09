module txc_translation_layer
    #(
      parameter C_PCI_DATA_WIDTH = 10'd128,
      parameter C_PIPELINE_INPUT = 1,
      parameter C_PIPELINE_OUTPUT = 0
      )
    (
     // Interface: Clocks
     input                                   CLK,
     // Interface: Resets
     input                                   RST_IN,
     // Interface: TXC Classic
     output                                  TXC_PKT_READY,
     input [C_PCI_DATA_WIDTH-1:0]            TXC_PKT,
     input                                   TXC_PKT_VALID,
     input                                   TXC_PKT_START_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TXC_PKT_START_OFFSET,
     input                                   TXC_PKT_END_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TXC_PKT_END_OFFSET,
     // Interface: CC
     input                                   S_AXIS_CC_TREADY,
     output                                  S_AXIS_CC_TVALID,
     output                                  S_AXIS_CC_TLAST,
     output [C_PCI_DATA_WIDTH-1:0]           S_AXIS_CC_TDATA,
     output [(C_PCI_DATA_WIDTH/32)-1:0]      S_AXIS_CC_TKEEP,
     output [`SIG_CC_TUSER_W-1:0]            S_AXIS_CC_TUSER
     );
`include "functions.vh"
    localparam C_INPUT_STAGES = C_PIPELINE_INPUT != 0? 1:0;
    localparam C_OUTPUT_STAGES = C_PIPELINE_OUTPUT != 0? 1:0;
    wire                                     wTxcPktReady;
    wire [C_PCI_DATA_WIDTH-1:0]              wTxcPkt;
    wire                                     wTxcPktValid;
    wire                                     wTxcPktStartFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]   wTxcPktStartOffset;
    wire                                     wTxcPktEndFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]   wTxcPktEndOffset;
    wire                                     wSAxisCcTReady;
    wire                                     wSAxisCcTValid;
    wire                                     wSAxisCcTLast;
    wire [C_PCI_DATA_WIDTH-1:0]              wSAxisCcTData;
    wire [(C_PCI_DATA_WIDTH/32)-1:0]         wSAxisCcTKeep;
    wire [`SIG_CC_TUSER_W-1:0]               wSAxisCcTUser;
    /*ASSIGN TXC -> CC*/
    assign wTxcPktReady = wSAxisCcTReady;
    assign wSAxisCcTValid = wTxcPktValid;
    assign wSAxisCcTLast = wTxcPktEndFlag;
    assign wSAxisCcTData = wTxcPkt;
    assign S_AXIS_CC_TUSER = `SIG_CC_TUSER_W'd0; // Do not enable parity bits, and no discontinues
    pipeline
        #(
          // Parameters
          .C_DEPTH                         (C_INPUT_STAGES),
          .C_WIDTH                         (C_PCI_DATA_WIDTH + 2*(1+clog2s(C_PCI_DATA_WIDTH/32))),
          .C_USE_MEMORY                    (0)
          /*AUTOINSTPARAM*/)
    input_inst
        (
         // Outputs
         .WR_DATA_READY                  (TXC_PKT_READY),
         .RD_DATA                        ({wTxcPkt,wTxcPktStartFlag,wTxcPktStartOffset,wTxcPktEndFlag,wTxcPktEndOffset}),
         .RD_DATA_VALID                  (wTxcPktValid),
         // Inputs
         .WR_DATA                        ({TXC_PKT,TXC_PKT_START_FLAG,TXC_PKT_START_OFFSET,
                                           TXC_PKT_END_FLAG,TXC_PKT_END_OFFSET}),
         .WR_DATA_VALID                  (TXC_PKT_VALID),
         .RD_DATA_READY                  (wTxcPktReady),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
    offset_to_mask
        #(
          // Parameters
          .C_MASK_SWAP                  (0),
          .C_MASK_WIDTH                 (C_PCI_DATA_WIDTH/32)
          /*AUTOINSTPARAM*/)
    otom_inst
        (
         // Outputs
         .MASK                          (wSAxisCcTKeep),
         // Inputs
         .OFFSET_ENABLE                 (wTxcPktEndFlag),
         .OFFSET                        (wTxcPktEndOffset)
         /*AUTOINST*/);
    pipeline
        #(
          // Parameters
          .C_DEPTH                         (C_OUTPUT_STAGES),
          .C_WIDTH                         (C_PCI_DATA_WIDTH + 1 + (C_PCI_DATA_WIDTH/32)),
          .C_USE_MEMORY                    (0)
          /*AUTOINSTPARAM*/)
    output_inst
        (
         // Outputs
         .WR_DATA_READY                  (wSAxisCcTReady),
         .RD_DATA                        ({S_AXIS_CC_TDATA,S_AXIS_CC_TLAST,S_AXIS_CC_TKEEP}),
         .RD_DATA_VALID                  (S_AXIS_CC_TVALID),
         // Inputs
         .WR_DATA                        ({wSAxisCcTData,wSAxisCcTLast,wSAxisCcTKeep}),
         .WR_DATA_VALID                  (wSAxisCcTValid),
         .RD_DATA_READY                  (S_AXIS_CC_TREADY),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
endmodule