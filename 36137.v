module outputs
  wire [578 : 0] l2_to_l1_server_response_first;
  wire [129 : 0] mav_request_pa;
  wire [68 : 0] l1_to_l2_client_request_first;
  wire RDY_flush_server_request_put,
       RDY_flush_server_response_get,
       RDY_l1_to_l2_client_request_deq,
       RDY_l1_to_l2_client_request_first,
       RDY_l1_to_l2_client_request_notEmpty,
       RDY_l1_to_l2_client_response_enq,
       RDY_l1_to_l2_client_response_notFull,
       RDY_l2_to_l1_server_request_enq,
       RDY_l2_to_l1_server_request_notFull,
       RDY_l2_to_l1_server_response_deq,
       RDY_l2_to_l1_server_response_first,
       RDY_l2_to_l1_server_response_notEmpty,
       RDY_mav_request_pa,
       RDY_mv_refill_ok,
       l1_to_l2_client_request_notEmpty,
       l1_to_l2_client_response_notFull,
       l2_to_l1_server_request_notFull,
       l2_to_l1_server_response_notEmpty,
       mv_is_idle,
       mv_refill_ok;
  // register rg_amo_funct7
  reg [6 : 0] rg_amo_funct7;
  wire [6 : 0] rg_amo_funct7$D_IN;
  wire rg_amo_funct7$EN;
  // register rg_cache_op
  reg [1 : 0] rg_cache_op;
  wire [1 : 0] rg_cache_op$D_IN;
  wire rg_cache_op$EN;
  // register rg_cset_in_cache
  reg [5 : 0] rg_cset_in_cache;
  reg [5 : 0] rg_cset_in_cache$D_IN;
  wire rg_cset_in_cache$EN;
  // register rg_cword_in_cline
  reg [2 : 0] rg_cword_in_cline;
  reg [2 : 0] rg_cword_in_cline$D_IN;
  wire rg_cword_in_cline$EN;
  // register rg_error_during_refill
  reg rg_error_during_refill;
  wire rg_error_during_refill$D_IN, rg_error_during_refill$EN;
  // register rg_f3
  reg [2 : 0] rg_f3;
  wire [2 : 0] rg_f3$D_IN;
  wire rg_f3$EN;
  // register rg_fsm_state
  reg [3 : 0] rg_fsm_state;
  reg [3 : 0] rg_fsm_state$D_IN;
  wire rg_fsm_state$EN;
  // register rg_lrsc_pa
  reg [63 : 0] rg_lrsc_pa;
  wire [63 : 0] rg_lrsc_pa$D_IN;
  wire rg_lrsc_pa$EN;
  // register rg_lrsc_size
  reg [1 : 0] rg_lrsc_size;
  wire [1 : 0] rg_lrsc_size$D_IN;
  wire rg_lrsc_size$EN;
  // register rg_lrsc_valid
  reg rg_lrsc_valid;
  wire rg_lrsc_valid$D_IN, rg_lrsc_valid$EN;
  // register rg_new_cset_meta
  reg [107 : 0] rg_new_cset_meta;
  wire [107 : 0] rg_new_cset_meta$D_IN;
  wire rg_new_cset_meta$EN;
  // register rg_new_meta_state
  reg [1 : 0] rg_new_meta_state;
  wire [1 : 0] rg_new_meta_state$D_IN;
  wire rg_new_meta_state$EN;
  // register rg_pa
  reg [63 : 0] rg_pa;
  reg [63 : 0] rg_pa$D_IN;
  wire rg_pa$EN;
  // register rg_post_wb_fsm_state
  reg [3 : 0] rg_post_wb_fsm_state;
  reg [3 : 0] rg_post_wb_fsm_state$D_IN;
  wire rg_post_wb_fsm_state$EN;
  // register rg_post_wb_meta_state
  reg [1 : 0] rg_post_wb_meta_state;
  reg [1 : 0] rg_post_wb_meta_state$D_IN;
  wire rg_post_wb_meta_state$EN;
  // register rg_read_cline_buf
  reg [511 : 0] rg_read_cline_buf;
  wire [511 : 0] rg_read_cline_buf$D_IN;
  wire rg_read_cline_buf$EN;
  // register rg_save_cset_in_cache
  reg [5 : 0] rg_save_cset_in_cache;
  wire [5 : 0] rg_save_cset_in_cache$D_IN;
  wire rg_save_cset_in_cache$EN;
  // register rg_save_cword_in_cline
  reg [2 : 0] rg_save_cword_in_cline;
  wire [2 : 0] rg_save_cword_in_cline$D_IN;
  wire rg_save_cword_in_cline$EN;
  // register rg_save_fsm_state
  reg [3 : 0] rg_save_fsm_state;
  wire [3 : 0] rg_save_fsm_state$D_IN;
  wire rg_save_fsm_state$EN;
  // register rg_save_pa
  reg [63 : 0] rg_save_pa;
  wire [63 : 0] rg_save_pa$D_IN;
  wire rg_save_pa$EN;
  // register rg_save_va
  reg [63 : 0] rg_save_va;
  wire [63 : 0] rg_save_va$D_IN;
  wire rg_save_va$EN;
  // register rg_save_way_in_cset
  reg rg_save_way_in_cset;
  wire rg_save_way_in_cset$D_IN, rg_save_way_in_cset$EN;
  // register rg_va
  reg [63 : 0] rg_va;
  reg [63 : 0] rg_va$D_IN;
  wire rg_va$EN;
  // register rg_victim_way
  reg rg_victim_way;
  wire rg_victim_way$D_IN, rg_victim_way$EN;
  // register rg_way_in_cset
  reg rg_way_in_cset;
  reg rg_way_in_cset$D_IN;
  wire rg_way_in_cset$EN;
  // register rg_write_cline_buf
  reg [511 : 0] rg_write_cline_buf;
  wire [511 : 0] rg_write_cline_buf$D_IN;
  wire rg_write_cline_buf$EN;
  // ports of submodule f_L1_to_L2_reqs
  wire [68 : 0] f_L1_to_L2_reqs$D_IN, f_L1_to_L2_reqs$D_OUT;
  wire f_L1_to_L2_reqs$CLR,
       f_L1_to_L2_reqs$DEQ,
       f_L1_to_L2_reqs$EMPTY_N,
       f_L1_to_L2_reqs$ENQ,
       f_L1_to_L2_reqs$FULL_N;
  // ports of submodule f_L1_to_L2_rsps
  reg [578 : 0] f_L1_to_L2_rsps$D_IN;
  wire [578 : 0] f_L1_to_L2_rsps$D_OUT;
  wire f_L1_to_L2_rsps$CLR,
       f_L1_to_L2_rsps$DEQ,
       f_L1_to_L2_rsps$EMPTY_N,
       f_L1_to_L2_rsps$ENQ,
       f_L1_to_L2_rsps$FULL_N;
  // ports of submodule f_L2_to_L1_reqs
  wire [65 : 0] f_L2_to_L1_reqs$D_IN, f_L2_to_L1_reqs$D_OUT;
  wire f_L2_to_L1_reqs$CLR,
       f_L2_to_L1_reqs$DEQ,
       f_L2_to_L1_reqs$EMPTY_N,
       f_L2_to_L1_reqs$ENQ,
       f_L2_to_L1_reqs$FULL_N;
  // ports of submodule f_L2_to_L1_rsps
  wire [578 : 0] f_L2_to_L1_rsps$D_IN, f_L2_to_L1_rsps$D_OUT;
  wire f_L2_to_L1_rsps$CLR,
       f_L2_to_L1_rsps$DEQ,
       f_L2_to_L1_rsps$EMPTY_N,
       f_L2_to_L1_rsps$ENQ,
       f_L2_to_L1_rsps$FULL_N;
  // ports of submodule f_flush_reqs
  wire f_flush_reqs$CLR,
       f_flush_reqs$DEQ,
       f_flush_reqs$D_IN,
       f_flush_reqs$D_OUT,
       f_flush_reqs$EMPTY_N,
       f_flush_reqs$ENQ,
       f_flush_reqs$FULL_N;
  // ports of submodule f_flush_rsps
  wire f_flush_rsps$CLR,
       f_flush_rsps$DEQ,
       f_flush_rsps$EMPTY_N,
       f_flush_rsps$ENQ,
       f_flush_rsps$FULL_N;
  // ports of submodule ram_cset_cword
  reg [127 : 0] ram_cset_cword$DIA;
  reg [8 : 0] ram_cset_cword$ADDRA;
  wire [127 : 0] ram_cset_cword$DIB, ram_cset_cword$DOA;
  wire [8 : 0] ram_cset_cword$ADDRB;
  wire ram_cset_cword$ENA,
       ram_cset_cword$ENB,
       ram_cset_cword$WEA,
       ram_cset_cword$WEB;
  // ports of submodule ram_cset_meta
  reg [107 : 0] ram_cset_meta$DIA, ram_cset_meta$DIB;
  reg [5 : 0] ram_cset_meta$ADDRA;
  wire [107 : 0] ram_cset_meta$DOA;
  wire [5 : 0] ram_cset_meta$ADDRB;
  wire ram_cset_meta$ENA,
       ram_cset_meta$ENB,
       ram_cset_meta$WEA,
       ram_cset_meta$WEB;
  // rule scheduling signals
  wire CAN_FIRE_RL_rl_downgrade_req_from_L2_A,
       CAN_FIRE_RL_rl_downgrade_req_from_L2_B,
       CAN_FIRE_RL_rl_downgrade_req_from_L2_C,
       CAN_FIRE_RL_rl_flush_loop,
       CAN_FIRE_RL_rl_flush_loop_writeback_sequel,
       CAN_FIRE_RL_rl_flush_start,
       CAN_FIRE_RL_rl_initialize,
       CAN_FIRE_RL_rl_refill_loop,
       CAN_FIRE_RL_rl_refill_loop_final,
       CAN_FIRE_RL_rl_refill_start,
       CAN_FIRE_RL_rl_replace,
       CAN_FIRE_RL_rl_writeback_loop,
       CAN_FIRE_flush_server_request_put,
       CAN_FIRE_flush_server_response_get,
       CAN_FIRE_l1_to_l2_client_request_deq,
       CAN_FIRE_l1_to_l2_client_response_enq,
       CAN_FIRE_l2_to_l1_server_request_enq,
       CAN_FIRE_l2_to_l1_server_response_deq,
       CAN_FIRE_ma_request_va,
       CAN_FIRE_mav_request_pa,
       WILL_FIRE_RL_rl_downgrade_req_from_L2_A,
       WILL_FIRE_RL_rl_downgrade_req_from_L2_B,
       WILL_FIRE_RL_rl_downgrade_req_from_L2_C,
       WILL_FIRE_RL_rl_flush_loop,
       WILL_FIRE_RL_rl_flush_loop_writeback_sequel,
       WILL_FIRE_RL_rl_flush_start,
       WILL_FIRE_RL_rl_initialize,
       WILL_FIRE_RL_rl_refill_loop,
       WILL_FIRE_RL_rl_refill_loop_final,
       WILL_FIRE_RL_rl_refill_start,
       WILL_FIRE_RL_rl_replace,
       WILL_FIRE_RL_rl_writeback_loop,
       WILL_FIRE_flush_server_request_put,
       WILL_FIRE_flush_server_response_get,
       WILL_FIRE_l1_to_l2_client_request_deq,
       WILL_FIRE_l1_to_l2_client_response_enq,
       WILL_FIRE_l2_to_l1_server_request_enq,
       WILL_FIRE_l2_to_l1_server_response_deq,
       WILL_FIRE_ma_request_va,
       WILL_FIRE_mav_request_pa;
  // inputs to muxes for submodule ports
  wire [578 : 0] MUX_f_L1_to_L2_rsps$enq_1__VAL_1,
		 MUX_f_L1_to_L2_rsps$enq_1__VAL_2,
		 MUX_f_L1_to_L2_rsps$enq_1__VAL_3,
		 MUX_f_L1_to_L2_rsps$enq_1__VAL_4;
  wire [127 : 0] MUX_ram_cset_cword$b_put_3__VAL_1,
		 MUX_ram_cset_cword$b_put_3__VAL_2;
  wire [107 : 0] MUX_ram_cset_meta$b_put_3__VAL_2,
		 MUX_ram_cset_meta$b_put_3__VAL_3,
		 MUX_ram_cset_meta$b_put_3__VAL_4,
		 MUX_ram_cset_meta$b_put_3__VAL_5,
		 MUX_ram_cset_meta$b_put_3__VAL_6;
  wire [68 : 0] MUX_f_L1_to_L2_reqs$enq_1__VAL_1,
		MUX_f_L1_to_L2_reqs$enq_1__VAL_2;
  wire [8 : 0] MUX_ram_cset_cword$a_put_2__VAL_1,
	       MUX_ram_cset_cword$a_put_2__VAL_2,
	       MUX_ram_cset_cword$a_put_2__VAL_4,
	       MUX_ram_cset_cword$a_put_2__VAL_5,
	       MUX_ram_cset_cword$a_put_2__VAL_9,
	       MUX_ram_cset_cword$b_put_2__VAL_1;
  wire [5 : 0] MUX_ram_cset_meta$a_put_2__VAL_1;
  wire [3 : 0] MUX_rg_fsm_state$write_1__VAL_2,
	       MUX_rg_fsm_state$write_1__VAL_4,
	       MUX_rg_fsm_state$write_1__VAL_5,
	       MUX_rg_fsm_state$write_1__VAL_7,
	       MUX_rg_fsm_state$write_1__VAL_8,
	       MUX_rg_fsm_state$write_1__VAL_9;
  wire MUX_f_L1_to_L2_reqs$enq_1__SEL_1,
       MUX_f_L1_to_L2_rsps$enq_1__SEL_1,
       MUX_f_L1_to_L2_rsps$enq_1__SEL_2,
       MUX_f_L1_to_L2_rsps$enq_1__SEL_3,
       MUX_f_L1_to_L2_rsps$enq_1__SEL_4,
       MUX_ram_cset_cword$a_put_1__SEL_1,
       MUX_ram_cset_cword$a_put_1__SEL_2,
       MUX_ram_cset_cword$a_put_1__SEL_3,
       MUX_ram_cset_cword$a_put_1__SEL_4,
       MUX_ram_cset_cword$a_put_1__SEL_5,
       MUX_ram_cset_cword$a_put_1__SEL_6,
       MUX_ram_cset_cword$b_put_1__SEL_1,
       MUX_ram_cset_cword$b_put_1__SEL_2,
       MUX_ram_cset_meta$a_put_1__SEL_1,
       MUX_ram_cset_meta$a_put_1__SEL_2,
       MUX_ram_cset_meta$a_put_1__SEL_3,
       MUX_ram_cset_meta$b_put_1__SEL_2,
       MUX_ram_cset_meta$b_put_1__SEL_3,
       MUX_rg_cset_in_cache$write_1__SEL_4,
       MUX_rg_cset_in_cache$write_1__SEL_5,
       MUX_rg_cword_in_cline$write_1__SEL_3,
       MUX_rg_cword_in_cline$write_1__SEL_4,
       MUX_rg_fsm_state$write_1__SEL_2,
       MUX_rg_fsm_state$write_1__SEL_3,
       MUX_rg_fsm_state$write_1__SEL_5,
       MUX_rg_way_in_cset$write_1__SEL_1,
       MUX_rg_way_in_cset$write_1__SEL_3,
       MUX_rg_way_in_cset$write_1__VAL_1,
       MUX_rg_way_in_cset$write_1__VAL_2,
       MUX_rg_way_in_cset$write_1__VAL_4;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h38795;
  reg [31 : 0] v__h53647;
  reg [31 : 0] v__h56308;
  reg [31 : 0] v__h59267;
  reg [31 : 0] v__h37713;
  reg [31 : 0] v__h2839;
  reg [31 : 0] v__h4336;
  reg [31 : 0] v__h4907;
  reg [31 : 0] v__h6267;
  reg [31 : 0] v__h7296;
  reg [31 : 0] v__h10934;
  reg [31 : 0] v__h12375;
  reg [31 : 0] v__h13621;
  reg [31 : 0] v__h14301;
  reg [31 : 0] v__h17257;
  reg [31 : 0] v__h18985;
  reg [31 : 0] v__h19064;
  reg [31 : 0] v__h19319;
  reg [31 : 0] v__h20972;
  reg [31 : 0] v__h35844;
  reg [31 : 0] v__h37444;
  reg [31 : 0] v__h37562;
  reg [31 : 0] v__h2833;
  reg [31 : 0] v__h4330;
  reg [31 : 0] v__h4901;
  reg [31 : 0] v__h6261;
  reg [31 : 0] v__h7290;
  reg [31 : 0] v__h10928;
  reg [31 : 0] v__h12369;
  reg [31 : 0] v__h13615;
  reg [31 : 0] v__h14295;
  reg [31 : 0] v__h17251;
  reg [31 : 0] v__h18979;
  reg [31 : 0] v__h19058;
  reg [31 : 0] v__h19313;
  reg [31 : 0] v__h20966;
  reg [31 : 0] v__h35838;
  reg [31 : 0] v__h37438;
  reg [31 : 0] v__h37556;
  reg [31 : 0] v__h37707;
  reg [31 : 0] v__h38789;
  reg [31 : 0] v__h53641;
  reg [31 : 0] v__h56302;
  reg [31 : 0] v__h59261;
  // synopsys translate_on
  // remaining internal signals
  reg [63 : 0] CASE_mav_request_pa_pa_BITS_2_TO_0_0x0_old_cwo_ETC__q3,
	       CASE_mav_request_pa_pa_BITS_2_TO_0_0x0_old_cwo_ETC__q6,
	       IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1000,
	       IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1067,
	       IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1076,
	       IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d990,
	       SEL_ARR_ram_cset_cword_a_read_BITS_63_TO_0_0_r_ETC___d14,
	       _theResult_____2__h58772,
	       mask__h58707,
	       n__h53984,
	       n__h59583,
	       old_cword__h53973,
	       y__h53235;
  reg [51 : 0] CASE_NOT_ram_cset_metaDOA_BITS_107_TO_106_EQ__ETC__q7,
	       ctag__h3125,
	       new_meta_ctag__h14727,
	       tag__h5333;
  reg [1 : 0] SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309,
	      SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125;
  reg CASE_mav_request_pa_req_BITS_204_TO_203_0b0_da_ETC__q2;
  wire [511 : 0] f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1;
  wire [383 : 0] DONTCARE_CONCAT_IF_rg_cword_in_cline_EQ_0_0_TH_ETC___d252;
  wire [255 : 0] DONTCARE_CONCAT_IF_rg_cword_in_cline_EQ_0_0_TH_ETC___d245;
  wire [129 : 0] IF_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO__ETC___d1199,
		 IF_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO__ETC___d1200,
		 IF_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO__ETC___d1201,
		 IF_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO__ETC___d1202;
  wire [127 : 0] IF_mav_request_pa_req_BITS_204_TO_203_96_EQ_0b_ETC___d1196;
  wire [63 : 0] IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1012,
		IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1086,
		IF_mav_request_pa_req_BITS_204_TO_203_96_EQ_0b_ETC___d1021,
		IF_mav_request_pa_req_BITS_204_TO_203_96_EQ_0b_ETC___d1023,
		IF_ram_cset_meta_a_read__8_BITS_107_TO_106_12__ETC___d1015,
		IF_ram_cset_meta_a_read__8_BITS_107_TO_106_12__ETC___d1087,
		SEXT_ram_cset_cword_a_read_BITS_63_TO_0_0_AND__ETC___d1020,
		cline_pa__h15519,
		cline_pa__h35106,
		cword__h10620,
		data1__h52960,
		data__h52434,
		data__h52435,
		final_st_val__h58776,
		final_st_val__h58866,
		final_st_val__h58944,
		final_st_val__h58948,
		final_st_val__h58952,
		final_st_val__h58956,
		final_st_val__h58961,
		final_st_val__h58967,
		final_st_val__h58972,
		l1_to_l2_req_addr__h6583,
		new_st_val__h58609,
		pa__h14914,
		pa__h14935,
		pa__h15146,
		pa__h15170,
		pa__h21105,
		pa__h21126,
		pa__h39306,
		pa__h39327,
		result__h53223,
		result__h53290,
		valid_info_data__h21332,
		valid_info_data__h39527,
		victim_cline_pa__h5091,
		w1___1__h58835,
		w1__h58765,
		w2___1__h58836,
		w2__h58767,
		x__h21578,
		x__h39772,
		x_addr__h3120,
		x_addr__h61346,
		y__h21579,
		y__h21596,
		y__h27911,
		y__h39773,
		y__h39790,
		y__h46105;
  wire [53 : 0] IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d649,
		IF_ram_cset_meta_a_read__8_BITS_107_TO_106_12__ETC___d652;
  wire [51 : 0] IF_rg_way_in_cset_3_THEN_IF_rg_way_in_cset_3_T_ETC___d392,
		IF_rg_way_in_cset_3_THEN_SEL_ARR_IF_rg_way_in__ETC___d408,
		ctag__h14447,
		ctag__h14452;
  wire [31 : 0] data2434_BITS_31_TO_0__q4,
		mav_request_pa_req_BITS_106_TO_75__q5;
  wire [8 : 0] cset_cword_in_cache___1__h36760,
	       cset_cword_in_cache__h35238,
	       next_cset_cword_in_cache__h10894;
  wire [5 : 0] next_cset_in_cache__h16246, shamt__h58661;
  wire [2 : 0] IF_rg_cache_op_68_EQ_1_69_OR_rg_cache_op_68_EQ_ETC___d178,
	       cword_in_cline__h3093;
  wire [1 : 0] IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520,
	       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796,
	       IF_NOT_ram_cset_meta_a_read__8_BITS_53_TO_52_1_ETC___d515,
	       IF_NOT_ram_cset_meta_a_read__8_BITS_53_TO_52_1_ETC___d792,
	       IF_rg_way_in_cset_3_THEN_IF_rg_way_in_cset_3_T_ETC___d378,
	       IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d305,
	       IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d307,
	       IF_rg_way_in_cset_3_THEN_rg_new_meta_state_11__ETC___d394,
	       num_valids__h21487,
	       num_valids__h39681,
	       tmp__h5074,
	       tmp__h5075,
	       valid_info_num_valids__h21330,
	       valid_info_num_valids__h39525;
  wire IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1110,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1116,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1123,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1135,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1137,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1139,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1141,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1143,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1145,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1147,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1149,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1151,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1152,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d524,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d933,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d942,
       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d944,
       NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1100,
       NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1107,
       NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1112,
       NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1158,
       NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1159,
       NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1185,
       NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1188,
       NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633,
       NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877,
       NOT_SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cs_ETC___d426,
       NOT_SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cs_ETC___d428,
       NOT_SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cs_ETC___d430,
       NOT_mav_request_pa_req_BITS_207_TO_206_04_EQ_1_ETC___d1171,
       NOT_mav_request_pa_req_BITS_207_TO_206_04_EQ_1_ETC___d1180,
       NOT_mav_request_pa_req_BITS_207_TO_206_04_EQ_2_ETC___d1178,
       NOT_verbosity_ULT_2_2___d23,
       SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d312,
       SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d320,
       _theResult___snd__h4989,
       ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788,
       ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_rg_ETC___d511,
       rg_cword_in_cline_EQ_7_AND_NOT_verbosity_EQ_0__ETC___d92,
       rg_lrsc_pa_35_EQ_mav_request_pa_pa___d936,
       victim_way__h4955,
       x__h16251;
  // action method ma_request_va
  assign CAN_FIRE_ma_request_va = 1'd1 ;
  assign WILL_FIRE_ma_request_va = EN_ma_request_va ;
  // actionvalue method mav_request_pa
  assign mav_request_pa =
	     (valid_info_num_valids__h39525 == 2'd1 &&
	      mav_request_pa_req[207:206] == 2'd0) ?
	       { 2'd1, data__h52435, 64'hAAAAAAAAAAAAAAAA } :
	       IF_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO__ETC___d1202 ;
  assign RDY_mav_request_pa =
	     rg_fsm_state == 4'd1 && !f_L2_to_L1_reqs$EMPTY_N &&
	     !f_flush_reqs$EMPTY_N &&
	     f_L1_to_L2_reqs$FULL_N ;
  assign CAN_FIRE_mav_request_pa =
	     rg_fsm_state == 4'd1 && !f_L2_to_L1_reqs$EMPTY_N &&
	     !f_flush_reqs$EMPTY_N &&
	     f_L1_to_L2_reqs$FULL_N ;
  assign WILL_FIRE_mav_request_pa = EN_mav_request_pa ;
  // value method mv_is_idle
  assign mv_is_idle = rg_fsm_state == 4'd1 ;
  // value method mv_refill_ok
  assign mv_refill_ok = !rg_error_during_refill ;
  assign RDY_mv_refill_ok = rg_fsm_state == 4'd1 ;
  // action method flush_server_request_put
  assign RDY_flush_server_request_put = f_flush_reqs$FULL_N ;
  assign CAN_FIRE_flush_server_request_put = f_flush_reqs$FULL_N ;
  assign WILL_FIRE_flush_server_request_put = EN_flush_server_request_put ;
  // action method flush_server_response_get
  assign RDY_flush_server_response_get = f_flush_rsps$EMPTY_N ;
  assign CAN_FIRE_flush_server_response_get = f_flush_rsps$EMPTY_N ;
  assign WILL_FIRE_flush_server_response_get = EN_flush_server_response_get ;
  // value method l1_to_l2_client_request_first
  assign l1_to_l2_client_request_first = f_L1_to_L2_reqs$D_OUT ;
  assign RDY_l1_to_l2_client_request_first = f_L1_to_L2_reqs$EMPTY_N ;
  // action method l1_to_l2_client_request_deq
  assign RDY_l1_to_l2_client_request_deq = f_L1_to_L2_reqs$EMPTY_N ;
  assign CAN_FIRE_l1_to_l2_client_request_deq = f_L1_to_L2_reqs$EMPTY_N ;
  assign WILL_FIRE_l1_to_l2_client_request_deq =
	     EN_l1_to_l2_client_request_deq ;
  // value method l1_to_l2_client_request_notEmpty
  assign l1_to_l2_client_request_notEmpty = f_L1_to_L2_reqs$EMPTY_N ;
  assign RDY_l1_to_l2_client_request_notEmpty = 1'd1 ;
  // action method l1_to_l2_client_response_enq
  assign RDY_l1_to_l2_client_response_enq = f_L2_to_L1_rsps$FULL_N ;
  assign CAN_FIRE_l1_to_l2_client_response_enq = f_L2_to_L1_rsps$FULL_N ;
  assign WILL_FIRE_l1_to_l2_client_response_enq =
	     EN_l1_to_l2_client_response_enq ;
  // value method l1_to_l2_client_response_notFull
  assign l1_to_l2_client_response_notFull = f_L2_to_L1_rsps$FULL_N ;
  assign RDY_l1_to_l2_client_response_notFull = 1'd1 ;
  // action method l2_to_l1_server_request_enq
  assign RDY_l2_to_l1_server_request_enq = f_L2_to_L1_reqs$FULL_N ;
  assign CAN_FIRE_l2_to_l1_server_request_enq = f_L2_to_L1_reqs$FULL_N ;
  assign WILL_FIRE_l2_to_l1_server_request_enq =
	     EN_l2_to_l1_server_request_enq ;
  // value method l2_to_l1_server_request_notFull
  assign l2_to_l1_server_request_notFull = f_L2_to_L1_reqs$FULL_N ;
  assign RDY_l2_to_l1_server_request_notFull = 1'd1 ;
  // value method l2_to_l1_server_response_first
  assign l2_to_l1_server_response_first = f_L1_to_L2_rsps$D_OUT ;
  assign RDY_l2_to_l1_server_response_first = f_L1_to_L2_rsps$EMPTY_N ;
  // action method l2_to_l1_server_response_deq
  assign RDY_l2_to_l1_server_response_deq = f_L1_to_L2_rsps$EMPTY_N ;
  assign CAN_FIRE_l2_to_l1_server_response_deq = f_L1_to_L2_rsps$EMPTY_N ;
  assign WILL_FIRE_l2_to_l1_server_response_deq =
	     EN_l2_to_l1_server_response_deq ;
  // value method l2_to_l1_server_response_notEmpty
  assign l2_to_l1_server_response_notEmpty = f_L1_to_L2_rsps$EMPTY_N ;
  assign RDY_l2_to_l1_server_response_notEmpty = 1'd1 ;
  // submodule f_L1_to_L2_reqs
  FIFO2 #(.width(32'd69), .guarded(1'd1)) f_L1_to_L2_reqs(.RST(RST_N),
							  .CLK(CLK),
							  .D_IN(f_L1_to_L2_reqs$D_IN),
							  .ENQ(f_L1_to_L2_reqs$ENQ),
							  .DEQ(f_L1_to_L2_reqs$DEQ),
							  .CLR(f_L1_to_L2_reqs$CLR),
							  .D_OUT(f_L1_to_L2_reqs$D_OUT),
							  .FULL_N(f_L1_to_L2_reqs$FULL_N),
							  .EMPTY_N(f_L1_to_L2_reqs$EMPTY_N));
  // submodule f_L1_to_L2_rsps
  FIFO2 #(.width(32'd579), .guarded(1'd1)) f_L1_to_L2_rsps(.RST(RST_N),
							   .CLK(CLK),
							   .D_IN(f_L1_to_L2_rsps$D_IN),
							   .ENQ(f_L1_to_L2_rsps$ENQ),
							   .DEQ(f_L1_to_L2_rsps$DEQ),
							   .CLR(f_L1_to_L2_rsps$CLR),
							   .D_OUT(f_L1_to_L2_rsps$D_OUT),
							   .FULL_N(f_L1_to_L2_rsps$FULL_N),
							   .EMPTY_N(f_L1_to_L2_rsps$EMPTY_N));
  // submodule f_L2_to_L1_reqs
  FIFO2 #(.width(32'd66), .guarded(1'd1)) f_L2_to_L1_reqs(.RST(RST_N),
							  .CLK(CLK),
							  .D_IN(f_L2_to_L1_reqs$D_IN),
							  .ENQ(f_L2_to_L1_reqs$ENQ),
							  .DEQ(f_L2_to_L1_reqs$DEQ),
							  .CLR(f_L2_to_L1_reqs$CLR),
							  .D_OUT(f_L2_to_L1_reqs$D_OUT),
							  .FULL_N(f_L2_to_L1_reqs$FULL_N),
							  .EMPTY_N(f_L2_to_L1_reqs$EMPTY_N));
  // submodule f_L2_to_L1_rsps
  FIFO2 #(.width(32'd579), .guarded(1'd1)) f_L2_to_L1_rsps(.RST(RST_N),
							   .CLK(CLK),
							   .D_IN(f_L2_to_L1_rsps$D_IN),
							   .ENQ(f_L2_to_L1_rsps$ENQ),
							   .DEQ(f_L2_to_L1_rsps$DEQ),
							   .CLR(f_L2_to_L1_rsps$CLR),
							   .D_OUT(f_L2_to_L1_rsps$D_OUT),
							   .FULL_N(f_L2_to_L1_rsps$FULL_N),
							   .EMPTY_N(f_L2_to_L1_rsps$EMPTY_N));
  // submodule f_flush_reqs
  FIFO2 #(.width(32'd1), .guarded(1'd1)) f_flush_reqs(.RST(RST_N),
						      .CLK(CLK),
						      .D_IN(f_flush_reqs$D_IN),
						      .ENQ(f_flush_reqs$ENQ),
						      .DEQ(f_flush_reqs$DEQ),
						      .CLR(f_flush_reqs$CLR),
						      .D_OUT(f_flush_reqs$D_OUT),
						      .FULL_N(f_flush_reqs$FULL_N),
						      .EMPTY_N(f_flush_reqs$EMPTY_N));
  // submodule f_flush_rsps
  FIFO20 #(.guarded(1'd1)) f_flush_rsps(.RST(RST_N),
					.CLK(CLK),
					.ENQ(f_flush_rsps$ENQ),
					.DEQ(f_flush_rsps$DEQ),
					.CLR(f_flush_rsps$CLR),
					.FULL_N(f_flush_rsps$FULL_N),
					.EMPTY_N(f_flush_rsps$EMPTY_N));
  // submodule ram_cset_cword
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd9),
	  .DATA_WIDTH(32'd128),
	  .MEMSIZE(10'd512)) ram_cset_cword(.CLKA(CLK),
					    .CLKB(CLK),
					    .ADDRA(ram_cset_cword$ADDRA),
					    .ADDRB(ram_cset_cword$ADDRB),
					    .DIA(ram_cset_cword$DIA),
					    .DIB(ram_cset_cword$DIB),
					    .WEA(ram_cset_cword$WEA),
					    .WEB(ram_cset_cword$WEB),
					    .ENA(ram_cset_cword$ENA),
					    .ENB(ram_cset_cword$ENB),
					    .DOA(ram_cset_cword$DOA),
					    .DOB());
  // submodule ram_cset_meta
  BRAM2 #(.PIPELINED(1'd0),
	  .ADDR_WIDTH(32'd6),
	  .DATA_WIDTH(32'd108),
	  .MEMSIZE(7'd64)) ram_cset_meta(.CLKA(CLK),
					 .CLKB(CLK),
					 .ADDRA(ram_cset_meta$ADDRA),
					 .ADDRB(ram_cset_meta$ADDRB),
					 .DIA(ram_cset_meta$DIA),
					 .DIB(ram_cset_meta$DIB),
					 .WEA(ram_cset_meta$WEA),
					 .WEB(ram_cset_meta$WEB),
					 .ENA(ram_cset_meta$ENA),
					 .ENB(ram_cset_meta$ENB),
					 .DOA(ram_cset_meta$DOA),
					 .DOB());
  // rule RL_rl_writeback_loop
  assign CAN_FIRE_RL_rl_writeback_loop =
	     (rg_cword_in_cline != 3'd7 || f_L1_to_L2_rsps$FULL_N) &&
	     rg_fsm_state == 4'd3 ;
  assign WILL_FIRE_RL_rl_writeback_loop =
	     CAN_FIRE_RL_rl_writeback_loop && !EN_ma_request_va ;
  // rule RL_rl_replace
  assign CAN_FIRE_RL_rl_replace =
	     (SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 ==
	      2'd3 ||
	      SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 ==
	      2'd0 ||
	      f_L1_to_L2_rsps$FULL_N) &&
	     rg_fsm_state == 4'd2 ;
  assign WILL_FIRE_RL_rl_replace =
	     CAN_FIRE_RL_rl_replace && !EN_ma_request_va ;
  // rule RL_rl_refill_start
  assign CAN_FIRE_RL_rl_refill_start =
	     f_L1_to_L2_reqs$FULL_N && rg_fsm_state == 4'd4 ;
  assign WILL_FIRE_RL_rl_refill_start =
	     CAN_FIRE_RL_rl_refill_start && !EN_ma_request_va ;
  // rule RL_rl_refill_loop
  assign CAN_FIRE_RL_rl_refill_loop =
	     (rg_cword_in_cline != 3'd0 || f_L2_to_L1_rsps$EMPTY_N) &&
	     rg_fsm_state == 4'd5 ;
  assign WILL_FIRE_RL_rl_refill_loop =
	     CAN_FIRE_RL_rl_refill_loop && !EN_ma_request_va ;
  // rule RL_rl_refill_loop_final
  assign CAN_FIRE_RL_rl_refill_loop_final = rg_fsm_state == 4'd6 ;
  assign WILL_FIRE_RL_rl_refill_loop_final =
	     CAN_FIRE_RL_rl_refill_loop_final && !EN_ma_request_va ;
  // rule RL_rl_flush_start
  assign CAN_FIRE_RL_rl_flush_start =
	     f_flush_reqs$EMPTY_N && rg_fsm_state == 4'd1 ;
  assign WILL_FIRE_RL_rl_flush_start =
	     CAN_FIRE_RL_rl_flush_start && !EN_ma_request_va ;
  // rule RL_rl_flush_loop
  assign CAN_FIRE_RL_rl_flush_loop =
	     (SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 ==
	      2'd3 ||
	      SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d320) &&
	     rg_fsm_state == 4'd9 ;
  assign WILL_FIRE_RL_rl_flush_loop =
	     CAN_FIRE_RL_rl_flush_loop && !EN_ma_request_va ;
  // rule RL_rl_flush_loop_writeback_sequel
  assign CAN_FIRE_RL_rl_flush_loop_writeback_sequel =
	     (rg_cset_in_cache != 6'd63 || !rg_way_in_cset ||
	      f_flush_rsps$FULL_N) &&
	     rg_fsm_state == 4'd10 ;
  assign WILL_FIRE_RL_rl_flush_loop_writeback_sequel =
	     CAN_FIRE_RL_rl_flush_loop_writeback_sequel && !EN_ma_request_va ;
  // rule RL_rl_downgrade_req_from_L2_A
  assign CAN_FIRE_RL_rl_downgrade_req_from_L2_A =
	     f_L2_to_L1_reqs$EMPTY_N &&
	     (rg_fsm_state == 4'd1 ||
	      rg_fsm_state == 4'd5 && rg_cword_in_cline == 3'd0) ;
  assign WILL_FIRE_RL_rl_downgrade_req_from_L2_A =
	     CAN_FIRE_RL_rl_downgrade_req_from_L2_A &&
	     !WILL_FIRE_RL_rl_flush_start &&
	     !WILL_FIRE_RL_rl_refill_loop &&
	     !EN_ma_request_va ;
  // rule RL_rl_downgrade_req_from_L2_B
  assign CAN_FIRE_RL_rl_downgrade_req_from_L2_B =
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d524 &&
	     rg_fsm_state == 4'd7 ;
  assign WILL_FIRE_RL_rl_downgrade_req_from_L2_B =
	     CAN_FIRE_RL_rl_downgrade_req_from_L2_B && !EN_ma_request_va ;
  // rule RL_rl_downgrade_req_from_L2_C
  assign CAN_FIRE_RL_rl_downgrade_req_from_L2_C =
	     f_L2_to_L1_reqs$EMPTY_N && rg_fsm_state == 4'd8 ;
  assign WILL_FIRE_RL_rl_downgrade_req_from_L2_C =
	     CAN_FIRE_RL_rl_downgrade_req_from_L2_C && !EN_ma_request_va ;
  // rule RL_rl_initialize
  assign CAN_FIRE_RL_rl_initialize = rg_fsm_state == 4'd0 ;
  assign WILL_FIRE_RL_rl_initialize =
	     CAN_FIRE_RL_rl_initialize && !EN_ma_request_va ;
  // inputs to muxes for submodule ports
  assign MUX_f_L1_to_L2_reqs$enq_1__SEL_1 =
	     EN_mav_request_pa && mav_request_pa_req[207:206] != 2'd0 &&
	     NOT_mav_request_pa_req_BITS_207_TO_206_04_EQ_1_ETC___d1171 ;
  assign MUX_f_L1_to_L2_rsps$enq_1__SEL_1 =
	     WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 ;
  assign MUX_f_L1_to_L2_rsps$enq_1__SEL_2 =
	     WILL_FIRE_RL_rl_replace &&
	     SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 !=
	     2'd3 &&
	     SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 !=
	     2'd0 ;
  assign MUX_f_L1_to_L2_rsps$enq_1__SEL_3 =
	     WILL_FIRE_RL_rl_flush_loop &&
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 !=
	     2'd3 &&
	     !SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d312 ;
  assign MUX_f_L1_to_L2_rsps$enq_1__SEL_4 =
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	     valid_info_num_valids__h21330 != 2'd0 &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 !=
	     2'd3 ;
  assign MUX_ram_cset_cword$a_put_1__SEL_1 =
	     WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline != 3'd7 ;
  assign MUX_ram_cset_cword$a_put_1__SEL_2 =
	     WILL_FIRE_RL_rl_replace &&
	     SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 ==
	     2'd3 ;
  assign MUX_ram_cset_cword$a_put_1__SEL_3 =
	     WILL_FIRE_RL_rl_flush_loop_writeback_sequel &&
	     rg_cset_in_cache == 6'd63 &&
	     rg_way_in_cset ;
  assign MUX_ram_cset_cword$a_put_1__SEL_4 =
	     WILL_FIRE_RL_rl_refill_loop &&
	     (rg_va[5:3] != 3'd7 &&
	      (rg_cword_in_cline != 3'd0 || f_L2_to_L1_rsps$D_OUT[512]) ||
	      (rg_cword_in_cline != 3'd0 || f_L2_to_L1_rsps$D_OUT[512]) &&
	      rg_cword_in_cline != 3'd7) ;
  assign MUX_ram_cset_cword$a_put_1__SEL_5 =
	     WILL_FIRE_RL_rl_flush_loop &&
	     (SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 ==
	      2'd3 ||
	      rg_cset_in_cache == 6'd63 && rg_way_in_cset) ;
  assign MUX_ram_cset_cword$a_put_1__SEL_6 =
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	     valid_info_num_valids__h21330 != 2'd0 &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 ==
	     2'd3 ;
  assign MUX_ram_cset_cword$b_put_1__SEL_1 =
	     WILL_FIRE_RL_rl_refill_loop &&
	     (rg_cword_in_cline != 3'd0 || f_L2_to_L1_rsps$D_OUT[512]) ;
  assign MUX_ram_cset_cword$b_put_1__SEL_2 =
	     EN_mav_request_pa &&
	     (valid_info_num_valids__h39525 != 2'd1 ||
	      mav_request_pa_req[207:206] != 2'd0) &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d944 ;
  assign MUX_ram_cset_meta$a_put_1__SEL_1 =
	     WILL_FIRE_RL_rl_flush_loop_writeback_sequel && rg_way_in_cset ;
  assign MUX_ram_cset_meta$a_put_1__SEL_2 =
	     WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd7 &&
	     rg_va[5:3] != 3'd7 ;
  assign MUX_ram_cset_meta$a_put_1__SEL_3 =
	     WILL_FIRE_RL_rl_flush_loop &&
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 !=
	     2'd3 &&
	     rg_way_in_cset ;
  assign MUX_ram_cset_meta$b_put_1__SEL_2 =
	     WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 ;
  assign MUX_ram_cset_meta$b_put_1__SEL_3 =
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	     valid_info_num_valids__h21330 != 2'd0 ;
  assign MUX_rg_cset_in_cache$write_1__SEL_4 =
	     WILL_FIRE_RL_rl_flush_loop_writeback_sequel &&
	     rg_cset_in_cache != 6'd63 &&
	     rg_way_in_cset ;
  assign MUX_rg_cset_in_cache$write_1__SEL_5 =
	     WILL_FIRE_RL_rl_flush_loop &&
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 !=
	     2'd3 &&
	     rg_cset_in_cache != 6'd63 &&
	     rg_way_in_cset ;
  assign MUX_rg_cword_in_cline$write_1__SEL_3 =
	     WILL_FIRE_RL_rl_refill_loop &&
	     (rg_cword_in_cline != 3'd0 || f_L2_to_L1_rsps$D_OUT[512]) &&
	     rg_cword_in_cline != 3'd7 ;
  assign MUX_rg_cword_in_cline$write_1__SEL_4 =
	     WILL_FIRE_RL_rl_flush_loop &&
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 ==
	     2'd3 ;
  assign MUX_rg_fsm_state$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_refill_loop &&
	     (rg_cword_in_cline == 3'd0 && !f_L2_to_L1_rsps$D_OUT[512] ||
	      rg_cword_in_cline == 3'd7) ;
  assign MUX_rg_fsm_state$write_1__SEL_3 =
	     WILL_FIRE_RL_rl_initialize && rg_cset_in_cache == 6'd63 ;
  assign MUX_rg_fsm_state$write_1__SEL_5 =
	     EN_mav_request_pa &&
	     (valid_info_num_valids__h39525 != 2'd1 ||
	      mav_request_pa_req[207:206] != 2'd0) &&
	     NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1159 ;
  assign MUX_rg_way_in_cset$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_flush_loop_writeback_sequel &&
	     (rg_cset_in_cache != 6'd63 || !rg_way_in_cset) ;
  assign MUX_rg_way_in_cset$write_1__SEL_3 =
	     WILL_FIRE_RL_rl_flush_loop &&
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 !=
	     2'd3 &&
	     (rg_cset_in_cache != 6'd63 || !rg_way_in_cset) ;
  assign MUX_f_L1_to_L2_reqs$enq_1__VAL_1 =
	     { x_addr__h61346, 4'd6, dcache_not_icache } ;
  assign MUX_f_L1_to_L2_reqs$enq_1__VAL_2 =
	     { l1_to_l2_req_addr__h6583,
	       2'd0,
	       IF_rg_cache_op_68_EQ_1_69_OR_rg_cache_op_68_EQ_ETC___d178 } ;
  assign MUX_f_L1_to_L2_rsps$enq_1__VAL_1 =
	     { x_addr__h3120,
	       rg_post_wb_meta_state,
	       1'd1,
	       SEL_ARR_ram_cset_cword_a_read_BITS_63_TO_0_0_r_ETC___d14,
	       rg_write_cline_buf[511:64] } ;
  assign MUX_f_L1_to_L2_rsps$enq_1__VAL_2 =
	     { victim_cline_pa__h5091,
	       515'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA } ;
  assign MUX_f_L1_to_L2_rsps$enq_1__VAL_3 =
	     { cline_pa__h15519,
	       rg_new_meta_state,
	       513'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA } ;
  assign MUX_f_L1_to_L2_rsps$enq_1__VAL_4 =
	     { rg_pa,
	       f_L2_to_L1_reqs$D_OUT[1:0],
	       513'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA } ;
  assign MUX_ram_cset_cword$a_put_2__VAL_1 =
	     { rg_cset_in_cache, cword_in_cline__h3093 } ;
  assign MUX_ram_cset_cword$a_put_2__VAL_2 = { rg_va[11:6], 3'd0 } ;
  assign MUX_ram_cset_cword$a_put_2__VAL_4 =
	     (rg_cword_in_cline == 3'd0 && !f_L2_to_L1_rsps$D_OUT[512] ||
	      rg_cword_in_cline == 3'd7) ?
	       rg_va[11:3] :
	       next_cset_cword_in_cache__h10894 ;
  assign MUX_ram_cset_cword$a_put_2__VAL_5 =
	     (SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 ==
	      2'd3) ?
	       cset_cword_in_cache__h35238 :
	       rg_va[11:3] ;
  assign MUX_ram_cset_cword$a_put_2__VAL_9 =
	     (rg_save_fsm_state == 4'd5) ?
	       cset_cword_in_cache___1__h36760 :
	       rg_save_va[11:3] ;
  assign MUX_ram_cset_cword$b_put_2__VAL_1 =
	     { rg_va[11:6], rg_cword_in_cline } ;
  assign MUX_ram_cset_cword$b_put_3__VAL_1 =
	     rg_way_in_cset ?
	       { cword__h10620, ram_cset_cword$DOA[63:0] } :
	       { ram_cset_cword$DOA[127:64], cword__h10620 } ;
  assign MUX_ram_cset_cword$b_put_3__VAL_2 =
	     (valid_info_num_valids__h39525 == 2'd1 &&
	      (mav_request_pa_req[207:206] == 2'd1 ||
	       mav_request_pa_req[207:206] == 2'd2 &&
	       mav_request_pa_req[74:70] == 5'b00011) &&
	      !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927) ?
	       { IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1012,
		 IF_ram_cset_meta_a_read__8_BITS_107_TO_106_12__ETC___d1015 } :
	       { IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1086,
		 IF_ram_cset_meta_a_read__8_BITS_107_TO_106_12__ETC___d1087 } ;
  assign MUX_ram_cset_meta$a_put_2__VAL_1 =
	     (rg_cset_in_cache == 6'd63) ?
	       rg_va[11:6] :
	       next_cset_in_cache__h16246 ;
  assign MUX_ram_cset_meta$b_put_3__VAL_2 =
	     rg_way_in_cset ?
	       { f_L2_to_L1_rsps$D_OUT[514:513],
		 rg_pa[63:12],
		 ram_cset_meta$DOA[53:0] } :
	       { ram_cset_meta$DOA[107:54],
		 f_L2_to_L1_rsps$D_OUT[514:513],
		 rg_pa[63:12] } ;
  assign MUX_ram_cset_meta$b_put_3__VAL_3 =
	     { IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d649,
	       IF_ram_cset_meta_a_read__8_BITS_107_TO_106_12__ETC___d652 } ;
  assign MUX_ram_cset_meta$b_put_3__VAL_4 =
	     rg_way_in_cset ?
	       { rg_new_meta_state,
		 new_meta_ctag__h14727,
		 rg_new_cset_meta[53:0] } :
	       { ram_cset_meta$DOA[107:54],
		 rg_new_meta_state,
		 new_meta_ctag__h14727 } ;
  assign MUX_ram_cset_meta$b_put_3__VAL_5 =
	     { (ram_cset_meta$DOA[107:106] != 2'd0 &&
		ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788) ?
		 { 2'd3, mav_request_pa_pa[63:12] } :
		 ram_cset_meta$DOA[107:54],
	       (ram_cset_meta$DOA[107:106] == 2'd0 ||
		!ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788) ?
		 { 2'd3, mav_request_pa_pa[63:12] } :
		 ram_cset_meta$DOA[53:0] } ;
  assign MUX_ram_cset_meta$b_put_3__VAL_6 =
	     rg_way_in_cset ?
	       { 2'd1, rg_pa[63:12], ram_cset_meta$DOA[53:0] } :
	       { ram_cset_meta$DOA[107:54], 2'd1, rg_pa[63:12] } ;
  assign MUX_rg_fsm_state$write_1__VAL_2 =
	     (rg_va[5:3] == 3'd7 ||
	      rg_cword_in_cline == 3'd0 && !f_L2_to_L1_rsps$D_OUT[512]) ?
	       4'd6 :
	       4'd1 ;
  assign MUX_rg_fsm_state$write_1__VAL_4 =
	     (SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 ==
	      2'd3) ?
	       4'd3 :
	       4'd1 ;
  assign MUX_rg_fsm_state$write_1__VAL_5 =
	     (valid_info_num_valids__h39525 == 2'd1 &&
	      IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796 ==
	      2'd1 &&
	      (mav_request_pa_req[207:206] == 2'd1 ||
	       mav_request_pa_req[207:206] == 2'd2)) ?
	       4'd5 :
	       4'd2 ;
  assign MUX_rg_fsm_state$write_1__VAL_7 =
	     (SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 ==
	      2'd3) ?
	       4'd3 :
	       4'd4 ;
  assign MUX_rg_fsm_state$write_1__VAL_8 =
	     (rg_cset_in_cache == 6'd63 && rg_way_in_cset) ? 4'd1 : 4'd9 ;
  assign MUX_rg_fsm_state$write_1__VAL_9 =
	     (valid_info_num_valids__h21330 == 2'd0) ?
	       4'd8 :
	       ((IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 ==
		 2'd3) ?
		  4'd3 :
		  4'd8) ;
  assign MUX_rg_way_in_cset$write_1__VAL_1 = !rg_way_in_cset && x__h16251 ;
  assign MUX_rg_way_in_cset$write_1__VAL_2 =
	     ram_cset_meta$DOA[107:106] != 2'd0 &&
	     ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_rg_ETC___d511 ;
  assign MUX_rg_way_in_cset$write_1__VAL_4 =
	     ram_cset_meta$DOA[107:106] != 2'd0 &&
	     ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788 ;
  // register rg_amo_funct7
  assign rg_amo_funct7$D_IN = mav_request_pa_req[74:68] ;
  assign rg_amo_funct7$EN = EN_mav_request_pa ;
  // register rg_cache_op
  assign rg_cache_op$D_IN = mav_request_pa_req[207:206] ;
  assign rg_cache_op$EN = EN_mav_request_pa ;
  // register rg_cset_in_cache
  always@(WILL_FIRE_RL_rl_initialize or
	  next_cset_in_cache__h16246 or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_C or
	  rg_save_cset_in_cache or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_A or
	  f_L2_to_L1_reqs$D_OUT or
	  MUX_rg_cset_in_cache$write_1__SEL_4 or
	  MUX_rg_cset_in_cache$write_1__SEL_5 or
	  WILL_FIRE_RL_rl_flush_start or
	  WILL_FIRE_RL_rl_replace or
	  rg_va or
	  EN_ma_request_va or
	  ma_request_va_va or MUX_f_L1_to_L2_reqs$enq_1__SEL_1)
  case (1'b1)
    WILL_FIRE_RL_rl_initialize:
	rg_cset_in_cache$D_IN = next_cset_in_cache__h16246;
    WILL_FIRE_RL_rl_downgrade_req_from_L2_C:
	rg_cset_in_cache$D_IN = rg_save_cset_in_cache;
    WILL_FIRE_RL_rl_downgrade_req_from_L2_A:
	rg_cset_in_cache$D_IN = f_L2_to_L1_reqs$D_OUT[13:8];
    MUX_rg_cset_in_cache$write_1__SEL_4:
	rg_cset_in_cache$D_IN = next_cset_in_cache__h16246;
    MUX_rg_cset_in_cache$write_1__SEL_5:
	rg_cset_in_cache$D_IN = next_cset_in_cache__h16246;
    WILL_FIRE_RL_rl_flush_start: rg_cset_in_cache$D_IN = 6'd0;
    WILL_FIRE_RL_rl_replace: rg_cset_in_cache$D_IN = rg_va[11:6];
    EN_ma_request_va: rg_cset_in_cache$D_IN = ma_request_va_va[11:6];
    MUX_f_L1_to_L2_reqs$enq_1__SEL_1: rg_cset_in_cache$D_IN = rg_va[11:6];
    default: rg_cset_in_cache$D_IN = 6'b101010 /* unspecified value */ ;
  endcase
  assign rg_cset_in_cache$EN =
	     WILL_FIRE_RL_rl_flush_loop_writeback_sequel &&
	     rg_cset_in_cache != 6'd63 &&
	     rg_way_in_cset ||
	     WILL_FIRE_RL_rl_flush_loop &&
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 !=
	     2'd3 &&
	     rg_cset_in_cache != 6'd63 &&
	     rg_way_in_cset ||
	     EN_mav_request_pa && mav_request_pa_req[207:206] != 2'd0 &&
	     NOT_mav_request_pa_req_BITS_207_TO_206_04_EQ_1_ETC___d1171 ||
	     WILL_FIRE_RL_rl_replace ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_C ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_A ||
	     EN_ma_request_va ||
	     WILL_FIRE_RL_rl_initialize ||
	     WILL_FIRE_RL_rl_flush_start ;
  // register rg_cword_in_cline
  always@(WILL_FIRE_RL_rl_downgrade_req_from_L2_C or
	  rg_save_cword_in_cline or
	  MUX_ram_cset_cword$a_put_1__SEL_1 or
	  cword_in_cline__h3093 or
	  MUX_rg_cword_in_cline$write_1__SEL_3 or
	  MUX_ram_cset_cword$a_put_1__SEL_2 or
	  MUX_rg_cword_in_cline$write_1__SEL_4 or
	  MUX_ram_cset_cword$a_put_1__SEL_6 or
	  MUX_f_L1_to_L2_reqs$enq_1__SEL_1 or WILL_FIRE_RL_rl_refill_start)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_rl_downgrade_req_from_L2_C:
	  rg_cword_in_cline$D_IN = rg_save_cword_in_cline;
      MUX_ram_cset_cword$a_put_1__SEL_1:
	  rg_cword_in_cline$D_IN = cword_in_cline__h3093;
      MUX_rg_cword_in_cline$write_1__SEL_3:
	  rg_cword_in_cline$D_IN = cword_in_cline__h3093;
      MUX_ram_cset_cword$a_put_1__SEL_2 ||
      MUX_rg_cword_in_cline$write_1__SEL_4 ||
      MUX_ram_cset_cword$a_put_1__SEL_6 ||
      MUX_f_L1_to_L2_reqs$enq_1__SEL_1 ||
      WILL_FIRE_RL_rl_refill_start:
	  rg_cword_in_cline$D_IN = 3'd0;
      default: rg_cword_in_cline$D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign rg_cword_in_cline$EN =
	     WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline != 3'd7 ||
	     WILL_FIRE_RL_rl_replace &&
	     SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 ==
	     2'd3 ||
	     WILL_FIRE_RL_rl_refill_loop &&
	     (rg_cword_in_cline != 3'd0 || f_L2_to_L1_rsps$D_OUT[512]) &&
	     rg_cword_in_cline != 3'd7 ||
	     WILL_FIRE_RL_rl_flush_loop &&
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 ==
	     2'd3 ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	     valid_info_num_valids__h21330 != 2'd0 &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 ==
	     2'd3 ||
	     EN_mav_request_pa && mav_request_pa_req[207:206] != 2'd0 &&
	     NOT_mav_request_pa_req_BITS_207_TO_206_04_EQ_1_ETC___d1171 ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_C ||
	     WILL_FIRE_RL_rl_refill_start ;
  // register rg_error_during_refill
  assign rg_error_during_refill$D_IN = 1'd0 ;
  assign rg_error_during_refill$EN =
	     EN_mav_request_pa && mav_request_pa_req[207:206] != 2'd0 &&
	     NOT_mav_request_pa_req_BITS_207_TO_206_04_EQ_1_ETC___d1171 ||
	     WILL_FIRE_RL_rl_refill_start ;
  // register rg_f3
  assign rg_f3$D_IN = mav_request_pa_req[205:203] ;
  assign rg_f3$EN = EN_mav_request_pa ;
  // register rg_fsm_state
  always@(MUX_f_L1_to_L2_rsps$enq_1__SEL_1 or
	  rg_post_wb_fsm_state or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_C or
	  rg_save_fsm_state or
	  MUX_rg_fsm_state$write_1__SEL_2 or
	  MUX_rg_fsm_state$write_1__VAL_2 or
	  MUX_ram_cset_cword$a_put_1__SEL_5 or
	  MUX_rg_fsm_state$write_1__VAL_4 or
	  MUX_rg_fsm_state$write_1__SEL_5 or
	  MUX_rg_fsm_state$write_1__VAL_5 or
	  WILL_FIRE_RL_rl_replace or
	  MUX_rg_fsm_state$write_1__VAL_7 or
	  WILL_FIRE_RL_rl_flush_loop_writeback_sequel or
	  MUX_rg_fsm_state$write_1__VAL_8 or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_B or
	  MUX_rg_fsm_state$write_1__VAL_9 or
	  MUX_rg_fsm_state$write_1__SEL_3 or
	  WILL_FIRE_RL_rl_refill_loop_final or
	  WILL_FIRE_RL_rl_refill_start or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_A or
	  WILL_FIRE_RL_rl_flush_start)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_f_L1_to_L2_rsps$enq_1__SEL_1:
	  rg_fsm_state$D_IN = rg_post_wb_fsm_state;
      WILL_FIRE_RL_rl_downgrade_req_from_L2_C:
	  rg_fsm_state$D_IN = rg_save_fsm_state;
      MUX_rg_fsm_state$write_1__SEL_2:
	  rg_fsm_state$D_IN = MUX_rg_fsm_state$write_1__VAL_2;
      MUX_ram_cset_cword$a_put_1__SEL_5:
	  rg_fsm_state$D_IN = MUX_rg_fsm_state$write_1__VAL_4;
      MUX_rg_fsm_state$write_1__SEL_5:
	  rg_fsm_state$D_IN = MUX_rg_fsm_state$write_1__VAL_5;
      WILL_FIRE_RL_rl_replace:
	  rg_fsm_state$D_IN = MUX_rg_fsm_state$write_1__VAL_7;
      WILL_FIRE_RL_rl_flush_loop_writeback_sequel:
	  rg_fsm_state$D_IN = MUX_rg_fsm_state$write_1__VAL_8;
      WILL_FIRE_RL_rl_downgrade_req_from_L2_B:
	  rg_fsm_state$D_IN = MUX_rg_fsm_state$write_1__VAL_9;
      MUX_rg_fsm_state$write_1__SEL_3 || WILL_FIRE_RL_rl_refill_loop_final:
	  rg_fsm_state$D_IN = 4'd1;
      WILL_FIRE_RL_rl_refill_start: rg_fsm_state$D_IN = 4'd5;
      WILL_FIRE_RL_rl_downgrade_req_from_L2_A: rg_fsm_state$D_IN = 4'd7;
      WILL_FIRE_RL_rl_flush_start: rg_fsm_state$D_IN = 4'd9;
      default: rg_fsm_state$D_IN = 4'b1010 /* unspecified value */ ;
    endcase
  end
  assign rg_fsm_state$EN =
	     WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 ||
	     WILL_FIRE_RL_rl_refill_loop &&
	     (rg_cword_in_cline == 3'd0 && !f_L2_to_L1_rsps$D_OUT[512] ||
	      rg_cword_in_cline == 3'd7) ||
	     WILL_FIRE_RL_rl_initialize && rg_cset_in_cache == 6'd63 ||
	     MUX_ram_cset_cword$a_put_1__SEL_5 ||
	     EN_mav_request_pa &&
	     (valid_info_num_valids__h39525 != 2'd1 ||
	      mav_request_pa_req[207:206] != 2'd0) &&
	     NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1159 ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_C ||
	     WILL_FIRE_RL_rl_replace ||
	     WILL_FIRE_RL_rl_flush_loop_writeback_sequel ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_B ||
	     WILL_FIRE_RL_rl_refill_loop_final ||
	     WILL_FIRE_RL_rl_refill_start ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_A ||
	     WILL_FIRE_RL_rl_flush_start ;
  // register rg_lrsc_pa
  assign rg_lrsc_pa$D_IN = mav_request_pa_pa ;
  assign rg_lrsc_pa$EN =
	     EN_mav_request_pa && valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     mav_request_pa_req[74:70] == 5'b00010 ;
  // register rg_lrsc_size
  assign rg_lrsc_size$D_IN = mav_request_pa_req[204:203] ;
  assign rg_lrsc_size$EN =
	     EN_mav_request_pa && valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     mav_request_pa_req[74:70] == 5'b00010 ;
  // register rg_lrsc_valid
  assign rg_lrsc_valid$D_IN =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     mav_request_pa_req[74:70] == 5'b00010 ;
  assign rg_lrsc_valid$EN =
	     EN_mav_request_pa &&
	     (valid_info_num_valids__h39525 != 2'd1 ||
	      mav_request_pa_req[207:206] != 2'd0) &&
	     (valid_info_num_valids__h39525 == 2'd1 &&
	      mav_request_pa_req[207:206] == 2'd1 &&
	      !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 &&
	      rg_lrsc_pa_35_EQ_mav_request_pa_pa___d936 ||
	      NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1112) ;
  // register rg_new_cset_meta
  assign rg_new_cset_meta$D_IN = MUX_ram_cset_meta$b_put_3__VAL_4 ;
  assign rg_new_cset_meta$EN = WILL_FIRE_RL_rl_flush_loop ;
  // register rg_new_meta_state
  assign rg_new_meta_state$D_IN = f_flush_reqs$D_OUT ? 2'd1 : 2'd0 ;
  assign rg_new_meta_state$EN = WILL_FIRE_RL_rl_flush_start ;
  // register rg_pa
  always@(EN_mav_request_pa or
	  mav_request_pa_pa or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_C or
	  rg_save_pa or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_A or f_L2_to_L1_reqs$D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      EN_mav_request_pa: rg_pa$D_IN = mav_request_pa_pa;
      WILL_FIRE_RL_rl_downgrade_req_from_L2_C: rg_pa$D_IN = rg_save_pa;
      WILL_FIRE_RL_rl_downgrade_req_from_L2_A:
	  rg_pa$D_IN = f_L2_to_L1_reqs$D_OUT[65:2];
      default: rg_pa$D_IN = 64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign rg_pa$EN =
	     EN_mav_request_pa || WILL_FIRE_RL_rl_downgrade_req_from_L2_C ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_A ;
  // register rg_post_wb_fsm_state
  always@(MUX_ram_cset_cword$a_put_1__SEL_2 or
	  MUX_rg_cword_in_cline$write_1__SEL_4 or
	  MUX_ram_cset_cword$a_put_1__SEL_6)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_ram_cset_cword$a_put_1__SEL_2: rg_post_wb_fsm_state$D_IN = 4'd4;
      MUX_rg_cword_in_cline$write_1__SEL_4: rg_post_wb_fsm_state$D_IN = 4'd10;
      MUX_ram_cset_cword$a_put_1__SEL_6: rg_post_wb_fsm_state$D_IN = 4'd8;
      default: rg_post_wb_fsm_state$D_IN = 4'b1010 /* unspecified value */ ;
    endcase
  end
  assign rg_post_wb_fsm_state$EN =
	     WILL_FIRE_RL_rl_replace &&
	     SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 ==
	     2'd3 ||
	     WILL_FIRE_RL_rl_flush_loop &&
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 ==
	     2'd3 ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	     valid_info_num_valids__h21330 != 2'd0 &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 ==
	     2'd3 ;
  // register rg_post_wb_meta_state
  always@(MUX_ram_cset_cword$a_put_1__SEL_2 or
	  MUX_rg_cword_in_cline$write_1__SEL_4 or
	  rg_new_meta_state or
	  MUX_ram_cset_cword$a_put_1__SEL_6 or f_L2_to_L1_reqs$D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_ram_cset_cword$a_put_1__SEL_2: rg_post_wb_meta_state$D_IN = 2'd0;
      MUX_rg_cword_in_cline$write_1__SEL_4:
	  rg_post_wb_meta_state$D_IN = rg_new_meta_state;
      MUX_ram_cset_cword$a_put_1__SEL_6:
	  rg_post_wb_meta_state$D_IN = f_L2_to_L1_reqs$D_OUT[1:0];
      default: rg_post_wb_meta_state$D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign rg_post_wb_meta_state$EN =
	     WILL_FIRE_RL_rl_replace &&
	     SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 ==
	     2'd3 ||
	     WILL_FIRE_RL_rl_flush_loop &&
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 ==
	     2'd3 ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	     valid_info_num_valids__h21330 != 2'd0 &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 ==
	     2'd3 ;
  // register rg_read_cline_buf
  assign rg_read_cline_buf$D_IN =
	     { DONTCARE_CONCAT_IF_rg_cword_in_cline_EQ_0_0_TH_ETC___d252,
	       (rg_cword_in_cline == 3'd0) ?
		 f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[191:128] :
		 rg_read_cline_buf[191:128],
	       (rg_cword_in_cline == 3'd0) ?
		 f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[127:64] :
		 rg_read_cline_buf[127:64] } ;
  assign rg_read_cline_buf$EN = WILL_FIRE_RL_rl_refill_loop ;
  // register rg_save_cset_in_cache
  assign rg_save_cset_in_cache$D_IN = rg_cset_in_cache ;
  assign rg_save_cset_in_cache$EN = WILL_FIRE_RL_rl_downgrade_req_from_L2_A ;
  // register rg_save_cword_in_cline
  assign rg_save_cword_in_cline$D_IN = rg_cword_in_cline ;
  assign rg_save_cword_in_cline$EN = WILL_FIRE_RL_rl_downgrade_req_from_L2_A ;
  // register rg_save_fsm_state
  assign rg_save_fsm_state$D_IN = rg_fsm_state ;
  assign rg_save_fsm_state$EN = WILL_FIRE_RL_rl_downgrade_req_from_L2_A ;
  // register rg_save_pa
  assign rg_save_pa$D_IN = rg_pa ;
  assign rg_save_pa$EN = WILL_FIRE_RL_rl_downgrade_req_from_L2_A ;
  // register rg_save_va
  assign rg_save_va$D_IN = rg_va ;
  assign rg_save_va$EN = WILL_FIRE_RL_rl_downgrade_req_from_L2_A ;
  // register rg_save_way_in_cset
  assign rg_save_way_in_cset$D_IN = rg_way_in_cset ;
  assign rg_save_way_in_cset$EN = WILL_FIRE_RL_rl_downgrade_req_from_L2_A ;
  // register rg_va
  always@(EN_ma_request_va or
	  ma_request_va_va or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_C or
	  rg_save_va or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_A or f_L2_to_L1_reqs$D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      EN_ma_request_va: rg_va$D_IN = ma_request_va_va;
      WILL_FIRE_RL_rl_downgrade_req_from_L2_C: rg_va$D_IN = rg_save_va;
      WILL_FIRE_RL_rl_downgrade_req_from_L2_A:
	  rg_va$D_IN = f_L2_to_L1_reqs$D_OUT[65:2];
      default: rg_va$D_IN = 64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign rg_va$EN =
	     EN_ma_request_va || WILL_FIRE_RL_rl_downgrade_req_from_L2_C ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_A ;
  // register rg_victim_way
  assign rg_victim_way$D_IN = victim_way__h4955 ;
  assign rg_victim_way$EN = WILL_FIRE_RL_rl_replace ;
  // register rg_way_in_cset
  always@(MUX_rg_way_in_cset$write_1__SEL_1 or
	  MUX_rg_way_in_cset$write_1__VAL_1 or
	  MUX_ram_cset_meta$b_put_1__SEL_3 or
	  MUX_rg_way_in_cset$write_1__VAL_2 or
	  MUX_rg_way_in_cset$write_1__SEL_3 or
	  MUX_f_L1_to_L2_reqs$enq_1__SEL_1 or
	  MUX_rg_way_in_cset$write_1__VAL_4 or
	  WILL_FIRE_RL_rl_replace or
	  victim_way__h4955 or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_C or
	  rg_save_way_in_cset or WILL_FIRE_RL_rl_flush_start)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_rg_way_in_cset$write_1__SEL_1:
	  rg_way_in_cset$D_IN = MUX_rg_way_in_cset$write_1__VAL_1;
      MUX_ram_cset_meta$b_put_1__SEL_3:
	  rg_way_in_cset$D_IN = MUX_rg_way_in_cset$write_1__VAL_2;
      MUX_rg_way_in_cset$write_1__SEL_3:
	  rg_way_in_cset$D_IN = MUX_rg_way_in_cset$write_1__VAL_1;
      MUX_f_L1_to_L2_reqs$enq_1__SEL_1:
	  rg_way_in_cset$D_IN = MUX_rg_way_in_cset$write_1__VAL_4;
      WILL_FIRE_RL_rl_replace: rg_way_in_cset$D_IN = victim_way__h4955;
      WILL_FIRE_RL_rl_downgrade_req_from_L2_C:
	  rg_way_in_cset$D_IN = rg_save_way_in_cset;
      WILL_FIRE_RL_rl_flush_start: rg_way_in_cset$D_IN = 1'd0;
      default: rg_way_in_cset$D_IN = 1'b0 /* unspecified value */ ;
    endcase
  end
  assign rg_way_in_cset$EN =
	     WILL_FIRE_RL_rl_flush_loop_writeback_sequel &&
	     (rg_cset_in_cache != 6'd63 || !rg_way_in_cset) ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	     valid_info_num_valids__h21330 != 2'd0 ||
	     WILL_FIRE_RL_rl_flush_loop &&
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 !=
	     2'd3 &&
	     (rg_cset_in_cache != 6'd63 || !rg_way_in_cset) ||
	     EN_mav_request_pa && mav_request_pa_req[207:206] != 2'd0 &&
	     NOT_mav_request_pa_req_BITS_207_TO_206_04_EQ_1_ETC___d1171 ||
	     WILL_FIRE_RL_rl_replace ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_C ||
	     WILL_FIRE_RL_rl_flush_start ;
  // register rg_write_cline_buf
  assign rg_write_cline_buf$D_IN =
	     { SEL_ARR_ram_cset_cword_a_read_BITS_63_TO_0_0_r_ETC___d14,
	       rg_write_cline_buf[511:64] } ;
  assign rg_write_cline_buf$EN = WILL_FIRE_RL_rl_writeback_loop ;
  // submodule f_L1_to_L2_reqs
  assign f_L1_to_L2_reqs$D_IN =
	     MUX_f_L1_to_L2_reqs$enq_1__SEL_1 ?
	       MUX_f_L1_to_L2_reqs$enq_1__VAL_1 :
	       MUX_f_L1_to_L2_reqs$enq_1__VAL_2 ;
  assign f_L1_to_L2_reqs$ENQ =
	     EN_mav_request_pa && mav_request_pa_req[207:206] != 2'd0 &&
	     NOT_mav_request_pa_req_BITS_207_TO_206_04_EQ_1_ETC___d1171 ||
	     WILL_FIRE_RL_rl_refill_start ;
  assign f_L1_to_L2_reqs$DEQ = EN_l1_to_l2_client_request_deq ;
  assign f_L1_to_L2_reqs$CLR = 1'b0 ;
  // submodule f_L1_to_L2_rsps
  always@(MUX_f_L1_to_L2_rsps$enq_1__SEL_1 or
	  MUX_f_L1_to_L2_rsps$enq_1__VAL_1 or
	  MUX_f_L1_to_L2_rsps$enq_1__SEL_2 or
	  MUX_f_L1_to_L2_rsps$enq_1__VAL_2 or
	  MUX_f_L1_to_L2_rsps$enq_1__SEL_3 or
	  MUX_f_L1_to_L2_rsps$enq_1__VAL_3 or
	  MUX_f_L1_to_L2_rsps$enq_1__SEL_4 or
	  MUX_f_L1_to_L2_rsps$enq_1__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_f_L1_to_L2_rsps$enq_1__SEL_1:
	  f_L1_to_L2_rsps$D_IN = MUX_f_L1_to_L2_rsps$enq_1__VAL_1;
      MUX_f_L1_to_L2_rsps$enq_1__SEL_2:
	  f_L1_to_L2_rsps$D_IN = MUX_f_L1_to_L2_rsps$enq_1__VAL_2;
      MUX_f_L1_to_L2_rsps$enq_1__SEL_3:
	  f_L1_to_L2_rsps$D_IN = MUX_f_L1_to_L2_rsps$enq_1__VAL_3;
      MUX_f_L1_to_L2_rsps$enq_1__SEL_4:
	  f_L1_to_L2_rsps$D_IN = MUX_f_L1_to_L2_rsps$enq_1__VAL_4;
      default: f_L1_to_L2_rsps$D_IN =
		   579'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign f_L1_to_L2_rsps$ENQ =
	     WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 ||
	     WILL_FIRE_RL_rl_replace &&
	     SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 !=
	     2'd3 &&
	     SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 !=
	     2'd0 ||
	     WILL_FIRE_RL_rl_flush_loop &&
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 !=
	     2'd3 &&
	     !SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d312 ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	     valid_info_num_valids__h21330 != 2'd0 &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 !=
	     2'd3 ;
  assign f_L1_to_L2_rsps$DEQ = EN_l2_to_l1_server_response_deq ;
  assign f_L1_to_L2_rsps$CLR = 1'b0 ;
  // submodule f_L2_to_L1_reqs
  assign f_L2_to_L1_reqs$D_IN = l2_to_l1_server_request_enq_x ;
  assign f_L2_to_L1_reqs$ENQ = EN_l2_to_l1_server_request_enq ;
  assign f_L2_to_L1_reqs$DEQ = WILL_FIRE_RL_rl_downgrade_req_from_L2_C ;
  assign f_L2_to_L1_reqs$CLR = 1'b0 ;
  // submodule f_L2_to_L1_rsps
  assign f_L2_to_L1_rsps$D_IN = l1_to_l2_client_response_enq_x ;
  assign f_L2_to_L1_rsps$ENQ = EN_l1_to_l2_client_response_enq ;
  assign f_L2_to_L1_rsps$DEQ = MUX_ram_cset_meta$b_put_1__SEL_2 ;
  assign f_L2_to_L1_rsps$CLR = 1'b0 ;
  // submodule f_flush_reqs
  assign f_flush_reqs$D_IN = flush_server_request_put ;
  assign f_flush_reqs$ENQ = EN_flush_server_request_put ;
  assign f_flush_reqs$DEQ = WILL_FIRE_RL_rl_flush_start ;
  assign f_flush_reqs$CLR = 1'b0 ;
  // submodule f_flush_rsps
  assign f_flush_rsps$ENQ =
	     WILL_FIRE_RL_rl_flush_loop_writeback_sequel &&
	     rg_cset_in_cache == 6'd63 &&
	     rg_way_in_cset ||
	     WILL_FIRE_RL_rl_flush_loop &&
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 !=
	     2'd3 &&
	     rg_cset_in_cache == 6'd63 &&
	     rg_way_in_cset ;
  assign f_flush_rsps$DEQ = EN_flush_server_response_get ;
  assign f_flush_rsps$CLR = 1'b0 ;
  // submodule ram_cset_cword
  always@(MUX_ram_cset_cword$a_put_1__SEL_3 or
	  WILL_FIRE_RL_rl_refill_loop_final or
	  rg_va or
	  EN_ma_request_va or
	  ma_request_va_va or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_A or
	  f_L2_to_L1_reqs$D_OUT or
	  MUX_ram_cset_cword$a_put_1__SEL_1 or
	  MUX_ram_cset_cword$a_put_2__VAL_1 or
	  MUX_ram_cset_cword$a_put_1__SEL_2 or
	  MUX_ram_cset_cword$a_put_2__VAL_2 or
	  MUX_ram_cset_cword$a_put_1__SEL_4 or
	  MUX_ram_cset_cword$a_put_2__VAL_4 or
	  MUX_ram_cset_cword$a_put_1__SEL_5 or
	  MUX_ram_cset_cword$a_put_2__VAL_5 or
	  MUX_ram_cset_cword$a_put_1__SEL_6 or
	  cset_cword_in_cache__h35238 or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_C or
	  MUX_ram_cset_cword$a_put_2__VAL_9 or WILL_FIRE_RL_rl_refill_start)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_ram_cset_cword$a_put_1__SEL_3 || WILL_FIRE_RL_rl_refill_loop_final:
	  ram_cset_cword$ADDRA = rg_va[11:3];
      EN_ma_request_va: ram_cset_cword$ADDRA = ma_request_va_va[11:3];
      WILL_FIRE_RL_rl_downgrade_req_from_L2_A:
	  ram_cset_cword$ADDRA = f_L2_to_L1_reqs$D_OUT[13:5];
      MUX_ram_cset_cword$a_put_1__SEL_1:
	  ram_cset_cword$ADDRA = MUX_ram_cset_cword$a_put_2__VAL_1;
      MUX_ram_cset_cword$a_put_1__SEL_2:
	  ram_cset_cword$ADDRA = MUX_ram_cset_cword$a_put_2__VAL_2;
      MUX_ram_cset_cword$a_put_1__SEL_4:
	  ram_cset_cword$ADDRA = MUX_ram_cset_cword$a_put_2__VAL_4;
      MUX_ram_cset_cword$a_put_1__SEL_5:
	  ram_cset_cword$ADDRA = MUX_ram_cset_cword$a_put_2__VAL_5;
      MUX_ram_cset_cword$a_put_1__SEL_6:
	  ram_cset_cword$ADDRA = cset_cword_in_cache__h35238;
      WILL_FIRE_RL_rl_downgrade_req_from_L2_C:
	  ram_cset_cword$ADDRA = MUX_ram_cset_cword$a_put_2__VAL_9;
      WILL_FIRE_RL_rl_refill_start:
	  ram_cset_cword$ADDRA = cset_cword_in_cache__h35238;
      default: ram_cset_cword$ADDRA = 9'b010101010 /* unspecified value */ ;
    endcase
  end
  assign ram_cset_cword$ADDRB =
	     MUX_ram_cset_cword$b_put_1__SEL_1 ?
	       MUX_ram_cset_cword$b_put_2__VAL_1 :
	       rg_va[11:3] ;
  always@(MUX_ram_cset_cword$a_put_1__SEL_1 or
	  MUX_ram_cset_cword$a_put_1__SEL_2 or
	  MUX_ram_cset_cword$a_put_1__SEL_3 or
	  MUX_ram_cset_cword$a_put_1__SEL_4 or
	  MUX_ram_cset_cword$a_put_1__SEL_5 or
	  MUX_ram_cset_cword$a_put_1__SEL_6 or
	  WILL_FIRE_RL_rl_refill_loop_final or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_A or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_C or
	  EN_ma_request_va or WILL_FIRE_RL_rl_refill_start)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_ram_cset_cword$a_put_1__SEL_1:
	  ram_cset_cword$DIA =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      MUX_ram_cset_cword$a_put_1__SEL_2:
	  ram_cset_cword$DIA =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      MUX_ram_cset_cword$a_put_1__SEL_3:
	  ram_cset_cword$DIA =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      MUX_ram_cset_cword$a_put_1__SEL_4:
	  ram_cset_cword$DIA =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      MUX_ram_cset_cword$a_put_1__SEL_5:
	  ram_cset_cword$DIA =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      MUX_ram_cset_cword$a_put_1__SEL_6:
	  ram_cset_cword$DIA =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      WILL_FIRE_RL_rl_refill_loop_final:
	  ram_cset_cword$DIA =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      WILL_FIRE_RL_rl_downgrade_req_from_L2_A:
	  ram_cset_cword$DIA =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      WILL_FIRE_RL_rl_downgrade_req_from_L2_C:
	  ram_cset_cword$DIA =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      EN_ma_request_va:
	  ram_cset_cword$DIA =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      WILL_FIRE_RL_rl_refill_start:
	  ram_cset_cword$DIA =
	      128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      default: ram_cset_cword$DIA =
		   128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign ram_cset_cword$DIB =
	     MUX_ram_cset_cword$b_put_1__SEL_1 ?
	       MUX_ram_cset_cword$b_put_3__VAL_1 :
	       MUX_ram_cset_cword$b_put_3__VAL_2 ;
  assign ram_cset_cword$WEA = 1'd0 ;
  assign ram_cset_cword$WEB = 1'd1 ;
  assign ram_cset_cword$ENA =
	     WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline != 3'd7 ||
	     WILL_FIRE_RL_rl_replace &&
	     SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 ==
	     2'd3 ||
	     WILL_FIRE_RL_rl_flush_loop_writeback_sequel &&
	     rg_cset_in_cache == 6'd63 &&
	     rg_way_in_cset ||
	     MUX_ram_cset_cword$a_put_1__SEL_4 ||
	     MUX_ram_cset_cword$a_put_1__SEL_5 ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	     valid_info_num_valids__h21330 != 2'd0 &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 ==
	     2'd3 ||
	     WILL_FIRE_RL_rl_refill_loop_final ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_A ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_C ||
	     EN_ma_request_va ||
	     WILL_FIRE_RL_rl_refill_start ;
  assign ram_cset_cword$ENB =
	     WILL_FIRE_RL_rl_refill_loop &&
	     (rg_cword_in_cline != 3'd0 || f_L2_to_L1_rsps$D_OUT[512]) ||
	     EN_mav_request_pa &&
	     (valid_info_num_valids__h39525 != 2'd1 ||
	      mav_request_pa_req[207:206] != 2'd0) &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d944 ;
  // submodule ram_cset_meta
  always@(MUX_ram_cset_meta$a_put_1__SEL_2 or
	  WILL_FIRE_RL_rl_refill_loop_final or
	  rg_va or
	  EN_ma_request_va or
	  ma_request_va_va or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_A or
	  f_L2_to_L1_reqs$D_OUT or
	  WILL_FIRE_RL_rl_initialize or
	  rg_cset_in_cache or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_C or
	  rg_save_cset_in_cache or
	  MUX_ram_cset_meta$a_put_1__SEL_1 or
	  MUX_ram_cset_meta$a_put_2__VAL_1 or
	  MUX_ram_cset_meta$a_put_1__SEL_3 or WILL_FIRE_RL_rl_flush_start)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_ram_cset_meta$a_put_1__SEL_2 || WILL_FIRE_RL_rl_refill_loop_final:
	  ram_cset_meta$ADDRA = rg_va[11:6];
      EN_ma_request_va: ram_cset_meta$ADDRA = ma_request_va_va[11:6];
      WILL_FIRE_RL_rl_downgrade_req_from_L2_A:
	  ram_cset_meta$ADDRA = f_L2_to_L1_reqs$D_OUT[13:8];
      WILL_FIRE_RL_rl_initialize: ram_cset_meta$ADDRA = rg_cset_in_cache;
      WILL_FIRE_RL_rl_downgrade_req_from_L2_C:
	  ram_cset_meta$ADDRA = rg_save_cset_in_cache;
      MUX_ram_cset_meta$a_put_1__SEL_1:
	  ram_cset_meta$ADDRA = MUX_ram_cset_meta$a_put_2__VAL_1;
      MUX_ram_cset_meta$a_put_1__SEL_3:
	  ram_cset_meta$ADDRA = MUX_ram_cset_meta$a_put_2__VAL_1;
      WILL_FIRE_RL_rl_flush_start: ram_cset_meta$ADDRA = 6'd0;
      default: ram_cset_meta$ADDRA = 6'b101010 /* unspecified value */ ;
    endcase
  end
  assign ram_cset_meta$ADDRB =
	     (MUX_ram_cset_meta$b_put_1__SEL_2 ||
	      MUX_ram_cset_cword$b_put_1__SEL_2 ||
	      WILL_FIRE_RL_rl_refill_start) ?
	       rg_va[11:6] :
	       rg_cset_in_cache ;
  always@(MUX_ram_cset_meta$a_put_1__SEL_1 or
	  MUX_ram_cset_meta$a_put_1__SEL_2 or
	  MUX_ram_cset_meta$a_put_1__SEL_3 or
	  WILL_FIRE_RL_rl_refill_loop_final or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_C or
	  WILL_FIRE_RL_rl_downgrade_req_from_L2_A or
	  EN_ma_request_va or
	  WILL_FIRE_RL_rl_flush_start or WILL_FIRE_RL_rl_initialize)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_ram_cset_meta$a_put_1__SEL_1:
	  ram_cset_meta$DIA =
	      108'hAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      MUX_ram_cset_meta$a_put_1__SEL_2:
	  ram_cset_meta$DIA =
	      108'hAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      MUX_ram_cset_meta$a_put_1__SEL_3:
	  ram_cset_meta$DIA =
	      108'hAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      WILL_FIRE_RL_rl_refill_loop_final:
	  ram_cset_meta$DIA =
	      108'hAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      WILL_FIRE_RL_rl_downgrade_req_from_L2_C:
	  ram_cset_meta$DIA =
	      108'hAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      WILL_FIRE_RL_rl_downgrade_req_from_L2_A:
	  ram_cset_meta$DIA =
	      108'hAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      EN_ma_request_va:
	  ram_cset_meta$DIA =
	      108'hAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      WILL_FIRE_RL_rl_flush_start:
	  ram_cset_meta$DIA =
	      108'hAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
      WILL_FIRE_RL_rl_initialize:
	  ram_cset_meta$DIA = 108'h2AAAAAAAAAAAA8AAAAAAAAAAAAA;
      default: ram_cset_meta$DIA =
		   108'hAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(MUX_ram_cset_meta$a_put_1__SEL_1 or
	  rg_new_cset_meta or
	  MUX_ram_cset_meta$b_put_1__SEL_2 or
	  MUX_ram_cset_meta$b_put_3__VAL_2 or
	  MUX_ram_cset_meta$b_put_1__SEL_3 or
	  MUX_ram_cset_meta$b_put_3__VAL_3 or
	  MUX_ram_cset_meta$a_put_1__SEL_3 or
	  MUX_ram_cset_meta$b_put_3__VAL_4 or
	  MUX_ram_cset_cword$b_put_1__SEL_2 or
	  MUX_ram_cset_meta$b_put_3__VAL_5 or
	  WILL_FIRE_RL_rl_refill_start or MUX_ram_cset_meta$b_put_3__VAL_6)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_ram_cset_meta$a_put_1__SEL_1: ram_cset_meta$DIB = rg_new_cset_meta;
      MUX_ram_cset_meta$b_put_1__SEL_2:
	  ram_cset_meta$DIB = MUX_ram_cset_meta$b_put_3__VAL_2;
      MUX_ram_cset_meta$b_put_1__SEL_3:
	  ram_cset_meta$DIB = MUX_ram_cset_meta$b_put_3__VAL_3;
      MUX_ram_cset_meta$a_put_1__SEL_3:
	  ram_cset_meta$DIB = MUX_ram_cset_meta$b_put_3__VAL_4;
      MUX_ram_cset_cword$b_put_1__SEL_2:
	  ram_cset_meta$DIB = MUX_ram_cset_meta$b_put_3__VAL_5;
      WILL_FIRE_RL_rl_refill_start:
	  ram_cset_meta$DIB = MUX_ram_cset_meta$b_put_3__VAL_6;
      default: ram_cset_meta$DIB =
		   108'hAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign ram_cset_meta$WEA =
	     !MUX_ram_cset_meta$a_put_1__SEL_1 &&
	     !MUX_ram_cset_meta$a_put_1__SEL_2 &&
	     !MUX_ram_cset_meta$a_put_1__SEL_3 &&
	     !WILL_FIRE_RL_rl_refill_loop_final &&
	     !WILL_FIRE_RL_rl_downgrade_req_from_L2_C &&
	     !WILL_FIRE_RL_rl_downgrade_req_from_L2_A &&
	     !EN_ma_request_va &&
	     !WILL_FIRE_RL_rl_flush_start ;
  assign ram_cset_meta$WEB = 1'd1 ;
  assign ram_cset_meta$ENA =
	     WILL_FIRE_RL_rl_flush_loop_writeback_sequel && rg_way_in_cset ||
	     WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd7 &&
	     rg_va[5:3] != 3'd7 ||
	     WILL_FIRE_RL_rl_flush_loop &&
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 !=
	     2'd3 &&
	     rg_way_in_cset ||
	     WILL_FIRE_RL_rl_refill_loop_final ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_C ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_A ||
	     EN_ma_request_va ||
	     WILL_FIRE_RL_rl_flush_start ||
	     WILL_FIRE_RL_rl_initialize ;
  assign ram_cset_meta$ENB =
	     WILL_FIRE_RL_rl_flush_loop_writeback_sequel && rg_way_in_cset ||
	     WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 ||
	     WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	     valid_info_num_valids__h21330 != 2'd0 ||
	     WILL_FIRE_RL_rl_flush_loop &&
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 !=
	     2'd3 &&
	     rg_way_in_cset ||
	     EN_mav_request_pa &&
	     (valid_info_num_valids__h39525 != 2'd1 ||
	      mav_request_pa_req[207:206] != 2'd0) &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d944 ||
	     WILL_FIRE_RL_rl_refill_start ;
  // remaining internal signals
  assign DONTCARE_CONCAT_IF_rg_cword_in_cline_EQ_0_0_TH_ETC___d245 =
	     { 64'hAAAAAAAAAAAAAAAA,
	       (rg_cword_in_cline == 3'd0) ?
		 f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[511:448] :
		 rg_read_cline_buf[511:448],
	       (rg_cword_in_cline == 3'd0) ?
		 f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[447:384] :
		 rg_read_cline_buf[447:384],
	       (rg_cword_in_cline == 3'd0) ?
		 f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[383:320] :
		 rg_read_cline_buf[383:320] } ;
  assign DONTCARE_CONCAT_IF_rg_cword_in_cline_EQ_0_0_TH_ETC___d252 =
	     { DONTCARE_CONCAT_IF_rg_cword_in_cline_EQ_0_0_TH_ETC___d245,
	       (rg_cword_in_cline == 3'd0) ?
		 f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[319:256] :
		 rg_read_cline_buf[319:256],
	       (rg_cword_in_cline == 3'd0) ?
		 f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[255:192] :
		 rg_read_cline_buf[255:192] } ;
  assign IF_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO__ETC___d1199 =
	     (valid_info_num_valids__h39525 == 2'd1 &&
	      mav_request_pa_req[207:206] == 2'd2 &&
	      !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927) ?
	       { 2'd2,
		 IF_mav_request_pa_req_BITS_204_TO_203_96_EQ_0b_ETC___d1196 } :
	       130'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ;
  assign IF_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO__ETC___d1200 =
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d933 ?
	       ((rg_lrsc_valid && rg_lrsc_pa_35_EQ_mav_request_pa_pa___d936) ?
		  { 66'h20000000000000000, mav_request_pa_req[138:75] } :
		  130'h100000000000000010000000000000000) :
	       IF_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO__ETC___d1199 ;
  assign IF_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO__ETC___d1201 =
	     (valid_info_num_valids__h39525 == 2'd1 &&
	      mav_request_pa_req[207:206] == 2'd2 &&
	      mav_request_pa_req[74:70] == 5'b00010) ?
	       { 2'd1, data__h52435, 64'hAAAAAAAAAAAAAAAA } :
	       IF_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO__ETC___d1200 ;
  assign IF_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO__ETC___d1202 =
	     (valid_info_num_valids__h39525 == 2'd1 &&
	      mav_request_pa_req[207:206] == 2'd1 &&
	      !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927) ?
	       { 66'h20000000000000000, mav_request_pa_req[138:75] } :
	       IF_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO__ETC___d1201 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1012 =
	     (ram_cset_meta$DOA[107:106] != 2'd0 &&
	      ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788) ?
	       n__h53984 :
	       ram_cset_cword$DOA[127:64] ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1086 =
	     (ram_cset_meta$DOA[107:106] != 2'd0 &&
	      ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788) ?
	       n__h59583 :
	       ram_cset_cword$DOA[127:64] ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1110 =
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d933 &&
	     rg_lrsc_valid &&
	     rg_lrsc_pa_35_EQ_mav_request_pa_pa___d936 ||
	     NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1100 &&
	     (valid_info_num_valids__h39525 == 2'd1 &&
	      mav_request_pa_req[207:206] == 2'd2 &&
	      !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 &&
	      rg_lrsc_pa_35_EQ_mav_request_pa_pa___d936 ||
	      NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1107) ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115 =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd1 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 &&
	     verbosity != 3'd0 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1116 =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd1 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796 ==
	     2'd0 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121 =
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d933 &&
	     rg_lrsc_valid &&
	     rg_lrsc_pa_35_EQ_mav_request_pa_pa___d936 &&
	     verbosity != 3'd0 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1123 =
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d933 &&
	     rg_lrsc_valid &&
	     rg_lrsc_pa_35_EQ_mav_request_pa_pa___d936 &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796 ==
	     2'd0 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131 =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 &&
	     verbosity != 3'd0 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1135 =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 &&
	     verbosity != 3'd0 &&
	     mav_request_pa_req[74:70] == 5'b0 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1137 =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 &&
	     verbosity != 3'd0 &&
	     mav_request_pa_req[74:70] == 5'b00001 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1139 =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 &&
	     verbosity != 3'd0 &&
	     mav_request_pa_req[74:70] == 5'b00100 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1141 =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 &&
	     verbosity != 3'd0 &&
	     mav_request_pa_req[74:70] == 5'b01100 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1143 =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 &&
	     verbosity != 3'd0 &&
	     mav_request_pa_req[74:70] == 5'b01000 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1145 =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 &&
	     verbosity != 3'd0 &&
	     mav_request_pa_req[74:70] == 5'b10000 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1147 =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 &&
	     verbosity != 3'd0 &&
	     mav_request_pa_req[74:70] == 5'b10100 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1149 =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 &&
	     verbosity != 3'd0 &&
	     mav_request_pa_req[74:70] == 5'b11000 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1151 =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 &&
	     verbosity != 3'd0 &&
	     mav_request_pa_req[74:70] != 5'b00010 &&
	     mav_request_pa_req[74:70] != 5'b00011 &&
	     mav_request_pa_req[74:70] != 5'b0 &&
	     mav_request_pa_req[74:70] != 5'b00001 &&
	     mav_request_pa_req[74:70] != 5'b00100 &&
	     mav_request_pa_req[74:70] != 5'b01100 &&
	     mav_request_pa_req[74:70] != 5'b01000 &&
	     mav_request_pa_req[74:70] != 5'b10000 &&
	     mav_request_pa_req[74:70] != 5'b10100 &&
	     mav_request_pa_req[74:70] != 5'b11000 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1152 =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796 ==
	     2'd0 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 =
	     (ram_cset_meta$DOA[107:106] != 2'd0 &&
	      ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_rg_ETC___d511) ?
	       ram_cset_meta$DOA[107:106] :
	       ((ram_cset_meta$DOA[53:52] != 2'd0 &&
		 ram_cset_meta$DOA[51:0] == rg_pa[63:12]) ?
		  ram_cset_meta$DOA[53:52] :
		  2'd0) ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d524 =
	     valid_info_num_valids__h21330 == 2'd0 ||
	     f_L2_to_L1_reqs$EMPTY_N &&
	     (IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 ==
	      2'd3 ||
	      f_L1_to_L2_rsps$FULL_N) ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d649 =
	     (ram_cset_meta$DOA[107:106] != 2'd0 &&
	      ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_rg_ETC___d511) ?
	       { f_L2_to_L1_reqs$D_OUT[1:0], rg_pa[63:12] } :
	       ram_cset_meta$DOA[107:54] ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796 =
	     (ram_cset_meta$DOA[107:106] != 2'd0 &&
	      ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788) ?
	       ram_cset_meta$DOA[107:106] :
	       ((ram_cset_meta$DOA[53:52] != 2'd0 &&
		 ram_cset_meta$DOA[51:0] == mav_request_pa_pa[63:12]) ?
		  ram_cset_meta$DOA[53:52] :
		  2'd0) ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 =
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796 <=
	     2'd1 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d933 =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     mav_request_pa_req[74:70] == 5'b00011 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d942 =
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d933 &&
	     rg_lrsc_valid &&
	     rg_lrsc_pa_35_EQ_mav_request_pa_pa___d936 ||
	     mav_request_pa_req[74:70] != 5'b00011 &&
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd2 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d944 =
	     valid_info_num_valids__h39525 == 2'd1 &&
	     mav_request_pa_req[207:206] == 2'd1 &&
	     !IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 ||
	     (valid_info_num_valids__h39525 != 2'd1 ||
	      mav_request_pa_req[207:206] != 2'd2 ||
	      mav_request_pa_req[74:70] != 5'b00010) &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d942 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_53_TO_52_1_ETC___d515 =
	     (ram_cset_meta$DOA[53:52] != 2'd0 &&
	      ram_cset_meta$DOA[51:0] == rg_pa[63:12]) ?
	       2'd1 :
	       2'd0 ;
  assign IF_NOT_ram_cset_meta_a_read__8_BITS_53_TO_52_1_ETC___d792 =
	     (ram_cset_meta$DOA[53:52] != 2'd0 &&
	      ram_cset_meta$DOA[51:0] == mav_request_pa_pa[63:12]) ?
	       2'd1 :
	       2'd0 ;
  assign IF_mav_request_pa_req_BITS_204_TO_203_96_EQ_0b_ETC___d1021 =
	     (mav_request_pa_req[204:203] == 2'b10) ?
	       SEXT_ram_cset_cword_a_read_BITS_63_TO_0_0_AND__ETC___d1020 :
	       data__h52434 ;
  assign IF_mav_request_pa_req_BITS_204_TO_203_96_EQ_0b_ETC___d1023 =
	     (mav_request_pa_req[204:203] == 2'b10) ?
	       { {32{mav_request_pa_req_BITS_106_TO_75__q5[31]}},
		 mav_request_pa_req_BITS_106_TO_75__q5 } :
	       mav_request_pa_req[138:75] ;
  assign IF_mav_request_pa_req_BITS_204_TO_203_96_EQ_0b_ETC___d1196 =
	     (mav_request_pa_req[204:203] == 2'b10) ?
	       { SEXT_ram_cset_cword_a_read_BITS_63_TO_0_0_AND__ETC___d1020,
		 final_st_val__h58776 } :
	       { data__h52434, _theResult_____2__h58772 } ;
  assign IF_ram_cset_meta_a_read__8_BITS_107_TO_106_12__ETC___d1015 =
	     (ram_cset_meta$DOA[107:106] == 2'd0 ||
	      !ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788) ?
	       n__h53984 :
	       ram_cset_cword$DOA[63:0] ;
  assign IF_ram_cset_meta_a_read__8_BITS_107_TO_106_12__ETC___d1087 =
	     (ram_cset_meta$DOA[107:106] == 2'd0 ||
	      !ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788) ?
	       n__h59583 :
	       ram_cset_cword$DOA[63:0] ;
  assign IF_ram_cset_meta_a_read__8_BITS_107_TO_106_12__ETC___d652 =
	     (ram_cset_meta$DOA[107:106] == 2'd0 ||
	      !ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_rg_ETC___d511) ?
	       { f_L2_to_L1_reqs$D_OUT[1:0], rg_pa[63:12] } :
	       ram_cset_meta$DOA[53:0] ;
  assign IF_rg_cache_op_68_EQ_1_69_OR_rg_cache_op_68_EQ_ETC___d178 =
	     { (rg_cache_op == 2'd1 ||
		rg_cache_op == 2'd2 && rg_amo_funct7[6:2] != 5'b00010) ?
		 2'd2 :
		 2'd1,
	       dcache_not_icache } ;
  assign IF_rg_way_in_cset_3_THEN_IF_rg_way_in_cset_3_T_ETC___d378 =
	     rg_way_in_cset ?
	       IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d305 :
	       rg_new_meta_state ;
  assign IF_rg_way_in_cset_3_THEN_IF_rg_way_in_cset_3_T_ETC___d392 =
	     rg_way_in_cset ? ctag__h14447 : new_meta_ctag__h14727 ;
  assign IF_rg_way_in_cset_3_THEN_SEL_ARR_IF_rg_way_in__ETC___d408 =
	     rg_way_in_cset ? new_meta_ctag__h14727 : ctag__h14452 ;
  assign IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d305 =
	     rg_way_in_cset ?
	       rg_new_cset_meta[53:52] :
	       ram_cset_meta$DOA[53:52] ;
  assign IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d307 =
	     rg_way_in_cset ?
	       rg_new_cset_meta[107:106] :
	       ram_cset_meta$DOA[107:106] ;
  assign IF_rg_way_in_cset_3_THEN_rg_new_meta_state_11__ETC___d394 =
	     rg_way_in_cset ?
	       rg_new_meta_state :
	       IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d307 ;
  assign NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1100 =
	     valid_info_num_valids__h39525 != 2'd1 ||
	     mav_request_pa_req[207:206] != 2'd2 ||
	     mav_request_pa_req[74:70] != 5'b00011 ||
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927 ;
  assign NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1107 =
	     (valid_info_num_valids__h39525 != 2'd1 ||
	      mav_request_pa_req[207:206] != 2'd2 ||
	      IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927) &&
	     CASE_NOT_ram_cset_metaDOA_BITS_107_TO_106_EQ__ETC__q7 ==
	     rg_lrsc_pa[63:12] ;
  assign NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1112 =
	     (valid_info_num_valids__h39525 != 2'd1 ||
	      mav_request_pa_req[207:206] != 2'd1 ||
	      IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927) &&
	     (valid_info_num_valids__h39525 == 2'd1 &&
	      mav_request_pa_req[207:206] == 2'd2 &&
	      mav_request_pa_req[74:70] == 5'b00010 ||
	      IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1110) ;
  assign NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1158 =
	     (valid_info_num_valids__h39525 != 2'd1 ||
	      mav_request_pa_req[207:206] != 2'd2 ||
	      mav_request_pa_req[74:70] != 5'b00010) &&
	     NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1100 &&
	     (valid_info_num_valids__h39525 != 2'd1 ||
	      mav_request_pa_req[207:206] != 2'd2 ||
	      IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927) ;
  assign NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1159 =
	     (valid_info_num_valids__h39525 != 2'd1 ||
	      mav_request_pa_req[207:206] != 2'd1 ||
	      IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927) &&
	     NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1158 ;
  assign NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1185 =
	     (valid_info_num_valids__h39525 != 2'd1 ||
	      IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796 !=
	      2'd1 ||
	      mav_request_pa_req[207:206] != 2'd1 &&
	      mav_request_pa_req[207:206] != 2'd2) &&
	     verbosity != 3'd0 ;
  assign NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1188 =
	     (valid_info_num_valids__h39525 != 2'd1 ||
	      mav_request_pa_req[207:206] != 2'd2 ||
	      mav_request_pa_req[74:70] != 5'b00010) &&
	     NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1100 &&
	     (valid_info_num_valids__h39525 != 2'd1 ||
	      mav_request_pa_req[207:206] != 2'd2 ||
	      IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927) &&
	     NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1185 ;
  assign NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633 =
	     valid_info_num_valids__h21330 > 2'd1 ;
  assign NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 =
	     valid_info_num_valids__h39525 > 2'd1 ;
  assign NOT_SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cs_ETC___d426 =
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 !=
	     2'd3 &&
	     rg_cset_in_cache == 6'd63 &&
	     rg_way_in_cset &&
	     NOT_verbosity_ULT_2_2___d23 &&
	     dcache_not_icache ;
  assign NOT_SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cs_ETC___d428 =
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 !=
	     2'd3 &&
	     rg_cset_in_cache == 6'd63 &&
	     rg_way_in_cset &&
	     NOT_verbosity_ULT_2_2___d23 &&
	     !dcache_not_icache ;
  assign NOT_SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cs_ETC___d430 =
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 !=
	     2'd3 &&
	     rg_cset_in_cache == 6'd63 &&
	     rg_way_in_cset &&
	     NOT_verbosity_ULT_2_2___d23 ;
  assign NOT_mav_request_pa_req_BITS_207_TO_206_04_EQ_1_ETC___d1171 =
	     (mav_request_pa_req[207:206] != 2'd1 ||
	      IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927) &&
	     (mav_request_pa_req[207:206] != 2'd2 ||
	      mav_request_pa_req[74:70] != 5'b00010) &&
	     (mav_request_pa_req[207:206] != 2'd2 ||
	      IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927) &&
	     valid_info_num_valids__h39525 == 2'd1 &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796 ==
	     2'd1 &&
	     (mav_request_pa_req[207:206] == 2'd1 ||
	      mav_request_pa_req[207:206] == 2'd2) ;
  assign NOT_mav_request_pa_req_BITS_207_TO_206_04_EQ_1_ETC___d1180 =
	     (mav_request_pa_req[207:206] != 2'd1 ||
	      IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927) &&
	     (mav_request_pa_req[207:206] != 2'd2 ||
	      mav_request_pa_req[74:70] != 5'b00010) &&
	     NOT_mav_request_pa_req_BITS_207_TO_206_04_EQ_2_ETC___d1178 ;
  assign NOT_mav_request_pa_req_BITS_207_TO_206_04_EQ_2_ETC___d1178 =
	     (mav_request_pa_req[207:206] != 2'd2 ||
	      IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927) &&
	     valid_info_num_valids__h39525 == 2'd1 &&
	     IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796 ==
	     2'd1 &&
	     (mav_request_pa_req[207:206] == 2'd1 ||
	      mav_request_pa_req[207:206] == 2'd2) &&
	     verbosity != 3'd0 ;
  assign NOT_verbosity_ULT_2_2___d23 = verbosity >= 3'd2 ;
  assign SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d312 =
	     SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 <=
	     rg_new_meta_state ;
  assign SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d320 =
	     (SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d312 ||
	      f_L1_to_L2_rsps$FULL_N) &&
	     (rg_cset_in_cache != 6'd63 || !rg_way_in_cset ||
	      f_flush_rsps$FULL_N) ;
  assign SEXT_ram_cset_cword_a_read_BITS_63_TO_0_0_AND__ETC___d1020 =
	     { {32{data2434_BITS_31_TO_0__q4[31]}},
	       data2434_BITS_31_TO_0__q4 } ;
  assign _theResult___snd__h4989 =
	     ram_cset_meta$DOA[53:52] != 2'd0 &&
	     ram_cset_meta$DOA[107:106] == 2'd0 ;
  assign cline_pa__h15519 =
	     { new_meta_ctag__h14727, rg_cset_in_cache, 6'd0 } ;
  assign cline_pa__h35106 = { rg_pa[63:12], rg_cset_in_cache, 6'd0 } ;
  assign cset_cword_in_cache___1__h36760 =
	     { rg_save_cset_in_cache, rg_save_cword_in_cline } ;
  assign cset_cword_in_cache__h35238 = { rg_cset_in_cache, 3'd0 } ;
  assign ctag__h14447 =
	     rg_way_in_cset ?
	       rg_new_cset_meta[51:0] :
	       ram_cset_meta$DOA[51:0] ;
  assign ctag__h14452 =
	     rg_way_in_cset ?
	       rg_new_cset_meta[105:54] :
	       ram_cset_meta$DOA[105:54] ;
  assign cword__h10620 =
	     (rg_cword_in_cline == 3'd0) ?
	       f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[63:0] :
	       rg_read_cline_buf[63:0] ;
  assign cword_in_cline__h3093 = rg_cword_in_cline + 3'd1 ;
  assign data1__h52960 = valid_info_data__h39527 >> shamt__h58661 ;
  assign data2434_BITS_31_TO_0__q4 = data__h52434[31:0] ;
  assign data__h52434 = data1__h52960 & mask__h58707 ;
  assign data__h52435 =
	     (!mav_request_pa_req[205] &&
	      CASE_mav_request_pa_req_BITS_204_TO_203_0b0_da_ETC__q2) ?
	       result__h53223 :
	       result__h53290 ;
  assign f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1 =
	     f_L2_to_L1_rsps$D_OUT[511:0] ;
  assign final_st_val__h58776 = { 32'd0, _theResult_____2__h58772[31:0] } ;
  assign final_st_val__h58866 =
	     IF_mav_request_pa_req_BITS_204_TO_203_96_EQ_0b_ETC___d1021 +
	     IF_mav_request_pa_req_BITS_204_TO_203_96_EQ_0b_ETC___d1023 ;
  assign final_st_val__h58944 = w1__h58765 ^ w2__h58767 ;
  assign final_st_val__h58948 = w1__h58765 & w2__h58767 ;
  assign final_st_val__h58952 = w1__h58765 | w2__h58767 ;
  assign final_st_val__h58956 =
	     (w1__h58765 < w2__h58767) ? w1__h58765 : w2__h58767 ;
  assign final_st_val__h58961 =
	     (w1__h58765 <= w2__h58767) ? w2__h58767 : w1__h58765 ;
  assign final_st_val__h58967 =
	     ((IF_mav_request_pa_req_BITS_204_TO_203_96_EQ_0b_ETC___d1021 ^
	       64'h8000000000000000) <
	      (IF_mav_request_pa_req_BITS_204_TO_203_96_EQ_0b_ETC___d1023 ^
	       64'h8000000000000000)) ?
	       w1__h58765 :
	       w2__h58767 ;
  assign final_st_val__h58972 =
	     ((IF_mav_request_pa_req_BITS_204_TO_203_96_EQ_0b_ETC___d1021 ^
	       64'h8000000000000000) <=
	      (IF_mav_request_pa_req_BITS_204_TO_203_96_EQ_0b_ETC___d1023 ^
	       64'h8000000000000000)) ?
	       w2__h58767 :
	       w1__h58765 ;
  assign l1_to_l2_req_addr__h6583 = { rg_pa[63:6], 6'd0 } ;
  assign mav_request_pa_req_BITS_106_TO_75__q5 = mav_request_pa_req[106:75] ;
  assign new_st_val__h58609 =
	     (mav_request_pa_req[204:203] == 2'b10) ?
	       final_st_val__h58776 :
	       _theResult_____2__h58772 ;
  assign next_cset_cword_in_cache__h10894 =
	     { rg_va[11:6], cword_in_cline__h3093 } ;
  assign next_cset_in_cache__h16246 = rg_cset_in_cache + 6'd1 ;
  assign num_valids__h21487 =
	     IF_NOT_ram_cset_meta_a_read__8_BITS_53_TO_52_1_ETC___d515 +
	     2'd1 ;
  assign num_valids__h39681 =
	     IF_NOT_ram_cset_meta_a_read__8_BITS_53_TO_52_1_ETC___d792 +
	     2'd1 ;
  assign pa__h14914 = { ctag__h14452, rg_cset_in_cache, 6'd0 } ;
  assign pa__h14935 = { ctag__h14447, rg_cset_in_cache, 6'd0 } ;
  assign pa__h15146 =
	     { IF_rg_way_in_cset_3_THEN_SEL_ARR_IF_rg_way_in__ETC___d408,
	       rg_cset_in_cache,
	       6'd0 } ;
  assign pa__h15170 =
	     { IF_rg_way_in_cset_3_THEN_IF_rg_way_in_cset_3_T_ETC___d392,
	       rg_cset_in_cache,
	       6'd0 } ;
  assign pa__h21105 = { ram_cset_meta$DOA[105:54], rg_cset_in_cache, 6'd0 } ;
  assign pa__h21126 = { ram_cset_meta$DOA[51:0], rg_cset_in_cache, 6'd0 } ;
  assign pa__h39306 = { ram_cset_meta$DOA[105:54], rg_va[11:6], 6'd0 } ;
  assign pa__h39327 = { ram_cset_meta$DOA[51:0], rg_va[11:6], 6'd0 } ;
  assign ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788 =
	     ram_cset_meta$DOA[105:54] == mav_request_pa_pa[63:12] ;
  assign ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_rg_ETC___d511 =
	     ram_cset_meta$DOA[105:54] == rg_pa[63:12] ;
  assign result__h53223 = data__h52434 | y__h53235 ;
  assign result__h53290 = data__h52434 & mask__h58707 ;
  assign rg_cword_in_cline_EQ_7_AND_NOT_verbosity_EQ_0__ETC___d92 =
	     rg_cword_in_cline == 3'd7 && verbosity != 3'd0 &&
	     rg_post_wb_fsm_state != 4'd0 &&
	     rg_post_wb_fsm_state != 4'd1 &&
	     rg_post_wb_fsm_state != 4'd2 &&
	     rg_post_wb_fsm_state != 4'd3 &&
	     rg_post_wb_fsm_state != 4'd4 &&
	     rg_post_wb_fsm_state != 4'd5 &&
	     rg_post_wb_fsm_state != 4'd6 &&
	     rg_post_wb_fsm_state != 4'd7 &&
	     rg_post_wb_fsm_state != 4'd8 &&
	     rg_post_wb_fsm_state != 4'd9 ;
  assign rg_lrsc_pa_35_EQ_mav_request_pa_pa___d936 =
	     rg_lrsc_pa == mav_request_pa_pa ;
  assign shamt__h58661 = { mav_request_pa_req[141:139], 3'b0 } ;
  assign tmp__h5074 = { 1'd0, rg_victim_way } ;
  assign tmp__h5075 = tmp__h5074 + 2'd1 ;
  assign valid_info_data__h21332 = x__h21578 | y__h21579 ;
  assign valid_info_data__h39527 = x__h39772 | y__h39773 ;
  assign valid_info_num_valids__h21330 =
	     (ram_cset_meta$DOA[107:106] != 2'd0 &&
	      ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_rg_ETC___d511) ?
	       num_valids__h21487 :
	       IF_NOT_ram_cset_meta_a_read__8_BITS_53_TO_52_1_ETC___d515 ;
  assign valid_info_num_valids__h39525 =
	     (ram_cset_meta$DOA[107:106] != 2'd0 &&
	      ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788) ?
	       num_valids__h39681 :
	       IF_NOT_ram_cset_meta_a_read__8_BITS_53_TO_52_1_ETC___d792 ;
  assign victim_cline_pa__h5091 = { tag__h5333, rg_va[11:6], 6'd0 } ;
  assign victim_way__h4955 =
	     (ram_cset_meta$DOA[107:106] != 2'd0 &&
	      ram_cset_meta$DOA[53:52] != 2'd0) ?
	       tmp__h5075[0] :
	       _theResult___snd__h4989 ;
  assign w1___1__h58835 = { 32'd0, data__h52434[31:0] } ;
  assign w1__h58765 =
	     (mav_request_pa_req[204:203] == 2'b10) ?
	       w1___1__h58835 :
	       data__h52434 ;
  assign w2___1__h58836 = { 32'd0, mav_request_pa_req[106:75] } ;
  assign w2__h58767 =
	     (mav_request_pa_req[204:203] == 2'b10) ?
	       w2___1__h58836 :
	       mav_request_pa_req[138:75] ;
  assign x__h16251 = rg_way_in_cset + 1'd1 ;
  assign x__h21578 = ram_cset_cword$DOA[63:0] & y__h21596 ;
  assign x__h39772 = ram_cset_cword$DOA[63:0] & y__h39790 ;
  assign x_addr__h3120 = { ctag__h3125, rg_cset_in_cache, 6'd0 } ;
  assign x_addr__h61346 = { mav_request_pa_pa[63:6], 6'd0 } ;
  assign y__h21579 = ram_cset_cword$DOA[127:64] & y__h27911 ;
  assign y__h21596 =
	     {64{ram_cset_meta$DOA[53:52] != 2'd0 &&
		 ram_cset_meta$DOA[51:0] == rg_pa[63:12]}} ;
  assign y__h27911 =
	     {64{ram_cset_meta$DOA[107:106] != 2'd0 &&
		 ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_rg_ETC___d511}} ;
  assign y__h39773 = ram_cset_cword$DOA[127:64] & y__h46105 ;
  assign y__h39790 =
	     {64{ram_cset_meta$DOA[53:52] != 2'd0 &&
		 ram_cset_meta$DOA[51:0] == mav_request_pa_pa[63:12]}} ;
  assign y__h46105 =
	     {64{ram_cset_meta$DOA[107:106] != 2'd0 &&
		 ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788}} ;
  always@(rg_way_in_cset or ram_cset_meta$DOA)
  begin
    case (rg_way_in_cset)
      1'd0: ctag__h3125 = ram_cset_meta$DOA[51:0];
      1'd1: ctag__h3125 = ram_cset_meta$DOA[105:54];
    endcase
  end
  always@(rg_way_in_cset or ctag__h14447 or ctag__h14452)
  begin
    case (rg_way_in_cset)
      1'd0: new_meta_ctag__h14727 = ctag__h14447;
      1'd1: new_meta_ctag__h14727 = ctag__h14452;
    endcase
  end
  always@(mav_request_pa_req)
  begin
    case (mav_request_pa_req[204:203])
      2'b0: mask__h58707 = 64'h00000000000000FF;
      2'b01: mask__h58707 = 64'h000000000000FFFF;
      2'b10: mask__h58707 = 64'h00000000FFFFFFFF;
      2'd3: mask__h58707 = 64'hFFFFFFFFFFFFFFFF;
    endcase
  end
  always@(mav_request_pa_req)
  begin
    case (mav_request_pa_req[204:203])
      2'b0: y__h53235 = 64'hFFFFFFFFFFFFFF00;
      2'b01: y__h53235 = 64'hFFFFFFFFFFFF0000;
      2'b10: y__h53235 = 64'hFFFFFFFF00000000;
      2'd3: y__h53235 = 64'd0;
    endcase
  end
  always@(victim_way__h4955 or ram_cset_meta$DOA)
  begin
    case (victim_way__h4955)
      1'd0: tag__h5333 = ram_cset_meta$DOA[51:0];
      1'd1: tag__h5333 = ram_cset_meta$DOA[105:54];
    endcase
  end
  always@(victim_way__h4955 or ram_cset_meta$DOA)
  begin
    case (victim_way__h4955)
      1'd0:
	  SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 =
	      ram_cset_meta$DOA[53:52];
      1'd1:
	  SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 =
	      ram_cset_meta$DOA[107:106];
    endcase
  end
  always@(rg_way_in_cset or
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d305 or
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d307)
  begin
    case (rg_way_in_cset)
      1'd0:
	  SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 =
	      IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d305;
      1'd1:
	  SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 =
	      IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d307;
    endcase
  end
  always@(ram_cset_meta$DOA or
	  ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788 or
	  ram_cset_cword$DOA)
  begin
    case (ram_cset_meta$DOA[107:106] != 2'd0 &&
	  ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788)
      1'd0: old_cword__h53973 = ram_cset_cword$DOA[63:0];
      1'd1: old_cword__h53973 = ram_cset_cword$DOA[127:64];
    endcase
  end
  always@(mav_request_pa_req or data__h52434)
  begin
    case (mav_request_pa_req[204:203])
      2'b0:
	  CASE_mav_request_pa_req_BITS_204_TO_203_0b0_da_ETC__q2 =
	      data__h52434[7];
      2'b01:
	  CASE_mav_request_pa_req_BITS_204_TO_203_0b0_da_ETC__q2 =
	      data__h52434[15];
      2'b10:
	  CASE_mav_request_pa_req_BITS_204_TO_203_0b0_da_ETC__q2 =
	      data__h52434[31];
      2'd3:
	  CASE_mav_request_pa_req_BITS_204_TO_203_0b0_da_ETC__q2 =
	      data__h52434[63];
    endcase
  end
  always@(mav_request_pa_pa or old_cword__h53973 or mav_request_pa_req)
  begin
    case (mav_request_pa_pa[2:0])
      3'h0:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d990 =
	      { old_cword__h53973[63:8], mav_request_pa_req[82:75] };
      3'h1:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d990 =
	      { old_cword__h53973[63:16],
		mav_request_pa_req[82:75],
		old_cword__h53973[7:0] };
      3'h2:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d990 =
	      { old_cword__h53973[63:24],
		mav_request_pa_req[82:75],
		old_cword__h53973[15:0] };
      3'h3:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d990 =
	      { old_cword__h53973[63:32],
		mav_request_pa_req[82:75],
		old_cword__h53973[23:0] };
      3'h4:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d990 =
	      { old_cword__h53973[63:40],
		mav_request_pa_req[82:75],
		old_cword__h53973[31:0] };
      3'h5:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d990 =
	      { old_cword__h53973[63:48],
		mav_request_pa_req[82:75],
		old_cword__h53973[39:0] };
      3'h6:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d990 =
	      { old_cword__h53973[63:56],
		mav_request_pa_req[82:75],
		old_cword__h53973[47:0] };
      3'h7:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d990 =
	      { mav_request_pa_req[82:75], old_cword__h53973[55:0] };
    endcase
  end
  always@(mav_request_pa_pa or old_cword__h53973 or mav_request_pa_req)
  begin
    case (mav_request_pa_pa[2:0])
      3'h0:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1000 =
	      { old_cword__h53973[63:16], mav_request_pa_req[90:75] };
      3'h2:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1000 =
	      { old_cword__h53973[63:32],
		mav_request_pa_req[90:75],
		old_cword__h53973[15:0] };
      3'h4:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1000 =
	      { old_cword__h53973[63:48],
		mav_request_pa_req[90:75],
		old_cword__h53973[31:0] };
      3'h6:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1000 =
	      { mav_request_pa_req[90:75], old_cword__h53973[47:0] };
      default: IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1000 =
		   old_cword__h53973;
    endcase
  end
  always@(mav_request_pa_pa or old_cword__h53973 or mav_request_pa_req)
  begin
    case (mav_request_pa_pa[2:0])
      3'h0:
	  CASE_mav_request_pa_pa_BITS_2_TO_0_0x0_old_cwo_ETC__q3 =
	      { old_cword__h53973[63:32], mav_request_pa_req[106:75] };
      3'h4:
	  CASE_mav_request_pa_pa_BITS_2_TO_0_0x0_old_cwo_ETC__q3 =
	      { mav_request_pa_req[106:75], old_cword__h53973[31:0] };
      default: CASE_mav_request_pa_pa_BITS_2_TO_0_0x0_old_cwo_ETC__q3 =
		   old_cword__h53973;
    endcase
  end
  always@(mav_request_pa_req or
	  old_cword__h53973 or
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d990 or
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1000 or
	  CASE_mav_request_pa_pa_BITS_2_TO_0_0x0_old_cwo_ETC__q3)
  begin
    case (mav_request_pa_req[205:203])
      3'b0:
	  n__h53984 =
	      IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d990;
      3'b001:
	  n__h53984 =
	      IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1000;
      3'b010:
	  n__h53984 = CASE_mav_request_pa_pa_BITS_2_TO_0_0x0_old_cwo_ETC__q3;
      3'b011: n__h53984 = mav_request_pa_req[138:75];
      default: n__h53984 = old_cword__h53973;
    endcase
  end
  always@(mav_request_pa_req or
	  final_st_val__h58972 or
	  final_st_val__h58866 or
	  w2__h58767 or
	  final_st_val__h58944 or
	  final_st_val__h58952 or
	  final_st_val__h58948 or
	  final_st_val__h58967 or
	  final_st_val__h58956 or final_st_val__h58961)
  begin
    case (mav_request_pa_req[74:70])
      5'b0: _theResult_____2__h58772 = final_st_val__h58866;
      5'b00001: _theResult_____2__h58772 = w2__h58767;
      5'b00100: _theResult_____2__h58772 = final_st_val__h58944;
      5'b01000: _theResult_____2__h58772 = final_st_val__h58952;
      5'b01100: _theResult_____2__h58772 = final_st_val__h58948;
      5'b10000: _theResult_____2__h58772 = final_st_val__h58967;
      5'b11000: _theResult_____2__h58772 = final_st_val__h58956;
      5'b11100: _theResult_____2__h58772 = final_st_val__h58961;
      default: _theResult_____2__h58772 = final_st_val__h58972;
    endcase
  end
  always@(mav_request_pa_pa or old_cword__h53973 or new_st_val__h58609)
  begin
    case (mav_request_pa_pa[2:0])
      3'h0:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1076 =
	      { old_cword__h53973[63:16], new_st_val__h58609[15:0] };
      3'h2:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1076 =
	      { old_cword__h53973[63:32],
		new_st_val__h58609[15:0],
		old_cword__h53973[15:0] };
      3'h4:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1076 =
	      { old_cword__h53973[63:48],
		new_st_val__h58609[15:0],
		old_cword__h53973[31:0] };
      3'h6:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1076 =
	      { new_st_val__h58609[15:0], old_cword__h53973[47:0] };
      default: IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1076 =
		   old_cword__h53973;
    endcase
  end
  always@(mav_request_pa_pa or old_cword__h53973 or new_st_val__h58609)
  begin
    case (mav_request_pa_pa[2:0])
      3'h0:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1067 =
	      { old_cword__h53973[63:8], new_st_val__h58609[7:0] };
      3'h1:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1067 =
	      { old_cword__h53973[63:16],
		new_st_val__h58609[7:0],
		old_cword__h53973[7:0] };
      3'h2:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1067 =
	      { old_cword__h53973[63:24],
		new_st_val__h58609[7:0],
		old_cword__h53973[15:0] };
      3'h3:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1067 =
	      { old_cword__h53973[63:32],
		new_st_val__h58609[7:0],
		old_cword__h53973[23:0] };
      3'h4:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1067 =
	      { old_cword__h53973[63:40],
		new_st_val__h58609[7:0],
		old_cword__h53973[31:0] };
      3'h5:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1067 =
	      { old_cword__h53973[63:48],
		new_st_val__h58609[7:0],
		old_cword__h53973[39:0] };
      3'h6:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1067 =
	      { old_cword__h53973[63:56],
		new_st_val__h58609[7:0],
		old_cword__h53973[47:0] };
      3'h7:
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1067 =
	      { new_st_val__h58609[7:0], old_cword__h53973[55:0] };
    endcase
  end
  always@(mav_request_pa_pa or old_cword__h53973 or new_st_val__h58609)
  begin
    case (mav_request_pa_pa[2:0])
      3'h0:
	  CASE_mav_request_pa_pa_BITS_2_TO_0_0x0_old_cwo_ETC__q6 =
	      { old_cword__h53973[63:32], new_st_val__h58609[31:0] };
      3'h4:
	  CASE_mav_request_pa_pa_BITS_2_TO_0_0x0_old_cwo_ETC__q6 =
	      { new_st_val__h58609[31:0], old_cword__h53973[31:0] };
      default: CASE_mav_request_pa_pa_BITS_2_TO_0_0x0_old_cwo_ETC__q6 =
		   old_cword__h53973;
    endcase
  end
  always@(mav_request_pa_req or
	  old_cword__h53973 or
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1067 or
	  IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1076 or
	  CASE_mav_request_pa_pa_BITS_2_TO_0_0x0_old_cwo_ETC__q6 or
	  new_st_val__h58609)
  begin
    case (mav_request_pa_req[205:203])
      3'b0:
	  n__h59583 =
	      IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1067;
      3'b001:
	  n__h59583 =
	      IF_mav_request_pa_pa_BITS_2_TO_0_50_EQ_0x0_51__ETC___d1076;
      3'b010:
	  n__h59583 = CASE_mav_request_pa_pa_BITS_2_TO_0_0x0_old_cwo_ETC__q6;
      3'b011: n__h59583 = new_st_val__h58609;
      default: n__h59583 = old_cword__h53973;
    endcase
  end
  always@(ram_cset_meta$DOA or
	  ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788)
  begin
    case (ram_cset_meta$DOA[107:106] != 2'd0 &&
	  ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788)
      1'd0:
	  CASE_NOT_ram_cset_metaDOA_BITS_107_TO_106_EQ__ETC__q7 =
	      ram_cset_meta$DOA[51:0];
      1'd1:
	  CASE_NOT_ram_cset_metaDOA_BITS_107_TO_106_EQ__ETC__q7 =
	      ram_cset_meta$DOA[105:54];
    endcase
  end
  always@(rg_way_in_cset or ram_cset_cword$DOA)
  begin
    case (rg_way_in_cset)
      1'd0:
	  SEL_ARR_ram_cset_cword_a_read_BITS_63_TO_0_0_r_ETC___d14 =
	      ram_cset_cword$DOA[63:0];
      1'd1:
	  SEL_ARR_ram_cset_cword_a_read_BITS_63_TO_0_0_r_ETC___d14 =
	      ram_cset_cword$DOA[127:64];
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        rg_cset_in_cache <= `BSV_ASSIGNMENT_DELAY 6'd0;
	rg_fsm_state <= `BSV_ASSIGNMENT_DELAY 4'd0;
	rg_lrsc_valid <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_victim_way <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (rg_cset_in_cache$EN)
	  rg_cset_in_cache <= `BSV_ASSIGNMENT_DELAY rg_cset_in_cache$D_IN;
	if (rg_fsm_state$EN)
	  rg_fsm_state <= `BSV_ASSIGNMENT_DELAY rg_fsm_state$D_IN;
	if (rg_lrsc_valid$EN)
	  rg_lrsc_valid <= `BSV_ASSIGNMENT_DELAY rg_lrsc_valid$D_IN;
	if (rg_victim_way$EN)
	  rg_victim_way <= `BSV_ASSIGNMENT_DELAY rg_victim_way$D_IN;
      end
    if (rg_amo_funct7$EN)
      rg_amo_funct7 <= `BSV_ASSIGNMENT_DELAY rg_amo_funct7$D_IN;
    if (rg_cache_op$EN) rg_cache_op <= `BSV_ASSIGNMENT_DELAY rg_cache_op$D_IN;
    if (rg_cword_in_cline$EN)
      rg_cword_in_cline <= `BSV_ASSIGNMENT_DELAY rg_cword_in_cline$D_IN;
    if (rg_error_during_refill$EN)
      rg_error_during_refill <= `BSV_ASSIGNMENT_DELAY
	  rg_error_during_refill$D_IN;
    if (rg_f3$EN) rg_f3 <= `BSV_ASSIGNMENT_DELAY rg_f3$D_IN;
    if (rg_lrsc_pa$EN) rg_lrsc_pa <= `BSV_ASSIGNMENT_DELAY rg_lrsc_pa$D_IN;
    if (rg_lrsc_size$EN)
      rg_lrsc_size <= `BSV_ASSIGNMENT_DELAY rg_lrsc_size$D_IN;
    if (rg_new_cset_meta$EN)
      rg_new_cset_meta <= `BSV_ASSIGNMENT_DELAY rg_new_cset_meta$D_IN;
    if (rg_new_meta_state$EN)
      rg_new_meta_state <= `BSV_ASSIGNMENT_DELAY rg_new_meta_state$D_IN;
    if (rg_pa$EN) rg_pa <= `BSV_ASSIGNMENT_DELAY rg_pa$D_IN;
    if (rg_post_wb_fsm_state$EN)
      rg_post_wb_fsm_state <= `BSV_ASSIGNMENT_DELAY rg_post_wb_fsm_state$D_IN;
    if (rg_post_wb_meta_state$EN)
      rg_post_wb_meta_state <= `BSV_ASSIGNMENT_DELAY
	  rg_post_wb_meta_state$D_IN;
    if (rg_read_cline_buf$EN)
      rg_read_cline_buf <= `BSV_ASSIGNMENT_DELAY rg_read_cline_buf$D_IN;
    if (rg_save_cset_in_cache$EN)
      rg_save_cset_in_cache <= `BSV_ASSIGNMENT_DELAY
	  rg_save_cset_in_cache$D_IN;
    if (rg_save_cword_in_cline$EN)
      rg_save_cword_in_cline <= `BSV_ASSIGNMENT_DELAY
	  rg_save_cword_in_cline$D_IN;
    if (rg_save_fsm_state$EN)
      rg_save_fsm_state <= `BSV_ASSIGNMENT_DELAY rg_save_fsm_state$D_IN;
    if (rg_save_pa$EN) rg_save_pa <= `BSV_ASSIGNMENT_DELAY rg_save_pa$D_IN;
    if (rg_save_va$EN) rg_save_va <= `BSV_ASSIGNMENT_DELAY rg_save_va$D_IN;
    if (rg_save_way_in_cset$EN)
      rg_save_way_in_cset <= `BSV_ASSIGNMENT_DELAY rg_save_way_in_cset$D_IN;
    if (rg_va$EN) rg_va <= `BSV_ASSIGNMENT_DELAY rg_va$D_IN;
    if (rg_way_in_cset$EN)
      rg_way_in_cset <= `BSV_ASSIGNMENT_DELAY rg_way_in_cset$D_IN;
    if (rg_write_cline_buf$EN)
      rg_write_cline_buf <= `BSV_ASSIGNMENT_DELAY rg_write_cline_buf$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_amo_funct7 = 7'h2A;
    rg_cache_op = 2'h2;
    rg_cset_in_cache = 6'h2A;
    rg_cword_in_cline = 3'h2;
    rg_error_during_refill = 1'h0;
    rg_f3 = 3'h2;
    rg_fsm_state = 4'hA;
    rg_lrsc_pa = 64'hAAAAAAAAAAAAAAAA;
    rg_lrsc_size = 2'h2;
    rg_lrsc_valid = 1'h0;
    rg_new_cset_meta = 108'hAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    rg_new_meta_state = 2'h2;
    rg_pa = 64'hAAAAAAAAAAAAAAAA;
    rg_post_wb_fsm_state = 4'hA;
    rg_post_wb_meta_state = 2'h2;
    rg_read_cline_buf =
	512'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    rg_save_cset_in_cache = 6'h2A;
    rg_save_cword_in_cline = 3'h2;
    rg_save_fsm_state = 4'hA;
    rg_save_pa = 64'hAAAAAAAAAAAAAAAA;
    rg_save_va = 64'hAAAAAAAAAAAAAAAA;
    rg_save_way_in_cset = 1'h0;
    rg_va = 64'hAAAAAAAAAAAAAAAA;
    rg_victim_way = 1'h0;
    rg_way_in_cset = 1'h0;
    rg_write_cline_buf =
	512'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0)
	begin
	  v__h38795 = $stime;
	  #0;
	end
    v__h38789 = v__h38795 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0)
	$display("%0d: %m.mav_request_pa: pa %0h",
		 v__h38789,
		 mav_request_pa_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0) $write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2)
	$write("MMU_Cache_Req{");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] != 2'd2)
	$write("MMU_Cache_Req{");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd0)
	$write("CACHE_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd1)
	$write("CACHE_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] != 2'd2 &&
	  mav_request_pa_req[207:206] != 2'd0 &&
	  mav_request_pa_req[207:206] != 2'd1)
	$write("CACHE_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] != 2'd2)
	$write(" f3 %3b", mav_request_pa_req[205:203]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2)
	$write("CACHE_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] != 2'd2)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2)
	$write(" f3 %3b", mav_request_pa_req[205:203]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] != 2'd2)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] != 2'd2)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2 &&
	  mav_request_pa_req[74:70] == 5'b00010)
	$write("LR");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2 &&
	  mav_request_pa_req[74:70] == 5'b00011)
	$write("SC");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2 &&
	  mav_request_pa_req[74:70] == 5'b0)
	$write("ADD");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2 &&
	  mav_request_pa_req[74:70] == 5'b00001)
	$write("SWAP");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2 &&
	  mav_request_pa_req[74:70] == 5'b00100)
	$write("XOR");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2 &&
	  mav_request_pa_req[74:70] == 5'b01100)
	$write("AND");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2 &&
	  mav_request_pa_req[74:70] == 5'b01000)
	$write("OR");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2 &&
	  mav_request_pa_req[74:70] == 5'b10000)
	$write("MIN");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2 &&
	  mav_request_pa_req[74:70] == 5'b10100)
	$write("MAX");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2 &&
	  mav_request_pa_req[74:70] == 5'b11000)
	$write("MINU");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2 &&
	  mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  mav_request_pa_req[74:70] != 5'b0 &&
	  mav_request_pa_req[74:70] != 5'b00001 &&
	  mav_request_pa_req[74:70] != 5'b00100 &&
	  mav_request_pa_req[74:70] != 5'b01100 &&
	  mav_request_pa_req[74:70] != 5'b01000 &&
	  mav_request_pa_req[74:70] != 5'b10000 &&
	  mav_request_pa_req[74:70] != 5'b10100 &&
	  mav_request_pa_req[74:70] != 5'b11000)
	$write("MAXU");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] != 2'd2)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] == 2'd2)
	$write(" aqrl %2b", mav_request_pa_req[69:68]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  mav_request_pa_req[207:206] != 2'd2)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0)
	$write(" va %0h", mav_request_pa_req[202:139]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  (mav_request_pa_req[207:206] == 2'd2 &&
	   mav_request_pa_req[74:70] != 5'b00010 ||
	   mav_request_pa_req[207:206] == 2'd1))
	$write(" st_val %0h", mav_request_pa_req[138:75]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  (mav_request_pa_req[207:206] != 2'd2 ||
	   mav_request_pa_req[74:70] == 5'b00010) &&
	  mav_request_pa_req[207:206] != 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0)
	$write(" priv %0d sstatus_SUM %0d mstatus_MXR %0d satp %0h",
	       mav_request_pa_req[67:66],
	       mav_request_pa_req[65],
	       mav_request_pa_req[64],
	       mav_request_pa_req[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0) $write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0) $write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0)
	$write("CSet [%0h] (state, tag)\n", rg_va[11:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0)
	$write("        way %0d: ", $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[53:52] == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[53:52] == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[53:52] == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[53:52] != 2'd0 &&
	  ram_cset_meta$DOA[53:52] != 2'd1 &&
	  ram_cset_meta$DOA[53:52] != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[53:52] == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[53:52] != 2'd0)
	$write(", ctag %0h (= pa %0h)", ram_cset_meta$DOA[51:0], pa__h39327);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0)
	$write("        way %0d: ", $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[107:106] == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[107:106] == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[107:106] == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[107:106] != 2'd0 &&
	  ram_cset_meta$DOA[107:106] != 2'd1 &&
	  ram_cset_meta$DOA[107:106] != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[107:106] == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[107:106] != 2'd0)
	$write(", ctag %0h (= pa %0h)",
	       ram_cset_meta$DOA[105:54],
	       pa__h39306);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0) $write("    valid_info = ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0)
	$write("Valid_Info { ", "num_valids: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0)
	$write("'h%h", valid_info_num_valids__h39525);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0)
	$write(", ", "valid_state: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796 == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796 == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796 == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796 != 2'd1 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d796 != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0) $write(", ", "data: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0)
	$write("'h%h", valid_info_data__h39527);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0) $write(", ", "way: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0)
	$write("'h%h",
	       ram_cset_meta$DOA[107:106] != 2'd0 &&
	       ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788,
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && verbosity != 3'd0) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877)
	$write("    INTERNAL ERROR ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 &&
	  mav_request_pa_req[207:206] == 2'd0)
	$write("CACHE_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 &&
	  mav_request_pa_req[207:206] == 2'd1)
	$write("CACHE_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 &&
	  mav_request_pa_req[207:206] != 2'd0 &&
	  mav_request_pa_req[207:206] != 2'd1)
	$write("CACHE_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877)
	$write(" va %0h pa %0h",
	       mav_request_pa_req[202:139],
	       mav_request_pa_pa,
	       "\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877)
	$display("    # of valids in set: %0d    (should be 0 or 1)",
		 valid_info_num_valids__h39525);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877)
	$write("CSet [%0h] (state, tag)\n", rg_va[11:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877)
	$write("        way %0d: ", $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 &&
	  ram_cset_meta$DOA[53:52] == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 &&
	  ram_cset_meta$DOA[53:52] == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 &&
	  ram_cset_meta$DOA[53:52] == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 &&
	  ram_cset_meta$DOA[53:52] != 2'd0 &&
	  ram_cset_meta$DOA[53:52] != 2'd1 &&
	  ram_cset_meta$DOA[53:52] != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 &&
	  ram_cset_meta$DOA[53:52] == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 &&
	  ram_cset_meta$DOA[53:52] != 2'd0)
	$write(", ctag %0h (= pa %0h)", ram_cset_meta$DOA[51:0], pa__h39327);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877)
	$write("        way %0d: ", $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 &&
	  ram_cset_meta$DOA[107:106] == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 &&
	  ram_cset_meta$DOA[107:106] == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 &&
	  ram_cset_meta$DOA[107:106] == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 &&
	  ram_cset_meta$DOA[107:106] != 2'd0 &&
	  ram_cset_meta$DOA[107:106] != 2'd1 &&
	  ram_cset_meta$DOA[107:106] != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 &&
	  ram_cset_meta$DOA[107:106] == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877 &&
	  ram_cset_meta$DOA[107:106] != 2'd0)
	$write(", ctag %0h (= pa %0h)",
	       ram_cset_meta$DOA[105:54],
	       pa__h39306);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d877)
	$finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && valid_info_num_valids__h39525 == 2'd1 &&
	  mav_request_pa_req[207:206] == 2'd0 &&
	  verbosity != 3'd0)
	$display("    LOAD-HIT: va %0h pa %0h data %0h",
		 mav_request_pa_req[202:139],
		 mav_request_pa_pa,
		 data__h52435);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115)
	$display("    STORE-HIT: va %0h pa %0h data %0h",
		 mav_request_pa_req[202:139],
		 mav_request_pa_pa,
		 mav_request_pa_req[138:75]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1116)
	begin
	  v__h53647 = $stime;
	  #0;
	end
    v__h53641 = v__h53647 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1116)
	$display("%0d: %m.fa_write: INTERNAL ERROR", v__h53641);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1116)
	$display("    va_cset_cword_in_cache %0h way %0d pa %0h f3 %0d st_value %0h",
		 rg_va[11:3],
		 ram_cset_meta$DOA[107:106] != 2'd0 &&
		 ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788,
		 mav_request_pa_pa,
		 mav_request_pa_req[205:203],
		 mav_request_pa_req[138:75]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1116)
	$display("    Cache write on a miss (need EXCLUSIVE)");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1116)
	$finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115)
	$display("      cache.fa_write: va_cset_cword_in_cache %0h way %0d pa %0h f3 %0d st_value %0h",
		 rg_va[11:3],
		 ram_cset_meta$DOA[107:106] != 2'd0 &&
		 ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788,
		 mav_request_pa_pa,
		 mav_request_pa_req[205:203],
		 mav_request_pa_req[138:75]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115)
	$write("      from: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115)
	$write("CSet_Cword {", "%0h", ram_cset_cword$DOA[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115)
	$write(", ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115)
	$write("%0h", ram_cset_cword$DOA[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115)
	$write("      to:   ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115)
	$write("CSet_Cword {",
	       "%0h",
	       IF_ram_cset_meta_a_read__8_BITS_107_TO_106_12__ETC___d1015);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115)
	$write(", ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115)
	$write("%0h",
	       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1012);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1115)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && valid_info_num_valids__h39525 == 2'd1 &&
	  mav_request_pa_req[207:206] == 2'd2 &&
	  mav_request_pa_req[74:70] == 5'b00010 &&
	  verbosity != 3'd0)
	$display("    LR-HIT: va %0h pa %0h data %0h",
		 mav_request_pa_req[202:139],
		 mav_request_pa_pa,
		 data__h52435);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121)
	$display("    SC-HIT and success: va %0h pa %0h data %0h",
		 mav_request_pa_req[202:139],
		 mav_request_pa_pa,
		 mav_request_pa_req[138:75]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1123)
	begin
	  v__h56308 = $stime;
	  #0;
	end
    v__h56302 = v__h56308 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1123)
	$display("%0d: %m.fa_write: INTERNAL ERROR", v__h56302);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1123)
	$display("    va_cset_cword_in_cache %0h way %0d pa %0h f3 %0d st_value %0h",
		 rg_va[11:3],
		 ram_cset_meta$DOA[107:106] != 2'd0 &&
		 ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788,
		 mav_request_pa_pa,
		 mav_request_pa_req[205:203],
		 mav_request_pa_req[138:75]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1123)
	$display("    Cache write on a miss (need EXCLUSIVE)");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1123)
	$finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121)
	$display("      cache.fa_write: va_cset_cword_in_cache %0h way %0d pa %0h f3 %0d st_value %0h",
		 rg_va[11:3],
		 ram_cset_meta$DOA[107:106] != 2'd0 &&
		 ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788,
		 mav_request_pa_pa,
		 mav_request_pa_req[205:203],
		 mav_request_pa_req[138:75]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121)
	$write("      from: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121)
	$write("CSet_Cword {", "%0h", ram_cset_cword$DOA[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121)
	$write(", ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121)
	$write("%0h", ram_cset_cword$DOA[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121)
	$write("      to:   ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121)
	$write("CSet_Cword {",
	       "%0h",
	       IF_ram_cset_meta_a_read__8_BITS_107_TO_106_12__ETC___d1015);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121)
	$write(", ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121)
	$write("%0h",
	       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1012);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1121)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d933 &&
	  (!rg_lrsc_valid || !rg_lrsc_pa_35_EQ_mav_request_pa_pa___d936) &&
	  verbosity != 3'd0)
	$display("    SC-HIT and fail: va %0h pa %0h data %0h",
		 mav_request_pa_req[202:139],
		 mav_request_pa_pa,
		 mav_request_pa_req[138:75]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$display("    AMO-HIT: va %0h pa %0h data %0h",
		 mav_request_pa_req[202:139],
		 mav_request_pa_pa,
		 mav_request_pa_req[138:75]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write("    f3 %3b AMO ", mav_request_pa_req[205:203]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1135)
	$write("ADD");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1137)
	$write("SWAP");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1139)
	$write("XOR");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1141)
	$write("AND");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1143)
	$write("OR");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1145)
	$write("MIN");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1147)
	$write("MAX");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1149)
	$write("MINU");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1151)
	$write("MAXU");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$display("    va %0h  pa %0h  st_value %0h",
		 mav_request_pa_req[202:139],
		 mav_request_pa_pa,
		 mav_request_pa_req[138:75]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$display("    Cache cword %0h, load-result %0h",
		 valid_info_data__h39527,
		 valid_info_data__h39527);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1135)
	$write("ADD");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1137)
	$write("SWAP");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1139)
	$write("XOR");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1141)
	$write("AND");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1143)
	$write("OR");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1145)
	$write("MIN");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1147)
	$write("MAX");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1149)
	$write("MINU");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1151)
	$write("MAXU");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write(" (%0h, %0h) -> %0h",
	       data__h52434,
	       mav_request_pa_req[138:75],
	       new_st_val__h58609,
	       "\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1152)
	begin
	  v__h59267 = $stime;
	  #0;
	end
    v__h59261 = v__h59267 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1152)
	$display("%0d: %m.fa_write: INTERNAL ERROR", v__h59261);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1152)
	$display("    va_cset_cword_in_cache %0h way %0d pa %0h f3 %0d st_value %0h",
		 rg_va[11:3],
		 ram_cset_meta$DOA[107:106] != 2'd0 &&
		 ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788,
		 mav_request_pa_pa,
		 mav_request_pa_req[205:203],
		 new_st_val__h58609);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1152)
	$display("    Cache write on a miss (need EXCLUSIVE)");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1152)
	$finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$display("      cache.fa_write: va_cset_cword_in_cache %0h way %0d pa %0h f3 %0d st_value %0h",
		 rg_va[11:3],
		 ram_cset_meta$DOA[107:106] != 2'd0 &&
		 ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_ma_ETC___d788,
		 mav_request_pa_pa,
		 mav_request_pa_req[205:203],
		 new_st_val__h58609);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write("      from: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write("CSet_Cword {", "%0h", ram_cset_cword$DOA[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write(", ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write("%0h", ram_cset_cword$DOA[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write("      to:   ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write("CSet_Cword {",
	       "%0h",
	       IF_ram_cset_meta_a_read__8_BITS_107_TO_106_12__ETC___d1087);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write(", ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write("%0h",
	       IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1086);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[74:70] != 5'b00010 &&
	  mav_request_pa_req[74:70] != 5'b00011 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d1131)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[207:206] != 2'd0 &&
	  NOT_mav_request_pa_req_BITS_207_TO_206_04_EQ_1_ETC___d1180)
	$display("    Store-hit, but need S->E upgrade");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa && mav_request_pa_req[207:206] != 2'd0 &&
	  NOT_mav_request_pa_req_BITS_207_TO_206_04_EQ_1_ETC___d1180)
	$display("    va %0h pa %0h data %0h -> FSM_UPGRADE_REFILL",
		 mav_request_pa_req[202:139],
		 mav_request_pa_pa,
		 mav_request_pa_req[138:75]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_request_pa &&
	  (valid_info_num_valids__h39525 != 2'd1 ||
	   mav_request_pa_req[207:206] != 2'd0) &&
	  (valid_info_num_valids__h39525 != 2'd1 ||
	   mav_request_pa_req[207:206] != 2'd1 ||
	   IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d927) &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d1188)
	$display("    MISS: va %0h pa %0h; -> REPLACE_START",
		 mav_request_pa_req[202:139],
		 mav_request_pa_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_request_va && verbosity != 3'd0)
	begin
	  v__h37713 = $stime;
	  #0;
	end
    v__h37707 = v__h37713 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_request_va && verbosity != 3'd0)
	$display("%0d: %m.ma_request_va: %0h", v__h37707, ma_request_va_va);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_request_va && NOT_verbosity_ULT_2_2___d23 &&
	  dcache_not_icache)
	$write("    dmem");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_request_va && NOT_verbosity_ULT_2_2___d23 &&
	  !dcache_not_icache)
	$write("    imem");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_request_va && NOT_verbosity_ULT_2_2___d23)
	$display(".fa_req_rams_A %0h cset_in_cache %0h, cset_cword_in_cache %0h",
		 ma_request_va_va,
		 ma_request_va_va[11:6],
		 ma_request_va_va[11:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop &&
	  (verbosity != 3'd0 && rg_cword_in_cline == 3'd0 ||
	   NOT_verbosity_ULT_2_2___d23))
	begin
	  v__h2839 = $stime;
	  #0;
	end
    v__h2833 = v__h2839 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop &&
	  (verbosity != 3'd0 && rg_cword_in_cline == 3'd0 ||
	   NOT_verbosity_ULT_2_2___d23))
	$display("%0d: %m.rl_writeback_loop", v__h2833);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop &&
	  (verbosity != 3'd0 && rg_cword_in_cline == 3'd0 ||
	   NOT_verbosity_ULT_2_2___d23))
	$display("    cset %0h way %0h cword %0h data %0h",
		 rg_cset_in_cache,
		 rg_way_in_cset,
		 rg_cword_in_cline,
		 SEL_ARR_ram_cset_cword_a_read_BITS_63_TO_0_0_r_ETC___d14);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop &&
	  (verbosity != 3'd0 && rg_cword_in_cline == 3'd0 ||
	   NOT_verbosity_ULT_2_2___d23))
	$write("    cset_cword: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop &&
	  (verbosity != 3'd0 && rg_cword_in_cline == 3'd0 ||
	   NOT_verbosity_ULT_2_2___d23))
	$write("<V ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop &&
	  (verbosity != 3'd0 && rg_cword_in_cline == 3'd0 ||
	   NOT_verbosity_ULT_2_2___d23))
	$write("'h%h", ram_cset_cword$DOA[63:0], " ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop &&
	  (verbosity != 3'd0 && rg_cword_in_cline == 3'd0 ||
	   NOT_verbosity_ULT_2_2___d23))
	$write("'h%h", ram_cset_cword$DOA[127:64], " ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop &&
	  (verbosity != 3'd0 && rg_cword_in_cline == 3'd0 ||
	   NOT_verbosity_ULT_2_2___d23))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop &&
	  (verbosity != 3'd0 && rg_cword_in_cline == 3'd0 ||
	   NOT_verbosity_ULT_2_2___d23))
	$write(" >");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop &&
	  (verbosity != 3'd0 && rg_cword_in_cline == 3'd0 ||
	   NOT_verbosity_ULT_2_2___d23))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0)
	begin
	  v__h4336 = $stime;
	  #0;
	end
    v__h4330 = v__h4336 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0)
	$display("%0d: %m.rl_writeback_loop", v__h4330);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0)
	$write("    Done; writeback cline @ %0h", x_addr__h3120, " -> ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0 &&
	  rg_post_wb_fsm_state == 4'd0)
	$write("FSM_INITIALIZE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0 &&
	  rg_post_wb_fsm_state == 4'd1)
	$write("FSM_IDLE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0 &&
	  rg_post_wb_fsm_state == 4'd2)
	$write("FSM_REPLACE_START");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0 &&
	  rg_post_wb_fsm_state == 4'd3)
	$write("FSM_WRITEBACK_LOOP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0 &&
	  rg_post_wb_fsm_state == 4'd4)
	$write("FSM_REFILL_START");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0 &&
	  rg_post_wb_fsm_state == 4'd5)
	$write("FSM_UPGRADE_REFILL");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0 &&
	  rg_post_wb_fsm_state == 4'd6)
	$write("FSM_REFILL_FINAL_DELAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0 &&
	  rg_post_wb_fsm_state == 4'd7)
	$write("FSM_DOWNGRADE_B");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0 &&
	  rg_post_wb_fsm_state == 4'd8)
	$write("FSM_DOWNGRADE_C");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0 &&
	  rg_post_wb_fsm_state == 4'd9)
	$write("FSM_FLUSH_LOOP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop &&
	  rg_cword_in_cline_EQ_7_AND_NOT_verbosity_EQ_0__ETC___d92)
	$write("FSM_FLUSH_LOOP_WRITEBACK_SEQUEL");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd0),
		 rg_write_cline_buf[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd1),
		 rg_write_cline_buf[191:128]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd2),
		 rg_write_cline_buf[255:192]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd3),
		 rg_write_cline_buf[319:256]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd4),
		 rg_write_cline_buf[383:320]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd5),
		 rg_write_cline_buf[447:384]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd6),
		 rg_write_cline_buf[511:448]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline == 3'd7 &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd7),
		 SEL_ARR_ram_cset_cword_a_read_BITS_63_TO_0_0_r_ETC___d14);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_writeback_loop && rg_cword_in_cline != 3'd7 &&
	  NOT_verbosity_ULT_2_2___d23)
	$display("    Requested cword_in_cline %0d", cword_in_cline__h3093);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_replace && verbosity != 3'd0)
	begin
	  v__h4907 = $stime;
	  #0;
	end
    v__h4901 = v__h4907 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_replace && verbosity != 3'd0)
	$display("%0d: %m.rl_replace", v__h4901);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_replace && verbosity != 3'd0)
	$display("    cset %0h way %0h", rg_va[11:6], victim_way__h4955);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_replace &&
	  SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 == 2'd3 &&
	  verbosity != 3'd0)
	$display("    Victim cline pa %0h: MODIFIED: evict->INVALID (writeback)",
		 victim_cline_pa__h5091);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_replace &&
	  SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 == 2'd3 &&
	  verbosity != 3'd0)
	$display("    writeback loop prequel, then -> WRITEBACK_LOOP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_replace &&
	  SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 == 2'd3 &&
	  verbosity != 3'd0)
	$display("    fa_cache_writeback_loop_prequel @ %0h (cset %0h, way %0h)",
		 victim_cline_pa__h5091,
		 rg_va[11:6],
		 victim_way__h4955);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_replace &&
	  SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 == 2'd0 &&
	  verbosity != 3'd0)
	$display("    Victim cline: INVALID; no eviction/notification; -> REFILL_START");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_replace &&
	  SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 != 2'd3 &&
	  SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 != 2'd0 &&
	  verbosity != 3'd0)
	$write("    Victim cline pa %0h: ", victim_cline_pa__h5091);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_replace && verbosity != 3'd0 &&
	  SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_replace && verbosity != 3'd0 &&
	  SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_replace &&
	  SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 != 2'd3 &&
	  SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 != 2'd0 &&
	  verbosity != 3'd0)
	$display(": evict->INVALID (no writeback, notify downgrade to L2)");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_replace &&
	  SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 != 2'd3 &&
	  SEL_ARR_ram_cset_meta_a_read__8_BITS_53_TO_52__ETC___d125 != 2'd0 &&
	  verbosity != 3'd0)
	$display("    -> REFILL_START");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && verbosity != 3'd0)
	begin
	  v__h6267 = $stime;
	  #0;
	end
    v__h6261 = v__h6267 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && verbosity != 3'd0)
	$display("%0d: %m.rl_refill_start @ %0h (cset %0h way %0h)",
		 v__h6261,
		 rg_pa,
		 rg_cset_in_cache,
		 rg_way_in_cset);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && NOT_verbosity_ULT_2_2___d23)
	$display("    Requesting cline: ram_cset_cword.a: cword-in-cache: 0x%0h",
		 cset_cword_in_cache__h35238);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && NOT_verbosity_ULT_2_2___d23)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && NOT_verbosity_ULT_2_2___d23)
	$write("L1_to_L2_Req { ", "addr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && NOT_verbosity_ULT_2_2___d23)
	$write("'h%h", l1_to_l2_req_addr__h6583);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && NOT_verbosity_ULT_2_2___d23)
	$write(", ", "from_state: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && NOT_verbosity_ULT_2_2___d23)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && NOT_verbosity_ULT_2_2___d23)
	$write(", ", "to_state: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && NOT_verbosity_ULT_2_2___d23 &&
	  rg_cache_op != 2'd1 &&
	  (rg_cache_op != 2'd2 || rg_amo_funct7[6:2] == 5'b00010))
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && NOT_verbosity_ULT_2_2___d23 &&
	  (rg_cache_op == 2'd1 ||
	   rg_cache_op == 2'd2 && rg_amo_funct7[6:2] != 5'b00010))
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && NOT_verbosity_ULT_2_2___d23)
	$write(", ", "can_up_to_E: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && NOT_verbosity_ULT_2_2___d23 &&
	  dcache_not_icache)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && NOT_verbosity_ULT_2_2___d23 &&
	  !dcache_not_icache)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && NOT_verbosity_ULT_2_2___d23)
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && NOT_verbosity_ULT_2_2___d23)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_start && NOT_verbosity_ULT_2_2___d23)
	$display("    -> FSM_UPGRADE_REFILL");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop &&
	  (NOT_verbosity_ULT_2_2___d23 ||
	   rg_cword_in_cline == 3'd0 && verbosity != 3'd0))
	begin
	  v__h7296 = $stime;
	  #0;
	end
    v__h7290 = v__h7296 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop &&
	  (NOT_verbosity_ULT_2_2___d23 ||
	   rg_cword_in_cline == 3'd0 && verbosity != 3'd0))
	$display("%0d: %m.rl_refill_loop", v__h7290);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop &&
	  (NOT_verbosity_ULT_2_2___d23 ||
	   rg_cword_in_cline == 3'd0 && verbosity != 3'd0))
	$display("    addr %0h  (cset %0h way %0d word %0d)",
		 rg_pa,
		 rg_cset_in_cache,
		 rg_way_in_cset,
		 rg_cword_in_cline);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 &&
	  verbosity != 3'd0)
	$write("    -> ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 &&
	  verbosity != 3'd0 &&
	  f_L2_to_L1_rsps$D_OUT[514:513] == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 &&
	  verbosity != 3'd0 &&
	  f_L2_to_L1_rsps$D_OUT[514:513] == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 &&
	  verbosity != 3'd0 &&
	  f_L2_to_L1_rsps$D_OUT[514:513] == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 &&
	  verbosity != 3'd0 &&
	  f_L2_to_L1_rsps$D_OUT[514:513] != 2'd0 &&
	  f_L2_to_L1_rsps$D_OUT[514:513] != 2'd1 &&
	  f_L2_to_L1_rsps$D_OUT[514:513] != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 &&
	  verbosity != 3'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 &&
	  f_L2_to_L1_rsps$D_OUT[512] &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd0),
		 f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 &&
	  f_L2_to_L1_rsps$D_OUT[512] &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd1),
		 f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 &&
	  f_L2_to_L1_rsps$D_OUT[512] &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd2),
		 f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[191:128]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 &&
	  f_L2_to_L1_rsps$D_OUT[512] &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd3),
		 f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[255:192]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 &&
	  f_L2_to_L1_rsps$D_OUT[512] &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd4),
		 f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[319:256]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 &&
	  f_L2_to_L1_rsps$D_OUT[512] &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd5),
		 f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[383:320]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 &&
	  f_L2_to_L1_rsps$D_OUT[512] &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd6),
		 f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[447:384]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd0 &&
	  f_L2_to_L1_rsps$D_OUT[512] &&
	  verbosity != 3'd0)
	$display("        [%0d]  %016h",
		 $signed(32'd7),
		 f_L2_to_L1_rspsD_OUT_BITS_511_TO_0__q1[511:448]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop &&
	  (rg_cword_in_cline == 3'd0 && !f_L2_to_L1_rsps$D_OUT[512] ||
	   rg_cword_in_cline == 3'd7) &&
	  verbosity != 3'd0)
	begin
	  v__h10934 = $stime;
	  #0;
	end
    v__h10928 = v__h10934 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop &&
	  (rg_cword_in_cline == 3'd0 && !f_L2_to_L1_rsps$D_OUT[512] ||
	   rg_cword_in_cline == 3'd7) &&
	  verbosity != 3'd0)
	$display("%0d: %m.rl_refill_loop: done", v__h10928);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd7 &&
	  rg_va[5:3] != 3'd7 &&
	  NOT_verbosity_ULT_2_2___d23 &&
	  dcache_not_icache)
	$write("    dmem");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd7 &&
	  rg_va[5:3] != 3'd7 &&
	  NOT_verbosity_ULT_2_2___d23 &&
	  !dcache_not_icache)
	$write("    imem");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop && rg_cword_in_cline == 3'd7 &&
	  rg_va[5:3] != 3'd7 &&
	  NOT_verbosity_ULT_2_2___d23)
	$display(".fa_req_rams_A %0h cset_in_cache %0h, cset_cword_in_cache %0h",
		 rg_va,
		 rg_va[11:6],
		 rg_va[11:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop &&
	  (rg_cword_in_cline != 3'd0 || f_L2_to_L1_rsps$D_OUT[512]) &&
	  rg_cword_in_cline != 3'd7 &&
	  NOT_verbosity_ULT_2_2___d23)
	$display("    Requesting ram_cset_cword.a cword-in-cache: 0x%0h",
		 next_cset_cword_in_cache__h10894);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop_final && verbosity != 3'd0)
	begin
	  v__h12375 = $stime;
	  #0;
	end
    v__h12369 = v__h12375 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop_final && verbosity != 3'd0)
	$display("%0d: %m.rl_refill_loop_final; re-request RAM", v__h12369);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop_final && NOT_verbosity_ULT_2_2___d23 &&
	  dcache_not_icache)
	$write("    dmem");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop_final && NOT_verbosity_ULT_2_2___d23 &&
	  !dcache_not_icache)
	$write("    imem");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_refill_loop_final && NOT_verbosity_ULT_2_2___d23)
	$display(".fa_req_rams_A %0h cset_in_cache %0h, cset_cword_in_cache %0h",
		 rg_va,
		 rg_va[11:6],
		 rg_va[11:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_start && verbosity != 3'd0)
	begin
	  v__h13621 = $stime;
	  #0;
	end
    v__h13615 = v__h13621 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_start && verbosity != 3'd0)
	$display("%0d: %m.rl_flush_start", v__h13615);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	begin
	  v__h14301 = $stime;
	  #0;
	end
    v__h14295 = v__h14301 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$display("%0d: %m.rl_flush_loop", v__h14295);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$write("    @ %0h (cset %0h, way %0d) cline state ",
	       cline_pa__h15519,
	       rg_cset_in_cache,
	       rg_way_in_cset);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 != 2'd0 &&
	  SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 != 2'd1 &&
	  SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$display("    Updating cset_meta:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$write("    Old: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$write("CSet [%0h] (state, tag)\n", rg_cset_in_cache);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$write("        way %0d: ", $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d305 == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d305 == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d305 == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d305 != 2'd0 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d305 != 2'd1 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d305 != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d305 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d305 != 2'd0)
	$write(", ctag %0h (= pa %0h)", ctag__h14447, pa__h14935);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$write("        way %0d: ", $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d307 == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d307 == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d307 == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d307 != 2'd0 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d307 != 2'd1 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d307 != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d307 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_cset_meta_03_B_ETC___d307 != 2'd0)
	$write(", ctag %0h (= pa %0h)", ctag__h14452, pa__h14914);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$write("    New: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$write("CSet [%0h] (state, tag)\n", rg_cset_in_cache);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$write("        way %0d: ", $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_IF_rg_way_in_cset_3_T_ETC___d378 == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_IF_rg_way_in_cset_3_T_ETC___d378 == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_IF_rg_way_in_cset_3_T_ETC___d378 == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_IF_rg_way_in_cset_3_T_ETC___d378 != 2'd0 &&
	  IF_rg_way_in_cset_3_THEN_IF_rg_way_in_cset_3_T_ETC___d378 != 2'd1 &&
	  IF_rg_way_in_cset_3_THEN_IF_rg_way_in_cset_3_T_ETC___d378 != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_IF_rg_way_in_cset_3_T_ETC___d378 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_IF_rg_way_in_cset_3_T_ETC___d378 != 2'd0)
	$write(", ctag %0h (= pa %0h)",
	       IF_rg_way_in_cset_3_THEN_IF_rg_way_in_cset_3_T_ETC___d392,
	       pa__h15170);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$write("        way %0d: ", $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_meta_state_11__ETC___d394 == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_meta_state_11__ETC___d394 == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_meta_state_11__ETC___d394 == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_meta_state_11__ETC___d394 != 2'd0 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_meta_state_11__ETC___d394 != 2'd1 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_meta_state_11__ETC___d394 != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_meta_state_11__ETC___d394 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23 &&
	  IF_rg_way_in_cset_3_THEN_rg_new_meta_state_11__ETC___d394 != 2'd0)
	$write(", ctag %0h (= pa %0h)",
	       IF_rg_way_in_cset_3_THEN_SEL_ARR_IF_rg_way_in__ETC___d408,
	       pa__h15146);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop && NOT_verbosity_ULT_2_2___d23)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop &&
	  SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 == 2'd3 &&
	  NOT_verbosity_ULT_2_2___d23)
	$display("    MODIFIED; writeback cline");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop &&
	  SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cset_m_ETC___d309 == 2'd3 &&
	  verbosity != 3'd0)
	$display("    fa_cache_writeback_loop_prequel @ %0h (cset %0h, way %0h)",
		 cline_pa__h15519,
		 rg_cset_in_cache,
		 rg_way_in_cset);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop &&
	  NOT_SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cs_ETC___d426)
	$write("    dmem");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop &&
	  NOT_SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cs_ETC___d428)
	$write("    imem");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop &&
	  NOT_SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cs_ETC___d430)
	$display(".fa_req_rams_A %0h cset_in_cache %0h, cset_cword_in_cache %0h",
		 rg_va,
		 rg_va[11:6],
		 rg_va[11:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop &&
	  NOT_SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cs_ETC___d430)
	begin
	  v__h17257 = $stime;
	  #0;
	end
    v__h17251 = v__h17257 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop &&
	  NOT_SEL_ARR_IF_rg_way_in_cset_3_THEN_rg_new_cs_ETC___d430)
	$display("%0d: %m.rl_flush_loop: done; -> FSM_IDLE", v__h17251);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop_writeback_sequel &&
	  rg_cset_in_cache == 6'd63 &&
	  rg_way_in_cset &&
	  NOT_verbosity_ULT_2_2___d23 &&
	  dcache_not_icache)
	$write("    dmem");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop_writeback_sequel &&
	  rg_cset_in_cache == 6'd63 &&
	  rg_way_in_cset &&
	  NOT_verbosity_ULT_2_2___d23 &&
	  !dcache_not_icache)
	$write("    imem");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop_writeback_sequel &&
	  rg_cset_in_cache == 6'd63 &&
	  rg_way_in_cset &&
	  NOT_verbosity_ULT_2_2___d23)
	$display(".fa_req_rams_A %0h cset_in_cache %0h, cset_cword_in_cache %0h",
		 rg_va,
		 rg_va[11:6],
		 rg_va[11:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop_writeback_sequel &&
	  rg_cset_in_cache == 6'd63 &&
	  rg_way_in_cset &&
	  verbosity != 3'd0)
	begin
	  v__h18985 = $stime;
	  #0;
	end
    v__h18979 = v__h18985 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop_writeback_sequel &&
	  rg_cset_in_cache == 6'd63 &&
	  rg_way_in_cset &&
	  verbosity != 3'd0)
	$display("%0d: %m.rl_flush_writeback_sequel; flush loop done; -> FSM_IDLE",
		 v__h18979);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop_writeback_sequel &&
	  (rg_cset_in_cache != 6'd63 || !rg_way_in_cset) &&
	  verbosity != 3'd0)
	begin
	  v__h19064 = $stime;
	  #0;
	end
    v__h19058 = v__h19064 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_flush_loop_writeback_sequel &&
	  (rg_cset_in_cache != 6'd63 || !rg_way_in_cset) &&
	  verbosity != 3'd0)
	$display("%0d: %m.rl_flush_writeback_sequel; continue", v__h19058);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	begin
	  v__h19319 = $stime;
	  #0;
	end
    v__h19313 = v__h19319 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	$display("%0d: %m.rl_downgrade_req_from_L2_A: save state (push)",
		 v__h19313);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	$write("    rg_save_fsm_state <= ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd0)
	$write("FSM_INITIALIZE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd1)
	$write("FSM_IDLE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd2)
	$write("FSM_REPLACE_START");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd3)
	$write("FSM_WRITEBACK_LOOP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd4)
	$write("FSM_REFILL_START");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd5)
	$write("FSM_UPGRADE_REFILL");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd6)
	$write("FSM_REFILL_FINAL_DELAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd7)
	$write("FSM_DOWNGRADE_B");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd8)
	$write("FSM_DOWNGRADE_C");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd9)
	$write("FSM_FLUSH_LOOP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0 &&
	  rg_save_fsm_state != 4'd0 &&
	  rg_save_fsm_state != 4'd1 &&
	  rg_save_fsm_state != 4'd2 &&
	  rg_save_fsm_state != 4'd3 &&
	  rg_save_fsm_state != 4'd4 &&
	  rg_save_fsm_state != 4'd5 &&
	  rg_save_fsm_state != 4'd6 &&
	  rg_save_fsm_state != 4'd7 &&
	  rg_save_fsm_state != 4'd8 &&
	  rg_save_fsm_state != 4'd9)
	$write("FSM_FLUSH_LOOP_WRITEBACK_SEQUEL");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	$display("    rg_save_va             <= %0h", rg_va);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	$display("    rg_save_pa             <= %0h", rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	$display("    rg_save_cset_in_cache  <= %0h", rg_cset_in_cache);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	$display("    rg_save_cword_in_cline <= %0h", rg_cword_in_cline);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	$display("    rg_save_way_in_cset    <= %0h", rg_way_in_cset);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	$write("    Probe RAMs for: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	$write("L2_to_L1_Req { ", "addr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	$write("'h%h", f_L2_to_L1_reqs$D_OUT[65:2]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	$write(", ", "to_state: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] != 2'd0 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] != 2'd1 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A && verbosity != 3'd0)
	$display("    -> FSM_DOWNGRADE_B");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A &&
	  NOT_verbosity_ULT_2_2___d23 &&
	  dcache_not_icache)
	$write("    dmem");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A &&
	  NOT_verbosity_ULT_2_2___d23 &&
	  !dcache_not_icache)
	$write("    imem");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_A &&
	  NOT_verbosity_ULT_2_2___d23)
	$display(".fa_req_rams_A %0h cset_in_cache %0h, cset_cword_in_cache %0h",
		 f_L2_to_L1_reqs$D_OUT[65:2],
		 f_L2_to_L1_reqs$D_OUT[13:8],
		 f_L2_to_L1_reqs$D_OUT[13:5]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	begin
	  v__h20972 = $stime;
	  #0;
	end
    v__h20966 = v__h20972 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$display("%0d: %m.rl_downgrade_req_from_L2_B", v__h20966);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$write("CSet [%0h] (state, tag)\n", rg_cset_in_cache);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$write("        way %0d: ", $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[53:52] == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[53:52] == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[53:52] == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[53:52] != 2'd0 &&
	  ram_cset_meta$DOA[53:52] != 2'd1 &&
	  ram_cset_meta$DOA[53:52] != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[53:52] == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[53:52] != 2'd0)
	$write(", ctag %0h (= pa %0h)", ram_cset_meta$DOA[51:0], pa__h21126);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$write("        way %0d: ", $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[107:106] == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[107:106] == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[107:106] == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[107:106] != 2'd0 &&
	  ram_cset_meta$DOA[107:106] != 2'd1 &&
	  ram_cset_meta$DOA[107:106] != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[107:106] == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  ram_cset_meta$DOA[107:106] != 2'd0)
	$write(", ctag %0h (= pa %0h)",
	       ram_cset_meta$DOA[105:54],
	       pa__h21105);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$write("    valid_info = ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$write("Valid_Info { ", "num_valids: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$write("'h%h", valid_info_num_valids__h21330);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$write(", ", "valid_state: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 != 2'd1 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$write(", ", "data: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$write("'h%h", valid_info_data__h21332);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$write(", ", "way: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$write("'h%h",
	       ram_cset_meta$DOA[107:106] != 2'd0 &&
	       ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_rg_ETC___d511,
	       " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B && verbosity != 3'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633)
	$display("    INTERNAL ERROR pa %0h", rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633)
	$display("    # of valids in set: %0d    (should be 0 or 1)",
		 valid_info_num_valids__h21330);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633)
	$write("CSet [%0h] (state, tag)\n", rg_cset_in_cache);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633)
	$write("        way %0d: ", $signed(32'd0));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633 &&
	  ram_cset_meta$DOA[53:52] == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633 &&
	  ram_cset_meta$DOA[53:52] == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633 &&
	  ram_cset_meta$DOA[53:52] == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633 &&
	  ram_cset_meta$DOA[53:52] != 2'd0 &&
	  ram_cset_meta$DOA[53:52] != 2'd1 &&
	  ram_cset_meta$DOA[53:52] != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633 &&
	  ram_cset_meta$DOA[53:52] == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633 &&
	  ram_cset_meta$DOA[53:52] != 2'd0)
	$write(", ctag %0h (= pa %0h)", ram_cset_meta$DOA[51:0], pa__h21126);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633)
	$write("        way %0d: ", $signed(32'd1));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633 &&
	  ram_cset_meta$DOA[107:106] == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633 &&
	  ram_cset_meta$DOA[107:106] == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633 &&
	  ram_cset_meta$DOA[107:106] == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633 &&
	  ram_cset_meta$DOA[107:106] != 2'd0 &&
	  ram_cset_meta$DOA[107:106] != 2'd1 &&
	  ram_cset_meta$DOA[107:106] != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633 &&
	  ram_cset_meta$DOA[107:106] == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633 &&
	  ram_cset_meta$DOA[107:106] != 2'd0)
	$write(", ctag %0h (= pa %0h)",
	       ram_cset_meta$DOA[105:54],
	       pa__h21105);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  NOT_IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_ETC___d633)
	$finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 == 2'd0 &&
	  verbosity != 3'd0)
	$display("    MISS (= INVALID already); ignoring; -> FSM_DOWNGRADE_C");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  verbosity != 3'd0)
	$write("    Update meta state to ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  verbosity != 3'd0 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  verbosity != 3'd0 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  verbosity != 3'd0 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  verbosity != 3'd0 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] != 2'd0 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] != 2'd1 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  verbosity != 3'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 == 2'd3 &&
	  verbosity != 3'd0)
	$display("    fa_cache_writeback_loop_prequel @ %0h (cset %0h, way %0h)",
		 cline_pa__h35106,
		 rg_cset_in_cache,
		 ram_cset_meta$DOA[107:106] != 2'd0 &&
		 ram_cset_meta_a_read__8_BITS_105_TO_54_0_EQ_rg_ETC___d511);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 == 2'd3 &&
	  verbosity != 3'd0)
	$display("    -> FSM_WRITEBACK_LOOP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 != 2'd3 &&
	  verbosity != 3'd0)
	$write("    Send ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 != 2'd3 &&
	  verbosity != 3'd0)
	$write("L1_to_L2_Rsp { ", "addr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 != 2'd3 &&
	  verbosity != 3'd0)
	$write("'h%h", rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 != 2'd3 &&
	  verbosity != 3'd0)
	$write(", ", "to_state: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 != 2'd3 &&
	  verbosity != 3'd0 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 != 2'd3 &&
	  verbosity != 3'd0 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 != 2'd3 &&
	  verbosity != 3'd0 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 != 2'd3 &&
	  verbosity != 3'd0 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] != 2'd0 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] != 2'd1 &&
	  f_L2_to_L1_reqs$D_OUT[1:0] != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 != 2'd3 &&
	  verbosity != 3'd0)
	$write(", ", "m_cline: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 != 2'd3 &&
	  verbosity != 3'd0)
	$write("tagged Invalid ", "");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 != 2'd3 &&
	  verbosity != 3'd0)
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_B &&
	  valid_info_num_valids__h21330 != 2'd0 &&
	  IF_NOT_ram_cset_meta_a_read__8_BITS_107_TO_106_ETC___d520 != 2'd3 &&
	  verbosity != 3'd0)
	$write(" -> FSM_DOWNGRADE_C", "\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0)
	begin
	  v__h35844 = $stime;
	  #0;
	end
    v__h35838 = v__h35844 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0)
	$display("%0d: %m.rl_downgrade_req_from_L2_C", v__h35838);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0)
	$display("    writeback done; restore (pop) and reprobe RAMs");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0)
	$write("    rg_fsm_state      <= ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd0)
	$write("FSM_INITIALIZE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd1)
	$write("FSM_IDLE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd2)
	$write("FSM_REPLACE_START");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd3)
	$write("FSM_WRITEBACK_LOOP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd4)
	$write("FSM_REFILL_START");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd5)
	$write("FSM_UPGRADE_REFILL");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd6)
	$write("FSM_REFILL_FINAL_DELAY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd7)
	$write("FSM_DOWNGRADE_B");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd8)
	$write("FSM_DOWNGRADE_C");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0 &&
	  rg_save_fsm_state == 4'd9)
	$write("FSM_FLUSH_LOOP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0 &&
	  rg_save_fsm_state != 4'd0 &&
	  rg_save_fsm_state != 4'd1 &&
	  rg_save_fsm_state != 4'd2 &&
	  rg_save_fsm_state != 4'd3 &&
	  rg_save_fsm_state != 4'd4 &&
	  rg_save_fsm_state != 4'd5 &&
	  rg_save_fsm_state != 4'd6 &&
	  rg_save_fsm_state != 4'd7 &&
	  rg_save_fsm_state != 4'd8 &&
	  rg_save_fsm_state != 4'd9)
	$write("FSM_FLUSH_LOOP_WRITEBACK_SEQUEL");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0)
	$display("    rg_va             <= %0h", rg_save_va);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0)
	$display("    rg_pa             <= %0h", rg_save_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0)
	$display("    rg_cset_in_cache  <= %0h", rg_save_cset_in_cache);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0)
	$display("    rg_cword_in_cline <= %0h", rg_save_cword_in_cline);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_downgrade_req_from_L2_C && verbosity != 3'd0)
	$display("    rg_way_in_cset    <= %0h", rg_save_way_in_cset);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_initialize && rg_cset_in_cache == 6'd63)
	begin
	  v__h37444 = $stime;
	  #0;
	end
    v__h37438 = v__h37444 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_initialize && rg_cset_in_cache == 6'd63)
	$display("%0d: INFO: %m.rl_initialize", v__h37438);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_initialize && rg_cset_in_cache == 6'd63)
	$display("    Size %0d KB, Associativity %0d, CLine size %0d bytes (= %0d XLEN words)",
		 $signed(32'd8),
		 $signed(32'd2),
		 $signed(32'd64),
		 $signed(32'd8));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_initialize && rg_cset_in_cache == 6'd63 &&
	  verbosity != 3'd0)
	begin
	  v__h37562 = $stime;
	  #0;
	end
    v__h37556 = v__h37562 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_initialize && rg_cset_in_cache == 6'd63 &&
	  verbosity != 3'd0)
	$display("    All clines (%0d sets %0d ways) initialized to INVALID",
		 v__h37556,
		 $signed(32'd64),
		 $signed(32'd2));
  end
  // synopsys translate_on
endmodule