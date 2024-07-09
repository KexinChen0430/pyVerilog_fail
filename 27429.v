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
  // register rg_mstatus_MXR
  reg rg_mstatus_MXR;
  wire rg_mstatus_MXR$D_IN, rg_mstatus_MXR$EN;
  // register rg_op
  reg [1 : 0] rg_op;
  wire [1 : 0] rg_op$D_IN;
  wire rg_op$EN;
  // register rg_pa
  reg [63 : 0] rg_pa;
  wire [63 : 0] rg_pa$D_IN;
  wire rg_pa$EN;
  // register rg_priv
  reg [1 : 0] rg_priv;
  wire [1 : 0] rg_priv$D_IN;
  wire rg_priv$EN;
  // register rg_pte_pa
  reg [63 : 0] rg_pte_pa;
  reg [63 : 0] rg_pte_pa$D_IN;
  wire rg_pte_pa$EN;
  // register rg_satp
  reg [63 : 0] rg_satp;
  wire [63 : 0] rg_satp$D_IN;
  wire rg_satp$EN;
  // register rg_sstatus_SUM
  reg rg_sstatus_SUM;
  wire rg_sstatus_SUM$D_IN, rg_sstatus_SUM$EN;
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
  // ports of submodule f_pte_writebacks
  wire [127 : 0] f_pte_writebacks$D_IN, f_pte_writebacks$D_OUT;
  wire f_pte_writebacks$CLR,
       f_pte_writebacks$DEQ,
       f_pte_writebacks$EMPTY_N,
       f_pte_writebacks$ENQ,
       f_pte_writebacks$FULL_N;
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
  reg [96 : 0] master_xactor_f_rd_addr$D_IN;
  wire [96 : 0] master_xactor_f_rd_addr$D_OUT;
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
  // ports of submodule tlb
  reg [1 : 0] tlb$insert_level;
  wire [130 : 0] tlb$lookup;
  wire [63 : 0] tlb$insert_pte, tlb$insert_pte_pa;
  wire [26 : 0] tlb$insert_vpn, tlb$lookup_vpn;
  wire [15 : 0] tlb$insert_asid, tlb$lookup_asid;
  wire tlb$EN_flush, tlb$EN_insert, tlb$RDY_insert, tlb$RDY_lookup;
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
       CAN_FIRE_RL_rl_ptw_level_0,
       CAN_FIRE_RL_rl_ptw_level_1,
       CAN_FIRE_RL_rl_ptw_level_2,
       CAN_FIRE_RL_rl_rereq,
       CAN_FIRE_RL_rl_reset,
       CAN_FIRE_RL_rl_start_cache_refill,
       CAN_FIRE_RL_rl_start_reset,
       CAN_FIRE_RL_rl_start_tlb_refill,
       CAN_FIRE_RL_rl_writeback_updated_PTE,
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
       WILL_FIRE_RL_rl_ptw_level_0,
       WILL_FIRE_RL_rl_ptw_level_1,
       WILL_FIRE_RL_rl_ptw_level_2,
       WILL_FIRE_RL_rl_rereq,
       WILL_FIRE_RL_rl_reset,
       WILL_FIRE_RL_rl_start_cache_refill,
       WILL_FIRE_RL_rl_start_reset,
       WILL_FIRE_RL_rl_start_tlb_refill,
       WILL_FIRE_RL_rl_writeback_updated_PTE,
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
		 MUX_f_fabric_write_reqs$enq_1__VAL_3,
		 MUX_f_fabric_write_reqs$enq_1__VAL_4;
  wire [127 : 0] MUX_ram_cword_set$a_put_3__VAL_1,
		 MUX_ram_cword_set$a_put_3__VAL_2;
  wire [105 : 0] MUX_ram_state_and_ctag_cset$a_put_3__VAL_1;
  wire [96 : 0] MUX_master_xactor_f_rd_addr$enq_1__VAL_1,
		MUX_master_xactor_f_rd_addr$enq_1__VAL_2,
		MUX_master_xactor_f_rd_addr$enq_1__VAL_3,
		MUX_master_xactor_f_rd_addr$enq_1__VAL_4,
		MUX_master_xactor_f_rd_addr$enq_1__VAL_5;
  wire [63 : 0] MUX_dw_output_ld_val$wset_1__VAL_3,
		MUX_rg_ld_val$write_1__VAL_2;
  wire [8 : 0] MUX_ram_cword_set$b_put_2__VAL_2,
	       MUX_ram_cword_set$b_put_2__VAL_4;
  wire [5 : 0] MUX_rg_cset_in_cache$write_1__VAL_1;
  wire [4 : 0] MUX_rg_state$write_1__VAL_11,
	       MUX_rg_state$write_1__VAL_13,
	       MUX_rg_state$write_1__VAL_14,
	       MUX_rg_state$write_1__VAL_15,
	       MUX_rg_state$write_1__VAL_17,
	       MUX_rg_state$write_1__VAL_2,
	       MUX_rg_state$write_1__VAL_4;
  wire [3 : 0] MUX_rg_exc_code$write_1__VAL_1, MUX_rg_exc_code$write_1__VAL_5;
  wire MUX_dw_output_ld_val$wset_1__SEL_1,
       MUX_dw_output_ld_val$wset_1__SEL_2,
       MUX_dw_output_ld_val$wset_1__SEL_4,
       MUX_dw_valid$wset_1__SEL_2,
       MUX_f_fabric_write_reqs$enq_1__SEL_2,
       MUX_master_xactor_f_rd_addr$enq_1__SEL_1,
       MUX_master_xactor_f_rd_addr$enq_1__SEL_2,
       MUX_master_xactor_f_rd_addr$enq_1__SEL_3,
       MUX_ram_cword_set$a_put_1__SEL_1,
       MUX_ram_cword_set$b_put_1__SEL_2,
       MUX_ram_cword_set$b_put_2__SEL_1,
       MUX_ram_state_and_ctag_cset$a_put_1__SEL_1,
       MUX_rg_error_during_refill$write_1__SEL_1,
       MUX_rg_exc_code$write_1__SEL_1,
       MUX_rg_exc_code$write_1__SEL_2,
       MUX_rg_exc_code$write_1__SEL_3,
       MUX_rg_exc_code$write_1__SEL_5,
       MUX_rg_exc_code$write_1__SEL_6,
       MUX_rg_exc_code$write_1__SEL_7,
       MUX_rg_exc_code$write_1__SEL_8,
       MUX_rg_ld_val$write_1__SEL_2,
       MUX_rg_lrsc_valid$write_1__SEL_2,
       MUX_rg_state$write_1__SEL_11,
       MUX_rg_state$write_1__SEL_17,
       MUX_rg_state$write_1__SEL_18,
       MUX_rg_state$write_1__SEL_3,
       MUX_tlb$insert_1__SEL_1,
       MUX_tlb$insert_1__SEL_2,
       MUX_tlb$insert_1__SEL_3,
       MUX_tlb$insert_1__SEL_4;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h4526;
  reg [31 : 0] v__h4621;
  reg [31 : 0] v__h4747;
  reg [31 : 0] v__h21325;
  reg [31 : 0] v__h25029;
  reg [31 : 0] v__h43514;
  reg [31 : 0] v__h28547;
  reg [31 : 0] v__h29498;
  reg [31 : 0] v__h29236;
  reg [31 : 0] v__h29801;
  reg [31 : 0] v__h29918;
  reg [31 : 0] v__h29418;
  reg [31 : 0] v__h30591;
  reg [31 : 0] v__h30332;
  reg [31 : 0] v__h31011;
  reg [31 : 0] v__h30894;
  reg [31 : 0] v__h30511;
  reg [31 : 0] v__h31524;
  reg [31 : 0] v__h31604;
  reg [31 : 0] v__h31695;
  reg [31 : 0] v__h31444;
  reg [31 : 0] v__h31831;
  reg [31 : 0] v__h32639;
  reg [31 : 0] v__h32877;
  reg [31 : 0] v__h43437;
  reg [31 : 0] v__h35556;
  reg [31 : 0] v__h35889;
  reg [31 : 0] v__h36984;
  reg [31 : 0] v__h37112;
  reg [31 : 0] v__h37205;
  reg [31 : 0] v__h37285;
  reg [31 : 0] v__h37512;
  reg [31 : 0] v__h37648;
  reg [31 : 0] v__h37929;
  reg [31 : 0] v__h38111;
  reg [31 : 0] v__h40357;
  reg [31 : 0] v__h38212;
  reg [31 : 0] v__h40958;
  reg [31 : 0] v__h41000;
  reg [31 : 0] v__h4061;
  reg [31 : 0] v__h41354;
  reg [31 : 0] v__h43050;
  reg [31 : 0] v__h4055;
  reg [31 : 0] v__h4520;
  reg [31 : 0] v__h4615;
  reg [31 : 0] v__h4741;
  reg [31 : 0] v__h21319;
  reg [31 : 0] v__h25023;
  reg [31 : 0] v__h28541;
  reg [31 : 0] v__h29230;
  reg [31 : 0] v__h29412;
  reg [31 : 0] v__h29492;
  reg [31 : 0] v__h29795;
  reg [31 : 0] v__h29912;
  reg [31 : 0] v__h30326;
  reg [31 : 0] v__h30505;
  reg [31 : 0] v__h30585;
  reg [31 : 0] v__h30888;
  reg [31 : 0] v__h31005;
  reg [31 : 0] v__h31438;
  reg [31 : 0] v__h31518;
  reg [31 : 0] v__h31598;
  reg [31 : 0] v__h31689;
  reg [31 : 0] v__h31825;
  reg [31 : 0] v__h32633;
  reg [31 : 0] v__h32871;
  reg [31 : 0] v__h35550;
  reg [31 : 0] v__h35883;
  reg [31 : 0] v__h36978;
  reg [31 : 0] v__h37106;
  reg [31 : 0] v__h37199;
  reg [31 : 0] v__h37279;
  reg [31 : 0] v__h37506;
  reg [31 : 0] v__h37642;
  reg [31 : 0] v__h37923;
  reg [31 : 0] v__h38105;
  reg [31 : 0] v__h38206;
  reg [31 : 0] v__h40351;
  reg [31 : 0] v__h40952;
  reg [31 : 0] v__h40994;
  reg [31 : 0] v__h41348;
  reg [31 : 0] v__h43044;
  reg [31 : 0] v__h43431;
  reg [31 : 0] v__h43508;
  // synopsys translate_on
  // remaining internal signals
  reg [63 : 0] CASE_rg_addr_BITS_2_TO_0_0x0_result0077_0x4_re_ETC__q51,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result1153_0x4_re_ETC__q30,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result6776_0x4_re_ETC__q35,
	       CASE_rg_addr_BITS_2_TO_0_0x0_result6841_0x4_re_ETC__q36,
	       CASE_rg_f3_0b0_IF_rg_addr_7_BITS_2_TO_0_21_EQ__ETC__q53,
	       CASE_x1_avValue_pa062_BITS_2_TO_0_0x0_old_cwor_ETC__q31,
	       CASE_x1_avValue_pa062_BITS_2_TO_0_0x0_old_cwor_ETC__q34,
	       IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d759,
	       IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d768,
	       IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d827,
	       IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d836,
	       IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1215,
	       IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1235,
	       IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1324,
	       IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1344,
	       IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1354,
	       IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d616,
	       IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d636,
	       IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d646,
	       IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1199,
	       IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1227,
	       IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1308,
	       IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1336,
	       IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d600,
	       IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d628,
	       IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC___d654,
	       IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_IF_rg_f3_17_E_ETC___d715,
	       _theResult_____2__h25547,
	       _theResult_____2__h38282,
	       _theResult___fst__h6574,
	       ld_val__h35996,
	       mem_req_wr_data_wdata__h3063,
	       n__h22516,
	       n__h25409,
	       new_ld_val__h38242,
	       old_cword__h22505,
	       w1__h25539,
	       w1__h38270,
	       w1__h38274;
  reg [7 : 0] mem_req_wr_data_wstrb__h3064;
  reg [2 : 0] value__h37822, x__h2890;
  reg CASE_rg_amo_funct7_BITS_6_TO_2_0b0_IF_rg_f3_17_ETC__q29,
      IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d324,
      IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d330,
      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_OR_rg_ad_ETC___d241,
      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_OR_rg_ad_ETC___d249,
      IF_rg_f3_17_EQ_0b0_18_OR_rg_f3_17_EQ_0b100_19__ETC___d263,
      IF_rg_f3_17_EQ_0b0_18_OR_rg_f3_17_EQ_0b1_42_OR_ETC___d279,
      IF_rg_f3_17_EQ_0b0_18_THEN_NOT_rg_priv_6_ULE_0_ETC___d339;
  wire [63 : 0] IF_NOT_ram_state_and_ctag_cset_b_read__00_BIT__ETC___d779,
		IF_NOT_ram_state_and_ctag_cset_b_read__00_BIT__ETC___d847,
		IF_ram_state_and_ctag_cset_b_read__00_BIT_105__ETC___d778,
		IF_ram_state_and_ctag_cset_b_read__00_BIT_105__ETC___d846,
		IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_1_E_ETC___d662,
		IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_IF__ETC___d1355,
		IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_ram_ETC___d647,
		IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_rg_st_amo_val_ETC___d784,
		IF_rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_ETC___d856,
		_theResult___fst__h6160,
		_theResult___fst__h6231,
		_theResult___snd_fst__h3071,
		_theResult___snd_fst__h6162,
		_theResult___snd_fst__h6233,
		_theResult___snd_fst__h6803,
		cline_fabric_addr__h31880,
		lev_0_pte_pa__h30623,
		lev_0_pte_pa_w64_fa__h30625,
		lev_1_PTN_pa__h29528,
		lev_1_pte_pa__h29530,
		lev_1_pte_pa_w64_fa__h29532,
		lev_2_pte_pa__h28596,
		lev_2_pte_pa_w64_fa__h28598,
		new_st_val__h25251,
		new_st_val__h25551,
		new_st_val__h25642,
		new_st_val__h26622,
		new_st_val__h26626,
		new_st_val__h26630,
		new_st_val__h26634,
		new_st_val__h26639,
		new_st_val__h26645,
		new_st_val__h26650,
		new_st_val__h38286,
		new_st_val__h38377,
		new_st_val__h40237,
		new_st_val__h40241,
		new_st_val__h40245,
		new_st_val__h40249,
		new_st_val__h40254,
		new_st_val__h40260,
		new_st_val__h40265,
		new_value__h24131,
		new_value__h7718,
		pa___1__h6580,
		pa___1__h6629,
		pa___1__h6698,
		pte___1__h6852,
		pte___1__h6880,
		pte___2__h6572,
		result__h20421,
		result__h20449,
		result__h20477,
		result__h20505,
		result__h20533,
		result__h20561,
		result__h20589,
		result__h20617,
		result__h20662,
		result__h20690,
		result__h20718,
		result__h20746,
		result__h20774,
		result__h20802,
		result__h20830,
		result__h20858,
		result__h20903,
		result__h20931,
		result__h20959,
		result__h20987,
		result__h21028,
		result__h21056,
		result__h21084,
		result__h21112,
		result__h21153,
		result__h21181,
		result__h21220,
		result__h21248,
		result__h36065,
		result__h36095,
		result__h36122,
		result__h36149,
		result__h36176,
		result__h36203,
		result__h36230,
		result__h36257,
		result__h36301,
		result__h36328,
		result__h36355,
		result__h36382,
		result__h36409,
		result__h36436,
		result__h36463,
		result__h36490,
		result__h36534,
		result__h36561,
		result__h36588,
		result__h36615,
		result__h36655,
		result__h36682,
		result__h36709,
		result__h36736,
		result__h36776,
		result__h36803,
		result__h36841,
		result__h36868,
		result__h38465,
		result__h39373,
		result__h39401,
		result__h39429,
		result__h39457,
		result__h39485,
		result__h39513,
		result__h39541,
		result__h39586,
		result__h39614,
		result__h39642,
		result__h39670,
		result__h39698,
		result__h39726,
		result__h39754,
		result__h39782,
		result__h39827,
		result__h39855,
		result__h39883,
		result__h39911,
		result__h39952,
		result__h39980,
		result__h40008,
		result__h40036,
		result__h40077,
		result__h40105,
		result__h40144,
		result__h40172,
		satp_pa__h1890,
		value__h6897,
		vpn_0_pa__h30622,
		vpn_1_pa__h29529,
		vpn_2_pa__h28595,
		w1___1__h25610,
		w1___1__h38345,
		w2___1__h38346,
		w2__h38276,
		word64__h7596,
		x1_avValue_pa__h6062,
		x__h21714,
		x__h38265,
		x__h7735,
		y__h14065,
		y__h7736,
		y__h7750;
  wire [55 : 0] x__h29603, x__h4883, x__h6583, x__h6632, x__h6701;
  wire [31 : 0] IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC__q32,
		ld_val5996_BITS_31_TO_0__q39,
		ld_val5996_BITS_63_TO_32__q46,
		master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3,
		master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10,
		rg_st_amo_val_BITS_31_TO_0__q33,
		w18270_BITS_31_TO_0__q52,
		word64596_BITS_31_TO_0__q17,
		word64596_BITS_63_TO_32__q24;
  wire [15 : 0] ld_val5996_BITS_15_TO_0__q38,
		ld_val5996_BITS_31_TO_16__q42,
		ld_val5996_BITS_47_TO_32__q45,
		ld_val5996_BITS_63_TO_48__q49,
		master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2,
		master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q6,
		master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q9,
		master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13,
		word64596_BITS_15_TO_0__q16,
		word64596_BITS_31_TO_16__q20,
		word64596_BITS_47_TO_32__q23,
		word64596_BITS_63_TO_48__q27;
  wire [7 : 0] ld_val5996_BITS_15_TO_8__q40,
	       ld_val5996_BITS_23_TO_16__q41,
	       ld_val5996_BITS_31_TO_24__q43,
	       ld_val5996_BITS_39_TO_32__q44,
	       ld_val5996_BITS_47_TO_40__q47,
	       ld_val5996_BITS_55_TO_48__q48,
	       ld_val5996_BITS_63_TO_56__q50,
	       ld_val5996_BITS_7_TO_0__q37,
	       master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1,
	       master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4,
	       master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q5,
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q7,
	       master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q8,
	       master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11,
	       master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12,
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14,
	       strobe64__h3007,
	       strobe64__h3009,
	       strobe64__h3011,
	       word64596_BITS_15_TO_8__q18,
	       word64596_BITS_23_TO_16__q19,
	       word64596_BITS_31_TO_24__q21,
	       word64596_BITS_39_TO_32__q22,
	       word64596_BITS_47_TO_40__q25,
	       word64596_BITS_55_TO_48__q26,
	       word64596_BITS_63_TO_56__q28,
	       word64596_BITS_7_TO_0__q15;
  wire [5 : 0] shift_bits__h2857;
  wire [4 : 0] IF_NOT_ram_state_and_ctag_cset_b_read__00_BIT__ETC___d441,
	       IF_rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_ETC___d443,
	       IF_rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_ETC___d442,
	       IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_T_ETC___d445;
  wire [3 : 0] access_exc_code__h2635,
	       b__h28501,
	       exc_code___1__h6472,
	       x1_avValue_exc_code__h6063;
  wire [1 : 0] tmp__h32016, tmp__h32017;
  wire IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d334,
       IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_NOT_ETC___d255,
       IF_rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_ETC___d348,
       IF_rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_ETC___d347,
       IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_T_ETC___d485,
       NOT_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS__ETC___d323,
       NOT_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS__ETC___d329,
       NOT_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS__ETC___d333,
       NOT_cfg_verbosity_read__1_ULE_2_106___d1107,
       NOT_cfg_verbosity_read__1_ULT_2_49___d450,
       NOT_dmem_not_imem_28_AND_rg_op_13_EQ_0_14_OR_r_ETC___d385,
       NOT_dmem_not_imem_28_OR_NOT_rg_op_13_EQ_0_14_1_ETC___d135,
       NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d479,
       NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d675,
       NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d687,
       NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d692,
       NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d700,
       NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d709,
       NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d722,
       NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d859,
       NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d877,
       NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d923,
       NOT_master_xactor_f_rd_data_first__41_BITS_2_T_ETC___d1028,
       NOT_master_xactor_f_rd_data_first__41_BITS_2_T_ETC___d965,
       NOT_master_xactor_f_rd_data_first__41_BIT_3_45_ETC___d1034,
       NOT_master_xactor_f_rd_data_first__41_BIT_3_45_ETC___d972,
       NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236,
       NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d235,
       NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d265,
       NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d285,
       NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d346,
       NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d487,
       NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d690,
       NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d697,
       NOT_req_f3_BITS_1_TO_0_440_EQ_0b0_441_442_AND__ETC___d1461,
       NOT_rg_op_13_EQ_0_14_15_AND_NOT_rg_op_13_EQ_2__ETC___d436,
       NOT_rg_op_13_EQ_1_66_93_AND_NOT_rg_op_13_EQ_2__ETC___d719,
       NOT_rg_op_13_EQ_1_66_93_AND_ram_state_and_ctag_ETC___d706,
       NOT_rg_op_13_EQ_2_16_17_OR_NOT_rg_amo_funct7_1_ETC___d717,
       NOT_rg_op_13_EQ_2_16_17_OR_NOT_rg_amo_funct7_1_ETC___d880,
       NOT_rg_op_13_EQ_2_16_17_OR_NOT_rg_amo_funct7_1_ETC___d886,
       NOT_rg_op_13_EQ_2_16_17_OR_NOT_rg_amo_funct7_1_ETC___d892,
       NOT_rg_priv_6_EQ_0b0_03_78_OR_tlb_lookup_rg_sa_ETC___d392,
       NOT_rg_priv_6_EQ_0b0_03_78_OR_tlb_lookup_rg_sa_ETC___d415,
       NOT_rg_priv_6_EQ_0b0_03_78_OR_tlb_lookup_rg_sa_ETC___d453,
       NOT_rg_priv_6_EQ_0b0_03_78_OR_tlb_lookup_rg_sa_ETC___d669,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d169,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d350,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d397,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d412,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d464,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d465,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d472,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d475,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d481,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d502,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d508,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d509,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d672,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d677,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d683,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d689,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d694,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d702,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d711,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d724,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d854,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d855,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d861,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d867,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d873,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d879,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d884,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d885,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d890,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d896,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d897,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d902,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d903,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d909,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d914,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d915,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d920,
       NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d925,
       NOT_tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_ad_ETC___d150,
       NOT_tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_ad_ETC___d166,
       cfg_verbosity_read__1_ULE_1___d42,
       dmem_not_imem_AND_rg_op_13_EQ_0_14_OR_rg_op_13_ETC___d387,
       dmem_not_imem_OR_NOT_rg_op_13_EQ_0_14_15_AND_N_ETC___d127,
       lrsc_result__h21704,
       master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1007,
       master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1015,
       master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1019,
       master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1050,
       master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1054,
       master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1060,
       master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1085,
       master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d981,
       master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991,
       ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211,
       ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205,
       ram_state_and_ctag_cset_b_read__00_BIT_52_01_A_ETC___d484,
       ram_state_and_ctag_cset_b_read__00_BIT_52_01_A_ETC___d495,
       ram_state_and_ctag_cset_b_read__00_BIT_52_01_A_ETC___d673,
       ram_state_and_ctag_cset_b_read__00_BIT_52_01_A_ETC___d916,
       req_f3_BITS_1_TO_0_440_EQ_0b0_441_OR_req_f3_BI_ETC___d1470,
       rg_amo_funct7_18_BITS_6_TO_2_19_EQ_0b10_20_AND_ETC___d680,
       rg_amo_funct7_18_BITS_6_TO_2_19_EQ_0b1_88_OR_I_ETC___d344,
       rg_lrsc_pa_70_EQ_IF_rg_priv_6_ULE_0b1_7_AND_rg_ETC___d271,
       rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d431,
       rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d468,
       rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d489,
       rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d499,
       rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d503,
       rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d497,
       rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d720,
       rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d850,
       rg_op_13_EQ_2_16_AND_rg_amo_funct7_18_BITS_6_T_ETC___d287,
       rg_priv_6_EQ_0b0_03_AND_NOT_tlb_lookup_rg_satp_ETC___d144,
       rg_priv_6_EQ_0b0_03_AND_NOT_tlb_lookup_rg_satp_ETC___d157,
       rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d153,
       rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d352,
       rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d400,
       rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422,
       rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d439,
       rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d440,
       rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d458,
       rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d461,
       rg_priv_6_ULE_0b1___d87,
       rg_state_1_EQ_13_155_AND_rg_op_13_EQ_0_14_OR_r_ETC___d1157,
       tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_addr_7_ETC___d133,
       tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_addr_7_ETC___d394,
       y__h6398;
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
	  ld_val__h35996 or
	  MUX_dw_output_ld_val$wset_1__SEL_2 or
	  new_ld_val__h38242 or
	  MUX_dw_valid$wset_1__SEL_2 or
	  MUX_dw_output_ld_val$wset_1__VAL_3 or
	  MUX_dw_output_ld_val$wset_1__SEL_4 or rg_ld_val)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_dw_output_ld_val$wset_1__SEL_1: cword = ld_val__h35996;
      MUX_dw_output_ld_val$wset_1__SEL_2: cword = new_ld_val__h38242;
      MUX_dw_valid$wset_1__SEL_2: cword = MUX_dw_output_ld_val$wset_1__VAL_3;
      MUX_dw_output_ld_val$wset_1__SEL_4: cword = rg_ld_val;
      default: cword = 64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  // value method st_amo_val
  assign st_amo_val = MUX_dw_valid$wset_1__SEL_2 ? 64'd0 : rg_st_amo_val ;
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
  FIFO2 #(.width(32'd131), .guarded(1'd1)) f_fabric_write_reqs(.RST(RST_N),
							       .CLK(CLK),
							       .D_IN(f_fabric_write_reqs$D_IN),
							       .ENQ(f_fabric_write_reqs$ENQ),
							       .DEQ(f_fabric_write_reqs$DEQ),
							       .CLR(f_fabric_write_reqs$CLR),
							       .D_OUT(f_fabric_write_reqs$D_OUT),
							       .FULL_N(f_fabric_write_reqs$FULL_N),
							       .EMPTY_N(f_fabric_write_reqs$EMPTY_N));
  // submodule f_pte_writebacks
  FIFO2 #(.width(32'd128), .guarded(1'd1)) f_pte_writebacks(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(f_pte_writebacks$D_IN),
							    .ENQ(f_pte_writebacks$ENQ),
							    .DEQ(f_pte_writebacks$DEQ),
							    .CLR(f_pte_writebacks$CLR),
							    .D_OUT(f_pte_writebacks$D_OUT),
							    .FULL_N(f_pte_writebacks$FULL_N),
							    .EMPTY_N(f_pte_writebacks$EMPTY_N));
  // submodule f_reset_reqs
  FIFO2 #(.width(32'd1), .guarded(1'd1)) f_reset_reqs(.RST(RST_N),
						      .CLK(CLK),
						      .D_IN(f_reset_reqs$D_IN),
						      .ENQ(f_reset_reqs$ENQ),
						      .DEQ(f_reset_reqs$DEQ),
						      .CLR(f_reset_reqs$CLR),
						      .D_OUT(f_reset_reqs$D_OUT),
						      .FULL_N(f_reset_reqs$FULL_N),
						      .EMPTY_N(f_reset_reqs$EMPTY_N));
  // submodule f_reset_rsps
  FIFO2 #(.width(32'd1), .guarded(1'd1)) f_reset_rsps(.RST(RST_N),
						      .CLK(CLK),
						      .D_IN(f_reset_rsps$D_IN),
						      .ENQ(f_reset_rsps$ENQ),
						      .DEQ(f_reset_rsps$DEQ),
						      .CLR(f_reset_rsps$CLR),
						      .D_OUT(f_reset_rsps$D_OUT),
						      .FULL_N(f_reset_rsps$FULL_N),
						      .EMPTY_N(f_reset_rsps$EMPTY_N));
  // submodule master_xactor_f_rd_addr
  FIFO2 #(.width(32'd97), .guarded(1'd1)) master_xactor_f_rd_addr(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(master_xactor_f_rd_addr$D_IN),
								  .ENQ(master_xactor_f_rd_addr$ENQ),
								  .DEQ(master_xactor_f_rd_addr$DEQ),
								  .CLR(master_xactor_f_rd_addr$CLR),
								  .D_OUT(master_xactor_f_rd_addr$D_OUT),
								  .FULL_N(master_xactor_f_rd_addr$FULL_N),
								  .EMPTY_N(master_xactor_f_rd_addr$EMPTY_N));
  // submodule master_xactor_f_rd_data
  FIFO2 #(.width(32'd71), .guarded(1'd1)) master_xactor_f_rd_data(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(master_xactor_f_rd_data$D_IN),
								  .ENQ(master_xactor_f_rd_data$ENQ),
								  .DEQ(master_xactor_f_rd_data$DEQ),
								  .CLR(master_xactor_f_rd_data$CLR),
								  .D_OUT(master_xactor_f_rd_data$D_OUT),
								  .FULL_N(master_xactor_f_rd_data$FULL_N),
								  .EMPTY_N(master_xactor_f_rd_data$EMPTY_N));
  // submodule master_xactor_f_wr_addr
  FIFO2 #(.width(32'd97), .guarded(1'd1)) master_xactor_f_wr_addr(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(master_xactor_f_wr_addr$D_IN),
								  .ENQ(master_xactor_f_wr_addr$ENQ),
								  .DEQ(master_xactor_f_wr_addr$DEQ),
								  .CLR(master_xactor_f_wr_addr$CLR),
								  .D_OUT(master_xactor_f_wr_addr$D_OUT),
								  .FULL_N(master_xactor_f_wr_addr$FULL_N),
								  .EMPTY_N(master_xactor_f_wr_addr$EMPTY_N));
  // submodule master_xactor_f_wr_data
  FIFO2 #(.width(32'd73), .guarded(1'd1)) master_xactor_f_wr_data(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(master_xactor_f_wr_data$D_IN),
								  .ENQ(master_xactor_f_wr_data$ENQ),
								  .DEQ(master_xactor_f_wr_data$DEQ),
								  .CLR(master_xactor_f_wr_data$CLR),
								  .D_OUT(master_xactor_f_wr_data$D_OUT),
								  .FULL_N(master_xactor_f_wr_data$FULL_N),
								  .EMPTY_N(master_xactor_f_wr_data$EMPTY_N));
  // submodule master_xactor_f_wr_resp
  FIFO2 #(.width(32'd6), .guarded(1'd1)) master_xactor_f_wr_resp(.RST(RST_N),
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
  // submodule tlb
  mkTLB #(.dmem_not_imem(dmem_not_imem)) tlb(.CLK(CLK),
					     .RST_N(RST_N),
					     .insert_asid(tlb$insert_asid),
					     .insert_level(tlb$insert_level),
					     .insert_pte(tlb$insert_pte),
					     .insert_pte_pa(tlb$insert_pte_pa),
					     .insert_vpn(tlb$insert_vpn),
					     .lookup_asid(tlb$lookup_asid),
					     .lookup_vpn(tlb$lookup_vpn),
					     .EN_flush(tlb$EN_flush),
					     .EN_insert(tlb$EN_insert),
					     .RDY_flush(),
					     .lookup(tlb$lookup),
					     .RDY_lookup(tlb$RDY_lookup),
					     .RDY_insert(tlb$RDY_insert));
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
  assign CAN_FIRE_RL_rl_reset = WILL_FIRE_RL_rl_reset ;
  assign WILL_FIRE_RL_rl_reset =
	     (rg_cset_in_cache != 6'd63 ||
	      f_reset_reqs$EMPTY_N && f_reset_rsps$FULL_N) &&
	     rg_state == 5'd1 ;
  // rule RL_rl_probe_and_immed_rsp
  assign CAN_FIRE_RL_rl_probe_and_immed_rsp =
	     (cfg_verbosity_read__1_ULE_1___d42 || tlb$RDY_lookup) &&
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$RDY_lookup) &&
	     rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d352 &&
	     rg_ddr4_ready &&
	     rg_state == 5'd3 ;
  assign WILL_FIRE_RL_rl_probe_and_immed_rsp =
	     CAN_FIRE_RL_rl_probe_and_immed_rsp &&
	     !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_start_tlb_refill
  assign CAN_FIRE_RL_rl_start_tlb_refill =
	     master_xactor_f_rd_addr$FULL_N && rg_state == 5'd5 &&
	     b__h28501 == 4'd0 ;
  assign WILL_FIRE_RL_rl_start_tlb_refill =
	     CAN_FIRE_RL_rl_start_tlb_refill && !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_ptw_level_2
  assign CAN_FIRE_RL_rl_ptw_level_2 =
	     master_xactor_f_rd_data$EMPTY_N &&
	     NOT_master_xactor_f_rd_data_first__41_BITS_2_T_ETC___d965 &&
	     rg_state == 5'd6 ;
  assign WILL_FIRE_RL_rl_ptw_level_2 =
	     CAN_FIRE_RL_rl_ptw_level_2 && !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_ptw_level_1
  assign CAN_FIRE_RL_rl_ptw_level_1 =
	     master_xactor_f_rd_data$EMPTY_N &&
	     NOT_master_xactor_f_rd_data_first__41_BITS_2_T_ETC___d1028 &&
	     rg_state == 5'd7 ;
  assign WILL_FIRE_RL_rl_ptw_level_1 =
	     CAN_FIRE_RL_rl_ptw_level_1 && !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_ptw_level_0
  assign CAN_FIRE_RL_rl_ptw_level_0 =
	     master_xactor_f_rd_data$EMPTY_N &&
	     (master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	      !master_xactor_f_rd_data$D_OUT[3] ||
	      !master_xactor_f_rd_data$D_OUT[4] &&
	      master_xactor_f_rd_data$D_OUT[5] ||
	      !master_xactor_f_rd_data$D_OUT[6] &&
	      !master_xactor_f_rd_data$D_OUT[4] ||
	      tlb$RDY_insert) &&
	     rg_state == 5'd8 ;
  assign WILL_FIRE_RL_rl_ptw_level_0 =
	     CAN_FIRE_RL_rl_ptw_level_0 && !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_start_cache_refill
  assign CAN_FIRE_RL_rl_start_cache_refill =
	     master_xactor_f_rd_addr$FULL_N && rg_state == 5'd9 &&
	     b__h28501 == 4'd0 ;
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
	     rg_state_1_EQ_13_155_AND_rg_op_13_EQ_0_14_OR_r_ETC___d1157 ;
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
  // rule RL_rl_writeback_updated_PTE
  assign CAN_FIRE_RL_rl_writeback_updated_PTE =
	     f_pte_writebacks$EMPTY_N && f_fabric_write_reqs$FULL_N ;
  assign WILL_FIRE_RL_rl_writeback_updated_PTE =
	     CAN_FIRE_RL_rl_writeback_updated_PTE &&
	     !WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     !WILL_FIRE_RL_rl_io_write_req &&
	     !WILL_FIRE_RL_rl_probe_and_immed_rsp ;
  // rule RL_rl_io_AMO_read_rsp
  assign CAN_FIRE_RL_rl_io_AMO_read_rsp =
	     master_xactor_f_rd_data$EMPTY_N &&
	     (master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	      f_fabric_write_reqs$FULL_N) &&
	     rg_state == 5'd16 ;
  assign WILL_FIRE_RL_rl_io_AMO_read_rsp =
	     CAN_FIRE_RL_rl_io_AMO_read_rsp && !WILL_FIRE_RL_rl_start_reset ;
  // rule RL_rl_discard_write_rsp
  assign CAN_FIRE_RL_rl_discard_write_rsp =
	     b__h28501 != 4'd0 && master_xactor_f_wr_resp$EMPTY_N ;
  assign WILL_FIRE_RL_rl_discard_write_rsp =
	     CAN_FIRE_RL_rl_discard_write_rsp ;
  // rule RL_rl_drive_exception_rsp
  assign CAN_FIRE_RL_rl_drive_exception_rsp = rg_state == 5'd4 ;
  assign WILL_FIRE_RL_rl_drive_exception_rsp = rg_state == 5'd4 ;
  // rule RL_rl_start_reset
  assign CAN_FIRE_RL_rl_start_reset = MUX_rg_state$write_1__SEL_3 ;
  assign WILL_FIRE_RL_rl_start_reset = MUX_rg_state$write_1__SEL_3 ;
  // inputs to muxes for submodule ports
  assign MUX_dw_output_ld_val$wset_1__SEL_1 =
	     WILL_FIRE_RL_rl_io_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_dw_output_ld_val$wset_1__SEL_2 =
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_dw_output_ld_val$wset_1__SEL_4 =
	     WILL_FIRE_RL_rl_maintain_io_read_rsp ||
	     WILL_FIRE_RL_rl_ST_AMO_response ;
  assign MUX_dw_valid$wset_1__SEL_2 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d509 ;
  assign MUX_f_fabric_write_reqs$enq_1__SEL_2 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d855 ;
  assign MUX_master_xactor_f_rd_addr$enq_1__SEL_1 =
	     WILL_FIRE_RL_rl_ptw_level_2 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     !master_xactor_f_rd_data$D_OUT[5] &&
	     !master_xactor_f_rd_data$D_OUT[6] &&
	     !master_xactor_f_rd_data$D_OUT[4] ;
  assign MUX_master_xactor_f_rd_addr$enq_1__SEL_2 =
	     WILL_FIRE_RL_rl_ptw_level_1 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     !master_xactor_f_rd_data$D_OUT[5] &&
	     !master_xactor_f_rd_data$D_OUT[6] &&
	     !master_xactor_f_rd_data$D_OUT[4] ;
  assign MUX_master_xactor_f_rd_addr$enq_1__SEL_3 =
	     WILL_FIRE_RL_rl_io_AMO_op_req || WILL_FIRE_RL_rl_io_read_req ;
  assign MUX_ram_cword_set$a_put_1__SEL_1 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_ram_cword_set$b_put_1__SEL_2 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] != 3'd7 ;
  assign MUX_ram_cword_set$b_put_2__SEL_1 =
	     EN_req &&
	     req_f3_BITS_1_TO_0_440_EQ_0b0_441_OR_req_f3_BI_ETC___d1470 ;
  assign MUX_ram_state_and_ctag_cset$a_put_1__SEL_1 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] == 3'd0 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ;
  assign MUX_rg_error_during_refill$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign MUX_rg_exc_code$write_1__SEL_1 =
	     EN_req &&
	     NOT_req_f3_BITS_1_TO_0_440_EQ_0b0_441_442_AND__ETC___d1461 ;
  assign MUX_rg_exc_code$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign MUX_rg_exc_code$write_1__SEL_3 =
	     WILL_FIRE_RL_rl_io_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign MUX_rg_exc_code$write_1__SEL_5 =
	     WILL_FIRE_RL_rl_ptw_level_0 &&
	     (!master_xactor_f_rd_data$D_OUT[3] ||
	      !master_xactor_f_rd_data$D_OUT[4] &&
	      master_xactor_f_rd_data$D_OUT[5] ||
	      !master_xactor_f_rd_data$D_OUT[6] &&
	      !master_xactor_f_rd_data$D_OUT[4] ||
	      master_xactor_f_rd_data$D_OUT[2:1] != 2'b0) ;
  assign MUX_rg_exc_code$write_1__SEL_6 =
	     WILL_FIRE_RL_rl_ptw_level_1 &&
	     NOT_master_xactor_f_rd_data_first__41_BIT_3_45_ETC___d1034 ;
  assign MUX_rg_exc_code$write_1__SEL_7 =
	     WILL_FIRE_RL_rl_ptw_level_2 &&
	     NOT_master_xactor_f_rd_data_first__41_BIT_3_45_ETC___d972 ;
  assign MUX_rg_exc_code$write_1__SEL_8 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d153 ;
  assign MUX_rg_ld_val$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d711 ;
  assign MUX_rg_lrsc_valid$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d502 ;
  assign MUX_rg_state$write_1__SEL_3 =
	     f_reset_reqs$EMPTY_N && rg_state != 5'd1 ;
  assign MUX_rg_state$write_1__SEL_11 =
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] == 3'd7 ;
  assign MUX_rg_state$write_1__SEL_17 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d440 ;
  assign MUX_rg_state$write_1__SEL_18 =
	     WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 ;
  assign MUX_tlb$insert_1__SEL_1 =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 ;
  assign MUX_tlb$insert_1__SEL_2 =
	     WILL_FIRE_RL_rl_ptw_level_2 &&
	     master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1015 ;
  assign MUX_tlb$insert_1__SEL_3 =
	     WILL_FIRE_RL_rl_ptw_level_1 &&
	     master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1050 ;
  assign MUX_tlb$insert_1__SEL_4 =
	     WILL_FIRE_RL_rl_ptw_level_0 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     (master_xactor_f_rd_data$D_OUT[4] ||
	      !master_xactor_f_rd_data$D_OUT[5]) &&
	     (master_xactor_f_rd_data$D_OUT[6] ||
	      master_xactor_f_rd_data$D_OUT[4]) ;
  assign MUX_dw_output_ld_val$wset_1__VAL_3 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) ?
	       new_value__h7718 :
	       new_value__h24131 ;
  assign MUX_f_fabric_write_reqs$enq_1__VAL_1 = { rg_f3, rg_pa, x__h38265 } ;
  assign MUX_f_fabric_write_reqs$enq_1__VAL_2 =
	     { rg_f3,
	       x1_avValue_pa__h6062,
	       IF_rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_ETC___d856 } ;
  assign MUX_f_fabric_write_reqs$enq_1__VAL_3 =
	     { 3'b011, f_pte_writebacks$D_OUT } ;
  assign MUX_f_fabric_write_reqs$enq_1__VAL_4 =
	     { rg_f3, rg_pa, rg_st_amo_val } ;
  assign MUX_master_xactor_f_rd_addr$enq_1__VAL_1 =
	     { 4'd0, lev_1_pte_pa_w64_fa__h29532, 29'd851968 } ;
  assign MUX_master_xactor_f_rd_addr$enq_1__VAL_2 =
	     { 4'd0, lev_0_pte_pa_w64_fa__h30625, 29'd851968 } ;
  assign MUX_master_xactor_f_rd_addr$enq_1__VAL_3 =
	     { 4'd0, rg_pa, 8'd0, value__h37822, 18'd65536 } ;
  assign MUX_master_xactor_f_rd_addr$enq_1__VAL_4 =
	     { 4'd0, lev_2_pte_pa_w64_fa__h28598, 29'd851968 } ;
  assign MUX_master_xactor_f_rd_addr$enq_1__VAL_5 =
	     { 4'd0, cline_fabric_addr__h31880, 29'd15532032 } ;
  assign MUX_ram_cword_set$a_put_3__VAL_1 =
	     rg_victim_way ?
	       { master_xactor_f_rd_data$D_OUT[66:3],
		 ram_cword_set$DOB[63:0] } :
	       { ram_cword_set$DOB[127:64],
		 master_xactor_f_rd_data$D_OUT[66:3] } ;
  assign MUX_ram_cword_set$a_put_3__VAL_2 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       { IF_ram_state_and_ctag_cset_b_read__00_BIT_105__ETC___d778,
		 IF_NOT_ram_state_and_ctag_cset_b_read__00_BIT__ETC___d779 } :
	       { IF_ram_state_and_ctag_cset_b_read__00_BIT_105__ETC___d846,
		 IF_NOT_ram_state_and_ctag_cset_b_read__00_BIT__ETC___d847 } ;
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
  assign MUX_rg_exc_code$write_1__VAL_5 =
	     (master_xactor_f_rd_data$D_OUT[2:1] == 2'b0) ?
	       exc_code___1__h6472 :
	       access_exc_code__h2635 ;
  assign MUX_rg_ld_val$write_1__VAL_2 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       x__h21714 :
	       IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_IF_rg_f3_17_E_ETC___d715 ;
  assign MUX_rg_state$write_1__VAL_2 =
	     NOT_req_f3_BITS_1_TO_0_440_EQ_0b0_441_442_AND__ETC___d1461 ?
	       5'd4 :
	       5'd3 ;
  assign MUX_rg_state$write_1__VAL_4 =
	     (master_xactor_f_rd_data$D_OUT[2:1] == 2'b0) ? 5'd15 : 5'd4 ;
  assign MUX_rg_state$write_1__VAL_11 =
	     (master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	      rg_error_during_refill) ?
	       5'd4 :
	       5'd11 ;
  assign MUX_rg_state$write_1__VAL_13 =
	     (master_xactor_f_rd_data$D_OUT[2:1] == 2'b0) ?
	       ((!master_xactor_f_rd_data$D_OUT[3] ||
		 !master_xactor_f_rd_data$D_OUT[4] &&
		 master_xactor_f_rd_data$D_OUT[5] ||
		 !master_xactor_f_rd_data$D_OUT[6] &&
		 !master_xactor_f_rd_data$D_OUT[4]) ?
		  5'd4 :
		  5'd11) :
	       5'd4 ;
  assign MUX_rg_state$write_1__VAL_14 =
	     (master_xactor_f_rd_data$D_OUT[2:1] == 2'b0) ?
	       ((!master_xactor_f_rd_data$D_OUT[3] ||
		 !master_xactor_f_rd_data$D_OUT[4] &&
		 master_xactor_f_rd_data$D_OUT[5]) ?
		  5'd4 :
		  ((!master_xactor_f_rd_data$D_OUT[6] &&
		    !master_xactor_f_rd_data$D_OUT[4]) ?
		     5'd8 :
		     ((master_xactor_f_rd_data$D_OUT[21:13] == 9'd0) ?
			5'd11 :
			5'd4))) :
	       5'd4 ;
  assign MUX_rg_state$write_1__VAL_15 =
	     (master_xactor_f_rd_data$D_OUT[2:1] == 2'b0) ?
	       ((!master_xactor_f_rd_data$D_OUT[3] ||
		 !master_xactor_f_rd_data$D_OUT[4] &&
		 master_xactor_f_rd_data$D_OUT[5]) ?
		  5'd4 :
		  ((!master_xactor_f_rd_data$D_OUT[6] &&
		    !master_xactor_f_rd_data$D_OUT[4]) ?
		     5'd7 :
		     ((master_xactor_f_rd_data$D_OUT[30:22] != 9'd0 ||
		       master_xactor_f_rd_data$D_OUT[21:13] != 9'd0) ?
			5'd4 :
			5'd11))) :
	       5'd4 ;
  assign MUX_rg_state$write_1__VAL_17 =
	     (rg_priv_6_ULE_0b1___d87 && rg_satp[63:60] == 4'd8 &&
	      !tlb$lookup[130]) ?
	       5'd5 :
	       IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_T_ETC___d445 ;
  // inlined wires
  assign dw_valid$whas =
	     (WILL_FIRE_RL_rl_io_read_rsp ||
	      WILL_FIRE_RL_rl_io_AMO_read_rsp) &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d509 ||
	     WILL_FIRE_RL_rl_drive_exception_rsp ||
	     WILL_FIRE_RL_rl_maintain_io_read_rsp ||
	     WILL_FIRE_RL_rl_ST_AMO_response ;
  assign ctr_wr_rsps_pending_crg$port0__write_1 =
	     ctr_wr_rsps_pending_crg + 4'd1 ;
  assign ctr_wr_rsps_pending_crg$port1__write_1 = b__h28501 - 4'd1 ;
  assign ctr_wr_rsps_pending_crg$port2__read =
	     CAN_FIRE_RL_rl_discard_write_rsp ?
	       ctr_wr_rsps_pending_crg$port1__write_1 :
	       b__h28501 ;
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
	  MUX_rg_error_during_refill$write_1__SEL_1 or
	  access_exc_code__h2635 or
	  MUX_rg_exc_code$write_1__SEL_5 or
	  MUX_rg_exc_code$write_1__VAL_5 or
	  MUX_rg_exc_code$write_1__SEL_6 or
	  MUX_rg_exc_code$write_1__SEL_7 or
	  MUX_rg_exc_code$write_1__SEL_8 or x1_avValue_exc_code__h6063)
  case (1'b1)
    MUX_rg_exc_code$write_1__SEL_1:
	rg_exc_code$D_IN = MUX_rg_exc_code$write_1__VAL_1;
    MUX_rg_exc_code$write_1__SEL_2: rg_exc_code$D_IN = 4'd7;
    MUX_rg_exc_code$write_1__SEL_3: rg_exc_code$D_IN = 4'd5;
    MUX_rg_error_during_refill$write_1__SEL_1:
	rg_exc_code$D_IN = access_exc_code__h2635;
    MUX_rg_exc_code$write_1__SEL_5:
	rg_exc_code$D_IN = MUX_rg_exc_code$write_1__VAL_5;
    MUX_rg_exc_code$write_1__SEL_6:
	rg_exc_code$D_IN = MUX_rg_exc_code$write_1__VAL_5;
    MUX_rg_exc_code$write_1__SEL_7:
	rg_exc_code$D_IN = MUX_rg_exc_code$write_1__VAL_5;
    MUX_rg_exc_code$write_1__SEL_8:
	rg_exc_code$D_IN = x1_avValue_exc_code__h6063;
    default: rg_exc_code$D_IN = 4'b1010 /* unspecified value */ ;
  endcase
  assign rg_exc_code$EN =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d153 ||
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	     WILL_FIRE_RL_rl_io_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	     EN_req &&
	     NOT_req_f3_BITS_1_TO_0_440_EQ_0b0_441_442_AND__ETC___d1461 ||
	     WILL_FIRE_RL_rl_ptw_level_2 &&
	     NOT_master_xactor_f_rd_data_first__41_BIT_3_45_ETC___d972 ||
	     WILL_FIRE_RL_rl_ptw_level_1 &&
	     NOT_master_xactor_f_rd_data_first__41_BIT_3_45_ETC___d1034 ||
	     WILL_FIRE_RL_rl_ptw_level_0 &&
	     (!master_xactor_f_rd_data$D_OUT[3] ||
	      !master_xactor_f_rd_data$D_OUT[4] &&
	      master_xactor_f_rd_data$D_OUT[5] ||
	      !master_xactor_f_rd_data$D_OUT[6] &&
	      !master_xactor_f_rd_data$D_OUT[4] ||
	      master_xactor_f_rd_data$D_OUT[2:1] != 2'b0) ;
  // register rg_f3
  assign rg_f3$D_IN = req_f3 ;
  assign rg_f3$EN = EN_req ;
  // register rg_ld_val
  always@(MUX_dw_output_ld_val$wset_1__SEL_2 or
	  new_ld_val__h38242 or
	  MUX_rg_ld_val$write_1__SEL_2 or
	  MUX_rg_ld_val$write_1__VAL_2 or
	  WILL_FIRE_RL_rl_io_read_rsp or
	  ld_val__h35996 or WILL_FIRE_RL_rl_io_AMO_SC_req)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_dw_output_ld_val$wset_1__SEL_2: rg_ld_val$D_IN = new_ld_val__h38242;
      MUX_rg_ld_val$write_1__SEL_2:
	  rg_ld_val$D_IN = MUX_rg_ld_val$write_1__VAL_2;
      WILL_FIRE_RL_rl_io_read_rsp: rg_ld_val$D_IN = ld_val__h35996;
      WILL_FIRE_RL_rl_io_AMO_SC_req: rg_ld_val$D_IN = 64'd1;
      default: rg_ld_val$D_IN = 64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign rg_ld_val$EN =
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d711 ||
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
  assign rg_lrsc_pa$D_IN = soc_map$m_is_mem_addr_addr ;
  assign rg_lrsc_pa$EN =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d683 ;
  // register rg_lrsc_valid
  assign rg_lrsc_valid$D_IN =
	     MUX_rg_lrsc_valid$write_1__SEL_2 &&
	     rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d503 ;
  assign rg_lrsc_valid$EN =
	     WILL_FIRE_RL_rl_io_read_req && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d502 ||
	     WILL_FIRE_RL_rl_start_reset ;
  // register rg_mstatus_MXR
  assign rg_mstatus_MXR$D_IN = req_mstatus_MXR ;
  assign rg_mstatus_MXR$EN = EN_req ;
  // register rg_op
  assign rg_op$D_IN = req_op ;
  assign rg_op$EN = EN_req ;
  // register rg_pa
  assign rg_pa$D_IN = EN_req ? req_addr : soc_map$m_is_mem_addr_addr ;
  assign rg_pa$EN =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d465 ||
	     EN_req ;
  // register rg_priv
  assign rg_priv$D_IN = req_priv ;
  assign rg_priv$EN = EN_req ;
  // register rg_pte_pa
  always@(MUX_master_xactor_f_rd_addr$enq_1__SEL_1 or
	  lev_1_pte_pa__h29530 or
	  MUX_master_xactor_f_rd_addr$enq_1__SEL_2 or
	  lev_0_pte_pa__h30623 or
	  WILL_FIRE_RL_rl_start_tlb_refill or lev_2_pte_pa__h28596)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_master_xactor_f_rd_addr$enq_1__SEL_1:
	  rg_pte_pa$D_IN = lev_1_pte_pa__h29530;
      MUX_master_xactor_f_rd_addr$enq_1__SEL_2:
	  rg_pte_pa$D_IN = lev_0_pte_pa__h30623;
      WILL_FIRE_RL_rl_start_tlb_refill: rg_pte_pa$D_IN = lev_2_pte_pa__h28596;
      default: rg_pte_pa$D_IN = 64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign rg_pte_pa$EN =
	     WILL_FIRE_RL_rl_ptw_level_2 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     !master_xactor_f_rd_data$D_OUT[5] &&
	     !master_xactor_f_rd_data$D_OUT[6] &&
	     !master_xactor_f_rd_data$D_OUT[4] ||
	     WILL_FIRE_RL_rl_ptw_level_1 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     !master_xactor_f_rd_data$D_OUT[5] &&
	     !master_xactor_f_rd_data$D_OUT[6] &&
	     !master_xactor_f_rd_data$D_OUT[4] ||
	     WILL_FIRE_RL_rl_start_tlb_refill ;
  // register rg_satp
  assign rg_satp$D_IN = req_satp ;
  assign rg_satp$EN = EN_req ;
  // register rg_sstatus_SUM
  assign rg_sstatus_SUM$D_IN = req_sstatus_SUM ;
  assign rg_sstatus_SUM$EN = EN_req ;
  // register rg_st_amo_val
  assign rg_st_amo_val$D_IN = EN_req ? req_st_value : new_st_val__h25251 ;
  assign rg_st_amo_val$EN =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d925 ||
	     EN_req ;
  // register rg_state
  always@(EN_tlb_flush or
	  EN_req or
	  MUX_rg_state$write_1__VAL_2 or
	  WILL_FIRE_RL_rl_start_reset or
	  WILL_FIRE_RL_rl_io_AMO_read_rsp or
	  MUX_rg_state$write_1__VAL_4 or
	  WILL_FIRE_RL_rl_io_AMO_op_req or
	  WILL_FIRE_RL_rl_io_AMO_SC_req or
	  WILL_FIRE_RL_rl_io_write_req or
	  WILL_FIRE_RL_rl_io_read_rsp or
	  WILL_FIRE_RL_rl_io_read_req or
	  WILL_FIRE_RL_rl_rereq or
	  MUX_rg_state$write_1__SEL_11 or
	  MUX_rg_state$write_1__VAL_11 or
	  WILL_FIRE_RL_rl_start_cache_refill or
	  WILL_FIRE_RL_rl_ptw_level_0 or
	  MUX_rg_state$write_1__VAL_13 or
	  WILL_FIRE_RL_rl_ptw_level_1 or
	  MUX_rg_state$write_1__VAL_14 or
	  WILL_FIRE_RL_rl_ptw_level_2 or
	  MUX_rg_state$write_1__VAL_15 or
	  WILL_FIRE_RL_rl_start_tlb_refill or
	  MUX_rg_state$write_1__SEL_17 or
	  MUX_rg_state$write_1__VAL_17 or MUX_rg_state$write_1__SEL_18)
  case (1'b1)
    EN_tlb_flush: rg_state$D_IN = 5'd2;
    EN_req: rg_state$D_IN = MUX_rg_state$write_1__VAL_2;
    WILL_FIRE_RL_rl_start_reset: rg_state$D_IN = 5'd1;
    WILL_FIRE_RL_rl_io_AMO_read_rsp:
	rg_state$D_IN = MUX_rg_state$write_1__VAL_4;
    WILL_FIRE_RL_rl_io_AMO_op_req: rg_state$D_IN = 5'd16;
    WILL_FIRE_RL_rl_io_AMO_SC_req || WILL_FIRE_RL_rl_io_write_req:
	rg_state$D_IN = 5'd12;
    WILL_FIRE_RL_rl_io_read_rsp: rg_state$D_IN = MUX_rg_state$write_1__VAL_4;
    WILL_FIRE_RL_rl_io_read_req: rg_state$D_IN = 5'd14;
    WILL_FIRE_RL_rl_rereq: rg_state$D_IN = 5'd3;
    MUX_rg_state$write_1__SEL_11:
	rg_state$D_IN = MUX_rg_state$write_1__VAL_11;
    WILL_FIRE_RL_rl_start_cache_refill: rg_state$D_IN = 5'd10;
    WILL_FIRE_RL_rl_ptw_level_0: rg_state$D_IN = MUX_rg_state$write_1__VAL_13;
    WILL_FIRE_RL_rl_ptw_level_1: rg_state$D_IN = MUX_rg_state$write_1__VAL_14;
    WILL_FIRE_RL_rl_ptw_level_2: rg_state$D_IN = MUX_rg_state$write_1__VAL_15;
    WILL_FIRE_RL_rl_start_tlb_refill: rg_state$D_IN = 5'd6;
    MUX_rg_state$write_1__SEL_17:
	rg_state$D_IN = MUX_rg_state$write_1__VAL_17;
    MUX_rg_state$write_1__SEL_18: rg_state$D_IN = 5'd2;
    default: rg_state$D_IN = 5'b01010 /* unspecified value */ ;
  endcase
  assign rg_state$EN =
	     WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 ||
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	     rg_cset_cword_in_cache[2:0] == 3'd7 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d440 ||
	     WILL_FIRE_RL_rl_io_read_rsp ||
	     WILL_FIRE_RL_rl_io_AMO_read_rsp ||
	     WILL_FIRE_RL_rl_ptw_level_2 ||
	     WILL_FIRE_RL_rl_ptw_level_1 ||
	     WILL_FIRE_RL_rl_ptw_level_0 ||
	     EN_req ||
	     WILL_FIRE_RL_rl_start_reset ||
	     EN_tlb_flush ||
	     WILL_FIRE_RL_rl_rereq ||
	     WILL_FIRE_RL_rl_start_tlb_refill ||
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
  assign rg_victim_way$D_IN = tmp__h32017[0] ;
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
	  WILL_FIRE_RL_rl_writeback_updated_PTE or
	  MUX_f_fabric_write_reqs$enq_1__VAL_3 or
	  WILL_FIRE_RL_rl_io_write_req or
	  MUX_f_fabric_write_reqs$enq_1__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_dw_output_ld_val$wset_1__SEL_2:
	  f_fabric_write_reqs$D_IN = MUX_f_fabric_write_reqs$enq_1__VAL_1;
      MUX_f_fabric_write_reqs$enq_1__SEL_2:
	  f_fabric_write_reqs$D_IN = MUX_f_fabric_write_reqs$enq_1__VAL_2;
      WILL_FIRE_RL_rl_writeback_updated_PTE:
	  f_fabric_write_reqs$D_IN = MUX_f_fabric_write_reqs$enq_1__VAL_3;
      WILL_FIRE_RL_rl_io_write_req:
	  f_fabric_write_reqs$D_IN = MUX_f_fabric_write_reqs$enq_1__VAL_4;
      default: f_fabric_write_reqs$D_IN =
		   131'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign f_fabric_write_reqs$ENQ =
	     WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 ||
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d855 ||
	     WILL_FIRE_RL_rl_writeback_updated_PTE ||
	     WILL_FIRE_RL_rl_io_write_req ;
  assign f_fabric_write_reqs$DEQ = CAN_FIRE_RL_rl_fabric_send_write_req ;
  assign f_fabric_write_reqs$CLR = 1'b0 ;
  // submodule f_pte_writebacks
  assign f_pte_writebacks$D_IN = { tlb$lookup[63:0], value__h6897 } ;
  assign f_pte_writebacks$ENQ = MUX_tlb$insert_1__SEL_1 ;
  assign f_pte_writebacks$DEQ = WILL_FIRE_RL_rl_writeback_updated_PTE ;
  assign f_pte_writebacks$CLR = 1'b0 ;
  // submodule f_reset_reqs
  assign f_reset_reqs$D_IN = !EN_server_reset_request_put ;
  assign f_reset_reqs$ENQ =
	     EN_server_reset_request_put || EN_server_flush_request_put ;
  assign f_reset_reqs$DEQ = MUX_rg_state$write_1__SEL_18 ;
  assign f_reset_reqs$CLR = 1'b0 ;
  // submodule f_reset_rsps
  assign f_reset_rsps$D_IN = f_reset_reqs$D_OUT ;
  assign f_reset_rsps$ENQ =
	     WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 ;
  assign f_reset_rsps$DEQ =
	     EN_server_flush_response_get || EN_server_reset_response_get ;
  assign f_reset_rsps$CLR = 1'b0 ;
  // submodule master_xactor_f_rd_addr
  always@(MUX_master_xactor_f_rd_addr$enq_1__SEL_1 or
	  MUX_master_xactor_f_rd_addr$enq_1__VAL_1 or
	  MUX_master_xactor_f_rd_addr$enq_1__SEL_2 or
	  MUX_master_xactor_f_rd_addr$enq_1__VAL_2 or
	  MUX_master_xactor_f_rd_addr$enq_1__SEL_3 or
	  MUX_master_xactor_f_rd_addr$enq_1__VAL_3 or
	  WILL_FIRE_RL_rl_start_tlb_refill or
	  MUX_master_xactor_f_rd_addr$enq_1__VAL_4 or
	  WILL_FIRE_RL_rl_start_cache_refill or
	  MUX_master_xactor_f_rd_addr$enq_1__VAL_5)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_master_xactor_f_rd_addr$enq_1__SEL_1:
	  master_xactor_f_rd_addr$D_IN =
	      MUX_master_xactor_f_rd_addr$enq_1__VAL_1;
      MUX_master_xactor_f_rd_addr$enq_1__SEL_2:
	  master_xactor_f_rd_addr$D_IN =
	      MUX_master_xactor_f_rd_addr$enq_1__VAL_2;
      MUX_master_xactor_f_rd_addr$enq_1__SEL_3:
	  master_xactor_f_rd_addr$D_IN =
	      MUX_master_xactor_f_rd_addr$enq_1__VAL_3;
      WILL_FIRE_RL_rl_start_tlb_refill:
	  master_xactor_f_rd_addr$D_IN =
	      MUX_master_xactor_f_rd_addr$enq_1__VAL_4;
      WILL_FIRE_RL_rl_start_cache_refill:
	  master_xactor_f_rd_addr$D_IN =
	      MUX_master_xactor_f_rd_addr$enq_1__VAL_5;
      default: master_xactor_f_rd_addr$D_IN =
		   97'h0AAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign master_xactor_f_rd_addr$ENQ =
	     WILL_FIRE_RL_rl_ptw_level_2 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     !master_xactor_f_rd_data$D_OUT[5] &&
	     !master_xactor_f_rd_data$D_OUT[6] &&
	     !master_xactor_f_rd_data$D_OUT[4] ||
	     WILL_FIRE_RL_rl_ptw_level_1 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     !master_xactor_f_rd_data$D_OUT[5] &&
	     !master_xactor_f_rd_data$D_OUT[6] &&
	     !master_xactor_f_rd_data$D_OUT[4] ||
	     WILL_FIRE_RL_rl_io_AMO_op_req ||
	     WILL_FIRE_RL_rl_io_read_req ||
	     WILL_FIRE_RL_rl_start_tlb_refill ||
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
	     WILL_FIRE_RL_rl_io_read_rsp ||
	     WILL_FIRE_RL_rl_cache_refill_rsps_loop ||
	     WILL_FIRE_RL_rl_ptw_level_0 ||
	     WILL_FIRE_RL_rl_ptw_level_1 ||
	     WILL_FIRE_RL_rl_ptw_level_2 ||
	     WILL_FIRE_RL_rl_io_AMO_read_rsp ;
  assign master_xactor_f_rd_data$CLR =
	     WILL_FIRE_RL_rl_start_reset && !f_reset_reqs$D_OUT ;
  // submodule master_xactor_f_wr_addr
  assign master_xactor_f_wr_addr$D_IN =
	     { 4'd0,
	       f_fabric_write_reqs$D_OUT[127:64],
	       8'd0,
	       x__h2890,
	       18'd65536 } ;
  assign master_xactor_f_wr_addr$ENQ = CAN_FIRE_RL_rl_fabric_send_write_req ;
  assign master_xactor_f_wr_addr$DEQ =
	     master_xactor_f_wr_addr$EMPTY_N && mem_master_awready ;
  assign master_xactor_f_wr_addr$CLR =
	     WILL_FIRE_RL_rl_start_reset && !f_reset_reqs$D_OUT ;
  // submodule master_xactor_f_wr_data
  assign master_xactor_f_wr_data$D_IN =
	     { mem_req_wr_data_wdata__h3063,
	       mem_req_wr_data_wstrb__h3064,
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
  always@(MUX_ram_cword_set$b_put_2__SEL_1 or
	  req_addr or
	  MUX_ram_cword_set$b_put_1__SEL_2 or
	  MUX_ram_cword_set$b_put_2__VAL_2 or
	  WILL_FIRE_RL_rl_rereq or
	  rg_addr or
	  WILL_FIRE_RL_rl_start_cache_refill or
	  MUX_ram_cword_set$b_put_2__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_ram_cword_set$b_put_2__SEL_1: ram_cword_set$ADDRB = req_addr[11:3];
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
  always@(MUX_ram_cword_set$b_put_2__SEL_1 or
	  MUX_ram_cword_set$b_put_1__SEL_2 or
	  WILL_FIRE_RL_rl_rereq or WILL_FIRE_RL_rl_start_cache_refill)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_ram_cword_set$b_put_2__SEL_1:
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
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d724 ;
  assign ram_cword_set$ENB =
	     EN_req &&
	     req_f3_BITS_1_TO_0_440_EQ_0b0_441_OR_req_f3_BI_ETC___d1470 ||
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
	     MUX_ram_cword_set$b_put_2__SEL_1 ?
	       req_addr[11:6] :
	       rg_addr[11:6] ;
  assign ram_state_and_ctag_cset$DIA =
	     MUX_ram_state_and_ctag_cset$a_put_1__SEL_1 ?
	       MUX_ram_state_and_ctag_cset$a_put_3__VAL_1 :
	       106'h15555555555554AAAAAAAAAAAAA ;
  assign ram_state_and_ctag_cset$DIB =
	     MUX_ram_cword_set$b_put_2__SEL_1 ?
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
	     req_f3_BITS_1_TO_0_440_EQ_0b0_441_OR_req_f3_BI_ETC___d1470 ||
	     WILL_FIRE_RL_rl_rereq ;
  // submodule soc_map
  assign soc_map$m_is_IO_addr_addr = 64'h0 ;
  assign soc_map$m_is_mem_addr_addr =
	     (rg_priv_6_ULE_0b1___d87 && rg_satp[63:60] == 4'd8) ?
	       _theResult___fst__h6160 :
	       rg_addr ;
  assign soc_map$m_is_near_mem_IO_addr_addr = 64'h0 ;
  // submodule tlb
  assign tlb$insert_asid = rg_satp[59:44] ;
  always@(MUX_tlb$insert_1__SEL_1 or
	  tlb$lookup or
	  MUX_tlb$insert_1__SEL_2 or
	  MUX_tlb$insert_1__SEL_3 or MUX_tlb$insert_1__SEL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_tlb$insert_1__SEL_1: tlb$insert_level = tlb$lookup[65:64];
      MUX_tlb$insert_1__SEL_2: tlb$insert_level = 2'd2;
      MUX_tlb$insert_1__SEL_3: tlb$insert_level = 2'd1;
      MUX_tlb$insert_1__SEL_4: tlb$insert_level = 2'd0;
      default: tlb$insert_level = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign tlb$insert_pte =
	     (MUX_tlb$insert_1__SEL_2 || MUX_tlb$insert_1__SEL_3 ||
	      MUX_tlb$insert_1__SEL_4) ?
	       master_xactor_f_rd_data$D_OUT[66:3] :
	       value__h6897 ;
  assign tlb$insert_pte_pa =
	     MUX_tlb$insert_1__SEL_1 ? tlb$lookup[63:0] : rg_pte_pa ;
  assign tlb$insert_vpn = rg_addr[38:12] ;
  assign tlb$lookup_asid = rg_satp[59:44] ;
  assign tlb$lookup_vpn = rg_addr[38:12] ;
  assign tlb$EN_flush = WILL_FIRE_RL_rl_start_reset || EN_tlb_flush ;
  assign tlb$EN_insert =
	     WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	     rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 ||
	     WILL_FIRE_RL_rl_ptw_level_2 &&
	     master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1015 ||
	     WILL_FIRE_RL_rl_ptw_level_1 &&
	     master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1050 ||
	     WILL_FIRE_RL_rl_ptw_level_0 &&
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     (master_xactor_f_rd_data$D_OUT[4] ||
	      !master_xactor_f_rd_data$D_OUT[5]) &&
	     (master_xactor_f_rd_data$D_OUT[6] ||
	      master_xactor_f_rd_data$D_OUT[4]) ;
  // remaining internal signals
  assign IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d334 =
	     (x1_avValue_pa__h6062[2:0] == 3'h0) ?
	       CASE_rg_amo_funct7_BITS_6_TO_2_0b0_IF_rg_f3_17_ETC__q29 :
	       NOT_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS__ETC___d333 ;
  assign IF_NOT_ram_state_and_ctag_cset_b_read__00_BIT__ETC___d441 =
	     ((!ram_state_and_ctag_cset$DOB[52] ||
	       !ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205) &&
	      (!ram_state_and_ctag_cset$DOB[105] ||
	       !ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211)) ?
	       5'd9 :
	       5'd12 ;
  assign IF_NOT_ram_state_and_ctag_cset_b_read__00_BIT__ETC___d779 =
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) ?
	       n__h22516 :
	       ram_cword_set$DOB[63:0] ;
  assign IF_NOT_ram_state_and_ctag_cset_b_read__00_BIT__ETC___d847 =
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) ?
	       n__h25409 :
	       ram_cword_set$DOB[63:0] ;
  assign IF_ram_state_and_ctag_cset_b_read__00_BIT_105__ETC___d778 =
	     (ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) ?
	       n__h22516 :
	       ram_cword_set$DOB[127:64] ;
  assign IF_ram_state_and_ctag_cset_b_read__00_BIT_105__ETC___d846 =
	     (ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) ?
	       n__h25409 :
	       ram_cword_set$DOB[127:64] ;
  assign IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_1_E_ETC___d662 =
	     (rg_addr[2:0] == 3'h0) ? 64'd1 : 64'd0 ;
  assign IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_IF__ETC___d1355 =
	     (rg_addr[2:0] == 3'h0) ? ld_val__h35996 : 64'd0 ;
  assign IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_NOT_ETC___d255 =
	     (rg_addr[2:0] == 3'h0) ?
	       NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d235 &&
	       NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236 :
	       rg_addr[2:0] != 3'h4 ||
	       NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d235 &&
	       NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236 ;
  assign IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_ram_ETC___d647 =
	     (rg_addr[2:0] == 3'h0) ? word64__h7596 : 64'd0 ;
  assign IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC__q32 =
	     IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC___d654[31:0] ;
  assign IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_rg_st_amo_val_ETC___d784 =
	     (rg_f3 == 3'b010) ?
	       { {32{rg_st_amo_val_BITS_31_TO_0__q33[31]}},
		 rg_st_amo_val_BITS_31_TO_0__q33 } :
	       rg_st_amo_val ;
  assign IF_rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_ETC___d348 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) ?
	       NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d265 :
	       IF_rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_ETC___d347 ;
  assign IF_rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_ETC___d443 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) ?
	       5'd9 :
	       IF_rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_ETC___d442 ;
  assign IF_rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_ETC___d347 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       rg_op_13_EQ_2_16_AND_rg_amo_funct7_18_BITS_6_T_ETC___d287 :
	       NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d346 ;
  assign IF_rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_ETC___d442 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       5'd12 :
	       IF_NOT_ram_state_and_ctag_cset_b_read__00_BIT__ETC___d441 ;
  assign IF_rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_ETC___d856 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       rg_st_amo_val :
	       new_st_val__h25251 ;
  assign IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_T_ETC___d445 =
	     rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d153 ?
	       5'd4 :
	       ((dmem_not_imem && !soc_map$m_is_mem_addr) ?
		  5'd13 :
		  IF_rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_ETC___d443) ;
  assign IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_T_ETC___d485 =
	     x1_avValue_pa__h6062 == rg_lrsc_pa ;
  assign NOT_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS__ETC___d323 =
	     x1_avValue_pa__h6062[2:0] != 3'h7 ||
	     CASE_rg_amo_funct7_BITS_6_TO_2_0b0_IF_rg_f3_17_ETC__q29 ;
  assign NOT_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS__ETC___d329 =
	     x1_avValue_pa__h6062[2:0] != 3'h6 ||
	     CASE_rg_amo_funct7_BITS_6_TO_2_0b0_IF_rg_f3_17_ETC__q29 ;
  assign NOT_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS__ETC___d333 =
	     x1_avValue_pa__h6062[2:0] != 3'h4 ||
	     CASE_rg_amo_funct7_BITS_6_TO_2_0b0_IF_rg_f3_17_ETC__q29 ;
  assign NOT_cfg_verbosity_read__1_ULE_2_106___d1107 = cfg_verbosity > 4'd2 ;
  assign NOT_cfg_verbosity_read__1_ULT_2_49___d450 = cfg_verbosity >= 4'd2 ;
  assign NOT_dmem_not_imem_28_AND_rg_op_13_EQ_0_14_OR_r_ETC___d385 =
	     !dmem_not_imem &&
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     tlb$lookup[69] ;
  assign NOT_dmem_not_imem_28_OR_NOT_rg_op_13_EQ_0_14_1_ETC___d135 =
	     !dmem_not_imem ||
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) ||
	     !tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_addr_7_ETC___d133 ;
  assign NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d479 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     ram_state_and_ctag_cset$DOB[52] &&
	     ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205 &&
	     ram_state_and_ctag_cset$DOB[105] &&
	     ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211 ;
  assign NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d675 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     ram_state_and_ctag_cset_b_read__00_BIT_52_01_A_ETC___d673 ;
  assign NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d687 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     ram_state_and_ctag_cset_b_read__00_BIT_52_01_A_ETC___d673 ;
  assign NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d692 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d690 ;
  assign NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d700 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d697 ;
  assign NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d709 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     (rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 ||
	      NOT_rg_op_13_EQ_1_66_93_AND_ram_state_and_ctag_ETC___d706) ;
  assign NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d722 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d720 ;
  assign NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d859 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd1 &&
	     IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_T_ETC___d485 &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d877 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00011 &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d923 =
	     (!dmem_not_imem || soc_map$m_is_mem_addr) && rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     NOT_rg_op_13_EQ_1_66_93_AND_NOT_rg_op_13_EQ_2__ETC___d719 ;
  assign NOT_master_xactor_f_rd_data_first__41_BITS_2_T_ETC___d1028 =
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	     !master_xactor_f_rd_data$D_OUT[3] ||
	     !master_xactor_f_rd_data$D_OUT[4] &&
	     master_xactor_f_rd_data$D_OUT[5] ||
	     ((!master_xactor_f_rd_data$D_OUT[6] &&
	       !master_xactor_f_rd_data$D_OUT[4]) ?
		master_xactor_f_rd_addr$FULL_N :
		master_xactor_f_rd_data$D_OUT[21:13] != 9'd0 ||
		tlb$RDY_insert) ;
  assign NOT_master_xactor_f_rd_data_first__41_BITS_2_T_ETC___d965 =
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	     !master_xactor_f_rd_data$D_OUT[3] ||
	     !master_xactor_f_rd_data$D_OUT[4] &&
	     master_xactor_f_rd_data$D_OUT[5] ||
	     ((!master_xactor_f_rd_data$D_OUT[6] &&
	       !master_xactor_f_rd_data$D_OUT[4]) ?
		master_xactor_f_rd_addr$FULL_N :
		master_xactor_f_rd_data$D_OUT[30:22] != 9'd0 ||
		master_xactor_f_rd_data$D_OUT[21:13] != 9'd0 ||
		tlb$RDY_insert) ;
  assign NOT_master_xactor_f_rd_data_first__41_BIT_3_45_ETC___d1034 =
	     !master_xactor_f_rd_data$D_OUT[3] ||
	     !master_xactor_f_rd_data$D_OUT[4] &&
	     master_xactor_f_rd_data$D_OUT[5] ||
	     (master_xactor_f_rd_data$D_OUT[6] ||
	      master_xactor_f_rd_data$D_OUT[4]) &&
	     master_xactor_f_rd_data$D_OUT[21:13] != 9'd0 ||
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign NOT_master_xactor_f_rd_data_first__41_BIT_3_45_ETC___d972 =
	     !master_xactor_f_rd_data$D_OUT[3] ||
	     !master_xactor_f_rd_data$D_OUT[4] &&
	     master_xactor_f_rd_data$D_OUT[5] ||
	     (master_xactor_f_rd_data$D_OUT[6] ||
	      master_xactor_f_rd_data$D_OUT[4]) &&
	     (master_xactor_f_rd_data$D_OUT[30:22] != 9'd0 ||
	      master_xactor_f_rd_data$D_OUT[21:13] != 9'd0) ||
	     master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ;
  assign NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236 =
	     !ram_state_and_ctag_cset$DOB[105] || !rg_priv_6_ULE_0b1___d87 ||
	     rg_satp[63:60] != 4'd8 ||
	     tlb$RDY_lookup ;
  assign NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d235 =
	     !ram_state_and_ctag_cset$DOB[52] || !rg_priv_6_ULE_0b1___d87 ||
	     rg_satp[63:60] != 4'd8 ||
	     tlb$RDY_lookup ;
  assign NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d265 =
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) ||
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 ||
	     IF_rg_f3_17_EQ_0b0_18_OR_rg_f3_17_EQ_0b100_19__ETC___d263 ;
  assign NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d285 =
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) ||
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211 ||
	      IF_rg_f3_17_EQ_0b0_18_OR_rg_f3_17_EQ_0b1_42_OR_ETC___d279) &&
	     (ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211 ||
	      IF_rg_f3_17_EQ_0b0_18_OR_rg_f3_17_EQ_0b1_42_OR_ETC___d279) ;
  assign NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d346 =
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) ||
	     f_fabric_write_reqs$FULL_N &&
	     rg_amo_funct7_18_BITS_6_TO_2_19_EQ_0b1_88_OR_I_ETC___d344 ;
  assign NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d487 =
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) &&
	     rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_T_ETC___d485 ;
  assign NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d690 =
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d697 =
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) &&
	     IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_T_ETC___d485 &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign NOT_req_f3_BITS_1_TO_0_440_EQ_0b0_441_442_AND__ETC___d1461 =
	     req_f3[1:0] != 2'b0 && (req_f3[1:0] != 2'b01 || req_addr[0]) &&
	     (req_f3[1:0] != 2'b10 || req_addr[1:0] != 2'b0) &&
	     (req_f3[1:0] != 2'b11 || req_addr[2:0] != 3'b0) ;
  assign NOT_rg_op_13_EQ_0_14_15_AND_NOT_rg_op_13_EQ_2__ETC___d436 =
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid &&
	      rg_lrsc_pa_70_EQ_IF_rg_priv_6_ULE_0b1_7_AND_rg_ETC___d271) ;
  assign NOT_rg_op_13_EQ_1_66_93_AND_NOT_rg_op_13_EQ_2__ETC___d719 =
	     rg_op != 2'd1 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) ;
  assign NOT_rg_op_13_EQ_1_66_93_AND_ram_state_and_ctag_ETC___d706 =
	     rg_op != 2'd1 &&
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) ;
  assign NOT_rg_op_13_EQ_2_16_17_OR_NOT_rg_amo_funct7_1_ETC___d717 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid &&
	      rg_lrsc_pa_70_EQ_IF_rg_priv_6_ULE_0b1_7_AND_rg_ETC___d271) &&
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) ;
  assign NOT_rg_op_13_EQ_2_16_17_OR_NOT_rg_amo_funct7_1_ETC___d880 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid &&
	      rg_lrsc_pa_70_EQ_IF_rg_priv_6_ULE_0b1_7_AND_rg_ETC___d271) &&
	     ram_state_and_ctag_cset_b_read__00_BIT_52_01_A_ETC___d673 ;
  assign NOT_rg_op_13_EQ_2_16_17_OR_NOT_rg_amo_funct7_1_ETC___d886 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid &&
	      rg_lrsc_pa_70_EQ_IF_rg_priv_6_ULE_0b1_7_AND_rg_ETC___d271) &&
	     NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d690 ;
  assign NOT_rg_op_13_EQ_2_16_17_OR_NOT_rg_amo_funct7_1_ETC___d892 =
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid &&
	      rg_lrsc_pa_70_EQ_IF_rg_priv_6_ULE_0b1_7_AND_rg_ETC___d271) &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign NOT_rg_priv_6_EQ_0b0_03_78_OR_tlb_lookup_rg_sa_ETC___d392 =
	     (rg_priv != 2'b0 || tlb$lookup[70]) &&
	     (rg_priv != 2'b01 || !tlb$lookup[70] || rg_sstatus_SUM) &&
	     (NOT_dmem_not_imem_28_AND_rg_op_13_EQ_0_14_OR_r_ETC___d385 ||
	      dmem_not_imem_AND_rg_op_13_EQ_0_14_OR_rg_op_13_ETC___d387 ||
	      dmem_not_imem && rg_op != 2'd0 &&
	      (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	      tlb$lookup[68]) ;
  assign NOT_rg_priv_6_EQ_0b0_03_78_OR_tlb_lookup_rg_sa_ETC___d415 =
	     (rg_priv != 2'b0 || tlb$lookup[70]) &&
	     (rg_priv != 2'b01 || !tlb$lookup[70] || rg_sstatus_SUM) &&
	     dmem_not_imem &&
	     tlb$lookup[68] ;
  assign NOT_rg_priv_6_EQ_0b0_03_78_OR_tlb_lookup_rg_sa_ETC___d453 =
	     (rg_priv != 2'b0 || tlb$lookup[70]) &&
	     (rg_priv != 2'b01 || !tlb$lookup[70] || rg_sstatus_SUM) &&
	     tlb$lookup[72] &&
	     !pte___2__h6572[7] &&
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) ;
  assign NOT_rg_priv_6_EQ_0b0_03_78_OR_tlb_lookup_rg_sa_ETC___d669 =
	     (rg_priv != 2'b0 || tlb$lookup[70]) &&
	     (rg_priv != 2'b01 || !tlb$lookup[70] || rg_sstatus_SUM) &&
	     (!dmem_not_imem && tlb$lookup[69] ||
	      dmem_not_imem &&
	      tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_addr_7_ETC___d133) ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d169 =
	     !rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	     !tlb$lookup[130] ||
	     rg_priv_6_EQ_0b0_03_AND_NOT_tlb_lookup_rg_satp_ETC___d157 ||
	     NOT_tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_ad_ETC___d166 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d350 =
	     (NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d169 ||
	      tlb$RDY_insert && tlb$RDY_lookup && f_pte_writebacks$FULL_N) &&
	     (dmem_not_imem && !soc_map$m_is_mem_addr ||
	      IF_rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_ETC___d348) ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d397 =
	     !rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	     tlb$lookup[130] &&
	     NOT_rg_priv_6_EQ_0b0_03_78_OR_tlb_lookup_rg_sa_ETC___d392 &&
	     tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_addr_7_ETC___d394 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d412 =
	     !rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	     !tlb$lookup[130] ||
	     rg_priv_6_EQ_0b0_03_AND_NOT_tlb_lookup_rg_satp_ETC___d157 ||
	     NOT_tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_ad_ETC___d166 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d464 =
	     !rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	     !tlb$lookup[130] ||
	     NOT_rg_priv_6_EQ_0b0_03_78_OR_tlb_lookup_rg_sa_ETC___d392 &&
	     tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_addr_7_ETC___d394 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d465 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d464 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d472 =
	     !rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	     !tlb$lookup[130] ||
	     (rg_priv != 2'b0 || tlb$lookup[70]) &&
	     (rg_priv != 2'b01 || !tlb$lookup[70] || rg_sstatus_SUM) &&
	     rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d468 &&
	     tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_addr_7_ETC___d394 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d475 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d472 &&
	     dmem_not_imem &&
	     !soc_map$m_is_mem_addr &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d481 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d464 &&
	     NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d479 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d502 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d464 &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d499 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d508 =
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d464 &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     (rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d503 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 &&
	      lrsc_result__h21704) ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d509 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d508 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d672 =
	     !rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	     !tlb$lookup[130] ||
	     NOT_rg_priv_6_EQ_0b0_03_78_OR_tlb_lookup_rg_sa_ETC___d669 &&
	     tlb$lookup[72] ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d677 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d672 &&
	     NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d675 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d683 =
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d672 &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op == 2'd2 &&
	     rg_amo_funct7_18_BITS_6_TO_2_19_EQ_0b10_20_AND_ETC___d680 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d689 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d672 &&
	     NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d687 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d694 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d672 &&
	     NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d692 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d702 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d672 &&
	     NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d700 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 =
	     !rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	     !tlb$lookup[130] ||
	     NOT_rg_priv_6_EQ_0b0_03_78_OR_tlb_lookup_rg_sa_ETC___d415 &&
	     tlb$lookup[72] &&
	     tlb$lookup[73] ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d711 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 &&
	     NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d709 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d724 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 &&
	     NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d722 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d854 =
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     (rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d850 ||
	      NOT_rg_op_13_EQ_1_66_93_AND_NOT_rg_op_13_EQ_2__ETC___d719) ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d855 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d854 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d861 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 &&
	     NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d859 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d867 =
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00011 &&
	     rg_lrsc_valid &&
	     !rg_lrsc_pa_70_EQ_IF_rg_priv_6_ULE_0b1_7_AND_rg_ETC___d271 &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d873 =
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00011 &&
	     !rg_lrsc_valid &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d879 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 &&
	     NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d877 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d884 =
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     NOT_rg_op_13_EQ_2_16_17_OR_NOT_rg_amo_funct7_1_ETC___d880 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d885 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d884 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d890 =
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     NOT_rg_op_13_EQ_2_16_17_OR_NOT_rg_amo_funct7_1_ETC___d886 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d896 =
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     NOT_rg_op_13_EQ_2_16_17_OR_NOT_rg_amo_funct7_1_ETC___d892 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d897 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d896 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d902 =
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00011 &&
	     lrsc_result__h21704 &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d903 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d902 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d909 =
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     rg_op != 2'd1 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	     NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d690 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d914 =
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     rg_op != 2'd1 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	     ram_state_and_ctag_cset_b_read__00_BIT_52_01_A_ETC___d673 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d915 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d914 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d920 =
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 &&
	     (!dmem_not_imem || soc_map$m_is_mem_addr) &&
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     rg_op != 2'd1 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	     ram_state_and_ctag_cset_b_read__00_BIT_52_01_A_ETC___d916 ;
  assign NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d925 =
	     (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$lookup[130]) &&
	     NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d705 &&
	     NOT_dmem_not_imem_28_OR_soc_map_m_is_mem_addr__ETC___d923 ;
  assign NOT_tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_ad_ETC___d150 =
	     !tlb$lookup[72] ||
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     !tlb$lookup[73] ;
  assign NOT_tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_ad_ETC___d166 =
	     !tlb$lookup[72] || !tlb$lookup[73] || pte___2__h6572[7] ||
	     rg_op == 2'd0 ||
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010 ;
  assign _theResult___fst__h6160 =
	     tlb$lookup[130] ? _theResult___fst__h6231 : rg_addr ;
  assign _theResult___fst__h6231 =
	     (rg_priv_6_EQ_0b0_03_AND_NOT_tlb_lookup_rg_satp_ETC___d144 ||
	      NOT_tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_ad_ETC___d150) ?
	       rg_addr :
	       _theResult___fst__h6574 ;
  assign _theResult___snd_fst__h3071 =
	     f_fabric_write_reqs$D_OUT[63:0] << shift_bits__h2857 ;
  assign _theResult___snd_fst__h6162 =
	     tlb$lookup[130] ?
	       _theResult___snd_fst__h6233 :
	       tlb$lookup[129:66] ;
  assign _theResult___snd_fst__h6233 =
	     (rg_priv_6_EQ_0b0_03_AND_NOT_tlb_lookup_rg_satp_ETC___d144 ||
	      NOT_tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_ad_ETC___d150) ?
	       tlb$lookup[129:66] :
	       _theResult___snd_fst__h6803 ;
  assign _theResult___snd_fst__h6803 =
	     (!pte___2__h6572[7] && rg_op != 2'd0 &&
	      (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010)) ?
	       pte___1__h6880 :
	       pte___2__h6572 ;
  assign access_exc_code__h2635 =
	     dmem_not_imem ?
	       ((rg_op == 2'd0 ||
		 rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) ?
		  4'd5 :
		  4'd7) :
	       4'd1 ;
  assign b__h28501 =
	     CAN_FIRE_RL_rl_fabric_send_write_req ?
	       ctr_wr_rsps_pending_crg$port0__write_1 :
	       ctr_wr_rsps_pending_crg ;
  assign cfg_verbosity_read__1_ULE_1___d42 = cfg_verbosity <= 4'd1 ;
  assign cline_fabric_addr__h31880 = { rg_pa[63:6], 6'd0 } ;
  assign dmem_not_imem_AND_rg_op_13_EQ_0_14_OR_rg_op_13_ETC___d387 =
	     dmem_not_imem &&
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_addr_7_ETC___d133 ;
  assign dmem_not_imem_OR_NOT_rg_op_13_EQ_0_14_15_AND_N_ETC___d127 =
	     dmem_not_imem ||
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) ||
	     !tlb$lookup[69] ;
  assign exc_code___1__h6472 = x1_avValue_exc_code__h6063 ;
  assign ld_val5996_BITS_15_TO_0__q38 = ld_val__h35996[15:0] ;
  assign ld_val5996_BITS_15_TO_8__q40 = ld_val__h35996[15:8] ;
  assign ld_val5996_BITS_23_TO_16__q41 = ld_val__h35996[23:16] ;
  assign ld_val5996_BITS_31_TO_0__q39 = ld_val__h35996[31:0] ;
  assign ld_val5996_BITS_31_TO_16__q42 = ld_val__h35996[31:16] ;
  assign ld_val5996_BITS_31_TO_24__q43 = ld_val__h35996[31:24] ;
  assign ld_val5996_BITS_39_TO_32__q44 = ld_val__h35996[39:32] ;
  assign ld_val5996_BITS_47_TO_32__q45 = ld_val__h35996[47:32] ;
  assign ld_val5996_BITS_47_TO_40__q47 = ld_val__h35996[47:40] ;
  assign ld_val5996_BITS_55_TO_48__q48 = ld_val__h35996[55:48] ;
  assign ld_val5996_BITS_63_TO_32__q46 = ld_val__h35996[63:32] ;
  assign ld_val5996_BITS_63_TO_48__q49 = ld_val__h35996[63:48] ;
  assign ld_val5996_BITS_63_TO_56__q50 = ld_val__h35996[63:56] ;
  assign ld_val5996_BITS_7_TO_0__q37 = ld_val__h35996[7:0] ;
  assign lev_0_pte_pa__h30623 = lev_1_PTN_pa__h29528 + vpn_0_pa__h30622 ;
  assign lev_0_pte_pa_w64_fa__h30625 = { lev_0_pte_pa__h30623[63:3], 3'b0 } ;
  assign lev_1_PTN_pa__h29528 = { 8'd0, x__h29603 } ;
  assign lev_1_pte_pa__h29530 = lev_1_PTN_pa__h29528 + vpn_1_pa__h29529 ;
  assign lev_1_pte_pa_w64_fa__h29532 = { lev_1_pte_pa__h29530[63:3], 3'b0 } ;
  assign lev_2_pte_pa__h28596 = satp_pa__h1890 + vpn_2_pa__h28595 ;
  assign lev_2_pte_pa_w64_fa__h28598 = { lev_2_pte_pa__h28596[63:3], 3'b0 } ;
  assign lrsc_result__h21704 =
	     !rg_lrsc_valid ||
	     !rg_lrsc_pa_70_EQ_IF_rg_priv_6_ULE_0b1_7_AND_rg_ETC___d271 ;
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
  assign master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1007 =
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     (master_xactor_f_rd_data$D_OUT[4] ||
	      !master_xactor_f_rd_data$D_OUT[5]) &&
	     (master_xactor_f_rd_data$D_OUT[6] ||
	      master_xactor_f_rd_data$D_OUT[4]) &&
	     (master_xactor_f_rd_data$D_OUT[30:22] != 9'd0 ||
	      master_xactor_f_rd_data$D_OUT[21:13] != 9'd0) &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1015 =
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     (master_xactor_f_rd_data$D_OUT[4] ||
	      !master_xactor_f_rd_data$D_OUT[5]) &&
	     (master_xactor_f_rd_data$D_OUT[6] ||
	      master_xactor_f_rd_data$D_OUT[4]) &&
	     master_xactor_f_rd_data$D_OUT[30:22] == 9'd0 &&
	     master_xactor_f_rd_data$D_OUT[21:13] == 9'd0 ;
  assign master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1019 =
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     (master_xactor_f_rd_data$D_OUT[4] ||
	      !master_xactor_f_rd_data$D_OUT[5]) &&
	     (master_xactor_f_rd_data$D_OUT[6] ||
	      master_xactor_f_rd_data$D_OUT[4]) &&
	     master_xactor_f_rd_data$D_OUT[30:22] == 9'd0 &&
	     master_xactor_f_rd_data$D_OUT[21:13] == 9'd0 &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1050 =
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     (master_xactor_f_rd_data$D_OUT[4] ||
	      !master_xactor_f_rd_data$D_OUT[5]) &&
	     (master_xactor_f_rd_data$D_OUT[6] ||
	      master_xactor_f_rd_data$D_OUT[4]) &&
	     master_xactor_f_rd_data$D_OUT[21:13] == 9'd0 ;
  assign master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1054 =
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     (master_xactor_f_rd_data$D_OUT[4] ||
	      !master_xactor_f_rd_data$D_OUT[5]) &&
	     (master_xactor_f_rd_data$D_OUT[6] ||
	      master_xactor_f_rd_data$D_OUT[4]) &&
	     master_xactor_f_rd_data$D_OUT[21:13] == 9'd0 &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1060 =
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     (master_xactor_f_rd_data$D_OUT[4] ||
	      !master_xactor_f_rd_data$D_OUT[5]) &&
	     (master_xactor_f_rd_data$D_OUT[6] ||
	      master_xactor_f_rd_data$D_OUT[4]) &&
	     master_xactor_f_rd_data$D_OUT[21:13] != 9'd0 &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1085 =
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     (master_xactor_f_rd_data$D_OUT[4] ||
	      !master_xactor_f_rd_data$D_OUT[5]) &&
	     (master_xactor_f_rd_data$D_OUT[6] ||
	      master_xactor_f_rd_data$D_OUT[4]) &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d981 =
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     (!master_xactor_f_rd_data$D_OUT[3] ||
	      !master_xactor_f_rd_data$D_OUT[4] &&
	      master_xactor_f_rd_data$D_OUT[5]) &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991 =
	     master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	     master_xactor_f_rd_data$D_OUT[3] &&
	     !master_xactor_f_rd_data$D_OUT[5] &&
	     !master_xactor_f_rd_data$D_OUT[6] &&
	     !master_xactor_f_rd_data$D_OUT[4] &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign new_st_val__h25251 =
	     (rg_f3 == 3'b010) ?
	       new_st_val__h25551 :
	       _theResult_____2__h25547 ;
  assign new_st_val__h25551 = { 32'd0, _theResult_____2__h25547[31:0] } ;
  assign new_st_val__h25642 =
	     IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_IF_rg_f3_17_E_ETC___d715 +
	     IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_rg_st_amo_val_ETC___d784 ;
  assign new_st_val__h26622 = w1__h25539 ^ w2__h38276 ;
  assign new_st_val__h26626 = w1__h25539 & w2__h38276 ;
  assign new_st_val__h26630 = w1__h25539 | w2__h38276 ;
  assign new_st_val__h26634 =
	     (w1__h25539 < w2__h38276) ? w1__h25539 : w2__h38276 ;
  assign new_st_val__h26639 =
	     (w1__h25539 <= w2__h38276) ? w2__h38276 : w1__h25539 ;
  assign new_st_val__h26645 =
	     ((IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_IF_rg_f3_17_E_ETC___d715 ^
	       64'h8000000000000000) <
	      (IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_rg_st_amo_val_ETC___d784 ^
	       64'h8000000000000000)) ?
	       w1__h25539 :
	       w2__h38276 ;
  assign new_st_val__h26650 =
	     ((IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_IF_rg_f3_17_E_ETC___d715 ^
	       64'h8000000000000000) <=
	      (IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_rg_st_amo_val_ETC___d784 ^
	       64'h8000000000000000)) ?
	       w2__h38276 :
	       w1__h25539 ;
  assign new_st_val__h38286 = { 32'd0, _theResult_____2__h38282[31:0] } ;
  assign new_st_val__h38377 =
	     new_ld_val__h38242 +
	     IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_rg_st_amo_val_ETC___d784 ;
  assign new_st_val__h40237 = w1__h38274 ^ w2__h38276 ;
  assign new_st_val__h40241 = w1__h38274 & w2__h38276 ;
  assign new_st_val__h40245 = w1__h38274 | w2__h38276 ;
  assign new_st_val__h40249 =
	     (w1__h38274 < w2__h38276) ? w1__h38274 : w2__h38276 ;
  assign new_st_val__h40254 =
	     (w1__h38274 <= w2__h38276) ? w2__h38276 : w1__h38274 ;
  assign new_st_val__h40260 =
	     ((new_ld_val__h38242 ^ 64'h8000000000000000) <
	      (IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_rg_st_amo_val_ETC___d784 ^
	       64'h8000000000000000)) ?
	       w1__h38274 :
	       w2__h38276 ;
  assign new_st_val__h40265 =
	     ((new_ld_val__h38242 ^ 64'h8000000000000000) <=
	      (IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_rg_st_amo_val_ETC___d784 ^
	       64'h8000000000000000)) ?
	       w2__h38276 :
	       w1__h38274 ;
  assign new_value__h24131 =
	     (rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       64'd1 :
	       CASE_rg_f3_0b0_IF_rg_addr_7_BITS_2_TO_0_21_EQ__ETC__q53 ;
  assign new_value__h7718 =
	     (rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) ?
	       word64__h7596 :
	       IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC___d654 ;
  assign pa___1__h6580 = { 8'd0, x__h6583 } ;
  assign pa___1__h6629 = { 8'd0, x__h6632 } ;
  assign pa___1__h6698 = { 8'd0, x__h6701 } ;
  assign pte___1__h6852 = { tlb$lookup[129:73], 1'd1, tlb$lookup[71:66] } ;
  assign pte___1__h6880 =
	     { pte___2__h6572[63:8], 1'd1, pte___2__h6572[6:0] } ;
  assign pte___2__h6572 =
	     tlb$lookup[72] ? tlb$lookup[129:66] : pte___1__h6852 ;
  assign ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211 =
	     ram_state_and_ctag_cset$DOB[104:53] ==
	     x1_avValue_pa__h6062[63:12] ;
  assign ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205 =
	     ram_state_and_ctag_cset$DOB[51:0] ==
	     x1_avValue_pa__h6062[63:12] ;
  assign ram_state_and_ctag_cset_b_read__00_BIT_52_01_A_ETC___d484 =
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) &&
	     rg_op == 2'd2 &&
	     rg_amo_funct7[6:2] == 5'b00010 ;
  assign ram_state_and_ctag_cset_b_read__00_BIT_52_01_A_ETC___d495 =
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) &&
	     IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_T_ETC___d485 ;
  assign ram_state_and_ctag_cset_b_read__00_BIT_52_01_A_ETC___d673 =
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign ram_state_and_ctag_cset_b_read__00_BIT_52_01_A_ETC___d916 =
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) &&
	     IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_T_ETC___d485 &&
	     !cfg_verbosity_read__1_ULE_1___d42 ;
  assign req_f3_BITS_1_TO_0_440_EQ_0b0_441_OR_req_f3_BI_ETC___d1470 =
	     req_f3[1:0] == 2'b0 || req_f3[1:0] == 2'b01 && !req_addr[0] ||
	     req_f3[1:0] == 2'b10 && req_addr[1:0] == 2'b0 ||
	     req_f3[1:0] == 2'b11 && req_addr[2:0] == 3'b0 ;
  assign result__h20421 =
	     { {56{word64596_BITS_7_TO_0__q15[7]}},
	       word64596_BITS_7_TO_0__q15 } ;
  assign result__h20449 =
	     { {56{word64596_BITS_15_TO_8__q18[7]}},
	       word64596_BITS_15_TO_8__q18 } ;
  assign result__h20477 =
	     { {56{word64596_BITS_23_TO_16__q19[7]}},
	       word64596_BITS_23_TO_16__q19 } ;
  assign result__h20505 =
	     { {56{word64596_BITS_31_TO_24__q21[7]}},
	       word64596_BITS_31_TO_24__q21 } ;
  assign result__h20533 =
	     { {56{word64596_BITS_39_TO_32__q22[7]}},
	       word64596_BITS_39_TO_32__q22 } ;
  assign result__h20561 =
	     { {56{word64596_BITS_47_TO_40__q25[7]}},
	       word64596_BITS_47_TO_40__q25 } ;
  assign result__h20589 =
	     { {56{word64596_BITS_55_TO_48__q26[7]}},
	       word64596_BITS_55_TO_48__q26 } ;
  assign result__h20617 =
	     { {56{word64596_BITS_63_TO_56__q28[7]}},
	       word64596_BITS_63_TO_56__q28 } ;
  assign result__h20662 = { 56'd0, word64__h7596[7:0] } ;
  assign result__h20690 = { 56'd0, word64__h7596[15:8] } ;
  assign result__h20718 = { 56'd0, word64__h7596[23:16] } ;
  assign result__h20746 = { 56'd0, word64__h7596[31:24] } ;
  assign result__h20774 = { 56'd0, word64__h7596[39:32] } ;
  assign result__h20802 = { 56'd0, word64__h7596[47:40] } ;
  assign result__h20830 = { 56'd0, word64__h7596[55:48] } ;
  assign result__h20858 = { 56'd0, word64__h7596[63:56] } ;
  assign result__h20903 =
	     { {48{word64596_BITS_15_TO_0__q16[15]}},
	       word64596_BITS_15_TO_0__q16 } ;
  assign result__h20931 =
	     { {48{word64596_BITS_31_TO_16__q20[15]}},
	       word64596_BITS_31_TO_16__q20 } ;
  assign result__h20959 =
	     { {48{word64596_BITS_47_TO_32__q23[15]}},
	       word64596_BITS_47_TO_32__q23 } ;
  assign result__h20987 =
	     { {48{word64596_BITS_63_TO_48__q27[15]}},
	       word64596_BITS_63_TO_48__q27 } ;
  assign result__h21028 = { 48'd0, word64__h7596[15:0] } ;
  assign result__h21056 = { 48'd0, word64__h7596[31:16] } ;
  assign result__h21084 = { 48'd0, word64__h7596[47:32] } ;
  assign result__h21112 = { 48'd0, word64__h7596[63:48] } ;
  assign result__h21153 =
	     { {32{word64596_BITS_31_TO_0__q17[31]}},
	       word64596_BITS_31_TO_0__q17 } ;
  assign result__h21181 =
	     { {32{word64596_BITS_63_TO_32__q24[31]}},
	       word64596_BITS_63_TO_32__q24 } ;
  assign result__h21220 = { 32'd0, word64__h7596[31:0] } ;
  assign result__h21248 = { 32'd0, word64__h7596[63:32] } ;
  assign result__h36065 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_10_TO_3__q1 } ;
  assign result__h36095 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_18_TO_11__q4 } ;
  assign result__h36122 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q5[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_26_TO_19__q5 } ;
  assign result__h36149 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q7[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_27__q7 } ;
  assign result__h36176 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q8[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_42_TO_35__q8 } ;
  assign result__h36203 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_50_TO_43__q11 } ;
  assign result__h36230 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_58_TO_51__q12 } ;
  assign result__h36257 =
	     { {56{master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14[7]}},
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_59__q14 } ;
  assign result__h36301 = { 56'd0, master_xactor_f_rd_data$D_OUT[10:3] } ;
  assign result__h36328 = { 56'd0, master_xactor_f_rd_data$D_OUT[18:11] } ;
  assign result__h36355 = { 56'd0, master_xactor_f_rd_data$D_OUT[26:19] } ;
  assign result__h36382 = { 56'd0, master_xactor_f_rd_data$D_OUT[34:27] } ;
  assign result__h36409 = { 56'd0, master_xactor_f_rd_data$D_OUT[42:35] } ;
  assign result__h36436 = { 56'd0, master_xactor_f_rd_data$D_OUT[50:43] } ;
  assign result__h36463 = { 56'd0, master_xactor_f_rd_data$D_OUT[58:51] } ;
  assign result__h36490 = { 56'd0, master_xactor_f_rd_data$D_OUT[66:59] } ;
  assign result__h36534 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_18_TO_3__q2 } ;
  assign result__h36561 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q6[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_19__q6 } ;
  assign result__h36588 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q9[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_50_TO_35__q9 } ;
  assign result__h36615 =
	     { {48{master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13[15]}},
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_51__q13 } ;
  assign result__h36655 = { 48'd0, master_xactor_f_rd_data$D_OUT[18:3] } ;
  assign result__h36682 = { 48'd0, master_xactor_f_rd_data$D_OUT[34:19] } ;
  assign result__h36709 = { 48'd0, master_xactor_f_rd_data$D_OUT[50:35] } ;
  assign result__h36736 = { 48'd0, master_xactor_f_rd_data$D_OUT[66:51] } ;
  assign result__h36776 =
	     { {32{master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3[31]}},
	       master_xactor_f_rd_dataD_OUT_BITS_34_TO_3__q3 } ;
  assign result__h36803 =
	     { {32{master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10[31]}},
	       master_xactor_f_rd_dataD_OUT_BITS_66_TO_35__q10 } ;
  assign result__h36841 = { 32'd0, master_xactor_f_rd_data$D_OUT[34:3] } ;
  assign result__h36868 = { 32'd0, master_xactor_f_rd_data$D_OUT[66:35] } ;
  assign result__h38465 =
	     { {56{ld_val5996_BITS_7_TO_0__q37[7]}},
	       ld_val5996_BITS_7_TO_0__q37 } ;
  assign result__h39373 =
	     { {56{ld_val5996_BITS_15_TO_8__q40[7]}},
	       ld_val5996_BITS_15_TO_8__q40 } ;
  assign result__h39401 =
	     { {56{ld_val5996_BITS_23_TO_16__q41[7]}},
	       ld_val5996_BITS_23_TO_16__q41 } ;
  assign result__h39429 =
	     { {56{ld_val5996_BITS_31_TO_24__q43[7]}},
	       ld_val5996_BITS_31_TO_24__q43 } ;
  assign result__h39457 =
	     { {56{ld_val5996_BITS_39_TO_32__q44[7]}},
	       ld_val5996_BITS_39_TO_32__q44 } ;
  assign result__h39485 =
	     { {56{ld_val5996_BITS_47_TO_40__q47[7]}},
	       ld_val5996_BITS_47_TO_40__q47 } ;
  assign result__h39513 =
	     { {56{ld_val5996_BITS_55_TO_48__q48[7]}},
	       ld_val5996_BITS_55_TO_48__q48 } ;
  assign result__h39541 =
	     { {56{ld_val5996_BITS_63_TO_56__q50[7]}},
	       ld_val5996_BITS_63_TO_56__q50 } ;
  assign result__h39586 = { 56'd0, ld_val__h35996[7:0] } ;
  assign result__h39614 = { 56'd0, ld_val__h35996[15:8] } ;
  assign result__h39642 = { 56'd0, ld_val__h35996[23:16] } ;
  assign result__h39670 = { 56'd0, ld_val__h35996[31:24] } ;
  assign result__h39698 = { 56'd0, ld_val__h35996[39:32] } ;
  assign result__h39726 = { 56'd0, ld_val__h35996[47:40] } ;
  assign result__h39754 = { 56'd0, ld_val__h35996[55:48] } ;
  assign result__h39782 = { 56'd0, ld_val__h35996[63:56] } ;
  assign result__h39827 =
	     { {48{ld_val5996_BITS_15_TO_0__q38[15]}},
	       ld_val5996_BITS_15_TO_0__q38 } ;
  assign result__h39855 =
	     { {48{ld_val5996_BITS_31_TO_16__q42[15]}},
	       ld_val5996_BITS_31_TO_16__q42 } ;
  assign result__h39883 =
	     { {48{ld_val5996_BITS_47_TO_32__q45[15]}},
	       ld_val5996_BITS_47_TO_32__q45 } ;
  assign result__h39911 =
	     { {48{ld_val5996_BITS_63_TO_48__q49[15]}},
	       ld_val5996_BITS_63_TO_48__q49 } ;
  assign result__h39952 = { 48'd0, ld_val__h35996[15:0] } ;
  assign result__h39980 = { 48'd0, ld_val__h35996[31:16] } ;
  assign result__h40008 = { 48'd0, ld_val__h35996[47:32] } ;
  assign result__h40036 = { 48'd0, ld_val__h35996[63:48] } ;
  assign result__h40077 =
	     { {32{ld_val5996_BITS_31_TO_0__q39[31]}},
	       ld_val5996_BITS_31_TO_0__q39 } ;
  assign result__h40105 =
	     { {32{ld_val5996_BITS_63_TO_32__q46[31]}},
	       ld_val5996_BITS_63_TO_32__q46 } ;
  assign result__h40144 = { 32'd0, ld_val__h35996[31:0] } ;
  assign result__h40172 = { 32'd0, ld_val__h35996[63:32] } ;
  assign rg_amo_funct7_18_BITS_6_TO_2_19_EQ_0b10_20_AND_ETC___d680 =
	     rg_amo_funct7[6:2] == 5'b00010 &&
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) ;
  assign rg_amo_funct7_18_BITS_6_TO_2_19_EQ_0b1_88_OR_I_ETC___d344 =
	     IF_rg_f3_17_EQ_0b0_18_OR_rg_f3_17_EQ_0b100_19__ETC___d263 &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211 ||
	      IF_rg_f3_17_EQ_0b0_18_THEN_NOT_rg_priv_6_ULE_0_ETC___d339) &&
	     (ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211 ||
	      IF_rg_f3_17_EQ_0b0_18_THEN_NOT_rg_priv_6_ULE_0_ETC___d339) ;
  assign rg_lrsc_pa_70_EQ_IF_rg_priv_6_ULE_0b1_7_AND_rg_ETC___d271 =
	     rg_lrsc_pa == x1_avValue_pa__h6062 ;
  assign rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d431 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     (!ram_state_and_ctag_cset$DOB[52] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205) &&
	     (!ram_state_and_ctag_cset$DOB[105] ||
	      !ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) ;
  assign rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d468 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_addr_7_ETC___d133 ||
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     tlb$lookup[68] ;
  assign rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d489 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     (ram_state_and_ctag_cset_b_read__00_BIT_52_01_A_ETC___d484 ||
	      NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d487) ;
  assign rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d499 =
	     rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d489 ||
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) &&
	     rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d497 ;
  assign rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d503 =
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     (ram_state_and_ctag_cset$DOB[52] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205 ||
	      ram_state_and_ctag_cset$DOB[105] &&
	      ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211) ;
  assign rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d497 =
	     rg_op == 2'd1 &&
	     IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_T_ETC___d485 ||
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 ||
	     rg_op != 2'd1 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011) &&
	     ram_state_and_ctag_cset_b_read__00_BIT_52_01_A_ETC___d495 ;
  assign rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d720 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     NOT_rg_op_13_EQ_2_16_17_OR_NOT_rg_amo_funct7_1_ETC___d717 ||
	     NOT_rg_op_13_EQ_1_66_93_AND_NOT_rg_op_13_EQ_2__ETC___d719 ;
  assign rg_op_13_EQ_1_66_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d850 =
	     (rg_op == 2'd1 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011) &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00011 ||
	      rg_lrsc_valid &&
	      rg_lrsc_pa_70_EQ_IF_rg_priv_6_ULE_0b1_7_AND_rg_ETC___d271) ;
  assign rg_op_13_EQ_2_16_AND_rg_amo_funct7_18_BITS_6_T_ETC___d287 =
	     rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00011 &&
	     lrsc_result__h21704 ||
	     f_fabric_write_reqs$FULL_N &&
	     NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d285 ;
  assign rg_priv_6_EQ_0b0_03_AND_NOT_tlb_lookup_rg_satp_ETC___d144 =
	     rg_priv == 2'b0 && !tlb$lookup[70] ||
	     rg_priv == 2'b01 && tlb$lookup[70] && !rg_sstatus_SUM ||
	     dmem_not_imem_OR_NOT_rg_op_13_EQ_0_14_15_AND_N_ETC___d127 &&
	     NOT_dmem_not_imem_28_OR_NOT_rg_op_13_EQ_0_14_1_ETC___d135 &&
	     (!dmem_not_imem || rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010 ||
	      !tlb$lookup[68]) ;
  assign rg_priv_6_EQ_0b0_03_AND_NOT_tlb_lookup_rg_satp_ETC___d157 =
	     rg_priv == 2'b0 && !tlb$lookup[70] ||
	     rg_priv == 2'b01 && tlb$lookup[70] && !rg_sstatus_SUM ||
	     !dmem_not_imem ||
	     !tlb$lookup[68] ;
  assign rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d153 =
	     rg_priv_6_ULE_0b1___d87 && rg_satp[63:60] == 4'd8 &&
	     tlb$lookup[130] &&
	     (rg_priv_6_EQ_0b0_03_AND_NOT_tlb_lookup_rg_satp_ETC___d144 ||
	      NOT_tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_ad_ETC___d150) ;
  assign rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d352 =
	     rg_priv_6_ULE_0b1___d87 && rg_satp[63:60] == 4'd8 &&
	     !tlb$lookup[130] ||
	     (rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d153 ?
		tlb$RDY_lookup :
		NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d350) ;
  assign rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d400 =
	     rg_priv_6_ULE_0b1___d87 && rg_satp[63:60] == 4'd8 &&
	     (rg_priv_6_EQ_0b0_03_AND_NOT_tlb_lookup_rg_satp_ETC___d144 ||
	      NOT_tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_ad_ETC___d150) &&
	     tlb$lookup[130] ;
  assign rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 =
	     rg_priv_6_ULE_0b1___d87 && rg_satp[63:60] == 4'd8 &&
	     tlb$lookup[130] &&
	     NOT_rg_priv_6_EQ_0b0_03_78_OR_tlb_lookup_rg_sa_ETC___d415 &&
	     tlb$lookup[72] &&
	     tlb$lookup[73] &&
	     !pte___2__h6572[7] &&
	     rg_op != 2'd0 &&
	     (rg_op != 2'd2 || rg_amo_funct7[6:2] != 5'b00010) ;
  assign rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d439 =
	     rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d153 ||
	     dmem_not_imem && !soc_map$m_is_mem_addr ||
	     rg_op_13_EQ_0_14_OR_rg_op_13_EQ_2_16_AND_rg_am_ETC___d431 ||
	     NOT_rg_op_13_EQ_0_14_15_AND_NOT_rg_op_13_EQ_2__ETC___d436 ;
  assign rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d440 =
	     rg_priv_6_ULE_0b1___d87 && rg_satp[63:60] == 4'd8 &&
	     !tlb$lookup[130] ||
	     rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d439 ;
  assign rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d458 =
	     rg_priv_6_ULE_0b1___d87 && rg_satp[63:60] == 4'd8 &&
	     tlb$lookup[130] &&
	     NOT_rg_priv_6_EQ_0b0_03_78_OR_tlb_lookup_rg_sa_ETC___d453 &&
	     NOT_cfg_verbosity_read__1_ULT_2_49___d450 &&
	     dmem_not_imem &&
	     tlb$lookup[68] &&
	     tlb$lookup[73] ;
  assign rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d461 =
	     rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	     NOT_cfg_verbosity_read__1_ULT_2_49___d450 &&
	     (!dmem_not_imem || !tlb$lookup[68] || !tlb$lookup[73]) ;
  assign rg_priv_6_ULE_0b1___d87 = rg_priv <= 2'b01 ;
  assign rg_st_amo_val_BITS_31_TO_0__q33 = rg_st_amo_val[31:0] ;
  assign rg_state_1_EQ_13_155_AND_rg_op_13_EQ_0_14_OR_r_ETC___d1157 =
	     rg_state == 5'd13 &&
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) &&
	     b__h28501 == 4'd0 ;
  assign satp_pa__h1890 = { 8'd0, x__h4883 } ;
  assign shift_bits__h2857 = { f_fabric_write_reqs$D_OUT[66:64], 3'b0 } ;
  assign strobe64__h3007 = 8'b00000001 << f_fabric_write_reqs$D_OUT[66:64] ;
  assign strobe64__h3009 = 8'b00000011 << f_fabric_write_reqs$D_OUT[66:64] ;
  assign strobe64__h3011 = 8'b00001111 << f_fabric_write_reqs$D_OUT[66:64] ;
  assign tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_addr_7_ETC___d133 =
	     tlb$lookup[67] | y__h6398 ;
  assign tlb_lookup_rg_satp_9_BITS_59_TO_44_6_rg_addr_7_ETC___d394 =
	     tlb$lookup[72] &&
	     (rg_op == 2'd0 ||
	      rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010 ||
	      tlb$lookup[73]) ;
  assign tmp__h32016 = { 1'd0, rg_victim_way } ;
  assign tmp__h32017 = tmp__h32016 + 2'd1 ;
  assign value__h6897 =
	     (rg_priv_6_ULE_0b1___d87 && rg_satp[63:60] == 4'd8) ?
	       _theResult___snd_fst__h6162 :
	       tlb$lookup[129:66] ;
  assign vpn_0_pa__h30622 = { 52'd0, rg_addr[20:12], 3'd0 } ;
  assign vpn_1_pa__h29529 = { 52'd0, rg_addr[29:21], 3'd0 } ;
  assign vpn_2_pa__h28595 = { 52'd0, rg_addr[38:30], 3'd0 } ;
  assign w18270_BITS_31_TO_0__q52 = w1__h38270[31:0] ;
  assign w1___1__h25610 =
	     { 32'd0,
	       IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC___d654[31:0] } ;
  assign w1___1__h38345 = { 32'd0, w1__h38270[31:0] } ;
  assign w2___1__h38346 = { 32'd0, rg_st_amo_val[31:0] } ;
  assign w2__h38276 = (rg_f3 == 3'b010) ? w2___1__h38346 : rg_st_amo_val ;
  assign word64596_BITS_15_TO_0__q16 = word64__h7596[15:0] ;
  assign word64596_BITS_15_TO_8__q18 = word64__h7596[15:8] ;
  assign word64596_BITS_23_TO_16__q19 = word64__h7596[23:16] ;
  assign word64596_BITS_31_TO_0__q17 = word64__h7596[31:0] ;
  assign word64596_BITS_31_TO_16__q20 = word64__h7596[31:16] ;
  assign word64596_BITS_31_TO_24__q21 = word64__h7596[31:24] ;
  assign word64596_BITS_39_TO_32__q22 = word64__h7596[39:32] ;
  assign word64596_BITS_47_TO_32__q23 = word64__h7596[47:32] ;
  assign word64596_BITS_47_TO_40__q25 = word64__h7596[47:40] ;
  assign word64596_BITS_55_TO_48__q26 = word64__h7596[55:48] ;
  assign word64596_BITS_63_TO_32__q24 = word64__h7596[63:32] ;
  assign word64596_BITS_63_TO_48__q27 = word64__h7596[63:48] ;
  assign word64596_BITS_63_TO_56__q28 = word64__h7596[63:56] ;
  assign word64596_BITS_7_TO_0__q15 = word64__h7596[7:0] ;
  assign word64__h7596 = x__h7735 | y__h7736 ;
  assign x1_avValue_exc_code__h6063 =
	     dmem_not_imem ?
	       ((rg_op == 2'd0 ||
		 rg_op == 2'd2 && rg_amo_funct7[6:2] == 5'b00010) ?
		  4'd13 :
		  4'd15) :
	       4'd12 ;
  assign x1_avValue_pa__h6062 = soc_map$m_is_mem_addr_addr ;
  assign x__h21714 = { 63'd0, lrsc_result__h21704 } ;
  assign x__h29603 = { master_xactor_f_rd_data$D_OUT[56:13], 12'b0 } ;
  assign x__h38265 =
	     (rg_f3 == 3'b010) ?
	       new_st_val__h38286 :
	       _theResult_____2__h38282 ;
  assign x__h4883 = { rg_satp[43:0], 12'b0 } ;
  assign x__h6583 = { tlb$lookup[119:76], rg_addr[11:0] } ;
  assign x__h6632 = { tlb$lookup[119:85], rg_addr[20:0] } ;
  assign x__h6701 = { tlb$lookup[119:94], rg_addr[29:0] } ;
  assign x__h7735 = ram_cword_set$DOB[63:0] & y__h7750 ;
  assign y__h14065 =
	     {64{ram_state_and_ctag_cset$DOB[105] &&
		 ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211}} ;
  assign y__h6398 = rg_mstatus_MXR & tlb$lookup[69] ;
  assign y__h7736 = ram_cword_set$DOB[127:64] & y__h14065 ;
  assign y__h7750 =
	     {64{ram_state_and_ctag_cset$DOB[52] &&
		 ram_state_and_ctag_cset_b_read__00_BITS_51_TO__ETC___d205}} ;
  always@(f_fabric_write_reqs$D_OUT)
  begin
    case (f_fabric_write_reqs$D_OUT[129:128])
      2'b0: x__h2890 = 3'b0;
      2'b01: x__h2890 = 3'b001;
      2'b10: x__h2890 = 3'b010;
      2'b11: x__h2890 = 3'b011;
    endcase
  end
  always@(rg_f3)
  begin
    case (rg_f3[1:0])
      2'b0: value__h37822 = 3'b0;
      2'b01: value__h37822 = 3'b001;
      2'b10: value__h37822 = 3'b010;
      2'd3: value__h37822 = 3'b011;
    endcase
  end
  always@(tlb$lookup or
	  rg_addr or pa___1__h6580 or pa___1__h6629 or pa___1__h6698)
  begin
    case (tlb$lookup[65:64])
      2'd0: _theResult___fst__h6574 = pa___1__h6580;
      2'd1: _theResult___fst__h6574 = pa___1__h6629;
      2'd2: _theResult___fst__h6574 = pa___1__h6698;
      2'd3: _theResult___fst__h6574 = rg_addr;
    endcase
  end
  always@(f_fabric_write_reqs$D_OUT or
	  strobe64__h3007 or strobe64__h3009 or strobe64__h3011)
  begin
    case (f_fabric_write_reqs$D_OUT[129:128])
      2'b0: mem_req_wr_data_wstrb__h3064 = strobe64__h3007;
      2'b01: mem_req_wr_data_wstrb__h3064 = strobe64__h3009;
      2'b10: mem_req_wr_data_wstrb__h3064 = strobe64__h3011;
      2'b11: mem_req_wr_data_wstrb__h3064 = 8'b11111111;
    endcase
  end
  always@(f_fabric_write_reqs$D_OUT or _theResult___snd_fst__h3071)
  begin
    case (f_fabric_write_reqs$D_OUT[129:128])
      2'b0, 2'b01, 2'b10:
	  mem_req_wr_data_wdata__h3063 = _theResult___snd_fst__h3071;
      2'd3: mem_req_wr_data_wdata__h3063 = f_fabric_write_reqs$D_OUT[63:0];
    endcase
  end
  always@(ram_state_and_ctag_cset$DOB or
	  ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211 or
	  ram_cword_set$DOB)
  begin
    case (ram_state_and_ctag_cset$DOB[105] &&
	  ram_state_and_ctag_cset_b_read__00_BITS_104_TO_ETC___d211)
      1'd0: old_cword__h22505 = ram_cword_set$DOB[63:0];
      1'd1: old_cword__h22505 = ram_cword_set$DOB[127:64];
    endcase
  end
  always@(rg_f3 or
	  NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236 or
	  rg_priv_6_ULE_0b1___d87 or rg_satp or tlb$RDY_lookup)
  begin
    case (rg_f3)
      3'b0, 3'b001, 3'b010:
	  IF_rg_f3_17_EQ_0b0_18_OR_rg_f3_17_EQ_0b1_42_OR_ETC___d279 =
	      !rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	      tlb$RDY_lookup;
      default: IF_rg_f3_17_EQ_0b0_18_OR_rg_f3_17_EQ_0b1_42_OR_ETC___d279 =
		   rg_f3 == 3'b011 ||
		   NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236;
    endcase
  end
  always@(rg_addr or
	  NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d235 or
	  NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236)
  begin
    case (rg_addr[2:0])
      3'h0, 3'h1, 3'h2, 3'h3, 3'h4, 3'h5, 3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_OR_rg_ad_ETC___d241 =
	      NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d235 &&
	      NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236;
      3'd7:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_OR_rg_ad_ETC___d241 =
	      rg_addr[2:0] != 3'h7 ||
	      NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d235 &&
	      NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236;
    endcase
  end
  always@(rg_addr or
	  NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d235 or
	  NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236)
  begin
    case (rg_addr[2:0])
      3'h0, 3'h2, 3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_OR_rg_ad_ETC___d249 =
	      NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d235 &&
	      NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236;
      default: IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_OR_rg_ad_ETC___d249 =
		   rg_addr[2:0] != 3'h6 ||
		   NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d235 &&
		   NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236;
    endcase
  end
  always@(rg_f3 or
	  rg_addr or
	  NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d235 or
	  NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_OR_rg_ad_ETC___d241 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_OR_rg_ad_ETC___d249 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_NOT_ETC___d255)
  begin
    case (rg_f3)
      3'b0, 3'b100:
	  IF_rg_f3_17_EQ_0b0_18_OR_rg_f3_17_EQ_0b100_19__ETC___d263 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_OR_rg_ad_ETC___d241;
      3'b001, 3'b101:
	  IF_rg_f3_17_EQ_0b0_18_OR_rg_f3_17_EQ_0b100_19__ETC___d263 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_OR_rg_ad_ETC___d249;
      3'b010, 3'b110:
	  IF_rg_f3_17_EQ_0b0_18_OR_rg_f3_17_EQ_0b100_19__ETC___d263 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_NOT_ETC___d255;
      default: IF_rg_f3_17_EQ_0b0_18_OR_rg_f3_17_EQ_0b100_19__ETC___d263 =
		   rg_f3 != 3'b011 || rg_addr[2:0] != 3'h0 ||
		   NOT_ram_state_and_ctag_cset_b_read__00_BIT_52__ETC___d235 &&
		   NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236;
    endcase
  end
  always@(rg_amo_funct7 or
	  IF_rg_f3_17_EQ_0b0_18_OR_rg_f3_17_EQ_0b100_19__ETC___d263)
  begin
    case (rg_amo_funct7[6:2])
      5'b0, 5'b00100, 5'b01000, 5'b01100, 5'b10000, 5'b11000, 5'b11100:
	  CASE_rg_amo_funct7_BITS_6_TO_2_0b0_IF_rg_f3_17_ETC__q29 =
	      IF_rg_f3_17_EQ_0b0_18_OR_rg_f3_17_EQ_0b100_19__ETC___d263;
      default: CASE_rg_amo_funct7_BITS_6_TO_2_0b0_IF_rg_f3_17_ETC__q29 =
		   rg_amo_funct7[6:2] != 5'b10100 ||
		   IF_rg_f3_17_EQ_0b0_18_OR_rg_f3_17_EQ_0b100_19__ETC___d263;
    endcase
  end
  always@(x1_avValue_pa__h6062 or
	  NOT_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS__ETC___d329 or
	  CASE_rg_amo_funct7_BITS_6_TO_2_0b0_IF_rg_f3_17_ETC__q29)
  begin
    case (x1_avValue_pa__h6062[2:0])
      3'h0, 3'h2, 3'h4:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d330 =
	      CASE_rg_amo_funct7_BITS_6_TO_2_0b0_IF_rg_f3_17_ETC__q29;
      default: IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d330 =
		   NOT_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS__ETC___d329;
    endcase
  end
  always@(x1_avValue_pa__h6062 or
	  NOT_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS__ETC___d323 or
	  CASE_rg_amo_funct7_BITS_6_TO_2_0b0_IF_rg_f3_17_ETC__q29)
  begin
    case (x1_avValue_pa__h6062[2:0])
      3'h0, 3'h1, 3'h2, 3'h3, 3'h4, 3'h5, 3'h6:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d324 =
	      CASE_rg_amo_funct7_BITS_6_TO_2_0b0_IF_rg_f3_17_ETC__q29;
      3'd7:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d324 =
	      NOT_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS__ETC___d323;
    endcase
  end
  always@(rg_f3 or
	  NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236 or
	  rg_priv_6_ULE_0b1___d87 or
	  rg_satp or
	  tlb$RDY_lookup or
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d324 or
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d330 or
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d334 or
	  CASE_rg_amo_funct7_BITS_6_TO_2_0b0_IF_rg_f3_17_ETC__q29)
  begin
    case (rg_f3)
      3'b0:
	  IF_rg_f3_17_EQ_0b0_18_THEN_NOT_rg_priv_6_ULE_0_ETC___d339 =
	      (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	       tlb$RDY_lookup) &&
	      IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d324;
      3'b001:
	  IF_rg_f3_17_EQ_0b0_18_THEN_NOT_rg_priv_6_ULE_0_ETC___d339 =
	      (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	       tlb$RDY_lookup) &&
	      IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d330;
      3'b010:
	  IF_rg_f3_17_EQ_0b0_18_THEN_NOT_rg_priv_6_ULE_0_ETC___d339 =
	      (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	       tlb$RDY_lookup) &&
	      IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d334;
      3'b011:
	  IF_rg_f3_17_EQ_0b0_18_THEN_NOT_rg_priv_6_ULE_0_ETC___d339 =
	      CASE_rg_amo_funct7_BITS_6_TO_2_0b0_IF_rg_f3_17_ETC__q29;
      default: IF_rg_f3_17_EQ_0b0_18_THEN_NOT_rg_priv_6_ULE_0_ETC___d339 =
		   NOT_ram_state_and_ctag_cset_b_read__00_BIT_105_ETC___d236;
    endcase
  end
  always@(rg_addr or
	  result__h20421 or
	  result__h20449 or
	  result__h20477 or
	  result__h20505 or
	  result__h20533 or
	  result__h20561 or result__h20589 or result__h20617)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d600 =
	      result__h20421;
      3'h1:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d600 =
	      result__h20449;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d600 =
	      result__h20477;
      3'h3:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d600 =
	      result__h20505;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d600 =
	      result__h20533;
      3'h5:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d600 =
	      result__h20561;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d600 =
	      result__h20589;
      3'h7:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d600 =
	      result__h20617;
    endcase
  end
  always@(rg_addr or
	  result__h20662 or
	  result__h20690 or
	  result__h20718 or
	  result__h20746 or
	  result__h20774 or
	  result__h20802 or result__h20830 or result__h20858)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d616 =
	      result__h20662;
      3'h1:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d616 =
	      result__h20690;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d616 =
	      result__h20718;
      3'h3:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d616 =
	      result__h20746;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d616 =
	      result__h20774;
      3'h5:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d616 =
	      result__h20802;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d616 =
	      result__h20830;
      3'h7:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d616 =
	      result__h20858;
    endcase
  end
  always@(rg_addr or
	  result__h20903 or
	  result__h20931 or result__h20959 or result__h20987)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d628 =
	      result__h20903;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d628 =
	      result__h20931;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d628 =
	      result__h20959;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d628 =
	      result__h20987;
      default: IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d628 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h21028 or
	  result__h21056 or result__h21084 or result__h21112)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d636 =
	      result__h21028;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d636 =
	      result__h21056;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d636 =
	      result__h21084;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d636 =
	      result__h21112;
      default: IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d636 =
		   64'd0;
    endcase
  end
  always@(rg_addr or result__h21220 or result__h21248)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d646 =
	      result__h21220;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d646 =
	      result__h21248;
      default: IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d646 =
		   64'd0;
    endcase
  end
  always@(rg_addr or result__h21153 or result__h21181)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1153_0x4_re_ETC__q30 =
	      result__h21153;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1153_0x4_re_ETC__q30 =
	      result__h21181;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result1153_0x4_re_ETC__q30 =
		   64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d600 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d628 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result1153_0x4_re_ETC__q30 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_ram_ETC___d647 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d616 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d636 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d646)
  begin
    case (rg_f3)
      3'b0:
	  IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC___d654 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d600;
      3'b001:
	  IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC___d654 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d628;
      3'b010:
	  IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC___d654 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result1153_0x4_re_ETC__q30;
      3'b011:
	  IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC___d654 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_ram_ETC___d647;
      3'b100:
	  IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC___d654 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d616;
      3'b101:
	  IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC___d654 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d636;
      3'b110:
	  IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC___d654 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d646;
      3'd7: IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC___d654 = 64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d600 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d628 or
	  w1___1__h25610 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_ram_ETC___d647 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d616 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d636 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d646)
  begin
    case (rg_f3)
      3'b0:
	  w1__h25539 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d600;
      3'b001:
	  w1__h25539 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d628;
      3'b010: w1__h25539 = w1___1__h25610;
      3'b011:
	  w1__h25539 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_ram_ETC___d647;
      3'b100:
	  w1__h25539 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d616;
      3'b101:
	  w1__h25539 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d636;
      3'b110:
	  w1__h25539 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d646;
      3'd7: w1__h25539 = 64'd0;
    endcase
  end
  always@(x1_avValue_pa__h6062 or old_cword__h22505 or rg_st_amo_val)
  begin
    case (x1_avValue_pa__h6062[2:0])
      3'h0:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d768 =
	      { old_cword__h22505[63:16], rg_st_amo_val[15:0] };
      3'h2:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d768 =
	      { old_cword__h22505[63:32],
		rg_st_amo_val[15:0],
		old_cword__h22505[15:0] };
      3'h4:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d768 =
	      { old_cword__h22505[63:48],
		rg_st_amo_val[15:0],
		old_cword__h22505[31:0] };
      3'h6:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d768 =
	      { rg_st_amo_val[15:0], old_cword__h22505[47:0] };
      default: IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d768 =
		   old_cword__h22505;
    endcase
  end
  always@(x1_avValue_pa__h6062 or old_cword__h22505 or rg_st_amo_val)
  begin
    case (x1_avValue_pa__h6062[2:0])
      3'h0:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d759 =
	      { old_cword__h22505[63:8], rg_st_amo_val[7:0] };
      3'h1:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d759 =
	      { old_cword__h22505[63:16],
		rg_st_amo_val[7:0],
		old_cword__h22505[7:0] };
      3'h2:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d759 =
	      { old_cword__h22505[63:24],
		rg_st_amo_val[7:0],
		old_cword__h22505[15:0] };
      3'h3:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d759 =
	      { old_cword__h22505[63:32],
		rg_st_amo_val[7:0],
		old_cword__h22505[23:0] };
      3'h4:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d759 =
	      { old_cword__h22505[63:40],
		rg_st_amo_val[7:0],
		old_cword__h22505[31:0] };
      3'h5:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d759 =
	      { old_cword__h22505[63:48],
		rg_st_amo_val[7:0],
		old_cword__h22505[39:0] };
      3'h6:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d759 =
	      { old_cword__h22505[63:56],
		rg_st_amo_val[7:0],
		old_cword__h22505[47:0] };
      3'h7:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d759 =
	      { rg_st_amo_val[7:0], old_cword__h22505[55:0] };
    endcase
  end
  always@(x1_avValue_pa__h6062 or old_cword__h22505 or rg_st_amo_val)
  begin
    case (x1_avValue_pa__h6062[2:0])
      3'h0:
	  CASE_x1_avValue_pa062_BITS_2_TO_0_0x0_old_cwor_ETC__q31 =
	      { old_cword__h22505[63:32], rg_st_amo_val[31:0] };
      3'h4:
	  CASE_x1_avValue_pa062_BITS_2_TO_0_0x0_old_cwor_ETC__q31 =
	      { rg_st_amo_val[31:0], old_cword__h22505[31:0] };
      default: CASE_x1_avValue_pa062_BITS_2_TO_0_0x0_old_cwor_ETC__q31 =
		   old_cword__h22505;
    endcase
  end
  always@(rg_f3 or
	  old_cword__h22505 or
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d759 or
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d768 or
	  CASE_x1_avValue_pa062_BITS_2_TO_0_0x0_old_cwor_ETC__q31 or
	  rg_st_amo_val)
  begin
    case (rg_f3)
      3'b0:
	  n__h22516 =
	      IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d759;
      3'b001:
	  n__h22516 =
	      IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d768;
      3'b010:
	  n__h22516 = CASE_x1_avValue_pa062_BITS_2_TO_0_0x0_old_cwor_ETC__q31;
      3'b011: n__h22516 = rg_st_amo_val;
      default: n__h22516 = old_cword__h22505;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d600 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d628 or
	  IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC__q32 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_ram_ETC___d647 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d616 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d636 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d646)
  begin
    case (rg_f3)
      3'b0:
	  IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_IF_rg_f3_17_E_ETC___d715 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d600;
      3'b001:
	  IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_IF_rg_f3_17_E_ETC___d715 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d628;
      3'b010:
	  IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_IF_rg_f3_17_E_ETC___d715 =
	      { {32{IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC__q32[31]}},
		IF_rg_f3_17_EQ_0b0_18_THEN_IF_rg_addr_7_BITS_2_ETC__q32 };
      3'b011:
	  IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_IF_rg_f3_17_E_ETC___d715 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_ram_ETC___d647;
      3'b100:
	  IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_IF_rg_f3_17_E_ETC___d715 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d616;
      3'b101:
	  IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_IF_rg_f3_17_E_ETC___d715 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d636;
      3'b110:
	  IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_IF_rg_f3_17_E_ETC___d715 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d646;
      3'd7: IF_rg_f3_17_EQ_0b10_50_THEN_SEXT_IF_rg_f3_17_E_ETC___d715 = 64'd0;
    endcase
  end
  always@(rg_amo_funct7 or
	  new_st_val__h26650 or
	  new_st_val__h25642 or
	  w2__h38276 or
	  new_st_val__h26622 or
	  new_st_val__h26630 or
	  new_st_val__h26626 or
	  new_st_val__h26645 or new_st_val__h26634 or new_st_val__h26639)
  begin
    case (rg_amo_funct7[6:2])
      5'b0: _theResult_____2__h25547 = new_st_val__h25642;
      5'b00001: _theResult_____2__h25547 = w2__h38276;
      5'b00100: _theResult_____2__h25547 = new_st_val__h26622;
      5'b01000: _theResult_____2__h25547 = new_st_val__h26630;
      5'b01100: _theResult_____2__h25547 = new_st_val__h26626;
      5'b10000: _theResult_____2__h25547 = new_st_val__h26645;
      5'b11000: _theResult_____2__h25547 = new_st_val__h26634;
      5'b11100: _theResult_____2__h25547 = new_st_val__h26639;
      default: _theResult_____2__h25547 = new_st_val__h26650;
    endcase
  end
  always@(x1_avValue_pa__h6062 or old_cword__h22505 or new_st_val__h25251)
  begin
    case (x1_avValue_pa__h6062[2:0])
      3'h0:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d836 =
	      { old_cword__h22505[63:16], new_st_val__h25251[15:0] };
      3'h2:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d836 =
	      { old_cword__h22505[63:32],
		new_st_val__h25251[15:0],
		old_cword__h22505[15:0] };
      3'h4:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d836 =
	      { old_cword__h22505[63:48],
		new_st_val__h25251[15:0],
		old_cword__h22505[31:0] };
      3'h6:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d836 =
	      { new_st_val__h25251[15:0], old_cword__h22505[47:0] };
      default: IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d836 =
		   old_cword__h22505;
    endcase
  end
  always@(x1_avValue_pa__h6062 or old_cword__h22505 or new_st_val__h25251)
  begin
    case (x1_avValue_pa__h6062[2:0])
      3'h0:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d827 =
	      { old_cword__h22505[63:8], new_st_val__h25251[7:0] };
      3'h1:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d827 =
	      { old_cword__h22505[63:16],
		new_st_val__h25251[7:0],
		old_cword__h22505[7:0] };
      3'h2:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d827 =
	      { old_cword__h22505[63:24],
		new_st_val__h25251[7:0],
		old_cword__h22505[15:0] };
      3'h3:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d827 =
	      { old_cword__h22505[63:32],
		new_st_val__h25251[7:0],
		old_cword__h22505[23:0] };
      3'h4:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d827 =
	      { old_cword__h22505[63:40],
		new_st_val__h25251[7:0],
		old_cword__h22505[31:0] };
      3'h5:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d827 =
	      { old_cword__h22505[63:48],
		new_st_val__h25251[7:0],
		old_cword__h22505[39:0] };
      3'h6:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d827 =
	      { old_cword__h22505[63:56],
		new_st_val__h25251[7:0],
		old_cword__h22505[47:0] };
      3'h7:
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d827 =
	      { new_st_val__h25251[7:0], old_cword__h22505[55:0] };
    endcase
  end
  always@(x1_avValue_pa__h6062 or old_cword__h22505 or new_st_val__h25251)
  begin
    case (x1_avValue_pa__h6062[2:0])
      3'h0:
	  CASE_x1_avValue_pa062_BITS_2_TO_0_0x0_old_cwor_ETC__q34 =
	      { old_cword__h22505[63:32], new_st_val__h25251[31:0] };
      3'h4:
	  CASE_x1_avValue_pa062_BITS_2_TO_0_0x0_old_cwor_ETC__q34 =
	      { new_st_val__h25251[31:0], old_cword__h22505[31:0] };
      default: CASE_x1_avValue_pa062_BITS_2_TO_0_0x0_old_cwor_ETC__q34 =
		   old_cword__h22505;
    endcase
  end
  always@(rg_f3 or
	  old_cword__h22505 or
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d827 or
	  IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d836 or
	  CASE_x1_avValue_pa062_BITS_2_TO_0_0x0_old_cwor_ETC__q34 or
	  new_st_val__h25251)
  begin
    case (rg_f3)
      3'b0:
	  n__h25409 =
	      IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d827;
      3'b001:
	  n__h25409 =
	      IF_IF_rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_6_ETC___d836;
      3'b010:
	  n__h25409 = CASE_x1_avValue_pa062_BITS_2_TO_0_0x0_old_cwor_ETC__q34;
      3'b011: n__h25409 = new_st_val__h25251;
      default: n__h25409 = old_cword__h22505;
    endcase
  end
  always@(rg_addr or
	  result__h36655 or
	  result__h36682 or result__h36709 or result__h36736)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1235 =
	      result__h36655;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1235 =
	      result__h36682;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1235 =
	      result__h36709;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1235 =
	      result__h36736;
      default: IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1235 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h36534 or
	  result__h36561 or result__h36588 or result__h36615)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1227 =
	      result__h36534;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1227 =
	      result__h36561;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1227 =
	      result__h36588;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1227 =
	      result__h36615;
      default: IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1227 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h36301 or
	  result__h36328 or
	  result__h36355 or
	  result__h36382 or
	  result__h36409 or
	  result__h36436 or result__h36463 or result__h36490)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1215 =
	      result__h36301;
      3'h1:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1215 =
	      result__h36328;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1215 =
	      result__h36355;
      3'h3:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1215 =
	      result__h36382;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1215 =
	      result__h36409;
      3'h5:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1215 =
	      result__h36436;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1215 =
	      result__h36463;
      3'h7:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1215 =
	      result__h36490;
    endcase
  end
  always@(rg_addr or
	  result__h36065 or
	  result__h36095 or
	  result__h36122 or
	  result__h36149 or
	  result__h36176 or
	  result__h36203 or result__h36230 or result__h36257)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1199 =
	      result__h36065;
      3'h1:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1199 =
	      result__h36095;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1199 =
	      result__h36122;
      3'h3:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1199 =
	      result__h36149;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1199 =
	      result__h36176;
      3'h5:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1199 =
	      result__h36203;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1199 =
	      result__h36230;
      3'h7:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1199 =
	      result__h36257;
    endcase
  end
  always@(rg_addr or result__h36776 or result__h36803)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result6776_0x4_re_ETC__q35 =
	      result__h36776;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result6776_0x4_re_ETC__q35 =
	      result__h36803;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result6776_0x4_re_ETC__q35 =
		   64'd0;
    endcase
  end
  always@(rg_addr or result__h36841 or result__h36868)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result6841_0x4_re_ETC__q36 =
	      result__h36841;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result6841_0x4_re_ETC__q36 =
	      result__h36868;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result6841_0x4_re_ETC__q36 =
		   64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1199 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1227 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result6776_0x4_re_ETC__q35 or
	  rg_addr or
	  master_xactor_f_rd_data$D_OUT or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1215 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1235 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result6841_0x4_re_ETC__q36)
  begin
    case (rg_f3)
      3'b0:
	  ld_val__h35996 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1199;
      3'b001:
	  ld_val__h35996 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1227;
      3'b010:
	  ld_val__h35996 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result6776_0x4_re_ETC__q35;
      3'b011:
	  ld_val__h35996 =
	      (rg_addr[2:0] == 3'h0) ?
		master_xactor_f_rd_data$D_OUT[66:3] :
		64'd0;
      3'b100:
	  ld_val__h35996 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1215;
      3'b101:
	  ld_val__h35996 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1235;
      3'b110:
	  ld_val__h35996 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result6841_0x4_re_ETC__q36;
      3'd7: ld_val__h35996 = 64'd0;
    endcase
  end
  always@(rg_addr or result__h40144 or result__h40172)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1354 =
	      result__h40144;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1354 =
	      result__h40172;
      default: IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1354 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h39952 or
	  result__h39980 or result__h40008 or result__h40036)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1344 =
	      result__h39952;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1344 =
	      result__h39980;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1344 =
	      result__h40008;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1344 =
	      result__h40036;
      default: IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1344 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h39827 or
	  result__h39855 or result__h39883 or result__h39911)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1336 =
	      result__h39827;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1336 =
	      result__h39855;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1336 =
	      result__h39883;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1336 =
	      result__h39911;
      default: IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1336 =
		   64'd0;
    endcase
  end
  always@(rg_addr or
	  result__h38465 or
	  result__h39373 or
	  result__h39401 or
	  result__h39429 or
	  result__h39457 or
	  result__h39485 or result__h39513 or result__h39541)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1308 =
	      result__h38465;
      3'h1:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1308 =
	      result__h39373;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1308 =
	      result__h39401;
      3'h3:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1308 =
	      result__h39429;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1308 =
	      result__h39457;
      3'h5:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1308 =
	      result__h39485;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1308 =
	      result__h39513;
      3'h7:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1308 =
	      result__h39541;
    endcase
  end
  always@(rg_addr or
	  result__h39586 or
	  result__h39614 or
	  result__h39642 or
	  result__h39670 or
	  result__h39698 or
	  result__h39726 or result__h39754 or result__h39782)
  begin
    case (rg_addr[2:0])
      3'h0:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1324 =
	      result__h39586;
      3'h1:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1324 =
	      result__h39614;
      3'h2:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1324 =
	      result__h39642;
      3'h3:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1324 =
	      result__h39670;
      3'h4:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1324 =
	      result__h39698;
      3'h5:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1324 =
	      result__h39726;
      3'h6:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1324 =
	      result__h39754;
      3'h7:
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1324 =
	      result__h39782;
    endcase
  end
  always@(rg_addr or result__h40077 or result__h40105)
  begin
    case (rg_addr[2:0])
      3'h0:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result0077_0x4_re_ETC__q51 =
	      result__h40077;
      3'h4:
	  CASE_rg_addr_BITS_2_TO_0_0x0_result0077_0x4_re_ETC__q51 =
	      result__h40105;
      default: CASE_rg_addr_BITS_2_TO_0_0x0_result0077_0x4_re_ETC__q51 =
		   64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1308 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1336 or
	  CASE_rg_addr_BITS_2_TO_0_0x0_result0077_0x4_re_ETC__q51 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_IF__ETC___d1355 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1324 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1344 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1354)
  begin
    case (rg_f3)
      3'b0:
	  w1__h38270 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1308;
      3'b001:
	  w1__h38270 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1336;
      3'b010:
	  w1__h38270 =
	      CASE_rg_addr_BITS_2_TO_0_0x0_result0077_0x4_re_ETC__q51;
      3'b011:
	  w1__h38270 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_IF__ETC___d1355;
      3'b100:
	  w1__h38270 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1324;
      3'b101:
	  w1__h38270 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1344;
      3'b110:
	  w1__h38270 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1354;
      3'd7: w1__h38270 = 64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1308 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1336 or
	  w1___1__h38345 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_IF__ETC___d1355 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1324 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1344 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1354)
  begin
    case (rg_f3)
      3'b0:
	  w1__h38274 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1308;
      3'b001:
	  w1__h38274 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1336;
      3'b010: w1__h38274 = w1___1__h38345;
      3'b011:
	  w1__h38274 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_IF__ETC___d1355;
      3'b100:
	  w1__h38274 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1324;
      3'b101:
	  w1__h38274 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1344;
      3'b110:
	  w1__h38274 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1354;
      3'd7: w1__h38274 = 64'd0;
    endcase
  end
  always@(rg_f3 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1308 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1336 or
	  w18270_BITS_31_TO_0__q52 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_IF__ETC___d1355 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1324 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1344 or
	  IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1354)
  begin
    case (rg_f3)
      3'b0:
	  new_ld_val__h38242 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1308;
      3'b001:
	  new_ld_val__h38242 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_SEX_ETC___d1336;
      3'b010:
	  new_ld_val__h38242 =
	      { {32{w18270_BITS_31_TO_0__q52[31]}},
		w18270_BITS_31_TO_0__q52 };
      3'b011:
	  new_ld_val__h38242 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_IF__ETC___d1355;
      3'b100:
	  new_ld_val__h38242 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1324;
      3'b101:
	  new_ld_val__h38242 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1344;
      3'b110:
	  new_ld_val__h38242 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_0_C_ETC___d1354;
      3'd7: new_ld_val__h38242 = 64'd0;
    endcase
  end
  always@(rg_amo_funct7 or
	  new_st_val__h40265 or
	  new_st_val__h38377 or
	  w2__h38276 or
	  new_st_val__h40237 or
	  new_st_val__h40245 or
	  new_st_val__h40241 or
	  new_st_val__h40260 or new_st_val__h40249 or new_st_val__h40254)
  begin
    case (rg_amo_funct7[6:2])
      5'b0: _theResult_____2__h38282 = new_st_val__h38377;
      5'b00001: _theResult_____2__h38282 = w2__h38276;
      5'b00100: _theResult_____2__h38282 = new_st_val__h40237;
      5'b01000: _theResult_____2__h38282 = new_st_val__h40245;
      5'b01100: _theResult_____2__h38282 = new_st_val__h40241;
      5'b10000: _theResult_____2__h38282 = new_st_val__h40260;
      5'b11000: _theResult_____2__h38282 = new_st_val__h40249;
      5'b11100: _theResult_____2__h38282 = new_st_val__h40254;
      default: _theResult_____2__h38282 = new_st_val__h40265;
    endcase
  end
  always@(rg_f3 or IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_1_E_ETC___d662)
  begin
    case (rg_f3)
      3'b0, 3'b001, 3'b010, 3'b011, 3'b100, 3'b101, 3'b110:
	  CASE_rg_f3_0b0_IF_rg_addr_7_BITS_2_TO_0_21_EQ__ETC__q53 =
	      IF_rg_addr_7_BITS_2_TO_0_21_EQ_0x0_22_THEN_1_E_ETC___d662;
      3'd7: CASE_rg_f3_0b0_IF_rg_addr_7_BITS_2_TO_0_21_EQ__ETC__q53 = 64'd0;
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
    if (rg_mstatus_MXR$EN)
      rg_mstatus_MXR <= `BSV_ASSIGNMENT_DELAY rg_mstatus_MXR$D_IN;
    if (rg_op$EN) rg_op <= `BSV_ASSIGNMENT_DELAY rg_op$D_IN;
    if (rg_pa$EN) rg_pa <= `BSV_ASSIGNMENT_DELAY rg_pa$D_IN;
    if (rg_priv$EN) rg_priv <= `BSV_ASSIGNMENT_DELAY rg_priv$D_IN;
    if (rg_pte_pa$EN) rg_pte_pa <= `BSV_ASSIGNMENT_DELAY rg_pte_pa$D_IN;
    if (rg_satp$EN) rg_satp <= `BSV_ASSIGNMENT_DELAY rg_satp$D_IN;
    if (rg_sstatus_SUM$EN)
      rg_sstatus_SUM <= `BSV_ASSIGNMENT_DELAY rg_sstatus_SUM$D_IN;
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
    rg_mstatus_MXR = 1'h0;
    rg_op = 2'h2;
    rg_pa = 64'hAAAAAAAAAAAAAAAA;
    rg_priv = 2'h2;
    rg_pte_pa = 64'hAAAAAAAAAAAAAAAA;
    rg_satp = 64'hAAAAAAAAAAAAAAAA;
    rg_sstatus_SUM = 1'h0;
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
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", f_fabric_write_reqs$D_OUT[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", x__h2890);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("                       ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("AXI4_Wr_Data { ", "wdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", mem_req_wr_data_wdata__h3063);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "wstrb: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", mem_req_wr_data_wstrb__h3064);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "wlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "wuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_fabric_send_write_req &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  cfg_verbosity != 4'd0 &&
	  !f_reset_reqs$D_OUT)
	begin
	  v__h4526 = $stime;
	  #0;
	end
    v__h4520 = v__h4526 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  cfg_verbosity != 4'd0 &&
	  !f_reset_reqs$D_OUT)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_reset: %0d sets x %0d ways: all tag states reset to CTAG_EMPTY",
		   v__h4520,
		   "D_MMU_Cache",
		   $signed(32'd64),
		   $signed(32'd2));
	else
	  $display("%0d: %s.rl_reset: %0d sets x %0d ways: all tag states reset to CTAG_EMPTY",
		   v__h4520,
		   "I_MMU_Cache",
		   $signed(32'd64),
		   $signed(32'd2));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  f_reset_reqs$D_OUT)
	begin
	  v__h4621 = $stime;
	  #0;
	end
    v__h4615 = v__h4621 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && rg_cset_in_cache == 6'd63 &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  f_reset_reqs$D_OUT)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_reset: Flushed", v__h4615, "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_reset: Flushed", v__h4615, "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h4747 = $stime;
	  #0;
	end
    v__h4741 = v__h4747 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_probe_and_immed_rsp; eaddr %0h",
		   v__h4741,
		   "D_MMU_Cache",
		   rg_addr);
	else
	  $display("%0d: %s: rl_probe_and_immed_rsp; eaddr %0h",
		   v__h4741,
		   "I_MMU_Cache",
		   rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  rg_satp[63:60] != 4'd0)
	$display("        Priv:%0d  SATP:{mode %0d asid %0h pa %0h}  VA:%0h.%0h.%0h",
		 rg_priv,
		 rg_satp[63:60],
		 rg_satp[59:44],
		 satp_pa__h1890,
		 rg_addr[29:21],
		 rg_addr[20:12],
		 rg_addr[11:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$display("        eaddr = {CTag 0x%0h  CSet 0x%0h  Word64 0x%0h  Byte 0x%0h}",
		 rg_addr[63:12],
		 rg_addr[11:6],
		 rg_addr[5:3],
		 rg_addr[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("        CSet 0x%0x: (state, tag):", rg_addr[11:6]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(" (");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  ram_state_and_ctag_cset$DOB[52])
	$write("CTAG_CLEAN");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  !ram_state_and_ctag_cset$DOB[52])
	$write("CTAG_EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  ram_state_and_ctag_cset$DOB[52])
	$write(", 0x%0x", ram_state_and_ctag_cset$DOB[51:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  !ram_state_and_ctag_cset$DOB[52])
	$write(", --");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(")");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(" (");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  ram_state_and_ctag_cset$DOB[105])
	$write("CTAG_CLEAN");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  !ram_state_and_ctag_cset$DOB[105])
	$write("CTAG_EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  ram_state_and_ctag_cset$DOB[105])
	$write(", 0x%0x", ram_state_and_ctag_cset$DOB[104:53]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  !ram_state_and_ctag_cset$DOB[105])
	$write(", --");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(")");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("        CSet 0x%0x, CWord 0x%0x: ",
	       rg_addr[11:6],
	       rg_addr[5:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(" 0x%0x", ram_cword_set$DOB[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(" 0x%0x", ram_cword_set$DOB[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("    TLB result: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("VM_Xlate_Result { ", "outcome: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d397)
	$write("VM_XLATE_OK");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d400)
	$write("VM_XLATE_EXCEPTION");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  rg_priv_6_ULE_0b1___d87 &&
	  rg_satp[63:60] == 4'd8 &&
	  !tlb$lookup[130])
	$write("VM_XLATE_TLB_MISS");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "pa: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", x1_avValue_pa__h6062);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", x1_avValue_exc_code__h6063);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "pte_modified: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d412)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "pte: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", value__h6897, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$display("    fa_record_pte_A_D_updates:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write("      ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write("TLB_Lookup_Result { ", "hit: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write(", ", "pte: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write("'h%h", tlb$lookup[129:66]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write(", ", "pte_level: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write("'h%h", tlb$lookup[65:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write(", ", "pte_pa: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write("'h%h", tlb$lookup[63:0], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write("      ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write("VM_Xlate_Result { ", "outcome: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d458)
	$write("VM_XLATE_OK");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d461)
	$write("VM_XLATE_EXCEPTION");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write(", ", "pa: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write("'h%h", x1_avValue_pa__h6062);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write("'h%h", x1_avValue_exc_code__h6063);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write(", ", "pte_modified: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d461)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d458)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write(", ", "pte: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write("'h%h", value__h6897, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  rg_priv_6_ULE_0b1_7_AND_rg_satp_9_BITS_63_TO_6_ETC___d422 &&
	  NOT_cfg_verbosity_read__1_ULT_2_49___d450)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d475)
	$display("    => IO_REQ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d481)
	$display("        ASSERTION ERROR: fn_test_cache_hit_or_miss: multiple hits in set at [%0d] and [%0d]",
		 $signed(32'd1),
		 1'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d677)
	begin
	  v__h21325 = $stime;
	  #0;
	end
    v__h21319 = v__h21325 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d677)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h21319,
		   "D_MMU_Cache",
		   rg_addr,
		   word64__h7596,
		   64'd0);
	else
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h21319,
		   "I_MMU_Cache",
		   rg_addr,
		   word64__h7596,
		   64'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d689)
	$display("        AMO LR: reserving PA 0x%0h", x1_avValue_pa__h6062);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d677)
	$display("        Read-hit: addr 0x%0h word64 0x%0h",
		 rg_addr,
		 word64__h7596);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d694)
	$display("        Read Miss: -> CACHE_START_REFILL.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d702)
	$display("        AMO LR: cache refill: cancelling LR/SC reservation for PA 0x%0h",
		 rg_lrsc_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d861)
	$display("        ST: cancelling LR/SC reservation for PA",
		 x1_avValue_pa__h6062);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	   tlb$lookup[130]) &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d867)
	$display("        AMO SC: fail: reserved addr 0x%0h, this address 0x%0h",
		 rg_lrsc_pa,
		 x1_avValue_pa__h6062);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	   tlb$lookup[130]) &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d873)
	$display("        AMO SC: fail due to invalid LR/SC reservation");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d879)
	$display("        AMO SC result = %0d", lrsc_result__h21704);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d885)
	$display("        Write-Cache-Hit: pa 0x%0h word64 0x%0h",
		 x1_avValue_pa__h6062,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d885)
	$write("        New Word64_Set:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d885)
	$write("        CSet 0x%0x, CWord 0x%0x: ",
	       rg_addr[11:6],
	       rg_addr[5:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d885)
	$write(" 0x%0x",
	       IF_NOT_ram_state_and_ctag_cset_b_read__00_BIT__ETC___d779);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d885)
	$write(" 0x%0x",
	       IF_ram_state_and_ctag_cset_b_read__00_BIT_105__ETC___d778);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d885)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	   tlb$lookup[130]) &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d890)
	$display("        Write-Cache-Miss: pa 0x%0h word64 0x%0h",
		 x1_avValue_pa__h6062,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d897)
	$display("        Write-Cache-Hit/Miss: eaddr 0x%0h word64 0x%0h",
		 rg_addr,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d897)
	$display("        => rl_write_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d903)
	begin
	  v__h25029 = $stime;
	  #0;
	end
    v__h25023 = v__h25029 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d903)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h25023,
		   "D_MMU_Cache",
		   rg_addr,
		   64'd1,
		   64'd0);
	else
	  $display("%0d: %s.drive_mem_rsp: addr 0x%0h ld_val 0x%0h st_amo_val 0x%0h",
		   v__h25023,
		   "I_MMU_Cache",
		   rg_addr,
		   64'd1,
		   64'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d903)
	$display("        AMO SC: Fail response for addr 0x%0h", rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	   tlb$lookup[130]) &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d909)
	$display("        AMO Miss: -> CACHE_START_REFILL.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d915)
	$display("        AMO: addr 0x%0h amo_f7 0x%0h f3 %0d rs2_val 0x%0h",
		 rg_addr,
		 rg_amo_funct7,
		 rg_f3,
		 rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d915)
	$display("          PA 0x%0h ", x1_avValue_pa__h6062);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d915)
	$display("          Cache word64 0x%0h, load-result 0x%0h",
		 word64__h7596,
		 word64__h7596);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d915)
	$display("          0x%0h  op  0x%0h -> 0x%0h",
		 word64__h7596,
		 word64__h7596,
		 new_st_val__h25251);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d915)
	$write("          New Word64_Set:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d915)
	$write("        CSet 0x%0x, CWord 0x%0x: ",
	       rg_addr[11:6],
	       rg_addr[5:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d915)
	$write(" 0x%0x",
	       IF_NOT_ram_state_and_ctag_cset_b_read__00_BIT__ETC___d847);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d915)
	$write(" 0x%0x",
	       IF_ram_state_and_ctag_cset_b_read__00_BIT_105__ETC___d846);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d915)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_probe_and_immed_rsp &&
	  (!rg_priv_6_ULE_0b1___d87 || rg_satp[63:60] != 4'd8 ||
	   tlb$lookup[130]) &&
	  NOT_rg_priv_6_ULE_0b1_7_8_OR_NOT_rg_satp_9_BIT_ETC___d920)
	$display("        AMO_op: cancelling LR/SC reservation for PA",
		 x1_avValue_pa__h6062);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_ddr4_ready)
	begin
	  v__h43514 = $stime;
	  #0;
	end
    v__h43508 = v__h43514 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_ddr4_ready)
	$display("%0d: %m.ma_ddr4_ready: Enabling MMU_Cache", v__h43508);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h28547 = $stime;
	  #0;
	end
    v__h28541 = v__h28547 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_start_tlb_refill for eaddr 0x%0h; req for level 2 PTE",
		   v__h28541,
		   "D_MMU_Cache",
		   rg_addr);
	else
	  $display("%0d: %s.rl_start_tlb_refill for eaddr 0x%0h; req for level 2 PTE",
		   v__h28541,
		   "I_MMU_Cache",
		   rg_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", lev_2_pte_pa_w64_fa__h28598);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 3'b011);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_tlb_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d981)
	begin
	  v__h29498 = $stime;
	  #0;
	end
    v__h29492 = v__h29498 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d981)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_ptw_level_2: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: Invalid PTE; page fault %0d",
		   v__h29492,
		   "D_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa,
		   exc_code___1__h6472);
	else
	  $display("%0d: %s.rl_ptw_level_2: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: Invalid PTE; page fault %0d",
		   v__h29492,
		   "I_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa,
		   exc_code___1__h6472);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	begin
	  v__h29236 = $stime;
	  #0;
	end
    v__h29230 = v__h29236 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_rl_ptw_level_2: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: continue to level 1",
		   v__h29230,
		   "D_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa);
	else
	  $display("%0d: %s.rl_rl_ptw_level_2: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: continue to level 1",
		   v__h29230,
		   "I_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$display("    Req for level 1 PTE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", lev_1_pte_pa_w64_fa__h29532);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 3'b011);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1007)
	begin
	  v__h29801 = $stime;
	  #0;
	end
    v__h29795 = v__h29801 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1007)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_ptw_level_2: for eaddr 0x%0h: gigapage pte 0x%0h @ 0x%0h",
		   v__h29795,
		   "D_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa);
	else
	  $display("%0d: %s.rl_ptw_level_2: for eaddr 0x%0h: gigapage pte 0x%0h @ 0x%0h",
		   v__h29795,
		   "I_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  master_xactor_f_rd_data$D_OUT[3] &&
	  (master_xactor_f_rd_data$D_OUT[4] ||
	   !master_xactor_f_rd_data$D_OUT[5]) &&
	  (master_xactor_f_rd_data$D_OUT[6] ||
	   master_xactor_f_rd_data$D_OUT[4]) &&
	  (master_xactor_f_rd_data$D_OUT[30:22] != 9'd0 ||
	   master_xactor_f_rd_data$D_OUT[21:13] != 9'd0))
	$display("    Invalid PTE: PPN[1] or PPN[0] is not zero; page fault %0d",
		 exc_code___1__h6472);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1019)
	begin
	  v__h29918 = $stime;
	  #0;
	end
    v__h29912 = v__h29918 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1019)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_ptw_level_2: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: leaf PTE for gigapage",
		   v__h29912,
		   "D_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa);
	else
	  $display("%0d: %s.rl_ptw_level_2: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: leaf PTE for gigapage",
		   v__h29912,
		   "I_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1019)
	$display("    Addr Space megapage pa: 0x%0h", lev_1_PTN_pa__h29528);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h29418 = $stime;
	  #0;
	end
    v__h29412 = v__h29418 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_2 &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_ptw_level_2: for eaddr 0x%0h: pte_pa 0x%0h: FABRIC_RSP_ERR: access exception %0d",
		   v__h29412,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_pte_pa,
		   access_exc_code__h2635);
	else
	  $display("%0d: %s.rl_ptw_level_2: for eaddr 0x%0h: pte_pa 0x%0h: FABRIC_RSP_ERR: access exception %0d",
		   v__h29412,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_pte_pa,
		   access_exc_code__h2635);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d981)
	begin
	  v__h30591 = $stime;
	  #0;
	end
    v__h30585 = v__h30591 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d981)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_ptw_level_1: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: Invalid PTE; page fault %0d",
		   v__h30585,
		   "D_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa,
		   exc_code___1__h6472);
	else
	  $display("%0d: %s.rl_ptw_level_1: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: Invalid PTE; page fault %0d",
		   v__h30585,
		   "I_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa,
		   exc_code___1__h6472);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	begin
	  v__h30332 = $stime;
	  #0;
	end
    v__h30326 = v__h30332 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_rl_ptw_level_1: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: continue to level 0",
		   v__h30326,
		   "D_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa);
	else
	  $display("%0d: %s.rl_rl_ptw_level_1: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: continue to level 0",
		   v__h30326,
		   "I_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$display("    Req for level 0 PTE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", lev_0_pte_pa_w64_fa__h30625);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 3'b011);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1054)
	begin
	  v__h31011 = $stime;
	  #0;
	end
    v__h31005 = v__h31011 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1054)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_ptw_level_1: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: leaf PTE for megapage",
		   v__h31005,
		   "D_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa);
	else
	  $display("%0d: %s.rl_ptw_level_1: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: leaf PTE for megapage",
		   v__h31005,
		   "I_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1054)
	$display("    Addr Space megapage pa: 0x%0h", lev_1_PTN_pa__h29528);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1060)
	begin
	  v__h30894 = $stime;
	  #0;
	end
    v__h30888 = v__h30894 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1060)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_ptw_level_1: for eaddr 0x%0h: megapage pte 0x%0h @ 0x%0h",
		   v__h30888,
		   "D_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa);
	else
	  $display("%0d: %s.rl_ptw_level_1: for eaddr 0x%0h: megapage pte 0x%0h @ 0x%0h",
		   v__h30888,
		   "I_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  master_xactor_f_rd_data$D_OUT[3] &&
	  (master_xactor_f_rd_data$D_OUT[4] ||
	   !master_xactor_f_rd_data$D_OUT[5]) &&
	  (master_xactor_f_rd_data$D_OUT[6] ||
	   master_xactor_f_rd_data$D_OUT[4]) &&
	  master_xactor_f_rd_data$D_OUT[21:13] != 9'd0)
	$display("    Invalid PTE: PPN [0] is not zero; page fault %0d",
		 exc_code___1__h6472);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h30511 = $stime;
	  #0;
	end
    v__h30505 = v__h30511 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_1 &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_ptw_level_1: for eaddr 0x%0h: pte_pa 0x%0h: FABRIC_RSP_ERR: access exception %0d",
		   v__h30505,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_pte_pa,
		   access_exc_code__h2635);
	else
	  $display("%0d: %s.rl_ptw_level_1: for eaddr 0x%0h: pte_pa 0x%0h: FABRIC_RSP_ERR: access exception %0d",
		   v__h30505,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_pte_pa,
		   access_exc_code__h2635);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_0 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d981)
	begin
	  v__h31524 = $stime;
	  #0;
	end
    v__h31518 = v__h31524 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_0 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d981)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_ptw_level_0: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: Invalid PTE; page fault %0d",
		   v__h31518,
		   "D_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa,
		   exc_code___1__h6472);
	else
	  $display("%0d: %s.rl_ptw_level_0: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: Invalid PTE; page fault %0d",
		   v__h31518,
		   "I_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa,
		   exc_code___1__h6472);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_0 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	begin
	  v__h31604 = $stime;
	  #0;
	end
    v__h31598 = v__h31604 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_0 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d991)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_ptw_level_0: for eaddr 0x%0h: pte 0x%0h @ 0x50h: Not a leaf PTE; page fault %0d",
		   v__h31598,
		   "D_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa,
		   exc_code___1__h6472);
	else
	  $display("%0d: %s.rl_ptw_level_0: for eaddr 0x%0h: pte 0x%0h @ 0x50h: Not a leaf PTE; page fault %0d",
		   v__h31598,
		   "I_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa,
		   exc_code___1__h6472);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_0 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1085)
	begin
	  v__h31695 = $stime;
	  #0;
	end
    v__h31689 = v__h31695 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_0 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1085)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_ptw_level_0: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: leaf PTE",
		   v__h31689,
		   "D_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa);
	else
	  $display("%0d: %s.rl_ptw_level_0: for eaddr 0x%0h: pte 0x%0h @ 0x%0h: leaf PTE",
		   v__h31689,
		   "I_MMU_Cache",
		   rg_addr,
		   master_xactor_f_rd_data$D_OUT[66:3],
		   rg_pte_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_0 &&
	  master_xactor_f_rd_data_first__41_BITS_2_TO_1__ETC___d1085)
	$display("    Addr Space page pa: 0x%0h", lev_1_PTN_pa__h29528);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_0 &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h31444 = $stime;
	  #0;
	end
    v__h31438 = v__h31444 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_level_0 &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_ptw_level_0: for eaddr 0x%0h: pte_pa 0x%0h: FABRIC_RSP_ERR: access exception %0d",
		   v__h31438,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_pte_pa,
		   access_exc_code__h2635);
	else
	  $display("%0d: %s.rl_ptw_level_0: for eaddr 0x%0h: pte_pa 0x%0h: FABRIC_RSP_ERR: access exception %0d",
		   v__h31438,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_pte_pa,
		   access_exc_code__h2635);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h31831 = $stime;
	  #0;
	end
    v__h31825 = v__h31831 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_start_cache_refill: ",
		   v__h31825,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_start_cache_refill: ",
		   v__h31825,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("    To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", cline_fabric_addr__h31880);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 8'd7);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 3'b011);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_cache_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$display("    Victim way %0d; => CACHE_REFILL", tmp__h32017[0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	begin
	  v__h32639 = $stime;
	  #0;
	end
    v__h32633 = v__h32639 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_cache_refill_rsps_loop:",
		   v__h32633,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_cache_refill_rsps_loop:",
		   v__h32633,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[2:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107 &&
	  master_xactor_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107 &&
	  !master_xactor_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h32877 = $stime;
	  #0;
	end
    v__h32871 = v__h32877 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_cache_refill_rsps_loop: FABRIC_RSP_ERR: raising access exception %0d",
		   v__h32871,
		   "D_MMU_Cache",
		   access_exc_code__h2635);
	else
	  $display("%0d: %s.rl_cache_refill_rsps_loop: FABRIC_RSP_ERR: raising access exception %0d",
		   v__h32871,
		   "I_MMU_Cache",
		   access_exc_code__h2635);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  rg_cset_cword_in_cache[2:0] == 3'd7 &&
	  (master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 ||
	   rg_error_during_refill) &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$display("    => MODULE_EXCEPTION_RSP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  rg_cset_cword_in_cache[2:0] == 3'd7 &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !rg_error_during_refill &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$display("    => CACHE_REREQ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$display("        Updating Cache cword_set 0x%0h, cword_in_cline %0d) old => new",
		 rg_cset_cword_in_cache,
		 rg_cset_cword_in_cache[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write("        CSet 0x%0x, CWord 0x%0x: ",
	       rg_addr[11:6],
	       rg_cset_cword_in_cache[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write(" 0x%0x", ram_cword_set$DOB[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write(" 0x%0x", ram_cword_set$DOB[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write("        CSet 0x%0x, CWord 0x%0x: ",
	       rg_addr[11:6],
	       rg_cset_cword_in_cache[2:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write(" 0x%0x",
	       rg_victim_way ?
		 ram_cword_set$DOB[63:0] :
		 master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write(" 0x%0x",
	       rg_victim_way ?
		 master_xactor_f_rd_data$D_OUT[66:3] :
		 ram_cword_set$DOB[127:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cache_refill_rsps_loop &&
	  NOT_cfg_verbosity_read__1_ULE_2_106___d1107)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_rereq && !cfg_verbosity_read__1_ULE_1___d42)
	$display("    fa_req_ram_B tagCSet [0x%0x] cword_set [0x%0d]",
		 rg_addr[11:6],
		 rg_addr[11:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_watch_tohost)
	begin
	  v__h43437 = $stime;
	  #0;
	end
    v__h43431 = v__h43437 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_watch_tohost)
	$display("%0d: %m.set_watch_tohost: watch %0d, addr %0h",
		 v__h43431,
		 set_watch_tohost_watch_tohost,
		 set_watch_tohost_tohost_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h35556 = $stime;
	  #0;
	end
    v__h35550 = v__h35556 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_read_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h35550,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_read_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h35550,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", value__h37822);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp && !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h35889 = $stime;
	  #0;
	end
    v__h35883 = v__h35889 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp && !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h35883,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h35883,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp && !cfg_verbosity_read__1_ULE_1___d42)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp && !cfg_verbosity_read__1_ULE_1___d42)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[2:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp && !cfg_verbosity_read__1_ULE_1___d42 &&
	  master_xactor_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp && !cfg_verbosity_read__1_ULE_1___d42 &&
	  !master_xactor_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp && !cfg_verbosity_read__1_ULE_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h36984 = $stime;
	  #0;
	end
    v__h36978 = v__h36984 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h36978,
		   "D_MMU_Cache",
		   rg_addr,
		   ld_val__h35996);
	else
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h36978,
		   "I_MMU_Cache",
		   rg_addr,
		   ld_val__h35996);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h37112 = $stime;
	  #0;
	end
    v__h37106 = v__h37112 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_read_rsp: FABRIC_RSP_ERR: raising trap LOAD_ACCESS_FAULT",
		   v__h37106,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_io_read_rsp: FABRIC_RSP_ERR: raising trap LOAD_ACCESS_FAULT",
		   v__h37106,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_maintain_io_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h37205 = $stime;
	  #0;
	end
    v__h37199 = v__h37205 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_maintain_io_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h37199,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_ld_val);
	else
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h37199,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_ld_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_write_req && !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h37285 = $stime;
	  #0;
	end
    v__h37279 = v__h37285 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_write_req && !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_io_write_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h37279,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
	else
	  $display("%0d: %s: rl_io_write_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h37279,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_write_req && !cfg_verbosity_read__1_ULE_1___d42)
	$display("    => rl_ST_AMO_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req && !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h37512 = $stime;
	  #0;
	end
    v__h37506 = v__h37512 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req && !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_io_AMO_SC_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h37506,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
	else
	  $display("%0d: %s: rl_io_AMO_SC_req; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h37506,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req && !cfg_verbosity_read__1_ULE_1___d42)
	$display("    FAIL due to I/O address.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_SC_req && !cfg_verbosity_read__1_ULE_1___d42)
	$display("    => rl_ST_AMO_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h37648 = $stime;
	  #0;
	end
    v__h37642 = v__h37648 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_AMO_op_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h37642,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_AMO_op_req; f3 0x%0h vaddr %0h  paddr %0h",
		   v__h37642,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("            To fabric: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 8'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", value__h37822);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 2'b01);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 1'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'b0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 3'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 4'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 1'h0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_op_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h37929 = $stime;
	  #0;
	end
    v__h37923 = v__h37929 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_AMO_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h37923,
		   "D_MMU_Cache",
		   rg_addr,
		   rg_pa);
	else
	  $display("%0d: %s.rl_io_AMO_read_rsp: vaddr 0x%0h  paddr 0x%0h",
		   v__h37923,
		   "I_MMU_Cache",
		   rg_addr,
		   rg_pa);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[70:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", master_xactor_f_rd_data$D_OUT[2:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  master_xactor_f_rd_data$D_OUT[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42 &&
	  !master_xactor_f_rd_data$D_OUT[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h38111 = $stime;
	  #0;
	end
    v__h38105 = v__h38111 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s: rl_io_AMO_read_rsp; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h38105,
		   "D_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
	else
	  $display("%0d: %s: rl_io_AMO_read_rsp; f3 0x%0h  vaddr %0h  paddr %0h  word64 0x%0h",
		   v__h38105,
		   "I_MMU_Cache",
		   rg_f3,
		   rg_addr,
		   rg_pa,
		   rg_st_amo_val);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h40357 = $stime;
	  #0;
	end
    v__h40351 = v__h40357 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h40351,
		   "D_MMU_Cache",
		   rg_addr,
		   new_ld_val__h38242);
	else
	  $display("%0d: %s.drive_IO_read_rsp: addr 0x%0h ld_val 0x%0h",
		   v__h40351,
		   "I_MMU_Cache",
		   rg_addr,
		   new_ld_val__h38242);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$display("    => rl_ST_AMO_response");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h38212 = $stime;
	  #0;
	end
    v__h38206 = v__h38212 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_io_AMO_read_rsp &&
	  master_xactor_f_rd_data$D_OUT[2:1] != 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_io_AMO_read_rsp: FABRIC_RSP_ERR: raising trap STORE_AMO_ACCESS_FAULT",
		   v__h38206,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_io_AMO_read_rsp: FABRIC_RSP_ERR: raising trap STORE_AMO_ACCESS_FAULT",
		   v__h38206,
		   "I_MMU_Cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h40958 = $stime;
	  #0;
	end
    v__h40952 = v__h40958 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $write("%0d: %s.rl_discard_write_rsp: pending %0d ",
		 v__h40952,
		 "D_MMU_Cache",
		 $unsigned(b__h28501));
	else
	  $write("%0d: %s.rl_discard_write_rsp: pending %0d ",
		 v__h40952,
		 "I_MMU_Cache",
		 $unsigned(b__h28501));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", master_xactor_f_wr_resp$D_OUT[5:2]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", master_xactor_f_wr_resp$D_OUT[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] == 2'b0 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	begin
	  v__h41000 = $stime;
	  #0;
	end
    v__h40994 = v__h41000 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_discard_write_rsp &&
	  master_xactor_f_wr_resp$D_OUT[1:0] != 2'b0)
	if (dmem_not_imem)
	  $display("%0d: %s.rl_discard_write_rsp: fabric response error: exit",
		   v__h40994,
		   "D_MMU_Cache");
	else
	  $display("%0d: %s.rl_discard_write_rsp: fabric response error: exit",
		   v__h40994,
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
	  v__h4061 = $stime;
	  #0;
	end
    v__h4055 = v__h4061 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_start_reset)
	if (dmem_not_imem)
	  $display("%0d: %s: cache size %0d KB, associativity %0d, line size %0d bytes (= %0d XLEN words)",
		   v__h4055,
		   "D_MMU_Cache",
		   $signed(32'd8),
		   $signed(32'd2),
		   $signed(32'd64),
		   $signed(32'd8));
	else
	  $display("%0d: %s: cache size %0d KB, associativity %0d, line size %0d bytes (= %0d XLEN words)",
		   v__h4055,
		   "I_MMU_Cache",
		   $signed(32'd8),
		   $signed(32'd2),
		   $signed(32'd64),
		   $signed(32'd8));
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h41354 = $stime;
	  #0;
	end
    v__h41348 = v__h41354 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write("%0d: %m.req: op:", v__h41348);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !cfg_verbosity_read__1_ULE_1___d42 && req_op == 2'd0)
	$write("CACHE_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !cfg_verbosity_read__1_ULE_1___d42 && req_op == 2'd1)
	$write("CACHE_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !cfg_verbosity_read__1_ULE_1___d42 && req_op != 2'd0 &&
	  req_op != 2'd1)
	$write("CACHE_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(" f3:%0d addr:0x%0h st_value:0x%0h",
	       req_f3,
	       req_addr,
	       req_st_value,
	       "\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !cfg_verbosity_read__1_ULE_1___d42) $write("    priv:");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !cfg_verbosity_read__1_ULE_1___d42 && req_priv == 2'b0)
	$write("U");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !cfg_verbosity_read__1_ULE_1___d42 && req_priv == 2'b01)
	$write("S");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !cfg_verbosity_read__1_ULE_1___d42 && req_priv == 2'b11)
	$write("M");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !cfg_verbosity_read__1_ULE_1___d42 && req_priv != 2'b0 &&
	  req_priv != 2'b01 &&
	  req_priv != 2'b11)
	$write("RESERVED");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !cfg_verbosity_read__1_ULE_1___d42)
	$write(" sstatus_SUM:%0d mstatus_MXR:%0d satp:0x%0h",
	       req_sstatus_SUM,
	       req_mstatus_MXR,
	       req_satp,
	       "\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req && !cfg_verbosity_read__1_ULE_1___d42)
	$display("    amo_funct7 = 0x%0h", req_amo_funct7);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_req &&
	  req_f3_BITS_1_TO_0_440_EQ_0b0_441_OR_req_f3_BI_ETC___d1470 &&
	  !cfg_verbosity_read__1_ULE_1___d42)
	$display("    fa_req_ram_B tagCSet [0x%0x] cword_set [0x%0d]",
		 req_addr[11:6],
		 req_addr[11:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_tlb_flush && !cfg_verbosity_read__1_ULE_1___d42)
	begin
	  v__h43050 = $stime;
	  #0;
	end
    v__h43044 = v__h43050 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_tlb_flush && !cfg_verbosity_read__1_ULE_1___d42)
	if (dmem_not_imem)
	  $display("%0d: %s.tlb_flush", v__h43044, "D_MMU_Cache");
	else
	  $display("%0d: %s.tlb_flush", v__h43044, "I_MMU_Cache");
  end
  // synopsys translate_on
endmodule