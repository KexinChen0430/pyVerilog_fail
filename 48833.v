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
  wire [312 : 0] wsiM_reqFifo_x_wire_wget, wsiS_wsiReq_wget;
  wire [255 : 0] wsi_Es_mData_w_wget;
  wire [95 : 0] wsiM_extStatusW_wget, wsiS_extStatusW_wget;
  wire [71 : 0] wci_wslv_wciReq_wget;
  wire [33 : 0] wci_wslv_respF_x_wire_wget;
  wire [31 : 0] wci_wci_Es_mAddr_w_wget,
		wci_wci_Es_mData_w_wget,
		wsi_Es_mByteEn_w_wget;
  wire [11 : 0] wsi_Es_mBurstLength_w_wget;
  wire [7 : 0] wsi_Es_mReqInfo_w_wget;
  wire [3 : 0] wci_wci_Es_mByteEn_w_wget;
  wire [2 : 0] wci_wci_Es_mCmd_w_wget,
	       wci_wslv_wEdge_wget,
	       wsi_Es_mCmd_w_wget;
  wire wci_wci_Es_mAddrSpace_w_wget,
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
  // register biasValue
  reg [31 : 0] biasValue;
  wire [31 : 0] biasValue_D_IN;
  wire biasValue_EN;
  // register controlReg
  reg [31 : 0] controlReg;
  wire [31 : 0] controlReg_D_IN;
  wire controlReg_EN;
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
  reg [312 : 0] wsiM_reqFifo_q_0;
  reg [312 : 0] wsiM_reqFifo_q_0_D_IN;
  wire wsiM_reqFifo_q_0_EN;
  // register wsiM_reqFifo_q_1
  reg [312 : 0] wsiM_reqFifo_q_1;
  reg [312 : 0] wsiM_reqFifo_q_1_D_IN;
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
  // ports of submodule wci_wslv_reqF
  wire [71 : 0] wci_wslv_reqF_D_IN, wci_wslv_reqF_D_OUT;
  wire wci_wslv_reqF_CLR,
       wci_wslv_reqF_DEQ,
       wci_wslv_reqF_EMPTY_N,
       wci_wslv_reqF_ENQ;
  // ports of submodule wsiS_reqFifo
  wire [312 : 0] wsiS_reqFifo_D_IN, wsiS_reqFifo_D_OUT;
  wire wsiS_reqFifo_CLR,
       wsiS_reqFifo_DEQ,
       wsiS_reqFifo_EMPTY_N,
       wsiS_reqFifo_ENQ,
       wsiS_reqFifo_FULL_N;
  // rule scheduling signals
  wire WILL_FIRE_RL_wci_cfrd,
       WILL_FIRE_RL_wci_cfwr,
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
       WILL_FIRE_RL_wsiM_reqFifo_incCtr,
       WILL_FIRE_RL_wsiS_reqFifo_enq,
       WILL_FIRE_RL_wsiS_reqFifo_reset;
  // inputs to muxes for submodule ports
  reg [33 : 0] MUX_wci_wslv_respF_q_0_write_1__VAL_2;
  wire [312 : 0] MUX_wsiM_reqFifo_q_0_write_1__VAL_1,
		 MUX_wsiM_reqFifo_q_0_write_1__VAL_2,
		 MUX_wsiM_reqFifo_q_1_write_1__VAL_1;
  wire [33 : 0] MUX_wci_wslv_respF_q_0_write_1__VAL_1,
		MUX_wci_wslv_respF_q_1_write_1__VAL_1,
		MUX_wci_wslv_respF_x_wire_wset_1__VAL_1,
		MUX_wci_wslv_respF_x_wire_wset_1__VAL_2;
  wire [1 : 0] MUX_wci_wslv_respF_cntr_r_write_1__VAL_2,
	       MUX_wsiM_reqFifo_cntr_r_write_1__VAL_1,
	       MUX_wsiM_reqFifo_cntr_r_write_1__VAL_2;
  wire MUX_biasValue_write_1__SEL_1,
       MUX_biasValue_write_1__SEL_2,
       MUX_controlReg_write_1__SEL_1,
       MUX_wci_wslv_illegalEdge_write_1__SEL_1,
       MUX_wci_wslv_illegalEdge_write_1__VAL_1,
       MUX_wci_wslv_respF_q_0_write_1__SEL_1,
       MUX_wci_wslv_respF_q_0_write_1__SEL_2,
       MUX_wci_wslv_respF_q_1_write_1__SEL_1,
       MUX_wci_wslv_respF_q_1_write_1__SEL_2,
       MUX_wsiM_reqFifo_q_0_write_1__SEL_1,
       MUX_wsiM_reqFifo_q_0_write_1__SEL_2,
       MUX_wsiM_reqFifo_q_1_write_1__SEL_1,
       MUX_wsiM_reqFifo_q_1_write_1__SEL_2,
       MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3;
  // remaining internal signals
  reg [63 : 0] v__h12026, v__h12181, v__h3574, v__h3749, v__h3893;
  reg [31 : 0] _theResult____h12165;
  wire [255 : 0] x_data__h10099;
  wire [31 : 0] rdat__h12255,
		rdat__h12355,
		rdat__h12369,
		rdat__h12377,
		rdat__h12383,
		rdat__h12397,
		rdat__h12405;
  wire [15 : 0] x__h12259;
  wire [1 : 0] wci_wslv_respF_cntr_r_8_MINUS_1___d27;
  wire _dfoo1, _dfoo3, _dfoo5, _dfoo7;
  // value method wciS0_sResp
  assign wciS0_SResp = wci_wslv_respF_q_0[33:32] ;
  // value method wciS0_sData
  assign wciS0_SData = wci_wslv_respF_q_0[31:0] ;
  // value method wciS0_sThreadBusy
  assign wciS0_SThreadBusy =
	     wci_wslv_reqF_countReg > 2'd1 || wci_wslv_isReset_isInReset ;
  // value method wciS0_sFlag
  assign wciS0_SFlag = { 1'd1, wci_wslv_sFlagReg } ;
  // value method wsiS0_sThreadBusy
  assign wsiS0_SThreadBusy =
	     !wsiS_sThreadBusy_dw_whas || wsiS_sThreadBusy_dw_wget ;
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
  // submodule wsiS_reqFifo
  SizedFIFO #(.p1width(32'd313),
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
  // rule RL_wci_wslv_ctl_op_start
  assign WILL_FIRE_RL_wci_wslv_ctl_op_start =
	     wci_wslv_reqF_EMPTY_N && wci_wslv_wci_ctrl_pw_whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
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
  // rule RL_wci_cfwr
  assign WILL_FIRE_RL_wci_cfwr =
	     wci_wslv_respF_cntr_r != 2'd2 && wci_wslv_reqF_EMPTY_N &&
	     wci_wslv_wci_cfwr_pw_whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_wslv_ctl_op_complete
  assign WILL_FIRE_RL_wci_wslv_ctl_op_complete =
	     wci_wslv_respF_cntr_r != 2'd2 && wci_wslv_ctlOpActive &&
	     wci_wslv_ctlAckReg ;
  // rule RL_wci_cfrd
  assign WILL_FIRE_RL_wci_cfrd =
	     wci_wslv_respF_cntr_r != 2'd2 && wci_wslv_reqF_EMPTY_N &&
	     wci_wslv_wci_cfrd_pw_whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
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
  // rule RL_wsiM_reqFifo_deq
  assign WILL_FIRE_RL_wsiM_reqFifo_deq =
	     wsiM_reqFifo_cntr_r != 2'd0 && !wsiM_sThreadBusy_d ;
  // rule RL_wsiM_reqFifo_incCtr
  assign WILL_FIRE_RL_wsiM_reqFifo_incCtr =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     !WILL_FIRE_RL_wsiM_reqFifo_deq ;
  // rule RL_wsiM_reqFifo_decCtr
  assign WILL_FIRE_RL_wsiM_reqFifo_decCtr =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     !MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  // rule RL_wsiM_reqFifo_both
  assign WILL_FIRE_RL_wsiM_reqFifo_both =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  // rule RL_wsiS_reqFifo_enq
  assign WILL_FIRE_RL_wsiS_reqFifo_enq =
	     wsiS_reqFifo_FULL_N && wsiS_operateD && wsiS_peerIsReady &&
	     wsiS_wsiReq_wget[312:310] == 3'd1 ;
  // rule RL_wsiS_reqFifo_reset
  assign WILL_FIRE_RL_wsiS_reqFifo_reset =
	     WILL_FIRE_RL_wsiS_reqFifo_enq ||
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  // inputs to muxes for submodule ports
  assign MUX_biasValue_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF_D_OUT[39:32] == 8'h0 ;
  assign MUX_biasValue_write_1__SEL_2 =
	     wci_wslv_wci_ctrl_pw_whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd0 &&
	     wci_wslv_reqF_D_OUT[36:34] == 3'd0 ;
  assign MUX_controlReg_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF_D_OUT[39:32] == 8'h04 ;
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
  assign MUX_wsiM_reqFifo_q_0_write_1__SEL_1 =
	     WILL_FIRE_RL_wsiM_reqFifo_both && _dfoo7 ;
  assign MUX_wsiM_reqFifo_q_0_write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_cntr_r == 2'd0 ;
  assign MUX_wsiM_reqFifo_q_1_write_1__SEL_1 =
	     WILL_FIRE_RL_wsiM_reqFifo_both && _dfoo5 ;
  assign MUX_wsiM_reqFifo_q_1_write_1__SEL_2 =
	     WILL_FIRE_RL_wsiM_reqFifo_incCtr && wsiM_reqFifo_cntr_r == 2'd1 ;
  assign MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 =
	     wsiM_reqFifo_cntr_r != 2'd2 && wsiS_reqFifo_EMPTY_N &&
	     wci_wslv_cState == 3'd2 ;
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
  assign MUX_wci_wslv_respF_x_wire_wset_1__VAL_2 =
	     { 2'd1, _theResult____h12165 } ;
  assign MUX_wsiM_reqFifo_cntr_r_write_1__VAL_1 = wsiM_reqFifo_cntr_r - 2'd1 ;
  assign MUX_wsiM_reqFifo_cntr_r_write_1__VAL_2 = wsiM_reqFifo_cntr_r + 2'd1 ;
  assign MUX_wsiM_reqFifo_q_0_write_1__VAL_1 =
	     (wsiM_reqFifo_cntr_r == 2'd1) ?
	       MUX_wsiM_reqFifo_q_0_write_1__VAL_2 :
	       wsiM_reqFifo_q_1 ;
  assign MUX_wsiM_reqFifo_q_0_write_1__VAL_2 =
	     { wsiS_reqFifo_D_OUT[312:296],
	       x_data__h10099,
	       wsiS_reqFifo_D_OUT[39:0] } ;
  assign MUX_wsiM_reqFifo_q_1_write_1__VAL_1 =
	     (wsiM_reqFifo_cntr_r == 2'd2) ?
	       MUX_wsiM_reqFifo_q_0_write_1__VAL_2 :
	       313'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00 ;
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
	     MUX_biasValue_write_1__SEL_2 ;
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
  assign wsiM_reqFifo_x_wire_wget = MUX_wsiM_reqFifo_q_0_write_1__VAL_2 ;
  assign wsiM_reqFifo_x_wire_whas =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  assign wsiM_operateD_1_wget = 1'd1 ;
  assign wsiM_operateD_1_whas = wci_wslv_cState == 3'd2 ;
  assign wsiM_peerIsReady_1_wget = 1'd1 ;
  assign wsiM_peerIsReady_1_whas = wsiM0_SReset_n ;
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
  assign wsiS_reqFifo_r_enq_whas = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_r_deq_whas =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  assign wsiS_reqFifo_r_clr_whas = 1'b0 ;
  assign wsiS_reqFifo_doResetEnq_whas = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_doResetDeq_whas =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  assign wsiS_reqFifo_doResetClr_whas = 1'b0 ;
  assign wsiM_reqFifo_enqueueing_whas =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  assign wsiM_reqFifo_dequeueing_whas = WILL_FIRE_RL_wsiM_reqFifo_deq ;
  assign wsiM_sThreadBusy_pw_whas = wsiM0_SThreadBusy ;
  assign wsi_Es_mReqLast_w_whas = wsiS0_MReqLast ;
  assign wsi_Es_mBurstPrecise_w_whas = wsiS0_MBurstPrecise ;
  assign wsi_Es_mDataInfo_w_whas = 1'd1 ;
  assign wsiS_extStatusW_wget =
	     { wsiS_pMesgCount, wsiS_iMesgCount, wsiS_tBusyCount } ;
  assign wsiM_extStatusW_wget =
	     { wsiM_pMesgCount, wsiM_iMesgCount, wsiM_tBusyCount } ;
  // register biasValue
  assign biasValue_D_IN =
	     MUX_biasValue_write_1__SEL_1 ?
	       wci_wslv_reqF_D_OUT[31:0] :
	       32'd0 ;
  assign biasValue_EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF_D_OUT[39:32] == 8'h0 ||
	     MUX_biasValue_write_1__SEL_2 ;
  // register controlReg
  assign controlReg_D_IN =
	     MUX_controlReg_write_1__SEL_1 ?
	       wci_wslv_reqF_D_OUT[31:0] :
	       32'd0 ;
  assign controlReg_EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF_D_OUT[39:32] == 8'h04 ||
	     MUX_biasValue_write_1__SEL_2 ;
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
  // register wsiM_burstKind
  assign wsiM_burstKind_D_IN =
	     (wsiM_burstKind == 2'd0) ?
	       (wsiM_reqFifo_q_0[308] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsiM_burstKind_EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[312:310] == 3'd1 &&
	     (wsiM_burstKind == 2'd0 ||
	      (wsiM_burstKind == 2'd1 || wsiM_burstKind == 2'd2) &&
	      wsiM_reqFifo_q_0[309]) ;
  // register wsiM_errorSticky
  assign wsiM_errorSticky_D_IN = 1'b0 ;
  assign wsiM_errorSticky_EN = 1'b0 ;
  // register wsiM_iMesgCount
  assign wsiM_iMesgCount_D_IN = wsiM_iMesgCount + 32'd1 ;
  assign wsiM_iMesgCount_EN =
	     WILL_FIRE_RL_wsiM_reqFifo_deq &&
	     wsiM_reqFifo_q_0[312:310] == 3'd1 &&
	     wsiM_burstKind == 2'd2 &&
	     wsiM_reqFifo_q_0[309] ;
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
	     wsiM_reqFifo_q_0[312:310] == 3'd1 &&
	     wsiM_burstKind == 2'd1 &&
	     wsiM_reqFifo_q_0[309] ;
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
		   313'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsiM_reqFifo_q_0_EN =
	     WILL_FIRE_RL_wsiM_reqFifo_both && _dfoo7 ||
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
	      313'h00000AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA00;
      default: wsiM_reqFifo_q_1_D_IN =
		   313'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wsiM_reqFifo_q_1_EN =
	     WILL_FIRE_RL_wsiM_reqFifo_both && _dfoo5 ||
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
	     wsiM_reqFifo_q_0[312:310] == 3'd1 ;
  // register wsiS_burstKind
  assign wsiS_burstKind_D_IN =
	     (wsiS_burstKind == 2'd0) ?
	       (wsiS_wsiReq_wget[308] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsiS_burstKind_EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq &&
	     (wsiS_burstKind == 2'd0 ||
	      (wsiS_burstKind == 2'd1 || wsiS_burstKind == 2'd2) &&
	      wsiS_wsiReq_wget[309]) ;
  // register wsiS_errorSticky
  assign wsiS_errorSticky_D_IN = 1'b0 ;
  assign wsiS_errorSticky_EN = 1'b0 ;
  // register wsiS_iMesgCount
  assign wsiS_iMesgCount_D_IN = wsiS_iMesgCount + 32'd1 ;
  assign wsiS_iMesgCount_EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_burstKind == 2'd2 &&
	     wsiS_wsiReq_wget[309] ;
  // register wsiS_isReset_isInReset
  assign wsiS_isReset_isInReset_D_IN = 1'd0 ;
  assign wsiS_isReset_isInReset_EN = wsiS_isReset_isInReset ;
  // register wsiS_mesgWordLength
  assign wsiS_mesgWordLength_D_IN = wsiS_wordCount ;
  assign wsiS_mesgWordLength_EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_wsiReq_wget[309] ;
  // register wsiS_operateD
  assign wsiS_operateD_D_IN = wci_wslv_cState == 3'd2 ;
  assign wsiS_operateD_EN = 1'd1 ;
  // register wsiS_pMesgCount
  assign wsiS_pMesgCount_D_IN = wsiS_pMesgCount + 32'd1 ;
  assign wsiS_pMesgCount_EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_burstKind == 2'd1 &&
	     wsiS_wsiReq_wget[309] ;
  // register wsiS_peerIsReady
  assign wsiS_peerIsReady_D_IN = wsiS0_MReset_n ;
  assign wsiS_peerIsReady_EN = 1'd1 ;
  // register wsiS_reqFifo_countReg
  assign wsiS_reqFifo_countReg_D_IN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq ?
	       wsiS_reqFifo_countReg + 2'd1 :
	       wsiS_reqFifo_countReg - 2'd1 ;
  assign wsiS_reqFifo_countReg_EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq !=
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  // register wsiS_reqFifo_levelsValid
  assign wsiS_reqFifo_levelsValid_D_IN = WILL_FIRE_RL_wsiS_reqFifo_reset ;
  assign wsiS_reqFifo_levelsValid_EN =
	     wsiM_reqFifo_cntr_r != 2'd2 && wsiS_reqFifo_EMPTY_N &&
	     wci_wslv_cState == 3'd2 ||
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
	     wsiS_wsiReq_wget[309] ? 12'd1 : wsiS_wordCount + 12'd1 ;
  assign wsiS_wordCount_EN = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  // submodule wci_wslv_reqF
  assign wci_wslv_reqF_D_IN = wci_wslv_wciReq_wget ;
  assign wci_wslv_reqF_ENQ = wci_wslv_wciReq_wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF_DEQ = wci_wslv_reqF_r_deq_whas ;
  assign wci_wslv_reqF_CLR = 1'b0 ;
  // submodule wsiS_reqFifo
  assign wsiS_reqFifo_D_IN = wsiS_wsiReq_wget ;
  assign wsiS_reqFifo_ENQ = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_DEQ = MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  assign wsiS_reqFifo_CLR = 1'b0 ;
  // remaining internal signals
  assign _dfoo1 =
	     wci_wslv_respF_cntr_r != 2'd2 ||
	     wci_wslv_respF_cntr_r_8_MINUS_1___d27 == 2'd1 ;
  assign _dfoo3 =
	     wci_wslv_respF_cntr_r != 2'd1 ||
	     wci_wslv_respF_cntr_r_8_MINUS_1___d27 == 2'd0 ;
  assign _dfoo5 =
	     wsiM_reqFifo_cntr_r != 2'd2 ||
	     MUX_wsiM_reqFifo_cntr_r_write_1__VAL_1 == 2'd1 ;
  assign _dfoo7 =
	     wsiM_reqFifo_cntr_r != 2'd1 ||
	     MUX_wsiM_reqFifo_cntr_r_write_1__VAL_1 == 2'd0 ;
  assign rdat__h12255 = hasDebugLogic ? { 16'd0, x__h12259 } : 32'd0 ;
  assign rdat__h12355 = hasDebugLogic ? wsiS_extStatusW_wget[95:64] : 32'd0 ;
  assign rdat__h12369 = hasDebugLogic ? wsiS_extStatusW_wget[63:32] : 32'd0 ;
  assign rdat__h12377 = hasDebugLogic ? wsiS_extStatusW_wget[31:0] : 32'd0 ;
  assign rdat__h12383 = hasDebugLogic ? wsiM_extStatusW_wget[95:64] : 32'd0 ;
  assign rdat__h12397 = hasDebugLogic ? wsiM_extStatusW_wget[63:32] : 32'd0 ;
  assign rdat__h12405 = hasDebugLogic ? wsiM_extStatusW_wget[31:0] : 32'd0 ;
  assign wci_wslv_respF_cntr_r_8_MINUS_1___d27 =
	     wci_wslv_respF_cntr_r - 2'd1 ;
  assign x__h12259 = { wsiS_statusR, wsiM_statusR } ;
  assign x_data__h10099 =
	     { wsiS_reqFifo_D_OUT[295:264] + biasValue,
	       wsiS_reqFifo_D_OUT[263:232] + biasValue,
	       wsiS_reqFifo_D_OUT[231:200] + biasValue,
	       wsiS_reqFifo_D_OUT[199:168] + biasValue,
	       wsiS_reqFifo_D_OUT[167:136] + biasValue,
	       wsiS_reqFifo_D_OUT[135:104] + biasValue,
	       wsiS_reqFifo_D_OUT[103:72] + biasValue,
	       wsiS_reqFifo_D_OUT[71:40] + biasValue } ;
  always@(wci_wslv_reqF_D_OUT or
	  biasValue or
	  controlReg or
	  rdat__h12255 or
	  rdat__h12355 or
	  rdat__h12369 or
	  rdat__h12377 or rdat__h12383 or rdat__h12397 or rdat__h12405)
  begin
    case (wci_wslv_reqF_D_OUT[39:32])
      8'h0: _theResult____h12165 = biasValue;
      8'h04: _theResult____h12165 = controlReg;
      8'h20: _theResult____h12165 = rdat__h12255;
      8'h24: _theResult____h12165 = rdat__h12355;
      8'h28: _theResult____h12165 = rdat__h12369;
      8'h2C: _theResult____h12165 = rdat__h12377;
      8'h30: _theResult____h12165 = rdat__h12383;
      8'h34: _theResult____h12165 = rdat__h12397;
      8'h38: _theResult____h12165 = rdat__h12405;
      default: _theResult____h12165 = 32'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (wciS0_MReset_n == `BSV_RESET_VALUE)
      begin
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
	wsiM_burstKind <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wsiM_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiM_iMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiM_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiM_pMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wsiM_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wsiM_reqFifo_cntr_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
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
    if (biasValue_EN) biasValue <= `BSV_ASSIGNMENT_DELAY biasValue_D_IN;
    if (controlReg_EN) controlReg <= `BSV_ASSIGNMENT_DELAY controlReg_D_IN;
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
      wsiM_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wsiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (wci_wslv_isReset_isInReset_EN)
	wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wci_wslv_isReset_isInReset_D_IN;
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
    biasValue = 32'hAAAAAAAA;
    controlReg = 32'hAAAAAAAA;
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
    wsiM_burstKind = 2'h2;
    wsiM_errorSticky = 1'h0;
    wsiM_iMesgCount = 32'hAAAAAAAA;
    wsiM_isReset_isInReset = 1'h0;
    wsiM_operateD = 1'h0;
    wsiM_pMesgCount = 32'hAAAAAAAA;
    wsiM_peerIsReady = 1'h0;
    wsiM_reqFifo_cntr_r = 2'h2;
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
      if (WILL_FIRE_RL_wci_wslv_ctl_op_start)
	begin
	  v__h3574 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3574,
		 wci_wslv_reqF_D_OUT[36:34],
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (MUX_biasValue_write_1__SEL_2 && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/BiasWorker.bsv\", line 67, column 48: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (MUX_biasValue_write_1__SEL_2 && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/BiasWorker.bsv\", line 67, column 48: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/BiasWorker.bsv\", line 67, column 62: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	begin
	  v__h12026 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	$display("[%0d]: %m: WCI CONFIG WRITE Addr:%0x BE:%0x Data:%0x",
		 v__h12026,
		 wci_wslv_reqF_D_OUT[63:32],
		 wci_wslv_reqF_D_OUT[67:64],
		 wci_wslv_reqF_D_OUT[31:0]);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	begin
	  v__h3893 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h3893,
		 wci_wslv_cEdge,
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	begin
	  v__h3749 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h3749,
		 wci_wslv_cEdge,
		 wci_wslv_cState,
		 wci_wslv_nState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	begin
	  v__h12181 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	$display("[%0d]: %m: WCI CONFIG READ Addr:%0x BE:%0x Data:%0x",
		 v__h12181,
		 wci_wslv_reqF_D_OUT[63:32],
		 wci_wslv_reqF_D_OUT[67:64],
		 _theResult____h12165);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/BiasWorker.bsv\", line 67, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/BiasWorker.bsv\", line 67, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && MUX_biasValue_write_1__SEL_2)
	$display("Error: \"bsv/wrk/BiasWorker.bsv\", line 67, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/wrk/BiasWorker.bsv\", line 67, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and [RL_wci_cfrd] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/BiasWorker.bsv\", line 67, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/BiasWorker.bsv\", line 67, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && MUX_biasValue_write_1__SEL_2)
	$display("Error: \"bsv/wrk/BiasWorker.bsv\", line 67, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
  end
  // synopsys translate_on
endmodule