module outputs
  reg [63 : 0] word64;
  wire [63 : 0] addr,
		mem_master_araddr,
		mem_master_awaddr,
		mem_master_wdata,
		st_amo_val;
  wire [7 : 0] mem_master_arlen, mem_master_awlen, mem_master_wstrb;
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
  wire RDY_server_flush_request_put,
       RDY_server_flush_response_get,
       RDY_server_reset_request_put,
       RDY_server_reset_response_get,
       RDY_set_verbosity,
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
  // register rg_cset_in_cache
  reg [5 : 0] rg_cset_in_cache;
  wire [5 : 0] rg_cset_in_cache$D_IN;
  wire rg_cset_in_cache$EN;
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
  // register rg_victim_way
  reg rg_victim_way;
  wire rg_victim_way$D_IN, rg_victim_way$EN;
  // register rg_word64_set_in_cache
  reg [8 : 0] rg_word64_set_in_cache;
  wire [8 : 0] rg_word64_set_in_cache$D_IN;
  wire rg_word64_set_in_cache$EN;
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
  // ports of submodule ram_state_and_ctag_cset
  wire [105 : 0] ram_state_and_ctag_cset$DIA,
		 ram_state_and_ctag_cset$DIB,
		 ram_state_and_ctag_cset$DOB;
  wire [5 : 0] ram_state_and_ctag_cset$ADDRA, ram_state_and_ctag_cset$ADDRB;
  wire ram_state_and_ctag_cset$ENA,
       ram_state_and_ctag_cset$ENB,
       ram_state_and_ctag_cset$WEA,
       ram_state_and_ctag_cset$WEB;
  // ports of submodule ram_word64_set
  reg [127 : 0] ram_word64_set$DIB;
  reg [8 : 0] ram_word64_set$ADDRB;
  wire [127 : 0] ram_word64_set$DIA, ram_word64_set$DOB;
  wire [8 : 0] ram_word64_set$ADDRA;
  wire ram_word64_set$ENA,
       ram_word64_set$ENB,
       ram_word64_set$WEA,
       ram_word64_set$WEB;
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
       WILL_FIRE_tlb_flush;
  // inputs to muxes for submodule ports
  wire [130 : 0] MUX_f_fabric_write_reqs$enq_1__VAL_1,
		 MUX_f_fabric_write_reqs$enq_1__VAL_2,
		 MUX_f_fabric_write_reqs$enq_1__VAL_3;
  wire [127 : 0] MUX_ram_word64_set$a_put_3__VAL_1,
		 MUX_ram_word64_set$a_put_3__VAL_2;
  wire [105 : 0] MUX_ram_state_and_ctag_cset$a_put_3__VAL_1;
  wire [96 : 0] MUX_master_xactor_f_rd_addr$enq_1__VAL_1,
		MUX_master_xactor_f_rd_addr$enq_1__VAL_2;
  wire [63 : 0] MUX_dw_output_ld_val$wset_1__VAL_3,
		MUX_rg_ld_val$write_1__VAL_2;
  wire [8 : 0] MUX_ram_word64_set$b_put_2__VAL_2,
	       MUX_ram_word64_set$b_put_2__VAL_4;
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
       MUX_ram_state_and_ctag_cset$a_put_1__SEL_1,
       MUX_ram_state_and_ctag_cset$b_put_3__SEL_1,
       MUX_ram_word64_set$a_put_1__SEL_1,
       MUX_ram_word64_set$b_put_1__SEL_2,
       MUX_rg_error_during_refill$write_1__SEL_1,
       MUX_rg_exc_code$write_1__SEL_1,
       MUX_rg_exc_code$write_1__SEL_2,
       MUX_rg_exc_code$write_1__SEL_3,
       MUX_rg_ld_val$write_1__SEL_2,
       MUX_rg_lrsc_valid$write_1__SEL_2,
       MUX_rg_state$write_1__SEL_10,
       MUX_rg_state$write_1__SEL_12,
       MUX_rg_state$write_1__SEL_13,
       MUX_rg_state$write_1__SEL_2,
       MUX_rg_state$write_1__SEL_3;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h3069;
  reg [31 : 0] v__h4085;
  reg [31 : 0] v__h4184;
  reg [31 : 0] v__h4333;
  reg [31 : 0] v__h19627;
  reg [31 : 0] v__h23343;
  reg [31 : 0] v__h26661;
  reg [31 : 0] v__h27400;
  reg [31 : 0] v__h27641;
  reg [31 : 0] v__h30037;
  reg [31 : 0] v__h30387;
  reg [31 : 0] v__h31489;
  reg [31 : 0] v__h31596;
  reg [31 : 0] v__h31701;
  reg [31 : 0] v__h31781;
  reg [31 : 0] v__h31991;
  reg [31 : 0] v__h32109;
  reg [31 : 0] v__h32403;
  reg [31 : 0] v__h32578;
  reg [31 : 0] v__h34837;
  reg [31 : 0] v__h32674;
  reg [31 : 0] v__h35444;
  reg [31 : 0] v__h35405;
  reg [31 : 0] v__h3617;
  reg [31 : 0] v__h35793;
  reg [31 : 0] v__h3063;
  reg [31 : 0] v__h3611;
  reg [31 : 0] v__h4079;
  reg [31 : 0] v__h4178;
  reg [31 : 0] v__h4327;
  reg [31 : 0] v__h19621;
  reg [31 : 0] v__h23337;
  reg [31 : 0] v__h26655;
  reg [31 : 0] v__h27394;
  reg [31 : 0] v__h27635;
  reg [31 : 0] v__h30031;
  reg [31 : 0] v__h30381;
  reg [31 : 0] v__h31483;
  reg [31 : 0] v__h31590;
  reg [31 : 0] v__h31695;
  reg [31 : 0] v__h31775;
  reg [31 : 0] v__h31985;
  reg [31 : 0] v__h32103;
  reg [31 : 0] v__h32397;
  reg [31 : 0] v__h32572;
  reg [31 : 0] v__h32668;
  reg [31 : 0] v__h34831;
  reg [31 : 0] v__h35399;
  reg [31 : 0] v__h35438;
  reg [31 : 0] v__h35787;
  // synopsys translate_on
  // remaining internal signals
  reg [63 : 0] CASE_rg_addr_BITS_2_TO_0_0x0_old_word640782_BI_ETC__q30,
	       CASE_rg_addr_BITS_2_TO_0_0x0_old_word640782_BI_ETC__q33,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result1267_0x4_re_ETC__q34,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result1332_0x4_re_ETC__q35,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result4545_0x4_re_ETC__q50,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result9447_0x4_re_ETC__q29,
	       CASE_rg_f3_0b0_IF_rg_addr_7_BITS_2_TO_0_27_EQ__ETC__q52,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d300,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d322,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d334,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d704,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d724,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d813,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d833,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d843,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d424,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d433,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d501,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d510,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d283,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d313,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d688,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d716,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d797,
	       IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d825,
	       IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC___d343,
	       IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_IF_rg_f3_50_E_ETC___d382,
	       _theResult_____2__h23867,
	       _theResult_____2__h32750,
	       ld_val__h30496,
	       mem_req_wr_data_wdata__h2820,
	       n__h20793,
	       n__h23729,
	       new_ld_val__h32704,
	       old_word64__h20782,
	       w1__h23859,
	       w1__h32738,
	       w1__h32742;
  reg [7 : 0] mem_req_wr_data_wstrb__h2821;
  reg [2 : 0] value__h32290, x__h2641;
  wire [63 : 0] IF_NOT_ram_state_and_ctag_cset_b_read__02_BIT__ETC___d444,
		IF_NOT_ram_state_and_ctag_cset_b_read__02_BIT__ETC___d521,
		IF_ram_state_and_ctag_cset_b_read__02_BIT_105__ETC___d443,
		IF_ram_state_and_ctag_cset_b_read__02_BIT_105__ETC___d520,
		IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_1_E_ETC___d351,
		IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_IF__ETC___d844,
		IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_ram_ETC___d336,
		IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_rg_st_amo_val_ETC___d451,
		IF_rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_ETC___d528,
		_theResult___snd_fst__h2828,
		cline_fabric_addr__h26714,
		new_st_val__h23565,
		new_st_val__h23871,
		new_st_val__h23962,
		new_st_val__h24942,
		new_st_val__h24946,
		new_st_val__h24950,
		new_st_val__h24954,
		new_st_val__h24959,
		new_st_val__h24965,
		new_st_val__h24970,
		new_st_val__h32754,
		new_st_val__h32845,
		new_st_val__h34705,
		new_st_val__h34709,
		new_st_val__h34713,
		new_st_val__h34717,
		new_st_val__h34722,
		new_st_val__h34728,
		new_st_val__h34733,
		new_value__h22433,
		new_value__h6006,
		result__h18715,
		result__h18743,
		result__h18771,
		result__h18799,
		result__h18827,
		result__h18855,
		result__h18883,
		result__h18911,
		result__h18956,
		result__h18984,
		result__h19012,
		result__h19040,
		result__h19068,
		result__h19096,
		result__h19124,
		result__h19152,
		result__h19197,
		result__h19225,
		result__h19253,
		result__h19281,
		result__h19322,
		result__h19350,
		result__h19378,
		result__h19406,
		result__h19447,
		result__h19475,
		result__h19514,
		result__h19542,
		result__h30556,
		result__h30586,
		result__h30613,
		result__h30640,
		result__h30667,
		result__h30694,
		result__h30721,
		result__h30748,
		result__h30792,
		result__h30819,
		result__h30846,
		result__h30873,
		result__h30900,
		result__h30927,
		result__h30954,
		result__h30981,
		result__h31025,
		result__h31052,
		result__h31079,
		result__h31106,
		result__h31146,
		result__h31173,
		result__h31200,
		result__h31227,
		result__h31267,
		result__h31294,
		result__h31332,
		result__h31359,
		result__h32933,
		result__h33841,
		result__h33869,
		result__h33897,
		result__h33925,
		result__h33953,
		result__h33981,
		result__h34009,
		result__h34054,
		result__h34082,
		result__h34110,
		result__h34138,
		result__h34166,
		result__h34194,
		result__h34222,
		result__h34250,
		result__h34295,
		result__h34323,
		result__h34351,
		result__h34379,
		result__h34420,
		result__h34448,
		result__h34476,
		result__h34504,
		result__h34545,
		result__h34573,
		result__h34612,
		result__h34640,
		w1___1__h23930,
		w1___1__h32813,
		w2___1__h32814,
		w2__h32744,
		word64__h5839,
		x__h20014,
		x__h32733,
		x__h6029,
		y__h12359,
		y__h6030,
		y__h6044;
  wire [31 : 0] IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC__q31,
		ld_val0496_BITS_31_TO_0__q38,
		ld_val0496_BITS_63_TO_32__q45,
		master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3,
		master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10,
		rg_st_amo_val_BITS_31_TO_0__q32,
		w12738_BITS_31_TO_0__q51,
		word64839_BITS_31_TO_0__q17,
		word64839_BITS_63_TO_32__q24;
  wire [15 : 0] ld_val0496_BITS_15_TO_0__q37,
		ld_val0496_BITS_31_TO_16__q41,
		ld_val0496_BITS_47_TO_32__q44,
		ld_val0496_BITS_63_TO_48__q48,
		master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2,
		master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q7,
		master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q6,
		master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13,
		word64839_BITS_15_TO_0__q16,
		word64839_BITS_31_TO_16__q20,
		word64839_BITS_47_TO_32__q23,
		word64839_BITS_63_TO_48__q27;
  wire [7 : 0] ld_val0496_BITS_15_TO_8__q39,
	       ld_val0496_BITS_23_TO_16__q40,
	       ld_val0496_BITS_31_TO_24__q42,
	       ld_val0496_BITS_39_TO_32__q43,
	       ld_val0496_BITS_47_TO_40__q46,
	       ld_val0496_BITS_55_TO_48__q47,
	       ld_val0496_BITS_63_TO_56__q49,
	       ld_val0496_BITS_7_TO_0__q36,
	       master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1,
	       master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4,
	       master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q5,
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q8,
	       master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q9,
	       master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11,
	       master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12,
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14,
	       strobe64__h2758,
	       strobe64__h2760,
	       strobe64__h2762,
	       word64839_BITS_15_TO_8__q18,
	       word64839_BITS_23_TO_16__q19,
	       word64839_BITS_31_TO_24__q21,
	       word64839_BITS_39_TO_32__q22,
	       word64839_BITS_47_TO_40__q25,
	       word64839_BITS_55_TO_48__q26,
	       word64839_BITS_63_TO_56__q28,
	       word64839_BITS_7_TO_0__q15;
  wire [5 : 0] shift_bits__h2608;
  wire [4 : 0] IF_NOT_ram_state_and_ctag_cset_b_read__02_BIT__ETC___d148,
	       IF_rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_ETC___d150,
	       IF_rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_ETC___d149;
  wire [3 : 0] access_exc_code__h2376, b__h26615;
  wire [1 : 0] tmp__h26876, tmp__h26877;
  wire IF_rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_ETC___d118,
       NOT_cfg_verbosity_read__9_ULE_1_0___d41,
       NOT_cfg_verbosity_read__9_ULE_2_94___d595,
       NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d158,
       NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d357,
       NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d365,
       NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d368,
       NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d374,
       NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d378,
       NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d389,
       NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d531,
       NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d543,
       NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d573,
       NOT_ram_state_and_ctag_cset_b_read__02_BIT_52__ETC___d117,
       NOT_ram_state_and_ctag_cset_b_read__02_BIT_52__ETC___d164,
       NOT_ram_state_and_ctag_cset_b_read__02_BIT_52__ETC___d366,
       NOT_ram_state_and_ctag_cset_b_read__02_BIT_52__ETC___d371,
       NOT_req_f3_BITS_1_TO_0_29_EQ_0b0_30_31_AND_NOT_ETC___d950,
       NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d145,
       NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d526,
       NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d546,
       NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d554,
       NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d566,
       NOT_rg_op_1_EQ_1_9_70_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d386,
       NOT_rg_op_1_EQ_1_9_70_AND_ram_state_and_ctag_c_ETC___d375,
       NOT_rg_op_1_EQ_2_3_37_OR_NOT_rg_amo_funct7_4_B_ETC___d384,
       NOT_rg_op_1_EQ_2_3_37_OR_NOT_rg_amo_funct7_4_B_ETC___d544,
       NOT_rg_op_1_EQ_2_3_37_OR_NOT_rg_amo_funct7_4_B_ETC___d548,
       NOT_rg_op_1_EQ_2_3_37_OR_NOT_rg_amo_funct7_4_B_ETC___d552,
       dmem_not_imem_AND_NOT_soc_map_m_is_mem_addr_rg_ETC___d120,
       lrsc_result__h20004,
       ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113,
       ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107,
       ram_state_and_ctag_cset_b_read__02_BIT_52_03_A_ETC___d161,
       ram_state_and_ctag_cset_b_read__02_BIT_52_03_A_ETC___d172,
       ram_state_and_ctag_cset_b_read__02_BIT_52_03_A_ETC___d355,
       ram_state_and_ctag_cset_b_read__02_BIT_52_03_A_ETC___d568,
       req_f3_BITS_1_TO_0_29_EQ_0b0_30_OR_req_f3_BITS_ETC___d959,
       rg_addr_7_EQ_rg_lrsc_pa_5___d162,
       rg_amo_funct7_4_BITS_6_TO_2_5_EQ_0b10_6_AND_ra_ETC___d360,
       rg_lrsc_pa_5_EQ_rg_addr_7___d96,
       rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d135,
       rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d166,
       rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d176,
       rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d178,
       rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d181,
       rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d174,
       rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d387,
       rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d524,
       rg_op_1_EQ_2_3_AND_rg_amo_funct7_4_BITS_6_TO_2_ETC___d558,
       rg_state_4_EQ_13_44_AND_rg_op_1_EQ_0_2_OR_rg_o_ETC___d646;
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
  // value method word64
  always@(MUX_dw_output_ld_val$wset_1__SEL_1 or
	  ld_val__h30496 or
	  MUX_dw_output_ld_val$wset_1__SEL_2 or
	  new_ld_val__h32704 or
	  MUX_dw_output_ld_val$wset_1__SEL_3 or
	  MUX_dw_output_ld_val$wset_1__VAL_3 or
	  MUX_dw_output_ld_val$wset_1__SEL_4 or rg_ld_val)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_dw_output_ld_val$wset_1__SEL_1: word64 = ld_val__h30496;
      MUX_dw_output_ld_val$wset_1__SEL_2: word64 = new_ld_val__h32704;
      MUX_dw_output_ld_val$wset_1__SEL_3:
	  word64 = MUX_dw_output_ld_val$wset_1__VAL_3;
      MUX_dw_output_ld_val$wset_1__SEL_4: word64 = rg_ld_val;
      default: word64 = 64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
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
  // submodule ram_word64_set
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd9),
	  .DATA_WIDTH(32'd128),
	  .MEMSIZE(10'd512)) ram_word64_set(.CLKA(CLK),
					    .CLKB(CLK),
					    .ADDRA(ram_word64_set$ADDRA),
					    .ADDRB(ram_word64_set$ADDRB),
					    .DIA(ram_word64_set$DIA),
					    .DIB(ram_word64_set$DIB),
					    .WEA(ram_word64_set$WEA),
					    .WEB(ram_word64_set$WEB),
					    .ENA(ram_word64_set$ENA),
					    .ENB(ram_word64_set$ENB),
					    .DOA(),
					    .DOB(ram_word64_set$DOB));
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
	     f_fabric_write_reqs$EMPTY_N && master_xactor_f_wr_addr$FULL_N &&
	     master_xactor_f_wr_data$FULL_N ;
  assign WILL_FIRE_RL_rl_fabric_send_write_req =
	     CAN_FIRE_RL_rl_fabric_send_write_req ;
  // rule RL_rl_reset
  assign CAN_FIRE_RL_rl_reset = WILL_FIRE_RL_rl_reset ;
  assign WILL_FIRE_RL_rl_reset =
	     (rg_cset_in_cache != 6'd63 ||
	      f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N) &&
	     rg_state == 5'd1 ;
  // rule RL_rl_probe_and_immed_rsp
  assign CAN_FIRE_RL_rl_probe_and_immed_rsp =
	     dmem_not_imem_AND_NOT_soc_map_m_is_mem_addr_rg_ETC___d120 &&
	     rg_state == 5'd3 ;
  assign WILL_FIRE_RL_rl_probe_and_immed_rsp =
	     CAN_FIRE_RL_rl_probe_and_immed_rsp &&
	     !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_start_cache_refill
  assign CAN_FIRE_RL_rl_start_cache_refill =
	     master_xactor_f_rd_addr$FULL_N && rg_state == 5'd9 &&
	     b__h26615 == 4'd0 ;
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
	     rg_state_4_EQ_13_44_AND_rg_op_1_EQ_0_2_OR_rg_o_ETC___d646 ;
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
	     b__h26615 != 4'd0 && master_xactor_f_wr_resp$EMPTY_N ;
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
	     rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d181 ;
  assign MUX_dw_output_ld_val$wset_1__SEL_4 =
	     WILL_FIRE_RL_rl_maintain_io_read_rsp ||
	     WILL_FIRE_RL_rl_ST_AMO_response ;
  assign MUX_f_fabric_write_reqs$enq_1__SEL_2 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d526 ;
  assign MUX_master_xactor_f_rd_addr$enq_1__SEL_1 =
	     WILL_FIRE_RL_rl_io_AMO_op_req || WILL_FIRE_RL_rl_io_read_req ;
  assign MUX_ram_state_and_ctag_cset$a_put_1__SEL_1 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_word64_set_in_cache[2:0] == 3'd0 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_ram_state_and_ctag_cset$b_put_3__SEL_1 =
	     EN_req &&
	     req_f3_BITS_1_TO_0_29_EQ_0b0_30_OR_req_f3_BITS_ETC___d959 ;
  assign MUX_ram_word64_set$a_put_1__SEL_1 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_ram_word64_set$b_put_1__SEL_2 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_word64_set_in_cache[2:0] != 3'd7 ;
  assign MUX_rg_error_during_refill$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign MUX_rg_exc_code$write_1__SEL_1 =
	     EN_req &&
	     NOT_req_f3_BITS_1_TO_0_29_EQ_0b0_30_31_AND_NOT_ETC___d950 ;
  assign MUX_rg_exc_code$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign MUX_rg_exc_code$write_1__SEL_3 =
	     WILL_FIRE_RL_rl_io_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign MUX_rg_ld_val$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d378 ;
  assign MUX_rg_lrsc_valid$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d176 ;
  assign MUX_rg_state$write_1__SEL_2 =
	     f_reset_reqs$EMPTY_N && rg_state != 5'd1 ;
  assign MUX_rg_state$write_1__SEL_3 =
	     CAN_FIRE_RL_rl_io_AMO_read_rsp && !WILL_FIRE_RL_rl_start_reset ;
  assign MUX_rg_state$write_1__SEL_10 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_word64_set_in_cache[2:0] == 3'd7 ;
  assign MUX_rg_state$write_1__SEL_12 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (dmem_not_imem && !soc_map$m_is_mem_addr ||
	      rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d135 ||
	      NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d145) ;
  assign MUX_rg_state$write_1__SEL_13 =
	     WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 ;
  assign MUX_dw_output_ld_val$wset_1__VAL_3 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) ?
	       new_value__h6006 :
	       new_value__h22433 ;
  assign MUX_f_fabric_write_reqs$enq_1__VAL_1 = { rg_f3, rg_pa, x__h32733 } ;
  assign MUX_f_fabric_write_reqs$enq_1__VAL_2 =
	     { rg_f3,
	       rg_addr,
	       IF_rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_ETC___d528 } ;
  assign MUX_f_fabric_write_reqs$enq_1__VAL_3 =
	     { rg_f3, rg_pa, rg_st_amo_val } ;
  assign MUX_master_xactor_f_rd_addr$enq_1__VAL_1 =
	     { 4'd0, rg_pa, 8'd0, value__h32290, 18'd65536 } ;
  assign MUX_master_xactor_f_rd_addr$enq_1__VAL_2 =
	     { 4'd0, cline_fabric_addr__h26714, 29'd15532032 } ;
  assign MUX_ram_state_and_ctag_cset$a_put_3__VAL_1 =
	     { rg_victim_way || ram_state_and_ctag_cset$DOB[105],
	       rg_victim_way ?
		 rg_pa[63:12] :
		 ram_state_and_ctag_cset$DOB[104:53],
	       !rg_victim_way || ram_state_and_ctag_cset$DOB[52],
	       rg_victim_way ?
		 ram_state_and_ctag_cset$DOB[51:0] :
		 rg_pa[63:12] } ;
  assign MUX_ram_word64_set$a_put_3__VAL_1 =
	     rg_victim_way ?
	       { master_xactor_f_rd_data$D_OUT[66:3],
		 ram_word64_set$DOB[63:0] } :
	       { ram_word64_set$DOB[127:64],
		 master_xactor_f_rd_data$D_OUT[66:3] } ;
  assign MUX_ram_word64_set$a_put_3__VAL_2 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       { IF_ram_state_and_ctag_cset_b_read__02_BIT_105__ETC___d443,
		 IF_NOT_ram_state_and_ctag_cset_b_read__02_BIT__ETC___d444 } :
	       { IF_ram_state_and_ctag_cset_b_read__02_BIT_105__ETC___d520,
		 IF_NOT_ram_state_and_ctag_cset_b_read__02_BIT__ETC___d521 } ;
  assign MUX_ram_word64_set$b_put_2__VAL_2 = rg_word64_set_in_cache + 9'd1 ;
  assign MUX_ram_word64_set$b_put_2__VAL_4 = { rg_addr[11:6], 3'd0 } ;
  assign MUX_rg_cset_in_cache$write_1__VAL_1 = rg_cset_in_cache + 6'd1 ;
  assign MUX_rg_exc_code$write_1__VAL_1 = (req_op == 2'd0) ? 4'd4 : 4'd6 ;
  assign MUX_rg_ld_val$write_1__VAL_2 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       x__h20014 :
	       IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_IF_rg_f3_50_E_ETC___d382 ;
  assign MUX_rg_state$write_1__VAL_1 =
	     NOT_req_f3_BITS_1_TO_0_29_EQ_0b0_30_31_AND_NOT_ETC___d950 ?
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
	       IF_rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_ETC___d150 ;
  // inlined wires
  assign dw_valid$whas =
	     (WILL_FIRE_RL_rl_io_AMO_read_rsp ||
	      WILL_FIRE_RL_rl_io_read_rsp) &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d181 ||
	     WILL_FIRE_RL_rl_drive_exception_rsp ||
	     WILL_FIRE_RL_rl_maintain_io_read_rsp ||
	     WILL_FIRE_RL_rl_ST_AMO_response ;
  assign ctr_wr_rsps_pending_crg$port0__write_1 =
	     ctr_wr_rsps_pending_crg + 4'd1 ;
  assign ctr_wr_rsps_pending_crg$port1__write_1 = b__h26615 - 4'd1 ;
  assign ctr_wr_rsps_pending_crg$port2__read =
	     CAN_FIRE_RL_rl_discard_write_rsp ?
	       ctr_wr_rsps_pending_crg$port1__write_1 :
	       b__h26615 ;
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
  // register rg_cset_in_cache
  assign rg_cset_in_cache$D_IN =
	     WILL_FIRE_RL_rl_reset ?
	       MUX_rg_cset_in_cache$write_1__VAL_1 :
	       6'd0 ;
  assign rg_cset_in_cache$EN =
	     WILL_FIRE_RL_rl_reset || WILL_FIRE_RL_rl_start_reset ;
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
	  MUX_rg_exc_code$write_1__SEL_3 or
	  MUX_rg_error_during_refill$write_1__SEL_1 or access_exc_code__h2376)
  case (1'b1)
    MUX_rg_exc_code$write_1__SEL_1:
	rg_exc_code$D_IN = MUX_rg_exc_code$write_1__VAL_1;
    MUX_rg_exc_code$write_1__SEL_2: rg_exc_code$D_IN = 4'd7;
    MUX_rg_exc_code$write_1__SEL_3: rg_exc_code$D_IN = 4'd5;
    MUX_rg_error_during_refill$write_1__SEL_1:
	rg_exc_code$D_IN = access_exc_code__h2376;
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
	     NOT_req_f3_BITS_1_TO_0_29_EQ_0b0_30_31_AND_NOT_ETC___d950 ;
  // register rg_f3
  assign rg_f3$D_IN = req_f3 ;
  assign rg_f3$EN = EN_req ;
  // register rg_ld_val
  always@(MUX_dw_output_ld_val$wset_1__SEL_2 or
	  new_ld_val__h32704 or
	  MUX_rg_ld_val$write_1__SEL_2 or
	  MUX_rg_ld_val$write_1__VAL_2 or
	  WILL_FIRE_RL_rl_io_read_rsp or
	  ld_val__h30496 or WILL_FIRE_RL_rl_io_AMO_SC_req)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_dw_output_ld_val$wset_1__SEL_2: rg_ld_val$D_IN = new_ld_val__h32704;
      MUX_rg_ld_val$write_1__SEL_2:
	  rg_ld_val$D_IN = MUX_rg_ld_val$write_1__VAL_2;
      WILL_FIRE_RL_rl_io_read_rsp: rg_ld_val$D_IN = ld_val__h30496;
      WILL_FIRE_RL_rl_io_AMO_SC_req: rg_ld_val$D_IN = 64'd1;
      default: rg_ld_val$D_IN = 64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign rg_ld_val$EN =
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d378 ||
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
	     rg_amo_funct7_4_BITS_6_TO_2_5_EQ_0b10_6_AND_ra_ETC___d360 ;
  // register rg_lrsc_valid
  assign rg_lrsc_valid$D_IN =
	     MUX_rg_lrsc_valid$write_1__SEL_2 &&
	     rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d178 ;
  assign rg_lrsc_valid$EN =
	     WILL_FIRE_RL_rl_io_read_req && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d176 ||
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
  assign rg_st_amo_val$D_IN = EN_req ? req_st_value : new_st_val__h23565 ;
  assign rg_st_amo_val$EN =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d573 ||
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
	     rg_word64_set_in_cache[2:0] == 3'd7 ||
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
  // register rg_victim_way
  assign rg_victim_way$D_IN = tmp__h26877[0] ;
  assign rg_victim_way$EN = WILL_FIRE_RL_rl_start_cache_refill ;
  // register rg_word64_set_in_cache
  assign rg_word64_set_in_cache$D_IN =
	     MUX_ram_word64_set$b_put_1__SEL_2 ?
	       MUX_ram_word64_set$b_put_2__VAL_2 :
	       MUX_ram_word64_set$b_put_2__VAL_4 ;
  assign rg_word64_set_in_cache$EN =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_word64_set_in_cache[2:0] != 3'd7 ||
	     WILL_FIRE_RL_rl_start_cache_refill ;
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
	     NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d526 ||
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
	       x__h2641,
	       18'd65536 } ;
  assign master_xactor_f_wr_addr$ENQ = CAN_FIRE_RL_rl_fabric_send_write_req ;
  assign master_xactor_f_wr_addr$DEQ =
	     master_xactor_f_wr_addr$EMPTY_N && mem_master_awready ;
  assign master_xactor_f_wr_addr$CLR =
	     WILL_FIRE_RL_rl_start_reset && !f_reset_reqs$D_OUT ;
  // submodule master_xactor_f_wr_data
  assign master_xactor_f_wr_data$D_IN =
	     { mem_req_wr_data_wdata__h2820,
	       mem_req_wr_data_wstrb__h2821,
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
  // submodule ram_state_and_ctag_cset
  assign ram_state_and_ctag_cset$ADDRA =
	     MUX_ram_state_and_ctag_cset$a_put_1__SEL_1 ?
	       rg_addr[11:6] :
	       rg_cset_in_cache ;
  assign ram_state_and_ctag_cset$ADDRB =
	     MUX_ram_state_and_ctag_cset$b_put_3__SEL_1 ?
	       req_addr[11:6] :
	       rg_addr[11:6] ;
  assign ram_state_and_ctag_cset$DIA =
	     MUX_ram_state_and_ctag_cset$a_put_1__SEL_1 ?
	       MUX_ram_state_and_ctag_cset$a_put_3__VAL_1 :
	       106'h15555555555554AAAAAAAAAAAAA ;
  assign ram_state_and_ctag_cset$DIB =
	     MUX_ram_state_and_ctag_cset$b_put_3__SEL_1 ?
	       106'h2AAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */  :
	       106'h2AAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */  ;
  assign ram_state_and_ctag_cset$WEA = 1'd1 ;
  assign ram_state_and_ctag_cset$WEB = 1'd0 ;
  assign ram_state_and_ctag_cset$ENA =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_word64_set_in_cache[2:0] == 3'd0 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_reset ;
  assign ram_state_and_ctag_cset$ENB =
	     EN_req &&
	     req_f3_BITS_1_TO_0_29_EQ_0b0_30_OR_req_f3_BITS_ETC___d959 ||
	     WILL_FIRE_RL_rl_rereq ;
  // submodule ram_word64_set
  assign ram_word64_set$ADDRA =
	     MUX_ram_word64_set$a_put_1__SEL_1 ?
	       rg_word64_set_in_cache :
	       rg_addr[11:3] ;
  always@(MUX_ram_state_and_ctag_cset$b_put_3__SEL_1 or
	  req_addr or
	  MUX_ram_word64_set$b_put_1__SEL_2 or
	  MUX_ram_word64_set$b_put_2__VAL_2 or
	  WILL_FIRE_RL_rl_rereq or
	  rg_addr or
	  WILL_FIRE_RL_rl_start_cache_refill or
	  MUX_ram_word64_set$b_put_2__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_ram_state_and_ctag_cset$b_put_3__SEL_1:
	  ram_word64_set$ADDRB = req_addr[11:3];
      MUX_ram_word64_set$b_put_1__SEL_2:
	  ram_word64_set$ADDRB = MUX_ram_word64_set$b_put_2__VAL_2;
      WILL_FIRE_RL_rl_rereq: ram_word64_set$ADDRB = rg_addr[11:3];
      WILL_FIRE_RL_rl_start_cache_refill:
	  ram_word64_set$ADDRB = MUX_ram_word64_set$b_put_2__VAL_4;
      default: ram_word64_set$ADDRB = 9'b010101010 /* unspecified value */ ;
    endcase
  end
  assign ram_word64_set$DIA =
	     MUX_ram_word64_set$a_put_1__SEL_1 ?
	       MUX_ram_word64_set$a_put_3__VAL_1 :
	       MUX_ram_word64_set$a_put_3__VAL_2 ;
  always@(MUX_ram_state_and_ctag_cset$b_put_3__SEL_1 or
	  MUX_ram_word64_set$b_put_1__SEL_2 or
	  WILL_FIRE_RL_rl_rereq or WILL_FIRE_RL_rl_start_cache_refill)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_ram_state_and_ctag_cset$b_put_3__SEL_1:
	  ram_word64_set$DIB =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      MUX_ram_word64_set$b_put_1__SEL_2:
	  ram_word64_set$DIB =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      WILL_FIRE_RL_rl_rereq:
	  ram_word64_set$DIB =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      WILL_FIRE_RL_rl_start_cache_refill:
	  ram_word64_set$DIB =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      default: ram_word64_set$DIB =
		   128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign ram_word64_set$WEA = 1'd1 ;
  assign ram_word64_set$WEB = 1'd0 ;
  assign ram_word64_set$ENA =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d389 ;
  assign ram_word64_set$ENB =
	     EN_req &&
	     req_f3_BITS_1_TO_0_29_EQ_0b0_30_OR_req_f3_BITS_ETC___d959 ||
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_word64_set_in_cache[2:0] != 3'd7 ||
	     WILL_FIRE_RL_rl_rereq ||
	     WILL_FIRE_RL_rl_start_cache_refill ;
  // submodule soc_map
  assign soc_map$m_is_IO_addr_addr = 64'h0 ;
  assign soc_map$m_is_mem_addr_addr = rg_addr ;
  assign soc_map$m_is_near_mem_IO_addr_addr = 64'h0 ;
  // remaining internal signals
  assign IF_NOT_ram_state_and_ctag_cset_b_read__02_BIT__ETC___d148 =
	     ((!ram_state_and_ctag_cset$DOB[52] ||
	       !ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107) &&
	      (!ram_state_and_ctag_cset$DOB[105] ||
	       !ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113)) ?
	       5'd9 :
	       5'd12 ;
  assign IF_NOT_ram_state_and_ctag_cset_b_read__02_BIT__ETC___d444 =
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) ?
	       n__h20793 :
	       ram_word64_set$DOB[63:0] ;
  assign IF_NOT_ram_state_and_ctag_cset_b_read__02_BIT__ETC___d521 =
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) ?
	       n__h23729 :
	       ram_word64_set$DOB[63:0] ;
  assign IF_ram_state_and_ctag_cset_b_read__02_BIT_105__ETC___d443 =
	     (ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) ?
	       n__h20793 :
	       ram_word64_set$DOB[127:64] ;
  assign IF_ram_state_and_ctag_cset_b_read__02_BIT_105__ETC___d520 =
	     (ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) ?
	       n__h23729 :
	       ram_word64_set$DOB[127:64] ;
  assign IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_1_E_ETC___d351 =
	     (rg_addr[2:0] == 3'h0) ? 64'd1 : 64'd0 ;
  assign IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_IF__ETC___d844 =
	     (rg_addr[2:0] == 3'h0) ? ld_val__h30496 : 64'd0 ;
  assign IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_ram_ETC___d336 =
	     (rg_addr[2:0] == 3'h0) ? word64__h5839 : 64'd0 ;
  assign IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC__q31 =
	     IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC___d343[31:0] ;
  assign IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_rg_st_amo_val_ETC___d451 =
	     (rg_f3 == 3'b010) ?
	       { {32{rg_st_amo_val_BITS_31_TO_0__q32[31]}},
		 rg_st_amo_val_BITS_31_TO_0__q32 } :
	       rg_st_amo_val ;
  assign IF_rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_ETC___d150 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) ?
	       5'd9 :
	       IF_rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_ETC___d149 ;
  assign IF_rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_ETC___d118 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 &&
	       lrsc_result__h20004 ||
	       f_fabric_write_reqs$FULL_N :
	       NOT_ram_state_and_ctag_cset_b_read__02_BIT_52__ETC___d117 ;
  assign IF_rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_ETC___d149 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       5'd12 :
	       IF_NOT_ram_state_and_ctag_cset_b_read__02_BIT__ETC___d148 ;
  assign IF_rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_ETC___d528 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       rg_st_amo_val :
	       new_st_val__h23565 ;
  assign NOT_cfg_verbosity_read__9_ULE_1_0___d41 = cfg_verbosity > 4'd1 ;
  assign NOT_cfg_verbosity_read__9_ULE_2_94___d595 = cfg_verbosity > 4'd2 ;
  assign NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d158 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     ram_state_and_ctag_cset$DOB[52] &&
	     ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107 &&
	     ram_state_and_ctag_cset$DOB[105] &&
	     ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113 ;
  assign NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d357 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     ram_state_and_ctag_cset_b_read__02_BIT_52_03_A_ETC___d355 ;
  assign NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d365 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     ram_state_and_ctag_cset_b_read__02_BIT_52_03_A_ETC___d355 ;
  assign NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d368 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     NOT_ram_state_and_ctag_cset_b_read__02_BIT_52__ETC___d366 ;
  assign NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d374 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     NOT_ram_state_and_ctag_cset_b_read__02_BIT_52__ETC___d371 ;
  assign NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d378 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     (rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 ||
	      NOT_rg_op_1_EQ_1_9_70_AND_ram_state_and_ctag_c_ETC___d375) ;
  assign NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d389 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d387 ;
  assign NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d531 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd1 &&
	     rg_addr_7_EQ_rg_lrsc_pa_5___d162 &&
	     NOT_cfg_verbosity_read__9_ULE_1_0___d41 ;
  assign NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d543 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00011 &&
	     NOT_cfg_verbosity_read__9_ULE_1_0___d41 ;
  assign NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d573 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     NOT_rg_op_1_EQ_1_9_70_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d386 ;
  assign NOT_ram_state_and_ctag_cset_b_read__02_BIT_52__ETC___d117 =
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) ||
	     f_fabric_write_reqs$FULL_N ;
  assign NOT_ram_state_and_ctag_cset_b_read__02_BIT_52__ETC___d164 =
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) &&
	     rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     rg_addr_7_EQ_rg_lrsc_pa_5___d162 ;
  assign NOT_ram_state_and_ctag_cset_b_read__02_BIT_52__ETC___d366 =
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) &&
	     NOT_cfg_verbosity_read__9_ULE_1_0___d41 ;
  assign NOT_ram_state_and_ctag_cset_b_read__02_BIT_52__ETC___d371 =
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) &&
	     rg_addr_7_EQ_rg_lrsc_pa_5___d162 &&
	     NOT_cfg_verbosity_read__9_ULE_1_0___d41 ;
  assign NOT_req_f3_BITS_1_TO_0_29_EQ_0b0_30_31_AND_NOT_ETC___d950 =
	     req_f3[1:0] != 2'b0 && (req_f3[1:0] != 2'b01 || req_addr[0]) &&
	     (req_f3[1:0] != 2'b10 || req_addr[1:0] != 2'b0) &&
	     (req_f3[1:0] != 2'b11 || req_addr[2:0] != 3'b0) ;
  assign NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d145 =
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_5_EQ_rg_addr_7___d96) ;
  assign NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d526 =
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     (rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d524 ||
	      NOT_rg_op_1_EQ_1_9_70_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d386) ;
  assign NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d546 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     NOT_rg_op_1_EQ_2_3_37_OR_NOT_rg_amo_funct7_4_B_ETC___d544 ;
  assign NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d554 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     NOT_rg_op_1_EQ_2_3_37_OR_NOT_rg_amo_funct7_4_B_ETC___d552 ;
  assign NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d566 =
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     rg_op != 2'd1 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	     ram_state_and_ctag_cset_b_read__02_BIT_52_03_A_ETC___d355 ;
  assign NOT_rg_op_1_EQ_1_9_70_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d386 =
	     rg_op != 2'd1 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) ;
  assign NOT_rg_op_1_EQ_1_9_70_AND_ram_state_and_ctag_c_ETC___d375 =
	     rg_op != 2'd1 &&
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) ;
  assign NOT_rg_op_1_EQ_2_3_37_OR_NOT_rg_amo_funct7_4_B_ETC___d384 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_5_EQ_rg_addr_7___d96) &&
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) ;
  assign NOT_rg_op_1_EQ_2_3_37_OR_NOT_rg_amo_funct7_4_B_ETC___d544 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_5_EQ_rg_addr_7___d96) &&
	     ram_state_and_ctag_cset_b_read__02_BIT_52_03_A_ETC___d355 ;
  assign NOT_rg_op_1_EQ_2_3_37_OR_NOT_rg_amo_funct7_4_B_ETC___d548 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_5_EQ_rg_addr_7___d96) &&
	     NOT_ram_state_and_ctag_cset_b_read__02_BIT_52__ETC___d366 ;
  assign NOT_rg_op_1_EQ_2_3_37_OR_NOT_rg_amo_funct7_4_B_ETC___d552 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_5_EQ_rg_addr_7___d96) &&
	     NOT_cfg_verbosity_read__9_ULE_1_0___d41 ;
  assign _theResult___snd_fst__h2828 =
	     f_fabric_write_reqs$D_OUT[63:0] << shift_bits__h2608 ;
  assign access_exc_code__h2376 =
	     dmem_not_imem ?
	       ((rg_op == 2'd0 ||
		 rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) ?
		  4'd5 :
		  4'd7) :
	       4'd1 ;
  assign b__h26615 =
	     CAN_FIRE_RL_rl_fabric_send_write_req ?
	       ctr_wr_rsps_pending_crg$port0__write_1 :
	       ctr_wr_rsps_pending_crg ;
  assign cline_fabric_addr__h26714 = { rg_pa[63:6], 6'd0 } ;
  assign dmem_not_imem_AND_NOT_soc_map_m_is_mem_addr_rg_ETC___d120 =
	     dmem_not_imem && !soc_map$m_is_mem_addr || rg_op == 2'd0 ||
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010 ||
	     IF_rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_ETC___d118 ;
  assign ld_val0496_BITS_15_TO_0__q37 = ld_val__h30496[15:0] ;
  assign ld_val0496_BITS_15_TO_8__q39 = ld_val__h30496[15:8] ;
  assign ld_val0496_BITS_23_TO_16__q40 = ld_val__h30496[23:16] ;
  assign ld_val0496_BITS_31_TO_0__q38 = ld_val__h30496[31:0] ;
  assign ld_val0496_BITS_31_TO_16__q41 = ld_val__h30496[31:16] ;
  assign ld_val0496_BITS_31_TO_24__q42 = ld_val__h30496[31:24] ;
  assign ld_val0496_BITS_39_TO_32__q43 = ld_val__h30496[39:32] ;
  assign ld_val0496_BITS_47_TO_32__q44 = ld_val__h30496[47:32] ;
  assign ld_val0496_BITS_47_TO_40__q46 = ld_val__h30496[47:40] ;
  assign ld_val0496_BITS_55_TO_48__q47 = ld_val__h30496[55:48] ;
  assign ld_val0496_BITS_63_TO_32__q45 = ld_val__h30496[63:32] ;
  assign ld_val0496_BITS_63_TO_48__q48 = ld_val__h30496[63:48] ;
  assign ld_val0496_BITS_63_TO_56__q49 = ld_val__h30496[63:56] ;
  assign ld_val0496_BITS_7_TO_0__q36 = ld_val__h30496[7:0] ;
  assign lrsc_result__h20004 =
	     !rg_lrsc_valid || !rg_lrsc_pa_5_EQ_rg_addr_7___d96 ;
  assign master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1 =
	     master_xactor_f_rd_data$D_OUT[10:3] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4 =
	     master_xactor_f_rd_data$D_OUT[18:11] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2 =
	     master_xactor_f_rd_data$D_OUT[18:3] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q5 =
	     master_xactor_f_rd_data$D_OUT[26:19] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q7 =
	     master_xactor_f_rd_data$D_OUT[34:19] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q8 =
	     master_xactor_f_rd_data$D_OUT[34:27] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3 =
	     master_xactor_f_rd_data$D_OUT[34:3] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q9 =
	     master_xactor_f_rd_data$D_OUT[42:35] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q6 =
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
  assign new_st_val__h23565 =
	     (rg_f3 == 3'b010) ?
	       new_st_val__h23871 :
	       _theResult_____2__h23867 ;
  assign new_st_val__h23871 = { 32'd0, _theResult_____2__h23867[31:0] } ;
  assign new_st_val__h23962 =
	     IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_IF_rg_f3_50_E_ETC___d382 +
	     IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_rg_st_amo_val_ETC___d451 ;
  assign new_st_val__h24942 = w1__h23859 ^ w2__h32744 ;
  assign new_st_val__h24946 = w1__h23859 & w2__h32744 ;
  assign new_st_val__h24950 = w1__h23859 | w2__h32744 ;
  assign new_st_val__h24954 =
	     (w1__h23859 < w2__h32744) ? w1__h23859 : w2__h32744 ;
  assign new_st_val__h24959 =
	     (w1__h23859 <= w2__h32744) ? w2__h32744 : w1__h23859 ;
  assign new_st_val__h24965 =
	     ((IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_IF_rg_f3_50_E_ETC___d382 ^
	       64'h8000000000000000) <
	      (IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_rg_st_amo_val_ETC___d451 ^
	       64'h8000000000000000)) ?
	       w1__h23859 :
	       w2__h32744 ;
  assign new_st_val__h24970 =
	     ((IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_IF_rg_f3_50_E_ETC___d382 ^
	       64'h8000000000000000) <=
	      (IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_rg_st_amo_val_ETC___d451 ^
	       64'h8000000000000000)) ?
	       w2__h32744 :
	       w1__h23859 ;
  assign new_st_val__h32754 = { 32'd0, _theResult_____2__h32750[31:0] } ;
  assign new_st_val__h32845 =
	     new_ld_val__h32704 +
	     IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_rg_st_amo_val_ETC___d451 ;
  assign new_st_val__h34705 = w1__h32742 ^ w2__h32744 ;
  assign new_st_val__h34709 = w1__h32742 & w2__h32744 ;
  assign new_st_val__h34713 = w1__h32742 | w2__h32744 ;
  assign new_st_val__h34717 =
	     (w1__h32742 < w2__h32744) ? w1__h32742 : w2__h32744 ;
  assign new_st_val__h34722 =
	     (w1__h32742 <= w2__h32744) ? w2__h32744 : w1__h32742 ;
  assign new_st_val__h34728 =
	     ((new_ld_val__h32704 ^ 64'h8000000000000000) <
	      (IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_rg_st_amo_val_ETC___d451 ^
	       64'h8000000000000000)) ?
	       w1__h32742 :
	       w2__h32744 ;
  assign new_st_val__h34733 =
	     ((new_ld_val__h32704 ^ 64'h8000000000000000) <=
	      (IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_rg_st_amo_val_ETC___d451 ^
	       64'h8000000000000000)) ?
	       w2__h32744 :
	       w1__h32742 ;
  assign new_value__h22433 =
	     (rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       64'd1 :
	       CASE_rg_f3_0b0_IF_rg_addr_7_BITS_2_TO_0_27_EQ__ETC__q52 ;
  assign new_value__h6006 =
	     (rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       word64__h5839 :
	       IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC___d343 ;
  assign ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113 =
	     ram_state_and_ctag_cset$DOB[104:53] == rg_addr[63:12] ;
  assign ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107 =
	     ram_state_and_ctag_cset$DOB[51:0] == rg_addr[63:12] ;
  assign ram_state_and_ctag_cset_b_read__02_BIT_52_03_A_ETC___d161 =
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) &&
	     rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 ;
  assign ram_state_and_ctag_cset_b_read__02_BIT_52_03_A_ETC___d172 =
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) &&
	     rg_addr_7_EQ_rg_lrsc_pa_5___d162 ;
  assign ram_state_and_ctag_cset_b_read__02_BIT_52_03_A_ETC___d355 =
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) &&
	     NOT_cfg_verbosity_read__9_ULE_1_0___d41 ;
  assign ram_state_and_ctag_cset_b_read__02_BIT_52_03_A_ETC___d568 =
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) &&
	     rg_addr_7_EQ_rg_lrsc_pa_5___d162 &&
	     NOT_cfg_verbosity_read__9_ULE_1_0___d41 ;
  assign req_f3_BITS_1_TO_0_29_EQ_0b0_30_OR_req_f3_BITS_ETC___d959 =
	     req_f3[1:0] == 2'b0 || req_f3[1:0] == 2'b01 && !req_addr[0] ||
	     req_f3[1:0] == 2'b10 && req_addr[1:0] == 2'b0 ||
	     req_f3[1:0] == 2'b11 && req_addr[2:0] == 3'b0 ;
  assign result__h18715 =
	     { {56{word64839_BITS_7_TO_0__q15[7]}},
	       word64839_BITS_7_TO_0__q15 } ;
  assign result__h18743 =
	     { {56{word64839_BITS_15_TO_8__q18[7]}},
	       word64839_BITS_15_TO_8__q18 } ;
  assign result__h18771 =
	     { {56{word64839_BITS_23_TO_16__q19[7]}},
	       word64839_BITS_23_TO_16__q19 } ;
  assign result__h18799 =
	     { {56{word64839_BITS_31_TO_24__q21[7]}},
	       word64839_BITS_31_TO_24__q21 } ;
  assign result__h18827 =
	     { {56{word64839_BITS_39_TO_32__q22[7]}},
	       word64839_BITS_39_TO_32__q22 } ;
  assign result__h18855 =
	     { {56{word64839_BITS_47_TO_40__q25[7]}},
	       word64839_BITS_47_TO_40__q25 } ;
  assign result__h18883 =
	     { {56{word64839_BITS_55_TO_48__q26[7]}},
	       word64839_BITS_55_TO_48__q26 } ;
  assign result__h18911 =
	     { {56{word64839_BITS_63_TO_56__q28[7]}},
	       word64839_BITS_63_TO_56__q28 } ;
  assign result__h18956 = { 56'd0, word64__h5839[7:0] } ;
  assign result__h18984 = { 56'd0, word64__h5839[15:8] } ;
  assign result__h19012 = { 56'd0, word64__h5839[23:16] } ;
  assign result__h19040 = { 56'd0, word64__h5839[31:24] } ;
  assign result__h19068 = { 56'd0, word64__h5839[39:32] } ;
  assign result__h19096 = { 56'd0, word64__h5839[47:40] } ;
  assign result__h19124 = { 56'd0, word64__h5839[55:48] } ;
  assign result__h19152 = { 56'd0, word64__h5839[63:56] } ;
  assign result__h19197 =
	     { {48{word64839_BITS_15_TO_0__q16[15]}},
	       word64839_BITS_15_TO_0__q16 } ;
  assign result__h19225 =
	     { {48{word64839_BITS_31_TO_16__q20[15]}},
	       word64839_BITS_31_TO_16__q20 } ;
  assign result__h19253 =
	     { {48{word64839_BITS_47_TO_32__q23[15]}},
	       word64839_BITS_47_TO_32__q23 } ;
  assign result__h19281 =
	     { {48{word64839_BITS_63_TO_48__q27[15]}},
	       word64839_BITS_63_TO_48__q27 } ;
  assign result__h19322 = { 48'd0, word64__h5839[15:0] } ;
  assign result__h19350 = { 48'd0, word64__h5839[31:16] } ;
  assign result__h19378 = { 48'd0, word64__h5839[47:32] } ;
  assign result__h19406 = { 48'd0, word64__h5839[63:48] } ;
  assign result__h19447 =
	     { {32{word64839_BITS_31_TO_0__q17[31]}},
	       word64839_BITS_31_TO_0__q17 } ;
  assign result__h19475 =
	     { {32{word64839_BITS_63_TO_32__q24[31]}},
	       word64839_BITS_63_TO_32__q24 } ;
  assign result__h19514 = { 32'd0, word64__h5839[31:0] } ;
  assign result__h19542 = { 32'd0, word64__h5839[63:32] } ;
  assign result__h30556 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1 } ;
  assign result__h30586 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4 } ;
  assign result__h30613 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q5[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q5 } ;
  assign result__h30640 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q8[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q8 } ;
  assign result__h30667 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q9[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q9 } ;
  assign result__h30694 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11 } ;
  assign result__h30721 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12 } ;
  assign result__h30748 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14 } ;
  assign result__h30792 = { 56'd0, master_xactor_f_rd_data$D_OUT[10:3] } ;
  assign result__h30819 = { 56'd0, master_xactor_f_rd_data$D_OUT[18:11] } ;
  assign result__h30846 = { 56'd0, master_xactor_f_rd_data$D_OUT[26:19] } ;
  assign result__h30873 = { 56'd0, master_xactor_f_rd_data$D_OUT[34:27] } ;
  assign result__h30900 = { 56'd0, master_xactor_f_rd_data$D_OUT[42:35] } ;
  assign result__h30927 = { 56'd0, master_xactor_f_rd_data$D_OUT[50:43] } ;
  assign result__h30954 = { 56'd0, master_xactor_f_rd_data$D_OUT[58:51] } ;
  assign result__h30981 = { 56'd0, master_xactor_f_rd_data$D_OUT[66:59] } ;
  assign result__h31025 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2 } ;
  assign result__h31052 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q7[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q7 } ;
  assign result__h31079 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q6[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q6 } ;
  assign result__h31106 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13 } ;
  assign result__h31146 = { 48'd0, master_xactor_f_rd_data$D_OUT[18:3] } ;
  assign result__h31173 = { 48'd0, master_xactor_f_rd_data$D_OUT[34:19] } ;
  assign result__h31200 = { 48'd0, master_xactor_f_rd_data$D_OUT[50:35] } ;
  assign result__h31227 = { 48'd0, master_xactor_f_rd_data$D_OUT[66:51] } ;
  assign result__h31267 =
	     { {32{master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3[31]}},
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3 } ;
  assign result__h31294 =
	     { {32{master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10[31]}},
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10 } ;
  assign result__h31332 = { 32'd0, master_xactor_f_rd_data$D_OUT[34:3] } ;
  assign result__h31359 = { 32'd0, master_xactor_f_rd_data$D_OUT[66:35] } ;
  assign result__h32933 =
	     { {56{ld_val0496_BITS_7_TO_0__q36[7]}},
	       ld_val0496_BITS_7_TO_0__q36 } ;
  assign result__h33841 =
	     { {56{ld_val0496_BITS_15_TO_8__q39[7]}},
	       ld_val0496_BITS_15_TO_8__q39 } ;
  assign result__h33869 =
	     { {56{ld_val0496_BITS_23_TO_16__q40[7]}},
	       ld_val0496_BITS_23_TO_16__q40 } ;
  assign result__h33897 =
	     { {56{ld_val0496_BITS_31_TO_24__q42[7]}},
	       ld_val0496_BITS_31_TO_24__q42 } ;
  assign result__h33925 =
	     { {56{ld_val0496_BITS_39_TO_32__q43[7]}},
	       ld_val0496_BITS_39_TO_32__q43 } ;
  assign result__h33953 =
	     { {56{ld_val0496_BITS_47_TO_40__q46[7]}},
	       ld_val0496_BITS_47_TO_40__q46 } ;
  assign result__h33981 =
	     { {56{ld_val0496_BITS_55_TO_48__q47[7]}},
	       ld_val0496_BITS_55_TO_48__q47 } ;
  assign result__h34009 =
	     { {56{ld_val0496_BITS_63_TO_56__q49[7]}},
	       ld_val0496_BITS_63_TO_56__q49 } ;
  assign result__h34054 = { 56'd0, ld_val__h30496[7:0] } ;
  assign result__h34082 = { 56'd0, ld_val__h30496[15:8] } ;
  assign result__h34110 = { 56'd0, ld_val__h30496[23:16] } ;
  assign result__h34138 = { 56'd0, ld_val__h30496[31:24] } ;
  assign result__h34166 = { 56'd0, ld_val__h30496[39:32] } ;
  assign result__h34194 = { 56'd0, ld_val__h30496[47:40] } ;
  assign result__h34222 = { 56'd0, ld_val__h30496[55:48] } ;
  assign result__h34250 = { 56'd0, ld_val__h30496[63:56] } ;
  assign result__h34295 =
	     { {48{ld_val0496_BITS_15_TO_0__q37[15]}},
	       ld_val0496_BITS_15_TO_0__q37 } ;
  assign result__h34323 =
	     { {48{ld_val0496_BITS_31_TO_16__q41[15]}},
	       ld_val0496_BITS_31_TO_16__q41 } ;
  assign result__h34351 =
	     { {48{ld_val0496_BITS_47_TO_32__q44[15]}},
	       ld_val0496_BITS_47_TO_32__q44 } ;
  assign result__h34379 =
	     { {48{ld_val0496_BITS_63_TO_48__q48[15]}},
	       ld_val0496_BITS_63_TO_48__q48 } ;
  assign result__h34420 = { 48'd0, ld_val__h30496[15:0] } ;
  assign result__h34448 = { 48'd0, ld_val__h30496[31:16] } ;
  assign result__h34476 = { 48'd0, ld_val__h30496[47:32] } ;
  assign result__h34504 = { 48'd0, ld_val__h30496[63:48] } ;
  assign result__h34545 =
	     { {32{ld_val0496_BITS_31_TO_0__q38[31]}},
	       ld_val0496_BITS_31_TO_0__q38 } ;
  assign result__h34573 =
	     { {32{ld_val0496_BITS_63_TO_32__q45[31]}},
	       ld_val0496_BITS_63_TO_32__q45 } ;
  assign result__h34612 = { 32'd0, ld_val__h30496[31:0] } ;
  assign result__h34640 = { 32'd0, ld_val__h30496[63:32] } ;
  assign rg_addr_7_EQ_rg_lrsc_pa_5___d162 = rg_addr == rg_lrsc_pa ;
  assign rg_amo_funct7_4_BITS_6_TO_2_5_EQ_0b10_6_AND_ra_ETC___d360 =
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) ;
  assign rg_lrsc_pa_5_EQ_rg_addr_7___d96 = rg_lrsc_pa == rg_addr ;
  assign rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d135 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) ;
  assign rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d166 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     (ram_state_and_ctag_cset_b_read__02_BIT_52_03_A_ETC___d161 ||
	      NOT_ram_state_and_ctag_cset_b_read__02_BIT_52__ETC___d164) ;
  assign rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d176 =
	     rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d166 ||
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d174 ;
  assign rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d178 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113) ;
  assign rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d181 =
	     rg_op_1_EQ_0_2_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d178 ||
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 &&
	     lrsc_result__h20004 ;
  assign rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d174 =
	     rg_op == 2'd1 && rg_addr_7_EQ_rg_lrsc_pa_5___d162 ||
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 ||
	     rg_op != 2'd1 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	     ram_state_and_ctag_cset_b_read__02_BIT_52_03_A_ETC___d172 ;
  assign rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d387 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     NOT_rg_op_1_EQ_2_3_37_OR_NOT_rg_amo_funct7_4_B_ETC___d384 ||
	     NOT_rg_op_1_EQ_1_9_70_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d386 ;
  assign rg_op_1_EQ_1_9_OR_rg_op_1_EQ_2_3_AND_rg_amo_fu_ETC___d524 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_5_EQ_rg_addr_7___d96) ;
  assign rg_op_1_EQ_2_3_AND_rg_amo_funct7_4_BITS_6_TO_2_ETC___d558 =
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 &&
	     lrsc_result__h20004 &&
	     NOT_cfg_verbosity_read__9_ULE_1_0___d41 ;
  assign rg_st_amo_val_BITS_31_TO_0__q32 = rg_st_amo_val[31:0] ;
  assign rg_state_4_EQ_13_44_AND_rg_op_1_EQ_0_2_OR_rg_o_ETC___d646 =
	     rg_state == 5'd13 &&
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     b__h26615 == 4'd0 ;
  assign shift_bits__h2608 = { f_fabric_write_reqs$D_OUT[66:64], 3'b0 } ;
  assign strobe64__h2758 = 8'b00000001 << f_fabric_write_reqs$D_OUT[66:64] ;
  assign strobe64__h2760 = 8'b00000011 << f_fabric_write_reqs$D_OUT[66:64] ;
  assign strobe64__h2762 = 8'b00001111 << f_fabric_write_reqs$D_OUT[66:64] ;
  assign tmp__h26876 = { 1'd0, rg_victim_way } ;
  assign tmp__h26877 = tmp__h26876 + 2'd1 ;
  assign w12738_BITS_31_TO_0__q51 = w1__h32738[31:0] ;
  assign w1___1__h23930 =
	     { 32'd0,
	       IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC___d343[31:0] } ;
  assign w1___1__h32813 = { 32'd0, w1__h32738[31:0] } ;
  assign w2___1__h32814 = { 32'd0, rg_st_amo_val[31:0] } ;
  assign w2__h32744 = (rg_f3 == 3'b010) ? w2___1__h32814 : rg_st_amo_val ;
  assign word64839_BITS_15_TO_0__q16 = word64__h5839[15:0] ;
  assign word64839_BITS_15_TO_8__q18 = word64__h5839[15:8] ;
  assign word64839_BITS_23_TO_16__q19 = word64__h5839[23:16] ;
  assign word64839_BITS_31_TO_0__q17 = word64__h5839[31:0] ;
  assign word64839_BITS_31_TO_16__q20 = word64__h5839[31:16] ;
  assign word64839_BITS_31_TO_24__q21 = word64__h5839[31:24] ;
  assign word64839_BITS_39_TO_32__q22 = word64__h5839[39:32] ;
  assign word64839_BITS_47_TO_32__q23 = word64__h5839[47:32] ;
  assign word64839_BITS_47_TO_40__q25 = word64__h5839[47:40] ;
  assign word64839_BITS_55_TO_48__q26 = word64__h5839[55:48] ;
  assign word64839_BITS_63_TO_32__q24 = word64__h5839[63:32] ;
  assign word64839_BITS_63_TO_48__q27 = word64__h5839[63:48] ;
  assign word64839_BITS_63_TO_56__q28 = word64__h5839[63:56] ;
  assign word64839_BITS_7_TO_0__q15 = word64__h5839[7:0] ;
  assign word64__h5839 = x__h6029 | y__h6030 ;
  assign x__h20014 = { 63'd0, lrsc_result__h20004 } ;
  assign x__h32733 =
	     (rg_f3 == 3'b010) ?
	       new_st_val__h32754 :
	       _theResult_____2__h32750 ;
  assign x__h6029 = ram_word64_set$DOB[63:0] & y__h6044 ;
  assign y__h12359 =
	     {64{ram_state_and_ctag_cset$DOB[105] &&
		 ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113}} ;
  assign y__h6030 = ram_word64_set$DOB[127:64] & y__h12359 ;
  assign y__h6044 =
	     {64{ram_state_and_ctag_cset$DOB[52] &&
		 ram_state_and_ctag_cset_b_read__02_BITS_51_TO__ETC___d107}} ;
  always@(f_fabric_write_reqs$D_OUT)
  begin
    case (f_fabric_write_reqs$D_OUT[129:128])
      2'b0: x__h2641 = 3'b0;
      2'b01: x__h2641 = 3'b001;
      2'b10: x__h2641 = 3'b010;
      2'b11: x__h2641 = 3'b011;
    endcase
  end
  always@(rg_f3)
  begin
    case (rg_f3[1:0])
      2'b0: value__h32290 = 3'b0;
      2'b01: value__h32290 = 3'b001;
      2'b10: value__h32290 = 3'b010;
      2'd3: value__h32290 = 3'b011;
    endcase
  end
  always@(f_fabric_write_reqs$D_OUT or
	  strobe64__h2758 or strobe64__h2760 or strobe64__h2762)
  begin
    case (f_fabric_write_reqs$D_OUT[129:128])
      2'b0: mem_req_wr_data_wstrb__h2821 = strobe64__h2758;
      2'b01: mem_req_wr_data_wstrb__h2821 = strobe64__h2760;
      2'b10: mem_req_wr_data_wstrb__h2821 = strobe64__h2762;
      2'b11: mem_req_wr_data_wstrb__h2821 = 8'b11111111;
    endcase
  end
  always@(f_fabric_write_reqs$D_OUT or _theResult___snd_fst__h2828)
  begin
    case (f_fabric_write_reqs$D_OUT[129:128])
      2'b0, 2'b01, 2'b10:
	  mem_req_wr_data_wdata__h2820 = _theResult___snd_fst__h2828;
      2'd3: mem_req_wr_data_wdata__h2820 = f_fabric_write_reqs$D_OUT[63:0];
    endcase
  end
  always@(ram_state_and_ctag_cset$DOB or
	  ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113 or
	  ram_word64_set$DOB)
  begin
    case (ram_state_and_ctag_cset$DOB[105] &&
	  ram_state_and_ctag_cset_b_read__02_BITS_104_TO_ETC___d113)
      1'd0: old_word64__h20782 = ram_word64_set$DOB[63:0];
      1'd1: old_word64__h20782 = ram_word64_set$DOB[127:64];
    endcase
  end
  always@(rg_addr or
	  result__h18715 or
	  result__h18743 or
	  result__h18771 or
	  result__h18799 or
	  result__h18827 or
	  result__h18855 or result__h18883 or result__h18911)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d283 =
	      result__h18715;
      3'h1:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d283 =
	      result__h18743;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d283 =
	      result__h18771;
      3'h3:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d283 =
	      result__h18799;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d283 =
	      result__h18827;
      3'h5:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d283 =
	      result__h18855;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d283 =
	      result__h18883;
      3'h7:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d283 =
	      result__h18911;
    endcase
  end
  always@(rg_addr or
	  result__h18956 or
	  result__h18984 or
	  result__h19012 or
	  result__h19040 or
	  result__h19068 or
	  result__h19096 or result__h19124 or result__h19152)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d300 =
	      result__h18956;
      3'h1:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d300 =
	      result__h18984;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d300 =
	      result__h19012;
      3'h3:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d300 =
	      result__h19040;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d300 =
	      result__h19068;
      3'h5:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d300 =
	      result__h19096;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d300 =
	      result__h19124;
      3'h7:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d300 =
	      result__h19152;
    endcase
  end
  always@(rg_addr or
	  result__h19197 or
	  result__h19225 or result__h19253 or result__h19281)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d313 =
	      result__h19197;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d313 =
	      result__h19225;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d313 =
	      result__h19253;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d313 =
	      result__h19281;
      default: IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d313 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h19322 or
	  result__h19350 or result__h19378 or result__h19406)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d322 =
	      result__h19322;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d322 =
	      result__h19350;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d322 =
	      result__h19378;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d322 =
	      result__h19406;
      default: IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d322 =
		   64'd0;
    endcase
  end
  always@(rg_addr or result__h19514 or result__h19542)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d334 =
	      result__h19514;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d334 =
	      result__h19542;
      default: IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d334 =
		   64'd0;
    endcase
  end
  always@(rg_addr or result__h19447 or result__h19475)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result9447_0x4_re_ETC__q29 =
	      result__h19447;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result9447_0x4_re_ETC__q29 =
	      result__h19475;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result9447_0x4_re_ETC__q29 =
		   64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d283 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d313 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result9447_0x4_re_ETC__q29 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_ram_ETC___d336 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d300 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d322 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d334)
  begin
    case (rg_f3)
      3'b0:
	  IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC___d343 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d283;
      3'b001:
	  IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC___d343 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d313;
      3'b010:
	  IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC___d343 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result9447_0x4_re_ETC__q29;
      3'b011:
	  IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC___d343 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_ram_ETC___d336;
      3'b100:
	  IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC___d343 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d300;
      3'b101:
	  IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC___d343 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d322;
      3'b110:
	  IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC___d343 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d334;
      3'd7: IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC___d343 = 64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d283 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d313 or
	  w1___1__h23930 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_ram_ETC___d336 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d300 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d322 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d334)
  begin
    case (rg_f3)
      3'b0:
	  w1__h23859 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d283;
      3'b001:
	  w1__h23859 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d313;
      3'b010: w1__h23859 = w1___1__h23930;
      3'b011:
	  w1__h23859 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_ram_ETC___d336;
      3'b100:
	  w1__h23859 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d300;
      3'b101:
	  w1__h23859 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d322;
      3'b110:
	  w1__h23859 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d334;
      3'd7: w1__h23859 = 64'd0;
    endcase
  end
  always@(rg_addr or old_word64__h20782 or rg_st_amo_val)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d433 =
	      { old_word64__h20782[63:16], rg_st_amo_val[15:0] };
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d433 =
	      { old_word64__h20782[63:32],
		rg_st_amo_val[15:0],
		old_word64__h20782[15:0] };
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d433 =
	      { old_word64__h20782[63:48],
		rg_st_amo_val[15:0],
		old_word64__h20782[31:0] };
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d433 =
	      { rg_st_amo_val[15:0], old_word64__h20782[47:0] };
      default: IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d433 =
		   old_word64__h20782;
    endcase
  end
  always@(rg_addr or old_word64__h20782 or rg_st_amo_val)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d424 =
	      { old_word64__h20782[63:8], rg_st_amo_val[7:0] };
      3'h1:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d424 =
	      { old_word64__h20782[63:16],
		rg_st_amo_val[7:0],
		old_word64__h20782[7:0] };
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d424 =
	      { old_word64__h20782[63:24],
		rg_st_amo_val[7:0],
		old_word64__h20782[15:0] };
      3'h3:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d424 =
	      { old_word64__h20782[63:32],
		rg_st_amo_val[7:0],
		old_word64__h20782[23:0] };
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d424 =
	      { old_word64__h20782[63:40],
		rg_st_amo_val[7:0],
		old_word64__h20782[31:0] };
      3'h5:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d424 =
	      { old_word64__h20782[63:48],
		rg_st_amo_val[7:0],
		old_word64__h20782[39:0] };
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d424 =
	      { old_word64__h20782[63:56],
		rg_st_amo_val[7:0],
		old_word64__h20782[47:0] };
      3'h7:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d424 =
	      { rg_st_amo_val[7:0], old_word64__h20782[55:0] };
    endcase
  end
  always@(rg_addr or old_word64__h20782 or rg_st_amo_val)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_word640782_BI_ETC__q30 =
	      { old_word64__h20782[63:32], rg_st_amo_val[31:0] };
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_word640782_BI_ETC__q30 =
	      { rg_st_amo_val[31:0], old_word64__h20782[31:0] };
      default: CASE_rg_addr_BITS_2_TO_0_0x0_old_word640782_BI_ETC__q30 =
		   old_word64__h20782;
    endcase
  end
  always@(rg_f3 or
	  old_word64__h20782 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d424 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d433 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_word640782_BI_ETC__q30 or
	  rg_st_amo_val)
  begin
    case (rg_f3)
      3'b0:
	  n__h20793 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d424;
      3'b001:
	  n__h20793 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d433;
      3'b010:
	  n__h20793 = CASE_rg_addr_BITS_2_TO_0_0x0_old_word640782_BI_ETC__q30;
      3'b011: n__h20793 = rg_st_amo_val;
      default: n__h20793 = old_word64__h20782;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d283 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d313 or
	  IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC__q31 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_ram_ETC___d336 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d300 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d322 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d334)
  begin
    case (rg_f3)
      3'b0:
	  IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_IF_rg_f3_50_E_ETC___d382 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d283;
      3'b001:
	  IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_IF_rg_f3_50_E_ETC___d382 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d313;
      3'b010:
	  IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_IF_rg_f3_50_E_ETC___d382 =
	      { {32{IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC__q31[31]}},
		IF_rg_f3_50_EQ_0b0_51_THEN_IF_rg_addr_7_BITS_2_ETC__q31 };
      3'b011:
	  IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_IF_rg_f3_50_E_ETC___d382 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_ram_ETC___d336;
      3'b100:
	  IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_IF_rg_f3_50_E_ETC___d382 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d300;
      3'b101:
	  IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_IF_rg_f3_50_E_ETC___d382 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d322;
      3'b110:
	  IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_IF_rg_f3_50_E_ETC___d382 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d334;
      3'd7: IF_rg_f3_50_EQ_0b10_23_THEN_SEXT_IF_rg_f3_50_E_ETC___d382 = 64'd0;
    endcase
  end
  always@(rg_amo_funct7 or
	  new_st_val__h24970 or
	  new_st_val__h23962 or
	  w2__h32744 or
	  new_st_val__h24942 or
	  new_st_val__h24950 or
	  new_st_val__h24946 or
	  new_st_val__h24965 or new_st_val__h24954 or new_st_val__h24959)
  begin
    case (rg_amo_funct7[6:2])
      5'b0: _theResult_____2__h23867 = new_st_val__h23962;
      5'b00001: _theResult_____2__h23867 = w2__h32744;
      5'b00100: _theResult_____2__h23867 = new_st_val__h24942;
      5'b01000: _theResult_____2__h23867 = new_st_val__h24950;
      5'b01100: _theResult_____2__h23867 = new_st_val__h24946;
      5'b10000: _theResult_____2__h23867 = new_st_val__h24965;
      5'b11000: _theResult_____2__h23867 = new_st_val__h24954;
      5'b11100: _theResult_____2__h23867 = new_st_val__h24959;
      default: _theResult_____2__h23867 = new_st_val__h24970;
    endcase
  end
  always@(rg_addr or old_word64__h20782 or new_st_val__h23565)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d510 =
	      { old_word64__h20782[63:16], new_st_val__h23565[15:0] };
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d510 =
	      { old_word64__h20782[63:32],
		new_st_val__h23565[15:0],
		old_word64__h20782[15:0] };
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d510 =
	      { old_word64__h20782[63:48],
		new_st_val__h23565[15:0],
		old_word64__h20782[31:0] };
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d510 =
	      { new_st_val__h23565[15:0], old_word64__h20782[47:0] };
      default: IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d510 =
		   old_word64__h20782;
    endcase
  end
  always@(rg_addr or old_word64__h20782 or new_st_val__h23565)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d501 =
	      { old_word64__h20782[63:8], new_st_val__h23565[7:0] };
      3'h1:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d501 =
	      { old_word64__h20782[63:16],
		new_st_val__h23565[7:0],
		old_word64__h20782[7:0] };
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d501 =
	      { old_word64__h20782[63:24],
		new_st_val__h23565[7:0],
		old_word64__h20782[15:0] };
      3'h3:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d501 =
	      { old_word64__h20782[63:32],
		new_st_val__h23565[7:0],
		old_word64__h20782[23:0] };
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d501 =
	      { old_word64__h20782[63:40],
		new_st_val__h23565[7:0],
		old_word64__h20782[31:0] };
      3'h5:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d501 =
	      { old_word64__h20782[63:48],
		new_st_val__h23565[7:0],
		old_word64__h20782[39:0] };
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d501 =
	      { old_word64__h20782[63:56],
		new_st_val__h23565[7:0],
		old_word64__h20782[47:0] };
      3'h7:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d501 =
	      { new_st_val__h23565[7:0], old_word64__h20782[55:0] };
    endcase
  end
  always@(rg_addr or old_word64__h20782 or new_st_val__h23565)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_word640782_BI_ETC__q33 =
	      { old_word64__h20782[63:32], new_st_val__h23565[31:0] };
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_word640782_BI_ETC__q33 =
	      { new_st_val__h23565[31:0], old_word64__h20782[31:0] };
      default: CASE_rg_addr_BITS_2_TO_0_0x0_old_word640782_BI_ETC__q33 =
		   old_word64__h20782;
    endcase
  end
  always@(rg_f3 or
	  old_word64__h20782 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d501 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d510 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_word640782_BI_ETC__q33 or
	  new_st_val__h23565)
  begin
    case (rg_f3)
      3'b0:
	  n__h23729 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d501;
      3'b001:
	  n__h23729 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEL_ETC___d510;
      3'b010:
	  n__h23729 = CASE_rg_addr_BITS_2_TO_0_0x0_old_word640782_BI_ETC__q33;
      3'b011: n__h23729 = new_st_val__h23565;
      default: n__h23729 = old_word64__h20782;
    endcase
  end
  always@(rg_addr or
	  result__h31146 or
	  result__h31173 or result__h31200 or result__h31227)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d724 =
	      result__h31146;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d724 =
	      result__h31173;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d724 =
	      result__h31200;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d724 =
	      result__h31227;
      default: IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d724 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h31025 or
	  result__h31052 or result__h31079 or result__h31106)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d716 =
	      result__h31025;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d716 =
	      result__h31052;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d716 =
	      result__h31079;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d716 =
	      result__h31106;
      default: IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d716 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h30792 or
	  result__h30819 or
	  result__h30846 or
	  result__h30873 or
	  result__h30900 or
	  result__h30927 or result__h30954 or result__h30981)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d704 =
	      result__h30792;
      3'h1:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d704 =
	      result__h30819;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d704 =
	      result__h30846;
      3'h3:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d704 =
	      result__h30873;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d704 =
	      result__h30900;
      3'h5:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d704 =
	      result__h30927;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d704 =
	      result__h30954;
      3'h7:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d704 =
	      result__h30981;
    endcase
  end
  always@(rg_addr or
	  result__h30556 or
	  result__h30586 or
	  result__h30613 or
	  result__h30640 or
	  result__h30667 or
	  result__h30694 or result__h30721 or result__h30748)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d688 =
	      result__h30556;
      3'h1:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d688 =
	      result__h30586;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d688 =
	      result__h30613;
      3'h3:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d688 =
	      result__h30640;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d688 =
	      result__h30667;
      3'h5:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d688 =
	      result__h30694;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d688 =
	      result__h30721;
      3'h7:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d688 =
	      result__h30748;
    endcase
  end
  always@(rg_addr or result__h31267 or result__h31294)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1267_0x4_re_ETC__q34 =
	      result__h31267;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1267_0x4_re_ETC__q34 =
	      result__h31294;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result1267_0x4_re_ETC__q34 =
		   64'd0;
    endcase
  end
  always@(rg_addr or result__h31332 or result__h31359)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1332_0x4_re_ETC__q35 =
	      result__h31332;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1332_0x4_re_ETC__q35 =
	      result__h31359;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result1332_0x4_re_ETC__q35 =
		   64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d688 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d716 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1267_0x4_re_ETC__q34 or
	  rg_addr or
	  master_xactor_f_rd_data$D_OUT or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d704 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d724 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1332_0x4_re_ETC__q35)
  begin
    case (rg_f3)
      3'b0:
	  ld_val__h30496 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d688;
      3'b001:
	  ld_val__h30496 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d716;
      3'b010:
	  ld_val__h30496 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result1267_0x4_re_ETC__q34;
      3'b011:
	  ld_val__h30496 =
	      (rg_addr[2:0] == 3'h0) ?
		master_xactor_f_rd_data$D_OUT[66:3] :
		64'd0;
      3'b100:
	  ld_val__h30496 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d704;
      3'b101:
	  ld_val__h30496 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d724;
      3'b110:
	  ld_val__h30496 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result1332_0x4_re_ETC__q35;
      3'd7: ld_val__h30496 = 64'd0;
    endcase
  end
  always@(rg_addr or result__h34612 or result__h34640)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d843 =
	      result__h34612;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d843 =
	      result__h34640;
      default: IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d843 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h34295 or
	  result__h34323 or result__h34351 or result__h34379)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d825 =
	      result__h34295;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d825 =
	      result__h34323;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d825 =
	      result__h34351;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d825 =
	      result__h34379;
      default: IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d825 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h34420 or
	  result__h34448 or result__h34476 or result__h34504)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d833 =
	      result__h34420;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d833 =
	      result__h34448;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d833 =
	      result__h34476;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d833 =
	      result__h34504;
      default: IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d833 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h34054 or
	  result__h34082 or
	  result__h34110 or
	  result__h34138 or
	  result__h34166 or
	  result__h34194 or result__h34222 or result__h34250)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d813 =
	      result__h34054;
      3'h1:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d813 =
	      result__h34082;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d813 =
	      result__h34110;
      3'h3:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d813 =
	      result__h34138;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d813 =
	      result__h34166;
      3'h5:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d813 =
	      result__h34194;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d813 =
	      result__h34222;
      3'h7:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d813 =
	      result__h34250;
    endcase
  end
  always@(rg_addr or
	  result__h32933 or
	  result__h33841 or
	  result__h33869 or
	  result__h33897 or
	  result__h33925 or
	  result__h33953 or result__h33981 or result__h34009)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d797 =
	      result__h32933;
      3'h1:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d797 =
	      result__h33841;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d797 =
	      result__h33869;
      3'h3:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d797 =
	      result__h33897;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d797 =
	      result__h33925;
      3'h5:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d797 =
	      result__h33953;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d797 =
	      result__h33981;
      3'h7:
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d797 =
	      result__h34009;
    endcase
  end
  always@(rg_addr or result__h34545 or result__h34573)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result4545_0x4_re_ETC__q50 =
	      result__h34545;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result4545_0x4_re_ETC__q50 =
	      result__h34573;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result4545_0x4_re_ETC__q50 =
		   64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d797 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d825 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result4545_0x4_re_ETC__q50 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_IF__ETC___d844 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d813 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d833 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d843)
  begin
    case (rg_f3)
      3'b0:
	  w1__h32738 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d797;
      3'b001:
	  w1__h32738 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d825;
      3'b010:
	  w1__h32738 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result4545_0x4_re_ETC__q50;
      3'b011:
	  w1__h32738 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_IF__ETC___d844;
      3'b100:
	  w1__h32738 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d813;
      3'b101:
	  w1__h32738 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d833;
      3'b110:
	  w1__h32738 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d843;
      3'd7: w1__h32738 = 64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d797 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d825 or
	  w1___1__h32813 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_IF__ETC___d844 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d813 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d833 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d843)
  begin
    case (rg_f3)
      3'b0:
	  w1__h32742 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d797;
      3'b001:
	  w1__h32742 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d825;
      3'b010: w1__h32742 = w1___1__h32813;
      3'b011:
	  w1__h32742 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_IF__ETC___d844;
      3'b100:
	  w1__h32742 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d813;
      3'b101:
	  w1__h32742 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d833;
      3'b110:
	  w1__h32742 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d843;
      3'd7: w1__h32742 = 64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d797 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d825 or
	  w12738_BITS_31_TO_0__q51 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_IF__ETC___d844 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d813 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d833 or
	  IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d843)
  begin
    case (rg_f3)
      3'b0:
	  new_ld_val__h32704 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d797;
      3'b001:
	  new_ld_val__h32704 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_SEX_ETC___d825;
      3'b010:
	  new_ld_val__h32704 =
	      { {32{w12738_BITS_31_TO_0__q51[31]}},
		w12738_BITS_31_TO_0__q51 };
      3'b011:
	  new_ld_val__h32704 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_IF__ETC___d844;
      3'b100:
	  new_ld_val__h32704 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d813;
      3'b101:
	  new_ld_val__h32704 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d833;
      3'b110:
	  new_ld_val__h32704 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_0_C_ETC___d843;
      3'd7: new_ld_val__h32704 = 64'd0;
    endcase
  end
  always@(rg_amo_funct7 or
	  new_st_val__h34733 or
	  new_st_val__h32845 or
	  w2__h32744 or
	  new_st_val__h34705 or
	  new_st_val__h34713 or
	  new_st_val__h34709 or
	  new_st_val__h34728 or new_st_val__h34717 or new_st_val__h34722)
  begin
    case (rg_amo_funct7[6:2])
      5'b0: _theResult_____2__h32750 = new_st_val__h32845;
      5'b00001: _theResult_____2__h32750 = w2__h32744;
      5'b00100: _theResult_____2__h32750 = new_st_val__h34705;
      5'b01000: _theResult_____2__h32750 = new_st_val__h34713;
      5'b01100: _theResult_____2__h32750 = new_st_val__h34709;
      5'b10000: _theResult_____2__h32750 = new_st_val__h34728;
      5'b11000: _theResult_____2__h32750 = new_st_val__h34717;
      5'b11100: _theResult_____2__h32750 = new_st_val__h34722;
      default: _theResult_____2__h32750 = new_st_val__h34733;
    endcase
  end
  always@(rg_f3 or IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_1_E_ETC___d351)
  begin
    case (rg_f3)
      3'b0, 3'b001, 3'b010, 3'b011, 3'b100, 3'b101, 3'b110:
	  CASE_rg_f3_0b0_IF_rg_addr_7_BITS_2_TO_0_27_EQ__ETC__q52 =
	      IF_rg_addr_7_BITS_2_TO_0_27_EQ_0x0_52_THEN_1_E_ETC___d351;
      3'd7: CASE_rg_f3_0b0_IF_rg_addr_7_BITS_2_TO_0_27_EQ__ETC__q52 = 64'd0;
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
	rg_lower_word32_full <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_lrsc_valid <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_state <= `BSV_ASSIGNMENT_DELAY 5'd0;
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
	if (rg_lower_word32_full$EN)
	  rg_lower_word32_full <= `BSV_ASSIGNMENT_DELAY
	      rg_lower_word32_full$D_IN;
	if (rg_lrsc_valid$EN)
	  rg_lrsc_valid <= `BSV_ASSIGNMENT_DELAY rg_lrsc_valid$D_IN;
	if (rg_state$EN) rg_state <= `BSV_ASSIGNMENT_DELAY rg_state$D_IN;
      end
    if (rg_addr$EN) rg_addr <= `BSV_ASSIGNMENT_DELAY rg_addr$D_IN;
    if (rg_amo_funct7$EN)
      rg_amo_funct7 <= `BSV_ASSIGNMENT_DELAY rg_amo_funct7$D_IN;
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
    if (rg_word64_set_in_cache$EN)
      rg_word64_set_in_cache <= `BSV_ASSIGNMENT_DELAY
	  rg_word64_set_in_cache$D_IN;
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
    rg_cset_in_cache = 6'h2A;
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
    rg_victim_way = 1'h0;
    rg_word64_set_in_cache = 9'h0AA;
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
	  ctr_wr_rsps_pending_crg == 4'd15)
	begin
	  v__h3069 = $stime;
	  #0;
	end
    v__h3063 = v__h3069 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  ctr_wr_rsps_pending_crg == 4'd15)
	$display("%0d: ERROR: CreditCounter: overflow", v__h3063);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  ctr_wr_rsps_pending_crg == 4'd15)
	$finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", f_fabric_write_reqs$D_OUT[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", x__h2641);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("                       ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", mem_req_wr_data_wdata__h2820);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", mem_req_wr_data_wstrb__h2821);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  cfg_verbosity != 4'd0 &&
	  !f_reset_reqs$D_OUT)
	begin
	  v__h4085 = $stime;
	  #0;
	end
    v__h4079 = v__h4085 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  cfg_verbosity != 4'd0 &&
	  !f_reset_reqs$D_OUT)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_reset: %0d sets x %0d ways: all tag states reset to CTAG_EMPTY",
		   v__h4079,
		   "D_MMU_Cache",
		   $signed(32'd64),
		   $signed(32'd2));
	else
	  $display("%0d: %s.rl_reset: %0d sets x %0d ways: all tag states reset to CTAG_EMPTY",
		   v__h4079,
		   "I_MMU_Cache",
		   $signed(32'd64),
		   $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  f_reset_reqs$D_OUT)
	begin
	  v__h4184 = $stime;
	  #0;
	end
    v__h4178 = v__h4184 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  f_reset_reqs$D_OUT)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_reset: Flushed", v__h4178, "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_reset: Flushed", v__h4178, "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h4333 = $stime;
	  #0;
	end
    v__h4327 = v__h4333 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_probe_and_immed_rsp; eaddr %0h",
		   v__h4327,
		   "D_MMU_Cache",
		   rg_addr);
	else
	  $display("%0d: %s: rl_probe_and_immed_rsp; eaddr %0h",
		   v__h4327,
		   "I_MMU_Cache",
		   rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$display("        eaddr = {CTag 0x%0h  CSet 0x%0h  Word64 0x%0h  Byte 0x%0h}",
		 rg_addr[63:12],
		 rg_addr[11:6],
		 rg_addr[5:3],
		 rg_addr[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("        CSet 0x%0x: (state, tag):", rg_addr[11:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(" (");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  ram_state_and_ctag_cset$DOB[52])
	$write("CTAG_CLEAN");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  !ram_state_and_ctag_cset$DOB[52])
	$write("CTAG_EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  ram_state_and_ctag_cset$DOB[52])
	$write(", 0x%0x", ram_state_and_ctag_cset$DOB[51:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  !ram_state_and_ctag_cset$DOB[52])
	$write(", --");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(")");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(" (");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  ram_state_and_ctag_cset$DOB[105])
	$write("CTAG_CLEAN");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  !ram_state_and_ctag_cset$DOB[105])
	$write("CTAG_EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  ram_state_and_ctag_cset$DOB[105])
	$write(", 0x%0x", ram_state_and_ctag_cset$DOB[104:53]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  !ram_state_and_ctag_cset$DOB[105])
	$write(", --");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(")");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("        CSet 0x%0x, Word64 0x%0x: ",
	       rg_addr[11:6],
	       rg_addr[5:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(" 0x%0x", ram_word64_set$DOB[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(" 0x%0x", ram_word64_set$DOB[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("    TLB result: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("VM_Xlate_Result { ", "outcome: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("VM_XLATE_OK");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "pa: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'hA, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp && dmem_not_imem &&
	  !soc_map$m_is_mem_addr &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$display("    => IO_REQ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d158)
	$display("        ASSERTION ERROR: fn_test_cache_hit_or_miss: multiple hits in set at [%0d] and [%0d]",
		 $signed(32'd1),
		 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d357)
	begin
	  v__h19627 = $stime;
	  #0;
	end
    v__h19621 = v__h19627 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d357)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h19621,
		   "D_MMU_Cache",
		   rg_addr,
		   word64__h5839,
		   64'd0);
	else
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h19621,
		   "I_MMU_Cache",
		   rg_addr,
		   word64__h5839,
		   64'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d365)
	$display("        AMO LR: reserving PA 0x%0h", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d357)
	$display("        Read-hit: addr 0x%0h word64 0x%0h",
		 rg_addr,
		 word64__h5839);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d368)
	$display("        Read Miss: -> CACHE_START_REFILL.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d374)
	$display("        AMO LR: cache refill: cancelling LR/SC reservation for PA 0x%0h",
		 rg_lrsc_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d531)
	$display("        ST: cancelling LR/SC reservation for PA", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op == 2'd2 &&
	  rg_amo_funct7[6:2] == 5'b00011 &&
	  rg_lrsc_valid &&
	  !rg_lrsc_pa_5_EQ_rg_addr_7___d96 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$display("        AMO SC: fail: reserved addr 0x%0h, this address 0x%0h",
		 rg_lrsc_pa,
		 rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op == 2'd2 &&
	  rg_amo_funct7[6:2] == 5'b00011 &&
	  !rg_lrsc_valid &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$display("        AMO SC: fail due to invalid LR/SC reservation");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_53_OR_soc_map_m_is_mem_addr__ETC___d543)
	$display("        AMO SC result = %0d", lrsc_result__h20004);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d546)
	$display("        Write-Cache-Hit: pa 0x%0h word64 0x%0h",
		 rg_addr,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d546)
	$write("        New Word64_Set:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d546)
	$write("        CSet 0x%0x, Word64 0x%0x: ",
	       rg_addr[11:6],
	       rg_addr[5:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d546)
	$write(" 0x%0x",
	       IF_NOT_ram_state_and_ctag_cset_b_read__02_BIT__ETC___d444);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d546)
	$write(" 0x%0x",
	       IF_ram_state_and_ctag_cset_b_read__02_BIT_105__ETC___d443);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d546)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op != 2'd0 &&
	  (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	  (rg_op == 2'd1 ||
	   rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	  NOT_rg_op_1_EQ_2_3_37_OR_NOT_rg_amo_funct7_4_B_ETC___d548)
	$display("        Write-Cache-Miss: pa 0x%0h word64 0x%0h",
		 rg_addr,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d554)
	$display("        Write-Cache-Hit/Miss: eaddr 0x%0h word64 0x%0h",
		 rg_addr,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d554)
	$display("        => rl_write_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op_1_EQ_2_3_AND_rg_amo_funct7_4_BITS_6_TO_2_ETC___d558)
	begin
	  v__h23343 = $stime;
	  #0;
	end
    v__h23337 = v__h23343 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op_1_EQ_2_3_AND_rg_amo_funct7_4_BITS_6_TO_2_ETC___d558)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h23337,
		   "D_MMU_Cache",
		   rg_addr,
		   64'd1,
		   64'd0);
	else
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h23337,
		   "I_MMU_Cache",
		   rg_addr,
		   64'd1,
		   64'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op_1_EQ_2_3_AND_rg_amo_funct7_4_BITS_6_TO_2_ETC___d558)
	$display("        AMO SC: Fail response for addr 0x%0h", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op != 2'd0 &&
	  (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	  rg_op != 2'd1 &&
	  (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	  NOT_ram_state_and_ctag_cset_b_read__02_BIT_52__ETC___d366)
	$display("        AMO Miss: -> CACHE_START_REFILL.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d566)
	$display("        AMO: addr 0x%0h amo_f7 0x%0h f3 %0d rs2_val 0x%0h",
		 rg_addr,
		 rg_amo_funct7,
		 rg_f3,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d566)
	$display("          PA 0x%0h ", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d566)
	$display("          Cache word64 0x%0h, load-result 0x%0h",
		 word64__h5839,
		 word64__h5839);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d566)
	$display("          0x%0h  op  0x%0h -> 0x%0h",
		 word64__h5839,
		 word64__h5839,
		 new_st_val__h23565);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d566)
	$write("          New Word64_Set:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d566)
	$write("        CSet 0x%0x, Word64 0x%0x: ",
	       rg_addr[11:6],
	       rg_addr[5:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d566)
	$write(" 0x%0x",
	       IF_NOT_ram_state_and_ctag_cset_b_read__02_BIT__ETC___d521);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d566)
	$write(" 0x%0x",
	       IF_ram_state_and_ctag_cset_b_read__02_BIT_105__ETC___d520);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_1_EQ_0_2_36_AND_NOT_rg_op_1_EQ_2_3_3_ETC___d566)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op != 2'd0 &&
	  (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	  rg_op != 2'd1 &&
	  (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	  ram_state_and_ctag_cset_b_read__02_BIT_52_03_A_ETC___d568)
	$display("        AMO_op: cancelling LR/SC reservation for PA",
		 rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h26661 = $stime;
	  #0;
	end
    v__h26655 = v__h26661 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_start_cache_refill: ",
		   v__h26655,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_start_cache_refill: ",
		   v__h26655,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("    To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", cline_fabric_addr__h26714);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 8'd7);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 3'b011);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$display("    Victim way %0d; => CACHE_REFILL", tmp__h26877[0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	begin
	  v__h27400 = $stime;
	  #0;
	end
    v__h27394 = v__h27400 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_cache_refill_rsps_loop:",
		   v__h27394,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_cache_refill_rsps_loop:",
		   v__h27394,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[2:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595 &&
	  master_xactor_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595 &&
	  !master_xactor_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h27641 = $stime;
	  #0;
	end
    v__h27635 = v__h27641 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_cache_refill_rsps_loop: FABRIC_RSP_ERR: raising access exception %0d",
		   v__h27635,
		   "D_MMU_Cache",
		   access_exc_code__h2376);
	else
	  $display("%0d: %s.rl_cache_refill_rsps_loop: FABRIC_RSP_ERR: raising access exception %0d",
		   v__h27635,
		   "I_MMU_Cache",
		   access_exc_code__h2376);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  rg_word64_set_in_cache[2:0] == 3'd7 &&
	  (master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	   rg_error_during_refill) &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$display("    => MODULE_EXCEPTION_RSP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  rg_word64_set_in_cache[2:0] == 3'd7 &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !rg_error_during_refill &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$display("    => CACHE_REREQ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$display("        Updating Cache word64_set 0x%0h, word64_in_cline %0d) old => new",
		 rg_word64_set_in_cache,
		 rg_word64_set_in_cache[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write("        CSet 0x%0x, Word64 0x%0x: ",
	       rg_addr[11:6],
	       rg_word64_set_in_cache[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write(" 0x%0x", ram_word64_set$DOB[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write(" 0x%0x", ram_word64_set$DOB[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write("        CSet 0x%0x, Word64 0x%0x: ",
	       rg_addr[11:6],
	       rg_word64_set_in_cache[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write(" 0x%0x",
	       rg_victim_way ?
		 ram_word64_set$DOB[63:0] :
		 master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write(" 0x%0x",
	       rg_victim_way ?
		 master_xactor_f_rd_data$D_OUT[66:3] :
		 ram_word64_set$DOB[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__9_ULE_2_94___d595)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_rereq && NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$display("    fa_req_ram_B tagCSet [0x%0x] word64_set [0x%0d]",
		 rg_addr[11:6],
		 rg_addr[11:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h30037 = $stime;
	  #0;
	end
    v__h30031 = v__h30037 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_read_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h30031,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_read_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h30031,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", value__h32290);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h30387 = $stime;
	  #0;
	end
    v__h30381 = v__h30387 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h30381,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h30381,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[2:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  master_xactor_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  !master_xactor_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h31489 = $stime;
	  #0;
	end
    v__h31483 = v__h31489 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h31483,
		   "D_MMU_Cache",
		   rg_addr,
		   ld_val__h30496);
	else
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h31483,
		   "I_MMU_Cache",
		   rg_addr,
		   ld_val__h30496);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h31596 = $stime;
	  #0;
	end
    v__h31590 = v__h31596 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_read_rsp: FABRIC_RSP_ERR: raising trap LOAD_ACCESS_FAULT",
		   v__h31590,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_io_read_rsp: FABRIC_RSP_ERR: raising trap LOAD_ACCESS_FAULT",
		   v__h31590,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_maintain_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h31701 = $stime;
	  #0;
	end
    v__h31695 = v__h31701 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_maintain_io_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h31695,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_ld_val);
	else
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h31695,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_ld_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h31781 = $stime;
	  #0;
	end
    v__h31775 = v__h31781 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_io_write_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h31775,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
	else
	  $display("%0d: %s: rl_io_write_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h31775,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_write_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$display("    => rl_ST_AMO_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h31991 = $stime;
	  #0;
	end
    v__h31985 = v__h31991 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_io_AMO_SC_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h31985,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
	else
	  $display("%0d: %s: rl_io_AMO_SC_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h31985,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$display("    FAIL due to I/O address.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$display("    => rl_ST_AMO_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h32109 = $stime;
	  #0;
	end
    v__h32103 = v__h32109 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_AMO_op_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h32103,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_AMO_op_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h32103,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", value__h32290);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h32403 = $stime;
	  #0;
	end
    v__h32397 = v__h32403 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_AMO_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h32397,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_AMO_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h32397,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[2:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  master_xactor_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  !master_xactor_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h32578 = $stime;
	  #0;
	end
    v__h32572 = v__h32578 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_io_AMO_read_rsp; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h32572,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
	else
	  $display("%0d: %s: rl_io_AMO_read_rsp; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h32572,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h34837 = $stime;
	  #0;
	end
    v__h34831 = v__h34837 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h34831,
		   "D_MMU_Cache",
		   rg_addr,
		   new_ld_val__h32704);
	else
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h34831,
		   "I_MMU_Cache",
		   rg_addr,
		   new_ld_val__h32704);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$display("    => rl_ST_AMO_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h32674 = $stime;
	  #0;
	end
    v__h32668 = v__h32674 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_AMO_read_rsp: FABRIC_RSP_ERR: raising trap STORE_AMO_ACCESS_FAULT",
		   v__h32668,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_io_AMO_read_rsp: FABRIC_RSP_ERR: raising trap STORE_AMO_ACCESS_FAULT",
		   v__h32668,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h35444 = $stime;
	  #0;
	end
    v__h35438 = v__h35444 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	if (dmem_not_imem)
	  $write("%0d: %s.rl_discard_write_rsp: pending %0d ",
		 v__h35438,
		 "D_MMU_Cache",
		 $unsigned(b__h26615));
	else
	  $write("%0d: %s.rl_discard_write_rsp: pending %0d ",
		 v__h35438,
		 "I_MMU_Cache",
		 $unsigned(b__h26615));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", master_xactor_f_wr_resp$D_OUT[5:2]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", master_xactor_f_wr_resp$D_OUT[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	begin
	  v__h35405 = $stime;
	  #0;
	end
    v__h35399 = v__h35405 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_discard_write_rsp: fabric response error: exit",
		   v__h35399,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_discard_write_rsp: fabric response error: exit",
		   v__h35399,
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
	  v__h3617 = $stime;
	  #0;
	end
    v__h3611 = v__h3617 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_reset)
	if (dmem_not_imem)
	  $display("%0d: %s: cache size %0d KB, associativity %0d, line size %0d bytes (= %0d XLEN words)",
		   v__h3611,
		   "D_MMU_Cache",
		   $signed(32'd8),
		   $signed(32'd2),
		   $signed(32'd64),
		   $signed(32'd8));
	else
	  $display("%0d: %s: cache size %0d KB, associativity %0d, line size %0d bytes (= %0d XLEN words)",
		   v__h3611,
		   "I_MMU_Cache",
		   $signed(32'd8),
		   $signed(32'd2),
		   $signed(32'd64),
		   $signed(32'd8));
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	begin
	  v__h35793 = $stime;
	  #0;
	end
    v__h35787 = v__h35793 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("%0d: %m.req: op:", v__h35787);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__9_ULE_1_0___d41 && req_op == 2'd0)
	$write("CACHE_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__9_ULE_1_0___d41 && req_op == 2'd1)
	$write("CACHE_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  req_op != 2'd0 &&
	  req_op != 2'd1)
	$write("CACHE_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(" f3:%0d addr:0x%0h st_value:0x%0h",
	       req_f3,
	       req_addr,
	       req_st_value,
	       "\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write("    priv:");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  req_priv == 2'b0)
	$write("U");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  req_priv == 2'b01)
	$write("S");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  req_priv == 2'b11)
	$write("M");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__9_ULE_1_0___d41 &&
	  req_priv != 2'b0 &&
	  req_priv != 2'b01 &&
	  req_priv != 2'b11)
	$write("RESERVED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$write(" sstatus_SUM:%0d mstatus_MXR:%0d satp:0x%0h",
	       req_sstatus_SUM,
	       req_mstatus_MXR,
	       req_satp,
	       "\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$display("    amo_funct7 = 0x%0h", req_amo_funct7);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req &&
	  req_f3_BITS_1_TO_0_29_EQ_0b0_30_OR_req_f3_BITS_ETC___d959 &&
	  NOT_cfg_verbosity_read__9_ULE_1_0___d41)
	$display("    fa_req_ram_B tagCSet [0x%0x] word64_set [0x%0d]",
		 req_addr[11:6],
		 req_addr[11:3]);
  end
  // synopsys translate_on
endmodule