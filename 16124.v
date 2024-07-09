module outputs
  wire [63 : 0] wsiM0_MData, wsiM1_MData;
  wire [31 : 0] wciS0_SData;
  wire [11 : 0] wsiM0_MBurstLength, wsiM1_MBurstLength;
  wire [7 : 0] wsiM0_MByteEn, wsiM0_MReqInfo, wsiM1_MByteEn, wsiM1_MReqInfo;
  wire [2 : 0] wsiM0_MCmd, wsiM1_MCmd;
  wire [1 : 0] wciS0_SFlag, wciS0_SResp;
  wire wciS0_SThreadBusy,
       wsiM0_MBurstPrecise,
       wsiM0_MReqLast,
       wsiM0_MReset_n,
       wsiM1_MBurstPrecise,
       wsiM1_MReqLast,
       wsiM1_MReset_n,
       wsiS0_SReset_n,
       wsiS0_SThreadBusy,
       wsiS1_SReset_n,
       wsiS1_SThreadBusy;
  // inlined wires
  wire [96 : 0] wsi_M0_reqFifo_x_wire$wget,
		wsi_M1_reqFifo_x_wire$wget,
		wsi_S0_wsiReq$wget,
		wsi_S1_wsiReq$wget;
  wire [95 : 0] wsi_M0_extStatusW$wget,
		wsi_M1_extStatusW$wget,
		wsi_S0_extStatusW$wget,
		wsi_S1_extStatusW$wget;
  wire [71 : 0] wci_wciReq$wget;
  wire [63 : 0] wsi_Es0_mData_w$wget, wsi_Es1_mData_w$wget;
  wire [33 : 0] wci_respF_x_wire$wget;
  wire [31 : 0] wci_Es_mAddr_w$wget, wci_Es_mData_w$wget;
  wire [11 : 0] wsi_Es0_mBurstLength_w$wget, wsi_Es1_mBurstLength_w$wget;
  wire [7 : 0] wsi_Es0_mByteEn_w$wget,
	       wsi_Es0_mReqInfo_w$wget,
	       wsi_Es1_mByteEn_w$wget,
	       wsi_Es1_mReqInfo_w$wget;
  wire [3 : 0] wci_Es_mByteEn_w$wget;
  wire [2 : 0] wci_Es_mCmd_w$wget,
	       wci_wEdge$wget,
	       wsi_Es0_mCmd_w$wget,
	       wsi_Es1_mCmd_w$wget;
  wire wci_Es_mAddrSpace_w$wget,
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
       wsi_Es0_mBurstLength_w$whas,
       wsi_Es0_mBurstPrecise_w$whas,
       wsi_Es0_mByteEn_w$whas,
       wsi_Es0_mCmd_w$whas,
       wsi_Es0_mDataInfo_w$whas,
       wsi_Es0_mData_w$whas,
       wsi_Es0_mReqInfo_w$whas,
       wsi_Es0_mReqLast_w$whas,
       wsi_Es1_mBurstLength_w$whas,
       wsi_Es1_mBurstPrecise_w$whas,
       wsi_Es1_mByteEn_w$whas,
       wsi_Es1_mCmd_w$whas,
       wsi_Es1_mDataInfo_w$whas,
       wsi_Es1_mData_w$whas,
       wsi_Es1_mReqInfo_w$whas,
       wsi_Es1_mReqLast_w$whas,
       wsi_M0_operateD_1$wget,
       wsi_M0_operateD_1$whas,
       wsi_M0_peerIsReady_1$wget,
       wsi_M0_peerIsReady_1$whas,
       wsi_M0_reqFifo_dequeueing$whas,
       wsi_M0_reqFifo_enqueueing$whas,
       wsi_M0_reqFifo_x_wire$whas,
       wsi_M0_sThreadBusy_pw$whas,
       wsi_M1_operateD_1$wget,
       wsi_M1_operateD_1$whas,
       wsi_M1_peerIsReady_1$wget,
       wsi_M1_peerIsReady_1$whas,
       wsi_M1_reqFifo_dequeueing$whas,
       wsi_M1_reqFifo_enqueueing$whas,
       wsi_M1_reqFifo_x_wire$whas,
       wsi_M1_sThreadBusy_pw$whas,
       wsi_S0_operateD_1$wget,
       wsi_S0_operateD_1$whas,
       wsi_S0_peerIsReady_1$wget,
       wsi_S0_peerIsReady_1$whas,
       wsi_S0_reqFifo_doResetClr$whas,
       wsi_S0_reqFifo_doResetDeq$whas,
       wsi_S0_reqFifo_doResetEnq$whas,
       wsi_S0_reqFifo_r_clr$whas,
       wsi_S0_reqFifo_r_deq$whas,
       wsi_S0_reqFifo_r_enq$whas,
       wsi_S0_sThreadBusy_dw$wget,
       wsi_S0_sThreadBusy_dw$whas,
       wsi_S0_wsiReq$whas,
       wsi_S1_operateD_1$wget,
       wsi_S1_operateD_1$whas,
       wsi_S1_peerIsReady_1$wget,
       wsi_S1_peerIsReady_1$whas,
       wsi_S1_reqFifo_doResetClr$whas,
       wsi_S1_reqFifo_doResetDeq$whas,
       wsi_S1_reqFifo_doResetEnq$whas,
       wsi_S1_reqFifo_r_clr$whas,
       wsi_S1_reqFifo_r_deq$whas,
       wsi_S1_reqFifo_r_enq$whas,
       wsi_S1_sThreadBusy_dw$wget,
       wsi_S1_sThreadBusy_dw$whas,
       wsi_S1_wsiReq$whas;
  // register splitCtrl
  reg [31 : 0] splitCtrl;
  wire [31 : 0] splitCtrl$D_IN;
  wire splitCtrl$EN;
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
  // register wci_isReset_isInReset
  reg wci_isReset_isInReset;
  wire wci_isReset_isInReset$D_IN, wci_isReset_isInReset$EN;
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
  // register wsi_M0_burstKind
  reg [1 : 0] wsi_M0_burstKind;
  wire [1 : 0] wsi_M0_burstKind$D_IN;
  wire wsi_M0_burstKind$EN;
  // register wsi_M0_errorSticky
  reg wsi_M0_errorSticky;
  wire wsi_M0_errorSticky$D_IN, wsi_M0_errorSticky$EN;
  // register wsi_M0_iMesgCount
  reg [31 : 0] wsi_M0_iMesgCount;
  wire [31 : 0] wsi_M0_iMesgCount$D_IN;
  wire wsi_M0_iMesgCount$EN;
  // register wsi_M0_isReset_isInReset
  reg wsi_M0_isReset_isInReset;
  wire wsi_M0_isReset_isInReset$D_IN, wsi_M0_isReset_isInReset$EN;
  // register wsi_M0_operateD
  reg wsi_M0_operateD;
  wire wsi_M0_operateD$D_IN, wsi_M0_operateD$EN;
  // register wsi_M0_pMesgCount
  reg [31 : 0] wsi_M0_pMesgCount;
  wire [31 : 0] wsi_M0_pMesgCount$D_IN;
  wire wsi_M0_pMesgCount$EN;
  // register wsi_M0_peerIsReady
  reg wsi_M0_peerIsReady;
  wire wsi_M0_peerIsReady$D_IN, wsi_M0_peerIsReady$EN;
  // register wsi_M0_reqFifo_c_r
  reg [1 : 0] wsi_M0_reqFifo_c_r;
  wire [1 : 0] wsi_M0_reqFifo_c_r$D_IN;
  wire wsi_M0_reqFifo_c_r$EN;
  // register wsi_M0_reqFifo_q_0
  reg [96 : 0] wsi_M0_reqFifo_q_0;
  reg [96 : 0] wsi_M0_reqFifo_q_0$D_IN;
  wire wsi_M0_reqFifo_q_0$EN;
  // register wsi_M0_reqFifo_q_1
  reg [96 : 0] wsi_M0_reqFifo_q_1;
  reg [96 : 0] wsi_M0_reqFifo_q_1$D_IN;
  wire wsi_M0_reqFifo_q_1$EN;
  // register wsi_M0_sThreadBusy_d
  reg wsi_M0_sThreadBusy_d;
  wire wsi_M0_sThreadBusy_d$D_IN, wsi_M0_sThreadBusy_d$EN;
  // register wsi_M0_statusR
  reg [7 : 0] wsi_M0_statusR;
  wire [7 : 0] wsi_M0_statusR$D_IN;
  wire wsi_M0_statusR$EN;
  // register wsi_M0_tBusyCount
  reg [31 : 0] wsi_M0_tBusyCount;
  wire [31 : 0] wsi_M0_tBusyCount$D_IN;
  wire wsi_M0_tBusyCount$EN;
  // register wsi_M0_trafficSticky
  reg wsi_M0_trafficSticky;
  wire wsi_M0_trafficSticky$D_IN, wsi_M0_trafficSticky$EN;
  // register wsi_M1_burstKind
  reg [1 : 0] wsi_M1_burstKind;
  wire [1 : 0] wsi_M1_burstKind$D_IN;
  wire wsi_M1_burstKind$EN;
  // register wsi_M1_errorSticky
  reg wsi_M1_errorSticky;
  wire wsi_M1_errorSticky$D_IN, wsi_M1_errorSticky$EN;
  // register wsi_M1_iMesgCount
  reg [31 : 0] wsi_M1_iMesgCount;
  wire [31 : 0] wsi_M1_iMesgCount$D_IN;
  wire wsi_M1_iMesgCount$EN;
  // register wsi_M1_isReset_isInReset
  reg wsi_M1_isReset_isInReset;
  wire wsi_M1_isReset_isInReset$D_IN, wsi_M1_isReset_isInReset$EN;
  // register wsi_M1_operateD
  reg wsi_M1_operateD;
  wire wsi_M1_operateD$D_IN, wsi_M1_operateD$EN;
  // register wsi_M1_pMesgCount
  reg [31 : 0] wsi_M1_pMesgCount;
  wire [31 : 0] wsi_M1_pMesgCount$D_IN;
  wire wsi_M1_pMesgCount$EN;
  // register wsi_M1_peerIsReady
  reg wsi_M1_peerIsReady;
  wire wsi_M1_peerIsReady$D_IN, wsi_M1_peerIsReady$EN;
  // register wsi_M1_reqFifo_c_r
  reg [1 : 0] wsi_M1_reqFifo_c_r;
  wire [1 : 0] wsi_M1_reqFifo_c_r$D_IN;
  wire wsi_M1_reqFifo_c_r$EN;
  // register wsi_M1_reqFifo_q_0
  reg [96 : 0] wsi_M1_reqFifo_q_0;
  reg [96 : 0] wsi_M1_reqFifo_q_0$D_IN;
  wire wsi_M1_reqFifo_q_0$EN;
  // register wsi_M1_reqFifo_q_1
  reg [96 : 0] wsi_M1_reqFifo_q_1;
  reg [96 : 0] wsi_M1_reqFifo_q_1$D_IN;
  wire wsi_M1_reqFifo_q_1$EN;
  // register wsi_M1_sThreadBusy_d
  reg wsi_M1_sThreadBusy_d;
  wire wsi_M1_sThreadBusy_d$D_IN, wsi_M1_sThreadBusy_d$EN;
  // register wsi_M1_statusR
  reg [7 : 0] wsi_M1_statusR;
  wire [7 : 0] wsi_M1_statusR$D_IN;
  wire wsi_M1_statusR$EN;
  // register wsi_M1_tBusyCount
  reg [31 : 0] wsi_M1_tBusyCount;
  wire [31 : 0] wsi_M1_tBusyCount$D_IN;
  wire wsi_M1_tBusyCount$EN;
  // register wsi_M1_trafficSticky
  reg wsi_M1_trafficSticky;
  wire wsi_M1_trafficSticky$D_IN, wsi_M1_trafficSticky$EN;
  // register wsi_S0_burstKind
  reg [1 : 0] wsi_S0_burstKind;
  wire [1 : 0] wsi_S0_burstKind$D_IN;
  wire wsi_S0_burstKind$EN;
  // register wsi_S0_errorSticky
  reg wsi_S0_errorSticky;
  wire wsi_S0_errorSticky$D_IN, wsi_S0_errorSticky$EN;
  // register wsi_S0_iMesgCount
  reg [31 : 0] wsi_S0_iMesgCount;
  wire [31 : 0] wsi_S0_iMesgCount$D_IN;
  wire wsi_S0_iMesgCount$EN;
  // register wsi_S0_isReset_isInReset
  reg wsi_S0_isReset_isInReset;
  wire wsi_S0_isReset_isInReset$D_IN, wsi_S0_isReset_isInReset$EN;
  // register wsi_S0_mesgWordLength
  reg [11 : 0] wsi_S0_mesgWordLength;
  wire [11 : 0] wsi_S0_mesgWordLength$D_IN;
  wire wsi_S0_mesgWordLength$EN;
  // register wsi_S0_operateD
  reg wsi_S0_operateD;
  wire wsi_S0_operateD$D_IN, wsi_S0_operateD$EN;
  // register wsi_S0_pMesgCount
  reg [31 : 0] wsi_S0_pMesgCount;
  wire [31 : 0] wsi_S0_pMesgCount$D_IN;
  wire wsi_S0_pMesgCount$EN;
  // register wsi_S0_peerIsReady
  reg wsi_S0_peerIsReady;
  wire wsi_S0_peerIsReady$D_IN, wsi_S0_peerIsReady$EN;
  // register wsi_S0_reqFifo_countReg
  reg [1 : 0] wsi_S0_reqFifo_countReg;
  wire [1 : 0] wsi_S0_reqFifo_countReg$D_IN;
  wire wsi_S0_reqFifo_countReg$EN;
  // register wsi_S0_reqFifo_levelsValid
  reg wsi_S0_reqFifo_levelsValid;
  wire wsi_S0_reqFifo_levelsValid$D_IN, wsi_S0_reqFifo_levelsValid$EN;
  // register wsi_S0_statusR
  reg [7 : 0] wsi_S0_statusR;
  wire [7 : 0] wsi_S0_statusR$D_IN;
  wire wsi_S0_statusR$EN;
  // register wsi_S0_tBusyCount
  reg [31 : 0] wsi_S0_tBusyCount;
  wire [31 : 0] wsi_S0_tBusyCount$D_IN;
  wire wsi_S0_tBusyCount$EN;
  // register wsi_S0_trafficSticky
  reg wsi_S0_trafficSticky;
  wire wsi_S0_trafficSticky$D_IN, wsi_S0_trafficSticky$EN;
  // register wsi_S0_wordCount
  reg [11 : 0] wsi_S0_wordCount;
  wire [11 : 0] wsi_S0_wordCount$D_IN;
  wire wsi_S0_wordCount$EN;
  // register wsi_S1_burstKind
  reg [1 : 0] wsi_S1_burstKind;
  wire [1 : 0] wsi_S1_burstKind$D_IN;
  wire wsi_S1_burstKind$EN;
  // register wsi_S1_errorSticky
  reg wsi_S1_errorSticky;
  wire wsi_S1_errorSticky$D_IN, wsi_S1_errorSticky$EN;
  // register wsi_S1_iMesgCount
  reg [31 : 0] wsi_S1_iMesgCount;
  wire [31 : 0] wsi_S1_iMesgCount$D_IN;
  wire wsi_S1_iMesgCount$EN;
  // register wsi_S1_isReset_isInReset
  reg wsi_S1_isReset_isInReset;
  wire wsi_S1_isReset_isInReset$D_IN, wsi_S1_isReset_isInReset$EN;
  // register wsi_S1_mesgWordLength
  reg [11 : 0] wsi_S1_mesgWordLength;
  wire [11 : 0] wsi_S1_mesgWordLength$D_IN;
  wire wsi_S1_mesgWordLength$EN;
  // register wsi_S1_operateD
  reg wsi_S1_operateD;
  wire wsi_S1_operateD$D_IN, wsi_S1_operateD$EN;
  // register wsi_S1_pMesgCount
  reg [31 : 0] wsi_S1_pMesgCount;
  wire [31 : 0] wsi_S1_pMesgCount$D_IN;
  wire wsi_S1_pMesgCount$EN;
  // register wsi_S1_peerIsReady
  reg wsi_S1_peerIsReady;
  wire wsi_S1_peerIsReady$D_IN, wsi_S1_peerIsReady$EN;
  // register wsi_S1_reqFifo_countReg
  reg [1 : 0] wsi_S1_reqFifo_countReg;
  wire [1 : 0] wsi_S1_reqFifo_countReg$D_IN;
  wire wsi_S1_reqFifo_countReg$EN;
  // register wsi_S1_reqFifo_levelsValid
  reg wsi_S1_reqFifo_levelsValid;
  wire wsi_S1_reqFifo_levelsValid$D_IN, wsi_S1_reqFifo_levelsValid$EN;
  // register wsi_S1_statusR
  reg [7 : 0] wsi_S1_statusR;
  wire [7 : 0] wsi_S1_statusR$D_IN;
  wire wsi_S1_statusR$EN;
  // register wsi_S1_tBusyCount
  reg [31 : 0] wsi_S1_tBusyCount;
  wire [31 : 0] wsi_S1_tBusyCount$D_IN;
  wire wsi_S1_tBusyCount$EN;
  // register wsi_S1_trafficSticky
  reg wsi_S1_trafficSticky;
  wire wsi_S1_trafficSticky$D_IN, wsi_S1_trafficSticky$EN;
  // register wsi_S1_wordCount
  reg [11 : 0] wsi_S1_wordCount;
  wire [11 : 0] wsi_S1_wordCount$D_IN;
  wire wsi_S1_wordCount$EN;
  // ports of submodule wci_reqF
  wire [71 : 0] wci_reqF$D_IN, wci_reqF$D_OUT;
  wire wci_reqF$CLR, wci_reqF$DEQ, wci_reqF$EMPTY_N, wci_reqF$ENQ;
  // ports of submodule wsi_S0_reqFifo
  wire [96 : 0] wsi_S0_reqFifo$D_IN, wsi_S0_reqFifo$D_OUT;
  wire wsi_S0_reqFifo$CLR,
       wsi_S0_reqFifo$DEQ,
       wsi_S0_reqFifo$EMPTY_N,
       wsi_S0_reqFifo$ENQ,
       wsi_S0_reqFifo$FULL_N;
  // ports of submodule wsi_S1_reqFifo
  wire [96 : 0] wsi_S1_reqFifo$D_IN, wsi_S1_reqFifo$D_OUT;
  wire wsi_S1_reqFifo$CLR,
       wsi_S1_reqFifo$DEQ,
       wsi_S1_reqFifo$EMPTY_N,
       wsi_S1_reqFifo$ENQ,
       wsi_S1_reqFifo$FULL_N;
  // rule scheduling signals
  wire CAN_FIRE_RL_doMessageConsume_S1,
       WILL_FIRE_RL_doMessageConsume_S0,
       WILL_FIRE_RL_doMessageConsume_S1,
       WILL_FIRE_RL_wci_cfrd,
       WILL_FIRE_RL_wci_cfwr,
       WILL_FIRE_RL_wci_ctl_op_complete,
       WILL_FIRE_RL_wci_ctl_op_start,
       WILL_FIRE_RL_wci_ctrl_EiI,
       WILL_FIRE_RL_wci_ctrl_IsO,
       WILL_FIRE_RL_wci_ctrl_OrE,
       WILL_FIRE_RL_wci_respF_both,
       WILL_FIRE_RL_wci_respF_decCtr,
       WILL_FIRE_RL_wci_respF_incCtr,
       WILL_FIRE_RL_wsi_M0_reqFifo_both,
       WILL_FIRE_RL_wsi_M0_reqFifo_decCtr,
       WILL_FIRE_RL_wsi_M0_reqFifo_deq,
       WILL_FIRE_RL_wsi_M0_reqFifo_incCtr,
       WILL_FIRE_RL_wsi_M1_reqFifo_both,
       WILL_FIRE_RL_wsi_M1_reqFifo_decCtr,
       WILL_FIRE_RL_wsi_M1_reqFifo_deq,
       WILL_FIRE_RL_wsi_M1_reqFifo_incCtr,
       WILL_FIRE_RL_wsi_S0_reqFifo_enq,
       WILL_FIRE_RL_wsi_S0_reqFifo_reset,
       WILL_FIRE_RL_wsi_S1_reqFifo_enq,
       WILL_FIRE_RL_wsi_S1_reqFifo_reset;
  // inputs to muxes for submodule ports
  reg [33 : 0] MUX_wci_respF_q_0$write_1__VAL_2;
  wire [96 : 0] MUX_wsi_M0_reqFifo_q_0$write_1__VAL_1,
		MUX_wsi_M0_reqFifo_q_0$write_1__VAL_2,
		MUX_wsi_M0_reqFifo_q_1$write_1__VAL_1,
		MUX_wsi_M1_reqFifo_q_0$write_1__VAL_1,
		MUX_wsi_M1_reqFifo_q_0$write_1__VAL_2,
		MUX_wsi_M1_reqFifo_q_1$write_1__VAL_1;
  wire [33 : 0] MUX_wci_respF_q_0$write_1__VAL_1,
		MUX_wci_respF_q_1$write_1__VAL_1,
		MUX_wci_respF_x_wire$wset_1__VAL_1,
		MUX_wci_respF_x_wire$wset_1__VAL_2;
  wire [1 : 0] MUX_wci_respF_c_r$write_1__VAL_1,
	       MUX_wci_respF_c_r$write_1__VAL_2,
	       MUX_wsi_M0_reqFifo_c_r$write_1__VAL_1,
	       MUX_wsi_M0_reqFifo_c_r$write_1__VAL_2,
	       MUX_wsi_M1_reqFifo_c_r$write_1__VAL_1,
	       MUX_wsi_M1_reqFifo_c_r$write_1__VAL_2;
  wire MUX_wci_illegalEdge$write_1__SEL_1,
       MUX_wci_illegalEdge$write_1__VAL_1,
       MUX_wci_respF_q_0$write_1__SEL_2,
       MUX_wci_respF_q_1$write_1__SEL_2,
       MUX_wsi_M0_reqFifo_q_0$write_1__SEL_2,
       MUX_wsi_M0_reqFifo_q_1$write_1__SEL_2,
       MUX_wsi_M0_reqFifo_x_wire$wset_1__SEL_1,
       MUX_wsi_M1_reqFifo_q_0$write_1__SEL_2,
       MUX_wsi_M1_reqFifo_q_1$write_1__SEL_2,
       MUX_wsi_M1_reqFifo_x_wire$wset_1__SEL_1;
  // remaining internal signals
  reg [63 : 0] v__h16289, v__h16444, v__h3698, v__h3873, v__h4017;
  reg [31 : 0] _theResult____h16428;
  wire [31 : 0] rdat__h16512,
		rdat__h16701,
		rdat__h16715,
		rdat__h16723,
		rdat__h16737,
		rdat__h16745,
		rdat__h16759,
		rdat__h16767,
		rdat__h16781;
  // value method wciS0_sResp
  assign wciS0_SResp = wci_respF_q_0[33:32] ;
  // value method wciS0_sData
  assign wciS0_SData = wci_respF_q_0[31:0] ;
  // value method wciS0_sThreadBusy
  assign wciS0_SThreadBusy =
	     wci_reqF_countReg > 2'd1 || wci_isReset_isInReset ;
  // value method wciS0_sFlag
  assign wciS0_SFlag = { 1'd1, wci_sFlagReg } ;
  // value method wsiS0_sThreadBusy
  assign wsiS0_SThreadBusy =
	     !wsi_S0_sThreadBusy_dw$whas || wsi_S0_sThreadBusy_dw$wget ;
  // value method wsiS0_sReset_n
  assign wsiS0_SReset_n = !wsi_S0_isReset_isInReset && wsi_S0_operateD ;
  // value method wsiS1_sThreadBusy
  assign wsiS1_SThreadBusy =
	     !wsi_S1_sThreadBusy_dw$whas || wsi_S1_sThreadBusy_dw$wget ;
  // value method wsiS1_sReset_n
  assign wsiS1_SReset_n = !wsi_S1_isReset_isInReset && wsi_S1_operateD ;
  // value method wsiM0_mCmd
  assign wsiM0_MCmd =
	     wsi_M0_sThreadBusy_d ? 3'd0 : wsi_M0_reqFifo_q_0[96:94] ;
  // value method wsiM0_mReqLast
  assign wsiM0_MReqLast = !wsi_M0_sThreadBusy_d && wsi_M0_reqFifo_q_0[93] ;
  // value method wsiM0_mBurstPrecise
  assign wsiM0_MBurstPrecise =
	     !wsi_M0_sThreadBusy_d && wsi_M0_reqFifo_q_0[92] ;
  // value method wsiM0_mBurstLength
  assign wsiM0_MBurstLength =
	     wsi_M0_sThreadBusy_d ? 12'd0 : wsi_M0_reqFifo_q_0[91:80] ;
  // value method wsiM0_mData
  assign wsiM0_MData = wsi_M0_reqFifo_q_0[79:16] ;
  // value method wsiM0_mByteEn
  assign wsiM0_MByteEn = wsi_M0_reqFifo_q_0[15:8] ;
  // value method wsiM0_mReqInfo
  assign wsiM0_MReqInfo =
	     wsi_M0_sThreadBusy_d ? 8'd0 : wsi_M0_reqFifo_q_0[7:0] ;
  // value method wsiM0_mReset_n
  assign wsiM0_MReset_n = !wsi_M0_isReset_isInReset && wsi_M0_operateD ;
  // value method wsiM1_mCmd
  assign wsiM1_MCmd =
	     wsi_M1_sThreadBusy_d ? 3'd0 : wsi_M1_reqFifo_q_0[96:94] ;
  // value method wsiM1_mReqLast
  assign wsiM1_MReqLast = !wsi_M1_sThreadBusy_d && wsi_M1_reqFifo_q_0[93] ;
  // value method wsiM1_mBurstPrecise
  assign wsiM1_MBurstPrecise =
	     !wsi_M1_sThreadBusy_d && wsi_M1_reqFifo_q_0[92] ;
  // value method wsiM1_mBurstLength
  assign wsiM1_MBurstLength =
	     wsi_M1_sThreadBusy_d ? 12'd0 : wsi_M1_reqFifo_q_0[91:80] ;
  // value method wsiM1_mData
  assign wsiM1_MData = wsi_M1_reqFifo_q_0[79:16] ;
  // value method wsiM1_mByteEn
  assign wsiM1_MByteEn = wsi_M1_reqFifo_q_0[15:8] ;
  // value method wsiM1_mReqInfo
  assign wsiM1_MReqInfo =
	     wsi_M1_sThreadBusy_d ? 8'd0 : wsi_M1_reqFifo_q_0[7:0] ;
  // value method wsiM1_mReset_n
  assign wsiM1_MReset_n = !wsi_M1_isReset_isInReset && wsi_M1_operateD ;
  // submodule wci_reqF
  SizedFIFO #(.p1width(32'd72),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wci_reqF(.RST(wciS0_MReset_n),
					.CLK(wciS0_Clk),
					.D_IN(wci_reqF$D_IN),
					.ENQ(wci_reqF$ENQ),
					.DEQ(wci_reqF$DEQ),
					.CLR(wci_reqF$CLR),
					.D_OUT(wci_reqF$D_OUT),
					.FULL_N(),
					.EMPTY_N(wci_reqF$EMPTY_N));
  // submodule wsi_S0_reqFifo
  SizedFIFO #(.p1width(32'd97),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wsi_S0_reqFifo(.RST(wciS0_MReset_n),
					      .CLK(wciS0_Clk),
					      .D_IN(wsi_S0_reqFifo$D_IN),
					      .ENQ(wsi_S0_reqFifo$ENQ),
					      .DEQ(wsi_S0_reqFifo$DEQ),
					      .CLR(wsi_S0_reqFifo$CLR),
					      .D_OUT(wsi_S0_reqFifo$D_OUT),
					      .FULL_N(wsi_S0_reqFifo$FULL_N),
					      .EMPTY_N(wsi_S0_reqFifo$EMPTY_N));
  // submodule wsi_S1_reqFifo
  SizedFIFO #(.p1width(32'd97),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wsi_S1_reqFifo(.RST(wciS0_MReset_n),
					      .CLK(wciS0_Clk),
					      .D_IN(wsi_S1_reqFifo$D_IN),
					      .ENQ(wsi_S1_reqFifo$ENQ),
					      .DEQ(wsi_S1_reqFifo$DEQ),
					      .CLR(wsi_S1_reqFifo$CLR),
					      .D_OUT(wsi_S1_reqFifo$D_OUT),
					      .FULL_N(wsi_S1_reqFifo$FULL_N),
					      .EMPTY_N(wsi_S1_reqFifo$EMPTY_N));
  // rule RL_wci_ctl_op_start
  assign WILL_FIRE_RL_wci_ctl_op_start =
	     wci_reqF$EMPTY_N && wci_wci_ctrl_pw$whas &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_ctrl_EiI
  assign WILL_FIRE_RL_wci_ctrl_EiI =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd0 &&
	     wci_reqF$D_OUT[36:34] == 3'd0 ;
  // rule RL_wci_ctrl_IsO
  assign WILL_FIRE_RL_wci_ctrl_IsO =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd1 &&
	     wci_reqF$D_OUT[36:34] == 3'd1 ;
  // rule RL_wci_ctrl_OrE
  assign WILL_FIRE_RL_wci_ctrl_OrE =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd2 &&
	     wci_reqF$D_OUT[36:34] == 3'd3 ;
  // rule RL_doMessageConsume_S0
  assign WILL_FIRE_RL_doMessageConsume_S0 =
	     wsi_S0_reqFifo$EMPTY_N &&
	     (splitCtrl[0] || splitCtrl[7] || wsi_M0_reqFifo_c_r != 2'd2) &&
	     (splitCtrl[8] || splitCtrl[15] || wsi_M1_reqFifo_c_r != 2'd2) &&
	     wci_cState == 3'd2 ;
  // rule RL_doMessageConsume_S1
  assign CAN_FIRE_RL_doMessageConsume_S1 =
	     wsi_S1_reqFifo$EMPTY_N &&
	     (!splitCtrl[0] || splitCtrl[7] || wsi_M0_reqFifo_c_r != 2'd2) &&
	     (!splitCtrl[8] || splitCtrl[15] || wsi_M1_reqFifo_c_r != 2'd2) &&
	     wci_cState == 3'd2 ;
  assign WILL_FIRE_RL_doMessageConsume_S1 =
	     CAN_FIRE_RL_doMessageConsume_S1 &&
	     !WILL_FIRE_RL_doMessageConsume_S0 ;
  // rule RL_wci_cfwr
  assign WILL_FIRE_RL_wci_cfwr =
	     wci_respF_c_r != 2'd2 && wci_reqF$EMPTY_N &&
	     wci_wci_cfwr_pw$whas &&
	     !WILL_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_ctl_op_complete
  assign WILL_FIRE_RL_wci_ctl_op_complete =
	     wci_respF_c_r != 2'd2 && wci_ctlOpActive && wci_ctlAckReg ;
  // rule RL_wsi_M0_reqFifo_deq
  assign WILL_FIRE_RL_wsi_M0_reqFifo_deq =
	     wsi_M0_reqFifo_c_r != 2'd0 && !wsi_M0_sThreadBusy_d ;
  // rule RL_wsi_M0_reqFifo_incCtr
  assign WILL_FIRE_RL_wsi_M0_reqFifo_incCtr =
	     ((wsi_M0_reqFifo_c_r == 2'd0) ?
		wsi_M0_reqFifo_enqueueing$whas :
		wsi_M0_reqFifo_c_r != 2'd1 ||
		wsi_M0_reqFifo_enqueueing$whas) &&
	     wsi_M0_reqFifo_enqueueing$whas &&
	     !WILL_FIRE_RL_wsi_M0_reqFifo_deq ;
  // rule RL_wsi_M0_reqFifo_decCtr
  assign WILL_FIRE_RL_wsi_M0_reqFifo_decCtr =
	     WILL_FIRE_RL_wsi_M0_reqFifo_deq &&
	     !wsi_M0_reqFifo_enqueueing$whas ;
  // rule RL_wsi_M0_reqFifo_both
  assign WILL_FIRE_RL_wsi_M0_reqFifo_both =
	     ((wsi_M0_reqFifo_c_r == 2'd1) ?
		wsi_M0_reqFifo_enqueueing$whas :
		wsi_M0_reqFifo_c_r != 2'd2 ||
		wsi_M0_reqFifo_enqueueing$whas) &&
	     WILL_FIRE_RL_wsi_M0_reqFifo_deq &&
	     wsi_M0_reqFifo_enqueueing$whas ;
  // rule RL_wci_cfrd
  assign WILL_FIRE_RL_wci_cfrd =
	     wci_respF_c_r != 2'd2 && wci_reqF$EMPTY_N &&
	     wci_wci_cfrd_pw$whas &&
	     !WILL_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_respF_incCtr
  assign WILL_FIRE_RL_wci_respF_incCtr =
	     ((wci_respF_c_r == 2'd0) ?
		wci_respF_enqueueing$whas :
		wci_respF_c_r != 2'd1 || wci_respF_enqueueing$whas) &&
	     wci_respF_enqueueing$whas &&
	     !(wci_respF_c_r != 2'd0) ;
  // rule RL_wci_respF_decCtr
  assign WILL_FIRE_RL_wci_respF_decCtr =
	     wci_respF_c_r != 2'd0 && !wci_respF_enqueueing$whas ;
  // rule RL_wci_respF_both
  assign WILL_FIRE_RL_wci_respF_both =
	     ((wci_respF_c_r == 2'd1) ?
		wci_respF_enqueueing$whas :
		wci_respF_c_r != 2'd2 || wci_respF_enqueueing$whas) &&
	     wci_respF_c_r != 2'd0 &&
	     wci_respF_enqueueing$whas ;
  // rule RL_wsi_M1_reqFifo_deq
  assign WILL_FIRE_RL_wsi_M1_reqFifo_deq =
	     wsi_M1_reqFifo_c_r != 2'd0 && !wsi_M1_sThreadBusy_d ;
  // rule RL_wsi_M1_reqFifo_incCtr
  assign WILL_FIRE_RL_wsi_M1_reqFifo_incCtr =
	     ((wsi_M1_reqFifo_c_r == 2'd0) ?
		wsi_M1_reqFifo_enqueueing$whas :
		wsi_M1_reqFifo_c_r != 2'd1 ||
		wsi_M1_reqFifo_enqueueing$whas) &&
	     wsi_M1_reqFifo_enqueueing$whas &&
	     !WILL_FIRE_RL_wsi_M1_reqFifo_deq ;
  // rule RL_wsi_M1_reqFifo_decCtr
  assign WILL_FIRE_RL_wsi_M1_reqFifo_decCtr =
	     WILL_FIRE_RL_wsi_M1_reqFifo_deq &&
	     !wsi_M1_reqFifo_enqueueing$whas ;
  // rule RL_wsi_M1_reqFifo_both
  assign WILL_FIRE_RL_wsi_M1_reqFifo_both =
	     ((wsi_M1_reqFifo_c_r == 2'd1) ?
		wsi_M1_reqFifo_enqueueing$whas :
		wsi_M1_reqFifo_c_r != 2'd2 ||
		wsi_M1_reqFifo_enqueueing$whas) &&
	     WILL_FIRE_RL_wsi_M1_reqFifo_deq &&
	     wsi_M1_reqFifo_enqueueing$whas ;
  // rule RL_wsi_S0_reqFifo_enq
  assign WILL_FIRE_RL_wsi_S0_reqFifo_enq =
	     wsi_S0_reqFifo$FULL_N && wsi_S0_operateD && wsi_S0_peerIsReady &&
	     wsi_S0_wsiReq$wget[96:94] == 3'd1 ;
  // rule RL_wsi_S0_reqFifo_reset
  assign WILL_FIRE_RL_wsi_S0_reqFifo_reset =
	     WILL_FIRE_RL_wsi_S0_reqFifo_enq ||
	     WILL_FIRE_RL_doMessageConsume_S0 ;
  // rule RL_wsi_S1_reqFifo_enq
  assign WILL_FIRE_RL_wsi_S1_reqFifo_enq =
	     wsi_S1_reqFifo$FULL_N && wsi_S1_operateD && wsi_S1_peerIsReady &&
	     wsi_S1_wsiReq$wget[96:94] == 3'd1 ;
  // rule RL_wsi_S1_reqFifo_reset
  assign WILL_FIRE_RL_wsi_S1_reqFifo_reset =
	     WILL_FIRE_RL_wsi_S1_reqFifo_enq ||
	     WILL_FIRE_RL_doMessageConsume_S1 ;
  // inputs to muxes for submodule ports
  assign MUX_wci_illegalEdge$write_1__SEL_1 =
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
  assign MUX_wsi_M0_reqFifo_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wsi_M0_reqFifo_incCtr &&
	     wsi_M0_reqFifo_c_r == 2'd0 ;
  assign MUX_wsi_M0_reqFifo_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wsi_M0_reqFifo_incCtr &&
	     wsi_M0_reqFifo_c_r == 2'd1 ;
  assign MUX_wsi_M0_reqFifo_x_wire$wset_1__SEL_1 =
	     WILL_FIRE_RL_doMessageConsume_S0 && !splitCtrl[0] &&
	     !splitCtrl[7] ;
  assign MUX_wsi_M1_reqFifo_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wsi_M1_reqFifo_incCtr &&
	     wsi_M1_reqFifo_c_r == 2'd0 ;
  assign MUX_wsi_M1_reqFifo_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wsi_M1_reqFifo_incCtr &&
	     wsi_M1_reqFifo_c_r == 2'd1 ;
  assign MUX_wsi_M1_reqFifo_x_wire$wset_1__SEL_1 =
	     WILL_FIRE_RL_doMessageConsume_S0 && !splitCtrl[8] &&
	     !splitCtrl[15] ;
  assign MUX_wci_illegalEdge$write_1__VAL_1 =
	     wci_reqF$D_OUT[36:34] != 3'd4 && wci_reqF$D_OUT[36:34] != 3'd5 &&
	     wci_reqF$D_OUT[36:34] != 3'd6 ;
  assign MUX_wci_respF_c_r$write_1__VAL_1 = wci_respF_c_r + 2'd1 ;
  assign MUX_wci_respF_c_r$write_1__VAL_2 = wci_respF_c_r - 2'd1 ;
  assign MUX_wci_respF_q_0$write_1__VAL_1 =
	     (wci_respF_c_r == 2'd1) ?
	       MUX_wci_respF_q_0$write_1__VAL_2 :
	       wci_respF_q_1 ;
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
  assign MUX_wci_respF_q_1$write_1__VAL_1 =
	     (wci_respF_c_r == 2'd2) ?
	       MUX_wci_respF_q_0$write_1__VAL_2 :
	       34'h0AAAAAAAA ;
  assign MUX_wci_respF_x_wire$wset_1__VAL_1 =
	     wci_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wci_respF_x_wire$wset_1__VAL_2 = { 2'd1, _theResult____h16428 } ;
  assign MUX_wsi_M0_reqFifo_c_r$write_1__VAL_1 = wsi_M0_reqFifo_c_r + 2'd1 ;
  assign MUX_wsi_M0_reqFifo_c_r$write_1__VAL_2 = wsi_M0_reqFifo_c_r - 2'd1 ;
  assign MUX_wsi_M0_reqFifo_q_0$write_1__VAL_1 =
	     (wsi_M0_reqFifo_c_r == 2'd1) ?
	       MUX_wsi_M0_reqFifo_q_0$write_1__VAL_2 :
	       wsi_M0_reqFifo_q_1 ;
  assign MUX_wsi_M0_reqFifo_q_0$write_1__VAL_2 =
	     MUX_wsi_M0_reqFifo_x_wire$wset_1__SEL_1 ?
	       wsi_S0_reqFifo$D_OUT :
	       wsi_S1_reqFifo$D_OUT ;
  assign MUX_wsi_M0_reqFifo_q_1$write_1__VAL_1 =
	     (wsi_M0_reqFifo_c_r == 2'd2) ?
	       MUX_wsi_M0_reqFifo_q_0$write_1__VAL_2 :
	       97'h00000AAAAAAAAAAAAAAAAAA00 ;
  assign MUX_wsi_M1_reqFifo_c_r$write_1__VAL_1 = wsi_M1_reqFifo_c_r + 2'd1 ;
  assign MUX_wsi_M1_reqFifo_c_r$write_1__VAL_2 = wsi_M1_reqFifo_c_r - 2'd1 ;
  assign MUX_wsi_M1_reqFifo_q_0$write_1__VAL_1 =
	     (wsi_M1_reqFifo_c_r == 2'd1) ?
	       MUX_wsi_M1_reqFifo_q_0$write_1__VAL_2 :
	       wsi_M1_reqFifo_q_1 ;
  assign MUX_wsi_M1_reqFifo_q_0$write_1__VAL_2 =
	     MUX_wsi_M1_reqFifo_x_wire$wset_1__SEL_1 ?
	       wsi_S0_reqFifo$D_OUT :
	       wsi_S1_reqFifo$D_OUT ;
  assign MUX_wsi_M1_reqFifo_q_1$write_1__VAL_1 =
	     (wsi_M1_reqFifo_c_r == 2'd2) ?
	       MUX_wsi_M1_reqFifo_q_0$write_1__VAL_2 :
	       97'h00000AAAAAAAAAAAAAAAAAA00 ;
  // inlined wires
  assign wci_wciReq$wget =
	     { wciS0_MCmd,
	       wciS0_MAddrSpace,
	       wciS0_MByteEn,
	       wciS0_MAddr,
	       wciS0_MData } ;
  assign wci_wciReq$whas = 1'd1 ;
  assign wci_respF_x_wire$wget = MUX_wci_respF_q_0$write_1__VAL_2 ;
  assign wci_respF_x_wire$whas = wci_respF_enqueueing$whas ;
  assign wci_wEdge$wget = wci_reqF$D_OUT[36:34] ;
  assign wci_wEdge$whas = WILL_FIRE_RL_wci_ctl_op_start ;
  assign wci_sFlagReg_1$wget = 1'b0 ;
  assign wci_sFlagReg_1$whas = 1'b0 ;
  assign wci_ctlAckReg_1$wget = 1'd1 ;
  assign wci_ctlAckReg_1$whas =
	     WILL_FIRE_RL_wci_ctrl_OrE || WILL_FIRE_RL_wci_ctrl_IsO ||
	     WILL_FIRE_RL_wci_ctrl_EiI ;
  assign wsi_S0_wsiReq$wget =
	     { wsiS0_MCmd,
	       wsiS0_MReqLast,
	       wsiS0_MBurstPrecise,
	       wsiS0_MBurstLength,
	       wsiS0_MData,
	       wsiS0_MByteEn,
	       wsiS0_MReqInfo } ;
  assign wsi_S0_wsiReq$whas = 1'd1 ;
  assign wsi_S0_operateD_1$wget = 1'd1 ;
  assign wsi_S0_operateD_1$whas = wci_cState == 3'd2 ;
  assign wsi_S0_peerIsReady_1$wget = 1'd1 ;
  assign wsi_S0_peerIsReady_1$whas = wsiS0_MReset_n ;
  assign wsi_S0_sThreadBusy_dw$wget = wsi_S0_reqFifo_countReg > 2'd1 ;
  assign wsi_S0_sThreadBusy_dw$whas =
	     wsi_S0_reqFifo_levelsValid && wsi_S0_operateD &&
	     wsi_S0_peerIsReady ;
  assign wsi_S1_wsiReq$wget =
	     { wsiS1_MCmd,
	       wsiS1_MReqLast,
	       wsiS1_MBurstPrecise,
	       wsiS1_MBurstLength,
	       wsiS1_MData,
	       wsiS1_MByteEn,
	       wsiS1_MReqInfo } ;
  assign wsi_S1_wsiReq$whas = 1'd1 ;
  assign wsi_S1_operateD_1$wget = 1'd1 ;
  assign wsi_S1_operateD_1$whas = wci_cState == 3'd2 ;
  assign wsi_S1_peerIsReady_1$wget = 1'd1 ;
  assign wsi_S1_peerIsReady_1$whas = wsiS1_MReset_n ;
  assign wsi_S1_sThreadBusy_dw$wget = wsi_S1_reqFifo_countReg > 2'd1 ;
  assign wsi_S1_sThreadBusy_dw$whas =
	     wsi_S1_reqFifo_levelsValid && wsi_S1_operateD &&
	     wsi_S1_peerIsReady ;
  assign wsi_M0_reqFifo_x_wire$wget = MUX_wsi_M0_reqFifo_q_0$write_1__VAL_2 ;
  assign wsi_M0_reqFifo_x_wire$whas = wsi_M0_reqFifo_enqueueing$whas ;
  assign wsi_M0_operateD_1$wget = 1'd1 ;
  assign wsi_M0_operateD_1$whas = wci_cState == 3'd2 ;
  assign wsi_M0_peerIsReady_1$wget = 1'd1 ;
  assign wsi_M0_peerIsReady_1$whas = wsiM0_SReset_n ;
  assign wsi_M1_reqFifo_x_wire$wget = MUX_wsi_M1_reqFifo_q_0$write_1__VAL_2 ;
  assign wsi_M1_reqFifo_x_wire$whas = wsi_M1_reqFifo_enqueueing$whas ;
  assign wsi_M1_operateD_1$wget = 1'd1 ;
  assign wsi_M1_operateD_1$whas = wci_cState == 3'd2 ;
  assign wsi_M1_peerIsReady_1$wget = 1'd1 ;
  assign wsi_M1_peerIsReady_1$whas = wsiM1_SReset_n ;
  assign wci_Es_mCmd_w$wget = wciS0_MCmd ;
  assign wci_Es_mCmd_w$whas = 1'd1 ;
  assign wci_Es_mAddrSpace_w$wget = wciS0_MAddrSpace ;
  assign wci_Es_mAddrSpace_w$whas = 1'd1 ;
  assign wci_Es_mByteEn_w$wget = wciS0_MByteEn ;
  assign wci_Es_mByteEn_w$whas = 1'd1 ;
  assign wci_Es_mAddr_w$wget = wciS0_MAddr ;
  assign wci_Es_mAddr_w$whas = 1'd1 ;
  assign wci_Es_mData_w$wget = wciS0_MData ;
  assign wci_Es_mData_w$whas = 1'd1 ;
  assign wsi_Es0_mCmd_w$wget = wsiS0_MCmd ;
  assign wsi_Es0_mCmd_w$whas = 1'd1 ;
  assign wsi_Es0_mBurstLength_w$wget = wsiS0_MBurstLength ;
  assign wsi_Es0_mBurstLength_w$whas = 1'd1 ;
  assign wsi_Es0_mData_w$wget = wsiS0_MData ;
  assign wsi_Es0_mData_w$whas = 1'd1 ;
  assign wsi_Es0_mByteEn_w$wget = wsiS0_MByteEn ;
  assign wsi_Es0_mByteEn_w$whas = 1'd1 ;
  assign wsi_Es0_mReqInfo_w$wget = wsiS0_MReqInfo ;
  assign wsi_Es0_mReqInfo_w$whas = 1'd1 ;
  assign wsi_Es1_mCmd_w$wget = wsiS1_MCmd ;
  assign wsi_Es1_mCmd_w$whas = 1'd1 ;
  assign wsi_Es1_mBurstLength_w$wget = wsiS1_MBurstLength ;
  assign wsi_Es1_mBurstLength_w$whas = 1'd1 ;
  assign wsi_Es1_mData_w$wget = wsiS1_MData ;
  assign wsi_Es1_mData_w$whas = 1'd1 ;
  assign wsi_Es1_mByteEn_w$wget = wsiS1_MByteEn ;
  assign wsi_Es1_mByteEn_w$whas = 1'd1 ;
  assign wsi_Es1_mReqInfo_w$wget = wsiS1_MReqInfo ;
  assign wsi_Es1_mReqInfo_w$whas = 1'd1 ;
  assign wci_reqF_r_enq$whas = wci_wciReq$wget[71:69] != 3'd0 ;
  assign wci_reqF_r_deq$whas =
	     WILL_FIRE_RL_wci_ctl_op_start || WILL_FIRE_RL_wci_cfrd ||
	     WILL_FIRE_RL_wci_cfwr ;
  assign wci_reqF_r_clr$whas = 1'b0 ;
  assign wci_respF_enqueueing$whas =
	     WILL_FIRE_RL_wci_ctl_op_complete || WILL_FIRE_RL_wci_cfrd ||
	     WILL_FIRE_RL_wci_cfwr ;
  assign wci_respF_dequeueing$whas = wci_respF_c_r != 2'd0 ;
  assign wci_sThreadBusy_pw$whas = 1'b0 ;
  assign wci_wci_cfwr_pw$whas =
	     wci_reqF$EMPTY_N && wci_reqF$D_OUT[68] &&
	     wci_reqF$D_OUT[71:69] == 3'd1 ;
  assign wci_wci_cfrd_pw$whas =
	     wci_reqF$EMPTY_N && wci_reqF$D_OUT[68] &&
	     wci_reqF$D_OUT[71:69] == 3'd2 ;
  assign wci_wci_ctrl_pw$whas =
	     wci_reqF$EMPTY_N && !wci_reqF$D_OUT[68] &&
	     wci_reqF$D_OUT[71:69] == 3'd2 ;
  assign wsi_S0_reqFifo_r_enq$whas = WILL_FIRE_RL_wsi_S0_reqFifo_enq ;
  assign wsi_S0_reqFifo_r_deq$whas = WILL_FIRE_RL_doMessageConsume_S0 ;
  assign wsi_S0_reqFifo_r_clr$whas = 1'b0 ;
  assign wsi_S0_reqFifo_doResetEnq$whas = WILL_FIRE_RL_wsi_S0_reqFifo_enq ;
  assign wsi_S0_reqFifo_doResetDeq$whas = WILL_FIRE_RL_doMessageConsume_S0 ;
  assign wsi_S0_reqFifo_doResetClr$whas = 1'b0 ;
  assign wsi_S1_reqFifo_r_enq$whas = WILL_FIRE_RL_wsi_S1_reqFifo_enq ;
  assign wsi_S1_reqFifo_r_deq$whas = WILL_FIRE_RL_doMessageConsume_S1 ;
  assign wsi_S1_reqFifo_r_clr$whas = 1'b0 ;
  assign wsi_S1_reqFifo_doResetEnq$whas = WILL_FIRE_RL_wsi_S1_reqFifo_enq ;
  assign wsi_S1_reqFifo_doResetDeq$whas = WILL_FIRE_RL_doMessageConsume_S1 ;
  assign wsi_S1_reqFifo_doResetClr$whas = 1'b0 ;
  assign wsi_M0_reqFifo_enqueueing$whas =
	     WILL_FIRE_RL_doMessageConsume_S0 && !splitCtrl[0] &&
	     !splitCtrl[7] ||
	     WILL_FIRE_RL_doMessageConsume_S1 && splitCtrl[0] &&
	     !splitCtrl[7] ;
  assign wsi_M0_reqFifo_dequeueing$whas = WILL_FIRE_RL_wsi_M0_reqFifo_deq ;
  assign wsi_M0_sThreadBusy_pw$whas = wsiM0_SThreadBusy ;
  assign wsi_M1_reqFifo_enqueueing$whas =
	     WILL_FIRE_RL_doMessageConsume_S0 && !splitCtrl[8] &&
	     !splitCtrl[15] ||
	     WILL_FIRE_RL_doMessageConsume_S1 && splitCtrl[8] &&
	     !splitCtrl[15] ;
  assign wsi_M1_reqFifo_dequeueing$whas = WILL_FIRE_RL_wsi_M1_reqFifo_deq ;
  assign wsi_M1_sThreadBusy_pw$whas = wsiM1_SThreadBusy ;
  assign wsi_Es0_mReqLast_w$whas = wsiS0_MReqLast ;
  assign wsi_Es0_mBurstPrecise_w$whas = wsiS0_MBurstPrecise ;
  assign wsi_Es0_mDataInfo_w$whas = 1'd1 ;
  assign wsi_Es1_mReqLast_w$whas = wsiS1_MReqLast ;
  assign wsi_Es1_mBurstPrecise_w$whas = wsiS1_MBurstPrecise ;
  assign wsi_Es1_mDataInfo_w$whas = 1'd1 ;
  assign wsi_S0_extStatusW$wget =
	     { wsi_S0_pMesgCount, wsi_S0_iMesgCount, wsi_S0_tBusyCount } ;
  assign wsi_S1_extStatusW$wget =
	     { wsi_S1_pMesgCount, wsi_S1_iMesgCount, wsi_S1_tBusyCount } ;
  assign wsi_M0_extStatusW$wget =
	     { wsi_M0_pMesgCount, wsi_M0_iMesgCount, wsi_M0_tBusyCount } ;
  assign wsi_M1_extStatusW$wget =
	     { wsi_M1_pMesgCount, wsi_M1_iMesgCount, wsi_M1_tBusyCount } ;
  // register splitCtrl
  assign splitCtrl$D_IN = wci_reqF$D_OUT[31:0] ;
  assign splitCtrl$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h04 ;
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
	     MUX_wci_illegalEdge$write_1__SEL_1 &&
	     MUX_wci_illegalEdge$write_1__VAL_1 ;
  assign wci_illegalEdge$EN =
	     MUX_wci_illegalEdge$write_1__SEL_1 ||
	     WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge ;
  // register wci_isReset_isInReset
  assign wci_isReset_isInReset$D_IN = 1'd0 ;
  assign wci_isReset_isInReset$EN = wci_isReset_isInReset ;
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
	     (wci_wciReq$wget[71:69] != 3'd0) ?
	       wci_reqF_countReg + 2'd1 :
	       wci_reqF_countReg - 2'd1 ;
  assign wci_reqF_countReg$EN =
	     (wci_wciReq$wget[71:69] != 3'd0) != wci_reqF_r_deq$whas ;
  // register wci_respF_c_r
  assign wci_respF_c_r$D_IN =
	     WILL_FIRE_RL_wci_respF_incCtr ?
	       MUX_wci_respF_c_r$write_1__VAL_1 :
	       MUX_wci_respF_c_r$write_1__VAL_2 ;
  assign wci_respF_c_r$EN =
	     WILL_FIRE_RL_wci_respF_incCtr || WILL_FIRE_RL_wci_respF_decCtr ;
  // register wci_respF_q_0
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
  assign wci_respF_q_0$EN =
	     WILL_FIRE_RL_wci_respF_both ||
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wci_respF_decCtr ;
  // register wci_respF_q_1
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
  assign wci_respF_q_1$EN =
	     WILL_FIRE_RL_wci_respF_both ||
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wci_respF_decCtr ;
  // register wci_sFlagReg
  assign wci_sFlagReg$D_IN = 1'b0 ;
  assign wci_sFlagReg$EN = 1'd1 ;
  // register wci_sThreadBusy_d
  assign wci_sThreadBusy_d$D_IN = 1'b0 ;
  assign wci_sThreadBusy_d$EN = 1'd1 ;
  // register wsi_M0_burstKind
  assign wsi_M0_burstKind$D_IN =
	     (wsi_M0_burstKind == 2'd0) ?
	       (wsi_M0_reqFifo_q_0[92] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsi_M0_burstKind$EN =
	     WILL_FIRE_RL_wsi_M0_reqFifo_deq &&
	     wsi_M0_reqFifo_q_0[96:94] == 3'd1 &&
	     (wsi_M0_burstKind == 2'd0 ||
	      (wsi_M0_burstKind == 2'd1 || wsi_M0_burstKind == 2'd2) &&
	      wsi_M0_reqFifo_q_0[93]) ;
  // register wsi_M0_errorSticky
  assign wsi_M0_errorSticky$D_IN = 1'b0 ;
  assign wsi_M0_errorSticky$EN = 1'b0 ;
  // register wsi_M0_iMesgCount
  assign wsi_M0_iMesgCount$D_IN = wsi_M0_iMesgCount + 32'd1 ;
  assign wsi_M0_iMesgCount$EN =
	     WILL_FIRE_RL_wsi_M0_reqFifo_deq &&
	     wsi_M0_reqFifo_q_0[96:94] == 3'd1 &&
	     wsi_M0_burstKind == 2'd2 &&
	     wsi_M0_reqFifo_q_0[93] ;
  // register wsi_M0_isReset_isInReset
  assign wsi_M0_isReset_isInReset$D_IN = 1'd0 ;
  assign wsi_M0_isReset_isInReset$EN = wsi_M0_isReset_isInReset ;
  // register wsi_M0_operateD
  assign wsi_M0_operateD$D_IN = wci_cState == 3'd2 ;
  assign wsi_M0_operateD$EN = 1'd1 ;
  // register wsi_M0_pMesgCount
  assign wsi_M0_pMesgCount$D_IN = wsi_M0_pMesgCount + 32'd1 ;
  assign wsi_M0_pMesgCount$EN =
	     WILL_FIRE_RL_wsi_M0_reqFifo_deq &&
	     wsi_M0_reqFifo_q_0[96:94] == 3'd1 &&
	     wsi_M0_burstKind == 2'd1 &&
	     wsi_M0_reqFifo_q_0[93] ;
  // register wsi_M0_peerIsReady
  assign wsi_M0_peerIsReady$D_IN = wsiM0_SReset_n ;
  assign wsi_M0_peerIsReady$EN = 1'd1 ;
  // register wsi_M0_reqFifo_c_r
  assign wsi_M0_reqFifo_c_r$D_IN =
	     WILL_FIRE_RL_wsi_M0_reqFifo_incCtr ?
	       MUX_wsi_M0_reqFifo_c_r$write_1__VAL_1 :
	       MUX_wsi_M0_reqFifo_c_r$write_1__VAL_2 ;
  assign wsi_M0_reqFifo_c_r$EN =
	     WILL_FIRE_RL_wsi_M0_reqFifo_incCtr ||
	     WILL_FIRE_RL_wsi_M0_reqFifo_decCtr ;
  // register wsi_M0_reqFifo_q_0
  always@(WILL_FIRE_RL_wsi_M0_reqFifo_both or
	  MUX_wsi_M0_reqFifo_q_0$write_1__VAL_1 or
	  MUX_wsi_M0_reqFifo_q_0$write_1__SEL_2 or
	  MUX_wsi_M0_reqFifo_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wsi_M0_reqFifo_decCtr or wsi_M0_reqFifo_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wsi_M0_reqFifo_both:
	  wsi_M0_reqFifo_q_0$D_IN = MUX_wsi_M0_reqFifo_q_0$write_1__VAL_1;
      MUX_wsi_M0_reqFifo_q_0$write_1__SEL_2:
	  wsi_M0_reqFifo_q_0$D_IN = MUX_wsi_M0_reqFifo_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wsi_M0_reqFifo_decCtr:
	  wsi_M0_reqFifo_q_0$D_IN = wsi_M0_reqFifo_q_1;
      default: wsi_M0_reqFifo_q_0$D_IN =
		   97'h0AAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsi_M0_reqFifo_q_0$EN =
	     WILL_FIRE_RL_wsi_M0_reqFifo_both ||
	     WILL_FIRE_RL_wsi_M0_reqFifo_incCtr &&
	     wsi_M0_reqFifo_c_r == 2'd0 ||
	     WILL_FIRE_RL_wsi_M0_reqFifo_decCtr ;
  // register wsi_M0_reqFifo_q_1
  always@(WILL_FIRE_RL_wsi_M0_reqFifo_both or
	  MUX_wsi_M0_reqFifo_q_1$write_1__VAL_1 or
	  MUX_wsi_M0_reqFifo_q_1$write_1__SEL_2 or
	  MUX_wsi_M0_reqFifo_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wsi_M0_reqFifo_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wsi_M0_reqFifo_both:
	  wsi_M0_reqFifo_q_1$D_IN = MUX_wsi_M0_reqFifo_q_1$write_1__VAL_1;
      MUX_wsi_M0_reqFifo_q_1$write_1__SEL_2:
	  wsi_M0_reqFifo_q_1$D_IN = MUX_wsi_M0_reqFifo_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wsi_M0_reqFifo_decCtr:
	  wsi_M0_reqFifo_q_1$D_IN = 97'h00000AAAAAAAAAAAAAAAAAA00;
      default: wsi_M0_reqFifo_q_1$D_IN =
		   97'h0AAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsi_M0_reqFifo_q_1$EN =
	     WILL_FIRE_RL_wsi_M0_reqFifo_both ||
	     WILL_FIRE_RL_wsi_M0_reqFifo_incCtr &&
	     wsi_M0_reqFifo_c_r == 2'd1 ||
	     WILL_FIRE_RL_wsi_M0_reqFifo_decCtr ;
  // register wsi_M0_sThreadBusy_d
  assign wsi_M0_sThreadBusy_d$D_IN = wsiM0_SThreadBusy ;
  assign wsi_M0_sThreadBusy_d$EN = 1'd1 ;
  // register wsi_M0_statusR
  assign wsi_M0_statusR$D_IN =
	     { wsi_M0_isReset_isInReset,
	       !wsi_M0_peerIsReady,
	       !wsi_M0_operateD,
	       wsi_M0_errorSticky,
	       wsi_M0_burstKind != 2'd0,
	       wsi_M0_sThreadBusy_d,
	       1'd0,
	       wsi_M0_trafficSticky } ;
  assign wsi_M0_statusR$EN = 1'd1 ;
  // register wsi_M0_tBusyCount
  assign wsi_M0_tBusyCount$D_IN = wsi_M0_tBusyCount + 32'd1 ;
  assign wsi_M0_tBusyCount$EN =
	     wsi_M0_operateD && wsi_M0_peerIsReady && wsi_M0_sThreadBusy_d ;
  // register wsi_M0_trafficSticky
  assign wsi_M0_trafficSticky$D_IN = 1'd1 ;
  assign wsi_M0_trafficSticky$EN =
	     WILL_FIRE_RL_wsi_M0_reqFifo_deq &&
	     wsi_M0_reqFifo_q_0[96:94] == 3'd1 ;
  // register wsi_M1_burstKind
  assign wsi_M1_burstKind$D_IN =
	     (wsi_M1_burstKind == 2'd0) ?
	       (wsi_M1_reqFifo_q_0[92] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsi_M1_burstKind$EN =
	     WILL_FIRE_RL_wsi_M1_reqFifo_deq &&
	     wsi_M1_reqFifo_q_0[96:94] == 3'd1 &&
	     (wsi_M1_burstKind == 2'd0 ||
	      (wsi_M1_burstKind == 2'd1 || wsi_M1_burstKind == 2'd2) &&
	      wsi_M1_reqFifo_q_0[93]) ;
  // register wsi_M1_errorSticky
  assign wsi_M1_errorSticky$D_IN = 1'b0 ;
  assign wsi_M1_errorSticky$EN = 1'b0 ;
  // register wsi_M1_iMesgCount
  assign wsi_M1_iMesgCount$D_IN = wsi_M1_iMesgCount + 32'd1 ;
  assign wsi_M1_iMesgCount$EN =
	     WILL_FIRE_RL_wsi_M1_reqFifo_deq &&
	     wsi_M1_reqFifo_q_0[96:94] == 3'd1 &&
	     wsi_M1_burstKind == 2'd2 &&
	     wsi_M1_reqFifo_q_0[93] ;
  // register wsi_M1_isReset_isInReset
  assign wsi_M1_isReset_isInReset$D_IN = 1'd0 ;
  assign wsi_M1_isReset_isInReset$EN = wsi_M1_isReset_isInReset ;
  // register wsi_M1_operateD
  assign wsi_M1_operateD$D_IN = wci_cState == 3'd2 ;
  assign wsi_M1_operateD$EN = 1'd1 ;
  // register wsi_M1_pMesgCount
  assign wsi_M1_pMesgCount$D_IN = wsi_M1_pMesgCount + 32'd1 ;
  assign wsi_M1_pMesgCount$EN =
	     WILL_FIRE_RL_wsi_M1_reqFifo_deq &&
	     wsi_M1_reqFifo_q_0[96:94] == 3'd1 &&
	     wsi_M1_burstKind == 2'd1 &&
	     wsi_M1_reqFifo_q_0[93] ;
  // register wsi_M1_peerIsReady
  assign wsi_M1_peerIsReady$D_IN = wsiM1_SReset_n ;
  assign wsi_M1_peerIsReady$EN = 1'd1 ;
  // register wsi_M1_reqFifo_c_r
  assign wsi_M1_reqFifo_c_r$D_IN =
	     WILL_FIRE_RL_wsi_M1_reqFifo_incCtr ?
	       MUX_wsi_M1_reqFifo_c_r$write_1__VAL_1 :
	       MUX_wsi_M1_reqFifo_c_r$write_1__VAL_2 ;
  assign wsi_M1_reqFifo_c_r$EN =
	     WILL_FIRE_RL_wsi_M1_reqFifo_incCtr ||
	     WILL_FIRE_RL_wsi_M1_reqFifo_decCtr ;
  // register wsi_M1_reqFifo_q_0
  always@(WILL_FIRE_RL_wsi_M1_reqFifo_both or
	  MUX_wsi_M1_reqFifo_q_0$write_1__VAL_1 or
	  MUX_wsi_M1_reqFifo_q_0$write_1__SEL_2 or
	  MUX_wsi_M1_reqFifo_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wsi_M1_reqFifo_decCtr or wsi_M1_reqFifo_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wsi_M1_reqFifo_both:
	  wsi_M1_reqFifo_q_0$D_IN = MUX_wsi_M1_reqFifo_q_0$write_1__VAL_1;
      MUX_wsi_M1_reqFifo_q_0$write_1__SEL_2:
	  wsi_M1_reqFifo_q_0$D_IN = MUX_wsi_M1_reqFifo_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wsi_M1_reqFifo_decCtr:
	  wsi_M1_reqFifo_q_0$D_IN = wsi_M1_reqFifo_q_1;
      default: wsi_M1_reqFifo_q_0$D_IN =
		   97'h0AAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsi_M1_reqFifo_q_0$EN =
	     WILL_FIRE_RL_wsi_M1_reqFifo_both ||
	     WILL_FIRE_RL_wsi_M1_reqFifo_incCtr &&
	     wsi_M1_reqFifo_c_r == 2'd0 ||
	     WILL_FIRE_RL_wsi_M1_reqFifo_decCtr ;
  // register wsi_M1_reqFifo_q_1
  always@(WILL_FIRE_RL_wsi_M1_reqFifo_both or
	  MUX_wsi_M1_reqFifo_q_1$write_1__VAL_1 or
	  MUX_wsi_M1_reqFifo_q_1$write_1__SEL_2 or
	  MUX_wsi_M1_reqFifo_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wsi_M1_reqFifo_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wsi_M1_reqFifo_both:
	  wsi_M1_reqFifo_q_1$D_IN = MUX_wsi_M1_reqFifo_q_1$write_1__VAL_1;
      MUX_wsi_M1_reqFifo_q_1$write_1__SEL_2:
	  wsi_M1_reqFifo_q_1$D_IN = MUX_wsi_M1_reqFifo_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wsi_M1_reqFifo_decCtr:
	  wsi_M1_reqFifo_q_1$D_IN = 97'h00000AAAAAAAAAAAAAAAAAA00;
      default: wsi_M1_reqFifo_q_1$D_IN =
		   97'h0AAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsi_M1_reqFifo_q_1$EN =
	     WILL_FIRE_RL_wsi_M1_reqFifo_both ||
	     WILL_FIRE_RL_wsi_M1_reqFifo_incCtr &&
	     wsi_M1_reqFifo_c_r == 2'd1 ||
	     WILL_FIRE_RL_wsi_M1_reqFifo_decCtr ;
  // register wsi_M1_sThreadBusy_d
  assign wsi_M1_sThreadBusy_d$D_IN = wsiM1_SThreadBusy ;
  assign wsi_M1_sThreadBusy_d$EN = 1'd1 ;
  // register wsi_M1_statusR
  assign wsi_M1_statusR$D_IN =
	     { wsi_M1_isReset_isInReset,
	       !wsi_M1_peerIsReady,
	       !wsi_M1_operateD,
	       wsi_M1_errorSticky,
	       wsi_M1_burstKind != 2'd0,
	       wsi_M1_sThreadBusy_d,
	       1'd0,
	       wsi_M1_trafficSticky } ;
  assign wsi_M1_statusR$EN = 1'd1 ;
  // register wsi_M1_tBusyCount
  assign wsi_M1_tBusyCount$D_IN = wsi_M1_tBusyCount + 32'd1 ;
  assign wsi_M1_tBusyCount$EN =
	     wsi_M1_operateD && wsi_M1_peerIsReady && wsi_M1_sThreadBusy_d ;
  // register wsi_M1_trafficSticky
  assign wsi_M1_trafficSticky$D_IN = 1'd1 ;
  assign wsi_M1_trafficSticky$EN =
	     WILL_FIRE_RL_wsi_M1_reqFifo_deq &&
	     wsi_M1_reqFifo_q_0[96:94] == 3'd1 ;
  // register wsi_S0_burstKind
  assign wsi_S0_burstKind$D_IN =
	     (wsi_S0_burstKind == 2'd0) ?
	       (wsi_S0_wsiReq$wget[92] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsi_S0_burstKind$EN =
	     WILL_FIRE_RL_wsi_S0_reqFifo_enq &&
	     (wsi_S0_burstKind == 2'd0 ||
	      (wsi_S0_burstKind == 2'd1 || wsi_S0_burstKind == 2'd2) &&
	      wsi_S0_wsiReq$wget[93]) ;
  // register wsi_S0_errorSticky
  assign wsi_S0_errorSticky$D_IN = 1'b0 ;
  assign wsi_S0_errorSticky$EN = 1'b0 ;
  // register wsi_S0_iMesgCount
  assign wsi_S0_iMesgCount$D_IN = wsi_S0_iMesgCount + 32'd1 ;
  assign wsi_S0_iMesgCount$EN =
	     WILL_FIRE_RL_wsi_S0_reqFifo_enq && wsi_S0_burstKind == 2'd2 &&
	     wsi_S0_wsiReq$wget[93] ;
  // register wsi_S0_isReset_isInReset
  assign wsi_S0_isReset_isInReset$D_IN = 1'd0 ;
  assign wsi_S0_isReset_isInReset$EN = wsi_S0_isReset_isInReset ;
  // register wsi_S0_mesgWordLength
  assign wsi_S0_mesgWordLength$D_IN = wsi_S0_wordCount ;
  assign wsi_S0_mesgWordLength$EN =
	     WILL_FIRE_RL_wsi_S0_reqFifo_enq && wsi_S0_wsiReq$wget[93] ;
  // register wsi_S0_operateD
  assign wsi_S0_operateD$D_IN = wci_cState == 3'd2 ;
  assign wsi_S0_operateD$EN = 1'd1 ;
  // register wsi_S0_pMesgCount
  assign wsi_S0_pMesgCount$D_IN = wsi_S0_pMesgCount + 32'd1 ;
  assign wsi_S0_pMesgCount$EN =
	     WILL_FIRE_RL_wsi_S0_reqFifo_enq && wsi_S0_burstKind == 2'd1 &&
	     wsi_S0_wsiReq$wget[93] ;
  // register wsi_S0_peerIsReady
  assign wsi_S0_peerIsReady$D_IN = wsiS0_MReset_n ;
  assign wsi_S0_peerIsReady$EN = 1'd1 ;
  // register wsi_S0_reqFifo_countReg
  assign wsi_S0_reqFifo_countReg$D_IN =
	     WILL_FIRE_RL_wsi_S0_reqFifo_enq ?
	       wsi_S0_reqFifo_countReg + 2'd1 :
	       wsi_S0_reqFifo_countReg - 2'd1 ;
  assign wsi_S0_reqFifo_countReg$EN =
	     WILL_FIRE_RL_wsi_S0_reqFifo_enq !=
	     WILL_FIRE_RL_doMessageConsume_S0 ;
  // register wsi_S0_reqFifo_levelsValid
  assign wsi_S0_reqFifo_levelsValid$D_IN = WILL_FIRE_RL_wsi_S0_reqFifo_reset ;
  assign wsi_S0_reqFifo_levelsValid$EN =
	     WILL_FIRE_RL_doMessageConsume_S0 ||
	     WILL_FIRE_RL_wsi_S0_reqFifo_enq ||
	     WILL_FIRE_RL_wsi_S0_reqFifo_reset ;
  // register wsi_S0_statusR
  assign wsi_S0_statusR$D_IN =
	     { wsi_S0_isReset_isInReset,
	       !wsi_S0_peerIsReady,
	       !wsi_S0_operateD,
	       wsi_S0_errorSticky,
	       wsi_S0_burstKind != 2'd0,
	       !wsi_S0_sThreadBusy_dw$whas || wsi_S0_sThreadBusy_dw$wget,
	       1'd0,
	       wsi_S0_trafficSticky } ;
  assign wsi_S0_statusR$EN = 1'd1 ;
  // register wsi_S0_tBusyCount
  assign wsi_S0_tBusyCount$D_IN = wsi_S0_tBusyCount + 32'd1 ;
  assign wsi_S0_tBusyCount$EN =
	     wsi_S0_operateD && wsi_S0_peerIsReady &&
	     (!wsi_S0_sThreadBusy_dw$whas || wsi_S0_sThreadBusy_dw$wget) ;
  // register wsi_S0_trafficSticky
  assign wsi_S0_trafficSticky$D_IN = 1'd1 ;
  assign wsi_S0_trafficSticky$EN = WILL_FIRE_RL_wsi_S0_reqFifo_enq ;
  // register wsi_S0_wordCount
  assign wsi_S0_wordCount$D_IN =
	     wsi_S0_wsiReq$wget[93] ? 12'd1 : wsi_S0_wordCount + 12'd1 ;
  assign wsi_S0_wordCount$EN = WILL_FIRE_RL_wsi_S0_reqFifo_enq ;
  // register wsi_S1_burstKind
  assign wsi_S1_burstKind$D_IN =
	     (wsi_S1_burstKind == 2'd0) ?
	       (wsi_S1_wsiReq$wget[92] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsi_S1_burstKind$EN =
	     WILL_FIRE_RL_wsi_S1_reqFifo_enq &&
	     (wsi_S1_burstKind == 2'd0 ||
	      (wsi_S1_burstKind == 2'd1 || wsi_S1_burstKind == 2'd2) &&
	      wsi_S1_wsiReq$wget[93]) ;
  // register wsi_S1_errorSticky
  assign wsi_S1_errorSticky$D_IN = 1'b0 ;
  assign wsi_S1_errorSticky$EN = 1'b0 ;
  // register wsi_S1_iMesgCount
  assign wsi_S1_iMesgCount$D_IN = wsi_S1_iMesgCount + 32'd1 ;
  assign wsi_S1_iMesgCount$EN =
	     WILL_FIRE_RL_wsi_S1_reqFifo_enq && wsi_S1_burstKind == 2'd2 &&
	     wsi_S1_wsiReq$wget[93] ;
  // register wsi_S1_isReset_isInReset
  assign wsi_S1_isReset_isInReset$D_IN = 1'd0 ;
  assign wsi_S1_isReset_isInReset$EN = wsi_S1_isReset_isInReset ;
  // register wsi_S1_mesgWordLength
  assign wsi_S1_mesgWordLength$D_IN = wsi_S1_wordCount ;
  assign wsi_S1_mesgWordLength$EN =
	     WILL_FIRE_RL_wsi_S1_reqFifo_enq && wsi_S1_wsiReq$wget[93] ;
  // register wsi_S1_operateD
  assign wsi_S1_operateD$D_IN = wci_cState == 3'd2 ;
  assign wsi_S1_operateD$EN = 1'd1 ;
  // register wsi_S1_pMesgCount
  assign wsi_S1_pMesgCount$D_IN = wsi_S1_pMesgCount + 32'd1 ;
  assign wsi_S1_pMesgCount$EN =
	     WILL_FIRE_RL_wsi_S1_reqFifo_enq && wsi_S1_burstKind == 2'd1 &&
	     wsi_S1_wsiReq$wget[93] ;
  // register wsi_S1_peerIsReady
  assign wsi_S1_peerIsReady$D_IN = wsiS1_MReset_n ;
  assign wsi_S1_peerIsReady$EN = 1'd1 ;
  // register wsi_S1_reqFifo_countReg
  assign wsi_S1_reqFifo_countReg$D_IN =
	     WILL_FIRE_RL_wsi_S1_reqFifo_enq ?
	       wsi_S1_reqFifo_countReg + 2'd1 :
	       wsi_S1_reqFifo_countReg - 2'd1 ;
  assign wsi_S1_reqFifo_countReg$EN =
	     WILL_FIRE_RL_wsi_S1_reqFifo_enq !=
	     WILL_FIRE_RL_doMessageConsume_S1 ;
  // register wsi_S1_reqFifo_levelsValid
  assign wsi_S1_reqFifo_levelsValid$D_IN = WILL_FIRE_RL_wsi_S1_reqFifo_reset ;
  assign wsi_S1_reqFifo_levelsValid$EN =
	     WILL_FIRE_RL_doMessageConsume_S1 ||
	     WILL_FIRE_RL_wsi_S1_reqFifo_enq ||
	     WILL_FIRE_RL_wsi_S1_reqFifo_reset ;
  // register wsi_S1_statusR
  assign wsi_S1_statusR$D_IN =
	     { wsi_S1_isReset_isInReset,
	       !wsi_S1_peerIsReady,
	       !wsi_S1_operateD,
	       wsi_S1_errorSticky,
	       wsi_S1_burstKind != 2'd0,
	       !wsi_S1_sThreadBusy_dw$whas || wsi_S1_sThreadBusy_dw$wget,
	       1'd0,
	       wsi_S1_trafficSticky } ;
  assign wsi_S1_statusR$EN = 1'd1 ;
  // register wsi_S1_tBusyCount
  assign wsi_S1_tBusyCount$D_IN = wsi_S1_tBusyCount + 32'd1 ;
  assign wsi_S1_tBusyCount$EN =
	     wsi_S1_operateD && wsi_S1_peerIsReady &&
	     (!wsi_S1_sThreadBusy_dw$whas || wsi_S1_sThreadBusy_dw$wget) ;
  // register wsi_S1_trafficSticky
  assign wsi_S1_trafficSticky$D_IN = 1'd1 ;
  assign wsi_S1_trafficSticky$EN = WILL_FIRE_RL_wsi_S1_reqFifo_enq ;
  // register wsi_S1_wordCount
  assign wsi_S1_wordCount$D_IN =
	     wsi_S1_wsiReq$wget[93] ? 12'd1 : wsi_S1_wordCount + 12'd1 ;
  assign wsi_S1_wordCount$EN = WILL_FIRE_RL_wsi_S1_reqFifo_enq ;
  // submodule wci_reqF
  assign wci_reqF$D_IN = wci_wciReq$wget ;
  assign wci_reqF$ENQ = wci_wciReq$wget[71:69] != 3'd0 ;
  assign wci_reqF$DEQ = wci_reqF_r_deq$whas ;
  assign wci_reqF$CLR = 1'b0 ;
  // submodule wsi_S0_reqFifo
  assign wsi_S0_reqFifo$D_IN = wsi_S0_wsiReq$wget ;
  assign wsi_S0_reqFifo$ENQ = WILL_FIRE_RL_wsi_S0_reqFifo_enq ;
  assign wsi_S0_reqFifo$DEQ = WILL_FIRE_RL_doMessageConsume_S0 ;
  assign wsi_S0_reqFifo$CLR = 1'b0 ;
  // submodule wsi_S1_reqFifo
  assign wsi_S1_reqFifo$D_IN = wsi_S1_wsiReq$wget ;
  assign wsi_S1_reqFifo$ENQ = WILL_FIRE_RL_wsi_S1_reqFifo_enq ;
  assign wsi_S1_reqFifo$DEQ = WILL_FIRE_RL_doMessageConsume_S1 ;
  assign wsi_S1_reqFifo$CLR = 1'b0 ;
  // remaining internal signals
  assign rdat__h16512 =
	     hasDebugLogic ?
	       { wsi_S0_statusR,
		 wsi_S1_statusR,
		 wsi_M0_statusR,
		 wsi_M1_statusR } :
	       32'd0 ;
  assign rdat__h16701 =
	     hasDebugLogic ? wsi_S0_extStatusW$wget[95:64] : 32'd0 ;
  assign rdat__h16715 =
	     hasDebugLogic ? wsi_S0_extStatusW$wget[63:32] : 32'd0 ;
  assign rdat__h16723 =
	     hasDebugLogic ? wsi_S1_extStatusW$wget[95:64] : 32'd0 ;
  assign rdat__h16737 =
	     hasDebugLogic ? wsi_S1_extStatusW$wget[63:32] : 32'd0 ;
  assign rdat__h16745 =
	     hasDebugLogic ? wsi_M0_extStatusW$wget[95:64] : 32'd0 ;
  assign rdat__h16759 =
	     hasDebugLogic ? wsi_M0_extStatusW$wget[63:32] : 32'd0 ;
  assign rdat__h16767 =
	     hasDebugLogic ? wsi_M1_extStatusW$wget[95:64] : 32'd0 ;
  assign rdat__h16781 =
	     hasDebugLogic ? wsi_M1_extStatusW$wget[63:32] : 32'd0 ;
  always@(wci_reqF$D_OUT or
	  splitCtrl or
	  rdat__h16512 or
	  rdat__h16701 or
	  rdat__h16715 or
	  rdat__h16723 or
	  rdat__h16737 or
	  rdat__h16745 or rdat__h16759 or rdat__h16767 or rdat__h16781)
  begin
    case (wci_reqF$D_OUT[39:32])
      8'h04: _theResult____h16428 = splitCtrl;
      8'h1C: _theResult____h16428 = rdat__h16512;
      8'h20: _theResult____h16428 = rdat__h16701;
      8'h24: _theResult____h16428 = rdat__h16715;
      8'h28: _theResult____h16428 = rdat__h16723;
      8'h2C: _theResult____h16428 = rdat__h16737;
      8'h30: _theResult____h16428 = rdat__h16745;
      8'h34: _theResult____h16428 = rdat__h16759;
      8'h38: _theResult____h16428 = rdat__h16767;
      8'h3C: _theResult____h16428 = rdat__h16781;
      default: _theResult____h16428 = 32'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (wciS0_MReset_n == `BSV_RESET_VALUE)
      begin
        splitCtrl <= `BSV_ASSIGNMENT_DELAY ctrlInit;
	wci_cEdge <= `BSV_ASSIGNMENT_DELAY 3'h2;
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
	wsi_M0_burstKind <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsi_M0_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_M0_iMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsi_M0_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_M0_pMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsi_M0_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_M0_reqFifo_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsi_M0_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY
	    97'h00000AAAAAAAAAAAAAAAAAA00;
	wsi_M0_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY
	    97'h00000AAAAAAAAAAAAAAAAAA00;
	wsi_M0_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wsi_M0_tBusyCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsi_M0_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_M1_burstKind <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsi_M1_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_M1_iMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsi_M1_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_M1_pMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsi_M1_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_M1_reqFifo_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsi_M1_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY
	    97'h00000AAAAAAAAAAAAAAAAAA00;
	wsi_M1_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY
	    97'h00000AAAAAAAAAAAAAAAAAA00;
	wsi_M1_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wsi_M1_tBusyCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsi_M1_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_S0_burstKind <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsi_S0_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_S0_iMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsi_S0_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_S0_pMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsi_S0_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_S0_reqFifo_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsi_S0_reqFifo_levelsValid <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wsi_S0_tBusyCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsi_S0_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_S0_wordCount <= `BSV_ASSIGNMENT_DELAY 12'd1;
	wsi_S1_burstKind <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsi_S1_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_S1_iMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsi_S1_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_S1_pMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsi_S1_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_S1_reqFifo_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsi_S1_reqFifo_levelsValid <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wsi_S1_tBusyCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsi_S1_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsi_S1_wordCount <= `BSV_ASSIGNMENT_DELAY 12'd1;
      end
    else
      begin
        if (splitCtrl$EN) splitCtrl <= `BSV_ASSIGNMENT_DELAY splitCtrl$D_IN;
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
	if (wsi_M0_burstKind$EN)
	  wsi_M0_burstKind <= `BSV_ASSIGNMENT_DELAY wsi_M0_burstKind$D_IN;
	if (wsi_M0_errorSticky$EN)
	  wsi_M0_errorSticky <= `BSV_ASSIGNMENT_DELAY wsi_M0_errorSticky$D_IN;
	if (wsi_M0_iMesgCount$EN)
	  wsi_M0_iMesgCount <= `BSV_ASSIGNMENT_DELAY wsi_M0_iMesgCount$D_IN;
	if (wsi_M0_operateD$EN)
	  wsi_M0_operateD <= `BSV_ASSIGNMENT_DELAY wsi_M0_operateD$D_IN;
	if (wsi_M0_pMesgCount$EN)
	  wsi_M0_pMesgCount <= `BSV_ASSIGNMENT_DELAY wsi_M0_pMesgCount$D_IN;
	if (wsi_M0_peerIsReady$EN)
	  wsi_M0_peerIsReady <= `BSV_ASSIGNMENT_DELAY wsi_M0_peerIsReady$D_IN;
	if (wsi_M0_reqFifo_c_r$EN)
	  wsi_M0_reqFifo_c_r <= `BSV_ASSIGNMENT_DELAY wsi_M0_reqFifo_c_r$D_IN;
	if (wsi_M0_reqFifo_q_0$EN)
	  wsi_M0_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY wsi_M0_reqFifo_q_0$D_IN;
	if (wsi_M0_reqFifo_q_1$EN)
	  wsi_M0_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY wsi_M0_reqFifo_q_1$D_IN;
	if (wsi_M0_sThreadBusy_d$EN)
	  wsi_M0_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      wsi_M0_sThreadBusy_d$D_IN;
	if (wsi_M0_tBusyCount$EN)
	  wsi_M0_tBusyCount <= `BSV_ASSIGNMENT_DELAY wsi_M0_tBusyCount$D_IN;
	if (wsi_M0_trafficSticky$EN)
	  wsi_M0_trafficSticky <= `BSV_ASSIGNMENT_DELAY
	      wsi_M0_trafficSticky$D_IN;
	if (wsi_M1_burstKind$EN)
	  wsi_M1_burstKind <= `BSV_ASSIGNMENT_DELAY wsi_M1_burstKind$D_IN;
	if (wsi_M1_errorSticky$EN)
	  wsi_M1_errorSticky <= `BSV_ASSIGNMENT_DELAY wsi_M1_errorSticky$D_IN;
	if (wsi_M1_iMesgCount$EN)
	  wsi_M1_iMesgCount <= `BSV_ASSIGNMENT_DELAY wsi_M1_iMesgCount$D_IN;
	if (wsi_M1_operateD$EN)
	  wsi_M1_operateD <= `BSV_ASSIGNMENT_DELAY wsi_M1_operateD$D_IN;
	if (wsi_M1_pMesgCount$EN)
	  wsi_M1_pMesgCount <= `BSV_ASSIGNMENT_DELAY wsi_M1_pMesgCount$D_IN;
	if (wsi_M1_peerIsReady$EN)
	  wsi_M1_peerIsReady <= `BSV_ASSIGNMENT_DELAY wsi_M1_peerIsReady$D_IN;
	if (wsi_M1_reqFifo_c_r$EN)
	  wsi_M1_reqFifo_c_r <= `BSV_ASSIGNMENT_DELAY wsi_M1_reqFifo_c_r$D_IN;
	if (wsi_M1_reqFifo_q_0$EN)
	  wsi_M1_reqFifo_q_0 <= `BSV_ASSIGNMENT_DELAY wsi_M1_reqFifo_q_0$D_IN;
	if (wsi_M1_reqFifo_q_1$EN)
	  wsi_M1_reqFifo_q_1 <= `BSV_ASSIGNMENT_DELAY wsi_M1_reqFifo_q_1$D_IN;
	if (wsi_M1_sThreadBusy_d$EN)
	  wsi_M1_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      wsi_M1_sThreadBusy_d$D_IN;
	if (wsi_M1_tBusyCount$EN)
	  wsi_M1_tBusyCount <= `BSV_ASSIGNMENT_DELAY wsi_M1_tBusyCount$D_IN;
	if (wsi_M1_trafficSticky$EN)
	  wsi_M1_trafficSticky <= `BSV_ASSIGNMENT_DELAY
	      wsi_M1_trafficSticky$D_IN;
	if (wsi_S0_burstKind$EN)
	  wsi_S0_burstKind <= `BSV_ASSIGNMENT_DELAY wsi_S0_burstKind$D_IN;
	if (wsi_S0_errorSticky$EN)
	  wsi_S0_errorSticky <= `BSV_ASSIGNMENT_DELAY wsi_S0_errorSticky$D_IN;
	if (wsi_S0_iMesgCount$EN)
	  wsi_S0_iMesgCount <= `BSV_ASSIGNMENT_DELAY wsi_S0_iMesgCount$D_IN;
	if (wsi_S0_operateD$EN)
	  wsi_S0_operateD <= `BSV_ASSIGNMENT_DELAY wsi_S0_operateD$D_IN;
	if (wsi_S0_pMesgCount$EN)
	  wsi_S0_pMesgCount <= `BSV_ASSIGNMENT_DELAY wsi_S0_pMesgCount$D_IN;
	if (wsi_S0_peerIsReady$EN)
	  wsi_S0_peerIsReady <= `BSV_ASSIGNMENT_DELAY wsi_S0_peerIsReady$D_IN;
	if (wsi_S0_reqFifo_countReg$EN)
	  wsi_S0_reqFifo_countReg <= `BSV_ASSIGNMENT_DELAY
	      wsi_S0_reqFifo_countReg$D_IN;
	if (wsi_S0_reqFifo_levelsValid$EN)
	  wsi_S0_reqFifo_levelsValid <= `BSV_ASSIGNMENT_DELAY
	      wsi_S0_reqFifo_levelsValid$D_IN;
	if (wsi_S0_tBusyCount$EN)
	  wsi_S0_tBusyCount <= `BSV_ASSIGNMENT_DELAY wsi_S0_tBusyCount$D_IN;
	if (wsi_S0_trafficSticky$EN)
	  wsi_S0_trafficSticky <= `BSV_ASSIGNMENT_DELAY
	      wsi_S0_trafficSticky$D_IN;
	if (wsi_S0_wordCount$EN)
	  wsi_S0_wordCount <= `BSV_ASSIGNMENT_DELAY wsi_S0_wordCount$D_IN;
	if (wsi_S1_burstKind$EN)
	  wsi_S1_burstKind <= `BSV_ASSIGNMENT_DELAY wsi_S1_burstKind$D_IN;
	if (wsi_S1_errorSticky$EN)
	  wsi_S1_errorSticky <= `BSV_ASSIGNMENT_DELAY wsi_S1_errorSticky$D_IN;
	if (wsi_S1_iMesgCount$EN)
	  wsi_S1_iMesgCount <= `BSV_ASSIGNMENT_DELAY wsi_S1_iMesgCount$D_IN;
	if (wsi_S1_operateD$EN)
	  wsi_S1_operateD <= `BSV_ASSIGNMENT_DELAY wsi_S1_operateD$D_IN;
	if (wsi_S1_pMesgCount$EN)
	  wsi_S1_pMesgCount <= `BSV_ASSIGNMENT_DELAY wsi_S1_pMesgCount$D_IN;
	if (wsi_S1_peerIsReady$EN)
	  wsi_S1_peerIsReady <= `BSV_ASSIGNMENT_DELAY wsi_S1_peerIsReady$D_IN;
	if (wsi_S1_reqFifo_countReg$EN)
	  wsi_S1_reqFifo_countReg <= `BSV_ASSIGNMENT_DELAY
	      wsi_S1_reqFifo_countReg$D_IN;
	if (wsi_S1_reqFifo_levelsValid$EN)
	  wsi_S1_reqFifo_levelsValid <= `BSV_ASSIGNMENT_DELAY
	      wsi_S1_reqFifo_levelsValid$D_IN;
	if (wsi_S1_tBusyCount$EN)
	  wsi_S1_tBusyCount <= `BSV_ASSIGNMENT_DELAY wsi_S1_tBusyCount$D_IN;
	if (wsi_S1_trafficSticky$EN)
	  wsi_S1_trafficSticky <= `BSV_ASSIGNMENT_DELAY
	      wsi_S1_trafficSticky$D_IN;
	if (wsi_S1_wordCount$EN)
	  wsi_S1_wordCount <= `BSV_ASSIGNMENT_DELAY wsi_S1_wordCount$D_IN;
      end
    if (wsi_M0_statusR$EN)
      wsi_M0_statusR <= `BSV_ASSIGNMENT_DELAY wsi_M0_statusR$D_IN;
    if (wsi_M1_statusR$EN)
      wsi_M1_statusR <= `BSV_ASSIGNMENT_DELAY wsi_M1_statusR$D_IN;
    if (wsi_S0_mesgWordLength$EN)
      wsi_S0_mesgWordLength <= `BSV_ASSIGNMENT_DELAY
	  wsi_S0_mesgWordLength$D_IN;
    if (wsi_S0_statusR$EN)
      wsi_S0_statusR <= `BSV_ASSIGNMENT_DELAY wsi_S0_statusR$D_IN;
    if (wsi_S1_mesgWordLength$EN)
      wsi_S1_mesgWordLength <= `BSV_ASSIGNMENT_DELAY
	  wsi_S1_mesgWordLength$D_IN;
    if (wsi_S1_statusR$EN)
      wsi_S1_statusR <= `BSV_ASSIGNMENT_DELAY wsi_S1_statusR$D_IN;
  end
  always@(posedge wciS0_Clk or `BSV_RESET_EDGE wciS0_MReset_n)
  if (wciS0_MReset_n == `BSV_RESET_VALUE)
    begin
      wci_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wsi_M0_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wsi_M1_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wsi_S0_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wsi_S1_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (wci_isReset_isInReset$EN)
	wci_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wci_isReset_isInReset$D_IN;
      if (wsi_M0_isReset_isInReset$EN)
	wsi_M0_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wsi_M0_isReset_isInReset$D_IN;
      if (wsi_M1_isReset_isInReset$EN)
	wsi_M1_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wsi_M1_isReset_isInReset$D_IN;
      if (wsi_S0_isReset_isInReset$EN)
	wsi_S0_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wsi_S0_isReset_isInReset$D_IN;
      if (wsi_S1_isReset_isInReset$EN)
	wsi_S1_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wsi_S1_isReset_isInReset$D_IN;
    end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    splitCtrl = 32'hAAAAAAAA;
    wci_cEdge = 3'h2;
    wci_cState = 3'h2;
    wci_ctlAckReg = 1'h0;
    wci_ctlOpActive = 1'h0;
    wci_illegalEdge = 1'h0;
    wci_isReset_isInReset = 1'h0;
    wci_nState = 3'h2;
    wci_reqF_countReg = 2'h2;
    wci_respF_c_r = 2'h2;
    wci_respF_q_0 = 34'h2AAAAAAAA;
    wci_respF_q_1 = 34'h2AAAAAAAA;
    wci_sFlagReg = 1'h0;
    wci_sThreadBusy_d = 1'h0;
    wsi_M0_burstKind = 2'h2;
    wsi_M0_errorSticky = 1'h0;
    wsi_M0_iMesgCount = 32'hAAAAAAAA;
    wsi_M0_isReset_isInReset = 1'h0;
    wsi_M0_operateD = 1'h0;
    wsi_M0_pMesgCount = 32'hAAAAAAAA;
    wsi_M0_peerIsReady = 1'h0;
    wsi_M0_reqFifo_c_r = 2'h2;
    wsi_M0_reqFifo_q_0 = 97'h0AAAAAAAAAAAAAAAAAAAAAAAA;
    wsi_M0_reqFifo_q_1 = 97'h0AAAAAAAAAAAAAAAAAAAAAAAA;
    wsi_M0_sThreadBusy_d = 1'h0;
    wsi_M0_statusR = 8'hAA;
    wsi_M0_tBusyCount = 32'hAAAAAAAA;
    wsi_M0_trafficSticky = 1'h0;
    wsi_M1_burstKind = 2'h2;
    wsi_M1_errorSticky = 1'h0;
    wsi_M1_iMesgCount = 32'hAAAAAAAA;
    wsi_M1_isReset_isInReset = 1'h0;
    wsi_M1_operateD = 1'h0;
    wsi_M1_pMesgCount = 32'hAAAAAAAA;
    wsi_M1_peerIsReady = 1'h0;
    wsi_M1_reqFifo_c_r = 2'h2;
    wsi_M1_reqFifo_q_0 = 97'h0AAAAAAAAAAAAAAAAAAAAAAAA;
    wsi_M1_reqFifo_q_1 = 97'h0AAAAAAAAAAAAAAAAAAAAAAAA;
    wsi_M1_sThreadBusy_d = 1'h0;
    wsi_M1_statusR = 8'hAA;
    wsi_M1_tBusyCount = 32'hAAAAAAAA;
    wsi_M1_trafficSticky = 1'h0;
    wsi_S0_burstKind = 2'h2;
    wsi_S0_errorSticky = 1'h0;
    wsi_S0_iMesgCount = 32'hAAAAAAAA;
    wsi_S0_isReset_isInReset = 1'h0;
    wsi_S0_mesgWordLength = 12'hAAA;
    wsi_S0_operateD = 1'h0;
    wsi_S0_pMesgCount = 32'hAAAAAAAA;
    wsi_S0_peerIsReady = 1'h0;
    wsi_S0_reqFifo_countReg = 2'h2;
    wsi_S0_reqFifo_levelsValid = 1'h0;
    wsi_S0_statusR = 8'hAA;
    wsi_S0_tBusyCount = 32'hAAAAAAAA;
    wsi_S0_trafficSticky = 1'h0;
    wsi_S0_wordCount = 12'hAAA;
    wsi_S1_burstKind = 2'h2;
    wsi_S1_errorSticky = 1'h0;
    wsi_S1_iMesgCount = 32'hAAAAAAAA;
    wsi_S1_isReset_isInReset = 1'h0;
    wsi_S1_mesgWordLength = 12'hAAA;
    wsi_S1_operateD = 1'h0;
    wsi_S1_pMesgCount = 32'hAAAAAAAA;
    wsi_S1_peerIsReady = 1'h0;
    wsi_S1_reqFifo_countReg = 2'h2;
    wsi_S1_reqFifo_levelsValid = 1'h0;
    wsi_S1_statusR = 8'hAA;
    wsi_S1_tBusyCount = 32'hAAAAAAAA;
    wsi_S1_trafficSticky = 1'h0;
    wsi_S1_wordCount = 12'hAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge wciS0_Clk)
  begin
    #0;
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_start)
	begin
	  v__h3698 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3698,
		 wci_reqF$D_OUT[36:34],
		 wci_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/inf/WsiSplitter2x2.bsv\", line 48, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/inf/WsiSplitter2x2.bsv\", line 48, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/inf/WsiSplitter2x2.bsv\", line 48, column 60: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	begin
	  v__h16289 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	$display("[%0d]: %m: WCI CONFIG WRITE Addr:%0x BE:%0x Data:%0x",
		 v__h16289,
		 wci_reqF$D_OUT[63:32],
		 wci_reqF$D_OUT[67:64],
		 wci_reqF$D_OUT[31:0]);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	begin
	  v__h4017 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h4017,
		 wci_cEdge,
		 wci_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	begin
	  v__h3873 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h3873,
		 wci_cEdge,
		 wci_cState,
		 wci_nState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	begin
	  v__h16444 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	$display("[%0d]: %m: WCI CONFIG READ Addr:%0x BE:%0x Data:%0x",
		 v__h16444,
		 wci_reqF$D_OUT[63:32],
		 wci_reqF$D_OUT[67:64],
		 _theResult____h16428);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/inf/WsiSplitter2x2.bsv\", line 48, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/inf/WsiSplitter2x2.bsv\", line 48, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/inf/WsiSplitter2x2.bsv\", line 48, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/inf/WsiSplitter2x2.bsv\", line 48, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and [RL_wci_cfrd] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/inf/WsiSplitter2x2.bsv\", line 48, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/inf/WsiSplitter2x2.bsv\", line 48, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/inf/WsiSplitter2x2.bsv\", line 48, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
  end
  // synopsys translate_on
endmodule