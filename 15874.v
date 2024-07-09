module outputs
  wire [127 : 0] wmiM0_MData, wsiM0_MData;
  wire [31 : 0] wciS0_SData, wmiM0_MFlag;
  wire [15 : 0] wmiM0_MDataByteEn, wsiM0_MByteEn;
  wire [13 : 0] wmiM0_MAddr;
  wire [11 : 0] wmiM0_MBurstLength, wsiM0_MBurstLength;
  wire [7 : 0] wsiM0_MReqInfo;
  wire [2 : 0] wmiM0_MCmd, wsiM0_MCmd;
  wire [1 : 0] wciS0_SFlag, wciS0_SResp;
  wire wciS0_SThreadBusy,
       wmiM0_MAddrSpace,
       wmiM0_MDataLast,
       wmiM0_MDataValid,
       wmiM0_MReqInfo,
       wmiM0_MReqLast,
       wmiM0_MReset_n,
       wsiM0_MBurstPrecise,
       wsiM0_MReqLast,
       wsiM0_MReset_n,
       wsiS0_SReset_n,
       wsiS0_SThreadBusy;
  // inlined wires
  wire [168 : 0] respF_wDataIn_wget,
		 respF_wDataOut_wget,
		 wsiM_reqFifo_x_wire_wget,
		 wsiS_wsiReq_wget;
  wire [145 : 0] wmi_dhF_x_wire_wget;
  wire [129 : 0] wmi_wmiResponse_wget;
  wire [127 : 0] wmi_Em_sData_w_wget, wsi_Es_mData_w_wget;
  wire [95 : 0] wsiM_extStatusW_wget, wsiS_extStatusW_wget;
  wire [71 : 0] wci_wslv_wciReq_wget;
  wire [33 : 0] wci_wslv_respF_x_wire_wget;
  wire [31 : 0] wci_wci_Es_mAddr_w_wget,
		wci_wci_Es_mData_w_wget,
		wmi_mFlagF_x_wire_wget,
		wmi_reqF_x_wire_wget;
  wire [15 : 0] wsi_Es_mByteEn_w_wget;
  wire [11 : 0] fabRespCredit_acc_v1_wget,
		fabRespCredit_acc_v2_wget,
		wsi_Es_mBurstLength_w_wget;
  wire [7 : 0] wsi_Es_mReqInfo_w_wget;
  wire [3 : 0] wci_wci_Es_mByteEn_w_wget;
  wire [2 : 0] wci_wci_Es_mCmd_w_wget,
	       wci_wslv_wEdge_wget,
	       wsi_Es_mCmd_w_wget;
  wire [1 : 0] wmi_Em_sResp_w_wget;
  wire fabRespCredit_acc_v1_whas,
       fabRespCredit_acc_v2_whas,
       mesgPreRequest_1_wget,
       mesgPreRequest_1_whas,
       respF_pwClear_whas,
       respF_pwDequeue_whas,
       respF_pwEnqueue_whas,
       respF_wDataIn_whas,
       respF_wDataOut_whas,
       wci_wci_Es_mAddrSpace_w_wget,
       wci_wci_Es_mAddrSpace_w_whas,
       wci_wci_Es_mAddr_w_whas,
       wci_wci_Es_mByteEn_w_whas,
       wci_wci_Es_mCmd_w_whas,
       wci_wci_Es_mData_w_whas,
       wci_wslv_ctlAckReg_1_wget,
       wci_wslv_ctlAckReg_1_whas,
       wci_wslv_reqF_r_clr_whas,
       wci_wslv_reqF_r_deq_whas,
       wci_wslv_reqF_r_enq_whas,
       wci_wslv_respF_dequeueing_whas,
       wci_wslv_respF_enqueueing_whas,
       wci_wslv_respF_x_wire_whas,
       wci_wslv_sFlagReg_1_wget,
       wci_wslv_sFlagReg_1_whas,
       wci_wslv_sThreadBusy_pw_whas,
       wci_wslv_wEdge_whas,
       wci_wslv_wciReq_whas,
       wci_wslv_wci_cfrd_pw_whas,
       wci_wslv_wci_cfwr_pw_whas,
       wci_wslv_wci_ctrl_pw_whas,
       wmi_Em_sData_w_whas,
       wmi_Em_sResp_w_whas,
       wmi_dhF_dequeueing_whas,
       wmi_dhF_enqueueing_whas,
       wmi_dhF_x_wire_whas,
       wmi_mFlagF_dequeueing_whas,
       wmi_mFlagF_enqueueing_whas,
       wmi_mFlagF_x_wire_whas,
       wmi_operateD_1_wget,
       wmi_operateD_1_whas,
       wmi_peerIsReady_1_wget,
       wmi_peerIsReady_1_whas,
       wmi_reqF_dequeueing_whas,
       wmi_reqF_enqueueing_whas,
       wmi_reqF_x_wire_whas,
       wmi_sDataThreadBusy_d_1_wget,
       wmi_sDataThreadBusy_d_1_whas,
       wmi_sThreadBusy_d_1_wget,
       wmi_sThreadBusy_d_1_whas,
       wmi_wmiResponse_whas,
       wsiM_operateD_1_wget,
       wsiM_operateD_1_whas,
       wsiM_peerIsReady_1_wget,
       wsiM_peerIsReady_1_whas,
       wsiM_reqFifo_dequeueing_whas,
       wsiM_reqFifo_enqueueing_whas,
       wsiM_reqFifo_x_wire_whas,
       wsiM_sThreadBusy_pw_whas,
       wsiS_operateD_1_wget,
       wsiS_operateD_1_whas,
       wsiS_peerIsReady_1_wget,
       wsiS_peerIsReady_1_whas,
       wsiS_reqFifo_doResetClr_whas,
       wsiS_reqFifo_doResetDeq_whas,
       wsiS_reqFifo_doResetEnq_whas,
       wsiS_reqFifo_r_clr_whas,
       wsiS_reqFifo_r_deq_whas,
       wsiS_reqFifo_r_enq_whas,
       wsiS_sThreadBusy_dw_wget,
       wsiS_sThreadBusy_dw_whas,
       wsiS_wsiReq_whas,
       wsi_Es_mBurstLength_w_whas,
       wsi_Es_mBurstPrecise_w_whas,
       wsi_Es_mByteEn_w_whas,
       wsi_Es_mCmd_w_whas,
       wsi_Es_mDataInfo_w_whas,
       wsi_Es_mData_w_whas,
       wsi_Es_mReqInfo_w_whas,
       wsi_Es_mReqLast_w_whas;
  // register abortCount
  reg [31 : 0] abortCount;
  wire [31 : 0] abortCount_D_IN;
  wire abortCount_EN;
  // register doAbort
  reg doAbort;
  wire doAbort_D_IN, doAbort_EN;
  // register endOfMessage
  reg endOfMessage;
  wire endOfMessage_D_IN, endOfMessage_EN;
  // register errCount
  reg [127 : 0] errCount;
  wire [127 : 0] errCount_D_IN;
  wire errCount_EN;
  // register fabRespCredit_value
  reg [11 : 0] fabRespCredit_value;
  wire [11 : 0] fabRespCredit_value_D_IN;
  wire fabRespCredit_value_EN;
  // register fabWordsCurReq
  reg [13 : 0] fabWordsCurReq;
  wire [13 : 0] fabWordsCurReq_D_IN;
  wire fabWordsCurReq_EN;
  // register fabWordsRemain
  reg [13 : 0] fabWordsRemain;
  wire [13 : 0] fabWordsRemain_D_IN;
  wire fabWordsRemain_EN;
  // register firstMsgReq
  reg firstMsgReq;
  wire firstMsgReq_D_IN, firstMsgReq_EN;
  // register lastMesg
  reg [31 : 0] lastMesg;
  wire [31 : 0] lastMesg_D_IN;
  wire lastMesg_EN;
  // register mesgCount
  reg [31 : 0] mesgCount;
  reg [31 : 0] mesgCount_D_IN;
  wire mesgCount_EN;
  // register mesgLengthSoFar
  reg [13 : 0] mesgLengthSoFar;
  wire [13 : 0] mesgLengthSoFar_D_IN;
  wire mesgLengthSoFar_EN;
  // register mesgPreRequest
  reg mesgPreRequest;
  wire mesgPreRequest_D_IN, mesgPreRequest_EN;
  // register mesgReqAddr
  reg [13 : 0] mesgReqAddr;
  wire [13 : 0] mesgReqAddr_D_IN;
  wire mesgReqAddr_EN;
  // register mesgReqOK
  reg mesgReqOK;
  wire mesgReqOK_D_IN, mesgReqOK_EN;
  // register opcode
  reg [8 : 0] opcode;
  wire [8 : 0] opcode_D_IN;
  wire opcode_EN;
  // register readyToPush
  reg readyToPush;
  wire readyToPush_D_IN, readyToPush_EN;
  // register readyToRequest
  reg readyToRequest;
  wire readyToRequest_D_IN, readyToRequest_EN;
  // register respF_rCache
  reg [181 : 0] respF_rCache;
  wire [181 : 0] respF_rCache_D_IN;
  wire respF_rCache_EN;
  // register respF_rRdPtr
  reg [11 : 0] respF_rRdPtr;
  wire [11 : 0] respF_rRdPtr_D_IN;
  wire respF_rRdPtr_EN;
  // register respF_rWrPtr
  reg [11 : 0] respF_rWrPtr;
  wire [11 : 0] respF_rWrPtr_D_IN;
  wire respF_rWrPtr_EN;
  // register smaCtrl
  reg [31 : 0] smaCtrl;
  wire [31 : 0] smaCtrl_D_IN;
  wire smaCtrl_EN;
  // register thisMesg
  reg [31 : 0] thisMesg;
  reg [31 : 0] thisMesg_D_IN;
  wire thisMesg_EN;
  // register unrollCnt
  reg [15 : 0] unrollCnt;
  wire [15 : 0] unrollCnt_D_IN;
  wire unrollCnt_EN;
  // register valExpect
  reg [127 : 0] valExpect;
  wire [127 : 0] valExpect_D_IN;
  wire valExpect_EN;
  // register wci_wslv_cEdge
  reg [2 : 0] wci_wslv_cEdge;
  wire [2 : 0] wci_wslv_cEdge_D_IN;
  wire wci_wslv_cEdge_EN;
  // register wci_wslv_cState
  reg [2 : 0] wci_wslv_cState;
  wire [2 : 0] wci_wslv_cState_D_IN;
  wire wci_wslv_cState_EN;
  // register wci_wslv_ctlAckReg
  reg wci_wslv_ctlAckReg;
  wire wci_wslv_ctlAckReg_D_IN, wci_wslv_ctlAckReg_EN;
  // register wci_wslv_ctlOpActive
  reg wci_wslv_ctlOpActive;
  wire wci_wslv_ctlOpActive_D_IN, wci_wslv_ctlOpActive_EN;
  // register wci_wslv_illegalEdge
  reg wci_wslv_illegalEdge;
  wire wci_wslv_illegalEdge_D_IN, wci_wslv_illegalEdge_EN;
  // register wci_wslv_isReset_isInReset
  reg wci_wslv_isReset_isInReset;
  wire wci_wslv_isReset_isInReset_D_IN, wci_wslv_isReset_isInReset_EN;
  // register wci_wslv_nState
  reg [2 : 0] wci_wslv_nState;
  reg [2 : 0] wci_wslv_nState_D_IN;
  wire wci_wslv_nState_EN;
  // register wci_wslv_reqF_countReg
  reg [1 : 0] wci_wslv_reqF_countReg;
  wire [1 : 0] wci_wslv_reqF_countReg_D_IN;
  wire wci_wslv_reqF_countReg_EN;
  // register wci_wslv_respF_cntr_r
  reg [1 : 0] wci_wslv_respF_cntr_r;
  wire [1 : 0] wci_wslv_respF_cntr_r_D_IN;
  wire wci_wslv_respF_cntr_r_EN;
  // register wci_wslv_respF_q_0
  reg [33 : 0] wci_wslv_respF_q_0;
  reg [33 : 0] wci_wslv_respF_q_0_D_IN;
  wire wci_wslv_respF_q_0_EN;
  // register wci_wslv_respF_q_1
  reg [33 : 0] wci_wslv_respF_q_1;
  reg [33 : 0] wci_wslv_respF_q_1_D_IN;
  wire wci_wslv_respF_q_1_EN;
  // register wci_wslv_sFlagReg
  reg wci_wslv_sFlagReg;
  wire wci_wslv_sFlagReg_D_IN, wci_wslv_sFlagReg_EN;
  // register wci_wslv_sThreadBusy_d
  reg wci_wslv_sThreadBusy_d;
  wire wci_wslv_sThreadBusy_d_D_IN, wci_wslv_sThreadBusy_d_EN;
  // register wmi_busyWithMessage
  reg wmi_busyWithMessage;
  wire wmi_busyWithMessage_D_IN, wmi_busyWithMessage_EN;
  // register wmi_dhF_cntr_r
  reg [1 : 0] wmi_dhF_cntr_r;
  wire [1 : 0] wmi_dhF_cntr_r_D_IN;
  wire wmi_dhF_cntr_r_EN;
  // register wmi_dhF_q_0
  reg [145 : 0] wmi_dhF_q_0;
  reg [145 : 0] wmi_dhF_q_0_D_IN;
  wire wmi_dhF_q_0_EN;
  // register wmi_dhF_q_1
  reg [145 : 0] wmi_dhF_q_1;
  reg [145 : 0] wmi_dhF_q_1_D_IN;
  wire wmi_dhF_q_1_EN;
  // register wmi_errorSticky
  reg wmi_errorSticky;
  wire wmi_errorSticky_D_IN, wmi_errorSticky_EN;
  // register wmi_isReset_isInReset
  reg wmi_isReset_isInReset;
  wire wmi_isReset_isInReset_D_IN, wmi_isReset_isInReset_EN;
  // register wmi_mFlagF_cntr_r
  reg [1 : 0] wmi_mFlagF_cntr_r;
  wire [1 : 0] wmi_mFlagF_cntr_r_D_IN;
  wire wmi_mFlagF_cntr_r_EN;
  // register wmi_mFlagF_q_0
  reg [31 : 0] wmi_mFlagF_q_0;
  reg [31 : 0] wmi_mFlagF_q_0_D_IN;
  wire wmi_mFlagF_q_0_EN;
  // register wmi_mFlagF_q_1
  reg [31 : 0] wmi_mFlagF_q_1;
  reg [31 : 0] wmi_mFlagF_q_1_D_IN;
  wire wmi_mFlagF_q_1_EN;
  // register wmi_operateD
  reg wmi_operateD;
  wire wmi_operateD_D_IN, wmi_operateD_EN;
  // register wmi_peerIsReady
  reg wmi_peerIsReady;
  wire wmi_peerIsReady_D_IN, wmi_peerIsReady_EN;
  // register wmi_reqF_cntr_r
  reg [1 : 0] wmi_reqF_cntr_r;
  wire [1 : 0] wmi_reqF_cntr_r_D_IN;
  wire wmi_reqF_cntr_r_EN;
  // register wmi_reqF_q_0
  reg [31 : 0] wmi_reqF_q_0;
  reg [31 : 0] wmi_reqF_q_0_D_IN;
  wire wmi_reqF_q_0_EN;
  // register wmi_reqF_q_1
  reg [31 : 0] wmi_reqF_q_1;
  reg [31 : 0] wmi_reqF_q_1_D_IN;
  wire wmi_reqF_q_1_EN;
  // register wmi_sDataThreadBusy_d
  reg wmi_sDataThreadBusy_d;
  wire wmi_sDataThreadBusy_d_D_IN, wmi_sDataThreadBusy_d_EN;
  // register wmi_sFlagReg
  reg [31 : 0] wmi_sFlagReg;
  wire [31 : 0] wmi_sFlagReg_D_IN;
  wire wmi_sFlagReg_EN;
  // register wmi_sThreadBusy_d
  reg wmi_sThreadBusy_d;
  wire wmi_sThreadBusy_d_D_IN, wmi_sThreadBusy_d_EN;
  // register wmi_statusR
  reg [7 : 0] wmi_statusR;
  wire [7 : 0] wmi_statusR_D_IN;
  wire wmi_statusR_EN;
  // register wmi_trafficSticky
  reg wmi_trafficSticky;
  wire wmi_trafficSticky_D_IN, wmi_trafficSticky_EN;
  // register wmwtBeginCount
  reg [31 : 0] wmwtBeginCount;
  wire [31 : 0] wmwtBeginCount_D_IN;
  wire wmwtBeginCount_EN;
  // register wmwtFinalCount
  reg [31 : 0] wmwtFinalCount;
  wire [31 : 0] wmwtFinalCount_D_IN;
  wire wmwtFinalCount_EN;
  // register wmwtPushCount
  reg [31 : 0] wmwtPushCount;
  wire [31 : 0] wmwtPushCount_D_IN;
  wire wmwtPushCount_EN;
  // register wsiM_burstKind
  reg [1 : 0] wsiM_burstKind;
  wire [1 : 0] wsiM_burstKind_D_IN;
  wire wsiM_burstKind_EN;
  // register wsiM_errorSticky
  reg wsiM_errorSticky;
  wire wsiM_errorSticky_D_IN, wsiM_errorSticky_EN;
  // register wsiM_iMesgCount
  reg [31 : 0] wsiM_iMesgCount;
  wire [31 : 0] wsiM_iMesgCount_D_IN;
  wire wsiM_iMesgCount_EN;
  // register wsiM_isReset_isInReset
  reg wsiM_isReset_isInReset;
  wire wsiM_isReset_isInReset_D_IN, wsiM_isReset_isInReset_EN;
  // register wsiM_operateD
  reg wsiM_operateD;
  wire wsiM_operateD_D_IN, wsiM_operateD_EN;
  // register wsiM_pMesgCount
  reg [31 : 0] wsiM_pMesgCount;
  wire [31 : 0] wsiM_pMesgCount_D_IN;
  wire wsiM_pMesgCount_EN;
  // register wsiM_peerIsReady
  reg wsiM_peerIsReady;
  wire wsiM_peerIsReady_D_IN, wsiM_peerIsReady_EN;
  // register wsiM_reqFifo_cntr_r
  reg [1 : 0] wsiM_reqFifo_cntr_r;
  wire [1 : 0] wsiM_reqFifo_cntr_r_D_IN;
  wire wsiM_reqFifo_cntr_r_EN;
  // register wsiM_reqFifo_q_0
  reg [168 : 0] wsiM_reqFifo_q_0;
  reg [168 : 0] wsiM_reqFifo_q_0_D_IN;
  wire wsiM_reqFifo_q_0_EN;
  // register wsiM_reqFifo_q_1
  reg [168 : 0] wsiM_reqFifo_q_1;
  reg [168 : 0] wsiM_reqFifo_q_1_D_IN;
  wire wsiM_reqFifo_q_1_EN;
  // register wsiM_sThreadBusy_d
  reg wsiM_sThreadBusy_d;
  wire wsiM_sThreadBusy_d_D_IN, wsiM_sThreadBusy_d_EN;
  // register wsiM_statusR
  reg [7 : 0] wsiM_statusR;
  wire [7 : 0] wsiM_statusR_D_IN;
  wire wsiM_statusR_EN;
  // register wsiM_tBusyCount
  reg [31 : 0] wsiM_tBusyCount;
  wire [31 : 0] wsiM_tBusyCount_D_IN;
  wire wsiM_tBusyCount_EN;
  // register wsiM_trafficSticky
  reg wsiM_trafficSticky;
  wire wsiM_trafficSticky_D_IN, wsiM_trafficSticky_EN;
  // register wsiS_burstKind
  reg [1 : 0] wsiS_burstKind;
  wire [1 : 0] wsiS_burstKind_D_IN;
  wire wsiS_burstKind_EN;
  // register wsiS_errorSticky
  reg wsiS_errorSticky;
  wire wsiS_errorSticky_D_IN, wsiS_errorSticky_EN;
  // register wsiS_iMesgCount
  reg [31 : 0] wsiS_iMesgCount;
  wire [31 : 0] wsiS_iMesgCount_D_IN;
  wire wsiS_iMesgCount_EN;
  // register wsiS_isReset_isInReset
  reg wsiS_isReset_isInReset;
  wire wsiS_isReset_isInReset_D_IN, wsiS_isReset_isInReset_EN;
  // register wsiS_mesgWordLength
  reg [11 : 0] wsiS_mesgWordLength;
  wire [11 : 0] wsiS_mesgWordLength_D_IN;
  wire wsiS_mesgWordLength_EN;
  // register wsiS_operateD
  reg wsiS_operateD;
  wire wsiS_operateD_D_IN, wsiS_operateD_EN;
  // register wsiS_pMesgCount
  reg [31 : 0] wsiS_pMesgCount;
  wire [31 : 0] wsiS_pMesgCount_D_IN;
  wire wsiS_pMesgCount_EN;
  // register wsiS_peerIsReady
  reg wsiS_peerIsReady;
  wire wsiS_peerIsReady_D_IN, wsiS_peerIsReady_EN;
  // register wsiS_reqFifo_countReg
  reg [1 : 0] wsiS_reqFifo_countReg;
  wire [1 : 0] wsiS_reqFifo_countReg_D_IN;
  wire wsiS_reqFifo_countReg_EN;
  // register wsiS_reqFifo_levelsValid
  reg wsiS_reqFifo_levelsValid;
  wire wsiS_reqFifo_levelsValid_D_IN, wsiS_reqFifo_levelsValid_EN;
  // register wsiS_statusR
  reg [7 : 0] wsiS_statusR;
  wire [7 : 0] wsiS_statusR_D_IN;
  wire wsiS_statusR_EN;
  // register wsiS_tBusyCount
  reg [31 : 0] wsiS_tBusyCount;
  wire [31 : 0] wsiS_tBusyCount_D_IN;
  wire wsiS_tBusyCount_EN;
  // register wsiS_trafficSticky
  reg wsiS_trafficSticky;
  wire wsiS_trafficSticky_D_IN, wsiS_trafficSticky_EN;
  // register wsiS_wordCount
  reg [11 : 0] wsiS_wordCount;
  wire [11 : 0] wsiS_wordCount_D_IN;
  wire wsiS_wordCount_EN;
  // ports of submodule mesgTokenF
  wire mesgTokenF_CLR,
       mesgTokenF_DEQ,
       mesgTokenF_EMPTY_N,
       mesgTokenF_ENQ,
       mesgTokenF_FULL_N;
  // ports of submodule respF_memory
  wire [168 : 0] respF_memory_DIA, respF_memory_DIB, respF_memory_DOB;
  wire [10 : 0] respF_memory_ADDRA, respF_memory_ADDRB;
  wire respF_memory_ENA, respF_memory_ENB, respF_memory_WEA, respF_memory_WEB;
  // ports of submodule wci_wslv_reqF
  wire [71 : 0] wci_wslv_reqF_D_IN, wci_wslv_reqF_D_OUT;
  wire wci_wslv_reqF_CLR,
       wci_wslv_reqF_DEQ,
       wci_wslv_reqF_EMPTY_N,
       wci_wslv_reqF_ENQ;
  // ports of submodule wmi_respF
  wire [129 : 0] wmi_respF_D_IN, wmi_respF_D_OUT;
  wire wmi_respF_CLR,
       wmi_respF_DEQ,
       wmi_respF_EMPTY_N,
       wmi_respF_ENQ,
       wmi_respF_FULL_N;
  // ports of submodule wsiS_reqFifo
  wire [168 : 0] wsiS_reqFifo_D_IN, wsiS_reqFifo_D_OUT;
  wire wsiS_reqFifo_CLR,
       wsiS_reqFifo_DEQ,
       wsiS_reqFifo_EMPTY_N,
       wsiS_reqFifo_ENQ,
       wsiS_reqFifo_FULL_N;
  // rule scheduling signals
  wire CAN_FIRE_RL_wmrd_mesgBodyPreRequest,
       CAN_FIRE_RL_wmwt_mesgBegin,
       CAN_FIRE_RL_wmwt_messagePush,
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
       WILL_FIRE_RL_wmi_dhF_both,
       WILL_FIRE_RL_wmi_dhF_decCtr,
       WILL_FIRE_RL_wmi_dhF_incCtr,
       WILL_FIRE_RL_wmi_mFlagF_both,
       WILL_FIRE_RL_wmi_mFlagF_decCtr,
       WILL_FIRE_RL_wmi_mFlagF_incCtr,
       WILL_FIRE_RL_wmi_reqF_both,
       WILL_FIRE_RL_wmi_reqF_decCtr,
       WILL_FIRE_RL_wmi_reqF_deq,
       WILL_FIRE_RL_wmi_reqF_incCtr,
       WILL_FIRE_RL_wmrd_mesgBodyRequest,
       WILL_FIRE_RL_wmrd_mesgResptoWsi,
       WILL_FIRE_RL_wmwt_doAbort,
       WILL_FIRE_RL_wmwt_mesgBegin,
       WILL_FIRE_RL_wmwt_messageFinalize,
       WILL_FIRE_RL_wsiM_reqFifo_both,
       WILL_FIRE_RL_wsiM_reqFifo_decCtr,
       WILL_FIRE_RL_wsiM_reqFifo_deq,
       WILL_FIRE_RL_wsiM_reqFifo_incCtr,
       WILL_FIRE_RL_wsiS_reqFifo_enq,
       WILL_FIRE_RL_wsiS_reqFifo_reset,
       WILL_FIRE_RL_wsipass_doMessagePush;
  // inputs to muxes for submodule ports
  reg [33 : 0] MUX_wci_wslv_respF_q_0_write_1__VAL_2;
  wire [168 : 0] MUX_wsiM_reqFifo_q_0_write_1__VAL_1,
		 MUX_wsiM_reqFifo_q_0_write_1__VAL_2,
		 MUX_wsiM_reqFifo_q_1_write_1__VAL_1,
		 MUX_wsiM_reqFifo_x_wire_wset_1__VAL_3;
  wire [145 : 0] MUX_wmi_dhF_q_0_write_1__VAL_1,
		 MUX_wmi_dhF_q_0_write_1__VAL_2,
		 MUX_wmi_dhF_q_1_write_1__VAL_1;
  wire [33 : 0] MUX_wci_wslv_respF_q_0_write_1__VAL_1,
		MUX_wci_wslv_respF_q_1_write_1__VAL_1,
		MUX_wci_wslv_respF_x_wire_wset_1__VAL_1,
		MUX_wci_wslv_respF_x_wire_wset_1__VAL_2;
  wire [31 : 0] MUX_mesgCount_write_1__VAL_2,
		MUX_thisMesg_write_1__VAL_1,
		MUX_thisMesg_write_1__VAL_2,
		MUX_wmi_mFlagF_q_0_write_1__VAL_1,
		MUX_wmi_mFlagF_q_1_write_1__VAL_1,
		MUX_wmi_mFlagF_x_wire_wset_1__VAL_2,
		MUX_wmi_reqF_q_0_write_1__VAL_1,
		MUX_wmi_reqF_q_0_write_1__VAL_2,
		MUX_wmi_reqF_q_1_write_1__VAL_1,
		MUX_wmi_reqF_x_wire_wset_1__VAL_1,
		MUX_wmi_reqF_x_wire_wset_1__VAL_2;
  wire [15 : 0] MUX_unrollCnt_write_1__VAL_1, MUX_unrollCnt_write_1__VAL_2;
  wire [13 : 0] MUX_fabWordsRemain_write_1__VAL_1,
		MUX_fabWordsRemain_write_1__VAL_2,
		MUX_mesgReqAddr_write_1__VAL_2;
  wire [11 : 0] MUX_fabRespCredit_value_write_1__VAL_2;
  wire [8 : 0] MUX_opcode_write_1__VAL_3;
  wire [1 : 0] MUX_wci_wslv_respF_cntr_r_write_1__VAL_2,
	       MUX_wmi_dhF_cntr_r_write_1__VAL_2,
	       MUX_wmi_mFlagF_cntr_r_write_1__VAL_2,
	       MUX_wmi_reqF_cntr_r_write_1__VAL_2,
	       MUX_wsiM_reqFifo_cntr_r_write_1__VAL_1,
	       MUX_wsiM_reqFifo_cntr_r_write_1__VAL_2;
  wire MUX_endOfMessage_write_1__SEL_1,
       MUX_mesgCount_write_1__SEL_1,
       MUX_mesgReqOK_write_1__SEL_3,
       MUX_unrollCnt_write_1__SEL_1,
       MUX_unrollCnt_write_1__SEL_2,
       MUX_wci_wslv_illegalEdge_write_1__SEL_1,
       MUX_wci_wslv_illegalEdge_write_1__VAL_1,
       MUX_wci_wslv_respF_q_0_write_1__SEL_1,
       MUX_wci_wslv_respF_q_0_write_1__SEL_2,
       MUX_wci_wslv_respF_q_1_write_1__SEL_1,
       MUX_wci_wslv_respF_q_1_write_1__SEL_2,
       MUX_wmi_dhF_q_0_write_1__SEL_1,
       MUX_wmi_dhF_q_0_write_1__SEL_2,
       MUX_wmi_dhF_q_1_write_1__SEL_1,
       MUX_wmi_dhF_q_1_write_1__SEL_2,
       MUX_wmi_mFlagF_q_0_write_1__SEL_1,
       MUX_wmi_mFlagF_q_0_write_1__SEL_2,
       MUX_wmi_mFlagF_q_1_write_1__SEL_1,
       MUX_wmi_mFlagF_q_1_write_1__SEL_2,
       MUX_wmi_mFlagF_x_wire_wset_1__SEL_1,
       MUX_wmi_reqF_q_0_write_1__SEL_1,
       MUX_wmi_reqF_q_0_write_1__SEL_2,
       MUX_wmi_reqF_q_1_write_1__SEL_1,
       MUX_wmi_reqF_q_1_write_1__SEL_2,
       MUX_wsiM_reqFifo_q_0_write_1__SEL_1,
       MUX_wsiM_reqFifo_q_0_write_1__SEL_2,
       MUX_wsiM_reqFifo_q_1_write_1__SEL_1,
       MUX_wsiM_reqFifo_q_1_write_1__SEL_2,
       MUX_wsiM_reqFifo_x_wire_wset_1__SEL_1,
       MUX_wsiM_reqFifo_x_wire_wset_1__SEL_2,
       MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3;
  // remaining internal signals
  reg [63 : 0] v__h18073,
	       v__h22489,
	       v__h22548,
	       v__h24386,
	       v__h24569,
	       v__h24765,
	       v__h25422,
	       v__h3597,
	       v__h3772,
	       v__h3916;
  reg [31 : 0] g_data__h24937;
  wire [163 : 0] IF_respF_wDataIn_whas__28_THEN_respF_wDataIn_w_ETC___d437;
  wire [31 : 0] rdat__h24980,
		rdat__h24986,
		rdat__h24992,
		rdat__h25005,
		rdat__h25028,
		rdat__h25128,
		rdat__h25142,
		rdat__h25150,
		rdat__h25156,
		rdat__h25170,
		rdat__h25178,
		rdat__h25184,
		rdat__h25190,
		rdat__h25196,
		rdat__h25202,
		rdat__h25212,
		value__h6387,
		x__h18676;
  wire [23 : 0] b__h17784,
		mesgMetaF_length__h23070,
		residue__h17647,
		x__h17904;
  wire [15 : 0] sendData_byteEn__h18619,
		wsiBurstLength__h18535,
		x__h25032,
		x_length__h23961;
  wire [13 : 0] b__h18157, mlB__h22903, mlInc__h22902;
  wire [11 : 0] b__h14802, sendData_burstLength__h18617, x__h16103, x__h16253;
  wire [7 : 0] mesgMetaF_opcode__h23069;
  wire [4 : 0] x__h23108,
	       x__h23120,
	       x__h23132,
	       x__h23144,
	       x__h23156,
	       x__h23168,
	       x__h23180,
	       x__h23192,
	       x__h23204,
	       x__h23216,
	       x__h23228,
	       x__h23240,
	       x__h23252,
	       x__h23264,
	       x__h23276,
	       y__h23109,
	       y__h23121,
	       y__h23133,
	       y__h23145,
	       y__h23157,
	       y__h23169,
	       y__h23181,
	       y__h23193,
	       y__h23205,
	       y__h23217,
	       y__h23229,
	       y__h23241,
	       y__h23253,
	       y__h23265,
	       y__h23277;
  wire [2 : 0] IF_respF_wDataIn_whas__28_THEN_respF_wDataIn_w_ETC___d431;
  wire [1 : 0] wci_wslv_respF_cntr_r_8_MINUS_1___d27,
	       wmi_dhF_cntr_r_05_MINUS_1___d213,
	       wmi_mFlagF_cntr_r_83_MINUS_1___d191,
	       wmi_reqF_cntr_r_61_MINUS_1___d169;
  wire NOT_wmi_reqF_cntr_r_61_EQ_2_73_74_AND_wmi_oper_ETC___d521,
       _dfoo1,
       _dfoo11,
       _dfoo13,
       _dfoo15,
       _dfoo17,
       _dfoo19,
       _dfoo3,
       _dfoo5,
       _dfoo7,
       _dfoo9,
       wmi_respF_i_notEmpty__34_AND_smaCtrl_62_BIT_4__ETC___d539,
       wsiS_reqFifo_i_notEmpty__61_AND_NOT_smaCtrl_62_ETC___d667,
       x__h18328,
       x__h25206;
  // value method wciS0_sResp
  assign wciS0_SResp = wci_wslv_respF_q_0[33:32] ;
  // value method wciS0_sData
  assign wciS0_SData = wci_wslv_respF_q_0[31:0] ;
  // value method wciS0_sThreadBusy
  assign wciS0_SThreadBusy =
	     wci_wslv_reqF_countReg > 2'd1 || wci_wslv_isReset_isInReset ;
  // value method wciS0_sFlag
  assign wciS0_SFlag = { 1'd1, wci_wslv_sFlagReg } ;
  // value method wmiM0_mCmd
  assign wmiM0_MCmd = wmi_sThreadBusy_d ? 3'd0 : wmi_reqF_q_0[31:29] ;
  // value method wmiM0_mReqLast
  assign wmiM0_MReqLast = !wmi_sThreadBusy_d && wmi_reqF_q_0[28] ;
  // value method wmiM0_mReqInfo
  assign wmiM0_MReqInfo = !wmi_sThreadBusy_d && wmi_reqF_q_0[27] ;
  // value method wmiM0_mAddrSpace
  assign wmiM0_MAddrSpace = !wmi_sThreadBusy_d && wmi_reqF_q_0[26] ;
  // value method wmiM0_mAddr
  assign wmiM0_MAddr = wmi_sThreadBusy_d ? 14'd0 : wmi_reqF_q_0[25:12] ;
  // value method wmiM0_mBurstLength
  assign wmiM0_MBurstLength = wmi_sThreadBusy_d ? 12'd0 : wmi_reqF_q_0[11:0] ;
  // value method wmiM0_mDataValid
  assign wmiM0_MDataValid = !wmi_sDataThreadBusy_d && wmi_dhF_q_0[145] ;
  // value method wmiM0_mDataLast
  assign wmiM0_MDataLast = !wmi_sDataThreadBusy_d && wmi_dhF_q_0[144] ;
  // value method wmiM0_mData
  assign wmiM0_MData = wmi_sDataThreadBusy_d ? 128'd0 : wmi_dhF_q_0[143:16] ;
  // value method wmiM0_mDataByteEn
  assign wmiM0_MDataByteEn =
	     wmi_sDataThreadBusy_d ? 16'd0 : wmi_dhF_q_0[15:0] ;
  // value method wmiM0_mFlag
  assign wmiM0_MFlag = wmi_sThreadBusy_d ? 32'd0 : wmi_mFlagF_q_0 ;
  // value method wmiM0_mReset_n
  assign wmiM0_MReset_n = !wmi_isReset_isInReset && wmi_operateD ;
  // value method wsiM0_mCmd
  assign wsiM0_MCmd = wsiM_sThreadBusy_d ? 3'd0 : wsiM_reqFifo_q_0[168:166] ;
  // value method wsiM0_mReqLast
  assign wsiM0_MReqLast = !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[165] ;
  // value method wsiM0_mBurstPrecise
  assign wsiM0_MBurstPrecise = !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[164] ;
  // value method wsiM0_mBurstLength
  assign wsiM0_MBurstLength =
	     wsiM_sThreadBusy_d ? 12'd0 : wsiM_reqFifo_q_0[163:152] ;
  // value method wsiM0_mData
  assign wsiM0_MData = wsiM_reqFifo_q_0[151:24] ;
  // value method wsiM0_mByteEn
  assign wsiM0_MByteEn = wsiM_reqFifo_q_0[23:8] ;
  // value method wsiM0_mReqInfo
  assign wsiM0_MReqInfo = wsiM_sThreadBusy_d ? 8'd0 : wsiM_reqFifo_q_0[7:0] ;
  // value method wsiM0_mReset_n
  assign wsiM0_MReset_n = !wsiM_isReset_isInReset && wsiM_operateD ;
  // value method wsiS0_sThreadBusy
  assign wsiS0_SThreadBusy =
	     !wsiS_sThreadBusy_dw_whas || wsiS_sThreadBusy_dw_wget ;
  // value method wsiS0_sReset_n
  assign wsiS0_SReset_n = !wsiS_isReset_isInReset && wsiS_operateD ;
  // submodule mesgTokenF
  FIFO10 #(.guarded(32'd1)) mesgTokenF(.RST(wciS0_MReset_n),
				       .CLK(wciS0_Clk),
				       .ENQ(mesgTokenF_ENQ),
				       .DEQ(mesgTokenF_DEQ),
				       .CLR(mesgTokenF_CLR),
				       .FULL_N(mesgTokenF_FULL_N),
				       .EMPTY_N(mesgTokenF_EMPTY_N));
  // submodule respF_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd11),
	  .DATA_WIDTH(32'd169),
	  .MEMSIZE(12'd2048)) respF_memory(.CLKA(wciS0_Clk),
					   .CLKB(wciS0_Clk),
					   .ADDRA(respF_memory_ADDRA),
					   .ADDRB(respF_memory_ADDRB),
					   .DIA(respF_memory_DIA),
					   .DIB(respF_memory_DIB),
					   .WEA(respF_memory_WEA),
					   .WEB(respF_memory_WEB),
					   .ENA(respF_memory_ENA),
					   .ENB(respF_memory_ENB),
					   .DOA(),
					   .DOB(respF_memory_DOB));
  // submodule wci_wslv_reqF
  SizedFIFO #(.p1width(32'd72),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wci_wslv_reqF(.RST(wciS0_MReset_n),
					     .CLK(wciS0_Clk),
					     .D_IN(wci_wslv_reqF_D_IN),
					     .ENQ(wci_wslv_reqF_ENQ),
					     .DEQ(wci_wslv_reqF_DEQ),
					     .CLR(wci_wslv_reqF_CLR),
					     .D_OUT(wci_wslv_reqF_D_OUT),
					     .FULL_N(),
					     .EMPTY_N(wci_wslv_reqF_EMPTY_N));
  // submodule wmi_respF
  FIFO2 #(.width(32'd130), .guarded(32'd1)) wmi_respF(.RST(wciS0_MReset_n),
						      .CLK(wciS0_Clk),
						      .D_IN(wmi_respF_D_IN),
						      .ENQ(wmi_respF_ENQ),
						      .DEQ(wmi_respF_DEQ),
						      .CLR(wmi_respF_CLR),
						      .D_OUT(wmi_respF_D_OUT),
						      .FULL_N(wmi_respF_FULL_N),
						      .EMPTY_N(wmi_respF_EMPTY_N));
  // submodule wsiS_reqFifo
  SizedFIFO #(.p1width(32'd169),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wsiS_reqFifo(.RST(wciS0_MReset_n),
					    .CLK(wciS0_Clk),
					    .D_IN(wsiS_reqFifo_D_IN),
					    .ENQ(wsiS_reqFifo_ENQ),
					    .DEQ(wsiS_reqFifo_DEQ),
					    .CLR(wsiS_reqFifo_CLR),
					    .D_OUT(wsiS_reqFifo_D_OUT),
					    .FULL_N(wsiS_reqFifo_FULL_N),
					    .EMPTY_N(wsiS_reqFifo_EMPTY_N));
  // rule RL_wmrd_mesgBodyPreRequest
  assign CAN_FIRE_RL_wmrd_mesgBodyPreRequest =
	     wci_wslv_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h1 || smaCtrl[3:0] == 4'h4 ||
	      smaCtrl[3:0] == 4'h9) &&
	     fabWordsRemain != 14'd0 &&
	     (fabRespCredit_value ^ 12'h800) > 12'd2048 &&
	     mesgReqOK ;
  // rule RL_wmrd_mesgBodyRequest
  assign WILL_FIRE_RL_wmrd_mesgBodyRequest =
	     NOT_wmi_reqF_cntr_r_61_EQ_2_73_74_AND_wmi_oper_ETC___d521 &&
	     wci_wslv_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h1 || smaCtrl[3:0] == 4'h4 ||
	      smaCtrl[3:0] == 4'h9) &&
	     mesgPreRequest ;
  // rule RL_wci_wslv_ctl_op_start
  assign WILL_FIRE_RL_wci_wslv_ctl_op_start =
	     wci_wslv_reqF_EMPTY_N && wci_wslv_wci_ctrl_pw_whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_ctrl_EiI
  assign WILL_FIRE_RL_wci_ctrl_EiI =
	     wci_wslv_wci_ctrl_pw_whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd0 &&
	     wci_wslv_reqF_D_OUT[36:34] == 3'd0 ;
  // rule RL_wci_ctrl_OrE
  assign WILL_FIRE_RL_wci_ctrl_OrE =
	     wci_wslv_wci_ctrl_pw_whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd2 &&
	     wci_wslv_reqF_D_OUT[36:34] == 3'd3 ;
  // rule RL_wmi_reqF_deq
  assign WILL_FIRE_RL_wmi_reqF_deq =
	     wmi_operateD && wmi_peerIsReady && !wmi_sThreadBusy_d ;
  // rule RL_wsiM_reqFifo_deq
  assign WILL_FIRE_RL_wsiM_reqFifo_deq =
	     wsiM_reqFifo_cntr_r != 2'd0 && !wsiM_sThreadBusy_d ;
  // rule RL_wsipass_doMessagePush
  assign WILL_FIRE_RL_wsipass_doMessagePush =
	     wsiS_reqFifo_EMPTY_N &&
	     (smaCtrl[4] || wsiM_reqFifo_cntr_r != 2'd2) &&
	     wci_wslv_cState == 3'd2 &&
	     smaCtrl[3:0] == 4'h0 ;
  // rule RL_wci_cfrd
  assign WILL_FIRE_RL_wci_cfrd =
	     wci_wslv_respF_cntr_r != 2'd2 && wci_wslv_reqF_EMPTY_N &&
	     wci_wslv_wci_cfrd_pw_whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wmwt_mesgBegin
  assign CAN_FIRE_RL_wmwt_mesgBegin =
	     wsiS_reqFifo_EMPTY_N && mesgTokenF_FULL_N &&
	     wci_wslv_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h2 || smaCtrl[3:0] == 4'h3) &&
	     !wmi_sThreadBusy_d &&
	     !wmi_sDataThreadBusy_d &&
	     !opcode[8] ;
  assign WILL_FIRE_RL_wmwt_mesgBegin =
	     CAN_FIRE_RL_wmwt_mesgBegin &&
	     !MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  // rule RL_wmwt_messagePush
  assign CAN_FIRE_RL_wmwt_messagePush =
	     wmi_reqF_cntr_r != 2'd2 && wmi_dhF_cntr_r != 2'd2 &&
	     wmi_operateD &&
	     wmi_peerIsReady &&
	     wsiS_reqFifo_i_notEmpty__61_AND_NOT_smaCtrl_62_ETC___d667 &&
	     wci_wslv_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h2 || smaCtrl[3:0] == 4'h3) &&
	     readyToPush ;
  // rule RL_wmwt_doAbort
  assign WILL_FIRE_RL_wmwt_doAbort =
	     wci_wslv_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h2 || smaCtrl[3:0] == 4'h3) &&
	     doAbort ;
  // rule RL_wmwt_messageFinalize
  assign WILL_FIRE_RL_wmwt_messageFinalize =
	     mesgTokenF_EMPTY_N && wci_wslv_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h2 || smaCtrl[3:0] == 4'h3) &&
	     !doAbort &&
	     endOfMessage ;
  // rule RL_wmi_reqF_incCtr
  assign WILL_FIRE_RL_wmi_reqF_incCtr =
	     wmi_reqF_x_wire_whas && wmi_reqF_enqueueing_whas &&
	     !wmi_reqF_dequeueing_whas ;
  // rule RL_wmi_reqF_decCtr
  assign WILL_FIRE_RL_wmi_reqF_decCtr =
	     wmi_reqF_dequeueing_whas && !wmi_reqF_enqueueing_whas ;
  // rule RL_wmi_reqF_both
  assign WILL_FIRE_RL_wmi_reqF_both =
	     wmi_reqF_x_wire_whas && wmi_reqF_dequeueing_whas &&
	     wmi_reqF_enqueueing_whas ;
  // rule RL_wmi_mFlagF_incCtr
  assign WILL_FIRE_RL_wmi_mFlagF_incCtr =
	     wmi_mFlagF_enqueueing_whas && wmi_mFlagF_enqueueing_whas &&
	     !wmi_mFlagF_dequeueing_whas ;
  // rule RL_wmi_mFlagF_decCtr
  assign WILL_FIRE_RL_wmi_mFlagF_decCtr =
	     wmi_mFlagF_dequeueing_whas && !wmi_mFlagF_enqueueing_whas ;
  // rule RL_wmi_mFlagF_both
  assign WILL_FIRE_RL_wmi_mFlagF_both =
	     wmi_mFlagF_enqueueing_whas && wmi_mFlagF_dequeueing_whas &&
	     wmi_mFlagF_enqueueing_whas ;
  // rule RL_wmi_dhF_incCtr
  assign WILL_FIRE_RL_wmi_dhF_incCtr =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     !wmi_dhF_dequeueing_whas ;
  // rule RL_wmi_dhF_decCtr
  assign WILL_FIRE_RL_wmi_dhF_decCtr =
	     wmi_dhF_dequeueing_whas &&
	     !MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  // rule RL_wmi_dhF_both
  assign WILL_FIRE_RL_wmi_dhF_both =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     wmi_dhF_dequeueing_whas &&
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  // rule RL_wmrd_mesgResptoWsi
  assign WILL_FIRE_RL_wmrd_mesgResptoWsi =
	     wsiM_reqFifo_cntr_r != 2'd2 && respF_rRdPtr != respF_rWrPtr &&
	     wci_wslv_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h1 || smaCtrl[3:0] == 4'h4 ||
	      smaCtrl[3:0] == 4'h9) ;
  // rule RL_wci_cfwr
  assign WILL_FIRE_RL_wci_cfwr =
	     wci_wslv_respF_cntr_r != 2'd2 && wci_wslv_reqF_EMPTY_N &&
	     wci_wslv_wci_cfwr_pw_whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wsiM_reqFifo_incCtr
  assign WILL_FIRE_RL_wsiM_reqFifo_incCtr =
	     wsiM_reqFifo_enqueueing_whas && wsiM_reqFifo_enqueueing_whas &&
	     !WILL_FIRE_RL_wsiM_reqFifo_deq ;
  // rule RL_wsiM_reqFifo_decCtr
  assign WILL_FIRE_RL_wsiM_reqFifo_decCtr =
	     WILL_FIRE_RL_wsiM_reqFifo_deq && !wsiM_reqFifo_enqueueing_whas ;
  // rule RL_wsiM_reqFifo_both
  assign WILL_FIRE_RL_wsiM_reqFifo_both =
	     wsiM_reqFifo_enqueueing_whas && WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_enqueueing_whas ;
  // rule RL_wci_ctrl_IsO
  assign WILL_FIRE_RL_wci_ctrl_IsO =
	     wci_wslv_wci_ctrl_pw_whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd1 &&
	     wci_wslv_reqF_D_OUT[36:34] == 3'd1 ;
  // rule RL_wci_wslv_ctl_op_complete
  assign WILL_FIRE_RL_wci_wslv_ctl_op_complete =
	     wci_wslv_respF_cntr_r != 2'd2 && wci_wslv_ctlOpActive &&
	     wci_wslv_ctlAckReg ;
  // rule RL_wci_wslv_respF_incCtr
  assign WILL_FIRE_RL_wci_wslv_respF_incCtr =
	     wci_wslv_respF_x_wire_whas && wci_wslv_respF_enqueueing_whas &&
	     !(wci_wslv_respF_cntr_r != 2'd0) ;
  // rule RL_wci_wslv_respF_decCtr
  assign WILL_FIRE_RL_wci_wslv_respF_decCtr =
	     wci_wslv_respF_cntr_r != 2'd0 &&
	     !wci_wslv_respF_enqueueing_whas ;
  // rule RL_wci_wslv_respF_both
  assign WILL_FIRE_RL_wci_wslv_respF_both =
	     wci_wslv_respF_x_wire_whas && wci_wslv_respF_cntr_r != 2'd0 &&
	     wci_wslv_respF_enqueueing_whas ;
  // rule RL_wsiS_reqFifo_enq
  assign WILL_FIRE_RL_wsiS_reqFifo_enq =
	     wsiS_reqFifo_FULL_N && wsiS_operateD && wsiS_peerIsReady &&
	     wsiS_wsiReq_wget[168:166] == 3'd1 ;
  // rule RL_wsiS_reqFifo_reset
  assign WILL_FIRE_RL_wsiS_reqFifo_reset =
	     WILL_FIRE_RL_wsiS_reqFifo_enq || wsiS_reqFifo_r_deq_whas ;
  // inputs to muxes for submodule ports
  assign MUX_endOfMessage_write_1__SEL_1 =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     wsiS_reqFifo_D_OUT[165] ;
  assign MUX_mesgCount_write_1__SEL_1 =
	     MUX_unrollCnt_write_1__SEL_2 && unrollCnt == 16'd1 ;
  assign MUX_mesgReqOK_write_1__SEL_3 =
	     CAN_FIRE_RL_wmrd_mesgBodyPreRequest &&
	     !WILL_FIRE_RL_wmrd_mesgBodyRequest ;
  assign MUX_unrollCnt_write_1__SEL_1 =
	     wci_wslv_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h1 || smaCtrl[3:0] == 4'h4 ||
	      smaCtrl[3:0] == 4'h9) &&
	     !wmi_sThreadBusy_d &&
	     !wmi_sDataThreadBusy_d &&
	     unrollCnt == 16'd0 ;
  assign MUX_unrollCnt_write_1__SEL_2 =
	     wmi_respF_i_notEmpty__34_AND_smaCtrl_62_BIT_4__ETC___d539 &&
	     wci_wslv_cState == 3'd2 &&
	     (smaCtrl[3:0] == 4'h1 || smaCtrl[3:0] == 4'h4 ||
	      smaCtrl[3:0] == 4'h9) &&
	     unrollCnt != 16'd0 ;
  assign MUX_wci_wslv_illegalEdge_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     (wci_wslv_reqF_D_OUT[36:34] == 3'd0 && wci_wslv_cState != 3'd0 ||
	      wci_wslv_reqF_D_OUT[36:34] == 3'd1 && wci_wslv_cState != 3'd1 &&
	      wci_wslv_cState != 3'd3 ||
	      wci_wslv_reqF_D_OUT[36:34] == 3'd2 && wci_wslv_cState != 3'd2 ||
	      wci_wslv_reqF_D_OUT[36:34] == 3'd3 && wci_wslv_cState != 3'd3 &&
	      wci_wslv_cState != 3'd2 &&
	      wci_wslv_cState != 3'd1 ||
	      wci_wslv_reqF_D_OUT[36:34] == 3'd4 ||
	      wci_wslv_reqF_D_OUT[36:34] == 3'd5 ||
	      wci_wslv_reqF_D_OUT[36:34] == 3'd6 ||
	      wci_wslv_reqF_D_OUT[36:34] == 3'd7) ;
  assign MUX_wci_wslv_respF_q_0_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_wslv_respF_both && _dfoo3 ;
  assign MUX_wci_wslv_respF_q_0_write_1__SEL_2 =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_cntr_r == 2'd0 ;
  assign MUX_wci_wslv_respF_q_1_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_wslv_respF_both && _dfoo1 ;
  assign MUX_wci_wslv_respF_q_1_write_1__SEL_2 =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_cntr_r == 2'd1 ;
  assign MUX_wmi_dhF_q_0_write_1__SEL_1 =
	     WILL_FIRE_RL_wmi_dhF_both && _dfoo15 ;
  assign MUX_wmi_dhF_q_0_write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_dhF_incCtr && wmi_dhF_cntr_r == 2'd0 ;
  assign MUX_wmi_dhF_q_1_write_1__SEL_1 =
	     WILL_FIRE_RL_wmi_dhF_both && _dfoo13 ;
  assign MUX_wmi_dhF_q_1_write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_dhF_incCtr && wmi_dhF_cntr_r == 2'd1 ;
  assign MUX_wmi_mFlagF_q_0_write_1__SEL_1 =
	     WILL_FIRE_RL_wmi_mFlagF_both && _dfoo11 ;
  assign MUX_wmi_mFlagF_q_0_write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_mFlagF_incCtr && wmi_mFlagF_cntr_r == 2'd0 ;
  assign MUX_wmi_mFlagF_q_1_write_1__SEL_1 =
	     WILL_FIRE_RL_wmi_mFlagF_both && _dfoo9 ;
  assign MUX_wmi_mFlagF_q_1_write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_mFlagF_incCtr && wmi_mFlagF_cntr_r == 2'd1 ;
  assign MUX_wmi_mFlagF_x_wire_wset_1__SEL_1 =
	     WILL_FIRE_RL_wmrd_mesgBodyRequest && x__h18328 ;
  assign MUX_wmi_reqF_q_0_write_1__SEL_1 =
	     WILL_FIRE_RL_wmi_reqF_both && _dfoo7 ;
  assign MUX_wmi_reqF_q_0_write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_reqF_incCtr && wmi_reqF_cntr_r == 2'd0 ;
  assign MUX_wmi_reqF_q_1_write_1__SEL_1 =
	     WILL_FIRE_RL_wmi_reqF_both && _dfoo5 ;
  assign MUX_wmi_reqF_q_1_write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_reqF_incCtr && wmi_reqF_cntr_r == 2'd1 ;
  assign MUX_wsiM_reqFifo_q_0_write_1__SEL_1 =
	     WILL_FIRE_RL_wsiM_reqFifo_both && _dfoo19 ;
  assign MUX_wsiM_reqFifo_q_0_write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_cntr_r == 2'd0 ;
  assign MUX_wsiM_reqFifo_q_1_write_1__SEL_1 =
	     WILL_FIRE_RL_wsiM_reqFifo_both && _dfoo17 ;
  assign MUX_wsiM_reqFifo_q_1_write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_cntr_r == 2'd1 ;
  assign MUX_wsiM_reqFifo_x_wire_wset_1__SEL_1 =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     smaCtrl[3:0] == 4'h3 ;
  assign MUX_wsiM_reqFifo_x_wire_wset_1__SEL_2 =
	     WILL_FIRE_RL_wsipass_doMessagePush && !smaCtrl[4] ;
  assign MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 =
	     CAN_FIRE_RL_wmwt_messagePush &&
	     !WILL_FIRE_RL_wmwt_messageFinalize ;
  assign MUX_fabRespCredit_value_write_1__VAL_2 =
	     fabRespCredit_value +
	     (WILL_FIRE_RL_wmrd_mesgBodyRequest ? b__h14802 : 12'd0) +
	     (WILL_FIRE_RL_wmrd_mesgResptoWsi ? 12'd1 : 12'd0) ;
  assign MUX_fabWordsRemain_write_1__VAL_1 =
	     (wmi_sFlagReg[23:0] == 24'd0) ? 14'd1 : b__h17784[13:0] ;
  assign MUX_fabWordsRemain_write_1__VAL_2 = fabWordsRemain - fabWordsCurReq ;
  assign MUX_mesgCount_write_1__VAL_2 = mesgCount + 32'd1 ;
  assign MUX_mesgReqAddr_write_1__VAL_2 =
	     mesgReqAddr + { fabWordsCurReq[9:0], 4'd0 } ;
  assign MUX_opcode_write_1__VAL_3 = { 1'd1, wsiS_reqFifo_D_OUT[7:0] } ;
  assign MUX_thisMesg_write_1__VAL_1 =
	     { mesgCount[7:0], mesgMetaF_opcode__h23069, x_length__h23961 } ;
  assign MUX_thisMesg_write_1__VAL_2 =
	     { mesgCount[7:0], wmi_sFlagReg[31:24], wmi_sFlagReg[15:0] } ;
  assign MUX_unrollCnt_write_1__VAL_1 =
	     (wmi_sFlagReg[23:0] == 24'd0) ? 16'd1 : b__h17784[15:0] ;
  assign MUX_unrollCnt_write_1__VAL_2 = unrollCnt - 16'd1 ;
  assign MUX_wci_wslv_illegalEdge_write_1__VAL_1 =
	     wci_wslv_reqF_D_OUT[36:34] != 3'd4 &&
	     wci_wslv_reqF_D_OUT[36:34] != 3'd5 &&
	     wci_wslv_reqF_D_OUT[36:34] != 3'd6 ;
  assign MUX_wci_wslv_respF_cntr_r_write_1__VAL_2 =
	     wci_wslv_respF_cntr_r + 2'd1 ;
  assign MUX_wci_wslv_respF_q_0_write_1__VAL_1 =
	     (wci_wslv_respF_cntr_r == 2'd1) ?
	       MUX_wci_wslv_respF_q_0_write_1__VAL_2 :
	       wci_wslv_respF_q_1 ;
  always@(WILL_FIRE_RL_wci_wslv_ctl_op_complete or
	  MUX_wci_wslv_respF_x_wire_wset_1__VAL_1 or
	  WILL_FIRE_RL_wci_cfrd or
	  MUX_wci_wslv_respF_x_wire_wset_1__VAL_2 or WILL_FIRE_RL_wci_cfwr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wci_wslv_ctl_op_complete:
	  MUX_wci_wslv_respF_q_0_write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire_wset_1__VAL_1;
      WILL_FIRE_RL_wci_cfrd:
	  MUX_wci_wslv_respF_q_0_write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire_wset_1__VAL_2;
      WILL_FIRE_RL_wci_cfwr:
	  MUX_wci_wslv_respF_q_0_write_1__VAL_2 = 34'h1C0DE4201;
      default: MUX_wci_wslv_respF_q_0_write_1__VAL_2 =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign MUX_wci_wslv_respF_q_1_write_1__VAL_1 =
	     (wci_wslv_respF_cntr_r == 2'd2) ?
	       MUX_wci_wslv_respF_q_0_write_1__VAL_2 :
	       34'h0AAAAAAAA ;
  assign MUX_wci_wslv_respF_x_wire_wset_1__VAL_1 =
	     wci_wslv_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wci_wslv_respF_x_wire_wset_1__VAL_2 = { 2'd1, g_data__h24937 } ;
  assign MUX_wmi_dhF_cntr_r_write_1__VAL_2 = wmi_dhF_cntr_r + 2'd1 ;
  assign MUX_wmi_dhF_q_0_write_1__VAL_1 =
	     (wmi_dhF_cntr_r == 2'd1) ?
	       MUX_wmi_dhF_q_0_write_1__VAL_2 :
	       wmi_dhF_q_1 ;
  assign MUX_wmi_dhF_q_0_write_1__VAL_2 =
	     { 1'd1, wsiS_reqFifo_D_OUT[165], wsiS_reqFifo_D_OUT[151:8] } ;
  assign MUX_wmi_dhF_q_1_write_1__VAL_1 =
	     (wmi_dhF_cntr_r == 2'd2) ?
	       MUX_wmi_dhF_q_0_write_1__VAL_2 :
	       146'd0 ;
  assign MUX_wmi_mFlagF_cntr_r_write_1__VAL_2 = wmi_mFlagF_cntr_r + 2'd1 ;
  assign MUX_wmi_mFlagF_q_0_write_1__VAL_1 =
	     (wmi_mFlagF_cntr_r == 2'd1) ? value__h6387 : wmi_mFlagF_q_1 ;
  assign MUX_wmi_mFlagF_q_1_write_1__VAL_1 =
	     (wmi_mFlagF_cntr_r == 2'd2) ? value__h6387 : 32'd0 ;
  assign MUX_wmi_mFlagF_x_wire_wset_1__VAL_2 =
	     { mesgMetaF_opcode__h23069, mesgMetaF_length__h23070 } ;
  assign MUX_wmi_reqF_cntr_r_write_1__VAL_2 = wmi_reqF_cntr_r + 2'd1 ;
  assign MUX_wmi_reqF_q_0_write_1__VAL_1 =
	     (wmi_reqF_cntr_r == 2'd1) ?
	       MUX_wmi_reqF_q_0_write_1__VAL_2 :
	       wmi_reqF_q_1 ;
  assign MUX_wmi_reqF_q_0_write_1__VAL_2 =
	     WILL_FIRE_RL_wmrd_mesgBodyRequest ?
	       MUX_wmi_reqF_x_wire_wset_1__VAL_1 :
	       MUX_wmi_reqF_x_wire_wset_1__VAL_2 ;
  assign MUX_wmi_reqF_q_1_write_1__VAL_1 =
	     (wmi_reqF_cntr_r == 2'd2) ?
	       MUX_wmi_reqF_q_0_write_1__VAL_2 :
	       32'd0 ;
  assign MUX_wmi_reqF_x_wire_wset_1__VAL_1 =
	     { 4'd5, x__h18328, 1'b0, mesgReqAddr, fabWordsCurReq[11:0] } ;
  assign MUX_wmi_reqF_x_wire_wset_1__VAL_2 =
	     { 4'd3, wsiS_reqFifo_D_OUT[165], 1'b0, mesgLengthSoFar, 12'd1 } ;
  assign MUX_wsiM_reqFifo_cntr_r_write_1__VAL_1 = wsiM_reqFifo_cntr_r - 2'd1 ;
  assign MUX_wsiM_reqFifo_cntr_r_write_1__VAL_2 = wsiM_reqFifo_cntr_r + 2'd1 ;
  assign MUX_wsiM_reqFifo_q_0_write_1__VAL_1 =
	     (wsiM_reqFifo_cntr_r == 2'd1) ?
	       MUX_wsiM_reqFifo_q_0_write_1__VAL_2 :
	       wsiM_reqFifo_q_1 ;
  assign MUX_wsiM_reqFifo_q_0_write_1__VAL_2 =
	     (MUX_wsiM_reqFifo_x_wire_wset_1__SEL_1 ||
	      MUX_wsiM_reqFifo_x_wire_wset_1__SEL_2) ?
	       wsiS_reqFifo_D_OUT :
	       MUX_wsiM_reqFifo_x_wire_wset_1__VAL_3 ;
  assign MUX_wsiM_reqFifo_q_1_write_1__VAL_1 =
	     (wsiM_reqFifo_cntr_r == 2'd2) ?
	       MUX_wsiM_reqFifo_q_0_write_1__VAL_2 :
	       169'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00 ;
  assign MUX_wsiM_reqFifo_x_wire_wset_1__VAL_3 =
	     (respF_rCache[181] && respF_rCache[180:169] == respF_rRdPtr) ?
	       respF_rCache[168:0] :
	       respF_memory_DOB ;
  // inlined wires
  assign wci_wslv_wciReq_wget =
	     { wciS0_MCmd,
	       wciS0_MAddrSpace,
	       wciS0_MByteEn,
	       wciS0_MAddr,
	       wciS0_MData } ;
  assign wci_wslv_wciReq_whas = 1'd1 ;
  assign wci_wslv_respF_x_wire_wget = MUX_wci_wslv_respF_q_0_write_1__VAL_2 ;
  assign wci_wslv_respF_x_wire_whas =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete || WILL_FIRE_RL_wci_cfrd ||
	     WILL_FIRE_RL_wci_cfwr ;
  assign wci_wslv_wEdge_wget = wci_wslv_reqF_D_OUT[36:34] ;
  assign wci_wslv_wEdge_whas = WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_sFlagReg_1_wget = 1'b0 ;
  assign wci_wslv_sFlagReg_1_whas = 1'b0 ;
  assign wci_wslv_ctlAckReg_1_wget = 1'd1 ;
  assign wci_wslv_ctlAckReg_1_whas =
	     WILL_FIRE_RL_wci_ctrl_OrE || WILL_FIRE_RL_wci_ctrl_IsO ||
	     WILL_FIRE_RL_wci_ctrl_EiI ;
  assign wci_wci_Es_mCmd_w_wget = wciS0_MCmd ;
  assign wci_wci_Es_mCmd_w_whas = 1'd1 ;
  assign wci_wci_Es_mAddrSpace_w_wget = wciS0_MAddrSpace ;
  assign wci_wci_Es_mAddrSpace_w_whas = 1'd1 ;
  assign wci_wci_Es_mByteEn_w_wget = wciS0_MByteEn ;
  assign wci_wci_Es_mByteEn_w_whas = 1'd1 ;
  assign wci_wci_Es_mAddr_w_wget = wciS0_MAddr ;
  assign wci_wci_Es_mAddr_w_whas = 1'd1 ;
  assign wci_wci_Es_mData_w_wget = wciS0_MData ;
  assign wci_wci_Es_mData_w_whas = 1'd1 ;
  assign wmi_reqF_x_wire_wget = MUX_wmi_reqF_q_0_write_1__VAL_2 ;
  assign wmi_reqF_x_wire_whas =
	     WILL_FIRE_RL_wmrd_mesgBodyRequest ||
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  assign wmi_mFlagF_x_wire_wget = value__h6387 ;
  assign wmi_mFlagF_x_wire_whas = wmi_mFlagF_enqueueing_whas ;
  assign wmi_dhF_x_wire_wget = MUX_wmi_dhF_q_0_write_1__VAL_2 ;
  assign wmi_dhF_x_wire_whas = MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  assign wmi_wmiResponse_wget = { wmiM0_SResp, wmiM0_SData } ;
  assign wmi_wmiResponse_whas = 1'd1 ;
  assign wmi_sThreadBusy_d_1_wget = 1'd1 ;
  assign wmi_sThreadBusy_d_1_whas = wmiM0_SThreadBusy ;
  assign wmi_sDataThreadBusy_d_1_wget = 1'd1 ;
  assign wmi_sDataThreadBusy_d_1_whas = wmiM0_SDataThreadBusy ;
  assign wmi_operateD_1_wget = 1'd1 ;
  assign wmi_operateD_1_whas = wci_wslv_cState == 3'd2 ;
  assign wmi_peerIsReady_1_wget = 1'd1 ;
  assign wmi_peerIsReady_1_whas = wmiM0_SReset_n ;
  assign wsiM_reqFifo_x_wire_wget = MUX_wsiM_reqFifo_q_0_write_1__VAL_2 ;
  assign wsiM_reqFifo_x_wire_whas = wsiM_reqFifo_enqueueing_whas ;
  assign wsiM_operateD_1_wget = 1'd1 ;
  assign wsiM_operateD_1_whas = wci_wslv_cState == 3'd2 ;
  assign wsiM_peerIsReady_1_wget = 1'd1 ;
  assign wsiM_peerIsReady_1_whas = wsiM0_SReset_n ;
  assign wsiS_wsiReq_wget =
	     { wsiS0_MCmd,
	       wsiS0_MReqLast,
	       wsiS0_MBurstPrecise,
	       wsiS0_MBurstLength,
	       wsiS0_MData,
	       wsiS0_MByteEn,
	       wsiS0_MReqInfo } ;
  assign wsiS_wsiReq_whas = 1'd1 ;
  assign wsiS_operateD_1_wget = 1'd1 ;
  assign wsiS_operateD_1_whas = wci_wslv_cState == 3'd2 ;
  assign wsiS_peerIsReady_1_wget = 1'd1 ;
  assign wsiS_peerIsReady_1_whas = wsiS0_MReset_n ;
  assign wsiS_sThreadBusy_dw_wget = wsiS_reqFifo_countReg > 2'd1 ;
  assign wsiS_sThreadBusy_dw_whas =
	     wsiS_reqFifo_levelsValid && wsiS_operateD && wsiS_peerIsReady ;
  assign fabRespCredit_acc_v1_wget = b__h14802 ;
  assign fabRespCredit_acc_v1_whas = WILL_FIRE_RL_wmrd_mesgBodyRequest ;
  assign fabRespCredit_acc_v2_wget = 12'd1 ;
  assign fabRespCredit_acc_v2_whas = WILL_FIRE_RL_wmrd_mesgResptoWsi ;
  assign mesgPreRequest_1_wget = 1'd1 ;
  assign mesgPreRequest_1_whas = MUX_mesgReqOK_write_1__SEL_3 ;
  assign respF_wDataIn_wget =
	     { 3'd1,
	       unrollCnt == 16'd1,
	       !smaCtrl[5],
	       sendData_burstLength__h18617,
	       wmi_respF_D_OUT[127:0],
	       sendData_byteEn__h18619,
	       thisMesg[23:16] } ;
  assign respF_wDataIn_whas = respF_pwEnqueue_whas ;
  assign respF_wDataOut_wget = MUX_wsiM_reqFifo_x_wire_wset_1__VAL_3 ;
  assign respF_wDataOut_whas = 1'd1 ;
  assign wsi_Es_mCmd_w_wget = wsiS0_MCmd ;
  assign wsi_Es_mCmd_w_whas = 1'd1 ;
  assign wsi_Es_mBurstLength_w_wget = wsiS0_MBurstLength ;
  assign wsi_Es_mBurstLength_w_whas = 1'd1 ;
  assign wsi_Es_mData_w_wget = wsiS0_MData ;
  assign wsi_Es_mData_w_whas = 1'd1 ;
  assign wsi_Es_mByteEn_w_wget = wsiS0_MByteEn ;
  assign wsi_Es_mByteEn_w_whas = 1'd1 ;
  assign wsi_Es_mReqInfo_w_wget = wsiS0_MReqInfo ;
  assign wsi_Es_mReqInfo_w_whas = 1'd1 ;
  assign wmi_Em_sResp_w_wget = wmiM0_SResp ;
  assign wmi_Em_sResp_w_whas = 1'd1 ;
  assign wmi_Em_sData_w_wget = wmiM0_SData ;
  assign wmi_Em_sData_w_whas = 1'd1 ;
  assign wci_wslv_reqF_r_enq_whas = wci_wslv_wciReq_wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF_r_deq_whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_reqF_r_clr_whas = 1'b0 ;
  assign wci_wslv_respF_enqueueing_whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  assign wci_wslv_respF_dequeueing_whas = wci_wslv_respF_cntr_r != 2'd0 ;
  assign wci_wslv_sThreadBusy_pw_whas = 1'b0 ;
  assign wci_wslv_wci_cfwr_pw_whas =
	     wci_wslv_reqF_EMPTY_N && wci_wslv_reqF_D_OUT[68] &&
	     wci_wslv_reqF_D_OUT[71:69] == 3'd1 ;
  assign wci_wslv_wci_cfrd_pw_whas =
	     wci_wslv_reqF_EMPTY_N && wci_wslv_reqF_D_OUT[68] &&
	     wci_wslv_reqF_D_OUT[71:69] == 3'd2 ;
  assign wci_wslv_wci_ctrl_pw_whas =
	     wci_wslv_reqF_EMPTY_N && !wci_wslv_reqF_D_OUT[68] &&
	     wci_wslv_reqF_D_OUT[71:69] == 3'd2 ;
  assign wmi_reqF_enqueueing_whas =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ||
	     WILL_FIRE_RL_wmrd_mesgBodyRequest ;
  assign wmi_reqF_dequeueing_whas =
	     WILL_FIRE_RL_wmi_reqF_deq && wmi_reqF_cntr_r != 2'd0 ;
  assign wmi_mFlagF_enqueueing_whas =
	     WILL_FIRE_RL_wmrd_mesgBodyRequest && x__h18328 ||
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     wsiS_reqFifo_D_OUT[165] ;
  assign wmi_mFlagF_dequeueing_whas =
	     WILL_FIRE_RL_wmi_reqF_deq && wmi_reqF_q_0[27] &&
	     wmi_mFlagF_cntr_r != 2'd0 ;
  assign wmi_dhF_enqueueing_whas =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  assign wmi_dhF_dequeueing_whas =
	     wmi_operateD && wmi_peerIsReady && !wmi_sDataThreadBusy_d &&
	     wmi_dhF_cntr_r != 2'd0 ;
  assign wsiM_reqFifo_enqueueing_whas =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     smaCtrl[3:0] == 4'h3 ||
	     WILL_FIRE_RL_wsipass_doMessagePush && !smaCtrl[4] ||
	     WILL_FIRE_RL_wmrd_mesgResptoWsi ;
  assign wsiM_reqFifo_dequeueing_whas = WILL_FIRE_RL_wsiM_reqFifo_deq ;
  assign wsiM_sThreadBusy_pw_whas = wsiM0_SThreadBusy ;
  assign wsiS_reqFifo_r_enq_whas = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_r_deq_whas =
	     WILL_FIRE_RL_wsipass_doMessagePush ||
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  assign wsiS_reqFifo_r_clr_whas = 1'b0 ;
  assign wsiS_reqFifo_doResetEnq_whas = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_doResetDeq_whas = wsiS_reqFifo_r_deq_whas ;
  assign wsiS_reqFifo_doResetClr_whas = 1'b0 ;
  assign respF_pwDequeue_whas = WILL_FIRE_RL_wmrd_mesgResptoWsi ;
  assign respF_pwEnqueue_whas = MUX_unrollCnt_write_1__SEL_2 && !smaCtrl[4] ;
  assign respF_pwClear_whas = 1'b0 ;
  assign wsi_Es_mReqLast_w_whas = wsiS0_MReqLast ;
  assign wsi_Es_mBurstPrecise_w_whas = wsiS0_MBurstPrecise ;
  assign wsi_Es_mDataInfo_w_whas = 1'd1 ;
  assign wsiM_extStatusW_wget =
	     { wsiM_pMesgCount, wsiM_iMesgCount, wsiM_tBusyCount } ;
  assign wsiS_extStatusW_wget =
	     { wsiS_pMesgCount, wsiS_iMesgCount, wsiS_tBusyCount } ;
  // register abortCount
  assign abortCount_D_IN = abortCount + 32'd1 ;
  assign abortCount_EN = WILL_FIRE_RL_wmwt_doAbort ;
  // register doAbort
  assign doAbort_D_IN = 1'd0 ;
  assign doAbort_EN = WILL_FIRE_RL_wmwt_doAbort ;
  // register endOfMessage
  assign endOfMessage_D_IN = MUX_endOfMessage_write_1__SEL_1 ;
  assign endOfMessage_EN =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     wsiS_reqFifo_D_OUT[165] ||
	     WILL_FIRE_RL_wmwt_messageFinalize ;
  // register errCount
  assign errCount_D_IN = errCount + 128'd1 ;
  assign errCount_EN =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     wsiS_reqFifo_D_OUT[151:24] != valExpect &&
	     (!wsiS_reqFifo_D_OUT[165] || wsiS_reqFifo_D_OUT[23:8] != 16'd0 ||
	      mesgLengthSoFar != 14'd0) ;
  // register fabRespCredit_value
  assign fabRespCredit_value_D_IN =
	     WILL_FIRE_RL_wci_ctrl_IsO ?
	       12'd1024 :
	       MUX_fabRespCredit_value_write_1__VAL_2 ;
  assign fabRespCredit_value_EN = 1'b1 ;
  // register fabWordsCurReq
  assign fabWordsCurReq_D_IN =
	     (fabWordsRemain <= b__h18157) ? fabWordsRemain : b__h18157 ;
  assign fabWordsCurReq_EN = MUX_mesgReqOK_write_1__SEL_3 ;
  // register fabWordsRemain
  assign fabWordsRemain_D_IN =
	     MUX_unrollCnt_write_1__SEL_1 ?
	       MUX_fabWordsRemain_write_1__VAL_1 :
	       MUX_fabWordsRemain_write_1__VAL_2 ;
  assign fabWordsRemain_EN =
	     MUX_unrollCnt_write_1__SEL_1 ||
	     WILL_FIRE_RL_wmrd_mesgBodyRequest ;
  // register firstMsgReq
  assign firstMsgReq_D_IN = 1'b0 ;
  assign firstMsgReq_EN = 1'b0 ;
  // register lastMesg
  assign lastMesg_D_IN =
	     (MUX_endOfMessage_write_1__SEL_1 ||
	      MUX_unrollCnt_write_1__SEL_1) ?
	       thisMesg :
	       32'hFEFEFFFE ;
  assign lastMesg_EN =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     wsiS_reqFifo_D_OUT[165] ||
	     MUX_unrollCnt_write_1__SEL_1 ||
	     WILL_FIRE_RL_wci_ctrl_IsO ;
  // register mesgCount
  always@(MUX_mesgCount_write_1__SEL_1 or
	  MUX_mesgCount_write_1__VAL_2 or
	  WILL_FIRE_RL_wmwt_messageFinalize or WILL_FIRE_RL_wci_ctrl_IsO)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_mesgCount_write_1__SEL_1:
	  mesgCount_D_IN = MUX_mesgCount_write_1__VAL_2;
      WILL_FIRE_RL_wmwt_messageFinalize:
	  mesgCount_D_IN = MUX_mesgCount_write_1__VAL_2;
      WILL_FIRE_RL_wci_ctrl_IsO: mesgCount_D_IN = 32'd0;
      default: mesgCount_D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign mesgCount_EN =
	     MUX_unrollCnt_write_1__SEL_2 && unrollCnt == 16'd1 ||
	     WILL_FIRE_RL_wmwt_messageFinalize ||
	     WILL_FIRE_RL_wci_ctrl_IsO ;
  // register mesgLengthSoFar
  assign mesgLengthSoFar_D_IN =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ?
	       mlB__h22903 :
	       14'd0 ;
  assign mesgLengthSoFar_EN =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ||
	     WILL_FIRE_RL_wmwt_mesgBegin ;
  // register mesgPreRequest
  assign mesgPreRequest_D_IN = MUX_mesgReqOK_write_1__SEL_3 ;
  assign mesgPreRequest_EN = 1'd1 ;
  // register mesgReqAddr
  assign mesgReqAddr_D_IN =
	     MUX_unrollCnt_write_1__SEL_1 ?
	       14'd0 :
	       MUX_mesgReqAddr_write_1__VAL_2 ;
  assign mesgReqAddr_EN =
	     WILL_FIRE_RL_wmrd_mesgBodyRequest ||
	     MUX_unrollCnt_write_1__SEL_1 ;
  // register mesgReqOK
  assign mesgReqOK_D_IN =
	     MUX_unrollCnt_write_1__SEL_2 || MUX_unrollCnt_write_1__SEL_1 ;
  assign mesgReqOK_EN =
	     CAN_FIRE_RL_wmrd_mesgBodyPreRequest &&
	     !WILL_FIRE_RL_wmrd_mesgBodyRequest ||
	     MUX_unrollCnt_write_1__SEL_1 ||
	     MUX_unrollCnt_write_1__SEL_2 ;
  // register opcode
  assign opcode_D_IN =
	     (WILL_FIRE_RL_wmwt_messageFinalize ||
	      WILL_FIRE_RL_wmwt_doAbort) ?
	       9'd170 :
	       MUX_opcode_write_1__VAL_3 ;
  assign opcode_EN =
	     WILL_FIRE_RL_wmwt_messageFinalize || WILL_FIRE_RL_wmwt_doAbort ||
	     WILL_FIRE_RL_wmwt_mesgBegin ;
  // register readyToPush
  assign readyToPush_D_IN =
	     !WILL_FIRE_RL_wmwt_doAbort && !MUX_endOfMessage_write_1__SEL_1 ;
  assign readyToPush_EN =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     wsiS_reqFifo_D_OUT[165] ||
	     WILL_FIRE_RL_wmwt_doAbort ||
	     WILL_FIRE_RL_wmwt_mesgBegin ;
  // register readyToRequest
  assign readyToRequest_D_IN = 1'b0 ;
  assign readyToRequest_EN = 1'b0 ;
  // register respF_rCache
  assign respF_rCache_D_IN =
	     { 1'd1,
	       respF_rWrPtr,
	       IF_respF_wDataIn_whas__28_THEN_respF_wDataIn_w_ETC___d431,
	       respF_pwEnqueue_whas && respF_wDataIn_wget[165],
	       respF_pwEnqueue_whas && respF_wDataIn_wget[164],
	       IF_respF_wDataIn_whas__28_THEN_respF_wDataIn_w_ETC___d437 } ;
  assign respF_rCache_EN = respF_pwEnqueue_whas ;
  // register respF_rRdPtr
  assign respF_rRdPtr_D_IN = x__h16253 ;
  assign respF_rRdPtr_EN = WILL_FIRE_RL_wmrd_mesgResptoWsi ;
  // register respF_rWrPtr
  assign respF_rWrPtr_D_IN = x__h16103 ;
  assign respF_rWrPtr_EN = respF_pwEnqueue_whas ;
  // register smaCtrl
  assign smaCtrl_D_IN = wci_wslv_reqF_D_OUT[31:0] ;
  assign smaCtrl_EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF_D_OUT[39:32] == 8'h0 ;
  // register thisMesg
  always@(MUX_endOfMessage_write_1__SEL_1 or
	  MUX_thisMesg_write_1__VAL_1 or
	  MUX_unrollCnt_write_1__SEL_1 or
	  MUX_thisMesg_write_1__VAL_2 or WILL_FIRE_RL_wci_ctrl_IsO)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_endOfMessage_write_1__SEL_1:
	  thisMesg_D_IN = MUX_thisMesg_write_1__VAL_1;
      MUX_unrollCnt_write_1__SEL_1:
	  thisMesg_D_IN = MUX_thisMesg_write_1__VAL_2;
      WILL_FIRE_RL_wci_ctrl_IsO: thisMesg_D_IN = 32'hFEFEFFFE;
      default: thisMesg_D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign thisMesg_EN =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     wsiS_reqFifo_D_OUT[165] ||
	     MUX_unrollCnt_write_1__SEL_1 ||
	     WILL_FIRE_RL_wci_ctrl_IsO ;
  // register unrollCnt
  assign unrollCnt_D_IN =
	     MUX_unrollCnt_write_1__SEL_1 ?
	       MUX_unrollCnt_write_1__VAL_1 :
	       MUX_unrollCnt_write_1__VAL_2 ;
  assign unrollCnt_EN =
	     MUX_unrollCnt_write_1__SEL_1 || MUX_unrollCnt_write_1__SEL_2 ;
  // register valExpect
  assign valExpect_D_IN = valExpect + 128'd1 ;
  assign valExpect_EN =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     (!wsiS_reqFifo_D_OUT[165] || wsiS_reqFifo_D_OUT[23:8] != 16'd0 ||
	      mesgLengthSoFar != 14'd0) ;
  // register wci_wslv_cEdge
  assign wci_wslv_cEdge_D_IN = wci_wslv_reqF_D_OUT[36:34] ;
  assign wci_wslv_cEdge_EN = WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  // register wci_wslv_cState
  assign wci_wslv_cState_D_IN = wci_wslv_nState ;
  assign wci_wslv_cState_EN =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge ;
  // register wci_wslv_ctlAckReg
  assign wci_wslv_ctlAckReg_D_IN = wci_wslv_ctlAckReg_1_whas ;
  assign wci_wslv_ctlAckReg_EN = 1'd1 ;
  // register wci_wslv_ctlOpActive
  assign wci_wslv_ctlOpActive_D_IN = !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  assign wci_wslv_ctlOpActive_EN =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  // register wci_wslv_illegalEdge
  assign wci_wslv_illegalEdge_D_IN =
	     MUX_wci_wslv_illegalEdge_write_1__SEL_1 &&
	     MUX_wci_wslv_illegalEdge_write_1__VAL_1 ;
  assign wci_wslv_illegalEdge_EN =
	     MUX_wci_wslv_illegalEdge_write_1__SEL_1 ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge ;
  // register wci_wslv_isReset_isInReset
  assign wci_wslv_isReset_isInReset_D_IN = 1'd0 ;
  assign wci_wslv_isReset_isInReset_EN = wci_wslv_isReset_isInReset ;
  // register wci_wslv_nState
  always@(wci_wslv_reqF_D_OUT)
  begin
    case (wci_wslv_reqF_D_OUT[36:34])
      3'd0: wci_wslv_nState_D_IN = 3'd1;
      3'd1: wci_wslv_nState_D_IN = 3'd2;
      3'd2: wci_wslv_nState_D_IN = 3'd3;
      default: wci_wslv_nState_D_IN = 3'd0;
    endcase
  end
  assign wci_wslv_nState_EN =
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     (wci_wslv_reqF_D_OUT[36:34] == 3'd0 && wci_wslv_cState == 3'd0 ||
	      wci_wslv_reqF_D_OUT[36:34] == 3'd1 &&
	      (wci_wslv_cState == 3'd1 || wci_wslv_cState == 3'd3) ||
	      wci_wslv_reqF_D_OUT[36:34] == 3'd2 && wci_wslv_cState == 3'd2 ||
	      wci_wslv_reqF_D_OUT[36:34] == 3'd3 &&
	      (wci_wslv_cState == 3'd3 || wci_wslv_cState == 3'd2 ||
	       wci_wslv_cState == 3'd1)) ;
  // register wci_wslv_reqF_countReg
  assign wci_wslv_reqF_countReg_D_IN =
	     (wci_wslv_wciReq_wget[71:69] != 3'd0) ?
	       wci_wslv_reqF_countReg + 2'd1 :
	       wci_wslv_reqF_countReg - 2'd1 ;
  assign wci_wslv_reqF_countReg_EN =
	     (wci_wslv_wciReq_wget[71:69] != 3'd0) !=
	     wci_wslv_reqF_r_deq_whas ;
  // register wci_wslv_respF_cntr_r
  assign wci_wslv_respF_cntr_r_D_IN =
	     WILL_FIRE_RL_wci_wslv_respF_decCtr ?
	       wci_wslv_respF_cntr_r_8_MINUS_1___d27 :
	       MUX_wci_wslv_respF_cntr_r_write_1__VAL_2 ;
  assign wci_wslv_respF_cntr_r_EN =
	     WILL_FIRE_RL_wci_wslv_respF_decCtr ||
	     WILL_FIRE_RL_wci_wslv_respF_incCtr ;
  // register wci_wslv_respF_q_0
  always@(MUX_wci_wslv_respF_q_0_write_1__SEL_1 or
	  MUX_wci_wslv_respF_q_0_write_1__VAL_1 or
	  MUX_wci_wslv_respF_q_0_write_1__SEL_2 or
	  MUX_wci_wslv_respF_q_0_write_1__VAL_2 or
	  WILL_FIRE_RL_wci_wslv_respF_decCtr or wci_wslv_respF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_wslv_respF_q_0_write_1__SEL_1:
	  wci_wslv_respF_q_0_D_IN = MUX_wci_wslv_respF_q_0_write_1__VAL_1;
      MUX_wci_wslv_respF_q_0_write_1__SEL_2:
	  wci_wslv_respF_q_0_D_IN = MUX_wci_wslv_respF_q_0_write_1__VAL_2;
      WILL_FIRE_RL_wci_wslv_respF_decCtr:
	  wci_wslv_respF_q_0_D_IN = wci_wslv_respF_q_1;
      default: wci_wslv_respF_q_0_D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_wslv_respF_q_0_EN =
	     WILL_FIRE_RL_wci_wslv_respF_both && _dfoo3 ||
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_cntr_r == 2'd0 ||
	     WILL_FIRE_RL_wci_wslv_respF_decCtr ;
  // register wci_wslv_respF_q_1
  always@(MUX_wci_wslv_respF_q_1_write_1__SEL_1 or
	  MUX_wci_wslv_respF_q_1_write_1__VAL_1 or
	  MUX_wci_wslv_respF_q_1_write_1__SEL_2 or
	  MUX_wci_wslv_respF_q_0_write_1__VAL_2 or
	  WILL_FIRE_RL_wci_wslv_respF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_wslv_respF_q_1_write_1__SEL_1:
	  wci_wslv_respF_q_1_D_IN = MUX_wci_wslv_respF_q_1_write_1__VAL_1;
      MUX_wci_wslv_respF_q_1_write_1__SEL_2:
	  wci_wslv_respF_q_1_D_IN = MUX_wci_wslv_respF_q_0_write_1__VAL_2;
      WILL_FIRE_RL_wci_wslv_respF_decCtr:
	  wci_wslv_respF_q_1_D_IN = 34'h0AAAAAAAA;
      default: wci_wslv_respF_q_1_D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_wslv_respF_q_1_EN =
	     WILL_FIRE_RL_wci_wslv_respF_both && _dfoo1 ||
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_cntr_r == 2'd1 ||
	     WILL_FIRE_RL_wci_wslv_respF_decCtr ;
  // register wci_wslv_sFlagReg
  assign wci_wslv_sFlagReg_D_IN = 1'b0 ;
  assign wci_wslv_sFlagReg_EN = 1'd1 ;
  // register wci_wslv_sThreadBusy_d
  assign wci_wslv_sThreadBusy_d_D_IN = 1'b0 ;
  assign wci_wslv_sThreadBusy_d_EN = 1'd1 ;
  // register wmi_busyWithMessage
  assign wmi_busyWithMessage_D_IN = 1'b0 ;
  assign wmi_busyWithMessage_EN = 1'b0 ;
  // register wmi_dhF_cntr_r
  assign wmi_dhF_cntr_r_D_IN =
	     WILL_FIRE_RL_wmi_dhF_decCtr ?
	       wmi_dhF_cntr_r_05_MINUS_1___d213 :
	       MUX_wmi_dhF_cntr_r_write_1__VAL_2 ;
  assign wmi_dhF_cntr_r_EN =
	     WILL_FIRE_RL_wmi_dhF_decCtr || WILL_FIRE_RL_wmi_dhF_incCtr ;
  // register wmi_dhF_q_0
  always@(MUX_wmi_dhF_q_0_write_1__SEL_1 or
	  MUX_wmi_dhF_q_0_write_1__VAL_1 or
	  MUX_wmi_dhF_q_0_write_1__SEL_2 or
	  MUX_wmi_dhF_q_0_write_1__VAL_2 or
	  WILL_FIRE_RL_wmi_dhF_decCtr or wmi_dhF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmi_dhF_q_0_write_1__SEL_1:
	  wmi_dhF_q_0_D_IN = MUX_wmi_dhF_q_0_write_1__VAL_1;
      MUX_wmi_dhF_q_0_write_1__SEL_2:
	  wmi_dhF_q_0_D_IN = MUX_wmi_dhF_q_0_write_1__VAL_2;
      WILL_FIRE_RL_wmi_dhF_decCtr: wmi_dhF_q_0_D_IN = wmi_dhF_q_1;
      default: wmi_dhF_q_0_D_IN =
		   146'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmi_dhF_q_0_EN =
	     WILL_FIRE_RL_wmi_dhF_both && _dfoo15 ||
	     WILL_FIRE_RL_wmi_dhF_incCtr && wmi_dhF_cntr_r == 2'd0 ||
	     WILL_FIRE_RL_wmi_dhF_decCtr ;
  // register wmi_dhF_q_1
  always@(MUX_wmi_dhF_q_1_write_1__SEL_1 or
	  MUX_wmi_dhF_q_1_write_1__VAL_1 or
	  MUX_wmi_dhF_q_1_write_1__SEL_2 or
	  MUX_wmi_dhF_q_0_write_1__VAL_2 or WILL_FIRE_RL_wmi_dhF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmi_dhF_q_1_write_1__SEL_1:
	  wmi_dhF_q_1_D_IN = MUX_wmi_dhF_q_1_write_1__VAL_1;
      MUX_wmi_dhF_q_1_write_1__SEL_2:
	  wmi_dhF_q_1_D_IN = MUX_wmi_dhF_q_0_write_1__VAL_2;
      WILL_FIRE_RL_wmi_dhF_decCtr: wmi_dhF_q_1_D_IN = 146'd0;
      default: wmi_dhF_q_1_D_IN =
		   146'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmi_dhF_q_1_EN =
	     WILL_FIRE_RL_wmi_dhF_both && _dfoo13 ||
	     WILL_FIRE_RL_wmi_dhF_incCtr && wmi_dhF_cntr_r == 2'd1 ||
	     WILL_FIRE_RL_wmi_dhF_decCtr ;
  // register wmi_errorSticky
  assign wmi_errorSticky_D_IN = 1'b0 ;
  assign wmi_errorSticky_EN = 1'b0 ;
  // register wmi_isReset_isInReset
  assign wmi_isReset_isInReset_D_IN = 1'd0 ;
  assign wmi_isReset_isInReset_EN = wmi_isReset_isInReset ;
  // register wmi_mFlagF_cntr_r
  assign wmi_mFlagF_cntr_r_D_IN =
	     WILL_FIRE_RL_wmi_mFlagF_decCtr ?
	       wmi_mFlagF_cntr_r_83_MINUS_1___d191 :
	       MUX_wmi_mFlagF_cntr_r_write_1__VAL_2 ;
  assign wmi_mFlagF_cntr_r_EN =
	     WILL_FIRE_RL_wmi_mFlagF_decCtr ||
	     WILL_FIRE_RL_wmi_mFlagF_incCtr ;
  // register wmi_mFlagF_q_0
  always@(MUX_wmi_mFlagF_q_0_write_1__SEL_1 or
	  MUX_wmi_mFlagF_q_0_write_1__VAL_1 or
	  MUX_wmi_mFlagF_q_0_write_1__SEL_2 or
	  value__h6387 or WILL_FIRE_RL_wmi_mFlagF_decCtr or wmi_mFlagF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmi_mFlagF_q_0_write_1__SEL_1:
	  wmi_mFlagF_q_0_D_IN = MUX_wmi_mFlagF_q_0_write_1__VAL_1;
      MUX_wmi_mFlagF_q_0_write_1__SEL_2: wmi_mFlagF_q_0_D_IN = value__h6387;
      WILL_FIRE_RL_wmi_mFlagF_decCtr: wmi_mFlagF_q_0_D_IN = wmi_mFlagF_q_1;
      default: wmi_mFlagF_q_0_D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmi_mFlagF_q_0_EN =
	     WILL_FIRE_RL_wmi_mFlagF_both && _dfoo11 ||
	     WILL_FIRE_RL_wmi_mFlagF_incCtr && wmi_mFlagF_cntr_r == 2'd0 ||
	     WILL_FIRE_RL_wmi_mFlagF_decCtr ;
  // register wmi_mFlagF_q_1
  always@(MUX_wmi_mFlagF_q_1_write_1__SEL_1 or
	  MUX_wmi_mFlagF_q_1_write_1__VAL_1 or
	  MUX_wmi_mFlagF_q_1_write_1__SEL_2 or
	  value__h6387 or WILL_FIRE_RL_wmi_mFlagF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmi_mFlagF_q_1_write_1__SEL_1:
	  wmi_mFlagF_q_1_D_IN = MUX_wmi_mFlagF_q_1_write_1__VAL_1;
      MUX_wmi_mFlagF_q_1_write_1__SEL_2: wmi_mFlagF_q_1_D_IN = value__h6387;
      WILL_FIRE_RL_wmi_mFlagF_decCtr: wmi_mFlagF_q_1_D_IN = 32'd0;
      default: wmi_mFlagF_q_1_D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmi_mFlagF_q_1_EN =
	     WILL_FIRE_RL_wmi_mFlagF_both && _dfoo9 ||
	     WILL_FIRE_RL_wmi_mFlagF_incCtr && wmi_mFlagF_cntr_r == 2'd1 ||
	     WILL_FIRE_RL_wmi_mFlagF_decCtr ;
  // register wmi_operateD
  assign wmi_operateD_D_IN = wci_wslv_cState == 3'd2 ;
  assign wmi_operateD_EN = 1'd1 ;
  // register wmi_peerIsReady
  assign wmi_peerIsReady_D_IN = wmiM0_SReset_n ;
  assign wmi_peerIsReady_EN = 1'd1 ;
  // register wmi_reqF_cntr_r
  assign wmi_reqF_cntr_r_D_IN =
	     WILL_FIRE_RL_wmi_reqF_decCtr ?
	       wmi_reqF_cntr_r_61_MINUS_1___d169 :
	       MUX_wmi_reqF_cntr_r_write_1__VAL_2 ;
  assign wmi_reqF_cntr_r_EN =
	     WILL_FIRE_RL_wmi_reqF_decCtr || WILL_FIRE_RL_wmi_reqF_incCtr ;
  // register wmi_reqF_q_0
  always@(MUX_wmi_reqF_q_0_write_1__SEL_1 or
	  MUX_wmi_reqF_q_0_write_1__VAL_1 or
	  MUX_wmi_reqF_q_0_write_1__SEL_2 or
	  MUX_wmi_reqF_q_0_write_1__VAL_2 or
	  WILL_FIRE_RL_wmi_reqF_decCtr or wmi_reqF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmi_reqF_q_0_write_1__SEL_1:
	  wmi_reqF_q_0_D_IN = MUX_wmi_reqF_q_0_write_1__VAL_1;
      MUX_wmi_reqF_q_0_write_1__SEL_2:
	  wmi_reqF_q_0_D_IN = MUX_wmi_reqF_q_0_write_1__VAL_2;
      WILL_FIRE_RL_wmi_reqF_decCtr: wmi_reqF_q_0_D_IN = wmi_reqF_q_1;
      default: wmi_reqF_q_0_D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmi_reqF_q_0_EN =
	     WILL_FIRE_RL_wmi_reqF_both && _dfoo7 ||
	     WILL_FIRE_RL_wmi_reqF_incCtr && wmi_reqF_cntr_r == 2'd0 ||
	     WILL_FIRE_RL_wmi_reqF_decCtr ;
  // register wmi_reqF_q_1
  always@(MUX_wmi_reqF_q_1_write_1__SEL_1 or
	  MUX_wmi_reqF_q_1_write_1__VAL_1 or
	  MUX_wmi_reqF_q_1_write_1__SEL_2 or
	  MUX_wmi_reqF_q_0_write_1__VAL_2 or WILL_FIRE_RL_wmi_reqF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmi_reqF_q_1_write_1__SEL_1:
	  wmi_reqF_q_1_D_IN = MUX_wmi_reqF_q_1_write_1__VAL_1;
      MUX_wmi_reqF_q_1_write_1__SEL_2:
	  wmi_reqF_q_1_D_IN = MUX_wmi_reqF_q_0_write_1__VAL_2;
      WILL_FIRE_RL_wmi_reqF_decCtr: wmi_reqF_q_1_D_IN = 32'd0;
      default: wmi_reqF_q_1_D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmi_reqF_q_1_EN =
	     WILL_FIRE_RL_wmi_reqF_both && _dfoo5 ||
	     WILL_FIRE_RL_wmi_reqF_incCtr && wmi_reqF_cntr_r == 2'd1 ||
	     WILL_FIRE_RL_wmi_reqF_decCtr ;
  // register wmi_sDataThreadBusy_d
  assign wmi_sDataThreadBusy_d_D_IN = wmiM0_SDataThreadBusy ;
  assign wmi_sDataThreadBusy_d_EN = 1'd1 ;
  // register wmi_sFlagReg
  assign wmi_sFlagReg_D_IN = wmiM0_SFlag ;
  assign wmi_sFlagReg_EN = 1'd1 ;
  // register wmi_sThreadBusy_d
  assign wmi_sThreadBusy_d_D_IN = wmiM0_SThreadBusy ;
  assign wmi_sThreadBusy_d_EN = 1'd1 ;
  // register wmi_statusR
  assign wmi_statusR_D_IN = 8'h0 ;
  assign wmi_statusR_EN = 1'b0 ;
  // register wmi_trafficSticky
  assign wmi_trafficSticky_D_IN = 1'b0 ;
  assign wmi_trafficSticky_EN = 1'b0 ;
  // register wmwtBeginCount
  assign wmwtBeginCount_D_IN = wmwtBeginCount + 32'd1 ;
  assign wmwtBeginCount_EN = WILL_FIRE_RL_wmwt_mesgBegin ;
  // register wmwtFinalCount
  assign wmwtFinalCount_D_IN = wmwtFinalCount + 32'd1 ;
  assign wmwtFinalCount_EN = WILL_FIRE_RL_wmwt_messageFinalize ;
  // register wmwtPushCount
  assign wmwtPushCount_D_IN = wmwtPushCount + 32'd1 ;
  assign wmwtPushCount_EN = MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  // register wsiM_burstKind
  assign wsiM_burstKind_D_IN =
	     (wsiM_burstKind == 2'd0) ?
	       (wsiM_reqFifo_q_0[164] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsiM_burstKind_EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[168:166] == 3'd1 &&
	     (wsiM_burstKind == 2'd0 ||
	      (wsiM_burstKind == 2'd1 || wsiM_burstKind == 2'd2) &&
	      wsiM_reqFifo_q_0[165]) ;
  // register wsiM_errorSticky
  assign wsiM_errorSticky_D_IN = 1'b0 ;
  assign wsiM_errorSticky_EN = 1'b0 ;
  // register wsiM_iMesgCount
  assign wsiM_iMesgCount_D_IN = wsiM_iMesgCount + 32'd1 ;
  assign wsiM_iMesgCount_EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[168:166] == 3'd1 &&
	     wsiM_burstKind == 2'd2 &&
	     wsiM_reqFifo_q_0[165] ;
  // register wsiM_isReset_isInReset
  assign wsiM_isReset_isInReset_D_IN = 1'd0 ;
  assign wsiM_isReset_isInReset_EN = wsiM_isReset_isInReset ;
  // register wsiM_operateD
  assign wsiM_operateD_D_IN = wci_wslv_cState == 3'd2 ;
  assign wsiM_operateD_EN = 1'd1 ;
  // register wsiM_pMesgCount
  assign wsiM_pMesgCount_D_IN = wsiM_pMesgCount + 32'd1 ;
  assign wsiM_pMesgCount_EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[168:166] == 3'd1 &&
	     wsiM_burstKind == 2'd1 &&
	     wsiM_reqFifo_q_0[165] ;
  // register wsiM_peerIsReady
  assign wsiM_peerIsReady_D_IN = wsiM0_SReset_n ;
  assign wsiM_peerIsReady_EN = 1'd1 ;
  // register wsiM_reqFifo_cntr_r
  assign wsiM_reqFifo_cntr_r_D_IN =
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ?
	       MUX_wsiM_reqFifo_cntr_r_write_1__VAL_1 :
	       MUX_wsiM_reqFifo_cntr_r_write_1__VAL_2 ;
  assign wsiM_reqFifo_cntr_r_EN =
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ||
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr ;
  // register wsiM_reqFifo_q_0
  always@(MUX_wsiM_reqFifo_q_0_write_1__SEL_1 or
	  MUX_wsiM_reqFifo_q_0_write_1__VAL_1 or
	  MUX_wsiM_reqFifo_q_0_write_1__SEL_2 or
	  MUX_wsiM_reqFifo_q_0_write_1__VAL_2 or
	  WILL_FIRE_RL_wsiM_reqFifo_decCtr or wsiM_reqFifo_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wsiM_reqFifo_q_0_write_1__SEL_1:
	  wsiM_reqFifo_q_0_D_IN = MUX_wsiM_reqFifo_q_0_write_1__VAL_1;
      MUX_wsiM_reqFifo_q_0_write_1__SEL_2:
	  wsiM_reqFifo_q_0_D_IN = MUX_wsiM_reqFifo_q_0_write_1__VAL_2;
      WILL_FIRE_RL_wsiM_reqFifo_decCtr:
	  wsiM_reqFifo_q_0_D_IN = wsiM_reqFifo_q_1;
      default: wsiM_reqFifo_q_0_D_IN =
		   169'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsiM_reqFifo_q_0_EN =
	     WILL_FIRE_RL_wsiM_reqFifo_both && _dfoo19 ||
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr &&
	     wsiM_reqFifo_cntr_r == 2'd0 ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;
  // register wsiM_reqFifo_q_1
  always@(MUX_wsiM_reqFifo_q_1_write_1__SEL_1 or
	  MUX_wsiM_reqFifo_q_1_write_1__VAL_1 or
	  MUX_wsiM_reqFifo_q_1_write_1__SEL_2 or
	  MUX_wsiM_reqFifo_q_0_write_1__VAL_2 or
	  WILL_FIRE_RL_wsiM_reqFifo_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wsiM_reqFifo_q_1_write_1__SEL_1:
	  wsiM_reqFifo_q_1_D_IN = MUX_wsiM_reqFifo_q_1_write_1__VAL_1;
      MUX_wsiM_reqFifo_q_1_write_1__SEL_2:
	  wsiM_reqFifo_q_1_D_IN = MUX_wsiM_reqFifo_q_0_write_1__VAL_2;
      WILL_FIRE_RL_wsiM_reqFifo_decCtr:
	  wsiM_reqFifo_q_1_D_IN =
	      169'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00;
      default: wsiM_reqFifo_q_1_D_IN =
		   169'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsiM_reqFifo_q_1_EN =
	     WILL_FIRE_RL_wsiM_reqFifo_both && _dfoo17 ||
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr &&
	     wsiM_reqFifo_cntr_r == 2'd1 ||
	     WILL_FIRE_RL_wsiM_reqFifo_decCtr ;
  // register wsiM_sThreadBusy_d
  assign wsiM_sThreadBusy_d_D_IN = wsiM0_SThreadBusy ;
  assign wsiM_sThreadBusy_d_EN = 1'd1 ;
  // register wsiM_statusR
  assign wsiM_statusR_D_IN =
	     { wsiM_isReset_isInReset,
	       !wsiM_peerIsReady,
	       !wsiM_operateD,
	       wsiM_errorSticky,
	       wsiM_burstKind != 2'd0,
	       wsiM_sThreadBusy_d,
	       1'd0,
	       wsiM_trafficSticky } ;
  assign wsiM_statusR_EN = 1'd1 ;
  // register wsiM_tBusyCount
  assign wsiM_tBusyCount_D_IN = wsiM_tBusyCount + 32'd1 ;
  assign wsiM_tBusyCount_EN =
	     wsiM_operateD && wsiM_peerIsReady && wsiM_sThreadBusy_d ;
  // register wsiM_trafficSticky
  assign wsiM_trafficSticky_D_IN = 1'd1 ;
  assign wsiM_trafficSticky_EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[168:166] == 3'd1 ;
  // register wsiS_burstKind
  assign wsiS_burstKind_D_IN =
	     (wsiS_burstKind == 2'd0) ?
	       (wsiS_wsiReq_wget[164] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsiS_burstKind_EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq &&
	     (wsiS_burstKind == 2'd0 ||
	      (wsiS_burstKind == 2'd1 || wsiS_burstKind == 2'd2) &&
	      wsiS_wsiReq_wget[165]) ;
  // register wsiS_errorSticky
  assign wsiS_errorSticky_D_IN = 1'b0 ;
  assign wsiS_errorSticky_EN = 1'b0 ;
  // register wsiS_iMesgCount
  assign wsiS_iMesgCount_D_IN = wsiS_iMesgCount + 32'd1 ;
  assign wsiS_iMesgCount_EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_burstKind == 2'd2 &&
	     wsiS_wsiReq_wget[165] ;
  // register wsiS_isReset_isInReset
  assign wsiS_isReset_isInReset_D_IN = 1'd0 ;
  assign wsiS_isReset_isInReset_EN = wsiS_isReset_isInReset ;
  // register wsiS_mesgWordLength
  assign wsiS_mesgWordLength_D_IN = wsiS_wordCount ;
  assign wsiS_mesgWordLength_EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_wsiReq_wget[165] ;
  // register wsiS_operateD
  assign wsiS_operateD_D_IN = wci_wslv_cState == 3'd2 ;
  assign wsiS_operateD_EN = 1'd1 ;
  // register wsiS_pMesgCount
  assign wsiS_pMesgCount_D_IN = wsiS_pMesgCount + 32'd1 ;
  assign wsiS_pMesgCount_EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_burstKind == 2'd1 &&
	     wsiS_wsiReq_wget[165] ;
  // register wsiS_peerIsReady
  assign wsiS_peerIsReady_D_IN = wsiS0_MReset_n ;
  assign wsiS_peerIsReady_EN = 1'd1 ;
  // register wsiS_reqFifo_countReg
  assign wsiS_reqFifo_countReg_D_IN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq ?
	       wsiS_reqFifo_countReg + 2'd1 :
	       wsiS_reqFifo_countReg - 2'd1 ;
  assign wsiS_reqFifo_countReg_EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq != wsiS_reqFifo_r_deq_whas ;
  // register wsiS_reqFifo_levelsValid
  assign wsiS_reqFifo_levelsValid_D_IN = WILL_FIRE_RL_wsiS_reqFifo_reset ;
  assign wsiS_reqFifo_levelsValid_EN =
	     WILL_FIRE_RL_wsipass_doMessagePush ||
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ||
	     WILL_FIRE_RL_wsiS_reqFifo_enq ||
	     WILL_FIRE_RL_wsiS_reqFifo_reset ;
  // register wsiS_statusR
  assign wsiS_statusR_D_IN =
	     { wsiS_isReset_isInReset,
	       !wsiS_peerIsReady,
	       !wsiS_operateD,
	       wsiS_errorSticky,
	       wsiS_burstKind != 2'd0,
	       !wsiS_sThreadBusy_dw_whas || wsiS_sThreadBusy_dw_wget,
	       1'd0,
	       wsiS_trafficSticky } ;
  assign wsiS_statusR_EN = 1'd1 ;
  // register wsiS_tBusyCount
  assign wsiS_tBusyCount_D_IN = wsiS_tBusyCount + 32'd1 ;
  assign wsiS_tBusyCount_EN =
	     wsiS_operateD && wsiS_peerIsReady &&
	     (!wsiS_sThreadBusy_dw_whas || wsiS_sThreadBusy_dw_wget) ;
  // register wsiS_trafficSticky
  assign wsiS_trafficSticky_D_IN = 1'd1 ;
  assign wsiS_trafficSticky_EN = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  // register wsiS_wordCount
  assign wsiS_wordCount_D_IN =
	     wsiS_wsiReq_wget[165] ? 12'd1 : wsiS_wordCount + 12'd1 ;
  assign wsiS_wordCount_EN = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  // submodule mesgTokenF
  assign mesgTokenF_ENQ = WILL_FIRE_RL_wmwt_mesgBegin ;
  assign mesgTokenF_DEQ = WILL_FIRE_RL_wmwt_messageFinalize ;
  assign mesgTokenF_CLR = 1'b0 ;
  // submodule respF_memory
  assign respF_memory_ADDRA = respF_rWrPtr[10:0] ;
  assign respF_memory_ADDRB =
	     WILL_FIRE_RL_wmrd_mesgResptoWsi ?
	       x__h16253[10:0] :
	       respF_rRdPtr[10:0] ;
  assign respF_memory_DIA =
	     { IF_respF_wDataIn_whas__28_THEN_respF_wDataIn_w_ETC___d431,
	       respF_pwEnqueue_whas && respF_wDataIn_wget[165],
	       respF_pwEnqueue_whas && respF_wDataIn_wget[164],
	       IF_respF_wDataIn_whas__28_THEN_respF_wDataIn_w_ETC___d437 } ;
  assign respF_memory_DIB =
	     169'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */  ;
  assign respF_memory_WEA = respF_pwEnqueue_whas ;
  assign respF_memory_WEB = 1'd0 ;
  assign respF_memory_ENA = 1'b1 ;
  assign respF_memory_ENB = 1'b1 ;
  // submodule wci_wslv_reqF
  assign wci_wslv_reqF_D_IN = wci_wslv_wciReq_wget ;
  assign wci_wslv_reqF_ENQ = wci_wslv_wciReq_wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF_DEQ = wci_wslv_reqF_r_deq_whas ;
  assign wci_wslv_reqF_CLR = 1'b0 ;
  // submodule wmi_respF
  assign wmi_respF_D_IN = wmi_wmiResponse_wget ;
  assign wmi_respF_ENQ =
	     wmi_respF_FULL_N && wmi_operateD && wmi_peerIsReady &&
	     wmi_wmiResponse_wget[129:128] != 2'd0 ;
  assign wmi_respF_DEQ = MUX_unrollCnt_write_1__SEL_2 ;
  assign wmi_respF_CLR = 1'b0 ;
  // submodule wsiS_reqFifo
  assign wsiS_reqFifo_D_IN = wsiS_wsiReq_wget ;
  assign wsiS_reqFifo_ENQ = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_DEQ = wsiS_reqFifo_r_deq_whas ;
  assign wsiS_reqFifo_CLR = 1'b0 ;
  // remaining internal signals
  assign IF_respF_wDataIn_whas__28_THEN_respF_wDataIn_w_ETC___d431 =
	     respF_pwEnqueue_whas ? respF_wDataIn_wget[168:166] : 3'd0 ;
  assign IF_respF_wDataIn_whas__28_THEN_respF_wDataIn_w_ETC___d437 =
	     respF_pwEnqueue_whas ? respF_wDataIn_wget[163:0] : 164'd0 ;
  assign NOT_wmi_reqF_cntr_r_61_EQ_2_73_74_AND_wmi_oper_ETC___d521 =
	     wmi_reqF_cntr_r != 2'd2 && wmi_operateD && wmi_peerIsReady &&
	     (!x__h18328 || wmi_mFlagF_cntr_r != 2'd2) ;
  assign _dfoo1 =
	     wci_wslv_respF_cntr_r != 2'd2 ||
	     wci_wslv_respF_cntr_r_8_MINUS_1___d27 == 2'd1 ;
  assign _dfoo11 =
	     wmi_mFlagF_cntr_r != 2'd1 ||
	     wmi_mFlagF_cntr_r_83_MINUS_1___d191 == 2'd0 ;
  assign _dfoo13 =
	     wmi_dhF_cntr_r != 2'd2 ||
	     wmi_dhF_cntr_r_05_MINUS_1___d213 == 2'd1 ;
  assign _dfoo15 =
	     wmi_dhF_cntr_r != 2'd1 ||
	     wmi_dhF_cntr_r_05_MINUS_1___d213 == 2'd0 ;
  assign _dfoo17 =
	     wsiM_reqFifo_cntr_r != 2'd2 ||
	     MUX_wsiM_reqFifo_cntr_r_write_1__VAL_1 == 2'd1 ;
  assign _dfoo19 =
	     wsiM_reqFifo_cntr_r != 2'd1 ||
	     MUX_wsiM_reqFifo_cntr_r_write_1__VAL_1 == 2'd0 ;
  assign _dfoo3 =
	     wci_wslv_respF_cntr_r != 2'd1 ||
	     wci_wslv_respF_cntr_r_8_MINUS_1___d27 == 2'd0 ;
  assign _dfoo5 =
	     wmi_reqF_cntr_r != 2'd2 ||
	     wmi_reqF_cntr_r_61_MINUS_1___d169 == 2'd1 ;
  assign _dfoo7 =
	     wmi_reqF_cntr_r != 2'd1 ||
	     wmi_reqF_cntr_r_61_MINUS_1___d169 == 2'd0 ;
  assign _dfoo9 =
	     wmi_mFlagF_cntr_r != 2'd2 ||
	     wmi_mFlagF_cntr_r_83_MINUS_1___d191 == 2'd1 ;
  assign b__h14802 = -fabWordsCurReq[11:0] ;
  assign b__h17784 = x__h17904 + residue__h17647 ;
  assign b__h18157 = { {2{fabRespCredit_value[11]}}, fabRespCredit_value } ;
  assign mesgMetaF_length__h23070 =
	     (wsiS_reqFifo_D_OUT[165] && wsiS_reqFifo_D_OUT[23:8] == 16'd0 &&
	      mesgLengthSoFar == 14'd0) ?
	       24'd0 :
	       { 10'd0, mlB__h22903 } ;
  assign mesgMetaF_opcode__h23069 = opcode[8] ? opcode[7:0] : 8'd0 ;
  assign mlB__h22903 = mesgLengthSoFar + mlInc__h22902 ;
  assign mlInc__h22902 =
	     wsiS_reqFifo_D_OUT[165] ?
	       { 9'd0, x__h23108 + y__h23109 } :
	       14'd16 ;
  assign rdat__h24980 = hasDebugLogic ? mesgCount : 32'd0 ;
  assign rdat__h24986 = hasDebugLogic ? abortCount : 32'd0 ;
  assign rdat__h24992 = hasDebugLogic ? thisMesg : 32'd0 ;
  assign rdat__h25005 = hasDebugLogic ? lastMesg : 32'd0 ;
  assign rdat__h25028 = hasDebugLogic ? { 16'd0, x__h25032 } : 32'd0 ;
  assign rdat__h25128 = hasDebugLogic ? wsiS_extStatusW_wget[95:64] : 32'd0 ;
  assign rdat__h25142 = hasDebugLogic ? wsiS_extStatusW_wget[63:32] : 32'd0 ;
  assign rdat__h25150 = hasDebugLogic ? wsiS_extStatusW_wget[31:0] : 32'd0 ;
  assign rdat__h25156 = hasDebugLogic ? wsiM_extStatusW_wget[95:64] : 32'd0 ;
  assign rdat__h25170 = hasDebugLogic ? wsiM_extStatusW_wget[63:32] : 32'd0 ;
  assign rdat__h25178 = hasDebugLogic ? wsiM_extStatusW_wget[31:0] : 32'd0 ;
  assign rdat__h25184 = hasDebugLogic ? wmwtBeginCount : 32'd0 ;
  assign rdat__h25190 = hasDebugLogic ? wmwtPushCount : 32'd0 ;
  assign rdat__h25196 = hasDebugLogic ? wmwtFinalCount : 32'd0 ;
  assign rdat__h25202 = hasDebugLogic ? { 31'd0, x__h25206 } : 32'd0 ;
  assign rdat__h25212 = hasDebugLogic ? 32'hFEEDC0DE : 32'd0 ;
  assign residue__h17647 =
	     ({ 2'd0, wmi_sFlagReg[3:0] } == 6'd0) ? 24'd0 : 24'd1 ;
  assign sendData_burstLength__h18617 =
	     (thisMesg[15:0] == 16'd0 || smaCtrl[5] && unrollCnt == 16'd1) ?
	       12'd1 :
	       (smaCtrl[5] ? 12'd4095 : wsiBurstLength__h18535[11:0]) ;
  assign sendData_byteEn__h18619 =
	     (thisMesg[15:0] == 16'd0) ?
	       thisMesg[15:0] :
	       ((unrollCnt == 16'd1) ? x__h18676[15:0] : 16'd65535) ;
  assign value__h6387 =
	     MUX_wmi_mFlagF_x_wire_wset_1__SEL_1 ?
	       32'hAAAAAAAA /* unspecified value */  :
	       MUX_wmi_mFlagF_x_wire_wset_1__VAL_2 ;
  assign wci_wslv_respF_cntr_r_8_MINUS_1___d27 =
	     wci_wslv_respF_cntr_r - 2'd1 ;
  assign wmi_dhF_cntr_r_05_MINUS_1___d213 = wmi_dhF_cntr_r - 2'd1 ;
  assign wmi_mFlagF_cntr_r_83_MINUS_1___d191 = wmi_mFlagF_cntr_r - 2'd1 ;
  assign wmi_reqF_cntr_r_61_MINUS_1___d169 = wmi_reqF_cntr_r - 2'd1 ;
  assign wmi_respF_i_notEmpty__34_AND_smaCtrl_62_BIT_4__ETC___d539 =
	     wmi_respF_EMPTY_N &&
	     (smaCtrl[4] || respF_rRdPtr + 12'd1024 != respF_rWrPtr) ;
  assign wsiBurstLength__h18535 =
	     smaCtrl[5] ? 16'd2 : { 4'd0, thisMesg[15:4] } ;
  assign wsiS_reqFifo_i_notEmpty__61_AND_NOT_smaCtrl_62_ETC___d667 =
	     wsiS_reqFifo_EMPTY_N &&
	     (smaCtrl[3:0] != 4'h3 || wsiM_reqFifo_cntr_r != 2'd2) &&
	     (!wsiS_reqFifo_D_OUT[165] || wmi_mFlagF_cntr_r != 2'd2) ;
  assign x__h16103 = respF_rWrPtr + 12'd1 ;
  assign x__h16253 = respF_rRdPtr + 12'd1 ;
  assign x__h17904 = { 4'd0, wmi_sFlagReg[23:4] } ;
  assign x__h18328 = fabWordsRemain == fabWordsCurReq ;
  assign x__h18676 =
	     ({ 2'd0, thisMesg[3:0] } == 6'd0) ?
	       32'hFFFFFFFF :
	       (({ 2'd0, thisMesg[3:0] } <= 6'd1) ?
		  32'd1 :
		  (({ 2'd0, thisMesg[3:0] } <= 6'd2) ?
		     32'd3 :
		     (({ 2'd0, thisMesg[3:0] } <= 6'd3) ?
			32'd7 :
			(({ 2'd0, thisMesg[3:0] } <= 6'd4) ?
			   32'd15 :
			   (({ 2'd0, thisMesg[3:0] } <= 6'd5) ?
			      32'd31 :
			      (({ 2'd0, thisMesg[3:0] } <= 6'd6) ?
				 32'd63 :
				 (({ 2'd0, thisMesg[3:0] } <= 6'd7) ?
				    32'd127 :
				    (({ 2'd0, thisMesg[3:0] } <= 6'd8) ?
				       32'd255 :
				       (({ 2'd0, thisMesg[3:0] } <= 6'd9) ?
					  32'd511 :
					  (({ 2'd0, thisMesg[3:0] } <=
					    6'd10) ?
					     32'd1023 :
					     (({ 2'd0, thisMesg[3:0] } <=
					       6'd11) ?
						32'd2047 :
						(({ 2'd0, thisMesg[3:0] } <=
						  6'd12) ?
						   32'd4095 :
						   (({ 2'd0,
						       thisMesg[3:0] } <=
						     6'd13) ?
						      32'd8191 :
						      (({ 2'd0,
							  thisMesg[3:0] } <=
							6'd14) ?
							 32'd16383 :
							 (({ 2'd0,
							     thisMesg[3:0] } <=
							   6'd15) ?
							    32'd32767 :
							    (({ 2'd0,
								thisMesg[3:0] } <=
							      6'd16) ?
							       32'd65535 :
							       (({ 2'd0,
								   thisMesg[3:0] } <=
								 6'd17) ?
								  32'd131071 :
								  (({ 2'd0,
								      thisMesg[3:0] } <=
								    6'd18) ?
								     32'd262143 :
								     (({ 2'd0,
									 thisMesg[3:0] } <=
								       6'd19) ?
									32'd524287 :
									(({ 2'd0,
									    thisMesg[3:0] } <=
									  6'd20) ?
									   32'd1048575 :
									   (({ 2'd0,
									       thisMesg[3:0] } <=
									     6'd21) ?
									      32'd2097151 :
									      (({ 2'd0,
										  thisMesg[3:0] } <=
										6'd22) ?
										 32'd4194303 :
										 (({ 2'd0,
										     thisMesg[3:0] } <=
										   6'd23) ?
										    32'd8388607 :
										    (({ 2'd0,
											thisMesg[3:0] } <=
										      6'd24) ?
										       32'd16777215 :
										       (({ 2'd0,
											   thisMesg[3:0] } <=
											 6'd25) ?
											  32'd33554431 :
											  (({ 2'd0,
											      thisMesg[3:0] } <=
											    6'd26) ?
											     32'd67108863 :
											     (({ 2'd0,
												 thisMesg[3:0] } <=
											       6'd27) ?
												32'd134217727 :
												(({ 2'd0,
												    thisMesg[3:0] } <=
												  6'd28) ?
												   32'd268435455 :
												   (({ 2'd0,
												       thisMesg[3:0] } <=
												     6'd29) ?
												      32'd536870911 :
												      (({ 2'd0,
													  thisMesg[3:0] } <=
													6'd30) ?
													 32'd1073741823 :
													 (({ 2'd0,
													     thisMesg[3:0] } <=
													   6'd31) ?
													    32'h7FFFFFFF :
													    32'hFFFFFFFF))))))))))))))))))))))))))))))) ;
  assign x__h23108 = x__h23120 + y__h23121 ;
  assign x__h23120 = x__h23132 + y__h23133 ;
  assign x__h23132 = x__h23144 + y__h23145 ;
  assign x__h23144 = x__h23156 + y__h23157 ;
  assign x__h23156 = x__h23168 + y__h23169 ;
  assign x__h23168 = x__h23180 + y__h23181 ;
  assign x__h23180 = x__h23192 + y__h23193 ;
  assign x__h23192 = x__h23204 + y__h23205 ;
  assign x__h23204 = x__h23216 + y__h23217 ;
  assign x__h23216 = x__h23228 + y__h23229 ;
  assign x__h23228 = x__h23240 + y__h23241 ;
  assign x__h23240 = x__h23252 + y__h23253 ;
  assign x__h23252 = x__h23264 + y__h23265 ;
  assign x__h23264 = x__h23276 + y__h23277 ;
  assign x__h23276 = { 4'd0, wsiS_reqFifo_D_OUT[23] } ;
  assign x__h25032 = { wsiS_statusR, wsiM_statusR } ;
  assign x__h25206 = wmi_sThreadBusy_d || wmi_sDataThreadBusy_d ;
  assign x_length__h23961 = { 2'd0, mlB__h22903 } ;
  assign y__h23109 = { 4'd0, wsiS_reqFifo_D_OUT[8] } ;
  assign y__h23121 = { 4'd0, wsiS_reqFifo_D_OUT[9] } ;
  assign y__h23133 = { 4'd0, wsiS_reqFifo_D_OUT[10] } ;
  assign y__h23145 = { 4'd0, wsiS_reqFifo_D_OUT[11] } ;
  assign y__h23157 = { 4'd0, wsiS_reqFifo_D_OUT[12] } ;
  assign y__h23169 = { 4'd0, wsiS_reqFifo_D_OUT[13] } ;
  assign y__h23181 = { 4'd0, wsiS_reqFifo_D_OUT[14] } ;
  assign y__h23193 = { 4'd0, wsiS_reqFifo_D_OUT[15] } ;
  assign y__h23205 = { 4'd0, wsiS_reqFifo_D_OUT[16] } ;
  assign y__h23217 = { 4'd0, wsiS_reqFifo_D_OUT[17] } ;
  assign y__h23229 = { 4'd0, wsiS_reqFifo_D_OUT[18] } ;
  assign y__h23241 = { 4'd0, wsiS_reqFifo_D_OUT[19] } ;
  assign y__h23253 = { 4'd0, wsiS_reqFifo_D_OUT[20] } ;
  assign y__h23265 = { 4'd0, wsiS_reqFifo_D_OUT[21] } ;
  assign y__h23277 = { 4'd0, wsiS_reqFifo_D_OUT[22] } ;
  always@(wci_wslv_reqF_D_OUT or
	  smaCtrl or
	  rdat__h24980 or
	  rdat__h24986 or
	  rdat__h24992 or
	  rdat__h25005 or
	  rdat__h25028 or
	  rdat__h25128 or
	  rdat__h25142 or
	  rdat__h25150 or
	  rdat__h25156 or
	  rdat__h25170 or
	  rdat__h25178 or
	  rdat__h25184 or
	  rdat__h25190 or rdat__h25196 or rdat__h25202 or rdat__h25212)
  begin
    case (wci_wslv_reqF_D_OUT[39:32])
      8'h0: g_data__h24937 = smaCtrl;
      8'h04: g_data__h24937 = rdat__h24980;
      8'h08: g_data__h24937 = rdat__h24986;
      8'h10: g_data__h24937 = rdat__h24992;
      8'h14: g_data__h24937 = rdat__h25005;
      8'h18: g_data__h24937 = rdat__h25028;
      8'h20: g_data__h24937 = rdat__h25128;
      8'h24: g_data__h24937 = rdat__h25142;
      8'h28: g_data__h24937 = rdat__h25150;
      8'h2C: g_data__h24937 = rdat__h25156;
      8'h30: g_data__h24937 = rdat__h25170;
      8'h34: g_data__h24937 = rdat__h25178;
      8'h38: g_data__h24937 = rdat__h25184;
      8'h3C: g_data__h24937 = rdat__h25190;
      8'h40: g_data__h24937 = rdat__h25196;
      8'h44: g_data__h24937 = rdat__h25202;
      8'h48: g_data__h24937 = rdat__h25212;
      default: g_data__h24937 = 32'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (wciS0_MReset_n == `BSV_RESET_VALUE)
      begin
        abortCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	doAbort <= `BSV_ASSIGNMENT_DELAY 1'd0;
	endOfMessage <= `BSV_ASSIGNMENT_DELAY 1'd0;
	errCount <= `BSV_ASSIGNMENT_DELAY 128'd0;
	fabRespCredit_value <= `BSV_ASSIGNMENT_DELAY 12'd0;
	fabWordsRemain <= `BSV_ASSIGNMENT_DELAY 14'd0;
	firstMsgReq <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lastMesg <= `BSV_ASSIGNMENT_DELAY 32'hFEFEFFFE;
	mesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	mesgLengthSoFar <= `BSV_ASSIGNMENT_DELAY 14'd0;
	mesgPreRequest <= `BSV_ASSIGNMENT_DELAY 1'd0;
	mesgReqOK <= `BSV_ASSIGNMENT_DELAY 1'd0;
	opcode <= `BSV_ASSIGNMENT_DELAY 9'd170;
	readyToPush <= `BSV_ASSIGNMENT_DELAY 1'd0;
	readyToRequest <= `BSV_ASSIGNMENT_DELAY 1'd0;
	respF_rCache <= `BSV_ASSIGNMENT_DELAY
	    182'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	respF_rRdPtr <= `BSV_ASSIGNMENT_DELAY 12'd0;
	respF_rWrPtr <= `BSV_ASSIGNMENT_DELAY 12'd0;
	smaCtrl <= `BSV_ASSIGNMENT_DELAY smaCtrlInit;
	thisMesg <= `BSV_ASSIGNMENT_DELAY 32'hFEFEFFFE;
	unrollCnt <= `BSV_ASSIGNMENT_DELAY 16'd0;
	valExpect <= `BSV_ASSIGNMENT_DELAY 128'd0;
	wci_wslv_cEdge <= `BSV_ASSIGNMENT_DELAY 3'h2;
	wci_wslv_cState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	wci_wslv_ctlAckReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_ctlOpActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_illegalEdge <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_nState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	wci_wslv_reqF_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wci_wslv_respF_cntr_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wci_wslv_respF_q_0 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	wci_wslv_respF_q_1 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	wci_wslv_sFlagReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wmi_busyWithMessage <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_dhF_cntr_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmi_dhF_q_0 <= `BSV_ASSIGNMENT_DELAY 146'd0;
	wmi_dhF_q_1 <= `BSV_ASSIGNMENT_DELAY 146'd0;
	wmi_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_mFlagF_cntr_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmi_mFlagF_q_0 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmi_mFlagF_q_1 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmi_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_reqF_cntr_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmi_reqF_q_0 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmi_reqF_q_1 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmi_sDataThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_sFlagReg <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmi_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmwtBeginCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmwtFinalCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmwtPushCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiM_burstKind <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsiM_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiM_iMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiM_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiM_pMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiM_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiM_reqFifo_cntr_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsiM_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY
	    169'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00;
	wsiM_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY
	    169'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00;
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
        if (abortCount_EN)
	  abortCount <= `BSV_ASSIGNMENT_DELAY abortCount_D_IN;
	if (doAbort_EN) doAbort <= `BSV_ASSIGNMENT_DELAY doAbort_D_IN;
	if (endOfMessage_EN)
	  endOfMessage <= `BSV_ASSIGNMENT_DELAY endOfMessage_D_IN;
	if (errCount_EN) errCount <= `BSV_ASSIGNMENT_DELAY errCount_D_IN;
	if (fabRespCredit_value_EN)
	  fabRespCredit_value <= `BSV_ASSIGNMENT_DELAY
	      fabRespCredit_value_D_IN;
	if (fabWordsRemain_EN)
	  fabWordsRemain <= `BSV_ASSIGNMENT_DELAY fabWordsRemain_D_IN;
	if (firstMsgReq_EN)
	  firstMsgReq <= `BSV_ASSIGNMENT_DELAY firstMsgReq_D_IN;
	if (lastMesg_EN) lastMesg <= `BSV_ASSIGNMENT_DELAY lastMesg_D_IN;
	if (mesgCount_EN) mesgCount <= `BSV_ASSIGNMENT_DELAY mesgCount_D_IN;
	if (mesgLengthSoFar_EN)
	  mesgLengthSoFar <= `BSV_ASSIGNMENT_DELAY mesgLengthSoFar_D_IN;
	if (mesgPreRequest_EN)
	  mesgPreRequest <= `BSV_ASSIGNMENT_DELAY mesgPreRequest_D_IN;
	if (mesgReqOK_EN) mesgReqOK <= `BSV_ASSIGNMENT_DELAY mesgReqOK_D_IN;
	if (opcode_EN) opcode <= `BSV_ASSIGNMENT_DELAY opcode_D_IN;
	if (readyToPush_EN)
	  readyToPush <= `BSV_ASSIGNMENT_DELAY readyToPush_D_IN;
	if (readyToRequest_EN)
	  readyToRequest <= `BSV_ASSIGNMENT_DELAY readyToRequest_D_IN;
	if (respF_rCache_EN)
	  respF_rCache <= `BSV_ASSIGNMENT_DELAY respF_rCache_D_IN;
	if (respF_rRdPtr_EN)
	  respF_rRdPtr <= `BSV_ASSIGNMENT_DELAY respF_rRdPtr_D_IN;
	if (respF_rWrPtr_EN)
	  respF_rWrPtr <= `BSV_ASSIGNMENT_DELAY respF_rWrPtr_D_IN;
	if (smaCtrl_EN) smaCtrl <= `BSV_ASSIGNMENT_DELAY smaCtrl_D_IN;
	if (thisMesg_EN) thisMesg <= `BSV_ASSIGNMENT_DELAY thisMesg_D_IN;
	if (unrollCnt_EN) unrollCnt <= `BSV_ASSIGNMENT_DELAY unrollCnt_D_IN;
	if (valExpect_EN) valExpect <= `BSV_ASSIGNMENT_DELAY valExpect_D_IN;
	if (wci_wslv_cEdge_EN)
	  wci_wslv_cEdge <= `BSV_ASSIGNMENT_DELAY wci_wslv_cEdge_D_IN;
	if (wci_wslv_cState_EN)
	  wci_wslv_cState <= `BSV_ASSIGNMENT_DELAY wci_wslv_cState_D_IN;
	if (wci_wslv_ctlAckReg_EN)
	  wci_wslv_ctlAckReg <= `BSV_ASSIGNMENT_DELAY wci_wslv_ctlAckReg_D_IN;
	if (wci_wslv_ctlOpActive_EN)
	  wci_wslv_ctlOpActive <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_ctlOpActive_D_IN;
	if (wci_wslv_illegalEdge_EN)
	  wci_wslv_illegalEdge <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_illegalEdge_D_IN;
	if (wci_wslv_nState_EN)
	  wci_wslv_nState <= `BSV_ASSIGNMENT_DELAY wci_wslv_nState_D_IN;
	if (wci_wslv_reqF_countReg_EN)
	  wci_wslv_reqF_countReg <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_reqF_countReg_D_IN;
	if (wci_wslv_respF_cntr_r_EN)
	  wci_wslv_respF_cntr_r <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_respF_cntr_r_D_IN;
	if (wci_wslv_respF_q_0_EN)
	  wci_wslv_respF_q_0 <= `BSV_ASSIGNMENT_DELAY wci_wslv_respF_q_0_D_IN;
	if (wci_wslv_respF_q_1_EN)
	  wci_wslv_respF_q_1 <= `BSV_ASSIGNMENT_DELAY wci_wslv_respF_q_1_D_IN;
	if (wci_wslv_sFlagReg_EN)
	  wci_wslv_sFlagReg <= `BSV_ASSIGNMENT_DELAY wci_wslv_sFlagReg_D_IN;
	if (wci_wslv_sThreadBusy_d_EN)
	  wci_wslv_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_sThreadBusy_d_D_IN;
	if (wmi_busyWithMessage_EN)
	  wmi_busyWithMessage <= `BSV_ASSIGNMENT_DELAY
	      wmi_busyWithMessage_D_IN;
	if (wmi_dhF_cntr_r_EN)
	  wmi_dhF_cntr_r <= `BSV_ASSIGNMENT_DELAY wmi_dhF_cntr_r_D_IN;
	if (wmi_dhF_q_0_EN)
	  wmi_dhF_q_0 <= `BSV_ASSIGNMENT_DELAY wmi_dhF_q_0_D_IN;
	if (wmi_dhF_q_1_EN)
	  wmi_dhF_q_1 <= `BSV_ASSIGNMENT_DELAY wmi_dhF_q_1_D_IN;
	if (wmi_errorSticky_EN)
	  wmi_errorSticky <= `BSV_ASSIGNMENT_DELAY wmi_errorSticky_D_IN;
	if (wmi_mFlagF_cntr_r_EN)
	  wmi_mFlagF_cntr_r <= `BSV_ASSIGNMENT_DELAY wmi_mFlagF_cntr_r_D_IN;
	if (wmi_mFlagF_q_0_EN)
	  wmi_mFlagF_q_0 <= `BSV_ASSIGNMENT_DELAY wmi_mFlagF_q_0_D_IN;
	if (wmi_mFlagF_q_1_EN)
	  wmi_mFlagF_q_1 <= `BSV_ASSIGNMENT_DELAY wmi_mFlagF_q_1_D_IN;
	if (wmi_operateD_EN)
	  wmi_operateD <= `BSV_ASSIGNMENT_DELAY wmi_operateD_D_IN;
	if (wmi_peerIsReady_EN)
	  wmi_peerIsReady <= `BSV_ASSIGNMENT_DELAY wmi_peerIsReady_D_IN;
	if (wmi_reqF_cntr_r_EN)
	  wmi_reqF_cntr_r <= `BSV_ASSIGNMENT_DELAY wmi_reqF_cntr_r_D_IN;
	if (wmi_reqF_q_0_EN)
	  wmi_reqF_q_0 <= `BSV_ASSIGNMENT_DELAY wmi_reqF_q_0_D_IN;
	if (wmi_reqF_q_1_EN)
	  wmi_reqF_q_1 <= `BSV_ASSIGNMENT_DELAY wmi_reqF_q_1_D_IN;
	if (wmi_sDataThreadBusy_d_EN)
	  wmi_sDataThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      wmi_sDataThreadBusy_d_D_IN;
	if (wmi_sFlagReg_EN)
	  wmi_sFlagReg <= `BSV_ASSIGNMENT_DELAY wmi_sFlagReg_D_IN;
	if (wmi_sThreadBusy_d_EN)
	  wmi_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY wmi_sThreadBusy_d_D_IN;
	if (wmi_trafficSticky_EN)
	  wmi_trafficSticky <= `BSV_ASSIGNMENT_DELAY wmi_trafficSticky_D_IN;
	if (wmwtBeginCount_EN)
	  wmwtBeginCount <= `BSV_ASSIGNMENT_DELAY wmwtBeginCount_D_IN;
	if (wmwtFinalCount_EN)
	  wmwtFinalCount <= `BSV_ASSIGNMENT_DELAY wmwtFinalCount_D_IN;
	if (wmwtPushCount_EN)
	  wmwtPushCount <= `BSV_ASSIGNMENT_DELAY wmwtPushCount_D_IN;
	if (wsiM_burstKind_EN)
	  wsiM_burstKind <= `BSV_ASSIGNMENT_DELAY wsiM_burstKind_D_IN;
	if (wsiM_errorSticky_EN)
	  wsiM_errorSticky <= `BSV_ASSIGNMENT_DELAY wsiM_errorSticky_D_IN;
	if (wsiM_iMesgCount_EN)
	  wsiM_iMesgCount <= `BSV_ASSIGNMENT_DELAY wsiM_iMesgCount_D_IN;
	if (wsiM_operateD_EN)
	  wsiM_operateD <= `BSV_ASSIGNMENT_DELAY wsiM_operateD_D_IN;
	if (wsiM_pMesgCount_EN)
	  wsiM_pMesgCount <= `BSV_ASSIGNMENT_DELAY wsiM_pMesgCount_D_IN;
	if (wsiM_peerIsReady_EN)
	  wsiM_peerIsReady <= `BSV_ASSIGNMENT_DELAY wsiM_peerIsReady_D_IN;
	if (wsiM_reqFifo_cntr_r_EN)
	  wsiM_reqFifo_cntr_r <= `BSV_ASSIGNMENT_DELAY
	      wsiM_reqFifo_cntr_r_D_IN;
	if (wsiM_reqFifo_q_0_EN)
	  wsiM_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY wsiM_reqFifo_q_0_D_IN;
	if (wsiM_reqFifo_q_1_EN)
	  wsiM_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY wsiM_reqFifo_q_1_D_IN;
	if (wsiM_sThreadBusy_d_EN)
	  wsiM_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY wsiM_sThreadBusy_d_D_IN;
	if (wsiM_tBusyCount_EN)
	  wsiM_tBusyCount <= `BSV_ASSIGNMENT_DELAY wsiM_tBusyCount_D_IN;
	if (wsiM_trafficSticky_EN)
	  wsiM_trafficSticky <= `BSV_ASSIGNMENT_DELAY wsiM_trafficSticky_D_IN;
	if (wsiS_burstKind_EN)
	  wsiS_burstKind <= `BSV_ASSIGNMENT_DELAY wsiS_burstKind_D_IN;
	if (wsiS_errorSticky_EN)
	  wsiS_errorSticky <= `BSV_ASSIGNMENT_DELAY wsiS_errorSticky_D_IN;
	if (wsiS_iMesgCount_EN)
	  wsiS_iMesgCount <= `BSV_ASSIGNMENT_DELAY wsiS_iMesgCount_D_IN;
	if (wsiS_operateD_EN)
	  wsiS_operateD <= `BSV_ASSIGNMENT_DELAY wsiS_operateD_D_IN;
	if (wsiS_pMesgCount_EN)
	  wsiS_pMesgCount <= `BSV_ASSIGNMENT_DELAY wsiS_pMesgCount_D_IN;
	if (wsiS_peerIsReady_EN)
	  wsiS_peerIsReady <= `BSV_ASSIGNMENT_DELAY wsiS_peerIsReady_D_IN;
	if (wsiS_reqFifo_countReg_EN)
	  wsiS_reqFifo_countReg <= `BSV_ASSIGNMENT_DELAY
	      wsiS_reqFifo_countReg_D_IN;
	if (wsiS_reqFifo_levelsValid_EN)
	  wsiS_reqFifo_levelsValid <= `BSV_ASSIGNMENT_DELAY
	      wsiS_reqFifo_levelsValid_D_IN;
	if (wsiS_tBusyCount_EN)
	  wsiS_tBusyCount <= `BSV_ASSIGNMENT_DELAY wsiS_tBusyCount_D_IN;
	if (wsiS_trafficSticky_EN)
	  wsiS_trafficSticky <= `BSV_ASSIGNMENT_DELAY wsiS_trafficSticky_D_IN;
	if (wsiS_wordCount_EN)
	  wsiS_wordCount <= `BSV_ASSIGNMENT_DELAY wsiS_wordCount_D_IN;
      end
    if (fabWordsCurReq_EN)
      fabWordsCurReq <= `BSV_ASSIGNMENT_DELAY fabWordsCurReq_D_IN;
    if (mesgReqAddr_EN) mesgReqAddr <= `BSV_ASSIGNMENT_DELAY mesgReqAddr_D_IN;
    if (wmi_statusR_EN) wmi_statusR <= `BSV_ASSIGNMENT_DELAY wmi_statusR_D_IN;
    if (wsiM_statusR_EN)
      wsiM_statusR <= `BSV_ASSIGNMENT_DELAY wsiM_statusR_D_IN;
    if (wsiS_mesgWordLength_EN)
      wsiS_mesgWordLength <= `BSV_ASSIGNMENT_DELAY wsiS_mesgWordLength_D_IN;
    if (wsiS_statusR_EN)
      wsiS_statusR <= `BSV_ASSIGNMENT_DELAY wsiS_statusR_D_IN;
  end
  always@(posedge wciS0_Clk or `BSV_RESET_EDGE wciS0_MReset_n)
  if (wciS0_MReset_n == `BSV_RESET_VALUE)
    begin
      wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wmi_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wsiM_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wsiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (wci_wslv_isReset_isInReset_EN)
	wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wci_wslv_isReset_isInReset_D_IN;
      if (wmi_isReset_isInReset_EN)
	wmi_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wmi_isReset_isInReset_D_IN;
      if (wsiM_isReset_isInReset_EN)
	wsiM_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wsiM_isReset_isInReset_D_IN;
      if (wsiS_isReset_isInReset_EN)
	wsiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wsiS_isReset_isInReset_D_IN;
    end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    abortCount = 32'hAAAAAAAA;
    doAbort = 1'h0;
    endOfMessage = 1'h0;
    errCount = 128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    fabRespCredit_value = 12'hAAA;
    fabWordsCurReq = 14'h2AAA;
    fabWordsRemain = 14'h2AAA;
    firstMsgReq = 1'h0;
    lastMesg = 32'hAAAAAAAA;
    mesgCount = 32'hAAAAAAAA;
    mesgLengthSoFar = 14'h2AAA;
    mesgPreRequest = 1'h0;
    mesgReqAddr = 14'h2AAA;
    mesgReqOK = 1'h0;
    opcode = 9'h0AA;
    readyToPush = 1'h0;
    readyToRequest = 1'h0;
    respF_rCache = 182'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    respF_rRdPtr = 12'hAAA;
    respF_rWrPtr = 12'hAAA;
    smaCtrl = 32'hAAAAAAAA;
    thisMesg = 32'hAAAAAAAA;
    unrollCnt = 16'hAAAA;
    valExpect = 128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wci_wslv_cEdge = 3'h2;
    wci_wslv_cState = 3'h2;
    wci_wslv_ctlAckReg = 1'h0;
    wci_wslv_ctlOpActive = 1'h0;
    wci_wslv_illegalEdge = 1'h0;
    wci_wslv_isReset_isInReset = 1'h0;
    wci_wslv_nState = 3'h2;
    wci_wslv_reqF_countReg = 2'h2;
    wci_wslv_respF_cntr_r = 2'h2;
    wci_wslv_respF_q_0 = 34'h2AAAAAAAA;
    wci_wslv_respF_q_1 = 34'h2AAAAAAAA;
    wci_wslv_sFlagReg = 1'h0;
    wci_wslv_sThreadBusy_d = 1'h0;
    wmi_busyWithMessage = 1'h0;
    wmi_dhF_cntr_r = 2'h2;
    wmi_dhF_q_0 = 146'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wmi_dhF_q_1 = 146'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wmi_errorSticky = 1'h0;
    wmi_isReset_isInReset = 1'h0;
    wmi_mFlagF_cntr_r = 2'h2;
    wmi_mFlagF_q_0 = 32'hAAAAAAAA;
    wmi_mFlagF_q_1 = 32'hAAAAAAAA;
    wmi_operateD = 1'h0;
    wmi_peerIsReady = 1'h0;
    wmi_reqF_cntr_r = 2'h2;
    wmi_reqF_q_0 = 32'hAAAAAAAA;
    wmi_reqF_q_1 = 32'hAAAAAAAA;
    wmi_sDataThreadBusy_d = 1'h0;
    wmi_sFlagReg = 32'hAAAAAAAA;
    wmi_sThreadBusy_d = 1'h0;
    wmi_statusR = 8'hAA;
    wmi_trafficSticky = 1'h0;
    wmwtBeginCount = 32'hAAAAAAAA;
    wmwtFinalCount = 32'hAAAAAAAA;
    wmwtPushCount = 32'hAAAAAAAA;
    wsiM_burstKind = 2'h2;
    wsiM_errorSticky = 1'h0;
    wsiM_iMesgCount = 32'hAAAAAAAA;
    wsiM_isReset_isInReset = 1'h0;
    wsiM_operateD = 1'h0;
    wsiM_pMesgCount = 32'hAAAAAAAA;
    wsiM_peerIsReady = 1'h0;
    wsiM_reqFifo_cntr_r = 2'h2;
    wsiM_reqFifo_q_0 = 169'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wsiM_reqFifo_q_1 = 169'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
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
	  v__h3597 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3597,
		 wci_wslv_reqF_D_OUT[36:34],
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (MUX_unrollCnt_write_1__SEL_1)
	begin
	  v__h18073 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (MUX_unrollCnt_write_1__SEL_1)
	$display("[%0d]: %m: wmrd_mesgBegin mesgCount:%0h mesgLength:%0h reqInfo:%0h",
		 v__h18073,
		 mesgCount,
		 wmi_sFlagReg[23:0],
		 wmi_sFlagReg[31:24]);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wmwt_mesgBegin && wsiS_reqFifo_D_OUT[164])
	begin
	  v__h22489 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wmwt_mesgBegin && wsiS_reqFifo_D_OUT[164])
	$display("[%0d]: %m: mesgBegin PRECISE mesgCount:%0x WSI burstLength:%0x reqInfo:%0x",
		 v__h22489,
		 mesgCount,
		 wsiS_reqFifo_D_OUT[163:152],
		 wsiS_reqFifo_D_OUT[7:0]);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wmwt_mesgBegin && !wsiS_reqFifo_D_OUT[164])
	begin
	  v__h22548 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wmwt_mesgBegin && !wsiS_reqFifo_D_OUT[164])
	$display("[%0d]: %m: wmwt_mesgBegin IMPRECISE mesgCount:%0x",
		 v__h22548,
		 mesgCount);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wmwt_doAbort)
	begin
	  v__h24386 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wmwt_doAbort)
	$display("[%0d]: %m: wmwt_doAbort", v__h24386);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wmwt_messageFinalize)
	begin
	  v__h24569 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wmwt_messageFinalize)
	$display("[%0d]: %m: wmwt_messageFinalize mesgCount:%0x WSI mesgLength:%0x",
		 v__h24569,
		 mesgCount,
		 thisMesg[15:0]);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	begin
	  v__h24765 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	$display("[%0d]: %m: SMAdapter WCI CONFIG WRITE Addr:%0x BE:%0x Data:%0x",
		 v__h24765,
		 wci_wslv_reqF_D_OUT[63:32],
		 wci_wslv_reqF_D_OUT[67:64],
		 wci_wslv_reqF_D_OUT[31:0]);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	begin
	  v__h25422 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	$display("[%0d]: %m: Starting SMAdapter smaCtrl:%0x",
		 v__h25422,
		 smaCtrl);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/SMAdapter.bsv\", line 300, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/SMAdapter.bsv\", line 300, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/SMAdapter.bsv\", line 300, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/wrk/SMAdapter.bsv\", line 300, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and [RL_wci_cfrd] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/SMAdapter.bsv\", line 300, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/SMAdapter.bsv\", line 300, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/SMAdapter.bsv\", line 300, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/SMAdapter.bsv\", line 300, column 60: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/SMAdapter.bsv\", line 300, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/SMAdapter.bsv\", line 300, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	begin
	  v__h3916 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h3916,
		 wci_wslv_cEdge,
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	begin
	  v__h3772 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h3772,
		 wci_wslv_cEdge,
		 wci_wslv_cState,
		 wci_wslv_nState);
  end
  // synopsys translate_on
endmodule