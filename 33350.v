module
eth_macstatus macstatus1
(
  .MRxClk(mrx_clk_pad_i),             .Reset(wb_rst_i),
  .ReceiveEnd(ReceiveEnd),            .ReceivedPacketGood(ReceivedPacketGood),     .ReceivedLengthOK(ReceivedLengthOK),
  .RxCrcError(RxCrcError),            .MRxErr(MRxErr_Lb),                          .MRxDV(MRxDV_Lb),
  .RxStateSFD(RxStateSFD),            .RxStateData(RxStateData),                   .RxStatePreamble(RxStatePreamble),
  .RxStateIdle(RxStateIdle),          .Transmitting(Transmitting),                 .RxByteCnt(RxByteCnt),
  .RxByteCntEq0(RxByteCntEq0),        .RxByteCntGreat2(RxByteCntGreat2),           .RxByteCntMaxFrame(RxByteCntMaxFrame),
  .InvalidSymbol(InvalidSymbol),
  .MRxD(MRxD_Lb),                     .LatchedCrcError(LatchedCrcError),           .Collision(mcoll_pad_i),
  .CollValid(r_CollValid),            .RxLateCollision(RxLateCollision),           .r_RecSmall(r_RecSmall),
  .r_MinFL(r_MinFL),                  .r_MaxFL(r_MaxFL),                           .ShortFrame(ShortFrame),
  .DribbleNibble(DribbleNibble),      .ReceivedPacketTooBig(ReceivedPacketTooBig), .r_HugEn(r_HugEn),
  .LoadRxStatus(LoadRxStatus),        .RetryCnt(RetryCnt),                         .StartTxDone(StartTxDone),
  .StartTxAbort(StartTxAbort),        .RetryCntLatched(RetryCntLatched),           .MTxClk(mtx_clk_pad_i),
  .MaxCollisionOccured(MaxCollisionOccured), .RetryLimit(RetryLimit),              .LateCollision(LateCollision),
  .LateCollLatched(LateCollLatched),  .DeferIndication(DeferIndication),           .DeferLatched(DeferLatched),
  .RstDeferLatched(RstDeferLatched),
  .TxStartFrm(TxStartFrmOut),         .StatePreamble(StatePreamble),               .StateData(StateData),
  .CarrierSense(CarrierSense_Tx2),    .CarrierSenseLost(CarrierSenseLost),         .TxUsedData(TxUsedDataIn),
  .LatchedMRxErr(LatchedMRxErr),      .Loopback(r_LoopBck),                        .r_FullD(r_FullD)
);
endmodule