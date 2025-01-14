module outputs
  reg [63 : 0] cword;
  wire [63 : 0] addr,
		mem_master_araddr,
		mem_master_awaddr,
		mem_master_wdata,
		mv_tohost_value,
		st_amo_val;
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
  reg [63 : 0] rg_addr;
  wire [63 : 0] rg_addr$D_IN;
  wire rg_addr$EN;
  // register rg_amo_funct7
  reg [6 : 0] rg_amo_funct7;
  wire [6 : 0] rg_amo_funct7$D_IN;
  wire rg_amo_funct7$EN;
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
  reg [63 : 0] rg_ld_val$D_IN;
  wire rg_ld_val$EN;
  // register rg_lower_word32
  reg [31 : 0] rg_lower_word32;
  wire [31 : 0] rg_lower_word32$D_IN;
  wire rg_lower_word32$EN;
  // register rg_lower_word32_full
  reg rg_lower_word32_full;
  wire rg_lower_word32_full$D_IN, rg_lower_word32_full$EN;
  // register rg_lrsc_pa
  reg [63 : 0] rg_lrsc_pa;
  wire [63 : 0] rg_lrsc_pa$D_IN;
  wire rg_lrsc_pa$EN;
  // register rg_lrsc_valid
  reg rg_lrsc_valid;
  wire rg_lrsc_valid$D_IN, rg_lrsc_valid$EN;
  // register rg_op
  reg [1 : 0] rg_op;
  wire [1 : 0] rg_op$D_IN;
  wire rg_op$EN;
  // register rg_pa
  reg [63 : 0] rg_pa;
  wire [63 : 0] rg_pa$D_IN;
  wire rg_pa$EN;
  // register rg_pte_pa
  reg [63 : 0] rg_pte_pa;
  wire [63 : 0] rg_pte_pa$D_IN;
  wire rg_pte_pa$EN;
  // register rg_st_amo_val
  reg [63 : 0] rg_st_amo_val;
  wire [63 : 0] rg_st_amo_val$D_IN;
  wire rg_st_amo_val$EN;
  // register rg_state
  reg [4 : 0] rg_state;
  reg [4 : 0] rg_state$D_IN;
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
  reg [130 : 0] f_fabric_write_reqs$D_IN;
  wire [130 : 0] f_fabric_write_reqs$D_OUT;
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
  wire [105 : 0] ram_state_and_ctag_cset$DIA,
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
       CAN_FIRE_RL_rl_io_AMO_SC_req,
       CAN_FIRE_RL_rl_io_AMO_op_req,
       CAN_FIRE_RL_rl_io_AMO_read_rsp,
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
       WILL_FIRE_RL_rl_io_AMO_SC_req,
       WILL_FIRE_RL_rl_io_AMO_op_req,
       WILL_FIRE_RL_rl_io_AMO_read_rsp,
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
  wire [130 : 0] MUX_f_fabric_write_reqs$enq_1__VAL_1,
		 MUX_f_fabric_write_reqs$enq_1__VAL_2,
		 MUX_f_fabric_write_reqs$enq_1__VAL_3;
  wire [127 : 0] MUX_ram_cword_set$a_put_3__VAL_1,
		 MUX_ram_cword_set$a_put_3__VAL_2;
  wire [105 : 0] MUX_ram_state_and_ctag_cset$a_put_3__VAL_1;
  wire [96 : 0] MUX_master_xactor_f_rd_addr$enq_1__VAL_1,
		MUX_master_xactor_f_rd_addr$enq_1__VAL_2;
  wire [63 : 0] MUX_dw_output_ld_val$wset_1__VAL_3,
		MUX_rg_ld_val$write_1__VAL_2;
  wire [8 : 0] MUX_ram_cword_set$b_put_2__VAL_2,
	       MUX_ram_cword_set$b_put_2__VAL_4;
  wire [5 : 0] MUX_rg_cset_in_cache$write_1__VAL_1;
  wire [4 : 0] MUX_rg_state$write_1__VAL_1,
	       MUX_rg_state$write_1__VAL_10,
	       MUX_rg_state$write_1__VAL_12,
	       MUX_rg_state$write_1__VAL_3;
  wire [3 : 0] MUX_rg_exc_code$write_1__VAL_1;
  wire MUX_dw_output_ld_val$wset_1__SEL_1,
       MUX_dw_output_ld_val$wset_1__SEL_2,
       MUX_dw_output_ld_val$wset_1__SEL_3,
       MUX_dw_output_ld_val$wset_1__SEL_4,
       MUX_f_fabric_write_reqs$enq_1__SEL_2,
       MUX_master_xactor_f_rd_addr$enq_1__SEL_1,
       MUX_ram_cword_set$a_put_1__SEL_1,
       MUX_ram_cword_set$b_put_1__SEL_1,
       MUX_ram_cword_set$b_put_1__SEL_2,
       MUX_ram_state_and_ctag_cset$a_put_1__SEL_1,
       MUX_rg_exc_code$write_1__SEL_1,
       MUX_rg_exc_code$write_1__SEL_2,
       MUX_rg_exc_code$write_1__SEL_3,
       MUX_rg_exc_code$write_1__SEL_4,
       MUX_rg_ld_val$write_1__SEL_2,
       MUX_rg_lrsc_valid$write_1__SEL_2,
       MUX_rg_state$write_1__SEL_10,
       MUX_rg_state$write_1__SEL_12,
       MUX_rg_state$write_1__SEL_13,
       MUX_rg_state$write_1__SEL_2,
       MUX_rg_state$write_1__SEL_3;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h4255;
  reg [31 : 0] v__h4354;
  reg [31 : 0] v__h4504;
  reg [31 : 0] v__h19794;
  reg [31 : 0] v__h23510;
  reg [31 : 0] v__h37786;
  reg [31 : 0] v__h26828;
  reg [31 : 0] v__h27567;
  reg [31 : 0] v__h27808;
  reg [31 : 0] v__h37718;
  reg [31 : 0] v__h30273;
  reg [31 : 0] v__h30623;
  reg [31 : 0] v__h31725;
  reg [31 : 0] v__h31832;
  reg [31 : 0] v__h31937;
  reg [31 : 0] v__h32017;
  reg [31 : 0] v__h32227;
  reg [31 : 0] v__h32345;
  reg [31 : 0] v__h32639;
  reg [31 : 0] v__h32814;
  reg [31 : 0] v__h35073;
  reg [31 : 0] v__h32910;
  reg [31 : 0] v__h35651;
  reg [31 : 0] v__h35693;
  reg [31 : 0] v__h3787;
  reg [31 : 0] v__h36063;
  reg [31 : 0] v__h3781;
  reg [31 : 0] v__h4249;
  reg [31 : 0] v__h4348;
  reg [31 : 0] v__h4498;
  reg [31 : 0] v__h19788;
  reg [31 : 0] v__h23504;
  reg [31 : 0] v__h26822;
  reg [31 : 0] v__h27561;
  reg [31 : 0] v__h27802;
  reg [31 : 0] v__h30267;
  reg [31 : 0] v__h30617;
  reg [31 : 0] v__h31719;
  reg [31 : 0] v__h31826;
  reg [31 : 0] v__h31931;
  reg [31 : 0] v__h32011;
  reg [31 : 0] v__h32221;
  reg [31 : 0] v__h32339;
  reg [31 : 0] v__h32633;
  reg [31 : 0] v__h32808;
  reg [31 : 0] v__h32904;
  reg [31 : 0] v__h35067;
  reg [31 : 0] v__h35645;
  reg [31 : 0] v__h35687;
  reg [31 : 0] v__h36057;
  reg [31 : 0] v__h37712;
  reg [31 : 0] v__h37780;
  // synopsys translate_on
  // remaining internal signals
  reg [63 : 0] CASE_rg_addr_BITS_2_TO_0_0x0_old_cword0949_BIT_ETC__q30,
	       CASE_rg_addr_BITS_2_TO_0_0x0_old_cword0949_BIT_ETC__q33,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result1503_0x4_re_ETC__q34,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result1568_0x4_re_ETC__q35,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result4781_0x4_re_ETC__q50,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result9616_0x4_re_ETC__q29,
	       CASE_rg_f3_0b0_IF_rg_addr_9_BITS_2_TO_0_30_EQ__ETC__q52,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d303,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d325,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d337,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d714,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d734,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d823,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d843,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d853,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d427,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d436,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d504,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d513,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d286,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d316,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d698,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d726,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d807,
	       IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d835,
	       IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC___d346,
	       IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_IF_rg_f3_53_E_ETC___d385,
	       _theResult_____2__h24034,
	       _theResult_____2__h32986,
	       ld_val__h30732,
	       mem_req_wr_data_wdata__h2980,
	       n__h20960,
	       n__h23896,
	       new_ld_val__h32940,
	       old_cword__h20949,
	       w1__h24026,
	       w1__h32974,
	       w1__h32978;
  reg [7 : 0] mem_req_wr_data_wstrb__h2981;
  reg [2 : 0] value__h32526, x__h2801;
  wire [63 : 0] IF_NOT_ram_state_and_ctag_cset_b_read__04_BIT__ETC___d447,
		IF_NOT_ram_state_and_ctag_cset_b_read__04_BIT__ETC___d524,
		IF_ram_state_and_ctag_cset_b_read__04_BIT_105__ETC___d446,
		IF_ram_state_and_ctag_cset_b_read__04_BIT_105__ETC___d523,
		IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_1_E_ETC___d354,
		IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_IF__ETC___d854,
		IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_ram_ETC___d339,
		IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_rg_st_amo_val_ETC___d454,
		IF_rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_ETC___d531,
		_theResult___snd_fst__h2988,
		cline_fabric_addr__h26881,
		new_st_val__h23732,
		new_st_val__h24038,
		new_st_val__h24129,
		new_st_val__h25109,
		new_st_val__h25113,
		new_st_val__h25117,
		new_st_val__h25121,
		new_st_val__h25126,
		new_st_val__h25132,
		new_st_val__h25137,
		new_st_val__h32990,
		new_st_val__h33081,
		new_st_val__h34941,
		new_st_val__h34945,
		new_st_val__h34949,
		new_st_val__h34953,
		new_st_val__h34958,
		new_st_val__h34964,
		new_st_val__h34969,
		new_value__h22600,
		new_value__h6175,
		result__h18884,
		result__h18912,
		result__h18940,
		result__h18968,
		result__h18996,
		result__h19024,
		result__h19052,
		result__h19080,
		result__h19125,
		result__h19153,
		result__h19181,
		result__h19209,
		result__h19237,
		result__h19265,
		result__h19293,
		result__h19321,
		result__h19366,
		result__h19394,
		result__h19422,
		result__h19450,
		result__h19491,
		result__h19519,
		result__h19547,
		result__h19575,
		result__h19616,
		result__h19644,
		result__h19683,
		result__h19711,
		result__h30792,
		result__h30822,
		result__h30849,
		result__h30876,
		result__h30903,
		result__h30930,
		result__h30957,
		result__h30984,
		result__h31028,
		result__h31055,
		result__h31082,
		result__h31109,
		result__h31136,
		result__h31163,
		result__h31190,
		result__h31217,
		result__h31261,
		result__h31288,
		result__h31315,
		result__h31342,
		result__h31382,
		result__h31409,
		result__h31436,
		result__h31463,
		result__h31503,
		result__h31530,
		result__h31568,
		result__h31595,
		result__h33169,
		result__h34077,
		result__h34105,
		result__h34133,
		result__h34161,
		result__h34189,
		result__h34217,
		result__h34245,
		result__h34290,
		result__h34318,
		result__h34346,
		result__h34374,
		result__h34402,
		result__h34430,
		result__h34458,
		result__h34486,
		result__h34531,
		result__h34559,
		result__h34587,
		result__h34615,
		result__h34656,
		result__h34684,
		result__h34712,
		result__h34740,
		result__h34781,
		result__h34809,
		result__h34848,
		result__h34876,
		w1___1__h24097,
		w1___1__h33049,
		w2___1__h33050,
		w2__h32980,
		word64__h6008,
		x__h20181,
		x__h32969,
		x__h6198,
		y__h12528,
		y__h6199,
		y__h6213;
  wire [31 : 0] IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC__q31,
		ld_val0732_BITS_31_TO_0__q38,
		ld_val0732_BITS_63_TO_32__q45,
		master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3,
		master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10,
		rg_st_amo_val_BITS_31_TO_0__q32,
		w12974_BITS_31_TO_0__q51,
		word64008_BITS_31_TO_0__q17,
		word64008_BITS_63_TO_32__q24;
  wire [15 : 0] ld_val0732_BITS_15_TO_0__q37,
		ld_val0732_BITS_31_TO_16__q41,
		ld_val0732_BITS_47_TO_32__q44,
		ld_val0732_BITS_63_TO_48__q48,
		master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2,
		master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q6,
		master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q9,
		master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13,
		word64008_BITS_15_TO_0__q16,
		word64008_BITS_31_TO_16__q20,
		word64008_BITS_47_TO_32__q23,
		word64008_BITS_63_TO_48__q27;
  wire [7 : 0] ld_val0732_BITS_15_TO_8__q39,
	       ld_val0732_BITS_23_TO_16__q40,
	       ld_val0732_BITS_31_TO_24__q42,
	       ld_val0732_BITS_39_TO_32__q43,
	       ld_val0732_BITS_47_TO_40__q46,
	       ld_val0732_BITS_55_TO_48__q47,
	       ld_val0732_BITS_63_TO_56__q49,
	       ld_val0732_BITS_7_TO_0__q36,
	       master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1,
	       master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4,
	       master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q5,
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q7,
	       master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q8,
	       master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11,
	       master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12,
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14,
	       strobe64__h2918,
	       strobe64__h2920,
	       strobe64__h2922,
	       word64008_BITS_15_TO_8__q18,
	       word64008_BITS_23_TO_16__q19,
	       word64008_BITS_31_TO_24__q21,
	       word64008_BITS_39_TO_32__q22,
	       word64008_BITS_47_TO_40__q25,
	       word64008_BITS_55_TO_48__q26,
	       word64008_BITS_63_TO_56__q28,
	       word64008_BITS_7_TO_0__q15;
  wire [5 : 0] shift_bits__h2768;
  wire [4 : 0] IF_NOT_ram_state_and_ctag_cset_b_read__04_BIT__ETC___d151,
	       IF_rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_ETC___d153,
	       IF_rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_ETC___d152;
  wire [3 : 0] access_exc_code__h2535, b__h26782;
  wire [1 : 0] tmp__h27043, tmp__h27044;
  wire IF_rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_ETC___d120,
       NOT_cfg_verbosity_read__1_ULE_1_2___d43,
       NOT_cfg_verbosity_read__1_ULE_2_97___d598,
       NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d161,
       NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d360,
       NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d368,
       NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d371,
       NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d377,
       NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d381,
       NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d392,
       NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d534,
       NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d546,
       NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d576,
       NOT_ram_state_and_ctag_cset_b_read__04_BIT_52__ETC___d119,
       NOT_ram_state_and_ctag_cset_b_read__04_BIT_52__ETC___d167,
       NOT_ram_state_and_ctag_cset_b_read__04_BIT_52__ETC___d369,
       NOT_ram_state_and_ctag_cset_b_read__04_BIT_52__ETC___d374,
       NOT_req_f3_BITS_1_TO_0_39_EQ_0b0_40_41_AND_NOT_ETC___d960,
       NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d148,
       NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d529,
       NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d549,
       NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d557,
       NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d569,
       NOT_rg_op_3_EQ_1_1_73_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d389,
       NOT_rg_op_3_EQ_1_1_73_AND_ram_state_and_ctag_c_ETC___d378,
       NOT_rg_op_3_EQ_2_5_40_OR_NOT_rg_amo_funct7_6_B_ETC___d387,
       NOT_rg_op_3_EQ_2_5_40_OR_NOT_rg_amo_funct7_6_B_ETC___d547,
       NOT_rg_op_3_EQ_2_5_40_OR_NOT_rg_amo_funct7_6_B_ETC___d551,
       NOT_rg_op_3_EQ_2_5_40_OR_NOT_rg_amo_funct7_6_B_ETC___d555,
       dmem_not_imem_AND_NOT_soc_map_m_is_mem_addr_rg_ETC___d122,
       lrsc_result__h20171,
       ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115,
       ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109,
       ram_state_and_ctag_cset_b_read__04_BIT_52_05_A_ETC___d164,
       ram_state_and_ctag_cset_b_read__04_BIT_52_05_A_ETC___d175,
       ram_state_and_ctag_cset_b_read__04_BIT_52_05_A_ETC___d358,
       ram_state_and_ctag_cset_b_read__04_BIT_52_05_A_ETC___d571,
       req_f3_BITS_1_TO_0_39_EQ_0b0_40_OR_req_f3_BITS_ETC___d969,
       rg_addr_9_EQ_rg_lrsc_pa_7___d165,
       rg_amo_funct7_6_BITS_6_TO_2_7_EQ_0b10_8_AND_ra_ETC___d363,
       rg_lrsc_pa_7_EQ_rg_addr_9___d98,
       rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d138,
       rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d169,
       rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d179,
       rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d181,
       rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d184,
       rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d177,
       rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d390,
       rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d527,
       rg_op_3_EQ_2_5_AND_rg_amo_funct7_6_BITS_6_TO_2_ETC___d561,
       rg_state_6_EQ_13_54_AND_rg_op_3_EQ_0_4_OR_rg_o_ETC___d656;
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
	  ld_val__h30732 or
	  MUX_dw_output_ld_val$wset_1__SEL_2 or
	  new_ld_val__h32940 or
	  MUX_dw_output_ld_val$wset_1__SEL_3 or
	  MUX_dw_output_ld_val$wset_1__VAL_3 or
	  MUX_dw_output_ld_val$wset_1__SEL_4 or rg_ld_val)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_dw_output_ld_val$wset_1__SEL_1: cword = ld_val__h30732;
      MUX_dw_output_ld_val$wset_1__SEL_2: cword = new_ld_val__h32940;
      MUX_dw_output_ld_val$wset_1__SEL_3:
	  cword = MUX_dw_output_ld_val$wset_1__VAL_3;
      MUX_dw_output_ld_val$wset_1__SEL_4: cword = rg_ld_val;
      default: cword = 64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  // value method st_amo_val
  assign st_amo_val =
	     MUX_dw_output_ld_val$wset_1__SEL_3 ? 64'd0 : rg_st_amo_val ;
  // value method exc
  assign exc = rg_state == 5'd4 ;
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
  FIFO2 #(.width(32'd131), .guarded(32'd1)) f_fabric_write_reqs(.RST(RST_N),
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
	  .DATA_WIDTH(32'd106),
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
	     rg_state == 5'd1 ;
  assign WILL_FIRE_RL_rl_reset = CAN_FIRE_RL_rl_reset ;
  // rule RL_rl_probe_and_immed_rsp
  assign CAN_FIRE_RL_rl_probe_and_immed_rsp =
	     dmem_not_imem_AND_NOT_soc_map_m_is_mem_addr_rg_ETC___d122 &&
	     rg_ddr4_ready &&
	     rg_state == 5'd3 ;
  assign WILL_FIRE_RL_rl_probe_and_immed_rsp =
	     CAN_FIRE_RL_rl_probe_and_immed_rsp &&
	     !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_start_cache_refill
  assign CAN_FIRE_RL_rl_start_cache_refill =
	     master_xactor_f_rd_addr$FULL_N && rg_state == 5'd9 &&
	     b__h26782 == 4'd0 ;
  assign WILL_FIRE_RL_rl_start_cache_refill =
	     CAN_FIRE_RL_rl_start_cache_refill &&
	     !WILL_FIRE_RL_rl_start_reset &&
	     !EN_req ;
  // rule RL_rl_cache_refill_rsps_loop
  assign CAN_FIRE_RL_rl_cache_refill_rsps_loop =
	     master_xactor_f_rd_data$EMPTY_N && rg_state == 5'd10 ;
  assign WILL_FIRE_RL_rl_cache_refill_rsps_loop =
	     CAN_FIRE_RL_rl_cache_refill_rsps_loop &&
	     !WILL_FIRE_RL_rl_start_reset &&
	     !EN_req ;
  // rule RL_rl_rereq
  assign CAN_FIRE_RL_rl_rereq = rg_state == 5'd11 ;
  assign WILL_FIRE_RL_rl_rereq =
	     CAN_FIRE_RL_rl_rereq && !WILL_FIRE_RL_rl_start_reset && !EN_req ;
  // rule RL_rl_ST_AMO_response
  assign CAN_FIRE_RL_rl_ST_AMO_response = rg_state == 5'd12 ;
  assign WILL_FIRE_RL_rl_ST_AMO_response = CAN_FIRE_RL_rl_ST_AMO_response ;
  // rule RL_rl_io_read_req
  assign CAN_FIRE_RL_rl_io_read_req =
	     master_xactor_f_rd_addr$FULL_N &&
	     rg_state_6_EQ_13_54_AND_rg_op_3_EQ_0_4_OR_rg_o_ETC___d656 ;
  assign WILL_FIRE_RL_rl_io_read_req =
	     CAN_FIRE_RL_rl_io_read_req && !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_io_read_rsp
  assign CAN_FIRE_RL_rl_io_read_rsp =
	     master_xactor_f_rd_data$EMPTY_N && rg_state == 5'd14 ;
  assign WILL_FIRE_RL_rl_io_read_rsp =
	     CAN_FIRE_RL_rl_io_read_rsp && !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_maintain_io_read_rsp
  assign CAN_FIRE_RL_rl_maintain_io_read_rsp = rg_state == 5'd15 ;
  assign WILL_FIRE_RL_rl_maintain_io_read_rsp =
	     CAN_FIRE_RL_rl_maintain_io_read_rsp ;
  // rule RL_rl_io_write_req
  assign CAN_FIRE_RL_rl_io_write_req =
	     f_fabric_write_reqs$FULL_N && rg_state == 5'd13 &&
	     rg_op == 2'd1 ;
  assign WILL_FIRE_RL_rl_io_write_req =
	     CAN_FIRE_RL_rl_io_write_req && !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_io_AMO_SC_req
  assign CAN_FIRE_RL_rl_io_AMO_SC_req =
	     rg_state == 5'd13 && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00011 ;
  assign WILL_FIRE_RL_rl_io_AMO_SC_req =
	     CAN_FIRE_RL_rl_io_AMO_SC_req && !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_io_AMO_op_req
  assign CAN_FIRE_RL_rl_io_AMO_op_req =
	     master_xactor_f_rd_addr$FULL_N && rg_state == 5'd13 &&
	     rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] != 5'b00010 &&
	     rg_amo_funct7[6:2] != 5'b00011 ;
  assign WILL_FIRE_RL_rl_io_AMO_op_req =
	     CAN_FIRE_RL_rl_io_AMO_op_req && !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_io_AMO_read_rsp
  assign CAN_FIRE_RL_rl_io_AMO_read_rsp =
	     master_xactor_f_rd_data$EMPTY_N &&
	     (master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	      f_fabric_write_reqs$FULL_N) &&
	     rg_state == 5'd16 ;
  assign WILL_FIRE_RL_rl_io_AMO_read_rsp = MUX_rg_state$write_1__SEL_3 ;
  // rule RL_rl_discard_write_rsp
  assign CAN_FIRE_RL_rl_discard_write_rsp =
	     b__h26782 != 4'd0 && master_xactor_f_wr_resp$EMPTY_N ;
  assign WILL_FIRE_RL_rl_discard_write_rsp =
	     CAN_FIRE_RL_rl_discard_write_rsp ;
  // rule RL_rl_drive_exception_rsp
  assign CAN_FIRE_RL_rl_drive_exception_rsp = rg_state == 5'd4 ;
  assign WILL_FIRE_RL_rl_drive_exception_rsp = rg_state == 5'd4 ;
  // rule RL_rl_start_reset
  assign CAN_FIRE_RL_rl_start_reset = MUX_rg_state$write_1__SEL_2 ;
  assign WILL_FIRE_RL_rl_start_reset = MUX_rg_state$write_1__SEL_2 ;
  // inputs to muxes for submodule ports
  assign MUX_dw_output_ld_val$wset_1__SEL_1 =
	     WILL_FIRE_RL_rl_io_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_dw_output_ld_val$wset_1__SEL_2 =
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_dw_output_ld_val$wset_1__SEL_3 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d184 ;
  assign MUX_dw_output_ld_val$wset_1__SEL_4 =
	     WILL_FIRE_RL_rl_maintain_io_read_rsp ||
	     WILL_FIRE_RL_rl_ST_AMO_response ;
  assign MUX_f_fabric_write_reqs$enq_1__SEL_2 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d529 ;
  assign MUX_master_xactor_f_rd_addr$enq_1__SEL_1 =
	     WILL_FIRE_RL_rl_io_AMO_op_req || WILL_FIRE_RL_rl_io_read_req ;
  assign MUX_ram_cword_set$a_put_1__SEL_1 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_ram_cword_set$b_put_1__SEL_1 =
	     EN_req &&
	     req_f3_BITS_1_TO_0_39_EQ_0b0_40_OR_req_f3_BITS_ETC___d969 ;
  assign MUX_ram_cword_set$b_put_1__SEL_2 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] != 3'd7 ;
  assign MUX_ram_state_and_ctag_cset$a_put_1__SEL_1 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] == 3'd0 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_rg_exc_code$write_1__SEL_1 =
	     EN_req &&
	     NOT_req_f3_BITS_1_TO_0_39_EQ_0b0_40_41_AND_NOT_ETC___d960 ;
  assign MUX_rg_exc_code$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign MUX_rg_exc_code$write_1__SEL_3 =
	     WILL_FIRE_RL_rl_io_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign MUX_rg_exc_code$write_1__SEL_4 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign MUX_rg_ld_val$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d381 ;
  assign MUX_rg_lrsc_valid$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d179 ;
  assign MUX_rg_state$write_1__SEL_2 =
	     f_reset_reqs$EMPTY_N && rg_state != 5'd1 ;
  assign MUX_rg_state$write_1__SEL_3 =
	     CAN_FIRE_RL_rl_io_AMO_read_rsp && !WILL_FIRE_RL_rl_start_reset ;
  assign MUX_rg_state$write_1__SEL_10 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] == 3'd7 ;
  assign MUX_rg_state$write_1__SEL_12 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (dmem_not_imem && !soc_map$m_is_mem_addr ||
	      rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d138 ||
	      NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d148) ;
  assign MUX_rg_state$write_1__SEL_13 =
	     WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 ;
  assign MUX_dw_output_ld_val$wset_1__VAL_3 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) ?
	       new_value__h6175 :
	       new_value__h22600 ;
  assign MUX_f_fabric_write_reqs$enq_1__VAL_1 = { rg_f3, rg_pa, x__h32969 } ;
  assign MUX_f_fabric_write_reqs$enq_1__VAL_2 =
	     { rg_f3,
	       rg_addr,
	       IF_rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_ETC___d531 } ;
  assign MUX_f_fabric_write_reqs$enq_1__VAL_3 =
	     { rg_f3, rg_pa, rg_st_amo_val } ;
  assign MUX_master_xactor_f_rd_addr$enq_1__VAL_1 =
	     { 4'd0, rg_pa, 8'd0, value__h32526, 18'd65536 } ;
  assign MUX_master_xactor_f_rd_addr$enq_1__VAL_2 =
	     { 4'd0, cline_fabric_addr__h26881, 29'd15532032 } ;
  assign MUX_ram_cword_set$a_put_3__VAL_1 =
	     rg_victim_way ?
	       { master_xactor_f_rd_data$D_OUT[66:3],
		 ram_cword_set$DOB[63:0] } :
	       { ram_cword_set$DOB[127:64],
		 master_xactor_f_rd_data$D_OUT[66:3] } ;
  assign MUX_ram_cword_set$a_put_3__VAL_2 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       { IF_ram_state_and_ctag_cset_b_read__04_BIT_105__ETC___d446,
		 IF_NOT_ram_state_and_ctag_cset_b_read__04_BIT__ETC___d447 } :
	       { IF_ram_state_and_ctag_cset_b_read__04_BIT_105__ETC___d523,
		 IF_NOT_ram_state_and_ctag_cset_b_read__04_BIT__ETC___d524 } ;
  assign MUX_ram_cword_set$b_put_2__VAL_2 = rg_cset_cword_in_cache + 9'd1 ;
  assign MUX_ram_cword_set$b_put_2__VAL_4 = { rg_addr[11:6], 3'd0 } ;
  assign MUX_ram_state_and_ctag_cset$a_put_3__VAL_1 =
	     { rg_victim_way || ram_state_and_ctag_cset$DOB[105],
	       rg_victim_way ?
		 rg_pa[63:12] :
		 ram_state_and_ctag_cset$DOB[104:53],
	       !rg_victim_way || ram_state_and_ctag_cset$DOB[52],
	       rg_victim_way ?
		 ram_state_and_ctag_cset$DOB[51:0] :
		 rg_pa[63:12] } ;
  assign MUX_rg_cset_in_cache$write_1__VAL_1 = rg_cset_in_cache + 6'd1 ;
  assign MUX_rg_exc_code$write_1__VAL_1 = (req_op == 2'd0) ? 4'd4 : 4'd6 ;
  assign MUX_rg_ld_val$write_1__VAL_2 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       x__h20181 :
	       IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_IF_rg_f3_53_E_ETC___d385 ;
  assign MUX_rg_state$write_1__VAL_1 =
	     NOT_req_f3_BITS_1_TO_0_39_EQ_0b0_40_41_AND_NOT_ETC___d960 ?
	       5'd4 :
	       5'd3 ;
  assign MUX_rg_state$write_1__VAL_3 =
	     (master_xactor_f_rd_data$D_OUT[2:1] == 2'b0) ? 5'd15 : 5'd4 ;
  assign MUX_rg_state$write_1__VAL_10 =
	     (master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	      rg_error_during_refill) ?
	       5'd4 :
	       5'd11 ;
  assign MUX_rg_state$write_1__VAL_12 =
	     (dmem_not_imem && !soc_map$m_is_mem_addr) ?
	       5'd13 :
	       IF_rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_ETC___d153 ;
  // inlined wires
  assign dw_valid$whas =
	     (WILL_FIRE_RL_rl_io_AMO_read_rsp ||
	      WILL_FIRE_RL_rl_io_read_rsp) &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d184 ||
	     WILL_FIRE_RL_rl_drive_exception_rsp ||
	     WILL_FIRE_RL_rl_maintain_io_read_rsp ||
	     WILL_FIRE_RL_rl_ST_AMO_response ;
  assign ctr_wr_rsps_pending_crg$port0__write_1 =
	     ctr_wr_rsps_pending_crg + 4'd1 ;
  assign ctr_wr_rsps_pending_crg$port1__write_1 = b__h26782 - 4'd1 ;
  assign ctr_wr_rsps_pending_crg$port2__read =
	     CAN_FIRE_RL_rl_discard_write_rsp ?
	       ctr_wr_rsps_pending_crg$port1__write_1 :
	       b__h26782 ;
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
  // register rg_amo_funct7
  assign rg_amo_funct7$D_IN = req_amo_funct7 ;
  assign rg_amo_funct7$EN = EN_req ;
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
  assign rg_error_during_refill$D_IN = MUX_rg_exc_code$write_1__SEL_4 ;
  assign rg_error_during_refill$EN =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	     WILL_FIRE_RL_rl_start_cache_refill ;
  // register rg_exc_code
  always@(MUX_rg_exc_code$write_1__SEL_1 or
	  MUX_rg_exc_code$write_1__VAL_1 or
	  MUX_rg_exc_code$write_1__SEL_2 or
	  MUX_rg_exc_code$write_1__SEL_3 or
	  MUX_rg_exc_code$write_1__SEL_4 or access_exc_code__h2535)
  case (1'b1)
    MUX_rg_exc_code$write_1__SEL_1:
	rg_exc_code$D_IN = MUX_rg_exc_code$write_1__VAL_1;
    MUX_rg_exc_code$write_1__SEL_2: rg_exc_code$D_IN = 4'd7;
    MUX_rg_exc_code$write_1__SEL_3: rg_exc_code$D_IN = 4'd5;
    MUX_rg_exc_code$write_1__SEL_4: rg_exc_code$D_IN = access_exc_code__h2535;
    default: rg_exc_code$D_IN = 4'b1010 /* unspecified value */ ;
  endcase
  assign rg_exc_code$EN =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	     WILL_FIRE_RL_rl_io_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	     EN_req &&
	     NOT_req_f3_BITS_1_TO_0_39_EQ_0b0_40_41_AND_NOT_ETC___d960 ;
  // register rg_f3
  assign rg_f3$D_IN = req_f3 ;
  assign rg_f3$EN = EN_req ;
  // register rg_ld_val
  always@(MUX_dw_output_ld_val$wset_1__SEL_2 or
	  new_ld_val__h32940 or
	  MUX_rg_ld_val$write_1__SEL_2 or
	  MUX_rg_ld_val$write_1__VAL_2 or
	  WILL_FIRE_RL_rl_io_read_rsp or
	  ld_val__h30732 or WILL_FIRE_RL_rl_io_AMO_SC_req)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_dw_output_ld_val$wset_1__SEL_2: rg_ld_val$D_IN = new_ld_val__h32940;
      MUX_rg_ld_val$write_1__SEL_2:
	  rg_ld_val$D_IN = MUX_rg_ld_val$write_1__VAL_2;
      WILL_FIRE_RL_rl_io_read_rsp: rg_ld_val$D_IN = ld_val__h30732;
      WILL_FIRE_RL_rl_io_AMO_SC_req: rg_ld_val$D_IN = 64'd1;
      default: rg_ld_val$D_IN = 64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign rg_ld_val$EN =
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d381 ||
	     WILL_FIRE_RL_rl_io_read_rsp ||
	     WILL_FIRE_RL_rl_io_AMO_SC_req ;
  // register rg_lower_word32
  assign rg_lower_word32$D_IN = 32'h0 ;
  assign rg_lower_word32$EN = 1'b0 ;
  // register rg_lower_word32_full
  assign rg_lower_word32_full$D_IN = 1'd0 ;
  assign rg_lower_word32_full$EN =
	     WILL_FIRE_RL_rl_start_cache_refill ||
	     WILL_FIRE_RL_rl_start_reset ;
  // register rg_lrsc_pa
  assign rg_lrsc_pa$D_IN = rg_addr ;
  assign rg_lrsc_pa$EN =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op == 2'd2 &&
	     rg_amo_funct7_6_BITS_6_TO_2_7_EQ_0b10_8_AND_ra_ETC___d363 ;
  // register rg_lrsc_valid
  assign rg_lrsc_valid$D_IN =
	     MUX_rg_lrsc_valid$write_1__SEL_2 &&
	     rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d181 ;
  assign rg_lrsc_valid$EN =
	     WILL_FIRE_RL_rl_io_read_req && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d179 ||
	     WILL_FIRE_RL_rl_start_reset ;
  // register rg_op
  assign rg_op$D_IN = req_op ;
  assign rg_op$EN = EN_req ;
  // register rg_pa
  assign rg_pa$D_IN = EN_req ? req_addr : rg_addr ;
  assign rg_pa$EN = EN_req || WILL_FIRE_RL_rl_probe_and_immed_rsp ;
  // register rg_pte_pa
  assign rg_pte_pa$D_IN = 64'h0 ;
  assign rg_pte_pa$EN = 1'b0 ;
  // register rg_st_amo_val
  assign rg_st_amo_val$D_IN = EN_req ? req_st_value : new_st_val__h23732 ;
  assign rg_st_amo_val$EN =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d576 ||
	     EN_req ;
  // register rg_state
  always@(EN_req or
	  MUX_rg_state$write_1__VAL_1 or
	  WILL_FIRE_RL_rl_start_reset or
	  WILL_FIRE_RL_rl_io_AMO_read_rsp or
	  MUX_rg_state$write_1__VAL_3 or
	  WILL_FIRE_RL_rl_io_AMO_op_req or
	  WILL_FIRE_RL_rl_io_AMO_SC_req or
	  WILL_FIRE_RL_rl_io_write_req or
	  WILL_FIRE_RL_rl_io_read_rsp or
	  WILL_FIRE_RL_rl_io_read_req or
	  WILL_FIRE_RL_rl_rereq or
	  MUX_rg_state$write_1__SEL_10 or
	  MUX_rg_state$write_1__VAL_10 or
	  WILL_FIRE_RL_rl_start_cache_refill or
	  MUX_rg_state$write_1__SEL_12 or
	  MUX_rg_state$write_1__VAL_12 or MUX_rg_state$write_1__SEL_13)
  case (1'b1)
    EN_req: rg_state$D_IN = MUX_rg_state$write_1__VAL_1;
    WILL_FIRE_RL_rl_start_reset: rg_state$D_IN = 5'd1;
    WILL_FIRE_RL_rl_io_AMO_read_rsp:
	rg_state$D_IN = MUX_rg_state$write_1__VAL_3;
    WILL_FIRE_RL_rl_io_AMO_op_req: rg_state$D_IN = 5'd16;
    WILL_FIRE_RL_rl_io_AMO_SC_req || WILL_FIRE_RL_rl_io_write_req:
	rg_state$D_IN = 5'd12;
    WILL_FIRE_RL_rl_io_read_rsp: rg_state$D_IN = MUX_rg_state$write_1__VAL_3;
    WILL_FIRE_RL_rl_io_read_req: rg_state$D_IN = 5'd14;
    WILL_FIRE_RL_rl_rereq: rg_state$D_IN = 5'd3;
    MUX_rg_state$write_1__SEL_10:
	rg_state$D_IN = MUX_rg_state$write_1__VAL_10;
    WILL_FIRE_RL_rl_start_cache_refill: rg_state$D_IN = 5'd10;
    MUX_rg_state$write_1__SEL_12:
	rg_state$D_IN = MUX_rg_state$write_1__VAL_12;
    MUX_rg_state$write_1__SEL_13: rg_state$D_IN = 5'd2;
    default: rg_state$D_IN = 5'b01010 /* unspecified value */ ;
  endcase
  assign rg_state$EN =
	     WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 ||
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] == 3'd7 ||
	     MUX_rg_state$write_1__SEL_12 ||
	     WILL_FIRE_RL_rl_io_AMO_read_rsp ||
	     WILL_FIRE_RL_rl_io_read_rsp ||
	     EN_req ||
	     WILL_FIRE_RL_rl_start_reset ||
	     WILL_FIRE_RL_rl_rereq ||
	     WILL_FIRE_RL_rl_start_cache_refill ||
	     WILL_FIRE_RL_rl_io_AMO_SC_req ||
	     WILL_FIRE_RL_rl_io_write_req ||
	     WILL_FIRE_RL_rl_io_read_req ||
	     WILL_FIRE_RL_rl_io_AMO_op_req ;
  // register rg_tohost_addr
  assign rg_tohost_addr$D_IN = set_watch_tohost_tohost_addr ;
  assign rg_tohost_addr$EN = EN_set_watch_tohost ;
  // register rg_tohost_value
  assign rg_tohost_value$D_IN = rg_st_amo_val ;
  assign rg_tohost_value$EN =
	     WILL_FIRE_RL_rl_ST_AMO_response && rg_watch_tohost &&
	     rg_pa == rg_tohost_addr &&
	     rg_st_amo_val != 64'd0 ;
  // register rg_victim_way
  assign rg_victim_way$D_IN = tmp__h27044[0] ;
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
  always@(MUX_dw_output_ld_val$wset_1__SEL_2 or
	  MUX_f_fabric_write_reqs$enq_1__VAL_1 or
	  MUX_f_fabric_write_reqs$enq_1__SEL_2 or
	  MUX_f_fabric_write_reqs$enq_1__VAL_2 or
	  WILL_FIRE_RL_rl_io_write_req or
	  MUX_f_fabric_write_reqs$enq_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_dw_output_ld_val$wset_1__SEL_2:
	  f_fabric_write_reqs$D_IN = MUX_f_fabric_write_reqs$enq_1__VAL_1;
      MUX_f_fabric_write_reqs$enq_1__SEL_2:
	  f_fabric_write_reqs$D_IN = MUX_f_fabric_write_reqs$enq_1__VAL_2;
      WILL_FIRE_RL_rl_io_write_req:
	  f_fabric_write_reqs$D_IN = MUX_f_fabric_write_reqs$enq_1__VAL_3;
      default: f_fabric_write_reqs$D_IN =
		   131'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign f_fabric_write_reqs$ENQ =
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d529 ||
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
	     MUX_master_xactor_f_rd_addr$enq_1__SEL_1 ?
	       MUX_master_xactor_f_rd_addr$enq_1__VAL_1 :
	       MUX_master_xactor_f_rd_addr$enq_1__VAL_2 ;
  assign master_xactor_f_rd_addr$ENQ =
	     WILL_FIRE_RL_rl_io_AMO_op_req || WILL_FIRE_RL_rl_io_read_req ||
	     WILL_FIRE_RL_rl_start_cache_refill ;
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
	     WILL_FIRE_RL_rl_io_AMO_read_rsp || WILL_FIRE_RL_rl_io_read_rsp ||
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop ;
  assign master_xactor_f_rd_data$CLR =
	     WILL_FIRE_RL_rl_start_reset && !f_reset_reqs$D_OUT ;
  // submodule master_xactor_f_wr_addr
  assign master_xactor_f_wr_addr$D_IN =
	     { 4'd0,
	       f_fabric_write_reqs$D_OUT[127:64],
	       8'd0,
	       x__h2801,
	       18'd65536 } ;
  assign master_xactor_f_wr_addr$ENQ = CAN_FIRE_RL_rl_fabric_send_write_req ;
  assign master_xactor_f_wr_addr$DEQ =
	     master_xactor_f_wr_addr$EMPTY_N && mem_master_awready ;
  assign master_xactor_f_wr_addr$CLR =
	     WILL_FIRE_RL_rl_start_reset && !f_reset_reqs$D_OUT ;
  // submodule master_xactor_f_wr_data
  assign master_xactor_f_wr_data$D_IN =
	     { mem_req_wr_data_wdata__h2980,
	       mem_req_wr_data_wstrb__h2981,
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
	     NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d392 ;
  assign ram_cword_set$ENB =
	     EN_req &&
	     req_f3_BITS_1_TO_0_39_EQ_0b0_40_OR_req_f3_BITS_ETC___d969 ||
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
	       106'h15555555555554AAAAAAAAAAAAA ;
  assign ram_state_and_ctag_cset$DIB =
	     MUX_ram_cword_set$b_put_1__SEL_1 ?
	       106'h2AAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */  :
	       106'h2AAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */  ;
  assign ram_state_and_ctag_cset$WEA = 1'd1 ;
  assign ram_state_and_ctag_cset$WEB = 1'd0 ;
  assign ram_state_and_ctag_cset$ENA =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] == 3'd0 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_reset ;
  assign ram_state_and_ctag_cset$ENB =
	     EN_req &&
	     req_f3_BITS_1_TO_0_39_EQ_0b0_40_OR_req_f3_BITS_ETC___d969 ||
	     WILL_FIRE_RL_rl_rereq ;
  // submodule soc_map
  assign soc_map$m_is_IO_addr_addr = 64'h0 ;
  assign soc_map$m_is_mem_addr_addr = rg_addr ;
  assign soc_map$m_is_near_mem_IO_addr_addr = 64'h0 ;
  // remaining internal signals
  assign IF_NOT_ram_state_and_ctag_cset_b_read__04_BIT__ETC___d151 =
	     ((!ram_state_and_ctag_cset$DOB[52] ||
	       !ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109) &&
	      (!ram_state_and_ctag_cset$DOB[105] ||
	       !ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115)) ?
	       5'd9 :
	       5'd12 ;
  assign IF_NOT_ram_state_and_ctag_cset_b_read__04_BIT__ETC___d447 =
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) ?
	       n__h20960 :
	       ram_cword_set$DOB[63:0] ;
  assign IF_NOT_ram_state_and_ctag_cset_b_read__04_BIT__ETC___d524 =
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) ?
	       n__h23896 :
	       ram_cword_set$DOB[63:0] ;
  assign IF_ram_state_and_ctag_cset_b_read__04_BIT_105__ETC___d446 =
	     (ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) ?
	       n__h20960 :
	       ram_cword_set$DOB[127:64] ;
  assign IF_ram_state_and_ctag_cset_b_read__04_BIT_105__ETC___d523 =
	     (ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) ?
	       n__h23896 :
	       ram_cword_set$DOB[127:64] ;
  assign IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_1_E_ETC___d354 =
	     (rg_addr[2:0] == 3'h0) ? 64'd1 : 64'd0 ;
  assign IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_IF__ETC___d854 =
	     (rg_addr[2:0] == 3'h0) ? ld_val__h30732 : 64'd0 ;
  assign IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_ram_ETC___d339 =
	     (rg_addr[2:0] == 3'h0) ? word64__h6008 : 64'd0 ;
  assign IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC__q31 =
	     IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC___d346[31:0] ;
  assign IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_rg_st_amo_val_ETC___d454 =
	     (rg_f3 == 3'b010) ?
	       { {32{rg_st_amo_val_BITS_31_TO_0__q32[31]}},
		 rg_st_amo_val_BITS_31_TO_0__q32 } :
	       rg_st_amo_val ;
  assign IF_rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_ETC___d153 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) ?
	       5'd9 :
	       IF_rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_ETC___d152 ;
  assign IF_rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_ETC___d120 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 &&
	       lrsc_result__h20171 ||
	       f_fabric_write_reqs$FULL_N :
	       NOT_ram_state_and_ctag_cset_b_read__04_BIT_52__ETC___d119 ;
  assign IF_rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_ETC___d152 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       5'd12 :
	       IF_NOT_ram_state_and_ctag_cset_b_read__04_BIT__ETC___d151 ;
  assign IF_rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_ETC___d531 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       rg_st_amo_val :
	       new_st_val__h23732 ;
  assign NOT_cfg_verbosity_read__1_ULE_1_2___d43 = cfg_verbosity > 4'd1 ;
  assign NOT_cfg_verbosity_read__1_ULE_2_97___d598 = cfg_verbosity > 4'd2 ;
  assign NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d161 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     ram_state_and_ctag_cset$DOB[52] &&
	     ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109 &&
	     ram_state_and_ctag_cset$DOB[105] &&
	     ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115 ;
  assign NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d360 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     ram_state_and_ctag_cset_b_read__04_BIT_52_05_A_ETC___d358 ;
  assign NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d368 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     ram_state_and_ctag_cset_b_read__04_BIT_52_05_A_ETC___d358 ;
  assign NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d371 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     NOT_ram_state_and_ctag_cset_b_read__04_BIT_52__ETC___d369 ;
  assign NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d377 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     NOT_ram_state_and_ctag_cset_b_read__04_BIT_52__ETC___d374 ;
  assign NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d381 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     (rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 ||
	      NOT_rg_op_3_EQ_1_1_73_AND_ram_state_and_ctag_c_ETC___d378) ;
  assign NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d392 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d390 ;
  assign NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d534 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd1 &&
	     rg_addr_9_EQ_rg_lrsc_pa_7___d165 &&
	     NOT_cfg_verbosity_read__1_ULE_1_2___d43 ;
  assign NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d546 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00011 &&
	     NOT_cfg_verbosity_read__1_ULE_1_2___d43 ;
  assign NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d576 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     NOT_rg_op_3_EQ_1_1_73_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d389 ;
  assign NOT_ram_state_and_ctag_cset_b_read__04_BIT_52__ETC___d119 =
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) ||
	     f_fabric_write_reqs$FULL_N ;
  assign NOT_ram_state_and_ctag_cset_b_read__04_BIT_52__ETC___d167 =
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) &&
	     rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     rg_addr_9_EQ_rg_lrsc_pa_7___d165 ;
  assign NOT_ram_state_and_ctag_cset_b_read__04_BIT_52__ETC___d369 =
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) &&
	     NOT_cfg_verbosity_read__1_ULE_1_2___d43 ;
  assign NOT_ram_state_and_ctag_cset_b_read__04_BIT_52__ETC___d374 =
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) &&
	     rg_addr_9_EQ_rg_lrsc_pa_7___d165 &&
	     NOT_cfg_verbosity_read__1_ULE_1_2___d43 ;
  assign NOT_req_f3_BITS_1_TO_0_39_EQ_0b0_40_41_AND_NOT_ETC___d960 =
	     req_f3[1:0] != 2'b0 && (req_f3[1:0] != 2'b01 || req_addr[0]) &&
	     (req_f3[1:0] != 2'b10 || req_addr[1:0] != 2'b0) &&
	     (req_f3[1:0] != 2'b11 || req_addr[2:0] != 3'b0) ;
  assign NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d148 =
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_7_EQ_rg_addr_9___d98) ;
  assign NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d529 =
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     (rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d527 ||
	      NOT_rg_op_3_EQ_1_1_73_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d389) ;
  assign NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d549 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     NOT_rg_op_3_EQ_2_5_40_OR_NOT_rg_amo_funct7_6_B_ETC___d547 ;
  assign NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d557 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     NOT_rg_op_3_EQ_2_5_40_OR_NOT_rg_amo_funct7_6_B_ETC___d555 ;
  assign NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d569 =
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     rg_op != 2'd1 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	     ram_state_and_ctag_cset_b_read__04_BIT_52_05_A_ETC___d358 ;
  assign NOT_rg_op_3_EQ_1_1_73_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d389 =
	     rg_op != 2'd1 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) ;
  assign NOT_rg_op_3_EQ_1_1_73_AND_ram_state_and_ctag_c_ETC___d378 =
	     rg_op != 2'd1 &&
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) ;
  assign NOT_rg_op_3_EQ_2_5_40_OR_NOT_rg_amo_funct7_6_B_ETC___d387 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_7_EQ_rg_addr_9___d98) &&
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) ;
  assign NOT_rg_op_3_EQ_2_5_40_OR_NOT_rg_amo_funct7_6_B_ETC___d547 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_7_EQ_rg_addr_9___d98) &&
	     ram_state_and_ctag_cset_b_read__04_BIT_52_05_A_ETC___d358 ;
  assign NOT_rg_op_3_EQ_2_5_40_OR_NOT_rg_amo_funct7_6_B_ETC___d551 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_7_EQ_rg_addr_9___d98) &&
	     NOT_ram_state_and_ctag_cset_b_read__04_BIT_52__ETC___d369 ;
  assign NOT_rg_op_3_EQ_2_5_40_OR_NOT_rg_amo_funct7_6_B_ETC___d555 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_7_EQ_rg_addr_9___d98) &&
	     NOT_cfg_verbosity_read__1_ULE_1_2___d43 ;
  assign _theResult___snd_fst__h2988 =
	     f_fabric_write_reqs$D_OUT[63:0] << shift_bits__h2768 ;
  assign access_exc_code__h2535 =
	     dmem_not_imem ?
	       ((rg_op == 2'd0 ||
		 rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) ?
		  4'd5 :
		  4'd7) :
	       4'd1 ;
  assign b__h26782 =
	     CAN_FIRE_RL_rl_fabric_send_write_req ?
	       ctr_wr_rsps_pending_crg$port0__write_1 :
	       ctr_wr_rsps_pending_crg ;
  assign cline_fabric_addr__h26881 = { rg_pa[63:6], 6'd0 } ;
  assign dmem_not_imem_AND_NOT_soc_map_m_is_mem_addr_rg_ETC___d122 =
	     dmem_not_imem && !soc_map$m_is_mem_addr || rg_op == 2'd0 ||
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010 ||
	     IF_rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_ETC___d120 ;
  assign ld_val0732_BITS_15_TO_0__q37 = ld_val__h30732[15:0] ;
  assign ld_val0732_BITS_15_TO_8__q39 = ld_val__h30732[15:8] ;
  assign ld_val0732_BITS_23_TO_16__q40 = ld_val__h30732[23:16] ;
  assign ld_val0732_BITS_31_TO_0__q38 = ld_val__h30732[31:0] ;
  assign ld_val0732_BITS_31_TO_16__q41 = ld_val__h30732[31:16] ;
  assign ld_val0732_BITS_31_TO_24__q42 = ld_val__h30732[31:24] ;
  assign ld_val0732_BITS_39_TO_32__q43 = ld_val__h30732[39:32] ;
  assign ld_val0732_BITS_47_TO_32__q44 = ld_val__h30732[47:32] ;
  assign ld_val0732_BITS_47_TO_40__q46 = ld_val__h30732[47:40] ;
  assign ld_val0732_BITS_55_TO_48__q47 = ld_val__h30732[55:48] ;
  assign ld_val0732_BITS_63_TO_32__q45 = ld_val__h30732[63:32] ;
  assign ld_val0732_BITS_63_TO_48__q48 = ld_val__h30732[63:48] ;
  assign ld_val0732_BITS_63_TO_56__q49 = ld_val__h30732[63:56] ;
  assign ld_val0732_BITS_7_TO_0__q36 = ld_val__h30732[7:0] ;
  assign lrsc_result__h20171 =
	     !rg_lrsc_valid || !rg_lrsc_pa_7_EQ_rg_addr_9___d98 ;
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
  assign new_st_val__h23732 =
	     (rg_f3 == 3'b010) ?
	       new_st_val__h24038 :
	       _theResult_____2__h24034 ;
  assign new_st_val__h24038 = { 32'd0, _theResult_____2__h24034[31:0] } ;
  assign new_st_val__h24129 =
	     IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_IF_rg_f3_53_E_ETC___d385 +
	     IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_rg_st_amo_val_ETC___d454 ;
  assign new_st_val__h25109 = w1__h24026 ^ w2__h32980 ;
  assign new_st_val__h25113 = w1__h24026 & w2__h32980 ;
  assign new_st_val__h25117 = w1__h24026 | w2__h32980 ;
  assign new_st_val__h25121 =
	     (w1__h24026 < w2__h32980) ? w1__h24026 : w2__h32980 ;
  assign new_st_val__h25126 =
	     (w1__h24026 <= w2__h32980) ? w2__h32980 : w1__h24026 ;
  assign new_st_val__h25132 =
	     ((IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_IF_rg_f3_53_E_ETC___d385 ^
	       64'h8000000000000000) <
	      (IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_rg_st_amo_val_ETC___d454 ^
	       64'h8000000000000000)) ?
	       w1__h24026 :
	       w2__h32980 ;
  assign new_st_val__h25137 =
	     ((IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_IF_rg_f3_53_E_ETC___d385 ^
	       64'h8000000000000000) <=
	      (IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_rg_st_amo_val_ETC___d454 ^
	       64'h8000000000000000)) ?
	       w2__h32980 :
	       w1__h24026 ;
  assign new_st_val__h32990 = { 32'd0, _theResult_____2__h32986[31:0] } ;
  assign new_st_val__h33081 =
	     new_ld_val__h32940 +
	     IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_rg_st_amo_val_ETC___d454 ;
  assign new_st_val__h34941 = w1__h32978 ^ w2__h32980 ;
  assign new_st_val__h34945 = w1__h32978 & w2__h32980 ;
  assign new_st_val__h34949 = w1__h32978 | w2__h32980 ;
  assign new_st_val__h34953 =
	     (w1__h32978 < w2__h32980) ? w1__h32978 : w2__h32980 ;
  assign new_st_val__h34958 =
	     (w1__h32978 <= w2__h32980) ? w2__h32980 : w1__h32978 ;
  assign new_st_val__h34964 =
	     ((new_ld_val__h32940 ^ 64'h8000000000000000) <
	      (IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_rg_st_amo_val_ETC___d454 ^
	       64'h8000000000000000)) ?
	       w1__h32978 :
	       w2__h32980 ;
  assign new_st_val__h34969 =
	     ((new_ld_val__h32940 ^ 64'h8000000000000000) <=
	      (IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_rg_st_amo_val_ETC___d454 ^
	       64'h8000000000000000)) ?
	       w2__h32980 :
	       w1__h32978 ;
  assign new_value__h22600 =
	     (rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       64'd1 :
	       CASE_rg_f3_0b0_IF_rg_addr_9_BITS_2_TO_0_30_EQ__ETC__q52 ;
  assign new_value__h6175 =
	     (rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       word64__h6008 :
	       IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC___d346 ;
  assign ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115 =
	     ram_state_and_ctag_cset$DOB[104:53] == rg_addr[63:12] ;
  assign ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109 =
	     ram_state_and_ctag_cset$DOB[51:0] == rg_addr[63:12] ;
  assign ram_state_and_ctag_cset_b_read__04_BIT_52_05_A_ETC___d164 =
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) &&
	     rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 ;
  assign ram_state_and_ctag_cset_b_read__04_BIT_52_05_A_ETC___d175 =
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) &&
	     rg_addr_9_EQ_rg_lrsc_pa_7___d165 ;
  assign ram_state_and_ctag_cset_b_read__04_BIT_52_05_A_ETC___d358 =
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) &&
	     NOT_cfg_verbosity_read__1_ULE_1_2___d43 ;
  assign ram_state_and_ctag_cset_b_read__04_BIT_52_05_A_ETC___d571 =
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) &&
	     rg_addr_9_EQ_rg_lrsc_pa_7___d165 &&
	     NOT_cfg_verbosity_read__1_ULE_1_2___d43 ;
  assign req_f3_BITS_1_TO_0_39_EQ_0b0_40_OR_req_f3_BITS_ETC___d969 =
	     req_f3[1:0] == 2'b0 || req_f3[1:0] == 2'b01 && !req_addr[0] ||
	     req_f3[1:0] == 2'b10 && req_addr[1:0] == 2'b0 ||
	     req_f3[1:0] == 2'b11 && req_addr[2:0] == 3'b0 ;
  assign result__h18884 =
	     { {56{word64008_BITS_7_TO_0__q15[7]}},
	       word64008_BITS_7_TO_0__q15 } ;
  assign result__h18912 =
	     { {56{word64008_BITS_15_TO_8__q18[7]}},
	       word64008_BITS_15_TO_8__q18 } ;
  assign result__h18940 =
	     { {56{word64008_BITS_23_TO_16__q19[7]}},
	       word64008_BITS_23_TO_16__q19 } ;
  assign result__h18968 =
	     { {56{word64008_BITS_31_TO_24__q21[7]}},
	       word64008_BITS_31_TO_24__q21 } ;
  assign result__h18996 =
	     { {56{word64008_BITS_39_TO_32__q22[7]}},
	       word64008_BITS_39_TO_32__q22 } ;
  assign result__h19024 =
	     { {56{word64008_BITS_47_TO_40__q25[7]}},
	       word64008_BITS_47_TO_40__q25 } ;
  assign result__h19052 =
	     { {56{word64008_BITS_55_TO_48__q26[7]}},
	       word64008_BITS_55_TO_48__q26 } ;
  assign result__h19080 =
	     { {56{word64008_BITS_63_TO_56__q28[7]}},
	       word64008_BITS_63_TO_56__q28 } ;
  assign result__h19125 = { 56'd0, word64__h6008[7:0] } ;
  assign result__h19153 = { 56'd0, word64__h6008[15:8] } ;
  assign result__h19181 = { 56'd0, word64__h6008[23:16] } ;
  assign result__h19209 = { 56'd0, word64__h6008[31:24] } ;
  assign result__h19237 = { 56'd0, word64__h6008[39:32] } ;
  assign result__h19265 = { 56'd0, word64__h6008[47:40] } ;
  assign result__h19293 = { 56'd0, word64__h6008[55:48] } ;
  assign result__h19321 = { 56'd0, word64__h6008[63:56] } ;
  assign result__h19366 =
	     { {48{word64008_BITS_15_TO_0__q16[15]}},
	       word64008_BITS_15_TO_0__q16 } ;
  assign result__h19394 =
	     { {48{word64008_BITS_31_TO_16__q20[15]}},
	       word64008_BITS_31_TO_16__q20 } ;
  assign result__h19422 =
	     { {48{word64008_BITS_47_TO_32__q23[15]}},
	       word64008_BITS_47_TO_32__q23 } ;
  assign result__h19450 =
	     { {48{word64008_BITS_63_TO_48__q27[15]}},
	       word64008_BITS_63_TO_48__q27 } ;
  assign result__h19491 = { 48'd0, word64__h6008[15:0] } ;
  assign result__h19519 = { 48'd0, word64__h6008[31:16] } ;
  assign result__h19547 = { 48'd0, word64__h6008[47:32] } ;
  assign result__h19575 = { 48'd0, word64__h6008[63:48] } ;
  assign result__h19616 =
	     { {32{word64008_BITS_31_TO_0__q17[31]}},
	       word64008_BITS_31_TO_0__q17 } ;
  assign result__h19644 =
	     { {32{word64008_BITS_63_TO_32__q24[31]}},
	       word64008_BITS_63_TO_32__q24 } ;
  assign result__h19683 = { 32'd0, word64__h6008[31:0] } ;
  assign result__h19711 = { 32'd0, word64__h6008[63:32] } ;
  assign result__h30792 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1 } ;
  assign result__h30822 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4 } ;
  assign result__h30849 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q5[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q5 } ;
  assign result__h30876 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q7[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q7 } ;
  assign result__h30903 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q8[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q8 } ;
  assign result__h30930 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11 } ;
  assign result__h30957 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12 } ;
  assign result__h30984 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14 } ;
  assign result__h31028 = { 56'd0, master_xactor_f_rd_data$D_OUT[10:3] } ;
  assign result__h31055 = { 56'd0, master_xactor_f_rd_data$D_OUT[18:11] } ;
  assign result__h31082 = { 56'd0, master_xactor_f_rd_data$D_OUT[26:19] } ;
  assign result__h31109 = { 56'd0, master_xactor_f_rd_data$D_OUT[34:27] } ;
  assign result__h31136 = { 56'd0, master_xactor_f_rd_data$D_OUT[42:35] } ;
  assign result__h31163 = { 56'd0, master_xactor_f_rd_data$D_OUT[50:43] } ;
  assign result__h31190 = { 56'd0, master_xactor_f_rd_data$D_OUT[58:51] } ;
  assign result__h31217 = { 56'd0, master_xactor_f_rd_data$D_OUT[66:59] } ;
  assign result__h31261 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2 } ;
  assign result__h31288 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q6[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q6 } ;
  assign result__h31315 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q9[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q9 } ;
  assign result__h31342 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13 } ;
  assign result__h31382 = { 48'd0, master_xactor_f_rd_data$D_OUT[18:3] } ;
  assign result__h31409 = { 48'd0, master_xactor_f_rd_data$D_OUT[34:19] } ;
  assign result__h31436 = { 48'd0, master_xactor_f_rd_data$D_OUT[50:35] } ;
  assign result__h31463 = { 48'd0, master_xactor_f_rd_data$D_OUT[66:51] } ;
  assign result__h31503 =
	     { {32{master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3[31]}},
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3 } ;
  assign result__h31530 =
	     { {32{master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10[31]}},
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10 } ;
  assign result__h31568 = { 32'd0, master_xactor_f_rd_data$D_OUT[34:3] } ;
  assign result__h31595 = { 32'd0, master_xactor_f_rd_data$D_OUT[66:35] } ;
  assign result__h33169 =
	     { {56{ld_val0732_BITS_7_TO_0__q36[7]}},
	       ld_val0732_BITS_7_TO_0__q36 } ;
  assign result__h34077 =
	     { {56{ld_val0732_BITS_15_TO_8__q39[7]}},
	       ld_val0732_BITS_15_TO_8__q39 } ;
  assign result__h34105 =
	     { {56{ld_val0732_BITS_23_TO_16__q40[7]}},
	       ld_val0732_BITS_23_TO_16__q40 } ;
  assign result__h34133 =
	     { {56{ld_val0732_BITS_31_TO_24__q42[7]}},
	       ld_val0732_BITS_31_TO_24__q42 } ;
  assign result__h34161 =
	     { {56{ld_val0732_BITS_39_TO_32__q43[7]}},
	       ld_val0732_BITS_39_TO_32__q43 } ;
  assign result__h34189 =
	     { {56{ld_val0732_BITS_47_TO_40__q46[7]}},
	       ld_val0732_BITS_47_TO_40__q46 } ;
  assign result__h34217 =
	     { {56{ld_val0732_BITS_55_TO_48__q47[7]}},
	       ld_val0732_BITS_55_TO_48__q47 } ;
  assign result__h34245 =
	     { {56{ld_val0732_BITS_63_TO_56__q49[7]}},
	       ld_val0732_BITS_63_TO_56__q49 } ;
  assign result__h34290 = { 56'd0, ld_val__h30732[7:0] } ;
  assign result__h34318 = { 56'd0, ld_val__h30732[15:8] } ;
  assign result__h34346 = { 56'd0, ld_val__h30732[23:16] } ;
  assign result__h34374 = { 56'd0, ld_val__h30732[31:24] } ;
  assign result__h34402 = { 56'd0, ld_val__h30732[39:32] } ;
  assign result__h34430 = { 56'd0, ld_val__h30732[47:40] } ;
  assign result__h34458 = { 56'd0, ld_val__h30732[55:48] } ;
  assign result__h34486 = { 56'd0, ld_val__h30732[63:56] } ;
  assign result__h34531 =
	     { {48{ld_val0732_BITS_15_TO_0__q37[15]}},
	       ld_val0732_BITS_15_TO_0__q37 } ;
  assign result__h34559 =
	     { {48{ld_val0732_BITS_31_TO_16__q41[15]}},
	       ld_val0732_BITS_31_TO_16__q41 } ;
  assign result__h34587 =
	     { {48{ld_val0732_BITS_47_TO_32__q44[15]}},
	       ld_val0732_BITS_47_TO_32__q44 } ;
  assign result__h34615 =
	     { {48{ld_val0732_BITS_63_TO_48__q48[15]}},
	       ld_val0732_BITS_63_TO_48__q48 } ;
  assign result__h34656 = { 48'd0, ld_val__h30732[15:0] } ;
  assign result__h34684 = { 48'd0, ld_val__h30732[31:16] } ;
  assign result__h34712 = { 48'd0, ld_val__h30732[47:32] } ;
  assign result__h34740 = { 48'd0, ld_val__h30732[63:48] } ;
  assign result__h34781 =
	     { {32{ld_val0732_BITS_31_TO_0__q38[31]}},
	       ld_val0732_BITS_31_TO_0__q38 } ;
  assign result__h34809 =
	     { {32{ld_val0732_BITS_63_TO_32__q45[31]}},
	       ld_val0732_BITS_63_TO_32__q45 } ;
  assign result__h34848 = { 32'd0, ld_val__h30732[31:0] } ;
  assign result__h34876 = { 32'd0, ld_val__h30732[63:32] } ;
  assign rg_addr_9_EQ_rg_lrsc_pa_7___d165 = rg_addr == rg_lrsc_pa ;
  assign rg_amo_funct7_6_BITS_6_TO_2_7_EQ_0b10_8_AND_ra_ETC___d363 =
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) ;
  assign rg_lrsc_pa_7_EQ_rg_addr_9___d98 = rg_lrsc_pa == rg_addr ;
  assign rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d138 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) ;
  assign rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d169 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     (ram_state_and_ctag_cset_b_read__04_BIT_52_05_A_ETC___d164 ||
	      NOT_ram_state_and_ctag_cset_b_read__04_BIT_52__ETC___d167) ;
  assign rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d179 =
	     rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d169 ||
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d177 ;
  assign rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d181 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115) ;
  assign rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d184 =
	     rg_op_3_EQ_0_4_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d181 ||
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 &&
	     lrsc_result__h20171 ;
  assign rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d177 =
	     rg_op == 2'd1 && rg_addr_9_EQ_rg_lrsc_pa_7___d165 ||
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 ||
	     rg_op != 2'd1 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	     ram_state_and_ctag_cset_b_read__04_BIT_52_05_A_ETC___d175 ;
  assign rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d390 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     NOT_rg_op_3_EQ_2_5_40_OR_NOT_rg_amo_funct7_6_B_ETC___d387 ||
	     NOT_rg_op_3_EQ_1_1_73_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d389 ;
  assign rg_op_3_EQ_1_1_OR_rg_op_3_EQ_2_5_AND_rg_amo_fu_ETC___d527 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_7_EQ_rg_addr_9___d98) ;
  assign rg_op_3_EQ_2_5_AND_rg_amo_funct7_6_BITS_6_TO_2_ETC___d561 =
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 &&
	     lrsc_result__h20171 &&
	     NOT_cfg_verbosity_read__1_ULE_1_2___d43 ;
  assign rg_st_amo_val_BITS_31_TO_0__q32 = rg_st_amo_val[31:0] ;
  assign rg_state_6_EQ_13_54_AND_rg_op_3_EQ_0_4_OR_rg_o_ETC___d656 =
	     rg_state == 5'd13 &&
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     b__h26782 == 4'd0 ;
  assign shift_bits__h2768 = { f_fabric_write_reqs$D_OUT[66:64], 3'b0 } ;
  assign strobe64__h2918 = 8'b00000001 << f_fabric_write_reqs$D_OUT[66:64] ;
  assign strobe64__h2920 = 8'b00000011 << f_fabric_write_reqs$D_OUT[66:64] ;
  assign strobe64__h2922 = 8'b00001111 << f_fabric_write_reqs$D_OUT[66:64] ;
  assign tmp__h27043 = { 1'd0, rg_victim_way } ;
  assign tmp__h27044 = tmp__h27043 + 2'd1 ;
  assign w12974_BITS_31_TO_0__q51 = w1__h32974[31:0] ;
  assign w1___1__h24097 =
	     { 32'd0,
	       IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC___d346[31:0] } ;
  assign w1___1__h33049 = { 32'd0, w1__h32974[31:0] } ;
  assign w2___1__h33050 = { 32'd0, rg_st_amo_val[31:0] } ;
  assign w2__h32980 = (rg_f3 == 3'b010) ? w2___1__h33050 : rg_st_amo_val ;
  assign word64008_BITS_15_TO_0__q16 = word64__h6008[15:0] ;
  assign word64008_BITS_15_TO_8__q18 = word64__h6008[15:8] ;
  assign word64008_BITS_23_TO_16__q19 = word64__h6008[23:16] ;
  assign word64008_BITS_31_TO_0__q17 = word64__h6008[31:0] ;
  assign word64008_BITS_31_TO_16__q20 = word64__h6008[31:16] ;
  assign word64008_BITS_31_TO_24__q21 = word64__h6008[31:24] ;
  assign word64008_BITS_39_TO_32__q22 = word64__h6008[39:32] ;
  assign word64008_BITS_47_TO_32__q23 = word64__h6008[47:32] ;
  assign word64008_BITS_47_TO_40__q25 = word64__h6008[47:40] ;
  assign word64008_BITS_55_TO_48__q26 = word64__h6008[55:48] ;
  assign word64008_BITS_63_TO_32__q24 = word64__h6008[63:32] ;
  assign word64008_BITS_63_TO_48__q27 = word64__h6008[63:48] ;
  assign word64008_BITS_63_TO_56__q28 = word64__h6008[63:56] ;
  assign word64008_BITS_7_TO_0__q15 = word64__h6008[7:0] ;
  assign word64__h6008 = x__h6198 | y__h6199 ;
  assign x__h20181 = { 63'd0, lrsc_result__h20171 } ;
  assign x__h32969 =
	     (rg_f3 == 3'b010) ?
	       new_st_val__h32990 :
	       _theResult_____2__h32986 ;
  assign x__h6198 = ram_cword_set$DOB[63:0] & y__h6213 ;
  assign y__h12528 =
	     {64{ram_state_and_ctag_cset$DOB[105] &&
		 ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115}} ;
  assign y__h6199 = ram_cword_set$DOB[127:64] & y__h12528 ;
  assign y__h6213 =
	     {64{ram_state_and_ctag_cset$DOB[52] &&
		 ram_state_and_ctag_cset_b_read__04_BITS_51_TO__ETC___d109}} ;
  always@(f_fabric_write_reqs$D_OUT)
  begin
    case (f_fabric_write_reqs$D_OUT[129:128])
      2'b0: x__h2801 = 3'b0;
      2'b01: x__h2801 = 3'b001;
      2'b10: x__h2801 = 3'b010;
      2'b11: x__h2801 = 3'b011;
    endcase
  end
  always@(rg_f3)
  begin
    case (rg_f3[1:0])
      2'b0: value__h32526 = 3'b0;
      2'b01: value__h32526 = 3'b001;
      2'b10: value__h32526 = 3'b010;
      2'd3: value__h32526 = 3'b011;
    endcase
  end
  always@(f_fabric_write_reqs$D_OUT or
	  strobe64__h2918 or strobe64__h2920 or strobe64__h2922)
  begin
    case (f_fabric_write_reqs$D_OUT[129:128])
      2'b0: mem_req_wr_data_wstrb__h2981 = strobe64__h2918;
      2'b01: mem_req_wr_data_wstrb__h2981 = strobe64__h2920;
      2'b10: mem_req_wr_data_wstrb__h2981 = strobe64__h2922;
      2'b11: mem_req_wr_data_wstrb__h2981 = 8'b11111111;
    endcase
  end
  always@(f_fabric_write_reqs$D_OUT or _theResult___snd_fst__h2988)
  begin
    case (f_fabric_write_reqs$D_OUT[129:128])
      2'b0, 2'b01, 2'b10:
	  mem_req_wr_data_wdata__h2980 = _theResult___snd_fst__h2988;
      2'd3: mem_req_wr_data_wdata__h2980 = f_fabric_write_reqs$D_OUT[63:0];
    endcase
  end
  always@(ram_state_and_ctag_cset$DOB or
	  ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115 or
	  ram_cword_set$DOB)
  begin
    case (ram_state_and_ctag_cset$DOB[105] &&
	  ram_state_and_ctag_cset_b_read__04_BITS_104_TO_ETC___d115)
      1'd0: old_cword__h20949 = ram_cword_set$DOB[63:0];
      1'd1: old_cword__h20949 = ram_cword_set$DOB[127:64];
    endcase
  end
  always@(rg_addr or
	  result__h18884 or
	  result__h18912 or
	  result__h18940 or
	  result__h18968 or
	  result__h18996 or
	  result__h19024 or result__h19052 or result__h19080)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d286 =
	      result__h18884;
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d286 =
	      result__h18912;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d286 =
	      result__h18940;
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d286 =
	      result__h18968;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d286 =
	      result__h18996;
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d286 =
	      result__h19024;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d286 =
	      result__h19052;
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d286 =
	      result__h19080;
    endcase
  end
  always@(rg_addr or
	  result__h19125 or
	  result__h19153 or
	  result__h19181 or
	  result__h19209 or
	  result__h19237 or
	  result__h19265 or result__h19293 or result__h19321)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d303 =
	      result__h19125;
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d303 =
	      result__h19153;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d303 =
	      result__h19181;
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d303 =
	      result__h19209;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d303 =
	      result__h19237;
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d303 =
	      result__h19265;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d303 =
	      result__h19293;
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d303 =
	      result__h19321;
    endcase
  end
  always@(rg_addr or
	  result__h19366 or
	  result__h19394 or result__h19422 or result__h19450)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d316 =
	      result__h19366;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d316 =
	      result__h19394;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d316 =
	      result__h19422;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d316 =
	      result__h19450;
      default: IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d316 =
		   64'd0;
    endcase
  end
  always@(rg_addr or result__h19683 or result__h19711)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d337 =
	      result__h19683;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d337 =
	      result__h19711;
      default: IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d337 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h19491 or
	  result__h19519 or result__h19547 or result__h19575)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d325 =
	      result__h19491;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d325 =
	      result__h19519;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d325 =
	      result__h19547;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d325 =
	      result__h19575;
      default: IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d325 =
		   64'd0;
    endcase
  end
  always@(rg_addr or result__h19616 or result__h19644)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result9616_0x4_re_ETC__q29 =
	      result__h19616;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result9616_0x4_re_ETC__q29 =
	      result__h19644;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result9616_0x4_re_ETC__q29 =
		   64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d286 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d316 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result9616_0x4_re_ETC__q29 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_ram_ETC___d339 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d303 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d325 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d337)
  begin
    case (rg_f3)
      3'b0:
	  IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC___d346 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d286;
      3'b001:
	  IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC___d346 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d316;
      3'b010:
	  IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC___d346 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result9616_0x4_re_ETC__q29;
      3'b011:
	  IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC___d346 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_ram_ETC___d339;
      3'b100:
	  IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC___d346 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d303;
      3'b101:
	  IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC___d346 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d325;
      3'b110:
	  IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC___d346 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d337;
      3'd7: IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC___d346 = 64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d286 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d316 or
	  w1___1__h24097 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_ram_ETC___d339 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d303 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d325 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d337)
  begin
    case (rg_f3)
      3'b0:
	  w1__h24026 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d286;
      3'b001:
	  w1__h24026 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d316;
      3'b010: w1__h24026 = w1___1__h24097;
      3'b011:
	  w1__h24026 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_ram_ETC___d339;
      3'b100:
	  w1__h24026 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d303;
      3'b101:
	  w1__h24026 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d325;
      3'b110:
	  w1__h24026 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d337;
      3'd7: w1__h24026 = 64'd0;
    endcase
  end
  always@(rg_addr or old_cword__h20949 or rg_st_amo_val)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d436 =
	      { old_cword__h20949[63:16], rg_st_amo_val[15:0] };
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d436 =
	      { old_cword__h20949[63:32],
		rg_st_amo_val[15:0],
		old_cword__h20949[15:0] };
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d436 =
	      { old_cword__h20949[63:48],
		rg_st_amo_val[15:0],
		old_cword__h20949[31:0] };
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d436 =
	      { rg_st_amo_val[15:0], old_cword__h20949[47:0] };
      default: IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d436 =
		   old_cword__h20949;
    endcase
  end
  always@(rg_addr or old_cword__h20949 or rg_st_amo_val)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d427 =
	      { old_cword__h20949[63:8], rg_st_amo_val[7:0] };
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d427 =
	      { old_cword__h20949[63:16],
		rg_st_amo_val[7:0],
		old_cword__h20949[7:0] };
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d427 =
	      { old_cword__h20949[63:24],
		rg_st_amo_val[7:0],
		old_cword__h20949[15:0] };
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d427 =
	      { old_cword__h20949[63:32],
		rg_st_amo_val[7:0],
		old_cword__h20949[23:0] };
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d427 =
	      { old_cword__h20949[63:40],
		rg_st_amo_val[7:0],
		old_cword__h20949[31:0] };
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d427 =
	      { old_cword__h20949[63:48],
		rg_st_amo_val[7:0],
		old_cword__h20949[39:0] };
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d427 =
	      { old_cword__h20949[63:56],
		rg_st_amo_val[7:0],
		old_cword__h20949[47:0] };
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d427 =
	      { rg_st_amo_val[7:0], old_cword__h20949[55:0] };
    endcase
  end
  always@(rg_addr or old_cword__h20949 or rg_st_amo_val)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_cword0949_BIT_ETC__q30 =
	      { old_cword__h20949[63:32], rg_st_amo_val[31:0] };
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_cword0949_BIT_ETC__q30 =
	      { rg_st_amo_val[31:0], old_cword__h20949[31:0] };
      default: CASE_rg_addr_BITS_2_TO_0_0x0_old_cword0949_BIT_ETC__q30 =
		   old_cword__h20949;
    endcase
  end
  always@(rg_f3 or
	  old_cword__h20949 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d427 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d436 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_cword0949_BIT_ETC__q30 or
	  rg_st_amo_val)
  begin
    case (rg_f3)
      3'b0:
	  n__h20960 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d427;
      3'b001:
	  n__h20960 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d436;
      3'b010:
	  n__h20960 = CASE_rg_addr_BITS_2_TO_0_0x0_old_cword0949_BIT_ETC__q30;
      3'b011: n__h20960 = rg_st_amo_val;
      default: n__h20960 = old_cword__h20949;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d286 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d316 or
	  IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC__q31 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_ram_ETC___d339 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d303 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d325 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d337)
  begin
    case (rg_f3)
      3'b0:
	  IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_IF_rg_f3_53_E_ETC___d385 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d286;
      3'b001:
	  IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_IF_rg_f3_53_E_ETC___d385 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d316;
      3'b010:
	  IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_IF_rg_f3_53_E_ETC___d385 =
	      { {32{IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC__q31[31]}},
		IF_rg_f3_53_EQ_0b0_54_THEN_IF_rg_addr_9_BITS_2_ETC__q31 };
      3'b011:
	  IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_IF_rg_f3_53_E_ETC___d385 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_ram_ETC___d339;
      3'b100:
	  IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_IF_rg_f3_53_E_ETC___d385 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d303;
      3'b101:
	  IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_IF_rg_f3_53_E_ETC___d385 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d325;
      3'b110:
	  IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_IF_rg_f3_53_E_ETC___d385 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d337;
      3'd7: IF_rg_f3_53_EQ_0b10_26_THEN_SEXT_IF_rg_f3_53_E_ETC___d385 = 64'd0;
    endcase
  end
  always@(rg_amo_funct7 or
	  new_st_val__h25137 or
	  new_st_val__h24129 or
	  w2__h32980 or
	  new_st_val__h25109 or
	  new_st_val__h25117 or
	  new_st_val__h25113 or
	  new_st_val__h25132 or new_st_val__h25121 or new_st_val__h25126)
  begin
    case (rg_amo_funct7[6:2])
      5'b0: _theResult_____2__h24034 = new_st_val__h24129;
      5'b00001: _theResult_____2__h24034 = w2__h32980;
      5'b00100: _theResult_____2__h24034 = new_st_val__h25109;
      5'b01000: _theResult_____2__h24034 = new_st_val__h25117;
      5'b01100: _theResult_____2__h24034 = new_st_val__h25113;
      5'b10000: _theResult_____2__h24034 = new_st_val__h25132;
      5'b11000: _theResult_____2__h24034 = new_st_val__h25121;
      5'b11100: _theResult_____2__h24034 = new_st_val__h25126;
      default: _theResult_____2__h24034 = new_st_val__h25137;
    endcase
  end
  always@(rg_addr or old_cword__h20949 or new_st_val__h23732)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d513 =
	      { old_cword__h20949[63:16], new_st_val__h23732[15:0] };
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d513 =
	      { old_cword__h20949[63:32],
		new_st_val__h23732[15:0],
		old_cword__h20949[15:0] };
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d513 =
	      { old_cword__h20949[63:48],
		new_st_val__h23732[15:0],
		old_cword__h20949[31:0] };
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d513 =
	      { new_st_val__h23732[15:0], old_cword__h20949[47:0] };
      default: IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d513 =
		   old_cword__h20949;
    endcase
  end
  always@(rg_addr or old_cword__h20949 or new_st_val__h23732)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d504 =
	      { old_cword__h20949[63:8], new_st_val__h23732[7:0] };
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d504 =
	      { old_cword__h20949[63:16],
		new_st_val__h23732[7:0],
		old_cword__h20949[7:0] };
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d504 =
	      { old_cword__h20949[63:24],
		new_st_val__h23732[7:0],
		old_cword__h20949[15:0] };
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d504 =
	      { old_cword__h20949[63:32],
		new_st_val__h23732[7:0],
		old_cword__h20949[23:0] };
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d504 =
	      { old_cword__h20949[63:40],
		new_st_val__h23732[7:0],
		old_cword__h20949[31:0] };
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d504 =
	      { old_cword__h20949[63:48],
		new_st_val__h23732[7:0],
		old_cword__h20949[39:0] };
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d504 =
	      { old_cword__h20949[63:56],
		new_st_val__h23732[7:0],
		old_cword__h20949[47:0] };
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d504 =
	      { new_st_val__h23732[7:0], old_cword__h20949[55:0] };
    endcase
  end
  always@(rg_addr or old_cword__h20949 or new_st_val__h23732)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_cword0949_BIT_ETC__q33 =
	      { old_cword__h20949[63:32], new_st_val__h23732[31:0] };
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_cword0949_BIT_ETC__q33 =
	      { new_st_val__h23732[31:0], old_cword__h20949[31:0] };
      default: CASE_rg_addr_BITS_2_TO_0_0x0_old_cword0949_BIT_ETC__q33 =
		   old_cword__h20949;
    endcase
  end
  always@(rg_f3 or
	  old_cword__h20949 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d504 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d513 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_cword0949_BIT_ETC__q33 or
	  new_st_val__h23732)
  begin
    case (rg_f3)
      3'b0:
	  n__h23896 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d504;
      3'b001:
	  n__h23896 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEL_ETC___d513;
      3'b010:
	  n__h23896 = CASE_rg_addr_BITS_2_TO_0_0x0_old_cword0949_BIT_ETC__q33;
      3'b011: n__h23896 = new_st_val__h23732;
      default: n__h23896 = old_cword__h20949;
    endcase
  end
  always@(rg_addr or
	  result__h31382 or
	  result__h31409 or result__h31436 or result__h31463)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d734 =
	      result__h31382;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d734 =
	      result__h31409;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d734 =
	      result__h31436;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d734 =
	      result__h31463;
      default: IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d734 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h31028 or
	  result__h31055 or
	  result__h31082 or
	  result__h31109 or
	  result__h31136 or
	  result__h31163 or result__h31190 or result__h31217)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d714 =
	      result__h31028;
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d714 =
	      result__h31055;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d714 =
	      result__h31082;
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d714 =
	      result__h31109;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d714 =
	      result__h31136;
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d714 =
	      result__h31163;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d714 =
	      result__h31190;
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d714 =
	      result__h31217;
    endcase
  end
  always@(rg_addr or
	  result__h31261 or
	  result__h31288 or result__h31315 or result__h31342)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d726 =
	      result__h31261;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d726 =
	      result__h31288;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d726 =
	      result__h31315;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d726 =
	      result__h31342;
      default: IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d726 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h30792 or
	  result__h30822 or
	  result__h30849 or
	  result__h30876 or
	  result__h30903 or
	  result__h30930 or result__h30957 or result__h30984)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d698 =
	      result__h30792;
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d698 =
	      result__h30822;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d698 =
	      result__h30849;
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d698 =
	      result__h30876;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d698 =
	      result__h30903;
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d698 =
	      result__h30930;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d698 =
	      result__h30957;
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d698 =
	      result__h30984;
    endcase
  end
  always@(rg_addr or result__h31503 or result__h31530)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1503_0x4_re_ETC__q34 =
	      result__h31503;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1503_0x4_re_ETC__q34 =
	      result__h31530;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result1503_0x4_re_ETC__q34 =
		   64'd0;
    endcase
  end
  always@(rg_addr or result__h31568 or result__h31595)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1568_0x4_re_ETC__q35 =
	      result__h31568;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1568_0x4_re_ETC__q35 =
	      result__h31595;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result1568_0x4_re_ETC__q35 =
		   64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d698 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d726 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1503_0x4_re_ETC__q34 or
	  rg_addr or
	  master_xactor_f_rd_data$D_OUT or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d714 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d734 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1568_0x4_re_ETC__q35)
  begin
    case (rg_f3)
      3'b0:
	  ld_val__h30732 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d698;
      3'b001:
	  ld_val__h30732 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d726;
      3'b010:
	  ld_val__h30732 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result1503_0x4_re_ETC__q34;
      3'b011:
	  ld_val__h30732 =
	      (rg_addr[2:0] == 3'h0) ?
		master_xactor_f_rd_data$D_OUT[66:3] :
		64'd0;
      3'b100:
	  ld_val__h30732 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d714;
      3'b101:
	  ld_val__h30732 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d734;
      3'b110:
	  ld_val__h30732 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result1568_0x4_re_ETC__q35;
      3'd7: ld_val__h30732 = 64'd0;
    endcase
  end
  always@(rg_addr or result__h34848 or result__h34876)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d853 =
	      result__h34848;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d853 =
	      result__h34876;
      default: IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d853 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h34656 or
	  result__h34684 or result__h34712 or result__h34740)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d843 =
	      result__h34656;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d843 =
	      result__h34684;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d843 =
	      result__h34712;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d843 =
	      result__h34740;
      default: IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d843 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h34290 or
	  result__h34318 or
	  result__h34346 or
	  result__h34374 or
	  result__h34402 or
	  result__h34430 or result__h34458 or result__h34486)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d823 =
	      result__h34290;
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d823 =
	      result__h34318;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d823 =
	      result__h34346;
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d823 =
	      result__h34374;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d823 =
	      result__h34402;
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d823 =
	      result__h34430;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d823 =
	      result__h34458;
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d823 =
	      result__h34486;
    endcase
  end
  always@(rg_addr or
	  result__h34531 or
	  result__h34559 or result__h34587 or result__h34615)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d835 =
	      result__h34531;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d835 =
	      result__h34559;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d835 =
	      result__h34587;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d835 =
	      result__h34615;
      default: IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d835 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h33169 or
	  result__h34077 or
	  result__h34105 or
	  result__h34133 or
	  result__h34161 or
	  result__h34189 or result__h34217 or result__h34245)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d807 =
	      result__h33169;
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d807 =
	      result__h34077;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d807 =
	      result__h34105;
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d807 =
	      result__h34133;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d807 =
	      result__h34161;
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d807 =
	      result__h34189;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d807 =
	      result__h34217;
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d807 =
	      result__h34245;
    endcase
  end
  always@(rg_addr or result__h34781 or result__h34809)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result4781_0x4_re_ETC__q50 =
	      result__h34781;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result4781_0x4_re_ETC__q50 =
	      result__h34809;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result4781_0x4_re_ETC__q50 =
		   64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d807 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d835 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result4781_0x4_re_ETC__q50 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_IF__ETC___d854 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d823 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d843 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d853)
  begin
    case (rg_f3)
      3'b0:
	  w1__h32974 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d807;
      3'b001:
	  w1__h32974 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d835;
      3'b010:
	  w1__h32974 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result4781_0x4_re_ETC__q50;
      3'b011:
	  w1__h32974 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_IF__ETC___d854;
      3'b100:
	  w1__h32974 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d823;
      3'b101:
	  w1__h32974 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d843;
      3'b110:
	  w1__h32974 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d853;
      3'd7: w1__h32974 = 64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d807 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d835 or
	  w1___1__h33049 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_IF__ETC___d854 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d823 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d843 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d853)
  begin
    case (rg_f3)
      3'b0:
	  w1__h32978 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d807;
      3'b001:
	  w1__h32978 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d835;
      3'b010: w1__h32978 = w1___1__h33049;
      3'b011:
	  w1__h32978 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_IF__ETC___d854;
      3'b100:
	  w1__h32978 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d823;
      3'b101:
	  w1__h32978 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d843;
      3'b110:
	  w1__h32978 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d853;
      3'd7: w1__h32978 = 64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d807 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d835 or
	  w12974_BITS_31_TO_0__q51 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_IF__ETC___d854 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d823 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d843 or
	  IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d853)
  begin
    case (rg_f3)
      3'b0:
	  new_ld_val__h32940 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d807;
      3'b001:
	  new_ld_val__h32940 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_SEX_ETC___d835;
      3'b010:
	  new_ld_val__h32940 =
	      { {32{w12974_BITS_31_TO_0__q51[31]}},
		w12974_BITS_31_TO_0__q51 };
      3'b011:
	  new_ld_val__h32940 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_IF__ETC___d854;
      3'b100:
	  new_ld_val__h32940 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d823;
      3'b101:
	  new_ld_val__h32940 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d843;
      3'b110:
	  new_ld_val__h32940 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_0_C_ETC___d853;
      3'd7: new_ld_val__h32940 = 64'd0;
    endcase
  end
  always@(rg_amo_funct7 or
	  new_st_val__h34969 or
	  new_st_val__h33081 or
	  w2__h32980 or
	  new_st_val__h34941 or
	  new_st_val__h34949 or
	  new_st_val__h34945 or
	  new_st_val__h34964 or new_st_val__h34953 or new_st_val__h34958)
  begin
    case (rg_amo_funct7[6:2])
      5'b0: _theResult_____2__h32986 = new_st_val__h33081;
      5'b00001: _theResult_____2__h32986 = w2__h32980;
      5'b00100: _theResult_____2__h32986 = new_st_val__h34941;
      5'b01000: _theResult_____2__h32986 = new_st_val__h34949;
      5'b01100: _theResult_____2__h32986 = new_st_val__h34945;
      5'b10000: _theResult_____2__h32986 = new_st_val__h34964;
      5'b11000: _theResult_____2__h32986 = new_st_val__h34953;
      5'b11100: _theResult_____2__h32986 = new_st_val__h34958;
      default: _theResult_____2__h32986 = new_st_val__h34969;
    endcase
  end
  always@(rg_f3 or IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_1_E_ETC___d354)
  begin
    case (rg_f3)
      3'b0, 3'b001, 3'b010, 3'b011, 3'b100, 3'b101, 3'b110:
	  CASE_rg_f3_0b0_IF_rg_addr_9_BITS_2_TO_0_30_EQ__ETC__q52 =
	      IF_rg_addr_9_BITS_2_TO_0_30_EQ_0x0_55_THEN_1_E_ETC___d354;
      3'd7: CASE_rg_f3_0b0_IF_rg_addr_9_BITS_2_TO_0_30_EQ__ETC__q52 = 64'd0;
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
	rg_lrsc_valid <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_state <= `BSV_ASSIGNMENT_DELAY 5'd0;
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
	if (rg_lrsc_valid$EN)
	  rg_lrsc_valid <= `BSV_ASSIGNMENT_DELAY rg_lrsc_valid$D_IN;
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
    if (rg_amo_funct7$EN)
      rg_amo_funct7 <= `BSV_ASSIGNMENT_DELAY rg_amo_funct7$D_IN;
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
    if (rg_lrsc_pa$EN) rg_lrsc_pa <= `BSV_ASSIGNMENT_DELAY rg_lrsc_pa$D_IN;
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
    rg_addr = 64'hAAAAAAAAAAAAAAAA;
    rg_amo_funct7 = 7'h2A;
    rg_cset_cword_in_cache = 9'h0AA;
    rg_cset_in_cache = 6'h2A;
    rg_ddr4_ready = 1'h0;
    rg_error_during_refill = 1'h0;
    rg_exc_code = 4'hA;
    rg_f3 = 3'h2;
    rg_ld_val = 64'hAAAAAAAAAAAAAAAA;
    rg_lower_word32 = 32'hAAAAAAAA;
    rg_lower_word32_full = 1'h0;
    rg_lrsc_pa = 64'hAAAAAAAAAAAAAAAA;
    rg_lrsc_valid = 1'h0;
    rg_op = 2'h2;
    rg_pa = 64'hAAAAAAAAAAAAAAAA;
    rg_pte_pa = 64'hAAAAAAAAAAAAAAAA;
    rg_st_amo_val = 64'hAAAAAAAAAAAAAAAA;
    rg_state = 5'h0A;
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
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", f_fabric_write_reqs$D_OUT[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", x__h2801);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("                       ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", mem_req_wr_data_wdata__h2980);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", mem_req_wr_data_wstrb__h2981);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  cfg_verbosity != 4'd0 &&
	  !f_reset_reqs$D_OUT)
	begin
	  v__h4255 = $stime;
	  #0;
	end
    v__h4249 = v__h4255 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  cfg_verbosity != 4'd0 &&
	  !f_reset_reqs$D_OUT)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_reset: %0d sets x %0d ways: all tag states reset to CTAG_EMPTY",
		   v__h4249,
		   "D_MMU_Cache",
		   $signed(32'd64),
		   $signed(32'd2));
	else
	  $display("%0d: %s.rl_reset: %0d sets x %0d ways: all tag states reset to CTAG_EMPTY",
		   v__h4249,
		   "I_MMU_Cache",
		   $signed(32'd64),
		   $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  f_reset_reqs$D_OUT)
	begin
	  v__h4354 = $stime;
	  #0;
	end
    v__h4348 = v__h4354 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  f_reset_reqs$D_OUT)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_reset: Flushed", v__h4348, "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_reset: Flushed", v__h4348, "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h4504 = $stime;
	  #0;
	end
    v__h4498 = v__h4504 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_probe_and_immed_rsp; eaddr %0h",
		   v__h4498,
		   "D_MMU_Cache",
		   rg_addr);
	else
	  $display("%0d: %s: rl_probe_and_immed_rsp; eaddr %0h",
		   v__h4498,
		   "I_MMU_Cache",
		   rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$display("        eaddr = {CTag 0x%0h  CSet 0x%0h  Word64 0x%0h  Byte 0x%0h}",
		 rg_addr[63:12],
		 rg_addr[11:6],
		 rg_addr[5:3],
		 rg_addr[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("        CSet 0x%0x: (state, tag):", rg_addr[11:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(" (");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  ram_state_and_ctag_cset$DOB[52])
	$write("CTAG_CLEAN");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  !ram_state_and_ctag_cset$DOB[52])
	$write("CTAG_EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  ram_state_and_ctag_cset$DOB[52])
	$write(", 0x%0x", ram_state_and_ctag_cset$DOB[51:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  !ram_state_and_ctag_cset$DOB[52])
	$write(", --");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(")");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(" (");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  ram_state_and_ctag_cset$DOB[105])
	$write("CTAG_CLEAN");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  !ram_state_and_ctag_cset$DOB[105])
	$write("CTAG_EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  ram_state_and_ctag_cset$DOB[105])
	$write(", 0x%0x", ram_state_and_ctag_cset$DOB[104:53]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  !ram_state_and_ctag_cset$DOB[105])
	$write(", --");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(")");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("        CSet 0x%0x, CWord 0x%0x: ",
	       rg_addr[11:6],
	       rg_addr[5:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(" 0x%0x", ram_cword_set$DOB[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(" 0x%0x", ram_cword_set$DOB[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("    TLB result: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("VM_Xlate_Result { ", "outcome: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("VM_XLATE_OK");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "pa: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'hA, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp && dmem_not_imem &&
	  !soc_map$m_is_mem_addr &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$display("    => IO_REQ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d161)
	$display("        ASSERTION ERROR: fn_test_cache_hit_or_miss: multiple hits in set at [%0d] and [%0d]",
		 $signed(32'd1),
		 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d360)
	begin
	  v__h19794 = $stime;
	  #0;
	end
    v__h19788 = v__h19794 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d360)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h19788,
		   "D_MMU_Cache",
		   rg_addr,
		   word64__h6008,
		   64'd0);
	else
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h19788,
		   "I_MMU_Cache",
		   rg_addr,
		   word64__h6008,
		   64'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d368)
	$display("        AMO LR: reserving PA 0x%0h", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d360)
	$display("        Read-hit: addr 0x%0h word64 0x%0h",
		 rg_addr,
		 word64__h6008);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d371)
	$display("        Read Miss: -> CACHE_START_REFILL.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d377)
	$display("        AMO LR: cache refill: cancelling LR/SC reservation for PA 0x%0h",
		 rg_lrsc_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d534)
	$display("        ST: cancelling LR/SC reservation for PA", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op == 2'd2 &&
	  rg_amo_funct7[6:2] == 5'b00011 &&
	  rg_lrsc_valid &&
	  !rg_lrsc_pa_7_EQ_rg_addr_9___d98 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$display("        AMO SC: fail: reserved addr 0x%0h, this address 0x%0h",
		 rg_lrsc_pa,
		 rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op == 2'd2 &&
	  rg_amo_funct7[6:2] == 5'b00011 &&
	  !rg_lrsc_valid &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$display("        AMO SC: fail due to invalid LR/SC reservation");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_56_OR_soc_map_m_is_mem_addr__ETC___d546)
	$display("        AMO SC result = %0d", lrsc_result__h20171);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d549)
	$display("        Write-Cache-Hit: pa 0x%0h word64 0x%0h",
		 rg_addr,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d549)
	$write("        New Word64_Set:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d549)
	$write("        CSet 0x%0x, CWord 0x%0x: ",
	       rg_addr[11:6],
	       rg_addr[5:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d549)
	$write(" 0x%0x",
	       IF_NOT_ram_state_and_ctag_cset_b_read__04_BIT__ETC___d447);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d549)
	$write(" 0x%0x",
	       IF_ram_state_and_ctag_cset_b_read__04_BIT_105__ETC___d446);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d549)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op != 2'd0 &&
	  (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	  (rg_op == 2'd1 ||
	   rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	  NOT_rg_op_3_EQ_2_5_40_OR_NOT_rg_amo_funct7_6_B_ETC___d551)
	$display("        Write-Cache-Miss: pa 0x%0h word64 0x%0h",
		 rg_addr,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d557)
	$display("        Write-Cache-Hit/Miss: eaddr 0x%0h word64 0x%0h",
		 rg_addr,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d557)
	$display("        => rl_write_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op_3_EQ_2_5_AND_rg_amo_funct7_6_BITS_6_TO_2_ETC___d561)
	begin
	  v__h23510 = $stime;
	  #0;
	end
    v__h23504 = v__h23510 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op_3_EQ_2_5_AND_rg_amo_funct7_6_BITS_6_TO_2_ETC___d561)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h23504,
		   "D_MMU_Cache",
		   rg_addr,
		   64'd1,
		   64'd0);
	else
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h23504,
		   "I_MMU_Cache",
		   rg_addr,
		   64'd1,
		   64'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op_3_EQ_2_5_AND_rg_amo_funct7_6_BITS_6_TO_2_ETC___d561)
	$display("        AMO SC: Fail response for addr 0x%0h", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op != 2'd0 &&
	  (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	  rg_op != 2'd1 &&
	  (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	  NOT_ram_state_and_ctag_cset_b_read__04_BIT_52__ETC___d369)
	$display("        AMO Miss: -> CACHE_START_REFILL.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d569)
	$display("        AMO: addr 0x%0h amo_f7 0x%0h f3 %0d rs2_val 0x%0h",
		 rg_addr,
		 rg_amo_funct7,
		 rg_f3,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d569)
	$display("          PA 0x%0h ", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d569)
	$display("          Cache word64 0x%0h, load-result 0x%0h",
		 word64__h6008,
		 word64__h6008);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d569)
	$display("          0x%0h  op  0x%0h -> 0x%0h",
		 word64__h6008,
		 word64__h6008,
		 new_st_val__h23732);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d569)
	$write("          New Word64_Set:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d569)
	$write("        CSet 0x%0x, CWord 0x%0x: ",
	       rg_addr[11:6],
	       rg_addr[5:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d569)
	$write(" 0x%0x",
	       IF_NOT_ram_state_and_ctag_cset_b_read__04_BIT__ETC___d524);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d569)
	$write(" 0x%0x",
	       IF_ram_state_and_ctag_cset_b_read__04_BIT_105__ETC___d523);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_3_EQ_0_4_39_AND_NOT_rg_op_3_EQ_2_5_4_ETC___d569)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op != 2'd0 &&
	  (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	  rg_op != 2'd1 &&
	  (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	  ram_state_and_ctag_cset_b_read__04_BIT_52_05_A_ETC___d571)
	$display("        AMO_op: cancelling LR/SC reservation for PA",
		 rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_ddr4_ready)
	begin
	  v__h37786 = $stime;
	  #0;
	end
    v__h37780 = v__h37786 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_ddr4_ready)
	$display("%0d: %m.ma_ddr4_ready: Enabling MMU_Cache", v__h37780);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h26828 = $stime;
	  #0;
	end
    v__h26822 = v__h26828 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_start_cache_refill: ",
		   v__h26822,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_start_cache_refill: ",
		   v__h26822,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("    To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", cline_fabric_addr__h26881);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 8'd7);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 3'b011);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$display("    Victim way %0d; => CACHE_REFILL", tmp__h27044[0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	begin
	  v__h27567 = $stime;
	  #0;
	end
    v__h27561 = v__h27567 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_cache_refill_rsps_loop:",
		   v__h27561,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_cache_refill_rsps_loop:",
		   v__h27561,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[2:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598 &&
	  master_xactor_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598 &&
	  !master_xactor_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h27808 = $stime;
	  #0;
	end
    v__h27802 = v__h27808 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_cache_refill_rsps_loop: FABRIC_RSP_ERR: raising access exception %0d",
		   v__h27802,
		   "D_MMU_Cache",
		   access_exc_code__h2535);
	else
	  $display("%0d: %s.rl_cache_refill_rsps_loop: FABRIC_RSP_ERR: raising access exception %0d",
		   v__h27802,
		   "I_MMU_Cache",
		   access_exc_code__h2535);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  rg_cset_cword_in_cache[2:0] == 3'd7 &&
	  (master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	   rg_error_during_refill) &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$display("    => MODULE_EXCEPTION_RSP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  rg_cset_cword_in_cache[2:0] == 3'd7 &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !rg_error_during_refill &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$display("    => CACHE_REREQ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$display("        Updating Cache cword_set 0x%0h, cword_in_cline %0d) old => new",
		 rg_cset_cword_in_cache,
		 rg_cset_cword_in_cache[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write("        CSet 0x%0x, CWord 0x%0x: ",
	       rg_addr[11:6],
	       rg_cset_cword_in_cache[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write(" 0x%0x", ram_cword_set$DOB[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write(" 0x%0x", ram_cword_set$DOB[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write("        CSet 0x%0x, CWord 0x%0x: ",
	       rg_addr[11:6],
	       rg_cset_cword_in_cache[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write(" 0x%0x",
	       rg_victim_way ?
		 ram_cword_set$DOB[63:0] :
		 master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write(" 0x%0x",
	       rg_victim_way ?
		 master_xactor_f_rd_data$D_OUT[66:3] :
		 ram_cword_set$DOB[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_97___d598)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_rereq && NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$display("    fa_req_ram_B tagCSet [0x%0x] cword_set [0x%0d]",
		 rg_addr[11:6],
		 rg_addr[11:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_watch_tohost)
	begin
	  v__h37718 = $stime;
	  #0;
	end
    v__h37712 = v__h37718 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_watch_tohost)
	$display("%0d: %m.set_watch_tohost: watch %0d, addr %0h",
		 v__h37712,
		 set_watch_tohost_watch_tohost,
		 set_watch_tohost_tohost_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h30273 = $stime;
	  #0;
	end
    v__h30267 = v__h30273 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_read_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h30267,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_read_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h30267,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", value__h32526);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h30623 = $stime;
	  #0;
	end
    v__h30617 = v__h30623 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h30617,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h30617,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[2:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  master_xactor_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  !master_xactor_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h31725 = $stime;
	  #0;
	end
    v__h31719 = v__h31725 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h31719,
		   "D_MMU_Cache",
		   rg_addr,
		   ld_val__h30732);
	else
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h31719,
		   "I_MMU_Cache",
		   rg_addr,
		   ld_val__h30732);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h31832 = $stime;
	  #0;
	end
    v__h31826 = v__h31832 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_read_rsp: FABRIC_RSP_ERR: raising trap LOAD_ACCESS_FAULT",
		   v__h31826,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_io_read_rsp: FABRIC_RSP_ERR: raising trap LOAD_ACCESS_FAULT",
		   v__h31826,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_maintain_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h31937 = $stime;
	  #0;
	end
    v__h31931 = v__h31937 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_maintain_io_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h31931,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_ld_val);
	else
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h31931,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_ld_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h32017 = $stime;
	  #0;
	end
    v__h32011 = v__h32017 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_io_write_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h32011,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
	else
	  $display("%0d: %s: rl_io_write_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h32011,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_write_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$display("    => rl_ST_AMO_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h32227 = $stime;
	  #0;
	end
    v__h32221 = v__h32227 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_io_AMO_SC_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h32221,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
	else
	  $display("%0d: %s: rl_io_AMO_SC_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h32221,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$display("    FAIL due to I/O address.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$display("    => rl_ST_AMO_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h32345 = $stime;
	  #0;
	end
    v__h32339 = v__h32345 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_AMO_op_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h32339,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_AMO_op_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h32339,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", value__h32526);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h32639 = $stime;
	  #0;
	end
    v__h32633 = v__h32639 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_AMO_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h32633,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_AMO_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h32633,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[2:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  master_xactor_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  !master_xactor_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h32814 = $stime;
	  #0;
	end
    v__h32808 = v__h32814 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_io_AMO_read_rsp; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h32808,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
	else
	  $display("%0d: %s: rl_io_AMO_read_rsp; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h32808,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h35073 = $stime;
	  #0;
	end
    v__h35067 = v__h35073 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h35067,
		   "D_MMU_Cache",
		   rg_addr,
		   new_ld_val__h32940);
	else
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h35067,
		   "I_MMU_Cache",
		   rg_addr,
		   new_ld_val__h32940);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$display("    => rl_ST_AMO_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h32910 = $stime;
	  #0;
	end
    v__h32904 = v__h32910 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_AMO_read_rsp: FABRIC_RSP_ERR: raising trap STORE_AMO_ACCESS_FAULT",
		   v__h32904,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_io_AMO_read_rsp: FABRIC_RSP_ERR: raising trap STORE_AMO_ACCESS_FAULT",
		   v__h32904,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h35651 = $stime;
	  #0;
	end
    v__h35645 = v__h35651 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	if (dmem_not_imem)
	  $write("%0d: %s.rl_discard_write_rsp: pending %0d ",
		 v__h35645,
		 "D_MMU_Cache",
		 $unsigned(b__h26782));
	else
	  $write("%0d: %s.rl_discard_write_rsp: pending %0d ",
		 v__h35645,
		 "I_MMU_Cache",
		 $unsigned(b__h26782));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", master_xactor_f_wr_resp$D_OUT[5:2]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", master_xactor_f_wr_resp$D_OUT[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	begin
	  v__h35693 = $stime;
	  #0;
	end
    v__h35687 = v__h35693 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_discard_write_rsp: fabric response error: exit",
		   v__h35687,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_discard_write_rsp: fabric response error: exit",
		   v__h35687,
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
	  v__h3787 = $stime;
	  #0;
	end
    v__h3781 = v__h3787 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_reset)
	if (dmem_not_imem)
	  $display("%0d: %s: cache size %0d KB, associativity %0d, line size %0d bytes (= %0d XLEN words)",
		   v__h3781,
		   "D_MMU_Cache",
		   $signed(32'd8),
		   $signed(32'd2),
		   $signed(32'd64),
		   $signed(32'd8));
	else
	  $display("%0d: %s: cache size %0d KB, associativity %0d, line size %0d bytes (= %0d XLEN words)",
		   v__h3781,
		   "I_MMU_Cache",
		   $signed(32'd8),
		   $signed(32'd2),
		   $signed(32'd64),
		   $signed(32'd8));
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	begin
	  v__h36063 = $stime;
	  #0;
	end
    v__h36057 = v__h36063 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("%0d: %m.req: op:", v__h36057);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__1_ULE_1_2___d43 && req_op == 2'd0)
	$write("CACHE_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__1_ULE_1_2___d43 && req_op == 2'd1)
	$write("CACHE_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  req_op != 2'd0 &&
	  req_op != 2'd1)
	$write("CACHE_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(" f3:%0d addr:0x%0h st_value:0x%0h",
	       req_f3,
	       req_addr,
	       req_st_value,
	       "\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write("    priv:");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  req_priv == 2'b0)
	$write("U");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  req_priv == 2'b01)
	$write("S");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  req_priv == 2'b11)
	$write("M");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__1_ULE_1_2___d43 &&
	  req_priv != 2'b0 &&
	  req_priv != 2'b01 &&
	  req_priv != 2'b11)
	$write("RESERVED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$write(" sstatus_SUM:%0d mstatus_MXR:%0d satp:0x%0h",
	       req_sstatus_SUM,
	       req_mstatus_MXR,
	       req_satp,
	       "\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$display("    amo_funct7 = 0x%0h", req_amo_funct7);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req &&
	  req_f3_BITS_1_TO_0_39_EQ_0b0_40_OR_req_f3_BITS_ETC___d969 &&
	  NOT_cfg_verbosity_read__1_ULE_1_2___d43)
	$display("    fa_req_ram_B tagCSet [0x%0x] cword_set [0x%0d]",
		 req_addr[11:6],
		 req_addr[11:3]);
  end
  // synopsys translate_on
endmodule