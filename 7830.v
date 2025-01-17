module outputs
  wire [193 : 0] csr_trap_actions;
  wire [129 : 0] csr_ret_actions;
  wire [128 : 0] mav_csr_write;
  wire [64 : 0] mav_read_csr, read_csr, read_csr_port2;
  wire [63 : 0] csr_mip_read,
		read_csr_mcycle,
		read_csr_minstret,
		read_csr_mtime,
		read_mstatus,
		read_satp,
		read_ustatus;
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
  reg [63 : 0] rg_mepc;
  wire [63 : 0] rg_mepc$D_IN;
  wire rg_mepc$EN;
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
  // register rg_state
  reg rg_state;
  wire rg_state$D_IN, rg_state$EN;
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
  wire [63 : 0] csr_mie$mav_write, csr_mie$mav_write_wordxl, csr_mie$mv_read;
  wire [27 : 0] csr_mie$mav_write_misa;
  wire csr_mie$EN_mav_write, csr_mie$EN_reset;
  // ports of submodule csr_mip
  wire [63 : 0] csr_mip$mav_write, csr_mip$mav_write_wordxl, csr_mip$mv_read;
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
  wire [63 : 0] MUX_csr_mstatus_rg_mstatus$write_1__VAL_3,
		MUX_rg_minstret$write_1__VAL_1,
		MUX_rg_minstret$write_1__VAL_2;
  wire [62 : 0] MUX_rg_mtvec$write_1__VAL_1, MUX_rg_mtvec$write_1__VAL_2;
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
  reg [63 : 0] IF_mav_csr_write_csr_addr_EQ_0x300_52_THEN_102_ETC___d584,
	       IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440,
	       IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170,
	       IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305;
  wire [65 : 0] IF_csr_ret_actions_from_priv_EQ_0b11_45_THEN_c_ETC___d883;
  wire [63 : 0] IF_csr_ret_actions_from_priv_EQ_0b11_45_THEN_c_ETC___d865,
		_theResult___fst__h8317,
		_theResult___fst__h8518,
		csr_mstatus_rg_mstatus_33_AND_INV_1_SL_0_CONCA_ETC___d858,
		exc_pc___1__h7305,
		exc_pc__h7041,
		exc_pc__h7252,
		mask__h8338,
		mask__h8355,
		new_csr_value__h4626,
		new_csr_value__h5354,
		v__h4434,
		v__h4496,
		v__h4667,
		val__h8356,
		vector_offset__h7253,
		wordxl1__h3934,
		x__h3755,
		x__h5823,
		x__h8146,
		x__h8147,
		x__h8337,
		x__h8350,
		x__h8367,
		y__h8351,
		y__h8368;
  wire [22 : 0] fixed_up_val_23__h3975,
		fixed_up_val_23__h6451,
		fixed_up_val_23__h8209;
  wire [5 : 0] ie_from_x__h8301, pie_from_x__h8302;
  wire [3 : 0] IF_NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_N_ETC___d1140,
	       IF_NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_N_ETC___d1142,
	       IF_NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_N_ETC___d1144,
	       IF_NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_N_ETC___d1146,
	       exc_code__h7988;
  wire [1 : 0] mpp__h7346, to_y__h8517;
  wire NOT_access_permitted_1_csr_addr_ULT_0xC03_84_8_ETC___d950,
       NOT_access_permitted_2_csr_addr_ULT_0xC03_55_5_ETC___d1020,
       NOT_cfg_verbosity_read__51_ULE_1_52___d553,
       NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1104,
       NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1109,
       NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1114,
       NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1119,
       NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1124,
       NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1129,
       NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1134,
       NOT_csr_trap_actions_nmi_13_AND_csr_trap_actio_ETC___d790,
       b__h8354,
       csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1058,
       csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1063,
       csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1068,
       csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1073,
       csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1078,
       csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1083,
       csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1088,
       csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1093,
       csr_trap_actions_nmi_OR_NOT_csr_trap_actions_i_ETC___d841,
       mav_csr_write_csr_addr_ULE_0x33F___d448,
       mav_csr_write_csr_addr_ULE_0xB1F___d444,
       mav_csr_write_csr_addr_ULT_0x323_47_OR_NOT_mav_ETC___d549,
       mav_csr_write_csr_addr_ULT_0x323___d447,
       mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d453,
       mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d467,
       mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d469,
       mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d474,
       mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d477,
       mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d479,
       mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d483,
       mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d488,
       mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d490,
       mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d494,
       mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d496,
       mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d498,
       mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d502,
       mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d504,
       mav_csr_write_csr_addr_ULT_0xB03___d443;
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
	       read_csr_csr_addr == 12'hC00 ||
	       read_csr_csr_addr == 12'hC02 ||
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
		 IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 } ;
  // value method read_csr_port2
  assign read_csr_port2 =
	     { read_csr_port2_csr_addr >= 12'hC03 &&
	       read_csr_port2_csr_addr <= 12'hC1F ||
	       read_csr_port2_csr_addr >= 12'hB03 &&
	       read_csr_port2_csr_addr <= 12'hB1F ||
	       read_csr_port2_csr_addr >= 12'h323 &&
	       read_csr_port2_csr_addr <= 12'h33F ||
	       read_csr_port2_csr_addr == 12'hC00 ||
	       read_csr_port2_csr_addr == 12'hC02 ||
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
		 IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 } ;
  // actionvalue method mav_read_csr
  assign mav_read_csr =
	     { mav_read_csr_csr_addr >= 12'hC03 &&
	       mav_read_csr_csr_addr <= 12'hC1F ||
	       mav_read_csr_csr_addr >= 12'hB03 &&
	       mav_read_csr_csr_addr <= 12'hB1F ||
	       mav_read_csr_csr_addr >= 12'h323 &&
	       mav_read_csr_csr_addr <= 12'h33F ||
	       mav_read_csr_csr_addr == 12'hC00 ||
	       mav_read_csr_csr_addr == 12'hC02 ||
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
		 IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 } ;
  assign CAN_FIRE_mav_read_csr = 1'd1 ;
  assign WILL_FIRE_mav_read_csr = EN_mav_read_csr ;
  // actionvalue method mav_csr_write
  assign mav_csr_write = { x__h3755, 65'h0AAAAAAAAAAAAAAAA } ;
  assign CAN_FIRE_mav_csr_write = 1'd1 ;
  assign WILL_FIRE_mav_csr_write = EN_mav_csr_write ;
  // value method read_misa
  assign read_misa = 28'd135270661 ;
  // value method read_mstatus
  assign read_mstatus = csr_mstatus_rg_mstatus ;
  // value method read_ustatus
  assign read_ustatus =
	     { 59'd0,
	       csr_mstatus_rg_mstatus[4],
	       3'd0,
	       csr_mstatus_rg_mstatus[0] } ;
  // value method read_satp
  assign read_satp = 64'hAAAAAAAAAAAAAAAA ;
  // actionvalue method csr_trap_actions
  assign csr_trap_actions = { x__h5823, x__h8146, x__h8147, 2'b11 } ;
  assign RDY_csr_trap_actions = 1'd1 ;
  assign CAN_FIRE_csr_trap_actions = 1'd1 ;
  assign WILL_FIRE_csr_trap_actions = EN_csr_trap_actions ;
  // actionvalue method csr_ret_actions
  assign csr_ret_actions =
	     { rg_mepc,
	       IF_csr_ret_actions_from_priv_EQ_0b11_45_THEN_c_ETC___d883 } ;
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
	     NOT_access_permitted_1_csr_addr_ULT_0xC03_84_8_ETC___d950 &&
	     (access_permitted_1_read_not_write ||
	      access_permitted_1_csr_addr[11:10] != 2'b11) ;
  // value method access_permitted_2
  assign access_permitted_2 =
	     NOT_access_permitted_2_csr_addr_ULT_0xC03_55_5_ETC___d1020 &&
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
	     { csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1093,
	       NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1134 ?
		 4'd4 :
		 IF_NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_N_ETC___d1146 } ;
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
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d453 ;
  assign MUX_rg_mcause$write_1__SEL_2 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d483 ;
  assign MUX_rg_mcounteren$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d474 ;
  assign MUX_rg_mepc$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d479 ;
  assign MUX_rg_mtval$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d488 ;
  assign MUX_rg_mtvec$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d469 ;
  assign MUX_rg_state$write_1__SEL_2 =
	     CAN_FIRE_RL_rl_reset_start && !EN_mav_csr_write ;
  assign MUX_rg_tdata1$write_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d498 ;
  assign MUX_rw_minstret$wset_1__SEL_1 =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d494 ;
  assign MUX_csr_mstatus_rg_mstatus$write_1__VAL_3 =
	     { 41'd1024, fixed_up_val_23__h8209 } ;
  assign MUX_rg_mcause$write_1__VAL_2 =
	     { mav_csr_write_word[63], mav_csr_write_word[3:0] } ;
  assign MUX_rg_mcause$write_1__VAL_3 =
	     { !csr_trap_actions_nmi && csr_trap_actions_interrupt,
	       exc_code__h7988 } ;
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
	  MUX_csr_mstatus_rg_mstatus$write_1__SEL_2 or
	  wordxl1__h3934 or
	  EN_csr_ret_actions or
	  MUX_csr_mstatus_rg_mstatus$write_1__VAL_3 or
	  EN_csr_trap_actions or x__h8146)
  case (1'b1)
    WILL_FIRE_RL_rl_reset_start:
	csr_mstatus_rg_mstatus$D_IN = 64'h0000000200000000;
    MUX_csr_mstatus_rg_mstatus$write_1__SEL_2:
	csr_mstatus_rg_mstatus$D_IN = wordxl1__h3934;
    EN_csr_ret_actions:
	csr_mstatus_rg_mstatus$D_IN =
	    MUX_csr_mstatus_rg_mstatus$write_1__VAL_3;
    EN_csr_trap_actions: csr_mstatus_rg_mstatus$D_IN = x__h8146;
    default: csr_mstatus_rg_mstatus$D_IN =
		 64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
  endcase
  assign csr_mstatus_rg_mstatus$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d453 ||
	     EN_csr_trap_actions ||
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
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d483 ||
	     EN_csr_trap_actions ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_mcounteren
  assign rg_mcounteren$D_IN =
	     MUX_rg_mcounteren$write_1__SEL_1 ?
	       mav_csr_write_word[2:0] :
	       3'd0 ;
  assign rg_mcounteren$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d474 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_mcycle
  assign rg_mcycle$D_IN = rg_mcycle + 64'd1 ;
  assign rg_mcycle$EN = 1'd1 ;
  // register rg_mepc
  assign rg_mepc$D_IN =
	     MUX_rg_mepc$write_1__SEL_1 ?
	       new_csr_value__h4626 :
	       csr_trap_actions_pc ;
  assign rg_mepc$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d479 ||
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
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d477 ;
  // register rg_mtval
  assign rg_mtval$D_IN =
	     MUX_rg_mtval$write_1__SEL_1 ?
	       mav_csr_write_word :
	       csr_trap_actions_xtval ;
  assign rg_mtval$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d488 ||
	     EN_csr_trap_actions ;
  // register rg_mtvec
  assign rg_mtvec$D_IN =
	     MUX_rg_mtvec$write_1__SEL_1 ?
	       MUX_rg_mtvec$write_1__VAL_1 :
	       MUX_rg_mtvec$write_1__VAL_2 ;
  assign rg_mtvec$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d469 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_nmi
  assign rg_nmi$D_IN = !WILL_FIRE_RL_rl_reset_start && nmi_req_set_not_clear ;
  assign rg_nmi$EN = 1'b1 ;
  // register rg_nmi_vector
  assign rg_nmi_vector$D_IN = soc_map$m_nmivec_reset_value ;
  assign rg_nmi_vector$EN = MUX_rg_state$write_1__SEL_2 ;
  // register rg_state
  assign rg_state$D_IN = !EN_server_reset_request_put ;
  assign rg_state$EN =
	     EN_server_reset_request_put || WILL_FIRE_RL_rl_reset_start ;
  // register rg_tdata1
  assign rg_tdata1$D_IN =
	     MUX_rg_tdata1$write_1__SEL_1 ? new_csr_value__h5354 : 64'd0 ;
  assign rg_tdata1$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d498 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_tdata2
  assign rg_tdata2$D_IN = mav_csr_write_word ;
  assign rg_tdata2$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d502 ;
  // register rg_tdata3
  assign rg_tdata3$D_IN = mav_csr_write_word ;
  assign rg_tdata3$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d504 ;
  // register rg_tselect
  assign rg_tselect$D_IN = 64'd0 ;
  assign rg_tselect$EN =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d496 ||
	     WILL_FIRE_RL_rl_reset_start ;
  // submodule csr_mie
  assign csr_mie$mav_write_misa = 28'd135270661 ;
  assign csr_mie$mav_write_wordxl = mav_csr_write_word ;
  assign csr_mie$EN_reset = MUX_rg_state$write_1__SEL_2 ;
  assign csr_mie$EN_mav_write =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d467 ;
  // submodule csr_mip
  assign csr_mip$m_external_interrupt_req_req =
	     m_external_interrupt_req_set_not_clear ;
  assign csr_mip$mav_write_misa = 28'd135270661 ;
  assign csr_mip$mav_write_wordxl = mav_csr_write_word ;
  assign csr_mip$s_external_interrupt_req_req =
	     s_external_interrupt_req_set_not_clear ;
  assign csr_mip$software_interrupt_req_req =
	     software_interrupt_req_set_not_clear ;
  assign csr_mip$timer_interrupt_req_req = timer_interrupt_req_set_not_clear ;
  assign csr_mip$EN_reset = MUX_rg_state$write_1__SEL_2 ;
  assign csr_mip$EN_mav_write =
	     EN_mav_csr_write &&
	     mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d490 ;
  // submodule f_reset_rsps
  assign f_reset_rsps$ENQ = EN_server_reset_request_put ;
  assign f_reset_rsps$DEQ = EN_server_reset_response_get ;
  assign f_reset_rsps$CLR = 1'b0 ;
  // submodule soc_map
  assign soc_map$m_is_IO_addr_addr = 64'h0 ;
  assign soc_map$m_is_mem_addr_addr = 64'h0 ;
  assign soc_map$m_is_near_mem_IO_addr_addr = 64'h0 ;
  // remaining internal signals
  assign IF_NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_N_ETC___d1140 =
	     (!csr_mip$mv_read[11] || !csr_mie$mv_read[11] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ?
	       4'd3 :
	       4'd11 ;
  assign IF_NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_N_ETC___d1142 =
	     NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1109 ?
	       4'd9 :
	       (NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1104 ?
		  4'd7 :
		  IF_NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_N_ETC___d1140) ;
  assign IF_NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_N_ETC___d1144 =
	     NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1119 ?
	       4'd5 :
	       (NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1114 ?
		  4'd1 :
		  IF_NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_N_ETC___d1142) ;
  assign IF_NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_N_ETC___d1146 =
	     NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1129 ?
	       4'd0 :
	       (NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1124 ?
		  4'd8 :
		  IF_NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_N_ETC___d1144) ;
  assign IF_csr_ret_actions_from_priv_EQ_0b11_45_THEN_c_ETC___d865 =
	     (csr_ret_actions_from_priv == 2'b11) ?
	       _theResult___fst__h8317 :
	       _theResult___fst__h8518 ;
  assign IF_csr_ret_actions_from_priv_EQ_0b11_45_THEN_c_ETC___d883 =
	     (csr_ret_actions_from_priv == 2'b11) ?
	       { csr_mstatus_rg_mstatus_33_AND_INV_1_SL_0_CONCA_ETC___d858[12:11],
		 _theResult___fst__h8317 } :
	       { to_y__h8517, _theResult___fst__h8518 } ;
  assign NOT_access_permitted_1_csr_addr_ULT_0xC03_84_8_ETC___d950 =
	     (access_permitted_1_csr_addr >= 12'hC03 &&
	      access_permitted_1_csr_addr <= 12'hC1F ||
	      access_permitted_1_csr_addr >= 12'hB03 &&
	      access_permitted_1_csr_addr <= 12'hB1F ||
	      access_permitted_1_csr_addr >= 12'h323 &&
	      access_permitted_1_csr_addr <= 12'h33F ||
	      access_permitted_1_csr_addr == 12'hC00 ||
	      access_permitted_1_csr_addr == 12'hC02 ||
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
  assign NOT_access_permitted_2_csr_addr_ULT_0xC03_55_5_ETC___d1020 =
	     (access_permitted_2_csr_addr >= 12'hC03 &&
	      access_permitted_2_csr_addr <= 12'hC1F ||
	      access_permitted_2_csr_addr >= 12'hB03 &&
	      access_permitted_2_csr_addr <= 12'hB1F ||
	      access_permitted_2_csr_addr >= 12'h323 &&
	      access_permitted_2_csr_addr <= 12'h33F ||
	      access_permitted_2_csr_addr == 12'hC00 ||
	      access_permitted_2_csr_addr == 12'hC02 ||
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
  assign NOT_cfg_verbosity_read__51_ULE_1_52___d553 = cfg_verbosity > 4'd1 ;
  assign NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1104 =
	     (!csr_mip$mv_read[11] || !csr_mie$mv_read[11] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) &&
	     (!csr_mip$mv_read[3] || !csr_mie$mv_read[3] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ;
  assign NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1109 =
	     NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1104 &&
	     (!csr_mip$mv_read[7] || !csr_mie$mv_read[7] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ;
  assign NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1114 =
	     NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1109 &&
	     (!csr_mip$mv_read[9] || !csr_mie$mv_read[9] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ;
  assign NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1119 =
	     NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1114 &&
	     (!csr_mip$mv_read[1] || !csr_mie$mv_read[1] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ;
  assign NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1124 =
	     NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1119 &&
	     (!csr_mip$mv_read[5] || !csr_mie$mv_read[5] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ;
  assign NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1129 =
	     NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1124 &&
	     (!csr_mip$mv_read[8] || !csr_mie$mv_read[8] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ;
  assign NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1134 =
	     NOT_csr_mip_mv_read__48_BIT_11_047_094_OR_NOT__ETC___d1129 &&
	     (!csr_mip$mv_read[0] || !csr_mie$mv_read[0] ||
	      interrupt_pending_cur_priv == 2'b11 &&
	      !csr_mstatus_rg_mstatus[3]) ;
  assign NOT_csr_trap_actions_nmi_13_AND_csr_trap_actio_ETC___d790 =
	     !csr_trap_actions_nmi && csr_trap_actions_interrupt &&
	     exc_code__h7988 != 4'd0 &&
	     exc_code__h7988 != 4'd1 &&
	     exc_code__h7988 != 4'd2 &&
	     exc_code__h7988 != 4'd3 &&
	     exc_code__h7988 != 4'd4 &&
	     exc_code__h7988 != 4'd5 &&
	     exc_code__h7988 != 4'd6 &&
	     exc_code__h7988 != 4'd7 &&
	     exc_code__h7988 != 4'd8 &&
	     exc_code__h7988 != 4'd9 &&
	     exc_code__h7988 != 4'd10 &&
	     exc_code__h7988 != 4'd11 ;
  assign _theResult___fst__h8317 =
	     { csr_mstatus_rg_mstatus_33_AND_INV_1_SL_0_CONCA_ETC___d858[63:13],
	       2'd0,
	       csr_mstatus_rg_mstatus_33_AND_INV_1_SL_0_CONCA_ETC___d858[10:0] } ;
  assign _theResult___fst__h8518 =
	     { csr_mstatus_rg_mstatus_33_AND_INV_1_SL_0_CONCA_ETC___d858[63:9],
	       1'd0,
	       csr_mstatus_rg_mstatus_33_AND_INV_1_SL_0_CONCA_ETC___d858[7:0] } ;
  assign b__h8354 = csr_mstatus_rg_mstatus[pie_from_x__h8302] ;
  assign csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1058 =
	     csr_mip$mv_read[11] && csr_mie$mv_read[11] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ||
	     csr_mip$mv_read[3] && csr_mie$mv_read[3] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1063 =
	     csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1058 ||
	     csr_mip$mv_read[7] && csr_mie$mv_read[7] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1068 =
	     csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1063 ||
	     csr_mip$mv_read[9] && csr_mie$mv_read[9] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1073 =
	     csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1068 ||
	     csr_mip$mv_read[1] && csr_mie$mv_read[1] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1078 =
	     csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1073 ||
	     csr_mip$mv_read[5] && csr_mie$mv_read[5] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1083 =
	     csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1078 ||
	     csr_mip$mv_read[8] && csr_mie$mv_read[8] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1088 =
	     csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1083 ||
	     csr_mip$mv_read[0] && csr_mie$mv_read[0] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1093 =
	     csr_mip_mv_read__48_BIT_11_047_AND_csr_mie_mv__ETC___d1088 ||
	     csr_mip$mv_read[4] && csr_mie$mv_read[4] &&
	     (interrupt_pending_cur_priv != 2'b11 ||
	      csr_mstatus_rg_mstatus[3]) ;
  assign csr_mstatus_rg_mstatus_33_AND_INV_1_SL_0_CONCA_ETC___d858 =
	     x__h8350 | mask__h8338 ;
  assign csr_trap_actions_nmi_OR_NOT_csr_trap_actions_i_ETC___d841 =
	     (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	     exc_code__h7988 != 4'd0 &&
	     exc_code__h7988 != 4'd1 &&
	     exc_code__h7988 != 4'd2 &&
	     exc_code__h7988 != 4'd3 &&
	     exc_code__h7988 != 4'd4 &&
	     exc_code__h7988 != 4'd5 &&
	     exc_code__h7988 != 4'd6 &&
	     exc_code__h7988 != 4'd7 &&
	     exc_code__h7988 != 4'd8 &&
	     exc_code__h7988 != 4'd9 &&
	     exc_code__h7988 != 4'd11 &&
	     exc_code__h7988 != 4'd12 &&
	     exc_code__h7988 != 4'd13 &&
	     exc_code__h7988 != 4'd15 ;
  assign exc_code__h7988 =
	     csr_trap_actions_nmi ? 4'd0 : csr_trap_actions_exc_code ;
  assign exc_pc___1__h7305 = exc_pc__h7252 + vector_offset__h7253 ;
  assign exc_pc__h7041 = { rg_mtvec[62:1], 2'd0 } ;
  assign exc_pc__h7252 =
	     csr_trap_actions_nmi ? rg_nmi_vector : exc_pc__h7041 ;
  assign fixed_up_val_23__h3975 =
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
  assign fixed_up_val_23__h6451 =
	     { csr_mstatus_rg_mstatus[22:17],
	       4'd0,
	       mpp__h7346,
	       csr_mstatus_rg_mstatus[10:9],
	       1'd0,
	       csr_mstatus_rg_mstatus[3],
	       csr_mstatus_rg_mstatus[6],
	       3'd0,
	       csr_mstatus_rg_mstatus[2],
	       2'd0 } ;
  assign fixed_up_val_23__h8209 =
	     { IF_csr_ret_actions_from_priv_EQ_0b11_45_THEN_c_ETC___d865[22:17],
	       4'd0,
	       (IF_csr_ret_actions_from_priv_EQ_0b11_45_THEN_c_ETC___d865[12:11] ==
		2'b11) ?
		 IF_csr_ret_actions_from_priv_EQ_0b11_45_THEN_c_ETC___d865[12:11] :
		 2'b0,
	       IF_csr_ret_actions_from_priv_EQ_0b11_45_THEN_c_ETC___d865[10:9],
	       1'd0,
	       IF_csr_ret_actions_from_priv_EQ_0b11_45_THEN_c_ETC___d865[7:6],
	       2'd0,
	       IF_csr_ret_actions_from_priv_EQ_0b11_45_THEN_c_ETC___d865[3:2],
	       2'd0 } ;
  assign ie_from_x__h8301 = { 4'd0, csr_ret_actions_from_priv } ;
  assign mask__h8338 = 64'd1 << pie_from_x__h8302 ;
  assign mask__h8355 = 64'd1 << ie_from_x__h8301 ;
  assign mav_csr_write_csr_addr_ULE_0x33F___d448 =
	     mav_csr_write_csr_addr <= 12'h33F ;
  assign mav_csr_write_csr_addr_ULE_0xB1F___d444 =
	     mav_csr_write_csr_addr <= 12'hB1F ;
  assign mav_csr_write_csr_addr_ULT_0x323_47_OR_NOT_mav_ETC___d549 =
	     (mav_csr_write_csr_addr_ULT_0x323___d447 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d448) &&
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
  assign mav_csr_write_csr_addr_ULT_0x323___d447 =
	     mav_csr_write_csr_addr < 12'h323 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d453 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d443 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d444) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d447 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d448) &&
	     mav_csr_write_csr_addr == 12'h300 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d467 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d443 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d444) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d447 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d448) &&
	     mav_csr_write_csr_addr == 12'h304 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d469 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d443 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d444) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d447 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d448) &&
	     mav_csr_write_csr_addr == 12'h305 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d474 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d443 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d444) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d447 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d448) &&
	     mav_csr_write_csr_addr == 12'h306 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d477 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d443 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d444) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d447 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d448) &&
	     mav_csr_write_csr_addr == 12'h340 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d479 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d443 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d444) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d447 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d448) &&
	     mav_csr_write_csr_addr == 12'h341 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d483 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d443 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d444) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d447 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d448) &&
	     mav_csr_write_csr_addr == 12'h342 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d488 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d443 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d444) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d447 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d448) &&
	     mav_csr_write_csr_addr == 12'h343 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d490 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d443 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d444) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d447 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d448) &&
	     mav_csr_write_csr_addr == 12'h344 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d494 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d443 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d444) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d447 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d448) &&
	     mav_csr_write_csr_addr == 12'hB02 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d496 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d443 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d444) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d447 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d448) &&
	     mav_csr_write_csr_addr == 12'h7A0 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d498 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d443 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d444) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d447 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d448) &&
	     mav_csr_write_csr_addr == 12'h7A1 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d502 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d443 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d444) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d447 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d448) &&
	     mav_csr_write_csr_addr == 12'h7A2 ;
  assign mav_csr_write_csr_addr_ULT_0xB03_43_OR_NOT_mav_ETC___d504 =
	     (mav_csr_write_csr_addr_ULT_0xB03___d443 ||
	      !mav_csr_write_csr_addr_ULE_0xB1F___d444) &&
	     (mav_csr_write_csr_addr_ULT_0x323___d447 ||
	      !mav_csr_write_csr_addr_ULE_0x33F___d448) &&
	     mav_csr_write_csr_addr == 12'h7A3 ;
  assign mav_csr_write_csr_addr_ULT_0xB03___d443 =
	     mav_csr_write_csr_addr < 12'hB03 ;
  assign mpp__h7346 =
	     (csr_trap_actions_from_priv == 2'b11) ?
	       csr_trap_actions_from_priv :
	       2'b0 ;
  assign new_csr_value__h4626 = { mav_csr_write_word[63:1], 1'd0 } ;
  assign new_csr_value__h5354 = { 4'd0, mav_csr_write_word[59:0] } ;
  assign pie_from_x__h8302 = { 4'd1, csr_ret_actions_from_priv } ;
  assign to_y__h8517 =
	     { 1'b0,
	       csr_mstatus_rg_mstatus_33_AND_INV_1_SL_0_CONCA_ETC___d858[8] } ;
  assign v__h4434 =
	     { mav_csr_write_word[63:2], 1'b0, mav_csr_write_word[0] } ;
  assign v__h4496 = { 61'd0, mav_csr_write_word[2:0] } ;
  assign v__h4667 =
	     { mav_csr_write_word[63], 59'd0, mav_csr_write_word[3:0] } ;
  assign val__h8356 = { 63'd0, b__h8354 } << ie_from_x__h8301 ;
  assign vector_offset__h7253 = { 58'd0, csr_trap_actions_exc_code, 2'd0 } ;
  assign wordxl1__h3934 = { 41'd1024, fixed_up_val_23__h3975 } ;
  assign x__h3755 =
	     (!mav_csr_write_csr_addr_ULT_0xB03___d443 &&
	      mav_csr_write_csr_addr_ULE_0xB1F___d444 ||
	      !mav_csr_write_csr_addr_ULT_0x323___d447 &&
	      mav_csr_write_csr_addr_ULE_0x33F___d448 ||
	      mav_csr_write_csr_addr == 12'hF11 ||
	      mav_csr_write_csr_addr == 12'hF12 ||
	      mav_csr_write_csr_addr == 12'hF13 ||
	      mav_csr_write_csr_addr == 12'hF14) ?
	       64'd0 :
	       IF_mav_csr_write_csr_addr_EQ_0x300_52_THEN_102_ETC___d584 ;
  assign x__h5823 =
	     (csr_trap_actions_interrupt && !csr_trap_actions_nmi &&
	      rg_mtvec[0]) ?
	       exc_pc___1__h7305 :
	       exc_pc__h7252 ;
  assign x__h8146 = { 41'd1024, fixed_up_val_23__h6451 } ;
  assign x__h8147 =
	     { !csr_trap_actions_nmi && csr_trap_actions_interrupt,
	       59'd0,
	       exc_code__h7988 } ;
  assign x__h8337 = x__h8367 | val__h8356 ;
  assign x__h8350 = x__h8337 & y__h8351 ;
  assign x__h8367 = csr_mstatus_rg_mstatus & y__h8368 ;
  assign y__h8351 = ~mask__h8338 ;
  assign y__h8368 = ~mask__h8355 ;
  always@(mav_csr_write_csr_addr or
	  mav_csr_write_word or
	  wordxl1__h3934 or
	  csr_mie$mav_write or
	  v__h4434 or
	  v__h4496 or
	  new_csr_value__h4626 or
	  v__h4667 or csr_mip$mav_write or new_csr_value__h5354)
  begin
    case (mav_csr_write_csr_addr)
      12'h300:
	  IF_mav_csr_write_csr_addr_EQ_0x300_52_THEN_102_ETC___d584 =
	      wordxl1__h3934;
      12'h301:
	  IF_mav_csr_write_csr_addr_EQ_0x300_52_THEN_102_ETC___d584 =
	      64'h8000000000101105;
      12'h304:
	  IF_mav_csr_write_csr_addr_EQ_0x300_52_THEN_102_ETC___d584 =
	      csr_mie$mav_write;
      12'h305:
	  IF_mav_csr_write_csr_addr_EQ_0x300_52_THEN_102_ETC___d584 =
	      v__h4434;
      12'h306:
	  IF_mav_csr_write_csr_addr_EQ_0x300_52_THEN_102_ETC___d584 =
	      v__h4496;
      12'h340, 12'h343, 12'hB00, 12'hB02:
	  IF_mav_csr_write_csr_addr_EQ_0x300_52_THEN_102_ETC___d584 =
	      mav_csr_write_word;
      12'h341:
	  IF_mav_csr_write_csr_addr_EQ_0x300_52_THEN_102_ETC___d584 =
	      new_csr_value__h4626;
      12'h342:
	  IF_mav_csr_write_csr_addr_EQ_0x300_52_THEN_102_ETC___d584 =
	      v__h4667;
      12'h344:
	  IF_mav_csr_write_csr_addr_EQ_0x300_52_THEN_102_ETC___d584 =
	      csr_mip$mav_write;
      12'h7A0:
	  IF_mav_csr_write_csr_addr_EQ_0x300_52_THEN_102_ETC___d584 = 64'd0;
      12'h7A1:
	  IF_mav_csr_write_csr_addr_EQ_0x300_52_THEN_102_ETC___d584 =
	      new_csr_value__h5354;
      default: IF_mav_csr_write_csr_addr_EQ_0x300_52_THEN_102_ETC___d584 =
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
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 =
	      csr_mstatus_rg_mstatus;
      12'h301:
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 =
	      64'h8000000000101105;
      12'h304:
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 =
	      csr_mie$mv_read;
      12'h305:
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 =
	      { rg_mtvec[62:1], 1'b0, rg_mtvec[0] };
      12'h306:
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 =
	      { 61'd0, rg_mcounteren };
      12'h340:
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 =
	      rg_mscratch;
      12'h341:
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 = rg_mepc;
      12'h342:
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 =
	      { rg_mcause[4], 59'd0, rg_mcause[3:0] };
      12'h343:
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 =
	      rg_mtval;
      12'h344:
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 =
	      csr_mip$mv_read;
      12'h7A0:
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 =
	      rg_tselect;
      12'h7A1:
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 =
	      rg_tdata1;
      12'h7A2:
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 =
	      rg_tdata2;
      12'hB00, 12'hC00:
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 =
	      rg_mcycle;
      12'hB02, 12'hC02:
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 =
	      rg_minstret;
      12'hF11, 12'hF12, 12'hF13, 12'hF14:
	  IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 = 64'd0;
      default: IF_read_csr_csr_addr_EQ_0xC00_0_THEN_rg_mcycle_ETC___d170 =
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
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 =
	      csr_mstatus_rg_mstatus;
      12'h301:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 =
	      64'h8000000000101105;
      12'h304:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 =
	      csr_mie$mv_read;
      12'h305:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 =
	      { rg_mtvec[62:1], 1'b0, rg_mtvec[0] };
      12'h306:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 =
	      { 61'd0, rg_mcounteren };
      12'h340:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 =
	      rg_mscratch;
      12'h341:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 = rg_mepc;
      12'h342:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 =
	      { rg_mcause[4], 59'd0, rg_mcause[3:0] };
      12'h343:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 =
	      rg_mtval;
      12'h344:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 =
	      csr_mip$mv_read;
      12'h7A0:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 =
	      rg_tselect;
      12'h7A1:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 =
	      rg_tdata1;
      12'h7A2:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 =
	      rg_tdata2;
      12'hB00, 12'hC00:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 =
	      rg_mcycle;
      12'hB02, 12'hC02:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 =
	      rg_minstret;
      12'hF11, 12'hF12, 12'hF13, 12'hF14:
	  IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 = 64'd0;
      default: IF_read_csr_port2_csr_addr_EQ_0xC00_85_THEN_rg_ETC___d305 =
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
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 =
	      csr_mstatus_rg_mstatus;
      12'h301:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 =
	      64'h8000000000101105;
      12'h304:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 =
	      csr_mie$mv_read;
      12'h305:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 =
	      { rg_mtvec[62:1], 1'b0, rg_mtvec[0] };
      12'h306:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 =
	      { 61'd0, rg_mcounteren };
      12'h340:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 =
	      rg_mscratch;
      12'h341:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 = rg_mepc;
      12'h342:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 =
	      { rg_mcause[4], 59'd0, rg_mcause[3:0] };
      12'h343:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 =
	      rg_mtval;
      12'h344:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 =
	      csr_mip$mv_read;
      12'h7A0:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 =
	      rg_tselect;
      12'h7A1:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 =
	      rg_tdata1;
      12'h7A2:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 =
	      rg_tdata2;
      12'hB00, 12'hC00:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 =
	      rg_mcycle;
      12'hB02, 12'hC02:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 =
	      rg_minstret;
      12'hF11, 12'hF12, 12'hF13, 12'hF14:
	  IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 = 64'd0;
      default: IF_mav_read_csr_csr_addr_EQ_0xC00_20_THEN_rg_m_ETC___d440 =
		   rg_tdata3;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cfg_verbosity <= `BSV_ASSIGNMENT_DELAY 4'd0;
	csr_mstatus_rg_mstatus <= `BSV_ASSIGNMENT_DELAY 64'h0000000200000000;
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
    csr_mstatus_rg_mstatus = 64'hAAAAAAAAAAAAAAAA;
    rg_dcsr = 32'hAAAAAAAA;
    rg_dpc = 64'hAAAAAAAAAAAAAAAA;
    rg_dscratch0 = 64'hAAAAAAAAAAAAAAAA;
    rg_dscratch1 = 64'hAAAAAAAAAAAAAAAA;
    rg_mcause = 5'h0A;
    rg_mcounteren = 3'h2;
    rg_mcycle = 64'hAAAAAAAAAAAAAAAA;
    rg_mepc = 64'hAAAAAAAAAAAAAAAA;
    rg_minstret = 64'hAAAAAAAAAAAAAAAA;
    rg_mscratch = 64'hAAAAAAAAAAAAAAAA;
    rg_mtval = 64'hAAAAAAAAAAAAAAAA;
    rg_mtvec = 63'h2AAAAAAAAAAAAAAA;
    rg_nmi = 1'h0;
    rg_nmi_vector = 64'hAAAAAAAAAAAAAAAA;
    rg_state = 1'h0;
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
      if (EN_debug) $display("mip     = 0x%0h", csr_mip$mv_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_debug) $display("mie     = 0x%0h", csr_mie$mv_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$display("%0d: CSR_Regfile.csr_trap_actions:", rg_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$display("    from priv %0d  pc 0x%0h  interrupt %0d  exc_code %0d  xtval 0x%0h",
		 csr_trap_actions_from_priv,
		 csr_trap_actions_pc,
		 csr_trap_actions_interrupt,
		 csr_trap_actions_exc_code,
		 csr_trap_actions_xtval);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write("    priv %0d: ", 2'b11);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" ip: 0x%0h", csr_mip$mv_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" ie: 0x%0h", csr_mie$mv_read);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" edeleg: 0x%0h", 16'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" ideleg: 0x%0h", 12'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" cause:");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd0)
	$write("USER_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd1)
	$write("SUPERVISOR_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd2)
	$write("HYPERVISOR_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd3)
	$write("MACHINE_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd4)
	$write("USER_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd5)
	$write("SUPERVISOR_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd6)
	$write("HYPERVISOR_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd7)
	$write("MACHINE_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd8)
	$write("USER_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd9)
	$write("SUPERVISOR_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd10)
	$write("HYPERVISOR_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd11)
	$write("MACHINE_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
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
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd0)
	$write("INSTRUCTION_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd1)
	$write("INSTRUCTION_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd2)
	$write("ILLEGAL_INSTRUCTION");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd3)
	$write("BREAKPOINT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd4)
	$write("LOAD_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd5)
	$write("LOAD_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd6)
	$write("STORE_AMO_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd7)
	$write("STORE_AMO_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd8)
	$write("ECALL_FROM_U");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd9)
	$write("ECALL_FROM_S");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd11)
	$write("ECALL_FROM_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd12)
	$write("INSTRUCTION_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd13)
	$write("LOAD_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !rg_mcause[4] &&
	  rg_mcause[3:0] == 4'd15)
	$write("STORE_AMO_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
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
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" status: 0x%0h", csr_mstatus_rg_mstatus);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" tvec: 0x%0h", { rg_mtvec[62:1], 1'b0, rg_mtvec[0] });
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" epc: 0x%0h", rg_mepc);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" tval: 0x%0h", rg_mtval);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write("    Return: new pc 0x%0h  ", x__h5823);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" new mstatus:");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write("MStatus{", "sd:%0d", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" sxl:%0d uxl:%0d", 2'd0, 2'd2);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" tsr:%0d", csr_mstatus_rg_mstatus[22]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" tw:%0d", csr_mstatus_rg_mstatus[21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" tvm:%0d", csr_mstatus_rg_mstatus[20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" mxr:%0d", csr_mstatus_rg_mstatus[19]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" sum:%0d", csr_mstatus_rg_mstatus[18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" mprv:%0d", csr_mstatus_rg_mstatus[17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" xs:%0d", 2'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" fs:%0d", 2'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" mpp:%0d", mpp__h7346);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" spp:%0d", 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" pies:%0d_%0d%0d", csr_mstatus_rg_mstatus[3], 1'd0, 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" ies:%0d_%0d%0d", 1'd0, 1'd0, 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" new xcause:");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7988 == 4'd0)
	$write("USER_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7988 == 4'd1)
	$write("SUPERVISOR_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7988 == 4'd2)
	$write("HYPERVISOR_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7988 == 4'd3)
	$write("MACHINE_SW_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7988 == 4'd4)
	$write("USER_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7988 == 4'd5)
	$write("SUPERVISOR_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7988 == 4'd6)
	$write("HYPERVISOR_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7988 == 4'd7)
	$write("MACHINE_TIMER_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7988 == 4'd8)
	$write("USER_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7988 == 4'd9)
	$write("SUPERVISOR_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7988 == 4'd10)
	$write("HYPERVISOR_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  !csr_trap_actions_nmi &&
	  csr_trap_actions_interrupt &&
	  exc_code__h7988 == 4'd11)
	$write("MACHINE_EXTERNAL_INTERRUPT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  NOT_csr_trap_actions_nmi_13_AND_csr_trap_actio_ETC___d790)
	$write("unknown interrupt Exc_Code %d", exc_code__h7988);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7988 == 4'd0)
	$write("INSTRUCTION_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7988 == 4'd1)
	$write("INSTRUCTION_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7988 == 4'd2)
	$write("ILLEGAL_INSTRUCTION");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7988 == 4'd3)
	$write("BREAKPOINT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7988 == 4'd4)
	$write("LOAD_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7988 == 4'd5)
	$write("LOAD_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7988 == 4'd6)
	$write("STORE_AMO_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7988 == 4'd7)
	$write("STORE_AMO_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7988 == 4'd8)
	$write("ECALL_FROM_U");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7988 == 4'd9)
	$write("ECALL_FROM_S");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7988 == 4'd11)
	$write("ECALL_FROM_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7988 == 4'd12)
	$write("INSTRUCTION_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7988 == 4'd13)
	$write("LOAD_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  (csr_trap_actions_nmi || !csr_trap_actions_interrupt) &&
	  exc_code__h7988 == 4'd15)
	$write("STORE_AMO_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553 &&
	  csr_trap_actions_nmi_OR_NOT_csr_trap_actions_i_ETC___d841)
	$write("unknown trap Exc_Code %d", exc_code__h7988);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$write(" new priv %0d", 2'b11);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_csr_trap_actions && NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_mav_csr_write &&
	  (mav_csr_write_csr_addr_ULT_0xB03___d443 ||
	   !mav_csr_write_csr_addr_ULE_0xB1F___d444) &&
	  mav_csr_write_csr_addr_ULT_0x323_47_OR_NOT_mav_ETC___d549 &&
	  NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$display("%0d: ERROR: CSR-write addr 0x%0h val 0x%0h not successful",
		 rg_mcycle,
		 mav_csr_write_csr_addr,
		 mav_csr_write_word);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$display("%0d: CSR_RegFile: m_external_interrupt_req: %x",
		 rg_mcycle,
		 m_external_interrupt_req_set_not_clear);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$display("%0d: CSR_RegFile: s_external_interrupt_req: %x",
		 rg_mcycle,
		 s_external_interrupt_req_set_not_clear);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$display("%0d: CSR_RegFile: software_interrupt_req: %x",
		 rg_mcycle,
		 software_interrupt_req_set_not_clear);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_cfg_verbosity_read__51_ULE_1_52___d553)
	$display("%0d: CSR_RegFile: timer_interrupt_req: %x",
		 rg_mcycle,
		 timer_interrupt_req_set_not_clear);
  end
  // synopsys translate_on
endmodule