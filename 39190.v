module tx_data_shift
    #(
      parameter C_PIPELINE_OUTPUT = 1,
      parameter C_PIPELINE_INPUT = 1,
      parameter C_DATA_WIDTH = 128,
      parameter C_VENDOR = "ALTERA"
      )
    (
     // Interface: Clocks
     input                               CLK,
     // Interface: Reset
     input                               RST_IN,
     // Interface: WR TX DATA
     input                               WR_TX_DATA_VALID,
     input [C_DATA_WIDTH-1:0]            WR_TX_DATA,
     input                               WR_TX_DATA_START_FLAG,
     input [clog2s(C_DATA_WIDTH/32)-1:0] WR_TX_DATA_START_OFFSET,
     input                               WR_TX_DATA_END_FLAG,
     input [clog2s(C_DATA_WIDTH/32)-1:0] WR_TX_DATA_END_OFFSET,
     output                              WR_TX_DATA_READY,
     // Interface: RD TX DATA
     input                               RD_TX_DATA_READY,
     output [C_DATA_WIDTH-1:0]           RD_TX_DATA,
     output                              RD_TX_DATA_START_FLAG,
     output [(C_DATA_WIDTH/32)-1:0]      RD_TX_DATA_WORD_VALID,
     output [(C_DATA_WIDTH/32)-1:0]      RD_TX_DATA_END_FLAGS,
     output                              RD_TX_DATA_VALID
     );
