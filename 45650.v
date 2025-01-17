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
  reg [63 : 0] imem_rg_cache_addr;
  reg [63 : 0] imem_rg_cache_addr$D_IN;
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
  reg [63 : 0] imem_rg_pc;
  reg [63 : 0] imem_rg_pc$D_IN;
  wire imem_rg_pc$EN;
  // register imem_rg_priv
  reg [1 : 0] imem_rg_priv;
  wire [1 : 0] imem_rg_priv$D_IN;
  wire imem_rg_priv$EN;
  // register imem_rg_satp
  reg [63 : 0] imem_rg_satp;
  wire [63 : 0] imem_rg_satp$D_IN;
  wire imem_rg_satp$EN;
  // register imem_rg_sstatus_SUM
  reg imem_rg_sstatus_SUM;
  wire imem_rg_sstatus_SUM$D_IN, imem_rg_sstatus_SUM$EN;
  // register imem_rg_tval
  reg [63 : 0] imem_rg_tval;
  reg [63 : 0] imem_rg_tval$D_IN;
  wire imem_rg_tval$EN;
  // register rg_csr_pc
  reg [63 : 0] rg_csr_pc;
  wire [63 : 0] rg_csr_pc$D_IN;
  wire rg_csr_pc$EN;
  // register rg_csr_val1
  reg [63 : 0] rg_csr_val1;
  wire [63 : 0] rg_csr_val1$D_IN;
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
  reg [63 : 0] rg_next_pc;
  reg [63 : 0] rg_next_pc$D_IN;
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
  reg [131 : 0] rg_trap_info;
  reg [131 : 0] rg_trap_info$D_IN;
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
  reg [401 : 0] stage1_rg_stage_input;
  wire [401 : 0] stage1_rg_stage_input$D_IN;
  wire stage1_rg_stage_input$EN;
  // register stage2_rg_full
  reg stage2_rg_full;
  reg stage2_rg_full$D_IN;
  wire stage2_rg_full$EN;
  // register stage2_rg_resetting
  reg stage2_rg_resetting;
  wire stage2_rg_resetting$D_IN, stage2_rg_resetting$EN;
  // register stage2_rg_stage2
  reg [297 : 0] stage2_rg_stage2;
  wire [297 : 0] stage2_rg_stage2$D_IN;
  wire stage2_rg_stage2$EN;
  // register stage3_rg_full
  reg stage3_rg_full;
  reg stage3_rg_full$D_IN;
  wire stage3_rg_full$EN;
  // register stage3_rg_stage3
  reg [167 : 0] stage3_rg_stage3;
  wire [167 : 0] stage3_rg_stage3$D_IN;
  wire stage3_rg_stage3$EN;
  // register stageD_rg_data
  reg [233 : 0] stageD_rg_data;
  wire [233 : 0] stageD_rg_data$D_IN;
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
  wire [193 : 0] csr_regfile$csr_trap_actions;
  wire [129 : 0] csr_regfile$csr_ret_actions;
  wire [64 : 0] csr_regfile$read_csr;
  wire [63 : 0] csr_regfile$csr_trap_actions_pc,
		csr_regfile$csr_trap_actions_xtval,
		csr_regfile$mav_csr_write_word,
		csr_regfile$read_csr_mcycle,
		csr_regfile$read_csr_minstret,
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
  wire [63 : 0] gpr_regfile$read_rs1,
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
  reg [63 : 0] near_mem$imem_req_addr;
  reg [1 : 0] near_mem$dmem_req_op;
  wire [511 : 0] near_mem$dma_server_rdata, near_mem$dma_server_wdata;
  wire [63 : 0] near_mem$dma_server_araddr,
		near_mem$dma_server_awaddr,
		near_mem$dma_server_wstrb,
		near_mem$dmem_req_addr,
		near_mem$dmem_req_satp,
		near_mem$dmem_req_store_value,
		near_mem$dmem_word64,
		near_mem$imem_master_araddr,
		near_mem$imem_master_awaddr,
		near_mem$imem_master_rdata,
		near_mem$imem_master_wdata,
		near_mem$imem_pc,
		near_mem$imem_req_satp,
		near_mem$mem_master_araddr,
		near_mem$mem_master_awaddr,
		near_mem$mem_master_rdata,
		near_mem$mem_master_wdata,
		near_mem$mv_tohost_value,
		near_mem$set_watch_tohost_tohost_addr;
  wire [31 : 0] near_mem$imem_instr;
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
  wire [6 : 0] near_mem$dmem_req_amo_funct7;
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
  // ports of submodule stage2_mbox
  wire [63 : 0] stage2_mbox$req_v1, stage2_mbox$req_v2, stage2_mbox$word;
  wire [3 : 0] stage2_mbox$set_verbosity_verbosity;
  wire [2 : 0] stage2_mbox$req_f3;
  wire stage2_mbox$EN_req,
       stage2_mbox$EN_req_reset,
       stage2_mbox$EN_rsp_reset,
       stage2_mbox$EN_set_verbosity,
       stage2_mbox$req_is_OP_not_OP_32,
       stage2_mbox$valid;
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
  reg [63 : 0] stageF_branch_predictor$predict_req_pc;
  wire [194 : 0] stageF_branch_predictor$bp_train_cf_info;
  wire [63 : 0] stageF_branch_predictor$bp_train_pc,
		stageF_branch_predictor$predict_rsp;
  wire [31 : 0] stageF_branch_predictor$bp_train_instr,
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
  reg [63 : 0] MUX_csr_regfile$mav_csr_write_2__VAL_2;
  wire [131 : 0] MUX_rg_trap_info$write_1__VAL_1,
		 MUX_rg_trap_info$write_1__VAL_2,
		 MUX_rg_trap_info$write_1__VAL_3,
		 MUX_rg_trap_info$write_1__VAL_4;
  wire [63 : 0] MUX_imem_rg_cache_addr$write_1__VAL_1,
		MUX_imem_rg_cache_addr$write_1__VAL_2,
		MUX_imem_rg_tval$write_1__VAL_1,
		MUX_imem_rg_tval$write_1__VAL_2,
		MUX_imem_rg_tval$write_1__VAL_3,
		MUX_imem_rg_tval$write_1__VAL_4,
		MUX_near_mem$imem_req_2__VAL_1,
		MUX_near_mem$imem_req_2__VAL_2,
		MUX_near_mem$imem_req_2__VAL_4;
  wire [31 : 0] MUX_rg_trap_instr$write_1__VAL_1;
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
       MUX_rg_state$write_1__SEL_11,
       MUX_rg_state$write_1__SEL_12,
       MUX_rg_state$write_1__SEL_13,
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
  reg [31 : 0] v__h2523;
  reg [31 : 0] v__h2517;
  // synopsys translate_on
  // remaining internal signals
  reg [63 : 0] CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q23,
	       IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d827,
	       _theResult_____1_fst__h9178,
	       alu_outputs___1_val1__h8460,
	       rs1_val__h24411,
	       x_out_bypass_rd_val__h7812,
	       x_out_cf_info_taken_PC__h10100,
	       x_out_data_to_stage2_addr__h8100,
	       x_out_data_to_stage2_val1__h8101,
	       x_out_data_to_stage3_rd_val__h7473;
  reg [4 : 0] x_out_bypass_rd__h7811, x_out_data_to_stage3_rd__h7472;
  reg [3 : 0] CASE_rg_cur_priv_0b0_8_0b1_9_11__q3,
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q16,
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q17,
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q18,
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q20,
	      CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_1_ETC__q19,
	      CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q4,
	      IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d541,
	      IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d544,
	      alu_outputs_exc_code__h8756;
  reg [2 : 0] CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q24,
	      CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q25;
  reg [1 : 0] CASE_stage2_rg_stage2_BITS_199_TO_197_0_2_1_IF_ETC__q5,
	      CASE_stage2_rg_stage2_BITS_199_TO_197_0_2_1_IF_ETC__q6,
	      IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d629;
  reg CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q12,
      CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q13,
      CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14,
      CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q15,
      IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d282,
      IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d408,
      IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_1_ETC___d148,
      IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_1_ETC___d157;
  wire [127 : 0] csr_regfile_read_csr_mcycle__3_MINUS_rg_start__ETC___d1791;
  wire [63 : 0] IF_csr_regfile_read_csr_rg_trap_instr_788_BITS_ETC___d1841,
		IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d658,
		IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d828,
		IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d829,
		SEXT_stage1_rg_stage_input_07_BITS_87_TO_76_05___d657,
		_theResult_____1_fst__h9171,
		_theResult_____1_fst__h9206,
		_theResult____h23252,
		_theResult___fst__h9276,
		_theResult___fst__h9283,
		_theResult___fst__h9343,
		_theResult___snd__h10433,
		addr_of_b32___1__h19040,
		addr_of_b32___1__h22169,
		addr_of_b32___1__h30369,
		addr_of_b32__h18921,
		addr_of_b32__h22050,
		addr_of_b32__h30250,
		alu_outputs___1_addr__h8255,
		alu_outputs___1_addr__h8527,
		alu_outputs___1_val1__h8382,
		alu_outputs___1_val1__h8418,
		alu_outputs___1_val1__h8439,
		alu_outputs___1_val1__h8716,
		alu_outputs___1_val1__h8736,
		alu_outputs_cf_info_fallthru_PC__h10091,
		alu_outputs_cf_info_taken_PC__h10092,
		branch_target__h8232,
		cpi__h23254,
		cpifrac__h23255,
		data_to_stage2_addr__h8090,
		delta_CPI_cycles__h23250,
		delta_CPI_instrs___1__h23287,
		delta_CPI_instrs__h23251,
		fall_through_pc__h8040,
		next_pc___1__h9715,
		next_pc__h8041,
		next_pc__h8261,
		next_pc__h8288,
		next_pc__h9712,
		rd_val___1__h10462,
		rd_val___1__h10493,
		rd_val___1__h10546,
		rd_val___1__h10575,
		rd_val___1__h10627,
		rd_val___1__h10675,
		rd_val___1__h10681,
		rd_val___1__h10726,
		rd_val___1__h9159,
		rd_val___1__h9167,
		rd_val___1__h9174,
		rd_val___1__h9181,
		rd_val___1__h9188,
		rd_val___1__h9195,
		rd_val__h10330,
		rd_val__h10381,
		rd_val__h10403,
		rd_val__h7942,
		rd_val__h8016,
		rd_val__h8467,
		rd_val__h8481,
		rs1_val__h23728,
		rs1_val_bypassed__h5229,
		rs2_val_bypassed__h5235,
		trap_info_tval__h9919,
		val__h7944,
		val__h8018,
		value__h9968,
		x__h23253,
		x_out_cf_info_fallthru_PC__h10099,
		x_out_data_to_stage2_val2__h8102,
		x_out_next_pc__h8057,
		y__h24680;
  wire [31 : 0] IF_NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem__ETC___d1322,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1168,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1169,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1171,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1173,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1175,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1177,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1178,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1179,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1181,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1182,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1183,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1185,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1187,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1188,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1190,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1191,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1192,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1193,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1194,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1195,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1196,
		IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1197,
		IF_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg_p_ETC___d1323,
		IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC__q22,
		_theResult____h5500,
		d_instr__h17070,
		instr___1__h11039,
		instr__h11208,
		instr__h11353,
		instr__h11545,
		instr__h11740,
		instr__h11969,
		instr__h12422,
		instr__h12538,
		instr__h12603,
		instr__h12920,
		instr__h13258,
		instr__h13442,
		instr__h13571,
		instr__h13798,
		instr__h14053,
		instr__h14225,
		instr__h14394,
		instr__h14583,
		instr__h14772,
		instr__h14889,
		instr__h15067,
		instr__h15186,
		instr__h15281,
		instr__h15417,
		instr__h15553,
		instr__h15689,
		instr__h15827,
		instr__h15965,
		instr__h16123,
		instr__h16219,
		instr__h16372,
		instr__h16571,
		instr__h16722,
		instr_out___1__h17072,
		instr_out___1__h17094,
		rs1_val_bypassed229_BITS_31_TO_0_MINUS_rs2_val_ETC__q11,
		rs1_val_bypassed229_BITS_31_TO_0_PLUS_rs2_val__ETC__q10,
		rs1_val_bypassed229_BITS_31_TO_0_SRL_rs2_val_b_ETC__q9,
		rs1_val_bypassed229_BITS_31_TO_0__q8,
		tmp__h10574,
		v32__h8465,
		x__h10496,
		x__h10549,
		x__h10684,
		x__h10729,
		x_out_data_to_stage1_instr__h11003;
  wire [20 : 0] SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d994,
		decoded_instr_imm21_UJ__h20722,
		stage1_rg_stage_input_BITS_30_TO_10__q2;
  wire [19 : 0] imm20__h13310;
  wire [12 : 0] SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d1019,
		decoded_instr_imm13_SB__h20720,
		stage1_rg_stage_input_BITS_63_TO_51__q1;
  wire [11 : 0] decoded_instr_imm12_S__h20719,
		imm12__h11209,
		imm12__h11546,
		imm12__h13182,
		imm12__h13851,
		imm12__h14066,
		imm12__h14262,
		imm12__h14599,
		imm12__h16220,
		imm12__h16572,
		offset__h11916,
		stage1_rg_stage_input_BITS_75_TO_64__q7,
		stage1_rg_stage_input_BITS_87_TO_76__q21;
  wire [9 : 0] decoded_instr_funct10__h20717,
	       nzimm10__h13849,
	       nzimm10__h14064;
  wire [8 : 0] offset__h12547, offset__h16134;
  wire [7 : 0] offset__h11081, offset__h16506;
  wire [6 : 0] offset__h11488;
  wire [5 : 0] imm6__h13180, shamt__h8369;
  wire [4 : 0] data_to_stage2_rd__h8089,
	       offset_BITS_4_TO_0___h11477,
	       offset_BITS_4_TO_0___h11908,
	       offset_BITS_4_TO_0___h16847,
	       rd__h11548,
	       rs1__h11547,
	       x_out_data_to_stage2_rd__h8099;
  wire [3 : 0] IF_NOT_stage1_rg_stage_input_07_BITS_112_TO_11_ETC___d493,
	       IF_rg_cur_priv_4_EQ_0b11_09_AND_stage1_rg_stag_ETC___d523,
	       IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547,
	       alu_outputs___1_exc_code__h8712,
	       cur_verbosity__h3708,
	       x_exc_code__h30643,
	       x_out_trap_info_exc_code__h9924;
  wire [2 : 0] IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693;
  wire [1 : 0] IF_NOT_near_mem_dmem_valid__25_44_OR_NOT_near__ETC___d190,
	       IF_near_mem_dmem_valid__25_THEN_IF_near_mem_dm_ETC___d128,
	       IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134,
	       IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194,
	       IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_3_ETC___d131,
	       new_epoch__h18435,
	       sxl__h6541,
	       uxl__h6542;
  wire IF_IF_stage1_rg_stage_input_07_BITS_151_TO_145_ETC___d914,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1537,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1540,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1656,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1697,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1704,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1716,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1744,
       IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1570,
       IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1604,
       IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d271,
       IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d273,
       IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d275,
       IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d402,
       IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d413,
       IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d481,
       IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d483,
       IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d1522,
       IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d211,
       IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d213,
       IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486,
       NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52,
       NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d1530,
       NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1529,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1533,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1542,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1544,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1551,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1573,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1594,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1601,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1630,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1653,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1763,
       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1305,
       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1319,
       NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1338,
       NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1345,
       NOT_rg_next_pc_852_BITS_1_TO_0_853_EQ_0b0_854__ETC___d1860,
       NOT_rg_run_on_reset_477_478_OR_imem_rg_pc_BITS_ETC___d1485,
       NOT_soc_map_m_pc_reset_value__497_BITS_1_TO_0__ETC___d1511,
       NOT_stage1_rg_full_06_90_OR_stage1_rg_stage_in_ETC___d1566,
       NOT_stage1_rg_full_06_90_OR_stage1_rg_stage_in_ETC___d1568,
       NOT_stage1_rg_stage_input_07_BITS_112_TO_110_3_ETC___d318,
       NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d1906,
       NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d1910,
       NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420,
       NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d620,
       NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d632,
       NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d636,
       NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d642,
       NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d1727,
       csr_regfile_RDY_server_reset_request_put__451__ETC___d1463,
       csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1707,
       csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1711,
       csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1714,
       csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1718,
       csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1753,
       csr_regfile_read_misa__2_BIT_2_29_AND_stageD_r_ETC___d1004,
       csr_regfile_read_misa__2_BIT_2_29_AND_stageD_r_ETC___d1010,
       imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1342,
       imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1481,
       imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d1297,
       imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17,
       near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1350,
       near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352,
       near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_299___d1300,
       near_mem_imem_valid_AND_near_mem_imem_exc__1_A_ETC___d1447,
       rg_cur_priv_4_EQ_0b11_09_OR_rg_cur_priv_4_EQ_0_ETC___d521,
       rg_state_3_EQ_12_0_AND_csr_regfile_wfi_resume__ETC___d1897,
       rg_state_3_EQ_3_553_AND_NOT_csr_regfile_interr_ETC___d1767,
       rg_state_3_EQ_3_553_AND_NOT_csr_regfile_interr_ETC___d1877,
       rg_state_3_EQ_3_553_AND_NOT_csr_regfile_interr_ETC___d1886,
       rg_state_3_EQ_3_553_AND_stage3_rg_full_4_OR_NO_ETC___d1563,
       rg_state_3_EQ_5_901_AND_NOT_stageF_rg_full_327_ETC___d1902,
       rg_state_3_EQ_8_849_AND_NOT_stageF_rg_full_327_ETC___d1850,
       rg_trap_info_777_BITS_131_TO_68_778_EQ_csr_reg_ETC___d1787,
       stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489,
       stage1_rg_stage_input_07_BITS_112_TO_110_36_EQ_ETC___d440,
       stage1_rg_stage_input_07_BITS_151_TO_145_34_EQ_ETC___d433,
       stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d1525,
       stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209,
       stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227,
       stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d864,
       stage3_rg_full_4_OR_NOT_IF_stage2_rg_full_03_T_ETC___d1561,
       stageF_f_reset_rsps_i_notEmpty__471_AND_stageD_ETC___d1491,
       stageF_rg_full_327_AND_near_mem_imem_valid_AND_ETC___d1359;
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
		      .dmem_req_amo_funct7(near_mem$dmem_req_amo_funct7),
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
  // submodule stage2_mbox
  mkRISCV_MBox stage2_mbox(.CLK(CLK),
			   .RST_N(RST_N),
			   .req_f3(stage2_mbox$req_f3),
			   .req_is_OP_not_OP_32(stage2_mbox$req_is_OP_not_OP_32),
			   .req_v1(stage2_mbox$req_v1),
			   .req_v2(stage2_mbox$req_v2),
			   .set_verbosity_verbosity(stage2_mbox$set_verbosity_verbosity),
			   .EN_set_verbosity(stage2_mbox$EN_set_verbosity),
			   .EN_req_reset(stage2_mbox$EN_req_reset),
			   .EN_rsp_reset(stage2_mbox$EN_rsp_reset),
			   .EN_req(stage2_mbox$EN_req),
			   .RDY_set_verbosity(),
			   .RDY_req_reset(),
			   .RDY_rsp_reset(),
			   .valid(stage2_mbox$valid),
			   .word(stage2_mbox$word));
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
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 ==
	     2'd3 ;
  assign WILL_FIRE_RL_rl_stage2_nonpipe = CAN_FIRE_RL_rl_stage2_nonpipe ;
  // rule RL_rl_stage1_trap
  assign CAN_FIRE_RL_rl_stage1_trap =
	     rg_state_3_EQ_3_553_AND_NOT_csr_regfile_interr_ETC___d1767 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	     4'd12 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352) ;
  assign WILL_FIRE_RL_rl_stage1_trap = CAN_FIRE_RL_rl_stage1_trap ;
  // rule RL_rl_trap
  assign CAN_FIRE_RL_rl_trap =
	     rg_state == 4'd4 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352) ;
  assign WILL_FIRE_RL_rl_trap = CAN_FIRE_RL_rl_trap ;
  // rule RL_rl_stage1_CSRR_W
  assign CAN_FIRE_RL_rl_stage1_CSRR_W = MUX_rg_state$write_1__SEL_10 ;
  assign WILL_FIRE_RL_rl_stage1_CSRR_W = MUX_rg_state$write_1__SEL_10 ;
  // rule RL_rl_stage1_CSRR_W_2
  assign CAN_FIRE_RL_rl_stage1_CSRR_W_2 = rg_state == 4'd6 ;
  assign WILL_FIRE_RL_rl_stage1_CSRR_W_2 = rg_state == 4'd6 ;
  // rule RL_rl_stage1_CSRR_S_or_C
  assign CAN_FIRE_RL_rl_stage1_CSRR_S_or_C = MUX_rg_state$write_1__SEL_11 ;
  assign WILL_FIRE_RL_rl_stage1_CSRR_S_or_C = MUX_rg_state$write_1__SEL_11 ;
  // rule RL_rl_stage1_CSRR_S_or_C_2
  assign CAN_FIRE_RL_rl_stage1_CSRR_S_or_C_2 = rg_state == 4'd7 ;
  assign WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 = rg_state == 4'd7 ;
  // rule RL_rl_stage1_restart_after_csrrx
  assign CAN_FIRE_RL_rl_stage1_restart_after_csrrx =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1481 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state_3_EQ_8_849_AND_NOT_stageF_rg_full_327_ETC___d1850 ;
  assign WILL_FIRE_RL_rl_stage1_restart_after_csrrx =
	     CAN_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // rule RL_rl_stage1_xRET
  assign CAN_FIRE_RL_rl_stage1_xRET =
	     rg_state_3_EQ_3_553_AND_NOT_csr_regfile_interr_ETC___d1767 &&
	     (IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	      4'd8 ||
	      IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	      4'd9 ||
	      IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	      4'd10) &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352) ;
  assign WILL_FIRE_RL_rl_stage1_xRET = CAN_FIRE_RL_rl_stage1_xRET ;
  // rule RL_rl_stage1_FENCE_I
  assign CAN_FIRE_RL_rl_stage1_FENCE_I = MUX_rg_state$write_1__SEL_12 ;
  assign WILL_FIRE_RL_rl_stage1_FENCE_I = MUX_rg_state$write_1__SEL_12 ;
  // rule RL_rl_finish_FENCE_I
  assign CAN_FIRE_RL_rl_finish_FENCE_I =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1481 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     near_mem$RDY_server_fence_i_response_get &&
	     rg_state == 4'd9 ;
  assign WILL_FIRE_RL_rl_finish_FENCE_I = CAN_FIRE_RL_rl_finish_FENCE_I ;
  // rule RL_rl_stage1_FENCE
  assign CAN_FIRE_RL_rl_stage1_FENCE = MUX_rg_state$write_1__SEL_13 ;
  assign WILL_FIRE_RL_rl_stage1_FENCE = MUX_rg_state$write_1__SEL_13 ;
  // rule RL_rl_finish_FENCE
  assign CAN_FIRE_RL_rl_finish_FENCE =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1481 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     near_mem$RDY_server_fence_response_get &&
	     rg_state == 4'd10 ;
  assign WILL_FIRE_RL_rl_finish_FENCE = CAN_FIRE_RL_rl_finish_FENCE ;
  // rule RL_rl_stage1_WFI
  assign CAN_FIRE_RL_rl_stage1_WFI =
	     rg_state_3_EQ_3_553_AND_NOT_csr_regfile_interr_ETC___d1767 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	     4'd11 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352) ;
  assign WILL_FIRE_RL_rl_stage1_WFI = CAN_FIRE_RL_rl_stage1_WFI ;
  // rule RL_rl_WFI_resume
  assign CAN_FIRE_RL_rl_WFI_resume =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1481 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state_3_EQ_12_0_AND_csr_regfile_wfi_resume__ETC___d1897 ;
  assign WILL_FIRE_RL_rl_WFI_resume = CAN_FIRE_RL_rl_WFI_resume ;
  // rule RL_rl_reset_from_WFI
  assign CAN_FIRE_RL_rl_reset_from_WFI =
	     rg_state == 4'd12 && f_reset_reqs$EMPTY_N ;
  assign WILL_FIRE_RL_rl_reset_from_WFI = MUX_rg_state$write_1__SEL_5 ;
  // rule RL_rl_trap_fetch
  assign CAN_FIRE_RL_rl_trap_fetch =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1481 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state_3_EQ_5_901_AND_NOT_stageF_rg_full_327_ETC___d1902 ;
  assign WILL_FIRE_RL_rl_trap_fetch = CAN_FIRE_RL_rl_trap_fetch ;
  // rule RL_rl_stage1_interrupt
  assign CAN_FIRE_RL_rl_stage1_interrupt =
	     (csr_regfile$interrupt_pending[4] || csr_regfile$nmi_pending) &&
	     rg_state == 4'd3 &&
	     NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d1910 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352) ;
  assign WILL_FIRE_RL_rl_stage1_interrupt = CAN_FIRE_RL_rl_stage1_interrupt ;
  // rule RL_imem_rl_assert_fail
  assign CAN_FIRE_RL_imem_rl_assert_fail = !near_mem$imem_is_i32_not_i16 ;
  assign WILL_FIRE_RL_imem_rl_assert_fail = CAN_FIRE_RL_imem_rl_assert_fail ;
  // rule RL_rl_reset_complete
  assign CAN_FIRE_RL_rl_reset_complete =
	     gpr_regfile$RDY_server_reset_response_get &&
	     near_mem$RDY_server_reset_response_get &&
	     csr_regfile$RDY_server_reset_response_get &&
	     stageF_f_reset_rsps_i_notEmpty__471_AND_stageD_ETC___d1491 &&
	     rg_state == 4'd1 ;
  assign WILL_FIRE_RL_rl_reset_complete = MUX_rg_state$write_1__SEL_2 ;
  // rule RL_rl_pipe
  assign CAN_FIRE_RL_rl_pipe =
	     (IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1540 ||
	      NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1551) &&
	     rg_state_3_EQ_3_553_AND_stage3_rg_full_4_OR_NO_ETC___d1563 &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1573 ;
  assign WILL_FIRE_RL_rl_pipe =
	     CAN_FIRE_RL_rl_pipe && !WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  // rule RL_rl_reset_start
  assign CAN_FIRE_RL_rl_reset_start =
	     gpr_regfile$RDY_server_reset_request_put &&
	     near_mem$RDY_server_reset_request_put &&
	     csr_regfile_RDY_server_reset_request_put__451__ETC___d1463 &&
	     rg_state == 4'd0 ;
  assign WILL_FIRE_RL_rl_reset_start = CAN_FIRE_RL_rl_reset_start ;
  // rule RL_imem_rl_fetch_next_32b
  assign CAN_FIRE_RL_imem_rl_fetch_next_32b =
	     imem_rg_pc[1:0] != 2'b0 && near_mem$imem_valid &&
	     !near_mem$imem_exc &&
	     imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1716 ;
  assign MUX_rg_next_pc$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1653 ;
  assign MUX_rg_next_pc$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_stage1_WFI || WILL_FIRE_RL_rl_stage1_FENCE ||
	     WILL_FIRE_RL_rl_stage1_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W ;
  assign MUX_rg_state$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1704 ;
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
	     rg_state_3_EQ_3_553_AND_NOT_csr_regfile_interr_ETC___d1767 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	     4'd3 ;
  assign MUX_rg_state$write_1__SEL_11 =
	     rg_state_3_EQ_3_553_AND_NOT_csr_regfile_interr_ETC___d1767 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	     4'd4 ;
  assign MUX_rg_state$write_1__SEL_12 =
	     near_mem$RDY_server_fence_i_request_put &&
	     rg_state_3_EQ_3_553_AND_NOT_csr_regfile_interr_ETC___d1877 ;
  assign MUX_rg_state$write_1__SEL_13 =
	     near_mem$RDY_server_fence_request_put &&
	     rg_state_3_EQ_3_553_AND_NOT_csr_regfile_interr_ETC___d1886 ;
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
	  y__h24680 or
	  IF_csr_regfile_read_csr_rg_trap_instr_788_BITS_ETC___d1841)
  begin
    case (rg_trap_instr[14:12])
      3'b010, 3'b110:
	  MUX_csr_regfile$mav_csr_write_2__VAL_2 =
	      IF_csr_regfile_read_csr_rg_trap_instr_788_BITS_ETC___d1841;
      default: MUX_csr_regfile$mav_csr_write_2__VAL_2 =
		   csr_regfile$read_csr[63:0] & y__h24680;
    endcase
  end
  assign MUX_imem_rg_cache_addr$write_1__VAL_1 =
	     (near_mem$imem_valid && !near_mem$imem_exc) ?
	       near_mem$imem_pc :
	       64'h0000000000000001 ;
  assign MUX_imem_rg_cache_addr$write_1__VAL_2 =
	     near_mem$imem_exc ? 64'h0000000000000001 : near_mem$imem_pc ;
  assign MUX_imem_rg_tval$write_1__VAL_1 =
	     (NOT_soc_map_m_pc_reset_value__497_BITS_1_TO_0__ETC___d1511 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h19040 :
	       soc_map$m_pc_reset_value ;
  assign MUX_imem_rg_tval$write_1__VAL_2 =
	     (NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d1727 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h22169 :
	       stageF_branch_predictor$predict_rsp ;
  assign MUX_imem_rg_tval$write_1__VAL_3 =
	     (NOT_rg_next_pc_852_BITS_1_TO_0_853_EQ_0b0_854__ETC___d1860 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h30369 :
	       rg_next_pc ;
  assign MUX_imem_rg_tval$write_1__VAL_4 = near_mem$imem_pc + 64'd4 ;
  assign MUX_near_mem$imem_req_2__VAL_1 =
	     (NOT_soc_map_m_pc_reset_value__497_BITS_1_TO_0__ETC___d1511 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h19040 :
	       addr_of_b32__h18921 ;
  assign MUX_near_mem$imem_req_2__VAL_2 =
	     (NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d1727 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h22169 :
	       addr_of_b32__h22050 ;
  assign MUX_near_mem$imem_req_2__VAL_4 =
	     (NOT_rg_next_pc_852_BITS_1_TO_0_853_EQ_0b0_854__ETC___d1860 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h30369 :
	       addr_of_b32__h30250 ;
  assign MUX_rg_state$write_1__VAL_2 = rg_run_on_reset ? 4'd3 : 4'd2 ;
  assign MUX_rg_state$write_1__VAL_3 =
	     csr_regfile$access_permitted_1 ? 4'd8 : 4'd4 ;
  assign MUX_rg_state$write_1__VAL_4 =
	     csr_regfile$access_permitted_2 ? 4'd8 : 4'd4 ;
  assign MUX_rg_trap_info$write_1__VAL_1 =
	     { stage1_rg_stage_input[401:338], 4'd2, value__h9968 } ;
  assign MUX_rg_trap_info$write_1__VAL_2 =
	     { stage2_rg_stage2[295:232],
	       near_mem$dmem_exc_code,
	       stage2_rg_stage2[191:128] } ;
  assign MUX_rg_trap_info$write_1__VAL_3 =
	     { stage1_rg_stage_input[401:338],
	       stage1_rg_stage_input[332] ?
		 stage1_rg_stage_input[331:264] :
		 { alu_outputs_exc_code__h8756, trap_info_tval__h9919 } } ;
  assign MUX_rg_trap_info$write_1__VAL_4 =
	     { stage1_rg_stage_input[401:338], x_exc_code__h30643, 64'd0 } ;
  assign MUX_rg_trap_instr$write_1__VAL_1 = stage1_rg_stage_input[263:232] ;
  assign MUX_stage1_rg_full$write_1__VAL_2 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1656 &&
	     stageD_rg_full ||
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1744 ;
  assign MUX_stage2_rg_full$write_1__VAL_2 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1533 ?
	       IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	       4'd0 &&
	       IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1604 :
	       IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 !=
	       2'd2 &&
	       IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 !=
	       2'd0 ;
  assign MUX_stageD_rg_full$write_1__VAL_2 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1697 ||
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1537 &&
	     stageD_rg_full ;
  assign MUX_stageF_rg_full$write_1__VAL_2 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1697 ?
	       csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1753 :
	       (IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1537 &&
		stageD_rg_full ||
		!near_mem$imem_valid ||
		NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1345) &&
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
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign imem_rg_cache_addr$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1716 ||
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1697 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1718 ||
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  // register imem_rg_f3
  assign imem_rg_f3$D_IN = 3'b010 ;
  assign imem_rg_f3$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1716 ||
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1716 ||
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
	  imem_rg_pc$D_IN = soc_map$m_pc_reset_value;
      MUX_imem_rg_cache_addr$write_1__SEL_2:
	  imem_rg_pc$D_IN = stageF_branch_predictor$predict_rsp;
      MUX_rg_state$write_1__SEL_7: imem_rg_pc$D_IN = rg_next_pc;
      default: imem_rg_pc$D_IN =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign imem_rg_pc$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1716 ||
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1716 ||
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1716 ||
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1716 ||
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
      default: imem_rg_tval$D_IN =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign imem_rg_tval$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1716 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ||
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  // register rg_csr_pc
  assign rg_csr_pc$D_IN = stage1_rg_stage_input[401:338] ;
  assign rg_csr_pc$EN = MUX_rg_trap_info$write_1__SEL_1 ;
  // register rg_csr_val1
  assign rg_csr_val1$D_IN = x_out_data_to_stage2_val1__h8101 ;
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
	  rg_cur_priv$D_IN = csr_regfile$csr_ret_actions[65:64];
      WILL_FIRE_RL_rl_reset_start: rg_cur_priv$D_IN = 2'b11;
      default: rg_cur_priv$D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign rg_cur_priv$EN =
	     WILL_FIRE_RL_rl_trap || WILL_FIRE_RL_rl_stage1_xRET ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_epoch
  always@(MUX_imem_rg_cache_addr$write_1__SEL_1 or
	  new_epoch__h18435 or
	  MUX_rg_state$write_1__SEL_7 or WILL_FIRE_RL_rl_reset_start)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_cache_addr$write_1__SEL_1:
	  rg_epoch$D_IN = new_epoch__h18435;
      MUX_rg_state$write_1__SEL_7: rg_epoch$D_IN = new_epoch__h18435;
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
	  x_out_next_pc__h8057 or
	  MUX_rg_next_pc$write_1__SEL_2 or
	  WILL_FIRE_RL_rl_trap or
	  csr_regfile$csr_trap_actions or
	  WILL_FIRE_RL_rl_stage1_xRET or csr_regfile$csr_ret_actions)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_rg_next_pc$write_1__SEL_1: rg_next_pc$D_IN = x_out_next_pc__h8057;
      MUX_rg_next_pc$write_1__SEL_2: rg_next_pc$D_IN = x_out_next_pc__h8057;
      WILL_FIRE_RL_rl_trap:
	  rg_next_pc$D_IN = csr_regfile$csr_trap_actions[193:130];
      WILL_FIRE_RL_rl_stage1_xRET:
	  rg_next_pc$D_IN = csr_regfile$csr_ret_actions[129:66];
      default: rg_next_pc$D_IN =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign rg_next_pc$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1653 ||
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1704 ||
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
		   132'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
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
	       stage1_rg_stage_input[263:232] :
	       stage2_rg_stage2[231:200] ;
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
	     { stageD_rg_data[233:170],
	       stageD_rg_data[167:166],
	       stageD_rg_data[169:168],
	       stageD_rg_data[165:96],
	       _theResult____h5500,
	       stageD_rg_data[79:0],
	       _theResult____h5500[6:0],
	       _theResult____h5500[11:7],
	       _theResult____h5500[19:15],
	       _theResult____h5500[24:20],
	       _theResult____h5500[31:27],
	       _theResult____h5500[31:20],
	       _theResult____h5500[14:12],
	       _theResult____h5500[31:27],
	       _theResult____h5500[31:25],
	       decoded_instr_funct10__h20717,
	       _theResult____h5500[31:20],
	       decoded_instr_imm12_S__h20719,
	       decoded_instr_imm13_SB__h20720,
	       _theResult____h5500[31:12],
	       decoded_instr_imm21_UJ__h20722,
	       _theResult____h5500[27:20],
	       _theResult____h5500[26:25] } ;
  assign stage1_rg_stage_input$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1656 &&
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
	       stage1_rg_stage_input[401:338],
	       stage1_rg_stage_input[263:232],
	       IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693,
	       x_out_data_to_stage2_rd__h8099,
	       x_out_data_to_stage2_addr__h8100,
	       x_out_data_to_stage2_val1__h8101,
	       x_out_data_to_stage2_val2__h8102 } ;
  assign stage2_rg_stage2$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1601 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd0 &&
	     IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1604 ;
  // register stage3_rg_full
  always@(WILL_FIRE_RL_stage3_rl_reset or
	  WILL_FIRE_RL_rl_pipe or
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 or
	  MUX_imem_rg_cache_addr$write_1__SEL_1)
  case (1'b1)
    WILL_FIRE_RL_stage3_rl_reset: stage3_rg_full$D_IN = 1'd0;
    WILL_FIRE_RL_rl_pipe:
	stage3_rg_full$D_IN =
	    IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd2;
    MUX_imem_rg_cache_addr$write_1__SEL_1: stage3_rg_full$D_IN = 1'd0;
    default: stage3_rg_full$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign stage3_rg_full$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe ||
	     WILL_FIRE_RL_stage3_rl_reset ;
  // register stage3_rg_stage3
  assign stage3_rg_stage3$D_IN =
	     { stage2_rg_stage2[295:200],
	       stage2_rg_stage2[297:296],
	       stage2_rg_stage2[199:197] == 3'd0 ||
	       IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_1_ETC___d157,
	       x_out_data_to_stage3_rd__h7472,
	       x_out_data_to_stage3_rd_val__h7473 } ;
  assign stage3_rg_stage3$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 ==
	     2'd2 ;
  // register stageD_rg_data
  assign stageD_rg_data$D_IN =
	     { imem_rg_pc,
	       stageF_rg_epoch,
	       stageF_rg_priv,
	       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1305 ||
	       imem_rg_pc[1:0] == 2'b0 &&
	       imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	       near_mem$imem_instr[1:0] == 2'b11,
	       near_mem$imem_exc,
	       near_mem$imem_exc_code,
	       imem_rg_tval,
	       d_instr__h17070,
	       stageF_branch_predictor$predict_rsp } ;
  assign stageD_rg_data$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1697 ;
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
	  new_epoch__h18435 or
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
	stageF_rg_epoch$D_IN = new_epoch__h18435;
    WILL_FIRE_RL_rl_trap_fetch: stageF_rg_epoch$D_IN = new_epoch__h18435;
    WILL_FIRE_RL_rl_WFI_resume: stageF_rg_epoch$D_IN = new_epoch__h18435;
    WILL_FIRE_RL_rl_finish_FENCE: stageF_rg_epoch$D_IN = new_epoch__h18435;
    WILL_FIRE_RL_rl_finish_FENCE_I: stageF_rg_epoch$D_IN = new_epoch__h18435;
    WILL_FIRE_RL_rl_stage1_restart_after_csrrx:
	stageF_rg_epoch$D_IN = new_epoch__h18435;
    default: stageF_rg_epoch$D_IN = 2'b10 /* unspecified value */ ;
  endcase
  assign stageF_rg_epoch$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1716 ||
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1716 ||
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
	     rs1_val__h24411 == 64'd0 ;
  assign csr_regfile$csr_counter_read_fault_csr_addr = 12'h0 ;
  assign csr_regfile$csr_counter_read_fault_priv = 2'h0 ;
  always@(IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547)
  begin
    case (IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547)
      4'd8: csr_regfile$csr_ret_actions_from_priv = 2'b11;
      4'd9: csr_regfile$csr_ret_actions_from_priv = 2'b01;
      default: csr_regfile$csr_ret_actions_from_priv = 2'b0;
    endcase
  end
  assign csr_regfile$csr_trap_actions_exc_code = rg_trap_info[67:64] ;
  assign csr_regfile$csr_trap_actions_from_priv = rg_cur_priv ;
  assign csr_regfile$csr_trap_actions_interrupt =
	     rg_trap_interrupt && !csr_regfile$nmi_pending ;
  assign csr_regfile$csr_trap_actions_nmi =
	     rg_trap_interrupt && csr_regfile$nmi_pending ;
  assign csr_regfile$csr_trap_actions_pc = rg_trap_info[131:68] ;
  assign csr_regfile$csr_trap_actions_xtval = rg_trap_info[63:0] ;
  assign csr_regfile$interrupt_pending_cur_priv = rg_cur_priv ;
  assign csr_regfile$m_external_interrupt_req_set_not_clear =
	     m_external_interrupt_req_set_not_clear ;
  assign csr_regfile$mav_csr_write_csr_addr = rg_trap_instr[31:20] ;
  assign csr_regfile$mav_csr_write_word =
	     MUX_csr_regfile$mav_csr_write_1__SEL_1 ?
	       rs1_val__h23728 :
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
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 ==
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
	     csr_regfile_RDY_server_reset_request_put__451__ETC___d1463 &&
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
	       stage3_rg_stage3[68:64] ;
  assign gpr_regfile$write_rd_rd_val =
	     (MUX_csr_regfile$mav_csr_write_1__SEL_1 ||
	      MUX_gpr_regfile$write_rd_1__SEL_3) ?
	       csr_regfile$read_csr[63:0] :
	       stage3_rg_stage3[63:0] ;
  assign gpr_regfile$EN_server_reset_request_put =
	     CAN_FIRE_RL_rl_reset_start ;
  assign gpr_regfile$EN_server_reset_response_get =
	     MUX_rg_state$write_1__SEL_2 ;
  assign gpr_regfile$EN_write_rd =
	     WILL_FIRE_RL_rl_pipe && stage3_rg_full && stage3_rg_stage3[69] ||
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
  assign near_mem$dmem_req_addr = x_out_data_to_stage2_addr__h8100 ;
  assign near_mem$dmem_req_amo_funct7 =
	     x_out_data_to_stage2_val1__h8101[6:0] ;
  assign near_mem$dmem_req_f3 = MUX_rg_trap_instr$write_1__VAL_1[14:12] ;
  assign near_mem$dmem_req_mstatus_MXR = csr_regfile$read_mstatus[19] ;
  always@(IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693)
  begin
    case (IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693)
      3'd1: near_mem$dmem_req_op = 2'd0;
      3'd2: near_mem$dmem_req_op = 2'd1;
      default: near_mem$dmem_req_op = 2'd2;
    endcase
  end
  assign near_mem$dmem_req_priv =
	     csr_regfile$read_mstatus[17] ?
	       csr_regfile$read_mstatus[12:11] :
	       rg_cur_priv ;
  assign near_mem$dmem_req_satp = csr_regfile$read_satp ;
  assign near_mem$dmem_req_sstatus_SUM = 1'd0 ;
  assign near_mem$dmem_req_store_value = x_out_data_to_stage2_val2__h8102 ;
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
      default: near_mem$imem_req_addr =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1716 ||
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  assign near_mem$EN_dmem_req =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1601 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd0 &&
	     IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1604 &&
	     (IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 ==
	      3'd1 ||
	      IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 ==
	      3'd2 ||
	      IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 ==
	      3'd4) ;
  assign near_mem$EN_server_fence_i_request_put =
	     MUX_rg_state$write_1__SEL_12 ;
  assign near_mem$EN_server_fence_i_response_get =
	     CAN_FIRE_RL_rl_finish_FENCE_I ;
  assign near_mem$EN_server_fence_request_put = MUX_rg_state$write_1__SEL_13 ;
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
  // submodule stage2_mbox
  assign stage2_mbox$req_f3 = MUX_rg_trap_instr$write_1__VAL_1[14:12] ;
  assign stage2_mbox$req_is_OP_not_OP_32 =
	     !MUX_rg_trap_instr$write_1__VAL_1[3] ;
  assign stage2_mbox$req_v1 = x_out_data_to_stage2_val1__h8101 ;
  assign stage2_mbox$req_v2 = x_out_data_to_stage2_val2__h8102 ;
  assign stage2_mbox$set_verbosity_verbosity = 4'h0 ;
  assign stage2_mbox$EN_set_verbosity = 1'b0 ;
  assign stage2_mbox$EN_req_reset = 1'b0 ;
  assign stage2_mbox$EN_rsp_reset = 1'b0 ;
  assign stage2_mbox$EN_req =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1601 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd0 &&
	     IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1604 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 ==
	     3'd3 ;
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
	      (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	       NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d1530) &&
	      IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	      4'd0) ?
	       { IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d629,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[151:145] != 7'b1100011 ||
		 IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d282,
		 alu_outputs_cf_info_fallthru_PC__h10091,
		 alu_outputs_cf_info_taken_PC__h10092 } :
	       195'h6AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ;
  assign stageF_branch_predictor$bp_train_instr = d_instr__h17070 ;
  assign stageF_branch_predictor$bp_train_is_i32_not_i16 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1305 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
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
	  stageF_branch_predictor$predict_req_pc = soc_map$m_pc_reset_value;
      MUX_imem_rg_cache_addr$write_1__SEL_2:
	  stageF_branch_predictor$predict_req_pc =
	      stageF_branch_predictor$predict_rsp;
      MUX_rg_state$write_1__SEL_7:
	  stageF_branch_predictor$predict_req_pc = rg_next_pc;
      default: stageF_branch_predictor$predict_req_pc =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign stageF_branch_predictor$predict_rsp_instr = d_instr__h17070 ;
  assign stageF_branch_predictor$predict_rsp_is_i32_not_i16 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1305 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	     near_mem$imem_instr[1:0] == 2'b11 ;
  assign stageF_branch_predictor$EN_reset = 1'b0 ;
  assign stageF_branch_predictor$EN_predict_req =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1716 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  assign stageF_branch_predictor$EN_bp_train =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1697 ;
  // submodule stageF_f_reset_reqs
  assign stageF_f_reset_reqs$ENQ = CAN_FIRE_RL_rl_reset_start ;
  assign stageF_f_reset_reqs$DEQ = CAN_FIRE_RL_stageF_rl_reset ;
  assign stageF_f_reset_reqs$CLR = 1'b0 ;
  // submodule stageF_f_reset_rsps
  assign stageF_f_reset_rsps$ENQ = CAN_FIRE_RL_stageF_rl_reset ;
  assign stageF_f_reset_rsps$DEQ = MUX_rg_state$write_1__SEL_2 ;
  assign stageF_f_reset_rsps$CLR = 1'b0 ;
  // remaining internal signals
  assign IF_IF_stage1_rg_stage_input_07_BITS_151_TO_145_ETC___d914 =
	     next_pc__h8041 == stage1_rg_stage_input[215:152] ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1537 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1533 ?
	       IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	       4'd0 &&
	       !IF_IF_stage1_rg_stage_input_07_BITS_151_TO_145_ETC___d914 &&
	       stageF_rg_full &&
	       (!near_mem$imem_valid ||
		NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1345) :
	       stage1_rg_full ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1540 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1537 &&
	     stageD_rg_full ||
	     !stageF_rg_full ||
	     !near_mem$imem_valid ||
	     NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1345 ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1656 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1533 ?
	       IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	       4'd0 ||
	       IF_IF_stage1_rg_stage_input_07_BITS_151_TO_145_ETC___d914 ||
	       !stageF_rg_full ||
	       near_mem$imem_valid &&
	       near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352 :
	       !stage1_rg_full ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1697 =
	     (IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1656 ||
	      !stageD_rg_full) &&
	     stageF_rg_full &&
	     near_mem$imem_valid &&
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352 ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1704 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1697 &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1544 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd0 &&
	     !IF_IF_stage1_rg_stage_input_07_BITS_151_TO_145_ETC___d914 ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1716 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1697 &&
	     (csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1711 ||
	      IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	      4'd0 ||
	      IF_IF_stage1_rg_stage_input_07_BITS_151_TO_145_ETC___d914) ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1744 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1533 ?
	       IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	       4'd0 &&
	       IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1570 :
	       stage1_rg_full ;
  assign IF_NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem__ETC___d1322 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1319 ?
	       { 16'b0,
		 imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ?
		   near_mem$imem_instr[31:16] :
		   imem_rg_cache_b16 } :
	       near_mem$imem_instr ;
  assign IF_NOT_near_mem_dmem_valid__25_44_OR_NOT_near__ETC___d190 =
	     (!near_mem$dmem_valid || !near_mem$dmem_exc) ?
	       ((stage2_rg_stage2[196:192] == 5'd0) ? 2'd0 : 2'd1) :
	       2'd0 ;
  assign IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1570 =
	     !IF_IF_stage1_rg_stage_input_07_BITS_151_TO_145_ETC___d914 &&
	     stageF_rg_full &&
	     (!near_mem$imem_valid ||
	      NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1345) ;
  assign IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1604 =
	     IF_IF_stage1_rg_stage_input_07_BITS_151_TO_145_ETC___d914 ||
	     !stageF_rg_full ||
	     near_mem$imem_valid &&
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352 ;
  assign IF_NOT_stage1_rg_stage_input_07_BITS_112_TO_11_ETC___d493 =
	     NOT_stage1_rg_stage_input_07_BITS_112_TO_110_3_ETC___d318 ?
	       4'd12 :
	       4'd1 ;
  assign IF_csr_regfile_read_csr_rg_trap_instr_788_BITS_ETC___d1841 =
	     csr_regfile$read_csr[63:0] | rs1_val__h24411 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1168 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b011) ?
	       instr__h16571 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
		 stageD_rg_data[79:77] == 3'b111) ?
		  instr__h16722 :
		  32'h0) ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1169 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b111) ?
	       instr__h16372 :
	       IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1168 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1171 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:76] == 4'b1001 &&
	      stageD_rg_data[75:71] == 5'd0 &&
	      stageD_rg_data[70:66] == 5'd0) ?
	       instr__h16123 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
		 stageD_rg_data[75:71] != 5'd0 &&
		 stageD_rg_data[79:77] == 3'b011) ?
		  instr__h16219 :
		  IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1169) ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1173 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:74] == 6'b100111 &&
	      stageD_rg_data[70:69] == 2'b01) ?
	       instr__h15827 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:74] == 6'b100111 &&
		 stageD_rg_data[70:69] == 2'b0) ?
		  instr__h15965 :
		  IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1171) ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1175 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:74] == 6'b100011 &&
	      stageD_rg_data[70:69] == 2'b01) ?
	       instr__h15553 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:74] == 6'b100011 &&
		 stageD_rg_data[70:69] == 2'b0) ?
		  instr__h15689 :
		  IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1173) ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1177 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:74] == 6'b100011 &&
	      stageD_rg_data[70:69] == 2'b11) ?
	       instr__h15281 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:74] == 6'b100011 &&
		 stageD_rg_data[70:69] == 2'b10) ?
		  instr__h15417 :
		  IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1175) ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1178 =
	     (csr_regfile_read_misa__2_BIT_2_29_AND_stageD_r_ETC___d1010 &&
	      stageD_rg_data[70:66] != 5'd0) ?
	       instr__h15186 :
	       IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1177 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1179 =
	     (csr_regfile_read_misa__2_BIT_2_29_AND_stageD_r_ETC___d1004 &&
	      stageD_rg_data[70:66] != 5'd0) ?
	       instr__h15067 :
	       IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1178 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1181 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b100 &&
	      stageD_rg_data[75:74] == 2'b01 &&
	      imm6__h13180 != 6'd0) ?
	       instr__h14772 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:77] == 3'b100 &&
		 stageD_rg_data[75:74] == 2'b10) ?
		  instr__h14889 :
		  IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1179) ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1182 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b100 &&
	      stageD_rg_data[75:74] == 2'b0 &&
	      imm6__h13180 != 6'd0) ?
	       instr__h14583 :
	       IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1181 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1183 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b0 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      imm6__h13180 != 6'd0) ?
	       instr__h14394 :
	       IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1182 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1185 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b011 &&
	      stageD_rg_data[75:71] == 5'd2 &&
	      nzimm10__h13849 != 10'd0) ?
	       instr__h14053 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
		 stageD_rg_data[79:77] == 3'b0 &&
		 nzimm10__h14064 != 10'd0) ?
		  instr__h14225 :
		  IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1183) ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1187 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b0 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      imm6__h13180 != 6'd0 ||
	      csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b0 &&
	      stageD_rg_data[75:71] == 5'd0 &&
	      imm6__h13180 == 6'd0) ?
	       instr__h13571 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:77] == 3'b001 &&
		 stageD_rg_data[75:71] != 5'd0) ?
		  instr__h13798 :
		  IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1185) ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1188 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b011 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      stageD_rg_data[75:71] != 5'd2 &&
	      imm6__h13180 != 6'd0) ?
	       instr__h13442 :
	       IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1187 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1190 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b111) ?
	       instr__h12920 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:77] == 3'b010 &&
		 stageD_rg_data[75:71] != 5'd0) ?
		  instr__h13258 :
		  IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1188) ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1191 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b110) ?
	       instr__h12603 :
	       IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1190 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1192 =
	     (csr_regfile_read_misa__2_BIT_2_29_AND_stageD_r_ETC___d1010 &&
	      stageD_rg_data[70:66] == 5'd0) ?
	       instr__h12538 :
	       IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1191 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1193 =
	     (csr_regfile_read_misa__2_BIT_2_29_AND_stageD_r_ETC___d1004 &&
	      stageD_rg_data[70:66] == 5'd0) ?
	       instr__h12422 :
	       IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1192 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1194 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b101) ?
	       instr__h11969 :
	       IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1193 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1195 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b110) ?
	       instr__h11740 :
	       IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1194 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1196 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b010) ?
	       instr__h11545 :
	       IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1195 ;
  assign IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1197 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b110) ?
	       instr__h11353 :
	       IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1196 ;
  assign IF_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg_p_ETC___d1323 =
	     (imem_rg_pc[1:0] == 2'b0 &&
	      imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	      near_mem$imem_instr[1:0] != 2'b11) ?
	       instr_out___1__h17094 :
	       IF_NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem__ETC___d1322 ;
  assign IF_near_mem_dmem_valid__25_THEN_IF_near_mem_dm_ETC___d128 =
	     near_mem$dmem_valid ? (near_mem$dmem_exc ? 2'd3 : 2'd2) : 2'd1 ;
  assign IF_rg_cur_priv_4_EQ_0b11_09_AND_stage1_rg_stag_ETC___d523 =
	     (rg_cur_priv == 2'b11 &&
	      stage1_rg_stage_input[87:76] == 12'b001100000010) ?
	       4'd8 :
	       (rg_cur_priv_4_EQ_0b11_09_OR_rg_cur_priv_4_EQ_0_ETC___d521 ?
		  4'd11 :
		  4'd12) ;
  assign IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d271 =
	     rs1_val_bypassed__h5229 == rs2_val_bypassed__h5235 ;
  assign IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d273 =
	     (rs1_val_bypassed__h5229 ^ 64'h8000000000000000) <
	     (rs2_val_bypassed__h5235 ^ 64'h8000000000000000) ;
  assign IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d275 =
	     rs1_val_bypassed__h5229 < rs2_val_bypassed__h5235 ;
  assign IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d658 =
	     rs1_val_bypassed__h5229 +
	     SEXT_stage1_rg_stage_input_07_BITS_87_TO_76_05___d657 ;
  assign IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC__q22 =
	     IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d658[31:0] ;
  assign IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d402 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       stage1_rg_stage_input[112:110] != 3'b0 &&
	       stage1_rg_stage_input[112:110] != 3'b001 &&
	       stage1_rg_stage_input[112:110] != 3'b100 &&
	       stage1_rg_stage_input[112:110] != 3'b101 &&
	       stage1_rg_stage_input[112:110] != 3'b110 &&
	       stage1_rg_stage_input[112:110] != 3'b111 ||
	       IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d282 :
	       (stage1_rg_stage_input[151:145] != 7'b0110011 ||
		stage1_rg_stage_input[104:98] != 7'b0000001) &&
	       (stage1_rg_stage_input[151:145] != 7'b0111011 ||
		stage1_rg_stage_input[104:98] != 7'b0000001) &&
	       (stage1_rg_stage_input[151:145] != 7'b0010011 &&
		stage1_rg_stage_input[151:145] != 7'b0110011 ||
		stage1_rg_stage_input[112:110] != 3'b001 &&
		stage1_rg_stage_input[112:110] != 3'b101) &&
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q13 ;
  assign IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d413 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       stage1_rg_stage_input[112:110] != 3'b0 &&
	       stage1_rg_stage_input[112:110] != 3'b001 &&
	       stage1_rg_stage_input[112:110] != 3'b100 &&
	       stage1_rg_stage_input[112:110] != 3'b101 &&
	       stage1_rg_stage_input[112:110] != 3'b110 &&
	       stage1_rg_stage_input[112:110] != 3'b111 ||
	       IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d408 :
	       stage1_rg_stage_input[151:145] != 7'b1101111 &&
	       stage1_rg_stage_input[151:145] != 7'b1100111 ;
  assign IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d481 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       (stage1_rg_stage_input[112:110] == 3'b0 ||
		stage1_rg_stage_input[112:110] == 3'b001 ||
		stage1_rg_stage_input[112:110] == 3'b100 ||
		stage1_rg_stage_input[112:110] == 3'b101 ||
		stage1_rg_stage_input[112:110] == 3'b110 ||
		stage1_rg_stage_input[112:110] == 3'b111) &&
	       IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d408 :
	       stage1_rg_stage_input[151:145] != 7'b1101111 &&
	       stage1_rg_stage_input[151:145] != 7'b1100111 &&
	       (stage1_rg_stage_input_07_BITS_151_TO_145_34_EQ_ETC___d433 ||
		CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q15) ;
  assign IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d483 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       (stage1_rg_stage_input[112:110] == 3'b0 ||
		stage1_rg_stage_input[112:110] == 3'b001 ||
		stage1_rg_stage_input[112:110] == 3'b100 ||
		stage1_rg_stage_input[112:110] == 3'b101 ||
		stage1_rg_stage_input[112:110] == 3'b110 ||
		stage1_rg_stage_input[112:110] == 3'b111) &&
	       IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d282 :
	       stage1_rg_stage_input[151:145] == 7'b1101111 ||
	       stage1_rg_stage_input[151:145] == 7'b1100111 ;
  assign IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d828 =
	     ((stage1_rg_stage_input[151:145] == 7'b0010011 ||
	       stage1_rg_stage_input[151:145] == 7'b0110011) &&
	      (stage1_rg_stage_input[112:110] == 3'b001 ||
	       stage1_rg_stage_input[112:110] == 3'b101)) ?
	       alu_outputs___1_val1__h8382 :
	       IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d827 ;
  assign IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d829 =
	     ((stage1_rg_stage_input[151:145] == 7'b0110011 ||
	       stage1_rg_stage_input[151:145] == 7'b0111011) &&
	      stage1_rg_stage_input[104:98] == 7'b0000001) ?
	       rs1_val_bypassed__h5229 :
	       IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d828 ;
  assign IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 =
	     stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ?
	       (stage1_rg_stage_input[332] ?
		  4'd12 :
		  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d544) :
	       4'd0 ;
  assign IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 =
	     stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ?
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q25 :
	       3'd0 ;
  assign IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 =
	     stage2_rg_full ?
	       CASE_stage2_rg_stage2_BITS_199_TO_197_0_2_1_IF_ETC__q5 :
	       2'd0 ;
  assign IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d1522 =
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194 ==
	     2'd1 &&
	     (IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d211 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d213) ||
	     stage1_rg_stage_input[332] ||
	     IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d402 &&
	     IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d413 ;
  assign IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194 =
	     stage2_rg_full ?
	       CASE_stage2_rg_stage2_BITS_199_TO_197_0_2_1_IF_ETC__q6 :
	       2'd0 ;
  assign IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d211 =
	     x_out_bypass_rd__h7811 == stage1_rg_stage_input[139:135] ;
  assign IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d213 =
	     x_out_bypass_rd__h7811 == stage1_rg_stage_input[134:130] ;
  assign IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486 =
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194 ==
	     2'd1 &&
	     (IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d211 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d213) ||
	     !stage1_rg_stage_input[332] &&
	     (IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d481 ||
	      IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d483) ;
  assign IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_3_ETC___d131 =
	     stage2_mbox$valid ? 2'd2 : 2'd1 ;
  assign NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 =
	     cur_verbosity__h3708 > 4'd1 ;
  assign NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d1530 =
	     (IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194 !=
	      2'd1 ||
	      !IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d211 &&
	      !IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d213) &&
	     !stage1_rg_stage_input[332] &&
	     (IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d481 ||
	      IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d483) ;
  assign NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 =
	     (IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194 !=
	      2'd1 ||
	      !IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d211 &&
	      !IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d213) &&
	     (stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d402 &&
	      IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d413) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1529 =
	     (!csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	      stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d1525) &&
	     (IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 ==
	      2'd2 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 ==
	      2'd0) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1533 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1529 &&
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	      NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d1530) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1542 =
	     !csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	     stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d1522 &&
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1544 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1542 &&
	     (IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 ==
	      2'd2 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 ==
	      2'd0) &&
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	      NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d1530) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1551 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1544 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd0 &&
	     !IF_IF_stage1_rg_stage_input_07_BITS_151_TO_145_ETC___d914 ||
	     (imem_rg_pc[1:0] == 2'b0 || near_mem$imem_exc ||
	      !imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1573 =
	     !csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	     NOT_stage1_rg_full_06_90_OR_stage1_rg_stage_in_ETC___d1566 ||
	     NOT_stage1_rg_full_06_90_OR_stage1_rg_stage_in_ETC___d1568 ||
	     IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1570 ||
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 !=
	     2'd0 ||
	     stage3_rg_full ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1594 =
	     (!csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	      !stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	     (IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 ==
	      2'd2 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 ==
	      2'd0) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1601 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1542 &&
	     (IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 ==
	      2'd2 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 ==
	      2'd0) &&
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	      NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d1530) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1630 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1601 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd0 &&
	     IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1604 &&
	     NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1653 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1601 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd0 &&
	     IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1604 &&
	     !IF_IF_stage1_rg_stage_input_07_BITS_151_TO_145_ETC___d914 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1763 =
	     !csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	     !stage1_rg_stage_input[332] &&
	     (IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d481 ||
	      IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d483) ;
  assign NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1305 =
	     imem_rg_pc[1:0] != 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d1297 &&
	     near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_299___d1300 &&
	     imem_rg_cache_b16[1:0] == 2'b11 ;
  assign NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1319 =
	     imem_rg_pc[1:0] != 2'b0 &&
	     (imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	      near_mem$imem_instr[17:16] != 2'b11 ||
	      imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d1297 &&
	      imem_rg_cache_b16[1:0] != 2'b11) ;
  assign NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1338 =
	     !near_mem$imem_exc &&
	     (imem_rg_pc[1:0] == 2'b0 ||
	      !imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d1297 ||
	      !near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_299___d1300 ||
	      imem_rg_cache_b16[1:0] != 2'b11) &&
	     (imem_rg_pc[1:0] != 2'b0 ||
	      !imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[1:0] != 2'b11) ;
  assign NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1345 =
	     NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1338 &&
	     imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1342 &&
	     (imem_rg_pc[1:0] != 2'b0 ||
	      !imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[1:0] == 2'b11) ;
  assign NOT_rg_next_pc_852_BITS_1_TO_0_853_EQ_0b0_854__ETC___d1860 =
	     rg_next_pc[1:0] != 2'b0 && near_mem$imem_valid &&
	     !near_mem$imem_exc &&
	     addr_of_b32__h30250 == near_mem$imem_pc ;
  assign NOT_rg_run_on_reset_477_478_OR_imem_rg_pc_BITS_ETC___d1485 =
	     !rg_run_on_reset ||
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1481 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req ;
  assign NOT_soc_map_m_pc_reset_value__497_BITS_1_TO_0__ETC___d1511 =
	     soc_map$m_pc_reset_value[1:0] != 2'b0 && near_mem$imem_valid &&
	     !near_mem$imem_exc &&
	     addr_of_b32__h18921 == near_mem$imem_pc ;
  assign NOT_stage1_rg_full_06_90_OR_stage1_rg_stage_in_ETC___d1566 =
	     (!stage1_rg_full ||
	      stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d1522 ||
	      IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	      4'd0) &&
	     (!stage1_rg_full ||
	      !stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) ;
  assign NOT_stage1_rg_full_06_90_OR_stage1_rg_stage_in_ETC___d1568 =
	     (!stage1_rg_full ||
	      stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d1522) &&
	     (!stage1_rg_full ||
	      !stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) ;
  assign NOT_stage1_rg_stage_input_07_BITS_112_TO_110_3_ETC___d318 =
	     (stage1_rg_stage_input[112:110] != 3'b0 ||
	      stage1_rg_stage_input[151:145] == 7'b0110011 &&
	      stage1_rg_stage_input[262]) &&
	     (stage1_rg_stage_input[112:110] != 3'b0 ||
	      stage1_rg_stage_input[151:145] != 7'b0110011 ||
	      !stage1_rg_stage_input[262]) &&
	     stage1_rg_stage_input[112:110] != 3'b010 &&
	     stage1_rg_stage_input[112:110] != 3'b011 &&
	     stage1_rg_stage_input[112:110] != 3'b100 &&
	     stage1_rg_stage_input[112:110] != 3'b110 &&
	     stage1_rg_stage_input[112:110] != 3'b111 ;
  assign NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d1906 =
	     (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	      NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d1530) &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd0 ||
	     stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	     NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 ;
  assign NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d1910 =
	     NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d1906 &&
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	      NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d1530 ||
	      NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416) &&
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 ==
	     2'd0 &&
	     !stage3_rg_full ;
  assign NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 =
	     !stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194 !=
	     2'd1 ||
	     !IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d211 &&
	     !IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d213 ;
  assign NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d620 =
	     (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd0 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd1 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd2 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd3 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd4 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd5 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd6 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd7 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd8 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd9 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd10 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd11 ;
  assign NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d632 =
	     NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	     (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	     IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d629 ==
	     2'd3 ;
  assign NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d636 =
	     NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	     (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	     IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d629 ==
	     2'd0 ;
  assign NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d642 =
	     NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	     (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	     IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d629 !=
	     2'd3 &&
	     IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d629 !=
	     2'd0 ;
  assign NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d1727 =
	     stageF_branch_predictor$predict_rsp[1:0] != 2'b0 &&
	     near_mem$imem_valid &&
	     !near_mem$imem_exc &&
	     addr_of_b32__h22050 == near_mem$imem_pc ;
  assign SEXT_stage1_rg_stage_input_07_BITS_87_TO_76_05___d657 =
	     { {52{stage1_rg_stage_input_BITS_87_TO_76__q21[11]}},
	       stage1_rg_stage_input_BITS_87_TO_76__q21 } ;
  assign SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d1019 =
	     { {4{offset__h12547[8]}}, offset__h12547 } ;
  assign SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d994 =
	     { {9{offset__h11916[11]}}, offset__h11916 } ;
  assign _theResult_____1_fst__h9171 =
	     (stage1_rg_stage_input[112:110] == 3'b0 &&
	      stage1_rg_stage_input[151:145] == 7'b0110011 &&
	      stage1_rg_stage_input[262]) ?
	       rd_val___1__h9167 :
	       _theResult_____1_fst__h9178 ;
  assign _theResult_____1_fst__h9206 =
	     rs1_val_bypassed__h5229 & _theResult___snd__h10433 ;
  assign _theResult____h23252 =
	     (delta_CPI_instrs__h23251 == 64'd0) ?
	       delta_CPI_instrs___1__h23287 :
	       delta_CPI_instrs__h23251 ;
  assign _theResult____h5500 = x_out_data_to_stage1_instr__h11003 ;
  assign _theResult___fst__h9276 =
	     (stage1_rg_stage_input[112:110] == 3'b001 &&
	      !stage1_rg_stage_input[257]) ?
	       rd_val___1__h10493 :
	       _theResult___fst__h9283 ;
  assign _theResult___fst__h9283 =
	     stage1_rg_stage_input[262] ?
	       rd_val___1__h10575 :
	       rd_val___1__h10546 ;
  assign _theResult___fst__h9343 =
	     { {32{rs1_val_bypassed229_BITS_31_TO_0_SRL_rs2_val_b_ETC__q9[31]}},
	       rs1_val_bypassed229_BITS_31_TO_0_SRL_rs2_val_b_ETC__q9 } ;
  assign _theResult___snd__h10433 =
	     (stage1_rg_stage_input[151:145] == 7'b0010011) ?
	       SEXT_stage1_rg_stage_input_07_BITS_87_TO_76_05___d657 :
	       rs2_val_bypassed__h5235 ;
  assign addr_of_b32___1__h19040 = addr_of_b32__h18921 + 64'd4 ;
  assign addr_of_b32___1__h22169 = addr_of_b32__h22050 + 64'd4 ;
  assign addr_of_b32___1__h30369 = addr_of_b32__h30250 + 64'd4 ;
  assign addr_of_b32__h18921 = { soc_map$m_pc_reset_value[63:2], 2'd0 } ;
  assign addr_of_b32__h22050 =
	     { stageF_branch_predictor$predict_rsp[63:2], 2'd0 } ;
  assign addr_of_b32__h30250 = { rg_next_pc[63:2], 2'd0 } ;
  assign alu_outputs___1_addr__h8255 =
	     IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d282 ?
	       branch_target__h8232 :
	       x_out_cf_info_fallthru_PC__h10099 ;
  assign alu_outputs___1_addr__h8527 =
	     rs1_val_bypassed__h5229 +
	     { {52{stage1_rg_stage_input_BITS_75_TO_64__q7[11]}},
	       stage1_rg_stage_input_BITS_75_TO_64__q7 } ;
  assign alu_outputs___1_exc_code__h8712 =
	     (stage1_rg_stage_input[112:110] == 3'b0) ?
	       ((stage1_rg_stage_input[144:140] == 5'd0 &&
		 stage1_rg_stage_input[139:135] == 5'd0) ?
		  CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q4 :
		  4'd2) :
	       4'd2 ;
  assign alu_outputs___1_val1__h8382 =
	     (stage1_rg_stage_input[112:110] == 3'b001) ?
	       rd_val__h10330 :
	       (stage1_rg_stage_input[262] ?
		  rd_val__h10403 :
		  rd_val__h10381) ;
  assign alu_outputs___1_val1__h8418 =
	     (stage1_rg_stage_input[112:110] == 3'b0 &&
	      (stage1_rg_stage_input[151:145] != 7'b0110011 ||
	       !stage1_rg_stage_input[262])) ?
	       rd_val___1__h9159 :
	       _theResult_____1_fst__h9171 ;
  assign alu_outputs___1_val1__h8439 =
	     (stage1_rg_stage_input[112:110] == 3'b0) ?
	       rd_val___1__h10462 :
	       _theResult___fst__h9276 ;
  assign alu_outputs___1_val1__h8716 =
	     stage1_rg_stage_input[112] ?
	       { 59'd0, stage1_rg_stage_input[139:135] } :
	       rs1_val_bypassed__h5229 ;
  assign alu_outputs___1_val1__h8736 =
	     { 57'd0, stage1_rg_stage_input[104:98] } ;
  assign alu_outputs_cf_info_fallthru_PC__h10091 =
	     x_out_cf_info_fallthru_PC__h10099 ;
  assign alu_outputs_cf_info_taken_PC__h10092 =
	     x_out_cf_info_taken_PC__h10100 ;
  assign branch_target__h8232 =
	     stage1_rg_stage_input[401:338] +
	     { {51{stage1_rg_stage_input_BITS_63_TO_51__q1[12]}},
	       stage1_rg_stage_input_BITS_63_TO_51__q1 } ;
  assign cpi__h23254 = x__h23253 / 64'd10 ;
  assign cpifrac__h23255 = x__h23253 % 64'd10 ;
  assign csr_regfile_RDY_server_reset_request_put__451__ETC___d1463 =
	     csr_regfile$RDY_server_reset_request_put &&
	     f_reset_reqs$EMPTY_N &&
	     stageF_f_reset_reqs$FULL_N &&
	     stageD_f_reset_reqs$FULL_N &&
	     stage1_f_reset_reqs$FULL_N &&
	     stage2_f_reset_reqs$FULL_N &&
	     stage3_f_reset_reqs$FULL_N ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1707 =
	     (csr_regfile$interrupt_pending[4] || csr_regfile$nmi_pending) &&
	     (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	      NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d1530 ||
	      NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416) ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1711 =
	     csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1707 ||
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 !=
	     2'd2 &&
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 !=
	     2'd0 ||
	     !stage1_rg_full ||
	     stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d1522 ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1714 =
	     (csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1711 ||
	      IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	      4'd0 ||
	      IF_IF_stage1_rg_stage_input_07_BITS_151_TO_145_ETC___d914) &&
	     NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1718 =
	     (csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1711 ||
	      IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	      4'd0 ||
	      IF_IF_stage1_rg_stage_input_07_BITS_151_TO_145_ETC___d914) &&
	     !near_mem$imem_exc ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1753 =
	     csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1711 ||
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	     4'd0 ||
	     IF_IF_stage1_rg_stage_input_07_BITS_151_TO_145_ETC___d914 ||
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1537 &&
	     stageD_rg_full ;
  assign csr_regfile_read_csr_mcycle__3_MINUS_rg_start__ETC___d1791 =
	     delta_CPI_cycles__h23250 * 64'd10 ;
  assign csr_regfile_read_misa__2_BIT_2_29_AND_stageD_r_ETC___d1004 =
	     csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	     stageD_rg_data[79:76] == 4'b1000 &&
	     stageD_rg_data[75:71] != 5'd0 ;
  assign csr_regfile_read_misa__2_BIT_2_29_AND_stageD_r_ETC___d1010 =
	     csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	     stageD_rg_data[79:76] == 4'b1001 &&
	     stageD_rg_data[75:71] != 5'd0 ;
  assign cur_verbosity__h3708 =
	     (csr_regfile$read_csr_minstret < cfg_logdelay) ?
	       4'd0 :
	       cfg_verbosity ;
  assign d_instr__h17070 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1305 ?
	       instr_out___1__h17072 :
	       IF_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg_p_ETC___d1323 ;
  assign data_to_stage2_addr__h8090 = x_out_data_to_stage2_addr__h8100 ;
  assign data_to_stage2_rd__h8089 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       5'd0 :
	       stage1_rg_stage_input[144:140] ;
  assign decoded_instr_funct10__h20717 =
	     { _theResult____h5500[31:25], _theResult____h5500[14:12] } ;
  assign decoded_instr_imm12_S__h20719 =
	     { _theResult____h5500[31:25], _theResult____h5500[11:7] } ;
  assign decoded_instr_imm13_SB__h20720 =
	     { _theResult____h5500[31],
	       _theResult____h5500[7],
	       _theResult____h5500[30:25],
	       _theResult____h5500[11:8],
	       1'b0 } ;
  assign decoded_instr_imm21_UJ__h20722 =
	     { _theResult____h5500[31],
	       _theResult____h5500[19:12],
	       _theResult____h5500[20],
	       _theResult____h5500[30:21],
	       1'b0 } ;
  assign delta_CPI_cycles__h23250 =
	     csr_regfile$read_csr_mcycle - rg_start_CPI_cycles ;
  assign delta_CPI_instrs___1__h23287 = delta_CPI_instrs__h23251 + 64'd1 ;
  assign delta_CPI_instrs__h23251 =
	     csr_regfile$read_csr_minstret - rg_start_CPI_instrs ;
  assign fall_through_pc__h8040 =
	     stage1_rg_stage_input[401:338] +
	     (stage1_rg_stage_input[333] ? 64'd4 : 64'd2) ;
  assign imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1342 =
	     imem_rg_pc[1:0] == 2'b0 ||
	     (!imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[17:16] == 2'b11) &&
	     (!imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d1297 ||
	      imem_rg_cache_b16[1:0] == 2'b11) ;
  assign imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d1481 =
	     imem_rg_pc[1:0] == 2'b0 || !near_mem$imem_valid ||
	     near_mem$imem_exc ||
	     !imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ;
  assign imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d1297 =
	     imem_rg_pc[63:2] == imem_rg_cache_addr[63:2] ;
  assign imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 =
	     imem_rg_pc[63:2] == near_mem$imem_pc[63:2] ;
  assign imm12__h11209 = { 4'd0, offset__h11081 } ;
  assign imm12__h11546 = { 5'd0, offset__h11488 } ;
  assign imm12__h13182 = { {6{imm6__h13180[5]}}, imm6__h13180 } ;
  assign imm12__h13851 = { {2{nzimm10__h13849[9]}}, nzimm10__h13849 } ;
  assign imm12__h14066 = { 2'd0, nzimm10__h14064 } ;
  assign imm12__h14262 = { 6'b0, imm6__h13180 } ;
  assign imm12__h14599 = { 6'b010000, imm6__h13180 } ;
  assign imm12__h16220 = { 3'd0, offset__h16134 } ;
  assign imm12__h16572 = { 4'd0, offset__h16506 } ;
  assign imm20__h13310 = { {14{imm6__h13180[5]}}, imm6__h13180 } ;
  assign imm6__h13180 = { stageD_rg_data[76], stageD_rg_data[70:66] } ;
  assign instr___1__h11039 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      stageD_rg_data[79:77] == 3'b010) ?
	       instr__h11208 :
	       IF_csr_regfile_read_misa__2_BIT_2_29_AND_stage_ETC___d1197 ;
  assign instr__h11208 =
	     { imm12__h11209, 8'd18, stageD_rg_data[75:71], 7'b0000011 } ;
  assign instr__h11353 =
	     { 4'd0,
	       stageD_rg_data[72:71],
	       stageD_rg_data[76],
	       stageD_rg_data[70:66],
	       8'd18,
	       offset_BITS_4_TO_0___h11477,
	       7'b0100011 } ;
  assign instr__h11545 =
	     { imm12__h11546, rs1__h11547, 3'b010, rd__h11548, 7'b0000011 } ;
  assign instr__h11740 =
	     { 5'd0,
	       stageD_rg_data[69],
	       stageD_rg_data[76],
	       rd__h11548,
	       rs1__h11547,
	       3'b010,
	       offset_BITS_4_TO_0___h11908,
	       7'b0100011 } ;
  assign instr__h11969 =
	     { SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d994[20],
	       SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d994[10:1],
	       SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d994[11],
	       SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d994[19:12],
	       12'd111 } ;
  assign instr__h12422 = { 12'd0, stageD_rg_data[75:71], 15'd103 } ;
  assign instr__h12538 = { 12'd0, stageD_rg_data[75:71], 15'd231 } ;
  assign instr__h12603 =
	     { SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d1019[12],
	       SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d1019[10:5],
	       5'd0,
	       rs1__h11547,
	       3'b0,
	       SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d1019[4:1],
	       SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d1019[11],
	       7'b1100011 } ;
  assign instr__h12920 =
	     { SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d1019[12],
	       SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d1019[10:5],
	       5'd0,
	       rs1__h11547,
	       3'b001,
	       SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d1019[4:1],
	       SEXT_stageD_rg_data_24_BIT_76_41_CONCAT_stageD_ETC___d1019[11],
	       7'b1100011 } ;
  assign instr__h13258 =
	     { imm12__h13182, 8'd0, stageD_rg_data[75:71], 7'b0010011 } ;
  assign instr__h13442 =
	     { imm20__h13310, stageD_rg_data[75:71], 7'b0110111 } ;
  assign instr__h13571 =
	     { imm12__h13182,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0010011 } ;
  assign instr__h13798 =
	     { imm12__h13182,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0011011 } ;
  assign instr__h14053 =
	     { imm12__h13851,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0010011 } ;
  assign instr__h14225 = { imm12__h14066, 8'd16, rd__h11548, 7'b0010011 } ;
  assign instr__h14394 =
	     { imm12__h14262,
	       stageD_rg_data[75:71],
	       3'b001,
	       stageD_rg_data[75:71],
	       7'b0010011 } ;
  assign instr__h14583 =
	     { imm12__h14262, rs1__h11547, 3'b101, rs1__h11547, 7'b0010011 } ;
  assign instr__h14772 =
	     { imm12__h14599, rs1__h11547, 3'b101, rs1__h11547, 7'b0010011 } ;
  assign instr__h14889 =
	     { imm12__h13182, rs1__h11547, 3'b111, rs1__h11547, 7'b0010011 } ;
  assign instr__h15067 =
	     { 7'b0,
	       stageD_rg_data[70:66],
	       8'd0,
	       stageD_rg_data[75:71],
	       7'b0110011 } ;
  assign instr__h15186 =
	     { 7'b0,
	       stageD_rg_data[70:66],
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0110011 } ;
  assign instr__h15281 =
	     { 7'b0,
	       rd__h11548,
	       rs1__h11547,
	       3'b111,
	       rs1__h11547,
	       7'b0110011 } ;
  assign instr__h15417 =
	     { 7'b0,
	       rd__h11548,
	       rs1__h11547,
	       3'b110,
	       rs1__h11547,
	       7'b0110011 } ;
  assign instr__h15553 =
	     { 7'b0,
	       rd__h11548,
	       rs1__h11547,
	       3'b100,
	       rs1__h11547,
	       7'b0110011 } ;
  assign instr__h15689 =
	     { 7'b0100000,
	       rd__h11548,
	       rs1__h11547,
	       3'b0,
	       rs1__h11547,
	       7'b0110011 } ;
  assign instr__h15827 =
	     { 7'b0,
	       rd__h11548,
	       rs1__h11547,
	       3'b0,
	       rs1__h11547,
	       7'b0111011 } ;
  assign instr__h15965 =
	     { 7'b0100000,
	       rd__h11548,
	       rs1__h11547,
	       3'b0,
	       rs1__h11547,
	       7'b0111011 } ;
  assign instr__h16123 =
	     { 12'b000000000001,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b1110011 } ;
  assign instr__h16219 =
	     { imm12__h16220, 8'd19, stageD_rg_data[75:71], 7'b0000011 } ;
  assign instr__h16372 =
	     { 3'd0,
	       stageD_rg_data[73:71],
	       stageD_rg_data[76],
	       stageD_rg_data[70:66],
	       8'd19,
	       offset_BITS_4_TO_0___h16847,
	       7'b0100011 } ;
  assign instr__h16571 =
	     { imm12__h16572, rs1__h11547, 3'b011, rd__h11548, 7'b0000011 } ;
  assign instr__h16722 =
	     { 4'd0,
	       stageD_rg_data[70:69],
	       stageD_rg_data[76],
	       rd__h11548,
	       rs1__h11547,
	       3'b011,
	       offset_BITS_4_TO_0___h16847,
	       7'b0100011 } ;
  assign instr_out___1__h17072 =
	     { near_mem$imem_instr[15:0], imem_rg_cache_b16 } ;
  assign instr_out___1__h17094 = { 16'b0, near_mem$imem_instr[15:0] } ;
  assign near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1350 =
	     near_mem$imem_exc ||
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1305 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	     near_mem$imem_instr[1:0] == 2'b11 ;
  assign near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352 =
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1350 ||
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1319 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	     near_mem$imem_instr[1:0] != 2'b11 ;
  assign near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_299___d1300 =
	     near_mem$imem_pc == imem_rg_pc + 64'd2 ;
  assign near_mem_imem_valid_AND_near_mem_imem_exc__1_A_ETC___d1447 =
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
  assign new_epoch__h18435 = rg_epoch + 2'd1 ;
  assign next_pc___1__h9715 = stage1_rg_stage_input[401:338] + 64'd2 ;
  assign next_pc__h8041 = x_out_next_pc__h8057 ;
  assign next_pc__h8261 =
	     stage1_rg_stage_input[401:338] +
	     { {43{stage1_rg_stage_input_BITS_30_TO_10__q2[20]}},
	       stage1_rg_stage_input_BITS_30_TO_10__q2 } ;
  assign next_pc__h8288 =
	     { IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d658[63:1],
	       1'd0 } ;
  assign next_pc__h9712 = stage1_rg_stage_input[401:338] + 64'd4 ;
  assign nzimm10__h13849 =
	     { stageD_rg_data[76],
	       stageD_rg_data[68:67],
	       stageD_rg_data[69],
	       stageD_rg_data[66],
	       stageD_rg_data[70],
	       4'b0 } ;
  assign nzimm10__h14064 =
	     { stageD_rg_data[74:71],
	       stageD_rg_data[76:75],
	       stageD_rg_data[69],
	       stageD_rg_data[70],
	       2'b0 } ;
  assign offset_BITS_4_TO_0___h11477 = { stageD_rg_data[75:73], 2'b0 } ;
  assign offset_BITS_4_TO_0___h11908 =
	     { stageD_rg_data[75:74], stageD_rg_data[70], 2'b0 } ;
  assign offset_BITS_4_TO_0___h16847 = { stageD_rg_data[75:74], 3'b0 } ;
  assign offset__h11081 =
	     { stageD_rg_data[67:66],
	       stageD_rg_data[76],
	       stageD_rg_data[70:68],
	       2'b0 } ;
  assign offset__h11488 =
	     { stageD_rg_data[69],
	       stageD_rg_data[76:74],
	       stageD_rg_data[70],
	       2'b0 } ;
  assign offset__h11916 =
	     { stageD_rg_data[76],
	       stageD_rg_data[72],
	       stageD_rg_data[74:73],
	       stageD_rg_data[70],
	       stageD_rg_data[71],
	       stageD_rg_data[66],
	       stageD_rg_data[75],
	       stageD_rg_data[69:67],
	       1'b0 } ;
  assign offset__h12547 =
	     { stageD_rg_data[76],
	       stageD_rg_data[70:69],
	       stageD_rg_data[66],
	       stageD_rg_data[75:74],
	       stageD_rg_data[68:67],
	       1'b0 } ;
  assign offset__h16134 =
	     { stageD_rg_data[68:66],
	       stageD_rg_data[76],
	       stageD_rg_data[70:69],
	       3'b0 } ;
  assign offset__h16506 =
	     { stageD_rg_data[70:69], stageD_rg_data[76:74], 3'b0 } ;
  assign rd__h11548 = { 2'b01, stageD_rg_data[68:66] } ;
  assign rd_val___1__h10462 =
	     { {32{IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC__q22[31]}},
	       IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC__q22 } ;
  assign rd_val___1__h10493 = { {32{x__h10496[31]}}, x__h10496 } ;
  assign rd_val___1__h10546 = { {32{x__h10549[31]}}, x__h10549 } ;
  assign rd_val___1__h10575 = { {32{tmp__h10574[31]}}, tmp__h10574 } ;
  assign rd_val___1__h10627 =
	     { {32{rs1_val_bypassed229_BITS_31_TO_0_PLUS_rs2_val__ETC__q10[31]}},
	       rs1_val_bypassed229_BITS_31_TO_0_PLUS_rs2_val__ETC__q10 } ;
  assign rd_val___1__h10675 =
	     { {32{rs1_val_bypassed229_BITS_31_TO_0_MINUS_rs2_val_ETC__q11[31]}},
	       rs1_val_bypassed229_BITS_31_TO_0_MINUS_rs2_val_ETC__q11 } ;
  assign rd_val___1__h10681 = { {32{x__h10684[31]}}, x__h10684 } ;
  assign rd_val___1__h10726 = { {32{x__h10729[31]}}, x__h10729 } ;
  assign rd_val___1__h9159 =
	     rs1_val_bypassed__h5229 + _theResult___snd__h10433 ;
  assign rd_val___1__h9167 =
	     rs1_val_bypassed__h5229 - _theResult___snd__h10433 ;
  assign rd_val___1__h9174 =
	     ((rs1_val_bypassed__h5229 ^ 64'h8000000000000000) <
	      (_theResult___snd__h10433 ^ 64'h8000000000000000)) ?
	       64'd1 :
	       64'd0 ;
  assign rd_val___1__h9181 =
	     (rs1_val_bypassed__h5229 < _theResult___snd__h10433) ?
	       64'd1 :
	       64'd0 ;
  assign rd_val___1__h9188 =
	     rs1_val_bypassed__h5229 ^ _theResult___snd__h10433 ;
  assign rd_val___1__h9195 =
	     rs1_val_bypassed__h5229 | _theResult___snd__h10433 ;
  assign rd_val__h10330 = rs1_val_bypassed__h5229 << shamt__h8369 ;
  assign rd_val__h10381 = rs1_val_bypassed__h5229 >> shamt__h8369 ;
  assign rd_val__h10403 =
	     rs1_val_bypassed__h5229 >> shamt__h8369 |
	     ~(64'hFFFFFFFFFFFFFFFF >> shamt__h8369) &
	     {64{rs1_val_bypassed__h5229[63]}} ;
  assign rd_val__h7942 =
	     (stage3_rg_full && stage3_rg_stage3[69] &&
	      stage3_rg_stage3[68:64] == stage1_rg_stage_input[139:135]) ?
	       stage3_rg_stage3[63:0] :
	       gpr_regfile$read_rs1 ;
  assign rd_val__h8016 =
	     (stage3_rg_full && stage3_rg_stage3[69] &&
	      stage3_rg_stage3[68:64] == stage1_rg_stage_input[134:130]) ?
	       stage3_rg_stage3[63:0] :
	       gpr_regfile$read_rs2 ;
  assign rd_val__h8467 = { {32{v32__h8465[31]}}, v32__h8465 } ;
  assign rd_val__h8481 = stage1_rg_stage_input[401:338] + rd_val__h8467 ;
  assign rg_cur_priv_4_EQ_0b11_09_OR_rg_cur_priv_4_EQ_0_ETC___d521 =
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[21] ||
	      rg_cur_priv == 2'b0 && csr_regfile$read_misa[13]) &&
	     stage1_rg_stage_input[87:76] == 12'b000100000101 ;
  assign rg_state_3_EQ_12_0_AND_csr_regfile_wfi_resume__ETC___d1897 =
	     rg_state == 4'd12 && csr_regfile$wfi_resume &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352) ;
  assign rg_state_3_EQ_3_553_AND_NOT_csr_regfile_interr_ETC___d1767 =
	     rg_state == 4'd3 &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1763 &&
	     !stage3_rg_full &&
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 ==
	     2'd0 &&
	     stage1_rg_full &&
	     stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	     NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 ;
  assign rg_state_3_EQ_3_553_AND_NOT_csr_regfile_interr_ETC___d1877 =
	     rg_state_3_EQ_3_553_AND_NOT_csr_regfile_interr_ETC___d1767 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	     4'd6 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352) ;
  assign rg_state_3_EQ_3_553_AND_NOT_csr_regfile_interr_ETC___d1886 =
	     rg_state_3_EQ_3_553_AND_NOT_csr_regfile_interr_ETC___d1767 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	     4'd5 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352) ;
  assign rg_state_3_EQ_3_553_AND_stage3_rg_full_4_OR_NO_ETC___d1563 =
	     rg_state == 4'd3 &&
	     (stage3_rg_full ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 !=
	      2'd0 ||
	      stage1_rg_full ||
	      stageD_rg_full ||
	      stageF_rg_full) &&
	     (stage3_rg_full ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 !=
	      2'd3) &&
	     stage3_rg_full_4_OR_NOT_IF_stage2_rg_full_03_T_ETC___d1561 ;
  assign rg_state_3_EQ_5_901_AND_NOT_stageF_rg_full_327_ETC___d1902 =
	     rg_state == 4'd5 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352) ;
  assign rg_state_3_EQ_8_849_AND_NOT_stageF_rg_full_327_ETC___d1850 =
	     rg_state == 4'd8 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352) ;
  assign rg_trap_info_777_BITS_131_TO_68_778_EQ_csr_reg_ETC___d1787 =
	     rg_trap_info[131:68] == csr_regfile$csr_trap_actions[193:130] ;
  assign rs1__h11547 = { 2'b01, stageD_rg_data[73:71] } ;
  assign rs1_val__h23728 =
	     (rg_trap_instr[14:12] == 3'b001) ?
	       rg_csr_val1 :
	       { 59'd0, rg_trap_instr[19:15] } ;
  assign rs1_val_bypassed229_BITS_31_TO_0_MINUS_rs2_val_ETC__q11 =
	     rs1_val_bypassed__h5229[31:0] - rs2_val_bypassed__h5235[31:0] ;
  assign rs1_val_bypassed229_BITS_31_TO_0_PLUS_rs2_val__ETC__q10 =
	     rs1_val_bypassed__h5229[31:0] + rs2_val_bypassed__h5235[31:0] ;
  assign rs1_val_bypassed229_BITS_31_TO_0_SRL_rs2_val_b_ETC__q9 =
	     rs1_val_bypassed__h5229[31:0] >> rs2_val_bypassed__h5235[4:0] |
	     ~(32'hFFFFFFFF >> rs2_val_bypassed__h5235[4:0]) &
	     {32{rs1_val_bypassed229_BITS_31_TO_0__q8[31]}} ;
  assign rs1_val_bypassed229_BITS_31_TO_0__q8 =
	     rs1_val_bypassed__h5229[31:0] ;
  assign rs1_val_bypassed__h5229 =
	     (stage1_rg_stage_input[139:135] == 5'd0) ? 64'd0 : val__h7944 ;
  assign rs2_val_bypassed__h5235 =
	     (stage1_rg_stage_input[134:130] == 5'd0) ? 64'd0 : val__h8018 ;
  assign shamt__h8369 =
	     (stage1_rg_stage_input[151:145] == 7'b0010011) ?
	       stage1_rg_stage_input[81:76] :
	       rs2_val_bypassed__h5235[5:0] ;
  assign stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489 =
	     stage1_rg_full &&
	     NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	     (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) ;
  assign stage1_rg_stage_input_07_BITS_112_TO_110_36_EQ_ETC___d440 =
	     stage1_rg_stage_input[112:110] == 3'b0 &&
	     (stage1_rg_stage_input[151:145] != 7'b0110011 ||
	      !stage1_rg_stage_input[262]) ||
	     stage1_rg_stage_input[112:110] == 3'b0 &&
	     stage1_rg_stage_input[151:145] == 7'b0110011 &&
	     stage1_rg_stage_input[262] ||
	     stage1_rg_stage_input[112:110] == 3'b010 ||
	     stage1_rg_stage_input[112:110] == 3'b011 ||
	     stage1_rg_stage_input[112:110] == 3'b100 ||
	     stage1_rg_stage_input[112:110] == 3'b110 ||
	     stage1_rg_stage_input[112:110] == 3'b111 ;
  assign stage1_rg_stage_input_07_BITS_151_TO_145_34_EQ_ETC___d433 =
	     stage1_rg_stage_input[151:145] == 7'b0110011 &&
	     stage1_rg_stage_input[104:98] == 7'b0000001 ||
	     stage1_rg_stage_input[151:145] == 7'b0111011 &&
	     stage1_rg_stage_input[104:98] == 7'b0000001 ||
	     (stage1_rg_stage_input[151:145] == 7'b0010011 ||
	      stage1_rg_stage_input[151:145] == 7'b0110011) &&
	     (stage1_rg_stage_input[112:110] == 3'b001 ||
	      stage1_rg_stage_input[112:110] == 3'b101) ;
  assign stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d1525 =
	     (stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d1522 ||
	      IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 ==
	      4'd0) &&
	     (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) ;
  assign stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 =
	     stage1_rg_stage_input[335:334] == rg_epoch ;
  assign stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227 =
	     stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194 ==
	     2'd1 &&
	     (IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d211 ||
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d213) ;
  assign stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d864 =
	     stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	     NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd0 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd1 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd2 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd3 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd4 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd5 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd6 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd7 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd8 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd9 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd10 &&
	     IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 !=
	     4'd11 ;
  assign stage1_rg_stage_input_BITS_30_TO_10__q2 =
	     stage1_rg_stage_input[30:10] ;
  assign stage1_rg_stage_input_BITS_63_TO_51__q1 =
	     stage1_rg_stage_input[63:51] ;
  assign stage1_rg_stage_input_BITS_75_TO_64__q7 =
	     stage1_rg_stage_input[75:64] ;
  assign stage1_rg_stage_input_BITS_87_TO_76__q21 =
	     stage1_rg_stage_input[87:76] ;
  assign stage3_rg_full_4_OR_NOT_IF_stage2_rg_full_03_T_ETC___d1561 =
	     stage3_rg_full ||
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 !=
	     2'd0 ||
	     !stage1_rg_full ||
	     !stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	     IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486 ;
  assign stageF_f_reset_rsps_i_notEmpty__471_AND_stageD_ETC___d1491 =
	     stageF_f_reset_rsps$EMPTY_N && stageD_f_reset_rsps$EMPTY_N &&
	     stage1_f_reset_rsps$EMPTY_N &&
	     stage2_f_reset_rsps$EMPTY_N &&
	     stage3_f_reset_rsps$EMPTY_N &&
	     f_reset_rsps$FULL_N &&
	     NOT_rg_run_on_reset_477_478_OR_imem_rg_pc_BITS_ETC___d1485 ;
  assign stageF_rg_full_327_AND_near_mem_imem_valid_AND_ETC___d1359 =
	     stageF_rg_full && near_mem$imem_valid &&
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352 &&
	     !near_mem$imem_exc ;
  assign sxl__h6541 =
	     (csr_regfile$read_misa[27:26] == 2'd2) ?
	       csr_regfile$read_mstatus[35:34] :
	       2'd0 ;
  assign tmp__h10574 =
	     rs1_val_bypassed__h5229[31:0] >> stage1_rg_stage_input[80:76] |
	     ~(32'hFFFFFFFF >> stage1_rg_stage_input[80:76]) &
	     {32{rs1_val_bypassed229_BITS_31_TO_0__q8[31]}} ;
  assign trap_info_tval__h9919 =
	     (stage1_rg_stage_input[151:145] != 7'b1101111 &&
	      stage1_rg_stage_input[151:145] != 7'b1100111 &&
	      (stage1_rg_stage_input[151:145] != 7'b1110011 ||
	       stage1_rg_stage_input[112:110] != 3'b0 ||
	       stage1_rg_stage_input[144:140] != 5'd0 ||
	       stage1_rg_stage_input[139:135] != 5'd0 ||
	       stage1_rg_stage_input[87:76] != 12'b0 &&
	       stage1_rg_stage_input[87:76] != 12'b000000000001)) ?
	       (stage1_rg_stage_input[333] ?
		  { 32'd0, stage1_rg_stage_input[263:232] } :
		  { 48'd0, stage1_rg_stage_input[231:216] }) :
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q23 ;
  assign uxl__h6542 =
	     (csr_regfile$read_misa[27:26] == 2'd2) ?
	       csr_regfile$read_mstatus[33:32] :
	       2'd0 ;
  assign v32__h8465 = { stage1_rg_stage_input[50:31], 12'h0 } ;
  assign val__h7944 =
	     (IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194 ==
	      2'd2 &&
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d211) ?
	       x_out_bypass_rd_val__h7812 :
	       rd_val__h7942 ;
  assign val__h8018 =
	     (IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194 ==
	      2'd2 &&
	      IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d213) ?
	       x_out_bypass_rd_val__h7812 :
	       rd_val__h8016 ;
  assign value__h9968 =
	     stage1_rg_stage_input[332] ?
	       stage1_rg_stage_input[327:264] :
	       trap_info_tval__h9919 ;
  assign x__h10496 =
	     rs1_val_bypassed__h5229[31:0] << stage1_rg_stage_input[80:76] ;
  assign x__h10549 =
	     rs1_val_bypassed__h5229[31:0] >> stage1_rg_stage_input[80:76] ;
  assign x__h10684 =
	     rs1_val_bypassed__h5229[31:0] << rs2_val_bypassed__h5235[4:0] ;
  assign x__h10729 =
	     rs1_val_bypassed__h5229[31:0] >> rs2_val_bypassed__h5235[4:0] ;
  assign x__h23253 =
	     csr_regfile_read_csr_mcycle__3_MINUS_rg_start__ETC___d1791[63:0] /
	     _theResult____h23252 ;
  assign x_exc_code__h30643 =
	     (csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending) ?
	       csr_regfile$interrupt_pending[3:0] :
	       4'd0 ;
  assign x_out_cf_info_fallthru_PC__h10099 =
	     stage1_rg_stage_input[333] ?
	       next_pc__h9712 :
	       next_pc___1__h9715 ;
  assign x_out_data_to_stage1_instr__h11003 =
	     stageD_rg_data[165] ? stageD_rg_data[95:64] : instr___1__h11039 ;
  assign x_out_data_to_stage2_rd__h8099 =
	     stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ?
	       data_to_stage2_rd__h8089 :
	       5'd0 ;
  assign x_out_data_to_stage2_val2__h8102 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       branch_target__h8232 :
	       rs2_val_bypassed__h5235 ;
  assign x_out_next_pc__h8057 =
	     IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d483 ?
	       data_to_stage2_addr__h8090 :
	       fall_through_pc__h8040 ;
  assign x_out_trap_info_exc_code__h9924 =
	     stage1_rg_stage_input[332] ?
	       stage1_rg_stage_input[331:328] :
	       alu_outputs_exc_code__h8756 ;
  assign y__h24680 = ~rs1_val__h24411 ;
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[199:197])
      3'd0, 3'd1, 3'd4:
	  x_out_data_to_stage3_rd__h7472 = stage2_rg_stage2[196:192];
      3'd2: x_out_data_to_stage3_rd__h7472 = 5'd0;
      default: x_out_data_to_stage3_rd__h7472 = stage2_rg_stage2[196:192];
    endcase
  end
  always@(stage2_rg_stage2 or stage2_mbox$word or near_mem$dmem_word64)
  begin
    case (stage2_rg_stage2[199:197])
      3'd0, 3'd2:
	  x_out_data_to_stage3_rd_val__h7473 = stage2_rg_stage2[127:64];
      3'd1, 3'd4: x_out_data_to_stage3_rd_val__h7473 = near_mem$dmem_word64;
      default: x_out_data_to_stage3_rd_val__h7473 = stage2_mbox$word;
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[199:197])
      3'd0, 3'd1, 3'd4: x_out_bypass_rd__h7811 = stage2_rg_stage2[196:192];
      default: x_out_bypass_rd__h7811 = stage2_rg_stage2[196:192];
    endcase
  end
  always@(stage2_rg_stage2 or stage2_mbox$word)
  begin
    case (stage2_rg_stage2[199:197])
      3'd0, 3'd1, 3'd4: x_out_bypass_rd_val__h7812 = stage2_rg_stage2[127:64];
      default: x_out_bypass_rd_val__h7812 = stage2_mbox$word;
    endcase
  end
  always@(rg_trap_instr or rg_csr_val1)
  begin
    case (rg_trap_instr[14:12])
      3'b010, 3'b011: rs1_val__h24411 = rg_csr_val1;
      default: rs1_val__h24411 = { 59'd0, rg_trap_instr[19:15] };
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
  always@(stage1_rg_stage_input or alu_outputs___1_exc_code__h8712)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011,
      7'b0001111,
      7'b0010011,
      7'b0010111,
      7'b0011011,
      7'b0100011,
      7'b0110011,
      7'b0110111,
      7'b0111011,
      7'b1100011:
	  alu_outputs_exc_code__h8756 = 4'd2;
      7'b1100111, 7'b1101111: alu_outputs_exc_code__h8756 = 4'd0;
      7'b1110011:
	  alu_outputs_exc_code__h8756 = alu_outputs___1_exc_code__h8712;
      default: alu_outputs_exc_code__h8756 = 4'd2;
    endcase
  end
  always@(stage2_rg_stage2 or
	  IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_3_ETC___d131 or
	  IF_near_mem_dmem_valid__25_THEN_IF_near_mem_dm_ETC___d128)
  begin
    case (stage2_rg_stage2[199:197])
      3'd0: CASE_stage2_rg_stage2_BITS_199_TO_197_0_2_1_IF_ETC__q5 = 2'd2;
      3'd1, 3'd2, 3'd4:
	  CASE_stage2_rg_stage2_BITS_199_TO_197_0_2_1_IF_ETC__q5 =
	      IF_near_mem_dmem_valid__25_THEN_IF_near_mem_dm_ETC___d128;
      default: CASE_stage2_rg_stage2_BITS_199_TO_197_0_2_1_IF_ETC__q5 =
		   IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_3_ETC___d131;
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_mbox$valid or near_mem$dmem_valid or near_mem$dmem_exc)
  begin
    case (stage2_rg_stage2[199:197])
      3'd1, 3'd2, 3'd4:
	  IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_1_ETC___d148 =
	      !near_mem$dmem_valid || near_mem$dmem_exc;
      default: IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_1_ETC___d148 =
		   !stage2_mbox$valid;
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_mbox$valid or near_mem$dmem_valid or near_mem$dmem_exc)
  begin
    case (stage2_rg_stage2[199:197])
      3'd1, 3'd2, 3'd4:
	  IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_1_ETC___d157 =
	      near_mem$dmem_valid && !near_mem$dmem_exc;
      default: IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_1_ETC___d157 =
		   stage2_mbox$valid;
    endcase
  end
  always@(stage2_rg_stage2 or
	  IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_3_ETC___d131 or
	  IF_NOT_near_mem_dmem_valid__25_44_OR_NOT_near__ETC___d190)
  begin
    case (stage2_rg_stage2[199:197])
      3'd0: CASE_stage2_rg_stage2_BITS_199_TO_197_0_2_1_IF_ETC__q6 = 2'd2;
      3'd1, 3'd4:
	  CASE_stage2_rg_stage2_BITS_199_TO_197_0_2_1_IF_ETC__q6 =
	      IF_NOT_near_mem_dmem_valid__25_44_OR_NOT_near__ETC___d190;
      3'd2: CASE_stage2_rg_stage2_BITS_199_TO_197_0_2_1_IF_ETC__q6 = 2'd0;
      default: CASE_stage2_rg_stage2_BITS_199_TO_197_0_2_1_IF_ETC__q6 =
		   IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_3_ETC___d131;
    endcase
  end
  always@(stage1_rg_stage_input or
	  _theResult___fst__h9343 or
	  rd_val___1__h10627 or
	  rd_val___1__h10681 or rd_val___1__h10726 or rd_val___1__h10675)
  begin
    case (stage1_rg_stage_input[97:88])
      10'b0: alu_outputs___1_val1__h8460 = rd_val___1__h10627;
      10'b0000000001: alu_outputs___1_val1__h8460 = rd_val___1__h10681;
      10'b0000000101: alu_outputs___1_val1__h8460 = rd_val___1__h10726;
      10'b0100000000: alu_outputs___1_val1__h8460 = rd_val___1__h10675;
      default: alu_outputs___1_val1__h8460 = _theResult___fst__h9343;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d275 or
	  IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d271 or
	  IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d273)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b0:
	  IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d408 =
	      !IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d271;
      3'b001:
	  IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d408 =
	      IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d271;
      3'b100:
	  IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d408 =
	      !IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d273;
      3'b101:
	  IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d408 =
	      IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d273;
      3'b110:
	  IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d408 =
	      !IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d275;
      default: IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d408 =
		   stage1_rg_stage_input[112:110] != 3'b111 ||
		   IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d275;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d275 or
	  IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d271 or
	  IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d273)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b0:
	  IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d282 =
	      IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d271;
      3'b001:
	  IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d282 =
	      !IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d271;
      3'b100:
	  IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d282 =
	      IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d273;
      3'b101:
	  IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d282 =
	      !IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d273;
      3'b110:
	  IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d282 =
	      IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d275;
      default: IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d282 =
		   stage1_rg_stage_input[112:110] == 3'b111 &&
		   !IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d275;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q12 =
	      stage1_rg_stage_input[112:110] != 3'b0 &&
	      stage1_rg_stage_input[112:110] != 3'b100 &&
	      stage1_rg_stage_input[112:110] != 3'b001 &&
	      stage1_rg_stage_input[112:110] != 3'b101 &&
	      stage1_rg_stage_input[112:110] != 3'b010 &&
	      stage1_rg_stage_input[112:110] != 3'b110 &&
	      stage1_rg_stage_input[112:110] != 3'b011;
      7'b0100011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q12 =
	      stage1_rg_stage_input[112:110] != 3'b0 &&
	      stage1_rg_stage_input[112:110] != 3'b001 &&
	      stage1_rg_stage_input[112:110] != 3'b010 &&
	      stage1_rg_stage_input[112:110] != 3'b011;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q12 =
		   stage1_rg_stage_input[151:145] != 7'b0101111 ||
		   stage1_rg_stage_input[109:105] != 5'b00010 &&
		   stage1_rg_stage_input[109:105] != 5'b00011 &&
		   stage1_rg_stage_input[109:105] != 5'b0 &&
		   stage1_rg_stage_input[109:105] != 5'b00001 &&
		   stage1_rg_stage_input[109:105] != 5'b01100 &&
		   stage1_rg_stage_input[109:105] != 5'b01000 &&
		   stage1_rg_stage_input[109:105] != 5'b00100 &&
		   stage1_rg_stage_input[109:105] != 5'b10000 &&
		   stage1_rg_stage_input[109:105] != 5'b11000 &&
		   stage1_rg_stage_input[109:105] != 5'b10100 &&
		   stage1_rg_stage_input[109:105] != 5'b11100 ||
		   stage1_rg_stage_input[112:110] != 3'b010 &&
		   stage1_rg_stage_input[112:110] != 3'b011;
    endcase
  end
  always@(stage1_rg_stage_input or
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q12 or
	  NOT_stage1_rg_stage_input_07_BITS_112_TO_110_3_ETC___d318)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q13 =
	      NOT_stage1_rg_stage_input_07_BITS_112_TO_110_3_ETC___d318;
      7'b0011011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q13 =
	      stage1_rg_stage_input[112:110] != 3'b0 &&
	      (stage1_rg_stage_input[112:110] != 3'b001 ||
	       stage1_rg_stage_input[257]) &&
	      (stage1_rg_stage_input[112:110] != 3'b101 ||
	       stage1_rg_stage_input[257]);
      7'b0111011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q13 =
	      stage1_rg_stage_input[97:88] != 10'b0 &&
	      stage1_rg_stage_input[97:88] != 10'b0100000000 &&
	      stage1_rg_stage_input[97:88] != 10'b0000000001 &&
	      stage1_rg_stage_input[97:88] != 10'b0000000101 &&
	      stage1_rg_stage_input[97:88] != 10'b0100000101;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q13 =
		   stage1_rg_stage_input[151:145] != 7'b0110111 &&
		   stage1_rg_stage_input[151:145] != 7'b0010111 &&
		   CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q12;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14 =
	      stage1_rg_stage_input[112:110] == 3'b0 ||
	      stage1_rg_stage_input[112:110] == 3'b100 ||
	      stage1_rg_stage_input[112:110] == 3'b001 ||
	      stage1_rg_stage_input[112:110] == 3'b101 ||
	      stage1_rg_stage_input[112:110] == 3'b010 ||
	      stage1_rg_stage_input[112:110] == 3'b110 ||
	      stage1_rg_stage_input[112:110] == 3'b011;
      7'b0100011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14 =
	      stage1_rg_stage_input[112:110] == 3'b0 ||
	      stage1_rg_stage_input[112:110] == 3'b001 ||
	      stage1_rg_stage_input[112:110] == 3'b010 ||
	      stage1_rg_stage_input[112:110] == 3'b011;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14 =
		   stage1_rg_stage_input[151:145] == 7'b0101111 &&
		   (stage1_rg_stage_input[109:105] == 5'b00010 ||
		    stage1_rg_stage_input[109:105] == 5'b00011 ||
		    stage1_rg_stage_input[109:105] == 5'b0 ||
		    stage1_rg_stage_input[109:105] == 5'b00001 ||
		    stage1_rg_stage_input[109:105] == 5'b01100 ||
		    stage1_rg_stage_input[109:105] == 5'b01000 ||
		    stage1_rg_stage_input[109:105] == 5'b00100 ||
		    stage1_rg_stage_input[109:105] == 5'b10000 ||
		    stage1_rg_stage_input[109:105] == 5'b11000 ||
		    stage1_rg_stage_input[109:105] == 5'b10100 ||
		    stage1_rg_stage_input[109:105] == 5'b11100) &&
		   (stage1_rg_stage_input[112:110] == 3'b010 ||
		    stage1_rg_stage_input[112:110] == 3'b011);
    endcase
  end
  always@(stage1_rg_stage_input or
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14 or
	  stage1_rg_stage_input_07_BITS_112_TO_110_36_EQ_ETC___d440)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q15 =
	      stage1_rg_stage_input_07_BITS_112_TO_110_36_EQ_ETC___d440;
      7'b0011011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q15 =
	      stage1_rg_stage_input[112:110] == 3'b0 ||
	      (stage1_rg_stage_input[112:110] == 3'b001 ||
	       stage1_rg_stage_input[112:110] == 3'b101) &&
	      !stage1_rg_stage_input[257];
      7'b0111011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q15 =
	      stage1_rg_stage_input[97:88] == 10'b0 ||
	      stage1_rg_stage_input[97:88] == 10'b0100000000 ||
	      stage1_rg_stage_input[97:88] == 10'b0000000001 ||
	      stage1_rg_stage_input[97:88] == 10'b0000000101 ||
	      stage1_rg_stage_input[97:88] == 10'b0100000101;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q15 =
		   stage1_rg_stage_input[151:145] == 7'b0110111 ||
		   stage1_rg_stage_input[151:145] == 7'b0010111 ||
		   CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b0, 3'b001, 3'b010, 3'b011, 3'b100, 3'b101, 3'b110:
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q16 = 4'd1;
      3'd7: CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q16 = 4'd12;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b0: CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q17 = 4'd5;
      3'b001: CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q17 = 4'd6;
      default: CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q17 =
		   4'd12;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b0, 3'b001, 3'b010, 3'b011:
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q18 = 4'd1;
      default: CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q18 =
		   4'd12;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_rg_cur_priv_4_EQ_0b11_09_AND_stage1_rg_stag_ETC___d523)
  begin
    case (stage1_rg_stage_input[87:76])
      12'b0, 12'b000000000001:
	  CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_1_ETC__q19 = 4'd12;
      default: CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_1_ETC__q19 =
		   IF_rg_cur_priv_4_EQ_0b11_09_AND_stage1_rg_stag_ETC___d523;
    endcase
  end
  always@(stage1_rg_stage_input or
	  CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_1_ETC__q19)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b0:
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q20 =
	      (stage1_rg_stage_input[144:140] == 5'd0 &&
	       stage1_rg_stage_input[139:135] == 5'd0) ?
		CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_1_ETC__q19 :
		4'd12;
      3'b001, 3'b101:
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q20 = 4'd3;
      3'b010, 3'b011, 3'b110, 3'b111:
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q20 = 4'd4;
      3'd4: CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q20 = 4'd12;
    endcase
  end
  always@(stage1_rg_stage_input or
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q16 or
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q17 or
	  IF_NOT_stage1_rg_stage_input_07_BITS_112_TO_11_ETC___d493 or
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q18 or
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q20)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d541 =
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q16;
      7'b0001111:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d541 =
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q17;
      7'b0010011, 7'b0110011:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d541 =
	      IF_NOT_stage1_rg_stage_input_07_BITS_112_TO_11_ETC___d493;
      7'b0010111, 7'b0110111:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d541 = 4'd1;
      7'b0011011:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d541 =
	      (stage1_rg_stage_input[112:110] != 3'b0 &&
	       (stage1_rg_stage_input[112:110] != 3'b001 ||
		stage1_rg_stage_input[257]) &&
	       (stage1_rg_stage_input[112:110] != 3'b101 ||
		stage1_rg_stage_input[257])) ?
		4'd12 :
		4'd1;
      7'b0100011:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d541 =
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q18;
      7'b0101111:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d541 =
	      ((stage1_rg_stage_input[109:105] == 5'b00010 ||
		stage1_rg_stage_input[109:105] == 5'b00011 ||
		stage1_rg_stage_input[109:105] == 5'b0 ||
		stage1_rg_stage_input[109:105] == 5'b00001 ||
		stage1_rg_stage_input[109:105] == 5'b01100 ||
		stage1_rg_stage_input[109:105] == 5'b01000 ||
		stage1_rg_stage_input[109:105] == 5'b00100 ||
		stage1_rg_stage_input[109:105] == 5'b10000 ||
		stage1_rg_stage_input[109:105] == 5'b11000 ||
		stage1_rg_stage_input[109:105] == 5'b10100 ||
		stage1_rg_stage_input[109:105] == 5'b11100) &&
	       (stage1_rg_stage_input[112:110] == 3'b010 ||
		stage1_rg_stage_input[112:110] == 3'b011)) ?
		4'd1 :
		4'd12;
      7'b0111011:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d541 =
	      (stage1_rg_stage_input[97:88] != 10'b0 &&
	       stage1_rg_stage_input[97:88] != 10'b0100000000 &&
	       stage1_rg_stage_input[97:88] != 10'b0000000001 &&
	       stage1_rg_stage_input[97:88] != 10'b0000000101 &&
	       stage1_rg_stage_input[97:88] != 10'b0100000101) ?
		4'd12 :
		4'd1;
      7'b1110011:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d541 =
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q20;
      default: IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d541 =
		   4'd12;
    endcase
  end
  always@(stage1_rg_stage_input or
	  stage1_rg_stage_input_07_BITS_151_TO_145_34_EQ_ETC___d433 or
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d541 or
	  IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d282)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d544 =
	      (stage1_rg_stage_input[112:110] != 3'b0 &&
	       stage1_rg_stage_input[112:110] != 3'b001 &&
	       stage1_rg_stage_input[112:110] != 3'b100 &&
	       stage1_rg_stage_input[112:110] != 3'b101 &&
	       stage1_rg_stage_input[112:110] != 3'b110 &&
	       stage1_rg_stage_input[112:110] != 3'b111) ?
		4'd12 :
		(IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d282 ?
		   4'd2 :
		   4'd1);
      7'b1100111, 7'b1101111:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d544 = 4'd2;
      default: IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d544 =
		   stage1_rg_stage_input_07_BITS_151_TO_145_34_EQ_ETC___d433 ?
		     4'd1 :
		     IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d541;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011:
	  IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d629 = 2'd0;
      7'b1100111:
	  IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d629 = 2'd2;
      7'b1101111:
	  IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d629 = 2'd1;
      default: IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d629 =
		   2'd3;
    endcase
  end
  always@(stage1_rg_stage_input or
	  _theResult_____1_fst__h9206 or
	  rd_val___1__h9174 or
	  rd_val___1__h9181 or rd_val___1__h9188 or rd_val___1__h9195)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b010: _theResult_____1_fst__h9178 = rd_val___1__h9174;
      3'b011: _theResult_____1_fst__h9178 = rd_val___1__h9181;
      3'b100: _theResult_____1_fst__h9178 = rd_val___1__h9188;
      3'b110: _theResult_____1_fst__h9178 = rd_val___1__h9195;
      default: _theResult_____1_fst__h9178 = _theResult_____1_fst__h9206;
    endcase
  end
  always@(stage1_rg_stage_input or
	  rs1_val_bypassed__h5229 or
	  IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d658 or
	  alu_outputs___1_addr__h8527 or
	  alu_outputs___1_addr__h8255 or next_pc__h8288 or next_pc__h8261)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011:
	  x_out_data_to_stage2_addr__h8100 =
	      IF_stage1_rg_stage_input_07_BITS_139_TO_135_10_ETC___d658;
      7'b0100011:
	  x_out_data_to_stage2_addr__h8100 = alu_outputs___1_addr__h8527;
      7'b1100011:
	  x_out_data_to_stage2_addr__h8100 = alu_outputs___1_addr__h8255;
      7'b1100111: x_out_data_to_stage2_addr__h8100 = next_pc__h8288;
      7'b1101111: x_out_data_to_stage2_addr__h8100 = next_pc__h8261;
      default: x_out_data_to_stage2_addr__h8100 = rs1_val_bypassed__h5229;
    endcase
  end
  always@(stage1_rg_stage_input or
	  next_pc__h8288 or branch_target__h8232 or next_pc__h8261)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011: x_out_cf_info_taken_PC__h10100 = branch_target__h8232;
      7'b1101111: x_out_cf_info_taken_PC__h10100 = next_pc__h8261;
      default: x_out_cf_info_taken_PC__h10100 = next_pc__h8288;
    endcase
  end
  always@(stage1_rg_stage_input or data_to_stage2_addr__h8090)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100111, 7'b1101111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q23 =
	      data_to_stage2_addr__h8090;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q23 =
		   (stage1_rg_stage_input[151:145] == 7'b1110011 &&
		    stage1_rg_stage_input[112:110] == 3'b0 &&
		    stage1_rg_stage_input[144:140] == 5'd0 &&
		    stage1_rg_stage_input[139:135] == 5'd0 &&
		    stage1_rg_stage_input[87:76] == 12'b000000000001) ?
		     stage1_rg_stage_input[401:338] :
		     64'd0;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q24 = 3'd1;
      7'b0010011, 7'b0010111, 7'b0011011, 7'b0110011, 7'b0110111, 7'b0111011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q24 = 3'd0;
      7'b0100011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q24 = 3'd2;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q24 = 3'd4;
    endcase
  end
  always@(stage1_rg_stage_input or
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q24)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011, 7'b1100111, 7'b1101111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q25 = 3'd0;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q25 =
		   ((stage1_rg_stage_input[151:145] == 7'b0110011 ||
		     stage1_rg_stage_input[151:145] == 7'b0111011) &&
		    stage1_rg_stage_input[104:98] == 7'b0000001) ?
		     3'd3 :
		     CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q24;
    endcase
  end
  always@(stage1_rg_stage_input or
	  alu_outputs___1_val1__h8736 or
	  alu_outputs___1_val1__h8418 or
	  rd_val__h8481 or
	  alu_outputs___1_val1__h8439 or
	  rd_val__h8467 or
	  alu_outputs___1_val1__h8460 or alu_outputs___1_val1__h8716)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d827 =
	      alu_outputs___1_val1__h8418;
      7'b0010111:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d827 =
	      rd_val__h8481;
      7'b0011011:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d827 =
	      alu_outputs___1_val1__h8439;
      7'b0110111:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d827 =
	      rd_val__h8467;
      7'b0111011:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d827 =
	      alu_outputs___1_val1__h8460;
      7'b1110011:
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d827 =
	      alu_outputs___1_val1__h8716;
      default: IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d827 =
		   alu_outputs___1_val1__h8736;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d829 or
	  x_out_cf_info_fallthru_PC__h10099)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100111, 7'b1101111:
	  x_out_data_to_stage2_val1__h8101 =
	      x_out_cf_info_fallthru_PC__h10099;
      default: x_out_data_to_stage2_val1__h8101 =
		   IF_stage1_rg_stage_input_07_BITS_151_TO_145_34_ETC___d829;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cfg_logdelay <= `BSV_ASSIGNMENT_DELAY 64'd0;
	cfg_verbosity <= `BSV_ASSIGNMENT_DELAY 4'd0;
	imem_rg_cache_addr <= `BSV_ASSIGNMENT_DELAY 64'hFFFFFFFFFFFFFFFF;
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
    imem_rg_cache_addr = 64'hAAAAAAAAAAAAAAAA;
    imem_rg_cache_b16 = 16'hAAAA;
    imem_rg_f3 = 3'h2;
    imem_rg_mstatus_MXR = 1'h0;
    imem_rg_pc = 64'hAAAAAAAAAAAAAAAA;
    imem_rg_priv = 2'h2;
    imem_rg_satp = 64'hAAAAAAAAAAAAAAAA;
    imem_rg_sstatus_SUM = 1'h0;
    imem_rg_tval = 64'hAAAAAAAAAAAAAAAA;
    rg_csr_pc = 64'hAAAAAAAAAAAAAAAA;
    rg_csr_val1 = 64'hAAAAAAAAAAAAAAAA;
    rg_cur_priv = 2'h2;
    rg_epoch = 2'h2;
    rg_mstatus_MXR = 1'h0;
    rg_next_pc = 64'hAAAAAAAAAAAAAAAA;
    rg_run_on_reset = 1'h0;
    rg_sstatus_SUM = 1'h0;
    rg_start_CPI_cycles = 64'hAAAAAAAAAAAAAAAA;
    rg_start_CPI_instrs = 64'hAAAAAAAAAAAAAAAA;
    rg_state = 4'hA;
    rg_trap_info = 132'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    rg_trap_instr = 32'hAAAAAAAA;
    rg_trap_interrupt = 1'h0;
    stage1_rg_full = 1'h0;
    stage1_rg_stage_input =
	402'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    stage2_rg_full = 1'h0;
    stage2_rg_resetting = 1'h0;
    stage2_rg_stage2 =
	298'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    stage3_rg_full = 1'h0;
    stage3_rg_stage3 = 168'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    stageD_rg_data =
	234'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
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
	$write(" sxl:%0d uxl:%0d", sxl__h6541, uxl__h6542);
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
	  (!stage3_rg_full || !stage3_rg_stage3[69]))
	$write("Rd -");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage3_rg_full && stage3_rg_stage3[69])
	$write("Rd %0d ",
	       stage3_rg_stage3[68:64],
	       "rd_val:%h",
	       stage3_rg_stage3[63:0]);
    if (RST_N != `BSV_RESET_VALUE) if (WILL_FIRE_RL_rl_show_pipe) $write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$display("    Stage2: pc 0x%08h instr 0x%08h priv %0d",
		 stage2_rg_stage2[295:232],
		 stage2_rg_stage2[231:200],
		 stage2_rg_stage2[297:296]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("Output_Stage2", " EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("Output_Stage2", " BUSY: pc:%0h", stage2_rg_stage2[295:232]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write("Output_Stage2", " NONPIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("Output_Stage2", " PIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("data_to_Stage3 {pc:%h  instr:%h  priv:%0d\n",
	       stage2_rg_stage2[295:232],
	       stage2_rg_stage2[231:200],
	       stage2_rg_stage2[297:296]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("        rd_valid:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3 &&
	  stage2_rg_stage2[199:197] != 3'd0 &&
	  IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_1_ETC___d148)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3 &&
	  (stage2_rg_stage2[199:197] == 3'd0 ||
	   IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_1_ETC___d157))
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("  grd:%0d  rd_val:%h\n",
	       x_out_data_to_stage3_rd__h7472,
	       x_out_data_to_stage3_rd_val__h7473);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write("Trap_Info { ", "epc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write("'h%h", stage2_rg_stage2[295:232]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write("'h%h", near_mem$dmem_exc_code);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write(", ", "tval: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write("'h%h", stage2_rg_stage2[191:128], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write("Trap_Info { ", "epc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write("'h%h", stage2_rg_stage2[295:232]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write("'h%h", near_mem$dmem_exc_code);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write(", ", "tval: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd3)
	$write("'h%h", stage2_rg_stage2[191:128], " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd1 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        Bypass  to Stage1: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("Bypass {");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194 == 2'd0)
	$write("Rd -");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194 != 2'd0)
	$write("Rd %0d ", x_out_bypass_rd__h7811);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194 == 2'd1)
	$write("-");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194 != 2'd0 &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d194 != 2'd1)
	$write("rd_val:%h", x_out_bypass_rd_val__h7812);
    if (RST_N != `BSV_RESET_VALUE) if (WILL_FIRE_RL_rl_show_pipe) $write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$display("    Stage1: pc 0x%08h instr 0x%08h priv %0d",
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("Output_Stage1",
	       " BUSY pc:%h",
	       stage1_rg_stage_input[401:338]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("Output_Stage1",
	       " NONPIPE: pc:%h",
	       stage1_rg_stage_input[401:338]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write("Output_Stage1");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full)
	$write("Output_Stage1", " EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write(" PIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd0)
	$write("CONTROL_DISCARD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd1)
	$write("CONTROL_STRAIGHT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd2)
	$write("CONTROL_BRANCH");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd3)
	$write("CONTROL_CSRR_W");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd4)
	$write("CONTROL_CSRR_S_or_C");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd5)
	$write("CONTROL_FENCE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd6)
	$write("CONTROL_FENCE_I");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd7)
	$write("CONTROL_SFENCE_VMA");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd8)
	$write("CONTROL_MRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd9)
	$write("CONTROL_SRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd10)
	$write("CONTROL_URET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd11)
	$write("CONTROL_WFI");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d620)
	$write("CONTROL_TRAP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d632)
	$write("{", "CF_None");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d636)
	$write("{", "BR ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d642)
	$write("{");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d632)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d636)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d629 == 2'd1)
	$write("JAL [%h->%h/%h]",
	       stage1_rg_stage_input[401:338],
	       x_out_cf_info_taken_PC__h10100,
	       x_out_cf_info_fallthru_PC__h10099);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d629 == 2'd2)
	$write("JALR [%h->%h/%h]",
	       stage1_rg_stage_input[401:338],
	       x_out_cf_info_taken_PC__h10100,
	       x_out_cf_info_fallthru_PC__h10099);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d632)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d636)
	if (stage1_rg_stage_input[151:145] != 7'b1100011 ||
	    IF_stage1_rg_stage_input_07_BITS_112_TO_110_36_ETC___d282)
	  $write("taken ");
	else
	  $write("fallthru ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d642)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d632)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d636)
	$write("[%h->%h %h]",
	       stage1_rg_stage_input[401:338],
	       x_out_cf_info_fallthru_PC__h10099,
	       x_out_cf_info_taken_PC__h10100);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d642)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write("data_to_Stage 2 {pc:%h  instr:%h  priv:%0d\n",
	       stage1_rg_stage_input[401:338],
	       stage1_rg_stage_input[263:232],
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write("            op_stage2:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 == 3'd0)
	$write("OP_Stage2_ALU");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 == 3'd1)
	$write("OP_Stage2_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 == 3'd2)
	$write("OP_Stage2_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 == 3'd3)
	$write("OP_Stage2_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d486) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 != 3'd0 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 != 3'd1 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 != 3'd2 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 != 3'd3)
	$write("OP_Stage2_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write("  rd:%0d\n", x_out_data_to_stage2_rd__h8099);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write("            addr:%h  val1:%h  val2:%h}",
	       x_out_data_to_stage2_addr__h8100,
	       x_out_data_to_stage2_val1__h8101,
	       x_out_data_to_stage2_val2__h8102);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd0)
	$write("CONTROL_DISCARD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd1)
	$write("CONTROL_STRAIGHT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd2)
	$write("CONTROL_BRANCH");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd3)
	$write("CONTROL_CSRR_W");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd4)
	$write("CONTROL_CSRR_S_or_C");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd5)
	$write("CONTROL_FENCE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd6)
	$write("CONTROL_FENCE_I");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd7)
	$write("CONTROL_SFENCE_VMA");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd8)
	$write("CONTROL_MRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd9)
	$write("CONTROL_SRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd10)
	$write("CONTROL_URET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd11)
	$write("CONTROL_WFI");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d864)
	$write("CONTROL_TRAP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("Trap_Info { ", "epc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("'h%h", stage1_rg_stage_input[401:338]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("'h%h", x_out_trap_info_exc_code__h9924);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write(", ", "tval: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 &&
	  NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d416)
	$write("'h%h", value__h9968, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_06_AND_NOT_stage1_rg_stage_inpu_ETC___d489)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d227)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  !IF_IF_stage1_rg_stage_input_07_BITS_151_TO_145_ETC___d914)
	$write("\n        redirect next_pc:%h", x_out_next_pc__h8057);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_07_BITS_335_TO_334_0_ETC___d420 &&
	  IF_IF_stage1_rg_stage_input_07_BITS_151_TO_145_ETC___d914)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$display("    StageD: pc 0x%08h instr 0x%08h priv %0d epoch %0d",
		 stageD_rg_data[233:170],
		 x_out_data_to_stage1_instr__h11003,
		 stageD_rg_data[167:166],
		 stageD_rg_data[169:168]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("Output_StageD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full) $write(" PIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageD_rg_full) $write(" EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && stageD_rg_data[164])
	$write("data_to_Stage1 {pc:%0h  priv:%0d  epoch:%0d",
	       stageD_rg_data[233:170],
	       stageD_rg_data[167:166],
	       stageD_rg_data[169:168]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && !stageD_rg_data[164])
	$write("data_to_Stage1 {pc:%0h  priv:%0d  epoch:%0d",
	       stageD_rg_data[233:170],
	       stageD_rg_data[167:166],
	       stageD_rg_data[169:168]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageD_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && stageD_rg_data[164])
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  !stageD_rg_data[164] &&
	  stageD_rg_data[165])
	$write("  instr_C:%0h", stageD_rg_data[79:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  !stageD_rg_data[164] &&
	  !stageD_rg_data[165])
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageD_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && stageD_rg_data[164])
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && !stageD_rg_data[164])
	$write("  instr:%0h  pred_pc:%0h",
	       x_out_data_to_stage1_instr__h11003,
	       stageD_rg_data[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageD_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && stageD_rg_data[164])
	$write("  ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && !stageD_rg_data[164])
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageD_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[164] &&
	  stageD_rg_data[163:160] == 4'd0)
	$write("INSTRUCTION_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[164] &&
	  stageD_rg_data[163:160] == 4'd1)
	$write("INSTRUCTION_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[164] &&
	  stageD_rg_data[163:160] == 4'd2)
	$write("ILLEGAL_INSTRUCTION");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[164] &&
	  stageD_rg_data[163:160] == 4'd3)
	$write("BREAKPOINT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[164] &&
	  stageD_rg_data[163:160] == 4'd4)
	$write("LOAD_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[164] &&
	  stageD_rg_data[163:160] == 4'd5)
	$write("LOAD_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[164] &&
	  stageD_rg_data[163:160] == 4'd6)
	$write("STORE_AMO_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[164] &&
	  stageD_rg_data[163:160] == 4'd7)
	$write("STORE_AMO_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[164] &&
	  stageD_rg_data[163:160] == 4'd8)
	$write("ECALL_FROM_U");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[164] &&
	  stageD_rg_data[163:160] == 4'd9)
	$write("ECALL_FROM_S");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[164] &&
	  stageD_rg_data[163:160] == 4'd11)
	$write("ECALL_FROM_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[164] &&
	  stageD_rg_data[163:160] == 4'd12)
	$write("INSTRUCTION_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[164] &&
	  stageD_rg_data[163:160] == 4'd13)
	$write("LOAD_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[164] &&
	  stageD_rg_data[163:160] == 4'd15)
	$write("STORE_AMO_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full &&
	  stageD_rg_data[164] &&
	  stageD_rg_data[163:160] != 4'd0 &&
	  stageD_rg_data[163:160] != 4'd1 &&
	  stageD_rg_data[163:160] != 4'd2 &&
	  stageD_rg_data[163:160] != 4'd3 &&
	  stageD_rg_data[163:160] != 4'd4 &&
	  stageD_rg_data[163:160] != 4'd5 &&
	  stageD_rg_data[163:160] != 4'd6 &&
	  stageD_rg_data[163:160] != 4'd7 &&
	  stageD_rg_data[163:160] != 4'd8 &&
	  stageD_rg_data[163:160] != 4'd9 &&
	  stageD_rg_data[163:160] != 4'd11 &&
	  stageD_rg_data[163:160] != 4'd12 &&
	  stageD_rg_data[163:160] != 4'd13 &&
	  stageD_rg_data[163:160] != 4'd15)
	$write("unknown trap Exc_Code %d", stageD_rg_data[163:160]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && !stageD_rg_data[164])
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageD_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && stageD_rg_data[164])
	$write(" tval %0h", stageD_rg_data[159:96]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageD_rg_full && !stageD_rg_data[164])
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
		 d_instr__h17070,
		 stageF_rg_priv,
		 stageF_rg_epoch);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("Output_StageF");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1345))
	$write(" BUSY: pc:%h", imem_rg_pc);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352)
	$write(" PIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write(" EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1345))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352)
	$write("data_to_StageD {pc:%h  priv:%0d  epoch:%0d",
	       imem_rg_pc,
	       stageF_rg_priv,
	       stageF_rg_epoch);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1345))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc)
	$write("  ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_327_AND_near_mem_imem_valid_AND_ETC___d1359)
	$write("  instr:%h  pred_pc:%h",
	       d_instr__h17070,
	       stageF_branch_predictor$predict_rsp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1345))
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
	  near_mem_imem_valid_AND_near_mem_imem_exc__1_A_ETC___d1447)
	$write("unknown trap Exc_Code %d", near_mem$imem_exc_code);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_327_AND_near_mem_imem_valid_AND_ETC___d1359)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d1345))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d1352)
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
	  rg_trap_info_777_BITS_131_TO_68_778_EQ_csr_reg_ETC___d1787)
	$display("%0d: %m.rl_stage1_trap: Tight infinite trap loop: pc 0x%0x instr 0x%08x",
		 csr_regfile$read_csr_mcycle,
		 csr_regfile$csr_trap_actions[193:130],
		 rg_trap_instr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  rg_trap_info_777_BITS_131_TO_68_778_EQ_csr_reg_ETC___d1787)
	$display("CPI: %0d.%0d = (%0d/%0d) since last 'continue'",
		 cpi__h23254,
		 cpifrac__h23255,
		 delta_CPI_cycles__h23250,
		 _theResult____h23252);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  rg_trap_info_777_BITS_131_TO_68_778_EQ_csr_reg_ETC___d1787)
	$finish(32'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  (cur_verbosity__h3708 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 rg_trap_info[131:68],
		 rg_trap_instr,
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap && cur_verbosity__h3708 != 4'd0)
	$display("    mcause:0x%0h  epc 0x%0h  tval:0x%0h  next_pc 0x%0h, new_priv %0d new_mstatus 0x%0h",
		 csr_regfile$csr_trap_actions[65:2],
		 rg_trap_info[131:68],
		 rg_trap_info[63:0],
		 csr_regfile$csr_trap_actions[193:130],
		 csr_regfile$csr_trap_actions[1:0],
		 csr_regfile$csr_trap_actions[129:66]);
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
	  (cur_verbosity__h3708 != 4'd0 ||
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
		 rs1_val__h23728,
		 rg_trap_instr[31:20],
		 csr_regfile$read_csr[63:0],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W_2 &&
	  !csr_regfile$access_permitted_1 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    Trap on CSR permissions: Rs1 %0d Rs1_val 0x%0h csr 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h23728,
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
	  (cur_verbosity__h3708 != 4'd0 ||
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
		 rs1_val__h24411,
		 rg_trap_instr[31:20],
		 csr_regfile$read_csr[63:0],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	  !csr_regfile$access_permitted_2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    Trap on CSR permissions: Rs1 %0d Rs1_val 0x%0h csr 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h24411,
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
	       new_epoch__h18435,
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
		 new_epoch__h18435);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_xRET &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_stage1_xRET", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_xRET &&
	  (cur_verbosity__h3708 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_xRET && cur_verbosity__h3708 != 4'd0)
	$display("    xRET: next_pc:0x%0h  new mstatus:0x%0h  new priv:%0d",
		 csr_regfile$csr_ret_actions[129:66],
		 csr_regfile$csr_ret_actions[63:0],
		 csr_regfile$csr_ret_actions[65:64]);
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
	  (cur_verbosity__h3708 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h18435,
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
		 new_epoch__h18435);
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
	  (cur_verbosity__h3708 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h18435,
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
		 new_epoch__h18435);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_WFI &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_stage1_WFI", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_WFI &&
	  (cur_verbosity__h3708 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
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
	       new_epoch__h18435,
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
		 new_epoch__h18435);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_from_WFI &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_reset_from_WFI", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap_fetch &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h18435,
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
		 new_epoch__h18435);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_interrupt &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_stage1_interrupt", csr_regfile$read_csr_mcycle);
    if (WILL_FIRE_RL_imem_rl_assert_fail)
      begin
        v__h2523 = $stime;
	#0;
      end
    v__h2517 = v__h2523 / 32'd10;
    if (WILL_FIRE_RL_imem_rl_assert_fail)
      $display("%0d: ERROR: CPU_Fetch_C: imem32.is_i32_not_i16 is False",
	       v__h2517);
    if (WILL_FIRE_RL_imem_rl_assert_fail) $finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset)
	$display("%0d: %m.rl_reset_complete: restart at PC = 0x%0h",
		 csr_regfile$read_csr_mcycle,
		 soc_map$m_pc_reset_value);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       soc_map$m_pc_reset_value,
	       new_epoch__h18435,
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
		 soc_map$m_pc_reset_value,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h18435);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && !rg_run_on_reset)
	$display("%0d: %m.rl_reset_complete: entering DEBUG_MODE",
		 csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("%0d: %m.rl_pipe", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe && stage3_rg_full && stage3_rg_stage3[69] &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    S3.fa_deq: write GRd 0x%0h, rd_val 0x%0h",
		 stage3_rg_stage3[68:64],
		 stage3_rg_stage3[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("    S3.enq: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("data_to_Stage3 {pc:%h  instr:%h  priv:%0d\n",
	       stage2_rg_stage2[295:232],
	       stage2_rg_stage2[231:200],
	       stage2_rg_stage2[297:296]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("        rd_valid:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 &&
	  stage2_rg_stage2[199:197] != 3'd0 &&
	  IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_1_ETC___d148)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 &&
	  (stage2_rg_stage2[199:197] == 3'd0 ||
	   IF_stage2_rg_stage2_04_BITS_199_TO_197_05_EQ_1_ETC___d157))
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("  grd:%0d  rd_val:%h\n",
	       x_out_data_to_stage3_rd__h7472,
	       x_out_data_to_stage3_rd_val__h7473);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_03_THEN_IF_stage2_rg_stage2__ETC___d134 == 2'd2 &&
	  (cur_verbosity__h3708 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage2_rg_stage2[295:232],
		 stage2_rg_stage2[231:200],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1594 &&
	  stage1_rg_full &&
	  (!stage1_rg_stage_input_07_BITS_335_TO_334_08_EQ_ETC___d209 ||
	   NOT_IF_stage2_rg_full_03_THEN_IF_stage2_rg_sta_ETC___d1530) &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 == 4'd0 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    rl_pipe: Discarding stage1 due to redirection");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1630)
	$write("    CPU_Stage2.enq (Data_Stage1_to_Stage2) ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1630)
	$write("data_to_Stage 2 {pc:%h  instr:%h  priv:%0d\n",
	       stage1_rg_stage_input[401:338],
	       stage1_rg_stage_input[263:232],
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1630)
	$write("            op_stage2:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1601 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 != 4'd0 &&
	  IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1604 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 == 3'd0)
	$write("OP_Stage2_ALU");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1601 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 != 4'd0 &&
	  IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1604 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 == 3'd1)
	$write("OP_Stage2_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1601 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 != 4'd0 &&
	  IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1604 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 == 3'd2)
	$write("OP_Stage2_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1601 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 != 4'd0 &&
	  IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1604 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 == 3'd3)
	$write("OP_Stage2_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1601 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d547 != 4'd0 &&
	  IF_NOT_stage1_rg_full_06_90_OR_NOT_stage1_rg_s_ETC___d1604 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 != 3'd0 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 != 3'd1 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 != 3'd2 &&
	  IF_stage1_rg_stage_input_07_BITS_335_TO_334_08_ETC___d693 != 3'd3)
	$write("OP_Stage2_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1630)
	$write("  rd:%0d\n", x_out_data_to_stage2_rd__h8099);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1630)
	$write("            addr:%h  val1:%h  val2:%h}",
	       x_out_data_to_stage2_addr__h8100,
	       x_out_data_to_stage2_val1__h8101,
	       x_out_data_to_stage2_val2__h8102);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d1630)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1656 &&
	  stageD_rg_full &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    CPU_Stage1.enq: 0x%08h", stageD_rg_data[233:170]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1697 &&
	  NOT_IF_csr_regfile_read_csr_minstret__6_ULT_cf_ETC___d52)
	$display("    CPU_StageD.enq (Data_StageF_to_StageD)");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1697 &&
	  csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1714)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       stageF_branch_predictor$predict_rsp,
	       stageF_rg_epoch,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1697 &&
	  csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1714)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       1'd0,
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d1697 &&
	  csr_regfile_interrupt_pending_rg_cur_priv_4_51_ETC___d1714)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_start)
	$display("================================================================");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_start)
	$write("CPU: Bluespec  RISC-V  Flute  v3.0");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_start) $display(" (RV64)");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_start)
	$display("Copyright (c) 2016-2020 Bluespec, Inc. All Rights Reserved.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_start)
	$display("================================================================");
  end
  // synopsys translate_on
endmodule