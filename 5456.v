module txr_translation_layer
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
     // Interface: TXR Classic
     output                                  TXR_PKT_READY,
     input [C_PCI_DATA_WIDTH-1:0]            TXR_PKT,
     input                                   TXR_PKT_VALID,
     input                                   TXR_PKT_START_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TXR_PKT_START_OFFSET,
     input                                   TXR_PKT_END_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TXR_PKT_END_OFFSET,
     // Interface: RQ
     input                                   S_AXIS_RQ_TREADY,
     output                                  S_AXIS_RQ_TVALID,
     output                                  S_AXIS_RQ_TLAST,
     output [C_PCI_DATA_WIDTH-1:0]           S_AXIS_RQ_TDATA,
     output [(C_PCI_DATA_WIDTH/32)-1:0]      S_AXIS_RQ_TKEEP,
     output [`SIG_RQ_TUSER_W-1:0]            S_AXIS_RQ_TUSER
     );
    localparam C_INPUT_STAGES = C_PIPELINE_INPUT != 0? 1:0;
    localparam C_OUTPUT_STAGES = C_PIPELINE_OUTPUT != 0? 1:0;
    wire                                     wTxrPktReady;
    wire [C_PCI_DATA_WIDTH-1:0]              wTxrPkt;
    wire                                     wTxrPktValid;
    wire                                     wTxrPktStartFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]   wTxrPktStartOffset;
    wire                                     wTxrPktEndFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]   wTxrPktEndOffset;
    wire                                     wSAxisRqTReady;
    wire                                     wSAxisRqTValid;
    wire                                     wSAxisRqTLast;
    wire [C_PCI_DATA_WIDTH-1:0]              wSAxisRqTData;
    wire [(C_PCI_DATA_WIDTH/32)-1:0]         wSAxisRqTKeep;
    wire [`SIG_RQ_TUSER_W-1:0]               wSAxisRqTUser;
    wire                                     _wSAxisRqTReady;
    wire                                     _wSAxisRqTValid;
    wire                                     _wSAxisRqTLast;
    wire [C_PCI_DATA_WIDTH-1:0]              _wSAxisRqTData;
    wire [(C_PCI_DATA_WIDTH/32)-1:0]         _wSAxisRqTKeep;
    /*ASSIGN TXR -> RQ*/
    assign wTxrPktReady = _wSAxisRqTReady;
    assign _wSAxisRqTValid = wTxrPktValid;
    assign _wSAxisRqTLast = wTxrPktEndFlag;
    assign _wSAxisRqTData = wTxrPkt;
    // BE Hack
    assign wSAxisRqTUser[3:0] = wTxrPkt[(`UPKT_TXR_FBE_I % C_PCI_DATA_WIDTH) +: `UPKT_TXR_FBE_W];
    assign wSAxisRqTUser[7:4] = wTxrPkt[(`UPKT_TXR_LBE_I % C_PCI_DATA_WIDTH) +: `UPKT_TXR_LBE_W];
    assign wSAxisRqTUser[`SIG_RQ_TUSER_W-1:8] = 0;
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
         .WR_DATA_READY                  (TXR_PKT_READY),
         .RD_DATA                        ({wTxrPkt,wTxrPktStartFlag,wTxrPktStartOffset,wTxrPktEndFlag,wTxrPktEndOffset}),
         .RD_DATA_VALID                  (wTxrPktValid),
         // Inputs
         .WR_DATA                        ({TXR_PKT,TXR_PKT_START_FLAG,TXR_PKT_START_OFFSET,
                                           TXR_PKT_END_FLAG,TXR_PKT_END_OFFSET}),
         .WR_DATA_VALID                  (TXR_PKT_VALID),
         .RD_DATA_READY                  (wTxrPktReady),
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
         .MASK                          (_wSAxisRqTKeep),
         // Inputs
         .OFFSET_ENABLE                 (wTxrPktEndFlag),
         .OFFSET                        (wTxrPktEndOffset)
         /*AUTOINST*/);
    pipeline
        #(
          // Parameters
          .C_DEPTH                         (64/C_PCI_DATA_WIDTH),
          .C_WIDTH                         (C_PCI_DATA_WIDTH + 1 + (C_PCI_DATA_WIDTH/32)),
          .C_USE_MEMORY                    (0)
          /*AUTOINSTPARAM*/)
    fbe_hack_inst
        (
         // Outputs
         .WR_DATA_READY                  (_wSAxisRqTReady),
         .RD_DATA                        ({wSAxisRqTData,wSAxisRqTLast,wSAxisRqTKeep}),
         .RD_DATA_VALID                  (wSAxisRqTValid),
         // Inputs
         .WR_DATA                        ({_wSAxisRqTData,_wSAxisRqTLast,_wSAxisRqTKeep}),
         .WR_DATA_VALID                  (_wSAxisRqTValid),
         .RD_DATA_READY                  (wSAxisRqTReady),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
    pipeline
        #(
          // Parameters
          .C_DEPTH                         (C_OUTPUT_STAGES),
          .C_WIDTH                         (C_PCI_DATA_WIDTH + 1 + (C_PCI_DATA_WIDTH/32) + `SIG_RQ_TUSER_W),
          .C_USE_MEMORY                    (0)
          /*AUTOINSTPARAM*/)
    output_inst
        (
         // Outputs
         .WR_DATA_READY                  (wSAxisRqTReady),
         .RD_DATA                        ({S_AXIS_RQ_TDATA,S_AXIS_RQ_TLAST,S_AXIS_RQ_TKEEP,S_AXIS_RQ_TUSER}),
         .RD_DATA_VALID                  (S_AXIS_RQ_TVALID),
         // Inputs
         .WR_DATA                        ({wSAxisRqTData,wSAxisRqTLast,wSAxisRqTKeep,wSAxisRqTUser}),
         .WR_DATA_VALID                  (wSAxisRqTValid),
         .RD_DATA_READY                  (S_AXIS_RQ_TREADY),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
endmodule