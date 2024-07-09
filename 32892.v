module outputs
  wire [152 : 0] server_response_get;
  wire [127 : 0] wmemiM0_MData;
  wire [63 : 0] cpNow;
  wire [39 : 0] cpServer_response_get;
  wire [35 : 0] wmemiM0_MAddr;
  wire [31 : 0] wci_m_0_MAddr,
		wci_m_0_MData,
		wci_m_1_MAddr,
		wci_m_1_MData,
		wci_m_2_MAddr,
		wci_m_2_MData,
		wci_m_3_MAddr,
		wci_m_3_MData,
		wci_m_4_MAddr,
		wci_m_4_MData,
		wsi_m_dac_MData;
  wire [15 : 0] wmemiM0_MDataByteEn;
  wire [11 : 0] wmemiM0_MBurstLength, wsi_m_dac_MBurstLength;
  wire [7 : 0] wsi_m_dac_MReqInfo;
  wire [3 : 0] wci_m_0_MByteEn,
	       wci_m_1_MByteEn,
	       wci_m_2_MByteEn,
	       wci_m_3_MByteEn,
	       wci_m_4_MByteEn,
	       wsi_m_dac_MByteEn;
  wire [2 : 0] wci_m_0_MCmd,
	       wci_m_1_MCmd,
	       wci_m_2_MCmd,
	       wci_m_3_MCmd,
	       wci_m_4_MCmd,
	       wmemiM0_MCmd,
	       wsi_m_dac_MCmd;
  wire [1 : 0] led,
	       wci_m_0_MFlag,
	       wci_m_1_MFlag,
	       wci_m_2_MFlag,
	       wci_m_3_MFlag,
	       wci_m_4_MFlag;
  wire RDY_cpNow,
       RDY_cpServer_request_put,
       RDY_cpServer_response_get,
       RDY_server_request_put,
       RDY_server_response_get,
       RST_N_wci_m_0,
       RST_N_wci_m_1,
       RST_N_wci_m_2,
       RST_N_wci_m_3,
       RST_N_wci_m_4,
       gps_ppsSyncOut,
       wci_m_0_MAddrSpace,
       wci_m_1_MAddrSpace,
       wci_m_2_MAddrSpace,
       wci_m_3_MAddrSpace,
       wci_m_4_MAddrSpace,
       wmemiM0_MDataLast,
       wmemiM0_MDataValid,
       wmemiM0_MReqLast,
       wmemiM0_MReset_n,
       wsi_m_dac_MBurstPrecise,
       wsi_m_dac_MReqLast,
       wsi_m_dac_MReset_n,
       wsi_s_adc_SReset_n,
       wsi_s_adc_SThreadBusy;
  // inlined wires
  wire wtiM_0_peerIsReady_1$wget,
       wtiM_0_peerIsReady_1$whas,
       wtiM_0_sThreadBusy_pw$whas,
       wtiM_1_peerIsReady_1$wget,
       wtiM_1_peerIsReady_1$whas,
       wtiM_1_sThreadBusy_pw$whas,
       wtiM_2_peerIsReady_1$wget,
       wtiM_2_peerIsReady_1$whas,
       wtiM_2_sThreadBusy_pw$whas;
  // register wtiM_0_nowReq
  reg [66 : 0] wtiM_0_nowReq;
  wire [66 : 0] wtiM_0_nowReq$D_IN;
  wire wtiM_0_nowReq$EN;
  // register wtiM_0_peerIsReady
  reg wtiM_0_peerIsReady;
  wire wtiM_0_peerIsReady$D_IN, wtiM_0_peerIsReady$EN;
  // register wtiM_0_sThreadBusy_d
  reg wtiM_0_sThreadBusy_d;
  wire wtiM_0_sThreadBusy_d$D_IN, wtiM_0_sThreadBusy_d$EN;
  // register wtiM_1_nowReq
  reg [66 : 0] wtiM_1_nowReq;
  wire [66 : 0] wtiM_1_nowReq$D_IN;
  wire wtiM_1_nowReq$EN;
  // register wtiM_1_peerIsReady
  reg wtiM_1_peerIsReady;
  wire wtiM_1_peerIsReady$D_IN, wtiM_1_peerIsReady$EN;
  // register wtiM_1_sThreadBusy_d
  reg wtiM_1_sThreadBusy_d;
  wire wtiM_1_sThreadBusy_d$D_IN, wtiM_1_sThreadBusy_d$EN;
  // register wtiM_2_nowReq
  reg [66 : 0] wtiM_2_nowReq;
  wire [66 : 0] wtiM_2_nowReq$D_IN;
  wire wtiM_2_nowReq$EN;
  // register wtiM_2_peerIsReady
  reg wtiM_2_peerIsReady;
  wire wtiM_2_peerIsReady$D_IN, wtiM_2_peerIsReady$EN;
  // register wtiM_2_sThreadBusy_d
  reg wtiM_2_sThreadBusy_d;
  wire wtiM_2_sThreadBusy_d$D_IN, wtiM_2_sThreadBusy_d$EN;
  // ports of submodule app
  wire [511 : 0] app$uuid;
  wire [127 : 0] app$wmemiM0_MData, app$wmemiM0_SData;
  wire [63 : 0] app$wti_s_0_MData, app$wti_s_1_MData, app$wti_s_2_MData;
  wire [35 : 0] app$wmemiM0_MAddr;
  wire [31 : 0] app$wci_s_0_MAddr,
		app$wci_s_0_MData,
		app$wci_s_0_SData,
		app$wci_s_1_MAddr,
		app$wci_s_1_MData,
		app$wci_s_1_SData,
		app$wci_s_2_MAddr,
		app$wci_s_2_MData,
		app$wci_s_2_SData,
		app$wci_s_3_MAddr,
		app$wci_s_3_MData,
		app$wci_s_3_SData,
		app$wci_s_4_MAddr,
		app$wci_s_4_MData,
		app$wci_s_4_SData,
		app$wci_s_5_MAddr,
		app$wci_s_5_MData,
		app$wci_s_5_SData,
		app$wci_s_6_MAddr,
		app$wci_s_6_MData,
		app$wci_s_6_SData,
		app$wci_s_7_MAddr,
		app$wci_s_7_MData,
		app$wci_s_7_SData,
		app$wmiM0_MData,
		app$wmiM0_MFlag,
		app$wmiM0_SData,
		app$wmiM0_SFlag,
		app$wmiM1_MData,
		app$wmiM1_MFlag,
		app$wmiM1_SData,
		app$wmiM1_SFlag,
		app$wsi_s_adc_MData;
  wire [15 : 0] app$wmemiM0_MDataByteEn;
  wire [13 : 0] app$wmiM0_MAddr, app$wmiM1_MAddr;
  wire [11 : 0] app$wmemiM0_MBurstLength,
		app$wmiM0_MBurstLength,
		app$wmiM1_MBurstLength,
		app$wsi_s_adc_MBurstLength;
  wire [7 : 0] app$wsi_s_adc_MReqInfo;
  wire [3 : 0] app$wci_s_0_MByteEn,
	       app$wci_s_1_MByteEn,
	       app$wci_s_2_MByteEn,
	       app$wci_s_3_MByteEn,
	       app$wci_s_4_MByteEn,
	       app$wci_s_5_MByteEn,
	       app$wci_s_6_MByteEn,
	       app$wci_s_7_MByteEn,
	       app$wmiM0_MDataByteEn,
	       app$wmiM1_MDataByteEn,
	       app$wsi_s_adc_MByteEn;
  wire [2 : 0] app$wci_s_0_MCmd,
	       app$wci_s_1_MCmd,
	       app$wci_s_2_MCmd,
	       app$wci_s_3_MCmd,
	       app$wci_s_4_MCmd,
	       app$wci_s_5_MCmd,
	       app$wci_s_6_MCmd,
	       app$wci_s_7_MCmd,
	       app$wmemiM0_MCmd,
	       app$wmiM0_MCmd,
	       app$wmiM1_MCmd,
	       app$wsi_s_adc_MCmd,
	       app$wti_s_0_MCmd,
	       app$wti_s_1_MCmd,
	       app$wti_s_2_MCmd;
  wire [1 : 0] app$wci_s_0_MFlag,
	       app$wci_s_0_SFlag,
	       app$wci_s_0_SResp,
	       app$wci_s_1_MFlag,
	       app$wci_s_1_SFlag,
	       app$wci_s_1_SResp,
	       app$wci_s_2_MFlag,
	       app$wci_s_2_SFlag,
	       app$wci_s_2_SResp,
	       app$wci_s_3_MFlag,
	       app$wci_s_3_SFlag,
	       app$wci_s_3_SResp,
	       app$wci_s_4_MFlag,
	       app$wci_s_4_SFlag,
	       app$wci_s_4_SResp,
	       app$wci_s_5_MFlag,
	       app$wci_s_5_SFlag,
	       app$wci_s_5_SResp,
	       app$wci_s_6_MFlag,
	       app$wci_s_6_SFlag,
	       app$wci_s_6_SResp,
	       app$wci_s_7_MFlag,
	       app$wci_s_7_SFlag,
	       app$wci_s_7_SResp,
	       app$wmemiM0_SResp,
	       app$wmiM0_SResp,
	       app$wmiM1_SResp;
  wire app$wci_s_0_MAddrSpace,
       app$wci_s_0_SThreadBusy,
       app$wci_s_1_MAddrSpace,
       app$wci_s_1_SThreadBusy,
       app$wci_s_2_MAddrSpace,
       app$wci_s_2_SThreadBusy,
       app$wci_s_3_MAddrSpace,
       app$wci_s_3_SThreadBusy,
       app$wci_s_4_MAddrSpace,
       app$wci_s_4_SThreadBusy,
       app$wci_s_5_MAddrSpace,
       app$wci_s_5_SThreadBusy,
       app$wci_s_6_MAddrSpace,
       app$wci_s_6_SThreadBusy,
       app$wci_s_7_MAddrSpace,
       app$wci_s_7_SThreadBusy,
       app$wmemiM0_MDataLast,
       app$wmemiM0_MDataValid,
       app$wmemiM0_MReqLast,
       app$wmemiM0_MReset_n,
       app$wmemiM0_SCmdAccept,
       app$wmemiM0_SDataAccept,
       app$wmemiM0_SRespLast,
       app$wmiM0_MAddrSpace,
       app$wmiM0_MDataLast,
       app$wmiM0_MDataValid,
       app$wmiM0_MReqInfo,
       app$wmiM0_MReqLast,
       app$wmiM0_MReset_n,
       app$wmiM0_SDataThreadBusy,
       app$wmiM0_SReset_n,
       app$wmiM0_SRespLast,
       app$wmiM0_SThreadBusy,
       app$wmiM1_MAddrSpace,
       app$wmiM1_MDataLast,
       app$wmiM1_MDataValid,
       app$wmiM1_MReqInfo,
       app$wmiM1_MReqLast,
       app$wmiM1_MReset_n,
       app$wmiM1_SDataThreadBusy,
       app$wmiM1_SReset_n,
       app$wmiM1_SRespLast,
       app$wmiM1_SThreadBusy,
       app$wsi_m_dac_SReset_n,
       app$wsi_m_dac_SThreadBusy,
       app$wsi_s_adc_MBurstPrecise,
       app$wsi_s_adc_MReqLast,
       app$wsi_s_adc_MReset_n,
       app$wti_s_0_SReset_n,
       app$wti_s_0_SThreadBusy,
       app$wti_s_1_SReset_n,
       app$wti_s_1_SThreadBusy,
       app$wti_s_2_SReset_n,
       app$wti_s_2_SThreadBusy;
  // ports of submodule ctNow
  wire [63 : 0] ctNow$dD_OUT, ctNow$sD_IN;
  wire ctNow$sEN, ctNow$sRDY;
  // ports of submodule inf
  wire [511 : 0] inf$uuid_arg;
  wire [152 : 0] inf$server_request_put, inf$server_response_get;
  wire [63 : 0] inf$cpNow;
  wire [58 : 0] inf$cpServer_request_put;
  wire [39 : 0] inf$cpServer_response_get;
  wire [31 : 0] inf$wci_m_0_MAddr,
		inf$wci_m_0_MData,
		inf$wci_m_0_SData,
		inf$wci_m_10_MAddr,
		inf$wci_m_10_MData,
		inf$wci_m_10_SData,
		inf$wci_m_11_MAddr,
		inf$wci_m_11_MData,
		inf$wci_m_11_SData,
		inf$wci_m_12_MAddr,
		inf$wci_m_12_MData,
		inf$wci_m_12_SData,
		inf$wci_m_1_MAddr,
		inf$wci_m_1_MData,
		inf$wci_m_1_SData,
		inf$wci_m_2_MAddr,
		inf$wci_m_2_MData,
		inf$wci_m_2_SData,
		inf$wci_m_3_MAddr,
		inf$wci_m_3_MData,
		inf$wci_m_3_SData,
		inf$wci_m_4_MAddr,
		inf$wci_m_4_MData,
		inf$wci_m_4_SData,
		inf$wci_m_5_MAddr,
		inf$wci_m_5_MData,
		inf$wci_m_5_SData,
		inf$wci_m_6_MAddr,
		inf$wci_m_6_MData,
		inf$wci_m_6_SData,
		inf$wci_m_7_MAddr,
		inf$wci_m_7_MData,
		inf$wci_m_7_SData,
		inf$wci_m_8_MAddr,
		inf$wci_m_8_MData,
		inf$wci_m_8_SData,
		inf$wci_m_9_MAddr,
		inf$wci_m_9_MData,
		inf$wci_m_9_SData,
		inf$wmiDP0_MData,
		inf$wmiDP0_SData,
		inf$wmiDP0_SFlag,
		inf$wmiDP0_arg_mFlag,
		inf$wmiDP1_MData,
		inf$wmiDP1_SData,
		inf$wmiDP1_SFlag,
		inf$wmiDP1_arg_mFlag;
  wire [13 : 0] inf$wmiDP0_MAddr, inf$wmiDP1_MAddr;
  wire [11 : 0] inf$wmiDP0_MBurstLength, inf$wmiDP1_MBurstLength;
  wire [3 : 0] inf$wci_m_0_MByteEn,
	       inf$wci_m_10_MByteEn,
	       inf$wci_m_11_MByteEn,
	       inf$wci_m_12_MByteEn,
	       inf$wci_m_1_MByteEn,
	       inf$wci_m_2_MByteEn,
	       inf$wci_m_3_MByteEn,
	       inf$wci_m_4_MByteEn,
	       inf$wci_m_5_MByteEn,
	       inf$wci_m_6_MByteEn,
	       inf$wci_m_7_MByteEn,
	       inf$wci_m_8_MByteEn,
	       inf$wci_m_9_MByteEn,
	       inf$wmiDP0_MDataByteEn,
	       inf$wmiDP1_MDataByteEn;
  wire [2 : 0] inf$switch_x,
	       inf$wci_m_0_MCmd,
	       inf$wci_m_10_MCmd,
	       inf$wci_m_11_MCmd,
	       inf$wci_m_12_MCmd,
	       inf$wci_m_1_MCmd,
	       inf$wci_m_2_MCmd,
	       inf$wci_m_3_MCmd,
	       inf$wci_m_4_MCmd,
	       inf$wci_m_5_MCmd,
	       inf$wci_m_6_MCmd,
	       inf$wci_m_7_MCmd,
	       inf$wci_m_8_MCmd,
	       inf$wci_m_9_MCmd,
	       inf$wmiDP0_MCmd,
	       inf$wmiDP1_MCmd;
  wire [1 : 0] inf$led,
	       inf$wci_m_0_MFlag,
	       inf$wci_m_0_SFlag,
	       inf$wci_m_0_SResp,
	       inf$wci_m_10_MFlag,
	       inf$wci_m_10_SFlag,
	       inf$wci_m_10_SResp,
	       inf$wci_m_11_MFlag,
	       inf$wci_m_11_SFlag,
	       inf$wci_m_11_SResp,
	       inf$wci_m_12_MFlag,
	       inf$wci_m_12_SFlag,
	       inf$wci_m_12_SResp,
	       inf$wci_m_1_MFlag,
	       inf$wci_m_1_SFlag,
	       inf$wci_m_1_SResp,
	       inf$wci_m_2_MFlag,
	       inf$wci_m_2_SFlag,
	       inf$wci_m_2_SResp,
	       inf$wci_m_3_MFlag,
	       inf$wci_m_3_SFlag,
	       inf$wci_m_3_SResp,
	       inf$wci_m_4_MFlag,
	       inf$wci_m_4_SFlag,
	       inf$wci_m_4_SResp,
	       inf$wci_m_5_MFlag,
	       inf$wci_m_5_SFlag,
	       inf$wci_m_5_SResp,
	       inf$wci_m_6_MFlag,
	       inf$wci_m_6_SFlag,
	       inf$wci_m_6_SResp,
	       inf$wci_m_7_MFlag,
	       inf$wci_m_7_SFlag,
	       inf$wci_m_7_SResp,
	       inf$wci_m_8_MFlag,
	       inf$wci_m_8_SFlag,
	       inf$wci_m_8_SResp,
	       inf$wci_m_9_MFlag,
	       inf$wci_m_9_SFlag,
	       inf$wci_m_9_SResp,
	       inf$wmiDP0_SResp,
	       inf$wmiDP1_SResp;
  wire inf$EN_cpServer_request_put,
       inf$EN_cpServer_response_get,
       inf$EN_server_request_put,
       inf$EN_server_response_get,
       inf$RDY_cpServer_request_put,
       inf$RDY_cpServer_response_get,
       inf$RDY_server_request_put,
       inf$RDY_server_response_get,
       inf$RST_N_wci_m_0,
       inf$RST_N_wci_m_1,
       inf$RST_N_wci_m_10,
       inf$RST_N_wci_m_11,
       inf$RST_N_wci_m_12,
       inf$RST_N_wci_m_2,
       inf$RST_N_wci_m_3,
       inf$RST_N_wci_m_4,
       inf$RST_N_wci_m_5,
       inf$RST_N_wci_m_6,
       inf$RST_N_wci_m_7,
       inf$RST_N_wci_m_8,
       inf$RST_N_wci_m_9,
       inf$gps_ppsSyncIn_x,
       inf$gps_ppsSyncOut,
       inf$wci_m_0_MAddrSpace,
       inf$wci_m_0_SThreadBusy,
       inf$wci_m_10_MAddrSpace,
       inf$wci_m_10_SThreadBusy,
       inf$wci_m_11_MAddrSpace,
       inf$wci_m_11_SThreadBusy,
       inf$wci_m_12_MAddrSpace,
       inf$wci_m_12_SThreadBusy,
       inf$wci_m_1_MAddrSpace,
       inf$wci_m_1_SThreadBusy,
       inf$wci_m_2_MAddrSpace,
       inf$wci_m_2_SThreadBusy,
       inf$wci_m_3_MAddrSpace,
       inf$wci_m_3_SThreadBusy,
       inf$wci_m_4_MAddrSpace,
       inf$wci_m_4_SThreadBusy,
       inf$wci_m_5_MAddrSpace,
       inf$wci_m_5_SThreadBusy,
       inf$wci_m_6_MAddrSpace,
       inf$wci_m_6_SThreadBusy,
       inf$wci_m_7_MAddrSpace,
       inf$wci_m_7_SThreadBusy,
       inf$wci_m_8_MAddrSpace,
       inf$wci_m_8_SThreadBusy,
       inf$wci_m_9_MAddrSpace,
       inf$wci_m_9_SThreadBusy,
       inf$wmiDP0_MAddrSpace,
       inf$wmiDP0_MDataLast,
       inf$wmiDP0_MDataValid,
       inf$wmiDP0_MReqInfo,
       inf$wmiDP0_MReqLast,
       inf$wmiDP0_MReset_n,
       inf$wmiDP0_SDataThreadBusy,
       inf$wmiDP0_SReset_n,
       inf$wmiDP0_SRespLast,
       inf$wmiDP0_SThreadBusy,
       inf$wmiDP1_MAddrSpace,
       inf$wmiDP1_MDataLast,
       inf$wmiDP1_MDataValid,
       inf$wmiDP1_MReqInfo,
       inf$wmiDP1_MReqLast,
       inf$wmiDP1_MReset_n,
       inf$wmiDP1_SDataThreadBusy,
       inf$wmiDP1_SReset_n,
       inf$wmiDP1_SRespLast,
       inf$wmiDP1_SThreadBusy;
  // output resets
  assign RST_N_wci_m_0 = inf$RST_N_wci_m_8 ;
  assign RST_N_wci_m_1 = inf$RST_N_wci_m_9 ;
  assign RST_N_wci_m_2 = inf$RST_N_wci_m_10 ;
  assign RST_N_wci_m_3 = inf$RST_N_wci_m_11 ;
  assign RST_N_wci_m_4 = inf$RST_N_wci_m_12 ;
  // action method server_request_put
  assign RDY_server_request_put = inf$RDY_server_request_put ;
  // actionvalue method server_response_get
  assign server_response_get = inf$server_response_get ;
  assign RDY_server_response_get = inf$RDY_server_response_get ;
  // action method cpServer_request_put
  assign RDY_cpServer_request_put = inf$RDY_cpServer_request_put ;
  // actionvalue method cpServer_response_get
  assign cpServer_response_get = inf$cpServer_response_get ;
  assign RDY_cpServer_response_get = inf$RDY_cpServer_response_get ;
  // value method led
  assign led = inf$led ;
  // value method wci_m_0_mCmd
  assign wci_m_0_MCmd = inf$wci_m_8_MCmd ;
  // value method wci_m_0_mAddrSpace
  assign wci_m_0_MAddrSpace = inf$wci_m_8_MAddrSpace ;
  // value method wci_m_0_mByteEn
  assign wci_m_0_MByteEn = inf$wci_m_8_MByteEn ;
  // value method wci_m_0_mAddr
  assign wci_m_0_MAddr = inf$wci_m_8_MAddr ;
  // value method wci_m_0_mData
  assign wci_m_0_MData = inf$wci_m_8_MData ;
  // value method wci_m_0_mFlag
  assign wci_m_0_MFlag = inf$wci_m_8_MFlag ;
  // value method wci_m_1_mCmd
  assign wci_m_1_MCmd = inf$wci_m_9_MCmd ;
  // value method wci_m_1_mAddrSpace
  assign wci_m_1_MAddrSpace = inf$wci_m_9_MAddrSpace ;
  // value method wci_m_1_mByteEn
  assign wci_m_1_MByteEn = inf$wci_m_9_MByteEn ;
  // value method wci_m_1_mAddr
  assign wci_m_1_MAddr = inf$wci_m_9_MAddr ;
  // value method wci_m_1_mData
  assign wci_m_1_MData = inf$wci_m_9_MData ;
  // value method wci_m_1_mFlag
  assign wci_m_1_MFlag = inf$wci_m_9_MFlag ;
  // value method wci_m_2_mCmd
  assign wci_m_2_MCmd = inf$wci_m_10_MCmd ;
  // value method wci_m_2_mAddrSpace
  assign wci_m_2_MAddrSpace = inf$wci_m_10_MAddrSpace ;
  // value method wci_m_2_mByteEn
  assign wci_m_2_MByteEn = inf$wci_m_10_MByteEn ;
  // value method wci_m_2_mAddr
  assign wci_m_2_MAddr = inf$wci_m_10_MAddr ;
  // value method wci_m_2_mData
  assign wci_m_2_MData = inf$wci_m_10_MData ;
  // value method wci_m_2_mFlag
  assign wci_m_2_MFlag = inf$wci_m_10_MFlag ;
  // value method wci_m_3_mCmd
  assign wci_m_3_MCmd = inf$wci_m_11_MCmd ;
  // value method wci_m_3_mAddrSpace
  assign wci_m_3_MAddrSpace = inf$wci_m_11_MAddrSpace ;
  // value method wci_m_3_mByteEn
  assign wci_m_3_MByteEn = inf$wci_m_11_MByteEn ;
  // value method wci_m_3_mAddr
  assign wci_m_3_MAddr = inf$wci_m_11_MAddr ;
  // value method wci_m_3_mData
  assign wci_m_3_MData = inf$wci_m_11_MData ;
  // value method wci_m_3_mFlag
  assign wci_m_3_MFlag = inf$wci_m_11_MFlag ;
  // value method wci_m_4_mCmd
  assign wci_m_4_MCmd = inf$wci_m_12_MCmd ;
  // value method wci_m_4_mAddrSpace
  assign wci_m_4_MAddrSpace = inf$wci_m_12_MAddrSpace ;
  // value method wci_m_4_mByteEn
  assign wci_m_4_MByteEn = inf$wci_m_12_MByteEn ;
  // value method wci_m_4_mAddr
  assign wci_m_4_MAddr = inf$wci_m_12_MAddr ;
  // value method wci_m_4_mData
  assign wci_m_4_MData = inf$wci_m_12_MData ;
  // value method wci_m_4_mFlag
  assign wci_m_4_MFlag = inf$wci_m_12_MFlag ;
  // value method cpNow
  assign cpNow = inf$cpNow ;
  assign RDY_cpNow = 1'd1 ;
  // value method wsi_s_adc_sThreadBusy
  assign wsi_s_adc_SThreadBusy = 1'h0 ;
  // value method wsi_s_adc_sReset_n
  assign wsi_s_adc_SReset_n = 1'h0 ;
  // value method wsi_m_dac_mCmd
  assign wsi_m_dac_MCmd = 3'h2 ;
  // value method wsi_m_dac_mReqLast
  assign wsi_m_dac_MReqLast = 1'h0 ;
  // value method wsi_m_dac_mBurstPrecise
  assign wsi_m_dac_MBurstPrecise = 1'h0 ;
  // value method wsi_m_dac_mBurstLength
  assign wsi_m_dac_MBurstLength = 12'hAAA ;
  // value method wsi_m_dac_mData
  assign wsi_m_dac_MData = 32'hAAAAAAAA ;
  // value method wsi_m_dac_mByteEn
  assign wsi_m_dac_MByteEn = 4'hA ;
  // value method wsi_m_dac_mReqInfo
  assign wsi_m_dac_MReqInfo = 8'hAA ;
  // value method wsi_m_dac_mReset_n
  assign wsi_m_dac_MReset_n = 1'h0 ;
  // value method wmemiM0_mCmd
  assign wmemiM0_MCmd = app$wmemiM0_MCmd ;
  // value method wmemiM0_mReqLast
  assign wmemiM0_MReqLast = app$wmemiM0_MReqLast ;
  // value method wmemiM0_mAddr
  assign wmemiM0_MAddr = app$wmemiM0_MAddr ;
  // value method wmemiM0_mBurstLength
  assign wmemiM0_MBurstLength = app$wmemiM0_MBurstLength ;
  // value method wmemiM0_mDataValid
  assign wmemiM0_MDataValid = app$wmemiM0_MDataValid ;
  // value method wmemiM0_mDataLast
  assign wmemiM0_MDataLast = app$wmemiM0_MDataLast ;
  // value method wmemiM0_mData
  assign wmemiM0_MData = app$wmemiM0_MData ;
  // value method wmemiM0_mDataByteEn
  assign wmemiM0_MDataByteEn = app$wmemiM0_MDataByteEn ;
  // value method wmemiM0_mReset_n
  assign wmemiM0_MReset_n = app$wmemiM0_MReset_n ;
  // value method gps_ppsSyncOut
  assign gps_ppsSyncOut = inf$gps_ppsSyncOut ;
  // submodule app
  mkOCApp4B #(.hasDebugLogic(1'd1)) app(.RST_N_rst_0(inf$RST_N_wci_m_0),
					.RST_N_rst_1(inf$RST_N_wci_m_1),
					.RST_N_rst_2(inf$RST_N_wci_m_2),
					.RST_N_rst_3(inf$RST_N_wci_m_3),
					.RST_N_rst_4(inf$RST_N_wci_m_4),
					.RST_N_rst_5(inf$RST_N_wci_m_5),
					.RST_N_rst_6(inf$RST_N_wci_m_6),
					.RST_N_rst_7(inf$RST_N_wci_m_7),
					.CLK(CLK),
					.RST_N(RST_N),
					.wci_s_0_MAddr(app$wci_s_0_MAddr),
					.wci_s_0_MAddrSpace(app$wci_s_0_MAddrSpace),
					.wci_s_0_MByteEn(app$wci_s_0_MByteEn),
					.wci_s_0_MCmd(app$wci_s_0_MCmd),
					.wci_s_0_MData(app$wci_s_0_MData),
					.wci_s_0_MFlag(app$wci_s_0_MFlag),
					.wci_s_1_MAddr(app$wci_s_1_MAddr),
					.wci_s_1_MAddrSpace(app$wci_s_1_MAddrSpace),
					.wci_s_1_MByteEn(app$wci_s_1_MByteEn),
					.wci_s_1_MCmd(app$wci_s_1_MCmd),
					.wci_s_1_MData(app$wci_s_1_MData),
					.wci_s_1_MFlag(app$wci_s_1_MFlag),
					.wci_s_2_MAddr(app$wci_s_2_MAddr),
					.wci_s_2_MAddrSpace(app$wci_s_2_MAddrSpace),
					.wci_s_2_MByteEn(app$wci_s_2_MByteEn),
					.wci_s_2_MCmd(app$wci_s_2_MCmd),
					.wci_s_2_MData(app$wci_s_2_MData),
					.wci_s_2_MFlag(app$wci_s_2_MFlag),
					.wci_s_3_MAddr(app$wci_s_3_MAddr),
					.wci_s_3_MAddrSpace(app$wci_s_3_MAddrSpace),
					.wci_s_3_MByteEn(app$wci_s_3_MByteEn),
					.wci_s_3_MCmd(app$wci_s_3_MCmd),
					.wci_s_3_MData(app$wci_s_3_MData),
					.wci_s_3_MFlag(app$wci_s_3_MFlag),
					.wci_s_4_MAddr(app$wci_s_4_MAddr),
					.wci_s_4_MAddrSpace(app$wci_s_4_MAddrSpace),
					.wci_s_4_MByteEn(app$wci_s_4_MByteEn),
					.wci_s_4_MCmd(app$wci_s_4_MCmd),
					.wci_s_4_MData(app$wci_s_4_MData),
					.wci_s_4_MFlag(app$wci_s_4_MFlag),
					.wci_s_5_MAddr(app$wci_s_5_MAddr),
					.wci_s_5_MAddrSpace(app$wci_s_5_MAddrSpace),
					.wci_s_5_MByteEn(app$wci_s_5_MByteEn),
					.wci_s_5_MCmd(app$wci_s_5_MCmd),
					.wci_s_5_MData(app$wci_s_5_MData),
					.wci_s_5_MFlag(app$wci_s_5_MFlag),
					.wci_s_6_MAddr(app$wci_s_6_MAddr),
					.wci_s_6_MAddrSpace(app$wci_s_6_MAddrSpace),
					.wci_s_6_MByteEn(app$wci_s_6_MByteEn),
					.wci_s_6_MCmd(app$wci_s_6_MCmd),
					.wci_s_6_MData(app$wci_s_6_MData),
					.wci_s_6_MFlag(app$wci_s_6_MFlag),
					.wci_s_7_MAddr(app$wci_s_7_MAddr),
					.wci_s_7_MAddrSpace(app$wci_s_7_MAddrSpace),
					.wci_s_7_MByteEn(app$wci_s_7_MByteEn),
					.wci_s_7_MCmd(app$wci_s_7_MCmd),
					.wci_s_7_MData(app$wci_s_7_MData),
					.wci_s_7_MFlag(app$wci_s_7_MFlag),
					.wmemiM0_SData(app$wmemiM0_SData),
					.wmemiM0_SResp(app$wmemiM0_SResp),
					.wmiM0_SData(app$wmiM0_SData),
					.wmiM0_SFlag(app$wmiM0_SFlag),
					.wmiM0_SResp(app$wmiM0_SResp),
					.wmiM1_SData(app$wmiM1_SData),
					.wmiM1_SFlag(app$wmiM1_SFlag),
					.wmiM1_SResp(app$wmiM1_SResp),
					.wsi_s_adc_MBurstLength(app$wsi_s_adc_MBurstLength),
					.wsi_s_adc_MByteEn(app$wsi_s_adc_MByteEn),
					.wsi_s_adc_MCmd(app$wsi_s_adc_MCmd),
					.wsi_s_adc_MData(app$wsi_s_adc_MData),
					.wsi_s_adc_MReqInfo(app$wsi_s_adc_MReqInfo),
					.wti_s_0_MCmd(app$wti_s_0_MCmd),
					.wti_s_0_MData(app$wti_s_0_MData),
					.wti_s_1_MCmd(app$wti_s_1_MCmd),
					.wti_s_1_MData(app$wti_s_1_MData),
					.wti_s_2_MCmd(app$wti_s_2_MCmd),
					.wti_s_2_MData(app$wti_s_2_MData),
					.wmiM0_SThreadBusy(app$wmiM0_SThreadBusy),
					.wmiM0_SDataThreadBusy(app$wmiM0_SDataThreadBusy),
					.wmiM0_SRespLast(app$wmiM0_SRespLast),
					.wmiM0_SReset_n(app$wmiM0_SReset_n),
					.wmiM1_SThreadBusy(app$wmiM1_SThreadBusy),
					.wmiM1_SDataThreadBusy(app$wmiM1_SDataThreadBusy),
					.wmiM1_SRespLast(app$wmiM1_SRespLast),
					.wmiM1_SReset_n(app$wmiM1_SReset_n),
					.wmemiM0_SRespLast(app$wmemiM0_SRespLast),
					.wmemiM0_SCmdAccept(app$wmemiM0_SCmdAccept),
					.wmemiM0_SDataAccept(app$wmemiM0_SDataAccept),
					.wsi_s_adc_MReqLast(app$wsi_s_adc_MReqLast),
					.wsi_s_adc_MBurstPrecise(app$wsi_s_adc_MBurstPrecise),
					.wsi_s_adc_MReset_n(app$wsi_s_adc_MReset_n),
					.wsi_m_dac_SThreadBusy(app$wsi_m_dac_SThreadBusy),
					.wsi_m_dac_SReset_n(app$wsi_m_dac_SReset_n),
					.wci_s_0_SResp(app$wci_s_0_SResp),
					.wci_s_0_SData(app$wci_s_0_SData),
					.wci_s_0_SThreadBusy(app$wci_s_0_SThreadBusy),
					.wci_s_0_SFlag(app$wci_s_0_SFlag),
					.wci_s_1_SResp(app$wci_s_1_SResp),
					.wci_s_1_SData(app$wci_s_1_SData),
					.wci_s_1_SThreadBusy(app$wci_s_1_SThreadBusy),
					.wci_s_1_SFlag(app$wci_s_1_SFlag),
					.wci_s_2_SResp(app$wci_s_2_SResp),
					.wci_s_2_SData(app$wci_s_2_SData),
					.wci_s_2_SThreadBusy(app$wci_s_2_SThreadBusy),
					.wci_s_2_SFlag(app$wci_s_2_SFlag),
					.wci_s_3_SResp(app$wci_s_3_SResp),
					.wci_s_3_SData(app$wci_s_3_SData),
					.wci_s_3_SThreadBusy(app$wci_s_3_SThreadBusy),
					.wci_s_3_SFlag(app$wci_s_3_SFlag),
					.wci_s_4_SResp(app$wci_s_4_SResp),
					.wci_s_4_SData(app$wci_s_4_SData),
					.wci_s_4_SThreadBusy(app$wci_s_4_SThreadBusy),
					.wci_s_4_SFlag(app$wci_s_4_SFlag),
					.wci_s_5_SResp(app$wci_s_5_SResp),
					.wci_s_5_SData(app$wci_s_5_SData),
					.wci_s_5_SThreadBusy(app$wci_s_5_SThreadBusy),
					.wci_s_5_SFlag(app$wci_s_5_SFlag),
					.wci_s_6_SResp(app$wci_s_6_SResp),
					.wci_s_6_SData(app$wci_s_6_SData),
					.wci_s_6_SThreadBusy(app$wci_s_6_SThreadBusy),
					.wci_s_6_SFlag(app$wci_s_6_SFlag),
					.wci_s_7_SResp(app$wci_s_7_SResp),
					.wci_s_7_SData(app$wci_s_7_SData),
					.wci_s_7_SThreadBusy(app$wci_s_7_SThreadBusy),
					.wci_s_7_SFlag(app$wci_s_7_SFlag),
					.wti_s_0_SThreadBusy(app$wti_s_0_SThreadBusy),
					.wti_s_0_SReset_n(app$wti_s_0_SReset_n),
					.wti_s_1_SThreadBusy(app$wti_s_1_SThreadBusy),
					.wti_s_1_SReset_n(app$wti_s_1_SReset_n),
					.wti_s_2_SThreadBusy(app$wti_s_2_SThreadBusy),
					.wti_s_2_SReset_n(app$wti_s_2_SReset_n),
					.wmiM0_MCmd(app$wmiM0_MCmd),
					.wmiM0_MReqLast(app$wmiM0_MReqLast),
					.wmiM0_MReqInfo(app$wmiM0_MReqInfo),
					.wmiM0_MAddrSpace(app$wmiM0_MAddrSpace),
					.wmiM0_MAddr(app$wmiM0_MAddr),
					.wmiM0_MBurstLength(app$wmiM0_MBurstLength),
					.wmiM0_MDataValid(app$wmiM0_MDataValid),
					.wmiM0_MDataLast(app$wmiM0_MDataLast),
					.wmiM0_MData(app$wmiM0_MData),
					.wmiM0_MDataByteEn(app$wmiM0_MDataByteEn),
					.wmiM0_MFlag(app$wmiM0_MFlag),
					.wmiM0_MReset_n(app$wmiM0_MReset_n),
					.wmiM1_MCmd(app$wmiM1_MCmd),
					.wmiM1_MReqLast(app$wmiM1_MReqLast),
					.wmiM1_MReqInfo(app$wmiM1_MReqInfo),
					.wmiM1_MAddrSpace(app$wmiM1_MAddrSpace),
					.wmiM1_MAddr(app$wmiM1_MAddr),
					.wmiM1_MBurstLength(app$wmiM1_MBurstLength),
					.wmiM1_MDataValid(app$wmiM1_MDataValid),
					.wmiM1_MDataLast(app$wmiM1_MDataLast),
					.wmiM1_MData(app$wmiM1_MData),
					.wmiM1_MDataByteEn(app$wmiM1_MDataByteEn),
					.wmiM1_MFlag(app$wmiM1_MFlag),
					.wmiM1_MReset_n(app$wmiM1_MReset_n),
					.wmemiM0_MCmd(app$wmemiM0_MCmd),
					.wmemiM0_MReqLast(app$wmemiM0_MReqLast),
					.wmemiM0_MAddr(app$wmemiM0_MAddr),
					.wmemiM0_MBurstLength(app$wmemiM0_MBurstLength),
					.wmemiM0_MDataValid(app$wmemiM0_MDataValid),
					.wmemiM0_MDataLast(app$wmemiM0_MDataLast),
					.wmemiM0_MData(app$wmemiM0_MData),
					.wmemiM0_MDataByteEn(app$wmemiM0_MDataByteEn),
					.wmemiM0_MReset_n(app$wmemiM0_MReset_n),
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
					.uuid(app$uuid));
  // submodule ctNow
  SyncRegister #(.width(32'd64), .init(64'd0)) ctNow(.sCLK(CLK_sys0_clk),
						     .dCLK(CLK),
						     .sRST(RST_N_sys0_rst),
						     .sD_IN(ctNow$sD_IN),
						     .sEN(ctNow$sEN),
						     .dD_OUT(ctNow$dD_OUT),
						     .sRDY(ctNow$sRDY));
  // submodule inf
  mkOCInf4B inf(.pciDevice(pciDevice),
		.CLK_sys0_clk(CLK_sys0_clk),
		.RST_N_sys0_rst(RST_N_sys0_rst),
		.CLK(CLK),
		.RST_N(RST_N),
		.cpServer_request_put(inf$cpServer_request_put),
		.gps_ppsSyncIn_x(inf$gps_ppsSyncIn_x),
		.server_request_put(inf$server_request_put),
		.switch_x(inf$switch_x),
		.uuid_arg(inf$uuid_arg),
		.wci_m_0_SData(inf$wci_m_0_SData),
		.wci_m_0_SFlag(inf$wci_m_0_SFlag),
		.wci_m_0_SResp(inf$wci_m_0_SResp),
		.wci_m_10_SData(inf$wci_m_10_SData),
		.wci_m_10_SFlag(inf$wci_m_10_SFlag),
		.wci_m_10_SResp(inf$wci_m_10_SResp),
		.wci_m_11_SData(inf$wci_m_11_SData),
		.wci_m_11_SFlag(inf$wci_m_11_SFlag),
		.wci_m_11_SResp(inf$wci_m_11_SResp),
		.wci_m_12_SData(inf$wci_m_12_SData),
		.wci_m_12_SFlag(inf$wci_m_12_SFlag),
		.wci_m_12_SResp(inf$wci_m_12_SResp),
		.wci_m_1_SData(inf$wci_m_1_SData),
		.wci_m_1_SFlag(inf$wci_m_1_SFlag),
		.wci_m_1_SResp(inf$wci_m_1_SResp),
		.wci_m_2_SData(inf$wci_m_2_SData),
		.wci_m_2_SFlag(inf$wci_m_2_SFlag),
		.wci_m_2_SResp(inf$wci_m_2_SResp),
		.wci_m_3_SData(inf$wci_m_3_SData),
		.wci_m_3_SFlag(inf$wci_m_3_SFlag),
		.wci_m_3_SResp(inf$wci_m_3_SResp),
		.wci_m_4_SData(inf$wci_m_4_SData),
		.wci_m_4_SFlag(inf$wci_m_4_SFlag),
		.wci_m_4_SResp(inf$wci_m_4_SResp),
		.wci_m_5_SData(inf$wci_m_5_SData),
		.wci_m_5_SFlag(inf$wci_m_5_SFlag),
		.wci_m_5_SResp(inf$wci_m_5_SResp),
		.wci_m_6_SData(inf$wci_m_6_SData),
		.wci_m_6_SFlag(inf$wci_m_6_SFlag),
		.wci_m_6_SResp(inf$wci_m_6_SResp),
		.wci_m_7_SData(inf$wci_m_7_SData),
		.wci_m_7_SFlag(inf$wci_m_7_SFlag),
		.wci_m_7_SResp(inf$wci_m_7_SResp),
		.wci_m_8_SData(inf$wci_m_8_SData),
		.wci_m_8_SFlag(inf$wci_m_8_SFlag),
		.wci_m_8_SResp(inf$wci_m_8_SResp),
		.wci_m_9_SData(inf$wci_m_9_SData),
		.wci_m_9_SFlag(inf$wci_m_9_SFlag),
		.wci_m_9_SResp(inf$wci_m_9_SResp),
		.wmiDP0_MAddr(inf$wmiDP0_MAddr),
		.wmiDP0_MAddrSpace(inf$wmiDP0_MAddrSpace),
		.wmiDP0_MBurstLength(inf$wmiDP0_MBurstLength),
		.wmiDP0_MCmd(inf$wmiDP0_MCmd),
		.wmiDP0_MData(inf$wmiDP0_MData),
		.wmiDP0_MDataByteEn(inf$wmiDP0_MDataByteEn),
		.wmiDP0_MReqInfo(inf$wmiDP0_MReqInfo),
		.wmiDP0_arg_mFlag(inf$wmiDP0_arg_mFlag),
		.wmiDP1_MAddr(inf$wmiDP1_MAddr),
		.wmiDP1_MAddrSpace(inf$wmiDP1_MAddrSpace),
		.wmiDP1_MBurstLength(inf$wmiDP1_MBurstLength),
		.wmiDP1_MCmd(inf$wmiDP1_MCmd),
		.wmiDP1_MData(inf$wmiDP1_MData),
		.wmiDP1_MDataByteEn(inf$wmiDP1_MDataByteEn),
		.wmiDP1_MReqInfo(inf$wmiDP1_MReqInfo),
		.wmiDP1_arg_mFlag(inf$wmiDP1_arg_mFlag),
		.EN_server_request_put(inf$EN_server_request_put),
		.EN_server_response_get(inf$EN_server_response_get),
		.EN_cpServer_request_put(inf$EN_cpServer_request_put),
		.EN_cpServer_response_get(inf$EN_cpServer_response_get),
		.wci_m_0_SThreadBusy(inf$wci_m_0_SThreadBusy),
		.wci_m_1_SThreadBusy(inf$wci_m_1_SThreadBusy),
		.wci_m_2_SThreadBusy(inf$wci_m_2_SThreadBusy),
		.wci_m_3_SThreadBusy(inf$wci_m_3_SThreadBusy),
		.wci_m_4_SThreadBusy(inf$wci_m_4_SThreadBusy),
		.wci_m_5_SThreadBusy(inf$wci_m_5_SThreadBusy),
		.wci_m_6_SThreadBusy(inf$wci_m_6_SThreadBusy),
		.wci_m_7_SThreadBusy(inf$wci_m_7_SThreadBusy),
		.wci_m_8_SThreadBusy(inf$wci_m_8_SThreadBusy),
		.wci_m_9_SThreadBusy(inf$wci_m_9_SThreadBusy),
		.wci_m_10_SThreadBusy(inf$wci_m_10_SThreadBusy),
		.wci_m_11_SThreadBusy(inf$wci_m_11_SThreadBusy),
		.wci_m_12_SThreadBusy(inf$wci_m_12_SThreadBusy),
		.wmiDP0_MReqLast(inf$wmiDP0_MReqLast),
		.wmiDP0_MDataValid(inf$wmiDP0_MDataValid),
		.wmiDP0_MDataLast(inf$wmiDP0_MDataLast),
		.wmiDP0_MReset_n(inf$wmiDP0_MReset_n),
		.wmiDP1_MReqLast(inf$wmiDP1_MReqLast),
		.wmiDP1_MDataValid(inf$wmiDP1_MDataValid),
		.wmiDP1_MDataLast(inf$wmiDP1_MDataLast),
		.wmiDP1_MReset_n(inf$wmiDP1_MReset_n),
		.RDY_server_request_put(inf$RDY_server_request_put),
		.server_response_get(inf$server_response_get),
		.RDY_server_response_get(inf$RDY_server_response_get),
		.RDY_cpServer_request_put(inf$RDY_cpServer_request_put),
		.cpServer_response_get(inf$cpServer_response_get),
		.RDY_cpServer_response_get(inf$RDY_cpServer_response_get),
		.led(inf$led),
		.wci_m_0_MCmd(inf$wci_m_0_MCmd),
		.wci_m_0_MAddrSpace(inf$wci_m_0_MAddrSpace),
		.wci_m_0_MByteEn(inf$wci_m_0_MByteEn),
		.wci_m_0_MAddr(inf$wci_m_0_MAddr),
		.wci_m_0_MData(inf$wci_m_0_MData),
		.wci_m_0_MFlag(inf$wci_m_0_MFlag),
		.wci_m_1_MCmd(inf$wci_m_1_MCmd),
		.wci_m_1_MAddrSpace(inf$wci_m_1_MAddrSpace),
		.wci_m_1_MByteEn(inf$wci_m_1_MByteEn),
		.wci_m_1_MAddr(inf$wci_m_1_MAddr),
		.wci_m_1_MData(inf$wci_m_1_MData),
		.wci_m_1_MFlag(inf$wci_m_1_MFlag),
		.wci_m_2_MCmd(inf$wci_m_2_MCmd),
		.wci_m_2_MAddrSpace(inf$wci_m_2_MAddrSpace),
		.wci_m_2_MByteEn(inf$wci_m_2_MByteEn),
		.wci_m_2_MAddr(inf$wci_m_2_MAddr),
		.wci_m_2_MData(inf$wci_m_2_MData),
		.wci_m_2_MFlag(inf$wci_m_2_MFlag),
		.wci_m_3_MCmd(inf$wci_m_3_MCmd),
		.wci_m_3_MAddrSpace(inf$wci_m_3_MAddrSpace),
		.wci_m_3_MByteEn(inf$wci_m_3_MByteEn),
		.wci_m_3_MAddr(inf$wci_m_3_MAddr),
		.wci_m_3_MData(inf$wci_m_3_MData),
		.wci_m_3_MFlag(inf$wci_m_3_MFlag),
		.wci_m_4_MCmd(inf$wci_m_4_MCmd),
		.wci_m_4_MAddrSpace(inf$wci_m_4_MAddrSpace),
		.wci_m_4_MByteEn(inf$wci_m_4_MByteEn),
		.wci_m_4_MAddr(inf$wci_m_4_MAddr),
		.wci_m_4_MData(inf$wci_m_4_MData),
		.wci_m_4_MFlag(inf$wci_m_4_MFlag),
		.wci_m_5_MCmd(inf$wci_m_5_MCmd),
		.wci_m_5_MAddrSpace(inf$wci_m_5_MAddrSpace),
		.wci_m_5_MByteEn(inf$wci_m_5_MByteEn),
		.wci_m_5_MAddr(inf$wci_m_5_MAddr),
		.wci_m_5_MData(inf$wci_m_5_MData),
		.wci_m_5_MFlag(inf$wci_m_5_MFlag),
		.wci_m_6_MCmd(inf$wci_m_6_MCmd),
		.wci_m_6_MAddrSpace(inf$wci_m_6_MAddrSpace),
		.wci_m_6_MByteEn(inf$wci_m_6_MByteEn),
		.wci_m_6_MAddr(inf$wci_m_6_MAddr),
		.wci_m_6_MData(inf$wci_m_6_MData),
		.wci_m_6_MFlag(inf$wci_m_6_MFlag),
		.wci_m_7_MCmd(inf$wci_m_7_MCmd),
		.wci_m_7_MAddrSpace(inf$wci_m_7_MAddrSpace),
		.wci_m_7_MByteEn(inf$wci_m_7_MByteEn),
		.wci_m_7_MAddr(inf$wci_m_7_MAddr),
		.wci_m_7_MData(inf$wci_m_7_MData),
		.wci_m_7_MFlag(inf$wci_m_7_MFlag),
		.wci_m_8_MCmd(inf$wci_m_8_MCmd),
		.wci_m_8_MAddrSpace(inf$wci_m_8_MAddrSpace),
		.wci_m_8_MByteEn(inf$wci_m_8_MByteEn),
		.wci_m_8_MAddr(inf$wci_m_8_MAddr),
		.wci_m_8_MData(inf$wci_m_8_MData),
		.wci_m_8_MFlag(inf$wci_m_8_MFlag),
		.wci_m_9_MCmd(inf$wci_m_9_MCmd),
		.wci_m_9_MAddrSpace(inf$wci_m_9_MAddrSpace),
		.wci_m_9_MByteEn(inf$wci_m_9_MByteEn),
		.wci_m_9_MAddr(inf$wci_m_9_MAddr),
		.wci_m_9_MData(inf$wci_m_9_MData),
		.wci_m_9_MFlag(inf$wci_m_9_MFlag),
		.wci_m_10_MCmd(inf$wci_m_10_MCmd),
		.wci_m_10_MAddrSpace(inf$wci_m_10_MAddrSpace),
		.wci_m_10_MByteEn(inf$wci_m_10_MByteEn),
		.wci_m_10_MAddr(inf$wci_m_10_MAddr),
		.wci_m_10_MData(inf$wci_m_10_MData),
		.wci_m_10_MFlag(inf$wci_m_10_MFlag),
		.wci_m_11_MCmd(inf$wci_m_11_MCmd),
		.wci_m_11_MAddrSpace(inf$wci_m_11_MAddrSpace),
		.wci_m_11_MByteEn(inf$wci_m_11_MByteEn),
		.wci_m_11_MAddr(inf$wci_m_11_MAddr),
		.wci_m_11_MData(inf$wci_m_11_MData),
		.wci_m_11_MFlag(inf$wci_m_11_MFlag),
		.wci_m_12_MCmd(inf$wci_m_12_MCmd),
		.wci_m_12_MAddrSpace(inf$wci_m_12_MAddrSpace),
		.wci_m_12_MByteEn(inf$wci_m_12_MByteEn),
		.wci_m_12_MAddr(inf$wci_m_12_MAddr),
		.wci_m_12_MData(inf$wci_m_12_MData),
		.wci_m_12_MFlag(inf$wci_m_12_MFlag),
		.wmiDP0_SResp(inf$wmiDP0_SResp),
		.wmiDP0_SData(inf$wmiDP0_SData),
		.wmiDP0_SThreadBusy(inf$wmiDP0_SThreadBusy),
		.wmiDP0_SDataThreadBusy(inf$wmiDP0_SDataThreadBusy),
		.wmiDP0_SRespLast(inf$wmiDP0_SRespLast),
		.wmiDP0_SFlag(inf$wmiDP0_SFlag),
		.wmiDP0_SReset_n(inf$wmiDP0_SReset_n),
		.wmiDP1_SResp(inf$wmiDP1_SResp),
		.wmiDP1_SData(inf$wmiDP1_SData),
		.wmiDP1_SThreadBusy(inf$wmiDP1_SThreadBusy),
		.wmiDP1_SDataThreadBusy(inf$wmiDP1_SDataThreadBusy),
		.wmiDP1_SRespLast(inf$wmiDP1_SRespLast),
		.wmiDP1_SFlag(inf$wmiDP1_SFlag),
		.wmiDP1_SReset_n(inf$wmiDP1_SReset_n),
		.cpNow(inf$cpNow),
		.RDY_cpNow(),
		.gps_ppsSyncOut(inf$gps_ppsSyncOut),
		.RDY_uuid(),
		.RST_N_wci_m_0(inf$RST_N_wci_m_0),
		.RST_N_wci_m_1(inf$RST_N_wci_m_1),
		.RST_N_wci_m_2(inf$RST_N_wci_m_2),
		.RST_N_wci_m_3(inf$RST_N_wci_m_3),
		.RST_N_wci_m_4(inf$RST_N_wci_m_4),
		.RST_N_wci_m_5(inf$RST_N_wci_m_5),
		.RST_N_wci_m_6(inf$RST_N_wci_m_6),
		.RST_N_wci_m_7(inf$RST_N_wci_m_7),
		.RST_N_wci_m_8(inf$RST_N_wci_m_8),
		.RST_N_wci_m_9(inf$RST_N_wci_m_9),
		.RST_N_wci_m_10(inf$RST_N_wci_m_10),
		.RST_N_wci_m_11(inf$RST_N_wci_m_11),
		.RST_N_wci_m_12(inf$RST_N_wci_m_12));
  // inlined wires
  assign wtiM_0_peerIsReady_1$wget = 1'd1 ;
  assign wtiM_0_peerIsReady_1$whas = app$wti_s_0_SReset_n ;
  assign wtiM_1_peerIsReady_1$wget = 1'd1 ;
  assign wtiM_1_peerIsReady_1$whas = app$wti_s_1_SReset_n ;
  assign wtiM_2_peerIsReady_1$wget = 1'd1 ;
  assign wtiM_2_peerIsReady_1$whas = app$wti_s_2_SReset_n ;
  assign wtiM_0_sThreadBusy_pw$whas = app$wti_s_0_SThreadBusy ;
  assign wtiM_1_sThreadBusy_pw$whas = app$wti_s_1_SThreadBusy ;
  assign wtiM_2_sThreadBusy_pw$whas = app$wti_s_2_SThreadBusy ;
  // register wtiM_0_nowReq
  assign wtiM_0_nowReq$D_IN = { 3'd1, ctNow$dD_OUT } ;
  assign wtiM_0_nowReq$EN = 1'd1 ;
  // register wtiM_0_peerIsReady
  assign wtiM_0_peerIsReady$D_IN = app$wti_s_0_SReset_n ;
  assign wtiM_0_peerIsReady$EN = 1'd1 ;
  // register wtiM_0_sThreadBusy_d
  assign wtiM_0_sThreadBusy_d$D_IN = app$wti_s_0_SThreadBusy ;
  assign wtiM_0_sThreadBusy_d$EN = 1'd1 ;
  // register wtiM_1_nowReq
  assign wtiM_1_nowReq$D_IN = wtiM_0_nowReq$D_IN ;
  assign wtiM_1_nowReq$EN = 1'd1 ;
  // register wtiM_1_peerIsReady
  assign wtiM_1_peerIsReady$D_IN = app$wti_s_1_SReset_n ;
  assign wtiM_1_peerIsReady$EN = 1'd1 ;
  // register wtiM_1_sThreadBusy_d
  assign wtiM_1_sThreadBusy_d$D_IN = app$wti_s_1_SThreadBusy ;
  assign wtiM_1_sThreadBusy_d$EN = 1'd1 ;
  // register wtiM_2_nowReq
  assign wtiM_2_nowReq$D_IN = wtiM_0_nowReq$D_IN ;
  assign wtiM_2_nowReq$EN = 1'd1 ;
  // register wtiM_2_peerIsReady
  assign wtiM_2_peerIsReady$D_IN = app$wti_s_2_SReset_n ;
  assign wtiM_2_peerIsReady$EN = 1'd1 ;
  // register wtiM_2_sThreadBusy_d
  assign wtiM_2_sThreadBusy_d$D_IN = app$wti_s_2_SThreadBusy ;
  assign wtiM_2_sThreadBusy_d$EN = 1'd1 ;
  // submodule app
  assign app$wci_s_0_MAddr = inf$wci_m_0_MAddr ;
  assign app$wci_s_0_MAddrSpace = inf$wci_m_0_MAddrSpace ;
  assign app$wci_s_0_MByteEn = inf$wci_m_0_MByteEn ;
  assign app$wci_s_0_MCmd = inf$wci_m_0_MCmd ;
  assign app$wci_s_0_MData = inf$wci_m_0_MData ;
  assign app$wci_s_0_MFlag = inf$wci_m_0_MFlag ;
  assign app$wci_s_1_MAddr = inf$wci_m_1_MAddr ;
  assign app$wci_s_1_MAddrSpace = inf$wci_m_1_MAddrSpace ;
  assign app$wci_s_1_MByteEn = inf$wci_m_1_MByteEn ;
  assign app$wci_s_1_MCmd = inf$wci_m_1_MCmd ;
  assign app$wci_s_1_MData = inf$wci_m_1_MData ;
  assign app$wci_s_1_MFlag = inf$wci_m_1_MFlag ;
  assign app$wci_s_2_MAddr = inf$wci_m_2_MAddr ;
  assign app$wci_s_2_MAddrSpace = inf$wci_m_2_MAddrSpace ;
  assign app$wci_s_2_MByteEn = inf$wci_m_2_MByteEn ;
  assign app$wci_s_2_MCmd = inf$wci_m_2_MCmd ;
  assign app$wci_s_2_MData = inf$wci_m_2_MData ;
  assign app$wci_s_2_MFlag = inf$wci_m_2_MFlag ;
  assign app$wci_s_3_MAddr = inf$wci_m_3_MAddr ;
  assign app$wci_s_3_MAddrSpace = inf$wci_m_3_MAddrSpace ;
  assign app$wci_s_3_MByteEn = inf$wci_m_3_MByteEn ;
  assign app$wci_s_3_MCmd = inf$wci_m_3_MCmd ;
  assign app$wci_s_3_MData = inf$wci_m_3_MData ;
  assign app$wci_s_3_MFlag = inf$wci_m_3_MFlag ;
  assign app$wci_s_4_MAddr = inf$wci_m_4_MAddr ;
  assign app$wci_s_4_MAddrSpace = inf$wci_m_4_MAddrSpace ;
  assign app$wci_s_4_MByteEn = inf$wci_m_4_MByteEn ;
  assign app$wci_s_4_MCmd = inf$wci_m_4_MCmd ;
  assign app$wci_s_4_MData = inf$wci_m_4_MData ;
  assign app$wci_s_4_MFlag = inf$wci_m_4_MFlag ;
  assign app$wci_s_5_MAddr = inf$wci_m_5_MAddr ;
  assign app$wci_s_5_MAddrSpace = inf$wci_m_5_MAddrSpace ;
  assign app$wci_s_5_MByteEn = inf$wci_m_5_MByteEn ;
  assign app$wci_s_5_MCmd = inf$wci_m_5_MCmd ;
  assign app$wci_s_5_MData = inf$wci_m_5_MData ;
  assign app$wci_s_5_MFlag = inf$wci_m_5_MFlag ;
  assign app$wci_s_6_MAddr = inf$wci_m_6_MAddr ;
  assign app$wci_s_6_MAddrSpace = inf$wci_m_6_MAddrSpace ;
  assign app$wci_s_6_MByteEn = inf$wci_m_6_MByteEn ;
  assign app$wci_s_6_MCmd = inf$wci_m_6_MCmd ;
  assign app$wci_s_6_MData = inf$wci_m_6_MData ;
  assign app$wci_s_6_MFlag = inf$wci_m_6_MFlag ;
  assign app$wci_s_7_MAddr = inf$wci_m_7_MAddr ;
  assign app$wci_s_7_MAddrSpace = inf$wci_m_7_MAddrSpace ;
  assign app$wci_s_7_MByteEn = inf$wci_m_7_MByteEn ;
  assign app$wci_s_7_MCmd = inf$wci_m_7_MCmd ;
  assign app$wci_s_7_MData = inf$wci_m_7_MData ;
  assign app$wci_s_7_MFlag = inf$wci_m_7_MFlag ;
  assign app$wmemiM0_SData = wmemiM0_SData ;
  assign app$wmemiM0_SResp = wmemiM0_SResp ;
  assign app$wmiM0_SData = inf$wmiDP0_SData ;
  assign app$wmiM0_SFlag = inf$wmiDP0_SFlag ;
  assign app$wmiM0_SResp = inf$wmiDP0_SResp ;
  assign app$wmiM1_SData = inf$wmiDP1_SData ;
  assign app$wmiM1_SFlag = inf$wmiDP1_SFlag ;
  assign app$wmiM1_SResp = inf$wmiDP1_SResp ;
  assign app$wsi_s_adc_MBurstLength = 12'h0 ;
  assign app$wsi_s_adc_MByteEn = 4'h0 ;
  assign app$wsi_s_adc_MCmd = 3'h0 ;
  assign app$wsi_s_adc_MData = 32'h0 ;
  assign app$wsi_s_adc_MReqInfo = 8'h0 ;
  assign app$wti_s_0_MCmd =
	     wtiM_0_sThreadBusy_d ? 3'd0 : wtiM_0_nowReq[66:64] ;
  assign app$wti_s_0_MData = wtiM_0_nowReq[63:0] ;
  assign app$wti_s_1_MCmd =
	     wtiM_1_sThreadBusy_d ? 3'd0 : wtiM_1_nowReq[66:64] ;
  assign app$wti_s_1_MData = wtiM_1_nowReq[63:0] ;
  assign app$wti_s_2_MCmd =
	     wtiM_2_sThreadBusy_d ? 3'd0 : wtiM_2_nowReq[66:64] ;
  assign app$wti_s_2_MData = wtiM_2_nowReq[63:0] ;
  assign app$wmiM0_SThreadBusy = inf$wmiDP0_SThreadBusy ;
  assign app$wmiM0_SDataThreadBusy = inf$wmiDP0_SDataThreadBusy ;
  assign app$wmiM0_SRespLast = inf$wmiDP0_SRespLast ;
  assign app$wmiM0_SReset_n = inf$wmiDP0_SReset_n ;
  assign app$wmiM1_SThreadBusy = inf$wmiDP1_SThreadBusy ;
  assign app$wmiM1_SDataThreadBusy = inf$wmiDP1_SDataThreadBusy ;
  assign app$wmiM1_SRespLast = inf$wmiDP1_SRespLast ;
  assign app$wmiM1_SReset_n = inf$wmiDP1_SReset_n ;
  assign app$wmemiM0_SRespLast = wmemiM0_SRespLast ;
  assign app$wmemiM0_SCmdAccept = wmemiM0_SCmdAccept ;
  assign app$wmemiM0_SDataAccept = wmemiM0_SDataAccept ;
  assign app$wsi_s_adc_MReqLast = 1'b0 ;
  assign app$wsi_s_adc_MBurstPrecise = 1'b0 ;
  assign app$wsi_s_adc_MReset_n = 1'b0 ;
  assign app$wsi_m_dac_SThreadBusy = 1'b0 ;
  assign app$wsi_m_dac_SReset_n = 1'b0 ;
  // submodule ctNow
  assign ctNow$sD_IN = inf$cpNow ;
  assign ctNow$sEN = ctNow$sRDY ;
  // submodule inf
  assign inf$cpServer_request_put = cpServer_request_put ;
  assign inf$gps_ppsSyncIn_x = gps_ppsSyncIn_x ;
  assign inf$server_request_put = server_request_put ;
  assign inf$switch_x = switch_x ;
  assign inf$uuid_arg = app$uuid ;
  assign inf$wci_m_0_SData = app$wci_s_0_SData ;
  assign inf$wci_m_0_SFlag = app$wci_s_0_SFlag ;
  assign inf$wci_m_0_SResp = app$wci_s_0_SResp ;
  assign inf$wci_m_10_SData = wci_m_2_SData ;
  assign inf$wci_m_10_SFlag = wci_m_2_SFlag ;
  assign inf$wci_m_10_SResp = wci_m_2_SResp ;
  assign inf$wci_m_11_SData = wci_m_3_SData ;
  assign inf$wci_m_11_SFlag = wci_m_3_SFlag ;
  assign inf$wci_m_11_SResp = wci_m_3_SResp ;
  assign inf$wci_m_12_SData = wci_m_4_SData ;
  assign inf$wci_m_12_SFlag = wci_m_4_SFlag ;
  assign inf$wci_m_12_SResp = wci_m_4_SResp ;
  assign inf$wci_m_1_SData = app$wci_s_1_SData ;
  assign inf$wci_m_1_SFlag = app$wci_s_1_SFlag ;
  assign inf$wci_m_1_SResp = app$wci_s_1_SResp ;
  assign inf$wci_m_2_SData = app$wci_s_2_SData ;
  assign inf$wci_m_2_SFlag = app$wci_s_2_SFlag ;
  assign inf$wci_m_2_SResp = app$wci_s_2_SResp ;
  assign inf$wci_m_3_SData = app$wci_s_3_SData ;
  assign inf$wci_m_3_SFlag = app$wci_s_3_SFlag ;
  assign inf$wci_m_3_SResp = app$wci_s_3_SResp ;
  assign inf$wci_m_4_SData = app$wci_s_4_SData ;
  assign inf$wci_m_4_SFlag = app$wci_s_4_SFlag ;
  assign inf$wci_m_4_SResp = app$wci_s_4_SResp ;
  assign inf$wci_m_5_SData = app$wci_s_5_SData ;
  assign inf$wci_m_5_SFlag = app$wci_s_5_SFlag ;
  assign inf$wci_m_5_SResp = app$wci_s_5_SResp ;
  assign inf$wci_m_6_SData = app$wci_s_6_SData ;
  assign inf$wci_m_6_SFlag = app$wci_s_6_SFlag ;
  assign inf$wci_m_6_SResp = app$wci_s_6_SResp ;
  assign inf$wci_m_7_SData = app$wci_s_7_SData ;
  assign inf$wci_m_7_SFlag = app$wci_s_7_SFlag ;
  assign inf$wci_m_7_SResp = app$wci_s_7_SResp ;
  assign inf$wci_m_8_SData = wci_m_0_SData ;
  assign inf$wci_m_8_SFlag = wci_m_0_SFlag ;
  assign inf$wci_m_8_SResp = wci_m_0_SResp ;
  assign inf$wci_m_9_SData = wci_m_1_SData ;
  assign inf$wci_m_9_SFlag = wci_m_1_SFlag ;
  assign inf$wci_m_9_SResp = wci_m_1_SResp ;
  assign inf$wmiDP0_MAddr = app$wmiM0_MAddr ;
  assign inf$wmiDP0_MAddrSpace = app$wmiM0_MAddrSpace ;
  assign inf$wmiDP0_MBurstLength = app$wmiM0_MBurstLength ;
  assign inf$wmiDP0_MCmd = app$wmiM0_MCmd ;
  assign inf$wmiDP0_MData = app$wmiM0_MData ;
  assign inf$wmiDP0_MDataByteEn = app$wmiM0_MDataByteEn ;
  assign inf$wmiDP0_MReqInfo = app$wmiM0_MReqInfo ;
  assign inf$wmiDP0_arg_mFlag = app$wmiM0_MFlag ;
  assign inf$wmiDP1_MAddr = app$wmiM1_MAddr ;
  assign inf$wmiDP1_MAddrSpace = app$wmiM1_MAddrSpace ;
  assign inf$wmiDP1_MBurstLength = app$wmiM1_MBurstLength ;
  assign inf$wmiDP1_MCmd = app$wmiM1_MCmd ;
  assign inf$wmiDP1_MData = app$wmiM1_MData ;
  assign inf$wmiDP1_MDataByteEn = app$wmiM1_MDataByteEn ;
  assign inf$wmiDP1_MReqInfo = app$wmiM1_MReqInfo ;
  assign inf$wmiDP1_arg_mFlag = app$wmiM1_MFlag ;
  assign inf$EN_server_request_put = EN_server_request_put ;
  assign inf$EN_server_response_get = EN_server_response_get ;
  assign inf$EN_cpServer_request_put = EN_cpServer_request_put ;
  assign inf$EN_cpServer_response_get = EN_cpServer_response_get ;
  assign inf$wci_m_0_SThreadBusy = app$wci_s_0_SThreadBusy ;
  assign inf$wci_m_1_SThreadBusy = app$wci_s_1_SThreadBusy ;
  assign inf$wci_m_2_SThreadBusy = app$wci_s_2_SThreadBusy ;
  assign inf$wci_m_3_SThreadBusy = app$wci_s_3_SThreadBusy ;
  assign inf$wci_m_4_SThreadBusy = app$wci_s_4_SThreadBusy ;
  assign inf$wci_m_5_SThreadBusy = app$wci_s_5_SThreadBusy ;
  assign inf$wci_m_6_SThreadBusy = app$wci_s_6_SThreadBusy ;
  assign inf$wci_m_7_SThreadBusy = app$wci_s_7_SThreadBusy ;
  assign inf$wci_m_8_SThreadBusy = wci_m_0_SThreadBusy ;
  assign inf$wci_m_9_SThreadBusy = wci_m_1_SThreadBusy ;
  assign inf$wci_m_10_SThreadBusy = wci_m_2_SThreadBusy ;
  assign inf$wci_m_11_SThreadBusy = wci_m_3_SThreadBusy ;
  assign inf$wci_m_12_SThreadBusy = wci_m_4_SThreadBusy ;
  assign inf$wmiDP0_MReqLast = app$wmiM0_MReqLast ;
  assign inf$wmiDP0_MDataValid = app$wmiM0_MDataValid ;
  assign inf$wmiDP0_MDataLast = app$wmiM0_MDataLast ;
  assign inf$wmiDP0_MReset_n = app$wmiM0_MReset_n ;
  assign inf$wmiDP1_MReqLast = app$wmiM1_MReqLast ;
  assign inf$wmiDP1_MDataValid = app$wmiM1_MDataValid ;
  assign inf$wmiDP1_MDataLast = app$wmiM1_MDataLast ;
  assign inf$wmiDP1_MReset_n = app$wmiM1_MReset_n ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        wtiM_0_nowReq <= `BSV_ASSIGNMENT_DELAY 67'd0;
	wtiM_0_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wtiM_0_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wtiM_1_nowReq <= `BSV_ASSIGNMENT_DELAY 67'd0;
	wtiM_1_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wtiM_1_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wtiM_2_nowReq <= `BSV_ASSIGNMENT_DELAY 67'd0;
	wtiM_2_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wtiM_2_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
      end
    else
      begin
        if (wtiM_0_nowReq$EN)
	  wtiM_0_nowReq <= `BSV_ASSIGNMENT_DELAY wtiM_0_nowReq$D_IN;
	if (wtiM_0_peerIsReady$EN)
	  wtiM_0_peerIsReady <= `BSV_ASSIGNMENT_DELAY wtiM_0_peerIsReady$D_IN;
	if (wtiM_0_sThreadBusy_d$EN)
	  wtiM_0_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      wtiM_0_sThreadBusy_d$D_IN;
	if (wtiM_1_nowReq$EN)
	  wtiM_1_nowReq <= `BSV_ASSIGNMENT_DELAY wtiM_1_nowReq$D_IN;
	if (wtiM_1_peerIsReady$EN)
	  wtiM_1_peerIsReady <= `BSV_ASSIGNMENT_DELAY wtiM_1_peerIsReady$D_IN;
	if (wtiM_1_sThreadBusy_d$EN)
	  wtiM_1_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      wtiM_1_sThreadBusy_d$D_IN;
	if (wtiM_2_nowReq$EN)
	  wtiM_2_nowReq <= `BSV_ASSIGNMENT_DELAY wtiM_2_nowReq$D_IN;
	if (wtiM_2_peerIsReady$EN)
	  wtiM_2_peerIsReady <= `BSV_ASSIGNMENT_DELAY wtiM_2_peerIsReady$D_IN;
	if (wtiM_2_sThreadBusy_d$EN)
	  wtiM_2_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      wtiM_2_sThreadBusy_d$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    wtiM_0_nowReq = 67'h2AAAAAAAAAAAAAAAA;
    wtiM_0_peerIsReady = 1'h0;
    wtiM_0_sThreadBusy_d = 1'h0;
    wtiM_1_nowReq = 67'h2AAAAAAAAAAAAAAAA;
    wtiM_1_peerIsReady = 1'h0;
    wtiM_1_sThreadBusy_d = 1'h0;
    wtiM_2_nowReq = 67'h2AAAAAAAAAAAAAAAA;
    wtiM_2_peerIsReady = 1'h0;
    wtiM_2_sThreadBusy_d = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule