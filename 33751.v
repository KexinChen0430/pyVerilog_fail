module outputs
  wire [31 : 0] wciS0_SData, wsiM0_MData;
  wire [11 : 0] wsiM0_MBurstLength;
  wire [7 : 0] wsiM0_MReqInfo;
  wire [3 : 0] wsiM0_MByteEn;
  wire [2 : 0] wsiM0_MCmd;
  wire [1 : 0] wciS0_SFlag, wciS0_SResp;
  wire wciS0_SThreadBusy,
       wsiM0_MBurstPrecise,
       wsiM0_MReqLast,
       wsiM0_MReset_n,
       wsiS0_SReset_n,
       wsiS0_SThreadBusy;
`else
`define NOT_EMPTY_ddc.v
`include "ddc_defs.v"
`endif
  // inlined wires
  wire [95 : 0] wsiM_extStatusW$wget, wsiS_extStatusW$wget;
  wire [60 : 0] wsiM_reqFifo_x_wire$wget, wsiS_wsiReq$wget;
  wire [59 : 0] wci_wciReq$wget;
  wire [33 : 0] wci_respF_x_wire$wget;
  wire [31 : 0] ddc_sRegPwdata_w$wget,
		wci_Es_mData_w$wget,
		wsi_Es_mData_w$wget;
  wire [19 : 0] wci_Es_mAddr_w$wget;
  wire [15 : 0] ddc_sDataR_w$wget;
  wire [11 : 0] ddc_sRegPaddr_w$wget, wsi_Es_mBurstLength_w$wget;
  wire [7 : 0] wsi_Es_mReqInfo_w$wget;
  wire [3 : 0] wci_Es_mByteEn_w$wget, wsi_Es_mByteEn_w$wget;
  wire [2 : 0] wci_Es_mCmd_w$wget, wci_wEdge$wget, wsi_Es_mCmd_w$wget;
  wire ddc_dataResetn_w$wget,
       ddc_dataResetn_w$whas,
       ddc_mDataReady_w$wget,
       ddc_mDataReady_w$whas,
       ddc_sDataR_w$whas,
       ddc_sDataValid_w$wget,
       ddc_sDataValid_w$whas,
       ddc_sRegPaddr_w$whas,
       ddc_sRegPenable_w$wget,
       ddc_sRegPenable_w$whas,
       ddc_sRegPsel_w$wget,
       ddc_sRegPsel_w$whas,
       ddc_sRegPwdata_w$whas,
       ddc_sRegPwrite_w$wget,
       ddc_sRegPwrite_w$whas,
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
  // register ambaErrCnt
  reg [31 : 0] ambaErrCnt;
  wire [31 : 0] ambaErrCnt$D_IN;
  wire ambaErrCnt$EN;
  // register ambaRdReqCnt
  reg [31 : 0] ambaRdReqCnt;
  wire [31 : 0] ambaRdReqCnt$D_IN;
  wire ambaRdReqCnt$EN;
  // register ambaRespCnt
  reg [31 : 0] ambaRespCnt;
  wire [31 : 0] ambaRespCnt$D_IN;
  wire ambaRespCnt$EN;
  // register ambaWrReqCnt
  reg [31 : 0] ambaWrReqCnt;
  wire [31 : 0] ambaWrReqCnt$D_IN;
  wire ambaWrReqCnt$EN;
  // register ddcCtrl
  reg [31 : 0] ddcCtrl;
  wire [31 : 0] ddcCtrl$D_IN;
  wire ddcCtrl$EN;
  // register ddc_reqSetup
  reg ddc_reqSetup;
  wire ddc_reqSetup$D_IN, ddc_reqSetup$EN;
  // register ddc_started
  reg ddc_started;
  wire ddc_started$D_IN, ddc_started$EN;
  // register outMesgCnt
  reg [31 : 0] outMesgCnt;
  wire [31 : 0] outMesgCnt$D_IN;
  wire outMesgCnt$EN;
  // register splitReadInFlight
  reg splitReadInFlight;
  wire splitReadInFlight$D_IN, splitReadInFlight$EN;
  // register splitWriteInFlight
  reg splitWriteInFlight;
  wire splitWriteInFlight$D_IN, splitWriteInFlight$EN;
  // register takeEven
  reg takeEven;
  wire takeEven$D_IN, takeEven$EN;
  // register unloadCnt
  reg [15 : 0] unloadCnt;
  wire [15 : 0] unloadCnt$D_IN;
  wire unloadCnt$EN;
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
  // ports of submodule ddc_apbReqF
  wire [45 : 0] ddc_apbReqF$D_IN, ddc_apbReqF$D_OUT;
  wire ddc_apbReqF$CLR,
       ddc_apbReqF$DEQ,
       ddc_apbReqF$EMPTY_N,
       ddc_apbReqF$ENQ,
       ddc_apbReqF$FULL_N;
  // ports of submodule ddc_apbRespF
  wire [32 : 0] ddc_apbRespF$D_IN, ddc_apbRespF$D_OUT;
  wire ddc_apbRespF$CLR,
       ddc_apbRespF$DEQ,
       ddc_apbRespF$EMPTY_N,
       ddc_apbRespF$ENQ,
       ddc_apbRespF$FULL_N;
  // ports of submodule ddc_ddc
  wire [31 : 0] ddc_ddc$sreg_prdata, ddc_ddc$sreg_pwdata;
  wire [15 : 0] ddc_ddc$mdata_i, ddc_ddc$mdata_q, ddc_ddc$sdata_r;
  wire [11 : 0] ddc_ddc$sreg_paddr;
  wire ddc_ddc$data_resetn,
       ddc_ddc$int_ducddc,
       ddc_ddc$int_errpacket,
       ddc_ddc$int_lostoutput,
       ddc_ddc$int_missinput,
       ddc_ddc$mdata_ready,
       ddc_ddc$mdata_valid,
       ddc_ddc$sdata_ready,
       ddc_ddc$sdata_valid,
       ddc_ddc$sreg_penable,
       ddc_ddc$sreg_pready,
       ddc_ddc$sreg_psel,
       ddc_ddc$sreg_pslverr,
       ddc_ddc$sreg_pwrite;
  // ports of submodule ddc_xkF
  wire [31 : 0] ddc_xkF$D_IN, ddc_xkF$D_OUT;
  wire ddc_xkF$CLR, ddc_xkF$DEQ, ddc_xkF$EMPTY_N, ddc_xkF$ENQ, ddc_xkF$FULL_N;
  // ports of submodule ddc_xnF
  wire [15 : 0] ddc_xnF$D_IN, ddc_xnF$D_OUT;
  wire ddc_xnF$CLR, ddc_xnF$DEQ, ddc_xnF$EMPTY_N, ddc_xnF$ENQ, ddc_xnF$FULL_N;
  // ports of submodule wci_isReset
  wire wci_isReset$VAL;
  // ports of submodule wci_reqF
  wire [59 : 0] wci_reqF$D_IN, wci_reqF$D_OUT;
  wire wci_reqF$CLR, wci_reqF$DEQ, wci_reqF$EMPTY_N, wci_reqF$ENQ;
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
  // ports of submodule xnF
  wire [31 : 0] xnF$D_IN, xnF$D_OUT;
  wire xnF$CLR, xnF$DEQ, xnF$EMPTY_N, xnF$ENQ, xnF$FULL_N;
  // rule scheduling signals
  wire CAN_FIRE_RL_advance_wci_response,
       CAN_FIRE_RL_ddcEnable_doEgress,
       CAN_FIRE_RL_ddcEnable_doIngress,
       CAN_FIRE_RL_ddcEnable_output_feedDDC,
       CAN_FIRE_RL_ddcPass_bypass,
       CAN_FIRE_RL_ddc_ddc_stream_egress,
       CAN_FIRE_RL_ddc_ddc_stream_ingress,
       CAN_FIRE_RL_ddc_drive_ddc_always_enabled,
       CAN_FIRE_RL_ddc_run,
       CAN_FIRE_RL_ddc_sreg_request,
       CAN_FIRE_RL_ddc_start,
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
       CAN_FIRE_wciS0_mAddr,
       CAN_FIRE_wciS0_mAddrSpace,
       CAN_FIRE_wciS0_mByteEn,
       CAN_FIRE_wciS0_mCmd,
       CAN_FIRE_wciS0_mData,
       CAN_FIRE_wciS0_mFlag,
       CAN_FIRE_wsiM0_sReset_n,
       CAN_FIRE_wsiM0_sThreadBusy,
       CAN_FIRE_wsiS0_mBurstLength,
       CAN_FIRE_wsiS0_mBurstPrecise,
       CAN_FIRE_wsiS0_mByteEn,
       CAN_FIRE_wsiS0_mCmd,
       CAN_FIRE_wsiS0_mData,
       CAN_FIRE_wsiS0_mDataInfo,
       CAN_FIRE_wsiS0_mReqInfo,
       CAN_FIRE_wsiS0_mReqLast,
       CAN_FIRE_wsiS0_mReset_n,
       WILL_FIRE_RL_advance_wci_response,
       WILL_FIRE_RL_ddcEnable_doEgress,
       WILL_FIRE_RL_ddcEnable_doIngress,
       WILL_FIRE_RL_ddcEnable_output_feedDDC,
       WILL_FIRE_RL_ddcPass_bypass,
       WILL_FIRE_RL_ddc_ddc_stream_egress,
       WILL_FIRE_RL_ddc_ddc_stream_ingress,
       WILL_FIRE_RL_ddc_drive_ddc_always_enabled,
       WILL_FIRE_RL_ddc_run,
       WILL_FIRE_RL_ddc_sreg_request,
       WILL_FIRE_RL_ddc_start,
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
       WILL_FIRE_wciS0_mAddr,
       WILL_FIRE_wciS0_mAddrSpace,
       WILL_FIRE_wciS0_mByteEn,
       WILL_FIRE_wciS0_mCmd,
       WILL_FIRE_wciS0_mData,
       WILL_FIRE_wciS0_mFlag,
       WILL_FIRE_wsiM0_sReset_n,
       WILL_FIRE_wsiM0_sThreadBusy,
       WILL_FIRE_wsiS0_mBurstLength,
       WILL_FIRE_wsiS0_mBurstPrecise,
       WILL_FIRE_wsiS0_mByteEn,
       WILL_FIRE_wsiS0_mCmd,
       WILL_FIRE_wsiS0_mData,
       WILL_FIRE_wsiS0_mDataInfo,
       WILL_FIRE_wsiS0_mReqInfo,
       WILL_FIRE_wsiS0_mReqLast,
       WILL_FIRE_wsiS0_mReset_n;
  // inputs to muxes for submodule ports
  reg [33 : 0] MUX_wci_respF_q_0$write_1__VAL_1;
  wire [60 : 0] MUX_wsiM_reqFifo_q_0$write_1__VAL_1,
		MUX_wsiM_reqFifo_q_0$write_1__VAL_2,
		MUX_wsiM_reqFifo_q_1$write_1__VAL_2,
		MUX_wsiM_reqFifo_x_wire$wset_1__VAL_1;
  wire [45 : 0] MUX_ddc_apbReqF$enq_1__VAL_1, MUX_ddc_apbReqF$enq_1__VAL_2;
  wire [33 : 0] MUX_wci_respF_q_0$write_1__VAL_2,
		MUX_wci_respF_q_1$write_1__VAL_2,
		MUX_wci_respF_x_wire$wset_1__VAL_1,
		MUX_wci_respF_x_wire$wset_1__VAL_2,
		MUX_wci_respF_x_wire$wset_1__VAL_3;
  wire [1 : 0] MUX_wci_respF_c_r$write_1__VAL_1,
	       MUX_wci_respF_c_r$write_1__VAL_2,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_1,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_2;
  wire MUX_ddc_apbReqF$enq_1__SEL_1,
       MUX_ddc_apbReqF$enq_1__SEL_2,
       MUX_splitReadInFlight$write_1__SEL_1,
       MUX_wci_illegalEdge$write_1__SEL_1,
       MUX_wci_illegalEdge$write_1__SEL_2,
       MUX_wci_illegalEdge$write_1__VAL_2,
       MUX_wci_respF_q_0$write_1__SEL_1,
       MUX_wci_respF_q_1$write_1__SEL_1,
       MUX_wci_respF_x_wire$wset_1__SEL_1,
       MUX_wsiM_reqFifo_q_0$write_1__SEL_1,
       MUX_wsiM_reqFifo_q_1$write_1__SEL_1,
       MUX_wsiS_reqFifo_levelsValid$write_1__SEL_4;
  // remaining internal signals
  reg [63 : 0] v__h12747, v__h2629, v__h2776, v__h3675;
  reg [31 : 0] IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136;
  wire [31 : 0] ddcStatus__h12624,
		rdat___1__h13067,
		rdat___1__h13146,
		rdat___1__h13160,
		rdat___1__h13168,
		rdat___1__h13174,
		rdat___1__h13188,
		rdat___1__h13196,
		rdat___1__h13202,
		rdat___1__h13209,
		rdat___1__h13215,
		rdat___1__h13222,
		rdat___1__h13229,
		x_data__h11943,
		x_data__h13030;
  wire [15 : 0] x__h13071;
  wire [7 : 0] x__h13044;
  wire wci_reqF_i_notEmpty__7_AND_IF_wci_reqF_first___ETC___d65,
       wsiS_reqFifo_notFull__67_AND_wsiS_burstKind_47_ETC___d387;
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
  // action method wsiS0_mCmd
  assign CAN_FIRE_wsiS0_mCmd = 1'd1 ;
  assign WILL_FIRE_wsiS0_mCmd = 1'd1 ;
  // action method wsiS0_mReqLast
  assign CAN_FIRE_wsiS0_mReqLast = 1'd1 ;
  assign WILL_FIRE_wsiS0_mReqLast = wsiS0_MReqLast ;
  // action method wsiS0_mBurstPrecise
  assign CAN_FIRE_wsiS0_mBurstPrecise = 1'd1 ;
  assign WILL_FIRE_wsiS0_mBurstPrecise = wsiS0_MBurstPrecise ;
  // action method wsiS0_mBurstLength
  assign CAN_FIRE_wsiS0_mBurstLength = 1'd1 ;
  assign WILL_FIRE_wsiS0_mBurstLength = 1'd1 ;
  // action method wsiS0_mData
  assign CAN_FIRE_wsiS0_mData = 1'd1 ;
  assign WILL_FIRE_wsiS0_mData = 1'd1 ;
  // action method wsiS0_mByteEn
  assign CAN_FIRE_wsiS0_mByteEn = 1'd1 ;
  assign WILL_FIRE_wsiS0_mByteEn = 1'd1 ;
  // action method wsiS0_mReqInfo
  assign CAN_FIRE_wsiS0_mReqInfo = 1'd1 ;
  assign WILL_FIRE_wsiS0_mReqInfo = 1'd1 ;
  // action method wsiS0_mDataInfo
  assign CAN_FIRE_wsiS0_mDataInfo = 1'd1 ;
  assign WILL_FIRE_wsiS0_mDataInfo = 1'd1 ;
  // value method wsiS0_sThreadBusy
  assign wsiS0_SThreadBusy =
	     !CAN_FIRE_RL_wsiS_backpressure || wsiS_sThreadBusy_dw$wget ;
  // value method wsiS0_sReset_n
  assign wsiS0_SReset_n = !wsiS_isReset$VAL && wsiS_operateD ;
  // action method wsiS0_mReset_n
  assign CAN_FIRE_wsiS0_mReset_n = 1'd1 ;
  assign WILL_FIRE_wsiS0_mReset_n = wsiS0_MReset_n ;
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
  // action method wsiM0_sThreadBusy
  assign CAN_FIRE_wsiM0_sThreadBusy = 1'd1 ;
  assign WILL_FIRE_wsiM0_sThreadBusy = wsiM0_SThreadBusy ;
  // value method wsiM0_mReset_n
  assign wsiM0_MReset_n = !wsiM_isReset$VAL && wsiM_operateD ;
  // action method wsiM0_sReset_n
  assign CAN_FIRE_wsiM0_sReset_n = 1'd1 ;
  assign WILL_FIRE_wsiM0_sReset_n = wsiM0_SReset_n ;
  // submodule ddc_apbReqF
  FIFO2 #(.width(32'd46), .guarded(32'd1)) ddc_apbReqF(.RST_N(wciS0_MReset_n),
						       .CLK(wciS0_Clk),
						       .D_IN(ddc_apbReqF$D_IN),
						       .ENQ(ddc_apbReqF$ENQ),
						       .DEQ(ddc_apbReqF$DEQ),
						       .CLR(ddc_apbReqF$CLR),
						       .D_OUT(ddc_apbReqF$D_OUT),
						       .FULL_N(ddc_apbReqF$FULL_N),
						       .EMPTY_N(ddc_apbReqF$EMPTY_N));
  // submodule ddc_apbRespF
  FIFO2 #(.width(32'd33),
	  .guarded(32'd1)) ddc_apbRespF(.RST_N(wciS0_MReset_n),
					.CLK(wciS0_Clk),
					.D_IN(ddc_apbRespF$D_IN),
					.ENQ(ddc_apbRespF$ENQ),
					.DEQ(ddc_apbRespF$DEQ),
					.CLR(ddc_apbRespF$CLR),
					.D_OUT(ddc_apbRespF$D_OUT),
					.FULL_N(ddc_apbRespF$FULL_N),
					.EMPTY_N(ddc_apbRespF$EMPTY_N));
  // submodule ddc_ddc
  duc_ddc_compiler_v1_0 ddc_ddc(.clk(wciS0_Clk),
				.sreg_presetn(wciS0_MReset_n),
				.data_resetn(ddc_ddc$data_resetn),
				.mdata_ready(ddc_ddc$mdata_ready),
				.sdata_r(ddc_ddc$sdata_r),
				.sdata_valid(ddc_ddc$sdata_valid),
				.sreg_paddr(ddc_ddc$sreg_paddr),
				.sreg_penable(ddc_ddc$sreg_penable),
				.sreg_psel(ddc_ddc$sreg_psel),
				.sreg_pwdata(ddc_ddc$sreg_pwdata),
				.sreg_pwrite(ddc_ddc$sreg_pwrite),
				.mdata_valid(ddc_ddc$mdata_valid),
				.mdata_last(),
				.sdata_ready(ddc_ddc$sdata_ready),
				.mdata_clean(),
				.mdata_i(ddc_ddc$mdata_i),
				.mdata_q(ddc_ddc$mdata_q),
				.sreg_pready(ddc_ddc$sreg_pready),
				.sreg_prdata(ddc_ddc$sreg_prdata),
				.sreg_pslverr(ddc_ddc$sreg_pslverr),
				.int_missinput(ddc_ddc$int_missinput),
				.int_errpacket(ddc_ddc$int_errpacket),
				.int_lostoutput(ddc_ddc$int_lostoutput),
				.int_ducddc(ddc_ddc$int_ducddc));
  // submodule ddc_xkF
  FIFO2 #(.width(32'd32), .guarded(32'd1)) ddc_xkF(.RST_N(wciS0_MReset_n),
						   .CLK(wciS0_Clk),
						   .D_IN(ddc_xkF$D_IN),
						   .ENQ(ddc_xkF$ENQ),
						   .DEQ(ddc_xkF$DEQ),
						   .CLR(ddc_xkF$CLR),
						   .D_OUT(ddc_xkF$D_OUT),
						   .FULL_N(ddc_xkF$FULL_N),
						   .EMPTY_N(ddc_xkF$EMPTY_N));
  // submodule ddc_xnF
  FIFO2 #(.width(32'd16), .guarded(32'd1)) ddc_xnF(.RST_N(wciS0_MReset_n),
						   .CLK(wciS0_Clk),
						   .D_IN(ddc_xnF$D_IN),
						   .ENQ(ddc_xnF$ENQ),
						   .DEQ(ddc_xnF$DEQ),
						   .CLR(ddc_xnF$CLR),
						   .D_OUT(ddc_xnF$D_OUT),
						   .FULL_N(ddc_xnF$FULL_N),
						   .EMPTY_N(ddc_xnF$EMPTY_N));
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
  // submodule xnF
  FIFO2 #(.width(32'd32), .guarded(32'd1)) xnF(.RST_N(wciS0_MReset_n),
					       .CLK(wciS0_Clk),
					       .D_IN(xnF$D_IN),
					       .ENQ(xnF$ENQ),
					       .DEQ(xnF$DEQ),
					       .CLR(xnF$CLR),
					       .D_OUT(xnF$D_OUT),
					       .FULL_N(xnF$FULL_N),
					       .EMPTY_N(xnF$EMPTY_N));
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
  // rule RL_advance_wci_response
  assign CAN_FIRE_RL_advance_wci_response =
	     wci_respF_c_r != 2'd2 && ddc_apbRespF$EMPTY_N &&
	     !wci_wci_cfwr_pw$whas ;
  assign WILL_FIRE_RL_advance_wci_response =
	     CAN_FIRE_RL_advance_wci_response && !WILL_FIRE_RL_wci_cfrd &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_ctrl_EiI
  assign CAN_FIRE_RL_wci_ctrl_EiI =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd0 &&
	     wci_reqF$D_OUT[36:34] == 3'd0 ;
  assign WILL_FIRE_RL_wci_ctrl_EiI = CAN_FIRE_RL_wci_ctrl_EiI ;
  // rule RL_wci_ctrl_IsO
  assign CAN_FIRE_RL_wci_ctrl_IsO =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd1 &&
	     wci_reqF$D_OUT[36:34] == 3'd1 ;
  assign WILL_FIRE_RL_wci_ctrl_IsO = CAN_FIRE_RL_wci_ctrl_IsO ;
  // rule RL_wci_ctrl_OrE
  assign CAN_FIRE_RL_wci_ctrl_OrE =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd2 &&
	     wci_reqF$D_OUT[36:34] == 3'd3 ;
  assign WILL_FIRE_RL_wci_ctrl_OrE = CAN_FIRE_RL_wci_ctrl_OrE ;
  // rule RL_wsi_Es_doAlways
  assign CAN_FIRE_RL_wsi_Es_doAlways = 1'd1 ;
  assign WILL_FIRE_RL_wsi_Es_doAlways = 1'd1 ;
  // rule RL_wci_Es_doAlways_Req
  assign CAN_FIRE_RL_wci_Es_doAlways_Req = 1'd1 ;
  assign WILL_FIRE_RL_wci_Es_doAlways_Req = 1'd1 ;
  // rule RL_ddcEnable_doIngress
  assign CAN_FIRE_RL_ddcEnable_doIngress =
	     ddc_xnF$FULL_N && xnF$EMPTY_N && wci_cState == 3'd2 &&
	     ddcCtrl[1:0] == 2'd1 &&
	     !wsiM_statusR[6] ;
  assign WILL_FIRE_RL_ddcEnable_doIngress = CAN_FIRE_RL_ddcEnable_doIngress ;
  // rule RL_operating_actions
  assign CAN_FIRE_RL_operating_actions = wci_cState == 3'd2 ;
  assign WILL_FIRE_RL_operating_actions = CAN_FIRE_RL_operating_actions ;
  // rule RL_ddc_sreg_request
  assign CAN_FIRE_RL_ddc_sreg_request =
	     ddc_apbReqF$EMPTY_N &&
	     (!ddc_reqSetup || !ddc_ddc$sreg_pready ||
	      ddc_apbReqF$D_OUT[45] ||
	      ddc_apbRespF$FULL_N) ;
  assign WILL_FIRE_RL_ddc_sreg_request = CAN_FIRE_RL_ddc_sreg_request ;
  // rule RL_ddc_run
  assign CAN_FIRE_RL_ddc_run = ddc_started ;
  assign WILL_FIRE_RL_ddc_run = ddc_started ;
  // rule RL_ddc_start
  assign CAN_FIRE_RL_ddc_start = !ddc_started ;
  assign WILL_FIRE_RL_ddc_start = CAN_FIRE_RL_ddc_start ;
  // rule RL_ddc_ddc_stream_egress
  assign CAN_FIRE_RL_ddc_ddc_stream_egress =
	     ddc_xkF$FULL_N && ddc_ddc$mdata_valid ;
  assign WILL_FIRE_RL_ddc_ddc_stream_egress =
	     CAN_FIRE_RL_ddc_ddc_stream_egress ;
  // rule RL_ddc_ddc_stream_ingress
  assign CAN_FIRE_RL_ddc_ddc_stream_ingress =
	     ddc_xnF$EMPTY_N && ddc_ddc$sdata_ready ;
  assign WILL_FIRE_RL_ddc_ddc_stream_ingress =
	     CAN_FIRE_RL_ddc_ddc_stream_ingress ;
  // rule RL_ddc_drive_ddc_always_enabled
  assign CAN_FIRE_RL_ddc_drive_ddc_always_enabled = 1'd1 ;
  assign WILL_FIRE_RL_ddc_drive_ddc_always_enabled = 1'd1 ;
  // rule RL_wsiM_update_statusR
  assign CAN_FIRE_RL_wsiM_update_statusR = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_update_statusR = 1'd1 ;
  // rule RL_wsiM_ext_status_assign
  assign CAN_FIRE_RL_wsiM_ext_status_assign = 1'd1 ;
  assign WILL_FIRE_RL_wsiM_ext_status_assign = 1'd1 ;
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
  // rule RL_wsiS_ext_status_assign
  assign CAN_FIRE_RL_wsiS_ext_status_assign = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_ext_status_assign = 1'd1 ;
  // rule RL_wci_cfrd
  assign CAN_FIRE_RL_wci_cfrd =
	     wci_reqF_i_notEmpty__7_AND_IF_wci_reqF_first___ETC___d65 &&
	     wci_wci_cfrd_pw$whas ;
  assign WILL_FIRE_RL_wci_cfrd =
	     CAN_FIRE_RL_wci_cfrd && !WILL_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_ddcEnable_doEgress
  assign CAN_FIRE_RL_ddcEnable_doEgress =
	     wsiM_reqFifo_c_r != 2'd2 && ddc_xkF$EMPTY_N &&
	     wci_cState == 3'd2 &&
	     ddcCtrl[1:0] == 2'd1 ;
  assign WILL_FIRE_RL_ddcEnable_doEgress = CAN_FIRE_RL_ddcEnable_doEgress ;
  // rule RL_wsiS_inc_tBusyCount
  assign CAN_FIRE_RL_wsiS_inc_tBusyCount =
	     wsiS_operateD && wsiS_peerIsReady &&
	     (!CAN_FIRE_RL_wsiS_backpressure || wsiS_sThreadBusy_dw$wget) ;
  assign WILL_FIRE_RL_wsiS_inc_tBusyCount = CAN_FIRE_RL_wsiS_inc_tBusyCount ;
  // rule RL_wsiS_reqFifo_enq
  assign CAN_FIRE_RL_wsiS_reqFifo_enq =
	     wsiS_operateD && wsiS_peerIsReady &&
	     wsiS_wsiReq$wget[60:58] == 3'd1 ;
  assign WILL_FIRE_RL_wsiS_reqFifo_enq = CAN_FIRE_RL_wsiS_reqFifo_enq ;
  // rule RL_ddcEnable_output_feedDDC
  assign CAN_FIRE_RL_ddcEnable_output_feedDDC =
	     wsiS_reqFifo$EMPTY_N && xnF$FULL_N && wci_cState == 3'd2 &&
	     ddcCtrl[1:0] == 2'd1 ;
  assign WILL_FIRE_RL_ddcEnable_output_feedDDC =
	     CAN_FIRE_RL_ddcEnable_output_feedDDC ;
  // rule RL_ddcPass_bypass
  assign CAN_FIRE_RL_ddcPass_bypass =
	     wsiM_reqFifo_c_r != 2'd2 && wsiS_reqFifo$EMPTY_N &&
	     wci_cState == 3'd2 &&
	     ddcCtrl[1:0] == 2'd0 ;
  assign WILL_FIRE_RL_ddcPass_bypass = CAN_FIRE_RL_ddcPass_bypass ;
  // rule RL_wci_ctl_op_complete
  assign CAN_FIRE_RL_wci_ctl_op_complete =
	     wci_respF_c_r != 2'd2 && wci_ctlOpActive && wci_ctlAckReg ;
  assign WILL_FIRE_RL_wci_ctl_op_complete = CAN_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_cfwr
  assign CAN_FIRE_RL_wci_cfwr =
	     wci_reqF$EMPTY_N && wci_respF_c_r != 2'd2 &&
	     (!wci_reqF$D_OUT[44] || ddc_apbReqF$FULL_N) &&
	     wci_wci_cfwr_pw$whas ;
  assign WILL_FIRE_RL_wci_cfwr =
	     CAN_FIRE_RL_wci_cfwr && !WILL_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
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
  // rule RL_wsiS_peerIsReady__dreg_update
  assign CAN_FIRE_RL_wsiS_peerIsReady__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_peerIsReady__dreg_update = 1'd1 ;
  // rule RL_wsiS_operateD__dreg_update
  assign CAN_FIRE_RL_wsiS_operateD__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_operateD__dreg_update = 1'd1 ;
  // rule RL_wsiS_reqFifo_reset
  assign CAN_FIRE_RL_wsiS_reqFifo_reset =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_4 ||
	     wsiS_reqFifo_r_deq$whas ;
  assign WILL_FIRE_RL_wsiS_reqFifo_reset = CAN_FIRE_RL_wsiS_reqFifo_reset ;
  // rule RL_wsiS_reqFifo__updateLevelCounter
  assign CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_4 !=
	     wsiS_reqFifo_r_deq$whas ;
  assign WILL_FIRE_RL_wsiS_reqFifo__updateLevelCounter =
	     CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter ;
  // rule RL_wci_respF_deq
  assign CAN_FIRE_RL_wci_respF_deq = 1'd1 ;
  assign WILL_FIRE_RL_wci_respF_deq = 1'd1 ;
  // rule RL_wci_reqF_enq
  assign CAN_FIRE_RL_wci_reqF_enq = wci_wciReq$wget[59:57] != 3'd0 ;
  assign WILL_FIRE_RL_wci_reqF_enq = CAN_FIRE_RL_wci_reqF_enq ;
  // rule RL_wci_sThreadBusy_reg
  assign CAN_FIRE_RL_wci_sThreadBusy_reg = 1'd1 ;
  assign WILL_FIRE_RL_wci_sThreadBusy_reg = 1'd1 ;
  // rule RL_wci_ctlAckReg__dreg_update
  assign CAN_FIRE_RL_wci_ctlAckReg__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wci_ctlAckReg__dreg_update = 1'd1 ;
  // rule RL_wci_sFlagReg__dreg_update
  assign CAN_FIRE_RL_wci_sFlagReg__dreg_update = 1'd1 ;
  assign WILL_FIRE_RL_wci_sFlagReg__dreg_update = 1'd1 ;
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
  // inputs to muxes for submodule ports
  assign MUX_wci_illegalEdge$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge ;
  assign MUX_ddc_apbReqF$enq_1__VAL_1 = { 2'd2, wci_reqF$D_OUT[43:0] } ;
  assign MUX_ddc_apbReqF$enq_1__VAL_2 = { 2'd0, wci_reqF$D_OUT[43:0] } ;
  assign MUX_wci_illegalEdge$write_1__VAL_2 =
	     wci_reqF$D_OUT[36:34] != 3'd4 && wci_reqF$D_OUT[36:34] != 3'd5 &&
	     wci_reqF$D_OUT[36:34] != 3'd6 ;
  assign MUX_wci_respF_c_r$write_1__VAL_1 = wci_respF_c_r - 2'd1 ;
  assign MUX_wci_respF_c_r$write_1__VAL_2 = wci_respF_c_r + 2'd1 ;
  assign MUX_wci_respF_x_wire$wset_1__VAL_2 =
	     wci_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wci_respF_x_wire$wset_1__VAL_3 =
	     ddc_apbRespF$D_OUT[32] ?
	       34'h3C0DE4202 :
	       { 2'd1,
		 splitWriteInFlight ?
		   32'hC0DE4201 :
		   ddc_apbRespF$D_OUT[31:0] } ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_1 = wsiM_reqFifo_c_r - 2'd1 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_2 = wsiM_reqFifo_c_r + 2'd1 ;
  assign MUX_wsiM_reqFifo_x_wire$wset_1__VAL_1 =
	     { 3'd1,
	       unloadCnt == 16'd2047,
	       13'd6144,
	       x_data__h11943,
	       12'd3840 } ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_1 =
	     WILL_FIRE_RL_ddcEnable_doEgress ?
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
  assign MUX_ddc_apbReqF$enq_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[44] ;
  assign MUX_ddc_apbReqF$enq_1__SEL_2 =
	     WILL_FIRE_RL_wci_cfrd && wci_reqF$D_OUT[44] ;
  assign MUX_splitReadInFlight$write_1__SEL_1 =
	     WILL_FIRE_RL_advance_wci_response && splitReadInFlight ;
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
  assign MUX_wci_respF_x_wire$wset_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfrd && !wci_reqF$D_OUT[44] ;
  assign MUX_wci_respF_q_0$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_c_r == 2'd0 ;
  assign MUX_wci_respF_q_1$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_c_r == 2'd1 ;
  assign MUX_wsiS_reqFifo_levelsValid$write_1__SEL_4 =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_reqFifo$FULL_N ;
  assign MUX_wsiM_reqFifo_q_0$write_1__SEL_1 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__SEL_1 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ;
  assign MUX_wci_respF_x_wire$wset_1__VAL_1 = { 2'd1, x_data__h13030 } ;
  always@(MUX_wci_respF_x_wire$wset_1__SEL_1 or
	  MUX_wci_respF_x_wire$wset_1__VAL_1 or
	  WILL_FIRE_RL_wci_ctl_op_complete or
	  MUX_wci_respF_x_wire$wset_1__VAL_2 or
	  WILL_FIRE_RL_advance_wci_response or
	  MUX_wci_respF_x_wire$wset_1__VAL_3 or WILL_FIRE_RL_wci_cfwr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_respF_x_wire$wset_1__SEL_1:
	  MUX_wci_respF_q_0$write_1__VAL_1 =
	      MUX_wci_respF_x_wire$wset_1__VAL_1;
      WILL_FIRE_RL_wci_ctl_op_complete:
	  MUX_wci_respF_q_0$write_1__VAL_1 =
	      MUX_wci_respF_x_wire$wset_1__VAL_2;
      WILL_FIRE_RL_advance_wci_response:
	  MUX_wci_respF_q_0$write_1__VAL_1 =
	      MUX_wci_respF_x_wire$wset_1__VAL_3;
      WILL_FIRE_RL_wci_cfwr: MUX_wci_respF_q_0$write_1__VAL_1 = 34'h1C0DE4201;
      default: MUX_wci_respF_q_0$write_1__VAL_1 =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign MUX_wci_respF_q_0$write_1__VAL_2 =
	     (wci_respF_c_r == 2'd1) ?
	       MUX_wci_respF_q_0$write_1__VAL_1 :
	       wci_respF_q_1 ;
  assign MUX_wci_respF_q_1$write_1__VAL_2 =
	     (wci_respF_c_r == 2'd2) ?
	       MUX_wci_respF_q_0$write_1__VAL_1 :
	       34'h0AAAAAAAA ;
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
  assign wci_wci_cfrd_pw$whas =
	     wci_reqF$EMPTY_N && wci_reqF$D_OUT[56] &&
	     wci_reqF$D_OUT[59:57] == 3'd2 ;
  assign wci_wci_cfwr_pw$whas =
	     wci_reqF$EMPTY_N && wci_reqF$D_OUT[56] &&
	     wci_reqF$D_OUT[59:57] == 3'd1 ;
  assign wci_wci_ctrl_pw$whas =
	     wci_reqF$EMPTY_N && !wci_reqF$D_OUT[56] &&
	     wci_reqF$D_OUT[59:57] == 3'd2 ;
  assign wci_reqF_r_deq$whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_ctl_op_start ;
  assign wci_respF_enqueueing$whas =
	     WILL_FIRE_RL_wci_cfrd && !wci_reqF$D_OUT[44] ||
	     WILL_FIRE_RL_advance_wci_response ||
	     WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_ctl_op_complete ;
  assign wci_respF_x_wire$whas =
	     WILL_FIRE_RL_wci_cfrd && !wci_reqF$D_OUT[44] ||
	     WILL_FIRE_RL_wci_ctl_op_complete ||
	     WILL_FIRE_RL_advance_wci_response ||
	     WILL_FIRE_RL_wci_cfwr ;
  assign wci_wEdge$whas = WILL_FIRE_RL_wci_ctl_op_start ;
  assign wci_ctlAckReg_1$wget = 1'd1 ;
  assign wci_ctlAckReg_1$whas =
	     WILL_FIRE_RL_wci_ctrl_OrE || WILL_FIRE_RL_wci_ctrl_IsO ||
	     WILL_FIRE_RL_wci_ctrl_EiI ;
  assign wsiS_wsiReq$wget =
	     { wsiS0_MCmd,
	       wsiS0_MReqLast,
	       wsiS0_MBurstPrecise,
	       wsiS0_MBurstLength,
	       wsiS0_MData,
	       wsiS0_MByteEn,
	       wsiS0_MReqInfo } ;
  assign wsiS_wsiReq$whas = 1'd1 ;
  assign wsiS_reqFifo_r_enq$whas =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_4 ;
  assign wsiS_reqFifo_r_deq$whas =
	     WILL_FIRE_RL_ddcPass_bypass ||
	     WILL_FIRE_RL_ddcEnable_output_feedDDC ;
  assign wsiS_reqFifo_r_clr$whas = 1'b0 ;
  assign wsiS_reqFifo_doResetEnq$whas =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_4 ;
  assign wsiS_reqFifo_doResetDeq$whas = wsiS_reqFifo_r_deq$whas ;
  assign wsiS_reqFifo_doResetClr$whas = 1'b0 ;
  assign wsiS_operateD_1$wget = 1'd1 ;
  assign wsiS_operateD_1$whas = CAN_FIRE_RL_operating_actions ;
  assign wsiS_peerIsReady_1$wget = 1'd1 ;
  assign wsiS_peerIsReady_1$whas = wsiS0_MReset_n ;
  assign wsiS_sThreadBusy_dw$wget = wsiS_reqFifo_countReg > 2'd1 ;
  assign wsiS_sThreadBusy_dw$whas = CAN_FIRE_RL_wsiS_backpressure ;
  assign wsiS_extStatusW$wget =
	     { wsiS_pMesgCount, wsiS_iMesgCount, wsiS_tBusyCount } ;
  assign wsiM_reqFifo_enqueueing$whas =
	     WILL_FIRE_RL_ddcPass_bypass || WILL_FIRE_RL_ddcEnable_doEgress ;
  assign wsiM_reqFifo_x_wire$wget = MUX_wsiM_reqFifo_q_0$write_1__VAL_1 ;
  assign wsiM_reqFifo_x_wire$whas =
	     WILL_FIRE_RL_ddcEnable_doEgress || WILL_FIRE_RL_ddcPass_bypass ;
  assign wsiM_reqFifo_dequeueing$whas = CAN_FIRE_RL_wsiM_reqFifo_deq ;
  assign wsiM_operateD_1$wget = 1'd1 ;
  assign wsiM_sThreadBusy_pw$whas = wsiM0_SThreadBusy ;
  assign wsiM_operateD_1$whas = CAN_FIRE_RL_operating_actions ;
  assign wsiM_peerIsReady_1$wget = 1'd1 ;
  assign wsiM_peerIsReady_1$whas = wsiM0_SReset_n ;
  assign wsiM_extStatusW$wget =
	     { wsiM_pMesgCount, wsiM_iMesgCount, wsiM_tBusyCount } ;
  assign wci_respF_x_wire$wget = MUX_wci_respF_q_0$write_1__VAL_1 ;
  assign ddc_sDataValid_w$wget = 1'd1 ;
  assign ddc_sDataValid_w$whas = CAN_FIRE_RL_ddc_ddc_stream_ingress ;
  assign ddc_sDataR_w$wget = ddc_xnF$D_OUT ;
  assign ddc_sDataR_w$whas = CAN_FIRE_RL_ddc_ddc_stream_ingress ;
  assign ddc_mDataReady_w$wget = 1'd1 ;
  assign ddc_mDataReady_w$whas = CAN_FIRE_RL_ddc_ddc_stream_egress ;
  assign ddc_dataResetn_w$wget = 1'd1 ;
  assign ddc_dataResetn_w$whas = ddc_started ;
  assign ddc_sRegPaddr_w$wget = ddc_apbReqF$D_OUT[43:32] ;
  assign ddc_sRegPaddr_w$whas = CAN_FIRE_RL_ddc_sreg_request ;
  assign ddc_sRegPsel_w$wget = 1'd1 ;
  assign ddc_sRegPsel_w$whas = CAN_FIRE_RL_ddc_sreg_request ;
  assign ddc_sRegPenable_w$wget = ddc_reqSetup ;
  assign ddc_sRegPenable_w$whas = CAN_FIRE_RL_ddc_sreg_request ;
  assign ddc_sRegPwrite_w$wget = ddc_apbReqF$D_OUT[45] ;
  assign ddc_sRegPwrite_w$whas = CAN_FIRE_RL_ddc_sreg_request ;
  assign ddc_sRegPwdata_w$wget = ddc_apbReqF$D_OUT[31:0] ;
  assign ddc_sRegPwdata_w$whas = CAN_FIRE_RL_ddc_sreg_request ;
  assign wci_Es_mCmd_w$wget = wciS0_MCmd ;
  assign wci_Es_mCmd_w$whas = 1'd1 ;
  assign wci_Es_mAddrSpace_w$wget = wciS0_MAddrSpace ;
  assign wci_Es_mAddrSpace_w$whas = 1'd1 ;
  assign wci_Es_mAddr_w$wget = wciS0_MAddr ;
  assign wci_Es_mAddr_w$whas = 1'd1 ;
  assign wci_Es_mData_w$wget = wciS0_MData ;
  assign wci_Es_mData_w$whas = 1'd1 ;
  assign wci_Es_mByteEn_w$wget = wciS0_MByteEn ;
  assign wci_Es_mByteEn_w$whas = 1'd1 ;
  assign wsi_Es_mCmd_w$wget = wsiS0_MCmd ;
  assign wsi_Es_mCmd_w$whas = 1'd1 ;
  assign wsi_Es_mReqLast_w$whas = wsiS0_MReqLast ;
  assign wsi_Es_mBurstPrecise_w$whas = wsiS0_MBurstPrecise ;
  assign wsi_Es_mBurstLength_w$wget = wsiS0_MBurstLength ;
  assign wsi_Es_mBurstLength_w$whas = 1'd1 ;
  assign wsi_Es_mData_w$wget = wsiS0_MData ;
  assign wsi_Es_mData_w$whas = 1'd1 ;
  assign wsi_Es_mByteEn_w$wget = wsiS0_MByteEn ;
  assign wsi_Es_mByteEn_w$whas = 1'd1 ;
  assign wsi_Es_mReqInfo_w$wget = wsiS0_MReqInfo ;
  assign wsi_Es_mReqInfo_w$whas = 1'd1 ;
  assign wsi_Es_mDataInfo_w$whas = 1'd1 ;
  // register ambaErrCnt
  assign ambaErrCnt$D_IN = ambaErrCnt + 32'd1 ;
  assign ambaErrCnt$EN =
	     WILL_FIRE_RL_advance_wci_response && ddc_apbRespF$D_OUT[32] ;
  // register ambaRdReqCnt
  assign ambaRdReqCnt$D_IN = ambaRdReqCnt + 32'd1 ;
  assign ambaRdReqCnt$EN = MUX_ddc_apbReqF$enq_1__SEL_2 ;
  // register ambaRespCnt
  assign ambaRespCnt$D_IN = ambaRespCnt + 32'd1 ;
  assign ambaRespCnt$EN =
	     WILL_FIRE_RL_advance_wci_response && !ddc_apbRespF$D_OUT[32] ;
  // register ambaWrReqCnt
  assign ambaWrReqCnt$D_IN = ambaWrReqCnt + 32'd1 ;
  assign ambaWrReqCnt$EN = MUX_ddc_apbReqF$enq_1__SEL_1 ;
  // register ddcCtrl
  assign ddcCtrl$D_IN = wci_reqF$D_OUT[31:0] ;
  assign ddcCtrl$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[51:32] == 20'h00004 ;
  // register ddc_reqSetup
  assign ddc_reqSetup$D_IN = !ddc_reqSetup ;
  assign ddc_reqSetup$EN =
	     WILL_FIRE_RL_ddc_sreg_request &&
	     (ddc_ddc$sreg_pready || !ddc_reqSetup) ;
  // register ddc_started
  assign ddc_started$D_IN = 1'd1 ;
  assign ddc_started$EN = CAN_FIRE_RL_ddc_start ;
  // register outMesgCnt
  assign outMesgCnt$D_IN = outMesgCnt + 32'd1 ;
  assign outMesgCnt$EN =
	     WILL_FIRE_RL_ddcEnable_doEgress && unloadCnt == 16'd2047 ;
  // register splitReadInFlight
  assign splitReadInFlight$D_IN = !MUX_splitReadInFlight$write_1__SEL_1 ;
  assign splitReadInFlight$EN =
	     WILL_FIRE_RL_advance_wci_response && splitReadInFlight ||
	     WILL_FIRE_RL_wci_cfrd && wci_reqF$D_OUT[44] ;
  // register splitWriteInFlight
  assign splitWriteInFlight$D_IN = 1'd0 ;
  assign splitWriteInFlight$EN =
	     WILL_FIRE_RL_advance_wci_response && splitWriteInFlight ;
  // register takeEven
  assign takeEven$D_IN = !takeEven ;
  assign takeEven$EN = CAN_FIRE_RL_ddcEnable_doIngress ;
  // register unloadCnt
  assign unloadCnt$D_IN =
	     (unloadCnt == 16'd2047) ? 16'd0 : unloadCnt + 16'd1 ;
  assign unloadCnt$EN = CAN_FIRE_RL_ddcEnable_doEgress ;
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
  always@(MUX_wci_respF_q_0$write_1__SEL_1 or
	  MUX_wci_respF_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wci_respF_both or
	  MUX_wci_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wci_respF_decCtr or wci_respF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_respF_q_0$write_1__SEL_1:
	  wci_respF_q_0$D_IN = MUX_wci_respF_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wci_respF_both:
	  wci_respF_q_0$D_IN = MUX_wci_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wci_respF_decCtr: wci_respF_q_0$D_IN = wci_respF_q_1;
      default: wci_respF_q_0$D_IN = 34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_respF_q_0$EN =
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wci_respF_both ||
	     WILL_FIRE_RL_wci_respF_decCtr ;
  // register wci_respF_q_1
  always@(MUX_wci_respF_q_1$write_1__SEL_1 or
	  MUX_wci_respF_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wci_respF_both or
	  MUX_wci_respF_q_1$write_1__VAL_2 or WILL_FIRE_RL_wci_respF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_respF_q_1$write_1__SEL_1:
	  wci_respF_q_1$D_IN = MUX_wci_respF_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wci_respF_both:
	  wci_respF_q_1$D_IN = MUX_wci_respF_q_1$write_1__VAL_2;
      WILL_FIRE_RL_wci_respF_decCtr: wci_respF_q_1$D_IN = 34'h0AAAAAAAA;
      default: wci_respF_q_1$D_IN = 34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_respF_q_1$EN =
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wci_respF_both ||
	     WILL_FIRE_RL_wci_respF_decCtr ;
  // register wci_sFlagReg
  assign wci_sFlagReg$D_IN = 1'b0 ;
  assign wci_sFlagReg$EN = 1'd1 ;
  // register wci_sThreadBusy_d
  assign wci_sThreadBusy_d$D_IN = 1'b0 ;
  assign wci_sThreadBusy_d$EN = 1'd1 ;
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
  assign wsiM_peerIsReady$D_IN = wsiM0_SReset_n ;
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
	     wsiS_reqFifo_notFull__67_AND_wsiS_burstKind_47_ETC___d387 ;
  // register wsiS_errorSticky
  assign wsiS_errorSticky$D_IN = 1'd1 ;
  assign wsiS_errorSticky$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && !wsiS_reqFifo$FULL_N ;
  // register wsiS_iMesgCount
  assign wsiS_iMesgCount$D_IN = wsiS_iMesgCount + 32'd1 ;
  assign wsiS_iMesgCount$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_reqFifo$FULL_N &&
	     wsiS_burstKind == 2'd2 &&
	     wsiS_wsiReq$wget[57] ;
  // register wsiS_mesgWordLength
  assign wsiS_mesgWordLength$D_IN = wsiS_wordCount ;
  assign wsiS_mesgWordLength$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_reqFifo$FULL_N &&
	     wsiS_wsiReq$wget[57] ;
  // register wsiS_operateD
  assign wsiS_operateD$D_IN = CAN_FIRE_RL_operating_actions ;
  assign wsiS_operateD$EN = 1'd1 ;
  // register wsiS_pMesgCount
  assign wsiS_pMesgCount$D_IN = wsiS_pMesgCount + 32'd1 ;
  assign wsiS_pMesgCount$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_reqFifo$FULL_N &&
	     wsiS_burstKind == 2'd1 &&
	     wsiS_wsiReq$wget[57] ;
  // register wsiS_peerIsReady
  assign wsiS_peerIsReady$D_IN = wsiS0_MReset_n ;
  assign wsiS_peerIsReady$EN = 1'd1 ;
  // register wsiS_reqFifo_countReg
  assign wsiS_reqFifo_countReg$D_IN =
	     MUX_wsiS_reqFifo_levelsValid$write_1__SEL_4 ?
	       wsiS_reqFifo_countReg + 2'd1 :
	       wsiS_reqFifo_countReg - 2'd1 ;
  assign wsiS_reqFifo_countReg$EN =
	     CAN_FIRE_RL_wsiS_reqFifo__updateLevelCounter ;
  // register wsiS_reqFifo_levelsValid
  assign wsiS_reqFifo_levelsValid$D_IN = WILL_FIRE_RL_wsiS_reqFifo_reset ;
  assign wsiS_reqFifo_levelsValid$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_reqFifo$FULL_N ||
	     WILL_FIRE_RL_ddcPass_bypass ||
	     WILL_FIRE_RL_ddcEnable_output_feedDDC ||
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
  assign wsiS_trafficSticky$EN = MUX_wsiS_reqFifo_levelsValid$write_1__SEL_4 ;
  // register wsiS_wordCount
  assign wsiS_wordCount$D_IN =
	     wsiS_wsiReq$wget[57] ? 12'd1 : wsiS_wordCount + 12'd1 ;
  assign wsiS_wordCount$EN = MUX_wsiS_reqFifo_levelsValid$write_1__SEL_4 ;
  // submodule ddc_apbReqF
  assign ddc_apbReqF$D_IN =
	     MUX_ddc_apbReqF$enq_1__SEL_1 ?
	       MUX_ddc_apbReqF$enq_1__VAL_1 :
	       MUX_ddc_apbReqF$enq_1__VAL_2 ;
  assign ddc_apbReqF$DEQ =
	     WILL_FIRE_RL_ddc_sreg_request && ddc_reqSetup &&
	     ddc_ddc$sreg_pready ;
  assign ddc_apbReqF$ENQ =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[44] ||
	     WILL_FIRE_RL_wci_cfrd && wci_reqF$D_OUT[44] ;
  assign ddc_apbReqF$CLR = 1'b0 ;
  // submodule ddc_apbRespF
  assign ddc_apbRespF$D_IN = { ddc_ddc$sreg_pslverr, ddc_ddc$sreg_prdata } ;
  assign ddc_apbRespF$DEQ = WILL_FIRE_RL_advance_wci_response ;
  assign ddc_apbRespF$ENQ =
	     WILL_FIRE_RL_ddc_sreg_request && ddc_reqSetup &&
	     ddc_ddc$sreg_pready &&
	     !ddc_apbReqF$D_OUT[45] ;
  assign ddc_apbRespF$CLR = 1'b0 ;
  // submodule ddc_ddc
  assign ddc_ddc$data_resetn = ddc_started ;
  assign ddc_ddc$mdata_ready = CAN_FIRE_RL_ddc_ddc_stream_egress ;
  assign ddc_ddc$sdata_r =
	     CAN_FIRE_RL_ddc_ddc_stream_ingress ? ddc_xnF$D_OUT : 16'd0 ;
  assign ddc_ddc$sdata_valid = CAN_FIRE_RL_ddc_ddc_stream_ingress ;
  assign ddc_ddc$sreg_paddr =
	     CAN_FIRE_RL_ddc_sreg_request ? ddc_apbReqF$D_OUT[43:32] : 12'd0 ;
  assign ddc_ddc$sreg_penable = CAN_FIRE_RL_ddc_sreg_request && ddc_reqSetup ;
  assign ddc_ddc$sreg_psel = CAN_FIRE_RL_ddc_sreg_request ;
  assign ddc_ddc$sreg_pwdata =
	     CAN_FIRE_RL_ddc_sreg_request ? ddc_apbReqF$D_OUT[31:0] : 32'd0 ;
  assign ddc_ddc$sreg_pwrite =
	     CAN_FIRE_RL_ddc_sreg_request && ddc_apbReqF$D_OUT[45] ;
  // submodule ddc_xkF
  assign ddc_xkF$D_IN = { ddc_ddc$mdata_i, ddc_ddc$mdata_q } ;
  assign ddc_xkF$DEQ = CAN_FIRE_RL_ddcEnable_doEgress ;
  assign ddc_xkF$ENQ = CAN_FIRE_RL_ddc_ddc_stream_egress ;
  assign ddc_xkF$CLR = 1'b0 ;
  // submodule ddc_xnF
  assign ddc_xnF$D_IN = takeEven ? xnF$D_OUT[15:0] : xnF$D_OUT[31:16] ;
  assign ddc_xnF$DEQ = CAN_FIRE_RL_ddc_ddc_stream_ingress ;
  assign ddc_xnF$ENQ = CAN_FIRE_RL_ddcEnable_doIngress ;
  assign ddc_xnF$CLR = 1'b0 ;
  // submodule wci_reqF
  assign wci_reqF$D_IN = wci_wciReq$wget ;
  assign wci_reqF$DEQ = wci_reqF_r_deq$whas ;
  assign wci_reqF$ENQ = CAN_FIRE_RL_wci_reqF_enq ;
  assign wci_reqF$CLR = 1'b0 ;
  // submodule wsiS_reqFifo
  assign wsiS_reqFifo$D_IN = wsiS_wsiReq$wget ;
  assign wsiS_reqFifo$DEQ = wsiS_reqFifo_r_deq$whas ;
  assign wsiS_reqFifo$ENQ = MUX_wsiS_reqFifo_levelsValid$write_1__SEL_4 ;
  assign wsiS_reqFifo$CLR = 1'b0 ;
  // submodule xnF
  assign xnF$D_IN = wsiS_reqFifo$D_OUT[43:12] ;
  assign xnF$DEQ = WILL_FIRE_RL_ddcEnable_doIngress && !takeEven ;
  assign xnF$ENQ = CAN_FIRE_RL_ddcEnable_output_feedDDC ;
  assign xnF$CLR = 1'b0 ;
  // remaining internal signals
  assign ddcStatus__h12624 = { 24'd0, x__h13044 } ;
  assign rdat___1__h13067 = hasDebugLogic ? { 16'd0, x__h13071 } : 32'd0 ;
  assign rdat___1__h13146 =
	     hasDebugLogic ? wsiS_extStatusW$wget[95:64] : 32'd0 ;
  assign rdat___1__h13160 =
	     hasDebugLogic ? wsiS_extStatusW$wget[63:32] : 32'd0 ;
  assign rdat___1__h13168 =
	     hasDebugLogic ? wsiS_extStatusW$wget[31:0] : 32'd0 ;
  assign rdat___1__h13174 =
	     hasDebugLogic ? wsiM_extStatusW$wget[95:64] : 32'd0 ;
  assign rdat___1__h13188 =
	     hasDebugLogic ? wsiM_extStatusW$wget[63:32] : 32'd0 ;
  assign rdat___1__h13196 =
	     hasDebugLogic ? wsiM_extStatusW$wget[31:0] : 32'd0 ;
  assign rdat___1__h13202 = hasDebugLogic ? ambaWrReqCnt : 32'd0 ;
  assign rdat___1__h13209 = hasDebugLogic ? ambaRdReqCnt : 32'd0 ;
  assign rdat___1__h13215 = hasDebugLogic ? ambaRespCnt : 32'd0 ;
  assign rdat___1__h13222 = hasDebugLogic ? ambaErrCnt : 32'd0 ;
  assign rdat___1__h13229 = hasDebugLogic ? outMesgCnt : 32'd0 ;
  assign wci_reqF_i_notEmpty__7_AND_IF_wci_reqF_first___ETC___d65 =
	     wci_reqF$EMPTY_N &&
	     (wci_reqF$D_OUT[44] ?
		ddc_apbReqF$FULL_N :
		wci_respF_c_r != 2'd2) ;
  assign wsiS_reqFifo_notFull__67_AND_wsiS_burstKind_47_ETC___d387 =
	     wsiS_reqFifo$FULL_N &&
	     (wsiS_burstKind == 2'd0 ||
	      (wsiS_burstKind == 2'd1 || wsiS_burstKind == 2'd2) &&
	      wsiS_wsiReq$wget[57]) ;
  assign x__h13044 =
	     { ddc_ddc$int_missinput,
	       ddc_ddc$int_errpacket,
	       ddc_ddc$int_lostoutput,
	       ddc_ddc$int_ducddc,
	       3'b0,
	       hasDebugLogic } ;
  assign x__h13071 = { wsiS_statusR, wsiM_statusR } ;
  assign x_data__h11943 = { ddc_xkF$D_OUT[15:0], ddc_xkF$D_OUT[31:16] } ;
  assign x_data__h13030 =
	     wci_reqF$D_OUT[44] ?
	       32'd0 :
	       IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 ;
  always@(wci_reqF$D_OUT or
	  ddcStatus__h12624 or
	  ddcCtrl or
	  rdat___1__h13067 or
	  rdat___1__h13146 or
	  rdat___1__h13160 or
	  rdat___1__h13168 or
	  rdat___1__h13174 or
	  rdat___1__h13188 or
	  rdat___1__h13196 or
	  rdat___1__h13202 or
	  rdat___1__h13209 or
	  rdat___1__h13215 or rdat___1__h13222 or rdat___1__h13229)
  begin
    case (wci_reqF$D_OUT[51:32])
      20'h0:
	  IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 =
	      ddcStatus__h12624;
      20'h00004:
	  IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 = ddcCtrl;
      20'h00010:
	  IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 =
	      rdat___1__h13067;
      20'h00014:
	  IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 =
	      rdat___1__h13146;
      20'h00018:
	  IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 =
	      rdat___1__h13160;
      20'h0001C:
	  IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 =
	      rdat___1__h13168;
      20'h00020:
	  IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 =
	      rdat___1__h13174;
      20'h00024:
	  IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 =
	      rdat___1__h13188;
      20'h00028:
	  IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 =
	      rdat___1__h13196;
      20'h0002C:
	  IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 =
	      rdat___1__h13202;
      20'h00030:
	  IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 =
	      rdat___1__h13209;
      20'h00034:
	  IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 =
	      rdat___1__h13215;
      20'h00038:
	  IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 =
	      rdat___1__h13222;
      20'h0003C:
	  IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 =
	      rdat___1__h13229;
      default: IF_wci_reqF_first__8_BITS_51_TO_32_3_EQ_0x0_4__ETC___d136 =
		   32'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (!wciS0_MReset_n)
      begin
        ambaErrCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
	ambaRdReqCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
	ambaRespCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
	ambaWrReqCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
	ddcCtrl <= `BSV_ASSIGNMENT_DELAY ddcCtrlInit;
	ddc_reqSetup <= `BSV_ASSIGNMENT_DELAY 1'd0;
	ddc_started <= `BSV_ASSIGNMENT_DELAY 1'd0;
	outMesgCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
	splitReadInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	splitWriteInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	takeEven <= `BSV_ASSIGNMENT_DELAY 1'd1;
	unloadCnt <= `BSV_ASSIGNMENT_DELAY 16'd0;
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
        if (ambaErrCnt$EN)
	  ambaErrCnt <= `BSV_ASSIGNMENT_DELAY ambaErrCnt$D_IN;
	if (ambaRdReqCnt$EN)
	  ambaRdReqCnt <= `BSV_ASSIGNMENT_DELAY ambaRdReqCnt$D_IN;
	if (ambaRespCnt$EN)
	  ambaRespCnt <= `BSV_ASSIGNMENT_DELAY ambaRespCnt$D_IN;
	if (ambaWrReqCnt$EN)
	  ambaWrReqCnt <= `BSV_ASSIGNMENT_DELAY ambaWrReqCnt$D_IN;
	if (ddcCtrl$EN) ddcCtrl <= `BSV_ASSIGNMENT_DELAY ddcCtrl$D_IN;
	if (ddc_reqSetup$EN)
	  ddc_reqSetup <= `BSV_ASSIGNMENT_DELAY ddc_reqSetup$D_IN;
	if (ddc_started$EN)
	  ddc_started <= `BSV_ASSIGNMENT_DELAY ddc_started$D_IN;
	if (outMesgCnt$EN)
	  outMesgCnt <= `BSV_ASSIGNMENT_DELAY outMesgCnt$D_IN;
	if (splitReadInFlight$EN)
	  splitReadInFlight <= `BSV_ASSIGNMENT_DELAY splitReadInFlight$D_IN;
	if (splitWriteInFlight$EN)
	  splitWriteInFlight <= `BSV_ASSIGNMENT_DELAY splitWriteInFlight$D_IN;
	if (takeEven$EN) takeEven <= `BSV_ASSIGNMENT_DELAY takeEven$D_IN;
	if (unloadCnt$EN) unloadCnt <= `BSV_ASSIGNMENT_DELAY unloadCnt$D_IN;
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
    ambaErrCnt = 32'hAAAAAAAA;
    ambaRdReqCnt = 32'hAAAAAAAA;
    ambaRespCnt = 32'hAAAAAAAA;
    ambaWrReqCnt = 32'hAAAAAAAA;
    ddcCtrl = 32'hAAAAAAAA;
    ddc_reqSetup = 1'h0;
    ddc_started = 1'h0;
    outMesgCnt = 32'hAAAAAAAA;
    splitReadInFlight = 1'h0;
    splitWriteInFlight = 1'h0;
    takeEven = 1'h0;
    unloadCnt = 16'hAAAA;
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
	  v__h3675 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3675,
		 wci_reqF$D_OUT[36:34],
		 wci_cState);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	begin
	  v__h12747 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	$display("[%0d]: %m: Starting DDC ddcCtrl:%0x", v__h12747, ddcCtrl);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/DDCWorker.bsv\", line 156, column 8: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_IsO and RL_wci_ctrl_EiI fired in the\n  same clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_OrE && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/DDCWorker.bsv\", line 162, column 8: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_OrE and RL_wci_ctrl_IsO fired in the\n  same clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_OrE && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/DDCWorker.bsv\", line 162, column 8: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_OrE and RL_wci_ctrl_EiI fired in the\n  same clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/DDCWorker.bsv\", line 126, column 8: (R0001)\n  Mutually exclusive rules RL_wci_cfrd and RL_wci_ctrl_OrE fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/DDCWorker.bsv\", line 126, column 8: (R0001)\n  Mutually exclusive rules RL_wci_cfrd and RL_wci_ctrl_IsO fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/DDCWorker.bsv\", line 126, column 8: (R0001)\n  Mutually exclusive rules RL_wci_cfrd and RL_wci_ctrl_EiI fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	begin
	  v__h2776 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h2776,
		 wci_cEdge,
		 wci_cState);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	begin
	  v__h2629 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h2629,
		 wci_cEdge,
		 wci_cState,
		 wci_nState);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/DDCWorker.bsv\", line 108, column 8: (R0001)\n  Mutually exclusive rules RL_wci_cfwr and RL_wci_ctrl_OrE fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/DDCWorker.bsv\", line 108, column 8: (R0001)\n  Mutually exclusive rules RL_wci_cfwr and RL_wci_ctrl_IsO fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/DDCWorker.bsv\", line 108, column 8: (R0001)\n  Mutually exclusive rules RL_wci_cfwr and RL_wci_ctrl_EiI fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/DDCWorker.bsv\", line 108, column 8: (R0001)\n  Mutually exclusive rules RL_wci_cfwr and RL_wci_cfrd fired in the same clock\n  cycle.\n");
  end
  // synopsys translate_on
endmodule