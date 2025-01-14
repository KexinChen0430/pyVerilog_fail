module outputs
  wire [97 : 0] csr_trap_actions;
  wire [65 : 0] csr_ret_actions;
  wire [64 : 0] mav_csr_write;
  wire [63 : 0] read_csr_mcycle, read_csr_minstret, read_csr_mtime;
  wire [32 : 0] mav_read_csr, read_csr, read_csr_port2;
  wire [31 : 0] csr_mip_read, read_mstatus, read_satp, read_ustatus;
  wire [27 : 0] read_misa;
  wire [4 : 0] interrupt_pending;
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
  reg [31 : 0] csr_mstatus_rg_mstatus;
  reg [31 : 0] csr_mstatus_rg_mstatus$D_IN;
  wire csr_mstatus_rg_mstatus$EN;
  // register rg_dcsr
  reg [31 : 0] rg_dcsr;
  wire [31 : 0] rg_dcsr$D_IN;
  wire rg_dcsr$EN;
  // register rg_dpc
  reg [31 : 0] rg_dpc;
  wire [31 : 0] rg_dpc$D_IN;
  wire rg_dpc$EN;
  // register rg_dscratch0
  reg [31 : 0] rg_dscratch0;
  wire [31 : 0] rg_dscratch0$D_IN;
  wire rg_dscratch0$EN;
  // register rg_dscratch1
  reg [31 : 0] rg_dscratch1;
  wire [31 : 0] rg_dscratch1$D_IN;
  wire rg_dscratch1$EN;
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
  // register rg_mepc
  reg [31 : 0] rg_mepc;
  wire [31 : 0] rg_mepc$D_IN;
  wire rg_mepc$EN;
  // register rg_minstret
  reg [63 : 0] rg_minstret;
  wire [63 : 0] rg_minstret$D_IN;
  wire rg_minstret$EN;
  // register rg_mscratch
  reg [31 : 0] rg_mscratch;
  wire [31 : 0] rg_mscratch$D_IN;
  wire rg_mscratch$EN;
  // register rg_mtval
  reg [31 : 0] rg_mtval;
  wire [31 : 0] rg_mtval$D_IN;
  wire rg_mtval$EN;
  // register rg_mtvec
  reg [30 : 0] rg_mtvec;
  wire [30 : 0] rg_mtvec$D_IN;
  wire rg_mtvec$EN;
  // register rg_nmi
  reg rg_nmi;
  wire rg_nmi$D_IN, rg_nmi$EN;
  // register rg_nmi_vector
  reg [31 : 0] rg_nmi_vector;
  wire [31 : 0] rg_nmi_vector$D_IN;
  wire rg_nmi_vector$EN;
  // register rg_state
  reg rg_state;
  wire rg_state$D_IN, rg_state$EN;
  // register rg_tdata1
  reg [31 : 0] rg_tdata1;
  wire [31 : 0] rg_tdata1$D_IN;
  wire rg_tdata1$EN;
  // register rg_tdata2
  reg [31 : 0] rg_tdata2;
  wire [31 : 0] rg_tdata2$D_IN;
  wire rg_tdata2$EN;
  // register rg_tdata3
  reg [31 : 0] rg_tdata3;
  wire [31 : 0] rg_tdata3$D_IN;
  wire rg_tdata3$EN;
  // register rg_tselect
  reg [31 : 0] rg_tselect;
  wire [31 : 0] rg_tselect$D_IN;
  wire rg_tselect$EN;
  // ports of submodule csr_mie
  wire [31 : 0] csr_mie$mav_write, csr_mie$mav_write_wordxl, csr_mie$mv_read;
  wire [27 : 0] csr_mie$mav_write_misa;
  wire csr_mie$EN_mav_write, csr_mie$EN_reset;
  // ports of submodule csr_mip
  wire [31 : 0] csr_mip$mav_write, csr_mip$mav_write_wordxl, csr_mip$mv_read;
  wire [27 : 0] csr_mip$mav_write_misa;
  wire csr_mip$EN_mav_write,
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
       WILL_FIRE_mav_csr_write,
       WILL_FIRE_mav_read_csr,
       WILL_FIRE_nmi_req,
       WILL_FIRE_s_external_interrupt_req,
       WILL_FIRE_server_reset_request_put,
       WILL_FIRE_server_reset_response_get,
       WILL_FIRE_software_interrupt_req,
       WILL_FIRE_timer_interrupt_req;
  // inputs to muxes for submodule ports
  wire [63 : 0] MUX_rg_minstret$write_1__VAL_1,
		MUX_rg_minstret$write_1__VAL_2,
		MUX_rw_minstret$wset_1__VAL_1;
  wire [31 : 0] MUX_csr_mstatus_rg_mstatus$write_1__VAL_3;
  wire [30 : 0] MUX_rg_mtvec$write_1__VAL_1, MUX_rg_mtvec$write_1__VAL_2;
  wire [4 : 0] MUX_rg_mcause$write_1__VAL_2, MUX_rg_mcause$write_1__VAL_3;
  wire MUX_csr_mstatus_rg_mstatus$write_1__SEL_2,
       MUX_rg_mcause$write_1__SEL_2,
       MUX_rg_mcounteren$write_1__SEL_1,
       MUX_rg_mepc$write_1__SEL_1,
       MUX_rg_mtval$write_1__SEL_1,
       MUX_rg_mtvec$write_1__SEL_1,
       MUX_rg_state$write_1__SEL_2,
       MUX_rg_tdata1$write_1__SEL_1,
       MUX_rw_minstret$wset_1__SEL_1;
  // remaining internal signals
  reg [31 : 0] IF_mav_csr_write_csr_addr_EQ_0x300_88_THEN_0_C_ETC___d767,
	       IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571,
	       IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217,
	       IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394;
  wire [63 : 0] x__h5159, x__h5267;
  wire [33 : 0] IF_csr_ret_actions_from_priv_EQ_0b11_028_THEN__ETC___d1067;
  wire [31 : 0] IF_csr_ret_actions_from_priv_EQ_0b11_028_THEN__ETC___d1049,
		_theResult___fst__h8213,
		_theResult___fst__h8414,
		csr_mstatus_rg_mstatus_76_AND_INV_1_SL_0_CONCA_ETC___d1042,
		exc_pc___1__h7298,
		exc_pc__h7034,
		exc_pc__h7245,
		mask__h8234,
		mask__h8251,
		new_csr_value__h4686,
		new_csr_value__h5342,
		v__h4494,
		v__h4556,
		v__h4727,
		val__h8252,
		vector_offset__h7246,
		wordxl1__h4023,
		x__h3817,
		x__h5845,
		x__h8069,
		x__h8070,
		x__h8233,
		x__h8246,
		x__h8263,
		y__h8247,
		y__h8264;
  wire [22 : 0] fixed_up_val_23__h4064,
		fixed_up_val_23__h6473,
		fixed_up_val_23__h8132;
  wire [5 : 0] ie_from_x__h8197, pie_from_x__h8198;
  wire [3 : 0] IF_NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_N_ETC___d1369,
	       IF_NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_N_ETC___d1371,
	       IF_NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_N_ETC___d1373,
	       IF_NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_N_ETC___d1375,
	       exc_code__h7911;
  wire [1 : 0] mpp__h7339, to_y__h8413;
  wire NOT_access_permitted_1_csr_addr_ULT_0xC03_068__ETC___d1154,
       NOT_access_permitted_2_csr_addr_ULT_0xC03_159__ETC___d1244,
       NOT_cfg_verbosity_read__29_ULE_1_30___d731,
       NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1333,
       NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1338,
       NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1343,
       NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1348,
       NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1353,
       NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1358,
       NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1363,
       NOT_csr_trap_actions_nmi_96_AND_csr_trap_actio_ETC___d973,
       NOT_mav_csr_write_csr_addr_ULT_0xB03_74_33_AND_ETC___d744,
       b__h8250,
       csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1287,
       csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1292,
       csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1297,
       csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1302,
       csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1307,
       csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1312,
       csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1317,
       csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1322,
       csr_trap_actions_nmi_OR_NOT_csr_trap_actions_i_ETC___d1024,
       mav_csr_write_csr_addr_ULE_0x33F___d583,
       mav_csr_write_csr_addr_ULE_0xB1F___d575,
       mav_csr_write_csr_addr_ULE_0xB9F___d579,
       mav_csr_write_csr_addr_ULT_0x323_82_OR_NOT_mav_ETC___d726,
       mav_csr_write_csr_addr_ULT_0x323___d582,
       mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587,
       mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d640,
       mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d728,
       mav_csr_write_csr_addr_ULT_0xB03___d574,
       mav_csr_write_csr_addr_ULT_0xB83___d578;
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
	       read_csr_csr_addr >= 12'hC83 && read_csr_csr_addr <= 12'hC9F ||
	       read_csr_csr_addr >= 12'hB03 && read_csr_csr_addr <= 12'hB1F ||
	       read_csr_csr_addr >= 12'hB83 && read_csr_csr_addr <= 12'hB9F ||
	       read_csr_csr_addr >= 12'h323 && read_csr_csr_addr <= 12'h33F ||
	       read_csr_csr_addr == 12'hC00 ||
	       read_csr_csr_addr == 12'hC02 ||
	       read_csr_csr_addr == 12'hC80 ||
	       read_csr_csr_addr == 12'hC82 ||
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
	       read_csr_csr_addr == 12'hB80 ||
	       read_csr_csr_addr == 12'hB82 ||
	       read_csr_csr_addr == 12'h7A0 ||
	       read_csr_csr_addr == 12'h7A1 ||
	       read_csr_csr_addr == 12'h7A2 ||
	       read_csr_csr_addr == 12'h7A3,
	       (read_csr_csr_addr >= 12'hC03 &&
		read_csr_csr_addr <= 12'hC1F ||
		read_csr_csr_addr >= 12'hC83 &&
		read_csr_csr_addr <= 12'hC9F ||
		read_csr_csr_addr >= 12'hB03 &&
		read_csr_csr_addr <= 12'hB1F ||
		read_csr_csr_addr >= 12'hB83 &&
		read_csr_csr_addr <= 12'hB9F ||
		read_csr_csr_addr >= 12'h323 &&
		read_csr_csr_addr <= 12'h33F) ?
		 32'd0 :
		 IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 } ;
  // value method read_csr_port2
  assign read_csr_port2 =
	     { read_csr_port2_csr_addr >= 12'hC03 &&
	       read_csr_port2_csr_addr <= 12'hC1F ||
	       read_csr_port2_csr_addr >= 12'hC83 &&
	       read_csr_port2_csr_addr <= 12'hC9F ||
	       read_csr_port2_csr_addr >= 12'hB03 &&
	       read_csr_port2_csr_addr <= 12'hB1F ||
	       read_csr_port2_csr_addr >= 12'hB83 &&
	       read_csr_port2_csr_addr <= 12'hB9F ||
	       read_csr_port2_csr_addr >= 12'h323 &&
	       read_csr_port2_csr_addr <= 12'h33F ||
	       read_csr_port2_csr_addr == 12'hC00 ||
	       read_csr_port2_csr_addr == 12'hC02 ||
	       read_csr_port2_csr_addr == 12'hC80 ||
	       read_csr_port2_csr_addr == 12'hC82 ||
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
	       read_csr_port2_csr_addr == 12'hB80 ||
	       read_csr_port2_csr_addr == 12'hB82 ||
	       read_csr_port2_csr_addr == 12'h7A0 ||
	       read_csr_port2_csr_addr == 12'h7A1 ||
	       read_csr_port2_csr_addr == 12'h7A2 ||
	       read_csr_port2_csr_addr == 12'h7A3,
	       (read_csr_port2_csr_addr >= 12'hC03 &&
		read_csr_port2_csr_addr <= 12'hC1F ||
		read_csr_port2_csr_addr >= 12'hC83 &&
		read_csr_port2_csr_addr <= 12'hC9F ||
		read_csr_port2_csr_addr >= 12'hB03 &&
		read_csr_port2_csr_addr <= 12'hB1F ||
		read_csr_port2_csr_addr >= 12'hB83 &&
		read_csr_port2_csr_addr <= 12'hB9F ||
		read_csr_port2_csr_addr >= 12'h323 &&
		read_csr_port2_csr_addr <= 12'h33F) ?
		 32'd0 :
		 IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 } ;
  // actionvalue method mav_read_csr
  assign mav_read_csr =
	     { mav_read_csr_csr_addr >= 12'hC03 &&
	       mav_read_csr_csr_addr <= 12'hC1F ||
	       mav_read_csr_csr_addr >= 12'hC83 &&
	       mav_read_csr_csr_addr <= 12'hC9F ||
	       mav_read_csr_csr_addr >= 12'hB03 &&
	       mav_read_csr_csr_addr <= 12'hB1F ||
	       mav_read_csr_csr_addr >= 12'hB83 &&
	       mav_read_csr_csr_addr <= 12'hB9F ||
	       mav_read_csr_csr_addr >= 12'h323 &&
	       mav_read_csr_csr_addr <= 12'h33F ||
	       mav_read_csr_csr_addr == 12'hC00 ||
	       mav_read_csr_csr_addr == 12'hC02 ||
	       mav_read_csr_csr_addr == 12'hC80 ||
	       mav_read_csr_csr_addr == 12'hC82 ||
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
	       mav_read_csr_csr_addr == 12'hB80 ||
	       mav_read_csr_csr_addr == 12'hB82 ||
	       mav_read_csr_csr_addr == 12'h7A0 ||
	       mav_read_csr_csr_addr == 12'h7A1 ||
	       mav_read_csr_csr_addr == 12'h7A2 ||
	       mav_read_csr_csr_addr == 12'h7A3,
	       (mav_read_csr_csr_addr >= 12'hC03 &&
		mav_read_csr_csr_addr <= 12'hC1F ||
		mav_read_csr_csr_addr >= 12'hC83 &&
		mav_read_csr_csr_addr <= 12'hC9F ||
		mav_read_csr_csr_addr >= 12'hB03 &&
		mav_read_csr_csr_addr <= 12'hB1F ||
		mav_read_csr_csr_addr >= 12'hB83 &&
		mav_read_csr_csr_addr <= 12'hB9F ||
		mav_read_csr_csr_addr >= 12'h323 &&
		mav_read_csr_csr_addr <= 12'h33F) ?
		 32'd0 :
		 IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 } ;
  assign CAN_FIRE_mav_read_csr = 1'd1 ;
  assign WILL_FIRE_mav_read_csr = EN_mav_read_csr ;
  // actionvalue method mav_csr_write
  assign mav_csr_write = { x__h3817, 33'h0AAAAAAAA } ;
  assign CAN_FIRE_mav_csr_write = 1'd1 ;
  assign WILL_FIRE_mav_csr_write = EN_mav_csr_write ;
  // value method read_misa
  assign read_misa = 28'd68157700 ;
  // value method read_mstatus
  assign read_mstatus = csr_mstatus_rg_mstatus ;
  // value method read_ustatus
  assign read_ustatus =
	     { 27'd0,
	       csr_mstatus_rg_mstatus[4],
	       3'd0,
	       csr_mstatus_rg_mstatus[0] } ;
  // value method read_satp
  assign read_satp = 32'hAAAAAAAA ;
  // actionvalue method csr_trap_actions
  assign csr_trap_actions = { x__h5845, x__h8069, x__h8070, 2'b11 } ;
  assign RDY_csr_trap_actions = 1'd1 ;
  assign CAN_FIRE_csr_trap_actions = 1'd1 ;
  assign WILL_FIRE_csr_trap_actions = EN_csr_trap_actions ;
  // actionvalue method csr_ret_actions
  assign csr_ret_actions =
	     { rg_mepc,
	       IF_csr_ret_actions_from_priv_EQ_0b11_028_THEN__ETC___d1067 } ;
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
	     NOT_access_permitted_1_csr_addr_ULT_0xC03_068__ETC___d1154 &&
	     (access_permitted_1_read_not_write ||
	      access_permitted_1_csr_addr[11:10] != 2'b11) ;
  // value method access_permitted_2
  assign access_permitted_2 =
	     NOT_access_permitted_2_csr_addr_ULT_0xC03_159__ETC___d1244 &&
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
	      csr_counter_read_fault_csr_addr <= 12'hC1F ||
	      csr_counter_read_fault_csr_addr >= 12'hC83 &&
	      csr_counter_read_fault_csr_addr <= 12'hC9F) ;
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
	     { csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1322,
	       NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1363 ?
		 4'd4 :
		 IF_NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_N_ETC___d1375 } ;
  // value method wfi_resume
  assign wfi_resume = (csr_mip$mv_read & csr_mie$mv_read) != 32'd0 ;
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
		    .mav_write_misa(csr_mie$mav_write_misa),
		    .mav_write_wordxl(csr_mie$mav_write_wordxl),
		    .EN_reset(csr_mie$EN_reset),
		    .EN_mav_write(csr_mie$EN_mav_write),
		    .mv_read(csr_mie$mv_read),
		    .mav_write(csr_mie$mav_write));
  // submodule csr_mip
  mkCSR_MIP csr_mip(.CLK(CLK),
		    .RST_N(RST_N),
		    .m_external_interrupt_req_req(csr_mip$m_external_interrupt_req_req),
		    .mav_write_misa(csr_mip$mav_write_misa),
		    .mav_write_wordxl(csr_mip$mav_write_wordxl),
		    .s_external_interrupt_req_req(csr_mip$s_external_interrupt_req_req),
		    .software_interrupt_req_req(csr_mip$software_interrupt_req_req),
		    .timer_interrupt_req_req(csr_mip$timer_interrupt_req_req),
		    .EN_reset(csr_mip$EN_reset),
		    .EN_mav_write(csr_mip$EN_mav_write),
		    .mv_read(csr_mip$mv_read),
		    .mav_write(csr_mip$mav_write));
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
  assign MUX_csr_mstatus_rg_mstatus$write_1__SEL_2 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h300 ;
  assign MUX_rg_mcause$write_1__SEL_2 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h342 ;
  assign MUX_rg_mcounteren$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h306 ;
  assign MUX_rg_mepc$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h341 ;
  assign MUX_rg_mtval$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h343 ;
  assign MUX_rg_mtvec$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h305 ;
  assign MUX_rg_state$write_1__SEL_2 =
	     CAN_FIRE_RL_rl_reset_start && !EN_mav_csr_write ;
  assign MUX_rg_tdata1$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h7A1 ;
  assign MUX_rw_minstret$wset_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d640 &&
	     (mav_csr_write_csr_addr == 12'hB02 ||
	      mav_csr_write_csr_addr == 12'hB82) ;
  assign MUX_csr_mstatus_rg_mstatus$write_1__VAL_3 =
	     { 9'd0, fixed_up_val_23__h8132 } ;
  assign MUX_rg_mcause$write_1__VAL_2 =
	     { mav_csr_write_word[31], mav_csr_write_word[3:0] } ;
  assign MUX_rg_mcause$write_1__VAL_3 =
	     { !csr_trap_actions_nmi && csr_trap_actions_interrupt,
	       exc_code__h7911 } ;
  assign MUX_rg_minstret$write_1__VAL_1 =
	     MUX_rw_minstret$wset_1__SEL_1 ?
	       MUX_rw_minstret$wset_1__VAL_1 :
	       64'd0 ;
  assign MUX_rg_minstret$write_1__VAL_2 = rg_minstret + 64'd1 ;
  assign MUX_rg_mtvec$write_1__VAL_1 =
	     { mav_csr_write_word[31:2], mav_csr_write_word[0] } ;
  assign MUX_rg_mtvec$write_1__VAL_2 =
	     { soc_map$m_mtvec_reset_value[31:2],
	       soc_map$m_mtvec_reset_value[0] } ;
  assign MUX_rw_minstret$wset_1__VAL_1 =
	     (mav_csr_write_csr_addr == 12'hB02) ? x__h5159 : x__h5267 ;
  // register cfg_verbosity
  assign cfg_verbosity$D_IN = 4'h0 ;
  assign cfg_verbosity$EN = 1'b0 ;
  // register csr_mstatus_rg_mstatus
  always@(WILL_FIRE_RL_rl_reset_start or
	  MUX_csr_mstatus_rg_mstatus$write_1__SEL_2 or
	  wordxl1__h4023 or
	  EN_csr_ret_actions or
	  MUX_csr_mstatus_rg_mstatus$write_1__VAL_3 or
	  EN_csr_trap_actions or x__h8069)
  case (1'b1)
    WILL_FIRE_RL_rl_reset_start: csr_mstatus_rg_mstatus$D_IN = 32'd0;
    MUX_csr_mstatus_rg_mstatus$write_1__SEL_2:
	csr_mstatus_rg_mstatus$D_IN = wordxl1__h4023;
    EN_csr_ret_actions:
	csr_mstatus_rg_mstatus$D_IN =
	    MUX_csr_mstatus_rg_mstatus$write_1__VAL_3;
    EN_csr_trap_actions: csr_mstatus_rg_mstatus$D_IN = x__h8069;
    default: csr_mstatus_rg_mstatus$D_IN =
		 32'hAAAAAAAA /* unspecified value */ ;
  endcase
  assign csr_mstatus_rg_mstatus$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h300 ||
	     EN_csr_trap_actions ||
	     EN_csr_ret_actions ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_dcsr
  assign rg_dcsr$D_IN = 32'h0 ;
  assign rg_dcsr$EN = 1'b0 ;
  // register rg_dpc
  assign rg_dpc$D_IN = 32'h0 ;
  assign rg_dpc$EN = 1'b0 ;
  // register rg_dscratch0
  assign rg_dscratch0$D_IN = 32'h0 ;
  assign rg_dscratch0$EN = 1'b0 ;
  // register rg_dscratch1
  assign rg_dscratch1$D_IN = 32'h0 ;
  assign rg_dscratch1$EN = 1'b0 ;
  // register rg_mcause
  always@(WILL_FIRE_RL_rl_reset_start or
	  MUX_rg_mcause$write_1__SEL_2 or
	  MUX_rg_mcause$write_1__VAL_2 or
	  EN_csr_trap_actions or MUX_rg_mcause$write_1__VAL_3)
  case (1'b1)
    WILL_FIRE_RL_rl_reset_start: rg_mcause$D_IN = 5'd0;
    MUX_rg_mcause$write_1__SEL_2:
	rg_mcause$D_IN = MUX_rg_mcause$write_1__VAL_2;
    EN_csr_trap_actions: rg_mcause$D_IN = MUX_rg_mcause$write_1__VAL_3;
    default: rg_mcause$D_IN = 5'b01010 /* unspecified value */ ;
  endcase
  assign rg_mcause$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h342 ||
	     EN_csr_trap_actions ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_mcounteren
  assign rg_mcounteren$D_IN =
	     MUX_rg_mcounteren$write_1__SEL_1 ?
	       mav_csr_write_word[2:0] :
	       3'd0 ;
  assign rg_mcounteren$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h306 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_mcycle
  assign rg_mcycle$D_IN = rg_mcycle + 64'd1 ;
  assign rg_mcycle$EN = 1'd1 ;
  // register rg_mepc
  assign rg_mepc$D_IN =
	     MUX_rg_mepc$write_1__SEL_1 ?
	       new_csr_value__h4686 :
	       csr_trap_actions_pc ;
  assign rg_mepc$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h341 ||
	     EN_csr_trap_actions ;
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
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h340 ;
  // register rg_mtval
  assign rg_mtval$D_IN =
	     MUX_rg_mtval$write_1__SEL_1 ?
	       mav_csr_write_word :
	       csr_trap_actions_xtval ;
  assign rg_mtval$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h343 ||
	     EN_csr_trap_actions ;
  // register rg_mtvec
  assign rg_mtvec$D_IN =
	     MUX_rg_mtvec$write_1__SEL_1 ?
	       MUX_rg_mtvec$write_1__VAL_1 :
	       MUX_rg_mtvec$write_1__VAL_2 ;
  assign rg_mtvec$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h305 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_nmi
  assign rg_nmi$D_IN = !WILL_FIRE_RL_rl_reset_start && nmi_req_set_not_clear ;
  assign rg_nmi$EN = 1'b1 ;
  // register rg_nmi_vector
  assign rg_nmi_vector$D_IN = soc_map$m_nmivec_reset_value[31:0] ;
  assign rg_nmi_vector$EN = MUX_rg_state$write_1__SEL_2 ;
  // register rg_state
  assign rg_state$D_IN = !EN_server_reset_request_put ;
  assign rg_state$EN =
	     EN_server_reset_request_put || WILL_FIRE_RL_rl_reset_start ;
  // register rg_tdata1
  assign rg_tdata1$D_IN =
	     MUX_rg_tdata1$write_1__SEL_1 ? new_csr_value__h5342 : 32'd0 ;
  assign rg_tdata1$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h7A1 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_tdata2
  assign rg_tdata2$D_IN = mav_csr_write_word ;
  assign rg_tdata2$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h7A2 ;
  // register rg_tdata3
  assign rg_tdata3$D_IN = mav_csr_write_word ;
  assign rg_tdata3$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h7A3 ;
  // register rg_tselect
  assign rg_tselect$D_IN = 32'd0 ;
  assign rg_tselect$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h7A0 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // submodule csr_mie
  assign csr_mie$mav_write_misa = 28'd68157700 ;
  assign csr_mie$mav_write_wordxl = mav_csr_write_word ;
  assign csr_mie$EN_reset = MUX_rg_state$write_1__SEL_2 ;
  assign csr_mie$EN_mav_write =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h304 ;
  // submodule csr_mip
  assign csr_mip$m_external_interrupt_req_req =
	     m_external_interrupt_req_set_not_clear ;
  assign csr_mip$mav_write_misa = 28'd68157700 ;
  assign csr_mip$mav_write_wordxl = mav_csr_write_word ;
  assign csr_mip$s_external_interrupt_req_req =
	     s_external_interrupt_req_set_not_clear ;
  assign csr_mip$software_interrupt_req_req =
	     software_interrupt_req_set_not_clear ;
  assign csr_mip$timer_interrupt_req_req = timer_interrupt_req_set_not_clear ;
  assign csr_mip$EN_reset = MUX_rg_state$write_1__SEL_2 ;
  assign csr_mip$EN_mav_write =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 &&
	     mav_csr_write_csr_addr == 12'h344 ;
  // submodule f_reset_rsps
  assign f_reset_rsps$ENQ = EN_server_reset_request_put ;
  assign f_reset_rsps$DEQ = EN_server_reset_response_get ;
  assign f_reset_rsps$CLR = 1'b0 ;
  // submodule soc_map
  assign soc_map$m_is_IO_addr_addr = 64'h0 ;
  assign soc_map$m_is_mem_addr_addr = 64'h0 ;
  assign soc_map$m_is_near_mem_IO_addr_addr = 64'h0 ;
  // remaining internal signals
  assign IF_NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_N_ETC___d1369 =
	     (!csr_mip$mv_read[11] || !csr_mie$mv_read[11] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ?
	       4'd3 :
	       4'd11 ;
  assign IF_NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_N_ETC___d1371 =
	     NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1338 ?
	       4'd9 :
	       (NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1333 ?
		  4'd7 :
		  IF_NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_N_ETC___d1369) ;
  assign IF_NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_N_ETC___d1373 =
	     NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1348 ?
	       4'd5 :
	       (NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1343 ?
		  4'd1 :
		  IF_NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_N_ETC___d1371) ;
  assign IF_NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_N_ETC___d1375 =
	     NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1358 ?
	       4'd0 :
	       (NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1353 ?
		  4'd8 :
		  IF_NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_N_ETC___d1373) ;
  assign IF_csr_ret_actions_from_priv_EQ_0b11_028_THEN__ETC___d1049 =
	     (csr_ret_actions_from_priv == 2'b11) ?
	       _theResult___fst__h8213 :
	       _theResult___fst__h8414 ;
  assign IF_csr_ret_actions_from_priv_EQ_0b11_028_THEN__ETC___d1067 =
	     (csr_ret_actions_from_priv == 2'b11) ?
	       { csr_mstatus_rg_mstatus_76_AND_INV_1_SL_0_CONCA_ETC___d1042[12:11],
		 _theResult___fst__h8213 } :
	       { to_y__h8413, _theResult___fst__h8414 } ;
  assign NOT_access_permitted_1_csr_addr_ULT_0xC03_068__ETC___d1154 =
	     (access_permitted_1_csr_addr >= 12'hC03 &&
	      access_permitted_1_csr_addr <= 12'hC1F ||
	      access_permitted_1_csr_addr >= 12'hB03 &&
	      access_permitted_1_csr_addr <= 12'hB1F ||
	      access_permitted_1_csr_addr >= 12'hC83 &&
	      access_permitted_1_csr_addr <= 12'hC9F ||
	      access_permitted_1_csr_addr >= 12'hB83 &&
	      access_permitted_1_csr_addr <= 12'hB9F ||
	      access_permitted_1_csr_addr >= 12'h323 &&
	      access_permitted_1_csr_addr <= 12'h33F ||
	      access_permitted_1_csr_addr == 12'hC00 ||
	      access_permitted_1_csr_addr == 12'hC02 ||
	      access_permitted_1_csr_addr == 12'hC80 ||
	      access_permitted_1_csr_addr == 12'hC81 ||
	      access_permitted_1_csr_addr == 12'hC82 ||
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
	      access_permitted_1_csr_addr == 12'hB80 ||
	      access_permitted_1_csr_addr == 12'hB82 ||
	      access_permitted_1_csr_addr == 12'h7A0 ||
	      access_permitted_1_csr_addr == 12'h7A1 ||
	      access_permitted_1_csr_addr == 12'h7A2 ||
	      access_permitted_1_csr_addr == 12'h7A3) &&
	     access_permitted_1_priv >= access_permitted_1_csr_addr[9:8] &&
	     (access_permitted_1_csr_addr != 12'h180 ||
	      !csr_mstatus_rg_mstatus[20]) ;
  assign NOT_access_permitted_2_csr_addr_ULT_0xC03_159__ETC___d1244 =
	     (access_permitted_2_csr_addr >= 12'hC03 &&
	      access_permitted_2_csr_addr <= 12'hC1F ||
	      access_permitted_2_csr_addr >= 12'hB03 &&
	      access_permitted_2_csr_addr <= 12'hB1F ||
	      access_permitted_2_csr_addr >= 12'hC83 &&
	      access_permitted_2_csr_addr <= 12'hC9F ||
	      access_permitted_2_csr_addr >= 12'hB83 &&
	      access_permitted_2_csr_addr <= 12'hB9F ||
	      access_permitted_2_csr_addr >= 12'h323 &&
	      access_permitted_2_csr_addr <= 12'h33F ||
	      access_permitted_2_csr_addr == 12'hC00 ||
	      access_permitted_2_csr_addr == 12'hC02 ||
	      access_permitted_2_csr_addr == 12'hC80 ||
	      access_permitted_2_csr_addr == 12'hC81 ||
	      access_permitted_2_csr_addr == 12'hC82 ||
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
	      access_permitted_2_csr_addr == 12'hB80 ||
	      access_permitted_2_csr_addr == 12'hB82 ||
	      access_permitted_2_csr_addr == 12'h7A0 ||
	      access_permitted_2_csr_addr == 12'h7A1 ||
	      access_permitted_2_csr_addr == 12'h7A2 ||
	      access_permitted_2_csr_addr == 12'h7A3) &&
	     access_permitted_2_priv >= access_permitted_2_csr_addr[9:8] &&
	     (access_permitted_2_csr_addr != 12'h180 ||
	      !csr_mstatus_rg_mstatus[20]) ;
  assign NOT_cfg_verbosity_read__29_ULE_1_30___d731 = cfg_verbosity > 4'd1 ;
  assign NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1333 =
	     (!csr_mip$mv_read[11] || !csr_mie$mv_read[11] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) &&
	     (!csr_mip$mv_read[3] || !csr_mie$mv_read[3] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ;
  assign NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1338 =
	     NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1333 &&
	     (!csr_mip$mv_read[7] || !csr_mie$mv_read[7] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ;
  assign NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1343 =
	     NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1338 &&
	     (!csr_mip$mv_read[9] || !csr_mie$mv_read[9] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ;
  assign NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1348 =
	     NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1343 &&
	     (!csr_mip$mv_read[1] || !csr_mie$mv_read[1] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ;
  assign NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1353 =
	     NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1348 &&
	     (!csr_mip$mv_read[5] || !csr_mie$mv_read[5] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ;
  assign NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1358 =
	     NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1353 &&
	     (!csr_mip$mv_read[8] || !csr_mie$mv_read[8] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ;
  assign NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1363 =
	     NOT_csr_mip_mv_read__91_BIT_11_276_323_OR_NOT__ETC___d1358 &&
	     (!csr_mip$mv_read[0] || !csr_mie$mv_read[0] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ;
  assign NOT_csr_trap_actions_nmi_96_AND_csr_trap_actio_ETC___d973 =
	     !csr_trap_actions_nmi && csr_trap_actions_interrupt &&
	     exc_code__h7911 != 4'd0 &&
	     exc_code__h7911 != 4'd1 &&
	     exc_code__h7911 != 4'd2 &&
	     exc_code__h7911 != 4'd3 &&
	     exc_code__h7911 != 4'd4 &&
	     exc_code__h7911 != 4'd5 &&
	     exc_code__h7911 != 4'd6 &&
	     exc_code__h7911 != 4'd7 &&
	     exc_code__h7911 != 4'd8 &&
	     exc_code__h7911 != 4'd9 &&
	     exc_code__h7911 != 4'd10 &&
	     exc_code__h7911 != 4'd11 ;
  assign NOT_mav_csr_write_csr_addr_ULT_0xB03_74_33_AND_ETC___d744 =
	     !mav_csr_write_csr_addr_ULT_0xB03___d574 &&
	     mav_csr_write_csr_addr_ULE_0xB1F___d575 ||
	     !mav_csr_write_csr_addr_ULT_0xB83___d578 &&
	     mav_csr_write_csr_addr_ULE_0xB9F___d579 ||
	     !mav_csr_write_csr_addr_ULT_0x323___d582 &&
	     mav_csr_write_csr_addr_ULE_0x33F___d583 ||
	     mav_csr_write_csr_addr == 12'hF11 ||
	     mav_csr_write_csr_addr == 12'hF12 ||
	     mav_csr_write_csr_addr == 12'hF13 ||
	     mav_csr_write_csr_addr == 12'hF14 ;
  assign _theResult___fst__h8213 =
	     { csr_mstatus_rg_mstatus_76_AND_INV_1_SL_0_CONCA_ETC___d1042[31:13],
	       2'd0,
	       csr_mstatus_rg_mstatus_76_AND_INV_1_SL_0_CONCA_ETC___d1042[10:0] } ;
  assign _theResult___fst__h8414 =
	     { csr_mstatus_rg_mstatus_76_AND_INV_1_SL_0_CONCA_ETC___d1042[31:9],
	       1'd0,
	       csr_mstatus_rg_mstatus_76_AND_INV_1_SL_0_CONCA_ETC___d1042[7:0] } ;
  assign b__h8250 =
	     csr_mstatus_rg_mstatus[{ 3'd1, csr_ret_actions_from_priv }] ;
  assign csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1287 =
	     csr_mip$mv_read[11] && csr_mie$mv_read[11] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ||
	     csr_mip$mv_read[3] && csr_mie$mv_read[3] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1292 =
	     csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1287 ||
	     csr_mip$mv_read[7] && csr_mie$mv_read[7] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1297 =
	     csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1292 ||
	     csr_mip$mv_read[9] && csr_mie$mv_read[9] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1302 =
	     csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1297 ||
	     csr_mip$mv_read[1] && csr_mie$mv_read[1] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1307 =
	     csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1302 ||
	     csr_mip$mv_read[5] && csr_mie$mv_read[5] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1312 =
	     csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1307 ||
	     csr_mip$mv_read[8] && csr_mie$mv_read[8] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1317 =
	     csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1312 ||
	     csr_mip$mv_read[0] && csr_mie$mv_read[0] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1322 =
	     csr_mip_mv_read__91_BIT_11_276_AND_csr_mie_mv__ETC___d1317 ||
	     csr_mip$mv_read[4] && csr_mie$mv_read[4] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mstatus_rg_mstatus_76_AND_INV_1_SL_0_CONCA_ETC___d1042 =
	     x__h8246 | mask__h8234 ;
  assign csr_trap_actions_nmi_OR_NOT_csr_trap_actions_i_ETC___d1024 =
	     (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	     exc_code__h7911 != 4'd0 &&
	     exc_code__h7911 != 4'd1 &&
	     exc_code__h7911 != 4'd2 &&
	     exc_code__h7911 != 4'd3 &&
	     exc_code__h7911 != 4'd4 &&
	     exc_code__h7911 != 4'd5 &&
	     exc_code__h7911 != 4'd6 &&
	     exc_code__h7911 != 4'd7 &&
	     exc_code__h7911 != 4'd8 &&
	     exc_code__h7911 != 4'd9 &&
	     exc_code__h7911 != 4'd11 &&
	     exc_code__h7911 != 4'd12 &&
	     exc_code__h7911 != 4'd13 &&
	     exc_code__h7911 != 4'd15 ;
  assign exc_code__h7911 =
	     csr_trap_actions_nmi ? 4'd0 : csr_trap_actions_exc_code ;
  assign exc_pc___1__h7298 = exc_pc__h7245 + vector_offset__h7246 ;
  assign exc_pc__h7034 = { rg_mtvec[30:1], 2'd0 } ;
  assign exc_pc__h7245 =
	     csr_trap_actions_nmi ? rg_nmi_vector : exc_pc__h7034 ;
  assign fixed_up_val_23__h4064 =
	     { mav_csr_write_word[22:17],
	       4'd0,
	       (mav_csr_write_word[12:11] == 2'b11) ?
		 mav_csr_write_word[12:11] :
		 2'b0,
	       mav_csr_write_word[10:9],
	       1'd0,
	       mav_csr_write_word[7:6],
	       2'd0,
	       mav_csr_write_word[3:2],
	       2'd0 } ;
  assign fixed_up_val_23__h6473 =
	     { csr_mstatus_rg_mstatus[22:17],
	       4'd0,
	       mpp__h7339,
	       csr_mstatus_rg_mstatus[10:9],
	       1'd0,
	       csr_mstatus_rg_mstatus[3],
	       csr_mstatus_rg_mstatus[6],
	       3'd0,
	       csr_mstatus_rg_mstatus[2],
	       2'd0 } ;
  assign fixed_up_val_23__h8132 =
	     { IF_csr_ret_actions_from_priv_EQ_0b11_028_THEN__ETC___d1049[22:17],
	       4'd0,
	       (IF_csr_ret_actions_from_priv_EQ_0b11_028_THEN__ETC___d1049[12:11] ==
		2'b11) ?
		 IF_csr_ret_actions_from_priv_EQ_0b11_028_THEN__ETC___d1049[12:11] :
		 2'b0,
	       IF_csr_ret_actions_from_priv_EQ_0b11_028_THEN__ETC___d1049[10:9],
	       1'd0,
	       IF_csr_ret_actions_from_priv_EQ_0b11_028_THEN__ETC___d1049[7:6],
	       2'd0,
	       IF_csr_ret_actions_from_priv_EQ_0b11_028_THEN__ETC___d1049[3:2],
	       2'd0 } ;
  assign ie_from_x__h8197 = { 4'd0, csr_ret_actions_from_priv } ;
  assign mask__h8234 = 32'd1 << pie_from_x__h8198 ;
  assign mask__h8251 = 32'd1 << ie_from_x__h8197 ;
  assign mav_csr_write_csr_addr_ULE_0x33F___d583 =
	     mav_csr_write_csr_addr <= 12'h33F ;
  assign mav_csr_write_csr_addr_ULE_0xB1F___d575 =
	     mav_csr_write_csr_addr <= 12'hB1F ;
  assign mav_csr_write_csr_addr_ULE_0xB9F___d579 =
	     mav_csr_write_csr_addr <= 12'hB9F ;
  assign mav_csr_write_csr_addr_ULT_0x323_82_OR_NOT_mav_ETC___d726 =
	     (mav_csr_write_csr_addr_ULT_0x323___d582 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d583) &&
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
	     mav_csr_write_csr_addr != 12'hB80 &&
	     mav_csr_write_csr_addr != 12'hB82 &&
	     mav_csr_write_csr_addr != 12'h7A0 &&
	     mav_csr_write_csr_addr != 12'h7A1 &&
	     mav_csr_write_csr_addr != 12'h7A2 &&
	     mav_csr_write_csr_addr != 12'h7A3 ;
  assign mav_csr_write_csr_addr_ULT_0x323___d582 =
	     mav_csr_write_csr_addr < 12'h323 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d587 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d574 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d575) &&
	     (mav_csr_write_csr_addr_ULT_0xB83___d578 ||
	      !mav_csr_write_csr_addr_ULE_0xB9F___d579) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d582 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d583) ;
  assign mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d640 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d574 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d575) &&
	     (mav_csr_write_csr_addr_ULT_0xB83___d578 ||
	      !mav_csr_write_csr_addr_ULE_0xB9F___d579) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d582 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d583) &&
	     mav_csr_write_csr_addr != 12'hF11 &&
	     mav_csr_write_csr_addr != 12'hF12 &&
	     mav_csr_write_csr_addr != 12'hF13 &&
	     mav_csr_write_csr_addr != 12'hF14 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d728 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d574 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d575) &&
	     (mav_csr_write_csr_addr_ULT_0xB83___d578 ||
	      !mav_csr_write_csr_addr_ULE_0xB9F___d579) &&
	     mav_csr_write_csr_addr_ULT_0x323_82_OR_NOT_mav_ETC___d726 ;
  assign mav_csr_write_csr_addr_ULT_0xB03___d574 =
	     mav_csr_write_csr_addr < 12'hB03 ;
  assign mav_csr_write_csr_addr_ULT_0xB83___d578 =
	     mav_csr_write_csr_addr < 12'hB83 ;
  assign mpp__h7339 =
	     (csr_trap_actions_from_priv == 2'b11) ?
	       csr_trap_actions_from_priv :
	       2'b0 ;
  assign new_csr_value__h4686 = { mav_csr_write_word[31:1], 1'd0 } ;
  assign new_csr_value__h5342 = { 4'd0, mav_csr_write_word[27:0] } ;
  assign pie_from_x__h8198 = { 4'd1, csr_ret_actions_from_priv } ;
  assign to_y__h8413 =
	     { 1'b0,
	       csr_mstatus_rg_mstatus_76_AND_INV_1_SL_0_CONCA_ETC___d1042[8] } ;
  assign v__h4494 =
	     { mav_csr_write_word[31:2], 1'b0, mav_csr_write_word[0] } ;
  assign v__h4556 = { 29'd0, mav_csr_write_word[2:0] } ;
  assign v__h4727 =
	     { mav_csr_write_word[31], 27'd0, mav_csr_write_word[3:0] } ;
  assign val__h8252 = { 31'd0, b__h8250 } << ie_from_x__h8197 ;
  assign vector_offset__h7246 = { 26'd0, csr_trap_actions_exc_code, 2'd0 } ;
  assign wordxl1__h4023 = { 9'd0, fixed_up_val_23__h4064 } ;
  assign x__h3817 =
	     NOT_mav_csr_write_csr_addr_ULT_0xB03_74_33_AND_ETC___d744 ?
	       32'd0 :
	       IF_mav_csr_write_csr_addr_EQ_0x300_88_THEN_0_C_ETC___d767 ;
  assign x__h5159 = { rg_minstret[63:32], mav_csr_write_word } ;
  assign x__h5267 = { mav_csr_write_word, rg_minstret[31:0] } ;
  assign x__h5845 =
	     (csr_trap_actions_interrupt && !csr_trap_actions_nmi &&
	      rg_mtvec[0]) ?
	       exc_pc___1__h7298 :
	       exc_pc__h7245 ;
  assign x__h8069 = { 9'd0, fixed_up_val_23__h6473 } ;
  assign x__h8070 =
	     { !csr_trap_actions_nmi && csr_trap_actions_interrupt,
	       27'd0,
	       exc_code__h7911 } ;
  assign x__h8233 = x__h8263 | val__h8252 ;
  assign x__h8246 = x__h8233 & y__h8247 ;
  assign x__h8263 = csr_mstatus_rg_mstatus & y__h8264 ;
  assign y__h8247 = ~mask__h8234 ;
  assign y__h8264 = ~mask__h8251 ;
  always@(mav_csr_write_csr_addr or
	  mav_csr_write_word or
	  wordxl1__h4023 or
	  csr_mie$mav_write or
	  v__h4494 or
	  v__h4556 or
	  new_csr_value__h4686 or
	  v__h4727 or csr_mip$mav_write or new_csr_value__h5342)
  begin
    case (mav_csr_write_csr_addr)
      12'h300:
	  IF_mav_csr_write_csr_addr_EQ_0x300_88_THEN_0_C_ETC___d767 =
	      wordxl1__h4023;
      12'h301:
	  IF_mav_csr_write_csr_addr_EQ_0x300_88_THEN_0_C_ETC___d767 =
	      32'd1074790660;
      12'h304:
	  IF_mav_csr_write_csr_addr_EQ_0x300_88_THEN_0_C_ETC___d767 =
	      csr_mie$mav_write;
      12'h305:
	  IF_mav_csr_write_csr_addr_EQ_0x300_88_THEN_0_C_ETC___d767 =
	      v__h4494;
      12'h306:
	  IF_mav_csr_write_csr_addr_EQ_0x300_88_THEN_0_C_ETC___d767 =
	      v__h4556;
      12'h340, 12'h343, 12'hB00, 12'hB02, 12'hB80, 12'hB82:
	  IF_mav_csr_write_csr_addr_EQ_0x300_88_THEN_0_C_ETC___d767 =
	      mav_csr_write_word;
      12'h341:
	  IF_mav_csr_write_csr_addr_EQ_0x300_88_THEN_0_C_ETC___d767 =
	      new_csr_value__h4686;
      12'h342:
	  IF_mav_csr_write_csr_addr_EQ_0x300_88_THEN_0_C_ETC___d767 =
	      v__h4727;
      12'h344:
	  IF_mav_csr_write_csr_addr_EQ_0x300_88_THEN_0_C_ETC___d767 =
	      csr_mip$mav_write;
      12'h7A0:
	  IF_mav_csr_write_csr_addr_EQ_0x300_88_THEN_0_C_ETC___d767 = 32'd0;
      12'h7A1:
	  IF_mav_csr_write_csr_addr_EQ_0x300_88_THEN_0_C_ETC___d767 =
	      new_csr_value__h5342;
      default: IF_mav_csr_write_csr_addr_EQ_0x300_88_THEN_0_C_ETC___d767 =
		   mav_csr_write_word;
    endcase
  end
  always@(read_csr_csr_addr or
	  rg_tdata3 or
	  csr_mstatus_rg_mstatus or
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
      12'h300:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      csr_mstatus_rg_mstatus;
      12'h301:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      32'd1074790660;
      12'h304:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      csr_mie$mv_read;
      12'h305:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      { rg_mtvec[30:1], 1'b0, rg_mtvec[0] };
      12'h306:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      { 29'd0, rg_mcounteren };
      12'h340:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      rg_mscratch;
      12'h341:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 = rg_mepc;
      12'h342:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      { rg_mcause[4], 27'd0, rg_mcause[3:0] };
      12'h343:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      rg_mtval;
      12'h344:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      csr_mip$mv_read;
      12'h7A0:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      rg_tselect;
      12'h7A1:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      rg_tdata1;
      12'h7A2:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      rg_tdata2;
      12'hB00, 12'hC00:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      rg_mcycle[31:0];
      12'hB02, 12'hC02:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      rg_minstret[31:0];
      12'hB80, 12'hC80:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      rg_mcycle[63:32];
      12'hB82, 12'hC82:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
	      rg_minstret[63:32];
      12'hF11, 12'hF12, 12'hF13, 12'hF14:
	  IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 = 32'd0;
      default: IF_read_csr_csr_addr_EQ_0xC00_9_THEN_rg_mcycle_ETC___d217 =
		   rg_tdata3;
    endcase
  end
  always@(read_csr_port2_csr_addr or
	  rg_tdata3 or
	  csr_mstatus_rg_mstatus or
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
      12'h300:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      csr_mstatus_rg_mstatus;
      12'h301:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      32'd1074790660;
      12'h304:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      csr_mie$mv_read;
      12'h305:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      { rg_mtvec[30:1], 1'b0, rg_mtvec[0] };
      12'h306:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      { 29'd0, rg_mcounteren };
      12'h340:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      rg_mscratch;
      12'h341:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 = rg_mepc;
      12'h342:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      { rg_mcause[4], 27'd0, rg_mcause[3:0] };
      12'h343:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      rg_mtval;
      12'h344:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      csr_mip$mv_read;
      12'h7A0:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      rg_tselect;
      12'h7A1:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      rg_tdata1;
      12'h7A2:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      rg_tdata2;
      12'hB00, 12'hC00:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      rg_mcycle[31:0];
      12'hB02, 12'hC02:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      rg_minstret[31:0];
      12'hB80, 12'hC80:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      rg_mcycle[63:32];
      12'hB82, 12'hC82:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
	      rg_minstret[63:32];
      12'hF11, 12'hF12, 12'hF13, 12'hF14:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 = 32'd0;
      default: IF_read_csr_port2_csr_addr_EQ_0xC00_40_THEN_rg_ETC___d394 =
		   rg_tdata3;
    endcase
  end
  always@(mav_read_csr_csr_addr or
	  rg_tdata3 or
	  csr_mstatus_rg_mstatus or
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
      12'h300:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      csr_mstatus_rg_mstatus;
      12'h301:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      32'd1074790660;
      12'h304:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      csr_mie$mv_read;
      12'h305:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      { rg_mtvec[30:1], 1'b0, rg_mtvec[0] };
      12'h306:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      { 29'd0, rg_mcounteren };
      12'h340:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      rg_mscratch;
      12'h341:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 = rg_mepc;
      12'h342:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      { rg_mcause[4], 27'd0, rg_mcause[3:0] };
      12'h343:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      rg_mtval;
      12'h344:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      csr_mip$mv_read;
      12'h7A0:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      rg_tselect;
      12'h7A1:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      rg_tdata1;
      12'h7A2:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      rg_tdata2;
      12'hB00, 12'hC00:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      rg_mcycle[31:0];
      12'hB02, 12'hC02:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      rg_minstret[31:0];
      12'hB80, 12'hC80:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      rg_mcycle[63:32];
      12'hB82, 12'hC82:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
	      rg_minstret[63:32];
      12'hF11, 12'hF12, 12'hF13, 12'hF14:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 = 32'd0;
      default: IF_mav_read_csr_csr_addr_EQ_0xC00_17_THEN_rg_m_ETC___d571 =
		   rg_tdata3;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cfg_verbosity <= `BSV_ASSIGNMENT_DELAY 4'd0;
	csr_mstatus_rg_mstatus <= `BSV_ASSIGNMENT_DELAY 32'd0;
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
    if (rg_mcause$EN) rg_mcause <= `BSV_ASSIGNMENT_DELAY rg_mcause$D_IN;
    if (rg_mcounteren$EN)
      rg_mcounteren <= `BSV_ASSIGNMENT_DELAY rg_mcounteren$D_IN;
    if (rg_mepc$EN) rg_mepc <= `BSV_ASSIGNMENT_DELAY rg_mepc$D_IN;
    if (rg_mscratch$EN) rg_mscratch <= `BSV_ASSIGNMENT_DELAY rg_mscratch$D_IN;
    if (rg_mtval$EN) rg_mtval <= `BSV_ASSIGNMENT_DELAY rg_mtval$D_IN;
    if (rg_mtvec$EN) rg_mtvec <= `BSV_ASSIGNMENT_DELAY rg_mtvec$D_IN;
    if (rg_nmi_vector$EN)
      rg_nmi_vector <= `BSV_ASSIGNMENT_DELAY rg_nmi_vector$D_IN;
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
    csr_mstatus_rg_mstatus = 32'hAAAAAAAA;
    rg_dcsr = 32'hAAAAAAAA;
    rg_dpc = 32'hAAAAAAAA;
    rg_dscratch0 = 32'hAAAAAAAA;
    rg_dscratch1 = 32'hAAAAAAAA;
    rg_mcause = 5'h0A;
    rg_mcounteren = 3'h2;
    rg_mcycle = 64'hAAAAAAAAAAAAAAAA;
    rg_mepc = 32'hAAAAAAAA;
    rg_minstret = 64'hAAAAAAAAAAAAAAAA;
    rg_mscratch = 32'hAAAAAAAA;
    rg_mtval = 32'hAAAAAAAA;
    rg_mtvec = 31'h2AAAAAAA;
    rg_nmi = 1'h0;
    rg_nmi_vector = 32'hAAAAAAAA;
    rg_state = 1'h0;
    rg_tdata1 = 32'hAAAAAAAA;
    rg_tdata2 = 32'hAAAAAAAA;
    rg_tdata3 = 32'hAAAAAAAA;
    rg_tselect = 32'hAAAAAAAA;
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
      if (EN_debug) $display("mip     = 0x%0h", csr_mip$mv_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_debug) $display("mie     = 0x%0h", csr_mie$mv_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$display("%0d: CSR_Regfile.csr_trap_actions:", rg_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$display("    from priv %0d  pc 0x%0h  interrupt %0d  exc_code %0d  xtval 0x%0h",
		 csr_trap_actions_from_priv,
		 csr_trap_actions_pc,
		 csr_trap_actions_interrupt,
		 csr_trap_actions_exc_code,
		 csr_trap_actions_xtval);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write("    priv %0d: ", 2'b11);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" ip: 0x%0h", csr_mip$mv_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" ie: 0x%0h", csr_mie$mv_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" edeleg: 0x%0h", 16'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" ideleg: 0x%0h", 12'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" cause:");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd0)
	$write("USER_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd1)
	$write("SUPERVISOR_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd2)
	$write("HYPERVISOR_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd3)
	$write("MACHINE_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd4)
	$write("USER_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd5)
	$write("SUPERVISOR_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd6)
	$write("HYPERVISOR_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd7)
	$write("MACHINE_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd8)
	$write("USER_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd9)
	$write("SUPERVISOR_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd10)
	$write("HYPERVISOR_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd11)
	$write("MACHINE_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
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
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd0)
	$write("INSTRUCTION_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd1)
	$write("INSTRUCTION_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd2)
	$write("ILLEGAL_INSTRUCTION");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd3)
	$write("BREAKPOINT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd4)
	$write("LOAD_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd5)
	$write("LOAD_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd6)
	$write("STORE_AMO_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd7)
	$write("STORE_AMO_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd8)
	$write("ECALL_FROM_U");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd9)
	$write("ECALL_FROM_S");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd11)
	$write("ECALL_FROM_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd12)
	$write("INSTRUCTION_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd13)
	$write("LOAD_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd15)
	$write("STORE_AMO_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
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
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" status: 0x%0h", csr_mstatus_rg_mstatus);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" tvec: 0x%0h", { rg_mtvec[30:1], 1'b0, rg_mtvec[0] });
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" epc: 0x%0h", rg_mepc);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" tval: 0x%0h", rg_mtval);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write("    Return: new pc 0x%0h  ", x__h5845);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" new mstatus:");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write("MStatus{", "sd:%0d", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" tsr:%0d", csr_mstatus_rg_mstatus[22]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" tw:%0d", csr_mstatus_rg_mstatus[21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" tvm:%0d", csr_mstatus_rg_mstatus[20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" mxr:%0d", csr_mstatus_rg_mstatus[19]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" sum:%0d", csr_mstatus_rg_mstatus[18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" mprv:%0d", csr_mstatus_rg_mstatus[17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" xs:%0d", 2'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" fs:%0d", 2'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" mpp:%0d", mpp__h7339);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" spp:%0d", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" pies:%0d_%0d%0d", csr_mstatus_rg_mstatus[3], 1'd0, 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" ies:%0d_%0d%0d", 1'd0, 1'd0, 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" new xcause:");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7911 == 4'd0)
	$write("USER_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7911 == 4'd1)
	$write("SUPERVISOR_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7911 == 4'd2)
	$write("HYPERVISOR_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7911 == 4'd3)
	$write("MACHINE_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7911 == 4'd4)
	$write("USER_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7911 == 4'd5)
	$write("SUPERVISOR_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7911 == 4'd6)
	$write("HYPERVISOR_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7911 == 4'd7)
	$write("MACHINE_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7911 == 4'd8)
	$write("USER_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7911 == 4'd9)
	$write("SUPERVISOR_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7911 == 4'd10)
	$write("HYPERVISOR_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7911 == 4'd11)
	$write("MACHINE_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  NOT_csr_trap_actions_nmi_96_AND_csr_trap_actio_ETC___d973)
	$write("unknown interrupt Exc_Code %d", exc_code__h7911);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7911 == 4'd0)
	$write("INSTRUCTION_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7911 == 4'd1)
	$write("INSTRUCTION_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7911 == 4'd2)
	$write("ILLEGAL_INSTRUCTION");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7911 == 4'd3)
	$write("BREAKPOINT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7911 == 4'd4)
	$write("LOAD_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7911 == 4'd5)
	$write("LOAD_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7911 == 4'd6)
	$write("STORE_AMO_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7911 == 4'd7)
	$write("STORE_AMO_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7911 == 4'd8)
	$write("ECALL_FROM_U");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7911 == 4'd9)
	$write("ECALL_FROM_S");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7911 == 4'd11)
	$write("ECALL_FROM_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7911 == 4'd12)
	$write("INSTRUCTION_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7911 == 4'd13)
	$write("LOAD_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7911 == 4'd15)
	$write("STORE_AMO_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731 &&
	  csr_trap_actions_nmi_OR_NOT_csr_trap_actions_i_ETC___d1024)
	$write("unknown trap Exc_Code %d", exc_code__h7911);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$write(" new priv %0d", 2'b11);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_csr_write &&
	  mav_csr_write_csr_addr_ULT_0xB03_74_OR_NOT_mav_ETC___d728 &&
	  NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$display("%0d: ERROR: CSR-write addr 0x%0h val 0x%0h not successful",
		 rg_mcycle,
		 mav_csr_write_csr_addr,
		 mav_csr_write_word);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$display("%0d: CSR_RegFile: m_external_interrupt_req: %x",
		 rg_mcycle,
		 m_external_interrupt_req_set_not_clear);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$display("%0d: CSR_RegFile: s_external_interrupt_req: %x",
		 rg_mcycle,
		 s_external_interrupt_req_set_not_clear);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$display("%0d: CSR_RegFile: software_interrupt_req: %x",
		 rg_mcycle,
		 software_interrupt_req_set_not_clear);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_cfg_verbosity_read__29_ULE_1_30___d731)
	$display("%0d: CSR_RegFile: timer_interrupt_req: %x",
		 rg_mcycle,
		 timer_interrupt_req_set_not_clear);
  end
  // synopsys translate_on
endmodule