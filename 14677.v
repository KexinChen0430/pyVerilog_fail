module outputs
  wire [255 : 0] wsiM1_MData;
  wire [127 : 0] wmemiM_MData;
  wire [35 : 0] wmemiM_MAddr;
  wire [31 : 0] wciS0_SData, wsiM1_MByteEn;
  wire [15 : 0] wmemiM_MDataByteEn;
  wire [11 : 0] wmemiM_MBurstLength, wsiM1_MBurstLength;
  wire [7 : 0] wsiM1_MReqInfo;
  wire [2 : 0] wmemiM_MCmd, wsiM1_MCmd;
  wire [1 : 0] wciS0_SFlag, wciS0_SResp;
  wire wciS0_SThreadBusy,
       wmemiM_MDataLast,
       wmemiM_MDataValid,
       wmemiM_MReqLast,
       wmemiM_MReset_n,
       wsiM1_MBurstPrecise,
       wsiM1_MReqLast,
       wsiM1_MReset_n,
       wsiS1_SReset_n,
       wsiS1_SThreadBusy;
`else
`define NOT_EMPTY_delay.v
`include "delay_defs.v"
`endif
  // inlined wires
  wire [312 : 0] wsiM_reqFifo_x_wire$wget, wsiS_wsiReq$wget;
  wire [255 : 0] mesgWF_wDataIn$wget,
		 mesgWF_wDataOut$wget,
		 wsi_Es_mData_w$wget;
  wire [145 : 0] wmemi_dhF_x_wire$wget;
  wire [130 : 0] wmemi_wmemiResponse$wget;
  wire [127 : 0] wmemi_Em_sData_w$wget;
  wire [95 : 0] wsiM_extStatusW$wget, wsiS_extStatusW$wget;
  wire [59 : 0] wci_wciReq$wget;
  wire [51 : 0] wmemi_reqF_x_wire$wget;
  wire [33 : 0] wci_respF_x_wire$wget;
  wire [31 : 0] wci_Es_mData_w$wget, wsi_Es_mByteEn_w$wget;
  wire [24 : 0] dlyWordsStored_acc_v1$wget, dlyWordsStored_acc_v2$wget;
  wire [19 : 0] wci_Es_mAddr_w$wget;
  wire [15 : 0] dlyReadyToWrite_acc_v1$wget, dlyReadyToWrite_acc_v2$wget;
  wire [11 : 0] wsi_Es_mBurstLength_w$wget;
  wire [7 : 0] dlyReadCredit_acc_v1$wget,
	       dlyReadCredit_acc_v2$wget,
	       wsi_Es_mReqInfo_w$wget;
  wire [3 : 0] wci_Es_mByteEn_w$wget;
  wire [2 : 0] wci_Es_mCmd_w$wget, wci_wEdge$wget, wsi_Es_mCmd_w$wget;
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
       wci_Es_mAddrSpace_w$wget,
       wci_Es_mAddrSpace_w$whas,
       wci_Es_mAddr_w$whas,
       wci_Es_mByteEn_w$whas,
       wci_Es_mCmd_w$whas,
       wci_Es_mData_w$whas,
       wci_ctlAckReg_1$wget,
       wci_ctlAckReg_1$whas,
       wci_reqF_r_clr$whas,
       wci_reqF_r_deq$whas,
       wci_reqF_r_enq$whas,
       wci_respF_dequeueing$whas,
       wci_respF_enqueueing$whas,
       wci_respF_x_wire$whas,
       wci_sFlagReg_1$wget,
       wci_sFlagReg_1$whas,
       wci_sThreadBusy_pw$whas,
       wci_wEdge$whas,
       wci_wciReq$whas,
       wci_wci_cfrd_pw$whas,
       wci_wci_cfwr_pw$whas,
       wci_wci_ctrl_pw$whas,
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
  reg [269 : 0] mesgWF_rCache;
  wire [269 : 0] mesgWF_rCache$D_IN;
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
  // register wci_cEdge
  reg [2 : 0] wci_cEdge;
  wire [2 : 0] wci_cEdge$D_IN;
  wire wci_cEdge$EN;
  // register wci_cState
  reg [2 : 0] wci_cState;
  wire [2 : 0] wci_cState$D_IN;
  wire wci_cState$EN;
  // register wci_ctlAckReg
  reg wci_ctlAckReg;
  wire wci_ctlAckReg$D_IN, wci_ctlAckReg$EN;
  // register wci_ctlOpActive
  reg wci_ctlOpActive;
  wire wci_ctlOpActive$D_IN, wci_ctlOpActive$EN;
  // register wci_illegalEdge
  reg wci_illegalEdge;
  wire wci_illegalEdge$D_IN, wci_illegalEdge$EN;
  // register wci_nState
  reg [2 : 0] wci_nState;
  reg [2 : 0] wci_nState$D_IN;
  wire wci_nState$EN;
  // register wci_reqF_countReg
  reg [1 : 0] wci_reqF_countReg;
  wire [1 : 0] wci_reqF_countReg$D_IN;
  wire wci_reqF_countReg$EN;
  // register wci_respF_c_r
  reg [1 : 0] wci_respF_c_r;
  wire [1 : 0] wci_respF_c_r$D_IN;
  wire wci_respF_c_r$EN;
  // register wci_respF_q_0
  reg [33 : 0] wci_respF_q_0;
  reg [33 : 0] wci_respF_q_0$D_IN;
  wire wci_respF_q_0$EN;
  // register wci_respF_q_1
  reg [33 : 0] wci_respF_q_1;
  reg [33 : 0] wci_respF_q_1$D_IN;
  wire wci_respF_q_1$EN;
  // register wci_sFlagReg
  reg wci_sFlagReg;
  wire wci_sFlagReg$D_IN, wci_sFlagReg$EN;
  // register wci_sThreadBusy_d
  reg wci_sThreadBusy_d;
  wire wci_sThreadBusy_d$D_IN, wci_sThreadBusy_d$EN;
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
  reg [312 : 0] wsiM_reqFifo_q_0;
  reg [312 : 0] wsiM_reqFifo_q_0$D_IN;
  wire wsiM_reqFifo_q_0$EN;
  // register wsiM_reqFifo_q_1
  reg [312 : 0] wsiM_reqFifo_q_1;
  reg [312 : 0] wsiM_reqFifo_q_1$D_IN;
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
  wire [255 : 0] mesgRF$D_IN, mesgRF$D_OUT;
  wire mesgRF$CLR, mesgRF$DEQ, mesgRF$EMPTY_N, mesgRF$ENQ, mesgRF$FULL_N;
  // ports of submodule mesgWF_memory
  wire [255 : 0] mesgWF_memory$DIA, mesgWF_memory$DIB, mesgWF_memory$DOB;
  wire [11 : 0] mesgWF_memory$ADDRA, mesgWF_memory$ADDRB;
  wire mesgWF_memory$ENA,
       mesgWF_memory$ENB,
       mesgWF_memory$WEA,
       mesgWF_memory$WEB;
  // ports of submodule metaRF
  reg [31 : 0] metaRF$D_IN;
  wire [31 : 0] metaRF$D_OUT;
  wire metaRF$CLR, metaRF$DEQ, metaRF$EMPTY_N, metaRF$ENQ, metaRF$FULL_N;
  // ports of submodule metaWF
  wire [31 : 0] metaWF$D_IN, metaWF$D_OUT;
  wire metaWF$CLR, metaWF$DEQ, metaWF$EMPTY_N, metaWF$ENQ, metaWF$FULL_N;
  // ports of submodule wci_isReset
  wire wci_isReset$VAL;
  // ports of submodule wci_reqF
  wire [59 : 0] wci_reqF$D_IN, wci_reqF$D_OUT;
  wire wci_reqF$CLR, wci_reqF$DEQ, wci_reqF$EMPTY_N, wci_reqF$ENQ;
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
  // ports of submodule wmemi_isReset
  wire wmemi_isReset$VAL;
  // ports of submodule wmemi_respF
  wire [130 : 0] wmemi_respF$D_IN, wmemi_respF$D_OUT;
  wire wmemi_respF$CLR,
       wmemi_respF$DEQ,
       wmemi_respF$EMPTY_N,
       wmemi_respF$ENQ,
       wmemi_respF$FULL_N;
  // ports of submodule wsiM_isReset
  wire wsiM_isReset$VAL;
  // ports of submodule wsiS_isReset
  wire wsiS_isReset$VAL;
  // ports of submodule wsiS_reqFifo
  wire [312 : 0] wsiS_reqFifo$D_IN, wsiS_reqFifo$D_OUT;
  wire wsiS_reqFifo$CLR,
       wsiS_reqFifo$DEQ,
       wsiS_reqFifo$EMPTY_N,
       wsiS_reqFifo$ENQ,
       wsiS_reqFifo$FULL_N;
  // rule scheduling signals
  wire CAN_FIRE_RL_cycles_passed_count,
       CAN_FIRE_RL_delay_Fb2Fc,
       CAN_FIRE_RL_delay_read_req,
       CAN_FIRE_RL_delay_read_resp,
       CAN_FIRE_RL_delay_write_req,
       CAN_FIRE_RL_dlyReadCredit_accumulate,
       CAN_FIRE_RL_dlyReadyToWrite_accumulate,
       CAN_FIRE_RL_dlyWordsStored_accumulate,
       CAN_FIRE_RL_mesgWF_portA,
       CAN_FIRE_RL_mesgWF_portB,
       CAN_FIRE_RL_mesgWF_portB_read_data,
       CAN_FIRE_RL_operating_actions,
       CAN_FIRE_RL_rdSer_begin,
       CAN_FIRE_RL_rdSer_body,
       CAN_FIRE_RL_rdSer_sync,
       CAN_FIRE_RL_wci_Es_doAlways_Req,
       CAN_FIRE_RL_wci_cfrd,
       CAN_FIRE_RL_wci_cfwr,
       CAN_FIRE_RL_wci_ctlAckReg__dreg_update,
       CAN_FIRE_RL_wci_ctl_op_complete,
       CAN_FIRE_RL_wci_ctl_op_start,
       CAN_FIRE_RL_wci_ctrl_EiI,
       CAN_FIRE_RL_wci_ctrl_IsO,
       CAN_FIRE_RL_wci_ctrl_OrE,
       CAN_FIRE_RL_wci_reqF__updateLevelCounter,
       CAN_FIRE_RL_wci_reqF_enq,
       CAN_FIRE_RL_wci_request_decode,
       CAN_FIRE_RL_wci_respF_both,
       CAN_FIRE_RL_wci_respF_decCtr,
       CAN_FIRE_RL_wci_respF_deq,
       CAN_FIRE_RL_wci_respF_incCtr,
       CAN_FIRE_RL_wci_sFlagReg__dreg_update,
       CAN_FIRE_RL_wci_sThreadBusy_reg,
       CAN_FIRE_RL_wmemi_Em_doAlways,
       CAN_FIRE_RL_wmemi_dhF_both,
       CAN_FIRE_RL_wmemi_dhF_decCtr,
       CAN_FIRE_RL_wmemi_dhF_deq,
       CAN_FIRE_RL_wmemi_dhF_incCtr,
       CAN_FIRE_RL_wmemi_operateD__dreg_update,
       CAN_FIRE_RL_wmemi_peerIsReady__dreg_update,
       CAN_FIRE_RL_wmemi_reqF_both,
       CAN_FIRE_RL_wmemi_reqF_decCtr,
       CAN_FIRE_RL_wmemi_reqF_deq,
       CAN_FIRE_RL_wmemi_reqF_incCtr,
       CAN_FIRE_RL_wmemi_respAdvance,
       CAN_FIRE_RL_wmemi_update_statusR,
       CAN_FIRE_RL_wmrd_mesgBegin,
       CAN_FIRE_RL_wmrd_mesgBodyResponse,
       CAN_FIRE_RL_wmwt_mesg_ingress,
       CAN_FIRE_RL_wrtSer_begin,
       CAN_FIRE_RL_wrtSer_body,
       CAN_FIRE_RL_wsiM_ext_status_assign,
       CAN_FIRE_RL_wsiM_inc_tBusyCount,
       CAN_FIRE_RL_wsiM_operateD__dreg_update,
       CAN_FIRE_RL_wsiM_peerIsReady__dreg_update,
       CAN_FIRE_RL_wsiM_reqFifo_both,
       CAN_FIRE_RL_wsiM_reqFifo_decCtr,
       CAN_FIRE_RL_wsiM_reqFifo_deq,
       CAN_FIRE_RL_wsiM_reqFifo_incCtr,
       CAN_FIRE_RL_wsiM_sThreadBusy_reg,
       CAN_FIRE_RL_wsiM_update_statusR,
       CAN_FIRE_RL_wsiS_backpressure,
       CAN_FIRE_RL_wsiS_ext_status_assign,
       CAN_FIRE_RL_wsiS_inc_tBusyCount,
       CAN_FIRE_RL_wsiS_operateD__dreg_update,
       CAN_FIRE_RL_wsiS_peerIsReady__dreg_update,
       CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter,
       CAN_FIRE_RL_wsiS_reqFifo_enq,
       CAN_FIRE_RL_wsiS_reqFifo_reset,
       CAN_FIRE_RL_wsiS_update_statusR,
       CAN_FIRE_RL_wsi_Es_doAlways,
       CAN_FIRE_RL_wsipass_doMessagePush,
       CAN_FIRE_wciS0_mAddr,
       CAN_FIRE_wciS0_mAddrSpace,
       CAN_FIRE_wciS0_mByteEn,
       CAN_FIRE_wciS0_mCmd,
       CAN_FIRE_wciS0_mData,
       CAN_FIRE_wciS0_mFlag,
       CAN_FIRE_wmemiM_sCmdAccept,
       CAN_FIRE_wmemiM_sData,
       CAN_FIRE_wmemiM_sDataAccept,
       CAN_FIRE_wmemiM_sResp,
       CAN_FIRE_wmemiM_sRespLast,
       CAN_FIRE_wsiM1_sReset_n,
       CAN_FIRE_wsiM1_sThreadBusy,
       CAN_FIRE_wsiS1_mBurstLength,
       CAN_FIRE_wsiS1_mBurstPrecise,
       CAN_FIRE_wsiS1_mByteEn,
       CAN_FIRE_wsiS1_mCmd,
       CAN_FIRE_wsiS1_mData,
       CAN_FIRE_wsiS1_mDataInfo,
       CAN_FIRE_wsiS1_mReqInfo,
       CAN_FIRE_wsiS1_mReqLast,
       CAN_FIRE_wsiS1_mReset_n,
       WILL_FIRE_RL_cycles_passed_count,
       WILL_FIRE_RL_delay_Fb2Fc,
       WILL_FIRE_RL_delay_read_req,
       WILL_FIRE_RL_delay_read_resp,
       WILL_FIRE_RL_delay_write_req,
       WILL_FIRE_RL_dlyReadCredit_accumulate,
       WILL_FIRE_RL_dlyReadyToWrite_accumulate,
       WILL_FIRE_RL_dlyWordsStored_accumulate,
       WILL_FIRE_RL_mesgWF_portA,
       WILL_FIRE_RL_mesgWF_portB,
       WILL_FIRE_RL_mesgWF_portB_read_data,
       WILL_FIRE_RL_operating_actions,
       WILL_FIRE_RL_rdSer_begin,
       WILL_FIRE_RL_rdSer_body,
       WILL_FIRE_RL_rdSer_sync,
       WILL_FIRE_RL_wci_Es_doAlways_Req,
       WILL_FIRE_RL_wci_cfrd,
       WILL_FIRE_RL_wci_cfwr,
       WILL_FIRE_RL_wci_ctlAckReg__dreg_update,
       WILL_FIRE_RL_wci_ctl_op_complete,
       WILL_FIRE_RL_wci_ctl_op_start,
       WILL_FIRE_RL_wci_ctrl_EiI,
       WILL_FIRE_RL_wci_ctrl_IsO,
       WILL_FIRE_RL_wci_ctrl_OrE,
       WILL_FIRE_RL_wci_reqF__updateLevelCounter,
       WILL_FIRE_RL_wci_reqF_enq,
       WILL_FIRE_RL_wci_request_decode,
       WILL_FIRE_RL_wci_respF_both,
       WILL_FIRE_RL_wci_respF_decCtr,
       WILL_FIRE_RL_wci_respF_deq,
       WILL_FIRE_RL_wci_respF_incCtr,
       WILL_FIRE_RL_wci_sFlagReg__dreg_update,
       WILL_FIRE_RL_wci_sThreadBusy_reg,
       WILL_FIRE_RL_wmemi_Em_doAlways,
       WILL_FIRE_RL_wmemi_dhF_both,
       WILL_FIRE_RL_wmemi_dhF_decCtr,
       WILL_FIRE_RL_wmemi_dhF_deq,
       WILL_FIRE_RL_wmemi_dhF_incCtr,
       WILL_FIRE_RL_wmemi_operateD__dreg_update,
       WILL_FIRE_RL_wmemi_peerIsReady__dreg_update,
       WILL_FIRE_RL_wmemi_reqF_both,
       WILL_FIRE_RL_wmemi_reqF_decCtr,
       WILL_FIRE_RL_wmemi_reqF_deq,
       WILL_FIRE_RL_wmemi_reqF_incCtr,
       WILL_FIRE_RL_wmemi_respAdvance,
       WILL_FIRE_RL_wmemi_update_statusR,
       WILL_FIRE_RL_wmrd_mesgBegin,
       WILL_FIRE_RL_wmrd_mesgBodyResponse,
       WILL_FIRE_RL_wmwt_mesg_ingress,
       WILL_FIRE_RL_wrtSer_begin,
       WILL_FIRE_RL_wrtSer_body,
       WILL_FIRE_RL_wsiM_ext_status_assign,
       WILL_FIRE_RL_wsiM_inc_tBusyCount,
       WILL_FIRE_RL_wsiM_operateD__dreg_update,
       WILL_FIRE_RL_wsiM_peerIsReady__dreg_update,
       WILL_FIRE_RL_wsiM_reqFifo_both,
       WILL_FIRE_RL_wsiM_reqFifo_decCtr,
       WILL_FIRE_RL_wsiM_reqFifo_deq,
       WILL_FIRE_RL_wsiM_reqFifo_incCtr,
       WILL_FIRE_RL_wsiM_sThreadBusy_reg,
       WILL_FIRE_RL_wsiM_update_statusR,
       WILL_FIRE_RL_wsiS_backpressure,
       WILL_FIRE_RL_wsiS_ext_status_assign,
       WILL_FIRE_RL_wsiS_inc_tBusyCount,
       WILL_FIRE_RL_wsiS_operateD__dreg_update,
       WILL_FIRE_RL_wsiS_peerIsReady__dreg_update,
       WILL_FIRE_RL_wsiS_reqFifo__updateLevelCounter,
       WILL_FIRE_RL_wsiS_reqFifo_enq,
       WILL_FIRE_RL_wsiS_reqFifo_reset,
       WILL_FIRE_RL_wsiS_update_statusR,
       WILL_FIRE_RL_wsi_Es_doAlways,
       WILL_FIRE_RL_wsipass_doMessagePush,
       WILL_FIRE_wciS0_mAddr,
       WILL_FIRE_wciS0_mAddrSpace,
       WILL_FIRE_wciS0_mByteEn,
       WILL_FIRE_wciS0_mCmd,
       WILL_FIRE_wciS0_mData,
       WILL_FIRE_wciS0_mFlag,
       WILL_FIRE_wmemiM_sCmdAccept,
       WILL_FIRE_wmemiM_sData,
       WILL_FIRE_wmemiM_sDataAccept,
       WILL_FIRE_wmemiM_sResp,
       WILL_FIRE_wmemiM_sRespLast,
       WILL_FIRE_wsiM1_sReset_n,
       WILL_FIRE_wsiM1_sThreadBusy,
       WILL_FIRE_wsiS1_mBurstLength,
       WILL_FIRE_wsiS1_mBurstPrecise,
       WILL_FIRE_wsiS1_mByteEn,
       WILL_FIRE_wsiS1_mCmd,
       WILL_FIRE_wsiS1_mData,
       WILL_FIRE_wsiS1_mDataInfo,
       WILL_FIRE_wsiS1_mReqInfo,
       WILL_FIRE_wsiS1_mReqLast,
       WILL_FIRE_wsiS1_mReset_n;
  // inputs to muxes for submodule ports
  reg [127 : 0] MUX_wide16Fa$enq_1__VAL_1, MUX_wide16Fa$enq_1__VAL_2;
  reg [33 : 0] MUX_wci_respF_q_0$write_1__VAL_2;
  wire [312 : 0] MUX_wsiM_reqFifo_q_0$write_1__VAL_1,
		 MUX_wsiM_reqFifo_q_0$write_1__VAL_2,
		 MUX_wsiM_reqFifo_q_1$write_1__VAL_1,
		 MUX_wsiM_reqFifo_x_wire$wset_1__VAL_1;
  wire [145 : 0] MUX_wmemi_dhF_q_0$write_1__VAL_1,
		 MUX_wmemi_dhF_q_0$write_1__VAL_2,
		 MUX_wmemi_dhF_q_1$write_1__VAL_1;
  wire [51 : 0] MUX_wmemi_reqF_q_0$write_1__VAL_1,
		MUX_wmemi_reqF_q_0$write_1__VAL_2,
		MUX_wmemi_reqF_q_1$write_1__VAL_1,
		MUX_wmemi_reqF_x_wire$wset_1__VAL_1,
		MUX_wmemi_reqF_x_wire$wset_1__VAL_2;
  wire [33 : 0] MUX_wci_respF_q_0$write_1__VAL_1,
		MUX_wci_respF_q_1$write_1__VAL_1,
		MUX_wci_respF_x_wire$wset_1__VAL_1,
		MUX_wci_respF_x_wire$wset_1__VAL_2;
  wire [31 : 0] MUX_mesgRdCount$write_1__VAL_1,
		MUX_mesgWtCount$write_1__VAL_1;
  wire [24 : 0] MUX_dlyWordsStored_value$write_1__VAL_2;
  wire [22 : 0] MUX_dlyRAG$write_1__VAL_1, MUX_dlyWAG$write_1__VAL_1;
  wire [15 : 0] MUX_dlyReadyToWrite_value$write_1__VAL_2,
		MUX_rdSerUnroll$write_1__VAL_2,
		MUX_unrollCnt$write_1__VAL_1,
		MUX_unrollCnt$write_1__VAL_2,
		MUX_wrtSerUnroll$write_1__VAL_1;
  wire [7 : 0] MUX_dlyReadCredit_value$write_1__VAL_2;
  wire [1 : 0] MUX_rdSerPos$write_1__VAL_1,
	       MUX_wci_respF_c_r$write_1__VAL_1,
	       MUX_wci_respF_c_r$write_1__VAL_2,
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
       MUX_wci_illegalEdge$write_1__SEL_1,
       MUX_wci_illegalEdge$write_1__SEL_2,
       MUX_wci_illegalEdge$write_1__VAL_2,
       MUX_wci_respF_q_0$write_1__SEL_2,
       MUX_wci_respF_q_1$write_1__SEL_2,
       MUX_wide16Fa$enq_1__SEL_1,
       MUX_wmemi_dhF_q_0$write_1__SEL_2,
       MUX_wmemi_dhF_q_1$write_1__SEL_2,
       MUX_wmemi_reqF_q_0$write_1__SEL_2,
       MUX_wmemi_reqF_q_1$write_1__SEL_2,
       MUX_wrtSerStage$write_1__SEL_1,
       MUX_wrtSerStage_1$write_1__SEL_1,
       MUX_wrtSerStage_2$write_1__SEL_1,
       MUX_wrtSerStage_3$write_1__SEL_1,
       MUX_wsiM_reqFifo_q_0$write_1__SEL_2,
       MUX_wsiM_reqFifo_q_1$write_1__SEL_2,
       MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2,
       MUX_wsiS_reqFifo_levelsValid$write_1__SEL_3;
  // remaining internal signals
  reg [63 : 0] v__h22096, v__h2670, v__h2817, v__h3716;
  reg [31 : 0] x_data__h22228;
  reg CASE_wrtSerPos_0b1_0_1_1_1_2_1_3_0b1__q1,
      CASE_wrtSerPos_NOT_wrtSerPos_EQ_3_OR_wide16Fa_ETC__q2;
  wire [255 : 0] x__h15073, x__h17993;
  wire [127 : 0] IF_wrtSerPos_80_EQ_2_83_THEN_0x0_ELSE_mesgWF_w_ETC___d423,
		 IF_wrtSerPos_80_EQ_2_83_THEN_0x0_ELSE_metaWF_f_ETC___d446,
		 x__h18132,
		 x__h18163,
		 x__h18794,
		 x__h18821;
  wire [35 : 0] addr__h19478, addr__h19647;
  wire [31 : 0] delayStatus__h21797,
		rdat__h22255,
		rdat__h22261,
		rdat__h22267,
		rdat__h22273,
		rdat__h22397,
		rdat__h22411,
		rdat__h22419,
		rdat__h22425,
		rdat__h22439,
		rdat__h22447,
		rdat__h22453,
		rdat__h22459,
		rdat__h22465,
		rdat__h22471,
		rdat__h22482,
		rdat__h22493,
		rdat__h22504,
		rdat__h22525,
		rdat__h22580,
		rdat__h22589,
		rdat__h22598,
		rdat__h22607,
		v__h20254,
		x_byteEn__h19977;
  wire [26 : 0] x__h19536, x__h19692;
  wire [23 : 0] btm__h17027, x__h22277;
  wire [13 : 0] mesgLengthSoFar_05_PLUS_1___d985;
  wire [12 : 0] x__h14965;
  wire [11 : 0] x_burstLength__h19976;
  wire [1 : 0] wrtSerPos_80_PLUS_1___d984;
  wire IF_wrtSerPos_80_EQ_0_81_OR_wrtSerPos_80_EQ_1_8_ETC___d399,
       NOT_mesgWF_rRdPtr_69_EQ_mesgWF_rWrPtr_71_74___d175,
       NOT_mesgWF_rRdPtr_69_PLUS_2048_70_EQ_mesgWF_rW_ETC___d173,
       NOT_wrtSerPos_80_EQ_3_87_88_AND_NOT_metaWF_fir_ETC___d434,
       bytesWritten_6_ULT_dlyHoldoffBytes_6___d908,
       cyclesPassed_54_ULT_dlyHoldoffCycles_8___d903,
       dlyWordsStored_value_26_SLE_0_49_OR_bytesWritt_ETC___d164,
       dlyWordsStored_value_26_SLE_0___d909,
       dlyWordsStored_value_26_SLT_8388608___d165,
       mesgRF_i_notFull__74_AND_NOT_rdSerEmpty_75_76__ETC___d285,
       metaRF_i_notFull__18_AND_NOT_rdSerEmpty_75_76__ETC___d319,
       wci_cState_9_EQ_2_0_AND_dlyCtrl_4_BITS_3_TO_0__ETC___d352,
       wsiS_reqFifo_notFull__05_AND_wsiS_burstKind_85_ETC___d725;
  // action method wciS0_mCmd
  assign CAN_FIRE_wciS0_mCmd = 1'd1 ;
  assign WILL_FIRE_wciS0_mCmd = 1'd1 ;
  // action method wciS0_mAddrSpace
  assign CAN_FIRE_wciS0_mAddrSpace = 1'd1 ;
  assign WILL_FIRE_wciS0_mAddrSpace = 1'd1 ;
  // action method wciS0_mByteEn
  assign CAN_FIRE_wciS0_mByteEn = 1'd1 ;
  assign WILL_FIRE_wciS0_mByteEn = 1'd1 ;
  // action method wciS0_mAddr
  assign CAN_FIRE_wciS0_mAddr = 1'd1 ;
  assign WILL_FIRE_wciS0_mAddr = 1'd1 ;
  // action method wciS0_mData
  assign CAN_FIRE_wciS0_mData = 1'd1 ;
  assign WILL_FIRE_wciS0_mData = 1'd1 ;
  // value method wciS0_sResp
  assign wciS0_SResp = wci_respF_q_0[33:32] ;
  // value method wciS0_sData
  assign wciS0_SData = wci_respF_q_0[31:0] ;
  // value method wciS0_sThreadBusy
  assign wciS0_SThreadBusy = wci_reqF_countReg > 2'd1 || wci_isReset$VAL ;
  // value method wciS0_sFlag
  assign wciS0_SFlag = { 1'd1, wci_sFlagReg } ;
  // action method wciS0_mFlag
  assign CAN_FIRE_wciS0_mFlag = 1'd1 ;
  assign WILL_FIRE_wciS0_mFlag = 1'd1 ;
  // action method wsiS1_mCmd
  assign CAN_FIRE_wsiS1_mCmd = 1'd1 ;
  assign WILL_FIRE_wsiS1_mCmd = 1'd1 ;
  // action method wsiS1_mReqLast
  assign CAN_FIRE_wsiS1_mReqLast = 1'd1 ;
  assign WILL_FIRE_wsiS1_mReqLast = wsiS1_MReqLast ;
  // action method wsiS1_mBurstPrecise
  assign CAN_FIRE_wsiS1_mBurstPrecise = 1'd1 ;
  assign WILL_FIRE_wsiS1_mBurstPrecise = wsiS1_MBurstPrecise ;
  // action method wsiS1_mBurstLength
  assign CAN_FIRE_wsiS1_mBurstLength = 1'd1 ;
  assign WILL_FIRE_wsiS1_mBurstLength = 1'd1 ;
  // action method wsiS1_mData
  assign CAN_FIRE_wsiS1_mData = 1'd1 ;
  assign WILL_FIRE_wsiS1_mData = 1'd1 ;
  // action method wsiS1_mByteEn
  assign CAN_FIRE_wsiS1_mByteEn = 1'd1 ;
  assign WILL_FIRE_wsiS1_mByteEn = 1'd1 ;
  // action method wsiS1_mReqInfo
  assign CAN_FIRE_wsiS1_mReqInfo = 1'd1 ;
  assign WILL_FIRE_wsiS1_mReqInfo = 1'd1 ;
  // action method wsiS1_mDataInfo
  assign CAN_FIRE_wsiS1_mDataInfo = 1'd1 ;
  assign WILL_FIRE_wsiS1_mDataInfo = 1'd1 ;
  // value method wsiS1_sThreadBusy
  assign wsiS1_SThreadBusy =
	     !CAN_FIRE_RL_wsiS_backpressure || wsiS_sThreadBusy_dw$wget ;
  // value method wsiS1_sReset_n
  assign wsiS1_SReset_n = !wsiS_isReset$VAL && wsiS_operateD ;
  // action method wsiS1_mReset_n
  assign CAN_FIRE_wsiS1_mReset_n = 1'd1 ;
  assign WILL_FIRE_wsiS1_mReset_n = wsiS1_MReset_n ;
  // value method wsiM1_mCmd
  assign wsiM1_MCmd = wsiM_sThreadBusy_d ? 3'd0 : wsiM_reqFifo_q_0[312:310] ;
  // value method wsiM1_mReqLast
  assign wsiM1_MReqLast = !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[309] ;
  // value method wsiM1_mBurstPrecise
  assign wsiM1_MBurstPrecise = !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[308] ;
  // value method wsiM1_mBurstLength
  assign wsiM1_MBurstLength =
	     wsiM_sThreadBusy_d ? 12'd0 : wsiM_reqFifo_q_0[307:296] ;
  // value method wsiM1_mData
  assign wsiM1_MData = wsiM_reqFifo_q_0[295:40] ;
  // value method wsiM1_mByteEn
  assign wsiM1_MByteEn = wsiM_reqFifo_q_0[39:8] ;
  // value method wsiM1_mReqInfo
  assign wsiM1_MReqInfo = wsiM_sThreadBusy_d ? 8'd0 : wsiM_reqFifo_q_0[7:0] ;
  // action method wsiM1_sThreadBusy
  assign CAN_FIRE_wsiM1_sThreadBusy = 1'd1 ;
  assign WILL_FIRE_wsiM1_sThreadBusy = wsiM1_SThreadBusy ;
  // value method wsiM1_mReset_n
  assign wsiM1_MReset_n = !wsiM_isReset$VAL && wsiM_operateD ;
  // action method wsiM1_sReset_n
  assign CAN_FIRE_wsiM1_sReset_n = 1'd1 ;
  assign WILL_FIRE_wsiM1_sReset_n = wsiM1_SReset_n ;
  // value method wmemiM_mCmd
  assign wmemiM_MCmd = wmemi_reqF_q_0[51:49] ;
  // value method wmemiM_mReqLast
  assign wmemiM_MReqLast = wmemi_reqF_q_0[48] ;
  // value method wmemiM_mAddr
  assign wmemiM_MAddr = wmemi_reqF_q_0[47:12] ;
  // value method wmemiM_mBurstLength
  assign wmemiM_MBurstLength = wmemi_reqF_q_0[11:0] ;
  // value method wmemiM_mDataValid
  assign wmemiM_MDataValid = wmemi_dhF_q_0[145] ;
  // value method wmemiM_mDataLast
  assign wmemiM_MDataLast = wmemi_dhF_q_0[144] ;
  // value method wmemiM_mData
  assign wmemiM_MData = wmemi_dhF_q_0[143:16] ;
  // value method wmemiM_mDataByteEn
  assign wmemiM_MDataByteEn = wmemi_dhF_q_0[15:0] ;
  // action method wmemiM_sResp
  assign CAN_FIRE_wmemiM_sResp = 1'd1 ;
  assign WILL_FIRE_wmemiM_sResp = 1'd1 ;
  // action method wmemiM_sRespLast
  assign CAN_FIRE_wmemiM_sRespLast = 1'd1 ;
  assign WILL_FIRE_wmemiM_sRespLast = wmemiM_SRespLast ;
  // action method wmemiM_sData
  assign CAN_FIRE_wmemiM_sData = 1'd1 ;
  assign WILL_FIRE_wmemiM_sData = 1'd1 ;
  // action method wmemiM_sCmdAccept
  assign CAN_FIRE_wmemiM_sCmdAccept = 1'd1 ;
  assign WILL_FIRE_wmemiM_sCmdAccept = wmemiM_SCmdAccept ;
  // action method wmemiM_sDataAccept
  assign CAN_FIRE_wmemiM_sDataAccept = 1'd1 ;
  assign WILL_FIRE_wmemiM_sDataAccept = wmemiM_SDataAccept ;
  // value method wmemiM_mReset_n
  assign wmemiM_MReset_n = !wmemi_isReset$VAL && wmemi_operateD ;
  // submodule mesgRF
  SizedFIFO #(.p1width(32'd256),
	      .p2depth(32'd15),
	      .p3cntr_width(32'd4),
	      .guarded(32'd1)) mesgRF(.RST_N(wciS0_MReset_n),
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
	  .DATA_WIDTH(32'd256),
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
	      .guarded(32'd1)) metaRF(.RST_N(wciS0_MReset_n),
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
	      .guarded(32'd1)) metaWF(.RST_N(wciS0_MReset_n),
				      .CLK(wciS0_Clk),
				      .D_IN(metaWF$D_IN),
				      .ENQ(metaWF$ENQ),
				      .DEQ(metaWF$DEQ),
				      .CLR(metaWF$CLR),
				      .D_OUT(metaWF$D_OUT),
				      .FULL_N(metaWF$FULL_N),
				      .EMPTY_N(metaWF$EMPTY_N));
  // submodule wci_isReset
  ResetToBool wci_isReset(.RST(wciS0_MReset_n), .VAL(wci_isReset$VAL));
  // submodule wci_reqF
  SizedFIFO #(.p1width(32'd60),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wci_reqF(.RST_N(wciS0_MReset_n),
					.CLK(wciS0_Clk),
					.D_IN(wci_reqF$D_IN),
					.ENQ(wci_reqF$ENQ),
					.DEQ(wci_reqF$DEQ),
					.CLR(wci_reqF$CLR),
					.D_OUT(wci_reqF$D_OUT),
					.FULL_N(),
					.EMPTY_N(wci_reqF$EMPTY_N));
  // submodule wide16Fa
  SizedFIFO #(.p1width(32'd128),
	      .p2depth(32'd15),
	      .p3cntr_width(32'd4),
	      .guarded(32'd1)) wide16Fa(.RST_N(wciS0_MReset_n),
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
	      .guarded(32'd1)) wide16Fb(.RST_N(wciS0_MReset_n),
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
	      .guarded(32'd1)) wide16Fc(.RST_N(wciS0_MReset_n),
					.CLK(wciS0_Clk),
					.D_IN(wide16Fc$D_IN),
					.ENQ(wide16Fc$ENQ),
					.DEQ(wide16Fc$DEQ),
					.CLR(wide16Fc$CLR),
					.D_OUT(wide16Fc$D_OUT),
					.FULL_N(wide16Fc$FULL_N),
					.EMPTY_N(wide16Fc$EMPTY_N));
  // submodule wmemi_isReset
  ResetToBool wmemi_isReset(.RST(wciS0_MReset_n), .VAL(wmemi_isReset$VAL));
  // submodule wmemi_respF
  FIFO2 #(.width(32'd131),
	  .guarded(32'd1)) wmemi_respF(.RST_N(wciS0_MReset_n),
				       .CLK(wciS0_Clk),
				       .D_IN(wmemi_respF$D_IN),
				       .ENQ(wmemi_respF$ENQ),
				       .DEQ(wmemi_respF$DEQ),
				       .CLR(wmemi_respF$CLR),
				       .D_OUT(wmemi_respF$D_OUT),
				       .FULL_N(wmemi_respF$FULL_N),
				       .EMPTY_N(wmemi_respF$EMPTY_N));
  // submodule wsiM_isReset
  ResetToBool wsiM_isReset(.RST(wciS0_MReset_n), .VAL(wsiM_isReset$VAL));
  // submodule wsiS_isReset
  ResetToBool wsiS_isReset(.RST(wciS0_MReset_n), .VAL(wsiS_isReset$VAL));
  // submodule wsiS_reqFifo
  SizedFIFO #(.p1width(32'd313),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wsiS_reqFifo(.RST_N(wciS0_MReset_n),
					    .CLK(wciS0_Clk),
					    .D_IN(wsiS_reqFifo$D_IN),
					    .ENQ(wsiS_reqFifo$ENQ),
					    .DEQ(wsiS_reqFifo$DEQ),
					    .CLR(wsiS_reqFifo$CLR),
					    .D_OUT(wsiS_reqFifo$D_OUT),
					    .FULL_N(wsiS_reqFifo$FULL_N),
					    .EMPTY_N(wsiS_reqFifo$EMPTY_N));
  // rule RL_wsiS_backpressure
  assign CAN_FIRE_RL_wsiS_backpressure =
	     wsiS_reqFifo_levelsValid && wsiS_operateD && wsiS_peerIsReady ;
  assign WILL_FIRE_RL_wsiS_backpressure = CAN_FIRE_RL_wsiS_backpressure ;
  // rule RL_wci_request_decode
  assign CAN_FIRE_RL_wci_request_decode = wci_reqF$EMPTY_N ;
  assign WILL_FIRE_RL_wci_request_decode = wci_reqF$EMPTY_N ;
  // rule RL_wci_ctl_op_start
  assign CAN_FIRE_RL_wci_ctl_op_start =
	     wci_reqF$EMPTY_N && wci_wci_ctrl_pw$whas ;
  assign WILL_FIRE_RL_wci_ctl_op_start =
	     CAN_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_ctrl_EiI
  assign CAN_FIRE_RL_wci_ctrl_EiI =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd0 &&
	     wci_reqF$D_OUT[36:34] == 3'd0 ;
  assign WILL_FIRE_RL_wci_ctrl_EiI = CAN_FIRE_RL_wci_ctrl_EiI ;
  // rule RL_wci_ctrl_OrE
  assign CAN_FIRE_RL_wci_ctrl_OrE =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd2 &&
	     wci_reqF$D_OUT[36:34] == 3'd3 ;
  assign WILL_FIRE_RL_wci_ctrl_OrE = CAN_FIRE_RL_wci_ctrl_OrE ;
  // rule RL_wmemi_update_statusR
  assign CAN_FIRE_RL_wmemi_update_statusR = 1'd1 ;
  assign WILL_FIRE_RL_wmemi_update_statusR = 1'd1 ;
  // rule RL_wci_respF_deq
  assign CAN_FIRE_RL_wci_respF_deq = 1'd1 ;
  assign WILL_FIRE_RL_wci_respF_deq = 1'd1 ;
  // rule RL_wci_sThreadBusy_reg
  assign CAN_FIRE_RL_wci_sThreadBusy_reg = 1'd1 ;
  assign WILL_FIRE_RL_wci_sThreadBusy_reg = 1'd1 ;
  // rule RL_wci_sFlagReg__dreg_update
  assign CAN_FIRE_RL_wci_sFlagReg__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wci_sFlagReg__dreg_update = 1'd1 ;
  // rule RL_wsi_Es_doAlways
  assign CAN_FIRE_RL_wsi_Es_doAlways = 1'd1 ;
  assign WILL_FIRE_RL_wsi_Es_doAlways = 1'd1 ;
  // rule RL_wsiS_update_statusR
  assign CAN_FIRE_RL_wsiS_update_statusR = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_update_statusR = 1'd1 ;
  // rule RL_wsiS_ext_status_assign
  assign CAN_FIRE_RL_wsiS_ext_status_assign = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_ext_status_assign = 1'd1 ;
  // rule RL_wsiS_inc_tBusyCount
  assign CAN_FIRE_RL_wsiS_inc_tBusyCount =
	     wsiS_operateD && wsiS_peerIsReady &&
	     (!CAN_FIRE_RL_wsiS_backpressure || wsiS_sThreadBusy_dw$wget) ;
  assign WILL_FIRE_RL_wsiS_inc_tBusyCount = CAN_FIRE_RL_wsiS_inc_tBusyCount ;
  // rule RL_wsiS_reqFifo_enq
  assign CAN_FIRE_RL_wsiS_reqFifo_enq =
	     wsiS_operateD && wsiS_peerIsReady &&
	     wsiS_wsiReq$wget[312:310] == 3'd1 ;
  assign WILL_FIRE_RL_wsiS_reqFifo_enq = CAN_FIRE_RL_wsiS_reqFifo_enq ;
  // rule RL_wsiS_peerIsReady__dreg_update
  assign CAN_FIRE_RL_wsiS_peerIsReady__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_peerIsReady__dreg_update = 1'd1 ;
  // rule RL_wsiM_update_statusR
  assign CAN_FIRE_RL_wsiM_update_statusR = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_update_statusR = 1'd1 ;
  // rule RL_wsiM_ext_status_assign
  assign CAN_FIRE_RL_wsiM_ext_status_assign = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_ext_status_assign = 1'd1 ;
  // rule RL_wci_cfrd
  assign CAN_FIRE_RL_wci_cfrd =
	     wci_respF_c_r != 2'd2 && wci_reqF$EMPTY_N &&
	     wci_wci_cfrd_pw$whas ;
  assign WILL_FIRE_RL_wci_cfrd =
	     CAN_FIRE_RL_wci_cfrd && !WILL_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wsiM_inc_tBusyCount
  assign CAN_FIRE_RL_wsiM_inc_tBusyCount =
	     wsiM_operateD && wsiM_peerIsReady && wsiM_sThreadBusy_d ;
  assign WILL_FIRE_RL_wsiM_inc_tBusyCount = CAN_FIRE_RL_wsiM_inc_tBusyCount ;
  // rule RL_wsiM_reqFifo_deq
  assign CAN_FIRE_RL_wsiM_reqFifo_deq =
	     wsiM_reqFifo_c_r != 2'd0 && !wsiM_sThreadBusy_d ;
  assign WILL_FIRE_RL_wsiM_reqFifo_deq = CAN_FIRE_RL_wsiM_reqFifo_deq ;
  // rule RL_wsiM_sThreadBusy_reg
  assign CAN_FIRE_RL_wsiM_sThreadBusy_reg = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_sThreadBusy_reg = 1'd1 ;
  // rule RL_wsiM_peerIsReady__dreg_update
  assign CAN_FIRE_RL_wsiM_peerIsReady__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_peerIsReady__dreg_update = 1'd1 ;
  // rule RL_wmrd_mesgBodyResponse
  assign CAN_FIRE_RL_wmrd_mesgBodyResponse =
	     wsiM_reqFifo_c_r != 2'd2 && mesgRF$EMPTY_N &&
	     wci_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 &&
	     unrollCnt != 16'd0 ;
  assign WILL_FIRE_RL_wmrd_mesgBodyResponse =
	     CAN_FIRE_RL_wmrd_mesgBodyResponse ;
  // rule RL_wmrd_mesgBegin
  assign CAN_FIRE_RL_wmrd_mesgBegin =
	     metaRF$EMPTY_N && wci_cState == 3'd2 && dlyCtrl[3:0] == 4'h7 &&
	     unrollCnt == 16'd0 ;
  assign WILL_FIRE_RL_wmrd_mesgBegin = CAN_FIRE_RL_wmrd_mesgBegin ;
  // rule RL_wsipass_doMessagePush
  assign CAN_FIRE_RL_wsipass_doMessagePush =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_3 ;
  assign WILL_FIRE_RL_wsipass_doMessagePush =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_3 ;
  // rule RL_wsiM_reqFifo_both
  assign CAN_FIRE_RL_wsiM_reqFifo_both =
	     ((wsiM_reqFifo_c_r == 2'd1) ?
		wsiM_reqFifo_x_wire$whas :
		wsiM_reqFifo_c_r != 2'd2 || wsiM_reqFifo_x_wire$whas) &&
	     CAN_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_enqueueing$whas ;
  assign WILL_FIRE_RL_wsiM_reqFifo_both = CAN_FIRE_RL_wsiM_reqFifo_both ;
  // rule RL_wci_Es_doAlways_Req
  assign CAN_FIRE_RL_wci_Es_doAlways_Req = 1'd1 ;
  assign WILL_FIRE_RL_wci_Es_doAlways_Req = 1'd1 ;
  // rule RL_wci_reqF_enq
  assign CAN_FIRE_RL_wci_reqF_enq = wci_wciReq$wget[59:57] != 3'd0 ;
  assign WILL_FIRE_RL_wci_reqF_enq = CAN_FIRE_RL_wci_reqF_enq ;
  // rule RL_wmemi_Em_doAlways
  assign CAN_FIRE_RL_wmemi_Em_doAlways = 1'd1 ;
  assign WILL_FIRE_RL_wmemi_Em_doAlways = 1'd1 ;
  // rule RL_rdSer_sync
  assign CAN_FIRE_RL_rdSer_sync =
	     wci_cState == 3'd2 && dlyCtrl[3:0] == 4'h7 && rdSyncWord ;
  assign WILL_FIRE_RL_rdSer_sync = CAN_FIRE_RL_rdSer_sync ;
  // rule RL_rdSer_body
  assign CAN_FIRE_RL_rdSer_body =
	     mesgRF_i_notFull__74_AND_NOT_rdSerEmpty_75_76__ETC___d285 &&
	     wci_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 &&
	     rdSerUnroll != 16'd0 &&
	     !rdSyncWord ;
  assign WILL_FIRE_RL_rdSer_body = CAN_FIRE_RL_rdSer_body ;
  // rule RL_rdSer_begin
  assign CAN_FIRE_RL_rdSer_begin =
	     metaRF_i_notFull__18_AND_NOT_rdSerEmpty_75_76__ETC___d319 &&
	     wci_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 &&
	     rdSerUnroll == 16'd0 &&
	     !rdSyncWord ;
  assign WILL_FIRE_RL_rdSer_begin = CAN_FIRE_RL_rdSer_begin ;
  // rule RL_delay_Fb2Fc
  assign CAN_FIRE_RL_delay_Fb2Fc =
	     wide16Fc$FULL_N && wide16Fb$EMPTY_N && wci_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 ;
  assign WILL_FIRE_RL_delay_Fb2Fc = CAN_FIRE_RL_delay_Fb2Fc ;
  // rule RL_delay_read_req
  assign CAN_FIRE_RL_delay_read_req =
	     wmemi_reqF_c_r != 2'd2 && wmemi_operateD && wmemi_peerIsReady &&
	     wci_cState_9_EQ_2_0_AND_dlyCtrl_4_BITS_3_TO_0__ETC___d352 &&
	     (dlyReadCredit_value ^ 8'h80) > 8'd128 &&
	     wsiM_reqFifo_c_r != 2'd2 ;
  assign WILL_FIRE_RL_delay_read_req = CAN_FIRE_RL_delay_read_req ;
  // rule RL_delay_write_req
  assign CAN_FIRE_RL_delay_write_req =
	     wmemi_reqF_c_r != 2'd2 && wmemi_dhF_c_r != 2'd2 &&
	     wmemi_operateD &&
	     wmemi_peerIsReady &&
	     wide16Fa$EMPTY_N &&
	     wci_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 &&
	     dlyWordsStored_value_26_SLE_0_49_OR_bytesWritt_ETC___d164 &&
	     dlyWordsStored_value_26_SLT_8388608___d165 ;
  assign WILL_FIRE_RL_delay_write_req =
	     CAN_FIRE_RL_delay_write_req && !WILL_FIRE_RL_delay_read_req ;
  // rule RL_wsiM_reqFifo_decCtr
  assign CAN_FIRE_RL_wsiM_reqFifo_decCtr =
	     CAN_FIRE_RL_wsiM_reqFifo_deq && !wsiM_reqFifo_enqueueing$whas ;
  assign WILL_FIRE_RL_wsiM_reqFifo_decCtr = CAN_FIRE_RL_wsiM_reqFifo_decCtr ;
  // rule RL_wsiM_reqFifo_incCtr
  assign CAN_FIRE_RL_wsiM_reqFifo_incCtr =
	     ((wsiM_reqFifo_c_r == 2'd0) ?
		wsiM_reqFifo_x_wire$whas :
		wsiM_reqFifo_c_r != 2'd1 || wsiM_reqFifo_x_wire$whas) &&
	     wsiM_reqFifo_enqueueing$whas &&
	     !CAN_FIRE_RL_wsiM_reqFifo_deq ;
  assign WILL_FIRE_RL_wsiM_reqFifo_incCtr = CAN_FIRE_RL_wsiM_reqFifo_incCtr ;
  // rule RL_operating_actions
  assign CAN_FIRE_RL_operating_actions = wci_cState == 3'd2 ;
  assign WILL_FIRE_RL_operating_actions = wci_cState == 3'd2 ;
  // rule RL_wsiS_operateD__dreg_update
  assign CAN_FIRE_RL_wsiS_operateD__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_operateD__dreg_update = 1'd1 ;
  // rule RL_wsiM_operateD__dreg_update
  assign CAN_FIRE_RL_wsiM_operateD__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_operateD__dreg_update = 1'd1 ;
  // rule RL_wrtSer_begin
  assign CAN_FIRE_RL_wrtSer_begin =
	     metaWF$EMPTY_N &&
	     NOT_wrtSerPos_80_EQ_3_87_88_AND_NOT_metaWF_fir_ETC___d434 &&
	     wci_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 &&
	     wrtSerUnroll == 16'd0 ;
  assign WILL_FIRE_RL_wrtSer_begin = CAN_FIRE_RL_wrtSer_begin ;
  // rule RL_wmwt_mesg_ingress
  assign CAN_FIRE_RL_wmwt_mesg_ingress =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;
  assign WILL_FIRE_RL_wmwt_mesg_ingress =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;
  // rule RL_wsiS_reqFifo_reset
  assign CAN_FIRE_RL_wsiS_reqFifo_reset =
	     wsiS_reqFifo_r_enq$whas || wsiS_reqFifo_r_deq$whas ;
  assign WILL_FIRE_RL_wsiS_reqFifo_reset = CAN_FIRE_RL_wsiS_reqFifo_reset ;
  // rule RL_wsiS_reqFifo__updateLevelCounter
  assign CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter =
	     wsiS_reqFifo_r_enq$whas != wsiS_reqFifo_r_deq$whas ;
  assign WILL_FIRE_RL_wsiS_reqFifo__updateLevelCounter =
	     CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter ;
  // rule RL_cycles_passed_count
  assign CAN_FIRE_RL_cycles_passed_count = wsiS_statusR[0] ;
  assign WILL_FIRE_RL_cycles_passed_count = CAN_FIRE_RL_cycles_passed_count ;
  // rule RL_dlyReadCredit_accumulate
  assign CAN_FIRE_RL_dlyReadCredit_accumulate = 1'd1 ;
  assign WILL_FIRE_RL_dlyReadCredit_accumulate = 1'd1 ;
  // rule RL_dlyWordsStored_accumulate
  assign CAN_FIRE_RL_dlyWordsStored_accumulate = 1'd1 ;
  assign WILL_FIRE_RL_dlyWordsStored_accumulate = 1'd1 ;
  // rule RL_mesgWF_portB_read_data
  assign CAN_FIRE_RL_mesgWF_portB_read_data = 1'd1 ;
  assign WILL_FIRE_RL_mesgWF_portB_read_data = 1'd1 ;
  // rule RL_wrtSer_body
  assign CAN_FIRE_RL_wrtSer_body =
	     NOT_mesgWF_rRdPtr_69_EQ_mesgWF_rWrPtr_71_74___d175 &&
	     IF_wrtSerPos_80_EQ_0_81_OR_wrtSerPos_80_EQ_1_8_ETC___d399 &&
	     wci_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 &&
	     wrtSerUnroll != 16'd0 ;
  assign WILL_FIRE_RL_wrtSer_body = CAN_FIRE_RL_wrtSer_body ;
  // rule RL_dlyReadyToWrite_accumulate
  assign CAN_FIRE_RL_dlyReadyToWrite_accumulate = 1'd1 ;
  assign WILL_FIRE_RL_dlyReadyToWrite_accumulate = 1'd1 ;
  // rule RL_wci_ctrl_IsO
  assign CAN_FIRE_RL_wci_ctrl_IsO =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd1 &&
	     wci_reqF$D_OUT[36:34] == 3'd1 ;
  assign WILL_FIRE_RL_wci_ctrl_IsO = CAN_FIRE_RL_wci_ctrl_IsO ;
  // rule RL_mesgWF_portB
  assign CAN_FIRE_RL_mesgWF_portB = 1'd1 ;
  assign WILL_FIRE_RL_mesgWF_portB = 1'd1 ;
  // rule RL_mesgWF_portA
  assign CAN_FIRE_RL_mesgWF_portA = 1'd1 ;
  assign WILL_FIRE_RL_mesgWF_portA = 1'd1 ;
  // rule RL_wmemi_dhF_deq
  assign CAN_FIRE_RL_wmemi_dhF_deq = wmemiM_SDataAccept ;
  assign WILL_FIRE_RL_wmemi_dhF_deq = wmemiM_SDataAccept ;
  // rule RL_wmemi_respAdvance
  assign CAN_FIRE_RL_wmemi_respAdvance =
	     wmemi_operateD && wmemi_peerIsReady &&
	     wmemi_wmemiResponse$wget[130:129] != 2'd0 ;
  assign WILL_FIRE_RL_wmemi_respAdvance = CAN_FIRE_RL_wmemi_respAdvance ;
  // rule RL_wmemi_peerIsReady__dreg_update
  assign CAN_FIRE_RL_wmemi_peerIsReady__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wmemi_peerIsReady__dreg_update = 1'd1 ;
  // rule RL_wmemi_operateD__dreg_update
  assign CAN_FIRE_RL_wmemi_operateD__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wmemi_operateD__dreg_update = 1'd1 ;
  // rule RL_delay_read_resp
  assign CAN_FIRE_RL_delay_read_resp =
	     wmemi_respF$EMPTY_N && wide16Fb$FULL_N && wci_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 ;
  assign WILL_FIRE_RL_delay_read_resp = CAN_FIRE_RL_delay_read_resp ;
  // rule RL_wci_ctl_op_complete
  assign CAN_FIRE_RL_wci_ctl_op_complete =
	     wci_respF_c_r != 2'd2 && wci_ctlOpActive && wci_ctlAckReg ;
  assign WILL_FIRE_RL_wci_ctl_op_complete = CAN_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_cfwr
  assign CAN_FIRE_RL_wci_cfwr =
	     wci_respF_c_r != 2'd2 && wci_reqF$EMPTY_N &&
	     wci_wci_cfwr_pw$whas ;
  assign WILL_FIRE_RL_wci_cfwr =
	     CAN_FIRE_RL_wci_cfwr && !WILL_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_ctlAckReg__dreg_update
  assign CAN_FIRE_RL_wci_ctlAckReg__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wci_ctlAckReg__dreg_update = 1'd1 ;
  // rule RL_wci_respF_both
  assign CAN_FIRE_RL_wci_respF_both =
	     ((wci_respF_c_r == 2'd1) ?
		wci_respF_x_wire$whas :
		wci_respF_c_r != 2'd2 || wci_respF_x_wire$whas) &&
	     wci_respF_c_r != 2'd0 &&
	     wci_respF_enqueueing$whas ;
  assign WILL_FIRE_RL_wci_respF_both = CAN_FIRE_RL_wci_respF_both ;
  // rule RL_wci_respF_decCtr
  assign CAN_FIRE_RL_wci_respF_decCtr =
	     wci_respF_c_r != 2'd0 && !wci_respF_enqueueing$whas ;
  assign WILL_FIRE_RL_wci_respF_decCtr = CAN_FIRE_RL_wci_respF_decCtr ;
  // rule RL_wci_respF_incCtr
  assign CAN_FIRE_RL_wci_respF_incCtr =
	     ((wci_respF_c_r == 2'd0) ?
		wci_respF_x_wire$whas :
		wci_respF_c_r != 2'd1 || wci_respF_x_wire$whas) &&
	     wci_respF_enqueueing$whas &&
	     !(wci_respF_c_r != 2'd0) ;
  assign WILL_FIRE_RL_wci_respF_incCtr = CAN_FIRE_RL_wci_respF_incCtr ;
  // rule RL_wci_reqF__updateLevelCounter
  assign CAN_FIRE_RL_wci_reqF__updateLevelCounter =
	     (wci_wciReq$wget[59:57] != 3'd0) != wci_reqF_r_deq$whas ;
  assign WILL_FIRE_RL_wci_reqF__updateLevelCounter =
	     CAN_FIRE_RL_wci_reqF__updateLevelCounter ;
  // rule RL_wmemi_reqF_deq
  assign CAN_FIRE_RL_wmemi_reqF_deq = wmemiM_SCmdAccept ;
  assign WILL_FIRE_RL_wmemi_reqF_deq = wmemiM_SCmdAccept ;
  // rule RL_wmemi_dhF_both
  assign CAN_FIRE_RL_wmemi_dhF_both =
	     ((wmemi_dhF_c_r == 2'd1) ?
		WILL_FIRE_RL_delay_write_req :
		wmemi_dhF_c_r != 2'd2 || WILL_FIRE_RL_delay_write_req) &&
	     wmemi_dhF_dequeueing$whas &&
	     WILL_FIRE_RL_delay_write_req ;
  assign WILL_FIRE_RL_wmemi_dhF_both = CAN_FIRE_RL_wmemi_dhF_both ;
  // rule RL_wmemi_dhF_decCtr
  assign CAN_FIRE_RL_wmemi_dhF_decCtr =
	     wmemi_dhF_dequeueing$whas && !WILL_FIRE_RL_delay_write_req ;
  assign WILL_FIRE_RL_wmemi_dhF_decCtr = CAN_FIRE_RL_wmemi_dhF_decCtr ;
  // rule RL_wmemi_dhF_incCtr
  assign CAN_FIRE_RL_wmemi_dhF_incCtr =
	     ((wmemi_dhF_c_r == 2'd0) ?
		WILL_FIRE_RL_delay_write_req :
		wmemi_dhF_c_r != 2'd1 || WILL_FIRE_RL_delay_write_req) &&
	     WILL_FIRE_RL_delay_write_req &&
	     !wmemi_dhF_dequeueing$whas ;
  assign WILL_FIRE_RL_wmemi_dhF_incCtr = CAN_FIRE_RL_wmemi_dhF_incCtr ;
  // rule RL_wmemi_reqF_both
  assign CAN_FIRE_RL_wmemi_reqF_both =
	     ((wmemi_reqF_c_r == 2'd1) ?
		wmemi_reqF_x_wire$whas :
		wmemi_reqF_c_r != 2'd2 || wmemi_reqF_x_wire$whas) &&
	     wmemi_reqF_dequeueing$whas &&
	     wmemi_reqF_enqueueing$whas ;
  assign WILL_FIRE_RL_wmemi_reqF_both = CAN_FIRE_RL_wmemi_reqF_both ;
  // rule RL_wmemi_reqF_incCtr
  assign CAN_FIRE_RL_wmemi_reqF_incCtr =
	     ((wmemi_reqF_c_r == 2'd0) ?
		wmemi_reqF_x_wire$whas :
		wmemi_reqF_c_r != 2'd1 || wmemi_reqF_x_wire$whas) &&
	     wmemi_reqF_enqueueing$whas &&
	     !wmemi_reqF_dequeueing$whas ;
  assign WILL_FIRE_RL_wmemi_reqF_incCtr = CAN_FIRE_RL_wmemi_reqF_incCtr ;
  // rule RL_wmemi_reqF_decCtr
  assign CAN_FIRE_RL_wmemi_reqF_decCtr =
	     wmemi_reqF_dequeueing$whas && !wmemi_reqF_enqueueing$whas ;
  assign WILL_FIRE_RL_wmemi_reqF_decCtr = CAN_FIRE_RL_wmemi_reqF_decCtr ;
  // inputs to muxes for submodule ports
  assign MUX_wci_illegalEdge$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge ;
  assign MUX_wci_illegalEdge$write_1__VAL_2 =
	     wci_reqF$D_OUT[36:34] != 3'd4 && wci_reqF$D_OUT[36:34] != 3'd5 &&
	     wci_reqF$D_OUT[36:34] != 3'd6 ;
  assign MUX_wci_respF_c_r$write_1__VAL_1 = wci_respF_c_r - 2'd1 ;
  assign MUX_wci_respF_c_r$write_1__VAL_2 = wci_respF_c_r + 2'd1 ;
  assign MUX_wci_respF_x_wire$wset_1__VAL_2 =
	     wci_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wci_illegalEdge$write_1__SEL_2 =
	     WILL_FIRE_RL_wci_ctl_op_start &&
	     (wci_reqF$D_OUT[36:34] == 3'd0 && wci_cState != 3'd0 ||
	      wci_reqF$D_OUT[36:34] == 3'd1 && wci_cState != 3'd1 &&
	      wci_cState != 3'd3 ||
	      wci_reqF$D_OUT[36:34] == 3'd2 && wci_cState != 3'd2 ||
	      wci_reqF$D_OUT[36:34] == 3'd3 && wci_cState != 3'd3 &&
	      wci_cState != 3'd2 &&
	      wci_cState != 3'd1 ||
	      wci_reqF$D_OUT[36:34] == 3'd4 ||
	      wci_reqF$D_OUT[36:34] == 3'd5 ||
	      wci_reqF$D_OUT[36:34] == 3'd6 ||
	      wci_reqF$D_OUT[36:34] == 3'd7) ;
  assign MUX_wci_respF_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_c_r == 2'd0 ;
  assign MUX_wci_respF_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_c_r == 2'd1 ;
  assign MUX_wsiS_reqFifo_levelsValid$write_1__SEL_3 =
	     wsiM_reqFifo_c_r != 2'd2 && wsiS_reqFifo$EMPTY_N &&
	     wci_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h0 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_1 = wsiM_reqFifo_c_r - 2'd1 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_2 = wsiM_reqFifo_c_r + 2'd1 ;
  assign MUX_wsiM_reqFifo_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ;
  assign MUX_unrollCnt$write_1__VAL_1 =
	     (metaRF$D_OUT[23:0] == 24'd0) ? 16'd1 : metaRF$D_OUT[20:5] ;
  assign MUX_unrollCnt$write_1__VAL_2 = unrollCnt - 16'd1 ;
  assign MUX_wsiM_reqFifo_x_wire$wset_1__VAL_1 =
	     { 3'd1,
	       unrollCnt == 16'd1,
	       1'd1,
	       x_burstLength__h19976,
	       mesgRF$D_OUT,
	       x_byteEn__h19977,
	       readMeta[31:24] } ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_2 =
	     WILL_FIRE_RL_wmrd_mesgBodyResponse ?
	       MUX_wsiM_reqFifo_x_wire$wset_1__VAL_1 :
	       wsiS_reqFifo$D_OUT ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_1 =
	     (wsiM_reqFifo_c_r == 2'd1) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_2 :
	       wsiM_reqFifo_q_1 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__VAL_1 =
	     (wsiM_reqFifo_c_r == 2'd2) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_2 :
	       313'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00 ;
  assign MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 =
	     NOT_mesgWF_rRdPtr_69_PLUS_2048_70_EQ_mesgWF_rW_ETC___d173 &&
	     wsiS_reqFifo$EMPTY_N &&
	     (!wsiS_reqFifo$D_OUT[309] || metaWF$FULL_N) &&
	     wci_cState == 3'd2 &&
	     dlyCtrl[3:0] == 4'h7 ;
  assign MUX_mesgRdCount$write_1__SEL_1 =
	     WILL_FIRE_RL_wmrd_mesgBodyResponse && unrollCnt == 16'd1 ;
  assign MUX_mesgWtCount$write_1__SEL_1 =
	     WILL_FIRE_RL_wmwt_mesg_ingress && wsiS_reqFifo$D_OUT[309] ;
  assign MUX_dlyRAG$write_1__VAL_1 = dlyRAG + 23'd1 ;
  assign MUX_dlyWAG$write_1__VAL_1 = dlyWAG + 23'd1 ;
  assign MUX_mesgRdCount$write_1__VAL_1 = mesgRdCount + 32'd1 ;
  assign MUX_mesgWtCount$write_1__VAL_1 = mesgWtCount + 32'd1 ;
  assign MUX_rdSerPos$write_1__VAL_1 = rdSerPos + 2'd1 ;
  assign MUX_rdSerUnroll$write_1__VAL_2 = rdSerUnroll - 16'd1 ;
  assign MUX_rdSyncWord$write_1__VAL_1 =
	     rdSerPos != 2'd3 && rdSerUnroll == 16'd1 ;
  assign MUX_wmemi_dhF_c_r$write_1__VAL_1 = wmemi_dhF_c_r - 2'd1 ;
  assign MUX_wmemi_dhF_c_r$write_1__VAL_2 = wmemi_dhF_c_r + 2'd1 ;
  assign MUX_wmemi_reqF_c_r$write_1__VAL_1 = wmemi_reqF_c_r - 2'd1 ;
  assign MUX_wmemi_dhF_q_0$write_1__VAL_2 =
	     { 2'd3, wide16Fa$D_OUT, 16'd65535 } ;
  assign MUX_wmemi_dhF_q_0$write_1__VAL_1 =
	     (wmemi_dhF_c_r == 2'd1) ?
	       MUX_wmemi_dhF_q_0$write_1__VAL_2 :
	       wmemi_dhF_q_1 ;
  assign MUX_wmemi_dhF_q_1$write_1__VAL_1 =
	     (wmemi_dhF_c_r == 2'd2) ?
	       MUX_wmemi_dhF_q_0$write_1__VAL_2 :
	       146'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ;
  assign MUX_wmemi_reqF_c_r$write_1__VAL_2 = wmemi_reqF_c_r + 2'd1 ;
  assign MUX_wmemi_reqF_x_wire$wset_1__VAL_1 = { 4'd5, addr__h19478, 12'd1 } ;
  assign MUX_wmemi_reqF_x_wire$wset_1__VAL_2 = { 4'd3, addr__h19647, 12'd1 } ;
  assign MUX_wrtSerUnroll$write_1__VAL_1 = wrtSerUnroll - 16'd1 ;
  assign MUX_wrtSerStage$write_1__SEL_1 =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd0 ;
  assign MUX_wrtSerStage_1$write_1__SEL_1 =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd1 ;
  assign MUX_wrtSerStage_2$write_1__SEL_1 =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd2 ;
  assign MUX_wrtSerStage_3$write_1__SEL_1 =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd3 ;
  assign MUX_rdSerEmpty$write_1__PSEL_1 =
	     WILL_FIRE_RL_rdSer_begin || WILL_FIRE_RL_rdSer_body ;
  assign MUX_rdSerEmpty$write_1__SEL_1 =
	     MUX_rdSerEmpty$write_1__PSEL_1 &&
	     (rdSerEmpty || rdSerPos == 2'd0) ;
  assign MUX_rdSyncWord$write_1__VAL_2 =
	     rdSerPos != 2'd3 && v__h20254[23:0] == 24'd0 ;
  assign MUX_wide16Fa$enq_1__SEL_1 =
	     WILL_FIRE_RL_wrtSer_begin &&
	     (wrtSerPos == 2'd3 || metaWF$D_OUT[23:0] == 24'd0) ;
  always@(wrtSerPos or
	  IF_wrtSerPos_80_EQ_2_83_THEN_0x0_ELSE_mesgWF_w_ETC___d423 or
	  x__h18132 or x__h18163)
  begin
    case (wrtSerPos)
      2'd0: MUX_wide16Fa$enq_1__VAL_2 = x__h18132;
      2'd1: MUX_wide16Fa$enq_1__VAL_2 = x__h18163;
      default: MUX_wide16Fa$enq_1__VAL_2 =
		   IF_wrtSerPos_80_EQ_2_83_THEN_0x0_ELSE_mesgWF_w_ETC___d423;
    endcase
  end
  always@(wrtSerPos or
	  IF_wrtSerPos_80_EQ_2_83_THEN_0x0_ELSE_metaWF_f_ETC___d446 or
	  x__h18794 or x__h18821)
  begin
    case (wrtSerPos)
      2'd0: MUX_wide16Fa$enq_1__VAL_1 = x__h18794;
      2'd1: MUX_wide16Fa$enq_1__VAL_1 = x__h18821;
      default: MUX_wide16Fa$enq_1__VAL_1 =
		   IF_wrtSerPos_80_EQ_2_83_THEN_0x0_ELSE_metaWF_f_ETC___d446;
    endcase
  end
  assign MUX_wrtSerPos$write_1__VAL_1 =
	     (wrtSerUnroll == 16'd1) ? 2'd0 : wrtSerPos_80_PLUS_1___d984 ;
  assign MUX_wrtSerPos$write_1__VAL_2 =
	     (metaWF$D_OUT[23:0] == 24'd0) ?
	       2'd0 :
	       wrtSerPos_80_PLUS_1___d984 ;
  assign MUX_wci_respF_x_wire$wset_1__VAL_1 = { 2'd1, x_data__h22228 } ;
  always@(WILL_FIRE_RL_wci_cfrd or
	  MUX_wci_respF_x_wire$wset_1__VAL_1 or
	  WILL_FIRE_RL_wci_ctl_op_complete or
	  MUX_wci_respF_x_wire$wset_1__VAL_2 or WILL_FIRE_RL_wci_cfwr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wci_cfrd:
	  MUX_wci_respF_q_0$write_1__VAL_2 =
	      MUX_wci_respF_x_wire$wset_1__VAL_1;
      WILL_FIRE_RL_wci_ctl_op_complete:
	  MUX_wci_respF_q_0$write_1__VAL_2 =
	      MUX_wci_respF_x_wire$wset_1__VAL_2;
      WILL_FIRE_RL_wci_cfwr: MUX_wci_respF_q_0$write_1__VAL_2 = 34'h1C0DE4201;
      default: MUX_wci_respF_q_0$write_1__VAL_2 =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign MUX_wci_respF_q_0$write_1__VAL_1 =
	     (wci_respF_c_r == 2'd1) ?
	       MUX_wci_respF_q_0$write_1__VAL_2 :
	       wci_respF_q_1 ;
  assign MUX_wci_respF_q_1$write_1__VAL_1 =
	     (wci_respF_c_r == 2'd2) ?
	       MUX_wci_respF_q_0$write_1__VAL_2 :
	       34'h0AAAAAAAA ;
  assign MUX_wmemi_dhF_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wmemi_dhF_incCtr && wmemi_dhF_c_r == 2'd0 ;
  assign MUX_wmemi_dhF_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wmemi_dhF_incCtr && wmemi_dhF_c_r == 2'd1 ;
  assign MUX_dlyReadCredit_value$write_1__VAL_2 =
	     dlyReadCredit_value +
	     (CAN_FIRE_RL_delay_read_req ? 8'd255 : 8'd0) +
	     (CAN_FIRE_RL_delay_Fb2Fc ? 8'd1 : 8'd0) ;
  assign MUX_dlyReadyToWrite_value$write_1__VAL_2 =
	     dlyReadyToWrite_value +
	     (dlyReadyToWrite_acc_v1$whas ? 16'd1 : 16'd0) +
	     (WILL_FIRE_RL_delay_write_req ? 16'd65535 : 16'd0) ;
  assign MUX_dlyWordsStored_value$write_1__VAL_2 =
	     dlyWordsStored_value +
	     (WILL_FIRE_RL_delay_write_req ? 25'd1 : 25'd0) +
	     (CAN_FIRE_RL_delay_read_req ? 25'd33554431 : 25'd0) ;
  assign MUX_wmemi_reqF_q_0$write_1__VAL_2 =
	     WILL_FIRE_RL_delay_read_req ?
	       MUX_wmemi_reqF_x_wire$wset_1__VAL_1 :
	       MUX_wmemi_reqF_x_wire$wset_1__VAL_2 ;
  assign MUX_wmemi_reqF_q_0$write_1__VAL_1 =
	     (wmemi_reqF_c_r == 2'd1) ?
	       MUX_wmemi_reqF_q_0$write_1__VAL_2 :
	       wmemi_reqF_q_1 ;
  assign MUX_wmemi_reqF_q_1$write_1__VAL_1 =
	     (wmemi_reqF_c_r == 2'd2) ?
	       MUX_wmemi_reqF_q_0$write_1__VAL_2 :
	       52'h0AAAAAAAAAAAA ;
  assign MUX_wmemi_reqF_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wmemi_reqF_incCtr && wmemi_reqF_c_r == 2'd0 ;
  assign MUX_wmemi_reqF_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wmemi_reqF_incCtr && wmemi_reqF_c_r == 2'd1 ;
  // inlined wires
  assign wci_wciReq$wget =
	     { wciS0_MCmd,
	       wciS0_MAddrSpace,
	       wciS0_MByteEn,
	       wciS0_MAddr,
	       wciS0_MData } ;
  assign wci_wciReq$whas = 1'd1 ;
  assign wci_reqF_r_enq$whas = CAN_FIRE_RL_wci_reqF_enq ;
  assign wci_reqF_r_clr$whas = 1'b0 ;
  assign wci_respF_dequeueing$whas = wci_respF_c_r != 2'd0 ;
  assign wci_sThreadBusy_pw$whas = 1'b0 ;
  assign wci_wEdge$wget = wci_reqF$D_OUT[36:34] ;
  assign wci_sFlagReg_1$wget = 1'b0 ;
  assign wci_sFlagReg_1$whas = 1'b0 ;
  assign wci_wci_cfwr_pw$whas =
	     wci_reqF$EMPTY_N && wci_reqF$D_OUT[56] &&
	     wci_reqF$D_OUT[59:57] == 3'd1 ;
  assign wci_wci_cfrd_pw$whas =
	     wci_reqF$EMPTY_N && wci_reqF$D_OUT[56] &&
	     wci_reqF$D_OUT[59:57] == 3'd2 ;
  assign wci_wci_ctrl_pw$whas =
	     wci_reqF$EMPTY_N && !wci_reqF$D_OUT[56] &&
	     wci_reqF$D_OUT[59:57] == 3'd2 ;
  assign wci_reqF_r_deq$whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_ctl_op_start ;
  assign wci_respF_enqueueing$whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_ctl_op_complete ;
  assign wci_respF_x_wire$whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_ctl_op_complete ||
	     WILL_FIRE_RL_wci_cfwr ;
  assign wci_ctlAckReg_1$wget = 1'd1 ;
  assign wci_wEdge$whas = WILL_FIRE_RL_wci_ctl_op_start ;
  assign wci_ctlAckReg_1$whas =
	     WILL_FIRE_RL_wci_ctrl_OrE || WILL_FIRE_RL_wci_ctrl_IsO ||
	     WILL_FIRE_RL_wci_ctrl_EiI ;
  assign wmemi_operateD_1$whas = wci_cState == 3'd2 ;
  assign wmemi_operateD_1$wget = 1'd1 ;
  assign wmemi_peerIsReady_1$wget = 1'b0 ;
  assign wmemi_peerIsReady_1$whas = 1'b0 ;
  assign wsiM_reqFifo_dequeueing$whas = CAN_FIRE_RL_wsiM_reqFifo_deq ;
  assign wsiM_sThreadBusy_pw$whas = wsiM1_SThreadBusy ;
  assign wsiM_operateD_1$wget = 1'd1 ;
  assign wsiM_operateD_1$whas = wci_cState == 3'd2 ;
  assign wsiM_peerIsReady_1$wget = 1'd1 ;
  assign wsiM_extStatusW$wget =
	     { wsiM_pMesgCount, wsiM_iMesgCount, wsiM_tBusyCount } ;
  assign wsiM_peerIsReady_1$whas = wsiM1_SReset_n ;
  assign wsiS_wsiReq$wget =
	     { wsiS1_MCmd,
	       wsiS1_MReqLast,
	       wsiS1_MBurstPrecise,
	       wsiS1_MBurstLength,
	       wsiS1_MData,
	       wsiS1_MByteEn,
	       wsiS1_MReqInfo } ;
  assign wsiS_wsiReq$whas = 1'd1 ;
  assign wsiS_reqFifo_r_enq$whas =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_reqFifo$FULL_N ;
  assign wsiS_reqFifo_r_clr$whas = 1'b0 ;
  assign wsiS_reqFifo_doResetEnq$whas = wsiS_reqFifo_r_enq$whas ;
  assign wsiS_reqFifo_doResetClr$whas = 1'b0 ;
  assign wsiS_operateD_1$wget = 1'd1 ;
  assign wsiS_peerIsReady_1$wget = 1'd1 ;
  assign wsiS_operateD_1$whas = wci_cState == 3'd2 ;
  assign wsiS_peerIsReady_1$whas = wsiS1_MReset_n ;
  assign wsiS_sThreadBusy_dw$wget = wsiS_reqFifo_countReg > 2'd1 ;
  assign wsiS_sThreadBusy_dw$whas = CAN_FIRE_RL_wsiS_backpressure ;
  assign wsiS_extStatusW$wget =
	     { wsiS_pMesgCount, wsiS_iMesgCount, wsiS_tBusyCount } ;
  assign wsi_Es_mCmd_w$wget = wsiS1_MCmd ;
  assign wsi_Es_mCmd_w$whas = 1'd1 ;
  assign wsi_Es_mReqLast_w$whas = wsiS1_MReqLast ;
  assign wsi_Es_mBurstLength_w$wget = wsiS1_MBurstLength ;
  assign wsi_Es_mBurstPrecise_w$whas = wsiS1_MBurstPrecise ;
  assign wsi_Es_mBurstLength_w$whas = 1'd1 ;
  assign wsi_Es_mData_w$wget = wsiS1_MData ;
  assign wsi_Es_mData_w$whas = 1'd1 ;
  assign wsi_Es_mByteEn_w$wget = wsiS1_MByteEn ;
  assign wsi_Es_mByteEn_w$whas = 1'd1 ;
  assign wsi_Es_mReqInfo_w$whas = 1'd1 ;
  assign wsi_Es_mReqInfo_w$wget = wsiS1_MReqInfo ;
  assign wsi_Es_mDataInfo_w$whas = 1'd1 ;
  assign wsiM_reqFifo_enqueueing$whas =
	     WILL_FIRE_RL_wsipass_doMessagePush ||
	     WILL_FIRE_RL_wmrd_mesgBodyResponse ;
  assign wsiM_reqFifo_x_wire$whas =
	     WILL_FIRE_RL_wmrd_mesgBodyResponse ||
	     WILL_FIRE_RL_wsipass_doMessagePush ;
  assign wci_Es_mCmd_w$wget = wciS0_MCmd ;
  assign wci_Es_mAddrSpace_w$wget = wciS0_MAddrSpace ;
  assign wci_Es_mCmd_w$whas = 1'd1 ;
  assign wci_Es_mAddrSpace_w$whas = 1'd1 ;
  assign wci_Es_mAddr_w$wget = wciS0_MAddr ;
  assign wci_Es_mData_w$wget = wciS0_MData ;
  assign wci_Es_mAddr_w$whas = 1'd1 ;
  assign wci_Es_mData_w$whas = 1'd1 ;
  assign wci_Es_mByteEn_w$wget = wciS0_MByteEn ;
  assign wci_Es_mByteEn_w$whas = 1'd1 ;
  assign wsiM_reqFifo_x_wire$wget = MUX_wsiM_reqFifo_q_0$write_1__VAL_2 ;
  assign wsiS_reqFifo_r_deq$whas =
	     WILL_FIRE_RL_wmwt_mesg_ingress ||
	     WILL_FIRE_RL_wsipass_doMessagePush ;
  assign wsiS_reqFifo_doResetDeq$whas = wsiS_reqFifo_r_deq$whas ;
  assign wmemi_reqF_dequeueing$whas =
	     wmemiM_SCmdAccept && wmemi_reqF_c_r != 2'd0 ;
  assign wmemi_dhF_x_wire$wget = MUX_wmemi_dhF_q_0$write_1__VAL_2 ;
  assign wmemi_dhF_dequeueing$whas =
	     wmemiM_SDataAccept && wmemi_dhF_c_r != 2'd0 ;
  assign wmemi_wmemiResponse$wget =
	     { wmemiM_SResp, wmemiM_SRespLast, wmemiM_SData } ;
  assign wmemi_wmemiResponse$whas = 1'd1 ;
  assign wmemi_sCmdAccept_w$wget = 1'd1 ;
  assign wmemi_sCmdAccept_w$whas = wmemiM_SCmdAccept ;
  assign wmemi_sDataAccept_w$wget = 1'd1 ;
  assign wmemi_sDataAccept_w$whas = wmemiM_SDataAccept ;
  assign mesgWF_pwEnqueue$whas = MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;
  assign mesgWF_wDataIn$whas = MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;
  assign mesgWF_wDataIn$wget = wsiS_reqFifo$D_OUT[295:40] ;
  assign mesgWF_wDataOut$wget = x__h17993 ;
  assign mesgWF_wDataOut$whas = 1'd1 ;
  assign dlyWordsStored_acc_v1$wget = 25'd1 ;
  assign dlyWordsStored_acc_v2$wget = 25'd33554431 ;
  assign dlyReadCredit_acc_v1$wget = 8'd255 ;
  assign dlyReadCredit_acc_v2$wget = 8'd1 ;
  assign dlyReadCredit_acc_v2$whas = CAN_FIRE_RL_delay_Fb2Fc ;
  assign dlyReadyToWrite_acc_v1$wget = 16'd1 ;
  assign dlyReadyToWrite_acc_v2$wget = 16'd65535 ;
  assign wmemi_Em_sResp_w$wget = wmemiM_SResp ;
  assign wmemi_Em_sData_w$wget = wmemiM_SData ;
  assign wmemi_Em_sResp_w$whas = 1'd1 ;
  assign wmemi_Em_sRespLast_w$whas = wmemiM_SRespLast ;
  assign wmemi_Em_sData_w$whas = 1'd1 ;
  assign mesgWF_pwDequeue$whas = CAN_FIRE_RL_wrtSer_body ;
  assign dlyReadyToWrite_acc_v1$whas =
	     WILL_FIRE_RL_wrtSer_begin || WILL_FIRE_RL_wrtSer_body ;
  assign wci_respF_x_wire$wget = MUX_wci_respF_q_0$write_1__VAL_2 ;
  assign wmemi_reqF_enqueueing$whas =
	     WILL_FIRE_RL_delay_write_req || WILL_FIRE_RL_delay_read_req ;
  assign wmemi_reqF_x_wire$wget = MUX_wmemi_reqF_q_0$write_1__VAL_2 ;
  assign wmemi_reqF_x_wire$whas =
	     WILL_FIRE_RL_delay_read_req || WILL_FIRE_RL_delay_write_req ;
  assign wmemi_dhF_enqueueing$whas = WILL_FIRE_RL_delay_write_req ;
  assign wmemi_dhF_x_wire$whas = WILL_FIRE_RL_delay_write_req ;
  assign dlyWordsStored_acc_v1$whas = WILL_FIRE_RL_delay_write_req ;
  assign dlyWordsStored_acc_v2$whas = CAN_FIRE_RL_delay_read_req ;
  assign dlyReadCredit_acc_v1$whas = CAN_FIRE_RL_delay_read_req ;
  assign dlyReadyToWrite_acc_v2$whas = WILL_FIRE_RL_delay_write_req ;
  // register bytesRead
  assign bytesRead$D_IN = bytesRead + 32'd32 ;
  assign bytesRead$EN =
	     MUX_rdSerEmpty$write_1__PSEL_1 && bytesRead != 32'hFFFFFFFF ;
  // register bytesThisMessage
  assign bytesThisMessage$EN = MUX_mesgWtCount$write_1__SEL_1 ;
  assign bytesThisMessage$D_IN = btm__h17027 ;
  // register bytesWritten
  assign bytesWritten$D_IN = bytesWritten + 32'd32 ;
  assign bytesWritten$EN =
	     WILL_FIRE_RL_wmwt_mesg_ingress && bytesWritten < 32'hFFFFFFDF ;
  // register cyclesPassed
  assign cyclesPassed$D_IN = cyclesPassed + 32'd1 ;
  assign cyclesPassed$EN = wsiS_statusR[0] && cyclesPassed != 32'hFFFFFFFF ;
  // register dlyCtrl
  assign dlyCtrl$D_IN = wci_reqF$D_OUT[31:0] ;
  assign dlyCtrl$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[51:32] == 20'h0 ;
  // register dlyHoldoffBytes
  assign dlyHoldoffBytes$D_IN = wci_reqF$D_OUT[31:0] ;
  assign dlyHoldoffBytes$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[51:32] == 20'h00004 ;
  // register dlyHoldoffCycles
  assign dlyHoldoffCycles$D_IN = wci_reqF$D_OUT[31:0] ;
  assign dlyHoldoffCycles$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[51:32] == 20'h00008 ;
  // register dlyRAG
  assign dlyRAG$D_IN =
	     WILL_FIRE_RL_delay_read_req ? MUX_dlyRAG$write_1__VAL_1 : 23'd0 ;
  assign dlyRAG$EN =
	     WILL_FIRE_RL_delay_read_req || WILL_FIRE_RL_wci_ctrl_IsO ;
  // register dlyRdOpOther
  assign dlyRdOpOther$D_IN = dlyRdOpOther + 32'd1 ;
  assign dlyRdOpOther$EN =
	     WILL_FIRE_RL_rdSer_begin && v__h20254[31:24] != 8'd0 ;
  // register dlyRdOpZero
  assign dlyRdOpZero$D_IN = dlyRdOpZero + 32'd1 ;
  assign dlyRdOpZero$EN =
	     WILL_FIRE_RL_rdSer_begin && v__h20254[31:24] == 8'd0 ;
  // register dlyReadCredit_value
  assign dlyReadCredit_value$EN = 1'b1 ;
  assign dlyReadCredit_value$D_IN =
	     WILL_FIRE_RL_wci_ctrl_IsO ?
	       8'd12 :
	       MUX_dlyReadCredit_value$write_1__VAL_2 ;
  // register dlyReadyToWrite_value
  assign dlyReadyToWrite_value$EN = 1'b1 ;
  assign dlyReadyToWrite_value$D_IN =
	     WILL_FIRE_RL_wci_ctrl_IsO ?
	       16'd0 :
	       MUX_dlyReadyToWrite_value$write_1__VAL_2 ;
  // register dlyWAG
  assign dlyWAG$D_IN =
	     WILL_FIRE_RL_delay_write_req ?
	       MUX_dlyWAG$write_1__VAL_1 :
	       23'd0 ;
  assign dlyWAG$EN =
	     WILL_FIRE_RL_delay_write_req || WILL_FIRE_RL_wci_ctrl_IsO ;
  // register dlyWordsStored_value
  assign dlyWordsStored_value$EN = 1'b1 ;
  assign dlyWordsStored_value$D_IN =
	     WILL_FIRE_RL_wci_ctrl_IsO ?
	       25'd0 :
	       MUX_dlyWordsStored_value$write_1__VAL_2 ;
  // register mesgLengthSoFar
  assign mesgLengthSoFar$EN = MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;
  assign mesgLengthSoFar$D_IN =
	     wsiS_reqFifo$D_OUT[309] ?
	       14'd0 :
	       mesgLengthSoFar_05_PLUS_1___d985 ;
  // register mesgRdCount
  assign mesgRdCount$D_IN =
	     MUX_mesgRdCount$write_1__SEL_1 ?
	       MUX_mesgRdCount$write_1__VAL_1 :
	       32'd0 ;
  assign mesgRdCount$EN =
	     WILL_FIRE_RL_wmrd_mesgBodyResponse && unrollCnt == 16'd1 ||
	     WILL_FIRE_RL_wci_ctrl_IsO ;
  // register mesgWF_rCache
  assign mesgWF_rCache$D_IN = { 1'd1, mesgWF_rWrPtr, x__h15073 } ;
  assign mesgWF_rCache$EN = MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;
  // register mesgWF_rRdPtr
  assign mesgWF_rRdPtr$D_IN = x__h14965 ;
  assign mesgWF_rRdPtr$EN = CAN_FIRE_RL_wrtSer_body ;
  // register mesgWF_rWrPtr
  assign mesgWF_rWrPtr$D_IN = mesgWF_rWrPtr + 13'd1 ;
  assign mesgWF_rWrPtr$EN = MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;
  // register mesgWtCount
  assign mesgWtCount$D_IN =
	     MUX_mesgWtCount$write_1__SEL_1 ?
	       MUX_mesgWtCount$write_1__VAL_1 :
	       32'd0 ;
  assign mesgWtCount$EN =
	     WILL_FIRE_RL_wmwt_mesg_ingress && wsiS_reqFifo$D_OUT[309] ||
	     WILL_FIRE_RL_wci_ctrl_IsO ;
  // register rdSerAddr
  assign rdSerAddr$D_IN = 32'h0 ;
  assign rdSerAddr$EN = 1'b0 ;
  // register rdSerEmpty
  assign rdSerEmpty$D_IN = !MUX_rdSerEmpty$write_1__SEL_1 ;
  assign rdSerEmpty$EN =
	     (WILL_FIRE_RL_rdSer_begin || WILL_FIRE_RL_rdSer_body) &&
	     (rdSerEmpty || rdSerPos == 2'd0) ||
	     WILL_FIRE_RL_rdSer_sync ;
  // register rdSerMeta
  assign rdSerMeta$D_IN = metaRF$D_IN ;
  assign rdSerMeta$EN = CAN_FIRE_RL_rdSer_begin ;
  // register rdSerPos
  assign rdSerPos$D_IN =
	     MUX_rdSerEmpty$write_1__PSEL_1 ?
	       MUX_rdSerPos$write_1__VAL_1 :
	       2'd0 ;
  assign rdSerPos$EN =
	     WILL_FIRE_RL_rdSer_begin || WILL_FIRE_RL_rdSer_body ||
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
  assign rdSerUnroll$EN = MUX_rdSerEmpty$write_1__PSEL_1 ;
  assign rdSerUnroll$D_IN =
	     WILL_FIRE_RL_rdSer_begin ?
	       v__h20254[20:5] :
	       MUX_rdSerUnroll$write_1__VAL_2 ;
  // register rdSyncWord
  assign rdSyncWord$EN =
	     WILL_FIRE_RL_rdSer_body || WILL_FIRE_RL_rdSer_begin ||
	     WILL_FIRE_RL_rdSer_sync ;
  always@(WILL_FIRE_RL_rdSer_body or
	  MUX_rdSyncWord$write_1__VAL_1 or
	  WILL_FIRE_RL_rdSer_begin or
	  MUX_rdSyncWord$write_1__VAL_2 or WILL_FIRE_RL_rdSer_sync)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_rdSer_body:
	  rdSyncWord$D_IN = MUX_rdSyncWord$write_1__VAL_1;
      WILL_FIRE_RL_rdSer_begin:
	  rdSyncWord$D_IN = MUX_rdSyncWord$write_1__VAL_2;
      WILL_FIRE_RL_rdSer_sync: rdSyncWord$D_IN = 1'd0;
      default: rdSyncWord$D_IN = 1'b0 /* unspecified value */ ;
    endcase
  end
  // register readMeta
  assign readMeta$D_IN = metaRF$D_OUT ;
  assign readMeta$EN = CAN_FIRE_RL_wmrd_mesgBegin ;
  // register tog50
  assign tog50$D_IN = !tog50 ;
  assign tog50$EN = wci_cState == 3'd2 ;
  // register unrollCnt
  assign unrollCnt$D_IN =
	     WILL_FIRE_RL_wmrd_mesgBegin ?
	       MUX_unrollCnt$write_1__VAL_1 :
	       MUX_unrollCnt$write_1__VAL_2 ;
  assign unrollCnt$EN =
	     WILL_FIRE_RL_wmrd_mesgBegin ||
	     WILL_FIRE_RL_wmrd_mesgBodyResponse ;
  // register wci_cEdge
  assign wci_cEdge$D_IN = wci_reqF$D_OUT[36:34] ;
  assign wci_cEdge$EN = WILL_FIRE_RL_wci_ctl_op_start ;
  // register wci_cState
  assign wci_cState$D_IN = wci_nState ;
  assign wci_cState$EN =
	     WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge ;
  // register wci_ctlAckReg
  assign wci_ctlAckReg$D_IN = wci_ctlAckReg_1$whas ;
  assign wci_ctlAckReg$EN = 1'd1 ;
  // register wci_ctlOpActive
  assign wci_ctlOpActive$D_IN = !WILL_FIRE_RL_wci_ctl_op_complete ;
  assign wci_ctlOpActive$EN =
	     WILL_FIRE_RL_wci_ctl_op_complete ||
	     WILL_FIRE_RL_wci_ctl_op_start ;
  // register wci_illegalEdge
  assign wci_illegalEdge$D_IN =
	     !MUX_wci_illegalEdge$write_1__SEL_1 &&
	     MUX_wci_illegalEdge$write_1__VAL_2 ;
  assign wci_illegalEdge$EN =
	     WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge ||
	     MUX_wci_illegalEdge$write_1__SEL_2 ;
  // register wci_nState
  always@(wci_reqF$D_OUT)
  begin
    case (wci_reqF$D_OUT[36:34])
      3'd0: wci_nState$D_IN = 3'd1;
      3'd1: wci_nState$D_IN = 3'd2;
      3'd2: wci_nState$D_IN = 3'd3;
      default: wci_nState$D_IN = 3'd0;
    endcase
  end
  assign wci_nState$EN =
	     WILL_FIRE_RL_wci_ctl_op_start &&
	     (wci_reqF$D_OUT[36:34] == 3'd0 && wci_cState == 3'd0 ||
	      wci_reqF$D_OUT[36:34] == 3'd1 &&
	      (wci_cState == 3'd1 || wci_cState == 3'd3) ||
	      wci_reqF$D_OUT[36:34] == 3'd2 && wci_cState == 3'd2 ||
	      wci_reqF$D_OUT[36:34] == 3'd3 &&
	      (wci_cState == 3'd3 || wci_cState == 3'd2 ||
	       wci_cState == 3'd1)) ;
  // register wci_reqF_countReg
  assign wci_reqF_countReg$D_IN =
	     (wci_wciReq$wget[59:57] != 3'd0) ?
	       wci_reqF_countReg + 2'd1 :
	       wci_reqF_countReg - 2'd1 ;
  assign wci_reqF_countReg$EN = CAN_FIRE_RL_wci_reqF__updateLevelCounter ;
  // register wci_respF_c_r
  assign wci_respF_c_r$D_IN =
	     WILL_FIRE_RL_wci_respF_decCtr ?
	       MUX_wci_respF_c_r$write_1__VAL_1 :
	       MUX_wci_respF_c_r$write_1__VAL_2 ;
  assign wci_respF_c_r$EN =
	     WILL_FIRE_RL_wci_respF_decCtr || WILL_FIRE_RL_wci_respF_incCtr ;
  // register wci_respF_q_0
  assign wci_respF_q_0$EN =
	     WILL_FIRE_RL_wci_respF_both ||
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wci_respF_decCtr ;
  always@(WILL_FIRE_RL_wci_respF_both or
	  MUX_wci_respF_q_0$write_1__VAL_1 or
	  MUX_wci_respF_q_0$write_1__SEL_2 or
	  MUX_wci_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wci_respF_decCtr or wci_respF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wci_respF_both:
	  wci_respF_q_0$D_IN = MUX_wci_respF_q_0$write_1__VAL_1;
      MUX_wci_respF_q_0$write_1__SEL_2:
	  wci_respF_q_0$D_IN = MUX_wci_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wci_respF_decCtr: wci_respF_q_0$D_IN = wci_respF_q_1;
      default: wci_respF_q_0$D_IN = 34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  // register wci_respF_q_1
  assign wci_respF_q_1$EN =
	     WILL_FIRE_RL_wci_respF_both ||
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wci_respF_decCtr ;
  always@(WILL_FIRE_RL_wci_respF_both or
	  MUX_wci_respF_q_1$write_1__VAL_1 or
	  MUX_wci_respF_q_1$write_1__SEL_2 or
	  MUX_wci_respF_q_0$write_1__VAL_2 or WILL_FIRE_RL_wci_respF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wci_respF_both:
	  wci_respF_q_1$D_IN = MUX_wci_respF_q_1$write_1__VAL_1;
      MUX_wci_respF_q_1$write_1__SEL_2:
	  wci_respF_q_1$D_IN = MUX_wci_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wci_respF_decCtr: wci_respF_q_1$D_IN = 34'h0AAAAAAAA;
      default: wci_respF_q_1$D_IN = 34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  // register wci_sFlagReg
  assign wci_sFlagReg$D_IN = 1'b0 ;
  assign wci_sFlagReg$EN = 1'd1 ;
  // register wci_sThreadBusy_d
  assign wci_sThreadBusy_d$D_IN = 1'b0 ;
  assign wci_sThreadBusy_d$EN = 1'd1 ;
  // register wmemiRdReq
  assign wmemiRdReq$D_IN = wmemiRdReq + 32'd1 ;
  assign wmemiRdReq$EN = CAN_FIRE_RL_delay_read_req ;
  // register wmemiRdResp1
  assign wmemiRdResp1$D_IN = wmemiRdResp1 + 32'd1 ;
  assign wmemiRdResp1$EN = CAN_FIRE_RL_delay_read_resp ;
  // register wmemiRdResp2
  assign wmemiRdResp2$D_IN = wmemiRdResp2 + 32'd1 ;
  assign wmemiRdResp2$EN = CAN_FIRE_RL_delay_Fb2Fc ;
  // register wmemiWrReq
  assign wmemiWrReq$D_IN = wmemiWrReq + 32'd1 ;
  assign wmemiWrReq$EN = WILL_FIRE_RL_delay_write_req ;
  // register wmemi_busyWithMessage
  assign wmemi_busyWithMessage$D_IN = 1'b0 ;
  assign wmemi_busyWithMessage$EN = 1'b0 ;
  // register wmemi_dhF_c_r
  assign wmemi_dhF_c_r$D_IN =
	     WILL_FIRE_RL_wmemi_dhF_decCtr ?
	       MUX_wmemi_dhF_c_r$write_1__VAL_1 :
	       MUX_wmemi_dhF_c_r$write_1__VAL_2 ;
  assign wmemi_dhF_c_r$EN =
	     WILL_FIRE_RL_wmemi_dhF_decCtr || WILL_FIRE_RL_wmemi_dhF_incCtr ;
  // register wmemi_dhF_q_0
  always@(WILL_FIRE_RL_wmemi_dhF_both or
	  MUX_wmemi_dhF_q_0$write_1__VAL_1 or
	  MUX_wmemi_dhF_q_0$write_1__SEL_2 or
	  MUX_wmemi_dhF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wmemi_dhF_decCtr or wmemi_dhF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmemi_dhF_both:
	  wmemi_dhF_q_0$D_IN = MUX_wmemi_dhF_q_0$write_1__VAL_1;
      MUX_wmemi_dhF_q_0$write_1__SEL_2:
	  wmemi_dhF_q_0$D_IN = MUX_wmemi_dhF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wmemi_dhF_decCtr: wmemi_dhF_q_0$D_IN = wmemi_dhF_q_1;
      default: wmemi_dhF_q_0$D_IN =
		   146'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmemi_dhF_q_0$EN =
	     WILL_FIRE_RL_wmemi_dhF_both ||
	     WILL_FIRE_RL_wmemi_dhF_incCtr && wmemi_dhF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wmemi_dhF_decCtr ;
  // register wmemi_dhF_q_1
  always@(WILL_FIRE_RL_wmemi_dhF_both or
	  MUX_wmemi_dhF_q_1$write_1__VAL_1 or
	  MUX_wmemi_dhF_q_1$write_1__SEL_2 or
	  MUX_wmemi_dhF_q_0$write_1__VAL_2 or WILL_FIRE_RL_wmemi_dhF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmemi_dhF_both:
	  wmemi_dhF_q_1$D_IN = MUX_wmemi_dhF_q_1$write_1__VAL_1;
      MUX_wmemi_dhF_q_1$write_1__SEL_2:
	  wmemi_dhF_q_1$D_IN = MUX_wmemi_dhF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wmemi_dhF_decCtr:
	  wmemi_dhF_q_1$D_IN = 146'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
      default: wmemi_dhF_q_1$D_IN =
		   146'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmemi_dhF_q_1$EN =
	     WILL_FIRE_RL_wmemi_dhF_both ||
	     WILL_FIRE_RL_wmemi_dhF_incCtr && wmemi_dhF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wmemi_dhF_decCtr ;
  // register wmemi_errorSticky
  assign wmemi_errorSticky$D_IN = 1'd1 ;
  assign wmemi_errorSticky$EN =
	     WILL_FIRE_RL_wmemi_respAdvance && !wmemi_respF$FULL_N ;
  // register wmemi_operateD
  assign wmemi_operateD$D_IN = wci_cState == 3'd2 ;
  assign wmemi_operateD$EN = 1'd1 ;
  // register wmemi_peerIsReady
  assign wmemi_peerIsReady$D_IN = 1'b1 ;
  assign wmemi_peerIsReady$EN = 1'd1 ;
  // register wmemi_reqF_c_r
  assign wmemi_reqF_c_r$D_IN =
	     WILL_FIRE_RL_wmemi_reqF_decCtr ?
	       MUX_wmemi_reqF_c_r$write_1__VAL_1 :
	       MUX_wmemi_reqF_c_r$write_1__VAL_2 ;
  assign wmemi_reqF_c_r$EN =
	     WILL_FIRE_RL_wmemi_reqF_decCtr ||
	     WILL_FIRE_RL_wmemi_reqF_incCtr ;
  // register wmemi_reqF_q_0
  always@(WILL_FIRE_RL_wmemi_reqF_both or
	  MUX_wmemi_reqF_q_0$write_1__VAL_1 or
	  MUX_wmemi_reqF_q_0$write_1__SEL_2 or
	  MUX_wmemi_reqF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wmemi_reqF_decCtr or wmemi_reqF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmemi_reqF_both:
	  wmemi_reqF_q_0$D_IN = MUX_wmemi_reqF_q_0$write_1__VAL_1;
      MUX_wmemi_reqF_q_0$write_1__SEL_2:
	  wmemi_reqF_q_0$D_IN = MUX_wmemi_reqF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wmemi_reqF_decCtr: wmemi_reqF_q_0$D_IN = wmemi_reqF_q_1;
      default: wmemi_reqF_q_0$D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmemi_reqF_q_0$EN =
	     WILL_FIRE_RL_wmemi_reqF_both ||
	     WILL_FIRE_RL_wmemi_reqF_incCtr && wmemi_reqF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wmemi_reqF_decCtr ;
  // register wmemi_reqF_q_1
  always@(WILL_FIRE_RL_wmemi_reqF_both or
	  MUX_wmemi_reqF_q_1$write_1__VAL_1 or
	  MUX_wmemi_reqF_q_1$write_1__SEL_2 or
	  MUX_wmemi_reqF_q_0$write_1__VAL_2 or WILL_FIRE_RL_wmemi_reqF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmemi_reqF_both:
	  wmemi_reqF_q_1$D_IN = MUX_wmemi_reqF_q_1$write_1__VAL_1;
      MUX_wmemi_reqF_q_1$write_1__SEL_2:
	  wmemi_reqF_q_1$D_IN = MUX_wmemi_reqF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wmemi_reqF_decCtr: wmemi_reqF_q_1$D_IN = 52'h0AAAAAAAAAAAA;
      default: wmemi_reqF_q_1$D_IN =
		   52'hAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmemi_reqF_q_1$EN =
	     WILL_FIRE_RL_wmemi_reqF_both ||
	     WILL_FIRE_RL_wmemi_reqF_incCtr && wmemi_reqF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wmemi_reqF_decCtr ;
  // register wmemi_statusR
  assign wmemi_statusR$D_IN =
	     { wmemi_isReset$VAL,
	       !wmemi_peerIsReady,
	       !wmemi_operateD,
	       wmemi_errorSticky,
	       3'd0,
	       wmemi_trafficSticky } ;
  assign wmemi_statusR$EN = 1'd1 ;
  // register wmemi_trafficSticky
  assign wmemi_trafficSticky$D_IN = 1'd1 ;
  assign wmemi_trafficSticky$EN = wmemiM_SCmdAccept ;
  // register wrtSerAddr
  assign wrtSerAddr$D_IN = 32'h0 ;
  assign wrtSerAddr$EN = 1'b0 ;
  // register wrtSerPos
  assign wrtSerPos$EN =
	     WILL_FIRE_RL_wrtSer_body || WILL_FIRE_RL_wrtSer_begin ;
  assign wrtSerPos$D_IN =
	     WILL_FIRE_RL_wrtSer_body ?
	       MUX_wrtSerPos$write_1__VAL_1 :
	       MUX_wrtSerPos$write_1__VAL_2 ;
  // register wrtSerStage
  assign wrtSerStage$D_IN =
	     MUX_wrtSerStage$write_1__SEL_1 ? x__h17993[31:0] : metaWF$D_OUT ;
  assign wrtSerStage$EN =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd0 ||
	     WILL_FIRE_RL_wrtSer_begin && wrtSerPos == 2'd0 ;
  // register wrtSerStage_1
  assign wrtSerStage_1$D_IN =
	     MUX_wrtSerStage_1$write_1__SEL_1 ?
	       x__h17993[31:0] :
	       metaWF$D_OUT ;
  assign wrtSerStage_1$EN =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd1 ||
	     WILL_FIRE_RL_wrtSer_begin && wrtSerPos == 2'd1 ;
  // register wrtSerStage_2
  assign wrtSerStage_2$D_IN =
	     MUX_wrtSerStage_2$write_1__SEL_1 ?
	       x__h17993[31:0] :
	       metaWF$D_OUT ;
  assign wrtSerStage_2$EN =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd2 ||
	     WILL_FIRE_RL_wrtSer_begin && wrtSerPos == 2'd2 ;
  // register wrtSerStage_3
  assign wrtSerStage_3$D_IN =
	     MUX_wrtSerStage_3$write_1__SEL_1 ?
	       x__h17993[31:0] :
	       metaWF$D_OUT ;
  assign wrtSerStage_3$EN =
	     WILL_FIRE_RL_wrtSer_body && wrtSerPos == 2'd3 ||
	     WILL_FIRE_RL_wrtSer_begin && wrtSerPos == 2'd3 ;
  // register wrtSerUnroll
  assign wrtSerUnroll$D_IN =
	     WILL_FIRE_RL_wrtSer_body ?
	       MUX_wrtSerUnroll$write_1__VAL_1 :
	       metaWF$D_OUT[20:5] ;
  assign wrtSerUnroll$EN =
	     WILL_FIRE_RL_wrtSer_body || WILL_FIRE_RL_wrtSer_begin ;
  // register wsiM_burstKind
  assign wsiM_burstKind$D_IN =
	     (wsiM_burstKind == 2'd0) ?
	       (wsiM_reqFifo_q_0[308] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsiM_burstKind$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[312:310] == 3'd1 &&
	     (wsiM_burstKind == 2'd0 ||
	      (wsiM_burstKind == 2'd1 || wsiM_burstKind == 2'd2) &&
	      wsiM_reqFifo_q_0[309]) ;
  // register wsiM_errorSticky
  assign wsiM_errorSticky$D_IN = 1'b0 ;
  assign wsiM_errorSticky$EN = 1'b0 ;
  // register wsiM_iMesgCount
  assign wsiM_iMesgCount$D_IN = wsiM_iMesgCount + 32'd1 ;
  assign wsiM_iMesgCount$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[312:310] == 3'd1 &&
	     wsiM_burstKind == 2'd2 &&
	     wsiM_reqFifo_q_0[309] ;
  // register wsiM_operateD
  assign wsiM_operateD$D_IN = wci_cState == 3'd2 ;
  assign wsiM_operateD$EN = 1'd1 ;
  // register wsiM_pMesgCount
  assign wsiM_pMesgCount$D_IN = wsiM_pMesgCount + 32'd1 ;
  assign wsiM_pMesgCount$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[312:310] == 3'd1 &&
	     wsiM_burstKind == 2'd1 &&
	     wsiM_reqFifo_q_0[309] ;
  // register wsiM_peerIsReady
  assign wsiM_peerIsReady$D_IN = wsiM1_SReset_n ;
  assign wsiM_peerIsReady$EN = 1'd1 ;
  // register wsiM_reqFifo_c_r
  assign wsiM_reqFifo_c_r$D_IN =
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ?
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_1 :
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_2 ;
  assign wsiM_reqFifo_c_r$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ||
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr ;
  // register wsiM_reqFifo_q_0
  assign wsiM_reqFifo_q_0$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_both ||
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;
  always@(WILL_FIRE_RL_wsiM_reqFifo_both or
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_1 or
	  MUX_wsiM_reqFifo_q_0$write_1__SEL_2 or
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wsiM_reqFifo_decCtr or wsiM_reqFifo_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wsiM_reqFifo_both:
	  wsiM_reqFifo_q_0$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_1;
      MUX_wsiM_reqFifo_q_0$write_1__SEL_2:
	  wsiM_reqFifo_q_0$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wsiM_reqFifo_decCtr:
	  wsiM_reqFifo_q_0$D_IN = wsiM_reqFifo_q_1;
      default: wsiM_reqFifo_q_0$D_IN =
		   313'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  // register wsiM_reqFifo_q_1
  assign wsiM_reqFifo_q_1$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_both ||
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;
  always@(WILL_FIRE_RL_wsiM_reqFifo_both or
	  MUX_wsiM_reqFifo_q_1$write_1__VAL_1 or
	  MUX_wsiM_reqFifo_q_1$write_1__SEL_2 or
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wsiM_reqFifo_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wsiM_reqFifo_both:
	  wsiM_reqFifo_q_1$D_IN = MUX_wsiM_reqFifo_q_1$write_1__VAL_1;
      MUX_wsiM_reqFifo_q_1$write_1__SEL_2:
	  wsiM_reqFifo_q_1$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wsiM_reqFifo_decCtr:
	  wsiM_reqFifo_q_1$D_IN =
	      313'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00;
      default: wsiM_reqFifo_q_1$D_IN =
		   313'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  // register wsiM_sThreadBusy_d
  assign wsiM_sThreadBusy_d$D_IN = wsiM1_SThreadBusy ;
  assign wsiM_sThreadBusy_d$EN = 1'd1 ;
  // register wsiM_statusR
  assign wsiM_statusR$D_IN =
	     { wsiM_isReset$VAL,
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
  assign wsiM_tBusyCount$EN = CAN_FIRE_RL_wsiM_inc_tBusyCount ;
  // register wsiM_trafficSticky
  assign wsiM_trafficSticky$D_IN = 1'd1 ;
  assign wsiM_trafficSticky$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[312:310] == 3'd1 ;
  // register wsiS_burstKind
  assign wsiS_burstKind$D_IN =
	     (wsiS_burstKind == 2'd0) ?
	       (wsiS_wsiReq$wget[308] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsiS_burstKind$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq &&
	     wsiS_reqFifo_notFull__05_AND_wsiS_burstKind_85_ETC___d725 ;
  // register wsiS_errorSticky
  assign wsiS_errorSticky$D_IN = 1'd1 ;
  assign wsiS_errorSticky$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && !wsiS_reqFifo$FULL_N ;
  // register wsiS_iMesgCount
  assign wsiS_iMesgCount$D_IN = wsiS_iMesgCount + 32'd1 ;
  assign wsiS_iMesgCount$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_reqFifo$FULL_N &&
	     wsiS_burstKind == 2'd2 &&
	     wsiS_wsiReq$wget[309] ;
  // register wsiS_mesgWordLength
  assign wsiS_mesgWordLength$D_IN = wsiS_wordCount ;
  assign wsiS_mesgWordLength$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_reqFifo$FULL_N &&
	     wsiS_wsiReq$wget[309] ;
  // register wsiS_operateD
  assign wsiS_operateD$D_IN = wci_cState == 3'd2 ;
  assign wsiS_operateD$EN = 1'd1 ;
  // register wsiS_pMesgCount
  assign wsiS_pMesgCount$D_IN = wsiS_pMesgCount + 32'd1 ;
  assign wsiS_pMesgCount$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_reqFifo$FULL_N &&
	     wsiS_burstKind == 2'd1 &&
	     wsiS_wsiReq$wget[309] ;
  // register wsiS_peerIsReady
  assign wsiS_peerIsReady$D_IN = wsiS1_MReset_n ;
  assign wsiS_peerIsReady$EN = 1'd1 ;
  // register wsiS_reqFifo_countReg
  assign wsiS_reqFifo_countReg$D_IN =
	     wsiS_reqFifo_r_enq$whas ?
	       wsiS_reqFifo_countReg + 2'd1 :
	       wsiS_reqFifo_countReg - 2'd1 ;
  assign wsiS_reqFifo_countReg$EN =
	     CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter ;
  // register wsiS_reqFifo_levelsValid
  assign wsiS_reqFifo_levelsValid$D_IN = WILL_FIRE_RL_wsiS_reqFifo_reset ;
  assign wsiS_reqFifo_levelsValid$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_reqFifo$FULL_N ||
	     WILL_FIRE_RL_wmwt_mesg_ingress ||
	     WILL_FIRE_RL_wsipass_doMessagePush ||
	     WILL_FIRE_RL_wsiS_reqFifo_reset ;
  // register wsiS_statusR
  assign wsiS_statusR$D_IN =
	     { wsiS_isReset$VAL,
	       !wsiS_peerIsReady,
	       !wsiS_operateD,
	       wsiS_errorSticky,
	       wsiS_burstKind != 2'd0,
	       !CAN_FIRE_RL_wsiS_backpressure || wsiS_sThreadBusy_dw$wget,
	       1'd0,
	       wsiS_trafficSticky } ;
  assign wsiS_statusR$EN = 1'd1 ;
  // register wsiS_tBusyCount
  assign wsiS_tBusyCount$D_IN = wsiS_tBusyCount + 32'd1 ;
  assign wsiS_tBusyCount$EN = CAN_FIRE_RL_wsiS_inc_tBusyCount ;
  // register wsiS_trafficSticky
  assign wsiS_trafficSticky$D_IN = 1'd1 ;
  assign wsiS_trafficSticky$EN = wsiS_reqFifo_r_enq$whas ;
  // register wsiS_wordCount
  assign wsiS_wordCount$D_IN =
	     wsiS_wsiReq$wget[309] ? 12'd1 : wsiS_wordCount + 12'd1 ;
  assign wsiS_wordCount$EN = wsiS_reqFifo_r_enq$whas ;
  // submodule mesgRF
  assign mesgRF$DEQ = CAN_FIRE_RL_wmrd_mesgBodyResponse ;
  assign mesgRF$ENQ = CAN_FIRE_RL_rdSer_body ;
  assign mesgRF$CLR = 1'b0 ;
  assign mesgRF$D_IN = { 224'd0, v__h20254 } ;
  // submodule mesgWF_memory
  assign mesgWF_memory$WEA = MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ;
  assign mesgWF_memory$ADDRA = mesgWF_rWrPtr[11:0] ;
  assign mesgWF_memory$DIA = x__h15073 ;
  assign mesgWF_memory$WEB = 1'd0 ;
  assign mesgWF_memory$DIB =
	     256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */  ;
  assign mesgWF_memory$ENA = 1'd1 ;
  assign mesgWF_memory$ENB = 1'd1 ;
  assign mesgWF_memory$ADDRB =
	     CAN_FIRE_RL_wrtSer_body ? x__h14965[11:0] : mesgWF_rRdPtr[11:0] ;
  // submodule metaRF
  always@(rdSerPos or
	  rdSerStage_3 or wide16Fc$D_OUT or rdSerStage_1 or rdSerStage_2)
  begin
    case (rdSerPos)
      2'd0: metaRF$D_IN = wide16Fc$D_OUT[31:0];
      2'd1: metaRF$D_IN = rdSerStage_1;
      2'd2: metaRF$D_IN = rdSerStage_2;
      2'd3: metaRF$D_IN = rdSerStage_3;
    endcase
  end
  assign metaRF$DEQ = CAN_FIRE_RL_wmrd_mesgBegin ;
  assign metaRF$CLR = 1'b0 ;
  assign metaRF$ENQ = CAN_FIRE_RL_rdSer_begin ;
  // submodule metaWF
  assign metaWF$ENQ = MUX_mesgWtCount$write_1__SEL_1 ;
  assign metaWF$CLR = 1'b0 ;
  assign metaWF$DEQ = CAN_FIRE_RL_wrtSer_begin ;
  assign metaWF$D_IN = { wsiS_reqFifo$D_OUT[7:0], btm__h17027 } ;
  // submodule wci_reqF
  assign wci_reqF$D_IN = wci_wciReq$wget ;
  assign wci_reqF$ENQ = CAN_FIRE_RL_wci_reqF_enq ;
  assign wci_reqF$DEQ = wci_reqF_r_deq$whas ;
  assign wci_reqF$CLR = 1'b0 ;
  // submodule wide16Fa
  assign wide16Fa$CLR = 1'b0 ;
  assign wide16Fa$ENQ =
	     WILL_FIRE_RL_wrtSer_begin &&
	     (wrtSerPos == 2'd3 || metaWF$D_OUT[23:0] == 24'd0) ||
	     WILL_FIRE_RL_wrtSer_body &&
	     (wrtSerPos == 2'd3 || wrtSerUnroll == 16'd1) ;
  assign wide16Fa$D_IN =
	     MUX_wide16Fa$enq_1__SEL_1 ?
	       MUX_wide16Fa$enq_1__VAL_1 :
	       MUX_wide16Fa$enq_1__VAL_2 ;
  assign wide16Fa$DEQ = WILL_FIRE_RL_delay_write_req ;
  // submodule wide16Fb
  assign wide16Fb$D_IN = wmemi_respF$D_OUT[127:0] ;
  assign wide16Fb$DEQ = CAN_FIRE_RL_delay_Fb2Fc ;
  assign wide16Fb$ENQ = CAN_FIRE_RL_delay_read_resp ;
  assign wide16Fb$CLR = 1'b0 ;
  // submodule wide16Fc
  assign wide16Fc$D_IN = wide16Fb$D_OUT ;
  assign wide16Fc$ENQ = CAN_FIRE_RL_delay_Fb2Fc ;
  assign wide16Fc$DEQ =
	     MUX_rdSerEmpty$write_1__PSEL_1 &&
	     (rdSerEmpty || rdSerPos == 2'd0) ;
  assign wide16Fc$CLR = 1'b0 ;
  // submodule wmemi_respF
  assign wmemi_respF$D_IN = wmemi_wmemiResponse$wget ;
  assign wmemi_respF$DEQ = CAN_FIRE_RL_delay_read_resp ;
  assign wmemi_respF$ENQ =
	     WILL_FIRE_RL_wmemi_respAdvance && wmemi_respF$FULL_N ;
  assign wmemi_respF$CLR = 1'b0 ;
  // submodule wsiS_reqFifo
  assign wsiS_reqFifo$D_IN = wsiS_wsiReq$wget ;
  assign wsiS_reqFifo$ENQ = wsiS_reqFifo_r_enq$whas ;
  assign wsiS_reqFifo$CLR = 1'b0 ;
  assign wsiS_reqFifo$DEQ = wsiS_reqFifo_r_deq$whas ;
  // remaining internal signals
  assign IF_wrtSerPos_80_EQ_0_81_OR_wrtSerPos_80_EQ_1_8_ETC___d399 =
	     CASE_wrtSerPos_0b1_0_1_1_1_2_1_3_0b1__q1 &&
	     (wrtSerPos != 2'd3 && wrtSerUnroll != 16'd1 ||
	      CASE_wrtSerPos_NOT_wrtSerPos_EQ_3_OR_wide16Fa_ETC__q2) ;
  assign IF_wrtSerPos_80_EQ_2_83_THEN_0x0_ELSE_mesgWF_w_ETC___d423 =
	     { (wrtSerPos == 2'd2) ? 32'h0 : x__h17993[31:0],
	       (wrtSerPos == 2'd2) ? x__h17993[31:0] : wrtSerStage_2,
	       wrtSerStage_1,
	       wrtSerStage } ;
  assign IF_wrtSerPos_80_EQ_2_83_THEN_0x0_ELSE_metaWF_f_ETC___d446 =
	     { (wrtSerPos == 2'd2) ? 32'h0 : metaWF$D_OUT,
	       (wrtSerPos == 2'd2) ? metaWF$D_OUT : wrtSerStage_2,
	       wrtSerStage_1,
	       wrtSerStage } ;
  assign NOT_mesgWF_rRdPtr_69_EQ_mesgWF_rWrPtr_71_74___d175 =
	     mesgWF_rRdPtr != mesgWF_rWrPtr ;
  assign NOT_mesgWF_rRdPtr_69_PLUS_2048_70_EQ_mesgWF_rW_ETC___d173 =
	     mesgWF_rRdPtr + 13'd2048 != mesgWF_rWrPtr ;
  assign NOT_wrtSerPos_80_EQ_3_87_88_AND_NOT_metaWF_fir_ETC___d434 =
	     wrtSerPos != 2'd3 && metaWF$D_OUT[23:0] != 24'd0 ||
	     CASE_wrtSerPos_NOT_wrtSerPos_EQ_3_OR_wide16Fa_ETC__q2 ;
  assign addr__h19478 = { 9'd0, x__h19536 } ;
  assign addr__h19647 = { 9'd0, x__h19692 } ;
  assign btm__h17027 =
	     { wsiS_reqFifo$D_OUT[308] ?
		 { 7'd0, wsiS_reqFifo$D_OUT[307:296] } :
		 { 5'd0, mesgLengthSoFar_05_PLUS_1___d985 },
	       5'd0 } ;
  assign bytesWritten_6_ULT_dlyHoldoffBytes_6___d908 =
	     bytesWritten < dlyHoldoffBytes ;
  assign cyclesPassed_54_ULT_dlyHoldoffCycles_8___d903 =
	     cyclesPassed < dlyHoldoffCycles ;
  assign delayStatus__h21797 =
	     { 14'h0,
	       !dlyWordsStored_value_26_SLE_0___d909 &&
	       !bytesWritten_6_ULT_dlyHoldoffBytes_6___d908 &&
	       !cyclesPassed_54_ULT_dlyHoldoffCycles_8___d903,
	       dlyWordsStored_value_26_SLE_0_49_OR_bytesWritt_ETC___d164,
	       dlyWordsStored_value_26_SLT_8388608___d165,
	       wsiM_reqFifo_c_r != 2'd2,
	       metaWF$FULL_N,
	       metaWF$EMPTY_N,
	       NOT_mesgWF_rRdPtr_69_PLUS_2048_70_EQ_mesgWF_rW_ETC___d173,
	       NOT_mesgWF_rRdPtr_69_EQ_mesgWF_rWrPtr_71_74___d175,
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
  assign dlyWordsStored_value_26_SLE_0_49_OR_bytesWritt_ETC___d164 =
	     dlyWordsStored_value_26_SLE_0___d909 ||
	     bytesWritten_6_ULT_dlyHoldoffBytes_6___d908 ||
	     cyclesPassed_54_ULT_dlyHoldoffCycles_8___d903 ||
	     wsiM_reqFifo_c_r == 2'd2 ||
	     tog50 ;
  assign dlyWordsStored_value_26_SLE_0___d909 =
	     (dlyWordsStored_value ^ 25'h1000000) <= 25'd16777216 ;
  assign dlyWordsStored_value_26_SLT_8388608___d165 =
	     (dlyWordsStored_value ^ 25'h1000000) < 25'd25165824 ;
  assign mesgLengthSoFar_05_PLUS_1___d985 = mesgLengthSoFar + 14'd1 ;
  assign mesgRF_i_notFull__74_AND_NOT_rdSerEmpty_75_76__ETC___d285 =
	     mesgRF$FULL_N &&
	     (!rdSerEmpty && rdSerPos != 2'd0 || wide16Fc$EMPTY_N) ;
  assign metaRF_i_notFull__18_AND_NOT_rdSerEmpty_75_76__ETC___d319 =
	     metaRF$FULL_N &&
	     (!rdSerEmpty && rdSerPos != 2'd0 || wide16Fc$EMPTY_N) ;
  assign rdat__h22255 = hasDebugLogic ? mesgWtCount : 32'd0 ;
  assign rdat__h22261 = hasDebugLogic ? mesgRdCount : 32'd0 ;
  assign rdat__h22267 = hasDebugLogic ? bytesWritten : 32'd0 ;
  assign rdat__h22273 = hasDebugLogic ? { 8'd0, x__h22277 } : 32'd0 ;
  assign rdat__h22397 = hasDebugLogic ? wsiS_extStatusW$wget[95:64] : 32'd0 ;
  assign rdat__h22411 = hasDebugLogic ? wsiS_extStatusW$wget[63:32] : 32'd0 ;
  assign rdat__h22419 = hasDebugLogic ? wsiS_extStatusW$wget[31:0] : 32'd0 ;
  assign rdat__h22425 = hasDebugLogic ? wsiM_extStatusW$wget[95:64] : 32'd0 ;
  assign rdat__h22439 = hasDebugLogic ? wsiM_extStatusW$wget[63:32] : 32'd0 ;
  assign rdat__h22447 = hasDebugLogic ? wsiM_extStatusW$wget[31:0] : 32'd0 ;
  assign rdat__h22453 = hasDebugLogic ? wmemiWrReq : 32'd0 ;
  assign rdat__h22459 = hasDebugLogic ? wmemiRdReq : 32'd0 ;
  assign rdat__h22465 = hasDebugLogic ? wmemiRdResp1 : 32'd0 ;
  assign rdat__h22471 =
	     hasDebugLogic ?
	       { {7{dlyWordsStored_value[24]}}, dlyWordsStored_value } :
	       32'd0 ;
  assign rdat__h22482 =
	     hasDebugLogic ?
	       { {24{dlyReadCredit_value[7]}}, dlyReadCredit_value } :
	       32'd0 ;
  assign rdat__h22493 = hasDebugLogic ? { 9'd0, dlyWAG } : 32'd0 ;
  assign rdat__h22504 = hasDebugLogic ? { 9'd0, dlyRAG } : 32'd0 ;
  assign rdat__h22525 = hasDebugLogic ? wmemiRdResp2 : 32'd0 ;
  assign rdat__h22580 =
	     { {16{dlyReadyToWrite_value[15]}}, dlyReadyToWrite_value } ;
  assign rdat__h22589 = { 16'd0, wrtSerUnroll } ;
  assign rdat__h22598 = { 8'd0, bytesThisMessage } ;
  assign rdat__h22607 = { 18'd0, mesgLengthSoFar } ;
  assign v__h20254 = metaRF$D_IN ;
  assign wci_cState_9_EQ_2_0_AND_dlyCtrl_4_BITS_3_TO_0__ETC___d352 =
	     wci_cState == 3'd2 && dlyCtrl[3:0] == 4'h7 &&
	     !dlyWordsStored_value_26_SLE_0___d909 &&
	     !bytesWritten_6_ULT_dlyHoldoffBytes_6___d908 &&
	     !cyclesPassed_54_ULT_dlyHoldoffCycles_8___d903 ;
  assign wrtSerPos_80_PLUS_1___d984 = wrtSerPos + 2'd1 ;
  assign wsiS_reqFifo_notFull__05_AND_wsiS_burstKind_85_ETC___d725 =
	     wsiS_reqFifo$FULL_N &&
	     (wsiS_burstKind == 2'd0 ||
	      (wsiS_burstKind == 2'd1 || wsiS_burstKind == 2'd2) &&
	      wsiS_wsiReq$wget[309]) ;
  assign x__h14965 = mesgWF_rRdPtr + 13'd1 ;
  assign x__h15073 =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_2 ?
	       wsiS_reqFifo$D_OUT[295:40] :
	       256'd0 ;
  assign x__h17993 =
	     (mesgWF_rCache[269] && mesgWF_rCache[268:256] == mesgWF_rRdPtr) ?
	       mesgWF_rCache[255:0] :
	       mesgWF_memory$DOB ;
  assign x__h18132 = { 96'd0, x__h17993[31:0] } ;
  assign x__h18163 = { 64'd0, x__h17993[31:0], wrtSerStage } ;
  assign x__h18794 = { 96'd0, metaWF$D_OUT } ;
  assign x__h18821 = { 64'd0, metaWF$D_OUT, wrtSerStage } ;
  assign x__h19536 = { dlyRAG, 4'h0 } ;
  assign x__h19692 = { dlyWAG, 4'h0 } ;
  assign x__h22277 = { wmemi_statusR, wsiS_statusR, wsiM_statusR } ;
  assign x_burstLength__h19976 =
	     (readMeta[23:0] == 24'd0) ? 12'd1 : readMeta[16:5] ;
  assign x_byteEn__h19977 = (readMeta[23:0] == 24'd0) ? 32'd0 : 32'hFFFFFFFF ;
  always@(wrtSerPos)
  begin
    case (wrtSerPos)
      2'd0, 2'd1, 2'd2, 2'd3: CASE_wrtSerPos_0b1_0_1_1_1_2_1_3_0b1__q1 = 1'd1;
    endcase
  end
  always@(wrtSerPos or wide16Fa$FULL_N)
  begin
    case (wrtSerPos)
      2'd0, 2'd1, 2'd2:
	  CASE_wrtSerPos_NOT_wrtSerPos_EQ_3_OR_wide16Fa_ETC__q2 =
	      wide16Fa$FULL_N;
      2'd3:
	  CASE_wrtSerPos_NOT_wrtSerPos_EQ_3_OR_wide16Fa_ETC__q2 =
	      wrtSerPos != 2'd3 || wide16Fa$FULL_N;
    endcase
  end
  always@(wci_reqF$D_OUT or
	  dlyCtrl or
	  dlyHoldoffBytes or
	  dlyHoldoffCycles or
	  rdat__h22255 or
	  rdat__h22261 or
	  rdat__h22267 or
	  rdat__h22273 or
	  rdat__h22397 or
	  rdat__h22411 or
	  rdat__h22419 or
	  rdat__h22425 or
	  rdat__h22439 or
	  rdat__h22447 or
	  rdat__h22453 or
	  rdat__h22459 or
	  rdat__h22465 or
	  rdat__h22471 or
	  rdat__h22482 or
	  rdat__h22493 or
	  rdat__h22504 or
	  dlyRdOpZero or
	  dlyRdOpOther or
	  rdat__h22525 or
	  delayStatus__h21797 or
	  rdat__h22580 or rdat__h22589 or rdat__h22598 or rdat__h22607)
  begin
    case (wci_reqF$D_OUT[51:32])
      20'h0: x_data__h22228 = dlyCtrl;
      20'h00004: x_data__h22228 = dlyHoldoffBytes;
      20'h00008: x_data__h22228 = dlyHoldoffCycles;
      20'h0000C: x_data__h22228 = rdat__h22255;
      20'h00010: x_data__h22228 = rdat__h22261;
      20'h00014: x_data__h22228 = rdat__h22267;
      20'h00018: x_data__h22228 = rdat__h22273;
      20'h0001C: x_data__h22228 = 32'd0;
      20'h00020: x_data__h22228 = rdat__h22397;
      20'h00024: x_data__h22228 = rdat__h22411;
      20'h00028: x_data__h22228 = rdat__h22419;
      20'h0002C: x_data__h22228 = rdat__h22425;
      20'h00030: x_data__h22228 = rdat__h22439;
      20'h00034: x_data__h22228 = rdat__h22447;
      20'h00038: x_data__h22228 = rdat__h22453;
      20'h0003C: x_data__h22228 = rdat__h22459;
      20'h00040: x_data__h22228 = rdat__h22465;
      20'h00044: x_data__h22228 = rdat__h22471;
      20'h00048: x_data__h22228 = rdat__h22482;
      20'h0004C: x_data__h22228 = rdat__h22493;
      20'h00050: x_data__h22228 = rdat__h22504;
      20'h00058: x_data__h22228 = dlyRdOpZero;
      20'h0005C: x_data__h22228 = dlyRdOpOther;
      20'h00060: x_data__h22228 = rdat__h22525;
      20'h00064: x_data__h22228 = delayStatus__h21797;
      20'h00068: x_data__h22228 = rdat__h22580;
      20'h0006C: x_data__h22228 = rdat__h22589;
      20'h00070: x_data__h22228 = rdat__h22598;
      20'h00074: x_data__h22228 = rdat__h22607;
      default: x_data__h22228 = 32'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (!wciS0_MReset_n)
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
	mesgWF_rCache <= `BSV_ASSIGNMENT_DELAY
	    270'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
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
	wci_cEdge <= `BSV_ASSIGNMENT_DELAY 3'd7;
	wci_cState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	wci_ctlAckReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_ctlOpActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_illegalEdge <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_nState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	wci_reqF_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wci_respF_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wci_respF_q_0 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	wci_respF_q_1 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	wci_sFlagReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
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
	wsiM_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY
	    313'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00;
	wsiM_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY
	    313'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00;
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
	if (wci_cEdge$EN) wci_cEdge <= `BSV_ASSIGNMENT_DELAY wci_cEdge$D_IN;
	if (wci_cState$EN)
	  wci_cState <= `BSV_ASSIGNMENT_DELAY wci_cState$D_IN;
	if (wci_ctlAckReg$EN)
	  wci_ctlAckReg <= `BSV_ASSIGNMENT_DELAY wci_ctlAckReg$D_IN;
	if (wci_ctlOpActive$EN)
	  wci_ctlOpActive <= `BSV_ASSIGNMENT_DELAY wci_ctlOpActive$D_IN;
	if (wci_illegalEdge$EN)
	  wci_illegalEdge <= `BSV_ASSIGNMENT_DELAY wci_illegalEdge$D_IN;
	if (wci_nState$EN)
	  wci_nState <= `BSV_ASSIGNMENT_DELAY wci_nState$D_IN;
	if (wci_reqF_countReg$EN)
	  wci_reqF_countReg <= `BSV_ASSIGNMENT_DELAY wci_reqF_countReg$D_IN;
	if (wci_respF_c_r$EN)
	  wci_respF_c_r <= `BSV_ASSIGNMENT_DELAY wci_respF_c_r$D_IN;
	if (wci_respF_q_0$EN)
	  wci_respF_q_0 <= `BSV_ASSIGNMENT_DELAY wci_respF_q_0$D_IN;
	if (wci_respF_q_1$EN)
	  wci_respF_q_1 <= `BSV_ASSIGNMENT_DELAY wci_respF_q_1$D_IN;
	if (wci_sFlagReg$EN)
	  wci_sFlagReg <= `BSV_ASSIGNMENT_DELAY wci_sFlagReg$D_IN;
	if (wci_sThreadBusy_d$EN)
	  wci_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY wci_sThreadBusy_d$D_IN;
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
    mesgWF_rCache =
	270'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
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
    wci_cEdge = 3'h2;
    wci_cState = 3'h2;
    wci_ctlAckReg = 1'h0;
    wci_ctlOpActive = 1'h0;
    wci_illegalEdge = 1'h0;
    wci_nState = 3'h2;
    wci_reqF_countReg = 2'h2;
    wci_respF_c_r = 2'h2;
    wci_respF_q_0 = 34'h2AAAAAAAA;
    wci_respF_q_1 = 34'h2AAAAAAAA;
    wci_sFlagReg = 1'h0;
    wci_sThreadBusy_d = 1'h0;
    wmemiRdReq = 32'hAAAAAAAA;
    wmemiRdResp1 = 32'hAAAAAAAA;
    wmemiRdResp2 = 32'hAAAAAAAA;
    wmemiWrReq = 32'hAAAAAAAA;
    wmemi_busyWithMessage = 1'h0;
    wmemi_dhF_c_r = 2'h2;
    wmemi_dhF_q_0 = 146'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wmemi_dhF_q_1 = 146'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wmemi_errorSticky = 1'h0;
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
    wsiM_operateD = 1'h0;
    wsiM_pMesgCount = 32'hAAAAAAAA;
    wsiM_peerIsReady = 1'h0;
    wsiM_reqFifo_c_r = 2'h2;
    wsiM_reqFifo_q_0 =
	313'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wsiM_reqFifo_q_1 =
	313'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wsiM_sThreadBusy_d = 1'h0;
    wsiM_statusR = 8'hAA;
    wsiM_tBusyCount = 32'hAAAAAAAA;
    wsiM_trafficSticky = 1'h0;
    wsiS_burstKind = 2'h2;
    wsiS_errorSticky = 1'h0;
    wsiS_iMesgCount = 32'hAAAAAAAA;
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
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_start)
	begin
	  v__h3716 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3716,
		 wci_reqF$D_OUT[36:34],
		 wci_cState);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_OrE && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/DelayWorker.bsv\", line 443, column 6: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_OrE and RL_wci_ctrl_EiI fired in the\n  same clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/DelayWorker.bsv\", line 392, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfrd and RL_wci_ctrl_OrE fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/DelayWorker.bsv\", line 392, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfrd and RL_wci_ctrl_EiI fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	begin
	  v__h22096 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	$display("[%0d]: %m: Starting DelayWorker dlyCtrl:%0x",
		 v__h22096,
		 dlyCtrl);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/DelayWorker.bsv\", line 430, column 6: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_IsO and RL_wci_ctrl_OrE fired in the\n  same clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/DelayWorker.bsv\", line 430, column 6: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_IsO and RL_wci_ctrl_EiI fired in the\n  same clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/DelayWorker.bsv\", line 430, column 6: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_IsO and RL_wci_cfrd fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	begin
	  v__h2817 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h2817,
		 wci_cEdge,
		 wci_cState);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	begin
	  v__h2670 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h2670,
		 wci_cEdge,
		 wci_cState,
		 wci_nState);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/DelayWorker.bsv\", line 381, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfwr and RL_wci_ctrl_OrE fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/DelayWorker.bsv\", line 381, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfwr and RL_wci_ctrl_IsO fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/DelayWorker.bsv\", line 381, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfwr and RL_wci_ctrl_EiI fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/DelayWorker.bsv\", line 381, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfwr and RL_wci_cfrd fired in the same clock\n  cycle.\n");
  end
  // synopsys translate_on
endmodule