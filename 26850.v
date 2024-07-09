module outputs
  wire [127 : 0] wmemiM0_MData;
  wire [35 : 0] wmemiM0_MAddr;
  wire [31 : 0] wciS0_SData, wsiM0_MData;
  wire [15 : 0] wmemiM0_MDataByteEn;
  wire [11 : 0] wmemiM0_MBurstLength, wsiM0_MBurstLength;
  wire [7 : 0] wsiM0_MReqInfo;
  wire [3 : 0] wsiM0_MByteEn;
  wire [2 : 0] wmemiM0_MCmd, wsiM0_MCmd;
  wire [1 : 0] wciS0_SFlag, wciS0_SResp;
  wire wciS0_SThreadBusy,
       wmemiM0_MDataLast,
       wmemiM0_MDataValid,
       wmemiM0_MReqLast,
       wmemiM0_MReset_n,
       wsiM0_MBurstPrecise,
       wsiM0_MReqLast,
       wsiM0_MReset_n,
       wsiS0_SReset_n,
       wsiS0_SThreadBusy;
  // inlined wires
  wire [145 : 0] wmemi_dhF_x_wire$wget;
  wire [130 : 0] wmemi_wmemiResponse$wget;
  wire [127 : 0] wmemi_Em_sData_w$wget;
  wire [95 : 0] wsiM_extStatusW$wget, wsiS_extStatusW$wget;
  wire [71 : 0] wci_wslv_wciReq$wget;
  wire [60 : 0] wsiM_reqFifo_x_wire$wget, wsiS_wsiReq$wget;
  wire [51 : 0] wmemi_reqF_x_wire$wget;
  wire [33 : 0] wci_wslv_respF_x_wire$wget;
  wire [31 : 0] mesgWF_wDataIn$wget,
		mesgWF_wDataOut$wget,
		wci_wci_Es_mAddr_w$wget,
		wci_wci_Es_mData_w$wget,
		wsi_Es_mData_w$wget;
  wire [24 : 0] dlyWordsStored_acc_v1$wget, dlyWordsStored_acc_v2$wget;
  wire [15 : 0] dlyReadyToWrite_acc_v1$wget, dlyReadyToWrite_acc_v2$wget;
  wire [11 : 0] wsi_Es_mBurstLength_w$wget;
  wire [7 : 0] dlyReadCredit_acc_v1$wget,
	       dlyReadCredit_acc_v2$wget,
	       wsi_Es_mReqInfo_w$wget;
  wire [3 : 0] wci_wci_Es_mByteEn_w$wget, wsi_Es_mByteEn_w$wget;
  wire [2 : 0] wci_wci_Es_mCmd_w$wget,
	       wci_wslv_wEdge$wget,
	       wsi_Es_mCmd_w$wget;
  wire [1 : 0] wmemi_Em_sResp_w$wget;
  wire dlyReadCredit_acc_v1$whas,
       dlyReadCredit_acc_v2$whas,
       dlyReadyToWrite_acc_v1$whas,
       dlyReadyToWrite_acc_v2$whas,
       dlyWordsStored_acc_v1$whas,
       dlyWordsStored_acc_v2$whas,
       mesgWF_pwDequeue$whas,
       mesgWF_pwEnqueue$whas,
       mesgWF_wDataIn$whas,
       mesgWF_wDataOut$whas,
       wci_wci_Es_mAddrSpace_w$wget,
       wci_wci_Es_mAddrSpace_w$whas,
       wci_wci_Es_mAddr_w$whas,
       wci_wci_Es_mByteEn_w$whas,
       wci_wci_Es_mCmd_w$whas,
       wci_wci_Es_mData_w$whas,
       wci_wslv_ctlAckReg_1$wget,
       wci_wslv_ctlAckReg_1$whas,
       wci_wslv_reqF_r_clr$whas,
       wci_wslv_reqF_r_deq$whas,
       wci_wslv_reqF_r_enq$whas,
       wci_wslv_respF_dequeueing$whas,
       wci_wslv_respF_enqueueing$whas,
       wci_wslv_respF_x_wire$whas,
       wci_wslv_sFlagReg_1$wget,
       wci_wslv_sFlagReg_1$whas,
       wci_wslv_sThreadBusy_pw$whas,
       wci_wslv_wEdge$whas,
       wci_wslv_wciReq$whas,
       wci_wslv_wci_cfrd_pw$whas,
       wci_wslv_wci_cfwr_pw$whas,
       wci_wslv_wci_ctrl_pw$whas,
       wmemi_Em_sData_w$whas,
       wmemi_Em_sRespLast_w$whas,
       wmemi_Em_sResp_w$whas,
       wmemi_dhF_dequeueing$whas,
       wmemi_dhF_enqueueing$whas,
       wmemi_dhF_x_wire$whas,
       wmemi_operateD_1$wget,
       wmemi_operateD_1$whas,
       wmemi_peerIsReady_1$wget,
       wmemi_peerIsReady_1$whas,
       wmemi_reqF_dequeueing$whas,
       wmemi_reqF_enqueueing$whas,
       wmemi_reqF_x_wire$whas,
       wmemi_sCmdAccept_w$wget,
       wmemi_sCmdAccept_w$whas,
       wmemi_sDataAccept_w$wget,
       wmemi_sDataAccept_w$whas,
       wmemi_wmemiResponse$whas,
       wsiM_operateD_1$wget,
       wsiM_operateD_1$whas,
       wsiM_peerIsReady_1$wget,
       wsiM_peerIsReady_1$whas,
       wsiM_reqFifo_dequeueing$whas,
       wsiM_reqFifo_enqueueing$whas,
       wsiM_reqFifo_x_wire$whas,
       wsiM_sThreadBusy_pw$whas,
       wsiS_operateD_1$wget,
       wsiS_operateD_1$whas,
       wsiS_peerIsReady_1$wget,
       wsiS_peerIsReady_1$whas,
       wsiS_reqFifo_doResetClr$whas,
       wsiS_reqFifo_doResetDeq$whas,
       wsiS_reqFifo_doResetEnq$whas,
       wsiS_reqFifo_r_clr$whas,
       wsiS_reqFifo_r_deq$whas,
       wsiS_reqFifo_r_enq$whas,
       wsiS_sThreadBusy_dw$wget,
       wsiS_sThreadBusy_dw$whas,
       wsiS_wsiReq$whas,
       wsi_Es_mBurstLength_w$whas,
       wsi_Es_mBurstPrecise_w$whas,
       wsi_Es_mByteEn_w$whas,
       wsi_Es_mCmd_w$whas,
       wsi_Es_mDataInfo_w$whas,
       wsi_Es_mData_w$whas,
       wsi_Es_mReqInfo_w$whas,
       wsi_Es_mReqLast_w$whas;
  // register bytesRead
  reg [31 : 0] bytesRead;
  wire [31 : 0] bytesRead$D_IN;
  wire bytesRead$EN;
  // register bytesThisMessage
  reg [23 : 0] bytesThisMessage;
  wire [23 : 0] bytesThisMessage$D_IN;
  wire bytesThisMessage$EN;
  // register bytesWritten
  reg [31 : 0] bytesWritten;
  wire [31 : 0] bytesWritten$D_IN;
  wire bytesWritten$EN;
  // register cyclesPassed
  reg [31 : 0] cyclesPassed;
  wire [31 : 0] cyclesPassed$D_IN;
  wire cyclesPassed$EN;
  // register dlyCtrl
  reg [31 : 0] dlyCtrl;
  wire [31 : 0] dlyCtrl$D_IN;
  wire dlyCtrl$EN;
  // register dlyHoldoffBytes
  reg [31 : 0] dlyHoldoffBytes;
  wire [31 : 0] dlyHoldoffBytes$D_IN;
  wire dlyHoldoffBytes$EN;
  // register dlyHoldoffCycles
  reg [31 : 0] dlyHoldoffCycles;
  wire [31 : 0] dlyHoldoffCycles$D_IN;
  wire dlyHoldoffCycles$EN;
  // register dlyRAG
  reg [22 : 0] dlyRAG;
  wire [22 : 0] dlyRAG$D_IN;
  wire dlyRAG$EN;
  // register dlyRdOpOther
  reg [31 : 0] dlyRdOpOther;
  wire [31 : 0] dlyRdOpOther$D_IN;
  wire dlyRdOpOther$EN;
  // register dlyRdOpZero
  reg [31 : 0] dlyRdOpZero;
  wire [31 : 0] dlyRdOpZero$D_IN;
  wire dlyRdOpZero$EN;
  // register dlyReadCredit_value
  reg [7 : 0] dlyReadCredit_value;
  wire [7 : 0] dlyReadCredit_value$D_IN;
  wire dlyReadCredit_value$EN;
  // register dlyReadyToWrite_value
  reg [15 : 0] dlyReadyToWrite_value;
  wire [15 : 0] dlyReadyToWrite_value$D_IN;
  wire dlyReadyToWrite_value$EN;
  // register dlyWAG
  reg [22 : 0] dlyWAG;
  wire [22 : 0] dlyWAG$D_IN;
  wire dlyWAG$EN;
  // register dlyWordsStored_value
  reg [24 : 0] dlyWordsStored_value;
  wire [24 : 0] dlyWordsStored_value$D_IN;
  wire dlyWordsStored_value$EN;
  // register mesgLengthSoFar
  reg [13 : 0] mesgLengthSoFar;
  wire [13 : 0] mesgLengthSoFar$D_IN;
  wire mesgLengthSoFar$EN;
  // register mesgRdCount
  reg [31 : 0] mesgRdCount;
  wire [31 : 0] mesgRdCount$D_IN;
  wire mesgRdCount$EN;
  // register mesgWF_rCache
  reg [45 : 0] mesgWF_rCache;
  wire [45 : 0] mesgWF_rCache$D_IN;
  wire mesgWF_rCache$EN;
  // register mesgWF_rRdPtr
  reg [12 : 0] mesgWF_rRdPtr;
  wire [12 : 0] mesgWF_rRdPtr$D_IN;
  wire mesgWF_rRdPtr$EN;
  // register mesgWF_rWrPtr
  reg [12 : 0] mesgWF_rWrPtr;
  wire [12 : 0] mesgWF_rWrPtr$D_IN;
  wire mesgWF_rWrPtr$EN;
  // register mesgWtCount
  reg [31 : 0] mesgWtCount;
  wire [31 : 0] mesgWtCount$D_IN;
  wire mesgWtCount$EN;
  // register rdSerAddr
  reg [31 : 0] rdSerAddr;
  wire [31 : 0] rdSerAddr$D_IN;
  wire rdSerAddr$EN;
  // register rdSerEmpty
  reg rdSerEmpty;
  wire rdSerEmpty$D_IN, rdSerEmpty$EN;
  // register rdSerMeta
  reg [31 : 0] rdSerMeta;
  wire [31 : 0] rdSerMeta$D_IN;
  wire rdSerMeta$EN;
  // register rdSerPos
  reg [1 : 0] rdSerPos;
  wire [1 : 0] rdSerPos$D_IN;
  wire rdSerPos$EN;
  // register rdSerStage
  reg [31 : 0] rdSerStage;
  wire [31 : 0] rdSerStage$D_IN;
  wire rdSerStage$EN;
  // register rdSerStage_1
  reg [31 : 0] rdSerStage_1;
  wire [31 : 0] rdSerStage_1$D_IN;
  wire rdSerStage_1$EN;
  // register rdSerStage_2
  reg [31 : 0] rdSerStage_2;
  wire [31 : 0] rdSerStage_2$D_IN;
  wire rdSerStage_2$EN;
  // register rdSerStage_3
  reg [31 : 0] rdSerStage_3;
  wire [31 : 0] rdSerStage_3$D_IN;
  wire rdSerStage_3$EN;
  // register rdSerUnroll
  reg [15 : 0] rdSerUnroll;
  wire [15 : 0] rdSerUnroll$D_IN;
  wire rdSerUnroll$EN;
  // register rdSyncWord
  reg rdSyncWord;
  reg rdSyncWord$D_IN;
  wire rdSyncWord$EN;
  // register readMeta
  reg [31 : 0] readMeta;
  wire [31 : 0] readMeta$D_IN;
  wire readMeta$EN;
  // register tog50
  reg tog50;
  wire tog50$D_IN, tog50$EN;
  // register unrollCnt
  reg [15 : 0] unrollCnt;
  wire [15 : 0] unrollCnt$D_IN;
  wire unrollCnt$EN;
  // register wci_wslv_cEdge
  reg [2 : 0] wci_wslv_cEdge;
  wire [2 : 0] wci_wslv_cEdge$D_IN;
  wire wci_wslv_cEdge$EN;
  // register wci_wslv_cState
  reg [2 : 0] wci_wslv_cState;
  wire [2 : 0] wci_wslv_cState$D_IN;
  wire wci_wslv_cState$EN;
  // register wci_wslv_ctlAckReg
  reg wci_wslv_ctlAckReg;
  wire wci_wslv_ctlAckReg$D_IN, wci_wslv_ctlAckReg$EN;
  // register wci_wslv_ctlOpActive
  reg wci_wslv_ctlOpActive;
  wire wci_wslv_ctlOpActive$D_IN, wci_wslv_ctlOpActive$EN;
  // register wci_wslv_illegalEdge
  reg wci_wslv_illegalEdge;
  wire wci_wslv_illegalEdge$D_IN, wci_wslv_illegalEdge$EN;
  // register wci_wslv_isReset_isInReset
  reg wci_wslv_isReset_isInReset;
  wire wci_wslv_isReset_isInReset$D_IN, wci_wslv_isReset_isInReset$EN;
  // register wci_wslv_nState
  reg [2 : 0] wci_wslv_nState;
  reg [2 : 0] wci_wslv_nState$D_IN;
  wire wci_wslv_nState$EN;
  // register wci_wslv_reqF_countReg
  reg [1 : 0] wci_wslv_reqF_countReg;
  wire [1 : 0] wci_wslv_reqF_countReg$D_IN;
  wire wci_wslv_reqF_countReg$EN;
  // register wci_wslv_respF_c_r
  reg [1 : 0] wci_wslv_respF_c_r;
  wire [1 : 0] wci_wslv_respF_c_r$D_IN;
  wire wci_wslv_respF_c_r$EN;
  // register wci_wslv_respF_q_0
  reg [33 : 0] wci_wslv_respF_q_0;
  reg [33 : 0] wci_wslv_respF_q_0$D_IN;
  wire wci_wslv_respF_q_0$EN;
  // register wci_wslv_respF_q_1
  reg [33 : 0] wci_wslv_respF_q_1;
  reg [33 : 0] wci_wslv_respF_q_1$D_IN;
  wire wci_wslv_respF_q_1$EN;
  // register wci_wslv_sFlagReg
  reg wci_wslv_sFlagReg;
  wire wci_wslv_sFlagReg$D_IN, wci_wslv_sFlagReg$EN;
  // register wci_wslv_sThreadBusy_d
  reg wci_wslv_sThreadBusy_d;
  wire wci_wslv_sThreadBusy_d$D_IN, wci_wslv_sThreadBusy_d$EN;
  // register wmemiRdReq
  reg [31 : 0] wmemiRdReq;
  wire [31 : 0] wmemiRdReq$D_IN;
  wire wmemiRdReq$EN;
  // register wmemiRdResp1
  reg [31 : 0] wmemiRdResp1;
  wire [31 : 0] wmemiRdResp1$D_IN;
  wire wmemiRdResp1$EN;
  // register wmemiRdResp2
  reg [31 : 0] wmemiRdResp2;
  wire [31 : 0] wmemiRdResp2$D_IN;
  wire wmemiRdResp2$EN;
  // register wmemiWrReq
  reg [31 : 0] wmemiWrReq;
  wire [31 : 0] wmemiWrReq$D_IN;
  wire wmemiWrReq$EN;
  // register wmemi_busyWithMessage
  reg wmemi_busyWithMessage;
  wire wmemi_busyWithMessage$D_IN, wmemi_busyWithMessage$EN;
  // register wmemi_dhF_c_r
  reg [1 : 0] wmemi_dhF_c_r;
  wire [1 : 0] wmemi_dhF_c_r$D_IN;
  wire wmemi_dhF_c_r$EN;
  // register wmemi_dhF_q_0
  reg [145 : 0] wmemi_dhF_q_0;
  reg [145 : 0] wmemi_dhF_q_0$D_IN;
  wire wmemi_dhF_q_0$EN;
  // register wmemi_dhF_q_1
  reg [145 : 0] wmemi_dhF_q_1;
  reg [145 : 0] wmemi_dhF_q_1$D_IN;
  wire wmemi_dhF_q_1$EN;
  // register wmemi_errorSticky
  reg wmemi_errorSticky;
  wire wmemi_errorSticky$D_IN, wmemi_errorSticky$EN;
  // register wmemi_isReset_isInReset
  reg wmemi_isReset_isInReset;
  wire wmemi_isReset_isInReset$D_IN, wmemi_isReset_isInReset$EN;
  // register wmemi_operateD
  reg wmemi_operateD;
  wire wmemi_operateD$D_IN, wmemi_operateD$EN;
  // register wmemi_peerIsReady
  reg wmemi_peerIsReady;
  wire wmemi_peerIsReady$D_IN, wmemi_peerIsReady$EN;
  // register wmemi_reqF_c_r
  reg [1 : 0] wmemi_reqF_c_r;
  wire [1 : 0] wmemi_reqF_c_r$D_IN;
  wire wmemi_reqF_c_r$EN;
  // register wmemi_reqF_q_0
  reg [51 : 0] wmemi_reqF_q_0;
  reg [51 : 0] wmemi_reqF_q_0$D_IN;
  wire wmemi_reqF_q_0$EN;
  // register wmemi_reqF_q_1
  reg [51 : 0] wmemi_reqF_q_1;
  reg [51 : 0] wmemi_reqF_q_1$D_IN;
  wire wmemi_reqF_q_1$EN;
  // register wmemi_statusR
  reg [7 : 0] wmemi_statusR;
  wire [7 : 0] wmemi_statusR$D_IN;
  wire wmemi_statusR$EN;
  // register wmemi_trafficSticky
  reg wmemi_trafficSticky;
  wire wmemi_trafficSticky$D_IN, wmemi_trafficSticky$EN;
  // register wrtSerAddr
  reg [31 : 0] wrtSerAddr;
  wire [31 : 0] wrtSerAddr$D_IN;
  wire wrtSerAddr$EN;
  // register wrtSerPos
  reg [1 : 0] wrtSerPos;
  wire [1 : 0] wrtSerPos$D_IN;
  wire wrtSerPos$EN;
  // register wrtSerStage
  reg [31 : 0] wrtSerStage;
  wire [31 : 0] wrtSerStage$D_IN;
  wire wrtSerStage$EN;
  // register wrtSerStage_1
  reg [31 : 0] wrtSerStage_1;
  wire [31 : 0] wrtSerStage_1$D_IN;
  wire wrtSerStage_1$EN;
  // register wrtSerStage_2
  reg [31 : 0] wrtSerStage_2;
  wire [31 : 0] wrtSerStage_2$D_IN;
  wire wrtSerStage_2$EN;
  // register wrtSerStage_3
  reg [31 : 0] wrtSerStage_3;
  wire [31 : 0] wrtSerStage_3$D_IN;
  wire wrtSerStage_3$EN;
  // register wrtSerUnroll
  reg [15 : 0] wrtSerUnroll;
  wire [15 : 0] wrtSerUnroll$D_IN;
  wire wrtSerUnroll$EN;
  // register wsiM_burstKind
  reg [1 : 0] wsiM_burstKind;
  wire [1 : 0] wsiM_burstKind$D_IN;
  wire wsiM_burstKind$EN;
  // register wsiM_errorSticky
  reg wsiM_errorSticky;
  wire wsiM_errorSticky$D_IN, wsiM_errorSticky$EN;
  // register wsiM_iMesgCount
  reg [31 : 0] wsiM_iMesgCount;
  wire [31 : 0] wsiM_iMesgCount$D_IN;
  wire wsiM_iMesgCount$EN;
  // register wsiM_isReset_isInReset
  reg wsiM_isReset_isInReset;
  wire wsiM_isReset_isInReset$D_IN, wsiM_isReset_isInReset$EN;
  // register wsiM_operateD
  reg wsiM_operateD;
  wire wsiM_operateD$D_IN, wsiM_operateD$EN;
  // register wsiM_pMesgCount
  reg [31 : 0] wsiM_pMesgCount;
  wire [31 : 0] wsiM_pMesgCount$D_IN;
  wire wsiM_pMesgCount$EN;
  // register wsiM_peerIsReady
  reg wsiM_peerIsReady;
  wire wsiM_peerIsReady$D_IN, wsiM_peerIsReady$EN;
  // register wsiM_reqFifo_c_r
  reg [1 : 0] wsiM_reqFifo_c_r;
  wire [1 : 0] wsiM_reqFifo_c_r$D_IN;
  wire wsiM_reqFifo_c_r$EN;
  // register wsiM_reqFifo_q_0
  reg [60 : 0] wsiM_reqFifo_q_0;
  reg [60 : 0] wsiM_reqFifo_q_0$D_IN;
  wire wsiM_reqFifo_q_0$EN;
  // register wsiM_reqFifo_q_1
  reg [60 : 0] wsiM_reqFifo_q_1;
  reg [60 : 0] wsiM_reqFifo_q_1$D_IN;
  wire wsiM_reqFifo_q_1$EN;
  // register wsiM_sThreadBusy_d
  reg wsiM_sThreadBusy_d;
  wire wsiM_sThreadBusy_d$D_IN, wsiM_sThreadBusy_d$EN;
  // register wsiM_statusR
  reg [7 : 0] wsiM_statusR;
  wire [7 : 0] wsiM_statusR$D_IN;
  wire wsiM_statusR$EN;
  // register wsiM_tBusyCount
  reg [31 : 0] wsiM_tBusyCount;
  wire [31 : 0] wsiM_tBusyCount$D_IN;
  wire wsiM_tBusyCount$EN;
  // register wsiM_trafficSticky
  reg wsiM_trafficSticky;
  wire wsiM_trafficSticky$D_IN, wsiM_trafficSticky$EN;
  // register wsiS_burstKind
  reg [1 : 0] wsiS_burstKind;
  wire [1 : 0] wsiS_burstKind$D_IN;
  wire wsiS_burstKind$EN;
  // register wsiS_errorSticky
  reg wsiS_errorSticky;
  wire wsiS_errorSticky$D_IN, wsiS_errorSticky$EN;
  // register wsiS_iMesgCount
  reg [31 : 0] wsiS_iMesgCount;
  wire [31 : 0] wsiS_iMesgCount$D_IN;
  wire wsiS_iMesgCount$EN;
  // register wsiS_isReset_isInReset
  reg wsiS_isReset_isInReset;
  wire wsiS_isReset_isInReset$D_IN, wsiS_isReset_isInReset$EN;
  // register wsiS_mesgWordLength
  reg [11 : 0] wsiS_mesgWordLength;
  wire [11 : 0] wsiS_mesgWordLength$D_IN;
  wire wsiS_mesgWordLength$EN;
  // register wsiS_operateD
  reg wsiS_operateD;
  wire wsiS_operateD$D_IN, wsiS_operateD$EN;
  // register wsiS_pMesgCount
  reg [31 : 0] wsiS_pMesgCount;
  wire [31 : 0] wsiS_pMesgCount$D_IN;
  wire wsiS_pMesgCount$EN;
  // register wsiS_peerIsReady
  reg wsiS_peerIsReady;
  wire wsiS_peerIsReady$D_IN, wsiS_peerIsReady$EN;
  // register wsiS_reqFifo_countReg
  reg [1 : 0] wsiS_reqFifo_countReg;
  wire [1 : 0] wsiS_reqFifo_countReg$D_IN;
  wire wsiS_reqFifo_countReg$EN;
  // register wsiS_reqFifo_levelsValid
  reg wsiS_reqFifo_levelsValid;
  wire wsiS_reqFifo_levelsValid$D_IN, wsiS_reqFifo_levelsValid$EN;
  // register wsiS_statusR
  reg [7 : 0] wsiS_statusR;
  wire [7 : 0] wsiS_statusR$D_IN;
  wire wsiS_statusR$EN;
  // register wsiS_tBusyCount
  reg [31 : 0] wsiS_tBusyCount;
  wire [31 : 0] wsiS_tBusyCount$D_IN;
  wire wsiS_tBusyCount$EN;
  // register wsiS_trafficSticky
  reg wsiS_trafficSticky;
  wire wsiS_trafficSticky$D_IN, wsiS_trafficSticky$EN;
  // register wsiS_wordCount
  reg [11 : 0] wsiS_wordCount;
  wire [11 : 0] wsiS_wordCount$D_IN;
  wire wsiS_wordCount$EN;
  // ports of submodule mesgRF
  wire [31 : 0] mesgRF$D_IN, mesgRF$D_OUT;
  wire mesgRF$CLR, mesgRF$DEQ, mesgRF$EMPTY_N, mesgRF$ENQ, mesgRF$FULL_N;
  // ports of submodule mesgWF_memory
  wire [31 : 0] mesgWF_memory$DIA, mesgWF_memory$DIB, mesgWF_memory$DOB;
  wire [11 : 0] mesgWF_memory$ADDRA, mesgWF_memory$ADDRB;
  wire mesgWF_memory$ENA,
       mesgWF_memory$ENB,
       mesgWF_memory$WEA,
       mesgWF_memory$WEB;
  // ports of submodule metaRF
  wire [31 : 0] metaRF$D_IN, metaRF$D_OUT;
  wire metaRF$CLR, metaRF$DEQ, metaRF$EMPTY_N, metaRF$ENQ, metaRF$FULL_N;
  // ports of submodule metaWF
  wire [31 : 0] metaWF$D_IN, metaWF$D_OUT;
  wire metaWF$CLR, metaWF$DEQ, metaWF$EMPTY_N, metaWF$ENQ, metaWF$FULL_N;
  // ports of submodule wci_wslv_reqF
  wire [71 : 0] wci_wslv_reqF$D_IN, wci_wslv_reqF$D_OUT;
  wire wci_wslv_reqF$CLR,
       wci_wslv_reqF$DEQ,
       wci_wslv_reqF$EMPTY_N,
       wci_wslv_reqF$ENQ;
  // ports of submodule wide16Fa
  wire [127 : 0] wide16Fa$D_IN, wide16Fa$D_OUT;
  wire wide16Fa$CLR,
       wide16Fa$DEQ,
       wide16Fa$EMPTY_N,
       wide16Fa$ENQ,
       wide16Fa$FULL_N;
  // ports of submodule wide16Fb
  wire [127 : 0] wide16Fb$D_IN, wide16Fb$D_OUT;
  wire wide16Fb$CLR,
       wide16Fb$DEQ,
       wide16Fb$EMPTY_N,
       wide16Fb$ENQ,
       wide16Fb$FULL_N;
  // ports of submodule wide16Fc
  wire [127 : 0] wide16Fc$D_IN, wide16Fc$D_OUT;
  wire wide16Fc$CLR,
       wide16Fc$DEQ,
       wide16Fc$EMPTY_N,
       wide16Fc$ENQ,
       wide16Fc$FULL_N;
  // ports of submodule wmemi_respF
  wire [130 : 0] wmemi_respF$D_IN, wmemi_respF$D_OUT;
  wire wmemi_respF$CLR,
       wmemi_respF$DEQ,
       wmemi_respF$EMPTY_N,
       wmemi_respF$ENQ,
       wmemi_respF$FULL_N;
  // ports of submodule wsiS_reqFifo
  wire [60 : 0] wsiS_reqFifo$D_IN, wsiS_reqFifo$D_OUT;
  wire wsiS_reqFifo$CLR,
       wsiS_reqFifo$DEQ,
       wsiS_reqFifo$EMPTY_N,
       wsiS_reqFifo$ENQ,
       wsiS_reqFifo$FULL_N;
  // rule scheduling signals
  wire CAN_FIRE_RL_delay_read_req,
       WILL_FIRE_RL_delay_read_req,
       WILL_FIRE_RL_delay_write_req,
       WILL_FIRE_RL_rdSer_begin,
       WILL_FIRE_RL_rdSer_body,
       WILL_FIRE_RL_rdSer_sync,
       WILL_FIRE_RL_wci_cfrd,
       WILL_FIRE_RL_wci_cfwr,
       WILL_FIRE_RL_wci_ctrl_EiI,
       WILL_FIRE_RL_wci_ctrl_IsO,
       WILL_FIRE_RL_wci_ctrl_OrE,
       WILL_FIRE_RL_wci_wslv_ctl_op_complete,
       WILL_FIRE_RL_wci_wslv_ctl_op_start,
       WILL_FIRE_RL_wci_wslv_respF_both,
       WILL_FIRE_RL_wci_wslv_respF_decCtr,
       WILL_FIRE_RL_wci_wslv_respF_incCtr,
       WILL_FIRE_RL_wmemi_dhF_both,
       WILL_FIRE_RL_wmemi_dhF_decCtr,
       WILL_FIRE_RL_wmemi_dhF_incCtr,
       WILL_FIRE_RL_wmemi_reqF_both,
       WILL_FIRE_RL_wmemi_reqF_decCtr,
       WILL_FIRE_RL_wmemi_reqF_incCtr,
       WILL_FIRE_RL_wmrd_mesgBegin,
       WILL_FIRE_RL_wmrd_mesgBodyResponse,
       WILL_FIRE_RL_wmwt_mesg_ingress,
       WILL_FIRE_RL_wrtSer_begin,
       WILL_FIRE_RL_wrtSer_body,
       WILL_FIRE_RL_wsiM_reqFifo_both,
       WILL_FIRE_RL_wsiM_reqFifo_decCtr,
       WILL_FIRE_RL_wsiM_reqFifo_deq,
       WILL_FIRE_RL_wsiM_reqFifo_incCtr,
       WILL_FIRE_RL_wsiS_reqFifo_enq,
       WILL_FIRE_RL_wsiS_reqFifo_reset,
       WILL_FIRE_RL_wsipass_doMessagePush;
  // inputs to muxes for submodule ports
  reg [127 : 0] MUX_wide16Fa$enq_1__VAL_1, MUX_wide16Fa$enq_1__VAL_2;
  reg [33 : 0] MUX_wci_wslv_respF_q_0$write_1__VAL_1;
  wire [145 : 0] MUX_wmemi_dhF_q_0$write_1__VAL_1,
		 MUX_wmemi_dhF_q_0$write_1__VAL_2,
		 MUX_wmemi_dhF_q_1$write_1__VAL_2;
  wire [60 : 0] MUX_wsiM_reqFifo_q_0$write_1__VAL_1,
		MUX_wsiM_reqFifo_q_0$write_1__VAL_2,
		MUX_wsiM_reqFifo_q_1$write_1__VAL_2,
		MUX_wsiM_reqFifo_x_wire$wset_1__VAL_1;
  wire [51 : 0] MUX_wmemi_reqF_q_0$write_1__VAL_1,
		MUX_wmemi_reqF_q_0$write_1__VAL_2,
		MUX_wmemi_reqF_q_1$write_1__VAL_2,
		MUX_wmemi_reqF_x_wire$wset_1__VAL_1,
		MUX_wmemi_reqF_x_wire$wset_1__VAL_2;
  wire [33 : 0] MUX_wci_wslv_respF_q_0$write_1__VAL_2,
		MUX_wci_wslv_respF_q_1$write_1__VAL_2,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_1,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_2;
  wire [31 : 0] MUX_mesgRdCount$write_1__VAL_1,
		MUX_mesgWtCount$write_1__VAL_1;
  wire [24 : 0] MUX_dlyWordsStored_value$write_1__VAL_2;
  wire [22 : 0] MUX_dlyRAG$write_1__VAL_1, MUX_dlyWAG$write_1__VAL_1;
  wire [15 : 0] MUX_dlyReadyToWrite_value$write_1__VAL_2,
		MUX_rdSerUnroll$write_1__VAL_2,
		MUX_unrollCnt$write_1__VAL_1,
		MUX_unrollCnt$write_1__VAL_2,
		MUX_wrtSerUnroll$write_1__VAL_2;
  wire [7 : 0] MUX_dlyReadCredit_value$write_1__VAL_2;
  wire [1 : 0] MUX_rdSerPos$write_1__VAL_1,
	       MUX_wci_wslv_respF_c_r$write_1__VAL_1,
	       MUX_wci_wslv_respF_c_r$write_1__VAL_2,
	       MUX_wmemi_dhF_c_r$write_1__VAL_1,
	       MUX_wmemi_dhF_c_r$write_1__VAL_2,
	       MUX_wmemi_reqF_c_r$write_1__VAL_1,
	       MUX_wmemi_reqF_c_r$write_1__VAL_2,
	       MUX_wrtSerPos$write_1__VAL_1,
	       MUX_wrtSerPos$write_1__VAL_2,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_1,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_2;
  wire MUX_mesgRdCount$write_1__SEL_1,
       MUX_mesgWtCount$write_1__SEL_1,
       MUX_rdSerEmpty$write_1__PSEL_1,
       MUX_rdSerEmpty$write_1__SEL_1,
       MUX_rdSyncWord$write_1__VAL_1,
       MUX_rdSyncWord$write_1__VAL_2,
       MUX_wci_wslv_illegalEdge$write_1__SEL_1,
       MUX_wci_wslv_illegalEdge$write_1__SEL_2,
       MUX_wci_wslv_illegalEdge$write_1__VAL_2,
       MUX_wci_wslv_respF_q_0$write_1__SEL_1,
       MUX_wci_wslv_respF_q_1$write_1__SEL_1,
       MUX_wide16Fa$enq_1__SEL_1,
       MUX_wmemi_dhF_q_0$write_1__SEL_1,
       MUX_wmemi_dhF_q_1$write_1__SEL_1,
       MUX_wmemi_reqF_q_0$write_1__SEL_1,
       MUX_wmemi_reqF_q_1$write_1__SEL_1,
       MUX_wrtSerStage$write_1__SEL_1,
       MUX_wrtSerStage_1$write_1__SEL_1,
       MUX_wrtSerStage_2$write_1__SEL_1,
       MUX_wrtSerStage_3$write_1__SEL_1,
       MUX_wsiM_reqFifo_q_0$write_1__SEL_1,
       MUX_wsiM_reqFifo_q_1$write_1__SEL_1;
  // remaining internal signals
  reg [63 : 0] v__h24065, v__h3739, v__h3914, v__h4058;
  reg [31 : 0] g_data__h23399, v__h21048;
  reg CASE_wrtSerPos_0b1_0_1_1_1_2_1_3_0b1__q2,
      CASE_wrtSerPos_NOT_wrtSerPos_EQ_3_OR_wide16Fa_ETC__q1;
  wire [127 : 0] IF_wrtSerPos_90_EQ_2_00_THEN_0x0_ELSE_mesgWF_w_ETC___d557,
		 IF_wrtSerPos_90_EQ_2_00_THEN_0x0_ELSE_metaWF_f_ETC___d528,
		 x__h19290,
		 x__h19317,
		 x__h19946,
		 x__h19970;
  wire [35 : 0] addr__h20380, addr__h20732;
  wire [31 : 0] data__h19661,
		delayStatus__h23019,
		rdat__h23426,
		rdat__h23432,
		rdat__h23438,
		rdat__h23444,
		rdat__h23568,
		rdat__h23582,
		rdat__h23590,
		rdat__h23596,
		rdat__h23610,
		rdat__h23618,
		rdat__h23624,
		rdat__h23630,
		rdat__h23636,
		rdat__h23642,
		rdat__h23653,
		rdat__h23664,
		rdat__h23675,
		rdat__h23696,
		rdat__h23751,
		rdat__h23760,
		rdat__h23769,
		rdat__h23778,
		x__h16006;
  wire [26 : 0] x__h20438, x__h20777;
  wire [23 : 0] btm__h18537, x__h23448;
  wire [13 : 0] mesgLengthSoFar_73_PLUS_1___d909;
  wire [12 : 0] x__h16107;
  wire [11 : 0] x_burstLength__h22925;
  wire [3 : 0] x_byteEn__h22926;
  wire [1 : 0] wrtSerPos_90_PLUS_1___d908;
  wire IF_wrtSerPos_90_EQ_0_98_OR_wrtSerPos_90_EQ_1_9_ETC___d543,
       NOT_mesgWF_rRdPtr_04_EQ_mesgWF_rWrPtr_95_31___d532,
       NOT_mesgWF_rRdPtr_04_PLUS_2048_60_EQ_mesgWF_rW_ETC___d462,
       NOT_wrtSerPos_90_EQ_3_91_92_AND_NOT_metaWF_fir_ETC___d506,
       bytesWritten_86_ULT_dlyHoldoffBytes_65___d995,
       cyclesPassed_56_ULT_dlyHoldoffCycles_68___d993,
       dlyWordsStored_value_17_SLE_0_64_OR_bytesWritt_ETC___d572,
       dlyWordsStored_value_17_SLE_0___d994,
       dlyWordsStored_value_17_SLT_8388608___d574,
       mesgRF_i_notFull__71_AND_NOT_rdSerEmpty_21_22__ETC___d672,
       metaRF_i_notFull__20_AND_NOT_rdSerEmpty_21_22__ETC___d631,
       wci_wslv_cState_6_EQ_2_7_AND_dlyCtrl_48_BITS_3_ETC___d592;
  // value method wciS0_sResp
  assign wciS0_SResp = wci_wslv_respF_q_0[33:32] ;
  // value method wciS0_sData
  assign wciS0_SData = wci_wslv_respF_q_0[31:0] ;
  // value method wciS0_sThreadBusy
  assign wciS0_SThreadBusy =
	     wci_wslv_reqF_countReg > 2'd1 || wci_wslv_isReset_isInReset ;
  // value method wciS0_sFlag
  assign wciS0_SFlag = { 1'd1, wci_wslv_sFlagReg } ;
  // value method wsiS0_sThreadBusy
  assign wsiS0_SThreadBusy =
	     !wsiS_sThreadBusy_dw$whas || wsiS_sThreadBusy_dw$wget ;
  // value method wsiS0_sReset_n
  assign wsiS0_SReset_n = !wsiS_isReset_isInReset && wsiS_operateD ;
  // value method wsiM0_mCmd
  assign wsiM0_MCmd = wsiM_sThreadBusy_d ? 3'd0 : wsiM_reqFifo_q_0[60:58] ;
  // value method wsiM0_mReqLast
  assign wsiM0_MReqLast = !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[57] ;
  // value method wsiM0_mBurstPrecise
  assign wsiM0_MBurstPrecise = !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[56] ;
  // value method wsiM0_mBurstLength
  assign wsiM0_MBurstLength =
	     wsiM_sThreadBusy_d ? 12'd0 : wsiM_reqFifo_q_0[55:44] ;
  // value method wsiM0_mData
  assign wsiM0_MData = wsiM_reqFifo_q_0[43:12] ;
  // value method wsiM0_mByteEn
  assign wsiM0_MByteEn = wsiM_reqFifo_q_0[11:8] ;
  // value method wsiM0_mReqInfo
  assign wsiM0_MReqInfo = wsiM_sThreadBusy_d ? 8'd0 : wsiM_reqFifo_q_0[7:0] ;
  // value method wsiM0_mReset_n
  assign wsiM0_MReset_n = !wsiM_isReset_isInReset && wsiM_operateD ;
  // value method wmemiM0_mCmd
  assign wmemiM0_MCmd = wmemi_reqF_q_0[51:49] ;
  // value method wmemiM0_mReqLast
  assign wmemiM0_MReqLast = wmemi_reqF_q_0[48] ;
  // value method wmemiM0_mAddr
  assign wmemiM0_MAddr = wmemi_reqF_q_0[47:12] ;
  // value method wmemiM0_mBurstLength
  assign wmemiM0_MBurstLength = wmemi_reqF_q_0[11:0] ;
  // value method wmemiM0_mDataValid
  assign wmemiM0_MDataValid = wmemi_dhF_q_0[145] ;
  // value method wmemiM0_mDataLast
  assign wmemiM0_MDataLast = wmemi_dhF_q_0[144] ;
  // value method wmemiM0_mData
  assign wmemiM0_MData = wmemi_dhF_q_0[143:16] ;
  // value method wmemiM0_mDataByteEn
  assign wmemiM0_MDataByteEn = wmemi_dhF_q_0[15:0] ;
  // value method wmemiM0_mReset_n
  assign wmemiM0_MReset_n = !wmemi_isReset_isInReset && wmemi_operateD ;
  // submodule mesgRF
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd15),
	      .p3cntr_width(32'd4),
	      .guarded(32'd1)) mesgRF(.RST(wciS0_MReset_n),
				      .CLK(wciS0_Clk),
				      .D_IN(mesgRF$D_IN),
				      .ENQ(mesgRF$ENQ),
				      .DEQ(mesgRF$DEQ),
				      .CLR(mesgRF$CLR),
				      .D_OUT(mesgRF$D_OUT),
				      .FULL_N(mesgRF$FULL_N),
				      .EMPTY_N(mesgRF$EMPTY_N));
  // submodule mesgWF_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd12),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(13'd4096)) mesgWF_memory(.CLKA(wciS0_Clk),
					    .CLKB(wciS0_Clk),
					    .ADDRA(mesgWF_memory$ADDRA),
					    .ADDRB(mesgWF_memory$ADDRB),
					    .DIA(mesgWF_memory$DIA),
					    .DIB(mesgWF_memory$DIB),
					    .WEA(mesgWF_memory$WEA),
					    .WEB(mesgWF_memory$WEB),
					    .ENA(mesgWF_memory$ENA),
					    .ENB(mesgWF_memory$ENB),
					    .DOA(),
					    .DOB(mesgWF_memory$DOB));
  // submodule metaRF
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd15),
	      .p3cntr_width(32'd4),
	      .guarded(32'd1)) metaRF(.RST(wciS0_MReset_n),
				      .CLK(wciS0_Clk),
				      .D_IN(metaRF$D_IN),
				      .ENQ(metaRF$ENQ),
				      .DEQ(metaRF$DEQ),
				      .CLR(metaRF$CLR),
				      .D_OUT(metaRF$D_OUT),
				      .FULL_N(metaRF$FULL_N),
				      .EMPTY_N(metaRF$EMPTY_N));
  // submodule metaWF
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd15),
	      .p3cntr_width(32'd4),
	      .guarded(32'd1)) metaWF(.RST(wciS0_MReset_n),
				      .CLK(wciS0_Clk),
				      .D_IN(metaWF$D_IN),
				      .ENQ(metaWF$ENQ),
				      .DEQ(metaWF$DEQ),
				      .CLR(metaWF$CLR),
				      .D_OUT(metaWF$D_OUT),
				      .FULL_N(metaWF$FULL_N),
				      .EMPTY_N(metaWF$EMPTY_N));
  // submodule wci_wslv_reqF
  SizedFIFO #(.p1width(32'd72),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wci_wslv_reqF(.RST(wciS0_MReset_n),
					     .CLK(wciS0_Clk),
					     .D_IN(wci_wslv_reqF$D_IN),
					     .ENQ(wci_wslv_reqF$ENQ),
					     .DEQ(wci_wslv_reqF$DEQ),
					     .CLR(wci_wslv_reqF$CLR),
					     .D_OUT(wci_wslv_reqF$D_OUT),
					     .FULL_N(),
					     .EMPTY_N(wci_wslv_reqF$EMPTY_N));
  // submodule wide16Fa
  SizedFIFO #(.p1width(32'd128),
	      .p2depth(32'd15),
	      .p3cntr_width(32'd4),
	      .guarded(32'd1)) wide16Fa(.RST(wciS0_MReset_n),
					.CLK(wciS0_Clk),
					.D_IN(wide16Fa$D_IN),
					.ENQ(wide16Fa$ENQ),
					.DEQ(wide16Fa$DEQ),
					.CLR(wide16Fa$CLR),
					.D_OUT(wide16Fa$D_OUT),
					.FULL_N(wide16Fa$FULL_N),
					.EMPTY_N(wide16Fa$EMPTY_N));
  // submodule wide16Fb
  SizedFIFO #(.p1width(32'd128),
	      .p2depth(32'd15),
	      .p3cntr_width(32'd4),
	      .guarded(32'd1)) wide16Fb(.RST(wciS0_MReset_n),
					.CLK(wciS0_Clk),
					.D_IN(wide16Fb$D_IN),
					.ENQ(wide16Fb$ENQ),
					.DEQ(wide16Fb$DEQ),
					.CLR(wide16Fb$CLR),
					.D_OUT(wide16Fb$D_OUT),
					.FULL_N(wide16Fb$FULL_N),
					.EMPTY_N(wide16Fb$EMPTY_N));
  // submodule wide16Fc
  SizedFIFO #(.p1width(32'd128),
	      .p2depth(32'd15),
	      .p3cntr_width(32'd4),
	      .guarded(32'd1)) wide16Fc(.RST(wciS0_MReset_n),
					.CLK(wciS0_Clk),
					.D_IN(wide16Fc$D_IN),
					.ENQ(wide16Fc$ENQ),
					.DEQ(wide16Fc$DEQ),
					.CLR(wide16Fc$CLR),
					.D_OUT(wide16Fc$D_OUT),
					.FULL_N(wide16Fc$FULL_N),
					.EMPTY_N(wide16Fc$EMPTY_N));
  // submodule wmemi_respF
  FIFO2 #(.width(32'd131), .guarded(32'd1)) wmemi_respF(.RST(wciS0_MReset_n),
							.CLK(wciS0_Clk),
							.D_IN(wmemi_respF$D_IN),
							.ENQ(wmemi_respF$ENQ),
							.DEQ(wmemi_respF$DEQ),
							.CLR(wmemi_respF$CLR),
							.D_OUT(wmemi_respF$D_OUT),
							.FULL_N(wmemi_respF$FULL_N),
							.EMPTY_N(wmemi_respF$EMPTY_N));
  // submodule wsiS_reqFifo
  SizedFIFO #(.p1width(32'd61),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wsiS_reqFifo(.RST(wciS0_MReset_n),
					    .CLK(wciS0_Clk),
					    .D_IN(wsiS_reqFifo$D_IN),
					    .ENQ(wsiS_reqFifo$ENQ),
					    .DEQ(wsiS_reqFifo$DEQ),
					    .CLR(wsiS_reqFifo$CLR),
					    .D_OUT(wsiS_reqFifo$D_OUT),
					    .FULL_N(wsiS_reqFifo$FULL_N),
					    .EMPTY_N(wsiS_reqFifo$EMPTY_N));
  // rule RL_rdSer_sync
  assign WILL_FIRE_RL_rdSer_sync =
	     wci_wslv_cState == 3'd2 && dlyCtrl[3:0] == 4'h7 && rdSyncWord ;
  // rule RL_wci_wslv_ctl_op_start
  assign WILL_FIRE_RL_wci_wslv_ctl_op_start =
	     wci_wslv_reqF$EMPTY_N && wci_wslv_wci_ctrl_pw$whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_ctrl_EiI
  assign WILL_FIRE_RL_wci_ctrl_EiI =
	     wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd0 &&
	     wci_wslv_reqF$D_OUT[36:34] == 3'd0 ;
  // rule RL_wci_ctrl_OrE
  assign WILL_FIRE_RL_wci_ctrl_OrE =
	     wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd2 &&
	     wci_wslv_reqF$D_OUT[36:34] == 3'd3 ;
  // rule RL_wsipass_doMessagePush
  assign WILL_FIRE_RL_wsipass_doMessagePush =
	     wsiM_reqFifo_c_r != 2'd2 && wsiS_reqFifo$EMPTY_N &&
	     wci_wslv_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h0 ;
  // rule RL_wci_cfrd
  assign WILL_FIRE_RL_wci_cfrd =
	     wci_wslv_respF_c_r != 2'd2 && wci_wslv_reqF$EMPTY_N &&
	     wci_wslv_wci_cfrd_pw$whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wrtSer_begin
  assign WILL_FIRE_RL_wrtSer_begin =
	     metaWF$EMPTY_N &&
	     NOT_wrtSerPos_90_EQ_3_91_92_AND_NOT_metaWF_fir_ETC___d506 &&
	     wci_wslv_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 &&
	     wrtSerUnroll == 16'd0 ;
  // rule RL_delay_write_req
  assign WILL_FIRE_RL_delay_write_req =
	     wmemi_reqF_c_r != 2'd2 && wmemi_dhF_c_r != 2'd2 &&
	     wmemi_operateD &&
	     wmemi_peerIsReady &&
	     wide16Fa$EMPTY_N &&
	     wci_wslv_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 &&
	     dlyWordsStored_value_17_SLE_0_64_OR_bytesWritt_ETC___d572 &&
	     dlyWordsStored_value_17_SLT_8388608___d574 ;
  // rule RL_delay_read_req
  assign CAN_FIRE_RL_delay_read_req =
	     wmemi_reqF_c_r != 2'd2 && wmemi_operateD && wmemi_peerIsReady &&
	     wci_wslv_cState_6_EQ_2_7_AND_dlyCtrl_48_BITS_3_ETC___d592 &&
	     (dlyReadCredit_value ^ 8'h80) > 8'd128 &&
	     wsiM_reqFifo_c_r != 2'd2 ;
  assign WILL_FIRE_RL_delay_read_req =
	     CAN_FIRE_RL_delay_read_req && !WILL_FIRE_RL_delay_write_req ;
  // rule RL_wmwt_mesg_ingress
  assign WILL_FIRE_RL_wmwt_mesg_ingress =
	     NOT_mesgWF_rRdPtr_04_PLUS_2048_60_EQ_mesgWF_rW_ETC___d462 &&
	     wsiS_reqFifo$EMPTY_N &&
	     (!wsiS_reqFifo$D_OUT[57] || metaWF$FULL_N) &&
	     wci_wslv_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 ;
  // rule RL_rdSer_begin
  assign WILL_FIRE_RL_rdSer_begin =
	     metaRF_i_notFull__20_AND_NOT_rdSerEmpty_21_22__ETC___d631 &&
	     wci_wslv_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 &&
	     rdSerUnroll == 16'd0 &&
	     !rdSyncWord ;
  // rule RL_rdSer_body
  assign WILL_FIRE_RL_rdSer_body =
	     mesgRF_i_notFull__71_AND_NOT_rdSerEmpty_21_22__ETC___d672 &&
	     wci_wslv_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 &&
	     rdSerUnroll != 16'd0 &&
	     !rdSyncWord ;
  // rule RL_wmrd_mesgBegin
  assign WILL_FIRE_RL_wmrd_mesgBegin =
	     metaRF$EMPTY_N && wci_wslv_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 &&
	     unrollCnt == 16'd0 ;
  // rule RL_wmrd_mesgBodyResponse
  assign WILL_FIRE_RL_wmrd_mesgBodyResponse =
	     wsiM_reqFifo_c_r != 2'd2 && mesgRF$EMPTY_N &&
	     wci_wslv_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 &&
	     unrollCnt != 16'd0 ;
  // rule RL_wsiM_reqFifo_deq
  assign WILL_FIRE_RL_wsiM_reqFifo_deq =
	     wsiM_reqFifo_c_r != 2'd0 && !wsiM_sThreadBusy_d ;
  // rule RL_wsiM_reqFifo_incCtr
  assign WILL_FIRE_RL_wsiM_reqFifo_incCtr =
	     ((wsiM_reqFifo_c_r == 2'd0) ?
		wsiM_reqFifo_enqueueing$whas :
		wsiM_reqFifo_c_r != 2'd1 || wsiM_reqFifo_enqueueing$whas) &&
	     wsiM_reqFifo_enqueueing$whas &&
	     !WILL_FIRE_RL_wsiM_reqFifo_deq ;
  // rule RL_wsiM_reqFifo_decCtr
  assign WILL_FIRE_RL_wsiM_reqFifo_decCtr =
	     WILL_FIRE_RL_wsiM_reqFifo_deq && !wsiM_reqFifo_enqueueing$whas ;
  // rule RL_wsiM_reqFifo_both
  assign WILL_FIRE_RL_wsiM_reqFifo_both =
	     ((wsiM_reqFifo_c_r == 2'd1) ?
		wsiM_reqFifo_enqueueing$whas :
		wsiM_reqFifo_c_r != 2'd2 || wsiM_reqFifo_enqueueing$whas) &&
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_enqueueing$whas ;
  // rule RL_wmemi_reqF_incCtr
  assign WILL_FIRE_RL_wmemi_reqF_incCtr =
	     ((wmemi_reqF_c_r == 2'd0) ?
		wmemi_reqF_x_wire$whas :
		wmemi_reqF_c_r != 2'd1 || wmemi_reqF_x_wire$whas) &&
	     wmemi_reqF_enqueueing$whas &&
	     !wmemi_reqF_dequeueing$whas ;
  // rule RL_wmemi_reqF_decCtr
  assign WILL_FIRE_RL_wmemi_reqF_decCtr =
	     wmemi_reqF_dequeueing$whas && !wmemi_reqF_enqueueing$whas ;
  // rule RL_wmemi_reqF_both
  assign WILL_FIRE_RL_wmemi_reqF_both =
	     ((wmemi_reqF_c_r == 2'd1) ?
		wmemi_reqF_x_wire$whas :
		wmemi_reqF_c_r != 2'd2 || wmemi_reqF_x_wire$whas) &&
	     wmemi_reqF_dequeueing$whas &&
	     wmemi_reqF_enqueueing$whas ;
  // rule RL_wmemi_dhF_incCtr
  assign WILL_FIRE_RL_wmemi_dhF_incCtr =
	     ((wmemi_dhF_c_r == 2'd0) ?
		WILL_FIRE_RL_delay_write_req :
		wmemi_dhF_c_r != 2'd1 || WILL_FIRE_RL_delay_write_req) &&
	     WILL_FIRE_RL_delay_write_req &&
	     !wmemi_dhF_dequeueing$whas ;
  // rule RL_wmemi_dhF_decCtr
  assign WILL_FIRE_RL_wmemi_dhF_decCtr =
	     wmemi_dhF_dequeueing$whas && !WILL_FIRE_RL_delay_write_req ;
  // rule RL_wmemi_dhF_both
  assign WILL_FIRE_RL_wmemi_dhF_both =
	     ((wmemi_dhF_c_r == 2'd1) ?
		WILL_FIRE_RL_delay_write_req :
		wmemi_dhF_c_r != 2'd2 || WILL_FIRE_RL_delay_write_req) &&
	     wmemi_dhF_dequeueing$whas &&
	     WILL_FIRE_RL_delay_write_req ;
  // rule RL_wrtSer_body
  assign WILL_FIRE_RL_wrtSer_body =
	     NOT_mesgWF_rRdPtr_04_EQ_mesgWF_rWrPtr_95_31___d532 &&
	     IF_wrtSerPos_90_EQ_0_98_OR_wrtSerPos_90_EQ_1_9_ETC___d543 &&
	     wci_wslv_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 &&
	     wrtSerUnroll != 16'd0 ;
  // rule RL_wci_cfwr
  assign WILL_FIRE_RL_wci_cfwr =
	     wci_wslv_respF_c_r != 2'd2 && wci_wslv_reqF$EMPTY_N &&
	     wci_wslv_wci_cfwr_pw$whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_ctrl_IsO
  assign WILL_FIRE_RL_wci_ctrl_IsO =
	     wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd1 &&
	     wci_wslv_reqF$D_OUT[36:34] == 3'd1 ;
  // rule RL_wci_wslv_ctl_op_complete
  assign WILL_FIRE_RL_wci_wslv_ctl_op_complete =
	     wci_wslv_respF_c_r != 2'd2 && wci_wslv_ctlOpActive &&
	     wci_wslv_ctlAckReg ;
  // rule RL_wci_wslv_respF_incCtr
  assign WILL_FIRE_RL_wci_wslv_respF_incCtr =
	     ((wci_wslv_respF_c_r == 2'd0) ?
		wci_wslv_respF_x_wire$whas :
		wci_wslv_respF_c_r != 2'd1 || wci_wslv_respF_x_wire$whas) &&
	     wci_wslv_respF_enqueueing$whas &&
	     !(wci_wslv_respF_c_r != 2'd0) ;
  // rule RL_wci_wslv_respF_decCtr
  assign WILL_FIRE_RL_wci_wslv_respF_decCtr =
	     wci_wslv_respF_c_r != 2'd0 && !wci_wslv_respF_enqueueing$whas ;
  // rule RL_wci_wslv_respF_both
  assign WILL_FIRE_RL_wci_wslv_respF_both =
	     ((wci_wslv_respF_c_r == 2'd1) ?
		wci_wslv_respF_x_wire$whas :
		wci_wslv_respF_c_r != 2'd2 || wci_wslv_respF_x_wire$whas) &&
	     wci_wslv_respF_c_r != 2'd0 &&
	     wci_wslv_respF_enqueueing$whas ;
  // rule RL_wsiS_reqFifo_enq
  assign WILL_FIRE_RL_wsiS_reqFifo_enq =
	     wsiS_reqFifo$FULL_N && wsiS_operateD && wsiS_peerIsReady &&
	     wsiS_wsiReq$wget[60:58] == 3'd1 ;
  // rule RL_wsiS_reqFifo_reset
  assign WILL_FIRE_RL_wsiS_reqFifo_reset =
	     WILL_FIRE_RL_wsiS_reqFifo_enq || wsiS_reqFifo_r_deq$whas ;
  // inputs to muxes for submodule ports
  assign MUX_mesgRdCount$write_1__SEL_1 =
	     WILL_FIRE_RL_wmrd_mesgBodyResponse && unrollCnt == 16'd1 ;
  assign MUX_mesgWtCount$write_1__SEL_1 =
	     WILL_FIRE_RL_wmwt_mesg_ingress && wsiS_reqFifo$D_OUT[57] ;
  assign MUX_rdSerEmpty$write_1__PSEL_1 =
	     WILL_FIRE_RL_rdSer_body || WILL_FIRE_RL_rdSer_begin ;
  assign MUX_rdSerEmpty$write_1__SEL_1 =
	     MUX_rdSerEmpty$write_1__PSEL_1 &&
	     (rdSerEmpty || rdSerPos == 2'd0) ;
  assign MUX_wci_wslv_illegalEdge$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge ;
  assign MUX_wci_wslv_illegalEdge$write_1__SEL_2 =
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     (wci_wslv_reqF$D_OUT[36:34] == 3'd0 && wci_wslv_cState != 3'd0 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd1 && wci_wslv_cState != 3'd1 &&
	      wci_wslv_cState != 3'd3 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd2 && wci_wslv_cState != 3'd2 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd3 && wci_wslv_cState != 3'd3 &&
	      wci_wslv_cState != 3'd2 &&
	      wci_wslv_cState != 3'd1 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd4 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd5 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd6 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd7) ;
  assign MUX_wci_wslv_respF_q_0$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd0 ;
  assign MUX_wci_wslv_respF_q_1$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd1 ;
  assign MUX_wide16Fa$enq_1__SEL_1 =
	     WILL_FIRE_RL_wrtSer_begin &&
	     (wrtSerPos == 2'd3 || metaWF$D_OUT[23:0] == 24'd0) ;
  assign MUX_wmemi_dhF_q_0$write_1__SEL_1 =
	     WILL_FIRE_RL_wmemi_dhF_incCtr && wmemi_dhF_c_r == 2'd0 ;
  assign MUX_wmemi_dhF_q_1$write_1__SEL_1 =
	     WILL_FIRE_RL_wmemi_dhF_incCtr && wmemi_dhF_c_r == 2'd1 ;
  assign MUX_wmemi_reqF_q_0$write_1__SEL_1 =
	     WILL_FIRE_RL_wmemi_reqF_incCtr && wmemi_reqF_c_r == 2'd0 ;
  assign MUX_wmemi_reqF_q_1$write_1__SEL_1 =
	     WILL_FIRE_RL_wmemi_reqF_incCtr && wmemi_reqF_c_r == 2'd1 ;
  assign MUX_wrtSerStage$write_1__SEL_1 =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd0 ;
  assign MUX_wrtSerStage_1$write_1__SEL_1 =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd1 ;
  assign MUX_wrtSerStage_2$write_1__SEL_1 =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd2 ;
  assign MUX_wrtSerStage_3$write_1__SEL_1 =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd3 ;
  assign MUX_wsiM_reqFifo_q_0$write_1__SEL_1 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__SEL_1 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ;
  assign MUX_dlyRAG$write_1__VAL_1 = dlyRAG + 23'd1 ;
  assign MUX_dlyReadCredit_value$write_1__VAL_2 =
	     dlyReadCredit_value +
	     (WILL_FIRE_RL_delay_read_req ? 8'd255 : 8'd0) +
	     (dlyReadCredit_acc_v2$whas ? 8'd1 : 8'd0) ;
  assign MUX_dlyReadyToWrite_value$write_1__VAL_2 =
	     dlyReadyToWrite_value +
	     (dlyReadyToWrite_acc_v1$whas ? 16'd1 : 16'd0) +
	     (WILL_FIRE_RL_delay_write_req ? 16'd65535 : 16'd0) ;
  assign MUX_dlyWAG$write_1__VAL_1 = dlyWAG + 23'd1 ;
  assign MUX_dlyWordsStored_value$write_1__VAL_2 =
	     dlyWordsStored_value +
	     (WILL_FIRE_RL_delay_write_req ? 25'd1 : 25'd0) +
	     (WILL_FIRE_RL_delay_read_req ? 25'd33554431 : 25'd0) ;
  assign MUX_mesgRdCount$write_1__VAL_1 = mesgRdCount + 32'd1 ;
  assign MUX_mesgWtCount$write_1__VAL_1 = mesgWtCount + 32'd1 ;
  assign MUX_rdSerPos$write_1__VAL_1 = rdSerPos + 2'd1 ;
  assign MUX_rdSerUnroll$write_1__VAL_2 = rdSerUnroll - 16'd1 ;
  assign MUX_rdSyncWord$write_1__VAL_1 =
	     rdSerPos != 2'd3 && v__h21048[23:0] == 24'd0 ;
  assign MUX_rdSyncWord$write_1__VAL_2 =
	     rdSerPos != 2'd3 && rdSerUnroll == 16'd1 ;
  assign MUX_unrollCnt$write_1__VAL_1 =
	     (metaRF$D_OUT[23:0] == 24'd0) ? 16'd1 : metaRF$D_OUT[17:2] ;
  assign MUX_unrollCnt$write_1__VAL_2 = unrollCnt - 16'd1 ;
  assign MUX_wci_wslv_illegalEdge$write_1__VAL_2 =
	     wci_wslv_reqF$D_OUT[36:34] != 3'd4 &&
	     wci_wslv_reqF$D_OUT[36:34] != 3'd5 &&
	     wci_wslv_reqF$D_OUT[36:34] != 3'd6 ;
  assign MUX_wci_wslv_respF_c_r$write_1__VAL_1 = wci_wslv_respF_c_r + 2'd1 ;
  assign MUX_wci_wslv_respF_c_r$write_1__VAL_2 = wci_wslv_respF_c_r - 2'd1 ;
  always@(WILL_FIRE_RL_wci_wslv_ctl_op_complete or
	  MUX_wci_wslv_respF_x_wire$wset_1__VAL_1 or
	  WILL_FIRE_RL_wci_cfrd or
	  MUX_wci_wslv_respF_x_wire$wset_1__VAL_2 or WILL_FIRE_RL_wci_cfwr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wci_wslv_ctl_op_complete:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_1 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_1;
      WILL_FIRE_RL_wci_cfrd:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_1 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_2;
      WILL_FIRE_RL_wci_cfwr:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_1 = 34'h1C0DE4201;
      default: MUX_wci_wslv_respF_q_0$write_1__VAL_1 =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
	     (wci_wslv_respF_c_r == 2'd1) ?
	       MUX_wci_wslv_respF_q_0$write_1__VAL_1 :
	       wci_wslv_respF_q_1 ;
  assign MUX_wci_wslv_respF_q_1$write_1__VAL_2 =
	     (wci_wslv_respF_c_r == 2'd2) ?
	       MUX_wci_wslv_respF_q_0$write_1__VAL_1 :
	       34'h0AAAAAAAA ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__VAL_1 =
	     wci_wslv_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__VAL_2 = { 2'd1, g_data__h23399 } ;
  always@(wrtSerPos or
	  IF_wrtSerPos_90_EQ_2_00_THEN_0x0_ELSE_metaWF_f_ETC___d528 or
	  x__h19290 or x__h19317)
  begin
    case (wrtSerPos)
      2'd0: MUX_wide16Fa$enq_1__VAL_1 = x__h19290;
      2'd1: MUX_wide16Fa$enq_1__VAL_1 = x__h19317;
      default: MUX_wide16Fa$enq_1__VAL_1 =
		   IF_wrtSerPos_90_EQ_2_00_THEN_0x0_ELSE_metaWF_f_ETC___d528;
    endcase
  end
  always@(wrtSerPos or
	  IF_wrtSerPos_90_EQ_2_00_THEN_0x0_ELSE_mesgWF_w_ETC___d557 or
	  x__h19946 or x__h19970)
  begin
    case (wrtSerPos)
      2'd0: MUX_wide16Fa$enq_1__VAL_2 = x__h19946;
      2'd1: MUX_wide16Fa$enq_1__VAL_2 = x__h19970;
      default: MUX_wide16Fa$enq_1__VAL_2 =
		   IF_wrtSerPos_90_EQ_2_00_THEN_0x0_ELSE_mesgWF_w_ETC___d557;
    endcase
  end
  assign MUX_wmemi_dhF_c_r$write_1__VAL_1 = wmemi_dhF_c_r + 2'd1 ;
  assign MUX_wmemi_dhF_c_r$write_1__VAL_2 = wmemi_dhF_c_r - 2'd1 ;
  assign MUX_wmemi_dhF_q_0$write_1__VAL_1 =
	     { 2'd3, wide16Fa$D_OUT, 16'd65535 } ;
  assign MUX_wmemi_dhF_q_0$write_1__VAL_2 =
	     (wmemi_dhF_c_r == 2'd1) ?
	       MUX_wmemi_dhF_q_0$write_1__VAL_1 :
	       wmemi_dhF_q_1 ;
  assign MUX_wmemi_dhF_q_1$write_1__VAL_2 =
	     (wmemi_dhF_c_r == 2'd2) ?
	       MUX_wmemi_dhF_q_0$write_1__VAL_1 :
	       146'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ;
  assign MUX_wmemi_reqF_c_r$write_1__VAL_1 = wmemi_reqF_c_r + 2'd1 ;
  assign MUX_wmemi_reqF_c_r$write_1__VAL_2 = wmemi_reqF_c_r - 2'd1 ;
  assign MUX_wmemi_reqF_q_0$write_1__VAL_1 =
	     WILL_FIRE_RL_delay_write_req ?
	       MUX_wmemi_reqF_x_wire$wset_1__VAL_1 :
	       MUX_wmemi_reqF_x_wire$wset_1__VAL_2 ;
  assign MUX_wmemi_reqF_q_0$write_1__VAL_2 =
	     (wmemi_reqF_c_r == 2'd1) ?
	       MUX_wmemi_reqF_q_0$write_1__VAL_1 :
	       wmemi_reqF_q_1 ;
  assign MUX_wmemi_reqF_q_1$write_1__VAL_2 =
	     (wmemi_reqF_c_r == 2'd2) ?
	       MUX_wmemi_reqF_q_0$write_1__VAL_1 :
	       52'h0AAAAAAAAAAAA ;
  assign MUX_wmemi_reqF_x_wire$wset_1__VAL_1 = { 4'd3, addr__h20380, 12'd1 } ;
  assign MUX_wmemi_reqF_x_wire$wset_1__VAL_2 = { 4'd5, addr__h20732, 12'd1 } ;
  assign MUX_wrtSerPos$write_1__VAL_1 =
	     (metaWF$D_OUT[23:0] == 24'd0) ?
	       2'd0 :
	       wrtSerPos_90_PLUS_1___d908 ;
  assign MUX_wrtSerPos$write_1__VAL_2 =
	     (wrtSerUnroll == 16'd1) ? 2'd0 : wrtSerPos_90_PLUS_1___d908 ;
  assign MUX_wrtSerUnroll$write_1__VAL_2 = wrtSerUnroll - 16'd1 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_1 = wsiM_reqFifo_c_r + 2'd1 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_2 = wsiM_reqFifo_c_r - 2'd1 ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_1 =
	     WILL_FIRE_RL_wmrd_mesgBodyResponse ?
	       MUX_wsiM_reqFifo_x_wire$wset_1__VAL_1 :
	       wsiS_reqFifo$D_OUT ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_2 =
	     (wsiM_reqFifo_c_r == 2'd1) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_1 :
	       wsiM_reqFifo_q_1 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__VAL_2 =
	     (wsiM_reqFifo_c_r == 2'd2) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_1 :
	       61'h00000AAAAAAAAA00 ;
  assign MUX_wsiM_reqFifo_x_wire$wset_1__VAL_1 =
	     { 3'd1,
	       unrollCnt == 16'd1,
	       1'd1,
	       x_burstLength__h22925,
	       mesgRF$D_OUT,
	       x_byteEn__h22926,
	       readMeta[31:24] } ;
  // inlined wires
  assign wci_wslv_wciReq$wget =
	     { wciS0_MCmd,
	       wciS0_MAddrSpace,
	       wciS0_MByteEn,
	       wciS0_MAddr,
	       wciS0_MData } ;
  assign wci_wslv_wciReq$whas = 1'd1 ;
  assign wci_wslv_respF_x_wire$wget = MUX_wci_wslv_respF_q_0$write_1__VAL_1 ;
  assign wci_wslv_respF_x_wire$whas =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete || WILL_FIRE_RL_wci_cfrd ||
	     WILL_FIRE_RL_wci_cfwr ;
  assign wci_wslv_wEdge$wget = wci_wslv_reqF$D_OUT[36:34] ;
  assign wci_wslv_wEdge$whas = WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_sFlagReg_1$wget = 1'b0 ;
  assign wci_wslv_sFlagReg_1$whas = 1'b0 ;
  assign wci_wslv_ctlAckReg_1$wget = 1'd1 ;
  assign wci_wslv_ctlAckReg_1$whas =
	     WILL_FIRE_RL_wci_ctrl_OrE || WILL_FIRE_RL_wci_ctrl_IsO ||
	     WILL_FIRE_RL_wci_ctrl_EiI ;
  assign wci_wci_Es_mCmd_w$wget = wciS0_MCmd ;
  assign wci_wci_Es_mCmd_w$whas = 1'd1 ;
  assign wci_wci_Es_mAddrSpace_w$wget = wciS0_MAddrSpace ;
  assign wci_wci_Es_mAddrSpace_w$whas = 1'd1 ;
  assign wci_wci_Es_mByteEn_w$wget = wciS0_MByteEn ;
  assign wci_wci_Es_mByteEn_w$whas = 1'd1 ;
  assign wci_wci_Es_mAddr_w$wget = wciS0_MAddr ;
  assign wci_wci_Es_mAddr_w$whas = 1'd1 ;
  assign wci_wci_Es_mData_w$wget = wciS0_MData ;
  assign wci_wci_Es_mData_w$whas = 1'd1 ;
  assign wsiS_wsiReq$wget =
	     { wsiS0_MCmd,
	       wsiS0_MReqLast,
	       wsiS0_MBurstPrecise,
	       wsiS0_MBurstLength,
	       wsiS0_MData,
	       wsiS0_MByteEn,
	       wsiS0_MReqInfo } ;
  assign wsiS_wsiReq$whas = 1'd1 ;
  assign wsiS_operateD_1$wget = 1'd1 ;
  assign wsiS_operateD_1$whas = wci_wslv_cState == 3'd2 ;
  assign wsiS_peerIsReady_1$wget = 1'd1 ;
  assign wsiS_peerIsReady_1$whas = wsiS0_MReset_n ;
  assign wsiS_sThreadBusy_dw$wget = wsiS_reqFifo_countReg > 2'd1 ;
  assign wsiS_sThreadBusy_dw$whas =
	     wsiS_reqFifo_levelsValid && wsiS_operateD && wsiS_peerIsReady ;
  assign wsiM_reqFifo_x_wire$wget = MUX_wsiM_reqFifo_q_0$write_1__VAL_1 ;
  assign wsiM_reqFifo_x_wire$whas = wsiM_reqFifo_enqueueing$whas ;
  assign wsiM_operateD_1$wget = 1'd1 ;
  assign wsiM_operateD_1$whas = wci_wslv_cState == 3'd2 ;
  assign wsiM_peerIsReady_1$wget = 1'd1 ;
  assign wsiM_peerIsReady_1$whas = wsiM0_SReset_n ;
  assign wmemi_reqF_x_wire$wget = MUX_wmemi_reqF_q_0$write_1__VAL_1 ;
  assign wmemi_reqF_x_wire$whas =
	     WILL_FIRE_RL_delay_write_req || WILL_FIRE_RL_delay_read_req ;
  assign wmemi_dhF_x_wire$wget = MUX_wmemi_dhF_q_0$write_1__VAL_1 ;
  assign wmemi_dhF_x_wire$whas = WILL_FIRE_RL_delay_write_req ;
  assign wmemi_wmemiResponse$wget =
	     { wmemiM0_SResp, wmemiM0_SRespLast, wmemiM0_SData } ;
  assign wmemi_wmemiResponse$whas = 1'd1 ;
  assign wmemi_sCmdAccept_w$wget = 1'd1 ;
  assign wmemi_sCmdAccept_w$whas = wmemiM0_SCmdAccept ;
  assign wmemi_sDataAccept_w$wget = 1'd1 ;
  assign wmemi_sDataAccept_w$whas = wmemiM0_SDataAccept ;
  assign wmemi_operateD_1$wget = 1'd1 ;
  assign wmemi_operateD_1$whas = wci_wslv_cState == 3'd2 ;
  assign wmemi_peerIsReady_1$wget = 1'b0 ;
  assign wmemi_peerIsReady_1$whas = 1'b0 ;
  assign mesgWF_wDataIn$wget = wsiS_reqFifo$D_OUT[43:12] ;
  assign mesgWF_wDataIn$whas = WILL_FIRE_RL_wmwt_mesg_ingress ;
  assign mesgWF_wDataOut$wget = data__h19661 ;
  assign mesgWF_wDataOut$whas = 1'd1 ;
  assign dlyWordsStored_acc_v1$wget = 25'd1 ;
  assign dlyWordsStored_acc_v1$whas = WILL_FIRE_RL_delay_write_req ;
  assign dlyWordsStored_acc_v2$wget = 25'd33554431 ;
  assign dlyWordsStored_acc_v2$whas = WILL_FIRE_RL_delay_read_req ;
  assign dlyReadCredit_acc_v1$wget = 8'd255 ;
  assign dlyReadCredit_acc_v1$whas = WILL_FIRE_RL_delay_read_req ;
  assign dlyReadCredit_acc_v2$wget = 8'd1 ;
  assign dlyReadCredit_acc_v2$whas =
	     wide16Fc$FULL_N && wide16Fb$EMPTY_N && wci_wslv_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 ;
  assign dlyReadyToWrite_acc_v1$wget = 16'd1 ;
  assign dlyReadyToWrite_acc_v1$whas =
	     WILL_FIRE_RL_wrtSer_body || WILL_FIRE_RL_wrtSer_begin ;
  assign dlyReadyToWrite_acc_v2$wget = 16'd65535 ;
  assign dlyReadyToWrite_acc_v2$whas = WILL_FIRE_RL_delay_write_req ;
  assign wsi_Es_mCmd_w$wget = wsiS0_MCmd ;
  assign wsi_Es_mCmd_w$whas = 1'd1 ;
  assign wsi_Es_mBurstLength_w$wget = wsiS0_MBurstLength ;
  assign wsi_Es_mBurstLength_w$whas = 1'd1 ;
  assign wsi_Es_mData_w$wget = wsiS0_MData ;
  assign wsi_Es_mData_w$whas = 1'd1 ;
  assign wsi_Es_mByteEn_w$wget = wsiS0_MByteEn ;
  assign wsi_Es_mByteEn_w$whas = 1'd1 ;
  assign wsi_Es_mReqInfo_w$wget = wsiS0_MReqInfo ;
  assign wsi_Es_mReqInfo_w$whas = 1'd1 ;
  assign wmemi_Em_sResp_w$wget = wmemiM0_SResp ;
  assign wmemi_Em_sResp_w$whas = 1'd1 ;
  assign wmemi_Em_sData_w$wget = wmemiM0_SData ;
  assign wmemi_Em_sData_w$whas = 1'd1 ;
  assign wci_wslv_reqF_r_enq$whas = wci_wslv_wciReq$wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF_r_deq$whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_reqF_r_clr$whas = 1'b0 ;
  assign wci_wslv_respF_enqueueing$whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  assign wci_wslv_respF_dequeueing$whas = wci_wslv_respF_c_r != 2'd0 ;
  assign wci_wslv_sThreadBusy_pw$whas = 1'b0 ;
  assign wci_wslv_wci_cfwr_pw$whas =
	     wci_wslv_reqF$EMPTY_N && wci_wslv_reqF$D_OUT[68] &&
	     wci_wslv_reqF$D_OUT[71:69] == 3'd1 ;
  assign wci_wslv_wci_cfrd_pw$whas =
	     wci_wslv_reqF$EMPTY_N && wci_wslv_reqF$D_OUT[68] &&
	     wci_wslv_reqF$D_OUT[71:69] == 3'd2 ;
  assign wci_wslv_wci_ctrl_pw$whas =
	     wci_wslv_reqF$EMPTY_N && !wci_wslv_reqF$D_OUT[68] &&
	     wci_wslv_reqF$D_OUT[71:69] == 3'd2 ;
  assign wsiS_reqFifo_r_enq$whas = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_r_deq$whas =
	     WILL_FIRE_RL_wmwt_mesg_ingress ||
	     WILL_FIRE_RL_wsipass_doMessagePush ;
  assign wsiS_reqFifo_r_clr$whas = 1'b0 ;
  assign wsiS_reqFifo_doResetEnq$whas = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_doResetDeq$whas = wsiS_reqFifo_r_deq$whas ;
  assign wsiS_reqFifo_doResetClr$whas = 1'b0 ;
  assign wsiM_reqFifo_enqueueing$whas =
	     WILL_FIRE_RL_wmrd_mesgBodyResponse ||
	     WILL_FIRE_RL_wsipass_doMessagePush ;
  assign wsiM_reqFifo_dequeueing$whas = WILL_FIRE_RL_wsiM_reqFifo_deq ;
  assign wsiM_sThreadBusy_pw$whas = wsiM0_SThreadBusy ;
  assign wmemi_reqF_enqueueing$whas =
	     WILL_FIRE_RL_delay_read_req || WILL_FIRE_RL_delay_write_req ;
  assign wmemi_reqF_dequeueing$whas =
	     wmemiM0_SCmdAccept && wmemi_reqF_c_r != 2'd0 ;
  assign wmemi_dhF_enqueueing$whas = WILL_FIRE_RL_delay_write_req ;
  assign wmemi_dhF_dequeueing$whas =
	     wmemiM0_SDataAccept && wmemi_dhF_c_r != 2'd0 ;
  assign mesgWF_pwDequeue$whas = WILL_FIRE_RL_wrtSer_body ;
  assign mesgWF_pwEnqueue$whas = WILL_FIRE_RL_wmwt_mesg_ingress ;
  assign wsi_Es_mReqLast_w$whas = wsiS0_MReqLast ;
  assign wsi_Es_mBurstPrecise_w$whas = wsiS0_MBurstPrecise ;
  assign wsi_Es_mDataInfo_w$whas = 1'd1 ;
  assign wmemi_Em_sRespLast_w$whas = wmemiM0_SRespLast ;
  assign wsiS_extStatusW$wget =
	     { wsiS_pMesgCount, wsiS_iMesgCount, wsiS_tBusyCount } ;
  assign wsiM_extStatusW$wget =
	     { wsiM_pMesgCount, wsiM_iMesgCount, wsiM_tBusyCount } ;
  // register bytesRead
  assign bytesRead$D_IN = bytesRead + 32'd4 ;
  assign bytesRead$EN =
	     MUX_rdSerEmpty$write_1__PSEL_1 && bytesRead != 32'hFFFFFFFF ;
  // register bytesThisMessage
  assign bytesThisMessage$D_IN = btm__h18537 ;
  assign bytesThisMessage$EN = MUX_mesgWtCount$write_1__SEL_1 ;
  // register bytesWritten
  assign bytesWritten$D_IN = bytesWritten + 32'd4 ;
  assign bytesWritten$EN =
	     WILL_FIRE_RL_wmwt_mesg_ingress && bytesWritten < 32'hFFFFFFFB ;
  // register cyclesPassed
  assign cyclesPassed$D_IN = cyclesPassed + 32'd1 ;
  assign cyclesPassed$EN = wsiS_statusR[0] && cyclesPassed != 32'hFFFFFFFF ;
  // register dlyCtrl
  assign dlyCtrl$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign dlyCtrl$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF$D_OUT[63:32] == 32'h0 ;
  // register dlyHoldoffBytes
  assign dlyHoldoffBytes$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign dlyHoldoffBytes$EN =
	     WILL_FIRE_RL_wci_cfwr &&
	     wci_wslv_reqF$D_OUT[63:32] == 32'h00000004 ;
  // register dlyHoldoffCycles
  assign dlyHoldoffCycles$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign dlyHoldoffCycles$EN =
	     WILL_FIRE_RL_wci_cfwr &&
	     wci_wslv_reqF$D_OUT[63:32] == 32'h00000008 ;
  // register dlyRAG
  assign dlyRAG$D_IN =
	     WILL_FIRE_RL_delay_read_req ? MUX_dlyRAG$write_1__VAL_1 : 23'd0 ;
  assign dlyRAG$EN =
	     WILL_FIRE_RL_delay_read_req || WILL_FIRE_RL_wci_ctrl_IsO ;
  // register dlyRdOpOther
  assign dlyRdOpOther$D_IN = dlyRdOpOther + 32'd1 ;
  assign dlyRdOpOther$EN =
	     WILL_FIRE_RL_rdSer_begin && v__h21048[31:24] != 8'd0 ;
  // register dlyRdOpZero
  assign dlyRdOpZero$D_IN = dlyRdOpZero + 32'd1 ;
  assign dlyRdOpZero$EN =
	     WILL_FIRE_RL_rdSer_begin && v__h21048[31:24] == 8'd0 ;
  // register dlyReadCredit_value
  assign dlyReadCredit_value$D_IN =
	     WILL_FIRE_RL_wci_ctrl_IsO ?
	       8'd12 :
	       MUX_dlyReadCredit_value$write_1__VAL_2 ;
  assign dlyReadCredit_value$EN = 1'b1 ;
  // register dlyReadyToWrite_value
  assign dlyReadyToWrite_value$D_IN =
	     WILL_FIRE_RL_wci_ctrl_IsO ?
	       16'd0 :
	       MUX_dlyReadyToWrite_value$write_1__VAL_2 ;
  assign dlyReadyToWrite_value$EN = 1'b1 ;
  // register dlyWAG
  assign dlyWAG$D_IN =
	     WILL_FIRE_RL_delay_write_req ?
	       MUX_dlyWAG$write_1__VAL_1 :
	       23'd0 ;
  assign dlyWAG$EN =
	     WILL_FIRE_RL_delay_write_req || WILL_FIRE_RL_wci_ctrl_IsO ;
  // register dlyWordsStored_value
  assign dlyWordsStored_value$D_IN =
	     WILL_FIRE_RL_wci_ctrl_IsO ?
	       25'd0 :
	       MUX_dlyWordsStored_value$write_1__VAL_2 ;
  assign dlyWordsStored_value$EN = 1'b1 ;
  // register mesgLengthSoFar
  assign mesgLengthSoFar$D_IN =
	     wsiS_reqFifo$D_OUT[57] ?
	       14'd0 :
	       mesgLengthSoFar_73_PLUS_1___d909 ;
  assign mesgLengthSoFar$EN = WILL_FIRE_RL_wmwt_mesg_ingress ;
  // register mesgRdCount
  assign mesgRdCount$D_IN =
	     MUX_mesgRdCount$write_1__SEL_1 ?
	       MUX_mesgRdCount$write_1__VAL_1 :
	       32'd0 ;
  assign mesgRdCount$EN =
	     WILL_FIRE_RL_wmrd_mesgBodyResponse && unrollCnt == 16'd1 ||
	     WILL_FIRE_RL_wci_ctrl_IsO ;
  // register mesgWF_rCache
  assign mesgWF_rCache$D_IN = { 1'd1, mesgWF_rWrPtr, x__h16006 } ;
  assign mesgWF_rCache$EN = WILL_FIRE_RL_wmwt_mesg_ingress ;
  // register mesgWF_rRdPtr
  assign mesgWF_rRdPtr$D_IN = x__h16107 ;
  assign mesgWF_rRdPtr$EN = WILL_FIRE_RL_wrtSer_body ;
  // register mesgWF_rWrPtr
  assign mesgWF_rWrPtr$D_IN = mesgWF_rWrPtr + 13'd1 ;
  assign mesgWF_rWrPtr$EN = WILL_FIRE_RL_wmwt_mesg_ingress ;
  // register mesgWtCount
  assign mesgWtCount$D_IN =
	     MUX_mesgWtCount$write_1__SEL_1 ?
	       MUX_mesgWtCount$write_1__VAL_1 :
	       32'd0 ;
  assign mesgWtCount$EN =
	     WILL_FIRE_RL_wmwt_mesg_ingress && wsiS_reqFifo$D_OUT[57] ||
	     WILL_FIRE_RL_wci_ctrl_IsO ;
  // register rdSerAddr
  assign rdSerAddr$D_IN = 32'h0 ;
  assign rdSerAddr$EN = 1'b0 ;
  // register rdSerEmpty
  assign rdSerEmpty$D_IN = !MUX_rdSerEmpty$write_1__SEL_1 ;
  assign rdSerEmpty$EN =
	     (WILL_FIRE_RL_rdSer_body || WILL_FIRE_RL_rdSer_begin) &&
	     (rdSerEmpty || rdSerPos == 2'd0) ||
	     WILL_FIRE_RL_rdSer_sync ;
  // register rdSerMeta
  assign rdSerMeta$D_IN = v__h21048 ;
  assign rdSerMeta$EN = WILL_FIRE_RL_rdSer_begin ;
  // register rdSerPos
  assign rdSerPos$D_IN =
	     MUX_rdSerEmpty$write_1__PSEL_1 ?
	       MUX_rdSerPos$write_1__VAL_1 :
	       2'd0 ;
  assign rdSerPos$EN =
	     WILL_FIRE_RL_rdSer_body || WILL_FIRE_RL_rdSer_begin ||
	     WILL_FIRE_RL_rdSer_sync ;
  // register rdSerStage
  assign rdSerStage$D_IN = wide16Fc$D_OUT[31:0] ;
  assign rdSerStage$EN =
	     MUX_rdSerEmpty$write_1__PSEL_1 &&
	     (rdSerEmpty || rdSerPos == 2'd0) ;
  // register rdSerStage_1
  assign rdSerStage_1$D_IN = wide16Fc$D_OUT[63:32] ;
  assign rdSerStage_1$EN =
	     MUX_rdSerEmpty$write_1__PSEL_1 &&
	     (rdSerEmpty || rdSerPos == 2'd0) ;
  // register rdSerStage_2
  assign rdSerStage_2$D_IN = wide16Fc$D_OUT[95:64] ;
  assign rdSerStage_2$EN =
	     MUX_rdSerEmpty$write_1__PSEL_1 &&
	     (rdSerEmpty || rdSerPos == 2'd0) ;
  // register rdSerStage_3
  assign rdSerStage_3$D_IN = wide16Fc$D_OUT[127:96] ;
  assign rdSerStage_3$EN =
	     MUX_rdSerEmpty$write_1__PSEL_1 &&
	     (rdSerEmpty || rdSerPos == 2'd0) ;
  // register rdSerUnroll
  assign rdSerUnroll$D_IN =
	     WILL_FIRE_RL_rdSer_begin ?
	       v__h21048[17:2] :
	       MUX_rdSerUnroll$write_1__VAL_2 ;
  assign rdSerUnroll$EN =
	     WILL_FIRE_RL_rdSer_begin || WILL_FIRE_RL_rdSer_body ;
  // register rdSyncWord
  always@(WILL_FIRE_RL_rdSer_begin or
	  MUX_rdSyncWord$write_1__VAL_1 or
	  WILL_FIRE_RL_rdSer_body or
	  MUX_rdSyncWord$write_1__VAL_2 or WILL_FIRE_RL_rdSer_sync)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_rdSer_begin:
	  rdSyncWord$D_IN = MUX_rdSyncWord$write_1__VAL_1;
      WILL_FIRE_RL_rdSer_body:
	  rdSyncWord$D_IN = MUX_rdSyncWord$write_1__VAL_2;
      WILL_FIRE_RL_rdSer_sync: rdSyncWord$D_IN = 1'd0;
      default: rdSyncWord$D_IN = 1'b0 /* unspecified value */ ;
    endcase
  end
  assign rdSyncWord$EN =
	     WILL_FIRE_RL_rdSer_begin || WILL_FIRE_RL_rdSer_body ||
	     WILL_FIRE_RL_rdSer_sync ;
  // register readMeta
  assign readMeta$D_IN = metaRF$D_OUT ;
  assign readMeta$EN = WILL_FIRE_RL_wmrd_mesgBegin ;
  // register tog50
  assign tog50$D_IN = !tog50 ;
  assign tog50$EN = wci_wslv_cState == 3'd2 ;
  // register unrollCnt
  assign unrollCnt$D_IN =
	     WILL_FIRE_RL_wmrd_mesgBegin ?
	       MUX_unrollCnt$write_1__VAL_1 :
	       MUX_unrollCnt$write_1__VAL_2 ;
  assign unrollCnt$EN =
	     WILL_FIRE_RL_wmrd_mesgBegin ||
	     WILL_FIRE_RL_wmrd_mesgBodyResponse ;
  // register wci_wslv_cEdge
  assign wci_wslv_cEdge$D_IN = wci_wslv_reqF$D_OUT[36:34] ;
  assign wci_wslv_cEdge$EN = WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  // register wci_wslv_cState
  assign wci_wslv_cState$D_IN = wci_wslv_nState ;
  assign wci_wslv_cState$EN =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge ;
  // register wci_wslv_ctlAckReg
  assign wci_wslv_ctlAckReg$D_IN = wci_wslv_ctlAckReg_1$whas ;
  assign wci_wslv_ctlAckReg$EN = 1'd1 ;
  // register wci_wslv_ctlOpActive
  assign wci_wslv_ctlOpActive$D_IN = !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  assign wci_wslv_ctlOpActive$EN =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  // register wci_wslv_illegalEdge
  assign wci_wslv_illegalEdge$D_IN =
	     !MUX_wci_wslv_illegalEdge$write_1__SEL_1 &&
	     MUX_wci_wslv_illegalEdge$write_1__VAL_2 ;
  assign wci_wslv_illegalEdge$EN =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge ||
	     MUX_wci_wslv_illegalEdge$write_1__SEL_2 ;
  // register wci_wslv_isReset_isInReset
  assign wci_wslv_isReset_isInReset$D_IN = 1'd0 ;
  assign wci_wslv_isReset_isInReset$EN = wci_wslv_isReset_isInReset ;
  // register wci_wslv_nState
  always@(wci_wslv_reqF$D_OUT)
  begin
    case (wci_wslv_reqF$D_OUT[36:34])
      3'd0: wci_wslv_nState$D_IN = 3'd1;
      3'd1: wci_wslv_nState$D_IN = 3'd2;
      3'd2: wci_wslv_nState$D_IN = 3'd3;
      default: wci_wslv_nState$D_IN = 3'd0;
    endcase
  end
  assign wci_wslv_nState$EN =
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     (wci_wslv_reqF$D_OUT[36:34] == 3'd0 && wci_wslv_cState == 3'd0 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd1 &&
	      (wci_wslv_cState == 3'd1 || wci_wslv_cState == 3'd3) ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd2 && wci_wslv_cState == 3'd2 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd3 &&
	      (wci_wslv_cState == 3'd3 || wci_wslv_cState == 3'd2 ||
	       wci_wslv_cState == 3'd1)) ;
  // register wci_wslv_reqF_countReg
  assign wci_wslv_reqF_countReg$D_IN =
	     (wci_wslv_wciReq$wget[71:69] != 3'd0) ?
	       wci_wslv_reqF_countReg + 2'd1 :
	       wci_wslv_reqF_countReg - 2'd1 ;
  assign wci_wslv_reqF_countReg$EN =
	     (wci_wslv_wciReq$wget[71:69] != 3'd0) !=
	     wci_wslv_reqF_r_deq$whas ;
  // register wci_wslv_respF_c_r
  assign wci_wslv_respF_c_r$D_IN =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr ?
	       MUX_wci_wslv_respF_c_r$write_1__VAL_1 :
	       MUX_wci_wslv_respF_c_r$write_1__VAL_2 ;
  assign wci_wslv_respF_c_r$EN =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr ||
	     WILL_FIRE_RL_wci_wslv_respF_decCtr ;
  // register wci_wslv_respF_q_0
  always@(MUX_wci_wslv_respF_q_0$write_1__SEL_1 or
	  MUX_wci_wslv_respF_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wci_wslv_respF_both or
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wci_wslv_respF_decCtr or wci_wslv_respF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_wslv_respF_q_0$write_1__SEL_1:
	  wci_wslv_respF_q_0$D_IN = MUX_wci_wslv_respF_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wci_wslv_respF_both:
	  wci_wslv_respF_q_0$D_IN = MUX_wci_wslv_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wci_wslv_respF_decCtr:
	  wci_wslv_respF_q_0$D_IN = wci_wslv_respF_q_1;
      default: wci_wslv_respF_q_0$D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_wslv_respF_q_0$EN =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wci_wslv_respF_both ||
	     WILL_FIRE_RL_wci_wslv_respF_decCtr ;
  // register wci_wslv_respF_q_1
  always@(MUX_wci_wslv_respF_q_1$write_1__SEL_1 or
	  MUX_wci_wslv_respF_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wci_wslv_respF_both or
	  MUX_wci_wslv_respF_q_1$write_1__VAL_2 or
	  WILL_FIRE_RL_wci_wslv_respF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_wslv_respF_q_1$write_1__SEL_1:
	  wci_wslv_respF_q_1$D_IN = MUX_wci_wslv_respF_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wci_wslv_respF_both:
	  wci_wslv_respF_q_1$D_IN = MUX_wci_wslv_respF_q_1$write_1__VAL_2;
      WILL_FIRE_RL_wci_wslv_respF_decCtr:
	  wci_wslv_respF_q_1$D_IN = 34'h0AAAAAAAA;
      default: wci_wslv_respF_q_1$D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_wslv_respF_q_1$EN =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wci_wslv_respF_both ||
	     WILL_FIRE_RL_wci_wslv_respF_decCtr ;
  // register wci_wslv_sFlagReg
  assign wci_wslv_sFlagReg$D_IN = 1'b0 ;
  assign wci_wslv_sFlagReg$EN = 1'd1 ;
  // register wci_wslv_sThreadBusy_d
  assign wci_wslv_sThreadBusy_d$D_IN = 1'b0 ;
  assign wci_wslv_sThreadBusy_d$EN = 1'd1 ;
  // register wmemiRdReq
  assign wmemiRdReq$D_IN = wmemiRdReq + 32'd1 ;
  assign wmemiRdReq$EN = WILL_FIRE_RL_delay_read_req ;
  // register wmemiRdResp1
  assign wmemiRdResp1$D_IN = wmemiRdResp1 + 32'd1 ;
  assign wmemiRdResp1$EN =
	     wmemi_respF$EMPTY_N && wide16Fb$FULL_N &&
	     wci_wslv_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 ;
  // register wmemiRdResp2
  assign wmemiRdResp2$D_IN = wmemiRdResp2 + 32'd1 ;
  assign wmemiRdResp2$EN = dlyReadCredit_acc_v2$whas ;
  // register wmemiWrReq
  assign wmemiWrReq$D_IN = wmemiWrReq + 32'd1 ;
  assign wmemiWrReq$EN = WILL_FIRE_RL_delay_write_req ;
  // register wmemi_busyWithMessage
  assign wmemi_busyWithMessage$D_IN = 1'b0 ;
  assign wmemi_busyWithMessage$EN = 1'b0 ;
  // register wmemi_dhF_c_r
  assign wmemi_dhF_c_r$D_IN =
	     WILL_FIRE_RL_wmemi_dhF_incCtr ?
	       MUX_wmemi_dhF_c_r$write_1__VAL_1 :
	       MUX_wmemi_dhF_c_r$write_1__VAL_2 ;
  assign wmemi_dhF_c_r$EN =
	     WILL_FIRE_RL_wmemi_dhF_incCtr || WILL_FIRE_RL_wmemi_dhF_decCtr ;
  // register wmemi_dhF_q_0
  always@(MUX_wmemi_dhF_q_0$write_1__SEL_1 or
	  MUX_wmemi_dhF_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wmemi_dhF_both or
	  MUX_wmemi_dhF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wmemi_dhF_decCtr or wmemi_dhF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmemi_dhF_q_0$write_1__SEL_1:
	  wmemi_dhF_q_0$D_IN = MUX_wmemi_dhF_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wmemi_dhF_both:
	  wmemi_dhF_q_0$D_IN = MUX_wmemi_dhF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wmemi_dhF_decCtr: wmemi_dhF_q_0$D_IN = wmemi_dhF_q_1;
      default: wmemi_dhF_q_0$D_IN =
		   146'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmemi_dhF_q_0$EN =
	     WILL_FIRE_RL_wmemi_dhF_incCtr && wmemi_dhF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wmemi_dhF_both ||
	     WILL_FIRE_RL_wmemi_dhF_decCtr ;
  // register wmemi_dhF_q_1
  always@(MUX_wmemi_dhF_q_1$write_1__SEL_1 or
	  MUX_wmemi_dhF_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wmemi_dhF_both or
	  MUX_wmemi_dhF_q_1$write_1__VAL_2 or WILL_FIRE_RL_wmemi_dhF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmemi_dhF_q_1$write_1__SEL_1:
	  wmemi_dhF_q_1$D_IN = MUX_wmemi_dhF_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wmemi_dhF_both:
	  wmemi_dhF_q_1$D_IN = MUX_wmemi_dhF_q_1$write_1__VAL_2;
      WILL_FIRE_RL_wmemi_dhF_decCtr:
	  wmemi_dhF_q_1$D_IN = 146'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
      default: wmemi_dhF_q_1$D_IN =
		   146'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmemi_dhF_q_1$EN =
	     WILL_FIRE_RL_wmemi_dhF_incCtr && wmemi_dhF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wmemi_dhF_both ||
	     WILL_FIRE_RL_wmemi_dhF_decCtr ;
  // register wmemi_errorSticky
  assign wmemi_errorSticky$D_IN = 1'b0 ;
  assign wmemi_errorSticky$EN = 1'b0 ;
  // register wmemi_isReset_isInReset
  assign wmemi_isReset_isInReset$D_IN = 1'd0 ;
  assign wmemi_isReset_isInReset$EN = wmemi_isReset_isInReset ;
  // register wmemi_operateD
  assign wmemi_operateD$D_IN = wci_wslv_cState == 3'd2 ;
  assign wmemi_operateD$EN = 1'd1 ;
  // register wmemi_peerIsReady
  assign wmemi_peerIsReady$D_IN = 1'b1 ;
  assign wmemi_peerIsReady$EN = 1'd1 ;
  // register wmemi_reqF_c_r
  assign wmemi_reqF_c_r$D_IN =
	     WILL_FIRE_RL_wmemi_reqF_incCtr ?
	       MUX_wmemi_reqF_c_r$write_1__VAL_1 :
	       MUX_wmemi_reqF_c_r$write_1__VAL_2 ;
  assign wmemi_reqF_c_r$EN =
	     WILL_FIRE_RL_wmemi_reqF_incCtr ||
	     WILL_FIRE_RL_wmemi_reqF_decCtr ;
  // register wmemi_reqF_q_0
  always@(MUX_wmemi_reqF_q_0$write_1__SEL_1 or
	  MUX_wmemi_reqF_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wmemi_reqF_both or
	  MUX_wmemi_reqF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wmemi_reqF_decCtr or wmemi_reqF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmemi_reqF_q_0$write_1__SEL_1:
	  wmemi_reqF_q_0$D_IN = MUX_wmemi_reqF_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wmemi_reqF_both:
	  wmemi_reqF_q_0$D_IN = MUX_wmemi_reqF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wmemi_reqF_decCtr: wmemi_reqF_q_0$D_IN = wmemi_reqF_q_1;
      default: wmemi_reqF_q_0$D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmemi_reqF_q_0$EN =
	     WILL_FIRE_RL_wmemi_reqF_incCtr && wmemi_reqF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wmemi_reqF_both ||
	     WILL_FIRE_RL_wmemi_reqF_decCtr ;
  // register wmemi_reqF_q_1
  always@(MUX_wmemi_reqF_q_1$write_1__SEL_1 or
	  MUX_wmemi_reqF_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wmemi_reqF_both or
	  MUX_wmemi_reqF_q_1$write_1__VAL_2 or WILL_FIRE_RL_wmemi_reqF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmemi_reqF_q_1$write_1__SEL_1:
	  wmemi_reqF_q_1$D_IN = MUX_wmemi_reqF_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wmemi_reqF_both:
	  wmemi_reqF_q_1$D_IN = MUX_wmemi_reqF_q_1$write_1__VAL_2;
      WILL_FIRE_RL_wmemi_reqF_decCtr: wmemi_reqF_q_1$D_IN = 52'h0AAAAAAAAAAAA;
      default: wmemi_reqF_q_1$D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmemi_reqF_q_1$EN =
	     WILL_FIRE_RL_wmemi_reqF_incCtr && wmemi_reqF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wmemi_reqF_both ||
	     WILL_FIRE_RL_wmemi_reqF_decCtr ;
  // register wmemi_statusR
  assign wmemi_statusR$D_IN =
	     { wmemi_isReset_isInReset,
	       !wmemi_peerIsReady,
	       !wmemi_operateD,
	       wmemi_errorSticky,
	       3'd0,
	       wmemi_trafficSticky } ;
  assign wmemi_statusR$EN = 1'd1 ;
  // register wmemi_trafficSticky
  assign wmemi_trafficSticky$D_IN = 1'd1 ;
  assign wmemi_trafficSticky$EN = wmemiM0_SCmdAccept ;
  // register wrtSerAddr
  assign wrtSerAddr$D_IN = 32'h0 ;
  assign wrtSerAddr$EN = 1'b0 ;
  // register wrtSerPos
  assign wrtSerPos$D_IN =
	     WILL_FIRE_RL_wrtSer_begin ?
	       MUX_wrtSerPos$write_1__VAL_1 :
	       MUX_wrtSerPos$write_1__VAL_2 ;
  assign wrtSerPos$EN =
	     WILL_FIRE_RL_wrtSer_begin || WILL_FIRE_RL_wrtSer_body ;
  // register wrtSerStage
  assign wrtSerStage$D_IN =
	     MUX_wrtSerStage$write_1__SEL_1 ? data__h19661 : metaWF$D_OUT ;
  assign wrtSerStage$EN =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd0 ||
	     WILL_FIRE_RL_wrtSer_begin && wrtSerPos == 2'd0 ;
  // register wrtSerStage_1
  assign wrtSerStage_1$D_IN =
	     MUX_wrtSerStage_1$write_1__SEL_1 ? data__h19661 : metaWF$D_OUT ;
  assign wrtSerStage_1$EN =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd1 ||
	     WILL_FIRE_RL_wrtSer_begin && wrtSerPos == 2'd1 ;
  // register wrtSerStage_2
  assign wrtSerStage_2$D_IN =
	     MUX_wrtSerStage_2$write_1__SEL_1 ? data__h19661 : metaWF$D_OUT ;
  assign wrtSerStage_2$EN =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd2 ||
	     WILL_FIRE_RL_wrtSer_begin && wrtSerPos == 2'd2 ;
  // register wrtSerStage_3
  assign wrtSerStage_3$D_IN =
	     MUX_wrtSerStage_3$write_1__SEL_1 ? data__h19661 : metaWF$D_OUT ;
  assign wrtSerStage_3$EN =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd3 ||
	     WILL_FIRE_RL_wrtSer_begin && wrtSerPos == 2'd3 ;
  // register wrtSerUnroll
  assign wrtSerUnroll$D_IN =
	     WILL_FIRE_RL_wrtSer_begin ?
	       metaWF$D_OUT[17:2] :
	       MUX_wrtSerUnroll$write_1__VAL_2 ;
  assign wrtSerUnroll$EN =
	     WILL_FIRE_RL_wrtSer_begin || WILL_FIRE_RL_wrtSer_body ;
  // register wsiM_burstKind
  assign wsiM_burstKind$D_IN =
	     (wsiM_burstKind == 2'd0) ?
	       (wsiM_reqFifo_q_0[56] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsiM_burstKind$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[60:58] == 3'd1 &&
	     (wsiM_burstKind == 2'd0 ||
	      (wsiM_burstKind == 2'd1 || wsiM_burstKind == 2'd2) &&
	      wsiM_reqFifo_q_0[57]) ;
  // register wsiM_errorSticky
  assign wsiM_errorSticky$D_IN = 1'b0 ;
  assign wsiM_errorSticky$EN = 1'b0 ;
  // register wsiM_iMesgCount
  assign wsiM_iMesgCount$D_IN = wsiM_iMesgCount + 32'd1 ;
  assign wsiM_iMesgCount$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[60:58] == 3'd1 &&
	     wsiM_burstKind == 2'd2 &&
	     wsiM_reqFifo_q_0[57] ;
  // register wsiM_isReset_isInReset
  assign wsiM_isReset_isInReset$D_IN = 1'd0 ;
  assign wsiM_isReset_isInReset$EN = wsiM_isReset_isInReset ;
  // register wsiM_operateD
  assign wsiM_operateD$D_IN = wci_wslv_cState == 3'd2 ;
  assign wsiM_operateD$EN = 1'd1 ;
  // register wsiM_pMesgCount
  assign wsiM_pMesgCount$D_IN = wsiM_pMesgCount + 32'd1 ;
  assign wsiM_pMesgCount$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[60:58] == 3'd1 &&
	     wsiM_burstKind == 2'd1 &&
	     wsiM_reqFifo_q_0[57] ;
  // register wsiM_peerIsReady
  assign wsiM_peerIsReady$D_IN = wsiM0_SReset_n ;
  assign wsiM_peerIsReady$EN = 1'd1 ;
  // register wsiM_reqFifo_c_r
  assign wsiM_reqFifo_c_r$D_IN =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr ?
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_1 :
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_2 ;
  assign wsiM_reqFifo_c_r$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;
  // register wsiM_reqFifo_q_0
  always@(MUX_wsiM_reqFifo_q_0$write_1__SEL_1 or
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wsiM_reqFifo_both or
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wsiM_reqFifo_decCtr or wsiM_reqFifo_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wsiM_reqFifo_q_0$write_1__SEL_1:
	  wsiM_reqFifo_q_0$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wsiM_reqFifo_both:
	  wsiM_reqFifo_q_0$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wsiM_reqFifo_decCtr:
	  wsiM_reqFifo_q_0$D_IN = wsiM_reqFifo_q_1;
      default: wsiM_reqFifo_q_0$D_IN =
		   61'h0AAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsiM_reqFifo_q_0$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ||
	     WILL_FIRE_RL_wsiM_reqFifo_both ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;
  // register wsiM_reqFifo_q_1
  always@(MUX_wsiM_reqFifo_q_1$write_1__SEL_1 or
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wsiM_reqFifo_both or
	  MUX_wsiM_reqFifo_q_1$write_1__VAL_2 or
	  WILL_FIRE_RL_wsiM_reqFifo_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wsiM_reqFifo_q_1$write_1__SEL_1:
	  wsiM_reqFifo_q_1$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wsiM_reqFifo_both:
	  wsiM_reqFifo_q_1$D_IN = MUX_wsiM_reqFifo_q_1$write_1__VAL_2;
      WILL_FIRE_RL_wsiM_reqFifo_decCtr:
	  wsiM_reqFifo_q_1$D_IN = 61'h00000AAAAAAAAA00;
      default: wsiM_reqFifo_q_1$D_IN =
		   61'h0AAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsiM_reqFifo_q_1$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ||
	     WILL_FIRE_RL_wsiM_reqFifo_both ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;
  // register wsiM_sThreadBusy_d
  assign wsiM_sThreadBusy_d$D_IN = wsiM0_SThreadBusy ;
  assign wsiM_sThreadBusy_d$EN = 1'd1 ;
  // register wsiM_statusR
  assign wsiM_statusR$D_IN =
	     { wsiM_isReset_isInReset,
	       !wsiM_peerIsReady,
	       !wsiM_operateD,
	       wsiM_errorSticky,
	       wsiM_burstKind != 2'd0,
	       wsiM_sThreadBusy_d,
	       1'd0,
	       wsiM_trafficSticky } ;
  assign wsiM_statusR$EN = 1'd1 ;
  // register wsiM_tBusyCount
  assign wsiM_tBusyCount$D_IN = wsiM_tBusyCount + 32'd1 ;
  assign wsiM_tBusyCount$EN =
	     wsiM_operateD && wsiM_peerIsReady && wsiM_sThreadBusy_d ;
  // register wsiM_trafficSticky
  assign wsiM_trafficSticky$D_IN = 1'd1 ;
  assign wsiM_trafficSticky$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[60:58] == 3'd1 ;
  // register wsiS_burstKind
  assign wsiS_burstKind$D_IN =
	     (wsiS_burstKind == 2'd0) ?
	       (wsiS_wsiReq$wget[56] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsiS_burstKind$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq &&
	     (wsiS_burstKind == 2'd0 ||
	      (wsiS_burstKind == 2'd1 || wsiS_burstKind == 2'd2) &&
	      wsiS_wsiReq$wget[57]) ;
  // register wsiS_errorSticky
  assign wsiS_errorSticky$D_IN = 1'b0 ;
  assign wsiS_errorSticky$EN = 1'b0 ;
  // register wsiS_iMesgCount
  assign wsiS_iMesgCount$D_IN = wsiS_iMesgCount + 32'd1 ;
  assign wsiS_iMesgCount$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_burstKind == 2'd2 &&
	     wsiS_wsiReq$wget[57] ;
  // register wsiS_isReset_isInReset
  assign wsiS_isReset_isInReset$D_IN = 1'd0 ;
  assign wsiS_isReset_isInReset$EN = wsiS_isReset_isInReset ;
  // register wsiS_mesgWordLength
  assign wsiS_mesgWordLength$D_IN = wsiS_wordCount ;
  assign wsiS_mesgWordLength$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_wsiReq$wget[57] ;
  // register wsiS_operateD
  assign wsiS_operateD$D_IN = wci_wslv_cState == 3'd2 ;
  assign wsiS_operateD$EN = 1'd1 ;
  // register wsiS_pMesgCount
  assign wsiS_pMesgCount$D_IN = wsiS_pMesgCount + 32'd1 ;
  assign wsiS_pMesgCount$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_burstKind == 2'd1 &&
	     wsiS_wsiReq$wget[57] ;
  // register wsiS_peerIsReady
  assign wsiS_peerIsReady$D_IN = wsiS0_MReset_n ;
  assign wsiS_peerIsReady$EN = 1'd1 ;
  // register wsiS_reqFifo_countReg
  assign wsiS_reqFifo_countReg$D_IN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq ?
	       wsiS_reqFifo_countReg + 2'd1 :
	       wsiS_reqFifo_countReg - 2'd1 ;
  assign wsiS_reqFifo_countReg$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq != wsiS_reqFifo_r_deq$whas ;
  // register wsiS_reqFifo_levelsValid
  assign wsiS_reqFifo_levelsValid$D_IN = WILL_FIRE_RL_wsiS_reqFifo_reset ;
  assign wsiS_reqFifo_levelsValid$EN =
	     WILL_FIRE_RL_wmwt_mesg_ingress ||
	     WILL_FIRE_RL_wsipass_doMessagePush ||
	     WILL_FIRE_RL_wsiS_reqFifo_enq ||
	     WILL_FIRE_RL_wsiS_reqFifo_reset ;
  // register wsiS_statusR
  assign wsiS_statusR$D_IN =
	     { wsiS_isReset_isInReset,
	       !wsiS_peerIsReady,
	       !wsiS_operateD,
	       wsiS_errorSticky,
	       wsiS_burstKind != 2'd0,
	       !wsiS_sThreadBusy_dw$whas || wsiS_sThreadBusy_dw$wget,
	       1'd0,
	       wsiS_trafficSticky } ;
  assign wsiS_statusR$EN = 1'd1 ;
  // register wsiS_tBusyCount
  assign wsiS_tBusyCount$D_IN = wsiS_tBusyCount + 32'd1 ;
  assign wsiS_tBusyCount$EN =
	     wsiS_operateD && wsiS_peerIsReady &&
	     (!wsiS_sThreadBusy_dw$whas || wsiS_sThreadBusy_dw$wget) ;
  // register wsiS_trafficSticky
  assign wsiS_trafficSticky$D_IN = 1'd1 ;
  assign wsiS_trafficSticky$EN = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  // register wsiS_wordCount
  assign wsiS_wordCount$D_IN =
	     wsiS_wsiReq$wget[57] ? 12'd1 : wsiS_wordCount + 12'd1 ;
  assign wsiS_wordCount$EN = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  // submodule mesgRF
  assign mesgRF$D_IN = v__h21048 ;
  assign mesgRF$ENQ = WILL_FIRE_RL_rdSer_body ;
  assign mesgRF$DEQ = WILL_FIRE_RL_wmrd_mesgBodyResponse ;
  assign mesgRF$CLR = 1'b0 ;
  // submodule mesgWF_memory
  assign mesgWF_memory$ADDRA = mesgWF_rWrPtr[11:0] ;
  assign mesgWF_memory$ADDRB =
	     WILL_FIRE_RL_wrtSer_body ?
	       x__h16107[11:0] :
	       mesgWF_rRdPtr[11:0] ;
  assign mesgWF_memory$DIA = x__h16006 ;
  assign mesgWF_memory$DIB = 32'hAAAAAAAA /* unspecified value */  ;
  assign mesgWF_memory$WEA = WILL_FIRE_RL_wmwt_mesg_ingress ;
  assign mesgWF_memory$WEB = 1'd0 ;
  assign mesgWF_memory$ENA = 1'd1 ;
  assign mesgWF_memory$ENB = 1'd1 ;
  // submodule metaRF
  assign metaRF$D_IN = v__h21048 ;
  assign metaRF$ENQ = WILL_FIRE_RL_rdSer_begin ;
  assign metaRF$DEQ = WILL_FIRE_RL_wmrd_mesgBegin ;
  assign metaRF$CLR = 1'b0 ;
  // submodule metaWF
  assign metaWF$D_IN = { wsiS_reqFifo$D_OUT[7:0], btm__h18537 } ;
  assign metaWF$ENQ = MUX_mesgWtCount$write_1__SEL_1 ;
  assign metaWF$DEQ = WILL_FIRE_RL_wrtSer_begin ;
  assign metaWF$CLR = 1'b0 ;
  // submodule wci_wslv_reqF
  assign wci_wslv_reqF$D_IN = wci_wslv_wciReq$wget ;
  assign wci_wslv_reqF$ENQ = wci_wslv_wciReq$wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF$DEQ = wci_wslv_reqF_r_deq$whas ;
  assign wci_wslv_reqF$CLR = 1'b0 ;
  // submodule wide16Fa
  assign wide16Fa$D_IN =
	     MUX_wide16Fa$enq_1__SEL_1 ?
	       MUX_wide16Fa$enq_1__VAL_1 :
	       MUX_wide16Fa$enq_1__VAL_2 ;
  assign wide16Fa$ENQ =
	     WILL_FIRE_RL_wrtSer_begin &&
	     (wrtSerPos == 2'd3 || metaWF$D_OUT[23:0] == 24'd0) ||
	     WILL_FIRE_RL_wrtSer_body &&
	     (wrtSerPos == 2'd3 || wrtSerUnroll == 16'd1) ;
  assign wide16Fa$DEQ = WILL_FIRE_RL_delay_write_req ;
  assign wide16Fa$CLR = 1'b0 ;
  // submodule wide16Fb
  assign wide16Fb$D_IN = wmemi_respF$D_OUT[127:0] ;
  assign wide16Fb$ENQ =
	     wmemi_respF$EMPTY_N && wide16Fb$FULL_N &&
	     wci_wslv_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 ;
  assign wide16Fb$DEQ = dlyReadCredit_acc_v2$whas ;
  assign wide16Fb$CLR = 1'b0 ;
  // submodule wide16Fc
  assign wide16Fc$D_IN = wide16Fb$D_OUT ;
  assign wide16Fc$ENQ = dlyReadCredit_acc_v2$whas ;
  assign wide16Fc$DEQ =
	     MUX_rdSerEmpty$write_1__PSEL_1 &&
	     (rdSerEmpty || rdSerPos == 2'd0) ;
  assign wide16Fc$CLR = 1'b0 ;
  // submodule wmemi_respF
  assign wmemi_respF$D_IN = wmemi_wmemiResponse$wget ;
  assign wmemi_respF$ENQ =
	     wmemi_respF$FULL_N && wmemi_operateD && wmemi_peerIsReady &&
	     wmemi_wmemiResponse$wget[130:129] != 2'd0 ;
  assign wmemi_respF$DEQ =
	     wmemi_respF$EMPTY_N && wide16Fb$FULL_N &&
	     wci_wslv_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 ;
  assign wmemi_respF$CLR = 1'b0 ;
  // submodule wsiS_reqFifo
  assign wsiS_reqFifo$D_IN = wsiS_wsiReq$wget ;
  assign wsiS_reqFifo$ENQ = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo$DEQ = wsiS_reqFifo_r_deq$whas ;
  assign wsiS_reqFifo$CLR = 1'b0 ;
  // remaining internal signals
  assign IF_wrtSerPos_90_EQ_0_98_OR_wrtSerPos_90_EQ_1_9_ETC___d543 =
	     CASE_wrtSerPos_0b1_0_1_1_1_2_1_3_0b1__q2 &&
	     (wrtSerPos != 2'd3 && wrtSerUnroll != 16'd1 ||
	      CASE_wrtSerPos_NOT_wrtSerPos_EQ_3_OR_wide16Fa_ETC__q1) ;
  assign IF_wrtSerPos_90_EQ_2_00_THEN_0x0_ELSE_mesgWF_w_ETC___d557 =
	     { (wrtSerPos == 2'd2) ? 32'h0 : data__h19661,
	       (wrtSerPos == 2'd2) ? data__h19661 : wrtSerStage_2,
	       wrtSerStage_1,
	       wrtSerStage } ;
  assign IF_wrtSerPos_90_EQ_2_00_THEN_0x0_ELSE_metaWF_f_ETC___d528 =
	     { (wrtSerPos == 2'd2) ? 32'h0 : metaWF$D_OUT,
	       (wrtSerPos == 2'd2) ? metaWF$D_OUT : wrtSerStage_2,
	       wrtSerStage_1,
	       wrtSerStage } ;
  assign NOT_mesgWF_rRdPtr_04_EQ_mesgWF_rWrPtr_95_31___d532 =
	     mesgWF_rRdPtr != mesgWF_rWrPtr ;
  assign NOT_mesgWF_rRdPtr_04_PLUS_2048_60_EQ_mesgWF_rW_ETC___d462 =
	     mesgWF_rRdPtr + 13'd2048 != mesgWF_rWrPtr ;
  assign NOT_wrtSerPos_90_EQ_3_91_92_AND_NOT_metaWF_fir_ETC___d506 =
	     wrtSerPos != 2'd3 && metaWF$D_OUT[23:0] != 24'd0 ||
	     CASE_wrtSerPos_NOT_wrtSerPos_EQ_3_OR_wide16Fa_ETC__q1 ;
  assign addr__h20380 = { 9'd0, x__h20438 } ;
  assign addr__h20732 = { 9'd0, x__h20777 } ;
  assign btm__h18537 =
	     { wsiS_reqFifo$D_OUT[56] ?
		 { 10'd0, wsiS_reqFifo$D_OUT[55:44] } :
		 { 8'd0, mesgLengthSoFar_73_PLUS_1___d909 },
	       2'd0 } ;
  assign bytesWritten_86_ULT_dlyHoldoffBytes_65___d995 =
	     bytesWritten < dlyHoldoffBytes ;
  assign cyclesPassed_56_ULT_dlyHoldoffCycles_68___d993 =
	     cyclesPassed < dlyHoldoffCycles ;
  assign data__h19661 =
	     (mesgWF_rCache[45] && mesgWF_rCache[44:32] == mesgWF_rRdPtr) ?
	       mesgWF_rCache[31:0] :
	       mesgWF_memory$DOB ;
  assign delayStatus__h23019 =
	     { 14'h0,
	       !dlyWordsStored_value_17_SLE_0___d994 &&
	       !bytesWritten_86_ULT_dlyHoldoffBytes_65___d995 &&
	       !cyclesPassed_56_ULT_dlyHoldoffCycles_68___d993,
	       dlyWordsStored_value_17_SLE_0_64_OR_bytesWritt_ETC___d572,
	       dlyWordsStored_value_17_SLT_8388608___d574,
	       wsiM_reqFifo_c_r != 2'd2,
	       metaWF$FULL_N,
	       metaWF$EMPTY_N,
	       NOT_mesgWF_rRdPtr_04_PLUS_2048_60_EQ_mesgWF_rW_ETC___d462,
	       NOT_mesgWF_rRdPtr_04_EQ_mesgWF_rWrPtr_95_31___d532,
	       metaRF$FULL_N,
	       metaRF$EMPTY_N,
	       mesgRF$FULL_N,
	       mesgRF$EMPTY_N,
	       wide16Fa$FULL_N,
	       wide16Fa$EMPTY_N,
	       wide16Fb$FULL_N,
	       wide16Fb$EMPTY_N,
	       wide16Fc$FULL_N,
	       wide16Fc$EMPTY_N } ;
  assign dlyWordsStored_value_17_SLE_0_64_OR_bytesWritt_ETC___d572 =
	     dlyWordsStored_value_17_SLE_0___d994 ||
	     bytesWritten_86_ULT_dlyHoldoffBytes_65___d995 ||
	     cyclesPassed_56_ULT_dlyHoldoffCycles_68___d993 ||
	     wsiM_reqFifo_c_r == 2'd2 ||
	     tog50 ;
  assign dlyWordsStored_value_17_SLE_0___d994 =
	     (dlyWordsStored_value ^ 25'h1000000) <= 25'd16777216 ;
  assign dlyWordsStored_value_17_SLT_8388608___d574 =
	     (dlyWordsStored_value ^ 25'h1000000) < 25'd25165824 ;
  assign mesgLengthSoFar_73_PLUS_1___d909 = mesgLengthSoFar + 14'd1 ;
  assign mesgRF_i_notFull__71_AND_NOT_rdSerEmpty_21_22__ETC___d672 =
	     mesgRF$FULL_N &&
	     (!rdSerEmpty && rdSerPos != 2'd0 || wide16Fc$EMPTY_N) ;
  assign metaRF_i_notFull__20_AND_NOT_rdSerEmpty_21_22__ETC___d631 =
	     metaRF$FULL_N &&
	     (!rdSerEmpty && rdSerPos != 2'd0 || wide16Fc$EMPTY_N) ;
  assign rdat__h23426 = hasDebugLogic ? mesgWtCount : 32'd0 ;
  assign rdat__h23432 = hasDebugLogic ? mesgRdCount : 32'd0 ;
  assign rdat__h23438 = hasDebugLogic ? bytesWritten : 32'd0 ;
  assign rdat__h23444 = hasDebugLogic ? { 8'd0, x__h23448 } : 32'd0 ;
  assign rdat__h23568 = hasDebugLogic ? wsiS_extStatusW$wget[95:64] : 32'd0 ;
  assign rdat__h23582 = hasDebugLogic ? wsiS_extStatusW$wget[63:32] : 32'd0 ;
  assign rdat__h23590 = hasDebugLogic ? wsiS_extStatusW$wget[31:0] : 32'd0 ;
  assign rdat__h23596 = hasDebugLogic ? wsiM_extStatusW$wget[95:64] : 32'd0 ;
  assign rdat__h23610 = hasDebugLogic ? wsiM_extStatusW$wget[63:32] : 32'd0 ;
  assign rdat__h23618 = hasDebugLogic ? wsiM_extStatusW$wget[31:0] : 32'd0 ;
  assign rdat__h23624 = hasDebugLogic ? wmemiWrReq : 32'd0 ;
  assign rdat__h23630 = hasDebugLogic ? wmemiRdReq : 32'd0 ;
  assign rdat__h23636 = hasDebugLogic ? wmemiRdResp1 : 32'd0 ;
  assign rdat__h23642 =
	     hasDebugLogic ?
	       { {7{dlyWordsStored_value[24]}}, dlyWordsStored_value } :
	       32'd0 ;
  assign rdat__h23653 =
	     hasDebugLogic ?
	       { {24{dlyReadCredit_value[7]}}, dlyReadCredit_value } :
	       32'd0 ;
  assign rdat__h23664 = hasDebugLogic ? { 9'd0, dlyWAG } : 32'd0 ;
  assign rdat__h23675 = hasDebugLogic ? { 9'd0, dlyRAG } : 32'd0 ;
  assign rdat__h23696 = hasDebugLogic ? wmemiRdResp2 : 32'd0 ;
  assign rdat__h23751 =
	     { {16{dlyReadyToWrite_value[15]}}, dlyReadyToWrite_value } ;
  assign rdat__h23760 = { 16'd0, wrtSerUnroll } ;
  assign rdat__h23769 = { 8'd0, bytesThisMessage } ;
  assign rdat__h23778 = { 18'd0, mesgLengthSoFar } ;
  assign wci_wslv_cState_6_EQ_2_7_AND_dlyCtrl_48_BITS_3_ETC___d592 =
	     wci_wslv_cState == 3'd2 && dlyCtrl[3:0] == 4'h7 &&
	     !dlyWordsStored_value_17_SLE_0___d994 &&
	     !bytesWritten_86_ULT_dlyHoldoffBytes_65___d995 &&
	     !cyclesPassed_56_ULT_dlyHoldoffCycles_68___d993 ;
  assign wrtSerPos_90_PLUS_1___d908 = wrtSerPos + 2'd1 ;
  assign x__h16006 =
	     WILL_FIRE_RL_wmwt_mesg_ingress ?
	       wsiS_reqFifo$D_OUT[43:12] :
	       32'd0 ;
  assign x__h16107 = mesgWF_rRdPtr + 13'd1 ;
  assign x__h19290 = { 96'd0, metaWF$D_OUT } ;
  assign x__h19317 = { 64'd0, metaWF$D_OUT, wrtSerStage } ;
  assign x__h19946 = { 96'd0, data__h19661 } ;
  assign x__h19970 = { 64'd0, data__h19661, wrtSerStage } ;
  assign x__h20438 = { dlyWAG, 4'h0 } ;
  assign x__h20777 = { dlyRAG, 4'h0 } ;
  assign x__h23448 = { wmemi_statusR, wsiS_statusR, wsiM_statusR } ;
  assign x_burstLength__h22925 =
	     (readMeta[23:0] == 24'd0) ? 12'd1 : readMeta[13:2] ;
  assign x_byteEn__h22926 = (readMeta[23:0] == 24'd0) ? 4'd0 : 4'd15 ;
  always@(rdSerPos or
	  rdSerStage_3 or wide16Fc$D_OUT or rdSerStage_1 or rdSerStage_2)
  begin
    case (rdSerPos)
      2'd0: v__h21048 = wide16Fc$D_OUT[31:0];
      2'd1: v__h21048 = rdSerStage_1;
      2'd2: v__h21048 = rdSerStage_2;
      2'd3: v__h21048 = rdSerStage_3;
    endcase
  end
  always@(wrtSerPos or wide16Fa$FULL_N)
  begin
    case (wrtSerPos)
      2'd0, 2'd1, 2'd2:
	  CASE_wrtSerPos_NOT_wrtSerPos_EQ_3_OR_wide16Fa_ETC__q1 =
	      wide16Fa$FULL_N;
      2'd3:
	  CASE_wrtSerPos_NOT_wrtSerPos_EQ_3_OR_wide16Fa_ETC__q1 =
	      wrtSerPos != 2'd3 || wide16Fa$FULL_N;
    endcase
  end
  always@(wrtSerPos)
  begin
    case (wrtSerPos)
      2'd0, 2'd1, 2'd2, 2'd3: CASE_wrtSerPos_0b1_0_1_1_1_2_1_3_0b1__q2 = 1'd1;
    endcase
  end
  always@(wci_wslv_reqF$D_OUT or
	  dlyCtrl or
	  dlyHoldoffBytes or
	  dlyHoldoffCycles or
	  rdat__h23426 or
	  rdat__h23432 or
	  rdat__h23438 or
	  rdat__h23444 or
	  rdat__h23568 or
	  rdat__h23582 or
	  rdat__h23590 or
	  rdat__h23596 or
	  rdat__h23610 or
	  rdat__h23618 or
	  rdat__h23624 or
	  rdat__h23630 or
	  rdat__h23636 or
	  rdat__h23642 or
	  rdat__h23653 or
	  rdat__h23664 or
	  rdat__h23675 or
	  dlyRdOpZero or
	  dlyRdOpOther or
	  rdat__h23696 or
	  delayStatus__h23019 or
	  rdat__h23751 or rdat__h23760 or rdat__h23769 or rdat__h23778)
  begin
    case (wci_wslv_reqF$D_OUT[63:32])
      32'h0: g_data__h23399 = dlyCtrl;
      32'h00000004: g_data__h23399 = dlyHoldoffBytes;
      32'h00000008: g_data__h23399 = dlyHoldoffCycles;
      32'h0000000C: g_data__h23399 = rdat__h23426;
      32'h00000010: g_data__h23399 = rdat__h23432;
      32'h00000014: g_data__h23399 = rdat__h23438;
      32'h00000018: g_data__h23399 = rdat__h23444;
      32'h0000001C: g_data__h23399 = 32'd0;
      32'h00000020: g_data__h23399 = rdat__h23568;
      32'h00000024: g_data__h23399 = rdat__h23582;
      32'h00000028: g_data__h23399 = rdat__h23590;
      32'h0000002C: g_data__h23399 = rdat__h23596;
      32'h00000030: g_data__h23399 = rdat__h23610;
      32'h00000034: g_data__h23399 = rdat__h23618;
      32'h00000038: g_data__h23399 = rdat__h23624;
      32'h0000003C: g_data__h23399 = rdat__h23630;
      32'h00000040: g_data__h23399 = rdat__h23636;
      32'h00000044: g_data__h23399 = rdat__h23642;
      32'h00000048: g_data__h23399 = rdat__h23653;
      32'h0000004C: g_data__h23399 = rdat__h23664;
      32'h00000050: g_data__h23399 = rdat__h23675;
      32'h00000058: g_data__h23399 = dlyRdOpZero;
      32'h0000005C: g_data__h23399 = dlyRdOpOther;
      32'h00000060: g_data__h23399 = rdat__h23696;
      32'h00000064: g_data__h23399 = delayStatus__h23019;
      32'h00000068: g_data__h23399 = rdat__h23751;
      32'h0000006C: g_data__h23399 = rdat__h23760;
      32'h00000070: g_data__h23399 = rdat__h23769;
      32'h00000074: g_data__h23399 = rdat__h23778;
      default: g_data__h23399 = 32'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (wciS0_MReset_n == `BSV_RESET_VALUE)
      begin
        bytesRead <= `BSV_ASSIGNMENT_DELAY 32'd0;
	bytesThisMessage <= `BSV_ASSIGNMENT_DELAY 24'd0;
	bytesWritten <= `BSV_ASSIGNMENT_DELAY 32'd0;
	cyclesPassed <= `BSV_ASSIGNMENT_DELAY 32'd0;
	dlyCtrl <= `BSV_ASSIGNMENT_DELAY dlyCtrlInit;
	dlyHoldoffBytes <= `BSV_ASSIGNMENT_DELAY 32'd0;
	dlyHoldoffCycles <= `BSV_ASSIGNMENT_DELAY 32'd0;
	dlyRAG <= `BSV_ASSIGNMENT_DELAY 23'd0;
	dlyRdOpOther <= `BSV_ASSIGNMENT_DELAY 32'd0;
	dlyRdOpZero <= `BSV_ASSIGNMENT_DELAY 32'd0;
	dlyReadCredit_value <= `BSV_ASSIGNMENT_DELAY 8'd0;
	dlyReadyToWrite_value <= `BSV_ASSIGNMENT_DELAY 16'd0;
	dlyWAG <= `BSV_ASSIGNMENT_DELAY 23'd0;
	dlyWordsStored_value <= `BSV_ASSIGNMENT_DELAY 25'd0;
	mesgLengthSoFar <= `BSV_ASSIGNMENT_DELAY 14'd0;
	mesgRdCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	mesgWF_rCache <= `BSV_ASSIGNMENT_DELAY 46'h0AAAAAAAAAAA;
	mesgWF_rRdPtr <= `BSV_ASSIGNMENT_DELAY 13'd0;
	mesgWF_rWrPtr <= `BSV_ASSIGNMENT_DELAY 13'd0;
	mesgWtCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rdSerAddr <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rdSerEmpty <= `BSV_ASSIGNMENT_DELAY 1'd1;
	rdSerPos <= `BSV_ASSIGNMENT_DELAY 2'd0;
	rdSerUnroll <= `BSV_ASSIGNMENT_DELAY 16'd0;
	rdSyncWord <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tog50 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	unrollCnt <= `BSV_ASSIGNMENT_DELAY 16'd0;
	wci_wslv_cEdge <= `BSV_ASSIGNMENT_DELAY 3'h2;
	wci_wslv_cState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	wci_wslv_ctlAckReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_ctlOpActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_illegalEdge <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_nState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	wci_wslv_reqF_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wci_wslv_respF_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wci_wslv_respF_q_0 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	wci_wslv_respF_q_1 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	wci_wslv_sFlagReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wmemiRdReq <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmemiRdResp1 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmemiRdResp2 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmemiWrReq <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmemi_busyWithMessage <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmemi_dhF_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmemi_dhF_q_0 <= `BSV_ASSIGNMENT_DELAY
	    146'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	wmemi_dhF_q_1 <= `BSV_ASSIGNMENT_DELAY
	    146'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	wmemi_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmemi_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmemi_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wmemi_reqF_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmemi_reqF_q_0 <= `BSV_ASSIGNMENT_DELAY 52'h0AAAAAAAAAAAA;
	wmemi_reqF_q_1 <= `BSV_ASSIGNMENT_DELAY 52'h0AAAAAAAAAAAA;
	wmemi_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wrtSerAddr <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wrtSerPos <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wrtSerUnroll <= `BSV_ASSIGNMENT_DELAY 16'd0;
	wsiM_burstKind <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsiM_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiM_iMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiM_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiM_pMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiM_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiM_reqFifo_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsiM_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY 61'h00000AAAAAAAAA00;
	wsiM_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY 61'h00000AAAAAAAAA00;
	wsiM_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wsiM_tBusyCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiM_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiS_burstKind <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsiS_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiS_iMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiS_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiS_pMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiS_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiS_reqFifo_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsiS_reqFifo_levelsValid <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wsiS_tBusyCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiS_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiS_wordCount <= `BSV_ASSIGNMENT_DELAY 12'd1;
      end
    else
      begin
        if (bytesRead$EN) bytesRead <= `BSV_ASSIGNMENT_DELAY bytesRead$D_IN;
	if (bytesThisMessage$EN)
	  bytesThisMessage <= `BSV_ASSIGNMENT_DELAY bytesThisMessage$D_IN;
	if (bytesWritten$EN)
	  bytesWritten <= `BSV_ASSIGNMENT_DELAY bytesWritten$D_IN;
	if (cyclesPassed$EN)
	  cyclesPassed <= `BSV_ASSIGNMENT_DELAY cyclesPassed$D_IN;
	if (dlyCtrl$EN) dlyCtrl <= `BSV_ASSIGNMENT_DELAY dlyCtrl$D_IN;
	if (dlyHoldoffBytes$EN)
	  dlyHoldoffBytes <= `BSV_ASSIGNMENT_DELAY dlyHoldoffBytes$D_IN;
	if (dlyHoldoffCycles$EN)
	  dlyHoldoffCycles <= `BSV_ASSIGNMENT_DELAY dlyHoldoffCycles$D_IN;
	if (dlyRAG$EN) dlyRAG <= `BSV_ASSIGNMENT_DELAY dlyRAG$D_IN;
	if (dlyRdOpOther$EN)
	  dlyRdOpOther <= `BSV_ASSIGNMENT_DELAY dlyRdOpOther$D_IN;
	if (dlyRdOpZero$EN)
	  dlyRdOpZero <= `BSV_ASSIGNMENT_DELAY dlyRdOpZero$D_IN;
	if (dlyReadCredit_value$EN)
	  dlyReadCredit_value <= `BSV_ASSIGNMENT_DELAY
	      dlyReadCredit_value$D_IN;
	if (dlyReadyToWrite_value$EN)
	  dlyReadyToWrite_value <= `BSV_ASSIGNMENT_DELAY
	      dlyReadyToWrite_value$D_IN;
	if (dlyWAG$EN) dlyWAG <= `BSV_ASSIGNMENT_DELAY dlyWAG$D_IN;
	if (dlyWordsStored_value$EN)
	  dlyWordsStored_value <= `BSV_ASSIGNMENT_DELAY
	      dlyWordsStored_value$D_IN;
	if (mesgLengthSoFar$EN)
	  mesgLengthSoFar <= `BSV_ASSIGNMENT_DELAY mesgLengthSoFar$D_IN;
	if (mesgRdCount$EN)
	  mesgRdCount <= `BSV_ASSIGNMENT_DELAY mesgRdCount$D_IN;
	if (mesgWF_rCache$EN)
	  mesgWF_rCache <= `BSV_ASSIGNMENT_DELAY mesgWF_rCache$D_IN;
	if (mesgWF_rRdPtr$EN)
	  mesgWF_rRdPtr <= `BSV_ASSIGNMENT_DELAY mesgWF_rRdPtr$D_IN;
	if (mesgWF_rWrPtr$EN)
	  mesgWF_rWrPtr <= `BSV_ASSIGNMENT_DELAY mesgWF_rWrPtr$D_IN;
	if (mesgWtCount$EN)
	  mesgWtCount <= `BSV_ASSIGNMENT_DELAY mesgWtCount$D_IN;
	if (rdSerAddr$EN) rdSerAddr <= `BSV_ASSIGNMENT_DELAY rdSerAddr$D_IN;
	if (rdSerEmpty$EN)
	  rdSerEmpty <= `BSV_ASSIGNMENT_DELAY rdSerEmpty$D_IN;
	if (rdSerPos$EN) rdSerPos <= `BSV_ASSIGNMENT_DELAY rdSerPos$D_IN;
	if (rdSerUnroll$EN)
	  rdSerUnroll <= `BSV_ASSIGNMENT_DELAY rdSerUnroll$D_IN;
	if (rdSyncWord$EN)
	  rdSyncWord <= `BSV_ASSIGNMENT_DELAY rdSyncWord$D_IN;
	if (tog50$EN) tog50 <= `BSV_ASSIGNMENT_DELAY tog50$D_IN;
	if (unrollCnt$EN) unrollCnt <= `BSV_ASSIGNMENT_DELAY unrollCnt$D_IN;
	if (wci_wslv_cEdge$EN)
	  wci_wslv_cEdge <= `BSV_ASSIGNMENT_DELAY wci_wslv_cEdge$D_IN;
	if (wci_wslv_cState$EN)
	  wci_wslv_cState <= `BSV_ASSIGNMENT_DELAY wci_wslv_cState$D_IN;
	if (wci_wslv_ctlAckReg$EN)
	  wci_wslv_ctlAckReg <= `BSV_ASSIGNMENT_DELAY wci_wslv_ctlAckReg$D_IN;
	if (wci_wslv_ctlOpActive$EN)
	  wci_wslv_ctlOpActive <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_ctlOpActive$D_IN;
	if (wci_wslv_illegalEdge$EN)
	  wci_wslv_illegalEdge <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_illegalEdge$D_IN;
	if (wci_wslv_nState$EN)
	  wci_wslv_nState <= `BSV_ASSIGNMENT_DELAY wci_wslv_nState$D_IN;
	if (wci_wslv_reqF_countReg$EN)
	  wci_wslv_reqF_countReg <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_reqF_countReg$D_IN;
	if (wci_wslv_respF_c_r$EN)
	  wci_wslv_respF_c_r <= `BSV_ASSIGNMENT_DELAY wci_wslv_respF_c_r$D_IN;
	if (wci_wslv_respF_q_0$EN)
	  wci_wslv_respF_q_0 <= `BSV_ASSIGNMENT_DELAY wci_wslv_respF_q_0$D_IN;
	if (wci_wslv_respF_q_1$EN)
	  wci_wslv_respF_q_1 <= `BSV_ASSIGNMENT_DELAY wci_wslv_respF_q_1$D_IN;
	if (wci_wslv_sFlagReg$EN)
	  wci_wslv_sFlagReg <= `BSV_ASSIGNMENT_DELAY wci_wslv_sFlagReg$D_IN;
	if (wci_wslv_sThreadBusy_d$EN)
	  wci_wslv_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_sThreadBusy_d$D_IN;
	if (wmemiRdReq$EN)
	  wmemiRdReq <= `BSV_ASSIGNMENT_DELAY wmemiRdReq$D_IN;
	if (wmemiRdResp1$EN)
	  wmemiRdResp1 <= `BSV_ASSIGNMENT_DELAY wmemiRdResp1$D_IN;
	if (wmemiRdResp2$EN)
	  wmemiRdResp2 <= `BSV_ASSIGNMENT_DELAY wmemiRdResp2$D_IN;
	if (wmemiWrReq$EN)
	  wmemiWrReq <= `BSV_ASSIGNMENT_DELAY wmemiWrReq$D_IN;
	if (wmemi_busyWithMessage$EN)
	  wmemi_busyWithMessage <= `BSV_ASSIGNMENT_DELAY
	      wmemi_busyWithMessage$D_IN;
	if (wmemi_dhF_c_r$EN)
	  wmemi_dhF_c_r <= `BSV_ASSIGNMENT_DELAY wmemi_dhF_c_r$D_IN;
	if (wmemi_dhF_q_0$EN)
	  wmemi_dhF_q_0 <= `BSV_ASSIGNMENT_DELAY wmemi_dhF_q_0$D_IN;
	if (wmemi_dhF_q_1$EN)
	  wmemi_dhF_q_1 <= `BSV_ASSIGNMENT_DELAY wmemi_dhF_q_1$D_IN;
	if (wmemi_errorSticky$EN)
	  wmemi_errorSticky <= `BSV_ASSIGNMENT_DELAY wmemi_errorSticky$D_IN;
	if (wmemi_operateD$EN)
	  wmemi_operateD <= `BSV_ASSIGNMENT_DELAY wmemi_operateD$D_IN;
	if (wmemi_peerIsReady$EN)
	  wmemi_peerIsReady <= `BSV_ASSIGNMENT_DELAY wmemi_peerIsReady$D_IN;
	if (wmemi_reqF_c_r$EN)
	  wmemi_reqF_c_r <= `BSV_ASSIGNMENT_DELAY wmemi_reqF_c_r$D_IN;
	if (wmemi_reqF_q_0$EN)
	  wmemi_reqF_q_0 <= `BSV_ASSIGNMENT_DELAY wmemi_reqF_q_0$D_IN;
	if (wmemi_reqF_q_1$EN)
	  wmemi_reqF_q_1 <= `BSV_ASSIGNMENT_DELAY wmemi_reqF_q_1$D_IN;
	if (wmemi_trafficSticky$EN)
	  wmemi_trafficSticky <= `BSV_ASSIGNMENT_DELAY
	      wmemi_trafficSticky$D_IN;
	if (wrtSerAddr$EN)
	  wrtSerAddr <= `BSV_ASSIGNMENT_DELAY wrtSerAddr$D_IN;
	if (wrtSerPos$EN) wrtSerPos <= `BSV_ASSIGNMENT_DELAY wrtSerPos$D_IN;
	if (wrtSerUnroll$EN)
	  wrtSerUnroll <= `BSV_ASSIGNMENT_DELAY wrtSerUnroll$D_IN;
	if (wsiM_burstKind$EN)
	  wsiM_burstKind <= `BSV_ASSIGNMENT_DELAY wsiM_burstKind$D_IN;
	if (wsiM_errorSticky$EN)
	  wsiM_errorSticky <= `BSV_ASSIGNMENT_DELAY wsiM_errorSticky$D_IN;
	if (wsiM_iMesgCount$EN)
	  wsiM_iMesgCount <= `BSV_ASSIGNMENT_DELAY wsiM_iMesgCount$D_IN;
	if (wsiM_operateD$EN)
	  wsiM_operateD <= `BSV_ASSIGNMENT_DELAY wsiM_operateD$D_IN;
	if (wsiM_pMesgCount$EN)
	  wsiM_pMesgCount <= `BSV_ASSIGNMENT_DELAY wsiM_pMesgCount$D_IN;
	if (wsiM_peerIsReady$EN)
	  wsiM_peerIsReady <= `BSV_ASSIGNMENT_DELAY wsiM_peerIsReady$D_IN;
	if (wsiM_reqFifo_c_r$EN)
	  wsiM_reqFifo_c_r <= `BSV_ASSIGNMENT_DELAY wsiM_reqFifo_c_r$D_IN;
	if (wsiM_reqFifo_q_0$EN)
	  wsiM_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY wsiM_reqFifo_q_0$D_IN;
	if (wsiM_reqFifo_q_1$EN)
	  wsiM_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY wsiM_reqFifo_q_1$D_IN;
	if (wsiM_sThreadBusy_d$EN)
	  wsiM_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY wsiM_sThreadBusy_d$D_IN;
	if (wsiM_tBusyCount$EN)
	  wsiM_tBusyCount <= `BSV_ASSIGNMENT_DELAY wsiM_tBusyCount$D_IN;
	if (wsiM_trafficSticky$EN)
	  wsiM_trafficSticky <= `BSV_ASSIGNMENT_DELAY wsiM_trafficSticky$D_IN;
	if (wsiS_burstKind$EN)
	  wsiS_burstKind <= `BSV_ASSIGNMENT_DELAY wsiS_burstKind$D_IN;
	if (wsiS_errorSticky$EN)
	  wsiS_errorSticky <= `BSV_ASSIGNMENT_DELAY wsiS_errorSticky$D_IN;
	if (wsiS_iMesgCount$EN)
	  wsiS_iMesgCount <= `BSV_ASSIGNMENT_DELAY wsiS_iMesgCount$D_IN;
	if (wsiS_operateD$EN)
	  wsiS_operateD <= `BSV_ASSIGNMENT_DELAY wsiS_operateD$D_IN;
	if (wsiS_pMesgCount$EN)
	  wsiS_pMesgCount <= `BSV_ASSIGNMENT_DELAY wsiS_pMesgCount$D_IN;
	if (wsiS_peerIsReady$EN)
	  wsiS_peerIsReady <= `BSV_ASSIGNMENT_DELAY wsiS_peerIsReady$D_IN;
	if (wsiS_reqFifo_countReg$EN)
	  wsiS_reqFifo_countReg <= `BSV_ASSIGNMENT_DELAY
	      wsiS_reqFifo_countReg$D_IN;
	if (wsiS_reqFifo_levelsValid$EN)
	  wsiS_reqFifo_levelsValid <= `BSV_ASSIGNMENT_DELAY
	      wsiS_reqFifo_levelsValid$D_IN;
	if (wsiS_tBusyCount$EN)
	  wsiS_tBusyCount <= `BSV_ASSIGNMENT_DELAY wsiS_tBusyCount$D_IN;
	if (wsiS_trafficSticky$EN)
	  wsiS_trafficSticky <= `BSV_ASSIGNMENT_DELAY wsiS_trafficSticky$D_IN;
	if (wsiS_wordCount$EN)
	  wsiS_wordCount <= `BSV_ASSIGNMENT_DELAY wsiS_wordCount$D_IN;
      end
    if (rdSerMeta$EN) rdSerMeta <= `BSV_ASSIGNMENT_DELAY rdSerMeta$D_IN;
    if (rdSerStage$EN) rdSerStage <= `BSV_ASSIGNMENT_DELAY rdSerStage$D_IN;
    if (rdSerStage_1$EN)
      rdSerStage_1 <= `BSV_ASSIGNMENT_DELAY rdSerStage_1$D_IN;
    if (rdSerStage_2$EN)
      rdSerStage_2 <= `BSV_ASSIGNMENT_DELAY rdSerStage_2$D_IN;
    if (rdSerStage_3$EN)
      rdSerStage_3 <= `BSV_ASSIGNMENT_DELAY rdSerStage_3$D_IN;
    if (readMeta$EN) readMeta <= `BSV_ASSIGNMENT_DELAY readMeta$D_IN;
    if (wmemi_statusR$EN)
      wmemi_statusR <= `BSV_ASSIGNMENT_DELAY wmemi_statusR$D_IN;
    if (wrtSerStage$EN) wrtSerStage <= `BSV_ASSIGNMENT_DELAY wrtSerStage$D_IN;
    if (wrtSerStage_1$EN)
      wrtSerStage_1 <= `BSV_ASSIGNMENT_DELAY wrtSerStage_1$D_IN;
    if (wrtSerStage_2$EN)
      wrtSerStage_2 <= `BSV_ASSIGNMENT_DELAY wrtSerStage_2$D_IN;
    if (wrtSerStage_3$EN)
      wrtSerStage_3 <= `BSV_ASSIGNMENT_DELAY wrtSerStage_3$D_IN;
    if (wsiM_statusR$EN)
      wsiM_statusR <= `BSV_ASSIGNMENT_DELAY wsiM_statusR$D_IN;
    if (wsiS_mesgWordLength$EN)
      wsiS_mesgWordLength <= `BSV_ASSIGNMENT_DELAY wsiS_mesgWordLength$D_IN;
    if (wsiS_statusR$EN)
      wsiS_statusR <= `BSV_ASSIGNMENT_DELAY wsiS_statusR$D_IN;
  end
  always@(posedge wciS0_Clk or `BSV_RESET_EDGE wciS0_MReset_n)
  if (wciS0_MReset_n == `BSV_RESET_VALUE)
    begin
      wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wmemi_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wsiM_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wsiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (wci_wslv_isReset_isInReset$EN)
	wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wci_wslv_isReset_isInReset$D_IN;
      if (wmemi_isReset_isInReset$EN)
	wmemi_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wmemi_isReset_isInReset$D_IN;
      if (wsiM_isReset_isInReset$EN)
	wsiM_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wsiM_isReset_isInReset$D_IN;
      if (wsiS_isReset_isInReset$EN)
	wsiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wsiS_isReset_isInReset$D_IN;
    end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    bytesRead = 32'hAAAAAAAA;
    bytesThisMessage = 24'hAAAAAA;
    bytesWritten = 32'hAAAAAAAA;
    cyclesPassed = 32'hAAAAAAAA;
    dlyCtrl = 32'hAAAAAAAA;
    dlyHoldoffBytes = 32'hAAAAAAAA;
    dlyHoldoffCycles = 32'hAAAAAAAA;
    dlyRAG = 23'h2AAAAA;
    dlyRdOpOther = 32'hAAAAAAAA;
    dlyRdOpZero = 32'hAAAAAAAA;
    dlyReadCredit_value = 8'hAA;
    dlyReadyToWrite_value = 16'hAAAA;
    dlyWAG = 23'h2AAAAA;
    dlyWordsStored_value = 25'h0AAAAAA;
    mesgLengthSoFar = 14'h2AAA;
    mesgRdCount = 32'hAAAAAAAA;
    mesgWF_rCache = 46'h2AAAAAAAAAAA;
    mesgWF_rRdPtr = 13'h0AAA;
    mesgWF_rWrPtr = 13'h0AAA;
    mesgWtCount = 32'hAAAAAAAA;
    rdSerAddr = 32'hAAAAAAAA;
    rdSerEmpty = 1'h0;
    rdSerMeta = 32'hAAAAAAAA;
    rdSerPos = 2'h2;
    rdSerStage = 32'hAAAAAAAA;
    rdSerStage_1 = 32'hAAAAAAAA;
    rdSerStage_2 = 32'hAAAAAAAA;
    rdSerStage_3 = 32'hAAAAAAAA;
    rdSerUnroll = 16'hAAAA;
    rdSyncWord = 1'h0;
    readMeta = 32'hAAAAAAAA;
    tog50 = 1'h0;
    unrollCnt = 16'hAAAA;
    wci_wslv_cEdge = 3'h2;
    wci_wslv_cState = 3'h2;
    wci_wslv_ctlAckReg = 1'h0;
    wci_wslv_ctlOpActive = 1'h0;
    wci_wslv_illegalEdge = 1'h0;
    wci_wslv_isReset_isInReset = 1'h0;
    wci_wslv_nState = 3'h2;
    wci_wslv_reqF_countReg = 2'h2;
    wci_wslv_respF_c_r = 2'h2;
    wci_wslv_respF_q_0 = 34'h2AAAAAAAA;
    wci_wslv_respF_q_1 = 34'h2AAAAAAAA;
    wci_wslv_sFlagReg = 1'h0;
    wci_wslv_sThreadBusy_d = 1'h0;
    wmemiRdReq = 32'hAAAAAAAA;
    wmemiRdResp1 = 32'hAAAAAAAA;
    wmemiRdResp2 = 32'hAAAAAAAA;
    wmemiWrReq = 32'hAAAAAAAA;
    wmemi_busyWithMessage = 1'h0;
    wmemi_dhF_c_r = 2'h2;
    wmemi_dhF_q_0 = 146'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wmemi_dhF_q_1 = 146'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wmemi_errorSticky = 1'h0;
    wmemi_isReset_isInReset = 1'h0;
    wmemi_operateD = 1'h0;
    wmemi_peerIsReady = 1'h0;
    wmemi_reqF_c_r = 2'h2;
    wmemi_reqF_q_0 = 52'hAAAAAAAAAAAAA;
    wmemi_reqF_q_1 = 52'hAAAAAAAAAAAAA;
    wmemi_statusR = 8'hAA;
    wmemi_trafficSticky = 1'h0;
    wrtSerAddr = 32'hAAAAAAAA;
    wrtSerPos = 2'h2;
    wrtSerStage = 32'hAAAAAAAA;
    wrtSerStage_1 = 32'hAAAAAAAA;
    wrtSerStage_2 = 32'hAAAAAAAA;
    wrtSerStage_3 = 32'hAAAAAAAA;
    wrtSerUnroll = 16'hAAAA;
    wsiM_burstKind = 2'h2;
    wsiM_errorSticky = 1'h0;
    wsiM_iMesgCount = 32'hAAAAAAAA;
    wsiM_isReset_isInReset = 1'h0;
    wsiM_operateD = 1'h0;
    wsiM_pMesgCount = 32'hAAAAAAAA;
    wsiM_peerIsReady = 1'h0;
    wsiM_reqFifo_c_r = 2'h2;
    wsiM_reqFifo_q_0 = 61'h0AAAAAAAAAAAAAAA;
    wsiM_reqFifo_q_1 = 61'h0AAAAAAAAAAAAAAA;
    wsiM_sThreadBusy_d = 1'h0;
    wsiM_statusR = 8'hAA;
    wsiM_tBusyCount = 32'hAAAAAAAA;
    wsiM_trafficSticky = 1'h0;
    wsiS_burstKind = 2'h2;
    wsiS_errorSticky = 1'h0;
    wsiS_iMesgCount = 32'hAAAAAAAA;
    wsiS_isReset_isInReset = 1'h0;
    wsiS_mesgWordLength = 12'hAAA;
    wsiS_operateD = 1'h0;
    wsiS_pMesgCount = 32'hAAAAAAAA;
    wsiS_peerIsReady = 1'h0;
    wsiS_reqFifo_countReg = 2'h2;
    wsiS_reqFifo_levelsValid = 1'h0;
    wsiS_statusR = 8'hAA;
    wsiS_tBusyCount = 32'hAAAAAAAA;
    wsiS_trafficSticky = 1'h0;
    wsiS_wordCount = 12'hAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge wciS0_Clk)
  begin
    #0;
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_start)
	begin
	  v__h3739 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3739,
		 wci_wslv_reqF$D_OUT[36:34],
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	begin
	  v__h24065 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	$display("[%0d]: %m: Starting DelayWorker dlyCtrl:%0x",
		 v__h24065,
		 dlyCtrl);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DelayWorker.bsv\", line 380, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/DelayWorker.bsv\", line 380, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/DelayWorker.bsv\", line 380, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/wrk/DelayWorker.bsv\", line 380, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and [RL_wci_cfrd] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DelayWorker.bsv\", line 380, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/DelayWorker.bsv\", line 380, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/DelayWorker.bsv\", line 380, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DelayWorker.bsv\", line 380, column 60: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DelayWorker.bsv\", line 380, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/DelayWorker.bsv\", line 380, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	begin
	  v__h4058 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h4058,
		 wci_wslv_cEdge,
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	begin
	  v__h3914 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h3914,
		 wci_wslv_cEdge,
		 wci_wslv_cState,
		 wci_wslv_nState);
  end
  // synopsys translate_on
endmodule