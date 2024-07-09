module outputs
  wire [31 : 0] wciS0_SData, wmiM_MData, wmiM_MFlag, wsiM1_MData;
  wire [13 : 0] wmiM_MAddr;
  wire [11 : 0] wmiM_MBurstLength, wsiM1_MBurstLength;
  wire [7 : 0] wsiM1_MReqInfo;
  wire [3 : 0] wmiM_MDataByteEn, wsiM1_MByteEn;
  wire [2 : 0] wmiM_MCmd, wsiM1_MCmd;
  wire [1 : 0] wciS0_SFlag, wciS0_SResp;
  wire wciS0_SThreadBusy,
       wmiM_MAddrSpace,
       wmiM_MDataLast,
       wmiM_MDataValid,
       wmiM_MReqInfo,
       wmiM_MReqLast,
       wmiM_MReset_n,
       wsiM1_MBurstPrecise,
       wsiM1_MReqLast,
       wsiM1_MReset_n,
       wsiS1_SReset_n,
       wsiS1_SThreadBusy;
  // inlined wires
  wire [95 : 0] wsiM_extStatusW$wget, wsiS_extStatusW$wget;
  wire [60 : 0] wsiM_reqFifo_x_wire$wget, wsiS_wsiReq$wget;
  wire [59 : 0] wci_wciReq$wget;
  wire [37 : 0] wmi_dhF_x_wire$wget;
  wire [33 : 0] wci_respF_x_wire$wget, wmi_wmiResponse$wget;
  wire [31 : 0] wci_Es_mData_w$wget,
		wmi_Em_sData_w$wget,
		wmi_mFlagF_x_wire$wget,
		wmi_reqF_x_wire$wget,
		wsi_Es_mData_w$wget;
  wire [19 : 0] wci_Es_mAddr_w$wget;
  wire [11 : 0] wsi_Es_mBurstLength_w$wget;
  wire [7 : 0] wsi_Es_mReqInfo_w$wget;
  wire [3 : 0] fabRespCredit_acc_v1$wget,
	       fabRespCredit_acc_v2$wget,
	       wci_Es_mByteEn_w$wget,
	       wsi_Es_mByteEn_w$wget;
  wire [2 : 0] wci_Es_mCmd_w$wget, wci_wEdge$wget, wsi_Es_mCmd_w$wget;
  wire [1 : 0] wmi_Em_sResp_w$wget;
  wire fabRespCredit_acc_v1$whas,
       fabRespCredit_acc_v2$whas,
       mesgPreRequest_1$wget,
       mesgPreRequest_1$whas,
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
       wmi_Em_sData_w$whas,
       wmi_Em_sResp_w$whas,
       wmi_dhF_dequeueing$whas,
       wmi_dhF_enqueueing$whas,
       wmi_dhF_x_wire$whas,
       wmi_mFlagF_dequeueing$whas,
       wmi_mFlagF_enqueueing$whas,
       wmi_mFlagF_x_wire$whas,
       wmi_operateD_1$wget,
       wmi_operateD_1$whas,
       wmi_peerIsReady_1$wget,
       wmi_peerIsReady_1$whas,
       wmi_reqF_dequeueing$whas,
       wmi_reqF_enqueueing$whas,
       wmi_reqF_x_wire$whas,
       wmi_sDataThreadBusy_d_1$wget,
       wmi_sDataThreadBusy_d_1$whas,
       wmi_sThreadBusy_d_1$wget,
       wmi_sThreadBusy_d_1$whas,
       wmi_wmiResponse$whas,
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
       wsiS_reqFifo_r_clr$whas,
       wsiS_reqFifo_r_deq$whas,
       wsiS_reqFifo_r_enq$whas,
       wsiS_wsiReq$whas,
       wsi_Es_mBurstLength_w$whas,
       wsi_Es_mBurstPrecise_w$whas,
       wsi_Es_mByteEn_w$whas,
       wsi_Es_mCmd_w$whas,
       wsi_Es_mDataInfo_w$whas,
       wsi_Es_mData_w$whas,
       wsi_Es_mReqInfo_w$whas,
       wsi_Es_mReqLast_w$whas;
  // register abortCount
  reg [31 : 0] abortCount;
  wire [31 : 0] abortCount$D_IN;
  wire abortCount$EN;
  // register doAbort
  reg doAbort;
  wire doAbort$D_IN, doAbort$EN;
  // register endOfMessage
  reg endOfMessage;
  wire endOfMessage$D_IN, endOfMessage$EN;
  // register errCount
  reg [31 : 0] errCount;
  wire [31 : 0] errCount$D_IN;
  wire errCount$EN;
  // register fabRespCredit_value
  reg [3 : 0] fabRespCredit_value;
  wire [3 : 0] fabRespCredit_value$D_IN;
  wire fabRespCredit_value$EN;
  // register fabWordsCurReq
  reg [13 : 0] fabWordsCurReq;
  wire [13 : 0] fabWordsCurReq$D_IN;
  wire fabWordsCurReq$EN;
  // register fabWordsRemain
  reg [13 : 0] fabWordsRemain;
  wire [13 : 0] fabWordsRemain$D_IN;
  wire fabWordsRemain$EN;
  // register firstMsgReq
  reg firstMsgReq;
  wire firstMsgReq$D_IN, firstMsgReq$EN;
  // register impreciseBurst
  reg impreciseBurst;
  reg impreciseBurst$D_IN;
  wire impreciseBurst$EN;
  // register lastMesg
  reg [31 : 0] lastMesg;
  wire [31 : 0] lastMesg$D_IN;
  wire lastMesg$EN;
  // register mesgCount
  reg [31 : 0] mesgCount;
  reg [31 : 0] mesgCount$D_IN;
  wire mesgCount$EN;
  // register mesgLength
  reg [14 : 0] mesgLength;
  reg [14 : 0] mesgLength$D_IN;
  wire mesgLength$EN;
  // register mesgLengthSoFar
  reg [13 : 0] mesgLengthSoFar;
  wire [13 : 0] mesgLengthSoFar$D_IN;
  wire mesgLengthSoFar$EN;
  // register mesgPreRequest
  reg mesgPreRequest;
  wire mesgPreRequest$D_IN, mesgPreRequest$EN;
  // register mesgReqAddr
  reg [13 : 0] mesgReqAddr;
  wire [13 : 0] mesgReqAddr$D_IN;
  wire mesgReqAddr$EN;
  // register mesgReqOK
  reg mesgReqOK;
  wire mesgReqOK$D_IN, mesgReqOK$EN;
  // register mesgReqValid
  reg mesgReqValid;
  wire mesgReqValid$D_IN, mesgReqValid$EN;
  // register opcode
  reg [8 : 0] opcode;
  reg [8 : 0] opcode$D_IN;
  wire opcode$EN;
  // register preciseBurst
  reg preciseBurst;
  reg preciseBurst$D_IN;
  wire preciseBurst$EN;
  // register readyToPush
  reg readyToPush;
  reg readyToPush$D_IN;
  wire readyToPush$EN;
  // register readyToRequest
  reg readyToRequest;
  wire readyToRequest$D_IN, readyToRequest$EN;
  // register smaCtrl
  reg [31 : 0] smaCtrl;
  wire [31 : 0] smaCtrl$D_IN;
  wire smaCtrl$EN;
  // register thisMesg
  reg [31 : 0] thisMesg;
  reg [31 : 0] thisMesg$D_IN;
  wire thisMesg$EN;
  // register unrollCnt
  reg [15 : 0] unrollCnt;
  wire [15 : 0] unrollCnt$D_IN;
  wire unrollCnt$EN;
  // register valExpect
  reg [31 : 0] valExpect;
  wire [31 : 0] valExpect$D_IN;
  wire valExpect$EN;
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
  // register wmi_busyWithMessage
  reg wmi_busyWithMessage;
  wire wmi_busyWithMessage$D_IN, wmi_busyWithMessage$EN;
  // register wmi_dhF_c_r
  reg [1 : 0] wmi_dhF_c_r;
  wire [1 : 0] wmi_dhF_c_r$D_IN;
  wire wmi_dhF_c_r$EN;
  // register wmi_dhF_q_0
  reg [37 : 0] wmi_dhF_q_0;
  reg [37 : 0] wmi_dhF_q_0$D_IN;
  wire wmi_dhF_q_0$EN;
  // register wmi_dhF_q_1
  reg [37 : 0] wmi_dhF_q_1;
  reg [37 : 0] wmi_dhF_q_1$D_IN;
  wire wmi_dhF_q_1$EN;
  // register wmi_mFlagF_c_r
  reg [1 : 0] wmi_mFlagF_c_r;
  wire [1 : 0] wmi_mFlagF_c_r$D_IN;
  wire wmi_mFlagF_c_r$EN;
  // register wmi_mFlagF_q_0
  reg [31 : 0] wmi_mFlagF_q_0;
  reg [31 : 0] wmi_mFlagF_q_0$D_IN;
  wire wmi_mFlagF_q_0$EN;
  // register wmi_mFlagF_q_1
  reg [31 : 0] wmi_mFlagF_q_1;
  reg [31 : 0] wmi_mFlagF_q_1$D_IN;
  wire wmi_mFlagF_q_1$EN;
  // register wmi_operateD
  reg wmi_operateD;
  wire wmi_operateD$D_IN, wmi_operateD$EN;
  // register wmi_peerIsReady
  reg wmi_peerIsReady;
  wire wmi_peerIsReady$D_IN, wmi_peerIsReady$EN;
  // register wmi_reqF_c_r
  reg [1 : 0] wmi_reqF_c_r;
  wire [1 : 0] wmi_reqF_c_r$D_IN;
  wire wmi_reqF_c_r$EN;
  // register wmi_reqF_q_0
  reg [31 : 0] wmi_reqF_q_0;
  reg [31 : 0] wmi_reqF_q_0$D_IN;
  wire wmi_reqF_q_0$EN;
  // register wmi_reqF_q_1
  reg [31 : 0] wmi_reqF_q_1;
  reg [31 : 0] wmi_reqF_q_1$D_IN;
  wire wmi_reqF_q_1$EN;
  // register wmi_sDataThreadBusy_d
  reg wmi_sDataThreadBusy_d;
  wire wmi_sDataThreadBusy_d$D_IN, wmi_sDataThreadBusy_d$EN;
  // register wmi_sFlagReg
  reg [31 : 0] wmi_sFlagReg;
  wire [31 : 0] wmi_sFlagReg$D_IN;
  wire wmi_sFlagReg$EN;
  // register wmi_sThreadBusy_d
  reg wmi_sThreadBusy_d;
  wire wmi_sThreadBusy_d$D_IN, wmi_sThreadBusy_d$EN;
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
  // register wsiWordsRemain
  reg [11 : 0] wsiWordsRemain;
  wire [11 : 0] wsiWordsRemain$D_IN;
  wire wsiWordsRemain$EN;
  // register zeroLengthMesg
  reg zeroLengthMesg;
  wire zeroLengthMesg$D_IN, zeroLengthMesg$EN;
  // ports of submodule wci_isReset
  wire wci_isReset$VAL;
  // ports of submodule wci_reqF
  wire [59 : 0] wci_reqF$D_IN, wci_reqF$D_OUT;
  wire wci_reqF$CLR, wci_reqF$DEQ, wci_reqF$EMPTY_N, wci_reqF$ENQ;
  // ports of submodule wmi_isReset
  wire wmi_isReset$VAL;
  // ports of submodule wmi_respF
  wire [33 : 0] wmi_respF$D_IN, wmi_respF$D_OUT;
  wire wmi_respF$CLR,
       wmi_respF$DEQ,
       wmi_respF$EMPTY_N,
       wmi_respF$ENQ,
       wmi_respF$FULL_N;
  // ports of submodule wsiM_isReset
  wire wsiM_isReset$VAL;
  // ports of submodule wsiS_isReset
  wire wsiS_isReset$VAL;
  // ports of submodule wsiS_reqFifo
  wire [60 : 0] wsiS_reqFifo$D_IN, wsiS_reqFifo$D_OUT;
  wire wsiS_reqFifo$CLR,
       wsiS_reqFifo$DEQ,
       wsiS_reqFifo$EMPTY_N,
       wsiS_reqFifo$ENQ,
       wsiS_reqFifo$FULL_N;
  // rule scheduling signals
  wire CAN_FIRE_RL_fabRespCredit_accumulate,
       CAN_FIRE_RL_mesgPreRequest__dreg_update,
       CAN_FIRE_RL_operating_actions,
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
       CAN_FIRE_RL_wmi_Em_doAlways,
       CAN_FIRE_RL_wmi_dhF_both,
       CAN_FIRE_RL_wmi_dhF_decCtr,
       CAN_FIRE_RL_wmi_dhF_deq,
       CAN_FIRE_RL_wmi_dhF_incCtr,
       CAN_FIRE_RL_wmi_mFlagF_both,
       CAN_FIRE_RL_wmi_mFlagF_decCtr,
       CAN_FIRE_RL_wmi_mFlagF_incCtr,
       CAN_FIRE_RL_wmi_operateD__dreg_update,
       CAN_FIRE_RL_wmi_peerIsReady__dreg_update,
       CAN_FIRE_RL_wmi_reqF_both,
       CAN_FIRE_RL_wmi_reqF_decCtr,
       CAN_FIRE_RL_wmi_reqF_deq,
       CAN_FIRE_RL_wmi_reqF_incCtr,
       CAN_FIRE_RL_wmi_respAdvance,
       CAN_FIRE_RL_wmi_sDataThreadBusy_d__dreg_update,
       CAN_FIRE_RL_wmi_sThreadBusy_d__dreg_update,
       CAN_FIRE_RL_wmrd_mesgBegin,
       CAN_FIRE_RL_wmrd_mesgBodyPreRequest,
       CAN_FIRE_RL_wmrd_mesgBodyRequest,
       CAN_FIRE_RL_wmrd_mesgBodyResponse,
       CAN_FIRE_RL_wmwt_doAbort,
       CAN_FIRE_RL_wmwt_mesgBegin,
       CAN_FIRE_RL_wmwt_messageFinalize,
       CAN_FIRE_RL_wmwt_messagePushImprecise,
       CAN_FIRE_RL_wmwt_messagePushPrecise,
       CAN_FIRE_RL_wmwt_requestPrecise,
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
       CAN_FIRE_RL_wsiS_ext_status_assign,
       CAN_FIRE_RL_wsiS_inc_tBusyCount,
       CAN_FIRE_RL_wsiS_operateD__dreg_update,
       CAN_FIRE_RL_wsiS_peerIsReady__dreg_update,
       CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter,
       CAN_FIRE_RL_wsiS_reqFifo_enq,
       CAN_FIRE_RL_wsiS_update_statusR,
       CAN_FIRE_RL_wsi_Es_doAlways,
       CAN_FIRE_RL_wsipass_doMessagePush,
       CAN_FIRE_wciS0_mAddr,
       CAN_FIRE_wciS0_mAddrSpace,
       CAN_FIRE_wciS0_mByteEn,
       CAN_FIRE_wciS0_mCmd,
       CAN_FIRE_wciS0_mData,
       CAN_FIRE_wciS0_mFlag,
       CAN_FIRE_wmiM_sData,
       CAN_FIRE_wmiM_sDataThreadBusy,
       CAN_FIRE_wmiM_sFlag,
       CAN_FIRE_wmiM_sReset_n,
       CAN_FIRE_wmiM_sResp,
       CAN_FIRE_wmiM_sRespLast,
       CAN_FIRE_wmiM_sThreadBusy,
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
       WILL_FIRE_RL_fabRespCredit_accumulate,
       WILL_FIRE_RL_mesgPreRequest__dreg_update,
       WILL_FIRE_RL_operating_actions,
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
       WILL_FIRE_RL_wmi_Em_doAlways,
       WILL_FIRE_RL_wmi_dhF_both,
       WILL_FIRE_RL_wmi_dhF_decCtr,
       WILL_FIRE_RL_wmi_dhF_deq,
       WILL_FIRE_RL_wmi_dhF_incCtr,
       WILL_FIRE_RL_wmi_mFlagF_both,
       WILL_FIRE_RL_wmi_mFlagF_decCtr,
       WILL_FIRE_RL_wmi_mFlagF_incCtr,
       WILL_FIRE_RL_wmi_operateD__dreg_update,
       WILL_FIRE_RL_wmi_peerIsReady__dreg_update,
       WILL_FIRE_RL_wmi_reqF_both,
       WILL_FIRE_RL_wmi_reqF_decCtr,
       WILL_FIRE_RL_wmi_reqF_deq,
       WILL_FIRE_RL_wmi_reqF_incCtr,
       WILL_FIRE_RL_wmi_respAdvance,
       WILL_FIRE_RL_wmi_sDataThreadBusy_d__dreg_update,
       WILL_FIRE_RL_wmi_sThreadBusy_d__dreg_update,
       WILL_FIRE_RL_wmrd_mesgBegin,
       WILL_FIRE_RL_wmrd_mesgBodyPreRequest,
       WILL_FIRE_RL_wmrd_mesgBodyRequest,
       WILL_FIRE_RL_wmrd_mesgBodyResponse,
       WILL_FIRE_RL_wmwt_doAbort,
       WILL_FIRE_RL_wmwt_mesgBegin,
       WILL_FIRE_RL_wmwt_messageFinalize,
       WILL_FIRE_RL_wmwt_messagePushImprecise,
       WILL_FIRE_RL_wmwt_messagePushPrecise,
       WILL_FIRE_RL_wmwt_requestPrecise,
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
       WILL_FIRE_RL_wsiS_ext_status_assign,
       WILL_FIRE_RL_wsiS_inc_tBusyCount,
       WILL_FIRE_RL_wsiS_operateD__dreg_update,
       WILL_FIRE_RL_wsiS_peerIsReady__dreg_update,
       WILL_FIRE_RL_wsiS_reqFifo__updateLevelCounter,
       WILL_FIRE_RL_wsiS_reqFifo_enq,
       WILL_FIRE_RL_wsiS_update_statusR,
       WILL_FIRE_RL_wsi_Es_doAlways,
       WILL_FIRE_RL_wsipass_doMessagePush,
       WILL_FIRE_wciS0_mAddr,
       WILL_FIRE_wciS0_mAddrSpace,
       WILL_FIRE_wciS0_mByteEn,
       WILL_FIRE_wciS0_mCmd,
       WILL_FIRE_wciS0_mData,
       WILL_FIRE_wciS0_mFlag,
       WILL_FIRE_wmiM_sData,
       WILL_FIRE_wmiM_sDataThreadBusy,
       WILL_FIRE_wmiM_sFlag,
       WILL_FIRE_wmiM_sReset_n,
       WILL_FIRE_wmiM_sResp,
       WILL_FIRE_wmiM_sRespLast,
       WILL_FIRE_wmiM_sThreadBusy,
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
  reg [33 : 0] MUX_wci_respF_q_0$write_1__VAL_2;
  reg [31 : 0] MUX_wmi_reqF_q_0$write_1__VAL_2;
  wire [60 : 0] MUX_wsiM_reqFifo_q_0$write_1__VAL_1,
		MUX_wsiM_reqFifo_q_0$write_1__VAL_2,
		MUX_wsiM_reqFifo_q_1$write_1__VAL_1,
		MUX_wsiM_reqFifo_x_wire$wset_1__VAL_1;
  wire [37 : 0] MUX_wmi_dhF_q_0$write_1__VAL_1,
		MUX_wmi_dhF_q_0$write_1__VAL_2,
		MUX_wmi_dhF_q_1$write_1__VAL_1,
		MUX_wmi_dhF_x_wire$wset_1__VAL_1,
		MUX_wmi_dhF_x_wire$wset_1__VAL_2;
  wire [33 : 0] MUX_wci_respF_q_0$write_1__VAL_1,
		MUX_wci_respF_q_1$write_1__VAL_1,
		MUX_wci_respF_x_wire$wset_1__VAL_1,
		MUX_wci_respF_x_wire$wset_1__VAL_2;
  wire [31 : 0] MUX_mesgCount$write_1__VAL_2,
		MUX_thisMesg$write_1__VAL_1,
		MUX_thisMesg$write_1__VAL_2,
		MUX_wmi_mFlagF_q_0$write_1__VAL_1,
		MUX_wmi_mFlagF_q_1$write_1__VAL_1,
		MUX_wmi_mFlagF_x_wire$wset_1__VAL_1,
		MUX_wmi_mFlagF_x_wire$wset_1__VAL_3,
		MUX_wmi_reqF_q_0$write_1__VAL_1,
		MUX_wmi_reqF_q_1$write_1__VAL_1,
		MUX_wmi_reqF_x_wire$wset_1__VAL_1,
		MUX_wmi_reqF_x_wire$wset_1__VAL_2,
		MUX_wmi_reqF_x_wire$wset_1__VAL_3;
  wire [15 : 0] MUX_unrollCnt$write_1__VAL_1, MUX_unrollCnt$write_1__VAL_2;
  wire [14 : 0] MUX_mesgLength$write_1__VAL_2, MUX_mesgLength$write_1__VAL_4;
  wire [13 : 0] MUX_fabWordsRemain$write_1__VAL_1,
		MUX_fabWordsRemain$write_1__VAL_2,
		MUX_mesgLengthSoFar$write_1__VAL_2,
		MUX_mesgReqAddr$write_1__VAL_2;
  wire [11 : 0] MUX_wsiWordsRemain$write_1__VAL_2;
  wire [8 : 0] MUX_opcode$write_1__VAL_2;
  wire [3 : 0] MUX_fabRespCredit_value$write_1__VAL_2;
  wire [1 : 0] MUX_wci_respF_c_r$write_1__VAL_1,
	       MUX_wci_respF_c_r$write_1__VAL_2,
	       MUX_wmi_dhF_c_r$write_1__VAL_1,
	       MUX_wmi_dhF_c_r$write_1__VAL_2,
	       MUX_wmi_mFlagF_c_r$write_1__VAL_1,
	       MUX_wmi_mFlagF_c_r$write_1__VAL_2,
	       MUX_wmi_reqF_c_r$write_1__VAL_1,
	       MUX_wmi_reqF_c_r$write_1__VAL_2,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_1,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_2;
  wire MUX_endOfMessage$write_1__PSEL_1,
       MUX_endOfMessage$write_1__SEL_1,
       MUX_endOfMessage$write_1__SEL_2,
       MUX_impreciseBurst$write_1__PSEL_2,
       MUX_impreciseBurst$write_1__SEL_1,
       MUX_impreciseBurst$write_1__SEL_2,
       MUX_lastMesg$write_1__SEL_2,
       MUX_mesgCount$write_1__SEL_1,
       MUX_mesgLength$write_1__SEL_2,
       MUX_mesgReqValid$write_1__SEL_2,
       MUX_wci_illegalEdge$write_1__SEL_1,
       MUX_wci_illegalEdge$write_1__SEL_2,
       MUX_wci_illegalEdge$write_1__VAL_2,
       MUX_wci_respF_q_0$write_1__SEL_2,
       MUX_wci_respF_q_1$write_1__SEL_2,
       MUX_wmi_dhF_q_0$write_1__SEL_2,
       MUX_wmi_dhF_q_1$write_1__SEL_2,
       MUX_wmi_mFlagF_q_0$write_1__SEL_2,
       MUX_wmi_mFlagF_q_1$write_1__SEL_2,
       MUX_wmi_mFlagF_x_wire$wset_1__SEL_2,
       MUX_wmi_reqF_q_0$write_1__SEL_2,
       MUX_wmi_reqF_q_1$write_1__SEL_2,
       MUX_wsiM_reqFifo_q_0$write_1__SEL_2,
       MUX_wsiM_reqFifo_q_1$write_1__SEL_2,
       MUX_wsiM_reqFifo_x_wire$wset_1__SEL_1,
       MUX_wsiWordsRemain$write_1__SEL_2;
  // remaining internal signals
  reg [63 : 0] v__h15314,
	       v__h16237,
	       v__h16483,
	       v__h18178,
	       v__h18255,
	       v__h19472,
	       v__h2653,
	       v__h2800,
	       v__h3699;
  reg [31 : 0] value__h6065, x_data__h15447;
  wire [31 : 0] rdat__h15540;
  wire [23 : 0] mesgMetaF_length__h16810, mesgMetaF_length__h17725;
  wire [15 : 0] wsiBurstLength__h18456, x__h15543, x_length__h17088;
  wire [13 : 0] IF_mesgLength_22_BIT_14_23_THEN_mesgLength_22__ETC___d753,
		addr__h16647,
		b__h19086,
		mlp1B__h16631,
		mlp1__h16630;
  wire [11 : 0] bl__h17582, x_burstLength__h18561;
  wire [7 : 0] mesgMetaF_opcode__h16809;
  wire [3 : 0] b__h13937, x_byteEn__h18563;
  wire NOT_wmi_reqF_c_r_46_EQ_2_47_48_AND_wmi_operate_ETC___d290,
       NOT_wsiS_reqFifo_countReg_53_ULE_1_54___d355,
       wsiS_reqFifo_i_notEmpty__52_AND_wmi_operateD_5_ETC___d165,
       x__h16715,
       x__h18886;
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
  // value method wmiM_mCmd
  assign wmiM_MCmd = wmi_sThreadBusy_d ? 3'd0 : wmi_reqF_q_0[31:29] ;
  // value method wmiM_mReqLast
  assign wmiM_MReqLast = wmi_reqF_q_0[28] ;
  // value method wmiM_mReqInfo
  assign wmiM_MReqInfo = wmi_reqF_q_0[27] ;
  // value method wmiM_mAddrSpace
  assign wmiM_MAddrSpace = wmi_reqF_q_0[26] ;
  // value method wmiM_mAddr
  assign wmiM_MAddr = wmi_reqF_q_0[25:12] ;
  // value method wmiM_mBurstLength
  assign wmiM_MBurstLength = wmi_reqF_q_0[11:0] ;
  // value method wmiM_mDataValid
  assign wmiM_MDataValid = !wmi_sDataThreadBusy_d && wmi_dhF_q_0[37] ;
  // value method wmiM_mDataLast
  assign wmiM_MDataLast = wmi_dhF_q_0[36] ;
  // value method wmiM_mData
  assign wmiM_MData = wmi_dhF_q_0[35:4] ;
  // value method wmiM_mDataByteEn
  assign wmiM_MDataByteEn = wmi_dhF_q_0[3:0] ;
  // action method wmiM_sResp
  assign CAN_FIRE_wmiM_sResp = 1'd1 ;
  assign WILL_FIRE_wmiM_sResp = 1'd1 ;
  // action method wmiM_sData
  assign CAN_FIRE_wmiM_sData = 1'd1 ;
  assign WILL_FIRE_wmiM_sData = 1'd1 ;
  // action method wmiM_sThreadBusy
  assign CAN_FIRE_wmiM_sThreadBusy = 1'd1 ;
  assign WILL_FIRE_wmiM_sThreadBusy = wmiM_SThreadBusy ;
  // action method wmiM_sDataThreadBusy
  assign CAN_FIRE_wmiM_sDataThreadBusy = 1'd1 ;
  assign WILL_FIRE_wmiM_sDataThreadBusy = wmiM_SDataThreadBusy ;
  // action method wmiM_sRespLast
  assign CAN_FIRE_wmiM_sRespLast = 1'd1 ;
  assign WILL_FIRE_wmiM_sRespLast = wmiM_SRespLast ;
  // action method wmiM_sFlag
  assign CAN_FIRE_wmiM_sFlag = 1'd1 ;
  assign WILL_FIRE_wmiM_sFlag = 1'd1 ;
  // value method wmiM_mFlag
  assign wmiM_MFlag = wmi_sThreadBusy_d ? 32'd0 : wmi_mFlagF_q_0 ;
  // value method wmiM_mReset_n
  assign wmiM_MReset_n = !wmi_isReset$VAL && wmi_operateD ;
  // action method wmiM_sReset_n
  assign CAN_FIRE_wmiM_sReset_n = 1'd1 ;
  assign WILL_FIRE_wmiM_sReset_n = wmiM_SReset_n ;
  // value method wsiM1_mCmd
  assign wsiM1_MCmd = wsiM_sThreadBusy_d ? 3'd0 : wsiM_reqFifo_q_0[60:58] ;
  // value method wsiM1_mReqLast
  assign wsiM1_MReqLast = !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[57] ;
  // value method wsiM1_mBurstPrecise
  assign wsiM1_MBurstPrecise = !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[56] ;
  // value method wsiM1_mBurstLength
  assign wsiM1_MBurstLength =
	     wsiM_sThreadBusy_d ? 12'd0 : wsiM_reqFifo_q_0[55:44] ;
  // value method wsiM1_mData
  assign wsiM1_MData = wsiM_reqFifo_q_0[43:12] ;
  // value method wsiM1_mByteEn
  assign wsiM1_MByteEn = wsiM_reqFifo_q_0[11:8] ;
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
	     NOT_wsiS_reqFifo_countReg_53_ULE_1_54___d355 ||
	     wsiS_isReset$VAL ||
	     !wsiS_operateD ||
	     !wsiS_peerIsReady ;
  // value method wsiS1_sReset_n
  assign wsiS1_SReset_n = !wsiS_isReset$VAL && wsiS_operateD ;
  // action method wsiS1_mReset_n
  assign CAN_FIRE_wsiS1_mReset_n = 1'd1 ;
  assign WILL_FIRE_wsiS1_mReset_n = wsiS1_MReset_n ;
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
  // submodule wmi_isReset
  ResetToBool wmi_isReset(.RST(wciS0_MReset_n), .VAL(wmi_isReset$VAL));
  // submodule wmi_respF
  FIFO2 #(.width(32'd34), .guarded(32'd1)) wmi_respF(.RST_N(wciS0_MReset_n),
						     .CLK(wciS0_Clk),
						     .D_IN(wmi_respF$D_IN),
						     .ENQ(wmi_respF$ENQ),
						     .DEQ(wmi_respF$DEQ),
						     .CLR(wmi_respF$CLR),
						     .D_OUT(wmi_respF$D_OUT),
						     .FULL_N(wmi_respF$FULL_N),
						     .EMPTY_N(wmi_respF$EMPTY_N));
  // submodule wsiM_isReset
  ResetToBool wsiM_isReset(.RST(wciS0_MReset_n), .VAL(wsiM_isReset$VAL));
  // submodule wsiS_isReset
  ResetToBool wsiS_isReset(.RST(wciS0_MReset_n), .VAL(wsiS_isReset$VAL));
  // submodule wsiS_reqFifo
  SizedFIFO #(.p1width(32'd61),
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
  // rule RL_wci_request_decode
  assign CAN_FIRE_RL_wci_request_decode = wci_reqF$EMPTY_N ;
  assign WILL_FIRE_RL_wci_request_decode = wci_reqF$EMPTY_N ;
  // rule RL_wsiM_ext_status_assign
  assign CAN_FIRE_RL_wsiM_ext_status_assign = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_ext_status_assign = 1'd1 ;
  // rule RL_wsiS_ext_status_assign
  assign CAN_FIRE_RL_wsiS_ext_status_assign = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_ext_status_assign = 1'd1 ;
  // rule RL_wci_cfrd
  assign CAN_FIRE_RL_wci_cfrd =
	     wci_respF_c_r != 2'd2 && wci_reqF$EMPTY_N &&
	     wci_wci_cfrd_pw$whas ;
  assign WILL_FIRE_RL_wci_cfrd =
	     CAN_FIRE_RL_wci_cfrd && !WILL_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wmrd_mesgBodyRequest
  assign CAN_FIRE_RL_wmrd_mesgBodyRequest =
	     NOT_wmi_reqF_c_r_46_EQ_2_47_48_AND_wmi_operate_ETC___d290 &&
	     wci_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h1 || smaCtrl[3:0] == 4'h4 ||
	      smaCtrl[3:0] == 4'h9) &&
	     mesgPreRequest ;
  assign WILL_FIRE_RL_wmrd_mesgBodyRequest =
	     CAN_FIRE_RL_wmrd_mesgBodyRequest ;
  // rule RL_wmrd_mesgBodyPreRequest
  assign CAN_FIRE_RL_wmrd_mesgBodyPreRequest =
	     wci_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h1 || smaCtrl[3:0] == 4'h4 ||
	      smaCtrl[3:0] == 4'h9) &&
	     fabWordsRemain != 14'd0 &&
	     (fabRespCredit_value ^ 4'h8) > 4'd8 &&
	     mesgReqOK ;
  assign WILL_FIRE_RL_wmrd_mesgBodyPreRequest =
	     CAN_FIRE_RL_wmrd_mesgBodyPreRequest &&
	     !WILL_FIRE_RL_wmrd_mesgBodyRequest ;
  // rule RL_wmrd_mesgBegin
  assign CAN_FIRE_RL_wmrd_mesgBegin =
	     wci_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h1 || smaCtrl[3:0] == 4'h4 ||
	      smaCtrl[3:0] == 4'h9) &&
	     !wmi_sThreadBusy_d &&
	     !wmi_sDataThreadBusy_d &&
	     unrollCnt == 16'd0 ;
  assign WILL_FIRE_RL_wmrd_mesgBegin = CAN_FIRE_RL_wmrd_mesgBegin ;
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
  // rule RL_operating_actions
  assign CAN_FIRE_RL_operating_actions = wci_cState == 3'd2 ;
  assign WILL_FIRE_RL_operating_actions = CAN_FIRE_RL_operating_actions ;
  // rule RL_wsiM_update_statusR
  assign CAN_FIRE_RL_wsiM_update_statusR = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_update_statusR = 1'd1 ;
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
  // rule RL_wsiM_operateD__dreg_update
  assign CAN_FIRE_RL_wsiM_operateD__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_operateD__dreg_update = 1'd1 ;
  // rule RL_wsiS_update_statusR
  assign CAN_FIRE_RL_wsiS_update_statusR = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_update_statusR = 1'd1 ;
  // rule RL_wsiS_inc_tBusyCount
  assign CAN_FIRE_RL_wsiS_inc_tBusyCount =
	     wsiS_operateD && wsiS_peerIsReady &&
	     NOT_wsiS_reqFifo_countReg_53_ULE_1_54___d355 ;
  assign WILL_FIRE_RL_wsiS_inc_tBusyCount = CAN_FIRE_RL_wsiS_inc_tBusyCount ;
  // rule RL_wsiS_reqFifo_enq
  assign CAN_FIRE_RL_wsiS_reqFifo_enq =
	     wsiS_operateD && wsiS_peerIsReady &&
	     wsiS_wsiReq$wget[60:58] == 3'd1 ;
  assign WILL_FIRE_RL_wsiS_reqFifo_enq = CAN_FIRE_RL_wsiS_reqFifo_enq ;
  // rule RL_wsiS_peerIsReady__dreg_update
  assign CAN_FIRE_RL_wsiS_peerIsReady__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_peerIsReady__dreg_update = 1'd1 ;
  // rule RL_wsiS_operateD__dreg_update
  assign CAN_FIRE_RL_wsiS_operateD__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_operateD__dreg_update = 1'd1 ;
  // rule RL_wmwt_messagePushImprecise
  assign CAN_FIRE_RL_wmwt_messagePushImprecise =
	     wmi_reqF_c_r != 2'd2 && wmi_dhF_c_r != 2'd2 &&
	     wsiS_reqFifo_i_notEmpty__52_AND_wmi_operateD_5_ETC___d165 &&
	     wci_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h2 || smaCtrl[3:0] == 4'h3) &&
	     readyToPush &&
	     impreciseBurst ;
  assign WILL_FIRE_RL_wmwt_messagePushImprecise =
	     MUX_endOfMessage$write_1__PSEL_1 ;
  // rule RL_wmwt_messagePushPrecise
  assign CAN_FIRE_RL_wmwt_messagePushPrecise =
	     wmi_dhF_c_r != 2'd2 && wsiS_reqFifo$EMPTY_N && wmi_operateD &&
	     wmi_peerIsReady &&
	     wci_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h2 || smaCtrl[3:0] == 4'h3) &&
	     wsiWordsRemain != 12'd0 &&
	     mesgReqValid &&
	     preciseBurst ;
  assign WILL_FIRE_RL_wmwt_messagePushPrecise =
	     MUX_wsiWordsRemain$write_1__SEL_2 ;
  // rule RL_wmwt_requestPrecise
  assign CAN_FIRE_RL_wmwt_requestPrecise =
	     wmi_reqF_c_r != 2'd2 && wmi_mFlagF_c_r != 2'd2 && wmi_operateD &&
	     wmi_peerIsReady &&
	     wci_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h2 || smaCtrl[3:0] == 4'h3) &&
	     readyToRequest &&
	     preciseBurst ;
  assign WILL_FIRE_RL_wmwt_requestPrecise = MUX_mesgReqValid$write_1__SEL_2 ;
  // rule RL_wmwt_messageFinalize
  assign CAN_FIRE_RL_wmwt_messageFinalize = MUX_endOfMessage$write_1__SEL_2 ;
  assign WILL_FIRE_RL_wmwt_messageFinalize = MUX_endOfMessage$write_1__SEL_2 ;
  // rule RL_wmwt_mesgBegin
  assign CAN_FIRE_RL_wmwt_mesgBegin =
	     wsiS_reqFifo$EMPTY_N && wci_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h2 || smaCtrl[3:0] == 4'h3) &&
	     !wmi_sThreadBusy_d &&
	     !wmi_sDataThreadBusy_d &&
	     !opcode[8] ;
  assign WILL_FIRE_RL_wmwt_mesgBegin = MUX_impreciseBurst$write_1__PSEL_2 ;
  // rule RL_wmwt_doAbort
  assign CAN_FIRE_RL_wmwt_doAbort = MUX_impreciseBurst$write_1__SEL_1 ;
  assign WILL_FIRE_RL_wmwt_doAbort = MUX_impreciseBurst$write_1__SEL_1 ;
  // rule RL_wci_Es_doAlways_Req
  assign CAN_FIRE_RL_wci_Es_doAlways_Req = 1'd1 ;
  assign WILL_FIRE_RL_wci_Es_doAlways_Req = 1'd1 ;
  // rule RL_wci_reqF_enq
  assign CAN_FIRE_RL_wci_reqF_enq = wci_wciReq$wget[59:57] != 3'd0 ;
  assign WILL_FIRE_RL_wci_reqF_enq = CAN_FIRE_RL_wci_reqF_enq ;
  // rule RL_wmrd_mesgBodyResponse
  assign CAN_FIRE_RL_wmrd_mesgBodyResponse =
	     wmi_respF$EMPTY_N && (smaCtrl[4] || wsiM_reqFifo_c_r != 2'd2) &&
	     wci_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h1 || smaCtrl[3:0] == 4'h4 ||
	      smaCtrl[3:0] == 4'h9) &&
	     unrollCnt != 16'd0 ;
  assign WILL_FIRE_RL_wmrd_mesgBodyResponse =
	     CAN_FIRE_RL_wmrd_mesgBodyResponse ;
  // rule RL_wsipass_doMessagePush
  assign CAN_FIRE_RL_wsipass_doMessagePush =
	     wsiS_reqFifo$EMPTY_N &&
	     (smaCtrl[4] || wsiM_reqFifo_c_r != 2'd2) &&
	     wci_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h0 || smaCtrl[3:0] == 4'h3) ;
  assign WILL_FIRE_RL_wsipass_doMessagePush =
	     CAN_FIRE_RL_wsipass_doMessagePush &&
	     !WILL_FIRE_RL_wmwt_messagePushPrecise &&
	     !WILL_FIRE_RL_wmwt_messagePushImprecise ;
  // rule RL_wci_cfwr
  assign CAN_FIRE_RL_wci_cfwr =
	     wci_respF_c_r != 2'd2 && wci_reqF$EMPTY_N &&
	     wci_wci_cfwr_pw$whas ;
  assign WILL_FIRE_RL_wci_cfwr =
	     CAN_FIRE_RL_wci_cfwr && !WILL_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_reqF__updateLevelCounter
  assign CAN_FIRE_RL_wci_reqF__updateLevelCounter =
	     (wci_wciReq$wget[59:57] != 3'd0) != wci_reqF_r_deq$whas ;
  assign WILL_FIRE_RL_wci_reqF__updateLevelCounter =
	     CAN_FIRE_RL_wci_reqF__updateLevelCounter ;
  // rule RL_wsiM_reqFifo_both
  assign CAN_FIRE_RL_wsiM_reqFifo_both =
	     ((wsiM_reqFifo_c_r == 2'd1) ?
		wsiM_reqFifo_x_wire$whas :
		wsiM_reqFifo_c_r != 2'd2 || wsiM_reqFifo_x_wire$whas) &&
	     CAN_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_enqueueing$whas ;
  assign WILL_FIRE_RL_wsiM_reqFifo_both = CAN_FIRE_RL_wsiM_reqFifo_both ;
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
  // rule RL_wsiS_reqFifo__updateLevelCounter
  assign CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter =
	     CAN_FIRE_RL_wsiS_reqFifo_enq != wsiS_reqFifo_r_deq$whas ;
  assign WILL_FIRE_RL_wsiS_reqFifo__updateLevelCounter =
	     CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter ;
  // rule RL_wmi_Em_doAlways
  assign CAN_FIRE_RL_wmi_Em_doAlways = 1'd1 ;
  assign WILL_FIRE_RL_wmi_Em_doAlways = 1'd1 ;
  // rule RL_mesgPreRequest__dreg_update
  assign CAN_FIRE_RL_mesgPreRequest__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_mesgPreRequest__dreg_update = 1'd1 ;
  // rule RL_fabRespCredit_accumulate
  assign CAN_FIRE_RL_fabRespCredit_accumulate = 1'd1 ;
  assign WILL_FIRE_RL_fabRespCredit_accumulate = 1'd1 ;
  // rule RL_wci_ctrl_IsO
  assign CAN_FIRE_RL_wci_ctrl_IsO =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd1 &&
	     wci_reqF$D_OUT[36:34] == 3'd1 ;
  assign WILL_FIRE_RL_wci_ctrl_IsO = CAN_FIRE_RL_wci_ctrl_IsO ;
  // rule RL_wci_ctl_op_complete
  assign CAN_FIRE_RL_wci_ctl_op_complete =
	     wci_respF_c_r != 2'd2 && wci_ctlOpActive && wci_ctlAckReg ;
  assign WILL_FIRE_RL_wci_ctl_op_complete = CAN_FIRE_RL_wci_ctl_op_complete ;
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
  // rule RL_wmi_respAdvance
  assign CAN_FIRE_RL_wmi_respAdvance =
	     wmi_respF$FULL_N && wmi_operateD && wmi_peerIsReady &&
	     wmi_wmiResponse$wget[33:32] != 2'd0 ;
  assign WILL_FIRE_RL_wmi_respAdvance = CAN_FIRE_RL_wmi_respAdvance ;
  // rule RL_wmi_dhF_deq
  assign CAN_FIRE_RL_wmi_dhF_deq = !wmi_sDataThreadBusy_d ;
  assign WILL_FIRE_RL_wmi_dhF_deq = CAN_FIRE_RL_wmi_dhF_deq ;
  // rule RL_wmi_reqF_deq
  assign CAN_FIRE_RL_wmi_reqF_deq = !wmi_sThreadBusy_d ;
  assign WILL_FIRE_RL_wmi_reqF_deq = CAN_FIRE_RL_wmi_reqF_deq ;
  // rule RL_wmi_peerIsReady__dreg_update
  assign CAN_FIRE_RL_wmi_peerIsReady__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wmi_peerIsReady__dreg_update = 1'd1 ;
  // rule RL_wmi_operateD__dreg_update
  assign CAN_FIRE_RL_wmi_operateD__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wmi_operateD__dreg_update = 1'd1 ;
  // rule RL_wmi_sDataThreadBusy_d__dreg_update
  assign CAN_FIRE_RL_wmi_sDataThreadBusy_d__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wmi_sDataThreadBusy_d__dreg_update = 1'd1 ;
  // rule RL_wmi_sThreadBusy_d__dreg_update
  assign CAN_FIRE_RL_wmi_sThreadBusy_d__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wmi_sThreadBusy_d__dreg_update = 1'd1 ;
  // rule RL_wmi_dhF_decCtr
  assign CAN_FIRE_RL_wmi_dhF_decCtr =
	     wmi_dhF_dequeueing$whas && !wmi_dhF_enqueueing$whas ;
  assign WILL_FIRE_RL_wmi_dhF_decCtr = CAN_FIRE_RL_wmi_dhF_decCtr ;
  // rule RL_wmi_dhF_both
  assign CAN_FIRE_RL_wmi_dhF_both =
	     ((wmi_dhF_c_r == 2'd1) ?
		wmi_dhF_enqueueing$whas :
		wmi_dhF_c_r != 2'd2 || wmi_dhF_enqueueing$whas) &&
	     wmi_dhF_dequeueing$whas &&
	     wmi_dhF_enqueueing$whas ;
  assign WILL_FIRE_RL_wmi_dhF_both = CAN_FIRE_RL_wmi_dhF_both ;
  // rule RL_wmi_dhF_incCtr
  assign CAN_FIRE_RL_wmi_dhF_incCtr =
	     ((wmi_dhF_c_r == 2'd0) ?
		wmi_dhF_enqueueing$whas :
		wmi_dhF_c_r != 2'd1 || wmi_dhF_enqueueing$whas) &&
	     wmi_dhF_enqueueing$whas &&
	     !wmi_dhF_dequeueing$whas ;
  assign WILL_FIRE_RL_wmi_dhF_incCtr = CAN_FIRE_RL_wmi_dhF_incCtr ;
  // rule RL_wmi_mFlagF_both
  assign CAN_FIRE_RL_wmi_mFlagF_both =
	     ((wmi_mFlagF_c_r == 2'd1) ?
		wmi_mFlagF_enqueueing$whas :
		wmi_mFlagF_c_r != 2'd2 || wmi_mFlagF_enqueueing$whas) &&
	     wmi_mFlagF_dequeueing$whas &&
	     wmi_mFlagF_enqueueing$whas ;
  assign WILL_FIRE_RL_wmi_mFlagF_both = CAN_FIRE_RL_wmi_mFlagF_both ;
  // rule RL_wmi_mFlagF_decCtr
  assign CAN_FIRE_RL_wmi_mFlagF_decCtr =
	     wmi_mFlagF_dequeueing$whas && !wmi_mFlagF_enqueueing$whas ;
  assign WILL_FIRE_RL_wmi_mFlagF_decCtr = CAN_FIRE_RL_wmi_mFlagF_decCtr ;
  // rule RL_wmi_mFlagF_incCtr
  assign CAN_FIRE_RL_wmi_mFlagF_incCtr =
	     ((wmi_mFlagF_c_r == 2'd0) ?
		wmi_mFlagF_enqueueing$whas :
		wmi_mFlagF_c_r != 2'd1 || wmi_mFlagF_enqueueing$whas) &&
	     wmi_mFlagF_enqueueing$whas &&
	     !wmi_mFlagF_dequeueing$whas ;
  assign WILL_FIRE_RL_wmi_mFlagF_incCtr = CAN_FIRE_RL_wmi_mFlagF_incCtr ;
  // rule RL_wmi_reqF_both
  assign CAN_FIRE_RL_wmi_reqF_both =
	     ((wmi_reqF_c_r == 2'd1) ?
		wmi_reqF_x_wire$whas :
		wmi_reqF_c_r != 2'd2 || wmi_reqF_x_wire$whas) &&
	     wmi_reqF_dequeueing$whas &&
	     wmi_reqF_enqueueing$whas ;
  assign WILL_FIRE_RL_wmi_reqF_both = CAN_FIRE_RL_wmi_reqF_both ;
  // rule RL_wmi_reqF_incCtr
  assign CAN_FIRE_RL_wmi_reqF_incCtr =
	     ((wmi_reqF_c_r == 2'd0) ?
		wmi_reqF_x_wire$whas :
		wmi_reqF_c_r != 2'd1 || wmi_reqF_x_wire$whas) &&
	     wmi_reqF_enqueueing$whas &&
	     !wmi_reqF_dequeueing$whas ;
  assign WILL_FIRE_RL_wmi_reqF_incCtr = CAN_FIRE_RL_wmi_reqF_incCtr ;
  // rule RL_wmi_reqF_decCtr
  assign CAN_FIRE_RL_wmi_reqF_decCtr =
	     wmi_reqF_dequeueing$whas && !wmi_reqF_enqueueing$whas ;
  assign WILL_FIRE_RL_wmi_reqF_decCtr = CAN_FIRE_RL_wmi_reqF_decCtr ;
  // inputs to muxes for submodule ports
  assign MUX_wci_illegalEdge$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge ;
  assign MUX_wci_illegalEdge$write_1__VAL_2 =
	     wci_reqF$D_OUT[36:34] != 3'd4 && wci_reqF$D_OUT[36:34] != 3'd5 &&
	     wci_reqF$D_OUT[36:34] != 3'd6 ;
  assign MUX_wci_respF_c_r$write_1__VAL_1 = wci_respF_c_r - 2'd1 ;
  assign MUX_wci_respF_c_r$write_1__VAL_2 = wci_respF_c_r + 2'd1 ;
  assign MUX_wci_respF_x_wire$wset_1__VAL_1 =
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
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_1 = wsiM_reqFifo_c_r - 2'd1 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_2 = wsiM_reqFifo_c_r + 2'd1 ;
  assign MUX_endOfMessage$write_1__SEL_2 =
	     wci_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h2 || smaCtrl[3:0] == 4'h3) &&
	     mesgLength[14] &&
	     !doAbort &&
	     (preciseBurst && wsiWordsRemain == 12'd0 ||
	      impreciseBurst && endOfMessage) ;
  assign MUX_impreciseBurst$write_1__SEL_1 =
	     wci_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h2 || smaCtrl[3:0] == 4'h3) &&
	     doAbort ;
  assign MUX_mesgLength$write_1__VAL_2 =
	     (wsiS_reqFifo$D_OUT[11:8] == 4'd0) ?
	       15'd16384 :
	       { 1'd1, wsiS_reqFifo$D_OUT[55:44], 2'd0 } ;
  assign MUX_mesgLengthSoFar$write_1__VAL_2 = mesgLengthSoFar + 14'd1 ;
  assign MUX_opcode$write_1__VAL_2 = { 1'd1, wsiS_reqFifo$D_OUT[7:0] } ;
  assign MUX_wsiWordsRemain$write_1__VAL_2 = wsiWordsRemain - 12'd1 ;
  assign MUX_unrollCnt$write_1__VAL_1 =
	     (wmi_sFlagReg[23:0] == 24'd0) ? 16'd1 : wmi_sFlagReg[17:2] ;
  assign MUX_wsiM_reqFifo_x_wire$wset_1__SEL_1 =
	     WILL_FIRE_RL_wmrd_mesgBodyResponse && !smaCtrl[4] ;
  assign MUX_unrollCnt$write_1__VAL_2 = unrollCnt - 16'd1 ;
  assign MUX_wci_respF_x_wire$wset_1__VAL_2 = { 2'd1, x_data__h15447 } ;
  always@(WILL_FIRE_RL_wci_ctl_op_complete or
	  MUX_wci_respF_x_wire$wset_1__VAL_1 or
	  WILL_FIRE_RL_wci_cfrd or
	  MUX_wci_respF_x_wire$wset_1__VAL_2 or WILL_FIRE_RL_wci_cfwr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wci_ctl_op_complete:
	  MUX_wci_respF_q_0$write_1__VAL_2 =
	      MUX_wci_respF_x_wire$wset_1__VAL_1;
      WILL_FIRE_RL_wci_cfrd:
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
  assign MUX_mesgLength$write_1__VAL_4 = { 1'd1, mlp1B__h16631 } ;
  assign MUX_wsiM_reqFifo_x_wire$wset_1__VAL_1 =
	     { 3'd1,
	       unrollCnt == 16'd1,
	       !smaCtrl[5],
	       x_burstLength__h18561,
	       wmi_respF$D_OUT[31:0],
	       x_byteEn__h18563,
	       thisMesg[23:16] } ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_2 =
	     MUX_wsiM_reqFifo_x_wire$wset_1__SEL_1 ?
	       MUX_wsiM_reqFifo_x_wire$wset_1__VAL_1 :
	       wsiS_reqFifo$D_OUT ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_1 =
	     (wsiM_reqFifo_c_r == 2'd1) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_2 :
	       wsiM_reqFifo_q_1 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__VAL_1 =
	     (wsiM_reqFifo_c_r == 2'd2) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_2 :
	       61'h00000AAAAAAAAA00 ;
  assign MUX_endOfMessage$write_1__PSEL_1 =
	     CAN_FIRE_RL_wmwt_messagePushImprecise &&
	     !WILL_FIRE_RL_wmwt_messageFinalize ;
  assign MUX_endOfMessage$write_1__SEL_1 =
	     WILL_FIRE_RL_wmwt_messagePushImprecise && x__h16715 ;
  assign MUX_mesgReqValid$write_1__SEL_2 =
	     CAN_FIRE_RL_wmwt_requestPrecise &&
	     !WILL_FIRE_RL_wmwt_messagePushImprecise ;
  assign MUX_wsiWordsRemain$write_1__SEL_2 =
	     CAN_FIRE_RL_wmwt_messagePushPrecise &&
	     !WILL_FIRE_RL_wmwt_messagePushImprecise &&
	     !WILL_FIRE_RL_wmwt_messageFinalize ;
  assign MUX_impreciseBurst$write_1__PSEL_2 =
	     CAN_FIRE_RL_wmwt_mesgBegin &&
	     !WILL_FIRE_RL_wmwt_messagePushPrecise &&
	     !WILL_FIRE_RL_wmwt_messagePushImprecise &&
	     !WILL_FIRE_RL_wmwt_messageFinalize ;
  assign MUX_impreciseBurst$write_1__SEL_2 =
	     WILL_FIRE_RL_wmwt_mesgBegin && !wsiS_reqFifo$D_OUT[56] ;
  assign MUX_mesgLength$write_1__SEL_2 =
	     WILL_FIRE_RL_wmwt_mesgBegin && wsiS_reqFifo$D_OUT[56] ;
  assign MUX_wsiM_reqFifo_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ;
  assign MUX_lastMesg$write_1__SEL_2 =
	     WILL_FIRE_RL_wmrd_mesgBegin || WILL_FIRE_RL_wmwt_requestPrecise ;
  assign MUX_mesgCount$write_1__SEL_1 =
	     WILL_FIRE_RL_wmrd_mesgBodyResponse && unrollCnt == 16'd1 ;
  assign MUX_wmi_mFlagF_x_wire$wset_1__SEL_2 =
	     WILL_FIRE_RL_wmrd_mesgBodyRequest && x__h18886 ;
  assign MUX_fabRespCredit_value$write_1__VAL_2 =
	     fabRespCredit_value +
	     (CAN_FIRE_RL_wmrd_mesgBodyRequest ? b__h13937 : 4'd0) +
	     (CAN_FIRE_RL_wmrd_mesgBodyResponse ? 4'd1 : 4'd0) ;
  assign MUX_fabWordsRemain$write_1__VAL_2 = fabWordsRemain - fabWordsCurReq ;
  assign MUX_fabWordsRemain$write_1__VAL_1 =
	     (wmi_sFlagReg[23:0] == 24'd0) ? 14'd1 : wmi_sFlagReg[15:2] ;
  assign MUX_mesgCount$write_1__VAL_2 = mesgCount + 32'd1 ;
  assign MUX_mesgReqAddr$write_1__VAL_2 =
	     mesgReqAddr + { fabWordsCurReq[11:0], 2'd0 } ;
  assign MUX_thisMesg$write_1__VAL_2 =
	     { mesgCount[7:0], wmi_sFlagReg[31:24], wmi_sFlagReg[15:0] } ;
  assign MUX_thisMesg$write_1__VAL_1 =
	     { mesgCount[7:0], mesgMetaF_opcode__h16809, x_length__h17088 } ;
  assign MUX_wmi_dhF_c_r$write_1__VAL_1 = wmi_dhF_c_r - 2'd1 ;
  assign MUX_wmi_dhF_c_r$write_1__VAL_2 = wmi_dhF_c_r + 2'd1 ;
  assign MUX_wmi_mFlagF_c_r$write_1__VAL_1 = wmi_mFlagF_c_r - 2'd1 ;
  assign MUX_wmi_dhF_x_wire$wset_1__VAL_1 =
	     { 1'd1,
	       wsiWordsRemain == 12'd1,
	       wsiS_reqFifo$D_OUT[43:12],
	       4'd0 } ;
  assign MUX_wmi_dhF_x_wire$wset_1__VAL_2 =
	     { 1'd1, x__h16715, wsiS_reqFifo$D_OUT[43:12], 4'd0 } ;
  assign MUX_wmi_dhF_q_0$write_1__VAL_2 =
	     WILL_FIRE_RL_wmwt_messagePushPrecise ?
	       MUX_wmi_dhF_x_wire$wset_1__VAL_1 :
	       MUX_wmi_dhF_x_wire$wset_1__VAL_2 ;
  assign MUX_wmi_dhF_q_0$write_1__VAL_1 =
	     (wmi_dhF_c_r == 2'd1) ?
	       MUX_wmi_dhF_q_0$write_1__VAL_2 :
	       wmi_dhF_q_1 ;
  assign MUX_wmi_dhF_q_1$write_1__VAL_1 =
	     (wmi_dhF_c_r == 2'd2) ?
	       MUX_wmi_dhF_q_0$write_1__VAL_2 :
	       38'h0AAAAAAAAA ;
  assign MUX_wmi_mFlagF_c_r$write_1__VAL_2 = wmi_mFlagF_c_r + 2'd1 ;
  assign MUX_wmi_mFlagF_x_wire$wset_1__VAL_3 =
	     { mesgMetaF_opcode__h16809, mesgMetaF_length__h17725 } ;
  assign MUX_wmi_mFlagF_x_wire$wset_1__VAL_1 =
	     { mesgMetaF_opcode__h16809, mesgMetaF_length__h16810 } ;
  assign MUX_wmi_mFlagF_q_0$write_1__VAL_1 =
	     (wmi_mFlagF_c_r == 2'd1) ? value__h6065 : wmi_mFlagF_q_1 ;
  assign MUX_wmi_mFlagF_q_1$write_1__VAL_1 =
	     (wmi_mFlagF_c_r == 2'd2) ? value__h6065 : 32'd0 ;
  assign MUX_wmi_reqF_c_r$write_1__VAL_1 = wmi_reqF_c_r - 2'd1 ;
  assign MUX_wmi_reqF_c_r$write_1__VAL_2 = wmi_reqF_c_r + 2'd1 ;
  assign MUX_wmi_reqF_x_wire$wset_1__VAL_1 = { 20'd229376, bl__h17582 } ;
  assign MUX_wmi_reqF_x_wire$wset_1__VAL_2 =
	     { 4'd5, x__h18886, 1'b0, mesgReqAddr, fabWordsCurReq[11:0] } ;
  assign MUX_wmi_reqF_x_wire$wset_1__VAL_3 =
	     { 4'd3, x__h16715, 1'b0, addr__h16647, 12'd1 } ;
  always@(WILL_FIRE_RL_wmwt_requestPrecise or
	  MUX_wmi_reqF_x_wire$wset_1__VAL_1 or
	  WILL_FIRE_RL_wmrd_mesgBodyRequest or
	  MUX_wmi_reqF_x_wire$wset_1__VAL_2 or
	  WILL_FIRE_RL_wmwt_messagePushImprecise or
	  MUX_wmi_reqF_x_wire$wset_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmwt_requestPrecise:
	  MUX_wmi_reqF_q_0$write_1__VAL_2 = MUX_wmi_reqF_x_wire$wset_1__VAL_1;
      WILL_FIRE_RL_wmrd_mesgBodyRequest:
	  MUX_wmi_reqF_q_0$write_1__VAL_2 = MUX_wmi_reqF_x_wire$wset_1__VAL_2;
      WILL_FIRE_RL_wmwt_messagePushImprecise:
	  MUX_wmi_reqF_q_0$write_1__VAL_2 = MUX_wmi_reqF_x_wire$wset_1__VAL_3;
      default: MUX_wmi_reqF_q_0$write_1__VAL_2 =
		   32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign MUX_wmi_reqF_q_0$write_1__VAL_1 =
	     (wmi_reqF_c_r == 2'd1) ?
	       MUX_wmi_reqF_q_0$write_1__VAL_2 :
	       wmi_reqF_q_1 ;
  assign MUX_wmi_reqF_q_1$write_1__VAL_1 =
	     (wmi_reqF_c_r == 2'd2) ?
	       MUX_wmi_reqF_q_0$write_1__VAL_2 :
	       32'd178956970 ;
  assign MUX_wmi_reqF_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_reqF_incCtr && wmi_reqF_c_r == 2'd0 ;
  assign MUX_wmi_reqF_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_reqF_incCtr && wmi_reqF_c_r == 2'd1 ;
  assign MUX_wmi_mFlagF_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_mFlagF_incCtr && wmi_mFlagF_c_r == 2'd0 ;
  assign MUX_wmi_mFlagF_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_mFlagF_incCtr && wmi_mFlagF_c_r == 2'd1 ;
  assign MUX_wmi_dhF_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_dhF_incCtr && wmi_dhF_c_r == 2'd0 ;
  assign MUX_wmi_dhF_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_dhF_incCtr && wmi_dhF_c_r == 2'd1 ;
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
  assign wci_wEdge$wget = wci_reqF$D_OUT[36:34] ;
  assign wci_sThreadBusy_pw$whas = 1'b0 ;
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
	     WILL_FIRE_RL_wci_ctl_op_complete || WILL_FIRE_RL_wci_cfrd ||
	     WILL_FIRE_RL_wci_cfwr ;
  assign wci_ctlAckReg_1$wget = 1'd1 ;
  assign wci_wEdge$whas = WILL_FIRE_RL_wci_ctl_op_start ;
  assign wci_ctlAckReg_1$whas =
	     WILL_FIRE_RL_wci_ctrl_OrE || WILL_FIRE_RL_wci_ctrl_IsO ||
	     WILL_FIRE_RL_wci_ctrl_EiI ;
  assign wsiS_wsiReq$wget =
	     { wsiS1_MCmd,
	       wsiS1_MReqLast,
	       wsiS1_MBurstPrecise,
	       wsiS1_MBurstLength,
	       wsiS1_MData,
	       wsiS1_MByteEn,
	       wsiS1_MReqInfo } ;
  assign wsiS_wsiReq$whas = 1'd1 ;
  assign wsiS_reqFifo_r_enq$whas = CAN_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_r_clr$whas = 1'b0 ;
  assign wsiS_operateD_1$wget = 1'd1 ;
  assign wsiS_operateD_1$whas = CAN_FIRE_RL_operating_actions ;
  assign wsiS_peerIsReady_1$wget = 1'd1 ;
  assign wsiS_peerIsReady_1$whas = wsiS1_MReset_n ;
  assign wsiS_extStatusW$wget =
	     { wsiS_pMesgCount, wsiS_iMesgCount, wsiS_tBusyCount } ;
  assign wsiM_reqFifo_dequeueing$whas = CAN_FIRE_RL_wsiM_reqFifo_deq ;
  assign wsiM_operateD_1$wget = 1'd1 ;
  assign wsiM_sThreadBusy_pw$whas = wsiM1_SThreadBusy ;
  assign wsiM_operateD_1$whas = CAN_FIRE_RL_operating_actions ;
  assign wsiM_peerIsReady_1$wget = 1'd1 ;
  assign wsiM_peerIsReady_1$whas = wsiM1_SReset_n ;
  assign wsiM_extStatusW$wget =
	     { wsiM_pMesgCount, wsiM_iMesgCount, wsiM_tBusyCount } ;
  assign wsi_Es_mCmd_w$wget = wsiS1_MCmd ;
  assign wsi_Es_mCmd_w$whas = 1'd1 ;
  assign wsi_Es_mReqLast_w$whas = wsiS1_MReqLast ;
  assign wsi_Es_mBurstPrecise_w$whas = wsiS1_MBurstPrecise ;
  assign wsi_Es_mBurstLength_w$wget = wsiS1_MBurstLength ;
  assign wsi_Es_mBurstLength_w$whas = 1'd1 ;
  assign wsi_Es_mData_w$whas = 1'd1 ;
  assign wsi_Es_mData_w$wget = wsiS1_MData ;
  assign wsi_Es_mByteEn_w$wget = wsiS1_MByteEn ;
  assign wsi_Es_mByteEn_w$whas = 1'd1 ;
  assign wsi_Es_mReqInfo_w$wget = wsiS1_MReqInfo ;
  assign wsi_Es_mReqInfo_w$whas = 1'd1 ;
  assign wsi_Es_mDataInfo_w$whas = 1'd1 ;
  assign wci_Es_mCmd_w$wget = wciS0_MCmd ;
  assign wci_Es_mCmd_w$whas = 1'd1 ;
  assign wci_Es_mAddrSpace_w$wget = wciS0_MAddrSpace ;
  assign wci_Es_mAddrSpace_w$whas = 1'd1 ;
  assign wci_Es_mAddr_w$wget = wciS0_MAddr ;
  assign wci_Es_mAddr_w$whas = 1'd1 ;
  assign wci_Es_mData_w$wget = wciS0_MData ;
  assign wci_Es_mByteEn_w$wget = wciS0_MByteEn ;
  assign wci_Es_mData_w$whas = 1'd1 ;
  assign wci_Es_mByteEn_w$whas = 1'd1 ;
  assign wci_respF_x_wire$wget = MUX_wci_respF_q_0$write_1__VAL_2 ;
  assign wsiM_reqFifo_x_wire$wget = MUX_wsiM_reqFifo_q_0$write_1__VAL_2 ;
  assign wsiS_reqFifo_r_deq$whas =
	     WILL_FIRE_RL_wsipass_doMessagePush ||
	     WILL_FIRE_RL_wmwt_messagePushPrecise ||
	     WILL_FIRE_RL_wmwt_messagePushImprecise ;
  assign wsiM_reqFifo_enqueueing$whas =
	     (WILL_FIRE_RL_wsipass_doMessagePush ||
	      WILL_FIRE_RL_wmrd_mesgBodyResponse) &&
	     !smaCtrl[4] ;
  assign wsiM_reqFifo_x_wire$whas =
	     WILL_FIRE_RL_wmrd_mesgBodyResponse && !smaCtrl[4] ||
	     WILL_FIRE_RL_wsipass_doMessagePush && !smaCtrl[4] ;
  assign wmi_reqF_enqueueing$whas =
	     WILL_FIRE_RL_wmrd_mesgBodyRequest ||
	     WILL_FIRE_RL_wmwt_requestPrecise ||
	     WILL_FIRE_RL_wmwt_messagePushImprecise ;
  assign wmi_reqF_x_wire$wget = MUX_wmi_reqF_q_0$write_1__VAL_2 ;
  assign wmi_reqF_x_wire$whas =
	     WILL_FIRE_RL_wmwt_requestPrecise ||
	     WILL_FIRE_RL_wmrd_mesgBodyRequest ||
	     WILL_FIRE_RL_wmwt_messagePushImprecise ;
  assign wmi_reqF_dequeueing$whas =
	     WILL_FIRE_RL_wmi_reqF_deq && wmi_reqF_c_r != 2'd0 ;
  assign wmi_mFlagF_x_wire$wget = value__h6065 ;
  assign wmi_mFlagF_enqueueing$whas =
	     WILL_FIRE_RL_wmwt_messagePushImprecise && x__h16715 ||
	     WILL_FIRE_RL_wmrd_mesgBodyRequest && x__h18886 ||
	     WILL_FIRE_RL_wmwt_requestPrecise ;
  assign wmi_mFlagF_x_wire$whas = wmi_mFlagF_enqueueing$whas ;
  assign wmi_mFlagF_dequeueing$whas =
	     WILL_FIRE_RL_wmi_reqF_deq && wmi_reqF_q_0[27] &&
	     wmi_mFlagF_c_r != 2'd0 ;
  assign wmi_dhF_enqueueing$whas =
	     WILL_FIRE_RL_wmwt_messagePushPrecise ||
	     WILL_FIRE_RL_wmwt_messagePushImprecise ;
  assign wmi_dhF_x_wire$wget = MUX_wmi_dhF_q_0$write_1__VAL_2 ;
  assign wmi_dhF_x_wire$whas = wmi_dhF_enqueueing$whas ;
  assign wmi_dhF_dequeueing$whas =
	     WILL_FIRE_RL_wmi_dhF_deq && wmi_dhF_c_r != 2'd0 ;
  assign wmi_wmiResponse$wget = { wmiM_SResp, wmiM_SData } ;
  assign wmi_wmiResponse$whas = 1'd1 ;
  assign wmi_sThreadBusy_d_1$wget = 1'd1 ;
  assign wmi_sThreadBusy_d_1$whas = wmiM_SThreadBusy ;
  assign wmi_sDataThreadBusy_d_1$wget = 1'd1 ;
  assign wmi_operateD_1$wget = 1'd1 ;
  assign wmi_sDataThreadBusy_d_1$whas = wmiM_SDataThreadBusy ;
  assign wmi_operateD_1$whas = CAN_FIRE_RL_operating_actions ;
  assign wmi_peerIsReady_1$wget = 1'd1 ;
  assign wmi_peerIsReady_1$whas = wmiM_SReset_n ;
  assign fabRespCredit_acc_v1$wget = b__h13937 ;
  assign fabRespCredit_acc_v2$wget = 4'd1 ;
  assign fabRespCredit_acc_v1$whas = CAN_FIRE_RL_wmrd_mesgBodyRequest ;
  assign fabRespCredit_acc_v2$whas = CAN_FIRE_RL_wmrd_mesgBodyResponse ;
  assign mesgPreRequest_1$whas = WILL_FIRE_RL_wmrd_mesgBodyPreRequest ;
  assign mesgPreRequest_1$wget = 1'd1 ;
  assign wmi_Em_sResp_w$wget = wmiM_SResp ;
  assign wmi_Em_sData_w$wget = wmiM_SData ;
  assign wmi_Em_sResp_w$whas = 1'd1 ;
  assign wmi_Em_sData_w$whas = 1'd1 ;
  // register abortCount
  assign abortCount$D_IN = abortCount + 32'd1 ;
  assign abortCount$EN = MUX_impreciseBurst$write_1__SEL_1 ;
  // register doAbort
  assign doAbort$D_IN = 1'd0 ;
  assign doAbort$EN = MUX_impreciseBurst$write_1__SEL_1 ;
  // register endOfMessage
  assign endOfMessage$D_IN = MUX_endOfMessage$write_1__SEL_1 ;
  assign endOfMessage$EN =
	     WILL_FIRE_RL_wmwt_messagePushImprecise && x__h16715 ||
	     WILL_FIRE_RL_wmwt_messageFinalize ;
  // register errCount
  assign errCount$D_IN = errCount + 32'd1 ;
  assign errCount$EN =
	     WILL_FIRE_RL_wmwt_messagePushImprecise &&
	     wsiS_reqFifo$D_OUT[43:12] != valExpect &&
	     (!x__h16715 || wsiS_reqFifo$D_OUT[11:8] != 4'd0) ;
  // register fabRespCredit_value
  assign fabRespCredit_value$D_IN =
	     WILL_FIRE_RL_wci_ctrl_IsO ?
	       4'd2 :
	       MUX_fabRespCredit_value$write_1__VAL_2 ;
  assign fabRespCredit_value$EN = 1'b1 ;
  // register fabWordsCurReq
  assign fabWordsCurReq$D_IN =
	     (fabWordsRemain <= b__h19086) ? fabWordsRemain : b__h19086 ;
  assign fabWordsCurReq$EN = WILL_FIRE_RL_wmrd_mesgBodyPreRequest ;
  // register fabWordsRemain
  assign fabWordsRemain$D_IN =
	     WILL_FIRE_RL_wmrd_mesgBegin ?
	       MUX_fabWordsRemain$write_1__VAL_1 :
	       MUX_fabWordsRemain$write_1__VAL_2 ;
  assign fabWordsRemain$EN =
	     WILL_FIRE_RL_wmrd_mesgBegin ||
	     WILL_FIRE_RL_wmrd_mesgBodyRequest ;
  // register firstMsgReq
  assign firstMsgReq$EN = 1'b0 ;
  assign firstMsgReq$D_IN = 1'b0 ;
  // register impreciseBurst
  always@(WILL_FIRE_RL_wmwt_doAbort or
	  MUX_impreciseBurst$write_1__SEL_2 or
	  WILL_FIRE_RL_wmwt_messageFinalize)
  case (1'b1)
    WILL_FIRE_RL_wmwt_doAbort: impreciseBurst$D_IN = 1'd0;
    MUX_impreciseBurst$write_1__SEL_2: impreciseBurst$D_IN = 1'd1;
    WILL_FIRE_RL_wmwt_messageFinalize: impreciseBurst$D_IN = 1'd0;
    default: impreciseBurst$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign impreciseBurst$EN =
	     WILL_FIRE_RL_wmwt_mesgBegin && !wsiS_reqFifo$D_OUT[56] ||
	     WILL_FIRE_RL_wmwt_messageFinalize ||
	     WILL_FIRE_RL_wmwt_doAbort ;
  // register lastMesg
  assign lastMesg$D_IN =
	     (MUX_endOfMessage$write_1__SEL_1 ||
	      MUX_lastMesg$write_1__SEL_2) ?
	       thisMesg :
	       32'hFEFEFFFE ;
  assign lastMesg$EN =
	     WILL_FIRE_RL_wmwt_messagePushImprecise && x__h16715 ||
	     WILL_FIRE_RL_wmrd_mesgBegin ||
	     WILL_FIRE_RL_wmwt_requestPrecise ||
	     WILL_FIRE_RL_wci_ctrl_IsO ;
  // register mesgCount
  assign mesgCount$EN =
	     WILL_FIRE_RL_wmrd_mesgBodyResponse && unrollCnt == 16'd1 ||
	     WILL_FIRE_RL_wmwt_messageFinalize ||
	     WILL_FIRE_RL_wci_ctrl_IsO ;
  always@(MUX_mesgCount$write_1__SEL_1 or
	  MUX_mesgCount$write_1__VAL_2 or
	  WILL_FIRE_RL_wmwt_messageFinalize or WILL_FIRE_RL_wci_ctrl_IsO)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_mesgCount$write_1__SEL_1:
	  mesgCount$D_IN = MUX_mesgCount$write_1__VAL_2;
      WILL_FIRE_RL_wmwt_messageFinalize:
	  mesgCount$D_IN = MUX_mesgCount$write_1__VAL_2;
      WILL_FIRE_RL_wci_ctrl_IsO: mesgCount$D_IN = 32'd0;
      default: mesgCount$D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  // register mesgLength
  always@(WILL_FIRE_RL_wmwt_doAbort or
	  MUX_mesgLength$write_1__SEL_2 or
	  MUX_mesgLength$write_1__VAL_2 or
	  WILL_FIRE_RL_wmwt_messageFinalize or
	  MUX_endOfMessage$write_1__SEL_1 or MUX_mesgLength$write_1__VAL_4)
  case (1'b1)
    WILL_FIRE_RL_wmwt_doAbort: mesgLength$D_IN = 15'd10922;
    MUX_mesgLength$write_1__SEL_2:
	mesgLength$D_IN = MUX_mesgLength$write_1__VAL_2;
    WILL_FIRE_RL_wmwt_messageFinalize: mesgLength$D_IN = 15'd10922;
    MUX_endOfMessage$write_1__SEL_1:
	mesgLength$D_IN = MUX_mesgLength$write_1__VAL_4;
    default: mesgLength$D_IN = 15'b010101010101010 /* unspecified value */ ;
  endcase
  assign mesgLength$EN =
	     WILL_FIRE_RL_wmwt_messagePushImprecise && x__h16715 ||
	     WILL_FIRE_RL_wmwt_mesgBegin && wsiS_reqFifo$D_OUT[56] ||
	     WILL_FIRE_RL_wmwt_messageFinalize ||
	     WILL_FIRE_RL_wmwt_doAbort ;
  // register mesgLengthSoFar
  assign mesgLengthSoFar$D_IN =
	     MUX_impreciseBurst$write_1__SEL_2 ?
	       14'd0 :
	       MUX_mesgLengthSoFar$write_1__VAL_2 ;
  assign mesgLengthSoFar$EN =
	     WILL_FIRE_RL_wmwt_mesgBegin && !wsiS_reqFifo$D_OUT[56] ||
	     WILL_FIRE_RL_wmwt_messagePushImprecise ;
  // register mesgPreRequest
  assign mesgPreRequest$D_IN = WILL_FIRE_RL_wmrd_mesgBodyPreRequest ;
  assign mesgPreRequest$EN = 1'd1 ;
  // register mesgReqAddr
  assign mesgReqAddr$D_IN =
	     WILL_FIRE_RL_wmrd_mesgBegin ?
	       14'd0 :
	       MUX_mesgReqAddr$write_1__VAL_2 ;
  assign mesgReqAddr$EN =
	     WILL_FIRE_RL_wmrd_mesgBodyRequest ||
	     WILL_FIRE_RL_wmrd_mesgBegin ;
  // register mesgReqOK
  assign mesgReqOK$D_IN =
	     WILL_FIRE_RL_wmrd_mesgBodyResponse ||
	     WILL_FIRE_RL_wmrd_mesgBegin ;
  assign mesgReqOK$EN =
	     WILL_FIRE_RL_wmrd_mesgBodyPreRequest ||
	     WILL_FIRE_RL_wmrd_mesgBegin ||
	     WILL_FIRE_RL_wmrd_mesgBodyResponse ;
  // register mesgReqValid
  assign mesgReqValid$D_IN = !WILL_FIRE_RL_wmwt_messageFinalize ;
  assign mesgReqValid$EN =
	     WILL_FIRE_RL_wmwt_messageFinalize ||
	     WILL_FIRE_RL_wmwt_requestPrecise ;
  // register opcode
  always@(WILL_FIRE_RL_wmwt_doAbort or
	  WILL_FIRE_RL_wmwt_mesgBegin or
	  MUX_opcode$write_1__VAL_2 or WILL_FIRE_RL_wmwt_messageFinalize)
  case (1'b1)
    WILL_FIRE_RL_wmwt_doAbort: opcode$D_IN = 9'd170;
    WILL_FIRE_RL_wmwt_mesgBegin: opcode$D_IN = MUX_opcode$write_1__VAL_2;
    WILL_FIRE_RL_wmwt_messageFinalize: opcode$D_IN = 9'd170;
    default: opcode$D_IN = 9'b010101010 /* unspecified value */ ;
  endcase
  assign opcode$EN =
	     WILL_FIRE_RL_wmwt_mesgBegin ||
	     WILL_FIRE_RL_wmwt_messageFinalize ||
	     WILL_FIRE_RL_wmwt_doAbort ;
  // register preciseBurst
  always@(WILL_FIRE_RL_wmwt_doAbort or
	  MUX_mesgLength$write_1__SEL_2 or WILL_FIRE_RL_wmwt_messageFinalize)
  case (1'b1)
    WILL_FIRE_RL_wmwt_doAbort: preciseBurst$D_IN = 1'd0;
    MUX_mesgLength$write_1__SEL_2: preciseBurst$D_IN = 1'd1;
    WILL_FIRE_RL_wmwt_messageFinalize: preciseBurst$D_IN = 1'd0;
    default: preciseBurst$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign preciseBurst$EN =
	     WILL_FIRE_RL_wmwt_mesgBegin && wsiS_reqFifo$D_OUT[56] ||
	     WILL_FIRE_RL_wmwt_messageFinalize ||
	     WILL_FIRE_RL_wmwt_doAbort ;
  // register readyToPush
  always@(WILL_FIRE_RL_wmwt_doAbort or
	  MUX_impreciseBurst$write_1__SEL_2 or
	  MUX_endOfMessage$write_1__SEL_1)
  case (1'b1)
    WILL_FIRE_RL_wmwt_doAbort: readyToPush$D_IN = 1'd0;
    MUX_impreciseBurst$write_1__SEL_2: readyToPush$D_IN = 1'd1;
    MUX_endOfMessage$write_1__SEL_1: readyToPush$D_IN = 1'd0;
    default: readyToPush$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign readyToPush$EN =
	     WILL_FIRE_RL_wmwt_messagePushImprecise && x__h16715 ||
	     WILL_FIRE_RL_wmwt_mesgBegin && !wsiS_reqFifo$D_OUT[56] ||
	     WILL_FIRE_RL_wmwt_doAbort ;
  // register readyToRequest
  assign readyToRequest$D_IN = MUX_mesgLength$write_1__SEL_2 ;
  assign readyToRequest$EN =
	     WILL_FIRE_RL_wmwt_mesgBegin && wsiS_reqFifo$D_OUT[56] ||
	     WILL_FIRE_RL_wmwt_requestPrecise ;
  // register smaCtrl
  assign smaCtrl$D_IN = wci_reqF$D_OUT[31:0] ;
  assign smaCtrl$EN = WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h0 ;
  // register thisMesg
  always@(MUX_endOfMessage$write_1__SEL_1 or
	  MUX_thisMesg$write_1__VAL_1 or
	  WILL_FIRE_RL_wmrd_mesgBegin or
	  MUX_thisMesg$write_1__VAL_2 or
	  WILL_FIRE_RL_wmwt_requestPrecise or WILL_FIRE_RL_wci_ctrl_IsO)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_endOfMessage$write_1__SEL_1:
	  thisMesg$D_IN = MUX_thisMesg$write_1__VAL_1;
      WILL_FIRE_RL_wmrd_mesgBegin:
	  thisMesg$D_IN = MUX_thisMesg$write_1__VAL_2;
      WILL_FIRE_RL_wmwt_requestPrecise:
	  thisMesg$D_IN = MUX_thisMesg$write_1__VAL_1;
      WILL_FIRE_RL_wci_ctrl_IsO: thisMesg$D_IN = 32'hFEFEFFFE;
      default: thisMesg$D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign thisMesg$EN =
	     WILL_FIRE_RL_wmwt_messagePushImprecise && x__h16715 ||
	     WILL_FIRE_RL_wmrd_mesgBegin ||
	     WILL_FIRE_RL_wmwt_requestPrecise ||
	     WILL_FIRE_RL_wci_ctrl_IsO ;
  // register unrollCnt
  assign unrollCnt$EN =
	     WILL_FIRE_RL_wmrd_mesgBegin ||
	     WILL_FIRE_RL_wmrd_mesgBodyResponse ;
  assign unrollCnt$D_IN =
	     WILL_FIRE_RL_wmrd_mesgBegin ?
	       MUX_unrollCnt$write_1__VAL_1 :
	       MUX_unrollCnt$write_1__VAL_2 ;
  // register valExpect
  assign valExpect$D_IN = valExpect + 32'd1 ;
  assign valExpect$EN =
	     WILL_FIRE_RL_wmwt_messagePushImprecise &&
	     (!x__h16715 || wsiS_reqFifo$D_OUT[11:8] != 4'd0) ;
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
  // register wmi_busyWithMessage
  assign wmi_busyWithMessage$D_IN = 1'b0 ;
  assign wmi_busyWithMessage$EN = 1'b0 ;
  // register wmi_dhF_c_r
  assign wmi_dhF_c_r$D_IN =
	     WILL_FIRE_RL_wmi_dhF_decCtr ?
	       MUX_wmi_dhF_c_r$write_1__VAL_1 :
	       MUX_wmi_dhF_c_r$write_1__VAL_2 ;
  assign wmi_dhF_c_r$EN =
	     WILL_FIRE_RL_wmi_dhF_decCtr || WILL_FIRE_RL_wmi_dhF_incCtr ;
  // register wmi_dhF_q_0
  always@(WILL_FIRE_RL_wmi_dhF_both or
	  MUX_wmi_dhF_q_0$write_1__VAL_1 or
	  MUX_wmi_dhF_q_0$write_1__SEL_2 or
	  MUX_wmi_dhF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wmi_dhF_decCtr or wmi_dhF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_dhF_both:
	  wmi_dhF_q_0$D_IN = MUX_wmi_dhF_q_0$write_1__VAL_1;
      MUX_wmi_dhF_q_0$write_1__SEL_2:
	  wmi_dhF_q_0$D_IN = MUX_wmi_dhF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wmi_dhF_decCtr: wmi_dhF_q_0$D_IN = wmi_dhF_q_1;
      default: wmi_dhF_q_0$D_IN = 38'h2AAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmi_dhF_q_0$EN =
	     WILL_FIRE_RL_wmi_dhF_both ||
	     WILL_FIRE_RL_wmi_dhF_incCtr && wmi_dhF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wmi_dhF_decCtr ;
  // register wmi_dhF_q_1
  always@(WILL_FIRE_RL_wmi_dhF_both or
	  MUX_wmi_dhF_q_1$write_1__VAL_1 or
	  MUX_wmi_dhF_q_1$write_1__SEL_2 or
	  MUX_wmi_dhF_q_0$write_1__VAL_2 or WILL_FIRE_RL_wmi_dhF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_dhF_both:
	  wmi_dhF_q_1$D_IN = MUX_wmi_dhF_q_1$write_1__VAL_1;
      MUX_wmi_dhF_q_1$write_1__SEL_2:
	  wmi_dhF_q_1$D_IN = MUX_wmi_dhF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wmi_dhF_decCtr: wmi_dhF_q_1$D_IN = 38'h0AAAAAAAAA;
      default: wmi_dhF_q_1$D_IN = 38'h2AAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmi_dhF_q_1$EN =
	     WILL_FIRE_RL_wmi_dhF_both ||
	     WILL_FIRE_RL_wmi_dhF_incCtr && wmi_dhF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wmi_dhF_decCtr ;
  // register wmi_mFlagF_c_r
  assign wmi_mFlagF_c_r$D_IN =
	     WILL_FIRE_RL_wmi_mFlagF_decCtr ?
	       MUX_wmi_mFlagF_c_r$write_1__VAL_1 :
	       MUX_wmi_mFlagF_c_r$write_1__VAL_2 ;
  assign wmi_mFlagF_c_r$EN =
	     WILL_FIRE_RL_wmi_mFlagF_decCtr ||
	     WILL_FIRE_RL_wmi_mFlagF_incCtr ;
  // register wmi_mFlagF_q_0
  always@(WILL_FIRE_RL_wmi_mFlagF_both or
	  MUX_wmi_mFlagF_q_0$write_1__VAL_1 or
	  MUX_wmi_mFlagF_q_0$write_1__SEL_2 or
	  value__h6065 or WILL_FIRE_RL_wmi_mFlagF_decCtr or wmi_mFlagF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_mFlagF_both:
	  wmi_mFlagF_q_0$D_IN = MUX_wmi_mFlagF_q_0$write_1__VAL_1;
      MUX_wmi_mFlagF_q_0$write_1__SEL_2: wmi_mFlagF_q_0$D_IN = value__h6065;
      WILL_FIRE_RL_wmi_mFlagF_decCtr: wmi_mFlagF_q_0$D_IN = wmi_mFlagF_q_1;
      default: wmi_mFlagF_q_0$D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmi_mFlagF_q_0$EN =
	     WILL_FIRE_RL_wmi_mFlagF_both ||
	     WILL_FIRE_RL_wmi_mFlagF_incCtr && wmi_mFlagF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wmi_mFlagF_decCtr ;
  // register wmi_mFlagF_q_1
  always@(WILL_FIRE_RL_wmi_mFlagF_both or
	  MUX_wmi_mFlagF_q_1$write_1__VAL_1 or
	  MUX_wmi_mFlagF_q_1$write_1__SEL_2 or
	  value__h6065 or WILL_FIRE_RL_wmi_mFlagF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_mFlagF_both:
	  wmi_mFlagF_q_1$D_IN = MUX_wmi_mFlagF_q_1$write_1__VAL_1;
      MUX_wmi_mFlagF_q_1$write_1__SEL_2: wmi_mFlagF_q_1$D_IN = value__h6065;
      WILL_FIRE_RL_wmi_mFlagF_decCtr: wmi_mFlagF_q_1$D_IN = 32'd0;
      default: wmi_mFlagF_q_1$D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmi_mFlagF_q_1$EN =
	     WILL_FIRE_RL_wmi_mFlagF_both ||
	     WILL_FIRE_RL_wmi_mFlagF_incCtr && wmi_mFlagF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wmi_mFlagF_decCtr ;
  // register wmi_operateD
  assign wmi_operateD$D_IN = CAN_FIRE_RL_operating_actions ;
  assign wmi_operateD$EN = 1'd1 ;
  // register wmi_peerIsReady
  assign wmi_peerIsReady$D_IN = wmiM_SReset_n ;
  assign wmi_peerIsReady$EN = 1'd1 ;
  // register wmi_reqF_c_r
  assign wmi_reqF_c_r$D_IN =
	     WILL_FIRE_RL_wmi_reqF_decCtr ?
	       MUX_wmi_reqF_c_r$write_1__VAL_1 :
	       MUX_wmi_reqF_c_r$write_1__VAL_2 ;
  assign wmi_reqF_c_r$EN =
	     WILL_FIRE_RL_wmi_reqF_decCtr || WILL_FIRE_RL_wmi_reqF_incCtr ;
  // register wmi_reqF_q_0
  always@(WILL_FIRE_RL_wmi_reqF_both or
	  MUX_wmi_reqF_q_0$write_1__VAL_1 or
	  MUX_wmi_reqF_q_0$write_1__SEL_2 or
	  MUX_wmi_reqF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wmi_reqF_decCtr or wmi_reqF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_reqF_both:
	  wmi_reqF_q_0$D_IN = MUX_wmi_reqF_q_0$write_1__VAL_1;
      MUX_wmi_reqF_q_0$write_1__SEL_2:
	  wmi_reqF_q_0$D_IN = MUX_wmi_reqF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wmi_reqF_decCtr: wmi_reqF_q_0$D_IN = wmi_reqF_q_1;
      default: wmi_reqF_q_0$D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmi_reqF_q_0$EN =
	     WILL_FIRE_RL_wmi_reqF_both ||
	     WILL_FIRE_RL_wmi_reqF_incCtr && wmi_reqF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wmi_reqF_decCtr ;
  // register wmi_reqF_q_1
  always@(WILL_FIRE_RL_wmi_reqF_both or
	  MUX_wmi_reqF_q_1$write_1__VAL_1 or
	  MUX_wmi_reqF_q_1$write_1__SEL_2 or
	  MUX_wmi_reqF_q_0$write_1__VAL_2 or WILL_FIRE_RL_wmi_reqF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_reqF_both:
	  wmi_reqF_q_1$D_IN = MUX_wmi_reqF_q_1$write_1__VAL_1;
      MUX_wmi_reqF_q_1$write_1__SEL_2:
	  wmi_reqF_q_1$D_IN = MUX_wmi_reqF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wmi_reqF_decCtr: wmi_reqF_q_1$D_IN = 32'd178956970;
      default: wmi_reqF_q_1$D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmi_reqF_q_1$EN =
	     WILL_FIRE_RL_wmi_reqF_both ||
	     WILL_FIRE_RL_wmi_reqF_incCtr && wmi_reqF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wmi_reqF_decCtr ;
  // register wmi_sDataThreadBusy_d
  assign wmi_sDataThreadBusy_d$D_IN = wmiM_SDataThreadBusy ;
  assign wmi_sDataThreadBusy_d$EN = 1'd1 ;
  // register wmi_sFlagReg
  assign wmi_sFlagReg$D_IN = wmiM_SFlag ;
  assign wmi_sFlagReg$EN = 1'd1 ;
  // register wmi_sThreadBusy_d
  assign wmi_sThreadBusy_d$D_IN = wmiM_SThreadBusy ;
  assign wmi_sThreadBusy_d$EN = 1'd1 ;
  // register wsiM_burstKind
  assign wsiM_burstKind$D_IN =
	     (wsiM_burstKind == 2'd0) ?
	       (wsiM_reqFifo_q_0[56] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsiM_burstKind$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[60:58] == 3'd1 &&
	     (wsiM_burstKind == 2'd0 ||
	      wsiM_burstKind == 2'd1 && wsiM_reqFifo_q_0[57] ||
	      wsiM_burstKind == 2'd2 && wsiM_reqFifo_q_0[55:44] == 12'd1) ;
  // register wsiM_errorSticky
  assign wsiM_errorSticky$D_IN = 1'b0 ;
  assign wsiM_errorSticky$EN = 1'b0 ;
  // register wsiM_iMesgCount
  assign wsiM_iMesgCount$D_IN = wsiM_iMesgCount + 32'd1 ;
  assign wsiM_iMesgCount$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[60:58] == 3'd1 &&
	     wsiM_burstKind == 2'd2 &&
	     wsiM_reqFifo_q_0[55:44] == 12'd1 ;
  // register wsiM_operateD
  assign wsiM_operateD$D_IN = CAN_FIRE_RL_operating_actions ;
  assign wsiM_operateD$EN = 1'd1 ;
  // register wsiM_pMesgCount
  assign wsiM_pMesgCount$D_IN = wsiM_pMesgCount + 32'd1 ;
  assign wsiM_pMesgCount$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[60:58] == 3'd1 &&
	     wsiM_burstKind == 2'd1 &&
	     wsiM_reqFifo_q_0[57] ;
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
		   61'h0AAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsiM_reqFifo_q_0$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_both ||
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;
  // register wsiM_reqFifo_q_1
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
	  wsiM_reqFifo_q_1$D_IN = 61'h00000AAAAAAAAA00;
      default: wsiM_reqFifo_q_1$D_IN =
		   61'h0AAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsiM_reqFifo_q_1$EN =
	     WILL_FIRE_RL_wsiM_reqFifo_both ||
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;
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
	     wsiM_reqFifo_q_0[60:58] == 3'd1 ;
  // register wsiS_burstKind
  assign wsiS_burstKind$D_IN =
	     (wsiS_burstKind == 2'd0) ?
	       (wsiS_wsiReq$wget[56] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsiS_burstKind$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq &&
	     (wsiS_burstKind == 2'd0 ||
	      wsiS_burstKind == 2'd1 && wsiS_wsiReq$wget[57] ||
	      wsiS_burstKind == 2'd2 && wsiS_wsiReq$wget[55:44] == 12'd1) ;
  // register wsiS_errorSticky
  assign wsiS_errorSticky$D_IN = 1'd1 ;
  assign wsiS_errorSticky$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && !wsiS_reqFifo$FULL_N ;
  // register wsiS_iMesgCount
  assign wsiS_iMesgCount$D_IN = wsiS_iMesgCount + 32'd1 ;
  assign wsiS_iMesgCount$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_burstKind == 2'd2 &&
	     wsiS_wsiReq$wget[55:44] == 12'd1 ;
  // register wsiS_operateD
  assign wsiS_operateD$D_IN = CAN_FIRE_RL_operating_actions ;
  assign wsiS_operateD$EN = 1'd1 ;
  // register wsiS_pMesgCount
  assign wsiS_pMesgCount$D_IN = wsiS_pMesgCount + 32'd1 ;
  assign wsiS_pMesgCount$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_burstKind == 2'd1 &&
	     wsiS_wsiReq$wget[57] ;
  // register wsiS_peerIsReady
  assign wsiS_peerIsReady$D_IN = wsiS1_MReset_n ;
  assign wsiS_peerIsReady$EN = 1'd1 ;
  // register wsiS_reqFifo_countReg
  assign wsiS_reqFifo_countReg$D_IN =
	     CAN_FIRE_RL_wsiS_reqFifo_enq ?
	       wsiS_reqFifo_countReg + 2'd1 :
	       wsiS_reqFifo_countReg - 2'd1 ;
  assign wsiS_reqFifo_countReg$EN =
	     CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter ;
  // register wsiS_statusR
  assign wsiS_statusR$EN = 1'd1 ;
  assign wsiS_statusR$D_IN =
	     { wsiS_isReset$VAL,
	       !wsiS_peerIsReady,
	       !wsiS_operateD,
	       wsiS_errorSticky,
	       wsiS_burstKind != 2'd0,
	       NOT_wsiS_reqFifo_countReg_53_ULE_1_54___d355 ||
	       wsiS_isReset$VAL ||
	       !wsiS_operateD ||
	       !wsiS_peerIsReady,
	       1'd0,
	       wsiS_trafficSticky } ;
  // register wsiS_tBusyCount
  assign wsiS_tBusyCount$D_IN = wsiS_tBusyCount + 32'd1 ;
  assign wsiS_tBusyCount$EN = CAN_FIRE_RL_wsiS_inc_tBusyCount ;
  // register wsiS_trafficSticky
  assign wsiS_trafficSticky$D_IN = 1'd1 ;
  assign wsiS_trafficSticky$EN = CAN_FIRE_RL_wsiS_reqFifo_enq ;
  // register wsiWordsRemain
  assign wsiWordsRemain$D_IN =
	     MUX_mesgLength$write_1__SEL_2 ?
	       wsiS_reqFifo$D_OUT[55:44] :
	       MUX_wsiWordsRemain$write_1__VAL_2 ;
  assign wsiWordsRemain$EN =
	     WILL_FIRE_RL_wmwt_mesgBegin && wsiS_reqFifo$D_OUT[56] ||
	     WILL_FIRE_RL_wmwt_messagePushPrecise ;
  // register zeroLengthMesg
  assign zeroLengthMesg$D_IN = wsiS_reqFifo$D_OUT[11:8] == 4'd0 ;
  assign zeroLengthMesg$EN = MUX_mesgLength$write_1__SEL_2 ;
  // submodule wci_reqF
  assign wci_reqF$D_IN = wci_wciReq$wget ;
  assign wci_reqF$DEQ = wci_reqF_r_deq$whas ;
  assign wci_reqF$ENQ = CAN_FIRE_RL_wci_reqF_enq ;
  assign wci_reqF$CLR = 1'b0 ;
  // submodule wmi_respF
  assign wmi_respF$D_IN = wmi_wmiResponse$wget ;
  assign wmi_respF$DEQ = CAN_FIRE_RL_wmrd_mesgBodyResponse ;
  assign wmi_respF$ENQ = CAN_FIRE_RL_wmi_respAdvance ;
  assign wmi_respF$CLR = 1'b0 ;
  // submodule wsiS_reqFifo
  assign wsiS_reqFifo$D_IN = wsiS_wsiReq$wget ;
  assign wsiS_reqFifo$ENQ = CAN_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo$CLR = 1'b0 ;
  assign wsiS_reqFifo$DEQ = wsiS_reqFifo_r_deq$whas ;
  // remaining internal signals
  assign IF_mesgLength_22_BIT_14_23_THEN_mesgLength_22__ETC___d753 =
	     mesgLength[14] ? mesgLength[13:0] : 14'd0 ;
  assign NOT_wmi_reqF_c_r_46_EQ_2_47_48_AND_wmi_operate_ETC___d290 =
	     wmi_reqF_c_r != 2'd2 && wmi_operateD && wmi_peerIsReady &&
	     (!x__h18886 || wmi_mFlagF_c_r != 2'd2) ;
  assign NOT_wsiS_reqFifo_countReg_53_ULE_1_54___d355 =
	     wsiS_reqFifo_countReg > 2'd1 ;
  assign addr__h16647 = { mesgLengthSoFar[11:0], 2'd0 } ;
  assign b__h13937 = -fabWordsCurReq[3:0] ;
  assign b__h19086 = { {10{fabRespCredit_value[3]}}, fabRespCredit_value } ;
  assign bl__h17582 =
	     zeroLengthMesg ?
	       12'd1 :
	       IF_mesgLength_22_BIT_14_23_THEN_mesgLength_22__ETC___d753[13:2] ;
  assign mesgMetaF_length__h16810 = { 10'd0, mlp1B__h16631 } ;
  assign mesgMetaF_length__h17725 =
	     { 10'd0,
	       IF_mesgLength_22_BIT_14_23_THEN_mesgLength_22__ETC___d753 } ;
  assign mesgMetaF_opcode__h16809 = opcode[8] ? opcode[7:0] : 8'd0 ;
  assign mlp1B__h16631 = { mlp1__h16630[11:0], 2'd0 } ;
  assign mlp1__h16630 = MUX_mesgLengthSoFar$write_1__VAL_2 ;
  assign rdat__h15540 = { 16'd0, x__h15543 } ;
  assign wsiBurstLength__h18456 =
	     smaCtrl[5] ? 16'd2 : { 2'd0, thisMesg[15:2] } ;
  assign wsiS_reqFifo_i_notEmpty__52_AND_wmi_operateD_5_ETC___d165 =
	     wsiS_reqFifo$EMPTY_N && wmi_operateD && wmi_peerIsReady &&
	     (!x__h16715 || wmi_mFlagF_c_r != 2'd2) ;
  assign x__h15543 = { wsiS_statusR, wsiM_statusR } ;
  assign x__h16715 = wsiS_reqFifo$D_OUT[55:44] == 12'd1 ;
  assign x__h18886 = fabWordsRemain == fabWordsCurReq ;
  assign x_burstLength__h18561 =
	     (thisMesg[15:0] == 16'd0 || smaCtrl[5] && unrollCnt == 16'd1) ?
	       12'd1 :
	       (smaCtrl[5] ? 12'd4095 : wsiBurstLength__h18456[11:0]) ;
  assign x_byteEn__h18563 = (thisMesg[15:0] == 16'd0) ? 4'd0 : 4'd15 ;
  assign x_length__h17088 =
	     { 2'd0,
	       IF_mesgLength_22_BIT_14_23_THEN_mesgLength_22__ETC___d753 } ;
  always@(wci_reqF$D_OUT or
	  smaCtrl or
	  mesgCount or
	  abortCount or
	  thisMesg or
	  lastMesg or
	  rdat__h15540 or wsiS_extStatusW$wget or wsiM_extStatusW$wget)
  begin
    case (wci_reqF$D_OUT[39:32])
      8'h0: x_data__h15447 = smaCtrl;
      8'h04: x_data__h15447 = mesgCount;
      8'h08: x_data__h15447 = abortCount;
      8'h10: x_data__h15447 = thisMesg;
      8'h14: x_data__h15447 = lastMesg;
      8'h18: x_data__h15447 = rdat__h15540;
      8'h20: x_data__h15447 = wsiS_extStatusW$wget[95:64];
      8'h24: x_data__h15447 = wsiS_extStatusW$wget[63:32];
      8'h28: x_data__h15447 = wsiS_extStatusW$wget[31:0];
      8'h2C: x_data__h15447 = wsiM_extStatusW$wget[95:64];
      8'h30: x_data__h15447 = wsiM_extStatusW$wget[63:32];
      8'h34: x_data__h15447 = wsiM_extStatusW$wget[31:0];
      default: x_data__h15447 = 32'd0;
    endcase
  end
  always@(MUX_endOfMessage$write_1__SEL_1 or
	  MUX_wmi_mFlagF_x_wire$wset_1__VAL_1 or
	  MUX_wmi_mFlagF_x_wire$wset_1__SEL_2 or
	  WILL_FIRE_RL_wmwt_requestPrecise or
	  MUX_wmi_mFlagF_x_wire$wset_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_endOfMessage$write_1__SEL_1:
	  value__h6065 = MUX_wmi_mFlagF_x_wire$wset_1__VAL_1;
      MUX_wmi_mFlagF_x_wire$wset_1__SEL_2:
	  value__h6065 = 32'hAAAAAAAA /* unspecified value */ ;
      WILL_FIRE_RL_wmwt_requestPrecise:
	  value__h6065 = MUX_wmi_mFlagF_x_wire$wset_1__VAL_3;
      default: value__h6065 = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (!wciS0_MReset_n)
      begin
        abortCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	doAbort <= `BSV_ASSIGNMENT_DELAY 1'd0;
	endOfMessage <= `BSV_ASSIGNMENT_DELAY 1'd0;
	errCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	fabRespCredit_value <= `BSV_ASSIGNMENT_DELAY 4'd0;
	fabWordsRemain <= `BSV_ASSIGNMENT_DELAY 14'd0;
	firstMsgReq <= `BSV_ASSIGNMENT_DELAY 1'd0;
	impreciseBurst <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lastMesg <= `BSV_ASSIGNMENT_DELAY 32'hFEFEFFFE;
	mesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	mesgLength <= `BSV_ASSIGNMENT_DELAY 15'd10922;
	mesgLengthSoFar <= `BSV_ASSIGNMENT_DELAY 14'd0;
	mesgPreRequest <= `BSV_ASSIGNMENT_DELAY 1'd0;
	mesgReqOK <= `BSV_ASSIGNMENT_DELAY 1'd0;
	mesgReqValid <= `BSV_ASSIGNMENT_DELAY 1'd0;
	opcode <= `BSV_ASSIGNMENT_DELAY 9'd170;
	preciseBurst <= `BSV_ASSIGNMENT_DELAY 1'd0;
	readyToPush <= `BSV_ASSIGNMENT_DELAY 1'd0;
	readyToRequest <= `BSV_ASSIGNMENT_DELAY 1'd0;
	smaCtrl <= `BSV_ASSIGNMENT_DELAY smaCtrlInit;
	thisMesg <= `BSV_ASSIGNMENT_DELAY 32'hFEFEFFFE;
	unrollCnt <= `BSV_ASSIGNMENT_DELAY 16'd0;
	valExpect <= `BSV_ASSIGNMENT_DELAY 32'd0;
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
	wmi_busyWithMessage <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_dhF_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmi_dhF_q_0 <= `BSV_ASSIGNMENT_DELAY 38'h0AAAAAAAAA;
	wmi_dhF_q_1 <= `BSV_ASSIGNMENT_DELAY 38'h0AAAAAAAAA;
	wmi_mFlagF_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmi_mFlagF_q_0 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmi_mFlagF_q_1 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmi_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_reqF_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmi_reqF_q_0 <= `BSV_ASSIGNMENT_DELAY 32'd178956970;
	wmi_reqF_q_1 <= `BSV_ASSIGNMENT_DELAY 32'd178956970;
	wmi_sDataThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_sFlagReg <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmi_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd0;
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
	wsiS_tBusyCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiS_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiWordsRemain <= `BSV_ASSIGNMENT_DELAY 12'd0;
	zeroLengthMesg <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (abortCount$EN)
	  abortCount <= `BSV_ASSIGNMENT_DELAY abortCount$D_IN;
	if (doAbort$EN) doAbort <= `BSV_ASSIGNMENT_DELAY doAbort$D_IN;
	if (endOfMessage$EN)
	  endOfMessage <= `BSV_ASSIGNMENT_DELAY endOfMessage$D_IN;
	if (errCount$EN) errCount <= `BSV_ASSIGNMENT_DELAY errCount$D_IN;
	if (fabRespCredit_value$EN)
	  fabRespCredit_value <= `BSV_ASSIGNMENT_DELAY
	      fabRespCredit_value$D_IN;
	if (fabWordsRemain$EN)
	  fabWordsRemain <= `BSV_ASSIGNMENT_DELAY fabWordsRemain$D_IN;
	if (firstMsgReq$EN)
	  firstMsgReq <= `BSV_ASSIGNMENT_DELAY firstMsgReq$D_IN;
	if (impreciseBurst$EN)
	  impreciseBurst <= `BSV_ASSIGNMENT_DELAY impreciseBurst$D_IN;
	if (lastMesg$EN) lastMesg <= `BSV_ASSIGNMENT_DELAY lastMesg$D_IN;
	if (mesgCount$EN) mesgCount <= `BSV_ASSIGNMENT_DELAY mesgCount$D_IN;
	if (mesgLength$EN)
	  mesgLength <= `BSV_ASSIGNMENT_DELAY mesgLength$D_IN;
	if (mesgLengthSoFar$EN)
	  mesgLengthSoFar <= `BSV_ASSIGNMENT_DELAY mesgLengthSoFar$D_IN;
	if (mesgPreRequest$EN)
	  mesgPreRequest <= `BSV_ASSIGNMENT_DELAY mesgPreRequest$D_IN;
	if (mesgReqOK$EN) mesgReqOK <= `BSV_ASSIGNMENT_DELAY mesgReqOK$D_IN;
	if (mesgReqValid$EN)
	  mesgReqValid <= `BSV_ASSIGNMENT_DELAY mesgReqValid$D_IN;
	if (opcode$EN) opcode <= `BSV_ASSIGNMENT_DELAY opcode$D_IN;
	if (preciseBurst$EN)
	  preciseBurst <= `BSV_ASSIGNMENT_DELAY preciseBurst$D_IN;
	if (readyToPush$EN)
	  readyToPush <= `BSV_ASSIGNMENT_DELAY readyToPush$D_IN;
	if (readyToRequest$EN)
	  readyToRequest <= `BSV_ASSIGNMENT_DELAY readyToRequest$D_IN;
	if (smaCtrl$EN) smaCtrl <= `BSV_ASSIGNMENT_DELAY smaCtrl$D_IN;
	if (thisMesg$EN) thisMesg <= `BSV_ASSIGNMENT_DELAY thisMesg$D_IN;
	if (unrollCnt$EN) unrollCnt <= `BSV_ASSIGNMENT_DELAY unrollCnt$D_IN;
	if (valExpect$EN) valExpect <= `BSV_ASSIGNMENT_DELAY valExpect$D_IN;
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
	if (wmi_busyWithMessage$EN)
	  wmi_busyWithMessage <= `BSV_ASSIGNMENT_DELAY
	      wmi_busyWithMessage$D_IN;
	if (wmi_dhF_c_r$EN)
	  wmi_dhF_c_r <= `BSV_ASSIGNMENT_DELAY wmi_dhF_c_r$D_IN;
	if (wmi_dhF_q_0$EN)
	  wmi_dhF_q_0 <= `BSV_ASSIGNMENT_DELAY wmi_dhF_q_0$D_IN;
	if (wmi_dhF_q_1$EN)
	  wmi_dhF_q_1 <= `BSV_ASSIGNMENT_DELAY wmi_dhF_q_1$D_IN;
	if (wmi_mFlagF_c_r$EN)
	  wmi_mFlagF_c_r <= `BSV_ASSIGNMENT_DELAY wmi_mFlagF_c_r$D_IN;
	if (wmi_mFlagF_q_0$EN)
	  wmi_mFlagF_q_0 <= `BSV_ASSIGNMENT_DELAY wmi_mFlagF_q_0$D_IN;
	if (wmi_mFlagF_q_1$EN)
	  wmi_mFlagF_q_1 <= `BSV_ASSIGNMENT_DELAY wmi_mFlagF_q_1$D_IN;
	if (wmi_operateD$EN)
	  wmi_operateD <= `BSV_ASSIGNMENT_DELAY wmi_operateD$D_IN;
	if (wmi_peerIsReady$EN)
	  wmi_peerIsReady <= `BSV_ASSIGNMENT_DELAY wmi_peerIsReady$D_IN;
	if (wmi_reqF_c_r$EN)
	  wmi_reqF_c_r <= `BSV_ASSIGNMENT_DELAY wmi_reqF_c_r$D_IN;
	if (wmi_reqF_q_0$EN)
	  wmi_reqF_q_0 <= `BSV_ASSIGNMENT_DELAY wmi_reqF_q_0$D_IN;
	if (wmi_reqF_q_1$EN)
	  wmi_reqF_q_1 <= `BSV_ASSIGNMENT_DELAY wmi_reqF_q_1$D_IN;
	if (wmi_sDataThreadBusy_d$EN)
	  wmi_sDataThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      wmi_sDataThreadBusy_d$D_IN;
	if (wmi_sFlagReg$EN)
	  wmi_sFlagReg <= `BSV_ASSIGNMENT_DELAY wmi_sFlagReg$D_IN;
	if (wmi_sThreadBusy_d$EN)
	  wmi_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY wmi_sThreadBusy_d$D_IN;
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
	if (wsiS_tBusyCount$EN)
	  wsiS_tBusyCount <= `BSV_ASSIGNMENT_DELAY wsiS_tBusyCount$D_IN;
	if (wsiS_trafficSticky$EN)
	  wsiS_trafficSticky <= `BSV_ASSIGNMENT_DELAY wsiS_trafficSticky$D_IN;
	if (wsiWordsRemain$EN)
	  wsiWordsRemain <= `BSV_ASSIGNMENT_DELAY wsiWordsRemain$D_IN;
	if (zeroLengthMesg$EN)
	  zeroLengthMesg <= `BSV_ASSIGNMENT_DELAY zeroLengthMesg$D_IN;
      end
    if (fabWordsCurReq$EN)
      fabWordsCurReq <= `BSV_ASSIGNMENT_DELAY fabWordsCurReq$D_IN;
    if (mesgReqAddr$EN) mesgReqAddr <= `BSV_ASSIGNMENT_DELAY mesgReqAddr$D_IN;
    if (wsiM_statusR$EN)
      wsiM_statusR <= `BSV_ASSIGNMENT_DELAY wsiM_statusR$D_IN;
    if (wsiS_statusR$EN)
      wsiS_statusR <= `BSV_ASSIGNMENT_DELAY wsiS_statusR$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    abortCount = 32'hAAAAAAAA;
    doAbort = 1'h0;
    endOfMessage = 1'h0;
    errCount = 32'hAAAAAAAA;
    fabRespCredit_value = 4'hA;
    fabWordsCurReq = 14'h2AAA;
    fabWordsRemain = 14'h2AAA;
    firstMsgReq = 1'h0;
    impreciseBurst = 1'h0;
    lastMesg = 32'hAAAAAAAA;
    mesgCount = 32'hAAAAAAAA;
    mesgLength = 15'h2AAA;
    mesgLengthSoFar = 14'h2AAA;
    mesgPreRequest = 1'h0;
    mesgReqAddr = 14'h2AAA;
    mesgReqOK = 1'h0;
    mesgReqValid = 1'h0;
    opcode = 9'h0AA;
    preciseBurst = 1'h0;
    readyToPush = 1'h0;
    readyToRequest = 1'h0;
    smaCtrl = 32'hAAAAAAAA;
    thisMesg = 32'hAAAAAAAA;
    unrollCnt = 16'hAAAA;
    valExpect = 32'hAAAAAAAA;
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
    wmi_busyWithMessage = 1'h0;
    wmi_dhF_c_r = 2'h2;
    wmi_dhF_q_0 = 38'h2AAAAAAAAA;
    wmi_dhF_q_1 = 38'h2AAAAAAAAA;
    wmi_mFlagF_c_r = 2'h2;
    wmi_mFlagF_q_0 = 32'hAAAAAAAA;
    wmi_mFlagF_q_1 = 32'hAAAAAAAA;
    wmi_operateD = 1'h0;
    wmi_peerIsReady = 1'h0;
    wmi_reqF_c_r = 2'h2;
    wmi_reqF_q_0 = 32'hAAAAAAAA;
    wmi_reqF_q_1 = 32'hAAAAAAAA;
    wmi_sDataThreadBusy_d = 1'h0;
    wmi_sFlagReg = 32'hAAAAAAAA;
    wmi_sThreadBusy_d = 1'h0;
    wsiM_burstKind = 2'h2;
    wsiM_errorSticky = 1'h0;
    wsiM_iMesgCount = 32'hAAAAAAAA;
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
    wsiS_operateD = 1'h0;
    wsiS_pMesgCount = 32'hAAAAAAAA;
    wsiS_peerIsReady = 1'h0;
    wsiS_reqFifo_countReg = 2'h2;
    wsiS_statusR = 8'hAA;
    wsiS_tBusyCount = 32'hAAAAAAAA;
    wsiS_trafficSticky = 1'h0;
    wsiWordsRemain = 12'hAAA;
    zeroLengthMesg = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge wciS0_Clk)
  begin
    #0;
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wmrd_mesgBegin)
	begin
	  v__h19472 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wmrd_mesgBegin)
	$display("[%0d]: %m: wmrd_mesgBegin mesgCount:%0h mesgLength:%0h reqInfo:%0h",
		 v__h19472,
		 mesgCount,
		 wmi_sFlagReg[23:0],
		 wmi_sFlagReg[31:24]);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_start)
	begin
	  v__h3699 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3699,
		 wci_reqF$D_OUT[36:34],
		 wci_cState);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/SMAdapter.bsv\", line 298, column 6: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_EiI and RL_wci_cfrd fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_OrE && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/SMAdapter.bsv\", line 299, column 6: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_OrE and RL_wci_ctrl_EiI fired in the\n  same clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_OrE && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/SMAdapter.bsv\", line 299, column 6: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_OrE and RL_wci_cfrd fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wmwt_messageFinalize)
	begin
	  v__h16237 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wmwt_messageFinalize)
	$display("[%0d]: %m: wmwt_messageFinalize mesgCount:%0x WSI mesgLength:%0x",
		 v__h16237,
		 mesgCount,
		 IF_mesgLength_22_BIT_14_23_THEN_mesgLength_22__ETC___d753);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wmwt_mesgBegin && wsiS_reqFifo$D_OUT[56])
	begin
	  v__h18178 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wmwt_mesgBegin && wsiS_reqFifo$D_OUT[56])
	$display("[%0d]: %m: mesgBegin PRECISE mesgCount:%0x WSI burstLength:%0x reqInfo:%0x",
		 v__h18178,
		 mesgCount,
		 wsiS_reqFifo$D_OUT[55:44],
		 wsiS_reqFifo$D_OUT[7:0]);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wmwt_mesgBegin && !wsiS_reqFifo$D_OUT[56])
	begin
	  v__h18255 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wmwt_mesgBegin && !wsiS_reqFifo$D_OUT[56])
	$display("[%0d]: %m: wmwt_mesgBegin IMPRECISE mesgCount:%0x",
		 v__h18255,
		 mesgCount);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wmwt_doAbort)
	begin
	  v__h16483 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wmwt_doAbort)
	$display("[%0d]: %m: wmwt_doAbort", v__h16483);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/SMAdapter.bsv\", line 257, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfwr and RL_wci_ctrl_OrE fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/SMAdapter.bsv\", line 257, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfwr and RL_wci_ctrl_EiI fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/SMAdapter.bsv\", line 257, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfwr and RL_wci_cfrd fired in the same clock\n  cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	begin
	  v__h15314 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	$display("[%0d]: %m: Starting SMAdapter smaCtrl:%0x",
		 v__h15314,
		 smaCtrl);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/SMAdapter.bsv\", line 289, column 6: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_IsO and RL_wci_ctrl_OrE fired in the\n  same clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/SMAdapter.bsv\", line 289, column 6: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_IsO and RL_wci_ctrl_EiI fired in the\n  same clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/SMAdapter.bsv\", line 289, column 6: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_IsO and RL_wci_cfrd fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_cfwr)
	$display("Error: \"bsv/SMAdapter.bsv\", line 289, column 6: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_IsO and RL_wci_cfwr fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	begin
	  v__h2800 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h2800,
		 wci_cEdge,
		 wci_cState);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	begin
	  v__h2653 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h2653,
		 wci_cEdge,
		 wci_cState,
		 wci_nState);
  end
  // synopsys translate_on
endmodule