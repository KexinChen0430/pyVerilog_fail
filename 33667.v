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
       isInReset,
       isReset,
       isTrained,
       wciS0_SThreadBusy,
       wmemiS0_SCmdAccept,
       wmemiS0_SDataAccept,
       wmemiS0_SRespLast;
  // inlined wires
  wire [145 : 0] wmemi_wmemiDh_wget;
  wire [130 : 0] wmemi_respF_x_wire_wget;
  wire [127 : 0] wmemi_Es_mData_w_wget;
  wire [71 : 0] wci_wslv_wciReq_wget;
  wire [51 : 0] wmemi_wmemiReq_wget;
  wire [35 : 0] wmemi_Es_mAddr_w_wget;
  wire [33 : 0] wci_wslv_respF_x_wire_wget;
  wire [31 : 0] wci_wci_Es_mAddr_w_wget, wci_wci_Es_mData_w_wget;
  wire [15 : 0] wmemi_Es_mDataByteEn_w_wget;
  wire [11 : 0] wmemi_Es_mBurstLength_w_wget;
  wire [7 : 0] wmemiReadInFlight_acc_v1_wget, wmemiReadInFlight_acc_v2_wget;
  wire [3 : 0] wci_wci_Es_mByteEn_w_wget;
  wire [2 : 0] wci_wci_Es_mCmd_w_wget,
	       wci_wslv_wEdge_wget,
	       wmemi_Es_mCmd_w_wget;
  wire memInReset_1_wget,
       memInReset_1_whas,
       memc_wdfEnd_wget,
       memc_wdfEnd_whas,
       memc_wdfWren_wget,
       memc_wdfWren_whas,
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
       wmemiReadInFlight_acc_v1_whas,
       wmemiReadInFlight_acc_v2_whas,
       wmemi_Es_mAddr_w_whas,
       wmemi_Es_mBurstLength_w_whas,
       wmemi_Es_mCmd_w_whas,
       wmemi_Es_mDataByteEn_w_whas,
       wmemi_Es_mDataLast_w_whas,
       wmemi_Es_mDataValid_w_whas,
       wmemi_Es_mData_w_whas,
       wmemi_Es_mReqLast_w_whas,
       wmemi_cmdAccept_w_wget,
       wmemi_cmdAccept_w_whas,
       wmemi_dhAccept_w_wget,
       wmemi_dhAccept_w_whas,
       wmemi_operateD_1_wget,
       wmemi_operateD_1_whas,
       wmemi_peerIsReady_1_wget,
       wmemi_peerIsReady_1_whas,
       wmemi_respF_dequeueing_whas,
       wmemi_respF_enqueueing_whas,
       wmemi_respF_x_wire_whas,
       wmemi_wmemiDh_whas,
       wmemi_wmemiReq_whas;
  // register dbgCtrl
  reg [31 : 0] dbgCtrl;
  wire [31 : 0] dbgCtrl_D_IN;
  wire dbgCtrl_EN;
  // register dramCtrl
  reg [31 : 0] dramCtrl;
  wire [31 : 0] dramCtrl_D_IN;
  wire dramCtrl_EN;
  // register mReg
  reg [15 : 0] mReg;
  wire [15 : 0] mReg_D_IN;
  wire mReg_EN;
  // register memInReset
  reg memInReset;
  wire memInReset_D_IN, memInReset_EN;
  // register memIsReset_isInReset
  reg memIsReset_isInReset;
  wire memIsReset_isInReset_D_IN, memIsReset_isInReset_EN;
  // register memc_firstBeat
  reg memc_firstBeat;
  wire memc_firstBeat_D_IN, memc_firstBeat_EN;
  // register memc_requestCount
  reg [15 : 0] memc_requestCount;
  wire [15 : 0] memc_requestCount_D_IN;
  wire memc_requestCount_EN;
  // register memc_responseCount
  reg [15 : 0] memc_responseCount;
  wire [15 : 0] memc_responseCount_D_IN;
  wire memc_responseCount_EN;
  // register memc_secondBeat
  reg memc_secondBeat;
  wire memc_secondBeat_D_IN, memc_secondBeat_EN;
  // register pReg
  reg [15 : 0] pReg;
  wire [15 : 0] pReg_D_IN;
  wire pReg_EN;
  // register pioReadInFlight
  reg pioReadInFlight;
  wire pioReadInFlight_D_IN, pioReadInFlight_EN;
  // register rdReg_0
  reg [31 : 0] rdReg_0;
  wire [31 : 0] rdReg_0_D_IN;
  wire rdReg_0_EN;
  // register rdReg_1
  reg [31 : 0] rdReg_1;
  wire [31 : 0] rdReg_1_D_IN;
  wire rdReg_1_EN;
  // register rdReg_2
  reg [31 : 0] rdReg_2;
  wire [31 : 0] rdReg_2_D_IN;
  wire rdReg_2_EN;
  // register rdReg_3
  reg [31 : 0] rdReg_3;
  wire [31 : 0] rdReg_3_D_IN;
  wire rdReg_3_EN;
  // register respCount
  reg [7 : 0] respCount;
  wire [7 : 0] respCount_D_IN;
  wire respCount_EN;
  // register splitReadInFlight
  reg splitReadInFlight;
  wire splitReadInFlight_D_IN, splitReadInFlight_EN;
  // register uclkUpdateCnt
  reg [31 : 0] uclkUpdateCnt;
  wire [31 : 0] uclkUpdateCnt_D_IN;
  wire uclkUpdateCnt_EN;
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
  // register wdReg_0
  reg [31 : 0] wdReg_0;
  wire [31 : 0] wdReg_0_D_IN;
  wire wdReg_0_EN;
  // register wdReg_1
  reg [31 : 0] wdReg_1;
  wire [31 : 0] wdReg_1_D_IN;
  wire wdReg_1_EN;
  // register wdReg_2
  reg [31 : 0] wdReg_2;
  wire [31 : 0] wdReg_2_D_IN;
  wire wdReg_2_EN;
  // register wdReg_3
  reg [31 : 0] wdReg_3;
  wire [31 : 0] wdReg_3_D_IN;
  wire wdReg_3_EN;
  // register wmemiRdReq
  reg [31 : 0] wmemiRdReq;
  wire [31 : 0] wmemiRdReq_D_IN;
  wire wmemiRdReq_EN;
  // register wmemiRdResp
  reg [31 : 0] wmemiRdResp;
  wire [31 : 0] wmemiRdResp_D_IN;
  wire wmemiRdResp_EN;
  // register wmemiReadInFlight_value
  reg [7 : 0] wmemiReadInFlight_value;
  wire [7 : 0] wmemiReadInFlight_value_D_IN;
  wire wmemiReadInFlight_value_EN;
  // register wmemiWrReq
  reg [31 : 0] wmemiWrReq;
  wire [31 : 0] wmemiWrReq_D_IN;
  wire wmemiWrReq_EN;
  // register wmemi_errorSticky
  reg wmemi_errorSticky;
  wire wmemi_errorSticky_D_IN, wmemi_errorSticky_EN;
  // register wmemi_isReset_isInReset
  reg wmemi_isReset_isInReset;
  wire wmemi_isReset_isInReset_D_IN, wmemi_isReset_isInReset_EN;
  // register wmemi_operateD
  reg wmemi_operateD;
  wire wmemi_operateD_D_IN, wmemi_operateD_EN;
  // register wmemi_peerIsReady
  reg wmemi_peerIsReady;
  wire wmemi_peerIsReady_D_IN, wmemi_peerIsReady_EN;
  // register wmemi_respF_cntr_r
  reg [1 : 0] wmemi_respF_cntr_r;
  wire [1 : 0] wmemi_respF_cntr_r_D_IN;
  wire wmemi_respF_cntr_r_EN;
  // register wmemi_respF_q_0
  reg [130 : 0] wmemi_respF_q_0;
  reg [130 : 0] wmemi_respF_q_0_D_IN;
  wire wmemi_respF_q_0_EN;
  // register wmemi_respF_q_1
  reg [130 : 0] wmemi_respF_q_1;
  reg [130 : 0] wmemi_respF_q_1_D_IN;
  wire wmemi_respF_q_1_EN;
  // register wmemi_statusR
  reg [7 : 0] wmemi_statusR;
  wire [7 : 0] wmemi_statusR_D_IN;
  wire wmemi_statusR_EN;
  // register wmemi_trafficSticky
  reg wmemi_trafficSticky;
  wire wmemi_trafficSticky_D_IN, wmemi_trafficSticky_EN;
  // ports of submodule appFull
  wire appFull_dD_OUT, appFull_sD_IN, appFull_sEN;
  // ports of submodule dbg_cpt_first_edge_cnt
  wire [39 : 0] dbg_cpt_first_edge_cnt_dD_OUT, dbg_cpt_first_edge_cnt_sD_IN;
  wire dbg_cpt_first_edge_cnt_sEN, dbg_cpt_first_edge_cnt_sRDY;
  // ports of submodule dbg_cpt_second_edge_cnt
  wire [39 : 0] dbg_cpt_second_edge_cnt_dD_OUT, dbg_cpt_second_edge_cnt_sD_IN;
  wire dbg_cpt_second_edge_cnt_sEN, dbg_cpt_second_edge_cnt_sRDY;
  // ports of submodule dbg_cpt_tap_cnt
  wire [39 : 0] dbg_cpt_tap_cnt_dD_OUT, dbg_cpt_tap_cnt_sD_IN;
  wire dbg_cpt_tap_cnt_sEN, dbg_cpt_tap_cnt_sRDY;
  // ports of submodule dbg_dq_tap_cnt
  wire [39 : 0] dbg_dq_tap_cnt_dD_OUT, dbg_dq_tap_cnt_sD_IN;
  wire dbg_dq_tap_cnt_sEN, dbg_dq_tap_cnt_sRDY;
  // ports of submodule dbg_dqs_n_tap_cnt
  wire [39 : 0] dbg_dqs_n_tap_cnt_dD_OUT, dbg_dqs_n_tap_cnt_sD_IN;
  wire dbg_dqs_n_tap_cnt_sEN, dbg_dqs_n_tap_cnt_sRDY;
  // ports of submodule dbg_dqs_p_tap_cnt
  wire [39 : 0] dbg_dqs_p_tap_cnt_dD_OUT, dbg_dqs_p_tap_cnt_sD_IN;
  wire dbg_dqs_p_tap_cnt_sEN, dbg_dqs_p_tap_cnt_sRDY;
  // ports of submodule dbg_rd_active_dly
  wire [4 : 0] dbg_rd_active_dly_dD_OUT, dbg_rd_active_dly_sD_IN;
  wire dbg_rd_active_dly_sEN, dbg_rd_active_dly_sRDY;
  // ports of submodule dbg_rd_bitslip_cnt
  wire [23 : 0] dbg_rd_bitslip_cnt_dD_OUT, dbg_rd_bitslip_cnt_sD_IN;
  wire dbg_rd_bitslip_cnt_sEN, dbg_rd_bitslip_cnt_sRDY;
  // ports of submodule dbg_rd_clkdly_cnt
  wire [15 : 0] dbg_rd_clkdly_cnt_dD_OUT, dbg_rd_clkdly_cnt_sD_IN;
  wire dbg_rd_clkdly_cnt_sEN, dbg_rd_clkdly_cnt_sRDY;
  // ports of submodule dbg_rddata
  wire [31 : 0] dbg_rddata_dD_OUT, dbg_rddata_sD_IN;
  wire dbg_rddata_sEN, dbg_rddata_sRDY;
  // ports of submodule dbg_rdlvl_done
  wire [1 : 0] dbg_rdlvl_done_dD_OUT, dbg_rdlvl_done_sD_IN;
  wire dbg_rdlvl_done_sEN, dbg_rdlvl_done_sRDY;
  // ports of submodule dbg_rdlvl_err
  wire [1 : 0] dbg_rdlvl_err_dD_OUT, dbg_rdlvl_err_sD_IN;
  wire dbg_rdlvl_err_sEN, dbg_rdlvl_err_sRDY;
  // ports of submodule dbg_wl_dqs_inverted
  wire [7 : 0] dbg_wl_dqs_inverted_dD_OUT, dbg_wl_dqs_inverted_sD_IN;
  wire dbg_wl_dqs_inverted_sEN, dbg_wl_dqs_inverted_sRDY;
  // ports of submodule dbg_wl_odelay_dq_tap_cnt
  wire [39 : 0] dbg_wl_odelay_dq_tap_cnt_dD_OUT,
		dbg_wl_odelay_dq_tap_cnt_sD_IN;
  wire dbg_wl_odelay_dq_tap_cnt_sEN, dbg_wl_odelay_dq_tap_cnt_sRDY;
  // ports of submodule dbg_wl_odelay_dqs_tap_cnt
  wire [39 : 0] dbg_wl_odelay_dqs_tap_cnt_dD_OUT,
		dbg_wl_odelay_dqs_tap_cnt_sD_IN;
  wire dbg_wl_odelay_dqs_tap_cnt_sEN, dbg_wl_odelay_dqs_tap_cnt_sRDY;
  // ports of submodule dbg_wr_calib_clk_delay
  wire [15 : 0] dbg_wr_calib_clk_delay_dD_OUT, dbg_wr_calib_clk_delay_sD_IN;
  wire dbg_wr_calib_clk_delay_sEN, dbg_wr_calib_clk_delay_sRDY;
  // ports of submodule firBeat
  wire firBeat_dD_OUT, firBeat_sD_IN, firBeat_sEN;
  // ports of submodule initComplete
  wire initComplete_dD_OUT, initComplete_sD_IN, initComplete_sEN;
  // ports of submodule lreqF
  reg [176 : 0] lreqF_sD_IN;
  wire [176 : 0] lreqF_dD_OUT;
  wire lreqF_dDEQ, lreqF_dEMPTY_N, lreqF_sENQ, lreqF_sFULL_N;
  // ports of submodule lrespF
  wire [127 : 0] lrespF_dD_OUT, lrespF_sD_IN;
  wire lrespF_dDEQ, lrespF_dEMPTY_N, lrespF_sENQ, lrespF_sFULL_N;
  // ports of submodule memIsResetCC
  wire memIsResetCC_dD_OUT, memIsResetCC_sD_IN, memIsResetCC_sEN;
  // ports of submodule memc_memc
  wire [255 : 0] memc_memc_app_rd_data, memc_memc_app_wdf_data;
  wire [63 : 0] memc_memc_ddr3_dq;
  wire [39 : 0] memc_memc_dbg_cpt_first_edge_cnt,
		memc_memc_dbg_cpt_second_edge_cnt,
		memc_memc_dbg_cpt_tap_cnt,
		memc_memc_dbg_dq_tap_cnt,
		memc_memc_dbg_dqs_n_tap_cnt,
		memc_memc_dbg_dqs_p_tap_cnt,
		memc_memc_dbg_wl_odelay_dq_tap_cnt,
		memc_memc_dbg_wl_odelay_dqs_tap_cnt;
  wire [32 : 0] memc_memc_app_addr;
  wire [31 : 0] memc_memc_app_wdf_mask, memc_memc_dbg_rddata;
  wire [23 : 0] memc_memc_dbg_rd_bitslip_cnt;
  wire [15 : 0] memc_memc_dbg_rd_clkdly_cnt, memc_memc_dbg_wr_calib_clk_delay;
  wire [12 : 0] memc_memc_ddr3_addr;
  wire [7 : 0] memc_memc_dbg_wl_dqs_inverted,
	       memc_memc_ddr3_dm,
	       memc_memc_ddr3_dqs_n,
	       memc_memc_ddr3_dqs_p;
  wire [4 : 0] memc_memc_dbg_rd_active_dly;
  wire [2 : 0] memc_memc_app_cmd,
	       memc_memc_dbg_inc_dec_sel,
	       memc_memc_ddr3_ba;
  wire [1 : 0] memc_memc_dbg_rdlvl_done, memc_memc_dbg_rdlvl_err;
  wire memc_memc_app_en,
       memc_memc_app_rd_data_end,
       memc_memc_app_rd_data_valid,
       memc_memc_app_rdy,
       memc_memc_app_wdf_end,
       memc_memc_app_wdf_rdy,
       memc_memc_app_wdf_wren,
       memc_memc_dbg_dec_cpt,
       memc_memc_dbg_dec_rd_dqs,
       memc_memc_dbg_inc_cpt,
       memc_memc_dbg_inc_rd_dqs,
       memc_memc_dbg_ocb_mon_off,
       memc_memc_dbg_pd_maintain_0_only,
       memc_memc_dbg_pd_maintain_off,
       memc_memc_dbg_pd_off,
       memc_memc_ddr3_cas_n,
       memc_memc_ddr3_ck_n,
       memc_memc_ddr3_ck_p,
       memc_memc_ddr3_cke,
       memc_memc_ddr3_cs_n,
       memc_memc_ddr3_odt,
       memc_memc_ddr3_ras_n,
       memc_memc_ddr3_reset_n,
       memc_memc_ddr3_we_n,
       memc_memc_phy_init_done,
       memc_memc_tb_clk,
       memc_memc_tb_rst_n;
  // ports of submodule memc_rdpF
  wire [1 : 0] memc_rdpF_D_IN, memc_rdpF_D_OUT;
  wire memc_rdpF_CLR,
       memc_rdpF_DEQ,
       memc_rdpF_EMPTY_N,
       memc_rdpF_ENQ,
       memc_rdpF_FULL_N;
  // ports of submodule memc_reqF
  wire [176 : 0] memc_reqF_D_IN, memc_reqF_D_OUT;
  wire memc_reqF_CLR,
       memc_reqF_DEQ,
       memc_reqF_EMPTY_N,
       memc_reqF_ENQ,
       memc_reqF_FULL_N;
  // ports of submodule memc_respF
  reg [127 : 0] memc_respF_D_IN;
  wire [127 : 0] memc_respF_D_OUT;
  wire memc_respF_CLR,
       memc_respF_DEQ,
       memc_respF_EMPTY_N,
       memc_respF_ENQ,
       memc_respF_FULL_N;
  // ports of submodule memc_rst_stretch_n
  wire memc_rst_stretch_n_OUT_RST;
  // ports of submodule memc_rst_stretch_p
  wire memc_rst_stretch_p_RESET_OUT;
  // ports of submodule requestCount
  wire [15 : 0] requestCount_dD_OUT, requestCount_sD_IN;
  wire requestCount_sEN, requestCount_sRDY;
  // ports of submodule responseCount
  wire [15 : 0] responseCount_dD_OUT, responseCount_sD_IN;
  wire responseCount_sEN, responseCount_sRDY;
  // ports of submodule secBeat
  wire secBeat_dD_OUT, secBeat_sD_IN, secBeat_sEN;
  // ports of submodule splaF
  wire [1 : 0] splaF_D_IN, splaF_D_OUT;
  wire splaF_CLR, splaF_DEQ, splaF_EMPTY_N, splaF_ENQ, splaF_FULL_N;
  // ports of submodule wci_uclkUpdateCnt
  wire [31 : 0] wci_uclkUpdateCnt_dD_OUT, wci_uclkUpdateCnt_sD_IN;
  wire wci_uclkUpdateCnt_sEN, wci_uclkUpdateCnt_sRDY;
  // ports of submodule wci_wslv_reqF
  wire [71 : 0] wci_wslv_reqF_D_IN, wci_wslv_reqF_D_OUT;
  wire wci_wslv_reqF_CLR,
       wci_wslv_reqF_DEQ,
       wci_wslv_reqF_EMPTY_N,
       wci_wslv_reqF_ENQ;
  // ports of submodule wdfFull
  wire wdfFull_dD_OUT, wdfFull_sD_IN, wdfFull_sEN;
  // ports of submodule wmemi_dhF
  wire [145 : 0] wmemi_dhF_D_IN, wmemi_dhF_D_OUT;
  wire wmemi_dhF_CLR,
       wmemi_dhF_DEQ,
       wmemi_dhF_EMPTY_N,
       wmemi_dhF_ENQ,
       wmemi_dhF_FULL_N;
  // ports of submodule wmemi_reqF
  wire [51 : 0] wmemi_reqF_D_IN, wmemi_reqF_D_OUT;
  wire wmemi_reqF_CLR,
       wmemi_reqF_DEQ,
       wmemi_reqF_EMPTY_N,
       wmemi_reqF_ENQ,
       wmemi_reqF_FULL_N;
  // rule scheduling signals
  wire WILL_FIRE_RL_advance_response,
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
  reg [33 : 0] MUX_wci_wslv_respF_q_0_write_1__VAL_2;
  wire [176 : 0] MUX_lreqF_enq_1__VAL_1,
		 MUX_lreqF_enq_1__VAL_2,
		 MUX_lreqF_enq_1__VAL_3;
  wire [130 : 0] MUX_wmemi_respF_q_0_write_1__VAL_1,
		 MUX_wmemi_respF_q_0_write_1__VAL_2,
		 MUX_wmemi_respF_q_1_write_1__VAL_1;
  wire [33 : 0] MUX_wci_wslv_respF_q_0_write_1__VAL_1,
		MUX_wci_wslv_respF_q_1_write_1__VAL_1,
		MUX_wci_wslv_respF_x_wire_wset_1__VAL_1,
		MUX_wci_wslv_respF_x_wire_wset_1__VAL_2,
		MUX_wci_wslv_respF_x_wire_wset_1__VAL_3;
  wire [7 : 0] MUX_wmemiReadInFlight_value_write_1__VAL_2;
  wire [1 : 0] MUX_wci_wslv_respF_cntr_r_write_1__VAL_2,
	       MUX_wmemi_respF_cntr_r_write_1__VAL_2;
  wire MUX_lreqF_enq_1__PSEL_2,
       MUX_lreqF_enq_1__SEL_2,
       MUX_lreqF_enq_1__SEL_3,
       MUX_memc_firstBeat_write_1__SEL_1,
       MUX_memc_secondBeat_write_1__SEL_1,
       MUX_rdReg_0_write_1__SEL_1,
       MUX_rdReg_1_write_1__SEL_1,
       MUX_rdReg_2_write_1__SEL_1,
       MUX_rdReg_3_write_1__SEL_1,
       MUX_splitReadInFlight_write_1__SEL_1,
       MUX_splitReadInFlight_write_1__SEL_2,
       MUX_wci_wslv_illegalEdge_write_1__SEL_1,
       MUX_wci_wslv_illegalEdge_write_1__VAL_1,
       MUX_wci_wslv_respF_q_0_write_1__SEL_1,
       MUX_wci_wslv_respF_q_0_write_1__SEL_2,
       MUX_wci_wslv_respF_q_1_write_1__SEL_1,
       MUX_wci_wslv_respF_q_1_write_1__SEL_2,
       MUX_wci_wslv_respF_x_wire_wset_1__SEL_2,
       MUX_wmemi_respF_q_0_write_1__SEL_1,
       MUX_wmemi_respF_q_0_write_1__SEL_2,
       MUX_wmemi_respF_q_1_write_1__SEL_1,
       MUX_wmemi_respF_q_1_write_1__SEL_2;
  // remaining internal signals
  reg [63 : 0] v__h19683, v__h3583, v__h3758, v__h3902;
  reg [31 : 0] IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674,
	       g_data__h15477,
	       x__h5927,
	       x__h6148;
  reg CASE_x385_0b0_memc_respFFULL_N_0b101_memc_res_ETC__q1;
  wire [175 : 0] IF_wci_wslv_reqF_first__3_BIT_51_52_THEN_pReg__ETC___d503;
  wire [127 : 0] x1_data__h16665, x1_data__h17674;
  wire [31 : 0] dramStatus__h14103,
		g_data__h19141,
		myBE__h5964,
		myBE__h5997,
		rdat___1__h19204,
		rdat___1__h19215,
		rdat___1__h19226,
		rdat___1__h19237,
		rdat___1__h19248,
		rdat___1__h19259,
		rdat___1__h19270,
		rdat___1__h19281,
		rdat___1__h19292,
		rdat___1__h19303,
		rdat___1__h19314,
		rdat___1__h19325,
		rdat___1__h19336,
		rdat___1__h19347,
		rdat___1__h19358,
		rdat___1__h19369,
		rdat___1__h19376,
		rdat___1__h19387,
		rdat___1__h19398,
		rdat___1__h19408,
		rdat___1__h19418,
		rdat___1__h19432,
		rdat___1__h19446,
		rdat___1__h19460,
		rdat___1__h19474,
		rdat___1__h19489,
		rdat___1__h19504,
		rdat___1__h19519,
		rdat___1__h19534,
		rdat___1__h19540,
		rdat___1__h19546,
		rdat___1__h19552,
		x1_addr__h17672;
  wire [15 : 0] x1_be__h17673, x__h19181;
  wire [2 : 0] x__h6385;
  wire [1 : 0] wci_wslv_respF_cntr_r_8_MINUS_1___d27,
	       wmemi_respF_cntr_r_47_MINUS_1___d256;
  wire IF_memc_memc_app_rd_data_end__09_CONCAT_memc_r_ETC___d225,
       IF_wci_wslv_reqF_first__3_BIT_51_52_THEN_lreqF_ETC___d528,
       IF_wmemi_reqF_first__84_BITS_51_TO_49_85_EQ_1__ETC___d393,
       _dfoo1,
       _dfoo3,
       _dfoo5,
       _dfoo7,
       dbg_rd_active_dly_RDY_write__28_AND_dbg_dqs_p__ETC___d340,
       dbg_rdlvl_err_RDY_write__22_AND_dbg_cpt_tap_cn_ETC___d346,
       dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349,
       lrespF_RDY_first__19_AND_NOT_splitReadInFlight_ETC___d437,
       lrespF_RDY_first__19_AND_NOT_wmemi_respF_cntr__ETC___d421,
       wci_wslv_reqF_i_notEmpty__2_AND_IF_wci_wslv_re_ETC___d464,
       wmemiReadInFlight_value_07_SLT_16___d390,
       wmemi_operateD_74_AND_wmemi_peerIsReady_75_76__ETC___d283,
       x1__h12825;
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
  assign wmemiS0_SCmdAccept = wmemi_cmdAccept_w_whas ;
  // value method wmemiS0_sDataAccept
  assign wmemiS0_SDataAccept = wmemi_dhAccept_w_whas ;
  // value method dram_addr
  assign dram_addr = memc_memc_ddr3_addr ;
  // value method dram_ba
  assign dram_ba = memc_memc_ddr3_ba ;
  // value method dram_ras_n
  assign dram_ras_n = memc_memc_ddr3_ras_n ;
  // value method dram_cas_n
  assign dram_cas_n = memc_memc_ddr3_cas_n ;
  // value method dram_we_n
  assign dram_we_n = memc_memc_ddr3_we_n ;
  // value method dram_reset_n
  assign dram_reset_n = memc_memc_ddr3_reset_n ;
  // value method dram_cs_n
  assign dram_cs_n = memc_memc_ddr3_cs_n ;
  // value method dram_odt
  assign dram_odt = memc_memc_ddr3_odt ;
  // value method dram_cke
  assign dram_cke = memc_memc_ddr3_cke ;
  // value method dram_dm
  assign dram_dm = memc_memc_ddr3_dm ;
  // value method dram_ck_p
  assign dram_ck_p = memc_memc_ddr3_ck_p ;
  // value method dram_ck_n
  assign dram_ck_n = memc_memc_ddr3_ck_n ;
  // value method isInReset
  assign isInReset = memInReset ;
  // value method isReset
  assign isReset = memIsResetCC_dD_OUT ;
  // value method isTrained
  assign isTrained = initComplete_dD_OUT ;
  // submodule appFull
  SyncBit #(.init(1'd0)) appFull(.sCLK(memc_memc_tb_clk),
				 .dCLK(wciS0_Clk),
				 .sRST(memc_memc_tb_rst_n),
				 .sD_IN(appFull_sD_IN),
				 .sEN(appFull_sEN),
				 .dD_OUT(appFull_dD_OUT));
  // submodule dbg_cpt_first_edge_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_cpt_first_edge_cnt(.sCLK(memc_memc_tb_clk),
						      .dCLK(wciS0_Clk),
						      .sRST(memc_memc_tb_rst_n),
						      .sD_IN(dbg_cpt_first_edge_cnt_sD_IN),
						      .sEN(dbg_cpt_first_edge_cnt_sEN),
						      .dD_OUT(dbg_cpt_first_edge_cnt_dD_OUT),
						      .sRDY(dbg_cpt_first_edge_cnt_sRDY));
  // submodule dbg_cpt_second_edge_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_cpt_second_edge_cnt(.sCLK(memc_memc_tb_clk),
						       .dCLK(wciS0_Clk),
						       .sRST(memc_memc_tb_rst_n),
						       .sD_IN(dbg_cpt_second_edge_cnt_sD_IN),
						       .sEN(dbg_cpt_second_edge_cnt_sEN),
						       .dD_OUT(dbg_cpt_second_edge_cnt_dD_OUT),
						       .sRDY(dbg_cpt_second_edge_cnt_sRDY));
  // submodule dbg_cpt_tap_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_cpt_tap_cnt(.sCLK(memc_memc_tb_clk),
					       .dCLK(wciS0_Clk),
					       .sRST(memc_memc_tb_rst_n),
					       .sD_IN(dbg_cpt_tap_cnt_sD_IN),
					       .sEN(dbg_cpt_tap_cnt_sEN),
					       .dD_OUT(dbg_cpt_tap_cnt_dD_OUT),
					       .sRDY(dbg_cpt_tap_cnt_sRDY));
  // submodule dbg_dq_tap_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_dq_tap_cnt(.sCLK(memc_memc_tb_clk),
					      .dCLK(wciS0_Clk),
					      .sRST(memc_memc_tb_rst_n),
					      .sD_IN(dbg_dq_tap_cnt_sD_IN),
					      .sEN(dbg_dq_tap_cnt_sEN),
					      .dD_OUT(dbg_dq_tap_cnt_dD_OUT),
					      .sRDY(dbg_dq_tap_cnt_sRDY));
  // submodule dbg_dqs_n_tap_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_dqs_n_tap_cnt(.sCLK(memc_memc_tb_clk),
						 .dCLK(wciS0_Clk),
						 .sRST(memc_memc_tb_rst_n),
						 .sD_IN(dbg_dqs_n_tap_cnt_sD_IN),
						 .sEN(dbg_dqs_n_tap_cnt_sEN),
						 .dD_OUT(dbg_dqs_n_tap_cnt_dD_OUT),
						 .sRDY(dbg_dqs_n_tap_cnt_sRDY));
  // submodule dbg_dqs_p_tap_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_dqs_p_tap_cnt(.sCLK(memc_memc_tb_clk),
						 .dCLK(wciS0_Clk),
						 .sRST(memc_memc_tb_rst_n),
						 .sD_IN(dbg_dqs_p_tap_cnt_sD_IN),
						 .sEN(dbg_dqs_p_tap_cnt_sEN),
						 .dD_OUT(dbg_dqs_p_tap_cnt_dD_OUT),
						 .sRDY(dbg_dqs_p_tap_cnt_sRDY));
  // submodule dbg_rd_active_dly
  SyncRegister #(.width(32'd5),
		 .init(5'd0)) dbg_rd_active_dly(.sCLK(memc_memc_tb_clk),
						.dCLK(wciS0_Clk),
						.sRST(memc_memc_tb_rst_n),
						.sD_IN(dbg_rd_active_dly_sD_IN),
						.sEN(dbg_rd_active_dly_sEN),
						.dD_OUT(dbg_rd_active_dly_dD_OUT),
						.sRDY(dbg_rd_active_dly_sRDY));
  // submodule dbg_rd_bitslip_cnt
  SyncRegister #(.width(32'd24),
		 .init(24'd0)) dbg_rd_bitslip_cnt(.sCLK(memc_memc_tb_clk),
						  .dCLK(wciS0_Clk),
						  .sRST(memc_memc_tb_rst_n),
						  .sD_IN(dbg_rd_bitslip_cnt_sD_IN),
						  .sEN(dbg_rd_bitslip_cnt_sEN),
						  .dD_OUT(dbg_rd_bitslip_cnt_dD_OUT),
						  .sRDY(dbg_rd_bitslip_cnt_sRDY));
  // submodule dbg_rd_clkdly_cnt
  SyncRegister #(.width(32'd16),
		 .init(16'd0)) dbg_rd_clkdly_cnt(.sCLK(memc_memc_tb_clk),
						 .dCLK(wciS0_Clk),
						 .sRST(memc_memc_tb_rst_n),
						 .sD_IN(dbg_rd_clkdly_cnt_sD_IN),
						 .sEN(dbg_rd_clkdly_cnt_sEN),
						 .dD_OUT(dbg_rd_clkdly_cnt_dD_OUT),
						 .sRDY(dbg_rd_clkdly_cnt_sRDY));
  // submodule dbg_rddata
  SyncRegister #(.width(32'd32),
		 .init(32'd0)) dbg_rddata(.sCLK(memc_memc_tb_clk),
					  .dCLK(wciS0_Clk),
					  .sRST(memc_memc_tb_rst_n),
					  .sD_IN(dbg_rddata_sD_IN),
					  .sEN(dbg_rddata_sEN),
					  .dD_OUT(dbg_rddata_dD_OUT),
					  .sRDY(dbg_rddata_sRDY));
  // submodule dbg_rdlvl_done
  SyncRegister #(.width(32'd2),
		 .init(2'd0)) dbg_rdlvl_done(.sCLK(memc_memc_tb_clk),
					     .dCLK(wciS0_Clk),
					     .sRST(memc_memc_tb_rst_n),
					     .sD_IN(dbg_rdlvl_done_sD_IN),
					     .sEN(dbg_rdlvl_done_sEN),
					     .dD_OUT(dbg_rdlvl_done_dD_OUT),
					     .sRDY(dbg_rdlvl_done_sRDY));
  // submodule dbg_rdlvl_err
  SyncRegister #(.width(32'd2),
		 .init(2'd0)) dbg_rdlvl_err(.sCLK(memc_memc_tb_clk),
					    .dCLK(wciS0_Clk),
					    .sRST(memc_memc_tb_rst_n),
					    .sD_IN(dbg_rdlvl_err_sD_IN),
					    .sEN(dbg_rdlvl_err_sEN),
					    .dD_OUT(dbg_rdlvl_err_dD_OUT),
					    .sRDY(dbg_rdlvl_err_sRDY));
  // submodule dbg_wl_dqs_inverted
  SyncRegister #(.width(32'd8),
		 .init(8'd0)) dbg_wl_dqs_inverted(.sCLK(memc_memc_tb_clk),
						  .dCLK(wciS0_Clk),
						  .sRST(memc_memc_tb_rst_n),
						  .sD_IN(dbg_wl_dqs_inverted_sD_IN),
						  .sEN(dbg_wl_dqs_inverted_sEN),
						  .dD_OUT(dbg_wl_dqs_inverted_dD_OUT),
						  .sRDY(dbg_wl_dqs_inverted_sRDY));
  // submodule dbg_wl_odelay_dq_tap_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_wl_odelay_dq_tap_cnt(.sCLK(memc_memc_tb_clk),
							.dCLK(wciS0_Clk),
							.sRST(memc_memc_tb_rst_n),
							.sD_IN(dbg_wl_odelay_dq_tap_cnt_sD_IN),
							.sEN(dbg_wl_odelay_dq_tap_cnt_sEN),
							.dD_OUT(dbg_wl_odelay_dq_tap_cnt_dD_OUT),
							.sRDY(dbg_wl_odelay_dq_tap_cnt_sRDY));
  // submodule dbg_wl_odelay_dqs_tap_cnt
  SyncRegister #(.width(32'd40),
		 .init(40'd0)) dbg_wl_odelay_dqs_tap_cnt(.sCLK(memc_memc_tb_clk),
							 .dCLK(wciS0_Clk),
							 .sRST(memc_memc_tb_rst_n),
							 .sD_IN(dbg_wl_odelay_dqs_tap_cnt_sD_IN),
							 .sEN(dbg_wl_odelay_dqs_tap_cnt_sEN),
							 .dD_OUT(dbg_wl_odelay_dqs_tap_cnt_dD_OUT),
							 .sRDY(dbg_wl_odelay_dqs_tap_cnt_sRDY));
  // submodule dbg_wr_calib_clk_delay
  SyncRegister #(.width(32'd16),
		 .init(16'd0)) dbg_wr_calib_clk_delay(.sCLK(memc_memc_tb_clk),
						      .dCLK(wciS0_Clk),
						      .sRST(memc_memc_tb_rst_n),
						      .sD_IN(dbg_wr_calib_clk_delay_sD_IN),
						      .sEN(dbg_wr_calib_clk_delay_sEN),
						      .dD_OUT(dbg_wr_calib_clk_delay_dD_OUT),
						      .sRDY(dbg_wr_calib_clk_delay_sRDY));
  // submodule firBeat
  SyncBit #(.init(1'd0)) firBeat(.sCLK(memc_memc_tb_clk),
				 .dCLK(wciS0_Clk),
				 .sRST(memc_memc_tb_rst_n),
				 .sD_IN(firBeat_sD_IN),
				 .sEN(firBeat_sEN),
				 .dD_OUT(firBeat_dD_OUT));
  // submodule initComplete
  SyncBit #(.init(1'd0)) initComplete(.sCLK(memc_memc_tb_clk),
				      .dCLK(wciS0_Clk),
				      .sRST(memc_memc_tb_rst_n),
				      .sD_IN(initComplete_sD_IN),
				      .sEN(initComplete_sEN),
				      .dD_OUT(initComplete_dD_OUT));
  // submodule lreqF
  SyncFIFO #(.dataWidth(32'd177),
	     .depth(32'd2),
	     .indxWidth(32'd1)) lreqF(.sCLK(wciS0_Clk),
				      .dCLK(memc_memc_tb_clk),
				      .sRST(wciS0_MReset_n),
				      .sD_IN(lreqF_sD_IN),
				      .sENQ(lreqF_sENQ),
				      .dDEQ(lreqF_dDEQ),
				      .dD_OUT(lreqF_dD_OUT),
				      .sFULL_N(lreqF_sFULL_N),
				      .dEMPTY_N(lreqF_dEMPTY_N));
  // submodule lrespF
  SyncFIFO #(.dataWidth(32'd128),
	     .depth(32'd2),
	     .indxWidth(32'd1)) lrespF(.sCLK(memc_memc_tb_clk),
				       .dCLK(wciS0_Clk),
				       .sRST(memc_memc_tb_rst_n),
				       .sD_IN(lrespF_sD_IN),
				       .sENQ(lrespF_sENQ),
				       .dDEQ(lrespF_dDEQ),
				       .dD_OUT(lrespF_dD_OUT),
				       .sFULL_N(lrespF_sFULL_N),
				       .dEMPTY_N(lrespF_dEMPTY_N));
  // submodule memIsResetCC
  SyncBit #(.init(1'd0)) memIsResetCC(.sCLK(memc_memc_tb_clk),
				      .dCLK(wciS0_Clk),
				      .sRST(memc_memc_tb_rst_n),
				      .sD_IN(memIsResetCC_sD_IN),
				      .sEN(memIsResetCC_sEN),
				      .dD_OUT(memIsResetCC_dD_OUT));
  // submodule memc_memc
  v6_mig37 memc_memc(.sys_rst(memc_rst_stretch_p_RESET_OUT),
		     .clk_ref(CLK_sys0_clk),
		     .clk_sys(CLK_sys0_clk),
		     .app_addr(memc_memc_app_addr),
		     .app_cmd(memc_memc_app_cmd),
		     .app_wdf_data(memc_memc_app_wdf_data),
		     .app_wdf_end(memc_memc_app_wdf_end),
		     .app_wdf_mask(memc_memc_app_wdf_mask),
		     .dbg_dec_cpt(memc_memc_dbg_dec_cpt),
		     .dbg_dec_rd_dqs(memc_memc_dbg_dec_rd_dqs),
		     .dbg_inc_cpt(memc_memc_dbg_inc_cpt),
		     .dbg_inc_dec_sel(memc_memc_dbg_inc_dec_sel),
		     .dbg_inc_rd_dqs(memc_memc_dbg_inc_rd_dqs),
		     .dbg_ocb_mon_off(memc_memc_dbg_ocb_mon_off),
		     .dbg_pd_maintain_0_only(memc_memc_dbg_pd_maintain_0_only),
		     .dbg_pd_maintain_off(memc_memc_dbg_pd_maintain_off),
		     .dbg_pd_off(memc_memc_dbg_pd_off),
		     .app_en(memc_memc_app_en),
		     .app_wdf_wren(memc_memc_app_wdf_wren),
		     .ddr3_addr(memc_memc_ddr3_addr),
		     .ddr3_ba(memc_memc_ddr3_ba),
		     .ddr3_ras_n(memc_memc_ddr3_ras_n),
		     .ddr3_cas_n(memc_memc_ddr3_cas_n),
		     .ddr3_we_n(memc_memc_ddr3_we_n),
		     .ddr3_reset_n(memc_memc_ddr3_reset_n),
		     .ddr3_cs_n(memc_memc_ddr3_cs_n),
		     .ddr3_odt(memc_memc_ddr3_odt),
		     .ddr3_cke(memc_memc_ddr3_cke),
		     .ddr3_dm(memc_memc_ddr3_dm),
		     .ddr3_ck_p(memc_memc_ddr3_ck_p),
		     .ddr3_ck_n(memc_memc_ddr3_ck_n),
		     .app_rdy(memc_memc_app_rdy),
		     .app_wdf_rdy(memc_memc_app_wdf_rdy),
		     .app_rd_data(memc_memc_app_rd_data),
		     .app_rd_data_end(memc_memc_app_rd_data_end),
		     .app_rd_data_valid(memc_memc_app_rd_data_valid),
		     .phy_init_done(memc_memc_phy_init_done),
		     .dbg_wl_dqs_inverted(memc_memc_dbg_wl_dqs_inverted),
		     .dbg_wr_calib_clk_delay(memc_memc_dbg_wr_calib_clk_delay),
		     .dbg_wl_odelay_dqs_tap_cnt(memc_memc_dbg_wl_odelay_dqs_tap_cnt),
		     .dbg_wl_odelay_dq_tap_cnt(memc_memc_dbg_wl_odelay_dq_tap_cnt),
		     .dbg_rdlvl_done(memc_memc_dbg_rdlvl_done),
		     .dbg_rdlvl_err(memc_memc_dbg_rdlvl_err),
		     .dbg_cpt_tap_cnt(memc_memc_dbg_cpt_tap_cnt),
		     .dbg_cpt_first_edge_cnt(memc_memc_dbg_cpt_first_edge_cnt),
		     .dbg_cpt_second_edge_cnt(memc_memc_dbg_cpt_second_edge_cnt),
		     .dbg_rd_bitslip_cnt(memc_memc_dbg_rd_bitslip_cnt),
		     .dbg_rd_clkdly_cnt(memc_memc_dbg_rd_clkdly_cnt),
		     .dbg_rd_active_dly(memc_memc_dbg_rd_active_dly),
		     .dbg_dqs_p_tap_cnt(memc_memc_dbg_dqs_p_tap_cnt),
		     .dbg_dqs_n_tap_cnt(memc_memc_dbg_dqs_n_tap_cnt),
		     .dbg_dq_tap_cnt(memc_memc_dbg_dq_tap_cnt),
		     .dbg_rddata(memc_memc_dbg_rddata),
		     .tb_clk(memc_memc_tb_clk),
		     .tb_rst_n(memc_memc_tb_rst_n),
		     .ddr3_dq(dram_io_dq),
		     .ddr3_dqs_p(dram_io_dqs_p),
		     .ddr3_dqs_n(dram_io_dqs_n));
  // submodule memc_rdpF
  arSRLFIFOD #(.width(32'd2),
	       .l2depth(32'd4)) memc_rdpF(.CLK(memc_memc_tb_clk),
					  .RST_N(memc_memc_tb_rst_n),
					  .D_IN(memc_rdpF_D_IN),
					  .DEQ(memc_rdpF_DEQ),
					  .ENQ(memc_rdpF_ENQ),
					  .CLR(memc_rdpF_CLR),
					  .D_OUT(memc_rdpF_D_OUT),
					  .EMPTY_N(memc_rdpF_EMPTY_N),
					  .FULL_N(memc_rdpF_FULL_N));
  // submodule memc_reqF
  FIFO2 #(.width(32'd177),
	  .guarded(32'd1)) memc_reqF(.RST(memc_memc_tb_rst_n),
				     .CLK(memc_memc_tb_clk),
				     .D_IN(memc_reqF_D_IN),
				     .ENQ(memc_reqF_ENQ),
				     .DEQ(memc_reqF_DEQ),
				     .CLR(memc_reqF_CLR),
				     .D_OUT(memc_reqF_D_OUT),
				     .FULL_N(memc_reqF_FULL_N),
				     .EMPTY_N(memc_reqF_EMPTY_N));
  // submodule memc_respF
  arSRLFIFOD #(.width(32'd128),
	       .l2depth(32'd4)) memc_respF(.CLK(memc_memc_tb_clk),
					   .RST_N(memc_memc_tb_rst_n),
					   .D_IN(memc_respF_D_IN),
					   .DEQ(memc_respF_DEQ),
					   .ENQ(memc_respF_ENQ),
					   .CLR(memc_respF_CLR),
					   .D_OUT(memc_respF_D_OUT),
					   .EMPTY_N(memc_respF_EMPTY_N),
					   .FULL_N(memc_respF_FULL_N));
  // submodule memc_rst_stretch_n
  SyncResetA #(.RSTDELAY(32'd15)) memc_rst_stretch_n(.CLK(CLK_sys0_clk),
						     .IN_RST(wciS0_MReset_n),
						     .OUT_RST(memc_rst_stretch_n_OUT_RST));
  // submodule memc_rst_stretch_p
  ResetInverter memc_rst_stretch_p(.RESET_IN(memc_rst_stretch_n_OUT_RST),
				   .RESET_OUT(memc_rst_stretch_p_RESET_OUT));
  // submodule requestCount
  SyncRegister #(.width(32'd16),
		 .init(16'd0)) requestCount(.sCLK(memc_memc_tb_clk),
					    .dCLK(wciS0_Clk),
					    .sRST(memc_memc_tb_rst_n),
					    .sD_IN(requestCount_sD_IN),
					    .sEN(requestCount_sEN),
					    .dD_OUT(requestCount_dD_OUT),
					    .sRDY(requestCount_sRDY));
  // submodule responseCount
  SyncRegister #(.width(32'd16),
		 .init(16'd0)) responseCount(.sCLK(memc_memc_tb_clk),
					     .dCLK(wciS0_Clk),
					     .sRST(memc_memc_tb_rst_n),
					     .sD_IN(responseCount_sD_IN),
					     .sEN(responseCount_sEN),
					     .dD_OUT(responseCount_dD_OUT),
					     .sRDY(responseCount_sRDY));
  // submodule secBeat
  SyncBit #(.init(1'd0)) secBeat(.sCLK(memc_memc_tb_clk),
				 .dCLK(wciS0_Clk),
				 .sRST(memc_memc_tb_rst_n),
				 .sD_IN(secBeat_sD_IN),
				 .sEN(secBeat_sEN),
				 .dD_OUT(secBeat_dD_OUT));
  // submodule splaF
  arSRLFIFOD #(.width(32'd2), .l2depth(32'd4)) splaF(.CLK(wciS0_Clk),
						     .RST_N(wciS0_MReset_n),
						     .D_IN(splaF_D_IN),
						     .DEQ(splaF_DEQ),
						     .ENQ(splaF_ENQ),
						     .CLR(splaF_CLR),
						     .D_OUT(splaF_D_OUT),
						     .EMPTY_N(splaF_EMPTY_N),
						     .FULL_N(splaF_FULL_N));
  // submodule wci_uclkUpdateCnt
  SyncRegister #(.width(32'd32),
		 .init(32'd0)) wci_uclkUpdateCnt(.sCLK(memc_memc_tb_clk),
						 .dCLK(wciS0_Clk),
						 .sRST(memc_memc_tb_rst_n),
						 .sD_IN(wci_uclkUpdateCnt_sD_IN),
						 .sEN(wci_uclkUpdateCnt_sEN),
						 .dD_OUT(wci_uclkUpdateCnt_dD_OUT),
						 .sRDY(wci_uclkUpdateCnt_sRDY));
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
  // submodule wdfFull
  SyncBit #(.init(1'd0)) wdfFull(.sCLK(memc_memc_tb_clk),
				 .dCLK(wciS0_Clk),
				 .sRST(memc_memc_tb_rst_n),
				 .sD_IN(wdfFull_sD_IN),
				 .sEN(wdfFull_sEN),
				 .dD_OUT(wdfFull_dD_OUT));
  // submodule wmemi_dhF
  FIFO2 #(.width(32'd146), .guarded(32'd1)) wmemi_dhF(.RST(wciS0_MReset_n),
						      .CLK(wciS0_Clk),
						      .D_IN(wmemi_dhF_D_IN),
						      .ENQ(wmemi_dhF_ENQ),
						      .DEQ(wmemi_dhF_DEQ),
						      .CLR(wmemi_dhF_CLR),
						      .D_OUT(wmemi_dhF_D_OUT),
						      .FULL_N(wmemi_dhF_FULL_N),
						      .EMPTY_N(wmemi_dhF_EMPTY_N));
  // submodule wmemi_reqF
  FIFO2 #(.width(32'd52), .guarded(32'd1)) wmemi_reqF(.RST(wciS0_MReset_n),
						      .CLK(wciS0_Clk),
						      .D_IN(wmemi_reqF_D_IN),
						      .ENQ(wmemi_reqF_ENQ),
						      .DEQ(wmemi_reqF_DEQ),
						      .CLR(wmemi_reqF_CLR),
						      .D_OUT(wmemi_reqF_D_OUT),
						      .FULL_N(wmemi_reqF_FULL_N),
						      .EMPTY_N(wmemi_reqF_EMPTY_N));
  // rule RL_advance_response
  assign WILL_FIRE_RL_advance_response =
	     lrespF_dEMPTY_N &&
	     lrespF_RDY_first__19_AND_NOT_splitReadInFlight_ETC___d437 &&
	     !wci_wslv_wci_cfwr_pw_whas &&
	     wmemiReadInFlight_value == 8'd0 &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_cfwr
  assign WILL_FIRE_RL_wci_cfwr =
	     wci_wslv_respF_cntr_r != 2'd2 &&
	     wci_wslv_reqF_i_notEmpty__2_AND_IF_wci_wslv_re_ETC___d464 &&
	     wci_wslv_wci_cfwr_pw_whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_cfrd
  assign WILL_FIRE_RL_wci_cfrd =
	     wci_wslv_reqF_EMPTY_N &&
	     IF_wci_wslv_reqF_first__3_BIT_51_52_THEN_lreqF_ETC___d528 &&
	     wci_wslv_wci_cfrd_pw_whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_wslv_ctl_op_start
  assign WILL_FIRE_RL_wci_wslv_ctl_op_start =
	     wci_wslv_reqF_EMPTY_N && wci_wslv_wci_ctrl_pw_whas &&
	     !WILL_FIRE_RL_wci_wslv_ctl_op_complete ;
  // rule RL_wci_ctrl_EiI
  assign WILL_FIRE_RL_wci_ctrl_EiI =
	     wci_wslv_wci_ctrl_pw_whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd0 &&
	     wci_wslv_reqF_D_OUT[36:34] == 3'd0 ;
  // rule RL_wci_ctrl_OrE
  assign WILL_FIRE_RL_wci_ctrl_OrE =
	     wci_wslv_wci_ctrl_pw_whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd2 &&
	     wci_wslv_reqF_D_OUT[36:34] == 3'd3 ;
  // rule RL_memc_advance_readData
  assign WILL_FIRE_RL_memc_advance_readData =
	     memc_rdpF_EMPTY_N &&
	     IF_memc_memc_app_rd_data_end__09_CONCAT_memc_r_ETC___d225 &&
	     memc_memc_phy_init_done &&
	     memc_memc_app_rd_data_valid ;
  // rule RL_memc_advance_request
  assign WILL_FIRE_RL_memc_advance_request =
	     memc_reqF_EMPTY_N &&
	     (x1__h12825 || !memc_reqF_D_OUT[176] || memc_rdpF_FULL_N) &&
	     memc_memc_phy_init_done &&
	     !memc_firstBeat &&
	     !memc_secondBeat ;
  // rule RL_memc_advance_write0
  assign WILL_FIRE_RL_memc_advance_write0 =
	     memc_reqF_EMPTY_N && memc_memc_phy_init_done && memc_firstBeat &&
	     !memc_secondBeat ;
  // rule RL_memc_advance_write1
  assign WILL_FIRE_RL_memc_advance_write1 =
	     memc_reqF_EMPTY_N && memc_memc_phy_init_done &&
	     !memc_firstBeat &&
	     memc_secondBeat ;
  // rule RL_wmemi_respF_incCtr
  assign WILL_FIRE_RL_wmemi_respF_incCtr =
	     wmemi_respF_enqueueing_whas && wmemi_respF_enqueueing_whas &&
	     !(wmemi_respF_cntr_r != 2'd0) ;
  // rule RL_wmemi_respF_decCtr
  assign WILL_FIRE_RL_wmemi_respF_decCtr =
	     wmemi_respF_cntr_r != 2'd0 && !wmemi_respF_enqueueing_whas ;
  // rule RL_wmemi_respF_both
  assign WILL_FIRE_RL_wmemi_respF_both =
	     wmemi_respF_enqueueing_whas && wmemi_respF_cntr_r != 2'd0 &&
	     wmemi_respF_enqueueing_whas ;
  // rule RL_wci_ctrl_IsO
  assign WILL_FIRE_RL_wci_ctrl_IsO =
	     wci_wslv_wci_ctrl_pw_whas &&
	     WILL_FIRE_RL_wci_wslv_ctl_op_start &&
	     wci_wslv_cState == 3'd1 &&
	     wci_wslv_reqF_D_OUT[36:34] == 3'd1 ;
  // rule RL_wci_wslv_ctl_op_complete
  assign WILL_FIRE_RL_wci_wslv_ctl_op_complete =
	     wci_wslv_respF_cntr_r != 2'd2 && wci_wslv_ctlOpActive &&
	     wci_wslv_ctlAckReg ;
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
  // inputs to muxes for submodule ports
  assign MUX_lreqF_enq_1__PSEL_2 =
	     wmemi_operateD && wmemi_peerIsReady && wmemi_reqF_EMPTY_N &&
	     IF_wmemi_reqF_first__84_BITS_51_TO_49_85_EQ_1__ETC___d393 &&
	     !wci_wslv_wci_cfwr_pw_whas &&
	     !wci_wslv_wci_cfrd_pw_whas ;
  assign MUX_lreqF_enq_1__SEL_2 =
	     MUX_lreqF_enq_1__PSEL_2 &&
	     (wmemi_reqF_D_OUT[51:49] == 3'd1 ||
	      wmemiReadInFlight_value_07_SLT_16___d390) ;
  assign MUX_lreqF_enq_1__SEL_3 =
	     WILL_FIRE_RL_wci_cfwr &&
	     (wci_wslv_reqF_D_OUT[51] ||
	      wci_wslv_reqF_D_OUT[39:32] == 8'h54 ||
	      wci_wslv_reqF_D_OUT[39:32] == 8'h58) ;
  assign MUX_memc_firstBeat_write_1__SEL_1 =
	     WILL_FIRE_RL_memc_advance_write0 && memc_memc_app_wdf_rdy ;
  assign MUX_memc_secondBeat_write_1__SEL_1 =
	     WILL_FIRE_RL_memc_advance_write1 && memc_memc_app_wdf_rdy ;
  assign MUX_rdReg_0_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF_D_OUT[51] &&
	     wci_wslv_reqF_D_OUT[39:32] == 8'h80 ;
  assign MUX_rdReg_1_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF_D_OUT[51] &&
	     wci_wslv_reqF_D_OUT[39:32] == 8'h84 ;
  assign MUX_rdReg_2_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF_D_OUT[51] &&
	     wci_wslv_reqF_D_OUT[39:32] == 8'h88 ;
  assign MUX_rdReg_3_write_1__SEL_1 =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF_D_OUT[51] &&
	     wci_wslv_reqF_D_OUT[39:32] == 8'h8C ;
  assign MUX_splitReadInFlight_write_1__SEL_1 =
	     WILL_FIRE_RL_advance_response && splitReadInFlight ;
  assign MUX_splitReadInFlight_write_1__SEL_2 =
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[51] ;
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
  assign MUX_wci_wslv_respF_x_wire_wset_1__SEL_2 =
	     WILL_FIRE_RL_wci_cfrd && !wci_wslv_reqF_D_OUT[51] ;
  assign MUX_wmemi_respF_q_0_write_1__SEL_1 =
	     WILL_FIRE_RL_wmemi_respF_both && _dfoo7 ;
  assign MUX_wmemi_respF_q_0_write_1__SEL_2 =
	     WILL_FIRE_RL_wmemi_respF_incCtr && wmemi_respF_cntr_r == 2'd0 ;
  assign MUX_wmemi_respF_q_1_write_1__SEL_1 =
	     WILL_FIRE_RL_wmemi_respF_both && _dfoo5 ;
  assign MUX_wmemi_respF_q_1_write_1__SEL_2 =
	     WILL_FIRE_RL_wmemi_respF_incCtr && wmemi_respF_cntr_r == 2'd1 ;
  assign MUX_lreqF_enq_1__VAL_1 =
	     { 1'd1,
	       x1_addr__h17672,
	       144'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA } ;
  assign MUX_lreqF_enq_1__VAL_2 =
	     { wmemi_reqF_D_OUT[51:49] != 3'd1,
	       (wmemi_reqF_D_OUT[51:49] == 3'd1) ?
		 { wmemi_reqF_D_OUT[43:12],
		   wmemi_dhF_D_OUT[15:0],
		   wmemi_dhF_D_OUT[143:16] } :
		 { wmemi_reqF_D_OUT[43:0],
		   132'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA } } ;
  assign MUX_lreqF_enq_1__VAL_3 =
	     { !wci_wslv_reqF_D_OUT[51] &&
	       wci_wslv_reqF_D_OUT[39:32] != 8'h54,
	       IF_wci_wslv_reqF_first__3_BIT_51_52_THEN_pReg__ETC___d503 } ;
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
  always@(MUX_splitReadInFlight_write_1__SEL_1 or
	  MUX_wci_wslv_respF_x_wire_wset_1__VAL_1 or
	  MUX_wci_wslv_respF_x_wire_wset_1__SEL_2 or
	  MUX_wci_wslv_respF_x_wire_wset_1__VAL_2 or
	  WILL_FIRE_RL_wci_wslv_ctl_op_complete or
	  MUX_wci_wslv_respF_x_wire_wset_1__VAL_3 or WILL_FIRE_RL_wci_cfwr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_splitReadInFlight_write_1__SEL_1:
	  MUX_wci_wslv_respF_q_0_write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire_wset_1__VAL_1;
      MUX_wci_wslv_respF_x_wire_wset_1__SEL_2:
	  MUX_wci_wslv_respF_q_0_write_1__VAL_2 =
	      MUX_wci_wslv_respF_x_wire_wset_1__VAL_2;
      WILL_FIRE_RL_wci_wslv_ctl_op_complete:
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
  assign MUX_wci_wslv_respF_x_wire_wset_1__VAL_1 = { 2'd1, g_data__h15477 } ;
  assign MUX_wci_wslv_respF_x_wire_wset_1__VAL_2 = { 2'd1, g_data__h19141 } ;
  assign MUX_wci_wslv_respF_x_wire_wset_1__VAL_3 =
	     wci_wslv_illegalEdge ? 34'h3C0DE4202 : 34'h1C0DE4201 ;
  assign MUX_wmemiReadInFlight_value_write_1__VAL_2 =
	     wmemiReadInFlight_value +
	     (wmemiReadInFlight_acc_v1_whas ? 8'd1 : 8'd0) +
	     (wmemi_respF_enqueueing_whas ? 8'd255 : 8'd0) ;
  assign MUX_wmemi_respF_cntr_r_write_1__VAL_2 = wmemi_respF_cntr_r + 2'd1 ;
  assign MUX_wmemi_respF_q_0_write_1__VAL_1 =
	     (wmemi_respF_cntr_r == 2'd1) ?
	       MUX_wmemi_respF_q_0_write_1__VAL_2 :
	       wmemi_respF_q_1 ;
  assign MUX_wmemi_respF_q_0_write_1__VAL_2 = { 3'd3, lrespF_dD_OUT } ;
  assign MUX_wmemi_respF_q_1_write_1__VAL_1 =
	     (wmemi_respF_cntr_r == 2'd2) ?
	       MUX_wmemi_respF_q_0_write_1__VAL_2 :
	       131'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ;
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
	     WILL_FIRE_RL_advance_response && splitReadInFlight ||
	     WILL_FIRE_RL_wci_cfrd && !wci_wslv_reqF_D_OUT[51] ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_complete ||
	     WILL_FIRE_RL_wci_cfwr ;
  assign wci_wslv_wEdge_wget = wci_wslv_reqF_D_OUT[36:34] ;
  assign wci_wslv_wEdge_whas = WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_sFlagReg_1_wget = 1'b0 ;
  assign wci_wslv_sFlagReg_1_whas = 1'b0 ;
  assign wci_wslv_ctlAckReg_1_wget = 1'd1 ;
  assign wci_wslv_ctlAckReg_1_whas =
	     WILL_FIRE_RL_wci_ctrl_OrE || WILL_FIRE_RL_wci_ctrl_IsO ||
	     WILL_FIRE_RL_wci_ctrl_EiI ;
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
  assign memc_wdfWren_wget = 1'd1 ;
  assign memc_wdfWren_whas =
	     WILL_FIRE_RL_memc_advance_write1 ||
	     WILL_FIRE_RL_memc_advance_write0 ;
  assign memc_wdfEnd_wget = 1'd1 ;
  assign memc_wdfEnd_whas = WILL_FIRE_RL_memc_advance_write1 ;
  assign wmemi_wmemiReq_wget =
	     { wmemiS0_MCmd,
	       wmemiS0_MReqLast,
	       wmemiS0_MAddr,
	       wmemiS0_MBurstLength } ;
  assign wmemi_wmemiReq_whas = 1'd1 ;
  assign wmemi_wmemiDh_wget =
	     { wmemiS0_MDataValid,
	       wmemiS0_MDataLast,
	       wmemiS0_MData,
	       wmemiS0_MDataByteEn } ;
  assign wmemi_wmemiDh_whas = 1'd1 ;
  assign wmemi_cmdAccept_w_wget = 1'd1 ;
  assign wmemi_cmdAccept_w_whas =
	     wmemi_reqF_FULL_N &&
	     wmemi_operateD_74_AND_wmemi_peerIsReady_75_76__ETC___d283 ;
  assign wmemi_dhAccept_w_wget = 1'd1 ;
  assign wmemi_dhAccept_w_whas =
	     wmemi_dhF_FULL_N && wmemi_operateD && wmemi_peerIsReady &&
	     wmemi_wmemiDh_wget[145] &&
	     wmemi_dhF_FULL_N ;
  assign wmemi_respF_x_wire_wget = MUX_wmemi_respF_q_0_write_1__VAL_2 ;
  assign wmemi_respF_x_wire_whas = wmemi_respF_enqueueing_whas ;
  assign wmemi_operateD_1_wget = 1'd1 ;
  assign wmemi_operateD_1_whas = wci_wslv_cState == 3'd2 ;
  assign wmemi_peerIsReady_1_wget = 1'd1 ;
  assign wmemi_peerIsReady_1_whas = wmemiS0_MReset_n ;
  assign memInReset_1_wget = 1'd0 ;
  assign memInReset_1_whas = 1'd1 ;
  assign wmemiReadInFlight_acc_v1_wget = 8'd1 ;
  assign wmemiReadInFlight_acc_v1_whas =
	     MUX_lreqF_enq_1__PSEL_2 && wmemi_reqF_D_OUT[51:49] != 3'd1 &&
	     wmemiReadInFlight_value_07_SLT_16___d390 ;
  assign wmemiReadInFlight_acc_v2_wget = 8'd255 ;
  assign wmemiReadInFlight_acc_v2_whas = wmemi_respF_enqueueing_whas ;
  assign wmemi_Es_mCmd_w_wget = wmemiS0_MCmd ;
  assign wmemi_Es_mCmd_w_whas = 1'd1 ;
  assign wmemi_Es_mAddr_w_wget = wmemiS0_MAddr ;
  assign wmemi_Es_mAddr_w_whas = 1'd1 ;
  assign wmemi_Es_mBurstLength_w_wget = wmemiS0_MBurstLength ;
  assign wmemi_Es_mBurstLength_w_whas = 1'd1 ;
  assign wmemi_Es_mData_w_wget = wmemiS0_MData ;
  assign wmemi_Es_mData_w_whas = 1'd1 ;
  assign wmemi_Es_mDataByteEn_w_wget = wmemiS0_MDataByteEn ;
  assign wmemi_Es_mDataByteEn_w_whas = 1'd1 ;
  assign wci_wslv_reqF_r_enq_whas = wci_wslv_wciReq_wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF_r_deq_whas =
	     WILL_FIRE_RL_wci_cfrd || WILL_FIRE_RL_wci_cfwr ||
	     WILL_FIRE_RL_wci_wslv_ctl_op_start ;
  assign wci_wslv_reqF_r_clr_whas = 1'b0 ;
  assign wci_wslv_respF_enqueueing_whas =
	     WILL_FIRE_RL_advance_response && splitReadInFlight ||
	     WILL_FIRE_RL_wci_cfrd && !wci_wslv_reqF_D_OUT[51] ||
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
  assign wmemi_respF_enqueueing_whas =
	     lrespF_dEMPTY_N &&
	     lrespF_RDY_first__19_AND_NOT_wmemi_respF_cntr__ETC___d421 &&
	     (wmemiReadInFlight_value ^ 8'h80) > 8'd128 ;
  assign wmemi_respF_dequeueing_whas = wmemi_respF_cntr_r != 2'd0 ;
  assign wmemi_Es_mReqLast_w_whas = wmemiS0_MReqLast ;
  assign wmemi_Es_mDataValid_w_whas = wmemiS0_MDataValid ;
  assign wmemi_Es_mDataLast_w_whas = wmemiS0_MDataLast ;
  // register dbgCtrl
  assign dbgCtrl_D_IN = 32'h0 ;
  assign dbgCtrl_EN = 1'b0 ;
  // register dramCtrl
  assign dramCtrl_D_IN = wci_wslv_reqF_D_OUT[31:0] ;
  assign dramCtrl_EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF_D_OUT[51] &&
	     wci_wslv_reqF_D_OUT[39:32] == 8'h04 ;
  // register mReg
  assign mReg_D_IN = wci_wslv_reqF_D_OUT[15:0] ;
  assign mReg_EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF_D_OUT[51] &&
	     wci_wslv_reqF_D_OUT[39:32] == 8'h5C ;
  // register memInReset
  assign memInReset_D_IN = 1'b0 ;
  assign memInReset_EN = 1'd1 ;
  // register memIsReset_isInReset
  assign memIsReset_isInReset_D_IN = 1'd0 ;
  assign memIsReset_isInReset_EN = memIsReset_isInReset ;
  // register memc_firstBeat
  assign memc_firstBeat_D_IN = !MUX_memc_firstBeat_write_1__SEL_1 ;
  assign memc_firstBeat_EN =
	     WILL_FIRE_RL_memc_advance_write0 && memc_memc_app_wdf_rdy ||
	     WILL_FIRE_RL_memc_advance_request && memc_memc_app_rdy &&
	     !memc_reqF_D_OUT[176] ;
  // register memc_requestCount
  assign memc_requestCount_D_IN = memc_requestCount + 16'd1 ;
  assign memc_requestCount_EN =
	     WILL_FIRE_RL_memc_advance_request && memc_memc_app_rdy ;
  // register memc_responseCount
  assign memc_responseCount_D_IN = memc_responseCount + 16'd1 ;
  assign memc_responseCount_EN = WILL_FIRE_RL_memc_advance_readData ;
  // register memc_secondBeat
  assign memc_secondBeat_D_IN = !MUX_memc_secondBeat_write_1__SEL_1 ;
  assign memc_secondBeat_EN =
	     WILL_FIRE_RL_memc_advance_write1 && memc_memc_app_wdf_rdy ||
	     WILL_FIRE_RL_memc_advance_write0 && memc_memc_app_wdf_rdy ;
  // register pReg
  assign pReg_D_IN = wci_wslv_reqF_D_OUT[15:0] ;
  assign pReg_EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF_D_OUT[51] &&
	     wci_wslv_reqF_D_OUT[39:32] == 8'h50 ;
  // register pioReadInFlight
  assign pioReadInFlight_D_IN = 1'b0 ;
  assign pioReadInFlight_EN = 1'b0 ;
  // register rdReg_0
  assign rdReg_0_D_IN =
	     MUX_rdReg_0_write_1__SEL_1 ?
	       wci_wslv_reqF_D_OUT[31:0] :
	       lrespF_dD_OUT[31:0] ;
  assign rdReg_0_EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF_D_OUT[51] &&
	     wci_wslv_reqF_D_OUT[39:32] == 8'h80 ||
	     WILL_FIRE_RL_advance_response ;
  // register rdReg_1
  assign rdReg_1_D_IN =
	     MUX_rdReg_1_write_1__SEL_1 ?
	       wci_wslv_reqF_D_OUT[31:0] :
	       lrespF_dD_OUT[63:32] ;
  assign rdReg_1_EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF_D_OUT[51] &&
	     wci_wslv_reqF_D_OUT[39:32] == 8'h84 ||
	     WILL_FIRE_RL_advance_response ;
  // register rdReg_2
  assign rdReg_2_D_IN =
	     MUX_rdReg_2_write_1__SEL_1 ?
	       wci_wslv_reqF_D_OUT[31:0] :
	       lrespF_dD_OUT[95:64] ;
  assign rdReg_2_EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF_D_OUT[51] &&
	     wci_wslv_reqF_D_OUT[39:32] == 8'h88 ||
	     WILL_FIRE_RL_advance_response ;
  // register rdReg_3
  assign rdReg_3_D_IN =
	     MUX_rdReg_3_write_1__SEL_1 ?
	       wci_wslv_reqF_D_OUT[31:0] :
	       lrespF_dD_OUT[127:96] ;
  assign rdReg_3_EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF_D_OUT[51] &&
	     wci_wslv_reqF_D_OUT[39:32] == 8'h8C ||
	     WILL_FIRE_RL_advance_response ;
  // register respCount
  assign respCount_D_IN = respCount + 8'd1 ;
  assign respCount_EN = WILL_FIRE_RL_advance_response ;
  // register splitReadInFlight
  assign splitReadInFlight_D_IN = !MUX_splitReadInFlight_write_1__SEL_1 ;
  assign splitReadInFlight_EN =
	     WILL_FIRE_RL_advance_response && splitReadInFlight ||
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[51] ;
  // register uclkUpdateCnt
  assign uclkUpdateCnt_D_IN = uclkUpdateCnt + 32'd1 ;
  assign uclkUpdateCnt_EN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
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
  // register wdReg_0
  assign wdReg_0_D_IN = wci_wslv_reqF_D_OUT[31:0] ;
  assign wdReg_0_EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF_D_OUT[51] &&
	     wci_wslv_reqF_D_OUT[39:32] == 8'h60 ;
  // register wdReg_1
  assign wdReg_1_D_IN = wci_wslv_reqF_D_OUT[31:0] ;
  assign wdReg_1_EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF_D_OUT[51] &&
	     wci_wslv_reqF_D_OUT[39:32] == 8'h64 ;
  // register wdReg_2
  assign wdReg_2_D_IN = wci_wslv_reqF_D_OUT[31:0] ;
  assign wdReg_2_EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF_D_OUT[51] &&
	     wci_wslv_reqF_D_OUT[39:32] == 8'h68 ;
  // register wdReg_3
  assign wdReg_3_D_IN = wci_wslv_reqF_D_OUT[31:0] ;
  assign wdReg_3_EN =
	     WILL_FIRE_RL_wci_cfwr && !wci_wslv_reqF_D_OUT[51] &&
	     wci_wslv_reqF_D_OUT[39:32] == 8'h6C ;
  // register wmemiRdReq
  assign wmemiRdReq_D_IN = wmemiRdReq + 32'd1 ;
  assign wmemiRdReq_EN =
	     MUX_lreqF_enq_1__PSEL_2 && wmemi_reqF_D_OUT[51:49] != 3'd1 &&
	     wmemiReadInFlight_value_07_SLT_16___d390 ;
  // register wmemiRdResp
  assign wmemiRdResp_D_IN = wmemiRdResp + 32'd1 ;
  assign wmemiRdResp_EN =
	     lrespF_dEMPTY_N &&
	     lrespF_RDY_first__19_AND_NOT_wmemi_respF_cntr__ETC___d421 &&
	     (wmemiReadInFlight_value ^ 8'h80) > 8'd128 ;
  // register wmemiReadInFlight_value
  assign wmemiReadInFlight_value_D_IN =
	     WILL_FIRE_RL_wci_ctrl_IsO ?
	       8'd0 :
	       MUX_wmemiReadInFlight_value_write_1__VAL_2 ;
  assign wmemiReadInFlight_value_EN = 1'b1 ;
  // register wmemiWrReq
  assign wmemiWrReq_D_IN = wmemiWrReq + 32'd1 ;
  assign wmemiWrReq_EN =
	     MUX_lreqF_enq_1__PSEL_2 && wmemi_reqF_D_OUT[51:49] == 3'd1 ;
  // register wmemi_errorSticky
  assign wmemi_errorSticky_D_IN = 1'b0 ;
  assign wmemi_errorSticky_EN = 1'b0 ;
  // register wmemi_isReset_isInReset
  assign wmemi_isReset_isInReset_D_IN = 1'd0 ;
  assign wmemi_isReset_isInReset_EN = wmemi_isReset_isInReset ;
  // register wmemi_operateD
  assign wmemi_operateD_D_IN = wci_wslv_cState == 3'd2 ;
  assign wmemi_operateD_EN = 1'd1 ;
  // register wmemi_peerIsReady
  assign wmemi_peerIsReady_D_IN = wmemiS0_MReset_n ;
  assign wmemi_peerIsReady_EN = 1'd1 ;
  // register wmemi_respF_cntr_r
  assign wmemi_respF_cntr_r_D_IN =
	     WILL_FIRE_RL_wmemi_respF_decCtr ?
	       wmemi_respF_cntr_r_47_MINUS_1___d256 :
	       MUX_wmemi_respF_cntr_r_write_1__VAL_2 ;
  assign wmemi_respF_cntr_r_EN =
	     WILL_FIRE_RL_wmemi_respF_decCtr ||
	     WILL_FIRE_RL_wmemi_respF_incCtr ;
  // register wmemi_respF_q_0
  always@(MUX_wmemi_respF_q_0_write_1__SEL_1 or
	  MUX_wmemi_respF_q_0_write_1__VAL_1 or
	  MUX_wmemi_respF_q_0_write_1__SEL_2 or
	  MUX_wmemi_respF_q_0_write_1__VAL_2 or
	  WILL_FIRE_RL_wmemi_respF_decCtr or wmemi_respF_q_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmemi_respF_q_0_write_1__SEL_1:
	  wmemi_respF_q_0_D_IN = MUX_wmemi_respF_q_0_write_1__VAL_1;
      MUX_wmemi_respF_q_0_write_1__SEL_2:
	  wmemi_respF_q_0_D_IN = MUX_wmemi_respF_q_0_write_1__VAL_2;
      WILL_FIRE_RL_wmemi_respF_decCtr: wmemi_respF_q_0_D_IN = wmemi_respF_q_1;
      default: wmemi_respF_q_0_D_IN =
		   131'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmemi_respF_q_0_EN =
	     WILL_FIRE_RL_wmemi_respF_both && _dfoo7 ||
	     WILL_FIRE_RL_wmemi_respF_incCtr && wmemi_respF_cntr_r == 2'd0 ||
	     WILL_FIRE_RL_wmemi_respF_decCtr ;
  // register wmemi_respF_q_1
  always@(MUX_wmemi_respF_q_1_write_1__SEL_1 or
	  MUX_wmemi_respF_q_1_write_1__VAL_1 or
	  MUX_wmemi_respF_q_1_write_1__SEL_2 or
	  MUX_wmemi_respF_q_0_write_1__VAL_2 or
	  WILL_FIRE_RL_wmemi_respF_decCtr)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_wmemi_respF_q_1_write_1__SEL_1:
	  wmemi_respF_q_1_D_IN = MUX_wmemi_respF_q_1_write_1__VAL_1;
      MUX_wmemi_respF_q_1_write_1__SEL_2:
	  wmemi_respF_q_1_D_IN = MUX_wmemi_respF_q_0_write_1__VAL_2;
      WILL_FIRE_RL_wmemi_respF_decCtr:
	  wmemi_respF_q_1_D_IN = 131'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
      default: wmemi_respF_q_1_D_IN =
		   131'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign wmemi_respF_q_1_EN =
	     WILL_FIRE_RL_wmemi_respF_both && _dfoo5 ||
	     WILL_FIRE_RL_wmemi_respF_incCtr && wmemi_respF_cntr_r == 2'd1 ||
	     WILL_FIRE_RL_wmemi_respF_decCtr ;
  // register wmemi_statusR
  assign wmemi_statusR_D_IN =
	     { wmemi_isReset_isInReset,
	       !wmemi_peerIsReady,
	       !wmemi_operateD,
	       wmemi_errorSticky,
	       3'd0,
	       wmemi_trafficSticky } ;
  assign wmemi_statusR_EN = 1'd1 ;
  // register wmemi_trafficSticky
  assign wmemi_trafficSticky_D_IN = 1'd1 ;
  assign wmemi_trafficSticky_EN =
	     wmemi_reqF_FULL_N &&
	     wmemi_operateD_74_AND_wmemi_peerIsReady_75_76__ETC___d283 ;
  // submodule appFull
  assign appFull_sD_IN = x1__h12825 ;
  assign appFull_sEN = 1'd1 ;
  // submodule dbg_cpt_first_edge_cnt
  assign dbg_cpt_first_edge_cnt_sD_IN = memc_memc_dbg_cpt_first_edge_cnt ;
  assign dbg_cpt_first_edge_cnt_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule dbg_cpt_second_edge_cnt
  assign dbg_cpt_second_edge_cnt_sD_IN = memc_memc_dbg_cpt_second_edge_cnt ;
  assign dbg_cpt_second_edge_cnt_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule dbg_cpt_tap_cnt
  assign dbg_cpt_tap_cnt_sD_IN = memc_memc_dbg_cpt_tap_cnt ;
  assign dbg_cpt_tap_cnt_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule dbg_dq_tap_cnt
  assign dbg_dq_tap_cnt_sD_IN = memc_memc_dbg_dq_tap_cnt ;
  assign dbg_dq_tap_cnt_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule dbg_dqs_n_tap_cnt
  assign dbg_dqs_n_tap_cnt_sD_IN = memc_memc_dbg_dqs_n_tap_cnt ;
  assign dbg_dqs_n_tap_cnt_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule dbg_dqs_p_tap_cnt
  assign dbg_dqs_p_tap_cnt_sD_IN = memc_memc_dbg_dqs_p_tap_cnt ;
  assign dbg_dqs_p_tap_cnt_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule dbg_rd_active_dly
  assign dbg_rd_active_dly_sD_IN = memc_memc_dbg_rd_active_dly ;
  assign dbg_rd_active_dly_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule dbg_rd_bitslip_cnt
  assign dbg_rd_bitslip_cnt_sD_IN = memc_memc_dbg_rd_bitslip_cnt ;
  assign dbg_rd_bitslip_cnt_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule dbg_rd_clkdly_cnt
  assign dbg_rd_clkdly_cnt_sD_IN = memc_memc_dbg_rd_clkdly_cnt ;
  assign dbg_rd_clkdly_cnt_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule dbg_rddata
  assign dbg_rddata_sD_IN = memc_memc_dbg_rddata ;
  assign dbg_rddata_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule dbg_rdlvl_done
  assign dbg_rdlvl_done_sD_IN = memc_memc_dbg_rdlvl_done ;
  assign dbg_rdlvl_done_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule dbg_rdlvl_err
  assign dbg_rdlvl_err_sD_IN = memc_memc_dbg_rdlvl_err ;
  assign dbg_rdlvl_err_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule dbg_wl_dqs_inverted
  assign dbg_wl_dqs_inverted_sD_IN = memc_memc_dbg_wl_dqs_inverted ;
  assign dbg_wl_dqs_inverted_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule dbg_wl_odelay_dq_tap_cnt
  assign dbg_wl_odelay_dq_tap_cnt_sD_IN = memc_memc_dbg_wl_odelay_dq_tap_cnt ;
  assign dbg_wl_odelay_dq_tap_cnt_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule dbg_wl_odelay_dqs_tap_cnt
  assign dbg_wl_odelay_dqs_tap_cnt_sD_IN =
	     memc_memc_dbg_wl_odelay_dqs_tap_cnt ;
  assign dbg_wl_odelay_dqs_tap_cnt_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule dbg_wr_calib_clk_delay
  assign dbg_wr_calib_clk_delay_sD_IN = memc_memc_dbg_wr_calib_clk_delay ;
  assign dbg_wr_calib_clk_delay_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule firBeat
  assign firBeat_sD_IN = memc_firstBeat ;
  assign firBeat_sEN = 1'd1 ;
  // submodule initComplete
  assign initComplete_sD_IN = memc_memc_phy_init_done ;
  assign initComplete_sEN = 1'd1 ;
  // submodule lreqF
  always@(MUX_splitReadInFlight_write_1__SEL_2 or
	  MUX_lreqF_enq_1__VAL_1 or
	  MUX_lreqF_enq_1__SEL_2 or
	  MUX_lreqF_enq_1__VAL_2 or
	  MUX_lreqF_enq_1__SEL_3 or MUX_lreqF_enq_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_splitReadInFlight_write_1__SEL_2:
	  lreqF_sD_IN = MUX_lreqF_enq_1__VAL_1;
      MUX_lreqF_enq_1__SEL_2: lreqF_sD_IN = MUX_lreqF_enq_1__VAL_2;
      MUX_lreqF_enq_1__SEL_3: lreqF_sD_IN = MUX_lreqF_enq_1__VAL_3;
      default: lreqF_sD_IN =
		   177'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign lreqF_sENQ =
	     WILL_FIRE_RL_wci_cfrd && wci_wslv_reqF_D_OUT[51] ||
	     MUX_lreqF_enq_1__PSEL_2 &&
	     (wmemi_reqF_D_OUT[51:49] == 3'd1 ||
	      wmemiReadInFlight_value_07_SLT_16___d390) ||
	     WILL_FIRE_RL_wci_cfwr &&
	     (wci_wslv_reqF_D_OUT[51] ||
	      wci_wslv_reqF_D_OUT[39:32] == 8'h54 ||
	      wci_wslv_reqF_D_OUT[39:32] == 8'h58) ;
  assign lreqF_dDEQ = lreqF_dEMPTY_N && memc_reqF_FULL_N ;
  // submodule lrespF
  assign lrespF_sD_IN = memc_respF_D_OUT ;
  assign lrespF_sENQ = lrespF_sFULL_N && memc_respF_EMPTY_N ;
  assign lrespF_dDEQ =
	     lrespF_dEMPTY_N &&
	     lrespF_RDY_first__19_AND_NOT_wmemi_respF_cntr__ETC___d421 &&
	     (wmemiReadInFlight_value ^ 8'h80) > 8'd128 ||
	     WILL_FIRE_RL_advance_response ;
  // submodule memIsResetCC
  assign memIsResetCC_sD_IN = memIsReset_isInReset ;
  assign memIsResetCC_sEN = 1'd1 ;
  // submodule memc_memc
  assign memc_memc_app_addr = { 3'd0, memc_reqF_D_OUT[175:146] } ;
  assign memc_memc_app_cmd = memc_reqF_D_OUT[176] ? 3'b001 : 3'b0 ;
  assign memc_memc_app_wdf_data = {2{memc_reqF_D_OUT[127:0]}} ;
  assign memc_memc_app_wdf_end = WILL_FIRE_RL_memc_advance_write1 ;
  assign memc_memc_app_wdf_mask =
	     WILL_FIRE_RL_memc_advance_write0 ? ~x__h5927 : ~x__h6148 ;
  assign memc_memc_dbg_dec_cpt = 1'd0 ;
  assign memc_memc_dbg_dec_rd_dqs = 1'd0 ;
  assign memc_memc_dbg_inc_cpt = 1'd0 ;
  assign memc_memc_dbg_inc_dec_sel = 3'd0 ;
  assign memc_memc_dbg_inc_rd_dqs = 1'd0 ;
  assign memc_memc_dbg_ocb_mon_off = 1'd0 ;
  assign memc_memc_dbg_pd_maintain_0_only = 1'd0 ;
  assign memc_memc_dbg_pd_maintain_off = 1'd0 ;
  assign memc_memc_dbg_pd_off = 1'd0 ;
  assign memc_memc_app_en = WILL_FIRE_RL_memc_advance_request ;
  assign memc_memc_app_wdf_wren = memc_wdfWren_whas ;
  // submodule memc_rdpF
  assign memc_rdpF_D_IN = memc_reqF_D_OUT[149:148] ;
  assign memc_rdpF_DEQ =
	     WILL_FIRE_RL_memc_advance_readData && memc_memc_app_rd_data_end ;
  assign memc_rdpF_ENQ =
	     WILL_FIRE_RL_memc_advance_request && memc_memc_app_rdy &&
	     memc_reqF_D_OUT[176] ;
  assign memc_rdpF_CLR = 1'b0 ;
  // submodule memc_reqF
  assign memc_reqF_D_IN = lreqF_dD_OUT ;
  assign memc_reqF_ENQ = lreqF_dEMPTY_N && memc_reqF_FULL_N ;
  assign memc_reqF_DEQ =
	     WILL_FIRE_RL_memc_advance_write1 && memc_memc_app_wdf_rdy ||
	     WILL_FIRE_RL_memc_advance_request && memc_memc_app_rdy &&
	     memc_reqF_D_OUT[176] ;
  assign memc_reqF_CLR = 1'b0 ;
  // submodule memc_respF
  always@(x__h6385 or memc_memc_app_rd_data)
  begin
    case (x__h6385)
      3'b0, 3'b110: memc_respF_D_IN = memc_memc_app_rd_data[127:0];
      3'b101: memc_respF_D_IN = memc_memc_app_rd_data[255:128];
      default: memc_respF_D_IN = memc_memc_app_rd_data[255:128];
    endcase
  end
  assign memc_respF_DEQ = lrespF_sFULL_N && memc_respF_EMPTY_N ;
  assign memc_respF_ENQ =
	     WILL_FIRE_RL_memc_advance_readData &&
	     (x__h6385 == 3'b0 || x__h6385 == 3'b101 || x__h6385 == 3'b110 ||
	      x__h6385 == 3'b011) ;
  assign memc_respF_CLR = 1'b0 ;
  // submodule requestCount
  assign requestCount_sD_IN = memc_requestCount ;
  assign requestCount_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule responseCount
  assign responseCount_sD_IN = memc_responseCount ;
  assign responseCount_sEN =
	     dbg_wl_dqs_inverted_sRDY && dbg_wr_calib_clk_delay_sRDY &&
	     dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 ;
  // submodule secBeat
  assign secBeat_sD_IN = memc_secondBeat ;
  assign secBeat_sEN = 1'd1 ;
  // submodule splaF
  assign splaF_D_IN = wci_wslv_reqF_D_OUT[35:34] ;
  assign splaF_DEQ = MUX_splitReadInFlight_write_1__SEL_1 ;
  assign splaF_ENQ = MUX_splitReadInFlight_write_1__SEL_2 ;
  assign splaF_CLR = 1'b0 ;
  // submodule wci_uclkUpdateCnt
  assign wci_uclkUpdateCnt_sD_IN = uclkUpdateCnt ;
  assign wci_uclkUpdateCnt_sEN = wci_uclkUpdateCnt_sRDY ;
  // submodule wci_wslv_reqF
  assign wci_wslv_reqF_D_IN = wci_wslv_wciReq_wget ;
  assign wci_wslv_reqF_ENQ = wci_wslv_wciReq_wget[71:69] != 3'd0 ;
  assign wci_wslv_reqF_DEQ = wci_wslv_reqF_r_deq_whas ;
  assign wci_wslv_reqF_CLR = 1'b0 ;
  // submodule wdfFull
  assign wdfFull_sD_IN = !memc_memc_app_wdf_rdy ;
  assign wdfFull_sEN = 1'd1 ;
  // submodule wmemi_dhF
  assign wmemi_dhF_D_IN = wmemi_wmemiDh_wget ;
  assign wmemi_dhF_ENQ = wmemi_dhAccept_w_whas ;
  assign wmemi_dhF_DEQ =
	     MUX_lreqF_enq_1__PSEL_2 && wmemi_reqF_D_OUT[51:49] == 3'd1 ;
  assign wmemi_dhF_CLR = 1'b0 ;
  // submodule wmemi_reqF
  assign wmemi_reqF_D_IN = wmemi_wmemiReq_wget ;
  assign wmemi_reqF_ENQ = wmemi_cmdAccept_w_whas ;
  assign wmemi_reqF_DEQ = MUX_lreqF_enq_1__PSEL_2 ;
  assign wmemi_reqF_CLR = 1'b0 ;
  // remaining internal signals
  assign IF_memc_memc_app_rd_data_end__09_CONCAT_memc_r_ETC___d225 =
	     CASE_x385_0b0_memc_respFFULL_N_0b101_memc_res_ETC__q1 &&
	     (!memc_memc_app_rd_data_end || memc_rdpF_EMPTY_N) ;
  assign IF_wci_wslv_reqF_first__3_BIT_51_52_THEN_lreqF_ETC___d528 =
	     wci_wslv_reqF_D_OUT[51] ?
	       lreqF_sFULL_N && splaF_FULL_N :
	       wci_wslv_respF_cntr_r != 2'd2 ;
  assign IF_wci_wslv_reqF_first__3_BIT_51_52_THEN_pReg__ETC___d503 =
	     wci_wslv_reqF_D_OUT[51] ?
	       { x1_addr__h17672, x1_be__h17673, x1_data__h17674 } :
	       { wci_wslv_reqF_D_OUT[31:0], mReg, x1_data__h16665 } ;
  assign IF_wmemi_reqF_first__84_BITS_51_TO_49_85_EQ_1__ETC___d393 =
	     (wmemi_reqF_D_OUT[51:49] == 3'd1) ?
	       lreqF_sFULL_N && wmemi_dhF_EMPTY_N :
	       !wmemiReadInFlight_value_07_SLT_16___d390 || lreqF_sFULL_N ;
  assign _dfoo1 =
	     wci_wslv_respF_cntr_r != 2'd2 ||
	     wci_wslv_respF_cntr_r_8_MINUS_1___d27 == 2'd1 ;
  assign _dfoo3 =
	     wci_wslv_respF_cntr_r != 2'd1 ||
	     wci_wslv_respF_cntr_r_8_MINUS_1___d27 == 2'd0 ;
  assign _dfoo5 =
	     wmemi_respF_cntr_r != 2'd2 ||
	     wmemi_respF_cntr_r_47_MINUS_1___d256 == 2'd1 ;
  assign _dfoo7 =
	     wmemi_respF_cntr_r != 2'd1 ||
	     wmemi_respF_cntr_r_47_MINUS_1___d256 == 2'd0 ;
  assign dbg_rd_active_dly_RDY_write__28_AND_dbg_dqs_p__ETC___d340 =
	     dbg_rd_active_dly_sRDY && dbg_dqs_p_tap_cnt_sRDY &&
	     dbg_dqs_n_tap_cnt_sRDY &&
	     dbg_dq_tap_cnt_sRDY &&
	     dbg_rddata_sRDY &&
	     requestCount_sRDY &&
	     responseCount_sRDY ;
  assign dbg_rdlvl_err_RDY_write__22_AND_dbg_cpt_tap_cn_ETC___d346 =
	     dbg_rdlvl_err_sRDY && dbg_cpt_tap_cnt_sRDY &&
	     dbg_cpt_first_edge_cnt_sRDY &&
	     dbg_cpt_second_edge_cnt_sRDY &&
	     dbg_rd_bitslip_cnt_sRDY &&
	     dbg_rd_clkdly_cnt_sRDY &&
	     dbg_rd_active_dly_RDY_write__28_AND_dbg_dqs_p__ETC___d340 ;
  assign dbg_wl_odelay_dqs_tap_cnt_RDY_write__19_AND_db_ETC___d349 =
	     dbg_wl_odelay_dqs_tap_cnt_sRDY &&
	     dbg_wl_odelay_dq_tap_cnt_sRDY &&
	     dbg_rdlvl_done_sRDY &&
	     dbg_rdlvl_err_RDY_write__22_AND_dbg_cpt_tap_cn_ETC___d346 ;
  assign dramStatus__h14103 = { 16'd0, x__h19181 } ;
  assign g_data__h19141 =
	     wci_wslv_reqF_D_OUT[51] ?
	       32'd0 :
	       IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 ;
  assign lrespF_RDY_first__19_AND_NOT_splitReadInFlight_ETC___d437 =
	     lrespF_dEMPTY_N &&
	     (!splitReadInFlight ||
	      splaF_EMPTY_N && wci_wslv_respF_cntr_r != 2'd2) ;
  assign lrespF_RDY_first__19_AND_NOT_wmemi_respF_cntr__ETC___d421 =
	     lrespF_dEMPTY_N && wmemi_respF_cntr_r != 2'd2 &&
	     wmemi_operateD &&
	     wmemi_peerIsReady ;
  assign myBE__h5964 = { 16'h0, memc_reqF_D_OUT[143:128] } ;
  assign myBE__h5997 = { memc_reqF_D_OUT[143:128], 16'h0 } ;
  assign rdat___1__h19204 =
	     hasDebugLogic ? { 24'd0, dbg_wl_dqs_inverted_dD_OUT } : 32'd0 ;
  assign rdat___1__h19215 =
	     hasDebugLogic ?
	       { 16'd0, dbg_wr_calib_clk_delay_dD_OUT } :
	       32'd0 ;
  assign rdat___1__h19226 =
	     hasDebugLogic ? dbg_wl_odelay_dqs_tap_cnt_dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h19237 =
	     hasDebugLogic ? dbg_wl_odelay_dq_tap_cnt_dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h19248 =
	     hasDebugLogic ? { 30'd0, dbg_rdlvl_done_dD_OUT } : 32'd0 ;
  assign rdat___1__h19259 =
	     hasDebugLogic ? { 30'd0, dbg_rdlvl_err_dD_OUT } : 32'd0 ;
  assign rdat___1__h19270 =
	     hasDebugLogic ? dbg_cpt_tap_cnt_dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h19281 =
	     hasDebugLogic ? dbg_cpt_first_edge_cnt_dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h19292 =
	     hasDebugLogic ? dbg_cpt_second_edge_cnt_dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h19303 =
	     hasDebugLogic ? { 8'd0, dbg_rd_bitslip_cnt_dD_OUT } : 32'd0 ;
  assign rdat___1__h19314 =
	     hasDebugLogic ? { 16'd0, dbg_rd_clkdly_cnt_dD_OUT } : 32'd0 ;
  assign rdat___1__h19325 =
	     hasDebugLogic ? { 27'd0, dbg_rd_active_dly_dD_OUT } : 32'd0 ;
  assign rdat___1__h19336 =
	     hasDebugLogic ? dbg_dqs_p_tap_cnt_dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h19347 =
	     hasDebugLogic ? dbg_dqs_n_tap_cnt_dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h19358 =
	     hasDebugLogic ? dbg_dq_tap_cnt_dD_OUT[31:0] : 32'd0 ;
  assign rdat___1__h19369 = hasDebugLogic ? dbg_rddata_dD_OUT : 32'd0 ;
  assign rdat___1__h19376 =
	     hasDebugLogic ? { 16'd0, requestCount_dD_OUT } : 32'd0 ;
  assign rdat___1__h19387 =
	     hasDebugLogic ? { 16'd0, responseCount_dD_OUT } : 32'd0 ;
  assign rdat___1__h19398 = hasDebugLogic ? { 16'd0, pReg } : 32'd0 ;
  assign rdat___1__h19408 = hasDebugLogic ? { 16'd0, mReg } : 32'd0 ;
  assign rdat___1__h19418 = hasDebugLogic ? wdReg_0 : 32'd0 ;
  assign rdat___1__h19432 = hasDebugLogic ? wdReg_1 : 32'd0 ;
  assign rdat___1__h19446 = hasDebugLogic ? wdReg_2 : 32'd0 ;
  assign rdat___1__h19460 = hasDebugLogic ? wdReg_3 : 32'd0 ;
  assign rdat___1__h19474 = hasDebugLogic ? rdReg_0 : 32'd0 ;
  assign rdat___1__h19489 = hasDebugLogic ? rdReg_1 : 32'd0 ;
  assign rdat___1__h19504 = hasDebugLogic ? rdReg_2 : 32'd0 ;
  assign rdat___1__h19519 = hasDebugLogic ? rdReg_3 : 32'd0 ;
  assign rdat___1__h19534 = hasDebugLogic ? wmemiWrReq : 32'd0 ;
  assign rdat___1__h19540 = hasDebugLogic ? wmemiRdReq : 32'd0 ;
  assign rdat___1__h19546 = hasDebugLogic ? wmemiRdResp : 32'd0 ;
  assign rdat___1__h19552 = hasDebugLogic ? wci_uclkUpdateCnt_dD_OUT : 32'd0 ;
  assign wci_wslv_reqF_i_notEmpty__2_AND_IF_wci_wslv_re_ETC___d464 =
	     wci_wslv_reqF_EMPTY_N &&
	     (wci_wslv_reqF_D_OUT[51] ?
		lreqF_sFULL_N :
		((wci_wslv_reqF_D_OUT[39:32] == 8'h54) ?
		   lreqF_sFULL_N :
		   wci_wslv_reqF_D_OUT[39:32] != 8'h58 || lreqF_sFULL_N)) ;
  assign wci_wslv_respF_cntr_r_8_MINUS_1___d27 =
	     wci_wslv_respF_cntr_r - 2'd1 ;
  assign wmemiReadInFlight_value_07_SLT_16___d390 =
	     (wmemiReadInFlight_value ^ 8'h80) < 8'd144 ;
  assign wmemi_operateD_74_AND_wmemi_peerIsReady_75_76__ETC___d283 =
	     wmemi_operateD && wmemi_peerIsReady &&
	     wmemi_wmemiReq_wget[51:49] != 3'd0 &&
	     wmemi_reqF_FULL_N ;
  assign wmemi_respF_cntr_r_47_MINUS_1___d256 = wmemi_respF_cntr_r - 2'd1 ;
  assign x1__h12825 = !memc_memc_app_rdy ;
  assign x1_addr__h17672 = { pReg[12:0], wci_wslv_reqF_D_OUT[50:36], 4'd0 } ;
  assign x1_be__h17673 =
	     { (wci_wslv_reqF_D_OUT[35:34] == 2'd3) ? 4'hF : 4'h0,
	       (wci_wslv_reqF_D_OUT[35:34] == 2'd2) ? 4'hF : 4'h0,
	       (wci_wslv_reqF_D_OUT[35:34] == 2'd1) ? 4'hF : 4'h0,
	       (wci_wslv_reqF_D_OUT[35:34] == 2'd0) ? 4'hF : 4'h0 } ;
  assign x1_data__h16665 = { wdReg_3, wdReg_2, wdReg_1, wdReg_0 } ;
  assign x1_data__h17674 = {4{wci_wslv_reqF_D_OUT[31:0]}} ;
  assign x__h19181 =
	     { respCount,
	       2'b0,
	       memIsResetCC_dD_OUT,
	       appFull_dD_OUT,
	       wdfFull_dD_OUT,
	       secBeat_dD_OUT,
	       firBeat_dD_OUT,
	       initComplete_dD_OUT } ;
  assign x__h6385 = { memc_memc_app_rd_data_end, memc_rdpF_D_OUT } ;
  always@(splaF_D_OUT or lrespF_dD_OUT)
  begin
    case (splaF_D_OUT)
      2'd0: g_data__h15477 = lrespF_dD_OUT[31:0];
      2'd1: g_data__h15477 = lrespF_dD_OUT[63:32];
      2'd2: g_data__h15477 = lrespF_dD_OUT[95:64];
      2'd3: g_data__h15477 = lrespF_dD_OUT[127:96];
    endcase
  end
  always@(memc_reqF_D_OUT or myBE__h5964 or myBE__h5997)
  begin
    case (memc_reqF_D_OUT[149:148])
      2'b0: x__h5927 = myBE__h5964;
      2'b01: x__h5927 = myBE__h5997;
      default: x__h5927 = 32'd0;
    endcase
  end
  always@(memc_reqF_D_OUT or myBE__h5964 or myBE__h5997)
  begin
    case (memc_reqF_D_OUT[149:148])
      2'b10: x__h6148 = myBE__h5964;
      2'b11: x__h6148 = myBE__h5997;
      default: x__h6148 = 32'd0;
    endcase
  end
  always@(x__h6385 or memc_respF_FULL_N)
  begin
    case (x__h6385)
      3'b0, 3'b101, 3'b110:
	  CASE_x385_0b0_memc_respFFULL_N_0b101_memc_res_ETC__q1 =
	      memc_respF_FULL_N;
      default: CASE_x385_0b0_memc_respFFULL_N_0b101_memc_res_ETC__q1 =
		   x__h6385 != 3'b011 || memc_respF_FULL_N;
    endcase
  end
  always@(wci_wslv_reqF_D_OUT or
	  dramStatus__h14103 or
	  dramCtrl or
	  rdat___1__h19204 or
	  rdat___1__h19215 or
	  rdat___1__h19226 or
	  rdat___1__h19237 or
	  rdat___1__h19248 or
	  rdat___1__h19259 or
	  rdat___1__h19270 or
	  rdat___1__h19281 or
	  rdat___1__h19292 or
	  rdat___1__h19303 or
	  rdat___1__h19314 or
	  rdat___1__h19325 or
	  rdat___1__h19336 or
	  rdat___1__h19347 or
	  rdat___1__h19358 or
	  rdat___1__h19369 or
	  rdat___1__h19376 or
	  rdat___1__h19387 or
	  rdat___1__h19398 or
	  rdat___1__h19408 or
	  rdat___1__h19418 or
	  rdat___1__h19432 or
	  rdat___1__h19446 or
	  rdat___1__h19460 or
	  rdat___1__h19474 or
	  rdat___1__h19489 or
	  rdat___1__h19504 or
	  rdat___1__h19519 or
	  rdat___1__h19534 or
	  rdat___1__h19540 or rdat___1__h19546 or rdat___1__h19552)
  begin
    case (wci_wslv_reqF_D_OUT[39:32])
      8'h0:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      dramStatus__h14103;
      8'h04:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      dramCtrl;
      8'h08:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19204;
      8'h0C:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19215;
      8'h10:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19226;
      8'h14:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19237;
      8'h18:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19248;
      8'h1C:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19259;
      8'h20:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19270;
      8'h24:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19281;
      8'h28:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19292;
      8'h2C:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19303;
      8'h30:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19314;
      8'h34:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19325;
      8'h38:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19336;
      8'h3C:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19347;
      8'h40:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19358;
      8'h44:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19369;
      8'h48:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19376;
      8'h4C:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19387;
      8'h50:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19398;
      8'h5C:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19408;
      8'h60:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19418;
      8'h64:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19432;
      8'h68:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19446;
      8'h6C:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19460;
      8'h80:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19474;
      8'h84:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19489;
      8'h88:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19504;
      8'h8C:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19519;
      8'h90:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19534;
      8'h94:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19540;
      8'h98:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19546;
      8'h9C:
	  IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
	      rdat___1__h19552;
      default: IF_wci_wslv_reqF_first__3_BITS_39_TO_32_53_EQ__ETC___d674 =
		   32'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge wciS0_Clk)
  begin
    if (wciS0_MReset_n == `BSV_RESET_VALUE)
      begin
        dramCtrl <= `BSV_ASSIGNMENT_DELAY 32'd0;
	mReg <= `BSV_ASSIGNMENT_DELAY 16'd0;
	memInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
	pReg <= `BSV_ASSIGNMENT_DELAY 16'd0;
	pioReadInFlight <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rdReg_0 <= `BSV_ASSIGNMENT_DELAY 32'd0;
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
	wci_wslv_respF_cntr_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wci_wslv_respF_q_0 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	wci_wslv_respF_q_1 <= `BSV_ASSIGNMENT_DELAY 34'h0AAAAAAAA;
	wci_wslv_sFlagReg <= `BSV_ASSIGNMENT_DELAY 1'd0;
	wci_wslv_sThreadBusy_d <= `BSV_ASSIGNMENT_DELAY 1'd1;
	wdReg_0 <= `BSV_ASSIGNMENT_DELAY 32'd0;
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
	wmemi_respF_cntr_r <= `BSV_ASSIGNMENT_DELAY 2'd0;
	wmemi_respF_q_0 <= `BSV_ASSIGNMENT_DELAY
	    131'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	wmemi_respF_q_1 <= `BSV_ASSIGNMENT_DELAY
	    131'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	wmemi_trafficSticky <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (dramCtrl_EN) dramCtrl <= `BSV_ASSIGNMENT_DELAY dramCtrl_D_IN;
	if (mReg_EN) mReg <= `BSV_ASSIGNMENT_DELAY mReg_D_IN;
	if (memInReset_EN)
	  memInReset <= `BSV_ASSIGNMENT_DELAY memInReset_D_IN;
	if (pReg_EN) pReg <= `BSV_ASSIGNMENT_DELAY pReg_D_IN;
	if (pioReadInFlight_EN)
	  pioReadInFlight <= `BSV_ASSIGNMENT_DELAY pioReadInFlight_D_IN;
	if (rdReg_0_EN) rdReg_0 <= `BSV_ASSIGNMENT_DELAY rdReg_0_D_IN;
	if (rdReg_1_EN) rdReg_1 <= `BSV_ASSIGNMENT_DELAY rdReg_1_D_IN;
	if (rdReg_2_EN) rdReg_2 <= `BSV_ASSIGNMENT_DELAY rdReg_2_D_IN;
	if (rdReg_3_EN) rdReg_3 <= `BSV_ASSIGNMENT_DELAY rdReg_3_D_IN;
	if (respCount_EN) respCount <= `BSV_ASSIGNMENT_DELAY respCount_D_IN;
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
	if (wdReg_0_EN) wdReg_0 <= `BSV_ASSIGNMENT_DELAY wdReg_0_D_IN;
	if (wdReg_1_EN) wdReg_1 <= `BSV_ASSIGNMENT_DELAY wdReg_1_D_IN;
	if (wdReg_2_EN) wdReg_2 <= `BSV_ASSIGNMENT_DELAY wdReg_2_D_IN;
	if (wdReg_3_EN) wdReg_3 <= `BSV_ASSIGNMENT_DELAY wdReg_3_D_IN;
	if (wmemiRdReq_EN)
	  wmemiRdReq <= `BSV_ASSIGNMENT_DELAY wmemiRdReq_D_IN;
	if (wmemiRdResp_EN)
	  wmemiRdResp <= `BSV_ASSIGNMENT_DELAY wmemiRdResp_D_IN;
	if (wmemiReadInFlight_value_EN)
	  wmemiReadInFlight_value <= `BSV_ASSIGNMENT_DELAY
	      wmemiReadInFlight_value_D_IN;
	if (wmemiWrReq_EN)
	  wmemiWrReq <= `BSV_ASSIGNMENT_DELAY wmemiWrReq_D_IN;
	if (wmemi_errorSticky_EN)
	  wmemi_errorSticky <= `BSV_ASSIGNMENT_DELAY wmemi_errorSticky_D_IN;
	if (wmemi_operateD_EN)
	  wmemi_operateD <= `BSV_ASSIGNMENT_DELAY wmemi_operateD_D_IN;
	if (wmemi_peerIsReady_EN)
	  wmemi_peerIsReady <= `BSV_ASSIGNMENT_DELAY wmemi_peerIsReady_D_IN;
	if (wmemi_respF_cntr_r_EN)
	  wmemi_respF_cntr_r <= `BSV_ASSIGNMENT_DELAY wmemi_respF_cntr_r_D_IN;
	if (wmemi_respF_q_0_EN)
	  wmemi_respF_q_0 <= `BSV_ASSIGNMENT_DELAY wmemi_respF_q_0_D_IN;
	if (wmemi_respF_q_1_EN)
	  wmemi_respF_q_1 <= `BSV_ASSIGNMENT_DELAY wmemi_respF_q_1_D_IN;
	if (wmemi_trafficSticky_EN)
	  wmemi_trafficSticky <= `BSV_ASSIGNMENT_DELAY
	      wmemi_trafficSticky_D_IN;
      end
    if (wmemi_statusR_EN)
      wmemi_statusR <= `BSV_ASSIGNMENT_DELAY wmemi_statusR_D_IN;
  end
  always@(posedge memc_memc_tb_clk)
  begin
    if (memc_memc_tb_rst_n == `BSV_RESET_VALUE)
      begin
        dbgCtrl <= `BSV_ASSIGNMENT_DELAY 32'd0;
	memc_firstBeat <= `BSV_ASSIGNMENT_DELAY 1'd0;
	memc_requestCount <= `BSV_ASSIGNMENT_DELAY 16'd0;
	memc_responseCount <= `BSV_ASSIGNMENT_DELAY 16'd0;
	memc_secondBeat <= `BSV_ASSIGNMENT_DELAY 1'd0;
	uclkUpdateCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
      end
    else
      begin
        if (dbgCtrl_EN) dbgCtrl <= `BSV_ASSIGNMENT_DELAY dbgCtrl_D_IN;
	if (memc_firstBeat_EN)
	  memc_firstBeat <= `BSV_ASSIGNMENT_DELAY memc_firstBeat_D_IN;
	if (memc_requestCount_EN)
	  memc_requestCount <= `BSV_ASSIGNMENT_DELAY memc_requestCount_D_IN;
	if (memc_responseCount_EN)
	  memc_responseCount <= `BSV_ASSIGNMENT_DELAY memc_responseCount_D_IN;
	if (memc_secondBeat_EN)
	  memc_secondBeat <= `BSV_ASSIGNMENT_DELAY memc_secondBeat_D_IN;
	if (uclkUpdateCnt_EN)
	  uclkUpdateCnt <= `BSV_ASSIGNMENT_DELAY uclkUpdateCnt_D_IN;
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
      if (wci_wslv_isReset_isInReset_EN)
	wci_wslv_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wci_wslv_isReset_isInReset_D_IN;
      if (wmemi_isReset_isInReset_EN)
	wmemi_isReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    wmemi_isReset_isInReset_D_IN;
    end
  always@(posedge memc_memc_tb_clk or `BSV_RESET_EDGE memc_memc_tb_rst_n)
  if (memc_memc_tb_rst_n == `BSV_RESET_VALUE)
    begin
      memIsReset_isInReset <= `BSV_ASSIGNMENT_DELAY 1'd1;
    end
  else
    begin
      if (memIsReset_isInReset_EN)
	memIsReset_isInReset <= `BSV_ASSIGNMENT_DELAY
	    memIsReset_isInReset_D_IN;
    end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    dbgCtrl = 32'hAAAAAAAA;
    dramCtrl = 32'hAAAAAAAA;
    mReg = 16'hAAAA;
    memInReset = 1'h0;
    memIsReset_isInReset = 1'h0;
    memc_firstBeat = 1'h0;
    memc_requestCount = 16'hAAAA;
    memc_responseCount = 16'hAAAA;
    memc_secondBeat = 1'h0;
    pReg = 16'hAAAA;
    pioReadInFlight = 1'h0;
    rdReg_0 = 32'hAAAAAAAA;
    rdReg_1 = 32'hAAAAAAAA;
    rdReg_2 = 32'hAAAAAAAA;
    rdReg_3 = 32'hAAAAAAAA;
    respCount = 8'hAA;
    splitReadInFlight = 1'h0;
    uclkUpdateCnt = 32'hAAAAAAAA;
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
    wdReg_0 = 32'hAAAAAAAA;
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
    wmemi_respF_cntr_r = 2'h2;
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
	  v__h3583 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_start)
	$display("[%0d]: %m: WCI ControlOp: Starting-transition edge:%x from:%x",
		 v__h3583,
		 wci_wslv_reqF_D_OUT[36:34],
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	begin
	  v__h19683 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO)
	$display("[%0d]: %m: Starting DramWorker dramCtrl:%0x",
		 v__h19683,
		 dramCtrl);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_advance_response && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DramServer_v6.bsv\", line 208, column 90: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_advance_response] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_advance_response && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/DramServer_v6.bsv\", line 208, column 90: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_advance_response] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_advance_response && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/DramServer_v6.bsv\", line 208, column 90: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_advance_response] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_advance_response)
	$display("Error: \"bsv/wrk/DramServer_v6.bsv\", line 208, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_advance_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DramServer_v6.bsv\", line 208, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/DramServer_v6.bsv\", line 208, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/DramServer_v6.bsv\", line 208, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfwr && WILL_FIRE_RL_wci_cfrd)
	$display("Error: \"bsv/wrk/DramServer_v6.bsv\", line 208, column 28: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfwr] and [RL_wci_cfrd] )\n  fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_advance_response)
	$display("Error: \"bsv/wrk/DramServer_v6.bsv\", line 208, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_advance_response] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DramServer_v6.bsv\", line 208, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/DramServer_v6.bsv\", line 208, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_cfrd && WILL_FIRE_RL_wci_ctrl_EiI)
	$display("Error: \"bsv/wrk/DramServer_v6.bsv\", line 208, column 38: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_cfrd] and\n  [RL_wci_ctrl_EiI] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_IsO && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DramServer_v6.bsv\", line 208, column 62: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_IsO] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_OrE)
	$display("Error: \"bsv/wrk/DramServer_v6.bsv\", line 208, column 48: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_OrE] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_ctrl_EiI && WILL_FIRE_RL_wci_ctrl_IsO)
	$display("Error: \"bsv/wrk/DramServer_v6.bsv\", line 208, column 48: (R0001)\n  Mutually exclusive rules (from the ME sets [RL_wci_ctrl_EiI] and\n  [RL_wci_ctrl_IsO] ) fired in the same clock cycle.\n");
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	begin
	  v__h3902 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: ILLEGAL-EDGE Completed-transition edge:%x from:%x",
		 v__h3902,
		 wci_wslv_cEdge,
		 wci_wslv_cState);
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	begin
	  v__h3758 = $time;
	  #0;
	end
    if (wciS0_MReset_n != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_wci_wslv_ctl_op_complete && !wci_wslv_illegalEdge)
	$display("[%0d]: %m: WCI ControlOp: Completed-transition edge:%x from:%x to:%x",
		 v__h3758,
		 wci_wslv_cEdge,
		 wci_wslv_cState,
		 wci_wslv_nState);
  end
  // synopsys translate_on
endmodule