module tx_mux
    #(
      parameter C_PCI_DATA_WIDTH = 128,
      parameter C_PIPELINE_INPUT = 1,
      parameter C_PIPELINE_OUTPUT = 1,
      parameter C_MUX_TYPE = "SHIFT",
      parameter C_VENDOR = "ALTERA"
      )
    (
     // Interface: Clocks
     input                                    CLK,
     // Interface: Resets
     input                                    RST_IN,
     // Interface: TXC
     input [C_PCI_DATA_WIDTH-1:0]             TXC_TLP,
     output                                   TXC_TLP_READY,
     input                                    TXC_TLP_VALID,
     input                                    TXC_TLP_START_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0]  TXC_TLP_START_OFFSET,
     input                                    TXC_TLP_END_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0]  TXC_TLP_END_OFFSET,
     // Interface: TXR
     input [C_PCI_DATA_WIDTH-1:0]             TXR_TLP,
     input                                    TXR_TLP_VALID,
     input                                    TXR_TLP_START_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0]  TXR_TLP_START_OFFSET,
     input                                    TXR_TLP_END_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0]  TXR_TLP_END_OFFSET,
     output                                   TXR_TLP_READY,
     // Interface: TX Classic
     input                                    TX_TLP_READY,
     output [C_PCI_DATA_WIDTH-1:0]            TX_TLP,
     output                                   TX_TLP_VALID,
     output                                   TX_TLP_START_FLAG,
     output [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TX_TLP_START_OFFSET,
     output                                   TX_TLP_END_FLAG,
     output [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TX_TLP_END_OFFSET
     );
`include "functions.vh"
    localparam C_WIDTH = (C_PCI_DATA_WIDTH + 2 * (clog2s(C_PCI_DATA_WIDTH/32) + 1));
    localparam C_TXC_PRIORITY = 1;
    localparam C_TXR_PRIORITY = 2;
    /*AUTOWIRE*/
    /*AUTOINPUT*/
    /*AUTOOUTPUT*/
    // Input Pipeline Stage to Mux
    wire [C_PCI_DATA_WIDTH-1:0]               wTxcTlp;
    wire                                      wTxcTlpReady;
    wire                                      wTxcTlpValid;
    wire                                      wTxcTlpStartFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]    wTxcTlpStartOffset;
    wire                                      wTxcTlpEndFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]    wTxcTlpEndOffset;
    wire [C_PCI_DATA_WIDTH-1:0]               wTxrTlp;
    wire                                      wTxrTlpReady;
    wire                                      wTxrTlpValid;
    wire                                      wTxrTlpStartFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]    wTxrTlpStartOffset;
    wire                                      wTxrTlpEndFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]    wTxrTlpEndOffset;
    // Output of Mux to
    wire [C_PCI_DATA_WIDTH-1:0]               wTxTlp;
    wire                                      wTxTlpReady;
    wire                                      wTxTlpValid;
    wire                                      wTxTlpStartFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]    wTxTlpStartOffset;
    wire                                      wTxTlpEndFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]    wTxTlpEndOffset;
    pipeline
        #(
          // Parameters
          .C_DEPTH                      (C_PIPELINE_INPUT?1:0),
          .C_USE_MEMORY                 (0),
          /*AUTOINSTPARAM*/
          // Parameters
          .C_WIDTH                      (C_WIDTH))
    txr_capture_inst
        (
         // Outputs
         .WR_DATA_READY                 (TXR_TLP_READY),
         .RD_DATA                       ({wTxrTlp, wTxrTlpStartFlag, wTxrTlpStartOffset,
                                          wTxrTlpEndFlag, wTxrTlpEndOffset}),
         .RD_DATA_VALID                 (wTxrTlpValid),
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN),
         .WR_DATA                       ({TXR_TLP,
                                          TXR_TLP_START_FLAG, TXR_TLP_START_OFFSET,
                                          TXR_TLP_END_FLAG, TXR_TLP_END_OFFSET}),
         .WR_DATA_VALID                 (TXR_TLP_VALID),
         .RD_DATA_READY                 (wTxrTlpReady));
    pipeline
        #(
          // Parameters
          .C_DEPTH                         (C_PIPELINE_INPUT?1:0),
          .C_USE_MEMORY                    (0),
          /*AUTOINSTPARAM*/
          // Parameters
          .C_WIDTH                      (C_WIDTH))
    txc_capture_inst
        (
         // Outputs
         .WR_DATA_READY                    (TXC_TLP_READY),
         .RD_DATA                          ({wTxcTlp, wTxcTlpStartFlag, wTxcTlpStartOffset,
                                             wTxcTlpEndFlag, wTxcTlpEndOffset}),
         .RD_DATA_VALID                    (wTxcTlpValid),
         // Inputs
         .WR_DATA                          ({TXC_TLP,
                                             TXC_TLP_START_FLAG, TXC_TLP_START_OFFSET,
                                             TXC_TLP_END_FLAG, TXC_TLP_END_OFFSET}),
         .WR_DATA_VALID                    (TXC_TLP_VALID),
         .RD_DATA_READY                    (wTxcTlpReady),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
    tx_arbiter
        #(/*AUTOINSTPARAM*/
          // Parameters
          .C_TXC_PRIORITY               (C_TXC_PRIORITY),
          .C_TXR_PRIORITY               (C_TXR_PRIORITY))
    tx_arbiter_inst
        (
         // Outputs
         .TXR_TLP_READY                    (wTxrTlpReady),
         .TXC_TLP_READY                    (wTxcTlpReady),
         // Inputs
         .TX_TLP_READY                     (wTxTlpReady),
         .TXC_TLP_VALID                    (wTxcTlpValid),
         .TXC_TLP_START_FLAG               (wTxcTlpStartFlag),
         .TXC_TLP_END_FLAG                 (wTxcTlpEndFlag),
         .TXR_TLP_VALID                    (wTxrTlpValid),
         .TXR_TLP_START_FLAG               (wTxrTlpStartFlag),
         .TXR_TLP_END_FLAG                 (wTxrTlpEndFlag),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
    // MUX Selector
    tx_phi
        #(/*AUTOINSTPARAM*/
          // Parameters
          .C_PCI_DATA_WIDTH             (C_PCI_DATA_WIDTH),
          .C_MUX_TYPE                   (C_MUX_TYPE),
          .C_WIDTH                      (C_WIDTH))
    tx_phi_inst
        (
         // Outputs
         .TXC_TLP_READY                    (wTxcTlpReady),
         .TXR_TLP_READY                    (wTxrTlpReady),
         .TX_TLP                           (wTxTlp),
         .TX_TLP_VALID                     (wTxTlpValid),
         .TX_TLP_START_FLAG                (wTxTlpStartFlag),
         .TX_TLP_START_OFFSET              (wTxTlpStartOffset),
         .TX_TLP_END_FLAG                  (wTxTlpEndFlag),
         .TX_TLP_END_OFFSET                (wTxTlpEndOffset),
         // Inputs
         .TXC_TLP                          (wTxcTlp),
         .TXC_TLP_VALID                    (wTxcTlpValid),
         .TXC_TLP_START_FLAG               (wTxcTlpStartFlag),
         .TXC_TLP_START_OFFSET             (wTxcTlpStartOffset),
         .TXC_TLP_END_FLAG                 (wTxcTlpEndFlag),
         .TXC_TLP_END_OFFSET               (wTxcTlpEndOffset),
         .TXR_TLP                          (wTxrTlp),
         .TXR_TLP_VALID                    (wTxrTlpValid),
         .TXR_TLP_START_FLAG               (wTxrTlpStartFlag),
         .TXR_TLP_START_OFFSET             (wTxrTlpStartOffset),
         .TXR_TLP_END_FLAG                 (wTxrTlpEndFlag),
         .TXR_TLP_END_OFFSET               (wTxrTlpEndOffset),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
    pipeline
        #(
          // Parameters
          .C_DEPTH                      (C_PIPELINE_OUTPUT?1:0),
          .C_USE_MEMORY                 (0),
          /*AUTOINSTPARAM*/
          // Parameters
          .C_WIDTH                      (C_WIDTH))
    tx_output_inst
        (
         // Outputs
         .WR_DATA_READY                    (wTxTlpReady),
         .RD_DATA                          ({TX_TLP,
                                             TX_TLP_START_FLAG, TX_TLP_START_OFFSET,
                                             TX_TLP_END_FLAG, TX_TLP_END_OFFSET}),
         .RD_DATA_VALID                    (TX_TLP_VALID),
         // Inputs
         .WR_DATA                          ({wTxTlp, wTxTlpStartFlag, wTxTlpStartOffset,
                                             wTxTlpEndFlag, wTxTlpEndOffset}),
         .WR_DATA_VALID                    (wTxTlpValid),
         .RD_DATA_READY                    (TX_TLP_READY),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
endmodule