module outputs
  wire [31 : 0] wciS0_SData, wsiM0_MData;
  wire [11 : 0] wsiM0_MBurstLength;
  wire [7 : 0] wsiM0_MReqInfo;
  wire [3 : 0] wsiM0_MByteEn;
  wire [2 : 0] wsiM0_MCmd;
  wire [1 : 0] wciS0_SFlag, wciS0_SResp;
  wire CLK_GATE_adc0_sclk,
       CLK_GATE_adc0_sclkn,
       CLK_GATE_adc1_sclk,
       CLK_GATE_adc1_sclkn,
       CLK_GATE_adcSdrClk,
       CLK_GATE_adx_sclk,
       CLK_GATE_adx_sclkn,
       CLK_adc0_sclk,
       CLK_adc0_sclkn,
       CLK_adc1_sclk,
       CLK_adc1_sclkn,
       CLK_adcSdrClk,
       CLK_adx_sclk,
       CLK_adx_sclkn,
       RST_N_adc0_rst,
       RST_N_adc1_rst,
       RST_N_adcSdrRst,
       RST_N_adx_srst,
       adc0_oe,
       adc0_resetp,
       adc0_sdata,
       adc0_sen,
       adc1_oe,
       adc1_resetp,
       adc1_sdata,
       adc1_sen,
       adx_csb,
       adx_funct,
       adx_sdo,
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
  wire [63 : 0] adcCore0_colGate_nowW$wget,
		adcCore0_nowW$wget,
		adcCore1_colGate_nowW$wget,
		adcCore1_nowW$wget;
  wire [60 : 0] wsiM_reqFifo_x_wire$wget;
  wire [38 : 0] adcCore0_sampF_wDataIn$wget,
		adcCore0_sampF_wDataOut$wget,
		adcCore1_sampF_wDataIn$wget,
		adcCore1_sampF_wDataOut$wget;
  wire [33 : 0] wci_wslv_respF_x_wire$wget;
  wire [31 : 0] adcCore0_colGate_sampDataW$wget,
		adcCore1_colGate_sampDataW$wget,
		wci_wci_Es_mAddr_w$wget,
		wci_wci_Es_mData_w$wget;
  wire [17 : 0] fcAdc_grayCounter_wdCounterCrossing$wget;
  wire [15 : 0] adcCore0_colGate_maxBurstLenW$wget,
		adcCore1_colGate_maxBurstLenW$wget;
  wire [10 : 0] adcCore0_sampF_rRdPtr_wdCounterCrossing$wget,
		adcCore0_sampF_rWrPtr_wdCounterCrossing$wget,
		adcCore1_sampF_rRdPtr_wdCounterCrossing$wget,
		adcCore1_sampF_rWrPtr_wdCounterCrossing$wget;
  wire [3 : 0] wci_wci_Es_mByteEn_w$wget;
  wire [2 : 0] wci_wci_Es_mCmd_w$wget, wci_wslv_wEdge$wget;
  wire [1 : 0] adcCore0_ddrC_psCmdReg_1$wget, adcCore1_ddrC_psCmdReg_1$wget;
  wire adcCore0_acquireDReg_1$wget,
       adcCore0_acquireDReg_1$whas,
       adcCore0_adcRst_1$wget,
       adcCore0_adcRst_1$whas,
       adcCore0_averageDReg_1$wget,
       adcCore0_averageDReg_1$whas,
       adcCore0_colGate_average_dw$wget,
       adcCore0_colGate_average_dw$whas,
       adcCore0_colGate_collectPW$whas,
       adcCore0_colGate_enaSyncPW$whas,
       adcCore0_colGate_enaTimestampPW$whas,
       adcCore0_colGate_maxBurstLenW$whas,
       adcCore0_colGate_nowW$whas,
       adcCore0_colGate_operatePW$whas,
       adcCore0_colGate_sampActive_1$wget,
       adcCore0_colGate_sampActive_1$whas,
       adcCore0_colGate_sampDataW$whas,
       adcCore0_ddrC_psCmdReg_1$whas,
       adcCore0_iseqFsm_abort$wget,
       adcCore0_iseqFsm_abort$whas,
       adcCore0_iseqFsm_start_reg_1_1$wget,
       adcCore0_iseqFsm_start_reg_1_1$whas,
       adcCore0_iseqFsm_start_wire$wget,
       adcCore0_iseqFsm_start_wire$whas,
       adcCore0_iseqFsm_state_fired_1$wget,
       adcCore0_iseqFsm_state_fired_1$whas,
       adcCore0_iseqFsm_state_overlap_pw$whas,
       adcCore0_iseqFsm_state_set_pw$whas,
       adcCore0_nowW$whas,
       adcCore0_operateDReg_1$wget,
       adcCore0_operateDReg_1$whas,
       adcCore0_sampF_pwDequeue$whas,
       adcCore0_sampF_pwEnqueue$whas,
       adcCore0_sampF_rRdPtr_pwDecrement$whas,
       adcCore0_sampF_rRdPtr_pwIncrement$whas,
       adcCore0_sampF_rWrPtr_pwDecrement$whas,
       adcCore0_sampF_rWrPtr_pwIncrement$whas,
       adcCore0_sampF_wDataIn$whas,
       adcCore0_sampF_wDataOut$whas,
       adcCore0_spiI_cGate_1$wget,
       adcCore0_spiI_cGate_1$whas,
       adcCore0_spiI_csbR_1$wget,
       adcCore0_spiI_csbR_1$whas,
       adcCore0_spiI_doResp_1$wget,
       adcCore0_spiI_doResp_1$whas,
       adcCore0_spiI_reqF_dClear_pw$whas,
       adcCore0_spiI_reqF_deq_happened$whas,
       adcCore0_spiI_reqF_deq_pw$whas,
       adcCore0_spiI_reqF_enq_pw$whas,
       adcCore0_spiI_reqF_sClear_pw$whas,
       adcCore0_spiI_respF_dClear_pw$whas,
       adcCore0_spiI_respF_deq_happened$whas,
       adcCore0_spiI_respF_deq_pw$whas,
       adcCore0_spiI_respF_enq_pw$whas,
       adcCore0_spiI_respF_sClear_pw$whas,
       adcCore0_spiI_sdiWs$wget,
       adcCore0_spiI_sdoR_1$wget,
       adcCore0_spiI_sdoR_1$whas,
       adcCore1_acquireDReg_1$wget,
       adcCore1_acquireDReg_1$whas,
       adcCore1_adcRst_1$wget,
       adcCore1_adcRst_1$whas,
       adcCore1_averageDReg_1$wget,
       adcCore1_averageDReg_1$whas,
       adcCore1_colGate_average_dw$wget,
       adcCore1_colGate_average_dw$whas,
       adcCore1_colGate_collectPW$whas,
       adcCore1_colGate_enaSyncPW$whas,
       adcCore1_colGate_enaTimestampPW$whas,
       adcCore1_colGate_maxBurstLenW$whas,
       adcCore1_colGate_nowW$whas,
       adcCore1_colGate_operatePW$whas,
       adcCore1_colGate_sampActive_1$wget,
       adcCore1_colGate_sampActive_1$whas,
       adcCore1_colGate_sampDataW$whas,
       adcCore1_ddrC_psCmdReg_1$whas,
       adcCore1_iseqFsm_abort$wget,
       adcCore1_iseqFsm_abort$whas,
       adcCore1_iseqFsm_start_reg_1_1$wget,
       adcCore1_iseqFsm_start_reg_1_1$whas,
       adcCore1_iseqFsm_start_wire$wget,
       adcCore1_iseqFsm_start_wire$whas,
       adcCore1_iseqFsm_state_fired_1$wget,
       adcCore1_iseqFsm_state_fired_1$whas,
       adcCore1_iseqFsm_state_overlap_pw$whas,
       adcCore1_iseqFsm_state_set_pw$whas,
       adcCore1_nowW$whas,
       adcCore1_operateDReg_1$wget,
       adcCore1_operateDReg_1$whas,
       adcCore1_sampF_pwDequeue$whas,
       adcCore1_sampF_pwEnqueue$whas,
       adcCore1_sampF_rRdPtr_pwDecrement$whas,
       adcCore1_sampF_rRdPtr_pwIncrement$whas,
       adcCore1_sampF_rWrPtr_pwDecrement$whas,
       adcCore1_sampF_rWrPtr_pwIncrement$whas,
       adcCore1_sampF_wDataIn$whas,
       adcCore1_sampF_wDataOut$whas,
       adcCore1_spiI_cGate_1$wget,
       adcCore1_spiI_cGate_1$whas,
       adcCore1_spiI_csbR_1$wget,
       adcCore1_spiI_csbR_1$whas,
       adcCore1_spiI_doResp_1$wget,
       adcCore1_spiI_doResp_1$whas,
       adcCore1_spiI_reqF_dClear_pw$whas,
       adcCore1_spiI_reqF_deq_happened$whas,
       adcCore1_spiI_reqF_deq_pw$whas,
       adcCore1_spiI_reqF_enq_pw$whas,
       adcCore1_spiI_reqF_sClear_pw$whas,
       adcCore1_spiI_respF_dClear_pw$whas,
       adcCore1_spiI_respF_deq_happened$whas,
       adcCore1_spiI_respF_deq_pw$whas,
       adcCore1_spiI_respF_enq_pw$whas,
       adcCore1_spiI_respF_sClear_pw$whas,
       adcCore1_spiI_sdiWs$wget,
       adcCore1_spiI_sdoR_1$wget,
       adcCore1_spiI_sdoR_1$whas,
       fcAdc_grayCounter_pwDecrement$whas,
       fcAdc_grayCounter_pwIncrement$whas,
       fcAdc_pulseAction_1$wget,
       fcAdc_pulseAction_1$whas,
       oneKHz_decAction$whas,
       oneKHz_incAction$whas,
       spiClk_iseqFsm_abort$wget,
       spiClk_iseqFsm_abort$whas,
       spiClk_iseqFsm_start_reg_1_1$wget,
       spiClk_iseqFsm_start_reg_1_1$whas,
       spiClk_iseqFsm_start_wire$wget,
       spiClk_iseqFsm_start_wire$whas,
       spiClk_iseqFsm_state_fired_1$wget,
       spiClk_iseqFsm_state_fired_1$whas,
       spiClk_iseqFsm_state_overlap_pw$whas,
       spiClk_iseqFsm_state_set_pw$whas,
       spiClk_spiI_cGate_1$wget,
       spiClk_spiI_cGate_1$whas,
       spiClk_spiI_csbR_1$wget,
       spiClk_spiI_csbR_1$whas,
       spiClk_spiI_doResp_1$wget,
       spiClk_spiI_doResp_1$whas,
       spiClk_spiI_reqF_dClear_pw$whas,
       spiClk_spiI_reqF_deq_happened$whas,
       spiClk_spiI_reqF_deq_pw$whas,
       spiClk_spiI_reqF_enq_pw$whas,
       spiClk_spiI_reqF_sClear_pw$whas,
       spiClk_spiI_respF_dClear_pw$whas,
       spiClk_spiI_respF_deq_happened$whas,
       spiClk_spiI_respF_deq_pw$whas,
       spiClk_spiI_respF_enq_pw$whas,
       spiClk_spiI_respF_sClear_pw$whas,
       spiClk_spiI_sdiWs$wget,
       spiClk_spiI_sdoR_1$wget,
       spiClk_spiI_sdoR_1$whas,
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
  // register adcCore0_acquireDReg
  reg adcCore0_acquireDReg;
  wire adcCore0_acquireDReg$D_IN, adcCore0_acquireDReg$EN;
  // register adcCore0_adcRst
  reg adcCore0_adcRst;
  wire adcCore0_adcRst$D_IN, adcCore0_adcRst$EN;
  // register adcCore0_averageDReg
  reg adcCore0_averageDReg;
  wire adcCore0_averageDReg$D_IN, adcCore0_averageDReg$EN;
  // register adcCore0_colGate_avgEven
  reg [17 : 0] adcCore0_colGate_avgEven;
  wire [17 : 0] adcCore0_colGate_avgEven$D_IN;
  wire adcCore0_colGate_avgEven$EN;
  // register adcCore0_colGate_avgOdd
  reg [17 : 0] adcCore0_colGate_avgOdd;
  wire [17 : 0] adcCore0_colGate_avgOdd$D_IN;
  wire adcCore0_colGate_avgOdd$EN;
  // register adcCore0_colGate_avgPhase
  reg [1 : 0] adcCore0_colGate_avgPhase;
  wire [1 : 0] adcCore0_colGate_avgPhase$D_IN;
  wire adcCore0_colGate_avgPhase$EN;
  // register adcCore0_colGate_collectD
  reg adcCore0_colGate_collectD;
  wire adcCore0_colGate_collectD$D_IN, adcCore0_colGate_collectD$EN;
  // register adcCore0_colGate_dropCount
  reg [31 : 0] adcCore0_colGate_dropCount;
  wire [31 : 0] adcCore0_colGate_dropCount$D_IN;
  wire adcCore0_colGate_dropCount$EN;
  // register adcCore0_colGate_dwellFails
  reg [31 : 0] adcCore0_colGate_dwellFails;
  wire [31 : 0] adcCore0_colGate_dwellFails$D_IN;
  wire adcCore0_colGate_dwellFails$EN;
  // register adcCore0_colGate_dwellStarts
  reg [31 : 0] adcCore0_colGate_dwellStarts;
  wire [31 : 0] adcCore0_colGate_dwellStarts$D_IN;
  wire adcCore0_colGate_dwellStarts$EN;
  // register adcCore0_colGate_ovrRecover
  reg [3 : 0] adcCore0_colGate_ovrRecover;
  reg [3 : 0] adcCore0_colGate_ovrRecover$D_IN;
  wire adcCore0_colGate_ovrRecover$EN;
  // register adcCore0_colGate_sampActive
  reg adcCore0_colGate_sampActive;
  wire adcCore0_colGate_sampActive$D_IN, adcCore0_colGate_sampActive$EN;
  // register adcCore0_colGate_sampActiveD
  reg adcCore0_colGate_sampActiveD;
  wire adcCore0_colGate_sampActiveD$D_IN, adcCore0_colGate_sampActiveD$EN;
  // register adcCore0_colGate_sampCount
  reg [31 : 0] adcCore0_colGate_sampCount;
  wire [31 : 0] adcCore0_colGate_sampCount$D_IN;
  wire adcCore0_colGate_sampCount$EN;
  // register adcCore0_colGate_sampDataWD
  reg [31 : 0] adcCore0_colGate_sampDataWD;
  wire [31 : 0] adcCore0_colGate_sampDataWD$D_IN;
  wire adcCore0_colGate_sampDataWD$EN;
  // register adcCore0_colGate_syncMesg
  reg [1 : 0] adcCore0_colGate_syncMesg;
  wire [1 : 0] adcCore0_colGate_syncMesg$D_IN;
  wire adcCore0_colGate_syncMesg$EN;
  // register adcCore0_colGate_timeMesg
  reg [2 : 0] adcCore0_colGate_timeMesg;
  wire [2 : 0] adcCore0_colGate_timeMesg$D_IN;
  wire adcCore0_colGate_timeMesg$EN;
  // register adcCore0_colGate_uprollCnt
  reg [15 : 0] adcCore0_colGate_uprollCnt;
  wire [15 : 0] adcCore0_colGate_uprollCnt$D_IN;
  wire adcCore0_colGate_uprollCnt$EN;
  // register adcCore0_ddrC_psCmdReg
  reg [1 : 0] adcCore0_ddrC_psCmdReg;
  wire [1 : 0] adcCore0_ddrC_psCmdReg$D_IN;
  wire adcCore0_ddrC_psCmdReg$EN;
  // register adcCore0_iseqFsm_jj_delay_count
  reg [12 : 0] adcCore0_iseqFsm_jj_delay_count;
  wire [12 : 0] adcCore0_iseqFsm_jj_delay_count$D_IN;
  wire adcCore0_iseqFsm_jj_delay_count$EN;
  // register adcCore0_iseqFsm_start_reg
  reg adcCore0_iseqFsm_start_reg;
  wire adcCore0_iseqFsm_start_reg$D_IN, adcCore0_iseqFsm_start_reg$EN;
  // register adcCore0_iseqFsm_start_reg_1
  reg adcCore0_iseqFsm_start_reg_1;
  wire adcCore0_iseqFsm_start_reg_1$D_IN, adcCore0_iseqFsm_start_reg_1$EN;
  // register adcCore0_iseqFsm_state_can_overlap
  reg adcCore0_iseqFsm_state_can_overlap;
  wire adcCore0_iseqFsm_state_can_overlap$D_IN,
       adcCore0_iseqFsm_state_can_overlap$EN;
  // register adcCore0_iseqFsm_state_fired
  reg adcCore0_iseqFsm_state_fired;
  wire adcCore0_iseqFsm_state_fired$D_IN, adcCore0_iseqFsm_state_fired$EN;
  // register adcCore0_iseqFsm_state_mkFSMstate
  reg [3 : 0] adcCore0_iseqFsm_state_mkFSMstate;
  reg [3 : 0] adcCore0_iseqFsm_state_mkFSMstate$D_IN;
  wire adcCore0_iseqFsm_state_mkFSMstate$EN;
  // register adcCore0_operateDReg
  reg adcCore0_operateDReg;
  wire adcCore0_operateDReg$D_IN, adcCore0_operateDReg$EN;
  // register adcCore0_readMode
  reg adcCore0_readMode;
  wire adcCore0_readMode$D_IN, adcCore0_readMode$EN;
  // register adcCore0_samp
  reg [31 : 0] adcCore0_samp;
  wire [31 : 0] adcCore0_samp$D_IN;
  wire adcCore0_samp$EN;
  // register adcCore0_sampF_rRdPtr_rdCounter
  reg [10 : 0] adcCore0_sampF_rRdPtr_rdCounter;
  wire [10 : 0] adcCore0_sampF_rRdPtr_rdCounter$D_IN;
  wire adcCore0_sampF_rRdPtr_rdCounter$EN;
  // register adcCore0_sampF_rRdPtr_rdCounterPre
  reg [10 : 0] adcCore0_sampF_rRdPtr_rdCounterPre;
  wire [10 : 0] adcCore0_sampF_rRdPtr_rdCounterPre$D_IN;
  wire adcCore0_sampF_rRdPtr_rdCounterPre$EN;
  // register adcCore0_sampF_rRdPtr_rsCounter
  reg [10 : 0] adcCore0_sampF_rRdPtr_rsCounter;
  wire [10 : 0] adcCore0_sampF_rRdPtr_rsCounter$D_IN;
  wire adcCore0_sampF_rRdPtr_rsCounter$EN;
  // register adcCore0_sampF_rWrPtr_rdCounter
  reg [10 : 0] adcCore0_sampF_rWrPtr_rdCounter;
  wire [10 : 0] adcCore0_sampF_rWrPtr_rdCounter$D_IN;
  wire adcCore0_sampF_rWrPtr_rdCounter$EN;
  // register adcCore0_sampF_rWrPtr_rdCounterPre
  reg [10 : 0] adcCore0_sampF_rWrPtr_rdCounterPre;
  wire [10 : 0] adcCore0_sampF_rWrPtr_rdCounterPre$D_IN;
  wire adcCore0_sampF_rWrPtr_rdCounterPre$EN;
  // register adcCore0_sampF_rWrPtr_rsCounter
  reg [10 : 0] adcCore0_sampF_rWrPtr_rsCounter;
  wire [10 : 0] adcCore0_sampF_rWrPtr_rsCounter$D_IN;
  wire adcCore0_sampF_rWrPtr_rsCounter$EN;
  // register adcCore0_spiI_cGate
  reg adcCore0_spiI_cGate;
  wire adcCore0_spiI_cGate$D_IN, adcCore0_spiI_cGate$EN;
  // register adcCore0_spiI_cap
  reg adcCore0_spiI_cap;
  wire adcCore0_spiI_cap$D_IN, adcCore0_spiI_cap$EN;
  // register adcCore0_spiI_cap_1
  reg adcCore0_spiI_cap_1;
  wire adcCore0_spiI_cap_1$D_IN, adcCore0_spiI_cap_1$EN;
  // register adcCore0_spiI_cap_2
  reg adcCore0_spiI_cap_2;
  wire adcCore0_spiI_cap_2$D_IN, adcCore0_spiI_cap_2$EN;
  // register adcCore0_spiI_cap_3
  reg adcCore0_spiI_cap_3;
  wire adcCore0_spiI_cap_3$D_IN, adcCore0_spiI_cap_3$EN;
  // register adcCore0_spiI_cap_4
  reg adcCore0_spiI_cap_4;
  wire adcCore0_spiI_cap_4$D_IN, adcCore0_spiI_cap_4$EN;
  // register adcCore0_spiI_cap_5
  reg adcCore0_spiI_cap_5;
  wire adcCore0_spiI_cap_5$D_IN, adcCore0_spiI_cap_5$EN;
  // register adcCore0_spiI_cap_6
  reg adcCore0_spiI_cap_6;
  wire adcCore0_spiI_cap_6$D_IN, adcCore0_spiI_cap_6$EN;
  // register adcCore0_spiI_cap_7
  reg adcCore0_spiI_cap_7;
  wire adcCore0_spiI_cap_7$D_IN, adcCore0_spiI_cap_7$EN;
  // register adcCore0_spiI_csbR
  reg adcCore0_spiI_csbR;
  wire adcCore0_spiI_csbR$D_IN, adcCore0_spiI_csbR$EN;
  // register adcCore0_spiI_dPos
  reg [2 : 0] adcCore0_spiI_dPos;
  wire [2 : 0] adcCore0_spiI_dPos$D_IN;
  wire adcCore0_spiI_dPos$EN;
  // register adcCore0_spiI_doResp
  reg adcCore0_spiI_doResp;
  wire adcCore0_spiI_doResp$D_IN, adcCore0_spiI_doResp$EN;
  // register adcCore0_spiI_iPos
  reg [3 : 0] adcCore0_spiI_iPos;
  wire [3 : 0] adcCore0_spiI_iPos$D_IN;
  wire adcCore0_spiI_iPos$EN;
  // register adcCore0_spiI_reqF_head_wrapped
  reg adcCore0_spiI_reqF_head_wrapped;
  wire adcCore0_spiI_reqF_head_wrapped$D_IN,
       adcCore0_spiI_reqF_head_wrapped$EN;
  // register adcCore0_spiI_reqF_tail_wrapped
  reg adcCore0_spiI_reqF_tail_wrapped;
  wire adcCore0_spiI_reqF_tail_wrapped$D_IN,
       adcCore0_spiI_reqF_tail_wrapped$EN;
  // register adcCore0_spiI_reqS
  reg [16 : 0] adcCore0_spiI_reqS;
  reg [16 : 0] adcCore0_spiI_reqS$D_IN;
  wire adcCore0_spiI_reqS$EN;
  // register adcCore0_spiI_respF_head_wrapped
  reg adcCore0_spiI_respF_head_wrapped;
  wire adcCore0_spiI_respF_head_wrapped$D_IN,
       adcCore0_spiI_respF_head_wrapped$EN;
  // register adcCore0_spiI_respF_tail_wrapped
  reg adcCore0_spiI_respF_tail_wrapped;
  wire adcCore0_spiI_respF_tail_wrapped$D_IN,
       adcCore0_spiI_respF_tail_wrapped$EN;
  // register adcCore0_spiI_respS
  reg [7 : 0] adcCore0_spiI_respS;
  wire [7 : 0] adcCore0_spiI_respS$D_IN;
  wire adcCore0_spiI_respS$EN;
  // register adcCore0_spiI_sdiP
  reg adcCore0_spiI_sdiP;
  wire adcCore0_spiI_sdiP$D_IN, adcCore0_spiI_sdiP$EN;
  // register adcCore0_spiI_sdoR
  reg adcCore0_spiI_sdoR;
  wire adcCore0_spiI_sdoR$D_IN, adcCore0_spiI_sdoR$EN;
  // register adcCore0_spiI_xmt_d
  reg adcCore0_spiI_xmt_d;
  wire adcCore0_spiI_xmt_d$D_IN, adcCore0_spiI_xmt_d$EN;
  // register adcCore0_spiI_xmt_i
  reg adcCore0_spiI_xmt_i;
  wire adcCore0_spiI_xmt_i$D_IN, adcCore0_spiI_xmt_i$EN;
  // register adcCore1_acquireDReg
  reg adcCore1_acquireDReg;
  wire adcCore1_acquireDReg$D_IN, adcCore1_acquireDReg$EN;
  // register adcCore1_adcRst
  reg adcCore1_adcRst;
  wire adcCore1_adcRst$D_IN, adcCore1_adcRst$EN;
  // register adcCore1_averageDReg
  reg adcCore1_averageDReg;
  wire adcCore1_averageDReg$D_IN, adcCore1_averageDReg$EN;
  // register adcCore1_colGate_avgEven
  reg [17 : 0] adcCore1_colGate_avgEven;
  wire [17 : 0] adcCore1_colGate_avgEven$D_IN;
  wire adcCore1_colGate_avgEven$EN;
  // register adcCore1_colGate_avgOdd
  reg [17 : 0] adcCore1_colGate_avgOdd;
  wire [17 : 0] adcCore1_colGate_avgOdd$D_IN;
  wire adcCore1_colGate_avgOdd$EN;
  // register adcCore1_colGate_avgPhase
  reg [1 : 0] adcCore1_colGate_avgPhase;
  wire [1 : 0] adcCore1_colGate_avgPhase$D_IN;
  wire adcCore1_colGate_avgPhase$EN;
  // register adcCore1_colGate_collectD
  reg adcCore1_colGate_collectD;
  wire adcCore1_colGate_collectD$D_IN, adcCore1_colGate_collectD$EN;
  // register adcCore1_colGate_dropCount
  reg [31 : 0] adcCore1_colGate_dropCount;
  wire [31 : 0] adcCore1_colGate_dropCount$D_IN;
  wire adcCore1_colGate_dropCount$EN;
  // register adcCore1_colGate_dwellFails
  reg [31 : 0] adcCore1_colGate_dwellFails;
  wire [31 : 0] adcCore1_colGate_dwellFails$D_IN;
  wire adcCore1_colGate_dwellFails$EN;
  // register adcCore1_colGate_dwellStarts
  reg [31 : 0] adcCore1_colGate_dwellStarts;
  wire [31 : 0] adcCore1_colGate_dwellStarts$D_IN;
  wire adcCore1_colGate_dwellStarts$EN;
  // register adcCore1_colGate_ovrRecover
  reg [3 : 0] adcCore1_colGate_ovrRecover;
  reg [3 : 0] adcCore1_colGate_ovrRecover$D_IN;
  wire adcCore1_colGate_ovrRecover$EN;
  // register adcCore1_colGate_sampActive
  reg adcCore1_colGate_sampActive;
  wire adcCore1_colGate_sampActive$D_IN, adcCore1_colGate_sampActive$EN;
  // register adcCore1_colGate_sampActiveD
  reg adcCore1_colGate_sampActiveD;
  wire adcCore1_colGate_sampActiveD$D_IN, adcCore1_colGate_sampActiveD$EN;
  // register adcCore1_colGate_sampCount
  reg [31 : 0] adcCore1_colGate_sampCount;
  wire [31 : 0] adcCore1_colGate_sampCount$D_IN;
  wire adcCore1_colGate_sampCount$EN;
  // register adcCore1_colGate_sampDataWD
  reg [31 : 0] adcCore1_colGate_sampDataWD;
  wire [31 : 0] adcCore1_colGate_sampDataWD$D_IN;
  wire adcCore1_colGate_sampDataWD$EN;
  // register adcCore1_colGate_syncMesg
  reg [1 : 0] adcCore1_colGate_syncMesg;
  wire [1 : 0] adcCore1_colGate_syncMesg$D_IN;
  wire adcCore1_colGate_syncMesg$EN;
  // register adcCore1_colGate_timeMesg
  reg [2 : 0] adcCore1_colGate_timeMesg;
  wire [2 : 0] adcCore1_colGate_timeMesg$D_IN;
  wire adcCore1_colGate_timeMesg$EN;
  // register adcCore1_colGate_uprollCnt
  reg [15 : 0] adcCore1_colGate_uprollCnt;
  wire [15 : 0] adcCore1_colGate_uprollCnt$D_IN;
  wire adcCore1_colGate_uprollCnt$EN;
  // register adcCore1_ddrC_psCmdReg
  reg [1 : 0] adcCore1_ddrC_psCmdReg;
  wire [1 : 0] adcCore1_ddrC_psCmdReg$D_IN;
  wire adcCore1_ddrC_psCmdReg$EN;
  // register adcCore1_iseqFsm_jj_delay_count
  reg [12 : 0] adcCore1_iseqFsm_jj_delay_count;
  wire [12 : 0] adcCore1_iseqFsm_jj_delay_count$D_IN;
  wire adcCore1_iseqFsm_jj_delay_count$EN;
  // register adcCore1_iseqFsm_start_reg
  reg adcCore1_iseqFsm_start_reg;
  wire adcCore1_iseqFsm_start_reg$D_IN, adcCore1_iseqFsm_start_reg$EN;
  // register adcCore1_iseqFsm_start_reg_1
  reg adcCore1_iseqFsm_start_reg_1;
  wire adcCore1_iseqFsm_start_reg_1$D_IN, adcCore1_iseqFsm_start_reg_1$EN;
  // register adcCore1_iseqFsm_state_can_overlap
  reg adcCore1_iseqFsm_state_can_overlap;
  wire adcCore1_iseqFsm_state_can_overlap$D_IN,
       adcCore1_iseqFsm_state_can_overlap$EN;
  // register adcCore1_iseqFsm_state_fired
  reg adcCore1_iseqFsm_state_fired;
  wire adcCore1_iseqFsm_state_fired$D_IN, adcCore1_iseqFsm_state_fired$EN;
  // register adcCore1_iseqFsm_state_mkFSMstate
  reg [3 : 0] adcCore1_iseqFsm_state_mkFSMstate;
  reg [3 : 0] adcCore1_iseqFsm_state_mkFSMstate$D_IN;
  wire adcCore1_iseqFsm_state_mkFSMstate$EN;
  // register adcCore1_operateDReg
  reg adcCore1_operateDReg;
  wire adcCore1_operateDReg$D_IN, adcCore1_operateDReg$EN;
  // register adcCore1_readMode
  reg adcCore1_readMode;
  wire adcCore1_readMode$D_IN, adcCore1_readMode$EN;
  // register adcCore1_samp
  reg [31 : 0] adcCore1_samp;
  wire [31 : 0] adcCore1_samp$D_IN;
  wire adcCore1_samp$EN;
  // register adcCore1_sampF_rRdPtr_rdCounter
  reg [10 : 0] adcCore1_sampF_rRdPtr_rdCounter;
  wire [10 : 0] adcCore1_sampF_rRdPtr_rdCounter$D_IN;
  wire adcCore1_sampF_rRdPtr_rdCounter$EN;
  // register adcCore1_sampF_rRdPtr_rdCounterPre
  reg [10 : 0] adcCore1_sampF_rRdPtr_rdCounterPre;
  wire [10 : 0] adcCore1_sampF_rRdPtr_rdCounterPre$D_IN;
  wire adcCore1_sampF_rRdPtr_rdCounterPre$EN;
  // register adcCore1_sampF_rRdPtr_rsCounter
  reg [10 : 0] adcCore1_sampF_rRdPtr_rsCounter;
  wire [10 : 0] adcCore1_sampF_rRdPtr_rsCounter$D_IN;
  wire adcCore1_sampF_rRdPtr_rsCounter$EN;
  // register adcCore1_sampF_rWrPtr_rdCounter
  reg [10 : 0] adcCore1_sampF_rWrPtr_rdCounter;
  wire [10 : 0] adcCore1_sampF_rWrPtr_rdCounter$D_IN;
  wire adcCore1_sampF_rWrPtr_rdCounter$EN;
  // register adcCore1_sampF_rWrPtr_rdCounterPre
  reg [10 : 0] adcCore1_sampF_rWrPtr_rdCounterPre;
  wire [10 : 0] adcCore1_sampF_rWrPtr_rdCounterPre$D_IN;
  wire adcCore1_sampF_rWrPtr_rdCounterPre$EN;
  // register adcCore1_sampF_rWrPtr_rsCounter
  reg [10 : 0] adcCore1_sampF_rWrPtr_rsCounter;
  wire [10 : 0] adcCore1_sampF_rWrPtr_rsCounter$D_IN;
  wire adcCore1_sampF_rWrPtr_rsCounter$EN;
  // register adcCore1_spiI_cGate
  reg adcCore1_spiI_cGate;
  wire adcCore1_spiI_cGate$D_IN, adcCore1_spiI_cGate$EN;
  // register adcCore1_spiI_cap
  reg adcCore1_spiI_cap;
  wire adcCore1_spiI_cap$D_IN, adcCore1_spiI_cap$EN;
  // register adcCore1_spiI_cap_1
  reg adcCore1_spiI_cap_1;
  wire adcCore1_spiI_cap_1$D_IN, adcCore1_spiI_cap_1$EN;
  // register adcCore1_spiI_cap_2
  reg adcCore1_spiI_cap_2;
  wire adcCore1_spiI_cap_2$D_IN, adcCore1_spiI_cap_2$EN;
  // register adcCore1_spiI_cap_3
  reg adcCore1_spiI_cap_3;
  wire adcCore1_spiI_cap_3$D_IN, adcCore1_spiI_cap_3$EN;
  // register adcCore1_spiI_cap_4
  reg adcCore1_spiI_cap_4;
  wire adcCore1_spiI_cap_4$D_IN, adcCore1_spiI_cap_4$EN;
  // register adcCore1_spiI_cap_5
  reg adcCore1_spiI_cap_5;
  wire adcCore1_spiI_cap_5$D_IN, adcCore1_spiI_cap_5$EN;
  // register adcCore1_spiI_cap_6
  reg adcCore1_spiI_cap_6;
  wire adcCore1_spiI_cap_6$D_IN, adcCore1_spiI_cap_6$EN;
  // register adcCore1_spiI_cap_7
  reg adcCore1_spiI_cap_7;
  wire adcCore1_spiI_cap_7$D_IN, adcCore1_spiI_cap_7$EN;
  // register adcCore1_spiI_csbR
  reg adcCore1_spiI_csbR;
  wire adcCore1_spiI_csbR$D_IN, adcCore1_spiI_csbR$EN;
  // register adcCore1_spiI_dPos
  reg [2 : 0] adcCore1_spiI_dPos;
  wire [2 : 0] adcCore1_spiI_dPos$D_IN;
  wire adcCore1_spiI_dPos$EN;
  // register adcCore1_spiI_doResp
  reg adcCore1_spiI_doResp;
  wire adcCore1_spiI_doResp$D_IN, adcCore1_spiI_doResp$EN;
  // register adcCore1_spiI_iPos
  reg [3 : 0] adcCore1_spiI_iPos;
  wire [3 : 0] adcCore1_spiI_iPos$D_IN;
  wire adcCore1_spiI_iPos$EN;
  // register adcCore1_spiI_reqF_head_wrapped
  reg adcCore1_spiI_reqF_head_wrapped;
  wire adcCore1_spiI_reqF_head_wrapped$D_IN,
       adcCore1_spiI_reqF_head_wrapped$EN;
  // register adcCore1_spiI_reqF_tail_wrapped
  reg adcCore1_spiI_reqF_tail_wrapped;
  wire adcCore1_spiI_reqF_tail_wrapped$D_IN,
       adcCore1_spiI_reqF_tail_wrapped$EN;
  // register adcCore1_spiI_reqS
  reg [16 : 0] adcCore1_spiI_reqS;
  reg [16 : 0] adcCore1_spiI_reqS$D_IN;
  wire adcCore1_spiI_reqS$EN;
  // register adcCore1_spiI_respF_head_wrapped
  reg adcCore1_spiI_respF_head_wrapped;
  wire adcCore1_spiI_respF_head_wrapped$D_IN,
       adcCore1_spiI_respF_head_wrapped$EN;
  // register adcCore1_spiI_respF_tail_wrapped
  reg adcCore1_spiI_respF_tail_wrapped;
  wire adcCore1_spiI_respF_tail_wrapped$D_IN,
       adcCore1_spiI_respF_tail_wrapped$EN;
  // register adcCore1_spiI_respS
  reg [7 : 0] adcCore1_spiI_respS;
  wire [7 : 0] adcCore1_spiI_respS$D_IN;
  wire adcCore1_spiI_respS$EN;
  // register adcCore1_spiI_sdiP
  reg adcCore1_spiI_sdiP;
  wire adcCore1_spiI_sdiP$D_IN, adcCore1_spiI_sdiP$EN;
  // register adcCore1_spiI_sdoR
  reg adcCore1_spiI_sdoR;
  wire adcCore1_spiI_sdoR$D_IN, adcCore1_spiI_sdoR$EN;
  // register adcCore1_spiI_xmt_d
  reg adcCore1_spiI_xmt_d;
  wire adcCore1_spiI_xmt_d$D_IN, adcCore1_spiI_xmt_d$EN;
  // register adcCore1_spiI_xmt_i
  reg adcCore1_spiI_xmt_i;
  wire adcCore1_spiI_xmt_i$D_IN, adcCore1_spiI_xmt_i$EN;
  // register adcIdc_doResetCount
  reg [3 : 0] adcIdc_doResetCount;
  wire [3 : 0] adcIdc_doResetCount$D_IN;
  wire adcIdc_doResetCount$EN;
  // register adcIdc_preResetCount
  reg [3 : 0] adcIdc_preResetCount;
  wire [3 : 0] adcIdc_preResetCount$D_IN;
  wire adcIdc_preResetCount$EN;
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
  // register spiClk_iState
  reg [3 : 0] spiClk_iState;
  wire [3 : 0] spiClk_iState$D_IN;
  wire spiClk_iState$EN;
  // register spiClk_iseqFsm_start_reg
  reg spiClk_iseqFsm_start_reg;
  wire spiClk_iseqFsm_start_reg$D_IN, spiClk_iseqFsm_start_reg$EN;
  // register spiClk_iseqFsm_start_reg_1
  reg spiClk_iseqFsm_start_reg_1;
  wire spiClk_iseqFsm_start_reg_1$D_IN, spiClk_iseqFsm_start_reg_1$EN;
  // register spiClk_iseqFsm_state_can_overlap
  reg spiClk_iseqFsm_state_can_overlap;
  wire spiClk_iseqFsm_state_can_overlap$D_IN,
       spiClk_iseqFsm_state_can_overlap$EN;
  // register spiClk_iseqFsm_state_fired
  reg spiClk_iseqFsm_state_fired;
  wire spiClk_iseqFsm_state_fired$D_IN, spiClk_iseqFsm_state_fired$EN;
  // register spiClk_iseqFsm_state_mkFSMstate
  reg [3 : 0] spiClk_iseqFsm_state_mkFSMstate;
  reg [3 : 0] spiClk_iseqFsm_state_mkFSMstate$D_IN;
  wire spiClk_iseqFsm_state_mkFSMstate$EN;
  // register spiClk_spiI_cGate
  reg spiClk_spiI_cGate;
  wire spiClk_spiI_cGate$D_IN, spiClk_spiI_cGate$EN;
  // register spiClk_spiI_cap
  reg spiClk_spiI_cap;
  wire spiClk_spiI_cap$D_IN, spiClk_spiI_cap$EN;
  // register spiClk_spiI_cap_1
  reg spiClk_spiI_cap_1;
  wire spiClk_spiI_cap_1$D_IN, spiClk_spiI_cap_1$EN;
  // register spiClk_spiI_cap_2
  reg spiClk_spiI_cap_2;
  wire spiClk_spiI_cap_2$D_IN, spiClk_spiI_cap_2$EN;
  // register spiClk_spiI_cap_3
  reg spiClk_spiI_cap_3;
  wire spiClk_spiI_cap_3$D_IN, spiClk_spiI_cap_3$EN;
  // register spiClk_spiI_cap_4
  reg spiClk_spiI_cap_4;
  wire spiClk_spiI_cap_4$D_IN, spiClk_spiI_cap_4$EN;
  // register spiClk_spiI_cap_5
  reg spiClk_spiI_cap_5;
  wire spiClk_spiI_cap_5$D_IN, spiClk_spiI_cap_5$EN;
  // register spiClk_spiI_cap_6
  reg spiClk_spiI_cap_6;
  wire spiClk_spiI_cap_6$D_IN, spiClk_spiI_cap_6$EN;
  // register spiClk_spiI_cap_7
  reg spiClk_spiI_cap_7;
  wire spiClk_spiI_cap_7$D_IN, spiClk_spiI_cap_7$EN;
  // register spiClk_spiI_csbR
  reg spiClk_spiI_csbR;
  wire spiClk_spiI_csbR$D_IN, spiClk_spiI_csbR$EN;
  // register spiClk_spiI_dPos
  reg [2 : 0] spiClk_spiI_dPos;
  wire [2 : 0] spiClk_spiI_dPos$D_IN;
  wire spiClk_spiI_dPos$EN;
  // register spiClk_spiI_doResp
  reg spiClk_spiI_doResp;
  wire spiClk_spiI_doResp$D_IN, spiClk_spiI_doResp$EN;
  // register spiClk_spiI_iPos
  reg [3 : 0] spiClk_spiI_iPos;
  wire [3 : 0] spiClk_spiI_iPos$D_IN;
  wire spiClk_spiI_iPos$EN;
  // register spiClk_spiI_reqF_head_wrapped
  reg spiClk_spiI_reqF_head_wrapped;
  wire spiClk_spiI_reqF_head_wrapped$D_IN, spiClk_spiI_reqF_head_wrapped$EN;
  // register spiClk_spiI_reqF_tail_wrapped
  reg spiClk_spiI_reqF_tail_wrapped;
  wire spiClk_spiI_reqF_tail_wrapped$D_IN, spiClk_spiI_reqF_tail_wrapped$EN;
  // register spiClk_spiI_reqS
  reg [16 : 0] spiClk_spiI_reqS;
  reg [16 : 0] spiClk_spiI_reqS$D_IN;
  wire spiClk_spiI_reqS$EN;
  // register spiClk_spiI_respF_head_wrapped
  reg spiClk_spiI_respF_head_wrapped;
  wire spiClk_spiI_respF_head_wrapped$D_IN, spiClk_spiI_respF_head_wrapped$EN;
  // register spiClk_spiI_respF_tail_wrapped
  reg spiClk_spiI_respF_tail_wrapped;
  wire spiClk_spiI_respF_tail_wrapped$D_IN, spiClk_spiI_respF_tail_wrapped$EN;
  // register spiClk_spiI_respS
  reg [7 : 0] spiClk_spiI_respS;
  wire [7 : 0] spiClk_spiI_respS$D_IN;
  wire spiClk_spiI_respS$EN;
  // register spiClk_spiI_sdiP
  reg spiClk_spiI_sdiP;
  wire spiClk_spiI_sdiP$D_IN, spiClk_spiI_sdiP$EN;
  // register spiClk_spiI_sdoR
  reg spiClk_spiI_sdoR;
  wire spiClk_spiI_sdoR$D_IN, spiClk_spiI_sdoR$EN;
  // register spiClk_spiI_xmt_d
  reg spiClk_spiI_xmt_d;
  wire spiClk_spiI_xmt_d$D_IN, spiClk_spiI_xmt_d$EN;
  // register spiClk_spiI_xmt_i
  reg spiClk_spiI_xmt_i;
  wire spiClk_spiI_xmt_i$D_IN, spiClk_spiI_xmt_i$EN;
  // register spiResp
  reg [7 : 0] spiResp;
  reg [7 : 0] spiResp$D_IN;
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
  // ports of submodule adcCore0_acquireD
  wire adcCore0_acquireD$dD_OUT,
       adcCore0_acquireD$sD_IN,
       adcCore0_acquireD$sEN,
       adcCore0_acquireD$sRDY;
  // ports of submodule adcCore0_averageD
  wire adcCore0_averageD$dD_OUT,
       adcCore0_averageD$sD_IN,
       adcCore0_averageD$sEN,
       adcCore0_averageD$sRDY;
  // ports of submodule adcCore0_colGate_sampF
  reg [38 : 0] adcCore0_colGate_sampF$D_IN;
  wire [38 : 0] adcCore0_colGate_sampF$D_OUT;
  wire adcCore0_colGate_sampF$CLR,
       adcCore0_colGate_sampF$DEQ,
       adcCore0_colGate_sampF$EMPTY_N,
       adcCore0_colGate_sampF$ENQ,
       adcCore0_colGate_sampF$FULL_N;
  // ports of submodule adcCore0_ddrC_ddrV
  wire [13 : 0] adcCore0_ddrC_ddrV$sdrData0, adcCore0_ddrC_ddrV$sdrData1;
  wire [6 : 0] adcCore0_ddrC_ddrV$ddrDataN, adcCore0_ddrC_ddrV$ddrDataP;
  wire adcCore0_ddrC_ddrV$psEna,
       adcCore0_ddrC_ddrV$psInc,
       adcCore0_ddrC_ddrV$sdrClk;
  // ports of submodule adcCore0_maxBurstLengthR
  wire [15 : 0] adcCore0_maxBurstLengthR$dD_OUT,
		adcCore0_maxBurstLengthR$sD_IN;
  wire adcCore0_maxBurstLengthR$sEN, adcCore0_maxBurstLengthR$sRDY;
  // ports of submodule adcCore0_operateD
  wire adcCore0_operateD$dD_OUT,
       adcCore0_operateD$sD_IN,
       adcCore0_operateD$sEN,
       adcCore0_operateD$sRDY;
  // ports of submodule adcCore0_reqF
  wire [16 : 0] adcCore0_reqF$D_IN, adcCore0_reqF$D_OUT;
  wire adcCore0_reqF$CLR,
       adcCore0_reqF$DEQ,
       adcCore0_reqF$EMPTY_N,
       adcCore0_reqF$ENQ,
       adcCore0_reqF$FULL_N;
  // ports of submodule adcCore0_sampCC
  wire [31 : 0] adcCore0_sampCC$dD_OUT, adcCore0_sampCC$sD_IN;
  wire adcCore0_sampCC$sEN, adcCore0_sampCC$sRDY;
  // ports of submodule adcCore0_sampF_memory
  wire [38 : 0] adcCore0_sampF_memory$DIA,
		adcCore0_sampF_memory$DIB,
		adcCore0_sampF_memory$DOB;
  wire [9 : 0] adcCore0_sampF_memory$ADDRA, adcCore0_sampF_memory$ADDRB;
  wire adcCore0_sampF_memory$ENA,
       adcCore0_sampF_memory$ENB,
       adcCore0_sampF_memory$WEA,
       adcCore0_sampF_memory$WEB;
  // ports of submodule adcCore0_sdrRst
  wire adcCore0_sdrRst$OUT_RST;
  // ports of submodule adcCore0_spiI_cd
  wire adcCore0_spiI_cd$CLK_OUT, adcCore0_spiI_cd$PREEDGE;
  // ports of submodule adcCore0_spiI_cinv
  wire adcCore0_spiI_cinv$CLK_OUT;
  // ports of submodule adcCore0_spiI_reqF_dCombinedReset
  wire adcCore0_spiI_reqF_dCombinedReset$RST_OUT;
  // ports of submodule adcCore0_spiI_reqF_dCrossedsReset
  wire adcCore0_spiI_reqF_dCrossedsReset$OUT_RST;
  // ports of submodule adcCore0_spiI_reqF_dInReset
  wire adcCore0_spiI_reqF_dInReset$VAL;
  // ports of submodule adcCore0_spiI_reqF_sCombinedReset
  wire adcCore0_spiI_reqF_sCombinedReset$RST_OUT;
  // ports of submodule adcCore0_spiI_reqF_sCrosseddReset
  wire adcCore0_spiI_reqF_sCrosseddReset$OUT_RST;
  // ports of submodule adcCore0_spiI_reqF_sInReset
  wire adcCore0_spiI_reqF_sInReset$VAL;
  // ports of submodule adcCore0_spiI_respF_dCombinedReset
  wire adcCore0_spiI_respF_dCombinedReset$RST_OUT;
  // ports of submodule adcCore0_spiI_respF_dCrossedsReset
  wire adcCore0_spiI_respF_dCrossedsReset$OUT_RST;
  // ports of submodule adcCore0_spiI_respF_dInReset
  wire adcCore0_spiI_respF_dInReset$VAL;
  // ports of submodule adcCore0_spiI_respF_sCombinedReset
  wire adcCore0_spiI_respF_sCombinedReset$RST_OUT;
  // ports of submodule adcCore0_spiI_respF_sCrosseddReset
  wire adcCore0_spiI_respF_sCrosseddReset$OUT_RST;
  // ports of submodule adcCore0_spiI_respF_sInReset
  wire adcCore0_spiI_respF_sInReset$VAL;
  // ports of submodule adcCore0_spiI_slowReset
  wire adcCore0_spiI_slowReset$OUT_RST;
  // ports of submodule adcCore0_statsCC
  wire [127 : 0] adcCore0_statsCC$dD_OUT, adcCore0_statsCC$sD_IN;
  wire adcCore0_statsCC$sEN, adcCore0_statsCC$sRDY;
  // ports of submodule adcCore1_acquireD
  wire adcCore1_acquireD$dD_OUT,
       adcCore1_acquireD$sD_IN,
       adcCore1_acquireD$sEN,
       adcCore1_acquireD$sRDY;
  // ports of submodule adcCore1_averageD
  wire adcCore1_averageD$dD_OUT,
       adcCore1_averageD$sD_IN,
       adcCore1_averageD$sEN,
       adcCore1_averageD$sRDY;
  // ports of submodule adcCore1_colGate_sampF
  reg [38 : 0] adcCore1_colGate_sampF$D_IN;
  wire [38 : 0] adcCore1_colGate_sampF$D_OUT;
  wire adcCore1_colGate_sampF$CLR,
       adcCore1_colGate_sampF$DEQ,
       adcCore1_colGate_sampF$EMPTY_N,
       adcCore1_colGate_sampF$ENQ,
       adcCore1_colGate_sampF$FULL_N;
  // ports of submodule adcCore1_ddrC_ddrV
  wire [13 : 0] adcCore1_ddrC_ddrV$sdrData0, adcCore1_ddrC_ddrV$sdrData1;
  wire [6 : 0] adcCore1_ddrC_ddrV$ddrDataN, adcCore1_ddrC_ddrV$ddrDataP;
  wire adcCore1_ddrC_ddrV$psEna,
       adcCore1_ddrC_ddrV$psInc,
       adcCore1_ddrC_ddrV$sdrClk;
  // ports of submodule adcCore1_maxBurstLengthR
  wire [15 : 0] adcCore1_maxBurstLengthR$dD_OUT,
		adcCore1_maxBurstLengthR$sD_IN;
  wire adcCore1_maxBurstLengthR$sEN;
  // ports of submodule adcCore1_operateD
  wire adcCore1_operateD$dD_OUT,
       adcCore1_operateD$sD_IN,
       adcCore1_operateD$sEN,
       adcCore1_operateD$sRDY;
  // ports of submodule adcCore1_reqF
  wire [16 : 0] adcCore1_reqF$D_IN, adcCore1_reqF$D_OUT;
  wire adcCore1_reqF$CLR,
       adcCore1_reqF$DEQ,
       adcCore1_reqF$EMPTY_N,
       adcCore1_reqF$ENQ,
       adcCore1_reqF$FULL_N;
  // ports of submodule adcCore1_sampCC
  wire [31 : 0] adcCore1_sampCC$dD_OUT, adcCore1_sampCC$sD_IN;
  wire adcCore1_sampCC$sEN, adcCore1_sampCC$sRDY;
  // ports of submodule adcCore1_sampF_memory
  wire [38 : 0] adcCore1_sampF_memory$DIA,
		adcCore1_sampF_memory$DIB,
		adcCore1_sampF_memory$DOB;
  wire [9 : 0] adcCore1_sampF_memory$ADDRA, adcCore1_sampF_memory$ADDRB;
  wire adcCore1_sampF_memory$ENA,
       adcCore1_sampF_memory$ENB,
       adcCore1_sampF_memory$WEA,
       adcCore1_sampF_memory$WEB;
  // ports of submodule adcCore1_sdrRst
  wire adcCore1_sdrRst$OUT_RST;
  // ports of submodule adcCore1_spiI_cd
  wire adcCore1_spiI_cd$CLK_OUT, adcCore1_spiI_cd$PREEDGE;
  // ports of submodule adcCore1_spiI_cinv
  wire adcCore1_spiI_cinv$CLK_OUT;
  // ports of submodule adcCore1_spiI_reqF_dCombinedReset
  wire adcCore1_spiI_reqF_dCombinedReset$RST_OUT;
  // ports of submodule adcCore1_spiI_reqF_dCrossedsReset
  wire adcCore1_spiI_reqF_dCrossedsReset$OUT_RST;
  // ports of submodule adcCore1_spiI_reqF_dInReset
  wire adcCore1_spiI_reqF_dInReset$VAL;
  // ports of submodule adcCore1_spiI_reqF_sCombinedReset
  wire adcCore1_spiI_reqF_sCombinedReset$RST_OUT;
  // ports of submodule adcCore1_spiI_reqF_sCrosseddReset
  wire adcCore1_spiI_reqF_sCrosseddReset$OUT_RST;
  // ports of submodule adcCore1_spiI_reqF_sInReset
  wire adcCore1_spiI_reqF_sInReset$VAL;
  // ports of submodule adcCore1_spiI_respF_dCombinedReset
  wire adcCore1_spiI_respF_dCombinedReset$RST_OUT;
  // ports of submodule adcCore1_spiI_respF_dCrossedsReset
  wire adcCore1_spiI_respF_dCrossedsReset$OUT_RST;
  // ports of submodule adcCore1_spiI_respF_dInReset
  wire adcCore1_spiI_respF_dInReset$VAL;
  // ports of submodule adcCore1_spiI_respF_sCombinedReset
  wire adcCore1_spiI_respF_sCombinedReset$RST_OUT;
  // ports of submodule adcCore1_spiI_respF_sCrosseddReset
  wire adcCore1_spiI_respF_sCrosseddReset$OUT_RST;
  // ports of submodule adcCore1_spiI_respF_sInReset
  wire adcCore1_spiI_respF_sInReset$VAL;
  // ports of submodule adcCore1_spiI_slowReset
  wire adcCore1_spiI_slowReset$OUT_RST;
  // ports of submodule adcCore1_statsCC
  wire [127 : 0] adcCore1_statsCC$sD_IN;
  wire adcCore1_statsCC$sEN, adcCore1_statsCC$sRDY;
  // ports of submodule adcIdc
  wire adcIdc$RDY;
  // ports of submodule adcIdcRdyBit
  wire adcIdcRdyBit$dD_OUT, adcIdcRdyBit$sD_IN, adcIdcRdyBit$sEN;
  // ports of submodule adcIdc_idcRst
  wire adcIdc_idcRst$ASSERT_IN, adcIdc_idcRst$OUT_RST;
  // ports of submodule adcIdc_resetP
  wire adcIdc_resetP$RESET_OUT;
  // ports of submodule fcAdc_testRst
  wire fcAdc_testRst$OUT_RST;
  // ports of submodule spiClk_spiI_cd
  wire spiClk_spiI_cd$CLK_OUT, spiClk_spiI_cd$PREEDGE;
  // ports of submodule spiClk_spiI_cinv
  wire spiClk_spiI_cinv$CLK_OUT;
  // ports of submodule spiClk_spiI_reqF_dCombinedReset
  wire spiClk_spiI_reqF_dCombinedReset$RST_OUT;
  // ports of submodule spiClk_spiI_reqF_dCrossedsReset
  wire spiClk_spiI_reqF_dCrossedsReset$OUT_RST;
  // ports of submodule spiClk_spiI_reqF_dInReset
  wire spiClk_spiI_reqF_dInReset$VAL;
  // ports of submodule spiClk_spiI_reqF_sCombinedReset
  wire spiClk_spiI_reqF_sCombinedReset$RST_OUT;
  // ports of submodule spiClk_spiI_reqF_sCrosseddReset
  wire spiClk_spiI_reqF_sCrosseddReset$OUT_RST;
  // ports of submodule spiClk_spiI_reqF_sInReset
  wire spiClk_spiI_reqF_sInReset$VAL;
  // ports of submodule spiClk_spiI_respF_dCombinedReset
  wire spiClk_spiI_respF_dCombinedReset$RST_OUT;
  // ports of submodule spiClk_spiI_respF_dCrossedsReset
  wire spiClk_spiI_respF_dCrossedsReset$OUT_RST;
  // ports of submodule spiClk_spiI_respF_dInReset
  wire spiClk_spiI_respF_dInReset$VAL;
  // ports of submodule spiClk_spiI_respF_sCombinedReset
  wire spiClk_spiI_respF_sCombinedReset$RST_OUT;
  // ports of submodule spiClk_spiI_respF_sCrosseddReset
  wire spiClk_spiI_respF_sCrosseddReset$OUT_RST;
  // ports of submodule spiClk_spiI_respF_sInReset
  wire spiClk_spiI_respF_sInReset$VAL;
  // ports of submodule spiClk_spiI_slowReset
  wire spiClk_spiI_slowReset$OUT_RST;
  // ports of submodule wci_wslv_reqF
  wire [71 : 0] wci_wslv_reqF$D_IN, wci_wslv_reqF$D_OUT;
  wire wci_wslv_reqF$CLR,
       wci_wslv_reqF$DEQ,
       wci_wslv_reqF$EMPTY_N,
       wci_wslv_reqF$ENQ;
  // rule scheduling signals
  wire CAN_FIRE_RL_get_adc0_resp,
       CAN_FIRE_RL_get_adc1_resp,
       CAN_FIRE_RL_get_adx_resp,
       CAN_FIRE_RL_wci_cfrd,
       WILL_FIRE_RL_adcCore0_advance_spi_request,
       WILL_FIRE_RL_adcCore0_colGate_capture_collect,
       WILL_FIRE_RL_adcCore0_colGate_count_dropped_samples,
       WILL_FIRE_RL_adcCore0_colGate_count_dwells,
       WILL_FIRE_RL_adcCore0_colGate_form_avg4_sample,
       WILL_FIRE_RL_adcCore0_colGate_overrun_recovery,
       WILL_FIRE_RL_adcCore0_colGate_send_sync_mesg,
       WILL_FIRE_RL_adcCore0_colGate_send_timestamp_mesg,
       WILL_FIRE_RL_adcCore0_iseqFsm_action_l116c12,
       WILL_FIRE_RL_adcCore0_iseqFsm_action_l119c9,
       WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9,
       WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9,
       WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9,
       WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9,
       WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9,
       WILL_FIRE_RL_adcCore0_iseqFsm_action_np,
       WILL_FIRE_RL_adcCore0_iseqFsm_fsm_start,
       WILL_FIRE_RL_adcCore0_iseqFsm_idle_l115c3,
       WILL_FIRE_RL_adcCore0_spiI_reqF_deq_update_head,
       WILL_FIRE_RL_adcCore0_spiI_reqF_enq_update_tail,
       WILL_FIRE_RL_adcCore0_spiI_respF_deq_update_head,
       WILL_FIRE_RL_adcCore0_spiI_respF_enq_update_tail,
       WILL_FIRE_RL_adcCore0_spiI_send_d,
       WILL_FIRE_RL_adcCore0_spiI_send_i,
       WILL_FIRE_RL_adcCore0_spiI_start_cs,
       WILL_FIRE_RL_adcCore1_advance_spi_request,
       WILL_FIRE_RL_adcCore1_colGate_capture_collect,
       WILL_FIRE_RL_adcCore1_colGate_count_dropped_samples,
       WILL_FIRE_RL_adcCore1_colGate_count_dwells,
       WILL_FIRE_RL_adcCore1_colGate_form_avg4_sample,
       WILL_FIRE_RL_adcCore1_colGate_overrun_recovery,
       WILL_FIRE_RL_adcCore1_colGate_send_sync_mesg,
       WILL_FIRE_RL_adcCore1_colGate_send_timestamp_mesg,
       WILL_FIRE_RL_adcCore1_iseqFsm_action_l116c12,
       WILL_FIRE_RL_adcCore1_iseqFsm_action_l119c9,
       WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9,
       WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9,
       WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9,
       WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9,
       WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9,
       WILL_FIRE_RL_adcCore1_iseqFsm_action_np,
       WILL_FIRE_RL_adcCore1_iseqFsm_fsm_start,
       WILL_FIRE_RL_adcCore1_iseqFsm_idle_l115c3,
       WILL_FIRE_RL_adcCore1_spiI_reqF_deq_update_head,
       WILL_FIRE_RL_adcCore1_spiI_reqF_enq_update_tail,
       WILL_FIRE_RL_adcCore1_spiI_respF_deq_update_head,
       WILL_FIRE_RL_adcCore1_spiI_respF_enq_update_tail,
       WILL_FIRE_RL_adcCore1_spiI_send_d,
       WILL_FIRE_RL_adcCore1_spiI_send_i,
       WILL_FIRE_RL_adcCore1_spiI_start_cs,
       WILL_FIRE_RL_doMessage,
       WILL_FIRE_RL_get_adc1_resp,
       WILL_FIRE_RL_init_complete_ok,
       WILL_FIRE_RL_spiClk_iseqFsm_action_l44c9,
       WILL_FIRE_RL_spiClk_iseqFsm_action_l45c9,
       WILL_FIRE_RL_spiClk_iseqFsm_action_l46c9,
       WILL_FIRE_RL_spiClk_iseqFsm_action_l47c9,
       WILL_FIRE_RL_spiClk_iseqFsm_action_l48c9,
       WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9,
       WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9,
       WILL_FIRE_RL_spiClk_iseqFsm_fsm_start,
       WILL_FIRE_RL_spiClk_iseqFsm_idle_l43c3,
       WILL_FIRE_RL_spiClk_spiI_reqF_deq_update_head,
       WILL_FIRE_RL_spiClk_spiI_reqF_enq_update_tail,
       WILL_FIRE_RL_spiClk_spiI_respF_deq_update_head,
       WILL_FIRE_RL_spiClk_spiI_respF_enq_update_tail,
       WILL_FIRE_RL_spiClk_spiI_send_d,
       WILL_FIRE_RL_spiClk_spiI_send_i,
       WILL_FIRE_RL_spiClk_spiI_start_cs,
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
		MUX_wsiM_reqFifo_q_1$write_1__VAL_1,
		MUX_wsiM_reqFifo_q_1$write_1__VAL_2;
  wire [38 : 0] MUX_adcCore0_colGate_sampF$enq_1__VAL_1,
		MUX_adcCore0_colGate_sampF$enq_1__VAL_2,
		MUX_adcCore0_colGate_sampF$enq_1__VAL_3,
		MUX_adcCore1_colGate_sampF$enq_1__VAL_1,
		MUX_adcCore1_colGate_sampF$enq_1__VAL_2,
		MUX_adcCore1_colGate_sampF$enq_1__VAL_3;
  wire [33 : 0] MUX_wci_wslv_respF_q_0$write_1__VAL_1,
		MUX_wci_wslv_respF_q_1$write_1__VAL_1,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_1,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_2,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_3,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_4,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_5;
  wire [31 : 0] MUX_adcCore0_colGate_dropCount$write_1__VAL_1,
		MUX_adcCore0_colGate_dwellFails$write_1__VAL_1,
		MUX_adcCore0_colGate_dwellStarts$write_1__VAL_1,
		MUX_adcCore0_colGate_sampCount$write_1__VAL_1,
		MUX_adcCore1_colGate_dropCount$write_1__VAL_1,
		MUX_adcCore1_colGate_dwellFails$write_1__VAL_1,
		MUX_adcCore1_colGate_dwellStarts$write_1__VAL_1,
		MUX_adcCore1_colGate_sampCount$write_1__VAL_1;
  wire [17 : 0] MUX_fcAdc_grayCounter_rsCounter$write_1__VAL_1,
		MUX_oneKHz_value$write_1__VAL_1;
  wire [16 : 0] MUX_adcCore0_reqF$enq_1__VAL_1,
		MUX_adcCore0_reqF$enq_1__VAL_2,
		MUX_adcCore0_spiI_reqS$write_1__VAL_1,
		MUX_adcCore1_spiI_reqS$write_1__VAL_1;
  wire [15 : 0] MUX_adcCore0_colGate_uprollCnt$write_1__VAL_2,
		MUX_adcCore1_colGate_uprollCnt$write_1__VAL_2;
  wire [12 : 0] MUX_adcCore0_iseqFsm_jj_delay_count$write_1__VAL_1,
		MUX_adcCore1_iseqFsm_jj_delay_count$write_1__VAL_1;
  wire [10 : 0] MUX_adcCore0_sampF_rRdPtr_rsCounter$write_1__VAL_1,
		MUX_adcCore0_sampF_rWrPtr_rsCounter$write_1__VAL_1,
		MUX_adcCore1_sampF_rWrPtr_rsCounter$write_1__VAL_1;
  wire [3 : 0] MUX_adcCore0_colGate_ovrRecover$write_1__VAL_2,
	       MUX_adcCore0_spiI_iPos$write_1__VAL_1,
	       MUX_adcCore1_colGate_ovrRecover$write_1__VAL_2,
	       MUX_adcCore1_spiI_iPos$write_1__VAL_1,
	       MUX_spiClk_spiI_iPos$write_1__VAL_1;
  wire [2 : 0] MUX_adcCore0_colGate_timeMesg$write_1__VAL_1,
	       MUX_adcCore0_spiI_dPos$write_1__VAL_1,
	       MUX_adcCore1_colGate_timeMesg$write_1__VAL_1,
	       MUX_adcCore1_spiI_dPos$write_1__VAL_1,
	       MUX_spiClk_spiI_dPos$write_1__VAL_1;
  wire [1 : 0] MUX_adcCore0_colGate_syncMesg$write_1__VAL_1,
	       MUX_adcCore1_colGate_syncMesg$write_1__VAL_1,
	       MUX_wci_wslv_respF_c_r$write_1__VAL_1,
	       MUX_wci_wslv_respF_c_r$write_1__VAL_2,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_1,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_2;
  wire MUX_adcCore0_colGate_dwellFails$write_1__SEL_1,
       MUX_adcCore0_colGate_sampF$enq_1__SEL_1,
       MUX_adcCore0_reqF$enq_1__SEL_1,
       MUX_adcCore0_spiI_sdoR_1$wset_1__VAL_1,
       MUX_adcCore0_spiI_sdoR_1$wset_1__VAL_2,
       MUX_adcCore0_spiI_xmt_d$write_1__SEL_2,
       MUX_adcCore1_colGate_dwellFails$write_1__SEL_1,
       MUX_adcCore1_colGate_sampF$enq_1__SEL_1,
       MUX_adcCore1_reqF$enq_1__SEL_1,
       MUX_adcCore1_spiI_sdoR_1$wset_1__VAL_1,
       MUX_adcCore1_spiI_sdoR_1$wset_1__VAL_2,
       MUX_adcCore1_spiI_xmt_d$write_1__SEL_2,
       MUX_spiClk_spiI_reqS$write_1__SEL_1,
       MUX_spiClk_spiI_reqS$write_1__SEL_2,
       MUX_spiClk_spiI_sdoR_1$wset_1__VAL_1,
       MUX_spiClk_spiI_sdoR_1$wset_1__VAL_2,
       MUX_spiClk_spiI_xmt_d$write_1__SEL_2,
       MUX_splitReadInFlight$write_1__PSEL_1,
       MUX_splitReadInFlight$write_1__SEL_1,
       MUX_wci_wslv_illegalEdge$write_1__SEL_1,
       MUX_wci_wslv_illegalEdge$write_1__VAL_1,
       MUX_wci_wslv_respF_q_0$write_1__SEL_2,
       MUX_wci_wslv_respF_q_1$write_1__SEL_2,
       MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1,
       MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2,
       MUX_wci_wslv_respF_x_wire$wset_1__SEL_1,
       MUX_wci_wslv_respF_x_wire$wset_1__SEL_2,
       MUX_wci_wslv_respF_x_wire$wset_1__SEL_3,
       MUX_wci_wslv_respF_x_wire$wset_1__SEL_4,
       MUX_wsiM_reqFifo_q_0$write_1__SEL_2,
       MUX_wsiM_reqFifo_q_1$write_1__SEL_2;
  // remaining internal signals
  reg [63 : 0] v__h130298, v__h131387, v__h3700, v__h3875, v__h4019;
  reg [31 : 0] IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092,
	       x1_data__h35585,
	       x1_data__h81295;
  reg CASE_adcCore0_colGate_avgPhase_0b1_0_1_1_1_2_1_ETC__q4,
      CASE_adcCore1_colGate_avgPhase_0b1_0_1_1_1_2_1_ETC__q5,
      CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_NOT_wci_ETC__q3;
  wire [63 : 0] wti_nowReq_BITS_63_TO_0__q1;
  wire [31 : 0] IF_adcCore0_sampF_rRdPtr_rsCounter_59_BIT_0_66_ETC___d2461,
		IF_adcCore0_sampF_rRdPtr_rsCounter_59_BIT_0_66_ETC___d2462,
		IF_adcCore0_sampF_rWrPtr_rsCounter_90_BIT_0_97_ETC___d2458,
		IF_adcCore0_sampF_rWrPtr_rsCounter_90_BIT_0_97_ETC___d2459,
		IF_adcCore1_sampF_rWrPtr_rsCounter_337_BIT_0_3_ETC___d2467,
		IF_adcCore1_sampF_rWrPtr_rsCounter_337_BIT_0_3_ETC___d2468,
		IF_fcAdc_grayCounter_rsCounter_60_BIT_0_67_OR__ETC___d2454,
		IF_fcAdc_grayCounter_rsCounter_60_BIT_0_67_XOR_ETC___d2455,
		adcStatusLs__h130971,
		avgDataBW__h35898,
		avgDataBW__h81608,
		d_data__h35985,
		d_data__h81695,
		rdat__h131371,
		rdat__h131450,
		rdat__h131531,
		rdat__h131557;
  wire [17 : 0] x__h36250,
		x__h36260,
		x__h36326,
		x__h36400,
		x__h36410,
		x__h7511,
		x__h81960,
		x__h81970,
		x__h82036,
		x__h82110,
		x__h82120,
		y__h36411,
		y__h36413,
		y__h82121,
		y__h82123,
		y__h8916;
  wire [11 : 0] x_burstLength__h128706;
  wire [10 : 0] adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176,
		adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216,
		x__h38579,
		x__h40881,
		x__h44308,
		x__h84289,
		x_dReadBin__h42694,
		x_dReadBin__h88404,
		x_sReadBin__h42691,
		y__h39466,
		y__h41768,
		y__h85176;
  wire [9 : 0] x2__h44277, x2__h89987;
  wire [7 : 0] adcCore0_spiI_reqS_BITS_15_TO_8__q6,
	       adcCore0_spiI_reqS_BITS_7_TO_0__q7,
	       adcCore1_spiI_reqS_BITS_15_TO_8__q9,
	       adcCore1_spiI_reqS_BITS_7_TO_0__q8,
	       spiClk_spiI_reqS_BITS_15_TO_8__q2,
	       spiClk_spiI_reqS_BITS_7_TO_0__q10;
  wire IF_spiClk_spiI_iPos_89_EQ_15_90_THEN_NOT_spiCl_ETC___d401,
       IF_wci_wslv_reqF_first__5_BITS_43_TO_42_943_EQ_ETC___d1970,
       IF_wci_wslv_reqF_i_notEmpty__4_AND_wci_wslv_re_ETC___d1968,
       IF_wci_wslv_reqF_i_notEmpty__4_AND_wci_wslv_re_ETC___d2447,
       NOT_adcCore0_sampF_rRdPtr_rsCounter_59_EQ_adcC_ETC___d1909,
       NOT_adcCore0_spiI_reqF_head_wrapped__read__82__ETC___d1025,
       NOT_adcCore1_spiI_reqF_head_wrapped__read__629_ETC___d1672,
       NOT_spiClk_spiI_reqF_head_wrapped__read__39_EQ_ETC___d382,
       adcCore0_colGate_operatePW_whas__35_AND_adcCor_ETC___d590,
       adcCore0_colGate_operatePW_whas__35_AND_adcCor_ETC___d601,
       adcCore0_colGate_sampF_RDY_first__04_AND_NOT_a_ETC___d961,
       adcCore0_colGate_uprollCnt_04_EQ_adcCore0_colG_ETC___d2230,
       adcCore0_iseqFsm_abort_whas__080_AND_adcCore0__ETC___d1152,
       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2169,
       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2170,
       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2171,
       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2172,
       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2173,
       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2174,
       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2175,
       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2178,
       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2200,
       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_0_66_XO_ETC___d2328,
       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2150,
       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2161,
       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2162,
       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2163,
       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2164,
       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2165,
       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2166,
       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2167,
       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2168,
       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2231,
       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_0_97_XO_ETC___d2327,
       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2142,
       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2143,
       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2144,
       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2145,
       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2146,
       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2148,
       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2155,
       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2156,
       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2157,
       adcCore0_spiI_reqF_head_wrapped_crossed__74_EQ_ETC___d1130,
       adcCore1_colGate_operatePW_whas__182_AND_adcCo_ETC___d1237,
       adcCore1_colGate_operatePW_whas__182_AND_adcCo_ETC___d1248,
       adcCore1_colGate_sampF_RDY_first__551_AND_NOT__ETC___d1608,
       adcCore1_colGate_uprollCnt_251_EQ_adcCore1_col_ETC___d2234,
       adcCore1_iseqFsm_abort_whas__727_AND_adcCore1__ETC___d1799,
       adcCore1_iseqFsm_abort_whas__727_AND_adcCore1__ETC___d2103,
       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2194,
       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2195,
       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2196,
       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2197,
       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2198,
       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2203,
       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2204,
       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2205,
       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2215,
       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2187,
       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2188,
       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2189,
       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2190,
       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2191,
       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2192,
       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2193,
       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2199,
       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2202,
       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_0_344__ETC___d2338,
       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2179,
       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2180,
       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2181,
       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2182,
       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2183,
       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2184,
       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2185,
       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2186,
       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2201,
       adcCore1_spiI_reqF_head_wrapped_crossed__621_E_ETC___d1777,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2132,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2133,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2134,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2135,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2136,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2137,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2138,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2139,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2140,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2141,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2147,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2149,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2151,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2152,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2153,
       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2154,
       fcAdc_grayCounter_rsCounter_60_BIT_0_67_XOR_fc_ETC___d2326,
       initOpInFlight_041_AND_adcCore0_iseqFsm_abort__ETC___d2110,
       spiClk_iseqFsm_abort_whas__53_AND_spiClk_iseqF_ETC___d513,
       spiClk_spiI_iPos_89_EQ_14_92_OR_spiClk_spiI_iP_ETC___d400,
       spiClk_spiI_iPos_89_ULE_12___d2220,
       spiClk_spiI_iPos_89_ULT_7___d2219,
       spiClk_spiI_reqF_head_wrapped_crossed__31_EQ_s_ETC___d2402,
       x__h17146,
       z__h39510,
       z__h39517,
       z__h39524,
       z__h39531,
       z__h39538,
       z__h39545,
       z__h39552,
       z__h39559,
       z__h39566,
       z__h41812,
       z__h41819,
       z__h41826,
       z__h41833,
       z__h41840,
       z__h41847,
       z__h41854,
       z__h41861,
       z__h41868,
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
       z__h7636,
       z__h85220,
       z__h85227,
       z__h85234,
       z__h85241,
       z__h85248,
       z__h85255,
       z__h85262,
       z__h85269,
       z__h85276;
  // oscillator and gates for output clock CLK_adx_sclk
  assign CLK_adx_sclk = spiClk_spiI_cd$CLK_OUT ;
  assign CLK_GATE_adx_sclk = 1'b1 ;
  // oscillator and gates for output clock CLK_adx_sclkn
  assign CLK_adx_sclkn = spiClk_spiI_cinv$CLK_OUT ;
  assign CLK_GATE_adx_sclkn = 1'b1 ;
  // oscillator and gates for output clock CLK_adc0_sclk
  assign CLK_adc0_sclk = adcCore0_spiI_cd$CLK_OUT ;
  assign CLK_GATE_adc0_sclk = 1'b1 ;
  // oscillator and gates for output clock CLK_adc0_sclkn
  assign CLK_adc0_sclkn = adcCore0_spiI_cinv$CLK_OUT ;
  assign CLK_GATE_adc0_sclkn = 1'b1 ;
  // oscillator and gates for output clock CLK_adc1_sclk
  assign CLK_adc1_sclk = adcCore1_spiI_cd$CLK_OUT ;
  assign CLK_GATE_adc1_sclk = 1'b1 ;
  // oscillator and gates for output clock CLK_adc1_sclkn
  assign CLK_adc1_sclkn = adcCore1_spiI_cinv$CLK_OUT ;
  assign CLK_GATE_adc1_sclkn = 1'b1 ;
  // oscillator and gates for output clock CLK_adcSdrClk
  assign CLK_adcSdrClk = adcCore0_ddrC_ddrV$sdrClk ;
  assign CLK_GATE_adcSdrClk = 1'b1 ;
  // output resets
  assign RST_N_adx_srst = spiClk_spiI_slowReset$OUT_RST ;
  assign RST_N_adc0_rst = adcCore0_spiI_slowReset$OUT_RST ;
  assign RST_N_adc1_rst = adcCore1_spiI_slowReset$OUT_RST ;
  assign RST_N_adcSdrRst = adcCore0_sdrRst$OUT_RST ;
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
  // value method adx_adx_csb
  assign adx_csb = spiClk_spiI_csbR ;
  // value method adx_adx_sdo
  assign adx_sdo = spiClk_spiI_sdoR ;
  // value method adx_adx_funct
  assign adx_funct = 1'b1 ;
  // value method adc0_oe
  assign adc0_oe = 1'd1 ;
  // value method adc0_resetp
  assign adc0_resetp = adcCore0_adcRst ;
  // value method adc0_sen
  assign adc0_sen = adcCore0_spiI_csbR ;
  // value method adc0_sdata
  assign adc0_sdata = adcCore0_spiI_sdoR ;
  // value method adc1_oe
  assign adc1_oe = 1'd1 ;
  // value method adc1_resetp
  assign adc1_resetp = adcCore1_adcRst ;
  // value method adc1_sen
  assign adc1_sen = adcCore1_spiI_csbR ;
  // value method adc1_sdata
  assign adc1_sdata = adcCore1_spiI_sdoR ;
  // submodule adcCore0_acquireD
  SyncRegister #(.width(32'd1),
		 .init(1'd0)) adcCore0_acquireD(.sCLK(wciS0_Clk),
						.dCLK(adcCore0_ddrC_ddrV$sdrClk),
						.sRST(wciS0_MReset_n),
						.sD_IN(adcCore0_acquireD$sD_IN),
						.sEN(adcCore0_acquireD$sEN),
						.dD_OUT(adcCore0_acquireD$dD_OUT),
						.sRDY(adcCore0_acquireD$sRDY));
  // submodule adcCore0_averageD
  SyncRegister #(.width(32'd1),
		 .init(1'd0)) adcCore0_averageD(.sCLK(wciS0_Clk),
						.dCLK(adcCore0_ddrC_ddrV$sdrClk),
						.sRST(wciS0_MReset_n),
						.sD_IN(adcCore0_averageD$sD_IN),
						.sEN(adcCore0_averageD$sEN),
						.dD_OUT(adcCore0_averageD$dD_OUT),
						.sRDY(adcCore0_averageD$sRDY));
  // submodule adcCore0_colGate_sampF
  arSRLFIFOD #(.width(32'd39),
	       .l2depth(32'd4)) adcCore0_colGate_sampF(.CLK(adcCore0_ddrC_ddrV$sdrClk),
						       .RST_N(adcCore0_sdrRst$OUT_RST),
						       .D_IN(adcCore0_colGate_sampF$D_IN),
						       .ENQ(adcCore0_colGate_sampF$ENQ),
						       .DEQ(adcCore0_colGate_sampF$DEQ),
						       .CLR(adcCore0_colGate_sampF$CLR),
						       .D_OUT(adcCore0_colGate_sampF$D_OUT),
						       .FULL_N(adcCore0_colGate_sampF$FULL_N),
						       .EMPTY_N(adcCore0_colGate_sampF$EMPTY_N));
  // submodule adcCore0_ddrC_ddrV
  ddrInput2 adcCore0_ddrC_ddrV(.psClk(wciS0_Clk),
			       .psRstN(wciS0_MReset_n),
			       .ddrClk(CLK_adc0_clk),
			       .ddrDataN(adcCore0_ddrC_ddrV$ddrDataN),
			       .ddrDataP(adcCore0_ddrC_ddrV$ddrDataP),
			       .psEna(adcCore0_ddrC_ddrV$psEna),
			       .psInc(adcCore0_ddrC_ddrV$psInc),
			       .sdrData0(adcCore0_ddrC_ddrV$sdrData0),
			       .sdrData1(adcCore0_ddrC_ddrV$sdrData1),
			       .sdrClk(adcCore0_ddrC_ddrV$sdrClk));
  // submodule adcCore0_maxBurstLengthR
  SyncRegister #(.width(32'd16),
		 .init(16'd0)) adcCore0_maxBurstLengthR(.sCLK(wciS0_Clk),
							.dCLK(adcCore0_ddrC_ddrV$sdrClk),
							.sRST(wciS0_MReset_n),
							.sD_IN(adcCore0_maxBurstLengthR$sD_IN),
							.sEN(adcCore0_maxBurstLengthR$sEN),
							.dD_OUT(adcCore0_maxBurstLengthR$dD_OUT),
							.sRDY(adcCore0_maxBurstLengthR$sRDY));
  // submodule adcCore0_operateD
  SyncRegister #(.width(32'd1),
		 .init(1'd0)) adcCore0_operateD(.sCLK(wciS0_Clk),
						.dCLK(adcCore0_ddrC_ddrV$sdrClk),
						.sRST(wciS0_MReset_n),
						.sD_IN(adcCore0_operateD$sD_IN),
						.sEN(adcCore0_operateD$sEN),
						.dD_OUT(adcCore0_operateD$dD_OUT),
						.sRDY(adcCore0_operateD$sRDY));
  // submodule adcCore0_reqF
  FIFO2 #(.width(32'd17), .guarded(32'd1)) adcCore0_reqF(.RST(wciS0_MReset_n),
							 .CLK(wciS0_Clk),
							 .D_IN(adcCore0_reqF$D_IN),
							 .ENQ(adcCore0_reqF$ENQ),
							 .DEQ(adcCore0_reqF$DEQ),
							 .CLR(adcCore0_reqF$CLR),
							 .D_OUT(adcCore0_reqF$D_OUT),
							 .FULL_N(adcCore0_reqF$FULL_N),
							 .EMPTY_N(adcCore0_reqF$EMPTY_N));
  // submodule adcCore0_sampCC
  SyncRegister #(.width(32'd32),
		 .init(32'd0)) adcCore0_sampCC(.sCLK(adcCore0_ddrC_ddrV$sdrClk),
					       .dCLK(wciS0_Clk),
					       .sRST(adcCore0_sdrRst$OUT_RST),
					       .sD_IN(adcCore0_sampCC$sD_IN),
					       .sEN(adcCore0_sampCC$sEN),
					       .dD_OUT(adcCore0_sampCC$dD_OUT),
					       .sRDY(adcCore0_sampCC$sRDY));
  // submodule adcCore0_sampF_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd10),
	  .DATA_WIDTH(32'd39),
	  .MEMSIZE(11'd1024)) adcCore0_sampF_memory(.CLKA(adcCore0_ddrC_ddrV$sdrClk),
						    .CLKB(wciS0_Clk),
						    .ADDRA(adcCore0_sampF_memory$ADDRA),
						    .ADDRB(adcCore0_sampF_memory$ADDRB),
						    .DIA(adcCore0_sampF_memory$DIA),
						    .DIB(adcCore0_sampF_memory$DIB),
						    .WEA(adcCore0_sampF_memory$WEA),
						    .WEB(adcCore0_sampF_memory$WEB),
						    .ENA(adcCore0_sampF_memory$ENA),
						    .ENB(adcCore0_sampF_memory$ENB),
						    .DOA(),
						    .DOB(adcCore0_sampF_memory$DOB));
  // submodule adcCore0_sdrRst
  SyncResetA #(.RSTDELAY(32'd1)) adcCore0_sdrRst(.CLK(adcCore0_ddrC_ddrV$sdrClk),
						 .IN_RST(wciS0_MReset_n),
						 .OUT_RST(adcCore0_sdrRst$OUT_RST));
  // submodule adcCore0_spiI_cd
  ClockDiv #(.width(32'd3),
	     .lower(32'd0),
	     .upper(32'd7),
	     .offset(32'd0)) adcCore0_spiI_cd(.CLK_IN(wciS0_Clk),
					      .RST(wciS0_MReset_n),
					      .PREEDGE(adcCore0_spiI_cd$PREEDGE),
					      .CLK_OUT(adcCore0_spiI_cd$CLK_OUT));
  // submodule adcCore0_spiI_cinv
  ClockInverter adcCore0_spiI_cinv(.CLK_IN(adcCore0_spiI_cd$CLK_OUT),
				   .PREEDGE(),
				   .CLK_OUT(adcCore0_spiI_cinv$CLK_OUT));
  // submodule adcCore0_spiI_reqF_dCombinedReset
  ResetEither adcCore0_spiI_reqF_dCombinedReset(.A_RST(adcCore0_spiI_slowReset$OUT_RST),
						.B_RST(adcCore0_spiI_reqF_dCrossedsReset$OUT_RST),
						.RST_OUT(adcCore0_spiI_reqF_dCombinedReset$RST_OUT));
  // submodule adcCore0_spiI_reqF_dCrossedsReset
  SyncReset0 adcCore0_spiI_reqF_dCrossedsReset(.IN_RST(wciS0_MReset_n),
					       .OUT_RST(adcCore0_spiI_reqF_dCrossedsReset$OUT_RST));
  // submodule adcCore0_spiI_reqF_dInReset
  ResetToBool adcCore0_spiI_reqF_dInReset(.RST(adcCore0_spiI_reqF_dCombinedReset$RST_OUT),
					  .VAL(adcCore0_spiI_reqF_dInReset$VAL));
  // submodule adcCore0_spiI_reqF_sCombinedReset
  ResetEither adcCore0_spiI_reqF_sCombinedReset(.A_RST(wciS0_MReset_n),
						.B_RST(adcCore0_spiI_reqF_sCrosseddReset$OUT_RST),
						.RST_OUT(adcCore0_spiI_reqF_sCombinedReset$RST_OUT));
  // submodule adcCore0_spiI_reqF_sCrosseddReset
  SyncReset0 adcCore0_spiI_reqF_sCrosseddReset(.IN_RST(adcCore0_spiI_slowReset$OUT_RST),
					       .OUT_RST(adcCore0_spiI_reqF_sCrosseddReset$OUT_RST));
  // submodule adcCore0_spiI_reqF_sInReset
  ResetToBool adcCore0_spiI_reqF_sInReset(.RST(adcCore0_spiI_reqF_sCombinedReset$RST_OUT),
					  .VAL(adcCore0_spiI_reqF_sInReset$VAL));
  // submodule adcCore0_spiI_respF_dCombinedReset
  ResetEither adcCore0_spiI_respF_dCombinedReset(.A_RST(wciS0_MReset_n),
						 .B_RST(adcCore0_spiI_respF_dCrossedsReset$OUT_RST),
						 .RST_OUT(adcCore0_spiI_respF_dCombinedReset$RST_OUT));
  // submodule adcCore0_spiI_respF_dCrossedsReset
  SyncReset0 adcCore0_spiI_respF_dCrossedsReset(.IN_RST(adcCore0_spiI_slowReset$OUT_RST),
						.OUT_RST(adcCore0_spiI_respF_dCrossedsReset$OUT_RST));
  // submodule adcCore0_spiI_respF_dInReset
  ResetToBool adcCore0_spiI_respF_dInReset(.RST(adcCore0_spiI_respF_dCombinedReset$RST_OUT),
					   .VAL(adcCore0_spiI_respF_dInReset$VAL));
  // submodule adcCore0_spiI_respF_sCombinedReset
  ResetEither adcCore0_spiI_respF_sCombinedReset(.A_RST(adcCore0_spiI_slowReset$OUT_RST),
						 .B_RST(adcCore0_spiI_respF_sCrosseddReset$OUT_RST),
						 .RST_OUT(adcCore0_spiI_respF_sCombinedReset$RST_OUT));
  // submodule adcCore0_spiI_respF_sCrosseddReset
  SyncReset0 adcCore0_spiI_respF_sCrosseddReset(.IN_RST(wciS0_MReset_n),
						.OUT_RST(adcCore0_spiI_respF_sCrosseddReset$OUT_RST));
  // submodule adcCore0_spiI_respF_sInReset
  ResetToBool adcCore0_spiI_respF_sInReset(.RST(adcCore0_spiI_respF_sCombinedReset$RST_OUT),
					   .VAL(adcCore0_spiI_respF_sInReset$VAL));
  // submodule adcCore0_spiI_slowReset
  SyncResetA #(.RSTDELAY(32'd1)) adcCore0_spiI_slowReset(.CLK(adcCore0_spiI_cd$CLK_OUT),
							 .IN_RST(wciS0_MReset_n),
							 .OUT_RST(adcCore0_spiI_slowReset$OUT_RST));
  // submodule adcCore0_statsCC
  SyncRegister #(.width(32'd128),
		 .init(128'd0)) adcCore0_statsCC(.sCLK(adcCore0_ddrC_ddrV$sdrClk),
						 .dCLK(wciS0_Clk),
						 .sRST(adcCore0_sdrRst$OUT_RST),
						 .sD_IN(adcCore0_statsCC$sD_IN),
						 .sEN(adcCore0_statsCC$sEN),
						 .dD_OUT(adcCore0_statsCC$dD_OUT),
						 .sRDY(adcCore0_statsCC$sRDY));
  // submodule adcCore1_acquireD
  SyncRegister #(.width(32'd1),
		 .init(1'd0)) adcCore1_acquireD(.sCLK(wciS0_Clk),
						.dCLK(adcCore1_ddrC_ddrV$sdrClk),
						.sRST(wciS0_MReset_n),
						.sD_IN(adcCore1_acquireD$sD_IN),
						.sEN(adcCore1_acquireD$sEN),
						.dD_OUT(adcCore1_acquireD$dD_OUT),
						.sRDY(adcCore1_acquireD$sRDY));
  // submodule adcCore1_averageD
  SyncRegister #(.width(32'd1),
		 .init(1'd0)) adcCore1_averageD(.sCLK(wciS0_Clk),
						.dCLK(adcCore1_ddrC_ddrV$sdrClk),
						.sRST(wciS0_MReset_n),
						.sD_IN(adcCore1_averageD$sD_IN),
						.sEN(adcCore1_averageD$sEN),
						.dD_OUT(adcCore1_averageD$dD_OUT),
						.sRDY(adcCore1_averageD$sRDY));
  // submodule adcCore1_colGate_sampF
  arSRLFIFOD #(.width(32'd39),
	       .l2depth(32'd4)) adcCore1_colGate_sampF(.CLK(adcCore1_ddrC_ddrV$sdrClk),
						       .RST_N(adcCore1_sdrRst$OUT_RST),
						       .D_IN(adcCore1_colGate_sampF$D_IN),
						       .ENQ(adcCore1_colGate_sampF$ENQ),
						       .DEQ(adcCore1_colGate_sampF$DEQ),
						       .CLR(adcCore1_colGate_sampF$CLR),
						       .D_OUT(adcCore1_colGate_sampF$D_OUT),
						       .FULL_N(adcCore1_colGate_sampF$FULL_N),
						       .EMPTY_N(adcCore1_colGate_sampF$EMPTY_N));
  // submodule adcCore1_ddrC_ddrV
  ddrInput2 adcCore1_ddrC_ddrV(.psClk(wciS0_Clk),
			       .psRstN(wciS0_MReset_n),
			       .ddrClk(CLK_adc1_clk),
			       .ddrDataN(adcCore1_ddrC_ddrV$ddrDataN),
			       .ddrDataP(adcCore1_ddrC_ddrV$ddrDataP),
			       .psEna(adcCore1_ddrC_ddrV$psEna),
			       .psInc(adcCore1_ddrC_ddrV$psInc),
			       .sdrData0(adcCore1_ddrC_ddrV$sdrData0),
			       .sdrData1(adcCore1_ddrC_ddrV$sdrData1),
			       .sdrClk(adcCore1_ddrC_ddrV$sdrClk));
  // submodule adcCore1_maxBurstLengthR
  SyncRegister #(.width(32'd16),
		 .init(16'd0)) adcCore1_maxBurstLengthR(.sCLK(wciS0_Clk),
							.dCLK(adcCore1_ddrC_ddrV$sdrClk),
							.sRST(wciS0_MReset_n),
							.sD_IN(adcCore1_maxBurstLengthR$sD_IN),
							.sEN(adcCore1_maxBurstLengthR$sEN),
							.dD_OUT(adcCore1_maxBurstLengthR$dD_OUT),
							.sRDY());
  // submodule adcCore1_operateD
  SyncRegister #(.width(32'd1),
		 .init(1'd0)) adcCore1_operateD(.sCLK(wciS0_Clk),
						.dCLK(adcCore1_ddrC_ddrV$sdrClk),
						.sRST(wciS0_MReset_n),
						.sD_IN(adcCore1_operateD$sD_IN),
						.sEN(adcCore1_operateD$sEN),
						.dD_OUT(adcCore1_operateD$dD_OUT),
						.sRDY(adcCore1_operateD$sRDY));
  // submodule adcCore1_reqF
  FIFO2 #(.width(32'd17), .guarded(32'd1)) adcCore1_reqF(.RST(wciS0_MReset_n),
							 .CLK(wciS0_Clk),
							 .D_IN(adcCore1_reqF$D_IN),
							 .ENQ(adcCore1_reqF$ENQ),
							 .DEQ(adcCore1_reqF$DEQ),
							 .CLR(adcCore1_reqF$CLR),
							 .D_OUT(adcCore1_reqF$D_OUT),
							 .FULL_N(adcCore1_reqF$FULL_N),
							 .EMPTY_N(adcCore1_reqF$EMPTY_N));
  // submodule adcCore1_sampCC
  SyncRegister #(.width(32'd32),
		 .init(32'd0)) adcCore1_sampCC(.sCLK(adcCore1_ddrC_ddrV$sdrClk),
					       .dCLK(wciS0_Clk),
					       .sRST(adcCore1_sdrRst$OUT_RST),
					       .sD_IN(adcCore1_sampCC$sD_IN),
					       .sEN(adcCore1_sampCC$sEN),
					       .dD_OUT(adcCore1_sampCC$dD_OUT),
					       .sRDY(adcCore1_sampCC$sRDY));
  // submodule adcCore1_sampF_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd10),
	  .DATA_WIDTH(32'd39),
	  .MEMSIZE(11'd1024)) adcCore1_sampF_memory(.CLKA(adcCore1_ddrC_ddrV$sdrClk),
						    .CLKB(wciS0_Clk),
						    .ADDRA(adcCore1_sampF_memory$ADDRA),
						    .ADDRB(adcCore1_sampF_memory$ADDRB),
						    .DIA(adcCore1_sampF_memory$DIA),
						    .DIB(adcCore1_sampF_memory$DIB),
						    .WEA(adcCore1_sampF_memory$WEA),
						    .WEB(adcCore1_sampF_memory$WEB),
						    .ENA(adcCore1_sampF_memory$ENA),
						    .ENB(adcCore1_sampF_memory$ENB),
						    .DOA(),
						    .DOB(adcCore1_sampF_memory$DOB));
  // submodule adcCore1_sdrRst
  SyncResetA #(.RSTDELAY(32'd1)) adcCore1_sdrRst(.CLK(adcCore1_ddrC_ddrV$sdrClk),
						 .IN_RST(wciS0_MReset_n),
						 .OUT_RST(adcCore1_sdrRst$OUT_RST));
  // submodule adcCore1_spiI_cd
  ClockDiv #(.width(32'd3),
	     .lower(32'd0),
	     .upper(32'd7),
	     .offset(32'd0)) adcCore1_spiI_cd(.CLK_IN(wciS0_Clk),
					      .RST(wciS0_MReset_n),
					      .PREEDGE(adcCore1_spiI_cd$PREEDGE),
					      .CLK_OUT(adcCore1_spiI_cd$CLK_OUT));
  // submodule adcCore1_spiI_cinv
  ClockInverter adcCore1_spiI_cinv(.CLK_IN(adcCore1_spiI_cd$CLK_OUT),
				   .PREEDGE(),
				   .CLK_OUT(adcCore1_spiI_cinv$CLK_OUT));
  // submodule adcCore1_spiI_reqF_dCombinedReset
  ResetEither adcCore1_spiI_reqF_dCombinedReset(.A_RST(adcCore1_spiI_slowReset$OUT_RST),
						.B_RST(adcCore1_spiI_reqF_dCrossedsReset$OUT_RST),
						.RST_OUT(adcCore1_spiI_reqF_dCombinedReset$RST_OUT));
  // submodule adcCore1_spiI_reqF_dCrossedsReset
  SyncReset0 adcCore1_spiI_reqF_dCrossedsReset(.IN_RST(wciS0_MReset_n),
					       .OUT_RST(adcCore1_spiI_reqF_dCrossedsReset$OUT_RST));
  // submodule adcCore1_spiI_reqF_dInReset
  ResetToBool adcCore1_spiI_reqF_dInReset(.RST(adcCore1_spiI_reqF_dCombinedReset$RST_OUT),
					  .VAL(adcCore1_spiI_reqF_dInReset$VAL));
  // submodule adcCore1_spiI_reqF_sCombinedReset
  ResetEither adcCore1_spiI_reqF_sCombinedReset(.A_RST(wciS0_MReset_n),
						.B_RST(adcCore1_spiI_reqF_sCrosseddReset$OUT_RST),
						.RST_OUT(adcCore1_spiI_reqF_sCombinedReset$RST_OUT));
  // submodule adcCore1_spiI_reqF_sCrosseddReset
  SyncReset0 adcCore1_spiI_reqF_sCrosseddReset(.IN_RST(adcCore1_spiI_slowReset$OUT_RST),
					       .OUT_RST(adcCore1_spiI_reqF_sCrosseddReset$OUT_RST));
  // submodule adcCore1_spiI_reqF_sInReset
  ResetToBool adcCore1_spiI_reqF_sInReset(.RST(adcCore1_spiI_reqF_sCombinedReset$RST_OUT),
					  .VAL(adcCore1_spiI_reqF_sInReset$VAL));
  // submodule adcCore1_spiI_respF_dCombinedReset
  ResetEither adcCore1_spiI_respF_dCombinedReset(.A_RST(wciS0_MReset_n),
						 .B_RST(adcCore1_spiI_respF_dCrossedsReset$OUT_RST),
						 .RST_OUT(adcCore1_spiI_respF_dCombinedReset$RST_OUT));
  // submodule adcCore1_spiI_respF_dCrossedsReset
  SyncReset0 adcCore1_spiI_respF_dCrossedsReset(.IN_RST(adcCore1_spiI_slowReset$OUT_RST),
						.OUT_RST(adcCore1_spiI_respF_dCrossedsReset$OUT_RST));
  // submodule adcCore1_spiI_respF_dInReset
  ResetToBool adcCore1_spiI_respF_dInReset(.RST(adcCore1_spiI_respF_dCombinedReset$RST_OUT),
					   .VAL(adcCore1_spiI_respF_dInReset$VAL));
  // submodule adcCore1_spiI_respF_sCombinedReset
  ResetEither adcCore1_spiI_respF_sCombinedReset(.A_RST(adcCore1_spiI_slowReset$OUT_RST),
						 .B_RST(adcCore1_spiI_respF_sCrosseddReset$OUT_RST),
						 .RST_OUT(adcCore1_spiI_respF_sCombinedReset$RST_OUT));
  // submodule adcCore1_spiI_respF_sCrosseddReset
  SyncReset0 adcCore1_spiI_respF_sCrosseddReset(.IN_RST(wciS0_MReset_n),
						.OUT_RST(adcCore1_spiI_respF_sCrosseddReset$OUT_RST));
  // submodule adcCore1_spiI_respF_sInReset
  ResetToBool adcCore1_spiI_respF_sInReset(.RST(adcCore1_spiI_respF_sCombinedReset$RST_OUT),
					   .VAL(adcCore1_spiI_respF_sInReset$VAL));
  // submodule adcCore1_spiI_slowReset
  SyncResetA #(.RSTDELAY(32'd1)) adcCore1_spiI_slowReset(.CLK(adcCore1_spiI_cd$CLK_OUT),
							 .IN_RST(wciS0_MReset_n),
							 .OUT_RST(adcCore1_spiI_slowReset$OUT_RST));
  // submodule adcCore1_statsCC
  SyncRegister #(.width(32'd128),
		 .init(128'd0)) adcCore1_statsCC(.sCLK(adcCore1_ddrC_ddrV$sdrClk),
						 .dCLK(wciS0_Clk),
						 .sRST(adcCore1_sdrRst$OUT_RST),
						 .sD_IN(adcCore1_statsCC$sD_IN),
						 .sEN(adcCore1_statsCC$sEN),
						 .dD_OUT(),
						 .sRDY(adcCore1_statsCC$sRDY));
  // submodule adcIdc
  IDELAYCTRL_GRP #(.IODELAY_GRP("IODELAY_ADC")) adcIdc(.REFCLK(CLK_sys0_clk),
						       .RST(adcIdc_resetP$RESET_OUT),
						       .RDY(adcIdc$RDY));
  // submodule adcIdcRdyBit
  SyncBit #(.init(1'd0)) adcIdcRdyBit(.sCLK(CLK_sys0_clk),
				      .dCLK(wciS0_Clk),
				      .sRST(RST_N_sys0_rst),
				      .sD_IN(adcIdcRdyBit$sD_IN),
				      .sEN(adcIdcRdyBit$sEN),
				      .dD_OUT(adcIdcRdyBit$dD_OUT));
  // submodule adcIdc_idcRst
  MakeResetA #(.RSTDELAY(32'd1),
	       .init(1'd0)) adcIdc_idcRst(.CLK(CLK_sys0_clk),
					  .RST(RST_N_sys0_rst),
					  .DST_CLK(CLK_sys0_clk),
					  .ASSERT_IN(adcIdc_idcRst$ASSERT_IN),
					  .ASSERT_OUT(),
					  .OUT_RST(adcIdc_idcRst$OUT_RST));
  // submodule adcIdc_resetP
  ResetInverter adcIdc_resetP(.RESET_IN(adcIdc_idcRst$OUT_RST),
			      .RESET_OUT(adcIdc_resetP$RESET_OUT));
  // submodule fcAdc_testRst
  SyncResetA #(.RSTDELAY(32'd1)) fcAdc_testRst(.CLK(CLK_adc_clk),
					       .IN_RST(wciS0_MReset_n),
					       .OUT_RST(fcAdc_testRst$OUT_RST));
  // submodule spiClk_spiI_cd
  ClockDiv #(.width(32'd3),
	     .lower(32'd0),
	     .upper(32'd7),
	     .offset(32'd0)) spiClk_spiI_cd(.CLK_IN(wciS0_Clk),
					    .RST(wciS0_MReset_n),
					    .PREEDGE(spiClk_spiI_cd$PREEDGE),
					    .CLK_OUT(spiClk_spiI_cd$CLK_OUT));
  // submodule spiClk_spiI_cinv
  ClockInverter spiClk_spiI_cinv(.CLK_IN(spiClk_spiI_cd$CLK_OUT),
				 .PREEDGE(),
				 .CLK_OUT(spiClk_spiI_cinv$CLK_OUT));
  // submodule spiClk_spiI_reqF_dCombinedReset
  ResetEither spiClk_spiI_reqF_dCombinedReset(.A_RST(spiClk_spiI_slowReset$OUT_RST),
					      .B_RST(spiClk_spiI_reqF_dCrossedsReset$OUT_RST),
					      .RST_OUT(spiClk_spiI_reqF_dCombinedReset$RST_OUT));
  // submodule spiClk_spiI_reqF_dCrossedsReset
  SyncReset0 spiClk_spiI_reqF_dCrossedsReset(.IN_RST(wciS0_MReset_n),
					     .OUT_RST(spiClk_spiI_reqF_dCrossedsReset$OUT_RST));
  // submodule spiClk_spiI_reqF_dInReset
  ResetToBool spiClk_spiI_reqF_dInReset(.RST(spiClk_spiI_reqF_dCombinedReset$RST_OUT),
					.VAL(spiClk_spiI_reqF_dInReset$VAL));
  // submodule spiClk_spiI_reqF_sCombinedReset
  ResetEither spiClk_spiI_reqF_sCombinedReset(.A_RST(wciS0_MReset_n),
					      .B_RST(spiClk_spiI_reqF_sCrosseddReset$OUT_RST),
					      .RST_OUT(spiClk_spiI_reqF_sCombinedReset$RST_OUT));
  // submodule spiClk_spiI_reqF_sCrosseddReset
  SyncReset0 spiClk_spiI_reqF_sCrosseddReset(.IN_RST(spiClk_spiI_slowReset$OUT_RST),
					     .OUT_RST(spiClk_spiI_reqF_sCrosseddReset$OUT_RST));
  // submodule spiClk_spiI_reqF_sInReset
  ResetToBool spiClk_spiI_reqF_sInReset(.RST(spiClk_spiI_reqF_sCombinedReset$RST_OUT),
					.VAL(spiClk_spiI_reqF_sInReset$VAL));
  // submodule spiClk_spiI_respF_dCombinedReset
  ResetEither spiClk_spiI_respF_dCombinedReset(.A_RST(wciS0_MReset_n),
					       .B_RST(spiClk_spiI_respF_dCrossedsReset$OUT_RST),
					       .RST_OUT(spiClk_spiI_respF_dCombinedReset$RST_OUT));
  // submodule spiClk_spiI_respF_dCrossedsReset
  SyncReset0 spiClk_spiI_respF_dCrossedsReset(.IN_RST(spiClk_spiI_slowReset$OUT_RST),
					      .OUT_RST(spiClk_spiI_respF_dCrossedsReset$OUT_RST));
  // submodule spiClk_spiI_respF_dInReset
  ResetToBool spiClk_spiI_respF_dInReset(.RST(spiClk_spiI_respF_dCombinedReset$RST_OUT),
					 .VAL(spiClk_spiI_respF_dInReset$VAL));
  // submodule spiClk_spiI_respF_sCombinedReset
  ResetEither spiClk_spiI_respF_sCombinedReset(.A_RST(spiClk_spiI_slowReset$OUT_RST),
					       .B_RST(spiClk_spiI_respF_sCrosseddReset$OUT_RST),
					       .RST_OUT(spiClk_spiI_respF_sCombinedReset$RST_OUT));
  // submodule spiClk_spiI_respF_sCrosseddReset
  SyncReset0 spiClk_spiI_respF_sCrosseddReset(.IN_RST(wciS0_MReset_n),
					      .OUT_RST(spiClk_spiI_respF_sCrosseddReset$OUT_RST));
  // submodule spiClk_spiI_respF_sInReset
  ResetToBool spiClk_spiI_respF_sInReset(.RST(spiClk_spiI_respF_sCombinedReset$RST_OUT),
					 .VAL(spiClk_spiI_respF_sInReset$VAL));
  // submodule spiClk_spiI_slowReset
  SyncResetA #(.RSTDELAY(32'd1)) spiClk_spiI_slowReset(.CLK(spiClk_spiI_cd$CLK_OUT),
						       .IN_RST(wciS0_MReset_n),
						       .OUT_RST(spiClk_spiI_slowReset$OUT_RST));
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
  // rule RL_get_adx_resp
  assign CAN_FIRE_RL_get_adx_resp =
	     spiClk_spiI_respF_head_wrapped !=
	     spiClk_spiI_respF_tail_wrapped &&
	     !spiClk_spiI_respF_dInReset$VAL &&
	     spiClk_spiI_cd$PREEDGE &&
	     (!splitReadInFlight || wci_wslv_respF_c_r != 2'd2) ;
  // rule RL_get_adc0_resp
  assign CAN_FIRE_RL_get_adc0_resp =
	     adcCore0_spiI_respF_head_wrapped !=
	     adcCore0_spiI_respF_tail_wrapped &&
	     !adcCore0_spiI_respF_dInReset$VAL &&
	     adcCore0_spiI_cd$PREEDGE &&
	     (!splitReadInFlight || wci_wslv_respF_c_r != 2'd2) ;
  // rule RL_get_adc1_resp
  assign CAN_FIRE_RL_get_adc1_resp =
	     adcCore1_spiI_respF_head_wrapped !=
	     adcCore1_spiI_respF_tail_wrapped &&
	     !adcCore1_spiI_respF_dInReset$VAL &&
	     adcCore1_spiI_cd$PREEDGE &&
	     (!splitReadInFlight || wci_wslv_respF_c_r != 2'd2) ;
  assign WILL_FIRE_RL_get_adc1_resp =
	     CAN_FIRE_RL_get_adc1_resp &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_cfwr
  assign WILL_FIRE_RL_wci_cfwr =
	     wci_wslv_respF_c_r != 2'd2 && wci_wslv_reqF$EMPTY_N &&
	     IF_wci_wslv_reqF_first__5_BITS_43_TO_42_943_EQ_ETC___d1970 &&
	     wci_wslv_wci_cfwr_pw$whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_wslv_ctl_op_start
  assign WILL_FIRE_RL_wci_wslv_ctl_op_start =
	     wci_wslv_reqF$EMPTY_N && wci_wslv_wci_ctrl_pw$whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
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
  // rule RL_spiClk_spiI_start_cs
  assign WILL_FIRE_RL_spiClk_spiI_start_cs =
	     NOT_spiClk_spiI_reqF_head_wrapped__read__39_EQ_ETC___d382 &&
	     !spiClk_spiI_xmt_i &&
	     !spiClk_spiI_xmt_d ;
  // rule RL_spiClk_spiI_send_d
  assign WILL_FIRE_RL_spiClk_spiI_send_d =
	     NOT_spiClk_spiI_reqF_head_wrapped__read__39_EQ_ETC___d382 &&
	     !spiClk_spiI_reqF_dInReset$VAL &&
	     spiClk_spiI_xmt_d ;
  // rule RL_spiClk_spiI_send_i
  assign WILL_FIRE_RL_spiClk_spiI_send_i =
	     IF_spiClk_spiI_iPos_89_EQ_15_90_THEN_NOT_spiCl_ETC___d401 &&
	     spiClk_spiI_xmt_i ;
  // rule RL_spiClk_spiI_reqF_deq_update_head
  assign WILL_FIRE_RL_spiClk_spiI_reqF_deq_update_head =
	     !spiClk_spiI_reqF_dInReset$VAL &&
	     MUX_spiClk_spiI_xmt_d$write_1__SEL_2 ;
  // rule RL_spiClk_spiI_respF_enq_update_tail
  assign WILL_FIRE_RL_spiClk_spiI_respF_enq_update_tail =
	     !spiClk_spiI_respF_sInReset$VAL &&
	     spiClk_spiI_respF_enq_pw$whas ;
  // rule RL_spiClk_spiI_respF_deq_update_head
  assign WILL_FIRE_RL_spiClk_spiI_respF_deq_update_head =
	     !spiClk_spiI_respF_dInReset$VAL &&
	     MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1 ;
  // rule RL_spiClk_iseqFsm_action_l45c9
  assign WILL_FIRE_RL_spiClk_iseqFsm_action_l45c9 =
	     spiClk_spiI_reqF_head_wrapped_crossed__31_EQ_s_ETC___d2402 &&
	     spiClk_iseqFsm_state_mkFSMstate == 4'd1 &&
	     !WILL_FIRE_RL_wci_cfrd &&
	     !WILL_FIRE_RL_wci_cfwr ;
  // rule RL_spiClk_iseqFsm_action_l46c9
  assign WILL_FIRE_RL_spiClk_iseqFsm_action_l46c9 =
	     spiClk_spiI_reqF_head_wrapped_crossed__31_EQ_s_ETC___d2402 &&
	     spiClk_iseqFsm_state_mkFSMstate == 4'd2 &&
	     !WILL_FIRE_RL_wci_cfrd &&
	     !WILL_FIRE_RL_wci_cfwr ;
  // rule RL_spiClk_iseqFsm_action_l47c9
  assign WILL_FIRE_RL_spiClk_iseqFsm_action_l47c9 =
	     spiClk_spiI_reqF_head_wrapped_crossed__31_EQ_s_ETC___d2402 &&
	     spiClk_iseqFsm_state_mkFSMstate == 4'd3 &&
	     !WILL_FIRE_RL_wci_cfrd &&
	     !WILL_FIRE_RL_wci_cfwr ;
  // rule RL_spiClk_iseqFsm_action_l48c9
  assign WILL_FIRE_RL_spiClk_iseqFsm_action_l48c9 =
	     spiClk_spiI_reqF_head_wrapped_crossed__31_EQ_s_ETC___d2402 &&
	     spiClk_iseqFsm_state_mkFSMstate == 4'd4 &&
	     !WILL_FIRE_RL_wci_cfrd &&
	     !WILL_FIRE_RL_wci_cfwr ;
  // rule RL_spiClk_iseqFsm_action_l49c9
  assign WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9 =
	     spiClk_spiI_reqF_head_wrapped_crossed__31_EQ_s_ETC___d2402 &&
	     spiClk_iseqFsm_state_mkFSMstate == 4'd5 &&
	     !WILL_FIRE_RL_wci_cfrd &&
	     !WILL_FIRE_RL_wci_cfwr ;
  // rule RL_spiClk_iseqFsm_action_l50c9
  assign WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9 =
	     spiClk_spiI_reqF_head_wrapped_crossed__31_EQ_s_ETC___d2402 &&
	     spiClk_iseqFsm_state_mkFSMstate == 4'd6 &&
	     !WILL_FIRE_RL_wci_cfrd &&
	     !WILL_FIRE_RL_wci_cfwr ;
  // rule RL_adcCore0_advance_spi_request
  assign WILL_FIRE_RL_adcCore0_advance_spi_request =
	     adcCore0_spiI_reqF_head_wrapped_crossed__74_EQ_ETC___d1130 &&
	     adcCore0_reqF$EMPTY_N &&
	     adcCore0_iseqFsm_abort_whas__080_AND_adcCore0__ETC___d1152 &&
	     !adcCore0_iseqFsm_start_reg ;
  // rule RL_adcCore0_colGate_send_timestamp_mesg
  assign WILL_FIRE_RL_adcCore0_colGate_send_timestamp_mesg =
	     adcCore0_colGate_sampF$FULL_N && adcCore0_operateD$dD_OUT &&
	     adcCore0_colGate_timeMesg != 3'd0 ;
  // rule RL_adcCore0_colGate_send_sync_mesg
  assign WILL_FIRE_RL_adcCore0_colGate_send_sync_mesg =
	     adcCore0_colGate_sampF$FULL_N && adcCore0_operateD$dD_OUT &&
	     adcCore0_colGate_syncMesg != 2'd0 &&
	     adcCore0_colGate_timeMesg == 3'd0 ;
  // rule RL_adcCore0_colGate_capture_collect
  assign WILL_FIRE_RL_adcCore0_colGate_capture_collect =
	     adcCore0_colGate_sampF$FULL_N &&
	     adcCore0_colGate_operatePW_whas__35_AND_adcCor_ETC___d601 ;
  // rule RL_adcCore0_colGate_form_avg4_sample
  assign WILL_FIRE_RL_adcCore0_colGate_form_avg4_sample =
	     CASE_adcCore0_colGate_avgPhase_0b1_0_1_1_1_2_1_ETC__q4 &&
	     adcCore0_operateD$dD_OUT ;
  // rule RL_adcCore0_colGate_overrun_recovery
  assign WILL_FIRE_RL_adcCore0_colGate_overrun_recovery =
	     (adcCore0_colGate_ovrRecover != 4'd15 ||
	      adcCore0_colGate_sampF$FULL_N) &&
	     adcCore0_colGate_operatePW_whas__35_AND_adcCor_ETC___d590 &&
	     adcCore0_colGate_ovrRecover != 4'd0 &&
	     !WILL_FIRE_RL_adcCore0_colGate_send_sync_mesg ;
  // rule RL_adcCore0_colGate_count_dropped_samples
  assign WILL_FIRE_RL_adcCore0_colGate_count_dropped_samples =
	     adcCore0_colGate_operatePW_whas__35_AND_adcCor_ETC___d590 &&
	     adcCore0_colGate_sampActive &&
	     !adcCore0_colGate_sampF$FULL_N &&
	     !WILL_FIRE_RL_adcCore0_colGate_overrun_recovery ;
  // rule RL_adcCore0_colGate_count_dwells
  assign WILL_FIRE_RL_adcCore0_colGate_count_dwells =
	     adcCore0_operateD$dD_OUT && adcCore0_acquireD$dD_OUT &&
	     !adcCore0_colGate_collectD ;
  // rule RL_adcCore0_spiI_start_cs
  assign WILL_FIRE_RL_adcCore0_spiI_start_cs =
	     NOT_adcCore0_spiI_reqF_head_wrapped__read__82__ETC___d1025 &&
	     !adcCore0_spiI_xmt_i &&
	     !adcCore0_spiI_xmt_d ;
  // rule RL_adcCore0_spiI_send_d
  assign WILL_FIRE_RL_adcCore0_spiI_send_d =
	     NOT_adcCore0_spiI_reqF_head_wrapped__read__82__ETC___d1025 &&
	     !adcCore0_spiI_reqF_dInReset$VAL &&
	     adcCore0_spiI_xmt_d ;
  // rule RL_adcCore0_spiI_send_i
  assign WILL_FIRE_RL_adcCore0_spiI_send_i =
	     NOT_adcCore0_spiI_reqF_head_wrapped__read__82__ETC___d1025 &&
	     !adcCore0_spiI_reqF_dInReset$VAL &&
	     adcCore0_spiI_xmt_i ;
  // rule RL_adcCore0_spiI_reqF_deq_update_head
  assign WILL_FIRE_RL_adcCore0_spiI_reqF_deq_update_head =
	     !adcCore0_spiI_reqF_dInReset$VAL &&
	     MUX_adcCore0_spiI_xmt_d$write_1__SEL_2 ;
  // rule RL_adcCore0_spiI_respF_enq_update_tail
  assign WILL_FIRE_RL_adcCore0_spiI_respF_enq_update_tail =
	     !adcCore0_spiI_respF_sInReset$VAL &&
	     adcCore0_spiI_respF_enq_pw$whas ;
  // rule RL_adcCore0_spiI_respF_deq_update_head
  assign WILL_FIRE_RL_adcCore0_spiI_respF_deq_update_head =
	     !adcCore0_spiI_respF_dInReset$VAL &&
	     MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2 ;
  // rule RL_adcCore0_iseqFsm_action_np
  assign WILL_FIRE_RL_adcCore0_iseqFsm_action_np =
	     !adcCore0_iseqFsm_jj_delay_count[12] &&
	     (adcCore0_iseqFsm_state_mkFSMstate == 4'd3 ||
	      adcCore0_iseqFsm_state_mkFSMstate == 4'd4) ;
  // rule RL_adcCore0_iseqFsm_action_l119c9
  assign WILL_FIRE_RL_adcCore0_iseqFsm_action_l119c9 =
	     adcCore0_spiI_reqF_head_wrapped_crossed__74_EQ_ETC___d1130 &&
	     adcCore0_iseqFsm_jj_delay_count[12] &&
	     (adcCore0_iseqFsm_state_mkFSMstate == 4'd3 ||
	      adcCore0_iseqFsm_state_mkFSMstate == 4'd4) ;
  // rule RL_adcCore0_iseqFsm_action_l120c9
  assign WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9 =
	     adcCore0_spiI_reqF_head_wrapped_crossed__74_EQ_ETC___d1130 &&
	     adcCore0_iseqFsm_state_mkFSMstate == 4'd5 ;
  // rule RL_adcCore0_iseqFsm_action_l121c9
  assign WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9 =
	     adcCore0_spiI_reqF_head_wrapped_crossed__74_EQ_ETC___d1130 &&
	     adcCore0_iseqFsm_state_mkFSMstate == 4'd6 ;
  // rule RL_adcCore0_iseqFsm_action_l122c9
  assign WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9 =
	     adcCore0_spiI_reqF_head_wrapped_crossed__74_EQ_ETC___d1130 &&
	     adcCore0_iseqFsm_state_mkFSMstate == 4'd7 ;
  // rule RL_adcCore0_iseqFsm_action_l123c9
  assign WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 =
	     adcCore0_spiI_reqF_head_wrapped_crossed__74_EQ_ETC___d1130 &&
	     adcCore0_iseqFsm_state_mkFSMstate == 4'd8 ;
  // rule RL_adcCore0_iseqFsm_action_l124c9
  assign WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9 =
	     adcCore0_spiI_reqF_head_wrapped_crossed__74_EQ_ETC___d1130 &&
	     adcCore0_iseqFsm_state_mkFSMstate == 4'd9 ;
  // rule RL_adcCore0_spiI_reqF_enq_update_tail
  assign WILL_FIRE_RL_adcCore0_spiI_reqF_enq_update_tail =
	     !adcCore0_spiI_reqF_sInReset$VAL &&
	     adcCore0_spiI_reqF_enq_pw$whas ;
  // rule RL_adcCore1_advance_spi_request
  assign WILL_FIRE_RL_adcCore1_advance_spi_request =
	     adcCore1_spiI_reqF_head_wrapped_crossed__621_E_ETC___d1777 &&
	     adcCore1_reqF$EMPTY_N &&
	     adcCore1_iseqFsm_abort_whas__727_AND_adcCore1__ETC___d1799 &&
	     !adcCore1_iseqFsm_start_reg ;
  // rule RL_adcCore1_colGate_send_timestamp_mesg
  assign WILL_FIRE_RL_adcCore1_colGate_send_timestamp_mesg =
	     adcCore1_colGate_sampF$FULL_N &&
	     adcCore1_colGate_timeMesg != 3'h6 &&
	     adcCore1_colGate_timeMesg != 3'h5 &&
	     adcCore1_operateD$dD_OUT &&
	     adcCore1_colGate_timeMesg != 3'd0 ;
  // rule RL_adcCore1_colGate_send_sync_mesg
  assign WILL_FIRE_RL_adcCore1_colGate_send_sync_mesg =
	     adcCore1_colGate_sampF$FULL_N && adcCore1_operateD$dD_OUT &&
	     adcCore1_colGate_syncMesg != 2'd0 &&
	     adcCore1_colGate_timeMesg == 3'd0 ;
  // rule RL_adcCore1_colGate_capture_collect
  assign WILL_FIRE_RL_adcCore1_colGate_capture_collect =
	     adcCore1_colGate_sampF$FULL_N &&
	     adcCore1_colGate_operatePW_whas__182_AND_adcCo_ETC___d1248 ;
  // rule RL_adcCore1_colGate_form_avg4_sample
  assign WILL_FIRE_RL_adcCore1_colGate_form_avg4_sample =
	     CASE_adcCore1_colGate_avgPhase_0b1_0_1_1_1_2_1_ETC__q5 &&
	     adcCore1_operateD$dD_OUT ;
  // rule RL_adcCore1_colGate_overrun_recovery
  assign WILL_FIRE_RL_adcCore1_colGate_overrun_recovery =
	     (adcCore1_colGate_ovrRecover != 4'd15 ||
	      adcCore1_colGate_sampF$FULL_N) &&
	     adcCore1_colGate_operatePW_whas__182_AND_adcCo_ETC___d1237 &&
	     adcCore1_colGate_ovrRecover != 4'd0 &&
	     !WILL_FIRE_RL_adcCore1_colGate_send_sync_mesg ;
  // rule RL_adcCore1_colGate_count_dropped_samples
  assign WILL_FIRE_RL_adcCore1_colGate_count_dropped_samples =
	     adcCore1_colGate_operatePW_whas__182_AND_adcCo_ETC___d1237 &&
	     adcCore1_colGate_sampActive &&
	     !adcCore1_colGate_sampF$FULL_N &&
	     !WILL_FIRE_RL_adcCore1_colGate_overrun_recovery ;
  // rule RL_adcCore1_colGate_count_dwells
  assign WILL_FIRE_RL_adcCore1_colGate_count_dwells =
	     adcCore1_operateD$dD_OUT && adcCore1_acquireD$dD_OUT &&
	     !adcCore1_colGate_collectD ;
  // rule RL_adcCore1_spiI_start_cs
  assign WILL_FIRE_RL_adcCore1_spiI_start_cs =
	     NOT_adcCore1_spiI_reqF_head_wrapped__read__629_ETC___d1672 &&
	     !adcCore1_spiI_xmt_i &&
	     !adcCore1_spiI_xmt_d ;
  // rule RL_adcCore1_spiI_send_d
  assign WILL_FIRE_RL_adcCore1_spiI_send_d =
	     NOT_adcCore1_spiI_reqF_head_wrapped__read__629_ETC___d1672 &&
	     !adcCore1_spiI_reqF_dInReset$VAL &&
	     adcCore1_spiI_xmt_d ;
  // rule RL_adcCore1_spiI_send_i
  assign WILL_FIRE_RL_adcCore1_spiI_send_i =
	     NOT_adcCore1_spiI_reqF_head_wrapped__read__629_ETC___d1672 &&
	     !adcCore1_spiI_reqF_dInReset$VAL &&
	     adcCore1_spiI_xmt_i ;
  // rule RL_adcCore1_spiI_reqF_deq_update_head
  assign WILL_FIRE_RL_adcCore1_spiI_reqF_deq_update_head =
	     !adcCore1_spiI_reqF_dInReset$VAL &&
	     MUX_adcCore1_spiI_xmt_d$write_1__SEL_2 ;
  // rule RL_adcCore1_spiI_respF_enq_update_tail
  assign WILL_FIRE_RL_adcCore1_spiI_respF_enq_update_tail =
	     !adcCore1_spiI_respF_sInReset$VAL &&
	     adcCore1_spiI_respF_enq_pw$whas ;
  // rule RL_adcCore1_spiI_respF_deq_update_head
  assign WILL_FIRE_RL_adcCore1_spiI_respF_deq_update_head =
	     !adcCore1_spiI_respF_dInReset$VAL && WILL_FIRE_RL_get_adc1_resp ;
  // rule RL_adcCore1_iseqFsm_action_np
  assign WILL_FIRE_RL_adcCore1_iseqFsm_action_np =
	     !adcCore1_iseqFsm_jj_delay_count[12] &&
	     (adcCore1_iseqFsm_state_mkFSMstate == 4'd3 ||
	      adcCore1_iseqFsm_state_mkFSMstate == 4'd4) ;
  // rule RL_adcCore1_iseqFsm_action_l119c9
  assign WILL_FIRE_RL_adcCore1_iseqFsm_action_l119c9 =
	     adcCore1_spiI_reqF_head_wrapped_crossed__621_E_ETC___d1777 &&
	     adcCore1_iseqFsm_jj_delay_count[12] &&
	     (adcCore1_iseqFsm_state_mkFSMstate == 4'd3 ||
	      adcCore1_iseqFsm_state_mkFSMstate == 4'd4) ;
  // rule RL_adcCore1_iseqFsm_action_l120c9
  assign WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9 =
	     adcCore1_spiI_reqF_head_wrapped_crossed__621_E_ETC___d1777 &&
	     adcCore1_iseqFsm_state_mkFSMstate == 4'd5 ;
  // rule RL_adcCore1_iseqFsm_action_l121c9
  assign WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9 =
	     adcCore1_spiI_reqF_head_wrapped_crossed__621_E_ETC___d1777 &&
	     adcCore1_iseqFsm_state_mkFSMstate == 4'd6 ;
  // rule RL_adcCore1_iseqFsm_action_l122c9
  assign WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9 =
	     adcCore1_spiI_reqF_head_wrapped_crossed__621_E_ETC___d1777 &&
	     adcCore1_iseqFsm_state_mkFSMstate == 4'd7 ;
  // rule RL_adcCore1_iseqFsm_action_l123c9
  assign WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 =
	     adcCore1_spiI_reqF_head_wrapped_crossed__621_E_ETC___d1777 &&
	     adcCore1_iseqFsm_state_mkFSMstate == 4'd8 ;
  // rule RL_adcCore1_iseqFsm_action_l124c9
  assign WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9 =
	     adcCore1_spiI_reqF_head_wrapped_crossed__621_E_ETC___d1777 &&
	     adcCore1_iseqFsm_state_mkFSMstate == 4'd9 ;
  // rule RL_adcCore1_spiI_reqF_enq_update_tail
  assign WILL_FIRE_RL_adcCore1_spiI_reqF_enq_update_tail =
	     !adcCore1_spiI_reqF_sInReset$VAL &&
	     adcCore1_spiI_reqF_enq_pw$whas ;
  // rule RL_wci_cfrd
  assign CAN_FIRE_RL_wci_cfrd =
	     wci_wslv_reqF$EMPTY_N &&
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b0 ||
	      IF_wci_wslv_reqF_i_notEmpty__4_AND_wci_wslv_re_ETC___d2447) &&
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b01 ||
	      wci_wslv_reqF$D_OUT[43:42] == 2'b10 ||
	      wci_wslv_reqF$D_OUT[43:42] == 2'b11 ||
	      wci_wslv_respF_c_r != 2'd2) &&
	     wci_wslv_wci_cfrd_pw$whas ;
  assign WILL_FIRE_RL_wci_cfrd =
	     CAN_FIRE_RL_wci_cfrd && !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_doMessage
  assign WILL_FIRE_RL_doMessage =
	     wsiM_reqFifo_c_r != 2'd2 &&
	     NOT_adcCore0_sampF_rRdPtr_rsCounter_59_EQ_adcC_ETC___d1909 &&
	     wci_wslv_cState == 3'd2 ;
  // rule RL_init_complete_ok
  assign WILL_FIRE_RL_init_complete_ok =
	     initOpInFlight_041_AND_adcCore0_iseqFsm_abort__ETC___d2110 &&
	     spiClk_iseqFsm_abort_whas__53_AND_spiClk_iseqF_ETC___d513 &&
	     !spiClk_iseqFsm_start_reg ;
  // rule RL_wci_ctrl_EiI
  assign WILL_FIRE_RL_wci_ctrl_EiI =
	     adcCore0_iseqFsm_abort_whas__080_AND_adcCore0__ETC___d1152 &&
	     !adcCore0_iseqFsm_start_reg &&
	     adcCore1_iseqFsm_abort_whas__727_AND_adcCore1__ETC___d2103 &&
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
  // rule RL_spiClk_iseqFsm_fsm_start
  assign WILL_FIRE_RL_spiClk_iseqFsm_fsm_start =
	     spiClk_iseqFsm_abort_whas__53_AND_spiClk_iseqF_ETC___d513 &&
	     spiClk_iseqFsm_start_reg ;
  // rule RL_spiClk_iseqFsm_action_l44c9
  assign WILL_FIRE_RL_spiClk_iseqFsm_action_l44c9 =
	     spiClk_spiI_reqF_head_wrapped_crossed__31_EQ_s_ETC___d2402 &&
	     spiClk_iseqFsm_start_wire$whas &&
	     (spiClk_iseqFsm_state_mkFSMstate == 4'd0 ||
	      spiClk_iseqFsm_state_mkFSMstate == 4'd7) &&
	     !WILL_FIRE_RL_wci_cfrd &&
	     !WILL_FIRE_RL_wci_cfwr ;
  // rule RL_spiClk_spiI_reqF_enq_update_tail
  assign WILL_FIRE_RL_spiClk_spiI_reqF_enq_update_tail =
	     !spiClk_spiI_reqF_sInReset$VAL && spiClk_spiI_reqF_enq_pw$whas ;
  // rule RL_spiClk_iseqFsm_idle_l43c3
  assign WILL_FIRE_RL_spiClk_iseqFsm_idle_l43c3 =
	     !spiClk_iseqFsm_start_wire$whas &&
	     spiClk_iseqFsm_state_mkFSMstate == 4'd7 ;
  // rule RL_adcCore0_iseqFsm_fsm_start
  assign WILL_FIRE_RL_adcCore0_iseqFsm_fsm_start =
	     adcCore0_iseqFsm_abort_whas__080_AND_adcCore0__ETC___d1152 &&
	     adcCore0_iseqFsm_start_reg ;
  // rule RL_adcCore0_iseqFsm_action_l116c12
  assign WILL_FIRE_RL_adcCore0_iseqFsm_action_l116c12 =
	     adcCore0_iseqFsm_start_wire$whas &&
	     (adcCore0_iseqFsm_state_mkFSMstate == 4'd0 ||
	      adcCore0_iseqFsm_state_mkFSMstate == 4'd10) ;
  // rule RL_adcCore0_iseqFsm_idle_l115c3
  assign WILL_FIRE_RL_adcCore0_iseqFsm_idle_l115c3 =
	     !adcCore0_iseqFsm_start_wire$whas &&
	     adcCore0_iseqFsm_state_mkFSMstate == 4'd10 ;
  // rule RL_adcCore1_iseqFsm_fsm_start
  assign WILL_FIRE_RL_adcCore1_iseqFsm_fsm_start =
	     adcCore1_iseqFsm_abort_whas__727_AND_adcCore1__ETC___d1799 &&
	     adcCore1_iseqFsm_start_reg ;
  // rule RL_adcCore1_iseqFsm_action_l116c12
  assign WILL_FIRE_RL_adcCore1_iseqFsm_action_l116c12 =
	     adcCore1_iseqFsm_start_wire$whas &&
	     (adcCore1_iseqFsm_state_mkFSMstate == 4'd0 ||
	      adcCore1_iseqFsm_state_mkFSMstate == 4'd10) ;
  // rule RL_adcCore1_iseqFsm_idle_l115c3
  assign WILL_FIRE_RL_adcCore1_iseqFsm_idle_l115c3 =
	     !adcCore1_iseqFsm_start_wire$whas &&
	     adcCore1_iseqFsm_state_mkFSMstate == 4'd10 ;
  // rule RL_wsiM_reqFifo_deq
  assign WILL_FIRE_RL_wsiM_reqFifo_deq =
	     wsiM_reqFifo_c_r != 2'd0 && !wsiM_sThreadBusy_d ;
  // rule RL_wsiM_reqFifo_incCtr
  assign WILL_FIRE_RL_wsiM_reqFifo_incCtr =
	     ((wsiM_reqFifo_c_r == 2'd0) ?
		WILL_FIRE_RL_doMessage :
		wsiM_reqFifo_c_r != 2'd1 || WILL_FIRE_RL_doMessage) &&
	     WILL_FIRE_RL_doMessage &&
	     !WILL_FIRE_RL_wsiM_reqFifo_deq ;
  // rule RL_wsiM_reqFifo_decCtr
  assign WILL_FIRE_RL_wsiM_reqFifo_decCtr =
	     WILL_FIRE_RL_wsiM_reqFifo_deq && !WILL_FIRE_RL_doMessage ;
  // rule RL_wsiM_reqFifo_both
  assign WILL_FIRE_RL_wsiM_reqFifo_both =
	     ((wsiM_reqFifo_c_r == 2'd1) ?
		WILL_FIRE_RL_doMessage :
		wsiM_reqFifo_c_r != 2'd2 || WILL_FIRE_RL_doMessage) &&
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     WILL_FIRE_RL_doMessage ;
  // inputs to muxes for submodule ports
  assign MUX_adcCore0_colGate_dwellFails$write_1__SEL_1 =
	     WILL_FIRE_RL_adcCore0_colGate_count_dropped_samples &&
	     adcCore0_colGate_ovrRecover == 4'd0 ;
  assign MUX_adcCore0_colGate_sampF$enq_1__SEL_1 =
	     WILL_FIRE_RL_adcCore0_colGate_overrun_recovery &&
	     adcCore0_colGate_ovrRecover == 4'd15 ;
  assign MUX_adcCore0_reqF$enq_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr &&
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	      wci_wslv_reqF$D_OUT[39:32] == 8'h28 ||
	      wci_wslv_reqF$D_OUT[43:42] == 2'b01) ;
  assign MUX_adcCore0_spiI_xmt_d$write_1__SEL_2 =
	     WILL_FIRE_RL_adcCore0_spiI_send_d && adcCore0_spiI_dPos == 3'd0 ;
  assign MUX_adcCore1_colGate_dwellFails$write_1__SEL_1 =
	     WILL_FIRE_RL_adcCore1_colGate_count_dropped_samples &&
	     adcCore1_colGate_ovrRecover == 4'd0 ;
  assign MUX_adcCore1_colGate_sampF$enq_1__SEL_1 =
	     WILL_FIRE_RL_adcCore1_colGate_overrun_recovery &&
	     adcCore1_colGate_ovrRecover == 4'd15 ;
  assign MUX_adcCore1_reqF$enq_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr &&
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	      wci_wslv_reqF$D_OUT[39:32] == 8'h2C ||
	      wci_wslv_reqF$D_OUT[43:42] == 2'b10) ;
  assign MUX_adcCore1_spiI_xmt_d$write_1__SEL_2 =
	     WILL_FIRE_RL_adcCore1_spiI_send_d && adcCore1_spiI_dPos == 3'd0 ;
  assign MUX_spiClk_spiI_reqS$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr &&
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	      wci_wslv_reqF$D_OUT[39:32] == 8'h24 ||
	      wci_wslv_reqF$D_OUT[43:42] == 2'b11) ;
  assign MUX_spiClk_spiI_reqS$write_1__SEL_2 =
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[43:42] == 2'b11 ;
  assign MUX_spiClk_spiI_xmt_d$write_1__SEL_2 =
	     WILL_FIRE_RL_spiClk_spiI_send_d && spiClk_spiI_dPos == 3'd0 ;
  assign MUX_splitReadInFlight$write_1__PSEL_1 =
	     WILL_FIRE_RL_get_adc1_resp ||
	     MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2 ||
	     MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1 ;
  assign MUX_splitReadInFlight$write_1__SEL_1 =
	     MUX_splitReadInFlight$write_1__PSEL_1 && splitReadInFlight ;
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
  assign MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1 =
	     CAN_FIRE_RL_get_adx_resp &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__SEL_1 =
	     MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1 && splitReadInFlight ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2 =
	     CAN_FIRE_RL_get_adc0_resp &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__SEL_2 =
	     MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2 && splitReadInFlight ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__SEL_3 =
	     WILL_FIRE_RL_get_adc1_resp && splitReadInFlight ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__SEL_4 =
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[43:42] == 2'b0 ;
  assign MUX_wsiM_reqFifo_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ;
  assign MUX_adcCore0_colGate_dropCount$write_1__VAL_1 =
	     adcCore0_colGate_dropCount + 32'd1 ;
  assign MUX_adcCore0_colGate_dwellFails$write_1__VAL_1 =
	     adcCore0_colGate_dwellFails + 32'd1 ;
  assign MUX_adcCore0_colGate_dwellStarts$write_1__VAL_1 =
	     adcCore0_colGate_dwellStarts + 32'd1 ;
  assign MUX_adcCore0_colGate_ovrRecover$write_1__VAL_2 =
	     adcCore0_colGate_ovrRecover - 4'd1 ;
  assign MUX_adcCore0_colGate_sampCount$write_1__VAL_1 =
	     adcCore0_colGate_sampCount + 32'd1 ;
  assign MUX_adcCore0_colGate_sampF$enq_1__VAL_1 =
	     { 7'd31, adcCore0_colGate_sampDataWD } ;
  assign MUX_adcCore0_colGate_sampF$enq_1__VAL_2 =
	     { 2'd2,
	       adcCore0_colGate_timeMesg == 3'h1,
	       4'd15,
	       x1_data__h35585 } ;
  assign MUX_adcCore0_colGate_sampF$enq_1__VAL_3 =
	     { 2'd0,
	       adcCore0_colGate_uprollCnt_04_EQ_adcCore0_colG_ETC___d2230,
	       4'd15,
	       d_data__h35985 } ;
  assign MUX_adcCore0_colGate_syncMesg$write_1__VAL_1 =
	     adcCore0_colGate_syncMesg - 2'd1 ;
  assign MUX_adcCore0_colGate_timeMesg$write_1__VAL_1 =
	     adcCore0_colGate_timeMesg - 3'd1 ;
  assign MUX_adcCore0_colGate_uprollCnt$write_1__VAL_2 =
	     adcCore0_colGate_uprollCnt_04_EQ_adcCore0_colG_ETC___d2230 ?
	       16'd0 :
	       adcCore0_colGate_uprollCnt + 16'd1 ;
  assign MUX_adcCore0_iseqFsm_jj_delay_count$write_1__VAL_1 =
	     { adcCore0_iseqFsm_jj_delay_count[11:0], 1'd0 } ;
  assign MUX_adcCore0_reqF$enq_1__VAL_1 =
	     { wci_wslv_reqF$D_OUT[43:42] == 2'b0 && wci_wslv_reqF$D_OUT[31],
	       (wci_wslv_reqF$D_OUT[43:42] == 2'b0) ?
		 wci_wslv_reqF$D_OUT[15:0] :
		 { wci_wslv_reqF$D_OUT[41:34], wci_wslv_reqF$D_OUT[7:0] } } ;
  assign MUX_adcCore0_reqF$enq_1__VAL_2 =
	     { 1'd1, wci_wslv_reqF$D_OUT[41:34], 8'd0 } ;
  assign MUX_adcCore0_sampF_rRdPtr_rsCounter$write_1__VAL_1 =
	     (~adcCore0_sampF_rRdPtr_rsCounter[IF_adcCore0_sampF_rRdPtr_rsCounter_59_BIT_0_66_ETC___d2461[3:0]]) ?
	       adcCore0_sampF_rRdPtr_rsCounter | x__h40881 :
	       adcCore0_sampF_rRdPtr_rsCounter & y__h41768 ;
  assign MUX_adcCore0_sampF_rWrPtr_rsCounter$write_1__VAL_1 =
	     (~adcCore0_sampF_rWrPtr_rsCounter[IF_adcCore0_sampF_rWrPtr_rsCounter_90_BIT_0_97_ETC___d2458[3:0]]) ?
	       adcCore0_sampF_rWrPtr_rsCounter | x__h38579 :
	       adcCore0_sampF_rWrPtr_rsCounter & y__h39466 ;
  assign MUX_adcCore0_spiI_dPos$write_1__VAL_1 =
	     (adcCore0_spiI_dPos == 3'd0) ?
	       adcCore0_spiI_dPos :
	       adcCore0_spiI_dPos - 3'd1 ;
  assign MUX_adcCore0_spiI_iPos$write_1__VAL_1 =
	     (adcCore0_spiI_iPos == 4'd0) ?
	       adcCore0_spiI_iPos :
	       adcCore0_spiI_iPos - 4'd1 ;
  assign MUX_adcCore0_spiI_reqS$write_1__VAL_1 =
	     (adcCore0_reqF$D_OUT[16] && !adcCore0_readMode) ?
	       17'd1 :
	       ((!adcCore0_reqF$D_OUT[16] && adcCore0_readMode) ?
		  17'd0 :
		  adcCore0_reqF$D_OUT) ;
  assign MUX_adcCore0_spiI_sdoR_1$wset_1__VAL_1 =
	     adcCore0_spiI_reqS_BITS_15_TO_8__q6[adcCore0_spiI_iPos[2:0]] ;
  assign MUX_adcCore0_spiI_sdoR_1$wset_1__VAL_2 =
	     adcCore0_spiI_reqS_BITS_7_TO_0__q7[adcCore0_spiI_dPos] ;
  assign MUX_adcCore1_colGate_dropCount$write_1__VAL_1 =
	     adcCore1_colGate_dropCount + 32'd1 ;
  assign MUX_adcCore1_colGate_dwellFails$write_1__VAL_1 =
	     adcCore1_colGate_dwellFails + 32'd1 ;
  assign MUX_adcCore1_colGate_dwellStarts$write_1__VAL_1 =
	     adcCore1_colGate_dwellStarts + 32'd1 ;
  assign MUX_adcCore1_colGate_ovrRecover$write_1__VAL_2 =
	     adcCore1_colGate_ovrRecover - 4'd1 ;
  assign MUX_adcCore1_colGate_sampCount$write_1__VAL_1 =
	     adcCore1_colGate_sampCount + 32'd1 ;
  assign MUX_adcCore1_colGate_sampF$enq_1__VAL_1 =
	     { 7'd31, adcCore1_colGate_sampDataWD } ;
  assign MUX_adcCore1_colGate_sampF$enq_1__VAL_2 =
	     { 2'd2,
	       adcCore1_colGate_timeMesg == 3'h1,
	       4'd15,
	       x1_data__h81295 } ;
  assign MUX_adcCore1_colGate_sampF$enq_1__VAL_3 =
	     { 2'd0,
	       adcCore1_colGate_uprollCnt_251_EQ_adcCore1_col_ETC___d2234,
	       4'd15,
	       d_data__h81695 } ;
  assign MUX_adcCore1_colGate_syncMesg$write_1__VAL_1 =
	     adcCore1_colGate_syncMesg - 2'd1 ;
  assign MUX_adcCore1_colGate_timeMesg$write_1__VAL_1 =
	     adcCore1_colGate_timeMesg - 3'd1 ;
  assign MUX_adcCore1_colGate_uprollCnt$write_1__VAL_2 =
	     adcCore1_colGate_uprollCnt_251_EQ_adcCore1_col_ETC___d2234 ?
	       16'd0 :
	       adcCore1_colGate_uprollCnt + 16'd1 ;
  assign MUX_adcCore1_iseqFsm_jj_delay_count$write_1__VAL_1 =
	     { adcCore1_iseqFsm_jj_delay_count[11:0], 1'd0 } ;
  assign MUX_adcCore1_sampF_rWrPtr_rsCounter$write_1__VAL_1 =
	     (~adcCore1_sampF_rWrPtr_rsCounter[IF_adcCore1_sampF_rWrPtr_rsCounter_337_BIT_0_3_ETC___d2467[3:0]]) ?
	       adcCore1_sampF_rWrPtr_rsCounter | x__h84289 :
	       adcCore1_sampF_rWrPtr_rsCounter & y__h85176 ;
  assign MUX_adcCore1_spiI_dPos$write_1__VAL_1 =
	     (adcCore1_spiI_dPos == 3'd0) ?
	       adcCore1_spiI_dPos :
	       adcCore1_spiI_dPos - 3'd1 ;
  assign MUX_adcCore1_spiI_iPos$write_1__VAL_1 =
	     (adcCore1_spiI_iPos == 4'd0) ?
	       adcCore1_spiI_iPos :
	       adcCore1_spiI_iPos - 4'd1 ;
  assign MUX_adcCore1_spiI_reqS$write_1__VAL_1 =
	     (adcCore1_reqF$D_OUT[16] && !adcCore1_readMode) ?
	       17'd1 :
	       ((!adcCore1_reqF$D_OUT[16] && adcCore1_readMode) ?
		  17'd0 :
		  adcCore1_reqF$D_OUT) ;
  assign MUX_adcCore1_spiI_sdoR_1$wset_1__VAL_1 =
	     adcCore1_spiI_reqS_BITS_15_TO_8__q9[adcCore1_spiI_iPos[2:0]] ;
  assign MUX_adcCore1_spiI_sdoR_1$wset_1__VAL_2 =
	     adcCore1_spiI_reqS_BITS_7_TO_0__q8[adcCore1_spiI_dPos] ;
  assign MUX_fcAdc_grayCounter_rsCounter$write_1__VAL_1 =
	     (~fcAdc_grayCounter_rsCounter[IF_fcAdc_grayCounter_rsCounter_60_BIT_0_67_XOR_ETC___d2455[4:0]]) ?
	       fcAdc_grayCounter_rsCounter | x__h7511 :
	       fcAdc_grayCounter_rsCounter & y__h8916 ;
  assign MUX_oneKHz_value$write_1__VAL_1 =
	     (oneKHz_value == 18'd124999) ? 18'd0 : oneKHz_value + 18'd1 ;
  assign MUX_spiClk_spiI_dPos$write_1__VAL_1 =
	     (spiClk_spiI_dPos == 3'd0) ?
	       spiClk_spiI_dPos :
	       spiClk_spiI_dPos - 3'd1 ;
  assign MUX_spiClk_spiI_iPos$write_1__VAL_1 =
	     (spiClk_spiI_iPos == 4'd0) ?
	       spiClk_spiI_iPos :
	       spiClk_spiI_iPos - 4'd1 ;
  assign MUX_spiClk_spiI_sdoR_1$wset_1__VAL_1 =
	     (spiClk_spiI_iPos == 4'd15) ?
	       spiClk_spiI_reqS[16] :
	       spiClk_spiI_iPos != 4'd14 && spiClk_spiI_iPos != 4'd13 &&
	       (spiClk_spiI_iPos_89_ULT_7___d2219 ||
		!spiClk_spiI_iPos_89_ULE_12___d2220) &&
	       x__h17146 ;
  assign MUX_spiClk_spiI_sdoR_1$wset_1__VAL_2 =
	     spiClk_spiI_reqS_BITS_7_TO_0__q10[spiClk_spiI_dPos] ;
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
	  MUX_wci_wslv_respF_x_wire$wset_1__SEL_3 or
	  MUX_wci_wslv_respF_x_wire$wset_1__VAL_3 or
	  MUX_wci_wslv_respF_x_wire$wset_1__SEL_4 or
	  MUX_wci_wslv_respF_x_wire$wset_1__VAL_4 or
	  WILL_FIRE_RL_wci_wslv_ctl_op_complete or
	  MUX_wci_wslv_respF_x_wire$wset_1__VAL_5 or WILL_FIRE_RL_wci_cfwr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_wslv_respF_x_wire$wset_1__SEL_1:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_1;
      MUX_wci_wslv_respF_x_wire$wset_1__SEL_2:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_2;
      MUX_wci_wslv_respF_x_wire$wset_1__SEL_3:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_3;
      MUX_wci_wslv_respF_x_wire$wset_1__SEL_4:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_4;
      WILL_FIRE_RL_wci_wslv_ctl_op_complete:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_5;
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
	     { 26'd16777216, spiClk_spiI_respS } ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__VAL_2 =
	     { 26'd16777216, adcCore0_spiI_respS } ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__VAL_3 =
	     { 26'd16777216, adcCore1_spiI_respS } ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__VAL_4 = { 2'd1, rdat__h131371 } ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__VAL_5 =
	     wci_wslv_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_1 = wsiM_reqFifo_c_r + 2'd1 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_2 = wsiM_reqFifo_c_r - 2'd1 ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_1 =
	     (wsiM_reqFifo_c_r == 2'd1) ?
	       MUX_wsiM_reqFifo_q_1$write_1__VAL_2 :
	       wsiM_reqFifo_q_1 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__VAL_1 =
	     (wsiM_reqFifo_c_r == 2'd2) ?
	       MUX_wsiM_reqFifo_q_1$write_1__VAL_2 :
	       61'h00000AAAAAAAAA00 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__VAL_2 =
	     { 3'd1,
	       adcCore0_sampF_memory$DOB[36],
	       1'd0,
	       x_burstLength__h128706,
	       adcCore0_sampF_memory$DOB[31:0],
	       10'd960,
	       adcCore0_sampF_memory$DOB[38:37] } ;
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
	     MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1 && splitReadInFlight ||
	     MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2 && splitReadInFlight ||
	     WILL_FIRE_RL_get_adc1_resp && splitReadInFlight ||
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[43:42] == 2'b0 ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete ||
	     WILL_FIRE_RL_wci_cfwr ;
  assign wci_wslv_wEdge$wget = wci_wslv_reqF$D_OUT[36:34] ;
  assign wci_wslv_wEdge$whas = WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_sFlagReg_1$wget = 1'd1 ;
  assign wci_wslv_sFlagReg_1$whas = sFlagState ;
  assign wci_wslv_ctlAckReg_1$wget = 1'd1 ;
  assign wci_wslv_ctlAckReg_1$whas =
	     WILL_FIRE_RL_init_complete_ok || WILL_FIRE_RL_wci_ctrl_OrE ||
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
  assign fcAdc_pulseAction_1$wget = 1'd1 ;
  assign fcAdc_pulseAction_1$whas = oneKHz_value == 18'd124999 ;
  assign spiClk_spiI_cGate_1$wget = 1'd1 ;
  assign spiClk_spiI_cGate_1$whas =
	     WILL_FIRE_RL_spiClk_spiI_send_i ||
	     WILL_FIRE_RL_spiClk_spiI_send_d ;
  assign spiClk_spiI_sdoR_1$wget =
	     WILL_FIRE_RL_spiClk_spiI_send_i ?
	       MUX_spiClk_spiI_sdoR_1$wset_1__VAL_1 :
	       MUX_spiClk_spiI_sdoR_1$wset_1__VAL_2 ;
  assign spiClk_spiI_sdoR_1$whas =
	     WILL_FIRE_RL_spiClk_spiI_send_d ||
	     WILL_FIRE_RL_spiClk_spiI_send_i ;
  assign spiClk_spiI_csbR_1$wget = 1'b0 ;
  assign spiClk_spiI_csbR_1$whas = spiClk_spiI_cGate_1$whas ;
  assign spiClk_spiI_doResp_1$wget = spiClk_spiI_reqS[16] ;
  assign spiClk_spiI_doResp_1$whas = MUX_spiClk_spiI_xmt_d$write_1__SEL_2 ;
  assign spiClk_iseqFsm_start_wire$wget = 1'd1 ;
  assign spiClk_iseqFsm_start_wire$whas =
	     WILL_FIRE_RL_spiClk_iseqFsm_fsm_start ||
	     spiClk_iseqFsm_start_reg_1 && !spiClk_iseqFsm_state_fired ;
  assign spiClk_iseqFsm_start_reg_1_1$wget = 1'd1 ;
  assign spiClk_iseqFsm_start_reg_1_1$whas = spiClk_iseqFsm_start_wire$whas ;
  assign spiClk_iseqFsm_abort$wget = 1'b0 ;
  assign spiClk_iseqFsm_abort$whas = 1'b0 ;
  assign spiClk_iseqFsm_state_fired_1$wget = 1'd1 ;
  assign spiClk_iseqFsm_state_fired_1$whas =
	     spiClk_iseqFsm_state_set_pw$whas ;
  assign adcCore0_ddrC_psCmdReg_1$wget = wci_wslv_reqF$D_OUT[1:0] ;
  assign adcCore0_ddrC_psCmdReg_1$whas =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h48 ;
  assign adcCore0_colGate_average_dw$wget = 1'd1 ;
  assign adcCore0_colGate_average_dw$whas = adcCore0_averageD$dD_OUT ;
  assign adcCore0_colGate_sampActive_1$wget = 1'd1 ;
  assign adcCore0_colGate_sampActive_1$whas = 1'd1 ;
  assign adcCore0_colGate_nowW$wget = wti_nowReq[63:0] ;
  assign adcCore0_colGate_nowW$whas = 1'd1 ;
  assign adcCore0_colGate_maxBurstLenW$wget =
	     adcCore0_maxBurstLengthR$dD_OUT ;
  assign adcCore0_colGate_maxBurstLenW$whas = 1'd1 ;
  assign adcCore0_colGate_sampDataW$wget = adcCore0_samp ;
  assign adcCore0_colGate_sampDataW$whas = 1'd1 ;
  assign adcCore0_operateDReg_1$wget = 1'd1 ;
  assign adcCore0_operateDReg_1$whas = wci_wslv_cState == 3'd2 ;
  assign adcCore0_acquireDReg_1$wget = 1'd1 ;
  assign adcCore0_acquireDReg_1$whas =
	     wci_wslv_cState == 3'd2 && !adcControl[0] &&
	     (!adcControl[3] || overflowCountD == 32'd0) ;
  assign adcCore0_averageDReg_1$wget = 1'd1 ;
  assign adcCore0_averageDReg_1$whas =
	     wci_wslv_cState == 3'd2 && adcControl[4] ;
  assign adcCore0_sampF_wDataIn$wget = adcCore0_colGate_sampF$D_OUT ;
  assign adcCore0_sampF_wDataIn$whas = adcCore0_sampF_pwEnqueue$whas ;
  assign adcCore0_sampF_wDataOut$wget = adcCore0_sampF_memory$DOB ;
  assign adcCore0_sampF_wDataOut$whas = 1'd1 ;
  assign adcCore0_nowW$wget = wti_nowReq[63:0] ;
  assign adcCore0_nowW$whas = 1'd1 ;
  assign adcCore0_spiI_cGate_1$wget = 1'd1 ;
  assign adcCore0_spiI_cGate_1$whas =
	     WILL_FIRE_RL_adcCore0_spiI_send_i ||
	     WILL_FIRE_RL_adcCore0_spiI_send_d ;
  assign adcCore0_spiI_sdoR_1$wget =
	     WILL_FIRE_RL_adcCore0_spiI_send_i ?
	       MUX_adcCore0_spiI_sdoR_1$wset_1__VAL_1 :
	       MUX_adcCore0_spiI_sdoR_1$wset_1__VAL_2 ;
  assign adcCore0_spiI_sdoR_1$whas = adcCore0_spiI_cGate_1$whas ;
  assign adcCore0_spiI_csbR_1$wget = 1'b0 ;
  assign adcCore0_spiI_csbR_1$whas = adcCore0_spiI_cGate_1$whas ;
  assign adcCore0_spiI_doResp_1$wget = adcCore0_spiI_reqS[16] ;
  assign adcCore0_spiI_doResp_1$whas =
	     MUX_adcCore0_spiI_xmt_d$write_1__SEL_2 ;
  assign adcCore0_adcRst_1$wget = 1'd1 ;
  assign adcCore0_adcRst_1$whas =
	     adcCore0_iseqFsm_state_mkFSMstate == 4'd1 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l116c12 ;
  assign adcCore0_iseqFsm_start_wire$wget = 1'd1 ;
  assign adcCore0_iseqFsm_start_wire$whas =
	     WILL_FIRE_RL_adcCore0_iseqFsm_fsm_start ||
	     adcCore0_iseqFsm_start_reg_1 && !adcCore0_iseqFsm_state_fired ;
  assign adcCore0_iseqFsm_start_reg_1_1$wget = 1'd1 ;
  assign adcCore0_iseqFsm_start_reg_1_1$whas =
	     adcCore0_iseqFsm_start_wire$whas ;
  assign adcCore0_iseqFsm_abort$wget = 1'b0 ;
  assign adcCore0_iseqFsm_abort$whas = 1'b0 ;
  assign adcCore0_iseqFsm_state_fired_1$wget = 1'd1 ;
  assign adcCore0_iseqFsm_state_fired_1$whas =
	     adcCore0_iseqFsm_state_set_pw$whas ;
  assign adcCore1_ddrC_psCmdReg_1$wget = wci_wslv_reqF$D_OUT[1:0] ;
  assign adcCore1_ddrC_psCmdReg_1$whas =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h4C ;
  assign adcCore1_colGate_average_dw$wget = 1'd1 ;
  assign adcCore1_colGate_average_dw$whas = adcCore1_averageD$dD_OUT ;
  assign adcCore1_colGate_sampActive_1$wget = 1'd1 ;
  assign adcCore1_colGate_sampActive_1$whas = 1'd1 ;
  assign adcCore1_colGate_nowW$wget = 64'h0 ;
  assign adcCore1_colGate_nowW$whas = 1'b0 ;
  assign adcCore1_colGate_maxBurstLenW$wget =
	     adcCore1_maxBurstLengthR$dD_OUT ;
  assign adcCore1_colGate_maxBurstLenW$whas = 1'd1 ;
  assign adcCore1_colGate_sampDataW$wget = adcCore1_samp ;
  assign adcCore1_colGate_sampDataW$whas = 1'd1 ;
  assign adcCore1_operateDReg_1$wget = 1'b0 ;
  assign adcCore1_operateDReg_1$whas = 1'b0 ;
  assign adcCore1_acquireDReg_1$wget = 1'b0 ;
  assign adcCore1_acquireDReg_1$whas = 1'b0 ;
  assign adcCore1_averageDReg_1$wget = 1'b0 ;
  assign adcCore1_averageDReg_1$whas = 1'b0 ;
  assign adcCore1_sampF_wDataIn$wget = adcCore1_colGate_sampF$D_OUT ;
  assign adcCore1_sampF_wDataIn$whas = adcCore1_sampF_pwEnqueue$whas ;
  assign adcCore1_sampF_wDataOut$wget = adcCore1_sampF_memory$DOB ;
  assign adcCore1_sampF_wDataOut$whas = 1'd1 ;
  assign adcCore1_nowW$wget = 64'h0 ;
  assign adcCore1_nowW$whas = 1'b0 ;
  assign adcCore1_spiI_cGate_1$wget = 1'd1 ;
  assign adcCore1_spiI_cGate_1$whas =
	     WILL_FIRE_RL_adcCore1_spiI_send_i ||
	     WILL_FIRE_RL_adcCore1_spiI_send_d ;
  assign adcCore1_spiI_sdoR_1$wget =
	     WILL_FIRE_RL_adcCore1_spiI_send_i ?
	       MUX_adcCore1_spiI_sdoR_1$wset_1__VAL_1 :
	       MUX_adcCore1_spiI_sdoR_1$wset_1__VAL_2 ;
  assign adcCore1_spiI_sdoR_1$whas = adcCore1_spiI_cGate_1$whas ;
  assign adcCore1_spiI_csbR_1$wget = 1'b0 ;
  assign adcCore1_spiI_csbR_1$whas = adcCore1_spiI_cGate_1$whas ;
  assign adcCore1_spiI_doResp_1$wget = adcCore1_spiI_reqS[16] ;
  assign adcCore1_spiI_doResp_1$whas =
	     MUX_adcCore1_spiI_xmt_d$write_1__SEL_2 ;
  assign adcCore1_adcRst_1$wget = 1'd1 ;
  assign adcCore1_adcRst_1$whas =
	     adcCore1_iseqFsm_state_mkFSMstate == 4'd1 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l116c12 ;
  assign adcCore1_iseqFsm_start_wire$wget = 1'd1 ;
  assign adcCore1_iseqFsm_start_wire$whas =
	     WILL_FIRE_RL_adcCore1_iseqFsm_fsm_start ||
	     adcCore1_iseqFsm_start_reg_1 && !adcCore1_iseqFsm_state_fired ;
  assign adcCore1_iseqFsm_start_reg_1_1$wget = 1'd1 ;
  assign adcCore1_iseqFsm_start_reg_1_1$whas =
	     adcCore1_iseqFsm_start_wire$whas ;
  assign adcCore1_iseqFsm_abort$wget = 1'b0 ;
  assign adcCore1_iseqFsm_abort$whas = 1'b0 ;
  assign adcCore1_iseqFsm_state_fired_1$wget = 1'd1 ;
  assign adcCore1_iseqFsm_state_fired_1$whas =
	     adcCore1_iseqFsm_state_set_pw$whas ;
  assign wti_wtiReq$wget = 67'h0 ;
  assign wti_wtiReq$whas = 1'b0 ;
  assign wti_operateD_1$wget = 1'b0 ;
  assign wti_operateD_1$whas = 1'b0 ;
  assign wsiM_reqFifo_x_wire$wget = MUX_wsiM_reqFifo_q_1$write_1__VAL_2 ;
  assign wsiM_reqFifo_x_wire$whas = WILL_FIRE_RL_doMessage ;
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
	     (WILL_FIRE_RL_get_adc1_resp ||
	      MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2 ||
	      MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1) &&
	     splitReadInFlight ||
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[43:42] == 2'b0 ||
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
  assign spiClk_spiI_reqF_enq_pw$whas =
	     WILL_FIRE_RL_wci_cfwr &&
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	      wci_wslv_reqF$D_OUT[39:32] == 8'h24 ||
	      wci_wslv_reqF$D_OUT[43:42] == 2'b11) ||
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[43:42] == 2'b11 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l48c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l47c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l46c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l45c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l44c9 ;
  assign spiClk_spiI_reqF_deq_pw$whas = MUX_spiClk_spiI_xmt_d$write_1__SEL_2 ;
  assign spiClk_spiI_reqF_sClear_pw$whas = 1'b0 ;
  assign spiClk_spiI_reqF_dClear_pw$whas = 1'b0 ;
  assign spiClk_spiI_reqF_deq_happened$whas = 1'b0 ;
  assign spiClk_spiI_respF_enq_pw$whas =
	     spiClk_spiI_respF_head_wrapped ==
	     spiClk_spiI_respF_tail_wrapped &&
	     !spiClk_spiI_respF_sInReset$VAL &&
	     spiClk_spiI_doResp ;
  assign spiClk_spiI_respF_deq_pw$whas =
	     MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1 ;
  assign spiClk_spiI_respF_sClear_pw$whas = 1'b0 ;
  assign spiClk_spiI_respF_dClear_pw$whas = 1'b0 ;
  assign spiClk_spiI_respF_deq_happened$whas = 1'b0 ;
  assign spiClk_iseqFsm_state_set_pw$whas =
	     WILL_FIRE_RL_spiClk_iseqFsm_idle_l43c3 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l48c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l47c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l46c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l45c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l44c9 ;
  assign spiClk_iseqFsm_state_overlap_pw$whas = 1'b0 ;
  assign adcCore0_colGate_operatePW$whas = adcCore0_operateD$dD_OUT ;
  assign adcCore0_colGate_collectPW$whas = adcCore0_acquireD$dD_OUT ;
  assign adcCore0_colGate_enaSyncPW$whas = 1'b0 ;
  assign adcCore0_colGate_enaTimestampPW$whas = 1'b0 ;
  assign adcCore0_sampF_rWrPtr_pwIncrement$whas =
	     adcCore0_sampF_pwEnqueue$whas ;
  assign adcCore0_sampF_rWrPtr_pwDecrement$whas = 1'b0 ;
  assign adcCore0_sampF_rRdPtr_pwIncrement$whas =
	     adcCore0_sampF_pwDequeue$whas ;
  assign adcCore0_sampF_rRdPtr_pwDecrement$whas = 1'b0 ;
  assign adcCore0_sampF_pwDequeue$whas =
	     NOT_adcCore0_sampF_rRdPtr_rsCounter_59_EQ_adcC_ETC___d1909 &&
	     wci_wslv_cState != 3'd2 ||
	     WILL_FIRE_RL_doMessage ;
  assign adcCore0_sampF_pwEnqueue$whas =
	     adcCore0_colGate_sampF$EMPTY_N &&
	     adcCore0_colGate_sampF_RDY_first__04_AND_NOT_a_ETC___d961 ;
  assign adcCore0_spiI_reqF_enq_pw$whas =
	     WILL_FIRE_RL_adcCore0_advance_spi_request ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l119c9 ;
  assign adcCore0_spiI_reqF_deq_pw$whas =
	     MUX_adcCore0_spiI_xmt_d$write_1__SEL_2 ;
  assign adcCore0_spiI_reqF_sClear_pw$whas = 1'b0 ;
  assign adcCore0_spiI_reqF_dClear_pw$whas = 1'b0 ;
  assign adcCore0_spiI_reqF_deq_happened$whas = 1'b0 ;
  assign adcCore0_spiI_respF_enq_pw$whas =
	     adcCore0_spiI_respF_head_wrapped ==
	     adcCore0_spiI_respF_tail_wrapped &&
	     !adcCore0_spiI_respF_sInReset$VAL &&
	     adcCore0_spiI_doResp ;
  assign adcCore0_spiI_respF_deq_pw$whas =
	     MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2 ;
  assign adcCore0_spiI_respF_sClear_pw$whas = 1'b0 ;
  assign adcCore0_spiI_respF_dClear_pw$whas = 1'b0 ;
  assign adcCore0_spiI_respF_deq_happened$whas = 1'b0 ;
  assign adcCore0_iseqFsm_state_set_pw$whas =
	     WILL_FIRE_RL_adcCore0_iseqFsm_idle_l115c3 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l119c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_np ||
	     adcCore0_iseqFsm_state_mkFSMstate == 4'd2 ||
	     adcCore0_iseqFsm_state_mkFSMstate == 4'd1 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l116c12 ;
  assign adcCore0_iseqFsm_state_overlap_pw$whas = 1'b0 ;
  assign adcCore1_colGate_operatePW$whas = adcCore1_operateD$dD_OUT ;
  assign adcCore1_colGate_collectPW$whas = adcCore1_acquireD$dD_OUT ;
  assign adcCore1_colGate_enaSyncPW$whas = 1'b0 ;
  assign adcCore1_colGate_enaTimestampPW$whas = 1'b0 ;
  assign adcCore1_sampF_rWrPtr_pwIncrement$whas =
	     adcCore1_sampF_pwEnqueue$whas ;
  assign adcCore1_sampF_rWrPtr_pwDecrement$whas = 1'b0 ;
  assign adcCore1_sampF_rRdPtr_pwIncrement$whas = 1'b0 ;
  assign adcCore1_sampF_rRdPtr_pwDecrement$whas = 1'b0 ;
  assign adcCore1_sampF_pwDequeue$whas = 1'b0 ;
  assign adcCore1_sampF_pwEnqueue$whas =
	     adcCore1_colGate_sampF$EMPTY_N &&
	     adcCore1_colGate_sampF_RDY_first__551_AND_NOT__ETC___d1608 ;
  assign adcCore1_spiI_reqF_enq_pw$whas =
	     WILL_FIRE_RL_adcCore1_advance_spi_request ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l119c9 ;
  assign adcCore1_spiI_reqF_deq_pw$whas =
	     MUX_adcCore1_spiI_xmt_d$write_1__SEL_2 ;
  assign adcCore1_spiI_reqF_sClear_pw$whas = 1'b0 ;
  assign adcCore1_spiI_reqF_dClear_pw$whas = 1'b0 ;
  assign adcCore1_spiI_reqF_deq_happened$whas = 1'b0 ;
  assign adcCore1_spiI_respF_enq_pw$whas =
	     adcCore1_spiI_respF_head_wrapped ==
	     adcCore1_spiI_respF_tail_wrapped &&
	     !adcCore1_spiI_respF_sInReset$VAL &&
	     adcCore1_spiI_doResp ;
  assign adcCore1_spiI_respF_deq_pw$whas = WILL_FIRE_RL_get_adc1_resp ;
  assign adcCore1_spiI_respF_sClear_pw$whas = 1'b0 ;
  assign adcCore1_spiI_respF_dClear_pw$whas = 1'b0 ;
  assign adcCore1_spiI_respF_deq_happened$whas = 1'b0 ;
  assign adcCore1_iseqFsm_state_set_pw$whas =
	     WILL_FIRE_RL_adcCore1_iseqFsm_idle_l115c3 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l119c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_np ||
	     adcCore1_iseqFsm_state_mkFSMstate == 4'd2 ||
	     adcCore1_iseqFsm_state_mkFSMstate == 4'd1 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l116c12 ;
  assign adcCore1_iseqFsm_state_overlap_pw$whas = 1'b0 ;
  assign wsiM_reqFifo_enqueueing$whas = WILL_FIRE_RL_doMessage ;
  assign wsiM_reqFifo_dequeueing$whas = WILL_FIRE_RL_wsiM_reqFifo_deq ;
  assign wsiM_sThreadBusy_pw$whas = wsiM0_SThreadBusy ;
  assign fcAdc_grayCounter_wdCounterCrossing$wget =
	     fcAdc_grayCounter_rsCounter ;
  assign spiClk_spiI_sdiWs$wget = spiClk_spiI_sdiP ;
  assign adcCore0_sampF_rWrPtr_wdCounterCrossing$wget =
	     adcCore0_sampF_rWrPtr_rsCounter ;
  assign adcCore0_sampF_rRdPtr_wdCounterCrossing$wget =
	     adcCore0_sampF_rRdPtr_rsCounter ;
  assign adcCore0_spiI_sdiWs$wget = adcCore0_spiI_sdiP ;
  assign adcCore1_sampF_rWrPtr_wdCounterCrossing$wget =
	     adcCore1_sampF_rWrPtr_rsCounter ;
  assign adcCore1_sampF_rRdPtr_wdCounterCrossing$wget =
	     adcCore1_sampF_rRdPtr_rsCounter ;
  assign adcCore1_spiI_sdiWs$wget = adcCore1_spiI_sdiP ;
  assign wsiM_extStatusW$wget =
	     { wsiM_pMesgCount, wsiM_iMesgCount, wsiM_tBusyCount } ;
  // register adcControl
  assign adcControl$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign adcControl$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h0C ;
  // register adcCore0_acquireDReg
  assign adcCore0_acquireDReg$D_IN = adcCore0_acquireDReg_1$whas ;
  assign adcCore0_acquireDReg$EN = 1'd1 ;
  // register adcCore0_adcRst
  assign adcCore0_adcRst$D_IN = adcCore0_adcRst_1$whas ;
  assign adcCore0_adcRst$EN = 1'd1 ;
  // register adcCore0_averageDReg
  assign adcCore0_averageDReg$D_IN = adcCore0_averageDReg_1$whas ;
  assign adcCore0_averageDReg$EN = 1'd1 ;
  // register adcCore0_colGate_avgEven
  assign adcCore0_colGate_avgEven$D_IN =
	     (adcCore0_colGate_avgPhase == 2'd0) ? x__h36326 : x__h36250 ;
  assign adcCore0_colGate_avgEven$EN =
	     WILL_FIRE_RL_adcCore0_colGate_form_avg4_sample &&
	     (adcCore0_colGate_avgPhase == 2'd0 ||
	      adcCore0_colGate_avgPhase == 2'd1) ;
  // register adcCore0_colGate_avgOdd
  assign adcCore0_colGate_avgOdd$D_IN =
	     (adcCore0_colGate_avgPhase == 2'd2) ? x__h36326 : x__h36400 ;
  assign adcCore0_colGate_avgOdd$EN =
	     WILL_FIRE_RL_adcCore0_colGate_form_avg4_sample &&
	     (adcCore0_colGate_avgPhase == 2'd2 ||
	      adcCore0_colGate_avgPhase == 2'd3) ;
  // register adcCore0_colGate_avgPhase
  assign adcCore0_colGate_avgPhase$D_IN = adcCore0_colGate_avgPhase + 2'd1 ;
  assign adcCore0_colGate_avgPhase$EN =
	     WILL_FIRE_RL_adcCore0_colGate_form_avg4_sample ;
  // register adcCore0_colGate_collectD
  assign adcCore0_colGate_collectD$D_IN =
	     adcCore0_operateD$dD_OUT && adcCore0_acquireD$dD_OUT ;
  assign adcCore0_colGate_collectD$EN = 1'b1 ;
  // register adcCore0_colGate_dropCount
  assign adcCore0_colGate_dropCount$D_IN =
	     WILL_FIRE_RL_adcCore0_colGate_count_dropped_samples ?
	       MUX_adcCore0_colGate_dropCount$write_1__VAL_1 :
	       32'd0 ;
  assign adcCore0_colGate_dropCount$EN =
	     WILL_FIRE_RL_adcCore0_colGate_count_dropped_samples ||
	     !adcCore0_operateD$dD_OUT ;
  // register adcCore0_colGate_dwellFails
  assign adcCore0_colGate_dwellFails$D_IN =
	     MUX_adcCore0_colGate_dwellFails$write_1__SEL_1 ?
	       MUX_adcCore0_colGate_dwellFails$write_1__VAL_1 :
	       32'd0 ;
  assign adcCore0_colGate_dwellFails$EN =
	     WILL_FIRE_RL_adcCore0_colGate_count_dropped_samples &&
	     adcCore0_colGate_ovrRecover == 4'd0 ||
	     !adcCore0_operateD$dD_OUT ;
  // register adcCore0_colGate_dwellStarts
  assign adcCore0_colGate_dwellStarts$D_IN =
	     WILL_FIRE_RL_adcCore0_colGate_count_dwells ?
	       MUX_adcCore0_colGate_dwellStarts$write_1__VAL_1 :
	       32'd0 ;
  assign adcCore0_colGate_dwellStarts$EN =
	     WILL_FIRE_RL_adcCore0_colGate_count_dwells ||
	     !adcCore0_operateD$dD_OUT ;
  // register adcCore0_colGate_ovrRecover
  always@(MUX_adcCore0_colGate_dwellFails$write_1__SEL_1 or
	  WILL_FIRE_RL_adcCore0_colGate_overrun_recovery or
	  MUX_adcCore0_colGate_ovrRecover$write_1__VAL_2 or
	  adcCore0_operateD$dD_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_adcCore0_colGate_dwellFails$write_1__SEL_1:
	  adcCore0_colGate_ovrRecover$D_IN = 4'd15;
      WILL_FIRE_RL_adcCore0_colGate_overrun_recovery:
	  adcCore0_colGate_ovrRecover$D_IN =
	      MUX_adcCore0_colGate_ovrRecover$write_1__VAL_2;
      !adcCore0_operateD$dD_OUT: adcCore0_colGate_ovrRecover$D_IN = 4'd0;
      default: adcCore0_colGate_ovrRecover$D_IN =
		   4'b1010 /* unspecified value */ ;
    endcase
  end
  assign adcCore0_colGate_ovrRecover$EN =
	     WILL_FIRE_RL_adcCore0_colGate_count_dropped_samples &&
	     adcCore0_colGate_ovrRecover == 4'd0 ||
	     WILL_FIRE_RL_adcCore0_colGate_overrun_recovery ||
	     !adcCore0_operateD$dD_OUT ;
  // register adcCore0_colGate_sampActive
  assign adcCore0_colGate_sampActive$D_IN = 1'b1 ;
  assign adcCore0_colGate_sampActive$EN = 1'd1 ;
  // register adcCore0_colGate_sampActiveD
  assign adcCore0_colGate_sampActiveD$D_IN =
	     adcCore0_operateD$dD_OUT && adcCore0_colGate_sampActive ;
  assign adcCore0_colGate_sampActiveD$EN = 1'b1 ;
  // register adcCore0_colGate_sampCount
  assign adcCore0_colGate_sampCount$D_IN =
	     WILL_FIRE_RL_adcCore0_colGate_capture_collect ?
	       MUX_adcCore0_colGate_sampCount$write_1__VAL_1 :
	       32'd0 ;
  assign adcCore0_colGate_sampCount$EN =
	     WILL_FIRE_RL_adcCore0_colGate_capture_collect ||
	     !adcCore0_operateD$dD_OUT ;
  // register adcCore0_colGate_sampDataWD
  assign adcCore0_colGate_sampDataWD$D_IN = adcCore0_samp ;
  assign adcCore0_colGate_sampDataWD$EN =
	     MUX_adcCore0_colGate_dwellFails$write_1__SEL_1 ;
  // register adcCore0_colGate_syncMesg
  assign adcCore0_colGate_syncMesg$D_IN =
	     WILL_FIRE_RL_adcCore0_colGate_send_sync_mesg ?
	       MUX_adcCore0_colGate_syncMesg$write_1__VAL_1 :
	       2'd0 ;
  assign adcCore0_colGate_syncMesg$EN =
	     WILL_FIRE_RL_adcCore0_colGate_send_sync_mesg ||
	     !adcCore0_operateD$dD_OUT ;
  // register adcCore0_colGate_timeMesg
  assign adcCore0_colGate_timeMesg$D_IN =
	     WILL_FIRE_RL_adcCore0_colGate_send_timestamp_mesg ?
	       MUX_adcCore0_colGate_timeMesg$write_1__VAL_1 :
	       3'd0 ;
  assign adcCore0_colGate_timeMesg$EN =
	     WILL_FIRE_RL_adcCore0_colGate_send_timestamp_mesg ||
	     !adcCore0_operateD$dD_OUT ;
  // register adcCore0_colGate_uprollCnt
  assign adcCore0_colGate_uprollCnt$D_IN =
	     WILL_FIRE_RL_adcCore0_colGate_capture_collect ?
	       MUX_adcCore0_colGate_uprollCnt$write_1__VAL_2 :
	       16'd0 ;
  assign adcCore0_colGate_uprollCnt$EN =
	     WILL_FIRE_RL_adcCore0_colGate_overrun_recovery &&
	     adcCore0_colGate_ovrRecover == 4'd15 ||
	     WILL_FIRE_RL_adcCore0_colGate_capture_collect ||
	     !adcCore0_operateD$dD_OUT ;
  // register adcCore0_ddrC_psCmdReg
  assign adcCore0_ddrC_psCmdReg$D_IN =
	     adcCore0_ddrC_psCmdReg_1$whas ? wci_wslv_reqF$D_OUT[1:0] : 2'd0 ;
  assign adcCore0_ddrC_psCmdReg$EN = 1'd1 ;
  // register adcCore0_iseqFsm_jj_delay_count
  assign adcCore0_iseqFsm_jj_delay_count$D_IN =
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_np ?
	       MUX_adcCore0_iseqFsm_jj_delay_count$write_1__VAL_1 :
	       13'd1 ;
  assign adcCore0_iseqFsm_jj_delay_count$EN =
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_np ||
	     adcCore0_iseqFsm_state_mkFSMstate == 4'd2 ;
  // register adcCore0_iseqFsm_start_reg
  assign adcCore0_iseqFsm_start_reg$D_IN =
	     !WILL_FIRE_RL_adcCore0_iseqFsm_fsm_start ;
  assign adcCore0_iseqFsm_start_reg$EN =
	     WILL_FIRE_RL_adcCore0_iseqFsm_fsm_start ||
	     WILL_FIRE_RL_wci_ctrl_EiI ;
  // register adcCore0_iseqFsm_start_reg_1
  assign adcCore0_iseqFsm_start_reg_1$D_IN =
	     adcCore0_iseqFsm_start_wire$whas ;
  assign adcCore0_iseqFsm_start_reg_1$EN = 1'd1 ;
  // register adcCore0_iseqFsm_state_can_overlap
  assign adcCore0_iseqFsm_state_can_overlap$D_IN =
	     adcCore0_iseqFsm_state_set_pw$whas ||
	     adcCore0_iseqFsm_state_can_overlap ;
  assign adcCore0_iseqFsm_state_can_overlap$EN = 1'd1 ;
  // register adcCore0_iseqFsm_state_fired
  assign adcCore0_iseqFsm_state_fired$D_IN =
	     adcCore0_iseqFsm_state_set_pw$whas ;
  assign adcCore0_iseqFsm_state_fired$EN = 1'd1 ;
  // register adcCore0_iseqFsm_state_mkFSMstate
  always@(WILL_FIRE_RL_adcCore0_iseqFsm_idle_l115c3 or
	  WILL_FIRE_RL_adcCore0_iseqFsm_action_l116c12 or
	  adcCore0_iseqFsm_state_mkFSMstate or
	  WILL_FIRE_RL_adcCore0_iseqFsm_action_np or
	  WILL_FIRE_RL_adcCore0_iseqFsm_action_l119c9 or
	  WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9 or
	  WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9 or
	  WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9 or
	  WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 or
	  WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_adcCore0_iseqFsm_idle_l115c3:
	  adcCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd0;
      WILL_FIRE_RL_adcCore0_iseqFsm_action_l116c12:
	  adcCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd1;
      adcCore0_iseqFsm_state_mkFSMstate == 4'd1:
	  adcCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd2;
      adcCore0_iseqFsm_state_mkFSMstate == 4'd2:
	  adcCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd3;
      WILL_FIRE_RL_adcCore0_iseqFsm_action_np:
	  adcCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd4;
      WILL_FIRE_RL_adcCore0_iseqFsm_action_l119c9:
	  adcCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd5;
      WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9:
	  adcCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd6;
      WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9:
	  adcCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd7;
      WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9:
	  adcCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd8;
      WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9:
	  adcCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd9;
      WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9:
	  adcCore0_iseqFsm_state_mkFSMstate$D_IN = 4'd10;
      default: adcCore0_iseqFsm_state_mkFSMstate$D_IN =
		   4'b1010 /* unspecified value */ ;
    endcase
  end
  assign adcCore0_iseqFsm_state_mkFSMstate$EN =
	     WILL_FIRE_RL_adcCore0_iseqFsm_idle_l115c3 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l116c12 ||
	     adcCore0_iseqFsm_state_mkFSMstate == 4'd1 ||
	     adcCore0_iseqFsm_state_mkFSMstate == 4'd2 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_np ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l119c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9 ;
  // register adcCore0_operateDReg
  assign adcCore0_operateDReg$D_IN = wci_wslv_cState == 3'd2 ;
  assign adcCore0_operateDReg$EN = 1'd1 ;
  // register adcCore0_readMode
  assign adcCore0_readMode$D_IN =
	     adcCore0_reqF$D_OUT[16] && !adcCore0_readMode ;
  assign adcCore0_readMode$EN =
	     WILL_FIRE_RL_adcCore0_advance_spi_request &&
	     (adcCore0_reqF$D_OUT[16] && !adcCore0_readMode ||
	      !adcCore0_reqF$D_OUT[16] && adcCore0_readMode) ;
  // register adcCore0_samp
  assign adcCore0_samp$D_IN =
	     { adcCore0_ddrC_ddrV$sdrData1,
	       2'h0,
	       adcCore0_ddrC_ddrV$sdrData0,
	       2'h0 } ;
  assign adcCore0_samp$EN = 1'd1 ;
  // register adcCore0_sampF_rRdPtr_rdCounter
  assign adcCore0_sampF_rRdPtr_rdCounter$D_IN =
	     adcCore0_sampF_rRdPtr_rdCounterPre ;
  assign adcCore0_sampF_rRdPtr_rdCounter$EN = 1'd1 ;
  // register adcCore0_sampF_rRdPtr_rdCounterPre
  assign adcCore0_sampF_rRdPtr_rdCounterPre$D_IN =
	     adcCore0_sampF_rRdPtr_rsCounter ;
  assign adcCore0_sampF_rRdPtr_rdCounterPre$EN = 1'd1 ;
  // register adcCore0_sampF_rRdPtr_rsCounter
  assign adcCore0_sampF_rRdPtr_rsCounter$D_IN =
	     MUX_adcCore0_sampF_rRdPtr_rsCounter$write_1__VAL_1 ;
  assign adcCore0_sampF_rRdPtr_rsCounter$EN = adcCore0_sampF_pwDequeue$whas ;
  // register adcCore0_sampF_rWrPtr_rdCounter
  assign adcCore0_sampF_rWrPtr_rdCounter$D_IN =
	     adcCore0_sampF_rWrPtr_rdCounterPre ;
  assign adcCore0_sampF_rWrPtr_rdCounter$EN = 1'd1 ;
  // register adcCore0_sampF_rWrPtr_rdCounterPre
  assign adcCore0_sampF_rWrPtr_rdCounterPre$D_IN =
	     adcCore0_sampF_rWrPtr_rsCounter ;
  assign adcCore0_sampF_rWrPtr_rdCounterPre$EN = 1'd1 ;
  // register adcCore0_sampF_rWrPtr_rsCounter
  assign adcCore0_sampF_rWrPtr_rsCounter$D_IN =
	     MUX_adcCore0_sampF_rWrPtr_rsCounter$write_1__VAL_1 ;
  assign adcCore0_sampF_rWrPtr_rsCounter$EN = adcCore0_sampF_pwEnqueue$whas ;
  // register adcCore0_spiI_cGate
  assign adcCore0_spiI_cGate$D_IN = adcCore0_spiI_cGate_1$whas ;
  assign adcCore0_spiI_cGate$EN = 1'd1 ;
  // register adcCore0_spiI_cap
  assign adcCore0_spiI_cap$D_IN = adcCore0_spiI_sdiP ;
  assign adcCore0_spiI_cap$EN = MUX_adcCore0_spiI_xmt_d$write_1__SEL_2 ;
  // register adcCore0_spiI_cap_1
  assign adcCore0_spiI_cap_1$D_IN = adcCore0_spiI_sdiP ;
  assign adcCore0_spiI_cap_1$EN =
	     WILL_FIRE_RL_adcCore0_spiI_send_d && adcCore0_spiI_dPos == 3'd1 ;
  // register adcCore0_spiI_cap_2
  assign adcCore0_spiI_cap_2$D_IN = adcCore0_spiI_sdiP ;
  assign adcCore0_spiI_cap_2$EN =
	     WILL_FIRE_RL_adcCore0_spiI_send_d && adcCore0_spiI_dPos == 3'd2 ;
  // register adcCore0_spiI_cap_3
  assign adcCore0_spiI_cap_3$D_IN = adcCore0_spiI_sdiP ;
  assign adcCore0_spiI_cap_3$EN =
	     WILL_FIRE_RL_adcCore0_spiI_send_d && adcCore0_spiI_dPos == 3'd3 ;
  // register adcCore0_spiI_cap_4
  assign adcCore0_spiI_cap_4$D_IN = adcCore0_spiI_sdiP ;
  assign adcCore0_spiI_cap_4$EN =
	     WILL_FIRE_RL_adcCore0_spiI_send_d && adcCore0_spiI_dPos == 3'd4 ;
  // register adcCore0_spiI_cap_5
  assign adcCore0_spiI_cap_5$D_IN = adcCore0_spiI_sdiP ;
  assign adcCore0_spiI_cap_5$EN =
	     WILL_FIRE_RL_adcCore0_spiI_send_d && adcCore0_spiI_dPos == 3'd5 ;
  // register adcCore0_spiI_cap_6
  assign adcCore0_spiI_cap_6$D_IN = adcCore0_spiI_sdiP ;
  assign adcCore0_spiI_cap_6$EN =
	     WILL_FIRE_RL_adcCore0_spiI_send_d && adcCore0_spiI_dPos == 3'd6 ;
  // register adcCore0_spiI_cap_7
  assign adcCore0_spiI_cap_7$D_IN = adcCore0_spiI_sdiP ;
  assign adcCore0_spiI_cap_7$EN =
	     WILL_FIRE_RL_adcCore0_spiI_send_d && adcCore0_spiI_dPos == 3'd7 ;
  // register adcCore0_spiI_csbR
  assign adcCore0_spiI_csbR$D_IN = !adcCore0_spiI_cGate_1$whas ;
  assign adcCore0_spiI_csbR$EN = 1'd1 ;
  // register adcCore0_spiI_dPos
  assign adcCore0_spiI_dPos$D_IN =
	     WILL_FIRE_RL_adcCore0_spiI_send_d ?
	       MUX_adcCore0_spiI_dPos$write_1__VAL_1 :
	       3'h7 ;
  assign adcCore0_spiI_dPos$EN =
	     WILL_FIRE_RL_adcCore0_spiI_send_d ||
	     WILL_FIRE_RL_adcCore0_spiI_start_cs ;
  // register adcCore0_spiI_doResp
  assign adcCore0_spiI_doResp$D_IN =
	     MUX_adcCore0_spiI_xmt_d$write_1__SEL_2 &&
	     adcCore0_spiI_reqS[16] ;
  assign adcCore0_spiI_doResp$EN = 1'd1 ;
  // register adcCore0_spiI_iPos
  assign adcCore0_spiI_iPos$D_IN =
	     WILL_FIRE_RL_adcCore0_spiI_send_i ?
	       MUX_adcCore0_spiI_iPos$write_1__VAL_1 :
	       4'h7 ;
  assign adcCore0_spiI_iPos$EN =
	     WILL_FIRE_RL_adcCore0_spiI_send_i ||
	     WILL_FIRE_RL_adcCore0_spiI_start_cs ;
  // register adcCore0_spiI_reqF_head_wrapped
  assign adcCore0_spiI_reqF_head_wrapped$D_IN =
	     WILL_FIRE_RL_adcCore0_spiI_reqF_deq_update_head &&
	     !adcCore0_spiI_reqF_head_wrapped ;
  assign adcCore0_spiI_reqF_head_wrapped$EN =
	     WILL_FIRE_RL_adcCore0_spiI_reqF_deq_update_head ||
	     adcCore0_spiI_reqF_dInReset$VAL ;
  // register adcCore0_spiI_reqF_tail_wrapped
  assign adcCore0_spiI_reqF_tail_wrapped$D_IN =
	     WILL_FIRE_RL_adcCore0_spiI_reqF_enq_update_tail &&
	     !adcCore0_spiI_reqF_tail_wrapped ;
  assign adcCore0_spiI_reqF_tail_wrapped$EN =
	     WILL_FIRE_RL_adcCore0_spiI_reqF_enq_update_tail ||
	     adcCore0_spiI_reqF_sInReset$VAL ;
  // register adcCore0_spiI_reqS
  always@(WILL_FIRE_RL_adcCore0_advance_spi_request or
	  MUX_adcCore0_spiI_reqS$write_1__VAL_1 or
	  WILL_FIRE_RL_adcCore0_iseqFsm_action_l119c9 or
	  WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9 or
	  WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9 or
	  WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9 or
	  WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 or
	  WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_adcCore0_advance_spi_request:
	  adcCore0_spiI_reqS$D_IN = MUX_adcCore0_spiI_reqS$write_1__VAL_1;
      WILL_FIRE_RL_adcCore0_iseqFsm_action_l119c9:
	  adcCore0_spiI_reqS$D_IN = 17'd20486;
      WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9:
	  adcCore0_spiI_reqS$D_IN = 17'd20788;
      WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9:
	  adcCore0_spiI_reqS$D_IN = 17'd21010;
      WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9:
	  adcCore0_spiI_reqS$D_IN = 17'd21568;
      WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9:
	  adcCore0_spiI_reqS$D_IN = 17'd21776;
      WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9:
	  adcCore0_spiI_reqS$D_IN = 17'd25092;
      default: adcCore0_spiI_reqS$D_IN =
		   17'b01010101010101010 /* unspecified value */ ;
    endcase
  end
  assign adcCore0_spiI_reqS$EN =
	     WILL_FIRE_RL_adcCore0_advance_spi_request ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l119c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 ||
	     WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9 ;
  // register adcCore0_spiI_respF_head_wrapped
  assign adcCore0_spiI_respF_head_wrapped$D_IN =
	     WILL_FIRE_RL_adcCore0_spiI_respF_deq_update_head &&
	     !adcCore0_spiI_respF_head_wrapped ;
  assign adcCore0_spiI_respF_head_wrapped$EN =
	     WILL_FIRE_RL_adcCore0_spiI_respF_deq_update_head ||
	     adcCore0_spiI_respF_dInReset$VAL ;
  // register adcCore0_spiI_respF_tail_wrapped
  assign adcCore0_spiI_respF_tail_wrapped$D_IN =
	     WILL_FIRE_RL_adcCore0_spiI_respF_enq_update_tail &&
	     !adcCore0_spiI_respF_tail_wrapped ;
  assign adcCore0_spiI_respF_tail_wrapped$EN =
	     WILL_FIRE_RL_adcCore0_spiI_respF_enq_update_tail ||
	     adcCore0_spiI_respF_sInReset$VAL ;
  // register adcCore0_spiI_respS
  assign adcCore0_spiI_respS$D_IN =
	     { adcCore0_spiI_cap_6,
	       adcCore0_spiI_cap_5,
	       adcCore0_spiI_cap_4,
	       adcCore0_spiI_cap_3,
	       adcCore0_spiI_cap_2,
	       adcCore0_spiI_cap_1,
	       adcCore0_spiI_cap,
	       adcCore0_spiI_sdiP } ;
  assign adcCore0_spiI_respS$EN = adcCore0_spiI_respF_enq_pw$whas ;
  // register adcCore0_spiI_sdiP
  assign adcCore0_spiI_sdiP$D_IN = adc0_sdout_arg ;
  assign adcCore0_spiI_sdiP$EN = 1'd1 ;
  // register adcCore0_spiI_sdoR
  assign adcCore0_spiI_sdoR$D_IN =
	     adcCore0_spiI_cGate_1$whas && adcCore0_spiI_sdoR_1$wget ;
  assign adcCore0_spiI_sdoR$EN = 1'd1 ;
  // register adcCore0_spiI_xmt_d
  assign adcCore0_spiI_xmt_d$D_IN =
	     WILL_FIRE_RL_adcCore0_spiI_send_i && adcCore0_spiI_iPos == 4'd0 ;
  assign adcCore0_spiI_xmt_d$EN =
	     WILL_FIRE_RL_adcCore0_spiI_send_d &&
	     adcCore0_spiI_dPos == 3'd0 ||
	     WILL_FIRE_RL_adcCore0_spiI_send_i ;
  // register adcCore0_spiI_xmt_i
  assign adcCore0_spiI_xmt_i$D_IN =
	     !WILL_FIRE_RL_adcCore0_spiI_send_i ||
	     adcCore0_spiI_iPos != 4'd0 ;
  assign adcCore0_spiI_xmt_i$EN =
	     WILL_FIRE_RL_adcCore0_spiI_send_i ||
	     WILL_FIRE_RL_adcCore0_spiI_start_cs ;
  // register adcCore1_acquireDReg
  assign adcCore1_acquireDReg$D_IN = 1'b0 ;
  assign adcCore1_acquireDReg$EN = 1'd1 ;
  // register adcCore1_adcRst
  assign adcCore1_adcRst$D_IN = adcCore1_adcRst_1$whas ;
  assign adcCore1_adcRst$EN = 1'd1 ;
  // register adcCore1_averageDReg
  assign adcCore1_averageDReg$D_IN = 1'b0 ;
  assign adcCore1_averageDReg$EN = 1'd1 ;
  // register adcCore1_colGate_avgEven
  assign adcCore1_colGate_avgEven$D_IN =
	     (adcCore1_colGate_avgPhase == 2'd0) ? x__h82036 : x__h81960 ;
  assign adcCore1_colGate_avgEven$EN =
	     WILL_FIRE_RL_adcCore1_colGate_form_avg4_sample &&
	     (adcCore1_colGate_avgPhase == 2'd0 ||
	      adcCore1_colGate_avgPhase == 2'd1) ;
  // register adcCore1_colGate_avgOdd
  assign adcCore1_colGate_avgOdd$D_IN =
	     (adcCore1_colGate_avgPhase == 2'd2) ? x__h82036 : x__h82110 ;
  assign adcCore1_colGate_avgOdd$EN =
	     WILL_FIRE_RL_adcCore1_colGate_form_avg4_sample &&
	     (adcCore1_colGate_avgPhase == 2'd2 ||
	      adcCore1_colGate_avgPhase == 2'd3) ;
  // register adcCore1_colGate_avgPhase
  assign adcCore1_colGate_avgPhase$D_IN = adcCore1_colGate_avgPhase + 2'd1 ;
  assign adcCore1_colGate_avgPhase$EN =
	     WILL_FIRE_RL_adcCore1_colGate_form_avg4_sample ;
  // register adcCore1_colGate_collectD
  assign adcCore1_colGate_collectD$D_IN =
	     adcCore1_operateD$dD_OUT && adcCore1_acquireD$dD_OUT ;
  assign adcCore1_colGate_collectD$EN = 1'b1 ;
  // register adcCore1_colGate_dropCount
  assign adcCore1_colGate_dropCount$D_IN =
	     WILL_FIRE_RL_adcCore1_colGate_count_dropped_samples ?
	       MUX_adcCore1_colGate_dropCount$write_1__VAL_1 :
	       32'd0 ;
  assign adcCore1_colGate_dropCount$EN =
	     WILL_FIRE_RL_adcCore1_colGate_count_dropped_samples ||
	     !adcCore1_operateD$dD_OUT ;
  // register adcCore1_colGate_dwellFails
  assign adcCore1_colGate_dwellFails$D_IN =
	     MUX_adcCore1_colGate_dwellFails$write_1__SEL_1 ?
	       MUX_adcCore1_colGate_dwellFails$write_1__VAL_1 :
	       32'd0 ;
  assign adcCore1_colGate_dwellFails$EN =
	     WILL_FIRE_RL_adcCore1_colGate_count_dropped_samples &&
	     adcCore1_colGate_ovrRecover == 4'd0 ||
	     !adcCore1_operateD$dD_OUT ;
  // register adcCore1_colGate_dwellStarts
  assign adcCore1_colGate_dwellStarts$D_IN =
	     WILL_FIRE_RL_adcCore1_colGate_count_dwells ?
	       MUX_adcCore1_colGate_dwellStarts$write_1__VAL_1 :
	       32'd0 ;
  assign adcCore1_colGate_dwellStarts$EN =
	     WILL_FIRE_RL_adcCore1_colGate_count_dwells ||
	     !adcCore1_operateD$dD_OUT ;
  // register adcCore1_colGate_ovrRecover
  always@(MUX_adcCore1_colGate_dwellFails$write_1__SEL_1 or
	  WILL_FIRE_RL_adcCore1_colGate_overrun_recovery or
	  MUX_adcCore1_colGate_ovrRecover$write_1__VAL_2 or
	  adcCore1_operateD$dD_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_adcCore1_colGate_dwellFails$write_1__SEL_1:
	  adcCore1_colGate_ovrRecover$D_IN = 4'd15;
      WILL_FIRE_RL_adcCore1_colGate_overrun_recovery:
	  adcCore1_colGate_ovrRecover$D_IN =
	      MUX_adcCore1_colGate_ovrRecover$write_1__VAL_2;
      !adcCore1_operateD$dD_OUT: adcCore1_colGate_ovrRecover$D_IN = 4'd0;
      default: adcCore1_colGate_ovrRecover$D_IN =
		   4'b1010 /* unspecified value */ ;
    endcase
  end
  assign adcCore1_colGate_ovrRecover$EN =
	     WILL_FIRE_RL_adcCore1_colGate_count_dropped_samples &&
	     adcCore1_colGate_ovrRecover == 4'd0 ||
	     WILL_FIRE_RL_adcCore1_colGate_overrun_recovery ||
	     !adcCore1_operateD$dD_OUT ;
  // register adcCore1_colGate_sampActive
  assign adcCore1_colGate_sampActive$D_IN = 1'b1 ;
  assign adcCore1_colGate_sampActive$EN = 1'd1 ;
  // register adcCore1_colGate_sampActiveD
  assign adcCore1_colGate_sampActiveD$D_IN =
	     adcCore1_operateD$dD_OUT && adcCore1_colGate_sampActive ;
  assign adcCore1_colGate_sampActiveD$EN = 1'b1 ;
  // register adcCore1_colGate_sampCount
  assign adcCore1_colGate_sampCount$D_IN =
	     WILL_FIRE_RL_adcCore1_colGate_capture_collect ?
	       MUX_adcCore1_colGate_sampCount$write_1__VAL_1 :
	       32'd0 ;
  assign adcCore1_colGate_sampCount$EN =
	     WILL_FIRE_RL_adcCore1_colGate_capture_collect ||
	     !adcCore1_operateD$dD_OUT ;
  // register adcCore1_colGate_sampDataWD
  assign adcCore1_colGate_sampDataWD$D_IN = adcCore1_samp ;
  assign adcCore1_colGate_sampDataWD$EN =
	     MUX_adcCore1_colGate_dwellFails$write_1__SEL_1 ;
  // register adcCore1_colGate_syncMesg
  assign adcCore1_colGate_syncMesg$D_IN =
	     WILL_FIRE_RL_adcCore1_colGate_send_sync_mesg ?
	       MUX_adcCore1_colGate_syncMesg$write_1__VAL_1 :
	       2'd0 ;
  assign adcCore1_colGate_syncMesg$EN =
	     WILL_FIRE_RL_adcCore1_colGate_send_sync_mesg ||
	     !adcCore1_operateD$dD_OUT ;
  // register adcCore1_colGate_timeMesg
  assign adcCore1_colGate_timeMesg$D_IN =
	     WILL_FIRE_RL_adcCore1_colGate_send_timestamp_mesg ?
	       MUX_adcCore1_colGate_timeMesg$write_1__VAL_1 :
	       3'd0 ;
  assign adcCore1_colGate_timeMesg$EN =
	     WILL_FIRE_RL_adcCore1_colGate_send_timestamp_mesg ||
	     !adcCore1_operateD$dD_OUT ;
  // register adcCore1_colGate_uprollCnt
  assign adcCore1_colGate_uprollCnt$D_IN =
	     WILL_FIRE_RL_adcCore1_colGate_capture_collect ?
	       MUX_adcCore1_colGate_uprollCnt$write_1__VAL_2 :
	       16'd0 ;
  assign adcCore1_colGate_uprollCnt$EN =
	     WILL_FIRE_RL_adcCore1_colGate_overrun_recovery &&
	     adcCore1_colGate_ovrRecover == 4'd15 ||
	     WILL_FIRE_RL_adcCore1_colGate_capture_collect ||
	     !adcCore1_operateD$dD_OUT ;
  // register adcCore1_ddrC_psCmdReg
  assign adcCore1_ddrC_psCmdReg$D_IN =
	     adcCore1_ddrC_psCmdReg_1$whas ? wci_wslv_reqF$D_OUT[1:0] : 2'd0 ;
  assign adcCore1_ddrC_psCmdReg$EN = 1'd1 ;
  // register adcCore1_iseqFsm_jj_delay_count
  assign adcCore1_iseqFsm_jj_delay_count$D_IN =
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_np ?
	       MUX_adcCore1_iseqFsm_jj_delay_count$write_1__VAL_1 :
	       13'd1 ;
  assign adcCore1_iseqFsm_jj_delay_count$EN =
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_np ||
	     adcCore1_iseqFsm_state_mkFSMstate == 4'd2 ;
  // register adcCore1_iseqFsm_start_reg
  assign adcCore1_iseqFsm_start_reg$D_IN =
	     !WILL_FIRE_RL_adcCore1_iseqFsm_fsm_start ;
  assign adcCore1_iseqFsm_start_reg$EN =
	     WILL_FIRE_RL_adcCore1_iseqFsm_fsm_start ||
	     WILL_FIRE_RL_wci_ctrl_EiI ;
  // register adcCore1_iseqFsm_start_reg_1
  assign adcCore1_iseqFsm_start_reg_1$D_IN =
	     adcCore1_iseqFsm_start_wire$whas ;
  assign adcCore1_iseqFsm_start_reg_1$EN = 1'd1 ;
  // register adcCore1_iseqFsm_state_can_overlap
  assign adcCore1_iseqFsm_state_can_overlap$D_IN =
	     adcCore1_iseqFsm_state_set_pw$whas ||
	     adcCore1_iseqFsm_state_can_overlap ;
  assign adcCore1_iseqFsm_state_can_overlap$EN = 1'd1 ;
  // register adcCore1_iseqFsm_state_fired
  assign adcCore1_iseqFsm_state_fired$D_IN =
	     adcCore1_iseqFsm_state_set_pw$whas ;
  assign adcCore1_iseqFsm_state_fired$EN = 1'd1 ;
  // register adcCore1_iseqFsm_state_mkFSMstate
  always@(WILL_FIRE_RL_adcCore1_iseqFsm_idle_l115c3 or
	  WILL_FIRE_RL_adcCore1_iseqFsm_action_l116c12 or
	  adcCore1_iseqFsm_state_mkFSMstate or
	  WILL_FIRE_RL_adcCore1_iseqFsm_action_np or
	  WILL_FIRE_RL_adcCore1_iseqFsm_action_l119c9 or
	  WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9 or
	  WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9 or
	  WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9 or
	  WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 or
	  WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_adcCore1_iseqFsm_idle_l115c3:
	  adcCore1_iseqFsm_state_mkFSMstate$D_IN = 4'd0;
      WILL_FIRE_RL_adcCore1_iseqFsm_action_l116c12:
	  adcCore1_iseqFsm_state_mkFSMstate$D_IN = 4'd1;
      adcCore1_iseqFsm_state_mkFSMstate == 4'd1:
	  adcCore1_iseqFsm_state_mkFSMstate$D_IN = 4'd2;
      adcCore1_iseqFsm_state_mkFSMstate == 4'd2:
	  adcCore1_iseqFsm_state_mkFSMstate$D_IN = 4'd3;
      WILL_FIRE_RL_adcCore1_iseqFsm_action_np:
	  adcCore1_iseqFsm_state_mkFSMstate$D_IN = 4'd4;
      WILL_FIRE_RL_adcCore1_iseqFsm_action_l119c9:
	  adcCore1_iseqFsm_state_mkFSMstate$D_IN = 4'd5;
      WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9:
	  adcCore1_iseqFsm_state_mkFSMstate$D_IN = 4'd6;
      WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9:
	  adcCore1_iseqFsm_state_mkFSMstate$D_IN = 4'd7;
      WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9:
	  adcCore1_iseqFsm_state_mkFSMstate$D_IN = 4'd8;
      WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9:
	  adcCore1_iseqFsm_state_mkFSMstate$D_IN = 4'd9;
      WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9:
	  adcCore1_iseqFsm_state_mkFSMstate$D_IN = 4'd10;
      default: adcCore1_iseqFsm_state_mkFSMstate$D_IN =
		   4'b1010 /* unspecified value */ ;
    endcase
  end
  assign adcCore1_iseqFsm_state_mkFSMstate$EN =
	     WILL_FIRE_RL_adcCore1_iseqFsm_idle_l115c3 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l116c12 ||
	     adcCore1_iseqFsm_state_mkFSMstate == 4'd1 ||
	     adcCore1_iseqFsm_state_mkFSMstate == 4'd2 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_np ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l119c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9 ;
  // register adcCore1_operateDReg
  assign adcCore1_operateDReg$D_IN = 1'b0 ;
  assign adcCore1_operateDReg$EN = 1'd1 ;
  // register adcCore1_readMode
  assign adcCore1_readMode$D_IN =
	     adcCore1_reqF$D_OUT[16] && !adcCore1_readMode ;
  assign adcCore1_readMode$EN =
	     WILL_FIRE_RL_adcCore1_advance_spi_request &&
	     (adcCore1_reqF$D_OUT[16] && !adcCore1_readMode ||
	      !adcCore1_reqF$D_OUT[16] && adcCore1_readMode) ;
  // register adcCore1_samp
  assign adcCore1_samp$D_IN =
	     { adcCore1_ddrC_ddrV$sdrData1,
	       2'h0,
	       adcCore1_ddrC_ddrV$sdrData0,
	       2'h0 } ;
  assign adcCore1_samp$EN = 1'd1 ;
  // register adcCore1_sampF_rRdPtr_rdCounter
  assign adcCore1_sampF_rRdPtr_rdCounter$D_IN =
	     adcCore1_sampF_rRdPtr_rdCounterPre ;
  assign adcCore1_sampF_rRdPtr_rdCounter$EN = 1'd1 ;
  // register adcCore1_sampF_rRdPtr_rdCounterPre
  assign adcCore1_sampF_rRdPtr_rdCounterPre$D_IN =
	     adcCore1_sampF_rRdPtr_rsCounter ;
  assign adcCore1_sampF_rRdPtr_rdCounterPre$EN = 1'd1 ;
  // register adcCore1_sampF_rRdPtr_rsCounter
  assign adcCore1_sampF_rRdPtr_rsCounter$D_IN =
	     11'b01010101010 /* unspecified value */  ;
  assign adcCore1_sampF_rRdPtr_rsCounter$EN = 1'b0 ;
  // register adcCore1_sampF_rWrPtr_rdCounter
  assign adcCore1_sampF_rWrPtr_rdCounter$D_IN =
	     adcCore1_sampF_rWrPtr_rdCounterPre ;
  assign adcCore1_sampF_rWrPtr_rdCounter$EN = 1'd1 ;
  // register adcCore1_sampF_rWrPtr_rdCounterPre
  assign adcCore1_sampF_rWrPtr_rdCounterPre$D_IN =
	     adcCore1_sampF_rWrPtr_rsCounter ;
  assign adcCore1_sampF_rWrPtr_rdCounterPre$EN = 1'd1 ;
  // register adcCore1_sampF_rWrPtr_rsCounter
  assign adcCore1_sampF_rWrPtr_rsCounter$D_IN =
	     MUX_adcCore1_sampF_rWrPtr_rsCounter$write_1__VAL_1 ;
  assign adcCore1_sampF_rWrPtr_rsCounter$EN = adcCore1_sampF_pwEnqueue$whas ;
  // register adcCore1_spiI_cGate
  assign adcCore1_spiI_cGate$D_IN = adcCore1_spiI_cGate_1$whas ;
  assign adcCore1_spiI_cGate$EN = 1'd1 ;
  // register adcCore1_spiI_cap
  assign adcCore1_spiI_cap$D_IN = adcCore1_spiI_sdiP ;
  assign adcCore1_spiI_cap$EN = MUX_adcCore1_spiI_xmt_d$write_1__SEL_2 ;
  // register adcCore1_spiI_cap_1
  assign adcCore1_spiI_cap_1$D_IN = adcCore1_spiI_sdiP ;
  assign adcCore1_spiI_cap_1$EN =
	     WILL_FIRE_RL_adcCore1_spiI_send_d && adcCore1_spiI_dPos == 3'd1 ;
  // register adcCore1_spiI_cap_2
  assign adcCore1_spiI_cap_2$D_IN = adcCore1_spiI_sdiP ;
  assign adcCore1_spiI_cap_2$EN =
	     WILL_FIRE_RL_adcCore1_spiI_send_d && adcCore1_spiI_dPos == 3'd2 ;
  // register adcCore1_spiI_cap_3
  assign adcCore1_spiI_cap_3$D_IN = adcCore1_spiI_sdiP ;
  assign adcCore1_spiI_cap_3$EN =
	     WILL_FIRE_RL_adcCore1_spiI_send_d && adcCore1_spiI_dPos == 3'd3 ;
  // register adcCore1_spiI_cap_4
  assign adcCore1_spiI_cap_4$D_IN = adcCore1_spiI_sdiP ;
  assign adcCore1_spiI_cap_4$EN =
	     WILL_FIRE_RL_adcCore1_spiI_send_d && adcCore1_spiI_dPos == 3'd4 ;
  // register adcCore1_spiI_cap_5
  assign adcCore1_spiI_cap_5$D_IN = adcCore1_spiI_sdiP ;
  assign adcCore1_spiI_cap_5$EN =
	     WILL_FIRE_RL_adcCore1_spiI_send_d && adcCore1_spiI_dPos == 3'd5 ;
  // register adcCore1_spiI_cap_6
  assign adcCore1_spiI_cap_6$D_IN = adcCore1_spiI_sdiP ;
  assign adcCore1_spiI_cap_6$EN =
	     WILL_FIRE_RL_adcCore1_spiI_send_d && adcCore1_spiI_dPos == 3'd6 ;
  // register adcCore1_spiI_cap_7
  assign adcCore1_spiI_cap_7$D_IN = adcCore1_spiI_sdiP ;
  assign adcCore1_spiI_cap_7$EN =
	     WILL_FIRE_RL_adcCore1_spiI_send_d && adcCore1_spiI_dPos == 3'd7 ;
  // register adcCore1_spiI_csbR
  assign adcCore1_spiI_csbR$D_IN = !adcCore1_spiI_cGate_1$whas ;
  assign adcCore1_spiI_csbR$EN = 1'd1 ;
  // register adcCore1_spiI_dPos
  assign adcCore1_spiI_dPos$D_IN =
	     WILL_FIRE_RL_adcCore1_spiI_send_d ?
	       MUX_adcCore1_spiI_dPos$write_1__VAL_1 :
	       3'h7 ;
  assign adcCore1_spiI_dPos$EN =
	     WILL_FIRE_RL_adcCore1_spiI_send_d ||
	     WILL_FIRE_RL_adcCore1_spiI_start_cs ;
  // register adcCore1_spiI_doResp
  assign adcCore1_spiI_doResp$D_IN =
	     MUX_adcCore1_spiI_xmt_d$write_1__SEL_2 &&
	     adcCore1_spiI_reqS[16] ;
  assign adcCore1_spiI_doResp$EN = 1'd1 ;
  // register adcCore1_spiI_iPos
  assign adcCore1_spiI_iPos$D_IN =
	     WILL_FIRE_RL_adcCore1_spiI_send_i ?
	       MUX_adcCore1_spiI_iPos$write_1__VAL_1 :
	       4'h7 ;
  assign adcCore1_spiI_iPos$EN =
	     WILL_FIRE_RL_adcCore1_spiI_send_i ||
	     WILL_FIRE_RL_adcCore1_spiI_start_cs ;
  // register adcCore1_spiI_reqF_head_wrapped
  assign adcCore1_spiI_reqF_head_wrapped$D_IN =
	     WILL_FIRE_RL_adcCore1_spiI_reqF_deq_update_head &&
	     !adcCore1_spiI_reqF_head_wrapped ;
  assign adcCore1_spiI_reqF_head_wrapped$EN =
	     WILL_FIRE_RL_adcCore1_spiI_reqF_deq_update_head ||
	     adcCore1_spiI_reqF_dInReset$VAL ;
  // register adcCore1_spiI_reqF_tail_wrapped
  assign adcCore1_spiI_reqF_tail_wrapped$D_IN =
	     WILL_FIRE_RL_adcCore1_spiI_reqF_enq_update_tail &&
	     !adcCore1_spiI_reqF_tail_wrapped ;
  assign adcCore1_spiI_reqF_tail_wrapped$EN =
	     WILL_FIRE_RL_adcCore1_spiI_reqF_enq_update_tail ||
	     adcCore1_spiI_reqF_sInReset$VAL ;
  // register adcCore1_spiI_reqS
  always@(WILL_FIRE_RL_adcCore1_advance_spi_request or
	  MUX_adcCore1_spiI_reqS$write_1__VAL_1 or
	  WILL_FIRE_RL_adcCore1_iseqFsm_action_l119c9 or
	  WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9 or
	  WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9 or
	  WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9 or
	  WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 or
	  WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_adcCore1_advance_spi_request:
	  adcCore1_spiI_reqS$D_IN = MUX_adcCore1_spiI_reqS$write_1__VAL_1;
      WILL_FIRE_RL_adcCore1_iseqFsm_action_l119c9:
	  adcCore1_spiI_reqS$D_IN = 17'd20486;
      WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9:
	  adcCore1_spiI_reqS$D_IN = 17'd20788;
      WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9:
	  adcCore1_spiI_reqS$D_IN = 17'd21010;
      WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9:
	  adcCore1_spiI_reqS$D_IN = 17'd21568;
      WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9:
	  adcCore1_spiI_reqS$D_IN = 17'd21776;
      WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9:
	  adcCore1_spiI_reqS$D_IN = 17'd25092;
      default: adcCore1_spiI_reqS$D_IN =
		   17'b01010101010101010 /* unspecified value */ ;
    endcase
  end
  assign adcCore1_spiI_reqS$EN =
	     WILL_FIRE_RL_adcCore1_advance_spi_request ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l119c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 ||
	     WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9 ;
  // register adcCore1_spiI_respF_head_wrapped
  assign adcCore1_spiI_respF_head_wrapped$D_IN =
	     WILL_FIRE_RL_adcCore1_spiI_respF_deq_update_head &&
	     !adcCore1_spiI_respF_head_wrapped ;
  assign adcCore1_spiI_respF_head_wrapped$EN =
	     WILL_FIRE_RL_adcCore1_spiI_respF_deq_update_head ||
	     adcCore1_spiI_respF_dInReset$VAL ;
  // register adcCore1_spiI_respF_tail_wrapped
  assign adcCore1_spiI_respF_tail_wrapped$D_IN =
	     WILL_FIRE_RL_adcCore1_spiI_respF_enq_update_tail &&
	     !adcCore1_spiI_respF_tail_wrapped ;
  assign adcCore1_spiI_respF_tail_wrapped$EN =
	     WILL_FIRE_RL_adcCore1_spiI_respF_enq_update_tail ||
	     adcCore1_spiI_respF_sInReset$VAL ;
  // register adcCore1_spiI_respS
  assign adcCore1_spiI_respS$D_IN =
	     { adcCore1_spiI_cap_6,
	       adcCore1_spiI_cap_5,
	       adcCore1_spiI_cap_4,
	       adcCore1_spiI_cap_3,
	       adcCore1_spiI_cap_2,
	       adcCore1_spiI_cap_1,
	       adcCore1_spiI_cap,
	       adcCore1_spiI_sdiP } ;
  assign adcCore1_spiI_respS$EN = adcCore1_spiI_respF_enq_pw$whas ;
  // register adcCore1_spiI_sdiP
  assign adcCore1_spiI_sdiP$D_IN = adc1_sdout_arg ;
  assign adcCore1_spiI_sdiP$EN = 1'd1 ;
  // register adcCore1_spiI_sdoR
  assign adcCore1_spiI_sdoR$D_IN =
	     adcCore1_spiI_cGate_1$whas && adcCore1_spiI_sdoR_1$wget ;
  assign adcCore1_spiI_sdoR$EN = 1'd1 ;
  // register adcCore1_spiI_xmt_d
  assign adcCore1_spiI_xmt_d$D_IN =
	     WILL_FIRE_RL_adcCore1_spiI_send_i && adcCore1_spiI_iPos == 4'd0 ;
  assign adcCore1_spiI_xmt_d$EN =
	     WILL_FIRE_RL_adcCore1_spiI_send_d &&
	     adcCore1_spiI_dPos == 3'd0 ||
	     WILL_FIRE_RL_adcCore1_spiI_send_i ;
  // register adcCore1_spiI_xmt_i
  assign adcCore1_spiI_xmt_i$D_IN =
	     !WILL_FIRE_RL_adcCore1_spiI_send_i ||
	     adcCore1_spiI_iPos != 4'd0 ;
  assign adcCore1_spiI_xmt_i$EN =
	     WILL_FIRE_RL_adcCore1_spiI_send_i ||
	     WILL_FIRE_RL_adcCore1_spiI_start_cs ;
  // register adcIdc_doResetCount
  assign adcIdc_doResetCount$D_IN =
	     (adcIdc_doResetCount == 4'hF) ?
	       adcIdc_doResetCount :
	       adcIdc_doResetCount + 4'd1 ;
  assign adcIdc_doResetCount$EN = adcIdc_preResetCount == 4'hF ;
  // register adcIdc_preResetCount
  assign adcIdc_preResetCount$D_IN =
	     (adcIdc_preResetCount == 4'hF) ?
	       adcIdc_preResetCount :
	       adcIdc_preResetCount + 4'd1 ;
  assign adcIdc_preResetCount$EN = 1'd1 ;
  // register fcAdc_countNow
  assign fcAdc_countNow$D_IN =
	     { fcAdc_grayCounter_rdCounter[17],
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2132,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2151,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2133,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2134,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2149,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2135,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2136,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2137,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2153,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2152,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2154,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2138,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2139,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2141,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2147,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2140,
	       fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2140 ^
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
  assign fcAdc_pulseAction$D_IN = oneKHz_value == 18'd124999 ;
  assign fcAdc_pulseAction$EN = 1'd1 ;
  // register fcAdc_sampleCount
  assign fcAdc_sampleCount$D_IN = fcAdc_sampleCount + 16'd1 ;
  assign fcAdc_sampleCount$EN = fcAdc_pulseAction ;
  // register initOpInFlight
  assign initOpInFlight$D_IN = WILL_FIRE_RL_wci_ctrl_EiI ;
  assign initOpInFlight$EN =
	     WILL_FIRE_RL_init_complete_ok || WILL_FIRE_RL_wci_ctrl_EiI ;
  // register lastOverflowMesg
  assign lastOverflowMesg$D_IN = mesgCount ;
  assign lastOverflowMesg$EN =
	     wci_wslv_cState == 3'd2 &&
	     overflowCountD != adcCore0_statsCC$dD_OUT[31:0] ;
  // register maxMesgLength
  assign maxMesgLength$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign maxMesgLength$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h08 ;
  // register mesgCount
  assign mesgCount$D_IN = mesgCount + 32'd1 ;
  assign mesgCount$EN =
	     WILL_FIRE_RL_doMessage && adcCore0_sampF_memory$DOB[36] ;
  // register oneKHz_value
  assign oneKHz_value$D_IN = MUX_oneKHz_value$write_1__VAL_1 ;
  assign oneKHz_value$EN = 1'b1 ;
  // register overflowCountD
  assign overflowCountD$D_IN = adcCore0_statsCC$dD_OUT[31:0] ;
  assign overflowCountD$EN = wci_wslv_cState == 3'd2 ;
  // register sFlagState
  assign sFlagState$D_IN = 1'b0 ;
  assign sFlagState$EN = 1'b0 ;
  // register spiClk_iState
  assign spiClk_iState$D_IN = 4'h0 ;
  assign spiClk_iState$EN = 1'b0 ;
  // register spiClk_iseqFsm_start_reg
  assign spiClk_iseqFsm_start_reg$D_IN =
	     !WILL_FIRE_RL_spiClk_iseqFsm_fsm_start ;
  assign spiClk_iseqFsm_start_reg$EN =
	     WILL_FIRE_RL_spiClk_iseqFsm_fsm_start ||
	     WILL_FIRE_RL_wci_ctrl_EiI ;
  // register spiClk_iseqFsm_start_reg_1
  assign spiClk_iseqFsm_start_reg_1$D_IN = spiClk_iseqFsm_start_wire$whas ;
  assign spiClk_iseqFsm_start_reg_1$EN = 1'd1 ;
  // register spiClk_iseqFsm_state_can_overlap
  assign spiClk_iseqFsm_state_can_overlap$D_IN =
	     spiClk_iseqFsm_state_set_pw$whas ||
	     spiClk_iseqFsm_state_can_overlap ;
  assign spiClk_iseqFsm_state_can_overlap$EN = 1'd1 ;
  // register spiClk_iseqFsm_state_fired
  assign spiClk_iseqFsm_state_fired$D_IN = spiClk_iseqFsm_state_set_pw$whas ;
  assign spiClk_iseqFsm_state_fired$EN = 1'd1 ;
  // register spiClk_iseqFsm_state_mkFSMstate
  always@(WILL_FIRE_RL_spiClk_iseqFsm_idle_l43c3 or
	  WILL_FIRE_RL_spiClk_iseqFsm_action_l44c9 or
	  WILL_FIRE_RL_spiClk_iseqFsm_action_l45c9 or
	  WILL_FIRE_RL_spiClk_iseqFsm_action_l46c9 or
	  WILL_FIRE_RL_spiClk_iseqFsm_action_l47c9 or
	  WILL_FIRE_RL_spiClk_iseqFsm_action_l48c9 or
	  WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9 or
	  WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_spiClk_iseqFsm_idle_l43c3:
	  spiClk_iseqFsm_state_mkFSMstate$D_IN = 4'd0;
      WILL_FIRE_RL_spiClk_iseqFsm_action_l44c9:
	  spiClk_iseqFsm_state_mkFSMstate$D_IN = 4'd1;
      WILL_FIRE_RL_spiClk_iseqFsm_action_l45c9:
	  spiClk_iseqFsm_state_mkFSMstate$D_IN = 4'd2;
      WILL_FIRE_RL_spiClk_iseqFsm_action_l46c9:
	  spiClk_iseqFsm_state_mkFSMstate$D_IN = 4'd3;
      WILL_FIRE_RL_spiClk_iseqFsm_action_l47c9:
	  spiClk_iseqFsm_state_mkFSMstate$D_IN = 4'd4;
      WILL_FIRE_RL_spiClk_iseqFsm_action_l48c9:
	  spiClk_iseqFsm_state_mkFSMstate$D_IN = 4'd5;
      WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9:
	  spiClk_iseqFsm_state_mkFSMstate$D_IN = 4'd6;
      WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9:
	  spiClk_iseqFsm_state_mkFSMstate$D_IN = 4'd7;
      default: spiClk_iseqFsm_state_mkFSMstate$D_IN =
		   4'b1010 /* unspecified value */ ;
    endcase
  end
  assign spiClk_iseqFsm_state_mkFSMstate$EN =
	     WILL_FIRE_RL_spiClk_iseqFsm_idle_l43c3 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l44c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l45c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l46c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l47c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l48c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9 ;
  // register spiClk_spiI_cGate
  assign spiClk_spiI_cGate$D_IN = spiClk_spiI_cGate_1$whas ;
  assign spiClk_spiI_cGate$EN = 1'd1 ;
  // register spiClk_spiI_cap
  assign spiClk_spiI_cap$D_IN = spiClk_spiI_sdiP ;
  assign spiClk_spiI_cap$EN = MUX_spiClk_spiI_xmt_d$write_1__SEL_2 ;
  // register spiClk_spiI_cap_1
  assign spiClk_spiI_cap_1$D_IN = spiClk_spiI_sdiP ;
  assign spiClk_spiI_cap_1$EN =
	     WILL_FIRE_RL_spiClk_spiI_send_d && spiClk_spiI_dPos == 3'd1 ;
  // register spiClk_spiI_cap_2
  assign spiClk_spiI_cap_2$D_IN = spiClk_spiI_sdiP ;
  assign spiClk_spiI_cap_2$EN =
	     WILL_FIRE_RL_spiClk_spiI_send_d && spiClk_spiI_dPos == 3'd2 ;
  // register spiClk_spiI_cap_3
  assign spiClk_spiI_cap_3$D_IN = spiClk_spiI_sdiP ;
  assign spiClk_spiI_cap_3$EN =
	     WILL_FIRE_RL_spiClk_spiI_send_d && spiClk_spiI_dPos == 3'd3 ;
  // register spiClk_spiI_cap_4
  assign spiClk_spiI_cap_4$D_IN = spiClk_spiI_sdiP ;
  assign spiClk_spiI_cap_4$EN =
	     WILL_FIRE_RL_spiClk_spiI_send_d && spiClk_spiI_dPos == 3'd4 ;
  // register spiClk_spiI_cap_5
  assign spiClk_spiI_cap_5$D_IN = spiClk_spiI_sdiP ;
  assign spiClk_spiI_cap_5$EN =
	     WILL_FIRE_RL_spiClk_spiI_send_d && spiClk_spiI_dPos == 3'd5 ;
  // register spiClk_spiI_cap_6
  assign spiClk_spiI_cap_6$D_IN = spiClk_spiI_sdiP ;
  assign spiClk_spiI_cap_6$EN =
	     WILL_FIRE_RL_spiClk_spiI_send_d && spiClk_spiI_dPos == 3'd6 ;
  // register spiClk_spiI_cap_7
  assign spiClk_spiI_cap_7$D_IN = spiClk_spiI_sdiP ;
  assign spiClk_spiI_cap_7$EN =
	     WILL_FIRE_RL_spiClk_spiI_send_d && spiClk_spiI_dPos == 3'd7 ;
  // register spiClk_spiI_csbR
  assign spiClk_spiI_csbR$D_IN = !spiClk_spiI_cGate_1$whas ;
  assign spiClk_spiI_csbR$EN = 1'd1 ;
  // register spiClk_spiI_dPos
  assign spiClk_spiI_dPos$D_IN =
	     WILL_FIRE_RL_spiClk_spiI_send_d ?
	       MUX_spiClk_spiI_dPos$write_1__VAL_1 :
	       3'h7 ;
  assign spiClk_spiI_dPos$EN =
	     WILL_FIRE_RL_spiClk_spiI_send_d ||
	     WILL_FIRE_RL_spiClk_spiI_start_cs ;
  // register spiClk_spiI_doResp
  assign spiClk_spiI_doResp$D_IN =
	     MUX_spiClk_spiI_xmt_d$write_1__SEL_2 && spiClk_spiI_reqS[16] ;
  assign spiClk_spiI_doResp$EN = 1'd1 ;
  // register spiClk_spiI_iPos
  assign spiClk_spiI_iPos$D_IN =
	     WILL_FIRE_RL_spiClk_spiI_send_i ?
	       MUX_spiClk_spiI_iPos$write_1__VAL_1 :
	       4'hF ;
  assign spiClk_spiI_iPos$EN =
	     WILL_FIRE_RL_spiClk_spiI_send_i ||
	     WILL_FIRE_RL_spiClk_spiI_start_cs ;
  // register spiClk_spiI_reqF_head_wrapped
  assign spiClk_spiI_reqF_head_wrapped$D_IN =
	     WILL_FIRE_RL_spiClk_spiI_reqF_deq_update_head &&
	     !spiClk_spiI_reqF_head_wrapped ;
  assign spiClk_spiI_reqF_head_wrapped$EN =
	     WILL_FIRE_RL_spiClk_spiI_reqF_deq_update_head ||
	     spiClk_spiI_reqF_dInReset$VAL ;
  // register spiClk_spiI_reqF_tail_wrapped
  assign spiClk_spiI_reqF_tail_wrapped$D_IN =
	     WILL_FIRE_RL_spiClk_spiI_reqF_enq_update_tail &&
	     !spiClk_spiI_reqF_tail_wrapped ;
  assign spiClk_spiI_reqF_tail_wrapped$EN =
	     WILL_FIRE_RL_spiClk_spiI_reqF_enq_update_tail ||
	     spiClk_spiI_reqF_sInReset$VAL ;
  // register spiClk_spiI_reqS
  always@(MUX_spiClk_spiI_reqS$write_1__SEL_1 or
	  MUX_adcCore0_reqF$enq_1__VAL_1 or
	  MUX_spiClk_spiI_reqS$write_1__SEL_2 or
	  MUX_adcCore0_reqF$enq_1__VAL_2 or
	  WILL_FIRE_RL_spiClk_iseqFsm_action_l44c9 or
	  WILL_FIRE_RL_spiClk_iseqFsm_action_l45c9 or
	  WILL_FIRE_RL_spiClk_iseqFsm_action_l46c9 or
	  WILL_FIRE_RL_spiClk_iseqFsm_action_l47c9 or
	  WILL_FIRE_RL_spiClk_iseqFsm_action_l48c9 or
	  WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9 or
	  WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_spiClk_spiI_reqS$write_1__SEL_1:
	  spiClk_spiI_reqS$D_IN = MUX_adcCore0_reqF$enq_1__VAL_1;
      MUX_spiClk_spiI_reqS$write_1__SEL_2:
	  spiClk_spiI_reqS$D_IN = MUX_adcCore0_reqF$enq_1__VAL_2;
      WILL_FIRE_RL_spiClk_iseqFsm_action_l44c9:
	  spiClk_spiI_reqS$D_IN = 17'd17666;
      WILL_FIRE_RL_spiClk_iseqFsm_action_l45c9:
	  spiClk_spiI_reqS$D_IN = 17'd19328;
      WILL_FIRE_RL_spiClk_iseqFsm_action_l46c9:
	  spiClk_spiI_reqS$D_IN = 17'd19840;
      WILL_FIRE_RL_spiClk_iseqFsm_action_l47c9:
	  spiClk_spiI_reqS$D_IN = 17'd20352;
      WILL_FIRE_RL_spiClk_iseqFsm_action_l48c9:
	  spiClk_spiI_reqS$D_IN = 17'd20864;
      WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9:
	  spiClk_spiI_reqS$D_IN = 17'd21376;
      WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9:
	  spiClk_spiI_reqS$D_IN = 17'd23041;
      default: spiClk_spiI_reqS$D_IN =
		   17'b01010101010101010 /* unspecified value */ ;
    endcase
  end
  assign spiClk_spiI_reqS$EN =
	     WILL_FIRE_RL_wci_cfwr &&
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	      wci_wslv_reqF$D_OUT[39:32] == 8'h24 ||
	      wci_wslv_reqF$D_OUT[43:42] == 2'b11) ||
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[43:42] == 2'b11 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l44c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l45c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l46c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l47c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l48c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9 ||
	     WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9 ;
  // register spiClk_spiI_respF_head_wrapped
  assign spiClk_spiI_respF_head_wrapped$D_IN =
	     WILL_FIRE_RL_spiClk_spiI_respF_deq_update_head &&
	     !spiClk_spiI_respF_head_wrapped ;
  assign spiClk_spiI_respF_head_wrapped$EN =
	     WILL_FIRE_RL_spiClk_spiI_respF_deq_update_head ||
	     spiClk_spiI_respF_dInReset$VAL ;
  // register spiClk_spiI_respF_tail_wrapped
  assign spiClk_spiI_respF_tail_wrapped$D_IN =
	     WILL_FIRE_RL_spiClk_spiI_respF_enq_update_tail &&
	     !spiClk_spiI_respF_tail_wrapped ;
  assign spiClk_spiI_respF_tail_wrapped$EN =
	     WILL_FIRE_RL_spiClk_spiI_respF_enq_update_tail ||
	     spiClk_spiI_respF_sInReset$VAL ;
  // register spiClk_spiI_respS
  assign spiClk_spiI_respS$D_IN =
	     { spiClk_spiI_cap_6,
	       spiClk_spiI_cap_5,
	       spiClk_spiI_cap_4,
	       spiClk_spiI_cap_3,
	       spiClk_spiI_cap_2,
	       spiClk_spiI_cap_1,
	       spiClk_spiI_cap,
	       spiClk_spiI_sdiP } ;
  assign spiClk_spiI_respS$EN = spiClk_spiI_respF_enq_pw$whas ;
  // register spiClk_spiI_sdiP
  assign spiClk_spiI_sdiP$D_IN = adx_sdi_arg ;
  assign spiClk_spiI_sdiP$EN = 1'd1 ;
  // register spiClk_spiI_sdoR
  assign spiClk_spiI_sdoR$D_IN =
	     spiClk_spiI_sdoR_1$whas && spiClk_spiI_sdoR_1$wget ;
  assign spiClk_spiI_sdoR$EN = 1'd1 ;
  // register spiClk_spiI_xmt_d
  assign spiClk_spiI_xmt_d$D_IN =
	     WILL_FIRE_RL_spiClk_spiI_send_i && spiClk_spiI_iPos == 4'd0 ;
  assign spiClk_spiI_xmt_d$EN =
	     WILL_FIRE_RL_spiClk_spiI_send_d && spiClk_spiI_dPos == 3'd0 ||
	     WILL_FIRE_RL_spiClk_spiI_send_i ;
  // register spiClk_spiI_xmt_i
  assign spiClk_spiI_xmt_i$D_IN =
	     !WILL_FIRE_RL_spiClk_spiI_send_i || spiClk_spiI_iPos != 4'd0 ;
  assign spiClk_spiI_xmt_i$EN =
	     WILL_FIRE_RL_spiClk_spiI_send_i ||
	     WILL_FIRE_RL_spiClk_spiI_start_cs ;
  // register spiResp
  always@(MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1 or
	  spiClk_spiI_respS or
	  MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2 or
	  adcCore0_spiI_respS or
	  WILL_FIRE_RL_get_adc1_resp or adcCore1_spiI_respS)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1:
	  spiResp$D_IN = spiClk_spiI_respS;
      MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2:
	  spiResp$D_IN = adcCore0_spiI_respS;
      WILL_FIRE_RL_get_adc1_resp: spiResp$D_IN = adcCore1_spiI_respS;
      default: spiResp$D_IN = 8'b10101010 /* unspecified value */ ;
    endcase
  end
  assign spiResp$EN =
	     MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1 ||
	     MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2 ||
	     WILL_FIRE_RL_get_adc1_resp ;
  // register splitReadInFlight
  assign splitReadInFlight$D_IN = !MUX_splitReadInFlight$write_1__SEL_1 ;
  assign splitReadInFlight$EN =
	     (WILL_FIRE_RL_get_adc1_resp ||
	      MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2 ||
	      MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1) &&
	     splitReadInFlight ||
	     WILL_FIRE_RL_wci_cfrd &&
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b01 ||
	      wci_wslv_reqF$D_OUT[43:42] == 2'b10 ||
	      wci_wslv_reqF$D_OUT[43:42] == 2'b11) ;
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
	  MUX_wsiM_reqFifo_q_1$write_1__VAL_2 or
	  WILL_FIRE_RL_wsiM_reqFifo_decCtr or wsiM_reqFifo_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wsiM_reqFifo_both:
	  wsiM_reqFifo_q_0$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_1;
      MUX_wsiM_reqFifo_q_0$write_1__SEL_2:
	  wsiM_reqFifo_q_0$D_IN = MUX_wsiM_reqFifo_q_1$write_1__VAL_2;
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
	  MUX_wsiM_reqFifo_q_1$write_1__VAL_2 or
	  WILL_FIRE_RL_wsiM_reqFifo_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wsiM_reqFifo_both:
	  wsiM_reqFifo_q_1$D_IN = MUX_wsiM_reqFifo_q_1$write_1__VAL_1;
      MUX_wsiM_reqFifo_q_1$write_1__SEL_2:
	  wsiM_reqFifo_q_1$D_IN = MUX_wsiM_reqFifo_q_1$write_1__VAL_2;
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
  // submodule adcCore0_acquireD
  assign adcCore0_acquireD$sD_IN = adcCore0_acquireDReg ;
  assign adcCore0_acquireD$sEN =
	     adcCore0_operateD$sRDY && adcCore0_acquireD$sRDY &&
	     adcCore0_averageD$sRDY ;
  // submodule adcCore0_averageD
  assign adcCore0_averageD$sD_IN = adcCore0_averageDReg ;
  assign adcCore0_averageD$sEN =
	     adcCore0_operateD$sRDY && adcCore0_acquireD$sRDY &&
	     adcCore0_averageD$sRDY ;
  // submodule adcCore0_colGate_sampF
  always@(MUX_adcCore0_colGate_sampF$enq_1__SEL_1 or
	  MUX_adcCore0_colGate_sampF$enq_1__VAL_1 or
	  WILL_FIRE_RL_adcCore0_colGate_send_timestamp_mesg or
	  MUX_adcCore0_colGate_sampF$enq_1__VAL_2 or
	  WILL_FIRE_RL_adcCore0_colGate_capture_collect or
	  MUX_adcCore0_colGate_sampF$enq_1__VAL_3 or
	  WILL_FIRE_RL_adcCore0_colGate_send_sync_mesg)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_adcCore0_colGate_sampF$enq_1__SEL_1:
	  adcCore0_colGate_sampF$D_IN =
	      MUX_adcCore0_colGate_sampF$enq_1__VAL_1;
      WILL_FIRE_RL_adcCore0_colGate_send_timestamp_mesg:
	  adcCore0_colGate_sampF$D_IN =
	      MUX_adcCore0_colGate_sampF$enq_1__VAL_2;
      WILL_FIRE_RL_adcCore0_colGate_capture_collect:
	  adcCore0_colGate_sampF$D_IN =
	      MUX_adcCore0_colGate_sampF$enq_1__VAL_3;
      WILL_FIRE_RL_adcCore0_colGate_send_sync_mesg:
	  adcCore0_colGate_sampF$D_IN = 39'h3000000000;
      default: adcCore0_colGate_sampF$D_IN =
		   39'h2AAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign adcCore0_colGate_sampF$ENQ =
	     WILL_FIRE_RL_adcCore0_colGate_overrun_recovery &&
	     adcCore0_colGate_ovrRecover == 4'd15 ||
	     WILL_FIRE_RL_adcCore0_colGate_send_timestamp_mesg ||
	     WILL_FIRE_RL_adcCore0_colGate_capture_collect ||
	     WILL_FIRE_RL_adcCore0_colGate_send_sync_mesg ;
  assign adcCore0_colGate_sampF$DEQ = adcCore0_sampF_pwEnqueue$whas ;
  assign adcCore0_colGate_sampF$CLR = !adcCore0_operateD$dD_OUT ;
  // submodule adcCore0_ddrC_ddrV
  assign adcCore0_ddrC_ddrV$ddrDataN = adc0_ddn_arg ;
  assign adcCore0_ddrC_ddrV$ddrDataP = adc0_ddp_arg ;
  assign adcCore0_ddrC_ddrV$psEna = adcCore0_ddrC_psCmdReg[0] ;
  assign adcCore0_ddrC_ddrV$psInc = adcCore0_ddrC_psCmdReg[1] ;
  // submodule adcCore0_maxBurstLengthR
  assign adcCore0_maxBurstLengthR$sD_IN = maxMesgLength[17:2] ;
  assign adcCore0_maxBurstLengthR$sEN = adcCore0_maxBurstLengthR$sRDY ;
  // submodule adcCore0_operateD
  assign adcCore0_operateD$sD_IN = adcCore0_operateDReg ;
  assign adcCore0_operateD$sEN =
	     adcCore0_operateD$sRDY && adcCore0_acquireD$sRDY &&
	     adcCore0_averageD$sRDY ;
  // submodule adcCore0_reqF
  assign adcCore0_reqF$D_IN =
	     MUX_adcCore0_reqF$enq_1__SEL_1 ?
	       MUX_adcCore0_reqF$enq_1__VAL_1 :
	       MUX_adcCore0_reqF$enq_1__VAL_2 ;
  assign adcCore0_reqF$ENQ =
	     WILL_FIRE_RL_wci_cfwr &&
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	      wci_wslv_reqF$D_OUT[39:32] == 8'h28 ||
	      wci_wslv_reqF$D_OUT[43:42] == 2'b01) ||
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[43:42] == 2'b01 ;
  assign adcCore0_reqF$DEQ =
	     WILL_FIRE_RL_adcCore0_advance_spi_request &&
	     (!adcCore0_reqF$D_OUT[16] || adcCore0_readMode) &&
	     (adcCore0_reqF$D_OUT[16] || !adcCore0_readMode) ;
  assign adcCore0_reqF$CLR = 1'b0 ;
  // submodule adcCore0_sampCC
  assign adcCore0_sampCC$sD_IN = adcCore0_samp ;
  assign adcCore0_sampCC$sEN = adcCore0_sampCC$sRDY ;
  // submodule adcCore0_sampF_memory
  assign adcCore0_sampF_memory$ADDRA =
	     { adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2157,
	       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2142,
	       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2155,
	       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2143,
	       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2144,
	       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2148,
	       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2145,
	       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2146,
	       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2156,
	       adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2156 ^
	       adcCore0_sampF_rWrPtr_rsCounter[0] } ;
  assign adcCore0_sampF_memory$ADDRB =
	     adcCore0_sampF_pwDequeue$whas ? x__h44308[9:0] : x2__h44277 ;
  assign adcCore0_sampF_memory$DIA =
	     { adcCore0_sampF_pwEnqueue$whas ?
		 adcCore0_colGate_sampF$D_OUT[38:37] :
		 2'd0,
	       adcCore0_sampF_pwEnqueue$whas &&
	       adcCore0_colGate_sampF$D_OUT[36],
	       adcCore0_sampF_pwEnqueue$whas ?
		 adcCore0_colGate_sampF$D_OUT[35:0] :
		 36'd0 } ;
  assign adcCore0_sampF_memory$DIB = 39'h2AAAAAAAAA /* unspecified value */  ;
  assign adcCore0_sampF_memory$WEA = adcCore0_sampF_pwEnqueue$whas ;
  assign adcCore0_sampF_memory$WEB = 1'd0 ;
  assign adcCore0_sampF_memory$ENA = 1'd1 ;
  assign adcCore0_sampF_memory$ENB = 1'd1 ;
  // submodule adcCore0_statsCC
  assign adcCore0_statsCC$sD_IN =
	     { adcCore0_colGate_dropCount,
	       adcCore0_colGate_sampCount,
	       adcCore0_colGate_dwellStarts,
	       adcCore0_colGate_dwellFails } ;
  assign adcCore0_statsCC$sEN = adcCore0_statsCC$sRDY ;
  // submodule adcCore1_acquireD
  assign adcCore1_acquireD$sD_IN = adcCore1_acquireDReg ;
  assign adcCore1_acquireD$sEN =
	     adcCore1_operateD$sRDY && adcCore1_acquireD$sRDY &&
	     adcCore1_averageD$sRDY ;
  // submodule adcCore1_averageD
  assign adcCore1_averageD$sD_IN = adcCore1_averageDReg ;
  assign adcCore1_averageD$sEN =
	     adcCore1_operateD$sRDY && adcCore1_acquireD$sRDY &&
	     adcCore1_averageD$sRDY ;
  // submodule adcCore1_colGate_sampF
  always@(MUX_adcCore1_colGate_sampF$enq_1__SEL_1 or
	  MUX_adcCore1_colGate_sampF$enq_1__VAL_1 or
	  WILL_FIRE_RL_adcCore1_colGate_send_timestamp_mesg or
	  MUX_adcCore1_colGate_sampF$enq_1__VAL_2 or
	  WILL_FIRE_RL_adcCore1_colGate_capture_collect or
	  MUX_adcCore1_colGate_sampF$enq_1__VAL_3 or
	  WILL_FIRE_RL_adcCore1_colGate_send_sync_mesg)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_adcCore1_colGate_sampF$enq_1__SEL_1:
	  adcCore1_colGate_sampF$D_IN =
	      MUX_adcCore1_colGate_sampF$enq_1__VAL_1;
      WILL_FIRE_RL_adcCore1_colGate_send_timestamp_mesg:
	  adcCore1_colGate_sampF$D_IN =
	      MUX_adcCore1_colGate_sampF$enq_1__VAL_2;
      WILL_FIRE_RL_adcCore1_colGate_capture_collect:
	  adcCore1_colGate_sampF$D_IN =
	      MUX_adcCore1_colGate_sampF$enq_1__VAL_3;
      WILL_FIRE_RL_adcCore1_colGate_send_sync_mesg:
	  adcCore1_colGate_sampF$D_IN = 39'h3000000000;
      default: adcCore1_colGate_sampF$D_IN =
		   39'h2AAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign adcCore1_colGate_sampF$ENQ =
	     WILL_FIRE_RL_adcCore1_colGate_overrun_recovery &&
	     adcCore1_colGate_ovrRecover == 4'd15 ||
	     WILL_FIRE_RL_adcCore1_colGate_send_timestamp_mesg ||
	     WILL_FIRE_RL_adcCore1_colGate_capture_collect ||
	     WILL_FIRE_RL_adcCore1_colGate_send_sync_mesg ;
  assign adcCore1_colGate_sampF$DEQ = adcCore1_sampF_pwEnqueue$whas ;
  assign adcCore1_colGate_sampF$CLR = !adcCore1_operateD$dD_OUT ;
  // submodule adcCore1_ddrC_ddrV
  assign adcCore1_ddrC_ddrV$ddrDataN = adc1_ddn_arg ;
  assign adcCore1_ddrC_ddrV$ddrDataP = adc1_ddp_arg ;
  assign adcCore1_ddrC_ddrV$psEna = adcCore1_ddrC_psCmdReg[0] ;
  assign adcCore1_ddrC_ddrV$psInc = adcCore1_ddrC_psCmdReg[1] ;
  // submodule adcCore1_maxBurstLengthR
  assign adcCore1_maxBurstLengthR$sD_IN = 16'h0 ;
  assign adcCore1_maxBurstLengthR$sEN = 1'b0 ;
  // submodule adcCore1_operateD
  assign adcCore1_operateD$sD_IN = adcCore1_operateDReg ;
  assign adcCore1_operateD$sEN =
	     adcCore1_operateD$sRDY && adcCore1_acquireD$sRDY &&
	     adcCore1_averageD$sRDY ;
  // submodule adcCore1_reqF
  assign adcCore1_reqF$D_IN =
	     MUX_adcCore1_reqF$enq_1__SEL_1 ?
	       MUX_adcCore0_reqF$enq_1__VAL_1 :
	       MUX_adcCore0_reqF$enq_1__VAL_2 ;
  assign adcCore1_reqF$ENQ =
	     WILL_FIRE_RL_wci_cfwr &&
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b0 &&
	      wci_wslv_reqF$D_OUT[39:32] == 8'h2C ||
	      wci_wslv_reqF$D_OUT[43:42] == 2'b10) ||
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[43:42] == 2'b10 ;
  assign adcCore1_reqF$DEQ =
	     WILL_FIRE_RL_adcCore1_advance_spi_request &&
	     (!adcCore1_reqF$D_OUT[16] || adcCore1_readMode) &&
	     (adcCore1_reqF$D_OUT[16] || !adcCore1_readMode) ;
  assign adcCore1_reqF$CLR = 1'b0 ;
  // submodule adcCore1_sampCC
  assign adcCore1_sampCC$sD_IN = adcCore1_samp ;
  assign adcCore1_sampCC$sEN = adcCore1_sampCC$sRDY ;
  // submodule adcCore1_sampF_memory
  assign adcCore1_sampF_memory$ADDRA =
	     { adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2180,
	       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2179,
	       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2201,
	       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2181,
	       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2182,
	       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2183,
	       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2184,
	       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2186,
	       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2185,
	       adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2185 ^
	       adcCore1_sampF_rWrPtr_rsCounter[0] } ;
  assign adcCore1_sampF_memory$ADDRB = x2__h89987 ;
  assign adcCore1_sampF_memory$DIA =
	     { adcCore1_sampF_pwEnqueue$whas ?
		 adcCore1_colGate_sampF$D_OUT[38:37] :
		 2'd0,
	       adcCore1_sampF_pwEnqueue$whas &&
	       adcCore1_colGate_sampF$D_OUT[36],
	       adcCore1_sampF_pwEnqueue$whas ?
		 adcCore1_colGate_sampF$D_OUT[35:0] :
		 36'd0 } ;
  assign adcCore1_sampF_memory$DIB = 39'h2AAAAAAAAA /* unspecified value */  ;
  assign adcCore1_sampF_memory$WEA = adcCore1_sampF_pwEnqueue$whas ;
  assign adcCore1_sampF_memory$WEB = 1'd0 ;
  assign adcCore1_sampF_memory$ENA = 1'd1 ;
  assign adcCore1_sampF_memory$ENB = 1'd1 ;
  // submodule adcCore1_statsCC
  assign adcCore1_statsCC$sD_IN =
	     { adcCore1_colGate_dropCount,
	       adcCore1_colGate_sampCount,
	       adcCore1_colGate_dwellStarts,
	       adcCore1_colGate_dwellFails } ;
  assign adcCore1_statsCC$sEN = adcCore1_statsCC$sRDY ;
  // submodule adcIdcRdyBit
  assign adcIdcRdyBit$sD_IN = adcIdc$RDY ;
  assign adcIdcRdyBit$sEN = 1'd1 ;
  // submodule adcIdc_idcRst
  assign adcIdc_idcRst$ASSERT_IN =
	     adcIdc_preResetCount == 4'hF && adcIdc_doResetCount != 4'hF ;
  // submodule wci_wslv_reqF
  assign wci_wslv_reqF$D_IN = wci_wslv_wciReq$wget ;
  assign wci_wslv_reqF$ENQ = wci_wslv_wciReq$wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF$DEQ = wci_wslv_reqF_r_deq$whas ;
  assign wci_wslv_reqF$CLR = 1'b0 ;
  // remaining internal signals
  assign IF_adcCore0_sampF_rRdPtr_rsCounter_59_BIT_0_66_ETC___d2461 =
	     adcCore0_sampF_rRdPtr_rsCounter_59_BIT_0_66_XO_ETC___d2328 ?
	       IF_adcCore0_sampF_rRdPtr_rsCounter_59_BIT_0_66_ETC___d2462 :
	       32'd0 ;
  assign IF_adcCore0_sampF_rRdPtr_rsCounter_59_BIT_0_66_ETC___d2462 =
	     (adcCore0_sampF_rRdPtr_rsCounter[0] ||
	      adcCore0_sampF_rRdPtr_rsCounter[1] ||
	      adcCore0_sampF_rRdPtr_rsCounter[2] ||
	      adcCore0_sampF_rRdPtr_rsCounter[3] ||
	      adcCore0_sampF_rRdPtr_rsCounter[4] ||
	      adcCore0_sampF_rRdPtr_rsCounter[5] ||
	      adcCore0_sampF_rRdPtr_rsCounter[6] ||
	      adcCore0_sampF_rRdPtr_rsCounter[7] ||
	      adcCore0_sampF_rRdPtr_rsCounter[8] ||
	      adcCore0_sampF_rRdPtr_rsCounter[9]) ?
	       (adcCore0_sampF_rRdPtr_rsCounter[0] ?
		  32'd1 :
		  (adcCore0_sampF_rRdPtr_rsCounter[1] ?
		     32'd2 :
		     (adcCore0_sampF_rRdPtr_rsCounter[2] ?
			32'd3 :
			(adcCore0_sampF_rRdPtr_rsCounter[3] ?
			   32'd4 :
			   (adcCore0_sampF_rRdPtr_rsCounter[4] ?
			      32'd5 :
			      (adcCore0_sampF_rRdPtr_rsCounter[5] ?
				 32'd6 :
				 (adcCore0_sampF_rRdPtr_rsCounter[6] ?
				    32'd7 :
				    (adcCore0_sampF_rRdPtr_rsCounter[7] ?
				       32'd8 :
				       (adcCore0_sampF_rRdPtr_rsCounter[8] ?
					  32'd9 :
					  (adcCore0_sampF_rRdPtr_rsCounter[9] ?
					     32'd10 :
					     (adcCore0_sampF_rRdPtr_rsCounter[10] ?
						32'd11 :
						32'd12))))))))))) :
	       32'd10 ;
  assign IF_adcCore0_sampF_rWrPtr_rsCounter_90_BIT_0_97_ETC___d2458 =
	     adcCore0_sampF_rWrPtr_rsCounter_90_BIT_0_97_XO_ETC___d2327 ?
	       IF_adcCore0_sampF_rWrPtr_rsCounter_90_BIT_0_97_ETC___d2459 :
	       32'd0 ;
  assign IF_adcCore0_sampF_rWrPtr_rsCounter_90_BIT_0_97_ETC___d2459 =
	     (adcCore0_sampF_rWrPtr_rsCounter[0] ||
	      adcCore0_sampF_rWrPtr_rsCounter[1] ||
	      adcCore0_sampF_rWrPtr_rsCounter[2] ||
	      adcCore0_sampF_rWrPtr_rsCounter[3] ||
	      adcCore0_sampF_rWrPtr_rsCounter[4] ||
	      adcCore0_sampF_rWrPtr_rsCounter[5] ||
	      adcCore0_sampF_rWrPtr_rsCounter[6] ||
	      adcCore0_sampF_rWrPtr_rsCounter[7] ||
	      adcCore0_sampF_rWrPtr_rsCounter[8] ||
	      adcCore0_sampF_rWrPtr_rsCounter[9]) ?
	       (adcCore0_sampF_rWrPtr_rsCounter[0] ?
		  32'd1 :
		  (adcCore0_sampF_rWrPtr_rsCounter[1] ?
		     32'd2 :
		     (adcCore0_sampF_rWrPtr_rsCounter[2] ?
			32'd3 :
			(adcCore0_sampF_rWrPtr_rsCounter[3] ?
			   32'd4 :
			   (adcCore0_sampF_rWrPtr_rsCounter[4] ?
			      32'd5 :
			      (adcCore0_sampF_rWrPtr_rsCounter[5] ?
				 32'd6 :
				 (adcCore0_sampF_rWrPtr_rsCounter[6] ?
				    32'd7 :
				    (adcCore0_sampF_rWrPtr_rsCounter[7] ?
				       32'd8 :
				       (adcCore0_sampF_rWrPtr_rsCounter[8] ?
					  32'd9 :
					  (adcCore0_sampF_rWrPtr_rsCounter[9] ?
					     32'd10 :
					     (adcCore0_sampF_rWrPtr_rsCounter[10] ?
						32'd11 :
						32'd12))))))))))) :
	       32'd10 ;
  assign IF_adcCore1_sampF_rWrPtr_rsCounter_337_BIT_0_3_ETC___d2467 =
	     adcCore1_sampF_rWrPtr_rsCounter_337_BIT_0_344__ETC___d2338 ?
	       IF_adcCore1_sampF_rWrPtr_rsCounter_337_BIT_0_3_ETC___d2468 :
	       32'd0 ;
  assign IF_adcCore1_sampF_rWrPtr_rsCounter_337_BIT_0_3_ETC___d2468 =
	     (adcCore1_sampF_rWrPtr_rsCounter[0] ||
	      adcCore1_sampF_rWrPtr_rsCounter[1] ||
	      adcCore1_sampF_rWrPtr_rsCounter[2] ||
	      adcCore1_sampF_rWrPtr_rsCounter[3] ||
	      adcCore1_sampF_rWrPtr_rsCounter[4] ||
	      adcCore1_sampF_rWrPtr_rsCounter[5] ||
	      adcCore1_sampF_rWrPtr_rsCounter[6] ||
	      adcCore1_sampF_rWrPtr_rsCounter[7] ||
	      adcCore1_sampF_rWrPtr_rsCounter[8] ||
	      adcCore1_sampF_rWrPtr_rsCounter[9]) ?
	       (adcCore1_sampF_rWrPtr_rsCounter[0] ?
		  32'd1 :
		  (adcCore1_sampF_rWrPtr_rsCounter[1] ?
		     32'd2 :
		     (adcCore1_sampF_rWrPtr_rsCounter[2] ?
			32'd3 :
			(adcCore1_sampF_rWrPtr_rsCounter[3] ?
			   32'd4 :
			   (adcCore1_sampF_rWrPtr_rsCounter[4] ?
			      32'd5 :
			      (adcCore1_sampF_rWrPtr_rsCounter[5] ?
				 32'd6 :
				 (adcCore1_sampF_rWrPtr_rsCounter[6] ?
				    32'd7 :
				    (adcCore1_sampF_rWrPtr_rsCounter[7] ?
				       32'd8 :
				       (adcCore1_sampF_rWrPtr_rsCounter[8] ?
					  32'd9 :
					  (adcCore1_sampF_rWrPtr_rsCounter[9] ?
					     32'd10 :
					     (adcCore1_sampF_rWrPtr_rsCounter[10] ?
						32'd11 :
						32'd12))))))))))) :
	       32'd10 ;
  assign IF_fcAdc_grayCounter_rsCounter_60_BIT_0_67_OR__ETC___d2454 =
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
  assign IF_fcAdc_grayCounter_rsCounter_60_BIT_0_67_XOR_ETC___d2455 =
	     fcAdc_grayCounter_rsCounter_60_BIT_0_67_XOR_fc_ETC___d2326 ?
	       IF_fcAdc_grayCounter_rsCounter_60_BIT_0_67_OR__ETC___d2454 :
	       32'd0 ;
  assign IF_spiClk_spiI_iPos_89_EQ_15_90_THEN_NOT_spiCl_ETC___d401 =
	     (spiClk_spiI_iPos == 4'd15) ?
	       NOT_spiClk_spiI_reqF_head_wrapped__read__39_EQ_ETC___d382 &&
	       !spiClk_spiI_reqF_dInReset$VAL :
	       spiClk_spiI_iPos_89_EQ_14_92_OR_spiClk_spiI_iP_ETC___d400 ;
  assign IF_wci_wslv_reqF_first__5_BITS_43_TO_42_943_EQ_ETC___d1970 =
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b0) ?
	       wci_wslv_reqF$D_OUT[39:32] == 8'h08 ||
	       wci_wslv_reqF$D_OUT[39:32] == 8'h0C ||
	       CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_NOT_wci_ETC__q3 :
	       IF_wci_wslv_reqF_i_notEmpty__4_AND_wci_wslv_re_ETC___d2447 ;
  assign IF_wci_wslv_reqF_i_notEmpty__4_AND_wci_wslv_re_ETC___d1968 =
	     (wci_wslv_reqF$EMPTY_N && wci_wslv_reqF$D_OUT[43:42] == 2'b10) ?
	       adcCore1_reqF$FULL_N :
	       !wci_wslv_reqF$EMPTY_N ||
	       wci_wslv_reqF$D_OUT[43:42] != 2'b11 ||
	       spiClk_spiI_reqF_head_wrapped_crossed__31_EQ_s_ETC___d2402 ;
  assign IF_wci_wslv_reqF_i_notEmpty__4_AND_wci_wslv_re_ETC___d2447 =
	     (wci_wslv_reqF$EMPTY_N && wci_wslv_reqF$D_OUT[43:42] == 2'b01) ?
	       adcCore0_reqF$FULL_N :
	       IF_wci_wslv_reqF_i_notEmpty__4_AND_wci_wslv_re_ETC___d1968 ;
  assign NOT_adcCore0_sampF_rRdPtr_rsCounter_59_EQ_adcC_ETC___d1909 =
	     adcCore0_sampF_rRdPtr_rsCounter !=
	     adcCore0_sampF_rWrPtr_rdCounter ;
  assign NOT_adcCore0_spiI_reqF_head_wrapped__read__82__ETC___d1025 =
	     adcCore0_spiI_reqF_head_wrapped !=
	     adcCore0_spiI_reqF_tail_wrapped ;
  assign NOT_adcCore1_spiI_reqF_head_wrapped__read__629_ETC___d1672 =
	     adcCore1_spiI_reqF_head_wrapped !=
	     adcCore1_spiI_reqF_tail_wrapped ;
  assign NOT_spiClk_spiI_reqF_head_wrapped__read__39_EQ_ETC___d382 =
	     spiClk_spiI_reqF_head_wrapped != spiClk_spiI_reqF_tail_wrapped ;
  assign adcCore0_colGate_operatePW_whas__35_AND_adcCor_ETC___d590 =
	     adcCore0_operateD$dD_OUT && adcCore0_colGate_timeMesg == 3'd0 &&
	     adcCore0_acquireD$dD_OUT &&
	     adcCore0_colGate_collectD ;
  assign adcCore0_colGate_operatePW_whas__35_AND_adcCor_ETC___d601 =
	     adcCore0_colGate_operatePW_whas__35_AND_adcCor_ETC___d590 &&
	     adcCore0_colGate_syncMesg == 2'd0 &&
	     adcCore0_colGate_ovrRecover == 4'd0 &&
	     (!adcCore0_averageD$dD_OUT ||
	      adcCore0_colGate_avgPhase == 2'd0) ;
  assign adcCore0_colGate_sampF_RDY_first__04_AND_NOT_a_ETC___d961 =
	     adcCore0_colGate_sampF$EMPTY_N &&
	     adcCore0_sampF_rWrPtr_rsCounter !=
	     { adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[10],
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[10] ^
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[9],
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[9] ^
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[8],
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[8] ^
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[7],
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[7] ^
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[6],
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[6] ^
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[5],
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[5] ^
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[4],
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[4] ^
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[3],
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[3] ^
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[2],
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[2] ^
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[1],
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[1] ^
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176[0] } ;
  assign adcCore0_colGate_uprollCnt_04_EQ_adcCore0_colG_ETC___d2230 =
	     adcCore0_colGate_uprollCnt ==
	     adcCore0_maxBurstLengthR$dD_OUT - 16'd1 ;
  assign adcCore0_iseqFsm_abort_whas__080_AND_adcCore0__ETC___d1152 =
	     (adcCore0_iseqFsm_state_mkFSMstate == 4'd0 ||
	      adcCore0_iseqFsm_state_mkFSMstate == 4'd10) &&
	     (!adcCore0_iseqFsm_start_reg_1 || adcCore0_iseqFsm_state_fired) ;
  assign adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_C_ETC___d2176 =
	     x_dReadBin__h42694 + 11'd512 ;
  assign adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2169 =
	     adcCore0_sampF_rRdPtr_rdCounter[10] ^
	     adcCore0_sampF_rRdPtr_rdCounter[9] ;
  assign adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2170 =
	     adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2169 ^
	     adcCore0_sampF_rRdPtr_rdCounter[8] ;
  assign adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2171 =
	     adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2170 ^
	     adcCore0_sampF_rRdPtr_rdCounter[7] ;
  assign adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2172 =
	     adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2171 ^
	     adcCore0_sampF_rRdPtr_rdCounter[6] ;
  assign adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2173 =
	     adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2172 ^
	     adcCore0_sampF_rRdPtr_rdCounter[5] ;
  assign adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2174 =
	     adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2200 ^
	     adcCore0_sampF_rRdPtr_rdCounter[2] ;
  assign adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2175 =
	     adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2173 ^
	     adcCore0_sampF_rRdPtr_rdCounter[4] ;
  assign adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2178 =
	     adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2174 ^
	     adcCore0_sampF_rRdPtr_rdCounter[1] ;
  assign adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2200 =
	     adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2175 ^
	     adcCore0_sampF_rRdPtr_rdCounter[3] ;
  assign adcCore0_sampF_rRdPtr_rsCounter_59_BIT_0_66_XO_ETC___d2328 =
	     z__h41868 ^ adcCore0_sampF_rRdPtr_rsCounter[10] ;
  assign adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2150 =
	     adcCore0_sampF_rRdPtr_rsCounter[10] ^
	     adcCore0_sampF_rRdPtr_rsCounter[9] ;
  assign adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2161 =
	     adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2150 ^
	     adcCore0_sampF_rRdPtr_rsCounter[8] ;
  assign adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2162 =
	     adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2161 ^
	     adcCore0_sampF_rRdPtr_rsCounter[7] ;
  assign adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2163 =
	     adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2162 ^
	     adcCore0_sampF_rRdPtr_rsCounter[6] ;
  assign adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2164 =
	     adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2163 ^
	     adcCore0_sampF_rRdPtr_rsCounter[5] ;
  assign adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2165 =
	     adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2164 ^
	     adcCore0_sampF_rRdPtr_rsCounter[4] ;
  assign adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2166 =
	     adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2165 ^
	     adcCore0_sampF_rRdPtr_rsCounter[3] ;
  assign adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2167 =
	     adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2166 ^
	     adcCore0_sampF_rRdPtr_rsCounter[2] ;
  assign adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2168 =
	     adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2167 ^
	     adcCore0_sampF_rRdPtr_rsCounter[1] ;
  assign adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2231 =
	     adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2168 ^
	     adcCore0_sampF_rRdPtr_rsCounter[0] ;
  assign adcCore0_sampF_rWrPtr_rsCounter_90_BIT_0_97_XO_ETC___d2327 =
	     z__h39566 ^ adcCore0_sampF_rWrPtr_rsCounter[10] ;
  assign adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2142 =
	     adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2157 ^
	     adcCore0_sampF_rWrPtr_rsCounter[8] ;
  assign adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2143 =
	     adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2155 ^
	     adcCore0_sampF_rWrPtr_rsCounter[6] ;
  assign adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2144 =
	     adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2143 ^
	     adcCore0_sampF_rWrPtr_rsCounter[5] ;
  assign adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2145 =
	     adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2148 ^
	     adcCore0_sampF_rWrPtr_rsCounter[3] ;
  assign adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2146 =
	     adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2145 ^
	     adcCore0_sampF_rWrPtr_rsCounter[2] ;
  assign adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2148 =
	     adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2144 ^
	     adcCore0_sampF_rWrPtr_rsCounter[4] ;
  assign adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2155 =
	     adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2142 ^
	     adcCore0_sampF_rWrPtr_rsCounter[7] ;
  assign adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2156 =
	     adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2146 ^
	     adcCore0_sampF_rWrPtr_rsCounter[1] ;
  assign adcCore0_sampF_rWrPtr_rsCounter_90_BIT_10_16_X_ETC___d2157 =
	     adcCore0_sampF_rWrPtr_rsCounter[10] ^
	     adcCore0_sampF_rWrPtr_rsCounter[9] ;
  assign adcCore0_spiI_reqF_head_wrapped_crossed__74_EQ_ETC___d1130 =
	     adcCore0_spiI_reqF_head_wrapped ==
	     adcCore0_spiI_reqF_tail_wrapped &&
	     !adcCore0_spiI_reqF_sInReset$VAL &&
	     adcCore0_spiI_cd$PREEDGE ;
  assign adcCore0_spiI_reqS_BITS_15_TO_8__q6 = adcCore0_spiI_reqS[15:8] ;
  assign adcCore0_spiI_reqS_BITS_7_TO_0__q7 = adcCore0_spiI_reqS[7:0] ;
  assign adcCore1_colGate_operatePW_whas__182_AND_adcCo_ETC___d1237 =
	     adcCore1_operateD$dD_OUT && adcCore1_colGate_timeMesg == 3'd0 &&
	     adcCore1_acquireD$dD_OUT &&
	     adcCore1_colGate_collectD ;
  assign adcCore1_colGate_operatePW_whas__182_AND_adcCo_ETC___d1248 =
	     adcCore1_colGate_operatePW_whas__182_AND_adcCo_ETC___d1237 &&
	     adcCore1_colGate_syncMesg == 2'd0 &&
	     adcCore1_colGate_ovrRecover == 4'd0 &&
	     (!adcCore1_averageD$dD_OUT ||
	      adcCore1_colGate_avgPhase == 2'd0) ;
  assign adcCore1_colGate_sampF_RDY_first__551_AND_NOT__ETC___d1608 =
	     adcCore1_colGate_sampF$EMPTY_N &&
	     adcCore1_sampF_rWrPtr_rsCounter !=
	     { adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[10],
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[10] ^
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[9],
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[9] ^
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[8],
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[8] ^
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[7],
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[7] ^
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[6],
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[6] ^
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[5],
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[5] ^
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[4],
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[4] ^
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[3],
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[3] ^
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[2],
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[2] ^
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[1],
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[1] ^
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216[0] } ;
  assign adcCore1_colGate_uprollCnt_251_EQ_adcCore1_col_ETC___d2234 =
	     adcCore1_colGate_uprollCnt ==
	     adcCore1_maxBurstLengthR$dD_OUT - 16'd1 ;
  assign adcCore1_iseqFsm_abort_whas__727_AND_adcCore1__ETC___d1799 =
	     (adcCore1_iseqFsm_state_mkFSMstate == 4'd0 ||
	      adcCore1_iseqFsm_state_mkFSMstate == 4'd10) &&
	     (!adcCore1_iseqFsm_start_reg_1 || adcCore1_iseqFsm_state_fired) ;
  assign adcCore1_iseqFsm_abort_whas__727_AND_adcCore1__ETC___d2103 =
	     adcCore1_iseqFsm_abort_whas__727_AND_adcCore1__ETC___d1799 &&
	     !adcCore1_iseqFsm_start_reg &&
	     spiClk_iseqFsm_abort_whas__53_AND_spiClk_iseqF_ETC___d513 &&
	     !spiClk_iseqFsm_start_reg &&
	     wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2194 =
	     adcCore1_sampF_rRdPtr_rdCounter[10] ^
	     adcCore1_sampF_rRdPtr_rdCounter[9] ;
  assign adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2195 =
	     adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2194 ^
	     adcCore1_sampF_rRdPtr_rdCounter[8] ;
  assign adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2196 =
	     adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2195 ^
	     adcCore1_sampF_rRdPtr_rdCounter[7] ;
  assign adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2197 =
	     adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2203 ^
	     adcCore1_sampF_rRdPtr_rdCounter[4] ;
  assign adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2198 =
	     adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2196 ^
	     adcCore1_sampF_rRdPtr_rdCounter[6] ;
  assign adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2203 =
	     adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2198 ^
	     adcCore1_sampF_rRdPtr_rdCounter[5] ;
  assign adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2204 =
	     adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2197 ^
	     adcCore1_sampF_rRdPtr_rdCounter[3] ;
  assign adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2205 =
	     adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2204 ^
	     adcCore1_sampF_rRdPtr_rdCounter[2] ;
  assign adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2215 =
	     adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2205 ^
	     adcCore1_sampF_rRdPtr_rdCounter[1] ;
  assign adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2216 =
	     x_dReadBin__h88404 + 11'd512 ;
  assign adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2187 =
	     adcCore1_sampF_rRdPtr_rsCounter[10] ^
	     adcCore1_sampF_rRdPtr_rsCounter[9] ;
  assign adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2188 =
	     adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2187 ^
	     adcCore1_sampF_rRdPtr_rsCounter[8] ;
  assign adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2189 =
	     adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2188 ^
	     adcCore1_sampF_rRdPtr_rsCounter[7] ;
  assign adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2190 =
	     adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2189 ^
	     adcCore1_sampF_rRdPtr_rsCounter[6] ;
  assign adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2191 =
	     adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2190 ^
	     adcCore1_sampF_rRdPtr_rsCounter[5] ;
  assign adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2192 =
	     adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2191 ^
	     adcCore1_sampF_rRdPtr_rsCounter[4] ;
  assign adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2193 =
	     adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2202 ^
	     adcCore1_sampF_rRdPtr_rsCounter[2] ;
  assign adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2199 =
	     adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2193 ^
	     adcCore1_sampF_rRdPtr_rsCounter[1] ;
  assign adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2202 =
	     adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2192 ^
	     adcCore1_sampF_rRdPtr_rsCounter[3] ;
  assign adcCore1_sampF_rWrPtr_rsCounter_337_BIT_0_344__ETC___d2338 =
	     z__h85276 ^ adcCore1_sampF_rWrPtr_rsCounter[10] ;
  assign adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2179 =
	     adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2180 ^
	     adcCore1_sampF_rWrPtr_rsCounter[8] ;
  assign adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2180 =
	     adcCore1_sampF_rWrPtr_rsCounter[10] ^
	     adcCore1_sampF_rWrPtr_rsCounter[9] ;
  assign adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2181 =
	     adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2201 ^
	     adcCore1_sampF_rWrPtr_rsCounter[6] ;
  assign adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2182 =
	     adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2181 ^
	     adcCore1_sampF_rWrPtr_rsCounter[5] ;
  assign adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2183 =
	     adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2182 ^
	     adcCore1_sampF_rWrPtr_rsCounter[4] ;
  assign adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2184 =
	     adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2183 ^
	     adcCore1_sampF_rWrPtr_rsCounter[3] ;
  assign adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2185 =
	     adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2186 ^
	     adcCore1_sampF_rWrPtr_rsCounter[1] ;
  assign adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2186 =
	     adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2184 ^
	     adcCore1_sampF_rWrPtr_rsCounter[2] ;
  assign adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2201 =
	     adcCore1_sampF_rWrPtr_rsCounter_337_BIT_10_363_ETC___d2179 ^
	     adcCore1_sampF_rWrPtr_rsCounter[7] ;
  assign adcCore1_spiI_reqF_head_wrapped_crossed__621_E_ETC___d1777 =
	     adcCore1_spiI_reqF_head_wrapped ==
	     adcCore1_spiI_reqF_tail_wrapped &&
	     !adcCore1_spiI_reqF_sInReset$VAL &&
	     adcCore1_spiI_cd$PREEDGE ;
  assign adcCore1_spiI_reqS_BITS_15_TO_8__q9 = adcCore1_spiI_reqS[15:8] ;
  assign adcCore1_spiI_reqS_BITS_7_TO_0__q8 = adcCore1_spiI_reqS[7:0] ;
  assign adcStatusLs__h130971 =
	     { 26'd0,
	       adcIdcRdyBit$dD_OUT,
	       splitReadInFlight,
	       initOpInFlight,
	       adcCore1_iseqFsm_abort_whas__727_AND_adcCore1__ETC___d1799 &&
	       !adcCore1_iseqFsm_start_reg,
	       adcCore0_iseqFsm_abort_whas__080_AND_adcCore0__ETC___d1152 &&
	       !adcCore0_iseqFsm_start_reg,
	       spiClk_iseqFsm_abort_whas__53_AND_spiClk_iseqF_ETC___d513 &&
	       !spiClk_iseqFsm_start_reg } ;
  assign avgDataBW__h35898 =
	     { adcCore0_colGate_avgOdd[17:2],
	       adcCore0_colGate_avgEven[17:2] } ;
  assign avgDataBW__h81608 =
	     { adcCore1_colGate_avgOdd[17:2],
	       adcCore1_colGate_avgEven[17:2] } ;
  assign d_data__h35985 =
	     adcCore0_averageD$dD_OUT ? avgDataBW__h35898 : adcCore0_samp ;
  assign d_data__h81695 =
	     adcCore1_averageD$dD_OUT ? avgDataBW__h81608 : adcCore1_samp ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2132 =
	     fcAdc_grayCounter_rdCounter[17] ^
	     fcAdc_grayCounter_rdCounter[16] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2133 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2151 ^
	     fcAdc_grayCounter_rdCounter[14] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2134 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2133 ^
	     fcAdc_grayCounter_rdCounter[13] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2135 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2149 ^
	     fcAdc_grayCounter_rdCounter[11] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2136 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2135 ^
	     fcAdc_grayCounter_rdCounter[10] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2137 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2136 ^
	     fcAdc_grayCounter_rdCounter[9] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2138 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2154 ^
	     fcAdc_grayCounter_rdCounter[5] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2139 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2138 ^
	     fcAdc_grayCounter_rdCounter[4] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2140 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2147 ^
	     fcAdc_grayCounter_rdCounter[1] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2141 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2139 ^
	     fcAdc_grayCounter_rdCounter[3] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2147 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2141 ^
	     fcAdc_grayCounter_rdCounter[2] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2149 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2134 ^
	     fcAdc_grayCounter_rdCounter[12] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2151 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2132 ^
	     fcAdc_grayCounter_rdCounter[15] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2152 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2153 ^
	     fcAdc_grayCounter_rdCounter[7] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2153 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2137 ^
	     fcAdc_grayCounter_rdCounter[8] ;
  assign fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2154 =
	     fcAdc_grayCounter_rdCounter_58_BIT_17_59_XOR_f_ETC___d2152 ^
	     fcAdc_grayCounter_rdCounter[6] ;
  assign fcAdc_grayCounter_rsCounter_60_BIT_0_67_XOR_fc_ETC___d2326 =
	     z__h7636 ^ fcAdc_grayCounter_rsCounter[17] ;
  assign initOpInFlight_041_AND_adcCore0_iseqFsm_abort__ETC___d2110 =
	     initOpInFlight &&
	     adcCore0_iseqFsm_abort_whas__080_AND_adcCore0__ETC___d1152 &&
	     !adcCore0_iseqFsm_start_reg &&
	     adcCore1_iseqFsm_abort_whas__727_AND_adcCore1__ETC___d1799 &&
	     !adcCore1_iseqFsm_start_reg ;
  assign rdat__h131371 =
	     (wci_wslv_reqF$D_OUT[43:42] == 2'b0) ?
	       IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 :
	       32'd0 ;
  assign rdat__h131450 = { 24'd0, wsiM_statusR } ;
  assign rdat__h131531 = { 14'd0, fcAdc_frequency } ;
  assign rdat__h131557 = { 24'd0, spiResp } ;
  assign spiClk_iseqFsm_abort_whas__53_AND_spiClk_iseqF_ETC___d513 =
	     (spiClk_iseqFsm_state_mkFSMstate == 4'd0 ||
	      spiClk_iseqFsm_state_mkFSMstate == 4'd7) &&
	     (!spiClk_iseqFsm_start_reg_1 || spiClk_iseqFsm_state_fired) ;
  assign spiClk_spiI_iPos_89_EQ_14_92_OR_spiClk_spiI_iP_ETC___d400 =
	     spiClk_spiI_iPos == 4'd14 || spiClk_spiI_iPos == 4'd13 ||
	     !spiClk_spiI_iPos_89_ULT_7___d2219 &&
	     spiClk_spiI_iPos_89_ULE_12___d2220 ||
	     NOT_spiClk_spiI_reqF_head_wrapped__read__39_EQ_ETC___d382 &&
	     !spiClk_spiI_reqF_dInReset$VAL ;
  assign spiClk_spiI_iPos_89_ULE_12___d2220 = spiClk_spiI_iPos <= 4'd12 ;
  assign spiClk_spiI_iPos_89_ULT_7___d2219 = spiClk_spiI_iPos < 4'd7 ;
  assign spiClk_spiI_reqF_head_wrapped_crossed__31_EQ_s_ETC___d2402 =
	     spiClk_spiI_reqF_head_wrapped == spiClk_spiI_reqF_tail_wrapped &&
	     !spiClk_spiI_reqF_sInReset$VAL &&
	     spiClk_spiI_cd$PREEDGE ;
  assign spiClk_spiI_reqS_BITS_15_TO_8__q2 = spiClk_spiI_reqS[15:8] ;
  assign spiClk_spiI_reqS_BITS_7_TO_0__q10 = spiClk_spiI_reqS[7:0] ;
  assign wti_nowReq_BITS_63_TO_0__q1 = wti_nowReq[63:0] ;
  assign x2__h44277 =
	     { adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2150,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2161,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2162,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2163,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2164,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2165,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2166,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2167,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2168,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2231 } ;
  assign x2__h89987 =
	     { adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2187,
	       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2188,
	       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2189,
	       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2190,
	       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2191,
	       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2192,
	       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2202,
	       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2193,
	       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2199,
	       adcCore1_sampF_rRdPtr_rsCounter_406_BIT_10_432_ETC___d2199 ^
	       adcCore1_sampF_rRdPtr_rsCounter[0] } ;
  assign x__h17146 =
	     spiClk_spiI_reqS_BITS_15_TO_8__q2[spiClk_spiI_iPos[2:0]] ;
  assign x__h36250 = x__h36260 + y__h36411 ;
  assign x__h36260 = adcCore0_colGate_avgEven + y__h36413 ;
  assign x__h36326 = y__h36413 + y__h36411 ;
  assign x__h36400 = x__h36410 + y__h36411 ;
  assign x__h36410 = adcCore0_colGate_avgOdd + y__h36413 ;
  assign x__h38579 =
	     11'd1 <<
	     IF_adcCore0_sampF_rWrPtr_rsCounter_90_BIT_0_97_ETC___d2458 ;
  assign x__h40881 =
	     11'd1 <<
	     IF_adcCore0_sampF_rRdPtr_rsCounter_59_BIT_0_66_ETC___d2461 ;
  assign x__h44308 = x_sReadBin__h42691 + 11'd1 ;
  assign x__h7511 =
	     18'd1 <<
	     IF_fcAdc_grayCounter_rsCounter_60_BIT_0_67_XOR_ETC___d2455 ;
  assign x__h81960 = x__h81970 + y__h82121 ;
  assign x__h81970 = adcCore1_colGate_avgEven + y__h82123 ;
  assign x__h82036 = y__h82123 + y__h82121 ;
  assign x__h82110 = x__h82120 + y__h82121 ;
  assign x__h82120 = adcCore1_colGate_avgOdd + y__h82123 ;
  assign x__h84289 =
	     11'd1 <<
	     IF_adcCore1_sampF_rWrPtr_rsCounter_337_BIT_0_3_ETC___d2467 ;
  assign x_burstLength__h128706 =
	     adcCore0_sampF_memory$DOB[36] ? 12'd1 : 12'd4095 ;
  assign x_dReadBin__h42694 =
	     { adcCore0_sampF_rRdPtr_rdCounter[10],
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2169,
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2170,
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2171,
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2172,
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2173,
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2175,
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2200,
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2174,
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2178,
	       adcCore0_sampF_rRdPtr_rdCounter_05_BIT_10_06_X_ETC___d2178 ^
	       adcCore0_sampF_rRdPtr_rdCounter[0] } ;
  assign x_dReadBin__h88404 =
	     { adcCore1_sampF_rRdPtr_rdCounter[10],
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2194,
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2195,
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2196,
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2198,
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2203,
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2197,
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2204,
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2205,
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2215,
	       adcCore1_sampF_rRdPtr_rdCounter_552_BIT_10_553_ETC___d2215 ^
	       adcCore1_sampF_rRdPtr_rdCounter[0] } ;
  assign x_sReadBin__h42691 =
	     { adcCore0_sampF_rRdPtr_rsCounter[10],
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2150,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2161,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2162,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2163,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2164,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2165,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2166,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2167,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2168,
	       adcCore0_sampF_rRdPtr_rsCounter_59_BIT_10_85_X_ETC___d2231 } ;
  assign y__h36411 = { 2'd0, adcCore0_samp[15:0] } ;
  assign y__h36413 = { 2'd0, adcCore0_samp[31:16] } ;
  assign y__h39466 = ~x__h38579 ;
  assign y__h41768 = ~x__h40881 ;
  assign y__h82121 = { 2'd0, adcCore1_samp[15:0] } ;
  assign y__h82123 = { 2'd0, adcCore1_samp[31:16] } ;
  assign y__h85176 = ~x__h84289 ;
  assign y__h8916 = ~x__h7511 ;
  assign z__h39510 =
	     adcCore0_sampF_rWrPtr_rsCounter[0] ^
	     adcCore0_sampF_rWrPtr_rsCounter[1] ;
  assign z__h39517 = z__h39510 ^ adcCore0_sampF_rWrPtr_rsCounter[2] ;
  assign z__h39524 = z__h39517 ^ adcCore0_sampF_rWrPtr_rsCounter[3] ;
  assign z__h39531 = z__h39524 ^ adcCore0_sampF_rWrPtr_rsCounter[4] ;
  assign z__h39538 = z__h39531 ^ adcCore0_sampF_rWrPtr_rsCounter[5] ;
  assign z__h39545 = z__h39538 ^ adcCore0_sampF_rWrPtr_rsCounter[6] ;
  assign z__h39552 = z__h39545 ^ adcCore0_sampF_rWrPtr_rsCounter[7] ;
  assign z__h39559 = z__h39552 ^ adcCore0_sampF_rWrPtr_rsCounter[8] ;
  assign z__h39566 = z__h39559 ^ adcCore0_sampF_rWrPtr_rsCounter[9] ;
  assign z__h41812 =
	     adcCore0_sampF_rRdPtr_rsCounter[0] ^
	     adcCore0_sampF_rRdPtr_rsCounter[1] ;
  assign z__h41819 = z__h41812 ^ adcCore0_sampF_rRdPtr_rsCounter[2] ;
  assign z__h41826 = z__h41819 ^ adcCore0_sampF_rRdPtr_rsCounter[3] ;
  assign z__h41833 = z__h41826 ^ adcCore0_sampF_rRdPtr_rsCounter[4] ;
  assign z__h41840 = z__h41833 ^ adcCore0_sampF_rRdPtr_rsCounter[5] ;
  assign z__h41847 = z__h41840 ^ adcCore0_sampF_rRdPtr_rsCounter[6] ;
  assign z__h41854 = z__h41847 ^ adcCore0_sampF_rRdPtr_rsCounter[7] ;
  assign z__h41861 = z__h41854 ^ adcCore0_sampF_rRdPtr_rsCounter[8] ;
  assign z__h41868 = z__h41861 ^ adcCore0_sampF_rRdPtr_rsCounter[9] ;
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
  assign z__h85220 =
	     adcCore1_sampF_rWrPtr_rsCounter[0] ^
	     adcCore1_sampF_rWrPtr_rsCounter[1] ;
  assign z__h85227 = z__h85220 ^ adcCore1_sampF_rWrPtr_rsCounter[2] ;
  assign z__h85234 = z__h85227 ^ adcCore1_sampF_rWrPtr_rsCounter[3] ;
  assign z__h85241 = z__h85234 ^ adcCore1_sampF_rWrPtr_rsCounter[4] ;
  assign z__h85248 = z__h85241 ^ adcCore1_sampF_rWrPtr_rsCounter[5] ;
  assign z__h85255 = z__h85248 ^ adcCore1_sampF_rWrPtr_rsCounter[6] ;
  assign z__h85262 = z__h85255 ^ adcCore1_sampF_rWrPtr_rsCounter[7] ;
  assign z__h85269 = z__h85262 ^ adcCore1_sampF_rWrPtr_rsCounter[8] ;
  assign z__h85276 = z__h85269 ^ adcCore1_sampF_rWrPtr_rsCounter[9] ;
  always@(adcCore0_colGate_timeMesg or
	  adcCore0_colGate_dwellFails or
	  adcCore0_colGate_dwellStarts or
	  adcCore0_colGate_sampCount or
	  adcCore0_colGate_dropCount or wti_nowReq_BITS_63_TO_0__q1)
  begin
    case (adcCore0_colGate_timeMesg)
      3'h1: x1_data__h35585 = adcCore0_colGate_dwellStarts;
      3'h3: x1_data__h35585 = adcCore0_colGate_sampCount;
      3'h4: x1_data__h35585 = adcCore0_colGate_dropCount;
      3'h5: x1_data__h35585 = wti_nowReq_BITS_63_TO_0__q1[31:0];
      3'h6: x1_data__h35585 = wti_nowReq_BITS_63_TO_0__q1[63:32];
      default: x1_data__h35585 = adcCore0_colGate_dwellFails;
    endcase
  end
  always@(adcCore1_colGate_timeMesg or
	  adcCore1_colGate_dwellFails or
	  adcCore1_colGate_dwellStarts or
	  adcCore1_colGate_sampCount or adcCore1_colGate_dropCount)
  begin
    case (adcCore1_colGate_timeMesg)
      3'h1: x1_data__h81295 = adcCore1_colGate_dwellStarts;
      3'h3: x1_data__h81295 = adcCore1_colGate_sampCount;
      3'h4: x1_data__h81295 = adcCore1_colGate_dropCount;
      3'h5, 3'h6: x1_data__h81295 = 32'b0;
      default: x1_data__h81295 = adcCore1_colGate_dwellFails;
    endcase
  end
  always@(wci_wslv_reqF$D_OUT or
	  adcCore1_reqF$FULL_N or
	  spiClk_spiI_reqF_head_wrapped_crossed__31_EQ_s_ETC___d2402 or
	  adcCore0_reqF$FULL_N)
  begin
    case (wci_wslv_reqF$D_OUT[39:32])
      8'h24:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_NOT_wci_ETC__q3 =
	      spiClk_spiI_reqF_head_wrapped_crossed__31_EQ_s_ETC___d2402;
      8'h28:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_NOT_wci_ETC__q3 =
	      adcCore0_reqF$FULL_N;
      default: CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_NOT_wci_ETC__q3 =
		   wci_wslv_reqF$D_OUT[39:32] != 8'h2C ||
		   adcCore1_reqF$FULL_N;
    endcase
  end
  always@(adcCore0_colGate_avgPhase)
  begin
    case (adcCore0_colGate_avgPhase)
      2'd0, 2'd1, 2'd2, 2'd3:
	  CASE_adcCore0_colGate_avgPhase_0b1_0_1_1_1_2_1_ETC__q4 = 1'd1;
    endcase
  end
  always@(adcCore1_colGate_avgPhase)
  begin
    case (adcCore1_colGate_avgPhase)
      2'd0, 2'd1, 2'd2, 2'd3:
	  CASE_adcCore1_colGate_avgPhase_0b1_0_1_1_1_2_1_ETC__q5 = 1'd1;
    endcase
  end
  always@(wci_wslv_reqF$D_OUT or
	  rdat__h131450 or
	  adcStatusLs__h130971 or
	  maxMesgLength or
	  adcControl or
	  rdat__h131531 or
	  adcCore0_statsCC$dD_OUT or
	  adcCore0_sampCC$dD_OUT or
	  adcCore1_sampCC$dD_OUT or
	  rdat__h131557 or
	  mesgCount or
	  lastOverflowMesg or wsiM_extStatusW$wget or overflowCountD)
  begin
    case (wci_wslv_reqF$D_OUT[39:32])
      8'h0:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      rdat__h131450;
      8'h04:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      adcStatusLs__h130971;
      8'h08:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      maxMesgLength;
      8'h0C:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      adcControl;
      8'h14:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      rdat__h131531;
      8'h18:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      adcCore0_statsCC$dD_OUT[95:64];
      8'h1C:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      adcCore0_sampCC$dD_OUT;
      8'h20:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      adcCore1_sampCC$dD_OUT;
      8'h30:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      rdat__h131557;
      8'h34:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      mesgCount;
      8'h3C:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      adcCore0_statsCC$dD_OUT[63:32];
      8'h40:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      adcCore0_statsCC$dD_OUT[31:0];
      8'h44:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      lastOverflowMesg;
      8'h50:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      wsiM_extStatusW$wget[95:64];
      8'h54:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      wsiM_extStatusW$wget[63:32];
      8'h58:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      wsiM_extStatusW$wget[31:0];
      8'h5C:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      adcCore0_statsCC$dD_OUT[127:96];
      8'h60:
	  IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
	      overflowCountD;
      default: IF_wci_wslv_reqF_first__5_BITS_39_TO_32_945_EQ_ETC___d2092 =
		   32'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (wciS0_MReset_n == `BSV_RESET_VALUE)
      begin
        adcControl <= `BSV_ASSIGNMENT_DELAY 32'd0;
	adcCore0_acquireDReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_adcRst <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_averageDReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_ddrC_psCmdReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	adcCore0_iseqFsm_jj_delay_count <= `BSV_ASSIGNMENT_DELAY 13'd1;
	adcCore0_iseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_iseqFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_iseqFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY 1'd1;
	adcCore0_iseqFsm_state_fired <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_iseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 4'd0;
	adcCore0_operateDReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_readMode <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_spiI_reqF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_spiI_respF_head_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_acquireDReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_adcRst <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_averageDReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_ddrC_psCmdReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	adcCore1_iseqFsm_jj_delay_count <= `BSV_ASSIGNMENT_DELAY 13'd1;
	adcCore1_iseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_iseqFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_iseqFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY 1'd1;
	adcCore1_iseqFsm_state_fired <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_iseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 4'd0;
	adcCore1_operateDReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_readMode <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_spiI_reqF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_spiI_respF_head_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
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
	spiClk_iState <= `BSV_ASSIGNMENT_DELAY 4'd0;
	spiClk_iseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiClk_iseqFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiClk_iseqFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY 1'd1;
	spiClk_iseqFsm_state_fired <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiClk_iseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 4'd0;
	spiClk_spiI_reqF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiClk_spiI_respF_head_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
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
	if (adcCore0_acquireDReg$EN)
	  adcCore0_acquireDReg <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_acquireDReg$D_IN;
	if (adcCore0_adcRst$EN)
	  adcCore0_adcRst <= `BSV_ASSIGNMENT_DELAY adcCore0_adcRst$D_IN;
	if (adcCore0_averageDReg$EN)
	  adcCore0_averageDReg <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_averageDReg$D_IN;
	if (adcCore0_ddrC_psCmdReg$EN)
	  adcCore0_ddrC_psCmdReg <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_ddrC_psCmdReg$D_IN;
	if (adcCore0_iseqFsm_jj_delay_count$EN)
	  adcCore0_iseqFsm_jj_delay_count <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_iseqFsm_jj_delay_count$D_IN;
	if (adcCore0_iseqFsm_start_reg$EN)
	  adcCore0_iseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_iseqFsm_start_reg$D_IN;
	if (adcCore0_iseqFsm_start_reg_1$EN)
	  adcCore0_iseqFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_iseqFsm_start_reg_1$D_IN;
	if (adcCore0_iseqFsm_state_can_overlap$EN)
	  adcCore0_iseqFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_iseqFsm_state_can_overlap$D_IN;
	if (adcCore0_iseqFsm_state_fired$EN)
	  adcCore0_iseqFsm_state_fired <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_iseqFsm_state_fired$D_IN;
	if (adcCore0_iseqFsm_state_mkFSMstate$EN)
	  adcCore0_iseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_iseqFsm_state_mkFSMstate$D_IN;
	if (adcCore0_operateDReg$EN)
	  adcCore0_operateDReg <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_operateDReg$D_IN;
	if (adcCore0_readMode$EN)
	  adcCore0_readMode <= `BSV_ASSIGNMENT_DELAY adcCore0_readMode$D_IN;
	if (adcCore0_spiI_reqF_tail_wrapped$EN)
	  adcCore0_spiI_reqF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_spiI_reqF_tail_wrapped$D_IN;
	if (adcCore0_spiI_respF_head_wrapped$EN)
	  adcCore0_spiI_respF_head_wrapped <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_spiI_respF_head_wrapped$D_IN;
	if (adcCore1_acquireDReg$EN)
	  adcCore1_acquireDReg <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_acquireDReg$D_IN;
	if (adcCore1_adcRst$EN)
	  adcCore1_adcRst <= `BSV_ASSIGNMENT_DELAY adcCore1_adcRst$D_IN;
	if (adcCore1_averageDReg$EN)
	  adcCore1_averageDReg <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_averageDReg$D_IN;
	if (adcCore1_ddrC_psCmdReg$EN)
	  adcCore1_ddrC_psCmdReg <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_ddrC_psCmdReg$D_IN;
	if (adcCore1_iseqFsm_jj_delay_count$EN)
	  adcCore1_iseqFsm_jj_delay_count <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_iseqFsm_jj_delay_count$D_IN;
	if (adcCore1_iseqFsm_start_reg$EN)
	  adcCore1_iseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_iseqFsm_start_reg$D_IN;
	if (adcCore1_iseqFsm_start_reg_1$EN)
	  adcCore1_iseqFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_iseqFsm_start_reg_1$D_IN;
	if (adcCore1_iseqFsm_state_can_overlap$EN)
	  adcCore1_iseqFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_iseqFsm_state_can_overlap$D_IN;
	if (adcCore1_iseqFsm_state_fired$EN)
	  adcCore1_iseqFsm_state_fired <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_iseqFsm_state_fired$D_IN;
	if (adcCore1_iseqFsm_state_mkFSMstate$EN)
	  adcCore1_iseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_iseqFsm_state_mkFSMstate$D_IN;
	if (adcCore1_operateDReg$EN)
	  adcCore1_operateDReg <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_operateDReg$D_IN;
	if (adcCore1_readMode$EN)
	  adcCore1_readMode <= `BSV_ASSIGNMENT_DELAY adcCore1_readMode$D_IN;
	if (adcCore1_spiI_reqF_tail_wrapped$EN)
	  adcCore1_spiI_reqF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_spiI_reqF_tail_wrapped$D_IN;
	if (adcCore1_spiI_respF_head_wrapped$EN)
	  adcCore1_spiI_respF_head_wrapped <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_spiI_respF_head_wrapped$D_IN;
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
	if (spiClk_iState$EN)
	  spiClk_iState <= `BSV_ASSIGNMENT_DELAY spiClk_iState$D_IN;
	if (spiClk_iseqFsm_start_reg$EN)
	  spiClk_iseqFsm_start_reg <= `BSV_ASSIGNMENT_DELAY
	      spiClk_iseqFsm_start_reg$D_IN;
	if (spiClk_iseqFsm_start_reg_1$EN)
	  spiClk_iseqFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY
	      spiClk_iseqFsm_start_reg_1$D_IN;
	if (spiClk_iseqFsm_state_can_overlap$EN)
	  spiClk_iseqFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY
	      spiClk_iseqFsm_state_can_overlap$D_IN;
	if (spiClk_iseqFsm_state_fired$EN)
	  spiClk_iseqFsm_state_fired <= `BSV_ASSIGNMENT_DELAY
	      spiClk_iseqFsm_state_fired$D_IN;
	if (spiClk_iseqFsm_state_mkFSMstate$EN)
	  spiClk_iseqFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY
	      spiClk_iseqFsm_state_mkFSMstate$D_IN;
	if (spiClk_spiI_reqF_tail_wrapped$EN)
	  spiClk_spiI_reqF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY
	      spiClk_spiI_reqF_tail_wrapped$D_IN;
	if (spiClk_spiI_respF_head_wrapped$EN)
	  spiClk_spiI_respF_head_wrapped <= `BSV_ASSIGNMENT_DELAY
	      spiClk_spiI_respF_head_wrapped$D_IN;
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
    if (adcCore0_spiI_reqS$EN)
      adcCore0_spiI_reqS <= `BSV_ASSIGNMENT_DELAY adcCore0_spiI_reqS$D_IN;
    if (adcCore1_spiI_reqS$EN)
      adcCore1_spiI_reqS <= `BSV_ASSIGNMENT_DELAY adcCore1_spiI_reqS$D_IN;
    if (spiClk_spiI_reqS$EN)
      spiClk_spiI_reqS <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_reqS$D_IN;
    if (wsiM_statusR$EN)
      wsiM_statusR <= `BSV_ASSIGNMENT_DELAY wsiM_statusR$D_IN;
  end
  always@(posedge CLK_sys0_clk)
  begin
    if (RST_N_sys0_rst == `BSV_RESET_VALUE)
      begin
        adcIdc_doResetCount <= `BSV_ASSIGNMENT_DELAY 4'd0;
	adcIdc_preResetCount <= `BSV_ASSIGNMENT_DELAY 4'd0;
      end
    else
      begin
        if (adcIdc_doResetCount$EN)
	  adcIdc_doResetCount <= `BSV_ASSIGNMENT_DELAY
	      adcIdc_doResetCount$D_IN;
	if (adcIdc_preResetCount$EN)
	  adcIdc_preResetCount <= `BSV_ASSIGNMENT_DELAY
	      adcIdc_preResetCount$D_IN;
      end
  end
  always@(posedge spiClk_spiI_cd$CLK_OUT)
  begin
    if (spiClk_spiI_slowReset$OUT_RST == `BSV_RESET_VALUE)
      begin
        spiClk_spiI_cGate <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiClk_spiI_csbR <= `BSV_ASSIGNMENT_DELAY 1'b1;
	spiClk_spiI_doResp <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiClk_spiI_reqF_head_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiClk_spiI_respF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiClk_spiI_sdoR <= `BSV_ASSIGNMENT_DELAY 1'b0;
	spiClk_spiI_xmt_d <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiClk_spiI_xmt_i <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (spiClk_spiI_cGate$EN)
	  spiClk_spiI_cGate <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_cGate$D_IN;
	if (spiClk_spiI_csbR$EN)
	  spiClk_spiI_csbR <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_csbR$D_IN;
	if (spiClk_spiI_doResp$EN)
	  spiClk_spiI_doResp <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_doResp$D_IN;
	if (spiClk_spiI_reqF_head_wrapped$EN)
	  spiClk_spiI_reqF_head_wrapped <= `BSV_ASSIGNMENT_DELAY
	      spiClk_spiI_reqF_head_wrapped$D_IN;
	if (spiClk_spiI_respF_tail_wrapped$EN)
	  spiClk_spiI_respF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY
	      spiClk_spiI_respF_tail_wrapped$D_IN;
	if (spiClk_spiI_sdoR$EN)
	  spiClk_spiI_sdoR <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_sdoR$D_IN;
	if (spiClk_spiI_xmt_d$EN)
	  spiClk_spiI_xmt_d <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_xmt_d$D_IN;
	if (spiClk_spiI_xmt_i$EN)
	  spiClk_spiI_xmt_i <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_xmt_i$D_IN;
      end
    if (spiClk_spiI_cap$EN)
      spiClk_spiI_cap <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_cap$D_IN;
    if (spiClk_spiI_cap_1$EN)
      spiClk_spiI_cap_1 <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_cap_1$D_IN;
    if (spiClk_spiI_cap_2$EN)
      spiClk_spiI_cap_2 <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_cap_2$D_IN;
    if (spiClk_spiI_cap_3$EN)
      spiClk_spiI_cap_3 <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_cap_3$D_IN;
    if (spiClk_spiI_cap_4$EN)
      spiClk_spiI_cap_4 <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_cap_4$D_IN;
    if (spiClk_spiI_cap_5$EN)
      spiClk_spiI_cap_5 <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_cap_5$D_IN;
    if (spiClk_spiI_cap_6$EN)
      spiClk_spiI_cap_6 <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_cap_6$D_IN;
    if (spiClk_spiI_cap_7$EN)
      spiClk_spiI_cap_7 <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_cap_7$D_IN;
    if (spiClk_spiI_dPos$EN)
      spiClk_spiI_dPos <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_dPos$D_IN;
    if (spiClk_spiI_iPos$EN)
      spiClk_spiI_iPos <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_iPos$D_IN;
    if (spiClk_spiI_respS$EN)
      spiClk_spiI_respS <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_respS$D_IN;
  end
  always@(posedge spiClk_spiI_cinv$CLK_OUT)
  begin
    if (spiClk_spiI_sdiP$EN)
      spiClk_spiI_sdiP <= `BSV_ASSIGNMENT_DELAY spiClk_spiI_sdiP$D_IN;
  end
  always@(posedge adcCore0_ddrC_ddrV$sdrClk)
  begin
    if (adcCore0_sdrRst$OUT_RST == `BSV_RESET_VALUE)
      begin
        adcCore0_colGate_avgEven <= `BSV_ASSIGNMENT_DELAY 18'd0;
	adcCore0_colGate_avgOdd <= `BSV_ASSIGNMENT_DELAY 18'd0;
	adcCore0_colGate_avgPhase <= `BSV_ASSIGNMENT_DELAY 2'd0;
	adcCore0_colGate_collectD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_colGate_dropCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	adcCore0_colGate_dwellFails <= `BSV_ASSIGNMENT_DELAY 32'd0;
	adcCore0_colGate_dwellStarts <= `BSV_ASSIGNMENT_DELAY 32'd0;
	adcCore0_colGate_ovrRecover <= `BSV_ASSIGNMENT_DELAY 4'd0;
	adcCore0_colGate_sampActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_colGate_sampActiveD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_colGate_sampCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	adcCore0_colGate_syncMesg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	adcCore0_colGate_timeMesg <= `BSV_ASSIGNMENT_DELAY 3'd0;
	adcCore0_colGate_uprollCnt <= `BSV_ASSIGNMENT_DELAY 16'd0;
	wti_nowReq <= `BSV_ASSIGNMENT_DELAY 67'd0;
	wti_operateD <= `BSV_ASSIGNMENT_DELAY 1'd1;
      end
    else
      begin
        if (adcCore0_colGate_avgEven$EN)
	  adcCore0_colGate_avgEven <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_colGate_avgEven$D_IN;
	if (adcCore0_colGate_avgOdd$EN)
	  adcCore0_colGate_avgOdd <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_colGate_avgOdd$D_IN;
	if (adcCore0_colGate_avgPhase$EN)
	  adcCore0_colGate_avgPhase <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_colGate_avgPhase$D_IN;
	if (adcCore0_colGate_collectD$EN)
	  adcCore0_colGate_collectD <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_colGate_collectD$D_IN;
	if (adcCore0_colGate_dropCount$EN)
	  adcCore0_colGate_dropCount <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_colGate_dropCount$D_IN;
	if (adcCore0_colGate_dwellFails$EN)
	  adcCore0_colGate_dwellFails <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_colGate_dwellFails$D_IN;
	if (adcCore0_colGate_dwellStarts$EN)
	  adcCore0_colGate_dwellStarts <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_colGate_dwellStarts$D_IN;
	if (adcCore0_colGate_ovrRecover$EN)
	  adcCore0_colGate_ovrRecover <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_colGate_ovrRecover$D_IN;
	if (adcCore0_colGate_sampActive$EN)
	  adcCore0_colGate_sampActive <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_colGate_sampActive$D_IN;
	if (adcCore0_colGate_sampActiveD$EN)
	  adcCore0_colGate_sampActiveD <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_colGate_sampActiveD$D_IN;
	if (adcCore0_colGate_sampCount$EN)
	  adcCore0_colGate_sampCount <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_colGate_sampCount$D_IN;
	if (adcCore0_colGate_syncMesg$EN)
	  adcCore0_colGate_syncMesg <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_colGate_syncMesg$D_IN;
	if (adcCore0_colGate_timeMesg$EN)
	  adcCore0_colGate_timeMesg <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_colGate_timeMesg$D_IN;
	if (adcCore0_colGate_uprollCnt$EN)
	  adcCore0_colGate_uprollCnt <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_colGate_uprollCnt$D_IN;
	if (wti_nowReq$EN)
	  wti_nowReq <= `BSV_ASSIGNMENT_DELAY wti_nowReq$D_IN;
	if (wti_operateD$EN)
	  wti_operateD <= `BSV_ASSIGNMENT_DELAY wti_operateD$D_IN;
      end
    if (adcCore0_colGate_sampDataWD$EN)
      adcCore0_colGate_sampDataWD <= `BSV_ASSIGNMENT_DELAY
	  adcCore0_colGate_sampDataWD$D_IN;
    if (adcCore0_samp$EN)
      adcCore0_samp <= `BSV_ASSIGNMENT_DELAY adcCore0_samp$D_IN;
  end
  always@(posedge adcCore0_spiI_cd$CLK_OUT)
  begin
    if (adcCore0_spiI_slowReset$OUT_RST == `BSV_RESET_VALUE)
      begin
        adcCore0_spiI_cGate <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_spiI_csbR <= `BSV_ASSIGNMENT_DELAY 1'b1;
	adcCore0_spiI_doResp <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_spiI_reqF_head_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_spiI_respF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_spiI_sdoR <= `BSV_ASSIGNMENT_DELAY 1'b0;
	adcCore0_spiI_xmt_d <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore0_spiI_xmt_i <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (adcCore0_spiI_cGate$EN)
	  adcCore0_spiI_cGate <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_spiI_cGate$D_IN;
	if (adcCore0_spiI_csbR$EN)
	  adcCore0_spiI_csbR <= `BSV_ASSIGNMENT_DELAY adcCore0_spiI_csbR$D_IN;
	if (adcCore0_spiI_doResp$EN)
	  adcCore0_spiI_doResp <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_spiI_doResp$D_IN;
	if (adcCore0_spiI_reqF_head_wrapped$EN)
	  adcCore0_spiI_reqF_head_wrapped <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_spiI_reqF_head_wrapped$D_IN;
	if (adcCore0_spiI_respF_tail_wrapped$EN)
	  adcCore0_spiI_respF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_spiI_respF_tail_wrapped$D_IN;
	if (adcCore0_spiI_sdoR$EN)
	  adcCore0_spiI_sdoR <= `BSV_ASSIGNMENT_DELAY adcCore0_spiI_sdoR$D_IN;
	if (adcCore0_spiI_xmt_d$EN)
	  adcCore0_spiI_xmt_d <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_spiI_xmt_d$D_IN;
	if (adcCore0_spiI_xmt_i$EN)
	  adcCore0_spiI_xmt_i <= `BSV_ASSIGNMENT_DELAY
	      adcCore0_spiI_xmt_i$D_IN;
      end
    if (adcCore0_spiI_cap$EN)
      adcCore0_spiI_cap <= `BSV_ASSIGNMENT_DELAY adcCore0_spiI_cap$D_IN;
    if (adcCore0_spiI_cap_1$EN)
      adcCore0_spiI_cap_1 <= `BSV_ASSIGNMENT_DELAY adcCore0_spiI_cap_1$D_IN;
    if (adcCore0_spiI_cap_2$EN)
      adcCore0_spiI_cap_2 <= `BSV_ASSIGNMENT_DELAY adcCore0_spiI_cap_2$D_IN;
    if (adcCore0_spiI_cap_3$EN)
      adcCore0_spiI_cap_3 <= `BSV_ASSIGNMENT_DELAY adcCore0_spiI_cap_3$D_IN;
    if (adcCore0_spiI_cap_4$EN)
      adcCore0_spiI_cap_4 <= `BSV_ASSIGNMENT_DELAY adcCore0_spiI_cap_4$D_IN;
    if (adcCore0_spiI_cap_5$EN)
      adcCore0_spiI_cap_5 <= `BSV_ASSIGNMENT_DELAY adcCore0_spiI_cap_5$D_IN;
    if (adcCore0_spiI_cap_6$EN)
      adcCore0_spiI_cap_6 <= `BSV_ASSIGNMENT_DELAY adcCore0_spiI_cap_6$D_IN;
    if (adcCore0_spiI_cap_7$EN)
      adcCore0_spiI_cap_7 <= `BSV_ASSIGNMENT_DELAY adcCore0_spiI_cap_7$D_IN;
    if (adcCore0_spiI_dPos$EN)
      adcCore0_spiI_dPos <= `BSV_ASSIGNMENT_DELAY adcCore0_spiI_dPos$D_IN;
    if (adcCore0_spiI_iPos$EN)
      adcCore0_spiI_iPos <= `BSV_ASSIGNMENT_DELAY adcCore0_spiI_iPos$D_IN;
    if (adcCore0_spiI_respS$EN)
      adcCore0_spiI_respS <= `BSV_ASSIGNMENT_DELAY adcCore0_spiI_respS$D_IN;
  end
  always@(posedge adcCore0_spiI_cinv$CLK_OUT)
  begin
    if (adcCore0_spiI_sdiP$EN)
      adcCore0_spiI_sdiP <= `BSV_ASSIGNMENT_DELAY adcCore0_spiI_sdiP$D_IN;
  end
  always@(posedge adcCore1_ddrC_ddrV$sdrClk)
  begin
    if (adcCore1_sdrRst$OUT_RST == `BSV_RESET_VALUE)
      begin
        adcCore1_colGate_avgEven <= `BSV_ASSIGNMENT_DELAY 18'd0;
	adcCore1_colGate_avgOdd <= `BSV_ASSIGNMENT_DELAY 18'd0;
	adcCore1_colGate_avgPhase <= `BSV_ASSIGNMENT_DELAY 2'd0;
	adcCore1_colGate_collectD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_colGate_dropCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	adcCore1_colGate_dwellFails <= `BSV_ASSIGNMENT_DELAY 32'd0;
	adcCore1_colGate_dwellStarts <= `BSV_ASSIGNMENT_DELAY 32'd0;
	adcCore1_colGate_ovrRecover <= `BSV_ASSIGNMENT_DELAY 4'd0;
	adcCore1_colGate_sampActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_colGate_sampActiveD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_colGate_sampCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	adcCore1_colGate_syncMesg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	adcCore1_colGate_timeMesg <= `BSV_ASSIGNMENT_DELAY 3'd0;
	adcCore1_colGate_uprollCnt <= `BSV_ASSIGNMENT_DELAY 16'd0;
      end
    else
      begin
        if (adcCore1_colGate_avgEven$EN)
	  adcCore1_colGate_avgEven <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_colGate_avgEven$D_IN;
	if (adcCore1_colGate_avgOdd$EN)
	  adcCore1_colGate_avgOdd <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_colGate_avgOdd$D_IN;
	if (adcCore1_colGate_avgPhase$EN)
	  adcCore1_colGate_avgPhase <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_colGate_avgPhase$D_IN;
	if (adcCore1_colGate_collectD$EN)
	  adcCore1_colGate_collectD <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_colGate_collectD$D_IN;
	if (adcCore1_colGate_dropCount$EN)
	  adcCore1_colGate_dropCount <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_colGate_dropCount$D_IN;
	if (adcCore1_colGate_dwellFails$EN)
	  adcCore1_colGate_dwellFails <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_colGate_dwellFails$D_IN;
	if (adcCore1_colGate_dwellStarts$EN)
	  adcCore1_colGate_dwellStarts <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_colGate_dwellStarts$D_IN;
	if (adcCore1_colGate_ovrRecover$EN)
	  adcCore1_colGate_ovrRecover <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_colGate_ovrRecover$D_IN;
	if (adcCore1_colGate_sampActive$EN)
	  adcCore1_colGate_sampActive <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_colGate_sampActive$D_IN;
	if (adcCore1_colGate_sampActiveD$EN)
	  adcCore1_colGate_sampActiveD <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_colGate_sampActiveD$D_IN;
	if (adcCore1_colGate_sampCount$EN)
	  adcCore1_colGate_sampCount <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_colGate_sampCount$D_IN;
	if (adcCore1_colGate_syncMesg$EN)
	  adcCore1_colGate_syncMesg <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_colGate_syncMesg$D_IN;
	if (adcCore1_colGate_timeMesg$EN)
	  adcCore1_colGate_timeMesg <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_colGate_timeMesg$D_IN;
	if (adcCore1_colGate_uprollCnt$EN)
	  adcCore1_colGate_uprollCnt <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_colGate_uprollCnt$D_IN;
      end
    if (adcCore1_colGate_sampDataWD$EN)
      adcCore1_colGate_sampDataWD <= `BSV_ASSIGNMENT_DELAY
	  adcCore1_colGate_sampDataWD$D_IN;
    if (adcCore1_samp$EN)
      adcCore1_samp <= `BSV_ASSIGNMENT_DELAY adcCore1_samp$D_IN;
  end
  always@(posedge adcCore1_spiI_cd$CLK_OUT)
  begin
    if (adcCore1_spiI_slowReset$OUT_RST == `BSV_RESET_VALUE)
      begin
        adcCore1_spiI_cGate <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_spiI_csbR <= `BSV_ASSIGNMENT_DELAY 1'b1;
	adcCore1_spiI_doResp <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_spiI_reqF_head_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_spiI_respF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_spiI_sdoR <= `BSV_ASSIGNMENT_DELAY 1'b0;
	adcCore1_spiI_xmt_d <= `BSV_ASSIGNMENT_DELAY 1'd0;
	adcCore1_spiI_xmt_i <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (adcCore1_spiI_cGate$EN)
	  adcCore1_spiI_cGate <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_spiI_cGate$D_IN;
	if (adcCore1_spiI_csbR$EN)
	  adcCore1_spiI_csbR <= `BSV_ASSIGNMENT_DELAY adcCore1_spiI_csbR$D_IN;
	if (adcCore1_spiI_doResp$EN)
	  adcCore1_spiI_doResp <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_spiI_doResp$D_IN;
	if (adcCore1_spiI_reqF_head_wrapped$EN)
	  adcCore1_spiI_reqF_head_wrapped <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_spiI_reqF_head_wrapped$D_IN;
	if (adcCore1_spiI_respF_tail_wrapped$EN)
	  adcCore1_spiI_respF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_spiI_respF_tail_wrapped$D_IN;
	if (adcCore1_spiI_sdoR$EN)
	  adcCore1_spiI_sdoR <= `BSV_ASSIGNMENT_DELAY adcCore1_spiI_sdoR$D_IN;
	if (adcCore1_spiI_xmt_d$EN)
	  adcCore1_spiI_xmt_d <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_spiI_xmt_d$D_IN;
	if (adcCore1_spiI_xmt_i$EN)
	  adcCore1_spiI_xmt_i <= `BSV_ASSIGNMENT_DELAY
	      adcCore1_spiI_xmt_i$D_IN;
      end
    if (adcCore1_spiI_cap$EN)
      adcCore1_spiI_cap <= `BSV_ASSIGNMENT_DELAY adcCore1_spiI_cap$D_IN;
    if (adcCore1_spiI_cap_1$EN)
      adcCore1_spiI_cap_1 <= `BSV_ASSIGNMENT_DELAY adcCore1_spiI_cap_1$D_IN;
    if (adcCore1_spiI_cap_2$EN)
      adcCore1_spiI_cap_2 <= `BSV_ASSIGNMENT_DELAY adcCore1_spiI_cap_2$D_IN;
    if (adcCore1_spiI_cap_3$EN)
      adcCore1_spiI_cap_3 <= `BSV_ASSIGNMENT_DELAY adcCore1_spiI_cap_3$D_IN;
    if (adcCore1_spiI_cap_4$EN)
      adcCore1_spiI_cap_4 <= `BSV_ASSIGNMENT_DELAY adcCore1_spiI_cap_4$D_IN;
    if (adcCore1_spiI_cap_5$EN)
      adcCore1_spiI_cap_5 <= `BSV_ASSIGNMENT_DELAY adcCore1_spiI_cap_5$D_IN;
    if (adcCore1_spiI_cap_6$EN)
      adcCore1_spiI_cap_6 <= `BSV_ASSIGNMENT_DELAY adcCore1_spiI_cap_6$D_IN;
    if (adcCore1_spiI_cap_7$EN)
      adcCore1_spiI_cap_7 <= `BSV_ASSIGNMENT_DELAY adcCore1_spiI_cap_7$D_IN;
    if (adcCore1_spiI_dPos$EN)
      adcCore1_spiI_dPos <= `BSV_ASSIGNMENT_DELAY adcCore1_spiI_dPos$D_IN;
    if (adcCore1_spiI_iPos$EN)
      adcCore1_spiI_iPos <= `BSV_ASSIGNMENT_DELAY adcCore1_spiI_iPos$D_IN;
    if (adcCore1_spiI_respS$EN)
      adcCore1_spiI_respS <= `BSV_ASSIGNMENT_DELAY adcCore1_spiI_respS$D_IN;
  end
  always@(posedge adcCore1_spiI_cinv$CLK_OUT)
  begin
    if (adcCore1_spiI_sdiP$EN)
      adcCore1_spiI_sdiP <= `BSV_ASSIGNMENT_DELAY adcCore1_spiI_sdiP$D_IN;
  end
  always@(posedge wciS0_Clk or `BSV_RESET_EDGE wciS0_MReset_n)
  if (wciS0_MReset_n == `BSV_RESET_VALUE)
    begin
      adcCore0_sampF_rRdPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
      adcCore0_sampF_rWrPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
      adcCore0_sampF_rWrPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY 11'd0;
      adcCore1_sampF_rRdPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
      adcCore1_sampF_rWrPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
      adcCore1_sampF_rWrPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY 11'd0;
      fcAdc_grayCounter_rdCounter <= `BSV_ASSIGNMENT_DELAY 18'd0;
      fcAdc_grayCounter_rdCounterPre <= `BSV_ASSIGNMENT_DELAY 18'd0;
      wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wsiM_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (adcCore0_sampF_rRdPtr_rsCounter$EN)
	adcCore0_sampF_rRdPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY
	    adcCore0_sampF_rRdPtr_rsCounter$D_IN;
      if (adcCore0_sampF_rWrPtr_rdCounter$EN)
	adcCore0_sampF_rWrPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY
	    adcCore0_sampF_rWrPtr_rdCounter$D_IN;
      if (adcCore0_sampF_rWrPtr_rdCounterPre$EN)
	adcCore0_sampF_rWrPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY
	    adcCore0_sampF_rWrPtr_rdCounterPre$D_IN;
      if (adcCore1_sampF_rRdPtr_rsCounter$EN)
	adcCore1_sampF_rRdPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY
	    adcCore1_sampF_rRdPtr_rsCounter$D_IN;
      if (adcCore1_sampF_rWrPtr_rdCounter$EN)
	adcCore1_sampF_rWrPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY
	    adcCore1_sampF_rWrPtr_rdCounter$D_IN;
      if (adcCore1_sampF_rWrPtr_rdCounterPre$EN)
	adcCore1_sampF_rWrPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY
	    adcCore1_sampF_rWrPtr_rdCounterPre$D_IN;
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
  always@(posedge CLK_adc_clk or `BSV_RESET_EDGE fcAdc_testRst$OUT_RST)
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
  always@(posedge adcCore0_ddrC_ddrV$sdrClk or
	  `BSV_RESET_EDGE adcCore0_sdrRst$OUT_RST)
  if (adcCore0_sdrRst$OUT_RST == `BSV_RESET_VALUE)
    begin
      adcCore0_sampF_rRdPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
      adcCore0_sampF_rRdPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY 11'd0;
      adcCore0_sampF_rWrPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
      wti_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (adcCore0_sampF_rRdPtr_rdCounter$EN)
	adcCore0_sampF_rRdPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY
	    adcCore0_sampF_rRdPtr_rdCounter$D_IN;
      if (adcCore0_sampF_rRdPtr_rdCounterPre$EN)
	adcCore0_sampF_rRdPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY
	    adcCore0_sampF_rRdPtr_rdCounterPre$D_IN;
      if (adcCore0_sampF_rWrPtr_rsCounter$EN)
	adcCore0_sampF_rWrPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY
	    adcCore0_sampF_rWrPtr_rsCounter$D_IN;
      if (wti_isReset_isInReset$EN)
	wti_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wti_isReset_isInReset$D_IN;
    end
  always@(posedge adcCore1_ddrC_ddrV$sdrClk or
	  `BSV_RESET_EDGE adcCore1_sdrRst$OUT_RST)
  if (adcCore1_sdrRst$OUT_RST == `BSV_RESET_VALUE)
    begin
      adcCore1_sampF_rRdPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
      adcCore1_sampF_rRdPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY 11'd0;
      adcCore1_sampF_rWrPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY 11'd0;
    end
  else
    begin
      if (adcCore1_sampF_rRdPtr_rdCounter$EN)
	adcCore1_sampF_rRdPtr_rdCounter <= `BSV_ASSIGNMENT_DELAY
	    adcCore1_sampF_rRdPtr_rdCounter$D_IN;
      if (adcCore1_sampF_rRdPtr_rdCounterPre$EN)
	adcCore1_sampF_rRdPtr_rdCounterPre <= `BSV_ASSIGNMENT_DELAY
	    adcCore1_sampF_rRdPtr_rdCounterPre$D_IN;
      if (adcCore1_sampF_rWrPtr_rsCounter$EN)
	adcCore1_sampF_rWrPtr_rsCounter <= `BSV_ASSIGNMENT_DELAY
	    adcCore1_sampF_rWrPtr_rsCounter$D_IN;
    end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    adcControl = 32'hAAAAAAAA;
    adcCore0_acquireDReg = 1'h0;
    adcCore0_adcRst = 1'h0;
    adcCore0_averageDReg = 1'h0;
    adcCore0_colGate_avgEven = 18'h2AAAA;
    adcCore0_colGate_avgOdd = 18'h2AAAA;
    adcCore0_colGate_avgPhase = 2'h2;
    adcCore0_colGate_collectD = 1'h0;
    adcCore0_colGate_dropCount = 32'hAAAAAAAA;
    adcCore0_colGate_dwellFails = 32'hAAAAAAAA;
    adcCore0_colGate_dwellStarts = 32'hAAAAAAAA;
    adcCore0_colGate_ovrRecover = 4'hA;
    adcCore0_colGate_sampActive = 1'h0;
    adcCore0_colGate_sampActiveD = 1'h0;
    adcCore0_colGate_sampCount = 32'hAAAAAAAA;
    adcCore0_colGate_sampDataWD = 32'hAAAAAAAA;
    adcCore0_colGate_syncMesg = 2'h2;
    adcCore0_colGate_timeMesg = 3'h2;
    adcCore0_colGate_uprollCnt = 16'hAAAA;
    adcCore0_ddrC_psCmdReg = 2'h2;
    adcCore0_iseqFsm_jj_delay_count = 13'h0AAA;
    adcCore0_iseqFsm_start_reg = 1'h0;
    adcCore0_iseqFsm_start_reg_1 = 1'h0;
    adcCore0_iseqFsm_state_can_overlap = 1'h0;
    adcCore0_iseqFsm_state_fired = 1'h0;
    adcCore0_iseqFsm_state_mkFSMstate = 4'hA;
    adcCore0_operateDReg = 1'h0;
    adcCore0_readMode = 1'h0;
    adcCore0_samp = 32'hAAAAAAAA;
    adcCore0_sampF_rRdPtr_rdCounter = 11'h2AA;
    adcCore0_sampF_rRdPtr_rdCounterPre = 11'h2AA;
    adcCore0_sampF_rRdPtr_rsCounter = 11'h2AA;
    adcCore0_sampF_rWrPtr_rdCounter = 11'h2AA;
    adcCore0_sampF_rWrPtr_rdCounterPre = 11'h2AA;
    adcCore0_sampF_rWrPtr_rsCounter = 11'h2AA;
    adcCore0_spiI_cGate = 1'h0;
    adcCore0_spiI_cap = 1'h0;
    adcCore0_spiI_cap_1 = 1'h0;
    adcCore0_spiI_cap_2 = 1'h0;
    adcCore0_spiI_cap_3 = 1'h0;
    adcCore0_spiI_cap_4 = 1'h0;
    adcCore0_spiI_cap_5 = 1'h0;
    adcCore0_spiI_cap_6 = 1'h0;
    adcCore0_spiI_cap_7 = 1'h0;
    adcCore0_spiI_csbR = 1'h0;
    adcCore0_spiI_dPos = 3'h2;
    adcCore0_spiI_doResp = 1'h0;
    adcCore0_spiI_iPos = 4'hA;
    adcCore0_spiI_reqF_head_wrapped = 1'h0;
    adcCore0_spiI_reqF_tail_wrapped = 1'h0;
    adcCore0_spiI_reqS = 17'h0AAAA;
    adcCore0_spiI_respF_head_wrapped = 1'h0;
    adcCore0_spiI_respF_tail_wrapped = 1'h0;
    adcCore0_spiI_respS = 8'hAA;
    adcCore0_spiI_sdiP = 1'h0;
    adcCore0_spiI_sdoR = 1'h0;
    adcCore0_spiI_xmt_d = 1'h0;
    adcCore0_spiI_xmt_i = 1'h0;
    adcCore1_acquireDReg = 1'h0;
    adcCore1_adcRst = 1'h0;
    adcCore1_averageDReg = 1'h0;
    adcCore1_colGate_avgEven = 18'h2AAAA;
    adcCore1_colGate_avgOdd = 18'h2AAAA;
    adcCore1_colGate_avgPhase = 2'h2;
    adcCore1_colGate_collectD = 1'h0;
    adcCore1_colGate_dropCount = 32'hAAAAAAAA;
    adcCore1_colGate_dwellFails = 32'hAAAAAAAA;
    adcCore1_colGate_dwellStarts = 32'hAAAAAAAA;
    adcCore1_colGate_ovrRecover = 4'hA;
    adcCore1_colGate_sampActive = 1'h0;
    adcCore1_colGate_sampActiveD = 1'h0;
    adcCore1_colGate_sampCount = 32'hAAAAAAAA;
    adcCore1_colGate_sampDataWD = 32'hAAAAAAAA;
    adcCore1_colGate_syncMesg = 2'h2;
    adcCore1_colGate_timeMesg = 3'h2;
    adcCore1_colGate_uprollCnt = 16'hAAAA;
    adcCore1_ddrC_psCmdReg = 2'h2;
    adcCore1_iseqFsm_jj_delay_count = 13'h0AAA;
    adcCore1_iseqFsm_start_reg = 1'h0;
    adcCore1_iseqFsm_start_reg_1 = 1'h0;
    adcCore1_iseqFsm_state_can_overlap = 1'h0;
    adcCore1_iseqFsm_state_fired = 1'h0;
    adcCore1_iseqFsm_state_mkFSMstate = 4'hA;
    adcCore1_operateDReg = 1'h0;
    adcCore1_readMode = 1'h0;
    adcCore1_samp = 32'hAAAAAAAA;
    adcCore1_sampF_rRdPtr_rdCounter = 11'h2AA;
    adcCore1_sampF_rRdPtr_rdCounterPre = 11'h2AA;
    adcCore1_sampF_rRdPtr_rsCounter = 11'h2AA;
    adcCore1_sampF_rWrPtr_rdCounter = 11'h2AA;
    adcCore1_sampF_rWrPtr_rdCounterPre = 11'h2AA;
    adcCore1_sampF_rWrPtr_rsCounter = 11'h2AA;
    adcCore1_spiI_cGate = 1'h0;
    adcCore1_spiI_cap = 1'h0;
    adcCore1_spiI_cap_1 = 1'h0;
    adcCore1_spiI_cap_2 = 1'h0;
    adcCore1_spiI_cap_3 = 1'h0;
    adcCore1_spiI_cap_4 = 1'h0;
    adcCore1_spiI_cap_5 = 1'h0;
    adcCore1_spiI_cap_6 = 1'h0;
    adcCore1_spiI_cap_7 = 1'h0;
    adcCore1_spiI_csbR = 1'h0;
    adcCore1_spiI_dPos = 3'h2;
    adcCore1_spiI_doResp = 1'h0;
    adcCore1_spiI_iPos = 4'hA;
    adcCore1_spiI_reqF_head_wrapped = 1'h0;
    adcCore1_spiI_reqF_tail_wrapped = 1'h0;
    adcCore1_spiI_reqS = 17'h0AAAA;
    adcCore1_spiI_respF_head_wrapped = 1'h0;
    adcCore1_spiI_respF_tail_wrapped = 1'h0;
    adcCore1_spiI_respS = 8'hAA;
    adcCore1_spiI_sdiP = 1'h0;
    adcCore1_spiI_sdoR = 1'h0;
    adcCore1_spiI_xmt_d = 1'h0;
    adcCore1_spiI_xmt_i = 1'h0;
    adcIdc_doResetCount = 4'hA;
    adcIdc_preResetCount = 4'hA;
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
    spiClk_iState = 4'hA;
    spiClk_iseqFsm_start_reg = 1'h0;
    spiClk_iseqFsm_start_reg_1 = 1'h0;
    spiClk_iseqFsm_state_can_overlap = 1'h0;
    spiClk_iseqFsm_state_fired = 1'h0;
    spiClk_iseqFsm_state_mkFSMstate = 4'hA;
    spiClk_spiI_cGate = 1'h0;
    spiClk_spiI_cap = 1'h0;
    spiClk_spiI_cap_1 = 1'h0;
    spiClk_spiI_cap_2 = 1'h0;
    spiClk_spiI_cap_3 = 1'h0;
    spiClk_spiI_cap_4 = 1'h0;
    spiClk_spiI_cap_5 = 1'h0;
    spiClk_spiI_cap_6 = 1'h0;
    spiClk_spiI_cap_7 = 1'h0;
    spiClk_spiI_csbR = 1'h0;
    spiClk_spiI_dPos = 3'h2;
    spiClk_spiI_doResp = 1'h0;
    spiClk_spiI_iPos = 4'hA;
    spiClk_spiI_reqF_head_wrapped = 1'h0;
    spiClk_spiI_reqF_tail_wrapped = 1'h0;
    spiClk_spiI_reqS = 17'h0AAAA;
    spiClk_spiI_respF_head_wrapped = 1'h0;
    spiClk_spiI_respF_tail_wrapped = 1'h0;
    spiClk_spiI_respS = 8'hAA;
    spiClk_spiI_sdiP = 1'h0;
    spiClk_spiI_sdoR = 1'h0;
    spiClk_spiI_xmt_d = 1'h0;
    spiClk_spiI_xmt_i = 1'h0;
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
      if (MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1 &&
	  WILL_FIRE_RL_get_adc1_resp)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 88: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_get_adx_resp] and\n  [RL_get_adc1_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1 &&
	  MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 88: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_get_adx_resp] and\n  [RL_get_adc0_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2 &&
	  WILL_FIRE_RL_get_adc1_resp)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 102: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_get_adc0_resp] and\n  [RL_get_adc1_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	begin
	  v__h130298 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	$display("[%0d]: %m: WCI CONFIG WRITE Addr:%0x BE:%0x Data:%0x",
		 v__h130298,
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
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_get_adc1_resp)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 60: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_get_adc1_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO &&
	  MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 60: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_get_adc0_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO &&
	  MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 60: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_get_adx_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 60: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_OrE && WILL_FIRE_RL_get_adc1_resp)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 74: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_OrE] and\n  [RL_get_adc1_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_OrE &&
	  MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 74: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_OrE] and\n  [RL_get_adc0_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_OrE &&
	  MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 74: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_OrE] and\n  [RL_get_adx_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_spiClk_iseqFsm_action_l45c9 &&
	  (WILL_FIRE_RL_spiClk_iseqFsm_action_l46c9 ||
	   WILL_FIRE_RL_spiClk_iseqFsm_action_l47c9 ||
	   WILL_FIRE_RL_spiClk_iseqFsm_action_l48c9 ||
	   WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9 ||
	   WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9))
	$display("Error: \"bsv/dev/AD9512.bsv\", line 45, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_spiClk_iseqFsm_action_l45c9]\n  and [RL_spiClk_iseqFsm_action_l46c9, RL_spiClk_iseqFsm_action_l47c9,\n  RL_spiClk_iseqFsm_action_l48c9, RL_spiClk_iseqFsm_action_l49c9,\n  RL_spiClk_iseqFsm_action_l50c9] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_spiClk_iseqFsm_action_l46c9 &&
	  (WILL_FIRE_RL_spiClk_iseqFsm_action_l47c9 ||
	   WILL_FIRE_RL_spiClk_iseqFsm_action_l48c9 ||
	   WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9 ||
	   WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9))
	$display("Error: \"bsv/dev/AD9512.bsv\", line 46, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_spiClk_iseqFsm_action_l46c9]\n  and [RL_spiClk_iseqFsm_action_l47c9, RL_spiClk_iseqFsm_action_l48c9,\n  RL_spiClk_iseqFsm_action_l49c9, RL_spiClk_iseqFsm_action_l50c9] ) fired in\n  the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_spiClk_iseqFsm_action_l47c9 &&
	  (WILL_FIRE_RL_spiClk_iseqFsm_action_l48c9 ||
	   WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9 ||
	   WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9))
	$display("Error: \"bsv/dev/AD9512.bsv\", line 47, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_spiClk_iseqFsm_action_l47c9]\n  and [RL_spiClk_iseqFsm_action_l48c9, RL_spiClk_iseqFsm_action_l49c9,\n  RL_spiClk_iseqFsm_action_l50c9] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_spiClk_iseqFsm_action_l48c9 &&
	  (WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9 ||
	   WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9))
	$display("Error: \"bsv/dev/AD9512.bsv\", line 48, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_spiClk_iseqFsm_action_l48c9]\n  and [RL_spiClk_iseqFsm_action_l49c9, RL_spiClk_iseqFsm_action_l50c9] ) fired\n  in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9 &&
	  WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9)
	$display("Error: \"bsv/dev/AD9512.bsv\", line 49, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_spiClk_iseqFsm_action_l49c9]\n  and [RL_spiClk_iseqFsm_action_l50c9] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (adcCore0_iseqFsm_state_mkFSMstate == 4'd1 &&
	  (adcCore0_iseqFsm_state_mkFSMstate == 4'd2 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_np ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l119c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9))
	$display("Error: \"bsv/dev/TI6149.bsv\", line 117, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore0_iseqFsm_action_l117c12] and\n  [RL_adcCore0_iseqFsm_action_d_init_np, RL_adcCore0_iseqFsm_action_np,\n  RL_adcCore0_iseqFsm_action_l119c9, RL_adcCore0_iseqFsm_action_l120c9,\n  RL_adcCore0_iseqFsm_action_l121c9, RL_adcCore0_iseqFsm_action_l122c9,\n  RL_adcCore0_iseqFsm_action_l123c9, RL_adcCore0_iseqFsm_action_l124c9] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (adcCore0_iseqFsm_state_mkFSMstate == 4'd2 &&
	  (WILL_FIRE_RL_adcCore0_iseqFsm_action_np ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l119c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore0_iseqFsm_action_d_init_np] and [RL_adcCore0_iseqFsm_action_np,\n  RL_adcCore0_iseqFsm_action_l119c9, RL_adcCore0_iseqFsm_action_l120c9,\n  RL_adcCore0_iseqFsm_action_l121c9, RL_adcCore0_iseqFsm_action_l122c9,\n  RL_adcCore0_iseqFsm_action_l123c9, RL_adcCore0_iseqFsm_action_l124c9] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore0_iseqFsm_action_np &&
	  (WILL_FIRE_RL_adcCore0_iseqFsm_action_l119c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_adcCore0_iseqFsm_action_np]\n  and [RL_adcCore0_iseqFsm_action_l119c9, RL_adcCore0_iseqFsm_action_l120c9,\n  RL_adcCore0_iseqFsm_action_l121c9, RL_adcCore0_iseqFsm_action_l122c9,\n  RL_adcCore0_iseqFsm_action_l123c9, RL_adcCore0_iseqFsm_action_l124c9] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore0_iseqFsm_action_l119c9 &&
	  (WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9))
	$display("Error: \"bsv/dev/TI6149.bsv\", line 119, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore0_iseqFsm_action_l119c9] and [RL_adcCore0_iseqFsm_action_l120c9,\n  RL_adcCore0_iseqFsm_action_l121c9, RL_adcCore0_iseqFsm_action_l122c9,\n  RL_adcCore0_iseqFsm_action_l123c9, RL_adcCore0_iseqFsm_action_l124c9] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9 &&
	  (WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9))
	$display("Error: \"bsv/dev/TI6149.bsv\", line 120, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore0_iseqFsm_action_l120c9] and [RL_adcCore0_iseqFsm_action_l121c9,\n  RL_adcCore0_iseqFsm_action_l122c9, RL_adcCore0_iseqFsm_action_l123c9,\n  RL_adcCore0_iseqFsm_action_l124c9] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9 &&
	  (WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9))
	$display("Error: \"bsv/dev/TI6149.bsv\", line 121, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore0_iseqFsm_action_l121c9] and [RL_adcCore0_iseqFsm_action_l122c9,\n  RL_adcCore0_iseqFsm_action_l123c9, RL_adcCore0_iseqFsm_action_l124c9] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9 &&
	  (WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9))
	$display("Error: \"bsv/dev/TI6149.bsv\", line 122, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore0_iseqFsm_action_l122c9] and [RL_adcCore0_iseqFsm_action_l123c9,\n  RL_adcCore0_iseqFsm_action_l124c9] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 &&
	  WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9)
	$display("Error: \"bsv/dev/TI6149.bsv\", line 123, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore0_iseqFsm_action_l123c9] and [RL_adcCore0_iseqFsm_action_l124c9]\n  ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (adcCore1_iseqFsm_state_mkFSMstate == 4'd1 &&
	  (adcCore1_iseqFsm_state_mkFSMstate == 4'd2 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_np ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l119c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9))
	$display("Error: \"bsv/dev/TI6149.bsv\", line 117, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore1_iseqFsm_action_l117c12] and\n  [RL_adcCore1_iseqFsm_action_d_init_np, RL_adcCore1_iseqFsm_action_np,\n  RL_adcCore1_iseqFsm_action_l119c9, RL_adcCore1_iseqFsm_action_l120c9,\n  RL_adcCore1_iseqFsm_action_l121c9, RL_adcCore1_iseqFsm_action_l122c9,\n  RL_adcCore1_iseqFsm_action_l123c9, RL_adcCore1_iseqFsm_action_l124c9] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (adcCore1_iseqFsm_state_mkFSMstate == 4'd2 &&
	  (WILL_FIRE_RL_adcCore1_iseqFsm_action_np ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l119c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore1_iseqFsm_action_d_init_np] and [RL_adcCore1_iseqFsm_action_np,\n  RL_adcCore1_iseqFsm_action_l119c9, RL_adcCore1_iseqFsm_action_l120c9,\n  RL_adcCore1_iseqFsm_action_l121c9, RL_adcCore1_iseqFsm_action_l122c9,\n  RL_adcCore1_iseqFsm_action_l123c9, RL_adcCore1_iseqFsm_action_l124c9] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore1_iseqFsm_action_np &&
	  (WILL_FIRE_RL_adcCore1_iseqFsm_action_l119c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9))
	$display("Error: \"StmtFSM.bs\", line 41, column 0: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_adcCore1_iseqFsm_action_np]\n  and [RL_adcCore1_iseqFsm_action_l119c9, RL_adcCore1_iseqFsm_action_l120c9,\n  RL_adcCore1_iseqFsm_action_l121c9, RL_adcCore1_iseqFsm_action_l122c9,\n  RL_adcCore1_iseqFsm_action_l123c9, RL_adcCore1_iseqFsm_action_l124c9] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore1_iseqFsm_action_l119c9 &&
	  (WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9))
	$display("Error: \"bsv/dev/TI6149.bsv\", line 119, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore1_iseqFsm_action_l119c9] and [RL_adcCore1_iseqFsm_action_l120c9,\n  RL_adcCore1_iseqFsm_action_l121c9, RL_adcCore1_iseqFsm_action_l122c9,\n  RL_adcCore1_iseqFsm_action_l123c9, RL_adcCore1_iseqFsm_action_l124c9] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9 &&
	  (WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9))
	$display("Error: \"bsv/dev/TI6149.bsv\", line 120, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore1_iseqFsm_action_l120c9] and [RL_adcCore1_iseqFsm_action_l121c9,\n  RL_adcCore1_iseqFsm_action_l122c9, RL_adcCore1_iseqFsm_action_l123c9,\n  RL_adcCore1_iseqFsm_action_l124c9] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9 &&
	  (WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9))
	$display("Error: \"bsv/dev/TI6149.bsv\", line 121, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore1_iseqFsm_action_l121c9] and [RL_adcCore1_iseqFsm_action_l122c9,\n  RL_adcCore1_iseqFsm_action_l123c9, RL_adcCore1_iseqFsm_action_l124c9] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9 &&
	  (WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9))
	$display("Error: \"bsv/dev/TI6149.bsv\", line 122, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore1_iseqFsm_action_l122c9] and [RL_adcCore1_iseqFsm_action_l123c9,\n  RL_adcCore1_iseqFsm_action_l124c9] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 &&
	  WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9)
	$display("Error: \"bsv/dev/TI6149.bsv\", line 123, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore1_iseqFsm_action_l123c9] and [RL_adcCore1_iseqFsm_action_l124c9]\n  ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	begin
	  v__h131387 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	$display("[%0d]: %m: WCI CONFIG READ Addr:%0x BE:%0x Data:%0x",
		 v__h131387,
		 wci_wslv_reqF$D_OUT[63:32],
		 wci_wslv_reqF$D_OUT[67:64],
		 rdat__h131371);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_get_adc1_resp)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_get_adc1_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_get_adc0_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_get_adx_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and [RL_wci_cfrd] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_get_adc1_resp)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_get_adc1_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_get_adc0_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_get_adx_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_get_adc1_resp)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_get_adc1_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI &&
	  MUX_wci_wslv_respF_x_wire$wset_1__PSEL_2)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_get_adc0_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI &&
	  MUX_wci_wslv_respF_x_wire$wset_1__PSEL_1)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_get_adx_resp] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/ADCWorker.bsv\", line 125, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
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
      if (WILL_FIRE_RL_spiClk_iseqFsm_action_l44c9 &&
	  (WILL_FIRE_RL_spiClk_iseqFsm_action_l45c9 ||
	   WILL_FIRE_RL_spiClk_iseqFsm_action_l46c9 ||
	   WILL_FIRE_RL_spiClk_iseqFsm_action_l47c9 ||
	   WILL_FIRE_RL_spiClk_iseqFsm_action_l48c9 ||
	   WILL_FIRE_RL_spiClk_iseqFsm_action_l49c9 ||
	   WILL_FIRE_RL_spiClk_iseqFsm_action_l50c9))
	$display("Error: \"bsv/dev/AD9512.bsv\", line 44, column 9: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_spiClk_iseqFsm_action_l44c9]\n  and [RL_spiClk_iseqFsm_action_l45c9, RL_spiClk_iseqFsm_action_l46c9,\n  RL_spiClk_iseqFsm_action_l47c9, RL_spiClk_iseqFsm_action_l48c9,\n  RL_spiClk_iseqFsm_action_l49c9, RL_spiClk_iseqFsm_action_l50c9] ) fired in\n  the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore0_iseqFsm_action_l116c12 &&
	  (adcCore0_iseqFsm_state_mkFSMstate == 4'd1 ||
	   adcCore0_iseqFsm_state_mkFSMstate == 4'd2 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_np ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l119c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l120c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l121c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l122c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore0_iseqFsm_action_l124c9))
	$display("Error: \"bsv/dev/TI6149.bsv\", line 116, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore0_iseqFsm_action_l116c12] and\n  [RL_adcCore0_iseqFsm_action_l117c12, RL_adcCore0_iseqFsm_action_d_init_np,\n  RL_adcCore0_iseqFsm_action_np, RL_adcCore0_iseqFsm_action_l119c9,\n  RL_adcCore0_iseqFsm_action_l120c9, RL_adcCore0_iseqFsm_action_l121c9,\n  RL_adcCore0_iseqFsm_action_l122c9, RL_adcCore0_iseqFsm_action_l123c9,\n  RL_adcCore0_iseqFsm_action_l124c9] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_adcCore1_iseqFsm_action_l116c12 &&
	  (adcCore1_iseqFsm_state_mkFSMstate == 4'd1 ||
	   adcCore1_iseqFsm_state_mkFSMstate == 4'd2 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_np ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l119c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l120c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l121c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l122c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l123c9 ||
	   WILL_FIRE_RL_adcCore1_iseqFsm_action_l124c9))
	$display("Error: \"bsv/dev/TI6149.bsv\", line 116, column 12: (R0001)\n  Mutually exclusive rules (from the ME sets\n  [RL_adcCore1_iseqFsm_action_l116c12] and\n  [RL_adcCore1_iseqFsm_action_l117c12, RL_adcCore1_iseqFsm_action_d_init_np,\n  RL_adcCore1_iseqFsm_action_np, RL_adcCore1_iseqFsm_action_l119c9,\n  RL_adcCore1_iseqFsm_action_l120c9, RL_adcCore1_iseqFsm_action_l121c9,\n  RL_adcCore1_iseqFsm_action_l122c9, RL_adcCore1_iseqFsm_action_l123c9,\n  RL_adcCore1_iseqFsm_action_l124c9] ) fired in the same clock cycle.\n");
  end
  // synopsys translate_on
endmodule