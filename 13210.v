module tx_data_fifo
    #(parameter C_DEPTH_PACKETS = 10,
      parameter C_DATA_WIDTH = 128,
      parameter C_PIPELINE_INPUT = 1,
      parameter C_PIPELINE_OUTPUT = 1,
      parameter C_MAX_PAYLOAD = 256 // BYTES
      )
    (
     // Interface: Clocks
     input                          CLK,
     // Interface: Reset
     input                          RST_IN,
     // Interface: WR TX DATA
     input [C_DATA_WIDTH-1:0]       WR_TX_DATA,
     input                          WR_TX_DATA_VALID,
     input                          WR_TX_DATA_START_FLAG,
     input [(C_DATA_WIDTH/32)-1:0]  WR_TX_DATA_WORD_VALID,
     input [(C_DATA_WIDTH/32)-1:0]  WR_TX_DATA_END_FLAGS,
     output                         WR_TX_DATA_READY,
     // Interface: RD TX DATA
     input [(C_DATA_WIDTH/32)-1:0]  RD_TX_DATA_WORD_READY,
     output [C_DATA_WIDTH-1:0]      RD_TX_DATA,
     output                         RD_TX_DATA_START_FLAG,
     output [(C_DATA_WIDTH/32)-1:0] RD_TX_DATA_END_FLAGS,
     output [(C_DATA_WIDTH/32)-1:0] RD_TX_DATA_WORD_VALID,
     output                         RD_TX_DATA_PACKET_VALID
     );
`include "functions.vh"
    localparam C_FIFO_OUTPUT_DEPTH = 1;
    localparam C_INPUT_DEPTH = C_PIPELINE_INPUT != 0 ? 1 : 0;
    localparam C_OUTPUT_DEPTH = C_PIPELINE_OUTPUT != 0 ? 1 : 0;
    localparam C_MAXPACKET_LINES = (C_MAX_PAYLOAD*8)/C_DATA_WIDTH;
    localparam C_FIFO_DEPTH = C_MAXPACKET_LINES*C_DEPTH_PACKETS;
    localparam C_FIFO_DATA_WIDTH = 32;
    localparam C_REGISTER_WIDTH = C_FIFO_DATA_WIDTH + 2;
    localparam C_FIFO_WIDTH = C_FIFO_DATA_WIDTH + 2; // Data, end flag and start flag
    localparam C_NUM_FIFOS = (C_DATA_WIDTH/32);
    genvar                          i;
    wire                            RST;
    wire [C_FIFO_DATA_WIDTH-1:0]    wWrTxData[C_NUM_FIFOS-1:0];
    wire [C_NUM_FIFOS-1:0]          wWrTxDataValid;
    wire [C_NUM_FIFOS-1:0]          wWrTxDataReady;
    wire [C_NUM_FIFOS-1:0]          wWrTxDataStartFlags;
    wire [C_NUM_FIFOS-1:0]          wWrTxDataEndFlags;
    wire [C_NUM_FIFOS-1:0]          _wRdTxDataStartFlags;
    wire [C_FIFO_DATA_WIDTH-1:0]    wRdTxData[C_NUM_FIFOS-1:0];
    wire [C_NUM_FIFOS-1:0]          wRdTxDataValid;
    wire [C_NUM_FIFOS-1:0]          wRdTxDataReady;
    wire [C_NUM_FIFOS-1:0]          wRdTxDataStartFlags;
    wire [C_NUM_FIFOS-1:0]          wRdTxDataEndFlags;
    wire                            wRdTxDataPacketValid;
    wire                            wWrTxEndFlagValid;
    wire                            wWrTxEndFlagReady;
    wire                            wRdTxEndFlagValid;
    wire                            wRdTxEndFlagReady;
    wire                            wPacketDecrement;
    wire                            wPacketIncrement;
    reg [clog2(C_DEPTH_PACKETS+1)-1:0] rPacketCounter,_rPacketCounter;
    /*AUTOINPUT*/
    /*AUTOWIRE*/
    assign RST = RST_IN;
    assign wWrTxEndFlagValid = (wWrTxDataEndFlags & wWrTxDataValid) != {C_NUM_FIFOS{1'b0}};
    assign wWrTxEndFlagReady = rPacketCounter != C_DEPTH_PACKETS;// Designed a small bit of latency here to help timing...
    assign wPacketIncrement = wWrTxEndFlagValid & wWrTxEndFlagReady;
    assign wPacketDecrement = wRdTxEndFlagValid & wRdTxEndFlagReady;
    assign WR_TX_DATA_READY = wWrTxEndFlagReady;
    assign wRdTxEndFlagValid = rPacketCounter != 0;
    assign wRdTxEndFlagReady = (wRdTxDataReady & wRdTxDataEndFlags & wRdTxDataValid) != {C_NUM_FIFOS{1'b0}};
    assign wRdTxDataPacketValid = rPacketCounter != 0;
    assign RD_TX_DATA_START_FLAG = _wRdTxDataStartFlags[0];
    always @(*) begin
        _rPacketCounter = rPacketCounter;
        if(wPacketIncrement & wPacketDecrement) begin
            _rPacketCounter = rPacketCounter + 0;
        end else if(wPacketIncrement) begin
            _rPacketCounter = rPacketCounter + 1;
        end else if(wPacketDecrement) begin
            _rPacketCounter = rPacketCounter - 1;
        end
    end // always @ (*)
    always @(posedge CLK) begin
        if(RST_IN) begin
            rPacketCounter <= #1 0;
        end else begin
            rPacketCounter <= #1 _rPacketCounter;
        end
    end
    generate
        for( i = 0 ; i < C_NUM_FIFOS ; i = i + 1 ) begin : gen_regs_fifos
            pipeline
                 #(
                   .C_DEPTH              (C_INPUT_DEPTH),
                   .C_USE_MEMORY         (0),
                   .C_WIDTH              (C_REGISTER_WIDTH)
                   /*AUTOINSTPARAM*/)
            input_pipeline_inst_
                 (
                  // Outputs
                  .WR_DATA_READY         (),
                  .RD_DATA               ({wWrTxData[i], wWrTxDataEndFlags[i],wWrTxDataStartFlags[i]}),
                  .RD_DATA_VALID         (wWrTxDataValid[i]),
                  // Inputs
                  .CLK                   (CLK),
                  .RST_IN                (RST_IN),
                  .WR_DATA               ({WR_TX_DATA[C_FIFO_DATA_WIDTH*i +: C_FIFO_DATA_WIDTH],
                                           WR_TX_DATA_END_FLAGS[i], (i == 0) ? WR_TX_DATA_START_FLAG: 1'b0}),
                  .WR_DATA_VALID         (WR_TX_DATA_VALID & WR_TX_DATA_WORD_VALID[i]),
                  .RD_DATA_READY         (wWrTxDataReady[i]));
            fifo
                #(
                  // Parameters
                  .C_WIDTH             (C_FIFO_WIDTH),
                  .C_DEPTH             (C_FIFO_DEPTH),
                  .C_DELAY             (0)
                  /*AUTOINSTPARAM*/)
            fifo_inst_
                (
                 // Outputs
                 .RD_DATA              ({wRdTxData[i], wRdTxDataStartFlags[i], wRdTxDataEndFlags[i]}),
                 .WR_READY             (wWrTxDataReady[i]),
                 .RD_VALID             (wRdTxDataValid[i]),
                 // Inputs
                 .WR_DATA              ({wWrTxData[i], wWrTxDataStartFlags[i], wWrTxDataEndFlags[i]}),
                 .WR_VALID             (wWrTxDataValid[i]),
                 .RD_READY             (wRdTxDataReady[i]),
                 /*AUTOINST*/
                 // Inputs
                 .CLK                   (CLK),
                 .RST                   (RST));
            pipeline
                #(
                  .C_DEPTH              (C_FIFO_OUTPUT_DEPTH),
                  .C_USE_MEMORY         (0),
                  .C_WIDTH              (C_FIFO_WIDTH)
                  /*AUTOINSTPARAM*/)
            fifo_pipeline_inst_
                (
                 // Outputs
                 .WR_DATA_READY         (wRdTxDataReady[i]),
                 .RD_DATA               ({RD_TX_DATA[i*32 +: 32],
                                          _wRdTxDataStartFlags[i],
                                          RD_TX_DATA_END_FLAGS[i]}),
                 .RD_DATA_VALID         (RD_TX_DATA_WORD_VALID[i]),
                 // Inputs
                 .WR_DATA               ({wRdTxData[i],
                                          wRdTxDataStartFlags[i],
                                          wRdTxDataEndFlags[i]}),
                 .WR_DATA_VALID         (wRdTxDataValid[i]),
                 .RD_DATA_READY         (RD_TX_DATA_WORD_READY[i]),
                 /*AUTOINST*/
                 // Inputs
                 .CLK                   (CLK),
                 .RST_IN                (RST_IN));
        end // for ( i = 0 ; i < C_NUM_FIFOS ; i = i + 1 )
    endgenerate
endmodule