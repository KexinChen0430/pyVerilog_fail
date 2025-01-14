module outputs
  wire [152 : 0] server_response_get;
  wire [31 : 0] wci_s_SData, wmiS0_SData, wmiS0_SFlag;
  wire [1 : 0] wci_s_SFlag, wci_s_SResp, wmiS0_SResp;
  wire RDY_server_request_put,
       RDY_server_response_get,
       wci_s_SThreadBusy,
       wmiS0_SDataThreadBusy,
       wmiS0_SReset_n,
       wmiS0_SRespLast,
       wmiS0_SThreadBusy,
       wti_s_SReset_n,
       wti_s_SThreadBusy;
  // inlined wires
  wire [71 : 0] wci_wciReq$wget;
  wire [66 : 0] wti_wtiReq$wget;
  wire [63 : 0] tlp_nowW$wget, wmi_nowW$wget;
  wire [37 : 0] wmi_wmi_wmiDh$wget;
  wire [33 : 0] wci_respF_x_wire$wget, wmi_wmi_respF_x_wire$wget;
  wire [31 : 0] bram_0_serverAdapterA_outData_enqData$wget,
		bram_0_serverAdapterA_outData_outData$wget,
		bram_0_serverAdapterB_outData_enqData$wget,
		bram_0_serverAdapterB_outData_outData$wget,
		bram_1_serverAdapterA_outData_enqData$wget,
		bram_1_serverAdapterA_outData_outData$wget,
		bram_1_serverAdapterB_outData_enqData$wget,
		bram_1_serverAdapterB_outData_outData$wget,
		bram_2_serverAdapterA_outData_enqData$wget,
		bram_2_serverAdapterA_outData_outData$wget,
		bram_2_serverAdapterB_outData_enqData$wget,
		bram_2_serverAdapterB_outData_outData$wget,
		bram_3_serverAdapterA_outData_enqData$wget,
		bram_3_serverAdapterA_outData_outData$wget,
		bram_3_serverAdapterB_outData_enqData$wget,
		bram_3_serverAdapterB_outData_outData$wget,
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
  wire [7 : 0] bml_dpControl$wget, tlp_dpControl$wget, wmi_dpControl$wget;
  wire [3 : 0] wci_Es_mByteEn_w$wget, wmi_Es_mDataByteEn_w$wget;
  wire [2 : 0] bram_0_serverAdapterA_cnt_1$wget,
	       bram_0_serverAdapterA_cnt_2$wget,
	       bram_0_serverAdapterA_cnt_3$wget,
	       bram_0_serverAdapterB_cnt_1$wget,
	       bram_0_serverAdapterB_cnt_2$wget,
	       bram_0_serverAdapterB_cnt_3$wget,
	       bram_1_serverAdapterA_cnt_1$wget,
	       bram_1_serverAdapterA_cnt_2$wget,
	       bram_1_serverAdapterA_cnt_3$wget,
	       bram_1_serverAdapterB_cnt_1$wget,
	       bram_1_serverAdapterB_cnt_2$wget,
	       bram_1_serverAdapterB_cnt_3$wget,
	       bram_2_serverAdapterA_cnt_1$wget,
	       bram_2_serverAdapterA_cnt_2$wget,
	       bram_2_serverAdapterA_cnt_3$wget,
	       bram_2_serverAdapterB_cnt_1$wget,
	       bram_2_serverAdapterB_cnt_2$wget,
	       bram_2_serverAdapterB_cnt_3$wget,
	       bram_3_serverAdapterA_cnt_1$wget,
	       bram_3_serverAdapterA_cnt_2$wget,
	       bram_3_serverAdapterA_cnt_3$wget,
	       bram_3_serverAdapterB_cnt_1$wget,
	       bram_3_serverAdapterB_cnt_2$wget,
	       bram_3_serverAdapterB_cnt_3$wget,
	       wci_Es_mCmd_w$wget,
	       wci_wEdge$wget,
	       wmi_Es_mCmd_w$wget;
  wire [1 : 0] bram_0_serverAdapterA_s1_1$wget,
	       bram_0_serverAdapterA_writeWithResp$wget,
	       bram_0_serverAdapterB_s1_1$wget,
	       bram_0_serverAdapterB_writeWithResp$wget,
	       bram_1_serverAdapterA_s1_1$wget,
	       bram_1_serverAdapterA_writeWithResp$wget,
	       bram_1_serverAdapterB_s1_1$wget,
	       bram_1_serverAdapterB_writeWithResp$wget,
	       bram_2_serverAdapterA_s1_1$wget,
	       bram_2_serverAdapterA_writeWithResp$wget,
	       bram_2_serverAdapterB_s1_1$wget,
	       bram_2_serverAdapterB_writeWithResp$wget,
	       bram_3_serverAdapterA_s1_1$wget,
	       bram_3_serverAdapterA_writeWithResp$wget,
	       bram_3_serverAdapterB_s1_1$wget,
	       bram_3_serverAdapterB_writeWithResp$wget;
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
       bram_0_serverAdapterA_cnt_1$whas,
       bram_0_serverAdapterA_cnt_2$whas,
       bram_0_serverAdapterA_cnt_3$whas,
       bram_0_serverAdapterA_outData_deqCalled$whas,
       bram_0_serverAdapterA_outData_enqData$whas,
       bram_0_serverAdapterA_outData_outData$whas,
       bram_0_serverAdapterA_s1_1$whas,
       bram_0_serverAdapterA_writeWithResp$whas,
       bram_0_serverAdapterB_cnt_1$whas,
       bram_0_serverAdapterB_cnt_2$whas,
       bram_0_serverAdapterB_cnt_3$whas,
       bram_0_serverAdapterB_outData_deqCalled$whas,
       bram_0_serverAdapterB_outData_enqData$whas,
       bram_0_serverAdapterB_outData_outData$whas,
       bram_0_serverAdapterB_s1_1$whas,
       bram_0_serverAdapterB_writeWithResp$whas,
       bram_1_serverAdapterA_cnt_1$whas,
       bram_1_serverAdapterA_cnt_2$whas,
       bram_1_serverAdapterA_cnt_3$whas,
       bram_1_serverAdapterA_outData_deqCalled$whas,
       bram_1_serverAdapterA_outData_enqData$whas,
       bram_1_serverAdapterA_outData_outData$whas,
       bram_1_serverAdapterA_s1_1$whas,
       bram_1_serverAdapterA_writeWithResp$whas,
       bram_1_serverAdapterB_cnt_1$whas,
       bram_1_serverAdapterB_cnt_2$whas,
       bram_1_serverAdapterB_cnt_3$whas,
       bram_1_serverAdapterB_outData_deqCalled$whas,
       bram_1_serverAdapterB_outData_enqData$whas,
       bram_1_serverAdapterB_outData_outData$whas,
       bram_1_serverAdapterB_s1_1$whas,
       bram_1_serverAdapterB_writeWithResp$whas,
       bram_2_serverAdapterA_cnt_1$whas,
       bram_2_serverAdapterA_cnt_2$whas,
       bram_2_serverAdapterA_cnt_3$whas,
       bram_2_serverAdapterA_outData_deqCalled$whas,
       bram_2_serverAdapterA_outData_enqData$whas,
       bram_2_serverAdapterA_outData_outData$whas,
       bram_2_serverAdapterA_s1_1$whas,
       bram_2_serverAdapterA_writeWithResp$whas,
       bram_2_serverAdapterB_cnt_1$whas,
       bram_2_serverAdapterB_cnt_2$whas,
       bram_2_serverAdapterB_cnt_3$whas,
       bram_2_serverAdapterB_outData_deqCalled$whas,
       bram_2_serverAdapterB_outData_enqData$whas,
       bram_2_serverAdapterB_outData_outData$whas,
       bram_2_serverAdapterB_s1_1$whas,
       bram_2_serverAdapterB_writeWithResp$whas,
       bram_3_serverAdapterA_cnt_1$whas,
       bram_3_serverAdapterA_cnt_2$whas,
       bram_3_serverAdapterA_cnt_3$whas,
       bram_3_serverAdapterA_outData_deqCalled$whas,
       bram_3_serverAdapterA_outData_enqData$whas,
       bram_3_serverAdapterA_outData_outData$whas,
       bram_3_serverAdapterA_s1_1$whas,
       bram_3_serverAdapterA_writeWithResp$whas,
       bram_3_serverAdapterB_cnt_1$whas,
       bram_3_serverAdapterB_cnt_2$whas,
       bram_3_serverAdapterB_cnt_3$whas,
       bram_3_serverAdapterB_outData_deqCalled$whas,
       bram_3_serverAdapterB_outData_enqData$whas,
       bram_3_serverAdapterB_outData_outData$whas,
       bram_3_serverAdapterB_s1_1$whas,
       bram_3_serverAdapterB_writeWithResp$whas,
       tlp_creditReady_1$wget,
       tlp_creditReady_1$whas,
       tlp_dmaDoneMark_1$wget,
       tlp_dmaDoneMark_1$whas,
       tlp_dmaStartMark_1$wget,
       tlp_dmaStartMark_1$whas,
       tlp_dpControl$whas,
       tlp_farBufReady_1$wget,
       tlp_farBufReady_1$whas,
       tlp_nearBufReady_1$wget,
       tlp_nearBufReady_1$whas,
       tlp_nowW$whas,
       tlp_pullTagMatch_1$wget,
       tlp_pullTagMatch_1$whas,
       tlp_remDone_1$wget,
       tlp_remDone_1$whas,
       tlp_remStart_1$wget,
       tlp_remStart_1$whas,
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
  // register bram_0_serverAdapterA_cnt
  reg [2 : 0] bram_0_serverAdapterA_cnt;
  wire [2 : 0] bram_0_serverAdapterA_cnt$D_IN;
  wire bram_0_serverAdapterA_cnt$EN;
  // register bram_0_serverAdapterA_s1
  reg [1 : 0] bram_0_serverAdapterA_s1;
  wire [1 : 0] bram_0_serverAdapterA_s1$D_IN;
  wire bram_0_serverAdapterA_s1$EN;
  // register bram_0_serverAdapterB_cnt
  reg [2 : 0] bram_0_serverAdapterB_cnt;
  wire [2 : 0] bram_0_serverAdapterB_cnt$D_IN;
  wire bram_0_serverAdapterB_cnt$EN;
  // register bram_0_serverAdapterB_s1
  reg [1 : 0] bram_0_serverAdapterB_s1;
  wire [1 : 0] bram_0_serverAdapterB_s1$D_IN;
  wire bram_0_serverAdapterB_s1$EN;
  // register bram_1_serverAdapterA_cnt
  reg [2 : 0] bram_1_serverAdapterA_cnt;
  wire [2 : 0] bram_1_serverAdapterA_cnt$D_IN;
  wire bram_1_serverAdapterA_cnt$EN;
  // register bram_1_serverAdapterA_s1
  reg [1 : 0] bram_1_serverAdapterA_s1;
  wire [1 : 0] bram_1_serverAdapterA_s1$D_IN;
  wire bram_1_serverAdapterA_s1$EN;
  // register bram_1_serverAdapterB_cnt
  reg [2 : 0] bram_1_serverAdapterB_cnt;
  wire [2 : 0] bram_1_serverAdapterB_cnt$D_IN;
  wire bram_1_serverAdapterB_cnt$EN;
  // register bram_1_serverAdapterB_s1
  reg [1 : 0] bram_1_serverAdapterB_s1;
  wire [1 : 0] bram_1_serverAdapterB_s1$D_IN;
  wire bram_1_serverAdapterB_s1$EN;
  // register bram_2_serverAdapterA_cnt
  reg [2 : 0] bram_2_serverAdapterA_cnt;
  wire [2 : 0] bram_2_serverAdapterA_cnt$D_IN;
  wire bram_2_serverAdapterA_cnt$EN;
  // register bram_2_serverAdapterA_s1
  reg [1 : 0] bram_2_serverAdapterA_s1;
  wire [1 : 0] bram_2_serverAdapterA_s1$D_IN;
  wire bram_2_serverAdapterA_s1$EN;
  // register bram_2_serverAdapterB_cnt
  reg [2 : 0] bram_2_serverAdapterB_cnt;
  wire [2 : 0] bram_2_serverAdapterB_cnt$D_IN;
  wire bram_2_serverAdapterB_cnt$EN;
  // register bram_2_serverAdapterB_s1
  reg [1 : 0] bram_2_serverAdapterB_s1;
  wire [1 : 0] bram_2_serverAdapterB_s1$D_IN;
  wire bram_2_serverAdapterB_s1$EN;
  // register bram_3_serverAdapterA_cnt
  reg [2 : 0] bram_3_serverAdapterA_cnt;
  wire [2 : 0] bram_3_serverAdapterA_cnt$D_IN;
  wire bram_3_serverAdapterA_cnt$EN;
  // register bram_3_serverAdapterA_s1
  reg [1 : 0] bram_3_serverAdapterA_s1;
  wire [1 : 0] bram_3_serverAdapterA_s1$D_IN;
  wire bram_3_serverAdapterA_s1$EN;
  // register bram_3_serverAdapterB_cnt
  reg [2 : 0] bram_3_serverAdapterB_cnt;
  wire [2 : 0] bram_3_serverAdapterB_cnt$D_IN;
  wire bram_3_serverAdapterB_cnt$EN;
  // register bram_3_serverAdapterB_s1
  reg [1 : 0] bram_3_serverAdapterB_s1;
  wire [1 : 0] bram_3_serverAdapterB_s1$D_IN;
  wire bram_3_serverAdapterB_s1$EN;
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
  // register tlp_complTimerCount
  reg [11 : 0] tlp_complTimerCount;
  wire [11 : 0] tlp_complTimerCount$D_IN;
  wire tlp_complTimerCount$EN;
  // register tlp_complTimerRunning
  reg tlp_complTimerRunning;
  wire tlp_complTimerRunning$D_IN, tlp_complTimerRunning$EN;
  // register tlp_creditReady
  reg tlp_creditReady;
  wire tlp_creditReady$D_IN, tlp_creditReady$EN;
  // register tlp_dmaDoTailEvent
  reg tlp_dmaDoTailEvent;
  reg tlp_dmaDoTailEvent$D_IN;
  wire tlp_dmaDoTailEvent$EN;
  // register tlp_dmaDoneMark
  reg tlp_dmaDoneMark;
  wire tlp_dmaDoneMark$D_IN, tlp_dmaDoneMark$EN;
  // register tlp_dmaPullRemainDWLen
  reg [9 : 0] tlp_dmaPullRemainDWLen;
  reg [9 : 0] tlp_dmaPullRemainDWLen$D_IN;
  wire tlp_dmaPullRemainDWLen$EN;
  // register tlp_dmaPullRemainDWSub
  reg [9 : 0] tlp_dmaPullRemainDWSub;
  wire [9 : 0] tlp_dmaPullRemainDWSub$D_IN;
  wire tlp_dmaPullRemainDWSub$EN;
  // register tlp_dmaReqTag
  reg [4 : 0] tlp_dmaReqTag;
  wire [4 : 0] tlp_dmaReqTag$D_IN;
  wire tlp_dmaReqTag$EN;
  // register tlp_dmaStartMark
  reg tlp_dmaStartMark;
  wire tlp_dmaStartMark$D_IN, tlp_dmaStartMark$EN;
  // register tlp_dmaTag
  reg [4 : 0] tlp_dmaTag;
  wire [4 : 0] tlp_dmaTag$D_IN;
  wire tlp_dmaTag$EN;
  // register tlp_doXmtMetaBody
  reg tlp_doXmtMetaBody;
  wire tlp_doXmtMetaBody$D_IN, tlp_doXmtMetaBody$EN;
  // register tlp_doorSeqDwell
  reg [3 : 0] tlp_doorSeqDwell;
  wire [3 : 0] tlp_doorSeqDwell$D_IN;
  wire tlp_doorSeqDwell$EN;
  // register tlp_fabFlowAddr
  reg [31 : 0] tlp_fabFlowAddr;
  wire [31 : 0] tlp_fabFlowAddr$D_IN;
  wire tlp_fabFlowAddr$EN;
  // register tlp_fabFlowAddrMS
  reg [31 : 0] tlp_fabFlowAddrMS;
  wire [31 : 0] tlp_fabFlowAddrMS$D_IN;
  wire tlp_fabFlowAddrMS$EN;
  // register tlp_fabMesgAccu
  reg [31 : 0] tlp_fabMesgAccu;
  reg [31 : 0] tlp_fabMesgAccu$D_IN;
  wire tlp_fabMesgAccu$EN;
  // register tlp_fabMesgAddr
  reg [31 : 0] tlp_fabMesgAddr;
  wire [31 : 0] tlp_fabMesgAddr$D_IN;
  wire tlp_fabMesgAddr$EN;
  // register tlp_fabMesgAddrMS
  reg [31 : 0] tlp_fabMesgAddrMS;
  wire [31 : 0] tlp_fabMesgAddrMS$D_IN;
  wire tlp_fabMesgAddrMS$EN;
  // register tlp_fabMeta
  reg [128 : 0] tlp_fabMeta;
  reg [128 : 0] tlp_fabMeta$D_IN;
  wire tlp_fabMeta$EN;
  // register tlp_fabMetaAddr
  reg [31 : 0] tlp_fabMetaAddr;
  wire [31 : 0] tlp_fabMetaAddr$D_IN;
  wire tlp_fabMetaAddr$EN;
  // register tlp_fabMetaAddrMS
  reg [31 : 0] tlp_fabMetaAddrMS;
  wire [31 : 0] tlp_fabMetaAddrMS$D_IN;
  wire tlp_fabMetaAddrMS$EN;
  // register tlp_farBufReady
  reg tlp_farBufReady;
  wire tlp_farBufReady$D_IN, tlp_farBufReady$EN;
  // register tlp_flowDiagCount
  reg [31 : 0] tlp_flowDiagCount;
  wire [31 : 0] tlp_flowDiagCount$D_IN;
  wire tlp_flowDiagCount$EN;
  // register tlp_gotResponseHeader
  reg tlp_gotResponseHeader;
  reg tlp_gotResponseHeader$D_IN;
  wire tlp_gotResponseHeader$EN;
  // register tlp_inIgnorePkt
  reg tlp_inIgnorePkt;
  wire tlp_inIgnorePkt$D_IN, tlp_inIgnorePkt$EN;
  // register tlp_lastMetaV_0
  reg [31 : 0] tlp_lastMetaV_0;
  wire [31 : 0] tlp_lastMetaV_0$D_IN;
  wire tlp_lastMetaV_0$EN;
  // register tlp_lastMetaV_1
  reg [31 : 0] tlp_lastMetaV_1;
  wire [31 : 0] tlp_lastMetaV_1$D_IN;
  wire tlp_lastMetaV_1$EN;
  // register tlp_lastMetaV_2
  reg [31 : 0] tlp_lastMetaV_2;
  wire [31 : 0] tlp_lastMetaV_2$D_IN;
  wire tlp_lastMetaV_2$EN;
  // register tlp_lastMetaV_3
  reg [31 : 0] tlp_lastMetaV_3;
  wire [31 : 0] tlp_lastMetaV_3$D_IN;
  wire tlp_lastMetaV_3$EN;
  // register tlp_lastRuleFired
  reg [3 : 0] tlp_lastRuleFired;
  reg [3 : 0] tlp_lastRuleFired$D_IN;
  wire tlp_lastRuleFired$EN;
  // register tlp_maxPayloadSize
  reg [12 : 0] tlp_maxPayloadSize;
  wire [12 : 0] tlp_maxPayloadSize$D_IN;
  wire tlp_maxPayloadSize$EN;
  // register tlp_maxReadReqSize
  reg [12 : 0] tlp_maxReadReqSize;
  wire [12 : 0] tlp_maxReadReqSize$D_IN;
  wire tlp_maxReadReqSize$EN;
  // register tlp_mesgComplReceived
  reg [16 : 0] tlp_mesgComplReceived;
  reg [16 : 0] tlp_mesgComplReceived$D_IN;
  wire tlp_mesgComplReceived$EN;
  // register tlp_mesgLengthRemainPull
  reg [16 : 0] tlp_mesgLengthRemainPull;
  reg [16 : 0] tlp_mesgLengthRemainPull$D_IN;
  wire tlp_mesgLengthRemainPull$EN;
  // register tlp_mesgLengthRemainPush
  reg [16 : 0] tlp_mesgLengthRemainPush;
  reg [16 : 0] tlp_mesgLengthRemainPush$D_IN;
  wire tlp_mesgLengthRemainPush$EN;
  // register tlp_nearBufReady
  reg tlp_nearBufReady;
  wire tlp_nearBufReady$D_IN, tlp_nearBufReady$EN;
  // register tlp_outDwRemain
  reg [9 : 0] tlp_outDwRemain;
  reg [9 : 0] tlp_outDwRemain$D_IN;
  wire tlp_outDwRemain$EN;
  // register tlp_postSeqDwell
  reg [3 : 0] tlp_postSeqDwell;
  wire [3 : 0] tlp_postSeqDwell$D_IN;
  wire tlp_postSeqDwell$EN;
  // register tlp_pullTagMatch
  reg tlp_pullTagMatch;
  wire tlp_pullTagMatch$D_IN, tlp_pullTagMatch$EN;
  // register tlp_remDone
  reg tlp_remDone;
  wire tlp_remDone$D_IN, tlp_remDone$EN;
  // register tlp_remMesgAccu
  reg [15 : 0] tlp_remMesgAccu;
  reg [15 : 0] tlp_remMesgAccu$D_IN;
  wire tlp_remMesgAccu$EN;
  // register tlp_remMesgAddr
  reg [15 : 0] tlp_remMesgAddr;
  wire [15 : 0] tlp_remMesgAddr$D_IN;
  wire tlp_remMesgAddr$EN;
  // register tlp_remMetaAddr
  reg [15 : 0] tlp_remMetaAddr;
  wire [15 : 0] tlp_remMetaAddr$D_IN;
  wire tlp_remMetaAddr$EN;
  // register tlp_remStart
  reg tlp_remStart;
  wire tlp_remStart$D_IN, tlp_remStart$EN;
  // register tlp_reqMesgInFlight
  reg tlp_reqMesgInFlight;
  reg tlp_reqMesgInFlight$D_IN;
  wire tlp_reqMesgInFlight$EN;
  // register tlp_reqMetaBodyInFlight
  reg tlp_reqMetaBodyInFlight;
  wire tlp_reqMetaBodyInFlight$D_IN, tlp_reqMetaBodyInFlight$EN;
  // register tlp_reqMetaInFlight
  reg tlp_reqMetaInFlight;
  reg tlp_reqMetaInFlight$D_IN;
  wire tlp_reqMetaInFlight$EN;
  // register tlp_sentTail4DWHeader
  reg tlp_sentTail4DWHeader;
  wire tlp_sentTail4DWHeader$D_IN, tlp_sentTail4DWHeader$EN;
  // register tlp_srcMesgAccu
  reg [31 : 0] tlp_srcMesgAccu;
  wire [31 : 0] tlp_srcMesgAccu$D_IN;
  wire tlp_srcMesgAccu$EN;
  // register tlp_tlpBRAM_debugBdata
  reg [127 : 0] tlp_tlpBRAM_debugBdata;
  wire [127 : 0] tlp_tlpBRAM_debugBdata$D_IN;
  wire tlp_tlpBRAM_debugBdata$EN;
  // register tlp_tlpBRAM_rdRespDwRemain
  reg [9 : 0] tlp_tlpBRAM_rdRespDwRemain;
  wire [9 : 0] tlp_tlpBRAM_rdRespDwRemain$D_IN;
  wire tlp_tlpBRAM_rdRespDwRemain$EN;
  // register tlp_tlpBRAM_readHeaderSent
  reg tlp_tlpBRAM_readHeaderSent;
  wire tlp_tlpBRAM_readHeaderSent$D_IN, tlp_tlpBRAM_readHeaderSent$EN;
  // register tlp_tlpBRAM_readNxtDWAddr
  reg [12 : 0] tlp_tlpBRAM_readNxtDWAddr;
  wire [12 : 0] tlp_tlpBRAM_readNxtDWAddr$D_IN;
  wire tlp_tlpBRAM_readNxtDWAddr$EN;
  // register tlp_tlpBRAM_readRemainDWLen
  reg [9 : 0] tlp_tlpBRAM_readRemainDWLen;
  wire [9 : 0] tlp_tlpBRAM_readRemainDWLen$D_IN;
  wire tlp_tlpBRAM_readRemainDWLen$EN;
  // register tlp_tlpBRAM_readStarted
  reg tlp_tlpBRAM_readStarted;
  wire tlp_tlpBRAM_readStarted$D_IN, tlp_tlpBRAM_readStarted$EN;
  // register tlp_tlpBRAM_writeDWAddr
  reg [12 : 0] tlp_tlpBRAM_writeDWAddr;
  wire [12 : 0] tlp_tlpBRAM_writeDWAddr$D_IN;
  wire tlp_tlpBRAM_writeDWAddr$EN;
  // register tlp_tlpBRAM_writeLastBE
  reg [3 : 0] tlp_tlpBRAM_writeLastBE;
  wire [3 : 0] tlp_tlpBRAM_writeLastBE$D_IN;
  wire tlp_tlpBRAM_writeLastBE$EN;
  // register tlp_tlpBRAM_writeRemainDWLen
  reg [9 : 0] tlp_tlpBRAM_writeRemainDWLen;
  wire [9 : 0] tlp_tlpBRAM_writeRemainDWLen$D_IN;
  wire tlp_tlpBRAM_writeRemainDWLen$EN;
  // register tlp_tlpMetaSent
  reg tlp_tlpMetaSent;
  wire tlp_tlpMetaSent$D_IN, tlp_tlpMetaSent$EN;
  // register tlp_tlpRcvBusy
  reg tlp_tlpRcvBusy;
  reg tlp_tlpRcvBusy$D_IN;
  wire tlp_tlpRcvBusy$EN;
  // register tlp_tlpXmtBusy
  reg tlp_tlpXmtBusy;
  reg tlp_tlpXmtBusy$D_IN;
  wire tlp_tlpXmtBusy$EN;
  // register tlp_xmtMetaInFlight
  reg tlp_xmtMetaInFlight;
  wire tlp_xmtMetaInFlight$D_IN, tlp_xmtMetaInFlight$EN;
  // register tlp_xmtMetaOK
  reg tlp_xmtMetaOK;
  reg tlp_xmtMetaOK$D_IN;
  wire tlp_xmtMetaOK$EN;
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
  // register wci_respF_cntr_r
  reg [1 : 0] wci_respF_cntr_r;
  wire [1 : 0] wci_respF_cntr_r$D_IN;
  wire wci_respF_cntr_r$EN;
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
  // register wmi_wmi_respF_cntr_r
  reg [1 : 0] wmi_wmi_respF_cntr_r;
  wire [1 : 0] wmi_wmi_respF_cntr_r$D_IN;
  wire wmi_wmi_respF_cntr_r$EN;
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
  // ports of submodule bram_0_memory
  reg [31 : 0] bram_0_memory$DIA, bram_0_memory$DIB;
  reg [10 : 0] bram_0_memory$ADDRA, bram_0_memory$ADDRB;
  wire [31 : 0] bram_0_memory$DOA, bram_0_memory$DOB;
  wire bram_0_memory$ENA,
       bram_0_memory$ENB,
       bram_0_memory$WEA,
       bram_0_memory$WEB;
  // ports of submodule bram_0_serverAdapterA_outDataCore
  wire [31 : 0] bram_0_serverAdapterA_outDataCore$D_IN,
		bram_0_serverAdapterA_outDataCore$D_OUT;
  wire bram_0_serverAdapterA_outDataCore$CLR,
       bram_0_serverAdapterA_outDataCore$DEQ,
       bram_0_serverAdapterA_outDataCore$EMPTY_N,
       bram_0_serverAdapterA_outDataCore$ENQ,
       bram_0_serverAdapterA_outDataCore$FULL_N;
  // ports of submodule bram_0_serverAdapterB_outDataCore
  wire [31 : 0] bram_0_serverAdapterB_outDataCore$D_IN,
		bram_0_serverAdapterB_outDataCore$D_OUT;
  wire bram_0_serverAdapterB_outDataCore$CLR,
       bram_0_serverAdapterB_outDataCore$DEQ,
       bram_0_serverAdapterB_outDataCore$EMPTY_N,
       bram_0_serverAdapterB_outDataCore$ENQ,
       bram_0_serverAdapterB_outDataCore$FULL_N;
  // ports of submodule bram_1_memory
  reg [31 : 0] bram_1_memory$DIA, bram_1_memory$DIB;
  reg [10 : 0] bram_1_memory$ADDRA, bram_1_memory$ADDRB;
  wire [31 : 0] bram_1_memory$DOA, bram_1_memory$DOB;
  wire bram_1_memory$ENA,
       bram_1_memory$ENB,
       bram_1_memory$WEA,
       bram_1_memory$WEB;
  // ports of submodule bram_1_serverAdapterA_outDataCore
  wire [31 : 0] bram_1_serverAdapterA_outDataCore$D_IN,
		bram_1_serverAdapterA_outDataCore$D_OUT;
  wire bram_1_serverAdapterA_outDataCore$CLR,
       bram_1_serverAdapterA_outDataCore$DEQ,
       bram_1_serverAdapterA_outDataCore$EMPTY_N,
       bram_1_serverAdapterA_outDataCore$ENQ,
       bram_1_serverAdapterA_outDataCore$FULL_N;
  // ports of submodule bram_1_serverAdapterB_outDataCore
  wire [31 : 0] bram_1_serverAdapterB_outDataCore$D_IN,
		bram_1_serverAdapterB_outDataCore$D_OUT;
  wire bram_1_serverAdapterB_outDataCore$CLR,
       bram_1_serverAdapterB_outDataCore$DEQ,
       bram_1_serverAdapterB_outDataCore$EMPTY_N,
       bram_1_serverAdapterB_outDataCore$ENQ,
       bram_1_serverAdapterB_outDataCore$FULL_N;
  // ports of submodule bram_2_memory
  reg [31 : 0] bram_2_memory$DIA, bram_2_memory$DIB;
  reg [10 : 0] bram_2_memory$ADDRA, bram_2_memory$ADDRB;
  wire [31 : 0] bram_2_memory$DOA, bram_2_memory$DOB;
  wire bram_2_memory$ENA,
       bram_2_memory$ENB,
       bram_2_memory$WEA,
       bram_2_memory$WEB;
  // ports of submodule bram_2_serverAdapterA_outDataCore
  wire [31 : 0] bram_2_serverAdapterA_outDataCore$D_IN,
		bram_2_serverAdapterA_outDataCore$D_OUT;
  wire bram_2_serverAdapterA_outDataCore$CLR,
       bram_2_serverAdapterA_outDataCore$DEQ,
       bram_2_serverAdapterA_outDataCore$EMPTY_N,
       bram_2_serverAdapterA_outDataCore$ENQ,
       bram_2_serverAdapterA_outDataCore$FULL_N;
  // ports of submodule bram_2_serverAdapterB_outDataCore
  wire [31 : 0] bram_2_serverAdapterB_outDataCore$D_IN,
		bram_2_serverAdapterB_outDataCore$D_OUT;
  wire bram_2_serverAdapterB_outDataCore$CLR,
       bram_2_serverAdapterB_outDataCore$DEQ,
       bram_2_serverAdapterB_outDataCore$EMPTY_N,
       bram_2_serverAdapterB_outDataCore$ENQ,
       bram_2_serverAdapterB_outDataCore$FULL_N;
  // ports of submodule bram_3_memory
  reg [31 : 0] bram_3_memory$DIA, bram_3_memory$DIB;
  reg [10 : 0] bram_3_memory$ADDRA, bram_3_memory$ADDRB;
  wire [31 : 0] bram_3_memory$DOA, bram_3_memory$DOB;
  wire bram_3_memory$ENA,
       bram_3_memory$ENB,
       bram_3_memory$WEA,
       bram_3_memory$WEB;
  // ports of submodule bram_3_serverAdapterA_outDataCore
  wire [31 : 0] bram_3_serverAdapterA_outDataCore$D_IN,
		bram_3_serverAdapterA_outDataCore$D_OUT;
  wire bram_3_serverAdapterA_outDataCore$CLR,
       bram_3_serverAdapterA_outDataCore$DEQ,
       bram_3_serverAdapterA_outDataCore$EMPTY_N,
       bram_3_serverAdapterA_outDataCore$ENQ,
       bram_3_serverAdapterA_outDataCore$FULL_N;
  // ports of submodule bram_3_serverAdapterB_outDataCore
  wire [31 : 0] bram_3_serverAdapterB_outDataCore$D_IN,
		bram_3_serverAdapterB_outDataCore$D_OUT;
  wire bram_3_serverAdapterB_outDataCore$CLR,
       bram_3_serverAdapterB_outDataCore$DEQ,
       bram_3_serverAdapterB_outDataCore$EMPTY_N,
       bram_3_serverAdapterB_outDataCore$ENQ,
       bram_3_serverAdapterB_outDataCore$FULL_N;
  // ports of submodule tlp_inF
  wire [152 : 0] tlp_inF$D_IN, tlp_inF$D_OUT;
  wire tlp_inF$CLR, tlp_inF$DEQ, tlp_inF$EMPTY_N, tlp_inF$ENQ, tlp_inF$FULL_N;
  // ports of submodule tlp_outF
  reg [152 : 0] tlp_outF$D_IN;
  wire [152 : 0] tlp_outF$D_OUT;
  wire tlp_outF$CLR,
       tlp_outF$DEQ,
       tlp_outF$EMPTY_N,
       tlp_outF$ENQ,
       tlp_outF$FULL_N;
  // ports of submodule tlp_tailEventF
  wire tlp_tailEventF$CLR,
       tlp_tailEventF$DEQ,
       tlp_tailEventF$D_IN,
       tlp_tailEventF$D_OUT,
       tlp_tailEventF$EMPTY_N,
       tlp_tailEventF$ENQ,
       tlp_tailEventF$FULL_N;
  // ports of submodule tlp_tlpBRAM_mReqF
  reg [129 : 0] tlp_tlpBRAM_mReqF$D_IN;
  wire [129 : 0] tlp_tlpBRAM_mReqF$D_OUT;
  wire tlp_tlpBRAM_mReqF$CLR,
       tlp_tlpBRAM_mReqF$DEQ,
       tlp_tlpBRAM_mReqF$EMPTY_N,
       tlp_tlpBRAM_mReqF$ENQ,
       tlp_tlpBRAM_mReqF$FULL_N;
  // ports of submodule tlp_tlpBRAM_mRespF
  wire [138 : 0] tlp_tlpBRAM_mRespF$D_IN, tlp_tlpBRAM_mRespF$D_OUT;
  wire tlp_tlpBRAM_mRespF$CLR,
       tlp_tlpBRAM_mRespF$DEQ,
       tlp_tlpBRAM_mRespF$EMPTY_N,
       tlp_tlpBRAM_mRespF$ENQ,
       tlp_tlpBRAM_mRespF$FULL_N;
  // ports of submodule tlp_tlpBRAM_readReq
  wire [60 : 0] tlp_tlpBRAM_readReq$D_IN, tlp_tlpBRAM_readReq$D_OUT;
  wire tlp_tlpBRAM_readReq$CLR,
       tlp_tlpBRAM_readReq$DEQ,
       tlp_tlpBRAM_readReq$EMPTY_N,
       tlp_tlpBRAM_readReq$ENQ,
       tlp_tlpBRAM_readReq$FULL_N;
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
       CAN_FIRE_RL_tlp_dmaRespBodyFarMeta,
       CAN_FIRE_RL_tlp_dmaTailEventSender,
       CAN_FIRE_RL_tlp_dmaXmtMetaBody,
       CAN_FIRE_RL_tlp_tlpRcv,
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
       WILL_FIRE_RL_bram_0_serverAdapterA_outData_enqAndDeq,
       WILL_FIRE_RL_bram_0_serverAdapterB_outData_enqAndDeq,
       WILL_FIRE_RL_bram_1_serverAdapterA_outData_enqAndDeq,
       WILL_FIRE_RL_bram_1_serverAdapterB_outData_enqAndDeq,
       WILL_FIRE_RL_bram_2_serverAdapterA_outData_enqAndDeq,
       WILL_FIRE_RL_bram_2_serverAdapterA_outData_setFirstEnq,
       WILL_FIRE_RL_bram_2_serverAdapterB_outData_enqAndDeq,
       WILL_FIRE_RL_bram_3_serverAdapterA_outData_enqAndDeq,
       WILL_FIRE_RL_bram_3_serverAdapterB_outData_enqAndDeq,
       WILL_FIRE_RL_tlp_dataXmt_Body,
       WILL_FIRE_RL_tlp_dataXmt_Header,
       WILL_FIRE_RL_tlp_dmaPullRequestFarMesg,
       WILL_FIRE_RL_tlp_dmaPullResponseBody,
       WILL_FIRE_RL_tlp_dmaPullResponseHeader,
       WILL_FIRE_RL_tlp_dmaPullTailEvent,
       WILL_FIRE_RL_tlp_dmaPushRequestMesg,
       WILL_FIRE_RL_tlp_dmaPushResponseBody,
       WILL_FIRE_RL_tlp_dmaPushResponseHeader,
       WILL_FIRE_RL_tlp_dmaRequestFarMeta,
       WILL_FIRE_RL_tlp_dmaRequestNearMeta,
       WILL_FIRE_RL_tlp_dmaRespBodyFarMeta,
       WILL_FIRE_RL_tlp_dmaRespHeadFarMeta,
       WILL_FIRE_RL_tlp_dmaResponseNearMetaBody,
       WILL_FIRE_RL_tlp_dmaResponseNearMetaHead,
       WILL_FIRE_RL_tlp_dmaTailEventSender,
       WILL_FIRE_RL_tlp_dmaXmtDoorbell,
       WILL_FIRE_RL_tlp_dmaXmtMetaBody,
       WILL_FIRE_RL_tlp_dmaXmtMetaHead,
       WILL_FIRE_RL_tlp_dmaXmtTailEvent,
       WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq,
       WILL_FIRE_RL_tlp_tlpBRAM_read_FirstResp,
       WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq,
       WILL_FIRE_RL_tlp_tlpBRAM_read_NextResp,
       WILL_FIRE_RL_tlp_tlpBRAM_writeData,
       WILL_FIRE_RL_tlp_tlpBRAM_writeReq,
       WILL_FIRE_RL_tlp_tlpRcv,
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
  reg [10 : 0] MUX_bram_0_memory$a_put_2__VAL_1,
	       MUX_bram_0_memory$a_put_2__VAL_4,
	       MUX_bram_1_memory$a_put_2__VAL_1,
	       MUX_bram_1_memory$a_put_2__VAL_4,
	       MUX_bram_2_memory$a_put_2__VAL_1,
	       MUX_bram_2_memory$a_put_2__VAL_4,
	       MUX_bram_3_memory$a_put_2__VAL_1,
	       MUX_bram_3_memory$a_put_2__VAL_4;
  wire [152 : 0] MUX_tlp_outF$enq_1__VAL_1,
		 MUX_tlp_outF$enq_1__VAL_2,
		 MUX_tlp_outF$enq_1__VAL_3,
		 MUX_tlp_outF$enq_1__VAL_4,
		 MUX_tlp_outF$enq_1__VAL_5,
		 MUX_tlp_outF$enq_1__VAL_6,
		 MUX_tlp_outF$enq_1__VAL_7,
		 MUX_tlp_outF$enq_1__VAL_8;
  wire [138 : 0] MUX_tlp_tlpBRAM_mRespF$enq_1__VAL_1,
		 MUX_tlp_tlpBRAM_mRespF$enq_1__VAL_2;
  wire [129 : 0] MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_1,
		 MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_2,
		 MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_3,
		 MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_4,
		 MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_5,
		 MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_6;
  wire [128 : 0] MUX_tlp_fabMeta$write_1__VAL_1,
		 MUX_tlp_fabMeta$write_1__VAL_3,
		 MUX_wmi_mesgMeta$write_1__VAL_2;
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
		MUX_bram_0_memory$a_put_3__VAL_1,
		MUX_bram_0_memory$a_put_3__VAL_2,
		MUX_bram_1_memory$a_put_3__VAL_1,
		MUX_bram_2_memory$a_put_3__VAL_1,
		MUX_bram_3_memory$a_put_3__VAL_1,
		MUX_tlp_fabMesgAccu$write_1__VAL_2,
		MUX_tlp_fabMesgAccu$write_1__VAL_3,
		MUX_tlp_srcMesgAccu$write_1__VAL_2,
		MUX_wmi_mesgCount$write_1__VAL_1;
  wire [16 : 0] MUX_tlp_mesgComplReceived$write_1__VAL_1,
		MUX_tlp_mesgComplReceived$write_1__VAL_2,
		MUX_tlp_mesgLengthRemainPull$write_1__VAL_1,
		MUX_tlp_mesgLengthRemainPull$write_1__VAL_2,
		MUX_tlp_mesgLengthRemainPull$write_1__VAL_3,
		MUX_tlp_mesgLengthRemainPush$write_1__VAL_1,
		MUX_tlp_mesgLengthRemainPush$write_1__VAL_2,
		MUX_tlp_mesgLengthRemainPush$write_1__VAL_3;
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
		MUX_tlp_remMesgAccu$write_1__VAL_2,
		MUX_tlp_remMesgAccu$write_1__VAL_3;
  wire [13 : 0] MUX_wmi_addr$write_1__VAL_1,
		MUX_wmi_bytesRemainReq$write_1__VAL_1,
		MUX_wmi_bytesRemainReq$write_1__VAL_2,
		MUX_wmi_bytesRemainResp$write_1__VAL_2;
  wire [12 : 0] MUX_tlp_tlpBRAM_readNxtDWAddr$write_1__VAL_1,
		MUX_tlp_tlpBRAM_readNxtDWAddr$write_1__VAL_2,
		MUX_tlp_tlpBRAM_writeDWAddr$write_1__VAL_1,
		MUX_tlp_tlpBRAM_writeDWAddr$write_1__VAL_2;
  wire [10 : 0] MUX_bram_0_memory$b_put_2__VAL_1;
  wire [9 : 0] MUX_tlp_dmaPullRemainDWLen$write_1__VAL_2,
	       MUX_tlp_dmaPullRemainDWLen$write_1__VAL_3,
	       MUX_tlp_dmaPullRemainDWSub$write_1__VAL_1,
	       MUX_tlp_dmaPullRemainDWSub$write_1__VAL_2,
	       MUX_tlp_outDwRemain$write_1__VAL_1,
	       MUX_tlp_outDwRemain$write_1__VAL_2,
	       MUX_tlp_outDwRemain$write_1__VAL_3,
	       MUX_tlp_tlpBRAM_rdRespDwRemain$write_1__VAL_1,
	       MUX_tlp_tlpBRAM_rdRespDwRemain$write_1__VAL_2,
	       MUX_tlp_tlpBRAM_readRemainDWLen$write_1__VAL_1,
	       MUX_tlp_tlpBRAM_readRemainDWLen$write_1__VAL_2,
	       MUX_tlp_tlpBRAM_writeRemainDWLen$write_1__VAL_1,
	       MUX_tlp_tlpBRAM_writeRemainDWLen$write_1__VAL_2;
  wire [3 : 0] MUX_tlp_doorSeqDwell$write_1__VAL_1,
	       MUX_tlp_lastRuleFired$write_1__VAL_3,
	       MUX_tlp_postSeqDwell$write_1__VAL_1,
	       MUX_tlp_postSeqDwell$write_1__VAL_2;
  wire [1 : 0] MUX_wci_respF_cntr_r$write_1__VAL_2,
	       MUX_wmi_bufDwell$write_1__VAL_3,
	       MUX_wmi_p4B$write_1__VAL_2,
	       MUX_wmi_wmi_respF_cntr_r$write_1__VAL_2;
  wire MUX_bml_fabBufsAvail$write_1__SEL_1,
       MUX_bml_fabFlowAddr$write_1__SEL_1,
       MUX_bml_lclBufsAR$write_1__SEL_1,
       MUX_bml_lclBufsCF$write_1__SEL_1,
       MUX_bml_lclCredit$write_1__SEL_1,
       MUX_bram_0_memory$a_put_1__SEL_1,
       MUX_bram_0_memory$a_put_1__SEL_2,
       MUX_bram_0_memory$a_put_1__SEL_3,
       MUX_bram_0_memory$b_put_1__SEL_1,
       MUX_bram_0_memory$b_put_1__SEL_2,
       MUX_bram_1_memory$a_put_1__SEL_1,
       MUX_bram_1_memory$a_put_1__SEL_2,
       MUX_bram_1_memory$a_put_1__SEL_3,
       MUX_bram_1_memory$b_put_1__SEL_1,
       MUX_bram_1_memory$b_put_1__SEL_2,
       MUX_bram_2_memory$a_put_1__SEL_1,
       MUX_bram_2_memory$a_put_1__SEL_2,
       MUX_bram_2_memory$a_put_1__SEL_3,
       MUX_bram_2_memory$b_put_1__SEL_1,
       MUX_bram_2_memory$b_put_1__SEL_2,
       MUX_bram_3_memory$a_put_1__SEL_1,
       MUX_bram_3_memory$a_put_1__SEL_2,
       MUX_bram_3_memory$a_put_1__SEL_3,
       MUX_bram_3_memory$b_put_1__SEL_1,
       MUX_bram_3_memory$b_put_1__SEL_2,
       MUX_tlp_dmaDoTailEvent$write_1__VAL_1,
       MUX_tlp_fabMesgAccu$write_1__SEL_1,
       MUX_tlp_fabMeta$write_1__SEL_2,
       MUX_tlp_remDone_1$wset_1__SEL_1,
       MUX_tlp_reqMesgInFlight$write_1__VAL_2,
       MUX_tlp_tailEventF$enq_1__SEL_1,
       MUX_tlp_tlpBRAM_mReqF$enq_1__SEL_1,
       MUX_tlp_tlpBRAM_mReqF$enq_1__SEL_2,
       MUX_tlp_tlpBRAM_readHeaderSent$write_1__SEL_1,
       MUX_tlp_tlpBRAM_readStarted$write_1__SEL_1,
       MUX_tlp_tlpXmtBusy$write_1__PSEL_2,
       MUX_tlp_tlpXmtBusy$write_1__SEL_1,
       MUX_tlp_tlpXmtBusy$write_1__SEL_2,
       MUX_tlp_tlpXmtBusy$write_1__SEL_3,
       MUX_tlp_tlpXmtBusy$write_1__SEL_4,
       MUX_tlp_tlpXmtBusy$write_1__VAL_1,
       MUX_tlp_xmtMetaOK$write_1__SEL_3,
       MUX_tlp_xmtMetaOK$write_1__SEL_4,
       MUX_wci_illegalEdge$write_1__SEL_1,
       MUX_wci_illegalEdge$write_1__SEL_2,
       MUX_wci_illegalEdge$write_1__VAL_2,
       MUX_wci_respF_q_0$write_1__SEL_1,
       MUX_wci_respF_q_0$write_1__SEL_2,
       MUX_wci_respF_q_1$write_1__SEL_1,
       MUX_wci_respF_q_1$write_1__SEL_2,
       MUX_wmi_bufDwell$write_1__SEL_1,
       MUX_wmi_bytesRemainResp$write_1__SEL_1,
       MUX_wmi_doneWithMesg$write_1__PSEL_1,
       MUX_wmi_doneWithMesg$write_1__SEL_1,
       MUX_wmi_rdActive$write_1__SEL_1,
       MUX_wmi_wmi_dhF_levelsValid$write_1__SEL_2,
       MUX_wmi_wmi_mFlagF_levelsValid$write_1__SEL_2,
       MUX_wmi_wmi_reqF_levelsValid$write_1__SEL_2,
       MUX_wmi_wmi_respF_q_0$write_1__SEL_1,
       MUX_wmi_wmi_respF_q_0$write_1__SEL_2,
       MUX_wmi_wmi_respF_q_1$write_1__SEL_1,
       MUX_wmi_wmi_respF_q_1$write_1__SEL_2,
       MUX_wmi_wrActive$write_1__SEL_1,
       MUX_wmi_wrFinalize$write_1__SEL_1;
  // remaining internal signals
  reg [63 : 0] v__h15577,
	       v__h15752,
	       v__h15896,
	       v__h41005,
	       v__h43090,
	       v__h47450,
	       v__h47790,
	       v__h48409,
	       v__h48757,
	       v__h50007,
	       v__h56382,
	       v__h56506,
	       v__h56714,
	       v__h57177,
	       v__h59442,
	       v__h63835,
	       v__h64356,
	       v__h65011,
	       v__h65359,
	       v__h65522,
	       v__h70765,
	       v__h82126,
	       v__h90256,
	       v__h90725,
	       v__h90888;
  reg [31 : 0] SEL_ARR_bram_0_serverAdapterA_outData_outData__ETC___d863,
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d700,
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d708,
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d716,
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d724,
	       _theResult____h90872,
	       rdata__h83058;
  reg [15 : 0] CASE_tlp_outDwRemain_BITS_1_TO_0_0b0_0xFFFF_0b_ETC__q3;
  reg [3 : 0] CASE_tlp_lastRuleFired_1_tlp_lastRuleFired_2_t_ETC__q1;
  reg [1 : 0] lowAddr10__h29651, x__h29780, x__h29803;
  reg CASE_dpControl_BITS_1_TO_0_0_NOT_bml_fabDone_1_ETC__q5,
      CASE_dpControl_BITS_1_TO_0_0_NOT_bml_fabDone_1_ETC__q6,
      CASE_dpControl_BITS_1_TO_0_0_bml_fabDone_1_IF__ETC__q7,
      CASE_dpControl_BITS_1_TO_0_0_bml_fabDone_1_bml_ETC__q4,
      CASE_tlp_tlpBRAM_mReqF_first__16_BITS_30_TO_29_ETC___d736,
      CASE_tlp_tlpBRAM_mReqF_first__16_BITS_51_TO_50_ETC___d623,
      CASE_tlp_tlpBRAM_readReq_first__98_BITS_30_TO__ETC___d805,
      CASE_tlp_tlpBRAM_readReq_first__98_BITS_30_TO__ETC___d810,
      CASE_wmi_addr_745_BITS_3_TO_2_746_0_bram_0_ser_ETC___d1747,
      CASE_wmi_p4B_798_0_bram_0_serverAdapterB_outDa_ETC___d1802,
      SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d665,
      SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d669,
      SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d673,
      SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d677;
  wire [127 : 0] IF_tlp_fabMesgAddrMS_078_EQ_0_079_THEN_0_ELSE__ETC___d1353,
		 IF_tlp_fabMetaAddrMS_157_EQ_0_158_THEN_4_ELSE__ETC___d1248,
		 IF_tlp_tlpBRAM_readReq_first__98_BITS_30_TO_29_ETC___d929,
		 IF_tlp_tlpBRAM_readReq_first__98_BITS_30_TO_29_ETC___d934,
		 pkt__h71785,
		 rdata__h35173,
		 w_data__h47916,
		 w_data__h48052,
		 w_data__h52877,
		 w_data__h65836,
		 w_data__h66940,
		 w_data__h67186;
  wire [63 : 0] wti_nowReq_BITS_63_TO_0__q2;
  wire [31 : 0] bml_fabFlowAddr_946_PLUS_bml_fabFlowSize_947___d1948,
		mesgMeta_opcode__h81524,
		nowLS__h46239,
		nowLS__h62622,
		nowMS__h45280,
		nowMS__h61665,
		opcode__h44022,
		opcode__h60417,
		rdat__h90951,
		rdat__h90959,
		rdat__h90967,
		rdat__h90975,
		rdat__h90983,
		rdat__h90991,
		rdat__h90999,
		rdat__h91020,
		rdat__h91027,
		rdat__h91040,
		rdat__h91047,
		rdat__h91054,
		rdat__h91326,
		rdat__h91376,
		rdat__h91476,
		rdat__h91534,
		rdat__h91556,
		rdat__h91566,
		rdat__h91688,
		rdat__h91812,
		rdat__h91840,
		rdat__h91868,
		rdat__h91896,
		rdat__h91926,
		rdat__h91960,
		rdat__h91993,
		rdat__h92027,
		rresp_data__h29698,
		x3__h81484,
		x__h42208,
		x__h47258,
		x__h58352,
		x__h63608,
		y__h47623,
		y__h48181,
		y__h63989,
		y_avValue__h82907,
		y_avValue__h82927,
		y_avValue__h82947,
		y_avValue__h82967;
  wire [16 : 0] tlp_mesgLengthRemainPull_PLUS_3__q14,
		tlp_mesgLengthRemainPush_PLUS_3__q15,
		x__h47542,
		x__h63926,
		y__h47529,
		y__h47544,
		y__h63918,
		y__h63928,
		y__h65310;
  wire [15 : 0] w_be__h48508,
		x__h87600,
		x__h88728,
		x__h88733,
		x__h88840,
		x__h88877,
		x__h88959,
		x__h88964,
		x__h88998,
		x__h89003,
		y__h47671,
		y__h64598;
  wire [12 : 0] spanToNextPage__h47503,
		spanToNextPage__h63892,
		thisRequestLength__h47504,
		thisRequestLength__h63893,
		tlp_tlpBRAM_readNxtDWAddr_PLUS_1__q11,
		tlp_tlpBRAM_readNxtDWAddr_PLUS_2__q12,
		tlp_tlpBRAM_readNxtDWAddr_PLUS_3__q13,
		tlp_tlpBRAM_writeDWAddr_PLUS_1__q8,
		tlp_tlpBRAM_writeDWAddr_PLUS_2__q9,
		tlp_tlpBRAM_writeDWAddr_PLUS_3__q10,
		y__h17362,
		y__h27665;
  wire [11 : 0] byteCount__h29653, x__h29771, x__h29773, y__h29772, y__h29774;
  wire [9 : 0] y__h17428, y__h27653, y__h30729, y__h48147;
  wire [7 : 0] rreq_tag__h47719, tag__h64168, tagm__h64387;
  wire [6 : 0] lowAddr__h29652;
  wire [3 : 0] lastBE__h47950, lastBE__h64200;
  wire [2 : 0] bram_0_serverAdapterA_cnt_6_PLUS_IF_bram_0_ser_ETC___d32,
	       bram_0_serverAdapterB_cnt_5_PLUS_IF_bram_0_ser_ETC___d91,
	       bram_1_serverAdapterA_cnt_44_PLUS_IF_bram_1_se_ETC___d150,
	       bram_1_serverAdapterB_cnt_03_PLUS_IF_bram_1_se_ETC___d209,
	       bram_2_serverAdapterA_cnt_62_PLUS_IF_bram_2_se_ETC___d268,
	       bram_2_serverAdapterB_cnt_21_PLUS_IF_bram_2_se_ETC___d327,
	       bram_3_serverAdapterA_cnt_80_PLUS_IF_bram_3_se_ETC___d386,
	       bram_3_serverAdapterB_cnt_39_PLUS_IF_bram_3_se_ETC___d445;
  wire [1 : 0] ab__h10465,
	       ab__h11870,
	       ab__h1619,
	       ab__h3026,
	       ab__h4569,
	       ab__h5974,
	       ab__h7517,
	       ab__h8922,
	       idx__h21626,
	       idx__h23676,
	       idx__h24781,
	       idx__h25886,
	       idx__h27879,
	       idx__h28282,
	       idx__h28586,
	       idx__h28890,
	       tlp_tlpBRAM_readReq_first__98_BITS_30_TO_29_00_ETC___d922,
	       wci_respF_cntr_r_90_MINUS_1___d499,
	       wmi_wmi_respF_cntr_r_582_MINUS_1___d1590;
  wire IF_bml_dpControl_wget__907_BITS_1_TO_0_913_EQ__ETC___d1993,
       IF_bml_dpControl_wget__907_BITS_3_TO_2_908_EQ__ETC___d2004,
       NOT_SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_5_ETC___d681,
       NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_1_55___d656,
       NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_2_57___d658,
       NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_3_59___d660,
       NOT_wmi_wrActive_717_718_OR_NOT_wmi_rdActive_7_ETC___d1727,
       _dfoo1,
       _dfoo3,
       _dfoo5,
       _dfoo7,
       _dfoo9,
       bml_crdBuf_value_889_EQ_bml_crdBuf_modulus_bw__ETC___d1891,
       bml_fabBuf_value_874_EQ_bml_fabBuf_modulus_bw__ETC___d1876,
       bml_lclBufDone_931_AND_IF_bml_dpControl_wget___ETC___d2012,
       bml_lclBuf_value_844_EQ_bml_lclBuf_modulus_bw__ETC___d1846,
       bml_remBuf_value_859_EQ_bml_remBuf_modulus_bw__ETC___d1861,
       bram_0_serverAdapterA_cnt_6_SLT_3___d619,
       bram_0_serverAdapterA_outDataCore_notEmpty_OR__ETC___d887,
       bram_0_serverAdapterB_cnt_5_SLT_3___d1666,
       bram_1_serverAdapterA_cnt_44_SLT_3___d620,
       bram_1_serverAdapterB_cnt_03_SLT_3___d1667,
       bram_1_serverAdapterB_outData_outData_whas__68_ETC___d1695,
       bram_2_serverAdapterA_cnt_62_SLT_3___d621,
       bram_2_serverAdapterA_outDataCore_notEmpty__38_ETC___d885,
       bram_2_serverAdapterB_cnt_21_SLT_3___d1668,
       bram_3_serverAdapterA_cnt_80_SLT_3___d622,
       bram_3_serverAdapterB_cnt_39_SLT_3___d1669,
       hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1233,
       hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1274,
       hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1326,
       hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1365,
       hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1385,
       hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1410,
       hasPush_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1058,
       hasPush_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1098,
       hasPush_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1155,
       hasPush_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d985,
       tlp_dmaPullRemainDWLen_373_ULE_tlp_dmaPullRema_ETC___d1395,
       tlp_dmaPullRemainDWSub_387_ULE_4___d1388,
       tlp_inF_first__259_BITS_63_TO_56_262_EQ_pciDev_ETC___d1272,
       tlp_inF_first__259_BIT_152_462_AND_NOT_tlp_inF_ETC___d1487,
       tlp_outDwRemain_129_ULE_4___d1130,
       tlp_tlpBRAM_mRespF_first__000_BITS_71_TO_62_10_ETC___d1102,
       tlp_tlpBRAM_mRespF_i_notFull__97_AND_tlp_tlpBR_ETC___d813,
       tlp_tlpBRAM_rdRespDwRemain_16_ULE_4___d918,
       tlp_tlpBRAM_readRemainDWLen_74_ULE_4___d775,
       wmi_dpControl_whas__653_AND_bram_0_serverAdapt_ETC___d1699,
       wmi_wmi_operateD_606_AND_wmi_wmi_peerIsReady_6_ETC___d1777;
  // value method wci_s_sResp
  assign wci_s_SResp = wci_respF_q_0[33:32] ;
  // value method wci_s_sData
  assign wci_s_SData = wci_respF_q_0[31:0] ;
  // value method wci_s_sThreadBusy
  assign wci_s_SThreadBusy =
	     wci_reqF_countReg > 2'd1 || wci_isReset_isInReset ;
  // value method wci_s_sFlag
  assign wci_s_SFlag = { 1'd1, wci_sFlagReg } ;
  // value method wti_s_sThreadBusy
  assign wti_s_SThreadBusy = wti_isReset_isInReset ;
  // value method wti_s_sReset_n
  assign wti_s_SReset_n = !wti_isReset_isInReset && wti_operateD ;
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
  assign RDY_server_request_put = tlp_inF$FULL_N ;
  // actionvalue method server_response_get
  assign server_response_get = tlp_outF$D_OUT ;
  assign RDY_server_response_get = tlp_outF$EMPTY_N ;
  // submodule bram_0_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd11),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(12'd2048)) bram_0_memory(.CLKA(CLK),
					    .CLKB(CLK),
					    .ADDRA(bram_0_memory$ADDRA),
					    .ADDRB(bram_0_memory$ADDRB),
					    .DIA(bram_0_memory$DIA),
					    .DIB(bram_0_memory$DIB),
					    .WEA(bram_0_memory$WEA),
					    .WEB(bram_0_memory$WEB),
					    .ENA(bram_0_memory$ENA),
					    .ENB(bram_0_memory$ENB),
					    .DOA(bram_0_memory$DOA),
					    .DOB(bram_0_memory$DOB));
  // submodule bram_0_serverAdapterA_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_0_serverAdapterA_outDataCore(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(bram_0_serverAdapterA_outDataCore$D_IN),
								 .ENQ(bram_0_serverAdapterA_outDataCore$ENQ),
								 .DEQ(bram_0_serverAdapterA_outDataCore$DEQ),
								 .CLR(bram_0_serverAdapterA_outDataCore$CLR),
								 .D_OUT(bram_0_serverAdapterA_outDataCore$D_OUT),
								 .FULL_N(bram_0_serverAdapterA_outDataCore$FULL_N),
								 .EMPTY_N(bram_0_serverAdapterA_outDataCore$EMPTY_N));
  // submodule bram_0_serverAdapterB_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_0_serverAdapterB_outDataCore(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(bram_0_serverAdapterB_outDataCore$D_IN),
								 .ENQ(bram_0_serverAdapterB_outDataCore$ENQ),
								 .DEQ(bram_0_serverAdapterB_outDataCore$DEQ),
								 .CLR(bram_0_serverAdapterB_outDataCore$CLR),
								 .D_OUT(bram_0_serverAdapterB_outDataCore$D_OUT),
								 .FULL_N(bram_0_serverAdapterB_outDataCore$FULL_N),
								 .EMPTY_N(bram_0_serverAdapterB_outDataCore$EMPTY_N));
  // submodule bram_1_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd11),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(12'd2048)) bram_1_memory(.CLKA(CLK),
					    .CLKB(CLK),
					    .ADDRA(bram_1_memory$ADDRA),
					    .ADDRB(bram_1_memory$ADDRB),
					    .DIA(bram_1_memory$DIA),
					    .DIB(bram_1_memory$DIB),
					    .WEA(bram_1_memory$WEA),
					    .WEB(bram_1_memory$WEB),
					    .ENA(bram_1_memory$ENA),
					    .ENB(bram_1_memory$ENB),
					    .DOA(bram_1_memory$DOA),
					    .DOB(bram_1_memory$DOB));
  // submodule bram_1_serverAdapterA_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_1_serverAdapterA_outDataCore(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(bram_1_serverAdapterA_outDataCore$D_IN),
								 .ENQ(bram_1_serverAdapterA_outDataCore$ENQ),
								 .DEQ(bram_1_serverAdapterA_outDataCore$DEQ),
								 .CLR(bram_1_serverAdapterA_outDataCore$CLR),
								 .D_OUT(bram_1_serverAdapterA_outDataCore$D_OUT),
								 .FULL_N(bram_1_serverAdapterA_outDataCore$FULL_N),
								 .EMPTY_N(bram_1_serverAdapterA_outDataCore$EMPTY_N));
  // submodule bram_1_serverAdapterB_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_1_serverAdapterB_outDataCore(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(bram_1_serverAdapterB_outDataCore$D_IN),
								 .ENQ(bram_1_serverAdapterB_outDataCore$ENQ),
								 .DEQ(bram_1_serverAdapterB_outDataCore$DEQ),
								 .CLR(bram_1_serverAdapterB_outDataCore$CLR),
								 .D_OUT(bram_1_serverAdapterB_outDataCore$D_OUT),
								 .FULL_N(bram_1_serverAdapterB_outDataCore$FULL_N),
								 .EMPTY_N(bram_1_serverAdapterB_outDataCore$EMPTY_N));
  // submodule bram_2_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd11),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(12'd2048)) bram_2_memory(.CLKA(CLK),
					    .CLKB(CLK),
					    .ADDRA(bram_2_memory$ADDRA),
					    .ADDRB(bram_2_memory$ADDRB),
					    .DIA(bram_2_memory$DIA),
					    .DIB(bram_2_memory$DIB),
					    .WEA(bram_2_memory$WEA),
					    .WEB(bram_2_memory$WEB),
					    .ENA(bram_2_memory$ENA),
					    .ENB(bram_2_memory$ENB),
					    .DOA(bram_2_memory$DOA),
					    .DOB(bram_2_memory$DOB));
  // submodule bram_2_serverAdapterA_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_2_serverAdapterA_outDataCore(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(bram_2_serverAdapterA_outDataCore$D_IN),
								 .ENQ(bram_2_serverAdapterA_outDataCore$ENQ),
								 .DEQ(bram_2_serverAdapterA_outDataCore$DEQ),
								 .CLR(bram_2_serverAdapterA_outDataCore$CLR),
								 .D_OUT(bram_2_serverAdapterA_outDataCore$D_OUT),
								 .FULL_N(bram_2_serverAdapterA_outDataCore$FULL_N),
								 .EMPTY_N(bram_2_serverAdapterA_outDataCore$EMPTY_N));
  // submodule bram_2_serverAdapterB_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_2_serverAdapterB_outDataCore(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(bram_2_serverAdapterB_outDataCore$D_IN),
								 .ENQ(bram_2_serverAdapterB_outDataCore$ENQ),
								 .DEQ(bram_2_serverAdapterB_outDataCore$DEQ),
								 .CLR(bram_2_serverAdapterB_outDataCore$CLR),
								 .D_OUT(bram_2_serverAdapterB_outDataCore$D_OUT),
								 .FULL_N(bram_2_serverAdapterB_outDataCore$FULL_N),
								 .EMPTY_N(bram_2_serverAdapterB_outDataCore$EMPTY_N));
  // submodule bram_3_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd11),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(12'd2048)) bram_3_memory(.CLKA(CLK),
					    .CLKB(CLK),
					    .ADDRA(bram_3_memory$ADDRA),
					    .ADDRB(bram_3_memory$ADDRB),
					    .DIA(bram_3_memory$DIA),
					    .DIB(bram_3_memory$DIB),
					    .WEA(bram_3_memory$WEA),
					    .WEB(bram_3_memory$WEB),
					    .ENA(bram_3_memory$ENA),
					    .ENB(bram_3_memory$ENB),
					    .DOA(bram_3_memory$DOA),
					    .DOB(bram_3_memory$DOB));
  // submodule bram_3_serverAdapterA_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_3_serverAdapterA_outDataCore(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(bram_3_serverAdapterA_outDataCore$D_IN),
								 .ENQ(bram_3_serverAdapterA_outDataCore$ENQ),
								 .DEQ(bram_3_serverAdapterA_outDataCore$DEQ),
								 .CLR(bram_3_serverAdapterA_outDataCore$CLR),
								 .D_OUT(bram_3_serverAdapterA_outDataCore$D_OUT),
								 .FULL_N(bram_3_serverAdapterA_outDataCore$FULL_N),
								 .EMPTY_N(bram_3_serverAdapterA_outDataCore$EMPTY_N));
  // submodule bram_3_serverAdapterB_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) bram_3_serverAdapterB_outDataCore(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(bram_3_serverAdapterB_outDataCore$D_IN),
								 .ENQ(bram_3_serverAdapterB_outDataCore$ENQ),
								 .DEQ(bram_3_serverAdapterB_outDataCore$DEQ),
								 .CLR(bram_3_serverAdapterB_outDataCore$CLR),
								 .D_OUT(bram_3_serverAdapterB_outDataCore$D_OUT),
								 .FULL_N(bram_3_serverAdapterB_outDataCore$FULL_N),
								 .EMPTY_N(bram_3_serverAdapterB_outDataCore$EMPTY_N));
  // submodule tlp_inF
  arSRLFIFOD #(.width(32'd153), .l2depth(32'd4)) tlp_inF(.CLK(CLK),
							 .RST_N(RST_N),
							 .D_IN(tlp_inF$D_IN),
							 .ENQ(tlp_inF$ENQ),
							 .DEQ(tlp_inF$DEQ),
							 .CLR(tlp_inF$CLR),
							 .D_OUT(tlp_inF$D_OUT),
							 .FULL_N(tlp_inF$FULL_N),
							 .EMPTY_N(tlp_inF$EMPTY_N));
  // submodule tlp_outF
  arSRLFIFOD #(.width(32'd153), .l2depth(32'd4)) tlp_outF(.CLK(CLK),
							  .RST_N(RST_N),
							  .D_IN(tlp_outF$D_IN),
							  .ENQ(tlp_outF$ENQ),
							  .DEQ(tlp_outF$DEQ),
							  .CLR(tlp_outF$CLR),
							  .D_OUT(tlp_outF$D_OUT),
							  .FULL_N(tlp_outF$FULL_N),
							  .EMPTY_N(tlp_outF$EMPTY_N));
  // submodule tlp_tailEventF
  FIFO2 #(.width(32'd1), .guarded(32'd1)) tlp_tailEventF(.RST(RST_N),
							 .CLK(CLK),
							 .D_IN(tlp_tailEventF$D_IN),
							 .ENQ(tlp_tailEventF$ENQ),
							 .DEQ(tlp_tailEventF$DEQ),
							 .CLR(tlp_tailEventF$CLR),
							 .D_OUT(tlp_tailEventF$D_OUT),
							 .FULL_N(tlp_tailEventF$FULL_N),
							 .EMPTY_N(tlp_tailEventF$EMPTY_N));
  // submodule tlp_tlpBRAM_mReqF
  FIFO2 #(.width(32'd130), .guarded(32'd1)) tlp_tlpBRAM_mReqF(.RST(RST_N),
							      .CLK(CLK),
							      .D_IN(tlp_tlpBRAM_mReqF$D_IN),
							      .ENQ(tlp_tlpBRAM_mReqF$ENQ),
							      .DEQ(tlp_tlpBRAM_mReqF$DEQ),
							      .CLR(tlp_tlpBRAM_mReqF$CLR),
							      .D_OUT(tlp_tlpBRAM_mReqF$D_OUT),
							      .FULL_N(tlp_tlpBRAM_mReqF$FULL_N),
							      .EMPTY_N(tlp_tlpBRAM_mReqF$EMPTY_N));
  // submodule tlp_tlpBRAM_mRespF
  FIFO2 #(.width(32'd139), .guarded(32'd1)) tlp_tlpBRAM_mRespF(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(tlp_tlpBRAM_mRespF$D_IN),
							       .ENQ(tlp_tlpBRAM_mRespF$ENQ),
							       .DEQ(tlp_tlpBRAM_mRespF$DEQ),
							       .CLR(tlp_tlpBRAM_mRespF$CLR),
							       .D_OUT(tlp_tlpBRAM_mRespF$D_OUT),
							       .FULL_N(tlp_tlpBRAM_mRespF$FULL_N),
							       .EMPTY_N(tlp_tlpBRAM_mRespF$EMPTY_N));
  // submodule tlp_tlpBRAM_readReq
  FIFO2 #(.width(32'd61), .guarded(32'd1)) tlp_tlpBRAM_readReq(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(tlp_tlpBRAM_readReq$D_IN),
							       .ENQ(tlp_tlpBRAM_readReq$ENQ),
							       .DEQ(tlp_tlpBRAM_readReq$DEQ),
							       .CLR(tlp_tlpBRAM_readReq$CLR),
							       .D_OUT(tlp_tlpBRAM_readReq$D_OUT),
							       .FULL_N(tlp_tlpBRAM_readReq$FULL_N),
							       .EMPTY_N(tlp_tlpBRAM_readReq$EMPTY_N));
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
  // rule RL_bram_2_serverAdapterA_outData_setFirstEnq
  assign WILL_FIRE_RL_bram_2_serverAdapterA_outData_setFirstEnq =
	     !bram_2_serverAdapterA_outDataCore$EMPTY_N &&
	     bram_2_serverAdapterA_outData_enqData$whas ;
  // rule RL_wci_cfrd
  assign WILL_FIRE_RL_wci_cfrd =
	     wci_respF_cntr_r != 2'd2 && wci_reqF$EMPTY_N &&
	     wci_wci_cfrd_pw$whas &&
	     !WILL_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_ctl_op_start
  assign WILL_FIRE_RL_wci_ctl_op_start =
	     wci_reqF$EMPTY_N && wci_wci_ctrl_pw$whas &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_tlp_dmaRequestNearMeta
  assign WILL_FIRE_RL_tlp_dmaRequestNearMeta =
	     tlp_tlpBRAM_mReqF$FULL_N &&
	     hasPush_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d985 &&
	     tlp_farBufReady &&
	     tlp_postSeqDwell == 4'd0 ;
  // rule RL_tlp_dmaPushRequestMesg
  assign WILL_FIRE_RL_tlp_dmaPushRequestMesg =
	     tlp_tlpBRAM_mReqF$FULL_N &&
	     hasPush_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1058 &&
	     !WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ;
  // rule RL_tlp_dmaResponseNearMetaHead
  assign WILL_FIRE_RL_tlp_dmaResponseNearMetaHead =
	     tlp_tlpBRAM_mRespF$EMPTY_N && hasPush &&
	     dpControl[7:4] == 4'd0 &&
	     dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     !tlp_tlpBRAM_mRespF$D_OUT[138] &&
	     tlp_tlpBRAM_mRespF$D_OUT[89:88] == 2'd3 ;
  // rule RL_tlp_dmaPushResponseHeader
  assign WILL_FIRE_RL_tlp_dmaPushResponseHeader =
	     tlp_outF$FULL_N && tlp_tlpBRAM_mRespF$EMPTY_N &&
	     hasPush_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1098 ;
  // rule RL_tlp_dmaPushResponseBody
  assign WILL_FIRE_RL_tlp_dmaPushResponseBody =
	     tlp_outF$FULL_N && tlp_tlpBRAM_mRespF$EMPTY_N && hasPush &&
	     dpControl[7:4] == 4'd0 &&
	     dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     tlp_tlpBRAM_mRespF$D_OUT[138] &&
	     tlp_tlpBRAM_mRespF$D_OUT[137:136] == 2'd2 ;
  // rule RL_tlp_dmaXmtMetaHead
  assign WILL_FIRE_RL_tlp_dmaXmtMetaHead =
	     tlp_outF$FULL_N &&
	     hasPush_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1155 &&
	     !WILL_FIRE_RL_tlp_dmaPushResponseBody &&
	     !WILL_FIRE_RL_tlp_dmaPushResponseHeader ;
  // rule RL_tlp_dmaXmtTailEvent
  assign WILL_FIRE_RL_tlp_dmaXmtTailEvent =
	     tlp_tailEventF$FULL_N && hasPush && dpControl[7:4] == 4'd0 &&
	     dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     tlp_fabMeta[128] &&
	     tlp_tlpMetaSent ;
  // rule RL_tlp_dmaXmtMetaBody
  assign CAN_FIRE_RL_tlp_dmaXmtMetaBody =
	     tlp_outF$FULL_N && hasPush && dpControl[7:4] == 4'd0 &&
	     dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     tlp_fabMeta[128] &&
	     tlp_doXmtMetaBody ;
  assign WILL_FIRE_RL_tlp_dmaXmtMetaBody =
	     CAN_FIRE_RL_tlp_dmaXmtMetaBody &&
	     !WILL_FIRE_RL_tlp_dmaXmtMetaHead &&
	     !WILL_FIRE_RL_tlp_dmaPushResponseBody &&
	     !WILL_FIRE_RL_tlp_dmaPushResponseHeader ;
  // rule RL_tlp_dmaXmtDoorbell
  assign WILL_FIRE_RL_tlp_dmaXmtDoorbell =
	     tlp_tailEventF$FULL_N && dpControl[1:0] == 2'd2 &&
	     tlp_creditReady &&
	     tlp_doorSeqDwell == 4'd0 ;
  // rule RL_tlp_dmaRespHeadFarMeta
  assign WILL_FIRE_RL_tlp_dmaRespHeadFarMeta =
	     tlp_inF$EMPTY_N && tlp_tlpBRAM_mReqF$FULL_N &&
	     hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1274 ;
  // rule RL_tlp_dmaPullTailEvent
  assign WILL_FIRE_RL_tlp_dmaPullTailEvent =
	     tlp_tailEventF$FULL_N &&
	     hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1410 ;
  // rule RL_tlp_dmaRespBodyFarMeta
  assign CAN_FIRE_RL_tlp_dmaRespBodyFarMeta =
	     tlp_inF$EMPTY_N && tlp_tlpBRAM_mReqF$FULL_N && hasPull &&
	     dpControl[7:4] == 4'd0 &&
	     dpControl[3:2] == 2'd2 &&
	     dpControl[1:0] == 2'd1 &&
	     tlp_reqMetaBodyInFlight &&
	     !tlp_tlpRcvBusy ;
  assign WILL_FIRE_RL_tlp_dmaRespBodyFarMeta =
	     CAN_FIRE_RL_tlp_dmaRespBodyFarMeta &&
	     !WILL_FIRE_RL_tlp_dmaRespHeadFarMeta ;
  // rule RL_tlp_dmaPullResponseHeader
  assign WILL_FIRE_RL_tlp_dmaPullResponseHeader =
	     tlp_inF$EMPTY_N && tlp_tlpBRAM_mReqF$FULL_N &&
	     hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1365 &&
	     !WILL_FIRE_RL_tlp_dmaRespBodyFarMeta &&
	     !WILL_FIRE_RL_tlp_dmaRespHeadFarMeta ;
  // rule RL_tlp_dmaPullResponseBody
  assign WILL_FIRE_RL_tlp_dmaPullResponseBody =
	     tlp_inF$EMPTY_N && tlp_tlpBRAM_mReqF$FULL_N &&
	     hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1385 &&
	     !WILL_FIRE_RL_tlp_dmaRespBodyFarMeta &&
	     !WILL_FIRE_RL_tlp_dmaRespHeadFarMeta ;
  // rule RL_tlp_dmaTailEventSender
  assign CAN_FIRE_RL_tlp_dmaTailEventSender =
	     tlp_outF$FULL_N && tlp_tailEventF$EMPTY_N &&
	     (!tlp_tlpXmtBusy && !tlp_sentTail4DWHeader &&
	      tlp_postSeqDwell == 4'd0 ||
	      tlp_tlpXmtBusy && tlp_sentTail4DWHeader) ;
  assign WILL_FIRE_RL_tlp_dmaTailEventSender =
	     CAN_FIRE_RL_tlp_dmaTailEventSender &&
	     !WILL_FIRE_RL_tlp_dmaPullRequestFarMesg &&
	     !WILL_FIRE_RL_tlp_dmaRequestFarMeta &&
	     !(tlp_postSeqDwell != 4'd0) &&
	     !WILL_FIRE_RL_tlp_dmaXmtMetaBody &&
	     !WILL_FIRE_RL_tlp_dmaXmtMetaHead &&
	     !WILL_FIRE_RL_tlp_dmaPushResponseBody &&
	     !WILL_FIRE_RL_tlp_dmaPushResponseHeader ;
  // rule RL_tlp_tlpRcv
  assign CAN_FIRE_RL_tlp_tlpRcv =
	     tlp_inF$EMPTY_N &&
	     (tlp_inF$D_OUT[152] ?
		tlp_inF$D_OUT[110] || tlp_inF$D_OUT[125] ||
		tlp_inF$D_OUT[124:120] != 5'b0 ||
		tlp_tlpBRAM_mReqF$FULL_N :
		tlp_inIgnorePkt || tlp_tlpBRAM_mReqF$FULL_N) &&
	     !tlp_reqMetaInFlight &&
	     !tlp_reqMesgInFlight &&
	     !tlp_reqMetaBodyInFlight ;
  assign WILL_FIRE_RL_tlp_tlpRcv =
	     CAN_FIRE_RL_tlp_tlpRcv && !WILL_FIRE_RL_tlp_dmaPushRequestMesg &&
	     !WILL_FIRE_RL_tlp_dmaRequestNearMeta ;
  // rule RL_tlp_dmaResponseNearMetaBody
  assign WILL_FIRE_RL_tlp_dmaResponseNearMetaBody =
	     tlp_tlpBRAM_mRespF$EMPTY_N && hasPush &&
	     dpControl[7:4] == 4'd0 &&
	     dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     tlp_tlpBRAM_mRespF$D_OUT[138] &&
	     tlp_tlpBRAM_mRespF$D_OUT[137:136] == 2'd3 ;
  // rule RL_tlp_dmaRequestFarMeta
  assign WILL_FIRE_RL_tlp_dmaRequestFarMeta =
	     tlp_outF$FULL_N &&
	     hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1233 &&
	     tlp_nearBufReady &&
	     tlp_farBufReady &&
	     tlp_postSeqDwell == 4'd0 ;
  // rule RL_tlp_dmaPullRequestFarMesg
  assign WILL_FIRE_RL_tlp_dmaPullRequestFarMesg =
	     tlp_outF$FULL_N &&
	     hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1326 &&
	     !WILL_FIRE_RL_tlp_dmaRespBodyFarMeta &&
	     !WILL_FIRE_RL_tlp_dmaRespHeadFarMeta ;
  // rule RL_tlp_dataXmt_Header
  assign WILL_FIRE_RL_tlp_dataXmt_Header =
	     tlp_outF$FULL_N && tlp_tlpBRAM_mRespF$EMPTY_N &&
	     !tlp_tlpBRAM_mRespF$D_OUT[138] &&
	     tlp_tlpBRAM_mRespF$D_OUT[89:88] == 2'd1 &&
	     !tlp_tlpXmtBusy &&
	     !WILL_FIRE_RL_tlp_dmaTailEventSender &&
	     !WILL_FIRE_RL_tlp_dmaPullRequestFarMesg &&
	     !WILL_FIRE_RL_tlp_dmaRequestFarMeta &&
	     !WILL_FIRE_RL_tlp_dmaXmtMetaBody &&
	     !WILL_FIRE_RL_tlp_dmaXmtMetaHead ;
  // rule RL_tlp_dataXmt_Body
  assign WILL_FIRE_RL_tlp_dataXmt_Body =
	     tlp_outF$FULL_N && tlp_tlpBRAM_mRespF$EMPTY_N &&
	     tlp_tlpBRAM_mRespF$D_OUT[138] &&
	     tlp_tlpBRAM_mRespF$D_OUT[137:136] == 2'd1 &&
	     !WILL_FIRE_RL_tlp_dmaTailEventSender &&
	     !WILL_FIRE_RL_tlp_dmaPullRequestFarMesg &&
	     !WILL_FIRE_RL_tlp_dmaRequestFarMeta &&
	     !WILL_FIRE_RL_tlp_dmaXmtMetaBody &&
	     !WILL_FIRE_RL_tlp_dmaXmtMetaHead ;
  // rule RL_tlp_tlpBRAM_writeReq
  assign WILL_FIRE_RL_tlp_tlpBRAM_writeReq =
	     tlp_tlpBRAM_mReqF$EMPTY_N &&
	     (tlp_tlpBRAM_mReqF$D_OUT[63] ||
	      CASE_tlp_tlpBRAM_mReqF_first__16_BITS_51_TO_50_ETC___d623) &&
	     tlp_tlpBRAM_mReqF$D_OUT[129:128] == 2'd0 ;
  // rule RL_tlp_tlpBRAM_writeData
  assign WILL_FIRE_RL_tlp_tlpBRAM_writeData =
	     tlp_tlpBRAM_mReqF$EMPTY_N &&
	     (!SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d665 ||
	      bram_0_serverAdapterA_cnt_6_SLT_3___d619) &&
	     NOT_SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_5_ETC___d681 &&
	     tlp_tlpBRAM_mReqF$D_OUT[129:128] == 2'd1 ;
  // rule RL_tlp_tlpBRAM_read_FirstReq
  assign WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq =
	     tlp_tlpBRAM_mReqF$EMPTY_N && tlp_tlpBRAM_readReq$FULL_N &&
	     (tlp_tlpBRAM_mReqF$D_OUT[60] ||
	      CASE_tlp_tlpBRAM_mReqF_first__16_BITS_30_TO_29_ETC___d736) &&
	     !tlp_tlpBRAM_readStarted &&
	     tlp_tlpBRAM_mReqF$D_OUT[129:128] != 2'd0 &&
	     tlp_tlpBRAM_mReqF$D_OUT[129:128] != 2'd1 ;
  // rule RL_tlp_tlpBRAM_read_NextReq
  assign WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq =
	     bram_0_serverAdapterA_cnt_6_SLT_3___d619 &&
	     bram_1_serverAdapterA_cnt_44_SLT_3___d620 &&
	     bram_2_serverAdapterA_cnt_62_SLT_3___d621 &&
	     bram_3_serverAdapterA_cnt_80_SLT_3___d622 &&
	     tlp_tlpBRAM_mReqF$EMPTY_N &&
	     tlp_tlpBRAM_readStarted &&
	     tlp_tlpBRAM_mReqF$D_OUT[129:128] != 2'd0 &&
	     tlp_tlpBRAM_mReqF$D_OUT[129:128] != 2'd1 ;
  // rule RL_tlp_tlpBRAM_read_FirstResp
  assign WILL_FIRE_RL_tlp_tlpBRAM_read_FirstResp =
	     tlp_tlpBRAM_readReq$EMPTY_N &&
	     tlp_tlpBRAM_mRespF_i_notFull__97_AND_tlp_tlpBR_ETC___d813 &&
	     !tlp_tlpBRAM_readHeaderSent ;
  // rule RL_tlp_tlpBRAM_read_NextResp
  assign WILL_FIRE_RL_tlp_tlpBRAM_read_NextResp =
	     tlp_tlpBRAM_readReq$EMPTY_N &&
	     bram_0_serverAdapterA_outDataCore_notEmpty_OR__ETC___d887 &&
	     tlp_tlpBRAM_readHeaderSent ;
  // rule RL_bram_0_serverAdapterA_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_0_serverAdapterA_outData_enqAndDeq =
	     bram_0_serverAdapterA_outDataCore$EMPTY_N &&
	     bram_0_serverAdapterA_outDataCore$FULL_N &&
	     bram_0_serverAdapterA_outData_deqCalled$whas &&
	     bram_0_serverAdapterA_outData_enqData$whas ;
  // rule RL_bram_1_serverAdapterA_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_1_serverAdapterA_outData_enqAndDeq =
	     bram_1_serverAdapterA_outDataCore$EMPTY_N &&
	     bram_1_serverAdapterA_outDataCore$FULL_N &&
	     bram_1_serverAdapterA_outData_deqCalled$whas &&
	     bram_1_serverAdapterA_outData_enqData$whas ;
  // rule RL_bram_2_serverAdapterA_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_2_serverAdapterA_outData_enqAndDeq =
	     bram_2_serverAdapterA_outDataCore$EMPTY_N &&
	     bram_2_serverAdapterA_outDataCore$FULL_N &&
	     bram_2_serverAdapterA_outData_deqCalled$whas &&
	     bram_2_serverAdapterA_outData_enqData$whas ;
  // rule RL_bram_3_serverAdapterA_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_3_serverAdapterA_outData_enqAndDeq =
	     bram_3_serverAdapterA_outDataCore$EMPTY_N &&
	     bram_3_serverAdapterA_outDataCore$FULL_N &&
	     bram_3_serverAdapterA_outData_deqCalled$whas &&
	     bram_3_serverAdapterA_outData_enqData$whas ;
  // rule RL_wmi_reqMetadata
  assign CAN_FIRE_RL_wmi_reqMetadata =
	     bram_0_serverAdapterB_cnt_5_SLT_3___d1666 &&
	     bram_1_serverAdapterB_cnt_03_SLT_3___d1667 &&
	     bram_2_serverAdapterB_cnt_21_SLT_3___d1668 &&
	     bram_3_serverAdapterB_cnt_39_SLT_3___d1669 &&
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
	     wmi_wmi_operateD_606_AND_wmi_wmi_peerIsReady_6_ETC___d1777 &&
	     wmi_wrFinalize ;
  // rule RL_wmi_respMetadata
  assign CAN_FIRE_RL_wmi_respMetadata =
	     wmi_wmi_operateD && wmi_wmi_peerIsReady &&
	     wmi_dpControl_whas__653_AND_bram_0_serverAdapt_ETC___d1699 &&
	     dpControl[3:2] != 2'd1 &&
	     !wmi_mesgMeta[128] &&
	     wmi_mesgBufReady &&
	     wmi_metaBusy ;
  assign WILL_FIRE_RL_wmi_respMetadata =
	     CAN_FIRE_RL_wmi_respMetadata && !WILL_FIRE_RL_wmi_doReadResp ;
  // rule RL_wmi_doReadReq
  assign WILL_FIRE_RL_wmi_doReadReq =
	     CASE_wmi_addr_745_BITS_3_TO_2_746_0_bram_0_ser_ETC___d1747 &&
	     wmi_rdActive &&
	     !WILL_FIRE_RL_wmi_doWriteReq &&
	     !WILL_FIRE_RL_wmi_doWriteFinalize ;
  // rule RL_wmi_doReadResp
  assign WILL_FIRE_RL_wmi_doReadResp =
	     wmi_wmi_respF_cntr_r != 2'd2 && wmi_wmi_operateD &&
	     wmi_wmi_peerIsReady &&
	     CASE_wmi_p4B_798_0_bram_0_serverAdapterB_outDa_ETC___d1802 &&
	     wmi_bytesRemainResp != 14'd0 ;
  // rule RL_bram_0_serverAdapterB_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_0_serverAdapterB_outData_enqAndDeq =
	     bram_0_serverAdapterB_outDataCore$EMPTY_N &&
	     bram_0_serverAdapterB_outDataCore$FULL_N &&
	     bram_0_serverAdapterB_outData_deqCalled$whas &&
	     bram_0_serverAdapterB_outData_enqData$whas ;
  // rule RL_bram_1_serverAdapterB_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_1_serverAdapterB_outData_enqAndDeq =
	     bram_1_serverAdapterB_outDataCore$EMPTY_N &&
	     bram_1_serverAdapterB_outDataCore$FULL_N &&
	     bram_1_serverAdapterB_outData_deqCalled$whas &&
	     bram_1_serverAdapterB_outData_enqData$whas ;
  // rule RL_bram_2_serverAdapterB_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_2_serverAdapterB_outData_enqAndDeq =
	     bram_2_serverAdapterB_outDataCore$EMPTY_N &&
	     bram_2_serverAdapterB_outDataCore$FULL_N &&
	     bram_2_serverAdapterB_outData_deqCalled$whas &&
	     bram_2_serverAdapterB_outData_enqData$whas ;
  // rule RL_bram_3_serverAdapterB_outData_enqAndDeq
  assign WILL_FIRE_RL_bram_3_serverAdapterB_outData_enqAndDeq =
	     bram_3_serverAdapterB_outDataCore$EMPTY_N &&
	     bram_3_serverAdapterB_outDataCore$FULL_N &&
	     bram_3_serverAdapterB_outData_deqCalled$whas &&
	     bram_3_serverAdapterB_outData_enqData$whas ;
  // rule RL_wmi_getRequest
  assign CAN_FIRE_RL_wmi_getRequest =
	     wmi_wmi_operateD && wmi_wmi_peerIsReady && !wmi_wmi_blockReq &&
	     wmi_wmi_reqF$EMPTY_N &&
	     NOT_wmi_wrActive_717_718_OR_NOT_wmi_rdActive_7_ETC___d1727 &&
	     wmi_bufDwell == 2'd0 ;
  assign WILL_FIRE_RL_wmi_getRequest =
	     CAN_FIRE_RL_wmi_getRequest && !WILL_FIRE_RL_wmi_doReadReq &&
	     !WILL_FIRE_RL_wmi_doWriteReq ;
  // rule RL_wmi_doWriteReq
  assign CAN_FIRE_RL_wmi_doWriteReq =
	     wmi_wmi_operateD && wmi_wmi_peerIsReady && wmi_wmi_dhF$EMPTY_N &&
	     CASE_wmi_addr_745_BITS_3_TO_2_746_0_bram_0_ser_ETC___d1747 &&
	     wmi_wrActive ;
  assign WILL_FIRE_RL_wmi_doWriteReq =
	     CAN_FIRE_RL_wmi_doWriteReq && !WILL_FIRE_RL_wmi_doWriteFinalize ;
  // rule RL_wmi_wmi_respF_incCtr
  assign WILL_FIRE_RL_wmi_wmi_respF_incCtr =
	     WILL_FIRE_RL_wmi_doReadResp && WILL_FIRE_RL_wmi_doReadResp &&
	     !(wmi_wmi_respF_cntr_r != 2'd0) ;
  // rule RL_wmi_wmi_respF_decCtr
  assign WILL_FIRE_RL_wmi_wmi_respF_decCtr =
	     wmi_wmi_respF_cntr_r != 2'd0 && !WILL_FIRE_RL_wmi_doReadResp ;
  // rule RL_wmi_wmi_respF_both
  assign WILL_FIRE_RL_wmi_wmi_respF_both =
	     WILL_FIRE_RL_wmi_doReadResp && wmi_wmi_respF_cntr_r != 2'd0 &&
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
	     wci_respF_cntr_r != 2'd2 && wci_reqF$EMPTY_N &&
	     wci_wci_cfwr_pw$whas &&
	     !WILL_FIRE_RL_wci_ctl_op_start &&
	     !WILL_FIRE_RL_wci_ctl_op_complete ;
  // rule RL_wci_ctl_op_complete
  assign WILL_FIRE_RL_wci_ctl_op_complete =
	     wci_respF_cntr_r != 2'd2 && wci_ctlOpActive && wci_ctlAckReg ;
  // rule RL_wci_respF_incCtr
  assign WILL_FIRE_RL_wci_respF_incCtr =
	     wci_respF_enqueueing$whas && wci_respF_enqueueing$whas &&
	     !(wci_respF_cntr_r != 2'd0) ;
  // rule RL_wci_respF_decCtr
  assign WILL_FIRE_RL_wci_respF_decCtr =
	     wci_respF_cntr_r != 2'd0 && !wci_respF_enqueueing$whas ;
  // rule RL_wci_respF_both
  assign WILL_FIRE_RL_wci_respF_both =
	     wci_respF_enqueueing$whas && wci_respF_cntr_r != 2'd0 &&
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
	     IF_bml_dpControl_wget__907_BITS_1_TO_0_913_EQ__ETC___d1993 ;
  assign MUX_bml_lclBufsCF$write_1__SEL_1 =
	     wci_cState == 3'd2 &&
	     bml_lclBufDone_931_AND_IF_bml_dpControl_wget___ETC___d2012 ;
  assign MUX_bml_lclCredit$write_1__SEL_1 =
	     WILL_FIRE_RL_bml_lcredit &&
	     (bml_lclBufDone && !bml_remStart ||
	      !bml_lclBufDone && bml_remStart) ;
  assign MUX_bram_0_memory$a_put_1__SEL_1 =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeData &&
	     SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d665 ;
  assign MUX_bram_0_memory$a_put_1__SEL_2 =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd0 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[63] ;
  assign MUX_bram_0_memory$a_put_1__SEL_3 =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd0 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[60] ;
  assign MUX_bram_0_memory$b_put_1__SEL_1 =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd0 ;
  assign MUX_bram_0_memory$b_put_1__SEL_2 =
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd0 ;
  assign MUX_bram_1_memory$a_put_1__SEL_1 =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeData &&
	     SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d669 ;
  assign MUX_bram_1_memory$a_put_1__SEL_2 =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd1 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[63] ;
  assign MUX_bram_1_memory$a_put_1__SEL_3 =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd1 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[60] ;
  assign MUX_bram_1_memory$b_put_1__SEL_1 =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd1 ;
  assign MUX_bram_1_memory$b_put_1__SEL_2 =
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd1 ;
  assign MUX_bram_2_memory$a_put_1__SEL_1 =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeData &&
	     SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d673 ;
  assign MUX_bram_2_memory$a_put_1__SEL_2 =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd2 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[63] ;
  assign MUX_bram_2_memory$a_put_1__SEL_3 =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd2 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[60] ;
  assign MUX_bram_2_memory$b_put_1__SEL_1 =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd2 ;
  assign MUX_bram_2_memory$b_put_1__SEL_2 =
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd2 ;
  assign MUX_bram_3_memory$a_put_1__SEL_1 =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeData &&
	     SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d677 ;
  assign MUX_bram_3_memory$a_put_1__SEL_2 =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd3 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[63] ;
  assign MUX_bram_3_memory$a_put_1__SEL_3 =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd3 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[60] ;
  assign MUX_bram_3_memory$b_put_1__SEL_1 =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd3 ;
  assign MUX_bram_3_memory$b_put_1__SEL_2 =
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd3 ;
  assign MUX_tlp_fabMesgAccu$write_1__SEL_1 =
	     WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ||
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ;
  assign MUX_tlp_fabMeta$write_1__SEL_2 =
	     WILL_FIRE_RL_tlp_dmaTailEventSender &&
	     (tlp_fabFlowAddrMS == 32'd0 || tlp_sentTail4DWHeader) ;
  assign MUX_tlp_remDone_1$wset_1__SEL_1 =
	     WILL_FIRE_RL_tlp_dmaTailEventSender &&
	     (tlp_fabFlowAddrMS == 32'd0 && tlp_tailEventF$D_OUT ||
	      tlp_fabFlowAddrMS != 32'd0 && !tlp_sentTail4DWHeader &&
	      tlp_tailEventF$D_OUT) ;
  assign MUX_tlp_tailEventF$enq_1__SEL_1 =
	     WILL_FIRE_RL_tlp_dmaXmtDoorbell ||
	     WILL_FIRE_RL_tlp_dmaXmtTailEvent ;
  assign MUX_tlp_tlpBRAM_mReqF$enq_1__SEL_1 =
	     WILL_FIRE_RL_tlp_tlpRcv &&
	     tlp_inF_first__259_BIT_152_462_AND_NOT_tlp_inF_ETC___d1487 ;
  assign MUX_tlp_tlpBRAM_mReqF$enq_1__SEL_2 =
	     WILL_FIRE_RL_tlp_dmaPullResponseBody ||
	     WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ;
  assign MUX_tlp_tlpBRAM_readHeaderSent$write_1__SEL_1 =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstResp &&
	     (tlp_tlpBRAM_readReq$D_OUT[28:19] != 10'd1 ||
	      tlp_tlpBRAM_readReq$D_OUT[60]) ;
  assign MUX_tlp_tlpBRAM_readStarted$write_1__SEL_1 =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq &&
	     (tlp_tlpBRAM_mReqF$D_OUT[28:19] != 10'd1 ||
	      tlp_tlpBRAM_mReqF$D_OUT[60]) ;
  assign MUX_tlp_tlpXmtBusy$write_1__SEL_1 =
	     WILL_FIRE_RL_tlp_dmaPushResponseHeader && _dfoo5 ;
  assign MUX_tlp_tlpXmtBusy$write_1__PSEL_2 =
	     WILL_FIRE_RL_tlp_dataXmt_Body ||
	     WILL_FIRE_RL_tlp_dmaPushResponseBody ;
  assign MUX_tlp_tlpXmtBusy$write_1__SEL_2 =
	     MUX_tlp_tlpXmtBusy$write_1__PSEL_2 &&
	     tlp_outDwRemain_129_ULE_4___d1130 ;
  assign MUX_tlp_tlpXmtBusy$write_1__SEL_3 =
	     WILL_FIRE_RL_tlp_dmaTailEventSender &&
	     tlp_fabFlowAddrMS != 32'd0 ;
  assign MUX_tlp_tlpXmtBusy$write_1__SEL_4 =
	     WILL_FIRE_RL_tlp_dataXmt_Header &&
	     !tlp_tlpBRAM_mRespF_first__000_BITS_71_TO_62_10_ETC___d1102 ;
  assign MUX_tlp_xmtMetaOK$write_1__SEL_3 =
	     WILL_FIRE_RL_tlp_dmaPushResponseBody &&
	     tlp_outDwRemain_129_ULE_4___d1130 &&
	     tlp_tlpBRAM_mRespF$D_OUT[135:128] == 8'h01 ;
  assign MUX_tlp_xmtMetaOK$write_1__SEL_4 =
	     WILL_FIRE_RL_tlp_dmaPushResponseHeader &&
	     tlp_fabMesgAddrMS == 32'd0 &&
	     tlp_tlpBRAM_mRespF$D_OUT[71:62] == 10'd1 &&
	     tlp_tlpBRAM_mRespF$D_OUT[42:35] == 8'h01 ;
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
  assign MUX_wci_respF_q_0$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_respF_both && _dfoo3 ;
  assign MUX_wci_respF_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_cntr_r == 2'd0 ;
  assign MUX_wci_respF_q_1$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_respF_both && _dfoo1 ;
  assign MUX_wci_respF_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_cntr_r == 2'd1 ;
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
  assign MUX_wmi_wmi_respF_q_0$write_1__SEL_1 =
	     WILL_FIRE_RL_wmi_wmi_respF_both && _dfoo9 ;
  assign MUX_wmi_wmi_respF_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_wmi_respF_incCtr &&
	     wmi_wmi_respF_cntr_r == 2'd0 ;
  assign MUX_wmi_wmi_respF_q_1$write_1__SEL_1 =
	     WILL_FIRE_RL_wmi_wmi_respF_both && _dfoo7 ;
  assign MUX_wmi_wmi_respF_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_wmi_wmi_respF_incCtr &&
	     wmi_wmi_respF_cntr_r == 2'd1 ;
  assign MUX_wmi_wrActive$write_1__SEL_1 =
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_bytesRemainReq == 14'd4 ;
  assign MUX_wmi_wrFinalize$write_1__SEL_1 =
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_bytesRemainReq == 14'd4 &&
	     wmi_doneWithMesg ;
  assign MUX_bml_crdBuf_value$write_1__VAL_3 =
	     bml_crdBuf_value_889_EQ_bml_crdBuf_modulus_bw__ETC___d1891 ?
	       16'd0 :
	       bml_crdBuf_value + 16'd1 ;
  assign MUX_bml_fabBuf_value$write_1__VAL_3 =
	     bml_fabBuf_value_874_EQ_bml_fabBuf_modulus_bw__ETC___d1876 ?
	       16'd0 :
	       bml_fabBuf_value + 16'd1 ;
  assign MUX_bml_fabBufsAvail$write_1__VAL_1 =
	     (bml_fabAvail && !bml_remStart) ? x__h88959 : x__h88964 ;
  assign MUX_bml_fabBufsAvail$write_1__VAL_2 =
	     (dpControl[3:2] == 2'd1) ? x__h87600 : 16'd0 ;
  assign MUX_bml_fabFlowAddr$write_1__VAL_1 =
	     bml_fabBuf_value_874_EQ_bml_fabBuf_modulus_bw__ETC___d1876 ?
	       bml_fabFlowBase :
	       bml_fabFlowAddr_946_PLUS_bml_fabFlowSize_947___d1948 ;
  assign MUX_bml_fabFlowAddr$write_1__VAL_3 =
	     bml_crdBuf_value_889_EQ_bml_crdBuf_modulus_bw__ETC___d1891 ?
	       bml_fabFlowBase :
	       bml_fabFlowAddr_946_PLUS_bml_fabFlowSize_947___d1948 ;
  assign MUX_bml_fabMesgAddr$write_1__VAL_1 =
	     bml_fabBuf_value_874_EQ_bml_fabBuf_modulus_bw__ETC___d1876 ?
	       bml_fabMesgBase :
	       bml_fabMesgAddr + bml_fabMesgSize ;
  assign MUX_bml_fabMetaAddr$write_1__VAL_1 =
	     bml_fabBuf_value_874_EQ_bml_fabBuf_modulus_bw__ETC___d1876 ?
	       bml_fabMetaBase :
	       bml_fabMetaAddr + bml_fabMetaSize ;
  assign MUX_bml_lclBuf_value$write_1__VAL_3 =
	     bml_lclBuf_value_844_EQ_bml_lclBuf_modulus_bw__ETC___d1846 ?
	       16'd0 :
	       bml_lclBuf_value + 16'd1 ;
  assign MUX_bml_lclBufsAR$write_1__VAL_1 =
	     (CASE_dpControl_BITS_1_TO_0_0_bml_fabDone_1_bml_ETC__q4 &&
	      !bml_lclBufStart) ?
	       x__h88728 :
	       x__h88733 ;
  assign MUX_bml_lclBufsAR$write_1__VAL_2 =
	     (dpControl[3:2] == 2'd1) ? bml_lclNumBufs : 16'd0 ;
  assign MUX_bml_lclBufsCF$write_1__VAL_1 =
	     (bml_lclBufDone &&
	      CASE_dpControl_BITS_1_TO_0_0_NOT_bml_fabDone_1_ETC__q6) ?
	       x__h88840 :
	       x__h88877 ;
  assign MUX_bml_lclBufsCF$write_1__VAL_2 =
	     (dpControl[3:2] == 2'd1) ? 16'd0 : bml_lclNumBufs ;
  assign MUX_bml_lclCredit$write_1__VAL_1 =
	     (bml_lclBufDone && !bml_remStart) ? x__h88998 : x__h89003 ;
  assign MUX_bml_lclMesgAddr$write_1__VAL_2 =
	     bml_lclBuf_value_844_EQ_bml_lclBuf_modulus_bw__ETC___d1846 ?
	       bml_mesgBase :
	       bml_lclMesgAddr + bml_mesgSize ;
  assign MUX_bml_lclMetaAddr$write_1__VAL_2 =
	     bml_lclBuf_value_844_EQ_bml_lclBuf_modulus_bw__ETC___d1846 ?
	       bml_metaBase :
	       bml_lclMetaAddr + bml_metaSize ;
  assign MUX_bml_remBuf_value$write_1__VAL_3 =
	     bml_remBuf_value_859_EQ_bml_remBuf_modulus_bw__ETC___d1861 ?
	       16'd0 :
	       bml_remBuf_value + 16'd1 ;
  assign MUX_bml_remMesgAddr$write_1__VAL_2 =
	     bml_remBuf_value_859_EQ_bml_remBuf_modulus_bw__ETC___d1861 ?
	       bml_mesgBase :
	       bml_remMesgAddr + bml_mesgSize ;
  assign MUX_bml_remMetaAddr$write_1__VAL_2 =
	     bml_remBuf_value_859_EQ_bml_remBuf_modulus_bw__ETC___d1861 ?
	       bml_metaBase :
	       bml_remMetaAddr + bml_metaSize ;
  always@(idx__h21626 or
	  tlp_tlpBRAM_writeDWAddr or
	  tlp_tlpBRAM_writeDWAddr_PLUS_1__q8 or
	  tlp_tlpBRAM_writeDWAddr_PLUS_2__q9 or
	  tlp_tlpBRAM_writeDWAddr_PLUS_3__q10)
  begin
    case (idx__h21626)
      2'd0: MUX_bram_0_memory$a_put_2__VAL_1 = tlp_tlpBRAM_writeDWAddr[12:2];
      2'd1:
	  MUX_bram_0_memory$a_put_2__VAL_1 =
	      tlp_tlpBRAM_writeDWAddr_PLUS_1__q8[12:2];
      2'd2:
	  MUX_bram_0_memory$a_put_2__VAL_1 =
	      tlp_tlpBRAM_writeDWAddr_PLUS_2__q9[12:2];
      2'd3:
	  MUX_bram_0_memory$a_put_2__VAL_1 =
	      tlp_tlpBRAM_writeDWAddr_PLUS_3__q10[12:2];
    endcase
  end
  always@(idx__h27879 or
	  tlp_tlpBRAM_readNxtDWAddr or
	  tlp_tlpBRAM_readNxtDWAddr_PLUS_1__q11 or
	  tlp_tlpBRAM_readNxtDWAddr_PLUS_2__q12 or
	  tlp_tlpBRAM_readNxtDWAddr_PLUS_3__q13)
  begin
    case (idx__h27879)
      2'd0:
	  MUX_bram_0_memory$a_put_2__VAL_4 = tlp_tlpBRAM_readNxtDWAddr[12:2];
      2'd1:
	  MUX_bram_0_memory$a_put_2__VAL_4 =
	      tlp_tlpBRAM_readNxtDWAddr_PLUS_1__q11[12:2];
      2'd2:
	  MUX_bram_0_memory$a_put_2__VAL_4 =
	      tlp_tlpBRAM_readNxtDWAddr_PLUS_2__q12[12:2];
      2'd3:
	  MUX_bram_0_memory$a_put_2__VAL_4 =
	      tlp_tlpBRAM_readNxtDWAddr_PLUS_3__q13[12:2];
    endcase
  end
  assign MUX_bram_0_memory$a_put_3__VAL_1 =
	     { SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d700[7:0],
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d700[15:8],
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d700[23:16],
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d700[31:24] } ;
  assign MUX_bram_0_memory$a_put_3__VAL_2 =
	     { tlp_tlpBRAM_mReqF$D_OUT[7:0],
	       tlp_tlpBRAM_mReqF$D_OUT[15:8],
	       tlp_tlpBRAM_mReqF$D_OUT[23:16],
	       tlp_tlpBRAM_mReqF$D_OUT[31:24] } ;
  assign MUX_bram_0_memory$b_put_2__VAL_1 =
	     wmi_lclMesgAddr[14:4] + { 1'd0, wmi_addr[13:4] } ;
  always@(idx__h23676 or
	  tlp_tlpBRAM_writeDWAddr or
	  tlp_tlpBRAM_writeDWAddr_PLUS_1__q8 or
	  tlp_tlpBRAM_writeDWAddr_PLUS_2__q9 or
	  tlp_tlpBRAM_writeDWAddr_PLUS_3__q10)
  begin
    case (idx__h23676)
      2'd0: MUX_bram_1_memory$a_put_2__VAL_1 = tlp_tlpBRAM_writeDWAddr[12:2];
      2'd1:
	  MUX_bram_1_memory$a_put_2__VAL_1 =
	      tlp_tlpBRAM_writeDWAddr_PLUS_1__q8[12:2];
      2'd2:
	  MUX_bram_1_memory$a_put_2__VAL_1 =
	      tlp_tlpBRAM_writeDWAddr_PLUS_2__q9[12:2];
      2'd3:
	  MUX_bram_1_memory$a_put_2__VAL_1 =
	      tlp_tlpBRAM_writeDWAddr_PLUS_3__q10[12:2];
    endcase
  end
  always@(idx__h28282 or
	  tlp_tlpBRAM_readNxtDWAddr or
	  tlp_tlpBRAM_readNxtDWAddr_PLUS_1__q11 or
	  tlp_tlpBRAM_readNxtDWAddr_PLUS_2__q12 or
	  tlp_tlpBRAM_readNxtDWAddr_PLUS_3__q13)
  begin
    case (idx__h28282)
      2'd0:
	  MUX_bram_1_memory$a_put_2__VAL_4 = tlp_tlpBRAM_readNxtDWAddr[12:2];
      2'd1:
	  MUX_bram_1_memory$a_put_2__VAL_4 =
	      tlp_tlpBRAM_readNxtDWAddr_PLUS_1__q11[12:2];
      2'd2:
	  MUX_bram_1_memory$a_put_2__VAL_4 =
	      tlp_tlpBRAM_readNxtDWAddr_PLUS_2__q12[12:2];
      2'd3:
	  MUX_bram_1_memory$a_put_2__VAL_4 =
	      tlp_tlpBRAM_readNxtDWAddr_PLUS_3__q13[12:2];
    endcase
  end
  assign MUX_bram_1_memory$a_put_3__VAL_1 =
	     { SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d708[7:0],
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d708[15:8],
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d708[23:16],
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d708[31:24] } ;
  always@(idx__h24781 or
	  tlp_tlpBRAM_writeDWAddr or
	  tlp_tlpBRAM_writeDWAddr_PLUS_1__q8 or
	  tlp_tlpBRAM_writeDWAddr_PLUS_2__q9 or
	  tlp_tlpBRAM_writeDWAddr_PLUS_3__q10)
  begin
    case (idx__h24781)
      2'd0: MUX_bram_2_memory$a_put_2__VAL_1 = tlp_tlpBRAM_writeDWAddr[12:2];
      2'd1:
	  MUX_bram_2_memory$a_put_2__VAL_1 =
	      tlp_tlpBRAM_writeDWAddr_PLUS_1__q8[12:2];
      2'd2:
	  MUX_bram_2_memory$a_put_2__VAL_1 =
	      tlp_tlpBRAM_writeDWAddr_PLUS_2__q9[12:2];
      2'd3:
	  MUX_bram_2_memory$a_put_2__VAL_1 =
	      tlp_tlpBRAM_writeDWAddr_PLUS_3__q10[12:2];
    endcase
  end
  always@(idx__h28586 or
	  tlp_tlpBRAM_readNxtDWAddr or
	  tlp_tlpBRAM_readNxtDWAddr_PLUS_1__q11 or
	  tlp_tlpBRAM_readNxtDWAddr_PLUS_2__q12 or
	  tlp_tlpBRAM_readNxtDWAddr_PLUS_3__q13)
  begin
    case (idx__h28586)
      2'd0:
	  MUX_bram_2_memory$a_put_2__VAL_4 = tlp_tlpBRAM_readNxtDWAddr[12:2];
      2'd1:
	  MUX_bram_2_memory$a_put_2__VAL_4 =
	      tlp_tlpBRAM_readNxtDWAddr_PLUS_1__q11[12:2];
      2'd2:
	  MUX_bram_2_memory$a_put_2__VAL_4 =
	      tlp_tlpBRAM_readNxtDWAddr_PLUS_2__q12[12:2];
      2'd3:
	  MUX_bram_2_memory$a_put_2__VAL_4 =
	      tlp_tlpBRAM_readNxtDWAddr_PLUS_3__q13[12:2];
    endcase
  end
  assign MUX_bram_2_memory$a_put_3__VAL_1 =
	     { SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d716[7:0],
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d716[15:8],
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d716[23:16],
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d716[31:24] } ;
  always@(idx__h25886 or
	  tlp_tlpBRAM_writeDWAddr or
	  tlp_tlpBRAM_writeDWAddr_PLUS_1__q8 or
	  tlp_tlpBRAM_writeDWAddr_PLUS_2__q9 or
	  tlp_tlpBRAM_writeDWAddr_PLUS_3__q10)
  begin
    case (idx__h25886)
      2'd0: MUX_bram_3_memory$a_put_2__VAL_1 = tlp_tlpBRAM_writeDWAddr[12:2];
      2'd1:
	  MUX_bram_3_memory$a_put_2__VAL_1 =
	      tlp_tlpBRAM_writeDWAddr_PLUS_1__q8[12:2];
      2'd2:
	  MUX_bram_3_memory$a_put_2__VAL_1 =
	      tlp_tlpBRAM_writeDWAddr_PLUS_2__q9[12:2];
      2'd3:
	  MUX_bram_3_memory$a_put_2__VAL_1 =
	      tlp_tlpBRAM_writeDWAddr_PLUS_3__q10[12:2];
    endcase
  end
  always@(idx__h28890 or
	  tlp_tlpBRAM_readNxtDWAddr or
	  tlp_tlpBRAM_readNxtDWAddr_PLUS_1__q11 or
	  tlp_tlpBRAM_readNxtDWAddr_PLUS_2__q12 or
	  tlp_tlpBRAM_readNxtDWAddr_PLUS_3__q13)
  begin
    case (idx__h28890)
      2'd0:
	  MUX_bram_3_memory$a_put_2__VAL_4 = tlp_tlpBRAM_readNxtDWAddr[12:2];
      2'd1:
	  MUX_bram_3_memory$a_put_2__VAL_4 =
	      tlp_tlpBRAM_readNxtDWAddr_PLUS_1__q11[12:2];
      2'd2:
	  MUX_bram_3_memory$a_put_2__VAL_4 =
	      tlp_tlpBRAM_readNxtDWAddr_PLUS_2__q12[12:2];
      2'd3:
	  MUX_bram_3_memory$a_put_2__VAL_4 =
	      tlp_tlpBRAM_readNxtDWAddr_PLUS_3__q13[12:2];
    endcase
  end
  assign MUX_bram_3_memory$a_put_3__VAL_1 =
	     { SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d724[7:0],
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d724[15:8],
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d724[23:16],
	       SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d724[31:24] } ;
  assign MUX_tlp_dmaDoTailEvent$write_1__VAL_1 =
	     tlp_dmaPullRemainDWSub_387_ULE_4___d1388 &&
	     tlp_dmaPullRemainDWLen_373_ULE_tlp_dmaPullRema_ETC___d1395 ;
  assign MUX_tlp_dmaPullRemainDWLen$write_1__VAL_2 =
	     tlp_dmaPullRemainDWLen - 10'd1 ;
  assign MUX_tlp_dmaPullRemainDWLen$write_1__VAL_3 =
	     tlp_dmaPullRemainDWSub_387_ULE_4___d1388 ?
	       tlp_dmaPullRemainDWLen - tlp_dmaPullRemainDWSub :
	       tlp_dmaPullRemainDWLen - 10'd4 ;
  assign MUX_tlp_dmaPullRemainDWSub$write_1__VAL_1 =
	     tlp_inF$D_OUT[105:96] - 10'd1 ;
  assign MUX_tlp_dmaPullRemainDWSub$write_1__VAL_2 =
	     tlp_dmaPullRemainDWSub_387_ULE_4___d1388 ?
	       10'd0 :
	       tlp_dmaPullRemainDWSub - 10'd4 ;
  assign MUX_tlp_doorSeqDwell$write_1__VAL_1 = tlp_doorSeqDwell - 4'd1 ;
  assign MUX_tlp_fabMesgAccu$write_1__VAL_2 = tlp_fabMesgAccu + y__h48181 ;
  assign MUX_tlp_fabMesgAccu$write_1__VAL_3 = tlp_fabMesgAccu + y__h63989 ;
  assign MUX_tlp_fabMeta$write_1__VAL_1 =
	     { 1'd1,
	       x__h47258,
	       opcode__h44022,
	       nowMS__h45280,
	       nowLS__h46239 } ;
  assign MUX_tlp_fabMeta$write_1__VAL_3 =
	     { 1'd1,
	       x__h63608,
	       opcode__h60417,
	       nowMS__h61665,
	       nowLS__h62622 } ;
  assign MUX_tlp_lastRuleFired$write_1__VAL_3 =
	     (tlp_fabFlowAddrMS == 32'd0) ?
	       4'd8 :
	       (tlp_sentTail4DWHeader ? 4'd10 : 4'd9) ;
  assign MUX_tlp_mesgComplReceived$write_1__VAL_1 =
	     tlp_mesgComplReceived + 17'd4 ;
  assign MUX_tlp_mesgComplReceived$write_1__VAL_2 =
	     tlp_mesgComplReceived + y__h65310 ;
  assign MUX_tlp_mesgLengthRemainPull$write_1__VAL_1 =
	     { tlp_inF$D_OUT[8],
	       tlp_inF$D_OUT[23:16],
	       tlp_inF$D_OUT[31:24] } ;
  assign MUX_tlp_mesgLengthRemainPull$write_1__VAL_2 =
	     { tlp_mesgLengthRemainPull_PLUS_3__q14[16:2], 2'd0 } ;
  assign MUX_tlp_mesgLengthRemainPull$write_1__VAL_3 =
	     tlp_mesgLengthRemainPull - y__h63918 ;
  assign MUX_tlp_mesgLengthRemainPush$write_1__VAL_1 =
	     { tlp_mesgLengthRemainPush_PLUS_3__q15[16:2], 2'd0 } ;
  assign MUX_tlp_mesgLengthRemainPush$write_1__VAL_2 =
	     { tlp_tlpBRAM_mRespF$D_OUT[8],
	       tlp_tlpBRAM_mRespF$D_OUT[23:16],
	       tlp_tlpBRAM_mRespF$D_OUT[31:24] } ;
  assign MUX_tlp_mesgLengthRemainPush$write_1__VAL_3 =
	     tlp_mesgLengthRemainPush - y__h47529 ;
  assign MUX_tlp_outDwRemain$write_1__VAL_1 =
	     tlp_tlpBRAM_mRespF$D_OUT[71:62] - y__h48147 ;
  assign MUX_tlp_outDwRemain$write_1__VAL_2 = tlp_outDwRemain - 10'd4 ;
  assign MUX_tlp_outDwRemain$write_1__VAL_3 =
	     tlp_tlpBRAM_mRespF$D_OUT[71:62] - 10'd1 ;
  assign MUX_tlp_outF$enq_1__VAL_1 =
	     { 1'd0,
	       tlp_outDwRemain_129_ULE_4___d1130,
	       7'h02,
	       w_be__h48508,
	       tlp_tlpBRAM_mRespF$D_OUT[127:0] } ;
  assign MUX_tlp_outF$enq_1__VAL_2 =
	     (tlp_fabMesgAddrMS == 32'd0) ?
	       { 1'd1,
		 tlp_tlpBRAM_mRespF$D_OUT[71:62] == 10'd1,
		 23'd196607,
		 w_data__h47916 } :
	       { 25'd16973823, w_data__h48052 } ;
  assign MUX_tlp_outF$enq_1__VAL_3 =
	     { 25'd16973823,
	       (tlp_fabMetaAddrMS == 32'd0) ? 32'd1073741828 : 32'd1610612740,
	       pciDevice,
	       16'd255,
	       (tlp_fabMetaAddrMS == 32'd0) ?
		 { tlp_fabMetaAddr,
		   tlp_fabMeta[103:96],
		   tlp_fabMeta[111:104],
		   tlp_fabMeta[119:112],
		   tlp_fabMeta[127:120] } :
		 { tlp_fabMetaAddrMS, tlp_fabMetaAddr } } ;
  assign MUX_tlp_outF$enq_1__VAL_4 =
	     (tlp_fabMetaAddrMS == 32'd0) ?
	       { 25'd8585200,
		 tlp_fabMeta[71:64],
		 tlp_fabMeta[79:72],
		 tlp_fabMeta[87:80],
		 tlp_fabMeta[95:88],
		 tlp_fabMeta[39:32],
		 tlp_fabMeta[47:40],
		 tlp_fabMeta[55:48],
		 tlp_fabMeta[63:56],
		 tlp_fabMeta[7:0],
		 tlp_fabMeta[15:8],
		 tlp_fabMeta[23:16],
		 tlp_fabMeta[31:24],
		 tlp_fabMetaAddrMS } :
	       { 25'd8585215, w_data__h52877 } ;
  assign MUX_tlp_outF$enq_1__VAL_5 =
	     { 9'd386,
	       (tlp_fabMetaAddrMS == 32'd0) ? 16'hFFF0 : 16'd65535,
	       IF_tlp_fabMetaAddrMS_157_EQ_0_158_THEN_4_ELSE__ETC___d1248 } ;
  assign MUX_tlp_outF$enq_1__VAL_6 =
	     { 9'd386,
	       (tlp_fabMesgAddrMS == 32'd0) ? 16'hFFF0 : 16'd65535,
	       IF_tlp_fabMesgAddrMS_078_EQ_0_079_THEN_0_ELSE__ETC___d1353 } ;
  assign MUX_tlp_outF$enq_1__VAL_7 =
	     (tlp_fabFlowAddrMS == 32'd0) ?
	       { 25'd25362431, w_data__h65836 } :
	       (tlp_sentTail4DWHeader ?
		  { 25'd8581120, w_data__h67186 } :
		  { 25'd16973823, w_data__h66940 }) ;
  assign MUX_tlp_outF$enq_1__VAL_8 =
	     { 1'd1,
	       tlp_tlpBRAM_mRespF$D_OUT[71:62] == 10'd1,
	       23'd196607,
	       pkt__h71785 } ;
  assign MUX_tlp_postSeqDwell$write_1__VAL_1 =
	     (dpControl[1:0] == 2'd2) ? 4'd8 : 4'd4 ;
  assign MUX_tlp_postSeqDwell$write_1__VAL_2 = tlp_postSeqDwell - 4'd1 ;
  assign MUX_tlp_remMesgAccu$write_1__VAL_2 = tlp_remMesgAccu + y__h47671 ;
  assign MUX_tlp_remMesgAccu$write_1__VAL_3 = tlp_remMesgAccu + y__h64598 ;
  assign MUX_tlp_reqMesgInFlight$write_1__VAL_2 =
	     !tlp_dmaPullRemainDWSub_387_ULE_4___d1388 ||
	     !tlp_dmaPullRemainDWLen_373_ULE_tlp_dmaPullRema_ETC___d1395 ;
  assign MUX_tlp_srcMesgAccu$write_1__VAL_2 = tlp_srcMesgAccu + y__h47623 ;
  assign MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_1 =
	     tlp_inF$D_OUT[152] ?
	       (tlp_inF$D_OUT[126] ?
		  { 67'h15555555555555554,
		    tlp_inF$D_OUT[46:34],
		    tlp_inF$D_OUT[105:96],
		    tlp_inF$D_OUT[67:64],
		    tlp_inF$D_OUT[71:68],
		    tlp_inF$D_OUT[31:0] } :
		  { 72'h955555555555555551,
		    tlp_inF$D_OUT[95:80],
		    tlp_inF$D_OUT[46:34],
		    tlp_inF$D_OUT[105:96],
		    tlp_inF$D_OUT[67:64],
		    tlp_inF$D_OUT[71:68],
		    tlp_inF$D_OUT[79:72],
		    tlp_inF$D_OUT[118:116] }) :
	       { 2'd1, tlp_inF$D_OUT[127:0] } ;
  assign MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_2 = { 2'd1, tlp_inF$D_OUT[127:0] } ;
  assign MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_3 =
	     { 88'h955555555555555553FFF8,
	       tlp_remMetaAddr[14:2],
	       29'd2620074 } ;
  assign MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_4 =
	     { 69'h12AAAAAAAAAAAAAAAA,
	       tlp_fabMesgAddrMS != 32'd0,
	       18'd196600,
	       tlp_remMesgAccu[14:2],
	       thisRequestLength__h47504[11:2],
	       8'd255,
	       rreq_tag__h47719,
	       3'h2 } ;
  assign MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_5 =
	     { 67'h15555555555555554,
	       tlp_remMetaAddr[14:2],
	       18'd1279,
	       tlp_inF$D_OUT[31:0] } ;
  assign MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_6 =
	     { 67'h15555555555555554,
	       tlp_remMesgAccu[14:2],
	       tlp_inF$D_OUT[105:96],
	       8'd255,
	       tlp_inF$D_OUT[31:0] } ;
  assign MUX_tlp_tlpBRAM_mRespF$enq_1__VAL_1 =
	     { 48'h2AAAAAAAAAAA,
	       !tlp_tlpBRAM_readReq$D_OUT[60],
	       tlp_tlpBRAM_readReq$D_OUT[59:42],
	       tlp_tlpBRAM_readReq$D_OUT[28:19],
	       lowAddr__h29652,
	       byteCount__h29653,
	       tlp_tlpBRAM_readReq$D_OUT[10:0],
	       rresp_data__h29698 } ;
  assign MUX_tlp_tlpBRAM_mRespF$enq_1__VAL_2 =
	     { 1'd1,
	       tlp_tlpBRAM_readReq$D_OUT[59:58],
	       tlp_tlpBRAM_readReq$D_OUT[10:3],
	       rdata__h35173 } ;
  assign MUX_tlp_tlpBRAM_rdRespDwRemain$write_1__VAL_1 =
	     tlp_tlpBRAM_readReq$D_OUT[28:19] - y__h30729 ;
  assign MUX_tlp_tlpBRAM_rdRespDwRemain$write_1__VAL_2 =
	     tlp_tlpBRAM_rdRespDwRemain - 10'd4 ;
  assign MUX_tlp_tlpBRAM_readNxtDWAddr$write_1__VAL_1 =
	     tlp_tlpBRAM_mReqF$D_OUT[41:29] + y__h27665 ;
  assign MUX_tlp_tlpBRAM_readNxtDWAddr$write_1__VAL_2 =
	     tlp_tlpBRAM_readNxtDWAddr + 13'd4 ;
  assign MUX_tlp_tlpBRAM_readRemainDWLen$write_1__VAL_1 =
	     tlp_tlpBRAM_mReqF$D_OUT[28:19] - y__h27653 ;
  assign MUX_tlp_tlpBRAM_readRemainDWLen$write_1__VAL_2 =
	     tlp_tlpBRAM_readRemainDWLen - 10'd4 ;
  assign MUX_tlp_tlpBRAM_writeDWAddr$write_1__VAL_1 =
	     tlp_tlpBRAM_mReqF$D_OUT[62:50] + y__h17362 ;
  assign MUX_tlp_tlpBRAM_writeDWAddr$write_1__VAL_2 =
	     tlp_tlpBRAM_writeDWAddr + 13'd4 ;
  assign MUX_tlp_tlpBRAM_writeRemainDWLen$write_1__VAL_1 =
	     tlp_tlpBRAM_mReqF$D_OUT[49:40] - y__h17428 ;
  assign MUX_tlp_tlpBRAM_writeRemainDWLen$write_1__VAL_2 =
	     tlp_tlpBRAM_writeRemainDWLen - 10'd4 ;
  assign MUX_tlp_tlpXmtBusy$write_1__VAL_1 =
	     tlp_fabMesgAddrMS != 32'd0 ||
	     tlp_tlpBRAM_mRespF$D_OUT[71:62] != 10'd1 ;
  assign MUX_wci_illegalEdge$write_1__VAL_2 =
	     wci_reqF$D_OUT[36:34] != 3'd4 && wci_reqF$D_OUT[36:34] != 3'd5 &&
	     wci_reqF$D_OUT[36:34] != 3'd6 ;
  assign MUX_wci_respF_cntr_r$write_1__VAL_2 = wci_respF_cntr_r + 2'd1 ;
  assign MUX_wci_respF_q_0$write_1__VAL_1 =
	     (wci_respF_cntr_r == 2'd1) ?
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
	     (wci_respF_cntr_r == 2'd2) ?
	       MUX_wci_respF_q_0$write_1__VAL_2 :
	       34'h0AAAAAAAA ;
  assign MUX_wci_respF_x_wire$wset_1__VAL_1 =
	     wci_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wci_respF_x_wire$wset_1__VAL_2 = { 2'd1, _theResult____h90872 } ;
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
	       y_avValue__h82907,
	       y_avValue__h82927,
	       y_avValue__h82947,
	       y_avValue__h82967 } ;
  assign MUX_wmi_p4B$write_1__VAL_2 = wmi_p4B + 2'd1 ;
  assign MUX_wmi_wmi_respF_cntr_r$write_1__VAL_2 =
	     wmi_wmi_respF_cntr_r + 2'd1 ;
  assign MUX_wmi_wmi_respF_q_0$write_1__VAL_1 =
	     (wmi_wmi_respF_cntr_r == 2'd1) ?
	       MUX_wmi_wmi_respF_q_0$write_1__VAL_2 :
	       wmi_wmi_respF_q_1 ;
  assign MUX_wmi_wmi_respF_q_0$write_1__VAL_2 = { 2'd1, rdata__h83058 } ;
  assign MUX_wmi_wmi_respF_q_1$write_1__VAL_1 =
	     (wmi_wmi_respF_cntr_r == 2'd2) ?
	       MUX_wmi_wmi_respF_q_0$write_1__VAL_2 :
	       34'd0 ;
  // inlined wires
  assign bram_0_serverAdapterA_outData_enqData$wget = bram_0_memory$DOA ;
  assign bram_0_serverAdapterA_outData_enqData$whas =
	     (!bram_0_serverAdapterA_s1[0] ||
	      bram_0_serverAdapterA_outDataCore$FULL_N) &&
	     bram_0_serverAdapterA_s1[1] &&
	     bram_0_serverAdapterA_s1[0] ;
  assign bram_0_serverAdapterA_outData_outData$wget =
	     bram_0_serverAdapterA_outDataCore$EMPTY_N ?
	       bram_0_serverAdapterA_outDataCore$D_OUT :
	       bram_0_memory$DOA ;
  assign bram_0_serverAdapterA_outData_outData$whas =
	     bram_0_serverAdapterA_outDataCore$EMPTY_N ||
	     !bram_0_serverAdapterA_outDataCore$EMPTY_N &&
	     bram_0_serverAdapterA_outData_enqData$whas ;
  assign bram_0_serverAdapterA_cnt_1$wget = 3'd1 ;
  assign bram_0_serverAdapterA_cnt_1$whas =
	     (MUX_bram_0_memory$a_put_1__SEL_1 ||
	      MUX_bram_0_memory$a_put_1__SEL_2 ||
	      MUX_bram_0_memory$a_put_1__SEL_3 ||
	      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq) &&
	     (!ab__h1619[1] || ab__h1619[0]) ;
  assign bram_0_serverAdapterA_cnt_2$wget = 3'd7 ;
  assign bram_0_serverAdapterA_cnt_2$whas =
	     bram_0_serverAdapterA_outData_deqCalled$whas ;
  assign bram_0_serverAdapterA_cnt_3$wget = 3'h0 ;
  assign bram_0_serverAdapterA_cnt_3$whas = 1'b0 ;
  assign bram_0_serverAdapterA_writeWithResp$wget = ab__h1619 ;
  assign bram_0_serverAdapterA_writeWithResp$whas =
	     MUX_bram_0_memory$a_put_1__SEL_1 ||
	     MUX_bram_0_memory$a_put_1__SEL_2 ||
	     MUX_bram_0_memory$a_put_1__SEL_3 ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq ;
  assign bram_0_serverAdapterA_s1_1$wget =
	     { 1'd1, !ab__h1619[1] || ab__h1619[0] } ;
  assign bram_0_serverAdapterA_s1_1$whas =
	     bram_0_serverAdapterA_writeWithResp$whas ;
  assign bram_0_serverAdapterB_outData_enqData$wget = bram_0_memory$DOB ;
  assign bram_0_serverAdapterB_outData_enqData$whas =
	     (!bram_0_serverAdapterB_s1[0] ||
	      bram_0_serverAdapterB_outDataCore$FULL_N) &&
	     bram_0_serverAdapterB_s1[1] &&
	     bram_0_serverAdapterB_s1[0] ;
  assign bram_0_serverAdapterB_outData_outData$wget = y_avValue__h82907 ;
  assign bram_0_serverAdapterB_outData_outData$whas =
	     bram_0_serverAdapterB_outDataCore$EMPTY_N ||
	     !bram_0_serverAdapterB_outDataCore$EMPTY_N &&
	     bram_0_serverAdapterB_outData_enqData$whas ;
  assign bram_0_serverAdapterB_cnt_1$wget = 3'd1 ;
  assign bram_0_serverAdapterB_cnt_1$whas =
	     (MUX_bram_0_memory$b_put_1__SEL_1 ||
	      MUX_bram_0_memory$b_put_1__SEL_2 ||
	      WILL_FIRE_RL_wmi_reqMetadata ||
	      WILL_FIRE_RL_wmi_doWriteFinalize) &&
	     (!ab__h3026[1] || ab__h3026[0]) ;
  assign bram_0_serverAdapterB_cnt_2$wget = 3'd7 ;
  assign bram_0_serverAdapterB_cnt_2$whas =
	     bram_0_serverAdapterB_outData_deqCalled$whas ;
  assign bram_0_serverAdapterB_cnt_3$wget = 3'h0 ;
  assign bram_0_serverAdapterB_cnt_3$whas = 1'b0 ;
  assign bram_0_serverAdapterB_writeWithResp$wget = ab__h3026 ;
  assign bram_0_serverAdapterB_writeWithResp$whas =
	     MUX_bram_0_memory$b_put_1__SEL_1 ||
	     MUX_bram_0_memory$b_put_1__SEL_2 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  assign bram_0_serverAdapterB_s1_1$wget =
	     { 1'd1, !ab__h3026[1] || ab__h3026[0] } ;
  assign bram_0_serverAdapterB_s1_1$whas =
	     bram_0_serverAdapterB_writeWithResp$whas ;
  assign bram_1_serverAdapterA_outData_enqData$wget = bram_1_memory$DOA ;
  assign bram_1_serverAdapterA_outData_enqData$whas =
	     (!bram_1_serverAdapterA_s1[0] ||
	      bram_1_serverAdapterA_outDataCore$FULL_N) &&
	     bram_1_serverAdapterA_s1[1] &&
	     bram_1_serverAdapterA_s1[0] ;
  assign bram_1_serverAdapterA_outData_outData$wget =
	     bram_1_serverAdapterA_outDataCore$EMPTY_N ?
	       bram_1_serverAdapterA_outDataCore$D_OUT :
	       bram_1_memory$DOA ;
  assign bram_1_serverAdapterA_outData_outData$whas =
	     bram_1_serverAdapterA_outDataCore$EMPTY_N ||
	     !bram_1_serverAdapterA_outDataCore$EMPTY_N &&
	     bram_1_serverAdapterA_outData_enqData$whas ;
  assign bram_1_serverAdapterA_cnt_1$wget = 3'd1 ;
  assign bram_1_serverAdapterA_cnt_1$whas =
	     (MUX_bram_1_memory$a_put_1__SEL_1 ||
	      MUX_bram_1_memory$a_put_1__SEL_2 ||
	      MUX_bram_1_memory$a_put_1__SEL_3 ||
	      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq) &&
	     (!ab__h4569[1] || ab__h4569[0]) ;
  assign bram_1_serverAdapterA_cnt_2$wget = 3'd7 ;
  assign bram_1_serverAdapterA_cnt_2$whas =
	     bram_1_serverAdapterA_outData_deqCalled$whas ;
  assign bram_1_serverAdapterA_cnt_3$wget = 3'h0 ;
  assign bram_1_serverAdapterA_cnt_3$whas = 1'b0 ;
  assign bram_1_serverAdapterA_writeWithResp$wget = ab__h4569 ;
  assign bram_1_serverAdapterA_writeWithResp$whas =
	     MUX_bram_1_memory$a_put_1__SEL_1 ||
	     MUX_bram_1_memory$a_put_1__SEL_2 ||
	     MUX_bram_1_memory$a_put_1__SEL_3 ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq ;
  assign bram_1_serverAdapterA_s1_1$wget =
	     { 1'd1, !ab__h4569[1] || ab__h4569[0] } ;
  assign bram_1_serverAdapterA_s1_1$whas =
	     bram_1_serverAdapterA_writeWithResp$whas ;
  assign bram_1_serverAdapterB_outData_enqData$wget = bram_1_memory$DOB ;
  assign bram_1_serverAdapterB_outData_enqData$whas =
	     (!bram_1_serverAdapterB_s1[0] ||
	      bram_1_serverAdapterB_outDataCore$FULL_N) &&
	     bram_1_serverAdapterB_s1[1] &&
	     bram_1_serverAdapterB_s1[0] ;
  assign bram_1_serverAdapterB_outData_outData$wget = y_avValue__h82927 ;
  assign bram_1_serverAdapterB_outData_outData$whas =
	     bram_1_serverAdapterB_outDataCore$EMPTY_N ||
	     !bram_1_serverAdapterB_outDataCore$EMPTY_N &&
	     bram_1_serverAdapterB_outData_enqData$whas ;
  assign bram_1_serverAdapterB_cnt_1$wget = 3'd1 ;
  assign bram_1_serverAdapterB_cnt_1$whas =
	     (MUX_bram_1_memory$b_put_1__SEL_1 ||
	      MUX_bram_1_memory$b_put_1__SEL_2 ||
	      WILL_FIRE_RL_wmi_reqMetadata ||
	      WILL_FIRE_RL_wmi_doWriteFinalize) &&
	     (!ab__h5974[1] || ab__h5974[0]) ;
  assign bram_1_serverAdapterB_cnt_2$wget = 3'd7 ;
  assign bram_1_serverAdapterB_cnt_2$whas =
	     bram_1_serverAdapterB_outData_deqCalled$whas ;
  assign bram_1_serverAdapterB_cnt_3$wget = 3'h0 ;
  assign bram_1_serverAdapterB_cnt_3$whas = 1'b0 ;
  assign bram_1_serverAdapterB_writeWithResp$wget = ab__h5974 ;
  assign bram_1_serverAdapterB_writeWithResp$whas =
	     MUX_bram_1_memory$b_put_1__SEL_1 ||
	     MUX_bram_1_memory$b_put_1__SEL_2 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  assign bram_1_serverAdapterB_s1_1$wget =
	     { 1'd1, !ab__h5974[1] || ab__h5974[0] } ;
  assign bram_1_serverAdapterB_s1_1$whas =
	     bram_1_serverAdapterB_writeWithResp$whas ;
  assign bram_2_serverAdapterA_outData_enqData$wget = bram_2_memory$DOA ;
  assign bram_2_serverAdapterA_outData_enqData$whas =
	     (!bram_2_serverAdapterA_s1[0] ||
	      bram_2_serverAdapterA_outDataCore$FULL_N) &&
	     bram_2_serverAdapterA_s1[1] &&
	     bram_2_serverAdapterA_s1[0] ;
  assign bram_2_serverAdapterA_outData_outData$wget =
	     WILL_FIRE_RL_bram_2_serverAdapterA_outData_setFirstEnq ?
	       bram_2_memory$DOA :
	       bram_2_serverAdapterA_outDataCore$D_OUT ;
  assign bram_2_serverAdapterA_outData_outData$whas =
	     WILL_FIRE_RL_bram_2_serverAdapterA_outData_setFirstEnq ||
	     bram_2_serverAdapterA_outDataCore$EMPTY_N ;
  assign bram_2_serverAdapterA_cnt_1$wget = 3'd1 ;
  assign bram_2_serverAdapterA_cnt_1$whas =
	     (MUX_bram_2_memory$a_put_1__SEL_1 ||
	      MUX_bram_2_memory$a_put_1__SEL_2 ||
	      MUX_bram_2_memory$a_put_1__SEL_3 ||
	      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq) &&
	     (!ab__h7517[1] || ab__h7517[0]) ;
  assign bram_2_serverAdapterA_cnt_2$wget = 3'd7 ;
  assign bram_2_serverAdapterA_cnt_2$whas =
	     bram_2_serverAdapterA_outData_deqCalled$whas ;
  assign bram_2_serverAdapterA_cnt_3$wget = 3'h0 ;
  assign bram_2_serverAdapterA_cnt_3$whas = 1'b0 ;
  assign bram_2_serverAdapterA_writeWithResp$wget = ab__h7517 ;
  assign bram_2_serverAdapterA_writeWithResp$whas =
	     MUX_bram_2_memory$a_put_1__SEL_1 ||
	     MUX_bram_2_memory$a_put_1__SEL_2 ||
	     MUX_bram_2_memory$a_put_1__SEL_3 ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq ;
  assign bram_2_serverAdapterA_s1_1$wget =
	     { 1'd1, !ab__h7517[1] || ab__h7517[0] } ;
  assign bram_2_serverAdapterA_s1_1$whas =
	     bram_2_serverAdapterA_writeWithResp$whas ;
  assign bram_2_serverAdapterB_outData_enqData$wget = bram_2_memory$DOB ;
  assign bram_2_serverAdapterB_outData_enqData$whas =
	     (!bram_2_serverAdapterB_s1[0] ||
	      bram_2_serverAdapterB_outDataCore$FULL_N) &&
	     bram_2_serverAdapterB_s1[1] &&
	     bram_2_serverAdapterB_s1[0] ;
  assign bram_2_serverAdapterB_outData_outData$wget = y_avValue__h82947 ;
  assign bram_2_serverAdapterB_outData_outData$whas =
	     bram_2_serverAdapterB_outDataCore$EMPTY_N ||
	     !bram_2_serverAdapterB_outDataCore$EMPTY_N &&
	     bram_2_serverAdapterB_outData_enqData$whas ;
  assign bram_2_serverAdapterB_cnt_1$wget = 3'd1 ;
  assign bram_2_serverAdapterB_cnt_1$whas =
	     (MUX_bram_2_memory$b_put_1__SEL_1 ||
	      MUX_bram_2_memory$b_put_1__SEL_2 ||
	      WILL_FIRE_RL_wmi_reqMetadata ||
	      WILL_FIRE_RL_wmi_doWriteFinalize) &&
	     (!ab__h8922[1] || ab__h8922[0]) ;
  assign bram_2_serverAdapterB_cnt_2$wget = 3'd7 ;
  assign bram_2_serverAdapterB_cnt_2$whas =
	     bram_2_serverAdapterB_outData_deqCalled$whas ;
  assign bram_2_serverAdapterB_cnt_3$wget = 3'h0 ;
  assign bram_2_serverAdapterB_cnt_3$whas = 1'b0 ;
  assign bram_2_serverAdapterB_writeWithResp$wget = ab__h8922 ;
  assign bram_2_serverAdapterB_writeWithResp$whas =
	     MUX_bram_2_memory$b_put_1__SEL_1 ||
	     MUX_bram_2_memory$b_put_1__SEL_2 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  assign bram_2_serverAdapterB_s1_1$wget =
	     { 1'd1, !ab__h8922[1] || ab__h8922[0] } ;
  assign bram_2_serverAdapterB_s1_1$whas =
	     bram_2_serverAdapterB_writeWithResp$whas ;
  assign bram_3_serverAdapterA_outData_enqData$wget = bram_3_memory$DOA ;
  assign bram_3_serverAdapterA_outData_enqData$whas =
	     (!bram_3_serverAdapterA_s1[0] ||
	      bram_3_serverAdapterA_outDataCore$FULL_N) &&
	     bram_3_serverAdapterA_s1[1] &&
	     bram_3_serverAdapterA_s1[0] ;
  assign bram_3_serverAdapterA_outData_outData$wget =
	     bram_3_serverAdapterA_outDataCore$EMPTY_N ?
	       bram_3_serverAdapterA_outDataCore$D_OUT :
	       bram_3_memory$DOA ;
  assign bram_3_serverAdapterA_outData_outData$whas =
	     bram_3_serverAdapterA_outDataCore$EMPTY_N ||
	     !bram_3_serverAdapterA_outDataCore$EMPTY_N &&
	     bram_3_serverAdapterA_outData_enqData$whas ;
  assign bram_3_serverAdapterA_cnt_1$wget = 3'd1 ;
  assign bram_3_serverAdapterA_cnt_1$whas =
	     (MUX_bram_3_memory$a_put_1__SEL_1 ||
	      MUX_bram_3_memory$a_put_1__SEL_2 ||
	      MUX_bram_3_memory$a_put_1__SEL_3 ||
	      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq) &&
	     (!ab__h10465[1] || ab__h10465[0]) ;
  assign bram_3_serverAdapterA_cnt_2$wget = 3'd7 ;
  assign bram_3_serverAdapterA_cnt_2$whas =
	     bram_3_serverAdapterA_outData_deqCalled$whas ;
  assign bram_3_serverAdapterA_cnt_3$wget = 3'h0 ;
  assign bram_3_serverAdapterA_cnt_3$whas = 1'b0 ;
  assign bram_3_serverAdapterA_writeWithResp$wget = ab__h10465 ;
  assign bram_3_serverAdapterA_writeWithResp$whas =
	     MUX_bram_3_memory$a_put_1__SEL_1 ||
	     MUX_bram_3_memory$a_put_1__SEL_2 ||
	     MUX_bram_3_memory$a_put_1__SEL_3 ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq ;
  assign bram_3_serverAdapterA_s1_1$wget =
	     { 1'd1, !ab__h10465[1] || ab__h10465[0] } ;
  assign bram_3_serverAdapterA_s1_1$whas =
	     bram_3_serverAdapterA_writeWithResp$whas ;
  assign bram_3_serverAdapterB_outData_enqData$wget = bram_3_memory$DOB ;
  assign bram_3_serverAdapterB_outData_enqData$whas =
	     (!bram_3_serverAdapterB_s1[0] ||
	      bram_3_serverAdapterB_outDataCore$FULL_N) &&
	     bram_3_serverAdapterB_s1[1] &&
	     bram_3_serverAdapterB_s1[0] ;
  assign bram_3_serverAdapterB_outData_outData$wget = y_avValue__h82967 ;
  assign bram_3_serverAdapterB_outData_outData$whas =
	     bram_3_serverAdapterB_outDataCore$EMPTY_N ||
	     !bram_3_serverAdapterB_outDataCore$EMPTY_N &&
	     bram_3_serverAdapterB_outData_enqData$whas ;
  assign bram_3_serverAdapterB_cnt_1$wget = 3'd1 ;
  assign bram_3_serverAdapterB_cnt_1$whas =
	     (MUX_bram_3_memory$b_put_1__SEL_1 ||
	      MUX_bram_3_memory$b_put_1__SEL_2 ||
	      WILL_FIRE_RL_wmi_reqMetadata ||
	      WILL_FIRE_RL_wmi_doWriteFinalize) &&
	     (!ab__h11870[1] || ab__h11870[0]) ;
  assign bram_3_serverAdapterB_cnt_2$wget = 3'd7 ;
  assign bram_3_serverAdapterB_cnt_2$whas =
	     bram_3_serverAdapterB_outData_deqCalled$whas ;
  assign bram_3_serverAdapterB_cnt_3$wget = 3'h0 ;
  assign bram_3_serverAdapterB_cnt_3$whas = 1'b0 ;
  assign bram_3_serverAdapterB_writeWithResp$wget = ab__h11870 ;
  assign bram_3_serverAdapterB_writeWithResp$whas =
	     MUX_bram_3_memory$b_put_1__SEL_1 ||
	     MUX_bram_3_memory$b_put_1__SEL_2 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  assign bram_3_serverAdapterB_s1_1$wget =
	     { 1'd1, !ab__h11870[1] || ab__h11870[0] } ;
  assign bram_3_serverAdapterB_s1_1$whas =
	     bram_3_serverAdapterB_writeWithResp$whas ;
  assign wci_wciReq$wget =
	     { wci_s_MCmd,
	       wci_s_MAddrSpace,
	       wci_s_MByteEn,
	       wci_s_MAddr,
	       wci_s_MData } ;
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
  assign tlp_remStart_1$wget = 1'd1 ;
  assign tlp_remStart_1$whas =
	     WILL_FIRE_RL_tlp_dmaRequestFarMeta ||
	     WILL_FIRE_RL_tlp_dmaXmtDoorbell ||
	     WILL_FIRE_RL_tlp_dmaRequestNearMeta ;
  assign tlp_remDone_1$wget = 1'd1 ;
  assign tlp_remDone_1$whas =
	     MUX_tlp_remDone_1$wset_1__SEL_1 ||
	     WILL_FIRE_RL_tlp_dmaXmtMetaBody ;
  assign tlp_nearBufReady_1$wget = 1'd1 ;
  assign tlp_nearBufReady_1$whas =
	     wci_cState == 3'd2 && bml_lclBufsCF != 16'd0 ;
  assign tlp_farBufReady_1$wget = 1'd1 ;
  assign tlp_farBufReady_1$whas =
	     wci_cState == 3'd2 && bml_fabBufsAvail != 16'd0 ;
  assign tlp_creditReady_1$wget = 1'd1 ;
  assign tlp_creditReady_1$whas =
	     wci_cState == 3'd2 && bml_lclCredit != 16'd0 ;
  assign tlp_dpControl$wget = dpControl ;
  assign tlp_dpControl$whas = 1'd1 ;
  assign tlp_pullTagMatch_1$wget =
	     tagm__h64387 == tlp_inF$D_OUT[47:40] &&
	     tlp_inF_first__259_BITS_63_TO_56_262_EQ_pciDev_ETC___d1272 ;
  assign tlp_pullTagMatch_1$whas =
	     tlp_inF$EMPTY_N && hasPull && dpControl[7:4] == 4'd0 &&
	     dpControl[3:2] == 2'd2 &&
	     dpControl[1:0] == 2'd1 ;
  assign tlp_nowW$wget = wti_nowReq[63:0] ;
  assign tlp_nowW$whas = 1'd1 ;
  assign tlp_dmaStartMark_1$wget = 1'd1 ;
  assign tlp_dmaStartMark_1$whas =
	     WILL_FIRE_RL_tlp_dmaRequestFarMeta ||
	     WILL_FIRE_RL_tlp_dmaRequestNearMeta ;
  assign tlp_dmaDoneMark_1$wget = 1'd1 ;
  assign tlp_dmaDoneMark_1$whas = WILL_FIRE_RL_tlp_dmaTailEventSender ;
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
  assign bml_remStart_1$whas = tlp_remStart ;
  assign bml_remDone_1$wget = 1'd1 ;
  assign bml_remDone_1$whas = tlp_remDone ;
  assign bml_fabDone_1$wget = 1'd1 ;
  assign bml_fabDone_1$whas =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h18 &&
	     dpControl[1:0] != 2'd1 ;
  assign bml_fabAvail_1$wget = 1'd1 ;
  assign bml_fabAvail_1$whas =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h18 &&
	     dpControl[1:0] == 2'd1 ;
  assign bml_datumAReg_1$wget = bml_remDone ;
  assign bml_datumAReg_1$whas = wci_cState == 3'd2 ;
  assign bml_dpControl$wget = dpControl ;
  assign bml_dpControl$whas = 1'd1 ;
  assign wci_Es_mCmd_w$wget = wci_s_MCmd ;
  assign wci_Es_mCmd_w$whas = 1'd1 ;
  assign wci_Es_mAddrSpace_w$wget = wci_s_MAddrSpace ;
  assign wci_Es_mAddrSpace_w$whas = 1'd1 ;
  assign wci_Es_mByteEn_w$wget = wci_s_MByteEn ;
  assign wci_Es_mByteEn_w$whas = 1'd1 ;
  assign wci_Es_mAddr_w$wget = wci_s_MAddr ;
  assign wci_Es_mAddr_w$whas = 1'd1 ;
  assign wci_Es_mData_w$wget = wci_s_MData ;
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
  assign bram_0_serverAdapterA_outData_deqCalled$whas =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstResp &&
	     tlp_tlpBRAM_readReq$D_OUT[30:29] == 2'd0 &&
	     !tlp_tlpBRAM_readReq$D_OUT[60] ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextResp ;
  assign bram_0_serverAdapterB_outData_deqCalled$whas =
	     WILL_FIRE_RL_wmi_doReadResp && wmi_p4B == 2'd0 ||
	     WILL_FIRE_RL_wmi_respMetadata ;
  assign bram_1_serverAdapterA_outData_deqCalled$whas =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstResp &&
	     tlp_tlpBRAM_readReq$D_OUT[30:29] == 2'd1 &&
	     !tlp_tlpBRAM_readReq$D_OUT[60] ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextResp ;
  assign bram_1_serverAdapterB_outData_deqCalled$whas =
	     WILL_FIRE_RL_wmi_doReadResp && wmi_p4B == 2'd1 ||
	     WILL_FIRE_RL_wmi_respMetadata ;
  assign bram_2_serverAdapterA_outData_deqCalled$whas =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstResp &&
	     tlp_tlpBRAM_readReq$D_OUT[30:29] == 2'd2 &&
	     !tlp_tlpBRAM_readReq$D_OUT[60] ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextResp ;
  assign bram_2_serverAdapterB_outData_deqCalled$whas =
	     WILL_FIRE_RL_wmi_doReadResp && wmi_p4B == 2'd2 ||
	     WILL_FIRE_RL_wmi_respMetadata ;
  assign bram_3_serverAdapterA_outData_deqCalled$whas =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstResp &&
	     tlp_tlpBRAM_readReq$D_OUT[30:29] == 2'd3 &&
	     !tlp_tlpBRAM_readReq$D_OUT[60] ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextResp ;
  assign bram_3_serverAdapterB_outData_deqCalled$whas =
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
  assign wci_respF_dequeueing$whas = wci_respF_cntr_r != 2'd0 ;
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
  assign wmi_wmi_respF_dequeueing$whas = wmi_wmi_respF_cntr_r != 2'd0 ;
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
	     wci_cState == 3'd2 &&
	     IF_bml_dpControl_wget__907_BITS_1_TO_0_913_EQ__ETC___d1993 ||
	     WILL_FIRE_RL_bml_initAccumulators ;
  // register bml_lclBufsCF
  assign bml_lclBufsCF$D_IN =
	     MUX_bml_lclBufsCF$write_1__SEL_1 ?
	       MUX_bml_lclBufsCF$write_1__VAL_1 :
	       MUX_bml_lclBufsCF$write_1__VAL_2 ;
  assign bml_lclBufsCF$EN =
	     wci_cState == 3'd2 &&
	     bml_lclBufDone_931_AND_IF_bml_dpControl_wget___ETC___d2012 ||
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
  assign bml_remDone$D_IN = tlp_remDone ;
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
  assign bml_remStart$D_IN = tlp_remStart ;
  assign bml_remStart$EN = 1'd1 ;
  // register bml_remStarts
  assign bml_remStarts$D_IN = bml_remStarts + 16'd1 ;
  assign bml_remStarts$EN = wci_cState == 3'd2 && bml_remStart ;
  // register bram_0_serverAdapterA_cnt
  assign bram_0_serverAdapterA_cnt$D_IN =
	     bram_0_serverAdapterA_cnt_6_PLUS_IF_bram_0_ser_ETC___d32 ;
  assign bram_0_serverAdapterA_cnt$EN =
	     bram_0_serverAdapterA_cnt_1$whas ||
	     bram_0_serverAdapterA_outData_deqCalled$whas ;
  // register bram_0_serverAdapterA_s1
  assign bram_0_serverAdapterA_s1$D_IN =
	     { bram_0_serverAdapterA_writeWithResp$whas &&
	       bram_0_serverAdapterA_s1_1$wget[1],
	       bram_0_serverAdapterA_s1_1$wget[0] } ;
  assign bram_0_serverAdapterA_s1$EN = 1'd1 ;
  // register bram_0_serverAdapterB_cnt
  assign bram_0_serverAdapterB_cnt$D_IN =
	     bram_0_serverAdapterB_cnt_5_PLUS_IF_bram_0_ser_ETC___d91 ;
  assign bram_0_serverAdapterB_cnt$EN =
	     bram_0_serverAdapterB_cnt_1$whas ||
	     bram_0_serverAdapterB_outData_deqCalled$whas ;
  // register bram_0_serverAdapterB_s1
  assign bram_0_serverAdapterB_s1$D_IN =
	     { bram_0_serverAdapterB_writeWithResp$whas &&
	       bram_0_serverAdapterB_s1_1$wget[1],
	       bram_0_serverAdapterB_s1_1$wget[0] } ;
  assign bram_0_serverAdapterB_s1$EN = 1'd1 ;
  // register bram_1_serverAdapterA_cnt
  assign bram_1_serverAdapterA_cnt$D_IN =
	     bram_1_serverAdapterA_cnt_44_PLUS_IF_bram_1_se_ETC___d150 ;
  assign bram_1_serverAdapterA_cnt$EN =
	     bram_1_serverAdapterA_cnt_1$whas ||
	     bram_1_serverAdapterA_outData_deqCalled$whas ;
  // register bram_1_serverAdapterA_s1
  assign bram_1_serverAdapterA_s1$D_IN =
	     { bram_1_serverAdapterA_writeWithResp$whas &&
	       bram_1_serverAdapterA_s1_1$wget[1],
	       bram_1_serverAdapterA_s1_1$wget[0] } ;
  assign bram_1_serverAdapterA_s1$EN = 1'd1 ;
  // register bram_1_serverAdapterB_cnt
  assign bram_1_serverAdapterB_cnt$D_IN =
	     bram_1_serverAdapterB_cnt_03_PLUS_IF_bram_1_se_ETC___d209 ;
  assign bram_1_serverAdapterB_cnt$EN =
	     bram_1_serverAdapterB_cnt_1$whas ||
	     bram_1_serverAdapterB_outData_deqCalled$whas ;
  // register bram_1_serverAdapterB_s1
  assign bram_1_serverAdapterB_s1$D_IN =
	     { bram_1_serverAdapterB_writeWithResp$whas &&
	       bram_1_serverAdapterB_s1_1$wget[1],
	       bram_1_serverAdapterB_s1_1$wget[0] } ;
  assign bram_1_serverAdapterB_s1$EN = 1'd1 ;
  // register bram_2_serverAdapterA_cnt
  assign bram_2_serverAdapterA_cnt$D_IN =
	     bram_2_serverAdapterA_cnt_62_PLUS_IF_bram_2_se_ETC___d268 ;
  assign bram_2_serverAdapterA_cnt$EN =
	     bram_2_serverAdapterA_cnt_1$whas ||
	     bram_2_serverAdapterA_outData_deqCalled$whas ;
  // register bram_2_serverAdapterA_s1
  assign bram_2_serverAdapterA_s1$D_IN =
	     { bram_2_serverAdapterA_writeWithResp$whas &&
	       bram_2_serverAdapterA_s1_1$wget[1],
	       bram_2_serverAdapterA_s1_1$wget[0] } ;
  assign bram_2_serverAdapterA_s1$EN = 1'd1 ;
  // register bram_2_serverAdapterB_cnt
  assign bram_2_serverAdapterB_cnt$D_IN =
	     bram_2_serverAdapterB_cnt_21_PLUS_IF_bram_2_se_ETC___d327 ;
  assign bram_2_serverAdapterB_cnt$EN =
	     bram_2_serverAdapterB_cnt_1$whas ||
	     bram_2_serverAdapterB_outData_deqCalled$whas ;
  // register bram_2_serverAdapterB_s1
  assign bram_2_serverAdapterB_s1$D_IN =
	     { bram_2_serverAdapterB_writeWithResp$whas &&
	       bram_2_serverAdapterB_s1_1$wget[1],
	       bram_2_serverAdapterB_s1_1$wget[0] } ;
  assign bram_2_serverAdapterB_s1$EN = 1'd1 ;
  // register bram_3_serverAdapterA_cnt
  assign bram_3_serverAdapterA_cnt$D_IN =
	     bram_3_serverAdapterA_cnt_80_PLUS_IF_bram_3_se_ETC___d386 ;
  assign bram_3_serverAdapterA_cnt$EN =
	     bram_3_serverAdapterA_cnt_1$whas ||
	     bram_3_serverAdapterA_outData_deqCalled$whas ;
  // register bram_3_serverAdapterA_s1
  assign bram_3_serverAdapterA_s1$D_IN =
	     { bram_3_serverAdapterA_writeWithResp$whas &&
	       bram_3_serverAdapterA_s1_1$wget[1],
	       bram_3_serverAdapterA_s1_1$wget[0] } ;
  assign bram_3_serverAdapterA_s1$EN = 1'd1 ;
  // register bram_3_serverAdapterB_cnt
  assign bram_3_serverAdapterB_cnt$D_IN =
	     bram_3_serverAdapterB_cnt_39_PLUS_IF_bram_3_se_ETC___d445 ;
  assign bram_3_serverAdapterB_cnt$EN =
	     bram_3_serverAdapterB_cnt_1$whas ||
	     bram_3_serverAdapterB_outData_deqCalled$whas ;
  // register bram_3_serverAdapterB_s1
  assign bram_3_serverAdapterB_s1$D_IN =
	     { bram_3_serverAdapterB_writeWithResp$whas &&
	       bram_3_serverAdapterB_s1_1$wget[1],
	       bram_3_serverAdapterB_s1_1$wget[0] } ;
  assign bram_3_serverAdapterB_s1$EN = 1'd1 ;
  // register dmaDoneTime
  assign dmaDoneTime$D_IN = wti_nowReq[63:0] ;
  assign dmaDoneTime$EN = tlp_dmaDoneMark ;
  // register dmaStartTime
  assign dmaStartTime$D_IN = wti_nowReq[63:0] ;
  assign dmaStartTime$EN = tlp_dmaStartMark ;
  // register dpControl
  assign dpControl$D_IN = wci_reqF$D_OUT[7:0] ;
  assign dpControl$EN =
	     WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h68 ;
  // register tlp_complTimerCount
  assign tlp_complTimerCount$D_IN =
	     tlp_complTimerRunning ? tlp_complTimerCount + 12'd1 : 12'd0 ;
  assign tlp_complTimerCount$EN = 1'd1 ;
  // register tlp_complTimerRunning
  assign tlp_complTimerRunning$D_IN =
	     WILL_FIRE_RL_tlp_dmaPullRequestFarMesg ||
	     WILL_FIRE_RL_tlp_dmaRequestFarMeta ;
  assign tlp_complTimerRunning$EN =
	     WILL_FIRE_RL_tlp_dmaPullTailEvent ||
	     WILL_FIRE_RL_tlp_dmaRespHeadFarMeta ||
	     WILL_FIRE_RL_tlp_dmaPullRequestFarMesg ||
	     WILL_FIRE_RL_tlp_dmaRequestFarMeta ;
  // register tlp_creditReady
  assign tlp_creditReady$D_IN = tlp_creditReady_1$whas ;
  assign tlp_creditReady$EN = 1'd1 ;
  // register tlp_dmaDoTailEvent
  always@(WILL_FIRE_RL_tlp_dmaPullResponseBody or
	  MUX_tlp_dmaDoTailEvent$write_1__VAL_1 or
	  WILL_FIRE_RL_tlp_dmaPullResponseHeader or
	  tlp_dmaPullRemainDWLen or
	  WILL_FIRE_RL_tlp_dmaRespBodyFarMeta or
	  tlp_mesgLengthRemainPull or WILL_FIRE_RL_tlp_dmaPullTailEvent)
  case (1'b1)
    WILL_FIRE_RL_tlp_dmaPullResponseBody:
	tlp_dmaDoTailEvent$D_IN = MUX_tlp_dmaDoTailEvent$write_1__VAL_1;
    WILL_FIRE_RL_tlp_dmaPullResponseHeader:
	tlp_dmaDoTailEvent$D_IN = tlp_dmaPullRemainDWLen == 10'd1;
    WILL_FIRE_RL_tlp_dmaRespBodyFarMeta:
	tlp_dmaDoTailEvent$D_IN = tlp_mesgLengthRemainPull == 17'd0;
    WILL_FIRE_RL_tlp_dmaPullTailEvent: tlp_dmaDoTailEvent$D_IN = 1'd0;
    default: tlp_dmaDoTailEvent$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign tlp_dmaDoTailEvent$EN =
	     WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ||
	     WILL_FIRE_RL_tlp_dmaPullResponseHeader ||
	     WILL_FIRE_RL_tlp_dmaPullResponseBody ||
	     WILL_FIRE_RL_tlp_dmaPullTailEvent ;
  // register tlp_dmaDoneMark
  assign tlp_dmaDoneMark$D_IN = WILL_FIRE_RL_tlp_dmaTailEventSender ;
  assign tlp_dmaDoneMark$EN = 1'd1 ;
  // register tlp_dmaPullRemainDWLen
  always@(WILL_FIRE_RL_tlp_dmaPullRequestFarMesg or
	  thisRequestLength__h63893 or
	  WILL_FIRE_RL_tlp_dmaPullResponseHeader or
	  MUX_tlp_dmaPullRemainDWLen$write_1__VAL_2 or
	  WILL_FIRE_RL_tlp_dmaPullResponseBody or
	  MUX_tlp_dmaPullRemainDWLen$write_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_tlp_dmaPullRequestFarMesg:
	  tlp_dmaPullRemainDWLen$D_IN = thisRequestLength__h63893[11:2];
      WILL_FIRE_RL_tlp_dmaPullResponseHeader:
	  tlp_dmaPullRemainDWLen$D_IN =
	      MUX_tlp_dmaPullRemainDWLen$write_1__VAL_2;
      WILL_FIRE_RL_tlp_dmaPullResponseBody:
	  tlp_dmaPullRemainDWLen$D_IN =
	      MUX_tlp_dmaPullRemainDWLen$write_1__VAL_3;
      default: tlp_dmaPullRemainDWLen$D_IN =
		   10'b1010101010 /* unspecified value */ ;
    endcase
  end
  assign tlp_dmaPullRemainDWLen$EN =
	     WILL_FIRE_RL_tlp_dmaPullRequestFarMesg ||
	     WILL_FIRE_RL_tlp_dmaPullResponseHeader ||
	     WILL_FIRE_RL_tlp_dmaPullResponseBody ;
  // register tlp_dmaPullRemainDWSub
  assign tlp_dmaPullRemainDWSub$D_IN =
	     WILL_FIRE_RL_tlp_dmaPullResponseHeader ?
	       MUX_tlp_dmaPullRemainDWSub$write_1__VAL_1 :
	       MUX_tlp_dmaPullRemainDWSub$write_1__VAL_2 ;
  assign tlp_dmaPullRemainDWSub$EN =
	     WILL_FIRE_RL_tlp_dmaPullResponseHeader ||
	     WILL_FIRE_RL_tlp_dmaPullResponseBody ;
  // register tlp_dmaReqTag
  assign tlp_dmaReqTag$D_IN = tlp_dmaTag ;
  assign tlp_dmaReqTag$EN = tlp_complTimerRunning$D_IN ;
  // register tlp_dmaStartMark
  assign tlp_dmaStartMark$D_IN = tlp_dmaStartMark_1$whas ;
  assign tlp_dmaStartMark$EN = 1'd1 ;
  // register tlp_dmaTag
  assign tlp_dmaTag$D_IN = tlp_dmaTag + 5'd1 ;
  assign tlp_dmaTag$EN = tlp_complTimerRunning$D_IN ;
  // register tlp_doXmtMetaBody
  assign tlp_doXmtMetaBody$D_IN = !WILL_FIRE_RL_tlp_dmaXmtMetaBody ;
  assign tlp_doXmtMetaBody$EN =
	     WILL_FIRE_RL_tlp_dmaXmtMetaBody ||
	     WILL_FIRE_RL_tlp_dmaXmtMetaHead ;
  // register tlp_doorSeqDwell
  assign tlp_doorSeqDwell$D_IN =
	     (tlp_doorSeqDwell != 4'd0) ?
	       MUX_tlp_doorSeqDwell$write_1__VAL_1 :
	       4'd8 ;
  assign tlp_doorSeqDwell$EN =
	     tlp_doorSeqDwell != 4'd0 || WILL_FIRE_RL_tlp_dmaXmtDoorbell ;
  // register tlp_fabFlowAddr
  assign tlp_fabFlowAddr$D_IN = bml_fabFlowAddr ;
  assign tlp_fabFlowAddr$EN = 1'd1 ;
  // register tlp_fabFlowAddrMS
  assign tlp_fabFlowAddrMS$D_IN = bml_fabFlowBaseMS ;
  assign tlp_fabFlowAddrMS$EN = 1'd1 ;
  // register tlp_fabMesgAccu
  always@(MUX_tlp_fabMesgAccu$write_1__SEL_1 or
	  tlp_fabMesgAddr or
	  WILL_FIRE_RL_tlp_dmaPushResponseHeader or
	  MUX_tlp_fabMesgAccu$write_1__VAL_2 or
	  WILL_FIRE_RL_tlp_dmaPullRequestFarMesg or
	  MUX_tlp_fabMesgAccu$write_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_tlp_fabMesgAccu$write_1__SEL_1:
	  tlp_fabMesgAccu$D_IN = tlp_fabMesgAddr;
      WILL_FIRE_RL_tlp_dmaPushResponseHeader:
	  tlp_fabMesgAccu$D_IN = MUX_tlp_fabMesgAccu$write_1__VAL_2;
      WILL_FIRE_RL_tlp_dmaPullRequestFarMesg:
	  tlp_fabMesgAccu$D_IN = MUX_tlp_fabMesgAccu$write_1__VAL_3;
      default: tlp_fabMesgAccu$D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign tlp_fabMesgAccu$EN =
	     WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ||
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_tlp_dmaPushResponseHeader ||
	     WILL_FIRE_RL_tlp_dmaPullRequestFarMesg ;
  // register tlp_fabMesgAddr
  assign tlp_fabMesgAddr$D_IN = bml_fabMesgAddr ;
  assign tlp_fabMesgAddr$EN = 1'd1 ;
  // register tlp_fabMesgAddrMS
  assign tlp_fabMesgAddrMS$D_IN = bml_fabMesgBaseMS ;
  assign tlp_fabMesgAddrMS$EN = 1'd1 ;
  // register tlp_fabMeta
  always@(WILL_FIRE_RL_tlp_dmaResponseNearMetaBody or
	  MUX_tlp_fabMeta$write_1__VAL_1 or
	  MUX_tlp_fabMeta$write_1__SEL_2 or
	  WILL_FIRE_RL_tlp_dmaRespBodyFarMeta or
	  MUX_tlp_fabMeta$write_1__VAL_3)
  case (1'b1)
    WILL_FIRE_RL_tlp_dmaResponseNearMetaBody:
	tlp_fabMeta$D_IN = MUX_tlp_fabMeta$write_1__VAL_1;
    MUX_tlp_fabMeta$write_1__SEL_2:
	tlp_fabMeta$D_IN = 129'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    WILL_FIRE_RL_tlp_dmaRespBodyFarMeta:
	tlp_fabMeta$D_IN = MUX_tlp_fabMeta$write_1__VAL_3;
    default: tlp_fabMeta$D_IN =
		 129'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
  endcase
  assign tlp_fabMeta$EN =
	     WILL_FIRE_RL_tlp_dmaTailEventSender &&
	     (tlp_fabFlowAddrMS == 32'd0 || tlp_sentTail4DWHeader) ||
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ;
  // register tlp_fabMetaAddr
  assign tlp_fabMetaAddr$D_IN = bml_fabMetaAddr ;
  assign tlp_fabMetaAddr$EN = 1'd1 ;
  // register tlp_fabMetaAddrMS
  assign tlp_fabMetaAddrMS$D_IN = bml_fabMetaBaseMS ;
  assign tlp_fabMetaAddrMS$EN = 1'd1 ;
  // register tlp_farBufReady
  assign tlp_farBufReady$D_IN = tlp_farBufReady_1$whas ;
  assign tlp_farBufReady$EN = 1'd1 ;
  // register tlp_flowDiagCount
  assign tlp_flowDiagCount$D_IN = tlp_flowDiagCount + 32'd1 ;
  assign tlp_flowDiagCount$EN = WILL_FIRE_RL_tlp_dmaXmtDoorbell ;
  // register tlp_gotResponseHeader
  always@(WILL_FIRE_RL_tlp_dmaPullResponseBody or
	  tlp_dmaPullRemainDWSub_387_ULE_4___d1388 or
	  WILL_FIRE_RL_tlp_dmaPullResponseHeader or
	  tlp_inF$D_OUT or WILL_FIRE_RL_tlp_dmaPullRequestFarMesg)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_tlp_dmaPullResponseBody:
	  tlp_gotResponseHeader$D_IN =
	      !tlp_dmaPullRemainDWSub_387_ULE_4___d1388;
      WILL_FIRE_RL_tlp_dmaPullResponseHeader:
	  tlp_gotResponseHeader$D_IN = tlp_inF$D_OUT[105:96] != 10'd1;
      WILL_FIRE_RL_tlp_dmaPullRequestFarMesg:
	  tlp_gotResponseHeader$D_IN = 1'd0;
      default: tlp_gotResponseHeader$D_IN = 1'b0 /* unspecified value */ ;
    endcase
  end
  assign tlp_gotResponseHeader$EN =
	     WILL_FIRE_RL_tlp_dmaPullResponseBody ||
	     WILL_FIRE_RL_tlp_dmaPullResponseHeader ||
	     WILL_FIRE_RL_tlp_dmaPullRequestFarMesg ;
  // register tlp_inIgnorePkt
  assign tlp_inIgnorePkt$D_IN =
	     tlp_inF$D_OUT[110] || tlp_inF$D_OUT[125] ||
	     tlp_inF$D_OUT[124:120] != 5'b0 ;
  assign tlp_inIgnorePkt$EN = WILL_FIRE_RL_tlp_tlpRcv && tlp_inF$D_OUT[152] ;
  // register tlp_lastMetaV_0
  assign tlp_lastMetaV_0$D_IN =
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaHead ?
	       x__h42208 :
	       x__h58352 ;
  assign tlp_lastMetaV_0$EN =
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaHead ||
	     WILL_FIRE_RL_tlp_dmaRespHeadFarMeta ;
  // register tlp_lastMetaV_1
  assign tlp_lastMetaV_1$D_IN =
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ?
	       opcode__h44022 :
	       opcode__h60417 ;
  assign tlp_lastMetaV_1$EN =
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ;
  // register tlp_lastMetaV_2
  assign tlp_lastMetaV_2$D_IN =
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ?
	       nowMS__h45280 :
	       nowMS__h61665 ;
  assign tlp_lastMetaV_2$EN =
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ;
  // register tlp_lastMetaV_3
  assign tlp_lastMetaV_3$D_IN =
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ?
	       nowLS__h46239 :
	       nowLS__h62622 ;
  assign tlp_lastMetaV_3$EN =
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ;
  // register tlp_lastRuleFired
  always@(WILL_FIRE_RL_tlp_dmaPullRequestFarMesg or
	  WILL_FIRE_RL_tlp_dmaRequestFarMeta or
	  WILL_FIRE_RL_tlp_dmaTailEventSender or
	  MUX_tlp_lastRuleFired$write_1__VAL_3 or
	  WILL_FIRE_RL_tlp_dmaPullResponseBody or
	  WILL_FIRE_RL_tlp_dmaPullResponseHeader or
	  WILL_FIRE_RL_tlp_dmaRespBodyFarMeta or
	  WILL_FIRE_RL_tlp_dmaPullTailEvent or
	  WILL_FIRE_RL_tlp_dmaRespHeadFarMeta)
  case (1'b1)
    WILL_FIRE_RL_tlp_dmaPullRequestFarMesg: tlp_lastRuleFired$D_IN = 4'd4;
    WILL_FIRE_RL_tlp_dmaRequestFarMeta: tlp_lastRuleFired$D_IN = 4'd1;
    WILL_FIRE_RL_tlp_dmaTailEventSender:
	tlp_lastRuleFired$D_IN = MUX_tlp_lastRuleFired$write_1__VAL_3;
    WILL_FIRE_RL_tlp_dmaPullResponseBody: tlp_lastRuleFired$D_IN = 4'd6;
    WILL_FIRE_RL_tlp_dmaPullResponseHeader: tlp_lastRuleFired$D_IN = 4'd5;
    WILL_FIRE_RL_tlp_dmaRespBodyFarMeta: tlp_lastRuleFired$D_IN = 4'd3;
    WILL_FIRE_RL_tlp_dmaPullTailEvent: tlp_lastRuleFired$D_IN = 4'd7;
    WILL_FIRE_RL_tlp_dmaRespHeadFarMeta: tlp_lastRuleFired$D_IN = 4'd2;
    default: tlp_lastRuleFired$D_IN = 4'b1010 /* unspecified value */ ;
  endcase
  assign tlp_lastRuleFired$EN =
	     WILL_FIRE_RL_tlp_dmaTailEventSender ||
	     WILL_FIRE_RL_tlp_dmaRequestFarMeta ||
	     WILL_FIRE_RL_tlp_dmaRespHeadFarMeta ||
	     WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ||
	     WILL_FIRE_RL_tlp_dmaPullRequestFarMesg ||
	     WILL_FIRE_RL_tlp_dmaPullResponseHeader ||
	     WILL_FIRE_RL_tlp_dmaPullResponseBody ||
	     WILL_FIRE_RL_tlp_dmaPullTailEvent ;
  // register tlp_maxPayloadSize
  assign tlp_maxPayloadSize$D_IN = 13'h0 ;
  assign tlp_maxPayloadSize$EN = 1'b0 ;
  // register tlp_maxReadReqSize
  assign tlp_maxReadReqSize$D_IN = 13'h0 ;
  assign tlp_maxReadReqSize$EN = 1'b0 ;
  // register tlp_mesgComplReceived
  always@(WILL_FIRE_RL_tlp_dmaPullResponseHeader or
	  MUX_tlp_mesgComplReceived$write_1__VAL_1 or
	  WILL_FIRE_RL_tlp_dmaPullResponseBody or
	  MUX_tlp_mesgComplReceived$write_1__VAL_2 or
	  WILL_FIRE_RL_tlp_dmaRespBodyFarMeta)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_tlp_dmaPullResponseHeader:
	  tlp_mesgComplReceived$D_IN =
	      MUX_tlp_mesgComplReceived$write_1__VAL_1;
      WILL_FIRE_RL_tlp_dmaPullResponseBody:
	  tlp_mesgComplReceived$D_IN =
	      MUX_tlp_mesgComplReceived$write_1__VAL_2;
      WILL_FIRE_RL_tlp_dmaRespBodyFarMeta: tlp_mesgComplReceived$D_IN = 17'd0;
      default: tlp_mesgComplReceived$D_IN =
		   17'b01010101010101010 /* unspecified value */ ;
    endcase
  end
  assign tlp_mesgComplReceived$EN =
	     WILL_FIRE_RL_tlp_dmaPullResponseHeader ||
	     WILL_FIRE_RL_tlp_dmaPullResponseBody ||
	     WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ;
  // register tlp_mesgLengthRemainPull
  always@(WILL_FIRE_RL_tlp_dmaRespHeadFarMeta or
	  MUX_tlp_mesgLengthRemainPull$write_1__VAL_1 or
	  WILL_FIRE_RL_tlp_dmaRespBodyFarMeta or
	  MUX_tlp_mesgLengthRemainPull$write_1__VAL_2 or
	  WILL_FIRE_RL_tlp_dmaPullRequestFarMesg or
	  MUX_tlp_mesgLengthRemainPull$write_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_tlp_dmaRespHeadFarMeta:
	  tlp_mesgLengthRemainPull$D_IN =
	      MUX_tlp_mesgLengthRemainPull$write_1__VAL_1;
      WILL_FIRE_RL_tlp_dmaRespBodyFarMeta:
	  tlp_mesgLengthRemainPull$D_IN =
	      MUX_tlp_mesgLengthRemainPull$write_1__VAL_2;
      WILL_FIRE_RL_tlp_dmaPullRequestFarMesg:
	  tlp_mesgLengthRemainPull$D_IN =
	      MUX_tlp_mesgLengthRemainPull$write_1__VAL_3;
      default: tlp_mesgLengthRemainPull$D_IN =
		   17'b01010101010101010 /* unspecified value */ ;
    endcase
  end
  assign tlp_mesgLengthRemainPull$EN =
	     WILL_FIRE_RL_tlp_dmaRespHeadFarMeta ||
	     WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ||
	     WILL_FIRE_RL_tlp_dmaPullRequestFarMesg ;
  // register tlp_mesgLengthRemainPush
  always@(WILL_FIRE_RL_tlp_dmaResponseNearMetaBody or
	  MUX_tlp_mesgLengthRemainPush$write_1__VAL_1 or
	  WILL_FIRE_RL_tlp_dmaResponseNearMetaHead or
	  MUX_tlp_mesgLengthRemainPush$write_1__VAL_2 or
	  WILL_FIRE_RL_tlp_dmaPushRequestMesg or
	  MUX_tlp_mesgLengthRemainPush$write_1__VAL_3)
  case (1'b1)
    WILL_FIRE_RL_tlp_dmaResponseNearMetaBody:
	tlp_mesgLengthRemainPush$D_IN =
	    MUX_tlp_mesgLengthRemainPush$write_1__VAL_1;
    WILL_FIRE_RL_tlp_dmaResponseNearMetaHead:
	tlp_mesgLengthRemainPush$D_IN =
	    MUX_tlp_mesgLengthRemainPush$write_1__VAL_2;
    WILL_FIRE_RL_tlp_dmaPushRequestMesg:
	tlp_mesgLengthRemainPush$D_IN =
	    MUX_tlp_mesgLengthRemainPush$write_1__VAL_3;
    default: tlp_mesgLengthRemainPush$D_IN =
		 17'b01010101010101010 /* unspecified value */ ;
  endcase
  assign tlp_mesgLengthRemainPush$EN =
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaHead ||
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_tlp_dmaPushRequestMesg ;
  // register tlp_nearBufReady
  assign tlp_nearBufReady$D_IN = tlp_nearBufReady_1$whas ;
  assign tlp_nearBufReady$EN = 1'd1 ;
  // register tlp_outDwRemain
  always@(WILL_FIRE_RL_tlp_dmaPushResponseHeader or
	  MUX_tlp_outDwRemain$write_1__VAL_1 or
	  MUX_tlp_tlpXmtBusy$write_1__PSEL_2 or
	  MUX_tlp_outDwRemain$write_1__VAL_2 or
	  WILL_FIRE_RL_tlp_dataXmt_Header or
	  MUX_tlp_outDwRemain$write_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_tlp_dmaPushResponseHeader:
	  tlp_outDwRemain$D_IN = MUX_tlp_outDwRemain$write_1__VAL_1;
      MUX_tlp_tlpXmtBusy$write_1__PSEL_2:
	  tlp_outDwRemain$D_IN = MUX_tlp_outDwRemain$write_1__VAL_2;
      WILL_FIRE_RL_tlp_dataXmt_Header:
	  tlp_outDwRemain$D_IN = MUX_tlp_outDwRemain$write_1__VAL_3;
      default: tlp_outDwRemain$D_IN = 10'b1010101010 /* unspecified value */ ;
    endcase
  end
  assign tlp_outDwRemain$EN =
	     WILL_FIRE_RL_tlp_dmaPushResponseHeader ||
	     WILL_FIRE_RL_tlp_dataXmt_Body ||
	     WILL_FIRE_RL_tlp_dmaPushResponseBody ||
	     WILL_FIRE_RL_tlp_dataXmt_Header ;
  // register tlp_postSeqDwell
  assign tlp_postSeqDwell$D_IN =
	     MUX_tlp_fabMeta$write_1__SEL_2 ?
	       MUX_tlp_postSeqDwell$write_1__VAL_1 :
	       MUX_tlp_postSeqDwell$write_1__VAL_2 ;
  assign tlp_postSeqDwell$EN =
	     WILL_FIRE_RL_tlp_dmaTailEventSender &&
	     (tlp_fabFlowAddrMS == 32'd0 || tlp_sentTail4DWHeader) ||
	     tlp_postSeqDwell != 4'd0 ;
  // register tlp_pullTagMatch
  assign tlp_pullTagMatch$D_IN =
	     tlp_pullTagMatch_1$whas && tlp_pullTagMatch_1$wget ;
  assign tlp_pullTagMatch$EN = 1'd1 ;
  // register tlp_remDone
  assign tlp_remDone$D_IN = tlp_remDone_1$whas ;
  assign tlp_remDone$EN = 1'd1 ;
  // register tlp_remMesgAccu
  always@(MUX_tlp_fabMesgAccu$write_1__SEL_1 or
	  tlp_remMesgAddr or
	  WILL_FIRE_RL_tlp_dmaPushRequestMesg or
	  MUX_tlp_remMesgAccu$write_1__VAL_2 or
	  WILL_FIRE_RL_tlp_dmaPullResponseHeader or
	  MUX_tlp_remMesgAccu$write_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_tlp_fabMesgAccu$write_1__SEL_1:
	  tlp_remMesgAccu$D_IN = tlp_remMesgAddr;
      WILL_FIRE_RL_tlp_dmaPushRequestMesg:
	  tlp_remMesgAccu$D_IN = MUX_tlp_remMesgAccu$write_1__VAL_2;
      WILL_FIRE_RL_tlp_dmaPullResponseHeader:
	  tlp_remMesgAccu$D_IN = MUX_tlp_remMesgAccu$write_1__VAL_3;
      default: tlp_remMesgAccu$D_IN =
		   16'b1010101010101010 /* unspecified value */ ;
    endcase
  end
  assign tlp_remMesgAccu$EN =
	     WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ||
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_tlp_dmaPushRequestMesg ||
	     WILL_FIRE_RL_tlp_dmaPullResponseHeader ;
  // register tlp_remMesgAddr
  assign tlp_remMesgAddr$D_IN = bml_remMesgAddr ;
  assign tlp_remMesgAddr$EN = 1'd1 ;
  // register tlp_remMetaAddr
  assign tlp_remMetaAddr$D_IN = bml_remMetaAddr ;
  assign tlp_remMetaAddr$EN = 1'd1 ;
  // register tlp_remStart
  assign tlp_remStart$D_IN = tlp_remStart_1$whas ;
  assign tlp_remStart$EN = 1'd1 ;
  // register tlp_reqMesgInFlight
  always@(WILL_FIRE_RL_tlp_dmaPullResponseHeader or
	  tlp_dmaPullRemainDWLen or
	  WILL_FIRE_RL_tlp_dmaPullResponseBody or
	  MUX_tlp_reqMesgInFlight$write_1__VAL_2 or
	  WILL_FIRE_RL_tlp_dmaPullRequestFarMesg)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_tlp_dmaPullResponseHeader:
	  tlp_reqMesgInFlight$D_IN = tlp_dmaPullRemainDWLen != 10'd1;
      WILL_FIRE_RL_tlp_dmaPullResponseBody:
	  tlp_reqMesgInFlight$D_IN = MUX_tlp_reqMesgInFlight$write_1__VAL_2;
      WILL_FIRE_RL_tlp_dmaPullRequestFarMesg: tlp_reqMesgInFlight$D_IN = 1'd1;
      default: tlp_reqMesgInFlight$D_IN = 1'b0 /* unspecified value */ ;
    endcase
  end
  assign tlp_reqMesgInFlight$EN =
	     WILL_FIRE_RL_tlp_dmaPullResponseHeader ||
	     WILL_FIRE_RL_tlp_dmaPullResponseBody ||
	     WILL_FIRE_RL_tlp_dmaPullRequestFarMesg ;
  // register tlp_reqMetaBodyInFlight
  assign tlp_reqMetaBodyInFlight$D_IN = !WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ;
  assign tlp_reqMetaBodyInFlight$EN =
	     WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ||
	     WILL_FIRE_RL_tlp_dmaRespHeadFarMeta ;
  // register tlp_reqMetaInFlight
  always@(WILL_FIRE_RL_tlp_dmaRequestFarMeta or
	  WILL_FIRE_RL_tlp_dmaResponseNearMetaBody or
	  WILL_FIRE_RL_tlp_dmaRespHeadFarMeta or
	  WILL_FIRE_RL_tlp_dmaRequestNearMeta)
  case (1'b1)
    WILL_FIRE_RL_tlp_dmaRequestFarMeta: tlp_reqMetaInFlight$D_IN = 1'd1;
    WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ||
    WILL_FIRE_RL_tlp_dmaRespHeadFarMeta:
	tlp_reqMetaInFlight$D_IN = 1'd0;
    WILL_FIRE_RL_tlp_dmaRequestNearMeta: tlp_reqMetaInFlight$D_IN = 1'd1;
    default: tlp_reqMetaInFlight$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign tlp_reqMetaInFlight$EN =
	     WILL_FIRE_RL_tlp_dmaRespHeadFarMeta ||
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_tlp_dmaRequestFarMeta ||
	     WILL_FIRE_RL_tlp_dmaRequestNearMeta ;
  // register tlp_sentTail4DWHeader
  assign tlp_sentTail4DWHeader$D_IN = !tlp_sentTail4DWHeader ;
  assign tlp_sentTail4DWHeader$EN = MUX_tlp_tlpXmtBusy$write_1__SEL_3 ;
  // register tlp_srcMesgAccu
  assign tlp_srcMesgAccu$D_IN =
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ?
	       tlp_fabMesgAddr :
	       MUX_tlp_srcMesgAccu$write_1__VAL_2 ;
  assign tlp_srcMesgAccu$EN =
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_tlp_dmaPushRequestMesg ;
  // register tlp_tlpBRAM_debugBdata
  assign tlp_tlpBRAM_debugBdata$D_IN =
	     { bram_3_serverAdapterA_outData_outData$wget[7:0],
	       bram_3_serverAdapterA_outData_outData$wget[15:8],
	       bram_3_serverAdapterA_outData_outData$wget[23:16],
	       bram_3_serverAdapterA_outData_outData$wget[31:24],
	       bram_2_serverAdapterA_outData_outData$wget[7:0],
	       bram_2_serverAdapterA_outData_outData$wget[15:8],
	       bram_2_serverAdapterA_outData_outData$wget[23:16],
	       bram_2_serverAdapterA_outData_outData$wget[31:24],
	       bram_1_serverAdapterA_outData_outData$wget[7:0],
	       bram_1_serverAdapterA_outData_outData$wget[15:8],
	       bram_1_serverAdapterA_outData_outData$wget[23:16],
	       bram_1_serverAdapterA_outData_outData$wget[31:24],
	       bram_0_serverAdapterA_outData_outData$wget[7:0],
	       bram_0_serverAdapterA_outData_outData$wget[15:8],
	       bram_0_serverAdapterA_outData_outData$wget[23:16],
	       bram_0_serverAdapterA_outData_outData$wget[31:24] } ;
  assign tlp_tlpBRAM_debugBdata$EN = WILL_FIRE_RL_tlp_tlpBRAM_read_NextResp ;
  // register tlp_tlpBRAM_rdRespDwRemain
  assign tlp_tlpBRAM_rdRespDwRemain$D_IN =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstResp ?
	       MUX_tlp_tlpBRAM_rdRespDwRemain$write_1__VAL_1 :
	       MUX_tlp_tlpBRAM_rdRespDwRemain$write_1__VAL_2 ;
  assign tlp_tlpBRAM_rdRespDwRemain$EN =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstResp ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextResp ;
  // register tlp_tlpBRAM_readHeaderSent
  assign tlp_tlpBRAM_readHeaderSent$D_IN =
	     MUX_tlp_tlpBRAM_readHeaderSent$write_1__SEL_1 ;
  assign tlp_tlpBRAM_readHeaderSent$EN =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstResp &&
	     (tlp_tlpBRAM_readReq$D_OUT[28:19] != 10'd1 ||
	      tlp_tlpBRAM_readReq$D_OUT[60]) ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextResp &&
	     tlp_tlpBRAM_rdRespDwRemain_16_ULE_4___d918 ;
  // register tlp_tlpBRAM_readNxtDWAddr
  assign tlp_tlpBRAM_readNxtDWAddr$D_IN =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq ?
	       MUX_tlp_tlpBRAM_readNxtDWAddr$write_1__VAL_1 :
	       MUX_tlp_tlpBRAM_readNxtDWAddr$write_1__VAL_2 ;
  assign tlp_tlpBRAM_readNxtDWAddr$EN =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq ;
  // register tlp_tlpBRAM_readRemainDWLen
  assign tlp_tlpBRAM_readRemainDWLen$D_IN =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq ?
	       MUX_tlp_tlpBRAM_readRemainDWLen$write_1__VAL_1 :
	       MUX_tlp_tlpBRAM_readRemainDWLen$write_1__VAL_2 ;
  assign tlp_tlpBRAM_readRemainDWLen$EN =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq ;
  // register tlp_tlpBRAM_readStarted
  assign tlp_tlpBRAM_readStarted$D_IN =
	     MUX_tlp_tlpBRAM_readStarted$write_1__SEL_1 ;
  assign tlp_tlpBRAM_readStarted$EN =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq &&
	     (tlp_tlpBRAM_mReqF$D_OUT[28:19] != 10'd1 ||
	      tlp_tlpBRAM_mReqF$D_OUT[60]) ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq &&
	     tlp_tlpBRAM_readRemainDWLen_74_ULE_4___d775 ;
  // register tlp_tlpBRAM_writeDWAddr
  assign tlp_tlpBRAM_writeDWAddr$D_IN =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeReq ?
	       MUX_tlp_tlpBRAM_writeDWAddr$write_1__VAL_1 :
	       MUX_tlp_tlpBRAM_writeDWAddr$write_1__VAL_2 ;
  assign tlp_tlpBRAM_writeDWAddr$EN =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeReq ||
	     WILL_FIRE_RL_tlp_tlpBRAM_writeData ;
  // register tlp_tlpBRAM_writeLastBE
  assign tlp_tlpBRAM_writeLastBE$D_IN = tlp_tlpBRAM_mReqF$D_OUT[35:32] ;
  assign tlp_tlpBRAM_writeLastBE$EN = WILL_FIRE_RL_tlp_tlpBRAM_writeReq ;
  // register tlp_tlpBRAM_writeRemainDWLen
  assign tlp_tlpBRAM_writeRemainDWLen$D_IN =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeReq ?
	       MUX_tlp_tlpBRAM_writeRemainDWLen$write_1__VAL_1 :
	       MUX_tlp_tlpBRAM_writeRemainDWLen$write_1__VAL_2 ;
  assign tlp_tlpBRAM_writeRemainDWLen$EN =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeReq ||
	     WILL_FIRE_RL_tlp_tlpBRAM_writeData ;
  // register tlp_tlpMetaSent
  assign tlp_tlpMetaSent$D_IN = WILL_FIRE_RL_tlp_dmaXmtMetaBody ;
  assign tlp_tlpMetaSent$EN =
	     WILL_FIRE_RL_tlp_dmaXmtTailEvent ||
	     WILL_FIRE_RL_tlp_dmaXmtMetaBody ;
  // register tlp_tlpRcvBusy
  always@(WILL_FIRE_RL_tlp_dmaPullResponseBody or
	  tlp_dmaPullRemainDWSub_387_ULE_4___d1388 or
	  WILL_FIRE_RL_tlp_dmaPullResponseHeader or
	  tlp_inF$D_OUT or WILL_FIRE_RL_tlp_tlpRcv)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_tlp_dmaPullResponseBody:
	  tlp_tlpRcvBusy$D_IN = !tlp_dmaPullRemainDWSub_387_ULE_4___d1388;
      WILL_FIRE_RL_tlp_dmaPullResponseHeader:
	  tlp_tlpRcvBusy$D_IN = tlp_inF$D_OUT[105:96] != 10'd1;
      WILL_FIRE_RL_tlp_tlpRcv: tlp_tlpRcvBusy$D_IN = !tlp_inF$D_OUT[151];
      default: tlp_tlpRcvBusy$D_IN = 1'b0 /* unspecified value */ ;
    endcase
  end
  assign tlp_tlpRcvBusy$EN =
	     WILL_FIRE_RL_tlp_dmaPullResponseBody ||
	     WILL_FIRE_RL_tlp_dmaPullResponseHeader ||
	     WILL_FIRE_RL_tlp_tlpRcv ;
  // register tlp_tlpXmtBusy
  always@(MUX_tlp_tlpXmtBusy$write_1__SEL_1 or
	  MUX_tlp_tlpXmtBusy$write_1__VAL_1 or
	  MUX_tlp_tlpXmtBusy$write_1__SEL_3 or
	  tlp_sentTail4DWHeader or
	  MUX_tlp_tlpXmtBusy$write_1__SEL_2 or
	  WILL_FIRE_RL_tlp_dmaXmtMetaBody or
	  MUX_tlp_tlpXmtBusy$write_1__SEL_4 or
	  WILL_FIRE_RL_tlp_dmaXmtMetaHead)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_tlp_tlpXmtBusy$write_1__SEL_1:
	  tlp_tlpXmtBusy$D_IN = MUX_tlp_tlpXmtBusy$write_1__VAL_1;
      MUX_tlp_tlpXmtBusy$write_1__SEL_3:
	  tlp_tlpXmtBusy$D_IN = !tlp_sentTail4DWHeader;
      MUX_tlp_tlpXmtBusy$write_1__SEL_2 || WILL_FIRE_RL_tlp_dmaXmtMetaBody:
	  tlp_tlpXmtBusy$D_IN = 1'd0;
      MUX_tlp_tlpXmtBusy$write_1__SEL_4 || WILL_FIRE_RL_tlp_dmaXmtMetaHead:
	  tlp_tlpXmtBusy$D_IN = 1'd1;
      default: tlp_tlpXmtBusy$D_IN = 1'b0 /* unspecified value */ ;
    endcase
  end
  assign tlp_tlpXmtBusy$EN =
	     WILL_FIRE_RL_tlp_dmaPushResponseHeader && _dfoo5 ||
	     (WILL_FIRE_RL_tlp_dataXmt_Body ||
	      WILL_FIRE_RL_tlp_dmaPushResponseBody) &&
	     tlp_outDwRemain_129_ULE_4___d1130 ||
	     WILL_FIRE_RL_tlp_dmaTailEventSender &&
	     tlp_fabFlowAddrMS != 32'd0 ||
	     WILL_FIRE_RL_tlp_dataXmt_Header &&
	     !tlp_tlpBRAM_mRespF_first__000_BITS_71_TO_62_10_ETC___d1102 ||
	     WILL_FIRE_RL_tlp_dmaXmtMetaBody ||
	     WILL_FIRE_RL_tlp_dmaXmtMetaHead ;
  // register tlp_xmtMetaInFlight
  assign tlp_xmtMetaInFlight$D_IN = !WILL_FIRE_RL_tlp_dmaXmtTailEvent ;
  assign tlp_xmtMetaInFlight$EN =
	     WILL_FIRE_RL_tlp_dmaXmtTailEvent ||
	     WILL_FIRE_RL_tlp_dmaXmtMetaHead ;
  // register tlp_xmtMetaOK
  always@(WILL_FIRE_RL_tlp_dmaResponseNearMetaBody or
	  tlp_mesgLengthRemainPush or
	  WILL_FIRE_RL_tlp_dmaXmtMetaHead or
	  MUX_tlp_xmtMetaOK$write_1__SEL_3 or
	  MUX_tlp_xmtMetaOK$write_1__SEL_4)
  case (1'b1)
    WILL_FIRE_RL_tlp_dmaResponseNearMetaBody:
	tlp_xmtMetaOK$D_IN = tlp_mesgLengthRemainPush == 17'd0;
    WILL_FIRE_RL_tlp_dmaXmtMetaHead: tlp_xmtMetaOK$D_IN = 1'd0;
    MUX_tlp_xmtMetaOK$write_1__SEL_3 || MUX_tlp_xmtMetaOK$write_1__SEL_4:
	tlp_xmtMetaOK$D_IN = 1'd1;
    default: tlp_xmtMetaOK$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign tlp_xmtMetaOK$EN =
	     WILL_FIRE_RL_tlp_dmaPushResponseHeader &&
	     tlp_fabMesgAddrMS == 32'd0 &&
	     tlp_tlpBRAM_mRespF$D_OUT[71:62] == 10'd1 &&
	     tlp_tlpBRAM_mRespF$D_OUT[42:35] == 8'h01 ||
	     WILL_FIRE_RL_tlp_dmaPushResponseBody &&
	     tlp_outDwRemain_129_ULE_4___d1130 &&
	     tlp_tlpBRAM_mRespF$D_OUT[135:128] == 8'h01 ||
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_tlp_dmaXmtMetaHead ;
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
  // register wci_respF_cntr_r
  assign wci_respF_cntr_r$D_IN =
	     WILL_FIRE_RL_wci_respF_decCtr ?
	       wci_respF_cntr_r_90_MINUS_1___d499 :
	       MUX_wci_respF_cntr_r$write_1__VAL_2 ;
  assign wci_respF_cntr_r$EN =
	     WILL_FIRE_RL_wci_respF_decCtr || WILL_FIRE_RL_wci_respF_incCtr ;
  // register wci_respF_q_0
  always@(MUX_wci_respF_q_0$write_1__SEL_1 or
	  MUX_wci_respF_q_0$write_1__VAL_1 or
	  MUX_wci_respF_q_0$write_1__SEL_2 or
	  MUX_wci_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wci_respF_decCtr or wci_respF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_respF_q_0$write_1__SEL_1:
	  wci_respF_q_0$D_IN = MUX_wci_respF_q_0$write_1__VAL_1;
      MUX_wci_respF_q_0$write_1__SEL_2:
	  wci_respF_q_0$D_IN = MUX_wci_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wci_respF_decCtr: wci_respF_q_0$D_IN = wci_respF_q_1;
      default: wci_respF_q_0$D_IN = 34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_respF_q_0$EN =
	     WILL_FIRE_RL_wci_respF_both && _dfoo3 ||
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_cntr_r == 2'd0 ||
	     WILL_FIRE_RL_wci_respF_decCtr ;
  // register wci_respF_q_1
  always@(MUX_wci_respF_q_1$write_1__SEL_1 or
	  MUX_wci_respF_q_1$write_1__VAL_1 or
	  MUX_wci_respF_q_1$write_1__SEL_2 or
	  MUX_wci_respF_q_0$write_1__VAL_2 or WILL_FIRE_RL_wci_respF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_respF_q_1$write_1__SEL_1:
	  wci_respF_q_1$D_IN = MUX_wci_respF_q_1$write_1__VAL_1;
      MUX_wci_respF_q_1$write_1__SEL_2:
	  wci_respF_q_1$D_IN = MUX_wci_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wci_respF_decCtr: wci_respF_q_1$D_IN = 34'h0AAAAAAAA;
      default: wci_respF_q_1$D_IN = 34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_respF_q_1$EN =
	     WILL_FIRE_RL_wci_respF_both && _dfoo1 ||
	     WILL_FIRE_RL_wci_respF_incCtr && wci_respF_cntr_r == 2'd1 ||
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
  // register wmi_wmi_respF_cntr_r
  assign wmi_wmi_respF_cntr_r$D_IN =
	     WILL_FIRE_RL_wmi_wmi_respF_decCtr ?
	       wmi_wmi_respF_cntr_r_582_MINUS_1___d1590 :
	       MUX_wmi_wmi_respF_cntr_r$write_1__VAL_2 ;
  assign wmi_wmi_respF_cntr_r$EN =
	     WILL_FIRE_RL_wmi_wmi_respF_decCtr ||
	     WILL_FIRE_RL_wmi_wmi_respF_incCtr ;
  // register wmi_wmi_respF_q_0
  always@(MUX_wmi_wmi_respF_q_0$write_1__SEL_1 or
	  MUX_wmi_wmi_respF_q_0$write_1__VAL_1 or
	  MUX_wmi_wmi_respF_q_0$write_1__SEL_2 or
	  MUX_wmi_wmi_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wmi_wmi_respF_decCtr or wmi_wmi_respF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmi_wmi_respF_q_0$write_1__SEL_1:
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
	     WILL_FIRE_RL_wmi_wmi_respF_both && _dfoo9 ||
	     WILL_FIRE_RL_wmi_wmi_respF_incCtr &&
	     wmi_wmi_respF_cntr_r == 2'd0 ||
	     WILL_FIRE_RL_wmi_wmi_respF_decCtr ;
  // register wmi_wmi_respF_q_1
  always@(MUX_wmi_wmi_respF_q_1$write_1__SEL_1 or
	  MUX_wmi_wmi_respF_q_1$write_1__VAL_1 or
	  MUX_wmi_wmi_respF_q_1$write_1__SEL_2 or
	  MUX_wmi_wmi_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wmi_wmi_respF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmi_wmi_respF_q_1$write_1__SEL_1:
	  wmi_wmi_respF_q_1$D_IN = MUX_wmi_wmi_respF_q_1$write_1__VAL_1;
      MUX_wmi_wmi_respF_q_1$write_1__SEL_2:
	  wmi_wmi_respF_q_1$D_IN = MUX_wmi_wmi_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wmi_wmi_respF_decCtr: wmi_wmi_respF_q_1$D_IN = 34'd0;
      default: wmi_wmi_respF_q_1$D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmi_wmi_respF_q_1$EN =
	     WILL_FIRE_RL_wmi_wmi_respF_both && _dfoo7 ||
	     WILL_FIRE_RL_wmi_wmi_respF_incCtr &&
	     wmi_wmi_respF_cntr_r == 2'd1 ||
	     WILL_FIRE_RL_wmi_wmi_respF_decCtr ;
  // register wmi_wmi_sFlagReg
  assign wmi_wmi_sFlagReg$D_IN =
	     { y_avValue__h82927[7:0], y_avValue__h82907[23:0] } ;
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
  assign wti_nowReq$D_IN = wti_s_req ;
  assign wti_nowReq$EN = 1'd1 ;
  // register wti_operateD
  assign wti_operateD$D_IN = 1'b1 ;
  assign wti_operateD$EN = 1'd1 ;
  // submodule bram_0_memory
  always@(MUX_bram_0_memory$a_put_1__SEL_1 or
	  MUX_bram_0_memory$a_put_2__VAL_1 or
	  MUX_bram_0_memory$a_put_1__SEL_2 or
	  tlp_tlpBRAM_mReqF$D_OUT or
	  MUX_bram_0_memory$a_put_1__SEL_3 or
	  WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq or
	  MUX_bram_0_memory$a_put_2__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_0_memory$a_put_1__SEL_1:
	  bram_0_memory$ADDRA = MUX_bram_0_memory$a_put_2__VAL_1;
      MUX_bram_0_memory$a_put_1__SEL_2:
	  bram_0_memory$ADDRA = tlp_tlpBRAM_mReqF$D_OUT[62:52];
      MUX_bram_0_memory$a_put_1__SEL_3:
	  bram_0_memory$ADDRA = tlp_tlpBRAM_mReqF$D_OUT[41:31];
      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq:
	  bram_0_memory$ADDRA = MUX_bram_0_memory$a_put_2__VAL_4;
      default: bram_0_memory$ADDRA = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(WILL_FIRE_RL_wmi_reqMetadata or
	  WILL_FIRE_RL_wmi_doWriteFinalize or
	  wmi_lclMetaAddr or
	  MUX_bram_0_memory$b_put_1__SEL_1 or
	  MUX_bram_0_memory$b_put_2__VAL_1 or
	  MUX_bram_0_memory$b_put_1__SEL_2)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_reqMetadata || WILL_FIRE_RL_wmi_doWriteFinalize:
	  bram_0_memory$ADDRB = wmi_lclMetaAddr[14:4];
      MUX_bram_0_memory$b_put_1__SEL_1:
	  bram_0_memory$ADDRB = MUX_bram_0_memory$b_put_2__VAL_1;
      MUX_bram_0_memory$b_put_1__SEL_2:
	  bram_0_memory$ADDRB = MUX_bram_0_memory$b_put_2__VAL_1;
      default: bram_0_memory$ADDRB = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(MUX_bram_0_memory$a_put_1__SEL_1 or
	  MUX_bram_0_memory$a_put_3__VAL_1 or
	  MUX_bram_0_memory$a_put_1__SEL_2 or
	  MUX_bram_0_memory$a_put_3__VAL_2 or
	  MUX_bram_0_memory$a_put_1__SEL_3 or
	  WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_0_memory$a_put_1__SEL_1:
	  bram_0_memory$DIA = MUX_bram_0_memory$a_put_3__VAL_1;
      MUX_bram_0_memory$a_put_1__SEL_2:
	  bram_0_memory$DIA = MUX_bram_0_memory$a_put_3__VAL_2;
      MUX_bram_0_memory$a_put_1__SEL_3 ||
      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq:
	  bram_0_memory$DIA = 32'd0;
      default: bram_0_memory$DIA = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(MUX_bram_0_memory$b_put_1__SEL_2 or
	  wmi_wmi_dhF$D_OUT or
	  WILL_FIRE_RL_wmi_doWriteFinalize or
	  x3__h81484 or
	  MUX_bram_0_memory$b_put_1__SEL_1 or WILL_FIRE_RL_wmi_reqMetadata)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_0_memory$b_put_1__SEL_2:
	  bram_0_memory$DIB = wmi_wmi_dhF$D_OUT[35:4];
      WILL_FIRE_RL_wmi_doWriteFinalize: bram_0_memory$DIB = x3__h81484;
      MUX_bram_0_memory$b_put_1__SEL_1 || WILL_FIRE_RL_wmi_reqMetadata:
	  bram_0_memory$DIB = 32'd0;
      default: bram_0_memory$DIB = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign bram_0_memory$WEA =
	     !MUX_bram_0_memory$a_put_1__SEL_3 &&
	     !WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq ;
  assign bram_0_memory$WEB =
	     !MUX_bram_0_memory$b_put_1__SEL_1 &&
	     !WILL_FIRE_RL_wmi_reqMetadata ;
  assign bram_0_memory$ENA =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeData &&
	     SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d665 ||
	     WILL_FIRE_RL_tlp_tlpBRAM_writeReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd0 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[63] ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd0 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[60] ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq ;
  assign bram_0_memory$ENB =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd0 ||
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd0 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  // submodule bram_0_serverAdapterA_outDataCore
  assign bram_0_serverAdapterA_outDataCore$D_IN = bram_0_memory$DOA ;
  assign bram_0_serverAdapterA_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_0_serverAdapterA_outData_enqAndDeq ||
	     bram_0_serverAdapterA_outDataCore$FULL_N &&
	     !bram_0_serverAdapterA_outData_deqCalled$whas &&
	     bram_0_serverAdapterA_outData_enqData$whas ;
  assign bram_0_serverAdapterA_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_0_serverAdapterA_outData_enqAndDeq ||
	     bram_0_serverAdapterA_outDataCore$EMPTY_N &&
	     bram_0_serverAdapterA_outData_deqCalled$whas &&
	     !bram_0_serverAdapterA_outData_enqData$whas ;
  assign bram_0_serverAdapterA_outDataCore$CLR = 1'b0 ;
  // submodule bram_0_serverAdapterB_outDataCore
  assign bram_0_serverAdapterB_outDataCore$D_IN = bram_0_memory$DOB ;
  assign bram_0_serverAdapterB_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_0_serverAdapterB_outData_enqAndDeq ||
	     bram_0_serverAdapterB_outDataCore$FULL_N &&
	     !bram_0_serverAdapterB_outData_deqCalled$whas &&
	     bram_0_serverAdapterB_outData_enqData$whas ;
  assign bram_0_serverAdapterB_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_0_serverAdapterB_outData_enqAndDeq ||
	     bram_0_serverAdapterB_outDataCore$EMPTY_N &&
	     bram_0_serverAdapterB_outData_deqCalled$whas &&
	     !bram_0_serverAdapterB_outData_enqData$whas ;
  assign bram_0_serverAdapterB_outDataCore$CLR = 1'b0 ;
  // submodule bram_1_memory
  always@(MUX_bram_1_memory$a_put_1__SEL_1 or
	  MUX_bram_1_memory$a_put_2__VAL_1 or
	  MUX_bram_1_memory$a_put_1__SEL_2 or
	  tlp_tlpBRAM_mReqF$D_OUT or
	  MUX_bram_1_memory$a_put_1__SEL_3 or
	  WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq or
	  MUX_bram_1_memory$a_put_2__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_1_memory$a_put_1__SEL_1:
	  bram_1_memory$ADDRA = MUX_bram_1_memory$a_put_2__VAL_1;
      MUX_bram_1_memory$a_put_1__SEL_2:
	  bram_1_memory$ADDRA = tlp_tlpBRAM_mReqF$D_OUT[62:52];
      MUX_bram_1_memory$a_put_1__SEL_3:
	  bram_1_memory$ADDRA = tlp_tlpBRAM_mReqF$D_OUT[41:31];
      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq:
	  bram_1_memory$ADDRA = MUX_bram_1_memory$a_put_2__VAL_4;
      default: bram_1_memory$ADDRA = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(WILL_FIRE_RL_wmi_reqMetadata or
	  WILL_FIRE_RL_wmi_doWriteFinalize or
	  wmi_lclMetaAddr or
	  MUX_bram_1_memory$b_put_1__SEL_1 or
	  MUX_bram_0_memory$b_put_2__VAL_1 or
	  MUX_bram_1_memory$b_put_1__SEL_2)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_reqMetadata || WILL_FIRE_RL_wmi_doWriteFinalize:
	  bram_1_memory$ADDRB = wmi_lclMetaAddr[14:4];
      MUX_bram_1_memory$b_put_1__SEL_1:
	  bram_1_memory$ADDRB = MUX_bram_0_memory$b_put_2__VAL_1;
      MUX_bram_1_memory$b_put_1__SEL_2:
	  bram_1_memory$ADDRB = MUX_bram_0_memory$b_put_2__VAL_1;
      default: bram_1_memory$ADDRB = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(MUX_bram_1_memory$a_put_1__SEL_1 or
	  MUX_bram_1_memory$a_put_3__VAL_1 or
	  MUX_bram_1_memory$a_put_1__SEL_2 or
	  MUX_bram_0_memory$a_put_3__VAL_2 or
	  MUX_bram_1_memory$a_put_1__SEL_3 or
	  WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_1_memory$a_put_1__SEL_1:
	  bram_1_memory$DIA = MUX_bram_1_memory$a_put_3__VAL_1;
      MUX_bram_1_memory$a_put_1__SEL_2:
	  bram_1_memory$DIA = MUX_bram_0_memory$a_put_3__VAL_2;
      MUX_bram_1_memory$a_put_1__SEL_3 ||
      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq:
	  bram_1_memory$DIA = 32'd0;
      default: bram_1_memory$DIA = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(MUX_bram_1_memory$b_put_1__SEL_2 or
	  wmi_wmi_dhF$D_OUT or
	  WILL_FIRE_RL_wmi_doWriteFinalize or
	  mesgMeta_opcode__h81524 or
	  MUX_bram_1_memory$b_put_1__SEL_1 or WILL_FIRE_RL_wmi_reqMetadata)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_1_memory$b_put_1__SEL_2:
	  bram_1_memory$DIB = wmi_wmi_dhF$D_OUT[35:4];
      WILL_FIRE_RL_wmi_doWriteFinalize:
	  bram_1_memory$DIB = mesgMeta_opcode__h81524;
      MUX_bram_1_memory$b_put_1__SEL_1 || WILL_FIRE_RL_wmi_reqMetadata:
	  bram_1_memory$DIB = 32'd0;
      default: bram_1_memory$DIB = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign bram_1_memory$WEA =
	     !MUX_bram_1_memory$a_put_1__SEL_3 &&
	     !WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq ;
  assign bram_1_memory$WEB =
	     !MUX_bram_1_memory$b_put_1__SEL_1 &&
	     !WILL_FIRE_RL_wmi_reqMetadata ;
  assign bram_1_memory$ENA =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeData &&
	     SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d669 ||
	     WILL_FIRE_RL_tlp_tlpBRAM_writeReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd1 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[63] ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd1 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[60] ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq ;
  assign bram_1_memory$ENB =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd1 ||
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd1 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  // submodule bram_1_serverAdapterA_outDataCore
  assign bram_1_serverAdapterA_outDataCore$D_IN = bram_1_memory$DOA ;
  assign bram_1_serverAdapterA_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_1_serverAdapterA_outData_enqAndDeq ||
	     bram_1_serverAdapterA_outDataCore$FULL_N &&
	     !bram_1_serverAdapterA_outData_deqCalled$whas &&
	     bram_1_serverAdapterA_outData_enqData$whas ;
  assign bram_1_serverAdapterA_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_1_serverAdapterA_outData_enqAndDeq ||
	     bram_1_serverAdapterA_outDataCore$EMPTY_N &&
	     bram_1_serverAdapterA_outData_deqCalled$whas &&
	     !bram_1_serverAdapterA_outData_enqData$whas ;
  assign bram_1_serverAdapterA_outDataCore$CLR = 1'b0 ;
  // submodule bram_1_serverAdapterB_outDataCore
  assign bram_1_serverAdapterB_outDataCore$D_IN = bram_1_memory$DOB ;
  assign bram_1_serverAdapterB_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_1_serverAdapterB_outData_enqAndDeq ||
	     bram_1_serverAdapterB_outDataCore$FULL_N &&
	     !bram_1_serverAdapterB_outData_deqCalled$whas &&
	     bram_1_serverAdapterB_outData_enqData$whas ;
  assign bram_1_serverAdapterB_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_1_serverAdapterB_outData_enqAndDeq ||
	     bram_1_serverAdapterB_outDataCore$EMPTY_N &&
	     bram_1_serverAdapterB_outData_deqCalled$whas &&
	     !bram_1_serverAdapterB_outData_enqData$whas ;
  assign bram_1_serverAdapterB_outDataCore$CLR = 1'b0 ;
  // submodule bram_2_memory
  always@(MUX_bram_2_memory$a_put_1__SEL_1 or
	  MUX_bram_2_memory$a_put_2__VAL_1 or
	  MUX_bram_2_memory$a_put_1__SEL_2 or
	  tlp_tlpBRAM_mReqF$D_OUT or
	  MUX_bram_2_memory$a_put_1__SEL_3 or
	  WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq or
	  MUX_bram_2_memory$a_put_2__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_2_memory$a_put_1__SEL_1:
	  bram_2_memory$ADDRA = MUX_bram_2_memory$a_put_2__VAL_1;
      MUX_bram_2_memory$a_put_1__SEL_2:
	  bram_2_memory$ADDRA = tlp_tlpBRAM_mReqF$D_OUT[62:52];
      MUX_bram_2_memory$a_put_1__SEL_3:
	  bram_2_memory$ADDRA = tlp_tlpBRAM_mReqF$D_OUT[41:31];
      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq:
	  bram_2_memory$ADDRA = MUX_bram_2_memory$a_put_2__VAL_4;
      default: bram_2_memory$ADDRA = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(WILL_FIRE_RL_wmi_reqMetadata or
	  WILL_FIRE_RL_wmi_doWriteFinalize or
	  wmi_lclMetaAddr or
	  MUX_bram_2_memory$b_put_1__SEL_1 or
	  MUX_bram_0_memory$b_put_2__VAL_1 or
	  MUX_bram_2_memory$b_put_1__SEL_2)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_reqMetadata || WILL_FIRE_RL_wmi_doWriteFinalize:
	  bram_2_memory$ADDRB = wmi_lclMetaAddr[14:4];
      MUX_bram_2_memory$b_put_1__SEL_1:
	  bram_2_memory$ADDRB = MUX_bram_0_memory$b_put_2__VAL_1;
      MUX_bram_2_memory$b_put_1__SEL_2:
	  bram_2_memory$ADDRB = MUX_bram_0_memory$b_put_2__VAL_1;
      default: bram_2_memory$ADDRB = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(MUX_bram_2_memory$a_put_1__SEL_1 or
	  MUX_bram_2_memory$a_put_3__VAL_1 or
	  MUX_bram_2_memory$a_put_1__SEL_2 or
	  MUX_bram_0_memory$a_put_3__VAL_2 or
	  MUX_bram_2_memory$a_put_1__SEL_3 or
	  WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_2_memory$a_put_1__SEL_1:
	  bram_2_memory$DIA = MUX_bram_2_memory$a_put_3__VAL_1;
      MUX_bram_2_memory$a_put_1__SEL_2:
	  bram_2_memory$DIA = MUX_bram_0_memory$a_put_3__VAL_2;
      MUX_bram_2_memory$a_put_1__SEL_3 ||
      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq:
	  bram_2_memory$DIA = 32'd0;
      default: bram_2_memory$DIA = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(WILL_FIRE_RL_wmi_doWriteFinalize or
	  wmi_nowW$wget or
	  MUX_bram_2_memory$b_put_1__SEL_2 or
	  wmi_wmi_dhF$D_OUT or
	  MUX_bram_2_memory$b_put_1__SEL_1 or WILL_FIRE_RL_wmi_reqMetadata)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_doWriteFinalize:
	  bram_2_memory$DIB = wmi_nowW$wget[63:32];
      MUX_bram_2_memory$b_put_1__SEL_2:
	  bram_2_memory$DIB = wmi_wmi_dhF$D_OUT[35:4];
      MUX_bram_2_memory$b_put_1__SEL_1 || WILL_FIRE_RL_wmi_reqMetadata:
	  bram_2_memory$DIB = 32'd0;
      default: bram_2_memory$DIB = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign bram_2_memory$WEA =
	     !MUX_bram_2_memory$a_put_1__SEL_3 &&
	     !WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq ;
  assign bram_2_memory$WEB =
	     !MUX_bram_2_memory$b_put_1__SEL_1 &&
	     !WILL_FIRE_RL_wmi_reqMetadata ;
  assign bram_2_memory$ENA =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeData &&
	     SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d673 ||
	     WILL_FIRE_RL_tlp_tlpBRAM_writeReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd2 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[63] ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd2 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[60] ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq ;
  assign bram_2_memory$ENB =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd2 ||
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd2 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  // submodule bram_2_serverAdapterA_outDataCore
  assign bram_2_serverAdapterA_outDataCore$D_IN = bram_2_memory$DOA ;
  assign bram_2_serverAdapterA_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_2_serverAdapterA_outData_enqAndDeq ||
	     bram_2_serverAdapterA_outDataCore$FULL_N &&
	     !bram_2_serverAdapterA_outData_deqCalled$whas &&
	     bram_2_serverAdapterA_outData_enqData$whas ;
  assign bram_2_serverAdapterA_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_2_serverAdapterA_outData_enqAndDeq ||
	     bram_2_serverAdapterA_outDataCore$EMPTY_N &&
	     bram_2_serverAdapterA_outData_deqCalled$whas &&
	     !bram_2_serverAdapterA_outData_enqData$whas ;
  assign bram_2_serverAdapterA_outDataCore$CLR = 1'b0 ;
  // submodule bram_2_serverAdapterB_outDataCore
  assign bram_2_serverAdapterB_outDataCore$D_IN = bram_2_memory$DOB ;
  assign bram_2_serverAdapterB_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_2_serverAdapterB_outData_enqAndDeq ||
	     bram_2_serverAdapterB_outDataCore$FULL_N &&
	     !bram_2_serverAdapterB_outData_deqCalled$whas &&
	     bram_2_serverAdapterB_outData_enqData$whas ;
  assign bram_2_serverAdapterB_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_2_serverAdapterB_outData_enqAndDeq ||
	     bram_2_serverAdapterB_outDataCore$EMPTY_N &&
	     bram_2_serverAdapterB_outData_deqCalled$whas &&
	     !bram_2_serverAdapterB_outData_enqData$whas ;
  assign bram_2_serverAdapterB_outDataCore$CLR = 1'b0 ;
  // submodule bram_3_memory
  always@(MUX_bram_3_memory$a_put_1__SEL_1 or
	  MUX_bram_3_memory$a_put_2__VAL_1 or
	  MUX_bram_3_memory$a_put_1__SEL_2 or
	  tlp_tlpBRAM_mReqF$D_OUT or
	  MUX_bram_3_memory$a_put_1__SEL_3 or
	  WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq or
	  MUX_bram_3_memory$a_put_2__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_3_memory$a_put_1__SEL_1:
	  bram_3_memory$ADDRA = MUX_bram_3_memory$a_put_2__VAL_1;
      MUX_bram_3_memory$a_put_1__SEL_2:
	  bram_3_memory$ADDRA = tlp_tlpBRAM_mReqF$D_OUT[62:52];
      MUX_bram_3_memory$a_put_1__SEL_3:
	  bram_3_memory$ADDRA = tlp_tlpBRAM_mReqF$D_OUT[41:31];
      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq:
	  bram_3_memory$ADDRA = MUX_bram_3_memory$a_put_2__VAL_4;
      default: bram_3_memory$ADDRA = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(WILL_FIRE_RL_wmi_reqMetadata or
	  WILL_FIRE_RL_wmi_doWriteFinalize or
	  wmi_lclMetaAddr or
	  MUX_bram_3_memory$b_put_1__SEL_1 or
	  MUX_bram_0_memory$b_put_2__VAL_1 or
	  MUX_bram_3_memory$b_put_1__SEL_2)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_reqMetadata || WILL_FIRE_RL_wmi_doWriteFinalize:
	  bram_3_memory$ADDRB = wmi_lclMetaAddr[14:4];
      MUX_bram_3_memory$b_put_1__SEL_1:
	  bram_3_memory$ADDRB = MUX_bram_0_memory$b_put_2__VAL_1;
      MUX_bram_3_memory$b_put_1__SEL_2:
	  bram_3_memory$ADDRB = MUX_bram_0_memory$b_put_2__VAL_1;
      default: bram_3_memory$ADDRB = 11'b01010101010 /* unspecified value */ ;
    endcase
  end
  always@(MUX_bram_3_memory$a_put_1__SEL_1 or
	  MUX_bram_3_memory$a_put_3__VAL_1 or
	  MUX_bram_3_memory$a_put_1__SEL_2 or
	  MUX_bram_0_memory$a_put_3__VAL_2 or
	  MUX_bram_3_memory$a_put_1__SEL_3 or
	  WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_bram_3_memory$a_put_1__SEL_1:
	  bram_3_memory$DIA = MUX_bram_3_memory$a_put_3__VAL_1;
      MUX_bram_3_memory$a_put_1__SEL_2:
	  bram_3_memory$DIA = MUX_bram_0_memory$a_put_3__VAL_2;
      MUX_bram_3_memory$a_put_1__SEL_3 ||
      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq:
	  bram_3_memory$DIA = 32'd0;
      default: bram_3_memory$DIA = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(WILL_FIRE_RL_wmi_doWriteFinalize or
	  wmi_nowW$wget or
	  MUX_bram_3_memory$b_put_1__SEL_2 or
	  wmi_wmi_dhF$D_OUT or
	  MUX_bram_3_memory$b_put_1__SEL_1 or WILL_FIRE_RL_wmi_reqMetadata)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_wmi_doWriteFinalize:
	  bram_3_memory$DIB = wmi_nowW$wget[31:0];
      MUX_bram_3_memory$b_put_1__SEL_2:
	  bram_3_memory$DIB = wmi_wmi_dhF$D_OUT[35:4];
      MUX_bram_3_memory$b_put_1__SEL_1 || WILL_FIRE_RL_wmi_reqMetadata:
	  bram_3_memory$DIB = 32'd0;
      default: bram_3_memory$DIB = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign bram_3_memory$WEA =
	     !MUX_bram_3_memory$a_put_1__SEL_3 &&
	     !WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq ;
  assign bram_3_memory$WEB =
	     !MUX_bram_3_memory$b_put_1__SEL_1 &&
	     !WILL_FIRE_RL_wmi_reqMetadata ;
  assign bram_3_memory$ENA =
	     WILL_FIRE_RL_tlp_tlpBRAM_writeData &&
	     SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d677 ||
	     WILL_FIRE_RL_tlp_tlpBRAM_writeReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[51:50] == 2'd3 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[63] ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[30:29] == 2'd3 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[60] ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq ;
  assign bram_3_memory$ENB =
	     WILL_FIRE_RL_wmi_doReadReq && wmi_addr[3:2] == 2'd3 ||
	     WILL_FIRE_RL_wmi_doWriteReq && wmi_addr[3:2] == 2'd3 ||
	     WILL_FIRE_RL_wmi_reqMetadata ||
	     WILL_FIRE_RL_wmi_doWriteFinalize ;
  // submodule bram_3_serverAdapterA_outDataCore
  assign bram_3_serverAdapterA_outDataCore$D_IN = bram_3_memory$DOA ;
  assign bram_3_serverAdapterA_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_3_serverAdapterA_outData_enqAndDeq ||
	     bram_3_serverAdapterA_outDataCore$FULL_N &&
	     !bram_3_serverAdapterA_outData_deqCalled$whas &&
	     bram_3_serverAdapterA_outData_enqData$whas ;
  assign bram_3_serverAdapterA_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_3_serverAdapterA_outData_enqAndDeq ||
	     bram_3_serverAdapterA_outDataCore$EMPTY_N &&
	     bram_3_serverAdapterA_outData_deqCalled$whas &&
	     !bram_3_serverAdapterA_outData_enqData$whas ;
  assign bram_3_serverAdapterA_outDataCore$CLR = 1'b0 ;
  // submodule bram_3_serverAdapterB_outDataCore
  assign bram_3_serverAdapterB_outDataCore$D_IN = bram_3_memory$DOB ;
  assign bram_3_serverAdapterB_outDataCore$ENQ =
	     WILL_FIRE_RL_bram_3_serverAdapterB_outData_enqAndDeq ||
	     bram_3_serverAdapterB_outDataCore$FULL_N &&
	     !bram_3_serverAdapterB_outData_deqCalled$whas &&
	     bram_3_serverAdapterB_outData_enqData$whas ;
  assign bram_3_serverAdapterB_outDataCore$DEQ =
	     WILL_FIRE_RL_bram_3_serverAdapterB_outData_enqAndDeq ||
	     bram_3_serverAdapterB_outDataCore$EMPTY_N &&
	     bram_3_serverAdapterB_outData_deqCalled$whas &&
	     !bram_3_serverAdapterB_outData_enqData$whas ;
  assign bram_3_serverAdapterB_outDataCore$CLR = 1'b0 ;
  // submodule tlp_inF
  assign tlp_inF$D_IN = server_request_put ;
  assign tlp_inF$ENQ = EN_server_request_put ;
  assign tlp_inF$DEQ =
	     WILL_FIRE_RL_tlp_tlpRcv ||
	     WILL_FIRE_RL_tlp_dmaPullResponseBody ||
	     WILL_FIRE_RL_tlp_dmaPullResponseHeader ||
	     WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ||
	     WILL_FIRE_RL_tlp_dmaRespHeadFarMeta ;
  assign tlp_inF$CLR = 1'b0 ;
  // submodule tlp_outF
  always@(MUX_tlp_tlpXmtBusy$write_1__PSEL_2 or
	  MUX_tlp_outF$enq_1__VAL_1 or
	  WILL_FIRE_RL_tlp_dmaPushResponseHeader or
	  MUX_tlp_outF$enq_1__VAL_2 or
	  WILL_FIRE_RL_tlp_dmaXmtMetaHead or
	  MUX_tlp_outF$enq_1__VAL_3 or
	  WILL_FIRE_RL_tlp_dmaXmtMetaBody or
	  MUX_tlp_outF$enq_1__VAL_4 or
	  WILL_FIRE_RL_tlp_dmaRequestFarMeta or
	  MUX_tlp_outF$enq_1__VAL_5 or
	  WILL_FIRE_RL_tlp_dmaPullRequestFarMesg or
	  MUX_tlp_outF$enq_1__VAL_6 or
	  WILL_FIRE_RL_tlp_dmaTailEventSender or
	  MUX_tlp_outF$enq_1__VAL_7 or
	  WILL_FIRE_RL_tlp_dataXmt_Header or MUX_tlp_outF$enq_1__VAL_8)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_tlp_tlpXmtBusy$write_1__PSEL_2:
	  tlp_outF$D_IN = MUX_tlp_outF$enq_1__VAL_1;
      WILL_FIRE_RL_tlp_dmaPushResponseHeader:
	  tlp_outF$D_IN = MUX_tlp_outF$enq_1__VAL_2;
      WILL_FIRE_RL_tlp_dmaXmtMetaHead:
	  tlp_outF$D_IN = MUX_tlp_outF$enq_1__VAL_3;
      WILL_FIRE_RL_tlp_dmaXmtMetaBody:
	  tlp_outF$D_IN = MUX_tlp_outF$enq_1__VAL_4;
      WILL_FIRE_RL_tlp_dmaRequestFarMeta:
	  tlp_outF$D_IN = MUX_tlp_outF$enq_1__VAL_5;
      WILL_FIRE_RL_tlp_dmaPullRequestFarMesg:
	  tlp_outF$D_IN = MUX_tlp_outF$enq_1__VAL_6;
      WILL_FIRE_RL_tlp_dmaTailEventSender:
	  tlp_outF$D_IN = MUX_tlp_outF$enq_1__VAL_7;
      WILL_FIRE_RL_tlp_dataXmt_Header:
	  tlp_outF$D_IN = MUX_tlp_outF$enq_1__VAL_8;
      default: tlp_outF$D_IN =
		   153'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign tlp_outF$ENQ =
	     WILL_FIRE_RL_tlp_dataXmt_Body ||
	     WILL_FIRE_RL_tlp_dmaPushResponseBody ||
	     WILL_FIRE_RL_tlp_dmaPushResponseHeader ||
	     WILL_FIRE_RL_tlp_dmaXmtMetaHead ||
	     WILL_FIRE_RL_tlp_dmaXmtMetaBody ||
	     WILL_FIRE_RL_tlp_dmaRequestFarMeta ||
	     WILL_FIRE_RL_tlp_dmaPullRequestFarMesg ||
	     WILL_FIRE_RL_tlp_dmaTailEventSender ||
	     WILL_FIRE_RL_tlp_dataXmt_Header ;
  assign tlp_outF$DEQ = EN_server_response_get ;
  assign tlp_outF$CLR = 1'b0 ;
  // submodule tlp_tailEventF
  assign tlp_tailEventF$D_IN = !MUX_tlp_tailEventF$enq_1__SEL_1 ;
  assign tlp_tailEventF$ENQ =
	     WILL_FIRE_RL_tlp_dmaXmtDoorbell ||
	     WILL_FIRE_RL_tlp_dmaXmtTailEvent ||
	     WILL_FIRE_RL_tlp_dmaPullTailEvent ;
  assign tlp_tailEventF$DEQ = MUX_tlp_fabMeta$write_1__SEL_2 ;
  assign tlp_tailEventF$CLR = 1'b0 ;
  // submodule tlp_tlpBRAM_mReqF
  always@(MUX_tlp_tlpBRAM_mReqF$enq_1__SEL_1 or
	  MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_1 or
	  MUX_tlp_tlpBRAM_mReqF$enq_1__SEL_2 or
	  MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_2 or
	  WILL_FIRE_RL_tlp_dmaRequestNearMeta or
	  MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_3 or
	  WILL_FIRE_RL_tlp_dmaPushRequestMesg or
	  MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_4 or
	  WILL_FIRE_RL_tlp_dmaRespHeadFarMeta or
	  MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_5 or
	  WILL_FIRE_RL_tlp_dmaPullResponseHeader or
	  MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_6)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_tlp_tlpBRAM_mReqF$enq_1__SEL_1:
	  tlp_tlpBRAM_mReqF$D_IN = MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_1;
      MUX_tlp_tlpBRAM_mReqF$enq_1__SEL_2:
	  tlp_tlpBRAM_mReqF$D_IN = MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_2;
      WILL_FIRE_RL_tlp_dmaRequestNearMeta:
	  tlp_tlpBRAM_mReqF$D_IN = MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_3;
      WILL_FIRE_RL_tlp_dmaPushRequestMesg:
	  tlp_tlpBRAM_mReqF$D_IN = MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_4;
      WILL_FIRE_RL_tlp_dmaRespHeadFarMeta:
	  tlp_tlpBRAM_mReqF$D_IN = MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_5;
      WILL_FIRE_RL_tlp_dmaPullResponseHeader:
	  tlp_tlpBRAM_mReqF$D_IN = MUX_tlp_tlpBRAM_mReqF$enq_1__VAL_6;
      default: tlp_tlpBRAM_mReqF$D_IN =
		   130'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign tlp_tlpBRAM_mReqF$ENQ =
	     WILL_FIRE_RL_tlp_tlpRcv &&
	     tlp_inF_first__259_BIT_152_462_AND_NOT_tlp_inF_ETC___d1487 ||
	     WILL_FIRE_RL_tlp_dmaPullResponseBody ||
	     WILL_FIRE_RL_tlp_dmaRespBodyFarMeta ||
	     WILL_FIRE_RL_tlp_dmaRequestNearMeta ||
	     WILL_FIRE_RL_tlp_dmaPushRequestMesg ||
	     WILL_FIRE_RL_tlp_dmaRespHeadFarMeta ||
	     WILL_FIRE_RL_tlp_dmaPullResponseHeader ;
  assign tlp_tlpBRAM_mReqF$DEQ =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq &&
	     tlp_tlpBRAM_mReqF$D_OUT[28:19] == 10'd1 &&
	     !tlp_tlpBRAM_mReqF$D_OUT[60] ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq &&
	     tlp_tlpBRAM_readRemainDWLen_74_ULE_4___d775 ||
	     WILL_FIRE_RL_tlp_tlpBRAM_writeData ||
	     WILL_FIRE_RL_tlp_tlpBRAM_writeReq ;
  assign tlp_tlpBRAM_mReqF$CLR = 1'b0 ;
  // submodule tlp_tlpBRAM_mRespF
  assign tlp_tlpBRAM_mRespF$D_IN =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstResp ?
	       MUX_tlp_tlpBRAM_mRespF$enq_1__VAL_1 :
	       MUX_tlp_tlpBRAM_mRespF$enq_1__VAL_2 ;
  assign tlp_tlpBRAM_mRespF$ENQ =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstResp ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextResp ;
  assign tlp_tlpBRAM_mRespF$DEQ =
	     WILL_FIRE_RL_tlp_dataXmt_Body ||
	     WILL_FIRE_RL_tlp_dataXmt_Header ||
	     WILL_FIRE_RL_tlp_dmaPushResponseBody ||
	     WILL_FIRE_RL_tlp_dmaPushResponseHeader ||
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaBody ||
	     WILL_FIRE_RL_tlp_dmaResponseNearMetaHead ;
  assign tlp_tlpBRAM_mRespF$CLR = 1'b0 ;
  // submodule tlp_tlpBRAM_readReq
  assign tlp_tlpBRAM_readReq$D_IN = tlp_tlpBRAM_mReqF$D_OUT[60:0] ;
  assign tlp_tlpBRAM_readReq$ENQ = WILL_FIRE_RL_tlp_tlpBRAM_read_FirstReq ;
  assign tlp_tlpBRAM_readReq$DEQ =
	     WILL_FIRE_RL_tlp_tlpBRAM_read_FirstResp &&
	     tlp_tlpBRAM_readReq$D_OUT[28:19] == 10'd1 &&
	     !tlp_tlpBRAM_readReq$D_OUT[60] ||
	     WILL_FIRE_RL_tlp_tlpBRAM_read_NextResp &&
	     tlp_tlpBRAM_rdRespDwRemain_16_ULE_4___d918 ;
  assign tlp_tlpBRAM_readReq$CLR = 1'b0 ;
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
  assign IF_bml_dpControl_wget__907_BITS_1_TO_0_913_EQ__ETC___d1993 =
	     CASE_dpControl_BITS_1_TO_0_0_bml_fabDone_1_bml_ETC__q4 &&
	     !bml_lclBufStart ||
	     CASE_dpControl_BITS_1_TO_0_0_NOT_bml_fabDone_1_ETC__q5 &&
	     bml_lclBufStart ;
  assign IF_bml_dpControl_wget__907_BITS_3_TO_2_908_EQ__ETC___d2004 =
	     (dpControl[3:2] == 2'd1) ? !bml_remDone : !bml_remStart ;
  assign IF_tlp_fabMesgAddrMS_078_EQ_0_079_THEN_0_ELSE__ETC___d1353 =
	     { (tlp_fabMesgAddrMS == 32'd0) ? 22'd0 : 22'd524288,
	       thisRequestLength__h63893[11:2],
	       pciDevice,
	       tag__h64168,
	       lastBE__h64200,
	       4'd15,
	       (tlp_fabMesgAddrMS == 32'd0) ?
		 { tlp_fabMesgAccu[31:2], 34'd0 } :
		 { tlp_fabMesgAddrMS, tlp_fabMesgAccu[31:2], 2'b0 } } ;
  assign IF_tlp_fabMetaAddrMS_157_EQ_0_158_THEN_4_ELSE__ETC___d1248 =
	     { (tlp_fabMetaAddrMS == 32'd0) ? 32'd4 : 32'd536870916,
	       pciDevice,
	       tag__h64168,
	       8'd255,
	       (tlp_fabMetaAddrMS == 32'd0) ?
		 { tlp_fabMetaAddr[31:2], 34'd0 } :
		 { tlp_fabMetaAddrMS, tlp_fabMetaAddr[31:2], 2'b0 } } ;
  assign IF_tlp_tlpBRAM_readReq_first__98_BITS_30_TO_29_ETC___d929 =
	     tlp_tlpBRAM_readReq_first__98_BITS_30_TO_29_00_ETC___d922[0] ?
	       { bram_3_serverAdapterA_outData_outData$wget[7:0],
		 bram_3_serverAdapterA_outData_outData$wget[15:8],
		 bram_3_serverAdapterA_outData_outData$wget[23:16],
		 bram_3_serverAdapterA_outData_outData$wget[31:24],
		 bram_0_serverAdapterA_outData_outData$wget[7:0],
		 bram_0_serverAdapterA_outData_outData$wget[15:8],
		 bram_0_serverAdapterA_outData_outData$wget[23:16],
		 bram_0_serverAdapterA_outData_outData$wget[31:24],
		 bram_1_serverAdapterA_outData_outData$wget[7:0],
		 bram_1_serverAdapterA_outData_outData$wget[15:8],
		 bram_1_serverAdapterA_outData_outData$wget[23:16],
		 bram_1_serverAdapterA_outData_outData$wget[31:24],
		 bram_2_serverAdapterA_outData_outData$wget[7:0],
		 bram_2_serverAdapterA_outData_outData$wget[15:8],
		 bram_2_serverAdapterA_outData_outData$wget[23:16],
		 bram_2_serverAdapterA_outData_outData$wget[31:24] } :
	       { bram_2_serverAdapterA_outData_outData$wget[7:0],
		 bram_2_serverAdapterA_outData_outData$wget[15:8],
		 bram_2_serverAdapterA_outData_outData$wget[23:16],
		 bram_2_serverAdapterA_outData_outData$wget[31:24],
		 bram_3_serverAdapterA_outData_outData$wget[7:0],
		 bram_3_serverAdapterA_outData_outData$wget[15:8],
		 bram_3_serverAdapterA_outData_outData$wget[23:16],
		 bram_3_serverAdapterA_outData_outData$wget[31:24],
		 bram_0_serverAdapterA_outData_outData$wget[7:0],
		 bram_0_serverAdapterA_outData_outData$wget[15:8],
		 bram_0_serverAdapterA_outData_outData$wget[23:16],
		 bram_0_serverAdapterA_outData_outData$wget[31:24],
		 bram_1_serverAdapterA_outData_outData$wget[7:0],
		 bram_1_serverAdapterA_outData_outData$wget[15:8],
		 bram_1_serverAdapterA_outData_outData$wget[23:16],
		 bram_1_serverAdapterA_outData_outData$wget[31:24] } ;
  assign IF_tlp_tlpBRAM_readReq_first__98_BITS_30_TO_29_ETC___d934 =
	     tlp_tlpBRAM_readReq_first__98_BITS_30_TO_29_00_ETC___d922[0] ?
	       { bram_1_serverAdapterA_outData_outData$wget[7:0],
		 bram_1_serverAdapterA_outData_outData$wget[15:8],
		 bram_1_serverAdapterA_outData_outData$wget[23:16],
		 bram_1_serverAdapterA_outData_outData$wget[31:24],
		 bram_2_serverAdapterA_outData_outData$wget[7:0],
		 bram_2_serverAdapterA_outData_outData$wget[15:8],
		 bram_2_serverAdapterA_outData_outData$wget[23:16],
		 bram_2_serverAdapterA_outData_outData$wget[31:24],
		 bram_3_serverAdapterA_outData_outData$wget[7:0],
		 bram_3_serverAdapterA_outData_outData$wget[15:8],
		 bram_3_serverAdapterA_outData_outData$wget[23:16],
		 bram_3_serverAdapterA_outData_outData$wget[31:24],
		 bram_0_serverAdapterA_outData_outData$wget[7:0],
		 bram_0_serverAdapterA_outData_outData$wget[15:8],
		 bram_0_serverAdapterA_outData_outData$wget[23:16],
		 bram_0_serverAdapterA_outData_outData$wget[31:24] } :
	       { bram_0_serverAdapterA_outData_outData$wget[7:0],
		 bram_0_serverAdapterA_outData_outData$wget[15:8],
		 bram_0_serverAdapterA_outData_outData$wget[23:16],
		 bram_0_serverAdapterA_outData_outData$wget[31:24],
		 bram_1_serverAdapterA_outData_outData$wget[7:0],
		 bram_1_serverAdapterA_outData_outData$wget[15:8],
		 bram_1_serverAdapterA_outData_outData$wget[23:16],
		 bram_1_serverAdapterA_outData_outData$wget[31:24],
		 bram_2_serverAdapterA_outData_outData$wget[7:0],
		 bram_2_serverAdapterA_outData_outData$wget[15:8],
		 bram_2_serverAdapterA_outData_outData$wget[23:16],
		 bram_2_serverAdapterA_outData_outData$wget[31:24],
		 bram_3_serverAdapterA_outData_outData$wget[7:0],
		 bram_3_serverAdapterA_outData_outData$wget[15:8],
		 bram_3_serverAdapterA_outData_outData$wget[23:16],
		 bram_3_serverAdapterA_outData_outData$wget[31:24] } ;
  assign NOT_SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_5_ETC___d681 =
	     (!SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d669 ||
	      bram_1_serverAdapterA_cnt_44_SLT_3___d620) &&
	     (!SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d673 ||
	      bram_2_serverAdapterA_cnt_62_SLT_3___d621) &&
	     (!SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d677 ||
	      bram_3_serverAdapterA_cnt_80_SLT_3___d622) ;
  assign NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_1_55___d656 =
	     tlp_tlpBRAM_writeRemainDWLen > 10'd1 ;
  assign NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_2_57___d658 =
	     tlp_tlpBRAM_writeRemainDWLen > 10'd2 ;
  assign NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_3_59___d660 =
	     tlp_tlpBRAM_writeRemainDWLen > 10'd3 ;
  assign NOT_wmi_wrActive_717_718_OR_NOT_wmi_rdActive_7_ETC___d1727 =
	     (!wmi_wrActive || !wmi_rdActive) && !wmi_wrFinalize &&
	     (wmi_mesgBufReady || wmi_mesgBusy) ;
  assign _dfoo1 =
	     wci_respF_cntr_r != 2'd2 ||
	     wci_respF_cntr_r_90_MINUS_1___d499 == 2'd1 ;
  assign _dfoo3 =
	     wci_respF_cntr_r != 2'd1 ||
	     wci_respF_cntr_r_90_MINUS_1___d499 == 2'd0 ;
  assign _dfoo5 =
	     tlp_fabMesgAddrMS != 32'd0 ||
	     tlp_tlpBRAM_mRespF$D_OUT[71:62] != 10'd1 ||
	     tlp_tlpBRAM_mRespF$D_OUT[42:35] == 8'h01 ;
  assign _dfoo7 =
	     wmi_wmi_respF_cntr_r != 2'd2 ||
	     wmi_wmi_respF_cntr_r_582_MINUS_1___d1590 == 2'd1 ;
  assign _dfoo9 =
	     wmi_wmi_respF_cntr_r != 2'd1 ||
	     wmi_wmi_respF_cntr_r_582_MINUS_1___d1590 == 2'd0 ;
  assign ab__h10465 =
	     (MUX_bram_3_memory$a_put_1__SEL_3 ||
	      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq) ?
	       2'd0 :
	       2'd2 ;
  assign ab__h11870 =
	     (MUX_bram_3_memory$b_put_1__SEL_1 ||
	      WILL_FIRE_RL_wmi_reqMetadata) ?
	       2'd0 :
	       2'd2 ;
  assign ab__h1619 =
	     (MUX_bram_0_memory$a_put_1__SEL_3 ||
	      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq) ?
	       2'd0 :
	       2'd2 ;
  assign ab__h3026 =
	     (MUX_bram_0_memory$b_put_1__SEL_1 ||
	      WILL_FIRE_RL_wmi_reqMetadata) ?
	       2'd0 :
	       2'd2 ;
  assign ab__h4569 =
	     (MUX_bram_1_memory$a_put_1__SEL_3 ||
	      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq) ?
	       2'd0 :
	       2'd2 ;
  assign ab__h5974 =
	     (MUX_bram_1_memory$b_put_1__SEL_1 ||
	      WILL_FIRE_RL_wmi_reqMetadata) ?
	       2'd0 :
	       2'd2 ;
  assign ab__h7517 =
	     (MUX_bram_2_memory$a_put_1__SEL_3 ||
	      WILL_FIRE_RL_tlp_tlpBRAM_read_NextReq) ?
	       2'd0 :
	       2'd2 ;
  assign ab__h8922 =
	     (MUX_bram_2_memory$b_put_1__SEL_1 ||
	      WILL_FIRE_RL_wmi_reqMetadata) ?
	       2'd0 :
	       2'd2 ;
  assign bml_crdBuf_value_889_EQ_bml_crdBuf_modulus_bw__ETC___d1891 =
	     bml_crdBuf_value == bml_crdBuf_modulus ;
  assign bml_fabBuf_value_874_EQ_bml_fabBuf_modulus_bw__ETC___d1876 =
	     bml_fabBuf_value == bml_fabBuf_modulus ;
  assign bml_fabFlowAddr_946_PLUS_bml_fabFlowSize_947___d1948 =
	     bml_fabFlowAddr + bml_fabFlowSize ;
  assign bml_lclBufDone_931_AND_IF_bml_dpControl_wget___ETC___d2012 =
	     bml_lclBufDone &&
	     CASE_dpControl_BITS_1_TO_0_0_NOT_bml_fabDone_1_ETC__q6 ||
	     !bml_lclBufDone &&
	     CASE_dpControl_BITS_1_TO_0_0_bml_fabDone_1_IF__ETC__q7 ;
  assign bml_lclBuf_value_844_EQ_bml_lclBuf_modulus_bw__ETC___d1846 =
	     bml_lclBuf_value == bml_lclBuf_modulus ;
  assign bml_remBuf_value_859_EQ_bml_remBuf_modulus_bw__ETC___d1861 =
	     bml_remBuf_value == bml_remBuf_modulus ;
  assign bram_0_serverAdapterA_cnt_6_PLUS_IF_bram_0_ser_ETC___d32 =
	     bram_0_serverAdapterA_cnt +
	     (bram_0_serverAdapterA_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_0_serverAdapterA_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_0_serverAdapterA_cnt_6_SLT_3___d619 =
	     (bram_0_serverAdapterA_cnt ^ 3'h4) < 3'd7 ;
  assign bram_0_serverAdapterA_outDataCore_notEmpty_OR__ETC___d887 =
	     (bram_0_serverAdapterA_outDataCore$EMPTY_N ||
	      bram_0_serverAdapterA_outData_enqData$whas) &&
	     (bram_1_serverAdapterA_outDataCore$EMPTY_N ||
	      bram_1_serverAdapterA_outData_enqData$whas) &&
	     bram_2_serverAdapterA_outDataCore_notEmpty__38_ETC___d885 ;
  assign bram_0_serverAdapterB_cnt_5_PLUS_IF_bram_0_ser_ETC___d91 =
	     bram_0_serverAdapterB_cnt +
	     (bram_0_serverAdapterB_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_0_serverAdapterB_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_0_serverAdapterB_cnt_5_SLT_3___d1666 =
	     (bram_0_serverAdapterB_cnt ^ 3'h4) < 3'd7 ;
  assign bram_1_serverAdapterA_cnt_44_PLUS_IF_bram_1_se_ETC___d150 =
	     bram_1_serverAdapterA_cnt +
	     (bram_1_serverAdapterA_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_1_serverAdapterA_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_1_serverAdapterA_cnt_44_SLT_3___d620 =
	     (bram_1_serverAdapterA_cnt ^ 3'h4) < 3'd7 ;
  assign bram_1_serverAdapterB_cnt_03_PLUS_IF_bram_1_se_ETC___d209 =
	     bram_1_serverAdapterB_cnt +
	     (bram_1_serverAdapterB_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_1_serverAdapterB_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_1_serverAdapterB_cnt_03_SLT_3___d1667 =
	     (bram_1_serverAdapterB_cnt ^ 3'h4) < 3'd7 ;
  assign bram_1_serverAdapterB_outData_outData_whas__68_ETC___d1695 =
	     bram_1_serverAdapterB_outData_outData$whas &&
	     (bram_2_serverAdapterB_outDataCore$EMPTY_N ||
	      bram_2_serverAdapterB_outData_enqData$whas) &&
	     bram_2_serverAdapterB_outData_outData$whas &&
	     (bram_3_serverAdapterB_outDataCore$EMPTY_N ||
	      bram_3_serverAdapterB_outData_enqData$whas) &&
	     bram_3_serverAdapterB_outData_outData$whas ;
  assign bram_2_serverAdapterA_cnt_62_PLUS_IF_bram_2_se_ETC___d268 =
	     bram_2_serverAdapterA_cnt +
	     (bram_2_serverAdapterA_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_2_serverAdapterA_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_2_serverAdapterA_cnt_62_SLT_3___d621 =
	     (bram_2_serverAdapterA_cnt ^ 3'h4) < 3'd7 ;
  assign bram_2_serverAdapterA_outDataCore_notEmpty__38_ETC___d885 =
	     (bram_2_serverAdapterA_outDataCore$EMPTY_N ||
	      bram_2_serverAdapterA_outData_enqData$whas) &&
	     (bram_3_serverAdapterA_outDataCore$EMPTY_N ||
	      bram_3_serverAdapterA_outData_enqData$whas) &&
	     bram_0_serverAdapterA_outData_outData$whas &&
	     bram_1_serverAdapterA_outData_outData$whas &&
	     bram_2_serverAdapterA_outData_outData$whas &&
	     bram_3_serverAdapterA_outData_outData$whas &&
	     tlp_tlpBRAM_mRespF$FULL_N ;
  assign bram_2_serverAdapterB_cnt_21_PLUS_IF_bram_2_se_ETC___d327 =
	     bram_2_serverAdapterB_cnt +
	     (bram_2_serverAdapterB_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_2_serverAdapterB_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_2_serverAdapterB_cnt_21_SLT_3___d1668 =
	     (bram_2_serverAdapterB_cnt ^ 3'h4) < 3'd7 ;
  assign bram_3_serverAdapterA_cnt_80_PLUS_IF_bram_3_se_ETC___d386 =
	     bram_3_serverAdapterA_cnt +
	     (bram_3_serverAdapterA_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_3_serverAdapterA_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_3_serverAdapterA_cnt_80_SLT_3___d622 =
	     (bram_3_serverAdapterA_cnt ^ 3'h4) < 3'd7 ;
  assign bram_3_serverAdapterB_cnt_39_PLUS_IF_bram_3_se_ETC___d445 =
	     bram_3_serverAdapterB_cnt +
	     (bram_3_serverAdapterB_cnt_1$whas ? 3'd1 : 3'd0) +
	     (bram_3_serverAdapterB_outData_deqCalled$whas ? 3'd7 : 3'd0) ;
  assign bram_3_serverAdapterB_cnt_39_SLT_3___d1669 =
	     (bram_3_serverAdapterB_cnt ^ 3'h4) < 3'd7 ;
  assign byteCount__h29653 = x__h29771 - y__h29772 ;
  assign hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1233 =
	     hasPull && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd2 &&
	     dpControl[1:0] == 2'd1 &&
	     !tlp_tlpXmtBusy &&
	     !tlp_reqMetaInFlight &&
	     !tlp_reqMetaBodyInFlight &&
	     !tlp_fabMeta[128] ;
  assign hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1274 =
	     hasPull && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd2 &&
	     dpControl[1:0] == 2'd1 &&
	     tlp_reqMetaInFlight &&
	     !tlp_tlpRcvBusy &&
	     tagm__h64387 == tlp_inF$D_OUT[47:40] &&
	     tlp_inF_first__259_BITS_63_TO_56_262_EQ_pciDev_ETC___d1272 ;
  assign hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1326 =
	     hasPull && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd2 &&
	     dpControl[1:0] == 2'd1 &&
	     tlp_fabMeta[128] &&
	     tlp_fabMeta[127:96] != 32'd0 &&
	     !tlp_tlpXmtBusy &&
	     !tlp_reqMesgInFlight &&
	     tlp_mesgLengthRemainPull != 17'd0 ;
  assign hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1365 =
	     hasPull && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd2 &&
	     dpControl[1:0] == 2'd1 &&
	     tlp_fabMeta[128] &&
	     tlp_reqMesgInFlight &&
	     !tlp_tlpRcvBusy &&
	     tlp_pullTagMatch &&
	     !tlp_gotResponseHeader ;
  assign hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1385 =
	     hasPull && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd2 &&
	     dpControl[1:0] == 2'd1 &&
	     tlp_fabMeta[128] &&
	     tlp_reqMesgInFlight &&
	     tlp_gotResponseHeader ;
  assign hasPull_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1410 =
	     hasPull && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd2 &&
	     dpControl[1:0] == 2'd1 &&
	     tlp_fabMeta[128] &&
	     tlp_dmaDoTailEvent &&
	     tlp_postSeqDwell == 4'd0 &&
	     tlp_mesgComplReceived >= tlp_fabMeta[112:96] ;
  assign hasPush_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1058 =
	     hasPush && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     tlp_fabMeta[128] &&
	     tlp_fabMeta[127:96] != 32'd0 &&
	     !tlp_tlpRcvBusy &&
	     tlp_mesgLengthRemainPush != 17'd0 ;
  assign hasPush_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1098 =
	     hasPush && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     !tlp_tlpBRAM_mRespF$D_OUT[138] &&
	     tlp_tlpBRAM_mRespF$D_OUT[89:88] == 2'd2 &&
	     !tlp_tlpXmtBusy &&
	     tlp_postSeqDwell == 4'd0 ;
  assign hasPush_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d1155 =
	     hasPush && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     tlp_fabMeta[128] &&
	     !tlp_tlpXmtBusy &&
	     !tlp_xmtMetaInFlight &&
	     tlp_xmtMetaOK &&
	     tlp_postSeqDwell == 4'd0 ;
  assign hasPush_AND_tlp_dpControl_wget__64_BITS_7_TO_4_ETC___d985 =
	     hasPush && dpControl[7:4] == 4'd0 && dpControl[3:2] == 2'd1 &&
	     dpControl[1:0] == 2'd1 &&
	     !tlp_tlpRcvBusy &&
	     !tlp_reqMetaInFlight &&
	     !tlp_fabMeta[128] &&
	     tlp_nearBufReady ;
  assign idx__h21626 = 2'd0 - tlp_tlpBRAM_writeDWAddr[1:0] ;
  assign idx__h23676 = 2'd1 - tlp_tlpBRAM_writeDWAddr[1:0] ;
  assign idx__h24781 = 2'd2 - tlp_tlpBRAM_writeDWAddr[1:0] ;
  assign idx__h25886 = 2'd3 - tlp_tlpBRAM_writeDWAddr[1:0] ;
  assign idx__h27879 = 2'd0 - tlp_tlpBRAM_readNxtDWAddr[1:0] ;
  assign idx__h28282 = 2'd1 - tlp_tlpBRAM_readNxtDWAddr[1:0] ;
  assign idx__h28586 = 2'd2 - tlp_tlpBRAM_readNxtDWAddr[1:0] ;
  assign idx__h28890 = 2'd3 - tlp_tlpBRAM_readNxtDWAddr[1:0] ;
  assign lastBE__h47950 =
	     tlp_tlpBRAM_mRespF_first__000_BITS_71_TO_62_10_ETC___d1102 ?
	       4'd0 :
	       4'd15 ;
  assign lastBE__h64200 =
	     (thisRequestLength__h63893[11:2] == 10'd1) ? 4'd0 : 4'd15 ;
  assign lowAddr__h29652 =
	     { tlp_tlpBRAM_readReq$D_OUT[33:29], lowAddr10__h29651 } ;
  assign mesgMeta_opcode__h81524 =
	     { 24'h800000, wmi_wmi_mFlagF$D_OUT[31:24] } ;
  assign nowLS__h46239 =
	     { tlp_tlpBRAM_mRespF$D_OUT[39:32],
	       tlp_tlpBRAM_mRespF$D_OUT[47:40],
	       tlp_tlpBRAM_mRespF$D_OUT[55:48],
	       tlp_tlpBRAM_mRespF$D_OUT[63:56] } ;
  assign nowLS__h62622 =
	     { tlp_inF$D_OUT[39:32],
	       tlp_inF$D_OUT[47:40],
	       tlp_inF$D_OUT[55:48],
	       tlp_inF$D_OUT[63:56] } ;
  assign nowMS__h45280 =
	     { tlp_tlpBRAM_mRespF$D_OUT[71:64],
	       tlp_tlpBRAM_mRespF$D_OUT[79:72],
	       tlp_tlpBRAM_mRespF$D_OUT[87:80],
	       tlp_tlpBRAM_mRespF$D_OUT[95:88] } ;
  assign nowMS__h61665 =
	     { tlp_inF$D_OUT[71:64],
	       tlp_inF$D_OUT[79:72],
	       tlp_inF$D_OUT[87:80],
	       tlp_inF$D_OUT[95:88] } ;
  assign opcode__h44022 =
	     { tlp_tlpBRAM_mRespF$D_OUT[103:96],
	       tlp_tlpBRAM_mRespF$D_OUT[111:104],
	       tlp_tlpBRAM_mRespF$D_OUT[119:112],
	       tlp_tlpBRAM_mRespF$D_OUT[127:120] } ;
  assign opcode__h60417 =
	     { tlp_inF$D_OUT[103:96],
	       tlp_inF$D_OUT[111:104],
	       tlp_inF$D_OUT[119:112],
	       tlp_inF$D_OUT[127:120] } ;
  assign pkt__h71785 =
	     { 9'd148,
	       tlp_tlpBRAM_mRespF$D_OUT[34:32],
	       10'd0,
	       tlp_tlpBRAM_mRespF$D_OUT[71:62],
	       pciDevice,
	       4'd0,
	       tlp_tlpBRAM_mRespF$D_OUT[54:43],
	       tlp_tlpBRAM_mRespF$D_OUT[87:72],
	       tlp_tlpBRAM_mRespF$D_OUT[42:35],
	       1'b0,
	       tlp_tlpBRAM_mRespF$D_OUT[61:55],
	       tlp_tlpBRAM_mRespF$D_OUT[31:0] } ;
  assign rdat__h90951 = { 16'd0, bml_lclNumBufs } ;
  assign rdat__h90959 = { 16'd0, bml_fabNumBufs } ;
  assign rdat__h90967 = { 16'd0, bml_mesgBase } ;
  assign rdat__h90975 = { 16'd0, bml_metaBase } ;
  assign rdat__h90983 = { 16'd0, bml_mesgSize } ;
  assign rdat__h90991 = { 16'd0, bml_metaSize } ;
  assign rdat__h90999 = { 16'd0, bml_lclBufsCF } ;
  assign rdat__h91020 =
	     hasDebugLogic ? { bml_lclBufsAR, bml_fabBufsAvail } : 32'd0 ;
  assign rdat__h91027 =
	     hasDebugLogic ? { bml_remBuf_value, bml_lclBuf_value } : 32'd0 ;
  assign rdat__h91040 =
	     hasDebugLogic ? { bml_lclStarts, bml_lclDones } : 32'd0 ;
  assign rdat__h91047 =
	     hasDebugLogic ? { bml_remStarts, bml_remDones } : 32'd0 ;
  assign rdat__h91054 = hasDebugLogic ? wmi_thisMesg : 32'd0 ;
  assign rdat__h91326 = hasDebugLogic ? wmi_lastMesg : 32'd0 ;
  assign rdat__h91376 =
	     hasDebugLogic ? { wmi_reqCount, wmi_wrtCount } : 32'd0 ;
  assign rdat__h91476 = hasDebugLogic ? 32'hDADEBABE : 32'd0 ;
  assign rdat__h91534 = { 24'd0, dpControl } ;
  assign rdat__h91556 = hasDebugLogic ? tlp_flowDiagCount : 32'd0 ;
  assign rdat__h91566 =
	     hasDebugLogic ?
	       { 4'h0,
		 tlp_complTimerCount,
		 12'h0,
		 CASE_tlp_lastRuleFired_1_tlp_lastRuleFired_2_t_ETC__q1 } :
	       32'd0 ;
  assign rdat__h91688 = hasDebugLogic ? tlp_lastMetaV_0 : 32'd0 ;
  assign rdat__h91812 = hasDebugLogic ? tlp_lastMetaV_1 : 32'd0 ;
  assign rdat__h91840 = hasDebugLogic ? tlp_lastMetaV_2 : 32'd0 ;
  assign rdat__h91868 = hasDebugLogic ? tlp_lastMetaV_3 : 32'd0 ;
  assign rdat__h91896 = hasDebugLogic ? 32'hC0DE0111 : 32'd0 ;
  assign rdat__h91926 = hasDebugLogic ? dmaStartTime[31:0] : 32'd0 ;
  assign rdat__h91960 = hasDebugLogic ? dmaStartTime[63:32] : 32'd0 ;
  assign rdat__h91993 = hasDebugLogic ? dmaDoneTime[31:0] : 32'd0 ;
  assign rdat__h92027 = hasDebugLogic ? dmaDoneTime[63:32] : 32'd0 ;
  assign rdata__h35173 =
	     tlp_tlpBRAM_readReq_first__98_BITS_30_TO_29_00_ETC___d922[1] ?
	       IF_tlp_tlpBRAM_readReq_first__98_BITS_30_TO_29_ETC___d929 :
	       IF_tlp_tlpBRAM_readReq_first__98_BITS_30_TO_29_ETC___d934 ;
  assign rreq_tag__h47719 =
	     (y__h47529 == tlp_mesgLengthRemainPush) ? 8'h01 : 8'h0 ;
  assign rresp_data__h29698 =
	     { SEL_ARR_bram_0_serverAdapterA_outData_outData__ETC___d863[7:0],
	       SEL_ARR_bram_0_serverAdapterA_outData_outData__ETC___d863[15:8],
	       SEL_ARR_bram_0_serverAdapterA_outData_outData__ETC___d863[23:16],
	       SEL_ARR_bram_0_serverAdapterA_outData_outData__ETC___d863[31:24] } ;
  assign spanToNextPage__h47503 = 13'd4096 - { 1'd0, tlp_srcMesgAccu[11:0] } ;
  assign spanToNextPage__h63892 = 13'd4096 - { 1'd0, tlp_fabMesgAccu[11:0] } ;
  assign tag__h64168 = { 3'd0, tlp_dmaTag } ;
  assign tagm__h64387 = { 3'd0, tlp_dmaReqTag } ;
  assign thisRequestLength__h47504 =
	     (x__h47542[12:0] <= spanToNextPage__h47503) ?
	       x__h47542[12:0] :
	       spanToNextPage__h47503 ;
  assign thisRequestLength__h63893 =
	     (x__h63926[12:0] <= spanToNextPage__h63892) ?
	       x__h63926[12:0] :
	       spanToNextPage__h63892 ;
  assign tlp_dmaPullRemainDWLen_373_ULE_tlp_dmaPullRema_ETC___d1395 =
	     tlp_dmaPullRemainDWLen <= tlp_dmaPullRemainDWSub ;
  assign tlp_dmaPullRemainDWSub_387_ULE_4___d1388 =
	     tlp_dmaPullRemainDWSub <= 10'd4 ;
  assign tlp_inF_first__259_BITS_63_TO_56_262_EQ_pciDev_ETC___d1272 =
	     tlp_inF$D_OUT[63:56] == pciDevice[15:8] &&
	     tlp_inF$D_OUT[55:51] == pciDevice[7:3] &&
	     tlp_inF$D_OUT[50:48] == pciDevice[2:0] ;
  assign tlp_inF_first__259_BIT_152_462_AND_NOT_tlp_inF_ETC___d1487 =
	     tlp_inF$D_OUT[152] && !tlp_inF$D_OUT[110] &&
	     !tlp_inF$D_OUT[125] &&
	     tlp_inF$D_OUT[124:120] == 5'b0 ||
	     !tlp_inF$D_OUT[152] && !tlp_inIgnorePkt ;
  assign tlp_mesgLengthRemainPull_PLUS_3__q14 =
	     tlp_mesgLengthRemainPull + 17'd3 ;
  assign tlp_mesgLengthRemainPush_PLUS_3__q15 =
	     tlp_mesgLengthRemainPush + 17'd3 ;
  assign tlp_outDwRemain_129_ULE_4___d1130 = tlp_outDwRemain <= 10'd4 ;
  assign tlp_tlpBRAM_mRespF_first__000_BITS_71_TO_62_10_ETC___d1102 =
	     tlp_tlpBRAM_mRespF$D_OUT[71:62] <= 10'd1 ;
  assign tlp_tlpBRAM_mRespF_i_notFull__97_AND_tlp_tlpBR_ETC___d813 =
	     tlp_tlpBRAM_mRespF$FULL_N &&
	     (tlp_tlpBRAM_readReq$D_OUT[60] ||
	      CASE_tlp_tlpBRAM_readReq_first__98_BITS_30_TO__ETC___d805 &&
	      CASE_tlp_tlpBRAM_readReq_first__98_BITS_30_TO__ETC___d810) ;
  assign tlp_tlpBRAM_rdRespDwRemain_16_ULE_4___d918 =
	     tlp_tlpBRAM_rdRespDwRemain <= 10'd4 ;
  assign tlp_tlpBRAM_readNxtDWAddr_PLUS_1__q11 =
	     tlp_tlpBRAM_readNxtDWAddr + 13'd1 ;
  assign tlp_tlpBRAM_readNxtDWAddr_PLUS_2__q12 =
	     tlp_tlpBRAM_readNxtDWAddr + 13'd2 ;
  assign tlp_tlpBRAM_readNxtDWAddr_PLUS_3__q13 =
	     tlp_tlpBRAM_readNxtDWAddr + 13'd3 ;
  assign tlp_tlpBRAM_readRemainDWLen_74_ULE_4___d775 =
	     tlp_tlpBRAM_readRemainDWLen <= 10'd4 ;
  assign tlp_tlpBRAM_readReq_first__98_BITS_30_TO_29_00_ETC___d922 =
	     tlp_tlpBRAM_readReq$D_OUT[30:29] +
	     (tlp_tlpBRAM_readReq$D_OUT[60] ? 2'd0 : 2'd1) ;
  assign tlp_tlpBRAM_writeDWAddr_PLUS_1__q8 =
	     tlp_tlpBRAM_writeDWAddr + 13'd1 ;
  assign tlp_tlpBRAM_writeDWAddr_PLUS_2__q9 =
	     tlp_tlpBRAM_writeDWAddr + 13'd2 ;
  assign tlp_tlpBRAM_writeDWAddr_PLUS_3__q10 =
	     tlp_tlpBRAM_writeDWAddr + 13'd3 ;
  assign w_be__h48508 =
	     tlp_outDwRemain_129_ULE_4___d1130 ?
	       CASE_tlp_outDwRemain_BITS_1_TO_0_0b0_0xFFFF_0b_ETC__q3 :
	       16'd65535 ;
  assign w_data__h47916 =
	     { 22'd1048576,
	       tlp_tlpBRAM_mRespF$D_OUT[71:62],
	       pciDevice,
	       8'd0,
	       lastBE__h47950,
	       4'd15,
	       tlp_fabMesgAccu,
	       tlp_tlpBRAM_mRespF$D_OUT[31:0] } ;
  assign w_data__h48052 =
	     { 22'd1572864,
	       tlp_tlpBRAM_mRespF$D_OUT[71:62],
	       pciDevice,
	       8'd0,
	       lastBE__h47950,
	       4'd15,
	       tlp_fabMesgAddrMS,
	       tlp_fabMesgAccu } ;
  assign w_data__h52877 =
	     { tlp_fabMeta[103:96],
	       tlp_fabMeta[111:104],
	       tlp_fabMeta[119:112],
	       tlp_fabMeta[127:120],
	       tlp_fabMeta[71:64],
	       tlp_fabMeta[79:72],
	       tlp_fabMeta[87:80],
	       tlp_fabMeta[95:88],
	       tlp_fabMeta[39:32],
	       tlp_fabMeta[47:40],
	       tlp_fabMeta[55:48],
	       tlp_fabMeta[63:56],
	       tlp_fabMeta[7:0],
	       tlp_fabMeta[15:8],
	       tlp_fabMeta[23:16],
	       tlp_fabMeta[31:24] } ;
  assign w_data__h65836 =
	     { 32'd1073741825,
	       pciDevice,
	       16'd15,
	       tlp_fabFlowAddr,
	       wti_nowReq_BITS_63_TO_0__q2[12:6],
	       1'd1,
	       wti_nowReq_BITS_63_TO_0__q2[20:13],
	       wti_nowReq_BITS_63_TO_0__q2[28:21],
	       wti_nowReq_BITS_63_TO_0__q2[36:29] } ;
  assign w_data__h66940 =
	     { 32'd1610612737,
	       pciDevice,
	       16'd15,
	       tlp_fabFlowAddrMS,
	       tlp_fabFlowAddr } ;
  assign w_data__h67186 =
	     { wti_nowReq_BITS_63_TO_0__q2[12:6],
	       1'd1,
	       wti_nowReq_BITS_63_TO_0__q2[20:13],
	       wti_nowReq_BITS_63_TO_0__q2[28:21],
	       wti_nowReq_BITS_63_TO_0__q2[36:29],
	       96'd0 } ;
  assign wci_respF_cntr_r_90_MINUS_1___d499 = wci_respF_cntr_r - 2'd1 ;
  assign wmi_dpControl_whas__653_AND_bram_0_serverAdapt_ETC___d1699 =
	     (bram_0_serverAdapterB_outDataCore$EMPTY_N ||
	      bram_0_serverAdapterB_outData_enqData$whas) &&
	     bram_0_serverAdapterB_outData_outData$whas &&
	     (bram_1_serverAdapterB_outDataCore$EMPTY_N ||
	      bram_1_serverAdapterB_outData_enqData$whas) &&
	     bram_1_serverAdapterB_outData_outData_whas__68_ETC___d1695 ;
  assign wmi_wmi_operateD_606_AND_wmi_wmi_peerIsReady_6_ETC___d1777 =
	     wmi_wmi_operateD && wmi_wmi_peerIsReady &&
	     bram_0_serverAdapterB_cnt_5_SLT_3___d1666 &&
	     bram_1_serverAdapterB_cnt_03_SLT_3___d1667 &&
	     bram_2_serverAdapterB_cnt_21_SLT_3___d1668 &&
	     bram_3_serverAdapterB_cnt_39_SLT_3___d1669 &&
	     wmi_wmi_mFlagF$EMPTY_N ;
  assign wmi_wmi_respF_cntr_r_582_MINUS_1___d1590 =
	     wmi_wmi_respF_cntr_r - 2'd1 ;
  assign wti_nowReq_BITS_63_TO_0__q2 = wti_nowReq[63:0] ;
  assign x3__h81484 = { 8'd0, wmi_wmi_mFlagF$D_OUT[23:0] } ;
  assign x__h29771 = x__h29773 - y__h29774 ;
  assign x__h29773 = { tlp_tlpBRAM_readReq$D_OUT[28:19], 2'b0 } ;
  assign x__h42208 =
	     { tlp_tlpBRAM_mRespF$D_OUT[7:0],
	       tlp_tlpBRAM_mRespF$D_OUT[15:8],
	       tlp_tlpBRAM_mRespF$D_OUT[23:16],
	       tlp_tlpBRAM_mRespF$D_OUT[31:24] } ;
  assign x__h47258 = { 15'd0, tlp_mesgLengthRemainPush } ;
  assign x__h47542 =
	     (tlp_mesgLengthRemainPush <= y__h47544) ?
	       tlp_mesgLengthRemainPush :
	       y__h47544 ;
  assign x__h58352 =
	     { tlp_inF$D_OUT[7:0],
	       tlp_inF$D_OUT[15:8],
	       tlp_inF$D_OUT[23:16],
	       tlp_inF$D_OUT[31:24] } ;
  assign x__h63608 = { 15'd0, tlp_mesgLengthRemainPull } ;
  assign x__h63926 =
	     (tlp_mesgLengthRemainPull <= y__h63928) ?
	       tlp_mesgLengthRemainPull :
	       y__h63928 ;
  assign x__h87600 = (dpControl[1:0] == 2'd1) ? bml_fabNumBufs : 16'd0 ;
  assign x__h88728 = bml_lclBufsAR + 16'd1 ;
  assign x__h88733 = bml_lclBufsAR - 16'd1 ;
  assign x__h88840 = bml_lclBufsCF + 16'd1 ;
  assign x__h88877 = bml_lclBufsCF - 16'd1 ;
  assign x__h88959 = bml_fabBufsAvail + 16'd1 ;
  assign x__h88964 = bml_fabBufsAvail - 16'd1 ;
  assign x__h88998 = bml_lclCredit + 16'd1 ;
  assign x__h89003 = bml_lclCredit - 16'd1 ;
  assign y__h17362 = tlp_tlpBRAM_mReqF$D_OUT[63] ? 13'd0 : 13'd1 ;
  assign y__h17428 = tlp_tlpBRAM_mReqF$D_OUT[63] ? 10'd0 : 10'd1 ;
  assign y__h27653 = tlp_tlpBRAM_mReqF$D_OUT[60] ? 10'd0 : 10'd1 ;
  assign y__h27665 = tlp_tlpBRAM_mReqF$D_OUT[60] ? 13'd0 : 13'd1 ;
  assign y__h29772 =
	     (tlp_tlpBRAM_readReq$D_OUT[28:19] == 10'd1) ?
	       12'd0 :
	       { 10'd0, x__h29803 } ;
  assign y__h29774 = { 10'd0, x__h29780 } ;
  assign y__h30729 = tlp_tlpBRAM_readReq$D_OUT[60] ? 10'd0 : 10'd1 ;
  assign y__h47529 = { 4'd0, thisRequestLength__h47504 } ;
  assign y__h47544 = { 4'd0, tlp_maxPayloadSize } ;
  assign y__h47623 = { 19'd0, thisRequestLength__h47504 } ;
  assign y__h47671 = { 3'd0, thisRequestLength__h47504 } ;
  assign y__h48147 = (tlp_fabMesgAddrMS == 32'd0) ? 10'd1 : 10'd0 ;
  assign y__h48181 = { 20'd0, tlp_tlpBRAM_mRespF$D_OUT[71:62], 2'd0 } ;
  assign y__h63918 = { 4'd0, thisRequestLength__h63893 } ;
  assign y__h63928 = { 4'd0, tlp_maxReadReqSize } ;
  assign y__h63989 = { 19'd0, thisRequestLength__h63893 } ;
  assign y__h64598 = { 4'd0, tlp_inF$D_OUT[105:96], 2'd0 } ;
  assign y__h65310 =
	     tlp_dmaPullRemainDWSub_387_ULE_4___d1388 ?
	       { 5'd0, tlp_dmaPullRemainDWSub, 2'd0 } :
	       17'd16 ;
  assign y_avValue__h82907 =
	     bram_0_serverAdapterB_outDataCore$EMPTY_N ?
	       bram_0_serverAdapterB_outDataCore$D_OUT :
	       bram_0_memory$DOB ;
  assign y_avValue__h82927 =
	     bram_1_serverAdapterB_outDataCore$EMPTY_N ?
	       bram_1_serverAdapterB_outDataCore$D_OUT :
	       bram_1_memory$DOB ;
  assign y_avValue__h82947 =
	     bram_2_serverAdapterB_outDataCore$EMPTY_N ?
	       bram_2_serverAdapterB_outDataCore$D_OUT :
	       bram_2_memory$DOB ;
  assign y_avValue__h82967 =
	     bram_3_serverAdapterB_outDataCore$EMPTY_N ?
	       bram_3_serverAdapterB_outDataCore$D_OUT :
	       bram_3_memory$DOB ;
  always@(tlp_tlpBRAM_readReq$D_OUT)
  begin
    case (tlp_tlpBRAM_readReq$D_OUT[18:15])
      4'b1100: x__h29780 = 2'b10;
      4'b1110: x__h29780 = 2'b01;
      4'b1111: x__h29780 = 2'b0;
      default: x__h29780 = 2'b11;
    endcase
  end
  always@(tlp_tlpBRAM_readReq$D_OUT)
  begin
    case (tlp_tlpBRAM_readReq$D_OUT[14:11])
      4'b1100: x__h29803 = 2'b10;
      4'b1110: x__h29803 = 2'b01;
      4'b1111: x__h29803 = 2'b0;
      default: x__h29803 = 2'b11;
    endcase
  end
  always@(tlp_lastRuleFired)
  begin
    case (tlp_lastRuleFired)
      4'd1, 4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8, 4'd9, 4'd15:
	  CASE_tlp_lastRuleFired_1_tlp_lastRuleFired_2_t_ETC__q1 =
	      tlp_lastRuleFired;
      default: CASE_tlp_lastRuleFired_1_tlp_lastRuleFired_2_t_ETC__q1 = 4'd10;
    endcase
  end
  always@(wmi_p4B or
	  y_avValue__h82907 or
	  y_avValue__h82927 or y_avValue__h82947 or y_avValue__h82967)
  begin
    case (wmi_p4B)
      2'd0: rdata__h83058 = y_avValue__h82907;
      2'd1: rdata__h83058 = y_avValue__h82927;
      2'd2: rdata__h83058 = y_avValue__h82947;
      2'd3: rdata__h83058 = y_avValue__h82967;
    endcase
  end
  always@(wci_reqF$D_OUT or
	  rdat__h90951 or
	  rdat__h90959 or
	  rdat__h90967 or
	  rdat__h90975 or
	  rdat__h90983 or
	  rdat__h90991 or
	  rdat__h90999 or
	  rdat__h91020 or
	  rdat__h91027 or
	  rdat__h91040 or
	  rdat__h91047 or
	  rdat__h91054 or
	  rdat__h91326 or
	  rdat__h91376 or
	  rdat__h91476 or
	  bml_fabMesgBase or
	  bml_fabMetaBase or
	  bml_fabMesgSize or
	  bml_fabMetaSize or
	  bml_fabFlowBase or
	  bml_fabFlowSize or
	  rdat__h91534 or
	  rdat__h91556 or
	  rdat__h91566 or
	  rdat__h91688 or
	  rdat__h91812 or
	  rdat__h91840 or
	  rdat__h91868 or
	  rdat__h91896 or
	  bml_fabMesgBaseMS or
	  bml_fabMetaBaseMS or
	  bml_fabFlowBaseMS or
	  rdat__h91926 or rdat__h91960 or rdat__h91993 or rdat__h92027)
  begin
    case (wci_reqF$D_OUT[39:32])
      8'h0: _theResult____h90872 = rdat__h90951;
      8'h04: _theResult____h90872 = rdat__h90959;
      8'h08: _theResult____h90872 = rdat__h90967;
      8'h0C: _theResult____h90872 = rdat__h90975;
      8'h10: _theResult____h90872 = rdat__h90983;
      8'h14: _theResult____h90872 = rdat__h90991;
      8'h20: _theResult____h90872 = rdat__h90999;
      8'h24: _theResult____h90872 = 32'hF00DFACE;
      8'h28: _theResult____h90872 = rdat__h91020;
      8'h2C: _theResult____h90872 = rdat__h91027;
      8'h30: _theResult____h90872 = rdat__h91040;
      8'h34: _theResult____h90872 = rdat__h91047;
      8'h38: _theResult____h90872 = rdat__h91054;
      8'h3C: _theResult____h90872 = rdat__h91326;
      8'h40: _theResult____h90872 = rdat__h91376;
      8'h44: _theResult____h90872 = 32'd0;
      8'h48: _theResult____h90872 = rdat__h91476;
      8'h4C: _theResult____h90872 = 32'h00008000;
      8'h50: _theResult____h90872 = bml_fabMesgBase;
      8'h54: _theResult____h90872 = bml_fabMetaBase;
      8'h58: _theResult____h90872 = bml_fabMesgSize;
      8'h5C: _theResult____h90872 = bml_fabMetaSize;
      8'h60: _theResult____h90872 = bml_fabFlowBase;
      8'h64: _theResult____h90872 = bml_fabFlowSize;
      8'h68: _theResult____h90872 = rdat__h91534;
      8'h6C: _theResult____h90872 = rdat__h91556;
      8'h70: _theResult____h90872 = rdat__h91566;
      8'h80: _theResult____h90872 = rdat__h91688;
      8'h84: _theResult____h90872 = rdat__h91812;
      8'h88: _theResult____h90872 = rdat__h91840;
      8'h8C: _theResult____h90872 = rdat__h91868;
      8'h90: _theResult____h90872 = rdat__h91896;
      8'h94: _theResult____h90872 = bml_fabMesgBaseMS;
      8'h98: _theResult____h90872 = bml_fabMetaBaseMS;
      8'h9C: _theResult____h90872 = bml_fabFlowBaseMS;
      8'hA0: _theResult____h90872 = rdat__h91926;
      8'hA4: _theResult____h90872 = rdat__h91960;
      8'hA8: _theResult____h90872 = rdat__h91993;
      8'hAC: _theResult____h90872 = rdat__h92027;
      default: _theResult____h90872 = 32'd0;
    endcase
  end
  always@(tlp_tlpBRAM_readReq$D_OUT)
  begin
    case (tlp_tlpBRAM_readReq$D_OUT[18:15])
      4'b1000: lowAddr10__h29651 = 2'b11;
      4'b1100: lowAddr10__h29651 = 2'b10;
      4'b1110: lowAddr10__h29651 = 2'b01;
      default: lowAddr10__h29651 = 2'b0;
    endcase
  end
  always@(tlp_tlpBRAM_mReqF$D_OUT or
	  bram_0_serverAdapterA_cnt_6_SLT_3___d619 or
	  bram_1_serverAdapterA_cnt_44_SLT_3___d620 or
	  bram_2_serverAdapterA_cnt_62_SLT_3___d621 or
	  bram_3_serverAdapterA_cnt_80_SLT_3___d622)
  begin
    case (tlp_tlpBRAM_mReqF$D_OUT[51:50])
      2'd0:
	  CASE_tlp_tlpBRAM_mReqF_first__16_BITS_51_TO_50_ETC___d623 =
	      bram_0_serverAdapterA_cnt_6_SLT_3___d619;
      2'd1:
	  CASE_tlp_tlpBRAM_mReqF_first__16_BITS_51_TO_50_ETC___d623 =
	      bram_1_serverAdapterA_cnt_44_SLT_3___d620;
      2'd2:
	  CASE_tlp_tlpBRAM_mReqF_first__16_BITS_51_TO_50_ETC___d623 =
	      bram_2_serverAdapterA_cnt_62_SLT_3___d621;
      2'd3:
	  CASE_tlp_tlpBRAM_mReqF_first__16_BITS_51_TO_50_ETC___d623 =
	      bram_3_serverAdapterA_cnt_80_SLT_3___d622;
    endcase
  end
  always@(idx__h21626 or
	  tlp_tlpBRAM_writeRemainDWLen or
	  NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_1_55___d656 or
	  NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_2_57___d658 or
	  NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_3_59___d660)
  begin
    case (idx__h21626)
      2'd0:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d665 =
	      tlp_tlpBRAM_writeRemainDWLen != 10'd0;
      2'd1:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d665 =
	      NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_1_55___d656;
      2'd2:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d665 =
	      NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_2_57___d658;
      2'd3:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d665 =
	      NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_3_59___d660;
    endcase
  end
  always@(idx__h23676 or
	  tlp_tlpBRAM_writeRemainDWLen or
	  NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_1_55___d656 or
	  NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_2_57___d658 or
	  NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_3_59___d660)
  begin
    case (idx__h23676)
      2'd0:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d669 =
	      tlp_tlpBRAM_writeRemainDWLen != 10'd0;
      2'd1:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d669 =
	      NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_1_55___d656;
      2'd2:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d669 =
	      NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_2_57___d658;
      2'd3:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d669 =
	      NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_3_59___d660;
    endcase
  end
  always@(idx__h24781 or
	  tlp_tlpBRAM_writeRemainDWLen or
	  NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_1_55___d656 or
	  NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_2_57___d658 or
	  NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_3_59___d660)
  begin
    case (idx__h24781)
      2'd0:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d673 =
	      tlp_tlpBRAM_writeRemainDWLen != 10'd0;
      2'd1:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d673 =
	      NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_1_55___d656;
      2'd2:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d673 =
	      NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_2_57___d658;
      2'd3:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d673 =
	      NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_3_59___d660;
    endcase
  end
  always@(idx__h25886 or
	  tlp_tlpBRAM_writeRemainDWLen or
	  NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_1_55___d656 or
	  NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_2_57___d658 or
	  NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_3_59___d660)
  begin
    case (idx__h25886)
      2'd0:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d677 =
	      tlp_tlpBRAM_writeRemainDWLen != 10'd0;
      2'd1:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d677 =
	      NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_1_55___d656;
      2'd2:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d677 =
	      NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_2_57___d658;
      2'd3:
	  SEL_ARR_NOT_tlp_tlpBRAM_writeRemainDWLen_52_EQ_ETC___d677 =
	      NOT_tlp_tlpBRAM_writeRemainDWLen_52_ULE_3_59___d660;
    endcase
  end
  always@(idx__h21626 or tlp_tlpBRAM_mReqF$D_OUT)
  begin
    case (idx__h21626)
      2'd0:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d700 =
	      tlp_tlpBRAM_mReqF$D_OUT[127:96];
      2'd1:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d700 =
	      tlp_tlpBRAM_mReqF$D_OUT[95:64];
      2'd2:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d700 =
	      tlp_tlpBRAM_mReqF$D_OUT[63:32];
      2'd3:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d700 =
	      tlp_tlpBRAM_mReqF$D_OUT[31:0];
    endcase
  end
  always@(idx__h23676 or tlp_tlpBRAM_mReqF$D_OUT)
  begin
    case (idx__h23676)
      2'd0:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d708 =
	      tlp_tlpBRAM_mReqF$D_OUT[127:96];
      2'd1:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d708 =
	      tlp_tlpBRAM_mReqF$D_OUT[95:64];
      2'd2:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d708 =
	      tlp_tlpBRAM_mReqF$D_OUT[63:32];
      2'd3:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d708 =
	      tlp_tlpBRAM_mReqF$D_OUT[31:0];
    endcase
  end
  always@(idx__h24781 or tlp_tlpBRAM_mReqF$D_OUT)
  begin
    case (idx__h24781)
      2'd0:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d716 =
	      tlp_tlpBRAM_mReqF$D_OUT[127:96];
      2'd1:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d716 =
	      tlp_tlpBRAM_mReqF$D_OUT[95:64];
      2'd2:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d716 =
	      tlp_tlpBRAM_mReqF$D_OUT[63:32];
      2'd3:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d716 =
	      tlp_tlpBRAM_mReqF$D_OUT[31:0];
    endcase
  end
  always@(idx__h25886 or tlp_tlpBRAM_mReqF$D_OUT)
  begin
    case (idx__h25886)
      2'd0:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d724 =
	      tlp_tlpBRAM_mReqF$D_OUT[127:96];
      2'd1:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d724 =
	      tlp_tlpBRAM_mReqF$D_OUT[95:64];
      2'd2:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d724 =
	      tlp_tlpBRAM_mReqF$D_OUT[63:32];
      2'd3:
	  SEL_ARR_tlp_tlpBRAM_mReqF_first__16_BITS_127_T_ETC___d724 =
	      tlp_tlpBRAM_mReqF$D_OUT[31:0];
    endcase
  end
  always@(tlp_tlpBRAM_mReqF$D_OUT or
	  bram_0_serverAdapterA_cnt_6_SLT_3___d619 or
	  bram_1_serverAdapterA_cnt_44_SLT_3___d620 or
	  bram_2_serverAdapterA_cnt_62_SLT_3___d621 or
	  bram_3_serverAdapterA_cnt_80_SLT_3___d622)
  begin
    case (tlp_tlpBRAM_mReqF$D_OUT[30:29])
      2'd0:
	  CASE_tlp_tlpBRAM_mReqF_first__16_BITS_30_TO_29_ETC___d736 =
	      bram_0_serverAdapterA_cnt_6_SLT_3___d619;
      2'd1:
	  CASE_tlp_tlpBRAM_mReqF_first__16_BITS_30_TO_29_ETC___d736 =
	      bram_1_serverAdapterA_cnt_44_SLT_3___d620;
      2'd2:
	  CASE_tlp_tlpBRAM_mReqF_first__16_BITS_30_TO_29_ETC___d736 =
	      bram_2_serverAdapterA_cnt_62_SLT_3___d621;
      2'd3:
	  CASE_tlp_tlpBRAM_mReqF_first__16_BITS_30_TO_29_ETC___d736 =
	      bram_3_serverAdapterA_cnt_80_SLT_3___d622;
    endcase
  end
  always@(tlp_outDwRemain)
  begin
    case (tlp_outDwRemain[1:0])
      2'b0: CASE_tlp_outDwRemain_BITS_1_TO_0_0b0_0xFFFF_0b_ETC__q3 = 16'hFFFF;
      2'b01:
	  CASE_tlp_outDwRemain_BITS_1_TO_0_0b0_0xFFFF_0b_ETC__q3 = 16'hF000;
      2'b10:
	  CASE_tlp_outDwRemain_BITS_1_TO_0_0b0_0xFFFF_0b_ETC__q3 = 16'hFF00;
      2'd3: CASE_tlp_outDwRemain_BITS_1_TO_0_0b0_0xFFFF_0b_ETC__q3 = 16'hFFF0;
    endcase
  end
  always@(wmi_addr or
	  bram_0_serverAdapterB_cnt_5_SLT_3___d1666 or
	  bram_1_serverAdapterB_cnt_03_SLT_3___d1667 or
	  bram_2_serverAdapterB_cnt_21_SLT_3___d1668 or
	  bram_3_serverAdapterB_cnt_39_SLT_3___d1669)
  begin
    case (wmi_addr[3:2])
      2'd0:
	  CASE_wmi_addr_745_BITS_3_TO_2_746_0_bram_0_ser_ETC___d1747 =
	      bram_0_serverAdapterB_cnt_5_SLT_3___d1666;
      2'd1:
	  CASE_wmi_addr_745_BITS_3_TO_2_746_0_bram_0_ser_ETC___d1747 =
	      bram_1_serverAdapterB_cnt_03_SLT_3___d1667;
      2'd2:
	  CASE_wmi_addr_745_BITS_3_TO_2_746_0_bram_0_ser_ETC___d1747 =
	      bram_2_serverAdapterB_cnt_21_SLT_3___d1668;
      2'd3:
	  CASE_wmi_addr_745_BITS_3_TO_2_746_0_bram_0_ser_ETC___d1747 =
	      bram_3_serverAdapterB_cnt_39_SLT_3___d1669;
    endcase
  end
  always@(dpControl or bml_fabDone or bml_remDone)
  begin
    case (dpControl[1:0])
      2'd0:
	  CASE_dpControl_BITS_1_TO_0_0_bml_fabDone_1_bml_ETC__q4 =
	      bml_fabDone;
      2'd1:
	  CASE_dpControl_BITS_1_TO_0_0_bml_fabDone_1_bml_ETC__q4 =
	      bml_remDone;
      default: CASE_dpControl_BITS_1_TO_0_0_bml_fabDone_1_bml_ETC__q4 =
		   bml_fabDone;
    endcase
  end
  always@(dpControl or bml_fabDone or bml_remDone)
  begin
    case (dpControl[1:0])
      2'd0:
	  CASE_dpControl_BITS_1_TO_0_0_NOT_bml_fabDone_1_ETC__q5 =
	      !bml_fabDone;
      2'd1:
	  CASE_dpControl_BITS_1_TO_0_0_NOT_bml_fabDone_1_ETC__q5 =
	      !bml_remDone;
      default: CASE_dpControl_BITS_1_TO_0_0_NOT_bml_fabDone_1_ETC__q5 =
		   !bml_fabDone;
    endcase
  end
  always@(dpControl or
	  bml_fabDone or
	  IF_bml_dpControl_wget__907_BITS_3_TO_2_908_EQ__ETC___d2004)
  begin
    case (dpControl[1:0])
      2'd0:
	  CASE_dpControl_BITS_1_TO_0_0_NOT_bml_fabDone_1_ETC__q6 =
	      !bml_fabDone;
      2'd1:
	  CASE_dpControl_BITS_1_TO_0_0_NOT_bml_fabDone_1_ETC__q6 =
	      IF_bml_dpControl_wget__907_BITS_3_TO_2_908_EQ__ETC___d2004;
      default: CASE_dpControl_BITS_1_TO_0_0_NOT_bml_fabDone_1_ETC__q6 =
		   !bml_fabDone;
    endcase
  end
  always@(dpControl or bml_fabDone or bml_remDone or bml_remStart)
  begin
    case (dpControl[1:0])
      2'd0:
	  CASE_dpControl_BITS_1_TO_0_0_bml_fabDone_1_IF__ETC__q7 =
	      bml_fabDone;
      2'd1:
	  CASE_dpControl_BITS_1_TO_0_0_bml_fabDone_1_IF__ETC__q7 =
	      (dpControl[3:2] == 2'd1) ? bml_remDone : bml_remStart;
      default: CASE_dpControl_BITS_1_TO_0_0_bml_fabDone_1_IF__ETC__q7 =
		   bml_fabDone;
    endcase
  end
  always@(tlp_tlpBRAM_readReq$D_OUT or
	  bram_0_serverAdapterA_outDataCore$EMPTY_N or
	  bram_0_serverAdapterA_outData_enqData$whas or
	  bram_1_serverAdapterA_outDataCore$EMPTY_N or
	  bram_1_serverAdapterA_outData_enqData$whas or
	  bram_2_serverAdapterA_outDataCore$EMPTY_N or
	  bram_2_serverAdapterA_outData_enqData$whas or
	  bram_3_serverAdapterA_outDataCore$EMPTY_N or
	  bram_3_serverAdapterA_outData_enqData$whas)
  begin
    case (tlp_tlpBRAM_readReq$D_OUT[30:29])
      2'd0:
	  CASE_tlp_tlpBRAM_readReq_first__98_BITS_30_TO__ETC___d805 =
	      bram_0_serverAdapterA_outDataCore$EMPTY_N ||
	      bram_0_serverAdapterA_outData_enqData$whas;
      2'd1:
	  CASE_tlp_tlpBRAM_readReq_first__98_BITS_30_TO__ETC___d805 =
	      bram_1_serverAdapterA_outDataCore$EMPTY_N ||
	      bram_1_serverAdapterA_outData_enqData$whas;
      2'd2:
	  CASE_tlp_tlpBRAM_readReq_first__98_BITS_30_TO__ETC___d805 =
	      bram_2_serverAdapterA_outDataCore$EMPTY_N ||
	      bram_2_serverAdapterA_outData_enqData$whas;
      2'd3:
	  CASE_tlp_tlpBRAM_readReq_first__98_BITS_30_TO__ETC___d805 =
	      bram_3_serverAdapterA_outDataCore$EMPTY_N ||
	      bram_3_serverAdapterA_outData_enqData$whas;
    endcase
  end
  always@(tlp_tlpBRAM_readReq$D_OUT or
	  bram_0_serverAdapterA_outData_outData$wget or
	  bram_1_serverAdapterA_outData_outData$wget or
	  bram_2_serverAdapterA_outData_outData$wget or
	  bram_3_serverAdapterA_outData_outData$wget)
  begin
    case (tlp_tlpBRAM_readReq$D_OUT[30:29])
      2'd0:
	  SEL_ARR_bram_0_serverAdapterA_outData_outData__ETC___d863 =
	      bram_0_serverAdapterA_outData_outData$wget;
      2'd1:
	  SEL_ARR_bram_0_serverAdapterA_outData_outData__ETC___d863 =
	      bram_1_serverAdapterA_outData_outData$wget;
      2'd2:
	  SEL_ARR_bram_0_serverAdapterA_outData_outData__ETC___d863 =
	      bram_2_serverAdapterA_outData_outData$wget;
      2'd3:
	  SEL_ARR_bram_0_serverAdapterA_outData_outData__ETC___d863 =
	      bram_3_serverAdapterA_outData_outData$wget;
    endcase
  end
  always@(tlp_tlpBRAM_readReq$D_OUT or
	  bram_0_serverAdapterA_outData_outData$whas or
	  bram_1_serverAdapterA_outData_outData$whas or
	  bram_2_serverAdapterA_outData_outData$whas or
	  bram_3_serverAdapterA_outData_outData$whas)
  begin
    case (tlp_tlpBRAM_readReq$D_OUT[30:29])
      2'd0:
	  CASE_tlp_tlpBRAM_readReq_first__98_BITS_30_TO__ETC___d810 =
	      bram_0_serverAdapterA_outData_outData$whas;
      2'd1:
	  CASE_tlp_tlpBRAM_readReq_first__98_BITS_30_TO__ETC___d810 =
	      bram_1_serverAdapterA_outData_outData$whas;
      2'd2:
	  CASE_tlp_tlpBRAM_readReq_first__98_BITS_30_TO__ETC___d810 =
	      bram_2_serverAdapterA_outData_outData$whas;
      2'd3:
	  CASE_tlp_tlpBRAM_readReq_first__98_BITS_30_TO__ETC___d810 =
	      bram_3_serverAdapterA_outData_outData$whas;
    endcase
  end
  always@(wmi_p4B or
	  bram_0_serverAdapterB_outDataCore$EMPTY_N or
	  bram_0_serverAdapterB_outData_enqData$whas or
	  bram_0_serverAdapterB_outData_outData$whas or
	  bram_1_serverAdapterB_outDataCore$EMPTY_N or
	  bram_1_serverAdapterB_outData_enqData$whas or
	  bram_1_serverAdapterB_outData_outData$whas or
	  bram_2_serverAdapterB_outDataCore$EMPTY_N or
	  bram_2_serverAdapterB_outData_enqData$whas or
	  bram_2_serverAdapterB_outData_outData$whas or
	  bram_3_serverAdapterB_outDataCore$EMPTY_N or
	  bram_3_serverAdapterB_outData_enqData$whas or
	  bram_3_serverAdapterB_outData_outData$whas)
  begin
    case (wmi_p4B)
      2'd0:
	  CASE_wmi_p4B_798_0_bram_0_serverAdapterB_outDa_ETC___d1802 =
	      (bram_0_serverAdapterB_outDataCore$EMPTY_N ||
	       bram_0_serverAdapterB_outData_enqData$whas) &&
	      bram_0_serverAdapterB_outData_outData$whas;
      2'd1:
	  CASE_wmi_p4B_798_0_bram_0_serverAdapterB_outDa_ETC___d1802 =
	      (bram_1_serverAdapterB_outDataCore$EMPTY_N ||
	       bram_1_serverAdapterB_outData_enqData$whas) &&
	      bram_1_serverAdapterB_outData_outData$whas;
      2'd2:
	  CASE_wmi_p4B_798_0_bram_0_serverAdapterB_outDa_ETC___d1802 =
	      (bram_2_serverAdapterB_outDataCore$EMPTY_N ||
	       bram_2_serverAdapterB_outData_enqData$whas) &&
	      bram_2_serverAdapterB_outData_outData$whas;
      2'd3:
	  CASE_wmi_p4B_798_0_bram_0_serverAdapterB_outDa_ETC___d1802 =
	      (bram_3_serverAdapterB_outDataCore$EMPTY_N ||
	       bram_3_serverAdapterB_outData_enqData$whas) &&
	      bram_3_serverAdapterB_outData_outData$whas;
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
	bram_0_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_0_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	bram_0_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_0_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	bram_1_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_1_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	bram_1_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_1_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	bram_2_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_2_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	bram_2_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_2_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	bram_3_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_3_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	bram_3_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	bram_3_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	dmaDoneTime <= `BSV_ASSIGNMENT_DELAY 64'd0;
	dmaStartTime <= `BSV_ASSIGNMENT_DELAY 64'd0;
	dpControl <= `BSV_ASSIGNMENT_DELAY 8'd0;
	tlp_complTimerCount <= `BSV_ASSIGNMENT_DELAY 12'd0;
	tlp_complTimerRunning <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_creditReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_dmaDoTailEvent <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_dmaDoneMark <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_dmaStartMark <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_dmaTag <= `BSV_ASSIGNMENT_DELAY 5'd0;
	tlp_doXmtMetaBody <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_doorSeqDwell <= `BSV_ASSIGNMENT_DELAY 4'd0;
	tlp_fabMeta <= `BSV_ASSIGNMENT_DELAY
	    129'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	tlp_farBufReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_flowDiagCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	tlp_gotResponseHeader <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_lastMetaV_0 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	tlp_lastMetaV_1 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	tlp_lastMetaV_2 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	tlp_lastMetaV_3 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	tlp_lastRuleFired <= `BSV_ASSIGNMENT_DELAY 4'd15;
	tlp_maxPayloadSize <= `BSV_ASSIGNMENT_DELAY 13'd128;
	tlp_maxReadReqSize <= `BSV_ASSIGNMENT_DELAY 13'd4096;
	tlp_nearBufReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_postSeqDwell <= `BSV_ASSIGNMENT_DELAY 4'd0;
	tlp_pullTagMatch <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_remDone <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_remStart <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_reqMesgInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_reqMetaBodyInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_reqMetaInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_sentTail4DWHeader <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_tlpBRAM_debugBdata <= `BSV_ASSIGNMENT_DELAY 128'd0;
	tlp_tlpBRAM_readHeaderSent <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_tlpBRAM_readStarted <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_tlpMetaSent <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_tlpRcvBusy <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_tlpXmtBusy <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_xmtMetaInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	tlp_xmtMetaOK <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_cEdge <= `BSV_ASSIGNMENT_DELAY 3'h2;
	wci_cState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	wci_ctlAckReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_ctlOpActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_illegalEdge <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_nState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	wci_reqF_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wci_respF_cntr_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
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
	wmi_wmi_respF_cntr_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
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
	if (bram_0_serverAdapterA_cnt$EN)
	  bram_0_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_0_serverAdapterA_cnt$D_IN;
	if (bram_0_serverAdapterA_s1$EN)
	  bram_0_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_0_serverAdapterA_s1$D_IN;
	if (bram_0_serverAdapterB_cnt$EN)
	  bram_0_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_0_serverAdapterB_cnt$D_IN;
	if (bram_0_serverAdapterB_s1$EN)
	  bram_0_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_0_serverAdapterB_s1$D_IN;
	if (bram_1_serverAdapterA_cnt$EN)
	  bram_1_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_1_serverAdapterA_cnt$D_IN;
	if (bram_1_serverAdapterA_s1$EN)
	  bram_1_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_1_serverAdapterA_s1$D_IN;
	if (bram_1_serverAdapterB_cnt$EN)
	  bram_1_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_1_serverAdapterB_cnt$D_IN;
	if (bram_1_serverAdapterB_s1$EN)
	  bram_1_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_1_serverAdapterB_s1$D_IN;
	if (bram_2_serverAdapterA_cnt$EN)
	  bram_2_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_2_serverAdapterA_cnt$D_IN;
	if (bram_2_serverAdapterA_s1$EN)
	  bram_2_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_2_serverAdapterA_s1$D_IN;
	if (bram_2_serverAdapterB_cnt$EN)
	  bram_2_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_2_serverAdapterB_cnt$D_IN;
	if (bram_2_serverAdapterB_s1$EN)
	  bram_2_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_2_serverAdapterB_s1$D_IN;
	if (bram_3_serverAdapterA_cnt$EN)
	  bram_3_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_3_serverAdapterA_cnt$D_IN;
	if (bram_3_serverAdapterA_s1$EN)
	  bram_3_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_3_serverAdapterA_s1$D_IN;
	if (bram_3_serverAdapterB_cnt$EN)
	  bram_3_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY
	      bram_3_serverAdapterB_cnt$D_IN;
	if (bram_3_serverAdapterB_s1$EN)
	  bram_3_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY
	      bram_3_serverAdapterB_s1$D_IN;
	if (dmaDoneTime$EN)
	  dmaDoneTime <= `BSV_ASSIGNMENT_DELAY dmaDoneTime$D_IN;
	if (dmaStartTime$EN)
	  dmaStartTime <= `BSV_ASSIGNMENT_DELAY dmaStartTime$D_IN;
	if (dpControl$EN) dpControl <= `BSV_ASSIGNMENT_DELAY dpControl$D_IN;
	if (tlp_complTimerCount$EN)
	  tlp_complTimerCount <= `BSV_ASSIGNMENT_DELAY
	      tlp_complTimerCount$D_IN;
	if (tlp_complTimerRunning$EN)
	  tlp_complTimerRunning <= `BSV_ASSIGNMENT_DELAY
	      tlp_complTimerRunning$D_IN;
	if (tlp_creditReady$EN)
	  tlp_creditReady <= `BSV_ASSIGNMENT_DELAY tlp_creditReady$D_IN;
	if (tlp_dmaDoTailEvent$EN)
	  tlp_dmaDoTailEvent <= `BSV_ASSIGNMENT_DELAY tlp_dmaDoTailEvent$D_IN;
	if (tlp_dmaDoneMark$EN)
	  tlp_dmaDoneMark <= `BSV_ASSIGNMENT_DELAY tlp_dmaDoneMark$D_IN;
	if (tlp_dmaStartMark$EN)
	  tlp_dmaStartMark <= `BSV_ASSIGNMENT_DELAY tlp_dmaStartMark$D_IN;
	if (tlp_dmaTag$EN)
	  tlp_dmaTag <= `BSV_ASSIGNMENT_DELAY tlp_dmaTag$D_IN;
	if (tlp_doXmtMetaBody$EN)
	  tlp_doXmtMetaBody <= `BSV_ASSIGNMENT_DELAY tlp_doXmtMetaBody$D_IN;
	if (tlp_doorSeqDwell$EN)
	  tlp_doorSeqDwell <= `BSV_ASSIGNMENT_DELAY tlp_doorSeqDwell$D_IN;
	if (tlp_fabMeta$EN)
	  tlp_fabMeta <= `BSV_ASSIGNMENT_DELAY tlp_fabMeta$D_IN;
	if (tlp_farBufReady$EN)
	  tlp_farBufReady <= `BSV_ASSIGNMENT_DELAY tlp_farBufReady$D_IN;
	if (tlp_flowDiagCount$EN)
	  tlp_flowDiagCount <= `BSV_ASSIGNMENT_DELAY tlp_flowDiagCount$D_IN;
	if (tlp_gotResponseHeader$EN)
	  tlp_gotResponseHeader <= `BSV_ASSIGNMENT_DELAY
	      tlp_gotResponseHeader$D_IN;
	if (tlp_lastMetaV_0$EN)
	  tlp_lastMetaV_0 <= `BSV_ASSIGNMENT_DELAY tlp_lastMetaV_0$D_IN;
	if (tlp_lastMetaV_1$EN)
	  tlp_lastMetaV_1 <= `BSV_ASSIGNMENT_DELAY tlp_lastMetaV_1$D_IN;
	if (tlp_lastMetaV_2$EN)
	  tlp_lastMetaV_2 <= `BSV_ASSIGNMENT_DELAY tlp_lastMetaV_2$D_IN;
	if (tlp_lastMetaV_3$EN)
	  tlp_lastMetaV_3 <= `BSV_ASSIGNMENT_DELAY tlp_lastMetaV_3$D_IN;
	if (tlp_lastRuleFired$EN)
	  tlp_lastRuleFired <= `BSV_ASSIGNMENT_DELAY tlp_lastRuleFired$D_IN;
	if (tlp_maxPayloadSize$EN)
	  tlp_maxPayloadSize <= `BSV_ASSIGNMENT_DELAY tlp_maxPayloadSize$D_IN;
	if (tlp_maxReadReqSize$EN)
	  tlp_maxReadReqSize <= `BSV_ASSIGNMENT_DELAY tlp_maxReadReqSize$D_IN;
	if (tlp_nearBufReady$EN)
	  tlp_nearBufReady <= `BSV_ASSIGNMENT_DELAY tlp_nearBufReady$D_IN;
	if (tlp_postSeqDwell$EN)
	  tlp_postSeqDwell <= `BSV_ASSIGNMENT_DELAY tlp_postSeqDwell$D_IN;
	if (tlp_pullTagMatch$EN)
	  tlp_pullTagMatch <= `BSV_ASSIGNMENT_DELAY tlp_pullTagMatch$D_IN;
	if (tlp_remDone$EN)
	  tlp_remDone <= `BSV_ASSIGNMENT_DELAY tlp_remDone$D_IN;
	if (tlp_remStart$EN)
	  tlp_remStart <= `BSV_ASSIGNMENT_DELAY tlp_remStart$D_IN;
	if (tlp_reqMesgInFlight$EN)
	  tlp_reqMesgInFlight <= `BSV_ASSIGNMENT_DELAY
	      tlp_reqMesgInFlight$D_IN;
	if (tlp_reqMetaBodyInFlight$EN)
	  tlp_reqMetaBodyInFlight <= `BSV_ASSIGNMENT_DELAY
	      tlp_reqMetaBodyInFlight$D_IN;
	if (tlp_reqMetaInFlight$EN)
	  tlp_reqMetaInFlight <= `BSV_ASSIGNMENT_DELAY
	      tlp_reqMetaInFlight$D_IN;
	if (tlp_sentTail4DWHeader$EN)
	  tlp_sentTail4DWHeader <= `BSV_ASSIGNMENT_DELAY
	      tlp_sentTail4DWHeader$D_IN;
	if (tlp_tlpBRAM_debugBdata$EN)
	  tlp_tlpBRAM_debugBdata <= `BSV_ASSIGNMENT_DELAY
	      tlp_tlpBRAM_debugBdata$D_IN;
	if (tlp_tlpBRAM_readHeaderSent$EN)
	  tlp_tlpBRAM_readHeaderSent <= `BSV_ASSIGNMENT_DELAY
	      tlp_tlpBRAM_readHeaderSent$D_IN;
	if (tlp_tlpBRAM_readStarted$EN)
	  tlp_tlpBRAM_readStarted <= `BSV_ASSIGNMENT_DELAY
	      tlp_tlpBRAM_readStarted$D_IN;
	if (tlp_tlpMetaSent$EN)
	  tlp_tlpMetaSent <= `BSV_ASSIGNMENT_DELAY tlp_tlpMetaSent$D_IN;
	if (tlp_tlpRcvBusy$EN)
	  tlp_tlpRcvBusy <= `BSV_ASSIGNMENT_DELAY tlp_tlpRcvBusy$D_IN;
	if (tlp_tlpXmtBusy$EN)
	  tlp_tlpXmtBusy <= `BSV_ASSIGNMENT_DELAY tlp_tlpXmtBusy$D_IN;
	if (tlp_xmtMetaInFlight$EN)
	  tlp_xmtMetaInFlight <= `BSV_ASSIGNMENT_DELAY
	      tlp_xmtMetaInFlight$D_IN;
	if (tlp_xmtMetaOK$EN)
	  tlp_xmtMetaOK <= `BSV_ASSIGNMENT_DELAY tlp_xmtMetaOK$D_IN;
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
	if (wci_respF_cntr_r$EN)
	  wci_respF_cntr_r <= `BSV_ASSIGNMENT_DELAY wci_respF_cntr_r$D_IN;
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
	if (wmi_wmi_respF_cntr_r$EN)
	  wmi_wmi_respF_cntr_r <= `BSV_ASSIGNMENT_DELAY
	      wmi_wmi_respF_cntr_r$D_IN;
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
    if (tlp_dmaPullRemainDWLen$EN)
      tlp_dmaPullRemainDWLen <= `BSV_ASSIGNMENT_DELAY
	  tlp_dmaPullRemainDWLen$D_IN;
    if (tlp_dmaPullRemainDWSub$EN)
      tlp_dmaPullRemainDWSub <= `BSV_ASSIGNMENT_DELAY
	  tlp_dmaPullRemainDWSub$D_IN;
    if (tlp_dmaReqTag$EN)
      tlp_dmaReqTag <= `BSV_ASSIGNMENT_DELAY tlp_dmaReqTag$D_IN;
    if (tlp_fabFlowAddr$EN)
      tlp_fabFlowAddr <= `BSV_ASSIGNMENT_DELAY tlp_fabFlowAddr$D_IN;
    if (tlp_fabFlowAddrMS$EN)
      tlp_fabFlowAddrMS <= `BSV_ASSIGNMENT_DELAY tlp_fabFlowAddrMS$D_IN;
    if (tlp_fabMesgAccu$EN)
      tlp_fabMesgAccu <= `BSV_ASSIGNMENT_DELAY tlp_fabMesgAccu$D_IN;
    if (tlp_fabMesgAddr$EN)
      tlp_fabMesgAddr <= `BSV_ASSIGNMENT_DELAY tlp_fabMesgAddr$D_IN;
    if (tlp_fabMesgAddrMS$EN)
      tlp_fabMesgAddrMS <= `BSV_ASSIGNMENT_DELAY tlp_fabMesgAddrMS$D_IN;
    if (tlp_fabMetaAddr$EN)
      tlp_fabMetaAddr <= `BSV_ASSIGNMENT_DELAY tlp_fabMetaAddr$D_IN;
    if (tlp_fabMetaAddrMS$EN)
      tlp_fabMetaAddrMS <= `BSV_ASSIGNMENT_DELAY tlp_fabMetaAddrMS$D_IN;
    if (tlp_inIgnorePkt$EN)
      tlp_inIgnorePkt <= `BSV_ASSIGNMENT_DELAY tlp_inIgnorePkt$D_IN;
    if (tlp_mesgComplReceived$EN)
      tlp_mesgComplReceived <= `BSV_ASSIGNMENT_DELAY
	  tlp_mesgComplReceived$D_IN;
    if (tlp_mesgLengthRemainPull$EN)
      tlp_mesgLengthRemainPull <= `BSV_ASSIGNMENT_DELAY
	  tlp_mesgLengthRemainPull$D_IN;
    if (tlp_mesgLengthRemainPush$EN)
      tlp_mesgLengthRemainPush <= `BSV_ASSIGNMENT_DELAY
	  tlp_mesgLengthRemainPush$D_IN;
    if (tlp_outDwRemain$EN)
      tlp_outDwRemain <= `BSV_ASSIGNMENT_DELAY tlp_outDwRemain$D_IN;
    if (tlp_remMesgAccu$EN)
      tlp_remMesgAccu <= `BSV_ASSIGNMENT_DELAY tlp_remMesgAccu$D_IN;
    if (tlp_remMesgAddr$EN)
      tlp_remMesgAddr <= `BSV_ASSIGNMENT_DELAY tlp_remMesgAddr$D_IN;
    if (tlp_remMetaAddr$EN)
      tlp_remMetaAddr <= `BSV_ASSIGNMENT_DELAY tlp_remMetaAddr$D_IN;
    if (tlp_srcMesgAccu$EN)
      tlp_srcMesgAccu <= `BSV_ASSIGNMENT_DELAY tlp_srcMesgAccu$D_IN;
    if (tlp_tlpBRAM_rdRespDwRemain$EN)
      tlp_tlpBRAM_rdRespDwRemain <= `BSV_ASSIGNMENT_DELAY
	  tlp_tlpBRAM_rdRespDwRemain$D_IN;
    if (tlp_tlpBRAM_readNxtDWAddr$EN)
      tlp_tlpBRAM_readNxtDWAddr <= `BSV_ASSIGNMENT_DELAY
	  tlp_tlpBRAM_readNxtDWAddr$D_IN;
    if (tlp_tlpBRAM_readRemainDWLen$EN)
      tlp_tlpBRAM_readRemainDWLen <= `BSV_ASSIGNMENT_DELAY
	  tlp_tlpBRAM_readRemainDWLen$D_IN;
    if (tlp_tlpBRAM_writeDWAddr$EN)
      tlp_tlpBRAM_writeDWAddr <= `BSV_ASSIGNMENT_DELAY
	  tlp_tlpBRAM_writeDWAddr$D_IN;
    if (tlp_tlpBRAM_writeLastBE$EN)
      tlp_tlpBRAM_writeLastBE <= `BSV_ASSIGNMENT_DELAY
	  tlp_tlpBRAM_writeLastBE$D_IN;
    if (tlp_tlpBRAM_writeRemainDWLen$EN)
      tlp_tlpBRAM_writeRemainDWLen <= `BSV_ASSIGNMENT_DELAY
	  tlp_tlpBRAM_writeRemainDWLen$D_IN;
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
    bram_0_serverAdapterA_cnt = 3'h2;
    bram_0_serverAdapterA_s1 = 2'h2;
    bram_0_serverAdapterB_cnt = 3'h2;
    bram_0_serverAdapterB_s1 = 2'h2;
    bram_1_serverAdapterA_cnt = 3'h2;
    bram_1_serverAdapterA_s1 = 2'h2;
    bram_1_serverAdapterB_cnt = 3'h2;
    bram_1_serverAdapterB_s1 = 2'h2;
    bram_2_serverAdapterA_cnt = 3'h2;
    bram_2_serverAdapterA_s1 = 2'h2;
    bram_2_serverAdapterB_cnt = 3'h2;
    bram_2_serverAdapterB_s1 = 2'h2;
    bram_3_serverAdapterA_cnt = 3'h2;
    bram_3_serverAdapterA_s1 = 2'h2;
    bram_3_serverAdapterB_cnt = 3'h2;
    bram_3_serverAdapterB_s1 = 2'h2;
    dmaDoneTime = 64'hAAAAAAAAAAAAAAAA;
    dmaStartTime = 64'hAAAAAAAAAAAAAAAA;
    dpControl = 8'hAA;
    tlp_complTimerCount = 12'hAAA;
    tlp_complTimerRunning = 1'h0;
    tlp_creditReady = 1'h0;
    tlp_dmaDoTailEvent = 1'h0;
    tlp_dmaDoneMark = 1'h0;
    tlp_dmaPullRemainDWLen = 10'h2AA;
    tlp_dmaPullRemainDWSub = 10'h2AA;
    tlp_dmaReqTag = 5'h0A;
    tlp_dmaStartMark = 1'h0;
    tlp_dmaTag = 5'h0A;
    tlp_doXmtMetaBody = 1'h0;
    tlp_doorSeqDwell = 4'hA;
    tlp_fabFlowAddr = 32'hAAAAAAAA;
    tlp_fabFlowAddrMS = 32'hAAAAAAAA;
    tlp_fabMesgAccu = 32'hAAAAAAAA;
    tlp_fabMesgAddr = 32'hAAAAAAAA;
    tlp_fabMesgAddrMS = 32'hAAAAAAAA;
    tlp_fabMeta = 129'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    tlp_fabMetaAddr = 32'hAAAAAAAA;
    tlp_fabMetaAddrMS = 32'hAAAAAAAA;
    tlp_farBufReady = 1'h0;
    tlp_flowDiagCount = 32'hAAAAAAAA;
    tlp_gotResponseHeader = 1'h0;
    tlp_inIgnorePkt = 1'h0;
    tlp_lastMetaV_0 = 32'hAAAAAAAA;
    tlp_lastMetaV_1 = 32'hAAAAAAAA;
    tlp_lastMetaV_2 = 32'hAAAAAAAA;
    tlp_lastMetaV_3 = 32'hAAAAAAAA;
    tlp_lastRuleFired = 4'hA;
    tlp_maxPayloadSize = 13'h0AAA;
    tlp_maxReadReqSize = 13'h0AAA;
    tlp_mesgComplReceived = 17'h0AAAA;
    tlp_mesgLengthRemainPull = 17'h0AAAA;
    tlp_mesgLengthRemainPush = 17'h0AAAA;
    tlp_nearBufReady = 1'h0;
    tlp_outDwRemain = 10'h2AA;
    tlp_postSeqDwell = 4'hA;
    tlp_pullTagMatch = 1'h0;
    tlp_remDone = 1'h0;
    tlp_remMesgAccu = 16'hAAAA;
    tlp_remMesgAddr = 16'hAAAA;
    tlp_remMetaAddr = 16'hAAAA;
    tlp_remStart = 1'h0;
    tlp_reqMesgInFlight = 1'h0;
    tlp_reqMetaBodyInFlight = 1'h0;
    tlp_reqMetaInFlight = 1'h0;
    tlp_sentTail4DWHeader = 1'h0;
    tlp_srcMesgAccu = 32'hAAAAAAAA;
    tlp_tlpBRAM_debugBdata = 128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    tlp_tlpBRAM_rdRespDwRemain = 10'h2AA;
    tlp_tlpBRAM_readHeaderSent = 1'h0;
    tlp_tlpBRAM_readNxtDWAddr = 13'h0AAA;
    tlp_tlpBRAM_readRemainDWLen = 10'h2AA;
    tlp_tlpBRAM_readStarted = 1'h0;
    tlp_tlpBRAM_writeDWAddr = 13'h0AAA;
    tlp_tlpBRAM_writeLastBE = 4'hA;
    tlp_tlpBRAM_writeRemainDWLen = 10'h2AA;
    tlp_tlpMetaSent = 1'h0;
    tlp_tlpRcvBusy = 1'h0;
    tlp_tlpXmtBusy = 1'h0;
    tlp_xmtMetaInFlight = 1'h0;
    tlp_xmtMetaOK = 1'h0;
    wci_cEdge = 3'h2;
    wci_cState = 3'h2;
    wci_ctlAckReg = 1'h0;
    wci_ctlOpActive = 1'h0;
    wci_illegalEdge = 1'h0;
    wci_isReset_isInReset = 1'h0;
    wci_nState = 3'h2;
    wci_reqF_countReg = 2'h2;
    wci_respF_cntr_r = 2'h2;
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
    wmi_wmi_respF_cntr_r = 2'h2;
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
      if (bram_0_serverAdapterA_s1[1] &&
	  !bram_0_serverAdapterA_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (bram_0_serverAdapterB_s1[1] &&
	  !bram_0_serverAdapterB_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (bram_1_serverAdapterA_s1[1] &&
	  !bram_1_serverAdapterA_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (bram_1_serverAdapterB_s1[1] &&
	  !bram_1_serverAdapterB_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (bram_2_serverAdapterA_s1[1] &&
	  !bram_2_serverAdapterA_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (bram_2_serverAdapterB_s1[1] &&
	  !bram_2_serverAdapterB_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (bram_3_serverAdapterA_s1[1] &&
	  !bram_3_serverAdapterA_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (bram_3_serverAdapterB_s1[1] &&
	  !bram_3_serverAdapterB_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	begin
	  v__h90888 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd)
	$display("[%0d]: %m: WCI CONFIG READ Addr:%0x BE:%0x Data:%0x",
		 v__h90888,
		 wci_reqF$D_OUT[63:32],
		 wci_reqF$D_OUT[67:64],
		 _theResult____h90872);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_start)
	begin
	  v__h15577 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h15577,
		 wci_reqF$D_OUT[36:34],
		 wci_cState);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaRequestNearMeta)
	begin
	  v__h41005 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaRequestNearMeta)
	$display("[%0d]: %m: dmaRequestNearMeta FPactMesg-Step1/7",
		 v__h41005);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaPushRequestMesg)
	begin
	  v__h47790 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaPushRequestMesg)
	$display("[%0d]: %m: dmaPushRequestMesg FPactMesg-Step3/7",
		 v__h47790);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaResponseNearMetaHead)
	begin
	  v__h43090 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaResponseNearMetaHead)
	$display("[%0d]: %m: dmaResponseNearMetaHead FPactMesg-Step2a/7 mesgLength:%0x",
		 v__h43090,
		 x__h42208);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaPushResponseHeader)
	begin
	  v__h48409 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaPushResponseHeader)
	$display("[%0d]: %m: dmaPushResponseHeader FPactMesg-Step4a/7",
		 v__h48409);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaPushResponseBody)
	begin
	  v__h48757 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaPushResponseBody)
	$display("[%0d]: %m: dmaPushResponseBody FPactMesg-Step4b/7",
		 v__h48757);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaXmtMetaHead)
	begin
	  v__h50007 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaXmtMetaHead)
	$display("[%0d]: %m: dmaXmtMetaHead FPactMesg-Step5/7", v__h50007);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaXmtTailEvent)
	begin
	  v__h56506 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaXmtTailEvent)
	$display("[%0d]: %m: dmaXmtTailEvent FPactMesg-Step7/7", v__h56506);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaXmtMetaBody)
	begin
	  v__h56382 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaXmtMetaBody)
	$display("[%0d]: %m: dmaXmtMetaBody FPactMesg-Step6/7", v__h56382);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaXmtDoorbell)
	begin
	  v__h56714 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaXmtDoorbell)
	$display("[%0d]: %m: dmaXmtDoorbell FC/FPactFlow-Step1/1", v__h56714);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaRespHeadFarMeta)
	begin
	  v__h59442 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaRespHeadFarMeta)
	$display("[%0d]: %m: dmaRespHeadFarMeta FPactMesg-Step2a/N fabMeta:%0x",
		 v__h59442,
		 x__h58352);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaPullTailEvent)
	begin
	  v__h65522 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaPullTailEvent)
	$display("[%0d]: %m: dmaPullTailEvent FPactMesg-Step5/5", v__h65522);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaRespBodyFarMeta)
	begin
	  v__h63835 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaRespBodyFarMeta)
	$display("[%0d]: %m: dmaRespBodyFarMeta FPactMesg-Step2b/N opcode:%0x nowMS:%0x nowLS:%0x",
		 v__h63835,
		 opcode__h60417,
		 nowMS__h61665,
		 nowLS__h62622);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaPullResponseHeader)
	begin
	  v__h65011 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaPullResponseHeader)
	$display("[%0d]: %m: dmaPullResponseHeader FPactMesg-Step4a/5",
		 v__h65011);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaPullResponseBody)
	begin
	  v__h65359 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaPullResponseBody)
	$display("[%0d]: %m: dmaPullResponseBody FPactMesg-Step4b/5",
		 v__h65359);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaTailEventSender)
	begin
	  v__h70765 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaTailEventSender)
	$display("[%0d]: %m: dmaTailEventSender - generic", v__h70765);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaResponseNearMetaBody)
	begin
	  v__h47450 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaResponseNearMetaBody)
	$display("[%0d]: %m: dmaResponseNearMetaBody FPactMesg-Step2b/7 opcode:%0x nowMS:%0x nowLS:%0x",
		 v__h47450,
		 opcode__h44022,
		 nowMS__h45280,
		 nowLS__h46239);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaRequestFarMeta)
	begin
	  v__h57177 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaRequestFarMeta)
	$display("[%0d]: %m: dmaRequestFarMeta FCactMesg-Step1/5", v__h57177);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaPullRequestFarMesg)
	begin
	  v__h64356 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_tlp_dmaPullRequestFarMesg)
	$display("[%0d]: %m: dmaPullRequestFarMesg FCactMesg-Step3/5",
		 v__h64356);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wmi_doWriteFinalize)
	begin
	  v__h82126 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wmi_doWriteFinalize)
	$display("[%0d]: %m: doWriteFinalize lclMetaAddr :%0x length:%0x opcode:%0x nowMS:%0x nowLS:%0x ",
		 v__h82126,
		 wmi_lclMetaAddr,
		 x3__h81484,
		 mesgMeta_opcode__h81524,
		 dmaStartTime$D_IN[63:32],
		 dmaStartTime$D_IN[31:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h18)
	begin
	  v__h90256 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && wci_reqF$D_OUT[39:32] == 8'h18)
	$display("[%0d] %m: fabDoneAvail Event", v__h90256);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	begin
	  v__h90725 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr)
	$display("[%0d]: %m: WCI CONFIG WRITE Addr:%0x BE:%0x Data:%0x",
		 v__h90725,
		 wci_reqF$D_OUT[63:32],
		 wci_reqF$D_OUT[67:64],
		 wci_reqF$D_OUT[31:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/inf/OCDP.bsv\", line 68, column 26: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and [RL_wci_cfrd] )\n  fired in the same clock cycle.\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	begin
	  v__h15896 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h15896,
		 wci_cEdge,
		 wci_cState);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	begin
	  v__h15752 = $time;
	  #0;
	end
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctl_op_complete && !wci_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h15752,
		 wci_cEdge,
		 wci_cState,
		 wci_nState);
  end
  // synopsys translate_on
endmodule