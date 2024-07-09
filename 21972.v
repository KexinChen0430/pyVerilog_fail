module tx_hdr_fifo
    #(parameter C_DEPTH_PACKETS = 10,
      parameter C_MAX_HDR_WIDTH = 128,
      parameter C_PIPELINE_OUTPUT = 1,
      parameter C_PIPELINE_INPUT = 1,
      parameter C_VENDOR = "ALTERA"
      )
    (
     // Interface: Clocks
     input                          CLK,
     // Interface: Reset
     input                          RST_IN,
     // Interface: WR_TX_HDR
     input                          WR_TX_HDR_VALID,
     input [(C_MAX_HDR_WIDTH)-1:0]  WR_TX_HDR,
     input [`SIG_LEN_W-1:0]         WR_TX_HDR_PAYLOAD_LEN,
     input [`SIG_NONPAY_W-1:0]      WR_TX_HDR_NONPAY_LEN,
     input [`SIG_PACKETLEN_W-1:0]   WR_TX_HDR_PACKET_LEN,
     input                          WR_TX_HDR_NOPAYLOAD,
     output                         WR_TX_HDR_READY,
     // Interface: RD_TX_HDR
     output                         RD_TX_HDR_VALID,
     output [(C_MAX_HDR_WIDTH)-1:0] RD_TX_HDR,
     output [`SIG_LEN_W-1:0]        RD_TX_HDR_PAYLOAD_LEN,
     output [`SIG_NONPAY_W-1:0]     RD_TX_HDR_NONPAY_LEN,
     output [`SIG_PACKETLEN_W-1:0]  RD_TX_HDR_PACKET_LEN,
     output                         RD_TX_HDR_NOPAYLOAD,
     input                          RD_TX_HDR_READY
     );
`include "functions.vh"
    // Size of the header, plus the three metadata signals
    localparam C_WIDTH = (C_MAX_HDR_WIDTH) + `SIG_NONPAY_W + `SIG_PACKETLEN_W + 1 + `SIG_LEN_W;
    wire                            RST;
    wire                            wWrTxHdrReady;
    wire                            wWrTxHdrValid;
    wire [(C_MAX_HDR_WIDTH)-1:0]    wWrTxHdr;
    wire [`SIG_NONPAY_W-1:0]        wWrTxHdrNonpayLen;
    wire [`SIG_PACKETLEN_W-1:0]     wWrTxHdrPacketLen;
    wire [`SIG_LEN_W-1:0]           wWrTxHdrPayloadLen;
    wire                            wWrTxHdrNoPayload;
    wire                            wRdTxHdrReady;
    wire                            wRdTxHdrValid;
    wire [C_MAX_HDR_WIDTH-1:0]      wRdTxHdr;
    wire [`SIG_NONPAY_W-1:0]        wRdTxHdrNonpayLen;
    wire [`SIG_PACKETLEN_W-1:0]     wRdTxHdrPacketLen;
    wire [`SIG_LEN_W-1:0]           wRdTxHdrPayloadLen;
    wire                            wRdTxHdrNoPayload;
    assign RST = RST_IN;
    pipeline
        #(
          .C_DEPTH              (C_PIPELINE_INPUT?1:0),
          .C_USE_MEMORY         (0),
          /*AUTOINSTPARAM*/
          // Parameters
          .C_WIDTH                      (C_WIDTH))
    input_pipeline_inst
        (
         // Outputs
         .WR_DATA_READY         (WR_TX_HDR_READY),
         .RD_DATA               ({wWrTxHdr,wWrTxHdrNonpayLen,wWrTxHdrPacketLen,wWrTxHdrPayloadLen,wWrTxHdrNoPayload}),
         .RD_DATA_VALID         (wWrTxHdrValid),
         // Inputs
         .WR_DATA               ({WR_TX_HDR,WR_TX_HDR_NONPAY_LEN,WR_TX_HDR_PACKET_LEN,WR_TX_HDR_PAYLOAD_LEN,WR_TX_HDR_NOPAYLOAD}),
         .WR_DATA_VALID         (WR_TX_HDR_VALID),
         .RD_DATA_READY         (wWrTxHdrReady),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
    fifo
        #(
          // Parameters
          .C_DELAY             (0),
          /*AUTOINSTPARAM*/
          // Parameters
          .C_WIDTH                      (C_WIDTH),
          .C_DEPTH                      (C_DEPTH_PACKETS))
    fifo_inst
        (
         // Outputs
         .RD_DATA              ({wRdTxHdr,wRdTxHdrNonpayLen,wRdTxHdrPacketLen,wRdTxHdrPayloadLen,wRdTxHdrNoPayload}),
         .WR_READY             (wWrTxHdrReady),
         .RD_VALID             (wRdTxHdrValid),
         // Inputs
         .WR_DATA              ({wWrTxHdr,wWrTxHdrNonpayLen,wWrTxHdrPacketLen,wWrTxHdrPayloadLen,wWrTxHdrNoPayload}),
         .WR_VALID             (wWrTxHdrValid),
         .RD_READY             (wRdTxHdrReady),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST                           (RST));
    pipeline
        #(
          .C_DEPTH              (C_PIPELINE_OUTPUT?1:0),
          .C_USE_MEMORY         (0),
          /*AUTOINSTPARAM*/
          // Parameters
          .C_WIDTH                      (C_WIDTH))
    output_pipeline_inst
        (
         // Outputs
         .WR_DATA_READY         (wRdTxHdrReady),
         .RD_DATA               ({RD_TX_HDR,RD_TX_HDR_NONPAY_LEN,RD_TX_HDR_PACKET_LEN,RD_TX_HDR_PAYLOAD_LEN,RD_TX_HDR_NOPAYLOAD}),
         .RD_DATA_VALID         (RD_TX_HDR_VALID),
         // Inputs
         .WR_DATA              ({wRdTxHdr,wRdTxHdrNonpayLen,wRdTxHdrPacketLen,wRdTxHdrPayloadLen,wRdTxHdrNoPayload}),
         .WR_DATA_VALID         (wRdTxHdrValid),
         .RD_DATA_READY         (RD_TX_HDR_READY),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
endmodule