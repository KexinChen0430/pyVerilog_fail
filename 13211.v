module outputs
  wire [31 : 0] wciS0_SData, wsiM0_MData;
  wire [11 : 0] wsiM0_MBurstLength;
  wire [7 : 0] wsiM0_MReqInfo;
  wire [3 : 0] wsiM0_MByteEn;
  wire [2 : 0] wsiM0_MCmd;
  wire [1 : 0] wciS0_SFlag, wciS0_SResp;
  wire CLK_GATE_adcSdrClk,
       CLK_GATE_adc_sclk,
       CLK_GATE_adc_sclkn,
       CLK_adcSdrClk,
       CLK_adc_sclk,
       CLK_adc_sclkn,
       RST_N_adcSdrRst,
       RST_N_adc_rst,
       adc_oe,
       adc_resetp,
       adc_sclkgate,
       adc_sen,
       adc_smosi,
       wciS0_SThreadBusy,
       wsiM0_MBurstPrecise,
       wsiM0_MReqLast,
       wsiM0_MReset_n,
       wtiS0_SReset_n,
       wtiS0_SThreadBusy;
  // inlined wires
  wire [95 : 0] wsiM_extStatusW$wget;
  wire [71 : 0] wci_wslv_wciReq$wget;
  wire [66 : 0] wti_wtiReq$wget;
  wire [63 : 0] adcCore_colGate_nowW$wget, adcCore_nowW$wget;
  wire [60 : 0] wsiM_reqFifo_x_wire$wget;
  wire [38 : 0] adcCore_sampF_wDataIn$wget, adcCore_sampF_wDataOut$wget;
  wire [33 : 0] wci_wslv_respF_x_wire$wget;
  wire [31 : 0] adcCore_colGate_sampDataW$wget,
		wci_wci_Es_mAddr_w$wget,
		wci_wci_Es_mData_w$wget;
  wire [17 : 0] fcAdc_grayCounter_wdCounterCrossing$wget;
  wire [15 : 0] adcCore_colGate_maxBurstLenW$wget;
  wire [10 : 0] adcCore_sampF_rRdPtr_wdCounterCrossing$wget,
		adcCore_sampF_rWrPtr_wdCounterCrossing$wget;
  wire [3 : 0] wci_wci_Es_mByteEn_w$wget;
  wire [2 : 0] wci_wci_Es_mCmd_w$wget, wci_wslv_wEdge$wget;
  wire adcCore_acquireDReg_1$wget,
       adcCore_acquireDReg_1$whas,
       adcCore_adcRst_1$wget,
       adcCore_adcRst_1$whas,
       adcCore_averageDReg_1$wget,
       adcCore_averageDReg_1$whas,
       adcCore_colGate_average_dw$wget,
       adcCore_colGate_average_dw$whas,
       adcCore_colGate_collectPW$whas,
       adcCore_colGate_enaSyncPW$whas,
       adcCore_colGate_enaTimestampPW$whas,
       adcCore_colGate_maxBurstLenW$whas,
       adcCore_colGate_nowW$whas,
       adcCore_colGate_operatePW$whas,
       adcCore_colGate_sampActive_1$wget,
       adcCore_colGate_sampActive_1$whas,
       adcCore_colGate_sampDataW$whas,
       adcCore_iseqFsm_abort$wget,
       adcCore_iseqFsm_abort$whas,
       adcCore_iseqFsm_start_reg_1_1$wget,
       adcCore_iseqFsm_start_reg_1_1$whas,
       adcCore_iseqFsm_start_wire$wget,
       adcCore_iseqFsm_start_wire$whas,
       adcCore_iseqFsm_state_fired_1$wget,
       adcCore_iseqFsm_state_fired_1$whas,
       adcCore_iseqFsm_state_overlap_pw$whas,
       adcCore_iseqFsm_state_set_pw$whas,
       adcCore_nowW$whas,
       adcCore_operateDReg_1$wget,
       adcCore_operateDReg_1$whas,
       adcCore_sampF_pwDequeue$whas,
       adcCore_sampF_pwEnqueue$whas,
       adcCore_sampF_rRdPtr_pwDecrement$whas,
       adcCore_sampF_rRdPtr_pwIncrement$whas,
       adcCore_sampF_rWrPtr_pwDecrement$whas,
       adcCore_sampF_rWrPtr_pwIncrement$whas,
       adcCore_sampF_wDataIn$whas,
       adcCore_sampF_wDataOut$whas,
       adcCore_spiI_cGate_1$wget,
       adcCore_spiI_cGate_1$whas,
       adcCore_spiI_csbR_1$wget,
       adcCore_spiI_csbR_1$whas,
       adcCore_spiI_doResp_1$wget,
       adcCore_spiI_doResp_1$whas,
       adcCore_spiI_reqF_dClear_pw$whas,
       adcCore_spiI_reqF_deq_happened$whas,
       adcCore_spiI_reqF_deq_pw$whas,
       adcCore_spiI_reqF_enq_pw$whas,
       adcCore_spiI_reqF_sClear_pw$whas,
       adcCore_spiI_respF_dClear_pw$whas,
       adcCore_spiI_respF_deq_happened$whas,
       adcCore_spiI_respF_deq_pw$whas,
       adcCore_spiI_respF_enq_pw$whas,
       adcCore_spiI_respF_sClear_pw$whas,
       adcCore_spiI_sdiWs$wget,
       adcCore_spiI_sdoR_1$wget,
       adcCore_spiI_sdoR_1$whas,
       fcAdc_grayCounter_pwDecrement$whas,
       fcAdc_grayCounter_pwIncrement$whas,
       fcAdc_pulseAction_1$wget,
       fcAdc_pulseAction_1$whas,
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
       wsiM_operateD_1$wget,
       wsiM_operateD_1$whas,
       wsiM_peerIsReady_1$wget,
       wsiM_peerIsReady_1$whas,
       wsiM_reqFifo_dequeueing$whas,
       wsiM_reqFifo_enqueueing$whas,
       wsiM_reqFifo_x_wire$whas,
       wsiM_sThreadBusy_pw$whas,
       wti_operateD_1$wget,
       wti_operateD_1$whas,
       wti_wtiReq$whas;
  // register adcControl
  reg [31 : 0] adcControl;
  wire [31 : 0] adcControl$D_IN;
  wire adcControl$EN;
  // register adcCore_acquireDReg
  reg adcCore_acquireDReg;
  wire adcCore_acquireDReg$D_IN, adcCore_acquireDReg$EN;
  // register adcCore_adcRst
  reg adcCore_adcRst;
  wire adcCore_adcRst$D_IN, adcCore_adcRst$EN;
  // register adcCore_averageDReg
  reg adcCore_averageDReg;
  wire adcCore_averageDReg$D_IN, adcCore_averageDReg$EN;
  // register adcCore_colGate_avgEven
  reg [17 : 0] adcCore_colGate_avgEven;
  wire [17 : 0] adcCore_colGate_avgEven$D_IN;
  wire adcCore_colGate_avgEven$EN;
  // register adcCore_colGate_avgOdd
  reg [17 : 0] adcCore_colGate_avgOdd;
  wire [17 : 0] adcCore_colGate_avgOdd$D_IN;
  wire adcCore_colGate_avgOdd$EN;
  // register adcCore_colGate_avgPhase
  reg [1 : 0] adcCore_colGate_avgPhase;
  wire [1 : 0] adcCore_colGate_avgPhase$D_IN;
  wire adcCore_colGate_avgPhase$EN;
  // register adcCore_colGate_collectD
  reg adcCore_colGate_collectD;
  wire adcCore_colGate_collectD$D_IN, adcCore_colGate_collectD$EN;
  // register adcCore_colGate_dropCount
  reg [31 : 0] adcCore_colGate_dropCount;
  wire [31 : 0] adcCore_colGate_dropCount$D_IN;
  wire adcCore_colGate_dropCount$EN;
  // register adcCore_colGate_dwellFails
  reg [31 : 0] adcCore_colGate_dwellFails;
  wire [31 : 0] adcCore_colGate_dwellFails$D_IN;
  wire adcCore_colGate_dwellFails$EN;
  // register adcCore_colGate_dwellStarts
  reg [31 : 0] adcCore_colGate_dwellStarts;
  wire [31 : 0] adcCore_colGate_dwellStarts$D_IN;
  wire adcCore_colGate_dwellStarts$EN;
  // register adcCore_colGate_ovrRecover
  reg [3 : 0] adcCore_colGate_ovrRecover;
  reg [3 : 0] adcCore_colGate_ovrRecover$D_IN;
  wire adcCore_colGate_ovrRecover$EN;
  // register adcCore_colGate_sampActive
  reg adcCore_colGate_sampActive;
  wire adcCore_colGate_sampActive$D_IN, adcCore_colGate_sampActive$EN;
  // register adcCore_colGate_sampActiveD
  reg adcCore_colGate_sampActiveD;
  wire adcCore_colGate_sampActiveD$D_IN, adcCore_colGate_sampActiveD$EN;
  // register adcCore_colGate_sampCount
  reg [31 : 0] adcCore_colGate_sampCount;
  wire [31 : 0] adcCore_colGate_sampCount$D_IN;
  wire adcCore_colGate_sampCount$EN;
  // register adcCore_colGate_sampDataWD
  reg [31 : 0] adcCore_colGate_sampDataWD;
  wire [31 : 0] adcCore_colGate_sampDataWD$D_IN;
  wire adcCore_colGate_sampDataWD$EN;
  // register adcCore_colGate_syncMesg
  reg [1 : 0] adcCore_colGate_syncMesg;
  wire [1 : 0] adcCore_colGate_syncMesg$D_IN;
  wire adcCore_colGate_syncMesg$EN;
  // register adcCore_colGate_timeMesg
  reg [2 : 0] adcCore_colGate_timeMesg;
  wire [2 : 0] adcCore_colGate_timeMesg$D_IN;
  wire adcCore_colGate_timeMesg$EN;
  // register adcCore_colGate_uprollCnt
  reg [15 : 0] adcCore_colGate_uprollCnt;
  wire [15 : 0] adcCore_colGate_uprollCnt$D_IN;
  wire adcCore_colGate_uprollCnt$EN;
  // register adcCore_iobA
  reg [13 : 0] adcCore_iobA;
  wire [13 : 0] adcCore_iobA$D_IN;
  wire adcCore_iobA$EN;
  // register adcCore_iobB
  reg [13 : 0] adcCore_iobB;
  wire [13 : 0] adcCore_iobB$D_IN;
  wire adcCore_iobB$EN;
  // register adcCore_iseqFsm_jj_delay_count
  reg [12 : 0] adcCore_iseqFsm_jj_delay_count;
  wire [12 : 0] adcCore_iseqFsm_jj_delay_count$D_IN;
  wire adcCore_iseqFsm_jj_delay_count$EN;
  // register adcCore_iseqFsm_start_reg
  reg adcCore_iseqFsm_start_reg;
  wire adcCore_iseqFsm_start_reg$D_IN, adcCore_iseqFsm_start_reg$EN;
  // register adcCore_iseqFsm_start_reg_1
  reg adcCore_iseqFsm_start_reg_1;
  wire adcCore_iseqFsm_start_reg_1$D_IN, adcCore_iseqFsm_start_reg_1$EN;
  // register adcCore_iseqFsm_state_can_overlap
  reg adcCore_iseqFsm_state_can_overlap;
  wire adcCore_iseqFsm_state_can_overlap$D_IN,
       adcCore_iseqFsm_state_can_overlap$EN;
  // register adcCore_iseqFsm_state_fired
  reg adcCore_iseqFsm_state_fired;
  wire adcCore_iseqFsm_state_fired$D_IN, adcCore_iseqFsm_state_fired$EN;
  // register adcCore_iseqFsm_state_mkFSMstate
  reg [3 : 0] adcCore_iseqFsm_state_mkFSMstate;
  reg [3 : 0] adcCore_iseqFsm_state_mkFSMstate$D_IN;
  wire adcCore_iseqFsm_state_mkFSMstate$EN;
  // register adcCore_operateDReg
  reg adcCore_operateDReg;
  wire adcCore_operateDReg$D_IN, adcCore_operateDReg$EN;
  // register adcCore_readMode
  reg adcCore_readMode;
  wire adcCore_readMode$D_IN, adcCore_readMode$EN;
  // register adcCore_samp
  reg [31 : 0] adcCore_samp;
  wire [31 : 0] adcCore_samp$D_IN;
  wire adcCore_samp$EN;
  // register adcCore_sampF_rRdPtr_rdCounter
  reg [10 : 0] adcCore_sampF_rRdPtr_rdCounter;
  wire [10 : 0] adcCore_sampF_rRdPtr_rdCounter$D_IN;
  wire adcCore_sampF_rRdPtr_rdCounter$EN;
  // register adcCore_sampF_rRdPtr_rdCounterPre
  reg [10 : 0] adcCore_sampF_rRdPtr_rdCounterPre;
  wire [10 : 0] adcCore_sampF_rRdPtr_rdCounterPre$D_IN;
  wire adcCore_sampF_rRdPtr_rdCounterPre$EN;
  // register adcCore_sampF_rRdPtr_rsCounter
  reg [10 : 0] adcCore_sampF_rRdPtr_rsCounter;
  wire [10 : 0] adcCore_sampF_rRdPtr_rsCounter$D_IN;
  wire adcCore_sampF_rRdPtr_rsCounter$EN;
  // register adcCore_sampF_rWrPtr_rdCounter
  reg [10 : 0] adcCore_sampF_rWrPtr_rdCounter;
  wire [10 : 0] adcCore_sampF_rWrPtr_rdCounter$D_IN;
  wire adcCore_sampF_rWrPtr_rdCounter$EN;
  // register adcCore_sampF_rWrPtr_rdCounterPre
  reg [10 : 0] adcCore_sampF_rWrPtr_rdCounterPre;
  wire [10 : 0] adcCore_sampF_rWrPtr_rdCounterPre$D_IN;
  wire adcCore_sampF_rWrPtr_rdCounterPre$EN;
  // register adcCore_sampF_rWrPtr_rsCounter
  reg [10 : 0] adcCore_sampF_rWrPtr_rsCounter;
  wire [10 : 0] adcCore_sampF_rWrPtr_rsCounter$D_IN;
  wire adcCore_sampF_rWrPtr_rsCounter$EN;
  // register adcCore_spiI_cGate
  reg adcCore_spiI_cGate;
  wire adcCore_spiI_cGate$D_IN, adcCore_spiI_cGate$EN;
  // register adcCore_spiI_cap
  reg adcCore_spiI_cap;
  wire adcCore_spiI_cap$D_IN, adcCore_spiI_cap$EN;
  // register adcCore_spiI_cap_1
  reg adcCore_spiI_cap_1;
  wire adcCore_spiI_cap_1$D_IN, adcCore_spiI_cap_1$EN;
  // register adcCore_spiI_cap_2
  reg adcCore_spiI_cap_2;
  wire adcCore_spiI_cap_2$D_IN, adcCore_spiI_cap_2$EN;
  // register adcCore_spiI_cap_3
  reg adcCore_spiI_cap_3;
  wire adcCore_spiI_cap_3$D_IN, adcCore_spiI_cap_3$EN;
  // register adcCore_spiI_cap_4
  reg adcCore_spiI_cap_4;
  wire adcCore_spiI_cap_4$D_IN, adcCore_spiI_cap_4$EN;
  // register adcCore_spiI_cap_5
  reg adcCore_spiI_cap_5;
  wire adcCore_spiI_cap_5$D_IN, adcCore_spiI_cap_5$EN;
  // register adcCore_spiI_cap_6
  reg adcCore_spiI_cap_6;
  wire adcCore_spiI_cap_6$D_IN, adcCore_spiI_cap_6$EN;
  // register adcCore_spiI_cap_7
  reg adcCore_spiI_cap_7;
  wire adcCore_spiI_cap_7$D_IN, adcCore_spiI_cap_7$EN;
  // register adcCore_spiI_csbR
  reg adcCore_spiI_csbR;
  wire adcCore_spiI_csbR$D_IN, adcCore_spiI_csbR$EN;
  // register adcCore_spiI_dPos
  reg [2 : 0] adcCore_spiI_dPos;
  wire [2 : 0] adcCore_spiI_dPos$D_IN;
  wire adcCore_spiI_dPos$EN;
  // register adcCore_spiI_doResp
  reg adcCore_spiI_doResp;
  wire adcCore_spiI_doResp$D_IN, adcCore_spiI_doResp$EN;
  // register adcCore_spiI_iPos
  reg [3 : 0] adcCore_spiI_iPos;
  wire [3 : 0] adcCore_spiI_iPos$D_IN;
  wire adcCore_spiI_iPos$EN;
  // register adcCore_spiI_reqF_head_wrapped
  reg adcCore_spiI_reqF_head_wrapped;
  wire adcCore_spiI_reqF_head_wrapped$D_IN, adcCore_spiI_reqF_head_wrapped$EN;
  // register adcCore_spiI_reqF_tail_wrapped
  reg adcCore_spiI_reqF_tail_wrapped;
  wire adcCore_spiI_reqF_tail_wrapped$D_IN, adcCore_spiI_reqF_tail_wrapped$EN;
  // register adcCore_spiI_reqS
  reg [16 : 0] adcCore_spiI_reqS;
  reg [16 : 0] adcCore_spiI_reqS$D_IN;
  wire adcCore_spiI_reqS$EN;
  // register adcCore_spiI_respF_head_wrapped
  reg adcCore_spiI_respF_head_wrapped;
  wire adcCore_spiI_respF_head_wrapped$D_IN,
       adcCore_spiI_respF_head_wrapped$EN;
  // register adcCore_spiI_respF_tail_wrapped
  reg adcCore_spiI_respF_tail_wrapped;
  wire adcCore_spiI_respF_tail_wrapped$D_IN,
       adcCore_spiI_respF_tail_wrapped$EN;
  // register adcCore_spiI_respS
  reg [7 : 0] adcCore_spiI_respS;
  wire [7 : 0] adcCore_spiI_respS$D_IN;
  wire adcCore_spiI_respS$EN;
  // register adcCore_spiI_sdiP
  reg adcCore_spiI_sdiP;
  wire adcCore_spiI_sdiP$D_IN, adcCore_spiI_sdiP$EN;
  // register adcCore_spiI_sdoR
  reg adcCore_spiI_sdoR;
  wire adcCore_spiI_sdoR$D_IN, adcCore_spiI_sdoR$EN;
  // register adcCore_spiI_xmt_d
  reg adcCore_spiI_xmt_d;
  wire adcCore_spiI_xmt_d$D_IN, adcCore_spiI_xmt_d$EN;
  // register adcCore_spiI_xmt_i
  reg adcCore_spiI_xmt_i;
  wire adcCore_spiI_xmt_i$D_IN, adcCore_spiI_xmt_i$EN;
  // register fcAdc_countNow
  reg [17 : 0] fcAdc_countNow;
  wire [17 : 0] fcAdc_countNow$D_IN;
  wire fcAdc_countNow$EN;
  // register fcAdc_countPast
  reg [17 : 0] fcAdc_countPast;
  wire [17 : 0] fcAdc_countPast$D_IN;
  wire fcAdc_countPast$EN;
  // register fcAdc_frequency
  reg [17 : 0] fcAdc_frequency;
  wire [17 : 0] fcAdc_frequency$D_IN;
  wire fcAdc_frequency$EN;
  // register fcAdc_grayCounter_rdCounter
  reg [17 : 0] fcAdc_grayCounter_rdCounter;
  wire [17 : 0] fcAdc_grayCounter_rdCounter$D_IN;
  wire fcAdc_grayCounter_rdCounter$EN;
  // register fcAdc_grayCounter_rdCounterPre
  reg [17 : 0] fcAdc_grayCounter_rdCounterPre;
  wire [17 : 0] fcAdc_grayCounter_rdCounterPre$D_IN;
  wire fcAdc_grayCounter_rdCounterPre$EN;
  // register fcAdc_grayCounter_rsCounter
  reg [17 : 0] fcAdc_grayCounter_rsCounter;
  wire [17 : 0] fcAdc_grayCounter_rsCounter$D_IN;
  wire fcAdc_grayCounter_rsCounter$EN;
  // register fcAdc_pulseAction
  reg fcAdc_pulseAction;
  wire fcAdc_pulseAction$D_IN, fcAdc_pulseAction$EN;
  // register fcAdc_sampleCount
  reg [15 : 0] fcAdc_sampleCount;
  wire [15 : 0] fcAdc_sampleCount$D_IN;
  wire fcAdc_sampleCount$EN;
  // register initOpInFlight
  reg initOpInFlight;
  wire initOpInFlight$D_IN, initOpInFlight$EN;
  // register lastOverflowMesg
  reg [31 : 0] lastOverflowMesg;
  wire [31 : 0] lastOverflowMesg$D_IN;
  wire lastOverflowMesg$EN;
  // register maxMesgLength
  reg [31 : 0] maxMesgLength;
  wire [31 : 0] maxMesgLength$D_IN;
  wire maxMesgLength$EN;
  // register mesgCount
  reg [31 : 0] mesgCount;
  wire [31 : 0] mesgCount$D_IN;
  wire mesgCount$EN;
  // register oneKHz_value
  reg [17 : 0] oneKHz_value;
  wire [17 : 0] oneKHz_value$D_IN;
  wire oneKHz_value$EN;
  // register overflowCountD
  reg [31 : 0] overflowCountD;
  wire [31 : 0] overflowCountD$D_IN;
  wire overflowCountD$EN;
  // register sFlagState
  reg sFlagState;
  wire sFlagState$D_IN, sFlagState$EN;
  // register spiResp
  reg [7 : 0] spiResp;
  wire [7 : 0] spiResp$D_IN;
  wire spiResp$EN;
  // register splitReadInFlight
  reg splitReadInFlight;
  wire splitReadInFlight$D_IN, splitReadInFlight$EN;
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
  // ports of submodule adcCore_acquireD
  wire adcCore_acquireD$dD_OUT,
       adcCore_acquireD$sD_IN,
       adcCore_acquireD$sEN,
       adcCore_acquireD$sRDY;
  // ports of submodule adcCore_averageD
  wire adcCore_averageD$dD_OUT,
       adcCore_averageD$sD_IN,
       adcCore_averageD$sEN,
       adcCore_averageD$sRDY;
  // ports of submodule adcCore_colGate_sampF
  reg [38 : 0] adcCore_colGate_sampF$D_IN;
  wire [38 : 0] adcCore_colGate_sampF$D_OUT;
  wire adcCore_colGate_sampF$CLR,
       adcCore_colGate_sampF$DEQ,
       adcCore_colGate_sampF$EMPTY_N,
       adcCore_colGate_sampF$ENQ,
       adcCore_colGate_sampF$FULL_N;
  // ports of submodule adcCore_maxBurstLengthR
  wire [15 : 0] adcCore_maxBurstLengthR$dD_OUT, adcCore_maxBurstLengthR$sD_IN;
  wire adcCore_maxBurstLengthR$sEN, adcCore_maxBurstLengthR$sRDY;
  // ports of submodule adcCore_operateD
  wire adcCore_operateD$dD_OUT,
       adcCore_operateD$sD_IN,
       adcCore_operateD$sEN,
       adcCore_operateD$sRDY;
  // ports of submodule adcCore_reqF
  wire [16 : 0] adcCore_reqF$D_IN, adcCore_reqF$D_OUT;
  wire adcCore_reqF$CLR,
       adcCore_reqF$DEQ,
       adcCore_reqF$EMPTY_N,
       adcCore_reqF$ENQ,
       adcCore_reqF$FULL_N;
  // ports of submodule adcCore_sampCC
  wire [31 : 0] adcCore_sampCC$dD_OUT, adcCore_sampCC$sD_IN;
  wire adcCore_sampCC$sEN, adcCore_sampCC$sRDY;
  // ports of submodule adcCore_sampF_memory
  wire [38 : 0] adcCore_sampF_memory$DIA,
		adcCore_sampF_memory$DIB,
		adcCore_sampF_memory$DOB;
  wire [9 : 0] adcCore_sampF_memory$ADDRA, adcCore_sampF_memory$ADDRB;
  wire adcCore_sampF_memory$ENA,
       adcCore_sampF_memory$ENB,
       adcCore_sampF_memory$WEA,
       adcCore_sampF_memory$WEB;
  // ports of submodule adcCore_sdrRst
  wire adcCore_sdrRst$OUT_RST;
  // ports of submodule adcCore_spiI_cd
  wire adcCore_spiI_cd$CLK_OUT, adcCore_spiI_cd$PREEDGE;
  // ports of submodule adcCore_spiI_cinv
  wire adcCore_spiI_cinv$CLK_OUT;
  // ports of submodule adcCore_spiI_reqF_dCombinedReset
  wire adcCore_spiI_reqF_dCombinedReset$RST_OUT;
  // ports of submodule adcCore_spiI_reqF_dCrossedsReset
  wire adcCore_spiI_reqF_dCrossedsReset$OUT_RST;
  // ports of submodule adcCore_spiI_reqF_dInReset
  wire adcCore_spiI_reqF_dInReset$VAL;
  // ports of submodule adcCore_spiI_reqF_sCombinedReset
  wire adcCore_spiI_reqF_sCombinedReset$RST_OUT;
  // ports of submodule adcCore_spiI_reqF_sCrosseddReset
  wire adcCore_spiI_reqF_sCrosseddReset$OUT_RST;
  // ports of submodule adcCore_spiI_reqF_sInReset
  wire adcCore_spiI_reqF_sInReset$VAL;
  // ports of submodule adcCore_spiI_respF_dCombinedReset
  wire adcCore_spiI_respF_dCombinedReset$RST_OUT;
  // ports of submodule adcCore_spiI_respF_dCrossedsReset
  wire adcCore_spiI_respF_dCrossedsReset$OUT_RST;
  // ports of submodule adcCore_spiI_respF_dInReset
  wire adcCore_spiI_respF_dInReset$VAL;
  // ports of submodule adcCore_spiI_respF_sCombinedReset
  wire adcCore_spiI_respF_sCombinedReset$RST_OUT;
  // ports of submodule adcCore_spiI_respF_sCrosseddReset
  wire adcCore_spiI_respF_sCrosseddReset$OUT_RST;
  // ports of submodule adcCore_spiI_respF_sInReset
  wire adcCore_spiI_respF_sInReset$VAL;
  // ports of submodule adcCore_spiI_slowReset
  wire adcCore_spiI_slowReset$OUT_RST;
  // ports of submodule adcCore_statsCC
  wire [127 : 0] adcCore_statsCC$dD_OUT, adcCore_statsCC$sD_IN;
  wire adcCore_statsCC$sEN, adcCore_statsCC$sRDY;
  // ports of submodule fcAdc_testRst
  wire fcAdc_testRst$OUT_RST;
  // ports of submodule wci_wslv_reqF
  wire [71 : 0] wci_wslv_reqF$D_IN, wci_wslv_reqF$D_OUT;
  wire wci_wslv_reqF$CLR,
       wci_wslv_reqF$DEQ,
       wci_wslv_reqF$EMPTY_N,
       wci_wslv_reqF$ENQ;
  // rule scheduling signals
  wire CAN_FIRE_RL_get_adc_resp,
       CAN_FIRE_RL_wci_cfrd,
       WILL_FIRE_RL_adcCore_advance_spi_request,
       WILL_FIRE_RL_adcCore_colGate_capture_collect,
       WILL_FIRE_RL_adcCore_colGate_count_dropped_samples,
       WILL_FIRE_RL_adcCore_colGate_count_dwells,
       WILL_FIRE_RL_adcCore_colGate_form_avg4_sample,
       WILL_FIRE_RL_adcCore_colGate_overrun_recovery,
       WILL_FIRE_RL_adcCore_colGate_send_sync_mesg,
       WILL_FIRE_RL_adcCore_colGate_send_timestamp_mesg,
       WILL_FIRE_RL_adcCore_iseqFsm_action_l138c12,
       WILL_FIRE_RL_adcCore_iseqFsm_action_l141c9,
       WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9,
       WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9,
       WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9,
       WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9,
       WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9,
       WILL_FIRE_RL_adcCore_iseqFsm_action_np,
       WILL_FIRE_RL_adcCore_iseqFsm_fsm_start,
       WILL_FIRE_RL_adcCore_iseqFsm_idle_l137c3,
       WILL_FIRE_RL_adcCore_spiI_reqF_deq_update_head,
       WILL_FIRE_RL_adcCore_spiI_reqF_enq_update_tail,
       WILL_FIRE_RL_adcCore_spiI_respF_deq_update_head,
       WILL_FIRE_RL_adcCore_spiI_respF_enq_update_tail,
       WILL_FIRE_RL_adcCore_spiI_send_d,
       WILL_FIRE_RL_adcCore_spiI_send_i,
       WILL_FIRE_RL_adcCore_spiI_start_cs,
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
       WILL_FIRE_RL_wsiM_reqFifo_both,
       WILL_FIRE_RL_wsiM_reqFifo_decCtr,
       WILL_FIRE_RL_wsiM_reqFifo_deq,
       WILL_FIRE_RL_wsiM_reqFifo_incCtr;
  // inputs to muxes for submodule ports
  reg [33 : 0] MUX_wci_wslv_respF_q_0$write_1__VAL_2;
  wire [60 : 0] MUX_wsiM_reqFifo_q_0$write_1__VAL_1,
		MUX_wsiM_reqFifo_q_0$write_1__VAL_2,
		MUX_wsiM_reqFifo_q_1$write_1__VAL_1;
  wire [38 : 0] MUX_adcCore_colGate_sampF$enq_1__VAL_1,
		MUX_adcCore_colGate_sampF$enq_1__VAL_2,
		MUX_adcCore_colGate_sampF$enq_1__VAL_3;
  wire [33 : 0] MUX_wci_wslv_respF_q_0$write_1__VAL_1,
		MUX_wci_wslv_respF_q_1$write_1__VAL_1,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_1,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_2,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_3;
  wire [31 : 0] MUX_adcCore_colGate_dropCount$write_1__VAL_1,
		MUX_adcCore_colGate_dwellFails$write_1__VAL_1,
		MUX_adcCore_colGate_dwellStarts$write_1__VAL_1,
		MUX_adcCore_colGate_sampCount$write_1__VAL_1;
  wire [17 : 0] MUX_fcAdc_grayCounter_rsCounter$write_1__VAL_1,
		MUX_oneKHz_value$write_1__VAL_1;
  wire [16 : 0] MUX_adcCore_reqF$enq_1__VAL_1,
		MUX_adcCore_reqF$enq_1__VAL_2,
		MUX_adcCore_spiI_reqS$write_1__VAL_1;
  wire [15 : 0] MUX_adcCore_colGate_uprollCnt$write_1__VAL_2;
  wire [12 : 0] MUX_adcCore_iseqFsm_jj_delay_count$write_1__VAL_1;
  wire [10 : 0] MUX_adcCore_sampF_rRdPtr_rsCounter$write_1__VAL_1,
		MUX_adcCore_sampF_rWrPtr_rsCounter$write_1__VAL_1;
  wire [3 : 0] MUX_adcCore_colGate_ovrRecover$write_1__VAL_2,
	       MUX_adcCore_spiI_iPos$write_1__VAL_1;
  wire [2 : 0] MUX_adcCore_colGate_timeMesg$write_1__VAL_1,
	       MUX_adcCore_spiI_dPos$write_1__VAL_1;
  wire [1 : 0] MUX_adcCore_colGate_syncMesg$write_1__VAL_1,
	       MUX_wci_wslv_respF_c_r$write_1__VAL_1,
	       MUX_wci_wslv_respF_c_r$write_1__VAL_2,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_1,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_2;
  wire MUX_adcCore_colGate_dwellFails$write_1__SEL_1,
       MUX_adcCore_colGate_sampF$enq_1__SEL_1,
       MUX_adcCore_reqF$enq_1__SEL_1,
       MUX_adcCore_spiI_sdoR_1$wset_1__VAL_1,
       MUX_adcCore_spiI_sdoR_1$wset_1__VAL_2,
       MUX_adcCore_spiI_xmt_d$write_1__SEL_2,
       MUX_splitReadInFlight$write_1__PSEL_1,
       MUX_wci_wslv_illegalEdge$write_1__SEL_1,
       MUX_wci_wslv_illegalEdge$write_1__VAL_1,
       MUX_wci_wslv_respF_q_0$write_1__SEL_2,
       MUX_wci_wslv_respF_q_1$write_1__SEL_2,
       MUX_wci_wslv_respF_x_wire$wset_1__SEL_1,
       MUX_wci_wslv_respF_x_wire$wset_1__SEL_2,
       MUX_wsiM_reqFifo_q_0$write_1__SEL_2,
       MUX_wsiM_reqFifo_q_1$write_1__SEL_2;
  // remaining internal signals
  reg [63 : 0] v__h3700, v__h3875, v__h4019, v__h62856, v__h63353;
  reg [31 : 0] IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190,
	       x1_data__h14584;
  reg CASE_adcCore_colGate_avgPhase_0b1_0_1_1_1_2_1__ETC__q2;
  wire [63 : 0] wti_nowReq_BITS_63_TO_0__q1;
  wire [31 : 0] IF_adcCore_sampF_rRdPtr_rsCounter_48_BIT_0_55__ETC___d1412,
		IF_adcCore_sampF_rRdPtr_rsCounter_48_BIT_0_55__ETC___d1413,
		IF_adcCore_sampF_rWrPtr_rsCounter_79_BIT_0_86__ETC___d1295,
		IF_adcCore_sampF_rWrPtr_rsCounter_79_BIT_0_86__ETC___d1410,
		IF_fcAdc_grayCounter_rsCounter_60_BIT_0_67_OR__ETC___d1407,
		IF_fcAdc_grayCounter_rsCounter_60_BIT_0_67_XOR_ETC___d1408,
		adcStatusLs__h63134,
		avgDataBW__h14897,
		d_data__h14984,
		rdat__h63337,
		rdat__h63416,
		rdat__h63498,
		rdat__h63518;
  wire [17 : 0] x__h15249,
		x__h15259,
		x__h15325,
		x__h15399,
		x__h15409,
		x__h7511,
		y__h15410,
		y__h15412,
		y__h8916;
  wire [11 : 0] x_burstLength__h61970;
  wire [10 : 0] adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247,
		x__h17578,
		x__h19880,
		x__h23307,
		x_dReadBin__h21693,
		x_sReadBin__h21690,
		y__h18465,
		y__h20767;
  wire [9 : 0] x2__h23276;
  wire [7 : 0] adcCore_spiI_reqS_BITS_15_TO_8__q3,
	       adcCore_spiI_reqS_BITS_7_TO_0__q4;
  wire NOT_adcCore_sampF_rRdPtr_rsCounter_48_EQ_adcCo_ETC___d1051,
       NOT_adcCore_spiI_reqF_head_wrapped__read__71_E_ETC___d814,
       adcCore_colGate_operatePW_whas__24_AND_adcCore_ETC___d379,
       adcCore_colGate_operatePW_whas__24_AND_adcCore_ETC___d390,
       adcCore_colGate_sampF_RDY_first__93_AND_NOT_ad_ETC___d750,
       adcCore_colGate_uprollCnt_93_EQ_adcCore_colGat_ETC___d1303,
       adcCore_iseqFsm_abort_whas__69_AND_adcCore_ise_ETC___d941,
       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1242,
       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1243,
       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1244,
       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1245,
       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1246,
       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1249,
       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1262,
       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1263,
       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1264,
       adcCore_sampF_rRdPtr_rsCounter_48_BIT_0_55_XOR_ETC___d1344,
       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1236,
       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1237,
       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1238,
       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1239,
       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1240,
       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1241,
       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1257,
       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1260,
       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1261,
       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1304,
       adcCore_sampF_rWrPtr_rsCounter_79_BIT_0_86_XOR_ETC___d1289,
       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1230,
       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1231,
       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1232,
       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1233,
       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1234,
       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1235,
       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1256,
       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1258,
       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1259,
       adcCore_spiI_reqF_head_wrapped_crossed__63_EQ__ETC___d919,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1219,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1220,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1221,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1222,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1223,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1224,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1225,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1226,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1227,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1228,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1229,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1250,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1252,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1253,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1254,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1266,
       fcAdc_grayCounter_rsCounter_60_BIT_0_67_XOR_fc_ETC___d1343,
       wci_wslv_reqF_i_notEmpty__4_AND_IF_wci_wslv_re_ETC___d1098,
       z__h18509,
       z__h18516,
       z__h18523,
       z__h18530,
       z__h18537,
       z__h18544,
       z__h18551,
       z__h18558,
       z__h18565,
       z__h20811,
       z__h20818,
       z__h20825,
       z__h20832,
       z__h20839,
       z__h20846,
       z__h20853,
       z__h20860,
       z__h20867,
       z__h7531,
       z__h7538,
       z__h7545,
       z__h7552,
       z__h7559,
       z__h7566,
       z__h7573,
       z__h7580,
       z__h7587,
       z__h7594,
       z__h7601,
       z__h7608,
       z__h7615,
       z__h7622,
       z__h7629,
       z__h7636;
  // oscillator and gates for output clock CLK_adc_sclk
  assign CLK_adc_sclk = adcCore_spiI_cd$CLK_OUT ;
  assign CLK_GATE_adc_sclk = 1'b1 ;
  // oscillator and gates for output clock CLK_adc_sclkn
  assign CLK_adc_sclkn = adcCore_spiI_cinv$CLK_OUT ;
  assign CLK_GATE_adc_sclkn = 1'b1 ;
  // oscillator and gates for output clock CLK_adcSdrClk
  assign CLK_adcSdrClk = CLK_adc_clock ;
  assign CLK_GATE_adcSdrClk = 1'd1 ;
  // output resets
  assign RST_N_adc_rst = adcCore_spiI_slowReset$OUT_RST ;
  assign RST_N_adcSdrRst = adcCore_sdrRst$OUT_RST ;
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
  // value method adc_oe
  assign adc_oe = 1'd1 ;
  // value method adc_sclkgate
  assign adc_sclkgate = adcCore_spiI_cGate ;
  // value method adc_resetp
  assign adc_resetp = adcCore_adcRst ;
  // value method adc_sen
  assign adc_sen = adcCore_spiI_csbR ;
  // value method adc_smosi
  assign adc_smosi = adcCore_spiI_sdoR ;
  // submodule adcCore_acquireD
  SyncRegister #(.width(32'd1),
		 .init(1'd0)) adcCore_acquireD(.sCLK(wciS0_Clk),
					       .dCLK(CLK_adc_clock),
					       .sRST(wciS0_MReset_n),
					       .sD_IN(adcCore_acquireD$sD_IN),
					       .sEN(adcCore_acquireD$sEN),
					       .dD_OUT(adcCore_acquireD$dD_OUT),
					       .sRDY(adcCore_acquireD$sRDY));
  // submodule adcCore_averageD
  SyncRegister #(.width(32'd1),
		 .init(1'd0)) adcCore_averageD(.sCLK(wciS0_Clk),
					       .dCLK(CLK_adc_clock),
					       .sRST(wciS0_MReset_n),
					       .sD_IN(adcCore_averageD$sD_IN),
					       .sEN(adcCore_averageD$sEN),
					       .dD_OUT(adcCore_averageD$dD_OUT),
					       .sRDY(adcCore_averageD$sRDY));
  // submodule adcCore_colGate_sampF
  arSRLFIFOD #(.width(32'd39),
	       .l2depth(32'd4)) adcCore_colGate_sampF(.CLK(CLK_adc_clock),
						      .RST_N(adcCore_sdrRst$OUT_RST),
						      .D_IN(adcCore_colGate_sampF$D_IN),
						      .CLR(adcCore_colGate_sampF$CLR),
						      .DEQ(adcCore_colGate_sampF$DEQ),
						      .ENQ(adcCore_colGate_sampF$ENQ),
						      .D_OUT(adcCore_colGate_sampF$D_OUT),
						      .EMPTY_N(adcCore_colGate_sampF$EMPTY_N),
						      .FULL_N(adcCore_colGate_sampF$FULL_N));
  // submodule adcCore_maxBurstLengthR
  SyncRegister #(.width(32'd16),
		 .init(16'd0)) adcCore_maxBurstLengthR(.sCLK(wciS0_Clk),
						       .dCLK(CLK_adc_clock),
						       .sRST(wciS0_MReset_n),
						       .sD_IN(adcCore_maxBurstLengthR$sD_IN),
						       .sEN(adcCore_maxBurstLengthR$sEN),
						       .dD_OUT(adcCore_maxBurstLengthR$dD_OUT),
						       .sRDY(adcCore_maxBurstLengthR$sRDY));
  // submodule adcCore_operateD
  SyncRegister #(.width(32'd1),
		 .init(1'd0)) adcCore_operateD(.sCLK(wciS0_Clk),
					       .dCLK(CLK_adc_clock),
					       .sRST(wciS0_MReset_n),
					       .sD_IN(adcCore_operateD$sD_IN),
					       .sEN(adcCore_operateD$sEN),
					       .dD_OUT(adcCore_operateD$dD_OUT),
					       .sRDY(adcCore_operateD$sRDY));
  // submodule adcCore_reqF
  FIFO2 #(.width(32'd17), .guarded(32'd1)) adcCore_reqF(.RST(wciS0_MReset_n),
							.CLK(wciS0_Clk),
							.D_IN(adcCore_reqF$D_IN),
							.ENQ(adcCore_reqF$ENQ),
							.DEQ(adcCore_reqF$DEQ),
							.CLR(adcCore_reqF$CLR),
							.D_OUT(adcCore_reqF$D_OUT),
							.FULL_N(adcCore_reqF$FULL_N),
							.EMPTY_N(adcCore_reqF$EMPTY_N));
  // submodule adcCore_sampCC
  SyncRegister #(.width(32'd32),
		 .init(32'd0)) adcCore_sampCC(.sCLK(CLK_adc_clock),
					      .dCLK(wciS0_Clk),
					      .sRST(adcCore_sdrRst$OUT_RST),
					      .sD_IN(adcCore_sampCC$sD_IN),
					      .sEN(adcCore_sampCC$sEN),
					      .dD_OUT(adcCore_sampCC$dD_OUT),
					      .sRDY(adcCore_sampCC$sRDY));
  // submodule adcCore_sampF_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd10),
	  .DATA_WIDTH(32'd39),
	  .MEMSIZE(11'd1024)) adcCore_sampF_memory(.CLKA(CLK_adc_clock),
						   .CLKB(wciS0_Clk),
						   .ADDRA(adcCore_sampF_memory$ADDRA),
						   .ADDRB(adcCore_sampF_memory$ADDRB),
						   .DIA(adcCore_sampF_memory$DIA),
						   .DIB(adcCore_sampF_memory$DIB),
						   .WEA(adcCore_sampF_memory$WEA),
						   .WEB(adcCore_sampF_memory$WEB),
						   .ENA(adcCore_sampF_memory$ENA),
						   .ENB(adcCore_sampF_memory$ENB),
						   .DOA(),
						   .DOB(adcCore_sampF_memory$DOB));
  // submodule adcCore_sdrRst
  SyncResetA #(.RSTDELAY(32'd1)) adcCore_sdrRst(.CLK(CLK_adc_clock),
						.IN_RST(wciS0_MReset_n),
						.OUT_RST(adcCore_sdrRst$OUT_RST));
  // submodule adcCore_spiI_cd
  ClockDiv #(.width(32'd3),
	     .lower(32'd0),
	     .upper(32'd7),
	     .offset(32'd0)) adcCore_spiI_cd(.CLK_IN(wciS0_Clk),
					     .RST(wciS0_MReset_n),
					     .PREEDGE(adcCore_spiI_cd$PREEDGE),
					     .CLK_OUT(adcCore_spiI_cd$CLK_OUT));
  // submodule adcCore_spiI_cinv
  ClockInverter adcCore_spiI_cinv(.CLK_IN(adcCore_spiI_cd$CLK_OUT),
				  .PREEDGE(),
				  .CLK_OUT(adcCore_spiI_cinv$CLK_OUT));
  // submodule adcCore_spiI_reqF_dCombinedReset
  ResetEither adcCore_spiI_reqF_dCombinedReset(.A_RST(adcCore_spiI_slowReset$OUT_RST),
					       .B_RST(adcCore_spiI_reqF_dCrossedsReset$OUT_RST),
					       .RST_OUT(adcCore_spiI_reqF_dCombinedReset$RST_OUT));
  // submodule adcCore_spiI_reqF_dCrossedsReset
  SyncReset0 adcCore_spiI_reqF_dCrossedsReset(.IN_RST(wciS0_MReset_n),
					      .OUT_RST(adcCore_spiI_reqF_dCrossedsReset$OUT_RST));
  // submodule adcCore_spiI_reqF_dInReset
  ResetToBool adcCore_spiI_reqF_dInReset(.RST(adcCore_spiI_reqF_dCombinedReset$RST_OUT),
					 .VAL(adcCore_spiI_reqF_dInReset$VAL));
  // submodule adcCore_spiI_reqF_sCombinedReset
  ResetEither adcCore_spiI_reqF_sCombinedReset(.A_RST(wciS0_MReset_n),
					       .B_RST(adcCore_spiI_reqF_sCrosseddReset$OUT_RST),
					       .RST_OUT(adcCore_spiI_reqF_sCombinedReset$RST_OUT));
  // submodule adcCore_spiI_reqF_sCrosseddReset
  SyncReset0 adcCore_spiI_reqF_sCrosseddReset(.IN_RST(adcCore_spiI_slowReset$OUT_RST),
					      .OUT_RST(adcCore_spiI_reqF_sCrosseddReset$OUT_RST));
  // submodule adcCore_spiI_reqF_sInReset
  ResetToBool adcCore_spiI_reqF_sInReset(.RST(adcCore_spiI_reqF_sCombinedReset$RST_OUT),
					 .VAL(adcCore_spiI_reqF_sInReset$VAL));
  // submodule adcCore_spiI_respF_dCombinedReset
  ResetEither adcCore_spiI_respF_dCombinedReset(.A_RST(wciS0_MReset_n),
						.B_RST(adcCore_spiI_respF_dCrossedsReset$OUT_RST),
						.RST_OUT(adcCore_spiI_respF_dCombinedReset$RST_OUT));
  // submodule adcCore_spiI_respF_dCrossedsReset
  SyncReset0 adcCore_spiI_respF_dCrossedsReset(.IN_RST(adcCore_spiI_slowReset$OUT_RST),
					       .OUT_RST(adcCore_spiI_respF_dCrossedsReset$OUT_RST));
  // submodule adcCore_spiI_respF_dInReset
  ResetToBool adcCore_spiI_respF_dInReset(.RST(adcCore_spiI_respF_dCombinedReset$RST_OUT),
					  .VAL(adcCore_spiI_respF_dInReset$VAL));
  // submodule adcCore_spiI_respF_sCombinedReset
  ResetEither adcCore_spiI_respF_sCombinedReset(.A_RST(adcCore_spiI_slowReset$OUT_RST),
						.B_RST(adcCore_spiI_respF_sCrosseddReset$OUT_RST),
						.RST_OUT(adcCore_spiI_respF_sCombinedReset$RST_OUT));
  // submodule adcCore_spiI_respF_sCrosseddReset
  SyncReset0 adcCore_spiI_respF_sCrosseddReset(.IN_RST(wciS0_MReset_n),
					       .OUT_RST(adcCore_spiI_respF_sCrosseddReset$OUT_RST));
  // submodule adcCore_spiI_respF_sInReset
  ResetToBool adcCore_spiI_respF_sInReset(.RST(adcCore_spiI_respF_sCombinedReset$RST_OUT),
					  .VAL(adcCore_spiI_respF_sInReset$VAL));
  // submodule adcCore_spiI_slowReset
  SyncResetA #(.RSTDELAY(32'd1)) adcCore_spiI_slowReset(.CLK(adcCore_spiI_cd$CLK_OUT),
							.IN_RST(wciS0_MReset_n),
							.OUT_RST(adcCore_spiI_slowReset$OUT_RST));
  // submodule adcCore_statsCC
  SyncRegister #(.width(32'd128),
		 .init(128'd0)) adcCore_statsCC(.sCLK(CLK_adc_clock),
						.dCLK(wciS0_Clk),
						.sRST(adcCore_sdrRst$OUT_RST),
						.sD_IN(adcCore_statsCC$sD_IN),
						.sEN(adcCore_statsCC$sEN),
						.dD_OUT(adcCore_statsCC$dD_OUT),
						.sRDY(adcCore_statsCC$sRDY));
  // submodule fcAdc_testRst
  SyncResetA #(.RSTDELAY(32'd1)) fcAdc_testRst(.CLK(CLK_adcCaptureClk),
					       .IN_RST(wciS0_MReset_n),
					       .OUT_RST(fcAdc_testRst$OUT_RST));
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
  // rule RL_get_adc_resp
  assign CAN_FIRE_RL_get_adc_resp =
	     adcCore_spiI_respF_head_wrapped !=
	     adcCore_spiI_respF_tail_wrapped &&
	     !adcCore_spiI_respF_dInReset$VAL &&
	     adcCore_spiI_cd$PREEDGE &&
	     (!splitReadInFlight || wci_wslv_respF_c_r != 2'd2) ;
  // rule RL_wci_cfwr
  assign WILL_FIRE_RL_wci_cfwr =
	     wci_wslv_respF_c_r != 2'd2 &&
	     wci_wslv_reqF_i_notEmpty__4_AND_IF_wci_wslv_re_ETC___d1098 &&
	     wci_wslv_wci_cfwr_pw$whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
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
  // rule RL_wci_ctrl_IsO
  assign WILL_FIRE_RL_wci_ctrl_IsO =
	     wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd1 &&
	     wci_wslv_reqF$D_OUT[36:34] == 3'd1 ;
  // rule RL_wci_ctrl_OrE
  assign WILL_FIRE_RL_wci_ctrl_OrE =
	     wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd2 &&
	     wci_wslv_reqF$D_OUT[36:34] == 3'd3 ;
  // rule RL_adcCore_advance_spi_request
  assign WILL_FIRE_RL_adcCore_advance_spi_request =
	     adcCore_spiI_reqF_head_wrapped_crossed__63_EQ__ETC___d919 &&
	     adcCore_reqF$EMPTY_N &&
	     adcCore_iseqFsm_abort_whas__69_AND_adcCore_ise_ETC___d941 &&
	     !adcCore_iseqFsm_start_reg ;
  // rule RL_adcCore_colGate_send_timestamp_mesg
  assign WILL_FIRE_RL_adcCore_colGate_send_timestamp_mesg =
	     adcCore_colGate_sampF$FULL_N && adcCore_operateD$dD_OUT &&
	     adcCore_colGate_timeMesg != 3'd0 ;
  // rule RL_adcCore_colGate_send_sync_mesg
  assign WILL_FIRE_RL_adcCore_colGate_send_sync_mesg =
	     adcCore_colGate_sampF$FULL_N && adcCore_operateD$dD_OUT &&
	     adcCore_colGate_syncMesg != 2'd0 &&
	     adcCore_colGate_timeMesg == 3'd0 ;
  // rule RL_adcCore_colGate_capture_collect
  assign WILL_FIRE_RL_adcCore_colGate_capture_collect =
	     adcCore_colGate_sampF$FULL_N &&
	     adcCore_colGate_operatePW_whas__24_AND_adcCore_ETC___d390 ;
  // rule RL_adcCore_colGate_form_avg4_sample
  assign WILL_FIRE_RL_adcCore_colGate_form_avg4_sample =
	     CASE_adcCore_colGate_avgPhase_0b1_0_1_1_1_2_1__ETC__q2 &&
	     adcCore_operateD$dD_OUT ;
  // rule RL_adcCore_colGate_overrun_recovery
  assign WILL_FIRE_RL_adcCore_colGate_overrun_recovery =
	     (adcCore_colGate_ovrRecover != 4'd15 ||
	      adcCore_colGate_sampF$FULL_N) &&
	     adcCore_colGate_operatePW_whas__24_AND_adcCore_ETC___d379 &&
	     adcCore_colGate_ovrRecover != 4'd0 &&
	     !WILL_FIRE_RL_adcCore_colGate_send_sync_mesg ;
  // rule RL_adcCore_colGate_count_dropped_samples
  assign WILL_FIRE_RL_adcCore_colGate_count_dropped_samples =
	     adcCore_colGate_operatePW_whas__24_AND_adcCore_ETC___d379 &&
	     adcCore_colGate_sampActive &&
	     !adcCore_colGate_sampF$FULL_N &&
	     !WILL_FIRE_RL_adcCore_colGate_overrun_recovery ;
  // rule RL_adcCore_colGate_count_dwells
  assign WILL_FIRE_RL_adcCore_colGate_count_dwells =
	     adcCore_operateD$dD_OUT && adcCore_acquireD$dD_OUT &&
	     !adcCore_colGate_collectD ;
  // rule RL_adcCore_spiI_start_cs
  assign WILL_FIRE_RL_adcCore_spiI_start_cs =
	     NOT_adcCore_spiI_reqF_head_wrapped__read__71_E_ETC___d814 &&
	     !adcCore_spiI_xmt_i &&
	     !adcCore_spiI_xmt_d ;
  // rule RL_adcCore_spiI_send_d
  assign WILL_FIRE_RL_adcCore_spiI_send_d =
	     NOT_adcCore_spiI_reqF_head_wrapped__read__71_E_ETC___d814 &&
	     !adcCore_spiI_reqF_dInReset$VAL &&
	     adcCore_spiI_xmt_d ;
  // rule RL_adcCore_spiI_send_i
  assign WILL_FIRE_RL_adcCore_spiI_send_i =
	     NOT_adcCore_spiI_reqF_head_wrapped__read__71_E_ETC___d814 &&
	     !adcCore_spiI_reqF_dInReset$VAL &&
	     adcCore_spiI_xmt_i ;
  // rule RL_adcCore_spiI_reqF_deq_update_head
  assign WILL_FIRE_RL_adcCore_spiI_reqF_deq_update_head =
	     !adcCore_spiI_reqF_dInReset$VAL &&
	     MUX_adcCore_spiI_xmt_d$write_1__SEL_2 ;
  // rule RL_adcCore_spiI_respF_enq_update_tail
  assign WILL_FIRE_RL_adcCore_spiI_respF_enq_update_tail =
	     !adcCore_spiI_respF_sInReset$VAL &&
	     adcCore_spiI_respF_enq_pw$whas ;
  // rule RL_adcCore_spiI_respF_deq_update_head
  assign WILL_FIRE_RL_adcCore_spiI_respF_deq_update_head =
	     !adcCore_spiI_respF_dInReset$VAL &&
	     MUX_splitReadInFlight$write_1__PSEL_1 ;
  // rule RL_adcCore_iseqFsm_action_np
  assign WILL_FIRE_RL_adcCore_iseqFsm_action_np =
	     !adcCore_iseqFsm_jj_delay_count[12] &&
	     (adcCore_iseqFsm_state_mkFSMstate == 4'd3 ||
	      adcCore_iseqFsm_state_mkFSMstate == 4'd4) ;
  // rule RL_adcCore_iseqFsm_action_l141c9
  assign WILL_FIRE_RL_adcCore_iseqFsm_action_l141c9 =
	     adcCore_spiI_reqF_head_wrapped_crossed__63_EQ__ETC___d919 &&
	     adcCore_iseqFsm_jj_delay_count[12] &&
	     (adcCore_iseqFsm_state_mkFSMstate == 4'd3 ||
	      adcCore_iseqFsm_state_mkFSMstate == 4'd4) ;
  // rule RL_adcCore_iseqFsm_action_l142c9
  assign WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9 =
	     adcCore_spiI_reqF_head_wrapped_crossed__63_EQ__ETC___d919 &&
	     adcCore_iseqFsm_state_mkFSMstate == 4'd5 ;
  // rule RL_adcCore_iseqFsm_action_l143c9
  assign WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9 =
	     adcCore_spiI_reqF_head_wrapped_crossed__63_EQ__ETC___d919 &&
	     adcCore_iseqFsm_state_mkFSMstate == 4'd6 ;
  // rule RL_adcCore_iseqFsm_action_l144c9
  assign WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9 =
	     adcCore_spiI_reqF_head_wrapped_crossed__63_EQ__ETC___d919 &&
	     adcCore_iseqFsm_state_mkFSMstate == 4'd7 ;
  // rule RL_adcCore_iseqFsm_action_l145c9
  assign WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 =
	     adcCore_spiI_reqF_head_wrapped_crossed__63_EQ__ETC___d919 &&
	     adcCore_iseqFsm_state_mkFSMstate == 4'd8 ;
  // rule RL_adcCore_iseqFsm_action_l146c9
  assign WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9 =
	     adcCore_spiI_reqF_head_wrapped_crossed__63_EQ__ETC___d919 &&
	     adcCore_iseqFsm_state_mkFSMstate == 4'd9 ;
  // rule RL_adcCore_spiI_reqF_enq_update_tail
  assign WILL_FIRE_RL_adcCore_spiI_reqF_enq_update_tail =
	     !adcCore_spiI_reqF_sInReset$VAL &&
	     adcCore_spiI_reqF_enq_pw$whas ;
  // rule RL_wci_cfrd
  assign CAN_FIRE_RL_wci_cfrd =
	     wci_wslv_reqF$EMPTY_N &&
	     (wci_wslv_reqF$D_OUT[43:42] != 2'b01 || adcCore_reqF$FULL_N) &&
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b01 ||
	      wci_wslv_respF_c_r != 2'd2) &&
	     wci_wslv_wci_cfrd_pw$whas ;
  assign WILL_FIRE_RL_wci_cfrd =
	     CAN_FIRE_RL_wci_cfrd && !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
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
  // rule RL_adcCore_iseqFsm_fsm_start
  assign WILL_FIRE_RL_adcCore_iseqFsm_fsm_start =
	     adcCore_iseqFsm_abort_whas__69_AND_adcCore_ise_ETC___d941 &&
	     adcCore_iseqFsm_start_reg ;
  // rule RL_adcCore_iseqFsm_action_l138c12
  assign WILL_FIRE_RL_adcCore_iseqFsm_action_l138c12 =
	     adcCore_iseqFsm_start_wire$whas &&
	     (adcCore_iseqFsm_state_mkFSMstate == 4'd0 ||
	      adcCore_iseqFsm_state_mkFSMstate == 4'd10) ;
  // rule RL_adcCore_iseqFsm_idle_l137c3
  assign WILL_FIRE_RL_adcCore_iseqFsm_idle_l137c3 =
	     !adcCore_iseqFsm_start_wire$whas &&
	     adcCore_iseqFsm_state_mkFSMstate == 4'd10 ;
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
  // inputs to muxes for submodule ports
  assign MUX_adcCore_colGate_dwellFails$write_1__SEL_1 =
	     WILL_FIRE_RL_adcCore_colGate_count_dropped_samples &&
	     adcCore_colGate_ovrRecover == 4'd0 ;
  assign MUX_adcCore_colGate_sampF$enq_1__SEL_1 =
	     WILL_FIRE_RL_adcCore_colGate_overrun_recovery &&
	     adcCore_colGate_ovrRecover == 4'd15 ;
  assign MUX_adcCore_reqF$enq_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr &&
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	      wci_wslv_reqF$D_OUT[39:32] == 8'h28 ||
	      wci_wslv_reqF$D_OUT[43:42] == 2'b01) ;
  assign MUX_adcCore_spiI_xmt_d$write_1__SEL_2 =
	     WILL_FIRE_RL_adcCore_spiI_send_d && adcCore_spiI_dPos == 3'd0 ;
  assign MUX_splitReadInFlight$write_1__PSEL_1 =
	     CAN_FIRE_RL_get_adc_resp &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
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
  assign MUX_wci_wslv_respF_x_wire$wset_1__SEL_1 =
	     MUX_splitReadInFlight$write_1__PSEL_1 && splitReadInFlight ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__SEL_2 =
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[43:42] != 2'b01 ;
  assign MUX_wsiM_reqFifo_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ;
  assign MUX_adcCore_colGate_dropCount$write_1__VAL_1 =
	     adcCore_colGate_dropCount + 32'd1 ;
  assign MUX_adcCore_colGate_dwellFails$write_1__VAL_1 =
	     adcCore_colGate_dwellFails + 32'd1 ;
  assign MUX_adcCore_colGate_dwellStarts$write_1__VAL_1 =
	     adcCore_colGate_dwellStarts + 32'd1 ;
  assign MUX_adcCore_colGate_ovrRecover$write_1__VAL_2 =
	     adcCore_colGate_ovrRecover - 4'd1 ;
  assign MUX_adcCore_colGate_sampCount$write_1__VAL_1 =
	     adcCore_colGate_sampCount + 32'd1 ;
  assign MUX_adcCore_colGate_sampF$enq_1__VAL_1 =
	     { 7'd31, adcCore_colGate_sampDataWD } ;
  assign MUX_adcCore_colGate_sampF$enq_1__VAL_2 =
	     { 2'd2,
	       adcCore_colGate_timeMesg == 3'h1,
	       4'd15,
	       x1_data__h14584 } ;
  assign MUX_adcCore_colGate_sampF$enq_1__VAL_3 =
	     { 2'd0,
	       adcCore_colGate_uprollCnt_93_EQ_adcCore_colGat_ETC___d1303,
	       4'd15,
	       d_data__h14984 } ;
  assign MUX_adcCore_colGate_syncMesg$write_1__VAL_1 =
	     adcCore_colGate_syncMesg - 2'd1 ;
  assign MUX_adcCore_colGate_timeMesg$write_1__VAL_1 =
	     adcCore_colGate_timeMesg - 3'd1 ;
  assign MUX_adcCore_colGate_uprollCnt$write_1__VAL_2 =
	     adcCore_colGate_uprollCnt_93_EQ_adcCore_colGat_ETC___d1303 ?
	       16'd0 :
	       adcCore_colGate_uprollCnt + 16'd1 ;
  assign MUX_adcCore_iseqFsm_jj_delay_count$write_1__VAL_1 =
	     { adcCore_iseqFsm_jj_delay_count[11:0], 1'd0 } ;
  assign MUX_adcCore_reqF$enq_1__VAL_1 =
	     { wci_wslv_reqF$D_OUT[43:42] == 2'b0 && wci_wslv_reqF$D_OUT[31],
	       (wci_wslv_reqF$D_OUT[43:42] == 2'b0) ?
		 wci_wslv_reqF$D_OUT[15:0] :
		 { wci_wslv_reqF$D_OUT[41:34], wci_wslv_reqF$D_OUT[7:0] } } ;
  assign MUX_adcCore_reqF$enq_1__VAL_2 =
	     { 1'd1, wci_wslv_reqF$D_OUT[41:34], 8'd0 } ;
  assign MUX_adcCore_sampF_rRdPtr_rsCounter$write_1__VAL_1 =
	     (~adcCore_sampF_rRdPtr_rsCounter[IF_adcCore_sampF_rRdPtr_rsCounter_48_BIT_0_55__ETC___d1412[3:0]]) ?
	       adcCore_sampF_rRdPtr_rsCounter | x__h19880 :
	       adcCore_sampF_rRdPtr_rsCounter & y__h20767 ;
  assign MUX_adcCore_sampF_rWrPtr_rsCounter$write_1__VAL_1 =
	     (~adcCore_sampF_rWrPtr_rsCounter[IF_adcCore_sampF_rWrPtr_rsCounter_79_BIT_0_86__ETC___d1410[3:0]]) ?
	       adcCore_sampF_rWrPtr_rsCounter | x__h17578 :
	       adcCore_sampF_rWrPtr_rsCounter & y__h18465 ;
  assign MUX_adcCore_spiI_dPos$write_1__VAL_1 =
	     (adcCore_spiI_dPos == 3'd0) ?
	       adcCore_spiI_dPos :
	       adcCore_spiI_dPos - 3'd1 ;
  assign MUX_adcCore_spiI_iPos$write_1__VAL_1 =
	     (adcCore_spiI_iPos == 4'd0) ?
	       adcCore_spiI_iPos :
	       adcCore_spiI_iPos - 4'd1 ;
  assign MUX_adcCore_spiI_reqS$write_1__VAL_1 =
	     (adcCore_reqF$D_OUT[16] && !adcCore_readMode) ?
	       17'd1 :
	       ((!adcCore_reqF$D_OUT[16] && adcCore_readMode) ?
		  17'd0 :
		  adcCore_reqF$D_OUT) ;
  assign MUX_adcCore_spiI_sdoR_1$wset_1__VAL_1 =
	     adcCore_spiI_reqS_BITS_15_TO_8__q3[adcCore_spiI_iPos[2:0]] ;
  assign MUX_adcCore_spiI_sdoR_1$wset_1__VAL_2 =
	     adcCore_spiI_reqS_BITS_7_TO_0__q4[adcCore_spiI_dPos] ;
  assign MUX_fcAdc_grayCounter_rsCounter$write_1__VAL_1 =
	     (~fcAdc_grayCounter_rsCounter[IF_fcAdc_grayCounter_rsCounter_60_BIT_0_67_XOR_ETC___d1408[4:0]]) ?
	       fcAdc_grayCounter_rsCounter | x__h7511 :
	       fcAdc_grayCounter_rsCounter & y__h8916 ;
  assign MUX_oneKHz_value$write_1__VAL_1 =
	     (oneKHz_value == 18'd99999) ? 18'd0 : oneKHz_value + 18'd1 ;
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
  always@(MUX_wci_wslv_respF_x_wire$wset_1__SEL_1 or
	  MUX_wci_wslv_respF_x_wire$wset_1__VAL_1 or
	  MUX_wci_wslv_respF_x_wire$wset_1__SEL_2 or
	  MUX_wci_wslv_respF_x_wire$wset_1__VAL_2 or
	  WILL_FIRE_RL_wci_wslv_ctl_op_complete or
	  MUX_wci_wslv_respF_x_wire$wset_1__VAL_3 or WILL_FIRE_RL_wci_cfwr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_wslv_respF_x_wire$wset_1__SEL_1:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_1;
      MUX_wci_wslv_respF_x_wire$wset_1__SEL_2:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_2;
      WILL_FIRE_RL_wci_wslv_ctl_op_complete:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_3;
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
	     { 26'd16777216, adcCore_spiI_respS } ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__VAL_2 = { 2'd1, rdat__h63337 } ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__VAL_3 =
	     wci_wslv_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_1 = wsiM_reqFifo_c_r + 2'd1 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_2 = wsiM_reqFifo_c_r - 2'd1 ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_1 =
	     (wsiM_reqFifo_c_r == 2'd1) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_2 :
	       wsiM_reqFifo_q_1 ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_2 =
	     { 3'd1,
	       adcCore_sampF_memory$DOB[36],
	       1'd0,
	       x_burstLength__h61970,
	       adcCore_sampF_memory$DOB[31:0],
	       10'd960,
	       adcCore_sampF_memory$DOB[38:37] } ;
  assign MUX_wsiM_reqFifo_q_1$write_1__VAL_1 =
	     (wsiM_reqFifo_c_r == 2'd2) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_2 :
	       61'h00000AAAAAAAAA00 ;
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
	     MUX_splitReadInFlight$write_1__PSEL_1 && splitReadInFlight ||
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[43:42] != 2'b01 ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete ||
	     WILL_FIRE_RL_wci_cfwr ;
  assign wci_wslv_wEdge$wget = wci_wslv_reqF$D_OUT[36:34] ;
  assign wci_wslv_wEdge$whas = WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_sFlagReg_1$wget = 1'd1 ;
  assign wci_wslv_sFlagReg_1$whas = sFlagState ;
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
  assign fcAdc_pulseAction_1$wget = 1'd1 ;
  assign fcAdc_pulseAction_1$whas = oneKHz_value == 18'd99999 ;
  assign adcCore_colGate_average_dw$wget = 1'd1 ;
  assign adcCore_colGate_average_dw$whas = adcCore_averageD$dD_OUT ;
  assign adcCore_colGate_sampActive_1$wget = 1'd1 ;
  assign adcCore_colGate_sampActive_1$whas = 1'd1 ;
  assign adcCore_colGate_nowW$wget = wti_nowReq[63:0] ;
  assign adcCore_colGate_nowW$whas = 1'd1 ;
  assign adcCore_colGate_maxBurstLenW$wget = adcCore_maxBurstLengthR$dD_OUT ;
  assign adcCore_colGate_maxBurstLenW$whas = 1'd1 ;
  assign adcCore_colGate_sampDataW$wget = adcCore_samp ;
  assign adcCore_colGate_sampDataW$whas = 1'd1 ;
  assign adcCore_operateDReg_1$wget = 1'd1 ;
  assign adcCore_operateDReg_1$whas = wci_wslv_cState == 3'd2 ;
  assign adcCore_acquireDReg_1$wget = 1'd1 ;
  assign adcCore_acquireDReg_1$whas =
	     wci_wslv_cState == 3'd2 && !adcControl[0] &&
	     (!adcControl[3] || overflowCountD == 32'd0) ;
  assign adcCore_averageDReg_1$wget = 1'd1 ;
  assign adcCore_averageDReg_1$whas =
	     wci_wslv_cState == 3'd2 && adcControl[4] ;
  assign adcCore_sampF_wDataIn$wget = adcCore_colGate_sampF$D_OUT ;
  assign adcCore_sampF_wDataIn$whas = adcCore_sampF_pwEnqueue$whas ;
  assign adcCore_sampF_wDataOut$wget = adcCore_sampF_memory$DOB ;
  assign adcCore_sampF_wDataOut$whas = 1'd1 ;
  assign adcCore_nowW$wget = wti_nowReq[63:0] ;
  assign adcCore_nowW$whas = 1'd1 ;
  assign adcCore_spiI_cGate_1$wget = 1'd1 ;
  assign adcCore_spiI_cGate_1$whas =
	     WILL_FIRE_RL_adcCore_spiI_send_i ||
	     WILL_FIRE_RL_adcCore_spiI_send_d ;
  assign adcCore_spiI_sdoR_1$wget =
	     WILL_FIRE_RL_adcCore_spiI_send_i ?
	       MUX_adcCore_spiI_sdoR_1$wset_1__VAL_1 :
	       MUX_adcCore_spiI_sdoR_1$wset_1__VAL_2 ;
  assign adcCore_spiI_sdoR_1$whas = adcCore_spiI_cGate_1$whas ;
  assign adcCore_spiI_csbR_1$wget = 1'b0 ;
  assign adcCore_spiI_csbR_1$whas = adcCore_spiI_cGate_1$whas ;
  assign adcCore_spiI_doResp_1$wget = adcCore_spiI_reqS[16] ;
  assign adcCore_spiI_doResp_1$whas = MUX_adcCore_spiI_xmt_d$write_1__SEL_2 ;
  assign adcCore_adcRst_1$wget = 1'd1 ;
  assign adcCore_adcRst_1$whas =
	     adcCore_iseqFsm_state_mkFSMstate == 4'd1 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l138c12 ;
  assign adcCore_iseqFsm_start_wire$wget = 1'd1 ;
  assign adcCore_iseqFsm_start_wire$whas =
	     WILL_FIRE_RL_adcCore_iseqFsm_fsm_start ||
	     adcCore_iseqFsm_start_reg_1 && !adcCore_iseqFsm_state_fired ;
  assign adcCore_iseqFsm_start_reg_1_1$wget = 1'd1 ;
  assign adcCore_iseqFsm_start_reg_1_1$whas =
	     adcCore_iseqFsm_start_wire$whas ;
  assign adcCore_iseqFsm_abort$wget = 1'b0 ;
  assign adcCore_iseqFsm_abort$whas = 1'b0 ;
  assign adcCore_iseqFsm_state_fired_1$wget = 1'd1 ;
  assign adcCore_iseqFsm_state_fired_1$whas =
	     adcCore_iseqFsm_state_set_pw$whas ;
  assign wti_wtiReq$wget = 67'h0 ;
  assign wti_wtiReq$whas = 1'b0 ;
  assign wti_operateD_1$wget = 1'b0 ;
  assign wti_operateD_1$whas = 1'b0 ;
  assign wsiM_reqFifo_x_wire$wget = MUX_wsiM_reqFifo_q_0$write_1__VAL_2 ;
  assign wsiM_reqFifo_x_wire$whas = wsiM_reqFifo_enqueueing$whas ;
  assign wsiM_operateD_1$wget = 1'd1 ;
  assign wsiM_operateD_1$whas = wci_wslv_cState == 3'd2 ;
  assign wsiM_peerIsReady_1$wget = 1'd1 ;
  assign wsiM_peerIsReady_1$whas = wsiM0_SReset_n ;
  assign wci_wslv_reqF_r_enq$whas = wci_wslv_wciReq$wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF_r_deq$whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_reqF_r_clr$whas = 1'b0 ;
  assign wci_wslv_respF_enqueueing$whas =
	     MUX_splitReadInFlight$write_1__PSEL_1 && splitReadInFlight ||
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[43:42] != 2'b01 ||
	     WILL_FIRE_RL_wci_cfwr ||
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
  assign fcAdc_grayCounter_pwIncrement$whas = 1'd1 ;
  assign fcAdc_grayCounter_pwDecrement$whas = 1'b0 ;
  assign oneKHz_incAction$whas = 1'd1 ;
  assign oneKHz_decAction$whas = 1'b0 ;
  assign adcCore_colGate_operatePW$whas = adcCore_operateD$dD_OUT ;
  assign adcCore_colGate_collectPW$whas = adcCore_acquireD$dD_OUT ;
  assign adcCore_colGate_enaSyncPW$whas = 1'b0 ;
  assign adcCore_colGate_enaTimestampPW$whas = 1'b0 ;
  assign adcCore_sampF_rWrPtr_pwIncrement$whas =
	     adcCore_sampF_pwEnqueue$whas ;
  assign adcCore_sampF_rWrPtr_pwDecrement$whas = 1'b0 ;
  assign adcCore_sampF_rRdPtr_pwIncrement$whas =
	     adcCore_sampF_pwDequeue$whas ;
  assign adcCore_sampF_rRdPtr_pwDecrement$whas = 1'b0 ;
  assign adcCore_sampF_pwDequeue$whas =
	     NOT_adcCore_sampF_rRdPtr_rsCounter_48_EQ_adcCo_ETC___d1051 &&
	     wci_wslv_cState != 3'd2 ||
	     wsiM_reqFifo_enqueueing$whas ;
  assign adcCore_sampF_pwEnqueue$whas =
	     adcCore_colGate_sampF$EMPTY_N &&
	     adcCore_colGate_sampF_RDY_first__93_AND_NOT_ad_ETC___d750 ;
  assign adcCore_spiI_reqF_enq_pw$whas =
	     WILL_FIRE_RL_adcCore_advance_spi_request ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l141c9 ;
  assign adcCore_spiI_reqF_deq_pw$whas =
	     MUX_adcCore_spiI_xmt_d$write_1__SEL_2 ;
  assign adcCore_spiI_reqF_sClear_pw$whas = 1'b0 ;
  assign adcCore_spiI_reqF_dClear_pw$whas = 1'b0 ;
  assign adcCore_spiI_reqF_deq_happened$whas = 1'b0 ;
  assign adcCore_spiI_respF_enq_pw$whas =
	     adcCore_spiI_respF_head_wrapped ==
	     adcCore_spiI_respF_tail_wrapped &&
	     !adcCore_spiI_respF_sInReset$VAL &&
	     adcCore_spiI_doResp ;
  assign adcCore_spiI_respF_deq_pw$whas =
	     MUX_splitReadInFlight$write_1__PSEL_1 ;
  assign adcCore_spiI_respF_sClear_pw$whas = 1'b0 ;
  assign adcCore_spiI_respF_dClear_pw$whas = 1'b0 ;
  assign adcCore_spiI_respF_deq_happened$whas = 1'b0 ;
  assign adcCore_iseqFsm_state_set_pw$whas =
	     WILL_FIRE_RL_adcCore_iseqFsm_idle_l137c3 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l141c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_np ||
	     adcCore_iseqFsm_state_mkFSMstate == 4'd2 ||
	     adcCore_iseqFsm_state_mkFSMstate == 4'd1 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l138c12 ;
  assign adcCore_iseqFsm_state_overlap_pw$whas = 1'b0 ;
  assign wsiM_reqFifo_enqueueing$whas =
	     wsiM_reqFifo_c_r != 2'd2 &&
	     NOT_adcCore_sampF_rRdPtr_rsCounter_48_EQ_adcCo_ETC___d1051 &&
	     wci_wslv_cState == 3'd2 ;
  assign wsiM_reqFifo_dequeueing$whas = WILL_FIRE_RL_wsiM_reqFifo_deq ;
  assign wsiM_sThreadBusy_pw$whas = wsiM0_SThreadBusy ;
  assign fcAdc_grayCounter_wdCounterCrossing$wget =
	     fcAdc_grayCounter_rsCounter ;
  assign adcCore_sampF_rWrPtr_wdCounterCrossing$wget =
	     adcCore_sampF_rWrPtr_rsCounter ;
  assign adcCore_sampF_rRdPtr_wdCounterCrossing$wget =
	     adcCore_sampF_rRdPtr_rsCounter ;
  assign adcCore_spiI_sdiWs$wget = adcCore_spiI_sdiP ;
  assign wsiM_extStatusW$wget =
	     { wsiM_pMesgCount, wsiM_iMesgCount, wsiM_tBusyCount } ;
  // register adcControl
  assign adcControl$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign adcControl$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h0C ;
  // register adcCore_acquireDReg
  assign adcCore_acquireDReg$D_IN = adcCore_acquireDReg_1$whas ;
  assign adcCore_acquireDReg$EN = 1'd1 ;
  // register adcCore_adcRst
  assign adcCore_adcRst$D_IN = adcCore_adcRst_1$whas ;
  assign adcCore_adcRst$EN = 1'd1 ;
  // register adcCore_averageDReg
  assign adcCore_averageDReg$D_IN = adcCore_averageDReg_1$whas ;
  assign adcCore_averageDReg$EN = 1'd1 ;
  // register adcCore_colGate_avgEven
  assign adcCore_colGate_avgEven$D_IN =
	     (adcCore_colGate_avgPhase == 2'd0) ? x__h15325 : x__h15249 ;
  assign adcCore_colGate_avgEven$EN =
	     WILL_FIRE_RL_adcCore_colGate_form_avg4_sample &&
	     (adcCore_colGate_avgPhase == 2'd0 ||
	      adcCore_colGate_avgPhase == 2'd1) ;
  // register adcCore_colGate_avgOdd
  assign adcCore_colGate_avgOdd$D_IN =
	     (adcCore_colGate_avgPhase == 2'd2) ? x__h15325 : x__h15399 ;
  assign adcCore_colGate_avgOdd$EN =
	     WILL_FIRE_RL_adcCore_colGate_form_avg4_sample &&
	     (adcCore_colGate_avgPhase == 2'd2 ||
	      adcCore_colGate_avgPhase == 2'd3) ;
  // register adcCore_colGate_avgPhase
  assign adcCore_colGate_avgPhase$D_IN = adcCore_colGate_avgPhase + 2'd1 ;
  assign adcCore_colGate_avgPhase$EN =
	     WILL_FIRE_RL_adcCore_colGate_form_avg4_sample ;
  // register adcCore_colGate_collectD
  assign adcCore_colGate_collectD$D_IN =
	     adcCore_operateD$dD_OUT && adcCore_acquireD$dD_OUT ;
  assign adcCore_colGate_collectD$EN = 1'b1 ;
  // register adcCore_colGate_dropCount
  assign adcCore_colGate_dropCount$D_IN =
	     WILL_FIRE_RL_adcCore_colGate_count_dropped_samples ?
	       MUX_adcCore_colGate_dropCount$write_1__VAL_1 :
	       32'd0 ;
  assign adcCore_colGate_dropCount$EN =
	     WILL_FIRE_RL_adcCore_colGate_count_dropped_samples ||
	     !adcCore_operateD$dD_OUT ;
  // register adcCore_colGate_dwellFails
  assign adcCore_colGate_dwellFails$D_IN =
	     MUX_adcCore_colGate_dwellFails$write_1__SEL_1 ?
	       MUX_adcCore_colGate_dwellFails$write_1__VAL_1 :
	       32'd0 ;
  assign adcCore_colGate_dwellFails$EN =
	     WILL_FIRE_RL_adcCore_colGate_count_dropped_samples &&
	     adcCore_colGate_ovrRecover == 4'd0 ||
	     !adcCore_operateD$dD_OUT ;
  // register adcCore_colGate_dwellStarts
  assign adcCore_colGate_dwellStarts$D_IN =
	     WILL_FIRE_RL_adcCore_colGate_count_dwells ?
	       MUX_adcCore_colGate_dwellStarts$write_1__VAL_1 :
	       32'd0 ;
  assign adcCore_colGate_dwellStarts$EN =
	     WILL_FIRE_RL_adcCore_colGate_count_dwells ||
	     !adcCore_operateD$dD_OUT ;
  // register adcCore_colGate_ovrRecover
  always@(MUX_adcCore_colGate_dwellFails$write_1__SEL_1 or
	  WILL_FIRE_RL_adcCore_colGate_overrun_recovery or
	  MUX_adcCore_colGate_ovrRecover$write_1__VAL_2 or
	  adcCore_operateD$dD_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_adcCore_colGate_dwellFails$write_1__SEL_1:
	  adcCore_colGate_ovrRecover$D_IN = 4'd15;
      WILL_FIRE_RL_adcCore_colGate_overrun_recovery:
	  adcCore_colGate_ovrRecover$D_IN =
	      MUX_adcCore_colGate_ovrRecover$write_1__VAL_2;
      !adcCore_operateD$dD_OUT: adcCore_colGate_ovrRecover$D_IN = 4'd0;
      default: adcCore_colGate_ovrRecover$D_IN =
		   4'b1010 /* unspecified value */ ;
    endcase
  end
  assign adcCore_colGate_ovrRecover$EN =
	     WILL_FIRE_RL_adcCore_colGate_count_dropped_samples &&
	     adcCore_colGate_ovrRecover == 4'd0 ||
	     WILL_FIRE_RL_adcCore_colGate_overrun_recovery ||
	     !adcCore_operateD$dD_OUT ;
  // register adcCore_colGate_sampActive
  assign adcCore_colGate_sampActive$D_IN = 1'b1 ;
  assign adcCore_colGate_sampActive$EN = 1'd1 ;
  // register adcCore_colGate_sampActiveD
  assign adcCore_colGate_sampActiveD$D_IN =
	     adcCore_operateD$dD_OUT && adcCore_colGate_sampActive ;
  assign adcCore_colGate_sampActiveD$EN = 1'b1 ;
  // register adcCore_colGate_sampCount
  assign adcCore_colGate_sampCount$D_IN =
	     WILL_FIRE_RL_adcCore_colGate_capture_collect ?
	       MUX_adcCore_colGate_sampCount$write_1__VAL_1 :
	       32'd0 ;
  assign adcCore_colGate_sampCount$EN =
	     WILL_FIRE_RL_adcCore_colGate_capture_collect ||
	     !adcCore_operateD$dD_OUT ;
  // register adcCore_colGate_sampDataWD
  assign adcCore_colGate_sampDataWD$D_IN = adcCore_samp ;
  assign adcCore_colGate_sampDataWD$EN =
	     MUX_adcCore_colGate_dwellFails$write_1__SEL_1 ;
  // register adcCore_colGate_syncMesg
  assign adcCore_colGate_syncMesg$D_IN =
	     WILL_FIRE_RL_adcCore_colGate_send_sync_mesg ?
	       MUX_adcCore_colGate_syncMesg$write_1__VAL_1 :
	       2'd0 ;
  assign adcCore_colGate_syncMesg$EN =
	     WILL_FIRE_RL_adcCore_colGate_send_sync_mesg ||
	     !adcCore_operateD$dD_OUT ;
  // register adcCore_colGate_timeMesg
  assign adcCore_colGate_timeMesg$D_IN =
	     WILL_FIRE_RL_adcCore_colGate_send_timestamp_mesg ?
	       MUX_adcCore_colGate_timeMesg$write_1__VAL_1 :
	       3'd0 ;
  assign adcCore_colGate_timeMesg$EN =
	     WILL_FIRE_RL_adcCore_colGate_send_timestamp_mesg ||
	     !adcCore_operateD$dD_OUT ;
  // register adcCore_colGate_uprollCnt
  assign adcCore_colGate_uprollCnt$D_IN =
	     WILL_FIRE_RL_adcCore_colGate_capture_collect ?
	       MUX_adcCore_colGate_uprollCnt$write_1__VAL_2 :
	       16'd0 ;
  assign adcCore_colGate_uprollCnt$EN =
	     WILL_FIRE_RL_adcCore_colGate_overrun_recovery &&
	     adcCore_colGate_ovrRecover == 4'd15 ||
	     WILL_FIRE_RL_adcCore_colGate_capture_collect ||
	     !adcCore_operateD$dD_OUT ;
  // register adcCore_iobA
  assign adcCore_iobA$D_IN = adc_da_i ;
  assign adcCore_iobA$EN = 1'd1 ;
  // register adcCore_iobB
  assign adcCore_iobB$D_IN = adc_db_i ;
  assign adcCore_iobB$EN = 1'd1 ;
  // register adcCore_iseqFsm_jj_delay_count
  assign adcCore_iseqFsm_jj_delay_count$D_IN =
	     WILL_FIRE_RL_adcCore_iseqFsm_action_np ?
	       MUX_adcCore_iseqFsm_jj_delay_count$write_1__VAL_1 :
	       13'd1 ;
  assign adcCore_iseqFsm_jj_delay_count$EN =
	     WILL_FIRE_RL_adcCore_iseqFsm_action_np ||
	     adcCore_iseqFsm_state_mkFSMstate == 4'd2 ;
  // register adcCore_iseqFsm_start_reg
  assign adcCore_iseqFsm_start_reg$D_IN = 1'd0 ;
  assign adcCore_iseqFsm_start_reg$EN =
	     WILL_FIRE_RL_adcCore_iseqFsm_fsm_start ;
  // register adcCore_iseqFsm_start_reg_1
  assign adcCore_iseqFsm_start_reg_1$D_IN = adcCore_iseqFsm_start_wire$whas ;
  assign adcCore_iseqFsm_start_reg_1$EN = 1'd1 ;
  // register adcCore_iseqFsm_state_can_overlap
  assign adcCore_iseqFsm_state_can_overlap$D_IN =
	     adcCore_iseqFsm_state_set_pw$whas ||
	     adcCore_iseqFsm_state_can_overlap ;
  assign adcCore_iseqFsm_state_can_overlap$EN = 1'd1 ;
  // register adcCore_iseqFsm_state_fired
  assign adcCore_iseqFsm_state_fired$D_IN =
	     adcCore_iseqFsm_state_set_pw$whas ;
  assign adcCore_iseqFsm_state_fired$EN = 1'd1 ;
  // register adcCore_iseqFsm_state_mkFSMstate
  always@(WILL_FIRE_RL_adcCore_iseqFsm_idle_l137c3 or
	  WILL_FIRE_RL_adcCore_iseqFsm_action_l138c12 or
	  adcCore_iseqFsm_state_mkFSMstate or
	  WILL_FIRE_RL_adcCore_iseqFsm_action_np or
	  WILL_FIRE_RL_adcCore_iseqFsm_action_l141c9 or
	  WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9 or
	  WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9 or
	  WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9 or
	  WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 or
	  WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_adcCore_iseqFsm_idle_l137c3:
	  adcCore_iseqFsm_state_mkFSMstate$D_IN = 4'd0;
      WILL_FIRE_RL_adcCore_iseqFsm_action_l138c12:
	  adcCore_iseqFsm_state_mkFSMstate$D_IN = 4'd1;
      adcCore_iseqFsm_state_mkFSMstate == 4'd1:
	  adcCore_iseqFsm_state_mkFSMstate$D_IN = 4'd2;
      adcCore_iseqFsm_state_mkFSMstate == 4'd2:
	  adcCore_iseqFsm_state_mkFSMstate$D_IN = 4'd3;
      WILL_FIRE_RL_adcCore_iseqFsm_action_np:
	  adcCore_iseqFsm_state_mkFSMstate$D_IN = 4'd4;
      WILL_FIRE_RL_adcCore_iseqFsm_action_l141c9:
	  adcCore_iseqFsm_state_mkFSMstate$D_IN = 4'd5;
      WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9:
	  adcCore_iseqFsm_state_mkFSMstate$D_IN = 4'd6;
      WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9:
	  adcCore_iseqFsm_state_mkFSMstate$D_IN = 4'd7;
      WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9:
	  adcCore_iseqFsm_state_mkFSMstate$D_IN = 4'd8;
      WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9:
	  adcCore_iseqFsm_state_mkFSMstate$D_IN = 4'd9;
      WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9:
	  adcCore_iseqFsm_state_mkFSMstate$D_IN = 4'd10;
      default: adcCore_iseqFsm_state_mkFSMstate$D_IN =
		   4'b1010 /* unspecified value */ ;
    endcase
  end
  assign adcCore_iseqFsm_state_mkFSMstate$EN =
	     WILL_FIRE_RL_adcCore_iseqFsm_idle_l137c3 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l138c12 ||
	     adcCore_iseqFsm_state_mkFSMstate == 4'd1 ||
	     adcCore_iseqFsm_state_mkFSMstate == 4'd2 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_np ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l141c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9 ;
  // register adcCore_operateDReg
  assign adcCore_operateDReg$D_IN = wci_wslv_cState == 3'd2 ;
  assign adcCore_operateDReg$EN = 1'd1 ;
  // register adcCore_readMode
  assign adcCore_readMode$D_IN = adcCore_reqF$D_OUT[16] && !adcCore_readMode ;
  assign adcCore_readMode$EN =
	     WILL_FIRE_RL_adcCore_advance_spi_request &&
	     (adcCore_reqF$D_OUT[16] && !adcCore_readMode ||
	      !adcCore_reqF$D_OUT[16] && adcCore_readMode) ;
  // register adcCore_samp
  assign adcCore_samp$D_IN = { 2'b0, adcCore_iobB, 2'b0, adcCore_iobA } ;
  assign adcCore_samp$EN = 1'd1 ;
  // register adcCore_sampF_rRdPtr_rdCounter
  assign adcCore_sampF_rRdPtr_rdCounter$D_IN =
	     adcCore_sampF_rRdPtr_rdCounterPre ;
  assign adcCore_sampF_rRdPtr_rdCounter$EN = 1'd1 ;
  // register adcCore_sampF_rRdPtr_rdCounterPre
  assign adcCore_sampF_rRdPtr_rdCounterPre$D_IN =
	     adcCore_sampF_rRdPtr_rsCounter ;
  assign adcCore_sampF_rRdPtr_rdCounterPre$EN = 1'd1 ;
  // register adcCore_sampF_rRdPtr_rsCounter
  assign adcCore_sampF_rRdPtr_rsCounter$D_IN =
	     MUX_adcCore_sampF_rRdPtr_rsCounter$write_1__VAL_1 ;
  assign adcCore_sampF_rRdPtr_rsCounter$EN = adcCore_sampF_pwDequeue$whas ;
  // register adcCore_sampF_rWrPtr_rdCounter
  assign adcCore_sampF_rWrPtr_rdCounter$D_IN =
	     adcCore_sampF_rWrPtr_rdCounterPre ;
  assign adcCore_sampF_rWrPtr_rdCounter$EN = 1'd1 ;
  // register adcCore_sampF_rWrPtr_rdCounterPre
  assign adcCore_sampF_rWrPtr_rdCounterPre$D_IN =
	     adcCore_sampF_rWrPtr_rsCounter ;
  assign adcCore_sampF_rWrPtr_rdCounterPre$EN = 1'd1 ;
  // register adcCore_sampF_rWrPtr_rsCounter
  assign adcCore_sampF_rWrPtr_rsCounter$D_IN =
	     MUX_adcCore_sampF_rWrPtr_rsCounter$write_1__VAL_1 ;
  assign adcCore_sampF_rWrPtr_rsCounter$EN = adcCore_sampF_pwEnqueue$whas ;
  // register adcCore_spiI_cGate
  assign adcCore_spiI_cGate$D_IN = adcCore_spiI_cGate_1$whas ;
  assign adcCore_spiI_cGate$EN = 1'd1 ;
  // register adcCore_spiI_cap
  assign adcCore_spiI_cap$D_IN = adcCore_spiI_sdiP ;
  assign adcCore_spiI_cap$EN = MUX_adcCore_spiI_xmt_d$write_1__SEL_2 ;
  // register adcCore_spiI_cap_1
  assign adcCore_spiI_cap_1$D_IN = adcCore_spiI_sdiP ;
  assign adcCore_spiI_cap_1$EN =
	     WILL_FIRE_RL_adcCore_spiI_send_d && adcCore_spiI_dPos == 3'd1 ;
  // register adcCore_spiI_cap_2
  assign adcCore_spiI_cap_2$D_IN = adcCore_spiI_sdiP ;
  assign adcCore_spiI_cap_2$EN =
	     WILL_FIRE_RL_adcCore_spiI_send_d && adcCore_spiI_dPos == 3'd2 ;
  // register adcCore_spiI_cap_3
  assign adcCore_spiI_cap_3$D_IN = adcCore_spiI_sdiP ;
  assign adcCore_spiI_cap_3$EN =
	     WILL_FIRE_RL_adcCore_spiI_send_d && adcCore_spiI_dPos == 3'd3 ;
  // register adcCore_spiI_cap_4
  assign adcCore_spiI_cap_4$D_IN = adcCore_spiI_sdiP ;
  assign adcCore_spiI_cap_4$EN =
	     WILL_FIRE_RL_adcCore_spiI_send_d && adcCore_spiI_dPos == 3'd4 ;
  // register adcCore_spiI_cap_5
  assign adcCore_spiI_cap_5$D_IN = adcCore_spiI_sdiP ;
  assign adcCore_spiI_cap_5$EN =
	     WILL_FIRE_RL_adcCore_spiI_send_d && adcCore_spiI_dPos == 3'd5 ;
  // register adcCore_spiI_cap_6
  assign adcCore_spiI_cap_6$D_IN = adcCore_spiI_sdiP ;
  assign adcCore_spiI_cap_6$EN =
	     WILL_FIRE_RL_adcCore_spiI_send_d && adcCore_spiI_dPos == 3'd6 ;
  // register adcCore_spiI_cap_7
  assign adcCore_spiI_cap_7$D_IN = adcCore_spiI_sdiP ;
  assign adcCore_spiI_cap_7$EN =
	     WILL_FIRE_RL_adcCore_spiI_send_d && adcCore_spiI_dPos == 3'd7 ;
  // register adcCore_spiI_csbR
  assign adcCore_spiI_csbR$D_IN = !adcCore_spiI_cGate_1$whas ;
  assign adcCore_spiI_csbR$EN = 1'd1 ;
  // register adcCore_spiI_dPos
  assign adcCore_spiI_dPos$D_IN =
	     WILL_FIRE_RL_adcCore_spiI_send_d ?
	       MUX_adcCore_spiI_dPos$write_1__VAL_1 :
	       3'h7 ;
  assign adcCore_spiI_dPos$EN =
	     WILL_FIRE_RL_adcCore_spiI_send_d ||
	     WILL_FIRE_RL_adcCore_spiI_start_cs ;
  // register adcCore_spiI_doResp
  assign adcCore_spiI_doResp$D_IN =
	     MUX_adcCore_spiI_xmt_d$write_1__SEL_2 && adcCore_spiI_reqS[16] ;
  assign adcCore_spiI_doResp$EN = 1'd1 ;
  // register adcCore_spiI_iPos
  assign adcCore_spiI_iPos$D_IN =
	     WILL_FIRE_RL_adcCore_spiI_send_i ?
	       MUX_adcCore_spiI_iPos$write_1__VAL_1 :
	       4'h7 ;
  assign adcCore_spiI_iPos$EN =
	     WILL_FIRE_RL_adcCore_spiI_send_i ||
	     WILL_FIRE_RL_adcCore_spiI_start_cs ;
  // register adcCore_spiI_reqF_head_wrapped
  assign adcCore_spiI_reqF_head_wrapped$D_IN =
	     WILL_FIRE_RL_adcCore_spiI_reqF_deq_update_head &&
	     !adcCore_spiI_reqF_head_wrapped ;
  assign adcCore_spiI_reqF_head_wrapped$EN =
	     WILL_FIRE_RL_adcCore_spiI_reqF_deq_update_head ||
	     adcCore_spiI_reqF_dInReset$VAL ;
  // register adcCore_spiI_reqF_tail_wrapped
  assign adcCore_spiI_reqF_tail_wrapped$D_IN =
	     WILL_FIRE_RL_adcCore_spiI_reqF_enq_update_tail &&
	     !adcCore_spiI_reqF_tail_wrapped ;
  assign adcCore_spiI_reqF_tail_wrapped$EN =
	     WILL_FIRE_RL_adcCore_spiI_reqF_enq_update_tail ||
	     adcCore_spiI_reqF_sInReset$VAL ;
  // register adcCore_spiI_reqS
  always@(WILL_FIRE_RL_adcCore_advance_spi_request or
	  MUX_adcCore_spiI_reqS$write_1__VAL_1 or
	  WILL_FIRE_RL_adcCore_iseqFsm_action_l141c9 or
	  WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9 or
	  WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9 or
	  WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9 or
	  WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 or
	  WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_adcCore_advance_spi_request:
	  adcCore_spiI_reqS$D_IN = MUX_adcCore_spiI_reqS$write_1__VAL_1;
      WILL_FIRE_RL_adcCore_iseqFsm_action_l141c9:
	  adcCore_spiI_reqS$D_IN = 17'd20486;
      WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9:
	  adcCore_spiI_reqS$D_IN = 17'd20788;
      WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9:
	  adcCore_spiI_reqS$D_IN = 17'd21010;
      WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9:
	  adcCore_spiI_reqS$D_IN = 17'd21568;
      WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9:
	  adcCore_spiI_reqS$D_IN = 17'd21776;
      WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9:
	  adcCore_spiI_reqS$D_IN = 17'd25092;
      default: adcCore_spiI_reqS$D_IN =
		   17'b01010101010101010 /* unspecified value */ ;
    endcase
  end
  assign adcCore_spiI_reqS$EN =
	     WILL_FIRE_RL_adcCore_advance_spi_request ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l141c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 ||
	     WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9 ;
  // register adcCore_spiI_respF_head_wrapped
  assign adcCore_spiI_respF_head_wrapped$D_IN =
	     WILL_FIRE_RL_adcCore_spiI_respF_deq_update_head &&
	     !adcCore_spiI_respF_head_wrapped ;
  assign adcCore_spiI_respF_head_wrapped$EN =
	     WILL_FIRE_RL_adcCore_spiI_respF_deq_update_head ||
	     adcCore_spiI_respF_dInReset$VAL ;
  // register adcCore_spiI_respF_tail_wrapped
  assign adcCore_spiI_respF_tail_wrapped$D_IN =
	     WILL_FIRE_RL_adcCore_spiI_respF_enq_update_tail &&
	     !adcCore_spiI_respF_tail_wrapped ;
  assign adcCore_spiI_respF_tail_wrapped$EN =
	     WILL_FIRE_RL_adcCore_spiI_respF_enq_update_tail ||
	     adcCore_spiI_respF_sInReset$VAL ;
  // register adcCore_spiI_respS
  assign adcCore_spiI_respS$D_IN =
	     { adcCore_spiI_cap_6,
	       adcCore_spiI_cap_5,
	       adcCore_spiI_cap_4,
	       adcCore_spiI_cap_3,
	       adcCore_spiI_cap_2,
	       adcCore_spiI_cap_1,
	       adcCore_spiI_cap,
	       adcCore_spiI_sdiP } ;
  assign adcCore_spiI_respS$EN = adcCore_spiI_respF_enq_pw$whas ;
  // register adcCore_spiI_sdiP
  assign adcCore_spiI_sdiP$D_IN = adc_smiso_i ;
  assign adcCore_spiI_sdiP$EN = 1'd1 ;
  // register adcCore_spiI_sdoR
  assign adcCore_spiI_sdoR$D_IN =
	     adcCore_spiI_cGate_1$whas && adcCore_spiI_sdoR_1$wget ;
  assign adcCore_spiI_sdoR$EN = 1'd1 ;
  // register adcCore_spiI_xmt_d
  assign adcCore_spiI_xmt_d$D_IN =
	     WILL_FIRE_RL_adcCore_spiI_send_i && adcCore_spiI_iPos == 4'd0 ;
  assign adcCore_spiI_xmt_d$EN =
	     WILL_FIRE_RL_adcCore_spiI_send_d && adcCore_spiI_dPos == 3'd0 ||
	     WILL_FIRE_RL_adcCore_spiI_send_i ;
  // register adcCore_spiI_xmt_i
  assign adcCore_spiI_xmt_i$D_IN =
	     !WILL_FIRE_RL_adcCore_spiI_send_i || adcCore_spiI_iPos != 4'd0 ;
  assign adcCore_spiI_xmt_i$EN =
	     WILL_FIRE_RL_adcCore_spiI_send_i ||
	     WILL_FIRE_RL_adcCore_spiI_start_cs ;
  // register fcAdc_countNow
  assign fcAdc_countNow$D_IN =
	     { fcAdc_grayCounter_rdCounter[17],
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1219,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1220,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1221,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1252,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1253,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1222,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1266,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1223,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1224,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1254,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1225,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1226,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1250,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1228,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1227,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1229,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1229 ^
	       fcAdc_grayCounter_rdCounter[0] } ;
  assign fcAdc_countNow$EN = fcAdc_pulseAction ;
  // register fcAdc_countPast
  assign fcAdc_countPast$D_IN = fcAdc_countNow ;
  assign fcAdc_countPast$EN = fcAdc_pulseAction ;
  // register fcAdc_frequency
  assign fcAdc_frequency$D_IN = fcAdc_countNow - fcAdc_countPast ;
  assign fcAdc_frequency$EN = fcAdc_pulseAction ;
  // register fcAdc_grayCounter_rdCounter
  assign fcAdc_grayCounter_rdCounter$D_IN = fcAdc_grayCounter_rdCounterPre ;
  assign fcAdc_grayCounter_rdCounter$EN = 1'd1 ;
  // register fcAdc_grayCounter_rdCounterPre
  assign fcAdc_grayCounter_rdCounterPre$D_IN = fcAdc_grayCounter_rsCounter ;
  assign fcAdc_grayCounter_rdCounterPre$EN = 1'd1 ;
  // register fcAdc_grayCounter_rsCounter
  assign fcAdc_grayCounter_rsCounter$D_IN =
	     MUX_fcAdc_grayCounter_rsCounter$write_1__VAL_1 ;
  assign fcAdc_grayCounter_rsCounter$EN = 1'b1 ;
  // register fcAdc_pulseAction
  assign fcAdc_pulseAction$D_IN = oneKHz_value == 18'd99999 ;
  assign fcAdc_pulseAction$EN = 1'd1 ;
  // register fcAdc_sampleCount
  assign fcAdc_sampleCount$D_IN = fcAdc_sampleCount + 16'd1 ;
  assign fcAdc_sampleCount$EN = fcAdc_pulseAction ;
  // register initOpInFlight
  assign initOpInFlight$D_IN = 1'b0 ;
  assign initOpInFlight$EN = 1'b0 ;
  // register lastOverflowMesg
  assign lastOverflowMesg$D_IN = mesgCount ;
  assign lastOverflowMesg$EN =
	     wci_wslv_cState == 3'd2 &&
	     overflowCountD != adcCore_statsCC$dD_OUT[31:0] ;
  // register maxMesgLength
  assign maxMesgLength$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign maxMesgLength$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h08 ;
  // register mesgCount
  assign mesgCount$D_IN = mesgCount + 32'd1 ;
  assign mesgCount$EN =
	     wsiM_reqFifo_enqueueing$whas && adcCore_sampF_memory$DOB[36] ;
  // register oneKHz_value
  assign oneKHz_value$D_IN = MUX_oneKHz_value$write_1__VAL_1 ;
  assign oneKHz_value$EN = 1'b1 ;
  // register overflowCountD
  assign overflowCountD$D_IN = adcCore_statsCC$dD_OUT[31:0] ;
  assign overflowCountD$EN = wci_wslv_cState == 3'd2 ;
  // register sFlagState
  assign sFlagState$D_IN = 1'b0 ;
  assign sFlagState$EN = 1'b0 ;
  // register spiResp
  assign spiResp$D_IN = adcCore_spiI_respS ;
  assign spiResp$EN = MUX_splitReadInFlight$write_1__PSEL_1 ;
  // register splitReadInFlight
  assign splitReadInFlight$D_IN = !MUX_wci_wslv_respF_x_wire$wset_1__SEL_1 ;
  assign splitReadInFlight$EN =
	     MUX_splitReadInFlight$write_1__PSEL_1 && splitReadInFlight ||
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[43:42] == 2'b01 ;
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
  // register wti_isReset_isInReset
  assign wti_isReset_isInReset$D_IN = 1'd0 ;
  assign wti_isReset_isInReset$EN = wti_isReset_isInReset ;
  // register wti_nowReq
  assign wti_nowReq$D_IN = wtiS0_req ;
  assign wti_nowReq$EN = 1'd1 ;
  // register wti_operateD
  assign wti_operateD$D_IN = 1'b1 ;
  assign wti_operateD$EN = 1'd1 ;
  // submodule adcCore_acquireD
  assign adcCore_acquireD$sD_IN = adcCore_acquireDReg ;
  assign adcCore_acquireD$sEN =
	     adcCore_operateD$sRDY && adcCore_acquireD$sRDY &&
	     adcCore_averageD$sRDY ;
  // submodule adcCore_averageD
  assign adcCore_averageD$sD_IN = adcCore_averageDReg ;
  assign adcCore_averageD$sEN =
	     adcCore_operateD$sRDY && adcCore_acquireD$sRDY &&
	     adcCore_averageD$sRDY ;
  // submodule adcCore_colGate_sampF
  always@(MUX_adcCore_colGate_sampF$enq_1__SEL_1 or
	  MUX_adcCore_colGate_sampF$enq_1__VAL_1 or
	  WILL_FIRE_RL_adcCore_colGate_send_timestamp_mesg or
	  MUX_adcCore_colGate_sampF$enq_1__VAL_2 or
	  WILL_FIRE_RL_adcCore_colGate_capture_collect or
	  MUX_adcCore_colGate_sampF$enq_1__VAL_3 or
	  WILL_FIRE_RL_adcCore_colGate_send_sync_mesg)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_adcCore_colGate_sampF$enq_1__SEL_1:
	  adcCore_colGate_sampF$D_IN = MUX_adcCore_colGate_sampF$enq_1__VAL_1;
      WILL_FIRE_RL_adcCore_colGate_send_timestamp_mesg:
	  adcCore_colGate_sampF$D_IN = MUX_adcCore_colGate_sampF$enq_1__VAL_2;
      WILL_FIRE_RL_adcCore_colGate_capture_collect:
	  adcCore_colGate_sampF$D_IN = MUX_adcCore_colGate_sampF$enq_1__VAL_3;
      WILL_FIRE_RL_adcCore_colGate_send_sync_mesg:
	  adcCore_colGate_sampF$D_IN = 39'h3000000000;
      default: adcCore_colGate_sampF$D_IN =
		   39'h2AAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign adcCore_colGate_sampF$CLR = !adcCore_operateD$dD_OUT ;
  assign adcCore_colGate_sampF$DEQ = adcCore_sampF_pwEnqueue$whas ;
  assign adcCore_colGate_sampF$ENQ =
	     WILL_FIRE_RL_adcCore_colGate_overrun_recovery &&
	     adcCore_colGate_ovrRecover == 4'd15 ||
	     WILL_FIRE_RL_adcCore_colGate_send_timestamp_mesg ||
	     WILL_FIRE_RL_adcCore_colGate_capture_collect ||
	     WILL_FIRE_RL_adcCore_colGate_send_sync_mesg ;
  // submodule adcCore_maxBurstLengthR
  assign adcCore_maxBurstLengthR$sD_IN = maxMesgLength[17:2] ;
  assign adcCore_maxBurstLengthR$sEN = adcCore_maxBurstLengthR$sRDY ;
  // submodule adcCore_operateD
  assign adcCore_operateD$sD_IN = adcCore_operateDReg ;
  assign adcCore_operateD$sEN =
	     adcCore_operateD$sRDY && adcCore_acquireD$sRDY &&
	     adcCore_averageD$sRDY ;
  // submodule adcCore_reqF
  assign adcCore_reqF$D_IN =
	     MUX_adcCore_reqF$enq_1__SEL_1 ?
	       MUX_adcCore_reqF$enq_1__VAL_1 :
	       MUX_adcCore_reqF$enq_1__VAL_2 ;
  assign adcCore_reqF$ENQ =
	     WILL_FIRE_RL_wci_cfwr &&
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	      wci_wslv_reqF$D_OUT[39:32] == 8'h28 ||
	      wci_wslv_reqF$D_OUT[43:42] == 2'b01) ||
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[43:42] == 2'b01 ;
  assign adcCore_reqF$DEQ =
	     WILL_FIRE_RL_adcCore_advance_spi_request &&
	     (!adcCore_reqF$D_OUT[16] || adcCore_readMode) &&
	     (adcCore_reqF$D_OUT[16] || !adcCore_readMode) ;
  assign adcCore_reqF$CLR = 1'b0 ;
  // submodule adcCore_sampCC
  assign adcCore_sampCC$sD_IN = adcCore_samp ;
  assign adcCore_sampCC$sEN = adcCore_sampCC$sRDY ;
  // submodule adcCore_sampF_memory
  assign adcCore_sampF_memory$ADDRA =
	     { adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1232,
	       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1230,
	       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1231,
	       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1233,
	       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1259,
	       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1234,
	       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1256,
	       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1258,
	       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1235,
	       adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1235 ^
	       adcCore_sampF_rWrPtr_rsCounter[0] } ;
  assign adcCore_sampF_memory$ADDRB =
	     adcCore_sampF_pwDequeue$whas ? x__h23307[9:0] : x2__h23276 ;
  assign adcCore_sampF_memory$DIA =
	     { adcCore_sampF_pwEnqueue$whas ?
		 adcCore_colGate_sampF$D_OUT[38:37] :
		 2'd0,
	       adcCore_sampF_pwEnqueue$whas &&
	       adcCore_colGate_sampF$D_OUT[36],
	       adcCore_sampF_pwEnqueue$whas ?
		 adcCore_colGate_sampF$D_OUT[35:0] :
		 36'd0 } ;
  assign adcCore_sampF_memory$DIB = 39'h2AAAAAAAAA /* unspecified value */  ;
  assign adcCore_sampF_memory$WEA = adcCore_sampF_pwEnqueue$whas ;
  assign adcCore_sampF_memory$WEB = 1'd0 ;
  assign adcCore_sampF_memory$ENA = 1'd1 ;
  assign adcCore_sampF_memory$ENB = 1'd1 ;
  // submodule adcCore_statsCC
  assign adcCore_statsCC$sD_IN =
	     { adcCore_colGate_dropCount,
	       adcCore_colGate_sampCount,
	       adcCore_colGate_dwellStarts,
	       adcCore_colGate_dwellFails } ;
  assign adcCore_statsCC$sEN = adcCore_statsCC$sRDY ;
  // submodule wci_wslv_reqF
  assign wci_wslv_reqF$D_IN = wci_wslv_wciReq$wget ;
  assign wci_wslv_reqF$ENQ = wci_wslv_wciReq$wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF$DEQ = wci_wslv_reqF_r_deq$whas ;
  assign wci_wslv_reqF$CLR = 1'b0 ;
  // remaining internal signals
  assign IF_adcCore_sampF_rRdPtr_rsCounter_48_BIT_0_55__ETC___d1412 =
	     adcCore_sampF_rRdPtr_rsCounter_48_BIT_0_55_XOR_ETC___d1344 ?
	       IF_adcCore_sampF_rRdPtr_rsCounter_48_BIT_0_55__ETC___d1413 :
	       32'd0 ;
  assign IF_adcCore_sampF_rRdPtr_rsCounter_48_BIT_0_55__ETC___d1413 =
	     (adcCore_sampF_rRdPtr_rsCounter[0] ||
	      adcCore_sampF_rRdPtr_rsCounter[1] ||
	      adcCore_sampF_rRdPtr_rsCounter[2] ||
	      adcCore_sampF_rRdPtr_rsCounter[3] ||
	      adcCore_sampF_rRdPtr_rsCounter[4] ||
	      adcCore_sampF_rRdPtr_rsCounter[5] ||
	      adcCore_sampF_rRdPtr_rsCounter[6] ||
	      adcCore_sampF_rRdPtr_rsCounter[7] ||
	      adcCore_sampF_rRdPtr_rsCounter[8] ||
	      adcCore_sampF_rRdPtr_rsCounter[9]) ?
	       (adcCore_sampF_rRdPtr_rsCounter[0] ?
		  32'd1 :
		  (adcCore_sampF_rRdPtr_rsCounter[1] ?
		     32'd2 :
		     (adcCore_sampF_rRdPtr_rsCounter[2] ?
			32'd3 :
			(adcCore_sampF_rRdPtr_rsCounter[3] ?
			   32'd4 :
			   (adcCore_sampF_rRdPtr_rsCounter[4] ?
			      32'd5 :
			      (adcCore_sampF_rRdPtr_rsCounter[5] ?
				 32'd6 :
				 (adcCore_sampF_rRdPtr_rsCounter[6] ?
				    32'd7 :
				    (adcCore_sampF_rRdPtr_rsCounter[7] ?
				       32'd8 :
				       (adcCore_sampF_rRdPtr_rsCounter[8] ?
					  32'd9 :
					  (adcCore_sampF_rRdPtr_rsCounter[9] ?
					     32'd10 :
					     (adcCore_sampF_rRdPtr_rsCounter[10] ?
						32'd11 :
						32'd12))))))))))) :
	       32'd10 ;
  assign IF_adcCore_sampF_rWrPtr_rsCounter_79_BIT_0_86__ETC___d1295 =
	     (adcCore_sampF_rWrPtr_rsCounter[0] ||
	      adcCore_sampF_rWrPtr_rsCounter[1] ||
	      adcCore_sampF_rWrPtr_rsCounter[2] ||
	      adcCore_sampF_rWrPtr_rsCounter[3] ||
	      adcCore_sampF_rWrPtr_rsCounter[4] ||
	      adcCore_sampF_rWrPtr_rsCounter[5] ||
	      adcCore_sampF_rWrPtr_rsCounter[6] ||
	      adcCore_sampF_rWrPtr_rsCounter[7] ||
	      adcCore_sampF_rWrPtr_rsCounter[8] ||
	      adcCore_sampF_rWrPtr_rsCounter[9]) ?
	       (adcCore_sampF_rWrPtr_rsCounter[0] ?
		  32'd1 :
		  (adcCore_sampF_rWrPtr_rsCounter[1] ?
		     32'd2 :
		     (adcCore_sampF_rWrPtr_rsCounter[2] ?
			32'd3 :
			(adcCore_sampF_rWrPtr_rsCounter[3] ?
			   32'd4 :
			   (adcCore_sampF_rWrPtr_rsCounter[4] ?
			      32'd5 :
			      (adcCore_sampF_rWrPtr_rsCounter[5] ?
				 32'd6 :
				 (adcCore_sampF_rWrPtr_rsCounter[6] ?
				    32'd7 :
				    (adcCore_sampF_rWrPtr_rsCounter[7] ?
				       32'd8 :
				       (adcCore_sampF_rWrPtr_rsCounter[8] ?
					  32'd9 :
					  (adcCore_sampF_rWrPtr_rsCounter[9] ?
					     32'd10 :
					     (adcCore_sampF_rWrPtr_rsCounter[10] ?
						32'd11 :
						32'd12))))))))))) :
	       32'd10 ;
  assign IF_adcCore_sampF_rWrPtr_rsCounter_79_BIT_0_86__ETC___d1410 =
	     adcCore_sampF_rWrPtr_rsCounter_79_BIT_0_86_XOR_ETC___d1289 ?
	       IF_adcCore_sampF_rWrPtr_rsCounter_79_BIT_0_86__ETC___d1295 :
	       32'd0 ;
  assign IF_fcAdc_grayCounter_rsCounter_60_BIT_0_67_OR__ETC___d1407 =
	     (fcAdc_grayCounter_rsCounter[0] ||
	      fcAdc_grayCounter_rsCounter[1] ||
	      fcAdc_grayCounter_rsCounter[2] ||
	      fcAdc_grayCounter_rsCounter[3] ||
	      fcAdc_grayCounter_rsCounter[4] ||
	      fcAdc_grayCounter_rsCounter[5] ||
	      fcAdc_grayCounter_rsCounter[6] ||
	      fcAdc_grayCounter_rsCounter[7] ||
	      fcAdc_grayCounter_rsCounter[8] ||
	      fcAdc_grayCounter_rsCounter[9] ||
	      fcAdc_grayCounter_rsCounter[10] ||
	      fcAdc_grayCounter_rsCounter[11] ||
	      fcAdc_grayCounter_rsCounter[12] ||
	      fcAdc_grayCounter_rsCounter[13] ||
	      fcAdc_grayCounter_rsCounter[14] ||
	      fcAdc_grayCounter_rsCounter[15] ||
	      fcAdc_grayCounter_rsCounter[16]) ?
	       (fcAdc_grayCounter_rsCounter[0] ?
		  32'd1 :
		  (fcAdc_grayCounter_rsCounter[1] ?
		     32'd2 :
		     (fcAdc_grayCounter_rsCounter[2] ?
			32'd3 :
			(fcAdc_grayCounter_rsCounter[3] ?
			   32'd4 :
			   (fcAdc_grayCounter_rsCounter[4] ?
			      32'd5 :
			      (fcAdc_grayCounter_rsCounter[5] ?
				 32'd6 :
				 (fcAdc_grayCounter_rsCounter[6] ?
				    32'd7 :
				    (fcAdc_grayCounter_rsCounter[7] ?
				       32'd8 :
				       (fcAdc_grayCounter_rsCounter[8] ?
					  32'd9 :
					  (fcAdc_grayCounter_rsCounter[9] ?
					     32'd10 :
					     (fcAdc_grayCounter_rsCounter[10] ?
						32'd11 :
						(fcAdc_grayCounter_rsCounter[11] ?
						   32'd12 :
						   (fcAdc_grayCounter_rsCounter[12] ?
						      32'd13 :
						      (fcAdc_grayCounter_rsCounter[13] ?
							 32'd14 :
							 (fcAdc_grayCounter_rsCounter[14] ?
							    32'd15 :
							    (fcAdc_grayCounter_rsCounter[15] ?
							       32'd16 :
							       (fcAdc_grayCounter_rsCounter[16] ?
								  32'd17 :
								  (fcAdc_grayCounter_rsCounter[17] ?
								     32'd18 :
								     32'd19)))))))))))))))))) :
	       32'd17 ;
  assign IF_fcAdc_grayCounter_rsCounter_60_BIT_0_67_XOR_ETC___d1408 =
	     fcAdc_grayCounter_rsCounter_60_BIT_0_67_XOR_fc_ETC___d1343 ?
	       IF_fcAdc_grayCounter_rsCounter_60_BIT_0_67_OR__ETC___d1407 :
	       32'd0 ;
  assign NOT_adcCore_sampF_rRdPtr_rsCounter_48_EQ_adcCo_ETC___d1051 =
	     adcCore_sampF_rRdPtr_rsCounter !=
	     adcCore_sampF_rWrPtr_rdCounter ;
  assign NOT_adcCore_spiI_reqF_head_wrapped__read__71_E_ETC___d814 =
	     adcCore_spiI_reqF_head_wrapped !=
	     adcCore_spiI_reqF_tail_wrapped ;
  assign adcCore_colGate_operatePW_whas__24_AND_adcCore_ETC___d379 =
	     adcCore_operateD$dD_OUT && adcCore_colGate_timeMesg == 3'd0 &&
	     adcCore_acquireD$dD_OUT &&
	     adcCore_colGate_collectD ;
  assign adcCore_colGate_operatePW_whas__24_AND_adcCore_ETC___d390 =
	     adcCore_colGate_operatePW_whas__24_AND_adcCore_ETC___d379 &&
	     adcCore_colGate_syncMesg == 2'd0 &&
	     adcCore_colGate_ovrRecover == 4'd0 &&
	     (!adcCore_averageD$dD_OUT || adcCore_colGate_avgPhase == 2'd0) ;
  assign adcCore_colGate_sampF_RDY_first__93_AND_NOT_ad_ETC___d750 =
	     adcCore_colGate_sampF$EMPTY_N &&
	     adcCore_sampF_rWrPtr_rsCounter !=
	     { adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[10],
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[10] ^
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[9],
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[9] ^
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[8],
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[8] ^
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[7],
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[7] ^
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[6],
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[6] ^
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[5],
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[5] ^
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[4],
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[4] ^
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[3],
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[3] ^
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[2],
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[2] ^
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[1],
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[1] ^
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247[0] } ;
  assign adcCore_colGate_uprollCnt_93_EQ_adcCore_colGat_ETC___d1303 =
	     adcCore_colGate_uprollCnt ==
	     adcCore_maxBurstLengthR$dD_OUT - 16'd1 ;
  assign adcCore_iseqFsm_abort_whas__69_AND_adcCore_ise_ETC___d941 =
	     (adcCore_iseqFsm_state_mkFSMstate == 4'd0 ||
	      adcCore_iseqFsm_state_mkFSMstate == 4'd10) &&
	     (!adcCore_iseqFsm_start_reg_1 || adcCore_iseqFsm_state_fired) ;
  assign adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_CO_ETC___d1247 =
	     x_dReadBin__h21693 + 11'd512 ;
  assign adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1242 =
	     adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1263 ^
	     adcCore_sampF_rRdPtr_rdCounter[7] ;
  assign adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1243 =
	     adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1242 ^
	     adcCore_sampF_rRdPtr_rdCounter[6] ;
  assign adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1244 =
	     adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1243 ^
	     adcCore_sampF_rRdPtr_rdCounter[5] ;
  assign adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1245 =
	     adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1244 ^
	     adcCore_sampF_rRdPtr_rdCounter[4] ;
  assign adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1246 =
	     adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1264 ^
	     adcCore_sampF_rRdPtr_rdCounter[2] ;
  assign adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1249 =
	     adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1246 ^
	     adcCore_sampF_rRdPtr_rdCounter[1] ;
  assign adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1262 =
	     adcCore_sampF_rRdPtr_rdCounter[10] ^
	     adcCore_sampF_rRdPtr_rdCounter[9] ;
  assign adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1263 =
	     adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1262 ^
	     adcCore_sampF_rRdPtr_rdCounter[8] ;
  assign adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1264 =
	     adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1245 ^
	     adcCore_sampF_rRdPtr_rdCounter[3] ;
  assign adcCore_sampF_rRdPtr_rsCounter_48_BIT_0_55_XOR_ETC___d1344 =
	     z__h20867 ^ adcCore_sampF_rRdPtr_rsCounter[10] ;
  assign adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1236 =
	     adcCore_sampF_rRdPtr_rsCounter[10] ^
	     adcCore_sampF_rRdPtr_rsCounter[9] ;
  assign adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1237 =
	     adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1257 ^
	     adcCore_sampF_rRdPtr_rsCounter[7] ;
  assign adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1238 =
	     adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1237 ^
	     adcCore_sampF_rRdPtr_rsCounter[6] ;
  assign adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1239 =
	     adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1238 ^
	     adcCore_sampF_rRdPtr_rsCounter[5] ;
  assign adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1240 =
	     adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1239 ^
	     adcCore_sampF_rRdPtr_rsCounter[4] ;
  assign adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1241 =
	     adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1240 ^
	     adcCore_sampF_rRdPtr_rsCounter[3] ;
  assign adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1257 =
	     adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1236 ^
	     adcCore_sampF_rRdPtr_rsCounter[8] ;
  assign adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1260 =
	     adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1241 ^
	     adcCore_sampF_rRdPtr_rsCounter[2] ;
  assign adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1261 =
	     adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1260 ^
	     adcCore_sampF_rRdPtr_rsCounter[1] ;
  assign adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1304 =
	     adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1261 ^
	     adcCore_sampF_rRdPtr_rsCounter[0] ;
  assign adcCore_sampF_rWrPtr_rsCounter_79_BIT_0_86_XOR_ETC___d1289 =
	     z__h18565 ^ adcCore_sampF_rWrPtr_rsCounter[10] ;
  assign adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1230 =
	     adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1232 ^
	     adcCore_sampF_rWrPtr_rsCounter[8] ;
  assign adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1231 =
	     adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1230 ^
	     adcCore_sampF_rWrPtr_rsCounter[7] ;
  assign adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1232 =
	     adcCore_sampF_rWrPtr_rsCounter[10] ^
	     adcCore_sampF_rWrPtr_rsCounter[9] ;
  assign adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1233 =
	     adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1231 ^
	     adcCore_sampF_rWrPtr_rsCounter[6] ;
  assign adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1234 =
	     adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1259 ^
	     adcCore_sampF_rWrPtr_rsCounter[4] ;
  assign adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1235 =
	     adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1258 ^
	     adcCore_sampF_rWrPtr_rsCounter[1] ;
  assign adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1256 =
	     adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1234 ^
	     adcCore_sampF_rWrPtr_rsCounter[3] ;
  assign adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1258 =
	     adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1256 ^
	     adcCore_sampF_rWrPtr_rsCounter[2] ;
  assign adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1259 =
	     adcCore_sampF_rWrPtr_rsCounter_79_BIT_10_05_XO_ETC___d1233 ^
	     adcCore_sampF_rWrPtr_rsCounter[5] ;
  assign adcCore_spiI_reqF_head_wrapped_crossed__63_EQ__ETC___d919 =
	     adcCore_spiI_reqF_head_wrapped ==
	     adcCore_spiI_reqF_tail_wrapped &&
	     !adcCore_spiI_reqF_sInReset$VAL &&
	     adcCore_spiI_cd$PREEDGE ;
  assign adcCore_spiI_reqS_BITS_15_TO_8__q3 = adcCore_spiI_reqS[15:8] ;
  assign adcCore_spiI_reqS_BITS_7_TO_0__q4 = adcCore_spiI_reqS[7:0] ;
  assign adcStatusLs__h63134 =
	     { 27'd0,
	       splitReadInFlight,
	       initOpInFlight,
	       1'b0,
	       adcCore_iseqFsm_abort_whas__69_AND_adcCore_ise_ETC___d941 &&
	       !adcCore_iseqFsm_start_reg,
	       1'b1 } ;
  assign avgDataBW__h14897 =
	     { adcCore_colGate_avgOdd[17:2], adcCore_colGate_avgEven[17:2] } ;
  assign d_data__h14984 =
	     adcCore_averageD$dD_OUT ? avgDataBW__h14897 : adcCore_samp ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1219 =
	     fcAdc_grayCounter_rdCounter[17] ^
	     fcAdc_grayCounter_rdCounter[16] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1220 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1219 ^
	     fcAdc_grayCounter_rdCounter[15] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1221 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1220 ^
	     fcAdc_grayCounter_rdCounter[14] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1222 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1253 ^
	     fcAdc_grayCounter_rdCounter[11] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1223 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1266 ^
	     fcAdc_grayCounter_rdCounter[9] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1224 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1223 ^
	     fcAdc_grayCounter_rdCounter[8] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1225 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1254 ^
	     fcAdc_grayCounter_rdCounter[6] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1226 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1225 ^
	     fcAdc_grayCounter_rdCounter[5] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1227 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1228 ^
	     fcAdc_grayCounter_rdCounter[2] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1228 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1250 ^
	     fcAdc_grayCounter_rdCounter[3] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1229 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1227 ^
	     fcAdc_grayCounter_rdCounter[1] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1250 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1226 ^
	     fcAdc_grayCounter_rdCounter[4] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1252 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1221 ^
	     fcAdc_grayCounter_rdCounter[13] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1253 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1252 ^
	     fcAdc_grayCounter_rdCounter[12] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1254 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1224 ^
	     fcAdc_grayCounter_rdCounter[7] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1266 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d1222 ^
	     fcAdc_grayCounter_rdCounter[10] ;
  assign fcAdc_grayCounter_rsCounter_60_BIT_0_67_XOR_fc_ETC___d1343 =
	     z__h7636 ^ fcAdc_grayCounter_rsCounter[17] ;
  assign rdat__h63337 =
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b0) ?
	       IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 :
	       32'd0 ;
  assign rdat__h63416 = { 24'd0, wsiM_statusR } ;
  assign rdat__h63498 = { 14'd0, fcAdc_frequency } ;
  assign rdat__h63518 = { 24'd0, spiResp } ;
  assign wci_wslv_reqF_i_notEmpty__4_AND_IF_wci_wslv_re_ETC___d1098 =
	     wci_wslv_reqF$EMPTY_N &&
	     ((wci_wslv_reqF$D_OUT[43:42] == 2'b0) ?
		wci_wslv_reqF$D_OUT[39:32] != 8'h28 || adcCore_reqF$FULL_N :
		wci_wslv_reqF$D_OUT[43:42] != 2'b01 || adcCore_reqF$FULL_N) ;
  assign wti_nowReq_BITS_63_TO_0__q1 = wti_nowReq[63:0] ;
  assign x2__h23276 =
	     { adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1236,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1257,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1237,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1238,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1239,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1240,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1241,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1260,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1261,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1304 } ;
  assign x__h15249 = x__h15259 + y__h15410 ;
  assign x__h15259 = adcCore_colGate_avgEven + y__h15412 ;
  assign x__h15325 = y__h15412 + y__h15410 ;
  assign x__h15399 = x__h15409 + y__h15410 ;
  assign x__h15409 = adcCore_colGate_avgOdd + y__h15412 ;
  assign x__h17578 =
	     11'd1 <<
	     IF_adcCore_sampF_rWrPtr_rsCounter_79_BIT_0_86__ETC___d1410 ;
  assign x__h19880 =
	     11'd1 <<
	     IF_adcCore_sampF_rRdPtr_rsCounter_48_BIT_0_55__ETC___d1412 ;
  assign x__h23307 = x_sReadBin__h21690 + 11'd1 ;
  assign x__h7511 =
	     18'd1 <<
	     IF_fcAdc_grayCounter_rsCounter_60_BIT_0_67_XOR_ETC___d1408 ;
  assign x_burstLength__h61970 =
	     adcCore_sampF_memory$DOB[36] ? 12'd1 : 12'd4095 ;
  assign x_dReadBin__h21693 =
	     { adcCore_sampF_rRdPtr_rdCounter[10],
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1262,
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1263,
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1242,
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1243,
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1244,
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1245,
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1264,
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1246,
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1249,
	       adcCore_sampF_rRdPtr_rdCounter_94_BIT_10_95_XO_ETC___d1249 ^
	       adcCore_sampF_rRdPtr_rdCounter[0] } ;
  assign x_sReadBin__h21690 =
	     { adcCore_sampF_rRdPtr_rsCounter[10],
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1236,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1257,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1237,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1238,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1239,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1240,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1241,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1260,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1261,
	       adcCore_sampF_rRdPtr_rsCounter_48_BIT_10_74_XO_ETC___d1304 } ;
  assign y__h15410 = { 2'd0, adcCore_samp[15:0] } ;
  assign y__h15412 = { 2'd0, adcCore_samp[31:16] } ;
  assign y__h18465 = ~x__h17578 ;
  assign y__h20767 = ~x__h19880 ;
  assign y__h8916 = ~x__h7511 ;
  assign z__h18509 =
	     adcCore_sampF_rWrPtr_rsCounter[0] ^
	     adcCore_sampF_rWrPtr_rsCounter[1] ;
  assign z__h18516 = z__h18509 ^ adcCore_sampF_rWrPtr_rsCounter[2] ;
  assign z__h18523 = z__h18516 ^ adcCore_sampF_rWrPtr_rsCounter[3] ;
  assign z__h18530 = z__h18523 ^ adcCore_sampF_rWrPtr_rsCounter[4] ;
  assign z__h18537 = z__h18530 ^ adcCore_sampF_rWrPtr_rsCounter[5] ;
  assign z__h18544 = z__h18537 ^ adcCore_sampF_rWrPtr_rsCounter[6] ;
  assign z__h18551 = z__h18544 ^ adcCore_sampF_rWrPtr_rsCounter[7] ;
  assign z__h18558 = z__h18551 ^ adcCore_sampF_rWrPtr_rsCounter[8] ;
  assign z__h18565 = z__h18558 ^ adcCore_sampF_rWrPtr_rsCounter[9] ;
  assign z__h20811 =
	     adcCore_sampF_rRdPtr_rsCounter[0] ^
	     adcCore_sampF_rRdPtr_rsCounter[1] ;
  assign z__h20818 = z__h20811 ^ adcCore_sampF_rRdPtr_rsCounter[2] ;
  assign z__h20825 = z__h20818 ^ adcCore_sampF_rRdPtr_rsCounter[3] ;
  assign z__h20832 = z__h20825 ^ adcCore_sampF_rRdPtr_rsCounter[4] ;
  assign z__h20839 = z__h20832 ^ adcCore_sampF_rRdPtr_rsCounter[5] ;
  assign z__h20846 = z__h20839 ^ adcCore_sampF_rRdPtr_rsCounter[6] ;
  assign z__h20853 = z__h20846 ^ adcCore_sampF_rRdPtr_rsCounter[7] ;
  assign z__h20860 = z__h20853 ^ adcCore_sampF_rRdPtr_rsCounter[8] ;
  assign z__h20867 = z__h20860 ^ adcCore_sampF_rRdPtr_rsCounter[9] ;
  assign z__h7531 =
	     fcAdc_grayCounter_rsCounter[0] ^ fcAdc_grayCounter_rsCounter[1] ;
  assign z__h7538 = z__h7531 ^ fcAdc_grayCounter_rsCounter[2] ;
  assign z__h7545 = z__h7538 ^ fcAdc_grayCounter_rsCounter[3] ;
  assign z__h7552 = z__h7545 ^ fcAdc_grayCounter_rsCounter[4] ;
  assign z__h7559 = z__h7552 ^ fcAdc_grayCounter_rsCounter[5] ;
  assign z__h7566 = z__h7559 ^ fcAdc_grayCounter_rsCounter[6] ;
  assign z__h7573 = z__h7566 ^ fcAdc_grayCounter_rsCounter[7] ;
  assign z__h7580 = z__h7573 ^ fcAdc_grayCounter_rsCounter[8] ;
  assign z__h7587 = z__h7580 ^ fcAdc_grayCounter_rsCounter[9] ;
  assign z__h7594 = z__h7587 ^ fcAdc_grayCounter_rsCounter[10] ;
  assign z__h7601 = z__h7594 ^ fcAdc_grayCounter_rsCounter[11] ;
  assign z__h7608 = z__h7601 ^ fcAdc_grayCounter_rsCounter[12] ;
  assign z__h7615 = z__h7608 ^ fcAdc_grayCounter_rsCounter[13] ;
  assign z__h7622 = z__h7615 ^ fcAdc_grayCounter_rsCounter[14] ;
  assign z__h7629 = z__h7622 ^ fcAdc_grayCounter_rsCounter[15] ;
  assign z__h7636 = z__h7629 ^ fcAdc_grayCounter_rsCounter[16] ;
  always@(adcCore_colGate_timeMesg or
	  adcCore_colGate_dwellFails or
	  adcCore_colGate_dwellStarts or
	  adcCore_colGate_sampCount or
	  adcCore_colGate_dropCount or wti_nowReq_BITS_63_TO_0__q1)
  begin
    case (adcCore_colGate_timeMesg)
      3'h1: x1_data__h14584 = adcCore_colGate_dwellStarts;
      3'h3: x1_data__h14584 = adcCore_colGate_sampCount;
      3'h4: x1_data__h14584 = adcCore_colGate_dropCount;
      3'h5: x1_data__h14584 = wti_nowReq_BITS_63_TO_0__q1[31:0];
      3'h6: x1_data__h14584 = wti_nowReq_BITS_63_TO_0__q1[63:32];
      default: x1_data__h14584 = adcCore_colGate_dwellFails;
    endcase
  end
  always@(wci_wslv_reqF$D_OUT or
	  rdat__h63416 or
	  adcStatusLs__h63134 or
	  maxMesgLength or
	  adcControl or
	  rdat__h63498 or
	  adcCore_statsCC$dD_OUT or
	  adcCore_sampCC$dD_OUT or
	  rdat__h63518 or
	  mesgCount or
	  lastOverflowMesg or wsiM_extStatusW$wget or overflowCountD)
  begin
    case (wci_wslv_reqF$D_OUT[39:32])
      8'h0:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      rdat__h63416;
      8'h04:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      adcStatusLs__h63134;
      8'h08:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      maxMesgLength;
      8'h0C:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      adcControl;
      8'h10:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      32'h20120625;
      8'h14:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      rdat__h63498;
      8'h18:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      adcCore_statsCC$dD_OUT[95:64];
      8'h1C:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      adcCore_sampCC$dD_OUT;
      8'h30:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      rdat__h63518;
      8'h34:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      mesgCount;
      8'h3C:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      adcCore_statsCC$dD_OUT[63:32];
      8'h40:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      adcCore_statsCC$dD_OUT[31:0];
      8'h44:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      lastOverflowMesg;
      8'h50:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      wsiM_extStatusW$wget[95:64];
      8'h54:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      wsiM_extStatusW$wget[63:32];
      8'h58:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      wsiM_extStatusW$wget[31:0];
      8'h5C:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      adcCore_statsCC$dD_OUT[127:96];
      8'h60:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
	      overflowCountD;
      default: IF_wci_wslv_reqF_first__5_BITS_39_TO_32_086_EQ_ETC___d1190 =
		   32'd0;
    endcase
  end
  always@(adcCore_colGate_avgPhase)
  begin
    case (adcCore_colGate_avgPhase)
      2'd0, 2'd1, 2'd2, 2'd3:
	  CASE_adcCore_colGate_avgPhase_0b1_0_1_1_1_2_1__ETC__q2 = 1'd1;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (wciS0_MReset_n == `BSV_RESET_VALUE)
      begin
        adcControl <= `BSV_ASSIGNMENT_DELAY 32'd0;
	adcCore_acquireDReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_adcRst <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_averageDReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_iseqFsm_jj_delay_count <= `BSV_ASSIGNMENT_DELAY 13'd1;
	adcCore_iseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_iseqFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_iseqFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY 1'd1;
	adcCore_iseqFsm_state_fired <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_iseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 4'd0;
	adcCore_operateDReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_readMode <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_spiI_reqF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_spiI_respF_head_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fcAdc_countNow <= `BSV_ASSIGNMENT_DELAY 18'd262143;
	fcAdc_countPast <= `BSV_ASSIGNMENT_DELAY 18'd262143;
	fcAdc_frequency <= `BSV_ASSIGNMENT_DELAY 18'd262143;
	fcAdc_pulseAction <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fcAdc_sampleCount <= `BSV_ASSIGNMENT_DELAY 16'd0;
	initOpInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	lastOverflowMesg <= `BSV_ASSIGNMENT_DELAY 32'hFFFFFFFF;
	maxMesgLength <= `BSV_ASSIGNMENT_DELAY 32'd1024;
	mesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	oneKHz_value <= `BSV_ASSIGNMENT_DELAY 18'd0;
	overflowCountD <= `BSV_ASSIGNMENT_DELAY 32'd0;
	sFlagState <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiResp <= `BSV_ASSIGNMENT_DELAY 8'd255;
	splitReadInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
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
      end
    else
      begin
        if (adcControl$EN)
	  adcControl <= `BSV_ASSIGNMENT_DELAY adcControl$D_IN;
	if (adcCore_acquireDReg$EN)
	  adcCore_acquireDReg <= `BSV_ASSIGNMENT_DELAY
	      adcCore_acquireDReg$D_IN;
	if (adcCore_adcRst$EN)
	  adcCore_adcRst <= `BSV_ASSIGNMENT_DELAY adcCore_adcRst$D_IN;
	if (adcCore_averageDReg$EN)
	  adcCore_averageDReg <= `BSV_ASSIGNMENT_DELAY
	      adcCore_averageDReg$D_IN;
	if (adcCore_iseqFsm_jj_delay_count$EN)
	  adcCore_iseqFsm_jj_delay_count <= `BSV_ASSIGNMENT_DELAY
	      adcCore_iseqFsm_jj_delay_count$D_IN;
	if (adcCore_iseqFsm_start_reg$EN)
	  adcCore_iseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY
	      adcCore_iseqFsm_start_reg$D_IN;
	if (adcCore_iseqFsm_start_reg_1$EN)
	  adcCore_iseqFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY
	      adcCore_iseqFsm_start_reg_1$D_IN;
	if (adcCore_iseqFsm_state_can_overlap$EN)
	  adcCore_iseqFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY
	      adcCore_iseqFsm_state_can_overlap$D_IN;
	if (adcCore_iseqFsm_state_fired$EN)
	  adcCore_iseqFsm_state_fired <= `BSV_ASSIGNMENT_DELAY
	      adcCore_iseqFsm_state_fired$D_IN;
	if (adcCore_iseqFsm_state_mkFSMstate$EN)
	  adcCore_iseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY
	      adcCore_iseqFsm_state_mkFSMstate$D_IN;
	if (adcCore_operateDReg$EN)
	  adcCore_operateDReg <= `BSV_ASSIGNMENT_DELAY
	      adcCore_operateDReg$D_IN;
	if (adcCore_readMode$EN)
	  adcCore_readMode <= `BSV_ASSIGNMENT_DELAY adcCore_readMode$D_IN;
	if (adcCore_spiI_reqF_tail_wrapped$EN)
	  adcCore_spiI_reqF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY
	      adcCore_spiI_reqF_tail_wrapped$D_IN;
	if (adcCore_spiI_respF_head_wrapped$EN)
	  adcCore_spiI_respF_head_wrapped <= `BSV_ASSIGNMENT_DELAY
	      adcCore_spiI_respF_head_wrapped$D_IN;
	if (fcAdc_countNow$EN)
	  fcAdc_countNow <= `BSV_ASSIGNMENT_DELAY fcAdc_countNow$D_IN;
	if (fcAdc_countPast$EN)
	  fcAdc_countPast <= `BSV_ASSIGNMENT_DELAY fcAdc_countPast$D_IN;
	if (fcAdc_frequency$EN)
	  fcAdc_frequency <= `BSV_ASSIGNMENT_DELAY fcAdc_frequency$D_IN;
	if (fcAdc_pulseAction$EN)
	  fcAdc_pulseAction <= `BSV_ASSIGNMENT_DELAY fcAdc_pulseAction$D_IN;
	if (fcAdc_sampleCount$EN)
	  fcAdc_sampleCount <= `BSV_ASSIGNMENT_DELAY fcAdc_sampleCount$D_IN;
	if (initOpInFlight$EN)
	  initOpInFlight <= `BSV_ASSIGNMENT_DELAY initOpInFlight$D_IN;
	if (lastOverflowMesg$EN)
	  lastOverflowMesg <= `BSV_ASSIGNMENT_DELAY lastOverflowMesg$D_IN;
	if (maxMesgLength$EN)
	  maxMesgLength <= `BSV_ASSIGNMENT_DELAY maxMesgLength$D_IN;
	if (mesgCount$EN) mesgCount <= `BSV_ASSIGNMENT_DELAY mesgCount$D_IN;
	if (oneKHz_value$EN)
	  oneKHz_value <= `BSV_ASSIGNMENT_DELAY oneKHz_value$D_IN;
	if (overflowCountD$EN)
	  overflowCountD <= `BSV_ASSIGNMENT_DELAY overflowCountD$D_IN;
	if (sFlagState$EN)
	  sFlagState <= `BSV_ASSIGNMENT_DELAY sFlagState$D_IN;
	if (spiResp$EN) spiResp <= `BSV_ASSIGNMENT_DELAY spiResp$D_IN;
	if (splitReadInFlight$EN)
	  splitReadInFlight <= `BSV_ASSIGNMENT_DELAY splitReadInFlight$D_IN;
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
      end
    if (adcCore_spiI_reqS$EN)
      adcCore_spiI_reqS <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_reqS$D_IN;
    if (wsiM_statusR$EN)
      wsiM_statusR <= `BSV_ASSIGNMENT_DELAY wsiM_statusR$D_IN;
  end
  always@(posedge CLK_adc_clock)
  begin
    if (adcCore_sdrRst$OUT_RST == `BSV_RESET_VALUE)
      begin
        adcCore_colGate_avgEven <= `BSV_ASSIGNMENT_DELAY 18'd0;
	adcCore_colGate_avgOdd <= `BSV_ASSIGNMENT_DELAY 18'd0;
	adcCore_colGate_avgPhase <= `BSV_ASSIGNMENT_DELAY 2'd0;
	adcCore_colGate_collectD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_colGate_dropCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	adcCore_colGate_dwellFails <= `BSV_ASSIGNMENT_DELAY 32'd0;
	adcCore_colGate_dwellStarts <= `BSV_ASSIGNMENT_DELAY 32'd0;
	adcCore_colGate_ovrRecover <= `BSV_ASSIGNMENT_DELAY 4'd0;
	adcCore_colGate_sampActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_colGate_sampActiveD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_colGate_sampCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	adcCore_colGate_syncMesg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	adcCore_colGate_timeMesg <= `BSV_ASSIGNMENT_DELAY 3'd0;
	adcCore_colGate_uprollCnt <= `BSV_ASSIGNMENT_DELAY 16'd0;
	wti_nowReq <= `BSV_ASSIGNMENT_DELAY 67'd0;
	wti_operateD <= `BSV_ASSIGNMENT_DELAY 1'd1;
      end
    else
      begin
        if (adcCore_colGate_avgEven$EN)
	  adcCore_colGate_avgEven <= `BSV_ASSIGNMENT_DELAY
	      adcCore_colGate_avgEven$D_IN;
	if (adcCore_colGate_avgOdd$EN)
	  adcCore_colGate_avgOdd <= `BSV_ASSIGNMENT_DELAY
	      adcCore_colGate_avgOdd$D_IN;
	if (adcCore_colGate_avgPhase$EN)
	  adcCore_colGate_avgPhase <= `BSV_ASSIGNMENT_DELAY
	      adcCore_colGate_avgPhase$D_IN;
	if (adcCore_colGate_collectD$EN)
	  adcCore_colGate_collectD <= `BSV_ASSIGNMENT_DELAY
	      adcCore_colGate_collectD$D_IN;
	if (adcCore_colGate_dropCount$EN)
	  adcCore_colGate_dropCount <= `BSV_ASSIGNMENT_DELAY
	      adcCore_colGate_dropCount$D_IN;
	if (adcCore_colGate_dwellFails$EN)
	  adcCore_colGate_dwellFails <= `BSV_ASSIGNMENT_DELAY
	      adcCore_colGate_dwellFails$D_IN;
	if (adcCore_colGate_dwellStarts$EN)
	  adcCore_colGate_dwellStarts <= `BSV_ASSIGNMENT_DELAY
	      adcCore_colGate_dwellStarts$D_IN;
	if (adcCore_colGate_ovrRecover$EN)
	  adcCore_colGate_ovrRecover <= `BSV_ASSIGNMENT_DELAY
	      adcCore_colGate_ovrRecover$D_IN;
	if (adcCore_colGate_sampActive$EN)
	  adcCore_colGate_sampActive <= `BSV_ASSIGNMENT_DELAY
	      adcCore_colGate_sampActive$D_IN;
	if (adcCore_colGate_sampActiveD$EN)
	  adcCore_colGate_sampActiveD <= `BSV_ASSIGNMENT_DELAY
	      adcCore_colGate_sampActiveD$D_IN;
	if (adcCore_colGate_sampCount$EN)
	  adcCore_colGate_sampCount <= `BSV_ASSIGNMENT_DELAY
	      adcCore_colGate_sampCount$D_IN;
	if (adcCore_colGate_syncMesg$EN)
	  adcCore_colGate_syncMesg <= `BSV_ASSIGNMENT_DELAY
	      adcCore_colGate_syncMesg$D_IN;
	if (adcCore_colGate_timeMesg$EN)
	  adcCore_colGate_timeMesg <= `BSV_ASSIGNMENT_DELAY
	      adcCore_colGate_timeMesg$D_IN;
	if (adcCore_colGate_uprollCnt$EN)
	  adcCore_colGate_uprollCnt <= `BSV_ASSIGNMENT_DELAY
	      adcCore_colGate_uprollCnt$D_IN;
	if (wti_nowReq$EN)
	  wti_nowReq <= `BSV_ASSIGNMENT_DELAY wti_nowReq$D_IN;
	if (wti_operateD$EN)
	  wti_operateD <= `BSV_ASSIGNMENT_DELAY wti_operateD$D_IN;
      end
    if (adcCore_colGate_sampDataWD$EN)
      adcCore_colGate_sampDataWD <= `BSV_ASSIGNMENT_DELAY
	  adcCore_colGate_sampDataWD$D_IN;
    if (adcCore_iobA$EN)
      adcCore_iobA <= `BSV_ASSIGNMENT_DELAY adcCore_iobA$D_IN;
    if (adcCore_iobB$EN)
      adcCore_iobB <= `BSV_ASSIGNMENT_DELAY adcCore_iobB$D_IN;
    if (adcCore_samp$EN)
      adcCore_samp <= `BSV_ASSIGNMENT_DELAY adcCore_samp$D_IN;
  end
  always@(posedge adcCore_spiI_cd$CLK_OUT)
  begin
    if (adcCore_spiI_slowReset$OUT_RST == `BSV_RESET_VALUE)
      begin
        adcCore_spiI_cGate <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_spiI_csbR <= `BSV_ASSIGNMENT_DELAY 1'b1;
	adcCore_spiI_doResp <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_spiI_reqF_head_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_spiI_respF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_spiI_sdoR <= `BSV_ASSIGNMENT_DELAY 1'b0;
	adcCore_spiI_xmt_d <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore_spiI_xmt_i <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (adcCore_spiI_cGate$EN)
	  adcCore_spiI_cGate <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_cGate$D_IN;
	if (adcCore_spiI_csbR$EN)
	  adcCore_spiI_csbR <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_csbR$D_IN;
	if (adcCore_spiI_doResp$EN)
	  adcCore_spiI_doResp <= `BSV_ASSIGNMENT_DELAY
	      adcCore_spiI_doResp$D_IN;
	if (adcCore_spiI_reqF_head_wrapped$EN)
	  adcCore_spiI_reqF_head_wrapped <= `BSV_ASSIGNMENT_DELAY
	      adcCore_spiI_reqF_head_wrapped$D_IN;
	if (adcCore_spiI_respF_tail_wrapped$EN)
	  adcCore_spiI_respF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY
	      adcCore_spiI_respF_tail_wrapped$D_IN;
	if (adcCore_spiI_sdoR$EN)
	  adcCore_spiI_sdoR <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_sdoR$D_IN;
	if (adcCore_spiI_xmt_d$EN)
	  adcCore_spiI_xmt_d <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_xmt_d$D_IN;
	if (adcCore_spiI_xmt_i$EN)
	  adcCore_spiI_xmt_i <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_xmt_i$D_IN;
      end
    if (adcCore_spiI_cap$EN)
      adcCore_spiI_cap <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_cap$D_IN;
    if (adcCore_spiI_cap_1$EN)
      adcCore_spiI_cap_1 <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_cap_1$D_IN;
    if (adcCore_spiI_cap_2$EN)
      adcCore_spiI_cap_2 <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_cap_2$D_IN;
    if (adcCore_spiI_cap_3$EN)
      adcCore_spiI_cap_3 <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_cap_3$D_IN;
    if (adcCore_spiI_cap_4$EN)
      adcCore_spiI_cap_4 <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_cap_4$D_IN;
    if (adcCore_spiI_cap_5$EN)
      adcCore_spiI_cap_5 <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_cap_5$D_IN;
    if (adcCore_spiI_cap_6$EN)
      adcCore_spiI_cap_6 <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_cap_6$D_IN;
    if (adcCore_spiI_cap_7$EN)
      adcCore_spiI_cap_7 <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_cap_7$D_IN;
    if (adcCore_spiI_dPos$EN)
      adcCore_spiI_dPos <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_dPos$D_IN;
    if (adcCore_spiI_iPos$EN)
      adcCore_spiI_iPos <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_iPos$D_IN;
    if (adcCore_spiI_respS$EN)
      adcCore_spiI_respS <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_respS$D_IN;
  end
  always@(posedge adcCore_spiI_cinv$CLK_OUT)
  begin
    if (adcCore_spiI_sdiP$EN)
      adcCore_spiI_sdiP <= `BSV_ASSIGNMENT_DELAY adcCore_spiI_sdiP$D_IN;
  end
  always@(posedge wciS0_Clk or `BSV_RESET_EDGE wciS0_MReset_n)
  if (wciS0_MReset_n == `BSV_RESET_VALUE)
    begin
      adcCore_sampF_rRdPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
      adcCore_sampF_rWrPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
      adcCore_sampF_rWrPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY 11'd0;
      fcAdc_grayCounter_rdCounter <= `BSV_ASSIGNMENT_DELAY 18'd0;
      fcAdc_grayCounter_rdCounterPre <= `BSV_ASSIGNMENT_DELAY 18'd0;
      wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wsiM_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (adcCore_sampF_rRdPtr_rsCounter$EN)
	adcCore_sampF_rRdPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY
	    adcCore_sampF_rRdPtr_rsCounter$D_IN;
      if (adcCore_sampF_rWrPtr_rdCounter$EN)
	adcCore_sampF_rWrPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY
	    adcCore_sampF_rWrPtr_rdCounter$D_IN;
      if (adcCore_sampF_rWrPtr_rdCounterPre$EN)
	adcCore_sampF_rWrPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY
	    adcCore_sampF_rWrPtr_rdCounterPre$D_IN;
      if (fcAdc_grayCounter_rdCounter$EN)
	fcAdc_grayCounter_rdCounter <= `BSV_ASSIGNMENT_DELAY
	    fcAdc_grayCounter_rdCounter$D_IN;
      if (fcAdc_grayCounter_rdCounterPre$EN)
	fcAdc_grayCounter_rdCounterPre <= `BSV_ASSIGNMENT_DELAY
	    fcAdc_grayCounter_rdCounterPre$D_IN;
      if (wci_wslv_isReset_isInReset$EN)
	wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wci_wslv_isReset_isInReset$D_IN;
      if (wsiM_isReset_isInReset$EN)
	wsiM_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wsiM_isReset_isInReset$D_IN;
    end
  always@(posedge CLK_adc_clock or `BSV_RESET_EDGE adcCore_sdrRst$OUT_RST)
  if (adcCore_sdrRst$OUT_RST == `BSV_RESET_VALUE)
    begin
      adcCore_sampF_rRdPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
      adcCore_sampF_rRdPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY 11'd0;
      adcCore_sampF_rWrPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
      wti_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (adcCore_sampF_rRdPtr_rdCounter$EN)
	adcCore_sampF_rRdPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY
	    adcCore_sampF_rRdPtr_rdCounter$D_IN;
      if (adcCore_sampF_rRdPtr_rdCounterPre$EN)
	adcCore_sampF_rRdPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY
	    adcCore_sampF_rRdPtr_rdCounterPre$D_IN;
      if (adcCore_sampF_rWrPtr_rsCounter$EN)
	adcCore_sampF_rWrPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY
	    adcCore_sampF_rWrPtr_rsCounter$D_IN;
      if (wti_isReset_isInReset$EN)
	wti_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wti_isReset_isInReset$D_IN;
    end
  always@(posedge CLK_adcCaptureClk or `BSV_RESET_EDGE fcAdc_testRst$OUT_RST)
  if (fcAdc_testRst$OUT_RST == `BSV_RESET_VALUE)
    begin
      fcAdc_grayCounter_rsCounter <= `BSV_ASSIGNMENT_DELAY 18'd0;
    end
  else
    begin
      if (fcAdc_grayCounter_rsCounter$EN)
	fcAdc_grayCounter_rsCounter <= `BSV_ASSIGNMENT_DELAY
	    fcAdc_grayCounter_rsCounter$D_IN;
    end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    adcControl = 32'hAAAAAAAA;
    adcCore_acquireDReg = 1'h0;
    adcCore_adcRst = 1'h0;
    adcCore_averageDReg = 1'h0;
    adcCore_colGate_avgEven = 18'h2AAAA;
    adcCore_colGate_avgOdd = 18'h2AAAA;
    adcCore_colGate_avgPhase = 2'h2;
    adcCore_colGate_collectD = 1'h0;
    adcCore_colGate_dropCount = 32'hAAAAAAAA;
    adcCore_colGate_dwellFails = 32'hAAAAAAAA;
    adcCore_colGate_dwellStarts = 32'hAAAAAAAA;
    adcCore_colGate_ovrRecover = 4'hA;
    adcCore_colGate_sampActive = 1'h0;
    adcCore_colGate_sampActiveD = 1'h0;
    adcCore_colGate_sampCount = 32'hAAAAAAAA;
    adcCore_colGate_sampDataWD = 32'hAAAAAAAA;
    adcCore_colGate_syncMesg = 2'h2;
    adcCore_colGate_timeMesg = 3'h2;
    adcCore_colGate_uprollCnt = 16'hAAAA;
    adcCore_iobA = 14'h2AAA;
    adcCore_iobB = 14'h2AAA;
    adcCore_iseqFsm_jj_delay_count = 13'h0AAA;
    adcCore_iseqFsm_start_reg = 1'h0;
    adcCore_iseqFsm_start_reg_1 = 1'h0;
    adcCore_iseqFsm_state_can_overlap = 1'h0;
    adcCore_iseqFsm_state_fired = 1'h0;
    adcCore_iseqFsm_state_mkFSMstate = 4'hA;
    adcCore_operateDReg = 1'h0;
    adcCore_readMode = 1'h0;
    adcCore_samp = 32'hAAAAAAAA;
    adcCore_sampF_rRdPtr_rdCounter = 11'h2AA;
    adcCore_sampF_rRdPtr_rdCounterPre = 11'h2AA;
    adcCore_sampF_rRdPtr_rsCounter = 11'h2AA;
    adcCore_sampF_rWrPtr_rdCounter = 11'h2AA;
    adcCore_sampF_rWrPtr_rdCounterPre = 11'h2AA;
    adcCore_sampF_rWrPtr_rsCounter = 11'h2AA;
    adcCore_spiI_cGate = 1'h0;
    adcCore_spiI_cap = 1'h0;
    adcCore_spiI_cap_1 = 1'h0;
    adcCore_spiI_cap_2 = 1'h0;
    adcCore_spiI_cap_3 = 1'h0;
    adcCore_spiI_cap_4 = 1'h0;
    adcCore_spiI_cap_5 = 1'h0;
    adcCore_spiI_cap_6 = 1'h0;
    adcCore_spiI_cap_7 = 1'h0;
    adcCore_spiI_csbR = 1'h0;
    adcCore_spiI_dPos = 3'h2;
    adcCore_spiI_doResp = 1'h0;
    adcCore_spiI_iPos = 4'hA;
    adcCore_spiI_reqF_head_wrapped = 1'h0;
    adcCore_spiI_reqF_tail_wrapped = 1'h0;
    adcCore_spiI_reqS = 17'h0AAAA;
    adcCore_spiI_respF_head_wrapped = 1'h0;
    adcCore_spiI_respF_tail_wrapped = 1'h0;
    adcCore_spiI_respS = 8'hAA;
    adcCore_spiI_sdiP = 1'h0;
    adcCore_spiI_sdoR = 1'h0;
    adcCore_spiI_xmt_d = 1'h0;
    adcCore_spiI_xmt_i = 1'h0;
    fcAdc_countNow = 18'h2AAAA;
    fcAdc_countPast = 18'h2AAAA;
    fcAdc_frequency = 18'h2AAAA;
    fcAdc_grayCounter_rdCounter = 18'h2AAAA;
    fcAdc_grayCounter_rdCounterPre = 18'h2AAAA;
    fcAdc_grayCounter_rsCounter = 18'h2AAAA;
    fcAdc_pulseAction = 1'h0;
    fcAdc_sampleCount = 16'hAAAA;
    initOpInFlight = 1'h0;
    lastOverflowMesg = 32'hAAAAAAAA;
    maxMesgLength = 32'hAAAAAAAA;
    mesgCount = 32'hAAAAAAAA;
    oneKHz_value = 18'h2AAAA;
    overflowCountD = 32'hAAAAAAAA;
    sFlagState = 1'h0;
    spiResp = 8'hAA;
    splitReadInFlight = 1'h0;
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
      if (WILL_FIRE_RL_wci_cfwr)
	begin
	  v__h62856 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	$display("[%0d]: %m: WCI CONFIG WRITE Addr:%0x BE:%0x Data:%0x",
		 v__h62856,
		 wci_wslv_reqF$D_OUT[63:32],
		 wci_wslv_reqF$D_OUT[67:64],
		 wci_wslv_reqF$D_OUT[31:0]);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_start)
	begin
	  v__h3700 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3700,
		 wci_wslv_reqF$D_OUT[36:34],
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && MUX_splitReadInFlight$write_1__PSEL_1)
	$display("Error: \"bsv/wrk/IQADCWorker.bsv\", line 122, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_get_adc_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/IQADCWorker.bsv\", line 122, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/IQADCWorker.bsv\", line 122, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO && MUX_splitReadInFlight$write_1__PSEL_1)
	$display("Error: \"bsv/wrk/IQADCWorker.bsv\", line 122, column 60: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_get_adc_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/IQADCWorker.bsv\", line 122, column 60: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_OrE && MUX_splitReadInFlight$write_1__PSEL_1)
	$display("Error: \"bsv/wrk/IQADCWorker.bsv\", line 122, column 74: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_OrE] and\n  [RL_get_adc_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (adcCore_iseqFsm_state_mkFSMstate == 4'd1 &&
	  (adcCore_iseqFsm_state_mkFSMstate == 4'd2 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_np ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l141c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9))
	$display("Error: \"bsv/dev/TI62P4X.bsv\", line 139, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore_iseqFsm_action_l139c12] and\n  [RL_adcCore_iseqFsm_action_d_init_np, RL_adcCore_iseqFsm_action_np,\n  RL_adcCore_iseqFsm_action_l141c9, RL_adcCore_iseqFsm_action_l142c9,\n  RL_adcCore_iseqFsm_action_l143c9, RL_adcCore_iseqFsm_action_l144c9,\n  RL_adcCore_iseqFsm_action_l145c9, RL_adcCore_iseqFsm_action_l146c9] ) fired\n  in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (adcCore_iseqFsm_state_mkFSMstate == 4'd2 &&
	  (WILL_FIRE_RL_adcCore_iseqFsm_action_np ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l141c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore_iseqFsm_action_d_init_np] and [RL_adcCore_iseqFsm_action_np,\n  RL_adcCore_iseqFsm_action_l141c9, RL_adcCore_iseqFsm_action_l142c9,\n  RL_adcCore_iseqFsm_action_l143c9, RL_adcCore_iseqFsm_action_l144c9,\n  RL_adcCore_iseqFsm_action_l145c9, RL_adcCore_iseqFsm_action_l146c9] ) fired\n  in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore_iseqFsm_action_np &&
	  (WILL_FIRE_RL_adcCore_iseqFsm_action_l141c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_adcCore_iseqFsm_action_np]\n  and [RL_adcCore_iseqFsm_action_l141c9, RL_adcCore_iseqFsm_action_l142c9,\n  RL_adcCore_iseqFsm_action_l143c9, RL_adcCore_iseqFsm_action_l144c9,\n  RL_adcCore_iseqFsm_action_l145c9, RL_adcCore_iseqFsm_action_l146c9] ) fired\n  in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9 &&
	  (WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9))
	$display("Error: \"bsv/dev/TI62P4X.bsv\", line 142, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore_iseqFsm_action_l142c9] and [RL_adcCore_iseqFsm_action_l143c9,\n  RL_adcCore_iseqFsm_action_l144c9, RL_adcCore_iseqFsm_action_l145c9,\n  RL_adcCore_iseqFsm_action_l146c9] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore_iseqFsm_action_l141c9 &&
	  (WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9))
	$display("Error: \"bsv/dev/TI62P4X.bsv\", line 141, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore_iseqFsm_action_l141c9] and [RL_adcCore_iseqFsm_action_l142c9,\n  RL_adcCore_iseqFsm_action_l143c9, RL_adcCore_iseqFsm_action_l144c9,\n  RL_adcCore_iseqFsm_action_l145c9, RL_adcCore_iseqFsm_action_l146c9] ) fired\n  in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9 &&
	  (WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9))
	$display("Error: \"bsv/dev/TI62P4X.bsv\", line 143, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore_iseqFsm_action_l143c9] and [RL_adcCore_iseqFsm_action_l144c9,\n  RL_adcCore_iseqFsm_action_l145c9, RL_adcCore_iseqFsm_action_l146c9] ) fired\n  in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9 &&
	  (WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9))
	$display("Error: \"bsv/dev/TI62P4X.bsv\", line 144, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore_iseqFsm_action_l144c9] and [RL_adcCore_iseqFsm_action_l145c9,\n  RL_adcCore_iseqFsm_action_l146c9] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 &&
	  WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9)
	$display("Error: \"bsv/dev/TI62P4X.bsv\", line 145, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore_iseqFsm_action_l145c9] and [RL_adcCore_iseqFsm_action_l146c9] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	begin
	  v__h63353 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	$display("[%0d]: %m: WCI CONFIG READ Addr:%0x BE:%0x Data:%0x",
		 v__h63353,
		 wci_wslv_reqF$D_OUT[63:32],
		 wci_wslv_reqF$D_OUT[67:64],
		 rdat__h63337);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && MUX_splitReadInFlight$write_1__PSEL_1)
	$display("Error: \"bsv/wrk/IQADCWorker.bsv\", line 122, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_get_adc_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/IQADCWorker.bsv\", line 122, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/IQADCWorker.bsv\", line 122, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/IQADCWorker.bsv\", line 122, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/wrk/IQADCWorker.bsv\", line 122, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and [RL_wci_cfrd] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && MUX_splitReadInFlight$write_1__PSEL_1)
	$display("Error: \"bsv/wrk/IQADCWorker.bsv\", line 122, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_get_adc_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/IQADCWorker.bsv\", line 122, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/IQADCWorker.bsv\", line 122, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/IQADCWorker.bsv\", line 122, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	begin
	  v__h4019 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h4019,
		 wci_wslv_cEdge,
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	begin
	  v__h3875 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h3875,
		 wci_wslv_cEdge,
		 wci_wslv_cState,
		 wci_wslv_nState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore_iseqFsm_action_l138c12 &&
	  (adcCore_iseqFsm_state_mkFSMstate == 4'd1 ||
	   adcCore_iseqFsm_state_mkFSMstate == 4'd2 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_np ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l141c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l142c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l143c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l144c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l145c9 ||
	   WILL_FIRE_RL_adcCore_iseqFsm_action_l146c9))
	$display("Error: \"bsv/dev/TI62P4X.bsv\", line 138, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore_iseqFsm_action_l138c12] and [RL_adcCore_iseqFsm_action_l139c12,\n  RL_adcCore_iseqFsm_action_d_init_np, RL_adcCore_iseqFsm_action_np,\n  RL_adcCore_iseqFsm_action_l141c9, RL_adcCore_iseqFsm_action_l142c9,\n  RL_adcCore_iseqFsm_action_l143c9, RL_adcCore_iseqFsm_action_l144c9,\n  RL_adcCore_iseqFsm_action_l145c9, RL_adcCore_iseqFsm_action_l146c9] ) fired\n  in the same clock cycle.\n");
  end
  // synopsys translate_on
endmodule