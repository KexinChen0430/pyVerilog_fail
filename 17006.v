module outputs
  wire [193 : 0] csr_trap_actions;
  wire [129 : 0] csr_ret_actions;
  wire [128 : 0] mav_csr_write;
  wire [64 : 0] mav_read_csr, read_csr, read_csr_port2;
  wire [63 : 0] csr_mip_read,
		mv_update_mstatus_fs,
		read_csr_mcycle,
		read_csr_minstret,
		read_csr_mtime,
		read_mstatus,
		read_satp,
		read_sstatus,
		read_ustatus;
  wire [27 : 0] read_misa;
  wire [4 : 0] interrupt_pending, mv_update_fcsr_fflags, read_fflags;
  wire [2 : 0] read_frm;
  wire RDY_csr_ret_actions,
       RDY_csr_trap_actions,
       RDY_debug,
       RDY_server_reset_request_put,
       RDY_server_reset_response_get,
       access_permitted_1,
       access_permitted_2,
       csr_counter_read_fault,
       nmi_pending,
       wfi_resume;
  // register cfg_verbosity
  reg [3 : 0] cfg_verbosity;
  wire [3 : 0] cfg_verbosity$D_IN;
  wire cfg_verbosity$EN;
  // register csr_mstatus_rg_mstatus
  reg [63 : 0] csr_mstatus_rg_mstatus;
  reg [63 : 0] csr_mstatus_rg_mstatus$D_IN;
  wire csr_mstatus_rg_mstatus$EN;
  // register rg_dcsr
  reg [31 : 0] rg_dcsr;
  wire [31 : 0] rg_dcsr$D_IN;
  wire rg_dcsr$EN;
  // register rg_dpc
  reg [63 : 0] rg_dpc;
  wire [63 : 0] rg_dpc$D_IN;
  wire rg_dpc$EN;
  // register rg_dscratch0
  reg [63 : 0] rg_dscratch0;
  wire [63 : 0] rg_dscratch0$D_IN;
  wire rg_dscratch0$EN;
  // register rg_dscratch1
  reg [63 : 0] rg_dscratch1;
  wire [63 : 0] rg_dscratch1$D_IN;
  wire rg_dscratch1$EN;
  // register rg_fflags
  reg [4 : 0] rg_fflags;
  reg [4 : 0] rg_fflags$D_IN;
  wire rg_fflags$EN;
  // register rg_frm
  reg [2 : 0] rg_frm;
  wire [2 : 0] rg_frm$D_IN;
  wire rg_frm$EN;
  // register rg_mcause
  reg [4 : 0] rg_mcause;
  reg [4 : 0] rg_mcause$D_IN;
  wire rg_mcause$EN;
  // register rg_mcounteren
  reg [2 : 0] rg_mcounteren;
  wire [2 : 0] rg_mcounteren$D_IN;
  wire rg_mcounteren$EN;
  // register rg_mcycle
  reg [63 : 0] rg_mcycle;
  wire [63 : 0] rg_mcycle$D_IN;
  wire rg_mcycle$EN;
  // register rg_medeleg
  reg [15 : 0] rg_medeleg;
  wire [15 : 0] rg_medeleg$D_IN;
  wire rg_medeleg$EN;
  // register rg_mepc
  reg [63 : 0] rg_mepc;
  wire [63 : 0] rg_mepc$D_IN;
  wire rg_mepc$EN;
  // register rg_mideleg
  reg [11 : 0] rg_mideleg;
  wire [11 : 0] rg_mideleg$D_IN;
  wire rg_mideleg$EN;
  // register rg_minstret
  reg [63 : 0] rg_minstret;
  wire [63 : 0] rg_minstret$D_IN;
  wire rg_minstret$EN;
  // register rg_mscratch
  reg [63 : 0] rg_mscratch;
  wire [63 : 0] rg_mscratch$D_IN;
  wire rg_mscratch$EN;
  // register rg_mtval
  reg [63 : 0] rg_mtval;
  wire [63 : 0] rg_mtval$D_IN;
  wire rg_mtval$EN;
  // register rg_mtvec
  reg [62 : 0] rg_mtvec;
  wire [62 : 0] rg_mtvec$D_IN;
  wire rg_mtvec$EN;
  // register rg_nmi
  reg rg_nmi;
  wire rg_nmi$D_IN, rg_nmi$EN;
  // register rg_nmi_vector
  reg [63 : 0] rg_nmi_vector;
  wire [63 : 0] rg_nmi_vector$D_IN;
  wire rg_nmi_vector$EN;
  // register rg_satp
  reg [63 : 0] rg_satp;
  wire [63 : 0] rg_satp$D_IN;
  wire rg_satp$EN;
  // register rg_scause
  reg [4 : 0] rg_scause;
  reg [4 : 0] rg_scause$D_IN;
  wire rg_scause$EN;
  // register rg_sepc
  reg [63 : 0] rg_sepc;
  wire [63 : 0] rg_sepc$D_IN;
  wire rg_sepc$EN;
  // register rg_sscratch
  reg [63 : 0] rg_sscratch;
  wire [63 : 0] rg_sscratch$D_IN;
  wire rg_sscratch$EN;
  // register rg_state
  reg rg_state;
  wire rg_state$D_IN, rg_state$EN;
  // register rg_stval
  reg [63 : 0] rg_stval;
  wire [63 : 0] rg_stval$D_IN;
  wire rg_stval$EN;
  // register rg_stvec
  reg [62 : 0] rg_stvec;
  wire [62 : 0] rg_stvec$D_IN;
  wire rg_stvec$EN;
  // register rg_tdata1
  reg [63 : 0] rg_tdata1;
  wire [63 : 0] rg_tdata1$D_IN;
  wire rg_tdata1$EN;
  // register rg_tdata2
  reg [63 : 0] rg_tdata2;
  wire [63 : 0] rg_tdata2$D_IN;
  wire rg_tdata2$EN;
  // register rg_tdata3
  reg [63 : 0] rg_tdata3;
  wire [63 : 0] rg_tdata3$D_IN;
  wire rg_tdata3$EN;
  // register rg_tselect
  reg [63 : 0] rg_tselect;
  wire [63 : 0] rg_tselect$D_IN;
  wire rg_tselect$EN;
  // ports of submodule csr_mie
  wire [63 : 0] csr_mie$mav_sie_write,
		csr_mie$mav_sie_write_wordxl,
		csr_mie$mav_write,
		csr_mie$mav_write_wordxl,
		csr_mie$mv_read,
		csr_mie$mv_sie_read;
  wire [27 : 0] csr_mie$mav_sie_write_misa, csr_mie$mav_write_misa;
  wire csr_mie$EN_mav_sie_write, csr_mie$EN_mav_write, csr_mie$EN_reset;
  // ports of submodule csr_mip
  wire [63 : 0] csr_mip$mav_sip_write,
		csr_mip$mav_sip_write_wordxl,
		csr_mip$mav_write,
		csr_mip$mav_write_wordxl,
		csr_mip$mv_read,
		csr_mip$mv_sip_read;
  wire [27 : 0] csr_mip$mav_sip_write_misa, csr_mip$mav_write_misa;
  wire csr_mip$EN_mav_sip_write,
       csr_mip$EN_mav_write,
       csr_mip$EN_reset,
       csr_mip$m_external_interrupt_req_req,
       csr_mip$s_external_interrupt_req_req,
       csr_mip$software_interrupt_req_req,
       csr_mip$timer_interrupt_req_req;
  // ports of submodule f_reset_rsps
  wire f_reset_rsps$CLR,
       f_reset_rsps$DEQ,
       f_reset_rsps$EMPTY_N,
       f_reset_rsps$ENQ,
       f_reset_rsps$FULL_N;
  // ports of submodule soc_map
  wire [63 : 0] soc_map$m_is_IO_addr_addr,
		soc_map$m_is_mem_addr_addr,
		soc_map$m_is_near_mem_IO_addr_addr,
		soc_map$m_mtvec_reset_value,
		soc_map$m_nmivec_reset_value;
  // rule scheduling signals
  wire CAN_FIRE_RL_rl_mcycle_incr,
       CAN_FIRE_RL_rl_reset_start,
       CAN_FIRE_RL_rl_upd_minstret_csrrx,
       CAN_FIRE_RL_rl_upd_minstret_incr,
       CAN_FIRE_csr_minstret_incr,
       CAN_FIRE_csr_ret_actions,
       CAN_FIRE_csr_trap_actions,
       CAN_FIRE_debug,
       CAN_FIRE_m_external_interrupt_req,
       CAN_FIRE_ma_update_fcsr_fflags,
       CAN_FIRE_ma_update_mstatus_fs,
       CAN_FIRE_mav_csr_write,
       CAN_FIRE_mav_read_csr,
       CAN_FIRE_nmi_req,
       CAN_FIRE_s_external_interrupt_req,
       CAN_FIRE_server_reset_request_put,
       CAN_FIRE_server_reset_response_get,
       CAN_FIRE_software_interrupt_req,
       CAN_FIRE_timer_interrupt_req,
       WILL_FIRE_RL_rl_mcycle_incr,
       WILL_FIRE_RL_rl_reset_start,
       WILL_FIRE_RL_rl_upd_minstret_csrrx,
       WILL_FIRE_RL_rl_upd_minstret_incr,
       WILL_FIRE_csr_minstret_incr,
       WILL_FIRE_csr_ret_actions,
       WILL_FIRE_csr_trap_actions,
       WILL_FIRE_debug,
       WILL_FIRE_m_external_interrupt_req,
       WILL_FIRE_ma_update_fcsr_fflags,
       WILL_FIRE_ma_update_mstatus_fs,
       WILL_FIRE_mav_csr_write,
       WILL_FIRE_mav_read_csr,
       WILL_FIRE_nmi_req,
       WILL_FIRE_s_external_interrupt_req,
       WILL_FIRE_server_reset_request_put,
       WILL_FIRE_server_reset_response_get,
       WILL_FIRE_software_interrupt_req,
       WILL_FIRE_timer_interrupt_req;
  // inputs to muxes for submodule ports
  reg [63 : 0] MUX_csr_mstatus_rg_mstatus$write_1__VAL_5;
  wire [63 : 0] MUX_csr_mstatus_rg_mstatus$write_1__VAL_2,
		MUX_csr_mstatus_rg_mstatus$write_1__VAL_4,
		MUX_rg_minstret$write_1__VAL_1,
		MUX_rg_minstret$write_1__VAL_2;
  wire [62 : 0] MUX_rg_mtvec$write_1__VAL_1, MUX_rg_mtvec$write_1__VAL_2;
  wire [15 : 0] MUX_rg_medeleg$write_1__VAL_1;
  wire [4 : 0] MUX_rg_fflags$write_1__VAL_3,
	       MUX_rg_mcause$write_1__VAL_2,
	       MUX_rg_mcause$write_1__VAL_3;
  wire [2 : 0] MUX_rg_frm$write_1__VAL_1;
  wire MUX_csr_mstatus_rg_mstatus$write_1__SEL_5,
       MUX_rg_fflags$write_1__SEL_2,
       MUX_rg_frm$write_1__SEL_1,
       MUX_rg_mcause$write_1__SEL_2,
       MUX_rg_mcause$write_1__SEL_3,
       MUX_rg_mcounteren$write_1__SEL_1,
       MUX_rg_medeleg$write_1__SEL_1,
       MUX_rg_mideleg$write_1__SEL_1,
       MUX_rg_mtvec$write_1__SEL_1,
       MUX_rg_satp$write_1__SEL_1,
       MUX_rg_scause$write_1__SEL_2,
       MUX_rg_scause$write_1__SEL_3,
       MUX_rg_sepc$write_1__SEL_1,
       MUX_rg_state$write_1__SEL_2,
       MUX_rg_stval$write_1__SEL_1,
       MUX_rg_stvec$write_1__SEL_1,
       MUX_rg_tdata1$write_1__SEL_1,
       MUX_rw_minstret$wset_1__SEL_1;
  // remaining internal signals
  reg [63 : 0] IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731,
	       IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291,
	       IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511,
	       y_avValue_fst__h11071;
  reg [61 : 0] CASE_new_priv3604_0b1_rg_stvec_BITS_62_TO_1_0b_ETC__q1;
  reg CASE_new_priv3604_0b1_rg_stvec_BIT_0_0b11_rg_m_ETC__q2,
      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1761,
      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1864;
  wire [63 : 0] IF_IF_csr_trap_actions_nmi_THEN_0b11_ELSE_IF_c_ETC___d1294,
		IF_csr_ret_actions_from_priv_EQ_0b11_476_THEN__ETC___d1496,
		_theResult___fst__h15874,
		_theResult___fst__h16075,
		csr_mstatus_rg_mstatus_03_AND_INV_1_SL_0_CONCA_ETC___d1489,
		csr_mstatus_rg_mstatus_03_AND_INV_1_SL_1_CONCA_ETC___d1286,
		exc_pc___1__h14867,
		exc_pc__h14793,
		mask__h13813,
		mask__h13830,
		mask__h15895,
		mask__h15912,
		mav_csr_write_word_BITS_14_TO_13_68_EQ_0x3_69__ETC___d799,
		new_csr_value__h10690,
		new_csr_value__h9962,
		v__h10003,
		v__h13609,
		v__h7767,
		v__h9124,
		v__h9160,
		v__h9770,
		val__h13814,
		val__h13831,
		val__h15913,
		vector_offset__h14794,
		wordxl1__h7197,
		wordxl1__h9207,
		x__h12581,
		x__h13812,
		x__h13825,
		x__h13842,
		x__h15718,
		x__h15719,
		x__h15894,
		x__h15907,
		x__h15924,
		x__h5601,
		y__h13826,
		y__h13843,
		y__h15908,
		y__h15925,
		y_avValue_fst__h10831,
		y_avValue_fst__h10836,
		y_avValue_fst__h10841,
		y_avValue_fst__h14750,
		y_avValue_fst__h14767,
		y_avValue_snd_snd__h14840;
  wire [22 : 0] fixed_up_val_23__h11439,
		fixed_up_val_23__h11993,
		fixed_up_val_23__h13653,
		fixed_up_val_23__h15781,
		fixed_up_val_23__h7238,
		fixed_up_val_23__h7818,
		fixed_up_val_23__h9248;
  wire [5 : 0] ie_from_x__h15858,
	       ie_to_x__h13730,
	       pie_from_x__h15859,
	       pie_to_x__h13731;
  wire [3 : 0] IF_NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_N_ETC___d1942,
	       IF_NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_N_ETC___d1944,
	       IF_NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_N_ETC___d1945,
	       IF_NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_N_ETC___d1947,
	       exc_code__h15560;
  wire [1 : 0] IF_csr_mstatus_rg_mstatus_03_BITS_12_TO_11_59__ETC___d761,
	       _theResult____h17471,
	       _theResult____h17683,
	       _theResult____h17895,
	       _theResult____h18107,
	       _theResult____h18319,
	       _theResult____h18531,
	       _theResult____h18743,
	       _theResult____h18955,
	       _theResult____h19167,
	       _theResult___fst__h13742,
	       new_priv__h13604,
	       to_y__h16074;
  wire NOT_access_permitted_1_csr_addr_ULT_0xC03_517__ETC___d1617,
       NOT_access_permitted_2_csr_addr_ULT_0xC03_622__ETC___d1720,
       NOT_cfg_verbosity_read__53_ULE_1_54___d955,
       NOT_csr_mip_mv_read__53_BIT_0_831_922_OR_NOT_c_ETC___d1929,
       NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1867,
       NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1894,
       NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1921,
       NOT_csr_mip_mv_read__53_BIT_1_798_895_OR_NOT_c_ETC___d1902,
       NOT_csr_mip_mv_read__53_BIT_3_765_868_OR_NOT_c_ETC___d1875,
       NOT_csr_mip_mv_read__53_BIT_5_809_904_OR_NOT_c_ETC___d1911,
       NOT_csr_mip_mv_read__53_BIT_7_776_877_OR_NOT_c_ETC___d1884,
       NOT_csr_mip_mv_read__53_BIT_8_820_913_OR_NOT_c_ETC___d1920,
       NOT_csr_mip_mv_read__53_BIT_9_787_886_OR_NOT_c_ETC___d1893,
       NOT_csr_trap_actions_nmi_311_AND_csr_trap_acti_ETC___d1421,
       b__h13829,
       b__h15911,
       csr_mip_mv_read__53_BIT_0_831_AND_csr_mie_mv_r_ETC___d1840,
       csr_mip_mv_read__53_BIT_11_747_AND_csr_mie_mv__ETC___d1764,
       csr_mip_mv_read__53_BIT_11_747_AND_csr_mie_mv__ETC___d1830,
       csr_mip_mv_read__53_BIT_1_798_AND_csr_mie_mv_r_ETC___d1807,
       csr_mip_mv_read__53_BIT_3_765_AND_csr_mie_mv_r_ETC___d1774,
       csr_mip_mv_read__53_BIT_4_842_AND_csr_mie_mv_r_ETC___d1851,
       csr_mip_mv_read__53_BIT_5_809_AND_csr_mie_mv_r_ETC___d1818,
       csr_mip_mv_read__53_BIT_7_776_AND_csr_mie_mv_r_ETC___d1785,
       csr_mip_mv_read__53_BIT_8_820_AND_csr_mie_mv_r_ETC___d1829,
       csr_mip_mv_read__53_BIT_9_787_AND_csr_mie_mv_r_ETC___d1796,
       csr_trap_actions_interrupt_AND_NOT_csr_trap_ac_ETC___d1320,
       csr_trap_actions_nmi_OR_NOT_csr_trap_actions_i_ETC___d1472,
       deleg_bit___1__h13751,
       deleg_bit___1__h13766,
       interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1753,
       interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1771,
       interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1782,
       interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1793,
       interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1804,
       interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1815,
       interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1826,
       interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1837,
       interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1752,
       interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1770,
       interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1781,
       interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1792,
       interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1803,
       interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1814,
       interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1825,
       interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1836,
       mav_csr_write_csr_addr_ULE_0x33F___d739,
       mav_csr_write_csr_addr_ULE_0xB1F___d735,
       mav_csr_write_csr_addr_ULT_0x323_38_OR_NOT_mav_ETC___d951,
       mav_csr_write_csr_addr_ULT_0x323___d738,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d1022,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d746,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d755,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d803,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d808,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d810,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d815,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d817,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d821,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d826,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d828,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d830,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d832,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d839,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d842,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d844,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d846,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d848,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d850,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d852,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d854,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d856,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d860,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d862,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d864,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d868,
       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d870,
       mav_csr_write_csr_addr_ULT_0xB03___d734,
       sd__h11438,
       sd__h11992,
       sd__h13652,
       sd__h15780,
       sd__h9247;
  // action method server_reset_request_put
  assign RDY_server_reset_request_put = f_reset_rsps$FULL_N ;
  assign CAN_FIRE_server_reset_request_put = f_reset_rsps$FULL_N ;
  assign WILL_FIRE_server_reset_request_put = EN_server_reset_request_put ;
  // action method server_reset_response_get
  assign RDY_server_reset_response_get = rg_state && f_reset_rsps$EMPTY_N ;
  assign CAN_FIRE_server_reset_response_get =
	     rg_state && f_reset_rsps$EMPTY_N ;
  assign WILL_FIRE_server_reset_response_get = EN_server_reset_response_get ;
  // value method read_csr
  assign read_csr =
	     { read_csr_csr_addr >= 12'hC03 && read_csr_csr_addr <= 12'hC1F ||
	       read_csr_csr_addr >= 12'hB03 && read_csr_csr_addr <= 12'hB1F ||
	       read_csr_csr_addr >= 12'h323 && read_csr_csr_addr <= 12'h33F ||
	       read_csr_csr_addr == 12'h001 ||
	       read_csr_csr_addr == 12'h002 ||
	       read_csr_csr_addr == 12'h003 ||
	       read_csr_csr_addr == 12'hC00 ||
	       read_csr_csr_addr == 12'hC02 ||
	       read_csr_csr_addr == 12'h100 ||
	       read_csr_csr_addr == 12'h102 ||
	       read_csr_csr_addr == 12'h103 ||
	       read_csr_csr_addr == 12'h104 ||
	       read_csr_csr_addr == 12'h105 ||
	       read_csr_csr_addr == 12'h106 ||
	       read_csr_csr_addr == 12'h140 ||
	       read_csr_csr_addr == 12'h141 ||
	       read_csr_csr_addr == 12'h142 ||
	       read_csr_csr_addr == 12'h143 ||
	       read_csr_csr_addr == 12'h144 ||
	       read_csr_csr_addr == 12'h180 ||
	       read_csr_csr_addr == 12'h302 ||
	       read_csr_csr_addr == 12'h303 ||
	       read_csr_csr_addr == 12'hF11 ||
	       read_csr_csr_addr == 12'hF12 ||
	       read_csr_csr_addr == 12'hF13 ||
	       read_csr_csr_addr == 12'hF14 ||
	       read_csr_csr_addr == 12'h300 ||
	       read_csr_csr_addr == 12'h301 ||
	       read_csr_csr_addr == 12'h304 ||
	       read_csr_csr_addr == 12'h305 ||
	       read_csr_csr_addr == 12'h306 ||
	       read_csr_csr_addr == 12'h340 ||
	       read_csr_csr_addr == 12'h341 ||
	       read_csr_csr_addr == 12'h342 ||
	       read_csr_csr_addr == 12'h343 ||
	       read_csr_csr_addr == 12'h344 ||
	       read_csr_csr_addr == 12'hB00 ||
	       read_csr_csr_addr == 12'hB02 ||
	       read_csr_csr_addr == 12'h7A0 ||
	       read_csr_csr_addr == 12'h7A1 ||
	       read_csr_csr_addr == 12'h7A2 ||
	       read_csr_csr_addr == 12'h7A3,
	       (read_csr_csr_addr >= 12'hC03 &&
		read_csr_csr_addr <= 12'hC1F ||
		read_csr_csr_addr >= 12'hB03 &&
		read_csr_csr_addr <= 12'hB1F ||
		read_csr_csr_addr >= 12'h323 &&
		read_csr_csr_addr <= 12'h33F) ?
		 64'd0 :
		 IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 } ;
  // value method read_csr_port2
  assign read_csr_port2 =
	     { read_csr_port2_csr_addr >= 12'hC03 &&
	       read_csr_port2_csr_addr <= 12'hC1F ||
	       read_csr_port2_csr_addr >= 12'hB03 &&
	       read_csr_port2_csr_addr <= 12'hB1F ||
	       read_csr_port2_csr_addr >= 12'h323 &&
	       read_csr_port2_csr_addr <= 12'h33F ||
	       read_csr_port2_csr_addr == 12'h001 ||
	       read_csr_port2_csr_addr == 12'h002 ||
	       read_csr_port2_csr_addr == 12'h003 ||
	       read_csr_port2_csr_addr == 12'hC00 ||
	       read_csr_port2_csr_addr == 12'hC02 ||
	       read_csr_port2_csr_addr == 12'h100 ||
	       read_csr_port2_csr_addr == 12'h102 ||
	       read_csr_port2_csr_addr == 12'h103 ||
	       read_csr_port2_csr_addr == 12'h104 ||
	       read_csr_port2_csr_addr == 12'h105 ||
	       read_csr_port2_csr_addr == 12'h106 ||
	       read_csr_port2_csr_addr == 12'h140 ||
	       read_csr_port2_csr_addr == 12'h141 ||
	       read_csr_port2_csr_addr == 12'h142 ||
	       read_csr_port2_csr_addr == 12'h143 ||
	       read_csr_port2_csr_addr == 12'h144 ||
	       read_csr_port2_csr_addr == 12'h180 ||
	       read_csr_port2_csr_addr == 12'h302 ||
	       read_csr_port2_csr_addr == 12'h303 ||
	       read_csr_port2_csr_addr == 12'hF11 ||
	       read_csr_port2_csr_addr == 12'hF12 ||
	       read_csr_port2_csr_addr == 12'hF13 ||
	       read_csr_port2_csr_addr == 12'hF14 ||
	       read_csr_port2_csr_addr == 12'h300 ||
	       read_csr_port2_csr_addr == 12'h301 ||
	       read_csr_port2_csr_addr == 12'h304 ||
	       read_csr_port2_csr_addr == 12'h305 ||
	       read_csr_port2_csr_addr == 12'h306 ||
	       read_csr_port2_csr_addr == 12'h340 ||
	       read_csr_port2_csr_addr == 12'h341 ||
	       read_csr_port2_csr_addr == 12'h342 ||
	       read_csr_port2_csr_addr == 12'h343 ||
	       read_csr_port2_csr_addr == 12'h344 ||
	       read_csr_port2_csr_addr == 12'hB00 ||
	       read_csr_port2_csr_addr == 12'hB02 ||
	       read_csr_port2_csr_addr == 12'h7A0 ||
	       read_csr_port2_csr_addr == 12'h7A1 ||
	       read_csr_port2_csr_addr == 12'h7A2 ||
	       read_csr_port2_csr_addr == 12'h7A3,
	       (read_csr_port2_csr_addr >= 12'hC03 &&
		read_csr_port2_csr_addr <= 12'hC1F ||
		read_csr_port2_csr_addr >= 12'hB03 &&
		read_csr_port2_csr_addr <= 12'hB1F ||
		read_csr_port2_csr_addr >= 12'h323 &&
		read_csr_port2_csr_addr <= 12'h33F) ?
		 64'd0 :
		 IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 } ;
  // actionvalue method mav_read_csr
  assign mav_read_csr =
	     { mav_read_csr_csr_addr >= 12'hC03 &&
	       mav_read_csr_csr_addr <= 12'hC1F ||
	       mav_read_csr_csr_addr >= 12'hB03 &&
	       mav_read_csr_csr_addr <= 12'hB1F ||
	       mav_read_csr_csr_addr >= 12'h323 &&
	       mav_read_csr_csr_addr <= 12'h33F ||
	       mav_read_csr_csr_addr == 12'h001 ||
	       mav_read_csr_csr_addr == 12'h002 ||
	       mav_read_csr_csr_addr == 12'h003 ||
	       mav_read_csr_csr_addr == 12'hC00 ||
	       mav_read_csr_csr_addr == 12'hC02 ||
	       mav_read_csr_csr_addr == 12'h100 ||
	       mav_read_csr_csr_addr == 12'h102 ||
	       mav_read_csr_csr_addr == 12'h103 ||
	       mav_read_csr_csr_addr == 12'h104 ||
	       mav_read_csr_csr_addr == 12'h105 ||
	       mav_read_csr_csr_addr == 12'h106 ||
	       mav_read_csr_csr_addr == 12'h140 ||
	       mav_read_csr_csr_addr == 12'h141 ||
	       mav_read_csr_csr_addr == 12'h142 ||
	       mav_read_csr_csr_addr == 12'h143 ||
	       mav_read_csr_csr_addr == 12'h144 ||
	       mav_read_csr_csr_addr == 12'h180 ||
	       mav_read_csr_csr_addr == 12'h302 ||
	       mav_read_csr_csr_addr == 12'h303 ||
	       mav_read_csr_csr_addr == 12'hF11 ||
	       mav_read_csr_csr_addr == 12'hF12 ||
	       mav_read_csr_csr_addr == 12'hF13 ||
	       mav_read_csr_csr_addr == 12'hF14 ||
	       mav_read_csr_csr_addr == 12'h300 ||
	       mav_read_csr_csr_addr == 12'h301 ||
	       mav_read_csr_csr_addr == 12'h304 ||
	       mav_read_csr_csr_addr == 12'h305 ||
	       mav_read_csr_csr_addr == 12'h306 ||
	       mav_read_csr_csr_addr == 12'h340 ||
	       mav_read_csr_csr_addr == 12'h341 ||
	       mav_read_csr_csr_addr == 12'h342 ||
	       mav_read_csr_csr_addr == 12'h343 ||
	       mav_read_csr_csr_addr == 12'h344 ||
	       mav_read_csr_csr_addr == 12'hB00 ||
	       mav_read_csr_csr_addr == 12'hB02 ||
	       mav_read_csr_csr_addr == 12'h7A0 ||
	       mav_read_csr_csr_addr == 12'h7A1 ||
	       mav_read_csr_csr_addr == 12'h7A2 ||
	       mav_read_csr_csr_addr == 12'h7A3,
	       (mav_read_csr_csr_addr >= 12'hC03 &&
		mav_read_csr_csr_addr <= 12'hC1F ||
		mav_read_csr_csr_addr >= 12'hB03 &&
		mav_read_csr_csr_addr <= 12'hB1F ||
		mav_read_csr_csr_addr >= 12'h323 &&
		mav_read_csr_csr_addr <= 12'h33F) ?
		 64'd0 :
		 IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 } ;
  assign CAN_FIRE_mav_read_csr = 1'd1 ;
  assign WILL_FIRE_mav_read_csr = EN_mav_read_csr ;
  // actionvalue method mav_csr_write
  assign mav_csr_write =
	     { x__h5601,
	       mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d1022,
	       wordxl1__h7197 } ;
  assign CAN_FIRE_mav_csr_write = 1'd1 ;
  assign WILL_FIRE_mav_csr_write = EN_mav_csr_write ;
  // value method read_frm
  assign read_frm = rg_frm ;
  // value method read_fflags
  assign read_fflags = rg_fflags ;
  // value method mv_update_fcsr_fflags
  assign mv_update_fcsr_fflags = rg_fflags | mv_update_fcsr_fflags_flags ;
  // action method ma_update_fcsr_fflags
  assign CAN_FIRE_ma_update_fcsr_fflags = 1'd1 ;
  assign WILL_FIRE_ma_update_fcsr_fflags = EN_ma_update_fcsr_fflags ;
  // value method mv_update_mstatus_fs
  assign mv_update_mstatus_fs =
	     { sd__h11438, 40'd5120, fixed_up_val_23__h11439 } ;
  // action method ma_update_mstatus_fs
  assign CAN_FIRE_ma_update_mstatus_fs = 1'd1 ;
  assign WILL_FIRE_ma_update_mstatus_fs = EN_ma_update_mstatus_fs ;
  // value method read_misa
  assign read_misa = 28'd135532845 ;
  // value method read_mstatus
  assign read_mstatus = csr_mstatus_rg_mstatus ;
  // value method read_sstatus
  assign read_sstatus =
	     { csr_mstatus_rg_mstatus[63],
	       29'd0,
	       csr_mstatus_rg_mstatus[33:32],
	       12'd0,
	       csr_mstatus_rg_mstatus[19:18],
	       1'd0,
	       csr_mstatus_rg_mstatus[16:13],
	       4'd0,
	       csr_mstatus_rg_mstatus[8],
	       2'd0,
	       csr_mstatus_rg_mstatus[5:4],
	       2'd0,
	       csr_mstatus_rg_mstatus[1:0] } ;
  // value method read_ustatus
  assign read_ustatus =
	     { 59'd0,
	       csr_mstatus_rg_mstatus[4],
	       3'd0,
	       csr_mstatus_rg_mstatus[0] } ;
  // value method read_satp
  assign read_satp = rg_satp ;
  // actionvalue method csr_trap_actions
  assign csr_trap_actions =
	     { x__h12581, x__h15718, x__h15719, new_priv__h13604 } ;
  assign RDY_csr_trap_actions = 1'd1 ;
  assign CAN_FIRE_csr_trap_actions = 1'd1 ;
  assign WILL_FIRE_csr_trap_actions = EN_csr_trap_actions ;
  // actionvalue method csr_ret_actions
  assign csr_ret_actions =
	     (csr_ret_actions_from_priv == 2'b11) ?
	       { rg_mepc,
		 csr_mstatus_rg_mstatus_03_AND_INV_1_SL_0_CONCA_ETC___d1489[12:11],
		 _theResult___fst__h15874 } :
	       { rg_sepc, to_y__h16074, _theResult___fst__h16075 } ;
  assign RDY_csr_ret_actions = 1'd1 ;
  assign CAN_FIRE_csr_ret_actions = 1'd1 ;
  assign WILL_FIRE_csr_ret_actions = EN_csr_ret_actions ;
  // value method read_csr_minstret
  assign read_csr_minstret = rg_minstret ;
  // action method csr_minstret_incr
  assign CAN_FIRE_csr_minstret_incr = 1'd1 ;
  assign WILL_FIRE_csr_minstret_incr = EN_csr_minstret_incr ;
  // value method read_csr_mcycle
  assign read_csr_mcycle = rg_mcycle ;
  // value method read_csr_mtime
  assign read_csr_mtime = rg_mcycle ;
  // value method access_permitted_1
  assign access_permitted_1 =
	     NOT_access_permitted_1_csr_addr_ULT_0xC03_517__ETC___d1617 &&
	     (access_permitted_1_read_not_write ||
	      access_permitted_1_csr_addr[11:10] != 2'b11) ;
  // value method access_permitted_2
  assign access_permitted_2 =
	     NOT_access_permitted_2_csr_addr_ULT_0xC03_622__ETC___d1720 &&
	     (access_permitted_2_read_not_write ||
	      access_permitted_2_csr_addr[11:10] != 2'b11) ;
  // value method csr_counter_read_fault
  assign csr_counter_read_fault =
	     (csr_counter_read_fault_priv == 2'b01 ||
	      csr_counter_read_fault_priv == 2'b0) &&
	     (csr_counter_read_fault_csr_addr == 12'hC00 &&
	      !rg_mcounteren[0] ||
	      csr_counter_read_fault_csr_addr == 12'hC01 &&
	      !rg_mcounteren[1] ||
	      csr_counter_read_fault_csr_addr == 12'hC02 &&
	      !rg_mcounteren[2] ||
	      csr_counter_read_fault_csr_addr >= 12'hC03 &&
	      csr_counter_read_fault_csr_addr <= 12'hC1F) ;
  // value method csr_mip_read
  assign csr_mip_read = csr_mip$mv_read ;
  // action method m_external_interrupt_req
  assign CAN_FIRE_m_external_interrupt_req = 1'd1 ;
  assign WILL_FIRE_m_external_interrupt_req = 1'd1 ;
  // action method s_external_interrupt_req
  assign CAN_FIRE_s_external_interrupt_req = 1'd1 ;
  assign WILL_FIRE_s_external_interrupt_req = 1'd1 ;
  // action method timer_interrupt_req
  assign CAN_FIRE_timer_interrupt_req = 1'd1 ;
  assign WILL_FIRE_timer_interrupt_req = 1'd1 ;
  // action method software_interrupt_req
  assign CAN_FIRE_software_interrupt_req = 1'd1 ;
  assign WILL_FIRE_software_interrupt_req = 1'd1 ;
  // value method interrupt_pending
  assign interrupt_pending =
	     { csr_mip_mv_read__53_BIT_11_747_AND_csr_mie_mv__ETC___d1830 ||
	       csr_mip_mv_read__53_BIT_0_831_AND_csr_mie_mv_r_ETC___d1840 ||
	       csr_mip_mv_read__53_BIT_4_842_AND_csr_mie_mv_r_ETC___d1851,
	       IF_NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_N_ETC___d1947 } ;
  // value method wfi_resume
  assign wfi_resume = (csr_mip$mv_read & csr_mie$mv_read) != 64'd0 ;
  // action method nmi_req
  assign CAN_FIRE_nmi_req = 1'd1 ;
  assign WILL_FIRE_nmi_req = 1'd1 ;
  // value method nmi_pending
  assign nmi_pending = rg_nmi ;
  // action method debug
  assign RDY_debug = 1'd1 ;
  assign CAN_FIRE_debug = 1'd1 ;
  assign WILL_FIRE_debug = EN_debug ;
  // submodule csr_mie
  mkCSR_MIE csr_mie(.CLK(CLK),
		    .RST_N(RST_N),
		    .mav_sie_write_misa(csr_mie$mav_sie_write_misa),
		    .mav_sie_write_wordxl(csr_mie$mav_sie_write_wordxl),
		    .mav_write_misa(csr_mie$mav_write_misa),
		    .mav_write_wordxl(csr_mie$mav_write_wordxl),
		    .EN_reset(csr_mie$EN_reset),
		    .EN_mav_write(csr_mie$EN_mav_write),
		    .EN_mav_sie_write(csr_mie$EN_mav_sie_write),
		    .mv_read(csr_mie$mv_read),
		    .mav_write(csr_mie$mav_write),
		    .mv_sie_read(csr_mie$mv_sie_read),
		    .mav_sie_write(csr_mie$mav_sie_write));
  // submodule csr_mip
  mkCSR_MIP csr_mip(.CLK(CLK),
		    .RST_N(RST_N),
		    .m_external_interrupt_req_req(csr_mip$m_external_interrupt_req_req),
		    .mav_sip_write_misa(csr_mip$mav_sip_write_misa),
		    .mav_sip_write_wordxl(csr_mip$mav_sip_write_wordxl),
		    .mav_write_misa(csr_mip$mav_write_misa),
		    .mav_write_wordxl(csr_mip$mav_write_wordxl),
		    .s_external_interrupt_req_req(csr_mip$s_external_interrupt_req_req),
		    .software_interrupt_req_req(csr_mip$software_interrupt_req_req),
		    .timer_interrupt_req_req(csr_mip$timer_interrupt_req_req),
		    .EN_reset(csr_mip$EN_reset),
		    .EN_mav_write(csr_mip$EN_mav_write),
		    .EN_mav_sip_write(csr_mip$EN_mav_sip_write),
		    .mv_read(csr_mip$mv_read),
		    .mav_write(csr_mip$mav_write),
		    .mv_sip_read(csr_mip$mv_sip_read),
		    .mav_sip_write(csr_mip$mav_sip_write));
  // submodule f_reset_rsps
  FIFO20 #(.guarded(32'd1)) f_reset_rsps(.RST(RST_N),
					 .CLK(CLK),
					 .ENQ(f_reset_rsps$ENQ),
					 .DEQ(f_reset_rsps$DEQ),
					 .CLR(f_reset_rsps$CLR),
					 .FULL_N(f_reset_rsps$FULL_N),
					 .EMPTY_N(f_reset_rsps$EMPTY_N));
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
		    .m_is_mem_addr(),
		    .m_is_IO_addr(),
		    .m_is_near_mem_IO_addr(),
		    .m_pc_reset_value(),
		    .m_mtvec_reset_value(soc_map$m_mtvec_reset_value),
		    .m_nmivec_reset_value(soc_map$m_nmivec_reset_value));
  // rule RL_rl_reset_start
  assign CAN_FIRE_RL_rl_reset_start = !rg_state ;
  assign WILL_FIRE_RL_rl_reset_start = MUX_rg_state$write_1__SEL_2 ;
  // rule RL_rl_mcycle_incr
  assign CAN_FIRE_RL_rl_mcycle_incr = 1'd1 ;
  assign WILL_FIRE_RL_rl_mcycle_incr = 1'd1 ;
  // rule RL_rl_upd_minstret_csrrx
  assign CAN_FIRE_RL_rl_upd_minstret_csrrx =
	     MUX_rw_minstret$wset_1__SEL_1 || WILL_FIRE_RL_rl_reset_start ;
  assign WILL_FIRE_RL_rl_upd_minstret_csrrx =
	     CAN_FIRE_RL_rl_upd_minstret_csrrx ;
  // rule RL_rl_upd_minstret_incr
  assign CAN_FIRE_RL_rl_upd_minstret_incr =
	     !CAN_FIRE_RL_rl_upd_minstret_csrrx && EN_csr_minstret_incr ;
  assign WILL_FIRE_RL_rl_upd_minstret_incr =
	     CAN_FIRE_RL_rl_upd_minstret_incr ;
  // inputs to muxes for submodule ports
  assign MUX_csr_mstatus_rg_mstatus$write_1__SEL_5 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d755 ;
  assign MUX_rg_fflags$write_1__SEL_2 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d746 ;
  assign MUX_rg_frm$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d803 ;
  assign MUX_rg_mcause$write_1__SEL_2 =
	     EN_csr_trap_actions &&
	     (csr_trap_actions_nmi || new_priv__h13604 == 2'b11) ;
  assign MUX_rg_mcause$write_1__SEL_3 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d852 ;
  assign MUX_rg_mcounteren$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d846 ;
  assign MUX_rg_medeleg$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d832 ;
  assign MUX_rg_mideleg$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d839 ;
  assign MUX_rg_mtvec$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d844 ;
  assign MUX_rg_satp$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d830 ;
  assign MUX_rg_scause$write_1__SEL_2 =
	     EN_csr_trap_actions && !csr_trap_actions_nmi &&
	     new_priv__h13604 == 2'b01 ;
  assign MUX_rg_scause$write_1__SEL_3 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d821 ;
  assign MUX_rg_sepc$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d817 ;
  assign MUX_rg_state$write_1__SEL_2 =
	     CAN_FIRE_RL_rl_reset_start && !EN_mav_csr_write ;
  assign MUX_rg_stval$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d826 ;
  assign MUX_rg_stvec$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d810 ;
  assign MUX_rg_tdata1$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d864 ;
  assign MUX_rw_minstret$wset_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d860 ;
  assign MUX_csr_mstatus_rg_mstatus$write_1__VAL_2 =
	     { sd__h15780, 40'd5120, fixed_up_val_23__h15781 } ;
  assign MUX_csr_mstatus_rg_mstatus$write_1__VAL_4 =
	     { sd__h11992, 40'd5120, fixed_up_val_23__h11993 } ;
  always@(mav_csr_write_csr_addr or
	  mav_csr_write_word_BITS_14_TO_13_68_EQ_0x3_69__ETC___d799 or
	  wordxl1__h7197)
  begin
    case (mav_csr_write_csr_addr)
      12'h001, 12'h002, 12'h003:
	  MUX_csr_mstatus_rg_mstatus$write_1__VAL_5 = wordxl1__h7197;
      default: MUX_csr_mstatus_rg_mstatus$write_1__VAL_5 =
		   mav_csr_write_word_BITS_14_TO_13_68_EQ_0x3_69__ETC___d799;
    endcase
  end
  assign MUX_rg_fflags$write_1__VAL_3 =
	     rg_fflags | ma_update_fcsr_fflags_flags ;
  assign MUX_rg_frm$write_1__VAL_1 =
	     (mav_csr_write_csr_addr == 12'h002) ?
	       mav_csr_write_word[2:0] :
	       mav_csr_write_word[7:5] ;
  assign MUX_rg_mcause$write_1__VAL_2 =
	     { !csr_trap_actions_nmi && csr_trap_actions_interrupt,
	       exc_code__h15560 } ;
  assign MUX_rg_mcause$write_1__VAL_3 =
	     { mav_csr_write_word[63], mav_csr_write_word[3:0] } ;
  assign MUX_rg_medeleg$write_1__VAL_1 =
	     { mav_csr_write_word[15],
	       1'd0,
	       mav_csr_write_word[13:12],
	       2'd0,
	       mav_csr_write_word[9:0] } ;
  assign MUX_rg_minstret$write_1__VAL_1 =
	     MUX_rw_minstret$wset_1__SEL_1 ? mav_csr_write_word : 64'd0 ;
  assign MUX_rg_minstret$write_1__VAL_2 = rg_minstret + 64'd1 ;
  assign MUX_rg_mtvec$write_1__VAL_1 =
	     { mav_csr_write_word[63:2], mav_csr_write_word[0] } ;
  assign MUX_rg_mtvec$write_1__VAL_2 =
	     { soc_map$m_mtvec_reset_value[63:2],
	       soc_map$m_mtvec_reset_value[0] } ;
  // register cfg_verbosity
  assign cfg_verbosity$D_IN = 4'h0 ;
  assign cfg_verbosity$EN = 1'b0 ;
  // register csr_mstatus_rg_mstatus
  always@(WILL_FIRE_RL_rl_reset_start or
	  EN_csr_ret_actions or
	  MUX_csr_mstatus_rg_mstatus$write_1__VAL_2 or
	  EN_csr_trap_actions or
	  v__h13609 or
	  EN_ma_update_mstatus_fs or
	  MUX_csr_mstatus_rg_mstatus$write_1__VAL_4 or
	  MUX_csr_mstatus_rg_mstatus$write_1__SEL_5 or
	  MUX_csr_mstatus_rg_mstatus$write_1__VAL_5)
  case (1'b1)
    WILL_FIRE_RL_rl_reset_start:
	csr_mstatus_rg_mstatus$D_IN = 64'h0000000A00002000;
    EN_csr_ret_actions:
	csr_mstatus_rg_mstatus$D_IN =
	    MUX_csr_mstatus_rg_mstatus$write_1__VAL_2;
    EN_csr_trap_actions: csr_mstatus_rg_mstatus$D_IN = v__h13609;
    EN_ma_update_mstatus_fs:
	csr_mstatus_rg_mstatus$D_IN =
	    MUX_csr_mstatus_rg_mstatus$write_1__VAL_4;
    MUX_csr_mstatus_rg_mstatus$write_1__SEL_5:
	csr_mstatus_rg_mstatus$D_IN =
	    MUX_csr_mstatus_rg_mstatus$write_1__VAL_5;
    default: csr_mstatus_rg_mstatus$D_IN =
		 64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
  endcase
  assign csr_mstatus_rg_mstatus$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d755 ||
	     EN_csr_trap_actions ||
	     EN_ma_update_mstatus_fs ||
	     EN_csr_ret_actions ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_dcsr
  assign rg_dcsr$D_IN = 32'h0 ;
  assign rg_dcsr$EN = 1'b0 ;
  // register rg_dpc
  assign rg_dpc$D_IN = 64'h0 ;
  assign rg_dpc$EN = 1'b0 ;
  // register rg_dscratch0
  assign rg_dscratch0$D_IN = 64'h0 ;
  assign rg_dscratch0$EN = 1'b0 ;
  // register rg_dscratch1
  assign rg_dscratch1$D_IN = 64'h0 ;
  assign rg_dscratch1$EN = 1'b0 ;
  // register rg_fflags
  always@(WILL_FIRE_RL_rl_reset_start or
	  MUX_rg_fflags$write_1__SEL_2 or
	  mav_csr_write_word or
	  EN_ma_update_fcsr_fflags or MUX_rg_fflags$write_1__VAL_3)
  case (1'b1)
    WILL_FIRE_RL_rl_reset_start: rg_fflags$D_IN = 5'd0;
    MUX_rg_fflags$write_1__SEL_2: rg_fflags$D_IN = mav_csr_write_word[4:0];
    EN_ma_update_fcsr_fflags: rg_fflags$D_IN = MUX_rg_fflags$write_1__VAL_3;
    default: rg_fflags$D_IN = 5'b01010 /* unspecified value */ ;
  endcase
  assign rg_fflags$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d746 ||
	     EN_ma_update_fcsr_fflags ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_frm
  assign rg_frm$D_IN =
	     MUX_rg_frm$write_1__SEL_1 ? MUX_rg_frm$write_1__VAL_1 : 3'd0 ;
  assign rg_frm$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d803 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_mcause
  always@(WILL_FIRE_RL_rl_reset_start or
	  MUX_rg_mcause$write_1__SEL_2 or
	  MUX_rg_mcause$write_1__VAL_2 or
	  MUX_rg_mcause$write_1__SEL_3 or MUX_rg_mcause$write_1__VAL_3)
  case (1'b1)
    WILL_FIRE_RL_rl_reset_start: rg_mcause$D_IN = 5'd0;
    MUX_rg_mcause$write_1__SEL_2:
	rg_mcause$D_IN = MUX_rg_mcause$write_1__VAL_2;
    MUX_rg_mcause$write_1__SEL_3:
	rg_mcause$D_IN = MUX_rg_mcause$write_1__VAL_3;
    default: rg_mcause$D_IN = 5'b01010 /* unspecified value */ ;
  endcase
  assign rg_mcause$EN =
	     EN_csr_trap_actions &&
	     (csr_trap_actions_nmi || new_priv__h13604 == 2'b11) ||
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d852 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_mcounteren
  assign rg_mcounteren$D_IN =
	     MUX_rg_mcounteren$write_1__SEL_1 ?
	       mav_csr_write_word[2:0] :
	       3'd0 ;
  assign rg_mcounteren$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d846 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_mcycle
  assign rg_mcycle$D_IN = rg_mcycle + 64'd1 ;
  assign rg_mcycle$EN = 1'd1 ;
  // register rg_medeleg
  assign rg_medeleg$D_IN =
	     MUX_rg_medeleg$write_1__SEL_1 ?
	       MUX_rg_medeleg$write_1__VAL_1 :
	       16'd0 ;
  assign rg_medeleg$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d832 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_mepc
  assign rg_mepc$D_IN =
	     MUX_rg_mcause$write_1__SEL_2 ?
	       csr_trap_actions_pc :
	       new_csr_value__h9962 ;
  assign rg_mepc$EN =
	     EN_csr_trap_actions &&
	     (csr_trap_actions_nmi || new_priv__h13604 == 2'b11) ||
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d850 ;
  // register rg_mideleg
  assign rg_mideleg$D_IN =
	     MUX_rg_mideleg$write_1__SEL_1 ?
	       mav_csr_write_word[11:0] :
	       12'd0 ;
  assign rg_mideleg$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d839 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_minstret
  assign rg_minstret$D_IN =
	     WILL_FIRE_RL_rl_upd_minstret_csrrx ?
	       MUX_rg_minstret$write_1__VAL_1 :
	       MUX_rg_minstret$write_1__VAL_2 ;
  assign rg_minstret$EN =
	     WILL_FIRE_RL_rl_upd_minstret_csrrx ||
	     WILL_FIRE_RL_rl_upd_minstret_incr ;
  // register rg_mscratch
  assign rg_mscratch$D_IN = mav_csr_write_word ;
  assign rg_mscratch$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d848 ;
  // register rg_mtval
  assign rg_mtval$D_IN =
	     MUX_rg_mcause$write_1__SEL_2 ?
	       csr_trap_actions_xtval :
	       mav_csr_write_word ;
  assign rg_mtval$EN =
	     EN_csr_trap_actions &&
	     (csr_trap_actions_nmi || new_priv__h13604 == 2'b11) ||
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d854 ;
  // register rg_mtvec
  assign rg_mtvec$D_IN =
	     MUX_rg_mtvec$write_1__SEL_1 ?
	       MUX_rg_mtvec$write_1__VAL_1 :
	       MUX_rg_mtvec$write_1__VAL_2 ;
  assign rg_mtvec$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d844 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_nmi
  assign rg_nmi$D_IN = !WILL_FIRE_RL_rl_reset_start && nmi_req_set_not_clear ;
  assign rg_nmi$EN = 1'b1 ;
  // register rg_nmi_vector
  assign rg_nmi_vector$D_IN = soc_map$m_nmivec_reset_value ;
  assign rg_nmi_vector$EN = MUX_rg_state$write_1__SEL_2 ;
  // register rg_satp
  assign rg_satp$D_IN =
	     MUX_rg_satp$write_1__SEL_1 ? mav_csr_write_word : 64'd0 ;
  assign rg_satp$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d830 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_scause
  always@(WILL_FIRE_RL_rl_reset_start or
	  MUX_rg_scause$write_1__SEL_2 or
	  MUX_rg_mcause$write_1__VAL_2 or
	  MUX_rg_scause$write_1__SEL_3 or MUX_rg_mcause$write_1__VAL_3)
  case (1'b1)
    WILL_FIRE_RL_rl_reset_start: rg_scause$D_IN = 5'd0;
    MUX_rg_scause$write_1__SEL_2:
	rg_scause$D_IN = MUX_rg_mcause$write_1__VAL_2;
    MUX_rg_scause$write_1__SEL_3:
	rg_scause$D_IN = MUX_rg_mcause$write_1__VAL_3;
    default: rg_scause$D_IN = 5'b01010 /* unspecified value */ ;
  endcase
  assign rg_scause$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d821 ||
	     EN_csr_trap_actions && !csr_trap_actions_nmi &&
	     new_priv__h13604 == 2'b01 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_sepc
  assign rg_sepc$D_IN =
	     MUX_rg_sepc$write_1__SEL_1 ?
	       new_csr_value__h9962 :
	       csr_trap_actions_pc ;
  assign rg_sepc$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d817 ||
	     EN_csr_trap_actions && !csr_trap_actions_nmi &&
	     new_priv__h13604 == 2'b01 ;
  // register rg_sscratch
  assign rg_sscratch$D_IN = mav_csr_write_word ;
  assign rg_sscratch$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d815 ;
  // register rg_state
  assign rg_state$D_IN = !EN_server_reset_request_put ;
  assign rg_state$EN =
	     EN_server_reset_request_put || WILL_FIRE_RL_rl_reset_start ;
  // register rg_stval
  assign rg_stval$D_IN =
	     MUX_rg_stval$write_1__SEL_1 ?
	       mav_csr_write_word :
	       csr_trap_actions_xtval ;
  assign rg_stval$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d826 ||
	     EN_csr_trap_actions && !csr_trap_actions_nmi &&
	     new_priv__h13604 == 2'b01 ;
  // register rg_stvec
  assign rg_stvec$D_IN =
	     MUX_rg_stvec$write_1__SEL_1 ?
	       MUX_rg_mtvec$write_1__VAL_1 :
	       MUX_rg_mtvec$write_1__VAL_2 ;
  assign rg_stvec$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d810 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_tdata1
  assign rg_tdata1$D_IN =
	     MUX_rg_tdata1$write_1__SEL_1 ? new_csr_value__h10690 : 64'd0 ;
  assign rg_tdata1$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d864 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_tdata2
  assign rg_tdata2$D_IN = mav_csr_write_word ;
  assign rg_tdata2$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d868 ;
  // register rg_tdata3
  assign rg_tdata3$D_IN = mav_csr_write_word ;
  assign rg_tdata3$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d870 ;
  // register rg_tselect
  assign rg_tselect$D_IN = 64'd0 ;
  assign rg_tselect$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d862 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // submodule csr_mie
  assign csr_mie$mav_sie_write_misa = 28'd135532845 ;
  assign csr_mie$mav_sie_write_wordxl = mav_csr_write_word ;
  assign csr_mie$mav_write_misa = 28'd135532845 ;
  assign csr_mie$mav_write_wordxl = mav_csr_write_word ;
  assign csr_mie$EN_reset = MUX_rg_state$write_1__SEL_2 ;
  assign csr_mie$EN_mav_write =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d842 ;
  assign csr_mie$EN_mav_sie_write =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d808 ;
  // submodule csr_mip
  assign csr_mip$m_external_interrupt_req_req =
	     m_external_interrupt_req_set_not_clear ;
  assign csr_mip$mav_sip_write_misa = 28'd135532845 ;
  assign csr_mip$mav_sip_write_wordxl = mav_csr_write_word ;
  assign csr_mip$mav_write_misa = 28'd135532845 ;
  assign csr_mip$mav_write_wordxl = mav_csr_write_word ;
  assign csr_mip$s_external_interrupt_req_req =
	     s_external_interrupt_req_set_not_clear ;
  assign csr_mip$software_interrupt_req_req =
	     software_interrupt_req_set_not_clear ;
  assign csr_mip$timer_interrupt_req_req = timer_interrupt_req_set_not_clear ;
  assign csr_mip$EN_reset = MUX_rg_state$write_1__SEL_2 ;
  assign csr_mip$EN_mav_write =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d856 ;
  assign csr_mip$EN_mav_sip_write =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d828 ;
  // submodule f_reset_rsps
  assign f_reset_rsps$ENQ = EN_server_reset_request_put ;
  assign f_reset_rsps$DEQ = EN_server_reset_response_get ;
  assign f_reset_rsps$CLR = 1'b0 ;
  // submodule soc_map
  assign soc_map$m_is_IO_addr_addr = 64'h0 ;
  assign soc_map$m_is_mem_addr_addr = 64'h0 ;
  assign soc_map$m_is_near_mem_IO_addr_addr = 64'h0 ;
  // remaining internal signals
  assign IF_IF_csr_trap_actions_nmi_THEN_0b11_ELSE_IF_c_ETC___d1294 =
	     (new_priv__h13604 == 2'b11) ?
	       { csr_mstatus_rg_mstatus_03_AND_INV_1_SL_1_CONCA_ETC___d1286[63:13],
		 csr_trap_actions_from_priv,
		 csr_mstatus_rg_mstatus_03_AND_INV_1_SL_1_CONCA_ETC___d1286[10:0] } :
	       { csr_mstatus_rg_mstatus_03_AND_INV_1_SL_1_CONCA_ETC___d1286[63:9],
		 csr_trap_actions_from_priv[0],
		 csr_mstatus_rg_mstatus_03_AND_INV_1_SL_1_CONCA_ETC___d1286[7:0] } ;
  assign IF_NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_N_ETC___d1942 =
	     (NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1867 &&
	      NOT_csr_mip_mv_read__53_BIT_3_765_868_OR_NOT_c_ETC___d1875 &&
	      NOT_csr_mip_mv_read__53_BIT_7_776_877_OR_NOT_c_ETC___d1884) ?
	       4'd9 :
	       ((NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1867 &&
		 NOT_csr_mip_mv_read__53_BIT_3_765_868_OR_NOT_c_ETC___d1875) ?
		  4'd7 :
		  (NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1867 ?
		     4'd3 :
		     4'd11)) ;
  assign IF_NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_N_ETC___d1944 =
	     (NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1894 &&
	      NOT_csr_mip_mv_read__53_BIT_1_798_895_OR_NOT_c_ETC___d1902) ?
	       4'd5 :
	       (NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1894 ?
		  4'd1 :
		  IF_NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_N_ETC___d1942) ;
  assign IF_NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_N_ETC___d1945 =
	     (NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1894 &&
	      NOT_csr_mip_mv_read__53_BIT_1_798_895_OR_NOT_c_ETC___d1902 &&
	      NOT_csr_mip_mv_read__53_BIT_5_809_904_OR_NOT_c_ETC___d1911) ?
	       4'd8 :
	       IF_NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_N_ETC___d1944 ;
  assign IF_NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_N_ETC___d1947 =
	     (NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1921 &&
	      NOT_csr_mip_mv_read__53_BIT_0_831_922_OR_NOT_c_ETC___d1929) ?
	       4'd4 :
	       (NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1921 ?
		  4'd0 :
		  IF_NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_N_ETC___d1945) ;
  assign IF_csr_mstatus_rg_mstatus_03_BITS_12_TO_11_59__ETC___d761 =
	     (csr_mstatus_rg_mstatus[12:11] == 2'b10) ?
	       2'b01 :
	       csr_mstatus_rg_mstatus[12:11] ;
  assign IF_csr_ret_actions_from_priv_EQ_0b11_476_THEN__ETC___d1496 =
	     (csr_ret_actions_from_priv == 2'b11) ?
	       _theResult___fst__h15874 :
	       _theResult___fst__h16075 ;
  assign NOT_access_permitted_1_csr_addr_ULT_0xC03_517__ETC___d1617 =
	     (access_permitted_1_csr_addr >= 12'hC03 &&
	      access_permitted_1_csr_addr <= 12'hC1F ||
	      access_permitted_1_csr_addr >= 12'hB03 &&
	      access_permitted_1_csr_addr <= 12'hB1F ||
	      access_permitted_1_csr_addr >= 12'h323 &&
	      access_permitted_1_csr_addr <= 12'h33F ||
	      access_permitted_1_csr_addr == 12'h001 ||
	      access_permitted_1_csr_addr == 12'h002 ||
	      access_permitted_1_csr_addr == 12'h003 ||
	      access_permitted_1_csr_addr == 12'hC00 ||
	      access_permitted_1_csr_addr == 12'hC02 ||
	      access_permitted_1_csr_addr == 12'h100 ||
	      access_permitted_1_csr_addr == 12'h102 ||
	      access_permitted_1_csr_addr == 12'h103 ||
	      access_permitted_1_csr_addr == 12'h104 ||
	      access_permitted_1_csr_addr == 12'h105 ||
	      access_permitted_1_csr_addr == 12'h106 ||
	      access_permitted_1_csr_addr == 12'h140 ||
	      access_permitted_1_csr_addr == 12'h141 ||
	      access_permitted_1_csr_addr == 12'h142 ||
	      access_permitted_1_csr_addr == 12'h143 ||
	      access_permitted_1_csr_addr == 12'h144 ||
	      access_permitted_1_csr_addr == 12'h180 ||
	      access_permitted_1_csr_addr == 12'h302 ||
	      access_permitted_1_csr_addr == 12'h303 ||
	      access_permitted_1_csr_addr == 12'hF11 ||
	      access_permitted_1_csr_addr == 12'hF12 ||
	      access_permitted_1_csr_addr == 12'hF13 ||
	      access_permitted_1_csr_addr == 12'hF14 ||
	      access_permitted_1_csr_addr == 12'h300 ||
	      access_permitted_1_csr_addr == 12'h301 ||
	      access_permitted_1_csr_addr == 12'h304 ||
	      access_permitted_1_csr_addr == 12'h305 ||
	      access_permitted_1_csr_addr == 12'h306 ||
	      access_permitted_1_csr_addr == 12'h340 ||
	      access_permitted_1_csr_addr == 12'h341 ||
	      access_permitted_1_csr_addr == 12'h342 ||
	      access_permitted_1_csr_addr == 12'h343 ||
	      access_permitted_1_csr_addr == 12'h344 ||
	      access_permitted_1_csr_addr == 12'hB00 ||
	      access_permitted_1_csr_addr == 12'hB02 ||
	      access_permitted_1_csr_addr == 12'h7A0 ||
	      access_permitted_1_csr_addr == 12'h7A1 ||
	      access_permitted_1_csr_addr == 12'h7A2 ||
	      access_permitted_1_csr_addr == 12'h7A3) &&
	     access_permitted_1_priv >= access_permitted_1_csr_addr[9:8] &&
	     (access_permitted_1_csr_addr != 12'h180 ||
	      !csr_mstatus_rg_mstatus[20]) ;
  assign NOT_access_permitted_2_csr_addr_ULT_0xC03_622__ETC___d1720 =
	     (access_permitted_2_csr_addr >= 12'hC03 &&
	      access_permitted_2_csr_addr <= 12'hC1F ||
	      access_permitted_2_csr_addr >= 12'hB03 &&
	      access_permitted_2_csr_addr <= 12'hB1F ||
	      access_permitted_2_csr_addr >= 12'h323 &&
	      access_permitted_2_csr_addr <= 12'h33F ||
	      access_permitted_2_csr_addr == 12'h001 ||
	      access_permitted_2_csr_addr == 12'h002 ||
	      access_permitted_2_csr_addr == 12'h003 ||
	      access_permitted_2_csr_addr == 12'hC00 ||
	      access_permitted_2_csr_addr == 12'hC02 ||
	      access_permitted_2_csr_addr == 12'h100 ||
	      access_permitted_2_csr_addr == 12'h102 ||
	      access_permitted_2_csr_addr == 12'h103 ||
	      access_permitted_2_csr_addr == 12'h104 ||
	      access_permitted_2_csr_addr == 12'h105 ||
	      access_permitted_2_csr_addr == 12'h106 ||
	      access_permitted_2_csr_addr == 12'h140 ||
	      access_permitted_2_csr_addr == 12'h141 ||
	      access_permitted_2_csr_addr == 12'h142 ||
	      access_permitted_2_csr_addr == 12'h143 ||
	      access_permitted_2_csr_addr == 12'h144 ||
	      access_permitted_2_csr_addr == 12'h180 ||
	      access_permitted_2_csr_addr == 12'h302 ||
	      access_permitted_2_csr_addr == 12'h303 ||
	      access_permitted_2_csr_addr == 12'hF11 ||
	      access_permitted_2_csr_addr == 12'hF12 ||
	      access_permitted_2_csr_addr == 12'hF13 ||
	      access_permitted_2_csr_addr == 12'hF14 ||
	      access_permitted_2_csr_addr == 12'h300 ||
	      access_permitted_2_csr_addr == 12'h301 ||
	      access_permitted_2_csr_addr == 12'h304 ||
	      access_permitted_2_csr_addr == 12'h305 ||
	      access_permitted_2_csr_addr == 12'h306 ||
	      access_permitted_2_csr_addr == 12'h340 ||
	      access_permitted_2_csr_addr == 12'h341 ||
	      access_permitted_2_csr_addr == 12'h342 ||
	      access_permitted_2_csr_addr == 12'h343 ||
	      access_permitted_2_csr_addr == 12'h344 ||
	      access_permitted_2_csr_addr == 12'hB00 ||
	      access_permitted_2_csr_addr == 12'hB02 ||
	      access_permitted_2_csr_addr == 12'h7A0 ||
	      access_permitted_2_csr_addr == 12'h7A1 ||
	      access_permitted_2_csr_addr == 12'h7A2 ||
	      access_permitted_2_csr_addr == 12'h7A3) &&
	     access_permitted_2_priv >= access_permitted_2_csr_addr[9:8] &&
	     (access_permitted_2_csr_addr != 12'h180 ||
	      !csr_mstatus_rg_mstatus[20]) ;
  assign NOT_cfg_verbosity_read__53_ULE_1_54___d955 = cfg_verbosity > 4'd1 ;
  assign NOT_csr_mip_mv_read__53_BIT_0_831_922_OR_NOT_c_ETC___d1929 =
	     !csr_mip$mv_read[0] || !csr_mie$mv_read[0] ||
	     !interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1836 &&
	     (!interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1837 ||
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1864) ;
  assign NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1867 =
	     !csr_mip$mv_read[11] || !csr_mie$mv_read[11] ||
	     !interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1752 &&
	     (!interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1753 ||
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1864) ;
  assign NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1894 =
	     NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1867 &&
	     NOT_csr_mip_mv_read__53_BIT_3_765_868_OR_NOT_c_ETC___d1875 &&
	     NOT_csr_mip_mv_read__53_BIT_7_776_877_OR_NOT_c_ETC___d1884 &&
	     NOT_csr_mip_mv_read__53_BIT_9_787_886_OR_NOT_c_ETC___d1893 ;
  assign NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1921 =
	     NOT_csr_mip_mv_read__53_BIT_11_747_853_OR_NOT__ETC___d1894 &&
	     NOT_csr_mip_mv_read__53_BIT_1_798_895_OR_NOT_c_ETC___d1902 &&
	     NOT_csr_mip_mv_read__53_BIT_5_809_904_OR_NOT_c_ETC___d1911 &&
	     NOT_csr_mip_mv_read__53_BIT_8_820_913_OR_NOT_c_ETC___d1920 ;
  assign NOT_csr_mip_mv_read__53_BIT_1_798_895_OR_NOT_c_ETC___d1902 =
	     !csr_mip$mv_read[1] || !csr_mie$mv_read[1] ||
	     !interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1803 &&
	     (!interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1804 ||
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1864) ;
  assign NOT_csr_mip_mv_read__53_BIT_3_765_868_OR_NOT_c_ETC___d1875 =
	     !csr_mip$mv_read[3] || !csr_mie$mv_read[3] ||
	     !interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1770 &&
	     (!interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1771 ||
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1864) ;
  assign NOT_csr_mip_mv_read__53_BIT_5_809_904_OR_NOT_c_ETC___d1911 =
	     !csr_mip$mv_read[5] || !csr_mie$mv_read[5] ||
	     !interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1814 &&
	     (!interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1815 ||
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1864) ;
  assign NOT_csr_mip_mv_read__53_BIT_7_776_877_OR_NOT_c_ETC___d1884 =
	     !csr_mip$mv_read[7] || !csr_mie$mv_read[7] ||
	     !interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1781 &&
	     (!interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1782 ||
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1864) ;
  assign NOT_csr_mip_mv_read__53_BIT_8_820_913_OR_NOT_c_ETC___d1920 =
	     !csr_mip$mv_read[8] || !csr_mie$mv_read[8] ||
	     !interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1825 &&
	     (!interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1826 ||
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1864) ;
  assign NOT_csr_mip_mv_read__53_BIT_9_787_886_OR_NOT_c_ETC___d1893 =
	     !csr_mip$mv_read[9] || !csr_mie$mv_read[9] ||
	     !interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1792 &&
	     (!interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1793 ||
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1864) ;
  assign NOT_csr_trap_actions_nmi_311_AND_csr_trap_acti_ETC___d1421 =
	     !csr_trap_actions_nmi && csr_trap_actions_interrupt &&
	     exc_code__h15560 != 4'd0 &&
	     exc_code__h15560 != 4'd1 &&
	     exc_code__h15560 != 4'd2 &&
	     exc_code__h15560 != 4'd3 &&
	     exc_code__h15560 != 4'd4 &&
	     exc_code__h15560 != 4'd5 &&
	     exc_code__h15560 != 4'd6 &&
	     exc_code__h15560 != 4'd7 &&
	     exc_code__h15560 != 4'd8 &&
	     exc_code__h15560 != 4'd9 &&
	     exc_code__h15560 != 4'd10 &&
	     exc_code__h15560 != 4'd11 ;
  assign _theResult____h17471 = rg_mideleg[11] ? 2'b01 : 2'b11 ;
  assign _theResult____h17683 = rg_mideleg[3] ? 2'b01 : 2'b11 ;
  assign _theResult____h17895 = rg_mideleg[7] ? 2'b01 : 2'b11 ;
  assign _theResult____h18107 = rg_mideleg[9] ? 2'b01 : 2'b11 ;
  assign _theResult____h18319 = rg_mideleg[1] ? 2'b01 : 2'b11 ;
  assign _theResult____h18531 = rg_mideleg[5] ? 2'b01 : 2'b11 ;
  assign _theResult____h18743 = rg_mideleg[8] ? 2'b01 : 2'b11 ;
  assign _theResult____h18955 = rg_mideleg[0] ? 2'b01 : 2'b11 ;
  assign _theResult____h19167 = rg_mideleg[4] ? 2'b01 : 2'b11 ;
  assign _theResult___fst__h13742 =
	     (csr_trap_actions_interrupt ?
		deleg_bit___1__h13751 :
		deleg_bit___1__h13766) ?
	       2'b01 :
	       2'b11 ;
  assign _theResult___fst__h15874 =
	     { csr_mstatus_rg_mstatus_03_AND_INV_1_SL_0_CONCA_ETC___d1489[63:13],
	       2'd0,
	       csr_mstatus_rg_mstatus_03_AND_INV_1_SL_0_CONCA_ETC___d1489[10:0] } ;
  assign _theResult___fst__h16075 =
	     { csr_mstatus_rg_mstatus_03_AND_INV_1_SL_0_CONCA_ETC___d1489[63:9],
	       1'd0,
	       csr_mstatus_rg_mstatus_03_AND_INV_1_SL_0_CONCA_ETC___d1489[7:0] } ;
  assign b__h13829 = csr_mstatus_rg_mstatus[ie_to_x__h13730] ;
  assign b__h15911 = csr_mstatus_rg_mstatus[pie_from_x__h15859] ;
  assign csr_mip_mv_read__53_BIT_0_831_AND_csr_mie_mv_r_ETC___d1840 =
	     csr_mip$mv_read[0] && csr_mie$mv_read[0] &&
	     (interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1836 ||
	      interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1837 &&
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1761) ;
  assign csr_mip_mv_read__53_BIT_11_747_AND_csr_mie_mv__ETC___d1764 =
	     csr_mip$mv_read[11] && csr_mie$mv_read[11] &&
	     (interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1752 ||
	      interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1753 &&
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1761) ;
  assign csr_mip_mv_read__53_BIT_11_747_AND_csr_mie_mv__ETC___d1830 =
	     csr_mip_mv_read__53_BIT_11_747_AND_csr_mie_mv__ETC___d1764 ||
	     csr_mip_mv_read__53_BIT_3_765_AND_csr_mie_mv_r_ETC___d1774 ||
	     csr_mip_mv_read__53_BIT_7_776_AND_csr_mie_mv_r_ETC___d1785 ||
	     csr_mip_mv_read__53_BIT_9_787_AND_csr_mie_mv_r_ETC___d1796 ||
	     csr_mip_mv_read__53_BIT_1_798_AND_csr_mie_mv_r_ETC___d1807 ||
	     csr_mip_mv_read__53_BIT_5_809_AND_csr_mie_mv_r_ETC___d1818 ||
	     csr_mip_mv_read__53_BIT_8_820_AND_csr_mie_mv_r_ETC___d1829 ;
  assign csr_mip_mv_read__53_BIT_1_798_AND_csr_mie_mv_r_ETC___d1807 =
	     csr_mip$mv_read[1] && csr_mie$mv_read[1] &&
	     (interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1803 ||
	      interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1804 &&
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1761) ;
  assign csr_mip_mv_read__53_BIT_3_765_AND_csr_mie_mv_r_ETC___d1774 =
	     csr_mip$mv_read[3] && csr_mie$mv_read[3] &&
	     (interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1770 ||
	      interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1771 &&
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1761) ;
  assign csr_mip_mv_read__53_BIT_4_842_AND_csr_mie_mv_r_ETC___d1851 =
	     csr_mip$mv_read[4] && csr_mie$mv_read[4] &&
	     (interrupt_pending_cur_priv < _theResult____h19167 ||
	      interrupt_pending_cur_priv == _theResult____h19167 &&
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1761) ;
  assign csr_mip_mv_read__53_BIT_5_809_AND_csr_mie_mv_r_ETC___d1818 =
	     csr_mip$mv_read[5] && csr_mie$mv_read[5] &&
	     (interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1814 ||
	      interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1815 &&
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1761) ;
  assign csr_mip_mv_read__53_BIT_7_776_AND_csr_mie_mv_r_ETC___d1785 =
	     csr_mip$mv_read[7] && csr_mie$mv_read[7] &&
	     (interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1781 ||
	      interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1782 &&
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1761) ;
  assign csr_mip_mv_read__53_BIT_8_820_AND_csr_mie_mv_r_ETC___d1829 =
	     csr_mip$mv_read[8] && csr_mie$mv_read[8] &&
	     (interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1825 ||
	      interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1826 &&
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1761) ;
  assign csr_mip_mv_read__53_BIT_9_787_AND_csr_mie_mv_r_ETC___d1796 =
	     csr_mip$mv_read[9] && csr_mie$mv_read[9] &&
	     (interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1792 ||
	      interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1793 &&
	      IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1761) ;
  assign csr_mstatus_rg_mstatus_03_AND_INV_1_SL_0_CONCA_ETC___d1489 =
	     x__h15907 | mask__h15895 ;
  assign csr_mstatus_rg_mstatus_03_AND_INV_1_SL_1_CONCA_ETC___d1286 =
	     x__h13825 | val__h13814 ;
  assign csr_trap_actions_interrupt_AND_NOT_csr_trap_ac_ETC___d1320 =
	     csr_trap_actions_interrupt && !csr_trap_actions_nmi &&
	     CASE_new_priv3604_0b1_rg_stvec_BIT_0_0b11_rg_m_ETC__q2 ;
  assign csr_trap_actions_nmi_OR_NOT_csr_trap_actions_i_ETC___d1472 =
	     (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	     exc_code__h15560 != 4'd0 &&
	     exc_code__h15560 != 4'd1 &&
	     exc_code__h15560 != 4'd2 &&
	     exc_code__h15560 != 4'd3 &&
	     exc_code__h15560 != 4'd4 &&
	     exc_code__h15560 != 4'd5 &&
	     exc_code__h15560 != 4'd6 &&
	     exc_code__h15560 != 4'd7 &&
	     exc_code__h15560 != 4'd8 &&
	     exc_code__h15560 != 4'd9 &&
	     exc_code__h15560 != 4'd11 &&
	     exc_code__h15560 != 4'd12 &&
	     exc_code__h15560 != 4'd13 &&
	     exc_code__h15560 != 4'd15 ;
  assign deleg_bit___1__h13751 = rg_mideleg[csr_trap_actions_exc_code] ;
  assign deleg_bit___1__h13766 = rg_medeleg[csr_trap_actions_exc_code] ;
  assign exc_code__h15560 =
	     csr_trap_actions_nmi ? 4'd0 : csr_trap_actions_exc_code ;
  assign exc_pc___1__h14867 = exc_pc__h14793 + vector_offset__h14794 ;
  assign exc_pc__h14793 =
	     csr_trap_actions_nmi ?
	       rg_nmi_vector :
	       y_avValue_snd_snd__h14840 ;
  assign fixed_up_val_23__h11439 =
	     { csr_mstatus_rg_mstatus[22:17],
	       2'd0,
	       mv_update_mstatus_fs_fs,
	       IF_csr_mstatus_rg_mstatus_03_BITS_12_TO_11_59__ETC___d761,
	       csr_mstatus_rg_mstatus[10:5],
	       1'd0,
	       csr_mstatus_rg_mstatus[3:1],
	       1'd0 } ;
  assign fixed_up_val_23__h11993 =
	     { csr_mstatus_rg_mstatus[22:17],
	       2'd0,
	       ma_update_mstatus_fs_fs,
	       IF_csr_mstatus_rg_mstatus_03_BITS_12_TO_11_59__ETC___d761,
	       csr_mstatus_rg_mstatus[10:5],
	       1'd0,
	       csr_mstatus_rg_mstatus[3:1],
	       1'd0 } ;
  assign fixed_up_val_23__h13653 =
	     { IF_IF_csr_trap_actions_nmi_THEN_0b11_ELSE_IF_c_ETC___d1294[22:17],
	       2'd0,
	       IF_IF_csr_trap_actions_nmi_THEN_0b11_ELSE_IF_c_ETC___d1294[14:13],
	       (IF_IF_csr_trap_actions_nmi_THEN_0b11_ELSE_IF_c_ETC___d1294[12:11] ==
		2'b10) ?
		 2'b01 :
		 IF_IF_csr_trap_actions_nmi_THEN_0b11_ELSE_IF_c_ETC___d1294[12:11],
	       IF_IF_csr_trap_actions_nmi_THEN_0b11_ELSE_IF_c_ETC___d1294[10:5],
	       1'd0,
	       IF_IF_csr_trap_actions_nmi_THEN_0b11_ELSE_IF_c_ETC___d1294[3:1],
	       1'd0 } ;
  assign fixed_up_val_23__h15781 =
	     { IF_csr_ret_actions_from_priv_EQ_0b11_476_THEN__ETC___d1496[22:17],
	       2'd0,
	       IF_csr_ret_actions_from_priv_EQ_0b11_476_THEN__ETC___d1496[14:13],
	       (IF_csr_ret_actions_from_priv_EQ_0b11_476_THEN__ETC___d1496[12:11] ==
		2'b10) ?
		 2'b01 :
		 IF_csr_ret_actions_from_priv_EQ_0b11_476_THEN__ETC___d1496[12:11],
	       IF_csr_ret_actions_from_priv_EQ_0b11_476_THEN__ETC___d1496[10:5],
	       1'd0,
	       IF_csr_ret_actions_from_priv_EQ_0b11_476_THEN__ETC___d1496[3:1],
	       1'd0 } ;
  assign fixed_up_val_23__h7238 =
	     { csr_mstatus_rg_mstatus[22:17],
	       4'd3,
	       IF_csr_mstatus_rg_mstatus_03_BITS_12_TO_11_59__ETC___d761,
	       csr_mstatus_rg_mstatus[10:5],
	       1'd0,
	       csr_mstatus_rg_mstatus[3:1],
	       1'd0 } ;
  assign fixed_up_val_23__h7818 =
	     { csr_mstatus_rg_mstatus[22:20],
	       mav_csr_write_word[19:18],
	       csr_mstatus_rg_mstatus[17],
	       2'd0,
	       mav_csr_write_word[14:13],
	       IF_csr_mstatus_rg_mstatus_03_BITS_12_TO_11_59__ETC___d761,
	       csr_mstatus_rg_mstatus[10:9],
	       mav_csr_write_word[8],
	       csr_mstatus_rg_mstatus[7:6],
	       mav_csr_write_word[5],
	       1'd0,
	       csr_mstatus_rg_mstatus[3:2],
	       mav_csr_write_word[1],
	       1'd0 } ;
  assign fixed_up_val_23__h9248 =
	     { mav_csr_write_word[22:17],
	       2'd0,
	       mav_csr_write_word[14:13],
	       (mav_csr_write_word[12:11] == 2'b10) ?
		 2'b01 :
		 mav_csr_write_word[12:11],
	       mav_csr_write_word[10:5],
	       1'd0,
	       mav_csr_write_word[3:1],
	       1'd0 } ;
  assign ie_from_x__h15858 = { 4'd0, csr_ret_actions_from_priv } ;
  assign ie_to_x__h13730 = { 4'd0, new_priv__h13604 } ;
  assign interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1753 =
	     interrupt_pending_cur_priv == _theResult____h17471 ;
  assign interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1771 =
	     interrupt_pending_cur_priv == _theResult____h17683 ;
  assign interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1782 =
	     interrupt_pending_cur_priv == _theResult____h17895 ;
  assign interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1793 =
	     interrupt_pending_cur_priv == _theResult____h18107 ;
  assign interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1804 =
	     interrupt_pending_cur_priv == _theResult____h18319 ;
  assign interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1815 =
	     interrupt_pending_cur_priv == _theResult____h18531 ;
  assign interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1826 =
	     interrupt_pending_cur_priv == _theResult____h18743 ;
  assign interrupt_pending_cur_priv_EQ_IF_rg_mideleg_34_ETC___d1837 =
	     interrupt_pending_cur_priv == _theResult____h18955 ;
  assign interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1752 =
	     interrupt_pending_cur_priv < _theResult____h17471 ;
  assign interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1770 =
	     interrupt_pending_cur_priv < _theResult____h17683 ;
  assign interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1781 =
	     interrupt_pending_cur_priv < _theResult____h17895 ;
  assign interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1792 =
	     interrupt_pending_cur_priv < _theResult____h18107 ;
  assign interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1803 =
	     interrupt_pending_cur_priv < _theResult____h18319 ;
  assign interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1814 =
	     interrupt_pending_cur_priv < _theResult____h18531 ;
  assign interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1825 =
	     interrupt_pending_cur_priv < _theResult____h18743 ;
  assign interrupt_pending_cur_priv_ULT_IF_rg_mideleg_3_ETC___d1836 =
	     interrupt_pending_cur_priv < _theResult____h18955 ;
  assign mask__h13813 = 64'd1 << ie_to_x__h13730 ;
  assign mask__h13830 = 64'd1 << pie_to_x__h13731 ;
  assign mask__h15895 = 64'd1 << pie_from_x__h15859 ;
  assign mask__h15912 = 64'd1 << ie_from_x__h15858 ;
  assign mav_csr_write_csr_addr_ULE_0x33F___d739 =
	     mav_csr_write_csr_addr <= 12'h33F ;
  assign mav_csr_write_csr_addr_ULE_0xB1F___d735 =
	     mav_csr_write_csr_addr <= 12'hB1F ;
  assign mav_csr_write_csr_addr_ULT_0x323_38_OR_NOT_mav_ETC___d951 =
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr != 12'h001 &&
	     mav_csr_write_csr_addr != 12'h002 &&
	     mav_csr_write_csr_addr != 12'h003 &&
	     mav_csr_write_csr_addr != 12'h100 &&
	     mav_csr_write_csr_addr != 12'h102 &&
	     mav_csr_write_csr_addr != 12'h103 &&
	     mav_csr_write_csr_addr != 12'h104 &&
	     mav_csr_write_csr_addr != 12'h105 &&
	     mav_csr_write_csr_addr != 12'h106 &&
	     mav_csr_write_csr_addr != 12'h140 &&
	     mav_csr_write_csr_addr != 12'h141 &&
	     mav_csr_write_csr_addr != 12'h142 &&
	     mav_csr_write_csr_addr != 12'h143 &&
	     mav_csr_write_csr_addr != 12'h144 &&
	     mav_csr_write_csr_addr != 12'h180 &&
	     mav_csr_write_csr_addr != 12'h302 &&
	     mav_csr_write_csr_addr != 12'h303 &&
	     mav_csr_write_csr_addr != 12'hF11 &&
	     mav_csr_write_csr_addr != 12'hF12 &&
	     mav_csr_write_csr_addr != 12'hF13 &&
	     mav_csr_write_csr_addr != 12'hF14 &&
	     mav_csr_write_csr_addr != 12'h300 &&
	     mav_csr_write_csr_addr != 12'h301 &&
	     mav_csr_write_csr_addr != 12'h304 &&
	     mav_csr_write_csr_addr != 12'h305 &&
	     mav_csr_write_csr_addr != 12'h306 &&
	     mav_csr_write_csr_addr != 12'h340 &&
	     mav_csr_write_csr_addr != 12'h341 &&
	     mav_csr_write_csr_addr != 12'h342 &&
	     mav_csr_write_csr_addr != 12'h343 &&
	     mav_csr_write_csr_addr != 12'h344 &&
	     mav_csr_write_csr_addr != 12'hB00 &&
	     mav_csr_write_csr_addr != 12'hB02 &&
	     mav_csr_write_csr_addr != 12'h7A0 &&
	     mav_csr_write_csr_addr != 12'h7A1 &&
	     mav_csr_write_csr_addr != 12'h7A2 &&
	     mav_csr_write_csr_addr != 12'h7A3 ;
  assign mav_csr_write_csr_addr_ULT_0x323___d738 =
	     mav_csr_write_csr_addr < 12'h323 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d1022 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     (mav_csr_write_csr_addr == 12'h001 ||
	      mav_csr_write_csr_addr == 12'h002 ||
	      mav_csr_write_csr_addr == 12'h003) ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d746 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     (mav_csr_write_csr_addr == 12'h001 ||
	      mav_csr_write_csr_addr == 12'h003) ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d755 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     (mav_csr_write_csr_addr == 12'h001 ||
	      mav_csr_write_csr_addr == 12'h002 ||
	      mav_csr_write_csr_addr == 12'h003 ||
	      mav_csr_write_csr_addr == 12'h100 ||
	      mav_csr_write_csr_addr == 12'h300) ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d803 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     (mav_csr_write_csr_addr == 12'h002 ||
	      mav_csr_write_csr_addr == 12'h003) ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d808 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h104 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d810 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h105 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d815 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h140 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d817 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h141 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d821 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h142 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d826 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h143 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d828 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h144 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d830 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h180 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d832 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h302 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d839 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h303 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d842 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h304 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d844 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h305 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d846 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h306 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d848 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h340 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d850 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h341 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d852 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h342 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d854 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h343 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d856 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h344 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d860 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'hB02 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d862 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h7A0 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d864 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h7A1 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d868 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h7A2 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_34_OR_NOT_mav_ETC___d870 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d738 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d739) &&
	     mav_csr_write_csr_addr == 12'h7A3 ;
  assign mav_csr_write_csr_addr_ULT_0xB03___d734 =
	     mav_csr_write_csr_addr < 12'hB03 ;
  assign mav_csr_write_word_BITS_14_TO_13_68_EQ_0x3_69__ETC___d799 =
	     { sd__h9247,
	       40'd5120,
	       (mav_csr_write_csr_addr == 12'h100) ?
		 fixed_up_val_23__h7818 :
		 fixed_up_val_23__h9248 } ;
  assign new_csr_value__h10690 = { 4'd0, mav_csr_write_word[59:0] } ;
  assign new_csr_value__h9962 = { mav_csr_write_word[63:1], 1'd0 } ;
  assign new_priv__h13604 =
	     csr_trap_actions_nmi ?
	       2'b11 :
	       ((csr_trap_actions_from_priv == 2'b11) ?
		  csr_trap_actions_from_priv :
		  _theResult___fst__h13742) ;
  assign pie_from_x__h15859 = { 4'd1, csr_ret_actions_from_priv } ;
  assign pie_to_x__h13731 = { 4'd1, new_priv__h13604 } ;
  assign sd__h11438 = mv_update_mstatus_fs_fs == 2'h3 ;
  assign sd__h11992 = ma_update_mstatus_fs_fs == 2'h3 ;
  assign sd__h13652 =
	     IF_IF_csr_trap_actions_nmi_THEN_0b11_ELSE_IF_c_ETC___d1294[14:13] ==
	     2'h3 ;
  assign sd__h15780 =
	     IF_csr_ret_actions_from_priv_EQ_0b11_476_THEN__ETC___d1496[14:13] ==
	     2'h3 ;
  assign sd__h9247 = mav_csr_write_word[14:13] == 2'h3 ;
  assign to_y__h16074 =
	     { 1'b0,
	       csr_mstatus_rg_mstatus_03_AND_INV_1_SL_0_CONCA_ETC___d1489[8] } ;
  assign v__h10003 =
	     { mav_csr_write_word[63], 59'd0, mav_csr_write_word[3:0] } ;
  assign v__h13609 = { sd__h13652, 40'd5120, fixed_up_val_23__h13653 } ;
  assign v__h7767 =
	     { sd__h9247,
	       43'd8192,
	       mav_csr_write_word[19:18],
	       3'd0,
	       mav_csr_write_word[14:13],
	       4'd0,
	       mav_csr_write_word[8],
	       2'd0,
	       mav_csr_write_word[5],
	       3'd0,
	       mav_csr_write_word[1],
	       1'd0 } ;
  assign v__h9124 =
	     { 48'd0,
	       mav_csr_write_word[15],
	       1'd0,
	       mav_csr_write_word[13:12],
	       2'd0,
	       mav_csr_write_word[9:0] } ;
  assign v__h9160 = { 52'd0, mav_csr_write_word[11:0] } ;
  assign v__h9770 =
	     { mav_csr_write_word[63:2], 1'b0, mav_csr_write_word[0] } ;
  assign val__h13814 = 64'd0 << ie_to_x__h13730 ;
  assign val__h13831 = { 63'd0, b__h13829 } << pie_to_x__h13731 ;
  assign val__h15913 = { 63'd0, b__h15911 } << ie_from_x__h15858 ;
  assign vector_offset__h14794 = { 58'd0, csr_trap_actions_exc_code, 2'd0 } ;
  assign wordxl1__h7197 = { 41'h10000001400, fixed_up_val_23__h7238 } ;
  assign wordxl1__h9207 = { sd__h9247, 40'd5120, fixed_up_val_23__h9248 } ;
  assign x__h12581 =
	     csr_trap_actions_interrupt_AND_NOT_csr_trap_ac_ETC___d1320 ?
	       exc_pc___1__h14867 :
	       exc_pc__h14793 ;
  assign x__h13812 = x__h13842 | val__h13831 ;
  assign x__h13825 = x__h13812 & y__h13826 ;
  assign x__h13842 = csr_mstatus_rg_mstatus & y__h13843 ;
  assign x__h15718 =
	     (csr_trap_actions_nmi || new_priv__h13604 == 2'b11) ?
	       v__h13609 :
	       y_avValue_fst__h14767 ;
  assign x__h15719 =
	     { !csr_trap_actions_nmi && csr_trap_actions_interrupt,
	       59'd0,
	       exc_code__h15560 } ;
  assign x__h15894 = x__h15924 | val__h15913 ;
  assign x__h15907 = x__h15894 & y__h15908 ;
  assign x__h15924 = csr_mstatus_rg_mstatus & y__h15925 ;
  assign x__h5601 =
	     (!mav_csr_write_csr_addr_ULT_0xB03___d734 &&
	      mav_csr_write_csr_addr_ULE_0xB1F___d735 ||
	      !mav_csr_write_csr_addr_ULT_0x323___d738 &&
	      mav_csr_write_csr_addr_ULE_0x33F___d739) ?
	       64'd0 :
	       y_avValue_fst__h11071 ;
  assign y__h13826 = ~mask__h13813 ;
  assign y__h13843 = ~mask__h13830 ;
  assign y__h15908 = ~mask__h15895 ;
  assign y__h15925 = ~mask__h15912 ;
  assign y_avValue_fst__h10831 = { 59'd0, mav_csr_write_word[4:0] } ;
  assign y_avValue_fst__h10836 = { 61'd0, mav_csr_write_word[2:0] } ;
  assign y_avValue_fst__h10841 = { 56'd0, mav_csr_write_word[7:0] } ;
  assign y_avValue_fst__h14750 =
	     { sd__h13652,
	       43'd8192,
	       IF_IF_csr_trap_actions_nmi_THEN_0b11_ELSE_IF_c_ETC___d1294[19:18],
	       3'd0,
	       IF_IF_csr_trap_actions_nmi_THEN_0b11_ELSE_IF_c_ETC___d1294[14:13],
	       4'd0,
	       IF_IF_csr_trap_actions_nmi_THEN_0b11_ELSE_IF_c_ETC___d1294[8],
	       2'd0,
	       IF_IF_csr_trap_actions_nmi_THEN_0b11_ELSE_IF_c_ETC___d1294[5],
	       3'd0,
	       IF_IF_csr_trap_actions_nmi_THEN_0b11_ELSE_IF_c_ETC___d1294[1],
	       1'd0 } ;
  assign y_avValue_fst__h14767 =
	     (new_priv__h13604 == 2'b01) ? y_avValue_fst__h14750 : v__h13609 ;
  assign y_avValue_snd_snd__h14840 =
	     { CASE_new_priv3604_0b1_rg_stvec_BITS_62_TO_1_0b_ETC__q1,
	       2'd0 } ;
  always@(mav_csr_write_csr_addr or
	  mav_csr_write_word or
	  y_avValue_fst__h10831 or
	  y_avValue_fst__h10836 or
	  y_avValue_fst__h10841 or
	  v__h7767 or
	  csr_mie$mav_sie_write or
	  v__h9770 or
	  new_csr_value__h9962 or
	  v__h10003 or
	  csr_mip$mav_sip_write or
	  wordxl1__h9207 or
	  v__h9124 or
	  v__h9160 or
	  csr_mie$mav_write or csr_mip$mav_write or new_csr_value__h10690)
  begin
    case (mav_csr_write_csr_addr)
      12'h001: y_avValue_fst__h11071 = y_avValue_fst__h10831;
      12'h002, 12'h306: y_avValue_fst__h11071 = y_avValue_fst__h10836;
      12'h003: y_avValue_fst__h11071 = y_avValue_fst__h10841;
      12'h100: y_avValue_fst__h11071 = v__h7767;
      12'h102, 12'h103, 12'h106, 12'h7A0, 12'hF11, 12'hF12, 12'hF13, 12'hF14:
	  y_avValue_fst__h11071 = 64'd0;
      12'h104: y_avValue_fst__h11071 = csr_mie$mav_sie_write;
      12'h105, 12'h305: y_avValue_fst__h11071 = v__h9770;
      12'h140, 12'h143, 12'h180, 12'h340, 12'h343, 12'hB00, 12'hB02:
	  y_avValue_fst__h11071 = mav_csr_write_word;
      12'h141, 12'h341: y_avValue_fst__h11071 = new_csr_value__h9962;
      12'h142, 12'h342: y_avValue_fst__h11071 = v__h10003;
      12'h144: y_avValue_fst__h11071 = csr_mip$mav_sip_write;
      12'h300: y_avValue_fst__h11071 = wordxl1__h9207;
      12'h301: y_avValue_fst__h11071 = 64'h800000000014112D;
      12'h302: y_avValue_fst__h11071 = v__h9124;
      12'h303: y_avValue_fst__h11071 = v__h9160;
      12'h304: y_avValue_fst__h11071 = csr_mie$mav_write;
      12'h344: y_avValue_fst__h11071 = csr_mip$mav_write;
      12'h7A1: y_avValue_fst__h11071 = new_csr_value__h10690;
      default: y_avValue_fst__h11071 = mav_csr_write_word;
    endcase
  end
  always@(new_priv__h13604 or rg_mtvec or rg_stvec)
  begin
    case (new_priv__h13604)
      2'b01:
	  CASE_new_priv3604_0b1_rg_stvec_BITS_62_TO_1_0b_ETC__q1 =
	      rg_stvec[62:1];
      2'b11:
	  CASE_new_priv3604_0b1_rg_stvec_BITS_62_TO_1_0b_ETC__q1 =
	      rg_mtvec[62:1];
      default: CASE_new_priv3604_0b1_rg_stvec_BITS_62_TO_1_0b_ETC__q1 =
		   rg_mtvec[62:1];
    endcase
  end
  always@(new_priv__h13604 or rg_mtvec or rg_stvec)
  begin
    case (new_priv__h13604)
      2'b01:
	  CASE_new_priv3604_0b1_rg_stvec_BIT_0_0b11_rg_m_ETC__q2 =
	      rg_stvec[0];
      2'b11:
	  CASE_new_priv3604_0b1_rg_stvec_BIT_0_0b11_rg_m_ETC__q2 =
	      rg_mtvec[0];
      default: CASE_new_priv3604_0b1_rg_stvec_BIT_0_0b11_rg_m_ETC__q2 =
		   rg_mtvec[0];
    endcase
  end
  always@(interrupt_pending_cur_priv or csr_mstatus_rg_mstatus)
  begin
    case (interrupt_pending_cur_priv)
      2'b0:
	  IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1761 =
	      csr_mstatus_rg_mstatus[0];
      2'b01:
	  IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1761 =
	      csr_mstatus_rg_mstatus[1];
      default: IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1761 =
		   interrupt_pending_cur_priv == 2'b11 &&
		   csr_mstatus_rg_mstatus[3];
    endcase
  end
  always@(interrupt_pending_cur_priv or csr_mstatus_rg_mstatus)
  begin
    case (interrupt_pending_cur_priv)
      2'b0:
	  IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1864 =
	      !csr_mstatus_rg_mstatus[0];
      2'b01:
	  IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1864 =
	      !csr_mstatus_rg_mstatus[1];
      default: IF_interrupt_pending_cur_priv_EQ_0b0_754_THEN__ETC___d1864 =
		   interrupt_pending_cur_priv != 2'b11 ||
		   !csr_mstatus_rg_mstatus[3];
    endcase
  end
  always@(read_csr_csr_addr or
	  rg_tdata3 or
	  rg_fflags or
	  rg_frm or
	  csr_mstatus_rg_mstatus or
	  csr_mie$mv_sie_read or
	  rg_stvec or
	  rg_sscratch or
	  rg_sepc or
	  rg_scause or
	  rg_stval or
	  csr_mip$mv_sip_read or
	  rg_satp or
	  rg_medeleg or
	  rg_mideleg or
	  csr_mie$mv_read or
	  rg_mtvec or
	  rg_mcounteren or
	  rg_mscratch or
	  rg_mepc or
	  rg_mcause or
	  rg_mtval or
	  csr_mip$mv_read or
	  rg_tselect or rg_tdata1 or rg_tdata2 or rg_mcycle or rg_minstret)
  begin
    case (read_csr_csr_addr)
      12'h001:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      { 59'd0, rg_fflags };
      12'h002:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      { 61'd0, rg_frm };
      12'h003:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      { 56'd0, rg_frm, rg_fflags };
      12'h100:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      { csr_mstatus_rg_mstatus[63],
		29'd0,
		csr_mstatus_rg_mstatus[33:32],
		12'd0,
		csr_mstatus_rg_mstatus[19:18],
		1'd0,
		csr_mstatus_rg_mstatus[16:13],
		4'd0,
		csr_mstatus_rg_mstatus[8],
		2'd0,
		csr_mstatus_rg_mstatus[5:4],
		2'd0,
		csr_mstatus_rg_mstatus[1:0] };
      12'h102, 12'h103, 12'h106, 12'hF11, 12'hF12, 12'hF13, 12'hF14:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 = 64'd0;
      12'h104:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      csr_mie$mv_sie_read;
      12'h105:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      { rg_stvec[62:1], 1'b0, rg_stvec[0] };
      12'h140:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      rg_sscratch;
      12'h141:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 = rg_sepc;
      12'h142:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      { rg_scause[4], 59'd0, rg_scause[3:0] };
      12'h143:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      rg_stval;
      12'h144:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      csr_mip$mv_sip_read;
      12'h180:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 = rg_satp;
      12'h300:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      csr_mstatus_rg_mstatus;
      12'h301:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      64'h800000000014112D;
      12'h302:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      { 48'd0, rg_medeleg };
      12'h303:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      { 52'd0, rg_mideleg };
      12'h304:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      csr_mie$mv_read;
      12'h305:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      { rg_mtvec[62:1], 1'b0, rg_mtvec[0] };
      12'h306:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      { 61'd0, rg_mcounteren };
      12'h340:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      rg_mscratch;
      12'h341:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 = rg_mepc;
      12'h342:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      { rg_mcause[4], 59'd0, rg_mcause[3:0] };
      12'h343:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      rg_mtval;
      12'h344:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      csr_mip$mv_read;
      12'h7A0:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      rg_tselect;
      12'h7A1:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      rg_tdata1;
      12'h7A2:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      rg_tdata2;
      12'hB00, 12'hC00:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      rg_mcycle;
      12'hB02, 12'hC02:
	  IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
	      rg_minstret;
      default: IF_read_csr_csr_addr_EQ_0x1_0_THEN_0_CONCAT_rg_ETC___d291 =
		   rg_tdata3;
    endcase
  end
  always@(mav_read_csr_csr_addr or
	  rg_tdata3 or
	  rg_fflags or
	  rg_frm or
	  csr_mstatus_rg_mstatus or
	  csr_mie$mv_sie_read or
	  rg_stvec or
	  rg_sscratch or
	  rg_sepc or
	  rg_scause or
	  rg_stval or
	  csr_mip$mv_sip_read or
	  rg_satp or
	  rg_medeleg or
	  rg_mideleg or
	  csr_mie$mv_read or
	  rg_mtvec or
	  rg_mcounteren or
	  rg_mscratch or
	  rg_mepc or
	  rg_mcause or
	  rg_mtval or
	  csr_mip$mv_read or
	  rg_tselect or rg_tdata1 or rg_tdata2 or rg_mcycle or rg_minstret)
  begin
    case (mav_read_csr_csr_addr)
      12'h001:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      { 59'd0, rg_fflags };
      12'h002:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      { 61'd0, rg_frm };
      12'h003:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      { 56'd0, rg_frm, rg_fflags };
      12'h100:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      { csr_mstatus_rg_mstatus[63],
		29'd0,
		csr_mstatus_rg_mstatus[33:32],
		12'd0,
		csr_mstatus_rg_mstatus[19:18],
		1'd0,
		csr_mstatus_rg_mstatus[16:13],
		4'd0,
		csr_mstatus_rg_mstatus[8],
		2'd0,
		csr_mstatus_rg_mstatus[5:4],
		2'd0,
		csr_mstatus_rg_mstatus[1:0] };
      12'h102, 12'h103, 12'h106, 12'hF11, 12'hF12, 12'hF13, 12'hF14:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 = 64'd0;
      12'h104:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      csr_mie$mv_sie_read;
      12'h105:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      { rg_stvec[62:1], 1'b0, rg_stvec[0] };
      12'h140:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      rg_sscratch;
      12'h141:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 = rg_sepc;
      12'h142:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      { rg_scause[4], 59'd0, rg_scause[3:0] };
      12'h143:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      rg_stval;
      12'h144:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      csr_mip$mv_sip_read;
      12'h180:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 = rg_satp;
      12'h300:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      csr_mstatus_rg_mstatus;
      12'h301:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      64'h800000000014112D;
      12'h302:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      { 48'd0, rg_medeleg };
      12'h303:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      { 52'd0, rg_mideleg };
      12'h304:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      csr_mie$mv_read;
      12'h305:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      { rg_mtvec[62:1], 1'b0, rg_mtvec[0] };
      12'h306:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      { 61'd0, rg_mcounteren };
      12'h340:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      rg_mscratch;
      12'h341:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 = rg_mepc;
      12'h342:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      { rg_mcause[4], 59'd0, rg_mcause[3:0] };
      12'h343:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      rg_mtval;
      12'h344:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      csr_mip$mv_read;
      12'h7A0:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      rg_tselect;
      12'h7A1:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      rg_tdata1;
      12'h7A2:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      rg_tdata2;
      12'hB00, 12'hC00:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      rg_mcycle;
      12'hB02, 12'hC02:
	  IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
	      rg_minstret;
      default: IF_mav_read_csr_csr_addr_EQ_0x1_26_THEN_0_CONC_ETC___d731 =
		   rg_tdata3;
    endcase
  end
  always@(read_csr_port2_csr_addr or
	  rg_tdata3 or
	  rg_fflags or
	  rg_frm or
	  csr_mstatus_rg_mstatus or
	  csr_mie$mv_sie_read or
	  rg_stvec or
	  rg_sscratch or
	  rg_sepc or
	  rg_scause or
	  rg_stval or
	  csr_mip$mv_sip_read or
	  rg_satp or
	  rg_medeleg or
	  rg_mideleg or
	  csr_mie$mv_read or
	  rg_mtvec or
	  rg_mcounteren or
	  rg_mscratch or
	  rg_mepc or
	  rg_mcause or
	  rg_mtval or
	  csr_mip$mv_read or
	  rg_tselect or rg_tdata1 or rg_tdata2 or rg_mcycle or rg_minstret)
  begin
    case (read_csr_port2_csr_addr)
      12'h001:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      { 59'd0, rg_fflags };
      12'h002:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      { 61'd0, rg_frm };
      12'h003:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      { 56'd0, rg_frm, rg_fflags };
      12'h100:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      { csr_mstatus_rg_mstatus[63],
		29'd0,
		csr_mstatus_rg_mstatus[33:32],
		12'd0,
		csr_mstatus_rg_mstatus[19:18],
		1'd0,
		csr_mstatus_rg_mstatus[16:13],
		4'd0,
		csr_mstatus_rg_mstatus[8],
		2'd0,
		csr_mstatus_rg_mstatus[5:4],
		2'd0,
		csr_mstatus_rg_mstatus[1:0] };
      12'h102, 12'h103, 12'h106, 12'hF11, 12'hF12, 12'hF13, 12'hF14:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 = 64'd0;
      12'h104:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      csr_mie$mv_sie_read;
      12'h105:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      { rg_stvec[62:1], 1'b0, rg_stvec[0] };
      12'h140:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      rg_sscratch;
      12'h141:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 = rg_sepc;
      12'h142:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      { rg_scause[4], 59'd0, rg_scause[3:0] };
      12'h143:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      rg_stval;
      12'h144:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      csr_mip$mv_sip_read;
      12'h180:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 = rg_satp;
      12'h300:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      csr_mstatus_rg_mstatus;
      12'h301:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      64'h800000000014112D;
      12'h302:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      { 48'd0, rg_medeleg };
      12'h303:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      { 52'd0, rg_mideleg };
      12'h304:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      csr_mie$mv_read;
      12'h305:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      { rg_mtvec[62:1], 1'b0, rg_mtvec[0] };
      12'h306:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      { 61'd0, rg_mcounteren };
      12'h340:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      rg_mscratch;
      12'h341:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 = rg_mepc;
      12'h342:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      { rg_mcause[4], 59'd0, rg_mcause[3:0] };
      12'h343:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      rg_mtval;
      12'h344:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      csr_mip$mv_read;
      12'h7A0:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      rg_tselect;
      12'h7A1:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      rg_tdata1;
      12'h7A2:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      rg_tdata2;
      12'hB00, 12'hC00:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      rg_mcycle;
      12'hB02, 12'hC02:
	  IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
	      rg_minstret;
      default: IF_read_csr_port2_csr_addr_EQ_0x1_06_THEN_0_CO_ETC___d511 =
		   rg_tdata3;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cfg_verbosity <= `BSV_ASSIGNMENT_DELAY 4'd0;
	csr_mstatus_rg_mstatus <= `BSV_ASSIGNMENT_DELAY 64'h0000000A00002000;
	rg_mcycle <= `BSV_ASSIGNMENT_DELAY 64'd0;
	rg_minstret <= `BSV_ASSIGNMENT_DELAY 64'd0;
	rg_nmi <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_state <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (cfg_verbosity$EN)
	  cfg_verbosity <= `BSV_ASSIGNMENT_DELAY cfg_verbosity$D_IN;
	if (csr_mstatus_rg_mstatus$EN)
	  csr_mstatus_rg_mstatus <= `BSV_ASSIGNMENT_DELAY
	      csr_mstatus_rg_mstatus$D_IN;
	if (rg_mcycle$EN) rg_mcycle <= `BSV_ASSIGNMENT_DELAY rg_mcycle$D_IN;
	if (rg_minstret$EN)
	  rg_minstret <= `BSV_ASSIGNMENT_DELAY rg_minstret$D_IN;
	if (rg_nmi$EN) rg_nmi <= `BSV_ASSIGNMENT_DELAY rg_nmi$D_IN;
	if (rg_state$EN) rg_state <= `BSV_ASSIGNMENT_DELAY rg_state$D_IN;
      end
    if (rg_dcsr$EN) rg_dcsr <= `BSV_ASSIGNMENT_DELAY rg_dcsr$D_IN;
    if (rg_dpc$EN) rg_dpc <= `BSV_ASSIGNMENT_DELAY rg_dpc$D_IN;
    if (rg_dscratch0$EN)
      rg_dscratch0 <= `BSV_ASSIGNMENT_DELAY rg_dscratch0$D_IN;
    if (rg_dscratch1$EN)
      rg_dscratch1 <= `BSV_ASSIGNMENT_DELAY rg_dscratch1$D_IN;
    if (rg_fflags$EN) rg_fflags <= `BSV_ASSIGNMENT_DELAY rg_fflags$D_IN;
    if (rg_frm$EN) rg_frm <= `BSV_ASSIGNMENT_DELAY rg_frm$D_IN;
    if (rg_mcause$EN) rg_mcause <= `BSV_ASSIGNMENT_DELAY rg_mcause$D_IN;
    if (rg_mcounteren$EN)
      rg_mcounteren <= `BSV_ASSIGNMENT_DELAY rg_mcounteren$D_IN;
    if (rg_medeleg$EN) rg_medeleg <= `BSV_ASSIGNMENT_DELAY rg_medeleg$D_IN;
    if (rg_mepc$EN) rg_mepc <= `BSV_ASSIGNMENT_DELAY rg_mepc$D_IN;
    if (rg_mideleg$EN) rg_mideleg <= `BSV_ASSIGNMENT_DELAY rg_mideleg$D_IN;
    if (rg_mscratch$EN) rg_mscratch <= `BSV_ASSIGNMENT_DELAY rg_mscratch$D_IN;
    if (rg_mtval$EN) rg_mtval <= `BSV_ASSIGNMENT_DELAY rg_mtval$D_IN;
    if (rg_mtvec$EN) rg_mtvec <= `BSV_ASSIGNMENT_DELAY rg_mtvec$D_IN;
    if (rg_nmi_vector$EN)
      rg_nmi_vector <= `BSV_ASSIGNMENT_DELAY rg_nmi_vector$D_IN;
    if (rg_satp$EN) rg_satp <= `BSV_ASSIGNMENT_DELAY rg_satp$D_IN;
    if (rg_scause$EN) rg_scause <= `BSV_ASSIGNMENT_DELAY rg_scause$D_IN;
    if (rg_sepc$EN) rg_sepc <= `BSV_ASSIGNMENT_DELAY rg_sepc$D_IN;
    if (rg_sscratch$EN) rg_sscratch <= `BSV_ASSIGNMENT_DELAY rg_sscratch$D_IN;
    if (rg_stval$EN) rg_stval <= `BSV_ASSIGNMENT_DELAY rg_stval$D_IN;
    if (rg_stvec$EN) rg_stvec <= `BSV_ASSIGNMENT_DELAY rg_stvec$D_IN;
    if (rg_tdata1$EN) rg_tdata1 <= `BSV_ASSIGNMENT_DELAY rg_tdata1$D_IN;
    if (rg_tdata2$EN) rg_tdata2 <= `BSV_ASSIGNMENT_DELAY rg_tdata2$D_IN;
    if (rg_tdata3$EN) rg_tdata3 <= `BSV_ASSIGNMENT_DELAY rg_tdata3$D_IN;
    if (rg_tselect$EN) rg_tselect <= `BSV_ASSIGNMENT_DELAY rg_tselect$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cfg_verbosity = 4'hA;
    csr_mstatus_rg_mstatus = 64'hAAAAAAAAAAAAAAAA;
    rg_dcsr = 32'hAAAAAAAA;
    rg_dpc = 64'hAAAAAAAAAAAAAAAA;
    rg_dscratch0 = 64'hAAAAAAAAAAAAAAAA;
    rg_dscratch1 = 64'hAAAAAAAAAAAAAAAA;
    rg_fflags = 5'h0A;
    rg_frm = 3'h2;
    rg_mcause = 5'h0A;
    rg_mcounteren = 3'h2;
    rg_mcycle = 64'hAAAAAAAAAAAAAAAA;
    rg_medeleg = 16'hAAAA;
    rg_mepc = 64'hAAAAAAAAAAAAAAAA;
    rg_mideleg = 12'hAAA;
    rg_minstret = 64'hAAAAAAAAAAAAAAAA;
    rg_mscratch = 64'hAAAAAAAAAAAAAAAA;
    rg_mtval = 64'hAAAAAAAAAAAAAAAA;
    rg_mtvec = 63'h2AAAAAAAAAAAAAAA;
    rg_nmi = 1'h0;
    rg_nmi_vector = 64'hAAAAAAAAAAAAAAAA;
    rg_satp = 64'hAAAAAAAAAAAAAAAA;
    rg_scause = 5'h0A;
    rg_sepc = 64'hAAAAAAAAAAAAAAAA;
    rg_sscratch = 64'hAAAAAAAAAAAAAAAA;
    rg_state = 1'h0;
    rg_stval = 64'hAAAAAAAAAAAAAAAA;
    rg_stvec = 63'h2AAAAAAAAAAAAAAA;
    rg_tdata1 = 64'hAAAAAAAAAAAAAAAA;
    rg_tdata2 = 64'hAAAAAAAAAAAAAAAA;
    rg_tdata3 = 64'hAAAAAAAAAAAAAAAA;
    rg_tselect = 64'hAAAAAAAAAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_debug) $display("mstatus = 0x%0h", csr_mstatus_rg_mstatus);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_debug)
	$display("sstatus = 0x%0h",
		 { csr_mstatus_rg_mstatus[63],
		   29'd0,
		   csr_mstatus_rg_mstatus[33:32],
		   12'd0,
		   csr_mstatus_rg_mstatus[19:18],
		   1'd0,
		   csr_mstatus_rg_mstatus[16:13],
		   4'd0,
		   csr_mstatus_rg_mstatus[8],
		   2'd0,
		   csr_mstatus_rg_mstatus[5:4],
		   2'd0,
		   csr_mstatus_rg_mstatus[1:0] });
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_debug) $display("mip     = 0x%0h", csr_mip$mv_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_debug) $display("sip     = 0x%0h", csr_mip$mv_sip_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_debug) $display("mie     = 0x%0h", csr_mie$mv_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_debug) $display("sie     = 0x%0h", csr_mie$mv_sie_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_csr_write &&
	  (mav_csr_write_csr_addr_ULT_0xB03___d734 ||
	   !mav_csr_write_csr_addr_ULE_0xB1F___d735) &&
	  mav_csr_write_csr_addr_ULT_0x323_38_OR_NOT_mav_ETC___d951 &&
	  NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$display("%0d: ERROR: CSR-write addr 0x%0h val 0x%0h not successful",
		 rg_mcycle,
		 mav_csr_write_csr_addr,
		 mav_csr_write_word);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$display("%0d: CSR_Regfile.csr_trap_actions:", rg_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$display("    from priv %0d  pc 0x%0h  interrupt %0d  exc_code %0d  xtval 0x%0h",
		 csr_trap_actions_from_priv,
		 csr_trap_actions_pc,
		 csr_trap_actions_interrupt,
		 csr_trap_actions_exc_code,
		 csr_trap_actions_xtval);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write("    priv %0d: ", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" ip: 0x%0h", csr_mip$mv_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" ie: 0x%0h", csr_mie$mv_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" edeleg: 0x%0h", 16'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" ideleg: 0x%0h", 12'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" cause:");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_scause[4] &&
	  rg_scause[3:0] == 4'd0)
	$write("USER_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_scause[4] &&
	  rg_scause[3:0] == 4'd1)
	$write("SUPERVISOR_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_scause[4] &&
	  rg_scause[3:0] == 4'd2)
	$write("HYPERVISOR_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_scause[4] &&
	  rg_scause[3:0] == 4'd3)
	$write("MACHINE_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_scause[4] &&
	  rg_scause[3:0] == 4'd4)
	$write("USER_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_scause[4] &&
	  rg_scause[3:0] == 4'd5)
	$write("SUPERVISOR_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_scause[4] &&
	  rg_scause[3:0] == 4'd6)
	$write("HYPERVISOR_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_scause[4] &&
	  rg_scause[3:0] == 4'd7)
	$write("MACHINE_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_scause[4] &&
	  rg_scause[3:0] == 4'd8)
	$write("USER_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_scause[4] &&
	  rg_scause[3:0] == 4'd9)
	$write("SUPERVISOR_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_scause[4] &&
	  rg_scause[3:0] == 4'd10)
	$write("HYPERVISOR_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_scause[4] &&
	  rg_scause[3:0] == 4'd11)
	$write("MACHINE_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_scause[4] &&
	  rg_scause[3:0] != 4'd0 &&
	  rg_scause[3:0] != 4'd1 &&
	  rg_scause[3:0] != 4'd2 &&
	  rg_scause[3:0] != 4'd3 &&
	  rg_scause[3:0] != 4'd4 &&
	  rg_scause[3:0] != 4'd5 &&
	  rg_scause[3:0] != 4'd6 &&
	  rg_scause[3:0] != 4'd7 &&
	  rg_scause[3:0] != 4'd8 &&
	  rg_scause[3:0] != 4'd9 &&
	  rg_scause[3:0] != 4'd10 &&
	  rg_scause[3:0] != 4'd11)
	$write("unknown interrupt Exc_Code %d", rg_scause[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_scause[4] &&
	  rg_scause[3:0] == 4'd0)
	$write("INSTRUCTION_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_scause[4] &&
	  rg_scause[3:0] == 4'd1)
	$write("INSTRUCTION_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_scause[4] &&
	  rg_scause[3:0] == 4'd2)
	$write("ILLEGAL_INSTRUCTION");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_scause[4] &&
	  rg_scause[3:0] == 4'd3)
	$write("BREAKPOINT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_scause[4] &&
	  rg_scause[3:0] == 4'd4)
	$write("LOAD_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_scause[4] &&
	  rg_scause[3:0] == 4'd5)
	$write("LOAD_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_scause[4] &&
	  rg_scause[3:0] == 4'd6)
	$write("STORE_AMO_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_scause[4] &&
	  rg_scause[3:0] == 4'd7)
	$write("STORE_AMO_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_scause[4] &&
	  rg_scause[3:0] == 4'd8)
	$write("ECALL_FROM_U");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_scause[4] &&
	  rg_scause[3:0] == 4'd9)
	$write("ECALL_FROM_S");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_scause[4] &&
	  rg_scause[3:0] == 4'd11)
	$write("ECALL_FROM_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_scause[4] &&
	  rg_scause[3:0] == 4'd12)
	$write("INSTRUCTION_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_scause[4] &&
	  rg_scause[3:0] == 4'd13)
	$write("LOAD_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_scause[4] &&
	  rg_scause[3:0] == 4'd15)
	$write("STORE_AMO_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_scause[4] &&
	  rg_scause[3:0] != 4'd0 &&
	  rg_scause[3:0] != 4'd1 &&
	  rg_scause[3:0] != 4'd2 &&
	  rg_scause[3:0] != 4'd3 &&
	  rg_scause[3:0] != 4'd4 &&
	  rg_scause[3:0] != 4'd5 &&
	  rg_scause[3:0] != 4'd6 &&
	  rg_scause[3:0] != 4'd7 &&
	  rg_scause[3:0] != 4'd8 &&
	  rg_scause[3:0] != 4'd9 &&
	  rg_scause[3:0] != 4'd11 &&
	  rg_scause[3:0] != 4'd12 &&
	  rg_scause[3:0] != 4'd13 &&
	  rg_scause[3:0] != 4'd15)
	$write("unknown trap Exc_Code %d", rg_scause[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" status: 0x%0h",
	       { csr_mstatus_rg_mstatus[63],
		 29'd0,
		 csr_mstatus_rg_mstatus[33:32],
		 12'd0,
		 csr_mstatus_rg_mstatus[19:18],
		 1'd0,
		 csr_mstatus_rg_mstatus[16:13],
		 4'd0,
		 csr_mstatus_rg_mstatus[8],
		 2'd0,
		 csr_mstatus_rg_mstatus[5:4],
		 2'd0,
		 csr_mstatus_rg_mstatus[1:0] });
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" tvec: 0x%0h", { rg_stvec[62:1], 1'b0, rg_stvec[0] });
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" epc: 0x%0h", rg_sepc);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" tval: 0x%0h", rg_stval);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write("    priv %0d: ", 2'b11);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" ip: 0x%0h", csr_mip$mv_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" ie: 0x%0h", csr_mie$mv_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" edeleg: 0x%0h", rg_medeleg);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" ideleg: 0x%0h", rg_mideleg);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" cause:");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd0)
	$write("USER_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd1)
	$write("SUPERVISOR_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd2)
	$write("HYPERVISOR_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd3)
	$write("MACHINE_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd4)
	$write("USER_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd5)
	$write("SUPERVISOR_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd6)
	$write("HYPERVISOR_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd7)
	$write("MACHINE_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd8)
	$write("USER_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd9)
	$write("SUPERVISOR_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd10)
	$write("HYPERVISOR_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd11)
	$write("MACHINE_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] != 4'd0 &&
	  rg_mcause[3:0] != 4'd1 &&
	  rg_mcause[3:0] != 4'd2 &&
	  rg_mcause[3:0] != 4'd3 &&
	  rg_mcause[3:0] != 4'd4 &&
	  rg_mcause[3:0] != 4'd5 &&
	  rg_mcause[3:0] != 4'd6 &&
	  rg_mcause[3:0] != 4'd7 &&
	  rg_mcause[3:0] != 4'd8 &&
	  rg_mcause[3:0] != 4'd9 &&
	  rg_mcause[3:0] != 4'd10 &&
	  rg_mcause[3:0] != 4'd11)
	$write("unknown interrupt Exc_Code %d", rg_mcause[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd0)
	$write("INSTRUCTION_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd1)
	$write("INSTRUCTION_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd2)
	$write("ILLEGAL_INSTRUCTION");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd3)
	$write("BREAKPOINT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd4)
	$write("LOAD_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd5)
	$write("LOAD_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd6)
	$write("STORE_AMO_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd7)
	$write("STORE_AMO_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd8)
	$write("ECALL_FROM_U");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd9)
	$write("ECALL_FROM_S");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd11)
	$write("ECALL_FROM_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd12)
	$write("INSTRUCTION_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd13)
	$write("LOAD_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd15)
	$write("STORE_AMO_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] != 4'd0 &&
	  rg_mcause[3:0] != 4'd1 &&
	  rg_mcause[3:0] != 4'd2 &&
	  rg_mcause[3:0] != 4'd3 &&
	  rg_mcause[3:0] != 4'd4 &&
	  rg_mcause[3:0] != 4'd5 &&
	  rg_mcause[3:0] != 4'd6 &&
	  rg_mcause[3:0] != 4'd7 &&
	  rg_mcause[3:0] != 4'd8 &&
	  rg_mcause[3:0] != 4'd9 &&
	  rg_mcause[3:0] != 4'd11 &&
	  rg_mcause[3:0] != 4'd12 &&
	  rg_mcause[3:0] != 4'd13 &&
	  rg_mcause[3:0] != 4'd15)
	$write("unknown trap Exc_Code %d", rg_mcause[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" status: 0x%0h", csr_mstatus_rg_mstatus);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" tvec: 0x%0h", { rg_mtvec[62:1], 1'b0, rg_mtvec[0] });
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" epc: 0x%0h", rg_mepc);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" tval: 0x%0h", rg_mtval);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write("    Return: new pc 0x%0h  ", x__h12581);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" new mstatus:");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write("MStatus{",
	       "sd:%0d",
	       x__h15718[14:13] == 2'h3 || x__h15718[16:15] == 2'h3);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" sxl:%0d uxl:%0d", x__h15718[35:34], x__h15718[33:32]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" tsr:%0d", x__h15718[22]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" tw:%0d", x__h15718[21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" tvm:%0d", x__h15718[20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" mxr:%0d", x__h15718[19]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" sum:%0d", x__h15718[18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" mprv:%0d", x__h15718[17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" xs:%0d", x__h15718[16:15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" fs:%0d", x__h15718[14:13]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" mpp:%0d", x__h15718[12:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" spp:%0d", x__h15718[8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" pies:%0d_%0d%0d", x__h15718[7], x__h15718[5], x__h15718[4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" ies:%0d_%0d%0d", x__h15718[3], x__h15718[1], x__h15718[0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" new xcause:");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h15560 == 4'd0)
	$write("USER_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h15560 == 4'd1)
	$write("SUPERVISOR_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h15560 == 4'd2)
	$write("HYPERVISOR_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h15560 == 4'd3)
	$write("MACHINE_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h15560 == 4'd4)
	$write("USER_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h15560 == 4'd5)
	$write("SUPERVISOR_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h15560 == 4'd6)
	$write("HYPERVISOR_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h15560 == 4'd7)
	$write("MACHINE_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h15560 == 4'd8)
	$write("USER_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h15560 == 4'd9)
	$write("SUPERVISOR_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h15560 == 4'd10)
	$write("HYPERVISOR_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h15560 == 4'd11)
	$write("MACHINE_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  NOT_csr_trap_actions_nmi_311_AND_csr_trap_acti_ETC___d1421)
	$write("unknown interrupt Exc_Code %d", exc_code__h15560);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h15560 == 4'd0)
	$write("INSTRUCTION_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h15560 == 4'd1)
	$write("INSTRUCTION_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h15560 == 4'd2)
	$write("ILLEGAL_INSTRUCTION");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h15560 == 4'd3)
	$write("BREAKPOINT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h15560 == 4'd4)
	$write("LOAD_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h15560 == 4'd5)
	$write("LOAD_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h15560 == 4'd6)
	$write("STORE_AMO_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h15560 == 4'd7)
	$write("STORE_AMO_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h15560 == 4'd8)
	$write("ECALL_FROM_U");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h15560 == 4'd9)
	$write("ECALL_FROM_S");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h15560 == 4'd11)
	$write("ECALL_FROM_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h15560 == 4'd12)
	$write("INSTRUCTION_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h15560 == 4'd13)
	$write("LOAD_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h15560 == 4'd15)
	$write("STORE_AMO_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955 &&
	  csr_trap_actions_nmi_OR_NOT_csr_trap_actions_i_ETC___d1472)
	$write("unknown trap Exc_Code %d", exc_code__h15560);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$write(" new priv %0d", new_priv__h13604);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$display("%0d: CSR_RegFile: m_external_interrupt_req: %x",
		 rg_mcycle,
		 m_external_interrupt_req_set_not_clear);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$display("%0d: CSR_RegFile: s_external_interrupt_req: %x",
		 rg_mcycle,
		 s_external_interrupt_req_set_not_clear);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$display("%0d: CSR_RegFile: timer_interrupt_req: %x",
		 rg_mcycle,
		 timer_interrupt_req_set_not_clear);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_cfg_verbosity_read__53_ULE_1_54___d955)
	$display("%0d: CSR_RegFile: software_interrupt_req: %x",
		 rg_mcycle,
		 software_interrupt_req_set_not_clear);
  end
  // synopsys translate_on
endmodule