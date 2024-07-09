module tx_engine_classic
    #(
      parameter C_PCI_DATA_WIDTH = 128,
      parameter C_PIPELINE_INPUT = 1,
      parameter C_PIPELINE_OUTPUT = 1,
      parameter C_MAX_PAYLOAD_DWORDS = 256,
      parameter C_VENDOR = "ALTERA"
      )
    (
     // Interface: Clocks
     input                                    CLK,
     // Interface: Resets
     input                                    RST_IN,
     // Interface: Configuration
     input [`SIG_CPLID_W-1:0]                 CONFIG_COMPLETER_ID,
     // Interface: TX Classic
     input                                    TX_TLP_READY,
     output [C_PCI_DATA_WIDTH-1:0]            TX_TLP,
     output                                   TX_TLP_VALID,
     output                                   TX_TLP_START_FLAG,
     output [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TX_TLP_START_OFFSET,
     output                                   TX_TLP_END_FLAG,
     output [clog2s(C_PCI_DATA_WIDTH/32)-1:0] TX_TLP_END_OFFSET,
     // Interface: TXC Engine
     input                                    TXC_DATA_VALID,
     input [C_PCI_DATA_WIDTH-1:0]             TXC_DATA,
     input                                    TXC_DATA_START_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0]  TXC_DATA_START_OFFSET,
     input                                    TXC_DATA_END_FLAG,
     input [clog2s(C_PCI_DATA_WIDTH/32)-1:0]  TXC_DATA_END_OFFSET,
     output                                   TXC_DATA_READY,
     input                                    TXC_META_VALID,
     input [`SIG_FBE_W-1:0]                   TXC_META_FDWBE,
     input [`SIG_LBE_W-1:0]                   TXC_META_LDWBE,
     input [`SIG_LOWADDR_W-1:0]               TXC_META_ADDR,
     input [`SIG_TYPE_W-1:0]                  TXC_META_TYPE,
     input [`SIG_LEN_W-1:0]                   TXC_META_LENGTH,
     input [`SIG_BYTECNT_W-1:0]                  TXC_META_BYTE_COUNT,
     input [`SIG_TAG_W-1:0]                   TXC_META_TAG,
     input [`SIG_REQID_W-1:0]                 TXC_META_REQUESTER_ID,
     input [`SIG_TC_W-1:0]                    TXC_META_TC,
     input [`SIG_ATTR_W-1:0]                  TXC_META_ATTR,
     input                                    TXC_META_EP,
     output                                   TXC_META_READY,
     output                                   TXC_SENT,
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
     output                                   TXR_META_READY,
     output                                   TXR_SENT
     );
    localparam C_MUX_TYPE = "SHIFT";
    localparam C_DEPTH_PACKETS = 10;
    /*AUTOWIRE*/
    /*AUTOINPUT*/
    wire [C_PCI_DATA_WIDTH-1:0]               _TXC_DATA;
    wire [C_PCI_DATA_WIDTH-1:0]               _TXR_DATA;
    wire [C_PCI_DATA_WIDTH-1:0]               wTxcTlp;
    wire                                      wTxcTlpEndFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]    wTxcTlpEndOffset;
    wire                                      wTxcTlpReady;
    wire                                      wTxcTlpStartFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]    wTxcTlpStartOffset;
    wire                                      wTxcTlpValid;
    wire [C_PCI_DATA_WIDTH-1:0]               wTxrTlp;
    wire                                      wTxrTlpEndFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]    wTxrTlpEndOffset;
    wire                                      wTxrTlpReady;
    wire                                      wTxrTlpStartFlag;
    wire [clog2s(C_PCI_DATA_WIDTH/32)-1:0]    wTxrTlpStartOffset;
    wire                                      wTxrTlpValid;
    reg                                       rTxValid;
    reg [`TLP_TYPE_W-1:0]                     rTxType;
    reg                                       rTxEndFlag;
    reg                                       rTxrSent;
    reg                                       rTxcSent;
    assign TXC_SENT = rTxcSent;
    assign TXR_SENT = rTxrSent;
    always @(posedge CLK) begin
        if(TX_TLP_START_FLAG) begin
            rTxType <= TX_TLP[`TLP_TYPE_R];
        end
        rTxEndFlag <= TX_TLP_END_FLAG;
        rTxValid <= TX_TLP_VALID & TX_TLP_READY;
        rTxcSent <= rTxEndFlag & rTxValid & (rTxType == `TLP_TYPE_CPL);
        rTxrSent <= rTxEndFlag & rTxValid & (rTxType == `TLP_TYPE_REQ);
    end
    generate
        if(C_VENDOR == "XILINX") begin : xilinx_data
            if(C_PCI_DATA_WIDTH == 128) begin : x_be_swap128
                assign _TXC_DATA = {TXC_DATA[103:96], TXC_DATA[111:104], TXC_DATA[119:112], TXC_DATA[127:120],
                                    TXC_DATA[71:64], TXC_DATA[79:72], TXC_DATA[87:80], TXC_DATA[95:88],
                                    TXC_DATA[39:32], TXC_DATA[47:40], TXC_DATA[55:48], TXC_DATA[63:56],
                                    TXC_DATA[07:00], TXC_DATA[15:08], TXC_DATA[23:16], TXC_DATA[31:24]};
                assign _TXR_DATA = {TXR_DATA[103:96], TXR_DATA[111:104], TXR_DATA[119:112], TXR_DATA[127:120],
                                    TXR_DATA[71:64], TXR_DATA[79:72], TXR_DATA[87:80], TXR_DATA[95:88],
                                    TXR_DATA[39:32], TXR_DATA[47:40], TXR_DATA[55:48], TXR_DATA[63:56],
                                    TXR_DATA[07:00], TXR_DATA[15:08], TXR_DATA[23:16], TXR_DATA[31:24]};
            end else if(C_PCI_DATA_WIDTH == 64) begin: x_be_swap64
                assign _TXC_DATA = {TXC_DATA[39:32], TXC_DATA[47:40], TXC_DATA[55:48], TXC_DATA[63:56],
                                    TXC_DATA[07:00], TXC_DATA[15:08], TXC_DATA[23:16], TXC_DATA[31:24]};
                assign _TXR_DATA = {TXR_DATA[39:32], TXR_DATA[47:40], TXR_DATA[55:48], TXR_DATA[63:56],
                                    TXR_DATA[07:00], TXR_DATA[15:08], TXR_DATA[23:16], TXR_DATA[31:24]};
            end else if(C_PCI_DATA_WIDTH == 32) begin: x_be_swap32
                assign _TXC_DATA = {TXC_DATA[07:00], TXC_DATA[15:08], TXC_DATA[23:16], TXC_DATA[31:24]};
                assign _TXR_DATA = {TXR_DATA[07:00], TXR_DATA[15:08], TXR_DATA[23:16], TXR_DATA[31:24]};
            end
        end else begin : altera_data
            assign _TXC_DATA = TXC_DATA;
            assign _TXR_DATA = TXR_DATA;
        end
    endgenerate
    txc_engine_classic
        #(
          .C_PIPELINE_OUTPUT            (0),
          /*AUTOINSTPARAM*/
          // Parameters
          .C_PCI_DATA_WIDTH             (C_PCI_DATA_WIDTH),
          .C_PIPELINE_INPUT             (C_PIPELINE_INPUT),
          .C_MAX_PAYLOAD_DWORDS         (C_MAX_PAYLOAD_DWORDS),
          .C_DEPTH_PACKETS              (C_DEPTH_PACKETS),
          .C_VENDOR                     (C_VENDOR))
    txc_engine_inst
        (
         // Outputs
         .TXC_TLP                       (wTxcTlp[C_PCI_DATA_WIDTH-1:0] ),
         .TXC_TLP_VALID                 (wTxcTlpValid),
         .TXC_TLP_START_FLAG            (wTxcTlpStartFlag),
         .TXC_TLP_START_OFFSET          (wTxcTlpStartOffset[clog2s(C_PCI_DATA_WIDTH/32)-1:0]),
         .TXC_TLP_END_FLAG              (wTxcTlpEndFlag),
         .TXC_TLP_END_OFFSET            (wTxcTlpEndOffset[clog2s(C_PCI_DATA_WIDTH/32)-1:0]),
         // Inputs
         .TXC_TLP_READY                 (wTxcTlpReady),
         .TXC_DATA                      (_TXC_DATA[C_PCI_DATA_WIDTH-1:0]),
         /*AUTOINST*/
         // Outputs
         .TXC_DATA_READY                (TXC_DATA_READY),
         .TXC_META_READY                (TXC_META_READY),
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN),
         .CONFIG_COMPLETER_ID           (CONFIG_COMPLETER_ID[`SIG_CPLID_W-1:0]),
         .TXC_DATA_VALID                (TXC_DATA_VALID),
         .TXC_DATA_START_FLAG           (TXC_DATA_START_FLAG),
         .TXC_DATA_START_OFFSET         (TXC_DATA_START_OFFSET[clog2s(C_PCI_DATA_WIDTH/32)-1:0]),
         .TXC_DATA_END_FLAG             (TXC_DATA_END_FLAG),
         .TXC_DATA_END_OFFSET           (TXC_DATA_END_OFFSET[clog2s(C_PCI_DATA_WIDTH/32)-1:0]),
         .TXC_META_VALID                (TXC_META_VALID),
         .TXC_META_FDWBE                (TXC_META_FDWBE[`SIG_FBE_W-1:0]),
         .TXC_META_LDWBE                (TXC_META_LDWBE[`SIG_LBE_W-1:0]),
         .TXC_META_ADDR                 (TXC_META_ADDR[`SIG_LOWADDR_W-1:0]),
         .TXC_META_TYPE                 (TXC_META_TYPE[`SIG_TYPE_W-1:0]),
         .TXC_META_LENGTH               (TXC_META_LENGTH[`SIG_LEN_W-1:0]),
         .TXC_META_BYTE_COUNT           (TXC_META_BYTE_COUNT[`SIG_BYTECNT_W-1:0]),
         .TXC_META_TAG                  (TXC_META_TAG[`SIG_TAG_W-1:0]),
         .TXC_META_REQUESTER_ID         (TXC_META_REQUESTER_ID[`SIG_REQID_W-1:0]),
         .TXC_META_TC                   (TXC_META_TC[`SIG_TC_W-1:0]),
         .TXC_META_ATTR                 (TXC_META_ATTR[`SIG_ATTR_W-1:0]),
         .TXC_META_EP                   (TXC_META_EP));
    txr_engine_classic
        #(
          .C_PIPELINE_OUTPUT            (0),
          /*AUTOINSTPARAM*/
          // Parameters
          .C_PCI_DATA_WIDTH             (C_PCI_DATA_WIDTH),
          .C_PIPELINE_INPUT             (C_PIPELINE_INPUT),
          .C_MAX_PAYLOAD_DWORDS         (C_MAX_PAYLOAD_DWORDS),
          .C_DEPTH_PACKETS              (C_DEPTH_PACKETS),
          .C_VENDOR                     (C_VENDOR))
    txr_engine_inst
        (
         // Outputs
         .TXR_TLP                       (wTxrTlp[C_PCI_DATA_WIDTH-1:0]),
         .TXR_TLP_VALID                 (wTxrTlpValid),
         .TXR_TLP_START_FLAG            (wTxrTlpStartFlag),
         .TXR_TLP_START_OFFSET          (wTxrTlpStartOffset[clog2s(C_PCI_DATA_WIDTH/32)-1:0]),
         .TXR_TLP_END_FLAG              (wTxrTlpEndFlag),
         .TXR_TLP_END_OFFSET            (wTxrTlpEndOffset[clog2s(C_PCI_DATA_WIDTH/32)-1:0]),
         .TXR_DATA                      (_TXR_DATA[C_PCI_DATA_WIDTH-1:0]),
         // Inputs
         .TXR_TLP_READY                 (wTxrTlpReady),
         /*AUTOINST*/
         // Outputs
         .TXR_DATA_READY                (TXR_DATA_READY),
         .TXR_META_READY                (TXR_META_READY),
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN),
         .CONFIG_COMPLETER_ID           (CONFIG_COMPLETER_ID[`SIG_CPLID_W-1:0]),
         .TXR_DATA_VALID                (TXR_DATA_VALID),
         .TXR_DATA_START_FLAG           (TXR_DATA_START_FLAG),
         .TXR_DATA_START_OFFSET         (TXR_DATA_START_OFFSET[clog2s(C_PCI_DATA_WIDTH/32)-1:0]),
         .TXR_DATA_END_FLAG             (TXR_DATA_END_FLAG),
         .TXR_DATA_END_OFFSET           (TXR_DATA_END_OFFSET[clog2s(C_PCI_DATA_WIDTH/32)-1:0]),
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
    tx_mux
        #(
          .C_PIPELINE_INPUT             (0),
          /*AUTOINSTPARAM*/
          // Parameters
          .C_PCI_DATA_WIDTH             (C_PCI_DATA_WIDTH),
          .C_PIPELINE_OUTPUT            (C_PIPELINE_OUTPUT),
          .C_MUX_TYPE                   (C_MUX_TYPE),
          .C_VENDOR                     (C_VENDOR))
    tx_mux_inst
        (
         // Inputs
         .TXC_TLP                       (wTxcTlp[C_PCI_DATA_WIDTH-1:0]),
         .TXC_TLP_VALID                 (wTxcTlpValid),
         .TXC_TLP_START_FLAG            (wTxcTlpStartFlag),
         .TXC_TLP_START_OFFSET          (wTxcTlpStartOffset[clog2s(C_PCI_DATA_WIDTH/32)-1:0]),
         .TXC_TLP_END_FLAG              (wTxcTlpEndFlag),
         .TXC_TLP_END_OFFSET            (wTxcTlpEndOffset[clog2s(C_PCI_DATA_WIDTH/32)-1:0]),
         .TXR_TLP                       (wTxrTlp[C_PCI_DATA_WIDTH-1:0]),
         .TXR_TLP_VALID                 (wTxrTlpValid),
         .TXR_TLP_START_FLAG            (wTxrTlpStartFlag),
         .TXR_TLP_START_OFFSET          (wTxrTlpStartOffset[clog2s(C_PCI_DATA_WIDTH/32)-1:0]),
         .TXR_TLP_END_FLAG              (wTxrTlpEndFlag),
         .TXR_TLP_END_OFFSET            (wTxrTlpEndOffset[clog2s(C_PCI_DATA_WIDTH/32)-1:0]),
         // Outputs
         .TXC_TLP_READY                 (wTxcTlpReady),
         .TXR_TLP_READY                 (wTxrTlpReady),
         /*AUTOINST*/
         // Outputs
         .TX_TLP                        (TX_TLP[C_PCI_DATA_WIDTH-1:0]),
         .TX_TLP_VALID                  (TX_TLP_VALID),
         .TX_TLP_START_FLAG             (TX_TLP_START_FLAG),
         .TX_TLP_START_OFFSET           (TX_TLP_START_OFFSET[clog2s(C_PCI_DATA_WIDTH/32)-1:0]),
         .TX_TLP_END_FLAG               (TX_TLP_END_FLAG),
         .TX_TLP_END_OFFSET             (TX_TLP_END_OFFSET[clog2s(C_PCI_DATA_WIDTH/32)-1:0]),
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN),
         .TX_TLP_READY                  (TX_TLP_READY));
endmodule