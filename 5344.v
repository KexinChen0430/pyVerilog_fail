module outputs
  wire [511 : 0] uuid;
  wire [127 : 0] wmemiM0_MData;
  wire [35 : 0] wmemiM0_MAddr;
  wire [31 : 0] wci_s_0_SData,
		wci_s_1_SData,
		wci_s_2_SData,
		wci_s_3_SData,
		wci_s_4_SData,
		wci_s_5_SData,
		wci_s_6_SData,
		wci_s_7_SData,
		wmiM0_MData,
		wmiM0_MFlag,
		wmiM1_MData,
		wmiM1_MFlag,
		wsi_m_dac_MData;
  wire [15 : 0] wmemiM0_MDataByteEn;
  wire [13 : 0] wmiM0_MAddr, wmiM1_MAddr;
  wire [11 : 0] wmemiM0_MBurstLength,
		wmiM0_MBurstLength,
		wmiM1_MBurstLength,
		wsi_m_dac_MBurstLength;
  wire [7 : 0] wsi_m_dac_MReqInfo;
  wire [3 : 0] wmiM0_MDataByteEn, wmiM1_MDataByteEn, wsi_m_dac_MByteEn;
  wire [2 : 0] wmemiM0_MCmd, wmiM0_MCmd, wmiM1_MCmd, wsi_m_dac_MCmd;
  wire [1 : 0] wci_s_0_SFlag,
	       wci_s_0_SResp,
	       wci_s_1_SFlag,
	       wci_s_1_SResp,
	       wci_s_2_SFlag,
	       wci_s_2_SResp,
	       wci_s_3_SFlag,
	       wci_s_3_SResp,
	       wci_s_4_SFlag,
	       wci_s_4_SResp,
	       wci_s_5_SFlag,
	       wci_s_5_SResp,
	       wci_s_6_SFlag,
	       wci_s_6_SResp,
	       wci_s_7_SFlag,
	       wci_s_7_SResp;
  wire wci_s_0_SThreadBusy,
       wci_s_1_SThreadBusy,
       wci_s_2_SThreadBusy,
       wci_s_3_SThreadBusy,
       wci_s_4_SThreadBusy,
       wci_s_5_SThreadBusy,
       wci_s_6_SThreadBusy,
       wci_s_7_SThreadBusy,
       wmemiM0_MDataLast,
       wmemiM0_MDataValid,
       wmemiM0_MReqLast,
       wmemiM0_MReset_n,
       wmiM0_MAddrSpace,
       wmiM0_MDataLast,
       wmiM0_MDataValid,
       wmiM0_MReqInfo,
       wmiM0_MReqLast,
       wmiM0_MReset_n,
       wmiM1_MAddrSpace,
       wmiM1_MDataLast,
       wmiM1_MDataValid,
       wmiM1_MReqInfo,
       wmiM1_MReqLast,
       wmiM1_MReset_n,
       wsi_m_dac_MBurstPrecise,
       wsi_m_dac_MReqLast,
       wsi_m_dac_MReset_n,
       wsi_s_adc_SReset_n,
       wsi_s_adc_SThreadBusy,
       wti_s_0_SReset_n,
       wti_s_0_SThreadBusy,
       wti_s_1_SReset_n,
       wti_s_1_SThreadBusy,
       wti_s_2_SReset_n,
       wti_s_2_SThreadBusy;
  // inlined wires
  wire [31 : 0] tieOff0_wci_Es_mAddr_w$wget,
		tieOff0_wci_Es_mData_w$wget,
		tieOff5_wci_Es_mAddr_w$wget,
		tieOff5_wci_Es_mData_w$wget,
		tieOff6_wci_Es_mAddr_w$wget,
		tieOff6_wci_Es_mData_w$wget,
		tieOff7_wci_Es_mAddr_w$wget,
		tieOff7_wci_Es_mData_w$wget;
  wire [3 : 0] tieOff0_wci_Es_mByteEn_w$wget,
	       tieOff5_wci_Es_mByteEn_w$wget,
	       tieOff6_wci_Es_mByteEn_w$wget,
	       tieOff7_wci_Es_mByteEn_w$wget;
  wire [2 : 0] tieOff0_wci_Es_mCmd_w$wget,
	       tieOff5_wci_Es_mCmd_w$wget,
	       tieOff6_wci_Es_mCmd_w$wget,
	       tieOff7_wci_Es_mCmd_w$wget;
  wire tieOff0_wci_Es_mAddrSpace_w$wget,
       tieOff0_wci_Es_mAddrSpace_w$whas,
       tieOff0_wci_Es_mAddr_w$whas,
       tieOff0_wci_Es_mByteEn_w$whas,
       tieOff0_wci_Es_mCmd_w$whas,
       tieOff0_wci_Es_mData_w$whas,
       tieOff5_wci_Es_mAddrSpace_w$wget,
       tieOff5_wci_Es_mAddrSpace_w$whas,
       tieOff5_wci_Es_mAddr_w$whas,
       tieOff5_wci_Es_mByteEn_w$whas,
       tieOff5_wci_Es_mCmd_w$whas,
       tieOff5_wci_Es_mData_w$whas,
       tieOff6_wci_Es_mAddrSpace_w$wget,
       tieOff6_wci_Es_mAddrSpace_w$whas,
       tieOff6_wci_Es_mAddr_w$whas,
       tieOff6_wci_Es_mByteEn_w$whas,
       tieOff6_wci_Es_mCmd_w$whas,
       tieOff6_wci_Es_mData_w$whas,
       tieOff7_wci_Es_mAddrSpace_w$wget,
       tieOff7_wci_Es_mAddrSpace_w$whas,
       tieOff7_wci_Es_mAddr_w$whas,
       tieOff7_wci_Es_mByteEn_w$whas,
       tieOff7_wci_Es_mCmd_w$whas,
       tieOff7_wci_Es_mData_w$whas;
  // ports of submodule appW1
  wire [127 : 0] appW1$wmemiM0_MData, appW1$wmemiM0_SData;
  wire [35 : 0] appW1$wmemiM0_MAddr;
  wire [31 : 0] appW1$wciS0_MAddr, appW1$wciS0_MData, appW1$wciS0_SData;
  wire [15 : 0] appW1$wmemiM0_MDataByteEn;
  wire [11 : 0] appW1$wmemiM0_MBurstLength;
  wire [3 : 0] appW1$wciS0_MByteEn;
  wire [2 : 0] appW1$wciS0_MCmd, appW1$wmemiM0_MCmd;
  wire [1 : 0] appW1$wciS0_MFlag,
	       appW1$wciS0_SFlag,
	       appW1$wciS0_SResp,
	       appW1$wmemiM0_SResp;
  wire appW1$wciS0_MAddrSpace,
       appW1$wciS0_SThreadBusy,
       appW1$wmemiM0_MDataLast,
       appW1$wmemiM0_MDataValid,
       appW1$wmemiM0_MReqLast,
       appW1$wmemiM0_MReset_n,
       appW1$wmemiM0_SCmdAccept,
       appW1$wmemiM0_SDataAccept,
       appW1$wmemiM0_SRespLast;
  // ports of submodule appW2
  wire [31 : 0] appW2$wciS0_MAddr,
		appW2$wciS0_MData,
		appW2$wciS0_SData,
		appW2$wmiM0_MData,
		appW2$wmiM0_MFlag,
		appW2$wmiM0_SData,
		appW2$wmiM0_SFlag,
		appW2$wsiM0_MData,
		appW2$wsiS0_MData;
  wire [13 : 0] appW2$wmiM0_MAddr;
  wire [11 : 0] appW2$wmiM0_MBurstLength,
		appW2$wsiM0_MBurstLength,
		appW2$wsiS0_MBurstLength;
  wire [7 : 0] appW2$wsiM0_MReqInfo, appW2$wsiS0_MReqInfo;
  wire [3 : 0] appW2$wciS0_MByteEn,
	       appW2$wmiM0_MDataByteEn,
	       appW2$wsiM0_MByteEn,
	       appW2$wsiS0_MByteEn;
  wire [2 : 0] appW2$wciS0_MCmd,
	       appW2$wmiM0_MCmd,
	       appW2$wsiM0_MCmd,
	       appW2$wsiS0_MCmd;
  wire [1 : 0] appW2$wciS0_MFlag,
	       appW2$wciS0_SFlag,
	       appW2$wciS0_SResp,
	       appW2$wmiM0_SResp;
  wire appW2$wciS0_MAddrSpace,
       appW2$wciS0_SThreadBusy,
       appW2$wmiM0_MAddrSpace,
       appW2$wmiM0_MDataLast,
       appW2$wmiM0_MDataValid,
       appW2$wmiM0_MReqInfo,
       appW2$wmiM0_MReqLast,
       appW2$wmiM0_MReset_n,
       appW2$wmiM0_SDataThreadBusy,
       appW2$wmiM0_SReset_n,
       appW2$wmiM0_SRespLast,
       appW2$wmiM0_SThreadBusy,
       appW2$wsiM0_MBurstPrecise,
       appW2$wsiM0_MReqLast,
       appW2$wsiM0_MReset_n,
       appW2$wsiM0_SReset_n,
       appW2$wsiM0_SThreadBusy,
       appW2$wsiS0_MBurstPrecise,
       appW2$wsiS0_MReqLast,
       appW2$wsiS0_MReset_n,
       appW2$wsiS0_SReset_n,
       appW2$wsiS0_SThreadBusy;
  // ports of submodule appW3
  wire [31 : 0] appW3$wciS0_MAddr,
		appW3$wciS0_MData,
		appW3$wciS0_SData,
		appW3$wsiM0_MData,
		appW3$wsiS0_MData;
  wire [11 : 0] appW3$wsiM0_MBurstLength, appW3$wsiS0_MBurstLength;
  wire [7 : 0] appW3$wsiM0_MReqInfo, appW3$wsiS0_MReqInfo;
  wire [3 : 0] appW3$wciS0_MByteEn, appW3$wsiM0_MByteEn, appW3$wsiS0_MByteEn;
  wire [2 : 0] appW3$wciS0_MCmd, appW3$wsiM0_MCmd, appW3$wsiS0_MCmd;
  wire [1 : 0] appW3$wciS0_MFlag, appW3$wciS0_SFlag, appW3$wciS0_SResp;
  wire appW3$wciS0_MAddrSpace,
       appW3$wciS0_SThreadBusy,
       appW3$wsiM0_MBurstPrecise,
       appW3$wsiM0_MReqLast,
       appW3$wsiM0_MReset_n,
       appW3$wsiM0_SReset_n,
       appW3$wsiM0_SThreadBusy,
       appW3$wsiS0_MBurstPrecise,
       appW3$wsiS0_MReqLast,
       appW3$wsiS0_MReset_n,
       appW3$wsiS0_SReset_n,
       appW3$wsiS0_SThreadBusy;
  // ports of submodule appW4
  wire [31 : 0] appW4$wciS0_MAddr,
		appW4$wciS0_MData,
		appW4$wciS0_SData,
		appW4$wmiM0_MData,
		appW4$wmiM0_MFlag,
		appW4$wmiM0_SData,
		appW4$wmiM0_SFlag,
		appW4$wsiM0_MData,
		appW4$wsiS0_MData;
  wire [13 : 0] appW4$wmiM0_MAddr;
  wire [11 : 0] appW4$wmiM0_MBurstLength,
		appW4$wsiM0_MBurstLength,
		appW4$wsiS0_MBurstLength;
  wire [7 : 0] appW4$wsiM0_MReqInfo, appW4$wsiS0_MReqInfo;
  wire [3 : 0] appW4$wciS0_MByteEn,
	       appW4$wmiM0_MDataByteEn,
	       appW4$wsiM0_MByteEn,
	       appW4$wsiS0_MByteEn;
  wire [2 : 0] appW4$wciS0_MCmd,
	       appW4$wmiM0_MCmd,
	       appW4$wsiM0_MCmd,
	       appW4$wsiS0_MCmd;
  wire [1 : 0] appW4$wciS0_MFlag,
	       appW4$wciS0_SFlag,
	       appW4$wciS0_SResp,
	       appW4$wmiM0_SResp;
  wire appW4$wciS0_MAddrSpace,
       appW4$wciS0_SThreadBusy,
       appW4$wmiM0_MAddrSpace,
       appW4$wmiM0_MDataLast,
       appW4$wmiM0_MDataValid,
       appW4$wmiM0_MReqInfo,
       appW4$wmiM0_MReqLast,
       appW4$wmiM0_MReset_n,
       appW4$wmiM0_SDataThreadBusy,
       appW4$wmiM0_SReset_n,
       appW4$wmiM0_SRespLast,
       appW4$wmiM0_SThreadBusy,
       appW4$wsiM0_MBurstPrecise,
       appW4$wsiM0_MReqLast,
       appW4$wsiM0_MReset_n,
       appW4$wsiM0_SReset_n,
       appW4$wsiM0_SThreadBusy,
       appW4$wsiS0_MBurstPrecise,
       appW4$wsiS0_MReqLast,
       appW4$wsiS0_MReset_n,
       appW4$wsiS0_SReset_n,
       appW4$wsiS0_SThreadBusy;
  // ports of submodule id
  wire [511 : 0] id$uuid;
  // value method wci_s_0_sResp
  assign wci_s_0_SResp = 2'd0 ;
  // value method wci_s_0_sData
  assign wci_s_0_SData = 32'hAAAAAAAA ;
  // value method wci_s_0_sThreadBusy
  assign wci_s_0_SThreadBusy = 1'd1 ;
  // value method wci_s_0_sFlag
  assign wci_s_0_SFlag = 2'b0 ;
  // value method wci_s_1_sResp
  assign wci_s_1_SResp = appW1$wciS0_SResp ;
  // value method wci_s_1_sData
  assign wci_s_1_SData = appW1$wciS0_SData ;
  // value method wci_s_1_sThreadBusy
  assign wci_s_1_SThreadBusy = appW1$wciS0_SThreadBusy ;
  // value method wci_s_1_sFlag
  assign wci_s_1_SFlag = appW1$wciS0_SFlag ;
  // value method wci_s_2_sResp
  assign wci_s_2_SResp = appW2$wciS0_SResp ;
  // value method wci_s_2_sData
  assign wci_s_2_SData = appW2$wciS0_SData ;
  // value method wci_s_2_sThreadBusy
  assign wci_s_2_SThreadBusy = appW2$wciS0_SThreadBusy ;
  // value method wci_s_2_sFlag
  assign wci_s_2_SFlag = appW2$wciS0_SFlag ;
  // value method wci_s_3_sResp
  assign wci_s_3_SResp = appW3$wciS0_SResp ;
  // value method wci_s_3_sData
  assign wci_s_3_SData = appW3$wciS0_SData ;
  // value method wci_s_3_sThreadBusy
  assign wci_s_3_SThreadBusy = appW3$wciS0_SThreadBusy ;
  // value method wci_s_3_sFlag
  assign wci_s_3_SFlag = appW3$wciS0_SFlag ;
  // value method wci_s_4_sResp
  assign wci_s_4_SResp = appW4$wciS0_SResp ;
  // value method wci_s_4_sData
  assign wci_s_4_SData = appW4$wciS0_SData ;
  // value method wci_s_4_sThreadBusy
  assign wci_s_4_SThreadBusy = appW4$wciS0_SThreadBusy ;
  // value method wci_s_4_sFlag
  assign wci_s_4_SFlag = appW4$wciS0_SFlag ;
  // value method wci_s_5_sResp
  assign wci_s_5_SResp = 2'd0 ;
  // value method wci_s_5_sData
  assign wci_s_5_SData = 32'hAAAAAAAA ;
  // value method wci_s_5_sThreadBusy
  assign wci_s_5_SThreadBusy = 1'd1 ;
  // value method wci_s_5_sFlag
  assign wci_s_5_SFlag = 2'b0 ;
  // value method wci_s_6_sResp
  assign wci_s_6_SResp = 2'd0 ;
  // value method wci_s_6_sData
  assign wci_s_6_SData = 32'hAAAAAAAA ;
  // value method wci_s_6_sThreadBusy
  assign wci_s_6_SThreadBusy = 1'd1 ;
  // value method wci_s_6_sFlag
  assign wci_s_6_SFlag = 2'b0 ;
  // value method wci_s_7_sResp
  assign wci_s_7_SResp = 2'd0 ;
  // value method wci_s_7_sData
  assign wci_s_7_SData = 32'hAAAAAAAA ;
  // value method wci_s_7_sThreadBusy
  assign wci_s_7_SThreadBusy = 1'd1 ;
  // value method wci_s_7_sFlag
  assign wci_s_7_SFlag = 2'b0 ;
  // value method wti_s_0_sThreadBusy
  assign wti_s_0_SThreadBusy = 1'h0 ;
  // value method wti_s_0_sReset_n
  assign wti_s_0_SReset_n = 1'h0 ;
  // value method wti_s_1_sThreadBusy
  assign wti_s_1_SThreadBusy = 1'h0 ;
  // value method wti_s_1_sReset_n
  assign wti_s_1_SReset_n = 1'h0 ;
  // value method wti_s_2_sThreadBusy
  assign wti_s_2_SThreadBusy = 1'h0 ;
  // value method wti_s_2_sReset_n
  assign wti_s_2_SReset_n = 1'h0 ;
  // value method wmiM0_mCmd
  assign wmiM0_MCmd = appW2$wmiM0_MCmd ;
  // value method wmiM0_mReqLast
  assign wmiM0_MReqLast = appW2$wmiM0_MReqLast ;
  // value method wmiM0_mReqInfo
  assign wmiM0_MReqInfo = appW2$wmiM0_MReqInfo ;
  // value method wmiM0_mAddrSpace
  assign wmiM0_MAddrSpace = appW2$wmiM0_MAddrSpace ;
  // value method wmiM0_mAddr
  assign wmiM0_MAddr = appW2$wmiM0_MAddr ;
  // value method wmiM0_mBurstLength
  assign wmiM0_MBurstLength = appW2$wmiM0_MBurstLength ;
  // value method wmiM0_mDataValid
  assign wmiM0_MDataValid = appW2$wmiM0_MDataValid ;
  // value method wmiM0_mDataLast
  assign wmiM0_MDataLast = appW2$wmiM0_MDataLast ;
  // value method wmiM0_mData
  assign wmiM0_MData = appW2$wmiM0_MData ;
  // value method wmiM0_mDataByteEn
  assign wmiM0_MDataByteEn = appW2$wmiM0_MDataByteEn ;
  // value method wmiM0_mFlag
  assign wmiM0_MFlag = appW2$wmiM0_MFlag ;
  // value method wmiM0_mReset_n
  assign wmiM0_MReset_n = appW2$wmiM0_MReset_n ;
  // value method wmiM1_mCmd
  assign wmiM1_MCmd = appW4$wmiM0_MCmd ;
  // value method wmiM1_mReqLast
  assign wmiM1_MReqLast = appW4$wmiM0_MReqLast ;
  // value method wmiM1_mReqInfo
  assign wmiM1_MReqInfo = appW4$wmiM0_MReqInfo ;
  // value method wmiM1_mAddrSpace
  assign wmiM1_MAddrSpace = appW4$wmiM0_MAddrSpace ;
  // value method wmiM1_mAddr
  assign wmiM1_MAddr = appW4$wmiM0_MAddr ;
  // value method wmiM1_mBurstLength
  assign wmiM1_MBurstLength = appW4$wmiM0_MBurstLength ;
  // value method wmiM1_mDataValid
  assign wmiM1_MDataValid = appW4$wmiM0_MDataValid ;
  // value method wmiM1_mDataLast
  assign wmiM1_MDataLast = appW4$wmiM0_MDataLast ;
  // value method wmiM1_mData
  assign wmiM1_MData = appW4$wmiM0_MData ;
  // value method wmiM1_mDataByteEn
  assign wmiM1_MDataByteEn = appW4$wmiM0_MDataByteEn ;
  // value method wmiM1_mFlag
  assign wmiM1_MFlag = appW4$wmiM0_MFlag ;
  // value method wmiM1_mReset_n
  assign wmiM1_MReset_n = appW4$wmiM0_MReset_n ;
  // value method wmemiM0_mCmd
  assign wmemiM0_MCmd = appW1$wmemiM0_MCmd ;
  // value method wmemiM0_mReqLast
  assign wmemiM0_MReqLast = appW1$wmemiM0_MReqLast ;
  // value method wmemiM0_mAddr
  assign wmemiM0_MAddr = appW1$wmemiM0_MAddr ;
  // value method wmemiM0_mBurstLength
  assign wmemiM0_MBurstLength = appW1$wmemiM0_MBurstLength ;
  // value method wmemiM0_mDataValid
  assign wmemiM0_MDataValid = appW1$wmemiM0_MDataValid ;
  // value method wmemiM0_mDataLast
  assign wmemiM0_MDataLast = appW1$wmemiM0_MDataLast ;
  // value method wmemiM0_mData
  assign wmemiM0_MData = appW1$wmemiM0_MData ;
  // value method wmemiM0_mDataByteEn
  assign wmemiM0_MDataByteEn = appW1$wmemiM0_MDataByteEn ;
  // value method wmemiM0_mReset_n
  assign wmemiM0_MReset_n = appW1$wmemiM0_MReset_n ;
  // value method wsi_s_adc_sThreadBusy
  assign wsi_s_adc_SThreadBusy = appW2$wsiS0_SThreadBusy ;
  // value method wsi_s_adc_sReset_n
  assign wsi_s_adc_SReset_n = appW2$wsiS0_SReset_n ;
  // value method wsi_m_dac_mCmd
  assign wsi_m_dac_MCmd = appW4$wsiM0_MCmd ;
  // value method wsi_m_dac_mReqLast
  assign wsi_m_dac_MReqLast = appW4$wsiM0_MReqLast ;
  // value method wsi_m_dac_mBurstPrecise
  assign wsi_m_dac_MBurstPrecise = appW4$wsiM0_MBurstPrecise ;
  // value method wsi_m_dac_mBurstLength
  assign wsi_m_dac_MBurstLength = appW4$wsiM0_MBurstLength ;
  // value method wsi_m_dac_mData
  assign wsi_m_dac_MData = appW4$wsiM0_MData ;
  // value method wsi_m_dac_mByteEn
  assign wsi_m_dac_MByteEn = appW4$wsiM0_MByteEn ;
  // value method wsi_m_dac_mReqInfo
  assign wsi_m_dac_MReqInfo = appW4$wsiM0_MReqInfo ;
  // value method wsi_m_dac_mReset_n
  assign wsi_m_dac_MReset_n = appW4$wsiM0_MReset_n ;
  // value method uuid
  assign uuid = id$uuid ;
  // submodule appW1
  mkMemiTestWorker #(.hasDebugLogic(hasDebugLogic)) appW1(.wciS0_Clk(CLK),
							  .wciS0_MReset_n(RST_N_rst_1),
							  .wciS0_MAddr(appW1$wciS0_MAddr),
							  .wciS0_MAddrSpace(appW1$wciS0_MAddrSpace),
							  .wciS0_MByteEn(appW1$wciS0_MByteEn),
							  .wciS0_MCmd(appW1$wciS0_MCmd),
							  .wciS0_MData(appW1$wciS0_MData),
							  .wciS0_MFlag(appW1$wciS0_MFlag),
							  .wmemiM0_SData(appW1$wmemiM0_SData),
							  .wmemiM0_SResp(appW1$wmemiM0_SResp),
							  .wmemiM0_SRespLast(appW1$wmemiM0_SRespLast),
							  .wmemiM0_SCmdAccept(appW1$wmemiM0_SCmdAccept),
							  .wmemiM0_SDataAccept(appW1$wmemiM0_SDataAccept),
							  .wciS0_SResp(appW1$wciS0_SResp),
							  .wciS0_SData(appW1$wciS0_SData),
							  .wciS0_SThreadBusy(appW1$wciS0_SThreadBusy),
							  .wciS0_SFlag(appW1$wciS0_SFlag),
							  .wmemiM0_MCmd(appW1$wmemiM0_MCmd),
							  .wmemiM0_MReqLast(appW1$wmemiM0_MReqLast),
							  .wmemiM0_MAddr(appW1$wmemiM0_MAddr),
							  .wmemiM0_MBurstLength(appW1$wmemiM0_MBurstLength),
							  .wmemiM0_MDataValid(appW1$wmemiM0_MDataValid),
							  .wmemiM0_MDataLast(appW1$wmemiM0_MDataLast),
							  .wmemiM0_MData(appW1$wmemiM0_MData),
							  .wmemiM0_MDataByteEn(appW1$wmemiM0_MDataByteEn),
							  .wmemiM0_MReset_n(appW1$wmemiM0_MReset_n));
  // submodule appW2
  mkSMAdapter4B #(.smaCtrlInit(32'h00000001),
		  .hasDebugLogic(hasDebugLogic)) appW2(.wciS0_Clk(CLK),
						       .wciS0_MReset_n(RST_N_rst_2),
						       .wciS0_MAddr(appW2$wciS0_MAddr),
						       .wciS0_MAddrSpace(appW2$wciS0_MAddrSpace),
						       .wciS0_MByteEn(appW2$wciS0_MByteEn),
						       .wciS0_MCmd(appW2$wciS0_MCmd),
						       .wciS0_MData(appW2$wciS0_MData),
						       .wciS0_MFlag(appW2$wciS0_MFlag),
						       .wmiM0_SData(appW2$wmiM0_SData),
						       .wmiM0_SFlag(appW2$wmiM0_SFlag),
						       .wmiM0_SResp(appW2$wmiM0_SResp),
						       .wsiS0_MBurstLength(appW2$wsiS0_MBurstLength),
						       .wsiS0_MByteEn(appW2$wsiS0_MByteEn),
						       .wsiS0_MCmd(appW2$wsiS0_MCmd),
						       .wsiS0_MData(appW2$wsiS0_MData),
						       .wsiS0_MReqInfo(appW2$wsiS0_MReqInfo),
						       .wmiM0_SThreadBusy(appW2$wmiM0_SThreadBusy),
						       .wmiM0_SDataThreadBusy(appW2$wmiM0_SDataThreadBusy),
						       .wmiM0_SRespLast(appW2$wmiM0_SRespLast),
						       .wmiM0_SReset_n(appW2$wmiM0_SReset_n),
						       .wsiM0_SThreadBusy(appW2$wsiM0_SThreadBusy),
						       .wsiM0_SReset_n(appW2$wsiM0_SReset_n),
						       .wsiS0_MReqLast(appW2$wsiS0_MReqLast),
						       .wsiS0_MBurstPrecise(appW2$wsiS0_MBurstPrecise),
						       .wsiS0_MReset_n(appW2$wsiS0_MReset_n),
						       .wciS0_SResp(appW2$wciS0_SResp),
						       .wciS0_SData(appW2$wciS0_SData),
						       .wciS0_SThreadBusy(appW2$wciS0_SThreadBusy),
						       .wciS0_SFlag(appW2$wciS0_SFlag),
						       .wmiM0_MCmd(appW2$wmiM0_MCmd),
						       .wmiM0_MReqLast(appW2$wmiM0_MReqLast),
						       .wmiM0_MReqInfo(appW2$wmiM0_MReqInfo),
						       .wmiM0_MAddrSpace(appW2$wmiM0_MAddrSpace),
						       .wmiM0_MAddr(appW2$wmiM0_MAddr),
						       .wmiM0_MBurstLength(appW2$wmiM0_MBurstLength),
						       .wmiM0_MDataValid(appW2$wmiM0_MDataValid),
						       .wmiM0_MDataLast(appW2$wmiM0_MDataLast),
						       .wmiM0_MData(appW2$wmiM0_MData),
						       .wmiM0_MDataByteEn(appW2$wmiM0_MDataByteEn),
						       .wmiM0_MFlag(appW2$wmiM0_MFlag),
						       .wmiM0_MReset_n(appW2$wmiM0_MReset_n),
						       .wsiM0_MCmd(appW2$wsiM0_MCmd),
						       .wsiM0_MReqLast(appW2$wsiM0_MReqLast),
						       .wsiM0_MBurstPrecise(appW2$wsiM0_MBurstPrecise),
						       .wsiM0_MBurstLength(appW2$wsiM0_MBurstLength),
						       .wsiM0_MData(appW2$wsiM0_MData),
						       .wsiM0_MByteEn(appW2$wsiM0_MByteEn),
						       .wsiM0_MReqInfo(appW2$wsiM0_MReqInfo),
						       .wsiM0_MReset_n(appW2$wsiM0_MReset_n),
						       .wsiS0_SThreadBusy(appW2$wsiS0_SThreadBusy),
						       .wsiS0_SReset_n(appW2$wsiS0_SReset_n));
  // submodule appW3
  mkBiasWorker4B #(.hasDebugLogic(hasDebugLogic)) appW3(.wciS0_Clk(CLK),
							.wciS0_MReset_n(RST_N_rst_3),
							.wciS0_MAddr(appW3$wciS0_MAddr),
							.wciS0_MAddrSpace(appW3$wciS0_MAddrSpace),
							.wciS0_MByteEn(appW3$wciS0_MByteEn),
							.wciS0_MCmd(appW3$wciS0_MCmd),
							.wciS0_MData(appW3$wciS0_MData),
							.wciS0_MFlag(appW3$wciS0_MFlag),
							.wsiS0_MBurstLength(appW3$wsiS0_MBurstLength),
							.wsiS0_MByteEn(appW3$wsiS0_MByteEn),
							.wsiS0_MCmd(appW3$wsiS0_MCmd),
							.wsiS0_MData(appW3$wsiS0_MData),
							.wsiS0_MReqInfo(appW3$wsiS0_MReqInfo),
							.wsiS0_MReqLast(appW3$wsiS0_MReqLast),
							.wsiS0_MBurstPrecise(appW3$wsiS0_MBurstPrecise),
							.wsiS0_MReset_n(appW3$wsiS0_MReset_n),
							.wsiM0_SThreadBusy(appW3$wsiM0_SThreadBusy),
							.wsiM0_SReset_n(appW3$wsiM0_SReset_n),
							.wciS0_SResp(appW3$wciS0_SResp),
							.wciS0_SData(appW3$wciS0_SData),
							.wciS0_SThreadBusy(appW3$wciS0_SThreadBusy),
							.wciS0_SFlag(appW3$wciS0_SFlag),
							.wsiS0_SThreadBusy(appW3$wsiS0_SThreadBusy),
							.wsiS0_SReset_n(appW3$wsiS0_SReset_n),
							.wsiM0_MCmd(appW3$wsiM0_MCmd),
							.wsiM0_MReqLast(appW3$wsiM0_MReqLast),
							.wsiM0_MBurstPrecise(appW3$wsiM0_MBurstPrecise),
							.wsiM0_MBurstLength(appW3$wsiM0_MBurstLength),
							.wsiM0_MData(appW3$wsiM0_MData),
							.wsiM0_MByteEn(appW3$wsiM0_MByteEn),
							.wsiM0_MReqInfo(appW3$wsiM0_MReqInfo),
							.wsiM0_MReset_n(appW3$wsiM0_MReset_n));
  // submodule appW4
  mkSMAdapter4B #(.smaCtrlInit(32'h00000002),
		  .hasDebugLogic(hasDebugLogic)) appW4(.wciS0_Clk(CLK),
						       .wciS0_MReset_n(RST_N_rst_4),
						       .wciS0_MAddr(appW4$wciS0_MAddr),
						       .wciS0_MAddrSpace(appW4$wciS0_MAddrSpace),
						       .wciS0_MByteEn(appW4$wciS0_MByteEn),
						       .wciS0_MCmd(appW4$wciS0_MCmd),
						       .wciS0_MData(appW4$wciS0_MData),
						       .wciS0_MFlag(appW4$wciS0_MFlag),
						       .wmiM0_SData(appW4$wmiM0_SData),
						       .wmiM0_SFlag(appW4$wmiM0_SFlag),
						       .wmiM0_SResp(appW4$wmiM0_SResp),
						       .wsiS0_MBurstLength(appW4$wsiS0_MBurstLength),
						       .wsiS0_MByteEn(appW4$wsiS0_MByteEn),
						       .wsiS0_MCmd(appW4$wsiS0_MCmd),
						       .wsiS0_MData(appW4$wsiS0_MData),
						       .wsiS0_MReqInfo(appW4$wsiS0_MReqInfo),
						       .wmiM0_SThreadBusy(appW4$wmiM0_SThreadBusy),
						       .wmiM0_SDataThreadBusy(appW4$wmiM0_SDataThreadBusy),
						       .wmiM0_SRespLast(appW4$wmiM0_SRespLast),
						       .wmiM0_SReset_n(appW4$wmiM0_SReset_n),
						       .wsiM0_SThreadBusy(appW4$wsiM0_SThreadBusy),
						       .wsiM0_SReset_n(appW4$wsiM0_SReset_n),
						       .wsiS0_MReqLast(appW4$wsiS0_MReqLast),
						       .wsiS0_MBurstPrecise(appW4$wsiS0_MBurstPrecise),
						       .wsiS0_MReset_n(appW4$wsiS0_MReset_n),
						       .wciS0_SResp(appW4$wciS0_SResp),
						       .wciS0_SData(appW4$wciS0_SData),
						       .wciS0_SThreadBusy(appW4$wciS0_SThreadBusy),
						       .wciS0_SFlag(appW4$wciS0_SFlag),
						       .wmiM0_MCmd(appW4$wmiM0_MCmd),
						       .wmiM0_MReqLast(appW4$wmiM0_MReqLast),
						       .wmiM0_MReqInfo(appW4$wmiM0_MReqInfo),
						       .wmiM0_MAddrSpace(appW4$wmiM0_MAddrSpace),
						       .wmiM0_MAddr(appW4$wmiM0_MAddr),
						       .wmiM0_MBurstLength(appW4$wmiM0_MBurstLength),
						       .wmiM0_MDataValid(appW4$wmiM0_MDataValid),
						       .wmiM0_MDataLast(appW4$wmiM0_MDataLast),
						       .wmiM0_MData(appW4$wmiM0_MData),
						       .wmiM0_MDataByteEn(appW4$wmiM0_MDataByteEn),
						       .wmiM0_MFlag(appW4$wmiM0_MFlag),
						       .wmiM0_MReset_n(appW4$wmiM0_MReset_n),
						       .wsiM0_MCmd(appW4$wsiM0_MCmd),
						       .wsiM0_MReqLast(appW4$wsiM0_MReqLast),
						       .wsiM0_MBurstPrecise(appW4$wsiM0_MBurstPrecise),
						       .wsiM0_MBurstLength(appW4$wsiM0_MBurstLength),
						       .wsiM0_MData(appW4$wsiM0_MData),
						       .wsiM0_MByteEn(appW4$wsiM0_MByteEn),
						       .wsiM0_MReqInfo(appW4$wsiM0_MReqInfo),
						       .wsiM0_MReset_n(appW4$wsiM0_MReset_n),
						       .wsiS0_SThreadBusy(appW4$wsiS0_SThreadBusy),
						       .wsiS0_SReset_n(appW4$wsiS0_SReset_n));
  // submodule id
  mkUUID id(.uuid(id$uuid));
  // inlined wires
  assign tieOff0_wci_Es_mCmd_w$wget = wci_s_0_MCmd ;
  assign tieOff0_wci_Es_mCmd_w$whas = 1'd1 ;
  assign tieOff0_wci_Es_mAddrSpace_w$wget = wci_s_0_MAddrSpace ;
  assign tieOff0_wci_Es_mAddrSpace_w$whas = 1'd1 ;
  assign tieOff0_wci_Es_mByteEn_w$wget = wci_s_0_MByteEn ;
  assign tieOff0_wci_Es_mByteEn_w$whas = 1'd1 ;
  assign tieOff0_wci_Es_mAddr_w$wget = wci_s_0_MAddr ;
  assign tieOff0_wci_Es_mAddr_w$whas = 1'd1 ;
  assign tieOff0_wci_Es_mData_w$wget = wci_s_0_MData ;
  assign tieOff0_wci_Es_mData_w$whas = 1'd1 ;
  assign tieOff5_wci_Es_mCmd_w$wget = wci_s_5_MCmd ;
  assign tieOff5_wci_Es_mCmd_w$whas = 1'd1 ;
  assign tieOff5_wci_Es_mAddrSpace_w$wget = wci_s_5_MAddrSpace ;
  assign tieOff5_wci_Es_mAddrSpace_w$whas = 1'd1 ;
  assign tieOff5_wci_Es_mByteEn_w$wget = wci_s_5_MByteEn ;
  assign tieOff5_wci_Es_mByteEn_w$whas = 1'd1 ;
  assign tieOff5_wci_Es_mAddr_w$wget = wci_s_5_MAddr ;
  assign tieOff5_wci_Es_mAddr_w$whas = 1'd1 ;
  assign tieOff5_wci_Es_mData_w$wget = wci_s_5_MData ;
  assign tieOff5_wci_Es_mData_w$whas = 1'd1 ;
  assign tieOff6_wci_Es_mCmd_w$wget = wci_s_6_MCmd ;
  assign tieOff6_wci_Es_mCmd_w$whas = 1'd1 ;
  assign tieOff6_wci_Es_mAddrSpace_w$wget = wci_s_6_MAddrSpace ;
  assign tieOff6_wci_Es_mAddrSpace_w$whas = 1'd1 ;
  assign tieOff6_wci_Es_mByteEn_w$wget = wci_s_6_MByteEn ;
  assign tieOff6_wci_Es_mByteEn_w$whas = 1'd1 ;
  assign tieOff6_wci_Es_mAddr_w$wget = wci_s_6_MAddr ;
  assign tieOff6_wci_Es_mAddr_w$whas = 1'd1 ;
  assign tieOff6_wci_Es_mData_w$wget = wci_s_6_MData ;
  assign tieOff6_wci_Es_mData_w$whas = 1'd1 ;
  assign tieOff7_wci_Es_mCmd_w$wget = wci_s_7_MCmd ;
  assign tieOff7_wci_Es_mCmd_w$whas = 1'd1 ;
  assign tieOff7_wci_Es_mAddrSpace_w$wget = wci_s_7_MAddrSpace ;
  assign tieOff7_wci_Es_mAddrSpace_w$whas = 1'd1 ;
  assign tieOff7_wci_Es_mByteEn_w$wget = wci_s_7_MByteEn ;
  assign tieOff7_wci_Es_mByteEn_w$whas = 1'd1 ;
  assign tieOff7_wci_Es_mAddr_w$wget = wci_s_7_MAddr ;
  assign tieOff7_wci_Es_mAddr_w$whas = 1'd1 ;
  assign tieOff7_wci_Es_mData_w$wget = wci_s_7_MData ;
  assign tieOff7_wci_Es_mData_w$whas = 1'd1 ;
  // submodule appW1
  assign appW1$wciS0_MAddr = wci_s_1_MAddr ;
  assign appW1$wciS0_MAddrSpace = wci_s_1_MAddrSpace ;
  assign appW1$wciS0_MByteEn = wci_s_1_MByteEn ;
  assign appW1$wciS0_MCmd = wci_s_1_MCmd ;
  assign appW1$wciS0_MData = wci_s_1_MData ;
  assign appW1$wciS0_MFlag = wci_s_1_MFlag ;
  assign appW1$wmemiM0_SData = wmemiM0_SData ;
  assign appW1$wmemiM0_SResp = wmemiM0_SResp ;
  assign appW1$wmemiM0_SRespLast = wmemiM0_SRespLast ;
  assign appW1$wmemiM0_SCmdAccept = wmemiM0_SCmdAccept ;
  assign appW1$wmemiM0_SDataAccept = wmemiM0_SDataAccept ;
  // submodule appW2
  assign appW2$wciS0_MAddr = wci_s_2_MAddr ;
  assign appW2$wciS0_MAddrSpace = wci_s_2_MAddrSpace ;
  assign appW2$wciS0_MByteEn = wci_s_2_MByteEn ;
  assign appW2$wciS0_MCmd = wci_s_2_MCmd ;
  assign appW2$wciS0_MData = wci_s_2_MData ;
  assign appW2$wciS0_MFlag = wci_s_2_MFlag ;
  assign appW2$wmiM0_SData = wmiM0_SData ;
  assign appW2$wmiM0_SFlag = wmiM0_SFlag ;
  assign appW2$wmiM0_SResp = wmiM0_SResp ;
  assign appW2$wsiS0_MBurstLength = wsi_s_adc_MBurstLength ;
  assign appW2$wsiS0_MByteEn = wsi_s_adc_MByteEn ;
  assign appW2$wsiS0_MCmd = wsi_s_adc_MCmd ;
  assign appW2$wsiS0_MData = wsi_s_adc_MData ;
  assign appW2$wsiS0_MReqInfo = wsi_s_adc_MReqInfo ;
  assign appW2$wmiM0_SThreadBusy = wmiM0_SThreadBusy ;
  assign appW2$wmiM0_SDataThreadBusy = wmiM0_SDataThreadBusy ;
  assign appW2$wmiM0_SRespLast = wmiM0_SRespLast ;
  assign appW2$wmiM0_SReset_n = wmiM0_SReset_n ;
  assign appW2$wsiM0_SThreadBusy = appW3$wsiS0_SThreadBusy ;
  assign appW2$wsiM0_SReset_n = appW3$wsiS0_SReset_n ;
  assign appW2$wsiS0_MReqLast = wsi_s_adc_MReqLast ;
  assign appW2$wsiS0_MBurstPrecise = wsi_s_adc_MBurstPrecise ;
  assign appW2$wsiS0_MReset_n = wsi_s_adc_MReset_n ;
  // submodule appW3
  assign appW3$wciS0_MAddr = wci_s_3_MAddr ;
  assign appW3$wciS0_MAddrSpace = wci_s_3_MAddrSpace ;
  assign appW3$wciS0_MByteEn = wci_s_3_MByteEn ;
  assign appW3$wciS0_MCmd = wci_s_3_MCmd ;
  assign appW3$wciS0_MData = wci_s_3_MData ;
  assign appW3$wciS0_MFlag = wci_s_3_MFlag ;
  assign appW3$wsiS0_MBurstLength = appW2$wsiM0_MBurstLength ;
  assign appW3$wsiS0_MByteEn = appW2$wsiM0_MByteEn ;
  assign appW3$wsiS0_MCmd = appW2$wsiM0_MCmd ;
  assign appW3$wsiS0_MData = appW2$wsiM0_MData ;
  assign appW3$wsiS0_MReqInfo = appW2$wsiM0_MReqInfo ;
  assign appW3$wsiS0_MReqLast = appW2$wsiM0_MReqLast ;
  assign appW3$wsiS0_MBurstPrecise = appW2$wsiM0_MBurstPrecise ;
  assign appW3$wsiS0_MReset_n = appW2$wsiM0_MReset_n ;
  assign appW3$wsiM0_SThreadBusy = appW4$wsiS0_SThreadBusy ;
  assign appW3$wsiM0_SReset_n = appW4$wsiS0_SReset_n ;
  // submodule appW4
  assign appW4$wciS0_MAddr = wci_s_4_MAddr ;
  assign appW4$wciS0_MAddrSpace = wci_s_4_MAddrSpace ;
  assign appW4$wciS0_MByteEn = wci_s_4_MByteEn ;
  assign appW4$wciS0_MCmd = wci_s_4_MCmd ;
  assign appW4$wciS0_MData = wci_s_4_MData ;
  assign appW4$wciS0_MFlag = wci_s_4_MFlag ;
  assign appW4$wmiM0_SData = wmiM1_SData ;
  assign appW4$wmiM0_SFlag = wmiM1_SFlag ;
  assign appW4$wmiM0_SResp = wmiM1_SResp ;
  assign appW4$wsiS0_MBurstLength = appW3$wsiM0_MBurstLength ;
  assign appW4$wsiS0_MByteEn = appW3$wsiM0_MByteEn ;
  assign appW4$wsiS0_MCmd = appW3$wsiM0_MCmd ;
  assign appW4$wsiS0_MData = appW3$wsiM0_MData ;
  assign appW4$wsiS0_MReqInfo = appW3$wsiM0_MReqInfo ;
  assign appW4$wmiM0_SThreadBusy = wmiM1_SThreadBusy ;
  assign appW4$wmiM0_SDataThreadBusy = wmiM1_SDataThreadBusy ;
  assign appW4$wmiM0_SRespLast = wmiM1_SRespLast ;
  assign appW4$wmiM0_SReset_n = wmiM1_SReset_n ;
  assign appW4$wsiM0_SThreadBusy = wsi_m_dac_SThreadBusy ;
  assign appW4$wsiM0_SReset_n = wsi_m_dac_SReset_n ;
  assign appW4$wsiS0_MReqLast = appW3$wsiM0_MReqLast ;
  assign appW4$wsiS0_MBurstPrecise = appW3$wsiM0_MBurstPrecise ;
  assign appW4$wsiS0_MReset_n = appW3$wsiM0_MReset_n ;
endmodule