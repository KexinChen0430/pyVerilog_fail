module*/
    generate
        for(i = 0 ; i < C_NUM_MUXES ; i = i + 1) begin : muxes
            assign _wTxMuxSelect[i*C_CLOG_MUX_INPUTS +: C_CLOG_MUX_INPUTS] = wSchedule[i][wScheduleSelect];
        end
    endgenerate
    offset_to_mask
        #(// Parameters
          .C_MASK_SWAP                  (0),
          .C_MASK_WIDTH                 (C_NUM_MUXES)
          /*AUTOINSTPARAM*/)
    packet_mask
        (
         // Outputs
         .MASK                          (__wTxHdrPacketMask),
         // Inputs
         .OFFSET_ENABLE                 (1),
         .OFFSET                        (__wTxHdrPacketLenMinus1[clog2s(C_NUM_MUXES)-1:0])
         /*AUTOINST*/);
    offset_to_mask
        #(// Parameters
          .C_MASK_SWAP                  (0),
          .C_MASK_WIDTH                 (C_NUM_MUXES)
          /*AUTOINSTPARAM*/)
    len_mask
        (// Outputs
         .MASK                          (__wTxHdrLenMask),
         // Inputs
         .OFFSET_ENABLE                 (1),
         .OFFSET                        (__wTxHdrPayloadLen[clog2s(C_NUM_MUXES)-1:0]-1)
         /*AUTOINST*/);
    rotate
        #(// Parameters
          .C_DIRECTION                  ("RIGHT"),
          .C_WIDTH                      (C_NUM_MUXES)
          /*AUTOINSTPARAM*/)
    rot_inst
        (
         // Outputs
         .RD_DATA                   (__wTxHdrEndReady),
         // Inputs
         .WR_DATA                   (__wTxHdrPacketMask),
         .WR_SHIFTAMT               (__wTxHdrNonpayLen[C_OFFSET_WIDTH-1:0])
         /*AUTOINST*/);
    pipeline
        #(
          // Parameters
          .C_DEPTH                      (C_PIPELINE_HDR_INPUT?1:0),
          .C_WIDTH                      (C_MAX_HDR_WIDTH + `SIG_NONPAY_W + `SIG_PACKETLEN_W + `SIG_LEN_W + 1),
          .C_USE_MEMORY                 (0)
          /*AUTOINSTPARAM*/)
    hdr_input_reg
        (
         // Outputs
         .WR_DATA_READY             (TX_HDR_READY),
         .RD_DATA                   ({__wTxHdr,__wTxHdrNonpayLen,__wTxHdrPacketLen,__wTxHdrPayloadLen,__wTxHdrNoPayload}),
         .RD_DATA_VALID             (__wTxHdrValid),
         // Inputs
         .WR_DATA                   ({TX_HDR,TX_HDR_NONPAY_LEN,TX_HDR_PACKET_LEN,TX_HDR_PAYLOAD_LEN,TX_HDR_NOPAYLOAD}),
         .WR_DATA_VALID             (TX_HDR_VALID),
         .RD_DATA_READY             (__wTxHdrReady),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
    pipeline
        #(
          // Parameters
          .C_DEPTH                      (C_USE_COMPUTE_REG?1:0),
          .C_WIDTH                      (C_MAX_HDR_WIDTH + `SIG_NONPAY_W + `SIG_PACKETLEN_W + `SIG_LEN_W + 1 + 4*C_MASK_WIDTH),
          .C_USE_MEMORY                 (0)
          /*AUTOINSTPARAM*/)
    compute_reg
        (
         // Outputs
         .WR_DATA_READY             (__wTxHdrReady),
         .RD_DATA                   ({_wTxHdr,_wTxHdrNonpayLen,_wTxHdrPacketLen,_wTxHdrPayloadLen,_wTxHdrNoPayload,
                                      _wTxHdrSteadyStateReady,_wTxHdrStartReady,_wTxHdrEndReady,_wTxHdrStartEndReady}),
         .RD_DATA_VALID             (_wTxHdrValid),
         // Inputs
         .WR_DATA                   ({__wTxHdr,__wTxHdrNonpayLen,__wTxHdrPacketLen,__wTxHdrPayloadLen,__wTxHdrNoPayload,
                                      __wTxHdrSteadyStateReady,__wTxHdrStartReady,__wTxHdrEndReady,__wTxHdrStartEndReady}),
         .WR_DATA_VALID             (__wTxHdrValid),
         .RD_DATA_READY             (_wTxMuxSelectDataEndFlag & _wTxMuxSelectReady),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
    pipeline
        #(
          // Parameters
          .C_DEPTH                      (C_USE_READY_REG?1:0),
          .C_WIDTH                      (C_MAX_HDR_WIDTH + `SIG_NONPAY_W + `SIG_PACKETLEN_W + `SIG_LEN_W + 1),
          .C_USE_MEMORY                 (0)
          /*AUTOINSTPARAM*/)
    ready_reg
        (
         // Outputs
         .WR_DATA_READY             (_wTxHdrReady),
         .RD_DATA                   ({wTxHdr,wTxHdrNonpayLen,wTxHdrPacketLen,wTxHdrPayloadLen,wTxHdrNoPayload}),
         .RD_DATA_VALID             (wTxHdrValid),
         // Inputs
         .WR_DATA                   ({_wTxHdr,_wTxHdrNonpayLen,_wTxHdrPacketLen,_wTxHdrPayloadLen,_wTxHdrNoPayload}),
         .WR_DATA_VALID             (_wTxHdrValid),
         .RD_DATA_READY             (wTxHdrReady),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
    pipeline
        #(
          // Parameters
          .C_DEPTH                      (C_USE_READY_REG?1:0),
          .C_WIDTH                      (C_NUM_MUXES + C_CLOG_MUX_INPUTS * C_NUM_MUXES + 3),
          .C_USE_MEMORY                 (0)
          /*AUTOINSTPARAM*/)
    select_reg
        (
         // Outputs
         .WR_DATA_READY             (_wTxMuxSelectReady),
         .RD_DATA                   ({wTxMuxSelectDataReady,wTxMuxSelect,wTxMuxSelectDataEndFlag,wTxMuxSelectDataStartFlag,wTxMuxSelectPktStartFlag}),
         .RD_DATA_VALID             (wTxMuxSelectValid),
         // Inputs
         .WR_DATA                   ({_wTxMuxSelectDataReady,_wTxMuxSelect,_wTxMuxSelectDataEndFlag,_wTxMuxSelectDataStartFlag,_wTxMuxSelectPktStartFlag}),
         .WR_DATA_VALID             (_wTxMuxSelectValid),
         .RD_DATA_READY             (wTxMuxSelectReady),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
    counter
        #(// Parameters
          .C_MAX_VALUE                  (C_MAX_SCHEDULE-1),
          .C_SAT_VALUE                  (C_MAX_SCHEDULE-1),
          .C_RST_VALUE                  (0)
          /*AUTOINSTPARAM*/)
    satctr_inst
        (// Outputs
         .VALUE                         (wSatCtr),
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (wSatCtrReset),
         .ENABLE                        (wSatCtrEnable)
         /*AUTOINST*/);
    counter
        #(// Parameters
          .C_MAX_VALUE                  (1<<`SIG_PACKETLEN_W),
          .C_SAT_VALUE                  (1<<`SIG_PACKETLEN_W + 1), // Never saturate
          .C_RST_VALUE                  (0)
          /*AUTOINSTPARAM*/)
    pktctr_inst
        (// Outputs
         .VALUE                         (wPktCtr),
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (wPktCtrReset),
         .ENABLE                        (wPktCtrEnable)
         /*AUTOINST*/);
    generate
        for( i = 0  ; i < C_MAX_HDR_WIDTH/32 ; i = i + 1) begin : gen_aggregate
            assign wAggregate[i] = wTxHdr[i*32 +: 32];
        end
        for( i = 0; i < C_NUM_MUXES ; i = i + 1) begin : gen_data_input_regs
            assign wAggregate[i + C_MAX_HDR_WIDTH/32] = wTxData[32*i +: 32];
            pipeline
                #(// Parameters
                  .C_DEPTH                      (C_PIPELINE_DATA_INPUT?1:0),
                  .C_WIDTH                      (32 + 1),
                  .C_USE_MEMORY                 (0)
                  /*AUTOINSTPARAM*/)
            data_register_
                (// Outputs
                 .WR_DATA_READY             (TX_DATA_WORD_READY[i]),
                 .RD_DATA                   ({wTxData[32*i +: 32],wTxDataEndFlags[i]}),
                 .RD_DATA_VALID             (wTxDataWordValid[i]),
                 // Inputs
                 .WR_DATA                   ({TX_DATA[32*i +: 32],TX_DATA_END_FLAGS[i] & TX_DATA_WORD_VALID[i]}),
                 .WR_DATA_VALID             (TX_DATA_WORD_VALID[i]),
                 .RD_DATA_READY             (wTxDataWordReady[i]),
                 /*AUTOINST*/
                 // Inputs
                 .CLK                   (CLK),
                 .RST_IN                (RST_IN));
        end
        for( i = 0 ; i < C_NUM_MUXES ; i = i + 1) begin : gen_packet_format_multiplexers
            mux
                 #(
                   // Parameters
                   .C_NUM_INPUTS                 (C_MUX_INPUTS),
                   .C_CLOG_NUM_INPUTS            (C_CLOG_MUX_INPUTS),
                   .C_WIDTH                      (32),
                   .C_MUX_TYPE                   ("SELECT")
                   /*AUTOINSTPARAM*/)
            dw_mux_
                 (
                  // Outputs
                  .MUX_OUTPUT                (wTxPkt[32*i +: 32]),
                  // Inputs
                  .MUX_INPUTS                (wTxMuxInputs[i]),
                  .MUX_SELECT                (wTxMuxSelect[i*C_CLOG_MUX_INPUTS +: C_CLOG_MUX_INPUTS])
                  /*AUTOINST*/);
        end
    endgenerate
    pipeline
        #(
          // Parameters
          .C_DEPTH                      (C_PIPELINE_OUTPUT?1:0),
          .C_WIDTH                      (C_DATA_WIDTH + 2 + C_OFFSET_WIDTH),
          .C_USE_MEMORY                 (0)
          /*AUTOINSTPARAM*/)
    output_register_inst
        (
         // Outputs
         .WR_DATA_READY             (wTxPktReady),
         .RD_DATA                   ({TX_PKT,TX_PKT_START_FLAG,TX_PKT_END_FLAG,TX_PKT_END_OFFSET}),
         .RD_DATA_VALID             (TX_PKT_VALID),
         // Inputs
         .WR_DATA                   ({wTxPkt,wTxPktStartFlag,wTxPktEndFlag,wTxPktEndOffset[C_OFFSET_WIDTH-1:0]}),
         .WR_DATA_VALID             (wTxPktValid),
         .RD_DATA_READY             (TX_PKT_READY),
         /*AUTOINST*/
         // Inputs
         .CLK                           (CLK),
         .RST_IN                        (RST_IN));
endmodule