`include "functions.vh"
    localparam C_ROTATE_BITS = clog2s(C_DATA_WIDTH/32);
    localparam C_NUM_MUXES = (C_DATA_WIDTH/32);
    localparam C_SELECT_WIDTH = C_DATA_WIDTH/32;
    localparam C_MASK_WIDTH = C_DATA_WIDTH/32;
    localparam C_AGGREGATE_WIDTH = C_DATA_WIDTH;
    genvar                               i;
    wire                                 wWrTxDataValid;
    wire [C_DATA_WIDTH-1:0]              wWrTxData;
    wire                                 wWrTxDataStartFlag;
    wire [clog2s(C_DATA_WIDTH/32)-1:0]   wWrTxDataStartOffset;
    wire                                 wWrTxDataEndFlag;
    wire [clog2s(C_DATA_WIDTH/32)-1:0]   wWrTxDataEndOffset;
    wire [(C_DATA_WIDTH/32)-1:0]         wWrTxEndFlagMask;
    wire [(C_DATA_WIDTH/32)-1:0]         wWrTxDataEndFlags;
    wire                                 wWrTxDataReady;
    wire                                 wRdTxDataReady;
    wire [C_DATA_WIDTH-1:0]              wRdTxData;
    wire                                 wRdTxDataStartFlag;
    wire [(C_DATA_WIDTH/32)-1:0]         wRdTxDataEndFlags;
    wire [(C_DATA_WIDTH/32)-1:0]         wRdTxDataWordValid;
    wire [(C_DATA_WIDTH/32)-1:0]         wRdTxStartFlagMask;
    wire [(C_DATA_WIDTH/32)-1:0]         wRdTxEndFlagMask;
    wire                                 wRdTxDataValid;
    // wSelectDefault is the default select value for each mux, 1 << i where i
    // is the mux/dword index.
    wire [C_SELECT_WIDTH-1:0]            wSelectDefault[C_NUM_MUXES-1:0];
    // wSelectRotated is the value the select for each mux after the data's
    // start offset has been applied and until the end flag is seen.
    wire [C_SELECT_WIDTH-1:0]            wSelectRotated[C_NUM_MUXES-1:0];
    reg [C_SELECT_WIDTH-1:0]             rMuxSelect[C_NUM_MUXES-1:0],_rMuxSelect[C_NUM_MUXES-1:0];
    reg [clog2s(C_DATA_WIDTH/32)-1:0]    rStartOffset,_rStartOffset;
    assign wWrTxDataReady = wRdTxDataReady;
    assign wRdTxStartFlagMask = wWrTxDataStartFlag ?
                                {(C_DATA_WIDTH/32){1'b1}} >> wWrTxDataStartOffset:
                                {(C_DATA_WIDTH/32){1'b1}};
    assign wRdTxDataWordValid = wRdTxEndFlagMask & wRdTxStartFlagMask;
    assign wRdTxDataStartFlag = wWrTxDataStartFlag;
    assign wRdTxDataValid = wWrTxDataValid;
    generate
        for (i = 0; i < C_NUM_MUXES; i = i + 1) begin : gen_mux_default
            assign wSelectDefault[i] = (1 << i);
        end
    endgenerate
    always @(*) begin
        _rStartOffset = WR_TX_DATA_START_OFFSET;
    end
    always @(posedge CLK) begin
        if(WR_TX_DATA_READY & WR_TX_DATA_START_FLAG & WR_TX_DATA_VALID) begin
            rStartOffset <= _rStartOffset;
        end
    end
    generate
        for (i = 0; i < C_NUM_MUXES; i = i + 1) begin : gen_mux_select
            always @(*) begin
                _rMuxSelect[i] = wSelectRotated[i];
            end
            always @(posedge CLK) begin
                if(WR_TX_DATA_READY & WR_TX_DATA_START_FLAG) begin
                    rMuxSelect[i] <= _rMuxSelect[i];
                end
            end
        end
    endgenerate
    pipeline
        #(// Parameters
          .C_WIDTH                      (C_DATA_WIDTH+2*(1+clog2s(C_DATA_WIDTH/32))),
          .C_USE_MEMORY                 (0),
          .C_DEPTH                      (C_PIPELINE_INPUT?1:0)
          /*AUTOINSTPARAM*/)
    input_register
        (
         // Outputs
         .WR_DATA_READY                 (WR_TX_DATA_READY),
         .RD_DATA                       ({wWrTxData,wWrTxDataStartFlag,wWrTxDataStartOffset,wWrTxDataEndFlag,wWrTxDataEndOffset}),
         .RD_DATA_VALID                 (wWrTxDataValid),
         // Inputs
         .WR_DATA                       ({WR_TX_DATA,WR_TX_DATA_START_FLAG,WR_TX_DATA_START_OFFSET,
                                          WR_TX_DATA_END_FLAG,WR_TX_DATA_END_OFFSET}),
         .WR_DATA_VALID                 (WR_TX_DATA_VALID),
         .RD_DATA_READY                 (wWrTxDataReady),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
    // The pipeline carries the data bus and SOF/EOF.
    pipeline
        #(// Parameters
          .C_WIDTH                      (C_DATA_WIDTH + 2*C_MASK_WIDTH + 1),
          .C_USE_MEMORY                 (0),
          .C_DEPTH                      ((C_PIPELINE_OUTPUT > 1) ? 1 : 0)
          /*AUTOINSTPARAM*/)
    output_register
        (
         // Outputs
         .WR_DATA_READY                 (wRdTxDataReady),
         .RD_DATA                       ({RD_TX_DATA,RD_TX_DATA_START_FLAG,
                                          RD_TX_DATA_END_FLAGS,RD_TX_DATA_WORD_VALID}),
         .RD_DATA_VALID                 (RD_TX_DATA_VALID),
         // Inputs
         .WR_DATA                       ({wRdTxData,wRdTxDataStartFlag,
                                          wRdTxDataEndFlags,wRdTxDataWordValid}),
         .WR_DATA_VALID                 (wRdTxDataValid),
         .RD_DATA_READY                 (RD_TX_DATA_READY),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
    offset_to_mask
        #(
          .C_MASK_SWAP                  (0),
          /*AUTOINSTPARAM*/
          // Parameters
          .C_MASK_WIDTH                 (C_MASK_WIDTH))
    eof_convert
        (
         // Outputs
         .MASK                      (wWrTxEndFlagMask),
         // Inputs
         .OFFSET_ENABLE             (wWrTxDataEndFlag),
         .OFFSET                    (wWrTxDataEndOffset)
         /*AUTOINST*/);
    rotate
        #(
          // Parameters
          .C_DIRECTION                  ("RIGHT"),
          .C_WIDTH                      (C_DATA_WIDTH/32)
          /*AUTOINSTPARAM*/)
    em_rotate_inst
        (
         // Outputs
         .RD_DATA                       (wRdTxEndFlagMask),
         // Inputs
         .WR_DATA                       (wWrTxEndFlagMask),
         .WR_SHIFTAMT                   (rStartOffset[clog2s(C_DATA_WIDTH/32)-1:0])
         /*AUTOINST*/);
    // Determine the 1-hot dword end flag
    offset_flag_to_one_hot
        #(
          .C_WIDTH                      (C_DATA_WIDTH/32)
          /*AUTOINSTPARAM*/)
    ef_onehot_inst
        (
         // Outputs
         .RD_ONE_HOT                    (wWrTxDataEndFlags),
         // Inputs
         .WR_OFFSET                     (wWrTxDataEndOffset[clog2s(C_DATA_WIDTH/32)-1:0]),
         .WR_FLAG                       (wWrTxDataEndFlag)
         /*AUTOINST*/);
    rotate
        #(
          // Parameters
          .C_DIRECTION                  ("RIGHT"),
          .C_WIDTH                      (C_DATA_WIDTH/32)
          /*AUTOINSTPARAM*/)
    ef_rotate_inst
        (
         // Outputs
         .RD_DATA                       (wRdTxDataEndFlags),
         // Inputs
         .WR_DATA                       (wWrTxDataEndFlags),
         .WR_SHIFTAMT                   (rStartOffset[clog2s(C_DATA_WIDTH/32)-1:0])
         /*AUTOINST*/);
    generate
        for (i = 0; i < C_NUM_MUXES; i = i + 1) begin : gen_rotates
            rotate
                 #(
                   // Parameters
                   .C_DIRECTION         ("LEFT"),
                   .C_WIDTH             ((C_DATA_WIDTH/32))
                   /*AUTOINSTPARAM*/)
            select_rotate_inst_
                 (
                  // Outputs
                  .RD_DATA               (wSelectRotated[i]),
                  // Inputs
                  .WR_DATA               (wSelectDefault[i]),
                  .WR_SHIFTAMT           (WR_TX_DATA_START_OFFSET[C_ROTATE_BITS-1:0])
                  /*AUTOINST*/);
        end
    endgenerate
    generate
        for (i = 0; i < C_DATA_WIDTH/32; i = i + 1) begin : gen_multiplexers
            one_hot_mux
                 #(
                   .C_DATA_WIDTH        (32),
                   /*AUTOINSTPARAM*/
                   // Parameters
                   .C_SELECT_WIDTH      (C_SELECT_WIDTH),
                   .C_AGGREGATE_WIDTH   (C_AGGREGATE_WIDTH))
            mux_inst_
                 (
                  // Inputs
                  .ONE_HOT_SELECT       (rMuxSelect[i]),
                  // Outputs
                  .ONE_HOT_OUTPUT       (wRdTxData[32*i +: 32]),
                  .ONE_HOT_INPUTS       (wWrTxData)
                  /*AUTOINST*/);
        end
    endgenerate
endmodule