module outputs
  wire [127 : 0] wmemiS0_SData;
  wire [31 : 0] wciS0_SData;
  wire [12 : 0] dram_addr;
  wire [7 : 0] dram_dm;
  wire [2 : 0] dram_ba;
  wire [1 : 0] wciS0_SFlag, wciS0_SResp, wmemiS0_SResp;
  wire dram_cas_n,
       dram_ck_n,
       dram_ck_p,
       dram_cke,
       dram_cs_n,
       dram_odt,
       dram_ras_n,
       dram_reset_n,
       dram_we_n,
       wciS0_SThreadBusy,
       wmemiS0_SCmdAccept,
       wmemiS0_SDataAccept,
       wmemiS0_SRespLast;
  // inlined wires
  wire [145 : 0] wmemi_wmemiDh$wget;
  wire [130 : 0] wmemi_respF_x_wire$wget;
  wire [127 : 0] wmemi_Es_mData_w$wget;
  wire [71 : 0] wci_wslv_wciReq$wget;
  wire [51 : 0] wmemi_wmemiReq$wget;
  wire [35 : 0] wmemi_Es_mAddr_w$wget;
  wire [33 : 0] wci_wslv_respF_x_wire$wget;
  wire [31 : 0] wci_wci_Es_mAddr_w$wget, wci_wci_Es_mData_w$wget;
  wire [15 : 0] wmemi_Es_mDataByteEn_w$wget;
  wire [11 : 0] wmemi_Es_mBurstLength_w$wget;
  wire [7 : 0] wmemiReadInFlight_acc_v1$wget, wmemiReadInFlight_acc_v2$wget;
  wire [3 : 0] wci_wci_Es_mByteEn_w$wget;
  wire [2 : 0] wci_wci_Es_mCmd_w$wget,
	       wci_wslv_wEdge$wget,
	       wmemi_Es_mCmd_w$wget;
  wire memc_wdfEnd$wget,
       memc_wdfEnd$whas,
       memc_wdfWren$wget,
       memc_wdfWren$whas,
       wci_wci_Es_mAddrSpace_w$wget,
       wci_wci_Es_mAddrSpace_w$whas,
       wci_wci_Es_mAddr_w$whas,
       wci_wci_Es_mByteEn_w$whas,
       wci_wci_Es_mCmd_w$whas,
       wci_wci_Es_mData_w$whas,
       wci_wslv_ctlAckReg_1$wget,
       wci_wslv_ctlAckReg_1$whas,
       wci_wslv_reqF_r_clr$whas,
       wci_wslv_reqF_r_deq$whas,
       wci_wslv_reqF_r_enq$whas,
       wci_wslv_respF_dequeueing$whas,
       wci_wslv_respF_enqueueing$whas,
       wci_wslv_respF_x_wire$whas,
       wci_wslv_sFlagReg_1$wget,
       wci_wslv_sFlagReg_1$whas,
       wci_wslv_sThreadBusy_pw$whas,
       wci_wslv_wEdge$whas,
       wci_wslv_wciReq$whas,
       wci_wslv_wci_cfrd_pw$whas,
       wci_wslv_wci_cfwr_pw$whas,
       wci_wslv_wci_ctrl_pw$whas,
       wmemiReadInFlight_acc_v1$whas,
       wmemiReadInFlight_acc_v2$whas,
       wmemi_Es_mAddr_w$whas,
       wmemi_Es_mBurstLength_w$whas,
       wmemi_Es_mCmd_w$whas,
       wmemi_Es_mDataByteEn_w$whas,
       wmemi_Es_mDataLast_w$whas,
       wmemi_Es_mDataValid_w$whas,
       wmemi_Es_mData_w$whas,
       wmemi_Es_mReqLast_w$whas,
       wmemi_cmdAccept_w$wget,
       wmemi_cmdAccept_w$whas,
       wmemi_dhAccept_w$wget,
       wmemi_dhAccept_w$whas,
       wmemi_operateD_1$wget,
       wmemi_operateD_1$whas,
       wmemi_peerIsReady_1$wget,
       wmemi_peerIsReady_1$whas,
       wmemi_respF_dequeueing$whas,
       wmemi_respF_enqueueing$whas,
       wmemi_respF_x_wire$whas,
       wmemi_wmemiDh$whas,
       wmemi_wmemiReq$whas;
  // register dbgCtrl
  reg [31 : 0] dbgCtrl;
  wire [31 : 0] dbgCtrl$D_IN;
  wire dbgCtrl$EN;
  // register dramCtrl
  reg [31 : 0] dramCtrl;
  wire [31 : 0] dramCtrl$D_IN;
  wire dramCtrl$EN;
  // register mReg
  reg [15 : 0] mReg;
  wire [15 : 0] mReg$D_IN;
  wire mReg$EN;
  // register memIsReset_isInReset
  reg memIsReset_isInReset;
  wire memIsReset_isInReset$D_IN, memIsReset_isInReset$EN;
  // register memc_firstBeat
  reg memc_firstBeat;
  wire memc_firstBeat$D_IN, memc_firstBeat$EN;
  // register memc_requestCount
  reg [15 : 0] memc_requestCount;
  wire [15 : 0] memc_requestCount$D_IN;
  wire memc_requestCount$EN;
  // register memc_secondBeat
  reg memc_secondBeat;
  wire memc_secondBeat$D_IN, memc_secondBeat$EN;
  // register pReg
  reg [15 : 0] pReg;
  wire [15 : 0] pReg$D_IN;
  wire pReg$EN;
  // register rdReg
  reg [31 : 0] rdReg;
  wire [31 : 0] rdReg$D_IN;
  wire rdReg$EN;
  // register rdReg_1
  reg [31 : 0] rdReg_1;
  wire [31 : 0] rdReg_1$D_IN;
  wire rdReg_1$EN;
  // register rdReg_2
  reg [31 : 0] rdReg_2;
  wire [31 : 0] rdReg_2$D_IN;
  wire rdReg_2$EN;
  // register rdReg_3
  reg [31 : 0] rdReg_3;
  wire [31 : 0] rdReg_3$D_IN;
  wire rdReg_3$EN;
  // register respCount
  reg [7 : 0] respCount;
  wire [7 : 0] respCount$D_IN;
  wire respCount$EN;
  // register splitReadInFlight
  reg splitReadInFlight;
  wire splitReadInFlight$D_IN, splitReadInFlight$EN;
  // register wci_wslv_cEdge
  reg [2 : 0] wci_wslv_cEdge;
  wire [2 : 0] wci_wslv_cEdge$D_IN;
  wire wci_wslv_cEdge$EN;
  // register wci_wslv_cState
  reg [2 : 0] wci_wslv_cState;
  wire [2 : 0] wci_wslv_cState$D_IN;
  wire wci_wslv_cState$EN;
  // register wci_wslv_ctlAckReg
  reg wci_wslv_ctlAckReg;
  wire wci_wslv_ctlAckReg$D_IN, wci_wslv_ctlAckReg$EN;
  // register wci_wslv_ctlOpActive
  reg wci_wslv_ctlOpActive;
  wire wci_wslv_ctlOpActive$D_IN, wci_wslv_ctlOpActive$EN;
  // register wci_wslv_illegalEdge
  reg wci_wslv_illegalEdge;
  wire wci_wslv_illegalEdge$D_IN, wci_wslv_illegalEdge$EN;
  // register wci_wslv_isReset_isInReset
  reg wci_wslv_isReset_isInReset;
  wire wci_wslv_isReset_isInReset$D_IN, wci_wslv_isReset_isInReset$EN;
  // register wci_wslv_nState
  reg [2 : 0] wci_wslv_nState;
  reg [2 : 0] wci_wslv_nState$D_IN;
  wire wci_wslv_nState$EN;
  // register wci_wslv_reqF_countReg
  reg [1 : 0] wci_wslv_reqF_countReg;
  wire [1 : 0] wci_wslv_reqF_countReg$D_IN;
  wire wci_wslv_reqF_countReg$EN;
  // register wci_wslv_respF_c_r
  reg [1 : 0] wci_wslv_respF_c_r;
  wire [1 : 0] wci_wslv_respF_c_r$D_IN;
  wire wci_wslv_respF_c_r$EN;
  // register wci_wslv_respF_q_0
  reg [33 : 0] wci_wslv_respF_q_0;
  reg [33 : 0] wci_wslv_respF_q_0$D_IN;
  wire wci_wslv_respF_q_0$EN;
  // register wci_wslv_respF_q_1
  reg [33 : 0] wci_wslv_respF_q_1;
  reg [33 : 0] wci_wslv_respF_q_1$D_IN;
  wire wci_wslv_respF_q_1$EN;
  // register wci_wslv_sFlagReg
  reg wci_wslv_sFlagReg;
  wire wci_wslv_sFlagReg$D_IN, wci_wslv_sFlagReg$EN;
  // register wci_wslv_sThreadBusy_d
  reg wci_wslv_sThreadBusy_d;
  wire wci_wslv_sThreadBusy_d$D_IN, wci_wslv_sThreadBusy_d$EN;
  // register wdReg
  reg [31 : 0] wdReg;
  wire [31 : 0] wdReg$D_IN;
  wire wdReg$EN;
  // register wdReg_1
  reg [31 : 0] wdReg_1;
  wire [31 : 0] wdReg_1$D_IN;
  wire wdReg_1$EN;
  // register wdReg_2
  reg [31 : 0] wdReg_2;
  wire [31 : 0] wdReg_2$D_IN;
  wire wdReg_2$EN;
  // register wdReg_3
  reg [31 : 0] wdReg_3;
  wire [31 : 0] wdReg_3$D_IN;
  wire wdReg_3$EN;
  // register wmemiRdReq
  reg [31 : 0] wmemiRdReq;
  wire [31 : 0] wmemiRdReq$D_IN;
  wire wmemiRdReq$EN;
  // register wmemiRdResp
  reg [31 : 0] wmemiRdResp;
  wire [31 : 0] wmemiRdResp$D_IN;
  wire wmemiRdResp$EN;
  // register wmemiReadInFlight_value
  reg [7 : 0] wmemiReadInFlight_value;
  wire [7 : 0] wmemiReadInFlight_value$D_IN;
  wire wmemiReadInFlight_value$EN;
  // register wmemiWrReq
  reg [31 : 0] wmemiWrReq;
  wire [31 : 0] wmemiWrReq$D_IN;
  wire wmemiWrReq$EN;
  // register wmemi_errorSticky
  reg wmemi_errorSticky;
  wire wmemi_errorSticky$D_IN, wmemi_errorSticky$EN;
  // register wmemi_isReset_isInReset
  reg wmemi_isReset_isInReset;
  wire wmemi_isReset_isInReset$D_IN, wmemi_isReset_isInReset$EN;
  // register wmemi_operateD
  reg wmemi_operateD;
  wire wmemi_operateD$D_IN, wmemi_operateD$EN;
  // register wmemi_peerIsReady
  reg wmemi_peerIsReady;
  wire wmemi_peerIsReady$D_IN, wmemi_peerIsReady$EN;
  // register wmemi_respF_c_r
  reg [1 : 0] wmemi_respF_c_r;
  wire [1 : 0] wmemi_respF_c_r$D_IN;
  wire wmemi_respF_c_r$EN;
  // register wmemi_respF_q_0
  reg [130 : 0] wmemi_respF_q_0;
  reg [130 : 0] wmemi_respF_q_0$D_IN;
  wire wmemi_respF_q_0$EN;
  // register wmemi_respF_q_1
  reg [130 : 0] wmemi_respF_q_1;
  reg [130 : 0] wmemi_respF_q_1$D_IN;
  wire wmemi_respF_q_1$EN;
  // register wmemi_statusR
  reg [7 : 0] wmemi_statusR;
  wire [7 : 0] wmemi_statusR$D_IN;
  wire wmemi_statusR$EN;
  // register wmemi_trafficSticky
  reg wmemi_trafficSticky;
  wire wmemi_trafficSticky$D_IN, wmemi_trafficSticky$EN;
  // ports of submodule appFull
  wire appFull$dD_OUT, appFull$sD_IN, appFull$sEN;
  // ports of submodule dbg_cpt_first_edge_cnt
  wire [39 : 0] dbg_cpt_first_edge_cnt$dD_OUT, dbg_cpt_first_edge_cnt$sD_IN;
  wire dbg_cpt_first_edge_cnt$sEN;
  // ports of submodule dbg_cpt_second_edge_cnt
  wire [39 : 0] dbg_cpt_second_edge_cnt$dD_OUT, dbg_cpt_second_edge_cnt$sD_IN;
  wire dbg_cpt_second_edge_cnt$sEN;
  // ports of submodule dbg_cpt_tap_cnt
  wire [39 : 0] dbg_cpt_tap_cnt$dD_OUT, dbg_cpt_tap_cnt$sD_IN;
  wire dbg_cpt_tap_cnt$sEN;
  // ports of submodule dbg_dq_tap_cnt
  wire [39 : 0] dbg_dq_tap_cnt$dD_OUT, dbg_dq_tap_cnt$sD_IN;
  wire dbg_dq_tap_cnt$sEN;
  // ports of submodule dbg_dqs_n_tap_cnt
  wire [39 : 0] dbg_dqs_n_tap_cnt$dD_OUT, dbg_dqs_n_tap_cnt$sD_IN;
  wire dbg_dqs_n_tap_cnt$sEN;
  // ports of submodule dbg_dqs_p_tap_cnt
  wire [39 : 0] dbg_dqs_p_tap_cnt$dD_OUT, dbg_dqs_p_tap_cnt$sD_IN;
  wire dbg_dqs_p_tap_cnt$sEN;
  // ports of submodule dbg_rd_active_dly
  wire [4 : 0] dbg_rd_active_dly$dD_OUT, dbg_rd_active_dly$sD_IN;
  wire dbg_rd_active_dly$sEN;
  // ports of submodule dbg_rd_bitslip_cnt
  wire [23 : 0] dbg_rd_bitslip_cnt$dD_OUT, dbg_rd_bitslip_cnt$sD_IN;
  wire dbg_rd_bitslip_cnt$sEN;
  // ports of submodule dbg_rd_clkdly_cnt
  wire [15 : 0] dbg_rd_clkdly_cnt$dD_OUT, dbg_rd_clkdly_cnt$sD_IN;
  wire dbg_rd_clkdly_cnt$sEN;
  // ports of submodule dbg_rddata
  wire [31 : 0] dbg_rddata$dD_OUT, dbg_rddata$sD_IN;
  wire dbg_rddata$sEN;
  // ports of submodule dbg_rdlvl_done
  wire [1 : 0] dbg_rdlvl_done$dD_OUT, dbg_rdlvl_done$sD_IN;
  wire dbg_rdlvl_done$sEN;
  // ports of submodule dbg_rdlvl_err
  wire [1 : 0] dbg_rdlvl_err$dD_OUT, dbg_rdlvl_err$sD_IN;
  wire dbg_rdlvl_err$sEN;
  // ports of submodule dbg_wl_dqs_inverted
  wire [7 : 0] dbg_wl_dqs_inverted$dD_OUT, dbg_wl_dqs_inverted$sD_IN;
  wire dbg_wl_dqs_inverted$sEN;
  // ports of submodule dbg_wl_odelay_dq_tap_cnt
  wire [39 : 0] dbg_wl_odelay_dq_tap_cnt$dD_OUT,
		dbg_wl_odelay_dq_tap_cnt$sD_IN;
  wire dbg_wl_odelay_dq_tap_cnt$sEN;
  // ports of submodule dbg_wl_odelay_dqs_tap_cnt
  wire [39 : 0] dbg_wl_odelay_dqs_tap_cnt$dD_OUT,
		dbg_wl_odelay_dqs_tap_cnt$sD_IN;
  wire dbg_wl_odelay_dqs_tap_cnt$sEN;
  // ports of submodule dbg_wr_calib_clk_delay
  wire [15 : 0] dbg_wr_calib_clk_delay$dD_OUT, dbg_wr_calib_clk_delay$sD_IN;
  wire dbg_wr_calib_clk_delay$sEN;
  // ports of submodule firBeat
  wire firBeat$dD_OUT, firBeat$sD_IN, firBeat$sEN;
  // ports of submodule initComplete
  wire initComplete$dD_OUT, initComplete$sD_IN, initComplete$sEN;
  // ports of submodule lreqF
  reg [176 : 0] lreqF$sD_IN;
  wire [176 : 0] lreqF$dD_OUT;
  wire lreqF$dDEQ, lreqF$dEMPTY_N, lreqF$sENQ, lreqF$sFULL_N;
  // ports of submodule lrespF
  wire [127 : 0] lrespF$dD_OUT, lrespF$sD_IN;
  wire lrespF$dDEQ, lrespF$dEMPTY_N, lrespF$sENQ, lrespF$sFULL_N;
  // ports of submodule memIsResetCC
  wire memIsResetCC$dD_OUT, memIsResetCC$sD_IN, memIsResetCC$sEN;
  // ports of submodule memc_mem_rst_p
  wire memc_mem_rst_p$OUT_RST;
  // ports of submodule memc_memc
  wire [255 : 0] memc_memc$app_rd_data, memc_memc$app_wdf_data;
  wire [63 : 0] memc_memc$ddr3_dq;
  wire [32 : 0] memc_memc$app_addr;
  wire [31 : 0] memc_memc$app_wdf_mask;
  wire [12 : 0] memc_memc$ddr3_addr;
  wire [7 : 0] memc_memc$ddr3_dm, memc_memc$ddr3_dqs_n, memc_memc$ddr3_dqs_p;
  wire [2 : 0] memc_memc$app_cmd, memc_memc$ddr3_ba;
  wire memc_memc$app_en,
       memc_memc$app_rd_data_end,
       memc_memc$app_rd_data_valid,
       memc_memc$app_rdy,
       memc_memc$app_wdf_end,
       memc_memc$app_wdf_rdy,
       memc_memc$app_wdf_wren,
       memc_memc$ddr3_cas_n,
       memc_memc$ddr3_ck_n,
       memc_memc$ddr3_ck_p,
       memc_memc$ddr3_cke,
       memc_memc$ddr3_cs_n,
       memc_memc$ddr3_odt,
       memc_memc$ddr3_ras_n,
       memc_memc$ddr3_reset_n,
       memc_memc$ddr3_we_n,
       memc_memc$init_calib_complete,
       memc_memc$tb_clk,
       memc_memc$tb_rst_n;
  // ports of submodule memc_rdpF
  wire [1 : 0] memc_rdpF$D_IN, memc_rdpF$D_OUT;
  wire memc_rdpF$CLR,
       memc_rdpF$DEQ,
       memc_rdpF$EMPTY_N,
       memc_rdpF$ENQ,
       memc_rdpF$FULL_N;
  // ports of submodule memc_reqF
  wire [176 : 0] memc_reqF$D_IN, memc_reqF$D_OUT;
  wire memc_reqF$CLR,
       memc_reqF$DEQ,
       memc_reqF$EMPTY_N,
       memc_reqF$ENQ,
       memc_reqF$FULL_N;
  // ports of submodule memc_respF
  reg [127 : 0] memc_respF$D_IN;
  wire [127 : 0] memc_respF$D_OUT;
  wire memc_respF$CLR,
       memc_respF$DEQ,
       memc_respF$EMPTY_N,
       memc_respF$ENQ,
       memc_respF$FULL_N;
  // ports of submodule memc_rst_p
  wire memc_rst_p$RESET_OUT;
  // ports of submodule requestCount
  wire [15 : 0] requestCount$dD_OUT, requestCount$sD_IN;
  wire requestCount$sEN;
  // ports of submodule responseCount
  wire [15 : 0] responseCount$sD_IN;
  wire responseCount$sEN;
  // ports of submodule secBeat
  wire secBeat$dD_OUT, secBeat$sD_IN, secBeat$sEN;
  // ports of submodule splaF
  wire [1 : 0] splaF$D_IN, splaF$D_OUT;
  wire splaF$CLR, splaF$DEQ, splaF$EMPTY_N, splaF$ENQ, splaF$FULL_N;
  // ports of submodule wci_wslv_reqF
  wire [71 : 0] wci_wslv_reqF$D_IN, wci_wslv_reqF$D_OUT;
  wire wci_wslv_reqF$CLR,
       wci_wslv_reqF$DEQ,
       wci_wslv_reqF$EMPTY_N,
       wci_wslv_reqF$ENQ;
  // ports of submodule wdfFull
  wire wdfFull$dD_OUT, wdfFull$sD_IN, wdfFull$sEN;
  // ports of submodule wmemi_dhF
  wire [145 : 0] wmemi_dhF$D_IN, wmemi_dhF$D_OUT;
  wire wmemi_dhF$CLR,
       wmemi_dhF$DEQ,
       wmemi_dhF$EMPTY_N,
       wmemi_dhF$ENQ,
       wmemi_dhF$FULL_N;
  // ports of submodule wmemi_reqF
  wire [51 : 0] wmemi_reqF$D_IN, wmemi_reqF$D_OUT;
  wire wmemi_reqF$CLR,
       wmemi_reqF$DEQ,
       wmemi_reqF$EMPTY_N,
       wmemi_reqF$ENQ,
       wmemi_reqF$FULL_N;
  // rule scheduling signals
  wire WILL_FIRE_RL_advance_response,
       WILL_FIRE_RL_getRequest,
       WILL_FIRE_RL_memc_advance_readData,
       WILL_FIRE_RL_memc_advance_request,
       WILL_FIRE_RL_memc_advance_write0,
       WILL_FIRE_RL_memc_advance_write1,
       WILL_FIRE_RL_wci_cfrd,
       WILL_FIRE_RL_wci_cfwr,
       WILL_FIRE_RL_wci_ctrl_EiI,
       WILL_FIRE_RL_wci_ctrl_IsO,
       WILL_FIRE_RL_wci_ctrl_OrE,
       WILL_FIRE_RL_wci_wslv_ctl_op_complete,
       WILL_FIRE_RL_wci_wslv_ctl_op_start,
       WILL_FIRE_RL_wci_wslv_respF_both,
       WILL_FIRE_RL_wci_wslv_respF_decCtr,
       WILL_FIRE_RL_wci_wslv_respF_incCtr,
       WILL_FIRE_RL_wmemi_respF_both,
       WILL_FIRE_RL_wmemi_respF_decCtr,
       WILL_FIRE_RL_wmemi_respF_incCtr;
  // inputs to muxes for submodule ports
  reg [33 : 0] MUX_wci_wslv_respF_q_0$write_1__VAL_1;
  wire [176 : 0] MUX_lreqF$enq_1__VAL_1,
		 MUX_lreqF$enq_1__VAL_2,
		 MUX_lreqF$enq_1__VAL_3;
  wire [130 : 0] MUX_wmemi_respF_q_0$write_1__VAL_1,
		 MUX_wmemi_respF_q_0$write_1__VAL_2,
		 MUX_wmemi_respF_q_1$write_1__VAL_2;
  wire [33 : 0] MUX_wci_wslv_respF_q_0$write_1__VAL_2,
		MUX_wci_wslv_respF_q_1$write_1__VAL_2,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_1,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_2,
		MUX_wci_wslv_respF_x_wire$wset_1__VAL_3;
  wire [7 : 0] MUX_wmemiReadInFlight_value$write_1__VAL_2;
  wire [1 : 0] MUX_wci_wslv_respF_c_r$write_1__VAL_1,
	       MUX_wci_wslv_respF_c_r$write_1__VAL_2,
	       MUX_wmemi_respF_c_r$write_1__VAL_1,
	       MUX_wmemi_respF_c_r$write_1__VAL_2;
  wire MUX_lreqF$enq_1__SEL_1,
       MUX_lreqF$enq_1__SEL_2,
       MUX_lreqF$enq_1__SEL_3,
       MUX_memc_firstBeat$write_1__SEL_1,
       MUX_memc_secondBeat$write_1__SEL_1,
       MUX_rdReg$write_1__SEL_1,
       MUX_rdReg_1$write_1__SEL_1,
       MUX_rdReg_2$write_1__SEL_1,
       MUX_rdReg_3$write_1__SEL_1,
       MUX_splitReadInFlight$write_1__SEL_1,
       MUX_wci_wslv_illegalEdge$write_1__SEL_1,
       MUX_wci_wslv_illegalEdge$write_1__SEL_2,
       MUX_wci_wslv_illegalEdge$write_1__VAL_2,
       MUX_wci_wslv_respF_q_0$write_1__SEL_1,
       MUX_wci_wslv_respF_q_1$write_1__SEL_1,
       MUX_wci_wslv_respF_x_wire$wset_1__SEL_2,
       MUX_wmemi_respF_q_0$write_1__SEL_1,
       MUX_wmemi_respF_q_1$write_1__SEL_1;
  // remaining internal signals
  reg [63 : 0] v__h18461, v__h3715, v__h3890, v__h4034;
  reg [31 : 0] CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1,
	       g_data__h14180,
	       x__h5897,
	       x__h6118;
  reg CASE_x367_NOT_x367_EQ_0b11_OR_memc_respFFULL__ETC__q2;
  wire [175 : 0] IF_wci_wslv_reqF_first__5_BIT_51_00_THEN_pReg__ETC___d451;
  wire [127 : 0] x1_data__h15430, x1_data__h16431;
  wire [31 : 0] dramStatus__h12803,
		g_data__h17955,
		myBE__h5934,
		myBE__h5967,
		rdat___1__h18018,
		rdat___1__h18029,
		rdat___1__h18040,
		rdat___1__h18051,
		rdat___1__h18062,
		rdat___1__h18073,
		rdat___1__h18084,
		rdat___1__h18095,
		rdat___1__h18106,
		rdat___1__h18117,
		rdat___1__h18128,
		rdat___1__h18139,
		rdat___1__h18150,
		rdat___1__h18161,
		rdat___1__h18172,
		rdat___1__h18183,
		rdat___1__h18190,
		rdat___1__h18201,
		rdat___1__h18211,
		rdat___1__h18221,
		rdat___1__h18235,
		rdat___1__h18249,
		rdat___1__h18263,
		rdat___1__h18277,
		rdat___1__h18292,
		rdat___1__h18307,
		rdat___1__h18322,
		x1_addr__h16429;
  wire [15 : 0] x1_be__h16430, x__h17995;
  wire [2 : 0] x__h6367;
  wire IF_memc_memc_app_rd_data_end__11_CONCAT_memc_r_ETC___d227,
       IF_wci_wslv_reqF_first__5_BIT_51_00_THEN_lreqF_ETC___d476,
       IF_wmemi_reqF_first__26_BITS_51_TO_49_27_EQ_1__ETC___d335,
       lrespF_RDY_first__61_AND_NOT_splitReadInFlight_ETC___d379,
       lrespF_RDY_first__61_AND_NOT_wmemi_respF_c_r_4_ETC___d363,
       wci_wslv_reqF_i_notEmpty__4_AND_IF_wci_wslv_re_ETC___d412,
       wmemiReadInFlight_value_05_SLT_16___d680,
       x1__h12497;
  // value method wciS0_sResp
  assign wciS0_SResp = wci_wslv_respF_q_0[33:32] ;
  // value method wciS0_sData
  assign wciS0_SData = wci_wslv_respF_q_0[31:0] ;
  // value method wciS0_sThreadBusy
  assign wciS0_SThreadBusy =
	     wci_wslv_reqF_countReg > 2'd1 || wci_wslv_isReset_isInReset ;
  // value method wciS0_sFlag
  assign wciS0_SFlag = { 1'd1, wci_wslv_sFlagReg } ;
  // value method wmemiS0_sResp
  assign wmemiS0_SResp = wmemi_respF_q_0[130:129] ;
  // value method wmemiS0_sRespLast
  assign wmemiS0_SRespLast = wmemi_respF_q_0[128] ;
  // value method wmemiS0_sData
  assign wmemiS0_SData = wmemi_respF_q_0[127:0] ;
  // value method wmemiS0_sCmdAccept
  assign wmemiS0_SCmdAccept = wmemi_cmdAccept_w$whas ;
  // value method wmemiS0_sDataAccept
  assign wmemiS0_SDataAccept = wmemi_dhAccept_w$whas ;
  // value method dram_addr
  assign dram_addr = memc_memc$ddr3_addr ;
  // value method dram_ba
  assign dram_ba = memc_memc$ddr3_ba ;
  // value method dram_ras_n
  assign dram_ras_n = memc_memc$ddr3_ras_n ;
  // value method dram_cas_n
  assign dram_cas_n = memc_memc$ddr3_cas_n ;
  // value method dram_we_n
  assign dram_we_n = memc_memc$ddr3_we_n ;
  // value method dram_reset_n
  assign dram_reset_n = memc_memc$ddr3_reset_n ;
  // value method dram_cs_n
  assign dram_cs_n = memc_memc$ddr3_cs_n ;
  // value method dram_odt
  assign dram_odt = memc_memc$ddr3_odt ;
  // value method dram_cke
  assign dram_cke = memc_memc$ddr3_cke ;
  // value method dram_dm
  assign dram_dm = memc_memc$ddr3_dm ;
  // value method dram_ck_p
  assign dram_ck_p = memc_memc$ddr3_ck_p ;
  // value method dram_ck_n
  assign dram_ck_n = memc_memc$ddr3_ck_n ;
  // submodule appFull
  SyncBit #(.init(1'd0)) appFull(.sCLK(memc_memc$tb_clk),
				 .dCLK(wciS0_Clk),
				 .sRST(memc_memc$tb_rst_n),
				 .sD_IN(appFull$sD_IN),
				 .sEN(appFull$sEN),
				 .dD_OUT(appFull$dD_OUT));
  // submodule dbg_cpt_first_edge_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_cpt_first_edge_cnt(.sCLK(memc_memc$tb_clk),
						      .dCLK(wciS0_Clk),
						      .sRST(memc_memc$tb_rst_n),
						      .sD_IN(dbg_cpt_first_edge_cnt$sD_IN),
						      .sEN(dbg_cpt_first_edge_cnt$sEN),
						      .dD_OUT(dbg_cpt_first_edge_cnt$dD_OUT),
						      .sRDY());
  // submodule dbg_cpt_second_edge_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_cpt_second_edge_cnt(.sCLK(memc_memc$tb_clk),
						       .dCLK(wciS0_Clk),
						       .sRST(memc_memc$tb_rst_n),
						       .sD_IN(dbg_cpt_second_edge_cnt$sD_IN),
						       .sEN(dbg_cpt_second_edge_cnt$sEN),
						       .dD_OUT(dbg_cpt_second_edge_cnt$dD_OUT),
						       .sRDY());
  // submodule dbg_cpt_tap_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_cpt_tap_cnt(.sCLK(memc_memc$tb_clk),
					       .dCLK(wciS0_Clk),
					       .sRST(memc_memc$tb_rst_n),
					       .sD_IN(dbg_cpt_tap_cnt$sD_IN),
					       .sEN(dbg_cpt_tap_cnt$sEN),
					       .dD_OUT(dbg_cpt_tap_cnt$dD_OUT),
					       .sRDY());
  // submodule dbg_dq_tap_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_dq_tap_cnt(.sCLK(memc_memc$tb_clk),
					      .dCLK(wciS0_Clk),
					      .sRST(memc_memc$tb_rst_n),
					      .sD_IN(dbg_dq_tap_cnt$sD_IN),
					      .sEN(dbg_dq_tap_cnt$sEN),
					      .dD_OUT(dbg_dq_tap_cnt$dD_OUT),
					      .sRDY());
  // submodule dbg_dqs_n_tap_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_dqs_n_tap_cnt(.sCLK(memc_memc$tb_clk),
						 .dCLK(wciS0_Clk),
						 .sRST(memc_memc$tb_rst_n),
						 .sD_IN(dbg_dqs_n_tap_cnt$sD_IN),
						 .sEN(dbg_dqs_n_tap_cnt$sEN),
						 .dD_OUT(dbg_dqs_n_tap_cnt$dD_OUT),
						 .sRDY());
  // submodule dbg_dqs_p_tap_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_dqs_p_tap_cnt(.sCLK(memc_memc$tb_clk),
						 .dCLK(wciS0_Clk),
						 .sRST(memc_memc$tb_rst_n),
						 .sD_IN(dbg_dqs_p_tap_cnt$sD_IN),
						 .sEN(dbg_dqs_p_tap_cnt$sEN),
						 .dD_OUT(dbg_dqs_p_tap_cnt$dD_OUT),
						 .sRDY());
  // submodule dbg_rd_active_dly
  SyncRegister #(.width(32'd5),
		 .init(5'd0)) dbg_rd_active_dly(.sCLK(memc_memc$tb_clk),
						.dCLK(wciS0_Clk),
						.sRST(memc_memc$tb_rst_n),
						.sD_IN(dbg_rd_active_dly$sD_IN),
						.sEN(dbg_rd_active_dly$sEN),
						.dD_OUT(dbg_rd_active_dly$dD_OUT),
						.sRDY());
  // submodule dbg_rd_bitslip_cnt
  SyncRegister #(.width(32'd24),
		 .init(24'd0)) dbg_rd_bitslip_cnt(.sCLK(memc_memc$tb_clk),
						  .dCLK(wciS0_Clk),
						  .sRST(memc_memc$tb_rst_n),
						  .sD_IN(dbg_rd_bitslip_cnt$sD_IN),
						  .sEN(dbg_rd_bitslip_cnt$sEN),
						  .dD_OUT(dbg_rd_bitslip_cnt$dD_OUT),
						  .sRDY());
  // submodule dbg_rd_clkdly_cnt
  SyncRegister #(.width(32'd16),
		 .init(16'd0)) dbg_rd_clkdly_cnt(.sCLK(memc_memc$tb_clk),
						 .dCLK(wciS0_Clk),
						 .sRST(memc_memc$tb_rst_n),
						 .sD_IN(dbg_rd_clkdly_cnt$sD_IN),
						 .sEN(dbg_rd_clkdly_cnt$sEN),
						 .dD_OUT(dbg_rd_clkdly_cnt$dD_OUT),
						 .sRDY());
  // submodule dbg_rddata
  SyncRegister #(.width(32'd32),
		 .init(32'd0)) dbg_rddata(.sCLK(memc_memc$tb_clk),
					  .dCLK(wciS0_Clk),
					  .sRST(memc_memc$tb_rst_n),
					  .sD_IN(dbg_rddata$sD_IN),
					  .sEN(dbg_rddata$sEN),
					  .dD_OUT(dbg_rddata$dD_OUT),
					  .sRDY());
  // submodule dbg_rdlvl_done
  SyncRegister #(.width(32'd2),
		 .init(2'd0)) dbg_rdlvl_done(.sCLK(memc_memc$tb_clk),
					     .dCLK(wciS0_Clk),
					     .sRST(memc_memc$tb_rst_n),
					     .sD_IN(dbg_rdlvl_done$sD_IN),
					     .sEN(dbg_rdlvl_done$sEN),
					     .dD_OUT(dbg_rdlvl_done$dD_OUT),
					     .sRDY());
  // submodule dbg_rdlvl_err
  SyncRegister #(.width(32'd2),
		 .init(2'd0)) dbg_rdlvl_err(.sCLK(memc_memc$tb_clk),
					    .dCLK(wciS0_Clk),
					    .sRST(memc_memc$tb_rst_n),
					    .sD_IN(dbg_rdlvl_err$sD_IN),
					    .sEN(dbg_rdlvl_err$sEN),
					    .dD_OUT(dbg_rdlvl_err$dD_OUT),
					    .sRDY());
  // submodule dbg_wl_dqs_inverted
  SyncRegister #(.width(32'd8),
		 .init(8'd0)) dbg_wl_dqs_inverted(.sCLK(memc_memc$tb_clk),
						  .dCLK(wciS0_Clk),
						  .sRST(memc_memc$tb_rst_n),
						  .sD_IN(dbg_wl_dqs_inverted$sD_IN),
						  .sEN(dbg_wl_dqs_inverted$sEN),
						  .dD_OUT(dbg_wl_dqs_inverted$dD_OUT),
						  .sRDY());
  // submodule dbg_wl_odelay_dq_tap_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_wl_odelay_dq_tap_cnt(.sCLK(memc_memc$tb_clk),
							.dCLK(wciS0_Clk),
							.sRST(memc_memc$tb_rst_n),
							.sD_IN(dbg_wl_odelay_dq_tap_cnt$sD_IN),
							.sEN(dbg_wl_odelay_dq_tap_cnt$sEN),
							.dD_OUT(dbg_wl_odelay_dq_tap_cnt$dD_OUT),
							.sRDY());
  // submodule dbg_wl_odelay_dqs_tap_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_wl_odelay_dqs_tap_cnt(.sCLK(memc_memc$tb_clk),
							 .dCLK(wciS0_Clk),
							 .sRST(memc_memc$tb_rst_n),
							 .sD_IN(dbg_wl_odelay_dqs_tap_cnt$sD_IN),
							 .sEN(dbg_wl_odelay_dqs_tap_cnt$sEN),
							 .dD_OUT(dbg_wl_odelay_dqs_tap_cnt$dD_OUT),
							 .sRDY());
  // submodule dbg_wr_calib_clk_delay
  SyncRegister #(.width(32'd16),
		 .init(16'd0)) dbg_wr_calib_clk_delay(.sCLK(memc_memc$tb_clk),
						      .dCLK(wciS0_Clk),
						      .sRST(memc_memc$tb_rst_n),
						      .sD_IN(dbg_wr_calib_clk_delay$sD_IN),
						      .sEN(dbg_wr_calib_clk_delay$sEN),
						      .dD_OUT(dbg_wr_calib_clk_delay$dD_OUT),
						      .sRDY());
  // submodule firBeat
  SyncBit #(.init(1'd0)) firBeat(.sCLK(memc_memc$tb_clk),
				 .dCLK(wciS0_Clk),
				 .sRST(memc_memc$tb_rst_n),
				 .sD_IN(firBeat$sD_IN),
				 .sEN(firBeat$sEN),
				 .dD_OUT(firBeat$dD_OUT));
  // submodule initComplete
  SyncBit #(.init(1'd0)) initComplete(.sCLK(memc_memc$tb_clk),
				      .dCLK(wciS0_Clk),
				      .sRST(memc_memc$tb_rst_n),
				      .sD_IN(initComplete$sD_IN),
				      .sEN(initComplete$sEN),
				      .dD_OUT(initComplete$dD_OUT));
  // submodule lreqF
  SyncFIFO #(.dataWidth(32'd177),
	     .depth(32'd2),
	     .indxWidth(32'd1)) lreqF(.sCLK(wciS0_Clk),
				      .dCLK(memc_memc$tb_clk),
				      .sRST(wciS0_MReset_n),
				      .sD_IN(lreqF$sD_IN),
				      .sENQ(lreqF$sENQ),
				      .dDEQ(lreqF$dDEQ),
				      .dD_OUT(lreqF$dD_OUT),
				      .sFULL_N(lreqF$sFULL_N),
				      .dEMPTY_N(lreqF$dEMPTY_N));
  // submodule lrespF
  SyncFIFO #(.dataWidth(32'd128),
	     .depth(32'd2),
	     .indxWidth(32'd1)) lrespF(.sCLK(memc_memc$tb_clk),
				       .dCLK(wciS0_Clk),
				       .sRST(memc_memc$tb_rst_n),
				       .sD_IN(lrespF$sD_IN),
				       .sENQ(lrespF$sENQ),
				       .dDEQ(lrespF$dDEQ),
				       .dD_OUT(lrespF$dD_OUT),
				       .sFULL_N(lrespF$sFULL_N),
				       .dEMPTY_N(lrespF$dEMPTY_N));
  // submodule memIsResetCC
  SyncBit #(.init(1'd0)) memIsResetCC(.sCLK(memc_memc$tb_clk),
				      .dCLK(wciS0_Clk),
				      .sRST(memc_memc$tb_rst_n),
				      .sD_IN(memIsResetCC$sD_IN),
				      .sEN(memIsResetCC$sEN),
				      .dD_OUT(memIsResetCC$dD_OUT));
  // submodule memc_mem_rst_p
  SyncResetA #(.RSTDELAY(32'd15)) memc_mem_rst_p(.CLK(CLK_sys0_clk),
						 .IN_RST(memc_rst_p$RESET_OUT),
						 .OUT_RST(memc_mem_rst_p$OUT_RST));
  // submodule memc_memc
  mig_7series_v1_2 memc_memc(.sys_rst(memc_mem_rst_p$OUT_RST),
			     .clk_sys(CLK_sys0_clk),
			     .app_addr(memc_memc$app_addr),
			     .app_cmd(memc_memc$app_cmd),
			     .app_wdf_data(memc_memc$app_wdf_data),
			     .app_wdf_end(memc_memc$app_wdf_end),
			     .app_wdf_mask(memc_memc$app_wdf_mask),
			     .app_en(memc_memc$app_en),
			     .app_wdf_wren(memc_memc$app_wdf_wren),
			     .app_rdy(memc_memc$app_rdy),
			     .app_wdf_rdy(memc_memc$app_wdf_rdy),
			     .app_rd_data(memc_memc$app_rd_data),
			     .app_rd_data_end(memc_memc$app_rd_data_end),
			     .app_rd_data_valid(memc_memc$app_rd_data_valid),
			     .init_calib_complete(memc_memc$init_calib_complete),
			     .ddr3_addr(memc_memc$ddr3_addr),
			     .ddr3_ba(memc_memc$ddr3_ba),
			     .ddr3_ras_n(memc_memc$ddr3_ras_n),
			     .ddr3_cas_n(memc_memc$ddr3_cas_n),
			     .ddr3_we_n(memc_memc$ddr3_we_n),
			     .ddr3_reset_n(memc_memc$ddr3_reset_n),
			     .ddr3_cs_n(memc_memc$ddr3_cs_n),
			     .ddr3_odt(memc_memc$ddr3_odt),
			     .ddr3_cke(memc_memc$ddr3_cke),
			     .ddr3_dm(memc_memc$ddr3_dm),
			     .ddr3_ck_p(memc_memc$ddr3_ck_p),
			     .ddr3_ck_n(memc_memc$ddr3_ck_n),
			     .tb_clk(memc_memc$tb_clk),
			     .tb_rst_n(memc_memc$tb_rst_n),
			     .ddr3_dq(dram_io_dq),
			     .ddr3_dqs_p(dram_io_dqs_p),
			     .ddr3_dqs_n(dram_io_dqs_n));
  // submodule memc_rdpF
  arSRLFIFOD #(.width(32'd2),
	       .l2depth(32'd4)) memc_rdpF(.CLK(memc_memc$tb_clk),
					  .RST_N(memc_memc$tb_rst_n),
					  .D_IN(memc_rdpF$D_IN),
					  .ENQ(memc_rdpF$ENQ),
					  .DEQ(memc_rdpF$DEQ),
					  .CLR(memc_rdpF$CLR),
					  .D_OUT(memc_rdpF$D_OUT),
					  .FULL_N(memc_rdpF$FULL_N),
					  .EMPTY_N(memc_rdpF$EMPTY_N));
  // submodule memc_reqF
  FIFO2 #(.width(32'd177),
	  .guarded(32'd1)) memc_reqF(.RST(memc_memc$tb_rst_n),
				     .CLK(memc_memc$tb_clk),
				     .D_IN(memc_reqF$D_IN),
				     .ENQ(memc_reqF$ENQ),
				     .DEQ(memc_reqF$DEQ),
				     .CLR(memc_reqF$CLR),
				     .D_OUT(memc_reqF$D_OUT),
				     .FULL_N(memc_reqF$FULL_N),
				     .EMPTY_N(memc_reqF$EMPTY_N));
  // submodule memc_respF
  FIFO2 #(.width(32'd128),
	  .guarded(32'd1)) memc_respF(.RST(memc_memc$tb_rst_n),
				      .CLK(memc_memc$tb_clk),
				      .D_IN(memc_respF$D_IN),
				      .ENQ(memc_respF$ENQ),
				      .DEQ(memc_respF$DEQ),
				      .CLR(memc_respF$CLR),
				      .D_OUT(memc_respF$D_OUT),
				      .FULL_N(memc_respF$FULL_N),
				      .EMPTY_N(memc_respF$EMPTY_N));
  // submodule memc_rst_p
  ResetInverter memc_rst_p(.RESET_IN(wciS0_MReset_n),
			   .RESET_OUT(memc_rst_p$RESET_OUT));
  // submodule requestCount
  SyncRegister #(.width(32'd16),
		 .init(16'd0)) requestCount(.sCLK(memc_memc$tb_clk),
					    .dCLK(wciS0_Clk),
					    .sRST(memc_memc$tb_rst_n),
					    .sD_IN(requestCount$sD_IN),
					    .sEN(requestCount$sEN),
					    .dD_OUT(requestCount$dD_OUT),
					    .sRDY());
  // submodule responseCount
  SyncRegister #(.width(32'd16),
		 .init(16'd0)) responseCount(.sCLK(memc_memc$tb_clk),
					     .dCLK(wciS0_Clk),
					     .sRST(memc_memc$tb_rst_n),
					     .sD_IN(responseCount$sD_IN),
					     .sEN(responseCount$sEN),
					     .dD_OUT(),
					     .sRDY());
  // submodule secBeat
  SyncBit #(.init(1'd0)) secBeat(.sCLK(memc_memc$tb_clk),
				 .dCLK(wciS0_Clk),
				 .sRST(memc_memc$tb_rst_n),
				 .sD_IN(secBeat$sD_IN),
				 .sEN(secBeat$sEN),
				 .dD_OUT(secBeat$dD_OUT));
  // submodule splaF
  arSRLFIFOD #(.width(32'd2), .l2depth(32'd4)) splaF(.CLK(wciS0_Clk),
						     .RST_N(wciS0_MReset_n),
						     .D_IN(splaF$D_IN),
						     .ENQ(splaF$ENQ),
						     .DEQ(splaF$DEQ),
						     .CLR(splaF$CLR),
						     .D_OUT(splaF$D_OUT),
						     .FULL_N(splaF$FULL_N),
						     .EMPTY_N(splaF$EMPTY_N));
  // submodule wci_wslv_reqF
  SizedFIFO #(.p1width(32'd72),
	      .p2depth(32'd3),
	      .p3cntr_width(32'd1),
	      .guarded(32'd1)) wci_wslv_reqF(.RST(wciS0_MReset_n),
					     .CLK(wciS0_Clk),
					     .D_IN(wci_wslv_reqF$D_IN),
					     .ENQ(wci_wslv_reqF$ENQ),
					     .DEQ(wci_wslv_reqF$DEQ),
					     .CLR(wci_wslv_reqF$CLR),
					     .D_OUT(wci_wslv_reqF$D_OUT),
					     .FULL_N(),
					     .EMPTY_N(wci_wslv_reqF$EMPTY_N));
  // submodule wdfFull
  SyncBit #(.init(1'd0)) wdfFull(.sCLK(memc_memc$tb_clk),
				 .dCLK(wciS0_Clk),
				 .sRST(memc_memc$tb_rst_n),
				 .sD_IN(wdfFull$sD_IN),
				 .sEN(wdfFull$sEN),
				 .dD_OUT(wdfFull$dD_OUT));
  // submodule wmemi_dhF
  FIFO2 #(.width(32'd146), .guarded(32'd1)) wmemi_dhF(.RST(wciS0_MReset_n),
						      .CLK(wciS0_Clk),
						      .D_IN(wmemi_dhF$D_IN),
						      .ENQ(wmemi_dhF$ENQ),
						      .DEQ(wmemi_dhF$DEQ),
						      .CLR(wmemi_dhF$CLR),
						      .D_OUT(wmemi_dhF$D_OUT),
						      .FULL_N(wmemi_dhF$FULL_N),
						      .EMPTY_N(wmemi_dhF$EMPTY_N));
  // submodule wmemi_reqF
  FIFO2 #(.width(32'd52), .guarded(32'd1)) wmemi_reqF(.RST(wciS0_MReset_n),
						      .CLK(wciS0_Clk),
						      .D_IN(wmemi_reqF$D_IN),
						      .ENQ(wmemi_reqF$ENQ),
						      .DEQ(wmemi_reqF$DEQ),
						      .CLR(wmemi_reqF$CLR),
						      .D_OUT(wmemi_reqF$D_OUT),
						      .FULL_N(wmemi_reqF$FULL_N),
						      .EMPTY_N(wmemi_reqF$EMPTY_N));
  // rule RL_advance_response
  assign WILL_FIRE_RL_advance_response =
	     lrespF$dEMPTY_N &&
	     lrespF_RDY_first__61_AND_NOT_splitReadInFlight_ETC___d379 &&
	     !wci_wslv_wci_cfwr_pw$whas &&
	     wmemiReadInFlight_value == 8'd0 &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_cfwr
  assign WILL_FIRE_RL_wci_cfwr =
	     wci_wslv_respF_c_r != 2'd2 &&
	     wci_wslv_reqF_i_notEmpty__4_AND_IF_wci_wslv_re_ETC___d412 &&
	     wci_wslv_wci_cfwr_pw$whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_cfrd
  assign WILL_FIRE_RL_wci_cfrd =
	     wci_wslv_reqF$EMPTY_N &&
	     IF_wci_wslv_reqF_first__5_BIT_51_00_THEN_lreqF_ETC___d476 &&
	     wci_wslv_wci_cfrd_pw$whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_wslv_ctl_op_start
  assign WILL_FIRE_RL_wci_wslv_ctl_op_start =
	     wci_wslv_reqF$EMPTY_N && wci_wslv_wci_ctrl_pw$whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_ctrl_EiI
  assign WILL_FIRE_RL_wci_ctrl_EiI =
	     wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd0 &&
	     wci_wslv_reqF$D_OUT[36:34] == 3'd0 ;
  // rule RL_wci_ctrl_OrE
  assign WILL_FIRE_RL_wci_ctrl_OrE =
	     wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd2 &&
	     wci_wslv_reqF$D_OUT[36:34] == 3'd3 ;
  // rule RL_memc_advance_readData
  assign WILL_FIRE_RL_memc_advance_readData =
	     memc_rdpF$EMPTY_N &&
	     IF_memc_memc_app_rd_data_end__11_CONCAT_memc_r_ETC___d227 &&
	     memc_memc$init_calib_complete &&
	     memc_memc$app_rd_data_valid ;
  // rule RL_memc_advance_request
  assign WILL_FIRE_RL_memc_advance_request =
	     memc_reqF$EMPTY_N &&
	     (x1__h12497 || !memc_reqF$D_OUT[176] || memc_rdpF$FULL_N) &&
	     memc_memc$init_calib_complete &&
	     !memc_firstBeat &&
	     !memc_secondBeat ;
  // rule RL_memc_advance_write0
  assign WILL_FIRE_RL_memc_advance_write0 =
	     memc_reqF$EMPTY_N && memc_memc$init_calib_complete &&
	     memc_firstBeat &&
	     !memc_secondBeat ;
  // rule RL_memc_advance_write1
  assign WILL_FIRE_RL_memc_advance_write1 =
	     memc_reqF$EMPTY_N && memc_memc$init_calib_complete &&
	     !memc_firstBeat &&
	     memc_secondBeat ;
  // rule RL_wmemi_respF_incCtr
  assign WILL_FIRE_RL_wmemi_respF_incCtr =
	     ((wmemi_respF_c_r == 2'd0) ?
		wmemi_respF_enqueueing$whas :
		wmemi_respF_c_r != 2'd1 || wmemi_respF_enqueueing$whas) &&
	     wmemi_respF_enqueueing$whas &&
	     !(wmemi_respF_c_r != 2'd0) ;
  // rule RL_wmemi_respF_decCtr
  assign WILL_FIRE_RL_wmemi_respF_decCtr =
	     wmemi_respF_c_r != 2'd0 && !wmemi_respF_enqueueing$whas ;
  // rule RL_wmemi_respF_both
  assign WILL_FIRE_RL_wmemi_respF_both =
	     ((wmemi_respF_c_r == 2'd1) ?
		wmemi_respF_enqueueing$whas :
		wmemi_respF_c_r != 2'd2 || wmemi_respF_enqueueing$whas) &&
	     wmemi_respF_c_r != 2'd0 &&
	     wmemi_respF_enqueueing$whas ;
  // rule RL_getRequest
  assign WILL_FIRE_RL_getRequest =
	     wmemi_operateD && wmemi_peerIsReady && wmemi_reqF$EMPTY_N &&
	     IF_wmemi_reqF_first__26_BITS_51_TO_49_27_EQ_1__ETC___d335 &&
	     !wci_wslv_wci_cfwr_pw$whas &&
	     !wci_wslv_wci_cfrd_pw$whas ;
  // rule RL_wci_ctrl_IsO
  assign WILL_FIRE_RL_wci_ctrl_IsO =
	     wci_wslv_wci_ctrl_pw$whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd1 &&
	     wci_wslv_reqF$D_OUT[36:34] == 3'd1 ;
  // rule RL_wci_wslv_ctl_op_complete
  assign WILL_FIRE_RL_wci_wslv_ctl_op_complete =
	     wci_wslv_respF_c_r != 2'd2 && wci_wslv_ctlOpActive &&
	     wci_wslv_ctlAckReg ;
  // rule RL_wci_wslv_respF_incCtr
  assign WILL_FIRE_RL_wci_wslv_respF_incCtr =
	     ((wci_wslv_respF_c_r == 2'd0) ?
		wci_wslv_respF_x_wire$whas :
		wci_wslv_respF_c_r != 2'd1 || wci_wslv_respF_x_wire$whas) &&
	     wci_wslv_respF_enqueueing$whas &&
	     !(wci_wslv_respF_c_r != 2'd0) ;
  // rule RL_wci_wslv_respF_decCtr
  assign WILL_FIRE_RL_wci_wslv_respF_decCtr =
	     wci_wslv_respF_c_r != 2'd0 && !wci_wslv_respF_enqueueing$whas ;
  // rule RL_wci_wslv_respF_both
  assign WILL_FIRE_RL_wci_wslv_respF_both =
	     ((wci_wslv_respF_c_r == 2'd1) ?
		wci_wslv_respF_x_wire$whas :
		wci_wslv_respF_c_r != 2'd2 || wci_wslv_respF_x_wire$whas) &&
	     wci_wslv_respF_c_r != 2'd0 &&
	     wci_wslv_respF_enqueueing$whas ;
  // inputs to muxes for submodule ports
  assign MUX_lreqF$enq_1__SEL_1 =
	     WILL_FIRE_RL_getRequest &&
	     (wmemi_reqF$D_OUT[51:49] == 3'd1 ||
	      wmemiReadInFlight_value_05_SLT_16___d680) ;
  assign MUX_lreqF$enq_1__SEL_2 =
	     WILL_FIRE_RL_wci_cfwr &&
	     (wci_wslv_reqF$D_OUT[51] ||
	      wci_wslv_reqF$D_OUT[39:32] == 8'h54 ||
	      wci_wslv_reqF$D_OUT[39:32] == 8'h58) ;
  assign MUX_lreqF$enq_1__SEL_3 =
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[51] ;
  assign MUX_memc_firstBeat$write_1__SEL_1 =
	     WILL_FIRE_RL_memc_advance_request && memc_memc$app_rdy &&
	     !memc_reqF$D_OUT[176] ;
  assign MUX_memc_secondBeat$write_1__SEL_1 =
	     WILL_FIRE_RL_memc_advance_write1 && memc_memc$app_wdf_rdy ;
  assign MUX_rdReg$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF$D_OUT[51] &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h80 ;
  assign MUX_rdReg_1$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF$D_OUT[51] &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h84 ;
  assign MUX_rdReg_2$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF$D_OUT[51] &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h88 ;
  assign MUX_rdReg_3$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF$D_OUT[51] &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h8C ;
  assign MUX_splitReadInFlight$write_1__SEL_1 =
	     WILL_FIRE_RL_advance_response && splitReadInFlight ;
  assign MUX_wci_wslv_illegalEdge$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge ;
  assign MUX_wci_wslv_illegalEdge$write_1__SEL_2 =
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     (wci_wslv_reqF$D_OUT[36:34] == 3'd0 && wci_wslv_cState != 3'd0 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd1 && wci_wslv_cState != 3'd1 &&
	      wci_wslv_cState != 3'd3 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd2 && wci_wslv_cState != 3'd2 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd3 && wci_wslv_cState != 3'd3 &&
	      wci_wslv_cState != 3'd2 &&
	      wci_wslv_cState != 3'd1 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd4 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd5 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd6 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd7) ;
  assign MUX_wci_wslv_respF_q_0$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd0 ;
  assign MUX_wci_wslv_respF_q_1$write_1__SEL_1 =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd1 ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__SEL_2 =
	     WILL_FIRE_RL_wci_cfrd && !wci_wslv_reqF$D_OUT[51] ;
  assign MUX_wmemi_respF_q_0$write_1__SEL_1 =
	     WILL_FIRE_RL_wmemi_respF_incCtr && wmemi_respF_c_r == 2'd0 ;
  assign MUX_wmemi_respF_q_1$write_1__SEL_1 =
	     WILL_FIRE_RL_wmemi_respF_incCtr && wmemi_respF_c_r == 2'd1 ;
  assign MUX_lreqF$enq_1__VAL_1 =
	     { wmemi_reqF$D_OUT[51:49] != 3'd1,
	       (wmemi_reqF$D_OUT[51:49] == 3'd1) ?
		 { wmemi_reqF$D_OUT[43:12],
		   wmemi_dhF$D_OUT[15:0],
		   wmemi_dhF$D_OUT[143:16] } :
		 { wmemi_reqF$D_OUT[43:0],
		   132'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA } } ;
  assign MUX_lreqF$enq_1__VAL_2 =
	     { !wci_wslv_reqF$D_OUT[51] &&
	       wci_wslv_reqF$D_OUT[39:32] != 8'h54,
	       IF_wci_wslv_reqF_first__5_BIT_51_00_THEN_pReg__ETC___d451 } ;
  assign MUX_lreqF$enq_1__VAL_3 =
	     { 1'd1,
	       x1_addr__h16429,
	       144'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA } ;
  assign MUX_wci_wslv_illegalEdge$write_1__VAL_2 =
	     wci_wslv_reqF$D_OUT[36:34] != 3'd4 &&
	     wci_wslv_reqF$D_OUT[36:34] != 3'd5 &&
	     wci_wslv_reqF$D_OUT[36:34] != 3'd6 ;
  assign MUX_wci_wslv_respF_c_r$write_1__VAL_1 = wci_wslv_respF_c_r + 2'd1 ;
  assign MUX_wci_wslv_respF_c_r$write_1__VAL_2 = wci_wslv_respF_c_r - 2'd1 ;
  always@(MUX_splitReadInFlight$write_1__SEL_1 or
	  MUX_wci_wslv_respF_x_wire$wset_1__VAL_1 or
	  MUX_wci_wslv_respF_x_wire$wset_1__SEL_2 or
	  MUX_wci_wslv_respF_x_wire$wset_1__VAL_2 or
	  WILL_FIRE_RL_wci_wslv_ctl_op_complete or
	  MUX_wci_wslv_respF_x_wire$wset_1__VAL_3 or WILL_FIRE_RL_wci_cfwr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_splitReadInFlight$write_1__SEL_1:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_1 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_1;
      MUX_wci_wslv_respF_x_wire$wset_1__SEL_2:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_1 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_2;
      WILL_FIRE_RL_wci_wslv_ctl_op_complete:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_1 =
	      MUX_wci_wslv_respF_x_wire$wset_1__VAL_3;
      WILL_FIRE_RL_wci_cfwr:
	  MUX_wci_wslv_respF_q_0$write_1__VAL_1 = 34'h1C0DE4201;
      default: MUX_wci_wslv_respF_q_0$write_1__VAL_1 =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign MUX_wci_wslv_respF_q_0$write_1__VAL_2 =
	     (wci_wslv_respF_c_r == 2'd1) ?
	       MUX_wci_wslv_respF_q_0$write_1__VAL_1 :
	       wci_wslv_respF_q_1 ;
  assign MUX_wci_wslv_respF_q_1$write_1__VAL_2 =
	     (wci_wslv_respF_c_r == 2'd2) ?
	       MUX_wci_wslv_respF_q_0$write_1__VAL_1 :
	       34'h0AAAAAAAA ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__VAL_1 = { 2'd1, g_data__h14180 } ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__VAL_2 = { 2'd1, g_data__h17955 } ;
  assign MUX_wci_wslv_respF_x_wire$wset_1__VAL_3 =
	     wci_wslv_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wmemiReadInFlight_value$write_1__VAL_2 =
	     wmemiReadInFlight_value +
	     (wmemiReadInFlight_acc_v1$whas ? 8'd1 : 8'd0) +
	     (wmemi_respF_enqueueing$whas ? 8'd255 : 8'd0) ;
  assign MUX_wmemi_respF_c_r$write_1__VAL_1 = wmemi_respF_c_r + 2'd1 ;
  assign MUX_wmemi_respF_c_r$write_1__VAL_2 = wmemi_respF_c_r - 2'd1 ;
  assign MUX_wmemi_respF_q_0$write_1__VAL_1 = { 3'd3, lrespF$dD_OUT } ;
  assign MUX_wmemi_respF_q_0$write_1__VAL_2 =
	     (wmemi_respF_c_r == 2'd1) ?
	       MUX_wmemi_respF_q_0$write_1__VAL_1 :
	       wmemi_respF_q_1 ;
  assign MUX_wmemi_respF_q_1$write_1__VAL_2 =
	     (wmemi_respF_c_r == 2'd2) ?
	       MUX_wmemi_respF_q_0$write_1__VAL_1 :
	       131'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ;
  // inlined wires
  assign wci_wslv_wciReq$wget =
	     { wciS0_MCmd,
	       wciS0_MAddrSpace,
	       wciS0_MByteEn,
	       wciS0_MAddr,
	       wciS0_MData } ;
  assign wci_wslv_wciReq$whas = 1'd1 ;
  assign wci_wslv_respF_x_wire$wget = MUX_wci_wslv_respF_q_0$write_1__VAL_1 ;
  assign wci_wslv_respF_x_wire$whas =
	     WILL_FIRE_RL_advance_response && splitReadInFlight ||
	     WILL_FIRE_RL_wci_cfrd && !wci_wslv_reqF$D_OUT[51] ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete ||
	     WILL_FIRE_RL_wci_cfwr ;
  assign wci_wslv_wEdge$wget = wci_wslv_reqF$D_OUT[36:34] ;
  assign wci_wslv_wEdge$whas = WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_sFlagReg_1$wget = 1'b0 ;
  assign wci_wslv_sFlagReg_1$whas = 1'b0 ;
  assign wci_wslv_ctlAckReg_1$wget = 1'd1 ;
  assign wci_wslv_ctlAckReg_1$whas =
	     WILL_FIRE_RL_wci_ctrl_OrE || WILL_FIRE_RL_wci_ctrl_IsO ||
	     WILL_FIRE_RL_wci_ctrl_EiI ;
  assign wci_wci_Es_mCmd_w$wget = wciS0_MCmd ;
  assign wci_wci_Es_mCmd_w$whas = 1'd1 ;
  assign wci_wci_Es_mAddrSpace_w$wget = wciS0_MAddrSpace ;
  assign wci_wci_Es_mAddrSpace_w$whas = 1'd1 ;
  assign wci_wci_Es_mByteEn_w$wget = wciS0_MByteEn ;
  assign wci_wci_Es_mByteEn_w$whas = 1'd1 ;
  assign wci_wci_Es_mAddr_w$wget = wciS0_MAddr ;
  assign wci_wci_Es_mAddr_w$whas = 1'd1 ;
  assign wci_wci_Es_mData_w$wget = wciS0_MData ;
  assign wci_wci_Es_mData_w$whas = 1'd1 ;
  assign memc_wdfWren$wget = 1'd1 ;
  assign memc_wdfWren$whas =
	     WILL_FIRE_RL_memc_advance_write1 ||
	     WILL_FIRE_RL_memc_advance_write0 ;
  assign memc_wdfEnd$wget = 1'd1 ;
  assign memc_wdfEnd$whas = WILL_FIRE_RL_memc_advance_write1 ;
  assign wmemi_wmemiReq$wget =
	     { wmemiS0_MCmd,
	       wmemiS0_MReqLast,
	       wmemiS0_MAddr,
	       wmemiS0_MBurstLength } ;
  assign wmemi_wmemiReq$whas = 1'd1 ;
  assign wmemi_wmemiDh$wget =
	     { wmemiS0_MDataValid,
	       wmemiS0_MDataLast,
	       wmemiS0_MData,
	       wmemiS0_MDataByteEn } ;
  assign wmemi_wmemiDh$whas = 1'd1 ;
  assign wmemi_cmdAccept_w$wget = 1'd1 ;
  assign wmemi_cmdAccept_w$whas =
	     wmemi_reqF$FULL_N && wmemi_operateD && wmemi_peerIsReady &&
	     wmemi_wmemiReq$wget[51:49] != 3'd0 &&
	     wmemi_reqF$FULL_N ;
  assign wmemi_dhAccept_w$wget = 1'd1 ;
  assign wmemi_dhAccept_w$whas =
	     wmemi_dhF$FULL_N && wmemi_operateD && wmemi_peerIsReady &&
	     wmemi_wmemiDh$wget[145] &&
	     wmemi_dhF$FULL_N ;
  assign wmemi_respF_x_wire$wget = MUX_wmemi_respF_q_0$write_1__VAL_1 ;
  assign wmemi_respF_x_wire$whas = wmemi_respF_enqueueing$whas ;
  assign wmemi_operateD_1$wget = 1'd1 ;
  assign wmemi_operateD_1$whas = wci_wslv_cState == 3'd2 ;
  assign wmemi_peerIsReady_1$wget = 1'd1 ;
  assign wmemi_peerIsReady_1$whas = wmemiS0_MReset_n ;
  assign wmemiReadInFlight_acc_v1$wget = 8'd1 ;
  assign wmemiReadInFlight_acc_v1$whas =
	     WILL_FIRE_RL_getRequest && wmemi_reqF$D_OUT[51:49] != 3'd1 &&
	     wmemiReadInFlight_value_05_SLT_16___d680 ;
  assign wmemiReadInFlight_acc_v2$wget = 8'd255 ;
  assign wmemiReadInFlight_acc_v2$whas = wmemi_respF_enqueueing$whas ;
  assign wmemi_Es_mCmd_w$wget = wmemiS0_MCmd ;
  assign wmemi_Es_mCmd_w$whas = 1'd1 ;
  assign wmemi_Es_mAddr_w$wget = wmemiS0_MAddr ;
  assign wmemi_Es_mAddr_w$whas = 1'd1 ;
  assign wmemi_Es_mBurstLength_w$wget = wmemiS0_MBurstLength ;
  assign wmemi_Es_mBurstLength_w$whas = 1'd1 ;
  assign wmemi_Es_mData_w$wget = wmemiS0_MData ;
  assign wmemi_Es_mData_w$whas = 1'd1 ;
  assign wmemi_Es_mDataByteEn_w$wget = wmemiS0_MDataByteEn ;
  assign wmemi_Es_mDataByteEn_w$whas = 1'd1 ;
  assign wci_wslv_reqF_r_enq$whas = wci_wslv_wciReq$wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF_r_deq$whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_reqF_r_clr$whas = 1'b0 ;
  assign wci_wslv_respF_enqueueing$whas =
	     WILL_FIRE_RL_advance_response && splitReadInFlight ||
	     WILL_FIRE_RL_wci_cfrd && !wci_wslv_reqF$D_OUT[51] ||
	     WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  assign wci_wslv_respF_dequeueing$whas = wci_wslv_respF_c_r != 2'd0 ;
  assign wci_wslv_sThreadBusy_pw$whas = 1'b0 ;
  assign wci_wslv_wci_cfwr_pw$whas =
	     wci_wslv_reqF$EMPTY_N && wci_wslv_reqF$D_OUT[68] &&
	     wci_wslv_reqF$D_OUT[71:69] == 3'd1 ;
  assign wci_wslv_wci_cfrd_pw$whas =
	     wci_wslv_reqF$EMPTY_N && wci_wslv_reqF$D_OUT[68] &&
	     wci_wslv_reqF$D_OUT[71:69] == 3'd2 ;
  assign wci_wslv_wci_ctrl_pw$whas =
	     wci_wslv_reqF$EMPTY_N && !wci_wslv_reqF$D_OUT[68] &&
	     wci_wslv_reqF$D_OUT[71:69] == 3'd2 ;
  assign wmemi_respF_enqueueing$whas =
	     lrespF$dEMPTY_N &&
	     lrespF_RDY_first__61_AND_NOT_wmemi_respF_c_r_4_ETC___d363 &&
	     (wmemiReadInFlight_value ^ 8'h80) > 8'd128 ;
  assign wmemi_respF_dequeueing$whas = wmemi_respF_c_r != 2'd0 ;
  assign wmemi_Es_mReqLast_w$whas = wmemiS0_MReqLast ;
  assign wmemi_Es_mDataValid_w$whas = wmemiS0_MDataValid ;
  assign wmemi_Es_mDataLast_w$whas = wmemiS0_MDataLast ;
  // register dbgCtrl
  assign dbgCtrl$D_IN = 32'h0 ;
  assign dbgCtrl$EN = 1'b0 ;
  // register dramCtrl
  assign dramCtrl$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign dramCtrl$EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF$D_OUT[51] &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h04 ;
  // register mReg
  assign mReg$D_IN = wci_wslv_reqF$D_OUT[15:0] ;
  assign mReg$EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF$D_OUT[51] &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h5C ;
  // register memIsReset_isInReset
  assign memIsReset_isInReset$D_IN = 1'd0 ;
  assign memIsReset_isInReset$EN = memIsReset_isInReset ;
  // register memc_firstBeat
  assign memc_firstBeat$D_IN = MUX_memc_firstBeat$write_1__SEL_1 ;
  assign memc_firstBeat$EN =
	     WILL_FIRE_RL_memc_advance_request && memc_memc$app_rdy &&
	     !memc_reqF$D_OUT[176] ||
	     WILL_FIRE_RL_memc_advance_write0 && memc_memc$app_wdf_rdy ;
  // register memc_requestCount
  assign memc_requestCount$D_IN = memc_requestCount + 16'd1 ;
  assign memc_requestCount$EN =
	     WILL_FIRE_RL_memc_advance_request && memc_memc$app_rdy ;
  // register memc_secondBeat
  assign memc_secondBeat$D_IN = !MUX_memc_secondBeat$write_1__SEL_1 ;
  assign memc_secondBeat$EN =
	     WILL_FIRE_RL_memc_advance_write1 && memc_memc$app_wdf_rdy ||
	     WILL_FIRE_RL_memc_advance_write0 && memc_memc$app_wdf_rdy ;
  // register pReg
  assign pReg$D_IN = wci_wslv_reqF$D_OUT[15:0] ;
  assign pReg$EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF$D_OUT[51] &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h50 ;
  // register rdReg
  assign rdReg$D_IN =
	     MUX_rdReg$write_1__SEL_1 ?
	       wci_wslv_reqF$D_OUT[31:0] :
	       lrespF$dD_OUT[31:0] ;
  assign rdReg$EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF$D_OUT[51] &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h80 ||
	     WILL_FIRE_RL_advance_response ;
  // register rdReg_1
  assign rdReg_1$D_IN =
	     MUX_rdReg_1$write_1__SEL_1 ?
	       wci_wslv_reqF$D_OUT[31:0] :
	       lrespF$dD_OUT[63:32] ;
  assign rdReg_1$EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF$D_OUT[51] &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h84 ||
	     WILL_FIRE_RL_advance_response ;
  // register rdReg_2
  assign rdReg_2$D_IN =
	     MUX_rdReg_2$write_1__SEL_1 ?
	       wci_wslv_reqF$D_OUT[31:0] :
	       lrespF$dD_OUT[95:64] ;
  assign rdReg_2$EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF$D_OUT[51] &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h88 ||
	     WILL_FIRE_RL_advance_response ;
  // register rdReg_3
  assign rdReg_3$D_IN =
	     MUX_rdReg_3$write_1__SEL_1 ?
	       wci_wslv_reqF$D_OUT[31:0] :
	       lrespF$dD_OUT[127:96] ;
  assign rdReg_3$EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF$D_OUT[51] &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h8C ||
	     WILL_FIRE_RL_advance_response ;
  // register respCount
  assign respCount$D_IN = respCount + 8'd1 ;
  assign respCount$EN = WILL_FIRE_RL_advance_response ;
  // register splitReadInFlight
  assign splitReadInFlight$D_IN = !MUX_splitReadInFlight$write_1__SEL_1 ;
  assign splitReadInFlight$EN =
	     WILL_FIRE_RL_advance_response && splitReadInFlight ||
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[51] ;
  // register wci_wslv_cEdge
  assign wci_wslv_cEdge$D_IN = wci_wslv_reqF$D_OUT[36:34] ;
  assign wci_wslv_cEdge$EN = WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  // register wci_wslv_cState
  assign wci_wslv_cState$D_IN = wci_wslv_nState ;
  assign wci_wslv_cState$EN =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge ;
  // register wci_wslv_ctlAckReg
  assign wci_wslv_ctlAckReg$D_IN = wci_wslv_ctlAckReg_1$whas ;
  assign wci_wslv_ctlAckReg$EN = 1'd1 ;
  // register wci_wslv_ctlOpActive
  assign wci_wslv_ctlOpActive$D_IN = !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  assign wci_wslv_ctlOpActive$EN =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  // register wci_wslv_illegalEdge
  assign wci_wslv_illegalEdge$D_IN =
	     !MUX_wci_wslv_illegalEdge$write_1__SEL_1 &&
	     MUX_wci_wslv_illegalEdge$write_1__VAL_2 ;
  assign wci_wslv_illegalEdge$EN =
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge ||
	     MUX_wci_wslv_illegalEdge$write_1__SEL_2 ;
  // register wci_wslv_isReset_isInReset
  assign wci_wslv_isReset_isInReset$D_IN = 1'd0 ;
  assign wci_wslv_isReset_isInReset$EN = wci_wslv_isReset_isInReset ;
  // register wci_wslv_nState
  always@(wci_wslv_reqF$D_OUT)
  begin
    case (wci_wslv_reqF$D_OUT[36:34])
      3'd0: wci_wslv_nState$D_IN = 3'd1;
      3'd1: wci_wslv_nState$D_IN = 3'd2;
      3'd2: wci_wslv_nState$D_IN = 3'd3;
      default: wci_wslv_nState$D_IN = 3'd0;
    endcase
  end
  assign wci_wslv_nState$EN =
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     (wci_wslv_reqF$D_OUT[36:34] == 3'd0 && wci_wslv_cState == 3'd0 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd1 &&
	      (wci_wslv_cState == 3'd1 || wci_wslv_cState == 3'd3) ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd2 && wci_wslv_cState == 3'd2 ||
	      wci_wslv_reqF$D_OUT[36:34] == 3'd3 &&
	      (wci_wslv_cState == 3'd3 || wci_wslv_cState == 3'd2 ||
	       wci_wslv_cState == 3'd1)) ;
  // register wci_wslv_reqF_countReg
  assign wci_wslv_reqF_countReg$D_IN =
	     (wci_wslv_wciReq$wget[71:69] != 3'd0) ?
	       wci_wslv_reqF_countReg + 2'd1 :
	       wci_wslv_reqF_countReg - 2'd1 ;
  assign wci_wslv_reqF_countReg$EN =
	     (wci_wslv_wciReq$wget[71:69] != 3'd0) !=
	     wci_wslv_reqF_r_deq$whas ;
  // register wci_wslv_respF_c_r
  assign wci_wslv_respF_c_r$D_IN =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr ?
	       MUX_wci_wslv_respF_c_r$write_1__VAL_1 :
	       MUX_wci_wslv_respF_c_r$write_1__VAL_2 ;
  assign wci_wslv_respF_c_r$EN =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr ||
	     WILL_FIRE_RL_wci_wslv_respF_decCtr ;
  // register wci_wslv_respF_q_0
  always@(MUX_wci_wslv_respF_q_0$write_1__SEL_1 or
	  MUX_wci_wslv_respF_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wci_wslv_respF_both or
	  MUX_wci_wslv_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wci_wslv_respF_decCtr or wci_wslv_respF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_wslv_respF_q_0$write_1__SEL_1:
	  wci_wslv_respF_q_0$D_IN = MUX_wci_wslv_respF_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wci_wslv_respF_both:
	  wci_wslv_respF_q_0$D_IN = MUX_wci_wslv_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wci_wslv_respF_decCtr:
	  wci_wslv_respF_q_0$D_IN = wci_wslv_respF_q_1;
      default: wci_wslv_respF_q_0$D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_wslv_respF_q_0$EN =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wci_wslv_respF_both ||
	     WILL_FIRE_RL_wci_wslv_respF_decCtr ;
  // register wci_wslv_respF_q_1
  always@(MUX_wci_wslv_respF_q_1$write_1__SEL_1 or
	  MUX_wci_wslv_respF_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wci_wslv_respF_both or
	  MUX_wci_wslv_respF_q_1$write_1__VAL_2 or
	  WILL_FIRE_RL_wci_wslv_respF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wci_wslv_respF_q_1$write_1__SEL_1:
	  wci_wslv_respF_q_1$D_IN = MUX_wci_wslv_respF_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wci_wslv_respF_both:
	  wci_wslv_respF_q_1$D_IN = MUX_wci_wslv_respF_q_1$write_1__VAL_2;
      WILL_FIRE_RL_wci_wslv_respF_decCtr:
	  wci_wslv_respF_q_1$D_IN = 34'h0AAAAAAAA;
      default: wci_wslv_respF_q_1$D_IN =
		   34'h2AAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wci_wslv_respF_q_1$EN =
	     WILL_FIRE_RL_wci_wslv_respF_incCtr &&
	     wci_wslv_respF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wci_wslv_respF_both ||
	     WILL_FIRE_RL_wci_wslv_respF_decCtr ;
  // register wci_wslv_sFlagReg
  assign wci_wslv_sFlagReg$D_IN = 1'b0 ;
  assign wci_wslv_sFlagReg$EN = 1'd1 ;
  // register wci_wslv_sThreadBusy_d
  assign wci_wslv_sThreadBusy_d$D_IN = 1'b0 ;
  assign wci_wslv_sThreadBusy_d$EN = 1'd1 ;
  // register wdReg
  assign wdReg$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign wdReg$EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF$D_OUT[51] &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h60 ;
  // register wdReg_1
  assign wdReg_1$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign wdReg_1$EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF$D_OUT[51] &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h64 ;
  // register wdReg_2
  assign wdReg_2$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign wdReg_2$EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF$D_OUT[51] &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h68 ;
  // register wdReg_3
  assign wdReg_3$D_IN = wci_wslv_reqF$D_OUT[31:0] ;
  assign wdReg_3$EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF$D_OUT[51] &&
	     wci_wslv_reqF$D_OUT[39:32] == 8'h6C ;
  // register wmemiRdReq
  assign wmemiRdReq$D_IN = wmemiRdReq + 32'd1 ;
  assign wmemiRdReq$EN = wmemiReadInFlight_acc_v1$whas ;
  // register wmemiRdResp
  assign wmemiRdResp$D_IN = wmemiRdResp + 32'd1 ;
  assign wmemiRdResp$EN = wmemi_respF_enqueueing$whas ;
  // register wmemiReadInFlight_value
  assign wmemiReadInFlight_value$D_IN =
	     WILL_FIRE_RL_wci_ctrl_IsO ?
	       8'd0 :
	       MUX_wmemiReadInFlight_value$write_1__VAL_2 ;
  assign wmemiReadInFlight_value$EN = 1'b1 ;
  // register wmemiWrReq
  assign wmemiWrReq$D_IN = wmemiWrReq + 32'd1 ;
  assign wmemiWrReq$EN =
	     WILL_FIRE_RL_getRequest && wmemi_reqF$D_OUT[51:49] == 3'd1 ;
  // register wmemi_errorSticky
  assign wmemi_errorSticky$D_IN = 1'b0 ;
  assign wmemi_errorSticky$EN = 1'b0 ;
  // register wmemi_isReset_isInReset
  assign wmemi_isReset_isInReset$D_IN = 1'd0 ;
  assign wmemi_isReset_isInReset$EN = wmemi_isReset_isInReset ;
  // register wmemi_operateD
  assign wmemi_operateD$D_IN = wci_wslv_cState == 3'd2 ;
  assign wmemi_operateD$EN = 1'd1 ;
  // register wmemi_peerIsReady
  assign wmemi_peerIsReady$D_IN = wmemiS0_MReset_n ;
  assign wmemi_peerIsReady$EN = 1'd1 ;
  // register wmemi_respF_c_r
  assign wmemi_respF_c_r$D_IN =
	     WILL_FIRE_RL_wmemi_respF_incCtr ?
	       MUX_wmemi_respF_c_r$write_1__VAL_1 :
	       MUX_wmemi_respF_c_r$write_1__VAL_2 ;
  assign wmemi_respF_c_r$EN =
	     WILL_FIRE_RL_wmemi_respF_incCtr ||
	     WILL_FIRE_RL_wmemi_respF_decCtr ;
  // register wmemi_respF_q_0
  always@(MUX_wmemi_respF_q_0$write_1__SEL_1 or
	  MUX_wmemi_respF_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wmemi_respF_both or
	  MUX_wmemi_respF_q_0$write_1__VAL_2 or
	  WILL_FIRE_RL_wmemi_respF_decCtr or wmemi_respF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmemi_respF_q_0$write_1__SEL_1:
	  wmemi_respF_q_0$D_IN = MUX_wmemi_respF_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wmemi_respF_both:
	  wmemi_respF_q_0$D_IN = MUX_wmemi_respF_q_0$write_1__VAL_2;
      WILL_FIRE_RL_wmemi_respF_decCtr: wmemi_respF_q_0$D_IN = wmemi_respF_q_1;
      default: wmemi_respF_q_0$D_IN =
		   131'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmemi_respF_q_0$EN =
	     WILL_FIRE_RL_wmemi_respF_incCtr && wmemi_respF_c_r == 2'd0 ||
	     WILL_FIRE_RL_wmemi_respF_both ||
	     WILL_FIRE_RL_wmemi_respF_decCtr ;
  // register wmemi_respF_q_1
  always@(MUX_wmemi_respF_q_1$write_1__SEL_1 or
	  MUX_wmemi_respF_q_0$write_1__VAL_1 or
	  WILL_FIRE_RL_wmemi_respF_both or
	  MUX_wmemi_respF_q_1$write_1__VAL_2 or
	  WILL_FIRE_RL_wmemi_respF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmemi_respF_q_1$write_1__SEL_1:
	  wmemi_respF_q_1$D_IN = MUX_wmemi_respF_q_0$write_1__VAL_1;
      WILL_FIRE_RL_wmemi_respF_both:
	  wmemi_respF_q_1$D_IN = MUX_wmemi_respF_q_1$write_1__VAL_2;
      WILL_FIRE_RL_wmemi_respF_decCtr:
	  wmemi_respF_q_1$D_IN = 131'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
      default: wmemi_respF_q_1$D_IN =
		   131'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmemi_respF_q_1$EN =
	     WILL_FIRE_RL_wmemi_respF_incCtr && wmemi_respF_c_r == 2'd1 ||
	     WILL_FIRE_RL_wmemi_respF_both ||
	     WILL_FIRE_RL_wmemi_respF_decCtr ;
  // register wmemi_statusR
  assign wmemi_statusR$D_IN =
	     { wmemi_isReset_isInReset,
	       !wmemi_peerIsReady,
	       !wmemi_operateD,
	       wmemi_errorSticky,
	       3'd0,
	       wmemi_trafficSticky } ;
  assign wmemi_statusR$EN = 1'd1 ;
  // register wmemi_trafficSticky
  assign wmemi_trafficSticky$D_IN = 1'd1 ;
  assign wmemi_trafficSticky$EN = wmemi_cmdAccept_w$whas ;
  // submodule appFull
  assign appFull$sD_IN = x1__h12497 ;
  assign appFull$sEN = 1'd1 ;
  // submodule dbg_cpt_first_edge_cnt
  assign dbg_cpt_first_edge_cnt$sD_IN = 40'h0 ;
  assign dbg_cpt_first_edge_cnt$sEN = 1'b0 ;
  // submodule dbg_cpt_second_edge_cnt
  assign dbg_cpt_second_edge_cnt$sD_IN = 40'h0 ;
  assign dbg_cpt_second_edge_cnt$sEN = 1'b0 ;
  // submodule dbg_cpt_tap_cnt
  assign dbg_cpt_tap_cnt$sD_IN = 40'h0 ;
  assign dbg_cpt_tap_cnt$sEN = 1'b0 ;
  // submodule dbg_dq_tap_cnt
  assign dbg_dq_tap_cnt$sD_IN = 40'h0 ;
  assign dbg_dq_tap_cnt$sEN = 1'b0 ;
  // submodule dbg_dqs_n_tap_cnt
  assign dbg_dqs_n_tap_cnt$sD_IN = 40'h0 ;
  assign dbg_dqs_n_tap_cnt$sEN = 1'b0 ;
  // submodule dbg_dqs_p_tap_cnt
  assign dbg_dqs_p_tap_cnt$sD_IN = 40'h0 ;
  assign dbg_dqs_p_tap_cnt$sEN = 1'b0 ;
  // submodule dbg_rd_active_dly
  assign dbg_rd_active_dly$sD_IN = 5'h0 ;
  assign dbg_rd_active_dly$sEN = 1'b0 ;
  // submodule dbg_rd_bitslip_cnt
  assign dbg_rd_bitslip_cnt$sD_IN = 24'h0 ;
  assign dbg_rd_bitslip_cnt$sEN = 1'b0 ;
  // submodule dbg_rd_clkdly_cnt
  assign dbg_rd_clkdly_cnt$sD_IN = 16'h0 ;
  assign dbg_rd_clkdly_cnt$sEN = 1'b0 ;
  // submodule dbg_rddata
  assign dbg_rddata$sD_IN = 32'h0 ;
  assign dbg_rddata$sEN = 1'b0 ;
  // submodule dbg_rdlvl_done
  assign dbg_rdlvl_done$sD_IN = 2'h0 ;
  assign dbg_rdlvl_done$sEN = 1'b0 ;
  // submodule dbg_rdlvl_err
  assign dbg_rdlvl_err$sD_IN = 2'h0 ;
  assign dbg_rdlvl_err$sEN = 1'b0 ;
  // submodule dbg_wl_dqs_inverted
  assign dbg_wl_dqs_inverted$sD_IN = 8'h0 ;
  assign dbg_wl_dqs_inverted$sEN = 1'b0 ;
  // submodule dbg_wl_odelay_dq_tap_cnt
  assign dbg_wl_odelay_dq_tap_cnt$sD_IN = 40'h0 ;
  assign dbg_wl_odelay_dq_tap_cnt$sEN = 1'b0 ;
  // submodule dbg_wl_odelay_dqs_tap_cnt
  assign dbg_wl_odelay_dqs_tap_cnt$sD_IN = 40'h0 ;
  assign dbg_wl_odelay_dqs_tap_cnt$sEN = 1'b0 ;
  // submodule dbg_wr_calib_clk_delay
  assign dbg_wr_calib_clk_delay$sD_IN = 16'h0 ;
  assign dbg_wr_calib_clk_delay$sEN = 1'b0 ;
  // submodule firBeat
  assign firBeat$sD_IN = memc_firstBeat ;
  assign firBeat$sEN = 1'd1 ;
  // submodule initComplete
  assign initComplete$sD_IN = memc_memc$init_calib_complete ;
  assign initComplete$sEN = 1'd1 ;
  // submodule lreqF
  always@(MUX_lreqF$enq_1__SEL_1 or
	  MUX_lreqF$enq_1__VAL_1 or
	  MUX_lreqF$enq_1__SEL_2 or
	  MUX_lreqF$enq_1__VAL_2 or
	  MUX_lreqF$enq_1__SEL_3 or MUX_lreqF$enq_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_lreqF$enq_1__SEL_1: lreqF$sD_IN = MUX_lreqF$enq_1__VAL_1;
      MUX_lreqF$enq_1__SEL_2: lreqF$sD_IN = MUX_lreqF$enq_1__VAL_2;
      MUX_lreqF$enq_1__SEL_3: lreqF$sD_IN = MUX_lreqF$enq_1__VAL_3;
      default: lreqF$sD_IN =
		   177'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign lreqF$sENQ =
	     WILL_FIRE_RL_getRequest &&
	     (wmemi_reqF$D_OUT[51:49] == 3'd1 ||
	      wmemiReadInFlight_value_05_SLT_16___d680) ||
	     WILL_FIRE_RL_wci_cfwr &&
	     (wci_wslv_reqF$D_OUT[51] ||
	      wci_wslv_reqF$D_OUT[39:32] == 8'h54 ||
	      wci_wslv_reqF$D_OUT[39:32] == 8'h58) ||
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF$D_OUT[51] ;
  assign lreqF$dDEQ = lreqF$dEMPTY_N && memc_reqF$FULL_N ;
  // submodule lrespF
  assign lrespF$sD_IN = memc_respF$D_OUT ;
  assign lrespF$sENQ = lrespF$sFULL_N && memc_respF$EMPTY_N ;
  assign lrespF$dDEQ =
	     lrespF$dEMPTY_N &&
	     lrespF_RDY_first__61_AND_NOT_wmemi_respF_c_r_4_ETC___d363 &&
	     (wmemiReadInFlight_value ^ 8'h80) > 8'd128 ||
	     WILL_FIRE_RL_advance_response ;
  // submodule memIsResetCC
  assign memIsResetCC$sD_IN = memIsReset_isInReset ;
  assign memIsResetCC$sEN = 1'd1 ;
  // submodule memc_memc
  assign memc_memc$app_addr = { 3'd0, memc_reqF$D_OUT[175:146] } ;
  assign memc_memc$app_cmd = memc_reqF$D_OUT[176] ? 3'b001 : 3'b0 ;
  assign memc_memc$app_wdf_data = {2{memc_reqF$D_OUT[127:0]}} ;
  assign memc_memc$app_wdf_end = WILL_FIRE_RL_memc_advance_write1 ;
  assign memc_memc$app_wdf_mask =
	     WILL_FIRE_RL_memc_advance_write0 ? ~x__h5897 : ~x__h6118 ;
  assign memc_memc$app_en = WILL_FIRE_RL_memc_advance_request ;
  assign memc_memc$app_wdf_wren = memc_wdfWren$whas ;
  // submodule memc_rdpF
  assign memc_rdpF$D_IN = memc_reqF$D_OUT[149:148] ;
  assign memc_rdpF$ENQ =
	     WILL_FIRE_RL_memc_advance_request && memc_memc$app_rdy &&
	     memc_reqF$D_OUT[176] ;
  assign memc_rdpF$DEQ =
	     WILL_FIRE_RL_memc_advance_readData && memc_memc$app_rd_data_end ;
  assign memc_rdpF$CLR = 1'b0 ;
  // submodule memc_reqF
  assign memc_reqF$D_IN = lreqF$dD_OUT ;
  assign memc_reqF$ENQ = lreqF$dEMPTY_N && memc_reqF$FULL_N ;
  assign memc_reqF$DEQ =
	     WILL_FIRE_RL_memc_advance_request && memc_memc$app_rdy &&
	     memc_reqF$D_OUT[176] ||
	     WILL_FIRE_RL_memc_advance_write1 && memc_memc$app_wdf_rdy ;
  assign memc_reqF$CLR = 1'b0 ;
  // submodule memc_respF
  always@(x__h6367 or memc_memc$app_rd_data)
  begin
    case (x__h6367)
      3'b0, 3'b110: memc_respF$D_IN = memc_memc$app_rd_data[127:0];
      3'b101: memc_respF$D_IN = memc_memc$app_rd_data[255:128];
      default: memc_respF$D_IN = memc_memc$app_rd_data[255:128];
    endcase
  end
  assign memc_respF$ENQ =
	     WILL_FIRE_RL_memc_advance_readData &&
	     (x__h6367 == 3'b0 || x__h6367 == 3'b101 || x__h6367 == 3'b110 ||
	      x__h6367 == 3'b011) ;
  assign memc_respF$DEQ = lrespF$sFULL_N && memc_respF$EMPTY_N ;
  assign memc_respF$CLR = 1'b0 ;
  // submodule requestCount
  assign requestCount$sD_IN = 16'h0 ;
  assign requestCount$sEN = 1'b0 ;
  // submodule responseCount
  assign responseCount$sD_IN = 16'h0 ;
  assign responseCount$sEN = 1'b0 ;
  // submodule secBeat
  assign secBeat$sD_IN = memc_secondBeat ;
  assign secBeat$sEN = 1'd1 ;
  // submodule splaF
  assign splaF$D_IN = wci_wslv_reqF$D_OUT[35:34] ;
  assign splaF$ENQ = MUX_lreqF$enq_1__SEL_3 ;
  assign splaF$DEQ = MUX_splitReadInFlight$write_1__SEL_1 ;
  assign splaF$CLR = 1'b0 ;
  // submodule wci_wslv_reqF
  assign wci_wslv_reqF$D_IN = wci_wslv_wciReq$wget ;
  assign wci_wslv_reqF$ENQ = wci_wslv_wciReq$wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF$DEQ = wci_wslv_reqF_r_deq$whas ;
  assign wci_wslv_reqF$CLR = 1'b0 ;
  // submodule wdfFull
  assign wdfFull$sD_IN = !memc_memc$app_wdf_rdy ;
  assign wdfFull$sEN = 1'd1 ;
  // submodule wmemi_dhF
  assign wmemi_dhF$D_IN = wmemi_wmemiDh$wget ;
  assign wmemi_dhF$ENQ = wmemi_dhAccept_w$whas ;
  assign wmemi_dhF$DEQ =
	     WILL_FIRE_RL_getRequest && wmemi_reqF$D_OUT[51:49] == 3'd1 ;
  assign wmemi_dhF$CLR = 1'b0 ;
  // submodule wmemi_reqF
  assign wmemi_reqF$D_IN = wmemi_wmemiReq$wget ;
  assign wmemi_reqF$ENQ = wmemi_cmdAccept_w$whas ;
  assign wmemi_reqF$DEQ = WILL_FIRE_RL_getRequest ;
  assign wmemi_reqF$CLR = 1'b0 ;
  // remaining internal signals
  assign IF_memc_memc_app_rd_data_end__11_CONCAT_memc_r_ETC___d227 =
	     CASE_x367_NOT_x367_EQ_0b11_OR_memc_respFFULL__ETC__q2 &&
	     (!memc_memc$app_rd_data_end || memc_rdpF$EMPTY_N) ;
  assign IF_wci_wslv_reqF_first__5_BIT_51_00_THEN_lreqF_ETC___d476 =
	     wci_wslv_reqF$D_OUT[51] ?
	       lreqF$sFULL_N && splaF$FULL_N :
	       wci_wslv_respF_c_r != 2'd2 ;
  assign IF_wci_wslv_reqF_first__5_BIT_51_00_THEN_pReg__ETC___d451 =
	     wci_wslv_reqF$D_OUT[51] ?
	       { x1_addr__h16429, x1_be__h16430, x1_data__h16431 } :
	       { wci_wslv_reqF$D_OUT[31:0], mReg, x1_data__h15430 } ;
  assign IF_wmemi_reqF_first__26_BITS_51_TO_49_27_EQ_1__ETC___d335 =
	     (wmemi_reqF$D_OUT[51:49] == 3'd1) ?
	       lreqF$sFULL_N && wmemi_dhF$EMPTY_N :
	       !wmemiReadInFlight_value_05_SLT_16___d680 || lreqF$sFULL_N ;
  assign dramStatus__h12803 = { 16'd0, x__h17995 } ;
  assign g_data__h17955 =
	     wci_wslv_reqF$D_OUT[51] ?
	       32'd0 :
	       CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 ;
  assign lrespF_RDY_first__61_AND_NOT_splitReadInFlight_ETC___d379 =
	     lrespF$dEMPTY_N &&
	     (!splitReadInFlight ||
	      splaF$EMPTY_N && wci_wslv_respF_c_r != 2'd2) ;
  assign lrespF_RDY_first__61_AND_NOT_wmemi_respF_c_r_4_ETC___d363 =
	     lrespF$dEMPTY_N && wmemi_respF_c_r != 2'd2 && wmemi_operateD &&
	     wmemi_peerIsReady ;
  assign myBE__h5934 = { 16'h0, memc_reqF$D_OUT[143:128] } ;
  assign myBE__h5967 = { memc_reqF$D_OUT[143:128], 16'h0 } ;
  assign rdat___1__h18018 =
	     hasDebugLogic ? { 24'd0, dbg_wl_dqs_inverted$dD_OUT } : 32'd0 ;
  assign rdat___1__h18029 =
	     hasDebugLogic ?
	       { 16'd0, dbg_wr_calib_clk_delay$dD_OUT } :
	       32'd0 ;
  assign rdat___1__h18040 =
	     hasDebugLogic ? dbg_wl_odelay_dqs_tap_cnt$dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h18051 =
	     hasDebugLogic ? dbg_wl_odelay_dq_tap_cnt$dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h18062 =
	     hasDebugLogic ? { 30'd0, dbg_rdlvl_done$dD_OUT } : 32'd0 ;
  assign rdat___1__h18073 =
	     hasDebugLogic ? { 30'd0, dbg_rdlvl_err$dD_OUT } : 32'd0 ;
  assign rdat___1__h18084 =
	     hasDebugLogic ? dbg_cpt_tap_cnt$dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h18095 =
	     hasDebugLogic ? dbg_cpt_first_edge_cnt$dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h18106 =
	     hasDebugLogic ? dbg_cpt_second_edge_cnt$dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h18117 =
	     hasDebugLogic ? { 8'd0, dbg_rd_bitslip_cnt$dD_OUT } : 32'd0 ;
  assign rdat___1__h18128 =
	     hasDebugLogic ? { 16'd0, dbg_rd_clkdly_cnt$dD_OUT } : 32'd0 ;
  assign rdat___1__h18139 =
	     hasDebugLogic ? { 27'd0, dbg_rd_active_dly$dD_OUT } : 32'd0 ;
  assign rdat___1__h18150 =
	     hasDebugLogic ? dbg_dqs_p_tap_cnt$dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h18161 =
	     hasDebugLogic ? dbg_dqs_n_tap_cnt$dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h18172 =
	     hasDebugLogic ? dbg_dq_tap_cnt$dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h18183 = hasDebugLogic ? dbg_rddata$dD_OUT : 32'd0 ;
  assign rdat___1__h18190 =
	     hasDebugLogic ? { 16'd0, requestCount$dD_OUT } : 32'd0 ;
  assign rdat___1__h18201 = hasDebugLogic ? { 16'd0, pReg } : 32'd0 ;
  assign rdat___1__h18211 = hasDebugLogic ? { 16'd0, mReg } : 32'd0 ;
  assign rdat___1__h18221 = hasDebugLogic ? wdReg : 32'd0 ;
  assign rdat___1__h18235 = hasDebugLogic ? wdReg_1 : 32'd0 ;
  assign rdat___1__h18249 = hasDebugLogic ? wdReg_2 : 32'd0 ;
  assign rdat___1__h18263 = hasDebugLogic ? wdReg_3 : 32'd0 ;
  assign rdat___1__h18277 = hasDebugLogic ? rdReg : 32'd0 ;
  assign rdat___1__h18292 = hasDebugLogic ? rdReg_1 : 32'd0 ;
  assign rdat___1__h18307 = hasDebugLogic ? rdReg_2 : 32'd0 ;
  assign rdat___1__h18322 = hasDebugLogic ? rdReg_3 : 32'd0 ;
  assign wci_wslv_reqF_i_notEmpty__4_AND_IF_wci_wslv_re_ETC___d412 =
	     wci_wslv_reqF$EMPTY_N &&
	     (wci_wslv_reqF$D_OUT[51] ?
		lreqF$sFULL_N :
		((wci_wslv_reqF$D_OUT[39:32] == 8'h54) ?
		   lreqF$sFULL_N :
		   wci_wslv_reqF$D_OUT[39:32] != 8'h58 || lreqF$sFULL_N)) ;
  assign wmemiReadInFlight_value_05_SLT_16___d680 =
	     (wmemiReadInFlight_value ^ 8'h80) < 8'd144 ;
  assign x1__h12497 = !memc_memc$app_rdy ;
  assign x1_addr__h16429 = { pReg[12:0], wci_wslv_reqF$D_OUT[50:36], 4'd0 } ;
  assign x1_be__h16430 =
	     { (wci_wslv_reqF$D_OUT[35:34] == 2'd3) ? 4'hF : 4'h0,
	       (wci_wslv_reqF$D_OUT[35:34] == 2'd2) ? 4'hF : 4'h0,
	       (wci_wslv_reqF$D_OUT[35:34] == 2'd1) ? 4'hF : 4'h0,
	       (wci_wslv_reqF$D_OUT[35:34] == 2'd0) ? 4'hF : 4'h0 } ;
  assign x1_data__h15430 = { wdReg_3, wdReg_2, wdReg_1, wdReg } ;
  assign x1_data__h16431 = {4{wci_wslv_reqF$D_OUT[31:0]}} ;
  assign x__h17995 =
	     { respCount,
	       2'h0,
	       memIsResetCC$dD_OUT,
	       appFull$dD_OUT,
	       wdfFull$dD_OUT,
	       secBeat$dD_OUT,
	       firBeat$dD_OUT,
	       initComplete$dD_OUT } ;
  assign x__h6367 = { memc_memc$app_rd_data_end, memc_rdpF$D_OUT } ;
  always@(splaF$D_OUT or lrespF$dD_OUT)
  begin
    case (splaF$D_OUT)
      2'd0: g_data__h14180 = lrespF$dD_OUT[31:0];
      2'd1: g_data__h14180 = lrespF$dD_OUT[63:32];
      2'd2: g_data__h14180 = lrespF$dD_OUT[95:64];
      2'd3: g_data__h14180 = lrespF$dD_OUT[127:96];
    endcase
  end
  always@(wci_wslv_reqF$D_OUT or
	  dramStatus__h12803 or
	  dramCtrl or
	  rdat___1__h18018 or
	  rdat___1__h18029 or
	  rdat___1__h18040 or
	  rdat___1__h18051 or
	  rdat___1__h18062 or
	  rdat___1__h18073 or
	  rdat___1__h18084 or
	  rdat___1__h18095 or
	  rdat___1__h18106 or
	  rdat___1__h18117 or
	  rdat___1__h18128 or
	  rdat___1__h18139 or
	  rdat___1__h18150 or
	  rdat___1__h18161 or
	  rdat___1__h18172 or
	  rdat___1__h18183 or
	  rdat___1__h18190 or
	  rdat___1__h18201 or
	  rdat___1__h18211 or
	  rdat___1__h18221 or
	  rdat___1__h18235 or
	  rdat___1__h18249 or
	  rdat___1__h18263 or
	  rdat___1__h18277 or
	  rdat___1__h18292 or rdat___1__h18307 or rdat___1__h18322)
  begin
    case (wci_wslv_reqF$D_OUT[39:32])
      8'h0:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      dramStatus__h12803;
      8'h04: CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 = dramCtrl;
      8'h08:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18018;
      8'h0C:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18029;
      8'h10:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18040;
      8'h14:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18051;
      8'h18:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18062;
      8'h1C:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18073;
      8'h20:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18084;
      8'h24:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18095;
      8'h28:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18106;
      8'h2C:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18117;
      8'h30:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18128;
      8'h34:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18139;
      8'h38:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18150;
      8'h3C:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18161;
      8'h40:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18172;
      8'h44:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18183;
      8'h48:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18190;
      8'h50:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18201;
      8'h5C:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18211;
      8'h60:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18221;
      8'h64:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18235;
      8'h68:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18249;
      8'h6C:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18263;
      8'h80:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18277;
      8'h84:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18292;
      8'h88:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18307;
      8'h8C:
	  CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 =
	      rdat___1__h18322;
      default: CASE_wci_wslv_reqFD_OUT_BITS_39_TO_32_0_0x0_d_ETC__q1 = 32'd0;
    endcase
  end
  always@(memc_reqF$D_OUT or myBE__h5934 or myBE__h5967)
  begin
    case (memc_reqF$D_OUT[149:148])
      2'b0: x__h5897 = myBE__h5934;
      2'b01: x__h5897 = myBE__h5967;
      default: x__h5897 = 32'd0;
    endcase
  end
  always@(memc_reqF$D_OUT or myBE__h5934 or myBE__h5967)
  begin
    case (memc_reqF$D_OUT[149:148])
      2'b10: x__h6118 = myBE__h5934;
      2'b11: x__h6118 = myBE__h5967;
      default: x__h6118 = 32'd0;
    endcase
  end
  always@(x__h6367 or memc_respF$FULL_N)
  begin
    case (x__h6367)
      3'b0, 3'b101, 3'b110:
	  CASE_x367_NOT_x367_EQ_0b11_OR_memc_respFFULL__ETC__q2 =
	      memc_respF$FULL_N;
      default: CASE_x367_NOT_x367_EQ_0b11_OR_memc_respFFULL__ETC__q2 =
		   x__h6367 != 3'b011 || memc_respF$FULL_N;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (wciS0_MReset_n == `BSV_RESET_VALUE)
      begin
        dramCtrl <= `BSV_ASSIGNMENT_DELAY 32'd0;
	mReg <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pReg <= `BSV_ASSIGNMENT_DELAY 16'd0;
	rdReg <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rdReg_1 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rdReg_2 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	rdReg_3 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	respCount <= `BSV_ASSIGNMENT_DELAY 8'd0;
	splitReadInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_cEdge <= `BSV_ASSIGNMENT_DELAY 3'h2;
	wci_wslv_cState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	wci_wslv_ctlAckReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_ctlOpActive <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_illegalEdge <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_nState <= `BSV_ASSIGNMENT_DELAY 3'd0;
	wci_wslv_reqF_countReg <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wci_wslv_respF_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wci_wslv_respF_q_0 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	wci_wslv_respF_q_1 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	wci_wslv_sFlagReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wdReg <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wdReg_1 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wdReg_2 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wdReg_3 <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmemiRdReq <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmemiRdResp <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmemiReadInFlight_value <= `BSV_ASSIGNMENT_DELAY 8'd0;
	wmemiWrReq <= `BSV_ASSIGNMENT_DELAY 32'd0;
	wmemi_errorSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmemi_operateD <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmemi_peerIsReady <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wmemi_respF_c_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmemi_respF_q_0 <= `BSV_ASSIGNMENT_DELAY
	    131'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	wmemi_respF_q_1 <= `BSV_ASSIGNMENT_DELAY
	    131'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	wmemi_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (dramCtrl$EN) dramCtrl <= `BSV_ASSIGNMENT_DELAY dramCtrl$D_IN;
	if (mReg$EN) mReg <= `BSV_ASSIGNMENT_DELAY mReg$D_IN;
	if (pReg$EN) pReg <= `BSV_ASSIGNMENT_DELAY pReg$D_IN;
	if (rdReg$EN) rdReg <= `BSV_ASSIGNMENT_DELAY rdReg$D_IN;
	if (rdReg_1$EN) rdReg_1 <= `BSV_ASSIGNMENT_DELAY rdReg_1$D_IN;
	if (rdReg_2$EN) rdReg_2 <= `BSV_ASSIGNMENT_DELAY rdReg_2$D_IN;
	if (rdReg_3$EN) rdReg_3 <= `BSV_ASSIGNMENT_DELAY rdReg_3$D_IN;
	if (respCount$EN) respCount <= `BSV_ASSIGNMENT_DELAY respCount$D_IN;
	if (splitReadInFlight$EN)
	  splitReadInFlight <= `BSV_ASSIGNMENT_DELAY splitReadInFlight$D_IN;
	if (wci_wslv_cEdge$EN)
	  wci_wslv_cEdge <= `BSV_ASSIGNMENT_DELAY wci_wslv_cEdge$D_IN;
	if (wci_wslv_cState$EN)
	  wci_wslv_cState <= `BSV_ASSIGNMENT_DELAY wci_wslv_cState$D_IN;
	if (wci_wslv_ctlAckReg$EN)
	  wci_wslv_ctlAckReg <= `BSV_ASSIGNMENT_DELAY wci_wslv_ctlAckReg$D_IN;
	if (wci_wslv_ctlOpActive$EN)
	  wci_wslv_ctlOpActive <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_ctlOpActive$D_IN;
	if (wci_wslv_illegalEdge$EN)
	  wci_wslv_illegalEdge <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_illegalEdge$D_IN;
	if (wci_wslv_nState$EN)
	  wci_wslv_nState <= `BSV_ASSIGNMENT_DELAY wci_wslv_nState$D_IN;
	if (wci_wslv_reqF_countReg$EN)
	  wci_wslv_reqF_countReg <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_reqF_countReg$D_IN;
	if (wci_wslv_respF_c_r$EN)
	  wci_wslv_respF_c_r <= `BSV_ASSIGNMENT_DELAY wci_wslv_respF_c_r$D_IN;
	if (wci_wslv_respF_q_0$EN)
	  wci_wslv_respF_q_0 <= `BSV_ASSIGNMENT_DELAY wci_wslv_respF_q_0$D_IN;
	if (wci_wslv_respF_q_1$EN)
	  wci_wslv_respF_q_1 <= `BSV_ASSIGNMENT_DELAY wci_wslv_respF_q_1$D_IN;
	if (wci_wslv_sFlagReg$EN)
	  wci_wslv_sFlagReg <= `BSV_ASSIGNMENT_DELAY wci_wslv_sFlagReg$D_IN;
	if (wci_wslv_sThreadBusy_d$EN)
	  wci_wslv_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY
	      wci_wslv_sThreadBusy_d$D_IN;
	if (wdReg$EN) wdReg <= `BSV_ASSIGNMENT_DELAY wdReg$D_IN;
	if (wdReg_1$EN) wdReg_1 <= `BSV_ASSIGNMENT_DELAY wdReg_1$D_IN;
	if (wdReg_2$EN) wdReg_2 <= `BSV_ASSIGNMENT_DELAY wdReg_2$D_IN;
	if (wdReg_3$EN) wdReg_3 <= `BSV_ASSIGNMENT_DELAY wdReg_3$D_IN;
	if (wmemiRdReq$EN)
	  wmemiRdReq <= `BSV_ASSIGNMENT_DELAY wmemiRdReq$D_IN;
	if (wmemiRdResp$EN)
	  wmemiRdResp <= `BSV_ASSIGNMENT_DELAY wmemiRdResp$D_IN;
	if (wmemiReadInFlight_value$EN)
	  wmemiReadInFlight_value <= `BSV_ASSIGNMENT_DELAY
	      wmemiReadInFlight_value$D_IN;
	if (wmemiWrReq$EN)
	  wmemiWrReq <= `BSV_ASSIGNMENT_DELAY wmemiWrReq$D_IN;
	if (wmemi_errorSticky$EN)
	  wmemi_errorSticky <= `BSV_ASSIGNMENT_DELAY wmemi_errorSticky$D_IN;
	if (wmemi_operateD$EN)
	  wmemi_operateD <= `BSV_ASSIGNMENT_DELAY wmemi_operateD$D_IN;
	if (wmemi_peerIsReady$EN)
	  wmemi_peerIsReady <= `BSV_ASSIGNMENT_DELAY wmemi_peerIsReady$D_IN;
	if (wmemi_respF_c_r$EN)
	  wmemi_respF_c_r <= `BSV_ASSIGNMENT_DELAY wmemi_respF_c_r$D_IN;
	if (wmemi_respF_q_0$EN)
	  wmemi_respF_q_0 <= `BSV_ASSIGNMENT_DELAY wmemi_respF_q_0$D_IN;
	if (wmemi_respF_q_1$EN)
	  wmemi_respF_q_1 <= `BSV_ASSIGNMENT_DELAY wmemi_respF_q_1$D_IN;
	if (wmemi_trafficSticky$EN)
	  wmemi_trafficSticky <= `BSV_ASSIGNMENT_DELAY
	      wmemi_trafficSticky$D_IN;
      end
    if (wmemi_statusR$EN)
      wmemi_statusR <= `BSV_ASSIGNMENT_DELAY wmemi_statusR$D_IN;
  end
  always@(posedge memc_memc$tb_clk)
  begin
    if (memc_memc$tb_rst_n == `BSV_RESET_VALUE)
      begin
        dbgCtrl <= `BSV_ASSIGNMENT_DELAY 32'd0;
	memc_firstBeat <= `BSV_ASSIGNMENT_DELAY 1'd0;
	memc_requestCount <= `BSV_ASSIGNMENT_DELAY 16'd0;
	memc_secondBeat <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (dbgCtrl$EN) dbgCtrl <= `BSV_ASSIGNMENT_DELAY dbgCtrl$D_IN;
	if (memc_firstBeat$EN)
	  memc_firstBeat <= `BSV_ASSIGNMENT_DELAY memc_firstBeat$D_IN;
	if (memc_requestCount$EN)
	  memc_requestCount <= `BSV_ASSIGNMENT_DELAY memc_requestCount$D_IN;
	if (memc_secondBeat$EN)
	  memc_secondBeat <= `BSV_ASSIGNMENT_DELAY memc_secondBeat$D_IN;
      end
  end
  always@(posedge wciS0_Clk or `BSV_RESET_EDGE wciS0_MReset_n)
  if (wciS0_MReset_n == `BSV_RESET_VALUE)
    begin
      wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
      wmemi_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (wci_wslv_isReset_isInReset$EN)
	wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wci_wslv_isReset_isInReset$D_IN;
      if (wmemi_isReset_isInReset$EN)
	wmemi_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wmemi_isReset_isInReset$D_IN;
    end
  always@(posedge memc_memc$tb_clk or `BSV_RESET_EDGE memc_memc$tb_rst_n)
  if (memc_memc$tb_rst_n == `BSV_RESET_VALUE)
    begin
      memIsReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (memIsReset_isInReset$EN)
	memIsReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    memIsReset_isInReset$D_IN;
    end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    dbgCtrl = 32'hAAAAAAAA;
    dramCtrl = 32'hAAAAAAAA;
    mReg = 16'hAAAA;
    memIsReset_isInReset = 1'h0;
    memc_firstBeat = 1'h0;
    memc_requestCount = 16'hAAAA;
    memc_secondBeat = 1'h0;
    pReg = 16'hAAAA;
    rdReg = 32'hAAAAAAAA;
    rdReg_1 = 32'hAAAAAAAA;
    rdReg_2 = 32'hAAAAAAAA;
    rdReg_3 = 32'hAAAAAAAA;
    respCount = 8'hAA;
    splitReadInFlight = 1'h0;
    wci_wslv_cEdge = 3'h2;
    wci_wslv_cState = 3'h2;
    wci_wslv_ctlAckReg = 1'h0;
    wci_wslv_ctlOpActive = 1'h0;
    wci_wslv_illegalEdge = 1'h0;
    wci_wslv_isReset_isInReset = 1'h0;
    wci_wslv_nState = 3'h2;
    wci_wslv_reqF_countReg = 2'h2;
    wci_wslv_respF_c_r = 2'h2;
    wci_wslv_respF_q_0 = 34'h2AAAAAAAA;
    wci_wslv_respF_q_1 = 34'h2AAAAAAAA;
    wci_wslv_sFlagReg = 1'h0;
    wci_wslv_sThreadBusy_d = 1'h0;
    wdReg = 32'hAAAAAAAA;
    wdReg_1 = 32'hAAAAAAAA;
    wdReg_2 = 32'hAAAAAAAA;
    wdReg_3 = 32'hAAAAAAAA;
    wmemiRdReq = 32'hAAAAAAAA;
    wmemiRdResp = 32'hAAAAAAAA;
    wmemiReadInFlight_value = 8'hAA;
    wmemiWrReq = 32'hAAAAAAAA;
    wmemi_errorSticky = 1'h0;
    wmemi_isReset_isInReset = 1'h0;
    wmemi_operateD = 1'h0;
    wmemi_peerIsReady = 1'h0;
    wmemi_respF_c_r = 2'h2;
    wmemi_respF_q_0 = 131'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wmemi_respF_q_1 = 131'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    wmemi_statusR = 8'hAA;
    wmemi_trafficSticky = 1'h0;
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
	  v__h3715 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3715,
		 wci_wslv_reqF$D_OUT[36:34],
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	begin
	  v__h18461 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	$display("[%0d]: %m: Starting DramWorker dramCtrl:%0x",
		 v__h18461,
		 dramCtrl);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_advance_response && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DramServer_k7.bsv\", line 178, column 90: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_advance_response] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_advance_response && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/DramServer_k7.bsv\", line 178, column 90: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_advance_response] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_advance_response && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/DramServer_k7.bsv\", line 178, column 90: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_advance_response] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_advance_response)
	$display("Error: \"bsv/wrk/DramServer_k7.bsv\", line 178, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_advance_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DramServer_k7.bsv\", line 178, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/DramServer_k7.bsv\", line 178, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/DramServer_k7.bsv\", line 178, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/wrk/DramServer_k7.bsv\", line 178, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and [RL_wci_cfrd] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_advance_response)
	$display("Error: \"bsv/wrk/DramServer_k7.bsv\", line 178, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_advance_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DramServer_k7.bsv\", line 178, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/DramServer_k7.bsv\", line 178, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/DramServer_k7.bsv\", line 178, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DramServer_k7.bsv\", line 178, column 62: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DramServer_k7.bsv\", line 178, column 48: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/DramServer_k7.bsv\", line 178, column 48: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	begin
	  v__h4034 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h4034,
		 wci_wslv_cEdge,
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	begin
	  v__h3890 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h3890,
		 wci_wslv_cEdge,
		 wci_wslv_cState,
		 wci_wslv_nState);
  end
  // synopsys translate_on
endmodule