module outputs
  wire [152 : 0] server_response_get;
  wire [127 : 0] wmemiM0_MData, wsi_m_dac_MData;
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
		wci_m_4_MData;
  wire [15 : 0] wmemiM0_MDataByteEn, wsi_m_dac_MByteEn;
  wire [11 : 0] wmemiM0_MBurstLength, wsi_m_dac_MBurstLength;
  wire [7 : 0] wsi_m_dac_MReqInfo;
  wire [3 : 0] wci_m_0_MByteEn,
	       wci_m_1_MByteEn,
	       wci_m_2_MByteEn,
	       wci_m_3_MByteEn,
	       wci_m_4_MByteEn;
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
  wire wtiM_0_peerIsReady_1_wget,
       wtiM_0_peerIsReady_1_whas,
       wtiM_0_sThreadBusy_pw_whas,
       wtiM_1_peerIsReady_1_wget,
       wtiM_1_peerIsReady_1_whas,
       wtiM_1_sThreadBusy_pw_whas,
       wtiM_2_peerIsReady_1_wget,
       wtiM_2_peerIsReady_1_whas,
       wtiM_2_sThreadBusy_pw_whas;
  // register wtiM_0_nowReq
  reg [66 : 0] wtiM_0_nowReq;
  wire [66 : 0] wtiM_0_nowReq_D_IN;
  wire wtiM_0_nowReq_EN;
  // register wtiM_0_peerIsReady
  reg wtiM_0_peerIsReady;
  wire wtiM_0_peerIsReady_D_IN, wtiM_0_peerIsReady_EN;
  // register wtiM_0_sThreadBusy_d
  reg wtiM_0_sThreadBusy_d;
  wire wtiM_0_sThreadBusy_d_D_IN, wtiM_0_sThreadBusy_d_EN;
  // register wtiM_1_nowReq
  reg [66 : 0] wtiM_1_nowReq;
  wire [66 : 0] wtiM_1_nowReq_D_IN;
  wire wtiM_1_nowReq_EN;
  // register wtiM_1_peerIsReady
  reg wtiM_1_peerIsReady;
  wire wtiM_1_peerIsReady_D_IN, wtiM_1_peerIsReady_EN;
  // register wtiM_1_sThreadBusy_d
  reg wtiM_1_sThreadBusy_d;
  wire wtiM_1_sThreadBusy_d_D_IN, wtiM_1_sThreadBusy_d_EN;
  // register wtiM_2_nowReq
  reg [66 : 0] wtiM_2_nowReq;
  wire [66 : 0] wtiM_2_nowReq_D_IN;
  wire wtiM_2_nowReq_EN;
  // register wtiM_2_peerIsReady
  reg wtiM_2_peerIsReady;
  wire wtiM_2_peerIsReady_D_IN, wtiM_2_peerIsReady_EN;
  // register wtiM_2_sThreadBusy_d
  reg wtiM_2_sThreadBusy_d;
  wire wtiM_2_sThreadBusy_d_D_IN, wtiM_2_sThreadBusy_d_EN;
  // ports of submodule app
  wire [511 : 0] app_uuid;
  wire [127 : 0] app_wmemiM0_MData,
		 app_wmemiM0_SData,
		 app_wmiM0_MData,
		 app_wmiM0_SData,
		 app_wmiM1_MData,
		 app_wmiM1_SData,
		 app_wsi_s_adc_MData;
  wire [63 : 0] app_wti_s_0_MData, app_wti_s_1_MData, app_wti_s_2_MData;
  wire [35 : 0] app_wmemiM0_MAddr;
  wire [31 : 0] app_wci_s_0_MAddr,
		app_wci_s_0_MData,
		app_wci_s_0_SData,
		app_wci_s_1_MAddr,
		app_wci_s_1_MData,
		app_wci_s_1_SData,
		app_wci_s_2_MAddr,
		app_wci_s_2_MData,
		app_wci_s_2_SData,
		app_wci_s_3_MAddr,
		app_wci_s_3_MData,
		app_wci_s_3_SData,
		app_wci_s_4_MAddr,
		app_wci_s_4_MData,
		app_wci_s_4_SData,
		app_wci_s_5_MAddr,
		app_wci_s_5_MData,
		app_wci_s_5_SData,
		app_wci_s_6_MAddr,
		app_wci_s_6_MData,
		app_wci_s_6_SData,
		app_wci_s_7_MAddr,
		app_wci_s_7_MData,
		app_wci_s_7_SData,
		app_wmiM0_MFlag,
		app_wmiM0_SFlag,
		app_wmiM1_MFlag,
		app_wmiM1_SFlag;
  wire [15 : 0] app_wmemiM0_MDataByteEn,
		app_wmiM0_MDataByteEn,
		app_wmiM1_MDataByteEn,
		app_wsi_s_adc_MByteEn;
  wire [13 : 0] app_wmiM0_MAddr, app_wmiM1_MAddr;
  wire [11 : 0] app_wmemiM0_MBurstLength,
		app_wmiM0_MBurstLength,
		app_wmiM1_MBurstLength,
		app_wsi_s_adc_MBurstLength;
  wire [7 : 0] app_wsi_s_adc_MReqInfo;
  wire [3 : 0] app_wci_s_0_MByteEn,
	       app_wci_s_1_MByteEn,
	       app_wci_s_2_MByteEn,
	       app_wci_s_3_MByteEn,
	       app_wci_s_4_MByteEn,
	       app_wci_s_5_MByteEn,
	       app_wci_s_6_MByteEn,
	       app_wci_s_7_MByteEn;
  wire [2 : 0] app_wci_s_0_MCmd,
	       app_wci_s_1_MCmd,
	       app_wci_s_2_MCmd,
	       app_wci_s_3_MCmd,
	       app_wci_s_4_MCmd,
	       app_wci_s_5_MCmd,
	       app_wci_s_6_MCmd,
	       app_wci_s_7_MCmd,
	       app_wmemiM0_MCmd,
	       app_wmiM0_MCmd,
	       app_wmiM1_MCmd,
	       app_wsi_s_adc_MCmd,
	       app_wti_s_0_MCmd,
	       app_wti_s_1_MCmd,
	       app_wti_s_2_MCmd;
  wire [1 : 0] app_wci_s_0_MFlag,
	       app_wci_s_0_SFlag,
	       app_wci_s_0_SResp,
	       app_wci_s_1_MFlag,
	       app_wci_s_1_SFlag,
	       app_wci_s_1_SResp,
	       app_wci_s_2_MFlag,
	       app_wci_s_2_SFlag,
	       app_wci_s_2_SResp,
	       app_wci_s_3_MFlag,
	       app_wci_s_3_SFlag,
	       app_wci_s_3_SResp,
	       app_wci_s_4_MFlag,
	       app_wci_s_4_SFlag,
	       app_wci_s_4_SResp,
	       app_wci_s_5_MFlag,
	       app_wci_s_5_SFlag,
	       app_wci_s_5_SResp,
	       app_wci_s_6_MFlag,
	       app_wci_s_6_SFlag,
	       app_wci_s_6_SResp,
	       app_wci_s_7_MFlag,
	       app_wci_s_7_SFlag,
	       app_wci_s_7_SResp,
	       app_wmemiM0_SResp,
	       app_wmiM0_SResp,
	       app_wmiM1_SResp;
  wire app_wci_s_0_MAddrSpace,
       app_wci_s_0_SThreadBusy,
       app_wci_s_1_MAddrSpace,
       app_wci_s_1_SThreadBusy,
       app_wci_s_2_MAddrSpace,
       app_wci_s_2_SThreadBusy,
       app_wci_s_3_MAddrSpace,
       app_wci_s_3_SThreadBusy,
       app_wci_s_4_MAddrSpace,
       app_wci_s_4_SThreadBusy,
       app_wci_s_5_MAddrSpace,
       app_wci_s_5_SThreadBusy,
       app_wci_s_6_MAddrSpace,
       app_wci_s_6_SThreadBusy,
       app_wci_s_7_MAddrSpace,
       app_wci_s_7_SThreadBusy,
       app_wmemiM0_MDataLast,
       app_wmemiM0_MDataValid,
       app_wmemiM0_MReqLast,
       app_wmemiM0_MReset_n,
       app_wmemiM0_SCmdAccept,
       app_wmemiM0_SDataAccept,
       app_wmemiM0_SRespLast,
       app_wmiM0_MAddrSpace,
       app_wmiM0_MDataLast,
       app_wmiM0_MDataValid,
       app_wmiM0_MReqInfo,
       app_wmiM0_MReqLast,
       app_wmiM0_MReset_n,
       app_wmiM0_SDataThreadBusy,
       app_wmiM0_SReset_n,
       app_wmiM0_SRespLast,
       app_wmiM0_SThreadBusy,
       app_wmiM1_MAddrSpace,
       app_wmiM1_MDataLast,
       app_wmiM1_MDataValid,
       app_wmiM1_MReqInfo,
       app_wmiM1_MReqLast,
       app_wmiM1_MReset_n,
       app_wmiM1_SDataThreadBusy,
       app_wmiM1_SReset_n,
       app_wmiM1_SRespLast,
       app_wmiM1_SThreadBusy,
       app_wsi_m_dac_SReset_n,
       app_wsi_m_dac_SThreadBusy,
       app_wsi_s_adc_MBurstPrecise,
       app_wsi_s_adc_MReqLast,
       app_wsi_s_adc_MReset_n,
       app_wti_s_0_SReset_n,
       app_wti_s_0_SThreadBusy,
       app_wti_s_1_SReset_n,
       app_wti_s_1_SThreadBusy,
       app_wti_s_2_SReset_n,
       app_wti_s_2_SThreadBusy;
  // ports of submodule ctNow
  wire [63 : 0] ctNow_dD_OUT, ctNow_sD_IN;
  wire ctNow_sEN, ctNow_sRDY;
  // ports of submodule inf
  wire [511 : 0] inf_uuid_arg;
  wire [152 : 0] inf_server_request_put, inf_server_response_get;
  wire [127 : 0] inf_wmiDP0_MData,
		 inf_wmiDP0_SData,
		 inf_wmiDP1_MData,
		 inf_wmiDP1_SData;
  wire [63 : 0] inf_cpNow;
  wire [58 : 0] inf_cpServer_request_put;
  wire [39 : 0] inf_cpServer_response_get;
  wire [31 : 0] inf_wci_m_0_MAddr,
		inf_wci_m_0_MData,
		inf_wci_m_0_SData,
		inf_wci_m_10_MAddr,
		inf_wci_m_10_MData,
		inf_wci_m_10_SData,
		inf_wci_m_11_MAddr,
		inf_wci_m_11_MData,
		inf_wci_m_11_SData,
		inf_wci_m_12_MAddr,
		inf_wci_m_12_MData,
		inf_wci_m_12_SData,
		inf_wci_m_1_MAddr,
		inf_wci_m_1_MData,
		inf_wci_m_1_SData,
		inf_wci_m_2_MAddr,
		inf_wci_m_2_MData,
		inf_wci_m_2_SData,
		inf_wci_m_3_MAddr,
		inf_wci_m_3_MData,
		inf_wci_m_3_SData,
		inf_wci_m_4_MAddr,
		inf_wci_m_4_MData,
		inf_wci_m_4_SData,
		inf_wci_m_5_MAddr,
		inf_wci_m_5_MData,
		inf_wci_m_5_SData,
		inf_wci_m_6_MAddr,
		inf_wci_m_6_MData,
		inf_wci_m_6_SData,
		inf_wci_m_7_MAddr,
		inf_wci_m_7_MData,
		inf_wci_m_7_SData,
		inf_wci_m_8_MAddr,
		inf_wci_m_8_MData,
		inf_wci_m_8_SData,
		inf_wci_m_9_MAddr,
		inf_wci_m_9_MData,
		inf_wci_m_9_SData,
		inf_wmiDP0_SFlag,
		inf_wmiDP0_arg_mFlag,
		inf_wmiDP1_SFlag,
		inf_wmiDP1_arg_mFlag;
  wire [15 : 0] inf_wmiDP0_MDataByteEn, inf_wmiDP1_MDataByteEn;
  wire [13 : 0] inf_wmiDP0_MAddr, inf_wmiDP1_MAddr;
  wire [11 : 0] inf_wmiDP0_MBurstLength, inf_wmiDP1_MBurstLength;
  wire [3 : 0] inf_wci_m_0_MByteEn,
	       inf_wci_m_10_MByteEn,
	       inf_wci_m_11_MByteEn,
	       inf_wci_m_12_MByteEn,
	       inf_wci_m_1_MByteEn,
	       inf_wci_m_2_MByteEn,
	       inf_wci_m_3_MByteEn,
	       inf_wci_m_4_MByteEn,
	       inf_wci_m_5_MByteEn,
	       inf_wci_m_6_MByteEn,
	       inf_wci_m_7_MByteEn,
	       inf_wci_m_8_MByteEn,
	       inf_wci_m_9_MByteEn;
  wire [2 : 0] inf_switch_x,
	       inf_wci_m_0_MCmd,
	       inf_wci_m_10_MCmd,
	       inf_wci_m_11_MCmd,
	       inf_wci_m_12_MCmd,
	       inf_wci_m_1_MCmd,
	       inf_wci_m_2_MCmd,
	       inf_wci_m_3_MCmd,
	       inf_wci_m_4_MCmd,
	       inf_wci_m_5_MCmd,
	       inf_wci_m_6_MCmd,
	       inf_wci_m_7_MCmd,
	       inf_wci_m_8_MCmd,
	       inf_wci_m_9_MCmd,
	       inf_wmiDP0_MCmd,
	       inf_wmiDP1_MCmd;
  wire [1 : 0] inf_led,
	       inf_wci_m_0_MFlag,
	       inf_wci_m_0_SFlag,
	       inf_wci_m_0_SResp,
	       inf_wci_m_10_MFlag,
	       inf_wci_m_10_SFlag,
	       inf_wci_m_10_SResp,
	       inf_wci_m_11_MFlag,
	       inf_wci_m_11_SFlag,
	       inf_wci_m_11_SResp,
	       inf_wci_m_12_MFlag,
	       inf_wci_m_12_SFlag,
	       inf_wci_m_12_SResp,
	       inf_wci_m_1_MFlag,
	       inf_wci_m_1_SFlag,
	       inf_wci_m_1_SResp,
	       inf_wci_m_2_MFlag,
	       inf_wci_m_2_SFlag,
	       inf_wci_m_2_SResp,
	       inf_wci_m_3_MFlag,
	       inf_wci_m_3_SFlag,
	       inf_wci_m_3_SResp,
	       inf_wci_m_4_MFlag,
	       inf_wci_m_4_SFlag,
	       inf_wci_m_4_SResp,
	       inf_wci_m_5_MFlag,
	       inf_wci_m_5_SFlag,
	       inf_wci_m_5_SResp,
	       inf_wci_m_6_MFlag,
	       inf_wci_m_6_SFlag,
	       inf_wci_m_6_SResp,
	       inf_wci_m_7_MFlag,
	       inf_wci_m_7_SFlag,
	       inf_wci_m_7_SResp,
	       inf_wci_m_8_MFlag,
	       inf_wci_m_8_SFlag,
	       inf_wci_m_8_SResp,
	       inf_wci_m_9_MFlag,
	       inf_wci_m_9_SFlag,
	       inf_wci_m_9_SResp,
	       inf_wmiDP0_SResp,
	       inf_wmiDP1_SResp;
  wire inf_EN_cpServer_request_put,
       inf_EN_cpServer_response_get,
       inf_EN_server_request_put,
       inf_EN_server_response_get,
       inf_RDY_cpServer_request_put,
       inf_RDY_cpServer_response_get,
       inf_RDY_server_request_put,
       inf_RDY_server_response_get,
       inf_RST_N_wci_m_0,
       inf_RST_N_wci_m_1,
       inf_RST_N_wci_m_10,
       inf_RST_N_wci_m_11,
       inf_RST_N_wci_m_12,
       inf_RST_N_wci_m_2,
       inf_RST_N_wci_m_3,
       inf_RST_N_wci_m_4,
       inf_RST_N_wci_m_5,
       inf_RST_N_wci_m_6,
       inf_RST_N_wci_m_7,
       inf_RST_N_wci_m_8,
       inf_RST_N_wci_m_9,
       inf_gps_ppsSyncIn_x,
       inf_gps_ppsSyncOut,
       inf_wci_m_0_MAddrSpace,
       inf_wci_m_0_SThreadBusy,
       inf_wci_m_10_MAddrSpace,
       inf_wci_m_10_SThreadBusy,
       inf_wci_m_11_MAddrSpace,
       inf_wci_m_11_SThreadBusy,
       inf_wci_m_12_MAddrSpace,
       inf_wci_m_12_SThreadBusy,
       inf_wci_m_1_MAddrSpace,
       inf_wci_m_1_SThreadBusy,
       inf_wci_m_2_MAddrSpace,
       inf_wci_m_2_SThreadBusy,
       inf_wci_m_3_MAddrSpace,
       inf_wci_m_3_SThreadBusy,
       inf_wci_m_4_MAddrSpace,
       inf_wci_m_4_SThreadBusy,
       inf_wci_m_5_MAddrSpace,
       inf_wci_m_5_SThreadBusy,
       inf_wci_m_6_MAddrSpace,
       inf_wci_m_6_SThreadBusy,
       inf_wci_m_7_MAddrSpace,
       inf_wci_m_7_SThreadBusy,
       inf_wci_m_8_MAddrSpace,
       inf_wci_m_8_SThreadBusy,
       inf_wci_m_9_MAddrSpace,
       inf_wci_m_9_SThreadBusy,
       inf_wmiDP0_MAddrSpace,
       inf_wmiDP0_MDataLast,
       inf_wmiDP0_MDataValid,
       inf_wmiDP0_MReqInfo,
       inf_wmiDP0_MReqLast,
       inf_wmiDP0_MReset_n,
       inf_wmiDP0_SDataThreadBusy,
       inf_wmiDP0_SReset_n,
       inf_wmiDP0_SRespLast,
       inf_wmiDP0_SThreadBusy,
       inf_wmiDP1_MAddrSpace,
       inf_wmiDP1_MDataLast,
       inf_wmiDP1_MDataValid,
       inf_wmiDP1_MReqInfo,
       inf_wmiDP1_MReqLast,
       inf_wmiDP1_MReset_n,
       inf_wmiDP1_SDataThreadBusy,
       inf_wmiDP1_SReset_n,
       inf_wmiDP1_SRespLast,
       inf_wmiDP1_SThreadBusy;
  // output resets
  assign RST_N_wci_m_0 = inf_RST_N_wci_m_8 ;
  assign RST_N_wci_m_1 = inf_RST_N_wci_m_9 ;
  assign RST_N_wci_m_2 = inf_RST_N_wci_m_10 ;
  assign RST_N_wci_m_3 = inf_RST_N_wci_m_11 ;
  assign RST_N_wci_m_4 = inf_RST_N_wci_m_12 ;
  // action method server_request_put
  assign RDY_server_request_put = inf_RDY_server_request_put ;
  // actionvalue method server_response_get
  assign server_response_get = inf_server_response_get ;
  assign RDY_server_response_get = inf_RDY_server_response_get ;
  // action method cpServer_request_put
  assign RDY_cpServer_request_put = inf_RDY_cpServer_request_put ;
  // actionvalue method cpServer_response_get
  assign cpServer_response_get = inf_cpServer_response_get ;
  assign RDY_cpServer_response_get = inf_RDY_cpServer_response_get ;
  // value method led
  assign led = inf_led ;
  // value method wci_m_0_mCmd
  assign wci_m_0_MCmd = inf_wci_m_8_MCmd ;
  // value method wci_m_0_mAddrSpace
  assign wci_m_0_MAddrSpace = inf_wci_m_8_MAddrSpace ;
  // value method wci_m_0_mByteEn
  assign wci_m_0_MByteEn = inf_wci_m_8_MByteEn ;
  // value method wci_m_0_mAddr
  assign wci_m_0_MAddr = inf_wci_m_8_MAddr ;
  // value method wci_m_0_mData
  assign wci_m_0_MData = inf_wci_m_8_MData ;
  // value method wci_m_0_mFlag
  assign wci_m_0_MFlag = inf_wci_m_8_MFlag ;
  // value method wci_m_1_mCmd
  assign wci_m_1_MCmd = inf_wci_m_9_MCmd ;
  // value method wci_m_1_mAddrSpace
  assign wci_m_1_MAddrSpace = inf_wci_m_9_MAddrSpace ;
  // value method wci_m_1_mByteEn
  assign wci_m_1_MByteEn = inf_wci_m_9_MByteEn ;
  // value method wci_m_1_mAddr
  assign wci_m_1_MAddr = inf_wci_m_9_MAddr ;
  // value method wci_m_1_mData
  assign wci_m_1_MData = inf_wci_m_9_MData ;
  // value method wci_m_1_mFlag
  assign wci_m_1_MFlag = inf_wci_m_9_MFlag ;
  // value method wci_m_2_mCmd
  assign wci_m_2_MCmd = inf_wci_m_10_MCmd ;
  // value method wci_m_2_mAddrSpace
  assign wci_m_2_MAddrSpace = inf_wci_m_10_MAddrSpace ;
  // value method wci_m_2_mByteEn
  assign wci_m_2_MByteEn = inf_wci_m_10_MByteEn ;
  // value method wci_m_2_mAddr
  assign wci_m_2_MAddr = inf_wci_m_10_MAddr ;
  // value method wci_m_2_mData
  assign wci_m_2_MData = inf_wci_m_10_MData ;
  // value method wci_m_2_mFlag
  assign wci_m_2_MFlag = inf_wci_m_10_MFlag ;
  // value method wci_m_3_mCmd
  assign wci_m_3_MCmd = inf_wci_m_11_MCmd ;
  // value method wci_m_3_mAddrSpace
  assign wci_m_3_MAddrSpace = inf_wci_m_11_MAddrSpace ;
  // value method wci_m_3_mByteEn
  assign wci_m_3_MByteEn = inf_wci_m_11_MByteEn ;
  // value method wci_m_3_mAddr
  assign wci_m_3_MAddr = inf_wci_m_11_MAddr ;
  // value method wci_m_3_mData
  assign wci_m_3_MData = inf_wci_m_11_MData ;
  // value method wci_m_3_mFlag
  assign wci_m_3_MFlag = inf_wci_m_11_MFlag ;
  // value method wci_m_4_mCmd
  assign wci_m_4_MCmd = inf_wci_m_12_MCmd ;
  // value method wci_m_4_mAddrSpace
  assign wci_m_4_MAddrSpace = inf_wci_m_12_MAddrSpace ;
  // value method wci_m_4_mByteEn
  assign wci_m_4_MByteEn = inf_wci_m_12_MByteEn ;
  // value method wci_m_4_mAddr
  assign wci_m_4_MAddr = inf_wci_m_12_MAddr ;
  // value method wci_m_4_mData
  assign wci_m_4_MData = inf_wci_m_12_MData ;
  // value method wci_m_4_mFlag
  assign wci_m_4_MFlag = inf_wci_m_12_MFlag ;
  // value method cpNow
  assign cpNow = inf_cpNow ;
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
  assign wsi_m_dac_MData = 128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ;
  // value method wsi_m_dac_mByteEn
  assign wsi_m_dac_MByteEn = 16'hAAAA ;
  // value method wsi_m_dac_mReqInfo
  assign wsi_m_dac_MReqInfo = 8'hAA ;
  // value method wsi_m_dac_mReset_n
  assign wsi_m_dac_MReset_n = 1'h0 ;
  // value method wmemiM0_mCmd
  assign wmemiM0_MCmd = app_wmemiM0_MCmd ;
  // value method wmemiM0_mReqLast
  assign wmemiM0_MReqLast = app_wmemiM0_MReqLast ;
  // value method wmemiM0_mAddr
  assign wmemiM0_MAddr = app_wmemiM0_MAddr ;
  // value method wmemiM0_mBurstLength
  assign wmemiM0_MBurstLength = app_wmemiM0_MBurstLength ;
  // value method wmemiM0_mDataValid
  assign wmemiM0_MDataValid = app_wmemiM0_MDataValid ;
  // value method wmemiM0_mDataLast
  assign wmemiM0_MDataLast = app_wmemiM0_MDataLast ;
  // value method wmemiM0_mData
  assign wmemiM0_MData = app_wmemiM0_MData ;
  // value method wmemiM0_mDataByteEn
  assign wmemiM0_MDataByteEn = app_wmemiM0_MDataByteEn ;
  // value method wmemiM0_mReset_n
  assign wmemiM0_MReset_n = app_wmemiM0_MReset_n ;
  // value method gps_ppsSyncOut
  assign gps_ppsSyncOut = inf_gps_ppsSyncOut ;
  // submodule app
  mkOCApp16B #(.hasDebugLogic(1'd1)) app(.RST_N_rst_0(inf_RST_N_wci_m_0),
					 .RST_N_rst_1(inf_RST_N_wci_m_1),
					 .RST_N_rst_2(inf_RST_N_wci_m_2),
					 .RST_N_rst_3(inf_RST_N_wci_m_3),
					 .RST_N_rst_4(inf_RST_N_wci_m_4),
					 .RST_N_rst_5(inf_RST_N_wci_m_5),
					 .RST_N_rst_6(inf_RST_N_wci_m_6),
					 .RST_N_rst_7(inf_RST_N_wci_m_7),
					 .CLK(CLK),
					 .RST_N(RST_N),
					 .wci_s_0_MAddr(app_wci_s_0_MAddr),
					 .wci_s_0_MAddrSpace(app_wci_s_0_MAddrSpace),
					 .wci_s_0_MByteEn(app_wci_s_0_MByteEn),
					 .wci_s_0_MCmd(app_wci_s_0_MCmd),
					 .wci_s_0_MData(app_wci_s_0_MData),
					 .wci_s_0_MFlag(app_wci_s_0_MFlag),
					 .wci_s_1_MAddr(app_wci_s_1_MAddr),
					 .wci_s_1_MAddrSpace(app_wci_s_1_MAddrSpace),
					 .wci_s_1_MByteEn(app_wci_s_1_MByteEn),
					 .wci_s_1_MCmd(app_wci_s_1_MCmd),
					 .wci_s_1_MData(app_wci_s_1_MData),
					 .wci_s_1_MFlag(app_wci_s_1_MFlag),
					 .wci_s_2_MAddr(app_wci_s_2_MAddr),
					 .wci_s_2_MAddrSpace(app_wci_s_2_MAddrSpace),
					 .wci_s_2_MByteEn(app_wci_s_2_MByteEn),
					 .wci_s_2_MCmd(app_wci_s_2_MCmd),
					 .wci_s_2_MData(app_wci_s_2_MData),
					 .wci_s_2_MFlag(app_wci_s_2_MFlag),
					 .wci_s_3_MAddr(app_wci_s_3_MAddr),
					 .wci_s_3_MAddrSpace(app_wci_s_3_MAddrSpace),
					 .wci_s_3_MByteEn(app_wci_s_3_MByteEn),
					 .wci_s_3_MCmd(app_wci_s_3_MCmd),
					 .wci_s_3_MData(app_wci_s_3_MData),
					 .wci_s_3_MFlag(app_wci_s_3_MFlag),
					 .wci_s_4_MAddr(app_wci_s_4_MAddr),
					 .wci_s_4_MAddrSpace(app_wci_s_4_MAddrSpace),
					 .wci_s_4_MByteEn(app_wci_s_4_MByteEn),
					 .wci_s_4_MCmd(app_wci_s_4_MCmd),
					 .wci_s_4_MData(app_wci_s_4_MData),
					 .wci_s_4_MFlag(app_wci_s_4_MFlag),
					 .wci_s_5_MAddr(app_wci_s_5_MAddr),
					 .wci_s_5_MAddrSpace(app_wci_s_5_MAddrSpace),
					 .wci_s_5_MByteEn(app_wci_s_5_MByteEn),
					 .wci_s_5_MCmd(app_wci_s_5_MCmd),
					 .wci_s_5_MData(app_wci_s_5_MData),
					 .wci_s_5_MFlag(app_wci_s_5_MFlag),
					 .wci_s_6_MAddr(app_wci_s_6_MAddr),
					 .wci_s_6_MAddrSpace(app_wci_s_6_MAddrSpace),
					 .wci_s_6_MByteEn(app_wci_s_6_MByteEn),
					 .wci_s_6_MCmd(app_wci_s_6_MCmd),
					 .wci_s_6_MData(app_wci_s_6_MData),
					 .wci_s_6_MFlag(app_wci_s_6_MFlag),
					 .wci_s_7_MAddr(app_wci_s_7_MAddr),
					 .wci_s_7_MAddrSpace(app_wci_s_7_MAddrSpace),
					 .wci_s_7_MByteEn(app_wci_s_7_MByteEn),
					 .wci_s_7_MCmd(app_wci_s_7_MCmd),
					 .wci_s_7_MData(app_wci_s_7_MData),
					 .wci_s_7_MFlag(app_wci_s_7_MFlag),
					 .wmemiM0_SData(app_wmemiM0_SData),
					 .wmemiM0_SResp(app_wmemiM0_SResp),
					 .wmiM0_SData(app_wmiM0_SData),
					 .wmiM0_SFlag(app_wmiM0_SFlag),
					 .wmiM0_SResp(app_wmiM0_SResp),
					 .wmiM1_SData(app_wmiM1_SData),
					 .wmiM1_SFlag(app_wmiM1_SFlag),
					 .wmiM1_SResp(app_wmiM1_SResp),
					 .wsi_s_adc_MBurstLength(app_wsi_s_adc_MBurstLength),
					 .wsi_s_adc_MByteEn(app_wsi_s_adc_MByteEn),
					 .wsi_s_adc_MCmd(app_wsi_s_adc_MCmd),
					 .wsi_s_adc_MData(app_wsi_s_adc_MData),
					 .wsi_s_adc_MReqInfo(app_wsi_s_adc_MReqInfo),
					 .wti_s_0_MCmd(app_wti_s_0_MCmd),
					 .wti_s_0_MData(app_wti_s_0_MData),
					 .wti_s_1_MCmd(app_wti_s_1_MCmd),
					 .wti_s_1_MData(app_wti_s_1_MData),
					 .wti_s_2_MCmd(app_wti_s_2_MCmd),
					 .wti_s_2_MData(app_wti_s_2_MData),
					 .wmiM0_SThreadBusy(app_wmiM0_SThreadBusy),
					 .wmiM0_SDataThreadBusy(app_wmiM0_SDataThreadBusy),
					 .wmiM0_SRespLast(app_wmiM0_SRespLast),
					 .wmiM0_SReset_n(app_wmiM0_SReset_n),
					 .wmiM1_SThreadBusy(app_wmiM1_SThreadBusy),
					 .wmiM1_SDataThreadBusy(app_wmiM1_SDataThreadBusy),
					 .wmiM1_SRespLast(app_wmiM1_SRespLast),
					 .wmiM1_SReset_n(app_wmiM1_SReset_n),
					 .wmemiM0_SRespLast(app_wmemiM0_SRespLast),
					 .wmemiM0_SCmdAccept(app_wmemiM0_SCmdAccept),
					 .wmemiM0_SDataAccept(app_wmemiM0_SDataAccept),
					 .wsi_s_adc_MReqLast(app_wsi_s_adc_MReqLast),
					 .wsi_s_adc_MBurstPrecise(app_wsi_s_adc_MBurstPrecise),
					 .wsi_s_adc_MReset_n(app_wsi_s_adc_MReset_n),
					 .wsi_m_dac_SThreadBusy(app_wsi_m_dac_SThreadBusy),
					 .wsi_m_dac_SReset_n(app_wsi_m_dac_SReset_n),
					 .wci_s_0_SResp(app_wci_s_0_SResp),
					 .wci_s_0_SData(app_wci_s_0_SData),
					 .wci_s_0_SThreadBusy(app_wci_s_0_SThreadBusy),
					 .wci_s_0_SFlag(app_wci_s_0_SFlag),
					 .wci_s_1_SResp(app_wci_s_1_SResp),
					 .wci_s_1_SData(app_wci_s_1_SData),
					 .wci_s_1_SThreadBusy(app_wci_s_1_SThreadBusy),
					 .wci_s_1_SFlag(app_wci_s_1_SFlag),
					 .wci_s_2_SResp(app_wci_s_2_SResp),
					 .wci_s_2_SData(app_wci_s_2_SData),
					 .wci_s_2_SThreadBusy(app_wci_s_2_SThreadBusy),
					 .wci_s_2_SFlag(app_wci_s_2_SFlag),
					 .wci_s_3_SResp(app_wci_s_3_SResp),
					 .wci_s_3_SData(app_wci_s_3_SData),
					 .wci_s_3_SThreadBusy(app_wci_s_3_SThreadBusy),
					 .wci_s_3_SFlag(app_wci_s_3_SFlag),
					 .wci_s_4_SResp(app_wci_s_4_SResp),
					 .wci_s_4_SData(app_wci_s_4_SData),
					 .wci_s_4_SThreadBusy(app_wci_s_4_SThreadBusy),
					 .wci_s_4_SFlag(app_wci_s_4_SFlag),
					 .wci_s_5_SResp(app_wci_s_5_SResp),
					 .wci_s_5_SData(app_wci_s_5_SData),
					 .wci_s_5_SThreadBusy(app_wci_s_5_SThreadBusy),
					 .wci_s_5_SFlag(app_wci_s_5_SFlag),
					 .wci_s_6_SResp(app_wci_s_6_SResp),
					 .wci_s_6_SData(app_wci_s_6_SData),
					 .wci_s_6_SThreadBusy(app_wci_s_6_SThreadBusy),
					 .wci_s_6_SFlag(app_wci_s_6_SFlag),
					 .wci_s_7_SResp(app_wci_s_7_SResp),
					 .wci_s_7_SData(app_wci_s_7_SData),
					 .wci_s_7_SThreadBusy(app_wci_s_7_SThreadBusy),
					 .wci_s_7_SFlag(app_wci_s_7_SFlag),
					 .wti_s_0_SThreadBusy(app_wti_s_0_SThreadBusy),
					 .wti_s_0_SReset_n(app_wti_s_0_SReset_n),
					 .wti_s_1_SThreadBusy(app_wti_s_1_SThreadBusy),
					 .wti_s_1_SReset_n(app_wti_s_1_SReset_n),
					 .wti_s_2_SThreadBusy(app_wti_s_2_SThreadBusy),
					 .wti_s_2_SReset_n(app_wti_s_2_SReset_n),
					 .wmiM0_MCmd(app_wmiM0_MCmd),
					 .wmiM0_MReqLast(app_wmiM0_MReqLast),
					 .wmiM0_MReqInfo(app_wmiM0_MReqInfo),
					 .wmiM0_MAddrSpace(app_wmiM0_MAddrSpace),
					 .wmiM0_MAddr(app_wmiM0_MAddr),
					 .wmiM0_MBurstLength(app_wmiM0_MBurstLength),
					 .wmiM0_MDataValid(app_wmiM0_MDataValid),
					 .wmiM0_MDataLast(app_wmiM0_MDataLast),
					 .wmiM0_MData(app_wmiM0_MData),
					 .wmiM0_MDataByteEn(app_wmiM0_MDataByteEn),
					 .wmiM0_MFlag(app_wmiM0_MFlag),
					 .wmiM0_MReset_n(app_wmiM0_MReset_n),
					 .wmiM1_MCmd(app_wmiM1_MCmd),
					 .wmiM1_MReqLast(app_wmiM1_MReqLast),
					 .wmiM1_MReqInfo(app_wmiM1_MReqInfo),
					 .wmiM1_MAddrSpace(app_wmiM1_MAddrSpace),
					 .wmiM1_MAddr(app_wmiM1_MAddr),
					 .wmiM1_MBurstLength(app_wmiM1_MBurstLength),
					 .wmiM1_MDataValid(app_wmiM1_MDataValid),
					 .wmiM1_MDataLast(app_wmiM1_MDataLast),
					 .wmiM1_MData(app_wmiM1_MData),
					 .wmiM1_MDataByteEn(app_wmiM1_MDataByteEn),
					 .wmiM1_MFlag(app_wmiM1_MFlag),
					 .wmiM1_MReset_n(app_wmiM1_MReset_n),
					 .wmemiM0_MCmd(app_wmemiM0_MCmd),
					 .wmemiM0_MReqLast(app_wmemiM0_MReqLast),
					 .wmemiM0_MAddr(app_wmemiM0_MAddr),
					 .wmemiM0_MBurstLength(app_wmemiM0_MBurstLength),
					 .wmemiM0_MDataValid(app_wmemiM0_MDataValid),
					 .wmemiM0_MDataLast(app_wmemiM0_MDataLast),
					 .wmemiM0_MData(app_wmemiM0_MData),
					 .wmemiM0_MDataByteEn(app_wmemiM0_MDataByteEn),
					 .wmemiM0_MReset_n(app_wmemiM0_MReset_n),
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
					 .uuid(app_uuid));
  // submodule ctNow
  SyncRegister #(.width(32'd64), .init(64'd0)) ctNow(.sCLK(CLK_sys0_clk),
						     .dCLK(CLK),
						     .sRST(RST_N_sys0_rst),
						     .sD_IN(ctNow_sD_IN),
						     .sEN(ctNow_sEN),
						     .dD_OUT(ctNow_dD_OUT),
						     .sRDY(ctNow_sRDY));
  // submodule inf
  mkOCInf16B inf(.pciDevice(pciDevice),
		 .CLK_sys0_clk(CLK_sys0_clk),
		 .RST_N_sys0_rst(RST_N_sys0_rst),
		 .CLK(CLK),
		 .RST_N(RST_N),
		 .cpServer_request_put(inf_cpServer_request_put),
		 .gps_ppsSyncIn_x(inf_gps_ppsSyncIn_x),
		 .server_request_put(inf_server_request_put),
		 .switch_x(inf_switch_x),
		 .uuid_arg(inf_uuid_arg),
		 .wci_m_0_SData(inf_wci_m_0_SData),
		 .wci_m_0_SFlag(inf_wci_m_0_SFlag),
		 .wci_m_0_SResp(inf_wci_m_0_SResp),
		 .wci_m_10_SData(inf_wci_m_10_SData),
		 .wci_m_10_SFlag(inf_wci_m_10_SFlag),
		 .wci_m_10_SResp(inf_wci_m_10_SResp),
		 .wci_m_11_SData(inf_wci_m_11_SData),
		 .wci_m_11_SFlag(inf_wci_m_11_SFlag),
		 .wci_m_11_SResp(inf_wci_m_11_SResp),
		 .wci_m_12_SData(inf_wci_m_12_SData),
		 .wci_m_12_SFlag(inf_wci_m_12_SFlag),
		 .wci_m_12_SResp(inf_wci_m_12_SResp),
		 .wci_m_1_SData(inf_wci_m_1_SData),
		 .wci_m_1_SFlag(inf_wci_m_1_SFlag),
		 .wci_m_1_SResp(inf_wci_m_1_SResp),
		 .wci_m_2_SData(inf_wci_m_2_SData),
		 .wci_m_2_SFlag(inf_wci_m_2_SFlag),
		 .wci_m_2_SResp(inf_wci_m_2_SResp),
		 .wci_m_3_SData(inf_wci_m_3_SData),
		 .wci_m_3_SFlag(inf_wci_m_3_SFlag),
		 .wci_m_3_SResp(inf_wci_m_3_SResp),
		 .wci_m_4_SData(inf_wci_m_4_SData),
		 .wci_m_4_SFlag(inf_wci_m_4_SFlag),
		 .wci_m_4_SResp(inf_wci_m_4_SResp),
		 .wci_m_5_SData(inf_wci_m_5_SData),
		 .wci_m_5_SFlag(inf_wci_m_5_SFlag),
		 .wci_m_5_SResp(inf_wci_m_5_SResp),
		 .wci_m_6_SData(inf_wci_m_6_SData),
		 .wci_m_6_SFlag(inf_wci_m_6_SFlag),
		 .wci_m_6_SResp(inf_wci_m_6_SResp),
		 .wci_m_7_SData(inf_wci_m_7_SData),
		 .wci_m_7_SFlag(inf_wci_m_7_SFlag),
		 .wci_m_7_SResp(inf_wci_m_7_SResp),
		 .wci_m_8_SData(inf_wci_m_8_SData),
		 .wci_m_8_SFlag(inf_wci_m_8_SFlag),
		 .wci_m_8_SResp(inf_wci_m_8_SResp),
		 .wci_m_9_SData(inf_wci_m_9_SData),
		 .wci_m_9_SFlag(inf_wci_m_9_SFlag),
		 .wci_m_9_SResp(inf_wci_m_9_SResp),
		 .wmiDP0_MAddr(inf_wmiDP0_MAddr),
		 .wmiDP0_MAddrSpace(inf_wmiDP0_MAddrSpace),
		 .wmiDP0_MBurstLength(inf_wmiDP0_MBurstLength),
		 .wmiDP0_MCmd(inf_wmiDP0_MCmd),
		 .wmiDP0_MData(inf_wmiDP0_MData),
		 .wmiDP0_MDataByteEn(inf_wmiDP0_MDataByteEn),
		 .wmiDP0_MReqInfo(inf_wmiDP0_MReqInfo),
		 .wmiDP0_arg_mFlag(inf_wmiDP0_arg_mFlag),
		 .wmiDP1_MAddr(inf_wmiDP1_MAddr),
		 .wmiDP1_MAddrSpace(inf_wmiDP1_MAddrSpace),
		 .wmiDP1_MBurstLength(inf_wmiDP1_MBurstLength),
		 .wmiDP1_MCmd(inf_wmiDP1_MCmd),
		 .wmiDP1_MData(inf_wmiDP1_MData),
		 .wmiDP1_MDataByteEn(inf_wmiDP1_MDataByteEn),
		 .wmiDP1_MReqInfo(inf_wmiDP1_MReqInfo),
		 .wmiDP1_arg_mFlag(inf_wmiDP1_arg_mFlag),
		 .EN_server_request_put(inf_EN_server_request_put),
		 .EN_server_response_get(inf_EN_server_response_get),
		 .EN_cpServer_request_put(inf_EN_cpServer_request_put),
		 .EN_cpServer_response_get(inf_EN_cpServer_response_get),
		 .wci_m_0_SThreadBusy(inf_wci_m_0_SThreadBusy),
		 .wci_m_1_SThreadBusy(inf_wci_m_1_SThreadBusy),
		 .wci_m_2_SThreadBusy(inf_wci_m_2_SThreadBusy),
		 .wci_m_3_SThreadBusy(inf_wci_m_3_SThreadBusy),
		 .wci_m_4_SThreadBusy(inf_wci_m_4_SThreadBusy),
		 .wci_m_5_SThreadBusy(inf_wci_m_5_SThreadBusy),
		 .wci_m_6_SThreadBusy(inf_wci_m_6_SThreadBusy),
		 .wci_m_7_SThreadBusy(inf_wci_m_7_SThreadBusy),
		 .wci_m_8_SThreadBusy(inf_wci_m_8_SThreadBusy),
		 .wci_m_9_SThreadBusy(inf_wci_m_9_SThreadBusy),
		 .wci_m_10_SThreadBusy(inf_wci_m_10_SThreadBusy),
		 .wci_m_11_SThreadBusy(inf_wci_m_11_SThreadBusy),
		 .wci_m_12_SThreadBusy(inf_wci_m_12_SThreadBusy),
		 .wmiDP0_MReqLast(inf_wmiDP0_MReqLast),
		 .wmiDP0_MDataValid(inf_wmiDP0_MDataValid),
		 .wmiDP0_MDataLast(inf_wmiDP0_MDataLast),
		 .wmiDP0_MReset_n(inf_wmiDP0_MReset_n),
		 .wmiDP1_MReqLast(inf_wmiDP1_MReqLast),
		 .wmiDP1_MDataValid(inf_wmiDP1_MDataValid),
		 .wmiDP1_MDataLast(inf_wmiDP1_MDataLast),
		 .wmiDP1_MReset_n(inf_wmiDP1_MReset_n),
		 .RDY_server_request_put(inf_RDY_server_request_put),
		 .server_response_get(inf_server_response_get),
		 .RDY_server_response_get(inf_RDY_server_response_get),
		 .RDY_cpServer_request_put(inf_RDY_cpServer_request_put),
		 .cpServer_response_get(inf_cpServer_response_get),
		 .RDY_cpServer_response_get(inf_RDY_cpServer_response_get),
		 .led(inf_led),
		 .wci_m_0_MCmd(inf_wci_m_0_MCmd),
		 .wci_m_0_MAddrSpace(inf_wci_m_0_MAddrSpace),
		 .wci_m_0_MByteEn(inf_wci_m_0_MByteEn),
		 .wci_m_0_MAddr(inf_wci_m_0_MAddr),
		 .wci_m_0_MData(inf_wci_m_0_MData),
		 .wci_m_0_MFlag(inf_wci_m_0_MFlag),
		 .wci_m_1_MCmd(inf_wci_m_1_MCmd),
		 .wci_m_1_MAddrSpace(inf_wci_m_1_MAddrSpace),
		 .wci_m_1_MByteEn(inf_wci_m_1_MByteEn),
		 .wci_m_1_MAddr(inf_wci_m_1_MAddr),
		 .wci_m_1_MData(inf_wci_m_1_MData),
		 .wci_m_1_MFlag(inf_wci_m_1_MFlag),
		 .wci_m_2_MCmd(inf_wci_m_2_MCmd),
		 .wci_m_2_MAddrSpace(inf_wci_m_2_MAddrSpace),
		 .wci_m_2_MByteEn(inf_wci_m_2_MByteEn),
		 .wci_m_2_MAddr(inf_wci_m_2_MAddr),
		 .wci_m_2_MData(inf_wci_m_2_MData),
		 .wci_m_2_MFlag(inf_wci_m_2_MFlag),
		 .wci_m_3_MCmd(inf_wci_m_3_MCmd),
		 .wci_m_3_MAddrSpace(inf_wci_m_3_MAddrSpace),
		 .wci_m_3_MByteEn(inf_wci_m_3_MByteEn),
		 .wci_m_3_MAddr(inf_wci_m_3_MAddr),
		 .wci_m_3_MData(inf_wci_m_3_MData),
		 .wci_m_3_MFlag(inf_wci_m_3_MFlag),
		 .wci_m_4_MCmd(inf_wci_m_4_MCmd),
		 .wci_m_4_MAddrSpace(inf_wci_m_4_MAddrSpace),
		 .wci_m_4_MByteEn(inf_wci_m_4_MByteEn),
		 .wci_m_4_MAddr(inf_wci_m_4_MAddr),
		 .wci_m_4_MData(inf_wci_m_4_MData),
		 .wci_m_4_MFlag(inf_wci_m_4_MFlag),
		 .wci_m_5_MCmd(inf_wci_m_5_MCmd),
		 .wci_m_5_MAddrSpace(inf_wci_m_5_MAddrSpace),
		 .wci_m_5_MByteEn(inf_wci_m_5_MByteEn),
		 .wci_m_5_MAddr(inf_wci_m_5_MAddr),
		 .wci_m_5_MData(inf_wci_m_5_MData),
		 .wci_m_5_MFlag(inf_wci_m_5_MFlag),
		 .wci_m_6_MCmd(inf_wci_m_6_MCmd),
		 .wci_m_6_MAddrSpace(inf_wci_m_6_MAddrSpace),
		 .wci_m_6_MByteEn(inf_wci_m_6_MByteEn),
		 .wci_m_6_MAddr(inf_wci_m_6_MAddr),
		 .wci_m_6_MData(inf_wci_m_6_MData),
		 .wci_m_6_MFlag(inf_wci_m_6_MFlag),
		 .wci_m_7_MCmd(inf_wci_m_7_MCmd),
		 .wci_m_7_MAddrSpace(inf_wci_m_7_MAddrSpace),
		 .wci_m_7_MByteEn(inf_wci_m_7_MByteEn),
		 .wci_m_7_MAddr(inf_wci_m_7_MAddr),
		 .wci_m_7_MData(inf_wci_m_7_MData),
		 .wci_m_7_MFlag(inf_wci_m_7_MFlag),
		 .wci_m_8_MCmd(inf_wci_m_8_MCmd),
		 .wci_m_8_MAddrSpace(inf_wci_m_8_MAddrSpace),
		 .wci_m_8_MByteEn(inf_wci_m_8_MByteEn),
		 .wci_m_8_MAddr(inf_wci_m_8_MAddr),
		 .wci_m_8_MData(inf_wci_m_8_MData),
		 .wci_m_8_MFlag(inf_wci_m_8_MFlag),
		 .wci_m_9_MCmd(inf_wci_m_9_MCmd),
		 .wci_m_9_MAddrSpace(inf_wci_m_9_MAddrSpace),
		 .wci_m_9_MByteEn(inf_wci_m_9_MByteEn),
		 .wci_m_9_MAddr(inf_wci_m_9_MAddr),
		 .wci_m_9_MData(inf_wci_m_9_MData),
		 .wci_m_9_MFlag(inf_wci_m_9_MFlag),
		 .wci_m_10_MCmd(inf_wci_m_10_MCmd),
		 .wci_m_10_MAddrSpace(inf_wci_m_10_MAddrSpace),
		 .wci_m_10_MByteEn(inf_wci_m_10_MByteEn),
		 .wci_m_10_MAddr(inf_wci_m_10_MAddr),
		 .wci_m_10_MData(inf_wci_m_10_MData),
		 .wci_m_10_MFlag(inf_wci_m_10_MFlag),
		 .wci_m_11_MCmd(inf_wci_m_11_MCmd),
		 .wci_m_11_MAddrSpace(inf_wci_m_11_MAddrSpace),
		 .wci_m_11_MByteEn(inf_wci_m_11_MByteEn),
		 .wci_m_11_MAddr(inf_wci_m_11_MAddr),
		 .wci_m_11_MData(inf_wci_m_11_MData),
		 .wci_m_11_MFlag(inf_wci_m_11_MFlag),
		 .wci_m_12_MCmd(inf_wci_m_12_MCmd),
		 .wci_m_12_MAddrSpace(inf_wci_m_12_MAddrSpace),
		 .wci_m_12_MByteEn(inf_wci_m_12_MByteEn),
		 .wci_m_12_MAddr(inf_wci_m_12_MAddr),
		 .wci_m_12_MData(inf_wci_m_12_MData),
		 .wci_m_12_MFlag(inf_wci_m_12_MFlag),
		 .wmiDP0_SResp(inf_wmiDP0_SResp),
		 .wmiDP0_SData(inf_wmiDP0_SData),
		 .wmiDP0_SThreadBusy(inf_wmiDP0_SThreadBusy),
		 .wmiDP0_SDataThreadBusy(inf_wmiDP0_SDataThreadBusy),
		 .wmiDP0_SRespLast(inf_wmiDP0_SRespLast),
		 .wmiDP0_SFlag(inf_wmiDP0_SFlag),
		 .wmiDP0_SReset_n(inf_wmiDP0_SReset_n),
		 .wmiDP1_SResp(inf_wmiDP1_SResp),
		 .wmiDP1_SData(inf_wmiDP1_SData),
		 .wmiDP1_SThreadBusy(inf_wmiDP1_SThreadBusy),
		 .wmiDP1_SDataThreadBusy(inf_wmiDP1_SDataThreadBusy),
		 .wmiDP1_SRespLast(inf_wmiDP1_SRespLast),
		 .wmiDP1_SFlag(inf_wmiDP1_SFlag),
		 .wmiDP1_SReset_n(inf_wmiDP1_SReset_n),
		 .cpNow(inf_cpNow),
		 .RDY_cpNow(),
		 .gps_ppsSyncOut(inf_gps_ppsSyncOut),
		 .RDY_uuid(),
		 .RST_N_wci_m_0(inf_RST_N_wci_m_0),
		 .RST_N_wci_m_1(inf_RST_N_wci_m_1),
		 .RST_N_wci_m_2(inf_RST_N_wci_m_2),
		 .RST_N_wci_m_3(inf_RST_N_wci_m_3),
		 .RST_N_wci_m_4(inf_RST_N_wci_m_4),
		 .RST_N_wci_m_5(inf_RST_N_wci_m_5),
		 .RST_N_wci_m_6(inf_RST_N_wci_m_6),
		 .RST_N_wci_m_7(inf_RST_N_wci_m_7),
		 .RST_N_wci_m_8(inf_RST_N_wci_m_8),
		 .RST_N_wci_m_9(inf_RST_N_wci_m_9),
		 .RST_N_wci_m_10(inf_RST_N_wci_m_10),
		 .RST_N_wci_m_11(inf_RST_N_wci_m_11),
		 .RST_N_wci_m_12(inf_RST_N_wci_m_12));
  // inlined wires
  assign wtiM_0_peerIsReady_1_wget = 1'd1 ;
  assign wtiM_0_peerIsReady_1_whas = app_wti_s_0_SReset_n ;
  assign wtiM_1_peerIsReady_1_wget = 1'd1 ;
  assign wtiM_1_peerIsReady_1_whas = app_wti_s_1_SReset_n ;
  assign wtiM_2_peerIsReady_1_wget = 1'd1 ;
  assign wtiM_2_peerIsReady_1_whas = app_wti_s_2_SReset_n ;
  assign wtiM_0_sThreadBusy_pw_whas = app_wti_s_0_SThreadBusy ;
  assign wtiM_1_sThreadBusy_pw_whas = app_wti_s_1_SThreadBusy ;
  assign wtiM_2_sThreadBusy_pw_whas = app_wti_s_2_SThreadBusy ;
  // register wtiM_0_nowReq
  assign wtiM_0_nowReq_D_IN = { 3'd1, ctNow_dD_OUT } ;
  assign wtiM_0_nowReq_EN = 1'd1 ;
  // register wtiM_0_peerIsReady
  assign wtiM_0_peerIsReady_D_IN = app_wti_s_0_SReset_n ;
  assign wtiM_0_peerIsReady_EN = 1'd1 ;
  // register wtiM_0_sThreadBusy_d
  assign wtiM_0_sThreadBusy_d_D_IN = app_wti_s_0_SThreadBusy ;
  assign wtiM_0_sThreadBusy_d_EN = 1'd1 ;
  // register wtiM_1_nowReq
  assign wtiM_1_nowReq_D_IN = wtiM_0_nowReq_D_IN ;
  assign wtiM_1_nowReq_EN = 1'd1 ;
  // register wtiM_1_peerIsReady
  assign wtiM_1_peerIsReady_D_IN = app_wti_s_1_SReset_n ;
  assign wtiM_1_peerIsReady_EN = 1'd1 ;
  // register wtiM_1_sThreadBusy_d
  assign wtiM_1_sThreadBusy_d_D_IN = app_wti_s_1_SThreadBusy ;
  assign wtiM_1_sThreadBusy_d_EN = 1'd1 ;
  // register wtiM_2_nowReq
  assign wtiM_2_nowReq_D_IN = wtiM_0_nowReq_D_IN ;
  assign wtiM_2_nowReq_EN = 1'd1 ;
  // register wtiM_2_peerIsReady
  assign wtiM_2_peerIsReady_D_IN = app_wti_s_2_SReset_n ;
  assign wtiM_2_peerIsReady_EN = 1'd1 ;
  // register wtiM_2_sThreadBusy_d
  assign wtiM_2_sThreadBusy_d_D_IN = app_wti_s_2_SThreadBusy ;
  assign wtiM_2_sThreadBusy_d_EN = 1'd1 ;
  // submodule app
  assign app_wci_s_0_MAddr = inf_wci_m_0_MAddr ;
  assign app_wci_s_0_MAddrSpace = inf_wci_m_0_MAddrSpace ;
  assign app_wci_s_0_MByteEn = inf_wci_m_0_MByteEn ;
  assign app_wci_s_0_MCmd = inf_wci_m_0_MCmd ;
  assign app_wci_s_0_MData = inf_wci_m_0_MData ;
  assign app_wci_s_0_MFlag = inf_wci_m_0_MFlag ;
  assign app_wci_s_1_MAddr = inf_wci_m_1_MAddr ;
  assign app_wci_s_1_MAddrSpace = inf_wci_m_1_MAddrSpace ;
  assign app_wci_s_1_MByteEn = inf_wci_m_1_MByteEn ;
  assign app_wci_s_1_MCmd = inf_wci_m_1_MCmd ;
  assign app_wci_s_1_MData = inf_wci_m_1_MData ;
  assign app_wci_s_1_MFlag = inf_wci_m_1_MFlag ;
  assign app_wci_s_2_MAddr = inf_wci_m_2_MAddr ;
  assign app_wci_s_2_MAddrSpace = inf_wci_m_2_MAddrSpace ;
  assign app_wci_s_2_MByteEn = inf_wci_m_2_MByteEn ;
  assign app_wci_s_2_MCmd = inf_wci_m_2_MCmd ;
  assign app_wci_s_2_MData = inf_wci_m_2_MData ;
  assign app_wci_s_2_MFlag = inf_wci_m_2_MFlag ;
  assign app_wci_s_3_MAddr = inf_wci_m_3_MAddr ;
  assign app_wci_s_3_MAddrSpace = inf_wci_m_3_MAddrSpace ;
  assign app_wci_s_3_MByteEn = inf_wci_m_3_MByteEn ;
  assign app_wci_s_3_MCmd = inf_wci_m_3_MCmd ;
  assign app_wci_s_3_MData = inf_wci_m_3_MData ;
  assign app_wci_s_3_MFlag = inf_wci_m_3_MFlag ;
  assign app_wci_s_4_MAddr = inf_wci_m_4_MAddr ;
  assign app_wci_s_4_MAddrSpace = inf_wci_m_4_MAddrSpace ;
  assign app_wci_s_4_MByteEn = inf_wci_m_4_MByteEn ;
  assign app_wci_s_4_MCmd = inf_wci_m_4_MCmd ;
  assign app_wci_s_4_MData = inf_wci_m_4_MData ;
  assign app_wci_s_4_MFlag = inf_wci_m_4_MFlag ;
  assign app_wci_s_5_MAddr = inf_wci_m_5_MAddr ;
  assign app_wci_s_5_MAddrSpace = inf_wci_m_5_MAddrSpace ;
  assign app_wci_s_5_MByteEn = inf_wci_m_5_MByteEn ;
  assign app_wci_s_5_MCmd = inf_wci_m_5_MCmd ;
  assign app_wci_s_5_MData = inf_wci_m_5_MData ;
  assign app_wci_s_5_MFlag = inf_wci_m_5_MFlag ;
  assign app_wci_s_6_MAddr = inf_wci_m_6_MAddr ;
  assign app_wci_s_6_MAddrSpace = inf_wci_m_6_MAddrSpace ;
  assign app_wci_s_6_MByteEn = inf_wci_m_6_MByteEn ;
  assign app_wci_s_6_MCmd = inf_wci_m_6_MCmd ;
  assign app_wci_s_6_MData = inf_wci_m_6_MData ;
  assign app_wci_s_6_MFlag = inf_wci_m_6_MFlag ;
  assign app_wci_s_7_MAddr = inf_wci_m_7_MAddr ;
  assign app_wci_s_7_MAddrSpace = inf_wci_m_7_MAddrSpace ;
  assign app_wci_s_7_MByteEn = inf_wci_m_7_MByteEn ;
  assign app_wci_s_7_MCmd = inf_wci_m_7_MCmd ;
  assign app_wci_s_7_MData = inf_wci_m_7_MData ;
  assign app_wci_s_7_MFlag = inf_wci_m_7_MFlag ;
  assign app_wmemiM0_SData = wmemiM0_SData ;
  assign app_wmemiM0_SResp = wmemiM0_SResp ;
  assign app_wmiM0_SData = inf_wmiDP0_SData ;
  assign app_wmiM0_SFlag = inf_wmiDP0_SFlag ;
  assign app_wmiM0_SResp = inf_wmiDP0_SResp ;
  assign app_wmiM1_SData = inf_wmiDP1_SData ;
  assign app_wmiM1_SFlag = inf_wmiDP1_SFlag ;
  assign app_wmiM1_SResp = inf_wmiDP1_SResp ;
  assign app_wsi_s_adc_MBurstLength = 12'h0 ;
  assign app_wsi_s_adc_MByteEn = 16'h0 ;
  assign app_wsi_s_adc_MCmd = 3'h0 ;
  assign app_wsi_s_adc_MData = 128'h0 ;
  assign app_wsi_s_adc_MReqInfo = 8'h0 ;
  assign app_wti_s_0_MCmd =
	     wtiM_0_sThreadBusy_d ? 3'd0 : wtiM_0_nowReq[66:64] ;
  assign app_wti_s_0_MData = wtiM_0_nowReq[63:0] ;
  assign app_wti_s_1_MCmd =
	     wtiM_1_sThreadBusy_d ? 3'd0 : wtiM_1_nowReq[66:64] ;
  assign app_wti_s_1_MData = wtiM_1_nowReq[63:0] ;
  assign app_wti_s_2_MCmd =
	     wtiM_2_sThreadBusy_d ? 3'd0 : wtiM_2_nowReq[66:64] ;
  assign app_wti_s_2_MData = wtiM_2_nowReq[63:0] ;
  assign app_wmiM0_SThreadBusy = inf_wmiDP0_SThreadBusy ;
  assign app_wmiM0_SDataThreadBusy = inf_wmiDP0_SDataThreadBusy ;
  assign app_wmiM0_SRespLast = inf_wmiDP0_SRespLast ;
  assign app_wmiM0_SReset_n = inf_wmiDP0_SReset_n ;
  assign app_wmiM1_SThreadBusy = inf_wmiDP1_SThreadBusy ;
  assign app_wmiM1_SDataThreadBusy = inf_wmiDP1_SDataThreadBusy ;
  assign app_wmiM1_SRespLast = inf_wmiDP1_SRespLast ;
  assign app_wmiM1_SReset_n = inf_wmiDP1_SReset_n ;
  assign app_wmemiM0_SRespLast = wmemiM0_SRespLast ;
  assign app_wmemiM0_SCmdAccept = wmemiM0_SCmdAccept ;
  assign app_wmemiM0_SDataAccept = wmemiM0_SDataAccept ;
  assign app_wsi_s_adc_MReqLast = 1'b0 ;
  assign app_wsi_s_adc_MBurstPrecise = 1'b0 ;
  assign app_wsi_s_adc_MReset_n = 1'b0 ;
  assign app_wsi_m_dac_SThreadBusy = 1'b0 ;
  assign app_wsi_m_dac_SReset_n = 1'b0 ;
  // submodule ctNow
  assign ctNow_sD_IN = inf_cpNow ;
  assign ctNow_sEN = ctNow_sRDY ;
  // submodule inf
  assign inf_cpServer_request_put = cpServer_request_put ;
  assign inf_gps_ppsSyncIn_x = gps_ppsSyncIn_x ;
  assign inf_server_request_put = server_request_put ;
  assign inf_switch_x = switch_x ;
  assign inf_uuid_arg = app_uuid ;
  assign inf_wci_m_0_SData = app_wci_s_0_SData ;
  assign inf_wci_m_0_SFlag = app_wci_s_0_SFlag ;
  assign inf_wci_m_0_SResp = app_wci_s_0_SResp ;
  assign inf_wci_m_10_SData = wci_m_2_SData ;
  assign inf_wci_m_10_SFlag = wci_m_2_SFlag ;
  assign inf_wci_m_10_SResp = wci_m_2_SResp ;
  assign inf_wci_m_11_SData = wci_m_3_SData ;
  assign inf_wci_m_11_SFlag = wci_m_3_SFlag ;
  assign inf_wci_m_11_SResp = wci_m_3_SResp ;
  assign inf_wci_m_12_SData = wci_m_4_SData ;
  assign inf_wci_m_12_SFlag = wci_m_4_SFlag ;
  assign inf_wci_m_12_SResp = wci_m_4_SResp ;
  assign inf_wci_m_1_SData = app_wci_s_1_SData ;
  assign inf_wci_m_1_SFlag = app_wci_s_1_SFlag ;
  assign inf_wci_m_1_SResp = app_wci_s_1_SResp ;
  assign inf_wci_m_2_SData = app_wci_s_2_SData ;
  assign inf_wci_m_2_SFlag = app_wci_s_2_SFlag ;
  assign inf_wci_m_2_SResp = app_wci_s_2_SResp ;
  assign inf_wci_m_3_SData = app_wci_s_3_SData ;
  assign inf_wci_m_3_SFlag = app_wci_s_3_SFlag ;
  assign inf_wci_m_3_SResp = app_wci_s_3_SResp ;
  assign inf_wci_m_4_SData = app_wci_s_4_SData ;
  assign inf_wci_m_4_SFlag = app_wci_s_4_SFlag ;
  assign inf_wci_m_4_SResp = app_wci_s_4_SResp ;
  assign inf_wci_m_5_SData = app_wci_s_5_SData ;
  assign inf_wci_m_5_SFlag = app_wci_s_5_SFlag ;
  assign inf_wci_m_5_SResp = app_wci_s_5_SResp ;
  assign inf_wci_m_6_SData = app_wci_s_6_SData ;
  assign inf_wci_m_6_SFlag = app_wci_s_6_SFlag ;
  assign inf_wci_m_6_SResp = app_wci_s_6_SResp ;
  assign inf_wci_m_7_SData = app_wci_s_7_SData ;
  assign inf_wci_m_7_SFlag = app_wci_s_7_SFlag ;
  assign inf_wci_m_7_SResp = app_wci_s_7_SResp ;
  assign inf_wci_m_8_SData = wci_m_0_SData ;
  assign inf_wci_m_8_SFlag = wci_m_0_SFlag ;
  assign inf_wci_m_8_SResp = wci_m_0_SResp ;
  assign inf_wci_m_9_SData = wci_m_1_SData ;
  assign inf_wci_m_9_SFlag = wci_m_1_SFlag ;
  assign inf_wci_m_9_SResp = wci_m_1_SResp ;
  assign inf_wmiDP0_MAddr = app_wmiM0_MAddr ;
  assign inf_wmiDP0_MAddrSpace = app_wmiM0_MAddrSpace ;
  assign inf_wmiDP0_MBurstLength = app_wmiM0_MBurstLength ;
  assign inf_wmiDP0_MCmd = app_wmiM0_MCmd ;
  assign inf_wmiDP0_MData = app_wmiM0_MData ;
  assign inf_wmiDP0_MDataByteEn = app_wmiM0_MDataByteEn ;
  assign inf_wmiDP0_MReqInfo = app_wmiM0_MReqInfo ;
  assign inf_wmiDP0_arg_mFlag = app_wmiM0_MFlag ;
  assign inf_wmiDP1_MAddr = app_wmiM1_MAddr ;
  assign inf_wmiDP1_MAddrSpace = app_wmiM1_MAddrSpace ;
  assign inf_wmiDP1_MBurstLength = app_wmiM1_MBurstLength ;
  assign inf_wmiDP1_MCmd = app_wmiM1_MCmd ;
  assign inf_wmiDP1_MData = app_wmiM1_MData ;
  assign inf_wmiDP1_MDataByteEn = app_wmiM1_MDataByteEn ;
  assign inf_wmiDP1_MReqInfo = app_wmiM1_MReqInfo ;
  assign inf_wmiDP1_arg_mFlag = app_wmiM1_MFlag ;
  assign inf_EN_server_request_put = EN_server_request_put ;
  assign inf_EN_server_response_get = EN_server_response_get ;
  assign inf_EN_cpServer_request_put = EN_cpServer_request_put ;
  assign inf_EN_cpServer_response_get = EN_cpServer_response_get ;
  assign inf_wci_m_0_SThreadBusy = app_wci_s_0_SThreadBusy ;
  assign inf_wci_m_1_SThreadBusy = app_wci_s_1_SThreadBusy ;
  assign inf_wci_m_2_SThreadBusy = app_wci_s_2_SThreadBusy ;
  assign inf_wci_m_3_SThreadBusy = app_wci_s_3_SThreadBusy ;
  assign inf_wci_m_4_SThreadBusy = app_wci_s_4_SThreadBusy ;
  assign inf_wci_m_5_SThreadBusy = app_wci_s_5_SThreadBusy ;
  assign inf_wci_m_6_SThreadBusy = app_wci_s_6_SThreadBusy ;
  assign inf_wci_m_7_SThreadBusy = app_wci_s_7_SThreadBusy ;
  assign inf_wci_m_8_SThreadBusy = wci_m_0_SThreadBusy ;
  assign inf_wci_m_9_SThreadBusy = wci_m_1_SThreadBusy ;
  assign inf_wci_m_10_SThreadBusy = wci_m_2_SThreadBusy ;
  assign inf_wci_m_11_SThreadBusy = wci_m_3_SThreadBusy ;
  assign inf_wci_m_12_SThreadBusy = wci_m_4_SThreadBusy ;
  assign inf_wmiDP0_MReqLast = app_wmiM0_MReqLast ;
  assign inf_wmiDP0_MDataValid = app_wmiM0_MDataValid ;
  assign inf_wmiDP0_MDataLast = app_wmiM0_MDataLast ;
  assign inf_wmiDP0_MReset_n = app_wmiM0_MReset_n ;
  assign inf_wmiDP1_MReqLast = app_wmiM1_MReqLast ;
  assign inf_wmiDP1_MDataValid = app_wmiM1_MDataValid ;
  assign inf_wmiDP1_MDataLast = app_wmiM1_MDataLast ;
  assign inf_wmiDP1_MReset_n = app_wmiM1_MReset_n ;
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
        if (wtiM_0_nowReq_EN)
	  wtiM_0_nowReq <= `BSV_ASSIGNMENT_DELAY wtiM_0_nowReq_D_IN;
	if (wtiM_0_peerIsReady_EN)
	  wtiM_0_peerIsReady <= `BSV_ASSIGNMENT_DELAY wtiM_0_peerIsReady_D_IN;
	if (wtiM_0_sThreadBusy_d_EN)
	  wtiM_0_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      wtiM_0_sThreadBusy_d_D_IN;
	if (wtiM_1_nowReq_EN)
	  wtiM_1_nowReq <= `BSV_ASSIGNMENT_DELAY wtiM_1_nowReq_D_IN;
	if (wtiM_1_peerIsReady_EN)
	  wtiM_1_peerIsReady <= `BSV_ASSIGNMENT_DELAY wtiM_1_peerIsReady_D_IN;
	if (wtiM_1_sThreadBusy_d_EN)
	  wtiM_1_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      wtiM_1_sThreadBusy_d_D_IN;
	if (wtiM_2_nowReq_EN)
	  wtiM_2_nowReq <= `BSV_ASSIGNMENT_DELAY wtiM_2_nowReq_D_IN;
	if (wtiM_2_peerIsReady_EN)
	  wtiM_2_peerIsReady <= `BSV_ASSIGNMENT_DELAY wtiM_2_peerIsReady_D_IN;
	if (wtiM_2_sThreadBusy_d_EN)
	  wtiM_2_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      wtiM_2_sThreadBusy_d_D_IN;
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