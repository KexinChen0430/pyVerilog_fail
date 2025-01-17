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
`define NOT_EMPTY_psd.v
`include "psd_defs.v"
`endif
  // inlined wires
  wire [95 : 0] wsiM_extStatusW$wget, wsiS_extStatusW$wget;
  wire [60 : 0] wsiM_reqFifo_x_wire$wget, wsiS_wsiReq$wget;
  wire [59 : 0] wci_wciReq$wget;
  wire [33 : 0] wci_respF_x_wire$wget;
  wire [31 : 0] w2p_dataF_wDataIn$wget,
		w2p_dataF_wDataOut$wget,
		wci_Es_mData_w$wget,
		wsi_Es_mData_w$wget;
  wire [19 : 0] wci_Es_mAddr_w$wget;
  wire [15 : 0] fft_xnIm_w$wget, fft_xnRe_w$wget;
  wire [11 : 0] fft_scale_w$wget, wsi_Es_mBurstLength_w$wget;
  wire [7 : 0] wsi_Es_mReqInfo_w$wget;
  wire [3 : 0] wci_Es_mByteEn_w$wget, wsi_Es_mByteEn_w$wget;
  wire [2 : 0] wci_Es_mCmd_w$wget, wci_wEdge$wget, wsi_Es_mCmd_w$wget;
  wire fft_fwd_w$wget,
       fft_fwd_w$whas,
       fft_fwd_we_w$wget,
       fft_fwd_we_w$whas,
       fft_scale_w$whas,
       fft_scale_we_w$wget,
       fft_scale_we_w$whas,
       fft_start_w$wget,
       fft_start_w$whas,
       fft_xnIm_w$whas,
       fft_xnRe_w$whas,
       w2p_dataF_pwDequeue$whas,
       w2p_dataF_pwEnqueue$whas,
       w2p_dataF_wDataIn$whas,
       w2p_dataF_wDataOut$whas,
       w2p_operateW$wget,
       w2p_operateW$whas,
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
  // register evenMag
  reg [15 : 0] evenMag;
  wire [15 : 0] evenMag$D_IN;
  wire evenMag$EN;
  // register fft_fftStarted
  reg fft_fftStarted;
  wire fft_fftStarted$D_IN, fft_fftStarted$EN;
  // register fft_loadFrames
  reg [15 : 0] fft_loadFrames;
  wire [15 : 0] fft_loadFrames$D_IN;
  wire fft_loadFrames$EN;
  // register fft_loadIndex
  reg [15 : 0] fft_loadIndex;
  wire [15 : 0] fft_loadIndex$D_IN;
  wire fft_loadIndex$EN;
  // register fft_unloadFrames
  reg [15 : 0] fft_unloadFrames;
  wire [15 : 0] fft_unloadFrames$D_IN;
  wire fft_unloadFrames$EN;
  // register fft_unloadIndex
  reg [15 : 0] fft_unloadIndex;
  wire [15 : 0] fft_unloadIndex$D_IN;
  wire fft_unloadIndex$EN;
  // register psdCtrl
  reg [31 : 0] psdCtrl;
  wire [31 : 0] psdCtrl$D_IN;
  wire psdCtrl$EN;
  // register sendEven
  reg sendEven;
  wire sendEven$D_IN, sendEven$EN;
  // register takeEven
  reg takeEven;
  wire takeEven$D_IN, takeEven$EN;
  // register unloadCnt
  reg [15 : 0] unloadCnt;
  wire [15 : 0] unloadCnt$D_IN;
  wire unloadCnt$EN;
  // register w2p_dataF_rCache
  reg [45 : 0] w2p_dataF_rCache;
  wire [45 : 0] w2p_dataF_rCache$D_IN;
  wire w2p_dataF_rCache$EN;
  // register w2p_dataF_rRdPtr
  reg [12 : 0] w2p_dataF_rRdPtr;
  wire [12 : 0] w2p_dataF_rRdPtr$D_IN;
  wire w2p_dataF_rRdPtr$EN;
  // register w2p_dataF_rWrPtr
  reg [12 : 0] w2p_dataF_rWrPtr;
  wire [12 : 0] w2p_dataF_rWrPtr$D_IN;
  wire w2p_dataF_rWrPtr$EN;
  // register w2p_wordsDequed
  reg [15 : 0] w2p_wordsDequed;
  wire [15 : 0] w2p_wordsDequed$D_IN;
  wire w2p_wordsDequed$EN;
  // register w2p_wordsEnqued
  reg [15 : 0] w2p_wordsEnqued;
  wire [15 : 0] w2p_wordsEnqued$D_IN;
  wire w2p_wordsEnqued$EN;
  // register w2p_wordsExact
  reg [15 : 0] w2p_wordsExact;
  wire [15 : 0] w2p_wordsExact$D_IN;
  wire w2p_wordsExact$EN;
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
  // ports of submodule fft_fft
  wire [15 : 0] fft_fft$xk_im, fft_fft$xk_re, fft_fft$xn_im, fft_fft$xn_re;
  wire [11 : 0] fft_fft$scale_sch;
  wire fft_fft$dv,
       fft_fft$fwd_inv,
       fft_fft$fwd_inv_we,
       fft_fft$rfd,
       fft_fft$scale_sch_we,
       fft_fft$start;
  // ports of submodule fft_xkF
  wire [31 : 0] fft_xkF$D_IN, fft_xkF$D_OUT;
  wire fft_xkF$CLR, fft_xkF$DEQ, fft_xkF$EMPTY_N, fft_xkF$ENQ, fft_xkF$FULL_N;
  // ports of submodule fft_xnF
  wire [31 : 0] fft_xnF$D_IN, fft_xnF$D_OUT;
  wire fft_xnF$CLR, fft_xnF$DEQ, fft_xnF$EMPTY_N, fft_xnF$ENQ, fft_xnF$FULL_N;
  // ports of submodule w2p_dataF_memory
  wire [31 : 0] w2p_dataF_memory$DIA,
		w2p_dataF_memory$DIB,
		w2p_dataF_memory$DOB;
  wire [11 : 0] w2p_dataF_memory$ADDRA, w2p_dataF_memory$ADDRB;
  wire w2p_dataF_memory$ENA,
       w2p_dataF_memory$ENB,
       w2p_dataF_memory$WEA,
       w2p_dataF_memory$WEB;
  // ports of submodule w2p_inF
  wire [60 : 0] w2p_inF$D_IN, w2p_inF$D_OUT;
  wire w2p_inF$CLR, w2p_inF$DEQ, w2p_inF$EMPTY_N, w2p_inF$ENQ, w2p_inF$FULL_N;
  // ports of submodule w2p_outF
  wire [60 : 0] w2p_outF$D_IN, w2p_outF$D_OUT;
  wire w2p_outF$CLR,
       w2p_outF$DEQ,
       w2p_outF$EMPTY_N,
       w2p_outF$ENQ,
       w2p_outF$FULL_N;
  // ports of submodule w2p_reqF
  wire [7 : 0] w2p_reqF$D_IN, w2p_reqF$D_OUT;
  wire w2p_reqF$CLR,
       w2p_reqF$DEQ,
       w2p_reqF$EMPTY_N,
       w2p_reqF$ENQ,
       w2p_reqF$FULL_N;
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
  wire CAN_FIRE_RL_fft_drive_fft_always_enabled,
       CAN_FIRE_RL_fft_fft_stream_egress,
       CAN_FIRE_RL_fft_fft_stream_ingress,
       CAN_FIRE_RL_fft_frame_start,
       CAN_FIRE_RL_operating_actions,
       CAN_FIRE_RL_psdFFT_doEgress,
       CAN_FIRE_RL_psdFFT_doIngress,
       CAN_FIRE_RL_psdPass_bypass,
       CAN_FIRE_RL_psdPrecise_input,
       CAN_FIRE_RL_psdPrecise_output_bypassFFT,
       CAN_FIRE_RL_psdPrecise_output_feedFFT,
       CAN_FIRE_RL_w2p_dataF_portA,
       CAN_FIRE_RL_w2p_dataF_portB,
       CAN_FIRE_RL_w2p_dataF_portB_read_data,
       CAN_FIRE_RL_w2p_imprecise_enq,
       CAN_FIRE_RL_w2p_precise_deq,
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
       WILL_FIRE_RL_fft_drive_fft_always_enabled,
       WILL_FIRE_RL_fft_fft_stream_egress,
       WILL_FIRE_RL_fft_fft_stream_ingress,
       WILL_FIRE_RL_fft_frame_start,
       WILL_FIRE_RL_operating_actions,
       WILL_FIRE_RL_psdFFT_doEgress,
       WILL_FIRE_RL_psdFFT_doIngress,
       WILL_FIRE_RL_psdPass_bypass,
       WILL_FIRE_RL_psdPrecise_input,
       WILL_FIRE_RL_psdPrecise_output_bypassFFT,
       WILL_FIRE_RL_psdPrecise_output_feedFFT,
       WILL_FIRE_RL_w2p_dataF_portA,
       WILL_FIRE_RL_w2p_dataF_portB,
       WILL_FIRE_RL_w2p_dataF_portB_read_data,
       WILL_FIRE_RL_w2p_imprecise_enq,
       WILL_FIRE_RL_w2p_precise_deq,
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
  reg [60 : 0] MUX_wsiM_reqFifo_q_0$write_1__VAL_1;
  reg [33 : 0] MUX_wci_respF_q_0$write_1__VAL_1;
  wire [60 : 0] MUX_wsiM_reqFifo_q_0$write_1__VAL_2,
		MUX_wsiM_reqFifo_q_1$write_1__VAL_2,
		MUX_wsiM_reqFifo_x_wire$wset_1__VAL_1;
  wire [33 : 0] MUX_wci_respF_q_0$write_1__VAL_2,
		MUX_wci_respF_q_1$write_1__VAL_2,
		MUX_wci_respF_x_wire$wset_1__VAL_1,
		MUX_wci_respF_x_wire$wset_1__VAL_2;
  wire [1 : 0] MUX_wci_respF_c_r$write_1__VAL_1,
	       MUX_wci_respF_c_r$write_1__VAL_2,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_1,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_2;
  wire MUX_fft_fftStarted$write_1__SEL_1,
       MUX_wci_illegalEdge$write_1__SEL_1,
       MUX_wci_illegalEdge$write_1__SEL_2,
       MUX_wci_illegalEdge$write_1__VAL_2,
       MUX_wci_respF_q_0$write_1__SEL_1,
       MUX_wci_respF_q_1$write_1__SEL_1,
       MUX_wsiM_reqFifo_q_0$write_1__SEL_1,
       MUX_wsiM_reqFifo_q_1$write_1__SEL_1,
       MUX_wsiM_reqFifo_x_wire$wset_1__SEL_1,
       MUX_wsiS_reqFifo_levelsValid$write_1__SEL_4;
  // remaining internal signals
  reg [63 : 0] v__h14361, v__h2625, v__h2772, v__h3671;
  reg [31 : 0] x_data__h14493;
  wire [31 : 0] psdStatus__h14238,
		rdat__h14517,
		rdat__h14617,
		rdat__h14631,
		rdat__h14639,
		rdat__h14645,
		rdat__h14659,
		rdat__h14667,
		rdat__h14673,
		x__h7434,
		x_data__h13251,
		x_data__h7856,
		x_fftFrameCounts__h12666;
  wire [15 : 0] IF_IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_ETC___d140,
		IF_IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_ETC___d646,
		IF_fft_xkF_first__25_BIT_15_30_THEN_NEG_fft_xk_ETC___d137,
		IF_fft_xkF_first__25_BIT_15_30_THEN_NEG_fft_xk_ETC___d644,
		IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_xk_ETC___d135,
		IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_xk_ETC___d643,
		dReal__h13383,
		result__h13444,
		w2p_wordsExact_28_MINUS_1___d645,
		x__h13415,
		x__h14521;
  wire [12 : 0] x__h7326;
  wire NOT_w2p_dataF_rRdPtr_11_PLUS_2048_39_EQ_w2p_da_ETC___d349,
       w2p_wordsDequed_27_EQ_w2p_wordsExact_28_MINUS__ETC___d608,
       w2p_wordsEnqued_43_EQ_w2p_wordsExact_28_MINUS__ETC___d674,
       wsiS_reqFifo_notFull__03_AND_wsiS_burstKind_83_ETC___d423;
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
  // submodule fft_fft
  xfft_v7_1 fft_fft(.clk(wciS0_Clk),
		    .fwd_inv(fft_fft$fwd_inv),
		    .fwd_inv_we(fft_fft$fwd_inv_we),
		    .scale_sch(fft_fft$scale_sch),
		    .scale_sch_we(fft_fft$scale_sch_we),
		    .start(fft_fft$start),
		    .xn_im(fft_fft$xn_im),
		    .xn_re(fft_fft$xn_re),
		    .busy(),
		    .dv(fft_fft$dv),
		    .rfd(fft_fft$rfd),
		    .edone(),
		    .done(),
		    .xn_index(),
		    .xk_re(fft_fft$xk_re),
		    .xk_im(fft_fft$xk_im),
		    .xk_index());
  // submodule fft_xkF
  FIFO2 #(.width(32'd32), .guarded(32'd1)) fft_xkF(.RST_N(wciS0_MReset_n),
						   .CLK(wciS0_Clk),
						   .D_IN(fft_xkF$D_IN),
						   .ENQ(fft_xkF$ENQ),
						   .DEQ(fft_xkF$DEQ),
						   .CLR(fft_xkF$CLR),
						   .D_OUT(fft_xkF$D_OUT),
						   .FULL_N(fft_xkF$FULL_N),
						   .EMPTY_N(fft_xkF$EMPTY_N));
  // submodule fft_xnF
  FIFO2 #(.width(32'd32), .guarded(32'd1)) fft_xnF(.RST_N(wciS0_MReset_n),
						   .CLK(wciS0_Clk),
						   .D_IN(fft_xnF$D_IN),
						   .ENQ(fft_xnF$ENQ),
						   .DEQ(fft_xnF$DEQ),
						   .CLR(fft_xnF$CLR),
						   .D_OUT(fft_xnF$D_OUT),
						   .FULL_N(fft_xnF$FULL_N),
						   .EMPTY_N(fft_xnF$EMPTY_N));
  // submodule w2p_dataF_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd12),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(13'd4096)) w2p_dataF_memory(.CLKA(wciS0_Clk),
					       .CLKB(wciS0_Clk),
					       .ADDRA(w2p_dataF_memory$ADDRA),
					       .ADDRB(w2p_dataF_memory$ADDRB),
					       .DIA(w2p_dataF_memory$DIA),
					       .DIB(w2p_dataF_memory$DIB),
					       .WEA(w2p_dataF_memory$WEA),
					       .WEB(w2p_dataF_memory$WEB),
					       .ENA(w2p_dataF_memory$ENA),
					       .ENB(w2p_dataF_memory$ENB),
					       .DOA(),
					       .DOB(w2p_dataF_memory$DOB));
  // submodule w2p_inF
  FIFO2 #(.width(32'd61), .guarded(32'd1)) w2p_inF(.RST_N(wciS0_MReset_n),
						   .CLK(wciS0_Clk),
						   .D_IN(w2p_inF$D_IN),
						   .ENQ(w2p_inF$ENQ),
						   .DEQ(w2p_inF$DEQ),
						   .CLR(w2p_inF$CLR),
						   .D_OUT(w2p_inF$D_OUT),
						   .FULL_N(w2p_inF$FULL_N),
						   .EMPTY_N(w2p_inF$EMPTY_N));
  // submodule w2p_outF
  FIFO2 #(.width(32'd61), .guarded(32'd1)) w2p_outF(.RST_N(wciS0_MReset_n),
						    .CLK(wciS0_Clk),
						    .D_IN(w2p_outF$D_IN),
						    .ENQ(w2p_outF$ENQ),
						    .DEQ(w2p_outF$DEQ),
						    .CLR(w2p_outF$CLR),
						    .D_OUT(w2p_outF$D_OUT),
						    .FULL_N(w2p_outF$FULL_N),
						    .EMPTY_N(w2p_outF$EMPTY_N));
  // submodule w2p_reqF
  FIFO2 #(.width(32'd8), .guarded(32'd1)) w2p_reqF(.RST_N(wciS0_MReset_n),
						   .CLK(wciS0_Clk),
						   .D_IN(w2p_reqF$D_IN),
						   .ENQ(w2p_reqF$ENQ),
						   .DEQ(w2p_reqF$DEQ),
						   .CLR(w2p_reqF$CLR),
						   .D_OUT(w2p_reqF$D_OUT),
						   .FULL_N(w2p_reqF$FULL_N),
						   .EMPTY_N(w2p_reqF$EMPTY_N));
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
  // rule RL_psdFFT_doEgress
  assign CAN_FIRE_RL_psdFFT_doEgress =
	     fft_xkF$EMPTY_N && (sendEven || wsiM_reqFifo_c_r != 2'd2) &&
	     wci_cState == 3'd2 &&
	     psdCtrl[1:0] == 2'd2 ;
  assign WILL_FIRE_RL_psdFFT_doEgress = CAN_FIRE_RL_psdFFT_doEgress ;
  // rule RL_psdPrecise_output_feedFFT
  assign CAN_FIRE_RL_psdPrecise_output_feedFFT =
	     w2p_outF$EMPTY_N && xnF$FULL_N && wci_cState == 3'd2 &&
	     psdCtrl[1:0] == 2'd2 ;
  assign WILL_FIRE_RL_psdPrecise_output_feedFFT =
	     CAN_FIRE_RL_psdPrecise_output_feedFFT ;
  // rule RL_psdPrecise_output_bypassFFT
  assign CAN_FIRE_RL_psdPrecise_output_bypassFFT =
	     wsiM_reqFifo_c_r != 2'd2 && w2p_outF$EMPTY_N &&
	     wci_cState == 3'd2 &&
	     psdCtrl[1:0] == 2'd1 ;
  assign WILL_FIRE_RL_psdPrecise_output_bypassFFT =
	     CAN_FIRE_RL_psdPrecise_output_bypassFFT ;
  // rule RL_operating_actions
  assign CAN_FIRE_RL_operating_actions = wci_cState == 3'd2 ;
  assign WILL_FIRE_RL_operating_actions = CAN_FIRE_RL_operating_actions ;
  // rule RL_fft_frame_start
  assign CAN_FIRE_RL_fft_frame_start = fft_xnF$EMPTY_N && !fft_fftStarted ;
  assign WILL_FIRE_RL_fft_frame_start = CAN_FIRE_RL_fft_frame_start ;
  // rule RL_psdFFT_doIngress
  assign CAN_FIRE_RL_psdFFT_doIngress =
	     fft_xnF$FULL_N && xnF$EMPTY_N && wci_cState == 3'd2 &&
	     psdCtrl[1:0] == 2'd2 ;
  assign WILL_FIRE_RL_psdFFT_doIngress = CAN_FIRE_RL_psdFFT_doIngress ;
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
  // rule RL_w2p_dataF_portB_read_data
  assign CAN_FIRE_RL_w2p_dataF_portB_read_data = 1'd1 ;
  assign WILL_FIRE_RL_w2p_dataF_portB_read_data = 1'd1 ;
  // rule RL_w2p_precise_deq
  assign CAN_FIRE_RL_w2p_precise_deq =
	     w2p_dataF_rRdPtr != w2p_dataF_rWrPtr && w2p_outF$FULL_N &&
	     w2p_reqF$EMPTY_N &&
	     wci_cState == 3'd2 &&
	     w2p_reqF$EMPTY_N ;
  assign WILL_FIRE_RL_w2p_precise_deq = CAN_FIRE_RL_w2p_precise_deq ;
  // rule RL_w2p_imprecise_enq
  assign CAN_FIRE_RL_w2p_imprecise_enq =
	     NOT_w2p_dataF_rRdPtr_11_PLUS_2048_39_EQ_w2p_da_ETC___d349 &&
	     wci_cState == 3'd2 ;
  assign WILL_FIRE_RL_w2p_imprecise_enq = CAN_FIRE_RL_w2p_imprecise_enq ;
  // rule RL_w2p_dataF_portB
  assign CAN_FIRE_RL_w2p_dataF_portB = 1'd1 ;
  assign WILL_FIRE_RL_w2p_dataF_portB = 1'd1 ;
  // rule RL_w2p_dataF_portA
  assign CAN_FIRE_RL_w2p_dataF_portA = 1'd1 ;
  assign WILL_FIRE_RL_w2p_dataF_portA = 1'd1 ;
  // rule RL_wsiS_update_statusR
  assign CAN_FIRE_RL_wsiS_update_statusR = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_update_statusR = 1'd1 ;
  // rule RL_wsiS_ext_status_assign
  assign CAN_FIRE_RL_wsiS_ext_status_assign = 1'd1 ;
  assign WILL_FIRE_RL_wsiS_ext_status_assign = 1'd1 ;
  // rule RL_wci_cfrd
  assign CAN_FIRE_RL_wci_cfrd =
	     wci_reqF$EMPTY_N && wci_respF_c_r != 2'd2 &&
	     wci_wci_cfrd_pw$whas ;
  assign WILL_FIRE_RL_wci_cfrd =
	     CAN_FIRE_RL_wci_cfrd && !WILL_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_fft_fft_stream_egress
  assign CAN_FIRE_RL_fft_fft_stream_egress = fft_xkF$FULL_N && fft_fft$dv ;
  assign WILL_FIRE_RL_fft_fft_stream_egress =
	     CAN_FIRE_RL_fft_fft_stream_egress ;
  // rule RL_fft_fft_stream_ingress
  assign CAN_FIRE_RL_fft_fft_stream_ingress =
	     fft_xnF$EMPTY_N && fft_fft$rfd && fft_fftStarted ;
  assign WILL_FIRE_RL_fft_fft_stream_ingress =
	     CAN_FIRE_RL_fft_fft_stream_ingress ;
  // rule RL_fft_drive_fft_always_enabled
  assign CAN_FIRE_RL_fft_drive_fft_always_enabled = 1'd1 ;
  assign WILL_FIRE_RL_fft_drive_fft_always_enabled = 1'd1 ;
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
  // rule RL_psdPrecise_input
  assign CAN_FIRE_RL_psdPrecise_input =
	     wsiS_reqFifo$EMPTY_N && w2p_inF$FULL_N && wci_cState == 3'd2 &&
	     (psdCtrl[1:0] == 2'd1 || psdCtrl[1:0] == 2'd2) ;
  assign WILL_FIRE_RL_psdPrecise_input = CAN_FIRE_RL_psdPrecise_input ;
  // rule RL_psdPass_bypass
  assign CAN_FIRE_RL_psdPass_bypass =
	     wsiM_reqFifo_c_r != 2'd2 && wsiS_reqFifo$EMPTY_N &&
	     wci_cState == 3'd2 &&
	     psdCtrl[1:0] == 2'd0 ;
  assign WILL_FIRE_RL_psdPass_bypass = CAN_FIRE_RL_psdPass_bypass ;
  // rule RL_wci_ctl_op_complete
  assign CAN_FIRE_RL_wci_ctl_op_complete =
	     wci_respF_c_r != 2'd2 && wci_ctlOpActive && wci_ctlAckReg ;
  assign WILL_FIRE_RL_wci_ctl_op_complete = CAN_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_cfwr
  assign CAN_FIRE_RL_wci_cfwr =
	     wci_reqF$EMPTY_N && wci_respF_c_r != 2'd2 &&
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
  assign MUX_fft_fftStarted$write_1__SEL_1 =
	     WILL_FIRE_RL_fft_fft_stream_ingress &&
	     fft_loadIndex == 16'd4095 ;
  assign MUX_wci_illegalEdge$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge ;
  assign MUX_wsiM_reqFifo_x_wire$wset_1__SEL_1 =
	     WILL_FIRE_RL_psdFFT_doEgress && !sendEven ;
  assign MUX_wci_illegalEdge$write_1__VAL_2 =
	     wci_reqF$D_OUT[36:34] != 3'd4 && wci_reqF$D_OUT[36:34] != 3'd5 &&
	     wci_reqF$D_OUT[36:34] != 3'd6 ;
  assign MUX_wci_respF_c_r$write_1__VAL_1 = wci_respF_c_r - 2'd1 ;
  assign MUX_wci_respF_c_r$write_1__VAL_2 = wci_respF_c_r + 2'd1 ;
  assign MUX_wci_respF_x_wire$wset_1__VAL_1 =
	     wci_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_1 = wsiM_reqFifo_c_r - 2'd1 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_2 = wsiM_reqFifo_c_r + 2'd1 ;
  assign MUX_wsiM_reqFifo_x_wire$wset_1__VAL_1 =
	     { 3'd1,
	       unloadCnt == 16'd4095,
	       13'd6144,
	       x_data__h13251,
	       12'd3840 } ;
  always@(MUX_wsiM_reqFifo_x_wire$wset_1__SEL_1 or
	  MUX_wsiM_reqFifo_x_wire$wset_1__VAL_1 or
	  WILL_FIRE_RL_psdPrecise_output_bypassFFT or
	  w2p_outF$D_OUT or WILL_FIRE_RL_psdPass_bypass or wsiS_reqFifo$D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wsiM_reqFifo_x_wire$wset_1__SEL_1:
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_1 =
	      MUX_wsiM_reqFifo_x_wire$wset_1__VAL_1;
      WILL_FIRE_RL_psdPrecise_output_bypassFFT:
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_1 = w2p_outF$D_OUT;
      WILL_FIRE_RL_psdPass_bypass:
	  MUX_wsiM_reqFifo_q_0$write_1__VAL_1 = wsiS_reqFifo$D_OUT;
      default: MUX_wsiM_reqFifo_q_0$write_1__VAL_1 =
		   61'h0AAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_2 =
	     (wsiM_reqFifo_c_r == 2'd1) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_1 :
	       wsiM_reqFifo_q_1 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__VAL_2 =
	     (wsiM_reqFifo_c_r == 2'd2) ?
	       MUX_wsiM_reqFifo_q_0$write_1__VAL_1 :
	       61'h00000AAAAAAAAA00 ;
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
  assign MUX_wci_respF_x_wire$wset_1__VAL_2 = { 2'd1, x_data__h14493 } ;
  always@(WILL_FIRE_RL_wci_ctl_op_complete or
	  MUX_wci_respF_x_wire$wset_1__VAL_1 or
	  WILL_FIRE_RL_wci_cfrd or
	  MUX_wci_respF_x_wire$wset_1__VAL_2 or WILL_FIRE_RL_wci_cfwr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wci_ctl_op_complete:
	  MUX_wci_respF_q_0$write_1__VAL_1 =
	      MUX_wci_respF_x_wire$wset_1__VAL_1;
      WILL_FIRE_RL_wci_cfrd:
	  MUX_wci_respF_q_0$write_1__VAL_1 =
	      MUX_wci_respF_x_wire$wset_1__VAL_2;
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
  assign wci_sFlagReg_1$whas = 1'b0 ;
  assign wci_sThreadBusy_pw$whas = 1'b0 ;
  assign wci_sFlagReg_1$wget = 1'b0 ;
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
	     WILL_FIRE_RL_psdPass_bypass || WILL_FIRE_RL_psdPrecise_input ;
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
  assign w2p_dataF_pwDequeue$whas = CAN_FIRE_RL_w2p_precise_deq ;
  assign w2p_dataF_pwEnqueue$whas = CAN_FIRE_RL_w2p_imprecise_enq ;
  assign w2p_dataF_wDataIn$wget = w2p_inF$D_OUT[43:12] ;
  assign w2p_dataF_wDataIn$whas = CAN_FIRE_RL_w2p_imprecise_enq ;
  assign w2p_dataF_wDataOut$wget = x_data__h7856 ;
  assign w2p_dataF_wDataOut$whas = 1'd1 ;
  assign w2p_operateW$wget = 1'd1 ;
  assign w2p_operateW$whas = CAN_FIRE_RL_operating_actions ;
  assign wsiM_reqFifo_enqueueing$whas =
	     WILL_FIRE_RL_psdFFT_doEgress && !sendEven ||
	     WILL_FIRE_RL_psdPass_bypass ||
	     WILL_FIRE_RL_psdPrecise_output_bypassFFT ;
  assign wsiM_reqFifo_x_wire$wget = MUX_wsiM_reqFifo_q_0$write_1__VAL_1 ;
  assign wsiM_reqFifo_x_wire$whas =
	     WILL_FIRE_RL_psdFFT_doEgress && !sendEven ||
	     WILL_FIRE_RL_psdPrecise_output_bypassFFT ||
	     WILL_FIRE_RL_psdPass_bypass ;
  assign wsiM_reqFifo_dequeueing$whas = CAN_FIRE_RL_wsiM_reqFifo_deq ;
  assign wsiM_sThreadBusy_pw$whas = wsiM0_SThreadBusy ;
  assign wsiM_operateD_1$whas = CAN_FIRE_RL_operating_actions ;
  assign wsiM_operateD_1$wget = 1'd1 ;
  assign wsiM_peerIsReady_1$wget = 1'd1 ;
  assign wsiM_peerIsReady_1$whas = wsiM0_SReset_n ;
  assign wsiM_extStatusW$wget =
	     { wsiM_pMesgCount, wsiM_iMesgCount, wsiM_tBusyCount } ;
  assign wci_respF_x_wire$wget = MUX_wci_respF_q_0$write_1__VAL_1 ;
  assign fft_fwd_w$wget = 1'b0 ;
  assign fft_fwd_w$whas = 1'b0 ;
  assign fft_fwd_we_w$wget = 1'b0 ;
  assign fft_fwd_we_w$whas = 1'b0 ;
  assign fft_scale_w$wget = 12'h0 ;
  assign fft_scale_w$whas = 1'b0 ;
  assign fft_scale_we_w$wget = 1'b0 ;
  assign fft_scale_we_w$whas = 1'b0 ;
  assign fft_start_w$wget = 1'd1 ;
  assign fft_start_w$whas = CAN_FIRE_RL_fft_frame_start ;
  assign fft_xnRe_w$wget = fft_xnF$D_OUT[31:16] ;
  assign fft_xnRe_w$whas = CAN_FIRE_RL_fft_fft_stream_ingress ;
  assign fft_xnIm_w$wget = fft_xnF$D_OUT[15:0] ;
  assign fft_xnIm_w$whas = CAN_FIRE_RL_fft_fft_stream_ingress ;
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
  assign wsi_Es_mReqInfo_w$wget = wsiS0_MReqInfo ;
  assign wsi_Es_mByteEn_w$whas = 1'd1 ;
  assign wsi_Es_mReqInfo_w$whas = 1'd1 ;
  assign wsi_Es_mDataInfo_w$whas = 1'd1 ;
  // register evenMag
  assign evenMag$D_IN =
	     IF_IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_ETC___d646 -
	     IF_IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_ETC___d140 ;
  assign evenMag$EN = WILL_FIRE_RL_psdFFT_doEgress && sendEven ;
  // register fft_fftStarted
  assign fft_fftStarted$D_IN = !MUX_fft_fftStarted$write_1__SEL_1 ;
  assign fft_fftStarted$EN =
	     WILL_FIRE_RL_fft_fft_stream_ingress &&
	     fft_loadIndex == 16'd4095 ||
	     WILL_FIRE_RL_fft_frame_start ;
  // register fft_loadFrames
  assign fft_loadFrames$D_IN = fft_loadFrames + 16'd1 ;
  assign fft_loadFrames$EN = MUX_fft_fftStarted$write_1__SEL_1 ;
  // register fft_loadIndex
  assign fft_loadIndex$D_IN =
	     (fft_loadIndex == 16'd4095) ? 16'd0 : fft_loadIndex + 16'd1 ;
  assign fft_loadIndex$EN = CAN_FIRE_RL_fft_fft_stream_ingress ;
  // register fft_unloadFrames
  assign fft_unloadFrames$D_IN = fft_unloadFrames + 16'd1 ;
  assign fft_unloadFrames$EN =
	     WILL_FIRE_RL_fft_fft_stream_egress &&
	     fft_unloadIndex == 16'd4095 ;
  // register fft_unloadIndex
  assign fft_unloadIndex$D_IN =
	     (fft_unloadIndex == 16'd4095) ? 16'd0 : fft_unloadIndex + 16'd1 ;
  assign fft_unloadIndex$EN = CAN_FIRE_RL_fft_fft_stream_egress ;
  // register psdCtrl
  assign psdCtrl$D_IN = wci_reqF$D_OUT[31:0] ;
  assign psdCtrl$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[51:32] == 20'h00004 ;
  // register sendEven
  assign sendEven$D_IN = !sendEven ;
  assign sendEven$EN = CAN_FIRE_RL_psdFFT_doEgress ;
  // register takeEven
  assign takeEven$D_IN = !takeEven ;
  assign takeEven$EN = CAN_FIRE_RL_psdFFT_doIngress ;
  // register unloadCnt
  assign unloadCnt$D_IN =
	     (unloadCnt == 16'd4095) ? 16'd0 : unloadCnt + 16'd1 ;
  assign unloadCnt$EN = CAN_FIRE_RL_psdFFT_doEgress ;
  // register w2p_dataF_rCache
  assign w2p_dataF_rCache$D_IN = { 1'd1, w2p_dataF_rWrPtr, x__h7434 } ;
  assign w2p_dataF_rCache$EN = CAN_FIRE_RL_w2p_imprecise_enq ;
  // register w2p_dataF_rRdPtr
  assign w2p_dataF_rRdPtr$D_IN = x__h7326 ;
  assign w2p_dataF_rRdPtr$EN = CAN_FIRE_RL_w2p_precise_deq ;
  // register w2p_dataF_rWrPtr
  assign w2p_dataF_rWrPtr$D_IN = w2p_dataF_rWrPtr + 13'd1 ;
  assign w2p_dataF_rWrPtr$EN = CAN_FIRE_RL_w2p_imprecise_enq ;
  // register w2p_wordsDequed
  assign w2p_wordsDequed$D_IN =
	     w2p_wordsDequed_27_EQ_w2p_wordsExact_28_MINUS__ETC___d608 ?
	       16'd0 :
	       w2p_wordsDequed + 16'd1 ;
  assign w2p_wordsDequed$EN = CAN_FIRE_RL_w2p_precise_deq ;
  // register w2p_wordsEnqued
  assign w2p_wordsEnqued$D_IN =
	     w2p_wordsEnqued_43_EQ_w2p_wordsExact_28_MINUS__ETC___d674 ?
	       16'd0 :
	       w2p_wordsEnqued + 16'd1 ;
  assign w2p_wordsEnqued$EN = CAN_FIRE_RL_w2p_imprecise_enq ;
  // register w2p_wordsExact
  assign w2p_wordsExact$D_IN = 16'h0 ;
  assign w2p_wordsExact$EN = 1'b0 ;
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
	     wsiS_reqFifo_notFull__03_AND_wsiS_burstKind_83_ETC___d423 ;
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
	     WILL_FIRE_RL_psdPass_bypass ||
	     WILL_FIRE_RL_psdPrecise_input ||
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
  // submodule fft_fft
  assign fft_fft$fwd_inv = 1'b0 ;
  assign fft_fft$fwd_inv_we = 1'b0 ;
  assign fft_fft$scale_sch = 12'd0 ;
  assign fft_fft$scale_sch_we = 1'b0 ;
  assign fft_fft$start = CAN_FIRE_RL_fft_frame_start ;
  assign fft_fft$xn_im =
	     CAN_FIRE_RL_fft_fft_stream_ingress ?
	       fft_xnF$D_OUT[15:0] :
	       16'd0 ;
  assign fft_fft$xn_re =
	     CAN_FIRE_RL_fft_fft_stream_ingress ?
	       fft_xnF$D_OUT[31:16] :
	       16'd0 ;
  // submodule fft_xkF
  assign fft_xkF$D_IN = { fft_fft$xk_re, fft_fft$xk_im } ;
  assign fft_xkF$DEQ = CAN_FIRE_RL_psdFFT_doEgress ;
  assign fft_xkF$ENQ = CAN_FIRE_RL_fft_fft_stream_egress ;
  assign fft_xkF$CLR = 1'b0 ;
  // submodule fft_xnF
  assign fft_xnF$D_IN = { x__h13415, 16'd0 } ;
  assign fft_xnF$DEQ = CAN_FIRE_RL_fft_fft_stream_ingress ;
  assign fft_xnF$ENQ = CAN_FIRE_RL_psdFFT_doIngress ;
  assign fft_xnF$CLR = 1'b0 ;
  // submodule w2p_dataF_memory
  assign w2p_dataF_memory$WEA = CAN_FIRE_RL_w2p_imprecise_enq ;
  assign w2p_dataF_memory$ADDRA = w2p_dataF_rWrPtr[11:0] ;
  assign w2p_dataF_memory$DIA = x__h7434 ;
  assign w2p_dataF_memory$WEB = 1'd0 ;
  assign w2p_dataF_memory$ADDRB =
	     CAN_FIRE_RL_w2p_precise_deq ?
	       x__h7326[11:0] :
	       w2p_dataF_rRdPtr[11:0] ;
  assign w2p_dataF_memory$DIB = 32'hAAAAAAAA /* unspecified value */  ;
  assign w2p_dataF_memory$ENA = 1'd1 ;
  assign w2p_dataF_memory$ENB = 1'd1 ;
  // submodule w2p_inF
  assign w2p_inF$D_IN = wsiS_reqFifo$D_OUT ;
  assign w2p_inF$DEQ = CAN_FIRE_RL_w2p_imprecise_enq ;
  assign w2p_inF$ENQ = CAN_FIRE_RL_psdPrecise_input ;
  assign w2p_inF$CLR = 1'b0 ;
  // submodule w2p_outF
  assign w2p_outF$D_IN =
	     { 3'd1,
	       w2p_wordsDequed_27_EQ_w2p_wordsExact_28_MINUS__ETC___d608,
	       1'd1,
	       w2p_wordsExact[11:0],
	       x_data__h7856,
	       4'd15,
	       w2p_reqF$D_OUT } ;
  assign w2p_outF$DEQ =
	     WILL_FIRE_RL_psdPrecise_output_bypassFFT ||
	     WILL_FIRE_RL_psdPrecise_output_feedFFT ;
  assign w2p_outF$ENQ = CAN_FIRE_RL_w2p_precise_deq ;
  assign w2p_outF$CLR = 1'b0 ;
  // submodule w2p_reqF
  assign w2p_reqF$D_IN = w2p_inF$D_OUT[7:0] ;
  assign w2p_reqF$DEQ =
	     WILL_FIRE_RL_w2p_precise_deq &&
	     w2p_wordsDequed_27_EQ_w2p_wordsExact_28_MINUS__ETC___d608 ;
  assign w2p_reqF$ENQ =
	     WILL_FIRE_RL_w2p_imprecise_enq &&
	     w2p_wordsEnqued_43_EQ_w2p_wordsExact_28_MINUS__ETC___d674 ;
  assign w2p_reqF$CLR = 1'b0 ;
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
  assign xnF$D_IN = w2p_outF$D_OUT[43:12] ;
  assign xnF$DEQ = WILL_FIRE_RL_psdFFT_doIngress && !takeEven ;
  assign xnF$ENQ = CAN_FIRE_RL_psdPrecise_output_feedFFT ;
  assign xnF$CLR = 1'b0 ;
  // remaining internal signals
  assign IF_IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_ETC___d140 =
	     IF_IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_ETC___d646 /
	     16'd16 ;
  assign IF_IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_ETC___d646 =
	     (IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_xk_ETC___d643 <=
	      IF_fft_xkF_first__25_BIT_15_30_THEN_NEG_fft_xk_ETC___d644) ?
	       IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_xk_ETC___d135 +
	       IF_fft_xkF_first__25_BIT_15_30_THEN_NEG_fft_xk_ETC___d644 :
	       IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_xk_ETC___d643 +
	       IF_fft_xkF_first__25_BIT_15_30_THEN_NEG_fft_xk_ETC___d137 ;
  assign IF_fft_xkF_first__25_BIT_15_30_THEN_NEG_fft_xk_ETC___d137 =
	     IF_fft_xkF_first__25_BIT_15_30_THEN_NEG_fft_xk_ETC___d644 /
	     16'd2 ;
  assign IF_fft_xkF_first__25_BIT_15_30_THEN_NEG_fft_xk_ETC___d644 =
	     fft_xkF$D_OUT[15] ? -fft_xkF$D_OUT[15:0] : fft_xkF$D_OUT[15:0] ;
  assign IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_xk_ETC___d135 =
	     IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_xk_ETC___d643 /
	     16'd2 ;
  assign IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_xk_ETC___d643 =
	     fft_xkF$D_OUT[31] ?
	       -fft_xkF$D_OUT[31:16] :
	       fft_xkF$D_OUT[31:16] ;
  assign NOT_w2p_dataF_rRdPtr_11_PLUS_2048_39_EQ_w2p_da_ETC___d349 =
	     w2p_dataF_rRdPtr + 13'd2048 != w2p_dataF_rWrPtr &&
	     w2p_inF$EMPTY_N &&
	     (!w2p_wordsEnqued_43_EQ_w2p_wordsExact_28_MINUS__ETC___d674 ||
	      w2p_reqF$FULL_N) ;
  assign dReal__h13383 = takeEven ? xnF$D_OUT[15:0] : xnF$D_OUT[31:16] ;
  assign psdStatus__h14238 = { 31'd0, hasDebugLogic } ;
  assign rdat__h14517 = hasDebugLogic ? { 16'd0, x__h14521 } : 32'd0 ;
  assign rdat__h14617 = hasDebugLogic ? wsiS_extStatusW$wget[95:64] : 32'd0 ;
  assign rdat__h14631 = hasDebugLogic ? wsiS_extStatusW$wget[63:32] : 32'd0 ;
  assign rdat__h14639 = hasDebugLogic ? wsiS_extStatusW$wget[31:0] : 32'd0 ;
  assign rdat__h14645 = hasDebugLogic ? wsiM_extStatusW$wget[95:64] : 32'd0 ;
  assign rdat__h14659 = hasDebugLogic ? wsiM_extStatusW$wget[63:32] : 32'd0 ;
  assign rdat__h14667 = hasDebugLogic ? wsiM_extStatusW$wget[31:0] : 32'd0 ;
  assign rdat__h14673 = hasDebugLogic ? x_fftFrameCounts__h12666 : 32'd0 ;
  assign result__h13444 = { ~dReal__h13383[15], dReal__h13383[14:0] } ;
  assign w2p_wordsDequed_27_EQ_w2p_wordsExact_28_MINUS__ETC___d608 =
	     w2p_wordsDequed == w2p_wordsExact_28_MINUS_1___d645 ;
  assign w2p_wordsEnqued_43_EQ_w2p_wordsExact_28_MINUS__ETC___d674 =
	     w2p_wordsEnqued == w2p_wordsExact_28_MINUS_1___d645 ;
  assign w2p_wordsExact_28_MINUS_1___d645 = w2p_wordsExact - 16'd1 ;
  assign wsiS_reqFifo_notFull__03_AND_wsiS_burstKind_83_ETC___d423 =
	     wsiS_reqFifo$FULL_N &&
	     (wsiS_burstKind == 2'd0 ||
	      (wsiS_burstKind == 2'd1 || wsiS_burstKind == 2'd2) &&
	      wsiS_wsiReq$wget[57]) ;
  assign x__h13415 = psdCtrl[4] ? result__h13444 : dReal__h13383 ;
  assign x__h14521 = { wsiS_statusR, wsiM_statusR } ;
  assign x__h7326 = w2p_dataF_rRdPtr + 13'd1 ;
  assign x__h7434 =
	     CAN_FIRE_RL_w2p_imprecise_enq ? w2p_inF$D_OUT[43:12] : 32'd0 ;
  assign x_data__h13251 =
	     { IF_IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_ETC___d646 -
	       IF_IF_fft_xkF_first__25_BIT_31_26_THEN_NEG_fft_ETC___d140,
	       evenMag } ;
  assign x_data__h7856 =
	     (w2p_dataF_rCache[45] &&
	      w2p_dataF_rCache[44:32] == w2p_dataF_rRdPtr) ?
	       w2p_dataF_rCache[31:0] :
	       w2p_dataF_memory$DOB ;
  assign x_fftFrameCounts__h12666 = { fft_loadFrames, fft_unloadFrames } ;
  always@(wci_reqF$D_OUT or
	  psdStatus__h14238 or
	  psdCtrl or
	  rdat__h14517 or
	  rdat__h14617 or
	  rdat__h14631 or
	  rdat__h14639 or
	  rdat__h14645 or rdat__h14659 or rdat__h14667 or rdat__h14673)
  begin
    case (wci_reqF$D_OUT[51:32])
      20'h0: x_data__h14493 = psdStatus__h14238;
      20'h00004: x_data__h14493 = psdCtrl;
      20'h00010: x_data__h14493 = rdat__h14517;
      20'h00014: x_data__h14493 = rdat__h14617;
      20'h00018: x_data__h14493 = rdat__h14631;
      20'h0001C: x_data__h14493 = rdat__h14639;
      20'h00020: x_data__h14493 = rdat__h14645;
      20'h00024: x_data__h14493 = rdat__h14659;
      20'h00028: x_data__h14493 = rdat__h14667;
      20'h0002C: x_data__h14493 = rdat__h14673;
      default: x_data__h14493 = 32'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (!wciS0_MReset_n)
      begin
        fft_fftStarted <= `BSV_ASSIGNMENT_DELAY 1'd0;
	fft_loadFrames <= `BSV_ASSIGNMENT_DELAY 16'd0;
	fft_loadIndex <= `BSV_ASSIGNMENT_DELAY 16'd0;
	fft_unloadFrames <= `BSV_ASSIGNMENT_DELAY 16'd0;
	fft_unloadIndex <= `BSV_ASSIGNMENT_DELAY 16'd0;
	psdCtrl <= `BSV_ASSIGNMENT_DELAY psdCtrlInit;
	sendEven <= `BSV_ASSIGNMENT_DELAY 1'd1;
	takeEven <= `BSV_ASSIGNMENT_DELAY 1'd1;
	unloadCnt <= `BSV_ASSIGNMENT_DELAY 16'd0;
	w2p_dataF_rCache <= `BSV_ASSIGNMENT_DELAY 46'h0AAAAAAAAAAA;
	w2p_dataF_rRdPtr <= `BSV_ASSIGNMENT_DELAY 13'd0;
	w2p_dataF_rWrPtr <= `BSV_ASSIGNMENT_DELAY 13'd0;
	w2p_wordsDequed <= `BSV_ASSIGNMENT_DELAY 16'd0;
	w2p_wordsEnqued <= `BSV_ASSIGNMENT_DELAY 16'd0;
	w2p_wordsExact <= `BSV_ASSIGNMENT_DELAY 16'd2048;
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
        if (fft_fftStarted$EN)
	  fft_fftStarted <= `BSV_ASSIGNMENT_DELAY fft_fftStarted$D_IN;
	if (fft_loadFrames$EN)
	  fft_loadFrames <= `BSV_ASSIGNMENT_DELAY fft_loadFrames$D_IN;
	if (fft_loadIndex$EN)
	  fft_loadIndex <= `BSV_ASSIGNMENT_DELAY fft_loadIndex$D_IN;
	if (fft_unloadFrames$EN)
	  fft_unloadFrames <= `BSV_ASSIGNMENT_DELAY fft_unloadFrames$D_IN;
	if (fft_unloadIndex$EN)
	  fft_unloadIndex <= `BSV_ASSIGNMENT_DELAY fft_unloadIndex$D_IN;
	if (psdCtrl$EN) psdCtrl <= `BSV_ASSIGNMENT_DELAY psdCtrl$D_IN;
	if (sendEven$EN) sendEven <= `BSV_ASSIGNMENT_DELAY sendEven$D_IN;
	if (takeEven$EN) takeEven <= `BSV_ASSIGNMENT_DELAY takeEven$D_IN;
	if (unloadCnt$EN) unloadCnt <= `BSV_ASSIGNMENT_DELAY unloadCnt$D_IN;
	if (w2p_dataF_rCache$EN)
	  w2p_dataF_rCache <= `BSV_ASSIGNMENT_DELAY w2p_dataF_rCache$D_IN;
	if (w2p_dataF_rRdPtr$EN)
	  w2p_dataF_rRdPtr <= `BSV_ASSIGNMENT_DELAY w2p_dataF_rRdPtr$D_IN;
	if (w2p_dataF_rWrPtr$EN)
	  w2p_dataF_rWrPtr <= `BSV_ASSIGNMENT_DELAY w2p_dataF_rWrPtr$D_IN;
	if (w2p_wordsDequed$EN)
	  w2p_wordsDequed <= `BSV_ASSIGNMENT_DELAY w2p_wordsDequed$D_IN;
	if (w2p_wordsEnqued$EN)
	  w2p_wordsEnqued <= `BSV_ASSIGNMENT_DELAY w2p_wordsEnqued$D_IN;
	if (w2p_wordsExact$EN)
	  w2p_wordsExact <= `BSV_ASSIGNMENT_DELAY w2p_wordsExact$D_IN;
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
    if (evenMag$EN) evenMag <= `BSV_ASSIGNMENT_DELAY evenMag$D_IN;
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
    evenMag = 16'hAAAA;
    fft_fftStarted = 1'h0;
    fft_loadFrames = 16'hAAAA;
    fft_loadIndex = 16'hAAAA;
    fft_unloadFrames = 16'hAAAA;
    fft_unloadIndex = 16'hAAAA;
    psdCtrl = 32'hAAAAAAAA;
    sendEven = 1'h0;
    takeEven = 1'h0;
    unloadCnt = 16'hAAAA;
    w2p_dataF_rCache = 46'h2AAAAAAAAAAA;
    w2p_dataF_rRdPtr = 13'h0AAA;
    w2p_dataF_rWrPtr = 13'h0AAA;
    w2p_wordsDequed = 16'hAAAA;
    w2p_wordsEnqued = 16'hAAAA;
    w2p_wordsExact = 16'hAAAA;
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
	  v__h3671 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3671,
		 wci_reqF$D_OUT[36:34],
		 wci_cState);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	begin
	  v__h14361 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	$display("[%0d]: %m: Starting PSD psdCtrl:%0x", v__h14361, psdCtrl);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/PSD.bsv\", line 198, column 6: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_IsO and RL_wci_ctrl_EiI fired in the\n  same clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_OrE && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/PSD.bsv\", line 204, column 6: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_OrE and RL_wci_ctrl_IsO fired in the\n  same clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctrl_OrE && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/PSD.bsv\", line 204, column 6: (R0001)\n  Mutually exclusive rules RL_wci_ctrl_OrE and RL_wci_ctrl_EiI fired in the\n  same clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/PSD.bsv\", line 180, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfrd and RL_wci_ctrl_OrE fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/PSD.bsv\", line 180, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfrd and RL_wci_ctrl_IsO fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/PSD.bsv\", line 180, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfrd and RL_wci_ctrl_EiI fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	begin
	  v__h2772 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h2772,
		 wci_cEdge,
		 wci_cState);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	begin
	  v__h2625 = $time;
	  #0;
	end
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h2625,
		 wci_cEdge,
		 wci_cState,
		 wci_nState);
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/PSD.bsv\", line 171, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfwr and RL_wci_ctrl_OrE fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/PSD.bsv\", line 171, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfwr and RL_wci_ctrl_IsO fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/PSD.bsv\", line 171, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfwr and RL_wci_ctrl_EiI fired in the same\n  clock cycle.\n");
    if (wciS0_MReset_n)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/PSD.bsv\", line 171, column 6: (R0001)\n  Mutually exclusive rules RL_wci_cfwr and RL_wci_cfrd fired in the same clock\n  cycle.\n");
  end
  // synopsys translate_on
endmodule