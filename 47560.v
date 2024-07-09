module outputs
  reg [63 : 0] cword;
  wire [63 : 0] mem_master_araddr,
		mem_master_awaddr,
		mem_master_wdata,
		mv_tohost_value,
		st_amo_val;
  wire [31 : 0] addr;
  wire [7 : 0] mem_master_arlen,
	       mem_master_awlen,
	       mem_master_wstrb,
	       mv_status;
  wire [3 : 0] exc_code,
	       mem_master_arcache,
	       mem_master_arid,
	       mem_master_arqos,
	       mem_master_arregion,
	       mem_master_awcache,
	       mem_master_awid,
	       mem_master_awqos,
	       mem_master_awregion;
  wire [2 : 0] mem_master_arprot,
	       mem_master_arsize,
	       mem_master_awprot,
	       mem_master_awsize;
  wire [1 : 0] mem_master_arburst, mem_master_awburst;
  wire RDY_ma_ddr4_ready,
       RDY_mv_tohost_value,
       RDY_server_flush_request_put,
       RDY_server_flush_response_get,
       RDY_server_reset_request_put,
       RDY_server_reset_response_get,
       RDY_set_verbosity,
       RDY_set_watch_tohost,
       RDY_tlb_flush,
       exc,
       mem_master_arlock,
       mem_master_arvalid,
       mem_master_awlock,
       mem_master_awvalid,
       mem_master_bready,
       mem_master_rready,
       mem_master_wlast,
       mem_master_wvalid,
       valid;
  // inlined wires
  wire [3 : 0] ctr_wr_rsps_pending_crg$port0__write_1,
	       ctr_wr_rsps_pending_crg$port1__write_1,
	       ctr_wr_rsps_pending_crg$port2__read,
	       ctr_wr_rsps_pending_crg$port3__read;
  wire ctr_wr_rsps_pending_crg$EN_port2__write, dw_valid$whas;
  // register cfg_verbosity
  reg [3 : 0] cfg_verbosity;
  wire [3 : 0] cfg_verbosity$D_IN;
  wire cfg_verbosity$EN;
  // register ctr_wr_rsps_pending_crg
  reg [3 : 0] ctr_wr_rsps_pending_crg;
  wire [3 : 0] ctr_wr_rsps_pending_crg$D_IN;
  wire ctr_wr_rsps_pending_crg$EN;
  // register rg_addr
  reg [31 : 0] rg_addr;
  wire [31 : 0] rg_addr$D_IN;
  wire rg_addr$EN;
  // register rg_cset_cword_in_cache
  reg [8 : 0] rg_cset_cword_in_cache;
  wire [8 : 0] rg_cset_cword_in_cache$D_IN;
  wire rg_cset_cword_in_cache$EN;
  // register rg_cset_in_cache
  reg [5 : 0] rg_cset_in_cache;
  wire [5 : 0] rg_cset_in_cache$D_IN;
  wire rg_cset_in_cache$EN;
  // register rg_ddr4_ready
  reg rg_ddr4_ready;
  wire rg_ddr4_ready$D_IN, rg_ddr4_ready$EN;
  // register rg_error_during_refill
  reg rg_error_during_refill;
  wire rg_error_during_refill$D_IN, rg_error_during_refill$EN;
  // register rg_exc_code
  reg [3 : 0] rg_exc_code;
  reg [3 : 0] rg_exc_code$D_IN;
  wire rg_exc_code$EN;
  // register rg_f3
  reg [2 : 0] rg_f3;
  wire [2 : 0] rg_f3$D_IN;
  wire rg_f3$EN;
  // register rg_ld_val
  reg [63 : 0] rg_ld_val;
  wire [63 : 0] rg_ld_val$D_IN;
  wire rg_ld_val$EN;
  // register rg_lower_word32
  reg [31 : 0] rg_lower_word32;
  wire [31 : 0] rg_lower_word32$D_IN;
  wire rg_lower_word32$EN;
  // register rg_lower_word32_full
  reg rg_lower_word32_full;
  wire rg_lower_word32_full$D_IN, rg_lower_word32_full$EN;
  // register rg_op
  reg rg_op;
  wire rg_op$D_IN, rg_op$EN;
  // register rg_pa
  reg [31 : 0] rg_pa;
  wire [31 : 0] rg_pa$D_IN;
  wire rg_pa$EN;
  // register rg_pte_pa
  reg [31 : 0] rg_pte_pa;
  wire [31 : 0] rg_pte_pa$D_IN;
  wire rg_pte_pa$EN;
  // register rg_st_amo_val
  reg [63 : 0] rg_st_amo_val;
  wire [63 : 0] rg_st_amo_val$D_IN;
  wire rg_st_amo_val$EN;
  // register rg_state
  reg [3 : 0] rg_state;
  reg [3 : 0] rg_state$D_IN;
  wire rg_state$EN;
  // register rg_tohost_addr
  reg [63 : 0] rg_tohost_addr;
  wire [63 : 0] rg_tohost_addr$D_IN;
  wire rg_tohost_addr$EN;
  // register rg_tohost_value
  reg [63 : 0] rg_tohost_value;
  wire [63 : 0] rg_tohost_value$D_IN;
  wire rg_tohost_value$EN;
  // register rg_victim_way
  reg rg_victim_way;
  wire rg_victim_way$D_IN, rg_victim_way$EN;
  // register rg_watch_tohost
  reg rg_watch_tohost;
  wire rg_watch_tohost$D_IN, rg_watch_tohost$EN;
  // register rg_wr_rsp_err
  reg rg_wr_rsp_err;
  wire rg_wr_rsp_err$D_IN, rg_wr_rsp_err$EN;
  // ports of submodule f_fabric_write_reqs
  wire [98 : 0] f_fabric_write_reqs$D_IN, f_fabric_write_reqs$D_OUT;
  wire f_fabric_write_reqs$CLR,
       f_fabric_write_reqs$DEQ,
       f_fabric_write_reqs$EMPTY_N,
       f_fabric_write_reqs$ENQ,
       f_fabric_write_reqs$FULL_N;
  // ports of submodule f_reset_reqs
  wire f_reset_reqs$CLR,
       f_reset_reqs$DEQ,
       f_reset_reqs$D_IN,
       f_reset_reqs$D_OUT,
       f_reset_reqs$EMPTY_N,
       f_reset_reqs$ENQ,
       f_reset_reqs$FULL_N;
  // ports of submodule f_reset_rsps
  wire f_reset_rsps$CLR,
       f_reset_rsps$DEQ,
       f_reset_rsps$D_IN,
       f_reset_rsps$D_OUT,
       f_reset_rsps$EMPTY_N,
       f_reset_rsps$ENQ,
       f_reset_rsps$FULL_N;
  // ports of submodule master_xactor_f_rd_addr
  wire [96 : 0] master_xactor_f_rd_addr$D_IN, master_xactor_f_rd_addr$D_OUT;
  wire master_xactor_f_rd_addr$CLR,
       master_xactor_f_rd_addr$DEQ,
       master_xactor_f_rd_addr$EMPTY_N,
       master_xactor_f_rd_addr$ENQ,
       master_xactor_f_rd_addr$FULL_N;
  // ports of submodule master_xactor_f_rd_data
  wire [70 : 0] master_xactor_f_rd_data$D_IN, master_xactor_f_rd_data$D_OUT;
  wire master_xactor_f_rd_data$CLR,
       master_xactor_f_rd_data$DEQ,
       master_xactor_f_rd_data$EMPTY_N,
       master_xactor_f_rd_data$ENQ,
       master_xactor_f_rd_data$FULL_N;
  // ports of submodule master_xactor_f_wr_addr
  wire [96 : 0] master_xactor_f_wr_addr$D_IN, master_xactor_f_wr_addr$D_OUT;
  wire master_xactor_f_wr_addr$CLR,
       master_xactor_f_wr_addr$DEQ,
       master_xactor_f_wr_addr$EMPTY_N,
       master_xactor_f_wr_addr$ENQ,
       master_xactor_f_wr_addr$FULL_N;
  // ports of submodule master_xactor_f_wr_data
  wire [72 : 0] master_xactor_f_wr_data$D_IN, master_xactor_f_wr_data$D_OUT;
  wire master_xactor_f_wr_data$CLR,
       master_xactor_f_wr_data$DEQ,
       master_xactor_f_wr_data$EMPTY_N,
       master_xactor_f_wr_data$ENQ,
       master_xactor_f_wr_data$FULL_N;
  // ports of submodule master_xactor_f_wr_resp
  wire [5 : 0] master_xactor_f_wr_resp$D_IN, master_xactor_f_wr_resp$D_OUT;
  wire master_xactor_f_wr_resp$CLR,
       master_xactor_f_wr_resp$DEQ,
       master_xactor_f_wr_resp$EMPTY_N,
       master_xactor_f_wr_resp$ENQ,
       master_xactor_f_wr_resp$FULL_N;
  // ports of submodule ram_cword_set
  reg [127 : 0] ram_cword_set$DIB;
  reg [8 : 0] ram_cword_set$ADDRB;
  wire [127 : 0] ram_cword_set$DIA, ram_cword_set$DOB;
  wire [8 : 0] ram_cword_set$ADDRA;
  wire ram_cword_set$ENA,
       ram_cword_set$ENB,
       ram_cword_set$WEA,
       ram_cword_set$WEB;
  // ports of submodule ram_state_and_ctag_cset
  wire [41 : 0] ram_state_and_ctag_cset$DIA,
		ram_state_and_ctag_cset$DIB,
		ram_state_and_ctag_cset$DOB;
  wire [5 : 0] ram_state_and_ctag_cset$ADDRA, ram_state_and_ctag_cset$ADDRB;
  wire ram_state_and_ctag_cset$ENA,
       ram_state_and_ctag_cset$ENB,
       ram_state_and_ctag_cset$WEA,
       ram_state_and_ctag_cset$WEB;
  // ports of submodule soc_map
  wire [63 : 0] soc_map$m_is_IO_addr_addr,
		soc_map$m_is_mem_addr_addr,
		soc_map$m_is_near_mem_IO_addr_addr;
  wire soc_map$m_is_mem_addr;
  // rule scheduling signals
  wire CAN_FIRE_RL_rl_ST_AMO_response,
       CAN_FIRE_RL_rl_cache_refill_rsps_loop,
       CAN_FIRE_RL_rl_discard_write_rsp,
       CAN_FIRE_RL_rl_drive_exception_rsp,
       CAN_FIRE_RL_rl_fabric_send_write_req,
       CAN_FIRE_RL_rl_io_read_req,
       CAN_FIRE_RL_rl_io_read_rsp,
       CAN_FIRE_RL_rl_io_write_req,
       CAN_FIRE_RL_rl_maintain_io_read_rsp,
       CAN_FIRE_RL_rl_probe_and_immed_rsp,
       CAN_FIRE_RL_rl_rereq,
       CAN_FIRE_RL_rl_reset,
       CAN_FIRE_RL_rl_start_cache_refill,
       CAN_FIRE_RL_rl_start_reset,
       CAN_FIRE_ma_ddr4_ready,
       CAN_FIRE_mem_master_m_arready,
       CAN_FIRE_mem_master_m_awready,
       CAN_FIRE_mem_master_m_bvalid,
       CAN_FIRE_mem_master_m_rvalid,
       CAN_FIRE_mem_master_m_wready,
       CAN_FIRE_req,
       CAN_FIRE_server_flush_request_put,
       CAN_FIRE_server_flush_response_get,
       CAN_FIRE_server_reset_request_put,
       CAN_FIRE_server_reset_response_get,
       CAN_FIRE_set_verbosity,
       CAN_FIRE_set_watch_tohost,
       CAN_FIRE_tlb_flush,
       WILL_FIRE_RL_rl_ST_AMO_response,
       WILL_FIRE_RL_rl_cache_refill_rsps_loop,
       WILL_FIRE_RL_rl_discard_write_rsp,
       WILL_FIRE_RL_rl_drive_exception_rsp,
       WILL_FIRE_RL_rl_fabric_send_write_req,
       WILL_FIRE_RL_rl_io_read_req,
       WILL_FIRE_RL_rl_io_read_rsp,
       WILL_FIRE_RL_rl_io_write_req,
       WILL_FIRE_RL_rl_maintain_io_read_rsp,
       WILL_FIRE_RL_rl_probe_and_immed_rsp,
       WILL_FIRE_RL_rl_rereq,
       WILL_FIRE_RL_rl_reset,
       WILL_FIRE_RL_rl_start_cache_refill,
       WILL_FIRE_RL_rl_start_reset,
       WILL_FIRE_ma_ddr4_ready,
       WILL_FIRE_mem_master_m_arready,
       WILL_FIRE_mem_master_m_awready,
       WILL_FIRE_mem_master_m_bvalid,
       WILL_FIRE_mem_master_m_rvalid,
       WILL_FIRE_mem_master_m_wready,
       WILL_FIRE_req,
       WILL_FIRE_server_flush_request_put,
       WILL_FIRE_server_flush_response_get,
       WILL_FIRE_server_reset_request_put,
       WILL_FIRE_server_reset_response_get,
       WILL_FIRE_set_verbosity,
       WILL_FIRE_set_watch_tohost,
       WILL_FIRE_tlb_flush;
  // inputs to muxes for submodule ports
  reg [63 : 0] MUX_dw_output_ld_val$wset_1__VAL_2;
  wire [127 : 0] MUX_ram_cword_set$a_put_3__VAL_1,
		 MUX_ram_cword_set$a_put_3__VAL_2;
  wire [98 : 0] MUX_f_fabric_write_reqs$enq_1__VAL_1,
		MUX_f_fabric_write_reqs$enq_1__VAL_2;
  wire [96 : 0] MUX_master_xactor_f_rd_addr$enq_1__VAL_1,
		MUX_master_xactor_f_rd_addr$enq_1__VAL_2;
  wire [41 : 0] MUX_ram_state_and_ctag_cset$a_put_3__VAL_1;
  wire [8 : 0] MUX_ram_cword_set$b_put_2__VAL_2,
	       MUX_ram_cword_set$b_put_2__VAL_4;
  wire [5 : 0] MUX_rg_cset_in_cache$write_1__VAL_1;
  wire [3 : 0] MUX_rg_exc_code$write_1__VAL_1,
	       MUX_rg_state$write_1__VAL_1,
	       MUX_rg_state$write_1__VAL_4,
	       MUX_rg_state$write_1__VAL_7,
	       MUX_rg_state$write_1__VAL_9;
  wire MUX_dw_output_ld_val$wset_1__SEL_1,
       MUX_dw_output_ld_val$wset_1__SEL_2,
       MUX_dw_output_ld_val$wset_1__SEL_3,
       MUX_f_fabric_write_reqs$enq_1__SEL_1,
       MUX_ram_cword_set$a_put_1__SEL_1,
       MUX_ram_cword_set$b_put_1__SEL_1,
       MUX_ram_cword_set$b_put_1__SEL_2,
       MUX_ram_state_and_ctag_cset$a_put_1__SEL_1,
       MUX_rg_error_during_refill$write_1__SEL_1,
       MUX_rg_exc_code$write_1__SEL_1,
       MUX_rg_exc_code$write_1__SEL_2,
       MUX_rg_state$write_1__SEL_10,
       MUX_rg_state$write_1__SEL_2,
       MUX_rg_state$write_1__SEL_3,
       MUX_rg_state$write_1__SEL_7,
       MUX_rg_state$write_1__SEL_9;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h4138;
  reg [31 : 0] v__h4237;
  reg [31 : 0] v__h4387;
  reg [31 : 0] v__h19609;
  reg [31 : 0] v__h29555;
  reg [31 : 0] v__h21729;
  reg [31 : 0] v__h22468;
  reg [31 : 0] v__h22710;
  reg [31 : 0] v__h29487;
  reg [31 : 0] v__h25183;
  reg [31 : 0] v__h25477;
  reg [31 : 0] v__h26579;
  reg [31 : 0] v__h26686;
  reg [31 : 0] v__h26791;
  reg [31 : 0] v__h26871;
  reg [31 : 0] v__h27470;
  reg [31 : 0] v__h27512;
  reg [31 : 0] v__h3670;
  reg [31 : 0] v__h27880;
  reg [31 : 0] v__h3664;
  reg [31 : 0] v__h4132;
  reg [31 : 0] v__h4231;
  reg [31 : 0] v__h4381;
  reg [31 : 0] v__h19603;
  reg [31 : 0] v__h21723;
  reg [31 : 0] v__h22462;
  reg [31 : 0] v__h22704;
  reg [31 : 0] v__h25177;
  reg [31 : 0] v__h25471;
  reg [31 : 0] v__h26573;
  reg [31 : 0] v__h26680;
  reg [31 : 0] v__h26785;
  reg [31 : 0] v__h26865;
  reg [31 : 0] v__h27464;
  reg [31 : 0] v__h27506;
  reg [31 : 0] v__h27874;
  reg [31 : 0] v__h29481;
  reg [31 : 0] v__h29549;
  // synopsys translate_on
  // remaining internal signals
  reg [63 : 0] CASE_rg_addr_BITS_2_TO_0_0x0_old_cword9866_BIT_ETC__q29,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result6357_0x4_re_ETC__q30,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result6422_0x4_re_ETC__q31,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result9432_0x4_re_ETC__q32,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result9499_0x4_re_ETC__q33,
	       IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d324,
	       IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d345,
	       IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d510,
	       IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d530,
	       IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d180,
	       IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d190,
	       IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d307,
	       IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d336,
	       IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d494,
	       IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d522,
	       ld_val__h25586,
	       mem_req_wr_data_wdata__h2886,
	       n__h19877,
	       old_cword__h19866;
  reg [7 : 0] mem_req_wr_data_wstrb__h2887;
  reg [2 : 0] value__h25364, x__h2707;
  wire [63 : 0] IF_NOT_ram_state_and_ctag_cset_b_read__00_BIT__ETC___d203,
		IF_ram_state_and_ctag_cset_b_read__00_BIT_41_0_ETC___d202,
		_theResult___snd_fst__h2894,
		cline_fabric_addr__h21782,
		fabric_addr__h25235,
		mem_req_wr_addr_awaddr__h2660,
		result__h18728,
		result__h18756,
		result__h18784,
		result__h18812,
		result__h18840,
		result__h18868,
		result__h18896,
		result__h18941,
		result__h18969,
		result__h18997,
		result__h19025,
		result__h19053,
		result__h19081,
		result__h19109,
		result__h19137,
		result__h19182,
		result__h19210,
		result__h19238,
		result__h19266,
		result__h19307,
		result__h19335,
		result__h19363,
		result__h19391,
		result__h19432,
		result__h19460,
		result__h19499,
		result__h19527,
		result__h25646,
		result__h25676,
		result__h25703,
		result__h25730,
		result__h25757,
		result__h25784,
		result__h25811,
		result__h25838,
		result__h25882,
		result__h25909,
		result__h25936,
		result__h25963,
		result__h25990,
		result__h26017,
		result__h26044,
		result__h26071,
		result__h26115,
		result__h26142,
		result__h26169,
		result__h26196,
		result__h26236,
		result__h26263,
		result__h26290,
		result__h26317,
		result__h26357,
		result__h26384,
		result__h26422,
		result__h26449,
		result__h6044,
		word64__h5893,
		x__h6078,
		y__h12408,
		y__h6079,
		y__h6093;
  wire [31 : 0] cline_addr__h21781,
		master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3,
		master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10,
		word64893_BITS_31_TO_0__q17,
		word64893_BITS_63_TO_32__q24;
  wire [15 : 0] master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2,
		master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q6,
		master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q9,
		master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13,
		word64893_BITS_15_TO_0__q16,
		word64893_BITS_31_TO_16__q20,
		word64893_BITS_47_TO_32__q23,
		word64893_BITS_63_TO_48__q27;
  wire [7 : 0] master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1,
	       master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4,
	       master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q5,
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q7,
	       master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q8,
	       master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11,
	       master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12,
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14,
	       strobe64__h2824,
	       strobe64__h2826,
	       strobe64__h2828,
	       word64893_BITS_15_TO_8__q18,
	       word64893_BITS_23_TO_16__q19,
	       word64893_BITS_31_TO_24__q21,
	       word64893_BITS_39_TO_32__q22,
	       word64893_BITS_47_TO_40__q25,
	       word64893_BITS_55_TO_48__q26,
	       word64893_BITS_63_TO_56__q28,
	       word64893_BITS_7_TO_0__q15;
  wire [5 : 0] shift_bits__h2674;
  wire [3 : 0] access_exc_code__h2442, b__h21683;
  wire [1 : 0] tmp__h21944, tmp__h21945;
  wire NOT_cfg_verbosity_read__2_ULE_1_3___d44,
       NOT_cfg_verbosity_read__2_ULE_2_92___d393,
       NOT_dmem_not_imem_26_OR_soc_map_m_is_mem_addr__ETC___d131,
       NOT_ram_state_and_ctag_cset_b_read__00_BIT_20__ETC___d208,
       NOT_req_f3_BITS_1_TO_0_01_EQ_0b0_02_03_AND_NOT_ETC___d622,
       NOT_rg_op_6_7_AND_ram_state_and_ctag_cset_b_re_ETC___d215,
       ram_state_and_ctag_cset_b_read__00_BITS_19_TO__ETC___d114,
       ram_state_and_ctag_cset_b_read__00_BITS_40_TO__ETC___d117,
       ram_state_and_ctag_cset_b_read__00_BIT_20_01_A_ETC___d205,
       req_f3_BITS_1_TO_0_01_EQ_0b0_02_OR_req_f3_BITS_ETC___d631,
       rg_op_6_AND_ram_state_and_ctag_cset_b_read__00_ETC___d134,
       rg_op_6_OR_NOT_ram_state_and_ctag_cset_b_read__ETC___d121;
  // action method set_verbosity
  assign RDY_set_verbosity = 1'd1 ;
  assign CAN_FIRE_set_verbosity = 1'd1 ;
  assign WILL_FIRE_set_verbosity = EN_set_verbosity ;
  // action method server_reset_request_put
  assign RDY_server_reset_request_put = f_reset_reqs$FULL_N ;
  assign CAN_FIRE_server_reset_request_put = f_reset_reqs$FULL_N ;
  assign WILL_FIRE_server_reset_request_put = EN_server_reset_request_put ;
  // action method server_reset_response_get
  assign RDY_server_reset_response_get =
	     !f_reset_rsps$D_OUT && f_reset_rsps$EMPTY_N ;
  assign CAN_FIRE_server_reset_response_get =
	     !f_reset_rsps$D_OUT && f_reset_rsps$EMPTY_N ;
  assign WILL_FIRE_server_reset_response_get = EN_server_reset_response_get ;
  // action method req
  assign CAN_FIRE_req = 1'd1 ;
  assign WILL_FIRE_req = EN_req ;
  // value method valid
  assign valid = dw_valid$whas ;
  // value method addr
  assign addr = rg_addr ;
  // value method cword
  always@(MUX_dw_output_ld_val$wset_1__SEL_1 or
	  ld_val__h25586 or
	  MUX_dw_output_ld_val$wset_1__SEL_2 or
	  MUX_dw_output_ld_val$wset_1__VAL_2 or
	  MUX_dw_output_ld_val$wset_1__SEL_3 or rg_ld_val)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_dw_output_ld_val$wset_1__SEL_1: cword = ld_val__h25586;
      MUX_dw_output_ld_val$wset_1__SEL_2:
	  cword = MUX_dw_output_ld_val$wset_1__VAL_2;
      MUX_dw_output_ld_val$wset_1__SEL_3: cword = rg_ld_val;
      default: cword = 64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  // value method st_amo_val
  assign st_amo_val =
	     MUX_dw_output_ld_val$wset_1__SEL_2 ? 64'd0 : rg_st_amo_val ;
  // value method exc
  assign exc = rg_state == 4'd4 ;
  // value method exc_code
  assign exc_code = rg_exc_code ;
  // action method server_flush_request_put
  assign RDY_server_flush_request_put = f_reset_reqs$FULL_N ;
  assign CAN_FIRE_server_flush_request_put = f_reset_reqs$FULL_N ;
  assign WILL_FIRE_server_flush_request_put = EN_server_flush_request_put ;
  // action method server_flush_response_get
  assign RDY_server_flush_response_get =
	     f_reset_rsps$D_OUT && f_reset_rsps$EMPTY_N ;
  assign CAN_FIRE_server_flush_response_get =
	     f_reset_rsps$D_OUT && f_reset_rsps$EMPTY_N ;
  assign WILL_FIRE_server_flush_response_get = EN_server_flush_response_get ;
  // action method tlb_flush
  assign RDY_tlb_flush = 1'd1 ;
  assign CAN_FIRE_tlb_flush = 1'd1 ;
  assign WILL_FIRE_tlb_flush = EN_tlb_flush ;
  // value method mem_master_m_awvalid
  assign mem_master_awvalid = master_xactor_f_wr_addr$EMPTY_N ;
  // value method mem_master_m_awid
  assign mem_master_awid = master_xactor_f_wr_addr$D_OUT[96:93] ;
  // value method mem_master_m_awaddr
  assign mem_master_awaddr = master_xactor_f_wr_addr$D_OUT[92:29] ;
  // value method mem_master_m_awlen
  assign mem_master_awlen = master_xactor_f_wr_addr$D_OUT[28:21] ;
  // value method mem_master_m_awsize
  assign mem_master_awsize = master_xactor_f_wr_addr$D_OUT[20:18] ;
  // value method mem_master_m_awburst
  assign mem_master_awburst = master_xactor_f_wr_addr$D_OUT[17:16] ;
  // value method mem_master_m_awlock
  assign mem_master_awlock = master_xactor_f_wr_addr$D_OUT[15] ;
  // value method mem_master_m_awcache
  assign mem_master_awcache = master_xactor_f_wr_addr$D_OUT[14:11] ;
  // value method mem_master_m_awprot
  assign mem_master_awprot = master_xactor_f_wr_addr$D_OUT[10:8] ;
  // value method mem_master_m_awqos
  assign mem_master_awqos = master_xactor_f_wr_addr$D_OUT[7:4] ;
  // value method mem_master_m_awregion
  assign mem_master_awregion = master_xactor_f_wr_addr$D_OUT[3:0] ;
  // action method mem_master_m_awready
  assign CAN_FIRE_mem_master_m_awready = 1'd1 ;
  assign WILL_FIRE_mem_master_m_awready = 1'd1 ;
  // value method mem_master_m_wvalid
  assign mem_master_wvalid = master_xactor_f_wr_data$EMPTY_N ;
  // value method mem_master_m_wdata
  assign mem_master_wdata = master_xactor_f_wr_data$D_OUT[72:9] ;
  // value method mem_master_m_wstrb
  assign mem_master_wstrb = master_xactor_f_wr_data$D_OUT[8:1] ;
  // value method mem_master_m_wlast
  assign mem_master_wlast = master_xactor_f_wr_data$D_OUT[0] ;
  // action method mem_master_m_wready
  assign CAN_FIRE_mem_master_m_wready = 1'd1 ;
  assign WILL_FIRE_mem_master_m_wready = 1'd1 ;
  // action method mem_master_m_bvalid
  assign CAN_FIRE_mem_master_m_bvalid = 1'd1 ;
  assign WILL_FIRE_mem_master_m_bvalid = 1'd1 ;
  // value method mem_master_m_bready
  assign mem_master_bready = master_xactor_f_wr_resp$FULL_N ;
  // value method mem_master_m_arvalid
  assign mem_master_arvalid = master_xactor_f_rd_addr$EMPTY_N ;
  // value method mem_master_m_arid
  assign mem_master_arid = master_xactor_f_rd_addr$D_OUT[96:93] ;
  // value method mem_master_m_araddr
  assign mem_master_araddr = master_xactor_f_rd_addr$D_OUT[92:29] ;
  // value method mem_master_m_arlen
  assign mem_master_arlen = master_xactor_f_rd_addr$D_OUT[28:21] ;
  // value method mem_master_m_arsize
  assign mem_master_arsize = master_xactor_f_rd_addr$D_OUT[20:18] ;
  // value method mem_master_m_arburst
  assign mem_master_arburst = master_xactor_f_rd_addr$D_OUT[17:16] ;
  // value method mem_master_m_arlock
  assign mem_master_arlock = master_xactor_f_rd_addr$D_OUT[15] ;
  // value method mem_master_m_arcache
  assign mem_master_arcache = master_xactor_f_rd_addr$D_OUT[14:11] ;
  // value method mem_master_m_arprot
  assign mem_master_arprot = master_xactor_f_rd_addr$D_OUT[10:8] ;
  // value method mem_master_m_arqos
  assign mem_master_arqos = master_xactor_f_rd_addr$D_OUT[7:4] ;
  // value method mem_master_m_arregion
  assign mem_master_arregion = master_xactor_f_rd_addr$D_OUT[3:0] ;
  // action method mem_master_m_arready
  assign CAN_FIRE_mem_master_m_arready = 1'd1 ;
  assign WILL_FIRE_mem_master_m_arready = 1'd1 ;
  // action method mem_master_m_rvalid
  assign CAN_FIRE_mem_master_m_rvalid = 1'd1 ;
  assign WILL_FIRE_mem_master_m_rvalid = 1'd1 ;
  // value method mem_master_m_rready
  assign mem_master_rready = master_xactor_f_rd_data$FULL_N ;
  // action method set_watch_tohost
  assign RDY_set_watch_tohost = 1'd1 ;
  assign CAN_FIRE_set_watch_tohost = 1'd1 ;
  assign WILL_FIRE_set_watch_tohost = EN_set_watch_tohost ;
  // value method mv_tohost_value
  assign mv_tohost_value = rg_tohost_value ;
  assign RDY_mv_tohost_value = 1'd1 ;
  // action method ma_ddr4_ready
  assign RDY_ma_ddr4_ready = 1'd1 ;
  assign CAN_FIRE_ma_ddr4_ready = 1'd1 ;
  assign WILL_FIRE_ma_ddr4_ready = EN_ma_ddr4_ready ;
  // value method mv_status
  assign mv_status = rg_wr_rsp_err ? 8'd1 : 8'd0 ;
  // submodule f_fabric_write_reqs
  FIFO2 #(.width(32'd99), .guarded(32'd1)) f_fabric_write_reqs(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(f_fabric_write_reqs$D_IN),
							       .ENQ(f_fabric_write_reqs$ENQ),
							       .DEQ(f_fabric_write_reqs$DEQ),
							       .CLR(f_fabric_write_reqs$CLR),
							       .D_OUT(f_fabric_write_reqs$D_OUT),
							       .FULL_N(f_fabric_write_reqs$FULL_N),
							       .EMPTY_N(f_fabric_write_reqs$EMPTY_N));
  // submodule f_reset_reqs
  FIFO2 #(.width(32'd1), .guarded(32'd1)) f_reset_reqs(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(f_reset_reqs$D_IN),
						       .ENQ(f_reset_reqs$ENQ),
						       .DEQ(f_reset_reqs$DEQ),
						       .CLR(f_reset_reqs$CLR),
						       .D_OUT(f_reset_reqs$D_OUT),
						       .FULL_N(f_reset_reqs$FULL_N),
						       .EMPTY_N(f_reset_reqs$EMPTY_N));
  // submodule f_reset_rsps
  FIFO2 #(.width(32'd1), .guarded(32'd1)) f_reset_rsps(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(f_reset_rsps$D_IN),
						       .ENQ(f_reset_rsps$ENQ),
						       .DEQ(f_reset_rsps$DEQ),
						       .CLR(f_reset_rsps$CLR),
						       .D_OUT(f_reset_rsps$D_OUT),
						       .FULL_N(f_reset_rsps$FULL_N),
						       .EMPTY_N(f_reset_rsps$EMPTY_N));
  // submodule master_xactor_f_rd_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) master_xactor_f_rd_addr(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(master_xactor_f_rd_addr$D_IN),
						   .ENQ(master_xactor_f_rd_addr$ENQ),
						   .DEQ(master_xactor_f_rd_addr$DEQ),
						   .CLR(master_xactor_f_rd_addr$CLR),
						   .D_OUT(master_xactor_f_rd_addr$D_OUT),
						   .FULL_N(master_xactor_f_rd_addr$FULL_N),
						   .EMPTY_N(master_xactor_f_rd_addr$EMPTY_N));
  // submodule master_xactor_f_rd_data
  FIFO2 #(.width(32'd71),
	  .guarded(32'd1)) master_xactor_f_rd_data(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(master_xactor_f_rd_data$D_IN),
						   .ENQ(master_xactor_f_rd_data$ENQ),
						   .DEQ(master_xactor_f_rd_data$DEQ),
						   .CLR(master_xactor_f_rd_data$CLR),
						   .D_OUT(master_xactor_f_rd_data$D_OUT),
						   .FULL_N(master_xactor_f_rd_data$FULL_N),
						   .EMPTY_N(master_xactor_f_rd_data$EMPTY_N));
  // submodule master_xactor_f_wr_addr
  FIFO2 #(.width(32'd97),
	  .guarded(32'd1)) master_xactor_f_wr_addr(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(master_xactor_f_wr_addr$D_IN),
						   .ENQ(master_xactor_f_wr_addr$ENQ),
						   .DEQ(master_xactor_f_wr_addr$DEQ),
						   .CLR(master_xactor_f_wr_addr$CLR),
						   .D_OUT(master_xactor_f_wr_addr$D_OUT),
						   .FULL_N(master_xactor_f_wr_addr$FULL_N),
						   .EMPTY_N(master_xactor_f_wr_addr$EMPTY_N));
  // submodule master_xactor_f_wr_data
  FIFO2 #(.width(32'd73),
	  .guarded(32'd1)) master_xactor_f_wr_data(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(master_xactor_f_wr_data$D_IN),
						   .ENQ(master_xactor_f_wr_data$ENQ),
						   .DEQ(master_xactor_f_wr_data$DEQ),
						   .CLR(master_xactor_f_wr_data$CLR),
						   .D_OUT(master_xactor_f_wr_data$D_OUT),
						   .FULL_N(master_xactor_f_wr_data$FULL_N),
						   .EMPTY_N(master_xactor_f_wr_data$EMPTY_N));
  // submodule master_xactor_f_wr_resp
  FIFO2 #(.width(32'd6), .guarded(32'd1)) master_xactor_f_wr_resp(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(master_xactor_f_wr_resp$D_IN),
								  .ENQ(master_xactor_f_wr_resp$ENQ),
								  .DEQ(master_xactor_f_wr_resp$DEQ),
								  .CLR(master_xactor_f_wr_resp$CLR),
								  .D_OUT(master_xactor_f_wr_resp$D_OUT),
								  .FULL_N(master_xactor_f_wr_resp$FULL_N),
								  .EMPTY_N(master_xactor_f_wr_resp$EMPTY_N));
  // submodule ram_cword_set
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd9),
	  .DATA_WIDTH(32'd128),
	  .MEMSIZE(10'd512)) ram_cword_set(.CLKA(CLK),
					   .CLKB(CLK),
					   .ADDRA(ram_cword_set$ADDRA),
					   .ADDRB(ram_cword_set$ADDRB),
					   .DIA(ram_cword_set$DIA),
					   .DIB(ram_cword_set$DIB),
					   .WEA(ram_cword_set$WEA),
					   .WEB(ram_cword_set$WEB),
					   .ENA(ram_cword_set$ENA),
					   .ENB(ram_cword_set$ENB),
					   .DOA(),
					   .DOB(ram_cword_set$DOB));
  // submodule ram_state_and_ctag_cset
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd6),
	  .DATA_WIDTH(32'd42),
	  .MEMSIZE(7'd64)) ram_state_and_ctag_cset(.CLKA(CLK),
						   .CLKB(CLK),
						   .ADDRA(ram_state_and_ctag_cset$ADDRA),
						   .ADDRB(ram_state_and_ctag_cset$ADDRB),
						   .DIA(ram_state_and_ctag_cset$DIA),
						   .DIB(ram_state_and_ctag_cset$DIB),
						   .WEA(ram_state_and_ctag_cset$WEA),
						   .WEB(ram_state_and_ctag_cset$WEB),
						   .ENA(ram_state_and_ctag_cset$ENA),
						   .ENB(ram_state_and_ctag_cset$ENB),
						   .DOA(),
						   .DOB(ram_state_and_ctag_cset$DOB));
  // submodule soc_map
  mkSoC_Map soc_map(.CLK(CLK),
		    .RST_N(RST_N),
		    .m_is_IO_addr_addr(soc_map$m_is_IO_addr_addr),
		    .m_is_mem_addr_addr(soc_map$m_is_mem_addr_addr),
		    .m_is_near_mem_IO_addr_addr(soc_map$m_is_near_mem_IO_addr_addr),
		    .m_near_mem_io_addr_base(),
		    .m_near_mem_io_addr_size(),
		    .m_near_mem_io_addr_lim(),
		    .m_plic_addr_base(),
		    .m_plic_addr_size(),
		    .m_plic_addr_lim(),
		    .m_uart0_addr_base(),
		    .m_uart0_addr_size(),
		    .m_uart0_addr_lim(),
		    .m_boot_rom_addr_base(),
		    .m_boot_rom_addr_size(),
		    .m_boot_rom_addr_lim(),
		    .m_mem0_controller_addr_base(),
		    .m_mem0_controller_addr_size(),
		    .m_mem0_controller_addr_lim(),
		    .m_tcm_addr_base(),
		    .m_tcm_addr_size(),
		    .m_tcm_addr_lim(),
		    .m_is_mem_addr(soc_map$m_is_mem_addr),
		    .m_is_IO_addr(),
		    .m_is_near_mem_IO_addr(),
		    .m_pc_reset_value(),
		    .m_mtvec_reset_value(),
		    .m_nmivec_reset_value());
  // rule RL_rl_fabric_send_write_req
  assign CAN_FIRE_RL_rl_fabric_send_write_req =
	     ctr_wr_rsps_pending_crg != 4'd15 &&
	     f_fabric_write_reqs$EMPTY_N &&
	     master_xactor_f_wr_addr$FULL_N &&
	     master_xactor_f_wr_data$FULL_N &&
	     rg_ddr4_ready ;
  assign WILL_FIRE_RL_rl_fabric_send_write_req =
	     CAN_FIRE_RL_rl_fabric_send_write_req ;
  // rule RL_rl_reset
  assign CAN_FIRE_RL_rl_reset =
	     (rg_cset_in_cache != 6'd63 ||
	      f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N) &&
	     rg_state == 4'd1 ;
  assign WILL_FIRE_RL_rl_reset = CAN_FIRE_RL_rl_reset ;
  // rule RL_rl_probe_and_immed_rsp
  assign CAN_FIRE_RL_rl_probe_and_immed_rsp =
	     (dmem_not_imem && !soc_map$m_is_mem_addr || !rg_op ||
	      f_fabric_write_reqs$FULL_N) &&
	     rg_ddr4_ready &&
	     rg_state == 4'd3 ;
  assign WILL_FIRE_RL_rl_probe_and_immed_rsp =
	     CAN_FIRE_RL_rl_probe_and_immed_rsp &&
	     !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_start_cache_refill
  assign CAN_FIRE_RL_rl_start_cache_refill =
	     master_xactor_f_rd_addr$FULL_N && rg_state == 4'd8 &&
	     b__h21683 == 4'd0 ;
  assign WILL_FIRE_RL_rl_start_cache_refill =
	     CAN_FIRE_RL_rl_start_cache_refill &&
	     !WILL_FIRE_RL_rl_start_reset &&
	     !EN_req ;
  // rule RL_rl_cache_refill_rsps_loop
  assign CAN_FIRE_RL_rl_cache_refill_rsps_loop =
	     master_xactor_f_rd_data$EMPTY_N && rg_state == 4'd9 ;
  assign WILL_FIRE_RL_rl_cache_refill_rsps_loop =
	     CAN_FIRE_RL_rl_cache_refill_rsps_loop &&
	     !WILL_FIRE_RL_rl_start_reset &&
	     !EN_req ;
  // rule RL_rl_rereq
  assign CAN_FIRE_RL_rl_rereq = rg_state == 4'd10 ;
  assign WILL_FIRE_RL_rl_rereq =
	     CAN_FIRE_RL_rl_rereq && !WILL_FIRE_RL_rl_start_reset && !EN_req ;
  // rule RL_rl_ST_AMO_response
  assign CAN_FIRE_RL_rl_ST_AMO_response = rg_state == 4'd11 ;
  assign WILL_FIRE_RL_rl_ST_AMO_response = CAN_FIRE_RL_rl_ST_AMO_response ;
  // rule RL_rl_io_read_req
  assign CAN_FIRE_RL_rl_io_read_req =
	     master_xactor_f_rd_addr$FULL_N && rg_state == 4'd12 && !rg_op &&
	     b__h21683 == 4'd0 ;
  assign WILL_FIRE_RL_rl_io_read_req =
	     CAN_FIRE_RL_rl_io_read_req && !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_io_read_rsp
  assign CAN_FIRE_RL_rl_io_read_rsp =
	     master_xactor_f_rd_data$EMPTY_N && rg_state == 4'd13 ;
  assign WILL_FIRE_RL_rl_io_read_rsp =
	     CAN_FIRE_RL_rl_io_read_rsp && !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_maintain_io_read_rsp
  assign CAN_FIRE_RL_rl_maintain_io_read_rsp = rg_state == 4'd14 ;
  assign WILL_FIRE_RL_rl_maintain_io_read_rsp =
	     CAN_FIRE_RL_rl_maintain_io_read_rsp ;
  // rule RL_rl_io_write_req
  assign CAN_FIRE_RL_rl_io_write_req =
	     f_fabric_write_reqs$FULL_N && rg_state == 4'd12 && rg_op ;
  assign WILL_FIRE_RL_rl_io_write_req = MUX_rg_state$write_1__SEL_3 ;
  // rule RL_rl_discard_write_rsp
  assign CAN_FIRE_RL_rl_discard_write_rsp =
	     b__h21683 != 4'd0 && master_xactor_f_wr_resp$EMPTY_N ;
  assign WILL_FIRE_RL_rl_discard_write_rsp =
	     CAN_FIRE_RL_rl_discard_write_rsp ;
  // rule RL_rl_drive_exception_rsp
  assign CAN_FIRE_RL_rl_drive_exception_rsp = rg_state == 4'd4 ;
  assign WILL_FIRE_RL_rl_drive_exception_rsp = rg_state == 4'd4 ;
  // rule RL_rl_start_reset
  assign CAN_FIRE_RL_rl_start_reset = MUX_rg_state$write_1__SEL_2 ;
  assign WILL_FIRE_RL_rl_start_reset = MUX_rg_state$write_1__SEL_2 ;
  // inputs to muxes for submodule ports
  assign MUX_dw_output_ld_val$wset_1__SEL_1 =
	     WILL_FIRE_RL_rl_io_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_dw_output_ld_val$wset_1__SEL_2 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     NOT_rg_op_6_7_AND_ram_state_and_ctag_cset_b_re_ETC___d215 ;
  assign MUX_dw_output_ld_val$wset_1__SEL_3 =
	     WILL_FIRE_RL_rl_maintain_io_read_rsp ||
	     WILL_FIRE_RL_rl_ST_AMO_response ;
  assign MUX_f_fabric_write_reqs$enq_1__SEL_1 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op ;
  assign MUX_ram_cword_set$a_put_1__SEL_1 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_ram_cword_set$b_put_1__SEL_1 =
	     EN_req &&
	     req_f3_BITS_1_TO_0_01_EQ_0b0_02_OR_req_f3_BITS_ETC___d631 ;
  assign MUX_ram_cword_set$b_put_1__SEL_2 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] != 3'd7 ;
  assign MUX_ram_state_and_ctag_cset$a_put_1__SEL_1 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] == 3'd0 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_rg_error_during_refill$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign MUX_rg_exc_code$write_1__SEL_1 =
	     EN_req &&
	     NOT_req_f3_BITS_1_TO_0_01_EQ_0b0_02_03_AND_NOT_ETC___d622 ;
  assign MUX_rg_exc_code$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_io_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign MUX_rg_state$write_1__SEL_2 =
	     f_reset_reqs$EMPTY_N && rg_state != 4'd1 ;
  assign MUX_rg_state$write_1__SEL_3 =
	     CAN_FIRE_RL_rl_io_write_req && !WILL_FIRE_RL_rl_start_reset ;
  assign MUX_rg_state$write_1__SEL_7 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] == 3'd7 ;
  assign MUX_rg_state$write_1__SEL_9 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (dmem_not_imem && !soc_map$m_is_mem_addr ||
	      rg_op_6_OR_NOT_ram_state_and_ctag_cset_b_read__ETC___d121) ;
  assign MUX_rg_state$write_1__SEL_10 =
	     WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 ;
  always@(rg_f3 or
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d307 or
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d336 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result9432_0x4_re_ETC__q32 or
	  rg_addr or
	  word64__h5893 or
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d324 or
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d345 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result9499_0x4_re_ETC__q33)
  begin
    case (rg_f3)
      3'b0:
	  MUX_dw_output_ld_val$wset_1__VAL_2 =
	      IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d307;
      3'b001:
	  MUX_dw_output_ld_val$wset_1__VAL_2 =
	      IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d336;
      3'b010:
	  MUX_dw_output_ld_val$wset_1__VAL_2 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result9432_0x4_re_ETC__q32;
      3'b011:
	  MUX_dw_output_ld_val$wset_1__VAL_2 =
	      (rg_addr[2:0] == 3'h0) ? word64__h5893 : 64'd0;
      3'b100:
	  MUX_dw_output_ld_val$wset_1__VAL_2 =
	      IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d324;
      3'b101:
	  MUX_dw_output_ld_val$wset_1__VAL_2 =
	      IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d345;
      3'b110:
	  MUX_dw_output_ld_val$wset_1__VAL_2 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result9499_0x4_re_ETC__q33;
      3'd7: MUX_dw_output_ld_val$wset_1__VAL_2 = 64'd0;
    endcase
  end
  assign MUX_f_fabric_write_reqs$enq_1__VAL_1 =
	     { rg_f3, rg_addr, rg_st_amo_val } ;
  assign MUX_f_fabric_write_reqs$enq_1__VAL_2 =
	     { rg_f3, rg_pa, rg_st_amo_val } ;
  assign MUX_master_xactor_f_rd_addr$enq_1__VAL_1 =
	     { 4'd0, cline_fabric_addr__h21782, 29'd15532032 } ;
  assign MUX_master_xactor_f_rd_addr$enq_1__VAL_2 =
	     { 4'd0, fabric_addr__h25235, 8'd0, value__h25364, 18'd65536 } ;
  assign MUX_ram_cword_set$a_put_3__VAL_1 =
	     rg_victim_way ?
	       { master_xactor_f_rd_data$D_OUT[66:3],
		 ram_cword_set$DOB[63:0] } :
	       { ram_cword_set$DOB[127:64],
		 master_xactor_f_rd_data$D_OUT[66:3] } ;
  assign MUX_ram_cword_set$a_put_3__VAL_2 =
	     { IF_ram_state_and_ctag_cset_b_read__00_BIT_41_0_ETC___d202,
	       IF_NOT_ram_state_and_ctag_cset_b_read__00_BIT__ETC___d203 } ;
  assign MUX_ram_cword_set$b_put_2__VAL_2 = rg_cset_cword_in_cache + 9'd1 ;
  assign MUX_ram_cword_set$b_put_2__VAL_4 = { rg_addr[11:6], 3'd0 } ;
  assign MUX_ram_state_and_ctag_cset$a_put_3__VAL_1 =
	     { rg_victim_way || ram_state_and_ctag_cset$DOB[41],
	       rg_victim_way ?
		 rg_pa[31:12] :
		 ram_state_and_ctag_cset$DOB[40:21],
	       !rg_victim_way || ram_state_and_ctag_cset$DOB[20],
	       rg_victim_way ?
		 ram_state_and_ctag_cset$DOB[19:0] :
		 rg_pa[31:12] } ;
  assign MUX_rg_cset_in_cache$write_1__VAL_1 = rg_cset_in_cache + 6'd1 ;
  assign MUX_rg_exc_code$write_1__VAL_1 = req_op ? 4'd6 : 4'd4 ;
  assign MUX_rg_state$write_1__VAL_1 =
	     NOT_req_f3_BITS_1_TO_0_01_EQ_0b0_02_03_AND_NOT_ETC___d622 ?
	       4'd4 :
	       4'd3 ;
  assign MUX_rg_state$write_1__VAL_4 =
	     (master_xactor_f_rd_data$D_OUT[2:1] == 2'b0) ? 4'd14 : 4'd4 ;
  assign MUX_rg_state$write_1__VAL_7 =
	     (master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	      rg_error_during_refill) ?
	       4'd4 :
	       4'd10 ;
  assign MUX_rg_state$write_1__VAL_9 =
	     (dmem_not_imem && !soc_map$m_is_mem_addr) ?
	       4'd12 :
	       (rg_op ? 4'd11 : 4'd8) ;
  // inlined wires
  assign dw_valid$whas =
	     WILL_FIRE_RL_rl_io_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     NOT_rg_op_6_7_AND_ram_state_and_ctag_cset_b_re_ETC___d215 ||
	     WILL_FIRE_RL_rl_drive_exception_rsp ||
	     WILL_FIRE_RL_rl_maintain_io_read_rsp ||
	     WILL_FIRE_RL_rl_ST_AMO_response ;
  assign ctr_wr_rsps_pending_crg$port0__write_1 =
	     ctr_wr_rsps_pending_crg + 4'd1 ;
  assign ctr_wr_rsps_pending_crg$port1__write_1 = b__h21683 - 4'd1 ;
  assign ctr_wr_rsps_pending_crg$port2__read =
	     CAN_FIRE_RL_rl_discard_write_rsp ?
	       ctr_wr_rsps_pending_crg$port1__write_1 :
	       b__h21683 ;
  assign ctr_wr_rsps_pending_crg$EN_port2__write =
	     WILL_FIRE_RL_rl_start_reset && !f_reset_reqs$D_OUT ;
  assign ctr_wr_rsps_pending_crg$port3__read =
	     ctr_wr_rsps_pending_crg$EN_port2__write ?
	       4'd0 :
	       ctr_wr_rsps_pending_crg$port2__read ;
  // register cfg_verbosity
  assign cfg_verbosity$D_IN = set_verbosity_verbosity ;
  assign cfg_verbosity$EN = EN_set_verbosity ;
  // register ctr_wr_rsps_pending_crg
  assign ctr_wr_rsps_pending_crg$D_IN = ctr_wr_rsps_pending_crg$port3__read ;
  assign ctr_wr_rsps_pending_crg$EN = 1'b1 ;
  // register rg_addr
  assign rg_addr$D_IN = req_addr ;
  assign rg_addr$EN = EN_req ;
  // register rg_cset_cword_in_cache
  assign rg_cset_cword_in_cache$D_IN =
	     MUX_ram_cword_set$b_put_1__SEL_2 ?
	       MUX_ram_cword_set$b_put_2__VAL_2 :
	       MUX_ram_cword_set$b_put_2__VAL_4 ;
  assign rg_cset_cword_in_cache$EN =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] != 3'd7 ||
	     WILL_FIRE_RL_rl_start_cache_refill ;
  // register rg_cset_in_cache
  assign rg_cset_in_cache$D_IN =
	     WILL_FIRE_RL_rl_reset ?
	       MUX_rg_cset_in_cache$write_1__VAL_1 :
	       6'd0 ;
  assign rg_cset_in_cache$EN =
	     WILL_FIRE_RL_rl_reset || WILL_FIRE_RL_rl_start_reset ;
  // register rg_ddr4_ready
  assign rg_ddr4_ready$D_IN = 1'd1 ;
  assign rg_ddr4_ready$EN = EN_ma_ddr4_ready ;
  // register rg_error_during_refill
  assign rg_error_during_refill$D_IN =
	     MUX_rg_error_during_refill$write_1__SEL_1 ;
  assign rg_error_during_refill$EN =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	     WILL_FIRE_RL_rl_start_cache_refill ;
  // register rg_exc_code
  always@(MUX_rg_exc_code$write_1__SEL_1 or
	  MUX_rg_exc_code$write_1__VAL_1 or
	  MUX_rg_exc_code$write_1__SEL_2 or
	  MUX_rg_error_during_refill$write_1__SEL_1 or access_exc_code__h2442)
  case (1'b1)
    MUX_rg_exc_code$write_1__SEL_1:
	rg_exc_code$D_IN = MUX_rg_exc_code$write_1__VAL_1;
    MUX_rg_exc_code$write_1__SEL_2: rg_exc_code$D_IN = 4'd5;
    MUX_rg_error_during_refill$write_1__SEL_1:
	rg_exc_code$D_IN = access_exc_code__h2442;
    default: rg_exc_code$D_IN = 4'b1010 /* unspecified value */ ;
  endcase
  assign rg_exc_code$EN =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	     WILL_FIRE_RL_rl_io_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	     EN_req &&
	     NOT_req_f3_BITS_1_TO_0_01_EQ_0b0_02_03_AND_NOT_ETC___d622 ;
  // register rg_f3
  assign rg_f3$D_IN = req_f3 ;
  assign rg_f3$EN = EN_req ;
  // register rg_ld_val
  assign rg_ld_val$D_IN = ld_val__h25586 ;
  assign rg_ld_val$EN = WILL_FIRE_RL_rl_io_read_rsp ;
  // register rg_lower_word32
  assign rg_lower_word32$D_IN = 32'h0 ;
  assign rg_lower_word32$EN = 1'b0 ;
  // register rg_lower_word32_full
  assign rg_lower_word32_full$D_IN = 1'd0 ;
  assign rg_lower_word32_full$EN =
	     WILL_FIRE_RL_rl_start_cache_refill ||
	     WILL_FIRE_RL_rl_start_reset ;
  // register rg_op
  assign rg_op$D_IN = req_op ;
  assign rg_op$EN = EN_req ;
  // register rg_pa
  assign rg_pa$D_IN = EN_req ? req_addr : rg_addr ;
  assign rg_pa$EN = EN_req || WILL_FIRE_RL_rl_probe_and_immed_rsp ;
  // register rg_pte_pa
  assign rg_pte_pa$D_IN = 32'h0 ;
  assign rg_pte_pa$EN = 1'b0 ;
  // register rg_st_amo_val
  assign rg_st_amo_val$D_IN = req_st_value ;
  assign rg_st_amo_val$EN = EN_req ;
  // register rg_state
  always@(EN_req or
	  MUX_rg_state$write_1__VAL_1 or
	  WILL_FIRE_RL_rl_start_reset or
	  WILL_FIRE_RL_rl_io_write_req or
	  WILL_FIRE_RL_rl_io_read_rsp or
	  MUX_rg_state$write_1__VAL_4 or
	  WILL_FIRE_RL_rl_io_read_req or
	  WILL_FIRE_RL_rl_rereq or
	  MUX_rg_state$write_1__SEL_7 or
	  MUX_rg_state$write_1__VAL_7 or
	  WILL_FIRE_RL_rl_start_cache_refill or
	  MUX_rg_state$write_1__SEL_9 or
	  MUX_rg_state$write_1__VAL_9 or MUX_rg_state$write_1__SEL_10)
  case (1'b1)
    EN_req: rg_state$D_IN = MUX_rg_state$write_1__VAL_1;
    WILL_FIRE_RL_rl_start_reset: rg_state$D_IN = 4'd1;
    WILL_FIRE_RL_rl_io_write_req: rg_state$D_IN = 4'd11;
    WILL_FIRE_RL_rl_io_read_rsp: rg_state$D_IN = MUX_rg_state$write_1__VAL_4;
    WILL_FIRE_RL_rl_io_read_req: rg_state$D_IN = 4'd13;
    WILL_FIRE_RL_rl_rereq: rg_state$D_IN = 4'd3;
    MUX_rg_state$write_1__SEL_7: rg_state$D_IN = MUX_rg_state$write_1__VAL_7;
    WILL_FIRE_RL_rl_start_cache_refill: rg_state$D_IN = 4'd9;
    MUX_rg_state$write_1__SEL_9: rg_state$D_IN = MUX_rg_state$write_1__VAL_9;
    MUX_rg_state$write_1__SEL_10: rg_state$D_IN = 4'd2;
    default: rg_state$D_IN = 4'b1010 /* unspecified value */ ;
  endcase
  assign rg_state$EN =
	     WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 ||
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] == 3'd7 ||
	     MUX_rg_state$write_1__SEL_9 ||
	     WILL_FIRE_RL_rl_io_read_rsp ||
	     EN_req ||
	     WILL_FIRE_RL_rl_start_reset ||
	     WILL_FIRE_RL_rl_rereq ||
	     WILL_FIRE_RL_rl_start_cache_refill ||
	     WILL_FIRE_RL_rl_io_write_req ||
	     WILL_FIRE_RL_rl_io_read_req ;
  // register rg_tohost_addr
  assign rg_tohost_addr$D_IN = set_watch_tohost_tohost_addr ;
  assign rg_tohost_addr$EN = EN_set_watch_tohost ;
  // register rg_tohost_value
  assign rg_tohost_value$D_IN = rg_st_amo_val ;
  assign rg_tohost_value$EN =
	     WILL_FIRE_RL_rl_ST_AMO_response && rg_watch_tohost &&
	     fabric_addr__h25235 == rg_tohost_addr &&
	     rg_st_amo_val != 64'd0 ;
  // register rg_victim_way
  assign rg_victim_way$D_IN = tmp__h21945[0] ;
  assign rg_victim_way$EN = WILL_FIRE_RL_rl_start_cache_refill ;
  // register rg_watch_tohost
  assign rg_watch_tohost$D_IN = set_watch_tohost_watch_tohost ;
  assign rg_watch_tohost$EN = EN_set_watch_tohost ;
  // register rg_wr_rsp_err
  assign rg_wr_rsp_err$D_IN = 1'd1 ;
  assign rg_wr_rsp_err$EN =
	     WILL_FIRE_RL_rl_discard_write_rsp &&
	     master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0 ;
  // submodule f_fabric_write_reqs
  assign f_fabric_write_reqs$D_IN =
	     MUX_f_fabric_write_reqs$enq_1__SEL_1 ?
	       MUX_f_fabric_write_reqs$enq_1__VAL_1 :
	       MUX_f_fabric_write_reqs$enq_1__VAL_2 ;
  assign f_fabric_write_reqs$ENQ =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op ||
	     WILL_FIRE_RL_rl_io_write_req ;
  assign f_fabric_write_reqs$DEQ = CAN_FIRE_RL_rl_fabric_send_write_req ;
  assign f_fabric_write_reqs$CLR = 1'b0 ;
  // submodule f_reset_reqs
  assign f_reset_reqs$D_IN = !EN_server_reset_request_put ;
  assign f_reset_reqs$ENQ =
	     EN_server_reset_request_put || EN_server_flush_request_put ;
  assign f_reset_reqs$DEQ =
	     WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 ;
  assign f_reset_reqs$CLR = 1'b0 ;
  // submodule f_reset_rsps
  assign f_reset_rsps$D_IN = f_reset_reqs$D_OUT ;
  assign f_reset_rsps$ENQ =
	     WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 ;
  assign f_reset_rsps$DEQ =
	     EN_server_flush_response_get || EN_server_reset_response_get ;
  assign f_reset_rsps$CLR = 1'b0 ;
  // submodule master_xactor_f_rd_addr
  assign master_xactor_f_rd_addr$D_IN =
	     WILL_FIRE_RL_rl_start_cache_refill ?
	       MUX_master_xactor_f_rd_addr$enq_1__VAL_1 :
	       MUX_master_xactor_f_rd_addr$enq_1__VAL_2 ;
  assign master_xactor_f_rd_addr$ENQ =
	     WILL_FIRE_RL_rl_start_cache_refill ||
	     WILL_FIRE_RL_rl_io_read_req ;
  assign master_xactor_f_rd_addr$DEQ =
	     master_xactor_f_rd_addr$EMPTY_N && mem_master_arready ;
  assign master_xactor_f_rd_addr$CLR =
	     WILL_FIRE_RL_rl_start_reset && !f_reset_reqs$D_OUT ;
  // submodule master_xactor_f_rd_data
  assign master_xactor_f_rd_data$D_IN =
	     { mem_master_rid,
	       mem_master_rdata,
	       mem_master_rresp,
	       mem_master_rlast } ;
  assign master_xactor_f_rd_data$ENQ =
	     mem_master_rvalid && master_xactor_f_rd_data$FULL_N ;
  assign master_xactor_f_rd_data$DEQ =
	     WILL_FIRE_RL_rl_io_read_rsp ||
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop ;
  assign master_xactor_f_rd_data$CLR =
	     WILL_FIRE_RL_rl_start_reset && !f_reset_reqs$D_OUT ;
  // submodule master_xactor_f_wr_addr
  assign master_xactor_f_wr_addr$D_IN =
	     { 4'd0,
	       mem_req_wr_addr_awaddr__h2660,
	       8'd0,
	       x__h2707,
	       18'd65536 } ;
  assign master_xactor_f_wr_addr$ENQ = CAN_FIRE_RL_rl_fabric_send_write_req ;
  assign master_xactor_f_wr_addr$DEQ =
	     master_xactor_f_wr_addr$EMPTY_N && mem_master_awready ;
  assign master_xactor_f_wr_addr$CLR =
	     WILL_FIRE_RL_rl_start_reset && !f_reset_reqs$D_OUT ;
  // submodule master_xactor_f_wr_data
  assign master_xactor_f_wr_data$D_IN =
	     { mem_req_wr_data_wdata__h2886,
	       mem_req_wr_data_wstrb__h2887,
	       1'd1 } ;
  assign master_xactor_f_wr_data$ENQ = CAN_FIRE_RL_rl_fabric_send_write_req ;
  assign master_xactor_f_wr_data$DEQ =
	     master_xactor_f_wr_data$EMPTY_N && mem_master_wready ;
  assign master_xactor_f_wr_data$CLR =
	     WILL_FIRE_RL_rl_start_reset && !f_reset_reqs$D_OUT ;
  // submodule master_xactor_f_wr_resp
  assign master_xactor_f_wr_resp$D_IN = { mem_master_bid, mem_master_bresp } ;
  assign master_xactor_f_wr_resp$ENQ =
	     mem_master_bvalid && master_xactor_f_wr_resp$FULL_N ;
  assign master_xactor_f_wr_resp$DEQ = CAN_FIRE_RL_rl_discard_write_rsp ;
  assign master_xactor_f_wr_resp$CLR =
	     WILL_FIRE_RL_rl_start_reset && !f_reset_reqs$D_OUT ;
  // submodule ram_cword_set
  assign ram_cword_set$ADDRA =
	     MUX_ram_cword_set$a_put_1__SEL_1 ?
	       rg_cset_cword_in_cache :
	       rg_addr[11:3] ;
  always@(MUX_ram_cword_set$b_put_1__SEL_1 or
	  req_addr or
	  MUX_ram_cword_set$b_put_1__SEL_2 or
	  MUX_ram_cword_set$b_put_2__VAL_2 or
	  WILL_FIRE_RL_rl_rereq or
	  rg_addr or
	  WILL_FIRE_RL_rl_start_cache_refill or
	  MUX_ram_cword_set$b_put_2__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_ram_cword_set$b_put_1__SEL_1: ram_cword_set$ADDRB = req_addr[11:3];
      MUX_ram_cword_set$b_put_1__SEL_2:
	  ram_cword_set$ADDRB = MUX_ram_cword_set$b_put_2__VAL_2;
      WILL_FIRE_RL_rl_rereq: ram_cword_set$ADDRB = rg_addr[11:3];
      WILL_FIRE_RL_rl_start_cache_refill:
	  ram_cword_set$ADDRB = MUX_ram_cword_set$b_put_2__VAL_4;
      default: ram_cword_set$ADDRB = 9'b010101010 /* unspecified value */ ;
    endcase
  end
  assign ram_cword_set$DIA =
	     MUX_ram_cword_set$a_put_1__SEL_1 ?
	       MUX_ram_cword_set$a_put_3__VAL_1 :
	       MUX_ram_cword_set$a_put_3__VAL_2 ;
  always@(MUX_ram_cword_set$b_put_1__SEL_1 or
	  MUX_ram_cword_set$b_put_1__SEL_2 or
	  WILL_FIRE_RL_rl_rereq or WILL_FIRE_RL_rl_start_cache_refill)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_ram_cword_set$b_put_1__SEL_1:
	  ram_cword_set$DIB =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      MUX_ram_cword_set$b_put_1__SEL_2:
	  ram_cword_set$DIB =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      WILL_FIRE_RL_rl_rereq:
	  ram_cword_set$DIB =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      WILL_FIRE_RL_rl_start_cache_refill:
	  ram_cword_set$DIB =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      default: ram_cword_set$DIB =
		   128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign ram_cword_set$WEA = 1'd1 ;
  assign ram_cword_set$WEB = 1'd0 ;
  assign ram_cword_set$ENA =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op_6_AND_ram_state_and_ctag_cset_b_read__00_ETC___d134 ;
  assign ram_cword_set$ENB =
	     EN_req &&
	     req_f3_BITS_1_TO_0_01_EQ_0b0_02_OR_req_f3_BITS_ETC___d631 ||
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] != 3'd7 ||
	     WILL_FIRE_RL_rl_rereq ||
	     WILL_FIRE_RL_rl_start_cache_refill ;
  // submodule ram_state_and_ctag_cset
  assign ram_state_and_ctag_cset$ADDRA =
	     MUX_ram_state_and_ctag_cset$a_put_1__SEL_1 ?
	       rg_addr[11:6] :
	       rg_cset_in_cache ;
  assign ram_state_and_ctag_cset$ADDRB =
	     MUX_ram_cword_set$b_put_1__SEL_1 ?
	       req_addr[11:6] :
	       rg_addr[11:6] ;
  assign ram_state_and_ctag_cset$DIA =
	     MUX_ram_state_and_ctag_cset$a_put_1__SEL_1 ?
	       MUX_ram_state_and_ctag_cset$a_put_3__VAL_1 :
	       42'h155554AAAAA ;
  assign ram_state_and_ctag_cset$DIB =
	     MUX_ram_cword_set$b_put_1__SEL_1 ?
	       42'h2AAAAAAAAAA /* unspecified value */  :
	       42'h2AAAAAAAAAA /* unspecified value */  ;
  assign ram_state_and_ctag_cset$WEA = 1'd1 ;
  assign ram_state_and_ctag_cset$WEB = 1'd0 ;
  assign ram_state_and_ctag_cset$ENA =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] == 3'd0 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_reset ;
  assign ram_state_and_ctag_cset$ENB =
	     EN_req &&
	     req_f3_BITS_1_TO_0_01_EQ_0b0_02_OR_req_f3_BITS_ETC___d631 ||
	     WILL_FIRE_RL_rl_rereq ;
  // submodule soc_map
  assign soc_map$m_is_IO_addr_addr = 64'h0 ;
  assign soc_map$m_is_mem_addr_addr = { 32'd0, rg_addr } ;
  assign soc_map$m_is_near_mem_IO_addr_addr = 64'h0 ;
  // remaining internal signals
  assign IF_NOT_ram_state_and_ctag_cset_b_read__00_BIT__ETC___d203 =
	     (!ram_state_and_ctag_cset$DOB[41] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_40_TO__ETC___d117) ?
	       n__h19877 :
	       ram_cword_set$DOB[63:0] ;
  assign IF_ram_state_and_ctag_cset_b_read__00_BIT_41_0_ETC___d202 =
	     (ram_state_and_ctag_cset$DOB[41] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_40_TO__ETC___d117) ?
	       n__h19877 :
	       ram_cword_set$DOB[127:64] ;
  assign NOT_cfg_verbosity_read__2_ULE_1_3___d44 = cfg_verbosity > 4'd1 ;
  assign NOT_cfg_verbosity_read__2_ULE_2_92___d393 = cfg_verbosity > 4'd2 ;
  assign NOT_dmem_not_imem_26_OR_soc_map_m_is_mem_addr__ETC___d131 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     ram_state_and_ctag_cset$DOB[20] &&
	     ram_state_and_ctag_cset_b_read__00_BITS_19_TO__ETC___d114 &&
	     ram_state_and_ctag_cset$DOB[41] &&
	     ram_state_and_ctag_cset_b_read__00_BITS_40_TO__ETC___d117 ;
  assign NOT_ram_state_and_ctag_cset_b_read__00_BIT_20__ETC___d208 =
	     (!ram_state_and_ctag_cset$DOB[20] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_19_TO__ETC___d114) &&
	     (!ram_state_and_ctag_cset$DOB[41] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_40_TO__ETC___d117) &&
	     NOT_cfg_verbosity_read__2_ULE_1_3___d44 ;
  assign NOT_req_f3_BITS_1_TO_0_01_EQ_0b0_02_03_AND_NOT_ETC___d622 =
	     req_f3[1:0] != 2'b0 && (req_f3[1:0] != 2'b01 || req_addr[0]) &&
	     (req_f3[1:0] != 2'b10 || req_addr[1:0] != 2'b0) &&
	     (req_f3[1:0] != 2'b11 || req_addr[2:0] != 3'b0) ;
  assign NOT_rg_op_6_7_AND_ram_state_and_ctag_cset_b_re_ETC___d215 =
	     !rg_op &&
	     (ram_state_and_ctag_cset$DOB[20] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_19_TO__ETC___d114 ||
	      ram_state_and_ctag_cset$DOB[41] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_40_TO__ETC___d117) ;
  assign _theResult___snd_fst__h2894 =
	     f_fabric_write_reqs$D_OUT[63:0] << shift_bits__h2674 ;
  assign access_exc_code__h2442 =
	     dmem_not_imem ? (rg_op ? 4'd7 : 4'd5) : 4'd1 ;
  assign b__h21683 =
	     CAN_FIRE_RL_rl_fabric_send_write_req ?
	       ctr_wr_rsps_pending_crg$port0__write_1 :
	       ctr_wr_rsps_pending_crg ;
  assign cline_addr__h21781 = { rg_pa[31:6], 6'd0 } ;
  assign cline_fabric_addr__h21782 = { 32'd0, cline_addr__h21781 } ;
  assign fabric_addr__h25235 = { 32'd0, rg_pa } ;
  assign master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1 =
	     master_xactor_f_rd_data$D_OUT[10:3] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4 =
	     master_xactor_f_rd_data$D_OUT[18:11] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2 =
	     master_xactor_f_rd_data$D_OUT[18:3] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q5 =
	     master_xactor_f_rd_data$D_OUT[26:19] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q6 =
	     master_xactor_f_rd_data$D_OUT[34:19] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q7 =
	     master_xactor_f_rd_data$D_OUT[34:27] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3 =
	     master_xactor_f_rd_data$D_OUT[34:3] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q8 =
	     master_xactor_f_rd_data$D_OUT[42:35] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q9 =
	     master_xactor_f_rd_data$D_OUT[50:35] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11 =
	     master_xactor_f_rd_data$D_OUT[50:43] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12 =
	     master_xactor_f_rd_data$D_OUT[58:51] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10 =
	     master_xactor_f_rd_data$D_OUT[66:35] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13 =
	     master_xactor_f_rd_data$D_OUT[66:51] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14 =
	     master_xactor_f_rd_data$D_OUT[66:59] ;
  assign mem_req_wr_addr_awaddr__h2660 =
	     { 32'd0, f_fabric_write_reqs$D_OUT[95:64] } ;
  assign ram_state_and_ctag_cset_b_read__00_BITS_19_TO__ETC___d114 =
	     ram_state_and_ctag_cset$DOB[19:0] == rg_addr[31:12] ;
  assign ram_state_and_ctag_cset_b_read__00_BITS_40_TO__ETC___d117 =
	     ram_state_and_ctag_cset$DOB[40:21] == rg_addr[31:12] ;
  assign ram_state_and_ctag_cset_b_read__00_BIT_20_01_A_ETC___d205 =
	     (ram_state_and_ctag_cset$DOB[20] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_19_TO__ETC___d114 ||
	      ram_state_and_ctag_cset$DOB[41] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_40_TO__ETC___d117) &&
	     NOT_cfg_verbosity_read__2_ULE_1_3___d44 ;
  assign req_f3_BITS_1_TO_0_01_EQ_0b0_02_OR_req_f3_BITS_ETC___d631 =
	     req_f3[1:0] == 2'b0 || req_f3[1:0] == 2'b01 && !req_addr[0] ||
	     req_f3[1:0] == 2'b10 && req_addr[1:0] == 2'b0 ||
	     req_f3[1:0] == 2'b11 && req_addr[2:0] == 3'b0 ;
  assign result__h18728 =
	     { {56{word64893_BITS_15_TO_8__q18[7]}},
	       word64893_BITS_15_TO_8__q18 } ;
  assign result__h18756 =
	     { {56{word64893_BITS_23_TO_16__q19[7]}},
	       word64893_BITS_23_TO_16__q19 } ;
  assign result__h18784 =
	     { {56{word64893_BITS_31_TO_24__q21[7]}},
	       word64893_BITS_31_TO_24__q21 } ;
  assign result__h18812 =
	     { {56{word64893_BITS_39_TO_32__q22[7]}},
	       word64893_BITS_39_TO_32__q22 } ;
  assign result__h18840 =
	     { {56{word64893_BITS_47_TO_40__q25[7]}},
	       word64893_BITS_47_TO_40__q25 } ;
  assign result__h18868 =
	     { {56{word64893_BITS_55_TO_48__q26[7]}},
	       word64893_BITS_55_TO_48__q26 } ;
  assign result__h18896 =
	     { {56{word64893_BITS_63_TO_56__q28[7]}},
	       word64893_BITS_63_TO_56__q28 } ;
  assign result__h18941 = { 56'd0, word64__h5893[7:0] } ;
  assign result__h18969 = { 56'd0, word64__h5893[15:8] } ;
  assign result__h18997 = { 56'd0, word64__h5893[23:16] } ;
  assign result__h19025 = { 56'd0, word64__h5893[31:24] } ;
  assign result__h19053 = { 56'd0, word64__h5893[39:32] } ;
  assign result__h19081 = { 56'd0, word64__h5893[47:40] } ;
  assign result__h19109 = { 56'd0, word64__h5893[55:48] } ;
  assign result__h19137 = { 56'd0, word64__h5893[63:56] } ;
  assign result__h19182 =
	     { {48{word64893_BITS_15_TO_0__q16[15]}},
	       word64893_BITS_15_TO_0__q16 } ;
  assign result__h19210 =
	     { {48{word64893_BITS_31_TO_16__q20[15]}},
	       word64893_BITS_31_TO_16__q20 } ;
  assign result__h19238 =
	     { {48{word64893_BITS_47_TO_32__q23[15]}},
	       word64893_BITS_47_TO_32__q23 } ;
  assign result__h19266 =
	     { {48{word64893_BITS_63_TO_48__q27[15]}},
	       word64893_BITS_63_TO_48__q27 } ;
  assign result__h19307 = { 48'd0, word64__h5893[15:0] } ;
  assign result__h19335 = { 48'd0, word64__h5893[31:16] } ;
  assign result__h19363 = { 48'd0, word64__h5893[47:32] } ;
  assign result__h19391 = { 48'd0, word64__h5893[63:48] } ;
  assign result__h19432 =
	     { {32{word64893_BITS_31_TO_0__q17[31]}},
	       word64893_BITS_31_TO_0__q17 } ;
  assign result__h19460 =
	     { {32{word64893_BITS_63_TO_32__q24[31]}},
	       word64893_BITS_63_TO_32__q24 } ;
  assign result__h19499 = { 32'd0, word64__h5893[31:0] } ;
  assign result__h19527 = { 32'd0, word64__h5893[63:32] } ;
  assign result__h25646 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1 } ;
  assign result__h25676 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4 } ;
  assign result__h25703 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q5[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q5 } ;
  assign result__h25730 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q7[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q7 } ;
  assign result__h25757 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q8[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q8 } ;
  assign result__h25784 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11 } ;
  assign result__h25811 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12 } ;
  assign result__h25838 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14 } ;
  assign result__h25882 = { 56'd0, master_xactor_f_rd_data$D_OUT[10:3] } ;
  assign result__h25909 = { 56'd0, master_xactor_f_rd_data$D_OUT[18:11] } ;
  assign result__h25936 = { 56'd0, master_xactor_f_rd_data$D_OUT[26:19] } ;
  assign result__h25963 = { 56'd0, master_xactor_f_rd_data$D_OUT[34:27] } ;
  assign result__h25990 = { 56'd0, master_xactor_f_rd_data$D_OUT[42:35] } ;
  assign result__h26017 = { 56'd0, master_xactor_f_rd_data$D_OUT[50:43] } ;
  assign result__h26044 = { 56'd0, master_xactor_f_rd_data$D_OUT[58:51] } ;
  assign result__h26071 = { 56'd0, master_xactor_f_rd_data$D_OUT[66:59] } ;
  assign result__h26115 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2 } ;
  assign result__h26142 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q6[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q6 } ;
  assign result__h26169 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q9[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q9 } ;
  assign result__h26196 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13 } ;
  assign result__h26236 = { 48'd0, master_xactor_f_rd_data$D_OUT[18:3] } ;
  assign result__h26263 = { 48'd0, master_xactor_f_rd_data$D_OUT[34:19] } ;
  assign result__h26290 = { 48'd0, master_xactor_f_rd_data$D_OUT[50:35] } ;
  assign result__h26317 = { 48'd0, master_xactor_f_rd_data$D_OUT[66:51] } ;
  assign result__h26357 =
	     { {32{master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3[31]}},
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3 } ;
  assign result__h26384 =
	     { {32{master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10[31]}},
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10 } ;
  assign result__h26422 = { 32'd0, master_xactor_f_rd_data$D_OUT[34:3] } ;
  assign result__h26449 = { 32'd0, master_xactor_f_rd_data$D_OUT[66:35] } ;
  assign result__h6044 =
	     { {56{word64893_BITS_7_TO_0__q15[7]}},
	       word64893_BITS_7_TO_0__q15 } ;
  assign rg_op_6_AND_ram_state_and_ctag_cset_b_read__00_ETC___d134 =
	     rg_op &&
	     (ram_state_and_ctag_cset$DOB[20] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_19_TO__ETC___d114 ||
	      ram_state_and_ctag_cset$DOB[41] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_40_TO__ETC___d117) ;
  assign rg_op_6_OR_NOT_ram_state_and_ctag_cset_b_read__ETC___d121 =
	     rg_op ||
	     (!ram_state_and_ctag_cset$DOB[20] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_19_TO__ETC___d114) &&
	     (!ram_state_and_ctag_cset$DOB[41] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_40_TO__ETC___d117) ;
  assign shift_bits__h2674 = { f_fabric_write_reqs$D_OUT[66:64], 3'b0 } ;
  assign strobe64__h2824 = 8'b00000001 << f_fabric_write_reqs$D_OUT[66:64] ;
  assign strobe64__h2826 = 8'b00000011 << f_fabric_write_reqs$D_OUT[66:64] ;
  assign strobe64__h2828 = 8'b00001111 << f_fabric_write_reqs$D_OUT[66:64] ;
  assign tmp__h21944 = { 1'd0, rg_victim_way } ;
  assign tmp__h21945 = tmp__h21944 + 2'd1 ;
  assign word64893_BITS_15_TO_0__q16 = word64__h5893[15:0] ;
  assign word64893_BITS_15_TO_8__q18 = word64__h5893[15:8] ;
  assign word64893_BITS_23_TO_16__q19 = word64__h5893[23:16] ;
  assign word64893_BITS_31_TO_0__q17 = word64__h5893[31:0] ;
  assign word64893_BITS_31_TO_16__q20 = word64__h5893[31:16] ;
  assign word64893_BITS_31_TO_24__q21 = word64__h5893[31:24] ;
  assign word64893_BITS_39_TO_32__q22 = word64__h5893[39:32] ;
  assign word64893_BITS_47_TO_32__q23 = word64__h5893[47:32] ;
  assign word64893_BITS_47_TO_40__q25 = word64__h5893[47:40] ;
  assign word64893_BITS_55_TO_48__q26 = word64__h5893[55:48] ;
  assign word64893_BITS_63_TO_32__q24 = word64__h5893[63:32] ;
  assign word64893_BITS_63_TO_48__q27 = word64__h5893[63:48] ;
  assign word64893_BITS_63_TO_56__q28 = word64__h5893[63:56] ;
  assign word64893_BITS_7_TO_0__q15 = word64__h5893[7:0] ;
  assign word64__h5893 = x__h6078 | y__h6079 ;
  assign x__h6078 = ram_cword_set$DOB[63:0] & y__h6093 ;
  assign y__h12408 =
	     {64{ram_state_and_ctag_cset$DOB[41] &&
		 ram_state_and_ctag_cset_b_read__00_BITS_40_TO__ETC___d117}} ;
  assign y__h6079 = ram_cword_set$DOB[127:64] & y__h12408 ;
  assign y__h6093 =
	     {64{ram_state_and_ctag_cset$DOB[20] &&
		 ram_state_and_ctag_cset_b_read__00_BITS_19_TO__ETC___d114}} ;
  always@(f_fabric_write_reqs$D_OUT)
  begin
    case (f_fabric_write_reqs$D_OUT[97:96])
      2'b0: x__h2707 = 3'b0;
      2'b01: x__h2707 = 3'b001;
      2'b10: x__h2707 = 3'b010;
      2'b11: x__h2707 = 3'b011;
    endcase
  end
  always@(rg_f3)
  begin
    case (rg_f3[1:0])
      2'b0: value__h25364 = 3'b0;
      2'b01: value__h25364 = 3'b001;
      2'b10: value__h25364 = 3'b010;
      2'd3: value__h25364 = 3'b011;
    endcase
  end
  always@(f_fabric_write_reqs$D_OUT or
	  strobe64__h2824 or strobe64__h2826 or strobe64__h2828)
  begin
    case (f_fabric_write_reqs$D_OUT[97:96])
      2'b0: mem_req_wr_data_wstrb__h2887 = strobe64__h2824;
      2'b01: mem_req_wr_data_wstrb__h2887 = strobe64__h2826;
      2'b10: mem_req_wr_data_wstrb__h2887 = strobe64__h2828;
      2'b11: mem_req_wr_data_wstrb__h2887 = 8'b11111111;
    endcase
  end
  always@(f_fabric_write_reqs$D_OUT or _theResult___snd_fst__h2894)
  begin
    case (f_fabric_write_reqs$D_OUT[97:96])
      2'b0, 2'b01, 2'b10:
	  mem_req_wr_data_wdata__h2886 = _theResult___snd_fst__h2894;
      2'd3: mem_req_wr_data_wdata__h2886 = f_fabric_write_reqs$D_OUT[63:0];
    endcase
  end
  always@(ram_state_and_ctag_cset$DOB or
	  ram_state_and_ctag_cset_b_read__00_BITS_40_TO__ETC___d117 or
	  ram_cword_set$DOB)
  begin
    case (ram_state_and_ctag_cset$DOB[41] &&
	  ram_state_and_ctag_cset_b_read__00_BITS_40_TO__ETC___d117)
      1'd0: old_cword__h19866 = ram_cword_set$DOB[63:0];
      1'd1: old_cword__h19866 = ram_cword_set$DOB[127:64];
    endcase
  end
  always@(rg_addr or
	  result__h19182 or
	  result__h19210 or result__h19238 or result__h19266)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d336 =
	      result__h19182;
      3'h2:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d336 =
	      result__h19210;
      3'h4:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d336 =
	      result__h19238;
      3'h6:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d336 =
	      result__h19266;
      default: IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d336 =
		   64'd0;
    endcase
  end
  always@(rg_addr or old_cword__h19866 or rg_st_amo_val)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d190 =
	      { old_cword__h19866[63:16], rg_st_amo_val[15:0] };
      3'h2:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d190 =
	      { old_cword__h19866[63:32],
		rg_st_amo_val[15:0],
		old_cword__h19866[15:0] };
      3'h4:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d190 =
	      { old_cword__h19866[63:48],
		rg_st_amo_val[15:0],
		old_cword__h19866[31:0] };
      3'h6:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d190 =
	      { rg_st_amo_val[15:0], old_cword__h19866[47:0] };
      default: IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d190 =
		   old_cword__h19866;
    endcase
  end
  always@(rg_addr or
	  result__h6044 or
	  result__h18728 or
	  result__h18756 or
	  result__h18784 or
	  result__h18812 or
	  result__h18840 or result__h18868 or result__h18896)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d307 =
	      result__h6044;
      3'h1:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d307 =
	      result__h18728;
      3'h2:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d307 =
	      result__h18756;
      3'h3:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d307 =
	      result__h18784;
      3'h4:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d307 =
	      result__h18812;
      3'h5:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d307 =
	      result__h18840;
      3'h6:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d307 =
	      result__h18868;
      3'h7:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d307 =
	      result__h18896;
    endcase
  end
  always@(rg_addr or old_cword__h19866 or rg_st_amo_val)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d180 =
	      { old_cword__h19866[63:8], rg_st_amo_val[7:0] };
      3'h1:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d180 =
	      { old_cword__h19866[63:16],
		rg_st_amo_val[7:0],
		old_cword__h19866[7:0] };
      3'h2:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d180 =
	      { old_cword__h19866[63:24],
		rg_st_amo_val[7:0],
		old_cword__h19866[15:0] };
      3'h3:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d180 =
	      { old_cword__h19866[63:32],
		rg_st_amo_val[7:0],
		old_cword__h19866[23:0] };
      3'h4:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d180 =
	      { old_cword__h19866[63:40],
		rg_st_amo_val[7:0],
		old_cword__h19866[31:0] };
      3'h5:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d180 =
	      { old_cword__h19866[63:48],
		rg_st_amo_val[7:0],
		old_cword__h19866[39:0] };
      3'h6:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d180 =
	      { old_cword__h19866[63:56],
		rg_st_amo_val[7:0],
		old_cword__h19866[47:0] };
      3'h7:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d180 =
	      { rg_st_amo_val[7:0], old_cword__h19866[55:0] };
    endcase
  end
  always@(rg_addr or old_cword__h19866 or rg_st_amo_val)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_cword9866_BIT_ETC__q29 =
	      { old_cword__h19866[63:32], rg_st_amo_val[31:0] };
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_cword9866_BIT_ETC__q29 =
	      { rg_st_amo_val[31:0], old_cword__h19866[31:0] };
      default: CASE_rg_addr_BITS_2_TO_0_0x0_old_cword9866_BIT_ETC__q29 =
		   old_cword__h19866;
    endcase
  end
  always@(rg_f3 or
	  old_cword__h19866 or
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d180 or
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d190 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_cword9866_BIT_ETC__q29 or
	  rg_st_amo_val)
  begin
    case (rg_f3)
      3'b0:
	  n__h19877 =
	      IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d180;
      3'b001:
	  n__h19877 =
	      IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEL__ETC___d190;
      3'b010:
	  n__h19877 = CASE_rg_addr_BITS_2_TO_0_0x0_old_cword9866_BIT_ETC__q29;
      3'b011: n__h19877 = rg_st_amo_val;
      default: n__h19877 = old_cword__h19866;
    endcase
  end
  always@(rg_addr or
	  result__h26236 or
	  result__h26263 or result__h26290 or result__h26317)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d530 =
	      result__h26236;
      3'h2:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d530 =
	      result__h26263;
      3'h4:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d530 =
	      result__h26290;
      3'h6:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d530 =
	      result__h26317;
      default: IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d530 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h19307 or
	  result__h19335 or result__h19363 or result__h19391)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d345 =
	      result__h19307;
      3'h2:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d345 =
	      result__h19335;
      3'h4:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d345 =
	      result__h19363;
      3'h6:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d345 =
	      result__h19391;
      default: IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d345 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h26115 or
	  result__h26142 or result__h26169 or result__h26196)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d522 =
	      result__h26115;
      3'h2:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d522 =
	      result__h26142;
      3'h4:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d522 =
	      result__h26169;
      3'h6:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d522 =
	      result__h26196;
      default: IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d522 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h25882 or
	  result__h25909 or
	  result__h25936 or
	  result__h25963 or
	  result__h25990 or
	  result__h26017 or result__h26044 or result__h26071)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d510 =
	      result__h25882;
      3'h1:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d510 =
	      result__h25909;
      3'h2:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d510 =
	      result__h25936;
      3'h3:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d510 =
	      result__h25963;
      3'h4:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d510 =
	      result__h25990;
      3'h5:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d510 =
	      result__h26017;
      3'h6:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d510 =
	      result__h26044;
      3'h7:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d510 =
	      result__h26071;
    endcase
  end
  always@(rg_addr or
	  result__h18941 or
	  result__h18969 or
	  result__h18997 or
	  result__h19025 or
	  result__h19053 or
	  result__h19081 or result__h19109 or result__h19137)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d324 =
	      result__h18941;
      3'h1:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d324 =
	      result__h18969;
      3'h2:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d324 =
	      result__h18997;
      3'h3:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d324 =
	      result__h19025;
      3'h4:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d324 =
	      result__h19053;
      3'h5:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d324 =
	      result__h19081;
      3'h6:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d324 =
	      result__h19109;
      3'h7:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d324 =
	      result__h19137;
    endcase
  end
  always@(rg_addr or
	  result__h25646 or
	  result__h25676 or
	  result__h25703 or
	  result__h25730 or
	  result__h25757 or
	  result__h25784 or result__h25811 or result__h25838)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d494 =
	      result__h25646;
      3'h1:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d494 =
	      result__h25676;
      3'h2:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d494 =
	      result__h25703;
      3'h3:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d494 =
	      result__h25730;
      3'h4:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d494 =
	      result__h25757;
      3'h5:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d494 =
	      result__h25784;
      3'h6:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d494 =
	      result__h25811;
      3'h7:
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d494 =
	      result__h25838;
    endcase
  end
  always@(rg_addr or result__h26357 or result__h26384)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result6357_0x4_re_ETC__q30 =
	      result__h26357;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result6357_0x4_re_ETC__q30 =
	      result__h26384;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result6357_0x4_re_ETC__q30 =
		   64'd0;
    endcase
  end
  always@(rg_addr or result__h26422 or result__h26449)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result6422_0x4_re_ETC__q31 =
	      result__h26422;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result6422_0x4_re_ETC__q31 =
	      result__h26449;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result6422_0x4_re_ETC__q31 =
		   64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d494 or
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d522 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result6357_0x4_re_ETC__q30 or
	  rg_addr or
	  master_xactor_f_rd_data$D_OUT or
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d510 or
	  IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d530 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result6422_0x4_re_ETC__q31)
  begin
    case (rg_f3)
      3'b0:
	  ld_val__h25586 =
	      IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d494;
      3'b001:
	  ld_val__h25586 =
	      IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_SEXT_ETC___d522;
      3'b010:
	  ld_val__h25586 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result6357_0x4_re_ETC__q30;
      3'b011:
	  ld_val__h25586 =
	      (rg_addr[2:0] == 3'h0) ?
		master_xactor_f_rd_data$D_OUT[66:3] :
		64'd0;
      3'b100:
	  ld_val__h25586 =
	      IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d510;
      3'b101:
	  ld_val__h25586 =
	      IF_rg_addr_1_BITS_2_TO_0_9_EQ_0x0_39_THEN_0_CO_ETC___d530;
      3'b110:
	  ld_val__h25586 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result6422_0x4_re_ETC__q31;
      3'd7: ld_val__h25586 = 64'd0;
    endcase
  end
  always@(rg_addr or result__h19432 or result__h19460)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result9432_0x4_re_ETC__q32 =
	      result__h19432;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result9432_0x4_re_ETC__q32 =
	      result__h19460;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result9432_0x4_re_ETC__q32 =
		   64'd0;
    endcase
  end
  always@(rg_addr or result__h19499 or result__h19527)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result9499_0x4_re_ETC__q33 =
	      result__h19499;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result9499_0x4_re_ETC__q33 =
	      result__h19527;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result9499_0x4_re_ETC__q33 =
		   64'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cfg_verbosity <= `BSV_ASSIGNMENT_DELAY 4'd0;
	ctr_wr_rsps_pending_crg <= `BSV_ASSIGNMENT_DELAY 4'd0;
	rg_cset_in_cache <= `BSV_ASSIGNMENT_DELAY 6'd0;
	rg_ddr4_ready <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_lower_word32_full <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_state <= `BSV_ASSIGNMENT_DELAY 4'd0;
	rg_tohost_addr <= `BSV_ASSIGNMENT_DELAY 64'h0000000080001000;
	rg_tohost_value <= `BSV_ASSIGNMENT_DELAY 64'd0;
	rg_watch_tohost <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_wr_rsp_err <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (cfg_verbosity$EN)
	  cfg_verbosity <= `BSV_ASSIGNMENT_DELAY cfg_verbosity$D_IN;
	if (ctr_wr_rsps_pending_crg$EN)
	  ctr_wr_rsps_pending_crg <= `BSV_ASSIGNMENT_DELAY
	      ctr_wr_rsps_pending_crg$D_IN;
	if (rg_cset_in_cache$EN)
	  rg_cset_in_cache <= `BSV_ASSIGNMENT_DELAY rg_cset_in_cache$D_IN;
	if (rg_ddr4_ready$EN)
	  rg_ddr4_ready <= `BSV_ASSIGNMENT_DELAY rg_ddr4_ready$D_IN;
	if (rg_lower_word32_full$EN)
	  rg_lower_word32_full <= `BSV_ASSIGNMENT_DELAY
	      rg_lower_word32_full$D_IN;
	if (rg_state$EN) rg_state <= `BSV_ASSIGNMENT_DELAY rg_state$D_IN;
	if (rg_tohost_addr$EN)
	  rg_tohost_addr <= `BSV_ASSIGNMENT_DELAY rg_tohost_addr$D_IN;
	if (rg_tohost_value$EN)
	  rg_tohost_value <= `BSV_ASSIGNMENT_DELAY rg_tohost_value$D_IN;
	if (rg_watch_tohost$EN)
	  rg_watch_tohost <= `BSV_ASSIGNMENT_DELAY rg_watch_tohost$D_IN;
	if (rg_wr_rsp_err$EN)
	  rg_wr_rsp_err <= `BSV_ASSIGNMENT_DELAY rg_wr_rsp_err$D_IN;
      end
    if (rg_addr$EN) rg_addr <= `BSV_ASSIGNMENT_DELAY rg_addr$D_IN;
    if (rg_cset_cword_in_cache$EN)
      rg_cset_cword_in_cache <= `BSV_ASSIGNMENT_DELAY
	  rg_cset_cword_in_cache$D_IN;
    if (rg_error_during_refill$EN)
      rg_error_during_refill <= `BSV_ASSIGNMENT_DELAY
	  rg_error_during_refill$D_IN;
    if (rg_exc_code$EN) rg_exc_code <= `BSV_ASSIGNMENT_DELAY rg_exc_code$D_IN;
    if (rg_f3$EN) rg_f3 <= `BSV_ASSIGNMENT_DELAY rg_f3$D_IN;
    if (rg_ld_val$EN) rg_ld_val <= `BSV_ASSIGNMENT_DELAY rg_ld_val$D_IN;
    if (rg_lower_word32$EN)
      rg_lower_word32 <= `BSV_ASSIGNMENT_DELAY rg_lower_word32$D_IN;
    if (rg_op$EN) rg_op <= `BSV_ASSIGNMENT_DELAY rg_op$D_IN;
    if (rg_pa$EN) rg_pa <= `BSV_ASSIGNMENT_DELAY rg_pa$D_IN;
    if (rg_pte_pa$EN) rg_pte_pa <= `BSV_ASSIGNMENT_DELAY rg_pte_pa$D_IN;
    if (rg_st_amo_val$EN)
      rg_st_amo_val <= `BSV_ASSIGNMENT_DELAY rg_st_amo_val$D_IN;
    if (rg_victim_way$EN)
      rg_victim_way <= `BSV_ASSIGNMENT_DELAY rg_victim_way$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cfg_verbosity = 4'hA;
    ctr_wr_rsps_pending_crg = 4'hA;
    rg_addr = 32'hAAAAAAAA;
    rg_cset_cword_in_cache = 9'h0AA;
    rg_cset_in_cache = 6'h2A;
    rg_ddr4_ready = 1'h0;
    rg_error_during_refill = 1'h0;
    rg_exc_code = 4'hA;
    rg_f3 = 3'h2;
    rg_ld_val = 64'hAAAAAAAAAAAAAAAA;
    rg_lower_word32 = 32'hAAAAAAAA;
    rg_lower_word32_full = 1'h0;
    rg_op = 1'h0;
    rg_pa = 32'hAAAAAAAA;
    rg_pte_pa = 32'hAAAAAAAA;
    rg_st_amo_val = 64'hAAAAAAAAAAAAAAAA;
    rg_state = 4'hA;
    rg_tohost_addr = 64'hAAAAAAAAAAAAAAAA;
    rg_tohost_value = 64'hAAAAAAAAAAAAAAAA;
    rg_victim_way = 1'h0;
    rg_watch_tohost = 1'h0;
    rg_wr_rsp_err = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", mem_req_wr_addr_awaddr__h2660);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", x__h2707);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("                       ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", mem_req_wr_data_wdata__h2886);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", mem_req_wr_data_wstrb__h2887);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  cfg_verbosity != 4'd0 &&
	  !f_reset_reqs$D_OUT)
	begin
	  v__h4138 = $stime;
	  #0;
	end
    v__h4132 = v__h4138 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  cfg_verbosity != 4'd0 &&
	  !f_reset_reqs$D_OUT)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_reset: %0d sets x %0d ways: all tag states reset to CTAG_EMPTY",
		   v__h4132,
		   "D_MMU_Cache",
		   $signed(32'd64),
		   $signed(32'd2));
	else
	  $display("%0d: %s.rl_reset: %0d sets x %0d ways: all tag states reset to CTAG_EMPTY",
		   v__h4132,
		   "I_MMU_Cache",
		   $signed(32'd64),
		   $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  f_reset_reqs$D_OUT)
	begin
	  v__h4237 = $stime;
	  #0;
	end
    v__h4231 = v__h4237 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  f_reset_reqs$D_OUT)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_reset: Flushed", v__h4231, "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_reset: Flushed", v__h4231, "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	begin
	  v__h4387 = $stime;
	  #0;
	end
    v__h4381 = v__h4387 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_probe_and_immed_rsp; eaddr %0h",
		   v__h4381,
		   "D_MMU_Cache",
		   rg_addr);
	else
	  $display("%0d: %s: rl_probe_and_immed_rsp; eaddr %0h",
		   v__h4381,
		   "I_MMU_Cache",
		   rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$display("        eaddr = {CTag 0x%0h  CSet 0x%0h  Word64 0x%0h  Byte 0x%0h}",
		 rg_addr[31:12],
		 rg_addr[11:6],
		 rg_addr[5:3],
		 rg_addr[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("        CSet 0x%0x: (state, tag):", rg_addr[11:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(" (");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  ram_state_and_ctag_cset$DOB[20])
	$write("CTAG_CLEAN");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  !ram_state_and_ctag_cset$DOB[20])
	$write("CTAG_EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  ram_state_and_ctag_cset$DOB[20])
	$write(", 0x%0x", ram_state_and_ctag_cset$DOB[19:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  !ram_state_and_ctag_cset$DOB[20])
	$write(", --");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(")");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(" (");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  ram_state_and_ctag_cset$DOB[41])
	$write("CTAG_CLEAN");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  !ram_state_and_ctag_cset$DOB[41])
	$write("CTAG_EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  ram_state_and_ctag_cset$DOB[41])
	$write(", 0x%0x", ram_state_and_ctag_cset$DOB[40:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  !ram_state_and_ctag_cset$DOB[41])
	$write(", --");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(")");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("        CSet 0x%0x, CWord 0x%0x: ",
	       rg_addr[11:6],
	       rg_addr[5:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(" 0x%0x", ram_cword_set$DOB[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(" 0x%0x", ram_cword_set$DOB[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("    TLB result: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("VM_Xlate_Result { ", "outcome: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("VM_XLATE_OK");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "pa: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 4'hA, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp && dmem_not_imem &&
	  !soc_map$m_is_mem_addr &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$display("    => IO_REQ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_26_OR_soc_map_m_is_mem_addr__ETC___d131)
	$display("        ASSERTION ERROR: fn_test_cache_hit_or_miss: multiple hits in set at [%0d] and [%0d]",
		 $signed(32'd1),
		 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op &&
	  ram_state_and_ctag_cset_b_read__00_BIT_20_01_A_ETC___d205)
	$display("        Write-Cache-Hit: pa 0x%0h word64 0x%0h",
		 rg_addr,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op &&
	  ram_state_and_ctag_cset_b_read__00_BIT_20_01_A_ETC___d205)
	$write("        New Word64_Set:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op &&
	  ram_state_and_ctag_cset_b_read__00_BIT_20_01_A_ETC___d205)
	$write("        CSet 0x%0x, CWord 0x%0x: ",
	       rg_addr[11:6],
	       rg_addr[5:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op &&
	  ram_state_and_ctag_cset_b_read__00_BIT_20_01_A_ETC___d205)
	$write(" 0x%0x",
	       IF_NOT_ram_state_and_ctag_cset_b_read__00_BIT__ETC___d203);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op &&
	  ram_state_and_ctag_cset_b_read__00_BIT_20_01_A_ETC___d205)
	$write(" 0x%0x",
	       IF_ram_state_and_ctag_cset_b_read__00_BIT_41_0_ETC___d202);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op &&
	  ram_state_and_ctag_cset_b_read__00_BIT_20_01_A_ETC___d205)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op &&
	  NOT_ram_state_and_ctag_cset_b_read__00_BIT_20__ETC___d208)
	$display("        Write-Cache-Miss: pa 0x%0h word64 0x%0h",
		 rg_addr,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$display("        Write-Cache-Hit/Miss: eaddr 0x%0h word64 0x%0h",
		 rg_addr,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$display("        => rl_write_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  !rg_op &&
	  ram_state_and_ctag_cset_b_read__00_BIT_20_01_A_ETC___d205)
	begin
	  v__h19609 = $stime;
	  #0;
	end
    v__h19603 = v__h19609 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  !rg_op &&
	  ram_state_and_ctag_cset_b_read__00_BIT_20_01_A_ETC___d205)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h19603,
		   "D_MMU_Cache",
		   rg_addr,
		   word64__h5893,
		   64'd0);
	else
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h19603,
		   "I_MMU_Cache",
		   rg_addr,
		   word64__h5893,
		   64'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  !rg_op &&
	  ram_state_and_ctag_cset_b_read__00_BIT_20_01_A_ETC___d205)
	$display("        Read-hit: addr 0x%0h word64 0x%0h",
		 rg_addr,
		 word64__h5893);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  !rg_op &&
	  NOT_ram_state_and_ctag_cset_b_read__00_BIT_20__ETC___d208)
	$display("        Read Miss: -> CACHE_START_REFILL.");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_ddr4_ready)
	begin
	  v__h29555 = $stime;
	  #0;
	end
    v__h29549 = v__h29555 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_ddr4_ready)
	$display("%0d: %m.ma_ddr4_ready: Enabling MMU_Cache", v__h29549);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	begin
	  v__h21729 = $stime;
	  #0;
	end
    v__h21723 = v__h21729 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_start_cache_refill: ",
		   v__h21723,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_start_cache_refill: ",
		   v__h21723,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("    To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", cline_fabric_addr__h21782);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 8'd7);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 3'b011);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$display("    Victim way %0d; => CACHE_REFILL", tmp__h21945[0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	begin
	  v__h22468 = $stime;
	  #0;
	end
    v__h22462 = v__h22468 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_cache_refill_rsps_loop:",
		   v__h22462,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_cache_refill_rsps_loop:",
		   v__h22462,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[2:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393 &&
	  master_xactor_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393 &&
	  !master_xactor_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	begin
	  v__h22710 = $stime;
	  #0;
	end
    v__h22704 = v__h22710 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_cache_refill_rsps_loop: FABRIC_RSP_ERR: raising access exception %0d",
		   v__h22704,
		   "D_MMU_Cache",
		   access_exc_code__h2442);
	else
	  $display("%0d: %s.rl_cache_refill_rsps_loop: FABRIC_RSP_ERR: raising access exception %0d",
		   v__h22704,
		   "I_MMU_Cache",
		   access_exc_code__h2442);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  rg_cset_cword_in_cache[2:0] == 3'd7 &&
	  (master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	   rg_error_during_refill) &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$display("    => MODULE_EXCEPTION_RSP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  rg_cset_cword_in_cache[2:0] == 3'd7 &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !rg_error_during_refill &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$display("    => CACHE_REREQ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$display("        Updating Cache cword_set 0x%0h, cword_in_cline %0d) old => new",
		 rg_cset_cword_in_cache,
		 rg_cset_cword_in_cache[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write("        CSet 0x%0x, CWord 0x%0x: ",
	       rg_addr[11:6],
	       rg_cset_cword_in_cache[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write(" 0x%0x", ram_cword_set$DOB[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write(" 0x%0x", ram_cword_set$DOB[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write("        CSet 0x%0x, CWord 0x%0x: ",
	       rg_addr[11:6],
	       rg_cset_cword_in_cache[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write(" 0x%0x",
	       rg_victim_way ?
		 ram_cword_set$DOB[63:0] :
		 master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write(" 0x%0x",
	       rg_victim_way ?
		 master_xactor_f_rd_data$D_OUT[66:3] :
		 ram_cword_set$DOB[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__2_ULE_2_92___d393)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_rereq && NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$display("    fa_req_ram_B tagCSet [0x%0x] cword_set [0x%0d]",
		 rg_addr[11:6],
		 rg_addr[11:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_watch_tohost)
	begin
	  v__h29487 = $stime;
	  #0;
	end
    v__h29481 = v__h29487 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_watch_tohost)
	$display("%0d: %m.set_watch_tohost: watch %0d, addr %0h",
		 v__h29481,
		 set_watch_tohost_watch_tohost,
		 set_watch_tohost_tohost_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	begin
	  v__h25183 = $stime;
	  #0;
	end
    v__h25177 = v__h25183 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_read_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h25177,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_read_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h25177,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", fabric_addr__h25235);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", value__h25364);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	begin
	  v__h25477 = $stime;
	  #0;
	end
    v__h25471 = v__h25477 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h25471,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h25471,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[2:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  master_xactor_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  !master_xactor_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	begin
	  v__h26579 = $stime;
	  #0;
	end
    v__h26573 = v__h26579 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h26573,
		   "D_MMU_Cache",
		   rg_addr,
		   ld_val__h25586);
	else
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h26573,
		   "I_MMU_Cache",
		   rg_addr,
		   ld_val__h25586);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	begin
	  v__h26686 = $stime;
	  #0;
	end
    v__h26680 = v__h26686 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_read_rsp: FABRIC_RSP_ERR: raising trap LOAD_ACCESS_FAULT",
		   v__h26680,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_io_read_rsp: FABRIC_RSP_ERR: raising trap LOAD_ACCESS_FAULT",
		   v__h26680,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_maintain_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	begin
	  v__h26791 = $stime;
	  #0;
	end
    v__h26785 = v__h26791 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_maintain_io_read_rsp &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h26785,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_ld_val);
	else
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h26785,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_ld_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	begin
	  v__h26871 = $stime;
	  #0;
	end
    v__h26865 = v__h26871 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_io_write_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h26865,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
	else
	  $display("%0d: %s: rl_io_write_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h26865,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_write_req &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$display("    => rl_ST_AMO_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	begin
	  v__h27470 = $stime;
	  #0;
	end
    v__h27464 = v__h27470 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	if (dmem_not_imem)
	  $write("%0d: %s.rl_discard_write_rsp: pending %0d ",
		 v__h27464,
		 "D_MMU_Cache",
		 $unsigned(b__h21683));
	else
	  $write("%0d: %s.rl_discard_write_rsp: pending %0d ",
		 v__h27464,
		 "I_MMU_Cache",
		 $unsigned(b__h21683));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", master_xactor_f_wr_resp$D_OUT[5:2]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", master_xactor_f_wr_resp$D_OUT[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	begin
	  v__h27512 = $stime;
	  #0;
	end
    v__h27506 = v__h27512 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_discard_write_rsp: fabric response error: exit",
		   v__h27506,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_discard_write_rsp: fabric response error: exit",
		   v__h27506,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	$write("'h%h", master_xactor_f_wr_resp$D_OUT[5:2]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	$write("'h%h", master_xactor_f_wr_resp$D_OUT[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_reset)
	begin
	  v__h3670 = $stime;
	  #0;
	end
    v__h3664 = v__h3670 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_reset)
	if (dmem_not_imem)
	  $display("%0d: %s: cache size %0d KB, associativity %0d, line size %0d bytes (= %0d XLEN words)",
		   v__h3664,
		   "D_MMU_Cache",
		   $signed(32'd8),
		   $signed(32'd2),
		   $signed(32'd64),
		   $signed(32'd16));
	else
	  $display("%0d: %s: cache size %0d KB, associativity %0d, line size %0d bytes (= %0d XLEN words)",
		   v__h3664,
		   "I_MMU_Cache",
		   $signed(32'd8),
		   $signed(32'd2),
		   $signed(32'd64),
		   $signed(32'd16));
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	begin
	  v__h27880 = $stime;
	  #0;
	end
    v__h27874 = v__h27880 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("%0d: %m.req: op:", v__h27874);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__2_ULE_1_3___d44 && req_op)
	$write("CACHE_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__2_ULE_1_3___d44 && !req_op)
	$write("CACHE_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(" f3:%0d addr:0x%0h st_value:0x%0h",
	       req_f3,
	       req_addr,
	       req_st_value,
	       "\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write("    priv:");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  req_priv == 2'b0)
	$write("U");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  req_priv == 2'b01)
	$write("S");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  req_priv == 2'b11)
	$write("M");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__2_ULE_1_3___d44 &&
	  req_priv != 2'b0 &&
	  req_priv != 2'b01 &&
	  req_priv != 2'b11)
	$write("RESERVED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$write(" sstatus_SUM:%0d mstatus_MXR:%0d satp:0x%0h",
	       req_sstatus_SUM,
	       req_mstatus_MXR,
	       req_satp,
	       "\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req &&
	  req_f3_BITS_1_TO_0_01_EQ_0b0_02_OR_req_f3_BITS_ETC___d631 &&
	  NOT_cfg_verbosity_read__2_ULE_1_3___d44)
	$display("    fa_req_ram_B tagCSet [0x%0x] cword_set [0x%0d]",
		 req_addr[11:6],
		 req_addr[11:3]);
  end
  // synopsys translate_on
endmodule