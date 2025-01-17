module outputs
  wire [31 : 0] wciS0_SData;
  wire [11 : 0] dac0_dan,
		dac0_dap,
		dac0_dbn,
		dac0_dbp,
		dac0_dcn,
		dac0_dcp,
		dac0_ddn,
		dac0_ddp;
  wire [1 : 0] wciS0_SFlag, wciS0_SResp;
  wire CLK_GATE_dac0_dacSdrClk,
       CLK_dac0_dacSdrClk,
       RST_N_dac0_dacSdrRst,
       dac0_dacCal,
       dac0_dacClkDiv,
       dac0_dacDelay,
       dac0_dacRf,
       dac0_dacRz,
       dac0_syncMuten,
       dac0_syncMutep,
       dac0_syncOutn,
       dac0_syncOutp,
       wciS0_SThreadBusy,
       wsiS0_SReset_n,
       wsiS0_SThreadBusy,
       wtiS0_SReset_n,
       wtiS0_SThreadBusy;
  // inlined wires
  wire [191 : 0] dacCore0_sampF_wDataIn$wget, dacCore0_sampF_wDataOut$wget;
  wire [95 : 0] wsiS_extStatusW$wget;
  wire [71 : 0] wci_wslv_wciReq$wget;
  wire [66 : 0] wti_wtiReq$wget;
  wire [60 : 0] wsiS_wsiReq$wget;
  wire [33 : 0] wci_wslv_respF_x_wire$wget;
  wire [31 : 0] wci_wci_Es_mAddr_w$wget,
		wci_wci_Es_mData_w$wget,
		wsi_Es_mData_w$wget;
  wire [15 : 0] fcDac_grayCounter_wdCounterCrossing$wget;
  wire [11 : 0] wsi_Es_mBurstLength_w$wget;
  wire [10 : 0] dacCore0_sampF_rRdPtr_wdCounterCrossing$wget,
		dacCore0_sampF_rWrPtr_wdCounterCrossing$wget;
  wire [7 : 0] wsi_Es_mReqInfo_w$wget;
  wire [3 : 0] dacCore0_dacCtrl_s$wget,
	       wci_wci_Es_mByteEn_w$wget,
	       wsi_Es_mByteEn_w$wget;
  wire [2 : 0] wci_wci_Es_mCmd_w$wget,
	       wci_wslv_wEdge$wget,
	       wsi_Es_mCmd_w$wget;
  wire dacCore0_ddrSDrv_dcmLock$wget,
       dacCore0_emitEn_pw$whas,
       dacCore0_iseqFsm_abort$wget,
       dacCore0_iseqFsm_abort$whas,
       dacCore0_iseqFsm_start_reg_1_1$wget,
       dacCore0_iseqFsm_start_reg_1_1$whas,
       dacCore0_iseqFsm_start_wire$wget,
       dacCore0_iseqFsm_start_wire$whas,
       dacCore0_iseqFsm_state_fired_1$wget,
       dacCore0_iseqFsm_state_fired_1$whas,
       dacCore0_iseqFsm_state_overlap_pw$whas,
       dacCore0_iseqFsm_state_set_pw$whas,
       dacCore0_sampF_pwDequeue$whas,
       dacCore0_sampF_pwEnqueue$whas,
       dacCore0_sampF_rRdPtr_pwDecrement$whas,
       dacCore0_sampF_rRdPtr_pwIncrement$whas,
       dacCore0_sampF_rWrPtr_pwDecrement$whas,
       dacCore0_sampF_rWrPtr_pwIncrement$whas,
       dacCore0_sampF_wDataIn$whas,
       dacCore0_sampF_wDataOut$whas,
       dacCore0_toneEn_pw$whas,
       fcDac_grayCounter_pwDecrement$whas,
       fcDac_grayCounter_pwIncrement$whas,
       fcDac_pulseAction_1$wget,
       fcDac_pulseAction_1$whas,
       oneKHz_decAction$whas,
       oneKHz_incAction$whas,
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
       wsi_Es_mReqLast_w$whas,
       wti_operateD_1$wget,
       wti_operateD_1$whas,
       wti_wtiReq$whas;
  // register dacControl
  reg [31 : 0] dacControl;
  wire [31 : 0] dacControl$D_IN;
  wire dacControl$EN;
  // register dacCore0_calBit
  reg dacCore0_calBit;
  wire dacCore0_calBit$D_IN, dacCore0_calBit$EN;
  // register dacCore0_dacCount
  reg [7 : 0] dacCore0_dacCount;
  wire [7 : 0] dacCore0_dacCount$D_IN;
  wire dacCore0_dacCount$EN;
  // register dacCore0_dacCtrl_w
  reg [3 : 0] dacCore0_dacCtrl_w;
  wire [3 : 0] dacCore0_dacCtrl_w$D_IN;
  wire dacCore0_dacCtrl_w$EN;
  // register dacCore0_ddrSDrv_isReset_isInReset
  reg dacCore0_ddrSDrv_isReset_isInReset;
  wire dacCore0_ddrSDrv_isReset_isInReset$D_IN,
       dacCore0_ddrSDrv_isReset_isInReset$EN;
  // register dacCore0_emit
  reg dacCore0_emit;
  wire dacCore0_emit$D_IN, dacCore0_emit$EN;
  // register dacCore0_emitCnt
  reg [31 : 0] dacCore0_emitCnt;
  wire [31 : 0] dacCore0_emitCnt$D_IN;
  wire dacCore0_emitCnt$EN;
  // register dacCore0_emitD
  reg dacCore0_emitD;
  wire dacCore0_emitD$D_IN, dacCore0_emitD$EN;
  // register dacCore0_iseqFsm_jj_delay_count
  reg [12 : 0] dacCore0_iseqFsm_jj_delay_count;
  wire [12 : 0] dacCore0_iseqFsm_jj_delay_count$D_IN;
  wire dacCore0_iseqFsm_jj_delay_count$EN;
  // register dacCore0_iseqFsm_start_reg
  reg dacCore0_iseqFsm_start_reg;
  wire dacCore0_iseqFsm_start_reg$D_IN, dacCore0_iseqFsm_start_reg$EN;
  // register dacCore0_iseqFsm_start_reg_1
  reg dacCore0_iseqFsm_start_reg_1;
  wire dacCore0_iseqFsm_start_reg_1$D_IN, dacCore0_iseqFsm_start_reg_1$EN;
  // register dacCore0_iseqFsm_state_can_overlap
  reg dacCore0_iseqFsm_state_can_overlap;
  wire dacCore0_iseqFsm_state_can_overlap$D_IN,
       dacCore0_iseqFsm_state_can_overlap$EN;
  // register dacCore0_iseqFsm_state_fired
  reg dacCore0_iseqFsm_state_fired;
  wire dacCore0_iseqFsm_state_fired$D_IN, dacCore0_iseqFsm_state_fired$EN;
  // register dacCore0_iseqFsm_state_mkFSMstate
  reg [3 : 0] dacCore0_iseqFsm_state_mkFSMstate;
  reg [3 : 0] dacCore0_iseqFsm_state_mkFSMstate$D_IN;
  wire dacCore0_iseqFsm_state_mkFSMstate$EN;
  // register dacCore0_muteDAC
  reg dacCore0_muteDAC;
  wire dacCore0_muteDAC$D_IN, dacCore0_muteDAC$EN;
  // register dacCore0_sampF_rRdPtr_rdCounter
  reg [10 : 0] dacCore0_sampF_rRdPtr_rdCounter;
  wire [10 : 0] dacCore0_sampF_rRdPtr_rdCounter$D_IN;
  wire dacCore0_sampF_rRdPtr_rdCounter$EN;
  // register dacCore0_sampF_rRdPtr_rdCounterPre
  reg [10 : 0] dacCore0_sampF_rRdPtr_rdCounterPre;
  wire [10 : 0] dacCore0_sampF_rRdPtr_rdCounterPre$D_IN;
  wire dacCore0_sampF_rRdPtr_rdCounterPre$EN;
  // register dacCore0_sampF_rRdPtr_rsCounter
  reg [10 : 0] dacCore0_sampF_rRdPtr_rsCounter;
  wire [10 : 0] dacCore0_sampF_rRdPtr_rsCounter$D_IN;
  wire dacCore0_sampF_rRdPtr_rsCounter$EN;
  // register dacCore0_sampF_rWrPtr_rdCounter
  reg [10 : 0] dacCore0_sampF_rWrPtr_rdCounter;
  wire [10 : 0] dacCore0_sampF_rWrPtr_rdCounter$D_IN;
  wire dacCore0_sampF_rWrPtr_rdCounter$EN;
  // register dacCore0_sampF_rWrPtr_rdCounterPre
  reg [10 : 0] dacCore0_sampF_rWrPtr_rdCounterPre;
  wire [10 : 0] dacCore0_sampF_rWrPtr_rdCounterPre$D_IN;
  wire dacCore0_sampF_rWrPtr_rdCounterPre$EN;
  // register dacCore0_sampF_rWrPtr_rsCounter
  reg [10 : 0] dacCore0_sampF_rWrPtr_rsCounter;
  wire [10 : 0] dacCore0_sampF_rWrPtr_rsCounter$D_IN;
  wire dacCore0_sampF_rWrPtr_rsCounter$EN;
  // register dacCore0_syncMute
  reg dacCore0_syncMute;
  wire dacCore0_syncMute$D_IN, dacCore0_syncMute$EN;
  // register dacCore0_syncOut
  reg dacCore0_syncOut;
  wire dacCore0_syncOut$D_IN, dacCore0_syncOut$EN;
  // register dacCore0_tone
  reg dacCore0_tone;
  wire dacCore0_tone$D_IN, dacCore0_tone$EN;
  // register dacCore0_undCount
  reg [31 : 0] dacCore0_undCount;
  wire [31 : 0] dacCore0_undCount$D_IN;
  wire dacCore0_undCount$EN;
  // register fcDac_countNow
  reg [15 : 0] fcDac_countNow;
  wire [15 : 0] fcDac_countNow$D_IN;
  wire fcDac_countNow$EN;
  // register fcDac_countPast
  reg [15 : 0] fcDac_countPast;
  wire [15 : 0] fcDac_countPast$D_IN;
  wire fcDac_countPast$EN;
  // register fcDac_frequency
  reg [15 : 0] fcDac_frequency;
  wire [15 : 0] fcDac_frequency$D_IN;
  wire fcDac_frequency$EN;
  // register fcDac_grayCounter_rdCounter
  reg [15 : 0] fcDac_grayCounter_rdCounter;
  wire [15 : 0] fcDac_grayCounter_rdCounter$D_IN;
  wire fcDac_grayCounter_rdCounter$EN;
  // register fcDac_grayCounter_rdCounterPre
  reg [15 : 0] fcDac_grayCounter_rdCounterPre;
  wire [15 : 0] fcDac_grayCounter_rdCounterPre$D_IN;
  wire fcDac_grayCounter_rdCounterPre$EN;
  // register fcDac_grayCounter_rsCounter
  reg [15 : 0] fcDac_grayCounter_rsCounter;
  wire [15 : 0] fcDac_grayCounter_rsCounter$D_IN;
  wire fcDac_grayCounter_rsCounter$EN;
  // register fcDac_pulseAction
  reg fcDac_pulseAction;
  wire fcDac_pulseAction$D_IN, fcDac_pulseAction$EN;
  // register fcDac_sampleCount
  reg [15 : 0] fcDac_sampleCount;
  wire [15 : 0] fcDac_sampleCount$D_IN;
  wire fcDac_sampleCount$EN;
  // register firstUnderflowMesg
  reg [31 : 0] firstUnderflowMesg;
  wire [31 : 0] firstUnderflowMesg$D_IN;
  wire firstUnderflowMesg$EN;
  // register hasUnderflowed
  reg hasUnderflowed;
  wire hasUnderflowed$D_IN, hasUnderflowed$EN;
  // register initOpInFlight
  reg initOpInFlight;
  wire initOpInFlight$D_IN, initOpInFlight$EN;
  // register mesgStart
  reg [31 : 0] mesgStart;
  wire [31 : 0] mesgStart$D_IN;
  wire mesgStart$EN;
  // register oneKHz_value
  reg [17 : 0] oneKHz_value;
  wire [17 : 0] oneKHz_value$D_IN;
  wire oneKHz_value$EN;
  // register opcode
  reg [8 : 0] opcode;
  wire [8 : 0] opcode$D_IN;
  wire opcode$EN;
  // register rf
  reg [11 : 0] rf;
  wire [11 : 0] rf$D_IN;
  wire rf$EN;
  // register rf_1
  reg [11 : 0] rf_1;
  wire [11 : 0] rf_1$D_IN;
  wire rf_1$EN;
  // register rf_10
  reg [11 : 0] rf_10;
  wire [11 : 0] rf_10$D_IN;
  wire rf_10$EN;
  // register rf_11
  reg [11 : 0] rf_11;
  wire [11 : 0] rf_11$D_IN;
  wire rf_11$EN;
  // register rf_12
  reg [11 : 0] rf_12;
  wire [11 : 0] rf_12$D_IN;
  wire rf_12$EN;
  // register rf_13
  reg [11 : 0] rf_13;
  wire [11 : 0] rf_13$D_IN;
  wire rf_13$EN;
  // register rf_14
  reg [11 : 0] rf_14;
  wire [11 : 0] rf_14$D_IN;
  wire rf_14$EN;
  // register rf_15
  reg [11 : 0] rf_15;
  wire [11 : 0] rf_15$D_IN;
  wire rf_15$EN;
  // register rf_2
  reg [11 : 0] rf_2;
  wire [11 : 0] rf_2$D_IN;
  wire rf_2$EN;
  // register rf_3
  reg [11 : 0] rf_3;
  wire [11 : 0] rf_3$D_IN;
  wire rf_3$EN;
  // register rf_4
  reg [11 : 0] rf_4;
  wire [11 : 0] rf_4$D_IN;
  wire rf_4$EN;
  // register rf_5
  reg [11 : 0] rf_5;
  wire [11 : 0] rf_5$D_IN;
  wire rf_5$EN;
  // register rf_6
  reg [11 : 0] rf_6;
  wire [11 : 0] rf_6$D_IN;
  wire rf_6$EN;
  // register rf_7
  reg [11 : 0] rf_7;
  wire [11 : 0] rf_7$D_IN;
  wire rf_7$EN;
  // register rf_8
  reg [11 : 0] rf_8;
  wire [11 : 0] rf_8$D_IN;
  wire rf_8$EN;
  // register rf_9
  reg [11 : 0] rf_9;
  wire [11 : 0] rf_9$D_IN;
  wire rf_9$EN;
  // register sFlagState
  reg sFlagState;
  wire sFlagState$D_IN, sFlagState$EN;
  // register splitReadInFlight
  reg splitReadInFlight;
  wire splitReadInFlight$D_IN, splitReadInFlight$EN;
  // register srcCnt
  reg [1 : 0] srcCnt;
  wire [1 : 0] srcCnt$D_IN;
  wire srcCnt$EN;
  // register stageCount
  reg [31 : 0] stageCount;
  wire [31 : 0] stageCount$D_IN;
  wire stageCount$EN;
  // register syncCount
  reg [31 : 0] syncCount;
  wire [31 : 0] syncCount$D_IN;
  wire syncCount$EN;
  // register takeEven
  reg takeEven;
  wire takeEven$D_IN, takeEven$EN;
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
  // register wordsConsumed
  reg [7 : 0] wordsConsumed;
  wire [7 : 0] wordsConsumed$D_IN;
  wire wordsConsumed$EN;
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
  // register wti_isReset_isInReset
  reg wti_isReset_isInReset;
  wire wti_isReset_isInReset$D_IN, wti_isReset_isInReset$EN;
  // register wti_nowReq
  reg [66 : 0] wti_nowReq;
  wire [66 : 0] wti_nowReq$D_IN;
  wire wti_nowReq$EN;
  // register wti_operateD
  reg wti_operateD;
  wire wti_operateD$D_IN, wti_operateD$EN;
  // ports of submodule dacCore0_dcmLck_cc
  wire dacCore0_dcmLck_cc$dD_OUT,
       dacCore0_dcmLck_cc$sD_IN,
       dacCore0_dcmLck_cc$sEN;
  // ports of submodule dacCore0_ddrSDrv_ddrV
  wire [11 : 0] dacCore0_ddrSDrv_ddrV$dan,
		dacCore0_ddrSDrv_ddrV$dap,
		dacCore0_ddrSDrv_ddrV$dbn,
		dacCore0_ddrSDrv_ddrV$dbp,
		dacCore0_ddrSDrv_ddrV$dcn,
		dacCore0_ddrSDrv_ddrV$dcp,
		dacCore0_ddrSDrv_ddrV$ddn,
		dacCore0_ddrSDrv_ddrV$ddp,
		dacCore0_ddrSDrv_ddrV$sdrData0,
		dacCore0_ddrSDrv_ddrV$sdrData1,
		dacCore0_ddrSDrv_ddrV$sdrData2,
		dacCore0_ddrSDrv_ddrV$sdrData3,
		dacCore0_ddrSDrv_ddrV$sdrData4,
		dacCore0_ddrSDrv_ddrV$sdrData5,
		dacCore0_ddrSDrv_ddrV$sdrData6,
		dacCore0_ddrSDrv_ddrV$sdrData7,
		dacCore0_ddrSDrv_ddrV$sdrData8,
		dacCore0_ddrSDrv_ddrV$sdrData9,
		dacCore0_ddrSDrv_ddrV$sdrDataA,
		dacCore0_ddrSDrv_ddrV$sdrDataB,
		dacCore0_ddrSDrv_ddrV$sdrDataC,
		dacCore0_ddrSDrv_ddrV$sdrDataD,
		dacCore0_ddrSDrv_ddrV$sdrDataE,
		dacCore0_ddrSDrv_ddrV$sdrDataF;
  wire dacCore0_ddrSDrv_ddrV$dcmLocked, dacCore0_ddrSDrv_ddrV$sdrClk;
  // ports of submodule dacCore0_emitCntCC
  wire [31 : 0] dacCore0_emitCntCC$dD_OUT, dacCore0_emitCntCC$sD_IN;
  wire dacCore0_emitCntCC$sEN, dacCore0_emitCntCC$sRDY;
  // ports of submodule dacCore0_emitEn_d
  wire dacCore0_emitEn_d$dD_OUT,
       dacCore0_emitEn_d$sD_IN,
       dacCore0_emitEn_d$sEN;
  // ports of submodule dacCore0_iSeqDone
  wire dacCore0_iSeqDone$dD_OUT,
       dacCore0_iSeqDone$sD_IN,
       dacCore0_iSeqDone$sEN;
  // ports of submodule dacCore0_sampF_memory
  wire [191 : 0] dacCore0_sampF_memory$DIA,
		 dacCore0_sampF_memory$DIB,
		 dacCore0_sampF_memory$DOB;
  wire [9 : 0] dacCore0_sampF_memory$ADDRA, dacCore0_sampF_memory$ADDRB;
  wire dacCore0_sampF_memory$ENA,
       dacCore0_sampF_memory$ENB,
       dacCore0_sampF_memory$WEA,
       dacCore0_sampF_memory$WEB;
  // ports of submodule dacCore0_sdrRst
  wire dacCore0_sdrRst$OUT_RST;
  // ports of submodule dacCore0_startIseqF
  wire dacCore0_startIseqF$dDEQ,
       dacCore0_startIseqF$sD_IN,
       dacCore0_startIseqF$sENQ,
       dacCore0_startIseqF$sFULL_N;
  // ports of submodule dacCore0_syncMute_obuf
  wire dacCore0_syncMute_obuf$I,
       dacCore0_syncMute_obuf$O,
       dacCore0_syncMute_obuf$OB;
  // ports of submodule dacCore0_syncOut_obuf
  wire dacCore0_syncOut_obuf$I,
       dacCore0_syncOut_obuf$O,
       dacCore0_syncOut_obuf$OB;
  // ports of submodule dacCore0_toneEn_d
  wire dacCore0_toneEn_d$dD_OUT,
       dacCore0_toneEn_d$sD_IN,
       dacCore0_toneEn_d$sEN;
  // ports of submodule dacCore0_undCountCC
  wire [31 : 0] dacCore0_undCountCC$dD_OUT, dacCore0_undCountCC$sD_IN;
  wire dacCore0_undCountCC$sEN, dacCore0_undCountCC$sRDY;
  // ports of submodule fcDac_testRst
  wire fcDac_testRst$OUT_RST;
  // ports of submodule stageF
  wire [31 : 0] stageF$D_IN, stageF$D_OUT;
  wire stageF$CLR, stageF$DEQ, stageF$EMPTY_N, stageF$ENQ, stageF$FULL_N;
  // ports of submodule wci_wslv_reqF
  wire [71 : 0] wci_wslv_reqF$D_IN, wci_wslv_reqF$D_OUT;
  wire wci_wslv_reqF$CLR,
       wci_wslv_reqF$DEQ,
       wci_wslv_reqF$EMPTY_N,
       wci_wslv_reqF$ENQ;
  // ports of submodule wsiS_reqFifo
  wire [60 : 0] wsiS_reqFifo$D_IN, wsiS_reqFifo$D_OUT;
  wire wsiS_reqFifo$CLR,
       wsiS_reqFifo$DEQ,
       wsiS_reqFifo$EMPTY_N,
       wsiS_reqFifo$ENQ,
       wsiS_reqFifo$FULL_N;
  // rule scheduling signals
  wire WILL_FIRE_RL_dacCore0_iseqFsm_action_l100c13,
       WILL_FIRE_RL_dacCore0_iseqFsm_action_l102c10,
       WILL_FIRE_RL_dacCore0_iseqFsm_action_l105c13,
       WILL_FIRE_RL_dacCore0_iseqFsm_action_np,
       WILL_FIRE_RL_dacCore0_iseqFsm_fsm_start,
       WILL_FIRE_RL_dacCore0_iseqFsm_idle_l99c15,
       WILL_FIRE_RL_emit_mesgConsume,
       WILL_FIRE_RL_init_complete_ok,
       WILL_FIRE_RL_process_staged_data,
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
       WILL_FIRE_RL_wsiS_reqFifo_enq,
       WILL_FIRE_RL_wsiS_reqFifo_reset;
  // inputs to muxes for submodule ports
  reg [33 : 0] MUX_wci_wslv_respF_q_0$write_1__VAL_2;
  wire [33 : 0] MUX_wci_wslv_respF_q_0$write_1__VAL_1,
		MUX_wci_wslv_respF_q_1$write_1__VAL_1,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_1,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_2;
  wire [17 : 0] MUX_oneKHz_value$write_1__VAL_1;
  wire [15 : 0] MUX_fcDac_grayCounter_rsCounter$write_1__VAL_1;
  wire [12 : 0] MUX_dacCore0_iseqFsm_jj_delay_count$write_1__VAL_1;
  wire [11 : 0] MUX_dacCore0_ddrSDrv_ddrV$sdr0_1__VAL_1,
		MUX_dacCore0_ddrSDrv_ddrV$sdr0_1__VAL_2,
		MUX_dacCore0_ddrSDrv_ddrV$sdr1_1__VAL_1,
		MUX_dacCore0_ddrSDrv_ddrV$sdr1_1__VAL_2,
		MUX_dacCore0_ddrSDrv_ddrV$sdr2_1__VAL_1,
		MUX_dacCore0_ddrSDrv_ddrV$sdr2_1__VAL_2,
		MUX_dacCore0_ddrSDrv_ddrV$sdr3_1__VAL_1,
		MUX_dacCore0_ddrSDrv_ddrV$sdr4_1__VAL_1,
		MUX_dacCore0_ddrSDrv_ddrV$sdr4_1__VAL_2,
		MUX_dacCore0_ddrSDrv_ddrV$sdr5_1__VAL_1,
		MUX_dacCore0_ddrSDrv_ddrV$sdr5_1__VAL_2,
		MUX_dacCore0_ddrSDrv_ddrV$sdr6_1__VAL_1,
		MUX_dacCore0_ddrSDrv_ddrV$sdr6_1__VAL_2,
		MUX_dacCore0_ddrSDrv_ddrV$sdr7_1__VAL_1,
		MUX_dacCore0_ddrSDrv_ddrV$sdr7_1__VAL_2,
		MUX_dacCore0_ddrSDrv_ddrV$sdr8_1__VAL_2,
		MUX_dacCore0_ddrSDrv_ddrV$sdr9_1__VAL_2,
		MUX_dacCore0_ddrSDrv_ddrV$sdrA_1__VAL_2,
		MUX_dacCore0_ddrSDrv_ddrV$sdrB_1__VAL_1,
		MUX_dacCore0_ddrSDrv_ddrV$sdrC_1__VAL_2,
		MUX_dacCore0_ddrSDrv_ddrV$sdrD_1__VAL_2,
		MUX_dacCore0_ddrSDrv_ddrV$sdrE_1__VAL_2,
		MUX_dacCore0_ddrSDrv_ddrV$sdrF_1__VAL_1,
		MUX_dacCore0_ddrSDrv_ddrV$sdrF_1__VAL_2;
  wire [10 : 0] MUX_dacCore0_sampF_rRdPtr_rsCounter$write_1__VAL_1,
		MUX_dacCore0_sampF_rWrPtr_rsCounter$write_1__VAL_1;
  wire [8 : 0] MUX_opcode$write_1__VAL_2;
  wire [1 : 0] MUX_wci_wslv_respF_c_r$write_1__VAL_1,
	       MUX_wci_wslv_respF_c_r$write_1__VAL_2;
  wire MUX_opcode$write_1__SEL_1,
       MUX_opcode$write_1__SEL_2,
       MUX_wci_wslv_illegalEdge$write_1__SEL_1,
       MUX_wci_wslv_illegalEdge$write_1__VAL_1,
       MUX_wci_wslv_respF_q_0$write_1__SEL_2,
       MUX_wci_wslv_respF_q_1$write_1__SEL_2;
  // remaining internal signals
  reg [63 : 0] v__h3702, v__h3877, v__h4021, v__h75623, v__h75780;
  reg [31 : 0] CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1;
  wire [31 : 0] IF_dacCore0_sampF_rRdPtr_rsCounter_33_BIT_0_40_ETC___d1111,
		IF_dacCore0_sampF_rRdPtr_rsCounter_33_BIT_0_40_ETC___d1112,
		IF_dacCore0_sampF_rWrPtr_rsCounter_64_BIT_0_71_ETC___d1108,
		IF_dacCore0_sampF_rWrPtr_rsCounter_64_BIT_0_71_ETC___d1109,
		IF_fcDac_grayCounter_rsCounter_81_BIT_0_88_OR__ETC___d1115,
		IF_fcDac_grayCounter_rsCounter_81_BIT_0_88_XOR_ETC___d1116,
		_theResult____h75764,
		dacStatusLs__h75699,
		rdat__h75871,
		rdat__h75948,
		result__h66758;
  wire [15 : 0] x__h57357, y__h58614;
  wire [10 : 0] dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011,
		x__h18426,
		x__h6959,
		x__h9261,
		x_dReadBin__h11074,
		x_sReadBin__h11071,
		y__h10148,
		y__h7846;
  wire [9 : 0] x2__h18395;
  wire [5 : 0] x__h75926;
  wire NOT_dacCore0_sampF_rWrPtr_rsCounter_64_EQ_dacC_ETC___d1092,
       dacCore0_iseqFsm_abort_whas__60_AND_dacCore0_i_ETC___d417,
       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1000,
       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1001,
       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1002,
       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1008,
       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1009,
       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1026,
       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1027,
       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1028,
       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d999,
       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_0_40_XO_ETC___d1064,
       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1004,
       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1010,
       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1012,
       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1017,
       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1018,
       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1019,
       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1031,
       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d991,
       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d992,
       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d993,
       dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133,
       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_0_71_XO_ETC___d1063,
       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1003,
       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1013,
       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1014,
       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1015,
       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1016,
       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d987,
       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d988,
       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d989,
       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d990,
       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1005,
       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1006,
       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1007,
       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1020,
       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1021,
       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1022,
       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1023,
       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1024,
       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1025,
       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d994,
       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d995,
       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d996,
       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d997,
       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d998,
       fcDac_grayCounter_rsCounter_81_BIT_0_88_XOR_fc_ETC___d1065,
       z__h10192,
       z__h10199,
       z__h10206,
       z__h10213,
       z__h10220,
       z__h10227,
       z__h10234,
       z__h10241,
       z__h10248,
       z__h57377,
       z__h57384,
       z__h57391,
       z__h57398,
       z__h57405,
       z__h57412,
       z__h57419,
       z__h57426,
       z__h57433,
       z__h57440,
       z__h57447,
       z__h57454,
       z__h57461,
       z__h57468,
       z__h7890,
       z__h7897,
       z__h7904,
       z__h7911,
       z__h7918,
       z__h7925,
       z__h7932,
       z__h7939,
       z__h7946;
  // oscillator and gates for output clock CLK_dac0_dacSdrClk
  assign CLK_dac0_dacSdrClk = dacCore0_ddrSDrv_ddrV$sdrClk ;
  assign CLK_GATE_dac0_dacSdrClk = 1'b1 ;
  // output resets
  assign RST_N_dac0_dacSdrRst = dacCore0_sdrRst$OUT_RST ;
  // value method wciS0_sResp
  assign wciS0_SResp = wci_wslv_respF_q_0[33:32] ;
  // value method wciS0_sData
  assign wciS0_SData = wci_wslv_respF_q_0[31:0] ;
  // value method wciS0_sThreadBusy
  assign wciS0_SThreadBusy =
	     wci_wslv_reqF_countReg > 2'd1 || wci_wslv_isReset_isInReset ;
  // value method wciS0_sFlag
  assign wciS0_SFlag = { 1'd1, wci_wslv_sFlagReg } ;
  // value method wtiS0_sThreadBusy
  assign wtiS0_SThreadBusy = wti_isReset_isInReset ;
  // value method wtiS0_sReset_n
  assign wtiS0_SReset_n = !wti_isReset_isInReset && wti_operateD ;
  // value method wsiS0_sThreadBusy
  assign wsiS0_SThreadBusy =
	     !wsiS_sThreadBusy_dw$whas || wsiS_sThreadBusy_dw$wget ;
  // value method wsiS0_sReset_n
  assign wsiS0_SReset_n = !wsiS_isReset_isInReset && wsiS_operateD ;
  // value method dac0_dap
  assign dac0_dap = dacCore0_ddrSDrv_ddrV$dap ;
  // value method dac0_dan
  assign dac0_dan = dacCore0_ddrSDrv_ddrV$dan ;
  // value method dac0_dbp
  assign dac0_dbp = dacCore0_ddrSDrv_ddrV$dbp ;
  // value method dac0_dbn
  assign dac0_dbn = dacCore0_ddrSDrv_ddrV$dbn ;
  // value method dac0_dcp
  assign dac0_dcp = dacCore0_ddrSDrv_ddrV$dcp ;
  // value method dac0_dcn
  assign dac0_dcn = dacCore0_ddrSDrv_ddrV$dcn ;
  // value method dac0_ddp
  assign dac0_ddp = dacCore0_ddrSDrv_ddrV$ddp ;
  // value method dac0_ddn
  assign dac0_ddn = dacCore0_ddrSDrv_ddrV$ddn ;
  // value method dac0_dacClkDiv
  assign dac0_dacClkDiv = dacCore0_dacCtrl_w[3] ;
  // value method dac0_dacDelay
  assign dac0_dacDelay = dacCore0_dacCtrl_w[2] ;
  // value method dac0_dacRf
  assign dac0_dacRf = dacCore0_dacCtrl_w[0] ;
  // value method dac0_dacRz
  assign dac0_dacRz = dacCore0_dacCtrl_w[1] ;
  // value method dac0_dacCal
  assign dac0_dacCal = dacCore0_calBit ;
  // value method dac0_syncOutp
  assign dac0_syncOutp = dacCore0_syncOut_obuf$O ;
  // value method dac0_syncOutn
  assign dac0_syncOutn = dacCore0_syncOut_obuf$OB ;
  // value method dac0_syncMutep
  assign dac0_syncMutep = dacCore0_syncMute_obuf$O ;
  // value method dac0_syncMuten
  assign dac0_syncMuten = dacCore0_syncMute_obuf$OB ;
  // submodule dacCore0_dcmLck_cc
  SyncBit #(.init(1'd0)) dacCore0_dcmLck_cc(.sCLK(dacCore0_ddrSDrv_ddrV$sdrClk),
					    .dCLK(wciS0_Clk),
					    .sRST(dacCore0_sdrRst$OUT_RST),
					    .sD_IN(dacCore0_dcmLck_cc$sD_IN),
					    .sEN(dacCore0_dcmLck_cc$sEN),
					    .dD_OUT(dacCore0_dcmLck_cc$dD_OUT));
  // submodule dacCore0_ddrSDrv_ddrV
  ddrOutput2 dacCore0_ddrSDrv_ddrV(.dcmResetN(wciS0_MReset_n),
				   .ddrClk(CLK_dac_clk),
				   .sdrData0(dacCore0_ddrSDrv_ddrV$sdrData0),
				   .sdrData1(dacCore0_ddrSDrv_ddrV$sdrData1),
				   .sdrData2(dacCore0_ddrSDrv_ddrV$sdrData2),
				   .sdrData3(dacCore0_ddrSDrv_ddrV$sdrData3),
				   .sdrData4(dacCore0_ddrSDrv_ddrV$sdrData4),
				   .sdrData5(dacCore0_ddrSDrv_ddrV$sdrData5),
				   .sdrData6(dacCore0_ddrSDrv_ddrV$sdrData6),
				   .sdrData7(dacCore0_ddrSDrv_ddrV$sdrData7),
				   .sdrData8(dacCore0_ddrSDrv_ddrV$sdrData8),
				   .sdrData9(dacCore0_ddrSDrv_ddrV$sdrData9),
				   .sdrDataA(dacCore0_ddrSDrv_ddrV$sdrDataA),
				   .sdrDataB(dacCore0_ddrSDrv_ddrV$sdrDataB),
				   .sdrDataC(dacCore0_ddrSDrv_ddrV$sdrDataC),
				   .sdrDataD(dacCore0_ddrSDrv_ddrV$sdrDataD),
				   .sdrDataE(dacCore0_ddrSDrv_ddrV$sdrDataE),
				   .sdrDataF(dacCore0_ddrSDrv_ddrV$sdrDataF),
				   .ddp(dacCore0_ddrSDrv_ddrV$ddp),
				   .ddn(dacCore0_ddrSDrv_ddrV$ddn),
				   .dcmLocked(dacCore0_ddrSDrv_ddrV$dcmLocked),
				   .dap(dacCore0_ddrSDrv_ddrV$dap),
				   .dan(dacCore0_ddrSDrv_ddrV$dan),
				   .dbp(dacCore0_ddrSDrv_ddrV$dbp),
				   .dbn(dacCore0_ddrSDrv_ddrV$dbn),
				   .dcp(dacCore0_ddrSDrv_ddrV$dcp),
				   .dcn(dacCore0_ddrSDrv_ddrV$dcn),
				   .sdrClk(dacCore0_ddrSDrv_ddrV$sdrClk));
  // submodule dacCore0_emitCntCC
  SyncRegister #(.width(32'd32),
		 .init(32'd0)) dacCore0_emitCntCC(.sCLK(dacCore0_ddrSDrv_ddrV$sdrClk),
						  .dCLK(wciS0_Clk),
						  .sRST(dacCore0_sdrRst$OUT_RST),
						  .sD_IN(dacCore0_emitCntCC$sD_IN),
						  .sEN(dacCore0_emitCntCC$sEN),
						  .dD_OUT(dacCore0_emitCntCC$dD_OUT),
						  .sRDY(dacCore0_emitCntCC$sRDY));
  // submodule dacCore0_emitEn_d
  SyncBit #(.init(1'd0)) dacCore0_emitEn_d(.sCLK(wciS0_Clk),
					   .dCLK(dacCore0_ddrSDrv_ddrV$sdrClk),
					   .sRST(wciS0_MReset_n),
					   .sD_IN(dacCore0_emitEn_d$sD_IN),
					   .sEN(dacCore0_emitEn_d$sEN),
					   .dD_OUT(dacCore0_emitEn_d$dD_OUT));
  // submodule dacCore0_iSeqDone
  SyncBit #(.init(1'd0)) dacCore0_iSeqDone(.sCLK(dacCore0_ddrSDrv_ddrV$sdrClk),
					   .dCLK(wciS0_Clk),
					   .sRST(dacCore0_sdrRst$OUT_RST),
					   .sD_IN(dacCore0_iSeqDone$sD_IN),
					   .sEN(dacCore0_iSeqDone$sEN),
					   .dD_OUT(dacCore0_iSeqDone$dD_OUT));
  // submodule dacCore0_sampF_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd10),
	  .DATA_WIDTH(32'd192),
	  .MEMSIZE(11'd1024)) dacCore0_sampF_memory(.CLKA(wciS0_Clk),
						    .CLKB(dacCore0_ddrSDrv_ddrV$sdrClk),
						    .ADDRA(dacCore0_sampF_memory$ADDRA),
						    .ADDRB(dacCore0_sampF_memory$ADDRB),
						    .DIA(dacCore0_sampF_memory$DIA),
						    .DIB(dacCore0_sampF_memory$DIB),
						    .WEA(dacCore0_sampF_memory$WEA),
						    .WEB(dacCore0_sampF_memory$WEB),
						    .ENA(dacCore0_sampF_memory$ENA),
						    .ENB(dacCore0_sampF_memory$ENB),
						    .DOA(),
						    .DOB(dacCore0_sampF_memory$DOB));
  // submodule dacCore0_sdrRst
  SyncResetA #(.RSTDELAY(32'd0)) dacCore0_sdrRst(.CLK(dacCore0_ddrSDrv_ddrV$sdrClk),
						 .IN_RST(wciS0_MReset_n),
						 .OUT_RST(dacCore0_sdrRst$OUT_RST));
  // submodule dacCore0_startIseqF
  SyncFIFO #(.dataWidth(32'd1),
	     .depth(32'd2),
	     .indxWidth(32'd1)) dacCore0_startIseqF(.sCLK(wciS0_Clk),
						    .dCLK(dacCore0_ddrSDrv_ddrV$sdrClk),
						    .sRST(wciS0_MReset_n),
						    .sD_IN(dacCore0_startIseqF$sD_IN),
						    .sENQ(dacCore0_startIseqF$sENQ),
						    .dDEQ(dacCore0_startIseqF$dDEQ),
						    .dD_OUT(),
						    .sFULL_N(dacCore0_startIseqF$sFULL_N),
						    .dEMPTY_N());
  // submodule dacCore0_syncMute_obuf
  OBUFDS dacCore0_syncMute_obuf(.I(dacCore0_syncMute_obuf$I),
				.O(dacCore0_syncMute_obuf$O),
				.OB(dacCore0_syncMute_obuf$OB));
  // submodule dacCore0_syncOut_obuf
  OBUFDS dacCore0_syncOut_obuf(.I(dacCore0_syncOut_obuf$I),
			       .O(dacCore0_syncOut_obuf$O),
			       .OB(dacCore0_syncOut_obuf$OB));
  // submodule dacCore0_toneEn_d
  SyncBit #(.init(1'd0)) dacCore0_toneEn_d(.sCLK(wciS0_Clk),
					   .dCLK(dacCore0_ddrSDrv_ddrV$sdrClk),
					   .sRST(wciS0_MReset_n),
					   .sD_IN(dacCore0_toneEn_d$sD_IN),
					   .sEN(dacCore0_toneEn_d$sEN),
					   .dD_OUT(dacCore0_toneEn_d$dD_OUT));
  // submodule dacCore0_undCountCC
  SyncRegister #(.width(32'd32),
		 .init(32'd0)) dacCore0_undCountCC(.sCLK(dacCore0_ddrSDrv_ddrV$sdrClk),
						   .dCLK(wciS0_Clk),
						   .sRST(dacCore0_sdrRst$OUT_RST),
						   .sD_IN(dacCore0_undCountCC$sD_IN),
						   .sEN(dacCore0_undCountCC$sEN),
						   .dD_OUT(dacCore0_undCountCC$dD_OUT),
						   .sRDY(dacCore0_undCountCC$sRDY));
  // submodule fcDac_testRst
  SyncResetA #(.RSTDELAY(32'd1)) fcDac_testRst(.CLK(dacCore0_ddrSDrv_ddrV$sdrClk),
					       .IN_RST(wciS0_MReset_n),
					       .OUT_RST(fcDac_testRst$OUT_RST));
  // submodule stageF
  FIFO2 #(.width(32'd32), .guarded(32'd1)) stageF(.RST(wciS0_MReset_n),
						  .CLK(wciS0_Clk),
						  .D_IN(stageF$D_IN),
						  .ENQ(stageF$ENQ),
						  .DEQ(stageF$DEQ),
						  .CLR(stageF$CLR),
						  .D_OUT(stageF$D_OUT),
						  .FULL_N(stageF$FULL_N),
						  .EMPTY_N(stageF$EMPTY_N));
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
  // rule RL_wci_wslv_ctl_op_start
  assign WILL_FIRE_RL_wci_wslv_ctl_op_start =
	     wci_wslv_reqF$EMPTY_N && wci_wslv_wci_ctrl_pw$whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_ctrl_IsO
  assign WILL_FIRE_RL_wci_ctrl_IsO =
	     wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     (wci_wslv_cState == 3'd1 || wci_wslv_cState == 3'd3) &&
	     wci_wslv_reqF$D_OUT[36:34] == 3'd1 ;
  // rule RL_wci_ctrl_OrE
  assign WILL_FIRE_RL_wci_ctrl_OrE =
	     wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd2 &&
	     wci_wslv_reqF$D_OUT[36:34] == 3'd3 ;
  // rule RL_dacCore0_iseqFsm_action_l102c10
  assign WILL_FIRE_RL_dacCore0_iseqFsm_action_l102c10 =
	     dacCore0_ddrSDrv_ddrV$dcmLocked &&
	     dacCore0_iseqFsm_state_mkFSMstate == 4'd2 ;
  // rule RL_dacCore0_iseqFsm_action_np
  assign WILL_FIRE_RL_dacCore0_iseqFsm_action_np =
	     dacCore0_iseqFsm_jj_delay_count != 13'd4095 &&
	     (dacCore0_iseqFsm_state_mkFSMstate == 4'd5 ||
	      dacCore0_iseqFsm_state_mkFSMstate == 4'd6) ;
  // rule RL_dacCore0_iseqFsm_action_l105c13
  assign WILL_FIRE_RL_dacCore0_iseqFsm_action_l105c13 =
	     dacCore0_iseqFsm_jj_delay_count == 13'd4095 &&
	     (dacCore0_iseqFsm_state_mkFSMstate == 4'd5 ||
	      dacCore0_iseqFsm_state_mkFSMstate == 4'd6) ;
  // rule RL_dacCore0_iseqFsm_fsm_start
  assign WILL_FIRE_RL_dacCore0_iseqFsm_fsm_start =
	     dacCore0_iseqFsm_abort_whas__60_AND_dacCore0_i_ETC___d417 &&
	     dacCore0_iseqFsm_start_reg ;
  // rule RL_dacCore0_iseqFsm_action_l100c13
  assign WILL_FIRE_RL_dacCore0_iseqFsm_action_l100c13 =
	     dacCore0_iseqFsm_start_wire$whas &&
	     (dacCore0_iseqFsm_state_mkFSMstate == 4'd0 ||
	      dacCore0_iseqFsm_state_mkFSMstate == 4'd7) ;
  // rule RL_dacCore0_iseqFsm_idle_l99c15
  assign WILL_FIRE_RL_dacCore0_iseqFsm_idle_l99c15 =
	     !dacCore0_iseqFsm_start_wire$whas &&
	     dacCore0_iseqFsm_state_mkFSMstate == 4'd7 ;
  // rule RL_emit_mesgConsume
  assign WILL_FIRE_RL_emit_mesgConsume =
	     wsiS_reqFifo$EMPTY_N && stageF$FULL_N &&
	     wci_wslv_cState == 3'd2 &&
	     opcode[8] ;
  // rule RL_wci_cfrd
  assign WILL_FIRE_RL_wci_cfrd =
	     wci_wslv_respF_c_r != 2'd2 && wci_wslv_reqF$EMPTY_N &&
	     wci_wslv_wci_cfrd_pw$whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_process_staged_data
  assign WILL_FIRE_RL_process_staged_data =
	     stageF$EMPTY_N &&
	     (dacControl[5] ?
		NOT_dacCore0_sampF_rWrPtr_rsCounter_64_EQ_dacC_ETC___d1092 :
		srcCnt != 2'h3 ||
		NOT_dacCore0_sampF_rWrPtr_rsCounter_64_EQ_dacC_ETC___d1092) &&
	     wci_wslv_cState == 3'd2 ;
  // rule RL_wci_cfwr
  assign WILL_FIRE_RL_wci_cfwr =
	     wci_wslv_respF_c_r != 2'd2 && wci_wslv_reqF$EMPTY_N &&
	     wci_wslv_wci_cfwr_pw$whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_init_complete_ok
  assign WILL_FIRE_RL_init_complete_ok =
	     initOpInFlight && dacCore0_iSeqDone$dD_OUT ;
  // rule RL_wci_ctrl_EiI
  assign WILL_FIRE_RL_wci_ctrl_EiI =
	     dacCore0_startIseqF$sFULL_N && wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd0 &&
	     wci_wslv_reqF$D_OUT[36:34] == 3'd0 ;
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
	     WILL_FIRE_RL_wsiS_reqFifo_enq || WILL_FIRE_RL_emit_mesgConsume ;
  // inputs to muxes for submodule ports
  assign MUX_opcode$write_1__SEL_1 =
	     WILL_FIRE_RL_emit_mesgConsume && wsiS_reqFifo$D_OUT[57] ;
  assign MUX_opcode$write_1__SEL_2 =
	     wsiS_reqFifo$EMPTY_N && wci_wslv_cState == 3'd2 && !opcode[8] ;
  assign MUX_wci_wslv_illegalEdge$write_1__SEL_1 =
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
  assign MUX_wci_wslv_respF_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd0 ;
  assign MUX_wci_wslv_respF_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd1 ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr0_1__VAL_1 =
	     dacCore0_tone ? 12'd3902 : 12'd2048 ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr0_1__VAL_2 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[11:0] ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr1_1__VAL_1 =
	     dacCore0_tone ? 12'd3467 : 12'd2048 ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr1_1__VAL_2 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[23:12] ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr2_1__VAL_1 =
	     dacCore0_tone ? 12'd2816 : 12'd2048 ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr2_1__VAL_2 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[35:24] ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr3_1__VAL_1 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[47:36] ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr4_1__VAL_1 =
	     dacCore0_tone ? 12'd1280 : 12'd2048 ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr4_1__VAL_2 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[59:48] ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr5_1__VAL_1 =
	     dacCore0_tone ? 12'd629 : 12'd2048 ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr5_1__VAL_2 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[71:60] ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr6_1__VAL_1 =
	     dacCore0_tone ? 12'd194 : 12'd2048 ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr6_1__VAL_2 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[83:72] ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr7_1__VAL_1 =
	     dacCore0_tone ? 12'd41 : 12'd2048 ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr7_1__VAL_2 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[95:84] ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr8_1__VAL_2 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[107:96] ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdr9_1__VAL_2 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[119:108] ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdrA_1__VAL_2 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[131:120] ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdrB_1__VAL_1 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[143:132] ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdrC_1__VAL_2 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[155:144] ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdrD_1__VAL_2 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[167:156] ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdrE_1__VAL_2 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[179:168] ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdrF_1__VAL_1 =
	     dacCore0_tone ? 12'd4055 : 12'd2048 ;
  assign MUX_dacCore0_ddrSDrv_ddrV$sdrF_1__VAL_2 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ?
	       12'd2048 :
	       dacCore0_sampF_memory$DOB[191:180] ;
  assign MUX_dacCore0_iseqFsm_jj_delay_count$write_1__VAL_1 =
	     dacCore0_iseqFsm_jj_delay_count + 13'd1 ;
  assign MUX_dacCore0_sampF_rRdPtr_rsCounter$write_1__VAL_1 =
	     (~dacCore0_sampF_rRdPtr_rsCounter[IF_dacCore0_sampF_rRdPtr_rsCounter_33_BIT_0_40_ETC___d1111[3:0]]) ?
	       dacCore0_sampF_rRdPtr_rsCounter | x__h9261 :
	       dacCore0_sampF_rRdPtr_rsCounter & y__h10148 ;
  assign MUX_dacCore0_sampF_rWrPtr_rsCounter$write_1__VAL_1 =
	     (~dacCore0_sampF_rWrPtr_rsCounter[IF_dacCore0_sampF_rWrPtr_rsCounter_64_BIT_0_71_ETC___d1108[3:0]]) ?
	       dacCore0_sampF_rWrPtr_rsCounter | x__h6959 :
	       dacCore0_sampF_rWrPtr_rsCounter & y__h7846 ;
  assign MUX_fcDac_grayCounter_rsCounter$write_1__VAL_1 =
	     (~fcDac_grayCounter_rsCounter[IF_fcDac_grayCounter_rsCounter_81_BIT_0_88_XOR_ETC___d1116[3:0]]) ?
	       fcDac_grayCounter_rsCounter | x__h57357 :
	       fcDac_grayCounter_rsCounter & y__h58614 ;
  assign MUX_oneKHz_value$write_1__VAL_1 =
	     (oneKHz_value == 18'd124999) ? 18'd0 : oneKHz_value + 18'd1 ;
  assign MUX_opcode$write_1__VAL_2 = { 1'd1, wsiS_reqFifo$D_OUT[7:0] } ;
  assign MUX_wci_wslv_illegalEdge$write_1__VAL_1 =
	     wci_wslv_reqF$D_OUT[36:34] != 3'd4 &&
	     wci_wslv_reqF$D_OUT[36:34] != 3'd5 &&
	     wci_wslv_reqF$D_OUT[36:34] != 3'd6 ;
  assign MUX_wci_wslv_respF_c_r$write_1__VAL_1 = wci_wslv_respF_c_r + 2'd1 ;
  assign MUX_wci_wslv_respF_c_r$write_1__VAL_2 = wci_wslv_respF_c_r - 2'd1 ;
  assign MUX_wci_wslv_respF_q_0$write_1__VAL_1 =
	     (wci_wslv_respF_c_r == 2'd1) ?
	       MUX_wci_wslv_respF_q_0$write_1__VAL_2 :
	       wci_wslv_respF_q_1 ;
  always@(WILL_FIRE_RL_wci_wslv_ctl_op_complete or
	  MUX_wci_wslv_respF_x_wire$wset_1__VAL_1 or
	  WILL_FIRE_RL_wci_cfrd or
	  MUX_wci_wslv_respF_x_wire$wset_1__VAL_2 or WILL_FIRE_RL_wci_cfwr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wci_wslv_ctl_op_complete:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_1;
      WILL_FIRE_RL_wci_cfrd:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_2;
      WILL_FIRE_RL_wci_cfwr:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 = 34'h1C0DE4201;
      default: MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign MUX_wci_wslv_respF_q_1$write_1__VAL_1 =
	     (wci_wslv_respF_c_r == 2'd2) ?
	       MUX_wci_wslv_respF_q_0$write_1__VAL_2 :
	       34'h0AAAAAAAA ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__VAL_1 =
	     wci_wslv_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__VAL_2 =
	     { 2'd1, _theResult____h75764 } ;
  // inlined wires
  assign wci_wslv_wciReq$wget =
	     { wciS0_MCmd,
	       wciS0_MAddrSpace,
	       wciS0_MByteEn,
	       wciS0_MAddr,
	       wciS0_MData } ;
  assign wci_wslv_wciReq$whas = 1'd1 ;
  assign wci_wslv_respF_x_wire$wget = MUX_wci_wslv_respF_q_0$write_1__VAL_2 ;
  assign wci_wslv_respF_x_wire$whas =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete || WILL_FIRE_RL_wci_cfrd ||
	     WILL_FIRE_RL_wci_cfwr ;
  assign wci_wslv_wEdge$wget = wci_wslv_reqF$D_OUT[36:34] ;
  assign wci_wslv_wEdge$whas = WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_sFlagReg_1$wget = 1'd1 ;
  assign wci_wslv_sFlagReg_1$whas = sFlagState ;
  assign wci_wslv_ctlAckReg_1$wget = 1'd1 ;
  assign wci_wslv_ctlAckReg_1$whas =
	     wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd2 &&
	     wci_wslv_reqF$D_OUT[36:34] == 3'd2 ||
	     WILL_FIRE_RL_init_complete_ok ||
	     WILL_FIRE_RL_wci_ctrl_OrE ||
	     WILL_FIRE_RL_wci_ctrl_IsO ;
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
  assign wti_wtiReq$wget = 67'h0 ;
  assign wti_wtiReq$whas = 1'b0 ;
  assign wti_operateD_1$wget = 1'b0 ;
  assign wti_operateD_1$whas = 1'b0 ;
  assign dacCore0_sampF_wDataIn$wget =
	     dacControl[5] ?
	       (takeEven ?
		  {16{stageF$D_OUT[15:4]}} :
		  {16{stageF$D_OUT[31:20]}}) :
	       { rf_15,
		 rf_14,
		 rf_13,
		 rf_12,
		 rf_11,
		 rf_10,
		 rf_9,
		 rf_8,
		 rf_7,
		 rf_6,
		 rf_5,
		 rf_4,
		 rf_3,
		 rf_2,
		 rf_1,
		 rf } ;
  assign dacCore0_sampF_wDataIn$whas = dacCore0_sampF_pwEnqueue$whas ;
  assign dacCore0_sampF_wDataOut$wget = dacCore0_sampF_memory$DOB ;
  assign dacCore0_sampF_wDataOut$whas = 1'd1 ;
  assign dacCore0_iseqFsm_start_wire$wget = 1'd1 ;
  assign dacCore0_iseqFsm_start_wire$whas =
	     WILL_FIRE_RL_dacCore0_iseqFsm_fsm_start ||
	     dacCore0_iseqFsm_start_reg_1 && !dacCore0_iseqFsm_state_fired ;
  assign dacCore0_iseqFsm_start_reg_1_1$wget = 1'd1 ;
  assign dacCore0_iseqFsm_start_reg_1_1$whas =
	     dacCore0_iseqFsm_start_wire$whas ;
  assign dacCore0_iseqFsm_abort$wget = 1'b0 ;
  assign dacCore0_iseqFsm_abort$whas = 1'b0 ;
  assign dacCore0_iseqFsm_state_fired_1$wget = 1'd1 ;
  assign dacCore0_iseqFsm_state_fired_1$whas =
	     dacCore0_iseqFsm_state_set_pw$whas ;
  assign fcDac_pulseAction_1$wget = 1'd1 ;
  assign fcDac_pulseAction_1$whas = oneKHz_value == 18'd124999 ;
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
  assign dacCore0_sampF_rWrPtr_pwIncrement$whas =
	     dacCore0_sampF_pwEnqueue$whas ;
  assign dacCore0_sampF_rWrPtr_pwDecrement$whas = 1'b0 ;
  assign dacCore0_sampF_rRdPtr_pwIncrement$whas =
	     dacCore0_sampF_pwDequeue$whas ;
  assign dacCore0_sampF_rRdPtr_pwDecrement$whas = 1'b0 ;
  assign dacCore0_sampF_pwDequeue$whas =
	     dacCore0_emit &&
	     !dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ;
  assign dacCore0_sampF_pwEnqueue$whas =
	     WILL_FIRE_RL_process_staged_data &&
	     (dacControl[5] || srcCnt == 2'h3) ;
  assign dacCore0_emitEn_pw$whas =
	     wci_wslv_cState == 3'd2 && dacControl[4] &&
	     wordsConsumed > 8'd127 ;
  assign dacCore0_toneEn_pw$whas = wci_wslv_cState == 3'd2 && dacControl[7] ;
  assign dacCore0_iseqFsm_state_set_pw$whas =
	     WILL_FIRE_RL_dacCore0_iseqFsm_idle_l99c15 ||
	     WILL_FIRE_RL_dacCore0_iseqFsm_action_l105c13 ||
	     WILL_FIRE_RL_dacCore0_iseqFsm_action_np ||
	     dacCore0_iseqFsm_state_mkFSMstate == 4'd4 ||
	     dacCore0_iseqFsm_state_mkFSMstate == 4'd3 ||
	     WILL_FIRE_RL_dacCore0_iseqFsm_action_l102c10 ||
	     dacCore0_iseqFsm_state_mkFSMstate == 4'd1 ||
	     WILL_FIRE_RL_dacCore0_iseqFsm_action_l100c13 ;
  assign dacCore0_iseqFsm_state_overlap_pw$whas = 1'b0 ;
  assign fcDac_grayCounter_pwIncrement$whas = 1'd1 ;
  assign fcDac_grayCounter_pwDecrement$whas = 1'b0 ;
  assign oneKHz_incAction$whas = 1'd1 ;
  assign oneKHz_decAction$whas = 1'b0 ;
  assign wsiS_reqFifo_r_enq$whas = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_r_deq$whas = WILL_FIRE_RL_emit_mesgConsume ;
  assign wsiS_reqFifo_r_clr$whas = 1'b0 ;
  assign wsiS_reqFifo_doResetEnq$whas = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_doResetDeq$whas = WILL_FIRE_RL_emit_mesgConsume ;
  assign wsiS_reqFifo_doResetClr$whas = 1'b0 ;
  assign wsi_Es_mReqLast_w$whas = wsiS0_MReqLast ;
  assign wsi_Es_mBurstPrecise_w$whas = wsiS0_MBurstPrecise ;
  assign wsi_Es_mDataInfo_w$whas = 1'd1 ;
  assign dacCore0_ddrSDrv_dcmLock$wget = dacCore0_ddrSDrv_ddrV$dcmLocked ;
  assign dacCore0_sampF_rWrPtr_wdCounterCrossing$wget =
	     dacCore0_sampF_rWrPtr_rsCounter ;
  assign dacCore0_sampF_rRdPtr_wdCounterCrossing$wget =
	     dacCore0_sampF_rRdPtr_rsCounter ;
  assign dacCore0_dacCtrl_s$wget = dacCore0_dacCtrl_w ;
  assign fcDac_grayCounter_wdCounterCrossing$wget =
	     fcDac_grayCounter_rsCounter ;
  assign wsiS_extStatusW$wget =
	     { wsiS_pMesgCount, wsiS_iMesgCount, wsiS_tBusyCount } ;
  // register dacControl
  assign dacControl$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign dacControl$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h0C ;
  // register dacCore0_calBit
  assign dacCore0_calBit$D_IN = dacCore0_iseqFsm_state_mkFSMstate != 4'd1 ;
  assign dacCore0_calBit$EN =
	     dacCore0_iseqFsm_state_mkFSMstate == 4'd1 ||
	     dacCore0_iseqFsm_state_mkFSMstate == 4'd3 ;
  // register dacCore0_dacCount
  assign dacCore0_dacCount$D_IN = dacCore0_dacCount + 8'd1 ;
  assign dacCore0_dacCount$EN = 1'd1 ;
  // register dacCore0_dacCtrl_w
  assign dacCore0_dacCtrl_w$D_IN = dacControl[3:0] ;
  assign dacCore0_dacCtrl_w$EN = 1'd1 ;
  // register dacCore0_ddrSDrv_isReset_isInReset
  assign dacCore0_ddrSDrv_isReset_isInReset$D_IN = 1'd0 ;
  assign dacCore0_ddrSDrv_isReset_isInReset$EN =
	     dacCore0_ddrSDrv_isReset_isInReset ;
  // register dacCore0_emit
  assign dacCore0_emit$D_IN = dacCore0_emitEn_d$dD_OUT ;
  assign dacCore0_emit$EN = 1'd1 ;
  // register dacCore0_emitCnt
  assign dacCore0_emitCnt$D_IN = dacCore0_emitCnt + 32'd1 ;
  assign dacCore0_emitCnt$EN = dacCore0_sampF_pwDequeue$whas ;
  // register dacCore0_emitD
  assign dacCore0_emitD$D_IN = dacCore0_emit ;
  assign dacCore0_emitD$EN = 1'd1 ;
  // register dacCore0_iseqFsm_jj_delay_count
  assign dacCore0_iseqFsm_jj_delay_count$D_IN =
	     WILL_FIRE_RL_dacCore0_iseqFsm_action_np ?
	       MUX_dacCore0_iseqFsm_jj_delay_count$write_1__VAL_1 :
	       13'd0 ;
  assign dacCore0_iseqFsm_jj_delay_count$EN =
	     WILL_FIRE_RL_dacCore0_iseqFsm_action_np ||
	     dacCore0_iseqFsm_state_mkFSMstate == 4'd4 ;
  // register dacCore0_iseqFsm_start_reg
  assign dacCore0_iseqFsm_start_reg$D_IN = 1'd0 ;
  assign dacCore0_iseqFsm_start_reg$EN =
	     WILL_FIRE_RL_dacCore0_iseqFsm_fsm_start ;
  // register dacCore0_iseqFsm_start_reg_1
  assign dacCore0_iseqFsm_start_reg_1$D_IN =
	     dacCore0_iseqFsm_start_wire$whas ;
  assign dacCore0_iseqFsm_start_reg_1$EN = 1'd1 ;
  // register dacCore0_iseqFsm_state_can_overlap
  assign dacCore0_iseqFsm_state_can_overlap$D_IN =
	     dacCore0_iseqFsm_state_set_pw$whas ||
	     dacCore0_iseqFsm_state_can_overlap ;
  assign dacCore0_iseqFsm_state_can_overlap$EN = 1'd1 ;
  // register dacCore0_iseqFsm_state_fired
  assign dacCore0_iseqFsm_state_fired$D_IN =
	     dacCore0_iseqFsm_state_set_pw$whas ;
  assign dacCore0_iseqFsm_state_fired$EN = 1'd1 ;
  // register dacCore0_iseqFsm_state_mkFSMstate
  always@(WILL_FIRE_RL_dacCore0_iseqFsm_idle_l99c15 or
	  WILL_FIRE_RL_dacCore0_iseqFsm_action_l100c13 or
	  dacCore0_iseqFsm_state_mkFSMstate or
	  WILL_FIRE_RL_dacCore0_iseqFsm_action_l102c10 or
	  WILL_FIRE_RL_dacCore0_iseqFsm_action_np or
	  WILL_FIRE_RL_dacCore0_iseqFsm_action_l105c13)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_dacCore0_iseqFsm_idle_l99c15:
	  dacCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd0;
      WILL_FIRE_RL_dacCore0_iseqFsm_action_l100c13:
	  dacCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd1;
      dacCore0_iseqFsm_state_mkFSMstate == 4'd1:
	  dacCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd2;
      WILL_FIRE_RL_dacCore0_iseqFsm_action_l102c10:
	  dacCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd3;
      dacCore0_iseqFsm_state_mkFSMstate == 4'd3:
	  dacCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd4;
      dacCore0_iseqFsm_state_mkFSMstate == 4'd4:
	  dacCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd5;
      WILL_FIRE_RL_dacCore0_iseqFsm_action_np:
	  dacCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd6;
      WILL_FIRE_RL_dacCore0_iseqFsm_action_l105c13:
	  dacCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd7;
      default: dacCore0_iseqFsm_state_mkFSMstate$D_IN =
		   4'b1010 /* unspecified value */ ;
    endcase
  end
  assign dacCore0_iseqFsm_state_mkFSMstate$EN =
	     WILL_FIRE_RL_dacCore0_iseqFsm_idle_l99c15 ||
	     WILL_FIRE_RL_dacCore0_iseqFsm_action_l100c13 ||
	     dacCore0_iseqFsm_state_mkFSMstate == 4'd1 ||
	     WILL_FIRE_RL_dacCore0_iseqFsm_action_l102c10 ||
	     dacCore0_iseqFsm_state_mkFSMstate == 4'd3 ||
	     dacCore0_iseqFsm_state_mkFSMstate == 4'd4 ||
	     WILL_FIRE_RL_dacCore0_iseqFsm_action_np ||
	     WILL_FIRE_RL_dacCore0_iseqFsm_action_l105c13 ;
  // register dacCore0_muteDAC
  assign dacCore0_muteDAC$D_IN =
	     !WILL_FIRE_RL_dacCore0_iseqFsm_action_l105c13 ;
  assign dacCore0_muteDAC$EN =
	     WILL_FIRE_RL_dacCore0_iseqFsm_action_l105c13 ||
	     WILL_FIRE_RL_dacCore0_iseqFsm_action_l100c13 ;
  // register dacCore0_sampF_rRdPtr_rdCounter
  assign dacCore0_sampF_rRdPtr_rdCounter$D_IN =
	     dacCore0_sampF_rRdPtr_rdCounterPre ;
  assign dacCore0_sampF_rRdPtr_rdCounter$EN = 1'd1 ;
  // register dacCore0_sampF_rRdPtr_rdCounterPre
  assign dacCore0_sampF_rRdPtr_rdCounterPre$D_IN =
	     dacCore0_sampF_rRdPtr_rsCounter ;
  assign dacCore0_sampF_rRdPtr_rdCounterPre$EN = 1'd1 ;
  // register dacCore0_sampF_rRdPtr_rsCounter
  assign dacCore0_sampF_rRdPtr_rsCounter$D_IN =
	     MUX_dacCore0_sampF_rRdPtr_rsCounter$write_1__VAL_1 ;
  assign dacCore0_sampF_rRdPtr_rsCounter$EN = dacCore0_sampF_pwDequeue$whas ;
  // register dacCore0_sampF_rWrPtr_rdCounter
  assign dacCore0_sampF_rWrPtr_rdCounter$D_IN =
	     dacCore0_sampF_rWrPtr_rdCounterPre ;
  assign dacCore0_sampF_rWrPtr_rdCounter$EN = 1'd1 ;
  // register dacCore0_sampF_rWrPtr_rdCounterPre
  assign dacCore0_sampF_rWrPtr_rdCounterPre$D_IN =
	     dacCore0_sampF_rWrPtr_rsCounter ;
  assign dacCore0_sampF_rWrPtr_rdCounterPre$EN = 1'd1 ;
  // register dacCore0_sampF_rWrPtr_rsCounter
  assign dacCore0_sampF_rWrPtr_rsCounter$D_IN =
	     MUX_dacCore0_sampF_rWrPtr_rsCounter$write_1__VAL_1 ;
  assign dacCore0_sampF_rWrPtr_rsCounter$EN = dacCore0_sampF_pwEnqueue$whas ;
  // register dacCore0_syncMute
  assign dacCore0_syncMute$D_IN = 1'b0 ;
  assign dacCore0_syncMute$EN = 1'b0 ;
  // register dacCore0_syncOut
  assign dacCore0_syncOut$D_IN = dacCore0_dacCount == 8'd0 ;
  assign dacCore0_syncOut$EN = 1'd1 ;
  // register dacCore0_tone
  assign dacCore0_tone$D_IN = dacCore0_toneEn_d$dD_OUT ;
  assign dacCore0_tone$EN = 1'd1 ;
  // register dacCore0_undCount
  assign dacCore0_undCount$D_IN = dacCore0_undCount + 32'd1 ;
  assign dacCore0_undCount$EN =
	     dacCore0_emit &&
	     dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 ;
  // register fcDac_countNow
  assign fcDac_countNow$D_IN =
	     { fcDac_grayCounter_rdCounter[15],
	       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1021,
	       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1020,
	       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1022,
	       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d994,
	       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d995,
	       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d998,
	       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1005,
	       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d996,
	       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1006,
	       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d997,
	       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1023,
	       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1025,
	       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1024,
	       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1007,
	       fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1007 ^
	       fcDac_grayCounter_rdCounter[0] } ;
  assign fcDac_countNow$EN = fcDac_pulseAction ;
  // register fcDac_countPast
  assign fcDac_countPast$D_IN = fcDac_countNow ;
  assign fcDac_countPast$EN = fcDac_pulseAction ;
  // register fcDac_frequency
  assign fcDac_frequency$D_IN = fcDac_countNow - fcDac_countPast ;
  assign fcDac_frequency$EN = fcDac_pulseAction ;
  // register fcDac_grayCounter_rdCounter
  assign fcDac_grayCounter_rdCounter$D_IN = fcDac_grayCounter_rdCounterPre ;
  assign fcDac_grayCounter_rdCounter$EN = 1'd1 ;
  // register fcDac_grayCounter_rdCounterPre
  assign fcDac_grayCounter_rdCounterPre$D_IN = fcDac_grayCounter_rsCounter ;
  assign fcDac_grayCounter_rdCounterPre$EN = 1'd1 ;
  // register fcDac_grayCounter_rsCounter
  assign fcDac_grayCounter_rsCounter$D_IN =
	     MUX_fcDac_grayCounter_rsCounter$write_1__VAL_1 ;
  assign fcDac_grayCounter_rsCounter$EN = 1'b1 ;
  // register fcDac_pulseAction
  assign fcDac_pulseAction$D_IN = oneKHz_value == 18'd124999 ;
  assign fcDac_pulseAction$EN = 1'd1 ;
  // register fcDac_sampleCount
  assign fcDac_sampleCount$D_IN = fcDac_sampleCount + 16'd1 ;
  assign fcDac_sampleCount$EN = fcDac_pulseAction ;
  // register firstUnderflowMesg
  assign firstUnderflowMesg$D_IN = mesgStart ;
  assign firstUnderflowMesg$EN =
	     wci_wslv_cState == 3'd2 && !hasUnderflowed &&
	     dacCore0_undCountCC$dD_OUT != 32'd0 ;
  // register hasUnderflowed
  assign hasUnderflowed$D_IN = 1'd1 ;
  assign hasUnderflowed$EN =
	     wci_wslv_cState == 3'd2 && !hasUnderflowed &&
	     dacCore0_undCountCC$dD_OUT != 32'd0 ;
  // register initOpInFlight
  assign initOpInFlight$D_IN = WILL_FIRE_RL_wci_ctrl_EiI ;
  assign initOpInFlight$EN =
	     WILL_FIRE_RL_init_complete_ok || WILL_FIRE_RL_wci_ctrl_EiI ;
  // register mesgStart
  assign mesgStart$D_IN = mesgStart + 32'd1 ;
  assign mesgStart$EN = MUX_opcode$write_1__SEL_2 ;
  // register oneKHz_value
  assign oneKHz_value$D_IN = MUX_oneKHz_value$write_1__VAL_1 ;
  assign oneKHz_value$EN = 1'b1 ;
  // register opcode
  assign opcode$D_IN =
	     MUX_opcode$write_1__SEL_1 ? 9'd170 : MUX_opcode$write_1__VAL_2 ;
  assign opcode$EN =
	     WILL_FIRE_RL_emit_mesgConsume && wsiS_reqFifo$D_OUT[57] ||
	     wsiS_reqFifo$EMPTY_N && wci_wslv_cState == 3'd2 && !opcode[8] ;
  // register rf
  assign rf$D_IN = stageF$D_OUT[15:4] ;
  assign rf$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h0 ;
  // register rf_1
  assign rf_1$D_IN = stageF$D_OUT[15:4] ;
  assign rf_1$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h0 ;
  // register rf_10
  assign rf_10$D_IN = stageF$D_OUT[31:20] ;
  assign rf_10$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h2 ;
  // register rf_11
  assign rf_11$D_IN = stageF$D_OUT[31:20] ;
  assign rf_11$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h2 ;
  // register rf_12
  assign rf_12$D_IN = stageF$D_OUT[15:4] ;
  assign rf_12$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h3 ;
  // register rf_13
  assign rf_13$D_IN = stageF$D_OUT[15:4] ;
  assign rf_13$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h3 ;
  // register rf_14
  assign rf_14$D_IN = stageF$D_OUT[31:20] ;
  assign rf_14$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h3 ;
  // register rf_15
  assign rf_15$D_IN = stageF$D_OUT[31:20] ;
  assign rf_15$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h3 ;
  // register rf_2
  assign rf_2$D_IN = stageF$D_OUT[31:20] ;
  assign rf_2$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h0 ;
  // register rf_3
  assign rf_3$D_IN = stageF$D_OUT[31:20] ;
  assign rf_3$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h0 ;
  // register rf_4
  assign rf_4$D_IN = stageF$D_OUT[15:4] ;
  assign rf_4$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h1 ;
  // register rf_5
  assign rf_5$D_IN = stageF$D_OUT[15:4] ;
  assign rf_5$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h1 ;
  // register rf_6
  assign rf_6$D_IN = stageF$D_OUT[31:20] ;
  assign rf_6$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h1 ;
  // register rf_7
  assign rf_7$D_IN = stageF$D_OUT[31:20] ;
  assign rf_7$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h1 ;
  // register rf_8
  assign rf_8$D_IN = stageF$D_OUT[15:4] ;
  assign rf_8$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h2 ;
  // register rf_9
  assign rf_9$D_IN = stageF$D_OUT[15:4] ;
  assign rf_9$EN =
	     WILL_FIRE_RL_process_staged_data && !dacControl[5] &&
	     srcCnt == 2'h2 ;
  // register sFlagState
  assign sFlagState$D_IN = 1'b0 ;
  assign sFlagState$EN = 1'b0 ;
  // register splitReadInFlight
  assign splitReadInFlight$D_IN = 1'b0 ;
  assign splitReadInFlight$EN = 1'b0 ;
  // register srcCnt
  assign srcCnt$D_IN = srcCnt + 2'd1 ;
  assign srcCnt$EN = WILL_FIRE_RL_process_staged_data && !dacControl[5] ;
  // register stageCount
  assign stageCount$D_IN = stageCount + 32'd1 ;
  assign stageCount$EN = dacCore0_sampF_pwEnqueue$whas ;
  // register syncCount
  assign syncCount$D_IN = 32'h0 ;
  assign syncCount$EN = 1'b0 ;
  // register takeEven
  assign takeEven$D_IN = !takeEven ;
  assign takeEven$EN = WILL_FIRE_RL_process_staged_data && dacControl[5] ;
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
	     MUX_wci_wslv_illegalEdge$write_1__SEL_1 &&
	     MUX_wci_wslv_illegalEdge$write_1__VAL_1 ;
  assign wci_wslv_illegalEdge$EN =
	     MUX_wci_wslv_illegalEdge$write_1__SEL_1 ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge ;
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
  always@(WILL_FIRE_RL_wci_wslv_respF_both or
	  MUX_wci_wslv_respF_q_0$write_1__VAL_1 or
	  MUX_wci_wslv_respF_q_0$write_1__SEL_2 or
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wci_wslv_respF_decCtr or wci_wslv_respF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wci_wslv_respF_both:
	  wci_wslv_respF_q_0$D_IN = MUX_wci_wslv_respF_q_0$write_1__VAL_1;
      MUX_wci_wslv_respF_q_0$write_1__SEL_2:
	  wci_wslv_respF_q_0$D_IN = MUX_wci_wslv_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wci_wslv_respF_decCtr:
	  wci_wslv_respF_q_0$D_IN = wci_wslv_respF_q_1;
      default: wci_wslv_respF_q_0$D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_wslv_respF_q_0$EN =
	     WILL_FIRE_RL_wci_wslv_respF_both ||
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wci_wslv_respF_decCtr ;
  // register wci_wslv_respF_q_1
  always@(WILL_FIRE_RL_wci_wslv_respF_both or
	  MUX_wci_wslv_respF_q_1$write_1__VAL_1 or
	  MUX_wci_wslv_respF_q_1$write_1__SEL_2 or
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wci_wslv_respF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wci_wslv_respF_both:
	  wci_wslv_respF_q_1$D_IN = MUX_wci_wslv_respF_q_1$write_1__VAL_1;
      MUX_wci_wslv_respF_q_1$write_1__SEL_2:
	  wci_wslv_respF_q_1$D_IN = MUX_wci_wslv_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wci_wslv_respF_decCtr:
	  wci_wslv_respF_q_1$D_IN = 34'h0AAAAAAAA;
      default: wci_wslv_respF_q_1$D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_wslv_respF_q_1$EN =
	     WILL_FIRE_RL_wci_wslv_respF_both ||
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wci_wslv_respF_decCtr ;
  // register wci_wslv_sFlagReg
  assign wci_wslv_sFlagReg$D_IN = sFlagState ;
  assign wci_wslv_sFlagReg$EN = 1'd1 ;
  // register wci_wslv_sThreadBusy_d
  assign wci_wslv_sThreadBusy_d$D_IN = 1'b0 ;
  assign wci_wslv_sThreadBusy_d$EN = 1'd1 ;
  // register wordsConsumed
  assign wordsConsumed$D_IN = wordsConsumed + 8'd1 ;
  assign wordsConsumed$EN =
	     WILL_FIRE_RL_emit_mesgConsume && wordsConsumed != 8'd255 ;
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
	     WILL_FIRE_RL_wsiS_reqFifo_enq != WILL_FIRE_RL_emit_mesgConsume ;
  // register wsiS_reqFifo_levelsValid
  assign wsiS_reqFifo_levelsValid$D_IN = WILL_FIRE_RL_wsiS_reqFifo_reset ;
  assign wsiS_reqFifo_levelsValid$EN =
	     WILL_FIRE_RL_emit_mesgConsume || WILL_FIRE_RL_wsiS_reqFifo_enq ||
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
  // register wti_isReset_isInReset
  assign wti_isReset_isInReset$D_IN = 1'd0 ;
  assign wti_isReset_isInReset$EN = wti_isReset_isInReset ;
  // register wti_nowReq
  assign wti_nowReq$D_IN = wtiS0_req ;
  assign wti_nowReq$EN = 1'd1 ;
  // register wti_operateD
  assign wti_operateD$D_IN = 1'b1 ;
  assign wti_operateD$EN = 1'd1 ;
  // submodule dacCore0_dcmLck_cc
  assign dacCore0_dcmLck_cc$sD_IN = dacCore0_ddrSDrv_ddrV$dcmLocked ;
  assign dacCore0_dcmLck_cc$sEN = 1'd1 ;
  // submodule dacCore0_ddrSDrv_ddrV
  assign dacCore0_ddrSDrv_ddrV$sdrData0 =
	     (!dacCore0_emit) ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdr0_1__VAL_1 :
	       MUX_dacCore0_ddrSDrv_ddrV$sdr0_1__VAL_2 ;
  assign dacCore0_ddrSDrv_ddrV$sdrData1 =
	     (!dacCore0_emit) ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdr1_1__VAL_1 :
	       MUX_dacCore0_ddrSDrv_ddrV$sdr1_1__VAL_2 ;
  assign dacCore0_ddrSDrv_ddrV$sdrData2 =
	     (!dacCore0_emit) ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdr2_1__VAL_1 :
	       MUX_dacCore0_ddrSDrv_ddrV$sdr2_1__VAL_2 ;
  assign dacCore0_ddrSDrv_ddrV$sdrData3 =
	     dacCore0_emit ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdr3_1__VAL_1 :
	       12'd2048 ;
  assign dacCore0_ddrSDrv_ddrV$sdrData4 =
	     (!dacCore0_emit) ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdr4_1__VAL_1 :
	       MUX_dacCore0_ddrSDrv_ddrV$sdr4_1__VAL_2 ;
  assign dacCore0_ddrSDrv_ddrV$sdrData5 =
	     (!dacCore0_emit) ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdr5_1__VAL_1 :
	       MUX_dacCore0_ddrSDrv_ddrV$sdr5_1__VAL_2 ;
  assign dacCore0_ddrSDrv_ddrV$sdrData6 =
	     (!dacCore0_emit) ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdr6_1__VAL_1 :
	       MUX_dacCore0_ddrSDrv_ddrV$sdr6_1__VAL_2 ;
  assign dacCore0_ddrSDrv_ddrV$sdrData7 =
	     (!dacCore0_emit) ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdr7_1__VAL_1 :
	       MUX_dacCore0_ddrSDrv_ddrV$sdr7_1__VAL_2 ;
  assign dacCore0_ddrSDrv_ddrV$sdrData8 =
	     (!dacCore0_emit) ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdr6_1__VAL_1 :
	       MUX_dacCore0_ddrSDrv_ddrV$sdr8_1__VAL_2 ;
  assign dacCore0_ddrSDrv_ddrV$sdrData9 =
	     (!dacCore0_emit) ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdr5_1__VAL_1 :
	       MUX_dacCore0_ddrSDrv_ddrV$sdr9_1__VAL_2 ;
  assign dacCore0_ddrSDrv_ddrV$sdrDataA =
	     (!dacCore0_emit) ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdr4_1__VAL_1 :
	       MUX_dacCore0_ddrSDrv_ddrV$sdrA_1__VAL_2 ;
  assign dacCore0_ddrSDrv_ddrV$sdrDataB =
	     dacCore0_emit ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdrB_1__VAL_1 :
	       12'd2048 ;
  assign dacCore0_ddrSDrv_ddrV$sdrDataC =
	     (!dacCore0_emit) ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdr2_1__VAL_1 :
	       MUX_dacCore0_ddrSDrv_ddrV$sdrC_1__VAL_2 ;
  assign dacCore0_ddrSDrv_ddrV$sdrDataD =
	     (!dacCore0_emit) ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdr1_1__VAL_1 :
	       MUX_dacCore0_ddrSDrv_ddrV$sdrD_1__VAL_2 ;
  assign dacCore0_ddrSDrv_ddrV$sdrDataE =
	     (!dacCore0_emit) ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdr0_1__VAL_1 :
	       MUX_dacCore0_ddrSDrv_ddrV$sdrE_1__VAL_2 ;
  assign dacCore0_ddrSDrv_ddrV$sdrDataF =
	     (!dacCore0_emit) ?
	       MUX_dacCore0_ddrSDrv_ddrV$sdrF_1__VAL_1 :
	       MUX_dacCore0_ddrSDrv_ddrV$sdrF_1__VAL_2 ;
  // submodule dacCore0_emitCntCC
  assign dacCore0_emitCntCC$sD_IN = dacCore0_emitCnt ;
  assign dacCore0_emitCntCC$sEN = dacCore0_emitCntCC$sRDY ;
  // submodule dacCore0_emitEn_d
  assign dacCore0_emitEn_d$sD_IN = dacCore0_emitEn_pw$whas ;
  assign dacCore0_emitEn_d$sEN = 1'd1 ;
  // submodule dacCore0_iSeqDone
  assign dacCore0_iSeqDone$sD_IN =
	     dacCore0_iseqFsm_abort_whas__60_AND_dacCore0_i_ETC___d417 &&
	     !dacCore0_iseqFsm_start_reg ;
  assign dacCore0_iSeqDone$sEN = 1'd1 ;
  // submodule dacCore0_sampF_memory
  assign dacCore0_sampF_memory$ADDRA =
	     { dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1013,
	       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1015,
	       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1014,
	       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d987,
	       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1003,
	       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d988,
	       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1016,
	       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d990,
	       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d989,
	       dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d989 ^
	       dacCore0_sampF_rWrPtr_rsCounter[0] } ;
  assign dacCore0_sampF_memory$ADDRB =
	     dacCore0_sampF_pwDequeue$whas ? x__h18426[9:0] : x2__h18395 ;
  assign dacCore0_sampF_memory$DIA =
	     dacCore0_sampF_pwEnqueue$whas ?
	       dacCore0_sampF_wDataIn$wget :
	       192'd0 ;
  assign dacCore0_sampF_memory$DIB =
	     192'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */  ;
  assign dacCore0_sampF_memory$WEA = dacCore0_sampF_pwEnqueue$whas ;
  assign dacCore0_sampF_memory$WEB = 1'd0 ;
  assign dacCore0_sampF_memory$ENA = 1'd1 ;
  assign dacCore0_sampF_memory$ENB = 1'd1 ;
  // submodule dacCore0_startIseqF
  assign dacCore0_startIseqF$sD_IN = 1'b0 ;
  assign dacCore0_startIseqF$sENQ = WILL_FIRE_RL_wci_ctrl_EiI ;
  assign dacCore0_startIseqF$dDEQ = 1'b0 ;
  // submodule dacCore0_syncMute_obuf
  assign dacCore0_syncMute_obuf$I = dacCore0_syncMute ;
  // submodule dacCore0_syncOut_obuf
  assign dacCore0_syncOut_obuf$I = dacCore0_syncOut ;
  // submodule dacCore0_toneEn_d
  assign dacCore0_toneEn_d$sD_IN = dacCore0_toneEn_pw$whas ;
  assign dacCore0_toneEn_d$sEN = 1'd1 ;
  // submodule dacCore0_undCountCC
  assign dacCore0_undCountCC$sD_IN = dacCore0_undCount ;
  assign dacCore0_undCountCC$sEN = dacCore0_undCountCC$sRDY ;
  // submodule stageF
  assign stageF$D_IN =
	     dacControl[6] ? result__h66758 : wsiS_reqFifo$D_OUT[43:12] ;
  assign stageF$ENQ = WILL_FIRE_RL_emit_mesgConsume ;
  assign stageF$DEQ =
	     WILL_FIRE_RL_process_staged_data &&
	     (!takeEven || !dacControl[5]) ;
  assign stageF$CLR = 1'b0 ;
  // submodule wci_wslv_reqF
  assign wci_wslv_reqF$D_IN = wci_wslv_wciReq$wget ;
  assign wci_wslv_reqF$ENQ = wci_wslv_wciReq$wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF$DEQ = wci_wslv_reqF_r_deq$whas ;
  assign wci_wslv_reqF$CLR = 1'b0 ;
  // submodule wsiS_reqFifo
  assign wsiS_reqFifo$D_IN = wsiS_wsiReq$wget ;
  assign wsiS_reqFifo$ENQ = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo$DEQ = WILL_FIRE_RL_emit_mesgConsume ;
  assign wsiS_reqFifo$CLR = 1'b0 ;
  // remaining internal signals
  assign IF_dacCore0_sampF_rRdPtr_rsCounter_33_BIT_0_40_ETC___d1111 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_BIT_0_40_XO_ETC___d1064 ?
	       IF_dacCore0_sampF_rRdPtr_rsCounter_33_BIT_0_40_ETC___d1112 :
	       32'd0 ;
  assign IF_dacCore0_sampF_rRdPtr_rsCounter_33_BIT_0_40_ETC___d1112 =
	     (dacCore0_sampF_rRdPtr_rsCounter[0] ||
	      dacCore0_sampF_rRdPtr_rsCounter[1] ||
	      dacCore0_sampF_rRdPtr_rsCounter[2] ||
	      dacCore0_sampF_rRdPtr_rsCounter[3] ||
	      dacCore0_sampF_rRdPtr_rsCounter[4] ||
	      dacCore0_sampF_rRdPtr_rsCounter[5] ||
	      dacCore0_sampF_rRdPtr_rsCounter[6] ||
	      dacCore0_sampF_rRdPtr_rsCounter[7] ||
	      dacCore0_sampF_rRdPtr_rsCounter[8] ||
	      dacCore0_sampF_rRdPtr_rsCounter[9]) ?
	       (dacCore0_sampF_rRdPtr_rsCounter[0] ?
		  32'd1 :
		  (dacCore0_sampF_rRdPtr_rsCounter[1] ?
		     32'd2 :
		     (dacCore0_sampF_rRdPtr_rsCounter[2] ?
			32'd3 :
			(dacCore0_sampF_rRdPtr_rsCounter[3] ?
			   32'd4 :
			   (dacCore0_sampF_rRdPtr_rsCounter[4] ?
			      32'd5 :
			      (dacCore0_sampF_rRdPtr_rsCounter[5] ?
				 32'd6 :
				 (dacCore0_sampF_rRdPtr_rsCounter[6] ?
				    32'd7 :
				    (dacCore0_sampF_rRdPtr_rsCounter[7] ?
				       32'd8 :
				       (dacCore0_sampF_rRdPtr_rsCounter[8] ?
					  32'd9 :
					  (dacCore0_sampF_rRdPtr_rsCounter[9] ?
					     32'd10 :
					     (dacCore0_sampF_rRdPtr_rsCounter[10] ?
						32'd11 :
						32'd12))))))))))) :
	       32'd10 ;
  assign IF_dacCore0_sampF_rWrPtr_rsCounter_64_BIT_0_71_ETC___d1108 =
	     dacCore0_sampF_rWrPtr_rsCounter_64_BIT_0_71_XO_ETC___d1063 ?
	       IF_dacCore0_sampF_rWrPtr_rsCounter_64_BIT_0_71_ETC___d1109 :
	       32'd0 ;
  assign IF_dacCore0_sampF_rWrPtr_rsCounter_64_BIT_0_71_ETC___d1109 =
	     (dacCore0_sampF_rWrPtr_rsCounter[0] ||
	      dacCore0_sampF_rWrPtr_rsCounter[1] ||
	      dacCore0_sampF_rWrPtr_rsCounter[2] ||
	      dacCore0_sampF_rWrPtr_rsCounter[3] ||
	      dacCore0_sampF_rWrPtr_rsCounter[4] ||
	      dacCore0_sampF_rWrPtr_rsCounter[5] ||
	      dacCore0_sampF_rWrPtr_rsCounter[6] ||
	      dacCore0_sampF_rWrPtr_rsCounter[7] ||
	      dacCore0_sampF_rWrPtr_rsCounter[8] ||
	      dacCore0_sampF_rWrPtr_rsCounter[9]) ?
	       (dacCore0_sampF_rWrPtr_rsCounter[0] ?
		  32'd1 :
		  (dacCore0_sampF_rWrPtr_rsCounter[1] ?
		     32'd2 :
		     (dacCore0_sampF_rWrPtr_rsCounter[2] ?
			32'd3 :
			(dacCore0_sampF_rWrPtr_rsCounter[3] ?
			   32'd4 :
			   (dacCore0_sampF_rWrPtr_rsCounter[4] ?
			      32'd5 :
			      (dacCore0_sampF_rWrPtr_rsCounter[5] ?
				 32'd6 :
				 (dacCore0_sampF_rWrPtr_rsCounter[6] ?
				    32'd7 :
				    (dacCore0_sampF_rWrPtr_rsCounter[7] ?
				       32'd8 :
				       (dacCore0_sampF_rWrPtr_rsCounter[8] ?
					  32'd9 :
					  (dacCore0_sampF_rWrPtr_rsCounter[9] ?
					     32'd10 :
					     (dacCore0_sampF_rWrPtr_rsCounter[10] ?
						32'd11 :
						32'd12))))))))))) :
	       32'd10 ;
  assign IF_fcDac_grayCounter_rsCounter_81_BIT_0_88_OR__ETC___d1115 =
	     (fcDac_grayCounter_rsCounter[0] ||
	      fcDac_grayCounter_rsCounter[1] ||
	      fcDac_grayCounter_rsCounter[2] ||
	      fcDac_grayCounter_rsCounter[3] ||
	      fcDac_grayCounter_rsCounter[4] ||
	      fcDac_grayCounter_rsCounter[5] ||
	      fcDac_grayCounter_rsCounter[6] ||
	      fcDac_grayCounter_rsCounter[7] ||
	      fcDac_grayCounter_rsCounter[8] ||
	      fcDac_grayCounter_rsCounter[9] ||
	      fcDac_grayCounter_rsCounter[10] ||
	      fcDac_grayCounter_rsCounter[11] ||
	      fcDac_grayCounter_rsCounter[12] ||
	      fcDac_grayCounter_rsCounter[13] ||
	      fcDac_grayCounter_rsCounter[14]) ?
	       (fcDac_grayCounter_rsCounter[0] ?
		  32'd1 :
		  (fcDac_grayCounter_rsCounter[1] ?
		     32'd2 :
		     (fcDac_grayCounter_rsCounter[2] ?
			32'd3 :
			(fcDac_grayCounter_rsCounter[3] ?
			   32'd4 :
			   (fcDac_grayCounter_rsCounter[4] ?
			      32'd5 :
			      (fcDac_grayCounter_rsCounter[5] ?
				 32'd6 :
				 (fcDac_grayCounter_rsCounter[6] ?
				    32'd7 :
				    (fcDac_grayCounter_rsCounter[7] ?
				       32'd8 :
				       (fcDac_grayCounter_rsCounter[8] ?
					  32'd9 :
					  (fcDac_grayCounter_rsCounter[9] ?
					     32'd10 :
					     (fcDac_grayCounter_rsCounter[10] ?
						32'd11 :
						(fcDac_grayCounter_rsCounter[11] ?
						   32'd12 :
						   (fcDac_grayCounter_rsCounter[12] ?
						      32'd13 :
						      (fcDac_grayCounter_rsCounter[13] ?
							 32'd14 :
							 (fcDac_grayCounter_rsCounter[14] ?
							    32'd15 :
							    (fcDac_grayCounter_rsCounter[15] ?
							       32'd16 :
							       32'd17)))))))))))))))) :
	       32'd15 ;
  assign IF_fcDac_grayCounter_rsCounter_81_BIT_0_88_XOR_ETC___d1116 =
	     fcDac_grayCounter_rsCounter_81_BIT_0_88_XOR_fc_ETC___d1065 ?
	       IF_fcDac_grayCounter_rsCounter_81_BIT_0_88_OR__ETC___d1115 :
	       32'd0 ;
  assign NOT_dacCore0_sampF_rWrPtr_rsCounter_64_EQ_dacC_ETC___d1092 =
	     dacCore0_sampF_rWrPtr_rsCounter !=
	     { dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[10],
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[10] ^
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[9],
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[9] ^
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[8],
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[8] ^
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[7],
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[7] ^
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[6],
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[6] ^
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[5],
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[5] ^
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[4],
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[4] ^
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[3],
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[3] ^
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[2],
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[2] ^
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[1],
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[1] ^
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011[0] } ;
  assign _theResult____h75764 =
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b0) ?
	       CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1 :
	       32'd0 ;
  assign dacCore0_iseqFsm_abort_whas__60_AND_dacCore0_i_ETC___d417 =
	     (dacCore0_iseqFsm_state_mkFSMstate == 4'd0 ||
	      dacCore0_iseqFsm_state_mkFSMstate == 4'd7) &&
	     (!dacCore0_iseqFsm_start_reg_1 || dacCore0_iseqFsm_state_fired) ;
  assign dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_C_ETC___d1011 =
	     x_dReadBin__h11074 + 11'd512 ;
  assign dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1000 =
	     dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1027 ^
	     dacCore0_sampF_rRdPtr_rdCounter[5] ;
  assign dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1001 =
	     dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1000 ^
	     dacCore0_sampF_rRdPtr_rdCounter[4] ;
  assign dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1002 =
	     dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1009 ^
	     dacCore0_sampF_rRdPtr_rdCounter[1] ;
  assign dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1008 =
	     dacCore0_sampF_rRdPtr_rdCounter[10] ^
	     dacCore0_sampF_rRdPtr_rdCounter[9] ;
  assign dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1009 =
	     dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1028 ^
	     dacCore0_sampF_rRdPtr_rdCounter[2] ;
  assign dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1026 =
	     dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d999 ^
	     dacCore0_sampF_rRdPtr_rdCounter[7] ;
  assign dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1027 =
	     dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1026 ^
	     dacCore0_sampF_rRdPtr_rdCounter[6] ;
  assign dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1028 =
	     dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1001 ^
	     dacCore0_sampF_rRdPtr_rdCounter[3] ;
  assign dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d999 =
	     dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1008 ^
	     dacCore0_sampF_rRdPtr_rdCounter[8] ;
  assign dacCore0_sampF_rRdPtr_rsCounter_33_BIT_0_40_XO_ETC___d1064 =
	     z__h10248 ^ dacCore0_sampF_rRdPtr_rsCounter[10] ;
  assign dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1004 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1018 ^
	     dacCore0_sampF_rRdPtr_rsCounter[2] ;
  assign dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1010 =
	     dacCore0_sampF_rRdPtr_rsCounter[10] ^
	     dacCore0_sampF_rRdPtr_rsCounter[9] ;
  assign dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1012 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1010 ^
	     dacCore0_sampF_rRdPtr_rsCounter[8] ;
  assign dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1017 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d991 ^
	     dacCore0_sampF_rRdPtr_rsCounter[6] ;
  assign dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1018 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d993 ^
	     dacCore0_sampF_rRdPtr_rsCounter[3] ;
  assign dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1019 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1004 ^
	     dacCore0_sampF_rRdPtr_rsCounter[1] ;
  assign dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1031 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1019 ^
	     dacCore0_sampF_rRdPtr_rsCounter[0] ;
  assign dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d991 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1012 ^
	     dacCore0_sampF_rRdPtr_rsCounter[7] ;
  assign dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d992 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1017 ^
	     dacCore0_sampF_rRdPtr_rsCounter[5] ;
  assign dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d993 =
	     dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d992 ^
	     dacCore0_sampF_rRdPtr_rsCounter[4] ;
  assign dacCore0_sampF_rRdPtr_rsCounter_33_EQ_dacCore0_ETC___d1133 =
	     dacCore0_sampF_rRdPtr_rsCounter ==
	     dacCore0_sampF_rWrPtr_rdCounter ;
  assign dacCore0_sampF_rWrPtr_rsCounter_64_BIT_0_71_XO_ETC___d1063 =
	     z__h7946 ^ dacCore0_sampF_rWrPtr_rsCounter[10] ;
  assign dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1003 =
	     dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d987 ^
	     dacCore0_sampF_rWrPtr_rsCounter[5] ;
  assign dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1013 =
	     dacCore0_sampF_rWrPtr_rsCounter[10] ^
	     dacCore0_sampF_rWrPtr_rsCounter[9] ;
  assign dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1014 =
	     dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1015 ^
	     dacCore0_sampF_rWrPtr_rsCounter[7] ;
  assign dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1015 =
	     dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1013 ^
	     dacCore0_sampF_rWrPtr_rsCounter[8] ;
  assign dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1016 =
	     dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d988 ^
	     dacCore0_sampF_rWrPtr_rsCounter[3] ;
  assign dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d987 =
	     dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1014 ^
	     dacCore0_sampF_rWrPtr_rsCounter[6] ;
  assign dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d988 =
	     dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1003 ^
	     dacCore0_sampF_rWrPtr_rsCounter[4] ;
  assign dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d989 =
	     dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d990 ^
	     dacCore0_sampF_rWrPtr_rsCounter[1] ;
  assign dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d990 =
	     dacCore0_sampF_rWrPtr_rsCounter_64_BIT_10_90_X_ETC___d1016 ^
	     dacCore0_sampF_rWrPtr_rsCounter[2] ;
  assign dacStatusLs__h75699 = { 26'd0, x__h75926 } ;
  assign fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1005 =
	     fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d998 ^
	     fcDac_grayCounter_rdCounter[8] ;
  assign fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1006 =
	     fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d996 ^
	     fcDac_grayCounter_rdCounter[6] ;
  assign fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1007 =
	     fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1024 ^
	     fcDac_grayCounter_rdCounter[1] ;
  assign fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1020 =
	     fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1021 ^
	     fcDac_grayCounter_rdCounter[13] ;
  assign fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1021 =
	     fcDac_grayCounter_rdCounter[15] ^
	     fcDac_grayCounter_rdCounter[14] ;
  assign fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1022 =
	     fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1020 ^
	     fcDac_grayCounter_rdCounter[12] ;
  assign fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1023 =
	     fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d997 ^
	     fcDac_grayCounter_rdCounter[4] ;
  assign fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1024 =
	     fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1025 ^
	     fcDac_grayCounter_rdCounter[2] ;
  assign fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1025 =
	     fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1023 ^
	     fcDac_grayCounter_rdCounter[3] ;
  assign fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d994 =
	     fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1022 ^
	     fcDac_grayCounter_rdCounter[11] ;
  assign fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d995 =
	     fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d994 ^
	     fcDac_grayCounter_rdCounter[10] ;
  assign fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d996 =
	     fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1005 ^
	     fcDac_grayCounter_rdCounter[7] ;
  assign fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d997 =
	     fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d1006 ^
	     fcDac_grayCounter_rdCounter[5] ;
  assign fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d998 =
	     fcDac_grayCounter_rdCounter_71_BIT_15_72_XOR_f_ETC___d995 ^
	     fcDac_grayCounter_rdCounter[9] ;
  assign fcDac_grayCounter_rsCounter_81_BIT_0_88_XOR_fc_ETC___d1065 =
	     z__h57468 ^ fcDac_grayCounter_rsCounter[15] ;
  assign rdat__h75871 = { 24'd0, wsiS_statusR } ;
  assign rdat__h75948 = { 16'd0, fcDac_frequency } ;
  assign result__h66758 =
	     { ~wsiS_reqFifo$D_OUT[43],
	       wsiS_reqFifo$D_OUT[42:28],
	       ~wsiS_reqFifo$D_OUT[27],
	       wsiS_reqFifo$D_OUT[26:12] } ;
  assign x2__h18395 =
	     { dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1010,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1012,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d991,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1017,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d992,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d993,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1018,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1004,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1019,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1031 } ;
  assign x__h18426 = x_sReadBin__h11071 + 11'd1 ;
  assign x__h57357 =
	     16'd1 <<
	     IF_fcDac_grayCounter_rsCounter_81_BIT_0_88_XOR_ETC___d1116 ;
  assign x__h6959 =
	     11'd1 <<
	     IF_dacCore0_sampF_rWrPtr_rsCounter_64_BIT_0_71_ETC___d1108 ;
  assign x__h75926 =
	     { splitReadInFlight,
	       initOpInFlight,
	       2'd2,
	       dacCore0_dcmLck_cc$dD_OUT,
	       dacCore0_iSeqDone$dD_OUT } ;
  assign x__h9261 =
	     11'd1 <<
	     IF_dacCore0_sampF_rRdPtr_rsCounter_33_BIT_0_40_ETC___d1111 ;
  assign x_dReadBin__h11074 =
	     { dacCore0_sampF_rRdPtr_rdCounter[10],
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1008,
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d999,
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1026,
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1027,
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1000,
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1001,
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1028,
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1009,
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1002,
	       dacCore0_sampF_rRdPtr_rdCounter_39_BIT_10_40_X_ETC___d1002 ^
	       dacCore0_sampF_rRdPtr_rdCounter[0] } ;
  assign x_sReadBin__h11071 =
	     { dacCore0_sampF_rRdPtr_rsCounter[10],
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1010,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1012,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d991,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1017,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d992,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d993,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1018,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1004,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1019,
	       dacCore0_sampF_rRdPtr_rsCounter_33_BIT_10_59_X_ETC___d1031 } ;
  assign y__h10148 = ~x__h9261 ;
  assign y__h58614 = ~x__h57357 ;
  assign y__h7846 = ~x__h6959 ;
  assign z__h10192 =
	     dacCore0_sampF_rRdPtr_rsCounter[0] ^
	     dacCore0_sampF_rRdPtr_rsCounter[1] ;
  assign z__h10199 = z__h10192 ^ dacCore0_sampF_rRdPtr_rsCounter[2] ;
  assign z__h10206 = z__h10199 ^ dacCore0_sampF_rRdPtr_rsCounter[3] ;
  assign z__h10213 = z__h10206 ^ dacCore0_sampF_rRdPtr_rsCounter[4] ;
  assign z__h10220 = z__h10213 ^ dacCore0_sampF_rRdPtr_rsCounter[5] ;
  assign z__h10227 = z__h10220 ^ dacCore0_sampF_rRdPtr_rsCounter[6] ;
  assign z__h10234 = z__h10227 ^ dacCore0_sampF_rRdPtr_rsCounter[7] ;
  assign z__h10241 = z__h10234 ^ dacCore0_sampF_rRdPtr_rsCounter[8] ;
  assign z__h10248 = z__h10241 ^ dacCore0_sampF_rRdPtr_rsCounter[9] ;
  assign z__h57377 =
	     fcDac_grayCounter_rsCounter[0] ^ fcDac_grayCounter_rsCounter[1] ;
  assign z__h57384 = z__h57377 ^ fcDac_grayCounter_rsCounter[2] ;
  assign z__h57391 = z__h57384 ^ fcDac_grayCounter_rsCounter[3] ;
  assign z__h57398 = z__h57391 ^ fcDac_grayCounter_rsCounter[4] ;
  assign z__h57405 = z__h57398 ^ fcDac_grayCounter_rsCounter[5] ;
  assign z__h57412 = z__h57405 ^ fcDac_grayCounter_rsCounter[6] ;
  assign z__h57419 = z__h57412 ^ fcDac_grayCounter_rsCounter[7] ;
  assign z__h57426 = z__h57419 ^ fcDac_grayCounter_rsCounter[8] ;
  assign z__h57433 = z__h57426 ^ fcDac_grayCounter_rsCounter[9] ;
  assign z__h57440 = z__h57433 ^ fcDac_grayCounter_rsCounter[10] ;
  assign z__h57447 = z__h57440 ^ fcDac_grayCounter_rsCounter[11] ;
  assign z__h57454 = z__h57447 ^ fcDac_grayCounter_rsCounter[12] ;
  assign z__h57461 = z__h57454 ^ fcDac_grayCounter_rsCounter[13] ;
  assign z__h57468 = z__h57461 ^ fcDac_grayCounter_rsCounter[14] ;
  assign z__h7890 =
	     dacCore0_sampF_rWrPtr_rsCounter[0] ^
	     dacCore0_sampF_rWrPtr_rsCounter[1] ;
  assign z__h7897 = z__h7890 ^ dacCore0_sampF_rWrPtr_rsCounter[2] ;
  assign z__h7904 = z__h7897 ^ dacCore0_sampF_rWrPtr_rsCounter[3] ;
  assign z__h7911 = z__h7904 ^ dacCore0_sampF_rWrPtr_rsCounter[4] ;
  assign z__h7918 = z__h7911 ^ dacCore0_sampF_rWrPtr_rsCounter[5] ;
  assign z__h7925 = z__h7918 ^ dacCore0_sampF_rWrPtr_rsCounter[6] ;
  assign z__h7932 = z__h7925 ^ dacCore0_sampF_rWrPtr_rsCounter[7] ;
  assign z__h7939 = z__h7932 ^ dacCore0_sampF_rWrPtr_rsCounter[8] ;
  assign z__h7946 = z__h7939 ^ dacCore0_sampF_rWrPtr_rsCounter[9] ;
  always@(wci_wslv_reqF$D_OUT or
	  rdat__h75871 or
	  dacStatusLs__h75699 or
	  dacControl or
	  rdat__h75948 or
	  dacCore0_emitCntCC$dD_OUT or
	  firstUnderflowMesg or
	  syncCount or
	  mesgStart or
	  dacCore0_undCountCC$dD_OUT or stageCount or wsiS_extStatusW$wget)
  begin
    case (wci_wslv_reqF$D_OUT[39:32])
      8'h0:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1 =
	      rdat__h75871;
      8'h04:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1 =
	      dacStatusLs__h75699;
      8'h0C:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1 = dacControl;
      8'h10:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1 =
	      rdat__h75948;
      8'h14:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1 =
	      dacCore0_emitCntCC$dD_OUT;
      8'h24:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1 =
	      firstUnderflowMesg;
      8'h30:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1 = syncCount;
      8'h34:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1 = mesgStart;
      8'h38:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1 =
	      dacCore0_undCountCC$dD_OUT;
      8'h3C:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1 = stageCount;
      8'h48:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1 =
	      wsiS_extStatusW$wget[95:64];
      8'h4C:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1 =
	      wsiS_extStatusW$wget[63:32];
      8'h50:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1 =
	      wsiS_extStatusW$wget[31:0];
      default: CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_r_ETC__q1 = 32'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (wciS0_MReset_n == `BSV_RESET_VALUE)
      begin
        dacControl <= `BSV_ASSIGNMENT_DELAY 32'h00000008;
	dacCore0_dacCtrl_w <= `BSV_ASSIGNMENT_DELAY 4'h8;
	fcDac_countNow <= `BSV_ASSIGNMENT_DELAY 16'd65535;
	fcDac_countPast <= `BSV_ASSIGNMENT_DELAY 16'd65535;
	fcDac_frequency <= `BSV_ASSIGNMENT_DELAY 16'd65535;
	fcDac_pulseAction <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fcDac_sampleCount <= `BSV_ASSIGNMENT_DELAY 16'd0;
	firstUnderflowMesg <= `BSV_ASSIGNMENT_DELAY 32'hFFFFFFFF;
	hasUnderflowed <= `BSV_ASSIGNMENT_DELAY 1'd0;
	initOpInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	mesgStart <= `BSV_ASSIGNMENT_DELAY 32'd0;
	oneKHz_value <= `BSV_ASSIGNMENT_DELAY 18'd0;
	opcode <= `BSV_ASSIGNMENT_DELAY 9'd170;
	rf <= `BSV_ASSIGNMENT_DELAY 12'd0;
	rf_1 <= `BSV_ASSIGNMENT_DELAY 12'd0;
	rf_10 <= `BSV_ASSIGNMENT_DELAY 12'd0;
	rf_11 <= `BSV_ASSIGNMENT_DELAY 12'd0;
	rf_12 <= `BSV_ASSIGNMENT_DELAY 12'd0;
	rf_13 <= `BSV_ASSIGNMENT_DELAY 12'd0;
	rf_14 <= `BSV_ASSIGNMENT_DELAY 12'd0;
	rf_15 <= `BSV_ASSIGNMENT_DELAY 12'd0;
	rf_2 <= `BSV_ASSIGNMENT_DELAY 12'd0;
	rf_3 <= `BSV_ASSIGNMENT_DELAY 12'd0;
	rf_4 <= `BSV_ASSIGNMENT_DELAY 12'd0;
	rf_5 <= `BSV_ASSIGNMENT_DELAY 12'd0;
	rf_6 <= `BSV_ASSIGNMENT_DELAY 12'd0;
	rf_7 <= `BSV_ASSIGNMENT_DELAY 12'd0;
	rf_8 <= `BSV_ASSIGNMENT_DELAY 12'd0;
	rf_9 <= `BSV_ASSIGNMENT_DELAY 12'd0;
	sFlagState <= `BSV_ASSIGNMENT_DELAY 1'd0;
	splitReadInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	srcCnt <= `BSV_ASSIGNMENT_DELAY 2'd0;
	stageCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	syncCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	takeEven <= `BSV_ASSIGNMENT_DELAY 1'd1;
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
	wordsConsumed <= `BSV_ASSIGNMENT_DELAY 8'd0;
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
        if (dacControl$EN)
	  dacControl <= `BSV_ASSIGNMENT_DELAY dacControl$D_IN;
	if (dacCore0_dacCtrl_w$EN)
	  dacCore0_dacCtrl_w <= `BSV_ASSIGNMENT_DELAY dacCore0_dacCtrl_w$D_IN;
	if (fcDac_countNow$EN)
	  fcDac_countNow <= `BSV_ASSIGNMENT_DELAY fcDac_countNow$D_IN;
	if (fcDac_countPast$EN)
	  fcDac_countPast <= `BSV_ASSIGNMENT_DELAY fcDac_countPast$D_IN;
	if (fcDac_frequency$EN)
	  fcDac_frequency <= `BSV_ASSIGNMENT_DELAY fcDac_frequency$D_IN;
	if (fcDac_pulseAction$EN)
	  fcDac_pulseAction <= `BSV_ASSIGNMENT_DELAY fcDac_pulseAction$D_IN;
	if (fcDac_sampleCount$EN)
	  fcDac_sampleCount <= `BSV_ASSIGNMENT_DELAY fcDac_sampleCount$D_IN;
	if (firstUnderflowMesg$EN)
	  firstUnderflowMesg <= `BSV_ASSIGNMENT_DELAY firstUnderflowMesg$D_IN;
	if (hasUnderflowed$EN)
	  hasUnderflowed <= `BSV_ASSIGNMENT_DELAY hasUnderflowed$D_IN;
	if (initOpInFlight$EN)
	  initOpInFlight <= `BSV_ASSIGNMENT_DELAY initOpInFlight$D_IN;
	if (mesgStart$EN) mesgStart <= `BSV_ASSIGNMENT_DELAY mesgStart$D_IN;
	if (oneKHz_value$EN)
	  oneKHz_value <= `BSV_ASSIGNMENT_DELAY oneKHz_value$D_IN;
	if (opcode$EN) opcode <= `BSV_ASSIGNMENT_DELAY opcode$D_IN;
	if (rf$EN) rf <= `BSV_ASSIGNMENT_DELAY rf$D_IN;
	if (rf_1$EN) rf_1 <= `BSV_ASSIGNMENT_DELAY rf_1$D_IN;
	if (rf_10$EN) rf_10 <= `BSV_ASSIGNMENT_DELAY rf_10$D_IN;
	if (rf_11$EN) rf_11 <= `BSV_ASSIGNMENT_DELAY rf_11$D_IN;
	if (rf_12$EN) rf_12 <= `BSV_ASSIGNMENT_DELAY rf_12$D_IN;
	if (rf_13$EN) rf_13 <= `BSV_ASSIGNMENT_DELAY rf_13$D_IN;
	if (rf_14$EN) rf_14 <= `BSV_ASSIGNMENT_DELAY rf_14$D_IN;
	if (rf_15$EN) rf_15 <= `BSV_ASSIGNMENT_DELAY rf_15$D_IN;
	if (rf_2$EN) rf_2 <= `BSV_ASSIGNMENT_DELAY rf_2$D_IN;
	if (rf_3$EN) rf_3 <= `BSV_ASSIGNMENT_DELAY rf_3$D_IN;
	if (rf_4$EN) rf_4 <= `BSV_ASSIGNMENT_DELAY rf_4$D_IN;
	if (rf_5$EN) rf_5 <= `BSV_ASSIGNMENT_DELAY rf_5$D_IN;
	if (rf_6$EN) rf_6 <= `BSV_ASSIGNMENT_DELAY rf_6$D_IN;
	if (rf_7$EN) rf_7 <= `BSV_ASSIGNMENT_DELAY rf_7$D_IN;
	if (rf_8$EN) rf_8 <= `BSV_ASSIGNMENT_DELAY rf_8$D_IN;
	if (rf_9$EN) rf_9 <= `BSV_ASSIGNMENT_DELAY rf_9$D_IN;
	if (sFlagState$EN)
	  sFlagState <= `BSV_ASSIGNMENT_DELAY sFlagState$D_IN;
	if (splitReadInFlight$EN)
	  splitReadInFlight <= `BSV_ASSIGNMENT_DELAY splitReadInFlight$D_IN;
	if (srcCnt$EN) srcCnt <= `BSV_ASSIGNMENT_DELAY srcCnt$D_IN;
	if (stageCount$EN)
	  stageCount <= `BSV_ASSIGNMENT_DELAY stageCount$D_IN;
	if (syncCount$EN) syncCount <= `BSV_ASSIGNMENT_DELAY syncCount$D_IN;
	if (takeEven$EN) takeEven <= `BSV_ASSIGNMENT_DELAY takeEven$D_IN;
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
	if (wordsConsumed$EN)
	  wordsConsumed <= `BSV_ASSIGNMENT_DELAY wordsConsumed$D_IN;
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
    if (wsiS_mesgWordLength$EN)
      wsiS_mesgWordLength <= `BSV_ASSIGNMENT_DELAY wsiS_mesgWordLength$D_IN;
    if (wsiS_statusR$EN)
      wsiS_statusR <= `BSV_ASSIGNMENT_DELAY wsiS_statusR$D_IN;
  end
  always@(posedge CLK_dac_clk)
  begin
    if (RST_N_dac_rst == `BSV_RESET_VALUE)
      begin
        wti_nowReq <= `BSV_ASSIGNMENT_DELAY 67'd0;
	wti_operateD <= `BSV_ASSIGNMENT_DELAY 1'd1;
      end
    else
      begin
        if (wti_nowReq$EN)
	  wti_nowReq <= `BSV_ASSIGNMENT_DELAY wti_nowReq$D_IN;
	if (wti_operateD$EN)
	  wti_operateD <= `BSV_ASSIGNMENT_DELAY wti_operateD$D_IN;
      end
  end
  always@(posedge dacCore0_ddrSDrv_ddrV$sdrClk)
  begin
    if (dacCore0_sdrRst$OUT_RST == `BSV_RESET_VALUE)
      begin
        dacCore0_calBit <= `BSV_ASSIGNMENT_DELAY 1'd0;
	dacCore0_emit <= `BSV_ASSIGNMENT_DELAY 1'd0;
	dacCore0_emitCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
	dacCore0_emitD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	dacCore0_iseqFsm_jj_delay_count <= `BSV_ASSIGNMENT_DELAY 13'd0;
	dacCore0_iseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	dacCore0_iseqFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	dacCore0_iseqFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY 1'd1;
	dacCore0_iseqFsm_state_fired <= `BSV_ASSIGNMENT_DELAY 1'd0;
	dacCore0_iseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 4'd0;
	dacCore0_muteDAC <= `BSV_ASSIGNMENT_DELAY 1'd0;
	dacCore0_syncMute <= `BSV_ASSIGNMENT_DELAY 1'd0;
	dacCore0_syncOut <= `BSV_ASSIGNMENT_DELAY 1'd0;
	dacCore0_tone <= `BSV_ASSIGNMENT_DELAY 1'd0;
	dacCore0_undCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
      end
    else
      begin
        if (dacCore0_calBit$EN)
	  dacCore0_calBit <= `BSV_ASSIGNMENT_DELAY dacCore0_calBit$D_IN;
	if (dacCore0_emit$EN)
	  dacCore0_emit <= `BSV_ASSIGNMENT_DELAY dacCore0_emit$D_IN;
	if (dacCore0_emitCnt$EN)
	  dacCore0_emitCnt <= `BSV_ASSIGNMENT_DELAY dacCore0_emitCnt$D_IN;
	if (dacCore0_emitD$EN)
	  dacCore0_emitD <= `BSV_ASSIGNMENT_DELAY dacCore0_emitD$D_IN;
	if (dacCore0_iseqFsm_jj_delay_count$EN)
	  dacCore0_iseqFsm_jj_delay_count <= `BSV_ASSIGNMENT_DELAY
	      dacCore0_iseqFsm_jj_delay_count$D_IN;
	if (dacCore0_iseqFsm_start_reg$EN)
	  dacCore0_iseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY
	      dacCore0_iseqFsm_start_reg$D_IN;
	if (dacCore0_iseqFsm_start_reg_1$EN)
	  dacCore0_iseqFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY
	      dacCore0_iseqFsm_start_reg_1$D_IN;
	if (dacCore0_iseqFsm_state_can_overlap$EN)
	  dacCore0_iseqFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY
	      dacCore0_iseqFsm_state_can_overlap$D_IN;
	if (dacCore0_iseqFsm_state_fired$EN)
	  dacCore0_iseqFsm_state_fired <= `BSV_ASSIGNMENT_DELAY
	      dacCore0_iseqFsm_state_fired$D_IN;
	if (dacCore0_iseqFsm_state_mkFSMstate$EN)
	  dacCore0_iseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY
	      dacCore0_iseqFsm_state_mkFSMstate$D_IN;
	if (dacCore0_muteDAC$EN)
	  dacCore0_muteDAC <= `BSV_ASSIGNMENT_DELAY dacCore0_muteDAC$D_IN;
	if (dacCore0_syncMute$EN)
	  dacCore0_syncMute <= `BSV_ASSIGNMENT_DELAY dacCore0_syncMute$D_IN;
	if (dacCore0_syncOut$EN)
	  dacCore0_syncOut <= `BSV_ASSIGNMENT_DELAY dacCore0_syncOut$D_IN;
	if (dacCore0_tone$EN)
	  dacCore0_tone <= `BSV_ASSIGNMENT_DELAY dacCore0_tone$D_IN;
	if (dacCore0_undCount$EN)
	  dacCore0_undCount <= `BSV_ASSIGNMENT_DELAY dacCore0_undCount$D_IN;
      end
    if (dacCore0_dacCount$EN)
      dacCore0_dacCount <= `BSV_ASSIGNMENT_DELAY dacCore0_dacCount$D_IN;
  end
  always@(posedge wciS0_Clk or `BSV_RESET_EDGE wciS0_MReset_n)
  if (wciS0_MReset_n == `BSV_RESET_VALUE)
    begin
      dacCore0_ddrSDrv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      dacCore0_sampF_rRdPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
      dacCore0_sampF_rRdPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY 11'd0;
      dacCore0_sampF_rWrPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
      fcDac_grayCounter_rdCounter <= `BSV_ASSIGNMENT_DELAY 16'd0;
      fcDac_grayCounter_rdCounterPre <= `BSV_ASSIGNMENT_DELAY 16'd0;
      wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wsiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (dacCore0_ddrSDrv_isReset_isInReset$EN)
	dacCore0_ddrSDrv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    dacCore0_ddrSDrv_isReset_isInReset$D_IN;
      if (dacCore0_sampF_rRdPtr_rdCounter$EN)
	dacCore0_sampF_rRdPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY
	    dacCore0_sampF_rRdPtr_rdCounter$D_IN;
      if (dacCore0_sampF_rRdPtr_rdCounterPre$EN)
	dacCore0_sampF_rRdPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY
	    dacCore0_sampF_rRdPtr_rdCounterPre$D_IN;
      if (dacCore0_sampF_rWrPtr_rsCounter$EN)
	dacCore0_sampF_rWrPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY
	    dacCore0_sampF_rWrPtr_rsCounter$D_IN;
      if (fcDac_grayCounter_rdCounter$EN)
	fcDac_grayCounter_rdCounter <= `BSV_ASSIGNMENT_DELAY
	    fcDac_grayCounter_rdCounter$D_IN;
      if (fcDac_grayCounter_rdCounterPre$EN)
	fcDac_grayCounter_rdCounterPre <= `BSV_ASSIGNMENT_DELAY
	    fcDac_grayCounter_rdCounterPre$D_IN;
      if (wci_wslv_isReset_isInReset$EN)
	wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wci_wslv_isReset_isInReset$D_IN;
      if (wsiS_isReset_isInReset$EN)
	wsiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wsiS_isReset_isInReset$D_IN;
    end
  always@(posedge CLK_dac_clk or `BSV_RESET_EDGE RST_N_dac_rst)
  if (RST_N_dac_rst == `BSV_RESET_VALUE)
    begin
      wti_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (wti_isReset_isInReset$EN)
	wti_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wti_isReset_isInReset$D_IN;
    end
  always@(posedge dacCore0_ddrSDrv_ddrV$sdrClk or
	  `BSV_RESET_EDGE fcDac_testRst$OUT_RST)
  if (fcDac_testRst$OUT_RST == `BSV_RESET_VALUE)
    begin
      fcDac_grayCounter_rsCounter <= `BSV_ASSIGNMENT_DELAY 16'd0;
    end
  else
    begin
      if (fcDac_grayCounter_rsCounter$EN)
	fcDac_grayCounter_rsCounter <= `BSV_ASSIGNMENT_DELAY
	    fcDac_grayCounter_rsCounter$D_IN;
    end
  always@(posedge dacCore0_ddrSDrv_ddrV$sdrClk or
	  `BSV_RESET_EDGE dacCore0_sdrRst$OUT_RST)
  if (dacCore0_sdrRst$OUT_RST == `BSV_RESET_VALUE)
    begin
      dacCore0_sampF_rRdPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
      dacCore0_sampF_rWrPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
      dacCore0_sampF_rWrPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY 11'd0;
    end
  else
    begin
      if (dacCore0_sampF_rRdPtr_rsCounter$EN)
	dacCore0_sampF_rRdPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY
	    dacCore0_sampF_rRdPtr_rsCounter$D_IN;
      if (dacCore0_sampF_rWrPtr_rdCounter$EN)
	dacCore0_sampF_rWrPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY
	    dacCore0_sampF_rWrPtr_rdCounter$D_IN;
      if (dacCore0_sampF_rWrPtr_rdCounterPre$EN)
	dacCore0_sampF_rWrPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY
	    dacCore0_sampF_rWrPtr_rdCounterPre$D_IN;
    end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    dacControl = 32'hAAAAAAAA;
    dacCore0_calBit = 1'h0;
    dacCore0_dacCount = 8'hAA;
    dacCore0_dacCtrl_w = 4'hA;
    dacCore0_ddrSDrv_isReset_isInReset = 1'h0;
    dacCore0_emit = 1'h0;
    dacCore0_emitCnt = 32'hAAAAAAAA;
    dacCore0_emitD = 1'h0;
    dacCore0_iseqFsm_jj_delay_count = 13'h0AAA;
    dacCore0_iseqFsm_start_reg = 1'h0;
    dacCore0_iseqFsm_start_reg_1 = 1'h0;
    dacCore0_iseqFsm_state_can_overlap = 1'h0;
    dacCore0_iseqFsm_state_fired = 1'h0;
    dacCore0_iseqFsm_state_mkFSMstate = 4'hA;
    dacCore0_muteDAC = 1'h0;
    dacCore0_sampF_rRdPtr_rdCounter = 11'h2AA;
    dacCore0_sampF_rRdPtr_rdCounterPre = 11'h2AA;
    dacCore0_sampF_rRdPtr_rsCounter = 11'h2AA;
    dacCore0_sampF_rWrPtr_rdCounter = 11'h2AA;
    dacCore0_sampF_rWrPtr_rdCounterPre = 11'h2AA;
    dacCore0_sampF_rWrPtr_rsCounter = 11'h2AA;
    dacCore0_syncMute = 1'h0;
    dacCore0_syncOut = 1'h0;
    dacCore0_tone = 1'h0;
    dacCore0_undCount = 32'hAAAAAAAA;
    fcDac_countNow = 16'hAAAA;
    fcDac_countPast = 16'hAAAA;
    fcDac_frequency = 16'hAAAA;
    fcDac_grayCounter_rdCounter = 16'hAAAA;
    fcDac_grayCounter_rdCounterPre = 16'hAAAA;
    fcDac_grayCounter_rsCounter = 16'hAAAA;
    fcDac_pulseAction = 1'h0;
    fcDac_sampleCount = 16'hAAAA;
    firstUnderflowMesg = 32'hAAAAAAAA;
    hasUnderflowed = 1'h0;
    initOpInFlight = 1'h0;
    mesgStart = 32'hAAAAAAAA;
    oneKHz_value = 18'h2AAAA;
    opcode = 9'h0AA;
    rf = 12'hAAA;
    rf_1 = 12'hAAA;
    rf_10 = 12'hAAA;
    rf_11 = 12'hAAA;
    rf_12 = 12'hAAA;
    rf_13 = 12'hAAA;
    rf_14 = 12'hAAA;
    rf_15 = 12'hAAA;
    rf_2 = 12'hAAA;
    rf_3 = 12'hAAA;
    rf_4 = 12'hAAA;
    rf_5 = 12'hAAA;
    rf_6 = 12'hAAA;
    rf_7 = 12'hAAA;
    rf_8 = 12'hAAA;
    rf_9 = 12'hAAA;
    sFlagState = 1'h0;
    splitReadInFlight = 1'h0;
    srcCnt = 2'h2;
    stageCount = 32'hAAAAAAAA;
    syncCount = 32'hAAAAAAAA;
    takeEven = 1'h0;
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
    wordsConsumed = 8'hAA;
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
    wti_isReset_isInReset = 1'h0;
    wti_nowReq = 67'h2AAAAAAAAAAAAAAAA;
    wti_operateD = 1'h0;
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
	  v__h3702 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3702,
		 wci_wslv_reqF$D_OUT[36:34],
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DACWorker.bsv\", line 125, column 60: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	begin
	  v__h75780 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	$display("[%0d]: %m: WCI CONFIG READ Addr:%0x BE:%0x Data:%0x",
		 v__h75780,
		 wci_wslv_reqF$D_OUT[63:32],
		 wci_wslv_reqF$D_OUT[67:64],
		 _theResult____h75764);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	begin
	  v__h75623 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	$display("[%0d]: %m: WCI CONFIG WRITE Addr:%0x BE:%0x Data:%0x",
		 v__h75623,
		 wci_wslv_reqF$D_OUT[63:32],
		 wci_wslv_reqF$D_OUT[67:64],
		 wci_wslv_reqF$D_OUT[31:0]);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DACWorker.bsv\", line 125, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/DACWorker.bsv\", line 125, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/DACWorker.bsv\", line 125, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/wrk/DACWorker.bsv\", line 125, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and [RL_wci_cfrd] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DACWorker.bsv\", line 125, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/DACWorker.bsv\", line 125, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/DACWorker.bsv\", line 125, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DACWorker.bsv\", line 125, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/DACWorker.bsv\", line 125, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	begin
	  v__h4021 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h4021,
		 wci_wslv_cEdge,
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	begin
	  v__h3877 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h3877,
		 wci_wslv_cEdge,
		 wci_wslv_cState,
		 wci_wslv_nState);
  end
  // synopsys translate_on
  // synopsys translate_off
  always@(negedge dacCore0_ddrSDrv_ddrV$sdrClk)
  begin
    #0;
    if (dacCore0_sdrRst$OUT_RST != `BSV_RESET_VALUE)
      if (dacCore0_iseqFsm_state_mkFSMstate == 4'd1 &&
	  (WILL_FIRE_RL_dacCore0_iseqFsm_action_l102c10 ||
	   dacCore0_iseqFsm_state_mkFSMstate == 4'd3 ||
	   dacCore0_iseqFsm_state_mkFSMstate == 4'd4 ||
	   WILL_FIRE_RL_dacCore0_iseqFsm_action_np ||
	   WILL_FIRE_RL_dacCore0_iseqFsm_action_l105c13))
	$display("Error: \"bsv/dev/Max19692.bsv\", line 101, column 13: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_dacCore0_iseqFsm_action_l101c13] and\n  [RL_dacCore0_iseqFsm_action_l102c10, RL_dacCore0_iseqFsm_action_l103c13,\n  RL_dacCore0_iseqFsm_action_d_init_np, RL_dacCore0_iseqFsm_action_np,\n  RL_dacCore0_iseqFsm_action_l105c13] ) fired in the same clock cycle.\n");
    if (dacCore0_sdrRst$OUT_RST != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_dacCore0_iseqFsm_action_l102c10 &&
	  (dacCore0_iseqFsm_state_mkFSMstate == 4'd3 ||
	   dacCore0_iseqFsm_state_mkFSMstate == 4'd4 ||
	   WILL_FIRE_RL_dacCore0_iseqFsm_action_np ||
	   WILL_FIRE_RL_dacCore0_iseqFsm_action_l105c13))
	$display("Error: \"bsv/dev/Max19692.bsv\", line 102, column 10: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_dacCore0_iseqFsm_action_l102c10] and\n  [RL_dacCore0_iseqFsm_action_l103c13, RL_dacCore0_iseqFsm_action_d_init_np,\n  RL_dacCore0_iseqFsm_action_np, RL_dacCore0_iseqFsm_action_l105c13] ) fired\n  in the same clock cycle.\n");
    if (dacCore0_sdrRst$OUT_RST != `BSV_RESET_VALUE)
      if (dacCore0_iseqFsm_state_mkFSMstate == 4'd3 &&
	  (dacCore0_iseqFsm_state_mkFSMstate == 4'd4 ||
	   WILL_FIRE_RL_dacCore0_iseqFsm_action_np ||
	   WILL_FIRE_RL_dacCore0_iseqFsm_action_l105c13))
	$display("Error: \"bsv/dev/Max19692.bsv\", line 103, column 13: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_dacCore0_iseqFsm_action_l103c13] and\n  [RL_dacCore0_iseqFsm_action_d_init_np, RL_dacCore0_iseqFsm_action_np,\n  RL_dacCore0_iseqFsm_action_l105c13] ) fired in the same clock cycle.\n");
    if (dacCore0_sdrRst$OUT_RST != `BSV_RESET_VALUE)
      if (dacCore0_iseqFsm_state_mkFSMstate == 4'd4 &&
	  (WILL_FIRE_RL_dacCore0_iseqFsm_action_np ||
	   WILL_FIRE_RL_dacCore0_iseqFsm_action_l105c13))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_dacCore0_iseqFsm_action_d_init_np] and [RL_dacCore0_iseqFsm_action_np,\n  RL_dacCore0_iseqFsm_action_l105c13] ) fired in the same clock cycle.\n");
    if (dacCore0_sdrRst$OUT_RST != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_dacCore0_iseqFsm_action_np &&
	  WILL_FIRE_RL_dacCore0_iseqFsm_action_l105c13)
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_dacCore0_iseqFsm_action_np]\n  and [RL_dacCore0_iseqFsm_action_l105c13] ) fired in the same clock cycle.\n");
    if (dacCore0_sdrRst$OUT_RST != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_dacCore0_iseqFsm_action_l100c13 &&
	  (dacCore0_iseqFsm_state_mkFSMstate == 4'd1 ||
	   WILL_FIRE_RL_dacCore0_iseqFsm_action_l102c10 ||
	   dacCore0_iseqFsm_state_mkFSMstate == 4'd3 ||
	   dacCore0_iseqFsm_state_mkFSMstate == 4'd4 ||
	   WILL_FIRE_RL_dacCore0_iseqFsm_action_np ||
	   WILL_FIRE_RL_dacCore0_iseqFsm_action_l105c13))
	$display("Error: \"bsv/dev/Max19692.bsv\", line 100, column 13: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_dacCore0_iseqFsm_action_l100c13] and\n  [RL_dacCore0_iseqFsm_action_l101c13, RL_dacCore0_iseqFsm_action_l102c10,\n  RL_dacCore0_iseqFsm_action_l103c13, RL_dacCore0_iseqFsm_action_d_init_np,\n  RL_dacCore0_iseqFsm_action_np, RL_dacCore0_iseqFsm_action_l105c13] ) fired\n  in the same clock cycle.\n");
  end
  // synopsys translate_on
endmodule