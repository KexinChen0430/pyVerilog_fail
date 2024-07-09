module outputs
  wire [31 : 0] wciS0_SData;
  wire [1 : 0] wciS0_SFlag, wciS0_SResp;
  wire CLK_GATE_padsCDC_sclk,
       CLK_GATE_padsCDC_sclkn,
       CLK_GATE_padsDAC_sclk,
       CLK_GATE_padsDAC_sclkn,
       CLK_padsCDC_sclk,
       CLK_padsCDC_sclkn,
       CLK_padsDAC_sclk,
       CLK_padsDAC_sclkn,
       RST_N_padsCDC_srst,
       RST_N_padsDAC_srst,
       padsCDC_csb,
       padsCDC_sclkgate,
       padsCDC_sdo,
       padsDAC_csb,
       padsDAC_sclkgate,
       padsDAC_sdo,
       wciS0_SThreadBusy;
  // inlined wires
  wire [71 : 0] wci_wslv_wciReq_wget;
  wire [33 : 0] wci_wslv_respF_x_wire_wget;
  wire [31 : 0] wci_wci_Es_mAddr_w_wget, wci_wci_Es_mData_w_wget;
  wire [17 : 0] fcCdc_grayCounter_wdCounterCrossing_wget;
  wire [3 : 0] wci_wci_Es_mByteEn_w_wget;
  wire [2 : 0] wci_wci_Es_mCmd_w_wget, wci_wslv_wEdge_wget;
  wire fcCdc_grayCounter_pwDecrement_whas,
       fcCdc_grayCounter_pwIncrement_whas,
       fcCdc_pulseAction_1_wget,
       fcCdc_pulseAction_1_whas,
       oneKHz_decAction_whas,
       oneKHz_incAction_whas,
       spiCDC_cGate_1_wget,
       spiCDC_cGate_1_whas,
       spiCDC_csbR_1_wget,
       spiCDC_csbR_1_whas,
       spiCDC_doResp_1_wget,
       spiCDC_doResp_1_whas,
       spiCDC_reqF_dClear_pw_whas,
       spiCDC_reqF_deq_happened_whas,
       spiCDC_reqF_deq_pw_whas,
       spiCDC_reqF_enq_pw_whas,
       spiCDC_reqF_sClear_pw_whas,
       spiCDC_respF_dClear_pw_whas,
       spiCDC_respF_deq_happened_whas,
       spiCDC_respF_deq_pw_whas,
       spiCDC_respF_enq_pw_whas,
       spiCDC_respF_sClear_pw_whas,
       spiCDC_sdiWs_wget,
       spiDAC_cGate_1_wget,
       spiDAC_cGate_1_whas,
       spiDAC_csbR_1_wget,
       spiDAC_csbR_1_whas,
       spiDAC_doResp_1_wget,
       spiDAC_doResp_1_whas,
       spiDAC_reqF_dClear_pw_whas,
       spiDAC_reqF_deq_happened_whas,
       spiDAC_reqF_deq_pw_whas,
       spiDAC_reqF_enq_pw_whas,
       spiDAC_reqF_sClear_pw_whas,
       spiDAC_respF_dClear_pw_whas,
       spiDAC_respF_deq_happened_whas,
       spiDAC_respF_deq_pw_whas,
       spiDAC_respF_enq_pw_whas,
       spiDAC_respF_sClear_pw_whas,
       spiDAC_sdiWs_wget,
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
       wci_wslv_wci_ctrl_pw_whas;
  // register fcCdc_countNow
  reg [17 : 0] fcCdc_countNow;
  wire [17 : 0] fcCdc_countNow_D_IN;
  wire fcCdc_countNow_EN;
  // register fcCdc_countPast
  reg [17 : 0] fcCdc_countPast;
  wire [17 : 0] fcCdc_countPast_D_IN;
  wire fcCdc_countPast_EN;
  // register fcCdc_frequency
  reg [17 : 0] fcCdc_frequency;
  wire [17 : 0] fcCdc_frequency_D_IN;
  wire fcCdc_frequency_EN;
  // register fcCdc_grayCounter_rdCounter
  reg [17 : 0] fcCdc_grayCounter_rdCounter;
  wire [17 : 0] fcCdc_grayCounter_rdCounter_D_IN;
  wire fcCdc_grayCounter_rdCounter_EN;
  // register fcCdc_grayCounter_rdCounterPre
  reg [17 : 0] fcCdc_grayCounter_rdCounterPre;
  wire [17 : 0] fcCdc_grayCounter_rdCounterPre_D_IN;
  wire fcCdc_grayCounter_rdCounterPre_EN;
  // register fcCdc_grayCounter_rsCounter
  reg [17 : 0] fcCdc_grayCounter_rsCounter;
  wire [17 : 0] fcCdc_grayCounter_rsCounter_D_IN;
  wire fcCdc_grayCounter_rsCounter_EN;
  // register fcCdc_pulseAction
  reg fcCdc_pulseAction;
  wire fcCdc_pulseAction_D_IN, fcCdc_pulseAction_EN;
  // register fcCdc_sampleCount
  reg [15 : 0] fcCdc_sampleCount;
  wire [15 : 0] fcCdc_sampleCount_D_IN;
  wire fcCdc_sampleCount_EN;
  // register oneKHz_value
  reg [17 : 0] oneKHz_value;
  wire [17 : 0] oneKHz_value_D_IN;
  wire oneKHz_value_EN;
  // register spiCDC_cGate
  reg spiCDC_cGate;
  wire spiCDC_cGate_D_IN, spiCDC_cGate_EN;
  // register spiCDC_capV
  reg [27 : 0] spiCDC_capV;
  wire [27 : 0] spiCDC_capV_D_IN;
  wire spiCDC_capV_EN;
  // register spiCDC_csbR
  reg spiCDC_csbR;
  wire spiCDC_csbR_D_IN, spiCDC_csbR_EN;
  // register spiCDC_dPos
  reg [4 : 0] spiCDC_dPos;
  wire [4 : 0] spiCDC_dPos_D_IN;
  wire spiCDC_dPos_EN;
  // register spiCDC_doResp
  reg spiCDC_doResp;
  wire spiCDC_doResp_D_IN, spiCDC_doResp_EN;
  // register spiCDC_rPos
  reg [5 : 0] spiCDC_rPos;
  wire [5 : 0] spiCDC_rPos_D_IN;
  wire spiCDC_rPos_EN;
  // register spiCDC_rcv_d
  reg spiCDC_rcv_d;
  wire spiCDC_rcv_d_D_IN, spiCDC_rcv_d_EN;
  // register spiCDC_reqF_head_wrapped
  reg spiCDC_reqF_head_wrapped;
  wire spiCDC_reqF_head_wrapped_D_IN, spiCDC_reqF_head_wrapped_EN;
  // register spiCDC_reqF_tail_wrapped
  reg spiCDC_reqF_tail_wrapped;
  wire spiCDC_reqF_tail_wrapped_D_IN, spiCDC_reqF_tail_wrapped_EN;
  // register spiCDC_reqS
  reg [32 : 0] spiCDC_reqS;
  wire [32 : 0] spiCDC_reqS_D_IN;
  wire spiCDC_reqS_EN;
  // register spiCDC_respF_head_wrapped
  reg spiCDC_respF_head_wrapped;
  wire spiCDC_respF_head_wrapped_D_IN, spiCDC_respF_head_wrapped_EN;
  // register spiCDC_respF_tail_wrapped
  reg spiCDC_respF_tail_wrapped;
  wire spiCDC_respF_tail_wrapped_D_IN, spiCDC_respF_tail_wrapped_EN;
  // register spiCDC_respS
  reg [27 : 0] spiCDC_respS;
  wire [27 : 0] spiCDC_respS_D_IN;
  wire spiCDC_respS_EN;
  // register spiCDC_sdiP
  reg spiCDC_sdiP;
  wire spiCDC_sdiP_D_IN, spiCDC_sdiP_EN;
  // register spiCDC_sdoR
  reg spiCDC_sdoR;
  wire spiCDC_sdoR_D_IN, spiCDC_sdoR_EN;
  // register spiCDC_xmt_d
  reg spiCDC_xmt_d;
  wire spiCDC_xmt_d_D_IN, spiCDC_xmt_d_EN;
  // register spiDAC_cGate
  reg spiDAC_cGate;
  wire spiDAC_cGate_D_IN, spiDAC_cGate_EN;
  // register spiDAC_capV
  reg [7 : 0] spiDAC_capV;
  wire [7 : 0] spiDAC_capV_D_IN;
  wire spiDAC_capV_EN;
  // register spiDAC_csbR
  reg spiDAC_csbR;
  wire spiDAC_csbR_D_IN, spiDAC_csbR_EN;
  // register spiDAC_dPos
  reg [2 : 0] spiDAC_dPos;
  wire [2 : 0] spiDAC_dPos_D_IN;
  wire spiDAC_dPos_EN;
  // register spiDAC_doResp
  reg spiDAC_doResp;
  wire spiDAC_doResp_D_IN, spiDAC_doResp_EN;
  // register spiDAC_iPos
  reg [2 : 0] spiDAC_iPos;
  wire [2 : 0] spiDAC_iPos_D_IN;
  wire spiDAC_iPos_EN;
  // register spiDAC_reqF_head_wrapped
  reg spiDAC_reqF_head_wrapped;
  wire spiDAC_reqF_head_wrapped_D_IN, spiDAC_reqF_head_wrapped_EN;
  // register spiDAC_reqF_tail_wrapped
  reg spiDAC_reqF_tail_wrapped;
  wire spiDAC_reqF_tail_wrapped_D_IN, spiDAC_reqF_tail_wrapped_EN;
  // register spiDAC_reqS
  reg [13 : 0] spiDAC_reqS;
  wire [13 : 0] spiDAC_reqS_D_IN;
  wire spiDAC_reqS_EN;
  // register spiDAC_respF_head_wrapped
  reg spiDAC_respF_head_wrapped;
  wire spiDAC_respF_head_wrapped_D_IN, spiDAC_respF_head_wrapped_EN;
  // register spiDAC_respF_tail_wrapped
  reg spiDAC_respF_tail_wrapped;
  wire spiDAC_respF_tail_wrapped_D_IN, spiDAC_respF_tail_wrapped_EN;
  // register spiDAC_respS
  reg [7 : 0] spiDAC_respS;
  wire [7 : 0] spiDAC_respS_D_IN;
  wire spiDAC_respS_EN;
  // register spiDAC_sdiP
  reg spiDAC_sdiP;
  wire spiDAC_sdiP_D_IN, spiDAC_sdiP_EN;
  // register spiDAC_sdoR
  reg spiDAC_sdoR;
  wire spiDAC_sdoR_D_IN, spiDAC_sdoR_EN;
  // register spiDAC_xcv_d
  reg spiDAC_xcv_d;
  wire spiDAC_xcv_d_D_IN, spiDAC_xcv_d_EN;
  // register spiDAC_xmt_i
  reg spiDAC_xmt_i;
  wire spiDAC_xmt_i_D_IN, spiDAC_xmt_i_EN;
  // register splitReadInFlight
  reg splitReadInFlight;
  wire splitReadInFlight_D_IN, splitReadInFlight_EN;
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
  // ports of submodule fcCdc_testRst
  wire fcCdc_testRst_OUT_RST;
  // ports of submodule spiCDC_cd
  wire spiCDC_cd_CLK_OUT, spiCDC_cd_PREEDGE;
  // ports of submodule spiCDC_cinv
  wire spiCDC_cinv_CLK_OUT;
  // ports of submodule spiCDC_reqF_dCombinedReset
  wire spiCDC_reqF_dCombinedReset_RST_OUT;
  // ports of submodule spiCDC_reqF_dCrossedsReset
  wire spiCDC_reqF_dCrossedsReset_OUT_RST;
  // ports of submodule spiCDC_reqF_dInReset
  wire spiCDC_reqF_dInReset_VAL;
  // ports of submodule spiCDC_reqF_sCombinedReset
  wire spiCDC_reqF_sCombinedReset_RST_OUT;
  // ports of submodule spiCDC_reqF_sCrosseddReset
  wire spiCDC_reqF_sCrosseddReset_OUT_RST;
  // ports of submodule spiCDC_reqF_sInReset
  wire spiCDC_reqF_sInReset_VAL;
  // ports of submodule spiCDC_respF_dCombinedReset
  wire spiCDC_respF_dCombinedReset_RST_OUT;
  // ports of submodule spiCDC_respF_dCrossedsReset
  wire spiCDC_respF_dCrossedsReset_OUT_RST;
  // ports of submodule spiCDC_respF_dInReset
  wire spiCDC_respF_dInReset_VAL;
  // ports of submodule spiCDC_respF_sCombinedReset
  wire spiCDC_respF_sCombinedReset_RST_OUT;
  // ports of submodule spiCDC_respF_sCrosseddReset
  wire spiCDC_respF_sCrosseddReset_OUT_RST;
  // ports of submodule spiCDC_respF_sInReset
  wire spiCDC_respF_sInReset_VAL;
  // ports of submodule spiCDC_slowReset
  wire spiCDC_slowReset_OUT_RST;
  // ports of submodule spiDAC_cd
  wire spiDAC_cd_CLK_OUT, spiDAC_cd_PREEDGE;
  // ports of submodule spiDAC_cinv
  wire spiDAC_cinv_CLK_OUT;
  // ports of submodule spiDAC_reqF_dCombinedReset
  wire spiDAC_reqF_dCombinedReset_RST_OUT;
  // ports of submodule spiDAC_reqF_dCrossedsReset
  wire spiDAC_reqF_dCrossedsReset_OUT_RST;
  // ports of submodule spiDAC_reqF_dInReset
  wire spiDAC_reqF_dInReset_VAL;
  // ports of submodule spiDAC_reqF_sCombinedReset
  wire spiDAC_reqF_sCombinedReset_RST_OUT;
  // ports of submodule spiDAC_reqF_sCrosseddReset
  wire spiDAC_reqF_sCrosseddReset_OUT_RST;
  // ports of submodule spiDAC_reqF_sInReset
  wire spiDAC_reqF_sInReset_VAL;
  // ports of submodule spiDAC_respF_dCombinedReset
  wire spiDAC_respF_dCombinedReset_RST_OUT;
  // ports of submodule spiDAC_respF_dCrossedsReset
  wire spiDAC_respF_dCrossedsReset_OUT_RST;
  // ports of submodule spiDAC_respF_dInReset
  wire spiDAC_respF_dInReset_VAL;
  // ports of submodule spiDAC_respF_sCombinedReset
  wire spiDAC_respF_sCombinedReset_RST_OUT;
  // ports of submodule spiDAC_respF_sCrosseddReset
  wire spiDAC_respF_sCrosseddReset_OUT_RST;
  // ports of submodule spiDAC_respF_sInReset
  wire spiDAC_respF_sInReset_VAL;
  // ports of submodule spiDAC_slowReset
  wire spiDAC_slowReset_OUT_RST;
  // ports of submodule wci_wslv_reqF
  wire [71 : 0] wci_wslv_reqF_D_IN, wci_wslv_reqF_D_OUT;
  wire wci_wslv_reqF_CLR,
       wci_wslv_reqF_DEQ,
       wci_wslv_reqF_EMPTY_N,
       wci_wslv_reqF_ENQ;
  // rule scheduling signals
  wire CAN_FIRE_RL_spi32_response,
       CAN_FIRE_RL_spi5_response,
       CAN_FIRE_RL_wci_cfrd,
       WILL_FIRE_RL_spiCDC_rd_resp,
       WILL_FIRE_RL_spiCDC_recv_d,
       WILL_FIRE_RL_spiCDC_reqF_deq_update_head,
       WILL_FIRE_RL_spiCDC_reqF_enq_update_tail,
       WILL_FIRE_RL_spiCDC_respF_deq_update_head,
       WILL_FIRE_RL_spiCDC_respF_enq_update_tail,
       WILL_FIRE_RL_spiCDC_send_d,
       WILL_FIRE_RL_spiCDC_start_cs,
       WILL_FIRE_RL_spiDAC_doxcv_d,
       WILL_FIRE_RL_spiDAC_reqF_deq_update_head,
       WILL_FIRE_RL_spiDAC_reqF_enq_update_tail,
       WILL_FIRE_RL_spiDAC_respF_deq_update_head,
       WILL_FIRE_RL_spiDAC_respF_enq_update_tail,
       WILL_FIRE_RL_spiDAC_send_i,
       WILL_FIRE_RL_spiDAC_start_cs,
       WILL_FIRE_RL_wci_cfrd,
       WILL_FIRE_RL_wci_cfwr,
       WILL_FIRE_RL_wci_ctrl_EiI,
       WILL_FIRE_RL_wci_ctrl_IsO,
       WILL_FIRE_RL_wci_ctrl_OrE,
       WILL_FIRE_RL_wci_wslv_ctl_op_complete,
       WILL_FIRE_RL_wci_wslv_ctl_op_start,
       WILL_FIRE_RL_wci_wslv_respF_both,
       WILL_FIRE_RL_wci_wslv_respF_decCtr,
       WILL_FIRE_RL_wci_wslv_respF_incCtr;
  // inputs to muxes for submodule ports
  reg [33 : 0] MUX_wci_wslv_respF_q_0_write_1__VAL_2;
  wire [33 : 0] MUX_wci_wslv_respF_q_0_write_1__VAL_1,
		MUX_wci_wslv_respF_q_1_write_1__VAL_1,
		MUX_wci_wslv_respF_x_wire_wset_1__VAL_1,
		MUX_wci_wslv_respF_x_wire_wset_1__VAL_2,
		MUX_wci_wslv_respF_x_wire_wset_1__VAL_3,
		MUX_wci_wslv_respF_x_wire_wset_1__VAL_4;
  wire [32 : 0] MUX_spiCDC_reqS_write_1__VAL_1,
		MUX_spiCDC_reqS_write_1__VAL_2;
  wire [17 : 0] MUX_fcCdc_grayCounter_rsCounter_write_1__VAL_1,
		MUX_oneKHz_value_write_1__VAL_1;
  wire [13 : 0] MUX_spiDAC_reqS_write_1__VAL_1,
		MUX_spiDAC_reqS_write_1__VAL_2;
  wire [5 : 0] MUX_spiCDC_rPos_write_1__VAL_1, MUX_spiCDC_rPos_write_1__VAL_2;
  wire [4 : 0] MUX_spiCDC_dPos_write_1__VAL_1;
  wire [2 : 0] MUX_spiDAC_dPos_write_1__VAL_1, MUX_spiDAC_iPos_write_1__VAL_1;
  wire [1 : 0] MUX_wci_wslv_respF_cntr_r_write_1__VAL_2;
  wire MUX_spiCDC_doResp_1_wset_1__SEL_1,
       MUX_spiCDC_rcv_d_write_1__SEL_2,
       MUX_spiCDC_reqS_write_1__SEL_1,
       MUX_spiDAC_doResp_1_wset_1__SEL_1,
       MUX_spiDAC_doResp_1_wset_1__SEL_2,
       MUX_spiDAC_reqS_write_1__SEL_1,
       MUX_spiDAC_sdoR_write_1__VAL_1,
       MUX_spiDAC_sdoR_write_1__VAL_2,
       MUX_splitReadInFlight_write_1__SEL_1,
       MUX_wci_wslv_illegalEdge_write_1__SEL_1,
       MUX_wci_wslv_illegalEdge_write_1__VAL_1,
       MUX_wci_wslv_respF_q_0_write_1__SEL_1,
       MUX_wci_wslv_respF_q_0_write_1__SEL_2,
       MUX_wci_wslv_respF_q_1_write_1__SEL_1,
       MUX_wci_wslv_respF_q_1_write_1__SEL_2,
       MUX_wci_wslv_respF_x_wire_wset_1__SEL_1,
       MUX_wci_wslv_respF_x_wire_wset_1__SEL_3,
       MUX_wci_wslv_respF_x_wire_wset_1__SEL_4;
  // remaining internal signals
  reg [63 : 0] v__h3562, v__h3737, v__h3881, v__h42276, v__h43038;
  reg [31 : 0] rdat__h43022;
  reg CASE_31_MINUS_spiCDC_dPos_29_30_0_spiCDC_reqS__ETC__q5,
      CASE_31_MINUS_spiCDC_dPos_29_30_4_spiCDC_reqS__ETC__q4,
      CASE_spiDAC_iPos_1_spiDAC_reqS_BIT_9_2_spiDAC__ETC__q2,
      IF_spiDAC_iPos_45_EQ_4_52_OR_spiDAC_iPos_45_EQ_ETC___d362;
  wire [31 : 0] IF_fcCdc_grayCounter_rsCounter_13_BIT_0_20_OR__ETC___d489,
		IF_fcCdc_grayCounter_rsCounter_13_BIT_0_20_XOR_ETC___d490,
		rdat__h42796;
  wire [27 : 0] spiCDC_reqS_BITS_27_TO_0__q1;
  wire [17 : 0] x__h36639, y__h38044;
  wire [7 : 0] spiDAC_reqS_BITS_7_TO_0__q3;
  wire [4 : 0] _31_MINUS_spiCDC_dPos_29___d230, x__h13601;
  wire [1 : 0] wci_wslv_respF_cntr_r_8_MINUS_1___d27;
  wire IF_spiDAC_iPos_45_EQ_7_46_THEN_NOT_spiDAC_reqF_ETC___d365,
       IF_wci_wslv_reqF_i_notEmpty__2_AND_wci_wslv_re_ETC___d590,
       NOT_spiDAC_iPos_45_EQ_0_59_60_OR_NOT_spiDAC_re_ETC___d361,
       _dfoo1,
       _dfoo3,
       _dor1spiCDC_reqF_enq_pw_EN_wset,
       _dor1spiDAC_reqF_enq_pw_EN_wset,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d514,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d517,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d519,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d522,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d524,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d527,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d529,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d532,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d534,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d537,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d539,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d542,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d544,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d547,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d549,
       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d552,
       fcCdc_grayCounter_rsCounter_13_BIT_0_20_XOR_fc_ETC___d454,
       x__h13558,
       z__h36659,
       z__h36666,
       z__h36673,
       z__h36680,
       z__h36687,
       z__h36694,
       z__h36701,
       z__h36708,
       z__h36715,
       z__h36722,
       z__h36729,
       z__h36736,
       z__h36743,
       z__h36750,
       z__h36757,
       z__h36764;
  // oscillator and gates for output clock CLK_padsCDC_sclk
  assign CLK_padsCDC_sclk = spiCDC_cd_CLK_OUT ;
  assign CLK_GATE_padsCDC_sclk = 1'b1 ;
  // oscillator and gates for output clock CLK_padsCDC_sclkn
  assign CLK_padsCDC_sclkn = spiCDC_cinv_CLK_OUT ;
  assign CLK_GATE_padsCDC_sclkn = 1'b1 ;
  // oscillator and gates for output clock CLK_padsDAC_sclk
  assign CLK_padsDAC_sclk = spiDAC_cd_CLK_OUT ;
  assign CLK_GATE_padsDAC_sclk = 1'b1 ;
  // oscillator and gates for output clock CLK_padsDAC_sclkn
  assign CLK_padsDAC_sclkn = spiDAC_cinv_CLK_OUT ;
  assign CLK_GATE_padsDAC_sclkn = 1'b1 ;
  // output resets
  assign RST_N_padsCDC_srst = spiCDC_slowReset_OUT_RST ;
  assign RST_N_padsDAC_srst = spiDAC_slowReset_OUT_RST ;
  // value method wciS0_sResp
  assign wciS0_SResp = wci_wslv_respF_q_0[33:32] ;
  // value method wciS0_sData
  assign wciS0_SData = wci_wslv_respF_q_0[31:0] ;
  // value method wciS0_sThreadBusy
  assign wciS0_SThreadBusy =
	     wci_wslv_reqF_countReg > 2'd1 || wci_wslv_isReset_isInReset ;
  // value method wciS0_sFlag
  assign wciS0_SFlag = { 1'd1, wci_wslv_sFlagReg } ;
  // value method padsCDC_sdo
  assign padsCDC_sdo = spiCDC_sdoR ;
  // value method padsCDC_csb
  assign padsCDC_csb = spiCDC_csbR ;
  // value method padsCDC_sclkgate
  assign padsCDC_sclkgate = spiCDC_cGate ;
  // value method padsDAC_sdo
  assign padsDAC_sdo = spiDAC_sdoR ;
  // value method padsDAC_csb
  assign padsDAC_csb = spiDAC_csbR ;
  // value method padsDAC_sclkgate
  assign padsDAC_sclkgate = spiDAC_cGate ;
  // submodule fcCdc_testRst
  SyncResetA #(.RSTDELAY(32'd1)) fcCdc_testRst(.CLK(CLK_flp_clk),
					       .IN_RST(wciS0_MReset_n),
					       .OUT_RST(fcCdc_testRst_OUT_RST));
  // submodule spiCDC_cd
  ClockDiv #(.width(32'd3),
	     .lower(32'd0),
	     .upper(32'd7),
	     .offset(32'd0)) spiCDC_cd(.CLK_IN(wciS0_Clk),
				       .RST(wciS0_MReset_n),
				       .PREEDGE(spiCDC_cd_PREEDGE),
				       .CLK_OUT(spiCDC_cd_CLK_OUT));
  // submodule spiCDC_cinv
  ClockInverter spiCDC_cinv(.CLK_IN(spiCDC_cd_CLK_OUT),
			    .PREEDGE(),
			    .CLK_OUT(spiCDC_cinv_CLK_OUT));
  // submodule spiCDC_reqF_dCombinedReset
  ResetEither spiCDC_reqF_dCombinedReset(.A_RST(spiCDC_slowReset_OUT_RST),
					 .B_RST(spiCDC_reqF_dCrossedsReset_OUT_RST),
					 .RST_OUT(spiCDC_reqF_dCombinedReset_RST_OUT));
  // submodule spiCDC_reqF_dCrossedsReset
  SyncReset0 spiCDC_reqF_dCrossedsReset(.IN_RST(wciS0_MReset_n),
					.OUT_RST(spiCDC_reqF_dCrossedsReset_OUT_RST));
  // submodule spiCDC_reqF_dInReset
  ResetToBool spiCDC_reqF_dInReset(.RST(spiCDC_reqF_dCombinedReset_RST_OUT),
				   .VAL(spiCDC_reqF_dInReset_VAL));
  // submodule spiCDC_reqF_sCombinedReset
  ResetEither spiCDC_reqF_sCombinedReset(.A_RST(wciS0_MReset_n),
					 .B_RST(spiCDC_reqF_sCrosseddReset_OUT_RST),
					 .RST_OUT(spiCDC_reqF_sCombinedReset_RST_OUT));
  // submodule spiCDC_reqF_sCrosseddReset
  SyncReset0 spiCDC_reqF_sCrosseddReset(.IN_RST(spiCDC_slowReset_OUT_RST),
					.OUT_RST(spiCDC_reqF_sCrosseddReset_OUT_RST));
  // submodule spiCDC_reqF_sInReset
  ResetToBool spiCDC_reqF_sInReset(.RST(spiCDC_reqF_sCombinedReset_RST_OUT),
				   .VAL(spiCDC_reqF_sInReset_VAL));
  // submodule spiCDC_respF_dCombinedReset
  ResetEither spiCDC_respF_dCombinedReset(.A_RST(wciS0_MReset_n),
					  .B_RST(spiCDC_respF_dCrossedsReset_OUT_RST),
					  .RST_OUT(spiCDC_respF_dCombinedReset_RST_OUT));
  // submodule spiCDC_respF_dCrossedsReset
  SyncReset0 spiCDC_respF_dCrossedsReset(.IN_RST(spiCDC_slowReset_OUT_RST),
					 .OUT_RST(spiCDC_respF_dCrossedsReset_OUT_RST));
  // submodule spiCDC_respF_dInReset
  ResetToBool spiCDC_respF_dInReset(.RST(spiCDC_respF_dCombinedReset_RST_OUT),
				    .VAL(spiCDC_respF_dInReset_VAL));
  // submodule spiCDC_respF_sCombinedReset
  ResetEither spiCDC_respF_sCombinedReset(.A_RST(spiCDC_slowReset_OUT_RST),
					  .B_RST(spiCDC_respF_sCrosseddReset_OUT_RST),
					  .RST_OUT(spiCDC_respF_sCombinedReset_RST_OUT));
  // submodule spiCDC_respF_sCrosseddReset
  SyncReset0 spiCDC_respF_sCrosseddReset(.IN_RST(wciS0_MReset_n),
					 .OUT_RST(spiCDC_respF_sCrosseddReset_OUT_RST));
  // submodule spiCDC_respF_sInReset
  ResetToBool spiCDC_respF_sInReset(.RST(spiCDC_respF_sCombinedReset_RST_OUT),
				    .VAL(spiCDC_respF_sInReset_VAL));
  // submodule spiCDC_slowReset
  SyncResetA #(.RSTDELAY(32'd1)) spiCDC_slowReset(.CLK(spiCDC_cd_CLK_OUT),
						  .IN_RST(wciS0_MReset_n),
						  .OUT_RST(spiCDC_slowReset_OUT_RST));
  // submodule spiDAC_cd
  ClockDiv #(.width(32'd4),
	     .lower(32'd0),
	     .upper(32'd15),
	     .offset(32'd0)) spiDAC_cd(.CLK_IN(wciS0_Clk),
				       .RST(wciS0_MReset_n),
				       .PREEDGE(spiDAC_cd_PREEDGE),
				       .CLK_OUT(spiDAC_cd_CLK_OUT));
  // submodule spiDAC_cinv
  ClockInverter spiDAC_cinv(.CLK_IN(spiDAC_cd_CLK_OUT),
			    .PREEDGE(),
			    .CLK_OUT(spiDAC_cinv_CLK_OUT));
  // submodule spiDAC_reqF_dCombinedReset
  ResetEither spiDAC_reqF_dCombinedReset(.A_RST(spiDAC_slowReset_OUT_RST),
					 .B_RST(spiDAC_reqF_dCrossedsReset_OUT_RST),
					 .RST_OUT(spiDAC_reqF_dCombinedReset_RST_OUT));
  // submodule spiDAC_reqF_dCrossedsReset
  SyncReset0 spiDAC_reqF_dCrossedsReset(.IN_RST(wciS0_MReset_n),
					.OUT_RST(spiDAC_reqF_dCrossedsReset_OUT_RST));
  // submodule spiDAC_reqF_dInReset
  ResetToBool spiDAC_reqF_dInReset(.RST(spiDAC_reqF_dCombinedReset_RST_OUT),
				   .VAL(spiDAC_reqF_dInReset_VAL));
  // submodule spiDAC_reqF_sCombinedReset
  ResetEither spiDAC_reqF_sCombinedReset(.A_RST(wciS0_MReset_n),
					 .B_RST(spiDAC_reqF_sCrosseddReset_OUT_RST),
					 .RST_OUT(spiDAC_reqF_sCombinedReset_RST_OUT));
  // submodule spiDAC_reqF_sCrosseddReset
  SyncReset0 spiDAC_reqF_sCrosseddReset(.IN_RST(spiDAC_slowReset_OUT_RST),
					.OUT_RST(spiDAC_reqF_sCrosseddReset_OUT_RST));
  // submodule spiDAC_reqF_sInReset
  ResetToBool spiDAC_reqF_sInReset(.RST(spiDAC_reqF_sCombinedReset_RST_OUT),
				   .VAL(spiDAC_reqF_sInReset_VAL));
  // submodule spiDAC_respF_dCombinedReset
  ResetEither spiDAC_respF_dCombinedReset(.A_RST(wciS0_MReset_n),
					  .B_RST(spiDAC_respF_dCrossedsReset_OUT_RST),
					  .RST_OUT(spiDAC_respF_dCombinedReset_RST_OUT));
  // submodule spiDAC_respF_dCrossedsReset
  SyncReset0 spiDAC_respF_dCrossedsReset(.IN_RST(spiDAC_slowReset_OUT_RST),
					 .OUT_RST(spiDAC_respF_dCrossedsReset_OUT_RST));
  // submodule spiDAC_respF_dInReset
  ResetToBool spiDAC_respF_dInReset(.RST(spiDAC_respF_dCombinedReset_RST_OUT),
				    .VAL(spiDAC_respF_dInReset_VAL));
  // submodule spiDAC_respF_sCombinedReset
  ResetEither spiDAC_respF_sCombinedReset(.A_RST(spiDAC_slowReset_OUT_RST),
					  .B_RST(spiDAC_respF_sCrosseddReset_OUT_RST),
					  .RST_OUT(spiDAC_respF_sCombinedReset_RST_OUT));
  // submodule spiDAC_respF_sCrosseddReset
  SyncReset0 spiDAC_respF_sCrosseddReset(.IN_RST(wciS0_MReset_n),
					 .OUT_RST(spiDAC_respF_sCrosseddReset_OUT_RST));
  // submodule spiDAC_respF_sInReset
  ResetToBool spiDAC_respF_sInReset(.RST(spiDAC_respF_sCombinedReset_RST_OUT),
				    .VAL(spiDAC_respF_sInReset_VAL));
  // submodule spiDAC_slowReset
  SyncResetA #(.RSTDELAY(32'd1)) spiDAC_slowReset(.CLK(spiDAC_cd_CLK_OUT),
						  .IN_RST(wciS0_MReset_n),
						  .OUT_RST(spiDAC_slowReset_OUT_RST));
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
  // rule RL_spi32_response
  assign CAN_FIRE_RL_spi32_response =
	     wci_wslv_respF_cntr_r != 2'd2 &&
	     spiCDC_respF_head_wrapped != spiCDC_respF_tail_wrapped &&
	     !spiCDC_respF_dInReset_VAL &&
	     spiCDC_cd_PREEDGE ;
  // rule RL_spi5_response
  assign CAN_FIRE_RL_spi5_response =
	     wci_wslv_respF_cntr_r != 2'd2 &&
	     spiDAC_respF_head_wrapped != spiDAC_respF_tail_wrapped &&
	     !spiDAC_respF_dInReset_VAL &&
	     spiDAC_cd_PREEDGE ;
  // rule RL_wci_cfwr
  assign WILL_FIRE_RL_wci_cfwr =
	     wci_wslv_respF_cntr_r != 2'd2 && wci_wslv_reqF_EMPTY_N &&
	     IF_wci_wslv_reqF_i_notEmpty__2_AND_wci_wslv_re_ETC___d590 &&
	     wci_wslv_wci_cfwr_pw_whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_cfrd
  assign CAN_FIRE_RL_wci_cfrd =
	     wci_wslv_reqF_EMPTY_N &&
	     IF_wci_wslv_reqF_i_notEmpty__2_AND_wci_wslv_re_ETC___d590 &&
	     (wci_wslv_reqF_D_OUT[43:42] == 2'b0 ||
	      wci_wslv_reqF_D_OUT[43:42] == 2'b01 ||
	      wci_wslv_respF_cntr_r != 2'd2) &&
	     wci_wslv_wci_cfrd_pw_whas ;
  assign WILL_FIRE_RL_wci_cfrd =
	     CAN_FIRE_RL_wci_cfrd && !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
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
  // rule RL_wci_ctrl_IsO
  assign WILL_FIRE_RL_wci_ctrl_IsO =
	     wci_wslv_wci_ctrl_pw_whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd1 &&
	     wci_wslv_reqF_D_OUT[36:34] == 3'd1 ;
  // rule RL_wci_ctrl_OrE
  assign WILL_FIRE_RL_wci_ctrl_OrE =
	     wci_wslv_wci_ctrl_pw_whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd2 &&
	     wci_wslv_reqF_D_OUT[36:34] == 3'd3 ;
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
  // rule RL_spiCDC_start_cs
  assign WILL_FIRE_RL_spiCDC_start_cs =
	     spiCDC_reqF_head_wrapped != spiCDC_reqF_tail_wrapped &&
	     !spiCDC_reqF_dInReset_VAL &&
	     !spiCDC_xmt_d &&
	     !spiCDC_rcv_d &&
	     !spiCDC_doResp ;
  // rule RL_spiCDC_send_d
  assign WILL_FIRE_RL_spiCDC_send_d =
	     spiCDC_reqF_head_wrapped != spiCDC_reqF_tail_wrapped &&
	     !spiCDC_reqF_dInReset_VAL &&
	     spiCDC_xmt_d &&
	     !spiCDC_rcv_d &&
	     !spiCDC_doResp ;
  // rule RL_spiCDC_recv_d
  assign WILL_FIRE_RL_spiCDC_recv_d =
	     !spiCDC_xmt_d && spiCDC_rcv_d && !spiCDC_doResp ;
  // rule RL_spiCDC_rd_resp
  assign WILL_FIRE_RL_spiCDC_rd_resp =
	     spiCDC_respF_head_wrapped == spiCDC_respF_tail_wrapped &&
	     !spiCDC_respF_sInReset_VAL &&
	     !spiCDC_xmt_d &&
	     !spiCDC_rcv_d &&
	     spiCDC_doResp ;
  // rule RL_spiCDC_reqF_enq_update_tail
  assign WILL_FIRE_RL_spiCDC_reqF_enq_update_tail =
	     !spiCDC_reqF_sInReset_VAL && spiCDC_reqF_enq_pw_whas ;
  // rule RL_spiCDC_reqF_deq_update_head
  assign WILL_FIRE_RL_spiCDC_reqF_deq_update_head =
	     !spiCDC_reqF_dInReset_VAL && MUX_spiCDC_rcv_d_write_1__SEL_2 ;
  // rule RL_spiCDC_respF_enq_update_tail
  assign WILL_FIRE_RL_spiCDC_respF_enq_update_tail =
	     !spiCDC_respF_sInReset_VAL && WILL_FIRE_RL_spiCDC_rd_resp ;
  // rule RL_spiCDC_respF_deq_update_head
  assign WILL_FIRE_RL_spiCDC_respF_deq_update_head =
	     !spiCDC_respF_dInReset_VAL &&
	     MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 ;
  // rule RL_spiDAC_start_cs
  assign WILL_FIRE_RL_spiDAC_start_cs =
	     !spiDAC_xmt_i && !spiDAC_xcv_d && !spiDAC_doResp && spiDAC_csbR ;
  // rule RL_spiDAC_send_i
  assign WILL_FIRE_RL_spiDAC_send_i =
	     IF_spiDAC_iPos_45_EQ_7_46_THEN_NOT_spiDAC_reqF_ETC___d365 &&
	     spiDAC_xmt_i &&
	     !spiDAC_xcv_d &&
	     !spiDAC_doResp ;
  // rule RL_spiDAC_doxcv_d
  assign WILL_FIRE_RL_spiDAC_doxcv_d =
	     spiDAC_reqF_head_wrapped != spiDAC_reqF_tail_wrapped &&
	     !spiDAC_reqF_dInReset_VAL &&
	     !spiDAC_xmt_i &&
	     spiDAC_xcv_d &&
	     !spiDAC_doResp ;
  // rule RL_spiDAC_reqF_enq_update_tail
  assign WILL_FIRE_RL_spiDAC_reqF_enq_update_tail =
	     !spiDAC_reqF_sInReset_VAL && spiDAC_reqF_enq_pw_whas ;
  // rule RL_spiDAC_reqF_deq_update_head
  assign WILL_FIRE_RL_spiDAC_reqF_deq_update_head =
	     !spiDAC_reqF_dInReset_VAL && MUX_spiDAC_doResp_1_wset_1__SEL_1 ;
  // rule RL_spiDAC_respF_enq_update_tail
  assign WILL_FIRE_RL_spiDAC_respF_enq_update_tail =
	     !spiDAC_respF_sInReset_VAL && MUX_spiDAC_doResp_1_wset_1__SEL_2 ;
  // rule RL_spiDAC_respF_deq_update_head
  assign WILL_FIRE_RL_spiDAC_respF_deq_update_head =
	     !spiDAC_respF_dInReset_VAL &&
	     MUX_wci_wslv_respF_x_wire_wset_1__SEL_4 ;
  // inputs to muxes for submodule ports
  assign MUX_spiCDC_doResp_1_wset_1__SEL_1 =
	     WILL_FIRE_RL_spiCDC_recv_d && spiCDC_rPos == 6'd0 ;
  assign MUX_spiCDC_rcv_d_write_1__SEL_2 =
	     WILL_FIRE_RL_spiCDC_send_d && spiCDC_dPos == 5'd0 ;
  assign MUX_spiCDC_reqS_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF_D_OUT[43:42] == 2'b0 ;
  assign MUX_spiDAC_doResp_1_wset_1__SEL_1 =
	     WILL_FIRE_RL_spiDAC_doxcv_d && spiDAC_dPos == 3'd0 ;
  assign MUX_spiDAC_doResp_1_wset_1__SEL_2 =
	     spiDAC_respF_head_wrapped == spiDAC_respF_tail_wrapped &&
	     !spiDAC_respF_sInReset_VAL &&
	     spiDAC_doResp ;
  assign MUX_spiDAC_reqS_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF_D_OUT[43:42] == 2'b01 ;
  assign MUX_splitReadInFlight_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfrd &&
	     (wci_wslv_reqF_D_OUT[43:42] == 2'b0 ||
	      wci_wslv_reqF_D_OUT[43:42] == 2'b01) ;
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
  assign MUX_wci_wslv_respF_x_wire_wset_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[43:42] != 2'b0 &&
	     wci_wslv_reqF_D_OUT[43:42] != 2'b01 ;
  assign MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 =
	     CAN_FIRE_RL_spi32_response &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  assign MUX_wci_wslv_respF_x_wire_wset_1__SEL_4 =
	     CAN_FIRE_RL_spi5_response &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  assign MUX_fcCdc_grayCounter_rsCounter_write_1__VAL_1 =
	     (~fcCdc_grayCounter_rsCounter[IF_fcCdc_grayCounter_rsCounter_13_BIT_0_20_XOR_ETC___d490[4:0]]) ?
	       fcCdc_grayCounter_rsCounter | x__h36639 :
	       fcCdc_grayCounter_rsCounter & y__h38044 ;
  assign MUX_oneKHz_value_write_1__VAL_1 =
	     (oneKHz_value == 18'd124999) ? 18'd0 : oneKHz_value + 18'd1 ;
  assign MUX_spiCDC_dPos_write_1__VAL_1 =
	     (spiCDC_dPos == 5'd0) ? spiCDC_dPos : spiCDC_dPos - 5'd1 ;
  assign MUX_spiCDC_rPos_write_1__VAL_1 = spiCDC_reqS[32] ? 6'd32 : 6'd0 ;
  assign MUX_spiCDC_rPos_write_1__VAL_2 =
	     (spiCDC_rPos == 6'd0) ? spiCDC_rPos : spiCDC_rPos - 6'd1 ;
  assign MUX_spiCDC_reqS_write_1__VAL_1 =
	     { 1'd0, wci_wslv_reqF_D_OUT[37:34], wci_wslv_reqF_D_OUT[27:0] } ;
  assign MUX_spiCDC_reqS_write_1__VAL_2 =
	     { 1'd1, wci_wslv_reqF_D_OUT[37:34], 28'd0 } ;
  assign MUX_spiDAC_dPos_write_1__VAL_1 =
	     (spiDAC_dPos == 3'd0) ? spiDAC_dPos : spiDAC_dPos - 3'd1 ;
  assign MUX_spiDAC_iPos_write_1__VAL_1 =
	     (spiDAC_iPos == 3'd0) ? spiDAC_iPos : spiDAC_iPos - 3'd1 ;
  assign MUX_spiDAC_reqS_write_1__VAL_1 =
	     { 1'd0, wci_wslv_reqF_D_OUT[38:34], wci_wslv_reqF_D_OUT[7:0] } ;
  assign MUX_spiDAC_reqS_write_1__VAL_2 =
	     { 1'd1, wci_wslv_reqF_D_OUT[38:34], 8'd0 } ;
  assign MUX_spiDAC_sdoR_write_1__VAL_1 =
	     (spiDAC_iPos == 3'd7) ?
	       spiDAC_reqS[13] :
	       spiDAC_iPos != 3'd6 && spiDAC_iPos != 3'd5 &&
	       CASE_spiDAC_iPos_1_spiDAC_reqS_BIT_9_2_spiDAC__ETC__q2 ;
  assign MUX_spiDAC_sdoR_write_1__VAL_2 =
	     spiDAC_reqS_BITS_7_TO_0__q3[spiDAC_dPos] ;
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
  always@(MUX_wci_wslv_respF_x_wire_wset_1__SEL_1 or
	  MUX_wci_wslv_respF_x_wire_wset_1__VAL_1 or
	  WILL_FIRE_RL_wci_wslv_ctl_op_complete or
	  MUX_wci_wslv_respF_x_wire_wset_1__VAL_2 or
	  MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 or
	  MUX_wci_wslv_respF_x_wire_wset_1__VAL_3 or
	  MUX_wci_wslv_respF_x_wire_wset_1__SEL_4 or
	  MUX_wci_wslv_respF_x_wire_wset_1__VAL_4 or WILL_FIRE_RL_wci_cfwr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_wslv_respF_x_wire_wset_1__SEL_1:
	  MUX_wci_wslv_respF_q_0_write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire_wset_1__VAL_1;
      WILL_FIRE_RL_wci_wslv_ctl_op_complete:
	  MUX_wci_wslv_respF_q_0_write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire_wset_1__VAL_2;
      MUX_wci_wslv_respF_x_wire_wset_1__SEL_3:
	  MUX_wci_wslv_respF_q_0_write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire_wset_1__VAL_3;
      MUX_wci_wslv_respF_x_wire_wset_1__SEL_4:
	  MUX_wci_wslv_respF_q_0_write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire_wset_1__VAL_4;
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
  assign MUX_wci_wslv_respF_x_wire_wset_1__VAL_1 = { 2'd1, rdat__h43022 } ;
  assign MUX_wci_wslv_respF_x_wire_wset_1__VAL_2 =
	     wci_wslv_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wci_wslv_respF_x_wire_wset_1__VAL_3 = { 6'd16, spiCDC_respS } ;
  assign MUX_wci_wslv_respF_x_wire_wset_1__VAL_4 =
	     { 26'd16777216, spiDAC_respS } ;
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
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[43:42] != 2'b0 &&
	     wci_wslv_reqF_D_OUT[43:42] != 2'b01 ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete ||
	     MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 ||
	     MUX_wci_wslv_respF_x_wire_wset_1__SEL_4 ||
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
  assign spiCDC_cGate_1_wget =
	     !WILL_FIRE_RL_spiCDC_recv_d || spiCDC_rPos != 6'd32 ;
  assign spiCDC_cGate_1_whas =
	     WILL_FIRE_RL_spiCDC_recv_d || WILL_FIRE_RL_spiCDC_send_d ;
  assign spiCDC_csbR_1_wget =
	     WILL_FIRE_RL_spiCDC_recv_d && spiCDC_rPos == 6'd32 ;
  assign spiCDC_csbR_1_whas = spiCDC_cGate_1_whas ;
  assign spiCDC_doResp_1_wget = MUX_spiCDC_doResp_1_wset_1__SEL_1 ;
  assign spiCDC_doResp_1_whas =
	     WILL_FIRE_RL_spiCDC_recv_d && spiCDC_rPos == 6'd0 ||
	     WILL_FIRE_RL_spiCDC_rd_resp ;
  assign spiDAC_cGate_1_wget = 1'd1 ;
  assign spiDAC_cGate_1_whas =
	     WILL_FIRE_RL_spiDAC_send_i || WILL_FIRE_RL_spiDAC_doxcv_d ;
  assign spiDAC_csbR_1_wget = 1'b0 ;
  assign spiDAC_csbR_1_whas = spiDAC_cGate_1_whas ;
  assign spiDAC_doResp_1_wget =
	     MUX_spiDAC_doResp_1_wset_1__SEL_1 && spiDAC_reqS[13] ;
  assign spiDAC_doResp_1_whas =
	     WILL_FIRE_RL_spiDAC_doxcv_d && spiDAC_dPos == 3'd0 ||
	     spiDAC_respF_head_wrapped == spiDAC_respF_tail_wrapped &&
	     !spiDAC_respF_sInReset_VAL &&
	     spiDAC_doResp ;
  assign fcCdc_pulseAction_1_wget = 1'd1 ;
  assign fcCdc_pulseAction_1_whas = oneKHz_value == 18'd124999 ;
  assign wci_wslv_reqF_r_enq_whas = wci_wslv_wciReq_wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF_r_deq_whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_reqF_r_clr_whas = 1'b0 ;
  assign wci_wslv_respF_enqueueing_whas =
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[43:42] != 2'b0 &&
	     wci_wslv_reqF_D_OUT[43:42] != 2'b01 ||
	     MUX_wci_wslv_respF_x_wire_wset_1__SEL_4 ||
	     MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 ||
	     WILL_FIRE_RL_wci_cfwr ||
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
  assign spiCDC_reqF_enq_pw_whas =
	     _dor1spiCDC_reqF_enq_pw_EN_wset &&
	     wci_wslv_reqF_D_OUT[43:42] == 2'b0 ;
  assign spiCDC_reqF_deq_pw_whas = MUX_spiCDC_rcv_d_write_1__SEL_2 ;
  assign spiCDC_reqF_sClear_pw_whas = 1'b0 ;
  assign spiCDC_reqF_dClear_pw_whas = 1'b0 ;
  assign spiCDC_reqF_deq_happened_whas = 1'b0 ;
  assign spiCDC_respF_enq_pw_whas = WILL_FIRE_RL_spiCDC_rd_resp ;
  assign spiCDC_respF_deq_pw_whas = MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 ;
  assign spiCDC_respF_sClear_pw_whas = 1'b0 ;
  assign spiCDC_respF_dClear_pw_whas = 1'b0 ;
  assign spiCDC_respF_deq_happened_whas = 1'b0 ;
  assign spiDAC_reqF_enq_pw_whas =
	     _dor1spiDAC_reqF_enq_pw_EN_wset &&
	     wci_wslv_reqF_D_OUT[43:42] == 2'b01 ;
  assign spiDAC_reqF_deq_pw_whas = MUX_spiDAC_doResp_1_wset_1__SEL_1 ;
  assign spiDAC_reqF_sClear_pw_whas = 1'b0 ;
  assign spiDAC_reqF_dClear_pw_whas = 1'b0 ;
  assign spiDAC_reqF_deq_happened_whas = 1'b0 ;
  assign spiDAC_respF_enq_pw_whas = MUX_spiDAC_doResp_1_wset_1__SEL_2 ;
  assign spiDAC_respF_deq_pw_whas = MUX_wci_wslv_respF_x_wire_wset_1__SEL_4 ;
  assign spiDAC_respF_sClear_pw_whas = 1'b0 ;
  assign spiDAC_respF_dClear_pw_whas = 1'b0 ;
  assign spiDAC_respF_deq_happened_whas = 1'b0 ;
  assign fcCdc_grayCounter_pwIncrement_whas = 1'd1 ;
  assign fcCdc_grayCounter_pwDecrement_whas = 1'b0 ;
  assign oneKHz_incAction_whas = 1'd1 ;
  assign oneKHz_decAction_whas = 1'b0 ;
  assign spiCDC_sdiWs_wget = spiCDC_sdiP ;
  assign spiDAC_sdiWs_wget = spiDAC_sdiP ;
  assign fcCdc_grayCounter_wdCounterCrossing_wget =
	     fcCdc_grayCounter_rsCounter ;
  // register fcCdc_countNow
  assign fcCdc_countNow_D_IN =
	     { fcCdc_grayCounter_rdCounter[17],
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d514,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d517,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d519,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d522,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d524,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d527,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d529,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d532,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d534,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d537,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d539,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d542,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d544,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d547,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d549,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d552,
	       fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d552 ^
	       fcCdc_grayCounter_rdCounter[0] } ;
  assign fcCdc_countNow_EN = fcCdc_pulseAction ;
  // register fcCdc_countPast
  assign fcCdc_countPast_D_IN = fcCdc_countNow ;
  assign fcCdc_countPast_EN = fcCdc_pulseAction ;
  // register fcCdc_frequency
  assign fcCdc_frequency_D_IN = fcCdc_countNow - fcCdc_countPast ;
  assign fcCdc_frequency_EN = fcCdc_pulseAction ;
  // register fcCdc_grayCounter_rdCounter
  assign fcCdc_grayCounter_rdCounter_D_IN = fcCdc_grayCounter_rdCounterPre ;
  assign fcCdc_grayCounter_rdCounter_EN = 1'd1 ;
  // register fcCdc_grayCounter_rdCounterPre
  assign fcCdc_grayCounter_rdCounterPre_D_IN = fcCdc_grayCounter_rsCounter ;
  assign fcCdc_grayCounter_rdCounterPre_EN = 1'd1 ;
  // register fcCdc_grayCounter_rsCounter
  assign fcCdc_grayCounter_rsCounter_D_IN =
	     MUX_fcCdc_grayCounter_rsCounter_write_1__VAL_1 ;
  assign fcCdc_grayCounter_rsCounter_EN = 1'b1 ;
  // register fcCdc_pulseAction
  assign fcCdc_pulseAction_D_IN = oneKHz_value == 18'd124999 ;
  assign fcCdc_pulseAction_EN = 1'd1 ;
  // register fcCdc_sampleCount
  assign fcCdc_sampleCount_D_IN = fcCdc_sampleCount + 16'd1 ;
  assign fcCdc_sampleCount_EN = fcCdc_pulseAction ;
  // register oneKHz_value
  assign oneKHz_value_D_IN = MUX_oneKHz_value_write_1__VAL_1 ;
  assign oneKHz_value_EN = 1'b1 ;
  // register spiCDC_cGate
  assign spiCDC_cGate_D_IN = spiCDC_cGate_1_whas && spiCDC_cGate_1_wget ;
  assign spiCDC_cGate_EN = 1'd1 ;
  // register spiCDC_capV
  assign spiCDC_capV_D_IN = { spiCDC_sdiP, spiCDC_capV[27:1] } ;
  assign spiCDC_capV_EN = WILL_FIRE_RL_spiCDC_recv_d ;
  // register spiCDC_csbR
  assign spiCDC_csbR_D_IN = !spiCDC_cGate_1_whas || spiCDC_csbR_1_wget ;
  assign spiCDC_csbR_EN = 1'd1 ;
  // register spiCDC_dPos
  assign spiCDC_dPos_D_IN =
	     WILL_FIRE_RL_spiCDC_send_d ?
	       MUX_spiCDC_dPos_write_1__VAL_1 :
	       5'd31 ;
  assign spiCDC_dPos_EN =
	     WILL_FIRE_RL_spiCDC_send_d || WILL_FIRE_RL_spiCDC_start_cs ;
  // register spiCDC_doResp
  assign spiCDC_doResp_D_IN =
	     spiCDC_doResp_1_whas && MUX_spiCDC_doResp_1_wset_1__SEL_1 ;
  assign spiCDC_doResp_EN = 1'd1 ;
  // register spiCDC_rPos
  assign spiCDC_rPos_D_IN =
	     WILL_FIRE_RL_spiCDC_start_cs ?
	       MUX_spiCDC_rPos_write_1__VAL_1 :
	       MUX_spiCDC_rPos_write_1__VAL_2 ;
  assign spiCDC_rPos_EN =
	     WILL_FIRE_RL_spiCDC_start_cs || WILL_FIRE_RL_spiCDC_recv_d ;
  // register spiCDC_rcv_d
  assign spiCDC_rcv_d_D_IN =
	     !MUX_spiCDC_doResp_1_wset_1__SEL_1 && spiCDC_reqS[32] ;
  assign spiCDC_rcv_d_EN =
	     WILL_FIRE_RL_spiCDC_recv_d && spiCDC_rPos == 6'd0 ||
	     WILL_FIRE_RL_spiCDC_send_d && spiCDC_dPos == 5'd0 ;
  // register spiCDC_reqF_head_wrapped
  assign spiCDC_reqF_head_wrapped_D_IN =
	     WILL_FIRE_RL_spiCDC_reqF_deq_update_head &&
	     !spiCDC_reqF_head_wrapped ;
  assign spiCDC_reqF_head_wrapped_EN =
	     WILL_FIRE_RL_spiCDC_reqF_deq_update_head ||
	     spiCDC_reqF_dInReset_VAL ;
  // register spiCDC_reqF_tail_wrapped
  assign spiCDC_reqF_tail_wrapped_D_IN =
	     WILL_FIRE_RL_spiCDC_reqF_enq_update_tail &&
	     !spiCDC_reqF_tail_wrapped ;
  assign spiCDC_reqF_tail_wrapped_EN =
	     WILL_FIRE_RL_spiCDC_reqF_enq_update_tail ||
	     spiCDC_reqF_sInReset_VAL ;
  // register spiCDC_reqS
  assign spiCDC_reqS_D_IN =
	     MUX_spiCDC_reqS_write_1__SEL_1 ?
	       MUX_spiCDC_reqS_write_1__VAL_1 :
	       MUX_spiCDC_reqS_write_1__VAL_2 ;
  assign spiCDC_reqS_EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF_D_OUT[43:42] == 2'b0 ||
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[43:42] == 2'b0 ;
  // register spiCDC_respF_head_wrapped
  assign spiCDC_respF_head_wrapped_D_IN =
	     WILL_FIRE_RL_spiCDC_respF_deq_update_head &&
	     !spiCDC_respF_head_wrapped ;
  assign spiCDC_respF_head_wrapped_EN =
	     WILL_FIRE_RL_spiCDC_respF_deq_update_head ||
	     spiCDC_respF_dInReset_VAL ;
  // register spiCDC_respF_tail_wrapped
  assign spiCDC_respF_tail_wrapped_D_IN =
	     WILL_FIRE_RL_spiCDC_respF_enq_update_tail &&
	     !spiCDC_respF_tail_wrapped ;
  assign spiCDC_respF_tail_wrapped_EN =
	     WILL_FIRE_RL_spiCDC_respF_enq_update_tail ||
	     spiCDC_respF_sInReset_VAL ;
  // register spiCDC_respS
  assign spiCDC_respS_D_IN = { spiCDC_sdiP, spiCDC_capV[27:1] } ;
  assign spiCDC_respS_EN = WILL_FIRE_RL_spiCDC_rd_resp ;
  // register spiCDC_sdiP
  assign spiCDC_sdiP_D_IN = padsCDC_sdi_arg ;
  assign spiCDC_sdiP_EN = 1'd1 ;
  // register spiCDC_sdoR
  assign spiCDC_sdoR_D_IN =
	     spiCDC_reqS[32] ?
	       _31_MINUS_spiCDC_dPos_29___d230 == 5'd1 ||
	       _31_MINUS_spiCDC_dPos_29___d230 == 5'd2 ||
	       _31_MINUS_spiCDC_dPos_29___d230 == 5'd3 ||
	       CASE_31_MINUS_spiCDC_dPos_29_30_4_spiCDC_reqS__ETC__q4 :
	       CASE_31_MINUS_spiCDC_dPos_29_30_0_spiCDC_reqS__ETC__q5 ;
  assign spiCDC_sdoR_EN = WILL_FIRE_RL_spiCDC_send_d ;
  // register spiCDC_xmt_d
  assign spiCDC_xmt_d_D_IN = !MUX_spiCDC_rcv_d_write_1__SEL_2 ;
  assign spiCDC_xmt_d_EN =
	     WILL_FIRE_RL_spiCDC_send_d && spiCDC_dPos == 5'd0 ||
	     WILL_FIRE_RL_spiCDC_start_cs ;
  // register spiDAC_cGate
  assign spiDAC_cGate_D_IN = spiDAC_cGate_1_whas ;
  assign spiDAC_cGate_EN = 1'd1 ;
  // register spiDAC_capV
  assign spiDAC_capV_D_IN = { spiDAC_capV[6:0], spiDAC_sdiP } ;
  assign spiDAC_capV_EN = WILL_FIRE_RL_spiDAC_doxcv_d ;
  // register spiDAC_csbR
  assign spiDAC_csbR_D_IN = !spiDAC_cGate_1_whas ;
  assign spiDAC_csbR_EN = 1'd1 ;
  // register spiDAC_dPos
  assign spiDAC_dPos_D_IN =
	     WILL_FIRE_RL_spiDAC_doxcv_d ?
	       MUX_spiDAC_dPos_write_1__VAL_1 :
	       3'd7 ;
  assign spiDAC_dPos_EN =
	     WILL_FIRE_RL_spiDAC_doxcv_d || WILL_FIRE_RL_spiDAC_start_cs ;
  // register spiDAC_doResp
  assign spiDAC_doResp_D_IN = spiDAC_doResp_1_whas && spiDAC_doResp_1_wget ;
  assign spiDAC_doResp_EN = 1'd1 ;
  // register spiDAC_iPos
  assign spiDAC_iPos_D_IN =
	     WILL_FIRE_RL_spiDAC_send_i ?
	       MUX_spiDAC_iPos_write_1__VAL_1 :
	       3'd7 ;
  assign spiDAC_iPos_EN =
	     WILL_FIRE_RL_spiDAC_send_i || WILL_FIRE_RL_spiDAC_start_cs ;
  // register spiDAC_reqF_head_wrapped
  assign spiDAC_reqF_head_wrapped_D_IN =
	     WILL_FIRE_RL_spiDAC_reqF_deq_update_head &&
	     !spiDAC_reqF_head_wrapped ;
  assign spiDAC_reqF_head_wrapped_EN =
	     WILL_FIRE_RL_spiDAC_reqF_deq_update_head ||
	     spiDAC_reqF_dInReset_VAL ;
  // register spiDAC_reqF_tail_wrapped
  assign spiDAC_reqF_tail_wrapped_D_IN =
	     WILL_FIRE_RL_spiDAC_reqF_enq_update_tail &&
	     !spiDAC_reqF_tail_wrapped ;
  assign spiDAC_reqF_tail_wrapped_EN =
	     WILL_FIRE_RL_spiDAC_reqF_enq_update_tail ||
	     spiDAC_reqF_sInReset_VAL ;
  // register spiDAC_reqS
  assign spiDAC_reqS_D_IN =
	     MUX_spiDAC_reqS_write_1__SEL_1 ?
	       MUX_spiDAC_reqS_write_1__VAL_1 :
	       MUX_spiDAC_reqS_write_1__VAL_2 ;
  assign spiDAC_reqS_EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF_D_OUT[43:42] == 2'b01 ||
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[43:42] == 2'b01 ;
  // register spiDAC_respF_head_wrapped
  assign spiDAC_respF_head_wrapped_D_IN =
	     WILL_FIRE_RL_spiDAC_respF_deq_update_head &&
	     !spiDAC_respF_head_wrapped ;
  assign spiDAC_respF_head_wrapped_EN =
	     WILL_FIRE_RL_spiDAC_respF_deq_update_head ||
	     spiDAC_respF_dInReset_VAL ;
  // register spiDAC_respF_tail_wrapped
  assign spiDAC_respF_tail_wrapped_D_IN =
	     WILL_FIRE_RL_spiDAC_respF_enq_update_tail &&
	     !spiDAC_respF_tail_wrapped ;
  assign spiDAC_respF_tail_wrapped_EN =
	     WILL_FIRE_RL_spiDAC_respF_enq_update_tail ||
	     spiDAC_respF_sInReset_VAL ;
  // register spiDAC_respS
  assign spiDAC_respS_D_IN = { spiDAC_capV[6:0], spiDAC_sdiP } ;
  assign spiDAC_respS_EN = MUX_spiDAC_doResp_1_wset_1__SEL_2 ;
  // register spiDAC_sdiP
  assign spiDAC_sdiP_D_IN = padsDAC_sdi_arg ;
  assign spiDAC_sdiP_EN = 1'd1 ;
  // register spiDAC_sdoR
  assign spiDAC_sdoR_D_IN =
	     WILL_FIRE_RL_spiDAC_send_i ?
	       MUX_spiDAC_sdoR_write_1__VAL_1 :
	       MUX_spiDAC_sdoR_write_1__VAL_2 ;
  assign spiDAC_sdoR_EN = spiDAC_cGate_1_whas ;
  // register spiDAC_xcv_d
  assign spiDAC_xcv_d_D_IN =
	     !MUX_spiDAC_doResp_1_wset_1__SEL_1 && spiDAC_iPos == 3'd0 ;
  assign spiDAC_xcv_d_EN =
	     WILL_FIRE_RL_spiDAC_doxcv_d && spiDAC_dPos == 3'd0 ||
	     WILL_FIRE_RL_spiDAC_send_i ;
  // register spiDAC_xmt_i
  assign spiDAC_xmt_i_D_IN =
	     !WILL_FIRE_RL_spiDAC_send_i || spiDAC_iPos != 3'd0 ;
  assign spiDAC_xmt_i_EN =
	     WILL_FIRE_RL_spiDAC_send_i || WILL_FIRE_RL_spiDAC_start_cs ;
  // register splitReadInFlight
  assign splitReadInFlight_D_IN = MUX_splitReadInFlight_write_1__SEL_1 ;
  assign splitReadInFlight_EN =
	     WILL_FIRE_RL_wci_cfrd &&
	     (wci_wslv_reqF_D_OUT[43:42] == 2'b0 ||
	      wci_wslv_reqF_D_OUT[43:42] == 2'b01) ||
	     MUX_wci_wslv_respF_x_wire_wset_1__SEL_4 ||
	     MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 ;
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
  // submodule wci_wslv_reqF
  assign wci_wslv_reqF_D_IN = wci_wslv_wciReq_wget ;
  assign wci_wslv_reqF_ENQ = wci_wslv_wciReq_wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF_DEQ = wci_wslv_reqF_r_deq_whas ;
  assign wci_wslv_reqF_CLR = 1'b0 ;
  // remaining internal signals
  assign IF_fcCdc_grayCounter_rsCounter_13_BIT_0_20_OR__ETC___d489 =
	     (fcCdc_grayCounter_rsCounter[0] ||
	      fcCdc_grayCounter_rsCounter[1] ||
	      fcCdc_grayCounter_rsCounter[2] ||
	      fcCdc_grayCounter_rsCounter[3] ||
	      fcCdc_grayCounter_rsCounter[4] ||
	      fcCdc_grayCounter_rsCounter[5] ||
	      fcCdc_grayCounter_rsCounter[6] ||
	      fcCdc_grayCounter_rsCounter[7] ||
	      fcCdc_grayCounter_rsCounter[8] ||
	      fcCdc_grayCounter_rsCounter[9] ||
	      fcCdc_grayCounter_rsCounter[10] ||
	      fcCdc_grayCounter_rsCounter[11] ||
	      fcCdc_grayCounter_rsCounter[12] ||
	      fcCdc_grayCounter_rsCounter[13] ||
	      fcCdc_grayCounter_rsCounter[14] ||
	      fcCdc_grayCounter_rsCounter[15] ||
	      fcCdc_grayCounter_rsCounter[16]) ?
	       (fcCdc_grayCounter_rsCounter[0] ?
		  32'd1 :
		  (fcCdc_grayCounter_rsCounter[1] ?
		     32'd2 :
		     (fcCdc_grayCounter_rsCounter[2] ?
			32'd3 :
			(fcCdc_grayCounter_rsCounter[3] ?
			   32'd4 :
			   (fcCdc_grayCounter_rsCounter[4] ?
			      32'd5 :
			      (fcCdc_grayCounter_rsCounter[5] ?
				 32'd6 :
				 (fcCdc_grayCounter_rsCounter[6] ?
				    32'd7 :
				    (fcCdc_grayCounter_rsCounter[7] ?
				       32'd8 :
				       (fcCdc_grayCounter_rsCounter[8] ?
					  32'd9 :
					  (fcCdc_grayCounter_rsCounter[9] ?
					     32'd10 :
					     (fcCdc_grayCounter_rsCounter[10] ?
						32'd11 :
						(fcCdc_grayCounter_rsCounter[11] ?
						   32'd12 :
						   (fcCdc_grayCounter_rsCounter[12] ?
						      32'd13 :
						      (fcCdc_grayCounter_rsCounter[13] ?
							 32'd14 :
							 (fcCdc_grayCounter_rsCounter[14] ?
							    32'd15 :
							    (fcCdc_grayCounter_rsCounter[15] ?
							       32'd16 :
							       (fcCdc_grayCounter_rsCounter[16] ?
								  32'd17 :
								  (fcCdc_grayCounter_rsCounter[17] ?
								     32'd18 :
								     32'd19)))))))))))))))))) :
	       32'd17 ;
  assign IF_fcCdc_grayCounter_rsCounter_13_BIT_0_20_XOR_ETC___d490 =
	     fcCdc_grayCounter_rsCounter_13_BIT_0_20_XOR_fc_ETC___d454 ?
	       IF_fcCdc_grayCounter_rsCounter_13_BIT_0_20_OR__ETC___d489 :
	       32'd0 ;
  assign IF_spiDAC_iPos_45_EQ_7_46_THEN_NOT_spiDAC_reqF_ETC___d365 =
	     (spiDAC_iPos == 3'd7) ?
	       spiDAC_reqF_head_wrapped != spiDAC_reqF_tail_wrapped &&
	       !spiDAC_reqF_dInReset_VAL :
	       spiDAC_iPos == 3'd6 || spiDAC_iPos == 3'd5 ||
	       IF_spiDAC_iPos_45_EQ_4_52_OR_spiDAC_iPos_45_EQ_ETC___d362 ;
  assign IF_wci_wslv_reqF_i_notEmpty__2_AND_wci_wslv_re_ETC___d590 =
	     (wci_wslv_reqF_EMPTY_N && wci_wslv_reqF_D_OUT[43:42] == 2'b0) ?
	       spiCDC_reqF_head_wrapped == spiCDC_reqF_tail_wrapped &&
	       !spiCDC_reqF_sInReset_VAL &&
	       spiCDC_cd_PREEDGE :
	       !wci_wslv_reqF_EMPTY_N ||
	       wci_wslv_reqF_D_OUT[43:42] != 2'b01 ||
	       spiDAC_reqF_head_wrapped == spiDAC_reqF_tail_wrapped &&
	       !spiDAC_reqF_sInReset_VAL &&
	       spiDAC_cd_PREEDGE ;
  assign NOT_spiDAC_iPos_45_EQ_0_59_60_OR_NOT_spiDAC_re_ETC___d361 =
	     spiDAC_iPos != 3'd0 ||
	     spiDAC_reqF_head_wrapped != spiDAC_reqF_tail_wrapped &&
	     !spiDAC_reqF_dInReset_VAL ;
  assign _31_MINUS_spiCDC_dPos_29___d230 = 5'd31 - spiCDC_dPos ;
  assign _dfoo1 =
	     wci_wslv_respF_cntr_r != 2'd2 ||
	     wci_wslv_respF_cntr_r_8_MINUS_1___d27 == 2'd1 ;
  assign _dfoo3 =
	     wci_wslv_respF_cntr_r != 2'd1 ||
	     wci_wslv_respF_cntr_r_8_MINUS_1___d27 == 2'd0 ;
  assign _dor1spiCDC_reqF_enq_pw_EN_wset =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ;
  assign _dor1spiDAC_reqF_enq_pw_EN_wset =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d514 =
	     fcCdc_grayCounter_rdCounter[17] ^
	     fcCdc_grayCounter_rdCounter[16] ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d517 =
	     fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d514 ^
	     fcCdc_grayCounter_rdCounter[15] ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d519 =
	     fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d517 ^
	     fcCdc_grayCounter_rdCounter[14] ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d522 =
	     fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d519 ^
	     fcCdc_grayCounter_rdCounter[13] ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d524 =
	     fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d522 ^
	     fcCdc_grayCounter_rdCounter[12] ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d527 =
	     fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d524 ^
	     fcCdc_grayCounter_rdCounter[11] ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d529 =
	     fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d527 ^
	     fcCdc_grayCounter_rdCounter[10] ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d532 =
	     fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d529 ^
	     fcCdc_grayCounter_rdCounter[9] ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d534 =
	     fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d532 ^
	     fcCdc_grayCounter_rdCounter[8] ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d537 =
	     fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d534 ^
	     fcCdc_grayCounter_rdCounter[7] ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d539 =
	     fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d537 ^
	     fcCdc_grayCounter_rdCounter[6] ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d542 =
	     fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d539 ^
	     fcCdc_grayCounter_rdCounter[5] ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d544 =
	     fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d542 ^
	     fcCdc_grayCounter_rdCounter[4] ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d547 =
	     fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d544 ^
	     fcCdc_grayCounter_rdCounter[3] ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d549 =
	     fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d547 ^
	     fcCdc_grayCounter_rdCounter[2] ;
  assign fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d552 =
	     fcCdc_grayCounter_rdCounter_11_BIT_17_12_XOR_f_ETC___d549 ^
	     fcCdc_grayCounter_rdCounter[1] ;
  assign fcCdc_grayCounter_rsCounter_13_BIT_0_20_XOR_fc_ETC___d454 =
	     z__h36764 ^ fcCdc_grayCounter_rsCounter[17] ;
  assign rdat__h42796 = { 14'd0, fcCdc_frequency } ;
  assign spiCDC_reqS_BITS_27_TO_0__q1 = spiCDC_reqS[27:0] ;
  assign spiDAC_reqS_BITS_7_TO_0__q3 = spiDAC_reqS[7:0] ;
  assign wci_wslv_respF_cntr_r_8_MINUS_1___d27 =
	     wci_wslv_respF_cntr_r - 2'd1 ;
  assign x__h13558 = spiCDC_reqS_BITS_27_TO_0__q1[x__h13601] ;
  assign x__h13601 = 5'd27 - spiCDC_dPos ;
  assign x__h36639 =
	     18'd1 <<
	     IF_fcCdc_grayCounter_rsCounter_13_BIT_0_20_XOR_ETC___d490 ;
  assign y__h38044 = ~x__h36639 ;
  assign z__h36659 =
	     fcCdc_grayCounter_rsCounter[0] ^ fcCdc_grayCounter_rsCounter[1] ;
  assign z__h36666 = z__h36659 ^ fcCdc_grayCounter_rsCounter[2] ;
  assign z__h36673 = z__h36666 ^ fcCdc_grayCounter_rsCounter[3] ;
  assign z__h36680 = z__h36673 ^ fcCdc_grayCounter_rsCounter[4] ;
  assign z__h36687 = z__h36680 ^ fcCdc_grayCounter_rsCounter[5] ;
  assign z__h36694 = z__h36687 ^ fcCdc_grayCounter_rsCounter[6] ;
  assign z__h36701 = z__h36694 ^ fcCdc_grayCounter_rsCounter[7] ;
  assign z__h36708 = z__h36701 ^ fcCdc_grayCounter_rsCounter[8] ;
  assign z__h36715 = z__h36708 ^ fcCdc_grayCounter_rsCounter[9] ;
  assign z__h36722 = z__h36715 ^ fcCdc_grayCounter_rsCounter[10] ;
  assign z__h36729 = z__h36722 ^ fcCdc_grayCounter_rsCounter[11] ;
  assign z__h36736 = z__h36729 ^ fcCdc_grayCounter_rsCounter[12] ;
  assign z__h36743 = z__h36736 ^ fcCdc_grayCounter_rsCounter[13] ;
  assign z__h36750 = z__h36743 ^ fcCdc_grayCounter_rsCounter[14] ;
  assign z__h36757 = z__h36750 ^ fcCdc_grayCounter_rsCounter[15] ;
  assign z__h36764 = z__h36757 ^ fcCdc_grayCounter_rsCounter[16] ;
  always@(wci_wslv_reqF_D_OUT or rdat__h42796)
  begin
    case (wci_wslv_reqF_D_OUT[43:42])
      2'b0, 2'b01: rdat__h43022 = 32'd0;
      2'b10: rdat__h43022 = 32'hFEEDFACE;
      2'b11: rdat__h43022 = rdat__h42796;
    endcase
  end
  always@(spiDAC_iPos or
	  NOT_spiDAC_iPos_45_EQ_0_59_60_OR_NOT_spiDAC_re_ETC___d361 or
	  spiDAC_reqF_head_wrapped or
	  spiDAC_reqF_tail_wrapped or spiDAC_reqF_dInReset_VAL)
  begin
    case (spiDAC_iPos)
      3'd1, 3'd2, 3'd3, 3'd4:
	  IF_spiDAC_iPos_45_EQ_4_52_OR_spiDAC_iPos_45_EQ_ETC___d362 =
	      spiDAC_reqF_head_wrapped != spiDAC_reqF_tail_wrapped &&
	      !spiDAC_reqF_dInReset_VAL;
      default: IF_spiDAC_iPos_45_EQ_4_52_OR_spiDAC_iPos_45_EQ_ETC___d362 =
		   NOT_spiDAC_iPos_45_EQ_0_59_60_OR_NOT_spiDAC_re_ETC___d361;
    endcase
  end
  always@(spiDAC_iPos or spiDAC_reqS)
  begin
    case (spiDAC_iPos)
      3'd1:
	  CASE_spiDAC_iPos_1_spiDAC_reqS_BIT_9_2_spiDAC__ETC__q2 =
	      spiDAC_reqS[9];
      3'd2:
	  CASE_spiDAC_iPos_1_spiDAC_reqS_BIT_9_2_spiDAC__ETC__q2 =
	      spiDAC_reqS[10];
      3'd3:
	  CASE_spiDAC_iPos_1_spiDAC_reqS_BIT_9_2_spiDAC__ETC__q2 =
	      spiDAC_reqS[11];
      3'd4:
	  CASE_spiDAC_iPos_1_spiDAC_reqS_BIT_9_2_spiDAC__ETC__q2 =
	      spiDAC_reqS[12];
      default: CASE_spiDAC_iPos_1_spiDAC_reqS_BIT_9_2_spiDAC__ETC__q2 =
		   spiDAC_reqS[8];
    endcase
  end
  always@(_31_MINUS_spiCDC_dPos_29___d230 or spiCDC_reqS)
  begin
    case (_31_MINUS_spiCDC_dPos_29___d230)
      5'd4:
	  CASE_31_MINUS_spiCDC_dPos_29_30_4_spiCDC_reqS__ETC__q4 =
	      spiCDC_reqS[28];
      5'd5:
	  CASE_31_MINUS_spiCDC_dPos_29_30_4_spiCDC_reqS__ETC__q4 =
	      spiCDC_reqS[29];
      5'd6:
	  CASE_31_MINUS_spiCDC_dPos_29_30_4_spiCDC_reqS__ETC__q4 =
	      spiCDC_reqS[30];
      default: CASE_31_MINUS_spiCDC_dPos_29_30_4_spiCDC_reqS__ETC__q4 =
		   _31_MINUS_spiCDC_dPos_29___d230 == 5'd7 && spiCDC_reqS[31];
    endcase
  end
  always@(_31_MINUS_spiCDC_dPos_29___d230 or x__h13558 or spiCDC_reqS)
  begin
    case (_31_MINUS_spiCDC_dPos_29___d230)
      5'd0:
	  CASE_31_MINUS_spiCDC_dPos_29_30_0_spiCDC_reqS__ETC__q5 =
	      spiCDC_reqS[28];
      5'd1:
	  CASE_31_MINUS_spiCDC_dPos_29_30_0_spiCDC_reqS__ETC__q5 =
	      spiCDC_reqS[29];
      5'd2:
	  CASE_31_MINUS_spiCDC_dPos_29_30_0_spiCDC_reqS__ETC__q5 =
	      spiCDC_reqS[30];
      5'd3:
	  CASE_31_MINUS_spiCDC_dPos_29_30_0_spiCDC_reqS__ETC__q5 =
	      spiCDC_reqS[31];
      default: CASE_31_MINUS_spiCDC_dPos_29_30_0_spiCDC_reqS__ETC__q5 =
		   x__h13558;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (wciS0_MReset_n == `BSV_RESET_VALUE)
      begin
        fcCdc_countNow <= `BSV_ASSIGNMENT_DELAY 18'd262143;
	fcCdc_countPast <= `BSV_ASSIGNMENT_DELAY 18'd262143;
	fcCdc_frequency <= `BSV_ASSIGNMENT_DELAY 18'd262143;
	fcCdc_pulseAction <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fcCdc_sampleCount <= `BSV_ASSIGNMENT_DELAY 16'd0;
	oneKHz_value <= `BSV_ASSIGNMENT_DELAY 18'd0;
	spiCDC_reqF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiCDC_respF_head_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiDAC_reqF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiDAC_respF_head_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	splitReadInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
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
      end
    else
      begin
        if (fcCdc_countNow_EN)
	  fcCdc_countNow <= `BSV_ASSIGNMENT_DELAY fcCdc_countNow_D_IN;
	if (fcCdc_countPast_EN)
	  fcCdc_countPast <= `BSV_ASSIGNMENT_DELAY fcCdc_countPast_D_IN;
	if (fcCdc_frequency_EN)
	  fcCdc_frequency <= `BSV_ASSIGNMENT_DELAY fcCdc_frequency_D_IN;
	if (fcCdc_pulseAction_EN)
	  fcCdc_pulseAction <= `BSV_ASSIGNMENT_DELAY fcCdc_pulseAction_D_IN;
	if (fcCdc_sampleCount_EN)
	  fcCdc_sampleCount <= `BSV_ASSIGNMENT_DELAY fcCdc_sampleCount_D_IN;
	if (oneKHz_value_EN)
	  oneKHz_value <= `BSV_ASSIGNMENT_DELAY oneKHz_value_D_IN;
	if (spiCDC_reqF_tail_wrapped_EN)
	  spiCDC_reqF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY
	      spiCDC_reqF_tail_wrapped_D_IN;
	if (spiCDC_respF_head_wrapped_EN)
	  spiCDC_respF_head_wrapped <= `BSV_ASSIGNMENT_DELAY
	      spiCDC_respF_head_wrapped_D_IN;
	if (spiDAC_reqF_tail_wrapped_EN)
	  spiDAC_reqF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY
	      spiDAC_reqF_tail_wrapped_D_IN;
	if (spiDAC_respF_head_wrapped_EN)
	  spiDAC_respF_head_wrapped <= `BSV_ASSIGNMENT_DELAY
	      spiDAC_respF_head_wrapped_D_IN;
	if (splitReadInFlight_EN)
	  splitReadInFlight <= `BSV_ASSIGNMENT_DELAY splitReadInFlight_D_IN;
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
      end
    if (spiCDC_reqS_EN) spiCDC_reqS <= `BSV_ASSIGNMENT_DELAY spiCDC_reqS_D_IN;
    if (spiDAC_reqS_EN) spiDAC_reqS <= `BSV_ASSIGNMENT_DELAY spiDAC_reqS_D_IN;
  end
  always@(posedge spiCDC_cd_CLK_OUT)
  begin
    if (spiCDC_slowReset_OUT_RST == `BSV_RESET_VALUE)
      begin
        spiCDC_cGate <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiCDC_capV <= `BSV_ASSIGNMENT_DELAY 28'd0;
	spiCDC_csbR <= `BSV_ASSIGNMENT_DELAY 1'd1;
	spiCDC_dPos <= `BSV_ASSIGNMENT_DELAY 5'd0;
	spiCDC_doResp <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiCDC_rPos <= `BSV_ASSIGNMENT_DELAY 6'd0;
	spiCDC_rcv_d <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiCDC_reqF_head_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiCDC_respF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiCDC_sdoR <= `BSV_ASSIGNMENT_DELAY 1'b0;
	spiCDC_xmt_d <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (spiCDC_cGate_EN)
	  spiCDC_cGate <= `BSV_ASSIGNMENT_DELAY spiCDC_cGate_D_IN;
	if (spiCDC_capV_EN)
	  spiCDC_capV <= `BSV_ASSIGNMENT_DELAY spiCDC_capV_D_IN;
	if (spiCDC_csbR_EN)
	  spiCDC_csbR <= `BSV_ASSIGNMENT_DELAY spiCDC_csbR_D_IN;
	if (spiCDC_dPos_EN)
	  spiCDC_dPos <= `BSV_ASSIGNMENT_DELAY spiCDC_dPos_D_IN;
	if (spiCDC_doResp_EN)
	  spiCDC_doResp <= `BSV_ASSIGNMENT_DELAY spiCDC_doResp_D_IN;
	if (spiCDC_rPos_EN)
	  spiCDC_rPos <= `BSV_ASSIGNMENT_DELAY spiCDC_rPos_D_IN;
	if (spiCDC_rcv_d_EN)
	  spiCDC_rcv_d <= `BSV_ASSIGNMENT_DELAY spiCDC_rcv_d_D_IN;
	if (spiCDC_reqF_head_wrapped_EN)
	  spiCDC_reqF_head_wrapped <= `BSV_ASSIGNMENT_DELAY
	      spiCDC_reqF_head_wrapped_D_IN;
	if (spiCDC_respF_tail_wrapped_EN)
	  spiCDC_respF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY
	      spiCDC_respF_tail_wrapped_D_IN;
	if (spiCDC_sdoR_EN)
	  spiCDC_sdoR <= `BSV_ASSIGNMENT_DELAY spiCDC_sdoR_D_IN;
	if (spiCDC_xmt_d_EN)
	  spiCDC_xmt_d <= `BSV_ASSIGNMENT_DELAY spiCDC_xmt_d_D_IN;
      end
    if (spiCDC_respS_EN)
      spiCDC_respS <= `BSV_ASSIGNMENT_DELAY spiCDC_respS_D_IN;
  end
  always@(posedge spiCDC_cinv_CLK_OUT)
  begin
    if (spiCDC_sdiP_EN) spiCDC_sdiP <= `BSV_ASSIGNMENT_DELAY spiCDC_sdiP_D_IN;
  end
  always@(posedge spiDAC_cd_CLK_OUT)
  begin
    if (spiDAC_slowReset_OUT_RST == `BSV_RESET_VALUE)
      begin
        spiDAC_cGate <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiDAC_capV <= `BSV_ASSIGNMENT_DELAY 8'd0;
	spiDAC_csbR <= `BSV_ASSIGNMENT_DELAY 1'd1;
	spiDAC_dPos <= `BSV_ASSIGNMENT_DELAY 3'd0;
	spiDAC_doResp <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiDAC_iPos <= `BSV_ASSIGNMENT_DELAY 3'd0;
	spiDAC_reqF_head_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiDAC_respF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiDAC_sdoR <= `BSV_ASSIGNMENT_DELAY 1'b0;
	spiDAC_xcv_d <= `BSV_ASSIGNMENT_DELAY 1'd0;
	spiDAC_xmt_i <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (spiDAC_cGate_EN)
	  spiDAC_cGate <= `BSV_ASSIGNMENT_DELAY spiDAC_cGate_D_IN;
	if (spiDAC_capV_EN)
	  spiDAC_capV <= `BSV_ASSIGNMENT_DELAY spiDAC_capV_D_IN;
	if (spiDAC_csbR_EN)
	  spiDAC_csbR <= `BSV_ASSIGNMENT_DELAY spiDAC_csbR_D_IN;
	if (spiDAC_dPos_EN)
	  spiDAC_dPos <= `BSV_ASSIGNMENT_DELAY spiDAC_dPos_D_IN;
	if (spiDAC_doResp_EN)
	  spiDAC_doResp <= `BSV_ASSIGNMENT_DELAY spiDAC_doResp_D_IN;
	if (spiDAC_iPos_EN)
	  spiDAC_iPos <= `BSV_ASSIGNMENT_DELAY spiDAC_iPos_D_IN;
	if (spiDAC_reqF_head_wrapped_EN)
	  spiDAC_reqF_head_wrapped <= `BSV_ASSIGNMENT_DELAY
	      spiDAC_reqF_head_wrapped_D_IN;
	if (spiDAC_respF_tail_wrapped_EN)
	  spiDAC_respF_tail_wrapped <= `BSV_ASSIGNMENT_DELAY
	      spiDAC_respF_tail_wrapped_D_IN;
	if (spiDAC_sdoR_EN)
	  spiDAC_sdoR <= `BSV_ASSIGNMENT_DELAY spiDAC_sdoR_D_IN;
	if (spiDAC_xcv_d_EN)
	  spiDAC_xcv_d <= `BSV_ASSIGNMENT_DELAY spiDAC_xcv_d_D_IN;
	if (spiDAC_xmt_i_EN)
	  spiDAC_xmt_i <= `BSV_ASSIGNMENT_DELAY spiDAC_xmt_i_D_IN;
      end
    if (spiDAC_respS_EN)
      spiDAC_respS <= `BSV_ASSIGNMENT_DELAY spiDAC_respS_D_IN;
  end
  always@(posedge spiDAC_cinv_CLK_OUT)
  begin
    if (spiDAC_sdiP_EN) spiDAC_sdiP <= `BSV_ASSIGNMENT_DELAY spiDAC_sdiP_D_IN;
  end
  always@(posedge wciS0_Clk or `BSV_RESET_EDGE wciS0_MReset_n)
  if (wciS0_MReset_n == `BSV_RESET_VALUE)
    begin
      fcCdc_grayCounter_rdCounter <= `BSV_ASSIGNMENT_DELAY 18'd0;
      fcCdc_grayCounter_rdCounterPre <= `BSV_ASSIGNMENT_DELAY 18'd0;
      wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (fcCdc_grayCounter_rdCounter_EN)
	fcCdc_grayCounter_rdCounter <= `BSV_ASSIGNMENT_DELAY
	    fcCdc_grayCounter_rdCounter_D_IN;
      if (fcCdc_grayCounter_rdCounterPre_EN)
	fcCdc_grayCounter_rdCounterPre <= `BSV_ASSIGNMENT_DELAY
	    fcCdc_grayCounter_rdCounterPre_D_IN;
      if (wci_wslv_isReset_isInReset_EN)
	wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wci_wslv_isReset_isInReset_D_IN;
    end
  always@(posedge CLK_flp_clk or `BSV_RESET_EDGE fcCdc_testRst_OUT_RST)
  if (fcCdc_testRst_OUT_RST == `BSV_RESET_VALUE)
    begin
      fcCdc_grayCounter_rsCounter <= `BSV_ASSIGNMENT_DELAY 18'd0;
    end
  else
    begin
      if (fcCdc_grayCounter_rsCounter_EN)
	fcCdc_grayCounter_rsCounter <= `BSV_ASSIGNMENT_DELAY
	    fcCdc_grayCounter_rsCounter_D_IN;
    end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    fcCdc_countNow = 18'h2AAAA;
    fcCdc_countPast = 18'h2AAAA;
    fcCdc_frequency = 18'h2AAAA;
    fcCdc_grayCounter_rdCounter = 18'h2AAAA;
    fcCdc_grayCounter_rdCounterPre = 18'h2AAAA;
    fcCdc_grayCounter_rsCounter = 18'h2AAAA;
    fcCdc_pulseAction = 1'h0;
    fcCdc_sampleCount = 16'hAAAA;
    oneKHz_value = 18'h2AAAA;
    spiCDC_cGate = 1'h0;
    spiCDC_capV = 28'hAAAAAAA;
    spiCDC_csbR = 1'h0;
    spiCDC_dPos = 5'h0A;
    spiCDC_doResp = 1'h0;
    spiCDC_rPos = 6'h2A;
    spiCDC_rcv_d = 1'h0;
    spiCDC_reqF_head_wrapped = 1'h0;
    spiCDC_reqF_tail_wrapped = 1'h0;
    spiCDC_reqS = 33'h0AAAAAAAA;
    spiCDC_respF_head_wrapped = 1'h0;
    spiCDC_respF_tail_wrapped = 1'h0;
    spiCDC_respS = 28'hAAAAAAA;
    spiCDC_sdiP = 1'h0;
    spiCDC_sdoR = 1'h0;
    spiCDC_xmt_d = 1'h0;
    spiDAC_cGate = 1'h0;
    spiDAC_capV = 8'hAA;
    spiDAC_csbR = 1'h0;
    spiDAC_dPos = 3'h2;
    spiDAC_doResp = 1'h0;
    spiDAC_iPos = 3'h2;
    spiDAC_reqF_head_wrapped = 1'h0;
    spiDAC_reqF_tail_wrapped = 1'h0;
    spiDAC_reqS = 14'h2AAA;
    spiDAC_respF_head_wrapped = 1'h0;
    spiDAC_respF_tail_wrapped = 1'h0;
    spiDAC_respS = 8'hAA;
    spiDAC_sdiP = 1'h0;
    spiDAC_sdoR = 1'h0;
    spiDAC_xcv_d = 1'h0;
    spiDAC_xmt_i = 1'h0;
    splitReadInFlight = 1'h0;
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
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge wciS0_Clk)
  begin
    #0;
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 &&
	  MUX_wci_wslv_respF_x_wire_wset_1__SEL_4)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 88: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_spi32_response] and\n  [RL_spi5_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	begin
	  v__h42276 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	$display("[%0d]: %m: WCI CONFIG WRITE Addr:%0x BE:%0x Data:%0x",
		 v__h42276,
		 wci_wslv_reqF_D_OUT[63:32],
		 wci_wslv_reqF_D_OUT[67:64],
		 wci_wslv_reqF_D_OUT[31:0]);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	begin
	  v__h43038 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	$display("[%0d]: %m: WCI CONFIG READ Addr:%0x BE:%0x Data:%0x",
		 v__h43038,
		 wci_wslv_reqF_D_OUT[63:32],
		 wci_wslv_reqF_D_OUT[67:64],
		 rdat__h43022);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_start)
	begin
	  v__h3562 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3562,
		 wci_wslv_reqF_D_OUT[36:34],
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && MUX_wci_wslv_respF_x_wire_wset_1__SEL_4)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_spi5_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && MUX_wci_wslv_respF_x_wire_wset_1__SEL_3)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_spi32_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and [RL_wci_cfrd] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && MUX_wci_wslv_respF_x_wire_wset_1__SEL_4)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_spi5_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && MUX_wci_wslv_respF_x_wire_wset_1__SEL_3)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_spi32_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI &&
	  MUX_wci_wslv_respF_x_wire_wset_1__SEL_4)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_spi5_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI &&
	  MUX_wci_wslv_respF_x_wire_wset_1__SEL_3)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_spi32_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO &&
	  MUX_wci_wslv_respF_x_wire_wset_1__SEL_4)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 60: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_spi5_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO &&
	  MUX_wci_wslv_respF_x_wire_wset_1__SEL_3)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 60: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_spi32_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 60: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_OrE &&
	  MUX_wci_wslv_respF_x_wire_wset_1__SEL_4)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 74: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_OrE] and\n  [RL_spi5_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_OrE &&
	  MUX_wci_wslv_respF_x_wire_wset_1__SEL_3)
	$display("Error: \"bsv/dev/FMC150.bsv\", line 62, column 74: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_OrE] and\n  [RL_spi32_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	begin
	  v__h3881 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h3881,
		 wci_wslv_cEdge,
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	begin
	  v__h3737 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h3737,
		 wci_wslv_cEdge,
		 wci_wslv_cState,
		 wci_wslv_nState);
  end
  // synopsys translate_on
endmodule