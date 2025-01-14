module outputs
  wire [31 : 0] debug;
  wire [7 : 0] gmii_tx_txd;
  wire [4 : 0] led;
  wire CLK_GATE_adc_sclk,
       CLK_GATE_adc_sclkn,
       CLK_GATE_gmii_tx_tx_clk,
       CLK_GATE_rxclkBnd,
       CLK_GATE_sys0Clk,
       CLK_GATE_sys1Clk,
       adc_oe,
       adc_resetp,
       adc_rst,
       adc_sclk,
       adc_sclkgate,
       adc_sclkn,
       adc_sen,
       adc_smosi,
       flash_clk,
       flash_csn,
       flash_mosi,
       gmii_led,
       gmii_rstn,
       gmii_tx_tx_clk,
       gmii_tx_tx_en,
       gmii_tx_tx_er,
       rxclkBnd,
       sys0Clk,
       sys0Rst,
       sys1Clk,
       sys1Rst;
  // inlined wires
  wire [31 : 0] dbgReg_1$wget;
  wire dbgReg_1$whas, tog50_1$wget, tog50_1$whas;
  // register dbgReg
  reg [31 : 0] dbgReg;
  wire [31 : 0] dbgReg$D_IN;
  wire dbgReg$EN;
  // register tog50
  reg tog50;
  wire tog50$D_IN, tog50$EN;
  // ports of submodule bias
  wire [31 : 0] bias$wciS0_MAddr,
		bias$wciS0_MData,
		bias$wciS0_SData,
		bias$wsiM0_MData,
		bias$wsiS0_MData;
  wire [11 : 0] bias$wsiM0_MBurstLength, bias$wsiS0_MBurstLength;
  wire [7 : 0] bias$wsiM0_MReqInfo, bias$wsiS0_MReqInfo;
  wire [3 : 0] bias$wciS0_MByteEn, bias$wsiM0_MByteEn, bias$wsiS0_MByteEn;
  wire [2 : 0] bias$wciS0_MCmd, bias$wsiM0_MCmd, bias$wsiS0_MCmd;
  wire [1 : 0] bias$wciS0_MFlag, bias$wciS0_SFlag, bias$wciS0_SResp;
  wire bias$wciS0_MAddrSpace,
       bias$wciS0_SThreadBusy,
       bias$wsiM0_MBurstPrecise,
       bias$wsiM0_MReqLast,
       bias$wsiM0_MReset_n,
       bias$wsiM0_SReset_n,
       bias$wsiM0_SThreadBusy,
       bias$wsiS0_MBurstPrecise,
       bias$wsiS0_MReqLast,
       bias$wsiS0_MReset_n,
       bias$wsiS0_SReset_n,
       bias$wsiS0_SThreadBusy;
  // ports of submodule clkIn
  wire clkIn$O;
  // ports of submodule clkN210
  wire clkN210$clk0_buf,
       clkN210$clk0_rstn,
       clkN210$clkdv_buf,
       clkN210$clkdv_rstn;
  // ports of submodule cp
  wire [511 : 0] cp$uuid_arg;
  wire [58 : 0] cp$server_request_put;
  wire [39 : 0] cp$server_response_get;
  wire [31 : 0] cp$wci_Vm_0_SData,
		cp$wci_Vm_10_MAddr,
		cp$wci_Vm_10_MData,
		cp$wci_Vm_10_SData,
		cp$wci_Vm_11_SData,
		cp$wci_Vm_12_SData,
		cp$wci_Vm_13_MAddr,
		cp$wci_Vm_13_MData,
		cp$wci_Vm_13_SData,
		cp$wci_Vm_14_MAddr,
		cp$wci_Vm_14_MData,
		cp$wci_Vm_14_SData,
		cp$wci_Vm_1_SData,
		cp$wci_Vm_2_MAddr,
		cp$wci_Vm_2_MData,
		cp$wci_Vm_2_SData,
		cp$wci_Vm_3_MAddr,
		cp$wci_Vm_3_MData,
		cp$wci_Vm_3_SData,
		cp$wci_Vm_4_MAddr,
		cp$wci_Vm_4_MData,
		cp$wci_Vm_4_SData,
		cp$wci_Vm_5_SData,
		cp$wci_Vm_6_SData,
		cp$wci_Vm_7_MAddr,
		cp$wci_Vm_7_MData,
		cp$wci_Vm_7_SData,
		cp$wci_Vm_8_SData,
		cp$wci_Vm_9_MAddr,
		cp$wci_Vm_9_MData,
		cp$wci_Vm_9_SData;
  wire [3 : 0] cp$wci_Vm_10_MByteEn,
	       cp$wci_Vm_13_MByteEn,
	       cp$wci_Vm_14_MByteEn,
	       cp$wci_Vm_2_MByteEn,
	       cp$wci_Vm_3_MByteEn,
	       cp$wci_Vm_4_MByteEn,
	       cp$wci_Vm_7_MByteEn,
	       cp$wci_Vm_9_MByteEn;
  wire [2 : 0] cp$switch_x,
	       cp$wci_Vm_10_MCmd,
	       cp$wci_Vm_13_MCmd,
	       cp$wci_Vm_14_MCmd,
	       cp$wci_Vm_2_MCmd,
	       cp$wci_Vm_3_MCmd,
	       cp$wci_Vm_4_MCmd,
	       cp$wci_Vm_7_MCmd,
	       cp$wci_Vm_9_MCmd;
  wire [1 : 0] cp$wci_Vm_0_SFlag,
	       cp$wci_Vm_0_SResp,
	       cp$wci_Vm_10_MFlag,
	       cp$wci_Vm_10_SFlag,
	       cp$wci_Vm_10_SResp,
	       cp$wci_Vm_11_SFlag,
	       cp$wci_Vm_11_SResp,
	       cp$wci_Vm_12_SFlag,
	       cp$wci_Vm_12_SResp,
	       cp$wci_Vm_13_MFlag,
	       cp$wci_Vm_13_SFlag,
	       cp$wci_Vm_13_SResp,
	       cp$wci_Vm_14_MFlag,
	       cp$wci_Vm_14_SFlag,
	       cp$wci_Vm_14_SResp,
	       cp$wci_Vm_1_SFlag,
	       cp$wci_Vm_1_SResp,
	       cp$wci_Vm_2_MFlag,
	       cp$wci_Vm_2_SFlag,
	       cp$wci_Vm_2_SResp,
	       cp$wci_Vm_3_MFlag,
	       cp$wci_Vm_3_SFlag,
	       cp$wci_Vm_3_SResp,
	       cp$wci_Vm_4_MFlag,
	       cp$wci_Vm_4_SFlag,
	       cp$wci_Vm_4_SResp,
	       cp$wci_Vm_5_SFlag,
	       cp$wci_Vm_5_SResp,
	       cp$wci_Vm_6_SFlag,
	       cp$wci_Vm_6_SResp,
	       cp$wci_Vm_7_MFlag,
	       cp$wci_Vm_7_SFlag,
	       cp$wci_Vm_7_SResp,
	       cp$wci_Vm_8_SFlag,
	       cp$wci_Vm_8_SResp,
	       cp$wci_Vm_9_MFlag,
	       cp$wci_Vm_9_SFlag,
	       cp$wci_Vm_9_SResp;
  wire cp$EN_server_request_put,
       cp$EN_server_response_get,
       cp$RDY_server_request_put,
       cp$RDY_server_response_get,
       cp$RST_N_wci_Vm_10,
       cp$RST_N_wci_Vm_13,
       cp$RST_N_wci_Vm_14,
       cp$RST_N_wci_Vm_2,
       cp$RST_N_wci_Vm_3,
       cp$RST_N_wci_Vm_4,
       cp$RST_N_wci_Vm_7,
       cp$RST_N_wci_Vm_9,
       cp$gps_ppsSyncIn_x,
       cp$wci_Vm_0_SThreadBusy,
       cp$wci_Vm_10_MAddrSpace,
       cp$wci_Vm_10_SThreadBusy,
       cp$wci_Vm_11_SThreadBusy,
       cp$wci_Vm_12_SThreadBusy,
       cp$wci_Vm_13_MAddrSpace,
       cp$wci_Vm_13_SThreadBusy,
       cp$wci_Vm_14_MAddrSpace,
       cp$wci_Vm_14_SThreadBusy,
       cp$wci_Vm_1_SThreadBusy,
       cp$wci_Vm_2_MAddrSpace,
       cp$wci_Vm_2_SThreadBusy,
       cp$wci_Vm_3_MAddrSpace,
       cp$wci_Vm_3_SThreadBusy,
       cp$wci_Vm_4_MAddrSpace,
       cp$wci_Vm_4_SThreadBusy,
       cp$wci_Vm_5_SThreadBusy,
       cp$wci_Vm_6_SThreadBusy,
       cp$wci_Vm_7_MAddrSpace,
       cp$wci_Vm_7_SThreadBusy,
       cp$wci_Vm_8_SThreadBusy,
       cp$wci_Vm_9_MAddrSpace,
       cp$wci_Vm_9_SThreadBusy;
  // ports of submodule edcp
  wire [58 : 0] edcp$client_request_get;
  wire [47 : 0] edcp$macAddr_u;
  wire [39 : 0] edcp$client_response_put,
		edcp$server_request_put,
		edcp$server_response_get;
  wire edcp$EN_client_request_get,
       edcp$EN_client_response_put,
       edcp$EN_macAddr,
       edcp$EN_server_request_put,
       edcp$EN_server_response_get,
       edcp$RDY_client_request_get,
       edcp$RDY_client_response_put,
       edcp$RDY_server_request_put,
       edcp$RDY_server_response_get,
       edcp$ecpRx,
       edcp$ecpTx;
  // ports of submodule eddp0
  wire [47 : 0] eddp0$dstAddr_d, eddp0$macAddr_u;
  wire [39 : 0] eddp0$client_request_get,
		eddp0$client_response_put,
		eddp0$server_request_put,
		eddp0$server_response_get;
  wire [15 : 0] eddp0$dstType_t;
  wire eddp0$EN_client_request_get,
       eddp0$EN_client_response_put,
       eddp0$EN_dstAddr,
       eddp0$EN_dstType,
       eddp0$EN_macAddr,
       eddp0$EN_server_request_put,
       eddp0$EN_server_response_get,
       eddp0$RDY_client_request_get,
       eddp0$RDY_client_response_put,
       eddp0$RDY_server_request_put,
       eddp0$RDY_server_response_get,
       eddp0$edpRx,
       eddp0$edpTx,
       eddp0$edpTxEOP;
  // ports of submodule eddp1
  wire [47 : 0] eddp1$dstAddr_d, eddp1$macAddr_u;
  wire [39 : 0] eddp1$client_request_get,
		eddp1$client_response_put,
		eddp1$server_request_put,
		eddp1$server_response_get;
  wire [15 : 0] eddp1$dstType_t;
  wire eddp1$EN_client_request_get,
       eddp1$EN_client_response_put,
       eddp1$EN_dstAddr,
       eddp1$EN_dstType,
       eddp1$EN_macAddr,
       eddp1$EN_server_request_put,
       eddp1$EN_server_response_get,
       eddp1$RDY_client_request_get,
       eddp1$RDY_client_response_put,
       eddp1$RDY_server_request_put,
       eddp1$RDY_server_response_get,
       eddp1$edpRx,
       eddp1$edpTx;
  // ports of submodule edp0
  wire [66 : 0] edp0$wtiS0_req;
  wire [39 : 0] edp0$server_request_put, edp0$server_response_get;
  wire [31 : 0] edp0$wciS0_MAddr,
		edp0$wciS0_MData,
		edp0$wciS0_SData,
		edp0$wmiS0_MData,
		edp0$wmiS0_SData,
		edp0$wmiS0_SFlag,
		edp0$wmiS0_arg_mFlag;
  wire [13 : 0] edp0$wmiS0_MAddr;
  wire [11 : 0] edp0$wmiS0_MBurstLength;
  wire [3 : 0] edp0$wciS0_MByteEn, edp0$wmiS0_MDataByteEn;
  wire [2 : 0] edp0$wciS0_MCmd, edp0$wmiS0_MCmd;
  wire [1 : 0] edp0$wciS0_MFlag,
	       edp0$wciS0_SFlag,
	       edp0$wciS0_SResp,
	       edp0$wmiS0_SResp;
  wire edp0$EN_server_request_put,
       edp0$EN_server_response_get,
       edp0$RDY_server_request_put,
       edp0$RDY_server_response_get,
       edp0$wciS0_MAddrSpace,
       edp0$wciS0_SThreadBusy,
       edp0$wmiS0_MAddrSpace,
       edp0$wmiS0_MDataLast,
       edp0$wmiS0_MDataValid,
       edp0$wmiS0_MReqInfo,
       edp0$wmiS0_MReqLast,
       edp0$wmiS0_MReset_n,
       edp0$wmiS0_SDataThreadBusy,
       edp0$wmiS0_SReset_n,
       edp0$wmiS0_SRespLast,
       edp0$wmiS0_SThreadBusy;
  // ports of submodule edp1
  wire [66 : 0] edp1$wtiS0_req;
  wire [39 : 0] edp1$server_request_put, edp1$server_response_get;
  wire [31 : 0] edp1$wciS0_MAddr,
		edp1$wciS0_MData,
		edp1$wciS0_SData,
		edp1$wmiS0_MData,
		edp1$wmiS0_SData,
		edp1$wmiS0_SFlag,
		edp1$wmiS0_arg_mFlag;
  wire [13 : 0] edp1$wmiS0_MAddr;
  wire [11 : 0] edp1$wmiS0_MBurstLength;
  wire [3 : 0] edp1$wciS0_MByteEn, edp1$wmiS0_MDataByteEn;
  wire [2 : 0] edp1$wciS0_MCmd, edp1$wmiS0_MCmd;
  wire [1 : 0] edp1$wciS0_MFlag,
	       edp1$wciS0_SFlag,
	       edp1$wciS0_SResp,
	       edp1$wmiS0_SResp;
  wire edp1$EN_server_request_put,
       edp1$EN_server_response_get,
       edp1$RDY_server_request_put,
       edp1$RDY_server_response_get,
       edp1$wciS0_MAddrSpace,
       edp1$wciS0_SThreadBusy,
       edp1$wmiS0_MAddrSpace,
       edp1$wmiS0_MDataLast,
       edp1$wmiS0_MDataValid,
       edp1$wmiS0_MReqInfo,
       edp1$wmiS0_MReqLast,
       edp1$wmiS0_MReset_n,
       edp1$wmiS0_SDataThreadBusy,
       edp1$wmiS0_SReset_n,
       edp1$wmiS0_SRespLast,
       edp1$wmiS0_SThreadBusy;
  // ports of submodule emux
  wire [39 : 0] emux$client0_request_get,
		emux$client0_response_put,
		emux$client1_request_get,
		emux$client1_response_put,
		emux$client2_request_get,
		emux$client2_response_put,
		emux$server_request_put,
		emux$server_response_get;
  wire emux$EN_client0_request_get,
       emux$EN_client0_response_put,
       emux$EN_client1_request_get,
       emux$EN_client1_response_put,
       emux$EN_client2_request_get,
       emux$EN_client2_response_put,
       emux$EN_server_request_put,
       emux$EN_server_response_get,
       emux$RDY_client0_request_get,
       emux$RDY_client0_response_put,
       emux$RDY_client1_request_get,
       emux$RDY_client1_response_put,
       emux$RDY_client2_request_get,
       emux$RDY_client2_response_put,
       emux$RDY_server_request_put,
       emux$RDY_server_response_get;
  // ports of submodule gbe0
  wire [39 : 0] gbe0$client_request_get, gbe0$client_response_put;
  wire [7 : 0] gbe0$gmii_rx_rxd_i, gbe0$gmii_tx_txd;
  wire gbe0$CLK_gmii_tx_tx_clk,
       gbe0$CLK_rxclkBnd,
       gbe0$EN_client_request_get,
       gbe0$EN_client_response_put,
       gbe0$RDY_client_request_get,
       gbe0$RDY_client_response_put,
       gbe0$RST_N_gmii_rstn,
       gbe0$gmRx,
       gbe0$gmTx,
       gbe0$gmii_col_i,
       gbe0$gmii_crs_i,
       gbe0$gmii_intr_i,
       gbe0$gmii_led,
       gbe0$gmii_rx_rx_dv_i,
       gbe0$gmii_rx_rx_er_i,
       gbe0$gmii_tx_tx_en,
       gbe0$gmii_tx_tx_er,
       gbe0$mdio_mdc,
       gbe0$mdio_mdd;
  // ports of submodule gbewrk
  wire [47 : 0] gbewrk$l2Dst;
  wire [31 : 0] gbewrk$dgdpEgressCnt_arg,
		gbewrk$wciS0_MAddr,
		gbewrk$wciS0_MData,
		gbewrk$wciS0_SData;
  wire [15 : 0] gbewrk$l2Typ;
  wire [3 : 0] gbewrk$wciS0_MByteEn;
  wire [2 : 0] gbewrk$wciS0_MCmd;
  wire [1 : 0] gbewrk$wciS0_MFlag, gbewrk$wciS0_SFlag, gbewrk$wciS0_SResp;
  wire gbewrk$EN_dgdpEgressCnt,
       gbewrk$wciS0_MAddrSpace,
       gbewrk$wciS0_SThreadBusy;
  // ports of submodule gmiixo_clk
  wire gmiixo_clk$O;
  // ports of submodule gmiixo_rst
  wire gmiixo_rst$OUT_RST;
  // ports of submodule iqadc
  wire [66 : 0] iqadc$wtiS0_req;
  wire [31 : 0] iqadc$wciS0_MAddr, iqadc$wciS0_MData, iqadc$wciS0_SData;
  wire [13 : 0] iqadc$adc_da_i, iqadc$adc_db_i;
  wire [3 : 0] iqadc$wciS0_MByteEn;
  wire [2 : 0] iqadc$wciS0_MCmd;
  wire [1 : 0] iqadc$wciS0_MFlag, iqadc$wciS0_SFlag, iqadc$wciS0_SResp;
  wire iqadc$CLK_adc_sclk,
       iqadc$CLK_adc_sclkn,
       iqadc$RST_N_adc_rst,
       iqadc$adc_oe,
       iqadc$adc_resetp,
       iqadc$adc_sclkgate,
       iqadc$adc_sen,
       iqadc$adc_smiso_i,
       iqadc$adc_smosi,
       iqadc$wciS0_MAddrSpace,
       iqadc$wciS0_SThreadBusy,
       iqadc$wsiM0_SReset_n,
       iqadc$wsiM0_SThreadBusy;
  // ports of submodule ledLogic
  wire [4 : 0] ledLogic$led, ledLogic$ledDrive_i;
  wire ledLogic$EN_ledDrive;
  // ports of submodule pwrk
  wire [47 : 0] pwrk$macAddr;
  wire [31 : 0] pwrk$wciS0_MAddr, pwrk$wciS0_MData, pwrk$wciS0_SData;
  wire [3 : 0] pwrk$wciS0_MByteEn;
  wire [2 : 0] pwrk$wciS0_MCmd;
  wire [1 : 0] pwrk$wciS0_MFlag, pwrk$wciS0_SFlag, pwrk$wciS0_SResp;
  wire pwrk$i2cpad_scl,
       pwrk$i2cpad_sda,
       pwrk$spipad_clk,
       pwrk$spipad_csn,
       pwrk$spipad_miso_i,
       pwrk$spipad_mosi,
       pwrk$wciS0_MAddrSpace,
       pwrk$wciS0_SThreadBusy;
  // ports of submodule sma0
  wire [31 : 0] sma0$wciS0_MAddr,
		sma0$wciS0_MData,
		sma0$wciS0_SData,
		sma0$wmiM0_MData,
		sma0$wmiM0_MFlag,
		sma0$wmiM0_SData,
		sma0$wmiM0_SFlag,
		sma0$wsiM0_MData,
		sma0$wsiS0_MData;
  wire [13 : 0] sma0$wmiM0_MAddr;
  wire [11 : 0] sma0$wmiM0_MBurstLength,
		sma0$wsiM0_MBurstLength,
		sma0$wsiS0_MBurstLength;
  wire [7 : 0] sma0$wsiM0_MReqInfo, sma0$wsiS0_MReqInfo;
  wire [3 : 0] sma0$wciS0_MByteEn,
	       sma0$wmiM0_MDataByteEn,
	       sma0$wsiM0_MByteEn,
	       sma0$wsiS0_MByteEn;
  wire [2 : 0] sma0$wciS0_MCmd,
	       sma0$wmiM0_MCmd,
	       sma0$wsiM0_MCmd,
	       sma0$wsiS0_MCmd;
  wire [1 : 0] sma0$wciS0_MFlag,
	       sma0$wciS0_SFlag,
	       sma0$wciS0_SResp,
	       sma0$wmiM0_SResp;
  wire sma0$wciS0_MAddrSpace,
       sma0$wciS0_SThreadBusy,
       sma0$wmiM0_MAddrSpace,
       sma0$wmiM0_MDataLast,
       sma0$wmiM0_MDataValid,
       sma0$wmiM0_MReqInfo,
       sma0$wmiM0_MReqLast,
       sma0$wmiM0_MReset_n,
       sma0$wmiM0_SDataThreadBusy,
       sma0$wmiM0_SReset_n,
       sma0$wmiM0_SRespLast,
       sma0$wmiM0_SThreadBusy,
       sma0$wsiM0_MBurstPrecise,
       sma0$wsiM0_MReqLast,
       sma0$wsiM0_MReset_n,
       sma0$wsiM0_SReset_n,
       sma0$wsiM0_SThreadBusy,
       sma0$wsiS0_MBurstPrecise,
       sma0$wsiS0_MReqLast,
       sma0$wsiS0_MReset_n;
  // ports of submodule sma1
  wire [31 : 0] sma1$wciS0_MAddr,
		sma1$wciS0_MData,
		sma1$wciS0_SData,
		sma1$wmiM0_MData,
		sma1$wmiM0_MFlag,
		sma1$wmiM0_SData,
		sma1$wmiM0_SFlag,
		sma1$wsiS0_MData;
  wire [13 : 0] sma1$wmiM0_MAddr;
  wire [11 : 0] sma1$wmiM0_MBurstLength, sma1$wsiS0_MBurstLength;
  wire [7 : 0] sma1$wsiS0_MReqInfo;
  wire [3 : 0] sma1$wciS0_MByteEn, sma1$wmiM0_MDataByteEn, sma1$wsiS0_MByteEn;
  wire [2 : 0] sma1$wciS0_MCmd, sma1$wmiM0_MCmd, sma1$wsiS0_MCmd;
  wire [1 : 0] sma1$wciS0_MFlag,
	       sma1$wciS0_SFlag,
	       sma1$wciS0_SResp,
	       sma1$wmiM0_SResp;
  wire sma1$wciS0_MAddrSpace,
       sma1$wciS0_SThreadBusy,
       sma1$wmiM0_MAddrSpace,
       sma1$wmiM0_MDataLast,
       sma1$wmiM0_MDataValid,
       sma1$wmiM0_MReqInfo,
       sma1$wmiM0_MReqLast,
       sma1$wmiM0_MReset_n,
       sma1$wmiM0_SDataThreadBusy,
       sma1$wmiM0_SReset_n,
       sma1$wmiM0_SRespLast,
       sma1$wmiM0_SThreadBusy,
       sma1$wsiM0_SReset_n,
       sma1$wsiM0_SThreadBusy,
       sma1$wsiS0_MBurstPrecise,
       sma1$wsiS0_MReqLast,
       sma1$wsiS0_MReset_n,
       sma1$wsiS0_SReset_n,
       sma1$wsiS0_SThreadBusy;
  // remaining internal signals
  reg [1 : 0] CASE_edcpserver_response_get_BITS_19_TO_18_3__ETC__q35,
	      CASE_edcpserver_response_get_BITS_29_TO_28_3__ETC__q34,
	      CASE_edcpserver_response_get_BITS_39_TO_38_3__ETC__q33,
	      CASE_edcpserver_response_get_BITS_9_TO_8_3_0__ETC__q36,
	      CASE_eddp0client_request_get_BITS_19_TO_18_3__ETC__q23,
	      CASE_eddp0client_request_get_BITS_29_TO_28_3__ETC__q22,
	      CASE_eddp0client_request_get_BITS_39_TO_38_3__ETC__q21,
	      CASE_eddp0client_request_get_BITS_9_TO_8_3_0__ETC__q24,
	      CASE_eddp0server_response_get_BITS_19_TO_18_3_ETC__q31,
	      CASE_eddp0server_response_get_BITS_29_TO_28_3_ETC__q30,
	      CASE_eddp0server_response_get_BITS_39_TO_38_3_ETC__q29,
	      CASE_eddp0server_response_get_BITS_9_TO_8_3_0_ETC__q32,
	      CASE_eddp1client_request_get_BITS_19_TO_18_3__ETC__q27,
	      CASE_eddp1client_request_get_BITS_29_TO_28_3__ETC__q26,
	      CASE_eddp1client_request_get_BITS_39_TO_38_3__ETC__q25,
	      CASE_eddp1client_request_get_BITS_9_TO_8_3_0__ETC__q28,
	      CASE_eddp1server_response_get_BITS_19_TO_18_3_ETC__q39,
	      CASE_eddp1server_response_get_BITS_29_TO_28_3_ETC__q38,
	      CASE_eddp1server_response_get_BITS_39_TO_38_3_ETC__q37,
	      CASE_eddp1server_response_get_BITS_9_TO_8_3_0_ETC__q40,
	      CASE_edp0server_response_get_BITS_19_TO_18_3__ETC__q7,
	      CASE_edp0server_response_get_BITS_29_TO_28_3__ETC__q6,
	      CASE_edp0server_response_get_BITS_39_TO_38_3__ETC__q5,
	      CASE_edp0server_response_get_BITS_9_TO_8_3_0__ETC__q8,
	      CASE_edp1server_response_get_BITS_19_TO_18_3__ETC__q15,
	      CASE_edp1server_response_get_BITS_29_TO_28_3__ETC__q14,
	      CASE_edp1server_response_get_BITS_39_TO_38_3__ETC__q13,
	      CASE_edp1server_response_get_BITS_9_TO_8_3_0__ETC__q16,
	      CASE_emuxclient0_request_get_BITS_19_TO_18_3__ETC__q3,
	      CASE_emuxclient0_request_get_BITS_29_TO_28_3__ETC__q2,
	      CASE_emuxclient0_request_get_BITS_39_TO_38_3__ETC__q1,
	      CASE_emuxclient0_request_get_BITS_9_TO_8_3_0__ETC__q4,
	      CASE_emuxclient1_request_get_BITS_19_TO_18_3__ETC__q11,
	      CASE_emuxclient1_request_get_BITS_29_TO_28_3__ETC__q10,
	      CASE_emuxclient1_request_get_BITS_39_TO_38_3__ETC__q9,
	      CASE_emuxclient1_request_get_BITS_9_TO_8_3_0__ETC__q12,
	      CASE_emuxclient2_request_get_BITS_19_TO_18_3__ETC__q19,
	      CASE_emuxclient2_request_get_BITS_29_TO_28_3__ETC__q18,
	      CASE_emuxclient2_request_get_BITS_39_TO_38_3__ETC__q17,
	      CASE_emuxclient2_request_get_BITS_9_TO_8_3_0__ETC__q20,
	      CASE_emuxserver_response_get_BITS_19_TO_18_3__ETC__q47,
	      CASE_emuxserver_response_get_BITS_29_TO_28_3__ETC__q46,
	      CASE_emuxserver_response_get_BITS_39_TO_38_3__ETC__q45,
	      CASE_emuxserver_response_get_BITS_9_TO_8_3_0__ETC__q48,
	      CASE_gbe0client_request_get_BITS_19_TO_18_3_0_ETC__q43,
	      CASE_gbe0client_request_get_BITS_29_TO_28_3_0_ETC__q42,
	      CASE_gbe0client_request_get_BITS_39_TO_38_3_0_ETC__q41,
	      CASE_gbe0client_request_get_BITS_9_TO_8_3_0_g_ETC__q44;
  // oscillator and gates for output clock rxclkBnd
  assign rxclkBnd = gbe0$CLK_rxclkBnd ;
  assign CLK_GATE_rxclkBnd = 1'b1 ;
  // oscillator and gates for output clock gmii_tx_tx_clk
  assign gmii_tx_tx_clk = gbe0$CLK_gmii_tx_tx_clk ;
  assign CLK_GATE_gmii_tx_tx_clk = 1'b1 ;
  // oscillator and gates for output clock adc_sclk
  assign adc_sclk = iqadc$CLK_adc_sclk ;
  assign CLK_GATE_adc_sclk = 1'b1 ;
  // oscillator and gates for output clock adc_sclkn
  assign adc_sclkn = iqadc$CLK_adc_sclkn ;
  assign CLK_GATE_adc_sclkn = 1'b1 ;
  // oscillator and gates for output clock sys0Clk
  assign sys0Clk = clkN210$clk0_buf ;
  assign CLK_GATE_sys0Clk = 1'b1 ;
  // oscillator and gates for output clock sys1Clk
  assign sys1Clk = clkN210$clkdv_buf ;
  assign CLK_GATE_sys1Clk = 1'b1 ;
  // output resets
  assign gmii_rstn = gbe0$RST_N_gmii_rstn ;
  assign adc_rst = iqadc$RST_N_adc_rst ;
  assign sys0Rst = clkN210$clk0_rstn ;
  assign sys1Rst = clkN210$clkdv_rstn ;
  // value method led
  assign led = ledLogic$led ;
  // value method debug
  assign debug = dbgReg ;
  // value method gmii_tx_txd
  assign gmii_tx_txd = gbe0$gmii_tx_txd ;
  // value method gmii_tx_tx_en
  assign gmii_tx_tx_en = gbe0$gmii_tx_tx_en ;
  // value method gmii_tx_tx_er
  assign gmii_tx_tx_er = gbe0$gmii_tx_tx_er ;
  // value method gmii_led
  assign gmii_led = gbe0$gmii_led ;
  // value method adc_oe
  assign adc_oe = iqadc$adc_oe ;
  // value method adc_sclkgate
  assign adc_sclkgate = iqadc$adc_sclkgate ;
  // value method adc_resetp
  assign adc_resetp = iqadc$adc_resetp ;
  // value method adc_sen
  assign adc_sen = iqadc$adc_sen ;
  // value method adc_smosi
  assign adc_smosi = iqadc$adc_smosi ;
  // value method flash_mosi
  assign flash_mosi = pwrk$spipad_mosi ;
  // value method flash_clk
  assign flash_clk = pwrk$spipad_clk ;
  // value method flash_csn
  assign flash_csn = pwrk$spipad_csn ;
  // submodule bias
  mkBiasWorker4B #(.hasDebugLogic(1'd1)) bias(.wciS0_Clk(clkN210$clkdv_buf),
					      .wciS0_MReset_n(cp$RST_N_wci_Vm_3),
					      .wciS0_MAddr(bias$wciS0_MAddr),
					      .wciS0_MAddrSpace(bias$wciS0_MAddrSpace),
					      .wciS0_MByteEn(bias$wciS0_MByteEn),
					      .wciS0_MCmd(bias$wciS0_MCmd),
					      .wciS0_MData(bias$wciS0_MData),
					      .wciS0_MFlag(bias$wciS0_MFlag),
					      .wsiS0_MBurstLength(bias$wsiS0_MBurstLength),
					      .wsiS0_MByteEn(bias$wsiS0_MByteEn),
					      .wsiS0_MCmd(bias$wsiS0_MCmd),
					      .wsiS0_MData(bias$wsiS0_MData),
					      .wsiS0_MReqInfo(bias$wsiS0_MReqInfo),
					      .wsiS0_MReqLast(bias$wsiS0_MReqLast),
					      .wsiS0_MBurstPrecise(bias$wsiS0_MBurstPrecise),
					      .wsiS0_MReset_n(bias$wsiS0_MReset_n),
					      .wsiM0_SThreadBusy(bias$wsiM0_SThreadBusy),
					      .wsiM0_SReset_n(bias$wsiM0_SReset_n),
					      .wciS0_SResp(bias$wciS0_SResp),
					      .wciS0_SData(bias$wciS0_SData),
					      .wciS0_SThreadBusy(bias$wciS0_SThreadBusy),
					      .wciS0_SFlag(bias$wciS0_SFlag),
					      .wsiS0_SThreadBusy(bias$wsiS0_SThreadBusy),
					      .wsiS0_SReset_n(bias$wsiS0_SReset_n),
					      .wsiM0_MCmd(bias$wsiM0_MCmd),
					      .wsiM0_MReqLast(bias$wsiM0_MReqLast),
					      .wsiM0_MBurstPrecise(bias$wsiM0_MBurstPrecise),
					      .wsiM0_MBurstLength(bias$wsiM0_MBurstLength),
					      .wsiM0_MData(bias$wsiM0_MData),
					      .wsiM0_MByteEn(bias$wsiM0_MByteEn),
					      .wsiM0_MReqInfo(bias$wsiM0_MReqInfo),
					      .wsiM0_MReset_n(bias$wsiM0_MReset_n));
  // submodule clkIn
  IBUFDS clkIn(.I(sys0_clkp), .IB(sys0_clkn), .O(clkIn$O));
  // submodule clkN210
  clock_n210 clkN210(.clkIn(clkIn$O),
		     .rstIn(fpga_rstn),
		     .locked(),
		     .clk0_buf(clkN210$clk0_buf),
		     .clkdv_buf(clkN210$clkdv_buf),
		     .clk0_rstn(clkN210$clk0_rstn),
		     .clkdv_rstn(clkN210$clkdv_rstn));
  // submodule cp
  mkOCCP cp(.pciDevice(16'hAAAA),
	    .CLK_time_clk(clkN210$clkdv_buf),
	    .RST_N_time_rst(clkN210$clkdv_rstn),
	    .CLK(clkN210$clkdv_buf),
	    .RST_N(clkN210$clkdv_rstn),
	    .gps_ppsSyncIn_x(cp$gps_ppsSyncIn_x),
	    .server_request_put(cp$server_request_put),
	    .switch_x(cp$switch_x),
	    .uuid_arg(cp$uuid_arg),
	    .wci_Vm_0_SData(cp$wci_Vm_0_SData),
	    .wci_Vm_0_SFlag(cp$wci_Vm_0_SFlag),
	    .wci_Vm_0_SResp(cp$wci_Vm_0_SResp),
	    .wci_Vm_10_SData(cp$wci_Vm_10_SData),
	    .wci_Vm_10_SFlag(cp$wci_Vm_10_SFlag),
	    .wci_Vm_10_SResp(cp$wci_Vm_10_SResp),
	    .wci_Vm_11_SData(cp$wci_Vm_11_SData),
	    .wci_Vm_11_SFlag(cp$wci_Vm_11_SFlag),
	    .wci_Vm_11_SResp(cp$wci_Vm_11_SResp),
	    .wci_Vm_12_SData(cp$wci_Vm_12_SData),
	    .wci_Vm_12_SFlag(cp$wci_Vm_12_SFlag),
	    .wci_Vm_12_SResp(cp$wci_Vm_12_SResp),
	    .wci_Vm_13_SData(cp$wci_Vm_13_SData),
	    .wci_Vm_13_SFlag(cp$wci_Vm_13_SFlag),
	    .wci_Vm_13_SResp(cp$wci_Vm_13_SResp),
	    .wci_Vm_14_SData(cp$wci_Vm_14_SData),
	    .wci_Vm_14_SFlag(cp$wci_Vm_14_SFlag),
	    .wci_Vm_14_SResp(cp$wci_Vm_14_SResp),
	    .wci_Vm_1_SData(cp$wci_Vm_1_SData),
	    .wci_Vm_1_SFlag(cp$wci_Vm_1_SFlag),
	    .wci_Vm_1_SResp(cp$wci_Vm_1_SResp),
	    .wci_Vm_2_SData(cp$wci_Vm_2_SData),
	    .wci_Vm_2_SFlag(cp$wci_Vm_2_SFlag),
	    .wci_Vm_2_SResp(cp$wci_Vm_2_SResp),
	    .wci_Vm_3_SData(cp$wci_Vm_3_SData),
	    .wci_Vm_3_SFlag(cp$wci_Vm_3_SFlag),
	    .wci_Vm_3_SResp(cp$wci_Vm_3_SResp),
	    .wci_Vm_4_SData(cp$wci_Vm_4_SData),
	    .wci_Vm_4_SFlag(cp$wci_Vm_4_SFlag),
	    .wci_Vm_4_SResp(cp$wci_Vm_4_SResp),
	    .wci_Vm_5_SData(cp$wci_Vm_5_SData),
	    .wci_Vm_5_SFlag(cp$wci_Vm_5_SFlag),
	    .wci_Vm_5_SResp(cp$wci_Vm_5_SResp),
	    .wci_Vm_6_SData(cp$wci_Vm_6_SData),
	    .wci_Vm_6_SFlag(cp$wci_Vm_6_SFlag),
	    .wci_Vm_6_SResp(cp$wci_Vm_6_SResp),
	    .wci_Vm_7_SData(cp$wci_Vm_7_SData),
	    .wci_Vm_7_SFlag(cp$wci_Vm_7_SFlag),
	    .wci_Vm_7_SResp(cp$wci_Vm_7_SResp),
	    .wci_Vm_8_SData(cp$wci_Vm_8_SData),
	    .wci_Vm_8_SFlag(cp$wci_Vm_8_SFlag),
	    .wci_Vm_8_SResp(cp$wci_Vm_8_SResp),
	    .wci_Vm_9_SData(cp$wci_Vm_9_SData),
	    .wci_Vm_9_SFlag(cp$wci_Vm_9_SFlag),
	    .wci_Vm_9_SResp(cp$wci_Vm_9_SResp),
	    .EN_server_request_put(cp$EN_server_request_put),
	    .EN_server_response_get(cp$EN_server_response_get),
	    .wci_Vm_0_SThreadBusy(cp$wci_Vm_0_SThreadBusy),
	    .wci_Vm_1_SThreadBusy(cp$wci_Vm_1_SThreadBusy),
	    .wci_Vm_2_SThreadBusy(cp$wci_Vm_2_SThreadBusy),
	    .wci_Vm_3_SThreadBusy(cp$wci_Vm_3_SThreadBusy),
	    .wci_Vm_4_SThreadBusy(cp$wci_Vm_4_SThreadBusy),
	    .wci_Vm_5_SThreadBusy(cp$wci_Vm_5_SThreadBusy),
	    .wci_Vm_6_SThreadBusy(cp$wci_Vm_6_SThreadBusy),
	    .wci_Vm_7_SThreadBusy(cp$wci_Vm_7_SThreadBusy),
	    .wci_Vm_8_SThreadBusy(cp$wci_Vm_8_SThreadBusy),
	    .wci_Vm_9_SThreadBusy(cp$wci_Vm_9_SThreadBusy),
	    .wci_Vm_10_SThreadBusy(cp$wci_Vm_10_SThreadBusy),
	    .wci_Vm_11_SThreadBusy(cp$wci_Vm_11_SThreadBusy),
	    .wci_Vm_12_SThreadBusy(cp$wci_Vm_12_SThreadBusy),
	    .wci_Vm_13_SThreadBusy(cp$wci_Vm_13_SThreadBusy),
	    .wci_Vm_14_SThreadBusy(cp$wci_Vm_14_SThreadBusy),
	    .RDY_server_request_put(cp$RDY_server_request_put),
	    .server_response_get(cp$server_response_get),
	    .RDY_server_response_get(cp$RDY_server_response_get),
	    .wci_Vm_0_MCmd(),
	    .wci_Vm_0_MAddrSpace(),
	    .wci_Vm_0_MByteEn(),
	    .wci_Vm_0_MAddr(),
	    .wci_Vm_0_MData(),
	    .wci_Vm_0_MFlag(),
	    .wci_Vm_1_MCmd(),
	    .wci_Vm_1_MAddrSpace(),
	    .wci_Vm_1_MByteEn(),
	    .wci_Vm_1_MAddr(),
	    .wci_Vm_1_MData(),
	    .wci_Vm_1_MFlag(),
	    .wci_Vm_2_MCmd(cp$wci_Vm_2_MCmd),
	    .wci_Vm_2_MAddrSpace(cp$wci_Vm_2_MAddrSpace),
	    .wci_Vm_2_MByteEn(cp$wci_Vm_2_MByteEn),
	    .wci_Vm_2_MAddr(cp$wci_Vm_2_MAddr),
	    .wci_Vm_2_MData(cp$wci_Vm_2_MData),
	    .wci_Vm_2_MFlag(cp$wci_Vm_2_MFlag),
	    .wci_Vm_3_MCmd(cp$wci_Vm_3_MCmd),
	    .wci_Vm_3_MAddrSpace(cp$wci_Vm_3_MAddrSpace),
	    .wci_Vm_3_MByteEn(cp$wci_Vm_3_MByteEn),
	    .wci_Vm_3_MAddr(cp$wci_Vm_3_MAddr),
	    .wci_Vm_3_MData(cp$wci_Vm_3_MData),
	    .wci_Vm_3_MFlag(cp$wci_Vm_3_MFlag),
	    .wci_Vm_4_MCmd(cp$wci_Vm_4_MCmd),
	    .wci_Vm_4_MAddrSpace(cp$wci_Vm_4_MAddrSpace),
	    .wci_Vm_4_MByteEn(cp$wci_Vm_4_MByteEn),
	    .wci_Vm_4_MAddr(cp$wci_Vm_4_MAddr),
	    .wci_Vm_4_MData(cp$wci_Vm_4_MData),
	    .wci_Vm_4_MFlag(cp$wci_Vm_4_MFlag),
	    .wci_Vm_5_MCmd(),
	    .wci_Vm_5_MAddrSpace(),
	    .wci_Vm_5_MByteEn(),
	    .wci_Vm_5_MAddr(),
	    .wci_Vm_5_MData(),
	    .wci_Vm_5_MFlag(),
	    .wci_Vm_6_MCmd(),
	    .wci_Vm_6_MAddrSpace(),
	    .wci_Vm_6_MByteEn(),
	    .wci_Vm_6_MAddr(),
	    .wci_Vm_6_MData(),
	    .wci_Vm_6_MFlag(),
	    .wci_Vm_7_MCmd(cp$wci_Vm_7_MCmd),
	    .wci_Vm_7_MAddrSpace(cp$wci_Vm_7_MAddrSpace),
	    .wci_Vm_7_MByteEn(cp$wci_Vm_7_MByteEn),
	    .wci_Vm_7_MAddr(cp$wci_Vm_7_MAddr),
	    .wci_Vm_7_MData(cp$wci_Vm_7_MData),
	    .wci_Vm_7_MFlag(cp$wci_Vm_7_MFlag),
	    .wci_Vm_8_MCmd(),
	    .wci_Vm_8_MAddrSpace(),
	    .wci_Vm_8_MByteEn(),
	    .wci_Vm_8_MAddr(),
	    .wci_Vm_8_MData(),
	    .wci_Vm_8_MFlag(),
	    .wci_Vm_9_MCmd(cp$wci_Vm_9_MCmd),
	    .wci_Vm_9_MAddrSpace(cp$wci_Vm_9_MAddrSpace),
	    .wci_Vm_9_MByteEn(cp$wci_Vm_9_MByteEn),
	    .wci_Vm_9_MAddr(cp$wci_Vm_9_MAddr),
	    .wci_Vm_9_MData(cp$wci_Vm_9_MData),
	    .wci_Vm_9_MFlag(cp$wci_Vm_9_MFlag),
	    .wci_Vm_10_MCmd(cp$wci_Vm_10_MCmd),
	    .wci_Vm_10_MAddrSpace(cp$wci_Vm_10_MAddrSpace),
	    .wci_Vm_10_MByteEn(cp$wci_Vm_10_MByteEn),
	    .wci_Vm_10_MAddr(cp$wci_Vm_10_MAddr),
	    .wci_Vm_10_MData(cp$wci_Vm_10_MData),
	    .wci_Vm_10_MFlag(cp$wci_Vm_10_MFlag),
	    .wci_Vm_11_MCmd(),
	    .wci_Vm_11_MAddrSpace(),
	    .wci_Vm_11_MByteEn(),
	    .wci_Vm_11_MAddr(),
	    .wci_Vm_11_MData(),
	    .wci_Vm_11_MFlag(),
	    .wci_Vm_12_MCmd(),
	    .wci_Vm_12_MAddrSpace(),
	    .wci_Vm_12_MByteEn(),
	    .wci_Vm_12_MAddr(),
	    .wci_Vm_12_MData(),
	    .wci_Vm_12_MFlag(),
	    .wci_Vm_13_MCmd(cp$wci_Vm_13_MCmd),
	    .wci_Vm_13_MAddrSpace(cp$wci_Vm_13_MAddrSpace),
	    .wci_Vm_13_MByteEn(cp$wci_Vm_13_MByteEn),
	    .wci_Vm_13_MAddr(cp$wci_Vm_13_MAddr),
	    .wci_Vm_13_MData(cp$wci_Vm_13_MData),
	    .wci_Vm_13_MFlag(cp$wci_Vm_13_MFlag),
	    .wci_Vm_14_MCmd(cp$wci_Vm_14_MCmd),
	    .wci_Vm_14_MAddrSpace(cp$wci_Vm_14_MAddrSpace),
	    .wci_Vm_14_MByteEn(cp$wci_Vm_14_MByteEn),
	    .wci_Vm_14_MAddr(cp$wci_Vm_14_MAddr),
	    .wci_Vm_14_MData(cp$wci_Vm_14_MData),
	    .wci_Vm_14_MFlag(cp$wci_Vm_14_MFlag),
	    .cpNow(),
	    .RDY_cpNow(),
	    .gps_ppsSyncOut(),
	    .led(),
	    .RST_N_wci_Vm_0(),
	    .RST_N_wci_Vm_1(),
	    .RST_N_wci_Vm_2(cp$RST_N_wci_Vm_2),
	    .RST_N_wci_Vm_3(cp$RST_N_wci_Vm_3),
	    .RST_N_wci_Vm_4(cp$RST_N_wci_Vm_4),
	    .RST_N_wci_Vm_5(),
	    .RST_N_wci_Vm_6(),
	    .RST_N_wci_Vm_7(cp$RST_N_wci_Vm_7),
	    .RST_N_wci_Vm_8(),
	    .RST_N_wci_Vm_9(cp$RST_N_wci_Vm_9),
	    .RST_N_wci_Vm_10(cp$RST_N_wci_Vm_10),
	    .RST_N_wci_Vm_11(),
	    .RST_N_wci_Vm_12(),
	    .RST_N_wci_Vm_13(cp$RST_N_wci_Vm_13),
	    .RST_N_wci_Vm_14(cp$RST_N_wci_Vm_14));
  // submodule edcp
  mkEDCPAdapter edcp(.CLK(clkN210$clkdv_buf),
		     .RST_N(clkN210$clkdv_rstn),
		     .client_response_put(edcp$client_response_put),
		     .macAddr_u(edcp$macAddr_u),
		     .server_request_put(edcp$server_request_put),
		     .EN_server_request_put(edcp$EN_server_request_put),
		     .EN_server_response_get(edcp$EN_server_response_get),
		     .EN_client_request_get(edcp$EN_client_request_get),
		     .EN_client_response_put(edcp$EN_client_response_put),
		     .EN_macAddr(edcp$EN_macAddr),
		     .RDY_server_request_put(edcp$RDY_server_request_put),
		     .server_response_get(edcp$server_response_get),
		     .RDY_server_response_get(edcp$RDY_server_response_get),
		     .client_request_get(edcp$client_request_get),
		     .RDY_client_request_get(edcp$RDY_client_request_get),
		     .RDY_client_response_put(edcp$RDY_client_response_put),
		     .RDY_macAddr(),
		     .ecpRx(edcp$ecpRx),
		     .RDY_ecpRx(),
		     .ecpTx(edcp$ecpTx),
		     .RDY_ecpTx());
  // submodule eddp0
  mkEDDPAdapter eddp0(.CLK(clkN210$clkdv_buf),
		      .RST_N(clkN210$clkdv_rstn),
		      .client_response_put(eddp0$client_response_put),
		      .dstAddr_d(eddp0$dstAddr_d),
		      .dstType_t(eddp0$dstType_t),
		      .macAddr_u(eddp0$macAddr_u),
		      .server_request_put(eddp0$server_request_put),
		      .EN_server_request_put(eddp0$EN_server_request_put),
		      .EN_server_response_get(eddp0$EN_server_response_get),
		      .EN_client_request_get(eddp0$EN_client_request_get),
		      .EN_client_response_put(eddp0$EN_client_response_put),
		      .EN_macAddr(eddp0$EN_macAddr),
		      .EN_dstAddr(eddp0$EN_dstAddr),
		      .EN_dstType(eddp0$EN_dstType),
		      .RDY_server_request_put(eddp0$RDY_server_request_put),
		      .server_response_get(eddp0$server_response_get),
		      .RDY_server_response_get(eddp0$RDY_server_response_get),
		      .client_request_get(eddp0$client_request_get),
		      .RDY_client_request_get(eddp0$RDY_client_request_get),
		      .RDY_client_response_put(eddp0$RDY_client_response_put),
		      .RDY_macAddr(),
		      .RDY_dstAddr(),
		      .RDY_dstType(),
		      .edpRx(eddp0$edpRx),
		      .RDY_edpRx(),
		      .edpTx(eddp0$edpTx),
		      .RDY_edpTx(),
		      .edpTxEOP(eddp0$edpTxEOP),
		      .RDY_edpTxEOP());
  // submodule eddp1
  mkEDDPAdapter eddp1(.CLK(clkN210$clkdv_buf),
		      .RST_N(clkN210$clkdv_rstn),
		      .client_response_put(eddp1$client_response_put),
		      .dstAddr_d(eddp1$dstAddr_d),
		      .dstType_t(eddp1$dstType_t),
		      .macAddr_u(eddp1$macAddr_u),
		      .server_request_put(eddp1$server_request_put),
		      .EN_server_request_put(eddp1$EN_server_request_put),
		      .EN_server_response_get(eddp1$EN_server_response_get),
		      .EN_client_request_get(eddp1$EN_client_request_get),
		      .EN_client_response_put(eddp1$EN_client_response_put),
		      .EN_macAddr(eddp1$EN_macAddr),
		      .EN_dstAddr(eddp1$EN_dstAddr),
		      .EN_dstType(eddp1$EN_dstType),
		      .RDY_server_request_put(eddp1$RDY_server_request_put),
		      .server_response_get(eddp1$server_response_get),
		      .RDY_server_response_get(eddp1$RDY_server_response_get),
		      .client_request_get(eddp1$client_request_get),
		      .RDY_client_request_get(eddp1$RDY_client_request_get),
		      .RDY_client_response_put(eddp1$RDY_client_response_put),
		      .RDY_macAddr(),
		      .RDY_dstAddr(),
		      .RDY_dstType(),
		      .edpRx(eddp1$edpRx),
		      .RDY_edpRx(),
		      .edpTx(eddp1$edpTx),
		      .RDY_edpTx(),
		      .edpTxEOP(),
		      .RDY_edpTxEOP());
  // submodule edp0
  mkOCEDP4B #(.hasPush(1'd0),
	      .hasPull(1'd1),
	      .hasDebugLogic(1'd1)) edp0(.pciDevice(16'hAAAA),
					 .CLK(clkN210$clkdv_buf),
					 .RST_N(cp$RST_N_wci_Vm_13),
					 .server_request_put(edp0$server_request_put),
					 .wciS0_MAddr(edp0$wciS0_MAddr),
					 .wciS0_MAddrSpace(edp0$wciS0_MAddrSpace),
					 .wciS0_MByteEn(edp0$wciS0_MByteEn),
					 .wciS0_MCmd(edp0$wciS0_MCmd),
					 .wciS0_MData(edp0$wciS0_MData),
					 .wciS0_MFlag(edp0$wciS0_MFlag),
					 .wmiS0_MAddr(edp0$wmiS0_MAddr),
					 .wmiS0_MAddrSpace(edp0$wmiS0_MAddrSpace),
					 .wmiS0_MBurstLength(edp0$wmiS0_MBurstLength),
					 .wmiS0_MCmd(edp0$wmiS0_MCmd),
					 .wmiS0_MData(edp0$wmiS0_MData),
					 .wmiS0_MDataByteEn(edp0$wmiS0_MDataByteEn),
					 .wmiS0_MReqInfo(edp0$wmiS0_MReqInfo),
					 .wmiS0_arg_mFlag(edp0$wmiS0_arg_mFlag),
					 .wtiS0_req(edp0$wtiS0_req),
					 .wmiS0_MReqLast(edp0$wmiS0_MReqLast),
					 .wmiS0_MDataValid(edp0$wmiS0_MDataValid),
					 .wmiS0_MDataLast(edp0$wmiS0_MDataLast),
					 .wmiS0_MReset_n(edp0$wmiS0_MReset_n),
					 .EN_server_request_put(edp0$EN_server_request_put),
					 .EN_server_response_get(edp0$EN_server_response_get),
					 .wciS0_SResp(edp0$wciS0_SResp),
					 .wciS0_SData(edp0$wciS0_SData),
					 .wciS0_SThreadBusy(edp0$wciS0_SThreadBusy),
					 .wciS0_SFlag(edp0$wciS0_SFlag),
					 .wtiS0_SThreadBusy(),
					 .wtiS0_SReset_n(),
					 .wmiS0_SResp(edp0$wmiS0_SResp),
					 .wmiS0_SData(edp0$wmiS0_SData),
					 .wmiS0_SThreadBusy(edp0$wmiS0_SThreadBusy),
					 .wmiS0_SDataThreadBusy(edp0$wmiS0_SDataThreadBusy),
					 .wmiS0_SRespLast(edp0$wmiS0_SRespLast),
					 .wmiS0_SFlag(edp0$wmiS0_SFlag),
					 .wmiS0_SReset_n(edp0$wmiS0_SReset_n),
					 .RDY_server_request_put(edp0$RDY_server_request_put),
					 .server_response_get(edp0$server_response_get),
					 .RDY_server_response_get(edp0$RDY_server_response_get));
  // submodule edp1
  mkOCEDP4B #(.hasPush(1'd1),
	      .hasPull(1'd0),
	      .hasDebugLogic(1'd1)) edp1(.pciDevice(16'hAAAA),
					 .CLK(clkN210$clkdv_buf),
					 .RST_N(cp$RST_N_wci_Vm_14),
					 .server_request_put(edp1$server_request_put),
					 .wciS0_MAddr(edp1$wciS0_MAddr),
					 .wciS0_MAddrSpace(edp1$wciS0_MAddrSpace),
					 .wciS0_MByteEn(edp1$wciS0_MByteEn),
					 .wciS0_MCmd(edp1$wciS0_MCmd),
					 .wciS0_MData(edp1$wciS0_MData),
					 .wciS0_MFlag(edp1$wciS0_MFlag),
					 .wmiS0_MAddr(edp1$wmiS0_MAddr),
					 .wmiS0_MAddrSpace(edp1$wmiS0_MAddrSpace),
					 .wmiS0_MBurstLength(edp1$wmiS0_MBurstLength),
					 .wmiS0_MCmd(edp1$wmiS0_MCmd),
					 .wmiS0_MData(edp1$wmiS0_MData),
					 .wmiS0_MDataByteEn(edp1$wmiS0_MDataByteEn),
					 .wmiS0_MReqInfo(edp1$wmiS0_MReqInfo),
					 .wmiS0_arg_mFlag(edp1$wmiS0_arg_mFlag),
					 .wtiS0_req(edp1$wtiS0_req),
					 .wmiS0_MReqLast(edp1$wmiS0_MReqLast),
					 .wmiS0_MDataValid(edp1$wmiS0_MDataValid),
					 .wmiS0_MDataLast(edp1$wmiS0_MDataLast),
					 .wmiS0_MReset_n(edp1$wmiS0_MReset_n),
					 .EN_server_request_put(edp1$EN_server_request_put),
					 .EN_server_response_get(edp1$EN_server_response_get),
					 .wciS0_SResp(edp1$wciS0_SResp),
					 .wciS0_SData(edp1$wciS0_SData),
					 .wciS0_SThreadBusy(edp1$wciS0_SThreadBusy),
					 .wciS0_SFlag(edp1$wciS0_SFlag),
					 .wtiS0_SThreadBusy(),
					 .wtiS0_SReset_n(),
					 .wmiS0_SResp(edp1$wmiS0_SResp),
					 .wmiS0_SData(edp1$wmiS0_SData),
					 .wmiS0_SThreadBusy(edp1$wmiS0_SThreadBusy),
					 .wmiS0_SDataThreadBusy(edp1$wmiS0_SDataThreadBusy),
					 .wmiS0_SRespLast(edp1$wmiS0_SRespLast),
					 .wmiS0_SFlag(edp1$wmiS0_SFlag),
					 .wmiS0_SReset_n(edp1$wmiS0_SReset_n),
					 .RDY_server_request_put(edp1$RDY_server_request_put),
					 .server_response_get(edp1$server_response_get),
					 .RDY_server_response_get(edp1$RDY_server_response_get));
  // submodule emux
  mkQABSMF3 emux(.et0(16'hF040),
		 .did(16'h0003),
		 .CLK(clkN210$clkdv_buf),
		 .RST_N(clkN210$clkdv_rstn),
		 .client0_response_put(emux$client0_response_put),
		 .client1_response_put(emux$client1_response_put),
		 .client2_response_put(emux$client2_response_put),
		 .server_request_put(emux$server_request_put),
		 .EN_server_request_put(emux$EN_server_request_put),
		 .EN_server_response_get(emux$EN_server_response_get),
		 .EN_client0_request_get(emux$EN_client0_request_get),
		 .EN_client0_response_put(emux$EN_client0_response_put),
		 .EN_client1_request_get(emux$EN_client1_request_get),
		 .EN_client1_response_put(emux$EN_client1_response_put),
		 .EN_client2_request_get(emux$EN_client2_request_get),
		 .EN_client2_response_put(emux$EN_client2_response_put),
		 .RDY_server_request_put(emux$RDY_server_request_put),
		 .server_response_get(emux$server_response_get),
		 .RDY_server_response_get(emux$RDY_server_response_get),
		 .client0_request_get(emux$client0_request_get),
		 .RDY_client0_request_get(emux$RDY_client0_request_get),
		 .RDY_client0_response_put(emux$RDY_client0_response_put),
		 .client1_request_get(emux$client1_request_get),
		 .RDY_client1_request_get(emux$RDY_client1_request_get),
		 .RDY_client1_response_put(emux$RDY_client1_response_put),
		 .client2_request_get(emux$client2_request_get),
		 .RDY_client2_request_get(emux$RDY_client2_request_get),
		 .RDY_client2_response_put(emux$RDY_client2_response_put));
  // submodule gbe0
  mkGbeQABS #(.hasDebugLogic(1'd1)) gbe0(.CLK_gmii_rx_clk(gmii_rx_clk),
					 .CLK_gmiixo_clk(gmiixo_clk$O),
					 .RST_N_gmiixo_rst(gmiixo_rst$OUT_RST),
					 .CLK(clkN210$clkdv_buf),
					 .RST_N(clkN210$clkdv_rstn),
					 .client_response_put(gbe0$client_response_put),
					 .gmii_col_i(gbe0$gmii_col_i),
					 .gmii_crs_i(gbe0$gmii_crs_i),
					 .gmii_intr_i(gbe0$gmii_intr_i),
					 .gmii_rx_rx_dv_i(gbe0$gmii_rx_rx_dv_i),
					 .gmii_rx_rx_er_i(gbe0$gmii_rx_rx_er_i),
					 .gmii_rx_rxd_i(gbe0$gmii_rx_rxd_i),
					 .EN_client_request_get(gbe0$EN_client_request_get),
					 .EN_client_response_put(gbe0$EN_client_response_put),
					 .client_request_get(gbe0$client_request_get),
					 .RDY_client_request_get(gbe0$RDY_client_request_get),
					 .RDY_client_response_put(gbe0$RDY_client_response_put),
					 .gmRx(gbe0$gmRx),
					 .RDY_gmRx(),
					 .gmTx(gbe0$gmTx),
					 .RDY_gmTx(),
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
  // submodule gbewrk
  mkGbeWrk #(.hasDebugLogic(1'd1)) gbewrk(.wciS0_Clk(clkN210$clkdv_buf),
					  .wciS0_MReset_n(cp$RST_N_wci_Vm_9),
					  .dgdpEgressCnt_arg(gbewrk$dgdpEgressCnt_arg),
					  .wciS0_MAddr(gbewrk$wciS0_MAddr),
					  .wciS0_MAddrSpace(gbewrk$wciS0_MAddrSpace),
					  .wciS0_MByteEn(gbewrk$wciS0_MByteEn),
					  .wciS0_MCmd(gbewrk$wciS0_MCmd),
					  .wciS0_MData(gbewrk$wciS0_MData),
					  .wciS0_MFlag(gbewrk$wciS0_MFlag),
					  .EN_dgdpEgressCnt(gbewrk$EN_dgdpEgressCnt),
					  .wciS0_SResp(gbewrk$wciS0_SResp),
					  .wciS0_SData(gbewrk$wciS0_SData),
					  .wciS0_SThreadBusy(gbewrk$wciS0_SThreadBusy),
					  .wciS0_SFlag(gbewrk$wciS0_SFlag),
					  .l2Dst(gbewrk$l2Dst),
					  .l2Typ(gbewrk$l2Typ),
					  .RDY_dgdpEgressCnt());
  // submodule gmiixo_clk
  BUFG gmiixo_clk(.I(gmii_sysclk), .O(gmiixo_clk$O));
  // submodule gmiixo_rst
  SyncResetA #(.RSTDELAY(32'd1)) gmiixo_rst(.CLK(gmiixo_clk$O),
					    .IN_RST(clkN210$clk0_rstn),
					    .OUT_RST(gmiixo_rst$OUT_RST));
  // submodule iqadc
  mkIQADCWorker #(.hasDebugLogic(1'd1)) iqadc(.CLK_sys0_clk(clkN210$clkdv_buf),
					      .RST_N_sys0_rst(clkN210$clkdv_rstn),
					      .CLK_adc_clock(clkN210$clkdv_buf),
					      .RST_N_adc_reset(clkN210$clkdv_rstn),
					      .CLK_adcCaptureClk(adc_clkout),
					      .wciS0_Clk(clkN210$clkdv_buf),
					      .wciS0_MReset_n(cp$RST_N_wci_Vm_10),
					      .adc_da_i(iqadc$adc_da_i),
					      .adc_db_i(iqadc$adc_db_i),
					      .adc_smiso_i(iqadc$adc_smiso_i),
					      .wciS0_MAddr(iqadc$wciS0_MAddr),
					      .wciS0_MAddrSpace(iqadc$wciS0_MAddrSpace),
					      .wciS0_MByteEn(iqadc$wciS0_MByteEn),
					      .wciS0_MCmd(iqadc$wciS0_MCmd),
					      .wciS0_MData(iqadc$wciS0_MData),
					      .wciS0_MFlag(iqadc$wciS0_MFlag),
					      .wtiS0_req(iqadc$wtiS0_req),
					      .wsiM0_SThreadBusy(iqadc$wsiM0_SThreadBusy),
					      .wsiM0_SReset_n(iqadc$wsiM0_SReset_n),
					      .wciS0_SResp(iqadc$wciS0_SResp),
					      .wciS0_SData(iqadc$wciS0_SData),
					      .wciS0_SThreadBusy(iqadc$wciS0_SThreadBusy),
					      .wciS0_SFlag(iqadc$wciS0_SFlag),
					      .wtiS0_SThreadBusy(),
					      .wtiS0_SReset_n(),
					      .wsiM0_MCmd(),
					      .wsiM0_MReqLast(),
					      .wsiM0_MBurstPrecise(),
					      .wsiM0_MBurstLength(),
					      .wsiM0_MData(),
					      .wsiM0_MByteEn(),
					      .wsiM0_MReqInfo(),
					      .wsiM0_MReset_n(),
					      .adc_oe(iqadc$adc_oe),
					      .adc_sclkgate(iqadc$adc_sclkgate),
					      .adc_resetp(iqadc$adc_resetp),
					      .adc_sen(iqadc$adc_sen),
					      .adc_smosi(iqadc$adc_smosi),
					      .CLK_adc_sclk(iqadc$CLK_adc_sclk),
					      .CLK_GATE_adc_sclk(),
					      .CLK_adc_sclkn(iqadc$CLK_adc_sclkn),
					      .CLK_GATE_adc_sclkn(),
					      .CLK_adcSdrClk(),
					      .CLK_GATE_adcSdrClk(),
					      .RST_N_adc_rst(iqadc$RST_N_adc_rst),
					      .RST_N_adcSdrRst());
  // submodule ledLogic
  mkLedN210 ledLogic(.CLK(clkN210$clkdv_buf),
		     .RST_N(clkN210$clkdv_rstn),
		     .ledDrive_i(ledLogic$ledDrive_i),
		     .EN_ledDrive(ledLogic$EN_ledDrive),
		     .RDY_ledDrive(),
		     .led(ledLogic$led));
  // submodule pwrk
  mkPWrk_n210 pwrk(.RST_N_sys0_rst(clkN210$clkdv_rstn),
		   .wciS0_Clk(clkN210$clkdv_buf),
		   .wciS0_MReset_n(cp$RST_N_wci_Vm_7),
		   .spipad_miso_i(pwrk$spipad_miso_i),
		   .wciS0_MAddr(pwrk$wciS0_MAddr),
		   .wciS0_MAddrSpace(pwrk$wciS0_MAddrSpace),
		   .wciS0_MByteEn(pwrk$wciS0_MByteEn),
		   .wciS0_MCmd(pwrk$wciS0_MCmd),
		   .wciS0_MData(pwrk$wciS0_MData),
		   .wciS0_MFlag(pwrk$wciS0_MFlag),
		   .macAddr(pwrk$macAddr),
		   .RDY_macAddr(),
		   .wciS0_SResp(pwrk$wciS0_SResp),
		   .wciS0_SData(pwrk$wciS0_SData),
		   .wciS0_SThreadBusy(pwrk$wciS0_SThreadBusy),
		   .wciS0_SFlag(pwrk$wciS0_SFlag),
		   .spipad_mosi(pwrk$spipad_mosi),
		   .spipad_clk(pwrk$spipad_clk),
		   .spipad_csn(pwrk$spipad_csn),
		   .i2cpad_sda(i2c_sda),
		   .i2cpad_scl(i2c_scl));
  // submodule sma0
  mkSMAdapter4B #(.smaCtrlInit(32'h00000001),
		  .hasDebugLogic(1'd1)) sma0(.wciS0_Clk(clkN210$clkdv_buf),
					     .wciS0_MReset_n(cp$RST_N_wci_Vm_2),
					     .wciS0_MAddr(sma0$wciS0_MAddr),
					     .wciS0_MAddrSpace(sma0$wciS0_MAddrSpace),
					     .wciS0_MByteEn(sma0$wciS0_MByteEn),
					     .wciS0_MCmd(sma0$wciS0_MCmd),
					     .wciS0_MData(sma0$wciS0_MData),
					     .wciS0_MFlag(sma0$wciS0_MFlag),
					     .wmiM0_SData(sma0$wmiM0_SData),
					     .wmiM0_SFlag(sma0$wmiM0_SFlag),
					     .wmiM0_SResp(sma0$wmiM0_SResp),
					     .wsiS0_MBurstLength(sma0$wsiS0_MBurstLength),
					     .wsiS0_MByteEn(sma0$wsiS0_MByteEn),
					     .wsiS0_MCmd(sma0$wsiS0_MCmd),
					     .wsiS0_MData(sma0$wsiS0_MData),
					     .wsiS0_MReqInfo(sma0$wsiS0_MReqInfo),
					     .wmiM0_SThreadBusy(sma0$wmiM0_SThreadBusy),
					     .wmiM0_SDataThreadBusy(sma0$wmiM0_SDataThreadBusy),
					     .wmiM0_SRespLast(sma0$wmiM0_SRespLast),
					     .wmiM0_SReset_n(sma0$wmiM0_SReset_n),
					     .wsiM0_SThreadBusy(sma0$wsiM0_SThreadBusy),
					     .wsiM0_SReset_n(sma0$wsiM0_SReset_n),
					     .wsiS0_MReqLast(sma0$wsiS0_MReqLast),
					     .wsiS0_MBurstPrecise(sma0$wsiS0_MBurstPrecise),
					     .wsiS0_MReset_n(sma0$wsiS0_MReset_n),
					     .wciS0_SResp(sma0$wciS0_SResp),
					     .wciS0_SData(sma0$wciS0_SData),
					     .wciS0_SThreadBusy(sma0$wciS0_SThreadBusy),
					     .wciS0_SFlag(sma0$wciS0_SFlag),
					     .wmiM0_MCmd(sma0$wmiM0_MCmd),
					     .wmiM0_MReqLast(sma0$wmiM0_MReqLast),
					     .wmiM0_MReqInfo(sma0$wmiM0_MReqInfo),
					     .wmiM0_MAddrSpace(sma0$wmiM0_MAddrSpace),
					     .wmiM0_MAddr(sma0$wmiM0_MAddr),
					     .wmiM0_MBurstLength(sma0$wmiM0_MBurstLength),
					     .wmiM0_MDataValid(sma0$wmiM0_MDataValid),
					     .wmiM0_MDataLast(sma0$wmiM0_MDataLast),
					     .wmiM0_MData(sma0$wmiM0_MData),
					     .wmiM0_MDataByteEn(sma0$wmiM0_MDataByteEn),
					     .wmiM0_MFlag(sma0$wmiM0_MFlag),
					     .wmiM0_MReset_n(sma0$wmiM0_MReset_n),
					     .wsiM0_MCmd(sma0$wsiM0_MCmd),
					     .wsiM0_MReqLast(sma0$wsiM0_MReqLast),
					     .wsiM0_MBurstPrecise(sma0$wsiM0_MBurstPrecise),
					     .wsiM0_MBurstLength(sma0$wsiM0_MBurstLength),
					     .wsiM0_MData(sma0$wsiM0_MData),
					     .wsiM0_MByteEn(sma0$wsiM0_MByteEn),
					     .wsiM0_MReqInfo(sma0$wsiM0_MReqInfo),
					     .wsiM0_MReset_n(sma0$wsiM0_MReset_n),
					     .wsiS0_SThreadBusy(),
					     .wsiS0_SReset_n());
  // submodule sma1
  mkSMAdapter4B #(.smaCtrlInit(32'h00000002),
		  .hasDebugLogic(1'd1)) sma1(.wciS0_Clk(clkN210$clkdv_buf),
					     .wciS0_MReset_n(cp$RST_N_wci_Vm_4),
					     .wciS0_MAddr(sma1$wciS0_MAddr),
					     .wciS0_MAddrSpace(sma1$wciS0_MAddrSpace),
					     .wciS0_MByteEn(sma1$wciS0_MByteEn),
					     .wciS0_MCmd(sma1$wciS0_MCmd),
					     .wciS0_MData(sma1$wciS0_MData),
					     .wciS0_MFlag(sma1$wciS0_MFlag),
					     .wmiM0_SData(sma1$wmiM0_SData),
					     .wmiM0_SFlag(sma1$wmiM0_SFlag),
					     .wmiM0_SResp(sma1$wmiM0_SResp),
					     .wsiS0_MBurstLength(sma1$wsiS0_MBurstLength),
					     .wsiS0_MByteEn(sma1$wsiS0_MByteEn),
					     .wsiS0_MCmd(sma1$wsiS0_MCmd),
					     .wsiS0_MData(sma1$wsiS0_MData),
					     .wsiS0_MReqInfo(sma1$wsiS0_MReqInfo),
					     .wmiM0_SThreadBusy(sma1$wmiM0_SThreadBusy),
					     .wmiM0_SDataThreadBusy(sma1$wmiM0_SDataThreadBusy),
					     .wmiM0_SRespLast(sma1$wmiM0_SRespLast),
					     .wmiM0_SReset_n(sma1$wmiM0_SReset_n),
					     .wsiM0_SThreadBusy(sma1$wsiM0_SThreadBusy),
					     .wsiM0_SReset_n(sma1$wsiM0_SReset_n),
					     .wsiS0_MReqLast(sma1$wsiS0_MReqLast),
					     .wsiS0_MBurstPrecise(sma1$wsiS0_MBurstPrecise),
					     .wsiS0_MReset_n(sma1$wsiS0_MReset_n),
					     .wciS0_SResp(sma1$wciS0_SResp),
					     .wciS0_SData(sma1$wciS0_SData),
					     .wciS0_SThreadBusy(sma1$wciS0_SThreadBusy),
					     .wciS0_SFlag(sma1$wciS0_SFlag),
					     .wmiM0_MCmd(sma1$wmiM0_MCmd),
					     .wmiM0_MReqLast(sma1$wmiM0_MReqLast),
					     .wmiM0_MReqInfo(sma1$wmiM0_MReqInfo),
					     .wmiM0_MAddrSpace(sma1$wmiM0_MAddrSpace),
					     .wmiM0_MAddr(sma1$wmiM0_MAddr),
					     .wmiM0_MBurstLength(sma1$wmiM0_MBurstLength),
					     .wmiM0_MDataValid(sma1$wmiM0_MDataValid),
					     .wmiM0_MDataLast(sma1$wmiM0_MDataLast),
					     .wmiM0_MData(sma1$wmiM0_MData),
					     .wmiM0_MDataByteEn(sma1$wmiM0_MDataByteEn),
					     .wmiM0_MFlag(sma1$wmiM0_MFlag),
					     .wmiM0_MReset_n(sma1$wmiM0_MReset_n),
					     .wsiM0_MCmd(),
					     .wsiM0_MReqLast(),
					     .wsiM0_MBurstPrecise(),
					     .wsiM0_MBurstLength(),
					     .wsiM0_MData(),
					     .wsiM0_MByteEn(),
					     .wsiM0_MReqInfo(),
					     .wsiM0_MReset_n(),
					     .wsiS0_SThreadBusy(sma1$wsiS0_SThreadBusy),
					     .wsiS0_SReset_n(sma1$wsiS0_SReset_n));
  // inlined wires
  assign dbgReg_1$wget =
	     { gbe0$gmRx,
	       edcp$ecpRx,
	       eddp0$edpRx,
	       eddp1$edpRx,
	       gbe0$gmTx,
	       edcp$ecpTx,
	       eddp0$edpTx,
	       eddp1$edpTx,
	       eddp0$edpTxEOP,
	       6'd0,
	       tog50,
	       16'h0 } ;
  assign dbgReg_1$whas = 1'd1 ;
  assign tog50_1$wget = !tog50 ;
  assign tog50_1$whas = 1'd1 ;
  // register dbgReg
  assign dbgReg$D_IN = dbgReg_1$wget ;
  assign dbgReg$EN = 1'd1 ;
  // register tog50
  assign tog50$D_IN = !tog50 ;
  assign tog50$EN = 1'd1 ;
  // submodule bias
  assign bias$wciS0_MAddr = cp$wci_Vm_3_MAddr ;
  assign bias$wciS0_MAddrSpace = cp$wci_Vm_3_MAddrSpace ;
  assign bias$wciS0_MByteEn = cp$wci_Vm_3_MByteEn ;
  assign bias$wciS0_MCmd = cp$wci_Vm_3_MCmd ;
  assign bias$wciS0_MData = cp$wci_Vm_3_MData ;
  assign bias$wciS0_MFlag = cp$wci_Vm_3_MFlag ;
  assign bias$wsiS0_MBurstLength = sma0$wsiM0_MBurstLength ;
  assign bias$wsiS0_MByteEn = sma0$wsiM0_MByteEn ;
  assign bias$wsiS0_MCmd = sma0$wsiM0_MCmd ;
  assign bias$wsiS0_MData = sma0$wsiM0_MData ;
  assign bias$wsiS0_MReqInfo = sma0$wsiM0_MReqInfo ;
  assign bias$wsiS0_MReqLast = sma0$wsiM0_MReqLast ;
  assign bias$wsiS0_MBurstPrecise = sma0$wsiM0_MBurstPrecise ;
  assign bias$wsiS0_MReset_n = sma0$wsiM0_MReset_n ;
  assign bias$wsiM0_SThreadBusy = sma1$wsiS0_SThreadBusy ;
  assign bias$wsiM0_SReset_n = sma1$wsiS0_SReset_n ;
  // submodule cp
  assign cp$gps_ppsSyncIn_x = 1'b0 ;
  assign cp$server_request_put = edcp$client_request_get ;
  assign cp$switch_x = 3'h0 ;
  assign cp$uuid_arg = 512'h0 ;
  assign cp$wci_Vm_0_SData = 32'h0 ;
  assign cp$wci_Vm_0_SFlag = 2'h0 ;
  assign cp$wci_Vm_0_SResp = 2'h0 ;
  assign cp$wci_Vm_10_SData = iqadc$wciS0_SData ;
  assign cp$wci_Vm_10_SFlag = iqadc$wciS0_SFlag ;
  assign cp$wci_Vm_10_SResp = iqadc$wciS0_SResp ;
  assign cp$wci_Vm_11_SData = 32'h0 ;
  assign cp$wci_Vm_11_SFlag = 2'h0 ;
  assign cp$wci_Vm_11_SResp = 2'h0 ;
  assign cp$wci_Vm_12_SData = 32'h0 ;
  assign cp$wci_Vm_12_SFlag = 2'h0 ;
  assign cp$wci_Vm_12_SResp = 2'h0 ;
  assign cp$wci_Vm_13_SData = edp0$wciS0_SData ;
  assign cp$wci_Vm_13_SFlag = edp0$wciS0_SFlag ;
  assign cp$wci_Vm_13_SResp = edp0$wciS0_SResp ;
  assign cp$wci_Vm_14_SData = edp1$wciS0_SData ;
  assign cp$wci_Vm_14_SFlag = edp1$wciS0_SFlag ;
  assign cp$wci_Vm_14_SResp = edp1$wciS0_SResp ;
  assign cp$wci_Vm_1_SData = 32'h0 ;
  assign cp$wci_Vm_1_SFlag = 2'h0 ;
  assign cp$wci_Vm_1_SResp = 2'h0 ;
  assign cp$wci_Vm_2_SData = sma0$wciS0_SData ;
  assign cp$wci_Vm_2_SFlag = sma0$wciS0_SFlag ;
  assign cp$wci_Vm_2_SResp = sma0$wciS0_SResp ;
  assign cp$wci_Vm_3_SData = bias$wciS0_SData ;
  assign cp$wci_Vm_3_SFlag = bias$wciS0_SFlag ;
  assign cp$wci_Vm_3_SResp = bias$wciS0_SResp ;
  assign cp$wci_Vm_4_SData = sma1$wciS0_SData ;
  assign cp$wci_Vm_4_SFlag = sma1$wciS0_SFlag ;
  assign cp$wci_Vm_4_SResp = sma1$wciS0_SResp ;
  assign cp$wci_Vm_5_SData = 32'h0 ;
  assign cp$wci_Vm_5_SFlag = 2'h0 ;
  assign cp$wci_Vm_5_SResp = 2'h0 ;
  assign cp$wci_Vm_6_SData = 32'h0 ;
  assign cp$wci_Vm_6_SFlag = 2'h0 ;
  assign cp$wci_Vm_6_SResp = 2'h0 ;
  assign cp$wci_Vm_7_SData = pwrk$wciS0_SData ;
  assign cp$wci_Vm_7_SFlag = pwrk$wciS0_SFlag ;
  assign cp$wci_Vm_7_SResp = pwrk$wciS0_SResp ;
  assign cp$wci_Vm_8_SData = 32'h0 ;
  assign cp$wci_Vm_8_SFlag = 2'h0 ;
  assign cp$wci_Vm_8_SResp = 2'h0 ;
  assign cp$wci_Vm_9_SData = gbewrk$wciS0_SData ;
  assign cp$wci_Vm_9_SFlag = gbewrk$wciS0_SFlag ;
  assign cp$wci_Vm_9_SResp = gbewrk$wciS0_SResp ;
  assign cp$EN_server_request_put =
	     cp$RDY_server_request_put && edcp$RDY_client_request_get ;
  assign cp$EN_server_response_get =
	     cp$RDY_server_response_get && edcp$RDY_client_response_put ;
  assign cp$wci_Vm_0_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_1_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_2_SThreadBusy = sma0$wciS0_SThreadBusy ;
  assign cp$wci_Vm_3_SThreadBusy = bias$wciS0_SThreadBusy ;
  assign cp$wci_Vm_4_SThreadBusy = sma1$wciS0_SThreadBusy ;
  assign cp$wci_Vm_5_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_6_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_7_SThreadBusy = pwrk$wciS0_SThreadBusy ;
  assign cp$wci_Vm_8_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_9_SThreadBusy = gbewrk$wciS0_SThreadBusy ;
  assign cp$wci_Vm_10_SThreadBusy = iqadc$wciS0_SThreadBusy ;
  assign cp$wci_Vm_11_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_12_SThreadBusy = 1'b0 ;
  assign cp$wci_Vm_13_SThreadBusy = edp0$wciS0_SThreadBusy ;
  assign cp$wci_Vm_14_SThreadBusy = edp1$wciS0_SThreadBusy ;
  // submodule edcp
  assign edcp$client_response_put = cp$server_response_get ;
  assign edcp$macAddr_u = pwrk$macAddr ;
  assign edcp$server_request_put =
	     { CASE_emuxclient0_request_get_BITS_39_TO_38_3__ETC__q1,
	       emux$client0_request_get[37:30],
	       CASE_emuxclient0_request_get_BITS_29_TO_28_3__ETC__q2,
	       emux$client0_request_get[27:20],
	       CASE_emuxclient0_request_get_BITS_19_TO_18_3__ETC__q3,
	       emux$client0_request_get[17:10],
	       CASE_emuxclient0_request_get_BITS_9_TO_8_3_0__ETC__q4,
	       emux$client0_request_get[7:0] } ;
  assign edcp$EN_server_request_put =
	     emux$RDY_client0_request_get && edcp$RDY_server_request_put ;
  assign edcp$EN_server_response_get =
	     emux$RDY_client0_response_put && edcp$RDY_server_response_get ;
  assign edcp$EN_client_request_get =
	     cp$RDY_server_request_put && edcp$RDY_client_request_get ;
  assign edcp$EN_client_response_put =
	     cp$RDY_server_response_get && edcp$RDY_client_response_put ;
  assign edcp$EN_macAddr = 1'd1 ;
  // submodule eddp0
  assign eddp0$client_response_put =
	     { CASE_edp0server_response_get_BITS_39_TO_38_3__ETC__q5,
	       edp0$server_response_get[37:30],
	       CASE_edp0server_response_get_BITS_29_TO_28_3__ETC__q6,
	       edp0$server_response_get[27:20],
	       CASE_edp0server_response_get_BITS_19_TO_18_3__ETC__q7,
	       edp0$server_response_get[17:10],
	       CASE_edp0server_response_get_BITS_9_TO_8_3_0__ETC__q8,
	       edp0$server_response_get[7:0] } ;
  assign eddp0$dstAddr_d = gbewrk$l2Dst ;
  assign eddp0$dstType_t = gbewrk$l2Typ ;
  assign eddp0$macAddr_u = pwrk$macAddr ;
  assign eddp0$server_request_put =
	     { CASE_emuxclient1_request_get_BITS_39_TO_38_3__ETC__q9,
	       emux$client1_request_get[37:30],
	       CASE_emuxclient1_request_get_BITS_29_TO_28_3__ETC__q10,
	       emux$client1_request_get[27:20],
	       CASE_emuxclient1_request_get_BITS_19_TO_18_3__ETC__q11,
	       emux$client1_request_get[17:10],
	       CASE_emuxclient1_request_get_BITS_9_TO_8_3_0__ETC__q12,
	       emux$client1_request_get[7:0] } ;
  assign eddp0$EN_server_request_put =
	     emux$RDY_client1_request_get && eddp0$RDY_server_request_put ;
  assign eddp0$EN_server_response_get =
	     emux$RDY_client1_response_put && eddp0$RDY_server_response_get ;
  assign eddp0$EN_client_request_get =
	     edp0$RDY_server_request_put && eddp0$RDY_client_request_get ;
  assign eddp0$EN_client_response_put =
	     edp0$RDY_server_response_get && eddp0$RDY_client_response_put ;
  assign eddp0$EN_macAddr = 1'd1 ;
  assign eddp0$EN_dstAddr = 1'd1 ;
  assign eddp0$EN_dstType = 1'd1 ;
  // submodule eddp1
  assign eddp1$client_response_put =
	     { CASE_edp1server_response_get_BITS_39_TO_38_3__ETC__q13,
	       edp1$server_response_get[37:30],
	       CASE_edp1server_response_get_BITS_29_TO_28_3__ETC__q14,
	       edp1$server_response_get[27:20],
	       CASE_edp1server_response_get_BITS_19_TO_18_3__ETC__q15,
	       edp1$server_response_get[17:10],
	       CASE_edp1server_response_get_BITS_9_TO_8_3_0__ETC__q16,
	       edp1$server_response_get[7:0] } ;
  assign eddp1$dstAddr_d = 48'h0 ;
  assign eddp1$dstType_t = 16'h0 ;
  assign eddp1$macAddr_u = pwrk$macAddr ;
  assign eddp1$server_request_put =
	     { CASE_emuxclient2_request_get_BITS_39_TO_38_3__ETC__q17,
	       emux$client2_request_get[37:30],
	       CASE_emuxclient2_request_get_BITS_29_TO_28_3__ETC__q18,
	       emux$client2_request_get[27:20],
	       CASE_emuxclient2_request_get_BITS_19_TO_18_3__ETC__q19,
	       emux$client2_request_get[17:10],
	       CASE_emuxclient2_request_get_BITS_9_TO_8_3_0__ETC__q20,
	       emux$client2_request_get[7:0] } ;
  assign eddp1$EN_server_request_put =
	     emux$RDY_client2_request_get && eddp1$RDY_server_request_put ;
  assign eddp1$EN_server_response_get =
	     emux$RDY_client2_response_put && eddp1$RDY_server_response_get ;
  assign eddp1$EN_client_request_get =
	     edp1$RDY_server_request_put && eddp1$RDY_client_request_get ;
  assign eddp1$EN_client_response_put =
	     edp1$RDY_server_response_get && eddp1$RDY_client_response_put ;
  assign eddp1$EN_macAddr = 1'd1 ;
  assign eddp1$EN_dstAddr = 1'b0 ;
  assign eddp1$EN_dstType = 1'b0 ;
  // submodule edp0
  assign edp0$server_request_put =
	     { CASE_eddp0client_request_get_BITS_39_TO_38_3__ETC__q21,
	       eddp0$client_request_get[37:30],
	       CASE_eddp0client_request_get_BITS_29_TO_28_3__ETC__q22,
	       eddp0$client_request_get[27:20],
	       CASE_eddp0client_request_get_BITS_19_TO_18_3__ETC__q23,
	       eddp0$client_request_get[17:10],
	       CASE_eddp0client_request_get_BITS_9_TO_8_3_0__ETC__q24,
	       eddp0$client_request_get[7:0] } ;
  assign edp0$wciS0_MAddr = cp$wci_Vm_13_MAddr ;
  assign edp0$wciS0_MAddrSpace = cp$wci_Vm_13_MAddrSpace ;
  assign edp0$wciS0_MByteEn = cp$wci_Vm_13_MByteEn ;
  assign edp0$wciS0_MCmd = cp$wci_Vm_13_MCmd ;
  assign edp0$wciS0_MData = cp$wci_Vm_13_MData ;
  assign edp0$wciS0_MFlag = cp$wci_Vm_13_MFlag ;
  assign edp0$wmiS0_MAddr = sma0$wmiM0_MAddr ;
  assign edp0$wmiS0_MAddrSpace = sma0$wmiM0_MAddrSpace ;
  assign edp0$wmiS0_MBurstLength = sma0$wmiM0_MBurstLength ;
  assign edp0$wmiS0_MCmd = sma0$wmiM0_MCmd ;
  assign edp0$wmiS0_MData = sma0$wmiM0_MData ;
  assign edp0$wmiS0_MDataByteEn = sma0$wmiM0_MDataByteEn ;
  assign edp0$wmiS0_MReqInfo = sma0$wmiM0_MReqInfo ;
  assign edp0$wmiS0_arg_mFlag = sma0$wmiM0_MFlag ;
  assign edp0$wtiS0_req = 67'h0 ;
  assign edp0$wmiS0_MReqLast = sma0$wmiM0_MReqLast ;
  assign edp0$wmiS0_MDataValid = sma0$wmiM0_MDataValid ;
  assign edp0$wmiS0_MDataLast = sma0$wmiM0_MDataLast ;
  assign edp0$wmiS0_MReset_n = sma0$wmiM0_MReset_n ;
  assign edp0$EN_server_request_put =
	     edp0$RDY_server_request_put && eddp0$RDY_client_request_get ;
  assign edp0$EN_server_response_get =
	     edp0$RDY_server_response_get && eddp0$RDY_client_response_put ;
  // submodule edp1
  assign edp1$server_request_put =
	     { CASE_eddp1client_request_get_BITS_39_TO_38_3__ETC__q25,
	       eddp1$client_request_get[37:30],
	       CASE_eddp1client_request_get_BITS_29_TO_28_3__ETC__q26,
	       eddp1$client_request_get[27:20],
	       CASE_eddp1client_request_get_BITS_19_TO_18_3__ETC__q27,
	       eddp1$client_request_get[17:10],
	       CASE_eddp1client_request_get_BITS_9_TO_8_3_0__ETC__q28,
	       eddp1$client_request_get[7:0] } ;
  assign edp1$wciS0_MAddr = cp$wci_Vm_14_MAddr ;
  assign edp1$wciS0_MAddrSpace = cp$wci_Vm_14_MAddrSpace ;
  assign edp1$wciS0_MByteEn = cp$wci_Vm_14_MByteEn ;
  assign edp1$wciS0_MCmd = cp$wci_Vm_14_MCmd ;
  assign edp1$wciS0_MData = cp$wci_Vm_14_MData ;
  assign edp1$wciS0_MFlag = cp$wci_Vm_14_MFlag ;
  assign edp1$wmiS0_MAddr = sma1$wmiM0_MAddr ;
  assign edp1$wmiS0_MAddrSpace = sma1$wmiM0_MAddrSpace ;
  assign edp1$wmiS0_MBurstLength = sma1$wmiM0_MBurstLength ;
  assign edp1$wmiS0_MCmd = sma1$wmiM0_MCmd ;
  assign edp1$wmiS0_MData = sma1$wmiM0_MData ;
  assign edp1$wmiS0_MDataByteEn = sma1$wmiM0_MDataByteEn ;
  assign edp1$wmiS0_MReqInfo = sma1$wmiM0_MReqInfo ;
  assign edp1$wmiS0_arg_mFlag = sma1$wmiM0_MFlag ;
  assign edp1$wtiS0_req = 67'h0 ;
  assign edp1$wmiS0_MReqLast = sma1$wmiM0_MReqLast ;
  assign edp1$wmiS0_MDataValid = sma1$wmiM0_MDataValid ;
  assign edp1$wmiS0_MDataLast = sma1$wmiM0_MDataLast ;
  assign edp1$wmiS0_MReset_n = sma1$wmiM0_MReset_n ;
  assign edp1$EN_server_request_put =
	     edp1$RDY_server_request_put && eddp1$RDY_client_request_get ;
  assign edp1$EN_server_response_get =
	     edp1$RDY_server_response_get && eddp1$RDY_client_response_put ;
  // submodule emux
  assign emux$client0_response_put =
	     { CASE_edcpserver_response_get_BITS_39_TO_38_3__ETC__q33,
	       edcp$server_response_get[37:30],
	       CASE_edcpserver_response_get_BITS_29_TO_28_3__ETC__q34,
	       edcp$server_response_get[27:20],
	       CASE_edcpserver_response_get_BITS_19_TO_18_3__ETC__q35,
	       edcp$server_response_get[17:10],
	       CASE_edcpserver_response_get_BITS_9_TO_8_3_0__ETC__q36,
	       edcp$server_response_get[7:0] } ;
  assign emux$client1_response_put =
	     { CASE_eddp0server_response_get_BITS_39_TO_38_3_ETC__q29,
	       eddp0$server_response_get[37:30],
	       CASE_eddp0server_response_get_BITS_29_TO_28_3_ETC__q30,
	       eddp0$server_response_get[27:20],
	       CASE_eddp0server_response_get_BITS_19_TO_18_3_ETC__q31,
	       eddp0$server_response_get[17:10],
	       CASE_eddp0server_response_get_BITS_9_TO_8_3_0_ETC__q32,
	       eddp0$server_response_get[7:0] } ;
  assign emux$client2_response_put =
	     { CASE_eddp1server_response_get_BITS_39_TO_38_3_ETC__q37,
	       eddp1$server_response_get[37:30],
	       CASE_eddp1server_response_get_BITS_29_TO_28_3_ETC__q38,
	       eddp1$server_response_get[27:20],
	       CASE_eddp1server_response_get_BITS_19_TO_18_3_ETC__q39,
	       eddp1$server_response_get[17:10],
	       CASE_eddp1server_response_get_BITS_9_TO_8_3_0_ETC__q40,
	       eddp1$server_response_get[7:0] } ;
  assign emux$server_request_put =
	     { CASE_gbe0client_request_get_BITS_39_TO_38_3_0_ETC__q41,
	       gbe0$client_request_get[37:30],
	       CASE_gbe0client_request_get_BITS_29_TO_28_3_0_ETC__q42,
	       gbe0$client_request_get[27:20],
	       CASE_gbe0client_request_get_BITS_19_TO_18_3_0_ETC__q43,
	       gbe0$client_request_get[17:10],
	       CASE_gbe0client_request_get_BITS_9_TO_8_3_0_g_ETC__q44,
	       gbe0$client_request_get[7:0] } ;
  assign emux$EN_server_request_put =
	     emux$RDY_server_request_put && gbe0$RDY_client_request_get ;
  assign emux$EN_server_response_get =
	     emux$RDY_server_response_get && gbe0$RDY_client_response_put ;
  assign emux$EN_client0_request_get =
	     emux$RDY_client0_request_get && edcp$RDY_server_request_put ;
  assign emux$EN_client0_response_put =
	     emux$RDY_client0_response_put && edcp$RDY_server_response_get ;
  assign emux$EN_client1_request_get =
	     emux$RDY_client1_request_get && eddp0$RDY_server_request_put ;
  assign emux$EN_client1_response_put =
	     emux$RDY_client1_response_put && eddp0$RDY_server_response_get ;
  assign emux$EN_client2_request_get =
	     emux$RDY_client2_request_get && eddp1$RDY_server_request_put ;
  assign emux$EN_client2_response_put =
	     emux$RDY_client2_response_put && eddp1$RDY_server_response_get ;
  // submodule gbe0
  assign gbe0$client_response_put =
	     { CASE_emuxserver_response_get_BITS_39_TO_38_3__ETC__q45,
	       emux$server_response_get[37:30],
	       CASE_emuxserver_response_get_BITS_29_TO_28_3__ETC__q46,
	       emux$server_response_get[27:20],
	       CASE_emuxserver_response_get_BITS_19_TO_18_3__ETC__q47,
	       emux$server_response_get[17:10],
	       CASE_emuxserver_response_get_BITS_9_TO_8_3_0__ETC__q48,
	       emux$server_response_get[7:0] } ;
  assign gbe0$gmii_col_i = gmii_col_i ;
  assign gbe0$gmii_crs_i = gmii_crs_i ;
  assign gbe0$gmii_intr_i = gmii_intr_i ;
  assign gbe0$gmii_rx_rx_dv_i = gmii_rx_rx_dv_i ;
  assign gbe0$gmii_rx_rx_er_i = gmii_rx_rx_er_i ;
  assign gbe0$gmii_rx_rxd_i = gmii_rx_rxd_i ;
  assign gbe0$EN_client_request_get =
	     emux$RDY_server_request_put && gbe0$RDY_client_request_get ;
  assign gbe0$EN_client_response_put =
	     emux$RDY_server_response_get && gbe0$RDY_client_response_put ;
  // submodule gbewrk
  assign gbewrk$dgdpEgressCnt_arg = 32'h0 ;
  assign gbewrk$wciS0_MAddr = cp$wci_Vm_9_MAddr ;
  assign gbewrk$wciS0_MAddrSpace = cp$wci_Vm_9_MAddrSpace ;
  assign gbewrk$wciS0_MByteEn = cp$wci_Vm_9_MByteEn ;
  assign gbewrk$wciS0_MCmd = cp$wci_Vm_9_MCmd ;
  assign gbewrk$wciS0_MData = cp$wci_Vm_9_MData ;
  assign gbewrk$wciS0_MFlag = cp$wci_Vm_9_MFlag ;
  assign gbewrk$EN_dgdpEgressCnt = 1'b0 ;
  // submodule iqadc
  assign iqadc$adc_da_i = adc_da_i ;
  assign iqadc$adc_db_i = adc_db_i ;
  assign iqadc$adc_smiso_i = adc_smiso_i ;
  assign iqadc$wciS0_MAddr = cp$wci_Vm_10_MAddr ;
  assign iqadc$wciS0_MAddrSpace = cp$wci_Vm_10_MAddrSpace ;
  assign iqadc$wciS0_MByteEn = cp$wci_Vm_10_MByteEn ;
  assign iqadc$wciS0_MCmd = cp$wci_Vm_10_MCmd ;
  assign iqadc$wciS0_MData = cp$wci_Vm_10_MData ;
  assign iqadc$wciS0_MFlag = cp$wci_Vm_10_MFlag ;
  assign iqadc$wtiS0_req = 67'h0 ;
  assign iqadc$wsiM0_SThreadBusy = 1'b0 ;
  assign iqadc$wsiM0_SReset_n = 1'b0 ;
  // submodule ledLogic
  assign ledLogic$ledDrive_i = 5'h0 ;
  assign ledLogic$EN_ledDrive = 1'b0 ;
  // submodule pwrk
  assign pwrk$spipad_miso_i = flash_miso_i ;
  assign pwrk$wciS0_MAddr = cp$wci_Vm_7_MAddr ;
  assign pwrk$wciS0_MAddrSpace = cp$wci_Vm_7_MAddrSpace ;
  assign pwrk$wciS0_MByteEn = cp$wci_Vm_7_MByteEn ;
  assign pwrk$wciS0_MCmd = cp$wci_Vm_7_MCmd ;
  assign pwrk$wciS0_MData = cp$wci_Vm_7_MData ;
  assign pwrk$wciS0_MFlag = cp$wci_Vm_7_MFlag ;
  // submodule sma0
  assign sma0$wciS0_MAddr = cp$wci_Vm_2_MAddr ;
  assign sma0$wciS0_MAddrSpace = cp$wci_Vm_2_MAddrSpace ;
  assign sma0$wciS0_MByteEn = cp$wci_Vm_2_MByteEn ;
  assign sma0$wciS0_MCmd = cp$wci_Vm_2_MCmd ;
  assign sma0$wciS0_MData = cp$wci_Vm_2_MData ;
  assign sma0$wciS0_MFlag = cp$wci_Vm_2_MFlag ;
  assign sma0$wmiM0_SData = edp0$wmiS0_SData ;
  assign sma0$wmiM0_SFlag = edp0$wmiS0_SFlag ;
  assign sma0$wmiM0_SResp = edp0$wmiS0_SResp ;
  assign sma0$wsiS0_MBurstLength = 12'h0 ;
  assign sma0$wsiS0_MByteEn = 4'h0 ;
  assign sma0$wsiS0_MCmd = 3'h0 ;
  assign sma0$wsiS0_MData = 32'h0 ;
  assign sma0$wsiS0_MReqInfo = 8'h0 ;
  assign sma0$wmiM0_SThreadBusy = edp0$wmiS0_SThreadBusy ;
  assign sma0$wmiM0_SDataThreadBusy = edp0$wmiS0_SDataThreadBusy ;
  assign sma0$wmiM0_SRespLast = edp0$wmiS0_SRespLast ;
  assign sma0$wmiM0_SReset_n = edp0$wmiS0_SReset_n ;
  assign sma0$wsiM0_SThreadBusy = bias$wsiS0_SThreadBusy ;
  assign sma0$wsiM0_SReset_n = bias$wsiS0_SReset_n ;
  assign sma0$wsiS0_MReqLast = 1'b0 ;
  assign sma0$wsiS0_MBurstPrecise = 1'b0 ;
  assign sma0$wsiS0_MReset_n = 1'b0 ;
  // submodule sma1
  assign sma1$wciS0_MAddr = cp$wci_Vm_4_MAddr ;
  assign sma1$wciS0_MAddrSpace = cp$wci_Vm_4_MAddrSpace ;
  assign sma1$wciS0_MByteEn = cp$wci_Vm_4_MByteEn ;
  assign sma1$wciS0_MCmd = cp$wci_Vm_4_MCmd ;
  assign sma1$wciS0_MData = cp$wci_Vm_4_MData ;
  assign sma1$wciS0_MFlag = cp$wci_Vm_4_MFlag ;
  assign sma1$wmiM0_SData = edp1$wmiS0_SData ;
  assign sma1$wmiM0_SFlag = edp1$wmiS0_SFlag ;
  assign sma1$wmiM0_SResp = edp1$wmiS0_SResp ;
  assign sma1$wsiS0_MBurstLength = bias$wsiM0_MBurstLength ;
  assign sma1$wsiS0_MByteEn = bias$wsiM0_MByteEn ;
  assign sma1$wsiS0_MCmd = bias$wsiM0_MCmd ;
  assign sma1$wsiS0_MData = bias$wsiM0_MData ;
  assign sma1$wsiS0_MReqInfo = bias$wsiM0_MReqInfo ;
  assign sma1$wmiM0_SThreadBusy = edp1$wmiS0_SThreadBusy ;
  assign sma1$wmiM0_SDataThreadBusy = edp1$wmiS0_SDataThreadBusy ;
  assign sma1$wmiM0_SRespLast = edp1$wmiS0_SRespLast ;
  assign sma1$wmiM0_SReset_n = edp1$wmiS0_SReset_n ;
  assign sma1$wsiM0_SThreadBusy = 1'b0 ;
  assign sma1$wsiM0_SReset_n = 1'b0 ;
  assign sma1$wsiS0_MReqLast = bias$wsiM0_MReqLast ;
  assign sma1$wsiS0_MBurstPrecise = bias$wsiM0_MBurstPrecise ;
  assign sma1$wsiS0_MReset_n = bias$wsiM0_MReset_n ;
  // remaining internal signals
  always@(emux$client0_request_get)
  begin
    case (emux$client0_request_get[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxclient0_request_get_BITS_39_TO_38_3__ETC__q1 =
	      emux$client0_request_get[39:38];
      2'd3: CASE_emuxclient0_request_get_BITS_39_TO_38_3__ETC__q1 = 2'd3;
    endcase
  end
  always@(emux$client0_request_get)
  begin
    case (emux$client0_request_get[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxclient0_request_get_BITS_29_TO_28_3__ETC__q2 =
	      emux$client0_request_get[29:28];
      2'd3: CASE_emuxclient0_request_get_BITS_29_TO_28_3__ETC__q2 = 2'd3;
    endcase
  end
  always@(emux$client0_request_get)
  begin
    case (emux$client0_request_get[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxclient0_request_get_BITS_19_TO_18_3__ETC__q3 =
	      emux$client0_request_get[19:18];
      2'd3: CASE_emuxclient0_request_get_BITS_19_TO_18_3__ETC__q3 = 2'd3;
    endcase
  end
  always@(emux$client0_request_get)
  begin
    case (emux$client0_request_get[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxclient0_request_get_BITS_9_TO_8_3_0__ETC__q4 =
	      emux$client0_request_get[9:8];
      2'd3: CASE_emuxclient0_request_get_BITS_9_TO_8_3_0__ETC__q4 = 2'd3;
    endcase
  end
  always@(edp0$server_response_get)
  begin
    case (edp0$server_response_get[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_edp0server_response_get_BITS_39_TO_38_3__ETC__q5 =
	      edp0$server_response_get[39:38];
      2'd3: CASE_edp0server_response_get_BITS_39_TO_38_3__ETC__q5 = 2'd3;
    endcase
  end
  always@(edp0$server_response_get)
  begin
    case (edp0$server_response_get[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_edp0server_response_get_BITS_29_TO_28_3__ETC__q6 =
	      edp0$server_response_get[29:28];
      2'd3: CASE_edp0server_response_get_BITS_29_TO_28_3__ETC__q6 = 2'd3;
    endcase
  end
  always@(edp0$server_response_get)
  begin
    case (edp0$server_response_get[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_edp0server_response_get_BITS_19_TO_18_3__ETC__q7 =
	      edp0$server_response_get[19:18];
      2'd3: CASE_edp0server_response_get_BITS_19_TO_18_3__ETC__q7 = 2'd3;
    endcase
  end
  always@(edp0$server_response_get)
  begin
    case (edp0$server_response_get[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_edp0server_response_get_BITS_9_TO_8_3_0__ETC__q8 =
	      edp0$server_response_get[9:8];
      2'd3: CASE_edp0server_response_get_BITS_9_TO_8_3_0__ETC__q8 = 2'd3;
    endcase
  end
  always@(emux$client1_request_get)
  begin
    case (emux$client1_request_get[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxclient1_request_get_BITS_39_TO_38_3__ETC__q9 =
	      emux$client1_request_get[39:38];
      2'd3: CASE_emuxclient1_request_get_BITS_39_TO_38_3__ETC__q9 = 2'd3;
    endcase
  end
  always@(emux$client1_request_get)
  begin
    case (emux$client1_request_get[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxclient1_request_get_BITS_29_TO_28_3__ETC__q10 =
	      emux$client1_request_get[29:28];
      2'd3: CASE_emuxclient1_request_get_BITS_29_TO_28_3__ETC__q10 = 2'd3;
    endcase
  end
  always@(emux$client1_request_get)
  begin
    case (emux$client1_request_get[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxclient1_request_get_BITS_19_TO_18_3__ETC__q11 =
	      emux$client1_request_get[19:18];
      2'd3: CASE_emuxclient1_request_get_BITS_19_TO_18_3__ETC__q11 = 2'd3;
    endcase
  end
  always@(emux$client1_request_get)
  begin
    case (emux$client1_request_get[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxclient1_request_get_BITS_9_TO_8_3_0__ETC__q12 =
	      emux$client1_request_get[9:8];
      2'd3: CASE_emuxclient1_request_get_BITS_9_TO_8_3_0__ETC__q12 = 2'd3;
    endcase
  end
  always@(edp1$server_response_get)
  begin
    case (edp1$server_response_get[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_edp1server_response_get_BITS_39_TO_38_3__ETC__q13 =
	      edp1$server_response_get[39:38];
      2'd3: CASE_edp1server_response_get_BITS_39_TO_38_3__ETC__q13 = 2'd3;
    endcase
  end
  always@(edp1$server_response_get)
  begin
    case (edp1$server_response_get[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_edp1server_response_get_BITS_29_TO_28_3__ETC__q14 =
	      edp1$server_response_get[29:28];
      2'd3: CASE_edp1server_response_get_BITS_29_TO_28_3__ETC__q14 = 2'd3;
    endcase
  end
  always@(edp1$server_response_get)
  begin
    case (edp1$server_response_get[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_edp1server_response_get_BITS_19_TO_18_3__ETC__q15 =
	      edp1$server_response_get[19:18];
      2'd3: CASE_edp1server_response_get_BITS_19_TO_18_3__ETC__q15 = 2'd3;
    endcase
  end
  always@(edp1$server_response_get)
  begin
    case (edp1$server_response_get[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_edp1server_response_get_BITS_9_TO_8_3_0__ETC__q16 =
	      edp1$server_response_get[9:8];
      2'd3: CASE_edp1server_response_get_BITS_9_TO_8_3_0__ETC__q16 = 2'd3;
    endcase
  end
  always@(emux$client2_request_get)
  begin
    case (emux$client2_request_get[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxclient2_request_get_BITS_39_TO_38_3__ETC__q17 =
	      emux$client2_request_get[39:38];
      2'd3: CASE_emuxclient2_request_get_BITS_39_TO_38_3__ETC__q17 = 2'd3;
    endcase
  end
  always@(emux$client2_request_get)
  begin
    case (emux$client2_request_get[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxclient2_request_get_BITS_29_TO_28_3__ETC__q18 =
	      emux$client2_request_get[29:28];
      2'd3: CASE_emuxclient2_request_get_BITS_29_TO_28_3__ETC__q18 = 2'd3;
    endcase
  end
  always@(emux$client2_request_get)
  begin
    case (emux$client2_request_get[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxclient2_request_get_BITS_19_TO_18_3__ETC__q19 =
	      emux$client2_request_get[19:18];
      2'd3: CASE_emuxclient2_request_get_BITS_19_TO_18_3__ETC__q19 = 2'd3;
    endcase
  end
  always@(emux$client2_request_get)
  begin
    case (emux$client2_request_get[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxclient2_request_get_BITS_9_TO_8_3_0__ETC__q20 =
	      emux$client2_request_get[9:8];
      2'd3: CASE_emuxclient2_request_get_BITS_9_TO_8_3_0__ETC__q20 = 2'd3;
    endcase
  end
  always@(eddp0$client_request_get)
  begin
    case (eddp0$client_request_get[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp0client_request_get_BITS_39_TO_38_3__ETC__q21 =
	      eddp0$client_request_get[39:38];
      2'd3: CASE_eddp0client_request_get_BITS_39_TO_38_3__ETC__q21 = 2'd3;
    endcase
  end
  always@(eddp0$client_request_get)
  begin
    case (eddp0$client_request_get[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp0client_request_get_BITS_29_TO_28_3__ETC__q22 =
	      eddp0$client_request_get[29:28];
      2'd3: CASE_eddp0client_request_get_BITS_29_TO_28_3__ETC__q22 = 2'd3;
    endcase
  end
  always@(eddp0$client_request_get)
  begin
    case (eddp0$client_request_get[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp0client_request_get_BITS_19_TO_18_3__ETC__q23 =
	      eddp0$client_request_get[19:18];
      2'd3: CASE_eddp0client_request_get_BITS_19_TO_18_3__ETC__q23 = 2'd3;
    endcase
  end
  always@(eddp0$client_request_get)
  begin
    case (eddp0$client_request_get[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp0client_request_get_BITS_9_TO_8_3_0__ETC__q24 =
	      eddp0$client_request_get[9:8];
      2'd3: CASE_eddp0client_request_get_BITS_9_TO_8_3_0__ETC__q24 = 2'd3;
    endcase
  end
  always@(eddp1$client_request_get)
  begin
    case (eddp1$client_request_get[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp1client_request_get_BITS_39_TO_38_3__ETC__q25 =
	      eddp1$client_request_get[39:38];
      2'd3: CASE_eddp1client_request_get_BITS_39_TO_38_3__ETC__q25 = 2'd3;
    endcase
  end
  always@(eddp1$client_request_get)
  begin
    case (eddp1$client_request_get[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp1client_request_get_BITS_29_TO_28_3__ETC__q26 =
	      eddp1$client_request_get[29:28];
      2'd3: CASE_eddp1client_request_get_BITS_29_TO_28_3__ETC__q26 = 2'd3;
    endcase
  end
  always@(eddp1$client_request_get)
  begin
    case (eddp1$client_request_get[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp1client_request_get_BITS_19_TO_18_3__ETC__q27 =
	      eddp1$client_request_get[19:18];
      2'd3: CASE_eddp1client_request_get_BITS_19_TO_18_3__ETC__q27 = 2'd3;
    endcase
  end
  always@(eddp1$client_request_get)
  begin
    case (eddp1$client_request_get[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp1client_request_get_BITS_9_TO_8_3_0__ETC__q28 =
	      eddp1$client_request_get[9:8];
      2'd3: CASE_eddp1client_request_get_BITS_9_TO_8_3_0__ETC__q28 = 2'd3;
    endcase
  end
  always@(eddp0$server_response_get)
  begin
    case (eddp0$server_response_get[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp0server_response_get_BITS_39_TO_38_3_ETC__q29 =
	      eddp0$server_response_get[39:38];
      2'd3: CASE_eddp0server_response_get_BITS_39_TO_38_3_ETC__q29 = 2'd3;
    endcase
  end
  always@(eddp0$server_response_get)
  begin
    case (eddp0$server_response_get[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp0server_response_get_BITS_29_TO_28_3_ETC__q30 =
	      eddp0$server_response_get[29:28];
      2'd3: CASE_eddp0server_response_get_BITS_29_TO_28_3_ETC__q30 = 2'd3;
    endcase
  end
  always@(eddp0$server_response_get)
  begin
    case (eddp0$server_response_get[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp0server_response_get_BITS_19_TO_18_3_ETC__q31 =
	      eddp0$server_response_get[19:18];
      2'd3: CASE_eddp0server_response_get_BITS_19_TO_18_3_ETC__q31 = 2'd3;
    endcase
  end
  always@(eddp0$server_response_get)
  begin
    case (eddp0$server_response_get[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp0server_response_get_BITS_9_TO_8_3_0_ETC__q32 =
	      eddp0$server_response_get[9:8];
      2'd3: CASE_eddp0server_response_get_BITS_9_TO_8_3_0_ETC__q32 = 2'd3;
    endcase
  end
  always@(edcp$server_response_get)
  begin
    case (edcp$server_response_get[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_edcpserver_response_get_BITS_39_TO_38_3__ETC__q33 =
	      edcp$server_response_get[39:38];
      2'd3: CASE_edcpserver_response_get_BITS_39_TO_38_3__ETC__q33 = 2'd3;
    endcase
  end
  always@(edcp$server_response_get)
  begin
    case (edcp$server_response_get[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_edcpserver_response_get_BITS_29_TO_28_3__ETC__q34 =
	      edcp$server_response_get[29:28];
      2'd3: CASE_edcpserver_response_get_BITS_29_TO_28_3__ETC__q34 = 2'd3;
    endcase
  end
  always@(edcp$server_response_get)
  begin
    case (edcp$server_response_get[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_edcpserver_response_get_BITS_19_TO_18_3__ETC__q35 =
	      edcp$server_response_get[19:18];
      2'd3: CASE_edcpserver_response_get_BITS_19_TO_18_3__ETC__q35 = 2'd3;
    endcase
  end
  always@(edcp$server_response_get)
  begin
    case (edcp$server_response_get[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_edcpserver_response_get_BITS_9_TO_8_3_0__ETC__q36 =
	      edcp$server_response_get[9:8];
      2'd3: CASE_edcpserver_response_get_BITS_9_TO_8_3_0__ETC__q36 = 2'd3;
    endcase
  end
  always@(eddp1$server_response_get)
  begin
    case (eddp1$server_response_get[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp1server_response_get_BITS_39_TO_38_3_ETC__q37 =
	      eddp1$server_response_get[39:38];
      2'd3: CASE_eddp1server_response_get_BITS_39_TO_38_3_ETC__q37 = 2'd3;
    endcase
  end
  always@(eddp1$server_response_get)
  begin
    case (eddp1$server_response_get[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp1server_response_get_BITS_29_TO_28_3_ETC__q38 =
	      eddp1$server_response_get[29:28];
      2'd3: CASE_eddp1server_response_get_BITS_29_TO_28_3_ETC__q38 = 2'd3;
    endcase
  end
  always@(eddp1$server_response_get)
  begin
    case (eddp1$server_response_get[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp1server_response_get_BITS_19_TO_18_3_ETC__q39 =
	      eddp1$server_response_get[19:18];
      2'd3: CASE_eddp1server_response_get_BITS_19_TO_18_3_ETC__q39 = 2'd3;
    endcase
  end
  always@(eddp1$server_response_get)
  begin
    case (eddp1$server_response_get[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_eddp1server_response_get_BITS_9_TO_8_3_0_ETC__q40 =
	      eddp1$server_response_get[9:8];
      2'd3: CASE_eddp1server_response_get_BITS_9_TO_8_3_0_ETC__q40 = 2'd3;
    endcase
  end
  always@(gbe0$client_request_get)
  begin
    case (gbe0$client_request_get[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_gbe0client_request_get_BITS_39_TO_38_3_0_ETC__q41 =
	      gbe0$client_request_get[39:38];
      2'd3: CASE_gbe0client_request_get_BITS_39_TO_38_3_0_ETC__q41 = 2'd3;
    endcase
  end
  always@(gbe0$client_request_get)
  begin
    case (gbe0$client_request_get[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_gbe0client_request_get_BITS_29_TO_28_3_0_ETC__q42 =
	      gbe0$client_request_get[29:28];
      2'd3: CASE_gbe0client_request_get_BITS_29_TO_28_3_0_ETC__q42 = 2'd3;
    endcase
  end
  always@(gbe0$client_request_get)
  begin
    case (gbe0$client_request_get[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_gbe0client_request_get_BITS_19_TO_18_3_0_ETC__q43 =
	      gbe0$client_request_get[19:18];
      2'd3: CASE_gbe0client_request_get_BITS_19_TO_18_3_0_ETC__q43 = 2'd3;
    endcase
  end
  always@(gbe0$client_request_get)
  begin
    case (gbe0$client_request_get[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_gbe0client_request_get_BITS_9_TO_8_3_0_g_ETC__q44 =
	      gbe0$client_request_get[9:8];
      2'd3: CASE_gbe0client_request_get_BITS_9_TO_8_3_0_g_ETC__q44 = 2'd3;
    endcase
  end
  always@(emux$server_response_get)
  begin
    case (emux$server_response_get[39:38])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxserver_response_get_BITS_39_TO_38_3__ETC__q45 =
	      emux$server_response_get[39:38];
      2'd3: CASE_emuxserver_response_get_BITS_39_TO_38_3__ETC__q45 = 2'd3;
    endcase
  end
  always@(emux$server_response_get)
  begin
    case (emux$server_response_get[29:28])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxserver_response_get_BITS_29_TO_28_3__ETC__q46 =
	      emux$server_response_get[29:28];
      2'd3: CASE_emuxserver_response_get_BITS_29_TO_28_3__ETC__q46 = 2'd3;
    endcase
  end
  always@(emux$server_response_get)
  begin
    case (emux$server_response_get[19:18])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxserver_response_get_BITS_19_TO_18_3__ETC__q47 =
	      emux$server_response_get[19:18];
      2'd3: CASE_emuxserver_response_get_BITS_19_TO_18_3__ETC__q47 = 2'd3;
    endcase
  end
  always@(emux$server_response_get)
  begin
    case (emux$server_response_get[9:8])
      2'd0, 2'd1, 2'd2:
	  CASE_emuxserver_response_get_BITS_9_TO_8_3_0__ETC__q48 =
	      emux$server_response_get[9:8];
      2'd3: CASE_emuxserver_response_get_BITS_9_TO_8_3_0__ETC__q48 = 2'd3;
    endcase
  end
  // handling of inlined registers
  always@(posedge clkN210$clkdv_buf)
  begin
    if (clkN210$clkdv_rstn == `BSV_RESET_VALUE)
      begin
        dbgReg <= `BSV_ASSIGNMENT_DELAY 32'd0;
	tog50 <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (dbgReg$EN) dbgReg <= `BSV_ASSIGNMENT_DELAY dbgReg$D_IN;
	if (tog50$EN) tog50 <= `BSV_ASSIGNMENT_DELAY tog50$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    dbgReg = 32'hAAAAAAAA;
    tog50 = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule