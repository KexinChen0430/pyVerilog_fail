module outputs
  reg [63 : 0] word64;
  wire [63 : 0] mem_master_araddr,
		mem_master_awaddr,
		mem_master_wdata,
		st_amo_val;
  wire [31 : 0] addr;
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
  reg [31 : 0] rg_addr;
  wire [31 : 0] rg_addr$D_IN;
  wire rg_addr$EN;
  // register rg_amo_funct7
  reg [6 : 0] rg_amo_funct7;
  wire [6 : 0] rg_amo_funct7$D_IN;
  wire rg_amo_funct7$EN;
  // register rg_cset_in_cache
  reg [6 : 0] rg_cset_in_cache;
  wire [6 : 0] rg_cset_in_cache$D_IN;
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
  reg [31 : 0] rg_lrsc_pa;
  wire [31 : 0] rg_lrsc_pa$D_IN;
  wire rg_lrsc_pa$EN;
  // register rg_lrsc_valid
  reg rg_lrsc_valid;
  wire rg_lrsc_valid$D_IN, rg_lrsc_valid$EN;
  // register rg_op
  reg [1 : 0] rg_op;
  wire [1 : 0] rg_op$D_IN;
  wire rg_op$EN;
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
  // register rg_victim_way
  reg rg_victim_way;
  wire rg_victim_way$D_IN, rg_victim_way$EN;
  // register rg_word64_set_in_cache
  reg [8 : 0] rg_word64_set_in_cache;
  wire [8 : 0] rg_word64_set_in_cache$D_IN;
  wire rg_word64_set_in_cache$EN;
  // ports of submodule f_fabric_write_reqs
  reg [98 : 0] f_fabric_write_reqs$D_IN;
  wire [98 : 0] f_fabric_write_reqs$D_OUT;
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
  wire [45 : 0] ram_state_and_ctag_cset$DIA,
		ram_state_and_ctag_cset$DIB,
		ram_state_and_ctag_cset$DOB;
  wire [6 : 0] ram_state_and_ctag_cset$ADDRA, ram_state_and_ctag_cset$ADDRB;
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
  wire [127 : 0] MUX_ram_word64_set$a_put_3__VAL_1,
		 MUX_ram_word64_set$a_put_3__VAL_2;
  wire [98 : 0] MUX_f_fabric_write_reqs$enq_1__VAL_1,
		MUX_f_fabric_write_reqs$enq_1__VAL_2,
		MUX_f_fabric_write_reqs$enq_1__VAL_3;
  wire [96 : 0] MUX_master_xactor_f_rd_addr$enq_1__VAL_1,
		MUX_master_xactor_f_rd_addr$enq_1__VAL_2;
  wire [63 : 0] MUX_dw_output_ld_val$wset_1__VAL_3,
		MUX_rg_ld_val$write_1__VAL_2;
  wire [45 : 0] MUX_ram_state_and_ctag_cset$a_put_3__VAL_1;
  wire [8 : 0] MUX_ram_word64_set$b_put_2__VAL_2,
	       MUX_ram_word64_set$b_put_2__VAL_4;
  wire [6 : 0] MUX_rg_cset_in_cache$write_1__VAL_1;
  wire [3 : 0] MUX_rg_exc_code$write_1__VAL_1,
	       MUX_rg_state$write_1__VAL_1,
	       MUX_rg_state$write_1__VAL_10,
	       MUX_rg_state$write_1__VAL_12,
	       MUX_rg_state$write_1__VAL_3;
  wire MUX_dw_output_ld_val$wset_1__SEL_1,
       MUX_dw_output_ld_val$wset_1__SEL_2,
       MUX_dw_output_ld_val$wset_1__SEL_3,
       MUX_dw_output_ld_val$wset_1__SEL_4,
       MUX_f_fabric_write_reqs$enq_1__SEL_2,
       MUX_master_xactor_f_rd_addr$enq_1__SEL_1,
       MUX_ram_state_and_ctag_cset$a_put_1__SEL_1,
       MUX_ram_state_and_ctag_cset$b_put_1__SEL_1,
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
  reg [31 : 0] v__h4093;
  reg [31 : 0] v__h4192;
  reg [31 : 0] v__h4341;
  reg [31 : 0] v__h19635;
  reg [31 : 0] v__h23351;
  reg [31 : 0] v__h26669;
  reg [31 : 0] v__h27408;
  reg [31 : 0] v__h27649;
  reg [31 : 0] v__h30045;
  reg [31 : 0] v__h30395;
  reg [31 : 0] v__h31495;
  reg [31 : 0] v__h31602;
  reg [31 : 0] v__h31707;
  reg [31 : 0] v__h31787;
  reg [31 : 0] v__h31997;
  reg [31 : 0] v__h32115;
  reg [31 : 0] v__h32409;
  reg [31 : 0] v__h32584;
  reg [31 : 0] v__h34843;
  reg [31 : 0] v__h32680;
  reg [31 : 0] v__h35450;
  reg [31 : 0] v__h35411;
  reg [31 : 0] v__h3625;
  reg [31 : 0] v__h35798;
  reg [31 : 0] v__h3619;
  reg [31 : 0] v__h4087;
  reg [31 : 0] v__h4186;
  reg [31 : 0] v__h4335;
  reg [31 : 0] v__h19629;
  reg [31 : 0] v__h23345;
  reg [31 : 0] v__h26663;
  reg [31 : 0] v__h27402;
  reg [31 : 0] v__h27643;
  reg [31 : 0] v__h30039;
  reg [31 : 0] v__h30389;
  reg [31 : 0] v__h31489;
  reg [31 : 0] v__h31596;
  reg [31 : 0] v__h31701;
  reg [31 : 0] v__h31781;
  reg [31 : 0] v__h31991;
  reg [31 : 0] v__h32109;
  reg [31 : 0] v__h32403;
  reg [31 : 0] v__h32578;
  reg [31 : 0] v__h32674;
  reg [31 : 0] v__h34837;
  reg [31 : 0] v__h35405;
  reg [31 : 0] v__h35444;
  reg [31 : 0] v__h35792;
  // synopsys translate_on
  // remaining internal signals
  reg [63 : 0] CASE_rg_addr_BITS_2_TO_0_0x0_old_word640790_BI_ETC__q30,
	       CASE_rg_addr_BITS_2_TO_0_0x0_old_word640790_BI_ETC__q33,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result1275_0x4_re_ETC__q34,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result1340_0x4_re_ETC__q35,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result4551_0x4_re_ETC__q50,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result9455_0x4_re_ETC__q29,
	       CASE_rg_f3_0b0_IF_rg_addr_9_BITS_2_TO_0_31_EQ__ETC__q52,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d304,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d326,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d338,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d711,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d731,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d820,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d840,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d850,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d428,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d437,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d505,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d514,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d287,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d317,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d695,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d723,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d804,
	       IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d832,
	       IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC___d347,
	       IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_IF_rg_f3_54_E_ETC___d386,
	       _theResult_____2__h23875,
	       _theResult_____2__h32756,
	       ld_val__h30504,
	       mem_req_wr_data_wdata__h2818,
	       n__h20801,
	       n__h23737,
	       new_ld_val__h32710,
	       old_word64__h20790,
	       w1__h23867,
	       w1__h32744,
	       w1__h32748;
  reg [7 : 0] mem_req_wr_data_wstrb__h2819;
  reg [2 : 0] value__h32296, x__h2639;
  wire [63 : 0] IF_NOT_ram_state_and_ctag_cset_b_read__05_BIT__ETC___d448,
		IF_NOT_ram_state_and_ctag_cset_b_read__05_BIT__ETC___d525,
		IF_ram_state_and_ctag_cset_b_read__05_BIT_45_1_ETC___d447,
		IF_ram_state_and_ctag_cset_b_read__05_BIT_45_1_ETC___d524,
		IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_1_E_ETC___d355,
		IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_IF__ETC___d851,
		IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_ram_ETC___d340,
		IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_rg_st_amo_val_ETC___d455,
		IF_rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_ETC___d532,
		_theResult___snd_fst__h2826,
		cline_fabric_addr__h26722,
		fabric_addr__h32167,
		mem_req_wr_addr_awaddr__h2592,
		new_st_val__h23573,
		new_st_val__h23879,
		new_st_val__h23970,
		new_st_val__h24950,
		new_st_val__h24954,
		new_st_val__h24958,
		new_st_val__h24962,
		new_st_val__h24967,
		new_st_val__h24973,
		new_st_val__h24978,
		new_st_val__h32760,
		new_st_val__h32851,
		new_st_val__h34711,
		new_st_val__h34715,
		new_st_val__h34719,
		new_st_val__h34723,
		new_st_val__h34728,
		new_st_val__h34734,
		new_st_val__h34739,
		new_value__h22441,
		new_value__h6012,
		result__h18723,
		result__h18751,
		result__h18779,
		result__h18807,
		result__h18835,
		result__h18863,
		result__h18891,
		result__h18919,
		result__h18964,
		result__h18992,
		result__h19020,
		result__h19048,
		result__h19076,
		result__h19104,
		result__h19132,
		result__h19160,
		result__h19205,
		result__h19233,
		result__h19261,
		result__h19289,
		result__h19330,
		result__h19358,
		result__h19386,
		result__h19414,
		result__h19455,
		result__h19483,
		result__h19522,
		result__h19550,
		result__h30564,
		result__h30594,
		result__h30621,
		result__h30648,
		result__h30675,
		result__h30702,
		result__h30729,
		result__h30756,
		result__h30800,
		result__h30827,
		result__h30854,
		result__h30881,
		result__h30908,
		result__h30935,
		result__h30962,
		result__h30989,
		result__h31033,
		result__h31060,
		result__h31087,
		result__h31114,
		result__h31154,
		result__h31181,
		result__h31208,
		result__h31235,
		result__h31275,
		result__h31302,
		result__h31340,
		result__h31367,
		result__h32939,
		result__h33847,
		result__h33875,
		result__h33903,
		result__h33931,
		result__h33959,
		result__h33987,
		result__h34015,
		result__h34060,
		result__h34088,
		result__h34116,
		result__h34144,
		result__h34172,
		result__h34200,
		result__h34228,
		result__h34256,
		result__h34301,
		result__h34329,
		result__h34357,
		result__h34385,
		result__h34426,
		result__h34454,
		result__h34482,
		result__h34510,
		result__h34551,
		result__h34579,
		result__h34618,
		result__h34646,
		w1___1__h23938,
		w1___1__h32819,
		w2___1__h32820,
		w2__h32750,
		word64__h5847,
		x__h20022,
		x__h32739,
		x__h6037,
		y__h12367,
		y__h6038,
		y__h6052;
  wire [31 : 0] IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC__q31,
		cline_addr__h26721,
		ld_val0504_BITS_31_TO_0__q38,
		ld_val0504_BITS_63_TO_32__q45,
		master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3,
		master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10,
		rg_st_amo_val_BITS_31_TO_0__q32,
		w12744_BITS_31_TO_0__q51,
		word64847_BITS_31_TO_0__q17,
		word64847_BITS_63_TO_32__q24;
  wire [21 : 0] n_ctag__h27950, pa_ctag__h5533;
  wire [15 : 0] ld_val0504_BITS_15_TO_0__q37,
		ld_val0504_BITS_31_TO_16__q41,
		ld_val0504_BITS_47_TO_32__q44,
		ld_val0504_BITS_63_TO_48__q48,
		master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2,
		master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q7,
		master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q9,
		master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13,
		word64847_BITS_15_TO_0__q16,
		word64847_BITS_31_TO_16__q20,
		word64847_BITS_47_TO_32__q23,
		word64847_BITS_63_TO_48__q27;
  wire [7 : 0] ld_val0504_BITS_15_TO_8__q39,
	       ld_val0504_BITS_23_TO_16__q40,
	       ld_val0504_BITS_31_TO_24__q42,
	       ld_val0504_BITS_39_TO_32__q43,
	       ld_val0504_BITS_47_TO_40__q46,
	       ld_val0504_BITS_55_TO_48__q47,
	       ld_val0504_BITS_63_TO_56__q49,
	       ld_val0504_BITS_7_TO_0__q36,
	       master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1,
	       master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4,
	       master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q6,
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q8,
	       master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q5,
	       master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11,
	       master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12,
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14,
	       strobe64__h2756,
	       strobe64__h2758,
	       strobe64__h2760,
	       word64847_BITS_15_TO_8__q18,
	       word64847_BITS_23_TO_16__q19,
	       word64847_BITS_31_TO_24__q21,
	       word64847_BITS_39_TO_32__q22,
	       word64847_BITS_47_TO_40__q25,
	       word64847_BITS_55_TO_48__q26,
	       word64847_BITS_63_TO_56__q28,
	       word64847_BITS_7_TO_0__q15;
  wire [5 : 0] shift_bits__h2606;
  wire [3 : 0] IF_NOT_ram_state_and_ctag_cset_b_read__05_BIT__ETC___d152,
	       IF_rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_ETC___d154,
	       IF_rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_ETC___d153,
	       access_exc_code__h2374,
	       b__h26623;
  wire [1 : 0] tmp__h26884, tmp__h26885;
  wire IF_rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_ETC___d122,
       NOT_cfg_verbosity_read__0_ULE_1_1___d42,
       NOT_cfg_verbosity_read__0_ULE_2_99___d600,
       NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d162,
       NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d361,
       NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d369,
       NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d372,
       NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d378,
       NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d382,
       NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d393,
       NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d535,
       NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d547,
       NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d577,
       NOT_ram_state_and_ctag_cset_b_read__05_BIT_22__ETC___d121,
       NOT_ram_state_and_ctag_cset_b_read__05_BIT_22__ETC___d168,
       NOT_ram_state_and_ctag_cset_b_read__05_BIT_22__ETC___d370,
       NOT_ram_state_and_ctag_cset_b_read__05_BIT_22__ETC___d375,
       NOT_req_f3_BITS_1_TO_0_36_EQ_0b0_37_38_AND_NOT_ETC___d957,
       NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d149,
       NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d530,
       NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d550,
       NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d558,
       NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d570,
       NOT_rg_op_4_EQ_1_2_74_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d390,
       NOT_rg_op_4_EQ_1_2_74_AND_ram_state_and_ctag_c_ETC___d379,
       NOT_rg_op_4_EQ_2_6_41_OR_NOT_rg_amo_funct7_7_B_ETC___d388,
       NOT_rg_op_4_EQ_2_6_41_OR_NOT_rg_amo_funct7_7_B_ETC___d548,
       NOT_rg_op_4_EQ_2_6_41_OR_NOT_rg_amo_funct7_7_B_ETC___d552,
       NOT_rg_op_4_EQ_2_6_41_OR_NOT_rg_amo_funct7_7_B_ETC___d556,
       dmem_not_imem_AND_NOT_soc_map_m_is_mem_addr_0__ETC___d124,
       lrsc_result__h20012,
       ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111,
       ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117,
       ram_state_and_ctag_cset_b_read__05_BIT_22_06_A_ETC___d165,
       ram_state_and_ctag_cset_b_read__05_BIT_22_06_A_ETC___d176,
       ram_state_and_ctag_cset_b_read__05_BIT_22_06_A_ETC___d359,
       ram_state_and_ctag_cset_b_read__05_BIT_22_06_A_ETC___d572,
       req_f3_BITS_1_TO_0_36_EQ_0b0_37_OR_req_f3_BITS_ETC___d966,
       rg_addr_9_EQ_rg_lrsc_pa_8___d166,
       rg_amo_funct7_7_BITS_6_TO_2_8_EQ_0b10_9_AND_ra_ETC___d364,
       rg_lrsc_pa_8_EQ_rg_addr_9___d99,
       rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d139,
       rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d170,
       rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d180,
       rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d182,
       rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d185,
       rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d178,
       rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d391,
       rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d528,
       rg_op_4_EQ_2_6_AND_rg_amo_funct7_7_BITS_6_TO_2_ETC___d562,
       rg_state_5_EQ_12_50_AND_rg_op_4_EQ_0_5_OR_rg_o_ETC___d652;
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
	  ld_val__h30504 or
	  MUX_dw_output_ld_val$wset_1__SEL_2 or
	  new_ld_val__h32710 or
	  MUX_dw_output_ld_val$wset_1__SEL_3 or
	  MUX_dw_output_ld_val$wset_1__VAL_3 or
	  MUX_dw_output_ld_val$wset_1__SEL_4 or rg_ld_val)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_dw_output_ld_val$wset_1__SEL_1: word64 = ld_val__h30504;
      MUX_dw_output_ld_val$wset_1__SEL_2: word64 = new_ld_val__h32710;
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
  // submodule ram_state_and_ctag_cset
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd7),
	  .DATA_WIDTH(32'd46),
	  .MEMSIZE(8'd128)) ram_state_and_ctag_cset(.CLKA(CLK),
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
	     ctr_wr_rsps_pending_crg != 4'd15 &&
	     f_fabric_write_reqs$EMPTY_N &&
	     master_xactor_f_wr_addr$FULL_N &&
	     master_xactor_f_wr_data$FULL_N ;
  assign WILL_FIRE_RL_rl_fabric_send_write_req =
	     CAN_FIRE_RL_rl_fabric_send_write_req ;
  // rule RL_rl_reset
  assign CAN_FIRE_RL_rl_reset =
	     (rg_cset_in_cache != 7'd127 ||
	      f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N) &&
	     rg_state == 4'd1 ;
  assign WILL_FIRE_RL_rl_reset = CAN_FIRE_RL_rl_reset ;
  // rule RL_rl_probe_and_immed_rsp
  assign CAN_FIRE_RL_rl_probe_and_immed_rsp =
	     dmem_not_imem_AND_NOT_soc_map_m_is_mem_addr_0__ETC___d124 &&
	     rg_state == 4'd3 ;
  assign WILL_FIRE_RL_rl_probe_and_immed_rsp =
	     CAN_FIRE_RL_rl_probe_and_immed_rsp &&
	     !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_start_cache_refill
  assign CAN_FIRE_RL_rl_start_cache_refill =
	     master_xactor_f_rd_addr$FULL_N && rg_state == 4'd8 &&
	     b__h26623 == 4'd0 ;
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
	     master_xactor_f_rd_addr$FULL_N &&
	     rg_state_5_EQ_12_50_AND_rg_op_4_EQ_0_5_OR_rg_o_ETC___d652 ;
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
	     f_fabric_write_reqs$FULL_N && rg_state == 4'd12 &&
	     rg_op == 2'd1 ;
  assign WILL_FIRE_RL_rl_io_write_req =
	     CAN_FIRE_RL_rl_io_write_req && !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_io_AMO_SC_req
  assign CAN_FIRE_RL_rl_io_AMO_SC_req =
	     rg_state == 4'd12 && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00011 ;
  assign WILL_FIRE_RL_rl_io_AMO_SC_req =
	     CAN_FIRE_RL_rl_io_AMO_SC_req && !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_io_AMO_op_req
  assign CAN_FIRE_RL_rl_io_AMO_op_req =
	     master_xactor_f_rd_addr$FULL_N && rg_state == 4'd12 &&
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
	     rg_state == 4'd15 ;
  assign WILL_FIRE_RL_rl_io_AMO_read_rsp = MUX_rg_state$write_1__SEL_3 ;
  // rule RL_rl_discard_write_rsp
  assign CAN_FIRE_RL_rl_discard_write_rsp =
	     b__h26623 != 4'd0 && master_xactor_f_wr_resp$EMPTY_N ;
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
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_dw_output_ld_val$wset_1__SEL_3 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d185 ;
  assign MUX_dw_output_ld_val$wset_1__SEL_4 =
	     WILL_FIRE_RL_rl_maintain_io_read_rsp ||
	     WILL_FIRE_RL_rl_ST_AMO_response ;
  assign MUX_f_fabric_write_reqs$enq_1__SEL_2 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d530 ;
  assign MUX_master_xactor_f_rd_addr$enq_1__SEL_1 =
	     WILL_FIRE_RL_rl_io_AMO_op_req || WILL_FIRE_RL_rl_io_read_req ;
  assign MUX_ram_state_and_ctag_cset$a_put_1__SEL_1 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_word64_set_in_cache[1:0] == 2'd0 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_ram_state_and_ctag_cset$b_put_1__SEL_1 =
	     EN_req &&
	     req_f3_BITS_1_TO_0_36_EQ_0b0_37_OR_req_f3_BITS_ETC___d966 ;
  assign MUX_ram_word64_set$a_put_1__SEL_1 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_ram_word64_set$b_put_1__SEL_2 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_word64_set_in_cache[1:0] != 2'd3 ;
  assign MUX_rg_error_during_refill$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign MUX_rg_exc_code$write_1__SEL_1 =
	     EN_req &&
	     NOT_req_f3_BITS_1_TO_0_36_EQ_0b0_37_38_AND_NOT_ETC___d957 ;
  assign MUX_rg_exc_code$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign MUX_rg_exc_code$write_1__SEL_3 =
	     WILL_FIRE_RL_rl_io_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign MUX_rg_ld_val$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d382 ;
  assign MUX_rg_lrsc_valid$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d180 ;
  assign MUX_rg_state$write_1__SEL_2 =
	     f_reset_reqs$EMPTY_N && rg_state != 4'd1 ;
  assign MUX_rg_state$write_1__SEL_3 =
	     CAN_FIRE_RL_rl_io_AMO_read_rsp && !WILL_FIRE_RL_rl_start_reset ;
  assign MUX_rg_state$write_1__SEL_10 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_word64_set_in_cache[1:0] == 2'd3 ;
  assign MUX_rg_state$write_1__SEL_12 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (dmem_not_imem && !soc_map$m_is_mem_addr ||
	      rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d139 ||
	      NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d149) ;
  assign MUX_rg_state$write_1__SEL_13 =
	     WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 7'd127 ;
  assign MUX_dw_output_ld_val$wset_1__VAL_3 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) ?
	       new_value__h6012 :
	       new_value__h22441 ;
  assign MUX_f_fabric_write_reqs$enq_1__VAL_1 = { rg_f3, rg_pa, x__h32739 } ;
  assign MUX_f_fabric_write_reqs$enq_1__VAL_2 =
	     { rg_f3,
	       rg_addr,
	       IF_rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_ETC___d532 } ;
  assign MUX_f_fabric_write_reqs$enq_1__VAL_3 =
	     { rg_f3, rg_pa, rg_st_amo_val } ;
  assign MUX_master_xactor_f_rd_addr$enq_1__VAL_1 =
	     { 4'd0, fabric_addr__h32167, 8'd0, value__h32296, 18'd65536 } ;
  assign MUX_master_xactor_f_rd_addr$enq_1__VAL_2 =
	     { 4'd0, cline_fabric_addr__h26722, 29'd7143424 } ;
  assign MUX_ram_state_and_ctag_cset$a_put_3__VAL_1 =
	     { rg_victim_way || ram_state_and_ctag_cset$DOB[45],
	       rg_victim_way ?
		 n_ctag__h27950 :
		 ram_state_and_ctag_cset$DOB[44:23],
	       !rg_victim_way || ram_state_and_ctag_cset$DOB[22],
	       rg_victim_way ?
		 ram_state_and_ctag_cset$DOB[21:0] :
		 n_ctag__h27950 } ;
  assign MUX_ram_word64_set$a_put_3__VAL_1 =
	     rg_victim_way ?
	       { master_xactor_f_rd_data$D_OUT[66:3],
		 ram_word64_set$DOB[63:0] } :
	       { ram_word64_set$DOB[127:64],
		 master_xactor_f_rd_data$D_OUT[66:3] } ;
  assign MUX_ram_word64_set$a_put_3__VAL_2 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       { IF_ram_state_and_ctag_cset_b_read__05_BIT_45_1_ETC___d447,
		 IF_NOT_ram_state_and_ctag_cset_b_read__05_BIT__ETC___d448 } :
	       { IF_ram_state_and_ctag_cset_b_read__05_BIT_45_1_ETC___d524,
		 IF_NOT_ram_state_and_ctag_cset_b_read__05_BIT__ETC___d525 } ;
  assign MUX_ram_word64_set$b_put_2__VAL_2 = rg_word64_set_in_cache + 9'd1 ;
  assign MUX_ram_word64_set$b_put_2__VAL_4 = { rg_addr[11:5], 2'd0 } ;
  assign MUX_rg_cset_in_cache$write_1__VAL_1 = rg_cset_in_cache + 7'd1 ;
  assign MUX_rg_exc_code$write_1__VAL_1 = (req_op == 2'd0) ? 4'd4 : 4'd6 ;
  assign MUX_rg_ld_val$write_1__VAL_2 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       x__h20022 :
	       IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_IF_rg_f3_54_E_ETC___d386 ;
  assign MUX_rg_state$write_1__VAL_1 =
	     NOT_req_f3_BITS_1_TO_0_36_EQ_0b0_37_38_AND_NOT_ETC___d957 ?
	       4'd4 :
	       4'd3 ;
  assign MUX_rg_state$write_1__VAL_3 =
	     (master_xactor_f_rd_data$D_OUT[2:1] == 2'b0) ? 4'd14 : 4'd4 ;
  assign MUX_rg_state$write_1__VAL_10 =
	     (master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	      rg_error_during_refill) ?
	       4'd4 :
	       4'd10 ;
  assign MUX_rg_state$write_1__VAL_12 =
	     (dmem_not_imem && !soc_map$m_is_mem_addr) ?
	       4'd12 :
	       IF_rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_ETC___d154 ;
  // inlined wires
  assign dw_valid$whas =
	     (WILL_FIRE_RL_rl_io_AMO_read_rsp ||
	      WILL_FIRE_RL_rl_io_read_rsp) &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d185 ||
	     WILL_FIRE_RL_rl_drive_exception_rsp ||
	     WILL_FIRE_RL_rl_maintain_io_read_rsp ||
	     WILL_FIRE_RL_rl_ST_AMO_response ;
  assign ctr_wr_rsps_pending_crg$port0__write_1 =
	     ctr_wr_rsps_pending_crg + 4'd1 ;
  assign ctr_wr_rsps_pending_crg$port1__write_1 = b__h26623 - 4'd1 ;
  assign ctr_wr_rsps_pending_crg$port2__read =
	     CAN_FIRE_RL_rl_discard_write_rsp ?
	       ctr_wr_rsps_pending_crg$port1__write_1 :
	       b__h26623 ;
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
	       7'd0 ;
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
	  MUX_rg_error_during_refill$write_1__SEL_1 or access_exc_code__h2374)
  case (1'b1)
    MUX_rg_exc_code$write_1__SEL_1:
	rg_exc_code$D_IN = MUX_rg_exc_code$write_1__VAL_1;
    MUX_rg_exc_code$write_1__SEL_2: rg_exc_code$D_IN = 4'd7;
    MUX_rg_exc_code$write_1__SEL_3: rg_exc_code$D_IN = 4'd5;
    MUX_rg_error_during_refill$write_1__SEL_1:
	rg_exc_code$D_IN = access_exc_code__h2374;
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
	     NOT_req_f3_BITS_1_TO_0_36_EQ_0b0_37_38_AND_NOT_ETC___d957 ;
  // register rg_f3
  assign rg_f3$D_IN = req_f3 ;
  assign rg_f3$EN = EN_req ;
  // register rg_ld_val
  always@(MUX_dw_output_ld_val$wset_1__SEL_2 or
	  new_ld_val__h32710 or
	  MUX_rg_ld_val$write_1__SEL_2 or
	  MUX_rg_ld_val$write_1__VAL_2 or
	  WILL_FIRE_RL_rl_io_read_rsp or
	  ld_val__h30504 or WILL_FIRE_RL_rl_io_AMO_SC_req)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_dw_output_ld_val$wset_1__SEL_2: rg_ld_val$D_IN = new_ld_val__h32710;
      MUX_rg_ld_val$write_1__SEL_2:
	  rg_ld_val$D_IN = MUX_rg_ld_val$write_1__VAL_2;
      WILL_FIRE_RL_rl_io_read_rsp: rg_ld_val$D_IN = ld_val__h30504;
      WILL_FIRE_RL_rl_io_AMO_SC_req: rg_ld_val$D_IN = 64'd1;
      default: rg_ld_val$D_IN = 64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign rg_ld_val$EN =
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d382 ||
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
	     rg_amo_funct7_7_BITS_6_TO_2_8_EQ_0b10_9_AND_ra_ETC___d364 ;
  // register rg_lrsc_valid
  assign rg_lrsc_valid$D_IN =
	     MUX_rg_lrsc_valid$write_1__SEL_2 &&
	     rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d182 ;
  assign rg_lrsc_valid$EN =
	     WILL_FIRE_RL_rl_io_read_req && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d180 ||
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
  assign rg_st_amo_val$D_IN = EN_req ? req_st_value : new_st_val__h23573 ;
  assign rg_st_amo_val$EN =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d577 ||
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
    WILL_FIRE_RL_rl_start_reset: rg_state$D_IN = 4'd1;
    WILL_FIRE_RL_rl_io_AMO_read_rsp:
	rg_state$D_IN = MUX_rg_state$write_1__VAL_3;
    WILL_FIRE_RL_rl_io_AMO_op_req: rg_state$D_IN = 4'd15;
    WILL_FIRE_RL_rl_io_AMO_SC_req || WILL_FIRE_RL_rl_io_write_req:
	rg_state$D_IN = 4'd11;
    WILL_FIRE_RL_rl_io_read_rsp: rg_state$D_IN = MUX_rg_state$write_1__VAL_3;
    WILL_FIRE_RL_rl_io_read_req: rg_state$D_IN = 4'd13;
    WILL_FIRE_RL_rl_rereq: rg_state$D_IN = 4'd3;
    MUX_rg_state$write_1__SEL_10:
	rg_state$D_IN = MUX_rg_state$write_1__VAL_10;
    WILL_FIRE_RL_rl_start_cache_refill: rg_state$D_IN = 4'd9;
    MUX_rg_state$write_1__SEL_12:
	rg_state$D_IN = MUX_rg_state$write_1__VAL_12;
    MUX_rg_state$write_1__SEL_13: rg_state$D_IN = 4'd2;
    default: rg_state$D_IN = 4'b1010 /* unspecified value */ ;
  endcase
  assign rg_state$EN =
	     WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 7'd127 ||
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_word64_set_in_cache[1:0] == 2'd3 ||
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
  assign rg_victim_way$D_IN = tmp__h26885[0] ;
  assign rg_victim_way$EN = WILL_FIRE_RL_rl_start_cache_refill ;
  // register rg_word64_set_in_cache
  assign rg_word64_set_in_cache$D_IN =
	     MUX_ram_word64_set$b_put_1__SEL_2 ?
	       MUX_ram_word64_set$b_put_2__VAL_2 :
	       MUX_ram_word64_set$b_put_2__VAL_4 ;
  assign rg_word64_set_in_cache$EN =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_word64_set_in_cache[1:0] != 2'd3 ||
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
		   99'h2AAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign f_fabric_write_reqs$ENQ =
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d530 ||
	     WILL_FIRE_RL_rl_io_write_req ;
  assign f_fabric_write_reqs$DEQ = CAN_FIRE_RL_rl_fabric_send_write_req ;
  assign f_fabric_write_reqs$CLR = 1'b0 ;
  // submodule f_reset_reqs
  assign f_reset_reqs$D_IN = !EN_server_reset_request_put ;
  assign f_reset_reqs$ENQ =
	     EN_server_reset_request_put || EN_server_flush_request_put ;
  assign f_reset_reqs$DEQ =
	     WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 7'd127 ;
  assign f_reset_reqs$CLR = 1'b0 ;
  // submodule f_reset_rsps
  assign f_reset_rsps$D_IN = f_reset_reqs$D_OUT ;
  assign f_reset_rsps$ENQ =
	     WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 7'd127 ;
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
	       mem_req_wr_addr_awaddr__h2592,
	       8'd0,
	       x__h2639,
	       18'd65536 } ;
  assign master_xactor_f_wr_addr$ENQ = CAN_FIRE_RL_rl_fabric_send_write_req ;
  assign master_xactor_f_wr_addr$DEQ =
	     master_xactor_f_wr_addr$EMPTY_N && mem_master_awready ;
  assign master_xactor_f_wr_addr$CLR =
	     WILL_FIRE_RL_rl_start_reset && !f_reset_reqs$D_OUT ;
  // submodule master_xactor_f_wr_data
  assign master_xactor_f_wr_data$D_IN =
	     { mem_req_wr_data_wdata__h2818,
	       mem_req_wr_data_wstrb__h2819,
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
	       rg_addr[11:5] :
	       rg_cset_in_cache ;
  assign ram_state_and_ctag_cset$ADDRB =
	     MUX_ram_state_and_ctag_cset$b_put_1__SEL_1 ?
	       req_addr[11:5] :
	       rg_addr[11:5] ;
  assign ram_state_and_ctag_cset$DIA =
	     MUX_ram_state_and_ctag_cset$a_put_1__SEL_1 ?
	       MUX_ram_state_and_ctag_cset$a_put_3__VAL_1 :
	       46'h1555552AAAAA ;
  assign ram_state_and_ctag_cset$DIB =
	     MUX_ram_state_and_ctag_cset$b_put_1__SEL_1 ?
	       46'h2AAAAAAAAAAA /* unspecified value */  :
	       46'h2AAAAAAAAAAA /* unspecified value */  ;
  assign ram_state_and_ctag_cset$WEA = 1'd1 ;
  assign ram_state_and_ctag_cset$WEB = 1'd0 ;
  assign ram_state_and_ctag_cset$ENA =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_word64_set_in_cache[1:0] == 2'd0 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_reset ;
  assign ram_state_and_ctag_cset$ENB =
	     EN_req &&
	     req_f3_BITS_1_TO_0_36_EQ_0b0_37_OR_req_f3_BITS_ETC___d966 ||
	     WILL_FIRE_RL_rl_rereq ;
  // submodule ram_word64_set
  assign ram_word64_set$ADDRA =
	     MUX_ram_word64_set$a_put_1__SEL_1 ?
	       rg_word64_set_in_cache :
	       rg_addr[11:3] ;
  always@(MUX_ram_state_and_ctag_cset$b_put_1__SEL_1 or
	  req_addr or
	  MUX_ram_word64_set$b_put_1__SEL_2 or
	  MUX_ram_word64_set$b_put_2__VAL_2 or
	  WILL_FIRE_RL_rl_rereq or
	  rg_addr or
	  WILL_FIRE_RL_rl_start_cache_refill or
	  MUX_ram_word64_set$b_put_2__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_ram_state_and_ctag_cset$b_put_1__SEL_1:
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
  always@(MUX_ram_state_and_ctag_cset$b_put_1__SEL_1 or
	  MUX_ram_word64_set$b_put_1__SEL_2 or
	  WILL_FIRE_RL_rl_rereq or WILL_FIRE_RL_rl_start_cache_refill)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_ram_state_and_ctag_cset$b_put_1__SEL_1:
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
	     NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d393 ;
  assign ram_word64_set$ENB =
	     EN_req &&
	     req_f3_BITS_1_TO_0_36_EQ_0b0_37_OR_req_f3_BITS_ETC___d966 ||
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_word64_set_in_cache[1:0] != 2'd3 ||
	     WILL_FIRE_RL_rl_rereq ||
	     WILL_FIRE_RL_rl_start_cache_refill ;
  // submodule soc_map
  assign soc_map$m_is_IO_addr_addr = 64'h0 ;
  assign soc_map$m_is_mem_addr_addr = { 32'd0, rg_addr } ;
  assign soc_map$m_is_near_mem_IO_addr_addr = 64'h0 ;
  // remaining internal signals
  assign IF_NOT_ram_state_and_ctag_cset_b_read__05_BIT__ETC___d152 =
	     ((!ram_state_and_ctag_cset$DOB[22] ||
	       !ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111) &&
	      (!ram_state_and_ctag_cset$DOB[45] ||
	       !ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117)) ?
	       4'd8 :
	       4'd11 ;
  assign IF_NOT_ram_state_and_ctag_cset_b_read__05_BIT__ETC___d448 =
	     (!ram_state_and_ctag_cset$DOB[45] ||
	      !ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) ?
	       n__h20801 :
	       ram_word64_set$DOB[63:0] ;
  assign IF_NOT_ram_state_and_ctag_cset_b_read__05_BIT__ETC___d525 =
	     (!ram_state_and_ctag_cset$DOB[45] ||
	      !ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) ?
	       n__h23737 :
	       ram_word64_set$DOB[63:0] ;
  assign IF_ram_state_and_ctag_cset_b_read__05_BIT_45_1_ETC___d447 =
	     (ram_state_and_ctag_cset$DOB[45] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) ?
	       n__h20801 :
	       ram_word64_set$DOB[127:64] ;
  assign IF_ram_state_and_ctag_cset_b_read__05_BIT_45_1_ETC___d524 =
	     (ram_state_and_ctag_cset$DOB[45] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) ?
	       n__h23737 :
	       ram_word64_set$DOB[127:64] ;
  assign IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_1_E_ETC___d355 =
	     (rg_addr[2:0] == 3'h0) ? 64'd1 : 64'd0 ;
  assign IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_IF__ETC___d851 =
	     (rg_addr[2:0] == 3'h0) ? ld_val__h30504 : 64'd0 ;
  assign IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_ram_ETC___d340 =
	     (rg_addr[2:0] == 3'h0) ? word64__h5847 : 64'd0 ;
  assign IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC__q31 =
	     IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC___d347[31:0] ;
  assign IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_rg_st_amo_val_ETC___d455 =
	     (rg_f3 == 3'b010) ?
	       { {32{rg_st_amo_val_BITS_31_TO_0__q32[31]}},
		 rg_st_amo_val_BITS_31_TO_0__q32 } :
	       rg_st_amo_val ;
  assign IF_rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_ETC___d154 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) ?
	       4'd8 :
	       IF_rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_ETC___d153 ;
  assign IF_rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_ETC___d122 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 &&
	       lrsc_result__h20012 ||
	       f_fabric_write_reqs$FULL_N :
	       NOT_ram_state_and_ctag_cset_b_read__05_BIT_22__ETC___d121 ;
  assign IF_rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_ETC___d153 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       4'd11 :
	       IF_NOT_ram_state_and_ctag_cset_b_read__05_BIT__ETC___d152 ;
  assign IF_rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_ETC___d532 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       rg_st_amo_val :
	       new_st_val__h23573 ;
  assign NOT_cfg_verbosity_read__0_ULE_1_1___d42 = cfg_verbosity > 4'd1 ;
  assign NOT_cfg_verbosity_read__0_ULE_2_99___d600 = cfg_verbosity > 4'd2 ;
  assign NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d162 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     ram_state_and_ctag_cset$DOB[22] &&
	     ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111 &&
	     ram_state_and_ctag_cset$DOB[45] &&
	     ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117 ;
  assign NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d361 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     ram_state_and_ctag_cset_b_read__05_BIT_22_06_A_ETC___d359 ;
  assign NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d369 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     ram_state_and_ctag_cset_b_read__05_BIT_22_06_A_ETC___d359 ;
  assign NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d372 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     NOT_ram_state_and_ctag_cset_b_read__05_BIT_22__ETC___d370 ;
  assign NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d378 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     NOT_ram_state_and_ctag_cset_b_read__05_BIT_22__ETC___d375 ;
  assign NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d382 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     (rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 ||
	      NOT_rg_op_4_EQ_1_2_74_AND_ram_state_and_ctag_c_ETC___d379) ;
  assign NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d393 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d391 ;
  assign NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d535 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd1 &&
	     rg_addr_9_EQ_rg_lrsc_pa_8___d166 &&
	     NOT_cfg_verbosity_read__0_ULE_1_1___d42 ;
  assign NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d547 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00011 &&
	     NOT_cfg_verbosity_read__0_ULE_1_1___d42 ;
  assign NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d577 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     NOT_rg_op_4_EQ_1_2_74_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d390 ;
  assign NOT_ram_state_and_ctag_cset_b_read__05_BIT_22__ETC___d121 =
	     (!ram_state_and_ctag_cset$DOB[22] ||
	      !ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111) &&
	     (!ram_state_and_ctag_cset$DOB[45] ||
	      !ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) ||
	     f_fabric_write_reqs$FULL_N ;
  assign NOT_ram_state_and_ctag_cset_b_read__05_BIT_22__ETC___d168 =
	     (!ram_state_and_ctag_cset$DOB[22] ||
	      !ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111) &&
	     (!ram_state_and_ctag_cset$DOB[45] ||
	      !ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) &&
	     rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     rg_addr_9_EQ_rg_lrsc_pa_8___d166 ;
  assign NOT_ram_state_and_ctag_cset_b_read__05_BIT_22__ETC___d370 =
	     (!ram_state_and_ctag_cset$DOB[22] ||
	      !ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111) &&
	     (!ram_state_and_ctag_cset$DOB[45] ||
	      !ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) &&
	     NOT_cfg_verbosity_read__0_ULE_1_1___d42 ;
  assign NOT_ram_state_and_ctag_cset_b_read__05_BIT_22__ETC___d375 =
	     (!ram_state_and_ctag_cset$DOB[22] ||
	      !ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111) &&
	     (!ram_state_and_ctag_cset$DOB[45] ||
	      !ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) &&
	     rg_addr_9_EQ_rg_lrsc_pa_8___d166 &&
	     NOT_cfg_verbosity_read__0_ULE_1_1___d42 ;
  assign NOT_req_f3_BITS_1_TO_0_36_EQ_0b0_37_38_AND_NOT_ETC___d957 =
	     req_f3[1:0] != 2'b0 && (req_f3[1:0] != 2'b01 || req_addr[0]) &&
	     (req_f3[1:0] != 2'b10 || req_addr[1:0] != 2'b0) &&
	     (req_f3[1:0] != 2'b11 || req_addr[2:0] != 3'b0) ;
  assign NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d149 =
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_8_EQ_rg_addr_9___d99) ;
  assign NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d530 =
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     (rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d528 ||
	      NOT_rg_op_4_EQ_1_2_74_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d390) ;
  assign NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d550 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     NOT_rg_op_4_EQ_2_6_41_OR_NOT_rg_amo_funct7_7_B_ETC___d548 ;
  assign NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d558 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     NOT_rg_op_4_EQ_2_6_41_OR_NOT_rg_amo_funct7_7_B_ETC___d556 ;
  assign NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d570 =
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     rg_op != 2'd1 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	     ram_state_and_ctag_cset_b_read__05_BIT_22_06_A_ETC___d359 ;
  assign NOT_rg_op_4_EQ_1_2_74_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d390 =
	     rg_op != 2'd1 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	     (ram_state_and_ctag_cset$DOB[22] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111 ||
	      ram_state_and_ctag_cset$DOB[45] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) ;
  assign NOT_rg_op_4_EQ_1_2_74_AND_ram_state_and_ctag_c_ETC___d379 =
	     rg_op != 2'd1 &&
	     (ram_state_and_ctag_cset$DOB[22] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111 ||
	      ram_state_and_ctag_cset$DOB[45] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) ;
  assign NOT_rg_op_4_EQ_2_6_41_OR_NOT_rg_amo_funct7_7_B_ETC___d388 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_8_EQ_rg_addr_9___d99) &&
	     (ram_state_and_ctag_cset$DOB[22] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111 ||
	      ram_state_and_ctag_cset$DOB[45] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) ;
  assign NOT_rg_op_4_EQ_2_6_41_OR_NOT_rg_amo_funct7_7_B_ETC___d548 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_8_EQ_rg_addr_9___d99) &&
	     ram_state_and_ctag_cset_b_read__05_BIT_22_06_A_ETC___d359 ;
  assign NOT_rg_op_4_EQ_2_6_41_OR_NOT_rg_amo_funct7_7_B_ETC___d552 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_8_EQ_rg_addr_9___d99) &&
	     NOT_ram_state_and_ctag_cset_b_read__05_BIT_22__ETC___d370 ;
  assign NOT_rg_op_4_EQ_2_6_41_OR_NOT_rg_amo_funct7_7_B_ETC___d556 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_8_EQ_rg_addr_9___d99) &&
	     NOT_cfg_verbosity_read__0_ULE_1_1___d42 ;
  assign _theResult___snd_fst__h2826 =
	     f_fabric_write_reqs$D_OUT[63:0] << shift_bits__h2606 ;
  assign access_exc_code__h2374 =
	     dmem_not_imem ?
	       ((rg_op == 2'd0 ||
		 rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) ?
		  4'd5 :
		  4'd7) :
	       4'd1 ;
  assign b__h26623 =
	     CAN_FIRE_RL_rl_fabric_send_write_req ?
	       ctr_wr_rsps_pending_crg$port0__write_1 :
	       ctr_wr_rsps_pending_crg ;
  assign cline_addr__h26721 = { rg_pa[31:5], 5'd0 } ;
  assign cline_fabric_addr__h26722 = { 32'd0, cline_addr__h26721 } ;
  assign dmem_not_imem_AND_NOT_soc_map_m_is_mem_addr_0__ETC___d124 =
	     dmem_not_imem && !soc_map$m_is_mem_addr || rg_op == 2'd0 ||
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010 ||
	     IF_rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_ETC___d122 ;
  assign fabric_addr__h32167 = { 32'd0, rg_pa } ;
  assign ld_val0504_BITS_15_TO_0__q37 = ld_val__h30504[15:0] ;
  assign ld_val0504_BITS_15_TO_8__q39 = ld_val__h30504[15:8] ;
  assign ld_val0504_BITS_23_TO_16__q40 = ld_val__h30504[23:16] ;
  assign ld_val0504_BITS_31_TO_0__q38 = ld_val__h30504[31:0] ;
  assign ld_val0504_BITS_31_TO_16__q41 = ld_val__h30504[31:16] ;
  assign ld_val0504_BITS_31_TO_24__q42 = ld_val__h30504[31:24] ;
  assign ld_val0504_BITS_39_TO_32__q43 = ld_val__h30504[39:32] ;
  assign ld_val0504_BITS_47_TO_32__q44 = ld_val__h30504[47:32] ;
  assign ld_val0504_BITS_47_TO_40__q46 = ld_val__h30504[47:40] ;
  assign ld_val0504_BITS_55_TO_48__q47 = ld_val__h30504[55:48] ;
  assign ld_val0504_BITS_63_TO_32__q45 = ld_val__h30504[63:32] ;
  assign ld_val0504_BITS_63_TO_48__q48 = ld_val__h30504[63:48] ;
  assign ld_val0504_BITS_63_TO_56__q49 = ld_val__h30504[63:56] ;
  assign ld_val0504_BITS_7_TO_0__q36 = ld_val__h30504[7:0] ;
  assign lrsc_result__h20012 =
	     !rg_lrsc_valid || !rg_lrsc_pa_8_EQ_rg_addr_9___d99 ;
  assign master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1 =
	     master_xactor_f_rd_data$D_OUT[10:3] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4 =
	     master_xactor_f_rd_data$D_OUT[18:11] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2 =
	     master_xactor_f_rd_data$D_OUT[18:3] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q6 =
	     master_xactor_f_rd_data$D_OUT[26:19] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q7 =
	     master_xactor_f_rd_data$D_OUT[34:19] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q8 =
	     master_xactor_f_rd_data$D_OUT[34:27] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3 =
	     master_xactor_f_rd_data$D_OUT[34:3] ;
  assign master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q5 =
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
  assign mem_req_wr_addr_awaddr__h2592 =
	     { 32'd0, f_fabric_write_reqs$D_OUT[95:64] } ;
  assign n_ctag__h27950 = { 2'd0, rg_pa[31:12] } ;
  assign new_st_val__h23573 =
	     (rg_f3 == 3'b010) ?
	       new_st_val__h23879 :
	       _theResult_____2__h23875 ;
  assign new_st_val__h23879 = { 32'd0, _theResult_____2__h23875[31:0] } ;
  assign new_st_val__h23970 =
	     IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_IF_rg_f3_54_E_ETC___d386 +
	     IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_rg_st_amo_val_ETC___d455 ;
  assign new_st_val__h24950 = w1__h23867 ^ w2__h32750 ;
  assign new_st_val__h24954 = w1__h23867 & w2__h32750 ;
  assign new_st_val__h24958 = w1__h23867 | w2__h32750 ;
  assign new_st_val__h24962 =
	     (w1__h23867 < w2__h32750) ? w1__h23867 : w2__h32750 ;
  assign new_st_val__h24967 =
	     (w1__h23867 <= w2__h32750) ? w2__h32750 : w1__h23867 ;
  assign new_st_val__h24973 =
	     ((IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_IF_rg_f3_54_E_ETC___d386 ^
	       64'h8000000000000000) <
	      (IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_rg_st_amo_val_ETC___d455 ^
	       64'h8000000000000000)) ?
	       w1__h23867 :
	       w2__h32750 ;
  assign new_st_val__h24978 =
	     ((IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_IF_rg_f3_54_E_ETC___d386 ^
	       64'h8000000000000000) <=
	      (IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_rg_st_amo_val_ETC___d455 ^
	       64'h8000000000000000)) ?
	       w2__h32750 :
	       w1__h23867 ;
  assign new_st_val__h32760 = { 32'd0, _theResult_____2__h32756[31:0] } ;
  assign new_st_val__h32851 =
	     new_ld_val__h32710 +
	     IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_rg_st_amo_val_ETC___d455 ;
  assign new_st_val__h34711 = w1__h32748 ^ w2__h32750 ;
  assign new_st_val__h34715 = w1__h32748 & w2__h32750 ;
  assign new_st_val__h34719 = w1__h32748 | w2__h32750 ;
  assign new_st_val__h34723 =
	     (w1__h32748 < w2__h32750) ? w1__h32748 : w2__h32750 ;
  assign new_st_val__h34728 =
	     (w1__h32748 <= w2__h32750) ? w2__h32750 : w1__h32748 ;
  assign new_st_val__h34734 =
	     ((new_ld_val__h32710 ^ 64'h8000000000000000) <
	      (IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_rg_st_amo_val_ETC___d455 ^
	       64'h8000000000000000)) ?
	       w1__h32748 :
	       w2__h32750 ;
  assign new_st_val__h34739 =
	     ((new_ld_val__h32710 ^ 64'h8000000000000000) <=
	      (IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_rg_st_amo_val_ETC___d455 ^
	       64'h8000000000000000)) ?
	       w2__h32750 :
	       w1__h32748 ;
  assign new_value__h22441 =
	     (rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       64'd1 :
	       CASE_rg_f3_0b0_IF_rg_addr_9_BITS_2_TO_0_31_EQ__ETC__q52 ;
  assign new_value__h6012 =
	     (rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       word64__h5847 :
	       IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC___d347 ;
  assign pa_ctag__h5533 = { 2'd0, rg_addr[31:12] } ;
  assign ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111 =
	     ram_state_and_ctag_cset$DOB[21:0] == pa_ctag__h5533 ;
  assign ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117 =
	     ram_state_and_ctag_cset$DOB[44:23] == pa_ctag__h5533 ;
  assign ram_state_and_ctag_cset_b_read__05_BIT_22_06_A_ETC___d165 =
	     (ram_state_and_ctag_cset$DOB[22] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111 ||
	      ram_state_and_ctag_cset$DOB[45] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) &&
	     rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 ;
  assign ram_state_and_ctag_cset_b_read__05_BIT_22_06_A_ETC___d176 =
	     (ram_state_and_ctag_cset$DOB[22] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111 ||
	      ram_state_and_ctag_cset$DOB[45] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) &&
	     rg_addr_9_EQ_rg_lrsc_pa_8___d166 ;
  assign ram_state_and_ctag_cset_b_read__05_BIT_22_06_A_ETC___d359 =
	     (ram_state_and_ctag_cset$DOB[22] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111 ||
	      ram_state_and_ctag_cset$DOB[45] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) &&
	     NOT_cfg_verbosity_read__0_ULE_1_1___d42 ;
  assign ram_state_and_ctag_cset_b_read__05_BIT_22_06_A_ETC___d572 =
	     (ram_state_and_ctag_cset$DOB[22] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111 ||
	      ram_state_and_ctag_cset$DOB[45] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) &&
	     rg_addr_9_EQ_rg_lrsc_pa_8___d166 &&
	     NOT_cfg_verbosity_read__0_ULE_1_1___d42 ;
  assign req_f3_BITS_1_TO_0_36_EQ_0b0_37_OR_req_f3_BITS_ETC___d966 =
	     req_f3[1:0] == 2'b0 || req_f3[1:0] == 2'b01 && !req_addr[0] ||
	     req_f3[1:0] == 2'b10 && req_addr[1:0] == 2'b0 ||
	     req_f3[1:0] == 2'b11 && req_addr[2:0] == 3'b0 ;
  assign result__h18723 =
	     { {56{word64847_BITS_7_TO_0__q15[7]}},
	       word64847_BITS_7_TO_0__q15 } ;
  assign result__h18751 =
	     { {56{word64847_BITS_15_TO_8__q18[7]}},
	       word64847_BITS_15_TO_8__q18 } ;
  assign result__h18779 =
	     { {56{word64847_BITS_23_TO_16__q19[7]}},
	       word64847_BITS_23_TO_16__q19 } ;
  assign result__h18807 =
	     { {56{word64847_BITS_31_TO_24__q21[7]}},
	       word64847_BITS_31_TO_24__q21 } ;
  assign result__h18835 =
	     { {56{word64847_BITS_39_TO_32__q22[7]}},
	       word64847_BITS_39_TO_32__q22 } ;
  assign result__h18863 =
	     { {56{word64847_BITS_47_TO_40__q25[7]}},
	       word64847_BITS_47_TO_40__q25 } ;
  assign result__h18891 =
	     { {56{word64847_BITS_55_TO_48__q26[7]}},
	       word64847_BITS_55_TO_48__q26 } ;
  assign result__h18919 =
	     { {56{word64847_BITS_63_TO_56__q28[7]}},
	       word64847_BITS_63_TO_56__q28 } ;
  assign result__h18964 = { 56'd0, word64__h5847[7:0] } ;
  assign result__h18992 = { 56'd0, word64__h5847[15:8] } ;
  assign result__h19020 = { 56'd0, word64__h5847[23:16] } ;
  assign result__h19048 = { 56'd0, word64__h5847[31:24] } ;
  assign result__h19076 = { 56'd0, word64__h5847[39:32] } ;
  assign result__h19104 = { 56'd0, word64__h5847[47:40] } ;
  assign result__h19132 = { 56'd0, word64__h5847[55:48] } ;
  assign result__h19160 = { 56'd0, word64__h5847[63:56] } ;
  assign result__h19205 =
	     { {48{word64847_BITS_15_TO_0__q16[15]}},
	       word64847_BITS_15_TO_0__q16 } ;
  assign result__h19233 =
	     { {48{word64847_BITS_31_TO_16__q20[15]}},
	       word64847_BITS_31_TO_16__q20 } ;
  assign result__h19261 =
	     { {48{word64847_BITS_47_TO_32__q23[15]}},
	       word64847_BITS_47_TO_32__q23 } ;
  assign result__h19289 =
	     { {48{word64847_BITS_63_TO_48__q27[15]}},
	       word64847_BITS_63_TO_48__q27 } ;
  assign result__h19330 = { 48'd0, word64__h5847[15:0] } ;
  assign result__h19358 = { 48'd0, word64__h5847[31:16] } ;
  assign result__h19386 = { 48'd0, word64__h5847[47:32] } ;
  assign result__h19414 = { 48'd0, word64__h5847[63:48] } ;
  assign result__h19455 =
	     { {32{word64847_BITS_31_TO_0__q17[31]}},
	       word64847_BITS_31_TO_0__q17 } ;
  assign result__h19483 =
	     { {32{word64847_BITS_63_TO_32__q24[31]}},
	       word64847_BITS_63_TO_32__q24 } ;
  assign result__h19522 = { 32'd0, word64__h5847[31:0] } ;
  assign result__h19550 = { 32'd0, word64__h5847[63:32] } ;
  assign result__h30564 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1 } ;
  assign result__h30594 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4 } ;
  assign result__h30621 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q6[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q6 } ;
  assign result__h30648 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q8[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q8 } ;
  assign result__h30675 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q5[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q5 } ;
  assign result__h30702 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11 } ;
  assign result__h30729 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12 } ;
  assign result__h30756 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14 } ;
  assign result__h30800 = { 56'd0, master_xactor_f_rd_data$D_OUT[10:3] } ;
  assign result__h30827 = { 56'd0, master_xactor_f_rd_data$D_OUT[18:11] } ;
  assign result__h30854 = { 56'd0, master_xactor_f_rd_data$D_OUT[26:19] } ;
  assign result__h30881 = { 56'd0, master_xactor_f_rd_data$D_OUT[34:27] } ;
  assign result__h30908 = { 56'd0, master_xactor_f_rd_data$D_OUT[42:35] } ;
  assign result__h30935 = { 56'd0, master_xactor_f_rd_data$D_OUT[50:43] } ;
  assign result__h30962 = { 56'd0, master_xactor_f_rd_data$D_OUT[58:51] } ;
  assign result__h30989 = { 56'd0, master_xactor_f_rd_data$D_OUT[66:59] } ;
  assign result__h31033 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2 } ;
  assign result__h31060 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q7[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q7 } ;
  assign result__h31087 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q9[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q9 } ;
  assign result__h31114 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13 } ;
  assign result__h31154 = { 48'd0, master_xactor_f_rd_data$D_OUT[18:3] } ;
  assign result__h31181 = { 48'd0, master_xactor_f_rd_data$D_OUT[34:19] } ;
  assign result__h31208 = { 48'd0, master_xactor_f_rd_data$D_OUT[50:35] } ;
  assign result__h31235 = { 48'd0, master_xactor_f_rd_data$D_OUT[66:51] } ;
  assign result__h31275 =
	     { {32{master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3[31]}},
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3 } ;
  assign result__h31302 =
	     { {32{master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10[31]}},
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10 } ;
  assign result__h31340 = { 32'd0, master_xactor_f_rd_data$D_OUT[34:3] } ;
  assign result__h31367 = { 32'd0, master_xactor_f_rd_data$D_OUT[66:35] } ;
  assign result__h32939 =
	     { {56{ld_val0504_BITS_7_TO_0__q36[7]}},
	       ld_val0504_BITS_7_TO_0__q36 } ;
  assign result__h33847 =
	     { {56{ld_val0504_BITS_15_TO_8__q39[7]}},
	       ld_val0504_BITS_15_TO_8__q39 } ;
  assign result__h33875 =
	     { {56{ld_val0504_BITS_23_TO_16__q40[7]}},
	       ld_val0504_BITS_23_TO_16__q40 } ;
  assign result__h33903 =
	     { {56{ld_val0504_BITS_31_TO_24__q42[7]}},
	       ld_val0504_BITS_31_TO_24__q42 } ;
  assign result__h33931 =
	     { {56{ld_val0504_BITS_39_TO_32__q43[7]}},
	       ld_val0504_BITS_39_TO_32__q43 } ;
  assign result__h33959 =
	     { {56{ld_val0504_BITS_47_TO_40__q46[7]}},
	       ld_val0504_BITS_47_TO_40__q46 } ;
  assign result__h33987 =
	     { {56{ld_val0504_BITS_55_TO_48__q47[7]}},
	       ld_val0504_BITS_55_TO_48__q47 } ;
  assign result__h34015 =
	     { {56{ld_val0504_BITS_63_TO_56__q49[7]}},
	       ld_val0504_BITS_63_TO_56__q49 } ;
  assign result__h34060 = { 56'd0, ld_val__h30504[7:0] } ;
  assign result__h34088 = { 56'd0, ld_val__h30504[15:8] } ;
  assign result__h34116 = { 56'd0, ld_val__h30504[23:16] } ;
  assign result__h34144 = { 56'd0, ld_val__h30504[31:24] } ;
  assign result__h34172 = { 56'd0, ld_val__h30504[39:32] } ;
  assign result__h34200 = { 56'd0, ld_val__h30504[47:40] } ;
  assign result__h34228 = { 56'd0, ld_val__h30504[55:48] } ;
  assign result__h34256 = { 56'd0, ld_val__h30504[63:56] } ;
  assign result__h34301 =
	     { {48{ld_val0504_BITS_15_TO_0__q37[15]}},
	       ld_val0504_BITS_15_TO_0__q37 } ;
  assign result__h34329 =
	     { {48{ld_val0504_BITS_31_TO_16__q41[15]}},
	       ld_val0504_BITS_31_TO_16__q41 } ;
  assign result__h34357 =
	     { {48{ld_val0504_BITS_47_TO_32__q44[15]}},
	       ld_val0504_BITS_47_TO_32__q44 } ;
  assign result__h34385 =
	     { {48{ld_val0504_BITS_63_TO_48__q48[15]}},
	       ld_val0504_BITS_63_TO_48__q48 } ;
  assign result__h34426 = { 48'd0, ld_val__h30504[15:0] } ;
  assign result__h34454 = { 48'd0, ld_val__h30504[31:16] } ;
  assign result__h34482 = { 48'd0, ld_val__h30504[47:32] } ;
  assign result__h34510 = { 48'd0, ld_val__h30504[63:48] } ;
  assign result__h34551 =
	     { {32{ld_val0504_BITS_31_TO_0__q38[31]}},
	       ld_val0504_BITS_31_TO_0__q38 } ;
  assign result__h34579 =
	     { {32{ld_val0504_BITS_63_TO_32__q45[31]}},
	       ld_val0504_BITS_63_TO_32__q45 } ;
  assign result__h34618 = { 32'd0, ld_val__h30504[31:0] } ;
  assign result__h34646 = { 32'd0, ld_val__h30504[63:32] } ;
  assign rg_addr_9_EQ_rg_lrsc_pa_8___d166 = rg_addr == rg_lrsc_pa ;
  assign rg_amo_funct7_7_BITS_6_TO_2_8_EQ_0b10_9_AND_ra_ETC___d364 =
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     (ram_state_and_ctag_cset$DOB[22] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111 ||
	      ram_state_and_ctag_cset$DOB[45] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) ;
  assign rg_lrsc_pa_8_EQ_rg_addr_9___d99 = rg_lrsc_pa == rg_addr ;
  assign rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d139 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     (!ram_state_and_ctag_cset$DOB[22] ||
	      !ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111) &&
	     (!ram_state_and_ctag_cset$DOB[45] ||
	      !ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) ;
  assign rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d170 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     (ram_state_and_ctag_cset_b_read__05_BIT_22_06_A_ETC___d165 ||
	      NOT_ram_state_and_ctag_cset_b_read__05_BIT_22__ETC___d168) ;
  assign rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d180 =
	     rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d170 ||
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d178 ;
  assign rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d182 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     (ram_state_and_ctag_cset$DOB[22] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111 ||
	      ram_state_and_ctag_cset$DOB[45] &&
	      ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117) ;
  assign rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d185 =
	     rg_op_4_EQ_0_5_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d182 ||
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 &&
	     lrsc_result__h20012 ;
  assign rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d178 =
	     rg_op == 2'd1 && rg_addr_9_EQ_rg_lrsc_pa_8___d166 ||
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 ||
	     rg_op != 2'd1 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	     ram_state_and_ctag_cset_b_read__05_BIT_22_06_A_ETC___d176 ;
  assign rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d391 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     NOT_rg_op_4_EQ_2_6_41_OR_NOT_rg_amo_funct7_7_B_ETC___d388 ||
	     NOT_rg_op_4_EQ_1_2_74_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d390 ;
  assign rg_op_4_EQ_1_2_OR_rg_op_4_EQ_2_6_AND_rg_amo_fu_ETC___d528 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid && rg_lrsc_pa_8_EQ_rg_addr_9___d99) ;
  assign rg_op_4_EQ_2_6_AND_rg_amo_funct7_7_BITS_6_TO_2_ETC___d562 =
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 &&
	     lrsc_result__h20012 &&
	     NOT_cfg_verbosity_read__0_ULE_1_1___d42 ;
  assign rg_st_amo_val_BITS_31_TO_0__q32 = rg_st_amo_val[31:0] ;
  assign rg_state_5_EQ_12_50_AND_rg_op_4_EQ_0_5_OR_rg_o_ETC___d652 =
	     rg_state == 4'd12 &&
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     b__h26623 == 4'd0 ;
  assign shift_bits__h2606 = { f_fabric_write_reqs$D_OUT[66:64], 3'b0 } ;
  assign strobe64__h2756 = 8'b00000001 << f_fabric_write_reqs$D_OUT[66:64] ;
  assign strobe64__h2758 = 8'b00000011 << f_fabric_write_reqs$D_OUT[66:64] ;
  assign strobe64__h2760 = 8'b00001111 << f_fabric_write_reqs$D_OUT[66:64] ;
  assign tmp__h26884 = { 1'd0, rg_victim_way } ;
  assign tmp__h26885 = tmp__h26884 + 2'd1 ;
  assign w12744_BITS_31_TO_0__q51 = w1__h32744[31:0] ;
  assign w1___1__h23938 =
	     { 32'd0,
	       IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC___d347[31:0] } ;
  assign w1___1__h32819 = { 32'd0, w1__h32744[31:0] } ;
  assign w2___1__h32820 = { 32'd0, rg_st_amo_val[31:0] } ;
  assign w2__h32750 = (rg_f3 == 3'b010) ? w2___1__h32820 : rg_st_amo_val ;
  assign word64847_BITS_15_TO_0__q16 = word64__h5847[15:0] ;
  assign word64847_BITS_15_TO_8__q18 = word64__h5847[15:8] ;
  assign word64847_BITS_23_TO_16__q19 = word64__h5847[23:16] ;
  assign word64847_BITS_31_TO_0__q17 = word64__h5847[31:0] ;
  assign word64847_BITS_31_TO_16__q20 = word64__h5847[31:16] ;
  assign word64847_BITS_31_TO_24__q21 = word64__h5847[31:24] ;
  assign word64847_BITS_39_TO_32__q22 = word64__h5847[39:32] ;
  assign word64847_BITS_47_TO_32__q23 = word64__h5847[47:32] ;
  assign word64847_BITS_47_TO_40__q25 = word64__h5847[47:40] ;
  assign word64847_BITS_55_TO_48__q26 = word64__h5847[55:48] ;
  assign word64847_BITS_63_TO_32__q24 = word64__h5847[63:32] ;
  assign word64847_BITS_63_TO_48__q27 = word64__h5847[63:48] ;
  assign word64847_BITS_63_TO_56__q28 = word64__h5847[63:56] ;
  assign word64847_BITS_7_TO_0__q15 = word64__h5847[7:0] ;
  assign word64__h5847 = x__h6037 | y__h6038 ;
  assign x__h20022 = { 63'd0, lrsc_result__h20012 } ;
  assign x__h32739 =
	     (rg_f3 == 3'b010) ?
	       new_st_val__h32760 :
	       _theResult_____2__h32756 ;
  assign x__h6037 = ram_word64_set$DOB[63:0] & y__h6052 ;
  assign y__h12367 =
	     {64{ram_state_and_ctag_cset$DOB[45] &&
		 ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117}} ;
  assign y__h6038 = ram_word64_set$DOB[127:64] & y__h12367 ;
  assign y__h6052 =
	     {64{ram_state_and_ctag_cset$DOB[22] &&
		 ram_state_and_ctag_cset_b_read__05_BITS_21_TO__ETC___d111}} ;
  always@(f_fabric_write_reqs$D_OUT)
  begin
    case (f_fabric_write_reqs$D_OUT[97:96])
      2'b0: x__h2639 = 3'b0;
      2'b01: x__h2639 = 3'b001;
      2'b10: x__h2639 = 3'b010;
      2'b11: x__h2639 = 3'b011;
    endcase
  end
  always@(rg_f3)
  begin
    case (rg_f3[1:0])
      2'b0: value__h32296 = 3'b0;
      2'b01: value__h32296 = 3'b001;
      2'b10: value__h32296 = 3'b010;
      2'd3: value__h32296 = 3'b011;
    endcase
  end
  always@(f_fabric_write_reqs$D_OUT or
	  strobe64__h2756 or strobe64__h2758 or strobe64__h2760)
  begin
    case (f_fabric_write_reqs$D_OUT[97:96])
      2'b0: mem_req_wr_data_wstrb__h2819 = strobe64__h2756;
      2'b01: mem_req_wr_data_wstrb__h2819 = strobe64__h2758;
      2'b10: mem_req_wr_data_wstrb__h2819 = strobe64__h2760;
      2'b11: mem_req_wr_data_wstrb__h2819 = 8'b11111111;
    endcase
  end
  always@(f_fabric_write_reqs$D_OUT or _theResult___snd_fst__h2826)
  begin
    case (f_fabric_write_reqs$D_OUT[97:96])
      2'b0, 2'b01, 2'b10:
	  mem_req_wr_data_wdata__h2818 = _theResult___snd_fst__h2826;
      2'd3: mem_req_wr_data_wdata__h2818 = f_fabric_write_reqs$D_OUT[63:0];
    endcase
  end
  always@(ram_state_and_ctag_cset$DOB or
	  ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117 or
	  ram_word64_set$DOB)
  begin
    case (ram_state_and_ctag_cset$DOB[45] &&
	  ram_state_and_ctag_cset_b_read__05_BITS_44_TO__ETC___d117)
      1'd0: old_word64__h20790 = ram_word64_set$DOB[63:0];
      1'd1: old_word64__h20790 = ram_word64_set$DOB[127:64];
    endcase
  end
  always@(rg_addr or
	  result__h18723 or
	  result__h18751 or
	  result__h18779 or
	  result__h18807 or
	  result__h18835 or
	  result__h18863 or result__h18891 or result__h18919)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d287 =
	      result__h18723;
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d287 =
	      result__h18751;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d287 =
	      result__h18779;
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d287 =
	      result__h18807;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d287 =
	      result__h18835;
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d287 =
	      result__h18863;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d287 =
	      result__h18891;
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d287 =
	      result__h18919;
    endcase
  end
  always@(rg_addr or
	  result__h18964 or
	  result__h18992 or
	  result__h19020 or
	  result__h19048 or
	  result__h19076 or
	  result__h19104 or result__h19132 or result__h19160)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d304 =
	      result__h18964;
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d304 =
	      result__h18992;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d304 =
	      result__h19020;
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d304 =
	      result__h19048;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d304 =
	      result__h19076;
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d304 =
	      result__h19104;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d304 =
	      result__h19132;
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d304 =
	      result__h19160;
    endcase
  end
  always@(rg_addr or
	  result__h19205 or
	  result__h19233 or result__h19261 or result__h19289)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d317 =
	      result__h19205;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d317 =
	      result__h19233;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d317 =
	      result__h19261;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d317 =
	      result__h19289;
      default: IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d317 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h19330 or
	  result__h19358 or result__h19386 or result__h19414)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d326 =
	      result__h19330;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d326 =
	      result__h19358;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d326 =
	      result__h19386;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d326 =
	      result__h19414;
      default: IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d326 =
		   64'd0;
    endcase
  end
  always@(rg_addr or result__h19522 or result__h19550)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d338 =
	      result__h19522;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d338 =
	      result__h19550;
      default: IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d338 =
		   64'd0;
    endcase
  end
  always@(rg_addr or result__h19455 or result__h19483)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result9455_0x4_re_ETC__q29 =
	      result__h19455;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result9455_0x4_re_ETC__q29 =
	      result__h19483;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result9455_0x4_re_ETC__q29 =
		   64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d287 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d317 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result9455_0x4_re_ETC__q29 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_ram_ETC___d340 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d304 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d326 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d338)
  begin
    case (rg_f3)
      3'b0:
	  IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC___d347 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d287;
      3'b001:
	  IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC___d347 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d317;
      3'b010:
	  IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC___d347 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result9455_0x4_re_ETC__q29;
      3'b011:
	  IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC___d347 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_ram_ETC___d340;
      3'b100:
	  IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC___d347 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d304;
      3'b101:
	  IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC___d347 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d326;
      3'b110:
	  IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC___d347 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d338;
      3'd7: IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC___d347 = 64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d287 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d317 or
	  w1___1__h23938 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_ram_ETC___d340 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d304 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d326 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d338)
  begin
    case (rg_f3)
      3'b0:
	  w1__h23867 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d287;
      3'b001:
	  w1__h23867 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d317;
      3'b010: w1__h23867 = w1___1__h23938;
      3'b011:
	  w1__h23867 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_ram_ETC___d340;
      3'b100:
	  w1__h23867 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d304;
      3'b101:
	  w1__h23867 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d326;
      3'b110:
	  w1__h23867 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d338;
      3'd7: w1__h23867 = 64'd0;
    endcase
  end
  always@(rg_addr or old_word64__h20790 or rg_st_amo_val)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d437 =
	      { old_word64__h20790[63:16], rg_st_amo_val[15:0] };
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d437 =
	      { old_word64__h20790[63:32],
		rg_st_amo_val[15:0],
		old_word64__h20790[15:0] };
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d437 =
	      { old_word64__h20790[63:48],
		rg_st_amo_val[15:0],
		old_word64__h20790[31:0] };
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d437 =
	      { rg_st_amo_val[15:0], old_word64__h20790[47:0] };
      default: IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d437 =
		   old_word64__h20790;
    endcase
  end
  always@(rg_addr or old_word64__h20790 or rg_st_amo_val)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d428 =
	      { old_word64__h20790[63:8], rg_st_amo_val[7:0] };
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d428 =
	      { old_word64__h20790[63:16],
		rg_st_amo_val[7:0],
		old_word64__h20790[7:0] };
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d428 =
	      { old_word64__h20790[63:24],
		rg_st_amo_val[7:0],
		old_word64__h20790[15:0] };
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d428 =
	      { old_word64__h20790[63:32],
		rg_st_amo_val[7:0],
		old_word64__h20790[23:0] };
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d428 =
	      { old_word64__h20790[63:40],
		rg_st_amo_val[7:0],
		old_word64__h20790[31:0] };
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d428 =
	      { old_word64__h20790[63:48],
		rg_st_amo_val[7:0],
		old_word64__h20790[39:0] };
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d428 =
	      { old_word64__h20790[63:56],
		rg_st_amo_val[7:0],
		old_word64__h20790[47:0] };
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d428 =
	      { rg_st_amo_val[7:0], old_word64__h20790[55:0] };
    endcase
  end
  always@(rg_addr or old_word64__h20790 or rg_st_amo_val)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_word640790_BI_ETC__q30 =
	      { old_word64__h20790[63:32], rg_st_amo_val[31:0] };
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_word640790_BI_ETC__q30 =
	      { rg_st_amo_val[31:0], old_word64__h20790[31:0] };
      default: CASE_rg_addr_BITS_2_TO_0_0x0_old_word640790_BI_ETC__q30 =
		   old_word64__h20790;
    endcase
  end
  always@(rg_f3 or
	  old_word64__h20790 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d428 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d437 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_word640790_BI_ETC__q30 or
	  rg_st_amo_val)
  begin
    case (rg_f3)
      3'b0:
	  n__h20801 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d428;
      3'b001:
	  n__h20801 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d437;
      3'b010:
	  n__h20801 = CASE_rg_addr_BITS_2_TO_0_0x0_old_word640790_BI_ETC__q30;
      3'b011: n__h20801 = rg_st_amo_val;
      default: n__h20801 = old_word64__h20790;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d287 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d317 or
	  IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC__q31 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_ram_ETC___d340 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d304 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d326 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d338)
  begin
    case (rg_f3)
      3'b0:
	  IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_IF_rg_f3_54_E_ETC___d386 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d287;
      3'b001:
	  IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_IF_rg_f3_54_E_ETC___d386 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d317;
      3'b010:
	  IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_IF_rg_f3_54_E_ETC___d386 =
	      { {32{IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC__q31[31]}},
		IF_rg_f3_54_EQ_0b0_55_THEN_IF_rg_addr_9_BITS_2_ETC__q31 };
      3'b011:
	  IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_IF_rg_f3_54_E_ETC___d386 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_ram_ETC___d340;
      3'b100:
	  IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_IF_rg_f3_54_E_ETC___d386 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d304;
      3'b101:
	  IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_IF_rg_f3_54_E_ETC___d386 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d326;
      3'b110:
	  IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_IF_rg_f3_54_E_ETC___d386 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d338;
      3'd7: IF_rg_f3_54_EQ_0b10_27_THEN_SEXT_IF_rg_f3_54_E_ETC___d386 = 64'd0;
    endcase
  end
  always@(rg_amo_funct7 or
	  new_st_val__h24978 or
	  new_st_val__h23970 or
	  w2__h32750 or
	  new_st_val__h24950 or
	  new_st_val__h24958 or
	  new_st_val__h24954 or
	  new_st_val__h24973 or new_st_val__h24962 or new_st_val__h24967)
  begin
    case (rg_amo_funct7[6:2])
      5'b0: _theResult_____2__h23875 = new_st_val__h23970;
      5'b00001: _theResult_____2__h23875 = w2__h32750;
      5'b00100: _theResult_____2__h23875 = new_st_val__h24950;
      5'b01000: _theResult_____2__h23875 = new_st_val__h24958;
      5'b01100: _theResult_____2__h23875 = new_st_val__h24954;
      5'b10000: _theResult_____2__h23875 = new_st_val__h24973;
      5'b11000: _theResult_____2__h23875 = new_st_val__h24962;
      5'b11100: _theResult_____2__h23875 = new_st_val__h24967;
      default: _theResult_____2__h23875 = new_st_val__h24978;
    endcase
  end
  always@(rg_addr or old_word64__h20790 or new_st_val__h23573)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d514 =
	      { old_word64__h20790[63:16], new_st_val__h23573[15:0] };
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d514 =
	      { old_word64__h20790[63:32],
		new_st_val__h23573[15:0],
		old_word64__h20790[15:0] };
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d514 =
	      { old_word64__h20790[63:48],
		new_st_val__h23573[15:0],
		old_word64__h20790[31:0] };
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d514 =
	      { new_st_val__h23573[15:0], old_word64__h20790[47:0] };
      default: IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d514 =
		   old_word64__h20790;
    endcase
  end
  always@(rg_addr or old_word64__h20790 or new_st_val__h23573)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d505 =
	      { old_word64__h20790[63:8], new_st_val__h23573[7:0] };
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d505 =
	      { old_word64__h20790[63:16],
		new_st_val__h23573[7:0],
		old_word64__h20790[7:0] };
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d505 =
	      { old_word64__h20790[63:24],
		new_st_val__h23573[7:0],
		old_word64__h20790[15:0] };
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d505 =
	      { old_word64__h20790[63:32],
		new_st_val__h23573[7:0],
		old_word64__h20790[23:0] };
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d505 =
	      { old_word64__h20790[63:40],
		new_st_val__h23573[7:0],
		old_word64__h20790[31:0] };
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d505 =
	      { old_word64__h20790[63:48],
		new_st_val__h23573[7:0],
		old_word64__h20790[39:0] };
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d505 =
	      { old_word64__h20790[63:56],
		new_st_val__h23573[7:0],
		old_word64__h20790[47:0] };
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d505 =
	      { new_st_val__h23573[7:0], old_word64__h20790[55:0] };
    endcase
  end
  always@(rg_addr or old_word64__h20790 or new_st_val__h23573)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_word640790_BI_ETC__q33 =
	      { old_word64__h20790[63:32], new_st_val__h23573[31:0] };
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_word640790_BI_ETC__q33 =
	      { new_st_val__h23573[31:0], old_word64__h20790[31:0] };
      default: CASE_rg_addr_BITS_2_TO_0_0x0_old_word640790_BI_ETC__q33 =
		   old_word64__h20790;
    endcase
  end
  always@(rg_f3 or
	  old_word64__h20790 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d505 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d514 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_old_word640790_BI_ETC__q33 or
	  new_st_val__h23573)
  begin
    case (rg_f3)
      3'b0:
	  n__h23737 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d505;
      3'b001:
	  n__h23737 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEL_ETC___d514;
      3'b010:
	  n__h23737 = CASE_rg_addr_BITS_2_TO_0_0x0_old_word640790_BI_ETC__q33;
      3'b011: n__h23737 = new_st_val__h23573;
      default: n__h23737 = old_word64__h20790;
    endcase
  end
  always@(rg_addr or
	  result__h31154 or
	  result__h31181 or result__h31208 or result__h31235)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d731 =
	      result__h31154;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d731 =
	      result__h31181;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d731 =
	      result__h31208;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d731 =
	      result__h31235;
      default: IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d731 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h31033 or
	  result__h31060 or result__h31087 or result__h31114)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d723 =
	      result__h31033;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d723 =
	      result__h31060;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d723 =
	      result__h31087;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d723 =
	      result__h31114;
      default: IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d723 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h30800 or
	  result__h30827 or
	  result__h30854 or
	  result__h30881 or
	  result__h30908 or
	  result__h30935 or result__h30962 or result__h30989)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d711 =
	      result__h30800;
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d711 =
	      result__h30827;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d711 =
	      result__h30854;
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d711 =
	      result__h30881;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d711 =
	      result__h30908;
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d711 =
	      result__h30935;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d711 =
	      result__h30962;
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d711 =
	      result__h30989;
    endcase
  end
  always@(rg_addr or
	  result__h30564 or
	  result__h30594 or
	  result__h30621 or
	  result__h30648 or
	  result__h30675 or
	  result__h30702 or result__h30729 or result__h30756)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d695 =
	      result__h30564;
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d695 =
	      result__h30594;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d695 =
	      result__h30621;
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d695 =
	      result__h30648;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d695 =
	      result__h30675;
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d695 =
	      result__h30702;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d695 =
	      result__h30729;
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d695 =
	      result__h30756;
    endcase
  end
  always@(rg_addr or result__h31275 or result__h31302)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1275_0x4_re_ETC__q34 =
	      result__h31275;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1275_0x4_re_ETC__q34 =
	      result__h31302;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result1275_0x4_re_ETC__q34 =
		   64'd0;
    endcase
  end
  always@(rg_addr or result__h31340 or result__h31367)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1340_0x4_re_ETC__q35 =
	      result__h31340;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1340_0x4_re_ETC__q35 =
	      result__h31367;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result1340_0x4_re_ETC__q35 =
		   64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d695 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d723 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1275_0x4_re_ETC__q34 or
	  rg_addr or
	  master_xactor_f_rd_data$D_OUT or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d711 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d731 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1340_0x4_re_ETC__q35)
  begin
    case (rg_f3)
      3'b0:
	  ld_val__h30504 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d695;
      3'b001:
	  ld_val__h30504 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d723;
      3'b010:
	  ld_val__h30504 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result1275_0x4_re_ETC__q34;
      3'b011:
	  ld_val__h30504 =
	      (rg_addr[2:0] == 3'h0) ?
		master_xactor_f_rd_data$D_OUT[66:3] :
		64'd0;
      3'b100:
	  ld_val__h30504 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d711;
      3'b101:
	  ld_val__h30504 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d731;
      3'b110:
	  ld_val__h30504 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result1340_0x4_re_ETC__q35;
      3'd7: ld_val__h30504 = 64'd0;
    endcase
  end
  always@(rg_addr or result__h34618 or result__h34646)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d850 =
	      result__h34618;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d850 =
	      result__h34646;
      default: IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d850 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h34426 or
	  result__h34454 or result__h34482 or result__h34510)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d840 =
	      result__h34426;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d840 =
	      result__h34454;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d840 =
	      result__h34482;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d840 =
	      result__h34510;
      default: IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d840 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h34301 or
	  result__h34329 or result__h34357 or result__h34385)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d832 =
	      result__h34301;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d832 =
	      result__h34329;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d832 =
	      result__h34357;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d832 =
	      result__h34385;
      default: IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d832 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h34060 or
	  result__h34088 or
	  result__h34116 or
	  result__h34144 or
	  result__h34172 or
	  result__h34200 or result__h34228 or result__h34256)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d820 =
	      result__h34060;
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d820 =
	      result__h34088;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d820 =
	      result__h34116;
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d820 =
	      result__h34144;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d820 =
	      result__h34172;
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d820 =
	      result__h34200;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d820 =
	      result__h34228;
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d820 =
	      result__h34256;
    endcase
  end
  always@(rg_addr or
	  result__h32939 or
	  result__h33847 or
	  result__h33875 or
	  result__h33903 or
	  result__h33931 or
	  result__h33959 or result__h33987 or result__h34015)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d804 =
	      result__h32939;
      3'h1:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d804 =
	      result__h33847;
      3'h2:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d804 =
	      result__h33875;
      3'h3:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d804 =
	      result__h33903;
      3'h4:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d804 =
	      result__h33931;
      3'h5:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d804 =
	      result__h33959;
      3'h6:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d804 =
	      result__h33987;
      3'h7:
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d804 =
	      result__h34015;
    endcase
  end
  always@(rg_addr or result__h34551 or result__h34579)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result4551_0x4_re_ETC__q50 =
	      result__h34551;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result4551_0x4_re_ETC__q50 =
	      result__h34579;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result4551_0x4_re_ETC__q50 =
		   64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d804 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d832 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result4551_0x4_re_ETC__q50 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_IF__ETC___d851 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d820 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d840 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d850)
  begin
    case (rg_f3)
      3'b0:
	  w1__h32744 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d804;
      3'b001:
	  w1__h32744 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d832;
      3'b010:
	  w1__h32744 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result4551_0x4_re_ETC__q50;
      3'b011:
	  w1__h32744 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_IF__ETC___d851;
      3'b100:
	  w1__h32744 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d820;
      3'b101:
	  w1__h32744 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d840;
      3'b110:
	  w1__h32744 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d850;
      3'd7: w1__h32744 = 64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d804 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d832 or
	  w1___1__h32819 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_IF__ETC___d851 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d820 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d840 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d850)
  begin
    case (rg_f3)
      3'b0:
	  w1__h32748 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d804;
      3'b001:
	  w1__h32748 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d832;
      3'b010: w1__h32748 = w1___1__h32819;
      3'b011:
	  w1__h32748 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_IF__ETC___d851;
      3'b100:
	  w1__h32748 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d820;
      3'b101:
	  w1__h32748 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d840;
      3'b110:
	  w1__h32748 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d850;
      3'd7: w1__h32748 = 64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d804 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d832 or
	  w12744_BITS_31_TO_0__q51 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_IF__ETC___d851 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d820 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d840 or
	  IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d850)
  begin
    case (rg_f3)
      3'b0:
	  new_ld_val__h32710 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d804;
      3'b001:
	  new_ld_val__h32710 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_SEX_ETC___d832;
      3'b010:
	  new_ld_val__h32710 =
	      { {32{w12744_BITS_31_TO_0__q51[31]}},
		w12744_BITS_31_TO_0__q51 };
      3'b011:
	  new_ld_val__h32710 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_IF__ETC___d851;
      3'b100:
	  new_ld_val__h32710 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d820;
      3'b101:
	  new_ld_val__h32710 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d840;
      3'b110:
	  new_ld_val__h32710 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_0_C_ETC___d850;
      3'd7: new_ld_val__h32710 = 64'd0;
    endcase
  end
  always@(rg_amo_funct7 or
	  new_st_val__h34739 or
	  new_st_val__h32851 or
	  w2__h32750 or
	  new_st_val__h34711 or
	  new_st_val__h34719 or
	  new_st_val__h34715 or
	  new_st_val__h34734 or new_st_val__h34723 or new_st_val__h34728)
  begin
    case (rg_amo_funct7[6:2])
      5'b0: _theResult_____2__h32756 = new_st_val__h32851;
      5'b00001: _theResult_____2__h32756 = w2__h32750;
      5'b00100: _theResult_____2__h32756 = new_st_val__h34711;
      5'b01000: _theResult_____2__h32756 = new_st_val__h34719;
      5'b01100: _theResult_____2__h32756 = new_st_val__h34715;
      5'b10000: _theResult_____2__h32756 = new_st_val__h34734;
      5'b11000: _theResult_____2__h32756 = new_st_val__h34723;
      5'b11100: _theResult_____2__h32756 = new_st_val__h34728;
      default: _theResult_____2__h32756 = new_st_val__h34739;
    endcase
  end
  always@(rg_f3 or IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_1_E_ETC___d355)
  begin
    case (rg_f3)
      3'b0, 3'b001, 3'b010, 3'b011, 3'b100, 3'b101, 3'b110:
	  CASE_rg_f3_0b0_IF_rg_addr_9_BITS_2_TO_0_31_EQ__ETC__q52 =
	      IF_rg_addr_9_BITS_2_TO_0_31_EQ_0x0_56_THEN_1_E_ETC___d355;
      3'd7: CASE_rg_f3_0b0_IF_rg_addr_9_BITS_2_TO_0_31_EQ__ETC__q52 = 64'd0;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cfg_verbosity <= `BSV_ASSIGNMENT_DELAY 4'd0;
	ctr_wr_rsps_pending_crg <= `BSV_ASSIGNMENT_DELAY 4'd0;
	rg_cset_in_cache <= `BSV_ASSIGNMENT_DELAY 7'd0;
	rg_lower_word32_full <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_lrsc_valid <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_state <= `BSV_ASSIGNMENT_DELAY 4'd0;
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
    rg_addr = 32'hAAAAAAAA;
    rg_amo_funct7 = 7'h2A;
    rg_cset_in_cache = 7'h2A;
    rg_error_during_refill = 1'h0;
    rg_exc_code = 4'hA;
    rg_f3 = 3'h2;
    rg_ld_val = 64'hAAAAAAAAAAAAAAAA;
    rg_lower_word32 = 32'hAAAAAAAA;
    rg_lower_word32_full = 1'h0;
    rg_lrsc_pa = 32'hAAAAAAAA;
    rg_lrsc_valid = 1'h0;
    rg_op = 2'h2;
    rg_pa = 32'hAAAAAAAA;
    rg_pte_pa = 32'hAAAAAAAA;
    rg_st_amo_val = 64'hAAAAAAAAAAAAAAAA;
    rg_state = 4'hA;
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
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", mem_req_wr_addr_awaddr__h2592);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", x__h2639);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("                       ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", mem_req_wr_data_wdata__h2818);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", mem_req_wr_data_wstrb__h2819);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 7'd127 &&
	  cfg_verbosity != 4'd0 &&
	  !f_reset_reqs$D_OUT)
	begin
	  v__h4093 = $stime;
	  #0;
	end
    v__h4087 = v__h4093 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 7'd127 &&
	  cfg_verbosity != 4'd0 &&
	  !f_reset_reqs$D_OUT)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_reset: %0d sets x %0d ways: all tag states reset to CTAG_EMPTY",
		   v__h4087,
		   "D_MMU_Cache",
		   $signed(32'd128),
		   $signed(32'd2));
	else
	  $display("%0d: %s.rl_reset: %0d sets x %0d ways: all tag states reset to CTAG_EMPTY",
		   v__h4087,
		   "I_MMU_Cache",
		   $signed(32'd128),
		   $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 7'd127 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  f_reset_reqs$D_OUT)
	begin
	  v__h4192 = $stime;
	  #0;
	end
    v__h4186 = v__h4192 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 7'd127 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  f_reset_reqs$D_OUT)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_reset: Flushed", v__h4186, "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_reset: Flushed", v__h4186, "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h4341 = $stime;
	  #0;
	end
    v__h4335 = v__h4341 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_probe_and_immed_rsp; eaddr %0h",
		   v__h4335,
		   "D_MMU_Cache",
		   rg_addr);
	else
	  $display("%0d: %s: rl_probe_and_immed_rsp; eaddr %0h",
		   v__h4335,
		   "I_MMU_Cache",
		   rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$display("        eaddr = {CTag 0x%0h  CSet 0x%0h  Word64 0x%0h  Byte 0x%0h}",
		 pa_ctag__h5533,
		 rg_addr[11:5],
		 rg_addr[4:3],
		 rg_addr[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("        CSet 0x%0x: (state, tag):", rg_addr[11:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(" (");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  ram_state_and_ctag_cset$DOB[22])
	$write("CTAG_CLEAN");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  !ram_state_and_ctag_cset$DOB[22])
	$write("CTAG_EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  ram_state_and_ctag_cset$DOB[22])
	$write(", 0x%0x", ram_state_and_ctag_cset$DOB[21:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  !ram_state_and_ctag_cset$DOB[22])
	$write(", --");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(")");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(" (");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  ram_state_and_ctag_cset$DOB[45])
	$write("CTAG_CLEAN");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  !ram_state_and_ctag_cset$DOB[45])
	$write("CTAG_EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  ram_state_and_ctag_cset$DOB[45])
	$write(", 0x%0x", ram_state_and_ctag_cset$DOB[44:23]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  !ram_state_and_ctag_cset$DOB[45])
	$write(", --");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(")");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("        CSet 0x%0x, Word64 0x%0x: ",
	       rg_addr[11:5],
	       rg_addr[4:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(" 0x%0x", ram_word64_set$DOB[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(" 0x%0x", ram_word64_set$DOB[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("    TLB result: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("VM_Xlate_Result { ", "outcome: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("VM_XLATE_OK");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "pa: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'hA, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp && dmem_not_imem &&
	  !soc_map$m_is_mem_addr &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$display("    => IO_REQ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d162)
	$display("        ASSERTION ERROR: fn_test_cache_hit_or_miss: multiple hits in set at [%0d] and [%0d]",
		 $signed(32'd1),
		 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d361)
	begin
	  v__h19635 = $stime;
	  #0;
	end
    v__h19629 = v__h19635 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d361)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h19629,
		   "D_MMU_Cache",
		   rg_addr,
		   word64__h5847,
		   64'd0);
	else
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h19629,
		   "I_MMU_Cache",
		   rg_addr,
		   word64__h5847,
		   64'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d369)
	$display("        AMO LR: reserving PA 0x%0h", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d361)
	$display("        Read-hit: addr 0x%0h word64 0x%0h",
		 rg_addr,
		 word64__h5847);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d372)
	$display("        Read Miss: -> CACHE_START_REFILL.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d378)
	$display("        AMO LR: cache refill: cancelling LR/SC reservation for PA 0x%0h",
		 rg_lrsc_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d535)
	$display("        ST: cancelling LR/SC reservation for PA", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op == 2'd2 &&
	  rg_amo_funct7[6:2] == 5'b00011 &&
	  rg_lrsc_valid &&
	  !rg_lrsc_pa_8_EQ_rg_addr_9___d99 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$display("        AMO SC: fail: reserved addr 0x%0h, this address 0x%0h",
		 rg_lrsc_pa,
		 rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op == 2'd2 &&
	  rg_amo_funct7[6:2] == 5'b00011 &&
	  !rg_lrsc_valid &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$display("        AMO SC: fail due to invalid LR/SC reservation");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_dmem_not_imem_57_OR_soc_map_m_is_mem_addr__ETC___d547)
	$display("        AMO SC result = %0d", lrsc_result__h20012);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d550)
	$display("        Write-Cache-Hit: pa 0x%0h word64 0x%0h",
		 rg_addr,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d550)
	$write("        New Word64_Set:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d550)
	$write("        CSet 0x%0x, Word64 0x%0x: ",
	       rg_addr[11:5],
	       rg_addr[4:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d550)
	$write(" 0x%0x",
	       IF_NOT_ram_state_and_ctag_cset_b_read__05_BIT__ETC___d448);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d550)
	$write(" 0x%0x",
	       IF_ram_state_and_ctag_cset_b_read__05_BIT_45_1_ETC___d447);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d550)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op != 2'd0 &&
	  (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	  (rg_op == 2'd1 ||
	   rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	  NOT_rg_op_4_EQ_2_6_41_OR_NOT_rg_amo_funct7_7_B_ETC___d552)
	$display("        Write-Cache-Miss: pa 0x%0h word64 0x%0h",
		 rg_addr,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d558)
	$display("        Write-Cache-Hit/Miss: eaddr 0x%0h word64 0x%0h",
		 rg_addr,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d558)
	$display("        => rl_write_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op_4_EQ_2_6_AND_rg_amo_funct7_7_BITS_6_TO_2_ETC___d562)
	begin
	  v__h23351 = $stime;
	  #0;
	end
    v__h23345 = v__h23351 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op_4_EQ_2_6_AND_rg_amo_funct7_7_BITS_6_TO_2_ETC___d562)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h23345,
		   "D_MMU_Cache",
		   rg_addr,
		   64'd1,
		   64'd0);
	else
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h23345,
		   "I_MMU_Cache",
		   rg_addr,
		   64'd1,
		   64'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op_4_EQ_2_6_AND_rg_amo_funct7_7_BITS_6_TO_2_ETC___d562)
	$display("        AMO SC: Fail response for addr 0x%0h", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op != 2'd0 &&
	  (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	  rg_op != 2'd1 &&
	  (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	  NOT_ram_state_and_ctag_cset_b_read__05_BIT_22__ETC___d370)
	$display("        AMO Miss: -> CACHE_START_REFILL.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d570)
	$display("        AMO: addr 0x%0h amo_f7 0x%0h f3 %0d rs2_val 0x%0h",
		 rg_addr,
		 rg_amo_funct7,
		 rg_f3,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d570)
	$display("          PA 0x%0h ", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d570)
	$display("          Cache word64 0x%0h, load-result 0x%0h",
		 word64__h5847,
		 word64__h5847);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d570)
	$display("          0x%0h  op  0x%0h -> 0x%0h",
		 word64__h5847,
		 word64__h5847,
		 new_st_val__h23573);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d570)
	$write("          New Word64_Set:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d570)
	$write("        CSet 0x%0x, Word64 0x%0x: ",
	       rg_addr[11:5],
	       rg_addr[4:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d570)
	$write(" 0x%0x",
	       IF_NOT_ram_state_and_ctag_cset_b_read__05_BIT__ETC___d525);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d570)
	$write(" 0x%0x",
	       IF_ram_state_and_ctag_cset_b_read__05_BIT_45_1_ETC___d524);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  NOT_rg_op_4_EQ_0_5_40_AND_NOT_rg_op_4_EQ_2_6_4_ETC___d570)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	  rg_op != 2'd0 &&
	  (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	  rg_op != 2'd1 &&
	  (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	  ram_state_and_ctag_cset_b_read__05_BIT_22_06_A_ETC___d572)
	$display("        AMO_op: cancelling LR/SC reservation for PA",
		 rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h26669 = $stime;
	  #0;
	end
    v__h26663 = v__h26669 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_start_cache_refill: ",
		   v__h26663,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_start_cache_refill: ",
		   v__h26663,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("    To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", cline_fabric_addr__h26722);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 8'd3);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 3'b011);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$display("    Victim way %0d; => CACHE_REFILL", tmp__h26885[0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	begin
	  v__h27408 = $stime;
	  #0;
	end
    v__h27402 = v__h27408 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_cache_refill_rsps_loop:",
		   v__h27402,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_cache_refill_rsps_loop:",
		   v__h27402,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[2:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600 &&
	  master_xactor_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600 &&
	  !master_xactor_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h27649 = $stime;
	  #0;
	end
    v__h27643 = v__h27649 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_cache_refill_rsps_loop: FABRIC_RSP_ERR: raising access exception %0d",
		   v__h27643,
		   "D_MMU_Cache",
		   access_exc_code__h2374);
	else
	  $display("%0d: %s.rl_cache_refill_rsps_loop: FABRIC_RSP_ERR: raising access exception %0d",
		   v__h27643,
		   "I_MMU_Cache",
		   access_exc_code__h2374);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  rg_word64_set_in_cache[1:0] == 2'd3 &&
	  (master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	   rg_error_during_refill) &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$display("    => MODULE_EXCEPTION_RSP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  rg_word64_set_in_cache[1:0] == 2'd3 &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !rg_error_during_refill &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$display("    => CACHE_REREQ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$display("        Updating Cache word64_set 0x%0h, word64_in_cline %0d) old => new",
		 rg_word64_set_in_cache,
		 rg_word64_set_in_cache[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write("        CSet 0x%0x, Word64 0x%0x: ",
	       rg_addr[11:5],
	       rg_word64_set_in_cache[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write(" 0x%0x", ram_word64_set$DOB[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write(" 0x%0x", ram_word64_set$DOB[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write("        CSet 0x%0x, Word64 0x%0x: ",
	       rg_addr[11:5],
	       rg_word64_set_in_cache[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write(" 0x%0x",
	       rg_victim_way ?
		 ram_word64_set$DOB[63:0] :
		 master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write(" 0x%0x",
	       rg_victim_way ?
		 master_xactor_f_rd_data$D_OUT[66:3] :
		 ram_word64_set$DOB[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__0_ULE_2_99___d600)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_rereq && NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$display("    fa_req_ram_B tagCSet [0x%0x] word64_set [0x%0d]",
		 rg_addr[11:5],
		 rg_addr[11:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h30045 = $stime;
	  #0;
	end
    v__h30039 = v__h30045 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_read_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h30039,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_read_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h30039,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", fabric_addr__h32167);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", value__h32296);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h30395 = $stime;
	  #0;
	end
    v__h30389 = v__h30395 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h30389,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h30389,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[2:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  master_xactor_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  !master_xactor_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h31495 = $stime;
	  #0;
	end
    v__h31489 = v__h31495 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h31489,
		   "D_MMU_Cache",
		   rg_addr,
		   ld_val__h30504);
	else
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h31489,
		   "I_MMU_Cache",
		   rg_addr,
		   ld_val__h30504);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h31602 = $stime;
	  #0;
	end
    v__h31596 = v__h31602 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_read_rsp: FABRIC_RSP_ERR: raising trap LOAD_ACCESS_FAULT",
		   v__h31596,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_io_read_rsp: FABRIC_RSP_ERR: raising trap LOAD_ACCESS_FAULT",
		   v__h31596,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_maintain_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h31707 = $stime;
	  #0;
	end
    v__h31701 = v__h31707 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_maintain_io_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h31701,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_ld_val);
	else
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h31701,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_ld_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h31787 = $stime;
	  #0;
	end
    v__h31781 = v__h31787 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_io_write_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h31781,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
	else
	  $display("%0d: %s: rl_io_write_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h31781,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_write_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$display("    => rl_ST_AMO_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h31997 = $stime;
	  #0;
	end
    v__h31991 = v__h31997 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_io_AMO_SC_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h31991,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
	else
	  $display("%0d: %s: rl_io_AMO_SC_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h31991,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$display("    FAIL due to I/O address.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$display("    => rl_ST_AMO_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h32115 = $stime;
	  #0;
	end
    v__h32109 = v__h32115 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_AMO_op_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h32109,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_AMO_op_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h32109,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", fabric_addr__h32167);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", value__h32296);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h32409 = $stime;
	  #0;
	end
    v__h32403 = v__h32409 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_AMO_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h32403,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_AMO_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h32403,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[2:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  master_xactor_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  !master_xactor_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h32584 = $stime;
	  #0;
	end
    v__h32578 = v__h32584 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_io_AMO_read_rsp; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h32578,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
	else
	  $display("%0d: %s: rl_io_AMO_read_rsp; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h32578,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h34843 = $stime;
	  #0;
	end
    v__h34837 = v__h34843 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h34837,
		   "D_MMU_Cache",
		   rg_addr,
		   new_ld_val__h32710);
	else
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h34837,
		   "I_MMU_Cache",
		   rg_addr,
		   new_ld_val__h32710);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$display("    => rl_ST_AMO_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h32680 = $stime;
	  #0;
	end
    v__h32674 = v__h32680 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_AMO_read_rsp: FABRIC_RSP_ERR: raising trap STORE_AMO_ACCESS_FAULT",
		   v__h32674,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_io_AMO_read_rsp: FABRIC_RSP_ERR: raising trap STORE_AMO_ACCESS_FAULT",
		   v__h32674,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h35450 = $stime;
	  #0;
	end
    v__h35444 = v__h35450 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	if (dmem_not_imem)
	  $write("%0d: %s.rl_discard_write_rsp: pending %0d ",
		 v__h35444,
		 "D_MMU_Cache",
		 $unsigned(b__h26623));
	else
	  $write("%0d: %s.rl_discard_write_rsp: pending %0d ",
		 v__h35444,
		 "I_MMU_Cache",
		 $unsigned(b__h26623));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", master_xactor_f_wr_resp$D_OUT[5:2]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", master_xactor_f_wr_resp$D_OUT[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	begin
	  v__h35411 = $stime;
	  #0;
	end
    v__h35405 = v__h35411 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_discard_write_rsp: fabric response error: exit",
		   v__h35405,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_discard_write_rsp: fabric response error: exit",
		   v__h35405,
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
	  v__h3625 = $stime;
	  #0;
	end
    v__h3619 = v__h3625 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_reset)
	if (dmem_not_imem)
	  $display("%0d: %s: cache size %0d KB, associativity %0d, line size %0d bytes (= %0d XLEN words)",
		   v__h3619,
		   "D_MMU_Cache",
		   $signed(32'd8),
		   $signed(32'd2),
		   $signed(32'd32),
		   $signed(32'd8));
	else
	  $display("%0d: %s: cache size %0d KB, associativity %0d, line size %0d bytes (= %0d XLEN words)",
		   v__h3619,
		   "I_MMU_Cache",
		   $signed(32'd8),
		   $signed(32'd2),
		   $signed(32'd32),
		   $signed(32'd8));
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	begin
	  v__h35798 = $stime;
	  #0;
	end
    v__h35792 = v__h35798 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("%0d: %m.req: op:", v__h35792);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__0_ULE_1_1___d42 && req_op == 2'd0)
	$write("CACHE_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__0_ULE_1_1___d42 && req_op == 2'd1)
	$write("CACHE_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  req_op != 2'd0 &&
	  req_op != 2'd1)
	$write("CACHE_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(" f3:%0d addr:0x%0h st_value:0x%0h",
	       req_f3,
	       req_addr,
	       req_st_value,
	       "\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write("    priv:");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  req_priv == 2'b0)
	$write("U");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  req_priv == 2'b01)
	$write("S");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  req_priv == 2'b11)
	$write("M");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__0_ULE_1_1___d42 &&
	  req_priv != 2'b0 &&
	  req_priv != 2'b01 &&
	  req_priv != 2'b11)
	$write("RESERVED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$write(" sstatus_SUM:%0d mstatus_MXR:%0d satp:0x%0h",
	       req_sstatus_SUM,
	       req_mstatus_MXR,
	       req_satp,
	       "\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$display("    amo_funct7 = 0x%0h", req_amo_funct7);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req &&
	  req_f3_BITS_1_TO_0_36_EQ_0b0_37_OR_req_f3_BITS_ETC___d966 &&
	  NOT_cfg_verbosity_read__0_ULE_1_1___d42)
	$display("    fa_req_ram_B tagCSet [0x%0x] word64_set [0x%0d]",
		 req_addr[11:5],
		 req_addr[11:3]);
  end
  // synopsys translate_on
endmodule