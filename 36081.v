module tx_phi
    #(
      parameter C_PCI_DATA_WIDTH = 10'd128,
      parameter C_MUX_TYPE = "SHIFT",
      parameter C_WIDTH = (C_PCI_DATA_WIDTH + 2 * (clog2s(C_PCI_DATA_WIDTH/32) + 1))
      )
    (
     // Interface: Clocks
     input                                    CLK,
     // Interface: Resets
     input                                    RST_IN,
     // Interface: TXC Flow Control
     input                                    TXC_TLP_READY,
     // Interface: TXR Flow Control
     input                                    TXR_TLP_READY,
     // Interface: TXC
     input [C_PCI_DATA_WIDTH-1:0]             TXC_TLP,
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
     // Interface: TX Classic
     output [C_PCI_DATA_WIDTH-1:0]            TX_TLP,
     output                                   TX_TLP_VALID,
     output                                   TX_TLP_START_FLAG,
     output [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TX_TLP_START_OFFSET,
     output                                   TX_TLP_END_FLAG,
     output [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TX_TLP_END_OFFSET
     );
`include "functions.vh"
    // Width = 2 * (DATA WIDTH + VALID + START FLAG + START OFFSET + END FLAG + END OFFSET)
    localparam C_MUX_WIDTH = C_PCI_DATA_WIDTH + 3 + 2*clog2s(C_PCI_DATA_WIDTH/32);
    wire [2*C_MUX_WIDTH-1:0]                  wAggregate;
    assign wAggregate = {{TXR_TLP,TXR_TLP_VALID,TXR_TLP_START_FLAG,
                          TXR_TLP_START_OFFSET,TXR_TLP_END_FLAG,TXR_TLP_END_OFFSET},
                         {TXC_TLP,TXC_TLP_VALID,TXC_TLP_START_FLAG,
                          TXC_TLP_START_OFFSET,TXC_TLP_END_FLAG,TXC_TLP_END_OFFSET}};
    mux
        #(
          // Parameters
          .C_NUM_INPUTS                 (2),
          .C_CLOG_NUM_INPUTS            (1),
          .C_WIDTH                      (C_MUX_WIDTH),
          .C_MUX_TYPE                   ("SELECT")
          /*AUTOINSTPARAM*/)
    mux_inst
        (
         // Outputs
         .MUX_OUTPUT                    ({TX_TLP,TX_TLP_VALID,TX_TLP_START_FLAG,
                                          TX_TLP_START_OFFSET,TX_TLP_END_FLAG,
                                          TX_TLP_END_OFFSET}),
         // Inputs
         .MUX_INPUTS                    (wAggregate),
         .MUX_SELECT                    (TXR_TLP_READY)
         /*AUTOINST*/);
endmodule