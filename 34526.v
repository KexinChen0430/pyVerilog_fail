module outputs
  wire [255 : 0] wsiM0_MData;
  wire [31 : 0] wciS0_SData, wsiM0_MByteEn;
  wire [11 : 0] wsiM0_MBurstLength;
  wire [7 : 0] wsiM0_MReqInfo;
  wire [2 : 0] wsiM0_MCmd;
  wire [1 : 0] wciS0_SFlag, wciS0_SResp;
  wire wciS0_SThreadBusy,
       wsiM0_MBurstPrecise,
       wsiM0_MReqLast,
       wsiM0_MReset_n,
       wsiS0_SReset_n,
       wsiS0_SThreadBusy;
  // inlined wires
  wire [312 : 0] wsiM_reqFifo_x_wire$wget, wsiS_wsiReq$wget;
  wire [255 : 0] wsi_Es_mData_w$wget;
  wire [95 : 0] wsiM_extStatusW$wget, wsiS_extStatusW$wget;
  wire [71 : 0] wci_wciReq$wget;
  wire [33 : 0] wci_respF_x_wire$wget;
  wire [31 : 0] wci_Es_mAddr_w$wget,
		wci_Es_mData_w$wget,
		wsi_Es_mByteEn_w$wget;
  wire [11 : 0] wsi_Es_mBurstLength_w$wget;
  wire [7 : 0] wsi_Es_mReqInfo_w$wget;
  wire [3 : 0] wci_Es_mByteEn_w$wget;
  wire [2 : 0] wci_Es_mCmd_w$wget, wci_wEdge$wget, wsi_Es_mCmd_w$wget;
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
  // register byteCount
  reg [31 : 0] byteCount;
  wire [31 : 0] byteCount$D_IN;
  wire byteCount$EN;
  // register frameGateCtrl
  reg [31 : 0] frameGateCtrl;
  wire [31 : 0] frameGateCtrl$D_IN;
  wire frameGateCtrl$EN;
  // register frameSize
  reg [31 : 0] frameSize;
  wire [31 : 0] frameSize$D_IN;
  wire frameSize$EN;
  // register gateSize
  reg [31 : 0] gateSize;
  wire [31 : 0] gateSize$D_IN;
  wire gateSize$EN;
  // register gated
  reg gated;
  wire gated$D_IN, gated$EN;
  // register op0MesgCnt
  reg [31 : 0] op0MesgCnt;
  wire [31 : 0] op0MesgCnt$D_IN;
  wire op0MesgCnt$EN;
  // register otherMesgCnt
  reg [31 : 0] otherMesgCnt;
  wire [31 : 0] otherMesgCnt$D_IN;
  wire otherMesgCnt$EN;
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
  // ports of submodule wci_reqF
  wire [71 : 0] wci_reqF$D_IN, wci_reqF$D_OUT;
  wire wci_reqF$CLR, wci_reqF$DEQ, wci_reqF$EMPTY_N, wci_reqF$ENQ;
  // ports of submodule wsiS_reqFifo
  wire [312 : 0] wsiS_reqFifo$D_IN, wsiS_reqFifo$D_OUT;
  wire wsiS_reqFifo$CLR,
       wsiS_reqFifo$DEQ,
       wsiS_reqFifo$EMPTY_N,
       wsiS_reqFifo$ENQ,
       wsiS_reqFifo$FULL_N;
  // rule scheduling signals
  wire WILL_FIRE_RL_wci_cfrd,
       WILL_FIRE_RL_wci_cfwr,
       WILL_FIRE_RL_wci_ctl_op_complete,
       WILL_FIRE_RL_wci_ctl_op_start,
       WILL_FIRE_RL_wci_ctrl_EiI,
       WILL_FIRE_RL_wci_ctrl_IsO,
       WILL_FIRE_RL_wci_ctrl_OrE,
       WILL_FIRE_RL_wci_respF_both,
       WILL_FIRE_RL_wci_respF_decCtr,
       WILL_FIRE_RL_wci_respF_incCtr,
       WILL_FIRE_RL_wsiM_reqFifo_both,
       WILL_FIRE_RL_wsiM_reqFifo_decCtr,
       WILL_FIRE_RL_wsiM_reqFifo_deq,
       WILL_FIRE_RL_wsiM_reqFifo_incCtr,
       WILL_FIRE_RL_wsiS_reqFifo_enq,
       WILL_FIRE_RL_wsiS_reqFifo_reset,
       WILL_FIRE_RL_wsipass_doMessagePush;
  // inputs to muxes for submodule ports
  reg [33 : 0] MUX_wci_respF_q_0$write_1__VAL_2;
  wire [312 : 0] MUX_wsiM_reqFifo_q_0$write_1__VAL_1,
		 MUX_wsiM_reqFifo_q_1$write_1__VAL_1;
  wire [33 : 0] MUX_wci_respF_q_0$write_1__VAL_1,
		MUX_wci_respF_q_1$write_1__VAL_1,
		MUX_wci_respF_x_wire$wset_1__VAL_1,
		MUX_wci_respF_x_wire$wset_1__VAL_2;
  wire [1 : 0] MUX_wci_respF_c_r$write_1__VAL_1,
	       MUX_wci_respF_c_r$write_1__VAL_2,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_1,
	       MUX_wsiM_reqFifo_c_r$write_1__VAL_2;
  wire MUX_wci_illegalEdge$write_1__SEL_1,
       MUX_wci_illegalEdge$write_1__SEL_2,
       MUX_wci_illegalEdge$write_1__VAL_2,
       MUX_wci_respF_q_0$write_1__SEL_2,
       MUX_wci_respF_q_1$write_1__SEL_2,
       MUX_wsiM_reqFifo_q_0$write_1__SEL_2,
       MUX_wsiM_reqFifo_q_1$write_1__SEL_2;
  // remaining internal signals
  reg [63 : 0] v__h11217, v__h3701, v__h3876, v__h4020;
  reg [31 : 0] g_data__h10929;
  wire [31 : 0] frameGateStatus__h10551,
		rdat__h10963,
		rdat__h11063,
		rdat__h11077,
		rdat__h11085,
		rdat__h11091,
		rdat__h11105,
		rdat__h11113,
		rdat__h11119,
		rdat__h11130,
		x__h10327;
  wire [15 : 0] x__h10967;
  wire NOT_gated_99_05_AND_byteCount_06_EQ_frameSize__ETC___d439,
       wsiS_reqFifo_i_notEmpty__92_AND_NOT_frameGateC_ETC___d303;
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
	     !wsiS_sThreadBusy_dw$whas || wsiS_sThreadBusy_dw$wget ;
  // value method wsiS0_sReset_n
  assign wsiS0_SReset_n = !wsiS_isReset_isInReset && wsiS_operateD ;
  // value method wsiM0_mCmd
  assign wsiM0_MCmd = wsiM_sThreadBusy_d ? 3'd0 : wsiM_reqFifo_q_0[312:310] ;
  // value method wsiM0_mReqLast
  assign wsiM0_MReqLast = !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[309] ;
  // value method wsiM0_mBurstPrecise
  assign wsiM0_MBurstPrecise = !wsiM_sThreadBusy_d && wsiM_reqFifo_q_0[308] ;
  // value method wsiM0_mBurstLength
  assign wsiM0_MBurstLength =
	     wsiM_sThreadBusy_d ? 12'd0 : wsiM_reqFifo_q_0[307:296] ;
  // value method wsiM0_mData
  assign wsiM0_MData = wsiM_reqFifo_q_0[295:40] ;
  // value method wsiM0_mByteEn
  assign wsiM0_MByteEn = wsiM_reqFifo_q_0[39:8] ;
  // value method wsiM0_mReqInfo
  assign wsiM0_MReqInfo = wsiM_sThreadBusy_d ? 8'd0 : wsiM_reqFifo_q_0[7:0] ;
  // value method wsiM0_mReset_n
  assign wsiM0_MReset_n = !wsiM_isReset_isInReset && wsiM_operateD ;
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
  // submodule wsiS_reqFifo
  SizedFIFO #(.p1width(32'd313),
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
  // rule RL_wci_ctl_op_start
  assign WILL_FIRE_RL_wci_ctl_op_start =
	     wci_reqF$EMPTY_N && wci_wci_ctrl_pw$whas &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_ctrl_IsO
  assign WILL_FIRE_RL_wci_ctrl_IsO =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd1 &&
	     wci_reqF$D_OUT[36:34] == 3'd1 ;
  // rule RL_wci_ctrl_EiI
  assign WILL_FIRE_RL_wci_ctrl_EiI =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd0 &&
	     wci_reqF$D_OUT[36:34] == 3'd0 ;
  // rule RL_wci_ctrl_OrE
  assign WILL_FIRE_RL_wci_ctrl_OrE =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd2 &&
	     wci_reqF$D_OUT[36:34] == 3'd3 ;
  // rule RL_wsipass_doMessagePush
  assign WILL_FIRE_RL_wsipass_doMessagePush =
	     wsiS_reqFifo_i_notEmpty__92_AND_NOT_frameGateC_ETC___d303 &&
	     wci_cState == 3'd2 ;
  // rule RL_wci_cfwr
  assign WILL_FIRE_RL_wci_cfwr =
	     wci_respF_c_r != 2'd2 && wci_reqF$EMPTY_N &&
	     wci_wci_cfwr_pw$whas &&
	     !WILL_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_ctl_op_complete
  assign WILL_FIRE_RL_wci_ctl_op_complete =
	     wci_respF_c_r != 2'd2 && wci_ctlOpActive && wci_ctlAckReg ;
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
  // rule RL_wsiS_reqFifo_enq
  assign WILL_FIRE_RL_wsiS_reqFifo_enq =
	     wsiS_reqFifo$FULL_N && wsiS_operateD && wsiS_peerIsReady &&
	     wsiS_wsiReq$wget[312:310] == 3'd1 ;
  // rule RL_wsiS_reqFifo_reset
  assign WILL_FIRE_RL_wsiS_reqFifo_reset =
	     WILL_FIRE_RL_wsiS_reqFifo_enq ||
	     WILL_FIRE_RL_wsipass_doMessagePush ;
  // inputs to muxes for submodule ports
  assign MUX_wci_illegalEdge$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge ;
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
  assign MUX_wsiM_reqFifo_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd0 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_c_r == 2'd1 ;
  assign MUX_wci_illegalEdge$write_1__VAL_2 =
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
  assign MUX_wci_respF_x_wire$wset_1__VAL_2 = { 2'd1, g_data__h10929 } ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_1 = wsiM_reqFifo_c_r + 2'd1 ;
  assign MUX_wsiM_reqFifo_c_r$write_1__VAL_2 = wsiM_reqFifo_c_r - 2'd1 ;
  assign MUX_wsiM_reqFifo_q_0$write_1__VAL_1 =
	     (wsiM_reqFifo_c_r == 2'd1) ?
	       wsiS_reqFifo$D_OUT :
	       wsiM_reqFifo_q_1 ;
  assign MUX_wsiM_reqFifo_q_1$write_1__VAL_1 =
	     (wsiM_reqFifo_c_r == 2'd2) ?
	       wsiS_reqFifo$D_OUT :
	       313'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00 ;
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
  assign wsiS_operateD_1$whas = wci_cState == 3'd2 ;
  assign wsiS_peerIsReady_1$wget = 1'd1 ;
  assign wsiS_peerIsReady_1$whas = wsiS0_MReset_n ;
  assign wsiS_sThreadBusy_dw$wget = wsiS_reqFifo_countReg > 2'd1 ;
  assign wsiS_sThreadBusy_dw$whas =
	     wsiS_reqFifo_levelsValid && wsiS_operateD && wsiS_peerIsReady ;
  assign wsiM_reqFifo_x_wire$wget = wsiS_reqFifo$D_OUT ;
  assign wsiM_reqFifo_x_wire$whas = wsiM_reqFifo_enqueueing$whas ;
  assign wsiM_operateD_1$wget = 1'd1 ;
  assign wsiM_operateD_1$whas = wci_cState == 3'd2 ;
  assign wsiM_peerIsReady_1$wget = 1'd1 ;
  assign wsiM_peerIsReady_1$whas = wsiM0_SReset_n ;
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
  assign wsiS_reqFifo_r_enq$whas = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_r_deq$whas = WILL_FIRE_RL_wsipass_doMessagePush ;
  assign wsiS_reqFifo_r_clr$whas = 1'b0 ;
  assign wsiS_reqFifo_doResetEnq$whas = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_doResetDeq$whas = WILL_FIRE_RL_wsipass_doMessagePush ;
  assign wsiS_reqFifo_doResetClr$whas = 1'b0 ;
  assign wsiM_reqFifo_enqueueing$whas =
	     WILL_FIRE_RL_wsipass_doMessagePush &&
	     (frameGateCtrl[3:0] == 4'h0 ||
	      frameGateCtrl[3:0] == 4'h1 && !gated) ;
  assign wsiM_reqFifo_dequeueing$whas = WILL_FIRE_RL_wsiM_reqFifo_deq ;
  assign wsiM_sThreadBusy_pw$whas = wsiM0_SThreadBusy ;
  assign wsi_Es_mReqLast_w$whas = wsiS0_MReqLast ;
  assign wsi_Es_mBurstPrecise_w$whas = wsiS0_MBurstPrecise ;
  assign wsi_Es_mDataInfo_w$whas = 1'd1 ;
  assign wsiS_extStatusW$wget =
	     { wsiS_pMesgCount, wsiS_iMesgCount, wsiS_tBusyCount } ;
  assign wsiM_extStatusW$wget =
	     { wsiM_pMesgCount, wsiM_iMesgCount, wsiM_tBusyCount } ;
  // register byteCount
  assign byteCount$D_IN =
	     NOT_gated_99_05_AND_byteCount_06_EQ_frameSize__ETC___d439 ?
	       32'd32 :
	       x__h10327 ;
  assign byteCount$EN = WILL_FIRE_RL_wsipass_doMessagePush ;
  // register frameGateCtrl
  assign frameGateCtrl$D_IN = wci_reqF$D_OUT[31:0] ;
  assign frameGateCtrl$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[63:32] == 32'h00000004 ;
  // register frameSize
  assign frameSize$D_IN = wci_reqF$D_OUT[31:0] ;
  assign frameSize$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[63:32] == 32'h00000008 ;
  // register gateSize
  assign gateSize$D_IN = wci_reqF$D_OUT[31:0] ;
  assign gateSize$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[63:32] == 32'h0000000C ;
  // register gated
  assign gated$D_IN = !gated && byteCount == frameSize ;
  assign gated$EN =
	     WILL_FIRE_RL_wsipass_doMessagePush &&
	     NOT_gated_99_05_AND_byteCount_06_EQ_frameSize__ETC___d439 ;
  // register op0MesgCnt
  assign op0MesgCnt$D_IN = 32'h0 ;
  assign op0MesgCnt$EN = 1'b0 ;
  // register otherMesgCnt
  assign otherMesgCnt$D_IN = 32'h0 ;
  assign otherMesgCnt$EN = 1'b0 ;
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
  // register wsiM_isReset_isInReset
  assign wsiM_isReset_isInReset$D_IN = 1'd0 ;
  assign wsiM_isReset_isInReset$EN = wsiM_isReset_isInReset ;
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
	  wsiS_reqFifo$D_OUT or
	  WILL_FIRE_RL_wsiM_reqFifo_decCtr or wsiM_reqFifo_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wsiM_reqFifo_both:
	  wsiM_reqFifo_q_0$D_IN = MUX_wsiM_reqFifo_q_0$write_1__VAL_1;
      MUX_wsiM_reqFifo_q_0$write_1__SEL_2:
	  wsiM_reqFifo_q_0$D_IN = wsiS_reqFifo$D_OUT;
      WILL_FIRE_RL_wsiM_reqFifo_decCtr:
	  wsiM_reqFifo_q_0$D_IN = wsiM_reqFifo_q_1;
      default: wsiM_reqFifo_q_0$D_IN =
		   313'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
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
	  wsiS_reqFifo$D_OUT or WILL_FIRE_RL_wsiM_reqFifo_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wsiM_reqFifo_both:
	  wsiM_reqFifo_q_1$D_IN = MUX_wsiM_reqFifo_q_1$write_1__VAL_1;
      MUX_wsiM_reqFifo_q_1$write_1__SEL_2:
	  wsiM_reqFifo_q_1$D_IN = wsiS_reqFifo$D_OUT;
      WILL_FIRE_RL_wsiM_reqFifo_decCtr:
	  wsiM_reqFifo_q_1$D_IN =
	      313'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00;
      default: wsiM_reqFifo_q_1$D_IN =
		   313'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
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
	     wsiM_reqFifo_q_0[312:310] == 3'd1 ;
  // register wsiS_burstKind
  assign wsiS_burstKind$D_IN =
	     (wsiS_burstKind == 2'd0) ?
	       (wsiS_wsiReq$wget[308] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsiS_burstKind$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq &&
	     (wsiS_burstKind == 2'd0 ||
	      (wsiS_burstKind == 2'd1 || wsiS_burstKind == 2'd2) &&
	      wsiS_wsiReq$wget[309]) ;
  // register wsiS_errorSticky
  assign wsiS_errorSticky$D_IN = 1'b0 ;
  assign wsiS_errorSticky$EN = 1'b0 ;
  // register wsiS_iMesgCount
  assign wsiS_iMesgCount$D_IN = wsiS_iMesgCount + 32'd1 ;
  assign wsiS_iMesgCount$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_burstKind == 2'd2 &&
	     wsiS_wsiReq$wget[309] ;
  // register wsiS_isReset_isInReset
  assign wsiS_isReset_isInReset$D_IN = 1'd0 ;
  assign wsiS_isReset_isInReset$EN = wsiS_isReset_isInReset ;
  // register wsiS_mesgWordLength
  assign wsiS_mesgWordLength$D_IN = wsiS_wordCount ;
  assign wsiS_mesgWordLength$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_wsiReq$wget[309] ;
  // register wsiS_operateD
  assign wsiS_operateD$D_IN = wci_cState == 3'd2 ;
  assign wsiS_operateD$EN = 1'd1 ;
  // register wsiS_pMesgCount
  assign wsiS_pMesgCount$D_IN = wsiS_pMesgCount + 32'd1 ;
  assign wsiS_pMesgCount$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_burstKind == 2'd1 &&
	     wsiS_wsiReq$wget[309] ;
  // register wsiS_peerIsReady
  assign wsiS_peerIsReady$D_IN = wsiS0_MReset_n ;
  assign wsiS_peerIsReady$EN = 1'd1 ;
  // register wsiS_reqFifo_countReg
  assign wsiS_reqFifo_countReg$D_IN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq ?
	       wsiS_reqFifo_countReg + 2'd1 :
	       wsiS_reqFifo_countReg - 2'd1 ;
  assign wsiS_reqFifo_countReg$EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq !=
	     WILL_FIRE_RL_wsipass_doMessagePush ;
  // register wsiS_reqFifo_levelsValid
  assign wsiS_reqFifo_levelsValid$D_IN = WILL_FIRE_RL_wsiS_reqFifo_reset ;
  assign wsiS_reqFifo_levelsValid$EN =
	     WILL_FIRE_RL_wsipass_doMessagePush ||
	     WILL_FIRE_RL_wsiS_reqFifo_enq ||
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
	     wsiS_wsiReq$wget[309] ? 12'd1 : wsiS_wordCount + 12'd1 ;
  assign wsiS_wordCount$EN = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  // submodule wci_reqF
  assign wci_reqF$D_IN = wci_wciReq$wget ;
  assign wci_reqF$ENQ = wci_wciReq$wget[71:69] != 3'd0 ;
  assign wci_reqF$DEQ = wci_reqF_r_deq$whas ;
  assign wci_reqF$CLR = 1'b0 ;
  // submodule wsiS_reqFifo
  assign wsiS_reqFifo$D_IN = wsiS_wsiReq$wget ;
  assign wsiS_reqFifo$ENQ = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo$DEQ = WILL_FIRE_RL_wsipass_doMessagePush ;
  assign wsiS_reqFifo$CLR = 1'b0 ;
  // remaining internal signals
  assign NOT_gated_99_05_AND_byteCount_06_EQ_frameSize__ETC___d439 =
	     !gated && byteCount == frameSize ||
	     gated && byteCount == gateSize ;
  assign frameGateStatus__h10551 = { 31'd0, hasDebugLogic } ;
  assign rdat__h10963 = hasDebugLogic ? { 16'd0, x__h10967 } : 32'd0 ;
  assign rdat__h11063 = hasDebugLogic ? wsiS_extStatusW$wget[95:64] : 32'd0 ;
  assign rdat__h11077 = hasDebugLogic ? wsiS_extStatusW$wget[63:32] : 32'd0 ;
  assign rdat__h11085 = hasDebugLogic ? wsiS_extStatusW$wget[31:0] : 32'd0 ;
  assign rdat__h11091 = hasDebugLogic ? wsiM_extStatusW$wget[95:64] : 32'd0 ;
  assign rdat__h11105 = hasDebugLogic ? wsiM_extStatusW$wget[63:32] : 32'd0 ;
  assign rdat__h11113 = hasDebugLogic ? wsiM_extStatusW$wget[31:0] : 32'd0 ;
  assign rdat__h11119 = hasDebugLogic ? op0MesgCnt : 32'd0 ;
  assign rdat__h11130 = hasDebugLogic ? otherMesgCnt : 32'd0 ;
  assign wsiS_reqFifo_i_notEmpty__92_AND_NOT_frameGateC_ETC___d303 =
	     wsiS_reqFifo$EMPTY_N &&
	     (frameGateCtrl[3:0] != 4'h0 &&
	      (frameGateCtrl[3:0] != 4'h1 || gated) ||
	      wsiM_reqFifo_c_r != 2'd2) ;
  assign x__h10327 = byteCount + 32'd32 ;
  assign x__h10967 = { wsiS_statusR, wsiM_statusR } ;
  always@(wci_reqF$D_OUT or
	  frameGateStatus__h10551 or
	  frameGateCtrl or
	  frameSize or
	  gateSize or
	  rdat__h10963 or
	  rdat__h11063 or
	  rdat__h11077 or
	  rdat__h11085 or
	  rdat__h11091 or
	  rdat__h11105 or rdat__h11113 or rdat__h11119 or rdat__h11130)
  begin
    case (wci_reqF$D_OUT[63:32])
      32'h0: g_data__h10929 = frameGateStatus__h10551;
      32'h00000004: g_data__h10929 = frameGateCtrl;
      32'h00000008: g_data__h10929 = frameSize;
      32'h0000000C: g_data__h10929 = gateSize;
      32'h00000010: g_data__h10929 = rdat__h10963;
      32'h00000014: g_data__h10929 = rdat__h11063;
      32'h00000018: g_data__h10929 = rdat__h11077;
      32'h0000001C: g_data__h10929 = rdat__h11085;
      32'h00000020: g_data__h10929 = rdat__h11091;
      32'h00000024: g_data__h10929 = rdat__h11105;
      32'h00000028: g_data__h10929 = rdat__h11113;
      32'h0000002C: g_data__h10929 = rdat__h11119;
      32'h00000030: g_data__h10929 = rdat__h11130;
      default: g_data__h10929 = 32'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (wciS0_MReset_n == `BSV_RESET_VALUE)
      begin
        byteCount <= `BSV_ASSIGNMENT_DELAY 32'd32;
	frameGateCtrl <= `BSV_ASSIGNMENT_DELAY fgCtrlInit;
	frameSize <= `BSV_ASSIGNMENT_DELAY 32'd0;
	gateSize <= `BSV_ASSIGNMENT_DELAY 32'd0;
	gated <= `BSV_ASSIGNMENT_DELAY 1'd0;
	op0MesgCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
	otherMesgCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
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
        if (byteCount$EN) byteCount <= `BSV_ASSIGNMENT_DELAY byteCount$D_IN;
	if (frameGateCtrl$EN)
	  frameGateCtrl <= `BSV_ASSIGNMENT_DELAY frameGateCtrl$D_IN;
	if (frameSize$EN) frameSize <= `BSV_ASSIGNMENT_DELAY frameSize$D_IN;
	if (gateSize$EN) gateSize <= `BSV_ASSIGNMENT_DELAY gateSize$D_IN;
	if (gated$EN) gated <= `BSV_ASSIGNMENT_DELAY gated$D_IN;
	if (op0MesgCnt$EN)
	  op0MesgCnt <= `BSV_ASSIGNMENT_DELAY op0MesgCnt$D_IN;
	if (otherMesgCnt$EN)
	  otherMesgCnt <= `BSV_ASSIGNMENT_DELAY otherMesgCnt$D_IN;
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
  always@(posedge wciS0_Clk or `BSV_RESET_EDGE wciS0_MReset_n)
  if (wciS0_MReset_n == `BSV_RESET_VALUE)
    begin
      wci_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wsiM_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wsiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (wci_isReset_isInReset$EN)
	wci_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wci_isReset_isInReset$D_IN;
      if (wsiM_isReset_isInReset$EN)
	wsiM_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wsiM_isReset_isInReset$D_IN;
      if (wsiS_isReset_isInReset$EN)
	wsiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wsiS_isReset_isInReset$D_IN;
    end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    byteCount = 32'hAAAAAAAA;
    frameGateCtrl = 32'hAAAAAAAA;
    frameSize = 32'hAAAAAAAA;
    gateSize = 32'hAAAAAAAA;
    gated = 1'h0;
    op0MesgCnt = 32'hAAAAAAAA;
    otherMesgCnt = 32'hAAAAAAAA;
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
    wsiM_burstKind = 2'h2;
    wsiM_errorSticky = 1'h0;
    wsiM_iMesgCount = 32'hAAAAAAAA;
    wsiM_isReset_isInReset = 1'h0;
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
      if (WILL_FIRE_RL_wci_ctl_op_start)
	begin
	  v__h3701 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3701,
		 wci_reqF$D_OUT[36:34],
		 wci_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	begin
	  v__h11217 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	$display("[%0d]: %m: Starting FrameGate frameGateCtrl:%0x",
		 v__h11217,
		 frameGateCtrl);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/prm/FrameGate.bsv\", line 68, column 60: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/prm/FrameGate.bsv\", line 68, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/prm/FrameGate.bsv\", line 68, column 46: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	begin
	  v__h4020 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h4020,
		 wci_cEdge,
		 wci_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	begin
	  v__h3876 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h3876,
		 wci_cEdge,
		 wci_cState,
		 wci_nState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/prm/FrameGate.bsv\", line 68, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/prm/FrameGate.bsv\", line 68, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/prm/FrameGate.bsv\", line 68, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/prm/FrameGate.bsv\", line 68, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and [RL_wci_cfrd] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/prm/FrameGate.bsv\", line 68, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/prm/FrameGate.bsv\", line 68, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/prm/FrameGate.bsv\", line 68, column 36: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
  end
  // synopsys translate_on
endmodule