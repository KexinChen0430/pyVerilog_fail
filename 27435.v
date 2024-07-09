module outputs
  wire [511 : 0] dma_server_rdata;
  wire [63 : 0] imem_master_araddr,
		imem_master_awaddr,
		imem_master_wdata,
		mem_master_araddr,
		mem_master_awaddr,
		mem_master_wdata,
		mv_tohost_value;
  wire [7 : 0] imem_master_arlen,
	       imem_master_awlen,
	       imem_master_wstrb,
	       mem_master_arlen,
	       mem_master_awlen,
	       mem_master_wstrb,
	       mv_status;
  wire [5 : 0] dma_server_bid, dma_server_rid;
  wire [3 : 0] imem_master_arcache,
	       imem_master_arid,
	       imem_master_arqos,
	       imem_master_arregion,
	       imem_master_awcache,
	       imem_master_awid,
	       imem_master_awqos,
	       imem_master_awregion,
	       mem_master_arcache,
	       mem_master_arid,
	       mem_master_arqos,
	       mem_master_arregion,
	       mem_master_awcache,
	       mem_master_awid,
	       mem_master_awqos,
	       mem_master_awregion;
  wire [2 : 0] imem_master_arprot,
	       imem_master_arsize,
	       imem_master_awprot,
	       imem_master_awsize,
	       mem_master_arprot,
	       mem_master_arsize,
	       mem_master_awprot,
	       mem_master_awsize;
  wire [1 : 0] dma_server_bresp,
	       dma_server_rresp,
	       imem_master_arburst,
	       imem_master_awburst,
	       mem_master_arburst,
	       mem_master_awburst;
  wire RDY_hart0_server_reset_request_put,
       RDY_hart0_server_reset_response_get,
       RDY_ma_ddr4_ready,
       RDY_mv_tohost_value,
       RDY_set_verbosity,
       RDY_set_watch_tohost,
       dma_server_arready,
       dma_server_awready,
       dma_server_bvalid,
       dma_server_rlast,
       dma_server_rvalid,
       dma_server_wready,
       hart0_server_reset_response_get,
       imem_master_arlock,
       imem_master_arvalid,
       imem_master_awlock,
       imem_master_awvalid,
       imem_master_bready,
       imem_master_rready,
       imem_master_wlast,
       imem_master_wvalid,
       mem_master_arlock,
       mem_master_arvalid,
       mem_master_awlock,
       mem_master_awvalid,
       mem_master_bready,
       mem_master_rready,
       mem_master_wlast,
       mem_master_wvalid;
  // register cfg_logdelay
  reg [63 : 0] cfg_logdelay;
  wire [63 : 0] cfg_logdelay$D_IN;
  wire cfg_logdelay$EN;
  // register cfg_verbosity
  reg [3 : 0] cfg_verbosity;
  wire [3 : 0] cfg_verbosity$D_IN;
  wire cfg_verbosity$EN;
  // register imem_rg_cache_addr
  reg [31 : 0] imem_rg_cache_addr;
  reg [31 : 0] imem_rg_cache_addr$D_IN;
  wire imem_rg_cache_addr$EN;
  // register imem_rg_cache_b16
  reg [15 : 0] imem_rg_cache_b16;
  wire [15 : 0] imem_rg_cache_b16$D_IN;
  wire imem_rg_cache_b16$EN;
  // register imem_rg_f3
  reg [2 : 0] imem_rg_f3;
  wire [2 : 0] imem_rg_f3$D_IN;
  wire imem_rg_f3$EN;
  // register imem_rg_mstatus_MXR
  reg imem_rg_mstatus_MXR;
  wire imem_rg_mstatus_MXR$D_IN, imem_rg_mstatus_MXR$EN;
  // register imem_rg_pc
  reg [31 : 0] imem_rg_pc;
  reg [31 : 0] imem_rg_pc$D_IN;
  wire imem_rg_pc$EN;
  // register imem_rg_priv
  reg [1 : 0] imem_rg_priv;
  wire [1 : 0] imem_rg_priv$D_IN;
  wire imem_rg_priv$EN;
  // register imem_rg_satp
  reg [31 : 0] imem_rg_satp;
  wire [31 : 0] imem_rg_satp$D_IN;
  wire imem_rg_satp$EN;
  // register imem_rg_sstatus_SUM
  reg imem_rg_sstatus_SUM;
  wire imem_rg_sstatus_SUM$D_IN, imem_rg_sstatus_SUM$EN;
  // register imem_rg_tval
  reg [31 : 0] imem_rg_tval;
  reg [31 : 0] imem_rg_tval$D_IN;
  wire imem_rg_tval$EN;
  // register rg_csr_pc
  reg [31 : 0] rg_csr_pc;
  wire [31 : 0] rg_csr_pc$D_IN;
  wire rg_csr_pc$EN;
  // register rg_csr_val1
  reg [31 : 0] rg_csr_val1;
  wire [31 : 0] rg_csr_val1$D_IN;
  wire rg_csr_val1$EN;
  // register rg_cur_priv
  reg [1 : 0] rg_cur_priv;
  reg [1 : 0] rg_cur_priv$D_IN;
  wire rg_cur_priv$EN;
  // register rg_epoch
  reg [1 : 0] rg_epoch;
  reg [1 : 0] rg_epoch$D_IN;
  wire rg_epoch$EN;
  // register rg_mstatus_MXR
  reg rg_mstatus_MXR;
  wire rg_mstatus_MXR$D_IN, rg_mstatus_MXR$EN;
  // register rg_next_pc
  reg [31 : 0] rg_next_pc;
  reg [31 : 0] rg_next_pc$D_IN;
  wire rg_next_pc$EN;
  // register rg_run_on_reset
  reg rg_run_on_reset;
  wire rg_run_on_reset$D_IN, rg_run_on_reset$EN;
  // register rg_sstatus_SUM
  reg rg_sstatus_SUM;
  wire rg_sstatus_SUM$D_IN, rg_sstatus_SUM$EN;
  // register rg_start_CPI_cycles
  reg [63 : 0] rg_start_CPI_cycles;
  wire [63 : 0] rg_start_CPI_cycles$D_IN;
  wire rg_start_CPI_cycles$EN;
  // register rg_start_CPI_instrs
  reg [63 : 0] rg_start_CPI_instrs;
  wire [63 : 0] rg_start_CPI_instrs$D_IN;
  wire rg_start_CPI_instrs$EN;
  // register rg_state
  reg [3 : 0] rg_state;
  reg [3 : 0] rg_state$D_IN;
  wire rg_state$EN;
  // register rg_trap_info
  reg [67 : 0] rg_trap_info;
  reg [67 : 0] rg_trap_info$D_IN;
  wire rg_trap_info$EN;
  // register rg_trap_instr
  reg [31 : 0] rg_trap_instr;
  wire [31 : 0] rg_trap_instr$D_IN;
  wire rg_trap_instr$EN;
  // register rg_trap_interrupt
  reg rg_trap_interrupt;
  wire rg_trap_interrupt$D_IN, rg_trap_interrupt$EN;
  // register stage1_rg_full
  reg stage1_rg_full;
  reg stage1_rg_full$D_IN;
  wire stage1_rg_full$EN;
  // register stage1_rg_stage_input
  reg [305 : 0] stage1_rg_stage_input;
  wire [305 : 0] stage1_rg_stage_input$D_IN;
  wire stage1_rg_stage_input$EN;
  // register stage2_rg_full
  reg stage2_rg_full;
  reg stage2_rg_full$D_IN;
  wire stage2_rg_full$EN;
  // register stage2_rg_resetting
  reg stage2_rg_resetting;
  wire stage2_rg_resetting$D_IN, stage2_rg_resetting$EN;
  // register stage2_rg_stage2
  reg [168 : 0] stage2_rg_stage2;
  wire [168 : 0] stage2_rg_stage2$D_IN;
  wire stage2_rg_stage2$EN;
  // register stage3_rg_full
  reg stage3_rg_full;
  reg stage3_rg_full$D_IN;
  wire stage3_rg_full$EN;
  // register stage3_rg_stage3
  reg [103 : 0] stage3_rg_stage3;
  wire [103 : 0] stage3_rg_stage3$D_IN;
  wire stage3_rg_stage3$EN;
  // register stageD_rg_data
  reg [137 : 0] stageD_rg_data;
  wire [137 : 0] stageD_rg_data$D_IN;
  wire stageD_rg_data$EN;
  // register stageD_rg_full
  reg stageD_rg_full;
  reg stageD_rg_full$D_IN;
  wire stageD_rg_full$EN;
  // register stageF_rg_epoch
  reg [1 : 0] stageF_rg_epoch;
  reg [1 : 0] stageF_rg_epoch$D_IN;
  wire stageF_rg_epoch$EN;
  // register stageF_rg_full
  reg stageF_rg_full;
  reg stageF_rg_full$D_IN;
  wire stageF_rg_full$EN;
  // register stageF_rg_priv
  reg [1 : 0] stageF_rg_priv;
  wire [1 : 0] stageF_rg_priv$D_IN;
  wire stageF_rg_priv$EN;
  // ports of submodule csr_regfile
  reg [1 : 0] csr_regfile$csr_ret_actions_from_priv;
  wire [97 : 0] csr_regfile$csr_trap_actions;
  wire [65 : 0] csr_regfile$csr_ret_actions;
  wire [63 : 0] csr_regfile$read_csr_mcycle, csr_regfile$read_csr_minstret;
  wire [32 : 0] csr_regfile$read_csr;
  wire [31 : 0] csr_regfile$csr_trap_actions_pc,
		csr_regfile$csr_trap_actions_xtval,
		csr_regfile$mav_csr_write_word,
		csr_regfile$read_mstatus,
		csr_regfile$read_satp;
  wire [27 : 0] csr_regfile$read_misa;
  wire [11 : 0] csr_regfile$access_permitted_1_csr_addr,
		csr_regfile$access_permitted_2_csr_addr,
		csr_regfile$csr_counter_read_fault_csr_addr,
		csr_regfile$mav_csr_write_csr_addr,
		csr_regfile$mav_read_csr_csr_addr,
		csr_regfile$read_csr_csr_addr,
		csr_regfile$read_csr_port2_csr_addr;
  wire [4 : 0] csr_regfile$interrupt_pending;
  wire [3 : 0] csr_regfile$csr_trap_actions_exc_code;
  wire [1 : 0] csr_regfile$access_permitted_1_priv,
	       csr_regfile$access_permitted_2_priv,
	       csr_regfile$csr_counter_read_fault_priv,
	       csr_regfile$csr_trap_actions_from_priv,
	       csr_regfile$interrupt_pending_cur_priv;
  wire csr_regfile$EN_csr_minstret_incr,
       csr_regfile$EN_csr_ret_actions,
       csr_regfile$EN_csr_trap_actions,
       csr_regfile$EN_debug,
       csr_regfile$EN_mav_csr_write,
       csr_regfile$EN_mav_read_csr,
       csr_regfile$EN_server_reset_request_put,
       csr_regfile$EN_server_reset_response_get,
       csr_regfile$RDY_server_reset_request_put,
       csr_regfile$RDY_server_reset_response_get,
       csr_regfile$access_permitted_1,
       csr_regfile$access_permitted_1_read_not_write,
       csr_regfile$access_permitted_2,
       csr_regfile$access_permitted_2_read_not_write,
       csr_regfile$csr_trap_actions_interrupt,
       csr_regfile$csr_trap_actions_nmi,
       csr_regfile$m_external_interrupt_req_set_not_clear,
       csr_regfile$nmi_pending,
       csr_regfile$nmi_req_set_not_clear,
       csr_regfile$s_external_interrupt_req_set_not_clear,
       csr_regfile$software_interrupt_req_set_not_clear,
       csr_regfile$timer_interrupt_req_set_not_clear,
       csr_regfile$wfi_resume;
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
  // ports of submodule gpr_regfile
  wire [31 : 0] gpr_regfile$read_rs1,
		gpr_regfile$read_rs2,
		gpr_regfile$write_rd_rd_val;
  wire [4 : 0] gpr_regfile$read_rs1_port2_rs1,
	       gpr_regfile$read_rs1_rs1,
	       gpr_regfile$read_rs2_rs2,
	       gpr_regfile$write_rd_rd;
  wire gpr_regfile$EN_server_reset_request_put,
       gpr_regfile$EN_server_reset_response_get,
       gpr_regfile$EN_write_rd,
       gpr_regfile$RDY_server_reset_request_put,
       gpr_regfile$RDY_server_reset_response_get;
  // ports of submodule near_mem
  reg [31 : 0] near_mem$imem_req_addr;
  wire [511 : 0] near_mem$dma_server_rdata, near_mem$dma_server_wdata;
  wire [63 : 0] near_mem$dma_server_araddr,
		near_mem$dma_server_awaddr,
		near_mem$dma_server_wstrb,
		near_mem$dmem_req_store_value,
		near_mem$dmem_word64,
		near_mem$imem_master_araddr,
		near_mem$imem_master_awaddr,
		near_mem$imem_master_rdata,
		near_mem$imem_master_wdata,
		near_mem$mem_master_araddr,
		near_mem$mem_master_awaddr,
		near_mem$mem_master_rdata,
		near_mem$mem_master_wdata,
		near_mem$mv_tohost_value,
		near_mem$set_watch_tohost_tohost_addr;
  wire [31 : 0] near_mem$dmem_req_addr,
		near_mem$dmem_req_satp,
		near_mem$imem_instr,
		near_mem$imem_pc,
		near_mem$imem_req_satp;
  wire [7 : 0] near_mem$dma_server_arlen,
	       near_mem$dma_server_awlen,
	       near_mem$imem_master_arlen,
	       near_mem$imem_master_awlen,
	       near_mem$imem_master_wstrb,
	       near_mem$mem_master_arlen,
	       near_mem$mem_master_awlen,
	       near_mem$mem_master_wstrb,
	       near_mem$mv_status,
	       near_mem$server_fence_request_put;
  wire [5 : 0] near_mem$dma_server_arid,
	       near_mem$dma_server_awid,
	       near_mem$dma_server_bid,
	       near_mem$dma_server_rid;
  wire [3 : 0] near_mem$dma_server_arcache,
	       near_mem$dma_server_arqos,
	       near_mem$dma_server_arregion,
	       near_mem$dma_server_awcache,
	       near_mem$dma_server_awqos,
	       near_mem$dma_server_awregion,
	       near_mem$dmem_exc_code,
	       near_mem$imem_exc_code,
	       near_mem$imem_master_arcache,
	       near_mem$imem_master_arid,
	       near_mem$imem_master_arqos,
	       near_mem$imem_master_arregion,
	       near_mem$imem_master_awcache,
	       near_mem$imem_master_awid,
	       near_mem$imem_master_awqos,
	       near_mem$imem_master_awregion,
	       near_mem$imem_master_bid,
	       near_mem$imem_master_rid,
	       near_mem$mem_master_arcache,
	       near_mem$mem_master_arid,
	       near_mem$mem_master_arqos,
	       near_mem$mem_master_arregion,
	       near_mem$mem_master_awcache,
	       near_mem$mem_master_awid,
	       near_mem$mem_master_awqos,
	       near_mem$mem_master_awregion,
	       near_mem$mem_master_bid,
	       near_mem$mem_master_rid;
  wire [2 : 0] near_mem$dma_server_arprot,
	       near_mem$dma_server_arsize,
	       near_mem$dma_server_awprot,
	       near_mem$dma_server_awsize,
	       near_mem$dmem_req_f3,
	       near_mem$imem_master_arprot,
	       near_mem$imem_master_arsize,
	       near_mem$imem_master_awprot,
	       near_mem$imem_master_awsize,
	       near_mem$imem_req_f3,
	       near_mem$mem_master_arprot,
	       near_mem$mem_master_arsize,
	       near_mem$mem_master_awprot,
	       near_mem$mem_master_awsize;
  wire [1 : 0] near_mem$dma_server_arburst,
	       near_mem$dma_server_awburst,
	       near_mem$dma_server_bresp,
	       near_mem$dma_server_rresp,
	       near_mem$dmem_req_priv,
	       near_mem$imem_master_arburst,
	       near_mem$imem_master_awburst,
	       near_mem$imem_master_bresp,
	       near_mem$imem_master_rresp,
	       near_mem$imem_req_priv,
	       near_mem$mem_master_arburst,
	       near_mem$mem_master_awburst,
	       near_mem$mem_master_bresp,
	       near_mem$mem_master_rresp;
  wire near_mem$EN_dmem_req,
       near_mem$EN_imem_req,
       near_mem$EN_ma_ddr4_ready,
       near_mem$EN_server_fence_i_request_put,
       near_mem$EN_server_fence_i_response_get,
       near_mem$EN_server_fence_request_put,
       near_mem$EN_server_fence_response_get,
       near_mem$EN_server_reset_request_put,
       near_mem$EN_server_reset_response_get,
       near_mem$EN_set_watch_tohost,
       near_mem$RDY_server_fence_i_request_put,
       near_mem$RDY_server_fence_i_response_get,
       near_mem$RDY_server_fence_request_put,
       near_mem$RDY_server_fence_response_get,
       near_mem$RDY_server_reset_request_put,
       near_mem$RDY_server_reset_response_get,
       near_mem$dma_server_arlock,
       near_mem$dma_server_arready,
       near_mem$dma_server_arvalid,
       near_mem$dma_server_awlock,
       near_mem$dma_server_awready,
       near_mem$dma_server_awvalid,
       near_mem$dma_server_bready,
       near_mem$dma_server_bvalid,
       near_mem$dma_server_rlast,
       near_mem$dma_server_rready,
       near_mem$dma_server_rvalid,
       near_mem$dma_server_wlast,
       near_mem$dma_server_wready,
       near_mem$dma_server_wvalid,
       near_mem$dmem_exc,
       near_mem$dmem_req_mstatus_MXR,
       near_mem$dmem_req_op,
       near_mem$dmem_req_sstatus_SUM,
       near_mem$dmem_valid,
       near_mem$imem_exc,
       near_mem$imem_is_i32_not_i16,
       near_mem$imem_master_arlock,
       near_mem$imem_master_arready,
       near_mem$imem_master_arvalid,
       near_mem$imem_master_awlock,
       near_mem$imem_master_awready,
       near_mem$imem_master_awvalid,
       near_mem$imem_master_bready,
       near_mem$imem_master_bvalid,
       near_mem$imem_master_rlast,
       near_mem$imem_master_rready,
       near_mem$imem_master_rvalid,
       near_mem$imem_master_wlast,
       near_mem$imem_master_wready,
       near_mem$imem_master_wvalid,
       near_mem$imem_req_mstatus_MXR,
       near_mem$imem_req_sstatus_SUM,
       near_mem$imem_valid,
       near_mem$mem_master_arlock,
       near_mem$mem_master_arready,
       near_mem$mem_master_arvalid,
       near_mem$mem_master_awlock,
       near_mem$mem_master_awready,
       near_mem$mem_master_awvalid,
       near_mem$mem_master_bready,
       near_mem$mem_master_bvalid,
       near_mem$mem_master_rlast,
       near_mem$mem_master_rready,
       near_mem$mem_master_rvalid,
       near_mem$mem_master_wlast,
       near_mem$mem_master_wready,
       near_mem$mem_master_wvalid,
       near_mem$set_watch_tohost_watch_tohost;
  // ports of submodule soc_map
  wire [63 : 0] soc_map$m_is_IO_addr_addr,
		soc_map$m_is_mem_addr_addr,
		soc_map$m_is_near_mem_IO_addr_addr,
		soc_map$m_pc_reset_value;
  // ports of submodule stage1_f_reset_reqs
  wire stage1_f_reset_reqs$CLR,
       stage1_f_reset_reqs$DEQ,
       stage1_f_reset_reqs$EMPTY_N,
       stage1_f_reset_reqs$ENQ,
       stage1_f_reset_reqs$FULL_N;
  // ports of submodule stage1_f_reset_rsps
  wire stage1_f_reset_rsps$CLR,
       stage1_f_reset_rsps$DEQ,
       stage1_f_reset_rsps$EMPTY_N,
       stage1_f_reset_rsps$ENQ,
       stage1_f_reset_rsps$FULL_N;
  // ports of submodule stage2_f_reset_reqs
  wire stage2_f_reset_reqs$CLR,
       stage2_f_reset_reqs$DEQ,
       stage2_f_reset_reqs$EMPTY_N,
       stage2_f_reset_reqs$ENQ,
       stage2_f_reset_reqs$FULL_N;
  // ports of submodule stage2_f_reset_rsps
  wire stage2_f_reset_rsps$CLR,
       stage2_f_reset_rsps$DEQ,
       stage2_f_reset_rsps$EMPTY_N,
       stage2_f_reset_rsps$ENQ,
       stage2_f_reset_rsps$FULL_N;
  // ports of submodule stage3_f_reset_reqs
  wire stage3_f_reset_reqs$CLR,
       stage3_f_reset_reqs$DEQ,
       stage3_f_reset_reqs$EMPTY_N,
       stage3_f_reset_reqs$ENQ,
       stage3_f_reset_reqs$FULL_N;
  // ports of submodule stage3_f_reset_rsps
  wire stage3_f_reset_rsps$CLR,
       stage3_f_reset_rsps$DEQ,
       stage3_f_reset_rsps$EMPTY_N,
       stage3_f_reset_rsps$ENQ,
       stage3_f_reset_rsps$FULL_N;
  // ports of submodule stageD_f_reset_reqs
  wire stageD_f_reset_reqs$CLR,
       stageD_f_reset_reqs$DEQ,
       stageD_f_reset_reqs$EMPTY_N,
       stageD_f_reset_reqs$ENQ,
       stageD_f_reset_reqs$FULL_N;
  // ports of submodule stageD_f_reset_rsps
  wire stageD_f_reset_rsps$CLR,
       stageD_f_reset_rsps$DEQ,
       stageD_f_reset_rsps$EMPTY_N,
       stageD_f_reset_rsps$ENQ,
       stageD_f_reset_rsps$FULL_N;
  // ports of submodule stageF_branch_predictor
  reg [31 : 0] stageF_branch_predictor$predict_req_pc;
  wire [98 : 0] stageF_branch_predictor$bp_train_cf_info;
  wire [31 : 0] stageF_branch_predictor$bp_train_instr,
		stageF_branch_predictor$bp_train_pc,
		stageF_branch_predictor$predict_rsp,
		stageF_branch_predictor$predict_rsp_instr;
  wire stageF_branch_predictor$EN_bp_train,
       stageF_branch_predictor$EN_predict_req,
       stageF_branch_predictor$EN_reset,
       stageF_branch_predictor$RDY_predict_req,
       stageF_branch_predictor$bp_train_is_i32_not_i16,
       stageF_branch_predictor$predict_rsp_is_i32_not_i16;
  // ports of submodule stageF_f_reset_reqs
  wire stageF_f_reset_reqs$CLR,
       stageF_f_reset_reqs$DEQ,
       stageF_f_reset_reqs$EMPTY_N,
       stageF_f_reset_reqs$ENQ,
       stageF_f_reset_reqs$FULL_N;
  // ports of submodule stageF_f_reset_rsps
  wire stageF_f_reset_rsps$CLR,
       stageF_f_reset_rsps$DEQ,
       stageF_f_reset_rsps$EMPTY_N,
       stageF_f_reset_rsps$ENQ,
       stageF_f_reset_rsps$FULL_N;
  // rule scheduling signals
  wire CAN_FIRE_RL_imem_rl_assert_fail,
       CAN_FIRE_RL_imem_rl_fetch_next_32b,
       CAN_FIRE_RL_rl_WFI_resume,
       CAN_FIRE_RL_rl_finish_FENCE,
       CAN_FIRE_RL_rl_finish_FENCE_I,
       CAN_FIRE_RL_rl_pipe,
       CAN_FIRE_RL_rl_reset_complete,
       CAN_FIRE_RL_rl_reset_from_WFI,
       CAN_FIRE_RL_rl_reset_start,
       CAN_FIRE_RL_rl_show_pipe,
       CAN_FIRE_RL_rl_stage1_CSRR_S_or_C,
       CAN_FIRE_RL_rl_stage1_CSRR_S_or_C_2,
       CAN_FIRE_RL_rl_stage1_CSRR_W,
       CAN_FIRE_RL_rl_stage1_CSRR_W_2,
       CAN_FIRE_RL_rl_stage1_FENCE,
       CAN_FIRE_RL_rl_stage1_FENCE_I,
       CAN_FIRE_RL_rl_stage1_WFI,
       CAN_FIRE_RL_rl_stage1_interrupt,
       CAN_FIRE_RL_rl_stage1_restart_after_csrrx,
       CAN_FIRE_RL_rl_stage1_trap,
       CAN_FIRE_RL_rl_stage1_xRET,
       CAN_FIRE_RL_rl_stage2_nonpipe,
       CAN_FIRE_RL_rl_trap,
       CAN_FIRE_RL_rl_trap_fetch,
       CAN_FIRE_RL_stage1_rl_reset,
       CAN_FIRE_RL_stage2_rl_reset_begin,
       CAN_FIRE_RL_stage2_rl_reset_end,
       CAN_FIRE_RL_stage3_rl_reset,
       CAN_FIRE_RL_stageD_rl_reset,
       CAN_FIRE_RL_stageF_rl_reset,
       CAN_FIRE_dma_server_m_arvalid,
       CAN_FIRE_dma_server_m_awvalid,
       CAN_FIRE_dma_server_m_bready,
       CAN_FIRE_dma_server_m_rready,
       CAN_FIRE_dma_server_m_wvalid,
       CAN_FIRE_hart0_server_reset_request_put,
       CAN_FIRE_hart0_server_reset_response_get,
       CAN_FIRE_imem_master_m_arready,
       CAN_FIRE_imem_master_m_awready,
       CAN_FIRE_imem_master_m_bvalid,
       CAN_FIRE_imem_master_m_rvalid,
       CAN_FIRE_imem_master_m_wready,
       CAN_FIRE_m_external_interrupt_req,
       CAN_FIRE_ma_ddr4_ready,
       CAN_FIRE_mem_master_m_arready,
       CAN_FIRE_mem_master_m_awready,
       CAN_FIRE_mem_master_m_bvalid,
       CAN_FIRE_mem_master_m_rvalid,
       CAN_FIRE_mem_master_m_wready,
       CAN_FIRE_nmi_req,
       CAN_FIRE_s_external_interrupt_req,
       CAN_FIRE_set_verbosity,
       CAN_FIRE_set_watch_tohost,
       CAN_FIRE_software_interrupt_req,
       CAN_FIRE_timer_interrupt_req,
       WILL_FIRE_RL_imem_rl_assert_fail,
       WILL_FIRE_RL_imem_rl_fetch_next_32b,
       WILL_FIRE_RL_rl_WFI_resume,
       WILL_FIRE_RL_rl_finish_FENCE,
       WILL_FIRE_RL_rl_finish_FENCE_I,
       WILL_FIRE_RL_rl_pipe,
       WILL_FIRE_RL_rl_reset_complete,
       WILL_FIRE_RL_rl_reset_from_WFI,
       WILL_FIRE_RL_rl_reset_start,
       WILL_FIRE_RL_rl_show_pipe,
       WILL_FIRE_RL_rl_stage1_CSRR_S_or_C,
       WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2,
       WILL_FIRE_RL_rl_stage1_CSRR_W,
       WILL_FIRE_RL_rl_stage1_CSRR_W_2,
       WILL_FIRE_RL_rl_stage1_FENCE,
       WILL_FIRE_RL_rl_stage1_FENCE_I,
       WILL_FIRE_RL_rl_stage1_WFI,
       WILL_FIRE_RL_rl_stage1_interrupt,
       WILL_FIRE_RL_rl_stage1_restart_after_csrrx,
       WILL_FIRE_RL_rl_stage1_trap,
       WILL_FIRE_RL_rl_stage1_xRET,
       WILL_FIRE_RL_rl_stage2_nonpipe,
       WILL_FIRE_RL_rl_trap,
       WILL_FIRE_RL_rl_trap_fetch,
       WILL_FIRE_RL_stage1_rl_reset,
       WILL_FIRE_RL_stage2_rl_reset_begin,
       WILL_FIRE_RL_stage2_rl_reset_end,
       WILL_FIRE_RL_stage3_rl_reset,
       WILL_FIRE_RL_stageD_rl_reset,
       WILL_FIRE_RL_stageF_rl_reset,
       WILL_FIRE_dma_server_m_arvalid,
       WILL_FIRE_dma_server_m_awvalid,
       WILL_FIRE_dma_server_m_bready,
       WILL_FIRE_dma_server_m_rready,
       WILL_FIRE_dma_server_m_wvalid,
       WILL_FIRE_hart0_server_reset_request_put,
       WILL_FIRE_hart0_server_reset_response_get,
       WILL_FIRE_imem_master_m_arready,
       WILL_FIRE_imem_master_m_awready,
       WILL_FIRE_imem_master_m_bvalid,
       WILL_FIRE_imem_master_m_rvalid,
       WILL_FIRE_imem_master_m_wready,
       WILL_FIRE_m_external_interrupt_req,
       WILL_FIRE_ma_ddr4_ready,
       WILL_FIRE_mem_master_m_arready,
       WILL_FIRE_mem_master_m_awready,
       WILL_FIRE_mem_master_m_bvalid,
       WILL_FIRE_mem_master_m_rvalid,
       WILL_FIRE_mem_master_m_wready,
       WILL_FIRE_nmi_req,
       WILL_FIRE_s_external_interrupt_req,
       WILL_FIRE_set_verbosity,
       WILL_FIRE_set_watch_tohost,
       WILL_FIRE_software_interrupt_req,
       WILL_FIRE_timer_interrupt_req;
  // inputs to muxes for submodule ports
  reg [31 : 0] MUX_csr_regfile$mav_csr_write_2__VAL_2;
  wire [67 : 0] MUX_rg_trap_info$write_1__VAL_1,
		MUX_rg_trap_info$write_1__VAL_2,
		MUX_rg_trap_info$write_1__VAL_3,
		MUX_rg_trap_info$write_1__VAL_4;
  wire [31 : 0] MUX_imem_rg_cache_addr$write_1__VAL_1,
		MUX_imem_rg_cache_addr$write_1__VAL_2,
		MUX_imem_rg_tval$write_1__VAL_1,
		MUX_imem_rg_tval$write_1__VAL_2,
		MUX_imem_rg_tval$write_1__VAL_3,
		MUX_imem_rg_tval$write_1__VAL_4,
		MUX_near_mem$imem_req_2__VAL_1,
		MUX_near_mem$imem_req_2__VAL_2,
		MUX_near_mem$imem_req_2__VAL_4,
		MUX_rg_trap_instr$write_1__VAL_1;
  wire [3 : 0] MUX_rg_state$write_1__VAL_2,
	       MUX_rg_state$write_1__VAL_3,
	       MUX_rg_state$write_1__VAL_4;
  wire MUX_csr_regfile$mav_csr_write_1__SEL_1,
       MUX_gpr_regfile$write_rd_1__SEL_3,
       MUX_imem_rg_cache_addr$write_1__SEL_1,
       MUX_imem_rg_cache_addr$write_1__SEL_2,
       MUX_rg_next_pc$write_1__SEL_1,
       MUX_rg_next_pc$write_1__SEL_2,
       MUX_rg_state$write_1__SEL_1,
       MUX_rg_state$write_1__SEL_10,
       MUX_rg_state$write_1__SEL_2,
       MUX_rg_state$write_1__SEL_5,
       MUX_rg_state$write_1__SEL_7,
       MUX_rg_state$write_1__SEL_8,
       MUX_rg_state$write_1__SEL_9,
       MUX_rg_trap_info$write_1__SEL_1,
       MUX_rg_trap_instr$write_1__SEL_1,
       MUX_rg_trap_interrupt$write_1__SEL_1,
       MUX_stage1_rg_full$write_1__VAL_2,
       MUX_stage2_rg_full$write_1__VAL_2,
       MUX_stageD_rg_full$write_1__VAL_2,
       MUX_stageF_rg_full$write_1__VAL_2;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h2516;
  reg [31 : 0] v__h2510;
  // synopsys translate_on
  // remaining internal signals
  reg [31 : 0] CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q15,
	       IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d640,
	       _theResult_____1_fst__h8891,
	       rs1_val__h22768,
	       x_out_cf_info_taken_PC__h9558,
	       x_out_data_to_stage2_addr__h7929,
	       x_out_data_to_stage2_val1__h7930,
	       x_out_data_to_stage3_rd_val__h7355;
  reg [4 : 0] x_out_data_to_stage3_rd__h7354;
  reg [3 : 0] CASE_rg_cur_priv_0b0_8_0b1_9_11__q3,
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q10,
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q11,
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q13,
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q9,
	      CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_1_ETC__q12,
	      CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q4,
	      IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d412,
	      IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d415,
	      alu_outputs_exc_code__h8498;
  reg [1 : 0] CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q16,
	      CASE_stage2_rg_stage2_BITS_102_TO_101_0_2_1_IF_ETC__q5,
	      IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d500;
  reg CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q7,
      CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q8,
      IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d263,
      IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d316;
  wire [127 : 0] csr_regfile_read_csr_mcycle__3_MINUS_rg_start__ETC___d1548;
  wire [63 : 0] _theResult____h21609,
		cpi__h21611,
		cpifrac__h21612,
		delta_CPI_cycles__h21607,
		delta_CPI_instrs___1__h21644,
		delta_CPI_instrs__h21608,
		x__h21610;
  wire [31 : 0] IF_NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem__ETC___d1095,
		IF_csr_regfile_read_csr_rg_trap_instr_545_BITS_ETC___d1598,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d947,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d949,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d951,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d952,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d954,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d955,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d956,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d958,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d959,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d960,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d962,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d963,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d964,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d965,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d966,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d967,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d968,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d969,
		IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d970,
		IF_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg_p_ETC___d1096,
		IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d641,
		SEXT_stage1_rg_stage_input_88_BITS_87_TO_76_80___d528,
		_theResult_____1_fst__h8884,
		_theResult_____1_fst__h8919,
		_theResult____h5412,
		_theResult___snd__h9864,
		addr_of_b32___1__h17506,
		addr_of_b32___1__h20531,
		addr_of_b32___1__h28726,
		addr_of_b32__h17387,
		addr_of_b32__h20412,
		addr_of_b32__h28607,
		alu_outputs___1_addr__h8084,
		alu_outputs___1_addr__h8290,
		alu_outputs___1_val1__h8187,
		alu_outputs___1_val1__h8223,
		alu_outputs___1_val1__h8483,
		alu_outputs_cf_info_fallthru_PC__h9549,
		alu_outputs_cf_info_taken_PC__h9550,
		branch_target__h8061,
		d_instr__h15539,
		data_to_stage2_addr__h7919,
		eaddr__h8260,
		fall_through_pc__h7869,
		instr___1__h10091,
		instr__h10256,
		instr__h10401,
		instr__h10593,
		instr__h10788,
		instr__h11017,
		instr__h11360,
		instr__h11750,
		instr__h11866,
		instr__h11931,
		instr__h12248,
		instr__h12586,
		instr__h12770,
		instr__h12899,
		instr__h13336,
		instr__h13508,
		instr__h13681,
		instr__h13874,
		instr__h14067,
		instr__h14184,
		instr__h14362,
		instr__h14481,
		instr__h14576,
		instr__h14712,
		instr__h14848,
		instr__h14984,
		instr__h15322,
		instr_out___1__h15541,
		instr_out___1__h15563,
		next_pc___1__h9189,
		next_pc__h7870,
		next_pc__h8090,
		next_pc__h8117,
		next_pc__h9186,
		rd_val___1__h8872,
		rd_val___1__h8880,
		rd_val___1__h8887,
		rd_val___1__h8894,
		rd_val___1__h8901,
		rd_val___1__h8908,
		rd_val__h7771,
		rd_val__h7845,
		rd_val__h8230,
		rd_val__h8244,
		rd_val__h9761,
		rd_val__h9812,
		rd_val__h9834,
		rs1_val__h22085,
		rs1_val_bypassed__h5141,
		rs2_val__h8057,
		trap_info_tval__h9386,
		val__h7773,
		val__h7847,
		value__h9431,
		x_out_cf_info_fallthru_PC__h9557,
		x_out_data_to_stage1_instr__h10055,
		x_out_data_to_stage2_val2__h7931,
		x_out_next_pc__h7886,
		y__h23037;
  wire [20 : 0] SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d798,
		decoded_instr_imm21_UJ__h19083,
		stage1_rg_stage_input_BITS_30_TO_10__q2;
  wire [19 : 0] imm20__h12638;
  wire [12 : 0] SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d827,
		decoded_instr_imm13_SB__h19081,
		stage1_rg_stage_input_BITS_63_TO_51__q1;
  wire [11 : 0] decoded_instr_imm12_S__h19080,
		imm12__h10257,
		imm12__h10594,
		imm12__h12510,
		imm12__h13134,
		imm12__h13349,
		imm12__h13545,
		imm12__h13890,
		offset__h10964,
		stage1_rg_stage_input_BITS_75_TO_64__q6,
		stage1_rg_stage_input_BITS_87_TO_76__q14;
  wire [9 : 0] decoded_instr_funct10__h19078,
	       nzimm10__h13132,
	       nzimm10__h13347;
  wire [8 : 0] offset__h11875;
  wire [7 : 0] offset__h10129;
  wire [6 : 0] offset__h10536;
  wire [5 : 0] imm6__h12508;
  wire [4 : 0] data_to_stage2_rd__h7918,
	       offset_BITS_4_TO_0___h10525,
	       offset_BITS_4_TO_0___h10956,
	       rd__h10596,
	       rs1__h10595,
	       shamt__h8174,
	       x_out_data_to_stage2_rd__h7928;
  wire [3 : 0] IF_NOT_stage1_rg_stage_input_88_BITS_112_TO_11_ETC___d370,
	       IF_rg_cur_priv_4_EQ_0b11_84_AND_stage1_rg_stag_ETC___d398,
	       IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418,
	       alu_outputs___1_exc_code__h8479,
	       cur_verbosity__h3701,
	       x_exc_code__h29000,
	       x_out_trap_info_exc_code__h9391;
  wire [1 : 0] IF_NOT_near_mem_dmem_valid__16_32_OR_NOT_near__ETC___d173,
	       IF_stage1_rg_full_87_THEN_IF_stage1_rg_stage_i_ETC___d559,
	       IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122,
	       IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177,
	       IF_stage2_rg_stage2_00_BITS_102_TO_101_01_EQ_0_ETC___d121,
	       new_epoch__h16901;
  wire IF_IF_stage1_rg_stage_input_88_BITS_151_TO_145_ETC___d719,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1311,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1314,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1413,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1454,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1461,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1473,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1501,
       IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d1344,
       IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d1378,
       IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d252,
       IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d254,
       IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d256,
       IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d310,
       IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d321,
       IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d357,
       IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d359,
       IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d1296,
       IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d192,
       IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d194,
       IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362,
       NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d1359,
       NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52,
       NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d1304,
       NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d145,
       NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1303,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1307,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1316,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1318,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1325,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1347,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1368,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1375,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1395,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1410,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1520,
       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1078,
       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1092,
       NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1111,
       NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1118,
       NOT_rg_next_pc_609_BITS_1_TO_0_610_EQ_0b0_611__ETC___d1617,
       NOT_rg_run_on_reset_250_251_OR_imem_rg_pc_BITS_ETC___d1258,
       NOT_soc_map_m_pc_reset_value__270_BITS_1_TO_0__ETC___d1285,
       NOT_stage1_rg_full_87_66_OR_stage1_rg_stage_in_ETC___d1340,
       NOT_stage1_rg_full_87_66_OR_stage1_rg_stage_in_ETC___d1342,
       NOT_stage1_rg_stage_input_88_BITS_112_TO_110_1_ETC___d289,
       NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d1663,
       NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d1667,
       NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328,
       NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d491,
       NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d503,
       NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d507,
       NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d513,
       NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d1484,
       csr_regfile_RDY_server_reset_request_put__224__ETC___d1236,
       csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1464,
       csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1468,
       csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1471,
       csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1475,
       csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1510,
       csr_regfile_read_misa__2_BIT_2_34_AND_stageD_r_ETC___d812,
       csr_regfile_read_misa__2_BIT_2_34_AND_stageD_r_ETC___d818,
       imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1115,
       imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1254,
       imem_rg_pc_BITS_31_TO_2_4_EQ_imem_rg_cache_add_ETC___d1070,
       imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17,
       near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1123,
       near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125,
       near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_072___d1073,
       near_mem_imem_valid_AND_near_mem_imem_exc__1_A_ETC___d1220,
       rg_cur_priv_4_EQ_0b11_84_OR_rg_cur_priv_4_EQ_0_ETC___d396,
       rg_state_3_EQ_12_0_AND_csr_regfile_wfi_resume__ETC___d1654,
       rg_state_3_EQ_3_327_AND_NOT_csr_regfile_interr_ETC___d1524,
       rg_state_3_EQ_3_327_AND_NOT_csr_regfile_interr_ETC___d1634,
       rg_state_3_EQ_3_327_AND_NOT_csr_regfile_interr_ETC___d1643,
       rg_state_3_EQ_3_327_AND_stage3_rg_full_0_OR_NO_ETC___d1337,
       rg_state_3_EQ_5_658_AND_NOT_stageF_rg_full_100_ETC___d1659,
       rg_state_3_EQ_8_606_AND_NOT_stageF_rg_full_100_ETC___d1607,
       rg_trap_info_534_BITS_67_TO_36_535_EQ_csr_regf_ETC___d1544,
       stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365,
       stage1_rg_stage_input_88_BITS_112_TO_110_17_EQ_ETC___d343,
       stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d1299,
       stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190,
       stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208,
       stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d672,
       stage3_rg_full_0_OR_NOT_IF_stage2_rg_full_9_TH_ETC___d1335,
       stageF_f_reset_rsps_i_notEmpty__244_AND_stageD_ETC___d1264,
       stageF_rg_full_100_AND_near_mem_imem_valid_AND_ETC___d1132;
  // action method hart0_server_reset_request_put
  assign RDY_hart0_server_reset_request_put = f_reset_reqs$FULL_N ;
  assign CAN_FIRE_hart0_server_reset_request_put = f_reset_reqs$FULL_N ;
  assign WILL_FIRE_hart0_server_reset_request_put =
	     EN_hart0_server_reset_request_put ;
  // actionvalue method hart0_server_reset_response_get
  assign hart0_server_reset_response_get = f_reset_rsps$D_OUT ;
  assign RDY_hart0_server_reset_response_get = f_reset_rsps$EMPTY_N ;
  assign CAN_FIRE_hart0_server_reset_response_get = f_reset_rsps$EMPTY_N ;
  assign WILL_FIRE_hart0_server_reset_response_get =
	     EN_hart0_server_reset_response_get ;
  // value method imem_master_m_awvalid
  assign imem_master_awvalid = near_mem$imem_master_awvalid ;
  // value method imem_master_m_awid
  assign imem_master_awid = near_mem$imem_master_awid ;
  // value method imem_master_m_awaddr
  assign imem_master_awaddr = near_mem$imem_master_awaddr ;
  // value method imem_master_m_awlen
  assign imem_master_awlen = near_mem$imem_master_awlen ;
  // value method imem_master_m_awsize
  assign imem_master_awsize = near_mem$imem_master_awsize ;
  // value method imem_master_m_awburst
  assign imem_master_awburst = near_mem$imem_master_awburst ;
  // value method imem_master_m_awlock
  assign imem_master_awlock = near_mem$imem_master_awlock ;
  // value method imem_master_m_awcache
  assign imem_master_awcache = near_mem$imem_master_awcache ;
  // value method imem_master_m_awprot
  assign imem_master_awprot = near_mem$imem_master_awprot ;
  // value method imem_master_m_awqos
  assign imem_master_awqos = near_mem$imem_master_awqos ;
  // value method imem_master_m_awregion
  assign imem_master_awregion = near_mem$imem_master_awregion ;
  // action method imem_master_m_awready
  assign CAN_FIRE_imem_master_m_awready = 1'd1 ;
  assign WILL_FIRE_imem_master_m_awready = 1'd1 ;
  // value method imem_master_m_wvalid
  assign imem_master_wvalid = near_mem$imem_master_wvalid ;
  // value method imem_master_m_wdata
  assign imem_master_wdata = near_mem$imem_master_wdata ;
  // value method imem_master_m_wstrb
  assign imem_master_wstrb = near_mem$imem_master_wstrb ;
  // value method imem_master_m_wlast
  assign imem_master_wlast = near_mem$imem_master_wlast ;
  // action method imem_master_m_wready
  assign CAN_FIRE_imem_master_m_wready = 1'd1 ;
  assign WILL_FIRE_imem_master_m_wready = 1'd1 ;
  // action method imem_master_m_bvalid
  assign CAN_FIRE_imem_master_m_bvalid = 1'd1 ;
  assign WILL_FIRE_imem_master_m_bvalid = 1'd1 ;
  // value method imem_master_m_bready
  assign imem_master_bready = near_mem$imem_master_bready ;
  // value method imem_master_m_arvalid
  assign imem_master_arvalid = near_mem$imem_master_arvalid ;
  // value method imem_master_m_arid
  assign imem_master_arid = near_mem$imem_master_arid ;
  // value method imem_master_m_araddr
  assign imem_master_araddr = near_mem$imem_master_araddr ;
  // value method imem_master_m_arlen
  assign imem_master_arlen = near_mem$imem_master_arlen ;
  // value method imem_master_m_arsize
  assign imem_master_arsize = near_mem$imem_master_arsize ;
  // value method imem_master_m_arburst
  assign imem_master_arburst = near_mem$imem_master_arburst ;
  // value method imem_master_m_arlock
  assign imem_master_arlock = near_mem$imem_master_arlock ;
  // value method imem_master_m_arcache
  assign imem_master_arcache = near_mem$imem_master_arcache ;
  // value method imem_master_m_arprot
  assign imem_master_arprot = near_mem$imem_master_arprot ;
  // value method imem_master_m_arqos
  assign imem_master_arqos = near_mem$imem_master_arqos ;
  // value method imem_master_m_arregion
  assign imem_master_arregion = near_mem$imem_master_arregion ;
  // action method imem_master_m_arready
  assign CAN_FIRE_imem_master_m_arready = 1'd1 ;
  assign WILL_FIRE_imem_master_m_arready = 1'd1 ;
  // action method imem_master_m_rvalid
  assign CAN_FIRE_imem_master_m_rvalid = 1'd1 ;
  assign WILL_FIRE_imem_master_m_rvalid = 1'd1 ;
  // value method imem_master_m_rready
  assign imem_master_rready = near_mem$imem_master_rready ;
  // value method mem_master_m_awvalid
  assign mem_master_awvalid = near_mem$mem_master_awvalid ;
  // value method mem_master_m_awid
  assign mem_master_awid = near_mem$mem_master_awid ;
  // value method mem_master_m_awaddr
  assign mem_master_awaddr = near_mem$mem_master_awaddr ;
  // value method mem_master_m_awlen
  assign mem_master_awlen = near_mem$mem_master_awlen ;
  // value method mem_master_m_awsize
  assign mem_master_awsize = near_mem$mem_master_awsize ;
  // value method mem_master_m_awburst
  assign mem_master_awburst = near_mem$mem_master_awburst ;
  // value method mem_master_m_awlock
  assign mem_master_awlock = near_mem$mem_master_awlock ;
  // value method mem_master_m_awcache
  assign mem_master_awcache = near_mem$mem_master_awcache ;
  // value method mem_master_m_awprot
  assign mem_master_awprot = near_mem$mem_master_awprot ;
  // value method mem_master_m_awqos
  assign mem_master_awqos = near_mem$mem_master_awqos ;
  // value method mem_master_m_awregion
  assign mem_master_awregion = near_mem$mem_master_awregion ;
  // action method mem_master_m_awready
  assign CAN_FIRE_mem_master_m_awready = 1'd1 ;
  assign WILL_FIRE_mem_master_m_awready = 1'd1 ;
  // value method mem_master_m_wvalid
  assign mem_master_wvalid = near_mem$mem_master_wvalid ;
  // value method mem_master_m_wdata
  assign mem_master_wdata = near_mem$mem_master_wdata ;
  // value method mem_master_m_wstrb
  assign mem_master_wstrb = near_mem$mem_master_wstrb ;
  // value method mem_master_m_wlast
  assign mem_master_wlast = near_mem$mem_master_wlast ;
  // action method mem_master_m_wready
  assign CAN_FIRE_mem_master_m_wready = 1'd1 ;
  assign WILL_FIRE_mem_master_m_wready = 1'd1 ;
  // action method mem_master_m_bvalid
  assign CAN_FIRE_mem_master_m_bvalid = 1'd1 ;
  assign WILL_FIRE_mem_master_m_bvalid = 1'd1 ;
  // value method mem_master_m_bready
  assign mem_master_bready = near_mem$mem_master_bready ;
  // value method mem_master_m_arvalid
  assign mem_master_arvalid = near_mem$mem_master_arvalid ;
  // value method mem_master_m_arid
  assign mem_master_arid = near_mem$mem_master_arid ;
  // value method mem_master_m_araddr
  assign mem_master_araddr = near_mem$mem_master_araddr ;
  // value method mem_master_m_arlen
  assign mem_master_arlen = near_mem$mem_master_arlen ;
  // value method mem_master_m_arsize
  assign mem_master_arsize = near_mem$mem_master_arsize ;
  // value method mem_master_m_arburst
  assign mem_master_arburst = near_mem$mem_master_arburst ;
  // value method mem_master_m_arlock
  assign mem_master_arlock = near_mem$mem_master_arlock ;
  // value method mem_master_m_arcache
  assign mem_master_arcache = near_mem$mem_master_arcache ;
  // value method mem_master_m_arprot
  assign mem_master_arprot = near_mem$mem_master_arprot ;
  // value method mem_master_m_arqos
  assign mem_master_arqos = near_mem$mem_master_arqos ;
  // value method mem_master_m_arregion
  assign mem_master_arregion = near_mem$mem_master_arregion ;
  // action method mem_master_m_arready
  assign CAN_FIRE_mem_master_m_arready = 1'd1 ;
  assign WILL_FIRE_mem_master_m_arready = 1'd1 ;
  // action method mem_master_m_rvalid
  assign CAN_FIRE_mem_master_m_rvalid = 1'd1 ;
  assign WILL_FIRE_mem_master_m_rvalid = 1'd1 ;
  // value method mem_master_m_rready
  assign mem_master_rready = near_mem$mem_master_rready ;
  // action method dma_server_m_awvalid
  assign CAN_FIRE_dma_server_m_awvalid = 1'd1 ;
  assign WILL_FIRE_dma_server_m_awvalid = 1'd1 ;
  // value method dma_server_m_awready
  assign dma_server_awready = near_mem$dma_server_awready ;
  // action method dma_server_m_wvalid
  assign CAN_FIRE_dma_server_m_wvalid = 1'd1 ;
  assign WILL_FIRE_dma_server_m_wvalid = 1'd1 ;
  // value method dma_server_m_wready
  assign dma_server_wready = near_mem$dma_server_wready ;
  // value method dma_server_m_bvalid
  assign dma_server_bvalid = near_mem$dma_server_bvalid ;
  // value method dma_server_m_bid
  assign dma_server_bid = near_mem$dma_server_bid ;
  // value method dma_server_m_bresp
  assign dma_server_bresp = near_mem$dma_server_bresp ;
  // action method dma_server_m_bready
  assign CAN_FIRE_dma_server_m_bready = 1'd1 ;
  assign WILL_FIRE_dma_server_m_bready = 1'd1 ;
  // action method dma_server_m_arvalid
  assign CAN_FIRE_dma_server_m_arvalid = 1'd1 ;
  assign WILL_FIRE_dma_server_m_arvalid = 1'd1 ;
  // value method dma_server_m_arready
  assign dma_server_arready = near_mem$dma_server_arready ;
  // value method dma_server_m_rvalid
  assign dma_server_rvalid = near_mem$dma_server_rvalid ;
  // value method dma_server_m_rid
  assign dma_server_rid = near_mem$dma_server_rid ;
  // value method dma_server_m_rdata
  assign dma_server_rdata = near_mem$dma_server_rdata ;
  // value method dma_server_m_rresp
  assign dma_server_rresp = near_mem$dma_server_rresp ;
  // value method dma_server_m_rlast
  assign dma_server_rlast = near_mem$dma_server_rlast ;
  // action method dma_server_m_rready
  assign CAN_FIRE_dma_server_m_rready = 1'd1 ;
  assign WILL_FIRE_dma_server_m_rready = 1'd1 ;
  // action method m_external_interrupt_req
  assign CAN_FIRE_m_external_interrupt_req = 1'd1 ;
  assign WILL_FIRE_m_external_interrupt_req = 1'd1 ;
  // action method s_external_interrupt_req
  assign CAN_FIRE_s_external_interrupt_req = 1'd1 ;
  assign WILL_FIRE_s_external_interrupt_req = 1'd1 ;
  // action method software_interrupt_req
  assign CAN_FIRE_software_interrupt_req = 1'd1 ;
  assign WILL_FIRE_software_interrupt_req = 1'd1 ;
  // action method timer_interrupt_req
  assign CAN_FIRE_timer_interrupt_req = 1'd1 ;
  assign WILL_FIRE_timer_interrupt_req = 1'd1 ;
  // action method nmi_req
  assign CAN_FIRE_nmi_req = 1'd1 ;
  assign WILL_FIRE_nmi_req = 1'd1 ;
  // action method set_verbosity
  assign RDY_set_verbosity = 1'd1 ;
  assign CAN_FIRE_set_verbosity = 1'd1 ;
  assign WILL_FIRE_set_verbosity = EN_set_verbosity ;
  // action method set_watch_tohost
  assign RDY_set_watch_tohost = 1'd1 ;
  assign CAN_FIRE_set_watch_tohost = 1'd1 ;
  assign WILL_FIRE_set_watch_tohost = EN_set_watch_tohost ;
  // value method mv_tohost_value
  assign mv_tohost_value = near_mem$mv_tohost_value ;
  assign RDY_mv_tohost_value = 1'd1 ;
  // action method ma_ddr4_ready
  assign RDY_ma_ddr4_ready = 1'd1 ;
  assign CAN_FIRE_ma_ddr4_ready = 1'd1 ;
  assign WILL_FIRE_ma_ddr4_ready = EN_ma_ddr4_ready ;
  // value method mv_status
  assign mv_status = near_mem$mv_status ;
  // submodule csr_regfile
  mkCSR_RegFile csr_regfile(.CLK(CLK),
			    .RST_N(RST_N),
			    .access_permitted_1_csr_addr(csr_regfile$access_permitted_1_csr_addr),
			    .access_permitted_1_priv(csr_regfile$access_permitted_1_priv),
			    .access_permitted_1_read_not_write(csr_regfile$access_permitted_1_read_not_write),
			    .access_permitted_2_csr_addr(csr_regfile$access_permitted_2_csr_addr),
			    .access_permitted_2_priv(csr_regfile$access_permitted_2_priv),
			    .access_permitted_2_read_not_write(csr_regfile$access_permitted_2_read_not_write),
			    .csr_counter_read_fault_csr_addr(csr_regfile$csr_counter_read_fault_csr_addr),
			    .csr_counter_read_fault_priv(csr_regfile$csr_counter_read_fault_priv),
			    .csr_ret_actions_from_priv(csr_regfile$csr_ret_actions_from_priv),
			    .csr_trap_actions_exc_code(csr_regfile$csr_trap_actions_exc_code),
			    .csr_trap_actions_from_priv(csr_regfile$csr_trap_actions_from_priv),
			    .csr_trap_actions_interrupt(csr_regfile$csr_trap_actions_interrupt),
			    .csr_trap_actions_nmi(csr_regfile$csr_trap_actions_nmi),
			    .csr_trap_actions_pc(csr_regfile$csr_trap_actions_pc),
			    .csr_trap_actions_xtval(csr_regfile$csr_trap_actions_xtval),
			    .interrupt_pending_cur_priv(csr_regfile$interrupt_pending_cur_priv),
			    .m_external_interrupt_req_set_not_clear(csr_regfile$m_external_interrupt_req_set_not_clear),
			    .mav_csr_write_csr_addr(csr_regfile$mav_csr_write_csr_addr),
			    .mav_csr_write_word(csr_regfile$mav_csr_write_word),
			    .mav_read_csr_csr_addr(csr_regfile$mav_read_csr_csr_addr),
			    .nmi_req_set_not_clear(csr_regfile$nmi_req_set_not_clear),
			    .read_csr_csr_addr(csr_regfile$read_csr_csr_addr),
			    .read_csr_port2_csr_addr(csr_regfile$read_csr_port2_csr_addr),
			    .s_external_interrupt_req_set_not_clear(csr_regfile$s_external_interrupt_req_set_not_clear),
			    .software_interrupt_req_set_not_clear(csr_regfile$software_interrupt_req_set_not_clear),
			    .timer_interrupt_req_set_not_clear(csr_regfile$timer_interrupt_req_set_not_clear),
			    .EN_server_reset_request_put(csr_regfile$EN_server_reset_request_put),
			    .EN_server_reset_response_get(csr_regfile$EN_server_reset_response_get),
			    .EN_mav_read_csr(csr_regfile$EN_mav_read_csr),
			    .EN_mav_csr_write(csr_regfile$EN_mav_csr_write),
			    .EN_csr_trap_actions(csr_regfile$EN_csr_trap_actions),
			    .EN_csr_ret_actions(csr_regfile$EN_csr_ret_actions),
			    .EN_csr_minstret_incr(csr_regfile$EN_csr_minstret_incr),
			    .EN_debug(csr_regfile$EN_debug),
			    .RDY_server_reset_request_put(csr_regfile$RDY_server_reset_request_put),
			    .RDY_server_reset_response_get(csr_regfile$RDY_server_reset_response_get),
			    .read_csr(csr_regfile$read_csr),
			    .read_csr_port2(),
			    .mav_read_csr(),
			    .mav_csr_write(),
			    .read_misa(csr_regfile$read_misa),
			    .read_mstatus(csr_regfile$read_mstatus),
			    .read_ustatus(),
			    .read_satp(csr_regfile$read_satp),
			    .csr_trap_actions(csr_regfile$csr_trap_actions),
			    .RDY_csr_trap_actions(),
			    .csr_ret_actions(csr_regfile$csr_ret_actions),
			    .RDY_csr_ret_actions(),
			    .read_csr_minstret(csr_regfile$read_csr_minstret),
			    .read_csr_mcycle(csr_regfile$read_csr_mcycle),
			    .read_csr_mtime(),
			    .access_permitted_1(csr_regfile$access_permitted_1),
			    .access_permitted_2(csr_regfile$access_permitted_2),
			    .csr_counter_read_fault(),
			    .csr_mip_read(),
			    .interrupt_pending(csr_regfile$interrupt_pending),
			    .wfi_resume(csr_regfile$wfi_resume),
			    .nmi_pending(csr_regfile$nmi_pending),
			    .RDY_debug());
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
  // submodule gpr_regfile
  mkGPR_RegFile gpr_regfile(.CLK(CLK),
			    .RST_N(RST_N),
			    .read_rs1_port2_rs1(gpr_regfile$read_rs1_port2_rs1),
			    .read_rs1_rs1(gpr_regfile$read_rs1_rs1),
			    .read_rs2_rs2(gpr_regfile$read_rs2_rs2),
			    .write_rd_rd(gpr_regfile$write_rd_rd),
			    .write_rd_rd_val(gpr_regfile$write_rd_rd_val),
			    .EN_server_reset_request_put(gpr_regfile$EN_server_reset_request_put),
			    .EN_server_reset_response_get(gpr_regfile$EN_server_reset_response_get),
			    .EN_write_rd(gpr_regfile$EN_write_rd),
			    .RDY_server_reset_request_put(gpr_regfile$RDY_server_reset_request_put),
			    .RDY_server_reset_response_get(gpr_regfile$RDY_server_reset_response_get),
			    .read_rs1(gpr_regfile$read_rs1),
			    .read_rs1_port2(),
			    .read_rs2(gpr_regfile$read_rs2));
  // submodule near_mem
  mkNear_Mem near_mem(.CLK(CLK),
		      .RST_N(RST_N),
		      .dma_server_araddr(near_mem$dma_server_araddr),
		      .dma_server_arburst(near_mem$dma_server_arburst),
		      .dma_server_arcache(near_mem$dma_server_arcache),
		      .dma_server_arid(near_mem$dma_server_arid),
		      .dma_server_arlen(near_mem$dma_server_arlen),
		      .dma_server_arlock(near_mem$dma_server_arlock),
		      .dma_server_arprot(near_mem$dma_server_arprot),
		      .dma_server_arqos(near_mem$dma_server_arqos),
		      .dma_server_arregion(near_mem$dma_server_arregion),
		      .dma_server_arsize(near_mem$dma_server_arsize),
		      .dma_server_arvalid(near_mem$dma_server_arvalid),
		      .dma_server_awaddr(near_mem$dma_server_awaddr),
		      .dma_server_awburst(near_mem$dma_server_awburst),
		      .dma_server_awcache(near_mem$dma_server_awcache),
		      .dma_server_awid(near_mem$dma_server_awid),
		      .dma_server_awlen(near_mem$dma_server_awlen),
		      .dma_server_awlock(near_mem$dma_server_awlock),
		      .dma_server_awprot(near_mem$dma_server_awprot),
		      .dma_server_awqos(near_mem$dma_server_awqos),
		      .dma_server_awregion(near_mem$dma_server_awregion),
		      .dma_server_awsize(near_mem$dma_server_awsize),
		      .dma_server_awvalid(near_mem$dma_server_awvalid),
		      .dma_server_bready(near_mem$dma_server_bready),
		      .dma_server_rready(near_mem$dma_server_rready),
		      .dma_server_wdata(near_mem$dma_server_wdata),
		      .dma_server_wlast(near_mem$dma_server_wlast),
		      .dma_server_wstrb(near_mem$dma_server_wstrb),
		      .dma_server_wvalid(near_mem$dma_server_wvalid),
		      .dmem_req_addr(near_mem$dmem_req_addr),
		      .dmem_req_f3(near_mem$dmem_req_f3),
		      .dmem_req_mstatus_MXR(near_mem$dmem_req_mstatus_MXR),
		      .dmem_req_op(near_mem$dmem_req_op),
		      .dmem_req_priv(near_mem$dmem_req_priv),
		      .dmem_req_satp(near_mem$dmem_req_satp),
		      .dmem_req_sstatus_SUM(near_mem$dmem_req_sstatus_SUM),
		      .dmem_req_store_value(near_mem$dmem_req_store_value),
		      .imem_master_arready(near_mem$imem_master_arready),
		      .imem_master_awready(near_mem$imem_master_awready),
		      .imem_master_bid(near_mem$imem_master_bid),
		      .imem_master_bresp(near_mem$imem_master_bresp),
		      .imem_master_bvalid(near_mem$imem_master_bvalid),
		      .imem_master_rdata(near_mem$imem_master_rdata),
		      .imem_master_rid(near_mem$imem_master_rid),
		      .imem_master_rlast(near_mem$imem_master_rlast),
		      .imem_master_rresp(near_mem$imem_master_rresp),
		      .imem_master_rvalid(near_mem$imem_master_rvalid),
		      .imem_master_wready(near_mem$imem_master_wready),
		      .imem_req_addr(near_mem$imem_req_addr),
		      .imem_req_f3(near_mem$imem_req_f3),
		      .imem_req_mstatus_MXR(near_mem$imem_req_mstatus_MXR),
		      .imem_req_priv(near_mem$imem_req_priv),
		      .imem_req_satp(near_mem$imem_req_satp),
		      .imem_req_sstatus_SUM(near_mem$imem_req_sstatus_SUM),
		      .mem_master_arready(near_mem$mem_master_arready),
		      .mem_master_awready(near_mem$mem_master_awready),
		      .mem_master_bid(near_mem$mem_master_bid),
		      .mem_master_bresp(near_mem$mem_master_bresp),
		      .mem_master_bvalid(near_mem$mem_master_bvalid),
		      .mem_master_rdata(near_mem$mem_master_rdata),
		      .mem_master_rid(near_mem$mem_master_rid),
		      .mem_master_rlast(near_mem$mem_master_rlast),
		      .mem_master_rresp(near_mem$mem_master_rresp),
		      .mem_master_rvalid(near_mem$mem_master_rvalid),
		      .mem_master_wready(near_mem$mem_master_wready),
		      .server_fence_request_put(near_mem$server_fence_request_put),
		      .set_watch_tohost_tohost_addr(near_mem$set_watch_tohost_tohost_addr),
		      .set_watch_tohost_watch_tohost(near_mem$set_watch_tohost_watch_tohost),
		      .EN_server_reset_request_put(near_mem$EN_server_reset_request_put),
		      .EN_server_reset_response_get(near_mem$EN_server_reset_response_get),
		      .EN_imem_req(near_mem$EN_imem_req),
		      .EN_dmem_req(near_mem$EN_dmem_req),
		      .EN_server_fence_i_request_put(near_mem$EN_server_fence_i_request_put),
		      .EN_server_fence_i_response_get(near_mem$EN_server_fence_i_response_get),
		      .EN_server_fence_request_put(near_mem$EN_server_fence_request_put),
		      .EN_server_fence_response_get(near_mem$EN_server_fence_response_get),
		      .EN_set_watch_tohost(near_mem$EN_set_watch_tohost),
		      .EN_ma_ddr4_ready(near_mem$EN_ma_ddr4_ready),
		      .RDY_server_reset_request_put(near_mem$RDY_server_reset_request_put),
		      .RDY_server_reset_response_get(near_mem$RDY_server_reset_response_get),
		      .imem_valid(near_mem$imem_valid),
		      .imem_is_i32_not_i16(near_mem$imem_is_i32_not_i16),
		      .imem_pc(near_mem$imem_pc),
		      .imem_instr(near_mem$imem_instr),
		      .imem_exc(near_mem$imem_exc),
		      .imem_exc_code(near_mem$imem_exc_code),
		      .imem_tval(),
		      .imem_master_awvalid(near_mem$imem_master_awvalid),
		      .imem_master_awid(near_mem$imem_master_awid),
		      .imem_master_awaddr(near_mem$imem_master_awaddr),
		      .imem_master_awlen(near_mem$imem_master_awlen),
		      .imem_master_awsize(near_mem$imem_master_awsize),
		      .imem_master_awburst(near_mem$imem_master_awburst),
		      .imem_master_awlock(near_mem$imem_master_awlock),
		      .imem_master_awcache(near_mem$imem_master_awcache),
		      .imem_master_awprot(near_mem$imem_master_awprot),
		      .imem_master_awqos(near_mem$imem_master_awqos),
		      .imem_master_awregion(near_mem$imem_master_awregion),
		      .imem_master_wvalid(near_mem$imem_master_wvalid),
		      .imem_master_wdata(near_mem$imem_master_wdata),
		      .imem_master_wstrb(near_mem$imem_master_wstrb),
		      .imem_master_wlast(near_mem$imem_master_wlast),
		      .imem_master_bready(near_mem$imem_master_bready),
		      .imem_master_arvalid(near_mem$imem_master_arvalid),
		      .imem_master_arid(near_mem$imem_master_arid),
		      .imem_master_araddr(near_mem$imem_master_araddr),
		      .imem_master_arlen(near_mem$imem_master_arlen),
		      .imem_master_arsize(near_mem$imem_master_arsize),
		      .imem_master_arburst(near_mem$imem_master_arburst),
		      .imem_master_arlock(near_mem$imem_master_arlock),
		      .imem_master_arcache(near_mem$imem_master_arcache),
		      .imem_master_arprot(near_mem$imem_master_arprot),
		      .imem_master_arqos(near_mem$imem_master_arqos),
		      .imem_master_arregion(near_mem$imem_master_arregion),
		      .imem_master_rready(near_mem$imem_master_rready),
		      .dmem_valid(near_mem$dmem_valid),
		      .dmem_word64(near_mem$dmem_word64),
		      .dmem_st_amo_val(),
		      .dmem_exc(near_mem$dmem_exc),
		      .dmem_exc_code(near_mem$dmem_exc_code),
		      .mem_master_awvalid(near_mem$mem_master_awvalid),
		      .mem_master_awid(near_mem$mem_master_awid),
		      .mem_master_awaddr(near_mem$mem_master_awaddr),
		      .mem_master_awlen(near_mem$mem_master_awlen),
		      .mem_master_awsize(near_mem$mem_master_awsize),
		      .mem_master_awburst(near_mem$mem_master_awburst),
		      .mem_master_awlock(near_mem$mem_master_awlock),
		      .mem_master_awcache(near_mem$mem_master_awcache),
		      .mem_master_awprot(near_mem$mem_master_awprot),
		      .mem_master_awqos(near_mem$mem_master_awqos),
		      .mem_master_awregion(near_mem$mem_master_awregion),
		      .mem_master_wvalid(near_mem$mem_master_wvalid),
		      .mem_master_wdata(near_mem$mem_master_wdata),
		      .mem_master_wstrb(near_mem$mem_master_wstrb),
		      .mem_master_wlast(near_mem$mem_master_wlast),
		      .mem_master_bready(near_mem$mem_master_bready),
		      .mem_master_arvalid(near_mem$mem_master_arvalid),
		      .mem_master_arid(near_mem$mem_master_arid),
		      .mem_master_araddr(near_mem$mem_master_araddr),
		      .mem_master_arlen(near_mem$mem_master_arlen),
		      .mem_master_arsize(near_mem$mem_master_arsize),
		      .mem_master_arburst(near_mem$mem_master_arburst),
		      .mem_master_arlock(near_mem$mem_master_arlock),
		      .mem_master_arcache(near_mem$mem_master_arcache),
		      .mem_master_arprot(near_mem$mem_master_arprot),
		      .mem_master_arqos(near_mem$mem_master_arqos),
		      .mem_master_arregion(near_mem$mem_master_arregion),
		      .mem_master_rready(near_mem$mem_master_rready),
		      .RDY_server_fence_i_request_put(near_mem$RDY_server_fence_i_request_put),
		      .RDY_server_fence_i_response_get(near_mem$RDY_server_fence_i_response_get),
		      .RDY_server_fence_request_put(near_mem$RDY_server_fence_request_put),
		      .RDY_server_fence_response_get(near_mem$RDY_server_fence_response_get),
		      .dma_server_awready(near_mem$dma_server_awready),
		      .dma_server_wready(near_mem$dma_server_wready),
		      .dma_server_bvalid(near_mem$dma_server_bvalid),
		      .dma_server_bid(near_mem$dma_server_bid),
		      .dma_server_bresp(near_mem$dma_server_bresp),
		      .dma_server_arready(near_mem$dma_server_arready),
		      .dma_server_rvalid(near_mem$dma_server_rvalid),
		      .dma_server_rid(near_mem$dma_server_rid),
		      .dma_server_rdata(near_mem$dma_server_rdata),
		      .dma_server_rresp(near_mem$dma_server_rresp),
		      .dma_server_rlast(near_mem$dma_server_rlast),
		      .RDY_set_watch_tohost(),
		      .mv_tohost_value(near_mem$mv_tohost_value),
		      .RDY_mv_tohost_value(),
		      .RDY_ma_ddr4_ready(),
		      .mv_status(near_mem$mv_status));
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
		    .m_pc_reset_value(soc_map$m_pc_reset_value),
		    .m_mtvec_reset_value(),
		    .m_nmivec_reset_value());
  // submodule stage1_f_reset_reqs
  FIFO20 #(.guarded(32'd1)) stage1_f_reset_reqs(.RST(RST_N),
						.CLK(CLK),
						.ENQ(stage1_f_reset_reqs$ENQ),
						.DEQ(stage1_f_reset_reqs$DEQ),
						.CLR(stage1_f_reset_reqs$CLR),
						.FULL_N(stage1_f_reset_reqs$FULL_N),
						.EMPTY_N(stage1_f_reset_reqs$EMPTY_N));
  // submodule stage1_f_reset_rsps
  FIFO20 #(.guarded(32'd1)) stage1_f_reset_rsps(.RST(RST_N),
						.CLK(CLK),
						.ENQ(stage1_f_reset_rsps$ENQ),
						.DEQ(stage1_f_reset_rsps$DEQ),
						.CLR(stage1_f_reset_rsps$CLR),
						.FULL_N(stage1_f_reset_rsps$FULL_N),
						.EMPTY_N(stage1_f_reset_rsps$EMPTY_N));
  // submodule stage2_f_reset_reqs
  FIFO20 #(.guarded(32'd1)) stage2_f_reset_reqs(.RST(RST_N),
						.CLK(CLK),
						.ENQ(stage2_f_reset_reqs$ENQ),
						.DEQ(stage2_f_reset_reqs$DEQ),
						.CLR(stage2_f_reset_reqs$CLR),
						.FULL_N(stage2_f_reset_reqs$FULL_N),
						.EMPTY_N(stage2_f_reset_reqs$EMPTY_N));
  // submodule stage2_f_reset_rsps
  FIFO20 #(.guarded(32'd1)) stage2_f_reset_rsps(.RST(RST_N),
						.CLK(CLK),
						.ENQ(stage2_f_reset_rsps$ENQ),
						.DEQ(stage2_f_reset_rsps$DEQ),
						.CLR(stage2_f_reset_rsps$CLR),
						.FULL_N(stage2_f_reset_rsps$FULL_N),
						.EMPTY_N(stage2_f_reset_rsps$EMPTY_N));
  // submodule stage3_f_reset_reqs
  FIFO20 #(.guarded(32'd1)) stage3_f_reset_reqs(.RST(RST_N),
						.CLK(CLK),
						.ENQ(stage3_f_reset_reqs$ENQ),
						.DEQ(stage3_f_reset_reqs$DEQ),
						.CLR(stage3_f_reset_reqs$CLR),
						.FULL_N(stage3_f_reset_reqs$FULL_N),
						.EMPTY_N(stage3_f_reset_reqs$EMPTY_N));
  // submodule stage3_f_reset_rsps
  FIFO20 #(.guarded(32'd1)) stage3_f_reset_rsps(.RST(RST_N),
						.CLK(CLK),
						.ENQ(stage3_f_reset_rsps$ENQ),
						.DEQ(stage3_f_reset_rsps$DEQ),
						.CLR(stage3_f_reset_rsps$CLR),
						.FULL_N(stage3_f_reset_rsps$FULL_N),
						.EMPTY_N(stage3_f_reset_rsps$EMPTY_N));
  // submodule stageD_f_reset_reqs
  FIFO20 #(.guarded(32'd1)) stageD_f_reset_reqs(.RST(RST_N),
						.CLK(CLK),
						.ENQ(stageD_f_reset_reqs$ENQ),
						.DEQ(stageD_f_reset_reqs$DEQ),
						.CLR(stageD_f_reset_reqs$CLR),
						.FULL_N(stageD_f_reset_reqs$FULL_N),
						.EMPTY_N(stageD_f_reset_reqs$EMPTY_N));
  // submodule stageD_f_reset_rsps
  FIFO20 #(.guarded(32'd1)) stageD_f_reset_rsps(.RST(RST_N),
						.CLK(CLK),
						.ENQ(stageD_f_reset_rsps$ENQ),
						.DEQ(stageD_f_reset_rsps$DEQ),
						.CLR(stageD_f_reset_rsps$CLR),
						.FULL_N(stageD_f_reset_rsps$FULL_N),
						.EMPTY_N(stageD_f_reset_rsps$EMPTY_N));
  // submodule stageF_branch_predictor
  mkBranch_Predictor stageF_branch_predictor(.CLK(CLK),
					     .RST_N(RST_N),
					     .bp_train_cf_info(stageF_branch_predictor$bp_train_cf_info),
					     .bp_train_instr(stageF_branch_predictor$bp_train_instr),
					     .bp_train_is_i32_not_i16(stageF_branch_predictor$bp_train_is_i32_not_i16),
					     .bp_train_pc(stageF_branch_predictor$bp_train_pc),
					     .predict_req_pc(stageF_branch_predictor$predict_req_pc),
					     .predict_rsp_instr(stageF_branch_predictor$predict_rsp_instr),
					     .predict_rsp_is_i32_not_i16(stageF_branch_predictor$predict_rsp_is_i32_not_i16),
					     .EN_reset(stageF_branch_predictor$EN_reset),
					     .EN_predict_req(stageF_branch_predictor$EN_predict_req),
					     .EN_bp_train(stageF_branch_predictor$EN_bp_train),
					     .RDY_reset(),
					     .RDY_predict_req(stageF_branch_predictor$RDY_predict_req),
					     .predict_rsp(stageF_branch_predictor$predict_rsp),
					     .RDY_bp_train());
  // submodule stageF_f_reset_reqs
  FIFO20 #(.guarded(32'd1)) stageF_f_reset_reqs(.RST(RST_N),
						.CLK(CLK),
						.ENQ(stageF_f_reset_reqs$ENQ),
						.DEQ(stageF_f_reset_reqs$DEQ),
						.CLR(stageF_f_reset_reqs$CLR),
						.FULL_N(stageF_f_reset_reqs$FULL_N),
						.EMPTY_N(stageF_f_reset_reqs$EMPTY_N));
  // submodule stageF_f_reset_rsps
  FIFO20 #(.guarded(32'd1)) stageF_f_reset_rsps(.RST(RST_N),
						.CLK(CLK),
						.ENQ(stageF_f_reset_rsps$ENQ),
						.DEQ(stageF_f_reset_rsps$DEQ),
						.CLR(stageF_f_reset_rsps$CLR),
						.FULL_N(stageF_f_reset_rsps$FULL_N),
						.EMPTY_N(stageF_f_reset_rsps$EMPTY_N));
  // rule RL_rl_show_pipe
  assign CAN_FIRE_RL_rl_show_pipe =
	     NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 &&
	     rg_state != 4'd0 &&
	     rg_state != 4'd1 &&
	     rg_state != 4'd12 ;
  assign WILL_FIRE_RL_rl_show_pipe = CAN_FIRE_RL_rl_show_pipe ;
  // rule RL_rl_stage2_nonpipe
  assign CAN_FIRE_RL_rl_stage2_nonpipe =
	     rg_state == 4'd3 && !stage3_rg_full &&
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 ==
	     2'd3 ;
  assign WILL_FIRE_RL_rl_stage2_nonpipe = CAN_FIRE_RL_rl_stage2_nonpipe ;
  // rule RL_rl_stage1_trap
  assign CAN_FIRE_RL_rl_stage1_trap =
	     rg_state_3_EQ_3_327_AND_NOT_csr_regfile_interr_ETC___d1524 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	     4'd12 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125) ;
  assign WILL_FIRE_RL_rl_stage1_trap = CAN_FIRE_RL_rl_stage1_trap ;
  // rule RL_rl_trap
  assign CAN_FIRE_RL_rl_trap =
	     rg_state == 4'd4 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125) ;
  assign WILL_FIRE_RL_rl_trap = CAN_FIRE_RL_rl_trap ;
  // rule RL_rl_stage1_CSRR_W
  assign CAN_FIRE_RL_rl_stage1_CSRR_W = MUX_rg_state$write_1__SEL_10 ;
  assign WILL_FIRE_RL_rl_stage1_CSRR_W = MUX_rg_state$write_1__SEL_10 ;
  // rule RL_rl_stage1_CSRR_W_2
  assign CAN_FIRE_RL_rl_stage1_CSRR_W_2 = rg_state == 4'd6 ;
  assign WILL_FIRE_RL_rl_stage1_CSRR_W_2 = rg_state == 4'd6 ;
  // rule RL_rl_stage1_CSRR_S_or_C
  assign CAN_FIRE_RL_rl_stage1_CSRR_S_or_C =
	     rg_state_3_EQ_3_327_AND_NOT_csr_regfile_interr_ETC___d1524 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	     4'd4 ;
  assign WILL_FIRE_RL_rl_stage1_CSRR_S_or_C =
	     CAN_FIRE_RL_rl_stage1_CSRR_S_or_C ;
  // rule RL_rl_stage1_CSRR_S_or_C_2
  assign CAN_FIRE_RL_rl_stage1_CSRR_S_or_C_2 = rg_state == 4'd7 ;
  assign WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 = rg_state == 4'd7 ;
  // rule RL_rl_stage1_restart_after_csrrx
  assign CAN_FIRE_RL_rl_stage1_restart_after_csrrx =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1254 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state_3_EQ_8_606_AND_NOT_stageF_rg_full_100_ETC___d1607 ;
  assign WILL_FIRE_RL_rl_stage1_restart_after_csrrx =
	     CAN_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // rule RL_rl_stage1_xRET
  assign CAN_FIRE_RL_rl_stage1_xRET =
	     rg_state_3_EQ_3_327_AND_NOT_csr_regfile_interr_ETC___d1524 &&
	     (IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	      4'd8 ||
	      IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	      4'd9 ||
	      IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	      4'd10) &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125) ;
  assign WILL_FIRE_RL_rl_stage1_xRET = CAN_FIRE_RL_rl_stage1_xRET ;
  // rule RL_rl_stage1_FENCE_I
  assign CAN_FIRE_RL_rl_stage1_FENCE_I =
	     near_mem$RDY_server_fence_i_request_put &&
	     rg_state_3_EQ_3_327_AND_NOT_csr_regfile_interr_ETC___d1634 ;
  assign WILL_FIRE_RL_rl_stage1_FENCE_I = CAN_FIRE_RL_rl_stage1_FENCE_I ;
  // rule RL_rl_finish_FENCE_I
  assign CAN_FIRE_RL_rl_finish_FENCE_I =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1254 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     near_mem$RDY_server_fence_i_response_get &&
	     rg_state == 4'd9 ;
  assign WILL_FIRE_RL_rl_finish_FENCE_I = CAN_FIRE_RL_rl_finish_FENCE_I ;
  // rule RL_rl_stage1_FENCE
  assign CAN_FIRE_RL_rl_stage1_FENCE =
	     near_mem$RDY_server_fence_request_put &&
	     rg_state_3_EQ_3_327_AND_NOT_csr_regfile_interr_ETC___d1643 ;
  assign WILL_FIRE_RL_rl_stage1_FENCE = CAN_FIRE_RL_rl_stage1_FENCE ;
  // rule RL_rl_finish_FENCE
  assign CAN_FIRE_RL_rl_finish_FENCE =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1254 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     near_mem$RDY_server_fence_response_get &&
	     rg_state == 4'd10 ;
  assign WILL_FIRE_RL_rl_finish_FENCE = CAN_FIRE_RL_rl_finish_FENCE ;
  // rule RL_rl_stage1_WFI
  assign CAN_FIRE_RL_rl_stage1_WFI =
	     rg_state_3_EQ_3_327_AND_NOT_csr_regfile_interr_ETC___d1524 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	     4'd11 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125) ;
  assign WILL_FIRE_RL_rl_stage1_WFI = CAN_FIRE_RL_rl_stage1_WFI ;
  // rule RL_rl_WFI_resume
  assign CAN_FIRE_RL_rl_WFI_resume =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1254 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state_3_EQ_12_0_AND_csr_regfile_wfi_resume__ETC___d1654 ;
  assign WILL_FIRE_RL_rl_WFI_resume = CAN_FIRE_RL_rl_WFI_resume ;
  // rule RL_rl_reset_from_WFI
  assign CAN_FIRE_RL_rl_reset_from_WFI =
	     rg_state == 4'd12 && f_reset_reqs$EMPTY_N ;
  assign WILL_FIRE_RL_rl_reset_from_WFI = MUX_rg_state$write_1__SEL_5 ;
  // rule RL_rl_trap_fetch
  assign CAN_FIRE_RL_rl_trap_fetch =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1254 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state_3_EQ_5_658_AND_NOT_stageF_rg_full_100_ETC___d1659 ;
  assign WILL_FIRE_RL_rl_trap_fetch = CAN_FIRE_RL_rl_trap_fetch ;
  // rule RL_rl_stage1_interrupt
  assign CAN_FIRE_RL_rl_stage1_interrupt =
	     (csr_regfile$interrupt_pending[4] || csr_regfile$nmi_pending) &&
	     rg_state == 4'd3 &&
	     NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d1667 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125) ;
  assign WILL_FIRE_RL_rl_stage1_interrupt = CAN_FIRE_RL_rl_stage1_interrupt ;
  // rule RL_imem_rl_assert_fail
  assign CAN_FIRE_RL_imem_rl_assert_fail = !near_mem$imem_is_i32_not_i16 ;
  assign WILL_FIRE_RL_imem_rl_assert_fail = CAN_FIRE_RL_imem_rl_assert_fail ;
  // rule RL_rl_reset_complete
  assign CAN_FIRE_RL_rl_reset_complete =
	     gpr_regfile$RDY_server_reset_response_get &&
	     near_mem$RDY_server_reset_response_get &&
	     csr_regfile$RDY_server_reset_response_get &&
	     stageF_f_reset_rsps_i_notEmpty__244_AND_stageD_ETC___d1264 &&
	     rg_state == 4'd1 ;
  assign WILL_FIRE_RL_rl_reset_complete = MUX_rg_state$write_1__SEL_2 ;
  // rule RL_rl_pipe
  assign CAN_FIRE_RL_rl_pipe =
	     (IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1314 ||
	      NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1325) &&
	     rg_state_3_EQ_3_327_AND_stage3_rg_full_0_OR_NO_ETC___d1337 &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1347 ;
  assign WILL_FIRE_RL_rl_pipe =
	     CAN_FIRE_RL_rl_pipe && !WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  // rule RL_rl_reset_start
  assign CAN_FIRE_RL_rl_reset_start =
	     gpr_regfile$RDY_server_reset_request_put &&
	     near_mem$RDY_server_reset_request_put &&
	     csr_regfile_RDY_server_reset_request_put__224__ETC___d1236 &&
	     rg_state == 4'd0 ;
  assign WILL_FIRE_RL_rl_reset_start = CAN_FIRE_RL_rl_reset_start ;
  // rule RL_imem_rl_fetch_next_32b
  assign CAN_FIRE_RL_imem_rl_fetch_next_32b =
	     imem_rg_pc[1:0] != 2'b0 && near_mem$imem_valid &&
	     !near_mem$imem_exc &&
	     imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	     near_mem$imem_instr[17:16] == 2'b11 ;
  assign WILL_FIRE_RL_imem_rl_fetch_next_32b =
	     CAN_FIRE_RL_imem_rl_fetch_next_32b ;
  // rule RL_stage3_rl_reset
  assign CAN_FIRE_RL_stage3_rl_reset =
	     stage3_f_reset_reqs$EMPTY_N && stage3_f_reset_rsps$FULL_N ;
  assign WILL_FIRE_RL_stage3_rl_reset = CAN_FIRE_RL_stage3_rl_reset ;
  // rule RL_stage2_rl_reset_end
  assign CAN_FIRE_RL_stage2_rl_reset_end =
	     stage2_f_reset_rsps$FULL_N && stage2_rg_resetting ;
  assign WILL_FIRE_RL_stage2_rl_reset_end = CAN_FIRE_RL_stage2_rl_reset_end ;
  // rule RL_stage2_rl_reset_begin
  assign CAN_FIRE_RL_stage2_rl_reset_begin = stage2_f_reset_reqs$EMPTY_N ;
  assign WILL_FIRE_RL_stage2_rl_reset_begin = stage2_f_reset_reqs$EMPTY_N ;
  // rule RL_stage1_rl_reset
  assign CAN_FIRE_RL_stage1_rl_reset =
	     stage1_f_reset_reqs$EMPTY_N && stage1_f_reset_rsps$FULL_N ;
  assign WILL_FIRE_RL_stage1_rl_reset = CAN_FIRE_RL_stage1_rl_reset ;
  // rule RL_stageD_rl_reset
  assign CAN_FIRE_RL_stageD_rl_reset =
	     stageD_f_reset_reqs$EMPTY_N && stageD_f_reset_rsps$FULL_N ;
  assign WILL_FIRE_RL_stageD_rl_reset = CAN_FIRE_RL_stageD_rl_reset ;
  // rule RL_stageF_rl_reset
  assign CAN_FIRE_RL_stageF_rl_reset =
	     stageF_f_reset_reqs$EMPTY_N && stageF_f_reset_rsps$FULL_N ;
  assign WILL_FIRE_RL_stageF_rl_reset = CAN_FIRE_RL_stageF_rl_reset ;
  // inputs to muxes for submodule ports
  assign MUX_csr_regfile$mav_csr_write_1__SEL_1 =
	     WILL_FIRE_RL_rl_stage1_CSRR_W_2 &&
	     csr_regfile$access_permitted_1 ;
  assign MUX_gpr_regfile$write_rd_1__SEL_3 =
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	     csr_regfile$access_permitted_2 ;
  assign MUX_imem_rg_cache_addr$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ;
  assign MUX_imem_rg_cache_addr$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1473 ;
  assign MUX_rg_next_pc$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1410 ;
  assign MUX_rg_next_pc$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_stage1_WFI || WILL_FIRE_RL_rl_stage1_FENCE ||
	     WILL_FIRE_RL_rl_stage1_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W ;
  assign MUX_rg_state$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1461 ;
  assign MUX_rg_state$write_1__SEL_2 =
	     CAN_FIRE_RL_rl_reset_complete &&
	     !WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  assign MUX_rg_state$write_1__SEL_5 =
	     CAN_FIRE_RL_rl_reset_from_WFI && !WILL_FIRE_RL_rl_WFI_resume ;
  assign MUX_rg_state$write_1__SEL_7 =
	     WILL_FIRE_RL_rl_trap_fetch || WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  assign MUX_rg_state$write_1__SEL_8 =
	     WILL_FIRE_RL_rl_stage1_interrupt ||
	     WILL_FIRE_RL_rl_stage1_trap ||
	     WILL_FIRE_RL_rl_stage2_nonpipe ;
  assign MUX_rg_state$write_1__SEL_9 =
	     WILL_FIRE_RL_rl_stage1_xRET || WILL_FIRE_RL_rl_trap ;
  assign MUX_rg_state$write_1__SEL_10 =
	     rg_state_3_EQ_3_327_AND_NOT_csr_regfile_interr_ETC___d1524 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	     4'd3 ;
  assign MUX_rg_trap_info$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W ;
  assign MUX_rg_trap_instr$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_stage1_interrupt ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W ||
	     WILL_FIRE_RL_rl_stage1_trap ;
  assign MUX_rg_trap_interrupt$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W ||
	     WILL_FIRE_RL_rl_stage1_trap ||
	     WILL_FIRE_RL_rl_stage2_nonpipe ;
  always@(rg_trap_instr or
	  csr_regfile$read_csr or
	  y__h23037 or
	  IF_csr_regfile_read_csr_rg_trap_instr_545_BITS_ETC___d1598)
  begin
    case (rg_trap_instr[14:12])
      3'b010, 3'b110:
	  MUX_csr_regfile$mav_csr_write_2__VAL_2 =
	      IF_csr_regfile_read_csr_rg_trap_instr_545_BITS_ETC___d1598;
      default: MUX_csr_regfile$mav_csr_write_2__VAL_2 =
		   csr_regfile$read_csr[31:0] & y__h23037;
    endcase
  end
  assign MUX_imem_rg_cache_addr$write_1__VAL_1 =
	     (near_mem$imem_valid && !near_mem$imem_exc) ?
	       near_mem$imem_pc :
	       32'h00000001 ;
  assign MUX_imem_rg_cache_addr$write_1__VAL_2 =
	     near_mem$imem_exc ? 32'h00000001 : near_mem$imem_pc ;
  assign MUX_imem_rg_tval$write_1__VAL_1 =
	     (NOT_soc_map_m_pc_reset_value__270_BITS_1_TO_0__ETC___d1285 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h17506 :
	       soc_map$m_pc_reset_value[31:0] ;
  assign MUX_imem_rg_tval$write_1__VAL_2 =
	     (NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d1484 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h20531 :
	       stageF_branch_predictor$predict_rsp ;
  assign MUX_imem_rg_tval$write_1__VAL_3 =
	     (NOT_rg_next_pc_609_BITS_1_TO_0_610_EQ_0b0_611__ETC___d1617 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h28726 :
	       rg_next_pc ;
  assign MUX_imem_rg_tval$write_1__VAL_4 = near_mem$imem_pc + 32'd4 ;
  assign MUX_near_mem$imem_req_2__VAL_1 =
	     (NOT_soc_map_m_pc_reset_value__270_BITS_1_TO_0__ETC___d1285 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h17506 :
	       addr_of_b32__h17387 ;
  assign MUX_near_mem$imem_req_2__VAL_2 =
	     (NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d1484 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h20531 :
	       addr_of_b32__h20412 ;
  assign MUX_near_mem$imem_req_2__VAL_4 =
	     (NOT_rg_next_pc_609_BITS_1_TO_0_610_EQ_0b0_611__ETC___d1617 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h28726 :
	       addr_of_b32__h28607 ;
  assign MUX_rg_state$write_1__VAL_2 = rg_run_on_reset ? 4'd3 : 4'd2 ;
  assign MUX_rg_state$write_1__VAL_3 =
	     csr_regfile$access_permitted_1 ? 4'd8 : 4'd4 ;
  assign MUX_rg_state$write_1__VAL_4 =
	     csr_regfile$access_permitted_2 ? 4'd8 : 4'd4 ;
  assign MUX_rg_trap_info$write_1__VAL_1 =
	     { stage1_rg_stage_input[305:274], 4'd2, value__h9431 } ;
  assign MUX_rg_trap_info$write_1__VAL_2 =
	     { stage2_rg_stage2[166:135],
	       near_mem$dmem_exc_code,
	       stage2_rg_stage2[95:64] } ;
  assign MUX_rg_trap_info$write_1__VAL_3 =
	     { stage1_rg_stage_input[305:274],
	       stage1_rg_stage_input[268] ?
		 stage1_rg_stage_input[267:232] :
		 { alu_outputs_exc_code__h8498, trap_info_tval__h9386 } } ;
  assign MUX_rg_trap_info$write_1__VAL_4 =
	     { stage1_rg_stage_input[305:274], x_exc_code__h29000, 32'd0 } ;
  assign MUX_rg_trap_instr$write_1__VAL_1 = stage1_rg_stage_input[231:200] ;
  assign MUX_stage1_rg_full$write_1__VAL_2 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1413 &&
	     stageD_rg_full ||
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1501 ;
  assign MUX_stage2_rg_full$write_1__VAL_2 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1307 ?
	       IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	       4'd0 &&
	       IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d1378 :
	       IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 !=
	       2'd2 &&
	       IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 !=
	       2'd0 ;
  assign MUX_stageD_rg_full$write_1__VAL_2 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1454 ||
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1311 &&
	     stageD_rg_full ;
  assign MUX_stageF_rg_full$write_1__VAL_2 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1454 ?
	       csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1510 :
	       (IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1311 &&
		stageD_rg_full ||
		!near_mem$imem_valid ||
		NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1118) &&
	       stageF_rg_full ;
  // register cfg_logdelay
  assign cfg_logdelay$D_IN = set_verbosity_logdelay ;
  assign cfg_logdelay$EN = EN_set_verbosity ;
  // register cfg_verbosity
  assign cfg_verbosity$D_IN = set_verbosity_verbosity ;
  assign cfg_verbosity$EN = EN_set_verbosity ;
  // register imem_rg_cache_addr
  always@(MUX_imem_rg_cache_addr$write_1__SEL_1 or
	  MUX_imem_rg_cache_addr$write_1__VAL_1 or
	  MUX_imem_rg_cache_addr$write_1__SEL_2 or
	  MUX_imem_rg_cache_addr$write_1__VAL_2 or
	  WILL_FIRE_RL_imem_rl_fetch_next_32b or
	  near_mem$imem_pc or MUX_rg_state$write_1__SEL_7)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_cache_addr$write_1__SEL_1:
	  imem_rg_cache_addr$D_IN = MUX_imem_rg_cache_addr$write_1__VAL_1;
      MUX_imem_rg_cache_addr$write_1__SEL_2:
	  imem_rg_cache_addr$D_IN = MUX_imem_rg_cache_addr$write_1__VAL_2;
      WILL_FIRE_RL_imem_rl_fetch_next_32b:
	  imem_rg_cache_addr$D_IN = near_mem$imem_pc;
      MUX_rg_state$write_1__SEL_7:
	  imem_rg_cache_addr$D_IN = MUX_imem_rg_cache_addr$write_1__VAL_1;
      default: imem_rg_cache_addr$D_IN =
		   32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign imem_rg_cache_addr$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1473 ||
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // register imem_rg_cache_b16
  assign imem_rg_cache_b16$D_IN = near_mem$imem_instr[31:16] ;
  assign imem_rg_cache_b16$EN =
	     MUX_rg_state$write_1__SEL_7 && near_mem$imem_valid &&
	     !near_mem$imem_exc ||
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	     near_mem$imem_valid &&
	     !near_mem$imem_exc ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1454 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1475 ||
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  // register imem_rg_f3
  assign imem_rg_f3$D_IN = 3'b010 ;
  assign imem_rg_f3$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1473 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // register imem_rg_mstatus_MXR
  assign imem_rg_mstatus_MXR$D_IN = csr_regfile$read_mstatus[19] ;
  assign imem_rg_mstatus_MXR$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1473 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // register imem_rg_pc
  always@(MUX_imem_rg_cache_addr$write_1__SEL_1 or
	  soc_map$m_pc_reset_value or
	  MUX_imem_rg_cache_addr$write_1__SEL_2 or
	  stageF_branch_predictor$predict_rsp or
	  MUX_rg_state$write_1__SEL_7 or rg_next_pc)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_cache_addr$write_1__SEL_1:
	  imem_rg_pc$D_IN = soc_map$m_pc_reset_value[31:0];
      MUX_imem_rg_cache_addr$write_1__SEL_2:
	  imem_rg_pc$D_IN = stageF_branch_predictor$predict_rsp;
      MUX_rg_state$write_1__SEL_7: imem_rg_pc$D_IN = rg_next_pc;
      default: imem_rg_pc$D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign imem_rg_pc$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1473 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // register imem_rg_priv
  assign imem_rg_priv$D_IN = rg_cur_priv ;
  assign imem_rg_priv$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1473 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // register imem_rg_satp
  assign imem_rg_satp$D_IN = csr_regfile$read_satp ;
  assign imem_rg_satp$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1473 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // register imem_rg_sstatus_SUM
  assign imem_rg_sstatus_SUM$D_IN = 1'd0 ;
  assign imem_rg_sstatus_SUM$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1473 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // register imem_rg_tval
  always@(MUX_imem_rg_cache_addr$write_1__SEL_1 or
	  MUX_imem_rg_tval$write_1__VAL_1 or
	  MUX_imem_rg_cache_addr$write_1__SEL_2 or
	  MUX_imem_rg_tval$write_1__VAL_2 or
	  MUX_rg_state$write_1__SEL_7 or
	  MUX_imem_rg_tval$write_1__VAL_3 or
	  WILL_FIRE_RL_imem_rl_fetch_next_32b or
	  MUX_imem_rg_tval$write_1__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_cache_addr$write_1__SEL_1:
	  imem_rg_tval$D_IN = MUX_imem_rg_tval$write_1__VAL_1;
      MUX_imem_rg_cache_addr$write_1__SEL_2:
	  imem_rg_tval$D_IN = MUX_imem_rg_tval$write_1__VAL_2;
      MUX_rg_state$write_1__SEL_7:
	  imem_rg_tval$D_IN = MUX_imem_rg_tval$write_1__VAL_3;
      WILL_FIRE_RL_imem_rl_fetch_next_32b:
	  imem_rg_tval$D_IN = MUX_imem_rg_tval$write_1__VAL_4;
      default: imem_rg_tval$D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign imem_rg_tval$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1473 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ||
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  // register rg_csr_pc
  assign rg_csr_pc$D_IN = stage1_rg_stage_input[305:274] ;
  assign rg_csr_pc$EN = MUX_rg_trap_info$write_1__SEL_1 ;
  // register rg_csr_val1
  assign rg_csr_val1$D_IN = x_out_data_to_stage2_val1__h7930 ;
  assign rg_csr_val1$EN = MUX_rg_trap_info$write_1__SEL_1 ;
  // register rg_cur_priv
  always@(WILL_FIRE_RL_rl_trap or
	  csr_regfile$csr_trap_actions or
	  WILL_FIRE_RL_rl_stage1_xRET or
	  csr_regfile$csr_ret_actions or WILL_FIRE_RL_rl_reset_start)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_rl_trap:
	  rg_cur_priv$D_IN = csr_regfile$csr_trap_actions[1:0];
      WILL_FIRE_RL_rl_stage1_xRET:
	  rg_cur_priv$D_IN = csr_regfile$csr_ret_actions[33:32];
      WILL_FIRE_RL_rl_reset_start: rg_cur_priv$D_IN = 2'b11;
      default: rg_cur_priv$D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign rg_cur_priv$EN =
	     WILL_FIRE_RL_rl_trap || WILL_FIRE_RL_rl_stage1_xRET ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_epoch
  always@(MUX_imem_rg_cache_addr$write_1__SEL_1 or
	  new_epoch__h16901 or
	  MUX_rg_state$write_1__SEL_7 or WILL_FIRE_RL_rl_reset_start)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_cache_addr$write_1__SEL_1:
	  rg_epoch$D_IN = new_epoch__h16901;
      MUX_rg_state$write_1__SEL_7: rg_epoch$D_IN = new_epoch__h16901;
      WILL_FIRE_RL_rl_reset_start: rg_epoch$D_IN = 2'd0;
      default: rg_epoch$D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign rg_epoch$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_mstatus_MXR
  assign rg_mstatus_MXR$D_IN = csr_regfile$read_mstatus[19] ;
  assign rg_mstatus_MXR$EN = MUX_rg_state$write_1__SEL_9 ;
  // register rg_next_pc
  always@(MUX_rg_next_pc$write_1__SEL_1 or
	  x_out_next_pc__h7886 or
	  MUX_rg_next_pc$write_1__SEL_2 or
	  WILL_FIRE_RL_rl_trap or
	  csr_regfile$csr_trap_actions or
	  WILL_FIRE_RL_rl_stage1_xRET or csr_regfile$csr_ret_actions)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_rg_next_pc$write_1__SEL_1: rg_next_pc$D_IN = x_out_next_pc__h7886;
      MUX_rg_next_pc$write_1__SEL_2: rg_next_pc$D_IN = x_out_next_pc__h7886;
      WILL_FIRE_RL_rl_trap:
	  rg_next_pc$D_IN = csr_regfile$csr_trap_actions[97:66];
      WILL_FIRE_RL_rl_stage1_xRET:
	  rg_next_pc$D_IN = csr_regfile$csr_ret_actions[65:34];
      default: rg_next_pc$D_IN = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign rg_next_pc$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1410 ||
	     WILL_FIRE_RL_rl_stage1_WFI ||
	     WILL_FIRE_RL_rl_stage1_FENCE ||
	     WILL_FIRE_RL_rl_stage1_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W ||
	     WILL_FIRE_RL_rl_trap ||
	     WILL_FIRE_RL_rl_stage1_xRET ;
  // register rg_run_on_reset
  assign rg_run_on_reset$D_IN = f_reset_reqs$D_OUT ;
  assign rg_run_on_reset$EN = CAN_FIRE_RL_rl_reset_start ;
  // register rg_sstatus_SUM
  assign rg_sstatus_SUM$D_IN = 1'd0 ;
  assign rg_sstatus_SUM$EN = MUX_rg_state$write_1__SEL_9 ;
  // register rg_start_CPI_cycles
  assign rg_start_CPI_cycles$D_IN = csr_regfile$read_csr_mcycle ;
  assign rg_start_CPI_cycles$EN = MUX_imem_rg_cache_addr$write_1__SEL_1 ;
  // register rg_start_CPI_instrs
  assign rg_start_CPI_instrs$D_IN = csr_regfile$read_csr_minstret ;
  assign rg_start_CPI_instrs$EN = MUX_imem_rg_cache_addr$write_1__SEL_1 ;
  // register rg_state
  always@(WILL_FIRE_RL_rl_reset_complete or
	  MUX_rg_state$write_1__VAL_2 or
	  WILL_FIRE_RL_rl_stage1_CSRR_W_2 or
	  MUX_rg_state$write_1__VAL_3 or
	  WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 or
	  MUX_rg_state$write_1__VAL_4 or
	  WILL_FIRE_RL_rl_reset_from_WFI or
	  WILL_FIRE_RL_rl_reset_start or
	  MUX_rg_state$write_1__SEL_7 or
	  MUX_rg_state$write_1__SEL_8 or
	  MUX_rg_state$write_1__SEL_1 or
	  MUX_rg_state$write_1__SEL_9 or
	  WILL_FIRE_RL_rl_stage1_CSRR_W or
	  WILL_FIRE_RL_rl_stage1_CSRR_S_or_C or
	  WILL_FIRE_RL_rl_stage1_FENCE_I or
	  WILL_FIRE_RL_rl_stage1_FENCE or WILL_FIRE_RL_rl_stage1_WFI)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_rl_reset_complete:
	  rg_state$D_IN = MUX_rg_state$write_1__VAL_2;
      WILL_FIRE_RL_rl_stage1_CSRR_W_2:
	  rg_state$D_IN = MUX_rg_state$write_1__VAL_3;
      WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2:
	  rg_state$D_IN = MUX_rg_state$write_1__VAL_4;
      WILL_FIRE_RL_rl_reset_from_WFI: rg_state$D_IN = 4'd0;
      WILL_FIRE_RL_rl_reset_start: rg_state$D_IN = 4'd1;
      MUX_rg_state$write_1__SEL_7: rg_state$D_IN = 4'd3;
      MUX_rg_state$write_1__SEL_8: rg_state$D_IN = 4'd4;
      MUX_rg_state$write_1__SEL_1 || MUX_rg_state$write_1__SEL_9:
	  rg_state$D_IN = 4'd5;
      WILL_FIRE_RL_rl_stage1_CSRR_W: rg_state$D_IN = 4'd6;
      WILL_FIRE_RL_rl_stage1_CSRR_S_or_C: rg_state$D_IN = 4'd7;
      WILL_FIRE_RL_rl_stage1_FENCE_I: rg_state$D_IN = 4'd9;
      WILL_FIRE_RL_rl_stage1_FENCE: rg_state$D_IN = 4'd10;
      WILL_FIRE_RL_rl_stage1_WFI: rg_state$D_IN = 4'd12;
      default: rg_state$D_IN = 4'b1010 /* unspecified value */ ;
    endcase
  end
  assign rg_state$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1461 ||
	     WILL_FIRE_RL_rl_reset_complete ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W_2 ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 ||
	     WILL_FIRE_RL_rl_reset_from_WFI ||
	     WILL_FIRE_RL_rl_reset_start ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ||
	     WILL_FIRE_RL_rl_stage1_interrupt ||
	     WILL_FIRE_RL_rl_stage1_trap ||
	     WILL_FIRE_RL_rl_stage2_nonpipe ||
	     WILL_FIRE_RL_rl_stage1_xRET ||
	     WILL_FIRE_RL_rl_trap ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C ||
	     WILL_FIRE_RL_rl_stage1_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_FENCE ||
	     WILL_FIRE_RL_rl_stage1_WFI ;
  // register rg_trap_info
  always@(MUX_rg_trap_info$write_1__SEL_1 or
	  MUX_rg_trap_info$write_1__VAL_1 or
	  WILL_FIRE_RL_rl_stage2_nonpipe or
	  MUX_rg_trap_info$write_1__VAL_2 or
	  WILL_FIRE_RL_rl_stage1_trap or
	  MUX_rg_trap_info$write_1__VAL_3 or
	  WILL_FIRE_RL_rl_stage1_interrupt or MUX_rg_trap_info$write_1__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_rg_trap_info$write_1__SEL_1:
	  rg_trap_info$D_IN = MUX_rg_trap_info$write_1__VAL_1;
      WILL_FIRE_RL_rl_stage2_nonpipe:
	  rg_trap_info$D_IN = MUX_rg_trap_info$write_1__VAL_2;
      WILL_FIRE_RL_rl_stage1_trap:
	  rg_trap_info$D_IN = MUX_rg_trap_info$write_1__VAL_3;
      WILL_FIRE_RL_rl_stage1_interrupt:
	  rg_trap_info$D_IN = MUX_rg_trap_info$write_1__VAL_4;
      default: rg_trap_info$D_IN =
		   68'hAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign rg_trap_info$EN =
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W ||
	     WILL_FIRE_RL_rl_stage2_nonpipe ||
	     WILL_FIRE_RL_rl_stage1_trap ||
	     WILL_FIRE_RL_rl_stage1_interrupt ;
  // register rg_trap_instr
  assign rg_trap_instr$D_IN =
	     MUX_rg_trap_instr$write_1__SEL_1 ?
	       stage1_rg_stage_input[231:200] :
	       stage2_rg_stage2[134:103] ;
  assign rg_trap_instr$EN =
	     WILL_FIRE_RL_rl_stage1_interrupt ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W ||
	     WILL_FIRE_RL_rl_stage1_trap ||
	     WILL_FIRE_RL_rl_stage2_nonpipe ;
  // register rg_trap_interrupt
  assign rg_trap_interrupt$D_IN = !MUX_rg_trap_interrupt$write_1__SEL_1 ;
  assign rg_trap_interrupt$EN =
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W ||
	     WILL_FIRE_RL_rl_stage1_trap ||
	     WILL_FIRE_RL_rl_stage2_nonpipe ||
	     WILL_FIRE_RL_rl_stage1_interrupt ;
  // register stage1_rg_full
  always@(WILL_FIRE_RL_stage1_rl_reset or
	  WILL_FIRE_RL_rl_pipe or
	  MUX_stage1_rg_full$write_1__VAL_2 or
	  MUX_imem_rg_cache_addr$write_1__SEL_1 or
	  WILL_FIRE_RL_rl_stage1_WFI or
	  WILL_FIRE_RL_rl_finish_FENCE or
	  WILL_FIRE_RL_rl_finish_FENCE_I or
	  WILL_FIRE_RL_rl_stage1_xRET or
	  WILL_FIRE_RL_rl_stage1_restart_after_csrrx or WILL_FIRE_RL_rl_trap)
  case (1'b1)
    WILL_FIRE_RL_stage1_rl_reset: stage1_rg_full$D_IN = 1'd0;
    WILL_FIRE_RL_rl_pipe:
	stage1_rg_full$D_IN = MUX_stage1_rg_full$write_1__VAL_2;
    MUX_imem_rg_cache_addr$write_1__SEL_1 || WILL_FIRE_RL_rl_stage1_WFI ||
    WILL_FIRE_RL_rl_finish_FENCE ||
    WILL_FIRE_RL_rl_finish_FENCE_I ||
    WILL_FIRE_RL_rl_stage1_xRET ||
    WILL_FIRE_RL_rl_stage1_restart_after_csrrx ||
    WILL_FIRE_RL_rl_trap:
	stage1_rg_full$D_IN = 1'd0;
    default: stage1_rg_full$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign stage1_rg_full$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe ||
	     WILL_FIRE_RL_rl_stage1_WFI ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_xRET ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ||
	     WILL_FIRE_RL_rl_trap ||
	     WILL_FIRE_RL_stage1_rl_reset ;
  // register stage1_rg_stage_input
  assign stage1_rg_stage_input$D_IN =
	     { stageD_rg_data[137:106],
	       stageD_rg_data[103:102],
	       stageD_rg_data[105:104],
	       stageD_rg_data[101:64],
	       _theResult____h5412,
	       stageD_rg_data[47:0],
	       _theResult____h5412[6:0],
	       _theResult____h5412[11:7],
	       _theResult____h5412[19:15],
	       _theResult____h5412[24:20],
	       _theResult____h5412[31:27],
	       _theResult____h5412[31:20],
	       _theResult____h5412[14:12],
	       _theResult____h5412[31:27],
	       _theResult____h5412[31:25],
	       decoded_instr_funct10__h19078,
	       _theResult____h5412[31:20],
	       decoded_instr_imm12_S__h19080,
	       decoded_instr_imm13_SB__h19081,
	       _theResult____h5412[31:12],
	       decoded_instr_imm21_UJ__h19083,
	       _theResult____h5412[27:20],
	       _theResult____h5412[26:25] } ;
  assign stage1_rg_stage_input$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1413 &&
	     stageD_rg_full ;
  // register stage2_rg_full
  always@(stage2_f_reset_reqs$EMPTY_N or
	  WILL_FIRE_RL_rl_pipe or
	  MUX_stage2_rg_full$write_1__VAL_2 or
	  MUX_imem_rg_cache_addr$write_1__SEL_1 or WILL_FIRE_RL_rl_trap)
  case (1'b1)
    stage2_f_reset_reqs$EMPTY_N: stage2_rg_full$D_IN = 1'd0;
    WILL_FIRE_RL_rl_pipe:
	stage2_rg_full$D_IN = MUX_stage2_rg_full$write_1__VAL_2;
    MUX_imem_rg_cache_addr$write_1__SEL_1 || WILL_FIRE_RL_rl_trap:
	stage2_rg_full$D_IN = 1'd0;
    default: stage2_rg_full$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign stage2_rg_full$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe ||
	     WILL_FIRE_RL_rl_trap ||
	     stage2_f_reset_reqs$EMPTY_N ;
  // register stage2_rg_resetting
  assign stage2_rg_resetting$D_IN = stage2_f_reset_reqs$EMPTY_N ;
  assign stage2_rg_resetting$EN =
	     WILL_FIRE_RL_stage2_rl_reset_end || stage2_f_reset_reqs$EMPTY_N ;
  // register stage2_rg_stage2
  assign stage2_rg_stage2$D_IN =
	     { rg_cur_priv,
	       stage1_rg_stage_input[305:274],
	       stage1_rg_stage_input[231:200],
	       IF_stage1_rg_full_87_THEN_IF_stage1_rg_stage_i_ETC___d559,
	       x_out_data_to_stage2_rd__h7928,
	       x_out_data_to_stage2_addr__h7929,
	       x_out_data_to_stage2_val1__h7930,
	       x_out_data_to_stage2_val2__h7931 } ;
  assign stage2_rg_stage2$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1375 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd0 &&
	     IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d1378 ;
  // register stage3_rg_full
  always@(WILL_FIRE_RL_stage3_rl_reset or
	  WILL_FIRE_RL_rl_pipe or
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 or
	  MUX_imem_rg_cache_addr$write_1__SEL_1)
  case (1'b1)
    WILL_FIRE_RL_stage3_rl_reset: stage3_rg_full$D_IN = 1'd0;
    WILL_FIRE_RL_rl_pipe:
	stage3_rg_full$D_IN =
	    IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd2;
    MUX_imem_rg_cache_addr$write_1__SEL_1: stage3_rg_full$D_IN = 1'd0;
    default: stage3_rg_full$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign stage3_rg_full$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe ||
	     WILL_FIRE_RL_stage3_rl_reset ;
  // register stage3_rg_stage3
  assign stage3_rg_stage3$D_IN =
	     { stage2_rg_stage2[166:103],
	       stage2_rg_stage2[168:167],
	       stage2_rg_stage2[102:101] == 2'd0 ||
	       near_mem$dmem_valid && !near_mem$dmem_exc,
	       x_out_data_to_stage3_rd__h7354,
	       x_out_data_to_stage3_rd_val__h7355 } ;
  assign stage3_rg_stage3$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 ==
	     2'd2 ;
  // register stageD_rg_data
  assign stageD_rg_data$D_IN =
	     { imem_rg_pc,
	       stageF_rg_epoch,
	       stageF_rg_priv,
	       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1078 ||
	       imem_rg_pc[1:0] == 2'b0 &&
	       imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	       near_mem$imem_instr[1:0] == 2'b11,
	       near_mem$imem_exc,
	       near_mem$imem_exc_code,
	       imem_rg_tval,
	       d_instr__h15539,
	       stageF_branch_predictor$predict_rsp } ;
  assign stageD_rg_data$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1454 ;
  // register stageD_rg_full
  always@(WILL_FIRE_RL_stageD_rl_reset or
	  WILL_FIRE_RL_rl_pipe or
	  MUX_stageD_rg_full$write_1__VAL_2 or
	  MUX_imem_rg_cache_addr$write_1__SEL_1 or
	  WILL_FIRE_RL_rl_trap_fetch or
	  WILL_FIRE_RL_rl_WFI_resume or
	  WILL_FIRE_RL_rl_stage1_WFI or
	  WILL_FIRE_RL_rl_finish_FENCE or
	  WILL_FIRE_RL_rl_finish_FENCE_I or
	  WILL_FIRE_RL_rl_stage1_xRET or
	  WILL_FIRE_RL_rl_stage1_restart_after_csrrx or WILL_FIRE_RL_rl_trap)
  case (1'b1)
    WILL_FIRE_RL_stageD_rl_reset: stageD_rg_full$D_IN = 1'd0;
    WILL_FIRE_RL_rl_pipe:
	stageD_rg_full$D_IN = MUX_stageD_rg_full$write_1__VAL_2;
    MUX_imem_rg_cache_addr$write_1__SEL_1 || WILL_FIRE_RL_rl_trap_fetch ||
    WILL_FIRE_RL_rl_WFI_resume ||
    WILL_FIRE_RL_rl_stage1_WFI ||
    WILL_FIRE_RL_rl_finish_FENCE ||
    WILL_FIRE_RL_rl_finish_FENCE_I ||
    WILL_FIRE_RL_rl_stage1_xRET ||
    WILL_FIRE_RL_rl_stage1_restart_after_csrrx ||
    WILL_FIRE_RL_rl_trap:
	stageD_rg_full$D_IN = 1'd0;
    default: stageD_rg_full$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign stageD_rg_full$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_stage1_WFI ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_xRET ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ||
	     WILL_FIRE_RL_rl_trap ||
	     WILL_FIRE_RL_stageD_rl_reset ;
  // register stageF_rg_epoch
  always@(WILL_FIRE_RL_stageF_rl_reset or
	  MUX_imem_rg_cache_addr$write_1__SEL_2 or
	  stageF_rg_epoch or
	  MUX_imem_rg_cache_addr$write_1__SEL_1 or
	  new_epoch__h16901 or
	  WILL_FIRE_RL_rl_trap_fetch or
	  WILL_FIRE_RL_rl_WFI_resume or
	  WILL_FIRE_RL_rl_finish_FENCE or
	  WILL_FIRE_RL_rl_finish_FENCE_I or
	  WILL_FIRE_RL_rl_stage1_restart_after_csrrx)
  case (1'b1)
    WILL_FIRE_RL_stageF_rl_reset: stageF_rg_epoch$D_IN = 2'd0;
    MUX_imem_rg_cache_addr$write_1__SEL_2:
	stageF_rg_epoch$D_IN = stageF_rg_epoch;
    MUX_imem_rg_cache_addr$write_1__SEL_1:
	stageF_rg_epoch$D_IN = new_epoch__h16901;
    WILL_FIRE_RL_rl_trap_fetch: stageF_rg_epoch$D_IN = new_epoch__h16901;
    WILL_FIRE_RL_rl_WFI_resume: stageF_rg_epoch$D_IN = new_epoch__h16901;
    WILL_FIRE_RL_rl_finish_FENCE: stageF_rg_epoch$D_IN = new_epoch__h16901;
    WILL_FIRE_RL_rl_finish_FENCE_I: stageF_rg_epoch$D_IN = new_epoch__h16901;
    WILL_FIRE_RL_rl_stage1_restart_after_csrrx:
	stageF_rg_epoch$D_IN = new_epoch__h16901;
    default: stageF_rg_epoch$D_IN = 2'b10 /* unspecified value */ ;
  endcase
  assign stageF_rg_epoch$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1473 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ||
	     WILL_FIRE_RL_stageF_rl_reset ;
  // register stageF_rg_full
  always@(WILL_FIRE_RL_stageF_rl_reset or
	  WILL_FIRE_RL_rl_pipe or
	  MUX_stageF_rg_full$write_1__VAL_2 or
	  MUX_imem_rg_cache_addr$write_1__SEL_1 or
	  WILL_FIRE_RL_rl_trap_fetch or
	  WILL_FIRE_RL_rl_WFI_resume or
	  WILL_FIRE_RL_rl_finish_FENCE or
	  WILL_FIRE_RL_rl_finish_FENCE_I or
	  WILL_FIRE_RL_rl_stage1_restart_after_csrrx)
  case (1'b1)
    WILL_FIRE_RL_stageF_rl_reset: stageF_rg_full$D_IN = 1'd0;
    WILL_FIRE_RL_rl_pipe:
	stageF_rg_full$D_IN = MUX_stageF_rg_full$write_1__VAL_2;
    MUX_imem_rg_cache_addr$write_1__SEL_1 || WILL_FIRE_RL_rl_trap_fetch ||
    WILL_FIRE_RL_rl_WFI_resume ||
    WILL_FIRE_RL_rl_finish_FENCE ||
    WILL_FIRE_RL_rl_finish_FENCE_I ||
    WILL_FIRE_RL_rl_stage1_restart_after_csrrx:
	stageF_rg_full$D_IN = 1'd1;
    default: stageF_rg_full$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign stageF_rg_full$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe ||
	     WILL_FIRE_RL_stageF_rl_reset ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // register stageF_rg_priv
  assign stageF_rg_priv$D_IN = rg_cur_priv ;
  assign stageF_rg_priv$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1473 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // submodule csr_regfile
  assign csr_regfile$access_permitted_1_csr_addr = rg_trap_instr[31:20] ;
  assign csr_regfile$access_permitted_1_priv = rg_cur_priv ;
  assign csr_regfile$access_permitted_1_read_not_write = 1'd0 ;
  assign csr_regfile$access_permitted_2_csr_addr = rg_trap_instr[31:20] ;
  assign csr_regfile$access_permitted_2_priv = rg_cur_priv ;
  assign csr_regfile$access_permitted_2_read_not_write =
	     rs1_val__h22768 == 32'd0 ;
  assign csr_regfile$csr_counter_read_fault_csr_addr = 12'h0 ;
  assign csr_regfile$csr_counter_read_fault_priv = 2'h0 ;
  always@(IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418)
  begin
    case (IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418)
      4'd8: csr_regfile$csr_ret_actions_from_priv = 2'b11;
      4'd9: csr_regfile$csr_ret_actions_from_priv = 2'b01;
      default: csr_regfile$csr_ret_actions_from_priv = 2'b0;
    endcase
  end
  assign csr_regfile$csr_trap_actions_exc_code = rg_trap_info[35:32] ;
  assign csr_regfile$csr_trap_actions_from_priv = rg_cur_priv ;
  assign csr_regfile$csr_trap_actions_interrupt =
	     rg_trap_interrupt && !csr_regfile$nmi_pending ;
  assign csr_regfile$csr_trap_actions_nmi =
	     rg_trap_interrupt && csr_regfile$nmi_pending ;
  assign csr_regfile$csr_trap_actions_pc = rg_trap_info[67:36] ;
  assign csr_regfile$csr_trap_actions_xtval = rg_trap_info[31:0] ;
  assign csr_regfile$interrupt_pending_cur_priv = rg_cur_priv ;
  assign csr_regfile$m_external_interrupt_req_set_not_clear =
	     m_external_interrupt_req_set_not_clear ;
  assign csr_regfile$mav_csr_write_csr_addr = rg_trap_instr[31:20] ;
  assign csr_regfile$mav_csr_write_word =
	     MUX_csr_regfile$mav_csr_write_1__SEL_1 ?
	       rs1_val__h22085 :
	       MUX_csr_regfile$mav_csr_write_2__VAL_2 ;
  assign csr_regfile$mav_read_csr_csr_addr = 12'h0 ;
  assign csr_regfile$nmi_req_set_not_clear = nmi_req_set_not_clear ;
  assign csr_regfile$read_csr_csr_addr = rg_trap_instr[31:20] ;
  assign csr_regfile$read_csr_port2_csr_addr = 12'h0 ;
  assign csr_regfile$s_external_interrupt_req_set_not_clear =
	     s_external_interrupt_req_set_not_clear ;
  assign csr_regfile$software_interrupt_req_set_not_clear =
	     software_interrupt_req_set_not_clear ;
  assign csr_regfile$timer_interrupt_req_set_not_clear =
	     timer_interrupt_req_set_not_clear ;
  assign csr_regfile$EN_server_reset_request_put =
	     CAN_FIRE_RL_rl_reset_start ;
  assign csr_regfile$EN_server_reset_response_get =
	     MUX_rg_state$write_1__SEL_2 ;
  assign csr_regfile$EN_mav_read_csr = 1'b0 ;
  assign csr_regfile$EN_mav_csr_write =
	     WILL_FIRE_RL_rl_stage1_CSRR_W_2 &&
	     csr_regfile$access_permitted_1 ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	     csr_regfile$access_permitted_2 &&
	     rg_trap_instr[19:15] != 5'd0 ;
  assign csr_regfile$EN_csr_trap_actions = CAN_FIRE_RL_rl_trap ;
  assign csr_regfile$EN_csr_ret_actions = CAN_FIRE_RL_rl_stage1_xRET ;
  assign csr_regfile$EN_csr_minstret_incr =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 ==
	     2'd2 ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W_2 &&
	     csr_regfile$access_permitted_1 ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	     csr_regfile$access_permitted_2 ||
	     WILL_FIRE_RL_rl_stage1_WFI ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_xRET ;
  assign csr_regfile$EN_debug = 1'b0 ;
  // submodule f_reset_reqs
  assign f_reset_reqs$D_IN = hart0_server_reset_request_put ;
  assign f_reset_reqs$ENQ = EN_hart0_server_reset_request_put ;
  assign f_reset_reqs$DEQ =
	     gpr_regfile$RDY_server_reset_request_put &&
	     near_mem$RDY_server_reset_request_put &&
	     csr_regfile_RDY_server_reset_request_put__224__ETC___d1236 &&
	     rg_state == 4'd0 ;
  assign f_reset_reqs$CLR = 1'b0 ;
  // submodule f_reset_rsps
  assign f_reset_rsps$D_IN = rg_run_on_reset ;
  assign f_reset_rsps$ENQ = MUX_rg_state$write_1__SEL_2 ;
  assign f_reset_rsps$DEQ = EN_hart0_server_reset_response_get ;
  assign f_reset_rsps$CLR = 1'b0 ;
  // submodule gpr_regfile
  assign gpr_regfile$read_rs1_port2_rs1 = 5'h0 ;
  assign gpr_regfile$read_rs1_rs1 = stage1_rg_stage_input[139:135] ;
  assign gpr_regfile$read_rs2_rs2 = stage1_rg_stage_input[134:130] ;
  assign gpr_regfile$write_rd_rd =
	     (MUX_csr_regfile$mav_csr_write_1__SEL_1 ||
	      MUX_gpr_regfile$write_rd_1__SEL_3) ?
	       rg_trap_instr[11:7] :
	       stage3_rg_stage3[36:32] ;
  assign gpr_regfile$write_rd_rd_val =
	     (MUX_csr_regfile$mav_csr_write_1__SEL_1 ||
	      MUX_gpr_regfile$write_rd_1__SEL_3) ?
	       csr_regfile$read_csr[31:0] :
	       stage3_rg_stage3[31:0] ;
  assign gpr_regfile$EN_server_reset_request_put =
	     CAN_FIRE_RL_rl_reset_start ;
  assign gpr_regfile$EN_server_reset_response_get =
	     MUX_rg_state$write_1__SEL_2 ;
  assign gpr_regfile$EN_write_rd =
	     WILL_FIRE_RL_rl_pipe && stage3_rg_full && stage3_rg_stage3[37] ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W_2 &&
	     csr_regfile$access_permitted_1 ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	     csr_regfile$access_permitted_2 ;
  // submodule near_mem
  assign near_mem$dma_server_araddr = dma_server_araddr ;
  assign near_mem$dma_server_arburst = dma_server_arburst ;
  assign near_mem$dma_server_arcache = dma_server_arcache ;
  assign near_mem$dma_server_arid = dma_server_arid ;
  assign near_mem$dma_server_arlen = dma_server_arlen ;
  assign near_mem$dma_server_arlock = dma_server_arlock ;
  assign near_mem$dma_server_arprot = dma_server_arprot ;
  assign near_mem$dma_server_arqos = dma_server_arqos ;
  assign near_mem$dma_server_arregion = dma_server_arregion ;
  assign near_mem$dma_server_arsize = dma_server_arsize ;
  assign near_mem$dma_server_arvalid = dma_server_arvalid ;
  assign near_mem$dma_server_awaddr = dma_server_awaddr ;
  assign near_mem$dma_server_awburst = dma_server_awburst ;
  assign near_mem$dma_server_awcache = dma_server_awcache ;
  assign near_mem$dma_server_awid = dma_server_awid ;
  assign near_mem$dma_server_awlen = dma_server_awlen ;
  assign near_mem$dma_server_awlock = dma_server_awlock ;
  assign near_mem$dma_server_awprot = dma_server_awprot ;
  assign near_mem$dma_server_awqos = dma_server_awqos ;
  assign near_mem$dma_server_awregion = dma_server_awregion ;
  assign near_mem$dma_server_awsize = dma_server_awsize ;
  assign near_mem$dma_server_awvalid = dma_server_awvalid ;
  assign near_mem$dma_server_bready = dma_server_bready ;
  assign near_mem$dma_server_rready = dma_server_rready ;
  assign near_mem$dma_server_wdata = dma_server_wdata ;
  assign near_mem$dma_server_wlast = dma_server_wlast ;
  assign near_mem$dma_server_wstrb = dma_server_wstrb ;
  assign near_mem$dma_server_wvalid = dma_server_wvalid ;
  assign near_mem$dmem_req_addr = x_out_data_to_stage2_addr__h7929 ;
  assign near_mem$dmem_req_f3 = MUX_rg_trap_instr$write_1__VAL_1[14:12] ;
  assign near_mem$dmem_req_mstatus_MXR = csr_regfile$read_mstatus[19] ;
  assign near_mem$dmem_req_op =
	     IF_stage1_rg_full_87_THEN_IF_stage1_rg_stage_i_ETC___d559 !=
	     2'd1 ;
  assign near_mem$dmem_req_priv =
	     csr_regfile$read_mstatus[17] ?
	       csr_regfile$read_mstatus[12:11] :
	       rg_cur_priv ;
  assign near_mem$dmem_req_satp = csr_regfile$read_satp ;
  assign near_mem$dmem_req_sstatus_SUM = 1'd0 ;
  assign near_mem$dmem_req_store_value =
	     { 32'd0, x_out_data_to_stage2_val2__h7931 } ;
  assign near_mem$imem_master_arready = imem_master_arready ;
  assign near_mem$imem_master_awready = imem_master_awready ;
  assign near_mem$imem_master_bid = imem_master_bid ;
  assign near_mem$imem_master_bresp = imem_master_bresp ;
  assign near_mem$imem_master_bvalid = imem_master_bvalid ;
  assign near_mem$imem_master_rdata = imem_master_rdata ;
  assign near_mem$imem_master_rid = imem_master_rid ;
  assign near_mem$imem_master_rlast = imem_master_rlast ;
  assign near_mem$imem_master_rresp = imem_master_rresp ;
  assign near_mem$imem_master_rvalid = imem_master_rvalid ;
  assign near_mem$imem_master_wready = imem_master_wready ;
  always@(MUX_imem_rg_cache_addr$write_1__SEL_1 or
	  MUX_near_mem$imem_req_2__VAL_1 or
	  MUX_imem_rg_cache_addr$write_1__SEL_2 or
	  MUX_near_mem$imem_req_2__VAL_2 or
	  WILL_FIRE_RL_imem_rl_fetch_next_32b or
	  MUX_imem_rg_tval$write_1__VAL_4 or
	  MUX_rg_state$write_1__SEL_7 or MUX_near_mem$imem_req_2__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_cache_addr$write_1__SEL_1:
	  near_mem$imem_req_addr = MUX_near_mem$imem_req_2__VAL_1;
      MUX_imem_rg_cache_addr$write_1__SEL_2:
	  near_mem$imem_req_addr = MUX_near_mem$imem_req_2__VAL_2;
      WILL_FIRE_RL_imem_rl_fetch_next_32b:
	  near_mem$imem_req_addr = MUX_imem_rg_tval$write_1__VAL_4;
      MUX_rg_state$write_1__SEL_7:
	  near_mem$imem_req_addr = MUX_near_mem$imem_req_2__VAL_4;
      default: near_mem$imem_req_addr = 32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign near_mem$imem_req_f3 =
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ? imem_rg_f3 : 3'b010 ;
  assign near_mem$imem_req_mstatus_MXR =
	     (MUX_imem_rg_cache_addr$write_1__SEL_1 ||
	      MUX_imem_rg_cache_addr$write_1__SEL_2 ||
	      MUX_rg_state$write_1__SEL_7) ?
	       csr_regfile$read_mstatus[19] :
	       imem_rg_mstatus_MXR ;
  assign near_mem$imem_req_priv =
	     (MUX_imem_rg_cache_addr$write_1__SEL_1 ||
	      MUX_imem_rg_cache_addr$write_1__SEL_2 ||
	      MUX_rg_state$write_1__SEL_7) ?
	       rg_cur_priv :
	       imem_rg_priv ;
  assign near_mem$imem_req_satp =
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ?
	       imem_rg_satp :
	       csr_regfile$read_satp ;
  assign near_mem$imem_req_sstatus_SUM =
	     WILL_FIRE_RL_imem_rl_fetch_next_32b && imem_rg_sstatus_SUM ;
  assign near_mem$mem_master_arready = mem_master_arready ;
  assign near_mem$mem_master_awready = mem_master_awready ;
  assign near_mem$mem_master_bid = mem_master_bid ;
  assign near_mem$mem_master_bresp = mem_master_bresp ;
  assign near_mem$mem_master_bvalid = mem_master_bvalid ;
  assign near_mem$mem_master_rdata = mem_master_rdata ;
  assign near_mem$mem_master_rid = mem_master_rid ;
  assign near_mem$mem_master_rlast = mem_master_rlast ;
  assign near_mem$mem_master_rresp = mem_master_rresp ;
  assign near_mem$mem_master_rvalid = mem_master_rvalid ;
  assign near_mem$mem_master_wready = mem_master_wready ;
  assign near_mem$server_fence_request_put =
	     8'b10101010 /* unspecified value */  ;
  assign near_mem$set_watch_tohost_tohost_addr =
	     set_watch_tohost_tohost_addr ;
  assign near_mem$set_watch_tohost_watch_tohost =
	     set_watch_tohost_watch_tohost ;
  assign near_mem$EN_server_reset_request_put = CAN_FIRE_RL_rl_reset_start ;
  assign near_mem$EN_server_reset_response_get = MUX_rg_state$write_1__SEL_2 ;
  assign near_mem$EN_imem_req =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1473 ||
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  assign near_mem$EN_dmem_req =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1375 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd0 &&
	     IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d1378 &&
	     (IF_stage1_rg_full_87_THEN_IF_stage1_rg_stage_i_ETC___d559 ==
	      2'd1 ||
	      IF_stage1_rg_full_87_THEN_IF_stage1_rg_stage_i_ETC___d559 ==
	      2'd2) ;
  assign near_mem$EN_server_fence_i_request_put =
	     CAN_FIRE_RL_rl_stage1_FENCE_I ;
  assign near_mem$EN_server_fence_i_response_get =
	     CAN_FIRE_RL_rl_finish_FENCE_I ;
  assign near_mem$EN_server_fence_request_put = CAN_FIRE_RL_rl_stage1_FENCE ;
  assign near_mem$EN_server_fence_response_get = CAN_FIRE_RL_rl_finish_FENCE ;
  assign near_mem$EN_set_watch_tohost = EN_set_watch_tohost ;
  assign near_mem$EN_ma_ddr4_ready = EN_ma_ddr4_ready ;
  // submodule soc_map
  assign soc_map$m_is_IO_addr_addr = 64'h0 ;
  assign soc_map$m_is_mem_addr_addr = 64'h0 ;
  assign soc_map$m_is_near_mem_IO_addr_addr = 64'h0 ;
  // submodule stage1_f_reset_reqs
  assign stage1_f_reset_reqs$ENQ = CAN_FIRE_RL_rl_reset_start ;
  assign stage1_f_reset_reqs$DEQ = CAN_FIRE_RL_stage1_rl_reset ;
  assign stage1_f_reset_reqs$CLR = 1'b0 ;
  // submodule stage1_f_reset_rsps
  assign stage1_f_reset_rsps$ENQ = CAN_FIRE_RL_stage1_rl_reset ;
  assign stage1_f_reset_rsps$DEQ = MUX_rg_state$write_1__SEL_2 ;
  assign stage1_f_reset_rsps$CLR = 1'b0 ;
  // submodule stage2_f_reset_reqs
  assign stage2_f_reset_reqs$ENQ = CAN_FIRE_RL_rl_reset_start ;
  assign stage2_f_reset_reqs$DEQ = stage2_f_reset_reqs$EMPTY_N ;
  assign stage2_f_reset_reqs$CLR = 1'b0 ;
  // submodule stage2_f_reset_rsps
  assign stage2_f_reset_rsps$ENQ = CAN_FIRE_RL_stage2_rl_reset_end ;
  assign stage2_f_reset_rsps$DEQ = MUX_rg_state$write_1__SEL_2 ;
  assign stage2_f_reset_rsps$CLR = 1'b0 ;
  // submodule stage3_f_reset_reqs
  assign stage3_f_reset_reqs$ENQ = CAN_FIRE_RL_rl_reset_start ;
  assign stage3_f_reset_reqs$DEQ = CAN_FIRE_RL_stage3_rl_reset ;
  assign stage3_f_reset_reqs$CLR = 1'b0 ;
  // submodule stage3_f_reset_rsps
  assign stage3_f_reset_rsps$ENQ = CAN_FIRE_RL_stage3_rl_reset ;
  assign stage3_f_reset_rsps$DEQ = MUX_rg_state$write_1__SEL_2 ;
  assign stage3_f_reset_rsps$CLR = 1'b0 ;
  // submodule stageD_f_reset_reqs
  assign stageD_f_reset_reqs$ENQ = CAN_FIRE_RL_rl_reset_start ;
  assign stageD_f_reset_reqs$DEQ = CAN_FIRE_RL_stageD_rl_reset ;
  assign stageD_f_reset_reqs$CLR = 1'b0 ;
  // submodule stageD_f_reset_rsps
  assign stageD_f_reset_rsps$ENQ = CAN_FIRE_RL_stageD_rl_reset ;
  assign stageD_f_reset_rsps$DEQ = MUX_rg_state$write_1__SEL_2 ;
  assign stageD_f_reset_rsps$CLR = 1'b0 ;
  // submodule stageF_branch_predictor
  assign stageF_branch_predictor$bp_train_cf_info =
	     (stage1_rg_full &&
	      (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	       NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d1304) &&
	      IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	      4'd0) ?
	       { IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d500,
		 stage1_rg_stage_input[305:274],
		 stage1_rg_stage_input[151:145] != 7'b1100011 ||
		 IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d263,
		 alu_outputs_cf_info_fallthru_PC__h9549,
		 alu_outputs_cf_info_taken_PC__h9550 } :
	       99'h6AAAAAAAAAAAAAAAAAAAAAAAA ;
  assign stageF_branch_predictor$bp_train_instr = d_instr__h15539 ;
  assign stageF_branch_predictor$bp_train_is_i32_not_i16 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1078 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	     near_mem$imem_instr[1:0] == 2'b11 ;
  assign stageF_branch_predictor$bp_train_pc = imem_rg_pc ;
  always@(MUX_imem_rg_cache_addr$write_1__SEL_1 or
	  soc_map$m_pc_reset_value or
	  MUX_imem_rg_cache_addr$write_1__SEL_2 or
	  stageF_branch_predictor$predict_rsp or
	  MUX_rg_state$write_1__SEL_7 or rg_next_pc)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_cache_addr$write_1__SEL_1:
	  stageF_branch_predictor$predict_req_pc =
	      soc_map$m_pc_reset_value[31:0];
      MUX_imem_rg_cache_addr$write_1__SEL_2:
	  stageF_branch_predictor$predict_req_pc =
	      stageF_branch_predictor$predict_rsp;
      MUX_rg_state$write_1__SEL_7:
	  stageF_branch_predictor$predict_req_pc = rg_next_pc;
      default: stageF_branch_predictor$predict_req_pc =
		   32'hAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign stageF_branch_predictor$predict_rsp_instr = d_instr__h15539 ;
  assign stageF_branch_predictor$predict_rsp_is_i32_not_i16 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1078 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	     near_mem$imem_instr[1:0] == 2'b11 ;
  assign stageF_branch_predictor$EN_reset = 1'b0 ;
  assign stageF_branch_predictor$EN_predict_req =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1473 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  assign stageF_branch_predictor$EN_bp_train =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1454 ;
  // submodule stageF_f_reset_reqs
  assign stageF_f_reset_reqs$ENQ = CAN_FIRE_RL_rl_reset_start ;
  assign stageF_f_reset_reqs$DEQ = CAN_FIRE_RL_stageF_rl_reset ;
  assign stageF_f_reset_reqs$CLR = 1'b0 ;
  // submodule stageF_f_reset_rsps
  assign stageF_f_reset_rsps$ENQ = CAN_FIRE_RL_stageF_rl_reset ;
  assign stageF_f_reset_rsps$DEQ = MUX_rg_state$write_1__SEL_2 ;
  assign stageF_f_reset_rsps$CLR = 1'b0 ;
  // remaining internal signals
  assign IF_IF_stage1_rg_stage_input_88_BITS_151_TO_145_ETC___d719 =
	     next_pc__h7870 == stage1_rg_stage_input[183:152] ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1311 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1307 ?
	       IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	       4'd0 &&
	       !IF_IF_stage1_rg_stage_input_88_BITS_151_TO_145_ETC___d719 &&
	       stageF_rg_full &&
	       (!near_mem$imem_valid ||
		NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1118) :
	       stage1_rg_full ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1314 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1311 &&
	     stageD_rg_full ||
	     !stageF_rg_full ||
	     !near_mem$imem_valid ||
	     NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1118 ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1413 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1307 ?
	       IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	       4'd0 ||
	       IF_IF_stage1_rg_stage_input_88_BITS_151_TO_145_ETC___d719 ||
	       !stageF_rg_full ||
	       near_mem$imem_valid &&
	       near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125 :
	       !stage1_rg_full ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1454 =
	     (IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1413 ||
	      !stageD_rg_full) &&
	     stageF_rg_full &&
	     near_mem$imem_valid &&
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125 ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1461 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1454 &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1318 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd0 &&
	     !IF_IF_stage1_rg_stage_input_88_BITS_151_TO_145_ETC___d719 ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1473 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1454 &&
	     (csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1468 ||
	      IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	      4'd0 ||
	      IF_IF_stage1_rg_stage_input_88_BITS_151_TO_145_ETC___d719) ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1501 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1307 ?
	       IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	       4'd0 &&
	       IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d1344 :
	       stage1_rg_full ;
  assign IF_NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem__ETC___d1095 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1092 ?
	       { 16'b0,
		 imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ?
		   near_mem$imem_instr[31:16] :
		   imem_rg_cache_b16 } :
	       near_mem$imem_instr ;
  assign IF_NOT_near_mem_dmem_valid__16_32_OR_NOT_near__ETC___d173 =
	     (!near_mem$dmem_valid || !near_mem$dmem_exc) ?
	       ((stage2_rg_stage2[100:96] == 5'd0) ? 2'd0 : 2'd1) :
	       2'd0 ;
  assign IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d1344 =
	     !IF_IF_stage1_rg_stage_input_88_BITS_151_TO_145_ETC___d719 &&
	     stageF_rg_full &&
	     (!near_mem$imem_valid ||
	      NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1118) ;
  assign IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d1378 =
	     IF_IF_stage1_rg_stage_input_88_BITS_151_TO_145_ETC___d719 ||
	     !stageF_rg_full ||
	     near_mem$imem_valid &&
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125 ;
  assign IF_NOT_stage1_rg_stage_input_88_BITS_112_TO_11_ETC___d370 =
	     NOT_stage1_rg_stage_input_88_BITS_112_TO_110_1_ETC___d289 ?
	       4'd12 :
	       4'd1 ;
  assign IF_csr_regfile_read_csr_rg_trap_instr_545_BITS_ETC___d1598 =
	     csr_regfile$read_csr[31:0] | rs1_val__h22768 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d947 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
	      stageD_rg_data[47:42] == 6'b100011 &&
	      stageD_rg_data[38:37] == 2'b0) ?
	       instr__h14984 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b10 &&
		 stageD_rg_data[47:44] == 4'b1001 &&
		 stageD_rg_data[43:39] == 5'd0 &&
		 stageD_rg_data[38:34] == 5'd0) ?
		  instr__h15322 :
		  32'h0) ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d949 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
	      stageD_rg_data[47:42] == 6'b100011 &&
	      stageD_rg_data[38:37] == 2'b10) ?
	       instr__h14712 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
		 stageD_rg_data[47:42] == 6'b100011 &&
		 stageD_rg_data[38:37] == 2'b01) ?
		  instr__h14848 :
		  IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d947) ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d951 =
	     (csr_regfile_read_misa__2_BIT_2_34_AND_stageD_r_ETC___d818 &&
	      stageD_rg_data[38:34] != 5'd0) ?
	       instr__h14481 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
		 stageD_rg_data[47:42] == 6'b100011 &&
		 stageD_rg_data[38:37] == 2'b11) ?
		  instr__h14576 :
		  IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d949) ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d952 =
	     (csr_regfile_read_misa__2_BIT_2_34_AND_stageD_r_ETC___d812 &&
	      stageD_rg_data[38:34] != 5'd0) ?
	       instr__h14362 :
	       IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d951 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d954 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
	      stageD_rg_data[47:45] == 3'b100 &&
	      stageD_rg_data[43:42] == 2'b01 &&
	      imm6__h12508 != 6'd0 &&
	      !stageD_rg_data[44]) ?
	       instr__h14067 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
		 stageD_rg_data[47:45] == 3'b100 &&
		 stageD_rg_data[43:42] == 2'b10) ?
		  instr__h14184 :
		  IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d952) ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d955 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
	      stageD_rg_data[47:45] == 3'b100 &&
	      stageD_rg_data[43:42] == 2'b0 &&
	      imm6__h12508 != 6'd0 &&
	      !stageD_rg_data[44]) ?
	       instr__h13874 :
	       IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d954 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d956 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b10 &&
	      stageD_rg_data[47:45] == 3'b0 &&
	      stageD_rg_data[43:39] != 5'd0 &&
	      imm6__h12508 != 6'd0 &&
	      !stageD_rg_data[44]) ?
	       instr__h13681 :
	       IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d955 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d958 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
	      stageD_rg_data[47:45] == 3'b011 &&
	      stageD_rg_data[43:39] == 5'd2 &&
	      nzimm10__h13132 != 10'd0) ?
	       instr__h13336 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b0 &&
		 stageD_rg_data[47:45] == 3'b0 &&
		 nzimm10__h13347 != 10'd0) ?
		  instr__h13508 :
		  IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d956) ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d959 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
	      stageD_rg_data[47:45] == 3'b0 &&
	      stageD_rg_data[43:39] != 5'd0 &&
	      imm6__h12508 != 6'd0 ||
	      csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
	      stageD_rg_data[47:45] == 3'b0 &&
	      stageD_rg_data[43:39] == 5'd0 &&
	      imm6__h12508 == 6'd0) ?
	       instr__h12899 :
	       IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d958 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d960 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
	      stageD_rg_data[47:45] == 3'b011 &&
	      stageD_rg_data[43:39] != 5'd0 &&
	      stageD_rg_data[43:39] != 5'd2 &&
	      imm6__h12508 != 6'd0) ?
	       instr__h12770 :
	       IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d959 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d962 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
	      stageD_rg_data[47:45] == 3'b111) ?
	       instr__h12248 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
		 stageD_rg_data[47:45] == 3'b010 &&
		 stageD_rg_data[43:39] != 5'd0) ?
		  instr__h12586 :
		  IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d960) ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d963 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
	      stageD_rg_data[47:45] == 3'b110) ?
	       instr__h11931 :
	       IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d962 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d964 =
	     (csr_regfile_read_misa__2_BIT_2_34_AND_stageD_r_ETC___d818 &&
	      stageD_rg_data[38:34] == 5'd0) ?
	       instr__h11866 :
	       IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d963 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d965 =
	     (csr_regfile_read_misa__2_BIT_2_34_AND_stageD_r_ETC___d812 &&
	      stageD_rg_data[38:34] == 5'd0) ?
	       instr__h11750 :
	       IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d964 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d966 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
	      stageD_rg_data[47:45] == 3'b001) ?
	       instr__h11360 :
	       IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d965 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d967 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b01 &&
	      stageD_rg_data[47:45] == 3'b101) ?
	       instr__h11017 :
	       IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d966 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d968 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b0 &&
	      stageD_rg_data[47:45] == 3'b110) ?
	       instr__h10788 :
	       IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d967 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d969 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b0 &&
	      stageD_rg_data[47:45] == 3'b010) ?
	       instr__h10593 :
	       IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d968 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d970 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b10 &&
	      stageD_rg_data[47:45] == 3'b110) ?
	       instr__h10401 :
	       IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d969 ;
  assign IF_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg_p_ETC___d1096 =
	     (imem_rg_pc[1:0] == 2'b0 &&
	      imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	      near_mem$imem_instr[1:0] != 2'b11) ?
	       instr_out___1__h15563 :
	       IF_NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem__ETC___d1095 ;
  assign IF_rg_cur_priv_4_EQ_0b11_84_AND_stage1_rg_stag_ETC___d398 =
	     (rg_cur_priv == 2'b11 &&
	      stage1_rg_stage_input[87:76] == 12'b001100000010) ?
	       4'd8 :
	       (rg_cur_priv_4_EQ_0b11_84_OR_rg_cur_priv_4_EQ_0_ETC___d396 ?
		  4'd11 :
		  4'd12) ;
  assign IF_stage1_rg_full_87_THEN_IF_stage1_rg_stage_i_ETC___d559 =
	     stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ?
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q16 :
	       2'd0 ;
  assign IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d252 =
	     rs1_val_bypassed__h5141 == rs2_val__h8057 ;
  assign IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d254 =
	     (rs1_val_bypassed__h5141 ^ 32'h80000000) <
	     (rs2_val__h8057 ^ 32'h80000000) ;
  assign IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d256 =
	     rs1_val_bypassed__h5141 < rs2_val__h8057 ;
  assign IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d310 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       stage1_rg_stage_input[112:110] != 3'b0 &&
	       stage1_rg_stage_input[112:110] != 3'b001 &&
	       stage1_rg_stage_input[112:110] != 3'b100 &&
	       stage1_rg_stage_input[112:110] != 3'b101 &&
	       stage1_rg_stage_input[112:110] != 3'b110 &&
	       stage1_rg_stage_input[112:110] != 3'b111 ||
	       IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d263 :
	       (((stage1_rg_stage_input[151:145] == 7'b0010011 ||
		  stage1_rg_stage_input[151:145] == 7'b0110011) &&
		 (stage1_rg_stage_input[112:110] == 3'b001 ||
		  stage1_rg_stage_input[112:110] == 3'b101)) ?
		  stage1_rg_stage_input[81] :
		  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q7) ;
  assign IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d321 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       stage1_rg_stage_input[112:110] != 3'b0 &&
	       stage1_rg_stage_input[112:110] != 3'b001 &&
	       stage1_rg_stage_input[112:110] != 3'b100 &&
	       stage1_rg_stage_input[112:110] != 3'b101 &&
	       stage1_rg_stage_input[112:110] != 3'b110 &&
	       stage1_rg_stage_input[112:110] != 3'b111 ||
	       IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d316 :
	       stage1_rg_stage_input[151:145] != 7'b1101111 &&
	       stage1_rg_stage_input[151:145] != 7'b1100111 ;
  assign IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d357 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       (stage1_rg_stage_input[112:110] == 3'b0 ||
		stage1_rg_stage_input[112:110] == 3'b001 ||
		stage1_rg_stage_input[112:110] == 3'b100 ||
		stage1_rg_stage_input[112:110] == 3'b101 ||
		stage1_rg_stage_input[112:110] == 3'b110 ||
		stage1_rg_stage_input[112:110] == 3'b111) &&
	       IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d316 :
	       (((stage1_rg_stage_input[151:145] == 7'b0010011 ||
		  stage1_rg_stage_input[151:145] == 7'b0110011) &&
		 (stage1_rg_stage_input[112:110] == 3'b001 ||
		  stage1_rg_stage_input[112:110] == 3'b101)) ?
		  !stage1_rg_stage_input[81] :
		  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q8) ;
  assign IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d359 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       (stage1_rg_stage_input[112:110] == 3'b0 ||
		stage1_rg_stage_input[112:110] == 3'b001 ||
		stage1_rg_stage_input[112:110] == 3'b100 ||
		stage1_rg_stage_input[112:110] == 3'b101 ||
		stage1_rg_stage_input[112:110] == 3'b110 ||
		stage1_rg_stage_input[112:110] == 3'b111) &&
	       IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d263 :
	       stage1_rg_stage_input[151:145] == 7'b1101111 ||
	       stage1_rg_stage_input[151:145] == 7'b1100111 ;
  assign IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d641 =
	     ((stage1_rg_stage_input[151:145] == 7'b0010011 ||
	       stage1_rg_stage_input[151:145] == 7'b0110011) &&
	      (stage1_rg_stage_input[112:110] == 3'b001 ||
	       stage1_rg_stage_input[112:110] == 3'b101)) ?
	       alu_outputs___1_val1__h8187 :
	       IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d640 ;
  assign IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 =
	     stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ?
	       (stage1_rg_stage_input[268] ?
		  4'd12 :
		  IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d415) :
	       4'd0 ;
  assign IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 =
	     stage2_rg_full ?
	       IF_stage2_rg_stage2_00_BITS_102_TO_101_01_EQ_0_ETC___d121 :
	       2'd0 ;
  assign IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d1296 =
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177 ==
	     2'd1 &&
	     (IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d192 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d194) ||
	     stage1_rg_stage_input[268] ||
	     IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d310 &&
	     IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d321 ;
  assign IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177 =
	     stage2_rg_full ?
	       CASE_stage2_rg_stage2_BITS_102_TO_101_0_2_1_IF_ETC__q5 :
	       2'd0 ;
  assign IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d192 =
	     stage2_rg_stage2[100:96] == stage1_rg_stage_input[139:135] ;
  assign IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d194 =
	     stage2_rg_stage2[100:96] == stage1_rg_stage_input[134:130] ;
  assign IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362 =
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177 ==
	     2'd1 &&
	     (IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d192 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d194) ||
	     !stage1_rg_stage_input[268] &&
	     (IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d357 ||
	      IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d359) ;
  assign IF_stage2_rg_stage2_00_BITS_102_TO_101_01_EQ_0_ETC___d121 =
	     (stage2_rg_stage2[102:101] == 2'd0) ?
	       2'd2 :
	       (near_mem$dmem_valid ?
		  (near_mem$dmem_exc ? 2'd3 : 2'd2) :
		  2'd1) ;
  assign NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d1359 =
	     NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 &&
	     (stage2_rg_stage2[102:101] == 2'd0 ||
	      near_mem$dmem_valid && !near_mem$dmem_exc) ;
  assign NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 =
	     cur_verbosity__h3701 > 4'd1 ;
  assign NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d1304 =
	     (IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177 !=
	      2'd1 ||
	      !IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d192 &&
	      !IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d194) &&
	     !stage1_rg_stage_input[268] &&
	     (IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d357 ||
	      IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d359) ;
  assign NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d145 =
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 !=
	     2'd3 &&
	     (stage2_rg_stage2[102:101] == 2'd0 ||
	      near_mem$dmem_valid && !near_mem$dmem_exc) ;
  assign NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 =
	     (IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177 !=
	      2'd1 ||
	      !IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d192 &&
	      !IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d194) &&
	     (stage1_rg_stage_input[268] ||
	      IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d310 &&
	      IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d321) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1303 =
	     (!csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	      stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d1299) &&
	     (IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 ==
	      2'd2 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 ==
	      2'd0) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1307 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1303 &&
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	      NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d1304) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1316 =
	     !csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	     stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d1296 &&
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1318 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1316 &&
	     (IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 ==
	      2'd2 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 ==
	      2'd0) &&
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	      NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d1304) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1325 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1318 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd0 &&
	     !IF_IF_stage1_rg_stage_input_88_BITS_151_TO_145_ETC___d719 ||
	     (imem_rg_pc[1:0] == 2'b0 || near_mem$imem_exc ||
	      !imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1347 =
	     !csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	     NOT_stage1_rg_full_87_66_OR_stage1_rg_stage_in_ETC___d1340 ||
	     NOT_stage1_rg_full_87_66_OR_stage1_rg_stage_in_ETC___d1342 ||
	     IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d1344 ||
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 !=
	     2'd0 ||
	     stage3_rg_full ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1368 =
	     (!csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	      !stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	     (IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 ==
	      2'd2 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 ==
	      2'd0) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1375 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1316 &&
	     (IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 ==
	      2'd2 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 ==
	      2'd0) &&
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	      NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d1304) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1395 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1375 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd0 &&
	     IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d1378 &&
	     NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1410 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1375 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd0 &&
	     IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d1378 &&
	     !IF_IF_stage1_rg_stage_input_88_BITS_151_TO_145_ETC___d719 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1520 =
	     !csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	     !stage1_rg_stage_input[268] &&
	     (IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d357 ||
	      IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d359) ;
  assign NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1078 =
	     imem_rg_pc[1:0] != 2'b0 &&
	     imem_rg_pc_BITS_31_TO_2_4_EQ_imem_rg_cache_add_ETC___d1070 &&
	     near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_072___d1073 &&
	     imem_rg_cache_b16[1:0] == 2'b11 ;
  assign NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1092 =
	     imem_rg_pc[1:0] != 2'b0 &&
	     (imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	      near_mem$imem_instr[17:16] != 2'b11 ||
	      imem_rg_pc_BITS_31_TO_2_4_EQ_imem_rg_cache_add_ETC___d1070 &&
	      imem_rg_cache_b16[1:0] != 2'b11) ;
  assign NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1111 =
	     !near_mem$imem_exc &&
	     (imem_rg_pc[1:0] == 2'b0 ||
	      !imem_rg_pc_BITS_31_TO_2_4_EQ_imem_rg_cache_add_ETC___d1070 ||
	      !near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_072___d1073 ||
	      imem_rg_cache_b16[1:0] != 2'b11) &&
	     (imem_rg_pc[1:0] != 2'b0 ||
	      !imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[1:0] != 2'b11) ;
  assign NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1118 =
	     NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1111 &&
	     imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1115 &&
	     (imem_rg_pc[1:0] != 2'b0 ||
	      !imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[1:0] == 2'b11) ;
  assign NOT_rg_next_pc_609_BITS_1_TO_0_610_EQ_0b0_611__ETC___d1617 =
	     rg_next_pc[1:0] != 2'b0 && near_mem$imem_valid &&
	     !near_mem$imem_exc &&
	     addr_of_b32__h28607 == near_mem$imem_pc ;
  assign NOT_rg_run_on_reset_250_251_OR_imem_rg_pc_BITS_ETC___d1258 =
	     !rg_run_on_reset ||
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1254 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req ;
  assign NOT_soc_map_m_pc_reset_value__270_BITS_1_TO_0__ETC___d1285 =
	     soc_map$m_pc_reset_value[1:0] != 2'b0 && near_mem$imem_valid &&
	     !near_mem$imem_exc &&
	     addr_of_b32__h17387 == near_mem$imem_pc ;
  assign NOT_stage1_rg_full_87_66_OR_stage1_rg_stage_in_ETC___d1340 =
	     (!stage1_rg_full ||
	      stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d1296 ||
	      IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	      4'd0) &&
	     (!stage1_rg_full ||
	      !stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) ;
  assign NOT_stage1_rg_full_87_66_OR_stage1_rg_stage_in_ETC___d1342 =
	     (!stage1_rg_full ||
	      stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d1296) &&
	     (!stage1_rg_full ||
	      !stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) ;
  assign NOT_stage1_rg_stage_input_88_BITS_112_TO_110_1_ETC___d289 =
	     (stage1_rg_stage_input[112:110] != 3'b0 ||
	      stage1_rg_stage_input[151:145] == 7'b0110011 &&
	      stage1_rg_stage_input[230]) &&
	     (stage1_rg_stage_input[112:110] != 3'b0 ||
	      stage1_rg_stage_input[151:145] != 7'b0110011 ||
	      !stage1_rg_stage_input[230]) &&
	     stage1_rg_stage_input[112:110] != 3'b010 &&
	     stage1_rg_stage_input[112:110] != 3'b011 &&
	     stage1_rg_stage_input[112:110] != 3'b100 &&
	     stage1_rg_stage_input[112:110] != 3'b110 &&
	     stage1_rg_stage_input[112:110] != 3'b111 ;
  assign NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d1663 =
	     (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	      NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d1304) &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd0 ||
	     stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	     NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 ;
  assign NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d1667 =
	     NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d1663 &&
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	      NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d1304 ||
	      NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324) &&
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 ==
	     2'd0 &&
	     !stage3_rg_full ;
  assign NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 =
	     !stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177 !=
	     2'd1 ||
	     !IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d192 &&
	     !IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d194 ;
  assign NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d491 =
	     (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd0 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd1 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd2 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd3 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd4 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd5 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd6 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd7 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd8 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd9 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd10 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd11 ;
  assign NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d503 =
	     NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	     (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	     IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d500 ==
	     2'd3 ;
  assign NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d507 =
	     NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	     (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	     IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d500 ==
	     2'd0 ;
  assign NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d513 =
	     NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	     (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	     IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d500 !=
	     2'd3 &&
	     IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d500 !=
	     2'd0 ;
  assign NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d1484 =
	     stageF_branch_predictor$predict_rsp[1:0] != 2'b0 &&
	     near_mem$imem_valid &&
	     !near_mem$imem_exc &&
	     addr_of_b32__h20412 == near_mem$imem_pc ;
  assign SEXT_stage1_rg_stage_input_88_BITS_87_TO_76_80___d528 =
	     { {20{stage1_rg_stage_input_BITS_87_TO_76__q14[11]}},
	       stage1_rg_stage_input_BITS_87_TO_76__q14 } ;
  assign SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d798 =
	     { {9{offset__h10964[11]}}, offset__h10964 } ;
  assign SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d827 =
	     { {4{offset__h11875[8]}}, offset__h11875 } ;
  assign _theResult_____1_fst__h8884 =
	     (stage1_rg_stage_input[112:110] == 3'b0 &&
	      stage1_rg_stage_input[151:145] == 7'b0110011 &&
	      stage1_rg_stage_input[230]) ?
	       rd_val___1__h8880 :
	       _theResult_____1_fst__h8891 ;
  assign _theResult_____1_fst__h8919 =
	     rs1_val_bypassed__h5141 & _theResult___snd__h9864 ;
  assign _theResult____h21609 =
	     (delta_CPI_instrs__h21608 == 64'd0) ?
	       delta_CPI_instrs___1__h21644 :
	       delta_CPI_instrs__h21608 ;
  assign _theResult____h5412 = x_out_data_to_stage1_instr__h10055 ;
  assign _theResult___snd__h9864 =
	     (stage1_rg_stage_input[151:145] == 7'b0010011) ?
	       SEXT_stage1_rg_stage_input_88_BITS_87_TO_76_80___d528 :
	       rs2_val__h8057 ;
  assign addr_of_b32___1__h17506 = addr_of_b32__h17387 + 32'd4 ;
  assign addr_of_b32___1__h20531 = addr_of_b32__h20412 + 32'd4 ;
  assign addr_of_b32___1__h28726 = addr_of_b32__h28607 + 32'd4 ;
  assign addr_of_b32__h17387 = { soc_map$m_pc_reset_value[31:2], 2'd0 } ;
  assign addr_of_b32__h20412 =
	     { stageF_branch_predictor$predict_rsp[31:2], 2'd0 } ;
  assign addr_of_b32__h28607 = { rg_next_pc[31:2], 2'd0 } ;
  assign alu_outputs___1_addr__h8084 =
	     IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d263 ?
	       branch_target__h8061 :
	       x_out_cf_info_fallthru_PC__h9557 ;
  assign alu_outputs___1_addr__h8290 =
	     rs1_val_bypassed__h5141 +
	     { {20{stage1_rg_stage_input_BITS_75_TO_64__q6[11]}},
	       stage1_rg_stage_input_BITS_75_TO_64__q6 } ;
  assign alu_outputs___1_exc_code__h8479 =
	     (stage1_rg_stage_input[112:110] == 3'b0) ?
	       ((stage1_rg_stage_input[144:140] == 5'd0 &&
		 stage1_rg_stage_input[139:135] == 5'd0) ?
		  CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q4 :
		  4'd2) :
	       4'd2 ;
  assign alu_outputs___1_val1__h8187 =
	     (stage1_rg_stage_input[112:110] == 3'b001) ?
	       rd_val__h9761 :
	       (stage1_rg_stage_input[230] ? rd_val__h9834 : rd_val__h9812) ;
  assign alu_outputs___1_val1__h8223 =
	     (stage1_rg_stage_input[112:110] == 3'b0 &&
	      (stage1_rg_stage_input[151:145] != 7'b0110011 ||
	       !stage1_rg_stage_input[230])) ?
	       rd_val___1__h8872 :
	       _theResult_____1_fst__h8884 ;
  assign alu_outputs___1_val1__h8483 =
	     stage1_rg_stage_input[112] ?
	       { 27'd0, stage1_rg_stage_input[139:135] } :
	       rs1_val_bypassed__h5141 ;
  assign alu_outputs_cf_info_fallthru_PC__h9549 =
	     x_out_cf_info_fallthru_PC__h9557 ;
  assign alu_outputs_cf_info_taken_PC__h9550 = x_out_cf_info_taken_PC__h9558 ;
  assign branch_target__h8061 =
	     stage1_rg_stage_input[305:274] +
	     { {19{stage1_rg_stage_input_BITS_63_TO_51__q1[12]}},
	       stage1_rg_stage_input_BITS_63_TO_51__q1 } ;
  assign cpi__h21611 = x__h21610 / 64'd10 ;
  assign cpifrac__h21612 = x__h21610 % 64'd10 ;
  assign csr_regfile_RDY_server_reset_request_put__224__ETC___d1236 =
	     csr_regfile$RDY_server_reset_request_put &&
	     f_reset_reqs$EMPTY_N &&
	     stageF_f_reset_reqs$FULL_N &&
	     stageD_f_reset_reqs$FULL_N &&
	     stage1_f_reset_reqs$FULL_N &&
	     stage2_f_reset_reqs$FULL_N &&
	     stage3_f_reset_reqs$FULL_N ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1464 =
	     (csr_regfile$interrupt_pending[4] || csr_regfile$nmi_pending) &&
	     (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	      NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d1304 ||
	      NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324) ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1468 =
	     csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1464 ||
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 !=
	     2'd2 &&
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 !=
	     2'd0 ||
	     !stage1_rg_full ||
	     stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d1296 ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1471 =
	     (csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1468 ||
	      IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	      4'd0 ||
	      IF_IF_stage1_rg_stage_input_88_BITS_151_TO_145_ETC___d719) &&
	     NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1475 =
	     (csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1468 ||
	      IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	      4'd0 ||
	      IF_IF_stage1_rg_stage_input_88_BITS_151_TO_145_ETC___d719) &&
	     !near_mem$imem_exc ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1510 =
	     csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1468 ||
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	     4'd0 ||
	     IF_IF_stage1_rg_stage_input_88_BITS_151_TO_145_ETC___d719 ||
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1311 &&
	     stageD_rg_full ;
  assign csr_regfile_read_csr_mcycle__3_MINUS_rg_start__ETC___d1548 =
	     delta_CPI_cycles__h21607 * 64'd10 ;
  assign csr_regfile_read_misa__2_BIT_2_34_AND_stageD_r_ETC___d812 =
	     csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b10 &&
	     stageD_rg_data[47:44] == 4'b1000 &&
	     stageD_rg_data[43:39] != 5'd0 ;
  assign csr_regfile_read_misa__2_BIT_2_34_AND_stageD_r_ETC___d818 =
	     csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b10 &&
	     stageD_rg_data[47:44] == 4'b1001 &&
	     stageD_rg_data[43:39] != 5'd0 ;
  assign cur_verbosity__h3701 =
	     (csr_regfile$read_csr_minstret < cfg_logdelay) ?
	       4'd0 :
	       cfg_verbosity ;
  assign d_instr__h15539 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1078 ?
	       instr_out___1__h15541 :
	       IF_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg_p_ETC___d1096 ;
  assign data_to_stage2_addr__h7919 = x_out_data_to_stage2_addr__h7929 ;
  assign data_to_stage2_rd__h7918 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       5'd0 :
	       stage1_rg_stage_input[144:140] ;
  assign decoded_instr_funct10__h19078 =
	     { _theResult____h5412[31:25], _theResult____h5412[14:12] } ;
  assign decoded_instr_imm12_S__h19080 =
	     { _theResult____h5412[31:25], _theResult____h5412[11:7] } ;
  assign decoded_instr_imm13_SB__h19081 =
	     { _theResult____h5412[31],
	       _theResult____h5412[7],
	       _theResult____h5412[30:25],
	       _theResult____h5412[11:8],
	       1'b0 } ;
  assign decoded_instr_imm21_UJ__h19083 =
	     { _theResult____h5412[31],
	       _theResult____h5412[19:12],
	       _theResult____h5412[20],
	       _theResult____h5412[30:21],
	       1'b0 } ;
  assign delta_CPI_cycles__h21607 =
	     csr_regfile$read_csr_mcycle - rg_start_CPI_cycles ;
  assign delta_CPI_instrs___1__h21644 = delta_CPI_instrs__h21608 + 64'd1 ;
  assign delta_CPI_instrs__h21608 =
	     csr_regfile$read_csr_minstret - rg_start_CPI_instrs ;
  assign eaddr__h8260 =
	     rs1_val_bypassed__h5141 +
	     SEXT_stage1_rg_stage_input_88_BITS_87_TO_76_80___d528 ;
  assign fall_through_pc__h7869 =
	     stage1_rg_stage_input[305:274] +
	     (stage1_rg_stage_input[269] ? 32'd4 : 32'd2) ;
  assign imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1115 =
	     imem_rg_pc[1:0] == 2'b0 ||
	     (!imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[17:16] == 2'b11) &&
	     (!imem_rg_pc_BITS_31_TO_2_4_EQ_imem_rg_cache_add_ETC___d1070 ||
	      imem_rg_cache_b16[1:0] == 2'b11) ;
  assign imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1254 =
	     imem_rg_pc[1:0] == 2'b0 || !near_mem$imem_valid ||
	     near_mem$imem_exc ||
	     !imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ;
  assign imem_rg_pc_BITS_31_TO_2_4_EQ_imem_rg_cache_add_ETC___d1070 =
	     imem_rg_pc[31:2] == imem_rg_cache_addr[31:2] ;
  assign imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 =
	     imem_rg_pc[31:2] == near_mem$imem_pc[31:2] ;
  assign imm12__h10257 = { 4'd0, offset__h10129 } ;
  assign imm12__h10594 = { 5'd0, offset__h10536 } ;
  assign imm12__h12510 = { {6{imm6__h12508[5]}}, imm6__h12508 } ;
  assign imm12__h13134 = { {2{nzimm10__h13132[9]}}, nzimm10__h13132 } ;
  assign imm12__h13349 = { 2'd0, nzimm10__h13347 } ;
  assign imm12__h13545 = { 7'b0, stageD_rg_data[38:34] } ;
  assign imm12__h13890 = { 7'b0100000, stageD_rg_data[38:34] } ;
  assign imm20__h12638 = { {14{imm6__h12508[5]}}, imm6__h12508 } ;
  assign imm6__h12508 = { stageD_rg_data[44], stageD_rg_data[38:34] } ;
  assign instr___1__h10091 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[33:32] == 2'b10 &&
	      stageD_rg_data[43:39] != 5'd0 &&
	      stageD_rg_data[47:45] == 3'b010) ?
	       instr__h10256 :
	       IF_csr_regfile_read_misa__2_BIT_2_34_AND_stage_ETC___d970 ;
  assign instr__h10256 =
	     { imm12__h10257, 8'd18, stageD_rg_data[43:39], 7'b0000011 } ;
  assign instr__h10401 =
	     { 4'd0,
	       stageD_rg_data[40:39],
	       stageD_rg_data[44],
	       stageD_rg_data[38:34],
	       8'd18,
	       offset_BITS_4_TO_0___h10525,
	       7'b0100011 } ;
  assign instr__h10593 =
	     { imm12__h10594, rs1__h10595, 3'b010, rd__h10596, 7'b0000011 } ;
  assign instr__h10788 =
	     { 5'd0,
	       stageD_rg_data[37],
	       stageD_rg_data[44],
	       rd__h10596,
	       rs1__h10595,
	       3'b010,
	       offset_BITS_4_TO_0___h10956,
	       7'b0100011 } ;
  assign instr__h11017 =
	     { SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d798[20],
	       SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d798[10:1],
	       SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d798[11],
	       SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d798[19:12],
	       12'd111 } ;
  assign instr__h11360 =
	     { SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d798[20],
	       SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d798[10:1],
	       SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d798[11],
	       SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d798[19:12],
	       12'd239 } ;
  assign instr__h11750 = { 12'd0, stageD_rg_data[43:39], 15'd103 } ;
  assign instr__h11866 = { 12'd0, stageD_rg_data[43:39], 15'd231 } ;
  assign instr__h11931 =
	     { SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d827[12],
	       SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d827[10:5],
	       5'd0,
	       rs1__h10595,
	       3'b0,
	       SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d827[4:1],
	       SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d827[11],
	       7'b1100011 } ;
  assign instr__h12248 =
	     { SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d827[12],
	       SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d827[10:5],
	       5'd0,
	       rs1__h10595,
	       3'b001,
	       SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d827[4:1],
	       SEXT_stageD_rg_data_29_BIT_44_46_CONCAT_stageD_ETC___d827[11],
	       7'b1100011 } ;
  assign instr__h12586 =
	     { imm12__h12510, 8'd0, stageD_rg_data[43:39], 7'b0010011 } ;
  assign instr__h12770 =
	     { imm20__h12638, stageD_rg_data[43:39], 7'b0110111 } ;
  assign instr__h12899 =
	     { imm12__h12510,
	       stageD_rg_data[43:39],
	       3'b0,
	       stageD_rg_data[43:39],
	       7'b0010011 } ;
  assign instr__h13336 =
	     { imm12__h13134,
	       stageD_rg_data[43:39],
	       3'b0,
	       stageD_rg_data[43:39],
	       7'b0010011 } ;
  assign instr__h13508 = { imm12__h13349, 8'd16, rd__h10596, 7'b0010011 } ;
  assign instr__h13681 =
	     { imm12__h13545,
	       stageD_rg_data[43:39],
	       3'b001,
	       stageD_rg_data[43:39],
	       7'b0010011 } ;
  assign instr__h13874 =
	     { imm12__h13545, rs1__h10595, 3'b101, rs1__h10595, 7'b0010011 } ;
  assign instr__h14067 =
	     { imm12__h13890, rs1__h10595, 3'b101, rs1__h10595, 7'b0010011 } ;
  assign instr__h14184 =
	     { imm12__h12510, rs1__h10595, 3'b111, rs1__h10595, 7'b0010011 } ;
  assign instr__h14362 =
	     { 7'b0,
	       stageD_rg_data[38:34],
	       8'd0,
	       stageD_rg_data[43:39],
	       7'b0110011 } ;
  assign instr__h14481 =
	     { 7'b0,
	       stageD_rg_data[38:34],
	       stageD_rg_data[43:39],
	       3'b0,
	       stageD_rg_data[43:39],
	       7'b0110011 } ;
  assign instr__h14576 =
	     { 7'b0,
	       rd__h10596,
	       rs1__h10595,
	       3'b111,
	       rs1__h10595,
	       7'b0110011 } ;
  assign instr__h14712 =
	     { 7'b0,
	       rd__h10596,
	       rs1__h10595,
	       3'b110,
	       rs1__h10595,
	       7'b0110011 } ;
  assign instr__h14848 =
	     { 7'b0,
	       rd__h10596,
	       rs1__h10595,
	       3'b100,
	       rs1__h10595,
	       7'b0110011 } ;
  assign instr__h14984 =
	     { 7'b0100000,
	       rd__h10596,
	       rs1__h10595,
	       3'b0,
	       rs1__h10595,
	       7'b0110011 } ;
  assign instr__h15322 =
	     { 12'b000000000001,
	       stageD_rg_data[43:39],
	       3'b0,
	       stageD_rg_data[43:39],
	       7'b1110011 } ;
  assign instr_out___1__h15541 =
	     { near_mem$imem_instr[15:0], imem_rg_cache_b16 } ;
  assign instr_out___1__h15563 = { 16'b0, near_mem$imem_instr[15:0] } ;
  assign near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1123 =
	     near_mem$imem_exc ||
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1078 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	     near_mem$imem_instr[1:0] == 2'b11 ;
  assign near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125 =
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1123 ||
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1092 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_31_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	     near_mem$imem_instr[1:0] != 2'b11 ;
  assign near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_072___d1073 =
	     near_mem$imem_pc == imem_rg_pc + 32'd2 ;
  assign near_mem_imem_valid_AND_near_mem_imem_exc__1_A_ETC___d1220 =
	     near_mem$imem_valid && near_mem$imem_exc &&
	     near_mem$imem_exc_code != 4'd0 &&
	     near_mem$imem_exc_code != 4'd1 &&
	     near_mem$imem_exc_code != 4'd2 &&
	     near_mem$imem_exc_code != 4'd3 &&
	     near_mem$imem_exc_code != 4'd4 &&
	     near_mem$imem_exc_code != 4'd5 &&
	     near_mem$imem_exc_code != 4'd6 &&
	     near_mem$imem_exc_code != 4'd7 &&
	     near_mem$imem_exc_code != 4'd8 &&
	     near_mem$imem_exc_code != 4'd9 &&
	     near_mem$imem_exc_code != 4'd11 &&
	     near_mem$imem_exc_code != 4'd12 &&
	     near_mem$imem_exc_code != 4'd13 &&
	     near_mem$imem_exc_code != 4'd15 ;
  assign new_epoch__h16901 = rg_epoch + 2'd1 ;
  assign next_pc___1__h9189 = stage1_rg_stage_input[305:274] + 32'd2 ;
  assign next_pc__h7870 = x_out_next_pc__h7886 ;
  assign next_pc__h8090 =
	     stage1_rg_stage_input[305:274] +
	     { {11{stage1_rg_stage_input_BITS_30_TO_10__q2[20]}},
	       stage1_rg_stage_input_BITS_30_TO_10__q2 } ;
  assign next_pc__h8117 = { eaddr__h8260[31:1], 1'd0 } ;
  assign next_pc__h9186 = stage1_rg_stage_input[305:274] + 32'd4 ;
  assign nzimm10__h13132 =
	     { stageD_rg_data[44],
	       stageD_rg_data[36:35],
	       stageD_rg_data[37],
	       stageD_rg_data[34],
	       stageD_rg_data[38],
	       4'b0 } ;
  assign nzimm10__h13347 =
	     { stageD_rg_data[42:39],
	       stageD_rg_data[44:43],
	       stageD_rg_data[37],
	       stageD_rg_data[38],
	       2'b0 } ;
  assign offset_BITS_4_TO_0___h10525 = { stageD_rg_data[43:41], 2'b0 } ;
  assign offset_BITS_4_TO_0___h10956 =
	     { stageD_rg_data[43:42], stageD_rg_data[38], 2'b0 } ;
  assign offset__h10129 =
	     { stageD_rg_data[35:34],
	       stageD_rg_data[44],
	       stageD_rg_data[38:36],
	       2'b0 } ;
  assign offset__h10536 =
	     { stageD_rg_data[37],
	       stageD_rg_data[44:42],
	       stageD_rg_data[38],
	       2'b0 } ;
  assign offset__h10964 =
	     { stageD_rg_data[44],
	       stageD_rg_data[40],
	       stageD_rg_data[42:41],
	       stageD_rg_data[38],
	       stageD_rg_data[39],
	       stageD_rg_data[34],
	       stageD_rg_data[43],
	       stageD_rg_data[37:35],
	       1'b0 } ;
  assign offset__h11875 =
	     { stageD_rg_data[44],
	       stageD_rg_data[38:37],
	       stageD_rg_data[34],
	       stageD_rg_data[43:42],
	       stageD_rg_data[36:35],
	       1'b0 } ;
  assign rd__h10596 = { 2'b01, stageD_rg_data[36:34] } ;
  assign rd_val___1__h8872 =
	     rs1_val_bypassed__h5141 + _theResult___snd__h9864 ;
  assign rd_val___1__h8880 =
	     rs1_val_bypassed__h5141 - _theResult___snd__h9864 ;
  assign rd_val___1__h8887 =
	     ((rs1_val_bypassed__h5141 ^ 32'h80000000) <
	      (_theResult___snd__h9864 ^ 32'h80000000)) ?
	       32'd1 :
	       32'd0 ;
  assign rd_val___1__h8894 =
	     (rs1_val_bypassed__h5141 < _theResult___snd__h9864) ?
	       32'd1 :
	       32'd0 ;
  assign rd_val___1__h8901 =
	     rs1_val_bypassed__h5141 ^ _theResult___snd__h9864 ;
  assign rd_val___1__h8908 =
	     rs1_val_bypassed__h5141 | _theResult___snd__h9864 ;
  assign rd_val__h7771 =
	     (stage3_rg_full && stage3_rg_stage3[37] &&
	      stage3_rg_stage3[36:32] == stage1_rg_stage_input[139:135]) ?
	       stage3_rg_stage3[31:0] :
	       gpr_regfile$read_rs1 ;
  assign rd_val__h7845 =
	     (stage3_rg_full && stage3_rg_stage3[37] &&
	      stage3_rg_stage3[36:32] == stage1_rg_stage_input[134:130]) ?
	       stage3_rg_stage3[31:0] :
	       gpr_regfile$read_rs2 ;
  assign rd_val__h8230 = { stage1_rg_stage_input[50:31], 12'h0 } ;
  assign rd_val__h8244 = stage1_rg_stage_input[305:274] + rd_val__h8230 ;
  assign rd_val__h9761 = rs1_val_bypassed__h5141 << shamt__h8174 ;
  assign rd_val__h9812 = rs1_val_bypassed__h5141 >> shamt__h8174 ;
  assign rd_val__h9834 =
	     rs1_val_bypassed__h5141 >> shamt__h8174 |
	     ~(32'hFFFFFFFF >> shamt__h8174) &
	     {32{rs1_val_bypassed__h5141[31]}} ;
  assign rg_cur_priv_4_EQ_0b11_84_OR_rg_cur_priv_4_EQ_0_ETC___d396 =
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[21] ||
	      rg_cur_priv == 2'b0 && csr_regfile$read_misa[13]) &&
	     stage1_rg_stage_input[87:76] == 12'b000100000101 ;
  assign rg_state_3_EQ_12_0_AND_csr_regfile_wfi_resume__ETC___d1654 =
	     rg_state == 4'd12 && csr_regfile$wfi_resume &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125) ;
  assign rg_state_3_EQ_3_327_AND_NOT_csr_regfile_interr_ETC___d1524 =
	     rg_state == 4'd3 &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1520 &&
	     !stage3_rg_full &&
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 ==
	     2'd0 &&
	     stage1_rg_full &&
	     stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	     NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 ;
  assign rg_state_3_EQ_3_327_AND_NOT_csr_regfile_interr_ETC___d1634 =
	     rg_state_3_EQ_3_327_AND_NOT_csr_regfile_interr_ETC___d1524 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	     4'd6 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125) ;
  assign rg_state_3_EQ_3_327_AND_NOT_csr_regfile_interr_ETC___d1643 =
	     rg_state_3_EQ_3_327_AND_NOT_csr_regfile_interr_ETC___d1524 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	     4'd5 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125) ;
  assign rg_state_3_EQ_3_327_AND_stage3_rg_full_0_OR_NO_ETC___d1337 =
	     rg_state == 4'd3 &&
	     (stage3_rg_full ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 !=
	      2'd0 ||
	      stage1_rg_full ||
	      stageD_rg_full ||
	      stageF_rg_full) &&
	     (stage3_rg_full ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 !=
	      2'd3) &&
	     stage3_rg_full_0_OR_NOT_IF_stage2_rg_full_9_TH_ETC___d1335 ;
  assign rg_state_3_EQ_5_658_AND_NOT_stageF_rg_full_100_ETC___d1659 =
	     rg_state == 4'd5 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125) ;
  assign rg_state_3_EQ_8_606_AND_NOT_stageF_rg_full_100_ETC___d1607 =
	     rg_state == 4'd8 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125) ;
  assign rg_trap_info_534_BITS_67_TO_36_535_EQ_csr_regf_ETC___d1544 =
	     rg_trap_info[67:36] == csr_regfile$csr_trap_actions[97:66] ;
  assign rs1__h10595 = { 2'b01, stageD_rg_data[41:39] } ;
  assign rs1_val__h22085 =
	     (rg_trap_instr[14:12] == 3'b001) ?
	       rg_csr_val1 :
	       { 27'd0, rg_trap_instr[19:15] } ;
  assign rs1_val_bypassed__h5141 =
	     (stage1_rg_stage_input[139:135] == 5'd0) ? 32'd0 : val__h7773 ;
  assign rs2_val__h8057 =
	     (stage1_rg_stage_input[134:130] == 5'd0) ? 32'd0 : val__h7847 ;
  assign shamt__h8174 =
	     (stage1_rg_stage_input[151:145] == 7'b0010011) ?
	       stage1_rg_stage_input[80:76] :
	       rs2_val__h8057[4:0] ;
  assign stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365 =
	     stage1_rg_full &&
	     NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	     (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) ;
  assign stage1_rg_stage_input_88_BITS_112_TO_110_17_EQ_ETC___d343 =
	     stage1_rg_stage_input[112:110] == 3'b0 &&
	     (stage1_rg_stage_input[151:145] != 7'b0110011 ||
	      !stage1_rg_stage_input[230]) ||
	     stage1_rg_stage_input[112:110] == 3'b0 &&
	     stage1_rg_stage_input[151:145] == 7'b0110011 &&
	     stage1_rg_stage_input[230] ||
	     stage1_rg_stage_input[112:110] == 3'b010 ||
	     stage1_rg_stage_input[112:110] == 3'b011 ||
	     stage1_rg_stage_input[112:110] == 3'b100 ||
	     stage1_rg_stage_input[112:110] == 3'b110 ||
	     stage1_rg_stage_input[112:110] == 3'b111 ;
  assign stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d1299 =
	     (stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d1296 ||
	      IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 ==
	      4'd0) &&
	     (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) ;
  assign stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 =
	     stage1_rg_stage_input[271:270] == rg_epoch ;
  assign stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208 =
	     stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177 ==
	     2'd1 &&
	     (IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d192 ||
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d194) ;
  assign stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d672 =
	     stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	     NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd0 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd1 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd2 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd3 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd4 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd5 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd6 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd7 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd8 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd9 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd10 &&
	     IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 !=
	     4'd11 ;
  assign stage1_rg_stage_input_BITS_30_TO_10__q2 =
	     stage1_rg_stage_input[30:10] ;
  assign stage1_rg_stage_input_BITS_63_TO_51__q1 =
	     stage1_rg_stage_input[63:51] ;
  assign stage1_rg_stage_input_BITS_75_TO_64__q6 =
	     stage1_rg_stage_input[75:64] ;
  assign stage1_rg_stage_input_BITS_87_TO_76__q14 =
	     stage1_rg_stage_input[87:76] ;
  assign stage3_rg_full_0_OR_NOT_IF_stage2_rg_full_9_TH_ETC___d1335 =
	     stage3_rg_full ||
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 !=
	     2'd0 ||
	     !stage1_rg_full ||
	     !stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	     IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362 ;
  assign stageF_f_reset_rsps_i_notEmpty__244_AND_stageD_ETC___d1264 =
	     stageF_f_reset_rsps$EMPTY_N && stageD_f_reset_rsps$EMPTY_N &&
	     stage1_f_reset_rsps$EMPTY_N &&
	     stage2_f_reset_rsps$EMPTY_N &&
	     stage3_f_reset_rsps$EMPTY_N &&
	     f_reset_rsps$FULL_N &&
	     NOT_rg_run_on_reset_250_251_OR_imem_rg_pc_BITS_ETC___d1258 ;
  assign stageF_rg_full_100_AND_near_mem_imem_valid_AND_ETC___d1132 =
	     stageF_rg_full && near_mem$imem_valid &&
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125 &&
	     !near_mem$imem_exc ;
  assign trap_info_tval__h9386 =
	     (stage1_rg_stage_input[151:145] != 7'b1101111 &&
	      stage1_rg_stage_input[151:145] != 7'b1100111 &&
	      (stage1_rg_stage_input[151:145] != 7'b1110011 ||
	       stage1_rg_stage_input[112:110] != 3'b0 ||
	       stage1_rg_stage_input[144:140] != 5'd0 ||
	       stage1_rg_stage_input[139:135] != 5'd0 ||
	       stage1_rg_stage_input[87:76] != 12'b0 &&
	       stage1_rg_stage_input[87:76] != 12'b000000000001)) ?
	       (stage1_rg_stage_input[269] ?
		  stage1_rg_stage_input[231:200] :
		  { 16'd0, stage1_rg_stage_input[199:184] }) :
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q15 ;
  assign val__h7773 =
	     (IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177 ==
	      2'd2 &&
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d192) ?
	       stage2_rg_stage2[63:32] :
	       rd_val__h7771 ;
  assign val__h7847 =
	     (IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177 ==
	      2'd2 &&
	      IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d194) ?
	       stage2_rg_stage2[63:32] :
	       rd_val__h7845 ;
  assign value__h9431 =
	     stage1_rg_stage_input[268] ?
	       stage1_rg_stage_input[263:232] :
	       trap_info_tval__h9386 ;
  assign x__h21610 =
	     csr_regfile_read_csr_mcycle__3_MINUS_rg_start__ETC___d1548[63:0] /
	     _theResult____h21609 ;
  assign x_exc_code__h29000 =
	     (csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending) ?
	       csr_regfile$interrupt_pending[3:0] :
	       4'd0 ;
  assign x_out_cf_info_fallthru_PC__h9557 =
	     stage1_rg_stage_input[269] ?
	       next_pc__h9186 :
	       next_pc___1__h9189 ;
  assign x_out_data_to_stage1_instr__h10055 =
	     stageD_rg_data[101] ? stageD_rg_data[63:32] : instr___1__h10091 ;
  assign x_out_data_to_stage2_rd__h7928 =
	     stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ?
	       data_to_stage2_rd__h7918 :
	       5'd0 ;
  assign x_out_data_to_stage2_val2__h7931 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       branch_target__h8061 :
	       rs2_val__h8057 ;
  assign x_out_next_pc__h7886 =
	     IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d359 ?
	       data_to_stage2_addr__h7919 :
	       fall_through_pc__h7869 ;
  assign x_out_trap_info_exc_code__h9391 =
	     stage1_rg_stage_input[268] ?
	       stage1_rg_stage_input[267:264] :
	       alu_outputs_exc_code__h8498 ;
  assign y__h23037 = ~rs1_val__h22768 ;
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[102:101])
      2'd0, 2'd1: x_out_data_to_stage3_rd__h7354 = stage2_rg_stage2[100:96];
      default: x_out_data_to_stage3_rd__h7354 = 5'd0;
    endcase
  end
  always@(stage2_rg_stage2 or near_mem$dmem_word64)
  begin
    case (stage2_rg_stage2[102:101])
      2'd0: x_out_data_to_stage3_rd_val__h7355 = stage2_rg_stage2[63:32];
      2'd1: x_out_data_to_stage3_rd_val__h7355 = near_mem$dmem_word64[31:0];
      default: x_out_data_to_stage3_rd_val__h7355 = stage2_rg_stage2[63:32];
    endcase
  end
  always@(rg_trap_instr or rg_csr_val1)
  begin
    case (rg_trap_instr[14:12])
      3'b010, 3'b011: rs1_val__h22768 = rg_csr_val1;
      default: rs1_val__h22768 = { 27'd0, rg_trap_instr[19:15] };
    endcase
  end
  always@(rg_cur_priv)
  begin
    case (rg_cur_priv)
      2'b0: CASE_rg_cur_priv_0b0_8_0b1_9_11__q3 = 4'd8;
      2'b01: CASE_rg_cur_priv_0b0_8_0b1_9_11__q3 = 4'd9;
      default: CASE_rg_cur_priv_0b0_8_0b1_9_11__q3 = 4'd11;
    endcase
  end
  always@(stage1_rg_stage_input or CASE_rg_cur_priv_0b0_8_0b1_9_11__q3)
  begin
    case (stage1_rg_stage_input[87:76])
      12'b0:
	  CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q4 =
	      CASE_rg_cur_priv_0b0_8_0b1_9_11__q3;
      12'b000000000001:
	  CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q4 = 4'd3;
      default: CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q4 = 4'd2;
    endcase
  end
  always@(stage1_rg_stage_input or alu_outputs___1_exc_code__h8479)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011,
      7'b0001111,
      7'b0010011,
      7'b0010111,
      7'b0100011,
      7'b0110011,
      7'b0110111,
      7'b1100011:
	  alu_outputs_exc_code__h8498 = 4'd2;
      7'b1100111, 7'b1101111: alu_outputs_exc_code__h8498 = 4'd0;
      7'b1110011:
	  alu_outputs_exc_code__h8498 = alu_outputs___1_exc_code__h8479;
      default: alu_outputs_exc_code__h8498 = 4'd2;
    endcase
  end
  always@(stage2_rg_stage2 or
	  IF_NOT_near_mem_dmem_valid__16_32_OR_NOT_near__ETC___d173)
  begin
    case (stage2_rg_stage2[102:101])
      2'd0: CASE_stage2_rg_stage2_BITS_102_TO_101_0_2_1_IF_ETC__q5 = 2'd2;
      2'd1:
	  CASE_stage2_rg_stage2_BITS_102_TO_101_0_2_1_IF_ETC__q5 =
	      IF_NOT_near_mem_dmem_valid__16_32_OR_NOT_near__ETC___d173;
      default: CASE_stage2_rg_stage2_BITS_102_TO_101_0_2_1_IF_ETC__q5 = 2'd0;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d256 or
	  IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d252 or
	  IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d254)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b0:
	  IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d316 =
	      !IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d252;
      3'b001:
	  IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d316 =
	      IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d252;
      3'b100:
	  IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d316 =
	      !IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d254;
      3'b101:
	  IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d316 =
	      IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d254;
      3'b110:
	  IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d316 =
	      !IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d256;
      default: IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d316 =
		   stage1_rg_stage_input[112:110] != 3'b111 ||
		   IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d256;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d256 or
	  IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d252 or
	  IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d254)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b0:
	  IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d263 =
	      IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d252;
      3'b001:
	  IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d263 =
	      !IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d252;
      3'b100:
	  IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d263 =
	      IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d254;
      3'b101:
	  IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d263 =
	      !IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d254;
      3'b110:
	  IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d263 =
	      IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d256;
      default: IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d263 =
		   stage1_rg_stage_input[112:110] == 3'b111 &&
		   !IF_stage1_rg_stage_input_88_BITS_139_TO_135_91_ETC___d256;
    endcase
  end
  always@(stage1_rg_stage_input or
	  NOT_stage1_rg_stage_input_88_BITS_112_TO_110_1_ETC___d289)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q7 =
	      NOT_stage1_rg_stage_input_88_BITS_112_TO_110_1_ETC___d289;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q7 =
		   stage1_rg_stage_input[151:145] != 7'b0110111 &&
		   stage1_rg_stage_input[151:145] != 7'b0010111 &&
		   ((stage1_rg_stage_input[151:145] == 7'b0000011) ?
		      stage1_rg_stage_input[112:110] != 3'b0 &&
		      stage1_rg_stage_input[112:110] != 3'b100 &&
		      stage1_rg_stage_input[112:110] != 3'b001 &&
		      stage1_rg_stage_input[112:110] != 3'b101 &&
		      stage1_rg_stage_input[112:110] != 3'b010 :
		      stage1_rg_stage_input[151:145] != 7'b0100011 ||
		      stage1_rg_stage_input[112:110] != 3'b0 &&
		      stage1_rg_stage_input[112:110] != 3'b001 &&
		      stage1_rg_stage_input[112:110] != 3'b010);
    endcase
  end
  always@(stage1_rg_stage_input or
	  stage1_rg_stage_input_88_BITS_112_TO_110_17_EQ_ETC___d343)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q8 =
	      stage1_rg_stage_input_88_BITS_112_TO_110_17_EQ_ETC___d343;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q8 =
		   stage1_rg_stage_input[151:145] == 7'b0110111 ||
		   stage1_rg_stage_input[151:145] == 7'b0010111 ||
		   ((stage1_rg_stage_input[151:145] == 7'b0000011) ?
		      stage1_rg_stage_input[112:110] == 3'b0 ||
		      stage1_rg_stage_input[112:110] == 3'b100 ||
		      stage1_rg_stage_input[112:110] == 3'b001 ||
		      stage1_rg_stage_input[112:110] == 3'b101 ||
		      stage1_rg_stage_input[112:110] == 3'b010 :
		      stage1_rg_stage_input[151:145] == 7'b0100011 &&
		      (stage1_rg_stage_input[112:110] == 3'b0 ||
		       stage1_rg_stage_input[112:110] == 3'b001 ||
		       stage1_rg_stage_input[112:110] == 3'b010));
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b0, 3'b001, 3'b010, 3'b100, 3'b101:
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q9 = 4'd1;
      default: CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q9 = 4'd12;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b0: CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q10 = 4'd5;
      3'b001: CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q10 = 4'd6;
      default: CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q10 =
		   4'd12;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b0, 3'b001, 3'b010:
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q11 = 4'd1;
      default: CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q11 =
		   4'd12;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_rg_cur_priv_4_EQ_0b11_84_AND_stage1_rg_stag_ETC___d398)
  begin
    case (stage1_rg_stage_input[87:76])
      12'b0, 12'b000000000001:
	  CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_1_ETC__q12 = 4'd12;
      default: CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_1_ETC__q12 =
		   IF_rg_cur_priv_4_EQ_0b11_84_AND_stage1_rg_stag_ETC___d398;
    endcase
  end
  always@(stage1_rg_stage_input or
	  CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_1_ETC__q12)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b0:
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q13 =
	      (stage1_rg_stage_input[144:140] == 5'd0 &&
	       stage1_rg_stage_input[139:135] == 5'd0) ?
		CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_1_ETC__q12 :
		4'd12;
      3'b001, 3'b101:
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q13 = 4'd3;
      3'b010, 3'b011, 3'b110, 3'b111:
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q13 = 4'd4;
      3'd4: CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q13 = 4'd12;
    endcase
  end
  always@(stage1_rg_stage_input or
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q9 or
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q10 or
	  IF_NOT_stage1_rg_stage_input_88_BITS_112_TO_11_ETC___d370 or
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q11 or
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q13)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011:
	  IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d412 =
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q9;
      7'b0001111:
	  IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d412 =
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q10;
      7'b0010011, 7'b0110011:
	  IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d412 =
	      IF_NOT_stage1_rg_stage_input_88_BITS_112_TO_11_ETC___d370;
      7'b0010111, 7'b0110111:
	  IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d412 = 4'd1;
      7'b0100011:
	  IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d412 =
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q11;
      7'b1110011:
	  IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d412 =
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q13;
      default: IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d412 =
		   4'd12;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d412 or
	  IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d263)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011:
	  IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d415 =
	      (stage1_rg_stage_input[112:110] != 3'b0 &&
	       stage1_rg_stage_input[112:110] != 3'b001 &&
	       stage1_rg_stage_input[112:110] != 3'b100 &&
	       stage1_rg_stage_input[112:110] != 3'b101 &&
	       stage1_rg_stage_input[112:110] != 3'b110 &&
	       stage1_rg_stage_input[112:110] != 3'b111) ?
		4'd12 :
		(IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d263 ?
		   4'd2 :
		   4'd1);
      7'b1100111, 7'b1101111:
	  IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d415 = 4'd2;
      default: IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d415 =
		   ((stage1_rg_stage_input[151:145] == 7'b0010011 ||
		     stage1_rg_stage_input[151:145] == 7'b0110011) &&
		    (stage1_rg_stage_input[112:110] == 3'b001 ||
		     stage1_rg_stage_input[112:110] == 3'b101)) ?
		     (stage1_rg_stage_input[81] ? 4'd12 : 4'd1) :
		     IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d412;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011:
	  IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d500 = 2'd0;
      7'b1100111:
	  IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d500 = 2'd2;
      7'b1101111:
	  IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d500 = 2'd1;
      default: IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d500 =
		   2'd3;
    endcase
  end
  always@(stage1_rg_stage_input or
	  alu_outputs___1_addr__h8290 or
	  eaddr__h8260 or
	  alu_outputs___1_addr__h8084 or next_pc__h8117 or next_pc__h8090)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011: x_out_data_to_stage2_addr__h7929 = eaddr__h8260;
      7'b1100011:
	  x_out_data_to_stage2_addr__h7929 = alu_outputs___1_addr__h8084;
      7'b1100111: x_out_data_to_stage2_addr__h7929 = next_pc__h8117;
      7'b1101111: x_out_data_to_stage2_addr__h7929 = next_pc__h8090;
      default: x_out_data_to_stage2_addr__h7929 = alu_outputs___1_addr__h8290;
    endcase
  end
  always@(stage1_rg_stage_input or
	  next_pc__h8117 or branch_target__h8061 or next_pc__h8090)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011: x_out_cf_info_taken_PC__h9558 = branch_target__h8061;
      7'b1101111: x_out_cf_info_taken_PC__h9558 = next_pc__h8090;
      default: x_out_cf_info_taken_PC__h9558 = next_pc__h8117;
    endcase
  end
  always@(stage1_rg_stage_input or data_to_stage2_addr__h7919)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100111, 7'b1101111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q15 =
	      data_to_stage2_addr__h7919;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q15 =
		   (stage1_rg_stage_input[151:145] == 7'b1110011 &&
		    stage1_rg_stage_input[112:110] == 3'b0 &&
		    stage1_rg_stage_input[144:140] == 5'd0 &&
		    stage1_rg_stage_input[139:135] == 5'd0 &&
		    stage1_rg_stage_input[87:76] == 12'b000000000001) ?
		     stage1_rg_stage_input[305:274] :
		     32'd0;
    endcase
  end
  always@(stage1_rg_stage_input or
	  _theResult_____1_fst__h8919 or
	  rd_val___1__h8887 or
	  rd_val___1__h8894 or rd_val___1__h8901 or rd_val___1__h8908)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b010: _theResult_____1_fst__h8891 = rd_val___1__h8887;
      3'b011: _theResult_____1_fst__h8891 = rd_val___1__h8894;
      3'b100: _theResult_____1_fst__h8891 = rd_val___1__h8901;
      3'b110: _theResult_____1_fst__h8891 = rd_val___1__h8908;
      default: _theResult_____1_fst__h8891 = _theResult_____1_fst__h8919;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q16 = 2'd1;
      7'b0010011,
      7'b0010111,
      7'b0110011,
      7'b0110111,
      7'b1100011,
      7'b1100111,
      7'b1101111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q16 = 2'd0;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q16 = 2'd2;
    endcase
  end
  always@(stage1_rg_stage_input or
	  alu_outputs___1_val1__h8483 or
	  alu_outputs___1_val1__h8223 or rd_val__h8244 or rd_val__h8230)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d640 =
	      alu_outputs___1_val1__h8223;
      7'b0010111:
	  IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d640 =
	      rd_val__h8244;
      7'b0110111:
	  IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d640 =
	      rd_val__h8230;
      default: IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d640 =
		   alu_outputs___1_val1__h8483;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d641 or
	  x_out_cf_info_fallthru_PC__h9557)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100111, 7'b1101111:
	  x_out_data_to_stage2_val1__h7930 = x_out_cf_info_fallthru_PC__h9557;
      default: x_out_data_to_stage2_val1__h7930 =
		   IF_stage1_rg_stage_input_88_BITS_151_TO_145_15_ETC___d641;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cfg_logdelay <= `BSV_ASSIGNMENT_DELAY 64'd0;
	cfg_verbosity <= `BSV_ASSIGNMENT_DELAY 4'd0;
	imem_rg_cache_addr <= `BSV_ASSIGNMENT_DELAY 32'hFFFFFFFF;
	rg_cur_priv <= `BSV_ASSIGNMENT_DELAY 2'b11;
	rg_run_on_reset <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_state <= `BSV_ASSIGNMENT_DELAY 4'd0;
	stage1_rg_full <= `BSV_ASSIGNMENT_DELAY 1'd0;
	stage2_rg_full <= `BSV_ASSIGNMENT_DELAY 1'd0;
	stage2_rg_resetting <= `BSV_ASSIGNMENT_DELAY 1'd0;
	stage3_rg_full <= `BSV_ASSIGNMENT_DELAY 1'd0;
	stageD_rg_full <= `BSV_ASSIGNMENT_DELAY 1'd0;
	stageF_rg_epoch <= `BSV_ASSIGNMENT_DELAY 2'd0;
	stageF_rg_full <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (cfg_logdelay$EN)
	  cfg_logdelay <= `BSV_ASSIGNMENT_DELAY cfg_logdelay$D_IN;
	if (cfg_verbosity$EN)
	  cfg_verbosity <= `BSV_ASSIGNMENT_DELAY cfg_verbosity$D_IN;
	if (imem_rg_cache_addr$EN)
	  imem_rg_cache_addr <= `BSV_ASSIGNMENT_DELAY imem_rg_cache_addr$D_IN;
	if (rg_cur_priv$EN)
	  rg_cur_priv <= `BSV_ASSIGNMENT_DELAY rg_cur_priv$D_IN;
	if (rg_run_on_reset$EN)
	  rg_run_on_reset <= `BSV_ASSIGNMENT_DELAY rg_run_on_reset$D_IN;
	if (rg_state$EN) rg_state <= `BSV_ASSIGNMENT_DELAY rg_state$D_IN;
	if (stage1_rg_full$EN)
	  stage1_rg_full <= `BSV_ASSIGNMENT_DELAY stage1_rg_full$D_IN;
	if (stage2_rg_full$EN)
	  stage2_rg_full <= `BSV_ASSIGNMENT_DELAY stage2_rg_full$D_IN;
	if (stage2_rg_resetting$EN)
	  stage2_rg_resetting <= `BSV_ASSIGNMENT_DELAY
	      stage2_rg_resetting$D_IN;
	if (stage3_rg_full$EN)
	  stage3_rg_full <= `BSV_ASSIGNMENT_DELAY stage3_rg_full$D_IN;
	if (stageD_rg_full$EN)
	  stageD_rg_full <= `BSV_ASSIGNMENT_DELAY stageD_rg_full$D_IN;
	if (stageF_rg_epoch$EN)
	  stageF_rg_epoch <= `BSV_ASSIGNMENT_DELAY stageF_rg_epoch$D_IN;
	if (stageF_rg_full$EN)
	  stageF_rg_full <= `BSV_ASSIGNMENT_DELAY stageF_rg_full$D_IN;
      end
    if (imem_rg_cache_b16$EN)
      imem_rg_cache_b16 <= `BSV_ASSIGNMENT_DELAY imem_rg_cache_b16$D_IN;
    if (imem_rg_f3$EN) imem_rg_f3 <= `BSV_ASSIGNMENT_DELAY imem_rg_f3$D_IN;
    if (imem_rg_mstatus_MXR$EN)
      imem_rg_mstatus_MXR <= `BSV_ASSIGNMENT_DELAY imem_rg_mstatus_MXR$D_IN;
    if (imem_rg_pc$EN) imem_rg_pc <= `BSV_ASSIGNMENT_DELAY imem_rg_pc$D_IN;
    if (imem_rg_priv$EN)
      imem_rg_priv <= `BSV_ASSIGNMENT_DELAY imem_rg_priv$D_IN;
    if (imem_rg_satp$EN)
      imem_rg_satp <= `BSV_ASSIGNMENT_DELAY imem_rg_satp$D_IN;
    if (imem_rg_sstatus_SUM$EN)
      imem_rg_sstatus_SUM <= `BSV_ASSIGNMENT_DELAY imem_rg_sstatus_SUM$D_IN;
    if (imem_rg_tval$EN)
      imem_rg_tval <= `BSV_ASSIGNMENT_DELAY imem_rg_tval$D_IN;
    if (rg_csr_pc$EN) rg_csr_pc <= `BSV_ASSIGNMENT_DELAY rg_csr_pc$D_IN;
    if (rg_csr_val1$EN) rg_csr_val1 <= `BSV_ASSIGNMENT_DELAY rg_csr_val1$D_IN;
    if (rg_epoch$EN) rg_epoch <= `BSV_ASSIGNMENT_DELAY rg_epoch$D_IN;
    if (rg_mstatus_MXR$EN)
      rg_mstatus_MXR <= `BSV_ASSIGNMENT_DELAY rg_mstatus_MXR$D_IN;
    if (rg_next_pc$EN) rg_next_pc <= `BSV_ASSIGNMENT_DELAY rg_next_pc$D_IN;
    if (rg_sstatus_SUM$EN)
      rg_sstatus_SUM <= `BSV_ASSIGNMENT_DELAY rg_sstatus_SUM$D_IN;
    if (rg_start_CPI_cycles$EN)
      rg_start_CPI_cycles <= `BSV_ASSIGNMENT_DELAY rg_start_CPI_cycles$D_IN;
    if (rg_start_CPI_instrs$EN)
      rg_start_CPI_instrs <= `BSV_ASSIGNMENT_DELAY rg_start_CPI_instrs$D_IN;
    if (rg_trap_info$EN)
      rg_trap_info <= `BSV_ASSIGNMENT_DELAY rg_trap_info$D_IN;
    if (rg_trap_instr$EN)
      rg_trap_instr <= `BSV_ASSIGNMENT_DELAY rg_trap_instr$D_IN;
    if (rg_trap_interrupt$EN)
      rg_trap_interrupt <= `BSV_ASSIGNMENT_DELAY rg_trap_interrupt$D_IN;
    if (stage1_rg_stage_input$EN)
      stage1_rg_stage_input <= `BSV_ASSIGNMENT_DELAY
	  stage1_rg_stage_input$D_IN;
    if (stage2_rg_stage2$EN)
      stage2_rg_stage2 <= `BSV_ASSIGNMENT_DELAY stage2_rg_stage2$D_IN;
    if (stage3_rg_stage3$EN)
      stage3_rg_stage3 <= `BSV_ASSIGNMENT_DELAY stage3_rg_stage3$D_IN;
    if (stageD_rg_data$EN)
      stageD_rg_data <= `BSV_ASSIGNMENT_DELAY stageD_rg_data$D_IN;
    if (stageF_rg_priv$EN)
      stageF_rg_priv <= `BSV_ASSIGNMENT_DELAY stageF_rg_priv$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cfg_logdelay = 64'hAAAAAAAAAAAAAAAA;
    cfg_verbosity = 4'hA;
    imem_rg_cache_addr = 32'hAAAAAAAA;
    imem_rg_cache_b16 = 16'hAAAA;
    imem_rg_f3 = 3'h2;
    imem_rg_mstatus_MXR = 1'h0;
    imem_rg_pc = 32'hAAAAAAAA;
    imem_rg_priv = 2'h2;
    imem_rg_satp = 32'hAAAAAAAA;
    imem_rg_sstatus_SUM = 1'h0;
    imem_rg_tval = 32'hAAAAAAAA;
    rg_csr_pc = 32'hAAAAAAAA;
    rg_csr_val1 = 32'hAAAAAAAA;
    rg_cur_priv = 2'h2;
    rg_epoch = 2'h2;
    rg_mstatus_MXR = 1'h0;
    rg_next_pc = 32'hAAAAAAAA;
    rg_run_on_reset = 1'h0;
    rg_sstatus_SUM = 1'h0;
    rg_start_CPI_cycles = 64'hAAAAAAAAAAAAAAAA;
    rg_start_CPI_instrs = 64'hAAAAAAAAAAAAAAAA;
    rg_state = 4'hA;
    rg_trap_info = 68'hAAAAAAAAAAAAAAAAA;
    rg_trap_instr = 32'hAAAAAAAA;
    rg_trap_interrupt = 1'h0;
    stage1_rg_full = 1'h0;
    stage1_rg_stage_input =
	306'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    stage2_rg_full = 1'h0;
    stage2_rg_resetting = 1'h0;
    stage2_rg_stage2 = 169'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    stage3_rg_full = 1'h0;
    stage3_rg_stage3 = 104'hAAAAAAAAAAAAAAAAAAAAAAAAAA;
    stageD_rg_data = 138'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    stageD_rg_full = 1'h0;
    stageF_rg_epoch = 2'h2;
    stageF_rg_full = 1'h0;
    stageF_rg_priv = 2'h2;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$display("================================================================");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$display("%0d: Pipeline State:  minstret:%0d  cur_priv:%0d  mstatus:%0x  epoch:%0d",
		 csr_regfile$read_csr_mcycle,
		 csr_regfile$read_csr_minstret,
		 rg_cur_priv,
		 csr_regfile$read_mstatus,
		 rg_epoch);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$write("MStatus{",
	       "sd:%0d",
	       csr_regfile$read_mstatus[14:13] == 2'h3 ||
	       csr_regfile$read_mstatus[16:15] == 2'h3);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && csr_regfile$read_misa[27:26] == 2'd2)
	$write(" sxl:%0d uxl:%0d", 2'd0, 2'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && csr_regfile$read_misa[27:26] != 2'd2)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$write(" tsr:%0d", csr_regfile$read_mstatus[22]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$write(" tw:%0d", csr_regfile$read_mstatus[21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$write(" tvm:%0d", csr_regfile$read_mstatus[20]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$write(" mxr:%0d", csr_regfile$read_mstatus[19]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$write(" sum:%0d", csr_regfile$read_mstatus[18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$write(" mprv:%0d", csr_regfile$read_mstatus[17]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$write(" xs:%0d", csr_regfile$read_mstatus[16:15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$write(" fs:%0d", csr_regfile$read_mstatus[14:13]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$write(" mpp:%0d", csr_regfile$read_mstatus[12:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$write(" spp:%0d", csr_regfile$read_mstatus[8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$write(" pies:%0d_%0d%0d",
	       csr_regfile$read_mstatus[7],
	       csr_regfile$read_mstatus[5],
	       csr_regfile$read_mstatus[4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$write(" ies:%0d_%0d%0d",
	       csr_regfile$read_mstatus[3],
	       csr_regfile$read_mstatus[1],
	       csr_regfile$read_mstatus[0]);
    if (RST_N != `BSV_RESET_VALUE) if (WILL_FIRE_RL_rl_show_pipe) $write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("    Stage3: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("Output_Stage3");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage3_rg_full) $write(" PIPE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage3_rg_full) $write(" EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        Bypass  to Stage1: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("Bypass {");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  (!stage3_rg_full || !stage3_rg_stage3[37]))
	$write("Rd -");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage3_rg_full && stage3_rg_stage3[37])
	$write("Rd %0d ",
	       stage3_rg_stage3[36:32],
	       "rd_val:%h",
	       stage3_rg_stage3[31:0]);
    if (RST_N != `BSV_RESET_VALUE) if (WILL_FIRE_RL_rl_show_pipe) $write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$display("    Stage2: pc 0x%08h instr 0x%08h priv %0d",
		 stage2_rg_stage2[166:135],
		 stage2_rg_stage2[134:103],
		 stage2_rg_stage2[168:167]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("Output_Stage2", " EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("Output_Stage2", " BUSY: pc:%0h", stage2_rg_stage2[166:135]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write("Output_Stage2", " NONPIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("Output_Stage2", " PIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("data_to_Stage3 {pc:%h  instr:%h  priv:%0d\n",
	       stage2_rg_stage2[166:135],
	       stage2_rg_stage2[134:103],
	       stage2_rg_stage2[168:167]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("        rd_valid:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3 &&
	  stage2_rg_stage2[102:101] != 2'd0 &&
	  (!near_mem$dmem_valid || near_mem$dmem_exc))
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d145)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("  grd:%0d  rd_val:%h\n",
	       x_out_data_to_stage3_rd__h7354,
	       x_out_data_to_stage3_rd_val__h7355);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write("Trap_Info { ", "epc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write("'h%h", stage2_rg_stage2[166:135]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write("'h%h", near_mem$dmem_exc_code);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write(", ", "tval: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write("'h%h", stage2_rg_stage2[95:64], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write("Trap_Info { ", "epc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write("'h%h", stage2_rg_stage2[166:135]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write("'h%h", near_mem$dmem_exc_code);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write(", ", "tval: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd3)
	$write("'h%h", stage2_rg_stage2[95:64], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd1 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        Bypass  to Stage1: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("Bypass {");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177 == 2'd0)
	$write("Rd -");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177 != 2'd0)
	$write("Rd %0d ", stage2_rg_stage2[100:96]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177 == 2'd1)
	$write("-");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177 != 2'd0 &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d177 != 2'd1)
	$write("rd_val:%h", stage2_rg_stage2[63:32]);
    if (RST_N != `BSV_RESET_VALUE) if (WILL_FIRE_RL_rl_show_pipe) $write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$display("    Stage1: pc 0x%08h instr 0x%08h priv %0d",
		 stage1_rg_stage_input[305:274],
		 stage1_rg_stage_input[231:200],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("Output_Stage1",
	       " BUSY pc:%h",
	       stage1_rg_stage_input[305:274]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("Output_Stage1",
	       " NONPIPE: pc:%h",
	       stage1_rg_stage_input[305:274]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write("Output_Stage1");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full)
	$write("Output_Stage1", " EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write(" PIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd0)
	$write("CONTROL_DISCARD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd1)
	$write("CONTROL_STRAIGHT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd2)
	$write("CONTROL_BRANCH");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd3)
	$write("CONTROL_CSRR_W");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd4)
	$write("CONTROL_CSRR_S_or_C");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd5)
	$write("CONTROL_FENCE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd6)
	$write("CONTROL_FENCE_I");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd7)
	$write("CONTROL_SFENCE_VMA");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd8)
	$write("CONTROL_MRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd9)
	$write("CONTROL_SRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd10)
	$write("CONTROL_URET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd11)
	$write("CONTROL_WFI");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d491)
	$write("CONTROL_TRAP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d503)
	$write("{", "CF_None");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d507)
	$write("{", "BR ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d513)
	$write("{");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d503)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d507)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d500 == 2'd1)
	$write("JAL [%h->%h/%h]",
	       stage1_rg_stage_input[305:274],
	       x_out_cf_info_taken_PC__h9558,
	       x_out_cf_info_fallthru_PC__h9557);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d500 == 2'd2)
	$write("JALR [%h->%h/%h]",
	       stage1_rg_stage_input[305:274],
	       x_out_cf_info_taken_PC__h9558,
	       x_out_cf_info_fallthru_PC__h9557);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d503)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d507)
	if (stage1_rg_stage_input[151:145] != 7'b1100011 ||
	    IF_stage1_rg_stage_input_88_BITS_112_TO_110_17_ETC___d263)
	  $write("taken ");
	else
	  $write("fallthru ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d513)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d503)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d507)
	$write("[%h->%h %h]",
	       stage1_rg_stage_input[305:274],
	       x_out_cf_info_fallthru_PC__h9557,
	       x_out_cf_info_taken_PC__h9558);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d513)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write("data_to_Stage 2 {pc:%h  instr:%h  priv:%0d\n",
	       stage1_rg_stage_input[305:274],
	       stage1_rg_stage_input[231:200],
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write("            op_stage2:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_stage1_rg_full_87_THEN_IF_stage1_rg_stage_i_ETC___d559 == 2'd0)
	$write("OP_Stage2_ALU");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_stage1_rg_full_87_THEN_IF_stage1_rg_stage_i_ETC___d559 == 2'd1)
	$write("OP_Stage2_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d362) &&
	  IF_stage1_rg_full_87_THEN_IF_stage1_rg_stage_i_ETC___d559 != 2'd0 &&
	  IF_stage1_rg_full_87_THEN_IF_stage1_rg_stage_i_ETC___d559 != 2'd1)
	$write("OP_Stage2_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write("  rd:%0d\n", x_out_data_to_stage2_rd__h7928);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write("            addr:%h  val1:%h  val2:%h}",
	       x_out_data_to_stage2_addr__h7929,
	       x_out_data_to_stage2_val1__h7930,
	       x_out_data_to_stage2_val2__h7931);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd0)
	$write("CONTROL_DISCARD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd1)
	$write("CONTROL_STRAIGHT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd2)
	$write("CONTROL_BRANCH");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd3)
	$write("CONTROL_CSRR_W");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd4)
	$write("CONTROL_CSRR_S_or_C");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd5)
	$write("CONTROL_FENCE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd6)
	$write("CONTROL_FENCE_I");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd7)
	$write("CONTROL_SFENCE_VMA");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd8)
	$write("CONTROL_MRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd9)
	$write("CONTROL_SRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd10)
	$write("CONTROL_URET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324 &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd11)
	$write("CONTROL_WFI");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d672)
	$write("CONTROL_TRAP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("Trap_Info { ", "epc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("'h%h", stage1_rg_stage_input[305:274]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("'h%h", x_out_trap_info_exc_code__h9391);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write(", ", "tval: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 &&
	  NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d324)
	$write("'h%h", value__h9431, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_87_AND_NOT_stage1_rg_stage_inpu_ETC___d365)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d208)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  !IF_IF_stage1_rg_stage_input_88_BITS_151_TO_145_ETC___d719)
	$write("\n        redirect next_pc:%h", x_out_next_pc__h7886);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_88_BITS_271_TO_270_8_ETC___d328 &&
	  IF_IF_stage1_rg_stage_input_88_BITS_151_TO_145_ETC___d719)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$display("    StageD: pc 0x%08h instr 0x%08h priv %0d epoch %0d",
		 stageD_rg_data[137:106],
		 x_out_data_to_stage1_instr__h10055,
		 stageD_rg_data[103:102],
		 stageD_rg_data[105:104]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("Output_StageD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full) $write(" PIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageD_rg_full) $write(" EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && stageD_rg_data[100])
	$write("data_to_Stage1 {pc:%0h  priv:%0d  epoch:%0d",
	       stageD_rg_data[137:106],
	       stageD_rg_data[103:102],
	       stageD_rg_data[105:104]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && !stageD_rg_data[100])
	$write("data_to_Stage1 {pc:%0h  priv:%0d  epoch:%0d",
	       stageD_rg_data[137:106],
	       stageD_rg_data[103:102],
	       stageD_rg_data[105:104]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageD_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && stageD_rg_data[100])
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  !stageD_rg_data[100] &&
	  stageD_rg_data[101])
	$write("  instr_C:%0h", stageD_rg_data[47:32]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  !stageD_rg_data[100] &&
	  !stageD_rg_data[101])
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageD_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && stageD_rg_data[100])
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && !stageD_rg_data[100])
	$write("  instr:%0h  pred_pc:%0h",
	       x_out_data_to_stage1_instr__h10055,
	       stageD_rg_data[31:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageD_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && stageD_rg_data[100])
	$write("  ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && !stageD_rg_data[100])
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageD_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[100] &&
	  stageD_rg_data[99:96] == 4'd0)
	$write("INSTRUCTION_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[100] &&
	  stageD_rg_data[99:96] == 4'd1)
	$write("INSTRUCTION_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[100] &&
	  stageD_rg_data[99:96] == 4'd2)
	$write("ILLEGAL_INSTRUCTION");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[100] &&
	  stageD_rg_data[99:96] == 4'd3)
	$write("BREAKPOINT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[100] &&
	  stageD_rg_data[99:96] == 4'd4)
	$write("LOAD_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[100] &&
	  stageD_rg_data[99:96] == 4'd5)
	$write("LOAD_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[100] &&
	  stageD_rg_data[99:96] == 4'd6)
	$write("STORE_AMO_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[100] &&
	  stageD_rg_data[99:96] == 4'd7)
	$write("STORE_AMO_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[100] &&
	  stageD_rg_data[99:96] == 4'd8)
	$write("ECALL_FROM_U");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[100] &&
	  stageD_rg_data[99:96] == 4'd9)
	$write("ECALL_FROM_S");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[100] &&
	  stageD_rg_data[99:96] == 4'd11)
	$write("ECALL_FROM_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[100] &&
	  stageD_rg_data[99:96] == 4'd12)
	$write("INSTRUCTION_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[100] &&
	  stageD_rg_data[99:96] == 4'd13)
	$write("LOAD_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[100] &&
	  stageD_rg_data[99:96] == 4'd15)
	$write("STORE_AMO_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[100] &&
	  stageD_rg_data[99:96] != 4'd0 &&
	  stageD_rg_data[99:96] != 4'd1 &&
	  stageD_rg_data[99:96] != 4'd2 &&
	  stageD_rg_data[99:96] != 4'd3 &&
	  stageD_rg_data[99:96] != 4'd4 &&
	  stageD_rg_data[99:96] != 4'd5 &&
	  stageD_rg_data[99:96] != 4'd6 &&
	  stageD_rg_data[99:96] != 4'd7 &&
	  stageD_rg_data[99:96] != 4'd8 &&
	  stageD_rg_data[99:96] != 4'd9 &&
	  stageD_rg_data[99:96] != 4'd11 &&
	  stageD_rg_data[99:96] != 4'd12 &&
	  stageD_rg_data[99:96] != 4'd13 &&
	  stageD_rg_data[99:96] != 4'd15)
	$write("unknown trap Exc_Code %d", stageD_rg_data[99:96]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && !stageD_rg_data[100])
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageD_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && stageD_rg_data[100])
	$write(" tval %0h", stageD_rg_data[95:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && !stageD_rg_data[100])
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageD_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full) $write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageD_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$display("    StageF: pc 0x%08h instr 0x%08h priv %0d epoch %0d",
		 imem_rg_pc,
		 d_instr__h15539,
		 stageF_rg_priv,
		 stageF_rg_epoch);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("Output_StageF");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1118))
	$write(" BUSY: pc:%h", imem_rg_pc);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125)
	$write(" PIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write(" EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1118))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125)
	$write("data_to_StageD {pc:%h  priv:%0d  epoch:%0d",
	       imem_rg_pc,
	       stageF_rg_priv,
	       stageF_rg_epoch);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1118))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc)
	$write("  ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_100_AND_near_mem_imem_valid_AND_ETC___d1132)
	$write("  instr:%h  pred_pc:%h",
	       d_instr__h15539,
	       stageF_branch_predictor$predict_rsp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1118))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc &&
	  near_mem$imem_exc_code == 4'd0)
	$write("INSTRUCTION_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc &&
	  near_mem$imem_exc_code == 4'd1)
	$write("INSTRUCTION_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc &&
	  near_mem$imem_exc_code == 4'd2)
	$write("ILLEGAL_INSTRUCTION");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc &&
	  near_mem$imem_exc_code == 4'd3)
	$write("BREAKPOINT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc &&
	  near_mem$imem_exc_code == 4'd4)
	$write("LOAD_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc &&
	  near_mem$imem_exc_code == 4'd5)
	$write("LOAD_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc &&
	  near_mem$imem_exc_code == 4'd6)
	$write("STORE_AMO_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc &&
	  near_mem$imem_exc_code == 4'd7)
	$write("STORE_AMO_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc &&
	  near_mem$imem_exc_code == 4'd8)
	$write("ECALL_FROM_U");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc &&
	  near_mem$imem_exc_code == 4'd9)
	$write("ECALL_FROM_S");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc &&
	  near_mem$imem_exc_code == 4'd11)
	$write("ECALL_FROM_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc &&
	  near_mem$imem_exc_code == 4'd12)
	$write("INSTRUCTION_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc &&
	  near_mem$imem_exc_code == 4'd13)
	$write("LOAD_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc &&
	  near_mem$imem_exc_code == 4'd15)
	$write("STORE_AMO_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem_imem_valid_AND_near_mem_imem_exc__1_A_ETC___d1220)
	$write("unknown trap Exc_Code %d", near_mem$imem_exc_code);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_100_AND_near_mem_imem_valid_AND_ETC___d1132)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1118))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1125)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $display("----------------");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage2_nonpipe &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_stage2_nonpipe -> CPU_TRAP",
		 csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_trap &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_stage1_trap", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  rg_trap_info_534_BITS_67_TO_36_535_EQ_csr_regf_ETC___d1544)
	$display("%0d: %m.rl_stage1_trap: Tight infinite trap loop: pc 0x%0x instr 0x%08x",
		 csr_regfile$read_csr_mcycle,
		 csr_regfile$csr_trap_actions[97:66],
		 rg_trap_instr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  rg_trap_info_534_BITS_67_TO_36_535_EQ_csr_regf_ETC___d1544)
	$display("CPI: %0d.%0d = (%0d/%0d) since last 'continue'",
		 cpi__h21611,
		 cpifrac__h21612,
		 delta_CPI_cycles__h21607,
		 _theResult____h21609);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  rg_trap_info_534_BITS_67_TO_36_535_EQ_csr_regf_ETC___d1544)
	$finish(32'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  (cur_verbosity__h3701 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 rg_trap_info[67:36],
		 rg_trap_instr,
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap && cur_verbosity__h3701 != 4'd0)
	$display("    mcause:0x%0h  epc 0x%0h  tval:0x%0h  next_pc 0x%0h, new_priv %0d new_mstatus 0x%0h",
		 csr_regfile$csr_trap_actions[33:2],
		 rg_trap_info[67:36],
		 rg_trap_info[31:0],
		 csr_regfile$csr_trap_actions[97:66],
		 csr_regfile$csr_trap_actions[1:0],
		 csr_regfile$csr_trap_actions[65:34]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_stage1_CSRR_W", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W_2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_stage1_CSRR_W_2", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W_2 && csr_regfile$access_permitted_1 &&
	  (cur_verbosity__h3701 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 rg_csr_pc,
		 rg_trap_instr,
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W_2 && csr_regfile$access_permitted_1 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    S1: write CSRRW/CSRRWI Rs1 %0d Rs1_val 0x%0h csr 0x%0h csr_val 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h22085,
		 rg_trap_instr[31:20],
		 csr_regfile$read_csr[31:0],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W_2 &&
	  !csr_regfile$access_permitted_1 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    Trap on CSR permissions: Rs1 %0d Rs1_val 0x%0h csr 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h22085,
		 rg_trap_instr[31:20],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_stage1_CSRR_S_or_C",
		 csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_stage1_CSRR_S_or_C_2",
		 csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	  csr_regfile$access_permitted_2 &&
	  (cur_verbosity__h3701 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 rg_csr_pc,
		 rg_trap_instr,
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	  csr_regfile$access_permitted_2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    S1: write CSRR_S_or_C: Rs1 %0d Rs1_val 0x%0h csr 0x%0h csr_val 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h22768,
		 rg_trap_instr[31:20],
		 csr_regfile$read_csr[31:0],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	  !csr_regfile$access_permitted_2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    Trap on CSR permissions: Rs1 %0d Rs1_val 0x%0h csr 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h22768,
		 rg_trap_instr[31:20],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_restart_after_csrrx &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_stage1_restart_after_csrrx",
		 csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_restart_after_csrrx &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h16901,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_restart_after_csrrx &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       1'd0,
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_restart_after_csrrx &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_restart_after_csrrx &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h16901);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_xRET &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_stage1_xRET", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_xRET &&
	  (cur_verbosity__h3701 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[305:274],
		 stage1_rg_stage_input[231:200],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_xRET && cur_verbosity__h3701 != 4'd0)
	$display("    xRET: next_pc:0x%0h  new mstatus:0x%0h  new priv:%0d",
		 csr_regfile$csr_ret_actions[65:34],
		 csr_regfile$csr_ret_actions[31:0],
		 csr_regfile$csr_ret_actions[33:32]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_stage1_FENCE_I", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_finish_FENCE_I", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  (cur_verbosity__h3701 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[305:274],
		 stage1_rg_stage_input[231:200],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h16901,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       1'd0,
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h16901);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_stage1_FENCE", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_finish_FENCE", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  (cur_verbosity__h3701 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[305:274],
		 stage1_rg_stage_input[231:200],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h16901,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       1'd0,
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h16901);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_WFI &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_stage1_WFI", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_WFI &&
	  (cur_verbosity__h3701 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[305:274],
		 stage1_rg_stage_input[231:200],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_WFI &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    CPU.rl_stage1_WFI");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_WFI_resume &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_WFI_resume", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_WFI_resume &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h16901,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_WFI_resume &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       1'd0,
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_WFI_resume &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_WFI_resume &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h16901);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_from_WFI &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_reset_from_WFI", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap_fetch &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h16901,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap_fetch &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       1'd0,
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap_fetch &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap_fetch &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h16901);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_interrupt &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_stage1_interrupt", csr_regfile$read_csr_mcycle);
    if (WILL_FIRE_RL_imem_rl_assert_fail)
      begin
        v__h2516 = $stime;
	#0;
      end
    v__h2510 = v__h2516 / 32'd10;
    if (WILL_FIRE_RL_imem_rl_assert_fail)
      $display("%0d: ERROR: CPU_Fetch_C: imem32.is_i32_not_i16 is False",
	       v__h2510);
    if (WILL_FIRE_RL_imem_rl_assert_fail) $finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset)
	$display("%0d: %m.rl_reset_complete: restart at PC = 0x%0h",
		 csr_regfile$read_csr_mcycle,
		 soc_map$m_pc_reset_value[31:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       soc_map$m_pc_reset_value[31:0],
	       new_epoch__h16901,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       1'd0,
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_minstret,
		 soc_map$m_pc_reset_value[31:0],
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h16901);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && !rg_run_on_reset)
	$display("%0d: %m.rl_reset_complete: entering DEBUG_MODE",
		 csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_pipe", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe && stage3_rg_full && stage3_rg_stage3[37] &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    S3.fa_deq: write GRd 0x%0h, rd_val 0x%0h",
		 stage3_rg_stage3[36:32],
		 stage3_rg_stage3[31:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("    S3.enq: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("data_to_Stage3 {pc:%h  instr:%h  priv:%0d\n",
	       stage2_rg_stage2[166:135],
	       stage2_rg_stage2[134:103],
	       stage2_rg_stage2[168:167]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("        rd_valid:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 &&
	  stage2_rg_stage2[102:101] != 2'd0 &&
	  (!near_mem$dmem_valid || near_mem$dmem_exc))
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d1359)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("  grd:%0d  rd_val:%h\n",
	       x_out_data_to_stage3_rd__h7354,
	       x_out_data_to_stage3_rd_val__h7355);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_9_THEN_IF_stage2_rg_stage2_0_ETC___d122 == 2'd2 &&
	  (cur_verbosity__h3701 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage2_rg_stage2[166:135],
		 stage2_rg_stage2[134:103],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1368 &&
	  stage1_rg_full &&
	  (!stage1_rg_stage_input_88_BITS_271_TO_270_89_EQ_ETC___d190 ||
	   NOT_IF_stage2_rg_full_9_THEN_IF_stage2_rg_stag_ETC___d1304) &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 == 4'd0 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    rl_pipe: Discarding stage1 due to redirection");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1395)
	$write("    CPU_Stage2.enq (Data_Stage1_to_Stage2) ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1395)
	$write("data_to_Stage 2 {pc:%h  instr:%h  priv:%0d\n",
	       stage1_rg_stage_input[305:274],
	       stage1_rg_stage_input[231:200],
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1395)
	$write("            op_stage2:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1375 &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 != 4'd0 &&
	  IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d1378 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 &&
	  IF_stage1_rg_full_87_THEN_IF_stage1_rg_stage_i_ETC___d559 == 2'd0)
	$write("OP_Stage2_ALU");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1375 &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 != 4'd0 &&
	  IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d1378 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 &&
	  IF_stage1_rg_full_87_THEN_IF_stage1_rg_stage_i_ETC___d559 == 2'd1)
	$write("OP_Stage2_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1375 &&
	  IF_stage1_rg_stage_input_88_BITS_271_TO_270_89_ETC___d418 != 4'd0 &&
	  IF_NOT_stage1_rg_full_87_66_OR_NOT_stage1_rg_s_ETC___d1378 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 &&
	  IF_stage1_rg_full_87_THEN_IF_stage1_rg_stage_i_ETC___d559 != 2'd0 &&
	  IF_stage1_rg_full_87_THEN_IF_stage1_rg_stage_i_ETC___d559 != 2'd1)
	$write("OP_Stage2_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1395)
	$write("  rd:%0d\n", x_out_data_to_stage2_rd__h7928);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1395)
	$write("            addr:%h  val1:%h  val2:%h}",
	       x_out_data_to_stage2_addr__h7929,
	       x_out_data_to_stage2_val1__h7930,
	       x_out_data_to_stage2_val2__h7931);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1395)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1413 &&
	  stageD_rg_full &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    CPU_Stage1.enq: 0x%08h", stageD_rg_data[137:106]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1454 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    CPU_StageD.enq (Data_StageF_to_StageD)");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1454 &&
	  csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1471)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       stageF_branch_predictor$predict_rsp,
	       stageF_rg_epoch,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1454 &&
	  csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1471)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       1'd0,
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1454 &&
	  csr_regfile_interrupt_pending_rg_cur_priv_4_29_ETC___d1471)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_start)
	$display("================================================================");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_start)
	$write("CPU: Bluespec  RISC-V  Flute  v3.0");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_start) $display(" (RV32)");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_start)
	$display("Copyright (c) 2016-2020 Bluespec, Inc. All Rights Reserved.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_start)
	$display("================================================================");
  end
  // synopsys translate_on
endmodule