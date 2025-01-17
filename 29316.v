module outputs
  wire [31 : 0] wciS0_SData;
  wire [1 : 0] wciS0_SFlag, wciS0_SResp;
  wire wciS0_SThreadBusy,
       wsiS0_SReset_n,
       wsiS0_SThreadBusy,
       wtiS0_SReset_n,
       wtiS0_SThreadBusy;
  // inlined wires
  wire [95 : 0] wsiS_extStatusW_wget;
  wire [71 : 0] wci_wslv_wciReq_wget;
  wire [66 : 0] wtiS_wtiReq_wget;
  wire [63 : 0] nowW_wget, wti_Es_mData_w_wget;
  wire [60 : 0] wsiS_wsiReq_wget;
  wire [33 : 0] wci_wslv_respF_x_wire_wget;
  wire [31 : 0] dataBram_0_serverAdapterA_outData_enqData_wget,
		dataBram_0_serverAdapterA_outData_outData_wget,
		dataBram_0_serverAdapterB_outData_enqData_wget,
		dataBram_0_serverAdapterB_outData_outData_wget,
		metaBram_0_serverAdapterA_outData_enqData_wget,
		metaBram_0_serverAdapterA_outData_outData_wget,
		metaBram_0_serverAdapterB_outData_enqData_wget,
		metaBram_0_serverAdapterB_outData_outData_wget,
		metaBram_1_serverAdapterA_outData_enqData_wget,
		metaBram_1_serverAdapterA_outData_outData_wget,
		metaBram_1_serverAdapterB_outData_enqData_wget,
		metaBram_1_serverAdapterB_outData_outData_wget,
		metaBram_2_serverAdapterA_outData_enqData_wget,
		metaBram_2_serverAdapterA_outData_outData_wget,
		metaBram_2_serverAdapterB_outData_enqData_wget,
		metaBram_2_serverAdapterB_outData_outData_wget,
		metaBram_3_serverAdapterA_outData_enqData_wget,
		metaBram_3_serverAdapterA_outData_outData_wget,
		metaBram_3_serverAdapterB_outData_enqData_wget,
		metaBram_3_serverAdapterB_outData_outData_wget,
		statusReg_w_wget,
		wci_wci_Es_mAddr_w_wget,
		wci_wci_Es_mData_w_wget,
		wsi_Es_mData_w_wget;
  wire [11 : 0] wsi_Es_mBurstLength_w_wget;
  wire [7 : 0] wsi_Es_mReqInfo_w_wget;
  wire [3 : 0] wci_wci_Es_mByteEn_w_wget, wsi_Es_mByteEn_w_wget;
  wire [2 : 0] dataBram_0_serverAdapterA_cnt_1_wget,
	       dataBram_0_serverAdapterA_cnt_2_wget,
	       dataBram_0_serverAdapterA_cnt_3_wget,
	       dataBram_0_serverAdapterB_cnt_1_wget,
	       dataBram_0_serverAdapterB_cnt_2_wget,
	       dataBram_0_serverAdapterB_cnt_3_wget,
	       metaBram_0_serverAdapterA_cnt_1_wget,
	       metaBram_0_serverAdapterA_cnt_2_wget,
	       metaBram_0_serverAdapterA_cnt_3_wget,
	       metaBram_0_serverAdapterB_cnt_1_wget,
	       metaBram_0_serverAdapterB_cnt_2_wget,
	       metaBram_0_serverAdapterB_cnt_3_wget,
	       metaBram_1_serverAdapterA_cnt_1_wget,
	       metaBram_1_serverAdapterA_cnt_2_wget,
	       metaBram_1_serverAdapterA_cnt_3_wget,
	       metaBram_1_serverAdapterB_cnt_1_wget,
	       metaBram_1_serverAdapterB_cnt_2_wget,
	       metaBram_1_serverAdapterB_cnt_3_wget,
	       metaBram_2_serverAdapterA_cnt_1_wget,
	       metaBram_2_serverAdapterA_cnt_2_wget,
	       metaBram_2_serverAdapterA_cnt_3_wget,
	       metaBram_2_serverAdapterB_cnt_1_wget,
	       metaBram_2_serverAdapterB_cnt_2_wget,
	       metaBram_2_serverAdapterB_cnt_3_wget,
	       metaBram_3_serverAdapterA_cnt_1_wget,
	       metaBram_3_serverAdapterA_cnt_2_wget,
	       metaBram_3_serverAdapterA_cnt_3_wget,
	       metaBram_3_serverAdapterB_cnt_1_wget,
	       metaBram_3_serverAdapterB_cnt_2_wget,
	       metaBram_3_serverAdapterB_cnt_3_wget,
	       wci_wci_Es_mCmd_w_wget,
	       wci_wslv_wEdge_wget,
	       wsi_Es_mCmd_w_wget,
	       wti_Es_mCmd_w_wget;
  wire [1 : 0] dataBram_0_serverAdapterA_s1_1_wget,
	       dataBram_0_serverAdapterA_writeWithResp_wget,
	       dataBram_0_serverAdapterB_s1_1_wget,
	       dataBram_0_serverAdapterB_writeWithResp_wget,
	       metaBram_0_serverAdapterA_s1_1_wget,
	       metaBram_0_serverAdapterA_writeWithResp_wget,
	       metaBram_0_serverAdapterB_s1_1_wget,
	       metaBram_0_serverAdapterB_writeWithResp_wget,
	       metaBram_1_serverAdapterA_s1_1_wget,
	       metaBram_1_serverAdapterA_writeWithResp_wget,
	       metaBram_1_serverAdapterB_s1_1_wget,
	       metaBram_1_serverAdapterB_writeWithResp_wget,
	       metaBram_2_serverAdapterA_s1_1_wget,
	       metaBram_2_serverAdapterA_writeWithResp_wget,
	       metaBram_2_serverAdapterB_s1_1_wget,
	       metaBram_2_serverAdapterB_writeWithResp_wget,
	       metaBram_3_serverAdapterA_s1_1_wget,
	       metaBram_3_serverAdapterA_writeWithResp_wget,
	       metaBram_3_serverAdapterB_s1_1_wget,
	       metaBram_3_serverAdapterB_writeWithResp_wget;
  wire dataBram_0_serverAdapterA_cnt_1_whas,
       dataBram_0_serverAdapterA_cnt_2_whas,
       dataBram_0_serverAdapterA_cnt_3_whas,
       dataBram_0_serverAdapterA_outData_deqCalled_whas,
       dataBram_0_serverAdapterA_outData_enqData_whas,
       dataBram_0_serverAdapterA_outData_outData_whas,
       dataBram_0_serverAdapterA_s1_1_whas,
       dataBram_0_serverAdapterA_writeWithResp_whas,
       dataBram_0_serverAdapterB_cnt_1_whas,
       dataBram_0_serverAdapterB_cnt_2_whas,
       dataBram_0_serverAdapterB_cnt_3_whas,
       dataBram_0_serverAdapterB_outData_deqCalled_whas,
       dataBram_0_serverAdapterB_outData_enqData_whas,
       dataBram_0_serverAdapterB_outData_outData_whas,
       dataBram_0_serverAdapterB_s1_1_whas,
       dataBram_0_serverAdapterB_writeWithResp_whas,
       metaBram_0_serverAdapterA_cnt_1_whas,
       metaBram_0_serverAdapterA_cnt_2_whas,
       metaBram_0_serverAdapterA_cnt_3_whas,
       metaBram_0_serverAdapterA_outData_deqCalled_whas,
       metaBram_0_serverAdapterA_outData_enqData_whas,
       metaBram_0_serverAdapterA_outData_outData_whas,
       metaBram_0_serverAdapterA_s1_1_whas,
       metaBram_0_serverAdapterA_writeWithResp_whas,
       metaBram_0_serverAdapterB_cnt_1_whas,
       metaBram_0_serverAdapterB_cnt_2_whas,
       metaBram_0_serverAdapterB_cnt_3_whas,
       metaBram_0_serverAdapterB_outData_deqCalled_whas,
       metaBram_0_serverAdapterB_outData_enqData_whas,
       metaBram_0_serverAdapterB_outData_outData_whas,
       metaBram_0_serverAdapterB_s1_1_whas,
       metaBram_0_serverAdapterB_writeWithResp_whas,
       metaBram_1_serverAdapterA_cnt_1_whas,
       metaBram_1_serverAdapterA_cnt_2_whas,
       metaBram_1_serverAdapterA_cnt_3_whas,
       metaBram_1_serverAdapterA_outData_deqCalled_whas,
       metaBram_1_serverAdapterA_outData_enqData_whas,
       metaBram_1_serverAdapterA_outData_outData_whas,
       metaBram_1_serverAdapterA_s1_1_whas,
       metaBram_1_serverAdapterA_writeWithResp_whas,
       metaBram_1_serverAdapterB_cnt_1_whas,
       metaBram_1_serverAdapterB_cnt_2_whas,
       metaBram_1_serverAdapterB_cnt_3_whas,
       metaBram_1_serverAdapterB_outData_deqCalled_whas,
       metaBram_1_serverAdapterB_outData_enqData_whas,
       metaBram_1_serverAdapterB_outData_outData_whas,
       metaBram_1_serverAdapterB_s1_1_whas,
       metaBram_1_serverAdapterB_writeWithResp_whas,
       metaBram_2_serverAdapterA_cnt_1_whas,
       metaBram_2_serverAdapterA_cnt_2_whas,
       metaBram_2_serverAdapterA_cnt_3_whas,
       metaBram_2_serverAdapterA_outData_deqCalled_whas,
       metaBram_2_serverAdapterA_outData_enqData_whas,
       metaBram_2_serverAdapterA_outData_outData_whas,
       metaBram_2_serverAdapterA_s1_1_whas,
       metaBram_2_serverAdapterA_writeWithResp_whas,
       metaBram_2_serverAdapterB_cnt_1_whas,
       metaBram_2_serverAdapterB_cnt_2_whas,
       metaBram_2_serverAdapterB_cnt_3_whas,
       metaBram_2_serverAdapterB_outData_deqCalled_whas,
       metaBram_2_serverAdapterB_outData_enqData_whas,
       metaBram_2_serverAdapterB_outData_outData_whas,
       metaBram_2_serverAdapterB_s1_1_whas,
       metaBram_2_serverAdapterB_writeWithResp_whas,
       metaBram_3_serverAdapterA_cnt_1_whas,
       metaBram_3_serverAdapterA_cnt_2_whas,
       metaBram_3_serverAdapterA_cnt_3_whas,
       metaBram_3_serverAdapterA_outData_deqCalled_whas,
       metaBram_3_serverAdapterA_outData_enqData_whas,
       metaBram_3_serverAdapterA_outData_outData_whas,
       metaBram_3_serverAdapterA_s1_1_whas,
       metaBram_3_serverAdapterA_writeWithResp_whas,
       metaBram_3_serverAdapterB_cnt_1_whas,
       metaBram_3_serverAdapterB_cnt_2_whas,
       metaBram_3_serverAdapterB_cnt_3_whas,
       metaBram_3_serverAdapterB_outData_deqCalled_whas,
       metaBram_3_serverAdapterB_outData_enqData_whas,
       metaBram_3_serverAdapterB_outData_outData_whas,
       metaBram_3_serverAdapterB_s1_1_whas,
       metaBram_3_serverAdapterB_writeWithResp_whas,
       nowW_whas,
       statusReg_w_whas,
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
       wsi_Es_mReqLast_w_whas,
       wtiS_operateD_1_wget,
       wtiS_operateD_1_whas,
       wtiS_wtiReq_whas,
       wti_Es_mCmd_w_whas,
       wti_Es_mData_w_whas;
  // register controlReg
  reg [31 : 0] controlReg;
  wire [31 : 0] controlReg_D_IN;
  wire controlReg_EN;
  // register dataBram_0_serverAdapterA_cnt
  reg [2 : 0] dataBram_0_serverAdapterA_cnt;
  wire [2 : 0] dataBram_0_serverAdapterA_cnt_D_IN;
  wire dataBram_0_serverAdapterA_cnt_EN;
  // register dataBram_0_serverAdapterA_s1
  reg [1 : 0] dataBram_0_serverAdapterA_s1;
  wire [1 : 0] dataBram_0_serverAdapterA_s1_D_IN;
  wire dataBram_0_serverAdapterA_s1_EN;
  // register dataBram_0_serverAdapterB_cnt
  reg [2 : 0] dataBram_0_serverAdapterB_cnt;
  wire [2 : 0] dataBram_0_serverAdapterB_cnt_D_IN;
  wire dataBram_0_serverAdapterB_cnt_EN;
  // register dataBram_0_serverAdapterB_s1
  reg [1 : 0] dataBram_0_serverAdapterB_s1;
  wire [1 : 0] dataBram_0_serverAdapterB_s1_D_IN;
  wire dataBram_0_serverAdapterB_s1_EN;
  // register dataCount
  reg [31 : 0] dataCount;
  reg [31 : 0] dataCount_D_IN;
  wire dataCount_EN;
  // register isFirst
  reg isFirst;
  wire isFirst_D_IN, isFirst_EN;
  // register mesgLengthSoFar
  reg [13 : 0] mesgLengthSoFar;
  wire [13 : 0] mesgLengthSoFar_D_IN;
  wire mesgLengthSoFar_EN;
  // register metaBram_0_serverAdapterA_cnt
  reg [2 : 0] metaBram_0_serverAdapterA_cnt;
  wire [2 : 0] metaBram_0_serverAdapterA_cnt_D_IN;
  wire metaBram_0_serverAdapterA_cnt_EN;
  // register metaBram_0_serverAdapterA_s1
  reg [1 : 0] metaBram_0_serverAdapterA_s1;
  wire [1 : 0] metaBram_0_serverAdapterA_s1_D_IN;
  wire metaBram_0_serverAdapterA_s1_EN;
  // register metaBram_0_serverAdapterB_cnt
  reg [2 : 0] metaBram_0_serverAdapterB_cnt;
  wire [2 : 0] metaBram_0_serverAdapterB_cnt_D_IN;
  wire metaBram_0_serverAdapterB_cnt_EN;
  // register metaBram_0_serverAdapterB_s1
  reg [1 : 0] metaBram_0_serverAdapterB_s1;
  wire [1 : 0] metaBram_0_serverAdapterB_s1_D_IN;
  wire metaBram_0_serverAdapterB_s1_EN;
  // register metaBram_1_serverAdapterA_cnt
  reg [2 : 0] metaBram_1_serverAdapterA_cnt;
  wire [2 : 0] metaBram_1_serverAdapterA_cnt_D_IN;
  wire metaBram_1_serverAdapterA_cnt_EN;
  // register metaBram_1_serverAdapterA_s1
  reg [1 : 0] metaBram_1_serverAdapterA_s1;
  wire [1 : 0] metaBram_1_serverAdapterA_s1_D_IN;
  wire metaBram_1_serverAdapterA_s1_EN;
  // register metaBram_1_serverAdapterB_cnt
  reg [2 : 0] metaBram_1_serverAdapterB_cnt;
  wire [2 : 0] metaBram_1_serverAdapterB_cnt_D_IN;
  wire metaBram_1_serverAdapterB_cnt_EN;
  // register metaBram_1_serverAdapterB_s1
  reg [1 : 0] metaBram_1_serverAdapterB_s1;
  wire [1 : 0] metaBram_1_serverAdapterB_s1_D_IN;
  wire metaBram_1_serverAdapterB_s1_EN;
  // register metaBram_2_serverAdapterA_cnt
  reg [2 : 0] metaBram_2_serverAdapterA_cnt;
  wire [2 : 0] metaBram_2_serverAdapterA_cnt_D_IN;
  wire metaBram_2_serverAdapterA_cnt_EN;
  // register metaBram_2_serverAdapterA_s1
  reg [1 : 0] metaBram_2_serverAdapterA_s1;
  wire [1 : 0] metaBram_2_serverAdapterA_s1_D_IN;
  wire metaBram_2_serverAdapterA_s1_EN;
  // register metaBram_2_serverAdapterB_cnt
  reg [2 : 0] metaBram_2_serverAdapterB_cnt;
  wire [2 : 0] metaBram_2_serverAdapterB_cnt_D_IN;
  wire metaBram_2_serverAdapterB_cnt_EN;
  // register metaBram_2_serverAdapterB_s1
  reg [1 : 0] metaBram_2_serverAdapterB_s1;
  wire [1 : 0] metaBram_2_serverAdapterB_s1_D_IN;
  wire metaBram_2_serverAdapterB_s1_EN;
  // register metaBram_3_serverAdapterA_cnt
  reg [2 : 0] metaBram_3_serverAdapterA_cnt;
  wire [2 : 0] metaBram_3_serverAdapterA_cnt_D_IN;
  wire metaBram_3_serverAdapterA_cnt_EN;
  // register metaBram_3_serverAdapterA_s1
  reg [1 : 0] metaBram_3_serverAdapterA_s1;
  wire [1 : 0] metaBram_3_serverAdapterA_s1_D_IN;
  wire metaBram_3_serverAdapterA_s1_EN;
  // register metaBram_3_serverAdapterB_cnt
  reg [2 : 0] metaBram_3_serverAdapterB_cnt;
  wire [2 : 0] metaBram_3_serverAdapterB_cnt_D_IN;
  wire metaBram_3_serverAdapterB_cnt_EN;
  // register metaBram_3_serverAdapterB_s1
  reg [1 : 0] metaBram_3_serverAdapterB_s1;
  wire [1 : 0] metaBram_3_serverAdapterB_s1_D_IN;
  wire metaBram_3_serverAdapterB_s1_EN;
  // register metaCount
  reg [31 : 0] metaCount;
  reg [31 : 0] metaCount_D_IN;
  wire metaCount_EN;
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
  // register wtiS_isReset_isInReset
  reg wtiS_isReset_isInReset;
  wire wtiS_isReset_isInReset_D_IN, wtiS_isReset_isInReset_EN;
  // register wtiS_nowReq
  reg [66 : 0] wtiS_nowReq;
  wire [66 : 0] wtiS_nowReq_D_IN;
  wire wtiS_nowReq_EN;
  // register wtiS_operateD
  reg wtiS_operateD;
  wire wtiS_operateD_D_IN, wtiS_operateD_EN;
  // ports of submodule dataBram_0_memory
  wire [31 : 0] dataBram_0_memory_DIA,
		dataBram_0_memory_DIB,
		dataBram_0_memory_DOA,
		dataBram_0_memory_DOB;
  wire [9 : 0] dataBram_0_memory_ADDRA, dataBram_0_memory_ADDRB;
  wire dataBram_0_memory_ENA,
       dataBram_0_memory_ENB,
       dataBram_0_memory_WEA,
       dataBram_0_memory_WEB;
  // ports of submodule dataBram_0_serverAdapterA_outDataCore
  wire [31 : 0] dataBram_0_serverAdapterA_outDataCore_D_IN,
		dataBram_0_serverAdapterA_outDataCore_D_OUT;
  wire dataBram_0_serverAdapterA_outDataCore_CLR,
       dataBram_0_serverAdapterA_outDataCore_DEQ,
       dataBram_0_serverAdapterA_outDataCore_EMPTY_N,
       dataBram_0_serverAdapterA_outDataCore_ENQ,
       dataBram_0_serverAdapterA_outDataCore_FULL_N;
  // ports of submodule dataBram_0_serverAdapterB_outDataCore
  wire [31 : 0] dataBram_0_serverAdapterB_outDataCore_D_IN,
		dataBram_0_serverAdapterB_outDataCore_D_OUT;
  wire dataBram_0_serverAdapterB_outDataCore_CLR,
       dataBram_0_serverAdapterB_outDataCore_DEQ,
       dataBram_0_serverAdapterB_outDataCore_EMPTY_N,
       dataBram_0_serverAdapterB_outDataCore_ENQ,
       dataBram_0_serverAdapterB_outDataCore_FULL_N;
  // ports of submodule metaBram_0_memory
  wire [31 : 0] metaBram_0_memory_DIA,
		metaBram_0_memory_DIB,
		metaBram_0_memory_DOA,
		metaBram_0_memory_DOB;
  wire [9 : 0] metaBram_0_memory_ADDRA, metaBram_0_memory_ADDRB;
  wire metaBram_0_memory_ENA,
       metaBram_0_memory_ENB,
       metaBram_0_memory_WEA,
       metaBram_0_memory_WEB;
  // ports of submodule metaBram_0_serverAdapterA_outDataCore
  wire [31 : 0] metaBram_0_serverAdapterA_outDataCore_D_IN,
		metaBram_0_serverAdapterA_outDataCore_D_OUT;
  wire metaBram_0_serverAdapterA_outDataCore_CLR,
       metaBram_0_serverAdapterA_outDataCore_DEQ,
       metaBram_0_serverAdapterA_outDataCore_EMPTY_N,
       metaBram_0_serverAdapterA_outDataCore_ENQ,
       metaBram_0_serverAdapterA_outDataCore_FULL_N;
  // ports of submodule metaBram_0_serverAdapterB_outDataCore
  wire [31 : 0] metaBram_0_serverAdapterB_outDataCore_D_IN,
		metaBram_0_serverAdapterB_outDataCore_D_OUT;
  wire metaBram_0_serverAdapterB_outDataCore_CLR,
       metaBram_0_serverAdapterB_outDataCore_DEQ,
       metaBram_0_serverAdapterB_outDataCore_EMPTY_N,
       metaBram_0_serverAdapterB_outDataCore_ENQ,
       metaBram_0_serverAdapterB_outDataCore_FULL_N;
  // ports of submodule metaBram_1_memory
  wire [31 : 0] metaBram_1_memory_DIA,
		metaBram_1_memory_DIB,
		metaBram_1_memory_DOA,
		metaBram_1_memory_DOB;
  wire [9 : 0] metaBram_1_memory_ADDRA, metaBram_1_memory_ADDRB;
  wire metaBram_1_memory_ENA,
       metaBram_1_memory_ENB,
       metaBram_1_memory_WEA,
       metaBram_1_memory_WEB;
  // ports of submodule metaBram_1_serverAdapterA_outDataCore
  wire [31 : 0] metaBram_1_serverAdapterA_outDataCore_D_IN,
		metaBram_1_serverAdapterA_outDataCore_D_OUT;
  wire metaBram_1_serverAdapterA_outDataCore_CLR,
       metaBram_1_serverAdapterA_outDataCore_DEQ,
       metaBram_1_serverAdapterA_outDataCore_EMPTY_N,
       metaBram_1_serverAdapterA_outDataCore_ENQ,
       metaBram_1_serverAdapterA_outDataCore_FULL_N;
  // ports of submodule metaBram_1_serverAdapterB_outDataCore
  wire [31 : 0] metaBram_1_serverAdapterB_outDataCore_D_IN,
		metaBram_1_serverAdapterB_outDataCore_D_OUT;
  wire metaBram_1_serverAdapterB_outDataCore_CLR,
       metaBram_1_serverAdapterB_outDataCore_DEQ,
       metaBram_1_serverAdapterB_outDataCore_EMPTY_N,
       metaBram_1_serverAdapterB_outDataCore_ENQ,
       metaBram_1_serverAdapterB_outDataCore_FULL_N;
  // ports of submodule metaBram_2_memory
  wire [31 : 0] metaBram_2_memory_DIA,
		metaBram_2_memory_DIB,
		metaBram_2_memory_DOA,
		metaBram_2_memory_DOB;
  wire [9 : 0] metaBram_2_memory_ADDRA, metaBram_2_memory_ADDRB;
  wire metaBram_2_memory_ENA,
       metaBram_2_memory_ENB,
       metaBram_2_memory_WEA,
       metaBram_2_memory_WEB;
  // ports of submodule metaBram_2_serverAdapterA_outDataCore
  wire [31 : 0] metaBram_2_serverAdapterA_outDataCore_D_IN,
		metaBram_2_serverAdapterA_outDataCore_D_OUT;
  wire metaBram_2_serverAdapterA_outDataCore_CLR,
       metaBram_2_serverAdapterA_outDataCore_DEQ,
       metaBram_2_serverAdapterA_outDataCore_EMPTY_N,
       metaBram_2_serverAdapterA_outDataCore_ENQ,
       metaBram_2_serverAdapterA_outDataCore_FULL_N;
  // ports of submodule metaBram_2_serverAdapterB_outDataCore
  wire [31 : 0] metaBram_2_serverAdapterB_outDataCore_D_IN,
		metaBram_2_serverAdapterB_outDataCore_D_OUT;
  wire metaBram_2_serverAdapterB_outDataCore_CLR,
       metaBram_2_serverAdapterB_outDataCore_DEQ,
       metaBram_2_serverAdapterB_outDataCore_EMPTY_N,
       metaBram_2_serverAdapterB_outDataCore_ENQ,
       metaBram_2_serverAdapterB_outDataCore_FULL_N;
  // ports of submodule metaBram_3_memory
  wire [31 : 0] metaBram_3_memory_DIA,
		metaBram_3_memory_DIB,
		metaBram_3_memory_DOA,
		metaBram_3_memory_DOB;
  wire [9 : 0] metaBram_3_memory_ADDRA, metaBram_3_memory_ADDRB;
  wire metaBram_3_memory_ENA,
       metaBram_3_memory_ENB,
       metaBram_3_memory_WEA,
       metaBram_3_memory_WEB;
  // ports of submodule metaBram_3_serverAdapterA_outDataCore
  wire [31 : 0] metaBram_3_serverAdapterA_outDataCore_D_IN,
		metaBram_3_serverAdapterA_outDataCore_D_OUT;
  wire metaBram_3_serverAdapterA_outDataCore_CLR,
       metaBram_3_serverAdapterA_outDataCore_DEQ,
       metaBram_3_serverAdapterA_outDataCore_EMPTY_N,
       metaBram_3_serverAdapterA_outDataCore_ENQ,
       metaBram_3_serverAdapterA_outDataCore_FULL_N;
  // ports of submodule metaBram_3_serverAdapterB_outDataCore
  wire [31 : 0] metaBram_3_serverAdapterB_outDataCore_D_IN,
		metaBram_3_serverAdapterB_outDataCore_D_OUT;
  wire metaBram_3_serverAdapterB_outDataCore_CLR,
       metaBram_3_serverAdapterB_outDataCore_DEQ,
       metaBram_3_serverAdapterB_outDataCore_EMPTY_N,
       metaBram_3_serverAdapterB_outDataCore_ENQ,
       metaBram_3_serverAdapterB_outDataCore_FULL_N;
  // ports of submodule splaF
  wire [2 : 0] splaF_D_IN, splaF_D_OUT;
  wire splaF_CLR, splaF_DEQ, splaF_EMPTY_N, splaF_ENQ, splaF_FULL_N;
  // ports of submodule wci_wslv_reqF
  wire [71 : 0] wci_wslv_reqF_D_IN, wci_wslv_reqF_D_OUT;
  wire wci_wslv_reqF_CLR,
       wci_wslv_reqF_DEQ,
       wci_wslv_reqF_EMPTY_N,
       wci_wslv_reqF_ENQ;
  // ports of submodule wsiS_reqFifo
  wire [60 : 0] wsiS_reqFifo_D_IN, wsiS_reqFifo_D_OUT;
  wire wsiS_reqFifo_CLR,
       wsiS_reqFifo_DEQ,
       wsiS_reqFifo_EMPTY_N,
       wsiS_reqFifo_ENQ,
       wsiS_reqFifo_FULL_N;
  // rule scheduling signals
  wire CAN_FIRE_RL_advance_split_response,
       CAN_FIRE_RL_wci_cfrd,
       WILL_FIRE_RL_dataBram_0_serverAdapterB_outData_enqAndDeq,
       WILL_FIRE_RL_dataBram_0_serverAdapterB_stageReadResponseAlways,
       WILL_FIRE_RL_metaBram_0_serverAdapterB_outData_enqAndDeq,
       WILL_FIRE_RL_metaBram_0_serverAdapterB_stageReadResponseAlways,
       WILL_FIRE_RL_metaBram_1_serverAdapterB_outData_enqAndDeq,
       WILL_FIRE_RL_metaBram_1_serverAdapterB_stageReadResponseAlways,
       WILL_FIRE_RL_metaBram_2_serverAdapterB_outData_enqAndDeq,
       WILL_FIRE_RL_metaBram_2_serverAdapterB_stageReadResponseAlways,
       WILL_FIRE_RL_metaBram_3_serverAdapterB_outData_enqAndDeq,
       WILL_FIRE_RL_metaBram_3_serverAdapterB_stageReadResponseAlways,
       WILL_FIRE_RL_wci_cfrd,
       WILL_FIRE_RL_wci_cfwr,
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
  reg [33 : 0] MUX_wci_wslv_respF_q_0_write_1__VAL_2;
  wire [33 : 0] MUX_wci_wslv_respF_q_0_write_1__VAL_1,
		MUX_wci_wslv_respF_q_1_write_1__VAL_1,
		MUX_wci_wslv_respF_x_wire_wset_1__VAL_1,
		MUX_wci_wslv_respF_x_wire_wset_1__VAL_2,
		MUX_wci_wslv_respF_x_wire_wset_1__VAL_3;
  wire [31 : 0] MUX_dataCount_write_1__VAL_2, MUX_metaCount_write_1__VAL_2;
  wire [1 : 0] MUX_wci_wslv_respF_cntr_r_write_1__VAL_2;
  wire MUX_controlReg_write_1__SEL_1,
       MUX_controlReg_write_1__SEL_2,
       MUX_dataCount_write_1__SEL_1,
       MUX_dataCount_write_1__SEL_2,
       MUX_metaCount_write_1__SEL_1,
       MUX_metaCount_write_1__SEL_2,
       MUX_splitReadInFlight_write_1__SEL_1,
       MUX_wci_wslv_illegalEdge_write_1__SEL_1,
       MUX_wci_wslv_illegalEdge_write_1__VAL_1,
       MUX_wci_wslv_respF_q_0_write_1__SEL_1,
       MUX_wci_wslv_respF_q_0_write_1__SEL_2,
       MUX_wci_wslv_respF_q_1_write_1__SEL_1,
       MUX_wci_wslv_respF_q_1_write_1__SEL_2,
       MUX_wci_wslv_respF_x_wire_wset_1__SEL_1,
       MUX_wci_wslv_respF_x_wire_wset_1__SEL_3,
       MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3;
  // remaining internal signals
  reg [63 : 0] v__h25329,
	       v__h26261,
	       v__h26550,
	       v__h26755,
	       v__h3586,
	       v__h3761,
	       v__h3905;
  reg [31 : 0] SEL_ARR_metaBram_0_serverAdapterB_outData_outD_ETC___d940,
	       v__h26736;
  reg CASE_splaF_first__95_BITS_1_TO_0_97_0_metaBram_ETC___d909,
      CASE_splaF_first__95_BITS_1_TO_0_97_0_metaBram_ETC___d914,
      CASE_wci_wslv_reqF_first__3_BITS_35_TO_34_70_0_ETC___d975,
      IF_wci_wslv_reqF_first__3_BITS_63_TO_52_54_EQ__ETC___d979;
  wire [31 : 0] g_data__h27820,
		rdat___1__h26833,
		rdat___1__h26917,
		rdat___1__h26972,
		rdat___1__h26986,
		rdat___1__h26994,
		v__h25458,
		y_avValue__h25982,
		y_avValue__h26025,
		y_avValue__h26065,
		y_avValue__h26105,
		y_avValue__h26145;
  wire [13 : 0] mlB__h23202, mlInc__h23201;
  wire [2 : 0] dataBram_0_serverAdapterB_cnt_19_PLUS_IF_dataB_ETC___d325,
	       metaBram_0_serverAdapterB_cnt_37_PLUS_IF_metaB_ETC___d443,
	       metaBram_1_serverAdapterB_cnt_55_PLUS_IF_metaB_ETC___d561,
	       metaBram_2_serverAdapterB_cnt_73_PLUS_IF_metaB_ETC___d679,
	       metaBram_3_serverAdapterB_cnt_91_PLUS_IF_metaB_ETC___d797,
	       x__h23250,
	       x__h23262,
	       x__h23274,
	       y__h23251,
	       y__h23263,
	       y__h23275;
  wire [1 : 0] wci_wslv_respF_cntr_r_8_MINUS_1___d27;
  wire IF_splaF_first__95_BIT_2_96_THEN_NOT_splaF_fir_ETC___d916,
       NOT_controlReg_28_BIT_0_29_30_OR_controlReg_28_ETC___d854,
       _dfoo1,
       _dfoo3,
       controlReg_28_BIT_0_29_AND_NOT_controlReg_28_B_ETC___d876,
       dataCount_35_ULT_1024___d836,
       metaCount_32_ULT_1024___d833;
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
  // value method wtiS0_sThreadBusy
  assign wtiS0_SThreadBusy = wtiS_isReset_isInReset ;
  // value method wtiS0_sReset_n
  assign wtiS0_SReset_n = !wtiS_isReset_isInReset && wtiS_operateD ;
  // submodule dataBram_0_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd10),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(11'd1024)) dataBram_0_memory(.CLKA(wciS0_Clk),
						.CLKB(wciS0_Clk),
						.ADDRA(dataBram_0_memory_ADDRA),
						.ADDRB(dataBram_0_memory_ADDRB),
						.DIA(dataBram_0_memory_DIA),
						.DIB(dataBram_0_memory_DIB),
						.WEA(dataBram_0_memory_WEA),
						.WEB(dataBram_0_memory_WEB),
						.ENA(dataBram_0_memory_ENA),
						.ENB(dataBram_0_memory_ENB),
						.DOA(dataBram_0_memory_DOA),
						.DOB(dataBram_0_memory_DOB));
  // submodule dataBram_0_serverAdapterA_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) dataBram_0_serverAdapterA_outDataCore(.RST(wciS0_MReset_n),
								     .CLK(wciS0_Clk),
								     .D_IN(dataBram_0_serverAdapterA_outDataCore_D_IN),
								     .ENQ(dataBram_0_serverAdapterA_outDataCore_ENQ),
								     .DEQ(dataBram_0_serverAdapterA_outDataCore_DEQ),
								     .CLR(dataBram_0_serverAdapterA_outDataCore_CLR),
								     .D_OUT(dataBram_0_serverAdapterA_outDataCore_D_OUT),
								     .FULL_N(dataBram_0_serverAdapterA_outDataCore_FULL_N),
								     .EMPTY_N(dataBram_0_serverAdapterA_outDataCore_EMPTY_N));
  // submodule dataBram_0_serverAdapterB_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) dataBram_0_serverAdapterB_outDataCore(.RST(wciS0_MReset_n),
								     .CLK(wciS0_Clk),
								     .D_IN(dataBram_0_serverAdapterB_outDataCore_D_IN),
								     .ENQ(dataBram_0_serverAdapterB_outDataCore_ENQ),
								     .DEQ(dataBram_0_serverAdapterB_outDataCore_DEQ),
								     .CLR(dataBram_0_serverAdapterB_outDataCore_CLR),
								     .D_OUT(dataBram_0_serverAdapterB_outDataCore_D_OUT),
								     .FULL_N(dataBram_0_serverAdapterB_outDataCore_FULL_N),
								     .EMPTY_N(dataBram_0_serverAdapterB_outDataCore_EMPTY_N));
  // submodule metaBram_0_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd10),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(11'd1024)) metaBram_0_memory(.CLKA(wciS0_Clk),
						.CLKB(wciS0_Clk),
						.ADDRA(metaBram_0_memory_ADDRA),
						.ADDRB(metaBram_0_memory_ADDRB),
						.DIA(metaBram_0_memory_DIA),
						.DIB(metaBram_0_memory_DIB),
						.WEA(metaBram_0_memory_WEA),
						.WEB(metaBram_0_memory_WEB),
						.ENA(metaBram_0_memory_ENA),
						.ENB(metaBram_0_memory_ENB),
						.DOA(metaBram_0_memory_DOA),
						.DOB(metaBram_0_memory_DOB));
  // submodule metaBram_0_serverAdapterA_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) metaBram_0_serverAdapterA_outDataCore(.RST(wciS0_MReset_n),
								     .CLK(wciS0_Clk),
								     .D_IN(metaBram_0_serverAdapterA_outDataCore_D_IN),
								     .ENQ(metaBram_0_serverAdapterA_outDataCore_ENQ),
								     .DEQ(metaBram_0_serverAdapterA_outDataCore_DEQ),
								     .CLR(metaBram_0_serverAdapterA_outDataCore_CLR),
								     .D_OUT(metaBram_0_serverAdapterA_outDataCore_D_OUT),
								     .FULL_N(metaBram_0_serverAdapterA_outDataCore_FULL_N),
								     .EMPTY_N(metaBram_0_serverAdapterA_outDataCore_EMPTY_N));
  // submodule metaBram_0_serverAdapterB_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) metaBram_0_serverAdapterB_outDataCore(.RST(wciS0_MReset_n),
								     .CLK(wciS0_Clk),
								     .D_IN(metaBram_0_serverAdapterB_outDataCore_D_IN),
								     .ENQ(metaBram_0_serverAdapterB_outDataCore_ENQ),
								     .DEQ(metaBram_0_serverAdapterB_outDataCore_DEQ),
								     .CLR(metaBram_0_serverAdapterB_outDataCore_CLR),
								     .D_OUT(metaBram_0_serverAdapterB_outDataCore_D_OUT),
								     .FULL_N(metaBram_0_serverAdapterB_outDataCore_FULL_N),
								     .EMPTY_N(metaBram_0_serverAdapterB_outDataCore_EMPTY_N));
  // submodule metaBram_1_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd10),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(11'd1024)) metaBram_1_memory(.CLKA(wciS0_Clk),
						.CLKB(wciS0_Clk),
						.ADDRA(metaBram_1_memory_ADDRA),
						.ADDRB(metaBram_1_memory_ADDRB),
						.DIA(metaBram_1_memory_DIA),
						.DIB(metaBram_1_memory_DIB),
						.WEA(metaBram_1_memory_WEA),
						.WEB(metaBram_1_memory_WEB),
						.ENA(metaBram_1_memory_ENA),
						.ENB(metaBram_1_memory_ENB),
						.DOA(metaBram_1_memory_DOA),
						.DOB(metaBram_1_memory_DOB));
  // submodule metaBram_1_serverAdapterA_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) metaBram_1_serverAdapterA_outDataCore(.RST(wciS0_MReset_n),
								     .CLK(wciS0_Clk),
								     .D_IN(metaBram_1_serverAdapterA_outDataCore_D_IN),
								     .ENQ(metaBram_1_serverAdapterA_outDataCore_ENQ),
								     .DEQ(metaBram_1_serverAdapterA_outDataCore_DEQ),
								     .CLR(metaBram_1_serverAdapterA_outDataCore_CLR),
								     .D_OUT(metaBram_1_serverAdapterA_outDataCore_D_OUT),
								     .FULL_N(metaBram_1_serverAdapterA_outDataCore_FULL_N),
								     .EMPTY_N(metaBram_1_serverAdapterA_outDataCore_EMPTY_N));
  // submodule metaBram_1_serverAdapterB_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) metaBram_1_serverAdapterB_outDataCore(.RST(wciS0_MReset_n),
								     .CLK(wciS0_Clk),
								     .D_IN(metaBram_1_serverAdapterB_outDataCore_D_IN),
								     .ENQ(metaBram_1_serverAdapterB_outDataCore_ENQ),
								     .DEQ(metaBram_1_serverAdapterB_outDataCore_DEQ),
								     .CLR(metaBram_1_serverAdapterB_outDataCore_CLR),
								     .D_OUT(metaBram_1_serverAdapterB_outDataCore_D_OUT),
								     .FULL_N(metaBram_1_serverAdapterB_outDataCore_FULL_N),
								     .EMPTY_N(metaBram_1_serverAdapterB_outDataCore_EMPTY_N));
  // submodule metaBram_2_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd10),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(11'd1024)) metaBram_2_memory(.CLKA(wciS0_Clk),
						.CLKB(wciS0_Clk),
						.ADDRA(metaBram_2_memory_ADDRA),
						.ADDRB(metaBram_2_memory_ADDRB),
						.DIA(metaBram_2_memory_DIA),
						.DIB(metaBram_2_memory_DIB),
						.WEA(metaBram_2_memory_WEA),
						.WEB(metaBram_2_memory_WEB),
						.ENA(metaBram_2_memory_ENA),
						.ENB(metaBram_2_memory_ENB),
						.DOA(metaBram_2_memory_DOA),
						.DOB(metaBram_2_memory_DOB));
  // submodule metaBram_2_serverAdapterA_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) metaBram_2_serverAdapterA_outDataCore(.RST(wciS0_MReset_n),
								     .CLK(wciS0_Clk),
								     .D_IN(metaBram_2_serverAdapterA_outDataCore_D_IN),
								     .ENQ(metaBram_2_serverAdapterA_outDataCore_ENQ),
								     .DEQ(metaBram_2_serverAdapterA_outDataCore_DEQ),
								     .CLR(metaBram_2_serverAdapterA_outDataCore_CLR),
								     .D_OUT(metaBram_2_serverAdapterA_outDataCore_D_OUT),
								     .FULL_N(metaBram_2_serverAdapterA_outDataCore_FULL_N),
								     .EMPTY_N(metaBram_2_serverAdapterA_outDataCore_EMPTY_N));
  // submodule metaBram_2_serverAdapterB_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) metaBram_2_serverAdapterB_outDataCore(.RST(wciS0_MReset_n),
								     .CLK(wciS0_Clk),
								     .D_IN(metaBram_2_serverAdapterB_outDataCore_D_IN),
								     .ENQ(metaBram_2_serverAdapterB_outDataCore_ENQ),
								     .DEQ(metaBram_2_serverAdapterB_outDataCore_DEQ),
								     .CLR(metaBram_2_serverAdapterB_outDataCore_CLR),
								     .D_OUT(metaBram_2_serverAdapterB_outDataCore_D_OUT),
								     .FULL_N(metaBram_2_serverAdapterB_outDataCore_FULL_N),
								     .EMPTY_N(metaBram_2_serverAdapterB_outDataCore_EMPTY_N));
  // submodule metaBram_3_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd10),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(11'd1024)) metaBram_3_memory(.CLKA(wciS0_Clk),
						.CLKB(wciS0_Clk),
						.ADDRA(metaBram_3_memory_ADDRA),
						.ADDRB(metaBram_3_memory_ADDRB),
						.DIA(metaBram_3_memory_DIA),
						.DIB(metaBram_3_memory_DIB),
						.WEA(metaBram_3_memory_WEA),
						.WEB(metaBram_3_memory_WEB),
						.ENA(metaBram_3_memory_ENA),
						.ENB(metaBram_3_memory_ENB),
						.DOA(metaBram_3_memory_DOA),
						.DOB(metaBram_3_memory_DOB));
  // submodule metaBram_3_serverAdapterA_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) metaBram_3_serverAdapterA_outDataCore(.RST(wciS0_MReset_n),
								     .CLK(wciS0_Clk),
								     .D_IN(metaBram_3_serverAdapterA_outDataCore_D_IN),
								     .ENQ(metaBram_3_serverAdapterA_outDataCore_ENQ),
								     .DEQ(metaBram_3_serverAdapterA_outDataCore_DEQ),
								     .CLR(metaBram_3_serverAdapterA_outDataCore_CLR),
								     .D_OUT(metaBram_3_serverAdapterA_outDataCore_D_OUT),
								     .FULL_N(metaBram_3_serverAdapterA_outDataCore_FULL_N),
								     .EMPTY_N(metaBram_3_serverAdapterA_outDataCore_EMPTY_N));
  // submodule metaBram_3_serverAdapterB_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) metaBram_3_serverAdapterB_outDataCore(.RST(wciS0_MReset_n),
								     .CLK(wciS0_Clk),
								     .D_IN(metaBram_3_serverAdapterB_outDataCore_D_IN),
								     .ENQ(metaBram_3_serverAdapterB_outDataCore_ENQ),
								     .DEQ(metaBram_3_serverAdapterB_outDataCore_DEQ),
								     .CLR(metaBram_3_serverAdapterB_outDataCore_CLR),
								     .D_OUT(metaBram_3_serverAdapterB_outDataCore_D_OUT),
								     .FULL_N(metaBram_3_serverAdapterB_outDataCore_FULL_N),
								     .EMPTY_N(metaBram_3_serverAdapterB_outDataCore_EMPTY_N));
  // submodule splaF
  FIFO2 #(.width(32'd3), .guarded(32'd1)) splaF(.RST(wciS0_MReset_n),
						.CLK(wciS0_Clk),
						.D_IN(splaF_D_IN),
						.ENQ(splaF_ENQ),
						.DEQ(splaF_DEQ),
						.CLR(splaF_CLR),
						.D_OUT(splaF_D_OUT),
						.FULL_N(splaF_FULL_N),
						.EMPTY_N(splaF_EMPTY_N));
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
  SizedFIFO #(.p1width(32'd61),
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
  // rule RL_wci_cfrd
  assign CAN_FIRE_RL_wci_cfrd =
	     wci_wslv_reqF_EMPTY_N &&
	     IF_wci_wslv_reqF_first__3_BITS_63_TO_52_54_EQ__ETC___d979 &&
	     (wci_wslv_reqF_D_OUT[63:52] == 12'h800 ||
	      wci_wslv_reqF_D_OUT[63:52] == 12'h400 ||
	      wci_wslv_respF_cntr_r != 2'd2) &&
	     wci_wslv_wci_cfrd_pw_whas ;
  assign WILL_FIRE_RL_wci_cfrd =
	     CAN_FIRE_RL_wci_cfrd && !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
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
  // rule RL_dataBram_0_serverAdapterB_stageReadResponseAlways
  assign WILL_FIRE_RL_dataBram_0_serverAdapterB_stageReadResponseAlways =
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[63:52] == 12'h800 ;
  // rule RL_metaBram_0_serverAdapterB_stageReadResponseAlways
  assign WILL_FIRE_RL_metaBram_0_serverAdapterB_stageReadResponseAlways =
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[35:34] == 2'd0 &&
	     wci_wslv_reqF_D_OUT[63:52] == 12'h400 ;
  // rule RL_metaBram_1_serverAdapterB_stageReadResponseAlways
  assign WILL_FIRE_RL_metaBram_1_serverAdapterB_stageReadResponseAlways =
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[35:34] == 2'd1 &&
	     wci_wslv_reqF_D_OUT[63:52] == 12'h400 ;
  // rule RL_metaBram_2_serverAdapterB_stageReadResponseAlways
  assign WILL_FIRE_RL_metaBram_2_serverAdapterB_stageReadResponseAlways =
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[35:34] == 2'd2 &&
	     wci_wslv_reqF_D_OUT[63:52] == 12'h400 ;
  // rule RL_metaBram_3_serverAdapterB_stageReadResponseAlways
  assign WILL_FIRE_RL_metaBram_3_serverAdapterB_stageReadResponseAlways =
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[35:34] == 2'd3 &&
	     wci_wslv_reqF_D_OUT[63:52] == 12'h400 ;
  // rule RL_advance_split_response
  assign CAN_FIRE_RL_advance_split_response =
	     wci_wslv_respF_cntr_r != 2'd2 && splaF_EMPTY_N &&
	     IF_splaF_first__95_BIT_2_96_THEN_NOT_splaF_fir_ETC___d916 &&
	     !wci_wslv_wci_cfwr_pw_whas &&
	     splitReadInFlight ;
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
  // rule RL_dataBram_0_serverAdapterB_outData_enqAndDeq
  assign WILL_FIRE_RL_dataBram_0_serverAdapterB_outData_enqAndDeq =
	     dataBram_0_serverAdapterB_outDataCore_EMPTY_N &&
	     dataBram_0_serverAdapterB_outDataCore_FULL_N &&
	     dataBram_0_serverAdapterB_outData_deqCalled_whas &&
	     dataBram_0_serverAdapterB_outData_enqData_whas ;
  // rule RL_metaBram_0_serverAdapterB_outData_enqAndDeq
  assign WILL_FIRE_RL_metaBram_0_serverAdapterB_outData_enqAndDeq =
	     metaBram_0_serverAdapterB_outDataCore_EMPTY_N &&
	     metaBram_0_serverAdapterB_outDataCore_FULL_N &&
	     metaBram_0_serverAdapterB_outData_deqCalled_whas &&
	     metaBram_0_serverAdapterB_outData_enqData_whas ;
  // rule RL_metaBram_1_serverAdapterB_outData_enqAndDeq
  assign WILL_FIRE_RL_metaBram_1_serverAdapterB_outData_enqAndDeq =
	     metaBram_1_serverAdapterB_outDataCore_EMPTY_N &&
	     metaBram_1_serverAdapterB_outDataCore_FULL_N &&
	     metaBram_1_serverAdapterB_outData_deqCalled_whas &&
	     metaBram_1_serverAdapterB_outData_enqData_whas ;
  // rule RL_metaBram_2_serverAdapterB_outData_enqAndDeq
  assign WILL_FIRE_RL_metaBram_2_serverAdapterB_outData_enqAndDeq =
	     metaBram_2_serverAdapterB_outDataCore_EMPTY_N &&
	     metaBram_2_serverAdapterB_outDataCore_FULL_N &&
	     metaBram_2_serverAdapterB_outData_deqCalled_whas &&
	     metaBram_2_serverAdapterB_outData_enqData_whas ;
  // rule RL_metaBram_3_serverAdapterB_outData_enqAndDeq
  assign WILL_FIRE_RL_metaBram_3_serverAdapterB_outData_enqAndDeq =
	     metaBram_3_serverAdapterB_outDataCore_EMPTY_N &&
	     metaBram_3_serverAdapterB_outDataCore_FULL_N &&
	     metaBram_3_serverAdapterB_outData_deqCalled_whas &&
	     metaBram_3_serverAdapterB_outData_enqData_whas ;
  // rule RL_wsiS_reqFifo_enq
  assign WILL_FIRE_RL_wsiS_reqFifo_enq =
	     wsiS_reqFifo_FULL_N && wsiS_operateD && wsiS_peerIsReady &&
	     wsiS_wsiReq_wget[60:58] == 3'd1 ;
  // rule RL_wsiS_reqFifo_reset
  assign WILL_FIRE_RL_wsiS_reqFifo_reset =
	     WILL_FIRE_RL_wsiS_reqFifo_enq ||
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  // inputs to muxes for submodule ports
  assign MUX_controlReg_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF_D_OUT[39:32] == 8'h0 ;
  assign MUX_controlReg_write_1__SEL_2 =
	     wci_wslv_wci_ctrl_pw_whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd0 &&
	     wci_wslv_reqF_D_OUT[36:34] == 3'd0 ;
  assign MUX_dataCount_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF_D_OUT[39:32] == 8'h08 ;
  assign MUX_dataCount_write_1__SEL_2 =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     controlReg_28_BIT_0_29_AND_NOT_controlReg_28_B_ETC___d876 ;
  assign MUX_metaCount_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF_D_OUT[39:32] == 8'h04 ;
  assign MUX_metaCount_write_1__SEL_2 =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     controlReg_28_BIT_0_29_AND_NOT_controlReg_28_B_ETC___d876 &&
	     wsiS_reqFifo_D_OUT[57] ;
  assign MUX_splitReadInFlight_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfrd &&
	     (wci_wslv_reqF_D_OUT[63:52] == 12'h800 ||
	      wci_wslv_reqF_D_OUT[63:52] == 12'h400) ;
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
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[63:52] != 12'h800 &&
	     wci_wslv_reqF_D_OUT[63:52] != 12'h400 ;
  assign MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 =
	     CAN_FIRE_RL_advance_split_response &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  assign MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 =
	     wsiS_reqFifo_EMPTY_N &&
	     NOT_controlReg_28_BIT_0_29_30_OR_controlReg_28_ETC___d854 &&
	     wci_wslv_cState == 3'd2 ;
  assign MUX_dataCount_write_1__VAL_2 = dataCount + 32'd1 ;
  assign MUX_metaCount_write_1__VAL_2 = metaCount + 32'd1 ;
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
	  MUX_wci_wslv_respF_x_wire_wset_1__VAL_3 or WILL_FIRE_RL_wci_cfwr)
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
  assign MUX_wci_wslv_respF_x_wire_wset_1__VAL_1 = { 2'd1, g_data__h27820 } ;
  assign MUX_wci_wslv_respF_x_wire_wset_1__VAL_2 =
	     wci_wslv_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wci_wslv_respF_x_wire_wset_1__VAL_3 = { 2'd1, v__h25458 } ;
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
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[63:52] != 12'h800 &&
	     wci_wslv_reqF_D_OUT[63:52] != 12'h400 ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete ||
	     MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 ||
	     WILL_FIRE_RL_wci_cfwr ;
  assign wci_wslv_wEdge_wget = wci_wslv_reqF_D_OUT[36:34] ;
  assign wci_wslv_wEdge_whas = WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_sFlagReg_1_wget = 1'b0 ;
  assign wci_wslv_sFlagReg_1_whas = 1'b0 ;
  assign wci_wslv_ctlAckReg_1_wget = 1'd1 ;
  assign wci_wslv_ctlAckReg_1_whas =
	     WILL_FIRE_RL_wci_ctrl_OrE || WILL_FIRE_RL_wci_ctrl_IsO ||
	     MUX_controlReg_write_1__SEL_2 ;
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
  assign wtiS_wtiReq_wget = 67'h0 ;
  assign wtiS_wtiReq_whas = 1'b0 ;
  assign wtiS_operateD_1_wget = 1'b0 ;
  assign wtiS_operateD_1_whas = 1'b0 ;
  assign nowW_wget = wtiS_nowReq[63:0] ;
  assign nowW_whas = 1'd1 ;
  assign statusReg_w_wget = rdat___1__h26833 ;
  assign statusReg_w_whas = 1'd1 ;
  assign dataBram_0_serverAdapterA_outData_enqData_wget =
	     dataBram_0_memory_DOA ;
  assign dataBram_0_serverAdapterA_outData_enqData_whas =
	     (!dataBram_0_serverAdapterA_s1[0] ||
	      dataBram_0_serverAdapterA_outDataCore_FULL_N) &&
	     dataBram_0_serverAdapterA_s1[1] &&
	     dataBram_0_serverAdapterA_s1[0] ;
  assign dataBram_0_serverAdapterA_outData_outData_wget =
	     dataBram_0_serverAdapterA_outDataCore_EMPTY_N ?
	       dataBram_0_serverAdapterA_outDataCore_D_OUT :
	       dataBram_0_memory_DOA ;
  assign dataBram_0_serverAdapterA_outData_outData_whas =
	     dataBram_0_serverAdapterA_outDataCore_EMPTY_N ||
	     !dataBram_0_serverAdapterA_outDataCore_EMPTY_N &&
	     dataBram_0_serverAdapterA_outData_enqData_whas ;
  assign dataBram_0_serverAdapterA_cnt_1_wget = 3'd1 ;
  assign dataBram_0_serverAdapterA_cnt_1_whas = 1'b0 ;
  assign dataBram_0_serverAdapterA_cnt_2_wget = 3'h0 ;
  assign dataBram_0_serverAdapterA_cnt_2_whas = 1'b0 ;
  assign dataBram_0_serverAdapterA_cnt_3_wget = 3'h0 ;
  assign dataBram_0_serverAdapterA_cnt_3_whas = 1'b0 ;
  assign dataBram_0_serverAdapterA_writeWithResp_wget = 2'd2 ;
  assign dataBram_0_serverAdapterA_writeWithResp_whas =
	     MUX_dataCount_write_1__SEL_2 ;
  assign dataBram_0_serverAdapterA_s1_1_wget = 2'd2 ;
  assign dataBram_0_serverAdapterA_s1_1_whas = MUX_dataCount_write_1__SEL_2 ;
  assign dataBram_0_serverAdapterB_outData_enqData_wget =
	     dataBram_0_memory_DOB ;
  assign dataBram_0_serverAdapterB_outData_enqData_whas =
	     (!dataBram_0_serverAdapterB_s1[0] ||
	      dataBram_0_serverAdapterB_outDataCore_FULL_N) &&
	     dataBram_0_serverAdapterB_s1[1] &&
	     dataBram_0_serverAdapterB_s1[0] ;
  assign dataBram_0_serverAdapterB_outData_outData_wget = y_avValue__h25982 ;
  assign dataBram_0_serverAdapterB_outData_outData_whas =
	     dataBram_0_serverAdapterB_outDataCore_EMPTY_N ||
	     !dataBram_0_serverAdapterB_outDataCore_EMPTY_N &&
	     dataBram_0_serverAdapterB_outData_enqData_whas ;
  assign dataBram_0_serverAdapterB_cnt_1_wget = 3'd1 ;
  assign dataBram_0_serverAdapterB_cnt_1_whas =
	     WILL_FIRE_RL_dataBram_0_serverAdapterB_stageReadResponseAlways ;
  assign dataBram_0_serverAdapterB_cnt_2_wget = 3'd7 ;
  assign dataBram_0_serverAdapterB_cnt_2_whas =
	     dataBram_0_serverAdapterB_outData_deqCalled_whas ;
  assign dataBram_0_serverAdapterB_cnt_3_wget = 3'h0 ;
  assign dataBram_0_serverAdapterB_cnt_3_whas = 1'b0 ;
  assign dataBram_0_serverAdapterB_writeWithResp_wget = 2'd0 ;
  assign dataBram_0_serverAdapterB_writeWithResp_whas =
	     WILL_FIRE_RL_dataBram_0_serverAdapterB_stageReadResponseAlways ;
  assign dataBram_0_serverAdapterB_s1_1_wget = 2'd3 ;
  assign dataBram_0_serverAdapterB_s1_1_whas =
	     WILL_FIRE_RL_dataBram_0_serverAdapterB_stageReadResponseAlways ;
  assign metaBram_0_serverAdapterA_outData_enqData_wget =
	     metaBram_0_memory_DOA ;
  assign metaBram_0_serverAdapterA_outData_enqData_whas =
	     (!metaBram_0_serverAdapterA_s1[0] ||
	      metaBram_0_serverAdapterA_outDataCore_FULL_N) &&
	     metaBram_0_serverAdapterA_s1[1] &&
	     metaBram_0_serverAdapterA_s1[0] ;
  assign metaBram_0_serverAdapterA_outData_outData_wget =
	     metaBram_0_serverAdapterA_outDataCore_EMPTY_N ?
	       metaBram_0_serverAdapterA_outDataCore_D_OUT :
	       metaBram_0_memory_DOA ;
  assign metaBram_0_serverAdapterA_outData_outData_whas =
	     metaBram_0_serverAdapterA_outDataCore_EMPTY_N ||
	     !metaBram_0_serverAdapterA_outDataCore_EMPTY_N &&
	     metaBram_0_serverAdapterA_outData_enqData_whas ;
  assign metaBram_0_serverAdapterA_cnt_1_wget = 3'd1 ;
  assign metaBram_0_serverAdapterA_cnt_1_whas = 1'b0 ;
  assign metaBram_0_serverAdapterA_cnt_2_wget = 3'h0 ;
  assign metaBram_0_serverAdapterA_cnt_2_whas = 1'b0 ;
  assign metaBram_0_serverAdapterA_cnt_3_wget = 3'h0 ;
  assign metaBram_0_serverAdapterA_cnt_3_whas = 1'b0 ;
  assign metaBram_0_serverAdapterA_writeWithResp_wget = 2'd2 ;
  assign metaBram_0_serverAdapterA_writeWithResp_whas =
	     MUX_metaCount_write_1__SEL_2 ;
  assign metaBram_0_serverAdapterA_s1_1_wget = 2'd2 ;
  assign metaBram_0_serverAdapterA_s1_1_whas = MUX_metaCount_write_1__SEL_2 ;
  assign metaBram_0_serverAdapterB_outData_enqData_wget =
	     metaBram_0_memory_DOB ;
  assign metaBram_0_serverAdapterB_outData_enqData_whas =
	     (!metaBram_0_serverAdapterB_s1[0] ||
	      metaBram_0_serverAdapterB_outDataCore_FULL_N) &&
	     metaBram_0_serverAdapterB_s1[1] &&
	     metaBram_0_serverAdapterB_s1[0] ;
  assign metaBram_0_serverAdapterB_outData_outData_wget = y_avValue__h26025 ;
  assign metaBram_0_serverAdapterB_outData_outData_whas =
	     metaBram_0_serverAdapterB_outDataCore_EMPTY_N ||
	     !metaBram_0_serverAdapterB_outDataCore_EMPTY_N &&
	     metaBram_0_serverAdapterB_outData_enqData_whas ;
  assign metaBram_0_serverAdapterB_cnt_1_wget = 3'd1 ;
  assign metaBram_0_serverAdapterB_cnt_1_whas =
	     WILL_FIRE_RL_metaBram_0_serverAdapterB_stageReadResponseAlways ;
  assign metaBram_0_serverAdapterB_cnt_2_wget = 3'd7 ;
  assign metaBram_0_serverAdapterB_cnt_2_whas =
	     metaBram_0_serverAdapterB_outData_deqCalled_whas ;
  assign metaBram_0_serverAdapterB_cnt_3_wget = 3'h0 ;
  assign metaBram_0_serverAdapterB_cnt_3_whas = 1'b0 ;
  assign metaBram_0_serverAdapterB_writeWithResp_wget = 2'd0 ;
  assign metaBram_0_serverAdapterB_writeWithResp_whas =
	     WILL_FIRE_RL_metaBram_0_serverAdapterB_stageReadResponseAlways ;
  assign metaBram_0_serverAdapterB_s1_1_wget = 2'd3 ;
  assign metaBram_0_serverAdapterB_s1_1_whas =
	     WILL_FIRE_RL_metaBram_0_serverAdapterB_stageReadResponseAlways ;
  assign metaBram_1_serverAdapterA_outData_enqData_wget =
	     metaBram_1_memory_DOA ;
  assign metaBram_1_serverAdapterA_outData_enqData_whas =
	     (!metaBram_1_serverAdapterA_s1[0] ||
	      metaBram_1_serverAdapterA_outDataCore_FULL_N) &&
	     metaBram_1_serverAdapterA_s1[1] &&
	     metaBram_1_serverAdapterA_s1[0] ;
  assign metaBram_1_serverAdapterA_outData_outData_wget =
	     metaBram_1_serverAdapterA_outDataCore_EMPTY_N ?
	       metaBram_1_serverAdapterA_outDataCore_D_OUT :
	       metaBram_1_memory_DOA ;
  assign metaBram_1_serverAdapterA_outData_outData_whas =
	     metaBram_1_serverAdapterA_outDataCore_EMPTY_N ||
	     !metaBram_1_serverAdapterA_outDataCore_EMPTY_N &&
	     metaBram_1_serverAdapterA_outData_enqData_whas ;
  assign metaBram_1_serverAdapterA_cnt_1_wget = 3'd1 ;
  assign metaBram_1_serverAdapterA_cnt_1_whas = 1'b0 ;
  assign metaBram_1_serverAdapterA_cnt_2_wget = 3'h0 ;
  assign metaBram_1_serverAdapterA_cnt_2_whas = 1'b0 ;
  assign metaBram_1_serverAdapterA_cnt_3_wget = 3'h0 ;
  assign metaBram_1_serverAdapterA_cnt_3_whas = 1'b0 ;
  assign metaBram_1_serverAdapterA_writeWithResp_wget = 2'd2 ;
  assign metaBram_1_serverAdapterA_writeWithResp_whas =
	     MUX_metaCount_write_1__SEL_2 ;
  assign metaBram_1_serverAdapterA_s1_1_wget = 2'd2 ;
  assign metaBram_1_serverAdapterA_s1_1_whas = MUX_metaCount_write_1__SEL_2 ;
  assign metaBram_1_serverAdapterB_outData_enqData_wget =
	     metaBram_1_memory_DOB ;
  assign metaBram_1_serverAdapterB_outData_enqData_whas =
	     (!metaBram_1_serverAdapterB_s1[0] ||
	      metaBram_1_serverAdapterB_outDataCore_FULL_N) &&
	     metaBram_1_serverAdapterB_s1[1] &&
	     metaBram_1_serverAdapterB_s1[0] ;
  assign metaBram_1_serverAdapterB_outData_outData_wget = y_avValue__h26065 ;
  assign metaBram_1_serverAdapterB_outData_outData_whas =
	     metaBram_1_serverAdapterB_outDataCore_EMPTY_N ||
	     !metaBram_1_serverAdapterB_outDataCore_EMPTY_N &&
	     metaBram_1_serverAdapterB_outData_enqData_whas ;
  assign metaBram_1_serverAdapterB_cnt_1_wget = 3'd1 ;
  assign metaBram_1_serverAdapterB_cnt_1_whas =
	     WILL_FIRE_RL_metaBram_1_serverAdapterB_stageReadResponseAlways ;
  assign metaBram_1_serverAdapterB_cnt_2_wget = 3'd7 ;
  assign metaBram_1_serverAdapterB_cnt_2_whas =
	     metaBram_1_serverAdapterB_outData_deqCalled_whas ;
  assign metaBram_1_serverAdapterB_cnt_3_wget = 3'h0 ;
  assign metaBram_1_serverAdapterB_cnt_3_whas = 1'b0 ;
  assign metaBram_1_serverAdapterB_writeWithResp_wget = 2'd0 ;
  assign metaBram_1_serverAdapterB_writeWithResp_whas =
	     WILL_FIRE_RL_metaBram_1_serverAdapterB_stageReadResponseAlways ;
  assign metaBram_1_serverAdapterB_s1_1_wget = 2'd3 ;
  assign metaBram_1_serverAdapterB_s1_1_whas =
	     WILL_FIRE_RL_metaBram_1_serverAdapterB_stageReadResponseAlways ;
  assign metaBram_2_serverAdapterA_outData_enqData_wget =
	     metaBram_2_memory_DOA ;
  assign metaBram_2_serverAdapterA_outData_enqData_whas =
	     (!metaBram_2_serverAdapterA_s1[0] ||
	      metaBram_2_serverAdapterA_outDataCore_FULL_N) &&
	     metaBram_2_serverAdapterA_s1[1] &&
	     metaBram_2_serverAdapterA_s1[0] ;
  assign metaBram_2_serverAdapterA_outData_outData_wget =
	     metaBram_2_serverAdapterA_outDataCore_EMPTY_N ?
	       metaBram_2_serverAdapterA_outDataCore_D_OUT :
	       metaBram_2_memory_DOA ;
  assign metaBram_2_serverAdapterA_outData_outData_whas =
	     metaBram_2_serverAdapterA_outDataCore_EMPTY_N ||
	     !metaBram_2_serverAdapterA_outDataCore_EMPTY_N &&
	     metaBram_2_serverAdapterA_outData_enqData_whas ;
  assign metaBram_2_serverAdapterA_cnt_1_wget = 3'd1 ;
  assign metaBram_2_serverAdapterA_cnt_1_whas = 1'b0 ;
  assign metaBram_2_serverAdapterA_cnt_2_wget = 3'h0 ;
  assign metaBram_2_serverAdapterA_cnt_2_whas = 1'b0 ;
  assign metaBram_2_serverAdapterA_cnt_3_wget = 3'h0 ;
  assign metaBram_2_serverAdapterA_cnt_3_whas = 1'b0 ;
  assign metaBram_2_serverAdapterA_writeWithResp_wget = 2'd2 ;
  assign metaBram_2_serverAdapterA_writeWithResp_whas =
	     MUX_metaCount_write_1__SEL_2 ;
  assign metaBram_2_serverAdapterA_s1_1_wget = 2'd2 ;
  assign metaBram_2_serverAdapterA_s1_1_whas = MUX_metaCount_write_1__SEL_2 ;
  assign metaBram_2_serverAdapterB_outData_enqData_wget =
	     metaBram_2_memory_DOB ;
  assign metaBram_2_serverAdapterB_outData_enqData_whas =
	     (!metaBram_2_serverAdapterB_s1[0] ||
	      metaBram_2_serverAdapterB_outDataCore_FULL_N) &&
	     metaBram_2_serverAdapterB_s1[1] &&
	     metaBram_2_serverAdapterB_s1[0] ;
  assign metaBram_2_serverAdapterB_outData_outData_wget = y_avValue__h26105 ;
  assign metaBram_2_serverAdapterB_outData_outData_whas =
	     metaBram_2_serverAdapterB_outDataCore_EMPTY_N ||
	     !metaBram_2_serverAdapterB_outDataCore_EMPTY_N &&
	     metaBram_2_serverAdapterB_outData_enqData_whas ;
  assign metaBram_2_serverAdapterB_cnt_1_wget = 3'd1 ;
  assign metaBram_2_serverAdapterB_cnt_1_whas =
	     WILL_FIRE_RL_metaBram_2_serverAdapterB_stageReadResponseAlways ;
  assign metaBram_2_serverAdapterB_cnt_2_wget = 3'd7 ;
  assign metaBram_2_serverAdapterB_cnt_2_whas =
	     metaBram_2_serverAdapterB_outData_deqCalled_whas ;
  assign metaBram_2_serverAdapterB_cnt_3_wget = 3'h0 ;
  assign metaBram_2_serverAdapterB_cnt_3_whas = 1'b0 ;
  assign metaBram_2_serverAdapterB_writeWithResp_wget = 2'd0 ;
  assign metaBram_2_serverAdapterB_writeWithResp_whas =
	     WILL_FIRE_RL_metaBram_2_serverAdapterB_stageReadResponseAlways ;
  assign metaBram_2_serverAdapterB_s1_1_wget = 2'd3 ;
  assign metaBram_2_serverAdapterB_s1_1_whas =
	     WILL_FIRE_RL_metaBram_2_serverAdapterB_stageReadResponseAlways ;
  assign metaBram_3_serverAdapterA_outData_enqData_wget =
	     metaBram_3_memory_DOA ;
  assign metaBram_3_serverAdapterA_outData_enqData_whas =
	     (!metaBram_3_serverAdapterA_s1[0] ||
	      metaBram_3_serverAdapterA_outDataCore_FULL_N) &&
	     metaBram_3_serverAdapterA_s1[1] &&
	     metaBram_3_serverAdapterA_s1[0] ;
  assign metaBram_3_serverAdapterA_outData_outData_wget =
	     metaBram_3_serverAdapterA_outDataCore_EMPTY_N ?
	       metaBram_3_serverAdapterA_outDataCore_D_OUT :
	       metaBram_3_memory_DOA ;
  assign metaBram_3_serverAdapterA_outData_outData_whas =
	     metaBram_3_serverAdapterA_outDataCore_EMPTY_N ||
	     !metaBram_3_serverAdapterA_outDataCore_EMPTY_N &&
	     metaBram_3_serverAdapterA_outData_enqData_whas ;
  assign metaBram_3_serverAdapterA_cnt_1_wget = 3'd1 ;
  assign metaBram_3_serverAdapterA_cnt_1_whas = 1'b0 ;
  assign metaBram_3_serverAdapterA_cnt_2_wget = 3'h0 ;
  assign metaBram_3_serverAdapterA_cnt_2_whas = 1'b0 ;
  assign metaBram_3_serverAdapterA_cnt_3_wget = 3'h0 ;
  assign metaBram_3_serverAdapterA_cnt_3_whas = 1'b0 ;
  assign metaBram_3_serverAdapterA_writeWithResp_wget = 2'd2 ;
  assign metaBram_3_serverAdapterA_writeWithResp_whas =
	     MUX_metaCount_write_1__SEL_2 ;
  assign metaBram_3_serverAdapterA_s1_1_wget = 2'd2 ;
  assign metaBram_3_serverAdapterA_s1_1_whas = MUX_metaCount_write_1__SEL_2 ;
  assign metaBram_3_serverAdapterB_outData_enqData_wget =
	     metaBram_3_memory_DOB ;
  assign metaBram_3_serverAdapterB_outData_enqData_whas =
	     (!metaBram_3_serverAdapterB_s1[0] ||
	      metaBram_3_serverAdapterB_outDataCore_FULL_N) &&
	     metaBram_3_serverAdapterB_s1[1] &&
	     metaBram_3_serverAdapterB_s1[0] ;
  assign metaBram_3_serverAdapterB_outData_outData_wget = y_avValue__h26145 ;
  assign metaBram_3_serverAdapterB_outData_outData_whas =
	     metaBram_3_serverAdapterB_outDataCore_EMPTY_N ||
	     !metaBram_3_serverAdapterB_outDataCore_EMPTY_N &&
	     metaBram_3_serverAdapterB_outData_enqData_whas ;
  assign metaBram_3_serverAdapterB_cnt_1_wget = 3'd1 ;
  assign metaBram_3_serverAdapterB_cnt_1_whas =
	     WILL_FIRE_RL_metaBram_3_serverAdapterB_stageReadResponseAlways ;
  assign metaBram_3_serverAdapterB_cnt_2_wget = 3'd7 ;
  assign metaBram_3_serverAdapterB_cnt_2_whas =
	     metaBram_3_serverAdapterB_outData_deqCalled_whas ;
  assign metaBram_3_serverAdapterB_cnt_3_wget = 3'h0 ;
  assign metaBram_3_serverAdapterB_cnt_3_whas = 1'b0 ;
  assign metaBram_3_serverAdapterB_writeWithResp_wget = 2'd0 ;
  assign metaBram_3_serverAdapterB_writeWithResp_whas =
	     WILL_FIRE_RL_metaBram_3_serverAdapterB_stageReadResponseAlways ;
  assign metaBram_3_serverAdapterB_s1_1_wget = 2'd3 ;
  assign metaBram_3_serverAdapterB_s1_1_whas =
	     WILL_FIRE_RL_metaBram_3_serverAdapterB_stageReadResponseAlways ;
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
  assign wti_Es_mCmd_w_wget = wtiS0_MCmd ;
  assign wti_Es_mCmd_w_whas = 1'd1 ;
  assign wti_Es_mData_w_wget = wtiS0_MData ;
  assign wti_Es_mData_w_whas = 1'd1 ;
  assign wci_wslv_reqF_r_enq_whas = wci_wslv_wciReq_wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF_r_deq_whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_reqF_r_clr_whas = 1'b0 ;
  assign wci_wslv_respF_enqueueing_whas =
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[63:52] != 12'h800 &&
	     wci_wslv_reqF_D_OUT[63:52] != 12'h400 ||
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
  assign wsiS_reqFifo_r_enq_whas = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_r_deq_whas =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  assign wsiS_reqFifo_r_clr_whas = 1'b0 ;
  assign wsiS_reqFifo_doResetEnq_whas = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  assign wsiS_reqFifo_doResetDeq_whas =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  assign wsiS_reqFifo_doResetClr_whas = 1'b0 ;
  assign dataBram_0_serverAdapterA_outData_deqCalled_whas = 1'b0 ;
  assign dataBram_0_serverAdapterB_outData_deqCalled_whas =
	     MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 && splaF_D_OUT[2] &&
	     splaF_D_OUT[1:0] == 2'd0 ;
  assign metaBram_0_serverAdapterA_outData_deqCalled_whas = 1'b0 ;
  assign metaBram_0_serverAdapterB_outData_deqCalled_whas =
	     MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 &&
	     splaF_D_OUT[1:0] == 2'd0 &&
	     !splaF_D_OUT[2] ;
  assign metaBram_1_serverAdapterA_outData_deqCalled_whas = 1'b0 ;
  assign metaBram_1_serverAdapterB_outData_deqCalled_whas =
	     MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 &&
	     splaF_D_OUT[1:0] == 2'd1 &&
	     !splaF_D_OUT[2] ;
  assign metaBram_2_serverAdapterA_outData_deqCalled_whas = 1'b0 ;
  assign metaBram_2_serverAdapterB_outData_deqCalled_whas =
	     MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 &&
	     splaF_D_OUT[1:0] == 2'd2 &&
	     !splaF_D_OUT[2] ;
  assign metaBram_3_serverAdapterA_outData_deqCalled_whas = 1'b0 ;
  assign metaBram_3_serverAdapterB_outData_deqCalled_whas =
	     MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 &&
	     splaF_D_OUT[1:0] == 2'd3 &&
	     !splaF_D_OUT[2] ;
  assign wsi_Es_mReqLast_w_whas = wsiS0_MReqLast ;
  assign wsi_Es_mBurstPrecise_w_whas = wsiS0_MBurstPrecise ;
  assign wsi_Es_mDataInfo_w_whas = 1'd1 ;
  assign wsiS_extStatusW_wget =
	     { wsiS_pMesgCount, wsiS_iMesgCount, wsiS_tBusyCount } ;
  // register controlReg
  assign controlReg_D_IN =
	     MUX_controlReg_write_1__SEL_1 ?
	       wci_wslv_reqF_D_OUT[31:0] :
	       32'd0 ;
  assign controlReg_EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF_D_OUT[39:32] == 8'h0 ||
	     MUX_controlReg_write_1__SEL_2 ;
  // register dataBram_0_serverAdapterA_cnt
  assign dataBram_0_serverAdapterA_cnt_D_IN =
	     dataBram_0_serverAdapterA_cnt + 3'd0 + 3'd0 ;
  assign dataBram_0_serverAdapterA_cnt_EN = 1'b0 ;
  // register dataBram_0_serverAdapterA_s1
  assign dataBram_0_serverAdapterA_s1_D_IN =
	     { MUX_dataCount_write_1__SEL_2, 1'b0 } ;
  assign dataBram_0_serverAdapterA_s1_EN = 1'd1 ;
  // register dataBram_0_serverAdapterB_cnt
  assign dataBram_0_serverAdapterB_cnt_D_IN =
	     dataBram_0_serverAdapterB_cnt_19_PLUS_IF_dataB_ETC___d325 ;
  assign dataBram_0_serverAdapterB_cnt_EN =
	     WILL_FIRE_RL_dataBram_0_serverAdapterB_stageReadResponseAlways ||
	     dataBram_0_serverAdapterB_outData_deqCalled_whas ;
  // register dataBram_0_serverAdapterB_s1
  assign dataBram_0_serverAdapterB_s1_D_IN =
	     { WILL_FIRE_RL_dataBram_0_serverAdapterB_stageReadResponseAlways,
	       1'b1 } ;
  assign dataBram_0_serverAdapterB_s1_EN = 1'd1 ;
  // register dataCount
  always@(MUX_dataCount_write_1__SEL_1 or
	  wci_wslv_reqF_D_OUT or
	  MUX_dataCount_write_1__SEL_2 or
	  MUX_dataCount_write_1__VAL_2 or MUX_controlReg_write_1__SEL_2)
  case (1'b1)
    MUX_dataCount_write_1__SEL_1: dataCount_D_IN = wci_wslv_reqF_D_OUT[31:0];
    MUX_dataCount_write_1__SEL_2:
	dataCount_D_IN = MUX_dataCount_write_1__VAL_2;
    MUX_controlReg_write_1__SEL_2: dataCount_D_IN = 32'd0;
    default: dataCount_D_IN = 32'hAAAAAAAA /* unspecified value */ ;
  endcase
  assign dataCount_EN =
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     controlReg_28_BIT_0_29_AND_NOT_controlReg_28_B_ETC___d876 ||
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF_D_OUT[39:32] == 8'h08 ||
	     MUX_controlReg_write_1__SEL_2 ;
  // register isFirst
  assign isFirst_D_IN = 1'b0 ;
  assign isFirst_EN = 1'b0 ;
  // register mesgLengthSoFar
  assign mesgLengthSoFar_D_IN = wsiS_reqFifo_D_OUT[57] ? 14'd0 : mlB__h23202 ;
  assign mesgLengthSoFar_EN = MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 ;
  // register metaBram_0_serverAdapterA_cnt
  assign metaBram_0_serverAdapterA_cnt_D_IN =
	     metaBram_0_serverAdapterA_cnt + 3'd0 + 3'd0 ;
  assign metaBram_0_serverAdapterA_cnt_EN = 1'b0 ;
  // register metaBram_0_serverAdapterA_s1
  assign metaBram_0_serverAdapterA_s1_D_IN =
	     { MUX_metaCount_write_1__SEL_2, 1'b0 } ;
  assign metaBram_0_serverAdapterA_s1_EN = 1'd1 ;
  // register metaBram_0_serverAdapterB_cnt
  assign metaBram_0_serverAdapterB_cnt_D_IN =
	     metaBram_0_serverAdapterB_cnt_37_PLUS_IF_metaB_ETC___d443 ;
  assign metaBram_0_serverAdapterB_cnt_EN =
	     WILL_FIRE_RL_metaBram_0_serverAdapterB_stageReadResponseAlways ||
	     metaBram_0_serverAdapterB_outData_deqCalled_whas ;
  // register metaBram_0_serverAdapterB_s1
  assign metaBram_0_serverAdapterB_s1_D_IN =
	     { WILL_FIRE_RL_metaBram_0_serverAdapterB_stageReadResponseAlways,
	       1'b1 } ;
  assign metaBram_0_serverAdapterB_s1_EN = 1'd1 ;
  // register metaBram_1_serverAdapterA_cnt
  assign metaBram_1_serverAdapterA_cnt_D_IN =
	     metaBram_1_serverAdapterA_cnt + 3'd0 + 3'd0 ;
  assign metaBram_1_serverAdapterA_cnt_EN = 1'b0 ;
  // register metaBram_1_serverAdapterA_s1
  assign metaBram_1_serverAdapterA_s1_D_IN =
	     { MUX_metaCount_write_1__SEL_2, 1'b0 } ;
  assign metaBram_1_serverAdapterA_s1_EN = 1'd1 ;
  // register metaBram_1_serverAdapterB_cnt
  assign metaBram_1_serverAdapterB_cnt_D_IN =
	     metaBram_1_serverAdapterB_cnt_55_PLUS_IF_metaB_ETC___d561 ;
  assign metaBram_1_serverAdapterB_cnt_EN =
	     WILL_FIRE_RL_metaBram_1_serverAdapterB_stageReadResponseAlways ||
	     metaBram_1_serverAdapterB_outData_deqCalled_whas ;
  // register metaBram_1_serverAdapterB_s1
  assign metaBram_1_serverAdapterB_s1_D_IN =
	     { WILL_FIRE_RL_metaBram_1_serverAdapterB_stageReadResponseAlways,
	       1'b1 } ;
  assign metaBram_1_serverAdapterB_s1_EN = 1'd1 ;
  // register metaBram_2_serverAdapterA_cnt
  assign metaBram_2_serverAdapterA_cnt_D_IN =
	     metaBram_2_serverAdapterA_cnt + 3'd0 + 3'd0 ;
  assign metaBram_2_serverAdapterA_cnt_EN = 1'b0 ;
  // register metaBram_2_serverAdapterA_s1
  assign metaBram_2_serverAdapterA_s1_D_IN =
	     { MUX_metaCount_write_1__SEL_2, 1'b0 } ;
  assign metaBram_2_serverAdapterA_s1_EN = 1'd1 ;
  // register metaBram_2_serverAdapterB_cnt
  assign metaBram_2_serverAdapterB_cnt_D_IN =
	     metaBram_2_serverAdapterB_cnt_73_PLUS_IF_metaB_ETC___d679 ;
  assign metaBram_2_serverAdapterB_cnt_EN =
	     WILL_FIRE_RL_metaBram_2_serverAdapterB_stageReadResponseAlways ||
	     metaBram_2_serverAdapterB_outData_deqCalled_whas ;
  // register metaBram_2_serverAdapterB_s1
  assign metaBram_2_serverAdapterB_s1_D_IN =
	     { WILL_FIRE_RL_metaBram_2_serverAdapterB_stageReadResponseAlways,
	       1'b1 } ;
  assign metaBram_2_serverAdapterB_s1_EN = 1'd1 ;
  // register metaBram_3_serverAdapterA_cnt
  assign metaBram_3_serverAdapterA_cnt_D_IN =
	     metaBram_3_serverAdapterA_cnt + 3'd0 + 3'd0 ;
  assign metaBram_3_serverAdapterA_cnt_EN = 1'b0 ;
  // register metaBram_3_serverAdapterA_s1
  assign metaBram_3_serverAdapterA_s1_D_IN =
	     { MUX_metaCount_write_1__SEL_2, 1'b0 } ;
  assign metaBram_3_serverAdapterA_s1_EN = 1'd1 ;
  // register metaBram_3_serverAdapterB_cnt
  assign metaBram_3_serverAdapterB_cnt_D_IN =
	     metaBram_3_serverAdapterB_cnt_91_PLUS_IF_metaB_ETC___d797 ;
  assign metaBram_3_serverAdapterB_cnt_EN =
	     WILL_FIRE_RL_metaBram_3_serverAdapterB_stageReadResponseAlways ||
	     metaBram_3_serverAdapterB_outData_deqCalled_whas ;
  // register metaBram_3_serverAdapterB_s1
  assign metaBram_3_serverAdapterB_s1_D_IN =
	     { WILL_FIRE_RL_metaBram_3_serverAdapterB_stageReadResponseAlways,
	       1'b1 } ;
  assign metaBram_3_serverAdapterB_s1_EN = 1'd1 ;
  // register metaCount
  always@(MUX_metaCount_write_1__SEL_1 or
	  wci_wslv_reqF_D_OUT or
	  MUX_metaCount_write_1__SEL_2 or
	  MUX_metaCount_write_1__VAL_2 or MUX_controlReg_write_1__SEL_2)
  case (1'b1)
    MUX_metaCount_write_1__SEL_1: metaCount_D_IN = wci_wslv_reqF_D_OUT[31:0];
    MUX_metaCount_write_1__SEL_2:
	metaCount_D_IN = MUX_metaCount_write_1__VAL_2;
    MUX_controlReg_write_1__SEL_2: metaCount_D_IN = 32'd0;
    default: metaCount_D_IN = 32'hAAAAAAAA /* unspecified value */ ;
  endcase
  assign metaCount_EN =
	     WILL_FIRE_RL_wci_cfwr && wci_wslv_reqF_D_OUT[39:32] == 8'h04 ||
	     MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	     controlReg_28_BIT_0_29_AND_NOT_controlReg_28_B_ETC___d876 &&
	     wsiS_reqFifo_D_OUT[57] ||
	     MUX_controlReg_write_1__SEL_2 ;
  // register splitReadInFlight
  assign splitReadInFlight_D_IN = MUX_splitReadInFlight_write_1__SEL_1 ;
  assign splitReadInFlight_EN =
	     WILL_FIRE_RL_wci_cfrd &&
	     (wci_wslv_reqF_D_OUT[63:52] == 12'h800 ||
	      wci_wslv_reqF_D_OUT[63:52] == 12'h400) ||
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
  // register wsiS_burstKind
  assign wsiS_burstKind_D_IN =
	     (wsiS_burstKind == 2'd0) ?
	       (wsiS_wsiReq_wget[56] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign wsiS_burstKind_EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq &&
	     (wsiS_burstKind == 2'd0 ||
	      (wsiS_burstKind == 2'd1 || wsiS_burstKind == 2'd2) &&
	      wsiS_wsiReq_wget[57]) ;
  // register wsiS_errorSticky
  assign wsiS_errorSticky_D_IN = 1'b0 ;
  assign wsiS_errorSticky_EN = 1'b0 ;
  // register wsiS_iMesgCount
  assign wsiS_iMesgCount_D_IN = wsiS_iMesgCount + 32'd1 ;
  assign wsiS_iMesgCount_EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_burstKind == 2'd2 &&
	     wsiS_wsiReq_wget[57] ;
  // register wsiS_isReset_isInReset
  assign wsiS_isReset_isInReset_D_IN = 1'd0 ;
  assign wsiS_isReset_isInReset_EN = wsiS_isReset_isInReset ;
  // register wsiS_mesgWordLength
  assign wsiS_mesgWordLength_D_IN = wsiS_wordCount ;
  assign wsiS_mesgWordLength_EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_wsiReq_wget[57] ;
  // register wsiS_operateD
  assign wsiS_operateD_D_IN = wci_wslv_cState == 3'd2 ;
  assign wsiS_operateD_EN = 1'd1 ;
  // register wsiS_pMesgCount
  assign wsiS_pMesgCount_D_IN = wsiS_pMesgCount + 32'd1 ;
  assign wsiS_pMesgCount_EN =
	     WILL_FIRE_RL_wsiS_reqFifo_enq && wsiS_burstKind == 2'd1 &&
	     wsiS_wsiReq_wget[57] ;
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
	     wsiS_wsiReq_wget[57] ? 12'd1 : wsiS_wordCount + 12'd1 ;
  assign wsiS_wordCount_EN = WILL_FIRE_RL_wsiS_reqFifo_enq ;
  // register wtiS_isReset_isInReset
  assign wtiS_isReset_isInReset_D_IN = 1'd0 ;
  assign wtiS_isReset_isInReset_EN = wtiS_isReset_isInReset ;
  // register wtiS_nowReq
  assign wtiS_nowReq_D_IN = { wtiS0_MCmd, wtiS0_MData } ;
  assign wtiS_nowReq_EN = 1'd1 ;
  // register wtiS_operateD
  assign wtiS_operateD_D_IN = 1'b1 ;
  assign wtiS_operateD_EN = 1'd1 ;
  // submodule dataBram_0_memory
  assign dataBram_0_memory_ADDRA = dataCount[9:0] ;
  assign dataBram_0_memory_ADDRB = wci_wslv_reqF_D_OUT[43:34] ;
  assign dataBram_0_memory_DIA = wsiS_reqFifo_D_OUT[43:12] ;
  assign dataBram_0_memory_DIB = 32'd0 ;
  assign dataBram_0_memory_WEA = 1'd1 ;
  assign dataBram_0_memory_WEB = 1'd0 ;
  assign dataBram_0_memory_ENA = MUX_dataCount_write_1__SEL_2 ;
  assign dataBram_0_memory_ENB =
	     WILL_FIRE_RL_dataBram_0_serverAdapterB_stageReadResponseAlways ;
  // submodule dataBram_0_serverAdapterA_outDataCore
  assign dataBram_0_serverAdapterA_outDataCore_D_IN = dataBram_0_memory_DOA ;
  assign dataBram_0_serverAdapterA_outDataCore_ENQ =
	     dataBram_0_serverAdapterA_outDataCore_FULL_N &&
	     dataBram_0_serverAdapterA_outData_enqData_whas ;
  assign dataBram_0_serverAdapterA_outDataCore_DEQ = 1'b0 ;
  assign dataBram_0_serverAdapterA_outDataCore_CLR = 1'b0 ;
  // submodule dataBram_0_serverAdapterB_outDataCore
  assign dataBram_0_serverAdapterB_outDataCore_D_IN = dataBram_0_memory_DOB ;
  assign dataBram_0_serverAdapterB_outDataCore_ENQ =
	     WILL_FIRE_RL_dataBram_0_serverAdapterB_outData_enqAndDeq ||
	     dataBram_0_serverAdapterB_outDataCore_FULL_N &&
	     !dataBram_0_serverAdapterB_outData_deqCalled_whas &&
	     dataBram_0_serverAdapterB_outData_enqData_whas ;
  assign dataBram_0_serverAdapterB_outDataCore_DEQ =
	     WILL_FIRE_RL_dataBram_0_serverAdapterB_outData_enqAndDeq ||
	     dataBram_0_serverAdapterB_outDataCore_EMPTY_N &&
	     dataBram_0_serverAdapterB_outData_deqCalled_whas &&
	     !dataBram_0_serverAdapterB_outData_enqData_whas ;
  assign dataBram_0_serverAdapterB_outDataCore_CLR = 1'b0 ;
  // submodule metaBram_0_memory
  assign metaBram_0_memory_ADDRA = metaCount[9:0] ;
  assign metaBram_0_memory_ADDRB = wci_wslv_reqF_D_OUT[45:36] ;
  assign metaBram_0_memory_DIA = { 18'd0, mlB__h23202 } ;
  assign metaBram_0_memory_DIB = 32'd0 ;
  assign metaBram_0_memory_WEA = 1'd1 ;
  assign metaBram_0_memory_WEB = 1'd0 ;
  assign metaBram_0_memory_ENA = MUX_metaCount_write_1__SEL_2 ;
  assign metaBram_0_memory_ENB =
	     WILL_FIRE_RL_metaBram_0_serverAdapterB_stageReadResponseAlways ;
  // submodule metaBram_0_serverAdapterA_outDataCore
  assign metaBram_0_serverAdapterA_outDataCore_D_IN = metaBram_0_memory_DOA ;
  assign metaBram_0_serverAdapterA_outDataCore_ENQ =
	     metaBram_0_serverAdapterA_outDataCore_FULL_N &&
	     metaBram_0_serverAdapterA_outData_enqData_whas ;
  assign metaBram_0_serverAdapterA_outDataCore_DEQ = 1'b0 ;
  assign metaBram_0_serverAdapterA_outDataCore_CLR = 1'b0 ;
  // submodule metaBram_0_serverAdapterB_outDataCore
  assign metaBram_0_serverAdapterB_outDataCore_D_IN = metaBram_0_memory_DOB ;
  assign metaBram_0_serverAdapterB_outDataCore_ENQ =
	     WILL_FIRE_RL_metaBram_0_serverAdapterB_outData_enqAndDeq ||
	     metaBram_0_serverAdapterB_outDataCore_FULL_N &&
	     !metaBram_0_serverAdapterB_outData_deqCalled_whas &&
	     metaBram_0_serverAdapterB_outData_enqData_whas ;
  assign metaBram_0_serverAdapterB_outDataCore_DEQ =
	     WILL_FIRE_RL_metaBram_0_serverAdapterB_outData_enqAndDeq ||
	     metaBram_0_serverAdapterB_outDataCore_EMPTY_N &&
	     metaBram_0_serverAdapterB_outData_deqCalled_whas &&
	     !metaBram_0_serverAdapterB_outData_enqData_whas ;
  assign metaBram_0_serverAdapterB_outDataCore_CLR = 1'b0 ;
  // submodule metaBram_1_memory
  assign metaBram_1_memory_ADDRA = metaCount[9:0] ;
  assign metaBram_1_memory_ADDRB = wci_wslv_reqF_D_OUT[45:36] ;
  assign metaBram_1_memory_DIA = { 24'd0, wsiS_reqFifo_D_OUT[7:0] } ;
  assign metaBram_1_memory_DIB = 32'd0 ;
  assign metaBram_1_memory_WEA = 1'd1 ;
  assign metaBram_1_memory_WEB = 1'd0 ;
  assign metaBram_1_memory_ENA = MUX_metaCount_write_1__SEL_2 ;
  assign metaBram_1_memory_ENB =
	     WILL_FIRE_RL_metaBram_1_serverAdapterB_stageReadResponseAlways ;
  // submodule metaBram_1_serverAdapterA_outDataCore
  assign metaBram_1_serverAdapterA_outDataCore_D_IN = metaBram_1_memory_DOA ;
  assign metaBram_1_serverAdapterA_outDataCore_ENQ =
	     metaBram_1_serverAdapterA_outDataCore_FULL_N &&
	     metaBram_1_serverAdapterA_outData_enqData_whas ;
  assign metaBram_1_serverAdapterA_outDataCore_DEQ = 1'b0 ;
  assign metaBram_1_serverAdapterA_outDataCore_CLR = 1'b0 ;
  // submodule metaBram_1_serverAdapterB_outDataCore
  assign metaBram_1_serverAdapterB_outDataCore_D_IN = metaBram_1_memory_DOB ;
  assign metaBram_1_serverAdapterB_outDataCore_ENQ =
	     WILL_FIRE_RL_metaBram_1_serverAdapterB_outData_enqAndDeq ||
	     metaBram_1_serverAdapterB_outDataCore_FULL_N &&
	     !metaBram_1_serverAdapterB_outData_deqCalled_whas &&
	     metaBram_1_serverAdapterB_outData_enqData_whas ;
  assign metaBram_1_serverAdapterB_outDataCore_DEQ =
	     WILL_FIRE_RL_metaBram_1_serverAdapterB_outData_enqAndDeq ||
	     metaBram_1_serverAdapterB_outDataCore_EMPTY_N &&
	     metaBram_1_serverAdapterB_outData_deqCalled_whas &&
	     !metaBram_1_serverAdapterB_outData_enqData_whas ;
  assign metaBram_1_serverAdapterB_outDataCore_CLR = 1'b0 ;
  // submodule metaBram_2_memory
  assign metaBram_2_memory_ADDRA = metaCount[9:0] ;
  assign metaBram_2_memory_ADDRB = wci_wslv_reqF_D_OUT[45:36] ;
  assign metaBram_2_memory_DIA = nowW_wget[63:32] ;
  assign metaBram_2_memory_DIB = 32'd0 ;
  assign metaBram_2_memory_WEA = 1'd1 ;
  assign metaBram_2_memory_WEB = 1'd0 ;
  assign metaBram_2_memory_ENA = MUX_metaCount_write_1__SEL_2 ;
  assign metaBram_2_memory_ENB =
	     WILL_FIRE_RL_metaBram_2_serverAdapterB_stageReadResponseAlways ;
  // submodule metaBram_2_serverAdapterA_outDataCore
  assign metaBram_2_serverAdapterA_outDataCore_D_IN = metaBram_2_memory_DOA ;
  assign metaBram_2_serverAdapterA_outDataCore_ENQ =
	     metaBram_2_serverAdapterA_outDataCore_FULL_N &&
	     metaBram_2_serverAdapterA_outData_enqData_whas ;
  assign metaBram_2_serverAdapterA_outDataCore_DEQ = 1'b0 ;
  assign metaBram_2_serverAdapterA_outDataCore_CLR = 1'b0 ;
  // submodule metaBram_2_serverAdapterB_outDataCore
  assign metaBram_2_serverAdapterB_outDataCore_D_IN = metaBram_2_memory_DOB ;
  assign metaBram_2_serverAdapterB_outDataCore_ENQ =
	     WILL_FIRE_RL_metaBram_2_serverAdapterB_outData_enqAndDeq ||
	     metaBram_2_serverAdapterB_outDataCore_FULL_N &&
	     !metaBram_2_serverAdapterB_outData_deqCalled_whas &&
	     metaBram_2_serverAdapterB_outData_enqData_whas ;
  assign metaBram_2_serverAdapterB_outDataCore_DEQ =
	     WILL_FIRE_RL_metaBram_2_serverAdapterB_outData_enqAndDeq ||
	     metaBram_2_serverAdapterB_outDataCore_EMPTY_N &&
	     metaBram_2_serverAdapterB_outData_deqCalled_whas &&
	     !metaBram_2_serverAdapterB_outData_enqData_whas ;
  assign metaBram_2_serverAdapterB_outDataCore_CLR = 1'b0 ;
  // submodule metaBram_3_memory
  assign metaBram_3_memory_ADDRA = metaCount[9:0] ;
  assign metaBram_3_memory_ADDRB = wci_wslv_reqF_D_OUT[45:36] ;
  assign metaBram_3_memory_DIA = nowW_wget[31:0] ;
  assign metaBram_3_memory_DIB = 32'd0 ;
  assign metaBram_3_memory_WEA = 1'd1 ;
  assign metaBram_3_memory_WEB = 1'd0 ;
  assign metaBram_3_memory_ENA = MUX_metaCount_write_1__SEL_2 ;
  assign metaBram_3_memory_ENB =
	     WILL_FIRE_RL_metaBram_3_serverAdapterB_stageReadResponseAlways ;
  // submodule metaBram_3_serverAdapterA_outDataCore
  assign metaBram_3_serverAdapterA_outDataCore_D_IN = metaBram_3_memory_DOA ;
  assign metaBram_3_serverAdapterA_outDataCore_ENQ =
	     metaBram_3_serverAdapterA_outDataCore_FULL_N &&
	     metaBram_3_serverAdapterA_outData_enqData_whas ;
  assign metaBram_3_serverAdapterA_outDataCore_DEQ = 1'b0 ;
  assign metaBram_3_serverAdapterA_outDataCore_CLR = 1'b0 ;
  // submodule metaBram_3_serverAdapterB_outDataCore
  assign metaBram_3_serverAdapterB_outDataCore_D_IN = metaBram_3_memory_DOB ;
  assign metaBram_3_serverAdapterB_outDataCore_ENQ =
	     WILL_FIRE_RL_metaBram_3_serverAdapterB_outData_enqAndDeq ||
	     metaBram_3_serverAdapterB_outDataCore_FULL_N &&
	     !metaBram_3_serverAdapterB_outData_deqCalled_whas &&
	     metaBram_3_serverAdapterB_outData_enqData_whas ;
  assign metaBram_3_serverAdapterB_outDataCore_DEQ =
	     WILL_FIRE_RL_metaBram_3_serverAdapterB_outData_enqAndDeq ||
	     metaBram_3_serverAdapterB_outDataCore_EMPTY_N &&
	     metaBram_3_serverAdapterB_outData_deqCalled_whas &&
	     !metaBram_3_serverAdapterB_outData_enqData_whas ;
  assign metaBram_3_serverAdapterB_outDataCore_CLR = 1'b0 ;
  // submodule splaF
  assign splaF_D_IN =
	     (wci_wslv_reqF_D_OUT[63:52] == 12'h800) ?
	       3'd4 :
	       { 1'd0, wci_wslv_reqF_D_OUT[35:34] } ;
  assign splaF_ENQ = MUX_splitReadInFlight_write_1__SEL_1 ;
  assign splaF_DEQ = MUX_wci_wslv_respF_x_wire_wset_1__SEL_3 ;
  assign splaF_CLR = 1'b0 ;
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
  assign IF_splaF_first__95_BIT_2_96_THEN_NOT_splaF_fir_ETC___d916 =
	     splaF_D_OUT[2] ?
	       (splaF_D_OUT[1:0] != 2'd0 ||
		dataBram_0_serverAdapterB_outDataCore_EMPTY_N ||
		dataBram_0_serverAdapterB_outData_enqData_whas) &&
	       (splaF_D_OUT[1:0] != 2'd0 ||
		dataBram_0_serverAdapterB_outData_outData_whas) :
	       CASE_splaF_first__95_BITS_1_TO_0_97_0_metaBram_ETC___d909 &&
	       CASE_splaF_first__95_BITS_1_TO_0_97_0_metaBram_ETC___d914 ;
  assign NOT_controlReg_28_BIT_0_29_30_OR_controlReg_28_ETC___d854 =
	     !controlReg[0] ||
	     controlReg[1] &&
	     (!metaCount_32_ULT_1024___d833 ||
	      !dataCount_35_ULT_1024___d836) ||
	     (dataBram_0_serverAdapterA_cnt ^ 3'h4) < 3'd7 &&
	     (!wsiS_reqFifo_D_OUT[57] ||
	      (metaBram_0_serverAdapterA_cnt ^ 3'h4) < 3'd7 &&
	      (metaBram_1_serverAdapterA_cnt ^ 3'h4) < 3'd7 &&
	      (metaBram_2_serverAdapterA_cnt ^ 3'h4) < 3'd7 &&
	      (metaBram_3_serverAdapterA_cnt ^ 3'h4) < 3'd7) ;
  assign _dfoo1 =
	     wci_wslv_respF_cntr_r != 2'd2 ||
	     wci_wslv_respF_cntr_r_8_MINUS_1___d27 == 2'd1 ;
  assign _dfoo3 =
	     wci_wslv_respF_cntr_r != 2'd1 ||
	     wci_wslv_respF_cntr_r_8_MINUS_1___d27 == 2'd0 ;
  assign controlReg_28_BIT_0_29_AND_NOT_controlReg_28_B_ETC___d876 =
	     controlReg[0] &&
	     (!controlReg[1] ||
	      metaCount_32_ULT_1024___d833 && dataCount_35_ULT_1024___d836) ;
  assign dataBram_0_serverAdapterB_cnt_19_PLUS_IF_dataB_ETC___d325 =
	     dataBram_0_serverAdapterB_cnt +
	     (WILL_FIRE_RL_dataBram_0_serverAdapterB_stageReadResponseAlways ?
		3'd1 :
		3'd0) +
	     (dataBram_0_serverAdapterB_outData_deqCalled_whas ?
		3'd7 :
		3'd0) ;
  assign dataCount_35_ULT_1024___d836 = dataCount < 32'd1024 ;
  assign g_data__h27820 =
	     (wci_wslv_reqF_D_OUT[63:52] == 12'h0) ? v__h26736 : 32'd0 ;
  assign metaBram_0_serverAdapterB_cnt_37_PLUS_IF_metaB_ETC___d443 =
	     metaBram_0_serverAdapterB_cnt +
	     (WILL_FIRE_RL_metaBram_0_serverAdapterB_stageReadResponseAlways ?
		3'd1 :
		3'd0) +
	     (metaBram_0_serverAdapterB_outData_deqCalled_whas ?
		3'd7 :
		3'd0) ;
  assign metaBram_1_serverAdapterB_cnt_55_PLUS_IF_metaB_ETC___d561 =
	     metaBram_1_serverAdapterB_cnt +
	     (WILL_FIRE_RL_metaBram_1_serverAdapterB_stageReadResponseAlways ?
		3'd1 :
		3'd0) +
	     (metaBram_1_serverAdapterB_outData_deqCalled_whas ?
		3'd7 :
		3'd0) ;
  assign metaBram_2_serverAdapterB_cnt_73_PLUS_IF_metaB_ETC___d679 =
	     metaBram_2_serverAdapterB_cnt +
	     (WILL_FIRE_RL_metaBram_2_serverAdapterB_stageReadResponseAlways ?
		3'd1 :
		3'd0) +
	     (metaBram_2_serverAdapterB_outData_deqCalled_whas ?
		3'd7 :
		3'd0) ;
  assign metaBram_3_serverAdapterB_cnt_91_PLUS_IF_metaB_ETC___d797 =
	     metaBram_3_serverAdapterB_cnt +
	     (WILL_FIRE_RL_metaBram_3_serverAdapterB_stageReadResponseAlways ?
		3'd1 :
		3'd0) +
	     (metaBram_3_serverAdapterB_outData_deqCalled_whas ?
		3'd7 :
		3'd0) ;
  assign metaCount_32_ULT_1024___d833 = metaCount < 32'd1024 ;
  assign mlB__h23202 = mesgLengthSoFar + mlInc__h23201 ;
  assign mlInc__h23201 =
	     wsiS_reqFifo_D_OUT[57] ?
	       { 11'd0, x__h23250 + y__h23251 } :
	       14'd4 ;
  assign rdat___1__h26833 =
	     { 6'd40,
	       !metaCount_32_ULT_1024___d833,
	       !dataCount_35_ULT_1024___d836,
	       24'd2361866 } ;
  assign rdat___1__h26917 = hasDebugLogic ? { 24'd0, wsiS_statusR } : 32'd0 ;
  assign rdat___1__h26972 =
	     hasDebugLogic ? wsiS_extStatusW_wget[95:64] : 32'd0 ;
  assign rdat___1__h26986 =
	     hasDebugLogic ? wsiS_extStatusW_wget[63:32] : 32'd0 ;
  assign rdat___1__h26994 =
	     hasDebugLogic ? wsiS_extStatusW_wget[31:0] : 32'd0 ;
  assign v__h25458 =
	     splaF_D_OUT[2] ?
	       y_avValue__h25982 :
	       SEL_ARR_metaBram_0_serverAdapterB_outData_outD_ETC___d940 ;
  assign wci_wslv_respF_cntr_r_8_MINUS_1___d27 =
	     wci_wslv_respF_cntr_r - 2'd1 ;
  assign x__h23250 = x__h23262 + y__h23263 ;
  assign x__h23262 = x__h23274 + y__h23275 ;
  assign x__h23274 = { 2'd0, wsiS_reqFifo_D_OUT[11] } ;
  assign y__h23251 = { 2'd0, wsiS_reqFifo_D_OUT[8] } ;
  assign y__h23263 = { 2'd0, wsiS_reqFifo_D_OUT[9] } ;
  assign y__h23275 = { 2'd0, wsiS_reqFifo_D_OUT[10] } ;
  assign y_avValue__h25982 =
	     dataBram_0_serverAdapterB_outDataCore_EMPTY_N ?
	       dataBram_0_serverAdapterB_outDataCore_D_OUT :
	       dataBram_0_memory_DOB ;
  assign y_avValue__h26025 =
	     metaBram_0_serverAdapterB_outDataCore_EMPTY_N ?
	       metaBram_0_serverAdapterB_outDataCore_D_OUT :
	       metaBram_0_memory_DOB ;
  assign y_avValue__h26065 =
	     metaBram_1_serverAdapterB_outDataCore_EMPTY_N ?
	       metaBram_1_serverAdapterB_outDataCore_D_OUT :
	       metaBram_1_memory_DOB ;
  assign y_avValue__h26105 =
	     metaBram_2_serverAdapterB_outDataCore_EMPTY_N ?
	       metaBram_2_serverAdapterB_outDataCore_D_OUT :
	       metaBram_2_memory_DOB ;
  assign y_avValue__h26145 =
	     metaBram_3_serverAdapterB_outDataCore_EMPTY_N ?
	       metaBram_3_serverAdapterB_outDataCore_D_OUT :
	       metaBram_3_memory_DOB ;
  always@(wci_wslv_reqF_D_OUT or
	  metaBram_0_serverAdapterB_cnt or
	  metaBram_1_serverAdapterB_cnt or
	  metaBram_2_serverAdapterB_cnt or metaBram_3_serverAdapterB_cnt)
  begin
    case (wci_wslv_reqF_D_OUT[35:34])
      2'd0:
	  CASE_wci_wslv_reqF_first__3_BITS_35_TO_34_70_0_ETC___d975 =
	      (metaBram_0_serverAdapterB_cnt ^ 3'h4) < 3'd7;
      2'd1:
	  CASE_wci_wslv_reqF_first__3_BITS_35_TO_34_70_0_ETC___d975 =
	      (metaBram_1_serverAdapterB_cnt ^ 3'h4) < 3'd7;
      2'd2:
	  CASE_wci_wslv_reqF_first__3_BITS_35_TO_34_70_0_ETC___d975 =
	      (metaBram_2_serverAdapterB_cnt ^ 3'h4) < 3'd7;
      2'd3:
	  CASE_wci_wslv_reqF_first__3_BITS_35_TO_34_70_0_ETC___d975 =
	      (metaBram_3_serverAdapterB_cnt ^ 3'h4) < 3'd7;
    endcase
  end
  always@(wci_wslv_reqF_D_OUT or
	  controlReg or
	  metaCount or
	  dataCount or
	  rdat___1__h26833 or
	  rdat___1__h26917 or
	  rdat___1__h26972 or rdat___1__h26986 or rdat___1__h26994)
  begin
    case (wci_wslv_reqF_D_OUT[39:32])
      8'h0: v__h26736 = controlReg;
      8'h04: v__h26736 = metaCount;
      8'h08: v__h26736 = dataCount;
      8'h0C: v__h26736 = rdat___1__h26833;
      8'h10: v__h26736 = rdat___1__h26917;
      8'h14: v__h26736 = rdat___1__h26972;
      8'h18: v__h26736 = rdat___1__h26986;
      8'h1C: v__h26736 = rdat___1__h26994;
      default: v__h26736 = 32'd0;
    endcase
  end
  always@(wci_wslv_reqF_D_OUT or
	  splaF_FULL_N or
	  CASE_wci_wslv_reqF_first__3_BITS_35_TO_34_70_0_ETC___d975 or
	  dataBram_0_serverAdapterB_cnt)
  begin
    case (wci_wslv_reqF_D_OUT[63:52])
      12'h0: IF_wci_wslv_reqF_first__3_BITS_63_TO_52_54_EQ__ETC___d979 = 1'b1;
      12'h800:
	  IF_wci_wslv_reqF_first__3_BITS_63_TO_52_54_EQ__ETC___d979 =
	      (dataBram_0_serverAdapterB_cnt ^ 3'h4) < 3'd7 && splaF_FULL_N;
      default: IF_wci_wslv_reqF_first__3_BITS_63_TO_52_54_EQ__ETC___d979 =
		   wci_wslv_reqF_D_OUT[63:52] != 12'h400 ||
		   splaF_FULL_N &&
		   CASE_wci_wslv_reqF_first__3_BITS_35_TO_34_70_0_ETC___d975;
    endcase
  end
  always@(splaF_D_OUT or
	  y_avValue__h26025 or
	  y_avValue__h26065 or y_avValue__h26105 or y_avValue__h26145)
  begin
    case (splaF_D_OUT[1:0])
      2'd0:
	  SEL_ARR_metaBram_0_serverAdapterB_outData_outD_ETC___d940 =
	      y_avValue__h26025;
      2'd1:
	  SEL_ARR_metaBram_0_serverAdapterB_outData_outD_ETC___d940 =
	      y_avValue__h26065;
      2'd2:
	  SEL_ARR_metaBram_0_serverAdapterB_outData_outD_ETC___d940 =
	      y_avValue__h26105;
      2'd3:
	  SEL_ARR_metaBram_0_serverAdapterB_outData_outD_ETC___d940 =
	      y_avValue__h26145;
    endcase
  end
  always@(splaF_D_OUT or
	  metaBram_0_serverAdapterB_outDataCore_EMPTY_N or
	  metaBram_0_serverAdapterB_outData_enqData_whas or
	  metaBram_1_serverAdapterB_outDataCore_EMPTY_N or
	  metaBram_1_serverAdapterB_outData_enqData_whas or
	  metaBram_2_serverAdapterB_outDataCore_EMPTY_N or
	  metaBram_2_serverAdapterB_outData_enqData_whas or
	  metaBram_3_serverAdapterB_outDataCore_EMPTY_N or
	  metaBram_3_serverAdapterB_outData_enqData_whas)
  begin
    case (splaF_D_OUT[1:0])
      2'd0:
	  CASE_splaF_first__95_BITS_1_TO_0_97_0_metaBram_ETC___d909 =
	      metaBram_0_serverAdapterB_outDataCore_EMPTY_N ||
	      metaBram_0_serverAdapterB_outData_enqData_whas;
      2'd1:
	  CASE_splaF_first__95_BITS_1_TO_0_97_0_metaBram_ETC___d909 =
	      metaBram_1_serverAdapterB_outDataCore_EMPTY_N ||
	      metaBram_1_serverAdapterB_outData_enqData_whas;
      2'd2:
	  CASE_splaF_first__95_BITS_1_TO_0_97_0_metaBram_ETC___d909 =
	      metaBram_2_serverAdapterB_outDataCore_EMPTY_N ||
	      metaBram_2_serverAdapterB_outData_enqData_whas;
      2'd3:
	  CASE_splaF_first__95_BITS_1_TO_0_97_0_metaBram_ETC___d909 =
	      metaBram_3_serverAdapterB_outDataCore_EMPTY_N ||
	      metaBram_3_serverAdapterB_outData_enqData_whas;
    endcase
  end
  always@(splaF_D_OUT or
	  metaBram_0_serverAdapterB_outData_outData_whas or
	  metaBram_1_serverAdapterB_outData_outData_whas or
	  metaBram_2_serverAdapterB_outData_outData_whas or
	  metaBram_3_serverAdapterB_outData_outData_whas)
  begin
    case (splaF_D_OUT[1:0])
      2'd0:
	  CASE_splaF_first__95_BITS_1_TO_0_97_0_metaBram_ETC___d914 =
	      metaBram_0_serverAdapterB_outData_outData_whas;
      2'd1:
	  CASE_splaF_first__95_BITS_1_TO_0_97_0_metaBram_ETC___d914 =
	      metaBram_1_serverAdapterB_outData_outData_whas;
      2'd2:
	  CASE_splaF_first__95_BITS_1_TO_0_97_0_metaBram_ETC___d914 =
	      metaBram_2_serverAdapterB_outData_outData_whas;
      2'd3:
	  CASE_splaF_first__95_BITS_1_TO_0_97_0_metaBram_ETC___d914 =
	      metaBram_3_serverAdapterB_outData_outData_whas;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (wciS0_MReset_n == `BSV_RESET_VALUE)
      begin
        dataBram_0_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	dataBram_0_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	dataBram_0_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	dataBram_0_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	isFirst <= `BSV_ASSIGNMENT_DELAY 1'd1;
	mesgLengthSoFar <= `BSV_ASSIGNMENT_DELAY 14'd0;
	metaBram_0_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	metaBram_0_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	metaBram_0_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	metaBram_0_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	metaBram_1_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	metaBram_1_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	metaBram_1_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	metaBram_1_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	metaBram_2_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	metaBram_2_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	metaBram_2_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	metaBram_2_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	metaBram_3_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	metaBram_3_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	metaBram_3_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	metaBram_3_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
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
	wtiS_nowReq <= `BSV_ASSIGNMENT_DELAY 67'd0;
	wtiS_operateD <= `BSV_ASSIGNMENT_DELAY 1'd1;
      end
    else
      begin
        if (dataBram_0_serverAdapterA_cnt_EN)
	  dataBram_0_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY
	      dataBram_0_serverAdapterA_cnt_D_IN;
	if (dataBram_0_serverAdapterA_s1_EN)
	  dataBram_0_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY
	      dataBram_0_serverAdapterA_s1_D_IN;
	if (dataBram_0_serverAdapterB_cnt_EN)
	  dataBram_0_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY
	      dataBram_0_serverAdapterB_cnt_D_IN;
	if (dataBram_0_serverAdapterB_s1_EN)
	  dataBram_0_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY
	      dataBram_0_serverAdapterB_s1_D_IN;
	if (isFirst_EN) isFirst <= `BSV_ASSIGNMENT_DELAY isFirst_D_IN;
	if (mesgLengthSoFar_EN)
	  mesgLengthSoFar <= `BSV_ASSIGNMENT_DELAY mesgLengthSoFar_D_IN;
	if (metaBram_0_serverAdapterA_cnt_EN)
	  metaBram_0_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY
	      metaBram_0_serverAdapterA_cnt_D_IN;
	if (metaBram_0_serverAdapterA_s1_EN)
	  metaBram_0_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY
	      metaBram_0_serverAdapterA_s1_D_IN;
	if (metaBram_0_serverAdapterB_cnt_EN)
	  metaBram_0_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY
	      metaBram_0_serverAdapterB_cnt_D_IN;
	if (metaBram_0_serverAdapterB_s1_EN)
	  metaBram_0_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY
	      metaBram_0_serverAdapterB_s1_D_IN;
	if (metaBram_1_serverAdapterA_cnt_EN)
	  metaBram_1_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY
	      metaBram_1_serverAdapterA_cnt_D_IN;
	if (metaBram_1_serverAdapterA_s1_EN)
	  metaBram_1_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY
	      metaBram_1_serverAdapterA_s1_D_IN;
	if (metaBram_1_serverAdapterB_cnt_EN)
	  metaBram_1_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY
	      metaBram_1_serverAdapterB_cnt_D_IN;
	if (metaBram_1_serverAdapterB_s1_EN)
	  metaBram_1_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY
	      metaBram_1_serverAdapterB_s1_D_IN;
	if (metaBram_2_serverAdapterA_cnt_EN)
	  metaBram_2_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY
	      metaBram_2_serverAdapterA_cnt_D_IN;
	if (metaBram_2_serverAdapterA_s1_EN)
	  metaBram_2_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY
	      metaBram_2_serverAdapterA_s1_D_IN;
	if (metaBram_2_serverAdapterB_cnt_EN)
	  metaBram_2_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY
	      metaBram_2_serverAdapterB_cnt_D_IN;
	if (metaBram_2_serverAdapterB_s1_EN)
	  metaBram_2_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY
	      metaBram_2_serverAdapterB_s1_D_IN;
	if (metaBram_3_serverAdapterA_cnt_EN)
	  metaBram_3_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY
	      metaBram_3_serverAdapterA_cnt_D_IN;
	if (metaBram_3_serverAdapterA_s1_EN)
	  metaBram_3_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY
	      metaBram_3_serverAdapterA_s1_D_IN;
	if (metaBram_3_serverAdapterB_cnt_EN)
	  metaBram_3_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY
	      metaBram_3_serverAdapterB_cnt_D_IN;
	if (metaBram_3_serverAdapterB_s1_EN)
	  metaBram_3_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY
	      metaBram_3_serverAdapterB_s1_D_IN;
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
	if (wtiS_nowReq_EN)
	  wtiS_nowReq <= `BSV_ASSIGNMENT_DELAY wtiS_nowReq_D_IN;
	if (wtiS_operateD_EN)
	  wtiS_operateD <= `BSV_ASSIGNMENT_DELAY wtiS_operateD_D_IN;
      end
    if (controlReg_EN) controlReg <= `BSV_ASSIGNMENT_DELAY controlReg_D_IN;
    if (dataCount_EN) dataCount <= `BSV_ASSIGNMENT_DELAY dataCount_D_IN;
    if (metaCount_EN) metaCount <= `BSV_ASSIGNMENT_DELAY metaCount_D_IN;
    if (wsiS_mesgWordLength_EN)
      wsiS_mesgWordLength <= `BSV_ASSIGNMENT_DELAY wsiS_mesgWordLength_D_IN;
    if (wsiS_statusR_EN)
      wsiS_statusR <= `BSV_ASSIGNMENT_DELAY wsiS_statusR_D_IN;
  end
  always@(posedge wciS0_Clk or `BSV_RESET_EDGE wciS0_MReset_n)
  if (wciS0_MReset_n == `BSV_RESET_VALUE)
    begin
      wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wsiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wtiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (wci_wslv_isReset_isInReset_EN)
	wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wci_wslv_isReset_isInReset_D_IN;
      if (wsiS_isReset_isInReset_EN)
	wsiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wsiS_isReset_isInReset_D_IN;
      if (wtiS_isReset_isInReset_EN)
	wtiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wtiS_isReset_isInReset_D_IN;
    end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    controlReg = 32'hAAAAAAAA;
    dataBram_0_serverAdapterA_cnt = 3'h2;
    dataBram_0_serverAdapterA_s1 = 2'h2;
    dataBram_0_serverAdapterB_cnt = 3'h2;
    dataBram_0_serverAdapterB_s1 = 2'h2;
    dataCount = 32'hAAAAAAAA;
    isFirst = 1'h0;
    mesgLengthSoFar = 14'h2AAA;
    metaBram_0_serverAdapterA_cnt = 3'h2;
    metaBram_0_serverAdapterA_s1 = 2'h2;
    metaBram_0_serverAdapterB_cnt = 3'h2;
    metaBram_0_serverAdapterB_s1 = 2'h2;
    metaBram_1_serverAdapterA_cnt = 3'h2;
    metaBram_1_serverAdapterA_s1 = 2'h2;
    metaBram_1_serverAdapterB_cnt = 3'h2;
    metaBram_1_serverAdapterB_s1 = 2'h2;
    metaBram_2_serverAdapterA_cnt = 3'h2;
    metaBram_2_serverAdapterA_s1 = 2'h2;
    metaBram_2_serverAdapterB_cnt = 3'h2;
    metaBram_2_serverAdapterB_s1 = 2'h2;
    metaBram_3_serverAdapterA_cnt = 3'h2;
    metaBram_3_serverAdapterA_s1 = 2'h2;
    metaBram_3_serverAdapterB_cnt = 3'h2;
    metaBram_3_serverAdapterB_s1 = 2'h2;
    metaCount = 32'hAAAAAAAA;
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
    wtiS_isReset_isInReset = 1'h0;
    wtiS_nowReq = 67'h2AAAAAAAAAAAAAAAA;
    wtiS_operateD = 1'h0;
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
	  v__h3586 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3586,
		 wci_wslv_reqF_D_OUT[36:34],
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[63:52] == 12'h0)
	begin
	  v__h26755 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[63:52] == 12'h0)
	$display("[%0d]: %m: WCI CONFIG READ Addr:%0x BE:%0x Data:%0x",
		 v__h26755,
		 wci_wslv_reqF_D_OUT[63:32],
		 wci_wslv_reqF_D_OUT[67:64],
		 v__h26736);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	  controlReg_28_BIT_0_29_AND_NOT_controlReg_28_B_ETC___d876 &&
	  wsiS_reqFifo_D_OUT[57])
	begin
	  v__h25329 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (MUX_wsiS_reqFifo_levelsValid_write_1__SEL_3 &&
	  controlReg_28_BIT_0_29_AND_NOT_controlReg_28_B_ETC___d876 &&
	  wsiS_reqFifo_D_OUT[57])
	$display("[%0d]: %m: doMessageAccept DWM metaCount:%0x WSI opcode:%0x length:%0x",
		 v__h25329,
		 metaCount,
		 wsiS_reqFifo_D_OUT[7:0],
		 mlB__h23202);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	begin
	  v__h26550 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	$display("[%0d]: %m: WCI CONFIG WRITE Addr:%0x BE:%0x Data:%0x",
		 v__h26550,
		 wci_wslv_reqF_D_OUT[63:32],
		 wci_wslv_reqF_D_OUT[67:64],
		 wci_wslv_reqF_D_OUT[31:0]);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	begin
	  v__h3905 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h3905,
		 wci_wslv_cEdge,
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	begin
	  v__h3761 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h3761,
		 wci_wslv_cEdge,
		 wci_wslv_cState,
		 wci_wslv_nState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (dataBram_0_serverAdapterA_s1[1] &&
	  !dataBram_0_serverAdapterA_outDataCore_FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (dataBram_0_serverAdapterB_s1[1] &&
	  !dataBram_0_serverAdapterB_outDataCore_FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (metaBram_0_serverAdapterA_s1[1] &&
	  !metaBram_0_serverAdapterA_outDataCore_FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (metaBram_0_serverAdapterB_s1[1] &&
	  !metaBram_0_serverAdapterB_outDataCore_FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (metaBram_1_serverAdapterA_s1[1] &&
	  !metaBram_1_serverAdapterA_outDataCore_FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (metaBram_1_serverAdapterB_s1[1] &&
	  !metaBram_1_serverAdapterB_outDataCore_FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (metaBram_2_serverAdapterA_s1[1] &&
	  !metaBram_2_serverAdapterA_outDataCore_FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (metaBram_2_serverAdapterB_s1[1] &&
	  !metaBram_2_serverAdapterB_outDataCore_FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (metaBram_3_serverAdapterA_s1[1] &&
	  !metaBram_3_serverAdapterA_outDataCore_FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (metaBram_3_serverAdapterB_s1[1] &&
	  !metaBram_3_serverAdapterB_outDataCore_FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (MUX_wci_wslv_respF_x_wire_wset_1__SEL_3)
	begin
	  v__h26261 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (MUX_wci_wslv_respF_x_wire_wset_1__SEL_3)
	$display("[%0d]: %m: WCI SPLIT READ Data:%0x", v__h26261, v__h25458);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && MUX_wci_wslv_respF_x_wire_wset_1__SEL_3)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_advance_split_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && MUX_controlReg_write_1__SEL_2)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and [RL_wci_cfrd] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && MUX_wci_wslv_respF_x_wire_wset_1__SEL_3)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_advance_split_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && MUX_controlReg_write_1__SEL_2)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (MUX_controlReg_write_1__SEL_2 &&
	  MUX_wci_wslv_respF_x_wire_wset_1__SEL_3)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 48: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_advance_split_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (MUX_controlReg_write_1__SEL_2 && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 48: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (MUX_controlReg_write_1__SEL_2 && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 48: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO &&
	  MUX_wci_wslv_respF_x_wire_wset_1__SEL_3)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 62: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_advance_split_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 62: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_OrE &&
	  MUX_wci_wslv_respF_x_wire_wset_1__SEL_3)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 76: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_OrE] and\n  [RL_advance_split_response] ) fired in the same clock cycle.\n");
  end
  // synopsys translate_on
endmodule