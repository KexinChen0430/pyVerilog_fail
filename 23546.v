module
eth_receivecontrol receivecontrol1
(
 .MTxClk(MTxClk), .MRxClk(MRxClk), .TxReset(TxReset), .RxReset(RxReset), .RxData(RxData),
 .RxValid(RxValid), .RxStartFrm(RxStartFrm), .RxEndFrm(RxEndFrm), .RxFlow(RxFlow),
 .ReceiveEnd(ReceiveEnd), .MAC(MAC), .DlyCrcEn(DlyCrcEn), .TxDoneIn(TxDoneIn),
 .TxAbortIn(TxAbortIn), .TxStartFrmOut(TxStartFrmOut), .ReceivedLengthOK(ReceivedLengthOK),
 .ReceivedPacketGood(ReceivedPacketGood), .TxUsedDataOutDetected(TxUsedDataOutDetected),
 .Pause(Pause), .ReceivedPauseFrm(ReceivedPauseFrm), .AddressOK(ControlFrmAddressOK),
 .r_PassAll(r_PassAll), .RxStatusWriteLatched_sync2(RxStatusWriteLatched_sync2), .SetPauseTimer(SetPauseTimer)
);
eth_transmitcontrol transmitcontrol1
(
 .MTxClk(MTxClk), .TxReset(TxReset), .TxUsedDataIn(TxUsedDataIn), .TxUsedDataOut(TxUsedDataOut),
 .TxDoneIn(TxDoneIn), .TxAbortIn(TxAbortIn), .TxStartFrmIn(TxStartFrmIn), .TPauseRq(TPauseRq),
 .TxUsedDataOutDetected(TxUsedDataOutDetected), .TxFlow(TxFlow), .DlyCrcEn(DlyCrcEn), .TxPauseTV(TxPauseTV),
 .MAC(MAC), .TxCtrlStartFrm(TxCtrlStartFrm), .TxCtrlEndFrm(TxCtrlEndFrm), .SendingCtrlFrm(SendingCtrlFrm),
 .CtrlMux(CtrlMux), .ControlData(ControlData), .WillSendControlFrame(WillSendControlFrame), .BlockTxDone(BlockTxDone)
);
endmodule