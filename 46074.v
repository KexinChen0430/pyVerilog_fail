module outputs
  wire [39 : 0] server_response_get;
  wire [31 : 0] wciS0_SData, wmiS0_SData, wmiS0_SFlag;
  wire [1 : 0] wciS0_SFlag, wciS0_SResp, wmiS0_SResp;
  wire RDY_server_request_put,
       RDY_server_response_get,
       wciS0_SThreadBusy,
       wmiS0_SDataThreadBusy,
       wmiS0_SReset_n,
       wmiS0_SRespLast,
       wmiS0_SThreadBusy,
       wtiS0_SReset_n,
       wtiS0_SThreadBusy;
  // inlined wires
  reg [39 : 0] edp_outBF_wDataIn$wget;
  wire [71 : 0] wci_wciReq$wget;
  wire [66 : 0] wti_wtiReq$wget;
  wire [63 : 0] edp_nowW$wget, wmi_nowW$wget;
  wire [39 : 0] edp_outBF_wDataOut$wget;
  wire [37 : 0] wmi_wmi_wmiDh$wget;
  wire [33 : 0] wci_respF_x_wire$wget, wmi_wmi_respF_x_wire$wget;
  wire [31 : 0] bram_serverAdapterA_1_outData_enqData$wget,
		bram_serverAdapterA_1_outData_outData$wget,
		bram_serverAdapterA_2_outData_enqData$wget,
		bram_serverAdapterA_2_outData_outData$wget,
		bram_serverAdapterA_3_outData_enqData$wget,
		bram_serverAdapterA_3_outData_outData$wget,
		bram_serverAdapterA_outData_enqData$wget,
		bram_serverAdapterA_outData_outData$wget,
		bram_serverAdapterB_1_outData_enqData$wget,
		bram_serverAdapterB_1_outData_outData$wget,
		bram_serverAdapterB_2_outData_enqData$wget,
		bram_serverAdapterB_2_outData_outData$wget,
		bram_serverAdapterB_3_outData_enqData$wget,
		bram_serverAdapterB_3_outData_outData$wget,
		bram_serverAdapterB_outData_enqData$wget,
		bram_serverAdapterB_outData_outData$wget,
		wci_Es_mAddr_w$wget,
		wci_Es_mData_w$wget,
		wmi_Es_mData_w$wget,
		wmi_wmi_wmiMFlag$wget,
		wmi_wmi_wmiReq$wget;
  wire [15 : 0] bml_crdBuf_modulus_bw$wget,
		bml_fabBuf_modulus_bw$wget,
		bml_lclBuf_modulus_bw$wget,
		bml_remBuf_modulus_bw$wget;
  wire [13 : 0] wmi_Es_mAddr_w$wget;
  wire [11 : 0] wmi_Es_mBurstLength_w$wget;
  wire [7 : 0] bml_dpControl$wget, edp_dpControl$wget, wmi_dpControl$wget;
  wire [3 : 0] wci_Es_mByteEn_w$wget, wmi_Es_mDataByteEn_w$wget;
  wire [2 : 0] bram_serverAdapterA_1_cnt_1$wget,
	       bram_serverAdapterA_1_cnt_2$wget,
	       bram_serverAdapterA_1_cnt_3$wget,
	       bram_serverAdapterA_2_cnt_1$wget,
	       bram_serverAdapterA_2_cnt_2$wget,
	       bram_serverAdapterA_2_cnt_3$wget,
	       bram_serverAdapterA_3_cnt_1$wget,
	       bram_serverAdapterA_3_cnt_2$wget,
	       bram_serverAdapterA_3_cnt_3$wget,
	       bram_serverAdapterA_cnt_1$wget,
	       bram_serverAdapterA_cnt_2$wget,
	       bram_serverAdapterA_cnt_3$wget,
	       bram_serverAdapterB_1_cnt_1$wget,
	       bram_serverAdapterB_1_cnt_2$wget,
	       bram_serverAdapterB_1_cnt_3$wget,
	       bram_serverAdapterB_2_cnt_1$wget,
	       bram_serverAdapterB_2_cnt_2$wget,
	       bram_serverAdapterB_2_cnt_3$wget,
	       bram_serverAdapterB_3_cnt_1$wget,
	       bram_serverAdapterB_3_cnt_2$wget,
	       bram_serverAdapterB_3_cnt_3$wget,
	       bram_serverAdapterB_cnt_1$wget,
	       bram_serverAdapterB_cnt_2$wget,
	       bram_serverAdapterB_cnt_3$wget,
	       wci_Es_mCmd_w$wget,
	       wci_wEdge$wget,
	       wmi_Es_mCmd_w$wget;
  wire [1 : 0] bram_serverAdapterA_1_s1_1$wget,
	       bram_serverAdapterA_1_writeWithResp$wget,
	       bram_serverAdapterA_2_s1_1$wget,
	       bram_serverAdapterA_2_writeWithResp$wget,
	       bram_serverAdapterA_3_s1_1$wget,
	       bram_serverAdapterA_3_writeWithResp$wget,
	       bram_serverAdapterA_s1_1$wget,
	       bram_serverAdapterA_writeWithResp$wget,
	       bram_serverAdapterB_1_s1_1$wget,
	       bram_serverAdapterB_1_writeWithResp$wget,
	       bram_serverAdapterB_2_s1_1$wget,
	       bram_serverAdapterB_2_writeWithResp$wget,
	       bram_serverAdapterB_3_s1_1$wget,
	       bram_serverAdapterB_3_writeWithResp$wget,
	       bram_serverAdapterB_s1_1$wget,
	       bram_serverAdapterB_writeWithResp$wget;
  wire bml_crdBuf_decAction$whas,
       bml_crdBuf_incAction$whas,
       bml_datumAReg_1$wget,
       bml_datumAReg_1$whas,
       bml_dpControl$whas,
       bml_fabAvail_1$wget,
       bml_fabAvail_1$whas,
       bml_fabBuf_decAction$whas,
       bml_fabBuf_incAction$whas,
       bml_fabDone_1$wget,
       bml_fabDone_1$whas,
       bml_lclBufDone_1$wget,
       bml_lclBufDone_1$whas,
       bml_lclBufStart_1$wget,
       bml_lclBufStart_1$whas,
       bml_lclBuf_decAction$whas,
       bml_lclBuf_incAction$whas,
       bml_remBuf_decAction$whas,
       bml_remBuf_incAction$whas,
       bml_remDone_1$wget,
       bml_remDone_1$whas,
       bml_remStart_1$wget,
       bml_remStart_1$whas,
       bram_serverAdapterA_1_cnt_1$whas,
       bram_serverAdapterA_1_cnt_2$whas,
       bram_serverAdapterA_1_cnt_3$whas,
       bram_serverAdapterA_1_outData_deqCalled$whas,
       bram_serverAdapterA_1_outData_enqData$whas,
       bram_serverAdapterA_1_outData_outData$whas,
       bram_serverAdapterA_1_s1_1$whas,
       bram_serverAdapterA_1_writeWithResp$whas,
       bram_serverAdapterA_2_cnt_1$whas,
       bram_serverAdapterA_2_cnt_2$whas,
       bram_serverAdapterA_2_cnt_3$whas,
       bram_serverAdapterA_2_outData_deqCalled$whas,
       bram_serverAdapterA_2_outData_enqData$whas,
       bram_serverAdapterA_2_outData_outData$whas,
       bram_serverAdapterA_2_s1_1$whas,
       bram_serverAdapterA_2_writeWithResp$whas,
       bram_serverAdapterA_3_cnt_1$whas,
       bram_serverAdapterA_3_cnt_2$whas,
       bram_serverAdapterA_3_cnt_3$whas,
       bram_serverAdapterA_3_outData_deqCalled$whas,
       bram_serverAdapterA_3_outData_enqData$whas,
       bram_serverAdapterA_3_outData_outData$whas,
       bram_serverAdapterA_3_s1_1$whas,
       bram_serverAdapterA_3_writeWithResp$whas,
       bram_serverAdapterA_cnt_1$whas,
       bram_serverAdapterA_cnt_2$whas,
       bram_serverAdapterA_cnt_3$whas,
       bram_serverAdapterA_outData_deqCalled$whas,
       bram_serverAdapterA_outData_enqData$whas,
       bram_serverAdapterA_outData_outData$whas,
       bram_serverAdapterA_s1_1$whas,
       bram_serverAdapterA_writeWithResp$whas,
       bram_serverAdapterB_1_cnt_1$whas,
       bram_serverAdapterB_1_cnt_2$whas,
       bram_serverAdapterB_1_cnt_3$whas,
       bram_serverAdapterB_1_outData_deqCalled$whas,
       bram_serverAdapterB_1_outData_enqData$whas,
       bram_serverAdapterB_1_outData_outData$whas,
       bram_serverAdapterB_1_s1_1$whas,
       bram_serverAdapterB_1_writeWithResp$whas,
       bram_serverAdapterB_2_cnt_1$whas,
       bram_serverAdapterB_2_cnt_2$whas,
       bram_serverAdapterB_2_cnt_3$whas,
       bram_serverAdapterB_2_outData_deqCalled$whas,
       bram_serverAdapterB_2_outData_enqData$whas,
       bram_serverAdapterB_2_outData_outData$whas,
       bram_serverAdapterB_2_s1_1$whas,
       bram_serverAdapterB_2_writeWithResp$whas,
       bram_serverAdapterB_3_cnt_1$whas,
       bram_serverAdapterB_3_cnt_2$whas,
       bram_serverAdapterB_3_cnt_3$whas,
       bram_serverAdapterB_3_outData_deqCalled$whas,
       bram_serverAdapterB_3_outData_enqData$whas,
       bram_serverAdapterB_3_outData_outData$whas,
       bram_serverAdapterB_3_s1_1$whas,
       bram_serverAdapterB_3_writeWithResp$whas,
       bram_serverAdapterB_cnt_1$whas,
       bram_serverAdapterB_cnt_2$whas,
       bram_serverAdapterB_cnt_3$whas,
       bram_serverAdapterB_outData_deqCalled$whas,
       bram_serverAdapterB_outData_enqData$whas,
       bram_serverAdapterB_outData_outData$whas,
       bram_serverAdapterB_s1_1$whas,
       bram_serverAdapterB_writeWithResp$whas,
       edp_creditReady_1$wget,
       edp_creditReady_1$whas,
       edp_dmaDoneMark_1$wget,
       edp_dmaDoneMark_1$whas,
       edp_dmaStartMark_1$wget,
       edp_dmaStartMark_1$whas,
       edp_doorBell_1$wget,
       edp_doorBell_1$whas,
       edp_dpControl$whas,
       edp_farBufReady_1$wget,
       edp_farBufReady_1$whas,
       edp_fhFsm_abort$wget,
       edp_fhFsm_abort$whas,
       edp_fhFsm_start_reg_1_1$wget,
       edp_fhFsm_start_reg_1_1$whas,
       edp_fhFsm_start_wire$wget,
       edp_fhFsm_start_wire$whas,
       edp_fhFsm_state_fired_1$wget,
       edp_fhFsm_state_fired_1$whas,
       edp_fhFsm_state_overlap_pw$whas,
       edp_fhFsm_state_set_pw$whas,
       edp_mhFsm_abort$wget,
       edp_mhFsm_abort$whas,
       edp_mhFsm_start_reg_1_1$wget,
       edp_mhFsm_start_reg_1_1$whas,
       edp_mhFsm_start_wire$wget,
       edp_mhFsm_start_wire$whas,
       edp_mhFsm_state_fired_1$wget,
       edp_mhFsm_state_fired_1$whas,
       edp_mhFsm_state_overlap_pw$whas,
       edp_mhFsm_state_set_pw$whas,
       edp_nearBufReady_1$wget,
       edp_nearBufReady_1$whas,
       edp_nowW$whas,
       edp_outBF_pwDequeue$whas,
       edp_outBF_pwEnqueue$whas,
       edp_outBF_wDataIn$whas,
       edp_outBF_wDataOut$whas,
       edp_pullTagMatch_1$wget,
       edp_pullTagMatch_1$whas,
       edp_remDone_1$wget,
       edp_remDone_1$whas,
       edp_remStart_1$wget,
       edp_remStart_1$whas,
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
       wmi_Es_mAddrSpace_w$wget,
       wmi_Es_mAddrSpace_w$whas,
       wmi_Es_mAddr_w$whas,
       wmi_Es_mBurstLength_w$whas,
       wmi_Es_mCmd_w$whas,
       wmi_Es_mDataByteEn_w$whas,
       wmi_Es_mDataInfo_w$whas,
       wmi_Es_mDataLast_w$whas,
       wmi_Es_mDataValid_w$whas,
       wmi_Es_mData_w$whas,
       wmi_Es_mReqInfo_w$wget,
       wmi_Es_mReqInfo_w$whas,
       wmi_Es_mReqLast_w$whas,
       wmi_dpControl$whas,
       wmi_mesgBufReady_1$wget,
       wmi_mesgBufReady_1$whas,
       wmi_mesgDone_1$wget,
       wmi_mesgDone_1$whas,
       wmi_mesgStart_1$wget,
       wmi_mesgStart_1$whas,
       wmi_nowW$whas,
       wmi_wmi_dhF_doResetClr$whas,
       wmi_wmi_dhF_doResetDeq$whas,
       wmi_wmi_dhF_doResetEnq$whas,
       wmi_wmi_dhF_r_clr$whas,
       wmi_wmi_dhF_r_deq$whas,
       wmi_wmi_dhF_r_enq$whas,
       wmi_wmi_forceSThreadBusy_pw$whas,
       wmi_wmi_mFlagF_doResetClr$whas,
       wmi_wmi_mFlagF_doResetDeq$whas,
       wmi_wmi_mFlagF_doResetEnq$whas,
       wmi_wmi_mFlagF_r_clr$whas,
       wmi_wmi_mFlagF_r_deq$whas,
       wmi_wmi_mFlagF_r_enq$whas,
       wmi_wmi_operateD_1$wget,
       wmi_wmi_operateD_1$whas,
       wmi_wmi_peerIsReady_1$wget,
       wmi_wmi_peerIsReady_1$whas,
       wmi_wmi_reqF_doResetClr$whas,
       wmi_wmi_reqF_doResetDeq$whas,
       wmi_wmi_reqF_doResetEnq$whas,
       wmi_wmi_reqF_r_clr$whas,
       wmi_wmi_reqF_r_deq$whas,
       wmi_wmi_reqF_r_enq$whas,
       wmi_wmi_respF_dequeueing$whas,
       wmi_wmi_respF_enqueueing$whas,
       wmi_wmi_respF_x_wire$whas,
       wmi_wmi_sDataThreadBusy_dw$wget,
       wmi_wmi_sDataThreadBusy_dw$whas,
       wmi_wmi_sThreadBusy_dw$wget,
       wmi_wmi_sThreadBusy_dw$whas,
       wmi_wmi_wmiDh$whas,
       wmi_wmi_wmiMFlag$whas,
       wmi_wmi_wmiReq$whas,
       wti_operateD_1$wget,
       wti_operateD_1$whas,
       wti_wtiReq$whas;
  // register bml_crdBuf_modulus
  reg [15 : 0] bml_crdBuf_modulus;
  wire [15 : 0] bml_crdBuf_modulus$D_IN;
  wire bml_crdBuf_modulus$EN;
  // register bml_crdBuf_value
  reg [15 : 0] bml_crdBuf_value;
  wire [15 : 0] bml_crdBuf_value$D_IN;
  wire bml_crdBuf_value$EN;
  // register bml_datumAReg
  reg bml_datumAReg;
  wire bml_datumAReg$D_IN, bml_datumAReg$EN;
  // register bml_fabAvail
  reg bml_fabAvail;
  wire bml_fabAvail$D_IN, bml_fabAvail$EN;
  // register bml_fabBuf_modulus
  reg [15 : 0] bml_fabBuf_modulus;
  wire [15 : 0] bml_fabBuf_modulus$D_IN;
  wire bml_fabBuf_modulus$EN;
  // register bml_fabBuf_value
  reg [15 : 0] bml_fabBuf_value;
  wire [15 : 0] bml_fabBuf_value$D_IN;
  wire bml_fabBuf_value$EN;
  // register bml_fabBufsAvail
  reg [15 : 0] bml_fabBufsAvail;
  wire [15 : 0] bml_fabBufsAvail$D_IN;
  wire bml_fabBufsAvail$EN;
  // register bml_fabDone
  reg bml_fabDone;
  wire bml_fabDone$D_IN, bml_fabDone$EN;
  // register bml_fabFlowAddr
  reg [31 : 0] bml_fabFlowAddr;
  reg [31 : 0] bml_fabFlowAddr$D_IN;
  wire bml_fabFlowAddr$EN;
  // register bml_fabFlowBase
  reg [31 : 0] bml_fabFlowBase;
  wire [31 : 0] bml_fabFlowBase$D_IN;
  wire bml_fabFlowBase$EN;
  // register bml_fabFlowBaseMS
  reg [31 : 0] bml_fabFlowBaseMS;
  wire [31 : 0] bml_fabFlowBaseMS$D_IN;
  wire bml_fabFlowBaseMS$EN;
  // register bml_fabFlowSize
  reg [31 : 0] bml_fabFlowSize;
  wire [31 : 0] bml_fabFlowSize$D_IN;
  wire bml_fabFlowSize$EN;
  // register bml_fabMesgAddr
  reg [31 : 0] bml_fabMesgAddr;
  wire [31 : 0] bml_fabMesgAddr$D_IN;
  wire bml_fabMesgAddr$EN;
  // register bml_fabMesgBase
  reg [31 : 0] bml_fabMesgBase;
  wire [31 : 0] bml_fabMesgBase$D_IN;
  wire bml_fabMesgBase$EN;
  // register bml_fabMesgBaseMS
  reg [31 : 0] bml_fabMesgBaseMS;
  wire [31 : 0] bml_fabMesgBaseMS$D_IN;
  wire bml_fabMesgBaseMS$EN;
  // register bml_fabMesgSize
  reg [31 : 0] bml_fabMesgSize;
  wire [31 : 0] bml_fabMesgSize$D_IN;
  wire bml_fabMesgSize$EN;
  // register bml_fabMetaAddr
  reg [31 : 0] bml_fabMetaAddr;
  wire [31 : 0] bml_fabMetaAddr$D_IN;
  wire bml_fabMetaAddr$EN;
  // register bml_fabMetaBase
  reg [31 : 0] bml_fabMetaBase;
  wire [31 : 0] bml_fabMetaBase$D_IN;
  wire bml_fabMetaBase$EN;
  // register bml_fabMetaBaseMS
  reg [31 : 0] bml_fabMetaBaseMS;
  wire [31 : 0] bml_fabMetaBaseMS$D_IN;
  wire bml_fabMetaBaseMS$EN;
  // register bml_fabMetaSize
  reg [31 : 0] bml_fabMetaSize;
  wire [31 : 0] bml_fabMetaSize$D_IN;
  wire bml_fabMetaSize$EN;
  // register bml_fabNumBufs
  reg [15 : 0] bml_fabNumBufs;
  wire [15 : 0] bml_fabNumBufs$D_IN;
  wire bml_fabNumBufs$EN;
  // register bml_lclBufDone
  reg bml_lclBufDone;
  wire bml_lclBufDone$D_IN, bml_lclBufDone$EN;
  // register bml_lclBufStart
  reg bml_lclBufStart;
  wire bml_lclBufStart$D_IN, bml_lclBufStart$EN;
  // register bml_lclBuf_modulus
  reg [15 : 0] bml_lclBuf_modulus;
  wire [15 : 0] bml_lclBuf_modulus$D_IN;
  wire bml_lclBuf_modulus$EN;
  // register bml_lclBuf_value
  reg [15 : 0] bml_lclBuf_value;
  wire [15 : 0] bml_lclBuf_value$D_IN;
  wire bml_lclBuf_value$EN;
  // register bml_lclBufsAR
  reg [15 : 0] bml_lclBufsAR;
  wire [15 : 0] bml_lclBufsAR$D_IN;
  wire bml_lclBufsAR$EN;
  // register bml_lclBufsCF
  reg [15 : 0] bml_lclBufsCF;
  wire [15 : 0] bml_lclBufsCF$D_IN;
  wire bml_lclBufsCF$EN;
  // register bml_lclCredit
  reg [15 : 0] bml_lclCredit;
  wire [15 : 0] bml_lclCredit$D_IN;
  wire bml_lclCredit$EN;
  // register bml_lclDones
  reg [15 : 0] bml_lclDones;
  wire [15 : 0] bml_lclDones$D_IN;
  wire bml_lclDones$EN;
  // register bml_lclMesgAddr
  reg [15 : 0] bml_lclMesgAddr;
  wire [15 : 0] bml_lclMesgAddr$D_IN;
  wire bml_lclMesgAddr$EN;
  // register bml_lclMetaAddr
  reg [15 : 0] bml_lclMetaAddr;
  wire [15 : 0] bml_lclMetaAddr$D_IN;
  wire bml_lclMetaAddr$EN;
  // register bml_lclNumBufs
  reg [15 : 0] bml_lclNumBufs;
  wire [15 : 0] bml_lclNumBufs$D_IN;
  wire bml_lclNumBufs$EN;
  // register bml_lclStarts
  reg [15 : 0] bml_lclStarts;
  wire [15 : 0] bml_lclStarts$D_IN;
  wire bml_lclStarts$EN;
  // register bml_mesgBase
  reg [15 : 0] bml_mesgBase;
  wire [15 : 0] bml_mesgBase$D_IN;
  wire bml_mesgBase$EN;
  // register bml_mesgSize
  reg [15 : 0] bml_mesgSize;
  wire [15 : 0] bml_mesgSize$D_IN;
  wire bml_mesgSize$EN;
  // register bml_metaBase
  reg [15 : 0] bml_metaBase;
  wire [15 : 0] bml_metaBase$D_IN;
  wire bml_metaBase$EN;
  // register bml_metaSize
  reg [15 : 0] bml_metaSize;
  wire [15 : 0] bml_metaSize$D_IN;
  wire bml_metaSize$EN;
  // register bml_remBuf_modulus
  reg [15 : 0] bml_remBuf_modulus;
  wire [15 : 0] bml_remBuf_modulus$D_IN;
  wire bml_remBuf_modulus$EN;
  // register bml_remBuf_value
  reg [15 : 0] bml_remBuf_value;
  wire [15 : 0] bml_remBuf_value$D_IN;
  wire bml_remBuf_value$EN;
  // register bml_remDone
  reg bml_remDone;
  wire bml_remDone$D_IN, bml_remDone$EN;
  // register bml_remDones
  reg [15 : 0] bml_remDones;
  wire [15 : 0] bml_remDones$D_IN;
  wire bml_remDones$EN;
  // register bml_remMesgAddr
  reg [15 : 0] bml_remMesgAddr;
  wire [15 : 0] bml_remMesgAddr$D_IN;
  wire bml_remMesgAddr$EN;
  // register bml_remMetaAddr
  reg [15 : 0] bml_remMetaAddr;
  wire [15 : 0] bml_remMetaAddr$D_IN;
  wire bml_remMetaAddr$EN;
  // register bml_remStart
  reg bml_remStart;
  wire bml_remStart$D_IN, bml_remStart$EN;
  // register bml_remStarts
  reg [15 : 0] bml_remStarts;
  wire [15 : 0] bml_remStarts$D_IN;
  wire bml_remStarts$EN;
  // register bram_serverAdapterA_1_cnt
  reg [2 : 0] bram_serverAdapterA_1_cnt;
  wire [2 : 0] bram_serverAdapterA_1_cnt$D_IN;
  wire bram_serverAdapterA_1_cnt$EN;
  // register bram_serverAdapterA_1_s1
  reg [1 : 0] bram_serverAdapterA_1_s1;
  wire [1 : 0] bram_serverAdapterA_1_s1$D_IN;
  wire bram_serverAdapterA_1_s1$EN;
  // register bram_serverAdapterA_2_cnt
  reg [2 : 0] bram_serverAdapterA_2_cnt;
  wire [2 : 0] bram_serverAdapterA_2_cnt$D_IN;
  wire bram_serverAdapterA_2_cnt$EN;
  // register bram_serverAdapterA_2_s1
  reg [1 : 0] bram_serverAdapterA_2_s1;
  wire [1 : 0] bram_serverAdapterA_2_s1$D_IN;
  wire bram_serverAdapterA_2_s1$EN;
  // register bram_serverAdapterA_3_cnt
  reg [2 : 0] bram_serverAdapterA_3_cnt;
  wire [2 : 0] bram_serverAdapterA_3_cnt$D_IN;
  wire bram_serverAdapterA_3_cnt$EN;
  // register bram_serverAdapterA_3_s1
  reg [1 : 0] bram_serverAdapterA_3_s1;
  wire [1 : 0] bram_serverAdapterA_3_s1$D_IN;
  wire bram_serverAdapterA_3_s1$EN;
  // register bram_serverAdapterA_cnt
  reg [2 : 0] bram_serverAdapterA_cnt;
  wire [2 : 0] bram_serverAdapterA_cnt$D_IN;
  wire bram_serverAdapterA_cnt$EN;
  // register bram_serverAdapterA_s1
  reg [1 : 0] bram_serverAdapterA_s1;
  wire [1 : 0] bram_serverAdapterA_s1$D_IN;
  wire bram_serverAdapterA_s1$EN;
  // register bram_serverAdapterB_1_cnt
  reg [2 : 0] bram_serverAdapterB_1_cnt;
  wire [2 : 0] bram_serverAdapterB_1_cnt$D_IN;
  wire bram_serverAdapterB_1_cnt$EN;
  // register bram_serverAdapterB_1_s1
  reg [1 : 0] bram_serverAdapterB_1_s1;
  wire [1 : 0] bram_serverAdapterB_1_s1$D_IN;
  wire bram_serverAdapterB_1_s1$EN;
  // register bram_serverAdapterB_2_cnt
  reg [2 : 0] bram_serverAdapterB_2_cnt;
  wire [2 : 0] bram_serverAdapterB_2_cnt$D_IN;
  wire bram_serverAdapterB_2_cnt$EN;
  // register bram_serverAdapterB_2_s1
  reg [1 : 0] bram_serverAdapterB_2_s1;
  wire [1 : 0] bram_serverAdapterB_2_s1$D_IN;
  wire bram_serverAdapterB_2_s1$EN;
  // register bram_serverAdapterB_3_cnt
  reg [2 : 0] bram_serverAdapterB_3_cnt;
  wire [2 : 0] bram_serverAdapterB_3_cnt$D_IN;
  wire bram_serverAdapterB_3_cnt$EN;
  // register bram_serverAdapterB_3_s1
  reg [1 : 0] bram_serverAdapterB_3_s1;
  wire [1 : 0] bram_serverAdapterB_3_s1$D_IN;
  wire bram_serverAdapterB_3_s1$EN;
  // register bram_serverAdapterB_cnt
  reg [2 : 0] bram_serverAdapterB_cnt;
  wire [2 : 0] bram_serverAdapterB_cnt$D_IN;
  wire bram_serverAdapterB_cnt$EN;
  // register bram_serverAdapterB_s1
  reg [1 : 0] bram_serverAdapterB_s1;
  wire [1 : 0] bram_serverAdapterB_s1$D_IN;
  wire bram_serverAdapterB_s1$EN;
  // register dmaDoneTime
  reg [63 : 0] dmaDoneTime;
  wire [63 : 0] dmaDoneTime$D_IN;
  wire dmaDoneTime$EN;
  // register dmaStartTime
  reg [63 : 0] dmaStartTime;
  wire [63 : 0] dmaStartTime$D_IN;
  wire dmaStartTime$EN;
  // register dpControl
  reg [7 : 0] dpControl;
  wire [7 : 0] dpControl$D_IN;
  wire dpControl$EN;
  // register edpDebug
  reg [31 : 0] edpDebug;
  wire [31 : 0] edpDebug$D_IN;
  wire edpDebug$EN;
  // register edp_ackCount
  reg [7 : 0] edp_ackCount;
  wire [7 : 0] edp_ackCount$D_IN;
  wire edp_ackCount$EN;
  // register edp_ackStart
  reg [15 : 0] edp_ackStart;
  wire [15 : 0] edp_ackStart$D_IN;
  wire edp_ackStart$EN;
  // register edp_complTimerCount
  reg [11 : 0] edp_complTimerCount;
  wire [11 : 0] edp_complTimerCount$D_IN;
  wire edp_complTimerCount$EN;
  // register edp_complTimerRunning
  reg edp_complTimerRunning;
  wire edp_complTimerRunning$D_IN, edp_complTimerRunning$EN;
  // register edp_creditReady
  reg edp_creditReady;
  wire edp_creditReady$D_IN, edp_creditReady$EN;
  // register edp_dataAddr
  reg [31 : 0] edp_dataAddr;
  wire [31 : 0] edp_dataAddr$D_IN;
  wire edp_dataAddr$EN;
  // register edp_dataLen
  reg [15 : 0] edp_dataLen;
  wire [15 : 0] edp_dataLen$D_IN;
  wire edp_dataLen$EN;
  // register edp_dbgBytesTxDeq
  reg [31 : 0] edp_dbgBytesTxDeq;
  wire [31 : 0] edp_dbgBytesTxDeq$D_IN;
  wire edp_dbgBytesTxDeq$EN;
  // register edp_dbgBytesTxEnq
  reg [31 : 0] edp_dbgBytesTxEnq;
  wire [31 : 0] edp_dbgBytesTxEnq$D_IN;
  wire edp_dbgBytesTxEnq$EN;
  // register edp_dmaDoTailEvent
  reg edp_dmaDoTailEvent;
  wire edp_dmaDoTailEvent$D_IN, edp_dmaDoTailEvent$EN;
  // register edp_dmaDoneMark
  reg edp_dmaDoneMark;
  wire edp_dmaDoneMark$D_IN, edp_dmaDoneMark$EN;
  // register edp_dmaPullRemainDWLen
  reg [9 : 0] edp_dmaPullRemainDWLen;
  wire [9 : 0] edp_dmaPullRemainDWLen$D_IN;
  wire edp_dmaPullRemainDWLen$EN;
  // register edp_dmaPullRemainDWSub
  reg [9 : 0] edp_dmaPullRemainDWSub;
  wire [9 : 0] edp_dmaPullRemainDWSub$D_IN;
  wire edp_dmaPullRemainDWSub$EN;
  // register edp_dmaReqTag
  reg [4 : 0] edp_dmaReqTag;
  wire [4 : 0] edp_dmaReqTag$D_IN;
  wire edp_dmaReqTag$EN;
  // register edp_dmaStartMark
  reg edp_dmaStartMark;
  wire edp_dmaStartMark$D_IN, edp_dmaStartMark$EN;
  // register edp_dmaTag
  reg [4 : 0] edp_dmaTag;
  wire [4 : 0] edp_dmaTag$D_IN;
  wire edp_dmaTag$EN;
  // register edp_doMesgMH
  reg edp_doMesgMH;
  wire edp_doMesgMH$D_IN, edp_doMesgMH$EN;
  // register edp_doMetaMH
  reg edp_doMetaMH;
  wire edp_doMetaMH$D_IN, edp_doMetaMH$EN;
  // register edp_doXmtMetaBody
  reg edp_doXmtMetaBody;
  wire edp_doXmtMetaBody$D_IN, edp_doXmtMetaBody$EN;
  // register edp_doorBell
  reg edp_doorBell;
  wire edp_doorBell$D_IN, edp_doorBell$EN;
  // register edp_doorSeqDwell
  reg [3 : 0] edp_doorSeqDwell;
  wire [3 : 0] edp_doorSeqDwell$D_IN;
  wire edp_doorSeqDwell$EN;
  // register edp_fabFlowAddr
  reg [31 : 0] edp_fabFlowAddr;
  wire [31 : 0] edp_fabFlowAddr$D_IN;
  wire edp_fabFlowAddr$EN;
  // register edp_fabFlowAddrMS
  reg [31 : 0] edp_fabFlowAddrMS;
  wire [31 : 0] edp_fabFlowAddrMS$D_IN;
  wire edp_fabFlowAddrMS$EN;
  // register edp_fabMesgAccu
  reg [31 : 0] edp_fabMesgAccu;
  wire [31 : 0] edp_fabMesgAccu$D_IN;
  wire edp_fabMesgAccu$EN;
  // register edp_fabMesgAddr
  reg [31 : 0] edp_fabMesgAddr;
  wire [31 : 0] edp_fabMesgAddr$D_IN;
  wire edp_fabMesgAddr$EN;
  // register edp_fabMesgAddrMS
  reg [31 : 0] edp_fabMesgAddrMS;
  wire [31 : 0] edp_fabMesgAddrMS$D_IN;
  wire edp_fabMesgAddrMS$EN;
  // register edp_fabMeta
  reg [128 : 0] edp_fabMeta;
  wire [128 : 0] edp_fabMeta$D_IN;
  wire edp_fabMeta$EN;
  // register edp_fabMetaAddr
  reg [31 : 0] edp_fabMetaAddr;
  wire [31 : 0] edp_fabMetaAddr$D_IN;
  wire edp_fabMetaAddr$EN;
  // register edp_fabMetaAddrMS
  reg [31 : 0] edp_fabMetaAddrMS;
  wire [31 : 0] edp_fabMetaAddrMS$D_IN;
  wire edp_fabMetaAddrMS$EN;
  // register edp_farBufReady
  reg edp_farBufReady;
  wire edp_farBufReady$D_IN, edp_farBufReady$EN;
  // register edp_fhFsm_start_reg
  reg edp_fhFsm_start_reg;
  wire edp_fhFsm_start_reg$D_IN, edp_fhFsm_start_reg$EN;
  // register edp_fhFsm_start_reg_1
  reg edp_fhFsm_start_reg_1;
  wire edp_fhFsm_start_reg_1$D_IN, edp_fhFsm_start_reg_1$EN;
  // register edp_fhFsm_state_can_overlap
  reg edp_fhFsm_state_can_overlap;
  wire edp_fhFsm_state_can_overlap$D_IN, edp_fhFsm_state_can_overlap$EN;
  // register edp_fhFsm_state_fired
  reg edp_fhFsm_state_fired;
  wire edp_fhFsm_state_fired$D_IN, edp_fhFsm_state_fired$EN;
  // register edp_fhFsm_state_mkFSMstate
  reg [2 : 0] edp_fhFsm_state_mkFSMstate;
  reg [2 : 0] edp_fhFsm_state_mkFSMstate$D_IN;
  wire edp_fhFsm_state_mkFSMstate$EN;
  // register edp_firstMesgMH
  reg edp_firstMesgMH;
  wire edp_firstMesgMH$D_IN, edp_firstMesgMH$EN;
  // register edp_firstMetaMH
  reg edp_firstMetaMH;
  wire edp_firstMetaMH$D_IN, edp_firstMetaMH$EN;
  // register edp_flowDiagCount
  reg [31 : 0] edp_flowDiagCount;
  wire [31 : 0] edp_flowDiagCount$D_IN;
  wire edp_flowDiagCount$EN;
  // register edp_frameNumber
  reg [15 : 0] edp_frameNumber;
  wire [15 : 0] edp_frameNumber$D_IN;
  wire edp_frameNumber$EN;
  // register edp_frmAckOK
  reg edp_frmAckOK;
  wire edp_frmAckOK$D_IN, edp_frmAckOK$EN;
  // register edp_frmFlags
  reg [7 : 0] edp_frmFlags;
  wire [7 : 0] edp_frmFlags$D_IN;
  wire edp_frmFlags$EN;
  // register edp_frmMesgBusy
  reg edp_frmMesgBusy;
  wire edp_frmMesgBusy$D_IN, edp_frmMesgBusy$EN;
  // register edp_gotResponseHeader
  reg edp_gotResponseHeader;
  wire edp_gotResponseHeader$D_IN, edp_gotResponseHeader$EN;
  // register edp_igAC
  reg [7 : 0] edp_igAC;
  wire [7 : 0] edp_igAC$D_IN;
  wire edp_igAC$EN;
  // register edp_igAS
  reg [15 : 0] edp_igAS;
  wire [15 : 0] edp_igAS$D_IN;
  wire edp_igAS$EN;
  // register edp_igDID
  reg [15 : 0] edp_igDID;
  wire [15 : 0] edp_igDID$D_IN;
  wire edp_igDID$EN;
  // register edp_igF
  reg [7 : 0] edp_igF;
  wire [7 : 0] edp_igF$D_IN;
  wire edp_igF$EN;
  // register edp_igFS
  reg [15 : 0] edp_igFS;
  wire [15 : 0] edp_igFS$D_IN;
  wire edp_igFS$EN;
  // register edp_igPtr
  reg [3 : 0] edp_igPtr;
  wire [3 : 0] edp_igPtr$D_IN;
  wire edp_igPtr$EN;
  // register edp_igSID
  reg [15 : 0] edp_igSID;
  wire [15 : 0] edp_igSID$D_IN;
  wire edp_igSID$EN;
  // register edp_inIgnorePkt
  reg edp_inIgnorePkt;
  wire edp_inIgnorePkt$D_IN, edp_inIgnorePkt$EN;
  // register edp_lastMetaV
  reg [31 : 0] edp_lastMetaV;
  wire [31 : 0] edp_lastMetaV$D_IN;
  wire edp_lastMetaV$EN;
  // register edp_lastMetaV_1
  reg [31 : 0] edp_lastMetaV_1;
  wire [31 : 0] edp_lastMetaV_1$D_IN;
  wire edp_lastMetaV_1$EN;
  // register edp_lastMetaV_2
  reg [31 : 0] edp_lastMetaV_2;
  wire [31 : 0] edp_lastMetaV_2$D_IN;
  wire edp_lastMetaV_2$EN;
  // register edp_lastMetaV_3
  reg [31 : 0] edp_lastMetaV_3;
  wire [31 : 0] edp_lastMetaV_3$D_IN;
  wire edp_lastMetaV_3$EN;
  // register edp_lastRuleFired
  reg [3 : 0] edp_lastRuleFired;
  wire [3 : 0] edp_lastRuleFired$D_IN;
  wire edp_lastRuleFired$EN;
  // register edp_maxPayloadSize
  reg [12 : 0] edp_maxPayloadSize;
  wire [12 : 0] edp_maxPayloadSize$D_IN;
  wire edp_maxPayloadSize$EN;
  // register edp_maxReadReqSize
  reg [12 : 0] edp_maxReadReqSize;
  wire [12 : 0] edp_maxReadReqSize$D_IN;
  wire edp_maxReadReqSize$EN;
  // register edp_mesgComplReceived
  reg [16 : 0] edp_mesgComplReceived;
  wire [16 : 0] edp_mesgComplReceived$D_IN;
  wire edp_mesgComplReceived$EN;
  // register edp_mesgLengthRemainPull
  reg [16 : 0] edp_mesgLengthRemainPull;
  wire [16 : 0] edp_mesgLengthRemainPull$D_IN;
  wire edp_mesgLengthRemainPull$EN;
  // register edp_mesgLengthRemainPush
  reg [16 : 0] edp_mesgLengthRemainPush;
  reg [16 : 0] edp_mesgLengthRemainPush$D_IN;
  wire edp_mesgLengthRemainPush$EN;
  // register edp_mesgSeq
  reg [15 : 0] edp_mesgSeq;
  wire [15 : 0] edp_mesgSeq$D_IN;
  wire edp_mesgSeq$EN;
  // register edp_mhFlags
  reg [7 : 0] edp_mhFlags;
  wire [7 : 0] edp_mhFlags$D_IN;
  wire edp_mhFlags$EN;
  // register edp_mhFsm_start_reg
  reg edp_mhFsm_start_reg;
  wire edp_mhFsm_start_reg$D_IN, edp_mhFsm_start_reg$EN;
  // register edp_mhFsm_start_reg_1
  reg edp_mhFsm_start_reg_1;
  wire edp_mhFsm_start_reg_1$D_IN, edp_mhFsm_start_reg_1$EN;
  // register edp_mhFsm_state_can_overlap
  reg edp_mhFsm_state_can_overlap;
  wire edp_mhFsm_state_can_overlap$D_IN, edp_mhFsm_state_can_overlap$EN;
  // register edp_mhFsm_state_fired
  reg edp_mhFsm_state_fired;
  wire edp_mhFsm_state_fired$D_IN, edp_mhFsm_state_fired$EN;
  // register edp_mhFsm_state_mkFSMstate
  reg [3 : 0] edp_mhFsm_state_mkFSMstate;
  reg [3 : 0] edp_mhFsm_state_mkFSMstate$D_IN;
  wire edp_mhFsm_state_mkFSMstate$EN;
  // register edp_mhType
  reg [7 : 0] edp_mhType;
  wire [7 : 0] edp_mhType$D_IN;
  wire edp_mhType$EN;
  // register edp_nearBufReady
  reg edp_nearBufReady;
  wire edp_nearBufReady$D_IN, edp_nearBufReady$EN;
  // register edp_outBF_rCache
  reg [52 : 0] edp_outBF_rCache;
  wire [52 : 0] edp_outBF_rCache$D_IN;
  wire edp_outBF_rCache$EN;
  // register edp_outBF_rRdPtr
  reg [11 : 0] edp_outBF_rRdPtr;
  wire [11 : 0] edp_outBF_rRdPtr$D_IN;
  wire edp_outBF_rRdPtr$EN;
  // register edp_outBF_rWrPtr
  reg [11 : 0] edp_outBF_rWrPtr;
  wire [11 : 0] edp_outBF_rWrPtr$D_IN;
  wire edp_outBF_rWrPtr$EN;
  // register edp_outDwRemain
  reg [9 : 0] edp_outDwRemain;
  wire [9 : 0] edp_outDwRemain$D_IN;
  wire edp_outDwRemain$EN;
  // register edp_outFunl_ptr
  reg [1 : 0] edp_outFunl_ptr;
  wire [1 : 0] edp_outFunl_ptr$D_IN;
  wire edp_outFunl_ptr$EN;
  // register edp_postSeqDwell
  reg [3 : 0] edp_postSeqDwell;
  wire [3 : 0] edp_postSeqDwell$D_IN;
  wire edp_postSeqDwell$EN;
  // register edp_pullTagMatch
  reg edp_pullTagMatch;
  wire edp_pullTagMatch$D_IN, edp_pullTagMatch$EN;
  // register edp_rcvDA
  reg [31 : 0] edp_rcvDA;
  wire [31 : 0] edp_rcvDA$D_IN;
  wire edp_rcvDA$EN;
  // register edp_rcvDL
  reg [15 : 0] edp_rcvDL;
  wire [15 : 0] edp_rcvDL$D_IN;
  wire edp_rcvDL$EN;
  // register edp_rcvDoCompletion
  reg edp_rcvDoCompletion;
  wire edp_rcvDoCompletion$D_IN, edp_rcvDoCompletion$EN;
  // register edp_rcvFA
  reg [31 : 0] edp_rcvFA;
  wire [31 : 0] edp_rcvFA$D_IN;
  wire edp_rcvFA$EN;
  // register edp_rcvFV
  reg [31 : 0] edp_rcvFV;
  wire [31 : 0] edp_rcvFV$D_IN;
  wire edp_rcvFV$EN;
  // register edp_rcvLiveDA
  reg [31 : 0] edp_rcvLiveDA;
  wire [31 : 0] edp_rcvLiveDA$D_IN;
  wire edp_rcvLiveDA$EN;
  // register edp_rcvLiveDL
  reg [15 : 0] edp_rcvLiveDL;
  wire [15 : 0] edp_rcvLiveDL$D_IN;
  wire edp_rcvLiveDL$EN;
  // register edp_rcvMS
  reg [15 : 0] edp_rcvMS;
  wire [15 : 0] edp_rcvMS$D_IN;
  wire edp_rcvMS$EN;
  // register edp_rcvMT
  reg [7 : 0] edp_rcvMT;
  wire [7 : 0] edp_rcvMT$D_IN;
  wire edp_rcvMT$EN;
  // register edp_rcvNM
  reg [15 : 0] edp_rcvNM;
  wire [15 : 0] edp_rcvNM$D_IN;
  wire edp_rcvNM$EN;
  // register edp_rcvPtr
  reg [3 : 0] edp_rcvPtr;
  wire [3 : 0] edp_rcvPtr$D_IN;
  wire edp_rcvPtr$EN;
  // register edp_rcvTID
  reg [31 : 0] edp_rcvTID;
  wire [31 : 0] edp_rcvTID$D_IN;
  wire edp_rcvTID$EN;
  // register edp_rcvTM
  reg [7 : 0] edp_rcvTM;
  wire [7 : 0] edp_rcvTM$D_IN;
  wire edp_rcvTM$EN;
  // register edp_remDone
  reg edp_remDone;
  wire edp_remDone$D_IN, edp_remDone$EN;
  // register edp_remMesgAccu
  reg [15 : 0] edp_remMesgAccu;
  wire [15 : 0] edp_remMesgAccu$D_IN;
  wire edp_remMesgAccu$EN;
  // register edp_remMesgAddr
  reg [15 : 0] edp_remMesgAddr;
  wire [15 : 0] edp_remMesgAddr$D_IN;
  wire edp_remMesgAddr$EN;
  // register edp_remMetaAddr
  reg [15 : 0] edp_remMetaAddr;
  wire [15 : 0] edp_remMetaAddr$D_IN;
  wire edp_remMetaAddr$EN;
  // register edp_remStart
  reg edp_remStart;
  wire edp_remStart$D_IN, edp_remStart$EN;
  // register edp_reqMesgInFlight
  reg edp_reqMesgInFlight;
  wire edp_reqMesgInFlight$D_IN, edp_reqMesgInFlight$EN;
  // register edp_reqMetaBodyInFlight
  reg edp_reqMetaBodyInFlight;
  wire edp_reqMetaBodyInFlight$D_IN, edp_reqMetaBodyInFlight$EN;
  // register edp_reqMetaInFlight
  reg edp_reqMetaInFlight;
  wire edp_reqMetaInFlight$D_IN, edp_reqMetaInFlight$EN;
  // register edp_sentTail4DWHeader
  reg edp_sentTail4DWHeader;
  wire edp_sentTail4DWHeader$D_IN, edp_sentTail4DWHeader$EN;
  // register edp_srcMesgAccu
  reg [31 : 0] edp_srcMesgAccu;
  wire [31 : 0] edp_srcMesgAccu$D_IN;
  wire edp_srcMesgAccu$EN;
  // register edp_tlpBRAM_debugBdata
  reg [127 : 0] edp_tlpBRAM_debugBdata;
  wire [127 : 0] edp_tlpBRAM_debugBdata$D_IN;
  wire edp_tlpBRAM_debugBdata$EN;
  // register edp_tlpBRAM_rdRespDwRemain
  reg [9 : 0] edp_tlpBRAM_rdRespDwRemain;
  wire [9 : 0] edp_tlpBRAM_rdRespDwRemain$D_IN;
  wire edp_tlpBRAM_rdRespDwRemain$EN;
  // register edp_tlpBRAM_readHeaderSent
  reg edp_tlpBRAM_readHeaderSent;
  wire edp_tlpBRAM_readHeaderSent$D_IN, edp_tlpBRAM_readHeaderSent$EN;
  // register edp_tlpBRAM_readNxtDWAddr
  reg [12 : 0] edp_tlpBRAM_readNxtDWAddr;
  wire [12 : 0] edp_tlpBRAM_readNxtDWAddr$D_IN;
  wire edp_tlpBRAM_readNxtDWAddr$EN;
  // register edp_tlpBRAM_readRemainDWLen
  reg [9 : 0] edp_tlpBRAM_readRemainDWLen;
  wire [9 : 0] edp_tlpBRAM_readRemainDWLen$D_IN;
  wire edp_tlpBRAM_readRemainDWLen$EN;
  // register edp_tlpBRAM_readStarted
  reg edp_tlpBRAM_readStarted;
  wire edp_tlpBRAM_readStarted$D_IN, edp_tlpBRAM_readStarted$EN;
  // register edp_tlpBRAM_writeDWAddr
  reg [12 : 0] edp_tlpBRAM_writeDWAddr;
  wire [12 : 0] edp_tlpBRAM_writeDWAddr$D_IN;
  wire edp_tlpBRAM_writeDWAddr$EN;
  // register edp_tlpBRAM_writeLastBE
  reg [3 : 0] edp_tlpBRAM_writeLastBE;
  wire [3 : 0] edp_tlpBRAM_writeLastBE$D_IN;
  wire edp_tlpBRAM_writeLastBE$EN;
  // register edp_tlpBRAM_writeRemainDWLen
  reg [9 : 0] edp_tlpBRAM_writeRemainDWLen;
  wire [9 : 0] edp_tlpBRAM_writeRemainDWLen$D_IN;
  wire edp_tlpBRAM_writeRemainDWLen$EN;
  // register edp_tlpMetaSent
  reg edp_tlpMetaSent;
  wire edp_tlpMetaSent$D_IN, edp_tlpMetaSent$EN;
  // register edp_tlpRcvBusy
  reg edp_tlpRcvBusy;
  wire edp_tlpRcvBusy$D_IN, edp_tlpRcvBusy$EN;
  // register edp_tlpXmtBusy
  reg edp_tlpXmtBusy;
  reg edp_tlpXmtBusy$D_IN;
  wire edp_tlpXmtBusy$EN;
  // register edp_xactionNumber
  reg [31 : 0] edp_xactionNumber;
  wire [31 : 0] edp_xactionNumber$D_IN;
  wire edp_xactionNumber$EN;
  // register edp_xmtMetaInFlight
  reg edp_xmtMetaInFlight;
  wire edp_xmtMetaInFlight$D_IN, edp_xmtMetaInFlight$EN;
  // register edp_xmtMetaOK
  reg edp_xmtMetaOK;
  reg edp_xmtMetaOK$D_IN;
  wire edp_xmtMetaOK$EN;
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
  // register wmi_addr
  reg [13 : 0] wmi_addr;
  wire [13 : 0] wmi_addr$D_IN;
  wire wmi_addr$EN;
  // register wmi_bufDwell
  reg [1 : 0] wmi_bufDwell;
  wire [1 : 0] wmi_bufDwell$D_IN;
  wire wmi_bufDwell$EN;
  // register wmi_bytesRemainReq
  reg [13 : 0] wmi_bytesRemainReq;
  wire [13 : 0] wmi_bytesRemainReq$D_IN;
  wire wmi_bytesRemainReq$EN;
  // register wmi_bytesRemainResp
  reg [13 : 0] wmi_bytesRemainResp;
  wire [13 : 0] wmi_bytesRemainResp$D_IN;
  wire wmi_bytesRemainResp$EN;
  // register wmi_doneWithMesg
  reg wmi_doneWithMesg;
  wire wmi_doneWithMesg$D_IN, wmi_doneWithMesg$EN;
  // register wmi_lastMesg
  reg [31 : 0] wmi_lastMesg;
  wire [31 : 0] wmi_lastMesg$D_IN;
  wire wmi_lastMesg$EN;
  // register wmi_lclMesgAddr
  reg [14 : 0] wmi_lclMesgAddr;
  wire [14 : 0] wmi_lclMesgAddr$D_IN;
  wire wmi_lclMesgAddr$EN;
  // register wmi_lclMetaAddr
  reg [14 : 0] wmi_lclMetaAddr;
  wire [14 : 0] wmi_lclMetaAddr$D_IN;
  wire wmi_lclMetaAddr$EN;
  // register wmi_mesgBufReady
  reg wmi_mesgBufReady;
  wire wmi_mesgBufReady$D_IN, wmi_mesgBufReady$EN;
  // register wmi_mesgBusy
  reg wmi_mesgBusy;
  wire wmi_mesgBusy$D_IN, wmi_mesgBusy$EN;
  // register wmi_mesgCount
  reg [31 : 0] wmi_mesgCount;
  wire [31 : 0] wmi_mesgCount$D_IN;
  wire wmi_mesgCount$EN;
  // register wmi_mesgDone
  reg wmi_mesgDone;
  wire wmi_mesgDone$D_IN, wmi_mesgDone$EN;
  // register wmi_mesgMeta
  reg [128 : 0] wmi_mesgMeta;
  wire [128 : 0] wmi_mesgMeta$D_IN;
  wire wmi_mesgMeta$EN;
  // register wmi_mesgStart
  reg wmi_mesgStart;
  wire wmi_mesgStart$D_IN, wmi_mesgStart$EN;
  // register wmi_metaBusy
  reg wmi_metaBusy;
  wire wmi_metaBusy$D_IN, wmi_metaBusy$EN;
  // register wmi_p4B
  reg [1 : 0] wmi_p4B;
  wire [1 : 0] wmi_p4B$D_IN;
  wire wmi_p4B$EN;
  // register wmi_rdActive
  reg wmi_rdActive;
  wire wmi_rdActive$D_IN, wmi_rdActive$EN;
  // register wmi_reqCount
  reg [15 : 0] wmi_reqCount;
  wire [15 : 0] wmi_reqCount$D_IN;
  wire wmi_reqCount$EN;
  // register wmi_thisMesg
  reg [31 : 0] wmi_thisMesg;
  wire [31 : 0] wmi_thisMesg$D_IN;
  wire wmi_thisMesg$EN;
  // register wmi_wmi_blockReq
  reg wmi_wmi_blockReq;
  wire wmi_wmi_blockReq$D_IN, wmi_wmi_blockReq$EN;
  // register wmi_wmi_dhF_countReg
  reg [1 : 0] wmi_wmi_dhF_countReg;
  wire [1 : 0] wmi_wmi_dhF_countReg$D_IN;
  wire wmi_wmi_dhF_countReg$EN;
  // register wmi_wmi_dhF_levelsValid
  reg wmi_wmi_dhF_levelsValid;
  wire wmi_wmi_dhF_levelsValid$D_IN, wmi_wmi_dhF_levelsValid$EN;
  // register wmi_wmi_errorSticky
  reg wmi_wmi_errorSticky;
  wire wmi_wmi_errorSticky$D_IN, wmi_wmi_errorSticky$EN;
  // register wmi_wmi_isReset_isInReset
  reg wmi_wmi_isReset_isInReset;
  wire wmi_wmi_isReset_isInReset$D_IN, wmi_wmi_isReset_isInReset$EN;
  // register wmi_wmi_mFlagF_countReg
  reg [1 : 0] wmi_wmi_mFlagF_countReg;
  wire [1 : 0] wmi_wmi_mFlagF_countReg$D_IN;
  wire wmi_wmi_mFlagF_countReg$EN;
  // register wmi_wmi_mFlagF_levelsValid
  reg wmi_wmi_mFlagF_levelsValid;
  wire wmi_wmi_mFlagF_levelsValid$D_IN, wmi_wmi_mFlagF_levelsValid$EN;
  // register wmi_wmi_operateD
  reg wmi_wmi_operateD;
  wire wmi_wmi_operateD$D_IN, wmi_wmi_operateD$EN;
  // register wmi_wmi_peerIsReady
  reg wmi_wmi_peerIsReady;
  wire wmi_wmi_peerIsReady$D_IN, wmi_wmi_peerIsReady$EN;
  // register wmi_wmi_reqF_countReg
  reg [1 : 0] wmi_wmi_reqF_countReg;
  wire [1 : 0] wmi_wmi_reqF_countReg$D_IN;
  wire wmi_wmi_reqF_countReg$EN;
  // register wmi_wmi_reqF_levelsValid
  reg wmi_wmi_reqF_levelsValid;
  wire wmi_wmi_reqF_levelsValid$D_IN, wmi_wmi_reqF_levelsValid$EN;
  // register wmi_wmi_respF_c_r
  reg [1 : 0] wmi_wmi_respF_c_r;
  wire [1 : 0] wmi_wmi_respF_c_r$D_IN;
  wire wmi_wmi_respF_c_r$EN;
  // register wmi_wmi_respF_q_0
  reg [33 : 0] wmi_wmi_respF_q_0;
  reg [33 : 0] wmi_wmi_respF_q_0$D_IN;
  wire wmi_wmi_respF_q_0$EN;
  // register wmi_wmi_respF_q_1
  reg [33 : 0] wmi_wmi_respF_q_1;
  reg [33 : 0] wmi_wmi_respF_q_1$D_IN;
  wire wmi_wmi_respF_q_1$EN;
  // register wmi_wmi_sFlagReg
  reg [31 : 0] wmi_wmi_sFlagReg;
  wire [31 : 0] wmi_wmi_sFlagReg$D_IN;
  wire wmi_wmi_sFlagReg$EN;
  // register wmi_wmi_statusR
  reg [7 : 0] wmi_wmi_statusR;
  wire [7 : 0] wmi_wmi_statusR$D_IN;
  wire wmi_wmi_statusR$EN;
  // register wmi_wmi_trafficSticky
  reg wmi_wmi_trafficSticky;
  wire wmi_wmi_trafficSticky$D_IN, wmi_wmi_trafficSticky$EN;
  // register wmi_wrActive
  reg wmi_wrActive;
  wire wmi_wrActive$D_IN, wmi_wrActive$EN;
  // register wmi_wrFinalize
  reg wmi_wrFinalize;
  wire wmi_wrFinalize$D_IN, wmi_wrFinalize$EN;
  // register wmi_wrtCount
  reg [15 : 0] wmi_wrtCount;
  wire [15 : 0] wmi_wrtCount$D_IN;
  wire wmi_wrtCount$EN;
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
  // ports of submodule bram_memory
  reg [31 : 0] bram_memory$DIA, bram_memory$DIB;
  reg [10 : 0] bram_memory$ADDRA, bram_memory$ADDRB;
  wire [31 : 0] bram_memory$DOA, bram_memory$DOB;
  wire bram_memory$ENA, bram_memory$ENB, bram_memory$WEA, bram_memory$WEB;
  // ports of submodule bram_memory_1
  reg [31 : 0] bram_memory_1$DIA, bram_memory_1$DIB;
  reg [10 : 0] bram_memory_1$ADDRA, bram_memory_1$ADDRB;
  wire [31 : 0] bram_memory_1$DOA, bram_memory_1$DOB;
  wire bram_memory_1$ENA,
       bram_memory_1$ENB,
       bram_memory_1$WEA,
       bram_memory_1$WEB;
  // ports of submodule bram_memory_2
  reg [31 : 0] bram_memory_2$DIA, bram_memory_2$DIB;
  reg [10 : 0] bram_memory_2$ADDRA, bram_memory_2$ADDRB;
  wire [31 : 0] bram_memory_2$DOA, bram_memory_2$DOB;
  wire bram_memory_2$ENA,
       bram_memory_2$ENB,
       bram_memory_2$WEA,
       bram_memory_2$WEB;
  // ports of submodule bram_memory_3
  reg [31 : 0] bram_memory_3$DIA, bram_memory_3$DIB;
  reg [10 : 0] bram_memory_3$ADDRA, bram_memory_3$ADDRB;
  wire [31 : 0] bram_memory_3$DOA, bram_memory_3$DOB;
  wire bram_memory_3$ENA,
       bram_memory_3$ENB,
       bram_memory_3$WEA,
       bram_memory_3$WEB;
  // ports of submodule bram_serverAdapterA_1_outDataCore
  wire [31 : 0] bram_serverAdapterA_1_outDataCore$D_IN,
		bram_serverAdapterA_1_outDataCore$D_OUT;
  wire bram_serverAdapterA_1_outDataCore$CLR,
       bram_serverAdapterA_1_outDataCore$DEQ,
       bram_serverAdapterA_1_outDataCore$EMPTY_N,
       bram_serverAdapterA_1_outDataCore$ENQ,
       bram_serverAdapterA_1_outDataCore$FULL_N;
  // ports of submodule bram_serverAdapterA_2_outDataCore
  wire [31 : 0] bram_serverAdapterA_2_outDataCore$D_IN,
		bram_serverAdapterA_2_outDataCore$D_OUT;
  wire bram_serverAdapterA_2_outDataCore$CLR,
       bram_serverAdapterA_2_outDataCore$DEQ,
       bram_serverAdapterA_2_outDataCore$EMPTY_N,
       bram_serverAdapterA_2_outDataCore$ENQ,
       bram_serverAdapterA_2_outDataCore$FULL_N;
  // ports of submodule bram_serverAdapterA_3_outDataCore
  wire [31 : 0] bram_serverAdapterA_3_outDataCore$D_IN,
		bram_serverAdapterA_3_outDataCore$D_OUT;
  wire bram_serverAdapterA_3_outDataCore$CLR,
       bram_serverAdapterA_3_outDataCore$DEQ,
       bram_serverAdapterA_3_outDataCore$EMPTY_N,
       bram_serverAdapterA_3_outDataCore$ENQ,
       bram_serverAdapterA_3_outDataCore$FULL_N;
  // ports of submodule bram_serverAdapterA_outDataCore
  wire [31 : 0] bram_serverAdapterA_outDataCore$D_IN,
		bram_serverAdapterA_outDataCore$D_OUT;
  wire bram_serverAdapterA_outDataCore$CLR,
       bram_serverAdapterA_outDataCore$DEQ,
       bram_serverAdapterA_outDataCore$EMPTY_N,
       bram_serverAdapterA_outDataCore$ENQ,
       bram_serverAdapterA_outDataCore$FULL_N;
  // ports of submodule bram_serverAdapterB_1_outDataCore
  wire [31 : 0] bram_serverAdapterB_1_outDataCore$D_IN,
		bram_serverAdapterB_1_outDataCore$D_OUT;
  wire bram_serverAdapterB_1_outDataCore$CLR,
       bram_serverAdapterB_1_outDataCore$DEQ,
       bram_serverAdapterB_1_outDataCore$EMPTY_N,
       bram_serverAdapterB_1_outDataCore$ENQ,
       bram_serverAdapterB_1_outDataCore$FULL_N;
  // ports of submodule bram_serverAdapterB_2_outDataCore
  wire [31 : 0] bram_serverAdapterB_2_outDataCore$D_IN,
		bram_serverAdapterB_2_outDataCore$D_OUT;
  wire bram_serverAdapterB_2_outDataCore$CLR,
       bram_serverAdapterB_2_outDataCore$DEQ,
       bram_serverAdapterB_2_outDataCore$EMPTY_N,
       bram_serverAdapterB_2_outDataCore$ENQ,
       bram_serverAdapterB_2_outDataCore$FULL_N;
  // ports of submodule bram_serverAdapterB_3_outDataCore
  wire [31 : 0] bram_serverAdapterB_3_outDataCore$D_IN,
		bram_serverAdapterB_3_outDataCore$D_OUT;
  wire bram_serverAdapterB_3_outDataCore$CLR,
       bram_serverAdapterB_3_outDataCore$DEQ,
       bram_serverAdapterB_3_outDataCore$EMPTY_N,
       bram_serverAdapterB_3_outDataCore$ENQ,
       bram_serverAdapterB_3_outDataCore$FULL_N;
  // ports of submodule bram_serverAdapterB_outDataCore
  wire [31 : 0] bram_serverAdapterB_outDataCore$D_IN,
		bram_serverAdapterB_outDataCore$D_OUT;
  wire bram_serverAdapterB_outDataCore$CLR,
       bram_serverAdapterB_outDataCore$DEQ,
       bram_serverAdapterB_outDataCore$EMPTY_N,
       bram_serverAdapterB_outDataCore$ENQ,
       bram_serverAdapterB_outDataCore$FULL_N;
  // ports of submodule edp_inF
  wire [39 : 0] edp_inF$D_IN, edp_inF$D_OUT;
  wire edp_inF$CLR, edp_inF$DEQ, edp_inF$EMPTY_N, edp_inF$ENQ, edp_inF$FULL_N;
  // ports of submodule edp_inProcF
  wire [39 : 0] edp_inProcF$D_IN, edp_inProcF$D_OUT;
  wire edp_inProcF$CLR,
       edp_inProcF$DEQ,
       edp_inProcF$EMPTY_N,
       edp_inProcF$ENQ,
       edp_inProcF$FULL_N;
  // ports of submodule edp_outBF_memory
  wire [39 : 0] edp_outBF_memory$DIA,
		edp_outBF_memory$DIB,
		edp_outBF_memory$DOB;
  wire [10 : 0] edp_outBF_memory$ADDRA, edp_outBF_memory$ADDRB;
  wire edp_outBF_memory$ENA,
       edp_outBF_memory$ENB,
       edp_outBF_memory$WEA,
       edp_outBF_memory$WEB;
  // ports of submodule edp_outF
  wire [39 : 0] edp_outF$D_IN, edp_outF$D_OUT;
  wire edp_outF$CLR,
       edp_outF$DEQ,
       edp_outF$EMPTY_N,
       edp_outF$ENQ,
       edp_outF$FULL_N;
  // ports of submodule edp_outFunl_inF
  wire [127 : 0] edp_outFunl_inF$D_IN, edp_outFunl_inF$D_OUT;
  wire edp_outFunl_inF$CLR,
       edp_outFunl_inF$DEQ,
       edp_outFunl_inF$EMPTY_N,
       edp_outFunl_inF$ENQ,
       edp_outFunl_inF$FULL_N;
  // ports of submodule edp_outFunl_outF
  reg [31 : 0] edp_outFunl_outF$D_IN;
  wire [31 : 0] edp_outFunl_outF$D_OUT;
  wire edp_outFunl_outF$CLR,
       edp_outFunl_outF$DEQ,
       edp_outFunl_outF$EMPTY_N,
       edp_outFunl_outF$ENQ,
       edp_outFunl_outF$FULL_N;
  // ports of submodule edp_outTF
  wire edp_outTF$CLR,
       edp_outTF$DEQ,
       edp_outTF$EMPTY_N,
       edp_outTF$ENQ,
       edp_outTF$FULL_N;
  // ports of submodule edp_tailEventF
  wire edp_tailEventF$CLR,
       edp_tailEventF$DEQ,
       edp_tailEventF$D_IN,
       edp_tailEventF$D_OUT,
       edp_tailEventF$EMPTY_N,
       edp_tailEventF$ENQ,
       edp_tailEventF$FULL_N;
  // ports of submodule edp_tlpBRAM_mReqF
  reg [129 : 0] edp_tlpBRAM_mReqF$D_IN;
  wire [129 : 0] edp_tlpBRAM_mReqF$D_OUT;
  wire edp_tlpBRAM_mReqF$CLR,
       edp_tlpBRAM_mReqF$DEQ,
       edp_tlpBRAM_mReqF$EMPTY_N,
       edp_tlpBRAM_mReqF$ENQ,
       edp_tlpBRAM_mReqF$FULL_N;
  // ports of submodule edp_tlpBRAM_mRespF
  wire [138 : 0] edp_tlpBRAM_mRespF$D_IN, edp_tlpBRAM_mRespF$D_OUT;
  wire edp_tlpBRAM_mRespF$CLR,
       edp_tlpBRAM_mRespF$DEQ,
       edp_tlpBRAM_mRespF$EMPTY_N,
       edp_tlpBRAM_mRespF$ENQ,
       edp_tlpBRAM_mRespF$FULL_N;
  // ports of submodule edp_tlpBRAM_readReq
  wire [60 : 0] edp_tlpBRAM_readReq$D_IN, edp_tlpBRAM_readReq$D_OUT;
  wire edp_tlpBRAM_readReq$CLR,
       edp_tlpBRAM_readReq$DEQ,
       edp_tlpBRAM_readReq$EMPTY_N,
       edp_tlpBRAM_readReq$ENQ,
       edp_tlpBRAM_readReq$FULL_N;
  // ports of submodule wci_reqF
  wire [71 : 0] wci_reqF$D_IN, wci_reqF$D_OUT;
  wire wci_reqF$CLR, wci_reqF$DEQ, wci_reqF$EMPTY_N, wci_reqF$ENQ;
  // ports of submodule wmi_wmi_dhF
  wire [37 : 0] wmi_wmi_dhF$D_IN, wmi_wmi_dhF$D_OUT;
  wire wmi_wmi_dhF$CLR,
       wmi_wmi_dhF$DEQ,
       wmi_wmi_dhF$EMPTY_N,
       wmi_wmi_dhF$ENQ,
       wmi_wmi_dhF$FULL_N;
  // ports of submodule wmi_wmi_mFlagF
  wire [31 : 0] wmi_wmi_mFlagF$D_IN, wmi_wmi_mFlagF$D_OUT;
  wire wmi_wmi_mFlagF$CLR,
       wmi_wmi_mFlagF$DEQ,
       wmi_wmi_mFlagF$EMPTY_N,
       wmi_wmi_mFlagF$ENQ,
       wmi_wmi_mFlagF$FULL_N;
  // ports of submodule wmi_wmi_reqF
  wire [31 : 0] wmi_wmi_reqF$D_IN, wmi_wmi_reqF$D_OUT;
  wire wmi_wmi_reqF$CLR,
       wmi_wmi_reqF$DEQ,
       wmi_wmi_reqF$EMPTY_N,
       wmi_wmi_reqF$ENQ,
       wmi_wmi_reqF$FULL_N;
  // rule scheduling signals
  wire CAN_FIRE_RL_bml_remAdvance,
       CAN_FIRE_RL_edp_dmaTailEventSender,
       CAN_FIRE_RL_edp_dmaXmtTailEvent,
       CAN_FIRE_RL_edp_rcv_message,
       CAN_FIRE_RL_edp_send_mesgMH,
       CAN_FIRE_RL_edp_send_metaMH,
       CAN_FIRE_RL_wmi_doWriteReq,
       CAN_FIRE_RL_wmi_getRequest,
       CAN_FIRE_RL_wmi_reqMetadata,
       CAN_FIRE_RL_wmi_respMetadata,
       WILL_FIRE_RL_bml_crdAdvance,
       WILL_FIRE_RL_bml_fba,
       WILL_FIRE_RL_bml_initAccumulators,
       WILL_FIRE_RL_bml_lclAdvance,
       WILL_FIRE_RL_bml_lcredit,
       WILL_FIRE_RL_bml_remAdvance,
       WILL_FIRE_RL_bram_serverAdapterA_1_outData_enqAndDeq,
       WILL_FIRE_RL_bram_serverAdapterA_2_outData_enqAndDeq,
       WILL_FIRE_RL_bram_serverAdapterA_3_outData_enqAndDeq,
       WILL_FIRE_RL_bram_serverAdapterA_outData_enqAndDeq,
       WILL_FIRE_RL_bram_serverAdapterB_1_outData_enqAndDeq,
       WILL_FIRE_RL_bram_serverAdapterB_2_outData_enqAndDeq,
       WILL_FIRE_RL_bram_serverAdapterB_3_outData_enqAndDeq,
       WILL_FIRE_RL_bram_serverAdapterB_outData_enqAndDeq,
       WILL_FIRE_RL_edp_dmaPushRequestMesg,
       WILL_FIRE_RL_edp_dmaPushResponseBody,
       WILL_FIRE_RL_edp_dmaPushResponseHeader,
       WILL_FIRE_RL_edp_dmaRequestNearMeta,
       WILL_FIRE_RL_edp_dmaResponseNearMetaBody,
       WILL_FIRE_RL_edp_dmaResponseNearMetaHead,
       WILL_FIRE_RL_edp_dmaTailEventSender,
       WILL_FIRE_RL_edp_dmaXmtDoorbell,
       WILL_FIRE_RL_edp_dmaXmtMetaBody,
       WILL_FIRE_RL_edp_dmaXmtMetaHead,
       WILL_FIRE_RL_edp_dmaXmtTailEvent,
       WILL_FIRE_RL_edp_drain_outFunl,
       WILL_FIRE_RL_edp_fhFsm_action_l184c11,
       WILL_FIRE_RL_edp_fhFsm_action_l185c11,
       WILL_FIRE_RL_edp_fhFsm_action_l186c11,
       WILL_FIRE_RL_edp_fhFsm_fsm_start,
       WILL_FIRE_RL_edp_fhFsm_idle_l183c3,
       WILL_FIRE_RL_edp_ingress,
       WILL_FIRE_RL_edp_mhFsm_action_l192c11,
       WILL_FIRE_RL_edp_mhFsm_action_l193c11,
       WILL_FIRE_RL_edp_mhFsm_action_l194c11,
       WILL_FIRE_RL_edp_mhFsm_action_l195c11,
       WILL_FIRE_RL_edp_mhFsm_action_l196c11,
       WILL_FIRE_RL_edp_mhFsm_action_l197c11,
       WILL_FIRE_RL_edp_mhFsm_fsm_start,
       WILL_FIRE_RL_edp_mhFsm_idle_l191c3,
       WILL_FIRE_RL_edp_rcv_completion,
       WILL_FIRE_RL_edp_rcv_message,
       WILL_FIRE_RL_edp_send_mesgMH,
       WILL_FIRE_RL_edp_send_metaMH,
       WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq,
       WILL_FIRE_RL_edp_tlpBRAM_read_FirstResp,
       WILL_FIRE_RL_edp_tlpBRAM_read_NextReq,
       WILL_FIRE_RL_edp_tlpBRAM_read_NextResp,
       WILL_FIRE_RL_edp_tlpBRAM_writeData,
       WILL_FIRE_RL_edp_tlpBRAM_writeReq,
       WILL_FIRE_RL_wci_cfrd,
       WILL_FIRE_RL_wci_cfwr,
       WILL_FIRE_RL_wci_ctl_op_complete,
       WILL_FIRE_RL_wci_ctl_op_start,
       WILL_FIRE_RL_wci_respF_both,
       WILL_FIRE_RL_wci_respF_decCtr,
       WILL_FIRE_RL_wci_respF_incCtr,
       WILL_FIRE_RL_wmi_doReadReq,
       WILL_FIRE_RL_wmi_doReadResp,
       WILL_FIRE_RL_wmi_doWriteFinalize,
       WILL_FIRE_RL_wmi_doWriteReq,
       WILL_FIRE_RL_wmi_getRequest,
       WILL_FIRE_RL_wmi_reqMetadata,
       WILL_FIRE_RL_wmi_respMetadata,
       WILL_FIRE_RL_wmi_wmi_dhF_reset,
       WILL_FIRE_RL_wmi_wmi_mFlagF_reset,
       WILL_FIRE_RL_wmi_wmi_reqF_reset,
       WILL_FIRE_RL_wmi_wmi_respF_both,
       WILL_FIRE_RL_wmi_wmi_respF_decCtr,
       WILL_FIRE_RL_wmi_wmi_respF_incCtr;
  // inputs to muxes for submodule ports
  reg [33 : 0] MUX_wci_respF_q_0$write_1__VAL_2;
  reg [10 : 0] MUX_bram_memory$a_put_2__VAL_3,
	       MUX_bram_memory$a_put_2__VAL_4,
	       MUX_bram_memory_1$a_put_2__VAL_3,
	       MUX_bram_memory_1$a_put_2__VAL_4,
	       MUX_bram_memory_2$a_put_2__VAL_3,
	       MUX_bram_memory_2$a_put_2__VAL_4,
	       MUX_bram_memory_3$a_put_2__VAL_3,
	       MUX_bram_memory_3$a_put_2__VAL_4;
  wire [138 : 0] MUX_edp_tlpBRAM_mRespF$enq_1__VAL_1,
		 MUX_edp_tlpBRAM_mRespF$enq_1__VAL_2;
  wire [129 : 0] MUX_edp_tlpBRAM_mReqF$enq_1__VAL_1,
		 MUX_edp_tlpBRAM_mReqF$enq_1__VAL_2,
		 MUX_edp_tlpBRAM_mReqF$enq_1__VAL_3;
  wire [128 : 0] MUX_edp_fabMeta$write_1__VAL_2,
		 MUX_wmi_mesgMeta$write_1__VAL_2;
  wire [127 : 0] MUX_edp_outFunl_inF$enq_1__VAL_1,
		 MUX_edp_outFunl_inF$enq_1__VAL_2;
  wire [39 : 0] MUX_edp_outBF_wDataIn$wset_1__VAL_1,
		MUX_edp_outBF_wDataIn$wset_1__VAL_2,
		MUX_edp_outBF_wDataIn$wset_1__VAL_3,
		MUX_edp_outBF_wDataIn$wset_1__VAL_4,
		MUX_edp_outBF_wDataIn$wset_1__VAL_5,
		MUX_edp_outBF_wDataIn$wset_1__VAL_6,
		MUX_edp_outBF_wDataIn$wset_1__VAL_7,
		MUX_edp_outBF_wDataIn$wset_1__VAL_8,
		MUX_edp_outBF_wDataIn$wset_1__VAL_9;
  wire [33 : 0] MUX_wci_respF_q_0$write_1__VAL_1,
		MUX_wci_respF_q_1$write_1__VAL_1,
		MUX_wci_respF_x_wire$wset_1__VAL_1,
		MUX_wci_respF_x_wire$wset_1__VAL_2,
		MUX_wmi_wmi_respF_q_0$write_1__VAL_1,
		MUX_wmi_wmi_respF_q_0$write_1__VAL_2,
		MUX_wmi_wmi_respF_q_1$write_1__VAL_1;
  wire [31 : 0] MUX_bml_fabFlowAddr$write_1__VAL_1,
		MUX_bml_fabFlowAddr$write_1__VAL_3,
		MUX_bml_fabMesgAddr$write_1__VAL_1,
		MUX_bml_fabMetaAddr$write_1__VAL_1,
		MUX_bram_memory$a_put_3__VAL_1,
		MUX_bram_memory$a_put_3__VAL_3,
		MUX_bram_memory_1$a_put_3__VAL_3,
		MUX_bram_memory_2$a_put_3__VAL_3,
		MUX_bram_memory_3$a_put_3__VAL_3,
		MUX_edp_fabMesgAccu$write_1__VAL_2,
		MUX_edp_srcMesgAccu$write_1__VAL_2,
		MUX_wmi_mesgCount$write_1__VAL_1;
  wire [16 : 0] MUX_edp_mesgLengthRemainPush$write_1__VAL_1,
		MUX_edp_mesgLengthRemainPush$write_1__VAL_2,
		MUX_edp_mesgLengthRemainPush$write_1__VAL_3;
  wire [15 : 0] MUX_bml_crdBuf_value$write_1__VAL_3,
		MUX_bml_fabBuf_value$write_1__VAL_3,
		MUX_bml_fabBufsAvail$write_1__VAL_1,
		MUX_bml_fabBufsAvail$write_1__VAL_2,
		MUX_bml_lclBuf_value$write_1__VAL_3,
		MUX_bml_lclBufsAR$write_1__VAL_1,
		MUX_bml_lclBufsAR$write_1__VAL_2,
		MUX_bml_lclBufsCF$write_1__VAL_1,
		MUX_bml_lclBufsCF$write_1__VAL_2,
		MUX_bml_lclCredit$write_1__VAL_1,
		MUX_bml_lclMesgAddr$write_1__VAL_2,
		MUX_bml_lclMetaAddr$write_1__VAL_2,
		MUX_bml_remBuf_value$write_1__VAL_3,
		MUX_bml_remMesgAddr$write_1__VAL_2,
		MUX_bml_remMetaAddr$write_1__VAL_2,
		MUX_edp_remMesgAccu$write_1__VAL_2;
  wire [13 : 0] MUX_wmi_addr$write_1__VAL_1,
		MUX_wmi_bytesRemainReq$write_1__VAL_1,
		MUX_wmi_bytesRemainReq$write_1__VAL_2,
		MUX_wmi_bytesRemainResp$write_1__VAL_2;
  wire [12 : 0] MUX_edp_tlpBRAM_readNxtDWAddr$write_1__VAL_1,
		MUX_edp_tlpBRAM_readNxtDWAddr$write_1__VAL_2,
		MUX_edp_tlpBRAM_writeDWAddr$write_1__VAL_1,
		MUX_edp_tlpBRAM_writeDWAddr$write_1__VAL_2;
  wire [10 : 0] MUX_bram_memory$b_put_2__VAL_1;
  wire [9 : 0] MUX_edp_outDwRemain$write_1__VAL_1,
	       MUX_edp_outDwRemain$write_1__VAL_2,
	       MUX_edp_tlpBRAM_rdRespDwRemain$write_1__VAL_1,
	       MUX_edp_tlpBRAM_rdRespDwRemain$write_1__VAL_2,
	       MUX_edp_tlpBRAM_readRemainDWLen$write_1__VAL_1,
	       MUX_edp_tlpBRAM_readRemainDWLen$write_1__VAL_2,
	       MUX_edp_tlpBRAM_writeRemainDWLen$write_1__VAL_1,
	       MUX_edp_tlpBRAM_writeRemainDWLen$write_1__VAL_2;
  wire [3 : 0] MUX_edp_doorSeqDwell$write_1__VAL_1,
	       MUX_edp_postSeqDwell$write_1__VAL_1,
	       MUX_edp_postSeqDwell$write_1__VAL_2;
  wire [1 : 0] MUX_wci_respF_c_r$write_1__VAL_1,
	       MUX_wci_respF_c_r$write_1__VAL_2,
	       MUX_wmi_bufDwell$write_1__VAL_3,
	       MUX_wmi_p4B$write_1__VAL_2,
	       MUX_wmi_wmi_respF_c_r$write_1__VAL_1,
	       MUX_wmi_wmi_respF_c_r$write_1__VAL_2;
  wire MUX_bml_fabBufsAvail$write_1__SEL_1,
       MUX_bml_fabFlowAddr$write_1__SEL_1,
       MUX_bml_lclBufsAR$write_1__SEL_1,
       MUX_bml_lclBufsCF$write_1__SEL_1,
       MUX_bml_lclCredit$write_1__SEL_1,
       MUX_bram_memory$a_put_1__SEL_1,
       MUX_bram_memory$a_put_1__SEL_2,
       MUX_bram_memory$a_put_1__SEL_3,
       MUX_bram_memory$b_put_1__SEL_1,
       MUX_bram_memory$b_put_1__SEL_2,
       MUX_bram_memory_1$a_put_1__SEL_1,
       MUX_bram_memory_1$a_put_1__SEL_2,
       MUX_bram_memory_1$a_put_1__SEL_3,
       MUX_bram_memory_1$b_put_1__SEL_1,
       MUX_bram_memory_1$b_put_1__SEL_2,
       MUX_bram_memory_2$a_put_1__SEL_1,
       MUX_bram_memory_2$a_put_1__SEL_2,
       MUX_bram_memory_2$a_put_1__SEL_3,
       MUX_bram_memory_2$b_put_1__SEL_1,
       MUX_bram_memory_2$b_put_1__SEL_2,
       MUX_bram_memory_3$a_put_1__SEL_1,
       MUX_bram_memory_3$a_put_1__SEL_2,
       MUX_bram_memory_3$a_put_1__SEL_3,
       MUX_bram_memory_3$b_put_1__SEL_1,
       MUX_bram_memory_3$b_put_1__SEL_2,
       MUX_edp_doorBell_1$wset_1__SEL_1,
       MUX_edp_fabMeta$write_1__SEL_1,
       MUX_edp_frmAckOK$write_1__SEL_1,
       MUX_edp_mhFsm_start_reg$write_1__SEL_2,
       MUX_edp_rcvDoCompletion$write_1__VAL_1,
       MUX_edp_remDone_1$wset_1__SEL_1,
       MUX_edp_tlpBRAM_mReqF$enq_1__SEL_1,
       MUX_edp_tlpBRAM_readHeaderSent$write_1__SEL_1,
       MUX_edp_tlpBRAM_readStarted$write_1__SEL_1,
       MUX_edp_tlpXmtBusy$write_1__SEL_1,
       MUX_edp_tlpXmtBusy$write_1__SEL_3,
       MUX_edp_xmtMetaOK$write_1__SEL_2,
       MUX_wci_illegalEdge$write_1__SEL_1,
       MUX_wci_illegalEdge$write_1__SEL_2,
       MUX_wci_illegalEdge$write_1__VAL_2,
       MUX_wci_respF_q_0$write_1__SEL_2,
       MUX_wci_respF_q_1$write_1__SEL_2,
       MUX_wmi_bufDwell$write_1__SEL_1,
       MUX_wmi_bytesRemainResp$write_1__SEL_1,
       MUX_wmi_doneWithMesg$write_1__PSEL_1,
       MUX_wmi_doneWithMesg$write_1__SEL_1,
       MUX_wmi_rdActive$write_1__SEL_1,
       MUX_wmi_wmi_dhF_levelsValid$write_1__SEL_2,
       MUX_wmi_wmi_mFlagF_levelsValid$write_1__SEL_2,
       MUX_wmi_wmi_reqF_levelsValid$write_1__SEL_2,
       MUX_wmi_wmi_respF_q_0$write_1__SEL_2,
       MUX_wmi_wmi_respF_q_1$write_1__SEL_2,
       MUX_wmi_wrActive$write_1__SEL_1,
       MUX_wmi_wrFinalize$write_1__SEL_1;
  // remaining internal signals
  reg [63 : 0] v__h115778,
	       v__h124593,
	       v__h124749,
	       v__h15697,
	       v__h15872,
	       v__h16016,
	       v__h78512,
	       v__h80805,
	       v__h85104,
	       v__h87277,
	       v__h87568,
	       v__h92899,
	       v__h93048,
	       v__h93195,
	       v__h93330,
	       v__h95233,
	       v__h95995;
  reg [31 : 0] IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2940,
	       IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2941,
	       IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2942,
	       IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2943,
	       IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d2798,
	       _theResult____h124733,
	       rdata__h116899;
  reg [3 : 0] CASE_edp_lastRuleFired_10_1_edp_lastRuleFired__ETC__q5;
  reg [1 : 0] CASE_edp_inFD_OUT_BITS_19_TO_18_3_0_edp_inFD_ETC__q39,
	      CASE_edp_inFD_OUT_BITS_29_TO_28_3_0_edp_inFD_ETC__q38,
	      CASE_edp_inFD_OUT_BITS_39_TO_38_3_0_edp_inFD_ETC__q37,
	      CASE_edp_inFD_OUT_BITS_9_TO_8_3_0_edp_inFD_O_ETC__q40,
	      CASE_edp_outBF_memoryDOB_BITS_19_TO_18_3_0_ed_ETC__q27,
	      CASE_edp_outBF_memoryDOB_BITS_29_TO_28_3_0_ed_ETC__q26,
	      CASE_edp_outBF_memoryDOB_BITS_39_TO_38_3_0_ed_ETC__q25,
	      CASE_edp_outBF_memoryDOB_BITS_9_TO_8_3_0_edp__ETC__q28,
	      CASE_edp_outBF_rCache_BITS_19_TO_18_3_0_edp_ou_ETC__q23,
	      CASE_edp_outBF_rCache_BITS_29_TO_28_3_0_edp_ou_ETC__q22,
	      CASE_edp_outBF_rCache_BITS_39_TO_38_3_0_edp_ou_ETC__q21,
	      CASE_edp_outBF_rCache_BITS_9_TO_8_3_0_edp_outB_ETC__q24,
	      CASE_edp_outBF_wDataInwget_BITS_19_TO_18_3_1__ETC__q31,
	      CASE_edp_outBF_wDataInwget_BITS_29_TO_28_3_1__ETC__q30,
	      CASE_edp_outBF_wDataInwget_BITS_39_TO_38_3_1__ETC__q29,
	      CASE_edp_outBF_wDataInwget_BITS_9_TO_8_3_1_ed_ETC__q32,
	      CASE_edp_outBF_wDataOutwget_BITS_19_TO_18_3_0_ETC__q43,
	      CASE_edp_outBF_wDataOutwget_BITS_29_TO_28_3_0_ETC__q42,
	      CASE_edp_outBF_wDataOutwget_BITS_39_TO_38_3_0_ETC__q41,
	      CASE_edp_outBF_wDataOutwget_BITS_9_TO_8_3_0_e_ETC__q44,
	      CASE_edp_outFD_OUT_BITS_19_TO_18_3_0_edp_outF_ETC__q3,
	      CASE_edp_outFD_OUT_BITS_29_TO_28_3_0_edp_outF_ETC__q2,
	      CASE_edp_outFD_OUT_BITS_39_TO_38_3_0_edp_outF_ETC__q1,
	      CASE_edp_outFD_OUT_BITS_9_TO_8_3_0_edp_outFD_ETC__q4,
	      CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q35,
	      CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q34,
	      CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q33,
	      CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q36,
	      lowAddr10__h35518,
	      x__h35647,
	      x__h35670;
  reg CASE_dpControl_BITS_1_TO_0_NOT_bml_fabDone_0_N_ETC__q10,
      CASE_dpControl_BITS_1_TO_0_NOT_bml_fabDone_0_N_ETC__q9,
      CASE_dpControl_BITS_1_TO_0_bml_fabDone_0_bml_f_ETC__q6,
      CASE_edp_tlpBRAM_mReqFD_OUT_BITS_30_TO_29_NOT_ETC__q8,
      CASE_edp_tlpBRAM_mReqFD_OUT_BITS_51_TO_50_NOT_ETC__q7,
      CASE_edp_tlpBRAM_readReqD_OUT_BITS_30_TO_29_N_ETC__q19,
      CASE_wmi_p4B_NOT_wmi_p4B_EQ_3_OR_bram_serverAd_ETC__q20,
      IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2899,
      IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d839,
      IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2900,
      IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d849,
      IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2901,
      IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d859,
      IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2902,
      IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d869,
      IF_bml_dpControl_wget__290_BITS_1_TO_0_296_EQ__ETC___d2367,
      IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d1076,
      IF_wmi_addr_116_BITS_3_TO_2_117_EQ_0_118_THEN__ETC___d3312,
      IF_wmi_p4B_173_EQ_1_176_THEN_bram_serverAdapte_ETC___d2182;
  wire [127 : 0] IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d1201,
		 IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d1206,
		 rdata__h40958;
  wire [31 : 0] bml_fabFlowAddr_329_PLUS_bml_fabFlowSize_330___d3070,
		dw__h101823,
		mesgMeta_opcode__h115176,
		nowLS__h83897,
		nowMS__h82954,
		opcode__h81723,
		rdat__h124812,
		rdat__h124820,
		rdat__h124828,
		rdat__h124836,
		rdat__h124844,
		rdat__h124852,
		rdat__h124860,
		rdat__h124881,
		rdat__h124888,
		rdat__h124901,
		rdat__h124908,
		rdat__h124915,
		rdat__h125179,
		rdat__h125229,
		rdat__h125329,
		rdat__h125387,
		rdat__h125409,
		rdat__h125419,
		rdat__h125541,
		rdat__h125661,
		rdat__h125690,
		rdat__h125719,
		rdat__h125748,
		rdat__h125778,
		rdat__h125812,
		rdat__h125845,
		rdat__h125879,
		rdat__h125912,
		rdat__h125923,
		rdat__h125934,
		rdw__h101824,
		rresp_data__h35565,
		x3__h115136,
		x__h105432,
		x__h79939,
		x__h84900,
		y__h87114,
		y__h87444,
		y_avValue__h116735,
		y_avValue__h116755,
		y_avValue__h116775,
		y_avValue__h116795;
  wire [16 : 0] edp_mesgLengthRemainPush_PLUS_3__q18,
		x__h87033,
		y__h87023,
		y__h87035;
  wire [15 : 0] x__h105051,
		x__h105091,
		x__h105463,
		x__h121490,
		x__h122618,
		x__h122623,
		x__h122730,
		x__h122767,
		x__h122849,
		x__h122854,
		x__h122888,
		x__h122893,
		y__h87159;
  wire [12 : 0] edp_tlpBRAM_readNxtDWAddr_PLUS_1__q15,
		edp_tlpBRAM_readNxtDWAddr_PLUS_2__q16,
		edp_tlpBRAM_readNxtDWAddr_PLUS_3__q14,
		edp_tlpBRAM_writeDWAddr_PLUS_1__q12,
		edp_tlpBRAM_writeDWAddr_PLUS_2__q13,
		edp_tlpBRAM_writeDWAddr_PLUS_3__q11,
		spanToNextPage__h86997,
		thisRequestLength__h86998,
		y__h24596,
		y__h33157;
  wire [11 : 0] byteCount__h35520,
		x__h20843,
		x__h35638,
		x__h35640,
		y__h35639,
		y__h35641;
  wire [9 : 0] IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2800,
	       IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2801,
	       IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2802,
	       IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2803,
	       y__h24663,
	       y__h33145,
	       y__h36580,
	       y__h87385;
  wire [7 : 0] rreq_tag__h87207;
  wire [6 : 0] lowAddr__h35519;
  wire [3 : 0] x__h101850, x__h97353;
  wire [2 : 0] bram_serverAdapterA_1_cnt_44_PLUS_IF_bram_serv_ETC___d150,
	       bram_serverAdapterA_2_cnt_62_PLUS_IF_bram_serv_ETC___d268,
	       bram_serverAdapterA_3_cnt_80_PLUS_IF_bram_serv_ETC___d386,
	       bram_serverAdapterA_cnt_6_PLUS_IF_bram_serverA_ETC___d32,
	       bram_serverAdapterB_1_cnt_03_PLUS_IF_bram_serv_ETC___d209,
	       bram_serverAdapterB_2_cnt_21_PLUS_IF_bram_serv_ETC___d327,
	       bram_serverAdapterB_3_cnt_39_PLUS_IF_bram_serv_ETC___d445,
	       bram_serverAdapterB_cnt_5_PLUS_IF_bram_serverA_ETC___d91;
  wire [1 : 0] ab__h10453,
	       ab__h11857,
	       ab__h1613,
	       ab__h3019,
	       ab__h4561,
	       ab__h5965,
	       ab__h7507,
	       ab__h8911,
	       edp_tlpBRAM_readReq_first__061_BITS_30_TO_29_0_ETC___d2774,
	       idx__h26295,
	       idx__h28526,
	       idx__h29830,
	       idx__h31134,
	       idx__h33375,
	       idx__h33843,
	       idx__h34216,
	       idx__h34589;
  wire IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d872,
       IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d1085,
       IF_wmi_p4B_173_EQ_0_174_THEN_bram_serverAdapte_ETC___d2187,
       NOT_bml_lclBufDone_314_381_AND_IF_bml_dpContro_ETC___d2394,
       NOT_edp_outBF_rRdPtr_83_PLUS_1024_283_EQ_edp_o_ETC___d1285,
       NOT_wmi_wrActive_088_089_OR_NOT_wmi_rdActive_0_ETC___d2098,
       bml_crdBuf_value_272_EQ_bml_crdBuf_modulus_bw__ETC___d3259,
       bml_fabBuf_value_257_EQ_bml_fabBuf_modulus_bw__ETC___d3260,
       bml_lclBufDone_314_AND_IF_bml_dpControl_wget___ETC___d2911,
       bml_lclBuf_value_227_EQ_bml_lclBuf_modulus_bw__ETC___d3277,
       bml_remBuf_value_242_EQ_bml_remBuf_modulus_bw__ETC___d3278,
       bram_serverAdapterA_1_cnt_44_SLT_3___d2765,
       bram_serverAdapterA_2_cnt_62_SLT_3___d2838,
       bram_serverAdapterA_2_outDataCore_notEmpty__38_ETC___d1157,
       bram_serverAdapterA_3_cnt_80_SLT_3___d2766,
       bram_serverAdapterA_cnt_6_SLT_3___d2767,
       bram_serverAdapterA_outDataCore_notEmpty_OR_br_ETC___d1159,
       bram_serverAdapterB_1_cnt_03_SLT_3___d2038,
       bram_serverAdapterB_1_outData_outData_whas__05_ETC___d2066,
       bram_serverAdapterB_2_cnt_21_SLT_3___d2039,
       bram_serverAdapterB_3_cnt_39_SLT_3___d2040,
       bram_serverAdapterB_cnt_5_SLT_3___d2037,
       edp_fabMeta_444_BIT_128_445_AND_NOT_edp_fabMet_ETC___d1568,
       edp_fhFsm_abort_whas__257_AND_edp_fhFsm_abort__ETC___d1325,
       edp_igPtr_753_ULE_1___d1754,
       edp_mhFsm_abort_whas__331_AND_edp_mhFsm_abort__ETC___d1422,
       edp_outBF_rRdPtr_83_EQ_edp_outBF_rWrPtr_18___d1455,
       edp_outDwRemain_622_ULE_4___d1624,
       edp_rcvPtr_824_ULE_5___d1825,
       edp_tlpBRAM_mReqF_first__82_BIT_60_66_OR_IF_ed_ETC___d977,
       edp_tlpBRAM_mReqF_first__82_BIT_63_83_OR_IF_ed_ETC___d798,
       edp_tlpBRAM_rdRespDwRemain_188_ULE_4___d1190,
       edp_tlpBRAM_readRemainDWLen_010_ULE_4___d1011,
       edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772,
       edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773,
       edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771,
       hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1451,
       hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1485,
       hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1503,
       hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1606,
       hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1618,
       hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1636,
       wmi_dpControl_whas__024_AND_bram_serverAdapter_ETC___d2070,
       wmi_wmi_operateD_977_AND_wmi_wmi_peerIsReady_9_ETC___d2152;
  // value method wciS0_sResp
  assign wciS0_SResp = wci_respF_q_0[33:32] ;
  // value method wciS0_sData
  assign wciS0_SData = wci_respF_q_0[31:0] ;
  // value method wciS0_sThreadBusy
  assign wciS0_SThreadBusy =
	     wci_reqF_countReg > 2'd1 || wci_isReset_isInReset ;
  // value method wciS0_sFlag
  assign wciS0_SFlag = { 1'd1, wci_sFlagReg } ;
  // value method wtiS0_sThreadBusy
  assign wtiS0_SThreadBusy = wti_isReset_isInReset ;
  // value method wtiS0_sReset_n
  assign wtiS0_SReset_n = !wti_isReset_isInReset && wti_operateD ;
  // value method wmiS0_sResp
  assign wmiS0_SResp = wmi_wmi_respF_q_0[33:32] ;
  // value method wmiS0_sData
  assign wmiS0_SData = wmi_wmi_respF_q_0[31:0] ;
  // value method wmiS0_sThreadBusy
  assign wmiS0_SThreadBusy =
	     !wmi_wmi_sThreadBusy_dw$whas || wmi_wmi_sThreadBusy_dw$wget ;
  // value method wmiS0_sDataThreadBusy
  assign wmiS0_SDataThreadBusy =
	     !wmi_wmi_sDataThreadBusy_dw$whas ||
	     wmi_wmi_sDataThreadBusy_dw$wget ;
  // value method wmiS0_sRespLast
  assign wmiS0_SRespLast = 1'd0 ;
  // value method wmiS0_sFlag
  assign wmiS0_SFlag = wmi_wmi_sFlagReg ;
  // value method wmiS0_sReset_n
  assign wmiS0_SReset_n = !wmi_wmi_isReset_isInReset && wmi_wmi_operateD ;
  // action method server_request_put
  assign RDY_server_request_put = edp_inF$FULL_N ;
  // actionvalue method server_response_get
  assign server_response_get =
	     { CASE_edp_outFD_OUT_BITS_39_TO_38_3_0_edp_outF_ETC__q1,
	       edp_outF$D_OUT[37:30],
	       CASE_edp_outFD_OUT_BITS_29_TO_28_3_0_edp_outF_ETC__q2,
	       edp_outF$D_OUT[27:20],
	       CASE_edp_outFD_OUT_BITS_19_TO_18_3_0_edp_outF_ETC__q3,
	       edp_outF$D_OUT[17:10],
	       CASE_edp_outFD_OUT_BITS_9_TO_8_3_0_edp_outFD_ETC__q4,
	       edp_outF$D_OUT[7:0] } ;
  assign RDY_server_response_get = edp_outF$EMPTY_N ;
  // submodule bram_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd11),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(12'd2048)) bram_memory(.CLKA(CLK),
					  .CLKB(CLK),
					  .ADDRA(bram_memory$ADDRA),
					  .ADDRB(bram_memory$ADDRB),
					  .DIA(bram_memory$DIA),
					  .DIB(bram_memory$DIB),
					  .WEA(bram_memory$WEA),
					  .WEB(bram_memory$WEB),
					  .ENA(bram_memory$ENA),
					  .ENB(bram_memory$ENB),
					  .DOA(bram_memory$DOA),
					  .DOB(bram_memory$DOB));
  // submodule bram_memory_1
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd11),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(12'd2048)) bram_memory_1(.CLKA(CLK),
					    .CLKB(CLK),
					    .ADDRA(bram_memory_1$ADDRA),
					    .ADDRB(bram_memory_1$ADDRB),
					    .DIA(bram_memory_1$DIA),
					    .DIB(bram_memory_1$DIB),
					    .WEA(bram_memory_1$WEA),
					    .WEB(bram_memory_1$WEB),
					    .ENA(bram_memory_1$ENA),
					    .ENB(bram_memory_1$ENB),
					    .DOA(bram_memory_1$DOA),
					    .DOB(bram_memory_1$DOB));
  // submodule bram_memory_2
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd11),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(12'd2048)) bram_memory_2(.CLKA(CLK),
					    .CLKB(CLK),
					    .ADDRA(bram_memory_2$ADDRA),
					    .ADDRB(bram_memory_2$ADDRB),
					    .DIA(bram_memory_2$DIA),
					    .DIB(bram_memory_2$DIB),
					    .WEA(bram_memory_2$WEA),
					    .WEB(bram_memory_2$WEB),
					    .ENA(bram_memory_2$ENA),
					    .ENB(bram_memory_2$ENB),
					    .DOA(bram_memory_2$DOA),
					    .DOB(bram_memory_2$DOB));
  // submodule bram_memory_3
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd11),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(12'd2048)) bram_memory_3(.CLKA(CLK),
					    .CLKB(CLK),
					    .ADDRA(bram_memory_3$ADDRA),
					    .ADDRB(bram_memory_3$ADDRB),
					    .DIA(bram_memory_3$DIA),
					    .DIB(bram_memory_3$DIB),
					    .WEA(bram_memory_3$WEA),
					    .WEB(bram_memory_3$WEB),
					    .ENA(bram_memory_3$ENA),
					    .ENB(bram_memory_3$ENB),
					    .DOA(bram_memory_3$DOA),
					    .DOB(bram_memory_3$DOB));
  // submodule bram_serverAdapterA_1_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_serverAdapterA_1_outDataCore(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(bram_serverAdapterA_1_outDataCore$D_IN),
								 .ENQ(bram_serverAdapterA_1_outDataCore$ENQ),
								 .DEQ(bram_serverAdapterA_1_outDataCore$DEQ),
								 .CLR(bram_serverAdapterA_1_outDataCore$CLR),
								 .D_OUT(bram_serverAdapterA_1_outDataCore$D_OUT),
								 .FULL_N(bram_serverAdapterA_1_outDataCore$FULL_N),
								 .EMPTY_N(bram_serverAdapterA_1_outDataCore$EMPTY_N));
  // submodule bram_serverAdapterA_2_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_serverAdapterA_2_outDataCore(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(bram_serverAdapterA_2_outDataCore$D_IN),
								 .ENQ(bram_serverAdapterA_2_outDataCore$ENQ),
								 .DEQ(bram_serverAdapterA_2_outDataCore$DEQ),
								 .CLR(bram_serverAdapterA_2_outDataCore$CLR),
								 .D_OUT(bram_serverAdapterA_2_outDataCore$D_OUT),
								 .FULL_N(bram_serverAdapterA_2_outDataCore$FULL_N),
								 .EMPTY_N(bram_serverAdapterA_2_outDataCore$EMPTY_N));
  // submodule bram_serverAdapterA_3_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_serverAdapterA_3_outDataCore(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(bram_serverAdapterA_3_outDataCore$D_IN),
								 .ENQ(bram_serverAdapterA_3_outDataCore$ENQ),
								 .DEQ(bram_serverAdapterA_3_outDataCore$DEQ),
								 .CLR(bram_serverAdapterA_3_outDataCore$CLR),
								 .D_OUT(bram_serverAdapterA_3_outDataCore$D_OUT),
								 .FULL_N(bram_serverAdapterA_3_outDataCore$FULL_N),
								 .EMPTY_N(bram_serverAdapterA_3_outDataCore$EMPTY_N));
  // submodule bram_serverAdapterA_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_serverAdapterA_outDataCore(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(bram_serverAdapterA_outDataCore$D_IN),
							       .ENQ(bram_serverAdapterA_outDataCore$ENQ),
							       .DEQ(bram_serverAdapterA_outDataCore$DEQ),
							       .CLR(bram_serverAdapterA_outDataCore$CLR),
							       .D_OUT(bram_serverAdapterA_outDataCore$D_OUT),
							       .FULL_N(bram_serverAdapterA_outDataCore$FULL_N),
							       .EMPTY_N(bram_serverAdapterA_outDataCore$EMPTY_N));
  // submodule bram_serverAdapterB_1_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_serverAdapterB_1_outDataCore(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(bram_serverAdapterB_1_outDataCore$D_IN),
								 .ENQ(bram_serverAdapterB_1_outDataCore$ENQ),
								 .DEQ(bram_serverAdapterB_1_outDataCore$DEQ),
								 .CLR(bram_serverAdapterB_1_outDataCore$CLR),
								 .D_OUT(bram_serverAdapterB_1_outDataCore$D_OUT),
								 .FULL_N(bram_serverAdapterB_1_outDataCore$FULL_N),
								 .EMPTY_N(bram_serverAdapterB_1_outDataCore$EMPTY_N));
  // submodule bram_serverAdapterB_2_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_serverAdapterB_2_outDataCore(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(bram_serverAdapterB_2_outDataCore$D_IN),
								 .ENQ(bram_serverAdapterB_2_outDataCore$ENQ),
								 .DEQ(bram_serverAdapterB_2_outDataCore$DEQ),
								 .CLR(bram_serverAdapterB_2_outDataCore$CLR),
								 .D_OUT(bram_serverAdapterB_2_outDataCore$D_OUT),
								 .FULL_N(bram_serverAdapterB_2_outDataCore$FULL_N),
								 .EMPTY_N(bram_serverAdapterB_2_outDataCore$EMPTY_N));
  // submodule bram_serverAdapterB_3_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_serverAdapterB_3_outDataCore(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(bram_serverAdapterB_3_outDataCore$D_IN),
								 .ENQ(bram_serverAdapterB_3_outDataCore$ENQ),
								 .DEQ(bram_serverAdapterB_3_outDataCore$DEQ),
								 .CLR(bram_serverAdapterB_3_outDataCore$CLR),
								 .D_OUT(bram_serverAdapterB_3_outDataCore$D_OUT),
								 .FULL_N(bram_serverAdapterB_3_outDataCore$FULL_N),
								 .EMPTY_N(bram_serverAdapterB_3_outDataCore$EMPTY_N));
  // submodule bram_serverAdapterB_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_serverAdapterB_outDataCore(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(bram_serverAdapterB_outDataCore$D_IN),
							       .ENQ(bram_serverAdapterB_outDataCore$ENQ),
							       .DEQ(bram_serverAdapterB_outDataCore$DEQ),
							       .CLR(bram_serverAdapterB_outDataCore$CLR),
							       .D_OUT(bram_serverAdapterB_outDataCore$D_OUT),
							       .FULL_N(bram_serverAdapterB_outDataCore$FULL_N),
							       .EMPTY_N(bram_serverAdapterB_outDataCore$EMPTY_N));
  // submodule edp_inF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) edp_inF(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(edp_inF$D_IN),
						   .ENQ(edp_inF$ENQ),
						   .DEQ(edp_inF$DEQ),
						   .CLR(edp_inF$CLR),
						   .D_OUT(edp_inF$D_OUT),
						   .FULL_N(edp_inF$FULL_N),
						   .EMPTY_N(edp_inF$EMPTY_N));
  // submodule edp_inProcF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) edp_inProcF(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(edp_inProcF$D_IN),
						       .ENQ(edp_inProcF$ENQ),
						       .DEQ(edp_inProcF$DEQ),
						       .CLR(edp_inProcF$CLR),
						       .D_OUT(edp_inProcF$D_OUT),
						       .FULL_N(edp_inProcF$FULL_N),
						       .EMPTY_N(edp_inProcF$EMPTY_N));
  // submodule edp_outBF_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd11),
	  .DATA_WIDTH(32'd40),
	  .MEMSIZE(12'd2048)) edp_outBF_memory(.CLKA(CLK),
					       .CLKB(CLK),
					       .ADDRA(edp_outBF_memory$ADDRA),
					       .ADDRB(edp_outBF_memory$ADDRB),
					       .DIA(edp_outBF_memory$DIA),
					       .DIB(edp_outBF_memory$DIB),
					       .WEA(edp_outBF_memory$WEA),
					       .WEB(edp_outBF_memory$WEB),
					       .ENA(edp_outBF_memory$ENA),
					       .ENB(edp_outBF_memory$ENB),
					       .DOA(),
					       .DOB(edp_outBF_memory$DOB));
  // submodule edp_outF
  FIFO2 #(.width(32'd40), .guarded(32'd1)) edp_outF(.RST(RST_N),
						    .CLK(CLK),
						    .D_IN(edp_outF$D_IN),
						    .ENQ(edp_outF$ENQ),
						    .DEQ(edp_outF$DEQ),
						    .CLR(edp_outF$CLR),
						    .D_OUT(edp_outF$D_OUT),
						    .FULL_N(edp_outF$FULL_N),
						    .EMPTY_N(edp_outF$EMPTY_N));
  // submodule edp_outFunl_inF
  FIFO2 #(.width(32'd128), .guarded(32'd1)) edp_outFunl_inF(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(edp_outFunl_inF$D_IN),
							    .ENQ(edp_outFunl_inF$ENQ),
							    .DEQ(edp_outFunl_inF$DEQ),
							    .CLR(edp_outFunl_inF$CLR),
							    .D_OUT(edp_outFunl_inF$D_OUT),
							    .FULL_N(edp_outFunl_inF$FULL_N),
							    .EMPTY_N(edp_outFunl_inF$EMPTY_N));
  // submodule edp_outFunl_outF
  FIFO2 #(.width(32'd32), .guarded(32'd1)) edp_outFunl_outF(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(edp_outFunl_outF$D_IN),
							    .ENQ(edp_outFunl_outF$ENQ),
							    .DEQ(edp_outFunl_outF$DEQ),
							    .CLR(edp_outFunl_outF$CLR),
							    .D_OUT(edp_outFunl_outF$D_OUT),
							    .FULL_N(edp_outFunl_outF$FULL_N),
							    .EMPTY_N(edp_outFunl_outF$EMPTY_N));
  // submodule edp_outTF
  FIFO20 #(.guarded(32'd1)) edp_outTF(.RST(RST_N),
				      .CLK(CLK),
				      .ENQ(edp_outTF$ENQ),
				      .DEQ(edp_outTF$DEQ),
				      .CLR(edp_outTF$CLR),
				      .FULL_N(edp_outTF$FULL_N),
				      .EMPTY_N(edp_outTF$EMPTY_N));
  // submodule edp_tailEventF
  FIFO2 #(.width(32'd1), .guarded(32'd1)) edp_tailEventF(.RST(RST_N),
							 .CLK(CLK),
							 .D_IN(edp_tailEventF$D_IN),
							 .ENQ(edp_tailEventF$ENQ),
							 .DEQ(edp_tailEventF$DEQ),
							 .CLR(edp_tailEventF$CLR),
							 .D_OUT(edp_tailEventF$D_OUT),
							 .FULL_N(edp_tailEventF$FULL_N),
							 .EMPTY_N(edp_tailEventF$EMPTY_N));
  // submodule edp_tlpBRAM_mReqF
  FIFO2 #(.width(32'd130), .guarded(32'd1)) edp_tlpBRAM_mReqF(.RST(RST_N),
							      .CLK(CLK),
							      .D_IN(edp_tlpBRAM_mReqF$D_IN),
							      .ENQ(edp_tlpBRAM_mReqF$ENQ),
							      .DEQ(edp_tlpBRAM_mReqF$DEQ),
							      .CLR(edp_tlpBRAM_mReqF$CLR),
							      .D_OUT(edp_tlpBRAM_mReqF$D_OUT),
							      .FULL_N(edp_tlpBRAM_mReqF$FULL_N),
							      .EMPTY_N(edp_tlpBRAM_mReqF$EMPTY_N));
  // submodule edp_tlpBRAM_mRespF
  FIFO2 #(.width(32'd139), .guarded(32'd1)) edp_tlpBRAM_mRespF(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(edp_tlpBRAM_mRespF$D_IN),
							       .ENQ(edp_tlpBRAM_mRespF$ENQ),
							       .DEQ(edp_tlpBRAM_mRespF$DEQ),
							       .CLR(edp_tlpBRAM_mRespF$CLR),
							       .D_OUT(edp_tlpBRAM_mRespF$D_OUT),
							       .FULL_N(edp_tlpBRAM_mRespF$FULL_N),
							       .EMPTY_N(edp_tlpBRAM_mRespF$EMPTY_N));
  // submodule edp_tlpBRAM_readReq
  FIFO2 #(.width(32'd61), .guarded(32'd1)) edp_tlpBRAM_readReq(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(edp_tlpBRAM_readReq$D_IN),
							       .ENQ(edp_tlpBRAM_readReq$ENQ),
							       .DEQ(edp_tlpBRAM_readReq$DEQ),
							       .CLR(edp_tlpBRAM_readReq$CLR),
							       .D_OUT(edp_tlpBRAM_readReq$D_OUT),
							       .FULL_N(edp_tlpBRAM_readReq$FULL_N),
							       .EMPTY_N(edp_tlpBRAM_readReq$EMPTY_N));
  // submodule wci_reqF
  SizedFIFO #(.p1width(32'd72),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wci_reqF(.RST(RST_N),
					.CLK(CLK),
					.D_IN(wci_reqF$D_IN),
					.ENQ(wci_reqF$ENQ),
					.DEQ(wci_reqF$DEQ),
					.CLR(wci_reqF$CLR),
					.D_OUT(wci_reqF$D_OUT),
					.FULL_N(),
					.EMPTY_N(wci_reqF$EMPTY_N));
  // submodule wmi_wmi_dhF
  SizedFIFO #(.p1width(32'd38),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wmi_wmi_dhF(.RST(RST_N),
					   .CLK(CLK),
					   .D_IN(wmi_wmi_dhF$D_IN),
					   .ENQ(wmi_wmi_dhF$ENQ),
					   .DEQ(wmi_wmi_dhF$DEQ),
					   .CLR(wmi_wmi_dhF$CLR),
					   .D_OUT(wmi_wmi_dhF$D_OUT),
					   .FULL_N(wmi_wmi_dhF$FULL_N),
					   .EMPTY_N(wmi_wmi_dhF$EMPTY_N));
  // submodule wmi_wmi_mFlagF
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wmi_wmi_mFlagF(.RST(RST_N),
					      .CLK(CLK),
					      .D_IN(wmi_wmi_mFlagF$D_IN),
					      .ENQ(wmi_wmi_mFlagF$ENQ),
					      .DEQ(wmi_wmi_mFlagF$DEQ),
					      .CLR(wmi_wmi_mFlagF$CLR),
					      .D_OUT(wmi_wmi_mFlagF$D_OUT),
					      .FULL_N(wmi_wmi_mFlagF$FULL_N),
					      .EMPTY_N(wmi_wmi_mFlagF$EMPTY_N));
  // submodule wmi_wmi_reqF
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wmi_wmi_reqF(.RST(RST_N),
					    .CLK(CLK),
					    .D_IN(wmi_wmi_reqF$D_IN),
					    .ENQ(wmi_wmi_reqF$ENQ),
					    .DEQ(wmi_wmi_reqF$DEQ),
					    .CLR(wmi_wmi_reqF$CLR),
					    .D_OUT(wmi_wmi_reqF$D_OUT),
					    .FULL_N(wmi_wmi_reqF$FULL_N),
					    .EMPTY_N(wmi_wmi_reqF$EMPTY_N));
  // rule RL_wci_cfrd
  assign WILL_FIRE_RL_wci_cfrd =
	     wci_respF_c_r != 2'd2 && wci_reqF$EMPTY_N &&
	     wci_wci_cfrd_pw$whas &&
	     !WILL_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_ctl_op_start
  assign WILL_FIRE_RL_wci_ctl_op_start =
	     wci_reqF$EMPTY_N && wci_wci_ctrl_pw$whas &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_edp_dmaRequestNearMeta
  assign WILL_FIRE_RL_edp_dmaRequestNearMeta =
	     edp_tlpBRAM_mReqF$FULL_N &&
	     edp_fhFsm_abort_whas__257_AND_edp_fhFsm_abort__ETC___d1325 &&
	     !edp_fhFsm_start_reg &&
	     hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1451 &&
	     edp_postSeqDwell == 4'd0 &&
	     edp_outBF_rRdPtr_83_EQ_edp_outBF_rWrPtr_18___d1455 &&
	     !edp_outTF$EMPTY_N &&
	     edp_frmAckOK ;
  // rule RL_edp_drain_outFunl
  assign WILL_FIRE_RL_edp_drain_outFunl =
	     NOT_edp_outBF_rRdPtr_83_PLUS_1024_283_EQ_edp_o_ETC___d1285 &&
	     edp_outFunl_outF$EMPTY_N ;
  // rule RL_edp_send_mesgMH
  assign CAN_FIRE_RL_edp_send_mesgMH =
	     edp_mhFsm_abort_whas__331_AND_edp_mhFsm_abort__ETC___d1422 &&
	     !edp_mhFsm_start_reg &&
	     edp_doMesgMH &&
	     !edp_outFunl_inF$EMPTY_N &&
	     !edp_outFunl_outF$EMPTY_N ;
  assign WILL_FIRE_RL_edp_send_mesgMH =
	     CAN_FIRE_RL_edp_send_mesgMH &&
	     !WILL_FIRE_RL_edp_dmaResponseNearMetaBody &&
	     !WILL_FIRE_RL_edp_dmaResponseNearMetaHead &&
	     !WILL_FIRE_RL_edp_send_metaMH ;
  // rule RL_edp_dmaPushRequestMesg
  assign WILL_FIRE_RL_edp_dmaPushRequestMesg =
	     edp_tlpBRAM_mReqF$FULL_N && hasPush && dpControl[7:4] == 4'd0 &&
	     dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     edp_fabMeta_444_BIT_128_445_AND_NOT_edp_fabMet_ETC___d1568 &&
	     !WILL_FIRE_RL_edp_dmaResponseNearMetaBody ;
  // rule RL_edp_dmaResponseNearMetaHead
  assign WILL_FIRE_RL_edp_dmaResponseNearMetaHead =
	     edp_tlpBRAM_mRespF$EMPTY_N &&
	     hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1485 ;
  // rule RL_edp_dmaPushResponseHeader
  assign WILL_FIRE_RL_edp_dmaPushResponseHeader =
	     edp_tlpBRAM_mRespF$EMPTY_N &&
	     hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1606 ;
  // rule RL_edp_dmaXmtMetaHead
  assign WILL_FIRE_RL_edp_dmaXmtMetaHead =
	     hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1636 &&
	     !WILL_FIRE_RL_edp_dmaPushResponseHeader ;
  // rule RL_edp_dmaPushResponseBody
  assign WILL_FIRE_RL_edp_dmaPushResponseBody =
	     edp_tlpBRAM_mRespF$EMPTY_N && edp_outFunl_inF$FULL_N &&
	     hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1618 &&
	     !WILL_FIRE_RL_edp_send_mesgMH ;
  // rule RL_edp_send_metaMH
  assign CAN_FIRE_RL_edp_send_metaMH =
	     edp_mhFsm_abort_whas__331_AND_edp_mhFsm_abort__ETC___d1422 &&
	     !edp_mhFsm_start_reg &&
	     edp_doMetaMH &&
	     edp_fhFsm_abort_whas__257_AND_edp_fhFsm_abort__ETC___d1325 &&
	     !edp_fhFsm_start_reg ;
  assign WILL_FIRE_RL_edp_send_metaMH =
	     CAN_FIRE_RL_edp_send_metaMH &&
	     !WILL_FIRE_RL_edp_dmaRequestNearMeta ;
  // rule RL_edp_dmaXmtDoorbell
  assign WILL_FIRE_RL_edp_dmaXmtDoorbell =
	     edp_tailEventF$FULL_N && dpControl[1:0] == 2'd2 &&
	     edp_creditReady &&
	     edp_doorSeqDwell == 4'd0 ;
  // rule RL_edp_rcv_completion
  assign WILL_FIRE_RL_edp_rcv_completion = hasPull && edp_rcvDoCompletion ;
  // rule RL_edp_rcv_message
  assign CAN_FIRE_RL_edp_rcv_message =
	     edp_inProcF$EMPTY_N &&
	     (edp_rcvPtr_824_ULE_5___d1825 || edp_rcvDL == 16'd0 ||
	      edp_tlpBRAM_mReqF$FULL_N) &&
	     hasPull ;
  assign WILL_FIRE_RL_edp_rcv_message =
	     CAN_FIRE_RL_edp_rcv_message &&
	     !WILL_FIRE_RL_edp_dmaPushRequestMesg &&
	     !WILL_FIRE_RL_edp_dmaRequestNearMeta ;
  // rule RL_edp_dmaXmtTailEvent
  assign CAN_FIRE_RL_edp_dmaXmtTailEvent =
	     NOT_edp_outBF_rRdPtr_83_PLUS_1024_283_EQ_edp_o_ETC___d1285 &&
	     edp_tailEventF$FULL_N &&
	     edp_outTF$FULL_N &&
	     hasPush &&
	     dpControl[7:4] == 4'd0 &&
	     dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     edp_fabMeta[128] &&
	     edp_tlpMetaSent ;
  assign WILL_FIRE_RL_edp_dmaXmtTailEvent =
	     CAN_FIRE_RL_edp_dmaXmtTailEvent &&
	     !WILL_FIRE_RL_edp_drain_outFunl ;
  // rule RL_edp_dmaXmtMetaBody
  assign WILL_FIRE_RL_edp_dmaXmtMetaBody =
	     hasPush && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     edp_fabMeta[128] &&
	     edp_doXmtMetaBody &&
	     !WILL_FIRE_RL_edp_dmaXmtMetaHead ;
  // rule RL_edp_dmaResponseNearMetaBody
  assign WILL_FIRE_RL_edp_dmaResponseNearMetaBody =
	     edp_tlpBRAM_mRespF$EMPTY_N && edp_outFunl_inF$FULL_N &&
	     hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1503 &&
	     !WILL_FIRE_RL_edp_send_metaMH &&
	     !WILL_FIRE_RL_edp_dmaRequestNearMeta ;
  // rule RL_edp_dmaTailEventSender
  assign CAN_FIRE_RL_edp_dmaTailEventSender =
	     edp_tailEventF$EMPTY_N &&
	     (!edp_tlpXmtBusy && !edp_sentTail4DWHeader &&
	      edp_postSeqDwell == 4'd0 ||
	      edp_tlpXmtBusy && edp_sentTail4DWHeader) ;
  assign WILL_FIRE_RL_edp_dmaTailEventSender =
	     CAN_FIRE_RL_edp_dmaTailEventSender &&
	     !(edp_postSeqDwell != 4'd0) &&
	     !WILL_FIRE_RL_edp_dmaXmtMetaBody &&
	     !WILL_FIRE_RL_edp_dmaXmtMetaHead &&
	     !WILL_FIRE_RL_edp_dmaPushResponseBody &&
	     !WILL_FIRE_RL_edp_dmaPushResponseHeader &&
	     !WILL_FIRE_RL_edp_dmaRequestNearMeta ;
  // rule RL_edp_tlpBRAM_writeReq
  assign WILL_FIRE_RL_edp_tlpBRAM_writeReq =
	     edp_tlpBRAM_mReqF$EMPTY_N &&
	     edp_tlpBRAM_mReqF_first__82_BIT_63_83_OR_IF_ed_ETC___d798 &&
	     edp_tlpBRAM_mReqF$D_OUT[129:128] == 2'd0 ;
  // rule RL_edp_tlpBRAM_writeData
  assign WILL_FIRE_RL_edp_tlpBRAM_writeData =
	     edp_tlpBRAM_mReqF$EMPTY_N &&
	     (IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d839 ||
	      bram_serverAdapterA_cnt_6_SLT_3___d2767) &&
	     IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d872 &&
	     edp_tlpBRAM_mReqF$D_OUT[129:128] == 2'd1 ;
  // rule RL_edp_tlpBRAM_read_FirstReq
  assign WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq =
	     edp_tlpBRAM_mReqF$EMPTY_N && edp_tlpBRAM_readReq$FULL_N &&
	     edp_tlpBRAM_mReqF_first__82_BIT_60_66_OR_IF_ed_ETC___d977 &&
	     !edp_tlpBRAM_readStarted &&
	     edp_tlpBRAM_mReqF$D_OUT[129:128] != 2'd0 &&
	     edp_tlpBRAM_mReqF$D_OUT[129:128] != 2'd1 ;
  // rule RL_edp_tlpBRAM_read_NextReq
  assign WILL_FIRE_RL_edp_tlpBRAM_read_NextReq =
	     bram_serverAdapterA_cnt_6_SLT_3___d2767 &&
	     bram_serverAdapterA_1_cnt_44_SLT_3___d2765 &&
	     bram_serverAdapterA_2_cnt_62_SLT_3___d2838 &&
	     bram_serverAdapterA_3_cnt_80_SLT_3___d2766 &&
	     edp_tlpBRAM_mReqF$EMPTY_N &&
	     edp_tlpBRAM_readStarted &&
	     edp_tlpBRAM_mReqF$D_OUT[129:128] != 2'd0 &&
	     edp_tlpBRAM_mReqF$D_OUT[129:128] != 2'd1 ;
  // rule RL_edp_tlpBRAM_read_FirstResp
  assign WILL_FIRE_RL_edp_tlpBRAM_read_FirstResp =
	     edp_tlpBRAM_readReq$EMPTY_N && edp_tlpBRAM_mRespF$FULL_N &&
	     (edp_tlpBRAM_readReq$D_OUT[60] ||
	      IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d1085) &&
	     !edp_tlpBRAM_readHeaderSent ;
  // rule RL_edp_tlpBRAM_read_NextResp
  assign WILL_FIRE_RL_edp_tlpBRAM_read_NextResp =
	     edp_tlpBRAM_readReq$EMPTY_N &&
	     bram_serverAdapterA_outDataCore_notEmpty_OR_br_ETC___d1159 &&
	     edp_tlpBRAM_readHeaderSent ;
  // rule RL_bram_serverAdapterA_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_serverAdapterA_outData_enqAndDeq =
	     bram_serverAdapterA_outDataCore$EMPTY_N &&
	     bram_serverAdapterA_outDataCore$FULL_N &&
	     bram_serverAdapterA_outData_deqCalled$whas &&
	     bram_serverAdapterA_outData_enqData$whas ;
  // rule RL_bram_serverAdapterA_1_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_serverAdapterA_1_outData_enqAndDeq =
	     bram_serverAdapterA_1_outDataCore$EMPTY_N &&
	     bram_serverAdapterA_1_outDataCore$FULL_N &&
	     bram_serverAdapterA_1_outData_deqCalled$whas &&
	     bram_serverAdapterA_1_outData_enqData$whas ;
  // rule RL_bram_serverAdapterA_2_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_serverAdapterA_2_outData_enqAndDeq =
	     bram_serverAdapterA_2_outDataCore$EMPTY_N &&
	     bram_serverAdapterA_2_outDataCore$FULL_N &&
	     bram_serverAdapterA_2_outData_deqCalled$whas &&
	     bram_serverAdapterA_2_outData_enqData$whas ;
  // rule RL_bram_serverAdapterA_3_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_serverAdapterA_3_outData_enqAndDeq =
	     bram_serverAdapterA_3_outDataCore$EMPTY_N &&
	     bram_serverAdapterA_3_outDataCore$FULL_N &&
	     bram_serverAdapterA_3_outData_deqCalled$whas &&
	     bram_serverAdapterA_3_outData_enqData$whas ;
  // rule RL_edp_fhFsm_action_l185c11
  assign WILL_FIRE_RL_edp_fhFsm_action_l185c11 =
	     NOT_edp_outBF_rRdPtr_83_PLUS_1024_283_EQ_edp_o_ETC___d1285 &&
	     edp_fhFsm_state_mkFSMstate == 3'd1 &&
	     !WILL_FIRE_RL_edp_dmaXmtTailEvent &&
	     !WILL_FIRE_RL_edp_drain_outFunl ;
  // rule RL_edp_fhFsm_action_l186c11
  assign WILL_FIRE_RL_edp_fhFsm_action_l186c11 =
	     NOT_edp_outBF_rRdPtr_83_PLUS_1024_283_EQ_edp_o_ETC___d1285 &&
	     edp_fhFsm_state_mkFSMstate == 3'd2 &&
	     !WILL_FIRE_RL_edp_dmaXmtTailEvent &&
	     !WILL_FIRE_RL_edp_drain_outFunl ;
  // rule RL_edp_ingress
  assign WILL_FIRE_RL_edp_ingress =
	     edp_inF$EMPTY_N &&
	     (!hasPull || edp_igPtr_753_ULE_1___d1754 || edp_inProcF$FULL_N) ;
  // rule RL_edp_fhFsm_fsm_start
  assign WILL_FIRE_RL_edp_fhFsm_fsm_start =
	     edp_fhFsm_abort_whas__257_AND_edp_fhFsm_abort__ETC___d1325 &&
	     edp_fhFsm_start_reg ;
  // rule RL_edp_fhFsm_action_l184c11
  assign WILL_FIRE_RL_edp_fhFsm_action_l184c11 =
	     NOT_edp_outBF_rRdPtr_83_PLUS_1024_283_EQ_edp_o_ETC___d1285 &&
	     edp_fhFsm_start_reg_1_1$whas &&
	     (edp_fhFsm_state_mkFSMstate == 3'd0 ||
	      edp_fhFsm_state_mkFSMstate == 3'd3) &&
	     !WILL_FIRE_RL_edp_dmaXmtTailEvent &&
	     !WILL_FIRE_RL_edp_drain_outFunl ;
  // rule RL_edp_fhFsm_idle_l183c3
  assign WILL_FIRE_RL_edp_fhFsm_idle_l183c3 =
	     !edp_fhFsm_start_reg_1_1$whas &&
	     edp_fhFsm_state_mkFSMstate == 3'd3 ;
  // rule RL_edp_mhFsm_action_l193c11
  assign WILL_FIRE_RL_edp_mhFsm_action_l193c11 =
	     NOT_edp_outBF_rRdPtr_83_PLUS_1024_283_EQ_edp_o_ETC___d1285 &&
	     edp_mhFsm_state_mkFSMstate == 4'd1 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l184c11 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l186c11 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l185c11 &&
	     !WILL_FIRE_RL_edp_dmaXmtTailEvent &&
	     !WILL_FIRE_RL_edp_drain_outFunl ;
  // rule RL_edp_mhFsm_action_l194c11
  assign WILL_FIRE_RL_edp_mhFsm_action_l194c11 =
	     NOT_edp_outBF_rRdPtr_83_PLUS_1024_283_EQ_edp_o_ETC___d1285 &&
	     edp_mhFsm_state_mkFSMstate == 4'd2 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l184c11 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l186c11 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l185c11 &&
	     !WILL_FIRE_RL_edp_dmaXmtTailEvent &&
	     !WILL_FIRE_RL_edp_drain_outFunl ;
  // rule RL_edp_mhFsm_action_l195c11
  assign WILL_FIRE_RL_edp_mhFsm_action_l195c11 =
	     NOT_edp_outBF_rRdPtr_83_PLUS_1024_283_EQ_edp_o_ETC___d1285 &&
	     edp_mhFsm_state_mkFSMstate == 4'd3 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l184c11 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l186c11 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l185c11 &&
	     !WILL_FIRE_RL_edp_dmaXmtTailEvent &&
	     !WILL_FIRE_RL_edp_drain_outFunl ;
  // rule RL_edp_mhFsm_action_l196c11
  assign WILL_FIRE_RL_edp_mhFsm_action_l196c11 =
	     NOT_edp_outBF_rRdPtr_83_PLUS_1024_283_EQ_edp_o_ETC___d1285 &&
	     edp_mhFsm_state_mkFSMstate == 4'd4 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l184c11 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l186c11 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l185c11 &&
	     !WILL_FIRE_RL_edp_dmaXmtTailEvent &&
	     !WILL_FIRE_RL_edp_drain_outFunl ;
  // rule RL_edp_mhFsm_action_l197c11
  assign WILL_FIRE_RL_edp_mhFsm_action_l197c11 =
	     NOT_edp_outBF_rRdPtr_83_PLUS_1024_283_EQ_edp_o_ETC___d1285 &&
	     edp_mhFsm_state_mkFSMstate == 4'd5 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l184c11 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l186c11 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l185c11 &&
	     !WILL_FIRE_RL_edp_dmaXmtTailEvent &&
	     !WILL_FIRE_RL_edp_drain_outFunl ;
  // rule RL_edp_mhFsm_fsm_start
  assign WILL_FIRE_RL_edp_mhFsm_fsm_start =
	     edp_mhFsm_abort_whas__331_AND_edp_mhFsm_abort__ETC___d1422 &&
	     edp_mhFsm_start_reg ;
  // rule RL_edp_mhFsm_action_l192c11
  assign WILL_FIRE_RL_edp_mhFsm_action_l192c11 =
	     NOT_edp_outBF_rRdPtr_83_PLUS_1024_283_EQ_edp_o_ETC___d1285 &&
	     edp_mhFsm_start_wire$whas &&
	     (edp_mhFsm_state_mkFSMstate == 4'd0 ||
	      edp_mhFsm_state_mkFSMstate == 4'd6) &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l184c11 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l186c11 &&
	     !WILL_FIRE_RL_edp_fhFsm_action_l185c11 &&
	     !WILL_FIRE_RL_edp_dmaXmtTailEvent &&
	     !WILL_FIRE_RL_edp_drain_outFunl ;
  // rule RL_edp_mhFsm_idle_l191c3
  assign WILL_FIRE_RL_edp_mhFsm_idle_l191c3 =
	     !edp_mhFsm_start_wire$whas &&
	     edp_mhFsm_state_mkFSMstate == 4'd6 ;
  // rule RL_wmi_reqMetadata
  assign CAN_FIRE_RL_wmi_reqMetadata =
	     bram_serverAdapterB_cnt_5_SLT_3___d2037 &&
	     bram_serverAdapterB_1_cnt_03_SLT_3___d2038 &&
	     bram_serverAdapterB_2_cnt_21_SLT_3___d2039 &&
	     bram_serverAdapterB_3_cnt_39_SLT_3___d2040 &&
	     dpControl[3:2] != 2'd1 &&
	     !wmi_mesgMeta[128] &&
	     wmi_mesgBufReady &&
	     !wmi_metaBusy &&
	     wmi_bufDwell == 2'd0 ;
  assign WILL_FIRE_RL_wmi_reqMetadata =
	     CAN_FIRE_RL_wmi_reqMetadata && !WILL_FIRE_RL_wmi_doReadReq &&
	     !WILL_FIRE_RL_wmi_doWriteReq &&
	     !WILL_FIRE_RL_wmi_doWriteFinalize ;
  // rule RL_wmi_doWriteFinalize
  assign WILL_FIRE_RL_wmi_doWriteFinalize =
	     wmi_wmi_operateD_977_AND_wmi_wmi_peerIsReady_9_ETC___d2152 &&
	     wmi_wrFinalize ;
  // rule RL_wmi_respMetadata
  assign CAN_FIRE_RL_wmi_respMetadata =
	     wmi_wmi_operateD && wmi_wmi_peerIsReady &&
	     wmi_dpControl_whas__024_AND_bram_serverAdapter_ETC___d2070 &&
	     dpControl[3:2] != 2'd1 &&
	     !wmi_mesgMeta[128] &&
	     wmi_mesgBufReady &&
	     wmi_metaBusy ;
  assign WILL_FIRE_RL_wmi_respMetadata =
	     CAN_FIRE_RL_wmi_respMetadata && !WILL_FIRE_RL_wmi_doReadResp ;
  // rule RL_wmi_doReadReq
  assign WILL_FIRE_RL_wmi_doReadReq =
	     IF_wmi_addr_116_BITS_3_TO_2_117_EQ_0_118_THEN__ETC___d3312 &&
	     wmi_rdActive &&
	     !WILL_FIRE_RL_wmi_doWriteReq &&
	     !WILL_FIRE_RL_wmi_doWriteFinalize ;
  // rule RL_wmi_doReadResp
  assign WILL_FIRE_RL_wmi_doReadResp =
	     wmi_wmi_respF_c_r != 2'd2 && wmi_wmi_operateD &&
	     wmi_wmi_peerIsReady &&
	     IF_wmi_p4B_173_EQ_0_174_THEN_bram_serverAdapte_ETC___d2187 &&
	     wmi_bytesRemainResp != 14'd0 ;
  // rule RL_bram_serverAdapterB_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_serverAdapterB_outData_enqAndDeq =
	     bram_serverAdapterB_outDataCore$EMPTY_N &&
	     bram_serverAdapterB_outDataCore$FULL_N &&
	     bram_serverAdapterB_outData_deqCalled$whas &&
	     bram_serverAdapterB_outData_enqData$whas ;
  // rule RL_bram_serverAdapterB_1_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_serverAdapterB_1_outData_enqAndDeq =
	     bram_serverAdapterB_1_outDataCore$EMPTY_N &&
	     bram_serverAdapterB_1_outDataCore$FULL_N &&
	     bram_serverAdapterB_1_outData_deqCalled$whas &&
	     bram_serverAdapterB_1_outData_enqData$whas ;
  // rule RL_bram_serverAdapterB_2_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_serverAdapterB_2_outData_enqAndDeq =
	     bram_serverAdapterB_2_outDataCore$EMPTY_N &&
	     bram_serverAdapterB_2_outDataCore$FULL_N &&
	     bram_serverAdapterB_2_outData_deqCalled$whas &&
	     bram_serverAdapterB_2_outData_enqData$whas ;
  // rule RL_bram_serverAdapterB_3_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_serverAdapterB_3_outData_enqAndDeq =
	     bram_serverAdapterB_3_outDataCore$EMPTY_N &&
	     bram_serverAdapterB_3_outDataCore$FULL_N &&
	     bram_serverAdapterB_3_outData_deqCalled$whas &&
	     bram_serverAdapterB_3_outData_enqData$whas ;
  // rule RL_wmi_getRequest
  assign CAN_FIRE_RL_wmi_getRequest =
	     wmi_wmi_operateD && wmi_wmi_peerIsReady && !wmi_wmi_blockReq &&
	     wmi_wmi_reqF$EMPTY_N &&
	     NOT_wmi_wrActive_088_089_OR_NOT_wmi_rdActive_0_ETC___d2098 &&
	     wmi_bufDwell == 2'd0 ;
  assign WILL_FIRE_RL_wmi_getRequest =
	     CAN_FIRE_RL_wmi_getRequest && !WILL_FIRE_RL_wmi_doReadReq &&
	     !WILL_FIRE_RL_wmi_doWriteReq ;
  // rule RL_wmi_doWriteReq
  assign CAN_FIRE_RL_wmi_doWriteReq =
	     wmi_wmi_operateD && wmi_wmi_peerIsReady && wmi_wmi_dhF$EMPTY_N &&
	     IF_wmi_addr_116_BITS_3_TO_2_117_EQ_0_118_THEN__ETC___d3312 &&
	     wmi_wrActive ;
  assign WILL_FIRE_RL_wmi_doWriteReq =
	     CAN_FIRE_RL_wmi_doWriteReq && !WILL_FIRE_RL_wmi_doWriteFinalize ;
  // rule RL_wmi_wmi_respF_incCtr
  assign WILL_FIRE_RL_wmi_wmi_respF_incCtr =
	     ((wmi_wmi_respF_c_r == 2'd0) ?
		WILL_FIRE_RL_wmi_doReadResp :
		wmi_wmi_respF_c_r != 2'd1 || WILL_FIRE_RL_wmi_doReadResp) &&
	     WILL_FIRE_RL_wmi_doReadResp &&
	     !(wmi_wmi_respF_c_r != 2'd0) ;
  // rule RL_wmi_wmi_respF_decCtr
  assign WILL_FIRE_RL_wmi_wmi_respF_decCtr =
	     wmi_wmi_respF_c_r != 2'd0 && !WILL_FIRE_RL_wmi_doReadResp ;
  // rule RL_wmi_wmi_respF_both
  assign WILL_FIRE_RL_wmi_wmi_respF_both =
	     ((wmi_wmi_respF_c_r == 2'd1) ?
		WILL_FIRE_RL_wmi_doReadResp :
		wmi_wmi_respF_c_r != 2'd2 || WILL_FIRE_RL_wmi_doReadResp) &&
	     wmi_wmi_respF_c_r != 2'd0 &&
	     WILL_FIRE_RL_wmi_doReadResp ;
  // rule RL_bml_fba
  assign WILL_FIRE_RL_bml_fba = wci_cState == 3'd2 && dpControl[1:0] == 2'd1 ;
  // rule RL_bml_lcredit
  assign WILL_FIRE_RL_bml_lcredit =
	     wci_cState == 3'd2 && dpControl[1:0] == 2'd2 ;
  // rule RL_bml_lclAdvance
  assign WILL_FIRE_RL_bml_lclAdvance = wci_cState == 3'd2 && bml_lclBufDone ;
  // rule RL_bml_remAdvance
  assign CAN_FIRE_RL_bml_remAdvance = wci_cState == 3'd2 && bml_remDone ;
  assign WILL_FIRE_RL_bml_remAdvance =
	     CAN_FIRE_RL_bml_remAdvance && !WILL_FIRE_RL_bml_crdAdvance ;
  // rule RL_bml_crdAdvance
  assign WILL_FIRE_RL_bml_crdAdvance =
	     wci_cState == 3'd2 && dpControl[1:0] == 2'd2 && bml_remStart ;
  // rule RL_bml_initAccumulators
  assign WILL_FIRE_RL_bml_initAccumulators =
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd1 &&
	     wci_reqF$D_OUT[36:34] == 3'd1 ;
  // rule RL_wci_cfwr
  assign WILL_FIRE_RL_wci_cfwr =
	     wci_respF_c_r != 2'd2 && wci_reqF$EMPTY_N &&
	     wci_wci_cfwr_pw$whas &&
	     !WILL_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_ctl_op_complete
  assign WILL_FIRE_RL_wci_ctl_op_complete =
	     wci_respF_c_r != 2'd2 && wci_ctlOpActive && wci_ctlAckReg ;
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
  // rule RL_wmi_wmi_reqF_reset
  assign WILL_FIRE_RL_wmi_wmi_reqF_reset =
	     MUX_wmi_wmi_reqF_levelsValid$write_1__SEL_2 ||
	     WILL_FIRE_RL_wmi_getRequest ;
  // rule RL_wmi_wmi_mFlagF_reset
  assign WILL_FIRE_RL_wmi_wmi_mFlagF_reset =
	     MUX_wmi_wmi_mFlagF_levelsValid$write_1__SEL_2 ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  // rule RL_wmi_wmi_dhF_reset
  assign WILL_FIRE_RL_wmi_wmi_dhF_reset =
	     MUX_wmi_wmi_dhF_levelsValid$write_1__SEL_2 ||
	     WILL_FIRE_RL_wmi_doWriteReq ;
  // inputs to muxes for submodule ports
  assign MUX_bml_fabBufsAvail$write_1__SEL_1 =
	     WILL_FIRE_RL_bml_fba &&
	     (bml_fabAvail && !bml_remStart ||
	      !bml_fabAvail && bml_remStart) ;
  assign MUX_bml_fabFlowAddr$write_1__SEL_1 =
	     WILL_FIRE_RL_bml_remAdvance && dpControl[1:0] == 2'd1 ;
  assign MUX_bml_lclBufsAR$write_1__SEL_1 =
	     wci_cState == 3'd2 &&
	     (IF_bml_dpControl_wget__290_BITS_1_TO_0_296_EQ__ETC___d2367 &&
	      !bml_lclBufStart ||
	      CASE_dpControl_BITS_1_TO_0_NOT_bml_fabDone_0_N_ETC__q10 &&
	      bml_lclBufStart) ;
  assign MUX_bml_lclBufsCF$write_1__SEL_1 =
	     wci_cState == 3'd2 &&
	     (bml_lclBufDone_314_AND_IF_bml_dpControl_wget___ETC___d2911 ||
	      NOT_bml_lclBufDone_314_381_AND_IF_bml_dpContro_ETC___d2394) ;
  assign MUX_bml_lclCredit$write_1__SEL_1 =
	     WILL_FIRE_RL_bml_lcredit &&
	     (bml_lclBufDone && !bml_remStart ||
	      !bml_lclBufDone && bml_remStart) ;
  assign MUX_bram_memory$a_put_1__SEL_1 =
	     WILL_FIRE_RL_edp_tlpBRAM_writeReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[63] &&
	     edp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd0 ;
  assign MUX_bram_memory$a_put_1__SEL_2 =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[60] &&
	     edp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd0 ;
  assign MUX_bram_memory$a_put_1__SEL_3 =
	     WILL_FIRE_RL_edp_tlpBRAM_writeData &&
	     IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2899 ;
  assign MUX_bram_memory$b_put_1__SEL_1 =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd0 ;
  assign MUX_bram_memory$b_put_1__SEL_2 =
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd0 ;
  assign MUX_bram_memory_1$a_put_1__SEL_1 =
	     WILL_FIRE_RL_edp_tlpBRAM_writeReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[63] &&
	     edp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd1 ;
  assign MUX_bram_memory_1$a_put_1__SEL_2 =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[60] &&
	     edp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd1 ;
  assign MUX_bram_memory_1$a_put_1__SEL_3 =
	     WILL_FIRE_RL_edp_tlpBRAM_writeData &&
	     IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2900 ;
  assign MUX_bram_memory_1$b_put_1__SEL_1 =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd1 ;
  assign MUX_bram_memory_1$b_put_1__SEL_2 =
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd1 ;
  assign MUX_bram_memory_2$a_put_1__SEL_1 =
	     WILL_FIRE_RL_edp_tlpBRAM_writeReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[63] &&
	     edp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd2 ;
  assign MUX_bram_memory_2$a_put_1__SEL_2 =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[60] &&
	     edp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd2 ;
  assign MUX_bram_memory_2$a_put_1__SEL_3 =
	     WILL_FIRE_RL_edp_tlpBRAM_writeData &&
	     IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2901 ;
  assign MUX_bram_memory_2$b_put_1__SEL_1 =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd2 ;
  assign MUX_bram_memory_2$b_put_1__SEL_2 =
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd2 ;
  assign MUX_bram_memory_3$a_put_1__SEL_1 =
	     WILL_FIRE_RL_edp_tlpBRAM_writeReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[63] &&
	     edp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd3 ;
  assign MUX_bram_memory_3$a_put_1__SEL_2 =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[60] &&
	     edp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd3 ;
  assign MUX_bram_memory_3$a_put_1__SEL_3 =
	     WILL_FIRE_RL_edp_tlpBRAM_writeData &&
	     IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2902 ;
  assign MUX_bram_memory_3$b_put_1__SEL_1 =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd3 ;
  assign MUX_bram_memory_3$b_put_1__SEL_2 =
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd3 ;
  assign MUX_edp_doorBell_1$wset_1__SEL_1 =
	     WILL_FIRE_RL_edp_ingress && hasPush && x__h97353 != 4'd0 ;
  assign MUX_edp_fabMeta$write_1__SEL_1 =
	     WILL_FIRE_RL_edp_dmaTailEventSender &&
	     (edp_fabFlowAddrMS == 32'd0 || edp_sentTail4DWHeader) ;
  assign MUX_edp_frmAckOK$write_1__SEL_1 =
	     WILL_FIRE_RL_edp_ingress && hasPush ;
  assign MUX_edp_mhFsm_start_reg$write_1__SEL_2 =
	     WILL_FIRE_RL_edp_send_mesgMH || WILL_FIRE_RL_edp_send_metaMH ;
  assign MUX_edp_remDone_1$wset_1__SEL_1 =
	     WILL_FIRE_RL_edp_dmaTailEventSender &&
	     (edp_fabFlowAddrMS == 32'd0 && edp_tailEventF$D_OUT ||
	      edp_fabFlowAddrMS != 32'd0 && !edp_sentTail4DWHeader &&
	      edp_tailEventF$D_OUT) ;
  assign MUX_edp_tlpBRAM_mReqF$enq_1__SEL_1 =
	     WILL_FIRE_RL_edp_rcv_message && !edp_rcvPtr_824_ULE_5___d1825 &&
	     edp_rcvDL != 16'd0 ;
  assign MUX_edp_tlpBRAM_readHeaderSent$write_1__SEL_1 =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstResp &&
	     (edp_tlpBRAM_readReq$D_OUT[28:19] != 10'd1 ||
	      edp_tlpBRAM_readReq$D_OUT[60]) ;
  assign MUX_edp_tlpBRAM_readStarted$write_1__SEL_1 =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq &&
	     (edp_tlpBRAM_mReqF$D_OUT[28:19] != 10'd1 ||
	      edp_tlpBRAM_mReqF$D_OUT[60]) ;
  assign MUX_edp_tlpXmtBusy$write_1__SEL_1 =
	     WILL_FIRE_RL_edp_dmaTailEventSender &&
	     edp_fabFlowAddrMS != 32'd0 ;
  assign MUX_edp_tlpXmtBusy$write_1__SEL_3 =
	     WILL_FIRE_RL_edp_dmaPushResponseBody &&
	     edp_outDwRemain_622_ULE_4___d1624 ;
  assign MUX_edp_xmtMetaOK$write_1__SEL_2 =
	     WILL_FIRE_RL_edp_dmaPushResponseBody &&
	     edp_outDwRemain_622_ULE_4___d1624 &&
	     edp_tlpBRAM_mRespF$D_OUT[135:128] == 8'h01 ;
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
  assign MUX_wmi_bufDwell$write_1__SEL_1 =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_bytesRemainReq == 14'd4 &&
	     wmi_doneWithMesg ;
  assign MUX_wmi_bytesRemainResp$write_1__SEL_1 =
	     WILL_FIRE_RL_wmi_getRequest &&
	     wmi_wmi_reqF$D_OUT[31:29] == 3'd2 ;
  assign MUX_wmi_doneWithMesg$write_1__PSEL_1 =
	     WILL_FIRE_RL_wmi_doReadReq || WILL_FIRE_RL_wmi_doWriteReq ;
  assign MUX_wmi_doneWithMesg$write_1__SEL_1 =
	     MUX_wmi_doneWithMesg$write_1__PSEL_1 &&
	     wmi_bytesRemainReq == 14'd4 &&
	     wmi_doneWithMesg ;
  assign MUX_wmi_rdActive$write_1__SEL_1 =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_bytesRemainReq == 14'd4 ;
  assign MUX_wmi_wmi_dhF_levelsValid$write_1__SEL_2 =
	     wmi_wmi_dhF$FULL_N && wmi_wmi_operateD && wmi_wmi_peerIsReady &&
	     wmi_wmi_wmiDh$wget[37] ;
  assign MUX_wmi_wmi_mFlagF_levelsValid$write_1__SEL_2 =
	     wmi_wmi_mFlagF$FULL_N && wmi_wmi_operateD &&
	     wmi_wmi_peerIsReady &&
	     wmi_wmi_wmiReq$wget[31:29] != 3'd0 &&
	     wmi_wmi_wmiReq$wget[27] ;
  assign MUX_wmi_wmi_reqF_levelsValid$write_1__SEL_2 =
	     wmi_wmi_reqF$FULL_N && wmi_wmi_operateD && wmi_wmi_peerIsReady &&
	     wmi_wmi_wmiReq$wget[31:29] != 3'd0 ;
  assign MUX_wmi_wmi_respF_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_wmi_respF_incCtr && wmi_wmi_respF_c_r == 2'd0 ;
  assign MUX_wmi_wmi_respF_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_wmi_respF_incCtr && wmi_wmi_respF_c_r == 2'd1 ;
  assign MUX_wmi_wrActive$write_1__SEL_1 =
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_bytesRemainReq == 14'd4 ;
  assign MUX_wmi_wrFinalize$write_1__SEL_1 =
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_bytesRemainReq == 14'd4 &&
	     wmi_doneWithMesg ;
  assign MUX_bml_crdBuf_value$write_1__VAL_3 =
	     bml_crdBuf_value_272_EQ_bml_crdBuf_modulus_bw__ETC___d3259 ?
	       16'd0 :
	       bml_crdBuf_value + 16'd1 ;
  assign MUX_bml_fabBuf_value$write_1__VAL_3 =
	     bml_fabBuf_value_257_EQ_bml_fabBuf_modulus_bw__ETC___d3260 ?
	       16'd0 :
	       bml_fabBuf_value + 16'd1 ;
  assign MUX_bml_fabBufsAvail$write_1__VAL_1 =
	     (bml_fabAvail && !bml_remStart) ? x__h122849 : x__h122854 ;
  assign MUX_bml_fabBufsAvail$write_1__VAL_2 =
	     (dpControl[3:2] == 2'd1) ? x__h121490 : 16'd0 ;
  assign MUX_bml_fabFlowAddr$write_1__VAL_1 =
	     bml_fabBuf_value_257_EQ_bml_fabBuf_modulus_bw__ETC___d3260 ?
	       bml_fabFlowBase :
	       bml_fabFlowAddr_329_PLUS_bml_fabFlowSize_330___d3070 ;
  assign MUX_bml_fabFlowAddr$write_1__VAL_3 =
	     bml_crdBuf_value_272_EQ_bml_crdBuf_modulus_bw__ETC___d3259 ?
	       bml_fabFlowBase :
	       bml_fabFlowAddr_329_PLUS_bml_fabFlowSize_330___d3070 ;
  assign MUX_bml_fabMesgAddr$write_1__VAL_1 =
	     bml_fabBuf_value_257_EQ_bml_fabBuf_modulus_bw__ETC___d3260 ?
	       bml_fabMesgBase :
	       bml_fabMesgAddr + bml_fabMesgSize ;
  assign MUX_bml_fabMetaAddr$write_1__VAL_1 =
	     bml_fabBuf_value_257_EQ_bml_fabBuf_modulus_bw__ETC___d3260 ?
	       bml_fabMetaBase :
	       bml_fabMetaAddr + bml_fabMetaSize ;
  assign MUX_bml_lclBuf_value$write_1__VAL_3 =
	     bml_lclBuf_value_227_EQ_bml_lclBuf_modulus_bw__ETC___d3277 ?
	       16'd0 :
	       bml_lclBuf_value + 16'd1 ;
  assign MUX_bml_lclBufsAR$write_1__VAL_1 =
	     (IF_bml_dpControl_wget__290_BITS_1_TO_0_296_EQ__ETC___d2367 &&
	      !bml_lclBufStart) ?
	       x__h122618 :
	       x__h122623 ;
  assign MUX_bml_lclBufsAR$write_1__VAL_2 =
	     (dpControl[3:2] == 2'd1) ? bml_lclNumBufs : 16'd0 ;
  assign MUX_bml_lclBufsCF$write_1__VAL_1 =
	     bml_lclBufDone_314_AND_IF_bml_dpControl_wget___ETC___d2911 ?
	       x__h122730 :
	       x__h122767 ;
  assign MUX_bml_lclBufsCF$write_1__VAL_2 =
	     (dpControl[3:2] == 2'd1) ? 16'd0 : bml_lclNumBufs ;
  assign MUX_bml_lclCredit$write_1__VAL_1 =
	     (bml_lclBufDone && !bml_remStart) ? x__h122888 : x__h122893 ;
  assign MUX_bml_lclMesgAddr$write_1__VAL_2 =
	     bml_lclBuf_value_227_EQ_bml_lclBuf_modulus_bw__ETC___d3277 ?
	       bml_mesgBase :
	       bml_lclMesgAddr + bml_mesgSize ;
  assign MUX_bml_lclMetaAddr$write_1__VAL_2 =
	     bml_lclBuf_value_227_EQ_bml_lclBuf_modulus_bw__ETC___d3277 ?
	       bml_metaBase :
	       bml_lclMetaAddr + bml_metaSize ;
  assign MUX_bml_remBuf_value$write_1__VAL_3 =
	     bml_remBuf_value_242_EQ_bml_remBuf_modulus_bw__ETC___d3278 ?
	       16'd0 :
	       bml_remBuf_value + 16'd1 ;
  assign MUX_bml_remMesgAddr$write_1__VAL_2 =
	     bml_remBuf_value_242_EQ_bml_remBuf_modulus_bw__ETC___d3278 ?
	       bml_mesgBase :
	       bml_remMesgAddr + bml_mesgSize ;
  assign MUX_bml_remMetaAddr$write_1__VAL_2 =
	     bml_remBuf_value_242_EQ_bml_remBuf_modulus_bw__ETC___d3278 ?
	       bml_metaBase :
	       bml_remMetaAddr + bml_metaSize ;
  always@(idx__h26295 or
	  edp_tlpBRAM_writeDWAddr_PLUS_3__q11 or
	  edp_tlpBRAM_writeDWAddr or
	  edp_tlpBRAM_writeDWAddr_PLUS_1__q12 or
	  edp_tlpBRAM_writeDWAddr_PLUS_2__q13)
  begin
    case (idx__h26295)
      2'd0: MUX_bram_memory$a_put_2__VAL_3 = edp_tlpBRAM_writeDWAddr[12:2];
      2'd1:
	  MUX_bram_memory$a_put_2__VAL_3 =
	      edp_tlpBRAM_writeDWAddr_PLUS_1__q12[12:2];
      2'd2:
	  MUX_bram_memory$a_put_2__VAL_3 =
	      edp_tlpBRAM_writeDWAddr_PLUS_2__q13[12:2];
      2'd3:
	  MUX_bram_memory$a_put_2__VAL_3 =
	      edp_tlpBRAM_writeDWAddr_PLUS_3__q11[12:2];
    endcase
  end
  always@(idx__h33375 or
	  edp_tlpBRAM_readNxtDWAddr_PLUS_3__q14 or
	  edp_tlpBRAM_readNxtDWAddr or
	  edp_tlpBRAM_readNxtDWAddr_PLUS_1__q15 or
	  edp_tlpBRAM_readNxtDWAddr_PLUS_2__q16)
  begin
    case (idx__h33375)
      2'd0: MUX_bram_memory$a_put_2__VAL_4 = edp_tlpBRAM_readNxtDWAddr[12:2];
      2'd1:
	  MUX_bram_memory$a_put_2__VAL_4 =
	      edp_tlpBRAM_readNxtDWAddr_PLUS_1__q15[12:2];
      2'd2:
	  MUX_bram_memory$a_put_2__VAL_4 =
	      edp_tlpBRAM_readNxtDWAddr_PLUS_2__q16[12:2];
      2'd3:
	  MUX_bram_memory$a_put_2__VAL_4 =
	      edp_tlpBRAM_readNxtDWAddr_PLUS_3__q14[12:2];
    endcase
  end
  assign MUX_bram_memory$a_put_3__VAL_1 =
	     { edp_tlpBRAM_mReqF$D_OUT[7:0],
	       edp_tlpBRAM_mReqF$D_OUT[15:8],
	       edp_tlpBRAM_mReqF$D_OUT[23:16],
	       edp_tlpBRAM_mReqF$D_OUT[31:24] } ;
  assign MUX_bram_memory$a_put_3__VAL_3 =
	     { IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2940[7:0],
	       IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2940[15:8],
	       IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2940[23:16],
	       IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2940[31:24] } ;
  assign MUX_bram_memory$b_put_2__VAL_1 =
	     wmi_lclMesgAddr[14:4] + { 1'd0, wmi_addr[13:4] } ;
  always@(idx__h28526 or
	  edp_tlpBRAM_writeDWAddr_PLUS_3__q11 or
	  edp_tlpBRAM_writeDWAddr or
	  edp_tlpBRAM_writeDWAddr_PLUS_1__q12 or
	  edp_tlpBRAM_writeDWAddr_PLUS_2__q13)
  begin
    case (idx__h28526)
      2'd0: MUX_bram_memory_1$a_put_2__VAL_3 = edp_tlpBRAM_writeDWAddr[12:2];
      2'd1:
	  MUX_bram_memory_1$a_put_2__VAL_3 =
	      edp_tlpBRAM_writeDWAddr_PLUS_1__q12[12:2];
      2'd2:
	  MUX_bram_memory_1$a_put_2__VAL_3 =
	      edp_tlpBRAM_writeDWAddr_PLUS_2__q13[12:2];
      2'd3:
	  MUX_bram_memory_1$a_put_2__VAL_3 =
	      edp_tlpBRAM_writeDWAddr_PLUS_3__q11[12:2];
    endcase
  end
  always@(idx__h33843 or
	  edp_tlpBRAM_readNxtDWAddr_PLUS_3__q14 or
	  edp_tlpBRAM_readNxtDWAddr or
	  edp_tlpBRAM_readNxtDWAddr_PLUS_1__q15 or
	  edp_tlpBRAM_readNxtDWAddr_PLUS_2__q16)
  begin
    case (idx__h33843)
      2'd0:
	  MUX_bram_memory_1$a_put_2__VAL_4 = edp_tlpBRAM_readNxtDWAddr[12:2];
      2'd1:
	  MUX_bram_memory_1$a_put_2__VAL_4 =
	      edp_tlpBRAM_readNxtDWAddr_PLUS_1__q15[12:2];
      2'd2:
	  MUX_bram_memory_1$a_put_2__VAL_4 =
	      edp_tlpBRAM_readNxtDWAddr_PLUS_2__q16[12:2];
      2'd3:
	  MUX_bram_memory_1$a_put_2__VAL_4 =
	      edp_tlpBRAM_readNxtDWAddr_PLUS_3__q14[12:2];
    endcase
  end
  assign MUX_bram_memory_1$a_put_3__VAL_3 =
	     { IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2941[7:0],
	       IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2941[15:8],
	       IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2941[23:16],
	       IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2941[31:24] } ;
  always@(idx__h29830 or
	  edp_tlpBRAM_writeDWAddr_PLUS_3__q11 or
	  edp_tlpBRAM_writeDWAddr or
	  edp_tlpBRAM_writeDWAddr_PLUS_1__q12 or
	  edp_tlpBRAM_writeDWAddr_PLUS_2__q13)
  begin
    case (idx__h29830)
      2'd0: MUX_bram_memory_2$a_put_2__VAL_3 = edp_tlpBRAM_writeDWAddr[12:2];
      2'd1:
	  MUX_bram_memory_2$a_put_2__VAL_3 =
	      edp_tlpBRAM_writeDWAddr_PLUS_1__q12[12:2];
      2'd2:
	  MUX_bram_memory_2$a_put_2__VAL_3 =
	      edp_tlpBRAM_writeDWAddr_PLUS_2__q13[12:2];
      2'd3:
	  MUX_bram_memory_2$a_put_2__VAL_3 =
	      edp_tlpBRAM_writeDWAddr_PLUS_3__q11[12:2];
    endcase
  end
  always@(idx__h34216 or
	  edp_tlpBRAM_readNxtDWAddr_PLUS_3__q14 or
	  edp_tlpBRAM_readNxtDWAddr or
	  edp_tlpBRAM_readNxtDWAddr_PLUS_1__q15 or
	  edp_tlpBRAM_readNxtDWAddr_PLUS_2__q16)
  begin
    case (idx__h34216)
      2'd0:
	  MUX_bram_memory_2$a_put_2__VAL_4 = edp_tlpBRAM_readNxtDWAddr[12:2];
      2'd1:
	  MUX_bram_memory_2$a_put_2__VAL_4 =
	      edp_tlpBRAM_readNxtDWAddr_PLUS_1__q15[12:2];
      2'd2:
	  MUX_bram_memory_2$a_put_2__VAL_4 =
	      edp_tlpBRAM_readNxtDWAddr_PLUS_2__q16[12:2];
      2'd3:
	  MUX_bram_memory_2$a_put_2__VAL_4 =
	      edp_tlpBRAM_readNxtDWAddr_PLUS_3__q14[12:2];
    endcase
  end
  assign MUX_bram_memory_2$a_put_3__VAL_3 =
	     { IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2942[7:0],
	       IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2942[15:8],
	       IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2942[23:16],
	       IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2942[31:24] } ;
  always@(idx__h31134 or
	  edp_tlpBRAM_writeDWAddr_PLUS_3__q11 or
	  edp_tlpBRAM_writeDWAddr or
	  edp_tlpBRAM_writeDWAddr_PLUS_1__q12 or
	  edp_tlpBRAM_writeDWAddr_PLUS_2__q13)
  begin
    case (idx__h31134)
      2'd0: MUX_bram_memory_3$a_put_2__VAL_3 = edp_tlpBRAM_writeDWAddr[12:2];
      2'd1:
	  MUX_bram_memory_3$a_put_2__VAL_3 =
	      edp_tlpBRAM_writeDWAddr_PLUS_1__q12[12:2];
      2'd2:
	  MUX_bram_memory_3$a_put_2__VAL_3 =
	      edp_tlpBRAM_writeDWAddr_PLUS_2__q13[12:2];
      2'd3:
	  MUX_bram_memory_3$a_put_2__VAL_3 =
	      edp_tlpBRAM_writeDWAddr_PLUS_3__q11[12:2];
    endcase
  end
  always@(idx__h34589 or
	  edp_tlpBRAM_readNxtDWAddr_PLUS_3__q14 or
	  edp_tlpBRAM_readNxtDWAddr or
	  edp_tlpBRAM_readNxtDWAddr_PLUS_1__q15 or
	  edp_tlpBRAM_readNxtDWAddr_PLUS_2__q16)
  begin
    case (idx__h34589)
      2'd0:
	  MUX_bram_memory_3$a_put_2__VAL_4 = edp_tlpBRAM_readNxtDWAddr[12:2];
      2'd1:
	  MUX_bram_memory_3$a_put_2__VAL_4 =
	      edp_tlpBRAM_readNxtDWAddr_PLUS_1__q15[12:2];
      2'd2:
	  MUX_bram_memory_3$a_put_2__VAL_4 =
	      edp_tlpBRAM_readNxtDWAddr_PLUS_2__q16[12:2];
      2'd3:
	  MUX_bram_memory_3$a_put_2__VAL_4 =
	      edp_tlpBRAM_readNxtDWAddr_PLUS_3__q14[12:2];
    endcase
  end
  assign MUX_bram_memory_3$a_put_3__VAL_3 =
	     { IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2943[7:0],
	       IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2943[15:8],
	       IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2943[23:16],
	       IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2943[31:24] } ;
  assign MUX_edp_doorSeqDwell$write_1__VAL_1 = edp_doorSeqDwell - 4'd1 ;
  assign MUX_edp_fabMesgAccu$write_1__VAL_2 = edp_fabMesgAccu + y__h87444 ;
  assign MUX_edp_fabMeta$write_1__VAL_2 =
	     { 1'd1,
	       x__h84900,
	       opcode__h81723,
	       nowMS__h82954,
	       nowLS__h83897 } ;
  assign MUX_edp_mesgLengthRemainPush$write_1__VAL_1 =
	     { edp_mesgLengthRemainPush_PLUS_3__q18[16:2], 2'd0 } ;
  assign MUX_edp_mesgLengthRemainPush$write_1__VAL_2 =
	     { edp_tlpBRAM_mRespF$D_OUT[8],
	       edp_tlpBRAM_mRespF$D_OUT[23:16],
	       edp_tlpBRAM_mRespF$D_OUT[31:24] } ;
  assign MUX_edp_mesgLengthRemainPush$write_1__VAL_3 =
	     edp_mesgLengthRemainPush - y__h87023 ;
  assign MUX_edp_outBF_wDataIn$wset_1__VAL_1 =
	     { 2'd0,
	       edp_fabMesgAddrMS[15:8],
	       2'd0,
	       edp_fabMesgAddrMS[7:0],
	       20'd0 } ;
  assign MUX_edp_outBF_wDataIn$wset_1__VAL_2 =
	     { 2'd0,
	       edp_frameNumber[15:8],
	       2'd0,
	       edp_frameNumber[7:0],
	       2'd0,
	       edp_fabMesgAddrMS[31:24],
	       2'd0,
	       edp_fabMesgAddrMS[23:16] } ;
  assign MUX_edp_outBF_wDataIn$wset_1__VAL_3 =
	     { 2'd0,
	       edp_frmFlags,
	       2'd0,
	       edp_ackCount,
	       2'd0,
	       edp_ackStart[15:8],
	       2'd0,
	       edp_ackStart[7:0] } ;
  assign MUX_edp_outBF_wDataIn$wset_1__VAL_4 =
	     { 2'd0,
	       edp_xactionNumber[31:24],
	       2'd0,
	       edp_xactionNumber[23:16],
	       2'd0,
	       edp_xactionNumber[15:8],
	       2'd0,
	       edp_xactionNumber[7:0] } ;
  assign MUX_edp_outBF_wDataIn$wset_1__VAL_5 =
	     { 2'd0,
	       edp_fabFlowAddr[31:24],
	       2'd0,
	       edp_fabFlowAddr[23:16],
	       2'd0,
	       edp_fabFlowAddr[15:8],
	       2'd0,
	       edp_fabFlowAddr[7:0] } ;
  assign MUX_edp_outBF_wDataIn$wset_1__VAL_6 =
	     { 2'd0, edp_mesgSeq[15:8], 2'd0, edp_mesgSeq[7:0], 20'd2 } ;
  assign MUX_edp_outBF_wDataIn$wset_1__VAL_7 =
	     { 2'd0,
	       edp_dataAddr[31:24],
	       2'd0,
	       edp_dataAddr[23:16],
	       2'd0,
	       edp_dataAddr[15:8],
	       2'd0,
	       edp_dataAddr[7:0] } ;
  assign MUX_edp_outBF_wDataIn$wset_1__VAL_8 =
	     { 2'd0,
	       edp_mhFlags,
	       2'd0,
	       edp_mhType,
	       2'd0,
	       edp_dataLen[15:8],
	       2'd0,
	       edp_dataLen[7:0] } ;
  assign MUX_edp_outBF_wDataIn$wset_1__VAL_9 =
	     { 2'd0,
	       edp_outFunl_outF$D_OUT[31:24],
	       2'd0,
	       edp_outFunl_outF$D_OUT[23:16],
	       2'd0,
	       edp_outFunl_outF$D_OUT[15:8],
	       2'd0,
	       edp_outFunl_outF$D_OUT[7:0] } ;
  assign MUX_edp_outDwRemain$write_1__VAL_1 =
	     edp_tlpBRAM_mRespF$D_OUT[71:62] - y__h87385 ;
  assign MUX_edp_outDwRemain$write_1__VAL_2 = edp_outDwRemain - 10'd4 ;
  assign MUX_edp_outFunl_inF$enq_1__VAL_1 =
	     { nowLS__h83897, nowMS__h82954, opcode__h81723, edp_lastMetaV } ;
  assign MUX_edp_outFunl_inF$enq_1__VAL_2 =
	     { x__h79939, nowLS__h83897, nowMS__h82954, opcode__h81723 } ;
  assign MUX_edp_postSeqDwell$write_1__VAL_1 =
	     (dpControl[1:0] == 2'd2) ? 4'd8 : 4'd4 ;
  assign MUX_edp_postSeqDwell$write_1__VAL_2 = edp_postSeqDwell - 4'd1 ;
  assign MUX_edp_rcvDoCompletion$write_1__VAL_1 =
	     x__h101850 != 4'd0 && edp_rcvPtr >= 4'd5 ;
  assign MUX_edp_remMesgAccu$write_1__VAL_2 = edp_remMesgAccu + y__h87159 ;
  assign MUX_edp_srcMesgAccu$write_1__VAL_2 = edp_srcMesgAccu + y__h87114 ;
  assign MUX_edp_tlpBRAM_mReqF$enq_1__VAL_1 =
	     { 67'h15555555555555554,
	       edp_rcvDA[14:2],
	       18'd511,
	       dw__h101823 } ;
  assign MUX_edp_tlpBRAM_mReqF$enq_1__VAL_2 =
	     { 88'h955555555555555553FFF8,
	       edp_remMetaAddr[14:2],
	       29'd2620074 } ;
  assign MUX_edp_tlpBRAM_mReqF$enq_1__VAL_3 =
	     { 69'h12AAAAAAAAAAAAAAAA,
	       edp_fabMesgAddrMS != 32'd0,
	       18'd196600,
	       edp_remMesgAccu[14:2],
	       thisRequestLength__h86998[11:2],
	       8'd255,
	       rreq_tag__h87207,
	       3'h2 } ;
  assign MUX_edp_tlpBRAM_mRespF$enq_1__VAL_1 =
	     { 48'h2AAAAAAAAAAA,
	       !edp_tlpBRAM_readReq$D_OUT[60],
	       edp_tlpBRAM_readReq$D_OUT[59:42],
	       edp_tlpBRAM_readReq$D_OUT[28:19],
	       lowAddr__h35519,
	       byteCount__h35520,
	       edp_tlpBRAM_readReq$D_OUT[10:0],
	       rresp_data__h35565 } ;
  assign MUX_edp_tlpBRAM_mRespF$enq_1__VAL_2 =
	     { 1'd1,
	       edp_tlpBRAM_readReq$D_OUT[59:58],
	       edp_tlpBRAM_readReq$D_OUT[10:3],
	       rdata__h40958 } ;
  assign MUX_edp_tlpBRAM_rdRespDwRemain$write_1__VAL_1 =
	     edp_tlpBRAM_readReq$D_OUT[28:19] - y__h36580 ;
  assign MUX_edp_tlpBRAM_rdRespDwRemain$write_1__VAL_2 =
	     edp_tlpBRAM_rdRespDwRemain - 10'd4 ;
  assign MUX_edp_tlpBRAM_readNxtDWAddr$write_1__VAL_1 =
	     edp_tlpBRAM_mReqF$D_OUT[41:29] + y__h33157 ;
  assign MUX_edp_tlpBRAM_readNxtDWAddr$write_1__VAL_2 =
	     edp_tlpBRAM_readNxtDWAddr + 13'd4 ;
  assign MUX_edp_tlpBRAM_readRemainDWLen$write_1__VAL_1 =
	     edp_tlpBRAM_mReqF$D_OUT[28:19] - y__h33145 ;
  assign MUX_edp_tlpBRAM_readRemainDWLen$write_1__VAL_2 =
	     edp_tlpBRAM_readRemainDWLen - 10'd4 ;
  assign MUX_edp_tlpBRAM_writeDWAddr$write_1__VAL_1 =
	     edp_tlpBRAM_mReqF$D_OUT[62:50] + y__h24596 ;
  assign MUX_edp_tlpBRAM_writeDWAddr$write_1__VAL_2 =
	     edp_tlpBRAM_writeDWAddr + 13'd4 ;
  assign MUX_edp_tlpBRAM_writeRemainDWLen$write_1__VAL_1 =
	     edp_tlpBRAM_mReqF$D_OUT[49:40] - y__h24663 ;
  assign MUX_edp_tlpBRAM_writeRemainDWLen$write_1__VAL_2 =
	     edp_tlpBRAM_writeRemainDWLen - 10'd4 ;
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
  assign MUX_wci_respF_x_wire$wset_1__VAL_2 =
	     { 2'd1, _theResult____h124733 } ;
  assign MUX_wmi_addr$write_1__VAL_1 = wmi_addr + 14'd4 ;
  assign MUX_wmi_bufDwell$write_1__VAL_3 = wmi_bufDwell - 2'd1 ;
  assign MUX_wmi_bytesRemainReq$write_1__VAL_1 = wmi_bytesRemainReq - 14'd4 ;
  assign MUX_wmi_bytesRemainReq$write_1__VAL_2 =
	     { wmi_wmi_reqF$D_OUT[11:0], 2'd0 } ;
  assign MUX_wmi_bytesRemainResp$write_1__VAL_2 =
	     wmi_bytesRemainResp - 14'd4 ;
  assign MUX_wmi_mesgCount$write_1__VAL_1 = wmi_mesgCount + 32'd1 ;
  assign MUX_wmi_mesgMeta$write_1__VAL_2 =
	     { 1'd1,
	       y_avValue__h116735,
	       y_avValue__h116755,
	       y_avValue__h116775,
	       y_avValue__h116795 } ;
  assign MUX_wmi_p4B$write_1__VAL_2 = wmi_p4B + 2'd1 ;
  assign MUX_wmi_wmi_respF_c_r$write_1__VAL_1 = wmi_wmi_respF_c_r + 2'd1 ;
  assign MUX_wmi_wmi_respF_c_r$write_1__VAL_2 = wmi_wmi_respF_c_r - 2'd1 ;
  assign MUX_wmi_wmi_respF_q_0$write_1__VAL_1 =
	     (wmi_wmi_respF_c_r == 2'd1) ?
	       MUX_wmi_wmi_respF_q_0$write_1__VAL_2 :
	       wmi_wmi_respF_q_1 ;
  assign MUX_wmi_wmi_respF_q_0$write_1__VAL_2 = { 2'd1, rdata__h116899 } ;
  assign MUX_wmi_wmi_respF_q_1$write_1__VAL_1 =
	     (wmi_wmi_respF_c_r == 2'd2) ?
	       MUX_wmi_wmi_respF_q_0$write_1__VAL_2 :
	       34'd0 ;
  // inlined wires
  assign bram_serverAdapterA_outData_enqData$wget = bram_memory$DOA ;
  assign bram_serverAdapterA_outData_enqData$whas =
	     (!bram_serverAdapterA_s1[0] ||
	      bram_serverAdapterA_outDataCore$FULL_N) &&
	     bram_serverAdapterA_s1[1] &&
	     bram_serverAdapterA_s1[0] ;
  assign bram_serverAdapterA_outData_outData$wget =
	     bram_serverAdapterA_outDataCore$EMPTY_N ?
	       bram_serverAdapterA_outDataCore$D_OUT :
	       bram_memory$DOA ;
  assign bram_serverAdapterA_outData_outData$whas =
	     bram_serverAdapterA_outDataCore$EMPTY_N ||
	     !bram_serverAdapterA_outDataCore$EMPTY_N &&
	     bram_serverAdapterA_outData_enqData$whas ;
  assign bram_serverAdapterA_cnt_1$wget = 3'd1 ;
  assign bram_serverAdapterA_cnt_1$whas =
	     (MUX_bram_memory$a_put_1__SEL_1 ||
	      MUX_bram_memory$a_put_1__SEL_2 ||
	      MUX_bram_memory$a_put_1__SEL_3 ||
	      WILL_FIRE_RL_edp_tlpBRAM_read_NextReq) &&
	     (!ab__h1613[1] || ab__h1613[0]) ;
  assign bram_serverAdapterA_cnt_2$wget = 3'd7 ;
  assign bram_serverAdapterA_cnt_2$whas =
	     bram_serverAdapterA_outData_deqCalled$whas ;
  assign bram_serverAdapterA_cnt_3$wget = 3'h0 ;
  assign bram_serverAdapterA_cnt_3$whas = 1'b0 ;
  assign bram_serverAdapterA_writeWithResp$wget = ab__h1613 ;
  assign bram_serverAdapterA_writeWithResp$whas =
	     MUX_bram_memory$a_put_1__SEL_1 ||
	     MUX_bram_memory$a_put_1__SEL_2 ||
	     MUX_bram_memory$a_put_1__SEL_3 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextReq ;
  assign bram_serverAdapterA_s1_1$wget =
	     { 1'd1, !ab__h1613[1] || ab__h1613[0] } ;
  assign bram_serverAdapterA_s1_1$whas =
	     bram_serverAdapterA_writeWithResp$whas ;
  assign bram_serverAdapterB_outData_enqData$wget = bram_memory$DOB ;
  assign bram_serverAdapterB_outData_enqData$whas =
	     (!bram_serverAdapterB_s1[0] ||
	      bram_serverAdapterB_outDataCore$FULL_N) &&
	     bram_serverAdapterB_s1[1] &&
	     bram_serverAdapterB_s1[0] ;
  assign bram_serverAdapterB_outData_outData$wget = y_avValue__h116735 ;
  assign bram_serverAdapterB_outData_outData$whas =
	     bram_serverAdapterB_outDataCore$EMPTY_N ||
	     !bram_serverAdapterB_outDataCore$EMPTY_N &&
	     bram_serverAdapterB_outData_enqData$whas ;
  assign bram_serverAdapterB_cnt_1$wget = 3'd1 ;
  assign bram_serverAdapterB_cnt_1$whas =
	     (MUX_bram_memory$b_put_1__SEL_1 ||
	      MUX_bram_memory$b_put_1__SEL_2 ||
	      WILL_FIRE_RL_wmi_reqMetadata ||
	      WILL_FIRE_RL_wmi_doWriteFinalize) &&
	     (!ab__h3019[1] || ab__h3019[0]) ;
  assign bram_serverAdapterB_cnt_2$wget = 3'd7 ;
  assign bram_serverAdapterB_cnt_2$whas =
	     bram_serverAdapterB_outData_deqCalled$whas ;
  assign bram_serverAdapterB_cnt_3$wget = 3'h0 ;
  assign bram_serverAdapterB_cnt_3$whas = 1'b0 ;
  assign bram_serverAdapterB_writeWithResp$wget = ab__h3019 ;
  assign bram_serverAdapterB_writeWithResp$whas =
	     MUX_bram_memory$b_put_1__SEL_1 ||
	     MUX_bram_memory$b_put_1__SEL_2 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  assign bram_serverAdapterB_s1_1$wget =
	     { 1'd1, !ab__h3019[1] || ab__h3019[0] } ;
  assign bram_serverAdapterB_s1_1$whas =
	     bram_serverAdapterB_writeWithResp$whas ;
  assign bram_serverAdapterA_1_outData_enqData$wget = bram_memory_1$DOA ;
  assign bram_serverAdapterA_1_outData_enqData$whas =
	     (!bram_serverAdapterA_1_s1[0] ||
	      bram_serverAdapterA_1_outDataCore$FULL_N) &&
	     bram_serverAdapterA_1_s1[1] &&
	     bram_serverAdapterA_1_s1[0] ;
  assign bram_serverAdapterA_1_outData_outData$wget =
	     bram_serverAdapterA_1_outDataCore$EMPTY_N ?
	       bram_serverAdapterA_1_outDataCore$D_OUT :
	       bram_memory_1$DOA ;
  assign bram_serverAdapterA_1_outData_outData$whas =
	     bram_serverAdapterA_1_outDataCore$EMPTY_N ||
	     !bram_serverAdapterA_1_outDataCore$EMPTY_N &&
	     bram_serverAdapterA_1_outData_enqData$whas ;
  assign bram_serverAdapterA_1_cnt_1$wget = 3'd1 ;
  assign bram_serverAdapterA_1_cnt_1$whas =
	     (MUX_bram_memory_1$a_put_1__SEL_1 ||
	      MUX_bram_memory_1$a_put_1__SEL_2 ||
	      MUX_bram_memory_1$a_put_1__SEL_3 ||
	      WILL_FIRE_RL_edp_tlpBRAM_read_NextReq) &&
	     (!ab__h4561[1] || ab__h4561[0]) ;
  assign bram_serverAdapterA_1_cnt_2$wget = 3'd7 ;
  assign bram_serverAdapterA_1_cnt_2$whas =
	     bram_serverAdapterA_1_outData_deqCalled$whas ;
  assign bram_serverAdapterA_1_cnt_3$wget = 3'h0 ;
  assign bram_serverAdapterA_1_cnt_3$whas = 1'b0 ;
  assign bram_serverAdapterA_1_writeWithResp$wget = ab__h4561 ;
  assign bram_serverAdapterA_1_writeWithResp$whas =
	     MUX_bram_memory_1$a_put_1__SEL_1 ||
	     MUX_bram_memory_1$a_put_1__SEL_2 ||
	     MUX_bram_memory_1$a_put_1__SEL_3 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextReq ;
  assign bram_serverAdapterA_1_s1_1$wget =
	     { 1'd1, !ab__h4561[1] || ab__h4561[0] } ;
  assign bram_serverAdapterA_1_s1_1$whas =
	     bram_serverAdapterA_1_writeWithResp$whas ;
  assign bram_serverAdapterB_1_outData_enqData$wget = bram_memory_1$DOB ;
  assign bram_serverAdapterB_1_outData_enqData$whas =
	     (!bram_serverAdapterB_1_s1[0] ||
	      bram_serverAdapterB_1_outDataCore$FULL_N) &&
	     bram_serverAdapterB_1_s1[1] &&
	     bram_serverAdapterB_1_s1[0] ;
  assign bram_serverAdapterB_1_outData_outData$wget = y_avValue__h116755 ;
  assign bram_serverAdapterB_1_outData_outData$whas =
	     bram_serverAdapterB_1_outDataCore$EMPTY_N ||
	     !bram_serverAdapterB_1_outDataCore$EMPTY_N &&
	     bram_serverAdapterB_1_outData_enqData$whas ;
  assign bram_serverAdapterB_1_cnt_1$wget = 3'd1 ;
  assign bram_serverAdapterB_1_cnt_1$whas =
	     (MUX_bram_memory_1$b_put_1__SEL_1 ||
	      MUX_bram_memory_1$b_put_1__SEL_2 ||
	      WILL_FIRE_RL_wmi_reqMetadata ||
	      WILL_FIRE_RL_wmi_doWriteFinalize) &&
	     (!ab__h5965[1] || ab__h5965[0]) ;
  assign bram_serverAdapterB_1_cnt_2$wget = 3'd7 ;
  assign bram_serverAdapterB_1_cnt_2$whas =
	     bram_serverAdapterB_1_outData_deqCalled$whas ;
  assign bram_serverAdapterB_1_cnt_3$wget = 3'h0 ;
  assign bram_serverAdapterB_1_cnt_3$whas = 1'b0 ;
  assign bram_serverAdapterB_1_writeWithResp$wget = ab__h5965 ;
  assign bram_serverAdapterB_1_writeWithResp$whas =
	     MUX_bram_memory_1$b_put_1__SEL_1 ||
	     MUX_bram_memory_1$b_put_1__SEL_2 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  assign bram_serverAdapterB_1_s1_1$wget =
	     { 1'd1, !ab__h5965[1] || ab__h5965[0] } ;
  assign bram_serverAdapterB_1_s1_1$whas =
	     bram_serverAdapterB_1_writeWithResp$whas ;
  assign bram_serverAdapterA_2_outData_enqData$wget = bram_memory_2$DOA ;
  assign bram_serverAdapterA_2_outData_enqData$whas =
	     (!bram_serverAdapterA_2_s1[0] ||
	      bram_serverAdapterA_2_outDataCore$FULL_N) &&
	     bram_serverAdapterA_2_s1[1] &&
	     bram_serverAdapterA_2_s1[0] ;
  assign bram_serverAdapterA_2_outData_outData$wget =
	     bram_serverAdapterA_2_outDataCore$EMPTY_N ?
	       bram_serverAdapterA_2_outDataCore$D_OUT :
	       bram_memory_2$DOA ;
  assign bram_serverAdapterA_2_outData_outData$whas =
	     bram_serverAdapterA_2_outDataCore$EMPTY_N ||
	     !bram_serverAdapterA_2_outDataCore$EMPTY_N &&
	     bram_serverAdapterA_2_outData_enqData$whas ;
  assign bram_serverAdapterA_2_cnt_1$wget = 3'd1 ;
  assign bram_serverAdapterA_2_cnt_1$whas =
	     (MUX_bram_memory_2$a_put_1__SEL_1 ||
	      MUX_bram_memory_2$a_put_1__SEL_2 ||
	      MUX_bram_memory_2$a_put_1__SEL_3 ||
	      WILL_FIRE_RL_edp_tlpBRAM_read_NextReq) &&
	     (!ab__h7507[1] || ab__h7507[0]) ;
  assign bram_serverAdapterA_2_cnt_2$wget = 3'd7 ;
  assign bram_serverAdapterA_2_cnt_2$whas =
	     bram_serverAdapterA_2_outData_deqCalled$whas ;
  assign bram_serverAdapterA_2_cnt_3$wget = 3'h0 ;
  assign bram_serverAdapterA_2_cnt_3$whas = 1'b0 ;
  assign bram_serverAdapterA_2_writeWithResp$wget = ab__h7507 ;
  assign bram_serverAdapterA_2_writeWithResp$whas =
	     MUX_bram_memory_2$a_put_1__SEL_1 ||
	     MUX_bram_memory_2$a_put_1__SEL_2 ||
	     MUX_bram_memory_2$a_put_1__SEL_3 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextReq ;
  assign bram_serverAdapterA_2_s1_1$wget =
	     { 1'd1, !ab__h7507[1] || ab__h7507[0] } ;
  assign bram_serverAdapterA_2_s1_1$whas =
	     bram_serverAdapterA_2_writeWithResp$whas ;
  assign bram_serverAdapterB_2_outData_enqData$wget = bram_memory_2$DOB ;
  assign bram_serverAdapterB_2_outData_enqData$whas =
	     (!bram_serverAdapterB_2_s1[0] ||
	      bram_serverAdapterB_2_outDataCore$FULL_N) &&
	     bram_serverAdapterB_2_s1[1] &&
	     bram_serverAdapterB_2_s1[0] ;
  assign bram_serverAdapterB_2_outData_outData$wget = y_avValue__h116775 ;
  assign bram_serverAdapterB_2_outData_outData$whas =
	     bram_serverAdapterB_2_outDataCore$EMPTY_N ||
	     !bram_serverAdapterB_2_outDataCore$EMPTY_N &&
	     bram_serverAdapterB_2_outData_enqData$whas ;
  assign bram_serverAdapterB_2_cnt_1$wget = 3'd1 ;
  assign bram_serverAdapterB_2_cnt_1$whas =
	     (MUX_bram_memory_2$b_put_1__SEL_1 ||
	      MUX_bram_memory_2$b_put_1__SEL_2 ||
	      WILL_FIRE_RL_wmi_reqMetadata ||
	      WILL_FIRE_RL_wmi_doWriteFinalize) &&
	     (!ab__h8911[1] || ab__h8911[0]) ;
  assign bram_serverAdapterB_2_cnt_2$wget = 3'd7 ;
  assign bram_serverAdapterB_2_cnt_2$whas =
	     bram_serverAdapterB_2_outData_deqCalled$whas ;
  assign bram_serverAdapterB_2_cnt_3$wget = 3'h0 ;
  assign bram_serverAdapterB_2_cnt_3$whas = 1'b0 ;
  assign bram_serverAdapterB_2_writeWithResp$wget = ab__h8911 ;
  assign bram_serverAdapterB_2_writeWithResp$whas =
	     MUX_bram_memory_2$b_put_1__SEL_1 ||
	     MUX_bram_memory_2$b_put_1__SEL_2 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  assign bram_serverAdapterB_2_s1_1$wget =
	     { 1'd1, !ab__h8911[1] || ab__h8911[0] } ;
  assign bram_serverAdapterB_2_s1_1$whas =
	     bram_serverAdapterB_2_writeWithResp$whas ;
  assign bram_serverAdapterA_3_outData_enqData$wget = bram_memory_3$DOA ;
  assign bram_serverAdapterA_3_outData_enqData$whas =
	     (!bram_serverAdapterA_3_s1[0] ||
	      bram_serverAdapterA_3_outDataCore$FULL_N) &&
	     bram_serverAdapterA_3_s1[1] &&
	     bram_serverAdapterA_3_s1[0] ;
  assign bram_serverAdapterA_3_outData_outData$wget =
	     bram_serverAdapterA_3_outDataCore$EMPTY_N ?
	       bram_serverAdapterA_3_outDataCore$D_OUT :
	       bram_memory_3$DOA ;
  assign bram_serverAdapterA_3_outData_outData$whas =
	     bram_serverAdapterA_3_outDataCore$EMPTY_N ||
	     !bram_serverAdapterA_3_outDataCore$EMPTY_N &&
	     bram_serverAdapterA_3_outData_enqData$whas ;
  assign bram_serverAdapterA_3_cnt_1$wget = 3'd1 ;
  assign bram_serverAdapterA_3_cnt_1$whas =
	     (MUX_bram_memory_3$a_put_1__SEL_1 ||
	      MUX_bram_memory_3$a_put_1__SEL_2 ||
	      MUX_bram_memory_3$a_put_1__SEL_3 ||
	      WILL_FIRE_RL_edp_tlpBRAM_read_NextReq) &&
	     (!ab__h10453[1] || ab__h10453[0]) ;
  assign bram_serverAdapterA_3_cnt_2$wget = 3'd7 ;
  assign bram_serverAdapterA_3_cnt_2$whas =
	     bram_serverAdapterA_3_outData_deqCalled$whas ;
  assign bram_serverAdapterA_3_cnt_3$wget = 3'h0 ;
  assign bram_serverAdapterA_3_cnt_3$whas = 1'b0 ;
  assign bram_serverAdapterA_3_writeWithResp$wget = ab__h10453 ;
  assign bram_serverAdapterA_3_writeWithResp$whas =
	     MUX_bram_memory_3$a_put_1__SEL_1 ||
	     MUX_bram_memory_3$a_put_1__SEL_2 ||
	     MUX_bram_memory_3$a_put_1__SEL_3 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextReq ;
  assign bram_serverAdapterA_3_s1_1$wget =
	     { 1'd1, !ab__h10453[1] || ab__h10453[0] } ;
  assign bram_serverAdapterA_3_s1_1$whas =
	     bram_serverAdapterA_3_writeWithResp$whas ;
  assign bram_serverAdapterB_3_outData_enqData$wget = bram_memory_3$DOB ;
  assign bram_serverAdapterB_3_outData_enqData$whas =
	     (!bram_serverAdapterB_3_s1[0] ||
	      bram_serverAdapterB_3_outDataCore$FULL_N) &&
	     bram_serverAdapterB_3_s1[1] &&
	     bram_serverAdapterB_3_s1[0] ;
  assign bram_serverAdapterB_3_outData_outData$wget = y_avValue__h116795 ;
  assign bram_serverAdapterB_3_outData_outData$whas =
	     bram_serverAdapterB_3_outDataCore$EMPTY_N ||
	     !bram_serverAdapterB_3_outDataCore$EMPTY_N &&
	     bram_serverAdapterB_3_outData_enqData$whas ;
  assign bram_serverAdapterB_3_cnt_1$wget = 3'd1 ;
  assign bram_serverAdapterB_3_cnt_1$whas =
	     (MUX_bram_memory_3$b_put_1__SEL_1 ||
	      MUX_bram_memory_3$b_put_1__SEL_2 ||
	      WILL_FIRE_RL_wmi_reqMetadata ||
	      WILL_FIRE_RL_wmi_doWriteFinalize) &&
	     (!ab__h11857[1] || ab__h11857[0]) ;
  assign bram_serverAdapterB_3_cnt_2$wget = 3'd7 ;
  assign bram_serverAdapterB_3_cnt_2$whas =
	     bram_serverAdapterB_3_outData_deqCalled$whas ;
  assign bram_serverAdapterB_3_cnt_3$wget = 3'h0 ;
  assign bram_serverAdapterB_3_cnt_3$whas = 1'b0 ;
  assign bram_serverAdapterB_3_writeWithResp$wget = ab__h11857 ;
  assign bram_serverAdapterB_3_writeWithResp$whas =
	     MUX_bram_memory_3$b_put_1__SEL_1 ||
	     MUX_bram_memory_3$b_put_1__SEL_2 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  assign bram_serverAdapterB_3_s1_1$wget =
	     { 1'd1, !ab__h11857[1] || ab__h11857[0] } ;
  assign bram_serverAdapterB_3_s1_1$whas =
	     bram_serverAdapterB_3_writeWithResp$whas ;
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
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd2 &&
	     wci_reqF$D_OUT[36:34] == 3'd3 ||
	     wci_wci_ctrl_pw$whas && WILL_FIRE_RL_wci_ctl_op_start &&
	     wci_cState == 3'd0 &&
	     wci_reqF$D_OUT[36:34] == 3'd0 ||
	     WILL_FIRE_RL_bml_initAccumulators ;
  assign wti_wtiReq$wget = 67'h0 ;
  assign wti_wtiReq$whas = 1'b0 ;
  assign wti_operateD_1$wget = 1'b0 ;
  assign wti_operateD_1$whas = 1'b0 ;
  always@(WILL_FIRE_RL_edp_fhFsm_action_l184c11 or
	  MUX_edp_outBF_wDataIn$wset_1__VAL_1 or
	  WILL_FIRE_RL_edp_fhFsm_action_l185c11 or
	  MUX_edp_outBF_wDataIn$wset_1__VAL_2 or
	  WILL_FIRE_RL_edp_fhFsm_action_l186c11 or
	  MUX_edp_outBF_wDataIn$wset_1__VAL_3 or
	  WILL_FIRE_RL_edp_mhFsm_action_l192c11 or
	  MUX_edp_outBF_wDataIn$wset_1__VAL_4 or
	  WILL_FIRE_RL_edp_mhFsm_action_l193c11 or
	  MUX_edp_outBF_wDataIn$wset_1__VAL_5 or
	  WILL_FIRE_RL_edp_mhFsm_action_l195c11 or
	  MUX_edp_outBF_wDataIn$wset_1__VAL_6 or
	  WILL_FIRE_RL_edp_mhFsm_action_l196c11 or
	  MUX_edp_outBF_wDataIn$wset_1__VAL_7 or
	  WILL_FIRE_RL_edp_mhFsm_action_l197c11 or
	  MUX_edp_outBF_wDataIn$wset_1__VAL_8 or
	  WILL_FIRE_RL_edp_drain_outFunl or
	  MUX_edp_outBF_wDataIn$wset_1__VAL_9 or
	  WILL_FIRE_RL_edp_mhFsm_action_l194c11 or
	  WILL_FIRE_RL_edp_dmaXmtTailEvent)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_edp_fhFsm_action_l184c11:
	  edp_outBF_wDataIn$wget = MUX_edp_outBF_wDataIn$wset_1__VAL_1;
      WILL_FIRE_RL_edp_fhFsm_action_l185c11:
	  edp_outBF_wDataIn$wget = MUX_edp_outBF_wDataIn$wset_1__VAL_2;
      WILL_FIRE_RL_edp_fhFsm_action_l186c11:
	  edp_outBF_wDataIn$wget = MUX_edp_outBF_wDataIn$wset_1__VAL_3;
      WILL_FIRE_RL_edp_mhFsm_action_l192c11:
	  edp_outBF_wDataIn$wget = MUX_edp_outBF_wDataIn$wset_1__VAL_4;
      WILL_FIRE_RL_edp_mhFsm_action_l193c11:
	  edp_outBF_wDataIn$wget = MUX_edp_outBF_wDataIn$wset_1__VAL_5;
      WILL_FIRE_RL_edp_mhFsm_action_l195c11:
	  edp_outBF_wDataIn$wget = MUX_edp_outBF_wDataIn$wset_1__VAL_6;
      WILL_FIRE_RL_edp_mhFsm_action_l196c11:
	  edp_outBF_wDataIn$wget = MUX_edp_outBF_wDataIn$wset_1__VAL_7;
      WILL_FIRE_RL_edp_mhFsm_action_l197c11:
	  edp_outBF_wDataIn$wget = MUX_edp_outBF_wDataIn$wset_1__VAL_8;
      WILL_FIRE_RL_edp_drain_outFunl:
	  edp_outBF_wDataIn$wget = MUX_edp_outBF_wDataIn$wset_1__VAL_9;
      WILL_FIRE_RL_edp_mhFsm_action_l194c11: edp_outBF_wDataIn$wget = 40'd1;
      WILL_FIRE_RL_edp_dmaXmtTailEvent:
	  edp_outBF_wDataIn$wget = 40'h778C03B4FE;
      default: edp_outBF_wDataIn$wget =
		   40'hAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign edp_outBF_wDataIn$whas =
	     WILL_FIRE_RL_edp_fhFsm_action_l184c11 ||
	     WILL_FIRE_RL_edp_fhFsm_action_l185c11 ||
	     WILL_FIRE_RL_edp_fhFsm_action_l186c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l192c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l193c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l195c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l196c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l197c11 ||
	     WILL_FIRE_RL_edp_drain_outFunl ||
	     WILL_FIRE_RL_edp_mhFsm_action_l194c11 ||
	     WILL_FIRE_RL_edp_dmaXmtTailEvent ;
  assign edp_outBF_wDataOut$wget =
	     (edp_outBF_rCache[52] &&
	      edp_outBF_rCache[51:40] == edp_outBF_rRdPtr) ?
	       { CASE_edp_outBF_rCache_BITS_39_TO_38_3_0_edp_ou_ETC__q21,
		 edp_outBF_rCache[37:30],
		 CASE_edp_outBF_rCache_BITS_29_TO_28_3_0_edp_ou_ETC__q22,
		 edp_outBF_rCache[27:20],
		 CASE_edp_outBF_rCache_BITS_19_TO_18_3_0_edp_ou_ETC__q23,
		 edp_outBF_rCache[17:10],
		 CASE_edp_outBF_rCache_BITS_9_TO_8_3_0_edp_outB_ETC__q24,
		 edp_outBF_rCache[7:0] } :
	       { CASE_edp_outBF_memoryDOB_BITS_39_TO_38_3_0_ed_ETC__q25,
		 edp_outBF_memory$DOB[37:30],
		 CASE_edp_outBF_memoryDOB_BITS_29_TO_28_3_0_ed_ETC__q26,
		 edp_outBF_memory$DOB[27:20],
		 CASE_edp_outBF_memoryDOB_BITS_19_TO_18_3_0_ed_ETC__q27,
		 edp_outBF_memory$DOB[17:10],
		 CASE_edp_outBF_memoryDOB_BITS_9_TO_8_3_0_edp__ETC__q28,
		 edp_outBF_memory$DOB[7:0] } ;
  assign edp_outBF_wDataOut$whas = 1'd1 ;
  assign edp_remStart_1$wget = 1'd1 ;
  assign edp_remStart_1$whas =
	     WILL_FIRE_RL_edp_dmaXmtDoorbell ||
	     WILL_FIRE_RL_edp_dmaRequestNearMeta ;
  assign edp_remDone_1$wget = 1'd1 ;
  assign edp_remDone_1$whas =
	     MUX_edp_remDone_1$wset_1__SEL_1 ||
	     WILL_FIRE_RL_edp_dmaXmtMetaBody ;
  assign edp_nearBufReady_1$wget = 1'd1 ;
  assign edp_nearBufReady_1$whas =
	     wci_cState == 3'd2 && bml_lclBufsCF != 16'd0 ;
  assign edp_farBufReady_1$wget = 1'd1 ;
  assign edp_farBufReady_1$whas =
	     wci_cState == 3'd2 && bml_fabBufsAvail != 16'd0 ;
  assign edp_creditReady_1$wget = 1'd1 ;
  assign edp_creditReady_1$whas =
	     wci_cState == 3'd2 && bml_lclCredit != 16'd0 ;
  assign edp_dpControl$wget = dpControl ;
  assign edp_dpControl$whas = 1'd1 ;
  assign edp_pullTagMatch_1$wget = 1'b0 ;
  assign edp_pullTagMatch_1$whas = 1'b0 ;
  assign edp_nowW$wget = wti_nowReq[63:0] ;
  assign edp_nowW$whas = 1'd1 ;
  assign edp_dmaStartMark_1$wget = 1'd1 ;
  assign edp_dmaStartMark_1$whas = WILL_FIRE_RL_edp_dmaRequestNearMeta ;
  assign edp_dmaDoneMark_1$wget = 1'd1 ;
  assign edp_dmaDoneMark_1$whas = WILL_FIRE_RL_edp_dmaTailEventSender ;
  assign edp_doorBell_1$wget = 1'd1 ;
  assign edp_doorBell_1$whas =
	     WILL_FIRE_RL_edp_ingress && hasPush && x__h97353 != 4'd0 ||
	     WILL_FIRE_RL_edp_rcv_completion ;
  assign edp_fhFsm_start_wire$wget = 1'd1 ;
  assign edp_fhFsm_start_wire$whas = edp_fhFsm_start_reg_1_1$whas ;
  assign edp_fhFsm_start_reg_1_1$wget = 1'd1 ;
  assign edp_fhFsm_start_reg_1_1$whas =
	     WILL_FIRE_RL_edp_fhFsm_fsm_start ||
	     edp_fhFsm_start_reg_1 && !edp_fhFsm_state_fired ;
  assign edp_fhFsm_abort$wget = 1'b0 ;
  assign edp_fhFsm_abort$whas = 1'b0 ;
  assign edp_fhFsm_state_fired_1$wget = 1'd1 ;
  assign edp_fhFsm_state_fired_1$whas = edp_fhFsm_state_set_pw$whas ;
  assign edp_mhFsm_start_wire$wget = 1'd1 ;
  assign edp_mhFsm_start_wire$whas =
	     WILL_FIRE_RL_edp_mhFsm_fsm_start ||
	     edp_mhFsm_start_reg_1 && !edp_mhFsm_state_fired ;
  assign edp_mhFsm_start_reg_1_1$wget = 1'd1 ;
  assign edp_mhFsm_start_reg_1_1$whas = edp_mhFsm_start_wire$whas ;
  assign edp_mhFsm_abort$wget = 1'b0 ;
  assign edp_mhFsm_abort$whas = 1'b0 ;
  assign edp_mhFsm_state_fired_1$wget = 1'd1 ;
  assign edp_mhFsm_state_fired_1$whas = edp_mhFsm_state_set_pw$whas ;
  assign wmi_wmi_wmiReq$wget =
	     { wmiS0_MCmd,
	       wmiS0_MReqLast,
	       wmiS0_MReqInfo,
	       wmiS0_MAddrSpace,
	       wmiS0_MAddr,
	       wmiS0_MBurstLength } ;
  assign wmi_wmi_wmiReq$whas = 1'd1 ;
  assign wmi_wmi_wmiMFlag$wget = wmiS0_arg_mFlag ;
  assign wmi_wmi_wmiMFlag$whas = 1'd1 ;
  assign wmi_wmi_wmiDh$wget =
	     { wmiS0_MDataValid,
	       wmiS0_MDataLast,
	       wmiS0_MData,
	       wmiS0_MDataByteEn } ;
  assign wmi_wmi_wmiDh$whas = 1'd1 ;
  assign wmi_wmi_respF_x_wire$wget = MUX_wmi_wmi_respF_q_0$write_1__VAL_2 ;
  assign wmi_wmi_respF_x_wire$whas = WILL_FIRE_RL_wmi_doReadResp ;
  assign wmi_wmi_operateD_1$wget = 1'd1 ;
  assign wmi_wmi_operateD_1$whas = wci_cState == 3'd2 ;
  assign wmi_wmi_peerIsReady_1$wget = 1'd1 ;
  assign wmi_wmi_peerIsReady_1$whas = wmiS0_MReset_n ;
  assign wmi_wmi_sThreadBusy_dw$wget = wmi_wmi_reqF_countReg > 2'd1 ;
  assign wmi_wmi_sThreadBusy_dw$whas =
	     wmi_wmi_reqF_levelsValid && wmi_wmi_operateD &&
	     wmi_wmi_peerIsReady &&
	     !wmi_wmi_forceSThreadBusy_pw$whas ;
  assign wmi_wmi_sDataThreadBusy_dw$wget = wmi_wmi_dhF_countReg > 2'd1 ;
  assign wmi_wmi_sDataThreadBusy_dw$whas =
	     wmi_wmi_dhF_levelsValid && wmi_wmi_operateD &&
	     wmi_wmi_peerIsReady ;
  assign wmi_mesgStart_1$wget = 1'd1 ;
  assign wmi_mesgStart_1$whas = WILL_FIRE_RL_wmi_getRequest && !wmi_mesgBusy ;
  assign wmi_mesgDone_1$wget = 1'd1 ;
  assign wmi_mesgDone_1$whas =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_bytesRemainReq == 14'd4 &&
	     wmi_doneWithMesg ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  assign wmi_mesgBufReady_1$wget = 1'd1 ;
  assign wmi_mesgBufReady_1$whas =
	     wci_cState == 3'd2 && bml_lclBufsAR != 16'd0 ;
  assign wmi_dpControl$wget = dpControl ;
  assign wmi_dpControl$whas = 1'd1 ;
  assign wmi_nowW$wget = wti_nowReq[63:0] ;
  assign wmi_nowW$whas = 1'd1 ;
  assign bml_lclBufStart_1$wget = 1'd1 ;
  assign bml_lclBufStart_1$whas = wmi_mesgStart ;
  assign bml_lclBufDone_1$wget = 1'd1 ;
  assign bml_lclBufDone_1$whas = wmi_mesgDone ;
  assign bml_remStart_1$wget = 1'd1 ;
  assign bml_remStart_1$whas = edp_remStart ;
  assign bml_remDone_1$wget = 1'd1 ;
  assign bml_remDone_1$whas = edp_remDone ;
  assign bml_fabDone_1$wget = 1'd1 ;
  assign bml_fabDone_1$whas = edp_doorBell && dpControl[1:0] != 2'd1 ;
  assign bml_fabAvail_1$wget = 1'd1 ;
  assign bml_fabAvail_1$whas = edp_doorBell && dpControl[1:0] == 2'd1 ;
  assign bml_datumAReg_1$wget = bml_remDone ;
  assign bml_datumAReg_1$whas = wci_cState == 3'd2 ;
  assign bml_dpControl$wget = dpControl ;
  assign bml_dpControl$whas = 1'd1 ;
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
  assign wmi_Es_mCmd_w$wget = wmiS0_MCmd ;
  assign wmi_Es_mCmd_w$whas = 1'd1 ;
  assign wmi_Es_mReqInfo_w$wget = wmiS0_MReqInfo ;
  assign wmi_Es_mReqInfo_w$whas = 1'd1 ;
  assign wmi_Es_mAddrSpace_w$wget = wmiS0_MAddrSpace ;
  assign wmi_Es_mAddrSpace_w$whas = 1'd1 ;
  assign wmi_Es_mAddr_w$wget = wmiS0_MAddr ;
  assign wmi_Es_mAddr_w$whas = 1'd1 ;
  assign wmi_Es_mBurstLength_w$wget = wmiS0_MBurstLength ;
  assign wmi_Es_mBurstLength_w$whas = 1'd1 ;
  assign wmi_Es_mData_w$wget = wmiS0_MData ;
  assign wmi_Es_mData_w$whas = 1'd1 ;
  assign wmi_Es_mDataByteEn_w$wget = wmiS0_MDataByteEn ;
  assign wmi_Es_mDataByteEn_w$whas = 1'd1 ;
  assign bram_serverAdapterA_outData_deqCalled$whas =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstResp &&
	     !edp_tlpBRAM_readReq$D_OUT[60] &&
	     edp_tlpBRAM_readReq$D_OUT[30:29] == 2'd0 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextResp ;
  assign bram_serverAdapterB_outData_deqCalled$whas =
	     WILL_FIRE_RL_wmi_doReadResp && wmi_p4B == 2'd0 ||
	     WILL_FIRE_RL_wmi_respMetadata ;
  assign bram_serverAdapterA_1_outData_deqCalled$whas =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstResp &&
	     !edp_tlpBRAM_readReq$D_OUT[60] &&
	     edp_tlpBRAM_readReq$D_OUT[30:29] == 2'd1 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextResp ;
  assign bram_serverAdapterB_1_outData_deqCalled$whas =
	     WILL_FIRE_RL_wmi_doReadResp && wmi_p4B == 2'd1 ||
	     WILL_FIRE_RL_wmi_respMetadata ;
  assign bram_serverAdapterA_2_outData_deqCalled$whas =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstResp &&
	     !edp_tlpBRAM_readReq$D_OUT[60] &&
	     edp_tlpBRAM_readReq$D_OUT[30:29] == 2'd2 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextResp ;
  assign bram_serverAdapterB_2_outData_deqCalled$whas =
	     WILL_FIRE_RL_wmi_doReadResp && wmi_p4B == 2'd2 ||
	     WILL_FIRE_RL_wmi_respMetadata ;
  assign bram_serverAdapterA_3_outData_deqCalled$whas =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstResp &&
	     !edp_tlpBRAM_readReq$D_OUT[60] &&
	     edp_tlpBRAM_readReq$D_OUT[30:29] == 2'd3 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextResp ;
  assign bram_serverAdapterB_3_outData_deqCalled$whas =
	     WILL_FIRE_RL_wmi_doReadResp && wmi_p4B == 2'd3 ||
	     WILL_FIRE_RL_wmi_respMetadata ;
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
  assign edp_outBF_pwDequeue$whas =
	     !edp_outBF_rRdPtr_83_EQ_edp_outBF_rWrPtr_18___d1455 &&
	     edp_outF$FULL_N &&
	     edp_outTF$EMPTY_N ;
  assign edp_outBF_pwEnqueue$whas =
	     WILL_FIRE_RL_edp_dmaXmtTailEvent ||
	     WILL_FIRE_RL_edp_drain_outFunl ||
	     WILL_FIRE_RL_edp_mhFsm_action_l197c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l196c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l195c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l194c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l193c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l192c11 ||
	     WILL_FIRE_RL_edp_fhFsm_action_l186c11 ||
	     WILL_FIRE_RL_edp_fhFsm_action_l185c11 ||
	     WILL_FIRE_RL_edp_fhFsm_action_l184c11 ;
  assign edp_fhFsm_state_set_pw$whas =
	     WILL_FIRE_RL_edp_fhFsm_idle_l183c3 ||
	     WILL_FIRE_RL_edp_fhFsm_action_l186c11 ||
	     WILL_FIRE_RL_edp_fhFsm_action_l185c11 ||
	     WILL_FIRE_RL_edp_fhFsm_action_l184c11 ;
  assign edp_fhFsm_state_overlap_pw$whas = 1'b0 ;
  assign edp_mhFsm_state_set_pw$whas =
	     WILL_FIRE_RL_edp_mhFsm_idle_l191c3 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l197c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l196c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l195c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l194c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l193c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l192c11 ;
  assign edp_mhFsm_state_overlap_pw$whas = 1'b0 ;
  assign wmi_wmi_forceSThreadBusy_pw$whas =
	     dpControl[3:2] != 2'd1 && !wmi_mesgMeta[128] ||
	     dpControl[3:2] == 2'd1 && !wmi_mesgBufReady ;
  assign wmi_wmi_reqF_r_enq$whas =
	     MUX_wmi_wmi_reqF_levelsValid$write_1__SEL_2 ;
  assign wmi_wmi_reqF_r_deq$whas = WILL_FIRE_RL_wmi_getRequest ;
  assign wmi_wmi_reqF_r_clr$whas = 1'b0 ;
  assign wmi_wmi_reqF_doResetEnq$whas =
	     MUX_wmi_wmi_reqF_levelsValid$write_1__SEL_2 ;
  assign wmi_wmi_reqF_doResetDeq$whas = WILL_FIRE_RL_wmi_getRequest ;
  assign wmi_wmi_reqF_doResetClr$whas = 1'b0 ;
  assign wmi_wmi_mFlagF_r_enq$whas =
	     MUX_wmi_wmi_mFlagF_levelsValid$write_1__SEL_2 ;
  assign wmi_wmi_mFlagF_r_deq$whas = WILL_FIRE_RL_wmi_doWriteFinalize ;
  assign wmi_wmi_mFlagF_r_clr$whas = 1'b0 ;
  assign wmi_wmi_mFlagF_doResetEnq$whas =
	     MUX_wmi_wmi_mFlagF_levelsValid$write_1__SEL_2 ;
  assign wmi_wmi_mFlagF_doResetDeq$whas = WILL_FIRE_RL_wmi_doWriteFinalize ;
  assign wmi_wmi_mFlagF_doResetClr$whas = 1'b0 ;
  assign wmi_wmi_dhF_r_enq$whas = MUX_wmi_wmi_dhF_levelsValid$write_1__SEL_2 ;
  assign wmi_wmi_dhF_r_deq$whas = WILL_FIRE_RL_wmi_doWriteReq ;
  assign wmi_wmi_dhF_r_clr$whas = 1'b0 ;
  assign wmi_wmi_dhF_doResetEnq$whas =
	     MUX_wmi_wmi_dhF_levelsValid$write_1__SEL_2 ;
  assign wmi_wmi_dhF_doResetDeq$whas = WILL_FIRE_RL_wmi_doWriteReq ;
  assign wmi_wmi_dhF_doResetClr$whas = 1'b0 ;
  assign wmi_wmi_respF_enqueueing$whas = WILL_FIRE_RL_wmi_doReadResp ;
  assign wmi_wmi_respF_dequeueing$whas = wmi_wmi_respF_c_r != 2'd0 ;
  assign bml_lclBuf_incAction$whas = WILL_FIRE_RL_bml_lclAdvance ;
  assign bml_lclBuf_decAction$whas = 1'b0 ;
  assign bml_remBuf_incAction$whas = WILL_FIRE_RL_bml_remAdvance ;
  assign bml_remBuf_decAction$whas = 1'b0 ;
  assign bml_fabBuf_incAction$whas = MUX_bml_fabFlowAddr$write_1__SEL_1 ;
  assign bml_fabBuf_decAction$whas = 1'b0 ;
  assign bml_crdBuf_incAction$whas = WILL_FIRE_RL_bml_crdAdvance ;
  assign bml_crdBuf_decAction$whas = 1'b0 ;
  assign wmi_Es_mReqLast_w$whas = wmiS0_MReqLast ;
  assign wmi_Es_mDataValid_w$whas = wmiS0_MDataValid ;
  assign wmi_Es_mDataLast_w$whas = wmiS0_MDataLast ;
  assign wmi_Es_mDataInfo_w$whas = 1'd1 ;
  assign bml_lclBuf_modulus_bw$wget = bml_lclBuf_modulus ;
  assign bml_remBuf_modulus_bw$wget = bml_remBuf_modulus ;
  assign bml_fabBuf_modulus_bw$wget = bml_fabBuf_modulus ;
  assign bml_crdBuf_modulus_bw$wget = bml_crdBuf_modulus ;
  // register bml_crdBuf_modulus
  assign bml_crdBuf_modulus$D_IN = bml_lclNumBufs - 16'd1 ;
  assign bml_crdBuf_modulus$EN = WILL_FIRE_RL_bml_initAccumulators ;
  // register bml_crdBuf_value
  assign bml_crdBuf_value$D_IN =
	     WILL_FIRE_RL_bml_initAccumulators ?
	       16'd0 :
	       MUX_bml_crdBuf_value$write_1__VAL_3 ;
  assign bml_crdBuf_value$EN =
	     WILL_FIRE_RL_bml_crdAdvance ||
	     WILL_FIRE_RL_bml_initAccumulators ;
  // register bml_datumAReg
  assign bml_datumAReg$D_IN = CAN_FIRE_RL_bml_remAdvance ;
  assign bml_datumAReg$EN = 1'd1 ;
  // register bml_fabAvail
  assign bml_fabAvail$D_IN = bml_fabAvail_1$whas ;
  assign bml_fabAvail$EN = 1'd1 ;
  // register bml_fabBuf_modulus
  assign bml_fabBuf_modulus$D_IN = bml_fabNumBufs - 16'd1 ;
  assign bml_fabBuf_modulus$EN = WILL_FIRE_RL_bml_initAccumulators ;
  // register bml_fabBuf_value
  assign bml_fabBuf_value$D_IN =
	     WILL_FIRE_RL_bml_initAccumulators ?
	       16'd0 :
	       MUX_bml_fabBuf_value$write_1__VAL_3 ;
  assign bml_fabBuf_value$EN =
	     MUX_bml_fabFlowAddr$write_1__SEL_1 ||
	     WILL_FIRE_RL_bml_initAccumulators ;
  // register bml_fabBufsAvail
  assign bml_fabBufsAvail$D_IN =
	     MUX_bml_fabBufsAvail$write_1__SEL_1 ?
	       MUX_bml_fabBufsAvail$write_1__VAL_1 :
	       MUX_bml_fabBufsAvail$write_1__VAL_2 ;
  assign bml_fabBufsAvail$EN =
	     WILL_FIRE_RL_bml_fba &&
	     (bml_fabAvail && !bml_remStart ||
	      !bml_fabAvail && bml_remStart) ||
	     WILL_FIRE_RL_bml_initAccumulators ;
  // register bml_fabDone
  assign bml_fabDone$D_IN = bml_fabDone_1$whas ;
  assign bml_fabDone$EN = 1'd1 ;
  // register bml_fabFlowAddr
  always@(MUX_bml_fabFlowAddr$write_1__SEL_1 or
	  MUX_bml_fabFlowAddr$write_1__VAL_1 or
	  WILL_FIRE_RL_bml_initAccumulators or
	  bml_fabFlowBase or
	  WILL_FIRE_RL_bml_crdAdvance or MUX_bml_fabFlowAddr$write_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bml_fabFlowAddr$write_1__SEL_1:
	  bml_fabFlowAddr$D_IN = MUX_bml_fabFlowAddr$write_1__VAL_1;
      WILL_FIRE_RL_bml_initAccumulators:
	  bml_fabFlowAddr$D_IN = bml_fabFlowBase;
      WILL_FIRE_RL_bml_crdAdvance:
	  bml_fabFlowAddr$D_IN = MUX_bml_fabFlowAddr$write_1__VAL_3;
      default: bml_fabFlowAddr$D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign bml_fabFlowAddr$EN =
	     WILL_FIRE_RL_bml_remAdvance && dpControl[1:0] == 2'd1 ||
	     WILL_FIRE_RL_bml_initAccumulators ||
	     WILL_FIRE_RL_bml_crdAdvance ;
  // register bml_fabFlowBase
  assign bml_fabFlowBase$D_IN = wci_reqF$D_OUT[31:0] ;
  assign bml_fabFlowBase$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h60 ;
  // register bml_fabFlowBaseMS
  assign bml_fabFlowBaseMS$D_IN = wci_reqF$D_OUT[31:0] ;
  assign bml_fabFlowBaseMS$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h9C ;
  // register bml_fabFlowSize
  assign bml_fabFlowSize$D_IN = wci_reqF$D_OUT[31:0] ;
  assign bml_fabFlowSize$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h64 ;
  // register bml_fabMesgAddr
  assign bml_fabMesgAddr$D_IN =
	     MUX_bml_fabFlowAddr$write_1__SEL_1 ?
	       MUX_bml_fabMesgAddr$write_1__VAL_1 :
	       bml_fabMesgBase ;
  assign bml_fabMesgAddr$EN =
	     WILL_FIRE_RL_bml_remAdvance && dpControl[1:0] == 2'd1 ||
	     WILL_FIRE_RL_bml_initAccumulators ;
  // register bml_fabMesgBase
  assign bml_fabMesgBase$D_IN = wci_reqF$D_OUT[31:0] ;
  assign bml_fabMesgBase$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h50 ;
  // register bml_fabMesgBaseMS
  assign bml_fabMesgBaseMS$D_IN = wci_reqF$D_OUT[31:0] ;
  assign bml_fabMesgBaseMS$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h94 ;
  // register bml_fabMesgSize
  assign bml_fabMesgSize$D_IN = wci_reqF$D_OUT[31:0] ;
  assign bml_fabMesgSize$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h58 ;
  // register bml_fabMetaAddr
  assign bml_fabMetaAddr$D_IN =
	     MUX_bml_fabFlowAddr$write_1__SEL_1 ?
	       MUX_bml_fabMetaAddr$write_1__VAL_1 :
	       bml_fabMetaBase ;
  assign bml_fabMetaAddr$EN =
	     WILL_FIRE_RL_bml_remAdvance && dpControl[1:0] == 2'd1 ||
	     WILL_FIRE_RL_bml_initAccumulators ;
  // register bml_fabMetaBase
  assign bml_fabMetaBase$D_IN = wci_reqF$D_OUT[31:0] ;
  assign bml_fabMetaBase$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h54 ;
  // register bml_fabMetaBaseMS
  assign bml_fabMetaBaseMS$D_IN = wci_reqF$D_OUT[31:0] ;
  assign bml_fabMetaBaseMS$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h98 ;
  // register bml_fabMetaSize
  assign bml_fabMetaSize$D_IN = wci_reqF$D_OUT[31:0] ;
  assign bml_fabMetaSize$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h5C ;
  // register bml_fabNumBufs
  assign bml_fabNumBufs$D_IN = wci_reqF$D_OUT[15:0] ;
  assign bml_fabNumBufs$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h04 ;
  // register bml_lclBufDone
  assign bml_lclBufDone$D_IN = wmi_mesgDone ;
  assign bml_lclBufDone$EN = 1'd1 ;
  // register bml_lclBufStart
  assign bml_lclBufStart$D_IN = wmi_mesgStart ;
  assign bml_lclBufStart$EN = 1'd1 ;
  // register bml_lclBuf_modulus
  assign bml_lclBuf_modulus$D_IN = bml_crdBuf_modulus$D_IN ;
  assign bml_lclBuf_modulus$EN = WILL_FIRE_RL_bml_initAccumulators ;
  // register bml_lclBuf_value
  assign bml_lclBuf_value$D_IN =
	     WILL_FIRE_RL_bml_initAccumulators ?
	       16'd0 :
	       MUX_bml_lclBuf_value$write_1__VAL_3 ;
  assign bml_lclBuf_value$EN =
	     WILL_FIRE_RL_bml_lclAdvance ||
	     WILL_FIRE_RL_bml_initAccumulators ;
  // register bml_lclBufsAR
  assign bml_lclBufsAR$D_IN =
	     MUX_bml_lclBufsAR$write_1__SEL_1 ?
	       MUX_bml_lclBufsAR$write_1__VAL_1 :
	       MUX_bml_lclBufsAR$write_1__VAL_2 ;
  assign bml_lclBufsAR$EN =
	     MUX_bml_lclBufsAR$write_1__SEL_1 ||
	     WILL_FIRE_RL_bml_initAccumulators ;
  // register bml_lclBufsCF
  assign bml_lclBufsCF$D_IN =
	     MUX_bml_lclBufsCF$write_1__SEL_1 ?
	       MUX_bml_lclBufsCF$write_1__VAL_1 :
	       MUX_bml_lclBufsCF$write_1__VAL_2 ;
  assign bml_lclBufsCF$EN =
	     wci_cState == 3'd2 &&
	     (bml_lclBufDone_314_AND_IF_bml_dpControl_wget___ETC___d2911 ||
	      NOT_bml_lclBufDone_314_381_AND_IF_bml_dpContro_ETC___d2394) ||
	     WILL_FIRE_RL_bml_initAccumulators ;
  // register bml_lclCredit
  assign bml_lclCredit$D_IN =
	     MUX_bml_lclCredit$write_1__SEL_1 ?
	       MUX_bml_lclCredit$write_1__VAL_1 :
	       16'd0 ;
  assign bml_lclCredit$EN =
	     WILL_FIRE_RL_bml_lcredit &&
	     (bml_lclBufDone && !bml_remStart ||
	      !bml_lclBufDone && bml_remStart) ||
	     WILL_FIRE_RL_bml_initAccumulators ;
  // register bml_lclDones
  assign bml_lclDones$D_IN = bml_lclDones + 16'd1 ;
  assign bml_lclDones$EN = WILL_FIRE_RL_bml_lclAdvance ;
  // register bml_lclMesgAddr
  assign bml_lclMesgAddr$D_IN =
	     WILL_FIRE_RL_bml_initAccumulators ?
	       bml_mesgBase :
	       MUX_bml_lclMesgAddr$write_1__VAL_2 ;
  assign bml_lclMesgAddr$EN =
	     WILL_FIRE_RL_bml_initAccumulators ||
	     WILL_FIRE_RL_bml_lclAdvance ;
  // register bml_lclMetaAddr
  assign bml_lclMetaAddr$D_IN =
	     WILL_FIRE_RL_bml_initAccumulators ?
	       bml_metaBase :
	       MUX_bml_lclMetaAddr$write_1__VAL_2 ;
  assign bml_lclMetaAddr$EN =
	     WILL_FIRE_RL_bml_initAccumulators ||
	     WILL_FIRE_RL_bml_lclAdvance ;
  // register bml_lclNumBufs
  assign bml_lclNumBufs$D_IN = wci_reqF$D_OUT[15:0] ;
  assign bml_lclNumBufs$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h0 ;
  // register bml_lclStarts
  assign bml_lclStarts$D_IN = bml_lclStarts + 16'd1 ;
  assign bml_lclStarts$EN = wci_cState == 3'd2 && bml_lclBufStart ;
  // register bml_mesgBase
  assign bml_mesgBase$D_IN = wci_reqF$D_OUT[15:0] ;
  assign bml_mesgBase$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h08 ;
  // register bml_mesgSize
  assign bml_mesgSize$D_IN = wci_reqF$D_OUT[15:0] ;
  assign bml_mesgSize$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h10 ;
  // register bml_metaBase
  assign bml_metaBase$D_IN = wci_reqF$D_OUT[15:0] ;
  assign bml_metaBase$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h0C ;
  // register bml_metaSize
  assign bml_metaSize$D_IN = wci_reqF$D_OUT[15:0] ;
  assign bml_metaSize$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h14 ;
  // register bml_remBuf_modulus
  assign bml_remBuf_modulus$D_IN = bml_crdBuf_modulus$D_IN ;
  assign bml_remBuf_modulus$EN = WILL_FIRE_RL_bml_initAccumulators ;
  // register bml_remBuf_value
  assign bml_remBuf_value$D_IN =
	     WILL_FIRE_RL_bml_initAccumulators ?
	       16'd0 :
	       MUX_bml_remBuf_value$write_1__VAL_3 ;
  assign bml_remBuf_value$EN =
	     WILL_FIRE_RL_bml_remAdvance ||
	     WILL_FIRE_RL_bml_initAccumulators ;
  // register bml_remDone
  assign bml_remDone$D_IN = edp_remDone ;
  assign bml_remDone$EN = 1'd1 ;
  // register bml_remDones
  assign bml_remDones$D_IN = bml_remDones + 16'd1 ;
  assign bml_remDones$EN = CAN_FIRE_RL_bml_remAdvance ;
  // register bml_remMesgAddr
  assign bml_remMesgAddr$D_IN =
	     WILL_FIRE_RL_bml_initAccumulators ?
	       bml_mesgBase :
	       MUX_bml_remMesgAddr$write_1__VAL_2 ;
  assign bml_remMesgAddr$EN =
	     WILL_FIRE_RL_bml_initAccumulators ||
	     WILL_FIRE_RL_bml_remAdvance ;
  // register bml_remMetaAddr
  assign bml_remMetaAddr$D_IN =
	     WILL_FIRE_RL_bml_initAccumulators ?
	       bml_metaBase :
	       MUX_bml_remMetaAddr$write_1__VAL_2 ;
  assign bml_remMetaAddr$EN =
	     WILL_FIRE_RL_bml_initAccumulators ||
	     WILL_FIRE_RL_bml_remAdvance ;
  // register bml_remStart
  assign bml_remStart$D_IN = edp_remStart ;
  assign bml_remStart$EN = 1'd1 ;
  // register bml_remStarts
  assign bml_remStarts$D_IN = bml_remStarts + 16'd1 ;
  assign bml_remStarts$EN = wci_cState == 3'd2 && bml_remStart ;
  // register bram_serverAdapterA_1_cnt
  assign bram_serverAdapterA_1_cnt$D_IN =
	     bram_serverAdapterA_1_cnt_44_PLUS_IF_bram_serv_ETC___d150 ;
  assign bram_serverAdapterA_1_cnt$EN =
	     bram_serverAdapterA_1_cnt_1$whas ||
	     bram_serverAdapterA_1_outData_deqCalled$whas ;
  // register bram_serverAdapterA_1_s1
  assign bram_serverAdapterA_1_s1$D_IN =
	     { bram_serverAdapterA_1_writeWithResp$whas &&
	       bram_serverAdapterA_1_s1_1$wget[1],
	       bram_serverAdapterA_1_s1_1$wget[0] } ;
  assign bram_serverAdapterA_1_s1$EN = 1'd1 ;
  // register bram_serverAdapterA_2_cnt
  assign bram_serverAdapterA_2_cnt$D_IN =
	     bram_serverAdapterA_2_cnt_62_PLUS_IF_bram_serv_ETC___d268 ;
  assign bram_serverAdapterA_2_cnt$EN =
	     bram_serverAdapterA_2_cnt_1$whas ||
	     bram_serverAdapterA_2_outData_deqCalled$whas ;
  // register bram_serverAdapterA_2_s1
  assign bram_serverAdapterA_2_s1$D_IN =
	     { bram_serverAdapterA_2_writeWithResp$whas &&
	       bram_serverAdapterA_2_s1_1$wget[1],
	       bram_serverAdapterA_2_s1_1$wget[0] } ;
  assign bram_serverAdapterA_2_s1$EN = 1'd1 ;
  // register bram_serverAdapterA_3_cnt
  assign bram_serverAdapterA_3_cnt$D_IN =
	     bram_serverAdapterA_3_cnt_80_PLUS_IF_bram_serv_ETC___d386 ;
  assign bram_serverAdapterA_3_cnt$EN =
	     bram_serverAdapterA_3_cnt_1$whas ||
	     bram_serverAdapterA_3_outData_deqCalled$whas ;
  // register bram_serverAdapterA_3_s1
  assign bram_serverAdapterA_3_s1$D_IN =
	     { bram_serverAdapterA_3_writeWithResp$whas &&
	       bram_serverAdapterA_3_s1_1$wget[1],
	       bram_serverAdapterA_3_s1_1$wget[0] } ;
  assign bram_serverAdapterA_3_s1$EN = 1'd1 ;
  // register bram_serverAdapterA_cnt
  assign bram_serverAdapterA_cnt$D_IN =
	     bram_serverAdapterA_cnt_6_PLUS_IF_bram_serverA_ETC___d32 ;
  assign bram_serverAdapterA_cnt$EN =
	     bram_serverAdapterA_cnt_1$whas ||
	     bram_serverAdapterA_outData_deqCalled$whas ;
  // register bram_serverAdapterA_s1
  assign bram_serverAdapterA_s1$D_IN =
	     { bram_serverAdapterA_writeWithResp$whas &&
	       bram_serverAdapterA_s1_1$wget[1],
	       bram_serverAdapterA_s1_1$wget[0] } ;
  assign bram_serverAdapterA_s1$EN = 1'd1 ;
  // register bram_serverAdapterB_1_cnt
  assign bram_serverAdapterB_1_cnt$D_IN =
	     bram_serverAdapterB_1_cnt_03_PLUS_IF_bram_serv_ETC___d209 ;
  assign bram_serverAdapterB_1_cnt$EN =
	     bram_serverAdapterB_1_cnt_1$whas ||
	     bram_serverAdapterB_1_outData_deqCalled$whas ;
  // register bram_serverAdapterB_1_s1
  assign bram_serverAdapterB_1_s1$D_IN =
	     { bram_serverAdapterB_1_writeWithResp$whas &&
	       bram_serverAdapterB_1_s1_1$wget[1],
	       bram_serverAdapterB_1_s1_1$wget[0] } ;
  assign bram_serverAdapterB_1_s1$EN = 1'd1 ;
  // register bram_serverAdapterB_2_cnt
  assign bram_serverAdapterB_2_cnt$D_IN =
	     bram_serverAdapterB_2_cnt_21_PLUS_IF_bram_serv_ETC___d327 ;
  assign bram_serverAdapterB_2_cnt$EN =
	     bram_serverAdapterB_2_cnt_1$whas ||
	     bram_serverAdapterB_2_outData_deqCalled$whas ;
  // register bram_serverAdapterB_2_s1
  assign bram_serverAdapterB_2_s1$D_IN =
	     { bram_serverAdapterB_2_writeWithResp$whas &&
	       bram_serverAdapterB_2_s1_1$wget[1],
	       bram_serverAdapterB_2_s1_1$wget[0] } ;
  assign bram_serverAdapterB_2_s1$EN = 1'd1 ;
  // register bram_serverAdapterB_3_cnt
  assign bram_serverAdapterB_3_cnt$D_IN =
	     bram_serverAdapterB_3_cnt_39_PLUS_IF_bram_serv_ETC___d445 ;
  assign bram_serverAdapterB_3_cnt$EN =
	     bram_serverAdapterB_3_cnt_1$whas ||
	     bram_serverAdapterB_3_outData_deqCalled$whas ;
  // register bram_serverAdapterB_3_s1
  assign bram_serverAdapterB_3_s1$D_IN =
	     { bram_serverAdapterB_3_writeWithResp$whas &&
	       bram_serverAdapterB_3_s1_1$wget[1],
	       bram_serverAdapterB_3_s1_1$wget[0] } ;
  assign bram_serverAdapterB_3_s1$EN = 1'd1 ;
  // register bram_serverAdapterB_cnt
  assign bram_serverAdapterB_cnt$D_IN =
	     bram_serverAdapterB_cnt_5_PLUS_IF_bram_serverA_ETC___d91 ;
  assign bram_serverAdapterB_cnt$EN =
	     bram_serverAdapterB_cnt_1$whas ||
	     bram_serverAdapterB_outData_deqCalled$whas ;
  // register bram_serverAdapterB_s1
  assign bram_serverAdapterB_s1$D_IN =
	     { bram_serverAdapterB_writeWithResp$whas &&
	       bram_serverAdapterB_s1_1$wget[1],
	       bram_serverAdapterB_s1_1$wget[0] } ;
  assign bram_serverAdapterB_s1$EN = 1'd1 ;
  // register dmaDoneTime
  assign dmaDoneTime$D_IN = wti_nowReq[63:0] ;
  assign dmaDoneTime$EN = edp_dmaDoneMark ;
  // register dmaStartTime
  assign dmaStartTime$D_IN = wti_nowReq[63:0] ;
  assign dmaStartTime$EN = edp_dmaStartMark ;
  // register dpControl
  assign dpControl$D_IN = wci_reqF$D_OUT[7:0] ;
  assign dpControl$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h68 ;
  // register edpDebug
  assign edpDebug$D_IN = wci_reqF$D_OUT[31:0] ;
  assign edpDebug$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'hB8 ;
  // register edp_ackCount
  assign edp_ackCount$D_IN = 8'd1 ;
  assign edp_ackCount$EN = MUX_edp_doorBell_1$wset_1__SEL_1 ;
  // register edp_ackStart
  assign edp_ackStart$D_IN = { edp_inF$D_OUT[27:20], edp_inF$D_OUT[37:30] } ;
  assign edp_ackStart$EN =
	     WILL_FIRE_RL_edp_ingress && hasPush && edp_igPtr == 4'd0 ;
  // register edp_complTimerCount
  assign edp_complTimerCount$D_IN =
	     edp_complTimerRunning ? edp_complTimerCount + 12'd1 : 12'd0 ;
  assign edp_complTimerCount$EN = 1'd1 ;
  // register edp_complTimerRunning
  assign edp_complTimerRunning$D_IN = 1'b0 ;
  assign edp_complTimerRunning$EN = 1'b0 ;
  // register edp_creditReady
  assign edp_creditReady$D_IN = edp_creditReady_1$whas ;
  assign edp_creditReady$EN = 1'd1 ;
  // register edp_dataAddr
  assign edp_dataAddr$D_IN =
	     WILL_FIRE_RL_edp_send_metaMH ?
	       edp_fabMetaAddr :
	       edp_fabMesgAddr ;
  assign edp_dataAddr$EN =
	     WILL_FIRE_RL_edp_send_metaMH || WILL_FIRE_RL_edp_send_mesgMH ;
  // register edp_dataLen
  assign edp_dataLen$D_IN =
	     WILL_FIRE_RL_edp_send_mesgMH ? edp_lastMetaV[15:0] : 16'd16 ;
  assign edp_dataLen$EN = MUX_edp_mhFsm_start_reg$write_1__SEL_2 ;
  // register edp_dbgBytesTxDeq
  assign edp_dbgBytesTxDeq$D_IN = 32'h0 ;
  assign edp_dbgBytesTxDeq$EN = 1'b0 ;
  // register edp_dbgBytesTxEnq
  assign edp_dbgBytesTxEnq$D_IN = 32'h0 ;
  assign edp_dbgBytesTxEnq$EN = 1'b0 ;
  // register edp_dmaDoTailEvent
  assign edp_dmaDoTailEvent$D_IN = 1'b0 ;
  assign edp_dmaDoTailEvent$EN = 1'b0 ;
  // register edp_dmaDoneMark
  assign edp_dmaDoneMark$D_IN = WILL_FIRE_RL_edp_dmaTailEventSender ;
  assign edp_dmaDoneMark$EN = 1'd1 ;
  // register edp_dmaPullRemainDWLen
  assign edp_dmaPullRemainDWLen$D_IN = 10'h0 ;
  assign edp_dmaPullRemainDWLen$EN = 1'b0 ;
  // register edp_dmaPullRemainDWSub
  assign edp_dmaPullRemainDWSub$D_IN = 10'h0 ;
  assign edp_dmaPullRemainDWSub$EN = 1'b0 ;
  // register edp_dmaReqTag
  assign edp_dmaReqTag$D_IN = 5'h0 ;
  assign edp_dmaReqTag$EN = 1'b0 ;
  // register edp_dmaStartMark
  assign edp_dmaStartMark$D_IN = WILL_FIRE_RL_edp_dmaRequestNearMeta ;
  assign edp_dmaStartMark$EN = 1'd1 ;
  // register edp_dmaTag
  assign edp_dmaTag$D_IN = 5'h0 ;
  assign edp_dmaTag$EN = 1'b0 ;
  // register edp_doMesgMH
  assign edp_doMesgMH$D_IN = !WILL_FIRE_RL_edp_send_mesgMH ;
  assign edp_doMesgMH$EN =
	     WILL_FIRE_RL_edp_send_mesgMH ||
	     WILL_FIRE_RL_edp_dmaResponseNearMetaBody ;
  // register edp_doMetaMH
  assign edp_doMetaMH$D_IN = !WILL_FIRE_RL_edp_send_metaMH ;
  assign edp_doMetaMH$EN =
	     WILL_FIRE_RL_edp_send_metaMH ||
	     WILL_FIRE_RL_edp_dmaRequestNearMeta ;
  // register edp_doXmtMetaBody
  assign edp_doXmtMetaBody$D_IN = !WILL_FIRE_RL_edp_dmaXmtMetaBody ;
  assign edp_doXmtMetaBody$EN =
	     WILL_FIRE_RL_edp_dmaXmtMetaBody ||
	     WILL_FIRE_RL_edp_dmaXmtMetaHead ;
  // register edp_doorBell
  assign edp_doorBell$D_IN = edp_doorBell_1$whas ;
  assign edp_doorBell$EN = 1'd1 ;
  // register edp_doorSeqDwell
  assign edp_doorSeqDwell$D_IN =
	     (edp_doorSeqDwell != 4'd0) ?
	       MUX_edp_doorSeqDwell$write_1__VAL_1 :
	       4'd8 ;
  assign edp_doorSeqDwell$EN =
	     edp_doorSeqDwell != 4'd0 || WILL_FIRE_RL_edp_dmaXmtDoorbell ;
  // register edp_fabFlowAddr
  assign edp_fabFlowAddr$D_IN = bml_fabFlowAddr ;
  assign edp_fabFlowAddr$EN = 1'd1 ;
  // register edp_fabFlowAddrMS
  assign edp_fabFlowAddrMS$D_IN = bml_fabFlowBaseMS ;
  assign edp_fabFlowAddrMS$EN = 1'd1 ;
  // register edp_fabMesgAccu
  assign edp_fabMesgAccu$D_IN =
	     WILL_FIRE_RL_edp_dmaResponseNearMetaBody ?
	       edp_fabMesgAddr :
	       MUX_edp_fabMesgAccu$write_1__VAL_2 ;
  assign edp_fabMesgAccu$EN =
	     WILL_FIRE_RL_edp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_edp_dmaPushResponseHeader ;
  // register edp_fabMesgAddr
  assign edp_fabMesgAddr$D_IN = bml_fabMesgAddr ;
  assign edp_fabMesgAddr$EN = 1'd1 ;
  // register edp_fabMesgAddrMS
  assign edp_fabMesgAddrMS$D_IN = bml_fabMesgBaseMS ;
  assign edp_fabMesgAddrMS$EN = 1'd1 ;
  // register edp_fabMeta
  assign edp_fabMeta$D_IN =
	     MUX_edp_fabMeta$write_1__SEL_1 ?
	       129'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA :
	       MUX_edp_fabMeta$write_1__VAL_2 ;
  assign edp_fabMeta$EN =
	     WILL_FIRE_RL_edp_dmaTailEventSender &&
	     (edp_fabFlowAddrMS == 32'd0 || edp_sentTail4DWHeader) ||
	     WILL_FIRE_RL_edp_dmaResponseNearMetaBody ;
  // register edp_fabMetaAddr
  assign edp_fabMetaAddr$D_IN = bml_fabMetaAddr ;
  assign edp_fabMetaAddr$EN = 1'd1 ;
  // register edp_fabMetaAddrMS
  assign edp_fabMetaAddrMS$D_IN = bml_fabMetaBaseMS ;
  assign edp_fabMetaAddrMS$EN = 1'd1 ;
  // register edp_farBufReady
  assign edp_farBufReady$D_IN = edp_farBufReady_1$whas ;
  assign edp_farBufReady$EN = 1'd1 ;
  // register edp_fhFsm_start_reg
  assign edp_fhFsm_start_reg$D_IN = !WILL_FIRE_RL_edp_fhFsm_fsm_start ;
  assign edp_fhFsm_start_reg$EN =
	     WILL_FIRE_RL_edp_fhFsm_fsm_start ||
	     WILL_FIRE_RL_edp_dmaRequestNearMeta ;
  // register edp_fhFsm_start_reg_1
  assign edp_fhFsm_start_reg_1$D_IN = edp_fhFsm_start_reg_1_1$whas ;
  assign edp_fhFsm_start_reg_1$EN = 1'd1 ;
  // register edp_fhFsm_state_can_overlap
  assign edp_fhFsm_state_can_overlap$D_IN =
	     edp_fhFsm_state_set_pw$whas || edp_fhFsm_state_can_overlap ;
  assign edp_fhFsm_state_can_overlap$EN = 1'd1 ;
  // register edp_fhFsm_state_fired
  assign edp_fhFsm_state_fired$D_IN = edp_fhFsm_state_set_pw$whas ;
  assign edp_fhFsm_state_fired$EN = 1'd1 ;
  // register edp_fhFsm_state_mkFSMstate
  always@(WILL_FIRE_RL_edp_fhFsm_idle_l183c3 or
	  WILL_FIRE_RL_edp_fhFsm_action_l184c11 or
	  WILL_FIRE_RL_edp_fhFsm_action_l185c11 or
	  WILL_FIRE_RL_edp_fhFsm_action_l186c11)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_edp_fhFsm_idle_l183c3:
	  edp_fhFsm_state_mkFSMstate$D_IN = 3'd0;
      WILL_FIRE_RL_edp_fhFsm_action_l184c11:
	  edp_fhFsm_state_mkFSMstate$D_IN = 3'd1;
      WILL_FIRE_RL_edp_fhFsm_action_l185c11:
	  edp_fhFsm_state_mkFSMstate$D_IN = 3'd2;
      WILL_FIRE_RL_edp_fhFsm_action_l186c11:
	  edp_fhFsm_state_mkFSMstate$D_IN = 3'd3;
      default: edp_fhFsm_state_mkFSMstate$D_IN =
		   3'b010 /* unspecified value */ ;
    endcase
  end
  assign edp_fhFsm_state_mkFSMstate$EN =
	     WILL_FIRE_RL_edp_fhFsm_idle_l183c3 ||
	     WILL_FIRE_RL_edp_fhFsm_action_l184c11 ||
	     WILL_FIRE_RL_edp_fhFsm_action_l185c11 ||
	     WILL_FIRE_RL_edp_fhFsm_action_l186c11 ;
  // register edp_firstMesgMH
  assign edp_firstMesgMH$D_IN = 1'b0 ;
  assign edp_firstMesgMH$EN = 1'b0 ;
  // register edp_firstMetaMH
  assign edp_firstMetaMH$D_IN = 1'b0 ;
  assign edp_firstMetaMH$EN = 1'b0 ;
  // register edp_flowDiagCount
  assign edp_flowDiagCount$D_IN = edp_flowDiagCount + 32'd1 ;
  assign edp_flowDiagCount$EN = WILL_FIRE_RL_edp_dmaXmtDoorbell ;
  // register edp_frameNumber
  assign edp_frameNumber$D_IN = edp_frameNumber + 16'd1 ;
  assign edp_frameNumber$EN = WILL_FIRE_RL_edp_dmaRequestNearMeta ;
  // register edp_frmAckOK
  assign edp_frmAckOK$D_IN =
	     MUX_edp_frmAckOK$write_1__SEL_1 && x__h97353 != 4'd0 ;
  assign edp_frmAckOK$EN =
	     WILL_FIRE_RL_edp_ingress && hasPush ||
	     WILL_FIRE_RL_edp_dmaRequestNearMeta ;
  // register edp_frmFlags
  assign edp_frmFlags$D_IN = 8'h0 ;
  assign edp_frmFlags$EN = 1'b0 ;
  // register edp_frmMesgBusy
  assign edp_frmMesgBusy$D_IN = !WILL_FIRE_RL_edp_dmaXmtTailEvent ;
  assign edp_frmMesgBusy$EN =
	     WILL_FIRE_RL_edp_dmaXmtTailEvent ||
	     WILL_FIRE_RL_edp_dmaRequestNearMeta ;
  // register edp_gotResponseHeader
  assign edp_gotResponseHeader$D_IN = 1'b0 ;
  assign edp_gotResponseHeader$EN = 1'b0 ;
  // register edp_igAC
  assign edp_igAC$D_IN = edp_inF$D_OUT[17:10] ;
  assign edp_igAC$EN = WILL_FIRE_RL_edp_ingress && edp_igPtr == 4'd1 ;
  // register edp_igAS
  assign edp_igAS$D_IN = edp_ackStart$D_IN ;
  assign edp_igAS$EN = WILL_FIRE_RL_edp_ingress && edp_igPtr == 4'd1 ;
  // register edp_igDID
  assign edp_igDID$D_IN = 16'h0 ;
  assign edp_igDID$EN = 1'b0 ;
  // register edp_igF
  assign edp_igF$D_IN = edp_inF$D_OUT[7:0] ;
  assign edp_igF$EN = WILL_FIRE_RL_edp_ingress && edp_igPtr == 4'd1 ;
  // register edp_igFS
  assign edp_igFS$D_IN = { edp_inF$D_OUT[7:0], edp_inF$D_OUT[17:10] } ;
  assign edp_igFS$EN = WILL_FIRE_RL_edp_ingress && edp_igPtr == 4'd0 ;
  // register edp_igPtr
  assign edp_igPtr$D_IN =
	     (x__h97353 == 4'd0) ?
	       ((edp_igPtr == 4'd15) ? edp_igPtr : edp_igPtr + 4'd1) :
	       4'd0 ;
  assign edp_igPtr$EN = WILL_FIRE_RL_edp_ingress ;
  // register edp_igSID
  assign edp_igSID$D_IN = edp_ackStart$D_IN ;
  assign edp_igSID$EN = WILL_FIRE_RL_edp_ingress && edp_igPtr == 4'd0 ;
  // register edp_inIgnorePkt
  assign edp_inIgnorePkt$D_IN = 1'b0 ;
  assign edp_inIgnorePkt$EN = 1'b0 ;
  // register edp_lastMetaV
  assign edp_lastMetaV$D_IN = x__h79939 ;
  assign edp_lastMetaV$EN = WILL_FIRE_RL_edp_dmaResponseNearMetaHead ;
  // register edp_lastMetaV_1
  assign edp_lastMetaV_1$D_IN = opcode__h81723 ;
  assign edp_lastMetaV_1$EN = WILL_FIRE_RL_edp_dmaResponseNearMetaBody ;
  // register edp_lastMetaV_2
  assign edp_lastMetaV_2$D_IN = nowMS__h82954 ;
  assign edp_lastMetaV_2$EN = WILL_FIRE_RL_edp_dmaResponseNearMetaBody ;
  // register edp_lastMetaV_3
  assign edp_lastMetaV_3$D_IN = nowLS__h83897 ;
  assign edp_lastMetaV_3$EN = WILL_FIRE_RL_edp_dmaResponseNearMetaBody ;
  // register edp_lastRuleFired
  assign edp_lastRuleFired$D_IN =
	     (edp_fabFlowAddrMS == 32'd0) ?
	       4'd8 :
	       (edp_sentTail4DWHeader ? 4'd10 : 4'd9) ;
  assign edp_lastRuleFired$EN = WILL_FIRE_RL_edp_dmaTailEventSender ;
  // register edp_maxPayloadSize
  assign edp_maxPayloadSize$D_IN = 13'h0 ;
  assign edp_maxPayloadSize$EN = 1'b0 ;
  // register edp_maxReadReqSize
  assign edp_maxReadReqSize$D_IN = 13'h0 ;
  assign edp_maxReadReqSize$EN = 1'b0 ;
  // register edp_mesgComplReceived
  assign edp_mesgComplReceived$D_IN = 17'h0 ;
  assign edp_mesgComplReceived$EN = 1'b0 ;
  // register edp_mesgLengthRemainPull
  assign edp_mesgLengthRemainPull$D_IN = 17'h0 ;
  assign edp_mesgLengthRemainPull$EN = 1'b0 ;
  // register edp_mesgLengthRemainPush
  always@(WILL_FIRE_RL_edp_dmaResponseNearMetaBody or
	  MUX_edp_mesgLengthRemainPush$write_1__VAL_1 or
	  WILL_FIRE_RL_edp_dmaResponseNearMetaHead or
	  MUX_edp_mesgLengthRemainPush$write_1__VAL_2 or
	  WILL_FIRE_RL_edp_dmaPushRequestMesg or
	  MUX_edp_mesgLengthRemainPush$write_1__VAL_3)
  case (1'b1)
    WILL_FIRE_RL_edp_dmaResponseNearMetaBody:
	edp_mesgLengthRemainPush$D_IN =
	    MUX_edp_mesgLengthRemainPush$write_1__VAL_1;
    WILL_FIRE_RL_edp_dmaResponseNearMetaHead:
	edp_mesgLengthRemainPush$D_IN =
	    MUX_edp_mesgLengthRemainPush$write_1__VAL_2;
    WILL_FIRE_RL_edp_dmaPushRequestMesg:
	edp_mesgLengthRemainPush$D_IN =
	    MUX_edp_mesgLengthRemainPush$write_1__VAL_3;
    default: edp_mesgLengthRemainPush$D_IN =
		 17'b01010101010101010 /* unspecified value */ ;
  endcase
  assign edp_mesgLengthRemainPush$EN =
	     WILL_FIRE_RL_edp_dmaResponseNearMetaHead ||
	     WILL_FIRE_RL_edp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_edp_dmaPushRequestMesg ;
  // register edp_mesgSeq
  assign edp_mesgSeq$D_IN = WILL_FIRE_RL_edp_send_metaMH ? 16'd0 : 16'd1 ;
  assign edp_mesgSeq$EN =
	     WILL_FIRE_RL_edp_send_metaMH || WILL_FIRE_RL_edp_send_mesgMH ;
  // register edp_mhFlags
  assign edp_mhFlags$D_IN = WILL_FIRE_RL_edp_send_mesgMH ? 8'd0 : 8'd1 ;
  assign edp_mhFlags$EN = MUX_edp_mhFsm_start_reg$write_1__SEL_2 ;
  // register edp_mhFsm_start_reg
  assign edp_mhFsm_start_reg$D_IN = !WILL_FIRE_RL_edp_mhFsm_fsm_start ;
  assign edp_mhFsm_start_reg$EN =
	     WILL_FIRE_RL_edp_mhFsm_fsm_start ||
	     WILL_FIRE_RL_edp_send_mesgMH ||
	     WILL_FIRE_RL_edp_send_metaMH ;
  // register edp_mhFsm_start_reg_1
  assign edp_mhFsm_start_reg_1$D_IN = edp_mhFsm_start_wire$whas ;
  assign edp_mhFsm_start_reg_1$EN = 1'd1 ;
  // register edp_mhFsm_state_can_overlap
  assign edp_mhFsm_state_can_overlap$D_IN =
	     edp_mhFsm_state_set_pw$whas || edp_mhFsm_state_can_overlap ;
  assign edp_mhFsm_state_can_overlap$EN = 1'd1 ;
  // register edp_mhFsm_state_fired
  assign edp_mhFsm_state_fired$D_IN = edp_mhFsm_state_set_pw$whas ;
  assign edp_mhFsm_state_fired$EN = 1'd1 ;
  // register edp_mhFsm_state_mkFSMstate
  always@(WILL_FIRE_RL_edp_mhFsm_idle_l191c3 or
	  WILL_FIRE_RL_edp_mhFsm_action_l192c11 or
	  WILL_FIRE_RL_edp_mhFsm_action_l193c11 or
	  WILL_FIRE_RL_edp_mhFsm_action_l194c11 or
	  WILL_FIRE_RL_edp_mhFsm_action_l195c11 or
	  WILL_FIRE_RL_edp_mhFsm_action_l196c11 or
	  WILL_FIRE_RL_edp_mhFsm_action_l197c11)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_edp_mhFsm_idle_l191c3:
	  edp_mhFsm_state_mkFSMstate$D_IN = 4'd0;
      WILL_FIRE_RL_edp_mhFsm_action_l192c11:
	  edp_mhFsm_state_mkFSMstate$D_IN = 4'd1;
      WILL_FIRE_RL_edp_mhFsm_action_l193c11:
	  edp_mhFsm_state_mkFSMstate$D_IN = 4'd2;
      WILL_FIRE_RL_edp_mhFsm_action_l194c11:
	  edp_mhFsm_state_mkFSMstate$D_IN = 4'd3;
      WILL_FIRE_RL_edp_mhFsm_action_l195c11:
	  edp_mhFsm_state_mkFSMstate$D_IN = 4'd4;
      WILL_FIRE_RL_edp_mhFsm_action_l196c11:
	  edp_mhFsm_state_mkFSMstate$D_IN = 4'd5;
      WILL_FIRE_RL_edp_mhFsm_action_l197c11:
	  edp_mhFsm_state_mkFSMstate$D_IN = 4'd6;
      default: edp_mhFsm_state_mkFSMstate$D_IN =
		   4'b1010 /* unspecified value */ ;
    endcase
  end
  assign edp_mhFsm_state_mkFSMstate$EN =
	     WILL_FIRE_RL_edp_mhFsm_idle_l191c3 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l192c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l193c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l194c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l195c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l196c11 ||
	     WILL_FIRE_RL_edp_mhFsm_action_l197c11 ;
  // register edp_mhType
  assign edp_mhType$D_IN = WILL_FIRE_RL_edp_send_mesgMH ? 8'd0 : 8'd1 ;
  assign edp_mhType$EN = MUX_edp_mhFsm_start_reg$write_1__SEL_2 ;
  // register edp_nearBufReady
  assign edp_nearBufReady$D_IN = edp_nearBufReady_1$whas ;
  assign edp_nearBufReady$EN = 1'd1 ;
  // register edp_outBF_rCache
  assign edp_outBF_rCache$D_IN =
	     { 1'd1,
	       edp_outBF_rWrPtr,
	       IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2800,
	       IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2803,
	       IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2801,
	       IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2802 } ;
  assign edp_outBF_rCache$EN = edp_outBF_pwEnqueue$whas ;
  // register edp_outBF_rRdPtr
  assign edp_outBF_rRdPtr$D_IN = x__h20843 ;
  assign edp_outBF_rRdPtr$EN = edp_outBF_pwDequeue$whas ;
  // register edp_outBF_rWrPtr
  assign edp_outBF_rWrPtr$D_IN = edp_outBF_rWrPtr + 12'd1 ;
  assign edp_outBF_rWrPtr$EN = edp_outBF_pwEnqueue$whas ;
  // register edp_outDwRemain
  assign edp_outDwRemain$D_IN =
	     WILL_FIRE_RL_edp_dmaPushResponseHeader ?
	       MUX_edp_outDwRemain$write_1__VAL_1 :
	       MUX_edp_outDwRemain$write_1__VAL_2 ;
  assign edp_outDwRemain$EN =
	     WILL_FIRE_RL_edp_dmaPushResponseHeader ||
	     WILL_FIRE_RL_edp_dmaPushResponseBody ;
  // register edp_outFunl_ptr
  assign edp_outFunl_ptr$D_IN = edp_outFunl_ptr + 2'd1 ;
  assign edp_outFunl_ptr$EN =
	     edp_outFunl_outF$FULL_N && edp_outFunl_inF$EMPTY_N ;
  // register edp_postSeqDwell
  assign edp_postSeqDwell$D_IN =
	     MUX_edp_fabMeta$write_1__SEL_1 ?
	       MUX_edp_postSeqDwell$write_1__VAL_1 :
	       MUX_edp_postSeqDwell$write_1__VAL_2 ;
  assign edp_postSeqDwell$EN =
	     WILL_FIRE_RL_edp_dmaTailEventSender &&
	     (edp_fabFlowAddrMS == 32'd0 || edp_sentTail4DWHeader) ||
	     edp_postSeqDwell != 4'd0 ;
  // register edp_pullTagMatch
  assign edp_pullTagMatch$D_IN = 1'b0 ;
  assign edp_pullTagMatch$EN = 1'd1 ;
  // register edp_rcvDA
  assign edp_rcvDA$D_IN = (edp_rcvPtr == 4'd4) ? rdw__h101824 : x__h105432 ;
  assign edp_rcvDA$EN =
	     WILL_FIRE_RL_edp_rcv_message &&
	     (edp_rcvPtr == 4'd4 ||
	      !edp_rcvPtr_824_ULE_5___d1825 && edp_rcvDL != 16'd0) ;
  // register edp_rcvDL
  assign edp_rcvDL$D_IN = (edp_rcvPtr == 4'd5) ? x__h105051 : x__h105463 ;
  assign edp_rcvDL$EN =
	     WILL_FIRE_RL_edp_rcv_message &&
	     (edp_rcvPtr == 4'd5 ||
	      !edp_rcvPtr_824_ULE_5___d1825 && edp_rcvDL != 16'd0) ;
  // register edp_rcvDoCompletion
  assign edp_rcvDoCompletion$D_IN =
	     WILL_FIRE_RL_edp_rcv_message &&
	     MUX_edp_rcvDoCompletion$write_1__VAL_1 ;
  assign edp_rcvDoCompletion$EN =
	     WILL_FIRE_RL_edp_rcv_message || WILL_FIRE_RL_edp_rcv_completion ;
  // register edp_rcvFA
  assign edp_rcvFA$D_IN = rdw__h101824 ;
  assign edp_rcvFA$EN = WILL_FIRE_RL_edp_rcv_message && edp_rcvPtr == 4'd1 ;
  // register edp_rcvFV
  assign edp_rcvFV$D_IN = rdw__h101824 ;
  assign edp_rcvFV$EN = WILL_FIRE_RL_edp_rcv_message && edp_rcvPtr == 4'd2 ;
  // register edp_rcvLiveDA
  assign edp_rcvLiveDA$D_IN = 32'h0 ;
  assign edp_rcvLiveDA$EN = 1'b0 ;
  // register edp_rcvLiveDL
  assign edp_rcvLiveDL$D_IN = 16'h0 ;
  assign edp_rcvLiveDL$EN = 1'b0 ;
  // register edp_rcvMS
  assign edp_rcvMS$D_IN = x__h105091 ;
  assign edp_rcvMS$EN = WILL_FIRE_RL_edp_rcv_message && edp_rcvPtr == 4'd3 ;
  // register edp_rcvMT
  assign edp_rcvMT$D_IN = edp_inProcF$D_OUT[17:10] ;
  assign edp_rcvMT$EN = WILL_FIRE_RL_edp_rcv_message && edp_rcvPtr == 4'd5 ;
  // register edp_rcvNM
  assign edp_rcvNM$D_IN = x__h105051 ;
  assign edp_rcvNM$EN = WILL_FIRE_RL_edp_rcv_message && edp_rcvPtr == 4'd3 ;
  // register edp_rcvPtr
  assign edp_rcvPtr$D_IN =
	     (x__h101850 != 4'd0 ||
	      !edp_rcvPtr_824_ULE_5___d1825 && edp_rcvDL == 16'd0) ?
	       4'd0 :
	       ((edp_rcvPtr == 4'd15) ? edp_rcvPtr : edp_rcvPtr + 4'd1) ;
  assign edp_rcvPtr$EN = WILL_FIRE_RL_edp_rcv_message ;
  // register edp_rcvTID
  assign edp_rcvTID$D_IN = rdw__h101824 ;
  assign edp_rcvTID$EN = WILL_FIRE_RL_edp_rcv_message && edp_rcvPtr == 4'd0 ;
  // register edp_rcvTM
  assign edp_rcvTM$D_IN = edp_inProcF$D_OUT[7:0] ;
  assign edp_rcvTM$EN = WILL_FIRE_RL_edp_rcv_message && edp_rcvPtr == 4'd5 ;
  // register edp_remDone
  assign edp_remDone$D_IN = edp_remDone_1$whas ;
  assign edp_remDone$EN = 1'd1 ;
  // register edp_remMesgAccu
  assign edp_remMesgAccu$D_IN =
	     WILL_FIRE_RL_edp_dmaResponseNearMetaBody ?
	       edp_remMesgAddr :
	       MUX_edp_remMesgAccu$write_1__VAL_2 ;
  assign edp_remMesgAccu$EN =
	     WILL_FIRE_RL_edp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_edp_dmaPushRequestMesg ;
  // register edp_remMesgAddr
  assign edp_remMesgAddr$D_IN = bml_remMesgAddr ;
  assign edp_remMesgAddr$EN = 1'd1 ;
  // register edp_remMetaAddr
  assign edp_remMetaAddr$D_IN = bml_remMetaAddr ;
  assign edp_remMetaAddr$EN = 1'd1 ;
  // register edp_remStart
  assign edp_remStart$D_IN = edp_remStart_1$whas ;
  assign edp_remStart$EN = 1'd1 ;
  // register edp_reqMesgInFlight
  assign edp_reqMesgInFlight$D_IN = 1'b0 ;
  assign edp_reqMesgInFlight$EN = 1'b0 ;
  // register edp_reqMetaBodyInFlight
  assign edp_reqMetaBodyInFlight$D_IN = 1'b0 ;
  assign edp_reqMetaBodyInFlight$EN = 1'b0 ;
  // register edp_reqMetaInFlight
  assign edp_reqMetaInFlight$D_IN =
	     !WILL_FIRE_RL_edp_dmaResponseNearMetaBody ;
  assign edp_reqMetaInFlight$EN =
	     WILL_FIRE_RL_edp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_edp_dmaRequestNearMeta ;
  // register edp_sentTail4DWHeader
  assign edp_sentTail4DWHeader$D_IN = !edp_sentTail4DWHeader ;
  assign edp_sentTail4DWHeader$EN = MUX_edp_tlpXmtBusy$write_1__SEL_1 ;
  // register edp_srcMesgAccu
  assign edp_srcMesgAccu$D_IN =
	     WILL_FIRE_RL_edp_dmaResponseNearMetaBody ?
	       edp_fabMesgAddr :
	       MUX_edp_srcMesgAccu$write_1__VAL_2 ;
  assign edp_srcMesgAccu$EN =
	     WILL_FIRE_RL_edp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_edp_dmaPushRequestMesg ;
  // register edp_tlpBRAM_debugBdata
  assign edp_tlpBRAM_debugBdata$D_IN =
	     { bram_serverAdapterA_3_outData_outData$wget[7:0],
	       bram_serverAdapterA_3_outData_outData$wget[15:8],
	       bram_serverAdapterA_3_outData_outData$wget[23:16],
	       bram_serverAdapterA_3_outData_outData$wget[31:24],
	       bram_serverAdapterA_2_outData_outData$wget[7:0],
	       bram_serverAdapterA_2_outData_outData$wget[15:8],
	       bram_serverAdapterA_2_outData_outData$wget[23:16],
	       bram_serverAdapterA_2_outData_outData$wget[31:24],
	       bram_serverAdapterA_1_outData_outData$wget[7:0],
	       bram_serverAdapterA_1_outData_outData$wget[15:8],
	       bram_serverAdapterA_1_outData_outData$wget[23:16],
	       bram_serverAdapterA_1_outData_outData$wget[31:24],
	       bram_serverAdapterA_outData_outData$wget[7:0],
	       bram_serverAdapterA_outData_outData$wget[15:8],
	       bram_serverAdapterA_outData_outData$wget[23:16],
	       bram_serverAdapterA_outData_outData$wget[31:24] } ;
  assign edp_tlpBRAM_debugBdata$EN = WILL_FIRE_RL_edp_tlpBRAM_read_NextResp ;
  // register edp_tlpBRAM_rdRespDwRemain
  assign edp_tlpBRAM_rdRespDwRemain$D_IN =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstResp ?
	       MUX_edp_tlpBRAM_rdRespDwRemain$write_1__VAL_1 :
	       MUX_edp_tlpBRAM_rdRespDwRemain$write_1__VAL_2 ;
  assign edp_tlpBRAM_rdRespDwRemain$EN =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstResp ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextResp ;
  // register edp_tlpBRAM_readHeaderSent
  assign edp_tlpBRAM_readHeaderSent$D_IN =
	     MUX_edp_tlpBRAM_readHeaderSent$write_1__SEL_1 ;
  assign edp_tlpBRAM_readHeaderSent$EN =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstResp &&
	     (edp_tlpBRAM_readReq$D_OUT[28:19] != 10'd1 ||
	      edp_tlpBRAM_readReq$D_OUT[60]) ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextResp &&
	     edp_tlpBRAM_rdRespDwRemain_188_ULE_4___d1190 ;
  // register edp_tlpBRAM_readNxtDWAddr
  assign edp_tlpBRAM_readNxtDWAddr$D_IN =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq ?
	       MUX_edp_tlpBRAM_readNxtDWAddr$write_1__VAL_1 :
	       MUX_edp_tlpBRAM_readNxtDWAddr$write_1__VAL_2 ;
  assign edp_tlpBRAM_readNxtDWAddr$EN =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextReq ;
  // register edp_tlpBRAM_readRemainDWLen
  assign edp_tlpBRAM_readRemainDWLen$D_IN =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq ?
	       MUX_edp_tlpBRAM_readRemainDWLen$write_1__VAL_1 :
	       MUX_edp_tlpBRAM_readRemainDWLen$write_1__VAL_2 ;
  assign edp_tlpBRAM_readRemainDWLen$EN =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextReq ;
  // register edp_tlpBRAM_readStarted
  assign edp_tlpBRAM_readStarted$D_IN =
	     MUX_edp_tlpBRAM_readStarted$write_1__SEL_1 ;
  assign edp_tlpBRAM_readStarted$EN =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq &&
	     (edp_tlpBRAM_mReqF$D_OUT[28:19] != 10'd1 ||
	      edp_tlpBRAM_mReqF$D_OUT[60]) ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextReq &&
	     edp_tlpBRAM_readRemainDWLen_010_ULE_4___d1011 ;
  // register edp_tlpBRAM_writeDWAddr
  assign edp_tlpBRAM_writeDWAddr$D_IN =
	     WILL_FIRE_RL_edp_tlpBRAM_writeReq ?
	       MUX_edp_tlpBRAM_writeDWAddr$write_1__VAL_1 :
	       MUX_edp_tlpBRAM_writeDWAddr$write_1__VAL_2 ;
  assign edp_tlpBRAM_writeDWAddr$EN =
	     WILL_FIRE_RL_edp_tlpBRAM_writeReq ||
	     WILL_FIRE_RL_edp_tlpBRAM_writeData ;
  // register edp_tlpBRAM_writeLastBE
  assign edp_tlpBRAM_writeLastBE$D_IN = edp_tlpBRAM_mReqF$D_OUT[35:32] ;
  assign edp_tlpBRAM_writeLastBE$EN = WILL_FIRE_RL_edp_tlpBRAM_writeReq ;
  // register edp_tlpBRAM_writeRemainDWLen
  assign edp_tlpBRAM_writeRemainDWLen$D_IN =
	     WILL_FIRE_RL_edp_tlpBRAM_writeReq ?
	       MUX_edp_tlpBRAM_writeRemainDWLen$write_1__VAL_1 :
	       MUX_edp_tlpBRAM_writeRemainDWLen$write_1__VAL_2 ;
  assign edp_tlpBRAM_writeRemainDWLen$EN =
	     WILL_FIRE_RL_edp_tlpBRAM_writeReq ||
	     WILL_FIRE_RL_edp_tlpBRAM_writeData ;
  // register edp_tlpMetaSent
  assign edp_tlpMetaSent$D_IN = WILL_FIRE_RL_edp_dmaXmtMetaBody ;
  assign edp_tlpMetaSent$EN =
	     WILL_FIRE_RL_edp_dmaXmtTailEvent ||
	     WILL_FIRE_RL_edp_dmaXmtMetaBody ;
  // register edp_tlpRcvBusy
  assign edp_tlpRcvBusy$D_IN = 1'b0 ;
  assign edp_tlpRcvBusy$EN = 1'b0 ;
  // register edp_tlpXmtBusy
  always@(MUX_edp_tlpXmtBusy$write_1__SEL_1 or
	  edp_sentTail4DWHeader or
	  WILL_FIRE_RL_edp_dmaXmtMetaBody or
	  MUX_edp_tlpXmtBusy$write_1__SEL_3 or
	  WILL_FIRE_RL_edp_dmaXmtMetaHead or
	  WILL_FIRE_RL_edp_dmaPushResponseHeader)
  case (1'b1)
    MUX_edp_tlpXmtBusy$write_1__SEL_1:
	edp_tlpXmtBusy$D_IN = !edp_sentTail4DWHeader;
    WILL_FIRE_RL_edp_dmaXmtMetaBody || MUX_edp_tlpXmtBusy$write_1__SEL_3:
	edp_tlpXmtBusy$D_IN = 1'd0;
    WILL_FIRE_RL_edp_dmaXmtMetaHead || WILL_FIRE_RL_edp_dmaPushResponseHeader:
	edp_tlpXmtBusy$D_IN = 1'd1;
    default: edp_tlpXmtBusy$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign edp_tlpXmtBusy$EN =
	     WILL_FIRE_RL_edp_dmaPushResponseBody &&
	     edp_outDwRemain_622_ULE_4___d1624 ||
	     WILL_FIRE_RL_edp_dmaTailEventSender &&
	     edp_fabFlowAddrMS != 32'd0 ||
	     WILL_FIRE_RL_edp_dmaXmtMetaBody ||
	     WILL_FIRE_RL_edp_dmaXmtMetaHead ||
	     WILL_FIRE_RL_edp_dmaPushResponseHeader ;
  // register edp_xactionNumber
  assign edp_xactionNumber$D_IN = 32'h0 ;
  assign edp_xactionNumber$EN = 1'b0 ;
  // register edp_xmtMetaInFlight
  assign edp_xmtMetaInFlight$D_IN = !WILL_FIRE_RL_edp_dmaXmtTailEvent ;
  assign edp_xmtMetaInFlight$EN =
	     WILL_FIRE_RL_edp_dmaXmtTailEvent ||
	     WILL_FIRE_RL_edp_dmaXmtMetaHead ;
  // register edp_xmtMetaOK
  always@(WILL_FIRE_RL_edp_dmaResponseNearMetaBody or
	  edp_mesgLengthRemainPush or
	  MUX_edp_xmtMetaOK$write_1__SEL_2 or WILL_FIRE_RL_edp_dmaXmtMetaHead)
  case (1'b1)
    WILL_FIRE_RL_edp_dmaResponseNearMetaBody:
	edp_xmtMetaOK$D_IN = edp_mesgLengthRemainPush == 17'd0;
    MUX_edp_xmtMetaOK$write_1__SEL_2: edp_xmtMetaOK$D_IN = 1'd1;
    WILL_FIRE_RL_edp_dmaXmtMetaHead: edp_xmtMetaOK$D_IN = 1'd0;
    default: edp_xmtMetaOK$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign edp_xmtMetaOK$EN =
	     WILL_FIRE_RL_edp_dmaPushResponseBody &&
	     edp_outDwRemain_622_ULE_4___d1624 &&
	     edp_tlpBRAM_mRespF$D_OUT[135:128] == 8'h01 ||
	     WILL_FIRE_RL_edp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_edp_dmaXmtMetaHead ;
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
  // register wmi_addr
  assign wmi_addr$D_IN =
	     MUX_wmi_doneWithMesg$write_1__PSEL_1 ?
	       MUX_wmi_addr$write_1__VAL_1 :
	       wmi_wmi_reqF$D_OUT[25:12] ;
  assign wmi_addr$EN =
	     WILL_FIRE_RL_wmi_doReadReq || WILL_FIRE_RL_wmi_doWriteReq ||
	     WILL_FIRE_RL_wmi_getRequest ;
  // register wmi_bufDwell
  assign wmi_bufDwell$D_IN =
	     (MUX_wmi_bufDwell$write_1__SEL_1 ||
	      WILL_FIRE_RL_wmi_doWriteFinalize) ?
	       2'd3 :
	       MUX_wmi_bufDwell$write_1__VAL_3 ;
  assign wmi_bufDwell$EN =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_bytesRemainReq == 14'd4 &&
	     wmi_doneWithMesg ||
	     wmi_bufDwell != 2'd0 ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  // register wmi_bytesRemainReq
  assign wmi_bytesRemainReq$D_IN =
	     MUX_wmi_doneWithMesg$write_1__PSEL_1 ?
	       MUX_wmi_bytesRemainReq$write_1__VAL_1 :
	       MUX_wmi_bytesRemainReq$write_1__VAL_2 ;
  assign wmi_bytesRemainReq$EN =
	     WILL_FIRE_RL_wmi_doReadReq || WILL_FIRE_RL_wmi_doWriteReq ||
	     WILL_FIRE_RL_wmi_getRequest ;
  // register wmi_bytesRemainResp
  assign wmi_bytesRemainResp$D_IN =
	     MUX_wmi_bytesRemainResp$write_1__SEL_1 ?
	       MUX_wmi_bytesRemainReq$write_1__VAL_2 :
	       MUX_wmi_bytesRemainResp$write_1__VAL_2 ;
  assign wmi_bytesRemainResp$EN =
	     WILL_FIRE_RL_wmi_getRequest &&
	     wmi_wmi_reqF$D_OUT[31:29] == 3'd2 ||
	     WILL_FIRE_RL_wmi_doReadResp ;
  // register wmi_doneWithMesg
  assign wmi_doneWithMesg$D_IN =
	     !MUX_wmi_doneWithMesg$write_1__SEL_1 && wmi_wmi_reqF$D_OUT[27] ;
  assign wmi_doneWithMesg$EN =
	     (WILL_FIRE_RL_wmi_doReadReq || WILL_FIRE_RL_wmi_doWriteReq) &&
	     wmi_bytesRemainReq == 14'd4 &&
	     wmi_doneWithMesg ||
	     WILL_FIRE_RL_wmi_getRequest ;
  // register wmi_lastMesg
  assign wmi_lastMesg$D_IN = wmi_thisMesg ;
  assign wmi_lastMesg$EN = WILL_FIRE_RL_wmi_doWriteFinalize ;
  // register wmi_lclMesgAddr
  assign wmi_lclMesgAddr$D_IN = bml_lclMesgAddr[14:0] ;
  assign wmi_lclMesgAddr$EN = 1'd1 ;
  // register wmi_lclMetaAddr
  assign wmi_lclMetaAddr$D_IN = bml_lclMetaAddr[14:0] ;
  assign wmi_lclMetaAddr$EN = 1'd1 ;
  // register wmi_mesgBufReady
  assign wmi_mesgBufReady$D_IN = wmi_mesgBufReady_1$whas ;
  assign wmi_mesgBufReady$EN = 1'd1 ;
  // register wmi_mesgBusy
  assign wmi_mesgBusy$D_IN = wmi_bufDwell != 2'd1 ;
  assign wmi_mesgBusy$EN =
	     wmi_bufDwell == 2'd1 || WILL_FIRE_RL_wmi_getRequest ;
  // register wmi_mesgCount
  assign wmi_mesgCount$D_IN =
	     MUX_wmi_bufDwell$write_1__SEL_1 ?
	       MUX_wmi_mesgCount$write_1__VAL_1 :
	       MUX_wmi_mesgCount$write_1__VAL_1 ;
  assign wmi_mesgCount$EN = wmi_mesgDone_1$whas ;
  // register wmi_mesgDone
  assign wmi_mesgDone$D_IN = wmi_mesgDone_1$whas ;
  assign wmi_mesgDone$EN = 1'd1 ;
  // register wmi_mesgMeta
  assign wmi_mesgMeta$D_IN =
	     MUX_wmi_bufDwell$write_1__SEL_1 ?
	       129'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA :
	       MUX_wmi_mesgMeta$write_1__VAL_2 ;
  assign wmi_mesgMeta$EN =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_bytesRemainReq == 14'd4 &&
	     wmi_doneWithMesg ||
	     WILL_FIRE_RL_wmi_respMetadata ;
  // register wmi_mesgStart
  assign wmi_mesgStart$D_IN = wmi_mesgStart_1$whas ;
  assign wmi_mesgStart$EN = 1'd1 ;
  // register wmi_metaBusy
  assign wmi_metaBusy$D_IN = !WILL_FIRE_RL_wmi_respMetadata ;
  assign wmi_metaBusy$EN =
	     WILL_FIRE_RL_wmi_respMetadata || WILL_FIRE_RL_wmi_reqMetadata ;
  // register wmi_p4B
  assign wmi_p4B$D_IN =
	     MUX_wmi_bytesRemainResp$write_1__SEL_1 ?
	       wmi_wmi_reqF$D_OUT[15:14] :
	       MUX_wmi_p4B$write_1__VAL_2 ;
  assign wmi_p4B$EN =
	     WILL_FIRE_RL_wmi_getRequest &&
	     wmi_wmi_reqF$D_OUT[31:29] == 3'd2 ||
	     WILL_FIRE_RL_wmi_doReadResp ;
  // register wmi_rdActive
  assign wmi_rdActive$D_IN =
	     !MUX_wmi_rdActive$write_1__SEL_1 &&
	     wmi_wmi_reqF$D_OUT[31:29] == 3'd2 ;
  assign wmi_rdActive$EN =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_bytesRemainReq == 14'd4 ||
	     WILL_FIRE_RL_wmi_getRequest ;
  // register wmi_reqCount
  assign wmi_reqCount$D_IN = wmi_reqCount + 16'd1 ;
  assign wmi_reqCount$EN = WILL_FIRE_RL_wmi_getRequest ;
  // register wmi_thisMesg
  assign wmi_thisMesg$D_IN =
	     { wmi_mesgCount[7:0],
	       wmi_wmi_mFlagF$D_OUT[31:24],
	       wmi_wmi_mFlagF$D_OUT[15:0] } ;
  assign wmi_thisMesg$EN = WILL_FIRE_RL_wmi_doWriteFinalize ;
  // register wmi_wmi_blockReq
  assign wmi_wmi_blockReq$D_IN =
	     !MUX_wmi_bufDwell$write_1__SEL_1 &&
	     !WILL_FIRE_RL_wmi_doWriteFinalize ;
  assign wmi_wmi_blockReq$EN =
	     WILL_FIRE_RL_wmi_getRequest && wmi_wmi_reqF$D_OUT[28] &&
	     wmi_wmi_reqF$D_OUT[27] ||
	     WILL_FIRE_RL_wmi_doReadReq && wmi_bytesRemainReq == 14'd4 &&
	     wmi_doneWithMesg ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  // register wmi_wmi_dhF_countReg
  assign wmi_wmi_dhF_countReg$D_IN =
	     MUX_wmi_wmi_dhF_levelsValid$write_1__SEL_2 ?
	       wmi_wmi_dhF_countReg + 2'd1 :
	       wmi_wmi_dhF_countReg - 2'd1 ;
  assign wmi_wmi_dhF_countReg$EN =
	     MUX_wmi_wmi_dhF_levelsValid$write_1__SEL_2 !=
	     WILL_FIRE_RL_wmi_doWriteReq ;
  // register wmi_wmi_dhF_levelsValid
  assign wmi_wmi_dhF_levelsValid$D_IN = WILL_FIRE_RL_wmi_wmi_dhF_reset ;
  assign wmi_wmi_dhF_levelsValid$EN =
	     wmi_wmi_dhF$FULL_N && wmi_wmi_operateD && wmi_wmi_peerIsReady &&
	     wmi_wmi_wmiDh$wget[37] ||
	     WILL_FIRE_RL_wmi_doWriteReq ||
	     WILL_FIRE_RL_wmi_wmi_dhF_reset ;
  // register wmi_wmi_errorSticky
  assign wmi_wmi_errorSticky$D_IN = 1'b0 ;
  assign wmi_wmi_errorSticky$EN = 1'b0 ;
  // register wmi_wmi_isReset_isInReset
  assign wmi_wmi_isReset_isInReset$D_IN = 1'd0 ;
  assign wmi_wmi_isReset_isInReset$EN = wmi_wmi_isReset_isInReset ;
  // register wmi_wmi_mFlagF_countReg
  assign wmi_wmi_mFlagF_countReg$D_IN =
	     MUX_wmi_wmi_mFlagF_levelsValid$write_1__SEL_2 ?
	       wmi_wmi_mFlagF_countReg + 2'd1 :
	       wmi_wmi_mFlagF_countReg - 2'd1 ;
  assign wmi_wmi_mFlagF_countReg$EN =
	     MUX_wmi_wmi_mFlagF_levelsValid$write_1__SEL_2 !=
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  // register wmi_wmi_mFlagF_levelsValid
  assign wmi_wmi_mFlagF_levelsValid$D_IN = WILL_FIRE_RL_wmi_wmi_mFlagF_reset ;
  assign wmi_wmi_mFlagF_levelsValid$EN =
	     wmi_wmi_mFlagF$FULL_N && wmi_wmi_operateD &&
	     wmi_wmi_peerIsReady &&
	     wmi_wmi_wmiReq$wget[31:29] != 3'd0 &&
	     wmi_wmi_wmiReq$wget[27] ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ||
	     WILL_FIRE_RL_wmi_wmi_mFlagF_reset ;
  // register wmi_wmi_operateD
  assign wmi_wmi_operateD$D_IN = wci_cState == 3'd2 ;
  assign wmi_wmi_operateD$EN = 1'd1 ;
  // register wmi_wmi_peerIsReady
  assign wmi_wmi_peerIsReady$D_IN = wmiS0_MReset_n ;
  assign wmi_wmi_peerIsReady$EN = 1'd1 ;
  // register wmi_wmi_reqF_countReg
  assign wmi_wmi_reqF_countReg$D_IN =
	     MUX_wmi_wmi_reqF_levelsValid$write_1__SEL_2 ?
	       wmi_wmi_reqF_countReg + 2'd1 :
	       wmi_wmi_reqF_countReg - 2'd1 ;
  assign wmi_wmi_reqF_countReg$EN =
	     MUX_wmi_wmi_reqF_levelsValid$write_1__SEL_2 !=
	     WILL_FIRE_RL_wmi_getRequest ;
  // register wmi_wmi_reqF_levelsValid
  assign wmi_wmi_reqF_levelsValid$D_IN = WILL_FIRE_RL_wmi_wmi_reqF_reset ;
  assign wmi_wmi_reqF_levelsValid$EN =
	     wmi_wmi_reqF$FULL_N && wmi_wmi_operateD && wmi_wmi_peerIsReady &&
	     wmi_wmi_wmiReq$wget[31:29] != 3'd0 ||
	     WILL_FIRE_RL_wmi_getRequest ||
	     WILL_FIRE_RL_wmi_wmi_reqF_reset ;
  // register wmi_wmi_respF_c_r
  assign wmi_wmi_respF_c_r$D_IN =
	     WILL_FIRE_RL_wmi_wmi_respF_incCtr ?
	       MUX_wmi_wmi_respF_c_r$write_1__VAL_1 :
	       MUX_wmi_wmi_respF_c_r$write_1__VAL_2 ;
  assign wmi_wmi_respF_c_r$EN =
	     WILL_FIRE_RL_wmi_wmi_respF_incCtr ||
	     WILL_FIRE_RL_wmi_wmi_respF_decCtr ;
  // register wmi_wmi_respF_q_0
  always@(WILL_FIRE_RL_wmi_wmi_respF_both or
	  MUX_wmi_wmi_respF_q_0$write_1__VAL_1 or
	  MUX_wmi_wmi_respF_q_0$write_1__SEL_2 or
	  MUX_wmi_wmi_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wmi_wmi_respF_decCtr or wmi_wmi_respF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_wmi_respF_both:
	  wmi_wmi_respF_q_0$D_IN = MUX_wmi_wmi_respF_q_0$write_1__VAL_1;
      MUX_wmi_wmi_respF_q_0$write_1__SEL_2:
	  wmi_wmi_respF_q_0$D_IN = MUX_wmi_wmi_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wmi_wmi_respF_decCtr:
	  wmi_wmi_respF_q_0$D_IN = wmi_wmi_respF_q_1;
      default: wmi_wmi_respF_q_0$D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmi_wmi_respF_q_0$EN =
	     WILL_FIRE_RL_wmi_wmi_respF_both ||
	     WILL_FIRE_RL_wmi_wmi_respF_incCtr && wmi_wmi_respF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wmi_wmi_respF_decCtr ;
  // register wmi_wmi_respF_q_1
  always@(WILL_FIRE_RL_wmi_wmi_respF_both or
	  MUX_wmi_wmi_respF_q_1$write_1__VAL_1 or
	  MUX_wmi_wmi_respF_q_1$write_1__SEL_2 or
	  MUX_wmi_wmi_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wmi_wmi_respF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_wmi_respF_both:
	  wmi_wmi_respF_q_1$D_IN = MUX_wmi_wmi_respF_q_1$write_1__VAL_1;
      MUX_wmi_wmi_respF_q_1$write_1__SEL_2:
	  wmi_wmi_respF_q_1$D_IN = MUX_wmi_wmi_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wmi_wmi_respF_decCtr: wmi_wmi_respF_q_1$D_IN = 34'd0;
      default: wmi_wmi_respF_q_1$D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmi_wmi_respF_q_1$EN =
	     WILL_FIRE_RL_wmi_wmi_respF_both ||
	     WILL_FIRE_RL_wmi_wmi_respF_incCtr && wmi_wmi_respF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wmi_wmi_respF_decCtr ;
  // register wmi_wmi_sFlagReg
  assign wmi_wmi_sFlagReg$D_IN =
	     { y_avValue__h116755[7:0], y_avValue__h116735[23:0] } ;
  assign wmi_wmi_sFlagReg$EN = WILL_FIRE_RL_wmi_respMetadata ;
  // register wmi_wmi_statusR
  assign wmi_wmi_statusR$D_IN = 8'h0 ;
  assign wmi_wmi_statusR$EN = 1'b0 ;
  // register wmi_wmi_trafficSticky
  assign wmi_wmi_trafficSticky$D_IN = 1'b0 ;
  assign wmi_wmi_trafficSticky$EN = 1'b0 ;
  // register wmi_wrActive
  assign wmi_wrActive$D_IN =
	     !MUX_wmi_wrActive$write_1__SEL_1 &&
	     wmi_wmi_reqF$D_OUT[31:29] == 3'd1 ;
  assign wmi_wrActive$EN =
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_bytesRemainReq == 14'd4 ||
	     WILL_FIRE_RL_wmi_getRequest ;
  // register wmi_wrFinalize
  assign wmi_wrFinalize$D_IN = MUX_wmi_wrFinalize$write_1__SEL_1 ;
  assign wmi_wrFinalize$EN =
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_bytesRemainReq == 14'd4 &&
	     wmi_doneWithMesg ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  // register wmi_wrtCount
  assign wmi_wrtCount$D_IN = wmi_wrtCount + 16'd1 ;
  assign wmi_wrtCount$EN = WILL_FIRE_RL_wmi_doWriteReq ;
  // register wti_isReset_isInReset
  assign wti_isReset_isInReset$D_IN = 1'd0 ;
  assign wti_isReset_isInReset$EN = wti_isReset_isInReset ;
  // register wti_nowReq
  assign wti_nowReq$D_IN = wtiS0_req ;
  assign wti_nowReq$EN = 1'd1 ;
  // register wti_operateD
  assign wti_operateD$D_IN = 1'b1 ;
  assign wti_operateD$EN = 1'd1 ;
  // submodule bram_memory
  always@(MUX_bram_memory$a_put_1__SEL_1 or
	  edp_tlpBRAM_mReqF$D_OUT or
	  MUX_bram_memory$a_put_1__SEL_2 or
	  MUX_bram_memory$a_put_1__SEL_3 or
	  MUX_bram_memory$a_put_2__VAL_3 or
	  WILL_FIRE_RL_edp_tlpBRAM_read_NextReq or
	  MUX_bram_memory$a_put_2__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_memory$a_put_1__SEL_1:
	  bram_memory$ADDRA = edp_tlpBRAM_mReqF$D_OUT[62:52];
      MUX_bram_memory$a_put_1__SEL_2:
	  bram_memory$ADDRA = edp_tlpBRAM_mReqF$D_OUT[41:31];
      MUX_bram_memory$a_put_1__SEL_3:
	  bram_memory$ADDRA = MUX_bram_memory$a_put_2__VAL_3;
      WILL_FIRE_RL_edp_tlpBRAM_read_NextReq:
	  bram_memory$ADDRA = MUX_bram_memory$a_put_2__VAL_4;
      default: bram_memory$ADDRA = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(WILL_FIRE_RL_wmi_reqMetadata or
	  WILL_FIRE_RL_wmi_doWriteFinalize or
	  wmi_lclMetaAddr or
	  MUX_bram_memory$b_put_1__SEL_1 or
	  MUX_bram_memory$b_put_2__VAL_1 or MUX_bram_memory$b_put_1__SEL_2)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_reqMetadata || WILL_FIRE_RL_wmi_doWriteFinalize:
	  bram_memory$ADDRB = wmi_lclMetaAddr[14:4];
      MUX_bram_memory$b_put_1__SEL_1:
	  bram_memory$ADDRB = MUX_bram_memory$b_put_2__VAL_1;
      MUX_bram_memory$b_put_1__SEL_2:
	  bram_memory$ADDRB = MUX_bram_memory$b_put_2__VAL_1;
      default: bram_memory$ADDRB = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(MUX_bram_memory$a_put_1__SEL_1 or
	  MUX_bram_memory$a_put_3__VAL_1 or
	  MUX_bram_memory$a_put_1__SEL_3 or
	  MUX_bram_memory$a_put_3__VAL_3 or
	  MUX_bram_memory$a_put_1__SEL_2 or
	  WILL_FIRE_RL_edp_tlpBRAM_read_NextReq)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_memory$a_put_1__SEL_1:
	  bram_memory$DIA = MUX_bram_memory$a_put_3__VAL_1;
      MUX_bram_memory$a_put_1__SEL_3:
	  bram_memory$DIA = MUX_bram_memory$a_put_3__VAL_3;
      MUX_bram_memory$a_put_1__SEL_2 || WILL_FIRE_RL_edp_tlpBRAM_read_NextReq:
	  bram_memory$DIA = 32'd0;
      default: bram_memory$DIA = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(MUX_bram_memory$b_put_1__SEL_2 or
	  wmi_wmi_dhF$D_OUT or
	  WILL_FIRE_RL_wmi_doWriteFinalize or
	  x3__h115136 or
	  MUX_bram_memory$b_put_1__SEL_1 or WILL_FIRE_RL_wmi_reqMetadata)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_memory$b_put_1__SEL_2:
	  bram_memory$DIB = wmi_wmi_dhF$D_OUT[35:4];
      WILL_FIRE_RL_wmi_doWriteFinalize: bram_memory$DIB = x3__h115136;
      MUX_bram_memory$b_put_1__SEL_1 || WILL_FIRE_RL_wmi_reqMetadata:
	  bram_memory$DIB = 32'd0;
      default: bram_memory$DIB = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign bram_memory$WEA =
	     !MUX_bram_memory$a_put_1__SEL_2 &&
	     !WILL_FIRE_RL_edp_tlpBRAM_read_NextReq ;
  assign bram_memory$WEB =
	     !MUX_bram_memory$b_put_1__SEL_1 &&
	     !WILL_FIRE_RL_wmi_reqMetadata ;
  assign bram_memory$ENA =
	     WILL_FIRE_RL_edp_tlpBRAM_writeReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[63] &&
	     edp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd0 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[60] &&
	     edp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd0 ||
	     WILL_FIRE_RL_edp_tlpBRAM_writeData &&
	     IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2899 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextReq ;
  assign bram_memory$ENB =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd0 ||
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd0 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  // submodule bram_memory_1
  always@(MUX_bram_memory_1$a_put_1__SEL_1 or
	  edp_tlpBRAM_mReqF$D_OUT or
	  MUX_bram_memory_1$a_put_1__SEL_2 or
	  MUX_bram_memory_1$a_put_1__SEL_3 or
	  MUX_bram_memory_1$a_put_2__VAL_3 or
	  WILL_FIRE_RL_edp_tlpBRAM_read_NextReq or
	  MUX_bram_memory_1$a_put_2__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_memory_1$a_put_1__SEL_1:
	  bram_memory_1$ADDRA = edp_tlpBRAM_mReqF$D_OUT[62:52];
      MUX_bram_memory_1$a_put_1__SEL_2:
	  bram_memory_1$ADDRA = edp_tlpBRAM_mReqF$D_OUT[41:31];
      MUX_bram_memory_1$a_put_1__SEL_3:
	  bram_memory_1$ADDRA = MUX_bram_memory_1$a_put_2__VAL_3;
      WILL_FIRE_RL_edp_tlpBRAM_read_NextReq:
	  bram_memory_1$ADDRA = MUX_bram_memory_1$a_put_2__VAL_4;
      default: bram_memory_1$ADDRA = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(WILL_FIRE_RL_wmi_reqMetadata or
	  WILL_FIRE_RL_wmi_doWriteFinalize or
	  wmi_lclMetaAddr or
	  MUX_bram_memory_1$b_put_1__SEL_1 or
	  MUX_bram_memory$b_put_2__VAL_1 or MUX_bram_memory_1$b_put_1__SEL_2)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_reqMetadata || WILL_FIRE_RL_wmi_doWriteFinalize:
	  bram_memory_1$ADDRB = wmi_lclMetaAddr[14:4];
      MUX_bram_memory_1$b_put_1__SEL_1:
	  bram_memory_1$ADDRB = MUX_bram_memory$b_put_2__VAL_1;
      MUX_bram_memory_1$b_put_1__SEL_2:
	  bram_memory_1$ADDRB = MUX_bram_memory$b_put_2__VAL_1;
      default: bram_memory_1$ADDRB = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(MUX_bram_memory_1$a_put_1__SEL_1 or
	  MUX_bram_memory$a_put_3__VAL_1 or
	  MUX_bram_memory_1$a_put_1__SEL_3 or
	  MUX_bram_memory_1$a_put_3__VAL_3 or
	  MUX_bram_memory_1$a_put_1__SEL_2 or
	  WILL_FIRE_RL_edp_tlpBRAM_read_NextReq)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_memory_1$a_put_1__SEL_1:
	  bram_memory_1$DIA = MUX_bram_memory$a_put_3__VAL_1;
      MUX_bram_memory_1$a_put_1__SEL_3:
	  bram_memory_1$DIA = MUX_bram_memory_1$a_put_3__VAL_3;
      MUX_bram_memory_1$a_put_1__SEL_2 ||
      WILL_FIRE_RL_edp_tlpBRAM_read_NextReq:
	  bram_memory_1$DIA = 32'd0;
      default: bram_memory_1$DIA = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(MUX_bram_memory_1$b_put_1__SEL_2 or
	  wmi_wmi_dhF$D_OUT or
	  WILL_FIRE_RL_wmi_doWriteFinalize or
	  mesgMeta_opcode__h115176 or
	  MUX_bram_memory_1$b_put_1__SEL_1 or WILL_FIRE_RL_wmi_reqMetadata)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_memory_1$b_put_1__SEL_2:
	  bram_memory_1$DIB = wmi_wmi_dhF$D_OUT[35:4];
      WILL_FIRE_RL_wmi_doWriteFinalize:
	  bram_memory_1$DIB = mesgMeta_opcode__h115176;
      MUX_bram_memory_1$b_put_1__SEL_1 || WILL_FIRE_RL_wmi_reqMetadata:
	  bram_memory_1$DIB = 32'd0;
      default: bram_memory_1$DIB = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign bram_memory_1$WEA =
	     !MUX_bram_memory_1$a_put_1__SEL_2 &&
	     !WILL_FIRE_RL_edp_tlpBRAM_read_NextReq ;
  assign bram_memory_1$WEB =
	     !MUX_bram_memory_1$b_put_1__SEL_1 &&
	     !WILL_FIRE_RL_wmi_reqMetadata ;
  assign bram_memory_1$ENA =
	     WILL_FIRE_RL_edp_tlpBRAM_writeReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[63] &&
	     edp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd1 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[60] &&
	     edp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd1 ||
	     WILL_FIRE_RL_edp_tlpBRAM_writeData &&
	     IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2900 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextReq ;
  assign bram_memory_1$ENB =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd1 ||
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd1 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  // submodule bram_memory_2
  always@(MUX_bram_memory_2$a_put_1__SEL_1 or
	  edp_tlpBRAM_mReqF$D_OUT or
	  MUX_bram_memory_2$a_put_1__SEL_2 or
	  MUX_bram_memory_2$a_put_1__SEL_3 or
	  MUX_bram_memory_2$a_put_2__VAL_3 or
	  WILL_FIRE_RL_edp_tlpBRAM_read_NextReq or
	  MUX_bram_memory_2$a_put_2__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_memory_2$a_put_1__SEL_1:
	  bram_memory_2$ADDRA = edp_tlpBRAM_mReqF$D_OUT[62:52];
      MUX_bram_memory_2$a_put_1__SEL_2:
	  bram_memory_2$ADDRA = edp_tlpBRAM_mReqF$D_OUT[41:31];
      MUX_bram_memory_2$a_put_1__SEL_3:
	  bram_memory_2$ADDRA = MUX_bram_memory_2$a_put_2__VAL_3;
      WILL_FIRE_RL_edp_tlpBRAM_read_NextReq:
	  bram_memory_2$ADDRA = MUX_bram_memory_2$a_put_2__VAL_4;
      default: bram_memory_2$ADDRA = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(WILL_FIRE_RL_wmi_reqMetadata or
	  WILL_FIRE_RL_wmi_doWriteFinalize or
	  wmi_lclMetaAddr or
	  MUX_bram_memory_2$b_put_1__SEL_1 or
	  MUX_bram_memory$b_put_2__VAL_1 or MUX_bram_memory_2$b_put_1__SEL_2)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_reqMetadata || WILL_FIRE_RL_wmi_doWriteFinalize:
	  bram_memory_2$ADDRB = wmi_lclMetaAddr[14:4];
      MUX_bram_memory_2$b_put_1__SEL_1:
	  bram_memory_2$ADDRB = MUX_bram_memory$b_put_2__VAL_1;
      MUX_bram_memory_2$b_put_1__SEL_2:
	  bram_memory_2$ADDRB = MUX_bram_memory$b_put_2__VAL_1;
      default: bram_memory_2$ADDRB = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(MUX_bram_memory_2$a_put_1__SEL_1 or
	  MUX_bram_memory$a_put_3__VAL_1 or
	  MUX_bram_memory_2$a_put_1__SEL_3 or
	  MUX_bram_memory_2$a_put_3__VAL_3 or
	  MUX_bram_memory_2$a_put_1__SEL_2 or
	  WILL_FIRE_RL_edp_tlpBRAM_read_NextReq)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_memory_2$a_put_1__SEL_1:
	  bram_memory_2$DIA = MUX_bram_memory$a_put_3__VAL_1;
      MUX_bram_memory_2$a_put_1__SEL_3:
	  bram_memory_2$DIA = MUX_bram_memory_2$a_put_3__VAL_3;
      MUX_bram_memory_2$a_put_1__SEL_2 ||
      WILL_FIRE_RL_edp_tlpBRAM_read_NextReq:
	  bram_memory_2$DIA = 32'd0;
      default: bram_memory_2$DIA = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(WILL_FIRE_RL_wmi_doWriteFinalize or
	  wmi_nowW$wget or
	  MUX_bram_memory_2$b_put_1__SEL_2 or
	  wmi_wmi_dhF$D_OUT or
	  MUX_bram_memory_2$b_put_1__SEL_1 or WILL_FIRE_RL_wmi_reqMetadata)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_doWriteFinalize:
	  bram_memory_2$DIB = wmi_nowW$wget[63:32];
      MUX_bram_memory_2$b_put_1__SEL_2:
	  bram_memory_2$DIB = wmi_wmi_dhF$D_OUT[35:4];
      MUX_bram_memory_2$b_put_1__SEL_1 || WILL_FIRE_RL_wmi_reqMetadata:
	  bram_memory_2$DIB = 32'd0;
      default: bram_memory_2$DIB = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign bram_memory_2$WEA =
	     !MUX_bram_memory_2$a_put_1__SEL_2 &&
	     !WILL_FIRE_RL_edp_tlpBRAM_read_NextReq ;
  assign bram_memory_2$WEB =
	     !MUX_bram_memory_2$b_put_1__SEL_1 &&
	     !WILL_FIRE_RL_wmi_reqMetadata ;
  assign bram_memory_2$ENA =
	     WILL_FIRE_RL_edp_tlpBRAM_writeReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[63] &&
	     edp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd2 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[60] &&
	     edp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd2 ||
	     WILL_FIRE_RL_edp_tlpBRAM_writeData &&
	     IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2901 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextReq ;
  assign bram_memory_2$ENB =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd2 ||
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd2 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  // submodule bram_memory_3
  always@(MUX_bram_memory_3$a_put_1__SEL_1 or
	  edp_tlpBRAM_mReqF$D_OUT or
	  MUX_bram_memory_3$a_put_1__SEL_2 or
	  MUX_bram_memory_3$a_put_1__SEL_3 or
	  MUX_bram_memory_3$a_put_2__VAL_3 or
	  WILL_FIRE_RL_edp_tlpBRAM_read_NextReq or
	  MUX_bram_memory_3$a_put_2__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_memory_3$a_put_1__SEL_1:
	  bram_memory_3$ADDRA = edp_tlpBRAM_mReqF$D_OUT[62:52];
      MUX_bram_memory_3$a_put_1__SEL_2:
	  bram_memory_3$ADDRA = edp_tlpBRAM_mReqF$D_OUT[41:31];
      MUX_bram_memory_3$a_put_1__SEL_3:
	  bram_memory_3$ADDRA = MUX_bram_memory_3$a_put_2__VAL_3;
      WILL_FIRE_RL_edp_tlpBRAM_read_NextReq:
	  bram_memory_3$ADDRA = MUX_bram_memory_3$a_put_2__VAL_4;
      default: bram_memory_3$ADDRA = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(WILL_FIRE_RL_wmi_reqMetadata or
	  WILL_FIRE_RL_wmi_doWriteFinalize or
	  wmi_lclMetaAddr or
	  MUX_bram_memory_3$b_put_1__SEL_1 or
	  MUX_bram_memory$b_put_2__VAL_1 or MUX_bram_memory_3$b_put_1__SEL_2)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_reqMetadata || WILL_FIRE_RL_wmi_doWriteFinalize:
	  bram_memory_3$ADDRB = wmi_lclMetaAddr[14:4];
      MUX_bram_memory_3$b_put_1__SEL_1:
	  bram_memory_3$ADDRB = MUX_bram_memory$b_put_2__VAL_1;
      MUX_bram_memory_3$b_put_1__SEL_2:
	  bram_memory_3$ADDRB = MUX_bram_memory$b_put_2__VAL_1;
      default: bram_memory_3$ADDRB = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(MUX_bram_memory_3$a_put_1__SEL_1 or
	  MUX_bram_memory$a_put_3__VAL_1 or
	  MUX_bram_memory_3$a_put_1__SEL_3 or
	  MUX_bram_memory_3$a_put_3__VAL_3 or
	  MUX_bram_memory_3$a_put_1__SEL_2 or
	  WILL_FIRE_RL_edp_tlpBRAM_read_NextReq)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_memory_3$a_put_1__SEL_1:
	  bram_memory_3$DIA = MUX_bram_memory$a_put_3__VAL_1;
      MUX_bram_memory_3$a_put_1__SEL_3:
	  bram_memory_3$DIA = MUX_bram_memory_3$a_put_3__VAL_3;
      MUX_bram_memory_3$a_put_1__SEL_2 ||
      WILL_FIRE_RL_edp_tlpBRAM_read_NextReq:
	  bram_memory_3$DIA = 32'd0;
      default: bram_memory_3$DIA = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(WILL_FIRE_RL_wmi_doWriteFinalize or
	  wmi_nowW$wget or
	  MUX_bram_memory_3$b_put_1__SEL_2 or
	  wmi_wmi_dhF$D_OUT or
	  MUX_bram_memory_3$b_put_1__SEL_1 or WILL_FIRE_RL_wmi_reqMetadata)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_doWriteFinalize:
	  bram_memory_3$DIB = wmi_nowW$wget[31:0];
      MUX_bram_memory_3$b_put_1__SEL_2:
	  bram_memory_3$DIB = wmi_wmi_dhF$D_OUT[35:4];
      MUX_bram_memory_3$b_put_1__SEL_1 || WILL_FIRE_RL_wmi_reqMetadata:
	  bram_memory_3$DIB = 32'd0;
      default: bram_memory_3$DIB = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign bram_memory_3$WEA =
	     !MUX_bram_memory_3$a_put_1__SEL_2 &&
	     !WILL_FIRE_RL_edp_tlpBRAM_read_NextReq ;
  assign bram_memory_3$WEB =
	     !MUX_bram_memory_3$b_put_1__SEL_1 &&
	     !WILL_FIRE_RL_wmi_reqMetadata ;
  assign bram_memory_3$ENA =
	     WILL_FIRE_RL_edp_tlpBRAM_writeReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[63] &&
	     edp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd3 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq &&
	     !edp_tlpBRAM_mReqF$D_OUT[60] &&
	     edp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd3 ||
	     WILL_FIRE_RL_edp_tlpBRAM_writeData &&
	     IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2902 ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextReq ;
  assign bram_memory_3$ENB =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd3 ||
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd3 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  // submodule bram_serverAdapterA_1_outDataCore
  assign bram_serverAdapterA_1_outDataCore$D_IN = bram_memory_1$DOA ;
  assign bram_serverAdapterA_1_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_serverAdapterA_1_outData_enqAndDeq ||
	     bram_serverAdapterA_1_outDataCore$FULL_N &&
	     !bram_serverAdapterA_1_outData_deqCalled$whas &&
	     bram_serverAdapterA_1_outData_enqData$whas ;
  assign bram_serverAdapterA_1_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_serverAdapterA_1_outData_enqAndDeq ||
	     bram_serverAdapterA_1_outDataCore$EMPTY_N &&
	     bram_serverAdapterA_1_outData_deqCalled$whas &&
	     !bram_serverAdapterA_1_outData_enqData$whas ;
  assign bram_serverAdapterA_1_outDataCore$CLR = 1'b0 ;
  // submodule bram_serverAdapterA_2_outDataCore
  assign bram_serverAdapterA_2_outDataCore$D_IN = bram_memory_2$DOA ;
  assign bram_serverAdapterA_2_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_serverAdapterA_2_outData_enqAndDeq ||
	     bram_serverAdapterA_2_outDataCore$FULL_N &&
	     !bram_serverAdapterA_2_outData_deqCalled$whas &&
	     bram_serverAdapterA_2_outData_enqData$whas ;
  assign bram_serverAdapterA_2_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_serverAdapterA_2_outData_enqAndDeq ||
	     bram_serverAdapterA_2_outDataCore$EMPTY_N &&
	     bram_serverAdapterA_2_outData_deqCalled$whas &&
	     !bram_serverAdapterA_2_outData_enqData$whas ;
  assign bram_serverAdapterA_2_outDataCore$CLR = 1'b0 ;
  // submodule bram_serverAdapterA_3_outDataCore
  assign bram_serverAdapterA_3_outDataCore$D_IN = bram_memory_3$DOA ;
  assign bram_serverAdapterA_3_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_serverAdapterA_3_outData_enqAndDeq ||
	     bram_serverAdapterA_3_outDataCore$FULL_N &&
	     !bram_serverAdapterA_3_outData_deqCalled$whas &&
	     bram_serverAdapterA_3_outData_enqData$whas ;
  assign bram_serverAdapterA_3_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_serverAdapterA_3_outData_enqAndDeq ||
	     bram_serverAdapterA_3_outDataCore$EMPTY_N &&
	     bram_serverAdapterA_3_outData_deqCalled$whas &&
	     !bram_serverAdapterA_3_outData_enqData$whas ;
  assign bram_serverAdapterA_3_outDataCore$CLR = 1'b0 ;
  // submodule bram_serverAdapterA_outDataCore
  assign bram_serverAdapterA_outDataCore$D_IN = bram_memory$DOA ;
  assign bram_serverAdapterA_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_serverAdapterA_outData_enqAndDeq ||
	     bram_serverAdapterA_outDataCore$FULL_N &&
	     !bram_serverAdapterA_outData_deqCalled$whas &&
	     bram_serverAdapterA_outData_enqData$whas ;
  assign bram_serverAdapterA_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_serverAdapterA_outData_enqAndDeq ||
	     bram_serverAdapterA_outDataCore$EMPTY_N &&
	     bram_serverAdapterA_outData_deqCalled$whas &&
	     !bram_serverAdapterA_outData_enqData$whas ;
  assign bram_serverAdapterA_outDataCore$CLR = 1'b0 ;
  // submodule bram_serverAdapterB_1_outDataCore
  assign bram_serverAdapterB_1_outDataCore$D_IN = bram_memory_1$DOB ;
  assign bram_serverAdapterB_1_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_serverAdapterB_1_outData_enqAndDeq ||
	     bram_serverAdapterB_1_outDataCore$FULL_N &&
	     !bram_serverAdapterB_1_outData_deqCalled$whas &&
	     bram_serverAdapterB_1_outData_enqData$whas ;
  assign bram_serverAdapterB_1_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_serverAdapterB_1_outData_enqAndDeq ||
	     bram_serverAdapterB_1_outDataCore$EMPTY_N &&
	     bram_serverAdapterB_1_outData_deqCalled$whas &&
	     !bram_serverAdapterB_1_outData_enqData$whas ;
  assign bram_serverAdapterB_1_outDataCore$CLR = 1'b0 ;
  // submodule bram_serverAdapterB_2_outDataCore
  assign bram_serverAdapterB_2_outDataCore$D_IN = bram_memory_2$DOB ;
  assign bram_serverAdapterB_2_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_serverAdapterB_2_outData_enqAndDeq ||
	     bram_serverAdapterB_2_outDataCore$FULL_N &&
	     !bram_serverAdapterB_2_outData_deqCalled$whas &&
	     bram_serverAdapterB_2_outData_enqData$whas ;
  assign bram_serverAdapterB_2_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_serverAdapterB_2_outData_enqAndDeq ||
	     bram_serverAdapterB_2_outDataCore$EMPTY_N &&
	     bram_serverAdapterB_2_outData_deqCalled$whas &&
	     !bram_serverAdapterB_2_outData_enqData$whas ;
  assign bram_serverAdapterB_2_outDataCore$CLR = 1'b0 ;
  // submodule bram_serverAdapterB_3_outDataCore
  assign bram_serverAdapterB_3_outDataCore$D_IN = bram_memory_3$DOB ;
  assign bram_serverAdapterB_3_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_serverAdapterB_3_outData_enqAndDeq ||
	     bram_serverAdapterB_3_outDataCore$FULL_N &&
	     !bram_serverAdapterB_3_outData_deqCalled$whas &&
	     bram_serverAdapterB_3_outData_enqData$whas ;
  assign bram_serverAdapterB_3_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_serverAdapterB_3_outData_enqAndDeq ||
	     bram_serverAdapterB_3_outDataCore$EMPTY_N &&
	     bram_serverAdapterB_3_outData_deqCalled$whas &&
	     !bram_serverAdapterB_3_outData_enqData$whas ;
  assign bram_serverAdapterB_3_outDataCore$CLR = 1'b0 ;
  // submodule bram_serverAdapterB_outDataCore
  assign bram_serverAdapterB_outDataCore$D_IN = bram_memory$DOB ;
  assign bram_serverAdapterB_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_serverAdapterB_outData_enqAndDeq ||
	     bram_serverAdapterB_outDataCore$FULL_N &&
	     !bram_serverAdapterB_outData_deqCalled$whas &&
	     bram_serverAdapterB_outData_enqData$whas ;
  assign bram_serverAdapterB_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_serverAdapterB_outData_enqAndDeq ||
	     bram_serverAdapterB_outDataCore$EMPTY_N &&
	     bram_serverAdapterB_outData_deqCalled$whas &&
	     !bram_serverAdapterB_outData_enqData$whas ;
  assign bram_serverAdapterB_outDataCore$CLR = 1'b0 ;
  // submodule edp_inF
  assign edp_inF$D_IN =
	     { CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q33,
	       server_request_put[37:30],
	       CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q34,
	       server_request_put[27:20],
	       CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q35,
	       server_request_put[17:10],
	       CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q36,
	       server_request_put[7:0] } ;
  assign edp_inF$ENQ = EN_server_request_put ;
  assign edp_inF$DEQ = WILL_FIRE_RL_edp_ingress ;
  assign edp_inF$CLR = 1'b0 ;
  // submodule edp_inProcF
  assign edp_inProcF$D_IN =
	     { CASE_edp_inFD_OUT_BITS_39_TO_38_3_0_edp_inFD_ETC__q37,
	       edp_inF$D_OUT[37:30],
	       CASE_edp_inFD_OUT_BITS_29_TO_28_3_0_edp_inFD_ETC__q38,
	       edp_inF$D_OUT[27:20],
	       CASE_edp_inFD_OUT_BITS_19_TO_18_3_0_edp_inFD_ETC__q39,
	       edp_inF$D_OUT[17:10],
	       CASE_edp_inFD_OUT_BITS_9_TO_8_3_0_edp_inFD_O_ETC__q40,
	       edp_inF$D_OUT[7:0] } ;
  assign edp_inProcF$ENQ =
	     WILL_FIRE_RL_edp_ingress && hasPull &&
	     !edp_igPtr_753_ULE_1___d1754 ;
  assign edp_inProcF$DEQ = WILL_FIRE_RL_edp_rcv_message ;
  assign edp_inProcF$CLR = 1'b0 ;
  // submodule edp_outBF_memory
  assign edp_outBF_memory$ADDRA = edp_outBF_rWrPtr[10:0] ;
  assign edp_outBF_memory$ADDRB =
	     edp_outBF_pwDequeue$whas ?
	       x__h20843[10:0] :
	       edp_outBF_rRdPtr[10:0] ;
  assign edp_outBF_memory$DIA =
	     { IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2800,
	       IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2803,
	       IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2801,
	       IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2802 } ;
  assign edp_outBF_memory$DIB = 40'hAAAAAAAAAA /* unspecified value */  ;
  assign edp_outBF_memory$WEA = edp_outBF_pwEnqueue$whas ;
  assign edp_outBF_memory$WEB = 1'd0 ;
  assign edp_outBF_memory$ENA = 1'd1 ;
  assign edp_outBF_memory$ENB = 1'd1 ;
  // submodule edp_outF
  assign edp_outF$D_IN =
	     { CASE_edp_outBF_wDataOutwget_BITS_39_TO_38_3_0_ETC__q41,
	       edp_outBF_wDataOut$wget[37:30],
	       CASE_edp_outBF_wDataOutwget_BITS_29_TO_28_3_0_ETC__q42,
	       edp_outBF_wDataOut$wget[27:20],
	       CASE_edp_outBF_wDataOutwget_BITS_19_TO_18_3_0_ETC__q43,
	       edp_outBF_wDataOut$wget[17:10],
	       CASE_edp_outBF_wDataOutwget_BITS_9_TO_8_3_0_e_ETC__q44,
	       edp_outBF_wDataOut$wget[7:0] } ;
  assign edp_outF$ENQ = edp_outBF_pwDequeue$whas ;
  assign edp_outF$DEQ = EN_server_response_get ;
  assign edp_outF$CLR = 1'b0 ;
  // submodule edp_outFunl_inF
  assign edp_outFunl_inF$D_IN =
	     WILL_FIRE_RL_edp_dmaResponseNearMetaBody ?
	       MUX_edp_outFunl_inF$enq_1__VAL_1 :
	       MUX_edp_outFunl_inF$enq_1__VAL_2 ;
  assign edp_outFunl_inF$ENQ =
	     WILL_FIRE_RL_edp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_edp_dmaPushResponseBody ;
  assign edp_outFunl_inF$DEQ =
	     edp_outFunl_outF$FULL_N && edp_outFunl_inF$EMPTY_N &&
	     edp_outFunl_ptr == 2'd3 ;
  assign edp_outFunl_inF$CLR = 1'b0 ;
  // submodule edp_outFunl_outF
  always@(edp_outFunl_ptr or edp_outFunl_inF$D_OUT)
  begin
    case (edp_outFunl_ptr)
      2'd0: edp_outFunl_outF$D_IN = edp_outFunl_inF$D_OUT[31:0];
      2'd1: edp_outFunl_outF$D_IN = edp_outFunl_inF$D_OUT[63:32];
      2'd2: edp_outFunl_outF$D_IN = edp_outFunl_inF$D_OUT[95:64];
      2'd3: edp_outFunl_outF$D_IN = edp_outFunl_inF$D_OUT[127:96];
    endcase
  end
  assign edp_outFunl_outF$ENQ =
	     edp_outFunl_outF$FULL_N && edp_outFunl_inF$EMPTY_N ;
  assign edp_outFunl_outF$DEQ = WILL_FIRE_RL_edp_drain_outFunl ;
  assign edp_outFunl_outF$CLR = 1'b0 ;
  // submodule edp_outTF
  assign edp_outTF$ENQ = WILL_FIRE_RL_edp_dmaXmtTailEvent ;
  assign edp_outTF$DEQ =
	     edp_outTF$EMPTY_N &&
	     edp_outBF_rRdPtr_83_EQ_edp_outBF_rWrPtr_18___d1455 ;
  assign edp_outTF$CLR = 1'b0 ;
  // submodule edp_tailEventF
  assign edp_tailEventF$D_IN = 1'd0 ;
  assign edp_tailEventF$ENQ =
	     WILL_FIRE_RL_edp_dmaXmtDoorbell ||
	     WILL_FIRE_RL_edp_dmaXmtTailEvent ;
  assign edp_tailEventF$DEQ = MUX_edp_fabMeta$write_1__SEL_1 ;
  assign edp_tailEventF$CLR = 1'b0 ;
  // submodule edp_tlpBRAM_mReqF
  always@(MUX_edp_tlpBRAM_mReqF$enq_1__SEL_1 or
	  MUX_edp_tlpBRAM_mReqF$enq_1__VAL_1 or
	  WILL_FIRE_RL_edp_dmaRequestNearMeta or
	  MUX_edp_tlpBRAM_mReqF$enq_1__VAL_2 or
	  WILL_FIRE_RL_edp_dmaPushRequestMesg or
	  MUX_edp_tlpBRAM_mReqF$enq_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_edp_tlpBRAM_mReqF$enq_1__SEL_1:
	  edp_tlpBRAM_mReqF$D_IN = MUX_edp_tlpBRAM_mReqF$enq_1__VAL_1;
      WILL_FIRE_RL_edp_dmaRequestNearMeta:
	  edp_tlpBRAM_mReqF$D_IN = MUX_edp_tlpBRAM_mReqF$enq_1__VAL_2;
      WILL_FIRE_RL_edp_dmaPushRequestMesg:
	  edp_tlpBRAM_mReqF$D_IN = MUX_edp_tlpBRAM_mReqF$enq_1__VAL_3;
      default: edp_tlpBRAM_mReqF$D_IN =
		   130'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign edp_tlpBRAM_mReqF$ENQ =
	     WILL_FIRE_RL_edp_rcv_message && !edp_rcvPtr_824_ULE_5___d1825 &&
	     edp_rcvDL != 16'd0 ||
	     WILL_FIRE_RL_edp_dmaRequestNearMeta ||
	     WILL_FIRE_RL_edp_dmaPushRequestMesg ;
  assign edp_tlpBRAM_mReqF$DEQ =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq &&
	     edp_tlpBRAM_mReqF$D_OUT[28:19] == 10'd1 &&
	     !edp_tlpBRAM_mReqF$D_OUT[60] ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextReq &&
	     edp_tlpBRAM_readRemainDWLen_010_ULE_4___d1011 ||
	     WILL_FIRE_RL_edp_tlpBRAM_writeData ||
	     WILL_FIRE_RL_edp_tlpBRAM_writeReq ;
  assign edp_tlpBRAM_mReqF$CLR = 1'b0 ;
  // submodule edp_tlpBRAM_mRespF
  assign edp_tlpBRAM_mRespF$D_IN =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstResp ?
	       MUX_edp_tlpBRAM_mRespF$enq_1__VAL_1 :
	       MUX_edp_tlpBRAM_mRespF$enq_1__VAL_2 ;
  assign edp_tlpBRAM_mRespF$ENQ =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstResp ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextResp ;
  assign edp_tlpBRAM_mRespF$DEQ =
	     WILL_FIRE_RL_edp_dmaPushResponseBody ||
	     WILL_FIRE_RL_edp_dmaPushResponseHeader ||
	     WILL_FIRE_RL_edp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_edp_dmaResponseNearMetaHead ;
  assign edp_tlpBRAM_mRespF$CLR = 1'b0 ;
  // submodule edp_tlpBRAM_readReq
  assign edp_tlpBRAM_readReq$D_IN = edp_tlpBRAM_mReqF$D_OUT[60:0] ;
  assign edp_tlpBRAM_readReq$ENQ = WILL_FIRE_RL_edp_tlpBRAM_read_FirstReq ;
  assign edp_tlpBRAM_readReq$DEQ =
	     WILL_FIRE_RL_edp_tlpBRAM_read_FirstResp &&
	     edp_tlpBRAM_readReq$D_OUT[28:19] == 10'd1 &&
	     !edp_tlpBRAM_readReq$D_OUT[60] ||
	     WILL_FIRE_RL_edp_tlpBRAM_read_NextResp &&
	     edp_tlpBRAM_rdRespDwRemain_188_ULE_4___d1190 ;
  assign edp_tlpBRAM_readReq$CLR = 1'b0 ;
  // submodule wci_reqF
  assign wci_reqF$D_IN = wci_wciReq$wget ;
  assign wci_reqF$ENQ = wci_wciReq$wget[71:69] != 3'd0 ;
  assign wci_reqF$DEQ = wci_reqF_r_deq$whas ;
  assign wci_reqF$CLR = 1'b0 ;
  // submodule wmi_wmi_dhF
  assign wmi_wmi_dhF$D_IN = wmi_wmi_wmiDh$wget ;
  assign wmi_wmi_dhF$ENQ = MUX_wmi_wmi_dhF_levelsValid$write_1__SEL_2 ;
  assign wmi_wmi_dhF$DEQ = WILL_FIRE_RL_wmi_doWriteReq ;
  assign wmi_wmi_dhF$CLR = 1'b0 ;
  // submodule wmi_wmi_mFlagF
  assign wmi_wmi_mFlagF$D_IN = wmiS0_arg_mFlag ;
  assign wmi_wmi_mFlagF$ENQ = MUX_wmi_wmi_mFlagF_levelsValid$write_1__SEL_2 ;
  assign wmi_wmi_mFlagF$DEQ = WILL_FIRE_RL_wmi_doWriteFinalize ;
  assign wmi_wmi_mFlagF$CLR = 1'b0 ;
  // submodule wmi_wmi_reqF
  assign wmi_wmi_reqF$D_IN = wmi_wmi_wmiReq$wget ;
  assign wmi_wmi_reqF$ENQ = MUX_wmi_wmi_reqF_levelsValid$write_1__SEL_2 ;
  assign wmi_wmi_reqF$DEQ = WILL_FIRE_RL_wmi_getRequest ;
  assign wmi_wmi_reqF$CLR = 1'b0 ;
  // remaining internal signals
  assign IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d872 =
	     (IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d849 ||
	      bram_serverAdapterA_1_cnt_44_SLT_3___d2765) &&
	     (IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d859 ||
	      bram_serverAdapterA_2_cnt_62_SLT_3___d2838) &&
	     (IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d869 ||
	      bram_serverAdapterA_3_cnt_80_SLT_3___d2766) ;
  assign IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2800 =
	     (!edp_outBF_wDataIn$whas ||
	      edp_outBF_wDataIn$wget[39:38] == 2'd0) ?
	       { 2'd0,
		 edp_outBF_wDataIn$whas ?
		   edp_outBF_wDataIn$wget[37:30] :
		   8'd0 } :
	       { CASE_edp_outBF_wDataInwget_BITS_39_TO_38_3_1__ETC__q29,
		 edp_outBF_wDataIn$wget[37:30] } ;
  assign IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2801 =
	     (!edp_outBF_wDataIn$whas ||
	      edp_outBF_wDataIn$wget[19:18] == 2'd0) ?
	       { 2'd0,
		 edp_outBF_wDataIn$whas ?
		   edp_outBF_wDataIn$wget[17:10] :
		   8'd0 } :
	       { CASE_edp_outBF_wDataInwget_BITS_19_TO_18_3_1__ETC__q31,
		 edp_outBF_wDataIn$wget[17:10] } ;
  assign IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2802 =
	     (!edp_outBF_wDataIn$whas ||
	      edp_outBF_wDataIn$wget[9:8] == 2'd0) ?
	       { 2'd0,
		 edp_outBF_wDataIn$whas ?
		   edp_outBF_wDataIn$wget[7:0] :
		   8'd0 } :
	       { CASE_edp_outBF_wDataInwget_BITS_9_TO_8_3_1_ed_ETC__q32,
		 edp_outBF_wDataIn$wget[7:0] } ;
  assign IF_NOT_edp_outBF_wDataIn_whas__20_21_OR_edp_ou_ETC___d2803 =
	     (!edp_outBF_wDataIn$whas ||
	      edp_outBF_wDataIn$wget[29:28] == 2'd0) ?
	       { 2'd0,
		 edp_outBF_wDataIn$whas ?
		   edp_outBF_wDataIn$wget[27:20] :
		   8'd0 } :
	       { CASE_edp_outBF_wDataInwget_BITS_29_TO_28_3_1__ETC__q30,
		 edp_outBF_wDataIn$wget[27:20] } ;
  assign IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d1085 =
	     IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d1076 &&
	     CASE_edp_tlpBRAM_readReqD_OUT_BITS_30_TO_29_N_ETC__q19 ;
  assign IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d1201 =
	     edp_tlpBRAM_readReq_first__061_BITS_30_TO_29_0_ETC___d2774[0] ?
	       { bram_serverAdapterA_3_outData_outData$wget[7:0],
		 bram_serverAdapterA_3_outData_outData$wget[15:8],
		 bram_serverAdapterA_3_outData_outData$wget[23:16],
		 bram_serverAdapterA_3_outData_outData$wget[31:24],
		 bram_serverAdapterA_outData_outData$wget[7:0],
		 bram_serverAdapterA_outData_outData$wget[15:8],
		 bram_serverAdapterA_outData_outData$wget[23:16],
		 bram_serverAdapterA_outData_outData$wget[31:24],
		 bram_serverAdapterA_1_outData_outData$wget[7:0],
		 bram_serverAdapterA_1_outData_outData$wget[15:8],
		 bram_serverAdapterA_1_outData_outData$wget[23:16],
		 bram_serverAdapterA_1_outData_outData$wget[31:24],
		 bram_serverAdapterA_2_outData_outData$wget[7:0],
		 bram_serverAdapterA_2_outData_outData$wget[15:8],
		 bram_serverAdapterA_2_outData_outData$wget[23:16],
		 bram_serverAdapterA_2_outData_outData$wget[31:24] } :
	       { bram_serverAdapterA_2_outData_outData$wget[7:0],
		 bram_serverAdapterA_2_outData_outData$wget[15:8],
		 bram_serverAdapterA_2_outData_outData$wget[23:16],
		 bram_serverAdapterA_2_outData_outData$wget[31:24],
		 bram_serverAdapterA_3_outData_outData$wget[7:0],
		 bram_serverAdapterA_3_outData_outData$wget[15:8],
		 bram_serverAdapterA_3_outData_outData$wget[23:16],
		 bram_serverAdapterA_3_outData_outData$wget[31:24],
		 bram_serverAdapterA_outData_outData$wget[7:0],
		 bram_serverAdapterA_outData_outData$wget[15:8],
		 bram_serverAdapterA_outData_outData$wget[23:16],
		 bram_serverAdapterA_outData_outData$wget[31:24],
		 bram_serverAdapterA_1_outData_outData$wget[7:0],
		 bram_serverAdapterA_1_outData_outData$wget[15:8],
		 bram_serverAdapterA_1_outData_outData$wget[23:16],
		 bram_serverAdapterA_1_outData_outData$wget[31:24] } ;
  assign IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d1206 =
	     edp_tlpBRAM_readReq_first__061_BITS_30_TO_29_0_ETC___d2774[0] ?
	       { bram_serverAdapterA_1_outData_outData$wget[7:0],
		 bram_serverAdapterA_1_outData_outData$wget[15:8],
		 bram_serverAdapterA_1_outData_outData$wget[23:16],
		 bram_serverAdapterA_1_outData_outData$wget[31:24],
		 bram_serverAdapterA_2_outData_outData$wget[7:0],
		 bram_serverAdapterA_2_outData_outData$wget[15:8],
		 bram_serverAdapterA_2_outData_outData$wget[23:16],
		 bram_serverAdapterA_2_outData_outData$wget[31:24],
		 bram_serverAdapterA_3_outData_outData$wget[7:0],
		 bram_serverAdapterA_3_outData_outData$wget[15:8],
		 bram_serverAdapterA_3_outData_outData$wget[23:16],
		 bram_serverAdapterA_3_outData_outData$wget[31:24],
		 bram_serverAdapterA_outData_outData$wget[7:0],
		 bram_serverAdapterA_outData_outData$wget[15:8],
		 bram_serverAdapterA_outData_outData$wget[23:16],
		 bram_serverAdapterA_outData_outData$wget[31:24] } :
	       { bram_serverAdapterA_outData_outData$wget[7:0],
		 bram_serverAdapterA_outData_outData$wget[15:8],
		 bram_serverAdapterA_outData_outData$wget[23:16],
		 bram_serverAdapterA_outData_outData$wget[31:24],
		 bram_serverAdapterA_1_outData_outData$wget[7:0],
		 bram_serverAdapterA_1_outData_outData$wget[15:8],
		 bram_serverAdapterA_1_outData_outData$wget[23:16],
		 bram_serverAdapterA_1_outData_outData$wget[31:24],
		 bram_serverAdapterA_2_outData_outData$wget[7:0],
		 bram_serverAdapterA_2_outData_outData$wget[15:8],
		 bram_serverAdapterA_2_outData_outData$wget[23:16],
		 bram_serverAdapterA_2_outData_outData$wget[31:24],
		 bram_serverAdapterA_3_outData_outData$wget[7:0],
		 bram_serverAdapterA_3_outData_outData$wget[15:8],
		 bram_serverAdapterA_3_outData_outData$wget[23:16],
		 bram_serverAdapterA_3_outData_outData$wget[31:24] } ;
  assign IF_wmi_p4B_173_EQ_0_174_THEN_bram_serverAdapte_ETC___d2187 =
	     (wmi_p4B == 2'd0) ?
	       (bram_serverAdapterB_outDataCore$EMPTY_N ||
		bram_serverAdapterB_outData_enqData$whas) &&
	       bram_serverAdapterB_outData_outData$whas :
	       IF_wmi_p4B_173_EQ_1_176_THEN_bram_serverAdapte_ETC___d2182 &&
	       CASE_wmi_p4B_NOT_wmi_p4B_EQ_3_OR_bram_serverAd_ETC__q20 ;
  assign NOT_bml_lclBufDone_314_381_AND_IF_bml_dpContro_ETC___d2394 =
	     !bml_lclBufDone &&
	     CASE_dpControl_BITS_1_TO_0_bml_fabDone_0_bml_f_ETC__q6 ;
  assign NOT_edp_outBF_rRdPtr_83_PLUS_1024_283_EQ_edp_o_ETC___d1285 =
	     edp_outBF_rRdPtr + 12'd1024 != edp_outBF_rWrPtr ;
  assign NOT_wmi_wrActive_088_089_OR_NOT_wmi_rdActive_0_ETC___d2098 =
	     (!wmi_wrActive || !wmi_rdActive) && !wmi_wrFinalize &&
	     (wmi_mesgBufReady || wmi_mesgBusy) ;
  assign ab__h10453 =
	     (MUX_bram_memory_3$a_put_1__SEL_2 ||
	      WILL_FIRE_RL_edp_tlpBRAM_read_NextReq) ?
	       2'd0 :
	       2'd2 ;
  assign ab__h11857 =
	     (MUX_bram_memory_3$b_put_1__SEL_1 ||
	      WILL_FIRE_RL_wmi_reqMetadata) ?
	       2'd0 :
	       2'd2 ;
  assign ab__h1613 =
	     (MUX_bram_memory$a_put_1__SEL_2 ||
	      WILL_FIRE_RL_edp_tlpBRAM_read_NextReq) ?
	       2'd0 :
	       2'd2 ;
  assign ab__h3019 =
	     (MUX_bram_memory$b_put_1__SEL_1 ||
	      WILL_FIRE_RL_wmi_reqMetadata) ?
	       2'd0 :
	       2'd2 ;
  assign ab__h4561 =
	     (MUX_bram_memory_1$a_put_1__SEL_2 ||
	      WILL_FIRE_RL_edp_tlpBRAM_read_NextReq) ?
	       2'd0 :
	       2'd2 ;
  assign ab__h5965 =
	     (MUX_bram_memory_1$b_put_1__SEL_1 ||
	      WILL_FIRE_RL_wmi_reqMetadata) ?
	       2'd0 :
	       2'd2 ;
  assign ab__h7507 =
	     (MUX_bram_memory_2$a_put_1__SEL_2 ||
	      WILL_FIRE_RL_edp_tlpBRAM_read_NextReq) ?
	       2'd0 :
	       2'd2 ;
  assign ab__h8911 =
	     (MUX_bram_memory_2$b_put_1__SEL_1 ||
	      WILL_FIRE_RL_wmi_reqMetadata) ?
	       2'd0 :
	       2'd2 ;
  assign bml_crdBuf_value_272_EQ_bml_crdBuf_modulus_bw__ETC___d3259 =
	     bml_crdBuf_value == bml_crdBuf_modulus ;
  assign bml_fabBuf_value_257_EQ_bml_fabBuf_modulus_bw__ETC___d3260 =
	     bml_fabBuf_value == bml_fabBuf_modulus ;
  assign bml_fabFlowAddr_329_PLUS_bml_fabFlowSize_330___d3070 =
	     bml_fabFlowAddr + bml_fabFlowSize ;
  assign bml_lclBufDone_314_AND_IF_bml_dpControl_wget___ETC___d2911 =
	     bml_lclBufDone &&
	     CASE_dpControl_BITS_1_TO_0_NOT_bml_fabDone_0_N_ETC__q9 ;
  assign bml_lclBuf_value_227_EQ_bml_lclBuf_modulus_bw__ETC___d3277 =
	     bml_lclBuf_value == bml_lclBuf_modulus ;
  assign bml_remBuf_value_242_EQ_bml_remBuf_modulus_bw__ETC___d3278 =
	     bml_remBuf_value == bml_remBuf_modulus ;
  assign bram_serverAdapterA_1_cnt_44_PLUS_IF_bram_serv_ETC___d150 =
	     bram_serverAdapterA_1_cnt +
	     (bram_serverAdapterA_1_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_serverAdapterA_1_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_serverAdapterA_1_cnt_44_SLT_3___d2765 =
	     (bram_serverAdapterA_1_cnt ^ 3'h4) < 3'd7 ;
  assign bram_serverAdapterA_2_cnt_62_PLUS_IF_bram_serv_ETC___d268 =
	     bram_serverAdapterA_2_cnt +
	     (bram_serverAdapterA_2_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_serverAdapterA_2_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_serverAdapterA_2_cnt_62_SLT_3___d2838 =
	     (bram_serverAdapterA_2_cnt ^ 3'h4) < 3'd7 ;
  assign bram_serverAdapterA_2_outDataCore_notEmpty__38_ETC___d1157 =
	     (bram_serverAdapterA_2_outDataCore$EMPTY_N ||
	      bram_serverAdapterA_2_outData_enqData$whas) &&
	     (bram_serverAdapterA_3_outDataCore$EMPTY_N ||
	      bram_serverAdapterA_3_outData_enqData$whas) &&
	     bram_serverAdapterA_outData_outData$whas &&
	     bram_serverAdapterA_1_outData_outData$whas &&
	     bram_serverAdapterA_2_outData_outData$whas &&
	     bram_serverAdapterA_3_outData_outData$whas &&
	     edp_tlpBRAM_mRespF$FULL_N ;
  assign bram_serverAdapterA_3_cnt_80_PLUS_IF_bram_serv_ETC___d386 =
	     bram_serverAdapterA_3_cnt +
	     (bram_serverAdapterA_3_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_serverAdapterA_3_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_serverAdapterA_3_cnt_80_SLT_3___d2766 =
	     (bram_serverAdapterA_3_cnt ^ 3'h4) < 3'd7 ;
  assign bram_serverAdapterA_cnt_6_PLUS_IF_bram_serverA_ETC___d32 =
	     bram_serverAdapterA_cnt +
	     (bram_serverAdapterA_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_serverAdapterA_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_serverAdapterA_cnt_6_SLT_3___d2767 =
	     (bram_serverAdapterA_cnt ^ 3'h4) < 3'd7 ;
  assign bram_serverAdapterA_outDataCore_notEmpty_OR_br_ETC___d1159 =
	     (bram_serverAdapterA_outDataCore$EMPTY_N ||
	      bram_serverAdapterA_outData_enqData$whas) &&
	     (bram_serverAdapterA_1_outDataCore$EMPTY_N ||
	      bram_serverAdapterA_1_outData_enqData$whas) &&
	     bram_serverAdapterA_2_outDataCore_notEmpty__38_ETC___d1157 ;
  assign bram_serverAdapterB_1_cnt_03_PLUS_IF_bram_serv_ETC___d209 =
	     bram_serverAdapterB_1_cnt +
	     (bram_serverAdapterB_1_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_serverAdapterB_1_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_serverAdapterB_1_cnt_03_SLT_3___d2038 =
	     (bram_serverAdapterB_1_cnt ^ 3'h4) < 3'd7 ;
  assign bram_serverAdapterB_1_outData_outData_whas__05_ETC___d2066 =
	     bram_serverAdapterB_1_outData_outData$whas &&
	     (bram_serverAdapterB_2_outDataCore$EMPTY_N ||
	      bram_serverAdapterB_2_outData_enqData$whas) &&
	     bram_serverAdapterB_2_outData_outData$whas &&
	     (bram_serverAdapterB_3_outDataCore$EMPTY_N ||
	      bram_serverAdapterB_3_outData_enqData$whas) &&
	     bram_serverAdapterB_3_outData_outData$whas ;
  assign bram_serverAdapterB_2_cnt_21_PLUS_IF_bram_serv_ETC___d327 =
	     bram_serverAdapterB_2_cnt +
	     (bram_serverAdapterB_2_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_serverAdapterB_2_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_serverAdapterB_2_cnt_21_SLT_3___d2039 =
	     (bram_serverAdapterB_2_cnt ^ 3'h4) < 3'd7 ;
  assign bram_serverAdapterB_3_cnt_39_PLUS_IF_bram_serv_ETC___d445 =
	     bram_serverAdapterB_3_cnt +
	     (bram_serverAdapterB_3_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_serverAdapterB_3_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_serverAdapterB_3_cnt_39_SLT_3___d2040 =
	     (bram_serverAdapterB_3_cnt ^ 3'h4) < 3'd7 ;
  assign bram_serverAdapterB_cnt_5_PLUS_IF_bram_serverA_ETC___d91 =
	     bram_serverAdapterB_cnt +
	     (bram_serverAdapterB_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_serverAdapterB_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_serverAdapterB_cnt_5_SLT_3___d2037 =
	     (bram_serverAdapterB_cnt ^ 3'h4) < 3'd7 ;
  assign byteCount__h35520 = x__h35638 - y__h35639 ;
  assign dw__h101823 =
	     { edp_inProcF$D_OUT[37:30],
	       edp_inProcF$D_OUT[27:20],
	       edp_inProcF$D_OUT[17:10],
	       edp_inProcF$D_OUT[7:0] } ;
  assign edp_fabMeta_444_BIT_128_445_AND_NOT_edp_fabMet_ETC___d1568 =
	     edp_fabMeta[128] && edp_fabMeta[127:96] != 32'd0 &&
	     !edp_tlpRcvBusy &&
	     edp_mesgLengthRemainPush != 17'd0 &&
	     !edp_doMesgMH &&
	     edp_mhFsm_abort_whas__331_AND_edp_mhFsm_abort__ETC___d1422 &&
	     !edp_mhFsm_start_reg ;
  assign edp_fhFsm_abort_whas__257_AND_edp_fhFsm_abort__ETC___d1325 =
	     (edp_fhFsm_state_mkFSMstate == 3'd0 ||
	      edp_fhFsm_state_mkFSMstate == 3'd3) &&
	     (!edp_fhFsm_start_reg_1 || edp_fhFsm_state_fired) ;
  assign edp_igPtr_753_ULE_1___d1754 = edp_igPtr <= 4'd1 ;
  assign edp_mesgLengthRemainPush_PLUS_3__q18 =
	     edp_mesgLengthRemainPush + 17'd3 ;
  assign edp_mhFsm_abort_whas__331_AND_edp_mhFsm_abort__ETC___d1422 =
	     (edp_mhFsm_state_mkFSMstate == 4'd0 ||
	      edp_mhFsm_state_mkFSMstate == 4'd6) &&
	     (!edp_mhFsm_start_reg_1 || edp_mhFsm_state_fired) ;
  assign edp_outBF_rRdPtr_83_EQ_edp_outBF_rWrPtr_18___d1455 =
	     edp_outBF_rRdPtr == edp_outBF_rWrPtr ;
  assign edp_outDwRemain_622_ULE_4___d1624 = edp_outDwRemain <= 10'd4 ;
  assign edp_rcvPtr_824_ULE_5___d1825 = edp_rcvPtr <= 4'd5 ;
  assign edp_tlpBRAM_mReqF_first__82_BIT_60_66_OR_IF_ed_ETC___d977 =
	     edp_tlpBRAM_mReqF$D_OUT[60] ||
	     CASE_edp_tlpBRAM_mReqFD_OUT_BITS_30_TO_29_NOT_ETC__q8 ;
  assign edp_tlpBRAM_mReqF_first__82_BIT_63_83_OR_IF_ed_ETC___d798 =
	     edp_tlpBRAM_mReqF$D_OUT[63] ||
	     CASE_edp_tlpBRAM_mReqFD_OUT_BITS_51_TO_50_NOT_ETC__q7 ;
  assign edp_tlpBRAM_rdRespDwRemain_188_ULE_4___d1190 =
	     edp_tlpBRAM_rdRespDwRemain <= 10'd4 ;
  assign edp_tlpBRAM_readNxtDWAddr_PLUS_1__q15 =
	     edp_tlpBRAM_readNxtDWAddr + 13'd1 ;
  assign edp_tlpBRAM_readNxtDWAddr_PLUS_2__q16 =
	     edp_tlpBRAM_readNxtDWAddr + 13'd2 ;
  assign edp_tlpBRAM_readNxtDWAddr_PLUS_3__q14 =
	     edp_tlpBRAM_readNxtDWAddr + 13'd3 ;
  assign edp_tlpBRAM_readRemainDWLen_010_ULE_4___d1011 =
	     edp_tlpBRAM_readRemainDWLen <= 10'd4 ;
  assign edp_tlpBRAM_readReq_first__061_BITS_30_TO_29_0_ETC___d2774 =
	     edp_tlpBRAM_readReq$D_OUT[30:29] +
	     (edp_tlpBRAM_readReq$D_OUT[60] ? 2'd0 : 2'd1) ;
  assign edp_tlpBRAM_writeDWAddr_PLUS_1__q12 =
	     edp_tlpBRAM_writeDWAddr + 13'd1 ;
  assign edp_tlpBRAM_writeDWAddr_PLUS_2__q13 =
	     edp_tlpBRAM_writeDWAddr + 13'd2 ;
  assign edp_tlpBRAM_writeDWAddr_PLUS_3__q11 =
	     edp_tlpBRAM_writeDWAddr + 13'd3 ;
  assign edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772 =
	     edp_tlpBRAM_writeRemainDWLen <= 10'd1 ;
  assign edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773 =
	     edp_tlpBRAM_writeRemainDWLen <= 10'd2 ;
  assign edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771 =
	     edp_tlpBRAM_writeRemainDWLen <= 10'd3 ;
  assign hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1451 =
	     hasPush && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     !edp_reqMetaInFlight &&
	     !edp_fabMeta[128] &&
	     edp_nearBufReady &&
	     edp_farBufReady ;
  assign hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1485 =
	     hasPush && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     !edp_tlpBRAM_mRespF$D_OUT[138] &&
	     edp_tlpBRAM_mRespF$D_OUT[89:88] == 2'd3 &&
	     edp_mhFsm_abort_whas__331_AND_edp_mhFsm_abort__ETC___d1422 &&
	     !edp_mhFsm_start_reg ;
  assign hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1503 =
	     hasPush && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     edp_tlpBRAM_mRespF$D_OUT[138] &&
	     edp_tlpBRAM_mRespF$D_OUT[137:136] == 2'd3 &&
	     edp_mhFsm_abort_whas__331_AND_edp_mhFsm_abort__ETC___d1422 &&
	     !edp_mhFsm_start_reg ;
  assign hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1606 =
	     hasPush && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     !edp_tlpBRAM_mRespF$D_OUT[138] &&
	     edp_tlpBRAM_mRespF$D_OUT[89:88] == 2'd2 &&
	     !edp_tlpXmtBusy &&
	     edp_postSeqDwell == 4'd0 ;
  assign hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1618 =
	     hasPush && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     edp_tlpBRAM_mRespF$D_OUT[138] &&
	     edp_tlpBRAM_mRespF$D_OUT[137:136] == 2'd2 &&
	     edp_mhFsm_abort_whas__331_AND_edp_mhFsm_abort__ETC___d1422 &&
	     !edp_mhFsm_start_reg ;
  assign hasPush_AND_edp_dpControl_wget__431_BITS_7_TO__ETC___d1636 =
	     hasPush && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     edp_fabMeta[128] &&
	     !edp_tlpXmtBusy &&
	     !edp_xmtMetaInFlight &&
	     edp_xmtMetaOK &&
	     edp_postSeqDwell == 4'd0 ;
  assign idx__h26295 = 2'd0 - edp_tlpBRAM_writeDWAddr[1:0] ;
  assign idx__h28526 = 2'd1 - edp_tlpBRAM_writeDWAddr[1:0] ;
  assign idx__h29830 = 2'd2 - edp_tlpBRAM_writeDWAddr[1:0] ;
  assign idx__h31134 = 2'd3 - edp_tlpBRAM_writeDWAddr[1:0] ;
  assign idx__h33375 = 2'd0 - edp_tlpBRAM_readNxtDWAddr[1:0] ;
  assign idx__h33843 = 2'd1 - edp_tlpBRAM_readNxtDWAddr[1:0] ;
  assign idx__h34216 = 2'd2 - edp_tlpBRAM_readNxtDWAddr[1:0] ;
  assign idx__h34589 = 2'd3 - edp_tlpBRAM_readNxtDWAddr[1:0] ;
  assign lowAddr__h35519 =
	     { edp_tlpBRAM_readReq$D_OUT[33:29], lowAddr10__h35518 } ;
  assign mesgMeta_opcode__h115176 =
	     { 24'h800000, wmi_wmi_mFlagF$D_OUT[31:24] } ;
  assign nowLS__h83897 =
	     { edp_tlpBRAM_mRespF$D_OUT[39:32],
	       edp_tlpBRAM_mRespF$D_OUT[47:40],
	       edp_tlpBRAM_mRespF$D_OUT[55:48],
	       edp_tlpBRAM_mRespF$D_OUT[63:56] } ;
  assign nowMS__h82954 =
	     { edp_tlpBRAM_mRespF$D_OUT[71:64],
	       edp_tlpBRAM_mRespF$D_OUT[79:72],
	       edp_tlpBRAM_mRespF$D_OUT[87:80],
	       edp_tlpBRAM_mRespF$D_OUT[95:88] } ;
  assign opcode__h81723 =
	     { edp_tlpBRAM_mRespF$D_OUT[103:96],
	       edp_tlpBRAM_mRespF$D_OUT[111:104],
	       edp_tlpBRAM_mRespF$D_OUT[119:112],
	       edp_tlpBRAM_mRespF$D_OUT[127:120] } ;
  assign rdat__h124812 = { 16'd0, bml_lclNumBufs } ;
  assign rdat__h124820 = { 16'd0, bml_fabNumBufs } ;
  assign rdat__h124828 = { 16'd0, bml_mesgBase } ;
  assign rdat__h124836 = { 16'd0, bml_metaBase } ;
  assign rdat__h124844 = { 16'd0, bml_mesgSize } ;
  assign rdat__h124852 = { 16'd0, bml_metaSize } ;
  assign rdat__h124860 = { 16'd0, bml_lclBufsCF } ;
  assign rdat__h124881 =
	     hasDebugLogic ? { bml_lclBufsAR, bml_fabBufsAvail } : 32'd0 ;
  assign rdat__h124888 =
	     hasDebugLogic ? { bml_remBuf_value, bml_lclBuf_value } : 32'd0 ;
  assign rdat__h124901 =
	     hasDebugLogic ? { bml_lclStarts, bml_lclDones } : 32'd0 ;
  assign rdat__h124908 =
	     hasDebugLogic ? { bml_remStarts, bml_remDones } : 32'd0 ;
  assign rdat__h124915 = hasDebugLogic ? wmi_thisMesg : 32'd0 ;
  assign rdat__h125179 = hasDebugLogic ? wmi_lastMesg : 32'd0 ;
  assign rdat__h125229 =
	     hasDebugLogic ? { wmi_reqCount, wmi_wrtCount } : 32'd0 ;
  assign rdat__h125329 = hasDebugLogic ? 32'hDADEBABE : 32'd0 ;
  assign rdat__h125387 = { 24'd0, dpControl } ;
  assign rdat__h125409 = hasDebugLogic ? edp_flowDiagCount : 32'd0 ;
  assign rdat__h125419 =
	     hasDebugLogic ?
	       { 4'h0,
		 edp_complTimerCount,
		 12'h0,
		 CASE_edp_lastRuleFired_10_1_edp_lastRuleFired__ETC__q5 } :
	       32'd0 ;
  assign rdat__h125541 = hasDebugLogic ? edp_lastMetaV : 32'd0 ;
  assign rdat__h125661 = hasDebugLogic ? edp_lastMetaV_1 : 32'd0 ;
  assign rdat__h125690 = hasDebugLogic ? edp_lastMetaV_2 : 32'd0 ;
  assign rdat__h125719 = hasDebugLogic ? edp_lastMetaV_3 : 32'd0 ;
  assign rdat__h125748 = hasDebugLogic ? 32'hC0DE0111 : 32'd0 ;
  assign rdat__h125778 = hasDebugLogic ? dmaStartTime[31:0] : 32'd0 ;
  assign rdat__h125812 = hasDebugLogic ? dmaStartTime[63:32] : 32'd0 ;
  assign rdat__h125845 = hasDebugLogic ? dmaDoneTime[31:0] : 32'd0 ;
  assign rdat__h125879 = hasDebugLogic ? dmaDoneTime[63:32] : 32'd0 ;
  assign rdat__h125912 = hasDebugLogic ? edp_dbgBytesTxEnq : 32'd0 ;
  assign rdat__h125923 = hasDebugLogic ? edp_dbgBytesTxDeq : 32'd0 ;
  assign rdat__h125934 = hasDebugLogic ? edpDebug : 32'd0 ;
  assign rdata__h40958 =
	     edp_tlpBRAM_readReq_first__061_BITS_30_TO_29_0_ETC___d2774[1] ?
	       IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d1201 :
	       IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d1206 ;
  assign rdw__h101824 =
	     { x__h105091,
	       edp_inProcF$D_OUT[27:20],
	       edp_inProcF$D_OUT[37:30] } ;
  assign rreq_tag__h87207 =
	     (y__h87023 == edp_mesgLengthRemainPush) ? 8'h01 : 8'h0 ;
  assign rresp_data__h35565 =
	     { IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d2798[7:0],
	       IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d2798[15:8],
	       IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d2798[23:16],
	       IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d2798[31:24] } ;
  assign spanToNextPage__h86997 = 13'd4096 - { 1'd0, edp_srcMesgAccu[11:0] } ;
  assign thisRequestLength__h86998 =
	     (x__h87033[12:0] <= spanToNextPage__h86997) ?
	       x__h87033[12:0] :
	       spanToNextPage__h86997 ;
  assign wmi_dpControl_whas__024_AND_bram_serverAdapter_ETC___d2070 =
	     (bram_serverAdapterB_outDataCore$EMPTY_N ||
	      bram_serverAdapterB_outData_enqData$whas) &&
	     bram_serverAdapterB_outData_outData$whas &&
	     (bram_serverAdapterB_1_outDataCore$EMPTY_N ||
	      bram_serverAdapterB_1_outData_enqData$whas) &&
	     bram_serverAdapterB_1_outData_outData_whas__05_ETC___d2066 ;
  assign wmi_wmi_operateD_977_AND_wmi_wmi_peerIsReady_9_ETC___d2152 =
	     wmi_wmi_operateD && wmi_wmi_peerIsReady &&
	     bram_serverAdapterB_cnt_5_SLT_3___d2037 &&
	     bram_serverAdapterB_1_cnt_03_SLT_3___d2038 &&
	     bram_serverAdapterB_2_cnt_21_SLT_3___d2039 &&
	     bram_serverAdapterB_3_cnt_39_SLT_3___d2040 &&
	     wmi_wmi_mFlagF$EMPTY_N ;
  assign x3__h115136 = { 8'd0, wmi_wmi_mFlagF$D_OUT[23:0] } ;
  assign x__h101850 =
	     { edp_inProcF$D_OUT[39:38] != 2'd0,
	       edp_inProcF$D_OUT[29:28] != 2'd0,
	       edp_inProcF$D_OUT[19:18] != 2'd0,
	       edp_inProcF$D_OUT[9:8] != 2'd0 } ;
  assign x__h105051 = { edp_inProcF$D_OUT[27:20], edp_inProcF$D_OUT[37:30] } ;
  assign x__h105091 = { edp_inProcF$D_OUT[7:0], edp_inProcF$D_OUT[17:10] } ;
  assign x__h105432 = edp_rcvDA + 32'd4 ;
  assign x__h105463 = edp_rcvDL - 16'd4 ;
  assign x__h121490 = (dpControl[1:0] == 2'd1) ? bml_fabNumBufs : 16'd0 ;
  assign x__h122618 = bml_lclBufsAR + 16'd1 ;
  assign x__h122623 = bml_lclBufsAR - 16'd1 ;
  assign x__h122730 = bml_lclBufsCF + 16'd1 ;
  assign x__h122767 = bml_lclBufsCF - 16'd1 ;
  assign x__h122849 = bml_fabBufsAvail + 16'd1 ;
  assign x__h122854 = bml_fabBufsAvail - 16'd1 ;
  assign x__h122888 = bml_lclCredit + 16'd1 ;
  assign x__h122893 = bml_lclCredit - 16'd1 ;
  assign x__h20843 = edp_outBF_rRdPtr + 12'd1 ;
  assign x__h35638 = x__h35640 - y__h35641 ;
  assign x__h35640 = { edp_tlpBRAM_readReq$D_OUT[28:19], 2'b0 } ;
  assign x__h79939 =
	     { edp_tlpBRAM_mRespF$D_OUT[7:0],
	       edp_tlpBRAM_mRespF$D_OUT[15:8],
	       edp_tlpBRAM_mRespF$D_OUT[23:16],
	       edp_tlpBRAM_mRespF$D_OUT[31:24] } ;
  assign x__h84900 = { 15'd0, edp_mesgLengthRemainPush } ;
  assign x__h87033 =
	     (edp_mesgLengthRemainPush <= y__h87035) ?
	       edp_mesgLengthRemainPush :
	       y__h87035 ;
  assign x__h97353 =
	     { edp_inF$D_OUT[39:38] != 2'd0,
	       edp_inF$D_OUT[29:28] != 2'd0,
	       edp_inF$D_OUT[19:18] != 2'd0,
	       edp_inF$D_OUT[9:8] != 2'd0 } ;
  assign y__h24596 = edp_tlpBRAM_mReqF$D_OUT[63] ? 13'd0 : 13'd1 ;
  assign y__h24663 = edp_tlpBRAM_mReqF$D_OUT[63] ? 10'd0 : 10'd1 ;
  assign y__h33145 = edp_tlpBRAM_mReqF$D_OUT[60] ? 10'd0 : 10'd1 ;
  assign y__h33157 = edp_tlpBRAM_mReqF$D_OUT[60] ? 13'd0 : 13'd1 ;
  assign y__h35639 =
	     (edp_tlpBRAM_readReq$D_OUT[28:19] == 10'd1) ?
	       12'd0 :
	       { 10'd0, x__h35670 } ;
  assign y__h35641 = { 10'd0, x__h35647 } ;
  assign y__h36580 = edp_tlpBRAM_readReq$D_OUT[60] ? 10'd0 : 10'd1 ;
  assign y__h87023 = { 4'd0, thisRequestLength__h86998 } ;
  assign y__h87035 = { 4'd0, edp_maxPayloadSize } ;
  assign y__h87114 = { 19'd0, thisRequestLength__h86998 } ;
  assign y__h87159 = { 3'd0, thisRequestLength__h86998 } ;
  assign y__h87385 = (edp_fabMesgAddrMS == 32'd0) ? 10'd1 : 10'd0 ;
  assign y__h87444 = { 20'd0, edp_tlpBRAM_mRespF$D_OUT[71:62], 2'd0 } ;
  assign y_avValue__h116735 =
	     bram_serverAdapterB_outDataCore$EMPTY_N ?
	       bram_serverAdapterB_outDataCore$D_OUT :
	       bram_memory$DOB ;
  assign y_avValue__h116755 =
	     bram_serverAdapterB_1_outDataCore$EMPTY_N ?
	       bram_serverAdapterB_1_outDataCore$D_OUT :
	       bram_memory_1$DOB ;
  assign y_avValue__h116775 =
	     bram_serverAdapterB_2_outDataCore$EMPTY_N ?
	       bram_serverAdapterB_2_outDataCore$D_OUT :
	       bram_memory_2$DOB ;
  assign y_avValue__h116795 =
	     bram_serverAdapterB_3_outDataCore$EMPTY_N ?
	       bram_serverAdapterB_3_outDataCore$D_OUT :
	       bram_memory_3$DOB ;
  always@(edp_outF$D_OUT)
  begin
    case (edp_outF$D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outFD_OUT_BITS_39_TO_38_3_0_edp_outF_ETC__q1 =
	      edp_outF$D_OUT[39:38];
      2'd3: CASE_edp_outFD_OUT_BITS_39_TO_38_3_0_edp_outF_ETC__q1 = 2'd3;
    endcase
  end
  always@(edp_outF$D_OUT)
  begin
    case (edp_outF$D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outFD_OUT_BITS_29_TO_28_3_0_edp_outF_ETC__q2 =
	      edp_outF$D_OUT[29:28];
      2'd3: CASE_edp_outFD_OUT_BITS_29_TO_28_3_0_edp_outF_ETC__q2 = 2'd3;
    endcase
  end
  always@(edp_outF$D_OUT)
  begin
    case (edp_outF$D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outFD_OUT_BITS_19_TO_18_3_0_edp_outF_ETC__q3 =
	      edp_outF$D_OUT[19:18];
      2'd3: CASE_edp_outFD_OUT_BITS_19_TO_18_3_0_edp_outF_ETC__q3 = 2'd3;
    endcase
  end
  always@(edp_outF$D_OUT)
  begin
    case (edp_outF$D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outFD_OUT_BITS_9_TO_8_3_0_edp_outFD_ETC__q4 =
	      edp_outF$D_OUT[9:8];
      2'd3: CASE_edp_outFD_OUT_BITS_9_TO_8_3_0_edp_outFD_ETC__q4 = 2'd3;
    endcase
  end
  always@(edp_tlpBRAM_readReq$D_OUT)
  begin
    case (edp_tlpBRAM_readReq$D_OUT[18:15])
      4'b1100: x__h35647 = 2'b10;
      4'b1110: x__h35647 = 2'b01;
      4'b1111: x__h35647 = 2'b0;
      default: x__h35647 = 2'b11;
    endcase
  end
  always@(edp_tlpBRAM_readReq$D_OUT)
  begin
    case (edp_tlpBRAM_readReq$D_OUT[14:11])
      4'b1100: x__h35670 = 2'b10;
      4'b1110: x__h35670 = 2'b01;
      4'b1111: x__h35670 = 2'b0;
      default: x__h35670 = 2'b11;
    endcase
  end
  always@(edp_lastRuleFired)
  begin
    case (edp_lastRuleFired)
      4'd1, 4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8, 4'd9, 4'd15:
	  CASE_edp_lastRuleFired_10_1_edp_lastRuleFired__ETC__q5 =
	      edp_lastRuleFired;
      default: CASE_edp_lastRuleFired_10_1_edp_lastRuleFired__ETC__q5 = 4'd10;
    endcase
  end
  always@(wmi_p4B or
	  y_avValue__h116795 or
	  y_avValue__h116735 or y_avValue__h116755 or y_avValue__h116775)
  begin
    case (wmi_p4B)
      2'd0: rdata__h116899 = y_avValue__h116735;
      2'd1: rdata__h116899 = y_avValue__h116755;
      2'd2: rdata__h116899 = y_avValue__h116775;
      2'd3: rdata__h116899 = y_avValue__h116795;
    endcase
  end
  always@(wci_reqF$D_OUT or
	  rdat__h124812 or
	  rdat__h124820 or
	  rdat__h124828 or
	  rdat__h124836 or
	  rdat__h124844 or
	  rdat__h124852 or
	  rdat__h124860 or
	  rdat__h124881 or
	  rdat__h124888 or
	  rdat__h124901 or
	  rdat__h124908 or
	  rdat__h124915 or
	  rdat__h125179 or
	  rdat__h125229 or
	  rdat__h125329 or
	  bml_fabMesgBase or
	  bml_fabMetaBase or
	  bml_fabMesgSize or
	  bml_fabMetaSize or
	  bml_fabFlowBase or
	  bml_fabFlowSize or
	  rdat__h125387 or
	  rdat__h125409 or
	  rdat__h125419 or
	  rdat__h125541 or
	  rdat__h125661 or
	  rdat__h125690 or
	  rdat__h125719 or
	  rdat__h125748 or
	  bml_fabMesgBaseMS or
	  bml_fabMetaBaseMS or
	  bml_fabFlowBaseMS or
	  rdat__h125778 or
	  rdat__h125812 or
	  rdat__h125845 or
	  rdat__h125879 or rdat__h125912 or rdat__h125923 or rdat__h125934)
  begin
    case (wci_reqF$D_OUT[39:32])
      8'h0: _theResult____h124733 = rdat__h124812;
      8'h04: _theResult____h124733 = rdat__h124820;
      8'h08: _theResult____h124733 = rdat__h124828;
      8'h0C: _theResult____h124733 = rdat__h124836;
      8'h10: _theResult____h124733 = rdat__h124844;
      8'h14: _theResult____h124733 = rdat__h124852;
      8'h20: _theResult____h124733 = rdat__h124860;
      8'h24: _theResult____h124733 = 32'hF00DFACE;
      8'h28: _theResult____h124733 = rdat__h124881;
      8'h2C: _theResult____h124733 = rdat__h124888;
      8'h30: _theResult____h124733 = rdat__h124901;
      8'h34: _theResult____h124733 = rdat__h124908;
      8'h38: _theResult____h124733 = rdat__h124915;
      8'h3C: _theResult____h124733 = rdat__h125179;
      8'h40: _theResult____h124733 = rdat__h125229;
      8'h44: _theResult____h124733 = 32'd0;
      8'h48: _theResult____h124733 = rdat__h125329;
      8'h4C: _theResult____h124733 = 32'h00008000;
      8'h50: _theResult____h124733 = bml_fabMesgBase;
      8'h54: _theResult____h124733 = bml_fabMetaBase;
      8'h58: _theResult____h124733 = bml_fabMesgSize;
      8'h5C: _theResult____h124733 = bml_fabMetaSize;
      8'h60: _theResult____h124733 = bml_fabFlowBase;
      8'h64: _theResult____h124733 = bml_fabFlowSize;
      8'h68: _theResult____h124733 = rdat__h125387;
      8'h6C: _theResult____h124733 = rdat__h125409;
      8'h70: _theResult____h124733 = rdat__h125419;
      8'h80: _theResult____h124733 = rdat__h125541;
      8'h84: _theResult____h124733 = rdat__h125661;
      8'h88: _theResult____h124733 = rdat__h125690;
      8'h8C: _theResult____h124733 = rdat__h125719;
      8'h90: _theResult____h124733 = rdat__h125748;
      8'h94: _theResult____h124733 = bml_fabMesgBaseMS;
      8'h98: _theResult____h124733 = bml_fabMetaBaseMS;
      8'h9C: _theResult____h124733 = bml_fabFlowBaseMS;
      8'hA0: _theResult____h124733 = rdat__h125778;
      8'hA4: _theResult____h124733 = rdat__h125812;
      8'hA8: _theResult____h124733 = rdat__h125845;
      8'hAC: _theResult____h124733 = rdat__h125879;
      8'hB0: _theResult____h124733 = rdat__h125912;
      8'hB4: _theResult____h124733 = rdat__h125923;
      8'hB8: _theResult____h124733 = rdat__h125934;
      default: _theResult____h124733 = 32'd0;
    endcase
  end
  always@(edp_tlpBRAM_readReq$D_OUT)
  begin
    case (edp_tlpBRAM_readReq$D_OUT[18:15])
      4'b1000: lowAddr10__h35518 = 2'b11;
      4'b1100: lowAddr10__h35518 = 2'b10;
      4'b1110: lowAddr10__h35518 = 2'b01;
      default: lowAddr10__h35518 = 2'b0;
    endcase
  end
  always@(dpControl or bml_fabDone or bml_remDone)
  begin
    case (dpControl[1:0])
      2'd0:
	  IF_bml_dpControl_wget__290_BITS_1_TO_0_296_EQ__ETC___d2367 =
	      bml_fabDone;
      2'd1:
	  IF_bml_dpControl_wget__290_BITS_1_TO_0_296_EQ__ETC___d2367 =
	      bml_remDone;
      default: IF_bml_dpControl_wget__290_BITS_1_TO_0_296_EQ__ETC___d2367 =
		   bml_fabDone;
    endcase
  end
  always@(dpControl or bml_fabDone or bml_remDone or bml_remStart)
  begin
    case (dpControl[1:0])
      2'd0:
	  CASE_dpControl_BITS_1_TO_0_bml_fabDone_0_bml_f_ETC__q6 =
	      bml_fabDone;
      2'd1:
	  CASE_dpControl_BITS_1_TO_0_bml_fabDone_0_bml_f_ETC__q6 =
	      (dpControl[3:2] == 2'd1) ? bml_remDone : bml_remStart;
      default: CASE_dpControl_BITS_1_TO_0_bml_fabDone_0_bml_f_ETC__q6 =
		   bml_fabDone;
    endcase
  end
  always@(idx__h26295 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771 or
	  edp_tlpBRAM_writeRemainDWLen or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773)
  begin
    case (idx__h26295)
      2'd0:
	  IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d839 =
	      edp_tlpBRAM_writeRemainDWLen == 10'd0;
      2'd1:
	  IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d839 =
	      edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772;
      2'd2:
	  IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d839 =
	      edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773;
      2'd3:
	  IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d839 =
	      edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771;
    endcase
  end
  always@(idx__h28526 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771 or
	  edp_tlpBRAM_writeRemainDWLen or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773)
  begin
    case (idx__h28526)
      2'd0:
	  IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d849 =
	      edp_tlpBRAM_writeRemainDWLen == 10'd0;
      2'd1:
	  IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d849 =
	      edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772;
      2'd2:
	  IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d849 =
	      edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773;
      2'd3:
	  IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d849 =
	      edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771;
    endcase
  end
  always@(idx__h31134 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771 or
	  edp_tlpBRAM_writeRemainDWLen or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773)
  begin
    case (idx__h31134)
      2'd0:
	  IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d869 =
	      edp_tlpBRAM_writeRemainDWLen == 10'd0;
      2'd1:
	  IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d869 =
	      edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772;
      2'd2:
	  IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d869 =
	      edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773;
      2'd3:
	  IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d869 =
	      edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771;
    endcase
  end
  always@(idx__h29830 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771 or
	  edp_tlpBRAM_writeRemainDWLen or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773)
  begin
    case (idx__h29830)
      2'd0:
	  IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d859 =
	      edp_tlpBRAM_writeRemainDWLen == 10'd0;
      2'd1:
	  IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d859 =
	      edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772;
      2'd2:
	  IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d859 =
	      edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773;
      2'd3:
	  IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d859 =
	      edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771;
    endcase
  end
  always@(edp_tlpBRAM_mReqF$D_OUT or
	  bram_serverAdapterA_3_cnt_80_SLT_3___d2766 or
	  bram_serverAdapterA_cnt_6_SLT_3___d2767 or
	  bram_serverAdapterA_1_cnt_44_SLT_3___d2765 or
	  bram_serverAdapterA_2_cnt_62_SLT_3___d2838)
  begin
    case (edp_tlpBRAM_mReqF$D_OUT[51:50])
      2'd0:
	  CASE_edp_tlpBRAM_mReqFD_OUT_BITS_51_TO_50_NOT_ETC__q7 =
	      bram_serverAdapterA_cnt_6_SLT_3___d2767;
      2'd1:
	  CASE_edp_tlpBRAM_mReqFD_OUT_BITS_51_TO_50_NOT_ETC__q7 =
	      bram_serverAdapterA_1_cnt_44_SLT_3___d2765;
      2'd2:
	  CASE_edp_tlpBRAM_mReqFD_OUT_BITS_51_TO_50_NOT_ETC__q7 =
	      bram_serverAdapterA_2_cnt_62_SLT_3___d2838;
      2'd3:
	  CASE_edp_tlpBRAM_mReqFD_OUT_BITS_51_TO_50_NOT_ETC__q7 =
	      edp_tlpBRAM_mReqF$D_OUT[51:50] != 2'd3 ||
	      bram_serverAdapterA_3_cnt_80_SLT_3___d2766;
    endcase
  end
  always@(edp_tlpBRAM_mReqF$D_OUT or
	  bram_serverAdapterA_3_cnt_80_SLT_3___d2766 or
	  bram_serverAdapterA_cnt_6_SLT_3___d2767 or
	  bram_serverAdapterA_1_cnt_44_SLT_3___d2765 or
	  bram_serverAdapterA_2_cnt_62_SLT_3___d2838)
  begin
    case (edp_tlpBRAM_mReqF$D_OUT[30:29])
      2'd0:
	  CASE_edp_tlpBRAM_mReqFD_OUT_BITS_30_TO_29_NOT_ETC__q8 =
	      bram_serverAdapterA_cnt_6_SLT_3___d2767;
      2'd1:
	  CASE_edp_tlpBRAM_mReqFD_OUT_BITS_30_TO_29_NOT_ETC__q8 =
	      bram_serverAdapterA_1_cnt_44_SLT_3___d2765;
      2'd2:
	  CASE_edp_tlpBRAM_mReqFD_OUT_BITS_30_TO_29_NOT_ETC__q8 =
	      bram_serverAdapterA_2_cnt_62_SLT_3___d2838;
      2'd3:
	  CASE_edp_tlpBRAM_mReqFD_OUT_BITS_30_TO_29_NOT_ETC__q8 =
	      edp_tlpBRAM_mReqF$D_OUT[30:29] != 2'd3 ||
	      bram_serverAdapterA_3_cnt_80_SLT_3___d2766;
    endcase
  end
  always@(wmi_addr or
	  bram_serverAdapterB_3_cnt_39_SLT_3___d2040 or
	  bram_serverAdapterB_cnt_5_SLT_3___d2037 or
	  bram_serverAdapterB_1_cnt_03_SLT_3___d2038 or
	  bram_serverAdapterB_2_cnt_21_SLT_3___d2039)
  begin
    case (wmi_addr[3:2])
      2'd0:
	  IF_wmi_addr_116_BITS_3_TO_2_117_EQ_0_118_THEN__ETC___d3312 =
	      bram_serverAdapterB_cnt_5_SLT_3___d2037;
      2'd1:
	  IF_wmi_addr_116_BITS_3_TO_2_117_EQ_0_118_THEN__ETC___d3312 =
	      bram_serverAdapterB_1_cnt_03_SLT_3___d2038;
      2'd2:
	  IF_wmi_addr_116_BITS_3_TO_2_117_EQ_0_118_THEN__ETC___d3312 =
	      bram_serverAdapterB_2_cnt_21_SLT_3___d2039;
      2'd3:
	  IF_wmi_addr_116_BITS_3_TO_2_117_EQ_0_118_THEN__ETC___d3312 =
	      wmi_addr[3:2] != 2'd3 ||
	      bram_serverAdapterB_3_cnt_39_SLT_3___d2040;
    endcase
  end
  always@(dpControl or bml_fabDone or bml_remDone or bml_remStart)
  begin
    case (dpControl[1:0])
      2'd0:
	  CASE_dpControl_BITS_1_TO_0_NOT_bml_fabDone_0_N_ETC__q9 =
	      !bml_fabDone;
      2'd1:
	  CASE_dpControl_BITS_1_TO_0_NOT_bml_fabDone_0_N_ETC__q9 =
	      (dpControl[3:2] == 2'd1) ? !bml_remDone : !bml_remStart;
      default: CASE_dpControl_BITS_1_TO_0_NOT_bml_fabDone_0_N_ETC__q9 =
		   !bml_fabDone;
    endcase
  end
  always@(idx__h26295 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771 or
	  edp_tlpBRAM_writeRemainDWLen or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773)
  begin
    case (idx__h26295)
      2'd0:
	  IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2899 =
	      edp_tlpBRAM_writeRemainDWLen != 10'd0;
      2'd1:
	  IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2899 =
	      !edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772;
      2'd2:
	  IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2899 =
	      !edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773;
      2'd3:
	  IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2899 =
	      !edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771;
    endcase
  end
  always@(idx__h28526 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771 or
	  edp_tlpBRAM_writeRemainDWLen or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773)
  begin
    case (idx__h28526)
      2'd0:
	  IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2900 =
	      edp_tlpBRAM_writeRemainDWLen != 10'd0;
      2'd1:
	  IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2900 =
	      !edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772;
      2'd2:
	  IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2900 =
	      !edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773;
      2'd3:
	  IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2900 =
	      !edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771;
    endcase
  end
  always@(idx__h29830 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771 or
	  edp_tlpBRAM_writeRemainDWLen or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773)
  begin
    case (idx__h29830)
      2'd0:
	  IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2901 =
	      edp_tlpBRAM_writeRemainDWLen != 10'd0;
      2'd1:
	  IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2901 =
	      !edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772;
      2'd2:
	  IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2901 =
	      !edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773;
      2'd3:
	  IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2901 =
	      !edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771;
    endcase
  end
  always@(idx__h31134 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771 or
	  edp_tlpBRAM_writeRemainDWLen or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772 or
	  edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773)
  begin
    case (idx__h31134)
      2'd0:
	  IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2902 =
	      edp_tlpBRAM_writeRemainDWLen != 10'd0;
      2'd1:
	  IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2902 =
	      !edp_tlpBRAM_writeRemainDWLen_26_ULE_1___d2772;
      2'd2:
	  IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2902 =
	      !edp_tlpBRAM_writeRemainDWLen_26_ULE_2___d2773;
      2'd3:
	  IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2902 =
	      !edp_tlpBRAM_writeRemainDWLen_26_ULE_3___d2771;
    endcase
  end
  always@(idx__h26295 or edp_tlpBRAM_mReqF$D_OUT)
  begin
    case (idx__h26295)
      2'd0:
	  IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2940 =
	      edp_tlpBRAM_mReqF$D_OUT[127:96];
      2'd1:
	  IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2940 =
	      edp_tlpBRAM_mReqF$D_OUT[95:64];
      2'd2:
	  IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2940 =
	      edp_tlpBRAM_mReqF$D_OUT[63:32];
      2'd3:
	  IF_0_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2940 =
	      edp_tlpBRAM_mReqF$D_OUT[31:0];
    endcase
  end
  always@(idx__h28526 or edp_tlpBRAM_mReqF$D_OUT)
  begin
    case (idx__h28526)
      2'd0:
	  IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2941 =
	      edp_tlpBRAM_mReqF$D_OUT[127:96];
      2'd1:
	  IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2941 =
	      edp_tlpBRAM_mReqF$D_OUT[95:64];
      2'd2:
	  IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2941 =
	      edp_tlpBRAM_mReqF$D_OUT[63:32];
      2'd3:
	  IF_1_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2941 =
	      edp_tlpBRAM_mReqF$D_OUT[31:0];
    endcase
  end
  always@(idx__h29830 or edp_tlpBRAM_mReqF$D_OUT)
  begin
    case (idx__h29830)
      2'd0:
	  IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2942 =
	      edp_tlpBRAM_mReqF$D_OUT[127:96];
      2'd1:
	  IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2942 =
	      edp_tlpBRAM_mReqF$D_OUT[95:64];
      2'd2:
	  IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2942 =
	      edp_tlpBRAM_mReqF$D_OUT[63:32];
      2'd3:
	  IF_2_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2942 =
	      edp_tlpBRAM_mReqF$D_OUT[31:0];
    endcase
  end
  always@(idx__h31134 or edp_tlpBRAM_mReqF$D_OUT)
  begin
    case (idx__h31134)
      2'd0:
	  IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2943 =
	      edp_tlpBRAM_mReqF$D_OUT[127:96];
      2'd1:
	  IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2943 =
	      edp_tlpBRAM_mReqF$D_OUT[95:64];
      2'd2:
	  IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2943 =
	      edp_tlpBRAM_mReqF$D_OUT[63:32];
      2'd3:
	  IF_3_MINUS_edp_tlpBRAM_writeDWAddr_22_BITS_1_T_ETC___d2943 =
	      edp_tlpBRAM_mReqF$D_OUT[31:0];
    endcase
  end
  always@(dpControl or bml_fabDone or bml_remDone)
  begin
    case (dpControl[1:0])
      2'd0:
	  CASE_dpControl_BITS_1_TO_0_NOT_bml_fabDone_0_N_ETC__q10 =
	      !bml_fabDone;
      2'd1:
	  CASE_dpControl_BITS_1_TO_0_NOT_bml_fabDone_0_N_ETC__q10 =
	      !bml_remDone;
      default: CASE_dpControl_BITS_1_TO_0_NOT_bml_fabDone_0_N_ETC__q10 =
		   !bml_fabDone;
    endcase
  end
  always@(edp_tlpBRAM_readReq$D_OUT or
	  bram_serverAdapterA_3_outDataCore$EMPTY_N or
	  bram_serverAdapterA_3_outData_enqData$whas or
	  bram_serverAdapterA_outDataCore$EMPTY_N or
	  bram_serverAdapterA_outData_enqData$whas or
	  bram_serverAdapterA_1_outDataCore$EMPTY_N or
	  bram_serverAdapterA_1_outData_enqData$whas or
	  bram_serverAdapterA_2_outDataCore$EMPTY_N or
	  bram_serverAdapterA_2_outData_enqData$whas)
  begin
    case (edp_tlpBRAM_readReq$D_OUT[30:29])
      2'd0:
	  IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d1076 =
	      bram_serverAdapterA_outDataCore$EMPTY_N ||
	      bram_serverAdapterA_outData_enqData$whas;
      2'd1:
	  IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d1076 =
	      bram_serverAdapterA_1_outDataCore$EMPTY_N ||
	      bram_serverAdapterA_1_outData_enqData$whas;
      2'd2:
	  IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d1076 =
	      bram_serverAdapterA_2_outDataCore$EMPTY_N ||
	      bram_serverAdapterA_2_outData_enqData$whas;
      2'd3:
	  IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d1076 =
	      edp_tlpBRAM_readReq$D_OUT[30:29] != 2'd3 ||
	      bram_serverAdapterA_3_outDataCore$EMPTY_N ||
	      bram_serverAdapterA_3_outData_enqData$whas;
    endcase
  end
  always@(edp_tlpBRAM_readReq$D_OUT or
	  bram_serverAdapterA_3_outData_outData$wget or
	  bram_serverAdapterA_outData_outData$wget or
	  bram_serverAdapterA_1_outData_outData$wget or
	  bram_serverAdapterA_2_outData_outData$wget)
  begin
    case (edp_tlpBRAM_readReq$D_OUT[30:29])
      2'd0:
	  IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d2798 =
	      bram_serverAdapterA_outData_outData$wget;
      2'd1:
	  IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d2798 =
	      bram_serverAdapterA_1_outData_outData$wget;
      2'd2:
	  IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d2798 =
	      bram_serverAdapterA_2_outData_outData$wget;
      2'd3:
	  IF_edp_tlpBRAM_readReq_first__061_BITS_30_TO_2_ETC___d2798 =
	      bram_serverAdapterA_3_outData_outData$wget;
    endcase
  end
  always@(edp_tlpBRAM_readReq$D_OUT or
	  bram_serverAdapterA_3_outData_outData$whas or
	  bram_serverAdapterA_outData_outData$whas or
	  bram_serverAdapterA_1_outData_outData$whas or
	  bram_serverAdapterA_2_outData_outData$whas)
  begin
    case (edp_tlpBRAM_readReq$D_OUT[30:29])
      2'd0:
	  CASE_edp_tlpBRAM_readReqD_OUT_BITS_30_TO_29_N_ETC__q19 =
	      bram_serverAdapterA_outData_outData$whas;
      2'd1:
	  CASE_edp_tlpBRAM_readReqD_OUT_BITS_30_TO_29_N_ETC__q19 =
	      bram_serverAdapterA_1_outData_outData$whas;
      2'd2:
	  CASE_edp_tlpBRAM_readReqD_OUT_BITS_30_TO_29_N_ETC__q19 =
	      bram_serverAdapterA_2_outData_outData$whas;
      2'd3:
	  CASE_edp_tlpBRAM_readReqD_OUT_BITS_30_TO_29_N_ETC__q19 =
	      edp_tlpBRAM_readReq$D_OUT[30:29] != 2'd3 ||
	      bram_serverAdapterA_3_outData_outData$whas;
    endcase
  end
  always@(wmi_p4B or
	  bram_serverAdapterB_3_outDataCore$EMPTY_N or
	  bram_serverAdapterB_3_outData_enqData$whas or
	  bram_serverAdapterB_1_outDataCore$EMPTY_N or
	  bram_serverAdapterB_1_outData_enqData$whas or
	  bram_serverAdapterB_2_outDataCore$EMPTY_N or
	  bram_serverAdapterB_2_outData_enqData$whas)
  begin
    case (wmi_p4B)
      2'd1:
	  IF_wmi_p4B_173_EQ_1_176_THEN_bram_serverAdapte_ETC___d2182 =
	      bram_serverAdapterB_1_outDataCore$EMPTY_N ||
	      bram_serverAdapterB_1_outData_enqData$whas;
      2'd2:
	  IF_wmi_p4B_173_EQ_1_176_THEN_bram_serverAdapte_ETC___d2182 =
	      bram_serverAdapterB_2_outDataCore$EMPTY_N ||
	      bram_serverAdapterB_2_outData_enqData$whas;
      default: IF_wmi_p4B_173_EQ_1_176_THEN_bram_serverAdapte_ETC___d2182 =
		   wmi_p4B != 2'd3 ||
		   bram_serverAdapterB_3_outDataCore$EMPTY_N ||
		   bram_serverAdapterB_3_outData_enqData$whas;
    endcase
  end
  always@(wmi_p4B or
	  bram_serverAdapterB_3_outData_outData$whas or
	  bram_serverAdapterB_1_outData_outData$whas or
	  bram_serverAdapterB_2_outData_outData$whas)
  begin
    case (wmi_p4B)
      2'd1:
	  CASE_wmi_p4B_NOT_wmi_p4B_EQ_3_OR_bram_serverAd_ETC__q20 =
	      bram_serverAdapterB_1_outData_outData$whas;
      2'd2:
	  CASE_wmi_p4B_NOT_wmi_p4B_EQ_3_OR_bram_serverAd_ETC__q20 =
	      bram_serverAdapterB_2_outData_outData$whas;
      default: CASE_wmi_p4B_NOT_wmi_p4B_EQ_3_OR_bram_serverAd_ETC__q20 =
		   wmi_p4B != 2'd3 ||
		   bram_serverAdapterB_3_outData_outData$whas;
    endcase
  end
  always@(edp_outBF_rCache)
  begin
    case (edp_outBF_rCache[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outBF_rCache_BITS_39_TO_38_3_0_edp_ou_ETC__q21 =
	      edp_outBF_rCache[39:38];
      2'd3: CASE_edp_outBF_rCache_BITS_39_TO_38_3_0_edp_ou_ETC__q21 = 2'd3;
    endcase
  end
  always@(edp_outBF_rCache)
  begin
    case (edp_outBF_rCache[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outBF_rCache_BITS_29_TO_28_3_0_edp_ou_ETC__q22 =
	      edp_outBF_rCache[29:28];
      2'd3: CASE_edp_outBF_rCache_BITS_29_TO_28_3_0_edp_ou_ETC__q22 = 2'd3;
    endcase
  end
  always@(edp_outBF_rCache)
  begin
    case (edp_outBF_rCache[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outBF_rCache_BITS_19_TO_18_3_0_edp_ou_ETC__q23 =
	      edp_outBF_rCache[19:18];
      2'd3: CASE_edp_outBF_rCache_BITS_19_TO_18_3_0_edp_ou_ETC__q23 = 2'd3;
    endcase
  end
  always@(edp_outBF_rCache)
  begin
    case (edp_outBF_rCache[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outBF_rCache_BITS_9_TO_8_3_0_edp_outB_ETC__q24 =
	      edp_outBF_rCache[9:8];
      2'd3: CASE_edp_outBF_rCache_BITS_9_TO_8_3_0_edp_outB_ETC__q24 = 2'd3;
    endcase
  end
  always@(edp_outBF_memory$DOB)
  begin
    case (edp_outBF_memory$DOB[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outBF_memoryDOB_BITS_39_TO_38_3_0_ed_ETC__q25 =
	      edp_outBF_memory$DOB[39:38];
      2'd3: CASE_edp_outBF_memoryDOB_BITS_39_TO_38_3_0_ed_ETC__q25 = 2'd3;
    endcase
  end
  always@(edp_outBF_memory$DOB)
  begin
    case (edp_outBF_memory$DOB[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outBF_memoryDOB_BITS_29_TO_28_3_0_ed_ETC__q26 =
	      edp_outBF_memory$DOB[29:28];
      2'd3: CASE_edp_outBF_memoryDOB_BITS_29_TO_28_3_0_ed_ETC__q26 = 2'd3;
    endcase
  end
  always@(edp_outBF_memory$DOB)
  begin
    case (edp_outBF_memory$DOB[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outBF_memoryDOB_BITS_19_TO_18_3_0_ed_ETC__q27 =
	      edp_outBF_memory$DOB[19:18];
      2'd3: CASE_edp_outBF_memoryDOB_BITS_19_TO_18_3_0_ed_ETC__q27 = 2'd3;
    endcase
  end
  always@(edp_outBF_memory$DOB)
  begin
    case (edp_outBF_memory$DOB[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outBF_memoryDOB_BITS_9_TO_8_3_0_edp__ETC__q28 =
	      edp_outBF_memory$DOB[9:8];
      2'd3: CASE_edp_outBF_memoryDOB_BITS_9_TO_8_3_0_edp__ETC__q28 = 2'd3;
    endcase
  end
  always@(edp_outBF_wDataIn$wget)
  begin
    case (edp_outBF_wDataIn$wget[39:38])
      2'd1, 2'd2:
	  CASE_edp_outBF_wDataInwget_BITS_39_TO_38_3_1__ETC__q29 =
	      edp_outBF_wDataIn$wget[39:38];
      default: CASE_edp_outBF_wDataInwget_BITS_39_TO_38_3_1__ETC__q29 = 2'd3;
    endcase
  end
  always@(edp_outBF_wDataIn$wget)
  begin
    case (edp_outBF_wDataIn$wget[29:28])
      2'd1, 2'd2:
	  CASE_edp_outBF_wDataInwget_BITS_29_TO_28_3_1__ETC__q30 =
	      edp_outBF_wDataIn$wget[29:28];
      default: CASE_edp_outBF_wDataInwget_BITS_29_TO_28_3_1__ETC__q30 = 2'd3;
    endcase
  end
  always@(edp_outBF_wDataIn$wget)
  begin
    case (edp_outBF_wDataIn$wget[19:18])
      2'd1, 2'd2:
	  CASE_edp_outBF_wDataInwget_BITS_19_TO_18_3_1__ETC__q31 =
	      edp_outBF_wDataIn$wget[19:18];
      default: CASE_edp_outBF_wDataInwget_BITS_19_TO_18_3_1__ETC__q31 = 2'd3;
    endcase
  end
  always@(edp_outBF_wDataIn$wget)
  begin
    case (edp_outBF_wDataIn$wget[9:8])
      2'd1, 2'd2:
	  CASE_edp_outBF_wDataInwget_BITS_9_TO_8_3_1_ed_ETC__q32 =
	      edp_outBF_wDataIn$wget[9:8];
      default: CASE_edp_outBF_wDataInwget_BITS_9_TO_8_3_1_ed_ETC__q32 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q33 =
	      server_request_put[39:38];
      2'd3: CASE_server_request_put_BITS_39_TO_38_3_0_serv_ETC__q33 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q34 =
	      server_request_put[29:28];
      2'd3: CASE_server_request_put_BITS_29_TO_28_3_0_serv_ETC__q34 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q35 =
	      server_request_put[19:18];
      2'd3: CASE_server_request_put_BITS_19_TO_18_3_0_serv_ETC__q35 = 2'd3;
    endcase
  end
  always@(server_request_put)
  begin
    case (server_request_put[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q36 =
	      server_request_put[9:8];
      2'd3: CASE_server_request_put_BITS_9_TO_8_3_0_server_ETC__q36 = 2'd3;
    endcase
  end
  always@(edp_inF$D_OUT)
  begin
    case (edp_inF$D_OUT[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_inFD_OUT_BITS_39_TO_38_3_0_edp_inFD_ETC__q37 =
	      edp_inF$D_OUT[39:38];
      2'd3: CASE_edp_inFD_OUT_BITS_39_TO_38_3_0_edp_inFD_ETC__q37 = 2'd3;
    endcase
  end
  always@(edp_inF$D_OUT)
  begin
    case (edp_inF$D_OUT[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_inFD_OUT_BITS_29_TO_28_3_0_edp_inFD_ETC__q38 =
	      edp_inF$D_OUT[29:28];
      2'd3: CASE_edp_inFD_OUT_BITS_29_TO_28_3_0_edp_inFD_ETC__q38 = 2'd3;
    endcase
  end
  always@(edp_inF$D_OUT)
  begin
    case (edp_inF$D_OUT[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_inFD_OUT_BITS_19_TO_18_3_0_edp_inFD_ETC__q39 =
	      edp_inF$D_OUT[19:18];
      2'd3: CASE_edp_inFD_OUT_BITS_19_TO_18_3_0_edp_inFD_ETC__q39 = 2'd3;
    endcase
  end
  always@(edp_inF$D_OUT)
  begin
    case (edp_inF$D_OUT[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_inFD_OUT_BITS_9_TO_8_3_0_edp_inFD_O_ETC__q40 =
	      edp_inF$D_OUT[9:8];
      2'd3: CASE_edp_inFD_OUT_BITS_9_TO_8_3_0_edp_inFD_O_ETC__q40 = 2'd3;
    endcase
  end
  always@(edp_outBF_wDataOut$wget)
  begin
    case (edp_outBF_wDataOut$wget[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outBF_wDataOutwget_BITS_39_TO_38_3_0_ETC__q41 =
	      edp_outBF_wDataOut$wget[39:38];
      2'd3: CASE_edp_outBF_wDataOutwget_BITS_39_TO_38_3_0_ETC__q41 = 2'd3;
    endcase
  end
  always@(edp_outBF_wDataOut$wget)
  begin
    case (edp_outBF_wDataOut$wget[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outBF_wDataOutwget_BITS_29_TO_28_3_0_ETC__q42 =
	      edp_outBF_wDataOut$wget[29:28];
      2'd3: CASE_edp_outBF_wDataOutwget_BITS_29_TO_28_3_0_ETC__q42 = 2'd3;
    endcase
  end
  always@(edp_outBF_wDataOut$wget)
  begin
    case (edp_outBF_wDataOut$wget[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outBF_wDataOutwget_BITS_19_TO_18_3_0_ETC__q43 =
	      edp_outBF_wDataOut$wget[19:18];
      2'd3: CASE_edp_outBF_wDataOutwget_BITS_19_TO_18_3_0_ETC__q43 = 2'd3;
    endcase
  end
  always@(edp_outBF_wDataOut$wget)
  begin
    case (edp_outBF_wDataOut$wget[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_edp_outBF_wDataOutwget_BITS_9_TO_8_3_0_e_ETC__q44 =
	      edp_outBF_wDataOut$wget[9:8];
      2'd3: CASE_edp_outBF_wDataOutwget_BITS_9_TO_8_3_0_e_ETC__q44 = 2'd3;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        bml_crdBuf_modulus <= `BSV_ASSIGNMENT_DELAY 16'd65535;
	bml_crdBuf_value <= `BSV_ASSIGNMENT_DELAY 16'd0;
	bml_datumAReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	bml_fabAvail <= `BSV_ASSIGNMENT_DELAY 1'd0;
	bml_fabBuf_modulus <= `BSV_ASSIGNMENT_DELAY 16'd65535;
	bml_fabBuf_value <= `BSV_ASSIGNMENT_DELAY 16'd0;
	bml_fabDone <= `BSV_ASSIGNMENT_DELAY 1'd0;
	bml_fabFlowBase <= `BSV_ASSIGNMENT_DELAY 32'hFFFF0018;
	bml_fabFlowBaseMS <= `BSV_ASSIGNMENT_DELAY 32'h0;
	bml_fabFlowSize <= `BSV_ASSIGNMENT_DELAY 32'h00000004;
	bml_fabMesgBase <= `BSV_ASSIGNMENT_DELAY 32'hFFFF0000;
	bml_fabMesgBaseMS <= `BSV_ASSIGNMENT_DELAY 32'h0;
	bml_fabMesgSize <= `BSV_ASSIGNMENT_DELAY 32'h00000800;
	bml_fabMetaBase <= `BSV_ASSIGNMENT_DELAY 32'hFFFF3800;
	bml_fabMetaBaseMS <= `BSV_ASSIGNMENT_DELAY 32'h0;
	bml_fabMetaSize <= `BSV_ASSIGNMENT_DELAY 32'h00000010;
	bml_fabNumBufs <= `BSV_ASSIGNMENT_DELAY 16'd1;
	bml_lclBufDone <= `BSV_ASSIGNMENT_DELAY 1'd0;
	bml_lclBufStart <= `BSV_ASSIGNMENT_DELAY 1'd0;
	bml_lclBuf_modulus <= `BSV_ASSIGNMENT_DELAY 16'd65535;
	bml_lclBuf_value <= `BSV_ASSIGNMENT_DELAY 16'd0;
	bml_lclDones <= `BSV_ASSIGNMENT_DELAY 16'd0;
	bml_lclNumBufs <= `BSV_ASSIGNMENT_DELAY 16'd1;
	bml_lclStarts <= `BSV_ASSIGNMENT_DELAY 16'd0;
	bml_mesgBase <= `BSV_ASSIGNMENT_DELAY 16'h0;
	bml_mesgSize <= `BSV_ASSIGNMENT_DELAY 16'h0800;
	bml_metaBase <= `BSV_ASSIGNMENT_DELAY 16'h3800;
	bml_metaSize <= `BSV_ASSIGNMENT_DELAY 16'h0010;
	bml_remBuf_modulus <= `BSV_ASSIGNMENT_DELAY 16'd65535;
	bml_remBuf_value <= `BSV_ASSIGNMENT_DELAY 16'd0;
	bml_remDone <= `BSV_ASSIGNMENT_DELAY 1'd0;
	bml_remDones <= `BSV_ASSIGNMENT_DELAY 16'd0;
	bml_remStart <= `BSV_ASSIGNMENT_DELAY 1'd0;
	bml_remStarts <= `BSV_ASSIGNMENT_DELAY 16'd0;
	bram_serverAdapterA_1_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_serverAdapterA_1_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	bram_serverAdapterA_2_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_serverAdapterA_2_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	bram_serverAdapterA_3_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_serverAdapterA_3_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	bram_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	bram_serverAdapterB_1_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_serverAdapterB_1_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	bram_serverAdapterB_2_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_serverAdapterB_2_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	bram_serverAdapterB_3_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_serverAdapterB_3_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	bram_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	dmaDoneTime <= `BSV_ASSIGNMENT_DELAY 64'd0;
	dmaStartTime <= `BSV_ASSIGNMENT_DELAY 64'd0;
	dpControl <= `BSV_ASSIGNMENT_DELAY 8'd0;
	edpDebug <= `BSV_ASSIGNMENT_DELAY 32'd0;
	edp_ackCount <= `BSV_ASSIGNMENT_DELAY 8'd0;
	edp_ackStart <= `BSV_ASSIGNMENT_DELAY 16'd0;
	edp_complTimerCount <= `BSV_ASSIGNMENT_DELAY 12'd0;
	edp_complTimerRunning <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_creditReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_dataAddr <= `BSV_ASSIGNMENT_DELAY 32'd0;
	edp_dataLen <= `BSV_ASSIGNMENT_DELAY 16'd0;
	edp_dbgBytesTxDeq <= `BSV_ASSIGNMENT_DELAY 32'd0;
	edp_dbgBytesTxEnq <= `BSV_ASSIGNMENT_DELAY 32'd0;
	edp_dmaDoTailEvent <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_dmaDoneMark <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_dmaStartMark <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_dmaTag <= `BSV_ASSIGNMENT_DELAY 5'd0;
	edp_doMesgMH <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_doMetaMH <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_doXmtMetaBody <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_doorBell <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_doorSeqDwell <= `BSV_ASSIGNMENT_DELAY 4'd0;
	edp_fabMeta <= `BSV_ASSIGNMENT_DELAY
	    129'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	edp_farBufReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_fhFsm_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_fhFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_fhFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY 1'd1;
	edp_fhFsm_state_fired <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_fhFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 3'd0;
	edp_firstMesgMH <= `BSV_ASSIGNMENT_DELAY 1'd1;
	edp_firstMetaMH <= `BSV_ASSIGNMENT_DELAY 1'd1;
	edp_flowDiagCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	edp_frameNumber <= `BSV_ASSIGNMENT_DELAY 16'h1234;
	edp_frmAckOK <= `BSV_ASSIGNMENT_DELAY 1'd1;
	edp_frmFlags <= `BSV_ASSIGNMENT_DELAY 8'h01;
	edp_frmMesgBusy <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_gotResponseHeader <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_igPtr <= `BSV_ASSIGNMENT_DELAY 4'd0;
	edp_lastMetaV <= `BSV_ASSIGNMENT_DELAY 32'd0;
	edp_lastMetaV_1 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	edp_lastMetaV_2 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	edp_lastMetaV_3 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	edp_lastRuleFired <= `BSV_ASSIGNMENT_DELAY 4'd15;
	edp_maxPayloadSize <= `BSV_ASSIGNMENT_DELAY 13'd128;
	edp_maxReadReqSize <= `BSV_ASSIGNMENT_DELAY 13'd4096;
	edp_mesgSeq <= `BSV_ASSIGNMENT_DELAY 16'd0;
	edp_mhFlags <= `BSV_ASSIGNMENT_DELAY 8'd0;
	edp_mhFsm_start_reg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_mhFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_mhFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY 1'd1;
	edp_mhFsm_state_fired <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_mhFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY 4'd0;
	edp_mhType <= `BSV_ASSIGNMENT_DELAY 8'd0;
	edp_nearBufReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_outBF_rCache <= `BSV_ASSIGNMENT_DELAY 53'h0AAAAAAAAAAAAA;
	edp_outBF_rRdPtr <= `BSV_ASSIGNMENT_DELAY 12'd0;
	edp_outBF_rWrPtr <= `BSV_ASSIGNMENT_DELAY 12'd0;
	edp_outFunl_ptr <= `BSV_ASSIGNMENT_DELAY 2'd0;
	edp_postSeqDwell <= `BSV_ASSIGNMENT_DELAY 4'd0;
	edp_pullTagMatch <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_rcvDoCompletion <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_rcvPtr <= `BSV_ASSIGNMENT_DELAY 4'd0;
	edp_remDone <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_remStart <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_reqMesgInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_reqMetaBodyInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_reqMetaInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_sentTail4DWHeader <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_tlpBRAM_debugBdata <= `BSV_ASSIGNMENT_DELAY 128'd0;
	edp_tlpBRAM_readHeaderSent <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_tlpBRAM_readStarted <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_tlpMetaSent <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_tlpRcvBusy <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_tlpXmtBusy <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_xactionNumber <= `BSV_ASSIGNMENT_DELAY 32'h12345678;
	edp_xmtMetaInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	edp_xmtMetaOK <= `BSV_ASSIGNMENT_DELAY 1'd0;
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
	wmi_bufDwell <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmi_bytesRemainResp <= `BSV_ASSIGNMENT_DELAY 14'd0;
	wmi_doneWithMesg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_lastMesg <= `BSV_ASSIGNMENT_DELAY 32'hFEFEFFFE;
	wmi_mesgBufReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_mesgBusy <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_mesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmi_mesgDone <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_mesgMeta <= `BSV_ASSIGNMENT_DELAY
	    129'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	wmi_mesgStart <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_metaBusy <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_p4B <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmi_rdActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_reqCount <= `BSV_ASSIGNMENT_DELAY 16'd0;
	wmi_thisMesg <= `BSV_ASSIGNMENT_DELAY 32'hFEFEFFFE;
	wmi_wmi_blockReq <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_wmi_dhF_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmi_wmi_dhF_levelsValid <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wmi_wmi_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_wmi_mFlagF_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmi_wmi_mFlagF_levelsValid <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wmi_wmi_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_wmi_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_wmi_reqF_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmi_wmi_reqF_levelsValid <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wmi_wmi_respF_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmi_wmi_respF_q_0 <= `BSV_ASSIGNMENT_DELAY 34'd0;
	wmi_wmi_respF_q_1 <= `BSV_ASSIGNMENT_DELAY 34'd0;
	wmi_wmi_sFlagReg <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmi_wmi_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_wrActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_wrFinalize <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmi_wrtCount <= `BSV_ASSIGNMENT_DELAY 16'd0;
	wti_nowReq <= `BSV_ASSIGNMENT_DELAY 67'd0;
	wti_operateD <= `BSV_ASSIGNMENT_DELAY 1'd1;
      end
    else
      begin
        if (bml_crdBuf_modulus$EN)
	  bml_crdBuf_modulus <= `BSV_ASSIGNMENT_DELAY bml_crdBuf_modulus$D_IN;
	if (bml_crdBuf_value$EN)
	  bml_crdBuf_value <= `BSV_ASSIGNMENT_DELAY bml_crdBuf_value$D_IN;
	if (bml_datumAReg$EN)
	  bml_datumAReg <= `BSV_ASSIGNMENT_DELAY bml_datumAReg$D_IN;
	if (bml_fabAvail$EN)
	  bml_fabAvail <= `BSV_ASSIGNMENT_DELAY bml_fabAvail$D_IN;
	if (bml_fabBuf_modulus$EN)
	  bml_fabBuf_modulus <= `BSV_ASSIGNMENT_DELAY bml_fabBuf_modulus$D_IN;
	if (bml_fabBuf_value$EN)
	  bml_fabBuf_value <= `BSV_ASSIGNMENT_DELAY bml_fabBuf_value$D_IN;
	if (bml_fabDone$EN)
	  bml_fabDone <= `BSV_ASSIGNMENT_DELAY bml_fabDone$D_IN;
	if (bml_fabFlowBase$EN)
	  bml_fabFlowBase <= `BSV_ASSIGNMENT_DELAY bml_fabFlowBase$D_IN;
	if (bml_fabFlowBaseMS$EN)
	  bml_fabFlowBaseMS <= `BSV_ASSIGNMENT_DELAY bml_fabFlowBaseMS$D_IN;
	if (bml_fabFlowSize$EN)
	  bml_fabFlowSize <= `BSV_ASSIGNMENT_DELAY bml_fabFlowSize$D_IN;
	if (bml_fabMesgBase$EN)
	  bml_fabMesgBase <= `BSV_ASSIGNMENT_DELAY bml_fabMesgBase$D_IN;
	if (bml_fabMesgBaseMS$EN)
	  bml_fabMesgBaseMS <= `BSV_ASSIGNMENT_DELAY bml_fabMesgBaseMS$D_IN;
	if (bml_fabMesgSize$EN)
	  bml_fabMesgSize <= `BSV_ASSIGNMENT_DELAY bml_fabMesgSize$D_IN;
	if (bml_fabMetaBase$EN)
	  bml_fabMetaBase <= `BSV_ASSIGNMENT_DELAY bml_fabMetaBase$D_IN;
	if (bml_fabMetaBaseMS$EN)
	  bml_fabMetaBaseMS <= `BSV_ASSIGNMENT_DELAY bml_fabMetaBaseMS$D_IN;
	if (bml_fabMetaSize$EN)
	  bml_fabMetaSize <= `BSV_ASSIGNMENT_DELAY bml_fabMetaSize$D_IN;
	if (bml_fabNumBufs$EN)
	  bml_fabNumBufs <= `BSV_ASSIGNMENT_DELAY bml_fabNumBufs$D_IN;
	if (bml_lclBufDone$EN)
	  bml_lclBufDone <= `BSV_ASSIGNMENT_DELAY bml_lclBufDone$D_IN;
	if (bml_lclBufStart$EN)
	  bml_lclBufStart <= `BSV_ASSIGNMENT_DELAY bml_lclBufStart$D_IN;
	if (bml_lclBuf_modulus$EN)
	  bml_lclBuf_modulus <= `BSV_ASSIGNMENT_DELAY bml_lclBuf_modulus$D_IN;
	if (bml_lclBuf_value$EN)
	  bml_lclBuf_value <= `BSV_ASSIGNMENT_DELAY bml_lclBuf_value$D_IN;
	if (bml_lclDones$EN)
	  bml_lclDones <= `BSV_ASSIGNMENT_DELAY bml_lclDones$D_IN;
	if (bml_lclNumBufs$EN)
	  bml_lclNumBufs <= `BSV_ASSIGNMENT_DELAY bml_lclNumBufs$D_IN;
	if (bml_lclStarts$EN)
	  bml_lclStarts <= `BSV_ASSIGNMENT_DELAY bml_lclStarts$D_IN;
	if (bml_mesgBase$EN)
	  bml_mesgBase <= `BSV_ASSIGNMENT_DELAY bml_mesgBase$D_IN;
	if (bml_mesgSize$EN)
	  bml_mesgSize <= `BSV_ASSIGNMENT_DELAY bml_mesgSize$D_IN;
	if (bml_metaBase$EN)
	  bml_metaBase <= `BSV_ASSIGNMENT_DELAY bml_metaBase$D_IN;
	if (bml_metaSize$EN)
	  bml_metaSize <= `BSV_ASSIGNMENT_DELAY bml_metaSize$D_IN;
	if (bml_remBuf_modulus$EN)
	  bml_remBuf_modulus <= `BSV_ASSIGNMENT_DELAY bml_remBuf_modulus$D_IN;
	if (bml_remBuf_value$EN)
	  bml_remBuf_value <= `BSV_ASSIGNMENT_DELAY bml_remBuf_value$D_IN;
	if (bml_remDone$EN)
	  bml_remDone <= `BSV_ASSIGNMENT_DELAY bml_remDone$D_IN;
	if (bml_remDones$EN)
	  bml_remDones <= `BSV_ASSIGNMENT_DELAY bml_remDones$D_IN;
	if (bml_remStart$EN)
	  bml_remStart <= `BSV_ASSIGNMENT_DELAY bml_remStart$D_IN;
	if (bml_remStarts$EN)
	  bml_remStarts <= `BSV_ASSIGNMENT_DELAY bml_remStarts$D_IN;
	if (bram_serverAdapterA_1_cnt$EN)
	  bram_serverAdapterA_1_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterA_1_cnt$D_IN;
	if (bram_serverAdapterA_1_s1$EN)
	  bram_serverAdapterA_1_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterA_1_s1$D_IN;
	if (bram_serverAdapterA_2_cnt$EN)
	  bram_serverAdapterA_2_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterA_2_cnt$D_IN;
	if (bram_serverAdapterA_2_s1$EN)
	  bram_serverAdapterA_2_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterA_2_s1$D_IN;
	if (bram_serverAdapterA_3_cnt$EN)
	  bram_serverAdapterA_3_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterA_3_cnt$D_IN;
	if (bram_serverAdapterA_3_s1$EN)
	  bram_serverAdapterA_3_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterA_3_s1$D_IN;
	if (bram_serverAdapterA_cnt$EN)
	  bram_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterA_cnt$D_IN;
	if (bram_serverAdapterA_s1$EN)
	  bram_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterA_s1$D_IN;
	if (bram_serverAdapterB_1_cnt$EN)
	  bram_serverAdapterB_1_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterB_1_cnt$D_IN;
	if (bram_serverAdapterB_1_s1$EN)
	  bram_serverAdapterB_1_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterB_1_s1$D_IN;
	if (bram_serverAdapterB_2_cnt$EN)
	  bram_serverAdapterB_2_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterB_2_cnt$D_IN;
	if (bram_serverAdapterB_2_s1$EN)
	  bram_serverAdapterB_2_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterB_2_s1$D_IN;
	if (bram_serverAdapterB_3_cnt$EN)
	  bram_serverAdapterB_3_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterB_3_cnt$D_IN;
	if (bram_serverAdapterB_3_s1$EN)
	  bram_serverAdapterB_3_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterB_3_s1$D_IN;
	if (bram_serverAdapterB_cnt$EN)
	  bram_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterB_cnt$D_IN;
	if (bram_serverAdapterB_s1$EN)
	  bram_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_serverAdapterB_s1$D_IN;
	if (dmaDoneTime$EN)
	  dmaDoneTime <= `BSV_ASSIGNMENT_DELAY dmaDoneTime$D_IN;
	if (dmaStartTime$EN)
	  dmaStartTime <= `BSV_ASSIGNMENT_DELAY dmaStartTime$D_IN;
	if (dpControl$EN) dpControl <= `BSV_ASSIGNMENT_DELAY dpControl$D_IN;
	if (edpDebug$EN) edpDebug <= `BSV_ASSIGNMENT_DELAY edpDebug$D_IN;
	if (edp_ackCount$EN)
	  edp_ackCount <= `BSV_ASSIGNMENT_DELAY edp_ackCount$D_IN;
	if (edp_ackStart$EN)
	  edp_ackStart <= `BSV_ASSIGNMENT_DELAY edp_ackStart$D_IN;
	if (edp_complTimerCount$EN)
	  edp_complTimerCount <= `BSV_ASSIGNMENT_DELAY
	      edp_complTimerCount$D_IN;
	if (edp_complTimerRunning$EN)
	  edp_complTimerRunning <= `BSV_ASSIGNMENT_DELAY
	      edp_complTimerRunning$D_IN;
	if (edp_creditReady$EN)
	  edp_creditReady <= `BSV_ASSIGNMENT_DELAY edp_creditReady$D_IN;
	if (edp_dataAddr$EN)
	  edp_dataAddr <= `BSV_ASSIGNMENT_DELAY edp_dataAddr$D_IN;
	if (edp_dataLen$EN)
	  edp_dataLen <= `BSV_ASSIGNMENT_DELAY edp_dataLen$D_IN;
	if (edp_dbgBytesTxDeq$EN)
	  edp_dbgBytesTxDeq <= `BSV_ASSIGNMENT_DELAY edp_dbgBytesTxDeq$D_IN;
	if (edp_dbgBytesTxEnq$EN)
	  edp_dbgBytesTxEnq <= `BSV_ASSIGNMENT_DELAY edp_dbgBytesTxEnq$D_IN;
	if (edp_dmaDoTailEvent$EN)
	  edp_dmaDoTailEvent <= `BSV_ASSIGNMENT_DELAY edp_dmaDoTailEvent$D_IN;
	if (edp_dmaDoneMark$EN)
	  edp_dmaDoneMark <= `BSV_ASSIGNMENT_DELAY edp_dmaDoneMark$D_IN;
	if (edp_dmaStartMark$EN)
	  edp_dmaStartMark <= `BSV_ASSIGNMENT_DELAY edp_dmaStartMark$D_IN;
	if (edp_dmaTag$EN)
	  edp_dmaTag <= `BSV_ASSIGNMENT_DELAY edp_dmaTag$D_IN;
	if (edp_doMesgMH$EN)
	  edp_doMesgMH <= `BSV_ASSIGNMENT_DELAY edp_doMesgMH$D_IN;
	if (edp_doMetaMH$EN)
	  edp_doMetaMH <= `BSV_ASSIGNMENT_DELAY edp_doMetaMH$D_IN;
	if (edp_doXmtMetaBody$EN)
	  edp_doXmtMetaBody <= `BSV_ASSIGNMENT_DELAY edp_doXmtMetaBody$D_IN;
	if (edp_doorBell$EN)
	  edp_doorBell <= `BSV_ASSIGNMENT_DELAY edp_doorBell$D_IN;
	if (edp_doorSeqDwell$EN)
	  edp_doorSeqDwell <= `BSV_ASSIGNMENT_DELAY edp_doorSeqDwell$D_IN;
	if (edp_fabMeta$EN)
	  edp_fabMeta <= `BSV_ASSIGNMENT_DELAY edp_fabMeta$D_IN;
	if (edp_farBufReady$EN)
	  edp_farBufReady <= `BSV_ASSIGNMENT_DELAY edp_farBufReady$D_IN;
	if (edp_fhFsm_start_reg$EN)
	  edp_fhFsm_start_reg <= `BSV_ASSIGNMENT_DELAY
	      edp_fhFsm_start_reg$D_IN;
	if (edp_fhFsm_start_reg_1$EN)
	  edp_fhFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY
	      edp_fhFsm_start_reg_1$D_IN;
	if (edp_fhFsm_state_can_overlap$EN)
	  edp_fhFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY
	      edp_fhFsm_state_can_overlap$D_IN;
	if (edp_fhFsm_state_fired$EN)
	  edp_fhFsm_state_fired <= `BSV_ASSIGNMENT_DELAY
	      edp_fhFsm_state_fired$D_IN;
	if (edp_fhFsm_state_mkFSMstate$EN)
	  edp_fhFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY
	      edp_fhFsm_state_mkFSMstate$D_IN;
	if (edp_firstMesgMH$EN)
	  edp_firstMesgMH <= `BSV_ASSIGNMENT_DELAY edp_firstMesgMH$D_IN;
	if (edp_firstMetaMH$EN)
	  edp_firstMetaMH <= `BSV_ASSIGNMENT_DELAY edp_firstMetaMH$D_IN;
	if (edp_flowDiagCount$EN)
	  edp_flowDiagCount <= `BSV_ASSIGNMENT_DELAY edp_flowDiagCount$D_IN;
	if (edp_frameNumber$EN)
	  edp_frameNumber <= `BSV_ASSIGNMENT_DELAY edp_frameNumber$D_IN;
	if (edp_frmAckOK$EN)
	  edp_frmAckOK <= `BSV_ASSIGNMENT_DELAY edp_frmAckOK$D_IN;
	if (edp_frmFlags$EN)
	  edp_frmFlags <= `BSV_ASSIGNMENT_DELAY edp_frmFlags$D_IN;
	if (edp_frmMesgBusy$EN)
	  edp_frmMesgBusy <= `BSV_ASSIGNMENT_DELAY edp_frmMesgBusy$D_IN;
	if (edp_gotResponseHeader$EN)
	  edp_gotResponseHeader <= `BSV_ASSIGNMENT_DELAY
	      edp_gotResponseHeader$D_IN;
	if (edp_igPtr$EN) edp_igPtr <= `BSV_ASSIGNMENT_DELAY edp_igPtr$D_IN;
	if (edp_lastMetaV$EN)
	  edp_lastMetaV <= `BSV_ASSIGNMENT_DELAY edp_lastMetaV$D_IN;
	if (edp_lastMetaV_1$EN)
	  edp_lastMetaV_1 <= `BSV_ASSIGNMENT_DELAY edp_lastMetaV_1$D_IN;
	if (edp_lastMetaV_2$EN)
	  edp_lastMetaV_2 <= `BSV_ASSIGNMENT_DELAY edp_lastMetaV_2$D_IN;
	if (edp_lastMetaV_3$EN)
	  edp_lastMetaV_3 <= `BSV_ASSIGNMENT_DELAY edp_lastMetaV_3$D_IN;
	if (edp_lastRuleFired$EN)
	  edp_lastRuleFired <= `BSV_ASSIGNMENT_DELAY edp_lastRuleFired$D_IN;
	if (edp_maxPayloadSize$EN)
	  edp_maxPayloadSize <= `BSV_ASSIGNMENT_DELAY edp_maxPayloadSize$D_IN;
	if (edp_maxReadReqSize$EN)
	  edp_maxReadReqSize <= `BSV_ASSIGNMENT_DELAY edp_maxReadReqSize$D_IN;
	if (edp_mesgSeq$EN)
	  edp_mesgSeq <= `BSV_ASSIGNMENT_DELAY edp_mesgSeq$D_IN;
	if (edp_mhFlags$EN)
	  edp_mhFlags <= `BSV_ASSIGNMENT_DELAY edp_mhFlags$D_IN;
	if (edp_mhFsm_start_reg$EN)
	  edp_mhFsm_start_reg <= `BSV_ASSIGNMENT_DELAY
	      edp_mhFsm_start_reg$D_IN;
	if (edp_mhFsm_start_reg_1$EN)
	  edp_mhFsm_start_reg_1 <= `BSV_ASSIGNMENT_DELAY
	      edp_mhFsm_start_reg_1$D_IN;
	if (edp_mhFsm_state_can_overlap$EN)
	  edp_mhFsm_state_can_overlap <= `BSV_ASSIGNMENT_DELAY
	      edp_mhFsm_state_can_overlap$D_IN;
	if (edp_mhFsm_state_fired$EN)
	  edp_mhFsm_state_fired <= `BSV_ASSIGNMENT_DELAY
	      edp_mhFsm_state_fired$D_IN;
	if (edp_mhFsm_state_mkFSMstate$EN)
	  edp_mhFsm_state_mkFSMstate <= `BSV_ASSIGNMENT_DELAY
	      edp_mhFsm_state_mkFSMstate$D_IN;
	if (edp_mhType$EN)
	  edp_mhType <= `BSV_ASSIGNMENT_DELAY edp_mhType$D_IN;
	if (edp_nearBufReady$EN)
	  edp_nearBufReady <= `BSV_ASSIGNMENT_DELAY edp_nearBufReady$D_IN;
	if (edp_outBF_rCache$EN)
	  edp_outBF_rCache <= `BSV_ASSIGNMENT_DELAY edp_outBF_rCache$D_IN;
	if (edp_outBF_rRdPtr$EN)
	  edp_outBF_rRdPtr <= `BSV_ASSIGNMENT_DELAY edp_outBF_rRdPtr$D_IN;
	if (edp_outBF_rWrPtr$EN)
	  edp_outBF_rWrPtr <= `BSV_ASSIGNMENT_DELAY edp_outBF_rWrPtr$D_IN;
	if (edp_outFunl_ptr$EN)
	  edp_outFunl_ptr <= `BSV_ASSIGNMENT_DELAY edp_outFunl_ptr$D_IN;
	if (edp_postSeqDwell$EN)
	  edp_postSeqDwell <= `BSV_ASSIGNMENT_DELAY edp_postSeqDwell$D_IN;
	if (edp_pullTagMatch$EN)
	  edp_pullTagMatch <= `BSV_ASSIGNMENT_DELAY edp_pullTagMatch$D_IN;
	if (edp_rcvDoCompletion$EN)
	  edp_rcvDoCompletion <= `BSV_ASSIGNMENT_DELAY
	      edp_rcvDoCompletion$D_IN;
	if (edp_rcvPtr$EN)
	  edp_rcvPtr <= `BSV_ASSIGNMENT_DELAY edp_rcvPtr$D_IN;
	if (edp_remDone$EN)
	  edp_remDone <= `BSV_ASSIGNMENT_DELAY edp_remDone$D_IN;
	if (edp_remStart$EN)
	  edp_remStart <= `BSV_ASSIGNMENT_DELAY edp_remStart$D_IN;
	if (edp_reqMesgInFlight$EN)
	  edp_reqMesgInFlight <= `BSV_ASSIGNMENT_DELAY
	      edp_reqMesgInFlight$D_IN;
	if (edp_reqMetaBodyInFlight$EN)
	  edp_reqMetaBodyInFlight <= `BSV_ASSIGNMENT_DELAY
	      edp_reqMetaBodyInFlight$D_IN;
	if (edp_reqMetaInFlight$EN)
	  edp_reqMetaInFlight <= `BSV_ASSIGNMENT_DELAY
	      edp_reqMetaInFlight$D_IN;
	if (edp_sentTail4DWHeader$EN)
	  edp_sentTail4DWHeader <= `BSV_ASSIGNMENT_DELAY
	      edp_sentTail4DWHeader$D_IN;
	if (edp_tlpBRAM_debugBdata$EN)
	  edp_tlpBRAM_debugBdata <= `BSV_ASSIGNMENT_DELAY
	      edp_tlpBRAM_debugBdata$D_IN;
	if (edp_tlpBRAM_readHeaderSent$EN)
	  edp_tlpBRAM_readHeaderSent <= `BSV_ASSIGNMENT_DELAY
	      edp_tlpBRAM_readHeaderSent$D_IN;
	if (edp_tlpBRAM_readStarted$EN)
	  edp_tlpBRAM_readStarted <= `BSV_ASSIGNMENT_DELAY
	      edp_tlpBRAM_readStarted$D_IN;
	if (edp_tlpMetaSent$EN)
	  edp_tlpMetaSent <= `BSV_ASSIGNMENT_DELAY edp_tlpMetaSent$D_IN;
	if (edp_tlpRcvBusy$EN)
	  edp_tlpRcvBusy <= `BSV_ASSIGNMENT_DELAY edp_tlpRcvBusy$D_IN;
	if (edp_tlpXmtBusy$EN)
	  edp_tlpXmtBusy <= `BSV_ASSIGNMENT_DELAY edp_tlpXmtBusy$D_IN;
	if (edp_xactionNumber$EN)
	  edp_xactionNumber <= `BSV_ASSIGNMENT_DELAY edp_xactionNumber$D_IN;
	if (edp_xmtMetaInFlight$EN)
	  edp_xmtMetaInFlight <= `BSV_ASSIGNMENT_DELAY
	      edp_xmtMetaInFlight$D_IN;
	if (edp_xmtMetaOK$EN)
	  edp_xmtMetaOK <= `BSV_ASSIGNMENT_DELAY edp_xmtMetaOK$D_IN;
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
	if (wmi_bufDwell$EN)
	  wmi_bufDwell <= `BSV_ASSIGNMENT_DELAY wmi_bufDwell$D_IN;
	if (wmi_bytesRemainResp$EN)
	  wmi_bytesRemainResp <= `BSV_ASSIGNMENT_DELAY
	      wmi_bytesRemainResp$D_IN;
	if (wmi_doneWithMesg$EN)
	  wmi_doneWithMesg <= `BSV_ASSIGNMENT_DELAY wmi_doneWithMesg$D_IN;
	if (wmi_lastMesg$EN)
	  wmi_lastMesg <= `BSV_ASSIGNMENT_DELAY wmi_lastMesg$D_IN;
	if (wmi_mesgBufReady$EN)
	  wmi_mesgBufReady <= `BSV_ASSIGNMENT_DELAY wmi_mesgBufReady$D_IN;
	if (wmi_mesgBusy$EN)
	  wmi_mesgBusy <= `BSV_ASSIGNMENT_DELAY wmi_mesgBusy$D_IN;
	if (wmi_mesgCount$EN)
	  wmi_mesgCount <= `BSV_ASSIGNMENT_DELAY wmi_mesgCount$D_IN;
	if (wmi_mesgDone$EN)
	  wmi_mesgDone <= `BSV_ASSIGNMENT_DELAY wmi_mesgDone$D_IN;
	if (wmi_mesgMeta$EN)
	  wmi_mesgMeta <= `BSV_ASSIGNMENT_DELAY wmi_mesgMeta$D_IN;
	if (wmi_mesgStart$EN)
	  wmi_mesgStart <= `BSV_ASSIGNMENT_DELAY wmi_mesgStart$D_IN;
	if (wmi_metaBusy$EN)
	  wmi_metaBusy <= `BSV_ASSIGNMENT_DELAY wmi_metaBusy$D_IN;
	if (wmi_p4B$EN) wmi_p4B <= `BSV_ASSIGNMENT_DELAY wmi_p4B$D_IN;
	if (wmi_rdActive$EN)
	  wmi_rdActive <= `BSV_ASSIGNMENT_DELAY wmi_rdActive$D_IN;
	if (wmi_reqCount$EN)
	  wmi_reqCount <= `BSV_ASSIGNMENT_DELAY wmi_reqCount$D_IN;
	if (wmi_thisMesg$EN)
	  wmi_thisMesg <= `BSV_ASSIGNMENT_DELAY wmi_thisMesg$D_IN;
	if (wmi_wmi_blockReq$EN)
	  wmi_wmi_blockReq <= `BSV_ASSIGNMENT_DELAY wmi_wmi_blockReq$D_IN;
	if (wmi_wmi_dhF_countReg$EN)
	  wmi_wmi_dhF_countReg <= `BSV_ASSIGNMENT_DELAY
	      wmi_wmi_dhF_countReg$D_IN;
	if (wmi_wmi_dhF_levelsValid$EN)
	  wmi_wmi_dhF_levelsValid <= `BSV_ASSIGNMENT_DELAY
	      wmi_wmi_dhF_levelsValid$D_IN;
	if (wmi_wmi_errorSticky$EN)
	  wmi_wmi_errorSticky <= `BSV_ASSIGNMENT_DELAY
	      wmi_wmi_errorSticky$D_IN;
	if (wmi_wmi_mFlagF_countReg$EN)
	  wmi_wmi_mFlagF_countReg <= `BSV_ASSIGNMENT_DELAY
	      wmi_wmi_mFlagF_countReg$D_IN;
	if (wmi_wmi_mFlagF_levelsValid$EN)
	  wmi_wmi_mFlagF_levelsValid <= `BSV_ASSIGNMENT_DELAY
	      wmi_wmi_mFlagF_levelsValid$D_IN;
	if (wmi_wmi_operateD$EN)
	  wmi_wmi_operateD <= `BSV_ASSIGNMENT_DELAY wmi_wmi_operateD$D_IN;
	if (wmi_wmi_peerIsReady$EN)
	  wmi_wmi_peerIsReady <= `BSV_ASSIGNMENT_DELAY
	      wmi_wmi_peerIsReady$D_IN;
	if (wmi_wmi_reqF_countReg$EN)
	  wmi_wmi_reqF_countReg <= `BSV_ASSIGNMENT_DELAY
	      wmi_wmi_reqF_countReg$D_IN;
	if (wmi_wmi_reqF_levelsValid$EN)
	  wmi_wmi_reqF_levelsValid <= `BSV_ASSIGNMENT_DELAY
	      wmi_wmi_reqF_levelsValid$D_IN;
	if (wmi_wmi_respF_c_r$EN)
	  wmi_wmi_respF_c_r <= `BSV_ASSIGNMENT_DELAY wmi_wmi_respF_c_r$D_IN;
	if (wmi_wmi_respF_q_0$EN)
	  wmi_wmi_respF_q_0 <= `BSV_ASSIGNMENT_DELAY wmi_wmi_respF_q_0$D_IN;
	if (wmi_wmi_respF_q_1$EN)
	  wmi_wmi_respF_q_1 <= `BSV_ASSIGNMENT_DELAY wmi_wmi_respF_q_1$D_IN;
	if (wmi_wmi_sFlagReg$EN)
	  wmi_wmi_sFlagReg <= `BSV_ASSIGNMENT_DELAY wmi_wmi_sFlagReg$D_IN;
	if (wmi_wmi_trafficSticky$EN)
	  wmi_wmi_trafficSticky <= `BSV_ASSIGNMENT_DELAY
	      wmi_wmi_trafficSticky$D_IN;
	if (wmi_wrActive$EN)
	  wmi_wrActive <= `BSV_ASSIGNMENT_DELAY wmi_wrActive$D_IN;
	if (wmi_wrFinalize$EN)
	  wmi_wrFinalize <= `BSV_ASSIGNMENT_DELAY wmi_wrFinalize$D_IN;
	if (wmi_wrtCount$EN)
	  wmi_wrtCount <= `BSV_ASSIGNMENT_DELAY wmi_wrtCount$D_IN;
	if (wti_nowReq$EN)
	  wti_nowReq <= `BSV_ASSIGNMENT_DELAY wti_nowReq$D_IN;
	if (wti_operateD$EN)
	  wti_operateD <= `BSV_ASSIGNMENT_DELAY wti_operateD$D_IN;
      end
    if (bml_fabBufsAvail$EN)
      bml_fabBufsAvail <= `BSV_ASSIGNMENT_DELAY bml_fabBufsAvail$D_IN;
    if (bml_fabFlowAddr$EN)
      bml_fabFlowAddr <= `BSV_ASSIGNMENT_DELAY bml_fabFlowAddr$D_IN;
    if (bml_fabMesgAddr$EN)
      bml_fabMesgAddr <= `BSV_ASSIGNMENT_DELAY bml_fabMesgAddr$D_IN;
    if (bml_fabMetaAddr$EN)
      bml_fabMetaAddr <= `BSV_ASSIGNMENT_DELAY bml_fabMetaAddr$D_IN;
    if (bml_lclBufsAR$EN)
      bml_lclBufsAR <= `BSV_ASSIGNMENT_DELAY bml_lclBufsAR$D_IN;
    if (bml_lclBufsCF$EN)
      bml_lclBufsCF <= `BSV_ASSIGNMENT_DELAY bml_lclBufsCF$D_IN;
    if (bml_lclCredit$EN)
      bml_lclCredit <= `BSV_ASSIGNMENT_DELAY bml_lclCredit$D_IN;
    if (bml_lclMesgAddr$EN)
      bml_lclMesgAddr <= `BSV_ASSIGNMENT_DELAY bml_lclMesgAddr$D_IN;
    if (bml_lclMetaAddr$EN)
      bml_lclMetaAddr <= `BSV_ASSIGNMENT_DELAY bml_lclMetaAddr$D_IN;
    if (bml_remMesgAddr$EN)
      bml_remMesgAddr <= `BSV_ASSIGNMENT_DELAY bml_remMesgAddr$D_IN;
    if (bml_remMetaAddr$EN)
      bml_remMetaAddr <= `BSV_ASSIGNMENT_DELAY bml_remMetaAddr$D_IN;
    if (edp_dmaPullRemainDWLen$EN)
      edp_dmaPullRemainDWLen <= `BSV_ASSIGNMENT_DELAY
	  edp_dmaPullRemainDWLen$D_IN;
    if (edp_dmaPullRemainDWSub$EN)
      edp_dmaPullRemainDWSub <= `BSV_ASSIGNMENT_DELAY
	  edp_dmaPullRemainDWSub$D_IN;
    if (edp_dmaReqTag$EN)
      edp_dmaReqTag <= `BSV_ASSIGNMENT_DELAY edp_dmaReqTag$D_IN;
    if (edp_fabFlowAddr$EN)
      edp_fabFlowAddr <= `BSV_ASSIGNMENT_DELAY edp_fabFlowAddr$D_IN;
    if (edp_fabFlowAddrMS$EN)
      edp_fabFlowAddrMS <= `BSV_ASSIGNMENT_DELAY edp_fabFlowAddrMS$D_IN;
    if (edp_fabMesgAccu$EN)
      edp_fabMesgAccu <= `BSV_ASSIGNMENT_DELAY edp_fabMesgAccu$D_IN;
    if (edp_fabMesgAddr$EN)
      edp_fabMesgAddr <= `BSV_ASSIGNMENT_DELAY edp_fabMesgAddr$D_IN;
    if (edp_fabMesgAddrMS$EN)
      edp_fabMesgAddrMS <= `BSV_ASSIGNMENT_DELAY edp_fabMesgAddrMS$D_IN;
    if (edp_fabMetaAddr$EN)
      edp_fabMetaAddr <= `BSV_ASSIGNMENT_DELAY edp_fabMetaAddr$D_IN;
    if (edp_fabMetaAddrMS$EN)
      edp_fabMetaAddrMS <= `BSV_ASSIGNMENT_DELAY edp_fabMetaAddrMS$D_IN;
    if (edp_igAC$EN) edp_igAC <= `BSV_ASSIGNMENT_DELAY edp_igAC$D_IN;
    if (edp_igAS$EN) edp_igAS <= `BSV_ASSIGNMENT_DELAY edp_igAS$D_IN;
    if (edp_igDID$EN) edp_igDID <= `BSV_ASSIGNMENT_DELAY edp_igDID$D_IN;
    if (edp_igF$EN) edp_igF <= `BSV_ASSIGNMENT_DELAY edp_igF$D_IN;
    if (edp_igFS$EN) edp_igFS <= `BSV_ASSIGNMENT_DELAY edp_igFS$D_IN;
    if (edp_igSID$EN) edp_igSID <= `BSV_ASSIGNMENT_DELAY edp_igSID$D_IN;
    if (edp_inIgnorePkt$EN)
      edp_inIgnorePkt <= `BSV_ASSIGNMENT_DELAY edp_inIgnorePkt$D_IN;
    if (edp_mesgComplReceived$EN)
      edp_mesgComplReceived <= `BSV_ASSIGNMENT_DELAY
	  edp_mesgComplReceived$D_IN;
    if (edp_mesgLengthRemainPull$EN)
      edp_mesgLengthRemainPull <= `BSV_ASSIGNMENT_DELAY
	  edp_mesgLengthRemainPull$D_IN;
    if (edp_mesgLengthRemainPush$EN)
      edp_mesgLengthRemainPush <= `BSV_ASSIGNMENT_DELAY
	  edp_mesgLengthRemainPush$D_IN;
    if (edp_outDwRemain$EN)
      edp_outDwRemain <= `BSV_ASSIGNMENT_DELAY edp_outDwRemain$D_IN;
    if (edp_rcvDA$EN) edp_rcvDA <= `BSV_ASSIGNMENT_DELAY edp_rcvDA$D_IN;
    if (edp_rcvDL$EN) edp_rcvDL <= `BSV_ASSIGNMENT_DELAY edp_rcvDL$D_IN;
    if (edp_rcvFA$EN) edp_rcvFA <= `BSV_ASSIGNMENT_DELAY edp_rcvFA$D_IN;
    if (edp_rcvFV$EN) edp_rcvFV <= `BSV_ASSIGNMENT_DELAY edp_rcvFV$D_IN;
    if (edp_rcvLiveDA$EN)
      edp_rcvLiveDA <= `BSV_ASSIGNMENT_DELAY edp_rcvLiveDA$D_IN;
    if (edp_rcvLiveDL$EN)
      edp_rcvLiveDL <= `BSV_ASSIGNMENT_DELAY edp_rcvLiveDL$D_IN;
    if (edp_rcvMS$EN) edp_rcvMS <= `BSV_ASSIGNMENT_DELAY edp_rcvMS$D_IN;
    if (edp_rcvMT$EN) edp_rcvMT <= `BSV_ASSIGNMENT_DELAY edp_rcvMT$D_IN;
    if (edp_rcvNM$EN) edp_rcvNM <= `BSV_ASSIGNMENT_DELAY edp_rcvNM$D_IN;
    if (edp_rcvTID$EN) edp_rcvTID <= `BSV_ASSIGNMENT_DELAY edp_rcvTID$D_IN;
    if (edp_rcvTM$EN) edp_rcvTM <= `BSV_ASSIGNMENT_DELAY edp_rcvTM$D_IN;
    if (edp_remMesgAccu$EN)
      edp_remMesgAccu <= `BSV_ASSIGNMENT_DELAY edp_remMesgAccu$D_IN;
    if (edp_remMesgAddr$EN)
      edp_remMesgAddr <= `BSV_ASSIGNMENT_DELAY edp_remMesgAddr$D_IN;
    if (edp_remMetaAddr$EN)
      edp_remMetaAddr <= `BSV_ASSIGNMENT_DELAY edp_remMetaAddr$D_IN;
    if (edp_srcMesgAccu$EN)
      edp_srcMesgAccu <= `BSV_ASSIGNMENT_DELAY edp_srcMesgAccu$D_IN;
    if (edp_tlpBRAM_rdRespDwRemain$EN)
      edp_tlpBRAM_rdRespDwRemain <= `BSV_ASSIGNMENT_DELAY
	  edp_tlpBRAM_rdRespDwRemain$D_IN;
    if (edp_tlpBRAM_readNxtDWAddr$EN)
      edp_tlpBRAM_readNxtDWAddr <= `BSV_ASSIGNMENT_DELAY
	  edp_tlpBRAM_readNxtDWAddr$D_IN;
    if (edp_tlpBRAM_readRemainDWLen$EN)
      edp_tlpBRAM_readRemainDWLen <= `BSV_ASSIGNMENT_DELAY
	  edp_tlpBRAM_readRemainDWLen$D_IN;
    if (edp_tlpBRAM_writeDWAddr$EN)
      edp_tlpBRAM_writeDWAddr <= `BSV_ASSIGNMENT_DELAY
	  edp_tlpBRAM_writeDWAddr$D_IN;
    if (edp_tlpBRAM_writeLastBE$EN)
      edp_tlpBRAM_writeLastBE <= `BSV_ASSIGNMENT_DELAY
	  edp_tlpBRAM_writeLastBE$D_IN;
    if (edp_tlpBRAM_writeRemainDWLen$EN)
      edp_tlpBRAM_writeRemainDWLen <= `BSV_ASSIGNMENT_DELAY
	  edp_tlpBRAM_writeRemainDWLen$D_IN;
    if (wmi_addr$EN) wmi_addr <= `BSV_ASSIGNMENT_DELAY wmi_addr$D_IN;
    if (wmi_bytesRemainReq$EN)
      wmi_bytesRemainReq <= `BSV_ASSIGNMENT_DELAY wmi_bytesRemainReq$D_IN;
    if (wmi_lclMesgAddr$EN)
      wmi_lclMesgAddr <= `BSV_ASSIGNMENT_DELAY wmi_lclMesgAddr$D_IN;
    if (wmi_lclMetaAddr$EN)
      wmi_lclMetaAddr <= `BSV_ASSIGNMENT_DELAY wmi_lclMetaAddr$D_IN;
    if (wmi_wmi_statusR$EN)
      wmi_wmi_statusR <= `BSV_ASSIGNMENT_DELAY wmi_wmi_statusR$D_IN;
  end
  always@(posedge CLK or `BSV_RESET_EDGE RST_N)
  if (RST_N == `BSV_RESET_VALUE)
    begin
      wci_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wmi_wmi_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wti_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (wci_isReset_isInReset$EN)
	wci_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wci_isReset_isInReset$D_IN;
      if (wmi_wmi_isReset_isInReset$EN)
	wmi_wmi_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wmi_wmi_isReset_isInReset$D_IN;
      if (wti_isReset_isInReset$EN)
	wti_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wti_isReset_isInReset$D_IN;
    end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    bml_crdBuf_modulus = 16'hAAAA;
    bml_crdBuf_value = 16'hAAAA;
    bml_datumAReg = 1'h0;
    bml_fabAvail = 1'h0;
    bml_fabBuf_modulus = 16'hAAAA;
    bml_fabBuf_value = 16'hAAAA;
    bml_fabBufsAvail = 16'hAAAA;
    bml_fabDone = 1'h0;
    bml_fabFlowAddr = 32'hAAAAAAAA;
    bml_fabFlowBase = 32'hAAAAAAAA;
    bml_fabFlowBaseMS = 32'hAAAAAAAA;
    bml_fabFlowSize = 32'hAAAAAAAA;
    bml_fabMesgAddr = 32'hAAAAAAAA;
    bml_fabMesgBase = 32'hAAAAAAAA;
    bml_fabMesgBaseMS = 32'hAAAAAAAA;
    bml_fabMesgSize = 32'hAAAAAAAA;
    bml_fabMetaAddr = 32'hAAAAAAAA;
    bml_fabMetaBase = 32'hAAAAAAAA;
    bml_fabMetaBaseMS = 32'hAAAAAAAA;
    bml_fabMetaSize = 32'hAAAAAAAA;
    bml_fabNumBufs = 16'hAAAA;
    bml_lclBufDone = 1'h0;
    bml_lclBufStart = 1'h0;
    bml_lclBuf_modulus = 16'hAAAA;
    bml_lclBuf_value = 16'hAAAA;
    bml_lclBufsAR = 16'hAAAA;
    bml_lclBufsCF = 16'hAAAA;
    bml_lclCredit = 16'hAAAA;
    bml_lclDones = 16'hAAAA;
    bml_lclMesgAddr = 16'hAAAA;
    bml_lclMetaAddr = 16'hAAAA;
    bml_lclNumBufs = 16'hAAAA;
    bml_lclStarts = 16'hAAAA;
    bml_mesgBase = 16'hAAAA;
    bml_mesgSize = 16'hAAAA;
    bml_metaBase = 16'hAAAA;
    bml_metaSize = 16'hAAAA;
    bml_remBuf_modulus = 16'hAAAA;
    bml_remBuf_value = 16'hAAAA;
    bml_remDone = 1'h0;
    bml_remDones = 16'hAAAA;
    bml_remMesgAddr = 16'hAAAA;
    bml_remMetaAddr = 16'hAAAA;
    bml_remStart = 1'h0;
    bml_remStarts = 16'hAAAA;
    bram_serverAdapterA_1_cnt = 3'h2;
    bram_serverAdapterA_1_s1 = 2'h2;
    bram_serverAdapterA_2_cnt = 3'h2;
    bram_serverAdapterA_2_s1 = 2'h2;
    bram_serverAdapterA_3_cnt = 3'h2;
    bram_serverAdapterA_3_s1 = 2'h2;
    bram_serverAdapterA_cnt = 3'h2;
    bram_serverAdapterA_s1 = 2'h2;
    bram_serverAdapterB_1_cnt = 3'h2;
    bram_serverAdapterB_1_s1 = 2'h2;
    bram_serverAdapterB_2_cnt = 3'h2;
    bram_serverAdapterB_2_s1 = 2'h2;
    bram_serverAdapterB_3_cnt = 3'h2;
    bram_serverAdapterB_3_s1 = 2'h2;
    bram_serverAdapterB_cnt = 3'h2;
    bram_serverAdapterB_s1 = 2'h2;
    dmaDoneTime = 64'hAAAAAAAAAAAAAAAA;
    dmaStartTime = 64'hAAAAAAAAAAAAAAAA;
    dpControl = 8'hAA;
    edpDebug = 32'hAAAAAAAA;
    edp_ackCount = 8'hAA;
    edp_ackStart = 16'hAAAA;
    edp_complTimerCount = 12'hAAA;
    edp_complTimerRunning = 1'h0;
    edp_creditReady = 1'h0;
    edp_dataAddr = 32'hAAAAAAAA;
    edp_dataLen = 16'hAAAA;
    edp_dbgBytesTxDeq = 32'hAAAAAAAA;
    edp_dbgBytesTxEnq = 32'hAAAAAAAA;
    edp_dmaDoTailEvent = 1'h0;
    edp_dmaDoneMark = 1'h0;
    edp_dmaPullRemainDWLen = 10'h2AA;
    edp_dmaPullRemainDWSub = 10'h2AA;
    edp_dmaReqTag = 5'h0A;
    edp_dmaStartMark = 1'h0;
    edp_dmaTag = 5'h0A;
    edp_doMesgMH = 1'h0;
    edp_doMetaMH = 1'h0;
    edp_doXmtMetaBody = 1'h0;
    edp_doorBell = 1'h0;
    edp_doorSeqDwell = 4'hA;
    edp_fabFlowAddr = 32'hAAAAAAAA;
    edp_fabFlowAddrMS = 32'hAAAAAAAA;
    edp_fabMesgAccu = 32'hAAAAAAAA;
    edp_fabMesgAddr = 32'hAAAAAAAA;
    edp_fabMesgAddrMS = 32'hAAAAAAAA;
    edp_fabMeta = 129'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    edp_fabMetaAddr = 32'hAAAAAAAA;
    edp_fabMetaAddrMS = 32'hAAAAAAAA;
    edp_farBufReady = 1'h0;
    edp_fhFsm_start_reg = 1'h0;
    edp_fhFsm_start_reg_1 = 1'h0;
    edp_fhFsm_state_can_overlap = 1'h0;
    edp_fhFsm_state_fired = 1'h0;
    edp_fhFsm_state_mkFSMstate = 3'h2;
    edp_firstMesgMH = 1'h0;
    edp_firstMetaMH = 1'h0;
    edp_flowDiagCount = 32'hAAAAAAAA;
    edp_frameNumber = 16'hAAAA;
    edp_frmAckOK = 1'h0;
    edp_frmFlags = 8'hAA;
    edp_frmMesgBusy = 1'h0;
    edp_gotResponseHeader = 1'h0;
    edp_igAC = 8'hAA;
    edp_igAS = 16'hAAAA;
    edp_igDID = 16'hAAAA;
    edp_igF = 8'hAA;
    edp_igFS = 16'hAAAA;
    edp_igPtr = 4'hA;
    edp_igSID = 16'hAAAA;
    edp_inIgnorePkt = 1'h0;
    edp_lastMetaV = 32'hAAAAAAAA;
    edp_lastMetaV_1 = 32'hAAAAAAAA;
    edp_lastMetaV_2 = 32'hAAAAAAAA;
    edp_lastMetaV_3 = 32'hAAAAAAAA;
    edp_lastRuleFired = 4'hA;
    edp_maxPayloadSize = 13'h0AAA;
    edp_maxReadReqSize = 13'h0AAA;
    edp_mesgComplReceived = 17'h0AAAA;
    edp_mesgLengthRemainPull = 17'h0AAAA;
    edp_mesgLengthRemainPush = 17'h0AAAA;
    edp_mesgSeq = 16'hAAAA;
    edp_mhFlags = 8'hAA;
    edp_mhFsm_start_reg = 1'h0;
    edp_mhFsm_start_reg_1 = 1'h0;
    edp_mhFsm_state_can_overlap = 1'h0;
    edp_mhFsm_state_fired = 1'h0;
    edp_mhFsm_state_mkFSMstate = 4'hA;
    edp_mhType = 8'hAA;
    edp_nearBufReady = 1'h0;
    edp_outBF_rCache = 53'h0AAAAAAAAAAAAA;
    edp_outBF_rRdPtr = 12'hAAA;
    edp_outBF_rWrPtr = 12'hAAA;
    edp_outDwRemain = 10'h2AA;
    edp_outFunl_ptr = 2'h2;
    edp_postSeqDwell = 4'hA;
    edp_pullTagMatch = 1'h0;
    edp_rcvDA = 32'hAAAAAAAA;
    edp_rcvDL = 16'hAAAA;
    edp_rcvDoCompletion = 1'h0;
    edp_rcvFA = 32'hAAAAAAAA;
    edp_rcvFV = 32'hAAAAAAAA;
    edp_rcvLiveDA = 32'hAAAAAAAA;
    edp_rcvLiveDL = 16'hAAAA;
    edp_rcvMS = 16'hAAAA;
    edp_rcvMT = 8'hAA;
    edp_rcvNM = 16'hAAAA;
    edp_rcvPtr = 4'hA;
    edp_rcvTID = 32'hAAAAAAAA;
    edp_rcvTM = 8'hAA;
    edp_remDone = 1'h0;
    edp_remMesgAccu = 16'hAAAA;
    edp_remMesgAddr = 16'hAAAA;
    edp_remMetaAddr = 16'hAAAA;
    edp_remStart = 1'h0;
    edp_reqMesgInFlight = 1'h0;
    edp_reqMetaBodyInFlight = 1'h0;
    edp_reqMetaInFlight = 1'h0;
    edp_sentTail4DWHeader = 1'h0;
    edp_srcMesgAccu = 32'hAAAAAAAA;
    edp_tlpBRAM_debugBdata = 128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    edp_tlpBRAM_rdRespDwRemain = 10'h2AA;
    edp_tlpBRAM_readHeaderSent = 1'h0;
    edp_tlpBRAM_readNxtDWAddr = 13'h0AAA;
    edp_tlpBRAM_readRemainDWLen = 10'h2AA;
    edp_tlpBRAM_readStarted = 1'h0;
    edp_tlpBRAM_writeDWAddr = 13'h0AAA;
    edp_tlpBRAM_writeLastBE = 4'hA;
    edp_tlpBRAM_writeRemainDWLen = 10'h2AA;
    edp_tlpMetaSent = 1'h0;
    edp_tlpRcvBusy = 1'h0;
    edp_tlpXmtBusy = 1'h0;
    edp_xactionNumber = 32'hAAAAAAAA;
    edp_xmtMetaInFlight = 1'h0;
    edp_xmtMetaOK = 1'h0;
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
    wmi_addr = 14'h2AAA;
    wmi_bufDwell = 2'h2;
    wmi_bytesRemainReq = 14'h2AAA;
    wmi_bytesRemainResp = 14'h2AAA;
    wmi_doneWithMesg = 1'h0;
    wmi_lastMesg = 32'hAAAAAAAA;
    wmi_lclMesgAddr = 15'h2AAA;
    wmi_lclMetaAddr = 15'h2AAA;
    wmi_mesgBufReady = 1'h0;
    wmi_mesgBusy = 1'h0;
    wmi_mesgCount = 32'hAAAAAAAA;
    wmi_mesgDone = 1'h0;
    wmi_mesgMeta = 129'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wmi_mesgStart = 1'h0;
    wmi_metaBusy = 1'h0;
    wmi_p4B = 2'h2;
    wmi_rdActive = 1'h0;
    wmi_reqCount = 16'hAAAA;
    wmi_thisMesg = 32'hAAAAAAAA;
    wmi_wmi_blockReq = 1'h0;
    wmi_wmi_dhF_countReg = 2'h2;
    wmi_wmi_dhF_levelsValid = 1'h0;
    wmi_wmi_errorSticky = 1'h0;
    wmi_wmi_isReset_isInReset = 1'h0;
    wmi_wmi_mFlagF_countReg = 2'h2;
    wmi_wmi_mFlagF_levelsValid = 1'h0;
    wmi_wmi_operateD = 1'h0;
    wmi_wmi_peerIsReady = 1'h0;
    wmi_wmi_reqF_countReg = 2'h2;
    wmi_wmi_reqF_levelsValid = 1'h0;
    wmi_wmi_respF_c_r = 2'h2;
    wmi_wmi_respF_q_0 = 34'h2AAAAAAAA;
    wmi_wmi_respF_q_1 = 34'h2AAAAAAAA;
    wmi_wmi_sFlagReg = 32'hAAAAAAAA;
    wmi_wmi_statusR = 8'hAA;
    wmi_wmi_trafficSticky = 1'h0;
    wmi_wrActive = 1'h0;
    wmi_wrFinalize = 1'h0;
    wmi_wrtCount = 16'hAAAA;
    wti_isReset_isInReset = 1'h0;
    wti_nowReq = 67'h2AAAAAAAAAAAAAAAA;
    wti_operateD = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (bram_serverAdapterA_s1[1] &&
	  !bram_serverAdapterA_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (bram_serverAdapterB_s1[1] &&
	  !bram_serverAdapterB_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (bram_serverAdapterA_1_s1[1] &&
	  !bram_serverAdapterA_1_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (bram_serverAdapterB_1_s1[1] &&
	  !bram_serverAdapterB_1_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (bram_serverAdapterA_2_s1[1] &&
	  !bram_serverAdapterA_2_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (bram_serverAdapterB_2_s1[1] &&
	  !bram_serverAdapterB_2_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (bram_serverAdapterA_3_s1[1] &&
	  !bram_serverAdapterA_3_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (bram_serverAdapterB_3_s1[1] &&
	  !bram_serverAdapterB_3_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	begin
	  v__h124749 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	$display("[%0d]: %m: WCI CONFIG READ Addr:%0x BE:%0x Data:%0x",
		 v__h124749,
		 wci_reqF$D_OUT[63:32],
		 wci_reqF$D_OUT[67:64],
		 _theResult____h124733);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_start)
	begin
	  v__h15697 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h15697,
		 wci_reqF$D_OUT[36:34],
		 wci_cState);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaRequestNearMeta)
	begin
	  v__h78512 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaRequestNearMeta)
	$display("[%0d]: %m: dmaRequestNearMeta FPactMesg-Step1/7",
		 v__h78512);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaPushRequestMesg)
	begin
	  v__h87277 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaPushRequestMesg)
	$display("[%0d]: %m: dmaPushRequestMesg FPactMesg-Step3/7",
		 v__h87277);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaResponseNearMetaHead)
	begin
	  v__h80805 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaResponseNearMetaHead)
	$display("[%0d]: %m: dmaResponseNearMetaHead FPactMesg-Step2a/7 mesgLength:%0x",
		 v__h80805,
		 x__h79939);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaPushResponseHeader)
	begin
	  v__h87568 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaPushResponseHeader)
	$display("[%0d]: %m: dmaPushResponseHeader FPactMesg-Step4a/7",
		 v__h87568);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaXmtMetaHead)
	begin
	  v__h93048 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaXmtMetaHead)
	$display("[%0d]: %m: dmaXmtMetaHead FPactMesg-Step5/7", v__h93048);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaPushResponseBody)
	begin
	  v__h92899 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaPushResponseBody)
	$display("[%0d]: %m: dmaPushResponseBody FPactMesg-Step4b/7",
		 v__h92899);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaXmtDoorbell)
	begin
	  v__h95233 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaXmtDoorbell)
	$display("[%0d]: %m: dmaXmtDoorbell FC/FPactFlow-Step1/1", v__h95233);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaXmtTailEvent)
	begin
	  v__h93330 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaXmtTailEvent)
	$display("[%0d]: %m: dmaXmtTailEvent FPactMesg-Step7/7", v__h93330);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaXmtMetaBody)
	begin
	  v__h93195 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaXmtMetaBody)
	$display("[%0d]: %m: dmaXmtMetaBody FPactMesg-Step6/7", v__h93195);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaResponseNearMetaBody)
	begin
	  v__h85104 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaResponseNearMetaBody)
	$display("[%0d]: %m: dmaResponseNearMetaBody FPactMesg-Step2b/7 opcode:%0x nowMS:%0x nowLS:%0x",
		 v__h85104,
		 opcode__h81723,
		 nowMS__h82954,
		 nowLS__h83897);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaTailEventSender)
	begin
	  v__h95995 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_dmaTailEventSender)
	$display("[%0d]: %m: dmaTailEventSender - generic", v__h95995);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_fhFsm_action_l185c11 &&
	  WILL_FIRE_RL_edp_fhFsm_action_l186c11)
	$display("Error: \"bsv/inf/EDPServBC.bsv\", line 185, column 11: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edp_fhFsm_action_l185c11] and\n  [RL_edp_fhFsm_action_l186c11] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_fhFsm_action_l184c11 &&
	  (WILL_FIRE_RL_edp_fhFsm_action_l185c11 ||
	   WILL_FIRE_RL_edp_fhFsm_action_l186c11))
	$display("Error: \"bsv/inf/EDPServBC.bsv\", line 184, column 11: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edp_fhFsm_action_l184c11] and\n  [RL_edp_fhFsm_action_l185c11, RL_edp_fhFsm_action_l186c11] ) fired in the\n  same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_mhFsm_action_l193c11 &&
	  (WILL_FIRE_RL_edp_mhFsm_action_l194c11 ||
	   WILL_FIRE_RL_edp_mhFsm_action_l195c11 ||
	   WILL_FIRE_RL_edp_mhFsm_action_l196c11 ||
	   WILL_FIRE_RL_edp_mhFsm_action_l197c11))
	$display("Error: \"bsv/inf/EDPServBC.bsv\", line 193, column 11: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edp_mhFsm_action_l193c11] and\n  [RL_edp_mhFsm_action_l194c11, RL_edp_mhFsm_action_l195c11,\n  RL_edp_mhFsm_action_l196c11, RL_edp_mhFsm_action_l197c11] ) fired in the\n  same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_mhFsm_action_l194c11 &&
	  (WILL_FIRE_RL_edp_mhFsm_action_l195c11 ||
	   WILL_FIRE_RL_edp_mhFsm_action_l196c11 ||
	   WILL_FIRE_RL_edp_mhFsm_action_l197c11))
	$display("Error: \"bsv/inf/EDPServBC.bsv\", line 194, column 11: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edp_mhFsm_action_l194c11] and\n  [RL_edp_mhFsm_action_l195c11, RL_edp_mhFsm_action_l196c11,\n  RL_edp_mhFsm_action_l197c11] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_mhFsm_action_l195c11 &&
	  (WILL_FIRE_RL_edp_mhFsm_action_l196c11 ||
	   WILL_FIRE_RL_edp_mhFsm_action_l197c11))
	$display("Error: \"bsv/inf/EDPServBC.bsv\", line 195, column 11: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edp_mhFsm_action_l195c11] and\n  [RL_edp_mhFsm_action_l196c11, RL_edp_mhFsm_action_l197c11] ) fired in the\n  same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_mhFsm_action_l196c11 &&
	  WILL_FIRE_RL_edp_mhFsm_action_l197c11)
	$display("Error: \"bsv/inf/EDPServBC.bsv\", line 196, column 11: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edp_mhFsm_action_l196c11] and\n  [RL_edp_mhFsm_action_l197c11] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_edp_mhFsm_action_l192c11 &&
	  (WILL_FIRE_RL_edp_mhFsm_action_l193c11 ||
	   WILL_FIRE_RL_edp_mhFsm_action_l194c11 ||
	   WILL_FIRE_RL_edp_mhFsm_action_l195c11 ||
	   WILL_FIRE_RL_edp_mhFsm_action_l196c11 ||
	   WILL_FIRE_RL_edp_mhFsm_action_l197c11))
	$display("Error: \"bsv/inf/EDPServBC.bsv\", line 192, column 11: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_edp_mhFsm_action_l192c11] and\n  [RL_edp_mhFsm_action_l193c11, RL_edp_mhFsm_action_l194c11,\n  RL_edp_mhFsm_action_l195c11, RL_edp_mhFsm_action_l196c11,\n  RL_edp_mhFsm_action_l197c11] ) fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wmi_doWriteFinalize)
	begin
	  v__h115778 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wmi_doWriteFinalize)
	$display("[%0d]: %m: doWriteFinalize lclMetaAddr :%0x length:%0x opcode:%0x nowMS:%0x nowLS:%0x ",
		 v__h115778,
		 wmi_lclMetaAddr,
		 x3__h115136,
		 mesgMeta_opcode__h115176,
		 dmaStartTime$D_IN[63:32],
		 dmaStartTime$D_IN[31:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	begin
	  v__h124593 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	$display("[%0d]: %m: WCI CONFIG WRITE Addr:%0x BE:%0x Data:%0x",
		 v__h124593,
		 wci_reqF$D_OUT[63:32],
		 wci_reqF$D_OUT[67:64],
		 wci_reqF$D_OUT[31:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/inf/OCEDP.bsv\", line 76, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and [RL_wci_cfrd] )\n  fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	begin
	  v__h16016 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h16016,
		 wci_cEdge,
		 wci_cState);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	begin
	  v__h15872 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h15872,
		 wci_cEdge,
		 wci_cState,
		 wci_nState);
  end
  // synopsys translate_on
endmodule