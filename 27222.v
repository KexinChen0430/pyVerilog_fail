module outputs
  wire [15 : 0] debug;
  wire [7 : 0] gmii_tx_txd, led;
  wire [3 : 0] lcd_db, pcie_txn, pcie_txp;
  wire CLK_GATE_gmii_tx_tx_clk,
       CLK_GATE_p125clk,
       CLK_GATE_rxclk,
       RDY_debug,
       RDY_usr_sw,
       gmii_led,
       gmii_rstn,
       gmii_tx_tx_clk,
       gmii_tx_tx_en,
       gmii_tx_tx_er,
       lcd_e,
       lcd_rs,
       lcd_rw,
       p125clk,
       p125rst,
       rxclk;
  // inlined wires
  wire [127 : 0] pciw_pci0_axiTxData$wget;
  wire [95 : 0] cap0_wsiS_extStatusW$wget;
  wire [71 : 0] cap0_wci_wslv_wciReq$wget;
  wire [66 : 0] cap0_wtiS_wtiReq$wget;
  wire [63 : 0] cap0_nowW$wget, cap0_wti_Es_mData_w$wget;
  wire [60 : 0] cap0_wsiS_wsiReq$wget;
  wire [33 : 0] cap0_wci_wslv_respF_x_wire$wget;
  wire [31 : 0] cap0_dataBram_serverAdapterA_outData_enqData$wget,
		cap0_dataBram_serverAdapterA_outData_outData$wget,
		cap0_dataBram_serverAdapterB_outData_enqData$wget,
		cap0_dataBram_serverAdapterB_outData_outData$wget,
		cap0_metaBram_serverAdapterA_1_outData_enqData$wget,
		cap0_metaBram_serverAdapterA_1_outData_outData$wget,
		cap0_metaBram_serverAdapterA_2_outData_enqData$wget,
		cap0_metaBram_serverAdapterA_2_outData_outData$wget,
		cap0_metaBram_serverAdapterA_3_outData_enqData$wget,
		cap0_metaBram_serverAdapterA_3_outData_outData$wget,
		cap0_metaBram_serverAdapterA_outData_enqData$wget,
		cap0_metaBram_serverAdapterA_outData_outData$wget,
		cap0_metaBram_serverAdapterB_1_outData_enqData$wget,
		cap0_metaBram_serverAdapterB_1_outData_outData$wget,
		cap0_metaBram_serverAdapterB_2_outData_enqData$wget,
		cap0_metaBram_serverAdapterB_2_outData_outData$wget,
		cap0_metaBram_serverAdapterB_3_outData_enqData$wget,
		cap0_metaBram_serverAdapterB_3_outData_outData$wget,
		cap0_metaBram_serverAdapterB_outData_enqData$wget,
		cap0_metaBram_serverAdapterB_outData_outData$wget,
		cap0_statusReg_w$wget,
		cap0_wci_wci_Es_mAddr_w$wget,
		cap0_wci_wci_Es_mData_w$wget,
		cap0_wsi_Es_mData_w$wget;
  wire [15 : 0] pciw_pci0_axiTxKeep$wget;
  wire [11 : 0] cap0_wsi_Es_mBurstLength_w$wget;
  wire [7 : 0] cap0_wsi_Es_mReqInfo_w$wget;
  wire [3 : 0] cap0_wci_wci_Es_mByteEn_w$wget,
	       cap0_wsi_Es_mByteEn_w$wget,
	       pciw_pci0_axiTxUser$wget;
  wire [2 : 0] cap0_dataBram_serverAdapterA_cnt_1$wget,
	       cap0_dataBram_serverAdapterA_cnt_2$wget,
	       cap0_dataBram_serverAdapterA_cnt_3$wget,
	       cap0_dataBram_serverAdapterB_cnt_1$wget,
	       cap0_dataBram_serverAdapterB_cnt_2$wget,
	       cap0_dataBram_serverAdapterB_cnt_3$wget,
	       cap0_metaBram_serverAdapterA_1_cnt_1$wget,
	       cap0_metaBram_serverAdapterA_1_cnt_2$wget,
	       cap0_metaBram_serverAdapterA_1_cnt_3$wget,
	       cap0_metaBram_serverAdapterA_2_cnt_1$wget,
	       cap0_metaBram_serverAdapterA_2_cnt_2$wget,
	       cap0_metaBram_serverAdapterA_2_cnt_3$wget,
	       cap0_metaBram_serverAdapterA_3_cnt_1$wget,
	       cap0_metaBram_serverAdapterA_3_cnt_2$wget,
	       cap0_metaBram_serverAdapterA_3_cnt_3$wget,
	       cap0_metaBram_serverAdapterA_cnt_1$wget,
	       cap0_metaBram_serverAdapterA_cnt_2$wget,
	       cap0_metaBram_serverAdapterA_cnt_3$wget,
	       cap0_metaBram_serverAdapterB_1_cnt_1$wget,
	       cap0_metaBram_serverAdapterB_1_cnt_2$wget,
	       cap0_metaBram_serverAdapterB_1_cnt_3$wget,
	       cap0_metaBram_serverAdapterB_2_cnt_1$wget,
	       cap0_metaBram_serverAdapterB_2_cnt_2$wget,
	       cap0_metaBram_serverAdapterB_2_cnt_3$wget,
	       cap0_metaBram_serverAdapterB_3_cnt_1$wget,
	       cap0_metaBram_serverAdapterB_3_cnt_2$wget,
	       cap0_metaBram_serverAdapterB_3_cnt_3$wget,
	       cap0_metaBram_serverAdapterB_cnt_1$wget,
	       cap0_metaBram_serverAdapterB_cnt_2$wget,
	       cap0_metaBram_serverAdapterB_cnt_3$wget,
	       cap0_wci_wci_Es_mCmd_w$wget,
	       cap0_wci_wslv_wEdge$wget,
	       cap0_wsi_Es_mCmd_w$wget,
	       cap0_wti_Es_mCmd_w$wget;
  wire [1 : 0] cap0_dataBram_serverAdapterA_s1_1$wget,
	       cap0_dataBram_serverAdapterA_writeWithResp$wget,
	       cap0_dataBram_serverAdapterB_s1_1$wget,
	       cap0_dataBram_serverAdapterB_writeWithResp$wget,
	       cap0_metaBram_serverAdapterA_1_s1_1$wget,
	       cap0_metaBram_serverAdapterA_1_writeWithResp$wget,
	       cap0_metaBram_serverAdapterA_2_s1_1$wget,
	       cap0_metaBram_serverAdapterA_2_writeWithResp$wget,
	       cap0_metaBram_serverAdapterA_3_s1_1$wget,
	       cap0_metaBram_serverAdapterA_3_writeWithResp$wget,
	       cap0_metaBram_serverAdapterA_s1_1$wget,
	       cap0_metaBram_serverAdapterA_writeWithResp$wget,
	       cap0_metaBram_serverAdapterB_1_s1_1$wget,
	       cap0_metaBram_serverAdapterB_1_writeWithResp$wget,
	       cap0_metaBram_serverAdapterB_2_s1_1$wget,
	       cap0_metaBram_serverAdapterB_2_writeWithResp$wget,
	       cap0_metaBram_serverAdapterB_3_s1_1$wget,
	       cap0_metaBram_serverAdapterB_3_writeWithResp$wget,
	       cap0_metaBram_serverAdapterB_s1_1$wget,
	       cap0_metaBram_serverAdapterB_writeWithResp$wget,
	       infLed$wget;
  wire blinkLed$wget,
       cap0_dataBram_serverAdapterA_cnt_1$whas,
       cap0_dataBram_serverAdapterA_cnt_2$whas,
       cap0_dataBram_serverAdapterA_cnt_3$whas,
       cap0_dataBram_serverAdapterA_outData_deqCalled$whas,
       cap0_dataBram_serverAdapterA_outData_enqData$whas,
       cap0_dataBram_serverAdapterA_outData_outData$whas,
       cap0_dataBram_serverAdapterA_s1_1$whas,
       cap0_dataBram_serverAdapterA_writeWithResp$whas,
       cap0_dataBram_serverAdapterB_cnt_1$whas,
       cap0_dataBram_serverAdapterB_cnt_2$whas,
       cap0_dataBram_serverAdapterB_cnt_3$whas,
       cap0_dataBram_serverAdapterB_outData_deqCalled$whas,
       cap0_dataBram_serverAdapterB_outData_enqData$whas,
       cap0_dataBram_serverAdapterB_outData_outData$whas,
       cap0_dataBram_serverAdapterB_s1_1$whas,
       cap0_dataBram_serverAdapterB_writeWithResp$whas,
       cap0_metaBram_serverAdapterA_1_cnt_1$whas,
       cap0_metaBram_serverAdapterA_1_cnt_2$whas,
       cap0_metaBram_serverAdapterA_1_cnt_3$whas,
       cap0_metaBram_serverAdapterA_1_outData_deqCalled$whas,
       cap0_metaBram_serverAdapterA_1_outData_enqData$whas,
       cap0_metaBram_serverAdapterA_1_outData_outData$whas,
       cap0_metaBram_serverAdapterA_1_s1_1$whas,
       cap0_metaBram_serverAdapterA_1_writeWithResp$whas,
       cap0_metaBram_serverAdapterA_2_cnt_1$whas,
       cap0_metaBram_serverAdapterA_2_cnt_2$whas,
       cap0_metaBram_serverAdapterA_2_cnt_3$whas,
       cap0_metaBram_serverAdapterA_2_outData_deqCalled$whas,
       cap0_metaBram_serverAdapterA_2_outData_enqData$whas,
       cap0_metaBram_serverAdapterA_2_outData_outData$whas,
       cap0_metaBram_serverAdapterA_2_s1_1$whas,
       cap0_metaBram_serverAdapterA_2_writeWithResp$whas,
       cap0_metaBram_serverAdapterA_3_cnt_1$whas,
       cap0_metaBram_serverAdapterA_3_cnt_2$whas,
       cap0_metaBram_serverAdapterA_3_cnt_3$whas,
       cap0_metaBram_serverAdapterA_3_outData_deqCalled$whas,
       cap0_metaBram_serverAdapterA_3_outData_enqData$whas,
       cap0_metaBram_serverAdapterA_3_outData_outData$whas,
       cap0_metaBram_serverAdapterA_3_s1_1$whas,
       cap0_metaBram_serverAdapterA_3_writeWithResp$whas,
       cap0_metaBram_serverAdapterA_cnt_1$whas,
       cap0_metaBram_serverAdapterA_cnt_2$whas,
       cap0_metaBram_serverAdapterA_cnt_3$whas,
       cap0_metaBram_serverAdapterA_outData_deqCalled$whas,
       cap0_metaBram_serverAdapterA_outData_enqData$whas,
       cap0_metaBram_serverAdapterA_outData_outData$whas,
       cap0_metaBram_serverAdapterA_s1_1$whas,
       cap0_metaBram_serverAdapterA_writeWithResp$whas,
       cap0_metaBram_serverAdapterB_1_cnt_1$whas,
       cap0_metaBram_serverAdapterB_1_cnt_2$whas,
       cap0_metaBram_serverAdapterB_1_cnt_3$whas,
       cap0_metaBram_serverAdapterB_1_outData_deqCalled$whas,
       cap0_metaBram_serverAdapterB_1_outData_enqData$whas,
       cap0_metaBram_serverAdapterB_1_outData_outData$whas,
       cap0_metaBram_serverAdapterB_1_s1_1$whas,
       cap0_metaBram_serverAdapterB_1_writeWithResp$whas,
       cap0_metaBram_serverAdapterB_2_cnt_1$whas,
       cap0_metaBram_serverAdapterB_2_cnt_2$whas,
       cap0_metaBram_serverAdapterB_2_cnt_3$whas,
       cap0_metaBram_serverAdapterB_2_outData_deqCalled$whas,
       cap0_metaBram_serverAdapterB_2_outData_enqData$whas,
       cap0_metaBram_serverAdapterB_2_outData_outData$whas,
       cap0_metaBram_serverAdapterB_2_s1_1$whas,
       cap0_metaBram_serverAdapterB_2_writeWithResp$whas,
       cap0_metaBram_serverAdapterB_3_cnt_1$whas,
       cap0_metaBram_serverAdapterB_3_cnt_2$whas,
       cap0_metaBram_serverAdapterB_3_cnt_3$whas,
       cap0_metaBram_serverAdapterB_3_outData_deqCalled$whas,
       cap0_metaBram_serverAdapterB_3_outData_enqData$whas,
       cap0_metaBram_serverAdapterB_3_outData_outData$whas,
       cap0_metaBram_serverAdapterB_3_s1_1$whas,
       cap0_metaBram_serverAdapterB_3_writeWithResp$whas,
       cap0_metaBram_serverAdapterB_cnt_1$whas,
       cap0_metaBram_serverAdapterB_cnt_2$whas,
       cap0_metaBram_serverAdapterB_cnt_3$whas,
       cap0_metaBram_serverAdapterB_outData_deqCalled$whas,
       cap0_metaBram_serverAdapterB_outData_enqData$whas,
       cap0_metaBram_serverAdapterB_outData_outData$whas,
       cap0_metaBram_serverAdapterB_s1_1$whas,
       cap0_metaBram_serverAdapterB_writeWithResp$whas,
       cap0_nowW$whas,
       cap0_statusReg_w$whas,
       cap0_wci_wci_Es_mAddrSpace_w$wget,
       cap0_wci_wci_Es_mAddrSpace_w$whas,
       cap0_wci_wci_Es_mAddr_w$whas,
       cap0_wci_wci_Es_mByteEn_w$whas,
       cap0_wci_wci_Es_mCmd_w$whas,
       cap0_wci_wci_Es_mData_w$whas,
       cap0_wci_wslv_ctlAckReg_1$wget,
       cap0_wci_wslv_ctlAckReg_1$whas,
       cap0_wci_wslv_reqF_r_clr$whas,
       cap0_wci_wslv_reqF_r_deq$whas,
       cap0_wci_wslv_reqF_r_enq$whas,
       cap0_wci_wslv_respF_dequeueing$whas,
       cap0_wci_wslv_respF_enqueueing$whas,
       cap0_wci_wslv_respF_x_wire$whas,
       cap0_wci_wslv_sFlagReg_1$wget,
       cap0_wci_wslv_sFlagReg_1$whas,
       cap0_wci_wslv_sThreadBusy_pw$whas,
       cap0_wci_wslv_wEdge$whas,
       cap0_wci_wslv_wciReq$whas,
       cap0_wci_wslv_wci_cfrd_pw$whas,
       cap0_wci_wslv_wci_cfwr_pw$whas,
       cap0_wci_wslv_wci_ctrl_pw$whas,
       cap0_wsiS_operateD_1$wget,
       cap0_wsiS_operateD_1$whas,
       cap0_wsiS_peerIsReady_1$wget,
       cap0_wsiS_peerIsReady_1$whas,
       cap0_wsiS_reqFifo_doResetClr$whas,
       cap0_wsiS_reqFifo_doResetDeq$whas,
       cap0_wsiS_reqFifo_doResetEnq$whas,
       cap0_wsiS_reqFifo_r_clr$whas,
       cap0_wsiS_reqFifo_r_deq$whas,
       cap0_wsiS_reqFifo_r_enq$whas,
       cap0_wsiS_sThreadBusy_dw$wget,
       cap0_wsiS_sThreadBusy_dw$whas,
       cap0_wsiS_wsiReq$whas,
       cap0_wsi_Es_mBurstLength_w$whas,
       cap0_wsi_Es_mBurstPrecise_w$whas,
       cap0_wsi_Es_mByteEn_w$whas,
       cap0_wsi_Es_mCmd_w$whas,
       cap0_wsi_Es_mDataInfo_w$whas,
       cap0_wsi_Es_mData_w$whas,
       cap0_wsi_Es_mReqInfo_w$whas,
       cap0_wsi_Es_mReqLast_w$whas,
       cap0_wtiS_operateD_1$wget,
       cap0_wtiS_operateD_1$whas,
       cap0_wtiS_wtiReq$whas,
       cap0_wti_Es_mCmd_w$whas,
       cap0_wti_Es_mData_w$whas,
       pciw_pci0_axiTxData$whas,
       pciw_pci0_axiTxKeep$whas,
       pciw_pci0_axiTxLast$wget,
       pciw_pci0_axiTxLast$whas,
       pciw_pci0_axiTxUser$whas,
       pciw_pci0_axiTxValid$wget,
       pciw_pci0_axiTxValid$whas;
  // register cap0_controlReg
  reg [31 : 0] cap0_controlReg;
  wire [31 : 0] cap0_controlReg$D_IN;
  wire cap0_controlReg$EN;
  // register cap0_dataBram_serverAdapterA_cnt
  reg [2 : 0] cap0_dataBram_serverAdapterA_cnt;
  wire [2 : 0] cap0_dataBram_serverAdapterA_cnt$D_IN;
  wire cap0_dataBram_serverAdapterA_cnt$EN;
  // register cap0_dataBram_serverAdapterA_s1
  reg [1 : 0] cap0_dataBram_serverAdapterA_s1;
  wire [1 : 0] cap0_dataBram_serverAdapterA_s1$D_IN;
  wire cap0_dataBram_serverAdapterA_s1$EN;
  // register cap0_dataBram_serverAdapterB_cnt
  reg [2 : 0] cap0_dataBram_serverAdapterB_cnt;
  wire [2 : 0] cap0_dataBram_serverAdapterB_cnt$D_IN;
  wire cap0_dataBram_serverAdapterB_cnt$EN;
  // register cap0_dataBram_serverAdapterB_s1
  reg [1 : 0] cap0_dataBram_serverAdapterB_s1;
  wire [1 : 0] cap0_dataBram_serverAdapterB_s1$D_IN;
  wire cap0_dataBram_serverAdapterB_s1$EN;
  // register cap0_dataCount
  reg [31 : 0] cap0_dataCount;
  reg [31 : 0] cap0_dataCount$D_IN;
  wire cap0_dataCount$EN;
  // register cap0_isFirst
  reg cap0_isFirst;
  wire cap0_isFirst$D_IN, cap0_isFirst$EN;
  // register cap0_mesgLengthSoFar
  reg [13 : 0] cap0_mesgLengthSoFar;
  wire [13 : 0] cap0_mesgLengthSoFar$D_IN;
  wire cap0_mesgLengthSoFar$EN;
  // register cap0_metaBram_serverAdapterA_1_cnt
  reg [2 : 0] cap0_metaBram_serverAdapterA_1_cnt;
  wire [2 : 0] cap0_metaBram_serverAdapterA_1_cnt$D_IN;
  wire cap0_metaBram_serverAdapterA_1_cnt$EN;
  // register cap0_metaBram_serverAdapterA_1_s1
  reg [1 : 0] cap0_metaBram_serverAdapterA_1_s1;
  wire [1 : 0] cap0_metaBram_serverAdapterA_1_s1$D_IN;
  wire cap0_metaBram_serverAdapterA_1_s1$EN;
  // register cap0_metaBram_serverAdapterA_2_cnt
  reg [2 : 0] cap0_metaBram_serverAdapterA_2_cnt;
  wire [2 : 0] cap0_metaBram_serverAdapterA_2_cnt$D_IN;
  wire cap0_metaBram_serverAdapterA_2_cnt$EN;
  // register cap0_metaBram_serverAdapterA_2_s1
  reg [1 : 0] cap0_metaBram_serverAdapterA_2_s1;
  wire [1 : 0] cap0_metaBram_serverAdapterA_2_s1$D_IN;
  wire cap0_metaBram_serverAdapterA_2_s1$EN;
  // register cap0_metaBram_serverAdapterA_3_cnt
  reg [2 : 0] cap0_metaBram_serverAdapterA_3_cnt;
  wire [2 : 0] cap0_metaBram_serverAdapterA_3_cnt$D_IN;
  wire cap0_metaBram_serverAdapterA_3_cnt$EN;
  // register cap0_metaBram_serverAdapterA_3_s1
  reg [1 : 0] cap0_metaBram_serverAdapterA_3_s1;
  wire [1 : 0] cap0_metaBram_serverAdapterA_3_s1$D_IN;
  wire cap0_metaBram_serverAdapterA_3_s1$EN;
  // register cap0_metaBram_serverAdapterA_cnt
  reg [2 : 0] cap0_metaBram_serverAdapterA_cnt;
  wire [2 : 0] cap0_metaBram_serverAdapterA_cnt$D_IN;
  wire cap0_metaBram_serverAdapterA_cnt$EN;
  // register cap0_metaBram_serverAdapterA_s1
  reg [1 : 0] cap0_metaBram_serverAdapterA_s1;
  wire [1 : 0] cap0_metaBram_serverAdapterA_s1$D_IN;
  wire cap0_metaBram_serverAdapterA_s1$EN;
  // register cap0_metaBram_serverAdapterB_1_cnt
  reg [2 : 0] cap0_metaBram_serverAdapterB_1_cnt;
  wire [2 : 0] cap0_metaBram_serverAdapterB_1_cnt$D_IN;
  wire cap0_metaBram_serverAdapterB_1_cnt$EN;
  // register cap0_metaBram_serverAdapterB_1_s1
  reg [1 : 0] cap0_metaBram_serverAdapterB_1_s1;
  wire [1 : 0] cap0_metaBram_serverAdapterB_1_s1$D_IN;
  wire cap0_metaBram_serverAdapterB_1_s1$EN;
  // register cap0_metaBram_serverAdapterB_2_cnt
  reg [2 : 0] cap0_metaBram_serverAdapterB_2_cnt;
  wire [2 : 0] cap0_metaBram_serverAdapterB_2_cnt$D_IN;
  wire cap0_metaBram_serverAdapterB_2_cnt$EN;
  // register cap0_metaBram_serverAdapterB_2_s1
  reg [1 : 0] cap0_metaBram_serverAdapterB_2_s1;
  wire [1 : 0] cap0_metaBram_serverAdapterB_2_s1$D_IN;
  wire cap0_metaBram_serverAdapterB_2_s1$EN;
  // register cap0_metaBram_serverAdapterB_3_cnt
  reg [2 : 0] cap0_metaBram_serverAdapterB_3_cnt;
  wire [2 : 0] cap0_metaBram_serverAdapterB_3_cnt$D_IN;
  wire cap0_metaBram_serverAdapterB_3_cnt$EN;
  // register cap0_metaBram_serverAdapterB_3_s1
  reg [1 : 0] cap0_metaBram_serverAdapterB_3_s1;
  wire [1 : 0] cap0_metaBram_serverAdapterB_3_s1$D_IN;
  wire cap0_metaBram_serverAdapterB_3_s1$EN;
  // register cap0_metaBram_serverAdapterB_cnt
  reg [2 : 0] cap0_metaBram_serverAdapterB_cnt;
  wire [2 : 0] cap0_metaBram_serverAdapterB_cnt$D_IN;
  wire cap0_metaBram_serverAdapterB_cnt$EN;
  // register cap0_metaBram_serverAdapterB_s1
  reg [1 : 0] cap0_metaBram_serverAdapterB_s1;
  wire [1 : 0] cap0_metaBram_serverAdapterB_s1$D_IN;
  wire cap0_metaBram_serverAdapterB_s1$EN;
  // register cap0_metaCount
  reg [31 : 0] cap0_metaCount;
  reg [31 : 0] cap0_metaCount$D_IN;
  wire cap0_metaCount$EN;
  // register cap0_splitReadInFlight
  reg cap0_splitReadInFlight;
  wire cap0_splitReadInFlight$D_IN, cap0_splitReadInFlight$EN;
  // register cap0_wci_wslv_cEdge
  reg [2 : 0] cap0_wci_wslv_cEdge;
  wire [2 : 0] cap0_wci_wslv_cEdge$D_IN;
  wire cap0_wci_wslv_cEdge$EN;
  // register cap0_wci_wslv_cState
  reg [2 : 0] cap0_wci_wslv_cState;
  wire [2 : 0] cap0_wci_wslv_cState$D_IN;
  wire cap0_wci_wslv_cState$EN;
  // register cap0_wci_wslv_ctlAckReg
  reg cap0_wci_wslv_ctlAckReg;
  wire cap0_wci_wslv_ctlAckReg$D_IN, cap0_wci_wslv_ctlAckReg$EN;
  // register cap0_wci_wslv_ctlOpActive
  reg cap0_wci_wslv_ctlOpActive;
  wire cap0_wci_wslv_ctlOpActive$D_IN, cap0_wci_wslv_ctlOpActive$EN;
  // register cap0_wci_wslv_illegalEdge
  reg cap0_wci_wslv_illegalEdge;
  wire cap0_wci_wslv_illegalEdge$D_IN, cap0_wci_wslv_illegalEdge$EN;
  // register cap0_wci_wslv_isReset_isInReset
  reg cap0_wci_wslv_isReset_isInReset;
  wire cap0_wci_wslv_isReset_isInReset$D_IN,
       cap0_wci_wslv_isReset_isInReset$EN;
  // register cap0_wci_wslv_nState
  reg [2 : 0] cap0_wci_wslv_nState;
  reg [2 : 0] cap0_wci_wslv_nState$D_IN;
  wire cap0_wci_wslv_nState$EN;
  // register cap0_wci_wslv_reqF_countReg
  reg [1 : 0] cap0_wci_wslv_reqF_countReg;
  wire [1 : 0] cap0_wci_wslv_reqF_countReg$D_IN;
  wire cap0_wci_wslv_reqF_countReg$EN;
  // register cap0_wci_wslv_respF_c_r
  reg [1 : 0] cap0_wci_wslv_respF_c_r;
  wire [1 : 0] cap0_wci_wslv_respF_c_r$D_IN;
  wire cap0_wci_wslv_respF_c_r$EN;
  // register cap0_wci_wslv_respF_q_0
  reg [33 : 0] cap0_wci_wslv_respF_q_0;
  reg [33 : 0] cap0_wci_wslv_respF_q_0$D_IN;
  wire cap0_wci_wslv_respF_q_0$EN;
  // register cap0_wci_wslv_respF_q_1
  reg [33 : 0] cap0_wci_wslv_respF_q_1;
  reg [33 : 0] cap0_wci_wslv_respF_q_1$D_IN;
  wire cap0_wci_wslv_respF_q_1$EN;
  // register cap0_wci_wslv_sFlagReg
  reg cap0_wci_wslv_sFlagReg;
  wire cap0_wci_wslv_sFlagReg$D_IN, cap0_wci_wslv_sFlagReg$EN;
  // register cap0_wci_wslv_sThreadBusy_d
  reg cap0_wci_wslv_sThreadBusy_d;
  wire cap0_wci_wslv_sThreadBusy_d$D_IN, cap0_wci_wslv_sThreadBusy_d$EN;
  // register cap0_wsiS_burstKind
  reg [1 : 0] cap0_wsiS_burstKind;
  wire [1 : 0] cap0_wsiS_burstKind$D_IN;
  wire cap0_wsiS_burstKind$EN;
  // register cap0_wsiS_errorSticky
  reg cap0_wsiS_errorSticky;
  wire cap0_wsiS_errorSticky$D_IN, cap0_wsiS_errorSticky$EN;
  // register cap0_wsiS_iMesgCount
  reg [31 : 0] cap0_wsiS_iMesgCount;
  wire [31 : 0] cap0_wsiS_iMesgCount$D_IN;
  wire cap0_wsiS_iMesgCount$EN;
  // register cap0_wsiS_isReset_isInReset
  reg cap0_wsiS_isReset_isInReset;
  wire cap0_wsiS_isReset_isInReset$D_IN, cap0_wsiS_isReset_isInReset$EN;
  // register cap0_wsiS_mesgWordLength
  reg [11 : 0] cap0_wsiS_mesgWordLength;
  wire [11 : 0] cap0_wsiS_mesgWordLength$D_IN;
  wire cap0_wsiS_mesgWordLength$EN;
  // register cap0_wsiS_operateD
  reg cap0_wsiS_operateD;
  wire cap0_wsiS_operateD$D_IN, cap0_wsiS_operateD$EN;
  // register cap0_wsiS_pMesgCount
  reg [31 : 0] cap0_wsiS_pMesgCount;
  wire [31 : 0] cap0_wsiS_pMesgCount$D_IN;
  wire cap0_wsiS_pMesgCount$EN;
  // register cap0_wsiS_peerIsReady
  reg cap0_wsiS_peerIsReady;
  wire cap0_wsiS_peerIsReady$D_IN, cap0_wsiS_peerIsReady$EN;
  // register cap0_wsiS_reqFifo_countReg
  reg [1 : 0] cap0_wsiS_reqFifo_countReg;
  wire [1 : 0] cap0_wsiS_reqFifo_countReg$D_IN;
  wire cap0_wsiS_reqFifo_countReg$EN;
  // register cap0_wsiS_reqFifo_levelsValid
  reg cap0_wsiS_reqFifo_levelsValid;
  wire cap0_wsiS_reqFifo_levelsValid$D_IN, cap0_wsiS_reqFifo_levelsValid$EN;
  // register cap0_wsiS_statusR
  reg [7 : 0] cap0_wsiS_statusR;
  wire [7 : 0] cap0_wsiS_statusR$D_IN;
  wire cap0_wsiS_statusR$EN;
  // register cap0_wsiS_tBusyCount
  reg [31 : 0] cap0_wsiS_tBusyCount;
  wire [31 : 0] cap0_wsiS_tBusyCount$D_IN;
  wire cap0_wsiS_tBusyCount$EN;
  // register cap0_wsiS_trafficSticky
  reg cap0_wsiS_trafficSticky;
  wire cap0_wsiS_trafficSticky$D_IN, cap0_wsiS_trafficSticky$EN;
  // register cap0_wsiS_wordCount
  reg [11 : 0] cap0_wsiS_wordCount;
  wire [11 : 0] cap0_wsiS_wordCount$D_IN;
  wire cap0_wsiS_wordCount$EN;
  // register cap0_wtiS_isReset_isInReset
  reg cap0_wtiS_isReset_isInReset;
  wire cap0_wtiS_isReset_isInReset$D_IN, cap0_wtiS_isReset_isInReset$EN;
  // register cap0_wtiS_nowReq
  reg [66 : 0] cap0_wtiS_nowReq;
  wire [66 : 0] cap0_wtiS_nowReq$D_IN;
  wire cap0_wtiS_nowReq$EN;
  // register cap0_wtiS_operateD
  reg cap0_wtiS_operateD;
  wire cap0_wtiS_operateD$D_IN, cap0_wtiS_operateD$EN;
  // register freeCnt
  reg [31 : 0] freeCnt;
  wire [31 : 0] freeCnt$D_IN;
  wire freeCnt$EN;
  // register needs_init
  reg needs_init;
  wire needs_init$D_IN, needs_init$EN;
  // register pciDevice
  reg [15 : 0] pciDevice;
  wire [15 : 0] pciDevice$D_IN;
  wire pciDevice$EN;
  // register pciw_pciDevice
  reg [15 : 0] pciw_pciDevice;
  wire [15 : 0] pciw_pciDevice$D_IN;
  wire pciw_pciDevice$EN;
  // ports of submodule cap0_dataBram_memory
  wire [31 : 0] cap0_dataBram_memory$DIA,
		cap0_dataBram_memory$DIB,
		cap0_dataBram_memory$DOA,
		cap0_dataBram_memory$DOB;
  wire [9 : 0] cap0_dataBram_memory$ADDRA, cap0_dataBram_memory$ADDRB;
  wire cap0_dataBram_memory$ENA,
       cap0_dataBram_memory$ENB,
       cap0_dataBram_memory$WEA,
       cap0_dataBram_memory$WEB;
  // ports of submodule cap0_dataBram_serverAdapterA_outDataCore
  wire [31 : 0] cap0_dataBram_serverAdapterA_outDataCore$D_IN,
		cap0_dataBram_serverAdapterA_outDataCore$D_OUT;
  wire cap0_dataBram_serverAdapterA_outDataCore$CLR,
       cap0_dataBram_serverAdapterA_outDataCore$DEQ,
       cap0_dataBram_serverAdapterA_outDataCore$EMPTY_N,
       cap0_dataBram_serverAdapterA_outDataCore$ENQ,
       cap0_dataBram_serverAdapterA_outDataCore$FULL_N;
  // ports of submodule cap0_dataBram_serverAdapterB_outDataCore
  wire [31 : 0] cap0_dataBram_serverAdapterB_outDataCore$D_IN,
		cap0_dataBram_serverAdapterB_outDataCore$D_OUT;
  wire cap0_dataBram_serverAdapterB_outDataCore$CLR,
       cap0_dataBram_serverAdapterB_outDataCore$DEQ,
       cap0_dataBram_serverAdapterB_outDataCore$EMPTY_N,
       cap0_dataBram_serverAdapterB_outDataCore$ENQ,
       cap0_dataBram_serverAdapterB_outDataCore$FULL_N;
  // ports of submodule cap0_metaBram_memory
  wire [31 : 0] cap0_metaBram_memory$DIA,
		cap0_metaBram_memory$DIB,
		cap0_metaBram_memory$DOA,
		cap0_metaBram_memory$DOB;
  wire [9 : 0] cap0_metaBram_memory$ADDRA, cap0_metaBram_memory$ADDRB;
  wire cap0_metaBram_memory$ENA,
       cap0_metaBram_memory$ENB,
       cap0_metaBram_memory$WEA,
       cap0_metaBram_memory$WEB;
  // ports of submodule cap0_metaBram_memory_1
  wire [31 : 0] cap0_metaBram_memory_1$DIA,
		cap0_metaBram_memory_1$DIB,
		cap0_metaBram_memory_1$DOA,
		cap0_metaBram_memory_1$DOB;
  wire [9 : 0] cap0_metaBram_memory_1$ADDRA, cap0_metaBram_memory_1$ADDRB;
  wire cap0_metaBram_memory_1$ENA,
       cap0_metaBram_memory_1$ENB,
       cap0_metaBram_memory_1$WEA,
       cap0_metaBram_memory_1$WEB;
  // ports of submodule cap0_metaBram_memory_2
  wire [31 : 0] cap0_metaBram_memory_2$DIA,
		cap0_metaBram_memory_2$DIB,
		cap0_metaBram_memory_2$DOA,
		cap0_metaBram_memory_2$DOB;
  wire [9 : 0] cap0_metaBram_memory_2$ADDRA, cap0_metaBram_memory_2$ADDRB;
  wire cap0_metaBram_memory_2$ENA,
       cap0_metaBram_memory_2$ENB,
       cap0_metaBram_memory_2$WEA,
       cap0_metaBram_memory_2$WEB;
  // ports of submodule cap0_metaBram_memory_3
  wire [31 : 0] cap0_metaBram_memory_3$DIA,
		cap0_metaBram_memory_3$DIB,
		cap0_metaBram_memory_3$DOA,
		cap0_metaBram_memory_3$DOB;
  wire [9 : 0] cap0_metaBram_memory_3$ADDRA, cap0_metaBram_memory_3$ADDRB;
  wire cap0_metaBram_memory_3$ENA,
       cap0_metaBram_memory_3$ENB,
       cap0_metaBram_memory_3$WEA,
       cap0_metaBram_memory_3$WEB;
  // ports of submodule cap0_metaBram_serverAdapterA_1_outDataCore
  wire [31 : 0] cap0_metaBram_serverAdapterA_1_outDataCore$D_IN,
		cap0_metaBram_serverAdapterA_1_outDataCore$D_OUT;
  wire cap0_metaBram_serverAdapterA_1_outDataCore$CLR,
       cap0_metaBram_serverAdapterA_1_outDataCore$DEQ,
       cap0_metaBram_serverAdapterA_1_outDataCore$EMPTY_N,
       cap0_metaBram_serverAdapterA_1_outDataCore$ENQ,
       cap0_metaBram_serverAdapterA_1_outDataCore$FULL_N;
  // ports of submodule cap0_metaBram_serverAdapterA_2_outDataCore
  wire [31 : 0] cap0_metaBram_serverAdapterA_2_outDataCore$D_IN,
		cap0_metaBram_serverAdapterA_2_outDataCore$D_OUT;
  wire cap0_metaBram_serverAdapterA_2_outDataCore$CLR,
       cap0_metaBram_serverAdapterA_2_outDataCore$DEQ,
       cap0_metaBram_serverAdapterA_2_outDataCore$EMPTY_N,
       cap0_metaBram_serverAdapterA_2_outDataCore$ENQ,
       cap0_metaBram_serverAdapterA_2_outDataCore$FULL_N;
  // ports of submodule cap0_metaBram_serverAdapterA_3_outDataCore
  wire [31 : 0] cap0_metaBram_serverAdapterA_3_outDataCore$D_IN,
		cap0_metaBram_serverAdapterA_3_outDataCore$D_OUT;
  wire cap0_metaBram_serverAdapterA_3_outDataCore$CLR,
       cap0_metaBram_serverAdapterA_3_outDataCore$DEQ,
       cap0_metaBram_serverAdapterA_3_outDataCore$EMPTY_N,
       cap0_metaBram_serverAdapterA_3_outDataCore$ENQ,
       cap0_metaBram_serverAdapterA_3_outDataCore$FULL_N;
  // ports of submodule cap0_metaBram_serverAdapterA_outDataCore
  wire [31 : 0] cap0_metaBram_serverAdapterA_outDataCore$D_IN,
		cap0_metaBram_serverAdapterA_outDataCore$D_OUT;
  wire cap0_metaBram_serverAdapterA_outDataCore$CLR,
       cap0_metaBram_serverAdapterA_outDataCore$DEQ,
       cap0_metaBram_serverAdapterA_outDataCore$EMPTY_N,
       cap0_metaBram_serverAdapterA_outDataCore$ENQ,
       cap0_metaBram_serverAdapterA_outDataCore$FULL_N;
  // ports of submodule cap0_metaBram_serverAdapterB_1_outDataCore
  wire [31 : 0] cap0_metaBram_serverAdapterB_1_outDataCore$D_IN,
		cap0_metaBram_serverAdapterB_1_outDataCore$D_OUT;
  wire cap0_metaBram_serverAdapterB_1_outDataCore$CLR,
       cap0_metaBram_serverAdapterB_1_outDataCore$DEQ,
       cap0_metaBram_serverAdapterB_1_outDataCore$EMPTY_N,
       cap0_metaBram_serverAdapterB_1_outDataCore$ENQ,
       cap0_metaBram_serverAdapterB_1_outDataCore$FULL_N;
  // ports of submodule cap0_metaBram_serverAdapterB_2_outDataCore
  wire [31 : 0] cap0_metaBram_serverAdapterB_2_outDataCore$D_IN,
		cap0_metaBram_serverAdapterB_2_outDataCore$D_OUT;
  wire cap0_metaBram_serverAdapterB_2_outDataCore$CLR,
       cap0_metaBram_serverAdapterB_2_outDataCore$DEQ,
       cap0_metaBram_serverAdapterB_2_outDataCore$EMPTY_N,
       cap0_metaBram_serverAdapterB_2_outDataCore$ENQ,
       cap0_metaBram_serverAdapterB_2_outDataCore$FULL_N;
  // ports of submodule cap0_metaBram_serverAdapterB_3_outDataCore
  wire [31 : 0] cap0_metaBram_serverAdapterB_3_outDataCore$D_IN,
		cap0_metaBram_serverAdapterB_3_outDataCore$D_OUT;
  wire cap0_metaBram_serverAdapterB_3_outDataCore$CLR,
       cap0_metaBram_serverAdapterB_3_outDataCore$DEQ,
       cap0_metaBram_serverAdapterB_3_outDataCore$EMPTY_N,
       cap0_metaBram_serverAdapterB_3_outDataCore$ENQ,
       cap0_metaBram_serverAdapterB_3_outDataCore$FULL_N;
  // ports of submodule cap0_metaBram_serverAdapterB_outDataCore
  wire [31 : 0] cap0_metaBram_serverAdapterB_outDataCore$D_IN,
		cap0_metaBram_serverAdapterB_outDataCore$D_OUT;
  wire cap0_metaBram_serverAdapterB_outDataCore$CLR,
       cap0_metaBram_serverAdapterB_outDataCore$DEQ,
       cap0_metaBram_serverAdapterB_outDataCore$EMPTY_N,
       cap0_metaBram_serverAdapterB_outDataCore$ENQ,
       cap0_metaBram_serverAdapterB_outDataCore$FULL_N;
  // ports of submodule cap0_splaF
  wire [2 : 0] cap0_splaF$D_IN, cap0_splaF$D_OUT;
  wire cap0_splaF$CLR,
       cap0_splaF$DEQ,
       cap0_splaF$EMPTY_N,
       cap0_splaF$ENQ,
       cap0_splaF$FULL_N;
  // ports of submodule cap0_wci_wslv_reqF
  wire [71 : 0] cap0_wci_wslv_reqF$D_IN, cap0_wci_wslv_reqF$D_OUT;
  wire cap0_wci_wslv_reqF$CLR,
       cap0_wci_wslv_reqF$DEQ,
       cap0_wci_wslv_reqF$EMPTY_N,
       cap0_wci_wslv_reqF$ENQ;
  // ports of submodule cap0_wsiS_reqFifo
  wire [60 : 0] cap0_wsiS_reqFifo$D_IN, cap0_wsiS_reqFifo$D_OUT;
  wire cap0_wsiS_reqFifo$CLR,
       cap0_wsiS_reqFifo$DEQ,
       cap0_wsiS_reqFifo$EMPTY_N,
       cap0_wsiS_reqFifo$ENQ,
       cap0_wsiS_reqFifo$FULL_N;
  // ports of submodule ctop
  wire [152 : 0] ctop$server_request_put, ctop$server_response_get;
  wire [127 : 0] ctop$wmemiM0_SData;
  wire [58 : 0] ctop$cpServer_request_put;
  wire [31 : 0] ctop$wci_m_0_SData,
		ctop$wci_m_1_SData,
		ctop$wci_m_2_MAddr,
		ctop$wci_m_2_MData,
		ctop$wci_m_2_SData,
		ctop$wci_m_3_MAddr,
		ctop$wci_m_3_MData,
		ctop$wci_m_3_SData,
		ctop$wci_m_4_SData,
		ctop$wsi_s_adc_MData;
  wire [11 : 0] ctop$wsi_s_adc_MBurstLength;
  wire [7 : 0] ctop$wsi_s_adc_MReqInfo;
  wire [3 : 0] ctop$wci_m_2_MByteEn,
	       ctop$wci_m_3_MByteEn,
	       ctop$wsi_s_adc_MByteEn;
  wire [2 : 0] ctop$switch_x,
	       ctop$wci_m_2_MCmd,
	       ctop$wci_m_3_MCmd,
	       ctop$wsi_s_adc_MCmd;
  wire [1 : 0] ctop$led,
	       ctop$wci_m_0_SFlag,
	       ctop$wci_m_0_SResp,
	       ctop$wci_m_1_SFlag,
	       ctop$wci_m_1_SResp,
	       ctop$wci_m_2_MFlag,
	       ctop$wci_m_2_SFlag,
	       ctop$wci_m_2_SResp,
	       ctop$wci_m_3_SFlag,
	       ctop$wci_m_3_SResp,
	       ctop$wci_m_4_SFlag,
	       ctop$wci_m_4_SResp,
	       ctop$wmemiM0_SResp;
  wire ctop$EN_cpServer_request_put,
       ctop$EN_cpServer_response_get,
       ctop$EN_server_request_put,
       ctop$EN_server_response_get,
       ctop$RDY_server_request_put,
       ctop$RDY_server_response_get,
       ctop$RST_N_wci_m_2,
       ctop$RST_N_wci_m_3,
       ctop$gps_ppsSyncIn_x,
       ctop$wci_m_0_SThreadBusy,
       ctop$wci_m_1_SThreadBusy,
       ctop$wci_m_2_MAddrSpace,
       ctop$wci_m_2_SThreadBusy,
       ctop$wci_m_3_MAddrSpace,
       ctop$wci_m_3_SThreadBusy,
       ctop$wci_m_4_SThreadBusy,
       ctop$wmemiM0_SCmdAccept,
       ctop$wmemiM0_SDataAccept,
       ctop$wmemiM0_SRespLast,
       ctop$wsi_m_dac_SReset_n,
       ctop$wsi_m_dac_SThreadBusy,
       ctop$wsi_s_adc_MBurstPrecise,
       ctop$wsi_s_adc_MReqLast,
       ctop$wsi_s_adc_MReset_n;
  // ports of submodule gbe0
  wire [66 : 0] gbe0$wtiS0_req;
  wire [39 : 0] gbe0$cpClient_response_put;
  wire [31 : 0] gbe0$wciS0_MAddr,
		gbe0$wciS0_MData,
		gbe0$wciS0_SData,
		gbe0$wsiM0_MData,
		gbe0$wsiS0_MData;
  wire [11 : 0] gbe0$wsiM0_MBurstLength, gbe0$wsiS0_MBurstLength;
  wire [7 : 0] gbe0$gmii_rx_rxd_i,
	       gbe0$gmii_tx_txd,
	       gbe0$wsiM0_MReqInfo,
	       gbe0$wsiS0_MReqInfo;
  wire [3 : 0] gbe0$wciS0_MByteEn, gbe0$wsiM0_MByteEn, gbe0$wsiS0_MByteEn;
  wire [2 : 0] gbe0$wciS0_MCmd, gbe0$wsiM0_MCmd, gbe0$wsiS0_MCmd;
  wire [1 : 0] gbe0$wciS0_MFlag, gbe0$wciS0_SFlag, gbe0$wciS0_SResp;
  wire gbe0$CLK_gmii_tx_tx_clk,
       gbe0$CLK_rxclkBnd,
       gbe0$EN_cpClient_request_get,
       gbe0$EN_cpClient_response_put,
       gbe0$RST_N_gmii_rstn,
       gbe0$gmii_col_i,
       gbe0$gmii_crs_i,
       gbe0$gmii_intr_i,
       gbe0$gmii_led,
       gbe0$gmii_rx_rx_dv_i,
       gbe0$gmii_rx_rx_er_i,
       gbe0$gmii_tx_tx_en,
       gbe0$gmii_tx_tx_er,
       gbe0$mdio_mdc,
       gbe0$mdio_mdd,
       gbe0$wciS0_MAddrSpace,
       gbe0$wciS0_SThreadBusy,
       gbe0$wsiM0_MBurstPrecise,
       gbe0$wsiM0_MReqLast,
       gbe0$wsiM0_MReset_n,
       gbe0$wsiM0_SReset_n,
       gbe0$wsiM0_SThreadBusy,
       gbe0$wsiS0_MBurstPrecise,
       gbe0$wsiS0_MReqLast,
       gbe0$wsiS0_MReset_n;
  // ports of submodule idc_resetP
  wire idc_resetP$RESET_OUT;
  // ports of submodule lcd_ctrl
  wire [127 : 0] lcd_ctrl$setLine1_text, lcd_ctrl$setLine2_text;
  wire [3 : 0] lcd_ctrl$db;
  wire lcd_ctrl$EN_setLine1,
       lcd_ctrl$EN_setLine2,
       lcd_ctrl$e,
       lcd_ctrl$rs,
       lcd_ctrl$rw;
  // ports of submodule pciw_fI2P
  wire [152 : 0] pciw_fI2P$D_IN, pciw_fI2P$D_OUT;
  wire pciw_fI2P$CLR,
       pciw_fI2P$DEQ,
       pciw_fI2P$EMPTY_N,
       pciw_fI2P$ENQ,
       pciw_fI2P$FULL_N;
  // ports of submodule pciw_fP2I
  wire [152 : 0] pciw_fP2I$D_IN, pciw_fP2I$D_OUT;
  wire pciw_fP2I$CLR,
       pciw_fP2I$DEQ,
       pciw_fP2I$EMPTY_N,
       pciw_fP2I$ENQ,
       pciw_fP2I$FULL_N;
  // ports of submodule pciw_p125rst
  wire pciw_p125rst$OUT_RST;
  // ports of submodule pciw_pci0_axiRst125
  wire pciw_pci0_axiRst125$OUT_RST;
  // ports of submodule pciw_pci0_clk
  wire pciw_pci0_clk$O;
  // ports of submodule pciw_pci0_pcie_ep
  wire [127 : 0] pciw_pci0_pcie_ep$cfg_err_aer_headerlog,
		 pciw_pci0_pcie_ep$m_axis_rx_tdata,
		 pciw_pci0_pcie_ep$s_axis_tx_tdata;
  wire [63 : 0] pciw_pci0_pcie_ep$cfg_dsn;
  wire [47 : 0] pciw_pci0_pcie_ep$cfg_err_tlp_cpl_header;
  wire [31 : 0] pciw_pci0_pcie_ep$cfg_mgmt_di;
  wire [21 : 0] pciw_pci0_pcie_ep$m_axis_rx_tuser;
  wire [15 : 0] pciw_pci0_pcie_ep$s_axis_tx_tkeep;
  wire [9 : 0] pciw_pci0_pcie_ep$cfg_mgmt_dwaddr;
  wire [7 : 0] pciw_pci0_pcie_ep$cfg_bus_number,
	       pciw_pci0_pcie_ep$cfg_interrupt_di;
  wire [4 : 0] pciw_pci0_pcie_ep$cfg_device_number,
	       pciw_pci0_pcie_ep$cfg_pciecap_interrupt_msgnum;
  wire [3 : 0] pciw_pci0_pcie_ep$PIPE_RXUSRCLK_IN,
	       pciw_pci0_pcie_ep$cfg_mgmt_byte_en,
	       pciw_pci0_pcie_ep$pci_exp_rxn,
	       pciw_pci0_pcie_ep$pci_exp_rxp,
	       pciw_pci0_pcie_ep$pci_exp_txn,
	       pciw_pci0_pcie_ep$pci_exp_txp,
	       pciw_pci0_pcie_ep$s_axis_tx_tuser;
  wire [2 : 0] pciw_pci0_pcie_ep$cfg_function_number,
	       pciw_pci0_pcie_ep$fc_sel;
  wire [1 : 0] pciw_pci0_pcie_ep$cfg_pm_force_state,
	       pciw_pci0_pcie_ep$pl_directed_link_change,
	       pciw_pci0_pcie_ep$pl_directed_link_width;
  wire pciw_pci0_pcie_ep$PIPE_DCLK_IN,
       pciw_pci0_pcie_ep$PIPE_MMCM_LOCK_IN,
       pciw_pci0_pcie_ep$PIPE_OOBCLK_IN,
       pciw_pci0_pcie_ep$PIPE_PCLK_IN,
       pciw_pci0_pcie_ep$PIPE_RXOUTCLK_IN,
       pciw_pci0_pcie_ep$PIPE_USERCLK1_IN,
       pciw_pci0_pcie_ep$PIPE_USERCLK2_IN,
       pciw_pci0_pcie_ep$cfg_err_acs,
       pciw_pci0_pcie_ep$cfg_err_atomic_egress_blocked,
       pciw_pci0_pcie_ep$cfg_err_cor,
       pciw_pci0_pcie_ep$cfg_err_cpl_abort,
       pciw_pci0_pcie_ep$cfg_err_cpl_timeout,
       pciw_pci0_pcie_ep$cfg_err_cpl_unexpect,
       pciw_pci0_pcie_ep$cfg_err_ecrc,
       pciw_pci0_pcie_ep$cfg_err_internal_cor,
       pciw_pci0_pcie_ep$cfg_err_internal_uncor,
       pciw_pci0_pcie_ep$cfg_err_locked,
       pciw_pci0_pcie_ep$cfg_err_malformed,
       pciw_pci0_pcie_ep$cfg_err_mc_blocked,
       pciw_pci0_pcie_ep$cfg_err_norecovery,
       pciw_pci0_pcie_ep$cfg_err_poisoned,
       pciw_pci0_pcie_ep$cfg_err_posted,
       pciw_pci0_pcie_ep$cfg_err_ur,
       pciw_pci0_pcie_ep$cfg_interrupt,
       pciw_pci0_pcie_ep$cfg_interrupt_assert,
       pciw_pci0_pcie_ep$cfg_interrupt_stat,
       pciw_pci0_pcie_ep$cfg_mgmt_rd_en,
       pciw_pci0_pcie_ep$cfg_mgmt_wr_en,
       pciw_pci0_pcie_ep$cfg_mgmt_wr_readonly,
       pciw_pci0_pcie_ep$cfg_pm_force_state_en,
       pciw_pci0_pcie_ep$cfg_pm_halt_aspm_l0s,
       pciw_pci0_pcie_ep$cfg_pm_halt_aspm_l1,
       pciw_pci0_pcie_ep$cfg_pm_wake,
       pciw_pci0_pcie_ep$cfg_trn_pending,
       pciw_pci0_pcie_ep$cfg_turnoff_ok,
       pciw_pci0_pcie_ep$m_axis_rx_tready,
       pciw_pci0_pcie_ep$m_axis_rx_tvalid,
       pciw_pci0_pcie_ep$pl_directed_link_auton,
       pciw_pci0_pcie_ep$pl_directed_link_speed,
       pciw_pci0_pcie_ep$pl_upstream_prefer_deemph,
       pciw_pci0_pcie_ep$rx_np_ok,
       pciw_pci0_pcie_ep$rx_np_req,
       pciw_pci0_pcie_ep$s_axis_tx_tlast,
       pciw_pci0_pcie_ep$s_axis_tx_tready,
       pciw_pci0_pcie_ep$s_axis_tx_tvalid,
       pciw_pci0_pcie_ep$tx_cfg_gnt,
       pciw_pci0_pcie_ep$user_clk_out,
       pciw_pci0_pcie_ep$user_lnk_up,
       pciw_pci0_pcie_ep$user_reset_out;
  // ports of submodule pciw_pci0_pcie_ep_reset
  wire pciw_pci0_pcie_ep_reset$RESET_OUT;
  // ports of submodule pciw_pci0_rxF
  wire [152 : 0] pciw_pci0_rxF$D_IN, pciw_pci0_rxF$D_OUT;
  wire pciw_pci0_rxF$CLR,
       pciw_pci0_rxF$DEQ,
       pciw_pci0_rxF$EMPTY_N,
       pciw_pci0_rxF$ENQ,
       pciw_pci0_rxF$FULL_N;
  // ports of submodule pciw_pci0_txF
  wire [152 : 0] pciw_pci0_txF$D_IN, pciw_pci0_txF$D_OUT;
  wire pciw_pci0_txF$CLR,
       pciw_pci0_txF$DEQ,
       pciw_pci0_txF$EMPTY_N,
       pciw_pci0_txF$ENQ,
       pciw_pci0_txF$FULL_N;
  // ports of submodule pciw_pci0_usr_rst_n
  wire pciw_pci0_usr_rst_n$RESET_OUT;
  // ports of submodule sys0_clk
  wire sys0_clk$O;
  // ports of submodule sys0_rst
  wire sys0_rst$OUT_RST;
  // ports of submodule sys1_clk
  wire sys1_clk$O;
  // ports of submodule sys1_clki
  wire sys1_clki$O;
  // ports of submodule sys1_rst
  wire sys1_rst$OUT_RST;
  // rule scheduling signals
  wire CAN_FIRE_RL_cap0_wci_cfrd,
       WILL_FIRE_RL_cap0_advance_split_response,
       WILL_FIRE_RL_cap0_dataBram_serverAdapterB_outData_enqAndDeq,
       WILL_FIRE_RL_cap0_dataBram_serverAdapterB_stageReadResponseAlways,
       WILL_FIRE_RL_cap0_doMessageAccept,
       WILL_FIRE_RL_cap0_metaBram_serverAdapterB_1_outData_enqAndDeq,
       WILL_FIRE_RL_cap0_metaBram_serverAdapterB_1_stageReadResponseAlways,
       WILL_FIRE_RL_cap0_metaBram_serverAdapterB_2_outData_enqAndDeq,
       WILL_FIRE_RL_cap0_metaBram_serverAdapterB_2_stageReadResponseAlways,
       WILL_FIRE_RL_cap0_metaBram_serverAdapterB_3_outData_enqAndDeq,
       WILL_FIRE_RL_cap0_metaBram_serverAdapterB_3_stageReadResponseAlways,
       WILL_FIRE_RL_cap0_metaBram_serverAdapterB_outData_enqAndDeq,
       WILL_FIRE_RL_cap0_metaBram_serverAdapterB_stageReadResponseAlways,
       WILL_FIRE_RL_cap0_wci_cfrd,
       WILL_FIRE_RL_cap0_wci_cfwr,
       WILL_FIRE_RL_cap0_wci_ctrl_EiI,
       WILL_FIRE_RL_cap0_wci_ctrl_IsO,
       WILL_FIRE_RL_cap0_wci_ctrl_OrE,
       WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete,
       WILL_FIRE_RL_cap0_wci_wslv_ctl_op_start,
       WILL_FIRE_RL_cap0_wci_wslv_respF_both,
       WILL_FIRE_RL_cap0_wci_wslv_respF_decCtr,
       WILL_FIRE_RL_cap0_wci_wslv_respF_incCtr,
       WILL_FIRE_RL_cap0_wsiS_reqFifo_enq,
       WILL_FIRE_RL_cap0_wsiS_reqFifo_reset;
  // inputs to muxes for submodule ports
  reg [33 : 0] MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_2;
  wire [33 : 0] MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_1,
		MUX_cap0_wci_wslv_respF_q_1$write_1__VAL_1,
		MUX_cap0_wci_wslv_respF_x_wire$wset_1__VAL_1,
		MUX_cap0_wci_wslv_respF_x_wire$wset_1__VAL_2,
		MUX_cap0_wci_wslv_respF_x_wire$wset_1__VAL_3;
  wire [31 : 0] MUX_cap0_dataCount$write_1__VAL_2,
		MUX_cap0_metaCount$write_1__VAL_2;
  wire [1 : 0] MUX_cap0_wci_wslv_respF_c_r$write_1__VAL_1,
	       MUX_cap0_wci_wslv_respF_c_r$write_1__VAL_2;
  wire MUX_cap0_controlReg$write_1__SEL_1,
       MUX_cap0_dataCount$write_1__SEL_1,
       MUX_cap0_dataCount$write_1__SEL_2,
       MUX_cap0_metaCount$write_1__SEL_1,
       MUX_cap0_metaCount$write_1__SEL_2,
       MUX_cap0_splitReadInFlight$write_1__SEL_1,
       MUX_cap0_wci_wslv_illegalEdge$write_1__SEL_1,
       MUX_cap0_wci_wslv_illegalEdge$write_1__SEL_2,
       MUX_cap0_wci_wslv_illegalEdge$write_1__VAL_2,
       MUX_cap0_wci_wslv_respF_q_0$write_1__SEL_2,
       MUX_cap0_wci_wslv_respF_q_1$write_1__SEL_2,
       MUX_cap0_wci_wslv_respF_x_wire$wset_1__SEL_1;
  // remaining internal signals
  reg [63 : 0] v__h14804,
	       v__h14979,
	       v__h15123,
	       v__h36538,
	       v__h37583,
	       v__h37878,
	       v__h38083;
  reg [31 : 0] IF_cap0_splaF_first__027_BITS_1_TO_0_029_EQ_0__ETC___d1081,
	       v__h38064;
  reg [15 : 0] CASE_pciw_pci0_pcie_epm_axis_rx_tuser_BITS_20_ETC__q1;
  reg CASE_cap0_splaFD_OUT_BITS_1_TO_0_NOT_cap0_spl_ETC__q2,
      IF_cap0_splaF_first__027_BITS_1_TO_0_029_EQ_0__ETC___d1048,
      IF_cap0_wci_wslv_reqF_first__75_BITS_35_TO_34__ETC___d1124,
      IF_cap0_wci_wslv_reqF_first__75_BITS_63_TO_52__ETC___d1128;
  wire [127 : 0] x_data__h1483;
  wire [31 : 0] g_data__h39139,
		rdat___1__h38161,
		rdat___1__h38235,
		v__h36664,
		y_avValue__h37291,
		y_avValue__h37335,
		y_avValue__h37375,
		y_avValue__h37415,
		y_avValue__h37455;
  wire [15 : 0] IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291,
		x_be__h1482;
  wire [13 : 0] mlB__h34434, mlInc__h34433;
  wire [2 : 0] cap0_dataBram_serverAdapterB_cnt_51_PLUS_IF_ca_ETC___d457,
	       cap0_metaBram_serverAdapterB_1_cnt_87_PLUS_IF__ETC___d693,
	       cap0_metaBram_serverAdapterB_2_cnt_05_PLUS_IF__ETC___d811,
	       cap0_metaBram_serverAdapterB_3_cnt_23_PLUS_IF__ETC___d929,
	       cap0_metaBram_serverAdapterB_cnt_69_PLUS_IF_ca_ETC___d575,
	       x__h34482,
	       x__h34494,
	       x__h34506,
	       y__h34483,
	       y__h34495,
	       y__h34507;
  wire IF_cap0_splaF_first__027_BITS_1_TO_0_029_EQ_0__ETC___d1057,
       NOT_cap0_controlReg_60_BIT_0_61_62_OR_cap0_con_ETC___d986,
       cap0_controlReg_60_BIT_0_61_AND_NOT_cap0_contr_ETC___d1008,
       cap0_dataCount_67_ULT_1024___d1378,
       cap0_metaCount_64_ULT_1024___d1257,
       cap0_splaF_i_notEmpty__026_AND_IF_cap0_splaF_f_ETC___d1059;
  // oscillator and gates for output clock p125clk
  assign p125clk = pciw_pci0_pcie_ep$user_clk_out ;
  assign CLK_GATE_p125clk = 1'b1 ;
  // oscillator and gates for output clock rxclk
  assign rxclk = gbe0$CLK_rxclkBnd ;
  assign CLK_GATE_rxclk = 1'b1 ;
  // oscillator and gates for output clock gmii_tx_tx_clk
  assign gmii_tx_tx_clk = gbe0$CLK_gmii_tx_tx_clk ;
  assign CLK_GATE_gmii_tx_tx_clk = 1'b1 ;
  // output resets
  assign p125rst = pciw_p125rst$OUT_RST ;
  assign gmii_rstn = gbe0$RST_N_gmii_rstn ;
  // value method pcie_txp
  assign pcie_txp = pciw_pci0_pcie_ep$pci_exp_txp ;
  // value method pcie_txn
  assign pcie_txn = pciw_pci0_pcie_ep$pci_exp_txn ;
  // action method usr_sw
  assign RDY_usr_sw = 1'd1 ;
  // value method led
  assign led =
	     { freeCnt[25], 4'b0, ctop$led, pciw_pci0_pcie_ep$user_lnk_up } ;
  // value method lcd_db
  assign lcd_db = lcd_ctrl$db ;
  // value method lcd_e
  assign lcd_e = lcd_ctrl$e ;
  // value method lcd_rs
  assign lcd_rs = lcd_ctrl$rs ;
  // value method lcd_rw
  assign lcd_rw = lcd_ctrl$rw ;
  // value method debug
  assign debug = freeCnt[31:16] ;
  assign RDY_debug = 1'd1 ;
  // value method gmii_tx_txd
  assign gmii_tx_txd = gbe0$gmii_tx_txd ;
  // value method gmii_tx_tx_en
  assign gmii_tx_tx_en = gbe0$gmii_tx_tx_en ;
  // value method gmii_tx_tx_er
  assign gmii_tx_tx_er = gbe0$gmii_tx_tx_er ;
  // value method gmii_led
  assign gmii_led = gbe0$gmii_led ;
  // submodule cap0_dataBram_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd10),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(11'd1024)) cap0_dataBram_memory(.CLKA(pciw_pci0_pcie_ep$user_clk_out),
						   .CLKB(pciw_pci0_pcie_ep$user_clk_out),
						   .ADDRA(cap0_dataBram_memory$ADDRA),
						   .ADDRB(cap0_dataBram_memory$ADDRB),
						   .DIA(cap0_dataBram_memory$DIA),
						   .DIB(cap0_dataBram_memory$DIB),
						   .WEA(cap0_dataBram_memory$WEA),
						   .WEB(cap0_dataBram_memory$WEB),
						   .ENA(cap0_dataBram_memory$ENA),
						   .ENB(cap0_dataBram_memory$ENB),
						   .DOA(cap0_dataBram_memory$DOA),
						   .DOB(cap0_dataBram_memory$DOB));
  // submodule cap0_dataBram_serverAdapterA_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) cap0_dataBram_serverAdapterA_outDataCore(.RST(ctop$RST_N_wci_m_3),
									.CLK(pciw_pci0_pcie_ep$user_clk_out),
									.D_IN(cap0_dataBram_serverAdapterA_outDataCore$D_IN),
									.ENQ(cap0_dataBram_serverAdapterA_outDataCore$ENQ),
									.DEQ(cap0_dataBram_serverAdapterA_outDataCore$DEQ),
									.CLR(cap0_dataBram_serverAdapterA_outDataCore$CLR),
									.D_OUT(cap0_dataBram_serverAdapterA_outDataCore$D_OUT),
									.FULL_N(cap0_dataBram_serverAdapterA_outDataCore$FULL_N),
									.EMPTY_N(cap0_dataBram_serverAdapterA_outDataCore$EMPTY_N));
  // submodule cap0_dataBram_serverAdapterB_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) cap0_dataBram_serverAdapterB_outDataCore(.RST(ctop$RST_N_wci_m_3),
									.CLK(pciw_pci0_pcie_ep$user_clk_out),
									.D_IN(cap0_dataBram_serverAdapterB_outDataCore$D_IN),
									.ENQ(cap0_dataBram_serverAdapterB_outDataCore$ENQ),
									.DEQ(cap0_dataBram_serverAdapterB_outDataCore$DEQ),
									.CLR(cap0_dataBram_serverAdapterB_outDataCore$CLR),
									.D_OUT(cap0_dataBram_serverAdapterB_outDataCore$D_OUT),
									.FULL_N(cap0_dataBram_serverAdapterB_outDataCore$FULL_N),
									.EMPTY_N(cap0_dataBram_serverAdapterB_outDataCore$EMPTY_N));
  // submodule cap0_metaBram_memory
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd10),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(11'd1024)) cap0_metaBram_memory(.CLKA(pciw_pci0_pcie_ep$user_clk_out),
						   .CLKB(pciw_pci0_pcie_ep$user_clk_out),
						   .ADDRA(cap0_metaBram_memory$ADDRA),
						   .ADDRB(cap0_metaBram_memory$ADDRB),
						   .DIA(cap0_metaBram_memory$DIA),
						   .DIB(cap0_metaBram_memory$DIB),
						   .WEA(cap0_metaBram_memory$WEA),
						   .WEB(cap0_metaBram_memory$WEB),
						   .ENA(cap0_metaBram_memory$ENA),
						   .ENB(cap0_metaBram_memory$ENB),
						   .DOA(cap0_metaBram_memory$DOA),
						   .DOB(cap0_metaBram_memory$DOB));
  // submodule cap0_metaBram_memory_1
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd10),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(11'd1024)) cap0_metaBram_memory_1(.CLKA(pciw_pci0_pcie_ep$user_clk_out),
						     .CLKB(pciw_pci0_pcie_ep$user_clk_out),
						     .ADDRA(cap0_metaBram_memory_1$ADDRA),
						     .ADDRB(cap0_metaBram_memory_1$ADDRB),
						     .DIA(cap0_metaBram_memory_1$DIA),
						     .DIB(cap0_metaBram_memory_1$DIB),
						     .WEA(cap0_metaBram_memory_1$WEA),
						     .WEB(cap0_metaBram_memory_1$WEB),
						     .ENA(cap0_metaBram_memory_1$ENA),
						     .ENB(cap0_metaBram_memory_1$ENB),
						     .DOA(cap0_metaBram_memory_1$DOA),
						     .DOB(cap0_metaBram_memory_1$DOB));
  // submodule cap0_metaBram_memory_2
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd10),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(11'd1024)) cap0_metaBram_memory_2(.CLKA(pciw_pci0_pcie_ep$user_clk_out),
						     .CLKB(pciw_pci0_pcie_ep$user_clk_out),
						     .ADDRA(cap0_metaBram_memory_2$ADDRA),
						     .ADDRB(cap0_metaBram_memory_2$ADDRB),
						     .DIA(cap0_metaBram_memory_2$DIA),
						     .DIB(cap0_metaBram_memory_2$DIB),
						     .WEA(cap0_metaBram_memory_2$WEA),
						     .WEB(cap0_metaBram_memory_2$WEB),
						     .ENA(cap0_metaBram_memory_2$ENA),
						     .ENB(cap0_metaBram_memory_2$ENB),
						     .DOA(cap0_metaBram_memory_2$DOA),
						     .DOB(cap0_metaBram_memory_2$DOB));
  // submodule cap0_metaBram_memory_3
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd10),
	  .DATA_WIDTH(32'd32),
	  .MEMSIZE(11'd1024)) cap0_metaBram_memory_3(.CLKA(pciw_pci0_pcie_ep$user_clk_out),
						     .CLKB(pciw_pci0_pcie_ep$user_clk_out),
						     .ADDRA(cap0_metaBram_memory_3$ADDRA),
						     .ADDRB(cap0_metaBram_memory_3$ADDRB),
						     .DIA(cap0_metaBram_memory_3$DIA),
						     .DIB(cap0_metaBram_memory_3$DIB),
						     .WEA(cap0_metaBram_memory_3$WEA),
						     .WEB(cap0_metaBram_memory_3$WEB),
						     .ENA(cap0_metaBram_memory_3$ENA),
						     .ENB(cap0_metaBram_memory_3$ENB),
						     .DOA(cap0_metaBram_memory_3$DOA),
						     .DOB(cap0_metaBram_memory_3$DOB));
  // submodule cap0_metaBram_serverAdapterA_1_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) cap0_metaBram_serverAdapterA_1_outDataCore(.RST(ctop$RST_N_wci_m_3),
									  .CLK(pciw_pci0_pcie_ep$user_clk_out),
									  .D_IN(cap0_metaBram_serverAdapterA_1_outDataCore$D_IN),
									  .ENQ(cap0_metaBram_serverAdapterA_1_outDataCore$ENQ),
									  .DEQ(cap0_metaBram_serverAdapterA_1_outDataCore$DEQ),
									  .CLR(cap0_metaBram_serverAdapterA_1_outDataCore$CLR),
									  .D_OUT(cap0_metaBram_serverAdapterA_1_outDataCore$D_OUT),
									  .FULL_N(cap0_metaBram_serverAdapterA_1_outDataCore$FULL_N),
									  .EMPTY_N(cap0_metaBram_serverAdapterA_1_outDataCore$EMPTY_N));
  // submodule cap0_metaBram_serverAdapterA_2_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) cap0_metaBram_serverAdapterA_2_outDataCore(.RST(ctop$RST_N_wci_m_3),
									  .CLK(pciw_pci0_pcie_ep$user_clk_out),
									  .D_IN(cap0_metaBram_serverAdapterA_2_outDataCore$D_IN),
									  .ENQ(cap0_metaBram_serverAdapterA_2_outDataCore$ENQ),
									  .DEQ(cap0_metaBram_serverAdapterA_2_outDataCore$DEQ),
									  .CLR(cap0_metaBram_serverAdapterA_2_outDataCore$CLR),
									  .D_OUT(cap0_metaBram_serverAdapterA_2_outDataCore$D_OUT),
									  .FULL_N(cap0_metaBram_serverAdapterA_2_outDataCore$FULL_N),
									  .EMPTY_N(cap0_metaBram_serverAdapterA_2_outDataCore$EMPTY_N));
  // submodule cap0_metaBram_serverAdapterA_3_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) cap0_metaBram_serverAdapterA_3_outDataCore(.RST(ctop$RST_N_wci_m_3),
									  .CLK(pciw_pci0_pcie_ep$user_clk_out),
									  .D_IN(cap0_metaBram_serverAdapterA_3_outDataCore$D_IN),
									  .ENQ(cap0_metaBram_serverAdapterA_3_outDataCore$ENQ),
									  .DEQ(cap0_metaBram_serverAdapterA_3_outDataCore$DEQ),
									  .CLR(cap0_metaBram_serverAdapterA_3_outDataCore$CLR),
									  .D_OUT(cap0_metaBram_serverAdapterA_3_outDataCore$D_OUT),
									  .FULL_N(cap0_metaBram_serverAdapterA_3_outDataCore$FULL_N),
									  .EMPTY_N(cap0_metaBram_serverAdapterA_3_outDataCore$EMPTY_N));
  // submodule cap0_metaBram_serverAdapterA_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) cap0_metaBram_serverAdapterA_outDataCore(.RST(ctop$RST_N_wci_m_3),
									.CLK(pciw_pci0_pcie_ep$user_clk_out),
									.D_IN(cap0_metaBram_serverAdapterA_outDataCore$D_IN),
									.ENQ(cap0_metaBram_serverAdapterA_outDataCore$ENQ),
									.DEQ(cap0_metaBram_serverAdapterA_outDataCore$DEQ),
									.CLR(cap0_metaBram_serverAdapterA_outDataCore$CLR),
									.D_OUT(cap0_metaBram_serverAdapterA_outDataCore$D_OUT),
									.FULL_N(cap0_metaBram_serverAdapterA_outDataCore$FULL_N),
									.EMPTY_N(cap0_metaBram_serverAdapterA_outDataCore$EMPTY_N));
  // submodule cap0_metaBram_serverAdapterB_1_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) cap0_metaBram_serverAdapterB_1_outDataCore(.RST(ctop$RST_N_wci_m_3),
									  .CLK(pciw_pci0_pcie_ep$user_clk_out),
									  .D_IN(cap0_metaBram_serverAdapterB_1_outDataCore$D_IN),
									  .ENQ(cap0_metaBram_serverAdapterB_1_outDataCore$ENQ),
									  .DEQ(cap0_metaBram_serverAdapterB_1_outDataCore$DEQ),
									  .CLR(cap0_metaBram_serverAdapterB_1_outDataCore$CLR),
									  .D_OUT(cap0_metaBram_serverAdapterB_1_outDataCore$D_OUT),
									  .FULL_N(cap0_metaBram_serverAdapterB_1_outDataCore$FULL_N),
									  .EMPTY_N(cap0_metaBram_serverAdapterB_1_outDataCore$EMPTY_N));
  // submodule cap0_metaBram_serverAdapterB_2_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) cap0_metaBram_serverAdapterB_2_outDataCore(.RST(ctop$RST_N_wci_m_3),
									  .CLK(pciw_pci0_pcie_ep$user_clk_out),
									  .D_IN(cap0_metaBram_serverAdapterB_2_outDataCore$D_IN),
									  .ENQ(cap0_metaBram_serverAdapterB_2_outDataCore$ENQ),
									  .DEQ(cap0_metaBram_serverAdapterB_2_outDataCore$DEQ),
									  .CLR(cap0_metaBram_serverAdapterB_2_outDataCore$CLR),
									  .D_OUT(cap0_metaBram_serverAdapterB_2_outDataCore$D_OUT),
									  .FULL_N(cap0_metaBram_serverAdapterB_2_outDataCore$FULL_N),
									  .EMPTY_N(cap0_metaBram_serverAdapterB_2_outDataCore$EMPTY_N));
  // submodule cap0_metaBram_serverAdapterB_3_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) cap0_metaBram_serverAdapterB_3_outDataCore(.RST(ctop$RST_N_wci_m_3),
									  .CLK(pciw_pci0_pcie_ep$user_clk_out),
									  .D_IN(cap0_metaBram_serverAdapterB_3_outDataCore$D_IN),
									  .ENQ(cap0_metaBram_serverAdapterB_3_outDataCore$ENQ),
									  .DEQ(cap0_metaBram_serverAdapterB_3_outDataCore$DEQ),
									  .CLR(cap0_metaBram_serverAdapterB_3_outDataCore$CLR),
									  .D_OUT(cap0_metaBram_serverAdapterB_3_outDataCore$D_OUT),
									  .FULL_N(cap0_metaBram_serverAdapterB_3_outDataCore$FULL_N),
									  .EMPTY_N(cap0_metaBram_serverAdapterB_3_outDataCore$EMPTY_N));
  // submodule cap0_metaBram_serverAdapterB_outDataCore
  SizedFIFO #(.p1width(32'd32),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) cap0_metaBram_serverAdapterB_outDataCore(.RST(ctop$RST_N_wci_m_3),
									.CLK(pciw_pci0_pcie_ep$user_clk_out),
									.D_IN(cap0_metaBram_serverAdapterB_outDataCore$D_IN),
									.ENQ(cap0_metaBram_serverAdapterB_outDataCore$ENQ),
									.DEQ(cap0_metaBram_serverAdapterB_outDataCore$DEQ),
									.CLR(cap0_metaBram_serverAdapterB_outDataCore$CLR),
									.D_OUT(cap0_metaBram_serverAdapterB_outDataCore$D_OUT),
									.FULL_N(cap0_metaBram_serverAdapterB_outDataCore$FULL_N),
									.EMPTY_N(cap0_metaBram_serverAdapterB_outDataCore$EMPTY_N));
  // submodule cap0_splaF
  FIFO2 #(.width(32'd3), .guarded(32'd1)) cap0_splaF(.RST(ctop$RST_N_wci_m_3),
						     .CLK(pciw_pci0_pcie_ep$user_clk_out),
						     .D_IN(cap0_splaF$D_IN),
						     .ENQ(cap0_splaF$ENQ),
						     .DEQ(cap0_splaF$DEQ),
						     .CLR(cap0_splaF$CLR),
						     .D_OUT(cap0_splaF$D_OUT),
						     .FULL_N(cap0_splaF$FULL_N),
						     .EMPTY_N(cap0_splaF$EMPTY_N));
  // submodule cap0_wci_wslv_reqF
  SizedFIFO #(.p1width(32'd72),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) cap0_wci_wslv_reqF(.RST(ctop$RST_N_wci_m_3),
						  .CLK(pciw_pci0_pcie_ep$user_clk_out),
						  .D_IN(cap0_wci_wslv_reqF$D_IN),
						  .ENQ(cap0_wci_wslv_reqF$ENQ),
						  .DEQ(cap0_wci_wslv_reqF$DEQ),
						  .CLR(cap0_wci_wslv_reqF$CLR),
						  .D_OUT(cap0_wci_wslv_reqF$D_OUT),
						  .FULL_N(),
						  .EMPTY_N(cap0_wci_wslv_reqF$EMPTY_N));
  // submodule cap0_wsiS_reqFifo
  SizedFIFO #(.p1width(32'd61),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) cap0_wsiS_reqFifo(.RST(ctop$RST_N_wci_m_3),
						 .CLK(pciw_pci0_pcie_ep$user_clk_out),
						 .D_IN(cap0_wsiS_reqFifo$D_IN),
						 .ENQ(cap0_wsiS_reqFifo$ENQ),
						 .DEQ(cap0_wsiS_reqFifo$DEQ),
						 .CLR(cap0_wsiS_reqFifo$CLR),
						 .D_OUT(cap0_wsiS_reqFifo$D_OUT),
						 .FULL_N(cap0_wsiS_reqFifo$FULL_N),
						 .EMPTY_N(cap0_wsiS_reqFifo$EMPTY_N));
  // submodule ctop
  mkCTop4B ctop(.pciDevice(pciDevice),
		.CLK_sys0_clk(sys0_clk$O),
		.RST_N_sys0_rst(sys0_rst$OUT_RST),
		.CLK(pciw_pci0_pcie_ep$user_clk_out),
		.RST_N(pciw_p125rst$OUT_RST),
		.cpServer_request_put(ctop$cpServer_request_put),
		.gps_ppsSyncIn_x(ctop$gps_ppsSyncIn_x),
		.server_request_put(ctop$server_request_put),
		.switch_x(ctop$switch_x),
		.wci_m_0_SData(ctop$wci_m_0_SData),
		.wci_m_0_SFlag(ctop$wci_m_0_SFlag),
		.wci_m_0_SResp(ctop$wci_m_0_SResp),
		.wci_m_1_SData(ctop$wci_m_1_SData),
		.wci_m_1_SFlag(ctop$wci_m_1_SFlag),
		.wci_m_1_SResp(ctop$wci_m_1_SResp),
		.wci_m_2_SData(ctop$wci_m_2_SData),
		.wci_m_2_SFlag(ctop$wci_m_2_SFlag),
		.wci_m_2_SResp(ctop$wci_m_2_SResp),
		.wci_m_3_SData(ctop$wci_m_3_SData),
		.wci_m_3_SFlag(ctop$wci_m_3_SFlag),
		.wci_m_3_SResp(ctop$wci_m_3_SResp),
		.wci_m_4_SData(ctop$wci_m_4_SData),
		.wci_m_4_SFlag(ctop$wci_m_4_SFlag),
		.wci_m_4_SResp(ctop$wci_m_4_SResp),
		.wmemiM0_SData(ctop$wmemiM0_SData),
		.wmemiM0_SResp(ctop$wmemiM0_SResp),
		.wsi_s_adc_MBurstLength(ctop$wsi_s_adc_MBurstLength),
		.wsi_s_adc_MByteEn(ctop$wsi_s_adc_MByteEn),
		.wsi_s_adc_MCmd(ctop$wsi_s_adc_MCmd),
		.wsi_s_adc_MData(ctop$wsi_s_adc_MData),
		.wsi_s_adc_MReqInfo(ctop$wsi_s_adc_MReqInfo),
		.EN_server_request_put(ctop$EN_server_request_put),
		.EN_server_response_get(ctop$EN_server_response_get),
		.EN_cpServer_request_put(ctop$EN_cpServer_request_put),
		.EN_cpServer_response_get(ctop$EN_cpServer_response_get),
		.wci_m_0_SThreadBusy(ctop$wci_m_0_SThreadBusy),
		.wci_m_1_SThreadBusy(ctop$wci_m_1_SThreadBusy),
		.wci_m_2_SThreadBusy(ctop$wci_m_2_SThreadBusy),
		.wci_m_3_SThreadBusy(ctop$wci_m_3_SThreadBusy),
		.wci_m_4_SThreadBusy(ctop$wci_m_4_SThreadBusy),
		.wsi_s_adc_MReqLast(ctop$wsi_s_adc_MReqLast),
		.wsi_s_adc_MBurstPrecise(ctop$wsi_s_adc_MBurstPrecise),
		.wsi_s_adc_MReset_n(ctop$wsi_s_adc_MReset_n),
		.wsi_m_dac_SThreadBusy(ctop$wsi_m_dac_SThreadBusy),
		.wsi_m_dac_SReset_n(ctop$wsi_m_dac_SReset_n),
		.wmemiM0_SRespLast(ctop$wmemiM0_SRespLast),
		.wmemiM0_SCmdAccept(ctop$wmemiM0_SCmdAccept),
		.wmemiM0_SDataAccept(ctop$wmemiM0_SDataAccept),
		.RDY_server_request_put(ctop$RDY_server_request_put),
		.server_response_get(ctop$server_response_get),
		.RDY_server_response_get(ctop$RDY_server_response_get),
		.RDY_cpServer_request_put(),
		.cpServer_response_get(),
		.RDY_cpServer_response_get(),
		.led(ctop$led),
		.wci_m_0_MCmd(),
		.wci_m_0_MAddrSpace(),
		.wci_m_0_MByteEn(),
		.wci_m_0_MAddr(),
		.wci_m_0_MData(),
		.wci_m_0_MFlag(),
		.wci_m_1_MCmd(),
		.wci_m_1_MAddrSpace(),
		.wci_m_1_MByteEn(),
		.wci_m_1_MAddr(),
		.wci_m_1_MData(),
		.wci_m_1_MFlag(),
		.wci_m_2_MCmd(ctop$wci_m_2_MCmd),
		.wci_m_2_MAddrSpace(ctop$wci_m_2_MAddrSpace),
		.wci_m_2_MByteEn(ctop$wci_m_2_MByteEn),
		.wci_m_2_MAddr(ctop$wci_m_2_MAddr),
		.wci_m_2_MData(ctop$wci_m_2_MData),
		.wci_m_2_MFlag(ctop$wci_m_2_MFlag),
		.wci_m_3_MCmd(ctop$wci_m_3_MCmd),
		.wci_m_3_MAddrSpace(ctop$wci_m_3_MAddrSpace),
		.wci_m_3_MByteEn(ctop$wci_m_3_MByteEn),
		.wci_m_3_MAddr(ctop$wci_m_3_MAddr),
		.wci_m_3_MData(ctop$wci_m_3_MData),
		.wci_m_3_MFlag(),
		.wci_m_4_MCmd(),
		.wci_m_4_MAddrSpace(),
		.wci_m_4_MByteEn(),
		.wci_m_4_MAddr(),
		.wci_m_4_MData(),
		.wci_m_4_MFlag(),
		.cpNow(),
		.RDY_cpNow(),
		.wsi_s_adc_SThreadBusy(),
		.wsi_s_adc_SReset_n(),
		.wsi_m_dac_MCmd(),
		.wsi_m_dac_MReqLast(),
		.wsi_m_dac_MBurstPrecise(),
		.wsi_m_dac_MBurstLength(),
		.wsi_m_dac_MData(),
		.wsi_m_dac_MByteEn(),
		.wsi_m_dac_MReqInfo(),
		.wsi_m_dac_MReset_n(),
		.wmemiM0_MCmd(),
		.wmemiM0_MReqLast(),
		.wmemiM0_MAddr(),
		.wmemiM0_MBurstLength(),
		.wmemiM0_MDataValid(),
		.wmemiM0_MDataLast(),
		.wmemiM0_MData(),
		.wmemiM0_MDataByteEn(),
		.wmemiM0_MReset_n(),
		.gps_ppsSyncOut(),
		.RST_N_wci_m_0(),
		.RST_N_wci_m_1(),
		.RST_N_wci_m_2(ctop$RST_N_wci_m_2),
		.RST_N_wci_m_3(ctop$RST_N_wci_m_3),
		.RST_N_wci_m_4());
  // submodule gbe0
  mkGbeWorker #(.hasDebugLogic(1'd1)) gbe0(.CLK_gmii_rx_clk(gmii_rx_clk),
					   .CLK_sys1_clk(sys1_clk$O),
					   .RST_N_sys1_rst(sys1_rst$OUT_RST),
					   .wciS0_Clk(pciw_pci0_pcie_ep$user_clk_out),
					   .wciS0_MReset_n(ctop$RST_N_wci_m_2),
					   .cpClient_response_put(gbe0$cpClient_response_put),
					   .gmii_col_i(gbe0$gmii_col_i),
					   .gmii_crs_i(gbe0$gmii_crs_i),
					   .gmii_intr_i(gbe0$gmii_intr_i),
					   .gmii_rx_rx_dv_i(gbe0$gmii_rx_rx_dv_i),
					   .gmii_rx_rx_er_i(gbe0$gmii_rx_rx_er_i),
					   .gmii_rx_rxd_i(gbe0$gmii_rx_rxd_i),
					   .wciS0_MAddr(gbe0$wciS0_MAddr),
					   .wciS0_MAddrSpace(gbe0$wciS0_MAddrSpace),
					   .wciS0_MByteEn(gbe0$wciS0_MByteEn),
					   .wciS0_MCmd(gbe0$wciS0_MCmd),
					   .wciS0_MData(gbe0$wciS0_MData),
					   .wciS0_MFlag(gbe0$wciS0_MFlag),
					   .wsiS0_MBurstLength(gbe0$wsiS0_MBurstLength),
					   .wsiS0_MByteEn(gbe0$wsiS0_MByteEn),
					   .wsiS0_MCmd(gbe0$wsiS0_MCmd),
					   .wsiS0_MData(gbe0$wsiS0_MData),
					   .wsiS0_MReqInfo(gbe0$wsiS0_MReqInfo),
					   .wtiS0_req(gbe0$wtiS0_req),
					   .wsiM0_SThreadBusy(gbe0$wsiM0_SThreadBusy),
					   .wsiM0_SReset_n(gbe0$wsiM0_SReset_n),
					   .wsiS0_MReqLast(gbe0$wsiS0_MReqLast),
					   .wsiS0_MBurstPrecise(gbe0$wsiS0_MBurstPrecise),
					   .wsiS0_MReset_n(gbe0$wsiS0_MReset_n),
					   .EN_cpClient_request_get(gbe0$EN_cpClient_request_get),
					   .EN_cpClient_response_put(gbe0$EN_cpClient_response_put),
					   .wciS0_SResp(gbe0$wciS0_SResp),
					   .wciS0_SData(gbe0$wciS0_SData),
					   .wciS0_SThreadBusy(gbe0$wciS0_SThreadBusy),
					   .wciS0_SFlag(gbe0$wciS0_SFlag),
					   .wtiS0_SThreadBusy(),
					   .wtiS0_SReset_n(),
					   .wsiM0_MCmd(gbe0$wsiM0_MCmd),
					   .wsiM0_MReqLast(gbe0$wsiM0_MReqLast),
					   .wsiM0_MBurstPrecise(gbe0$wsiM0_MBurstPrecise),
					   .wsiM0_MBurstLength(gbe0$wsiM0_MBurstLength),
					   .wsiM0_MData(gbe0$wsiM0_MData),
					   .wsiM0_MByteEn(gbe0$wsiM0_MByteEn),
					   .wsiM0_MReqInfo(gbe0$wsiM0_MReqInfo),
					   .wsiM0_MReset_n(gbe0$wsiM0_MReset_n),
					   .wsiS0_SThreadBusy(),
					   .wsiS0_SReset_n(),
					   .cpClient_request_get(),
					   .RDY_cpClient_request_get(),
					   .RDY_cpClient_response_put(),
					   .gmii_tx_txd(gbe0$gmii_tx_txd),
					   .gmii_tx_tx_en(gbe0$gmii_tx_tx_en),
					   .gmii_tx_tx_er(gbe0$gmii_tx_tx_er),
					   .gmii_led(gbe0$gmii_led),
					   .CLK_gmii_tx_tx_clk(gbe0$CLK_gmii_tx_tx_clk),
					   .CLK_GATE_gmii_tx_tx_clk(),
					   .CLK_rxclkBnd(gbe0$CLK_rxclkBnd),
					   .CLK_GATE_rxclkBnd(),
					   .RST_N_gmii_rstn(gbe0$RST_N_gmii_rstn),
					   .mdio_mdd(mdio_mdd),
					   .mdio_mdc(mdio_mdc));
  // submodule idc
  IDELAYCTRL idc(.REFCLK(sys0_clk$O), .RST(idc_resetP$RESET_OUT), .RDY());
  // submodule idc_resetP
  ResetInverter idc_resetP(.RESET_IN(sys0_rst$OUT_RST),
			   .RESET_OUT(idc_resetP$RESET_OUT));
  // submodule lcd_ctrl
  mkLCDController lcd_ctrl(.CLK(sys0_clk$O),
			   .RST_N(sys0_rst$OUT_RST),
			   .setLine1_text(lcd_ctrl$setLine1_text),
			   .setLine2_text(lcd_ctrl$setLine2_text),
			   .EN_setLine1(lcd_ctrl$EN_setLine1),
			   .EN_setLine2(lcd_ctrl$EN_setLine2),
			   .db(lcd_ctrl$db),
			   .e(lcd_ctrl$e),
			   .rs(lcd_ctrl$rs),
			   .rw(lcd_ctrl$rw));
  // submodule pciw_fI2P
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_fI2P(.RST(pciw_p125rst$OUT_RST),
				     .CLK(pciw_pci0_pcie_ep$user_clk_out),
				     .D_IN(pciw_fI2P$D_IN),
				     .ENQ(pciw_fI2P$ENQ),
				     .DEQ(pciw_fI2P$DEQ),
				     .CLR(pciw_fI2P$CLR),
				     .D_OUT(pciw_fI2P$D_OUT),
				     .FULL_N(pciw_fI2P$FULL_N),
				     .EMPTY_N(pciw_fI2P$EMPTY_N));
  // submodule pciw_fP2I
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_fP2I(.RST(pciw_p125rst$OUT_RST),
				     .CLK(pciw_pci0_pcie_ep$user_clk_out),
				     .D_IN(pciw_fP2I$D_IN),
				     .ENQ(pciw_fP2I$ENQ),
				     .DEQ(pciw_fP2I$DEQ),
				     .CLR(pciw_fP2I$CLR),
				     .D_OUT(pciw_fP2I$D_OUT),
				     .FULL_N(pciw_fP2I$FULL_N),
				     .EMPTY_N(pciw_fP2I$EMPTY_N));
  // submodule pciw_p125rst
  SyncResetA #(.RSTDELAY(32'd0)) pciw_p125rst(.CLK(pciw_pci0_pcie_ep$user_clk_out),
					      .IN_RST(pciw_pci0_usr_rst_n$RESET_OUT),
					      .OUT_RST(pciw_p125rst$OUT_RST));
  // submodule pciw_pci0_axiRst125
  SyncResetA #(.RSTDELAY(32'd1)) pciw_pci0_axiRst125(.CLK(pciw_pci0_pcie_ep$user_clk_out),
						     .IN_RST(pciw_pci0_usr_rst_n$RESET_OUT),
						     .OUT_RST(pciw_pci0_axiRst125$OUT_RST));
  // submodule pciw_pci0_clk
  IBUFDS_GTE2 pciw_pci0_clk(.I(pci0_clkp),
			    .IB(pci0_clkn),
			    .CEB(1'd0),
			    .O(pciw_pci0_clk$O),
			    .ODIV2());
  // submodule pciw_pci0_pcie_ep
  pcie_7x_v1_3 #(.PL_FAST_TRAIN("FALSE")) pciw_pci0_pcie_ep(.sys_clk(pciw_pci0_clk$O),
							    .sys_reset(pciw_pci0_pcie_ep_reset$RESET_OUT),
							    .PIPE_DCLK_IN(pciw_pci0_pcie_ep$PIPE_DCLK_IN),
							    .PIPE_MMCM_LOCK_IN(pciw_pci0_pcie_ep$PIPE_MMCM_LOCK_IN),
							    .PIPE_OOBCLK_IN(pciw_pci0_pcie_ep$PIPE_OOBCLK_IN),
							    .PIPE_PCLK_IN(pciw_pci0_pcie_ep$PIPE_PCLK_IN),
							    .PIPE_RXOUTCLK_IN(pciw_pci0_pcie_ep$PIPE_RXOUTCLK_IN),
							    .PIPE_RXUSRCLK_IN(pciw_pci0_pcie_ep$PIPE_RXUSRCLK_IN),
							    .PIPE_USERCLK1_IN(pciw_pci0_pcie_ep$PIPE_USERCLK1_IN),
							    .PIPE_USERCLK2_IN(pciw_pci0_pcie_ep$PIPE_USERCLK2_IN),
							    .cfg_dsn(pciw_pci0_pcie_ep$cfg_dsn),
							    .cfg_err_acs(pciw_pci0_pcie_ep$cfg_err_acs),
							    .cfg_err_aer_headerlog(pciw_pci0_pcie_ep$cfg_err_aer_headerlog),
							    .cfg_err_atomic_egress_blocked(pciw_pci0_pcie_ep$cfg_err_atomic_egress_blocked),
							    .cfg_err_cor(pciw_pci0_pcie_ep$cfg_err_cor),
							    .cfg_err_cpl_abort(pciw_pci0_pcie_ep$cfg_err_cpl_abort),
							    .cfg_err_cpl_timeout(pciw_pci0_pcie_ep$cfg_err_cpl_timeout),
							    .cfg_err_cpl_unexpect(pciw_pci0_pcie_ep$cfg_err_cpl_unexpect),
							    .cfg_err_ecrc(pciw_pci0_pcie_ep$cfg_err_ecrc),
							    .cfg_err_internal_cor(pciw_pci0_pcie_ep$cfg_err_internal_cor),
							    .cfg_err_internal_uncor(pciw_pci0_pcie_ep$cfg_err_internal_uncor),
							    .cfg_err_locked(pciw_pci0_pcie_ep$cfg_err_locked),
							    .cfg_err_malformed(pciw_pci0_pcie_ep$cfg_err_malformed),
							    .cfg_err_mc_blocked(pciw_pci0_pcie_ep$cfg_err_mc_blocked),
							    .cfg_err_norecovery(pciw_pci0_pcie_ep$cfg_err_norecovery),
							    .cfg_err_poisoned(pciw_pci0_pcie_ep$cfg_err_poisoned),
							    .cfg_err_posted(pciw_pci0_pcie_ep$cfg_err_posted),
							    .cfg_err_tlp_cpl_header(pciw_pci0_pcie_ep$cfg_err_tlp_cpl_header),
							    .cfg_err_ur(pciw_pci0_pcie_ep$cfg_err_ur),
							    .cfg_interrupt(pciw_pci0_pcie_ep$cfg_interrupt),
							    .cfg_interrupt_assert(pciw_pci0_pcie_ep$cfg_interrupt_assert),
							    .cfg_interrupt_di(pciw_pci0_pcie_ep$cfg_interrupt_di),
							    .cfg_interrupt_stat(pciw_pci0_pcie_ep$cfg_interrupt_stat),
							    .cfg_mgmt_byte_en(pciw_pci0_pcie_ep$cfg_mgmt_byte_en),
							    .cfg_mgmt_di(pciw_pci0_pcie_ep$cfg_mgmt_di),
							    .cfg_mgmt_dwaddr(pciw_pci0_pcie_ep$cfg_mgmt_dwaddr),
							    .cfg_mgmt_rd_en(pciw_pci0_pcie_ep$cfg_mgmt_rd_en),
							    .cfg_mgmt_wr_en(pciw_pci0_pcie_ep$cfg_mgmt_wr_en),
							    .cfg_mgmt_wr_readonly(pciw_pci0_pcie_ep$cfg_mgmt_wr_readonly),
							    .cfg_pciecap_interrupt_msgnum(pciw_pci0_pcie_ep$cfg_pciecap_interrupt_msgnum),
							    .cfg_pm_force_state(pciw_pci0_pcie_ep$cfg_pm_force_state),
							    .cfg_pm_force_state_en(pciw_pci0_pcie_ep$cfg_pm_force_state_en),
							    .cfg_pm_halt_aspm_l0s(pciw_pci0_pcie_ep$cfg_pm_halt_aspm_l0s),
							    .cfg_pm_halt_aspm_l1(pciw_pci0_pcie_ep$cfg_pm_halt_aspm_l1),
							    .cfg_pm_wake(pciw_pci0_pcie_ep$cfg_pm_wake),
							    .cfg_trn_pending(pciw_pci0_pcie_ep$cfg_trn_pending),
							    .cfg_turnoff_ok(pciw_pci0_pcie_ep$cfg_turnoff_ok),
							    .fc_sel(pciw_pci0_pcie_ep$fc_sel),
							    .m_axis_rx_tready(pciw_pci0_pcie_ep$m_axis_rx_tready),
							    .pci_exp_rxn(pciw_pci0_pcie_ep$pci_exp_rxn),
							    .pci_exp_rxp(pciw_pci0_pcie_ep$pci_exp_rxp),
							    .pl_directed_link_auton(pciw_pci0_pcie_ep$pl_directed_link_auton),
							    .pl_directed_link_change(pciw_pci0_pcie_ep$pl_directed_link_change),
							    .pl_directed_link_speed(pciw_pci0_pcie_ep$pl_directed_link_speed),
							    .pl_directed_link_width(pciw_pci0_pcie_ep$pl_directed_link_width),
							    .pl_upstream_prefer_deemph(pciw_pci0_pcie_ep$pl_upstream_prefer_deemph),
							    .rx_np_ok(pciw_pci0_pcie_ep$rx_np_ok),
							    .rx_np_req(pciw_pci0_pcie_ep$rx_np_req),
							    .s_axis_tx_tdata(pciw_pci0_pcie_ep$s_axis_tx_tdata),
							    .s_axis_tx_tkeep(pciw_pci0_pcie_ep$s_axis_tx_tkeep),
							    .s_axis_tx_tlast(pciw_pci0_pcie_ep$s_axis_tx_tlast),
							    .s_axis_tx_tuser(pciw_pci0_pcie_ep$s_axis_tx_tuser),
							    .s_axis_tx_tvalid(pciw_pci0_pcie_ep$s_axis_tx_tvalid),
							    .tx_cfg_gnt(pciw_pci0_pcie_ep$tx_cfg_gnt),
							    .pci_exp_txp(pciw_pci0_pcie_ep$pci_exp_txp),
							    .pci_exp_txn(pciw_pci0_pcie_ep$pci_exp_txn),
							    .cfg_mgmt_do(),
							    .cfg_mgmt_rd_wr_done(),
							    .cfg_to_turnoff(),
							    .cfg_bus_number(pciw_pci0_pcie_ep$cfg_bus_number),
							    .cfg_device_number(pciw_pci0_pcie_ep$cfg_device_number),
							    .cfg_function_number(pciw_pci0_pcie_ep$cfg_function_number),
							    .cfg_interrupt_rdy(),
							    .cfg_interrupt_do(),
							    .cfg_interrupt_mmenable(),
							    .cfg_interrupt_msienable(),
							    .cfg_interrupt_msixenable(),
							    .cfg_interrupt_msixfm(),
							    .pl_initial_link_width(),
							    .pl_lane_reversal_mode(),
							    .pl_link_gen2_cap(),
							    .pl_link_partner_gen2_supported(),
							    .pl_link_upcfg_cap(),
							    .pl_sel_lnk_rate(),
							    .pl_sel_lnk_width(),
							    .pl_ltssm_state(),
							    .pl_received_hot_rst(),
							    .user_lnk_up(pciw_pci0_pcie_ep$user_lnk_up),
							    .tx_buf_av(),
							    .tx_err_drop(),
							    .tx_cfg_req(),
							    .s_axis_tx_tready(pciw_pci0_pcie_ep$s_axis_tx_tready),
							    .m_axis_rx_tdata(pciw_pci0_pcie_ep$m_axis_rx_tdata),
							    .m_axis_rx_tkeep(),
							    .m_axis_rx_tlast(),
							    .m_axis_rx_tvalid(pciw_pci0_pcie_ep$m_axis_rx_tvalid),
							    .m_axis_rx_tuser(pciw_pci0_pcie_ep$m_axis_rx_tuser),
							    .fc_cpld(),
							    .fc_cplh(),
							    .fc_npd(),
							    .fc_nph(),
							    .fc_pd(),
							    .fc_ph(),
							    .cfg_status(),
							    .cfg_command(),
							    .cfg_dstatus(),
							    .cfg_dcommand(),
							    .cfg_lstatus(),
							    .cfg_lcommand(),
							    .cfg_dcommand2(),
							    .cfg_pcie_link_state(),
							    .cfg_pmcsr_pme_en(),
							    .cfg_pmcsr_powerstate(),
							    .cfg_pmcsr_pme_status(),
							    .cfg_received_func_lvl_rst(),
							    .cfg_err_cpl_rdy(),
							    .cfg_err_aer_headerlog_set(),
							    .PIPE_TXOUTCLK_OUT(),
							    .PIPE_RXOUTCLK_OUT(),
							    .PIPE_PCLK_SEL_OUT(),
							    .PIPE_GEN3_OUT(),
							    .user_clk_out(pciw_pci0_pcie_ep$user_clk_out),
							    .user_reset_out(pciw_pci0_pcie_ep$user_reset_out));
  // submodule pciw_pci0_pcie_ep_reset
  ResetInverter pciw_pci0_pcie_ep_reset(.RESET_IN(pci0_rstn),
					.RESET_OUT(pciw_pci0_pcie_ep_reset$RESET_OUT));
  // submodule pciw_pci0_rxF
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_pci0_rxF(.RST(pciw_pci0_axiRst125$OUT_RST),
					 .CLK(pciw_pci0_pcie_ep$user_clk_out),
					 .D_IN(pciw_pci0_rxF$D_IN),
					 .ENQ(pciw_pci0_rxF$ENQ),
					 .DEQ(pciw_pci0_rxF$DEQ),
					 .CLR(pciw_pci0_rxF$CLR),
					 .D_OUT(pciw_pci0_rxF$D_OUT),
					 .FULL_N(pciw_pci0_rxF$FULL_N),
					 .EMPTY_N(pciw_pci0_rxF$EMPTY_N));
  // submodule pciw_pci0_txF
  FIFO2 #(.width(32'd153),
	  .guarded(32'd1)) pciw_pci0_txF(.RST(pciw_pci0_axiRst125$OUT_RST),
					 .CLK(pciw_pci0_pcie_ep$user_clk_out),
					 .D_IN(pciw_pci0_txF$D_IN),
					 .ENQ(pciw_pci0_txF$ENQ),
					 .DEQ(pciw_pci0_txF$DEQ),
					 .CLR(pciw_pci0_txF$CLR),
					 .D_OUT(pciw_pci0_txF$D_OUT),
					 .FULL_N(pciw_pci0_txF$FULL_N),
					 .EMPTY_N(pciw_pci0_txF$EMPTY_N));
  // submodule pciw_pci0_usr_rst_n
  ResetInverter pciw_pci0_usr_rst_n(.RESET_IN(pciw_pci0_pcie_ep$user_reset_out),
				    .RESET_OUT(pciw_pci0_usr_rst_n$RESET_OUT));
  // submodule sys0_clk
  IBUFDS sys0_clk(.I(sys0_clkp), .IB(sys0_clkn), .O(sys0_clk$O));
  // submodule sys0_rst
  SyncResetA #(.RSTDELAY(32'd15)) sys0_rst(.CLK(sys0_clk$O),
					   .IN_RST(sys0_rstn),
					   .OUT_RST(sys0_rst$OUT_RST));
  // submodule sys1_clk
  BUFG sys1_clk(.I(sys1_clki$O), .O(sys1_clk$O));
  // submodule sys1_clki
  IBUFDS_GTE2 sys1_clki(.I(sys1_clkp),
			.IB(sys1_clkn),
			.CEB(1'd0),
			.O(sys1_clki$O),
			.ODIV2());
  // submodule sys1_rst
  SyncResetA #(.RSTDELAY(32'd0)) sys1_rst(.CLK(sys1_clk$O),
					  .IN_RST(pciw_p125rst$OUT_RST),
					  .OUT_RST(sys1_rst$OUT_RST));
  // rule RL_cap0_wci_wslv_ctl_op_start
  assign WILL_FIRE_RL_cap0_wci_wslv_ctl_op_start =
	     cap0_wci_wslv_reqF$EMPTY_N && cap0_wci_wslv_wci_ctrl_pw$whas &&
	     !WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete ;
  // rule RL_cap0_wci_ctrl_EiI
  assign WILL_FIRE_RL_cap0_wci_ctrl_EiI =
	     cap0_wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_cap0_wci_wslv_ctl_op_start &&
	     cap0_wci_wslv_cState == 3'd0 &&
	     cap0_wci_wslv_reqF$D_OUT[36:34] == 3'd0 ;
  // rule RL_cap0_wci_ctrl_IsO
  assign WILL_FIRE_RL_cap0_wci_ctrl_IsO =
	     cap0_wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_cap0_wci_wslv_ctl_op_start &&
	     cap0_wci_wslv_cState == 3'd1 &&
	     cap0_wci_wslv_reqF$D_OUT[36:34] == 3'd1 ;
  // rule RL_cap0_wci_ctrl_OrE
  assign WILL_FIRE_RL_cap0_wci_ctrl_OrE =
	     cap0_wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_cap0_wci_wslv_ctl_op_start &&
	     cap0_wci_wslv_cState == 3'd2 &&
	     cap0_wci_wslv_reqF$D_OUT[36:34] == 3'd3 ;
  // rule RL_cap0_wci_cfrd
  assign CAN_FIRE_RL_cap0_wci_cfrd =
	     cap0_wci_wslv_reqF$EMPTY_N &&
	     IF_cap0_wci_wslv_reqF_first__75_BITS_63_TO_52__ETC___d1128 &&
	     (cap0_wci_wslv_reqF$D_OUT[63:52] == 12'h800 ||
	      cap0_wci_wslv_reqF$D_OUT[63:52] == 12'h400 ||
	      cap0_wci_wslv_respF_c_r != 2'd2) &&
	     cap0_wci_wslv_wci_cfrd_pw$whas ;
  assign WILL_FIRE_RL_cap0_wci_cfrd =
	     CAN_FIRE_RL_cap0_wci_cfrd &&
	     !WILL_FIRE_RL_cap0_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete ;
  // rule RL_cap0_doMessageAccept
  assign WILL_FIRE_RL_cap0_doMessageAccept =
	     cap0_wsiS_reqFifo$EMPTY_N &&
	     NOT_cap0_controlReg_60_BIT_0_61_62_OR_cap0_con_ETC___d986 &&
	     cap0_wci_wslv_cState == 3'd2 ;
  // rule RL_cap0_wci_cfwr
  assign WILL_FIRE_RL_cap0_wci_cfwr =
	     cap0_wci_wslv_respF_c_r != 2'd2 && cap0_wci_wslv_reqF$EMPTY_N &&
	     cap0_wci_wslv_wci_cfwr_pw$whas &&
	     !WILL_FIRE_RL_cap0_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete ;
  // rule RL_cap0_wci_wslv_ctl_op_complete
  assign WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete =
	     cap0_wci_wslv_respF_c_r != 2'd2 && cap0_wci_wslv_ctlOpActive &&
	     cap0_wci_wslv_ctlAckReg ;
  // rule RL_cap0_dataBram_serverAdapterB_stageReadResponseAlways
  assign WILL_FIRE_RL_cap0_dataBram_serverAdapterB_stageReadResponseAlways =
	     WILL_FIRE_RL_cap0_wci_cfrd &&
	     cap0_wci_wslv_reqF$D_OUT[63:52] == 12'h800 ;
  // rule RL_cap0_metaBram_serverAdapterB_stageReadResponseAlways
  assign WILL_FIRE_RL_cap0_metaBram_serverAdapterB_stageReadResponseAlways =
	     WILL_FIRE_RL_cap0_wci_cfrd &&
	     cap0_wci_wslv_reqF$D_OUT[63:52] == 12'h400 &&
	     cap0_wci_wslv_reqF$D_OUT[35:34] == 2'd0 ;
  // rule RL_cap0_metaBram_serverAdapterB_1_stageReadResponseAlways
  assign WILL_FIRE_RL_cap0_metaBram_serverAdapterB_1_stageReadResponseAlways =
	     WILL_FIRE_RL_cap0_wci_cfrd &&
	     cap0_wci_wslv_reqF$D_OUT[63:52] == 12'h400 &&
	     cap0_wci_wslv_reqF$D_OUT[35:34] == 2'd1 ;
  // rule RL_cap0_metaBram_serverAdapterB_2_stageReadResponseAlways
  assign WILL_FIRE_RL_cap0_metaBram_serverAdapterB_2_stageReadResponseAlways =
	     WILL_FIRE_RL_cap0_wci_cfrd &&
	     cap0_wci_wslv_reqF$D_OUT[63:52] == 12'h400 &&
	     cap0_wci_wslv_reqF$D_OUT[35:34] == 2'd2 ;
  // rule RL_cap0_metaBram_serverAdapterB_3_stageReadResponseAlways
  assign WILL_FIRE_RL_cap0_metaBram_serverAdapterB_3_stageReadResponseAlways =
	     WILL_FIRE_RL_cap0_wci_cfrd &&
	     cap0_wci_wslv_reqF$D_OUT[63:52] == 12'h400 &&
	     cap0_wci_wslv_reqF$D_OUT[35:34] == 2'd3 ;
  // rule RL_cap0_advance_split_response
  assign WILL_FIRE_RL_cap0_advance_split_response =
	     cap0_wci_wslv_respF_c_r != 2'd2 &&
	     cap0_splaF_i_notEmpty__026_AND_IF_cap0_splaF_f_ETC___d1059 &&
	     !cap0_wci_wslv_wci_cfwr_pw$whas &&
	     cap0_splitReadInFlight &&
	     !WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete ;
  // rule RL_cap0_wci_wslv_respF_incCtr
  assign WILL_FIRE_RL_cap0_wci_wslv_respF_incCtr =
	     ((cap0_wci_wslv_respF_c_r == 2'd0) ?
		cap0_wci_wslv_respF_x_wire$whas :
		cap0_wci_wslv_respF_c_r != 2'd1 ||
		cap0_wci_wslv_respF_x_wire$whas) &&
	     cap0_wci_wslv_respF_enqueueing$whas &&
	     !(cap0_wci_wslv_respF_c_r != 2'd0) ;
  // rule RL_cap0_wci_wslv_respF_decCtr
  assign WILL_FIRE_RL_cap0_wci_wslv_respF_decCtr =
	     cap0_wci_wslv_respF_c_r != 2'd0 &&
	     !cap0_wci_wslv_respF_enqueueing$whas ;
  // rule RL_cap0_wci_wslv_respF_both
  assign WILL_FIRE_RL_cap0_wci_wslv_respF_both =
	     ((cap0_wci_wslv_respF_c_r == 2'd1) ?
		cap0_wci_wslv_respF_x_wire$whas :
		cap0_wci_wslv_respF_c_r != 2'd2 ||
		cap0_wci_wslv_respF_x_wire$whas) &&
	     cap0_wci_wslv_respF_c_r != 2'd0 &&
	     cap0_wci_wslv_respF_enqueueing$whas ;
  // rule RL_cap0_dataBram_serverAdapterB_outData_enqAndDeq
  assign WILL_FIRE_RL_cap0_dataBram_serverAdapterB_outData_enqAndDeq =
	     cap0_dataBram_serverAdapterB_outDataCore$EMPTY_N &&
	     cap0_dataBram_serverAdapterB_outDataCore$FULL_N &&
	     cap0_dataBram_serverAdapterB_outData_deqCalled$whas &&
	     cap0_dataBram_serverAdapterB_outData_enqData$whas ;
  // rule RL_cap0_metaBram_serverAdapterB_outData_enqAndDeq
  assign WILL_FIRE_RL_cap0_metaBram_serverAdapterB_outData_enqAndDeq =
	     cap0_metaBram_serverAdapterB_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterB_outDataCore$FULL_N &&
	     cap0_metaBram_serverAdapterB_outData_deqCalled$whas &&
	     cap0_metaBram_serverAdapterB_outData_enqData$whas ;
  // rule RL_cap0_metaBram_serverAdapterB_1_outData_enqAndDeq
  assign WILL_FIRE_RL_cap0_metaBram_serverAdapterB_1_outData_enqAndDeq =
	     cap0_metaBram_serverAdapterB_1_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterB_1_outDataCore$FULL_N &&
	     cap0_metaBram_serverAdapterB_1_outData_deqCalled$whas &&
	     cap0_metaBram_serverAdapterB_1_outData_enqData$whas ;
  // rule RL_cap0_metaBram_serverAdapterB_2_outData_enqAndDeq
  assign WILL_FIRE_RL_cap0_metaBram_serverAdapterB_2_outData_enqAndDeq =
	     cap0_metaBram_serverAdapterB_2_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterB_2_outDataCore$FULL_N &&
	     cap0_metaBram_serverAdapterB_2_outData_deqCalled$whas &&
	     cap0_metaBram_serverAdapterB_2_outData_enqData$whas ;
  // rule RL_cap0_metaBram_serverAdapterB_3_outData_enqAndDeq
  assign WILL_FIRE_RL_cap0_metaBram_serverAdapterB_3_outData_enqAndDeq =
	     cap0_metaBram_serverAdapterB_3_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterB_3_outDataCore$FULL_N &&
	     cap0_metaBram_serverAdapterB_3_outData_deqCalled$whas &&
	     cap0_metaBram_serverAdapterB_3_outData_enqData$whas ;
  // rule RL_cap0_wsiS_reqFifo_enq
  assign WILL_FIRE_RL_cap0_wsiS_reqFifo_enq =
	     cap0_wsiS_reqFifo$FULL_N && cap0_wsiS_operateD &&
	     cap0_wsiS_peerIsReady &&
	     cap0_wsiS_wsiReq$wget[60:58] == 3'd1 ;
  // rule RL_cap0_wsiS_reqFifo_reset
  assign WILL_FIRE_RL_cap0_wsiS_reqFifo_reset =
	     WILL_FIRE_RL_cap0_wsiS_reqFifo_enq ||
	     WILL_FIRE_RL_cap0_doMessageAccept ;
  // inputs to muxes for submodule ports
  assign MUX_cap0_controlReg$write_1__SEL_1 =
	     WILL_FIRE_RL_cap0_wci_cfwr &&
	     cap0_wci_wslv_reqF$D_OUT[39:32] == 8'h0 ;
  assign MUX_cap0_dataCount$write_1__SEL_1 =
	     WILL_FIRE_RL_cap0_wci_cfwr &&
	     cap0_wci_wslv_reqF$D_OUT[39:32] == 8'h08 ;
  assign MUX_cap0_dataCount$write_1__SEL_2 =
	     WILL_FIRE_RL_cap0_doMessageAccept &&
	     cap0_controlReg_60_BIT_0_61_AND_NOT_cap0_contr_ETC___d1008 ;
  assign MUX_cap0_metaCount$write_1__SEL_1 =
	     WILL_FIRE_RL_cap0_wci_cfwr &&
	     cap0_wci_wslv_reqF$D_OUT[39:32] == 8'h04 ;
  assign MUX_cap0_metaCount$write_1__SEL_2 =
	     WILL_FIRE_RL_cap0_doMessageAccept &&
	     cap0_controlReg_60_BIT_0_61_AND_NOT_cap0_contr_ETC___d1008 &&
	     cap0_wsiS_reqFifo$D_OUT[57] ;
  assign MUX_cap0_splitReadInFlight$write_1__SEL_1 =
	     WILL_FIRE_RL_cap0_wci_cfrd &&
	     (cap0_wci_wslv_reqF$D_OUT[63:52] == 12'h800 ||
	      cap0_wci_wslv_reqF$D_OUT[63:52] == 12'h400) ;
  assign MUX_cap0_wci_wslv_illegalEdge$write_1__SEL_1 =
	     WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete &&
	     cap0_wci_wslv_illegalEdge ;
  assign MUX_cap0_wci_wslv_illegalEdge$write_1__SEL_2 =
	     WILL_FIRE_RL_cap0_wci_wslv_ctl_op_start &&
	     (cap0_wci_wslv_reqF$D_OUT[36:34] == 3'd0 &&
	      cap0_wci_wslv_cState != 3'd0 ||
	      cap0_wci_wslv_reqF$D_OUT[36:34] == 3'd1 &&
	      cap0_wci_wslv_cState != 3'd1 &&
	      cap0_wci_wslv_cState != 3'd3 ||
	      cap0_wci_wslv_reqF$D_OUT[36:34] == 3'd2 &&
	      cap0_wci_wslv_cState != 3'd2 ||
	      cap0_wci_wslv_reqF$D_OUT[36:34] == 3'd3 &&
	      cap0_wci_wslv_cState != 3'd3 &&
	      cap0_wci_wslv_cState != 3'd2 &&
	      cap0_wci_wslv_cState != 3'd1 ||
	      cap0_wci_wslv_reqF$D_OUT[36:34] == 3'd4 ||
	      cap0_wci_wslv_reqF$D_OUT[36:34] == 3'd5 ||
	      cap0_wci_wslv_reqF$D_OUT[36:34] == 3'd6 ||
	      cap0_wci_wslv_reqF$D_OUT[36:34] == 3'd7) ;
  assign MUX_cap0_wci_wslv_respF_q_0$write_1__SEL_2 =
	     WILL_FIRE_RL_cap0_wci_wslv_respF_incCtr &&
	     cap0_wci_wslv_respF_c_r == 2'd0 ;
  assign MUX_cap0_wci_wslv_respF_q_1$write_1__SEL_2 =
	     WILL_FIRE_RL_cap0_wci_wslv_respF_incCtr &&
	     cap0_wci_wslv_respF_c_r == 2'd1 ;
  assign MUX_cap0_wci_wslv_respF_x_wire$wset_1__SEL_1 =
	     WILL_FIRE_RL_cap0_wci_cfrd &&
	     cap0_wci_wslv_reqF$D_OUT[63:52] != 12'h800 &&
	     cap0_wci_wslv_reqF$D_OUT[63:52] != 12'h400 ;
  assign MUX_cap0_dataCount$write_1__VAL_2 = cap0_dataCount + 32'd1 ;
  assign MUX_cap0_metaCount$write_1__VAL_2 = cap0_metaCount + 32'd1 ;
  assign MUX_cap0_wci_wslv_illegalEdge$write_1__VAL_2 =
	     cap0_wci_wslv_reqF$D_OUT[36:34] != 3'd4 &&
	     cap0_wci_wslv_reqF$D_OUT[36:34] != 3'd5 &&
	     cap0_wci_wslv_reqF$D_OUT[36:34] != 3'd6 ;
  assign MUX_cap0_wci_wslv_respF_c_r$write_1__VAL_1 =
	     cap0_wci_wslv_respF_c_r + 2'd1 ;
  assign MUX_cap0_wci_wslv_respF_c_r$write_1__VAL_2 =
	     cap0_wci_wslv_respF_c_r - 2'd1 ;
  assign MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_1 =
	     (cap0_wci_wslv_respF_c_r == 2'd1) ?
	       MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_2 :
	       cap0_wci_wslv_respF_q_1 ;
  always@(MUX_cap0_wci_wslv_respF_x_wire$wset_1__SEL_1 or
	  MUX_cap0_wci_wslv_respF_x_wire$wset_1__VAL_1 or
	  WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete or
	  MUX_cap0_wci_wslv_respF_x_wire$wset_1__VAL_2 or
	  WILL_FIRE_RL_cap0_advance_split_response or
	  MUX_cap0_wci_wslv_respF_x_wire$wset_1__VAL_3 or
	  WILL_FIRE_RL_cap0_wci_cfwr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_cap0_wci_wslv_respF_x_wire$wset_1__SEL_1:
	  MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_2 =
	      MUX_cap0_wci_wslv_respF_x_wire$wset_1__VAL_1;
      WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete:
	  MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_2 =
	      MUX_cap0_wci_wslv_respF_x_wire$wset_1__VAL_2;
      WILL_FIRE_RL_cap0_advance_split_response:
	  MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_2 =
	      MUX_cap0_wci_wslv_respF_x_wire$wset_1__VAL_3;
      WILL_FIRE_RL_cap0_wci_cfwr:
	  MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_2 = 34'h1C0DE4201;
      default: MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_2 =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign MUX_cap0_wci_wslv_respF_q_1$write_1__VAL_1 =
	     (cap0_wci_wslv_respF_c_r == 2'd2) ?
	       MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_2 :
	       34'h0AAAAAAAA ;
  assign MUX_cap0_wci_wslv_respF_x_wire$wset_1__VAL_1 =
	     { 2'd1, g_data__h39139 } ;
  assign MUX_cap0_wci_wslv_respF_x_wire$wset_1__VAL_2 =
	     cap0_wci_wslv_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_cap0_wci_wslv_respF_x_wire$wset_1__VAL_3 = { 2'd1, v__h36664 } ;
  // inlined wires
  assign pciw_pci0_axiTxData$wget =
	     { pciw_pci0_txF$D_OUT[31:0],
	       pciw_pci0_txF$D_OUT[63:32],
	       pciw_pci0_txF$D_OUT[95:64],
	       pciw_pci0_txF$D_OUT[127:96] } ;
  assign pciw_pci0_axiTxData$whas =
	     pciw_pci0_txF$EMPTY_N && pciw_pci0_pcie_ep$s_axis_tx_tready ;
  assign pciw_pci0_axiTxKeep$wget =
	     pciw_pci0_txF$D_OUT[151] ?
	       { pciw_pci0_txF$D_OUT[128],
		 pciw_pci0_txF$D_OUT[129],
		 pciw_pci0_txF$D_OUT[130],
		 pciw_pci0_txF$D_OUT[131],
		 pciw_pci0_txF$D_OUT[132],
		 pciw_pci0_txF$D_OUT[133],
		 pciw_pci0_txF$D_OUT[134],
		 pciw_pci0_txF$D_OUT[135],
		 pciw_pci0_txF$D_OUT[136],
		 pciw_pci0_txF$D_OUT[137],
		 pciw_pci0_txF$D_OUT[138],
		 pciw_pci0_txF$D_OUT[139],
		 pciw_pci0_txF$D_OUT[140],
		 pciw_pci0_txF$D_OUT[141],
		 pciw_pci0_txF$D_OUT[142],
		 pciw_pci0_txF$D_OUT[143] } :
	       16'd65535 ;
  assign pciw_pci0_axiTxKeep$whas = pciw_pci0_axiTxData$whas ;
  assign pciw_pci0_axiTxUser$wget = 4'b0 ;
  assign pciw_pci0_axiTxUser$whas = pciw_pci0_axiTxData$whas ;
  assign pciw_pci0_axiTxLast$wget = pciw_pci0_txF$D_OUT[151] ;
  assign pciw_pci0_axiTxLast$whas = pciw_pci0_axiTxData$whas ;
  assign pciw_pci0_axiTxValid$wget = 1'd1 ;
  assign pciw_pci0_axiTxValid$whas = pciw_pci0_axiTxData$whas ;
  assign cap0_wci_wslv_wciReq$wget =
	     { ctop$wci_m_3_MCmd,
	       ctop$wci_m_3_MAddrSpace,
	       ctop$wci_m_3_MByteEn,
	       ctop$wci_m_3_MAddr,
	       ctop$wci_m_3_MData } ;
  assign cap0_wci_wslv_wciReq$whas = 1'd1 ;
  assign cap0_wci_wslv_respF_x_wire$wget =
	     MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_2 ;
  assign cap0_wci_wslv_respF_x_wire$whas =
	     WILL_FIRE_RL_cap0_wci_cfrd &&
	     cap0_wci_wslv_reqF$D_OUT[63:52] != 12'h800 &&
	     cap0_wci_wslv_reqF$D_OUT[63:52] != 12'h400 ||
	     WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete ||
	     WILL_FIRE_RL_cap0_advance_split_response ||
	     WILL_FIRE_RL_cap0_wci_cfwr ;
  assign cap0_wci_wslv_wEdge$wget = cap0_wci_wslv_reqF$D_OUT[36:34] ;
  assign cap0_wci_wslv_wEdge$whas = WILL_FIRE_RL_cap0_wci_wslv_ctl_op_start ;
  assign cap0_wci_wslv_sFlagReg_1$wget = 1'b0 ;
  assign cap0_wci_wslv_sFlagReg_1$whas = 1'b0 ;
  assign cap0_wci_wslv_ctlAckReg_1$wget = 1'd1 ;
  assign cap0_wci_wslv_ctlAckReg_1$whas =
	     WILL_FIRE_RL_cap0_wci_ctrl_OrE ||
	     WILL_FIRE_RL_cap0_wci_ctrl_IsO ||
	     WILL_FIRE_RL_cap0_wci_ctrl_EiI ;
  assign cap0_wci_wci_Es_mCmd_w$wget = ctop$wci_m_3_MCmd ;
  assign cap0_wci_wci_Es_mCmd_w$whas = 1'd1 ;
  assign cap0_wci_wci_Es_mAddrSpace_w$wget = ctop$wci_m_3_MAddrSpace ;
  assign cap0_wci_wci_Es_mAddrSpace_w$whas = 1'd1 ;
  assign cap0_wci_wci_Es_mByteEn_w$wget = ctop$wci_m_3_MByteEn ;
  assign cap0_wci_wci_Es_mByteEn_w$whas = 1'd1 ;
  assign cap0_wci_wci_Es_mAddr_w$wget = ctop$wci_m_3_MAddr ;
  assign cap0_wci_wci_Es_mAddr_w$whas = 1'd1 ;
  assign cap0_wci_wci_Es_mData_w$wget = ctop$wci_m_3_MData ;
  assign cap0_wci_wci_Es_mData_w$whas = 1'd1 ;
  assign cap0_wsiS_wsiReq$wget =
	     { gbe0$wsiM0_MCmd,
	       gbe0$wsiM0_MReqLast,
	       gbe0$wsiM0_MBurstPrecise,
	       gbe0$wsiM0_MBurstLength,
	       gbe0$wsiM0_MData,
	       gbe0$wsiM0_MByteEn,
	       gbe0$wsiM0_MReqInfo } ;
  assign cap0_wsiS_wsiReq$whas = 1'd1 ;
  assign cap0_wsiS_operateD_1$wget = 1'd1 ;
  assign cap0_wsiS_operateD_1$whas = cap0_wci_wslv_cState == 3'd2 ;
  assign cap0_wsiS_peerIsReady_1$wget = 1'd1 ;
  assign cap0_wsiS_peerIsReady_1$whas = gbe0$wsiM0_MReset_n ;
  assign cap0_wsiS_sThreadBusy_dw$wget = cap0_wsiS_reqFifo_countReg > 2'd1 ;
  assign cap0_wsiS_sThreadBusy_dw$whas =
	     cap0_wsiS_reqFifo_levelsValid && cap0_wsiS_operateD &&
	     cap0_wsiS_peerIsReady ;
  assign cap0_wtiS_wtiReq$wget = 67'h0 ;
  assign cap0_wtiS_wtiReq$whas = 1'b0 ;
  assign cap0_wtiS_operateD_1$wget = 1'b0 ;
  assign cap0_wtiS_operateD_1$whas = 1'b0 ;
  assign cap0_nowW$wget = cap0_wtiS_nowReq[63:0] ;
  assign cap0_nowW$whas = 1'd1 ;
  assign cap0_statusReg_w$wget = rdat___1__h38161 ;
  assign cap0_statusReg_w$whas = 1'd1 ;
  assign cap0_dataBram_serverAdapterA_outData_enqData$wget =
	     cap0_dataBram_memory$DOA ;
  assign cap0_dataBram_serverAdapterA_outData_enqData$whas =
	     (!cap0_dataBram_serverAdapterA_s1[0] ||
	      cap0_dataBram_serverAdapterA_outDataCore$FULL_N) &&
	     cap0_dataBram_serverAdapterA_s1[1] &&
	     cap0_dataBram_serverAdapterA_s1[0] ;
  assign cap0_dataBram_serverAdapterA_outData_outData$wget =
	     cap0_dataBram_serverAdapterA_outDataCore$EMPTY_N ?
	       cap0_dataBram_serverAdapterA_outDataCore$D_OUT :
	       cap0_dataBram_memory$DOA ;
  assign cap0_dataBram_serverAdapterA_outData_outData$whas =
	     cap0_dataBram_serverAdapterA_outDataCore$EMPTY_N ||
	     !cap0_dataBram_serverAdapterA_outDataCore$EMPTY_N &&
	     cap0_dataBram_serverAdapterA_outData_enqData$whas ;
  assign cap0_dataBram_serverAdapterA_cnt_1$wget = 3'd1 ;
  assign cap0_dataBram_serverAdapterA_cnt_1$whas = 1'b0 ;
  assign cap0_dataBram_serverAdapterA_cnt_2$wget = 3'h0 ;
  assign cap0_dataBram_serverAdapterA_cnt_2$whas = 1'b0 ;
  assign cap0_dataBram_serverAdapterA_cnt_3$wget = 3'h0 ;
  assign cap0_dataBram_serverAdapterA_cnt_3$whas = 1'b0 ;
  assign cap0_dataBram_serverAdapterA_writeWithResp$wget = 2'd2 ;
  assign cap0_dataBram_serverAdapterA_writeWithResp$whas =
	     MUX_cap0_dataCount$write_1__SEL_2 ;
  assign cap0_dataBram_serverAdapterA_s1_1$wget = 2'd2 ;
  assign cap0_dataBram_serverAdapterA_s1_1$whas =
	     MUX_cap0_dataCount$write_1__SEL_2 ;
  assign cap0_dataBram_serverAdapterB_outData_enqData$wget =
	     cap0_dataBram_memory$DOB ;
  assign cap0_dataBram_serverAdapterB_outData_enqData$whas =
	     (!cap0_dataBram_serverAdapterB_s1[0] ||
	      cap0_dataBram_serverAdapterB_outDataCore$FULL_N) &&
	     cap0_dataBram_serverAdapterB_s1[1] &&
	     cap0_dataBram_serverAdapterB_s1[0] ;
  assign cap0_dataBram_serverAdapterB_outData_outData$wget =
	     y_avValue__h37291 ;
  assign cap0_dataBram_serverAdapterB_outData_outData$whas =
	     cap0_dataBram_serverAdapterB_outDataCore$EMPTY_N ||
	     !cap0_dataBram_serverAdapterB_outDataCore$EMPTY_N &&
	     cap0_dataBram_serverAdapterB_outData_enqData$whas ;
  assign cap0_dataBram_serverAdapterB_cnt_1$wget = 3'd1 ;
  assign cap0_dataBram_serverAdapterB_cnt_1$whas =
	     WILL_FIRE_RL_cap0_dataBram_serverAdapterB_stageReadResponseAlways ;
  assign cap0_dataBram_serverAdapterB_cnt_2$wget = 3'd7 ;
  assign cap0_dataBram_serverAdapterB_cnt_2$whas =
	     cap0_dataBram_serverAdapterB_outData_deqCalled$whas ;
  assign cap0_dataBram_serverAdapterB_cnt_3$wget = 3'h0 ;
  assign cap0_dataBram_serverAdapterB_cnt_3$whas = 1'b0 ;
  assign cap0_dataBram_serverAdapterB_writeWithResp$wget = 2'd0 ;
  assign cap0_dataBram_serverAdapterB_writeWithResp$whas =
	     WILL_FIRE_RL_cap0_dataBram_serverAdapterB_stageReadResponseAlways ;
  assign cap0_dataBram_serverAdapterB_s1_1$wget = 2'd3 ;
  assign cap0_dataBram_serverAdapterB_s1_1$whas =
	     WILL_FIRE_RL_cap0_dataBram_serverAdapterB_stageReadResponseAlways ;
  assign cap0_metaBram_serverAdapterA_outData_enqData$wget =
	     cap0_metaBram_memory$DOA ;
  assign cap0_metaBram_serverAdapterA_outData_enqData$whas =
	     (!cap0_metaBram_serverAdapterA_s1[0] ||
	      cap0_metaBram_serverAdapterA_outDataCore$FULL_N) &&
	     cap0_metaBram_serverAdapterA_s1[1] &&
	     cap0_metaBram_serverAdapterA_s1[0] ;
  assign cap0_metaBram_serverAdapterA_outData_outData$wget =
	     cap0_metaBram_serverAdapterA_outDataCore$EMPTY_N ?
	       cap0_metaBram_serverAdapterA_outDataCore$D_OUT :
	       cap0_metaBram_memory$DOA ;
  assign cap0_metaBram_serverAdapterA_outData_outData$whas =
	     cap0_metaBram_serverAdapterA_outDataCore$EMPTY_N ||
	     !cap0_metaBram_serverAdapterA_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterA_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterA_cnt_1$wget = 3'd1 ;
  assign cap0_metaBram_serverAdapterA_cnt_1$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_cnt_2$wget = 3'h0 ;
  assign cap0_metaBram_serverAdapterA_cnt_2$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_cnt_3$wget = 3'h0 ;
  assign cap0_metaBram_serverAdapterA_cnt_3$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_writeWithResp$wget = 2'd2 ;
  assign cap0_metaBram_serverAdapterA_writeWithResp$whas =
	     MUX_cap0_metaCount$write_1__SEL_2 ;
  assign cap0_metaBram_serverAdapterA_s1_1$wget = 2'd2 ;
  assign cap0_metaBram_serverAdapterA_s1_1$whas =
	     MUX_cap0_metaCount$write_1__SEL_2 ;
  assign cap0_metaBram_serverAdapterB_outData_enqData$wget =
	     cap0_metaBram_memory$DOB ;
  assign cap0_metaBram_serverAdapterB_outData_enqData$whas =
	     (!cap0_metaBram_serverAdapterB_s1[0] ||
	      cap0_metaBram_serverAdapterB_outDataCore$FULL_N) &&
	     cap0_metaBram_serverAdapterB_s1[1] &&
	     cap0_metaBram_serverAdapterB_s1[0] ;
  assign cap0_metaBram_serverAdapterB_outData_outData$wget =
	     y_avValue__h37335 ;
  assign cap0_metaBram_serverAdapterB_outData_outData$whas =
	     cap0_metaBram_serverAdapterB_outDataCore$EMPTY_N ||
	     !cap0_metaBram_serverAdapterB_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterB_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterB_cnt_1$wget = 3'd1 ;
  assign cap0_metaBram_serverAdapterB_cnt_1$whas =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_stageReadResponseAlways ;
  assign cap0_metaBram_serverAdapterB_cnt_2$wget = 3'd7 ;
  assign cap0_metaBram_serverAdapterB_cnt_2$whas =
	     cap0_metaBram_serverAdapterB_outData_deqCalled$whas ;
  assign cap0_metaBram_serverAdapterB_cnt_3$wget = 3'h0 ;
  assign cap0_metaBram_serverAdapterB_cnt_3$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterB_writeWithResp$wget = 2'd0 ;
  assign cap0_metaBram_serverAdapterB_writeWithResp$whas =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_stageReadResponseAlways ;
  assign cap0_metaBram_serverAdapterB_s1_1$wget = 2'd3 ;
  assign cap0_metaBram_serverAdapterB_s1_1$whas =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_stageReadResponseAlways ;
  assign cap0_metaBram_serverAdapterA_1_outData_enqData$wget =
	     cap0_metaBram_memory_1$DOA ;
  assign cap0_metaBram_serverAdapterA_1_outData_enqData$whas =
	     (!cap0_metaBram_serverAdapterA_1_s1[0] ||
	      cap0_metaBram_serverAdapterA_1_outDataCore$FULL_N) &&
	     cap0_metaBram_serverAdapterA_1_s1[1] &&
	     cap0_metaBram_serverAdapterA_1_s1[0] ;
  assign cap0_metaBram_serverAdapterA_1_outData_outData$wget =
	     cap0_metaBram_serverAdapterA_1_outDataCore$EMPTY_N ?
	       cap0_metaBram_serverAdapterA_1_outDataCore$D_OUT :
	       cap0_metaBram_memory_1$DOA ;
  assign cap0_metaBram_serverAdapterA_1_outData_outData$whas =
	     cap0_metaBram_serverAdapterA_1_outDataCore$EMPTY_N ||
	     !cap0_metaBram_serverAdapterA_1_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterA_1_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterA_1_cnt_1$wget = 3'd1 ;
  assign cap0_metaBram_serverAdapterA_1_cnt_1$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_1_cnt_2$wget = 3'h0 ;
  assign cap0_metaBram_serverAdapterA_1_cnt_2$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_1_cnt_3$wget = 3'h0 ;
  assign cap0_metaBram_serverAdapterA_1_cnt_3$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_1_writeWithResp$wget = 2'd2 ;
  assign cap0_metaBram_serverAdapterA_1_writeWithResp$whas =
	     MUX_cap0_metaCount$write_1__SEL_2 ;
  assign cap0_metaBram_serverAdapterA_1_s1_1$wget = 2'd2 ;
  assign cap0_metaBram_serverAdapterA_1_s1_1$whas =
	     MUX_cap0_metaCount$write_1__SEL_2 ;
  assign cap0_metaBram_serverAdapterB_1_outData_enqData$wget =
	     cap0_metaBram_memory_1$DOB ;
  assign cap0_metaBram_serverAdapterB_1_outData_enqData$whas =
	     (!cap0_metaBram_serverAdapterB_1_s1[0] ||
	      cap0_metaBram_serverAdapterB_1_outDataCore$FULL_N) &&
	     cap0_metaBram_serverAdapterB_1_s1[1] &&
	     cap0_metaBram_serverAdapterB_1_s1[0] ;
  assign cap0_metaBram_serverAdapterB_1_outData_outData$wget =
	     y_avValue__h37375 ;
  assign cap0_metaBram_serverAdapterB_1_outData_outData$whas =
	     cap0_metaBram_serverAdapterB_1_outDataCore$EMPTY_N ||
	     !cap0_metaBram_serverAdapterB_1_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterB_1_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterB_1_cnt_1$wget = 3'd1 ;
  assign cap0_metaBram_serverAdapterB_1_cnt_1$whas =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_1_stageReadResponseAlways ;
  assign cap0_metaBram_serverAdapterB_1_cnt_2$wget = 3'd7 ;
  assign cap0_metaBram_serverAdapterB_1_cnt_2$whas =
	     cap0_metaBram_serverAdapterB_1_outData_deqCalled$whas ;
  assign cap0_metaBram_serverAdapterB_1_cnt_3$wget = 3'h0 ;
  assign cap0_metaBram_serverAdapterB_1_cnt_3$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterB_1_writeWithResp$wget = 2'd0 ;
  assign cap0_metaBram_serverAdapterB_1_writeWithResp$whas =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_1_stageReadResponseAlways ;
  assign cap0_metaBram_serverAdapterB_1_s1_1$wget = 2'd3 ;
  assign cap0_metaBram_serverAdapterB_1_s1_1$whas =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_1_stageReadResponseAlways ;
  assign cap0_metaBram_serverAdapterA_2_outData_enqData$wget =
	     cap0_metaBram_memory_2$DOA ;
  assign cap0_metaBram_serverAdapterA_2_outData_enqData$whas =
	     (!cap0_metaBram_serverAdapterA_2_s1[0] ||
	      cap0_metaBram_serverAdapterA_2_outDataCore$FULL_N) &&
	     cap0_metaBram_serverAdapterA_2_s1[1] &&
	     cap0_metaBram_serverAdapterA_2_s1[0] ;
  assign cap0_metaBram_serverAdapterA_2_outData_outData$wget =
	     cap0_metaBram_serverAdapterA_2_outDataCore$EMPTY_N ?
	       cap0_metaBram_serverAdapterA_2_outDataCore$D_OUT :
	       cap0_metaBram_memory_2$DOA ;
  assign cap0_metaBram_serverAdapterA_2_outData_outData$whas =
	     cap0_metaBram_serverAdapterA_2_outDataCore$EMPTY_N ||
	     !cap0_metaBram_serverAdapterA_2_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterA_2_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterA_2_cnt_1$wget = 3'd1 ;
  assign cap0_metaBram_serverAdapterA_2_cnt_1$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_2_cnt_2$wget = 3'h0 ;
  assign cap0_metaBram_serverAdapterA_2_cnt_2$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_2_cnt_3$wget = 3'h0 ;
  assign cap0_metaBram_serverAdapterA_2_cnt_3$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_2_writeWithResp$wget = 2'd2 ;
  assign cap0_metaBram_serverAdapterA_2_writeWithResp$whas =
	     MUX_cap0_metaCount$write_1__SEL_2 ;
  assign cap0_metaBram_serverAdapterA_2_s1_1$wget = 2'd2 ;
  assign cap0_metaBram_serverAdapterA_2_s1_1$whas =
	     MUX_cap0_metaCount$write_1__SEL_2 ;
  assign cap0_metaBram_serverAdapterB_2_outData_enqData$wget =
	     cap0_metaBram_memory_2$DOB ;
  assign cap0_metaBram_serverAdapterB_2_outData_enqData$whas =
	     (!cap0_metaBram_serverAdapterB_2_s1[0] ||
	      cap0_metaBram_serverAdapterB_2_outDataCore$FULL_N) &&
	     cap0_metaBram_serverAdapterB_2_s1[1] &&
	     cap0_metaBram_serverAdapterB_2_s1[0] ;
  assign cap0_metaBram_serverAdapterB_2_outData_outData$wget =
	     y_avValue__h37415 ;
  assign cap0_metaBram_serverAdapterB_2_outData_outData$whas =
	     cap0_metaBram_serverAdapterB_2_outDataCore$EMPTY_N ||
	     !cap0_metaBram_serverAdapterB_2_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterB_2_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterB_2_cnt_1$wget = 3'd1 ;
  assign cap0_metaBram_serverAdapterB_2_cnt_1$whas =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_2_stageReadResponseAlways ;
  assign cap0_metaBram_serverAdapterB_2_cnt_2$wget = 3'd7 ;
  assign cap0_metaBram_serverAdapterB_2_cnt_2$whas =
	     cap0_metaBram_serverAdapterB_2_outData_deqCalled$whas ;
  assign cap0_metaBram_serverAdapterB_2_cnt_3$wget = 3'h0 ;
  assign cap0_metaBram_serverAdapterB_2_cnt_3$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterB_2_writeWithResp$wget = 2'd0 ;
  assign cap0_metaBram_serverAdapterB_2_writeWithResp$whas =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_2_stageReadResponseAlways ;
  assign cap0_metaBram_serverAdapterB_2_s1_1$wget = 2'd3 ;
  assign cap0_metaBram_serverAdapterB_2_s1_1$whas =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_2_stageReadResponseAlways ;
  assign cap0_metaBram_serverAdapterA_3_outData_enqData$wget =
	     cap0_metaBram_memory_3$DOA ;
  assign cap0_metaBram_serverAdapterA_3_outData_enqData$whas =
	     (!cap0_metaBram_serverAdapterA_3_s1[0] ||
	      cap0_metaBram_serverAdapterA_3_outDataCore$FULL_N) &&
	     cap0_metaBram_serverAdapterA_3_s1[1] &&
	     cap0_metaBram_serverAdapterA_3_s1[0] ;
  assign cap0_metaBram_serverAdapterA_3_outData_outData$wget =
	     cap0_metaBram_serverAdapterA_3_outDataCore$EMPTY_N ?
	       cap0_metaBram_serverAdapterA_3_outDataCore$D_OUT :
	       cap0_metaBram_memory_3$DOA ;
  assign cap0_metaBram_serverAdapterA_3_outData_outData$whas =
	     cap0_metaBram_serverAdapterA_3_outDataCore$EMPTY_N ||
	     !cap0_metaBram_serverAdapterA_3_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterA_3_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterA_3_cnt_1$wget = 3'd1 ;
  assign cap0_metaBram_serverAdapterA_3_cnt_1$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_3_cnt_2$wget = 3'h0 ;
  assign cap0_metaBram_serverAdapterA_3_cnt_2$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_3_cnt_3$wget = 3'h0 ;
  assign cap0_metaBram_serverAdapterA_3_cnt_3$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_3_writeWithResp$wget = 2'd2 ;
  assign cap0_metaBram_serverAdapterA_3_writeWithResp$whas =
	     MUX_cap0_metaCount$write_1__SEL_2 ;
  assign cap0_metaBram_serverAdapterA_3_s1_1$wget = 2'd2 ;
  assign cap0_metaBram_serverAdapterA_3_s1_1$whas =
	     MUX_cap0_metaCount$write_1__SEL_2 ;
  assign cap0_metaBram_serverAdapterB_3_outData_enqData$wget =
	     cap0_metaBram_memory_3$DOB ;
  assign cap0_metaBram_serverAdapterB_3_outData_enqData$whas =
	     (!cap0_metaBram_serverAdapterB_3_s1[0] ||
	      cap0_metaBram_serverAdapterB_3_outDataCore$FULL_N) &&
	     cap0_metaBram_serverAdapterB_3_s1[1] &&
	     cap0_metaBram_serverAdapterB_3_s1[0] ;
  assign cap0_metaBram_serverAdapterB_3_outData_outData$wget =
	     y_avValue__h37455 ;
  assign cap0_metaBram_serverAdapterB_3_outData_outData$whas =
	     cap0_metaBram_serverAdapterB_3_outDataCore$EMPTY_N ||
	     !cap0_metaBram_serverAdapterB_3_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterB_3_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterB_3_cnt_1$wget = 3'd1 ;
  assign cap0_metaBram_serverAdapterB_3_cnt_1$whas =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_3_stageReadResponseAlways ;
  assign cap0_metaBram_serverAdapterB_3_cnt_2$wget = 3'd7 ;
  assign cap0_metaBram_serverAdapterB_3_cnt_2$whas =
	     cap0_metaBram_serverAdapterB_3_outData_deqCalled$whas ;
  assign cap0_metaBram_serverAdapterB_3_cnt_3$wget = 3'h0 ;
  assign cap0_metaBram_serverAdapterB_3_cnt_3$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterB_3_writeWithResp$wget = 2'd0 ;
  assign cap0_metaBram_serverAdapterB_3_writeWithResp$whas =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_3_stageReadResponseAlways ;
  assign cap0_metaBram_serverAdapterB_3_s1_1$wget = 2'd3 ;
  assign cap0_metaBram_serverAdapterB_3_s1_1$whas =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_3_stageReadResponseAlways ;
  assign cap0_wsi_Es_mCmd_w$wget = gbe0$wsiM0_MCmd ;
  assign cap0_wsi_Es_mCmd_w$whas = 1'd1 ;
  assign cap0_wsi_Es_mBurstLength_w$wget = gbe0$wsiM0_MBurstLength ;
  assign cap0_wsi_Es_mBurstLength_w$whas = 1'd1 ;
  assign cap0_wsi_Es_mData_w$wget = gbe0$wsiM0_MData ;
  assign cap0_wsi_Es_mData_w$whas = 1'd1 ;
  assign cap0_wsi_Es_mByteEn_w$wget = gbe0$wsiM0_MByteEn ;
  assign cap0_wsi_Es_mByteEn_w$whas = 1'd1 ;
  assign cap0_wsi_Es_mReqInfo_w$wget = gbe0$wsiM0_MReqInfo ;
  assign cap0_wsi_Es_mReqInfo_w$whas = 1'd1 ;
  assign cap0_wti_Es_mCmd_w$wget = 3'h0 ;
  assign cap0_wti_Es_mCmd_w$whas = 1'b0 ;
  assign cap0_wti_Es_mData_w$wget = 64'h0 ;
  assign cap0_wti_Es_mData_w$whas = 1'b0 ;
  assign cap0_wci_wslv_reqF_r_enq$whas =
	     cap0_wci_wslv_wciReq$wget[71:69] != 3'd0 ;
  assign cap0_wci_wslv_reqF_r_deq$whas =
	     WILL_FIRE_RL_cap0_wci_cfrd || WILL_FIRE_RL_cap0_wci_cfwr ||
	     WILL_FIRE_RL_cap0_wci_wslv_ctl_op_start ;
  assign cap0_wci_wslv_reqF_r_clr$whas = 1'b0 ;
  assign cap0_wci_wslv_respF_enqueueing$whas =
	     WILL_FIRE_RL_cap0_wci_cfrd &&
	     cap0_wci_wslv_reqF$D_OUT[63:52] != 12'h800 &&
	     cap0_wci_wslv_reqF$D_OUT[63:52] != 12'h400 ||
	     WILL_FIRE_RL_cap0_advance_split_response ||
	     WILL_FIRE_RL_cap0_wci_cfwr ||
	     WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete ;
  assign cap0_wci_wslv_respF_dequeueing$whas =
	     cap0_wci_wslv_respF_c_r != 2'd0 ;
  assign cap0_wci_wslv_sThreadBusy_pw$whas = 1'b0 ;
  assign cap0_wci_wslv_wci_cfwr_pw$whas =
	     cap0_wci_wslv_reqF$EMPTY_N && cap0_wci_wslv_reqF$D_OUT[68] &&
	     cap0_wci_wslv_reqF$D_OUT[71:69] == 3'd1 ;
  assign cap0_wci_wslv_wci_cfrd_pw$whas =
	     cap0_wci_wslv_reqF$EMPTY_N && cap0_wci_wslv_reqF$D_OUT[68] &&
	     cap0_wci_wslv_reqF$D_OUT[71:69] == 3'd2 ;
  assign cap0_wci_wslv_wci_ctrl_pw$whas =
	     cap0_wci_wslv_reqF$EMPTY_N && !cap0_wci_wslv_reqF$D_OUT[68] &&
	     cap0_wci_wslv_reqF$D_OUT[71:69] == 3'd2 ;
  assign cap0_wsiS_reqFifo_r_enq$whas = WILL_FIRE_RL_cap0_wsiS_reqFifo_enq ;
  assign cap0_wsiS_reqFifo_r_deq$whas = WILL_FIRE_RL_cap0_doMessageAccept ;
  assign cap0_wsiS_reqFifo_r_clr$whas = 1'b0 ;
  assign cap0_wsiS_reqFifo_doResetEnq$whas =
	     WILL_FIRE_RL_cap0_wsiS_reqFifo_enq ;
  assign cap0_wsiS_reqFifo_doResetDeq$whas =
	     WILL_FIRE_RL_cap0_doMessageAccept ;
  assign cap0_wsiS_reqFifo_doResetClr$whas = 1'b0 ;
  assign cap0_dataBram_serverAdapterA_outData_deqCalled$whas = 1'b0 ;
  assign cap0_dataBram_serverAdapterB_outData_deqCalled$whas =
	     WILL_FIRE_RL_cap0_advance_split_response &&
	     cap0_splaF$D_OUT[2] &&
	     cap0_splaF$D_OUT[1:0] == 2'd0 ;
  assign cap0_metaBram_serverAdapterA_outData_deqCalled$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterB_outData_deqCalled$whas =
	     WILL_FIRE_RL_cap0_advance_split_response &&
	     !cap0_splaF$D_OUT[2] &&
	     cap0_splaF$D_OUT[1:0] == 2'd0 ;
  assign cap0_metaBram_serverAdapterA_1_outData_deqCalled$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterB_1_outData_deqCalled$whas =
	     WILL_FIRE_RL_cap0_advance_split_response &&
	     !cap0_splaF$D_OUT[2] &&
	     cap0_splaF$D_OUT[1:0] == 2'd1 ;
  assign cap0_metaBram_serverAdapterA_2_outData_deqCalled$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterB_2_outData_deqCalled$whas =
	     WILL_FIRE_RL_cap0_advance_split_response &&
	     !cap0_splaF$D_OUT[2] &&
	     cap0_splaF$D_OUT[1:0] == 2'd2 ;
  assign cap0_metaBram_serverAdapterA_3_outData_deqCalled$whas = 1'b0 ;
  assign cap0_metaBram_serverAdapterB_3_outData_deqCalled$whas =
	     WILL_FIRE_RL_cap0_advance_split_response &&
	     !cap0_splaF$D_OUT[2] &&
	     cap0_splaF$D_OUT[1:0] == 2'd3 ;
  assign cap0_wsi_Es_mReqLast_w$whas = gbe0$wsiM0_MReqLast ;
  assign cap0_wsi_Es_mBurstPrecise_w$whas = gbe0$wsiM0_MBurstPrecise ;
  assign cap0_wsi_Es_mDataInfo_w$whas = 1'd1 ;
  assign infLed$wget = ctop$led ;
  assign blinkLed$wget = freeCnt[25] ;
  assign cap0_wsiS_extStatusW$wget =
	     { cap0_wsiS_pMesgCount,
	       cap0_wsiS_iMesgCount,
	       cap0_wsiS_tBusyCount } ;
  // register cap0_controlReg
  assign cap0_controlReg$D_IN =
	     MUX_cap0_controlReg$write_1__SEL_1 ?
	       cap0_wci_wslv_reqF$D_OUT[31:0] :
	       32'd0 ;
  assign cap0_controlReg$EN =
	     WILL_FIRE_RL_cap0_wci_cfwr &&
	     cap0_wci_wslv_reqF$D_OUT[39:32] == 8'h0 ||
	     WILL_FIRE_RL_cap0_wci_ctrl_EiI ;
  // register cap0_dataBram_serverAdapterA_cnt
  assign cap0_dataBram_serverAdapterA_cnt$D_IN =
	     cap0_dataBram_serverAdapterA_cnt + 3'd0 + 3'd0 ;
  assign cap0_dataBram_serverAdapterA_cnt$EN = 1'b0 ;
  // register cap0_dataBram_serverAdapterA_s1
  assign cap0_dataBram_serverAdapterA_s1$D_IN =
	     { MUX_cap0_dataCount$write_1__SEL_2, 1'b0 } ;
  assign cap0_dataBram_serverAdapterA_s1$EN = 1'd1 ;
  // register cap0_dataBram_serverAdapterB_cnt
  assign cap0_dataBram_serverAdapterB_cnt$D_IN =
	     cap0_dataBram_serverAdapterB_cnt_51_PLUS_IF_ca_ETC___d457 ;
  assign cap0_dataBram_serverAdapterB_cnt$EN =
	     WILL_FIRE_RL_cap0_dataBram_serverAdapterB_stageReadResponseAlways ||
	     cap0_dataBram_serverAdapterB_outData_deqCalled$whas ;
  // register cap0_dataBram_serverAdapterB_s1
  assign cap0_dataBram_serverAdapterB_s1$D_IN =
	     { WILL_FIRE_RL_cap0_dataBram_serverAdapterB_stageReadResponseAlways,
	       1'b1 } ;
  assign cap0_dataBram_serverAdapterB_s1$EN = 1'd1 ;
  // register cap0_dataCount
  always@(MUX_cap0_dataCount$write_1__SEL_1 or
	  cap0_wci_wslv_reqF$D_OUT or
	  MUX_cap0_dataCount$write_1__SEL_2 or
	  MUX_cap0_dataCount$write_1__VAL_2 or WILL_FIRE_RL_cap0_wci_ctrl_EiI)
  case (1'b1)
    MUX_cap0_dataCount$write_1__SEL_1:
	cap0_dataCount$D_IN = cap0_wci_wslv_reqF$D_OUT[31:0];
    MUX_cap0_dataCount$write_1__SEL_2:
	cap0_dataCount$D_IN = MUX_cap0_dataCount$write_1__VAL_2;
    WILL_FIRE_RL_cap0_wci_ctrl_EiI: cap0_dataCount$D_IN = 32'd0;
    default: cap0_dataCount$D_IN = 32'hAAAAAAAA /* unspecified value */ ;
  endcase
  assign cap0_dataCount$EN =
	     WILL_FIRE_RL_cap0_doMessageAccept &&
	     cap0_controlReg_60_BIT_0_61_AND_NOT_cap0_contr_ETC___d1008 ||
	     WILL_FIRE_RL_cap0_wci_cfwr &&
	     cap0_wci_wslv_reqF$D_OUT[39:32] == 8'h08 ||
	     WILL_FIRE_RL_cap0_wci_ctrl_EiI ;
  // register cap0_isFirst
  assign cap0_isFirst$D_IN = 1'b0 ;
  assign cap0_isFirst$EN = 1'b0 ;
  // register cap0_mesgLengthSoFar
  assign cap0_mesgLengthSoFar$D_IN =
	     cap0_wsiS_reqFifo$D_OUT[57] ? 14'd0 : mlB__h34434 ;
  assign cap0_mesgLengthSoFar$EN = WILL_FIRE_RL_cap0_doMessageAccept ;
  // register cap0_metaBram_serverAdapterA_1_cnt
  assign cap0_metaBram_serverAdapterA_1_cnt$D_IN =
	     cap0_metaBram_serverAdapterA_1_cnt + 3'd0 + 3'd0 ;
  assign cap0_metaBram_serverAdapterA_1_cnt$EN = 1'b0 ;
  // register cap0_metaBram_serverAdapterA_1_s1
  assign cap0_metaBram_serverAdapterA_1_s1$D_IN =
	     { MUX_cap0_metaCount$write_1__SEL_2, 1'b0 } ;
  assign cap0_metaBram_serverAdapterA_1_s1$EN = 1'd1 ;
  // register cap0_metaBram_serverAdapterA_2_cnt
  assign cap0_metaBram_serverAdapterA_2_cnt$D_IN =
	     cap0_metaBram_serverAdapterA_2_cnt + 3'd0 + 3'd0 ;
  assign cap0_metaBram_serverAdapterA_2_cnt$EN = 1'b0 ;
  // register cap0_metaBram_serverAdapterA_2_s1
  assign cap0_metaBram_serverAdapterA_2_s1$D_IN =
	     { MUX_cap0_metaCount$write_1__SEL_2, 1'b0 } ;
  assign cap0_metaBram_serverAdapterA_2_s1$EN = 1'd1 ;
  // register cap0_metaBram_serverAdapterA_3_cnt
  assign cap0_metaBram_serverAdapterA_3_cnt$D_IN =
	     cap0_metaBram_serverAdapterA_3_cnt + 3'd0 + 3'd0 ;
  assign cap0_metaBram_serverAdapterA_3_cnt$EN = 1'b0 ;
  // register cap0_metaBram_serverAdapterA_3_s1
  assign cap0_metaBram_serverAdapterA_3_s1$D_IN =
	     { MUX_cap0_metaCount$write_1__SEL_2, 1'b0 } ;
  assign cap0_metaBram_serverAdapterA_3_s1$EN = 1'd1 ;
  // register cap0_metaBram_serverAdapterA_cnt
  assign cap0_metaBram_serverAdapterA_cnt$D_IN =
	     cap0_metaBram_serverAdapterA_cnt + 3'd0 + 3'd0 ;
  assign cap0_metaBram_serverAdapterA_cnt$EN = 1'b0 ;
  // register cap0_metaBram_serverAdapterA_s1
  assign cap0_metaBram_serverAdapterA_s1$D_IN =
	     { MUX_cap0_metaCount$write_1__SEL_2, 1'b0 } ;
  assign cap0_metaBram_serverAdapterA_s1$EN = 1'd1 ;
  // register cap0_metaBram_serverAdapterB_1_cnt
  assign cap0_metaBram_serverAdapterB_1_cnt$D_IN =
	     cap0_metaBram_serverAdapterB_1_cnt_87_PLUS_IF__ETC___d693 ;
  assign cap0_metaBram_serverAdapterB_1_cnt$EN =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_1_stageReadResponseAlways ||
	     cap0_metaBram_serverAdapterB_1_outData_deqCalled$whas ;
  // register cap0_metaBram_serverAdapterB_1_s1
  assign cap0_metaBram_serverAdapterB_1_s1$D_IN =
	     { WILL_FIRE_RL_cap0_metaBram_serverAdapterB_1_stageReadResponseAlways,
	       1'b1 } ;
  assign cap0_metaBram_serverAdapterB_1_s1$EN = 1'd1 ;
  // register cap0_metaBram_serverAdapterB_2_cnt
  assign cap0_metaBram_serverAdapterB_2_cnt$D_IN =
	     cap0_metaBram_serverAdapterB_2_cnt_05_PLUS_IF__ETC___d811 ;
  assign cap0_metaBram_serverAdapterB_2_cnt$EN =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_2_stageReadResponseAlways ||
	     cap0_metaBram_serverAdapterB_2_outData_deqCalled$whas ;
  // register cap0_metaBram_serverAdapterB_2_s1
  assign cap0_metaBram_serverAdapterB_2_s1$D_IN =
	     { WILL_FIRE_RL_cap0_metaBram_serverAdapterB_2_stageReadResponseAlways,
	       1'b1 } ;
  assign cap0_metaBram_serverAdapterB_2_s1$EN = 1'd1 ;
  // register cap0_metaBram_serverAdapterB_3_cnt
  assign cap0_metaBram_serverAdapterB_3_cnt$D_IN =
	     cap0_metaBram_serverAdapterB_3_cnt_23_PLUS_IF__ETC___d929 ;
  assign cap0_metaBram_serverAdapterB_3_cnt$EN =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_3_stageReadResponseAlways ||
	     cap0_metaBram_serverAdapterB_3_outData_deqCalled$whas ;
  // register cap0_metaBram_serverAdapterB_3_s1
  assign cap0_metaBram_serverAdapterB_3_s1$D_IN =
	     { WILL_FIRE_RL_cap0_metaBram_serverAdapterB_3_stageReadResponseAlways,
	       1'b1 } ;
  assign cap0_metaBram_serverAdapterB_3_s1$EN = 1'd1 ;
  // register cap0_metaBram_serverAdapterB_cnt
  assign cap0_metaBram_serverAdapterB_cnt$D_IN =
	     cap0_metaBram_serverAdapterB_cnt_69_PLUS_IF_ca_ETC___d575 ;
  assign cap0_metaBram_serverAdapterB_cnt$EN =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_stageReadResponseAlways ||
	     cap0_metaBram_serverAdapterB_outData_deqCalled$whas ;
  // register cap0_metaBram_serverAdapterB_s1
  assign cap0_metaBram_serverAdapterB_s1$D_IN =
	     { WILL_FIRE_RL_cap0_metaBram_serverAdapterB_stageReadResponseAlways,
	       1'b1 } ;
  assign cap0_metaBram_serverAdapterB_s1$EN = 1'd1 ;
  // register cap0_metaCount
  always@(MUX_cap0_metaCount$write_1__SEL_1 or
	  cap0_wci_wslv_reqF$D_OUT or
	  MUX_cap0_metaCount$write_1__SEL_2 or
	  MUX_cap0_metaCount$write_1__VAL_2 or WILL_FIRE_RL_cap0_wci_ctrl_EiI)
  case (1'b1)
    MUX_cap0_metaCount$write_1__SEL_1:
	cap0_metaCount$D_IN = cap0_wci_wslv_reqF$D_OUT[31:0];
    MUX_cap0_metaCount$write_1__SEL_2:
	cap0_metaCount$D_IN = MUX_cap0_metaCount$write_1__VAL_2;
    WILL_FIRE_RL_cap0_wci_ctrl_EiI: cap0_metaCount$D_IN = 32'd0;
    default: cap0_metaCount$D_IN = 32'hAAAAAAAA /* unspecified value */ ;
  endcase
  assign cap0_metaCount$EN =
	     WILL_FIRE_RL_cap0_doMessageAccept &&
	     cap0_controlReg_60_BIT_0_61_AND_NOT_cap0_contr_ETC___d1008 &&
	     cap0_wsiS_reqFifo$D_OUT[57] ||
	     WILL_FIRE_RL_cap0_wci_cfwr &&
	     cap0_wci_wslv_reqF$D_OUT[39:32] == 8'h04 ||
	     WILL_FIRE_RL_cap0_wci_ctrl_EiI ;
  // register cap0_splitReadInFlight
  assign cap0_splitReadInFlight$D_IN =
	     MUX_cap0_splitReadInFlight$write_1__SEL_1 ;
  assign cap0_splitReadInFlight$EN =
	     WILL_FIRE_RL_cap0_wci_cfrd &&
	     (cap0_wci_wslv_reqF$D_OUT[63:52] == 12'h800 ||
	      cap0_wci_wslv_reqF$D_OUT[63:52] == 12'h400) ||
	     WILL_FIRE_RL_cap0_advance_split_response ;
  // register cap0_wci_wslv_cEdge
  assign cap0_wci_wslv_cEdge$D_IN = cap0_wci_wslv_reqF$D_OUT[36:34] ;
  assign cap0_wci_wslv_cEdge$EN = WILL_FIRE_RL_cap0_wci_wslv_ctl_op_start ;
  // register cap0_wci_wslv_cState
  assign cap0_wci_wslv_cState$D_IN = cap0_wci_wslv_nState ;
  assign cap0_wci_wslv_cState$EN =
	     WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete &&
	     !cap0_wci_wslv_illegalEdge ;
  // register cap0_wci_wslv_ctlAckReg
  assign cap0_wci_wslv_ctlAckReg$D_IN = cap0_wci_wslv_ctlAckReg_1$whas ;
  assign cap0_wci_wslv_ctlAckReg$EN = 1'd1 ;
  // register cap0_wci_wslv_ctlOpActive
  assign cap0_wci_wslv_ctlOpActive$D_IN =
	     !WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete ;
  assign cap0_wci_wslv_ctlOpActive$EN =
	     WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete ||
	     WILL_FIRE_RL_cap0_wci_wslv_ctl_op_start ;
  // register cap0_wci_wslv_illegalEdge
  assign cap0_wci_wslv_illegalEdge$D_IN =
	     !MUX_cap0_wci_wslv_illegalEdge$write_1__SEL_1 &&
	     MUX_cap0_wci_wslv_illegalEdge$write_1__VAL_2 ;
  assign cap0_wci_wslv_illegalEdge$EN =
	     WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete &&
	     cap0_wci_wslv_illegalEdge ||
	     MUX_cap0_wci_wslv_illegalEdge$write_1__SEL_2 ;
  // register cap0_wci_wslv_isReset_isInReset
  assign cap0_wci_wslv_isReset_isInReset$D_IN = 1'd0 ;
  assign cap0_wci_wslv_isReset_isInReset$EN =
	     cap0_wci_wslv_isReset_isInReset ;
  // register cap0_wci_wslv_nState
  always@(cap0_wci_wslv_reqF$D_OUT)
  begin
    case (cap0_wci_wslv_reqF$D_OUT[36:34])
      3'd0: cap0_wci_wslv_nState$D_IN = 3'd1;
      3'd1: cap0_wci_wslv_nState$D_IN = 3'd2;
      3'd2: cap0_wci_wslv_nState$D_IN = 3'd3;
      default: cap0_wci_wslv_nState$D_IN = 3'd0;
    endcase
  end
  assign cap0_wci_wslv_nState$EN =
	     WILL_FIRE_RL_cap0_wci_wslv_ctl_op_start &&
	     (cap0_wci_wslv_reqF$D_OUT[36:34] == 3'd0 &&
	      cap0_wci_wslv_cState == 3'd0 ||
	      cap0_wci_wslv_reqF$D_OUT[36:34] == 3'd1 &&
	      (cap0_wci_wslv_cState == 3'd1 ||
	       cap0_wci_wslv_cState == 3'd3) ||
	      cap0_wci_wslv_reqF$D_OUT[36:34] == 3'd2 &&
	      cap0_wci_wslv_cState == 3'd2 ||
	      cap0_wci_wslv_reqF$D_OUT[36:34] == 3'd3 &&
	      (cap0_wci_wslv_cState == 3'd3 || cap0_wci_wslv_cState == 3'd2 ||
	       cap0_wci_wslv_cState == 3'd1)) ;
  // register cap0_wci_wslv_reqF_countReg
  assign cap0_wci_wslv_reqF_countReg$D_IN =
	     (cap0_wci_wslv_wciReq$wget[71:69] != 3'd0) ?
	       cap0_wci_wslv_reqF_countReg + 2'd1 :
	       cap0_wci_wslv_reqF_countReg - 2'd1 ;
  assign cap0_wci_wslv_reqF_countReg$EN =
	     (cap0_wci_wslv_wciReq$wget[71:69] != 3'd0) !=
	     cap0_wci_wslv_reqF_r_deq$whas ;
  // register cap0_wci_wslv_respF_c_r
  assign cap0_wci_wslv_respF_c_r$D_IN =
	     WILL_FIRE_RL_cap0_wci_wslv_respF_incCtr ?
	       MUX_cap0_wci_wslv_respF_c_r$write_1__VAL_1 :
	       MUX_cap0_wci_wslv_respF_c_r$write_1__VAL_2 ;
  assign cap0_wci_wslv_respF_c_r$EN =
	     WILL_FIRE_RL_cap0_wci_wslv_respF_incCtr ||
	     WILL_FIRE_RL_cap0_wci_wslv_respF_decCtr ;
  // register cap0_wci_wslv_respF_q_0
  always@(WILL_FIRE_RL_cap0_wci_wslv_respF_both or
	  MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_1 or
	  MUX_cap0_wci_wslv_respF_q_0$write_1__SEL_2 or
	  MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_cap0_wci_wslv_respF_decCtr or cap0_wci_wslv_respF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_cap0_wci_wslv_respF_both:
	  cap0_wci_wslv_respF_q_0$D_IN =
	      MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_1;
      MUX_cap0_wci_wslv_respF_q_0$write_1__SEL_2:
	  cap0_wci_wslv_respF_q_0$D_IN =
	      MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_cap0_wci_wslv_respF_decCtr:
	  cap0_wci_wslv_respF_q_0$D_IN = cap0_wci_wslv_respF_q_1;
      default: cap0_wci_wslv_respF_q_0$D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign cap0_wci_wslv_respF_q_0$EN =
	     WILL_FIRE_RL_cap0_wci_wslv_respF_both ||
	     WILL_FIRE_RL_cap0_wci_wslv_respF_incCtr &&
	     cap0_wci_wslv_respF_c_r == 2'd0 ||
	     WILL_FIRE_RL_cap0_wci_wslv_respF_decCtr ;
  // register cap0_wci_wslv_respF_q_1
  always@(WILL_FIRE_RL_cap0_wci_wslv_respF_both or
	  MUX_cap0_wci_wslv_respF_q_1$write_1__VAL_1 or
	  MUX_cap0_wci_wslv_respF_q_1$write_1__SEL_2 or
	  MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_cap0_wci_wslv_respF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_cap0_wci_wslv_respF_both:
	  cap0_wci_wslv_respF_q_1$D_IN =
	      MUX_cap0_wci_wslv_respF_q_1$write_1__VAL_1;
      MUX_cap0_wci_wslv_respF_q_1$write_1__SEL_2:
	  cap0_wci_wslv_respF_q_1$D_IN =
	      MUX_cap0_wci_wslv_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_cap0_wci_wslv_respF_decCtr:
	  cap0_wci_wslv_respF_q_1$D_IN = 34'h0AAAAAAAA;
      default: cap0_wci_wslv_respF_q_1$D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign cap0_wci_wslv_respF_q_1$EN =
	     WILL_FIRE_RL_cap0_wci_wslv_respF_both ||
	     WILL_FIRE_RL_cap0_wci_wslv_respF_incCtr &&
	     cap0_wci_wslv_respF_c_r == 2'd1 ||
	     WILL_FIRE_RL_cap0_wci_wslv_respF_decCtr ;
  // register cap0_wci_wslv_sFlagReg
  assign cap0_wci_wslv_sFlagReg$D_IN = 1'b0 ;
  assign cap0_wci_wslv_sFlagReg$EN = 1'd1 ;
  // register cap0_wci_wslv_sThreadBusy_d
  assign cap0_wci_wslv_sThreadBusy_d$D_IN = 1'b0 ;
  assign cap0_wci_wslv_sThreadBusy_d$EN = 1'd1 ;
  // register cap0_wsiS_burstKind
  assign cap0_wsiS_burstKind$D_IN =
	     (cap0_wsiS_burstKind == 2'd0) ?
	       (cap0_wsiS_wsiReq$wget[56] ? 2'd1 : 2'd2) :
	       2'd0 ;
  assign cap0_wsiS_burstKind$EN =
	     WILL_FIRE_RL_cap0_wsiS_reqFifo_enq &&
	     (cap0_wsiS_burstKind == 2'd0 ||
	      (cap0_wsiS_burstKind == 2'd1 || cap0_wsiS_burstKind == 2'd2) &&
	      cap0_wsiS_wsiReq$wget[57]) ;
  // register cap0_wsiS_errorSticky
  assign cap0_wsiS_errorSticky$D_IN = 1'b0 ;
  assign cap0_wsiS_errorSticky$EN = 1'b0 ;
  // register cap0_wsiS_iMesgCount
  assign cap0_wsiS_iMesgCount$D_IN = cap0_wsiS_iMesgCount + 32'd1 ;
  assign cap0_wsiS_iMesgCount$EN =
	     WILL_FIRE_RL_cap0_wsiS_reqFifo_enq &&
	     cap0_wsiS_burstKind == 2'd2 &&
	     cap0_wsiS_wsiReq$wget[57] ;
  // register cap0_wsiS_isReset_isInReset
  assign cap0_wsiS_isReset_isInReset$D_IN = 1'd0 ;
  assign cap0_wsiS_isReset_isInReset$EN = cap0_wsiS_isReset_isInReset ;
  // register cap0_wsiS_mesgWordLength
  assign cap0_wsiS_mesgWordLength$D_IN = cap0_wsiS_wordCount ;
  assign cap0_wsiS_mesgWordLength$EN =
	     WILL_FIRE_RL_cap0_wsiS_reqFifo_enq && cap0_wsiS_wsiReq$wget[57] ;
  // register cap0_wsiS_operateD
  assign cap0_wsiS_operateD$D_IN = cap0_wci_wslv_cState == 3'd2 ;
  assign cap0_wsiS_operateD$EN = 1'd1 ;
  // register cap0_wsiS_pMesgCount
  assign cap0_wsiS_pMesgCount$D_IN = cap0_wsiS_pMesgCount + 32'd1 ;
  assign cap0_wsiS_pMesgCount$EN =
	     WILL_FIRE_RL_cap0_wsiS_reqFifo_enq &&
	     cap0_wsiS_burstKind == 2'd1 &&
	     cap0_wsiS_wsiReq$wget[57] ;
  // register cap0_wsiS_peerIsReady
  assign cap0_wsiS_peerIsReady$D_IN = gbe0$wsiM0_MReset_n ;
  assign cap0_wsiS_peerIsReady$EN = 1'd1 ;
  // register cap0_wsiS_reqFifo_countReg
  assign cap0_wsiS_reqFifo_countReg$D_IN =
	     WILL_FIRE_RL_cap0_wsiS_reqFifo_enq ?
	       cap0_wsiS_reqFifo_countReg + 2'd1 :
	       cap0_wsiS_reqFifo_countReg - 2'd1 ;
  assign cap0_wsiS_reqFifo_countReg$EN =
	     WILL_FIRE_RL_cap0_wsiS_reqFifo_enq !=
	     WILL_FIRE_RL_cap0_doMessageAccept ;
  // register cap0_wsiS_reqFifo_levelsValid
  assign cap0_wsiS_reqFifo_levelsValid$D_IN =
	     WILL_FIRE_RL_cap0_wsiS_reqFifo_reset ;
  assign cap0_wsiS_reqFifo_levelsValid$EN =
	     WILL_FIRE_RL_cap0_doMessageAccept ||
	     WILL_FIRE_RL_cap0_wsiS_reqFifo_enq ||
	     WILL_FIRE_RL_cap0_wsiS_reqFifo_reset ;
  // register cap0_wsiS_statusR
  assign cap0_wsiS_statusR$D_IN =
	     { cap0_wsiS_isReset_isInReset,
	       !cap0_wsiS_peerIsReady,
	       !cap0_wsiS_operateD,
	       cap0_wsiS_errorSticky,
	       cap0_wsiS_burstKind != 2'd0,
	       !cap0_wsiS_sThreadBusy_dw$whas ||
	       cap0_wsiS_sThreadBusy_dw$wget,
	       1'd0,
	       cap0_wsiS_trafficSticky } ;
  assign cap0_wsiS_statusR$EN = 1'd1 ;
  // register cap0_wsiS_tBusyCount
  assign cap0_wsiS_tBusyCount$D_IN = cap0_wsiS_tBusyCount + 32'd1 ;
  assign cap0_wsiS_tBusyCount$EN =
	     cap0_wsiS_operateD && cap0_wsiS_peerIsReady &&
	     (!cap0_wsiS_sThreadBusy_dw$whas ||
	      cap0_wsiS_sThreadBusy_dw$wget) ;
  // register cap0_wsiS_trafficSticky
  assign cap0_wsiS_trafficSticky$D_IN = 1'd1 ;
  assign cap0_wsiS_trafficSticky$EN = WILL_FIRE_RL_cap0_wsiS_reqFifo_enq ;
  // register cap0_wsiS_wordCount
  assign cap0_wsiS_wordCount$D_IN =
	     cap0_wsiS_wsiReq$wget[57] ? 12'd1 : cap0_wsiS_wordCount + 12'd1 ;
  assign cap0_wsiS_wordCount$EN = WILL_FIRE_RL_cap0_wsiS_reqFifo_enq ;
  // register cap0_wtiS_isReset_isInReset
  assign cap0_wtiS_isReset_isInReset$D_IN = 1'd0 ;
  assign cap0_wtiS_isReset_isInReset$EN = cap0_wtiS_isReset_isInReset ;
  // register cap0_wtiS_nowReq
  assign cap0_wtiS_nowReq$D_IN = 67'd0 ;
  assign cap0_wtiS_nowReq$EN = 1'd1 ;
  // register cap0_wtiS_operateD
  assign cap0_wtiS_operateD$D_IN = 1'b1 ;
  assign cap0_wtiS_operateD$EN = 1'd1 ;
  // register freeCnt
  assign freeCnt$D_IN = freeCnt + 32'd1 ;
  assign freeCnt$EN = 1'd1 ;
  // register needs_init
  assign needs_init$D_IN = 1'd0 ;
  assign needs_init$EN = needs_init ;
  // register pciDevice
  assign pciDevice$D_IN = pciw_pciDevice ;
  assign pciDevice$EN = 1'd1 ;
  // register pciw_pciDevice
  assign pciw_pciDevice$D_IN =
	     { pciw_pci0_pcie_ep$cfg_bus_number,
	       pciw_pci0_pcie_ep$cfg_device_number,
	       pciw_pci0_pcie_ep$cfg_function_number } ;
  assign pciw_pciDevice$EN = 1'd1 ;
  // submodule cap0_dataBram_memory
  assign cap0_dataBram_memory$ADDRA = cap0_dataCount[9:0] ;
  assign cap0_dataBram_memory$ADDRB = cap0_wci_wslv_reqF$D_OUT[43:34] ;
  assign cap0_dataBram_memory$DIA = cap0_wsiS_reqFifo$D_OUT[43:12] ;
  assign cap0_dataBram_memory$DIB = 32'd0 ;
  assign cap0_dataBram_memory$WEA = 1'd1 ;
  assign cap0_dataBram_memory$WEB = 1'd0 ;
  assign cap0_dataBram_memory$ENA = MUX_cap0_dataCount$write_1__SEL_2 ;
  assign cap0_dataBram_memory$ENB =
	     WILL_FIRE_RL_cap0_dataBram_serverAdapterB_stageReadResponseAlways ;
  // submodule cap0_dataBram_serverAdapterA_outDataCore
  assign cap0_dataBram_serverAdapterA_outDataCore$D_IN =
	     cap0_dataBram_memory$DOA ;
  assign cap0_dataBram_serverAdapterA_outDataCore$ENQ =
	     cap0_dataBram_serverAdapterA_outDataCore$FULL_N &&
	     cap0_dataBram_serverAdapterA_outData_enqData$whas ;
  assign cap0_dataBram_serverAdapterA_outDataCore$DEQ = 1'b0 ;
  assign cap0_dataBram_serverAdapterA_outDataCore$CLR = 1'b0 ;
  // submodule cap0_dataBram_serverAdapterB_outDataCore
  assign cap0_dataBram_serverAdapterB_outDataCore$D_IN =
	     cap0_dataBram_memory$DOB ;
  assign cap0_dataBram_serverAdapterB_outDataCore$ENQ =
	     WILL_FIRE_RL_cap0_dataBram_serverAdapterB_outData_enqAndDeq ||
	     cap0_dataBram_serverAdapterB_outDataCore$FULL_N &&
	     !cap0_dataBram_serverAdapterB_outData_deqCalled$whas &&
	     cap0_dataBram_serverAdapterB_outData_enqData$whas ;
  assign cap0_dataBram_serverAdapterB_outDataCore$DEQ =
	     WILL_FIRE_RL_cap0_dataBram_serverAdapterB_outData_enqAndDeq ||
	     cap0_dataBram_serverAdapterB_outDataCore$EMPTY_N &&
	     cap0_dataBram_serverAdapterB_outData_deqCalled$whas &&
	     !cap0_dataBram_serverAdapterB_outData_enqData$whas ;
  assign cap0_dataBram_serverAdapterB_outDataCore$CLR = 1'b0 ;
  // submodule cap0_metaBram_memory
  assign cap0_metaBram_memory$ADDRA = cap0_metaCount[9:0] ;
  assign cap0_metaBram_memory$ADDRB = cap0_wci_wslv_reqF$D_OUT[45:36] ;
  assign cap0_metaBram_memory$DIA = { 18'd0, mlB__h34434 } ;
  assign cap0_metaBram_memory$DIB = 32'd0 ;
  assign cap0_metaBram_memory$WEA = 1'd1 ;
  assign cap0_metaBram_memory$WEB = 1'd0 ;
  assign cap0_metaBram_memory$ENA = MUX_cap0_metaCount$write_1__SEL_2 ;
  assign cap0_metaBram_memory$ENB =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_stageReadResponseAlways ;
  // submodule cap0_metaBram_memory_1
  assign cap0_metaBram_memory_1$ADDRA = cap0_metaCount[9:0] ;
  assign cap0_metaBram_memory_1$ADDRB = cap0_wci_wslv_reqF$D_OUT[45:36] ;
  assign cap0_metaBram_memory_1$DIA =
	     { 24'd0, cap0_wsiS_reqFifo$D_OUT[7:0] } ;
  assign cap0_metaBram_memory_1$DIB = 32'd0 ;
  assign cap0_metaBram_memory_1$WEA = 1'd1 ;
  assign cap0_metaBram_memory_1$WEB = 1'd0 ;
  assign cap0_metaBram_memory_1$ENA = MUX_cap0_metaCount$write_1__SEL_2 ;
  assign cap0_metaBram_memory_1$ENB =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_1_stageReadResponseAlways ;
  // submodule cap0_metaBram_memory_2
  assign cap0_metaBram_memory_2$ADDRA = cap0_metaCount[9:0] ;
  assign cap0_metaBram_memory_2$ADDRB = cap0_wci_wslv_reqF$D_OUT[45:36] ;
  assign cap0_metaBram_memory_2$DIA = cap0_nowW$wget[63:32] ;
  assign cap0_metaBram_memory_2$DIB = 32'd0 ;
  assign cap0_metaBram_memory_2$WEA = 1'd1 ;
  assign cap0_metaBram_memory_2$WEB = 1'd0 ;
  assign cap0_metaBram_memory_2$ENA = MUX_cap0_metaCount$write_1__SEL_2 ;
  assign cap0_metaBram_memory_2$ENB =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_2_stageReadResponseAlways ;
  // submodule cap0_metaBram_memory_3
  assign cap0_metaBram_memory_3$ADDRA = cap0_metaCount[9:0] ;
  assign cap0_metaBram_memory_3$ADDRB = cap0_wci_wslv_reqF$D_OUT[45:36] ;
  assign cap0_metaBram_memory_3$DIA = cap0_nowW$wget[31:0] ;
  assign cap0_metaBram_memory_3$DIB = 32'd0 ;
  assign cap0_metaBram_memory_3$WEA = 1'd1 ;
  assign cap0_metaBram_memory_3$WEB = 1'd0 ;
  assign cap0_metaBram_memory_3$ENA = MUX_cap0_metaCount$write_1__SEL_2 ;
  assign cap0_metaBram_memory_3$ENB =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_3_stageReadResponseAlways ;
  // submodule cap0_metaBram_serverAdapterA_1_outDataCore
  assign cap0_metaBram_serverAdapterA_1_outDataCore$D_IN =
	     cap0_metaBram_memory_1$DOA ;
  assign cap0_metaBram_serverAdapterA_1_outDataCore$ENQ =
	     cap0_metaBram_serverAdapterA_1_outDataCore$FULL_N &&
	     cap0_metaBram_serverAdapterA_1_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterA_1_outDataCore$DEQ = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_1_outDataCore$CLR = 1'b0 ;
  // submodule cap0_metaBram_serverAdapterA_2_outDataCore
  assign cap0_metaBram_serverAdapterA_2_outDataCore$D_IN =
	     cap0_metaBram_memory_2$DOA ;
  assign cap0_metaBram_serverAdapterA_2_outDataCore$ENQ =
	     cap0_metaBram_serverAdapterA_2_outDataCore$FULL_N &&
	     cap0_metaBram_serverAdapterA_2_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterA_2_outDataCore$DEQ = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_2_outDataCore$CLR = 1'b0 ;
  // submodule cap0_metaBram_serverAdapterA_3_outDataCore
  assign cap0_metaBram_serverAdapterA_3_outDataCore$D_IN =
	     cap0_metaBram_memory_3$DOA ;
  assign cap0_metaBram_serverAdapterA_3_outDataCore$ENQ =
	     cap0_metaBram_serverAdapterA_3_outDataCore$FULL_N &&
	     cap0_metaBram_serverAdapterA_3_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterA_3_outDataCore$DEQ = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_3_outDataCore$CLR = 1'b0 ;
  // submodule cap0_metaBram_serverAdapterA_outDataCore
  assign cap0_metaBram_serverAdapterA_outDataCore$D_IN =
	     cap0_metaBram_memory$DOA ;
  assign cap0_metaBram_serverAdapterA_outDataCore$ENQ =
	     cap0_metaBram_serverAdapterA_outDataCore$FULL_N &&
	     cap0_metaBram_serverAdapterA_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterA_outDataCore$DEQ = 1'b0 ;
  assign cap0_metaBram_serverAdapterA_outDataCore$CLR = 1'b0 ;
  // submodule cap0_metaBram_serverAdapterB_1_outDataCore
  assign cap0_metaBram_serverAdapterB_1_outDataCore$D_IN =
	     cap0_metaBram_memory_1$DOB ;
  assign cap0_metaBram_serverAdapterB_1_outDataCore$ENQ =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_1_outData_enqAndDeq ||
	     cap0_metaBram_serverAdapterB_1_outDataCore$FULL_N &&
	     !cap0_metaBram_serverAdapterB_1_outData_deqCalled$whas &&
	     cap0_metaBram_serverAdapterB_1_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterB_1_outDataCore$DEQ =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_1_outData_enqAndDeq ||
	     cap0_metaBram_serverAdapterB_1_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterB_1_outData_deqCalled$whas &&
	     !cap0_metaBram_serverAdapterB_1_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterB_1_outDataCore$CLR = 1'b0 ;
  // submodule cap0_metaBram_serverAdapterB_2_outDataCore
  assign cap0_metaBram_serverAdapterB_2_outDataCore$D_IN =
	     cap0_metaBram_memory_2$DOB ;
  assign cap0_metaBram_serverAdapterB_2_outDataCore$ENQ =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_2_outData_enqAndDeq ||
	     cap0_metaBram_serverAdapterB_2_outDataCore$FULL_N &&
	     !cap0_metaBram_serverAdapterB_2_outData_deqCalled$whas &&
	     cap0_metaBram_serverAdapterB_2_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterB_2_outDataCore$DEQ =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_2_outData_enqAndDeq ||
	     cap0_metaBram_serverAdapterB_2_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterB_2_outData_deqCalled$whas &&
	     !cap0_metaBram_serverAdapterB_2_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterB_2_outDataCore$CLR = 1'b0 ;
  // submodule cap0_metaBram_serverAdapterB_3_outDataCore
  assign cap0_metaBram_serverAdapterB_3_outDataCore$D_IN =
	     cap0_metaBram_memory_3$DOB ;
  assign cap0_metaBram_serverAdapterB_3_outDataCore$ENQ =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_3_outData_enqAndDeq ||
	     cap0_metaBram_serverAdapterB_3_outDataCore$FULL_N &&
	     !cap0_metaBram_serverAdapterB_3_outData_deqCalled$whas &&
	     cap0_metaBram_serverAdapterB_3_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterB_3_outDataCore$DEQ =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_3_outData_enqAndDeq ||
	     cap0_metaBram_serverAdapterB_3_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterB_3_outData_deqCalled$whas &&
	     !cap0_metaBram_serverAdapterB_3_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterB_3_outDataCore$CLR = 1'b0 ;
  // submodule cap0_metaBram_serverAdapterB_outDataCore
  assign cap0_metaBram_serverAdapterB_outDataCore$D_IN =
	     cap0_metaBram_memory$DOB ;
  assign cap0_metaBram_serverAdapterB_outDataCore$ENQ =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_outData_enqAndDeq ||
	     cap0_metaBram_serverAdapterB_outDataCore$FULL_N &&
	     !cap0_metaBram_serverAdapterB_outData_deqCalled$whas &&
	     cap0_metaBram_serverAdapterB_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterB_outDataCore$DEQ =
	     WILL_FIRE_RL_cap0_metaBram_serverAdapterB_outData_enqAndDeq ||
	     cap0_metaBram_serverAdapterB_outDataCore$EMPTY_N &&
	     cap0_metaBram_serverAdapterB_outData_deqCalled$whas &&
	     !cap0_metaBram_serverAdapterB_outData_enqData$whas ;
  assign cap0_metaBram_serverAdapterB_outDataCore$CLR = 1'b0 ;
  // submodule cap0_splaF
  assign cap0_splaF$D_IN =
	     (cap0_wci_wslv_reqF$D_OUT[63:52] == 12'h800) ?
	       3'd4 :
	       { 1'd0, cap0_wci_wslv_reqF$D_OUT[35:34] } ;
  assign cap0_splaF$ENQ = MUX_cap0_splitReadInFlight$write_1__SEL_1 ;
  assign cap0_splaF$DEQ = WILL_FIRE_RL_cap0_advance_split_response ;
  assign cap0_splaF$CLR = 1'b0 ;
  // submodule cap0_wci_wslv_reqF
  assign cap0_wci_wslv_reqF$D_IN = cap0_wci_wslv_wciReq$wget ;
  assign cap0_wci_wslv_reqF$ENQ = cap0_wci_wslv_wciReq$wget[71:69] != 3'd0 ;
  assign cap0_wci_wslv_reqF$DEQ = cap0_wci_wslv_reqF_r_deq$whas ;
  assign cap0_wci_wslv_reqF$CLR = 1'b0 ;
  // submodule cap0_wsiS_reqFifo
  assign cap0_wsiS_reqFifo$D_IN = cap0_wsiS_wsiReq$wget ;
  assign cap0_wsiS_reqFifo$ENQ = WILL_FIRE_RL_cap0_wsiS_reqFifo_enq ;
  assign cap0_wsiS_reqFifo$DEQ = WILL_FIRE_RL_cap0_doMessageAccept ;
  assign cap0_wsiS_reqFifo$CLR = 1'b0 ;
  // submodule ctop
  assign ctop$cpServer_request_put = 59'h0 ;
  assign ctop$gps_ppsSyncIn_x = 1'b0 ;
  assign ctop$server_request_put = pciw_fP2I$D_OUT ;
  assign ctop$switch_x = 3'h0 ;
  assign ctop$wci_m_0_SData = 32'h0 ;
  assign ctop$wci_m_0_SFlag = 2'h0 ;
  assign ctop$wci_m_0_SResp = 2'h0 ;
  assign ctop$wci_m_1_SData = 32'h0 ;
  assign ctop$wci_m_1_SFlag = 2'h0 ;
  assign ctop$wci_m_1_SResp = 2'h0 ;
  assign ctop$wci_m_2_SData = gbe0$wciS0_SData ;
  assign ctop$wci_m_2_SFlag = gbe0$wciS0_SFlag ;
  assign ctop$wci_m_2_SResp = gbe0$wciS0_SResp ;
  assign ctop$wci_m_3_SData = cap0_wci_wslv_respF_q_0[31:0] ;
  assign ctop$wci_m_3_SFlag = { 1'd1, cap0_wci_wslv_sFlagReg } ;
  assign ctop$wci_m_3_SResp = cap0_wci_wslv_respF_q_0[33:32] ;
  assign ctop$wci_m_4_SData = 32'h0 ;
  assign ctop$wci_m_4_SFlag = 2'h0 ;
  assign ctop$wci_m_4_SResp = 2'h0 ;
  assign ctop$wmemiM0_SData = 128'h0 ;
  assign ctop$wmemiM0_SResp = 2'h0 ;
  assign ctop$wsi_s_adc_MBurstLength = 12'h0 ;
  assign ctop$wsi_s_adc_MByteEn = 4'h0 ;
  assign ctop$wsi_s_adc_MCmd = 3'h0 ;
  assign ctop$wsi_s_adc_MData = 32'h0 ;
  assign ctop$wsi_s_adc_MReqInfo = 8'h0 ;
  assign ctop$EN_server_request_put =
	     ctop$RDY_server_request_put && pciw_fP2I$EMPTY_N ;
  assign ctop$EN_server_response_get =
	     ctop$RDY_server_response_get && pciw_fI2P$FULL_N ;
  assign ctop$EN_cpServer_request_put = 1'b0 ;
  assign ctop$EN_cpServer_response_get = 1'b0 ;
  assign ctop$wci_m_0_SThreadBusy = 1'b0 ;
  assign ctop$wci_m_1_SThreadBusy = 1'b0 ;
  assign ctop$wci_m_2_SThreadBusy = gbe0$wciS0_SThreadBusy ;
  assign ctop$wci_m_3_SThreadBusy =
	     cap0_wci_wslv_reqF_countReg > 2'd1 ||
	     cap0_wci_wslv_isReset_isInReset ;
  assign ctop$wci_m_4_SThreadBusy = 1'b0 ;
  assign ctop$wsi_s_adc_MReqLast = 1'b0 ;
  assign ctop$wsi_s_adc_MBurstPrecise = 1'b0 ;
  assign ctop$wsi_s_adc_MReset_n = 1'b0 ;
  assign ctop$wsi_m_dac_SThreadBusy = 1'b0 ;
  assign ctop$wsi_m_dac_SReset_n = 1'b0 ;
  assign ctop$wmemiM0_SRespLast = 1'b0 ;
  assign ctop$wmemiM0_SCmdAccept = 1'b0 ;
  assign ctop$wmemiM0_SDataAccept = 1'b0 ;
  // submodule gbe0
  assign gbe0$cpClient_response_put = 40'h0 ;
  assign gbe0$gmii_col_i = gmii_col_i ;
  assign gbe0$gmii_crs_i = gmii_crs_i ;
  assign gbe0$gmii_intr_i = gmii_intr_i ;
  assign gbe0$gmii_rx_rx_dv_i = gmii_rx_rx_dv_i ;
  assign gbe0$gmii_rx_rx_er_i = gmii_rx_rx_er_i ;
  assign gbe0$gmii_rx_rxd_i = gmii_rx_rxd_i ;
  assign gbe0$wciS0_MAddr = ctop$wci_m_2_MAddr ;
  assign gbe0$wciS0_MAddrSpace = ctop$wci_m_2_MAddrSpace ;
  assign gbe0$wciS0_MByteEn = ctop$wci_m_2_MByteEn ;
  assign gbe0$wciS0_MCmd = ctop$wci_m_2_MCmd ;
  assign gbe0$wciS0_MData = ctop$wci_m_2_MData ;
  assign gbe0$wciS0_MFlag = ctop$wci_m_2_MFlag ;
  assign gbe0$wsiS0_MBurstLength = 12'h0 ;
  assign gbe0$wsiS0_MByteEn = 4'h0 ;
  assign gbe0$wsiS0_MCmd = 3'h0 ;
  assign gbe0$wsiS0_MData = 32'h0 ;
  assign gbe0$wsiS0_MReqInfo = 8'h0 ;
  assign gbe0$wtiS0_req = 67'h0 ;
  assign gbe0$wsiM0_SThreadBusy =
	     !cap0_wsiS_sThreadBusy_dw$whas || cap0_wsiS_sThreadBusy_dw$wget ;
  assign gbe0$wsiM0_SReset_n =
	     !cap0_wsiS_isReset_isInReset && cap0_wsiS_operateD ;
  assign gbe0$wsiS0_MReqLast = 1'b0 ;
  assign gbe0$wsiS0_MBurstPrecise = 1'b0 ;
  assign gbe0$wsiS0_MReset_n = 1'b0 ;
  assign gbe0$EN_cpClient_request_get = 1'b0 ;
  assign gbe0$EN_cpClient_response_put = 1'b0 ;
  // submodule lcd_ctrl
  assign lcd_ctrl$setLine1_text = 128'h202073656C75522063696D6F74412020 ;
  assign lcd_ctrl$setLine2_text = 128'h20353037636B203A204950436E65704F ;
  assign lcd_ctrl$EN_setLine1 = needs_init ;
  assign lcd_ctrl$EN_setLine2 = needs_init ;
  // submodule pciw_fI2P
  assign pciw_fI2P$D_IN = ctop$server_response_get ;
  assign pciw_fI2P$ENQ = ctop$RDY_server_response_get && pciw_fI2P$FULL_N ;
  assign pciw_fI2P$DEQ = pciw_fI2P$EMPTY_N && pciw_pci0_txF$FULL_N ;
  assign pciw_fI2P$CLR = 1'b0 ;
  // submodule pciw_fP2I
  assign pciw_fP2I$D_IN = pciw_pci0_rxF$D_OUT ;
  assign pciw_fP2I$ENQ = pciw_pci0_rxF$EMPTY_N && pciw_fP2I$FULL_N ;
  assign pciw_fP2I$DEQ = ctop$RDY_server_request_put && pciw_fP2I$EMPTY_N ;
  assign pciw_fP2I$CLR = 1'b0 ;
  // submodule pciw_pci0_pcie_ep
  assign pciw_pci0_pcie_ep$PIPE_DCLK_IN = 1'b0 ;
  assign pciw_pci0_pcie_ep$PIPE_MMCM_LOCK_IN = 1'b0 ;
  assign pciw_pci0_pcie_ep$PIPE_OOBCLK_IN = 1'b0 ;
  assign pciw_pci0_pcie_ep$PIPE_PCLK_IN = 1'b0 ;
  assign pciw_pci0_pcie_ep$PIPE_RXOUTCLK_IN = 1'b0 ;
  assign pciw_pci0_pcie_ep$PIPE_RXUSRCLK_IN = 4'h0 ;
  assign pciw_pci0_pcie_ep$PIPE_USERCLK1_IN = 1'b0 ;
  assign pciw_pci0_pcie_ep$PIPE_USERCLK2_IN = 1'b0 ;
  assign pciw_pci0_pcie_ep$cfg_dsn = 64'h0 ;
  assign pciw_pci0_pcie_ep$cfg_err_acs = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_aer_headerlog = 128'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_atomic_egress_blocked = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_cor = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_cpl_abort = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_cpl_timeout = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_cpl_unexpect = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_ecrc = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_internal_cor = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_internal_uncor = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_locked = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_malformed = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_mc_blocked = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_norecovery = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_poisoned = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_posted = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_tlp_cpl_header = 48'd0 ;
  assign pciw_pci0_pcie_ep$cfg_err_ur = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_interrupt = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_interrupt_assert = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_interrupt_di = 8'd0 ;
  assign pciw_pci0_pcie_ep$cfg_interrupt_stat = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_mgmt_byte_en = 4'd0 ;
  assign pciw_pci0_pcie_ep$cfg_mgmt_di = 32'd0 ;
  assign pciw_pci0_pcie_ep$cfg_mgmt_dwaddr = 10'd0 ;
  assign pciw_pci0_pcie_ep$cfg_mgmt_rd_en = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_mgmt_wr_en = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_mgmt_wr_readonly = 1'd0 ;
  assign pciw_pci0_pcie_ep$cfg_pciecap_interrupt_msgnum = 5'd0 ;
  assign pciw_pci0_pcie_ep$cfg_pm_force_state = 2'h0 ;
  assign pciw_pci0_pcie_ep$cfg_pm_force_state_en = 1'b0 ;
  assign pciw_pci0_pcie_ep$cfg_pm_halt_aspm_l0s = 1'b0 ;
  assign pciw_pci0_pcie_ep$cfg_pm_halt_aspm_l1 = 1'b0 ;
  assign pciw_pci0_pcie_ep$cfg_pm_wake = 1'b0 ;
  assign pciw_pci0_pcie_ep$cfg_trn_pending = 1'b0 ;
  assign pciw_pci0_pcie_ep$cfg_turnoff_ok = 1'b0 ;
  assign pciw_pci0_pcie_ep$fc_sel = 3'd0 ;
  assign pciw_pci0_pcie_ep$m_axis_rx_tready = pciw_pci0_rxF$FULL_N ;
  assign pciw_pci0_pcie_ep$pci_exp_rxn = pcie_rxn_i ;
  assign pciw_pci0_pcie_ep$pci_exp_rxp = pcie_rxp_i ;
  assign pciw_pci0_pcie_ep$pl_directed_link_auton = 1'd0 ;
  assign pciw_pci0_pcie_ep$pl_directed_link_change = 2'd0 ;
  assign pciw_pci0_pcie_ep$pl_directed_link_speed = 1'd0 ;
  assign pciw_pci0_pcie_ep$pl_directed_link_width = 2'd0 ;
  assign pciw_pci0_pcie_ep$pl_upstream_prefer_deemph = 1'b1 ;
  assign pciw_pci0_pcie_ep$rx_np_ok = 1'd1 ;
  assign pciw_pci0_pcie_ep$rx_np_req = 1'd1 ;
  assign pciw_pci0_pcie_ep$s_axis_tx_tdata =
	     pciw_pci0_axiTxData$whas ? pciw_pci0_axiTxData$wget : 128'd0 ;
  assign pciw_pci0_pcie_ep$s_axis_tx_tkeep =
	     pciw_pci0_axiTxData$whas ? pciw_pci0_axiTxKeep$wget : 16'd0 ;
  assign pciw_pci0_pcie_ep$s_axis_tx_tlast =
	     pciw_pci0_axiTxData$whas && pciw_pci0_txF$D_OUT[151] ;
  assign pciw_pci0_pcie_ep$s_axis_tx_tuser = 4'd0 ;
  assign pciw_pci0_pcie_ep$s_axis_tx_tvalid = pciw_pci0_axiTxData$whas ;
  assign pciw_pci0_pcie_ep$tx_cfg_gnt = 1'd1 ;
  // submodule pciw_pci0_rxF
  assign pciw_pci0_rxF$D_IN =
	     { pciw_pci0_pcie_ep$m_axis_rx_tuser[14],
	       pciw_pci0_pcie_ep$m_axis_rx_tuser[21],
	       pciw_pci0_pcie_ep$m_axis_rx_tuser[8:2],
	       x_be__h1482,
	       x_data__h1483 } ;
  assign pciw_pci0_rxF$ENQ =
	     pciw_pci0_rxF$FULL_N && pciw_pci0_pcie_ep$m_axis_rx_tvalid ;
  assign pciw_pci0_rxF$DEQ = pciw_pci0_rxF$EMPTY_N && pciw_fP2I$FULL_N ;
  assign pciw_pci0_rxF$CLR = 1'b0 ;
  // submodule pciw_pci0_txF
  assign pciw_pci0_txF$D_IN = pciw_fI2P$D_OUT ;
  assign pciw_pci0_txF$ENQ = pciw_fI2P$EMPTY_N && pciw_pci0_txF$FULL_N ;
  assign pciw_pci0_txF$DEQ = pciw_pci0_axiTxData$whas ;
  assign pciw_pci0_txF$CLR = 1'b0 ;
  // remaining internal signals
  assign IF_cap0_splaF_first__027_BITS_1_TO_0_029_EQ_0__ETC___d1057 =
	     IF_cap0_splaF_first__027_BITS_1_TO_0_029_EQ_0__ETC___d1048 &&
	     CASE_cap0_splaFD_OUT_BITS_1_TO_0_NOT_cap0_spl_ETC__q2 ;
  assign IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291 =
	     pciw_pci0_pcie_ep$m_axis_rx_tuser[21] ?
	       CASE_pciw_pci0_pcie_epm_axis_rx_tuser_BITS_20_ETC__q1 :
	       16'd65535 ;
  assign NOT_cap0_controlReg_60_BIT_0_61_62_OR_cap0_con_ETC___d986 =
	     !cap0_controlReg[0] ||
	     cap0_controlReg[1] &&
	     (!cap0_metaCount_64_ULT_1024___d1257 ||
	      !cap0_dataCount_67_ULT_1024___d1378) ||
	     (cap0_dataBram_serverAdapterA_cnt ^ 3'h4) < 3'd7 &&
	     (!cap0_wsiS_reqFifo$D_OUT[57] ||
	      (cap0_metaBram_serverAdapterA_cnt ^ 3'h4) < 3'd7 &&
	      (cap0_metaBram_serverAdapterA_1_cnt ^ 3'h4) < 3'd7 &&
	      (cap0_metaBram_serverAdapterA_2_cnt ^ 3'h4) < 3'd7 &&
	      (cap0_metaBram_serverAdapterA_3_cnt ^ 3'h4) < 3'd7) ;
  assign cap0_controlReg_60_BIT_0_61_AND_NOT_cap0_contr_ETC___d1008 =
	     cap0_controlReg[0] &&
	     (!cap0_controlReg[1] ||
	      cap0_metaCount_64_ULT_1024___d1257 &&
	      cap0_dataCount_67_ULT_1024___d1378) ;
  assign cap0_dataBram_serverAdapterB_cnt_51_PLUS_IF_ca_ETC___d457 =
	     cap0_dataBram_serverAdapterB_cnt +
	     (WILL_FIRE_RL_cap0_dataBram_serverAdapterB_stageReadResponseAlways ?
		3'd1 :
		3'd0) +
	     (cap0_dataBram_serverAdapterB_outData_deqCalled$whas ?
		3'd7 :
		3'd0) ;
  assign cap0_dataCount_67_ULT_1024___d1378 = cap0_dataCount < 32'd1024 ;
  assign cap0_metaBram_serverAdapterB_1_cnt_87_PLUS_IF__ETC___d693 =
	     cap0_metaBram_serverAdapterB_1_cnt +
	     (WILL_FIRE_RL_cap0_metaBram_serverAdapterB_1_stageReadResponseAlways ?
		3'd1 :
		3'd0) +
	     (cap0_metaBram_serverAdapterB_1_outData_deqCalled$whas ?
		3'd7 :
		3'd0) ;
  assign cap0_metaBram_serverAdapterB_2_cnt_05_PLUS_IF__ETC___d811 =
	     cap0_metaBram_serverAdapterB_2_cnt +
	     (WILL_FIRE_RL_cap0_metaBram_serverAdapterB_2_stageReadResponseAlways ?
		3'd1 :
		3'd0) +
	     (cap0_metaBram_serverAdapterB_2_outData_deqCalled$whas ?
		3'd7 :
		3'd0) ;
  assign cap0_metaBram_serverAdapterB_3_cnt_23_PLUS_IF__ETC___d929 =
	     cap0_metaBram_serverAdapterB_3_cnt +
	     (WILL_FIRE_RL_cap0_metaBram_serverAdapterB_3_stageReadResponseAlways ?
		3'd1 :
		3'd0) +
	     (cap0_metaBram_serverAdapterB_3_outData_deqCalled$whas ?
		3'd7 :
		3'd0) ;
  assign cap0_metaBram_serverAdapterB_cnt_69_PLUS_IF_ca_ETC___d575 =
	     cap0_metaBram_serverAdapterB_cnt +
	     (WILL_FIRE_RL_cap0_metaBram_serverAdapterB_stageReadResponseAlways ?
		3'd1 :
		3'd0) +
	     (cap0_metaBram_serverAdapterB_outData_deqCalled$whas ?
		3'd7 :
		3'd0) ;
  assign cap0_metaCount_64_ULT_1024___d1257 = cap0_metaCount < 32'd1024 ;
  assign cap0_splaF_i_notEmpty__026_AND_IF_cap0_splaF_f_ETC___d1059 =
	     cap0_splaF$EMPTY_N &&
	     (cap0_splaF$D_OUT[2] ?
		(cap0_splaF$D_OUT[1:0] != 2'd0 ||
		 cap0_dataBram_serverAdapterB_outDataCore$EMPTY_N ||
		 cap0_dataBram_serverAdapterB_outData_enqData$whas) &&
		(cap0_splaF$D_OUT[1:0] != 2'd0 ||
		 cap0_dataBram_serverAdapterB_outData_outData$whas) :
		IF_cap0_splaF_first__027_BITS_1_TO_0_029_EQ_0__ETC___d1057) ;
  assign g_data__h39139 =
	     (cap0_wci_wslv_reqF$D_OUT[63:52] == 12'h0) ? v__h38064 : 32'd0 ;
  assign mlB__h34434 = cap0_mesgLengthSoFar + mlInc__h34433 ;
  assign mlInc__h34433 =
	     cap0_wsiS_reqFifo$D_OUT[57] ?
	       { 11'd0, x__h34482 + y__h34483 } :
	       14'd4 ;
  assign rdat___1__h38161 =
	     { 6'd40,
	       !cap0_metaCount_64_ULT_1024___d1257,
	       !cap0_dataCount_67_ULT_1024___d1378,
	       24'd2361866 } ;
  assign rdat___1__h38235 = { 24'd0, cap0_wsiS_statusR } ;
  assign v__h36664 =
	     cap0_splaF$D_OUT[2] ?
	       y_avValue__h37291 :
	       IF_cap0_splaF_first__027_BITS_1_TO_0_029_EQ_0__ETC___d1081 ;
  assign x__h34482 = x__h34494 + y__h34495 ;
  assign x__h34494 = x__h34506 + y__h34507 ;
  assign x__h34506 = { 2'd0, cap0_wsiS_reqFifo$D_OUT[11] } ;
  assign x_be__h1482 =
	     { IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[0],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[1],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[2],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[3],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[4],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[5],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[6],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[7],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[8],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[9],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[10],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[11],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[12],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[13],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[14],
	       IF_pciw_pci0_pcie_ep_axi_rx_tuser_BIT_21_THEN__ETC___d1291[15] } ;
  assign x_data__h1483 =
	     { pciw_pci0_pcie_ep$m_axis_rx_tdata[31:0],
	       pciw_pci0_pcie_ep$m_axis_rx_tdata[63:32],
	       pciw_pci0_pcie_ep$m_axis_rx_tdata[95:64],
	       pciw_pci0_pcie_ep$m_axis_rx_tdata[127:96] } ;
  assign y__h34483 = { 2'd0, cap0_wsiS_reqFifo$D_OUT[8] } ;
  assign y__h34495 = { 2'd0, cap0_wsiS_reqFifo$D_OUT[9] } ;
  assign y__h34507 = { 2'd0, cap0_wsiS_reqFifo$D_OUT[10] } ;
  assign y_avValue__h37291 =
	     cap0_dataBram_serverAdapterB_outDataCore$EMPTY_N ?
	       cap0_dataBram_serverAdapterB_outDataCore$D_OUT :
	       cap0_dataBram_memory$DOB ;
  assign y_avValue__h37335 =
	     cap0_metaBram_serverAdapterB_outDataCore$EMPTY_N ?
	       cap0_metaBram_serverAdapterB_outDataCore$D_OUT :
	       cap0_metaBram_memory$DOB ;
  assign y_avValue__h37375 =
	     cap0_metaBram_serverAdapterB_1_outDataCore$EMPTY_N ?
	       cap0_metaBram_serverAdapterB_1_outDataCore$D_OUT :
	       cap0_metaBram_memory_1$DOB ;
  assign y_avValue__h37415 =
	     cap0_metaBram_serverAdapterB_2_outDataCore$EMPTY_N ?
	       cap0_metaBram_serverAdapterB_2_outDataCore$D_OUT :
	       cap0_metaBram_memory_2$DOB ;
  assign y_avValue__h37455 =
	     cap0_metaBram_serverAdapterB_3_outDataCore$EMPTY_N ?
	       cap0_metaBram_serverAdapterB_3_outDataCore$D_OUT :
	       cap0_metaBram_memory_3$DOB ;
  always@(cap0_wci_wslv_reqF$D_OUT or
	  cap0_metaBram_serverAdapterB_3_cnt or
	  cap0_metaBram_serverAdapterB_cnt or
	  cap0_metaBram_serverAdapterB_1_cnt or
	  cap0_metaBram_serverAdapterB_2_cnt)
  begin
    case (cap0_wci_wslv_reqF$D_OUT[35:34])
      2'd0:
	  IF_cap0_wci_wslv_reqF_first__75_BITS_35_TO_34__ETC___d1124 =
	      (cap0_metaBram_serverAdapterB_cnt ^ 3'h4) < 3'd7;
      2'd1:
	  IF_cap0_wci_wslv_reqF_first__75_BITS_35_TO_34__ETC___d1124 =
	      (cap0_metaBram_serverAdapterB_1_cnt ^ 3'h4) < 3'd7;
      2'd2:
	  IF_cap0_wci_wslv_reqF_first__75_BITS_35_TO_34__ETC___d1124 =
	      (cap0_metaBram_serverAdapterB_2_cnt ^ 3'h4) < 3'd7;
      2'd3:
	  IF_cap0_wci_wslv_reqF_first__75_BITS_35_TO_34__ETC___d1124 =
	      cap0_wci_wslv_reqF$D_OUT[35:34] != 2'd3 ||
	      (cap0_metaBram_serverAdapterB_3_cnt ^ 3'h4) < 3'd7;
    endcase
  end
  always@(cap0_wci_wslv_reqF$D_OUT or
	  cap0_splaF$FULL_N or
	  IF_cap0_wci_wslv_reqF_first__75_BITS_35_TO_34__ETC___d1124 or
	  cap0_dataBram_serverAdapterB_cnt)
  begin
    case (cap0_wci_wslv_reqF$D_OUT[63:52])
      12'h0:
	  IF_cap0_wci_wslv_reqF_first__75_BITS_63_TO_52__ETC___d1128 = 1'b1;
      12'h800:
	  IF_cap0_wci_wslv_reqF_first__75_BITS_63_TO_52__ETC___d1128 =
	      (cap0_dataBram_serverAdapterB_cnt ^ 3'h4) < 3'd7 &&
	      cap0_splaF$FULL_N;
      default: IF_cap0_wci_wslv_reqF_first__75_BITS_63_TO_52__ETC___d1128 =
		   cap0_wci_wslv_reqF$D_OUT[63:52] != 12'h400 ||
		   cap0_splaF$FULL_N &&
		   IF_cap0_wci_wslv_reqF_first__75_BITS_35_TO_34__ETC___d1124;
    endcase
  end
  always@(cap0_splaF$D_OUT or
	  y_avValue__h37455 or
	  y_avValue__h37335 or y_avValue__h37375 or y_avValue__h37415)
  begin
    case (cap0_splaF$D_OUT[1:0])
      2'd0:
	  IF_cap0_splaF_first__027_BITS_1_TO_0_029_EQ_0__ETC___d1081 =
	      y_avValue__h37335;
      2'd1:
	  IF_cap0_splaF_first__027_BITS_1_TO_0_029_EQ_0__ETC___d1081 =
	      y_avValue__h37375;
      2'd2:
	  IF_cap0_splaF_first__027_BITS_1_TO_0_029_EQ_0__ETC___d1081 =
	      y_avValue__h37415;
      2'd3:
	  IF_cap0_splaF_first__027_BITS_1_TO_0_029_EQ_0__ETC___d1081 =
	      y_avValue__h37455;
    endcase
  end
  always@(pciw_pci0_pcie_ep$m_axis_rx_tuser)
  begin
    case (pciw_pci0_pcie_ep$m_axis_rx_tuser[20:19])
      2'd0: CASE_pciw_pci0_pcie_epm_axis_rx_tuser_BITS_20_ETC__q1 = 16'h000F;
      2'd1: CASE_pciw_pci0_pcie_epm_axis_rx_tuser_BITS_20_ETC__q1 = 16'h00FF;
      2'd2: CASE_pciw_pci0_pcie_epm_axis_rx_tuser_BITS_20_ETC__q1 = 16'h0FFF;
      2'd3: CASE_pciw_pci0_pcie_epm_axis_rx_tuser_BITS_20_ETC__q1 = 16'hFFFF;
    endcase
  end
  always@(cap0_wci_wslv_reqF$D_OUT or
	  cap0_controlReg or
	  cap0_metaCount or
	  cap0_dataCount or
	  rdat___1__h38161 or rdat___1__h38235 or cap0_wsiS_extStatusW$wget)
  begin
    case (cap0_wci_wslv_reqF$D_OUT[39:32])
      8'h0: v__h38064 = cap0_controlReg;
      8'h04: v__h38064 = cap0_metaCount;
      8'h08: v__h38064 = cap0_dataCount;
      8'h0C: v__h38064 = rdat___1__h38161;
      8'h10: v__h38064 = rdat___1__h38235;
      8'h14: v__h38064 = cap0_wsiS_extStatusW$wget[95:64];
      8'h18: v__h38064 = cap0_wsiS_extStatusW$wget[63:32];
      8'h1C: v__h38064 = cap0_wsiS_extStatusW$wget[31:0];
      default: v__h38064 = 32'd0;
    endcase
  end
  always@(cap0_splaF$D_OUT or
	  cap0_metaBram_serverAdapterB_3_outDataCore$EMPTY_N or
	  cap0_metaBram_serverAdapterB_3_outData_enqData$whas or
	  cap0_metaBram_serverAdapterB_outDataCore$EMPTY_N or
	  cap0_metaBram_serverAdapterB_outData_enqData$whas or
	  cap0_metaBram_serverAdapterB_1_outDataCore$EMPTY_N or
	  cap0_metaBram_serverAdapterB_1_outData_enqData$whas or
	  cap0_metaBram_serverAdapterB_2_outDataCore$EMPTY_N or
	  cap0_metaBram_serverAdapterB_2_outData_enqData$whas)
  begin
    case (cap0_splaF$D_OUT[1:0])
      2'd0:
	  IF_cap0_splaF_first__027_BITS_1_TO_0_029_EQ_0__ETC___d1048 =
	      cap0_metaBram_serverAdapterB_outDataCore$EMPTY_N ||
	      cap0_metaBram_serverAdapterB_outData_enqData$whas;
      2'd1:
	  IF_cap0_splaF_first__027_BITS_1_TO_0_029_EQ_0__ETC___d1048 =
	      cap0_metaBram_serverAdapterB_1_outDataCore$EMPTY_N ||
	      cap0_metaBram_serverAdapterB_1_outData_enqData$whas;
      2'd2:
	  IF_cap0_splaF_first__027_BITS_1_TO_0_029_EQ_0__ETC___d1048 =
	      cap0_metaBram_serverAdapterB_2_outDataCore$EMPTY_N ||
	      cap0_metaBram_serverAdapterB_2_outData_enqData$whas;
      2'd3:
	  IF_cap0_splaF_first__027_BITS_1_TO_0_029_EQ_0__ETC___d1048 =
	      cap0_splaF$D_OUT[1:0] != 2'd3 ||
	      cap0_metaBram_serverAdapterB_3_outDataCore$EMPTY_N ||
	      cap0_metaBram_serverAdapterB_3_outData_enqData$whas;
    endcase
  end
  always@(cap0_splaF$D_OUT or
	  cap0_metaBram_serverAdapterB_3_outData_outData$whas or
	  cap0_metaBram_serverAdapterB_outData_outData$whas or
	  cap0_metaBram_serverAdapterB_1_outData_outData$whas or
	  cap0_metaBram_serverAdapterB_2_outData_outData$whas)
  begin
    case (cap0_splaF$D_OUT[1:0])
      2'd0:
	  CASE_cap0_splaFD_OUT_BITS_1_TO_0_NOT_cap0_spl_ETC__q2 =
	      cap0_metaBram_serverAdapterB_outData_outData$whas;
      2'd1:
	  CASE_cap0_splaFD_OUT_BITS_1_TO_0_NOT_cap0_spl_ETC__q2 =
	      cap0_metaBram_serverAdapterB_1_outData_outData$whas;
      2'd2:
	  CASE_cap0_splaFD_OUT_BITS_1_TO_0_NOT_cap0_spl_ETC__q2 =
	      cap0_metaBram_serverAdapterB_2_outData_outData$whas;
      2'd3:
	  CASE_cap0_splaFD_OUT_BITS_1_TO_0_NOT_cap0_spl_ETC__q2 =
	      cap0_splaF$D_OUT[1:0] != 2'd3 ||
	      cap0_metaBram_serverAdapterB_3_outData_outData$whas;
    endcase
  end
  // handling of inlined registers
  always@(posedge sys0_clk$O)
  begin
    if (sys0_rst$OUT_RST == `BSV_RESET_VALUE)
      begin
        needs_init <= `BSV_ASSIGNMENT_DELAY 1'd1;
      end
    else
      begin
        if (needs_init$EN)
	  needs_init <= `BSV_ASSIGNMENT_DELAY needs_init$D_IN;
      end
  end
  always@(posedge pciw_pci0_pcie_ep$user_clk_out)
  begin
    if (ctop$RST_N_wci_m_3 == `BSV_RESET_VALUE)
      begin
        cap0_dataBram_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	cap0_dataBram_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	cap0_dataBram_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	cap0_dataBram_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	cap0_isFirst <= `BSV_ASSIGNMENT_DELAY 1'd1;
	cap0_mesgLengthSoFar <= `BSV_ASSIGNMENT_DELAY 14'd0;
	cap0_metaBram_serverAdapterA_1_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	cap0_metaBram_serverAdapterA_1_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	cap0_metaBram_serverAdapterA_2_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	cap0_metaBram_serverAdapterA_2_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	cap0_metaBram_serverAdapterA_3_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	cap0_metaBram_serverAdapterA_3_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	cap0_metaBram_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	cap0_metaBram_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	cap0_metaBram_serverAdapterB_1_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	cap0_metaBram_serverAdapterB_1_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	cap0_metaBram_serverAdapterB_2_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	cap0_metaBram_serverAdapterB_2_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	cap0_metaBram_serverAdapterB_3_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	cap0_metaBram_serverAdapterB_3_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	cap0_metaBram_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY 3'd0;
	cap0_metaBram_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	cap0_splitReadInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	cap0_wci_wslv_cEdge <= `BSV_ASSIGNMENT_DELAY 3'h2;
	cap0_wci_wslv_cState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	cap0_wci_wslv_ctlAckReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	cap0_wci_wslv_ctlOpActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	cap0_wci_wslv_illegalEdge <= `BSV_ASSIGNMENT_DELAY 1'd0;
	cap0_wci_wslv_nState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	cap0_wci_wslv_reqF_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	cap0_wci_wslv_respF_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	cap0_wci_wslv_respF_q_0 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	cap0_wci_wslv_respF_q_1 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	cap0_wci_wslv_sFlagReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	cap0_wci_wslv_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
	cap0_wsiS_burstKind <= `BSV_ASSIGNMENT_DELAY 2'd0;
	cap0_wsiS_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	cap0_wsiS_iMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	cap0_wsiS_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	cap0_wsiS_pMesgCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	cap0_wsiS_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	cap0_wsiS_reqFifo_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	cap0_wsiS_reqFifo_levelsValid <= `BSV_ASSIGNMENT_DELAY 1'd1;
	cap0_wsiS_tBusyCount <= `BSV_ASSIGNMENT_DELAY 32'd0;
	cap0_wsiS_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	cap0_wsiS_wordCount <= `BSV_ASSIGNMENT_DELAY 12'd1;
	cap0_wtiS_nowReq <= `BSV_ASSIGNMENT_DELAY 67'd0;
	cap0_wtiS_operateD <= `BSV_ASSIGNMENT_DELAY 1'd1;
      end
    else
      begin
        if (cap0_dataBram_serverAdapterA_cnt$EN)
	  cap0_dataBram_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY
	      cap0_dataBram_serverAdapterA_cnt$D_IN;
	if (cap0_dataBram_serverAdapterA_s1$EN)
	  cap0_dataBram_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY
	      cap0_dataBram_serverAdapterA_s1$D_IN;
	if (cap0_dataBram_serverAdapterB_cnt$EN)
	  cap0_dataBram_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY
	      cap0_dataBram_serverAdapterB_cnt$D_IN;
	if (cap0_dataBram_serverAdapterB_s1$EN)
	  cap0_dataBram_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY
	      cap0_dataBram_serverAdapterB_s1$D_IN;
	if (cap0_isFirst$EN)
	  cap0_isFirst <= `BSV_ASSIGNMENT_DELAY cap0_isFirst$D_IN;
	if (cap0_mesgLengthSoFar$EN)
	  cap0_mesgLengthSoFar <= `BSV_ASSIGNMENT_DELAY
	      cap0_mesgLengthSoFar$D_IN;
	if (cap0_metaBram_serverAdapterA_1_cnt$EN)
	  cap0_metaBram_serverAdapterA_1_cnt <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterA_1_cnt$D_IN;
	if (cap0_metaBram_serverAdapterA_1_s1$EN)
	  cap0_metaBram_serverAdapterA_1_s1 <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterA_1_s1$D_IN;
	if (cap0_metaBram_serverAdapterA_2_cnt$EN)
	  cap0_metaBram_serverAdapterA_2_cnt <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterA_2_cnt$D_IN;
	if (cap0_metaBram_serverAdapterA_2_s1$EN)
	  cap0_metaBram_serverAdapterA_2_s1 <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterA_2_s1$D_IN;
	if (cap0_metaBram_serverAdapterA_3_cnt$EN)
	  cap0_metaBram_serverAdapterA_3_cnt <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterA_3_cnt$D_IN;
	if (cap0_metaBram_serverAdapterA_3_s1$EN)
	  cap0_metaBram_serverAdapterA_3_s1 <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterA_3_s1$D_IN;
	if (cap0_metaBram_serverAdapterA_cnt$EN)
	  cap0_metaBram_serverAdapterA_cnt <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterA_cnt$D_IN;
	if (cap0_metaBram_serverAdapterA_s1$EN)
	  cap0_metaBram_serverAdapterA_s1 <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterA_s1$D_IN;
	if (cap0_metaBram_serverAdapterB_1_cnt$EN)
	  cap0_metaBram_serverAdapterB_1_cnt <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterB_1_cnt$D_IN;
	if (cap0_metaBram_serverAdapterB_1_s1$EN)
	  cap0_metaBram_serverAdapterB_1_s1 <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterB_1_s1$D_IN;
	if (cap0_metaBram_serverAdapterB_2_cnt$EN)
	  cap0_metaBram_serverAdapterB_2_cnt <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterB_2_cnt$D_IN;
	if (cap0_metaBram_serverAdapterB_2_s1$EN)
	  cap0_metaBram_serverAdapterB_2_s1 <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterB_2_s1$D_IN;
	if (cap0_metaBram_serverAdapterB_3_cnt$EN)
	  cap0_metaBram_serverAdapterB_3_cnt <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterB_3_cnt$D_IN;
	if (cap0_metaBram_serverAdapterB_3_s1$EN)
	  cap0_metaBram_serverAdapterB_3_s1 <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterB_3_s1$D_IN;
	if (cap0_metaBram_serverAdapterB_cnt$EN)
	  cap0_metaBram_serverAdapterB_cnt <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterB_cnt$D_IN;
	if (cap0_metaBram_serverAdapterB_s1$EN)
	  cap0_metaBram_serverAdapterB_s1 <= `BSV_ASSIGNMENT_DELAY
	      cap0_metaBram_serverAdapterB_s1$D_IN;
	if (cap0_splitReadInFlight$EN)
	  cap0_splitReadInFlight <= `BSV_ASSIGNMENT_DELAY
	      cap0_splitReadInFlight$D_IN;
	if (cap0_wci_wslv_cEdge$EN)
	  cap0_wci_wslv_cEdge <= `BSV_ASSIGNMENT_DELAY
	      cap0_wci_wslv_cEdge$D_IN;
	if (cap0_wci_wslv_cState$EN)
	  cap0_wci_wslv_cState <= `BSV_ASSIGNMENT_DELAY
	      cap0_wci_wslv_cState$D_IN;
	if (cap0_wci_wslv_ctlAckReg$EN)
	  cap0_wci_wslv_ctlAckReg <= `BSV_ASSIGNMENT_DELAY
	      cap0_wci_wslv_ctlAckReg$D_IN;
	if (cap0_wci_wslv_ctlOpActive$EN)
	  cap0_wci_wslv_ctlOpActive <= `BSV_ASSIGNMENT_DELAY
	      cap0_wci_wslv_ctlOpActive$D_IN;
	if (cap0_wci_wslv_illegalEdge$EN)
	  cap0_wci_wslv_illegalEdge <= `BSV_ASSIGNMENT_DELAY
	      cap0_wci_wslv_illegalEdge$D_IN;
	if (cap0_wci_wslv_nState$EN)
	  cap0_wci_wslv_nState <= `BSV_ASSIGNMENT_DELAY
	      cap0_wci_wslv_nState$D_IN;
	if (cap0_wci_wslv_reqF_countReg$EN)
	  cap0_wci_wslv_reqF_countReg <= `BSV_ASSIGNMENT_DELAY
	      cap0_wci_wslv_reqF_countReg$D_IN;
	if (cap0_wci_wslv_respF_c_r$EN)
	  cap0_wci_wslv_respF_c_r <= `BSV_ASSIGNMENT_DELAY
	      cap0_wci_wslv_respF_c_r$D_IN;
	if (cap0_wci_wslv_respF_q_0$EN)
	  cap0_wci_wslv_respF_q_0 <= `BSV_ASSIGNMENT_DELAY
	      cap0_wci_wslv_respF_q_0$D_IN;
	if (cap0_wci_wslv_respF_q_1$EN)
	  cap0_wci_wslv_respF_q_1 <= `BSV_ASSIGNMENT_DELAY
	      cap0_wci_wslv_respF_q_1$D_IN;
	if (cap0_wci_wslv_sFlagReg$EN)
	  cap0_wci_wslv_sFlagReg <= `BSV_ASSIGNMENT_DELAY
	      cap0_wci_wslv_sFlagReg$D_IN;
	if (cap0_wci_wslv_sThreadBusy_d$EN)
	  cap0_wci_wslv_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      cap0_wci_wslv_sThreadBusy_d$D_IN;
	if (cap0_wsiS_burstKind$EN)
	  cap0_wsiS_burstKind <= `BSV_ASSIGNMENT_DELAY
	      cap0_wsiS_burstKind$D_IN;
	if (cap0_wsiS_errorSticky$EN)
	  cap0_wsiS_errorSticky <= `BSV_ASSIGNMENT_DELAY
	      cap0_wsiS_errorSticky$D_IN;
	if (cap0_wsiS_iMesgCount$EN)
	  cap0_wsiS_iMesgCount <= `BSV_ASSIGNMENT_DELAY
	      cap0_wsiS_iMesgCount$D_IN;
	if (cap0_wsiS_operateD$EN)
	  cap0_wsiS_operateD <= `BSV_ASSIGNMENT_DELAY cap0_wsiS_operateD$D_IN;
	if (cap0_wsiS_pMesgCount$EN)
	  cap0_wsiS_pMesgCount <= `BSV_ASSIGNMENT_DELAY
	      cap0_wsiS_pMesgCount$D_IN;
	if (cap0_wsiS_peerIsReady$EN)
	  cap0_wsiS_peerIsReady <= `BSV_ASSIGNMENT_DELAY
	      cap0_wsiS_peerIsReady$D_IN;
	if (cap0_wsiS_reqFifo_countReg$EN)
	  cap0_wsiS_reqFifo_countReg <= `BSV_ASSIGNMENT_DELAY
	      cap0_wsiS_reqFifo_countReg$D_IN;
	if (cap0_wsiS_reqFifo_levelsValid$EN)
	  cap0_wsiS_reqFifo_levelsValid <= `BSV_ASSIGNMENT_DELAY
	      cap0_wsiS_reqFifo_levelsValid$D_IN;
	if (cap0_wsiS_tBusyCount$EN)
	  cap0_wsiS_tBusyCount <= `BSV_ASSIGNMENT_DELAY
	      cap0_wsiS_tBusyCount$D_IN;
	if (cap0_wsiS_trafficSticky$EN)
	  cap0_wsiS_trafficSticky <= `BSV_ASSIGNMENT_DELAY
	      cap0_wsiS_trafficSticky$D_IN;
	if (cap0_wsiS_wordCount$EN)
	  cap0_wsiS_wordCount <= `BSV_ASSIGNMENT_DELAY
	      cap0_wsiS_wordCount$D_IN;
	if (cap0_wtiS_nowReq$EN)
	  cap0_wtiS_nowReq <= `BSV_ASSIGNMENT_DELAY cap0_wtiS_nowReq$D_IN;
	if (cap0_wtiS_operateD$EN)
	  cap0_wtiS_operateD <= `BSV_ASSIGNMENT_DELAY cap0_wtiS_operateD$D_IN;
      end
    if (pciw_p125rst$OUT_RST == `BSV_RESET_VALUE)
      begin
        freeCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
	pciDevice <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pciw_pciDevice <= `BSV_ASSIGNMENT_DELAY 16'd0;
      end
    else
      begin
        if (freeCnt$EN) freeCnt <= `BSV_ASSIGNMENT_DELAY freeCnt$D_IN;
	if (pciDevice$EN) pciDevice <= `BSV_ASSIGNMENT_DELAY pciDevice$D_IN;
	if (pciw_pciDevice$EN)
	  pciw_pciDevice <= `BSV_ASSIGNMENT_DELAY pciw_pciDevice$D_IN;
      end
    if (cap0_controlReg$EN)
      cap0_controlReg <= `BSV_ASSIGNMENT_DELAY cap0_controlReg$D_IN;
    if (cap0_dataCount$EN)
      cap0_dataCount <= `BSV_ASSIGNMENT_DELAY cap0_dataCount$D_IN;
    if (cap0_metaCount$EN)
      cap0_metaCount <= `BSV_ASSIGNMENT_DELAY cap0_metaCount$D_IN;
    if (cap0_wsiS_mesgWordLength$EN)
      cap0_wsiS_mesgWordLength <= `BSV_ASSIGNMENT_DELAY
	  cap0_wsiS_mesgWordLength$D_IN;
    if (cap0_wsiS_statusR$EN)
      cap0_wsiS_statusR <= `BSV_ASSIGNMENT_DELAY cap0_wsiS_statusR$D_IN;
  end
  always@(posedge pciw_pci0_pcie_ep$user_clk_out or
	  `BSV_RESET_EDGE ctop$RST_N_wci_m_3)
  if (ctop$RST_N_wci_m_3 == `BSV_RESET_VALUE)
    begin
      cap0_wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      cap0_wsiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      cap0_wtiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (cap0_wci_wslv_isReset_isInReset$EN)
	cap0_wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    cap0_wci_wslv_isReset_isInReset$D_IN;
      if (cap0_wsiS_isReset_isInReset$EN)
	cap0_wsiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    cap0_wsiS_isReset_isInReset$D_IN;
      if (cap0_wtiS_isReset_isInReset$EN)
	cap0_wtiS_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    cap0_wtiS_isReset_isInReset$D_IN;
    end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cap0_controlReg = 32'hAAAAAAAA;
    cap0_dataBram_serverAdapterA_cnt = 3'h2;
    cap0_dataBram_serverAdapterA_s1 = 2'h2;
    cap0_dataBram_serverAdapterB_cnt = 3'h2;
    cap0_dataBram_serverAdapterB_s1 = 2'h2;
    cap0_dataCount = 32'hAAAAAAAA;
    cap0_isFirst = 1'h0;
    cap0_mesgLengthSoFar = 14'h2AAA;
    cap0_metaBram_serverAdapterA_1_cnt = 3'h2;
    cap0_metaBram_serverAdapterA_1_s1 = 2'h2;
    cap0_metaBram_serverAdapterA_2_cnt = 3'h2;
    cap0_metaBram_serverAdapterA_2_s1 = 2'h2;
    cap0_metaBram_serverAdapterA_3_cnt = 3'h2;
    cap0_metaBram_serverAdapterA_3_s1 = 2'h2;
    cap0_metaBram_serverAdapterA_cnt = 3'h2;
    cap0_metaBram_serverAdapterA_s1 = 2'h2;
    cap0_metaBram_serverAdapterB_1_cnt = 3'h2;
    cap0_metaBram_serverAdapterB_1_s1 = 2'h2;
    cap0_metaBram_serverAdapterB_2_cnt = 3'h2;
    cap0_metaBram_serverAdapterB_2_s1 = 2'h2;
    cap0_metaBram_serverAdapterB_3_cnt = 3'h2;
    cap0_metaBram_serverAdapterB_3_s1 = 2'h2;
    cap0_metaBram_serverAdapterB_cnt = 3'h2;
    cap0_metaBram_serverAdapterB_s1 = 2'h2;
    cap0_metaCount = 32'hAAAAAAAA;
    cap0_splitReadInFlight = 1'h0;
    cap0_wci_wslv_cEdge = 3'h2;
    cap0_wci_wslv_cState = 3'h2;
    cap0_wci_wslv_ctlAckReg = 1'h0;
    cap0_wci_wslv_ctlOpActive = 1'h0;
    cap0_wci_wslv_illegalEdge = 1'h0;
    cap0_wci_wslv_isReset_isInReset = 1'h0;
    cap0_wci_wslv_nState = 3'h2;
    cap0_wci_wslv_reqF_countReg = 2'h2;
    cap0_wci_wslv_respF_c_r = 2'h2;
    cap0_wci_wslv_respF_q_0 = 34'h2AAAAAAAA;
    cap0_wci_wslv_respF_q_1 = 34'h2AAAAAAAA;
    cap0_wci_wslv_sFlagReg = 1'h0;
    cap0_wci_wslv_sThreadBusy_d = 1'h0;
    cap0_wsiS_burstKind = 2'h2;
    cap0_wsiS_errorSticky = 1'h0;
    cap0_wsiS_iMesgCount = 32'hAAAAAAAA;
    cap0_wsiS_isReset_isInReset = 1'h0;
    cap0_wsiS_mesgWordLength = 12'hAAA;
    cap0_wsiS_operateD = 1'h0;
    cap0_wsiS_pMesgCount = 32'hAAAAAAAA;
    cap0_wsiS_peerIsReady = 1'h0;
    cap0_wsiS_reqFifo_countReg = 2'h2;
    cap0_wsiS_reqFifo_levelsValid = 1'h0;
    cap0_wsiS_statusR = 8'hAA;
    cap0_wsiS_tBusyCount = 32'hAAAAAAAA;
    cap0_wsiS_trafficSticky = 1'h0;
    cap0_wsiS_wordCount = 12'hAAA;
    cap0_wtiS_isReset_isInReset = 1'h0;
    cap0_wtiS_nowReq = 67'h2AAAAAAAAAAAAAAAA;
    cap0_wtiS_operateD = 1'h0;
    freeCnt = 32'hAAAAAAAA;
    needs_init = 1'h0;
    pciDevice = 16'hAAAA;
    pciw_pciDevice = 16'hAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge pciw_pci0_pcie_ep$user_clk_out)
  begin
    #0;
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_wslv_ctl_op_start)
	begin
	  v__h14804 = $time;
	  #0;
	end
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_wslv_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h14804,
		 cap0_wci_wslv_reqF$D_OUT[36:34],
		 cap0_wci_wslv_cState);
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_ctrl_EiI && WILL_FIRE_RL_cap0_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 48: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_cap0_wci_ctrl_EiI] and\n  [RL_cap0_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_ctrl_EiI && WILL_FIRE_RL_cap0_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 48: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_cap0_wci_ctrl_EiI] and\n  [RL_cap0_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_ctrl_IsO && WILL_FIRE_RL_cap0_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 62: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_cap0_wci_ctrl_IsO] and\n  [RL_cap0_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_cfrd &&
	  cap0_wci_wslv_reqF$D_OUT[63:52] == 12'h0)
	begin
	  v__h38083 = $time;
	  #0;
	end
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_cfrd &&
	  cap0_wci_wslv_reqF$D_OUT[63:52] == 12'h0)
	$display("[%0d]: %m: WCI CONFIG READ Addr:%0x BE:%0x Data:%0x",
		 v__h38083,
		 cap0_wci_wslv_reqF$D_OUT[63:32],
		 cap0_wci_wslv_reqF$D_OUT[67:64],
		 v__h38064);
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_doMessageAccept &&
	  cap0_controlReg_60_BIT_0_61_AND_NOT_cap0_contr_ETC___d1008 &&
	  cap0_wsiS_reqFifo$D_OUT[57])
	begin
	  v__h36538 = $time;
	  #0;
	end
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_doMessageAccept &&
	  cap0_controlReg_60_BIT_0_61_AND_NOT_cap0_contr_ETC___d1008 &&
	  cap0_wsiS_reqFifo$D_OUT[57])
	$display("[%0d]: %m: doMessageAccept DWM metaCount:%0x WSI opcode:%0x length:%0x",
		 v__h36538,
		 cap0_metaCount,
		 cap0_wsiS_reqFifo$D_OUT[7:0],
		 mlB__h34434);
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_cfwr)
	begin
	  v__h37878 = $time;
	  #0;
	end
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_cfwr)
	$display("[%0d]: %m: WCI CONFIG WRITE Addr:%0x BE:%0x Data:%0x",
		 v__h37878,
		 cap0_wci_wslv_reqF$D_OUT[63:32],
		 cap0_wci_wslv_reqF$D_OUT[67:64],
		 cap0_wci_wslv_reqF$D_OUT[31:0]);
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete &&
	  cap0_wci_wslv_illegalEdge)
	begin
	  v__h15123 = $time;
	  #0;
	end
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete &&
	  cap0_wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h15123,
		 cap0_wci_wslv_cEdge,
		 cap0_wci_wslv_cState);
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete &&
	  !cap0_wci_wslv_illegalEdge)
	begin
	  v__h14979 = $time;
	  #0;
	end
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_wslv_ctl_op_complete &&
	  !cap0_wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h14979,
		 cap0_wci_wslv_cEdge,
		 cap0_wci_wslv_cState,
		 cap0_wci_wslv_nState);
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (cap0_dataBram_serverAdapterA_s1[1] &&
	  !cap0_dataBram_serverAdapterA_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (cap0_dataBram_serverAdapterB_s1[1] &&
	  !cap0_dataBram_serverAdapterB_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (cap0_metaBram_serverAdapterA_s1[1] &&
	  !cap0_metaBram_serverAdapterA_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (cap0_metaBram_serverAdapterB_s1[1] &&
	  !cap0_metaBram_serverAdapterB_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (cap0_metaBram_serverAdapterA_1_s1[1] &&
	  !cap0_metaBram_serverAdapterA_1_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (cap0_metaBram_serverAdapterB_1_s1[1] &&
	  !cap0_metaBram_serverAdapterB_1_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (cap0_metaBram_serverAdapterA_2_s1[1] &&
	  !cap0_metaBram_serverAdapterA_2_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (cap0_metaBram_serverAdapterB_2_s1[1] &&
	  !cap0_metaBram_serverAdapterB_2_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (cap0_metaBram_serverAdapterA_3_s1[1] &&
	  !cap0_metaBram_serverAdapterA_3_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (cap0_metaBram_serverAdapterB_3_s1[1] &&
	  !cap0_metaBram_serverAdapterB_3_outDataCore$FULL_N)
	$display("ERROR: %m: mkBRAMSeverAdapter overrun");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_advance_split_response)
	begin
	  v__h37583 = $time;
	  #0;
	end
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_advance_split_response)
	$display("[%0d]: %m: WCI SPLIT READ Data:%0x", v__h37583, v__h36664);
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_advance_split_response &&
	  WILL_FIRE_RL_cap0_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 90: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_cap0_advance_split_response]\n  and [RL_cap0_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_advance_split_response &&
	  WILL_FIRE_RL_cap0_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 90: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_cap0_advance_split_response]\n  and [RL_cap0_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_advance_split_response &&
	  WILL_FIRE_RL_cap0_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 90: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_cap0_advance_split_response]\n  and [RL_cap0_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_cfwr &&
	  WILL_FIRE_RL_cap0_advance_split_response)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_cap0_wci_cfwr] and\n  [RL_cap0_advance_split_response] ) fired in the same clock cycle.\n");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_cfwr && WILL_FIRE_RL_cap0_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_cap0_wci_cfwr] and\n  [RL_cap0_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_cfwr && WILL_FIRE_RL_cap0_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_cap0_wci_cfwr] and\n  [RL_cap0_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_cfwr && WILL_FIRE_RL_cap0_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_cap0_wci_cfwr] and\n  [RL_cap0_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_cfwr && WILL_FIRE_RL_cap0_wci_cfrd)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_cap0_wci_cfwr] and\n  [RL_cap0_wci_cfrd] ) fired in the same clock cycle.\n");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_cfrd &&
	  WILL_FIRE_RL_cap0_advance_split_response)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_cap0_wci_cfrd] and\n  [RL_cap0_advance_split_response] ) fired in the same clock cycle.\n");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_cfrd && WILL_FIRE_RL_cap0_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_cap0_wci_cfrd] and\n  [RL_cap0_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_cfrd && WILL_FIRE_RL_cap0_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_cap0_wci_cfrd] and\n  [RL_cap0_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (ctop$RST_N_wci_m_3 != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_cap0_wci_cfrd && WILL_FIRE_RL_cap0_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/WSICaptureWorker.bsv\", line 157, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_cap0_wci_cfrd] and\n  [RL_cap0_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
  end
  // synopsys translate_on
endmodule