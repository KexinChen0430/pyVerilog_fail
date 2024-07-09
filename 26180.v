module outputs
  wire [511 : 0] dma_server_rdata;
  wire [63 : 0] imem_master_araddr,
		imem_master_awaddr,
		imem_master_wdata,
		mem_master_araddr,
		mem_master_awaddr,
		mem_master_wdata,
		mv_tohost_value;
  wire [15 : 0] dma_server_bid, dma_server_rid;
  wire [7 : 0] imem_master_arlen,
	       imem_master_awlen,
	       imem_master_wstrb,
	       mem_master_arlen,
	       mem_master_awlen,
	       mem_master_wstrb,
	       mv_status;
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
  reg [495 : 0] stage2_rg_stage2;
  wire [495 : 0] stage2_rg_stage2$D_IN;
  wire stage2_rg_stage2$EN;
  // register stage3_rg_full
  reg stage3_rg_full;
  reg stage3_rg_full$D_IN;
  wire stage3_rg_full$EN;
  // register stage3_rg_stage3
  reg [238 : 0] stage3_rg_stage3;
  wire [238 : 0] stage3_rg_stage3$D_IN;
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
  wire [193 : 0] csr_regfile$csr_trap_actions;
  wire [129 : 0] csr_regfile$csr_ret_actions;
  wire [64 : 0] csr_regfile$read_csr;
  wire [63 : 0] csr_regfile$csr_trap_actions_pc,
		csr_regfile$csr_trap_actions_xtval,
		csr_regfile$mav_csr_write_word,
		csr_regfile$read_csr_mcycle,
		csr_regfile$read_csr_minstret,
		csr_regfile$read_mstatus,
		csr_regfile$read_satp,
		csr_regfile$read_sstatus;
  wire [27 : 0] csr_regfile$read_misa;
  wire [11 : 0] csr_regfile$access_permitted_1_csr_addr,
		csr_regfile$access_permitted_2_csr_addr,
		csr_regfile$csr_counter_read_fault_csr_addr,
		csr_regfile$mav_csr_write_csr_addr,
		csr_regfile$mav_read_csr_csr_addr,
		csr_regfile$read_csr_csr_addr,
		csr_regfile$read_csr_port2_csr_addr;
  wire [4 : 0] csr_regfile$interrupt_pending,
	       csr_regfile$ma_update_fcsr_fflags_flags,
	       csr_regfile$mv_update_fcsr_fflags_flags;
  wire [3 : 0] csr_regfile$csr_trap_actions_exc_code;
  wire [2 : 0] csr_regfile$read_frm;
  wire [1 : 0] csr_regfile$access_permitted_1_priv,
	       csr_regfile$access_permitted_2_priv,
	       csr_regfile$csr_counter_read_fault_priv,
	       csr_regfile$csr_ret_actions_from_priv,
	       csr_regfile$csr_trap_actions_from_priv,
	       csr_regfile$interrupt_pending_cur_priv,
	       csr_regfile$ma_update_mstatus_fs_fs,
	       csr_regfile$mv_update_mstatus_fs_fs;
  wire csr_regfile$EN_csr_minstret_incr,
       csr_regfile$EN_csr_ret_actions,
       csr_regfile$EN_csr_trap_actions,
       csr_regfile$EN_debug,
       csr_regfile$EN_ma_update_fcsr_fflags,
       csr_regfile$EN_ma_update_mstatus_fs,
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
  // ports of submodule fpr_regfile
  wire [63 : 0] fpr_regfile$read_rs1,
		fpr_regfile$read_rs2,
		fpr_regfile$read_rs3,
		fpr_regfile$write_rd_rd_val;
  wire [4 : 0] fpr_regfile$read_rs1_port2_rs1,
	       fpr_regfile$read_rs1_rs1,
	       fpr_regfile$read_rs2_rs2,
	       fpr_regfile$read_rs3_rs3,
	       fpr_regfile$write_rd_rd;
  wire fpr_regfile$EN_server_reset_request_put,
       fpr_regfile$EN_server_reset_response_get,
       fpr_regfile$EN_write_rd,
       fpr_regfile$RDY_server_reset_request_put,
       fpr_regfile$RDY_server_reset_response_get;
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
  reg [63 : 0] near_mem$dmem_req_store_value, near_mem$imem_req_addr;
  wire [511 : 0] near_mem$dma_server_rdata, near_mem$dma_server_wdata;
  wire [63 : 0] near_mem$dma_server_araddr,
		near_mem$dma_server_awaddr,
		near_mem$dma_server_wstrb,
		near_mem$dmem_req_addr,
		near_mem$dmem_req_satp,
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
  wire [15 : 0] near_mem$dma_server_arid,
		near_mem$dma_server_awid,
		near_mem$dma_server_bid,
		near_mem$dma_server_rid;
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
	       near_mem$dmem_req_op,
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
       near_mem$EN_sfence_vma_server_request_put,
       near_mem$EN_sfence_vma_server_response_get,
       near_mem$RDY_server_fence_i_request_put,
       near_mem$RDY_server_fence_i_response_get,
       near_mem$RDY_server_fence_request_put,
       near_mem$RDY_server_fence_response_get,
       near_mem$RDY_server_reset_request_put,
       near_mem$RDY_server_reset_response_get,
       near_mem$RDY_sfence_vma_server_request_put,
       near_mem$RDY_sfence_vma_server_response_get,
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
  // ports of submodule stage2_fbox
  wire [63 : 0] stage2_fbox$req_v1,
		stage2_fbox$req_v2,
		stage2_fbox$req_v3,
		stage2_fbox$word_fst;
  wire [6 : 0] stage2_fbox$req_f7, stage2_fbox$req_opcode;
  wire [4 : 0] stage2_fbox$req_rs2, stage2_fbox$word_snd;
  wire [2 : 0] stage2_fbox$req_rm;
  wire stage2_fbox$EN_req,
       stage2_fbox$EN_server_reset_request_put,
       stage2_fbox$EN_server_reset_response_get,
       stage2_fbox$RDY_server_reset_request_put,
       stage2_fbox$RDY_server_reset_response_get,
       stage2_fbox$valid;
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
       CAN_FIRE_RL_rl_finish_SFENCE_VMA,
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
       CAN_FIRE_RL_rl_stage1_SFENCE_VMA,
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
       WILL_FIRE_RL_rl_finish_SFENCE_VMA,
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
       WILL_FIRE_RL_rl_stage1_SFENCE_VMA,
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
       MUX_gpr_regfile$write_rd_1__SEL_2,
       MUX_imem_rg_cache_addr$write_1__SEL_1,
       MUX_imem_rg_cache_addr$write_1__SEL_2,
       MUX_rg_next_pc$write_1__SEL_1,
       MUX_rg_next_pc$write_1__SEL_2,
       MUX_rg_state$write_1__SEL_1,
       MUX_rg_state$write_1__SEL_10,
       MUX_rg_state$write_1__SEL_11,
       MUX_rg_state$write_1__SEL_12,
       MUX_rg_state$write_1__SEL_13,
       MUX_rg_state$write_1__SEL_14,
       MUX_rg_state$write_1__SEL_15,
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
       MUX_stage3_rg_full$write_1__VAL_2,
       MUX_stageD_rg_full$write_1__VAL_2,
       MUX_stageF_rg_full$write_1__VAL_2;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h2667;
  reg [31 : 0] v__h2661;
  // synopsys translate_on
  // remaining internal signals
  reg [63 : 0] CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q19,
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q20,
	       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1520,
	       _theResult_____1_fst__h12542,
	       alu_outputs___1_val1__h10598,
	       rs1_val__h35329,
	       value__h8670,
	       value__h8884,
	       x_out_bypass_rd_val__h9272,
	       x_out_cf_info_taken_PC__h16275,
	       x_out_data_to_stage2_addr__h10120,
	       x_out_data_to_stage2_val1__h10121,
	       x_out_data_to_stage3_frd_val__h8345,
	       x_out_data_to_stage3_rd_val__h8341,
	       x_out_fbypass_rd_val__h9454;
  reg [4 : 0] data_to_stage2_rd__h10102,
	      x_out_bypass_rd__h9271,
	      x_out_data_to_stage3_fpr_flags__h8344,
	      x_out_data_to_stage3_rd__h8340,
	      x_out_fbypass_rd__h9453;
  reg [3 : 0] CASE_rg_cur_priv_0b0_8_0b1_9_11__q15,
	      CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q16,
	      alu_outputs_exc_code__h11737,
	      x_out_trap_info_exc_code__h8780;
  reg [2 : 0] CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q21,
	      CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q22;
  reg [1 : 0] CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q23;
  reg CASE_stage1_rg_stage_input_BITS_112_TO_110_0b1_ETC__q11,
      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b1_ETC__q13,
      CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q12,
      CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14,
      CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_ne_ETC__q3,
      CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_st_ETC__q5,
      CASE_stage2_rg_stage2_BITS_397_TO_395_1_stage2_ETC__q4,
      IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d432,
      IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d769,
      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2768,
      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2772,
      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d750,
      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d758,
      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d952,
      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d960,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d175,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d184,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2686,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d273,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d279,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d290,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d297,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d305,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d310,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d319,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d324;
  wire [429 : 0] IF_stage1_rg_stage_input_32_BITS_335_TO_334_33_ETC___d2511;
  wire [127 : 0] csr_regfile_read_csr_mcycle__7_MINUS_rg_start__ETC___d2801;
  wire [63 : 0] IF_csr_regfile_read_csr_rg_trap_instr_798_BITS_ETC___d2856,
		IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d1260,
		IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1521,
		IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1522,
		IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1531,
		SEXT_stage1_rg_stage_input_32_BITS_87_TO_76_047___d1259,
		_theResult_____1_fst__h12535,
		_theResult_____1_fst__h12570,
		_theResult____h33877,
		_theResult___fst__h12706,
		_theResult___fst__h12713,
		_theResult___fst__h12794,
		_theResult___snd_fst_rd_val__h9435,
		_theResult___snd_snd__h16701,
		_theResult___snd_snd_rd_val__h8290,
		addr_of_b32___1__h27521,
		addr_of_b32___1__h32461,
		addr_of_b32___1__h44012,
		addr_of_b32__h27393,
		addr_of_b32__h32333,
		addr_of_b32__h43884,
		alu_outputs___1_addr__h10323,
		alu_outputs___1_addr__h10697,
		alu_outputs___1_fval1__h11709,
		alu_outputs___1_fval2__h10701,
		alu_outputs___1_fval3__h11711,
		alu_outputs___1_val1__h10496,
		alu_outputs___1_val1__h10541,
		alu_outputs___1_val1__h10570,
		alu_outputs___1_val1__h10983,
		alu_outputs___1_val1__h11011,
		alu_outputs_cf_info_taken_PC__h16267,
		branch_target__h10301,
		cpi__h33879,
		cpifrac__h33880,
		data_to_stage2_addr__h10103,
		data_to_stage2_val2__h10105,
		delta_CPI_cycles__h33875,
		delta_CPI_instrs___1__h33921,
		delta_CPI_instrs__h33876,
		fall_through_pc__h9846,
		next_pc___1__h13967,
		next_pc__h10336,
		next_pc__h10371,
		next_pc__h13964,
		next_pc__h9847,
		output_stage2___1_data_to_stage3_frd_val__h8219,
		rd_val___1__h12450,
		rd_val___1__h12531,
		rd_val___1__h12538,
		rd_val___1__h12545,
		rd_val___1__h12552,
		rd_val___1__h12559,
		rd_val___1__h16730,
		rd_val___1__h16761,
		rd_val___1__h16793,
		rd_val___1__h16822,
		rd_val___1__h16874,
		rd_val___1__h16922,
		rd_val___1__h16928,
		rd_val___1__h16973,
		rd_val__h10612,
		rd_val__h10633,
		rd_val__h16602,
		rd_val__h16653,
		rd_val__h16675,
		rd_val__h9684,
		rd_val__h9717,
		rd_val__h9750,
		rd_val__h9781,
		rd_val__h9815,
		rs1_val__h34495,
		rs1_val_bypassed__h5597,
		rs2_val_bypassed__h5603,
		trap_info_tval__h15117,
		val__h9686,
		val__h9719,
		value__h15187,
		x__h33878,
		x_out_cf_info_fallthru_PC__h16274,
		x_out_data_to_stage2_fval1__h10123,
		x_out_data_to_stage2_fval3__h10125,
		x_out_data_to_stage2_val2__h10122,
		x_out_next_pc__h9864,
		y__h35607;
  wire [31 : 0] IF_NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem__ETC___d2089,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1930,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1931,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1932,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1933,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1934,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1935,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1936,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1938,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1940,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1942,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1944,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1945,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1946,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1948,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1949,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1950,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1952,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1954,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1955,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1957,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1958,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1959,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1960,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1961,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1962,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1963,
		IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1964,
		IF_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg_p_ETC___d2090,
		IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC__q18,
		_theResult____h5881,
		d_instr__h25360,
		instr___1__h17725,
		instr__h17902,
		instr__h18047,
		instr__h18239,
		instr__h18434,
		instr__h18663,
		instr__h19116,
		instr__h19232,
		instr__h19297,
		instr__h19614,
		instr__h19952,
		instr__h20136,
		instr__h20265,
		instr__h20492,
		instr__h20747,
		instr__h20919,
		instr__h21088,
		instr__h21277,
		instr__h21466,
		instr__h21583,
		instr__h21761,
		instr__h21880,
		instr__h21975,
		instr__h22111,
		instr__h22247,
		instr__h22383,
		instr__h22521,
		instr__h22659,
		instr__h22817,
		instr__h22913,
		instr__h23066,
		instr__h23265,
		instr__h23416,
		instr__h23621,
		instr__h24421,
		instr__h24586,
		instr__h24785,
		instr__h24936,
		instr_out___1__h25362,
		instr_out___1__h25384,
		rs1_val_bypassed597_BITS_31_TO_0_MINUS_rs2_val_ETC__q10,
		rs1_val_bypassed597_BITS_31_TO_0_PLUS_rs2_val__ETC__q9,
		rs1_val_bypassed597_BITS_31_TO_0_SRL_rs2_val_b_ETC__q8,
		rs1_val_bypassed597_BITS_31_TO_0__q7,
		tmp__h16821,
		v32__h10610,
		x__h16764,
		x__h16796,
		x__h16931,
		x__h16976,
		x_out_data_to_stage1_instr__h17651;
  wire [20 : 0] SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1737,
		decoded_instr_imm21_UJ__h30758,
		stage1_rg_stage_input_BITS_30_TO_10__q1;
  wire [19 : 0] imm20__h20004;
  wire [12 : 0] SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1762,
		decoded_instr_imm13_SB__h30756,
		stage1_rg_stage_input_BITS_63_TO_51__q2;
  wire [11 : 0] decoded_instr_imm12_S__h30755,
		imm12__h17903,
		imm12__h18240,
		imm12__h19876,
		imm12__h20545,
		imm12__h20760,
		imm12__h20956,
		imm12__h21293,
		imm12__h22914,
		imm12__h23266,
		offset__h18610,
		stage1_rg_stage_input_BITS_75_TO_64__q6,
		stage1_rg_stage_input_BITS_87_TO_76__q17;
  wire [9 : 0] decoded_instr_funct10__h30753,
	       nzimm10__h20543,
	       nzimm10__h20758;
  wire [8 : 0] offset__h19241, offset__h22828;
  wire [7 : 0] offset__h17775, offset__h23200;
  wire [6 : 0] offset__h18182;
  wire [5 : 0] imm6__h19874, shamt__h10483;
  wire [4 : 0] offset_BITS_4_TO_0___h18171,
	       offset_BITS_4_TO_0___h18602,
	       offset_BITS_4_TO_0___h23541,
	       rd__h18242,
	       rs1__h18241,
	       x_out_data_to_stage2_rd__h10119;
  wire [3 : 0] alu_outputs___1_exc_code__h10979,
	       cur_verbosity__h3946,
	       x_exc_code__h44308,
	       x_out_trap_info_exc_code__h15122;
  wire [2 : 0] rm__h10284;
  wire [1 : 0] new_epoch__h26813, sxl__h6937, uxl__h6938;
  wire IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1657,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2310,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2313,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2325,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2634,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2728,
       IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2347,
       IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2405,
       IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2589,
       IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d343,
       IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d344,
       IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d347,
       IF_stage1_rg_full_31_THEN_stage1_rg_stage_inpu_ETC___d2897,
       IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d2764,
       IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d421,
       IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d423,
       IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d425,
       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763,
       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775,
       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965,
       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969,
       IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d337,
       IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d339,
       NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2298,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2306,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2315,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2319,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2342,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2346,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2401,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2407,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2541,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2575,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2591,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2601,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2605,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2609,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2613,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2618,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2622,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2630,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2750,
       NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d2461,
       NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d2505,
       NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d851,
       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2072,
       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2086,
       NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2105,
       NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2112,
       NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d1104,
       NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d1126,
       NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d1201,
       NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d1645,
       NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d2758,
       NOT_rg_next_pc_867_BITS_1_TO_0_868_EQ_0b0_869__ETC___d2875,
       NOT_rg_run_on_reset_247_248_OR_imem_rg_pc_BITS_ETC___d2255,
       NOT_soc_map_m_pc_reset_value__268_BITS_1_TO_0__ETC___d2284,
       NOT_stage1_rg_stage_input_32_BITS_104_TO_98_38_ETC___d746,
       NOT_stage1_rg_stage_input_32_BITS_109_TO_105_2_ETC___d559,
       NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1157,
       NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1164,
       NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d479,
       NOT_stage1_rg_stage_input_32_BITS_144_TO_140_0_ETC___d1169,
       NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d2774,
       NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d449,
       NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d760,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1230,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1238,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1243,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1249,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1300,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1660,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1664,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2334,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2948,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2950,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974,
       NOT_stage1_rg_stage_input_32_BITS_99_TO_98_74__ETC___d734,
       NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1004,
       NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1019,
       NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1068,
       NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1129,
       NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d2884,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1219,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1297,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1335,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985,
       NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148,
       NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156,
       NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d177,
       NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d289,
       NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d402,
       NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d2707,
       _0_OR_stage1_rg_stage_input_32_BITS_104_TO_98_3_ETC___d2484,
       csr_regfile_RDY_server_reset_request_put__219__ETC___d2231,
       csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2685,
       csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693,
       csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2735,
       csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2739,
       csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2953,
       csr_regfile_read_misa__6_BIT_2_672_AND_stageD__ETC___d1747,
       csr_regfile_read_misa__6_BIT_2_672_AND_stageD__ETC___d1753,
       csr_regfile_read_mstatus__9_BITS_14_TO_13_1_EQ_ETC___d573,
       imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d2109,
       imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2251,
       imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d2064,
       imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17,
       near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2117,
       near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119,
       near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_066___d2067,
       near_mem_imem_valid_AND_near_mem_imem_exc__1_A_ETC___d2214,
       rg_cur_priv_8_EQ_0b11_059_OR_rg_cur_priv_8_EQ__ETC___d1124,
       rg_cur_priv_8_EQ_0b11_059_OR_rg_cur_priv_8_EQ__ETC___d1189,
       rg_cur_priv_8_EQ_0b11_059_OR_rg_cur_priv_8_EQ__ETC___d1203,
       rg_cur_priv_8_EQ_0b11_059_OR_rg_cur_priv_8_EQ__ETC___d1635,
       rg_state_7_EQ_12_4_AND_csr_regfile_wfi_resume__ETC___d2937,
       rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2753,
       rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2779,
       rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2814,
       rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2817,
       rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2908,
       rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2917,
       rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2926,
       rg_state_7_EQ_3_326_AND_stage3_rg_full_8_OR_st_ETC___d2338,
       rg_state_7_EQ_5_941_AND_NOT_stageF_rg_full_094_ETC___d2942,
       rg_state_7_EQ_8_864_AND_NOT_stageF_rg_full_094_ETC___d2865,
       rg_trap_info_787_BITS_131_TO_68_788_EQ_csr_reg_ETC___d2797,
       stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1317,
       stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1375,
       stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1401,
       stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d990,
       stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d998,
       stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d2427,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d869,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d878,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d886,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d893,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d918,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d929,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d935,
       stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1035,
       stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1049,
       stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d806,
       stage1_rg_stage_input_32_BITS_144_TO_140_027_E_ETC___d1065,
       stage1_rg_stage_input_32_BITS_144_TO_140_027_E_ETC___d1103,
       stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d1341,
       stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d2892,
       stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d794,
       stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d962,
       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d1398,
       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d1588,
       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2343,
       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2626,
       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334,
       stage1_rg_stage_input_32_BITS_99_TO_98_74_EQ_0_ETC___d2440,
       stage1_rg_stage_input_32_BITS_99_TO_98_74_EQ_0_ETC___d938,
       stage1_rg_stage_input_32_BIT_332_77_OR_NOT_rg__ETC___d1096,
       stage2_rg_full_14_AND_IF_stage2_rg_stage2_15_B_ETC___d2379,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1006,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1007,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1009,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1021,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1022,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1024,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1039,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1040,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1042,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1053,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1054,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1056,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1070,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1071,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1073,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1085,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1086,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1088,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1109,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1110,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1111,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1113,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1131,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1132,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1133,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1135,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1208,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1209,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1210,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1213,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1214,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1215,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1216,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1278,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1332,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1350,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1360,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1365,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1368,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1379,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1395,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1555,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2295,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2614,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d995,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2376,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2381,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2383,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2385,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2387,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2389,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2395,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d405,
       stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d168,
       stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d215,
       stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d244,
       stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_2_21_ETC___d296,
       stage3_rg_full_8_OR_NOT_stage2_rg_full_14_71_O_ETC___d2337,
       stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d407,
       stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d415,
       stageF_f_reset_rsps_i_notEmpty__241_AND_stageD_ETC___d2261,
       stageF_rg_full_094_AND_near_mem_imem_valid_AND_ETC___d2126;
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
			    .ma_update_fcsr_fflags_flags(csr_regfile$ma_update_fcsr_fflags_flags),
			    .ma_update_mstatus_fs_fs(csr_regfile$ma_update_mstatus_fs_fs),
			    .mav_csr_write_csr_addr(csr_regfile$mav_csr_write_csr_addr),
			    .mav_csr_write_word(csr_regfile$mav_csr_write_word),
			    .mav_read_csr_csr_addr(csr_regfile$mav_read_csr_csr_addr),
			    .mv_update_fcsr_fflags_flags(csr_regfile$mv_update_fcsr_fflags_flags),
			    .mv_update_mstatus_fs_fs(csr_regfile$mv_update_mstatus_fs_fs),
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
			    .EN_ma_update_fcsr_fflags(csr_regfile$EN_ma_update_fcsr_fflags),
			    .EN_ma_update_mstatus_fs(csr_regfile$EN_ma_update_mstatus_fs),
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
			    .read_frm(csr_regfile$read_frm),
			    .read_fflags(),
			    .mv_update_fcsr_fflags(),
			    .mv_update_mstatus_fs(),
			    .read_misa(csr_regfile$read_misa),
			    .read_mstatus(csr_regfile$read_mstatus),
			    .read_sstatus(csr_regfile$read_sstatus),
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
  // submodule fpr_regfile
  mkFPR_RegFile fpr_regfile(.CLK(CLK),
			    .RST_N(RST_N),
			    .read_rs1_port2_rs1(fpr_regfile$read_rs1_port2_rs1),
			    .read_rs1_rs1(fpr_regfile$read_rs1_rs1),
			    .read_rs2_rs2(fpr_regfile$read_rs2_rs2),
			    .read_rs3_rs3(fpr_regfile$read_rs3_rs3),
			    .write_rd_rd(fpr_regfile$write_rd_rd),
			    .write_rd_rd_val(fpr_regfile$write_rd_rd_val),
			    .EN_server_reset_request_put(fpr_regfile$EN_server_reset_request_put),
			    .EN_server_reset_response_get(fpr_regfile$EN_server_reset_response_get),
			    .EN_write_rd(fpr_regfile$EN_write_rd),
			    .RDY_server_reset_request_put(fpr_regfile$RDY_server_reset_request_put),
			    .RDY_server_reset_response_get(fpr_regfile$RDY_server_reset_response_get),
			    .read_rs1(fpr_regfile$read_rs1),
			    .read_rs1_port2(),
			    .read_rs2(fpr_regfile$read_rs2),
			    .read_rs3(fpr_regfile$read_rs3));
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
		      .EN_sfence_vma_server_request_put(near_mem$EN_sfence_vma_server_request_put),
		      .EN_sfence_vma_server_response_get(near_mem$EN_sfence_vma_server_response_get),
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
		      .RDY_sfence_vma_server_request_put(near_mem$RDY_sfence_vma_server_request_put),
		      .RDY_sfence_vma_server_response_get(near_mem$RDY_sfence_vma_server_response_get),
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
  FIFO20 #(.guarded(1'd1)) stage1_f_reset_reqs(.RST(RST_N),
					       .CLK(CLK),
					       .ENQ(stage1_f_reset_reqs$ENQ),
					       .DEQ(stage1_f_reset_reqs$DEQ),
					       .CLR(stage1_f_reset_reqs$CLR),
					       .FULL_N(stage1_f_reset_reqs$FULL_N),
					       .EMPTY_N(stage1_f_reset_reqs$EMPTY_N));
  // submodule stage1_f_reset_rsps
  FIFO20 #(.guarded(1'd1)) stage1_f_reset_rsps(.RST(RST_N),
					       .CLK(CLK),
					       .ENQ(stage1_f_reset_rsps$ENQ),
					       .DEQ(stage1_f_reset_rsps$DEQ),
					       .CLR(stage1_f_reset_rsps$CLR),
					       .FULL_N(stage1_f_reset_rsps$FULL_N),
					       .EMPTY_N(stage1_f_reset_rsps$EMPTY_N));
  // submodule stage2_f_reset_reqs
  FIFO20 #(.guarded(1'd1)) stage2_f_reset_reqs(.RST(RST_N),
					       .CLK(CLK),
					       .ENQ(stage2_f_reset_reqs$ENQ),
					       .DEQ(stage2_f_reset_reqs$DEQ),
					       .CLR(stage2_f_reset_reqs$CLR),
					       .FULL_N(stage2_f_reset_reqs$FULL_N),
					       .EMPTY_N(stage2_f_reset_reqs$EMPTY_N));
  // submodule stage2_f_reset_rsps
  FIFO20 #(.guarded(1'd1)) stage2_f_reset_rsps(.RST(RST_N),
					       .CLK(CLK),
					       .ENQ(stage2_f_reset_rsps$ENQ),
					       .DEQ(stage2_f_reset_rsps$DEQ),
					       .CLR(stage2_f_reset_rsps$CLR),
					       .FULL_N(stage2_f_reset_rsps$FULL_N),
					       .EMPTY_N(stage2_f_reset_rsps$EMPTY_N));
  // submodule stage2_fbox
  mkFBox_Top stage2_fbox(.verbosity(4'd0),
			 .CLK(CLK),
			 .RST_N(RST_N),
			 .req_f7(stage2_fbox$req_f7),
			 .req_opcode(stage2_fbox$req_opcode),
			 .req_rm(stage2_fbox$req_rm),
			 .req_rs2(stage2_fbox$req_rs2),
			 .req_v1(stage2_fbox$req_v1),
			 .req_v2(stage2_fbox$req_v2),
			 .req_v3(stage2_fbox$req_v3),
			 .EN_server_reset_request_put(stage2_fbox$EN_server_reset_request_put),
			 .EN_server_reset_response_get(stage2_fbox$EN_server_reset_response_get),
			 .EN_req(stage2_fbox$EN_req),
			 .RDY_server_reset_request_put(stage2_fbox$RDY_server_reset_request_put),
			 .RDY_server_reset_response_get(stage2_fbox$RDY_server_reset_response_get),
			 .valid(stage2_fbox$valid),
			 .word_fst(stage2_fbox$word_fst),
			 .word_snd(stage2_fbox$word_snd));
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
  FIFO20 #(.guarded(1'd1)) stage3_f_reset_reqs(.RST(RST_N),
					       .CLK(CLK),
					       .ENQ(stage3_f_reset_reqs$ENQ),
					       .DEQ(stage3_f_reset_reqs$DEQ),
					       .CLR(stage3_f_reset_reqs$CLR),
					       .FULL_N(stage3_f_reset_reqs$FULL_N),
					       .EMPTY_N(stage3_f_reset_reqs$EMPTY_N));
  // submodule stage3_f_reset_rsps
  FIFO20 #(.guarded(1'd1)) stage3_f_reset_rsps(.RST(RST_N),
					       .CLK(CLK),
					       .ENQ(stage3_f_reset_rsps$ENQ),
					       .DEQ(stage3_f_reset_rsps$DEQ),
					       .CLR(stage3_f_reset_rsps$CLR),
					       .FULL_N(stage3_f_reset_rsps$FULL_N),
					       .EMPTY_N(stage3_f_reset_rsps$EMPTY_N));
  // submodule stageD_f_reset_reqs
  FIFO20 #(.guarded(1'd1)) stageD_f_reset_reqs(.RST(RST_N),
					       .CLK(CLK),
					       .ENQ(stageD_f_reset_reqs$ENQ),
					       .DEQ(stageD_f_reset_reqs$DEQ),
					       .CLR(stageD_f_reset_reqs$CLR),
					       .FULL_N(stageD_f_reset_reqs$FULL_N),
					       .EMPTY_N(stageD_f_reset_reqs$EMPTY_N));
  // submodule stageD_f_reset_rsps
  FIFO20 #(.guarded(1'd1)) stageD_f_reset_rsps(.RST(RST_N),
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
  FIFO20 #(.guarded(1'd1)) stageF_f_reset_reqs(.RST(RST_N),
					       .CLK(CLK),
					       .ENQ(stageF_f_reset_reqs$ENQ),
					       .DEQ(stageF_f_reset_reqs$DEQ),
					       .CLR(stageF_f_reset_reqs$CLR),
					       .FULL_N(stageF_f_reset_reqs$FULL_N),
					       .EMPTY_N(stageF_f_reset_reqs$EMPTY_N));
  // submodule stageF_f_reset_rsps
  FIFO20 #(.guarded(1'd1)) stageF_f_reset_rsps(.RST(RST_N),
					       .CLK(CLK),
					       .ENQ(stageF_f_reset_rsps$ENQ),
					       .DEQ(stageF_f_reset_rsps$DEQ),
					       .CLR(stageF_f_reset_rsps$CLR),
					       .FULL_N(stageF_f_reset_rsps$FULL_N),
					       .EMPTY_N(stageF_f_reset_rsps$EMPTY_N));
  // rule RL_rl_show_pipe
  assign CAN_FIRE_RL_rl_show_pipe =
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     rg_state != 4'd0 &&
	     rg_state != 4'd1 &&
	     rg_state != 4'd12 ;
  assign WILL_FIRE_RL_rl_show_pipe = CAN_FIRE_RL_rl_show_pipe ;
  // rule RL_rl_stage2_nonpipe
  assign CAN_FIRE_RL_rl_stage2_nonpipe =
	     rg_state == 4'd3 && !stage3_rg_full && stage2_rg_full &&
	     NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156 ;
  assign WILL_FIRE_RL_rl_stage2_nonpipe = CAN_FIRE_RL_rl_stage2_nonpipe ;
  // rule RL_rl_stage1_trap
  assign CAN_FIRE_RL_rl_stage1_trap =
	     rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2779 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119) ;
  assign WILL_FIRE_RL_rl_stage1_trap = CAN_FIRE_RL_rl_stage1_trap ;
  // rule RL_rl_trap
  assign CAN_FIRE_RL_rl_trap =
	     rg_state == 4'd4 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119) ;
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
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2251 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state_7_EQ_8_864_AND_NOT_stageF_rg_full_094_ETC___d2865 ;
  assign WILL_FIRE_RL_rl_stage1_restart_after_csrrx =
	     CAN_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // rule RL_rl_stage1_xRET
  assign CAN_FIRE_RL_rl_stage1_xRET =
	     rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2753 &&
	     stage1_rg_full &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2343 &&
	     IF_stage1_rg_full_31_THEN_stage1_rg_stage_inpu_ETC___d2897 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119) ;
  assign WILL_FIRE_RL_rl_stage1_xRET = CAN_FIRE_RL_rl_stage1_xRET ;
  // rule RL_rl_stage1_FENCE_I
  assign CAN_FIRE_RL_rl_stage1_FENCE_I = MUX_rg_state$write_1__SEL_12 ;
  assign WILL_FIRE_RL_rl_stage1_FENCE_I = MUX_rg_state$write_1__SEL_12 ;
  // rule RL_rl_finish_FENCE_I
  assign CAN_FIRE_RL_rl_finish_FENCE_I =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2251 ||
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
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2251 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     near_mem$RDY_server_fence_response_get &&
	     rg_state == 4'd10 ;
  assign WILL_FIRE_RL_rl_finish_FENCE = CAN_FIRE_RL_rl_finish_FENCE ;
  // rule RL_rl_stage1_SFENCE_VMA
  assign CAN_FIRE_RL_rl_stage1_SFENCE_VMA = MUX_rg_state$write_1__SEL_14 ;
  assign WILL_FIRE_RL_rl_stage1_SFENCE_VMA = MUX_rg_state$write_1__SEL_14 ;
  // rule RL_rl_finish_SFENCE_VMA
  assign CAN_FIRE_RL_rl_finish_SFENCE_VMA =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2251 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     near_mem$RDY_sfence_vma_server_response_get &&
	     rg_state == 4'd11 ;
  assign WILL_FIRE_RL_rl_finish_SFENCE_VMA =
	     CAN_FIRE_RL_rl_finish_SFENCE_VMA ;
  // rule RL_rl_stage1_WFI
  assign CAN_FIRE_RL_rl_stage1_WFI = MUX_rg_state$write_1__SEL_15 ;
  assign WILL_FIRE_RL_rl_stage1_WFI = MUX_rg_state$write_1__SEL_15 ;
  // rule RL_rl_WFI_resume
  assign CAN_FIRE_RL_rl_WFI_resume =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2251 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state_7_EQ_12_4_AND_csr_regfile_wfi_resume__ETC___d2937 ;
  assign WILL_FIRE_RL_rl_WFI_resume = CAN_FIRE_RL_rl_WFI_resume ;
  // rule RL_rl_reset_from_WFI
  assign CAN_FIRE_RL_rl_reset_from_WFI =
	     rg_state == 4'd12 && f_reset_reqs$EMPTY_N ;
  assign WILL_FIRE_RL_rl_reset_from_WFI = MUX_rg_state$write_1__SEL_5 ;
  // rule RL_rl_trap_fetch
  assign CAN_FIRE_RL_rl_trap_fetch =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2251 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state_7_EQ_5_941_AND_NOT_stageF_rg_full_094_ETC___d2942 ;
  assign WILL_FIRE_RL_rl_trap_fetch = CAN_FIRE_RL_rl_trap_fetch ;
  // rule RL_rl_stage1_interrupt
  assign CAN_FIRE_RL_rl_stage1_interrupt =
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2953 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119) ;
  assign WILL_FIRE_RL_rl_stage1_interrupt = CAN_FIRE_RL_rl_stage1_interrupt ;
  // rule RL_imem_rl_assert_fail
  assign CAN_FIRE_RL_imem_rl_assert_fail = !near_mem$imem_is_i32_not_i16 ;
  assign WILL_FIRE_RL_imem_rl_assert_fail = CAN_FIRE_RL_imem_rl_assert_fail ;
  // rule RL_rl_reset_complete
  assign CAN_FIRE_RL_rl_reset_complete =
	     gpr_regfile$RDY_server_reset_response_get &&
	     fpr_regfile$RDY_server_reset_response_get &&
	     near_mem$RDY_server_reset_response_get &&
	     csr_regfile$RDY_server_reset_response_get &&
	     stageF_f_reset_rsps_i_notEmpty__241_AND_stageD_ETC___d2261 &&
	     rg_state == 4'd1 ;
  assign WILL_FIRE_RL_rl_reset_complete = MUX_rg_state$write_1__SEL_2 ;
  // rule RL_rl_pipe
  assign CAN_FIRE_RL_rl_pipe =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2325 &&
	     rg_state_7_EQ_3_326_AND_stage3_rg_full_8_OR_st_ETC___d2338 &&
	     (NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2346 ||
	      IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2347 ||
	      stage2_rg_full ||
	      stage3_rg_full) ;
  assign WILL_FIRE_RL_rl_pipe =
	     CAN_FIRE_RL_rl_pipe && !WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  // rule RL_rl_reset_start
  assign CAN_FIRE_RL_rl_reset_start =
	     gpr_regfile$RDY_server_reset_request_put &&
	     fpr_regfile$RDY_server_reset_request_put &&
	     near_mem$RDY_server_reset_request_put &&
	     csr_regfile_RDY_server_reset_request_put__219__ETC___d2231 &&
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
	     stage2_fbox$RDY_server_reset_response_get &&
	     stage2_f_reset_rsps$FULL_N &&
	     stage2_rg_resetting ;
  assign WILL_FIRE_RL_stage2_rl_reset_end = CAN_FIRE_RL_stage2_rl_reset_end ;
  // rule RL_stage2_rl_reset_begin
  assign CAN_FIRE_RL_stage2_rl_reset_begin =
	     stage2_fbox$RDY_server_reset_request_put &&
	     stage2_f_reset_reqs$EMPTY_N ;
  assign WILL_FIRE_RL_stage2_rl_reset_begin =
	     CAN_FIRE_RL_stage2_rl_reset_begin ;
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
  assign MUX_gpr_regfile$write_rd_1__SEL_2 =
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	     csr_regfile$access_permitted_2 ;
  assign MUX_imem_rg_cache_addr$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ;
  assign MUX_imem_rg_cache_addr$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 ;
  assign MUX_rg_next_pc$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2630 ;
  assign MUX_rg_next_pc$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_stage1_WFI || WILL_FIRE_RL_rl_stage1_FENCE ||
	     WILL_FIRE_RL_rl_stage1_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W ||
	     WILL_FIRE_RL_rl_stage1_SFENCE_VMA ;
  assign MUX_rg_state$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2319 ;
  assign MUX_rg_state$write_1__SEL_2 =
	     CAN_FIRE_RL_rl_reset_complete &&
	     !WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  assign MUX_rg_state$write_1__SEL_5 =
	     CAN_FIRE_RL_rl_reset_from_WFI && !WILL_FIRE_RL_rl_WFI_resume ;
  assign MUX_rg_state$write_1__SEL_7 =
	     WILL_FIRE_RL_rl_trap_fetch || WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
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
	     rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2817 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1004 ;
  assign MUX_rg_state$write_1__SEL_11 =
	     rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2817 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1019 ;
  assign MUX_rg_state$write_1__SEL_12 =
	     near_mem$RDY_server_fence_i_request_put &&
	     rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2908 ;
  assign MUX_rg_state$write_1__SEL_13 =
	     near_mem$RDY_server_fence_request_put &&
	     rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2917 ;
  assign MUX_rg_state$write_1__SEL_14 =
	     near_mem$RDY_sfence_vma_server_request_put &&
	     rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2926 ;
  assign MUX_rg_state$write_1__SEL_15 =
	     rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2817 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1129 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119) ;
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
	  y__h35607 or
	  IF_csr_regfile_read_csr_rg_trap_instr_798_BITS_ETC___d2856)
  begin
    case (rg_trap_instr[14:12])
      3'b010, 3'b110:
	  MUX_csr_regfile$mav_csr_write_2__VAL_2 =
	      IF_csr_regfile_read_csr_rg_trap_instr_798_BITS_ETC___d2856;
      default: MUX_csr_regfile$mav_csr_write_2__VAL_2 =
		   csr_regfile$read_csr[63:0] & y__h35607;
    endcase
  end
  assign MUX_imem_rg_cache_addr$write_1__VAL_1 =
	     (near_mem$imem_valid && !near_mem$imem_exc) ?
	       near_mem$imem_pc :
	       64'h0000000000000001 ;
  assign MUX_imem_rg_cache_addr$write_1__VAL_2 =
	     near_mem$imem_exc ? 64'h0000000000000001 : near_mem$imem_pc ;
  assign MUX_imem_rg_tval$write_1__VAL_1 =
	     (NOT_soc_map_m_pc_reset_value__268_BITS_1_TO_0__ETC___d2284 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h27521 :
	       soc_map$m_pc_reset_value ;
  assign MUX_imem_rg_tval$write_1__VAL_2 =
	     (NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d2707 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h32461 :
	       stageF_branch_predictor$predict_rsp ;
  assign MUX_imem_rg_tval$write_1__VAL_3 =
	     (NOT_rg_next_pc_867_BITS_1_TO_0_868_EQ_0b0_869__ETC___d2875 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h44012 :
	       rg_next_pc ;
  assign MUX_imem_rg_tval$write_1__VAL_4 = near_mem$imem_pc + 64'd4 ;
  assign MUX_near_mem$imem_req_2__VAL_1 =
	     (NOT_soc_map_m_pc_reset_value__268_BITS_1_TO_0__ETC___d2284 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h27521 :
	       addr_of_b32__h27393 ;
  assign MUX_near_mem$imem_req_2__VAL_2 =
	     (NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d2707 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h32461 :
	       addr_of_b32__h32333 ;
  assign MUX_near_mem$imem_req_2__VAL_4 =
	     (NOT_rg_next_pc_867_BITS_1_TO_0_868_EQ_0b0_869__ETC___d2875 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h44012 :
	       addr_of_b32__h43884 ;
  assign MUX_rg_state$write_1__VAL_2 = rg_run_on_reset ? 4'd3 : 4'd2 ;
  assign MUX_rg_state$write_1__VAL_3 =
	     csr_regfile$access_permitted_1 ? 4'd8 : 4'd4 ;
  assign MUX_rg_state$write_1__VAL_4 =
	     csr_regfile$access_permitted_2 ? 4'd8 : 4'd4 ;
  assign MUX_rg_trap_info$write_1__VAL_1 =
	     { stage1_rg_stage_input[401:338],
	       4'd2,
	       stage1_rg_stage_input[332] ?
		 stage1_rg_stage_input[327:264] :
		 trap_info_tval__h15117 } ;
  assign MUX_rg_trap_info$write_1__VAL_2 =
	     { value__h8670,
	       near_mem$dmem_exc_code,
	       stage2_rg_stage2[389:326] } ;
  assign MUX_rg_trap_info$write_1__VAL_3 =
	     { stage1_rg_stage_input[401:338],
	       stage1_rg_stage_input[332] ?
		 stage1_rg_stage_input[331:264] :
		 { alu_outputs_exc_code__h11737, trap_info_tval__h15117 } } ;
  assign MUX_rg_trap_info$write_1__VAL_4 =
	     { stage1_rg_stage_input[401:338], x_exc_code__h44308, 64'd0 } ;
  assign MUX_rg_trap_instr$write_1__VAL_1 = stage1_rg_stage_input[263:232] ;
  assign MUX_stage1_rg_full$write_1__VAL_2 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2634 &&
	     stageD_rg_full ||
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2728 ;
  assign MUX_stage2_rg_full$write_1__VAL_2 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2306 ?
	       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	       (IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2405 ||
		stage2_rg_stage2[397:395] != 3'd0 &&
		IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2686 &&
		stage2_rg_full) :
	       stage2_rg_stage2[397:395] != 3'd0 &&
	       IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2686 &&
	       stage2_rg_full ;
  assign MUX_stage3_rg_full$write_1__VAL_2 =
	     stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299) ;
  assign MUX_stageD_rg_full$write_1__VAL_2 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 ||
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2310 &&
	     stageD_rg_full ;
  assign MUX_stageF_rg_full$write_1__VAL_2 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 ?
	       csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2739 ||
	       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2310 &&
	       stageD_rg_full :
	       (IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2310 &&
		stageD_rg_full ||
		!near_mem$imem_valid ||
		NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2112) &&
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 ||
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 &&
	     !near_mem$imem_exc ||
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  // register imem_rg_f3
  assign imem_rg_f3$D_IN = 3'b010 ;
  assign imem_rg_f3$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // register imem_rg_mstatus_MXR
  assign imem_rg_mstatus_MXR$D_IN = csr_regfile$read_mstatus[19] ;
  assign imem_rg_mstatus_MXR$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // register imem_rg_priv
  assign imem_rg_priv$D_IN = rg_cur_priv ;
  assign imem_rg_priv$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // register imem_rg_satp
  assign imem_rg_satp$D_IN = csr_regfile$read_satp ;
  assign imem_rg_satp$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // register imem_rg_sstatus_SUM
  assign imem_rg_sstatus_SUM$D_IN = csr_regfile$read_sstatus[18] ;
  assign imem_rg_sstatus_SUM$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ||
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  // register rg_csr_pc
  assign rg_csr_pc$D_IN = stage1_rg_stage_input[401:338] ;
  assign rg_csr_pc$EN = MUX_rg_trap_info$write_1__SEL_1 ;
  // register rg_csr_val1
  assign rg_csr_val1$D_IN = x_out_data_to_stage2_val1__h10121 ;
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
	  new_epoch__h26813 or
	  MUX_rg_state$write_1__SEL_7 or WILL_FIRE_RL_rl_reset_start)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_cache_addr$write_1__SEL_1:
	  rg_epoch$D_IN = new_epoch__h26813;
      MUX_rg_state$write_1__SEL_7: rg_epoch$D_IN = new_epoch__h26813;
      WILL_FIRE_RL_rl_reset_start: rg_epoch$D_IN = 2'd0;
      default: rg_epoch$D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign rg_epoch$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ||
	     WILL_FIRE_RL_rl_reset_start ;
  // register rg_mstatus_MXR
  assign rg_mstatus_MXR$D_IN = csr_regfile$read_mstatus[19] ;
  assign rg_mstatus_MXR$EN = MUX_rg_state$write_1__SEL_9 ;
  // register rg_next_pc
  always@(MUX_rg_next_pc$write_1__SEL_1 or
	  x_out_next_pc__h9864 or
	  MUX_rg_next_pc$write_1__SEL_2 or
	  WILL_FIRE_RL_rl_trap or
	  csr_regfile$csr_trap_actions or
	  WILL_FIRE_RL_rl_stage1_xRET or csr_regfile$csr_ret_actions)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_rg_next_pc$write_1__SEL_1: rg_next_pc$D_IN = x_out_next_pc__h9864;
      MUX_rg_next_pc$write_1__SEL_2: rg_next_pc$D_IN = x_out_next_pc__h9864;
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
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2630 ||
	     WILL_FIRE_RL_rl_stage1_WFI ||
	     WILL_FIRE_RL_rl_stage1_FENCE ||
	     WILL_FIRE_RL_rl_stage1_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W ||
	     WILL_FIRE_RL_rl_stage1_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_trap ||
	     WILL_FIRE_RL_rl_stage1_xRET ;
  // register rg_run_on_reset
  assign rg_run_on_reset$D_IN = f_reset_reqs$D_OUT ;
  assign rg_run_on_reset$EN = CAN_FIRE_RL_rl_reset_start ;
  // register rg_sstatus_SUM
  assign rg_sstatus_SUM$D_IN = csr_regfile$read_sstatus[18] ;
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
	  WILL_FIRE_RL_rl_stage1_FENCE or
	  WILL_FIRE_RL_rl_stage1_SFENCE_VMA or WILL_FIRE_RL_rl_stage1_WFI)
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
      WILL_FIRE_RL_rl_stage1_SFENCE_VMA: rg_state$D_IN = 4'd11;
      WILL_FIRE_RL_rl_stage1_WFI: rg_state$D_IN = 4'd12;
      default: rg_state$D_IN = 4'b1010 /* unspecified value */ ;
    endcase
  end
  assign rg_state$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2319 ||
	     WILL_FIRE_RL_rl_reset_complete ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W_2 ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 ||
	     WILL_FIRE_RL_rl_reset_from_WFI ||
	     WILL_FIRE_RL_rl_reset_start ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
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
	     WILL_FIRE_RL_rl_stage1_SFENCE_VMA ||
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
	       stage2_rg_stage2[429:398] ;
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
	  WILL_FIRE_RL_rl_finish_SFENCE_VMA or
	  WILL_FIRE_RL_rl_finish_FENCE or
	  WILL_FIRE_RL_rl_finish_FENCE_I or
	  WILL_FIRE_RL_rl_stage1_xRET or
	  WILL_FIRE_RL_rl_stage1_restart_after_csrrx or WILL_FIRE_RL_rl_trap)
  case (1'b1)
    WILL_FIRE_RL_stage1_rl_reset: stage1_rg_full$D_IN = 1'd0;
    WILL_FIRE_RL_rl_pipe:
	stage1_rg_full$D_IN = MUX_stage1_rg_full$write_1__VAL_2;
    MUX_imem_rg_cache_addr$write_1__SEL_1 || WILL_FIRE_RL_rl_stage1_WFI ||
    WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
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
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
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
	       _theResult____h5881,
	       stageD_rg_data[79:0],
	       _theResult____h5881[6:0],
	       _theResult____h5881[11:7],
	       _theResult____h5881[19:15],
	       _theResult____h5881[24:20],
	       _theResult____h5881[31:27],
	       _theResult____h5881[31:20],
	       _theResult____h5881[14:12],
	       _theResult____h5881[31:27],
	       _theResult____h5881[31:25],
	       decoded_instr_funct10__h30753,
	       _theResult____h5881[31:20],
	       decoded_instr_imm12_S__h30755,
	       decoded_instr_imm13_SB__h30756,
	       _theResult____h5881[31:12],
	       decoded_instr_imm21_UJ__h30758,
	       _theResult____h5881[27:20],
	       _theResult____h5881[26:25] } ;
  assign stage1_rg_stage_input$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2634 &&
	     stageD_rg_full ;
  // register stage2_rg_full
  always@(WILL_FIRE_RL_stage2_rl_reset_begin or
	  WILL_FIRE_RL_rl_pipe or
	  MUX_stage2_rg_full$write_1__VAL_2 or
	  MUX_imem_rg_cache_addr$write_1__SEL_1 or WILL_FIRE_RL_rl_trap)
  case (1'b1)
    WILL_FIRE_RL_stage2_rl_reset_begin: stage2_rg_full$D_IN = 1'd0;
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
	     WILL_FIRE_RL_stage2_rl_reset_begin ;
  // register stage2_rg_resetting
  assign stage2_rg_resetting$D_IN = WILL_FIRE_RL_stage2_rl_reset_begin ;
  assign stage2_rg_resetting$EN =
	     WILL_FIRE_RL_stage2_rl_reset_end ||
	     WILL_FIRE_RL_stage2_rl_reset_begin ;
  // register stage2_rg_stage2
  assign stage2_rg_stage2$D_IN =
	     { rg_cur_priv,
	       stage1_rg_stage_input[401:338],
	       IF_stage1_rg_stage_input_32_BITS_335_TO_334_33_ETC___d2511 } ;
  assign stage2_rg_stage2$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2407 ;
  // register stage3_rg_full
  always@(WILL_FIRE_RL_stage3_rl_reset or
	  WILL_FIRE_RL_rl_pipe or
	  MUX_stage3_rg_full$write_1__VAL_2 or
	  MUX_imem_rg_cache_addr$write_1__SEL_1)
  case (1'b1)
    WILL_FIRE_RL_stage3_rl_reset: stage3_rg_full$D_IN = 1'd0;
    WILL_FIRE_RL_rl_pipe:
	stage3_rg_full$D_IN = MUX_stage3_rg_full$write_1__VAL_2;
    MUX_imem_rg_cache_addr$write_1__SEL_1: stage3_rg_full$D_IN = 1'd0;
    default: stage3_rg_full$D_IN = 1'b0 /* unspecified value */ ;
  endcase
  assign stage3_rg_full$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe ||
	     WILL_FIRE_RL_stage3_rl_reset ;
  // register stage3_rg_stage3
  assign stage3_rg_stage3$D_IN =
	     { stage2_rg_stage2[493:398],
	       stage2_rg_stage2[495:494],
	       1'd1,
	       x_out_data_to_stage3_rd__h8340,
	       x_out_data_to_stage3_rd_val__h8341,
	       stage2_rg_stage2[397:395] != 3'd0 &&
	       stage2_rg_stage2[397:395] != 3'd1 &&
	       stage2_rg_stage2[397:395] != 3'd4 &&
	       stage2_rg_stage2[397:395] != 3'd2 &&
	       stage2_rg_stage2[397:395] != 3'd3,
	       stage2_rg_stage2[397:395] != 3'd0 &&
	       CASE_stage2_rg_stage2_BITS_397_TO_395_1_stage2_ETC__q4,
	       x_out_data_to_stage3_fpr_flags__h8344,
	       x_out_data_to_stage3_frd_val__h8345 } ;
  assign stage3_rg_stage3$EN =
	     WILL_FIRE_RL_rl_pipe && stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299) ;
  // register stageD_rg_data
  assign stageD_rg_data$D_IN =
	     { imem_rg_pc,
	       stageF_rg_epoch,
	       stageF_rg_priv,
	       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2072 ||
	       imem_rg_pc[1:0] == 2'b0 &&
	       imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	       near_mem$imem_instr[1:0] == 2'b11,
	       near_mem$imem_exc,
	       near_mem$imem_exc_code,
	       imem_rg_tval,
	       d_instr__h25360,
	       stageF_branch_predictor$predict_rsp } ;
  assign stageD_rg_data$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 ;
  // register stageD_rg_full
  always@(WILL_FIRE_RL_stageD_rl_reset or
	  WILL_FIRE_RL_rl_pipe or
	  MUX_stageD_rg_full$write_1__VAL_2 or
	  MUX_imem_rg_cache_addr$write_1__SEL_1 or
	  WILL_FIRE_RL_rl_trap_fetch or
	  WILL_FIRE_RL_rl_WFI_resume or
	  WILL_FIRE_RL_rl_stage1_WFI or
	  WILL_FIRE_RL_rl_finish_SFENCE_VMA or
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
    WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
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
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
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
	  new_epoch__h26813 or
	  WILL_FIRE_RL_rl_trap_fetch or
	  WILL_FIRE_RL_rl_WFI_resume or
	  WILL_FIRE_RL_rl_finish_SFENCE_VMA or
	  WILL_FIRE_RL_rl_finish_FENCE or
	  WILL_FIRE_RL_rl_finish_FENCE_I or
	  WILL_FIRE_RL_rl_stage1_restart_after_csrrx)
  case (1'b1)
    WILL_FIRE_RL_stageF_rl_reset: stageF_rg_epoch$D_IN = 2'd0;
    MUX_imem_rg_cache_addr$write_1__SEL_2:
	stageF_rg_epoch$D_IN = stageF_rg_epoch;
    MUX_imem_rg_cache_addr$write_1__SEL_1:
	stageF_rg_epoch$D_IN = new_epoch__h26813;
    WILL_FIRE_RL_rl_trap_fetch: stageF_rg_epoch$D_IN = new_epoch__h26813;
    WILL_FIRE_RL_rl_WFI_resume: stageF_rg_epoch$D_IN = new_epoch__h26813;
    WILL_FIRE_RL_rl_finish_SFENCE_VMA:
	stageF_rg_epoch$D_IN = new_epoch__h26813;
    WILL_FIRE_RL_rl_finish_FENCE: stageF_rg_epoch$D_IN = new_epoch__h26813;
    WILL_FIRE_RL_rl_finish_FENCE_I: stageF_rg_epoch$D_IN = new_epoch__h26813;
    WILL_FIRE_RL_rl_stage1_restart_after_csrrx:
	stageF_rg_epoch$D_IN = new_epoch__h26813;
    default: stageF_rg_epoch$D_IN = 2'b10 /* unspecified value */ ;
  endcase
  assign stageF_rg_epoch$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
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
	  WILL_FIRE_RL_rl_finish_SFENCE_VMA or
	  WILL_FIRE_RL_rl_finish_FENCE or
	  WILL_FIRE_RL_rl_finish_FENCE_I or
	  WILL_FIRE_RL_rl_stage1_restart_after_csrrx)
  case (1'b1)
    WILL_FIRE_RL_stageF_rl_reset: stageF_rg_full$D_IN = 1'd0;
    WILL_FIRE_RL_rl_pipe:
	stageF_rg_full$D_IN = MUX_stageF_rg_full$write_1__VAL_2;
    MUX_imem_rg_cache_addr$write_1__SEL_1 || WILL_FIRE_RL_rl_trap_fetch ||
    WILL_FIRE_RL_rl_WFI_resume ||
    WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
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
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // register stageF_rg_priv
  assign stageF_rg_priv$D_IN = rg_cur_priv ;
  assign stageF_rg_priv$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
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
	     rs1_val__h35329 == 64'd0 ;
  assign csr_regfile$csr_counter_read_fault_csr_addr = 12'h0 ;
  assign csr_regfile$csr_counter_read_fault_priv = 2'h0 ;
  assign csr_regfile$csr_ret_actions_from_priv =
	     (stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	      NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d2884) ?
	       2'b11 :
	       ((stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
		 !stage1_rg_stage_input[332] &&
		 stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d2892) ?
		  2'b01 :
		  2'b0) ;
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
  assign csr_regfile$ma_update_fcsr_fflags_flags = stage3_rg_stage3[68:64] ;
  assign csr_regfile$ma_update_mstatus_fs_fs = 2'h3 ;
  assign csr_regfile$mav_csr_write_csr_addr = rg_trap_instr[31:20] ;
  assign csr_regfile$mav_csr_write_word =
	     MUX_csr_regfile$mav_csr_write_1__SEL_1 ?
	       rs1_val__h34495 :
	       MUX_csr_regfile$mav_csr_write_2__VAL_2 ;
  assign csr_regfile$mav_read_csr_csr_addr = 12'h0 ;
  assign csr_regfile$mv_update_fcsr_fflags_flags = 5'h0 ;
  assign csr_regfile$mv_update_mstatus_fs_fs = 2'h0 ;
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
  assign csr_regfile$EN_ma_update_fcsr_fflags =
	     WILL_FIRE_RL_rl_pipe && stage3_rg_full &&
	     stage3_rg_stage3[140] &&
	     stage3_rg_stage3[70] ;
  assign csr_regfile$EN_ma_update_mstatus_fs =
	     WILL_FIRE_RL_rl_pipe && stage3_rg_full &&
	     stage3_rg_stage3[140] &&
	     (stage3_rg_stage3[70] || stage3_rg_stage3[69]) ;
  assign csr_regfile$EN_csr_trap_actions = CAN_FIRE_RL_rl_trap ;
  assign csr_regfile$EN_csr_ret_actions = CAN_FIRE_RL_rl_stage1_xRET ;
  assign csr_regfile$EN_csr_minstret_incr =
	     WILL_FIRE_RL_rl_pipe && stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299) ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W_2 &&
	     csr_regfile$access_permitted_1 ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	     csr_regfile$access_permitted_2 ||
	     WILL_FIRE_RL_rl_stage1_WFI ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_xRET ;
  assign csr_regfile$EN_debug = 1'b0 ;
  // submodule f_reset_reqs
  assign f_reset_reqs$D_IN = hart0_server_reset_request_put ;
  assign f_reset_reqs$ENQ = EN_hart0_server_reset_request_put ;
  assign f_reset_reqs$DEQ = CAN_FIRE_RL_rl_reset_start ;
  assign f_reset_reqs$CLR = 1'b0 ;
  // submodule f_reset_rsps
  assign f_reset_rsps$D_IN = rg_run_on_reset ;
  assign f_reset_rsps$ENQ = MUX_rg_state$write_1__SEL_2 ;
  assign f_reset_rsps$DEQ = EN_hart0_server_reset_response_get ;
  assign f_reset_rsps$CLR = 1'b0 ;
  // submodule fpr_regfile
  assign fpr_regfile$read_rs1_port2_rs1 = 5'h0 ;
  assign fpr_regfile$read_rs1_rs1 = stage1_rg_stage_input[139:135] ;
  assign fpr_regfile$read_rs2_rs2 = stage1_rg_stage_input[134:130] ;
  assign fpr_regfile$read_rs3_rs3 = stage1_rg_stage_input[129:125] ;
  assign fpr_regfile$write_rd_rd = stage3_rg_stage3[139:135] ;
  assign fpr_regfile$write_rd_rd_val = stage3_rg_stage3[63:0] ;
  assign fpr_regfile$EN_server_reset_request_put =
	     CAN_FIRE_RL_rl_reset_start ;
  assign fpr_regfile$EN_server_reset_response_get =
	     MUX_rg_state$write_1__SEL_2 ;
  assign fpr_regfile$EN_write_rd =
	     WILL_FIRE_RL_rl_pipe && stage3_rg_full &&
	     stage3_rg_stage3[140] &&
	     stage3_rg_stage3[69] ;
  // submodule gpr_regfile
  assign gpr_regfile$read_rs1_port2_rs1 = 5'h0 ;
  assign gpr_regfile$read_rs1_rs1 = stage1_rg_stage_input[139:135] ;
  assign gpr_regfile$read_rs2_rs2 = stage1_rg_stage_input[134:130] ;
  assign gpr_regfile$write_rd_rd =
	     (MUX_csr_regfile$mav_csr_write_1__SEL_1 ||
	      MUX_gpr_regfile$write_rd_1__SEL_2) ?
	       rg_trap_instr[11:7] :
	       stage3_rg_stage3[139:135] ;
  assign gpr_regfile$write_rd_rd_val =
	     (MUX_csr_regfile$mav_csr_write_1__SEL_1 ||
	      MUX_gpr_regfile$write_rd_1__SEL_2) ?
	       csr_regfile$read_csr[63:0] :
	       stage3_rg_stage3[134:71] ;
  assign gpr_regfile$EN_server_reset_request_put =
	     CAN_FIRE_RL_rl_reset_start ;
  assign gpr_regfile$EN_server_reset_response_get =
	     MUX_rg_state$write_1__SEL_2 ;
  assign gpr_regfile$EN_write_rd =
	     WILL_FIRE_RL_rl_stage1_CSRR_W_2 &&
	     csr_regfile$access_permitted_1 ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	     csr_regfile$access_permitted_2 ||
	     WILL_FIRE_RL_rl_pipe && stage3_rg_full &&
	     stage3_rg_stage3[140] &&
	     !stage3_rg_stage3[69] ;
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
  assign near_mem$dmem_req_addr = x_out_data_to_stage2_addr__h10120 ;
  assign near_mem$dmem_req_amo_funct7 =
	     x_out_data_to_stage2_val1__h10121[6:0] ;
  assign near_mem$dmem_req_f3 = MUX_rg_trap_instr$write_1__VAL_1[14:12] ;
  assign near_mem$dmem_req_mstatus_MXR = csr_regfile$read_mstatus[19] ;
  assign near_mem$dmem_req_op =
	     (stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	      (stage1_rg_stage_input[151:145] == 7'b0000011 ||
	       stage1_rg_stage_input[151:145] == 7'b0000111)) ?
	       2'd0 :
	       ((stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
		 (stage1_rg_stage_input[151:145] == 7'b0100011 ||
		  stage1_rg_stage_input[151:145] == 7'b0100111)) ?
		  2'd1 :
		  2'd2) ;
  assign near_mem$dmem_req_priv =
	     csr_regfile$read_mstatus[17] ?
	       csr_regfile$read_mstatus[12:11] :
	       rg_cur_priv ;
  assign near_mem$dmem_req_satp = csr_regfile$read_satp ;
  assign near_mem$dmem_req_sstatus_SUM = csr_regfile$read_sstatus[18] ;
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1531 or
	  alu_outputs___1_fval2__h10701 or branch_target__h10301)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0100111:
	  near_mem$dmem_req_store_value = alu_outputs___1_fval2__h10701;
      7'b1100011: near_mem$dmem_req_store_value = branch_target__h10301;
      default: near_mem$dmem_req_store_value =
		   IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1531;
    endcase
  end
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
	     (MUX_imem_rg_cache_addr$write_1__SEL_1 ||
	      MUX_imem_rg_cache_addr$write_1__SEL_2 ||
	      MUX_rg_state$write_1__SEL_7) ?
	       csr_regfile$read_sstatus[18] :
	       imem_rg_sstatus_SUM ;
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 ||
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  assign near_mem$EN_dmem_req =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2541 ;
  assign near_mem$EN_server_fence_i_request_put =
	     MUX_rg_state$write_1__SEL_12 ;
  assign near_mem$EN_server_fence_i_response_get =
	     CAN_FIRE_RL_rl_finish_FENCE_I ;
  assign near_mem$EN_server_fence_request_put = MUX_rg_state$write_1__SEL_13 ;
  assign near_mem$EN_server_fence_response_get = CAN_FIRE_RL_rl_finish_FENCE ;
  assign near_mem$EN_sfence_vma_server_request_put =
	     MUX_rg_state$write_1__SEL_14 ;
  assign near_mem$EN_sfence_vma_server_response_get =
	     CAN_FIRE_RL_rl_finish_SFENCE_VMA ;
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
  assign stage2_f_reset_reqs$DEQ = CAN_FIRE_RL_stage2_rl_reset_begin ;
  assign stage2_f_reset_reqs$CLR = 1'b0 ;
  // submodule stage2_f_reset_rsps
  assign stage2_f_reset_rsps$ENQ = CAN_FIRE_RL_stage2_rl_reset_end ;
  assign stage2_f_reset_rsps$DEQ = MUX_rg_state$write_1__SEL_2 ;
  assign stage2_f_reset_rsps$CLR = 1'b0 ;
  // submodule stage2_fbox
  assign stage2_fbox$req_f7 = MUX_rg_trap_instr$write_1__VAL_1[31:25] ;
  assign stage2_fbox$req_opcode = MUX_rg_trap_instr$write_1__VAL_1[6:0] ;
  assign stage2_fbox$req_rm = rm__h10284 ;
  assign stage2_fbox$req_rs2 = MUX_rg_trap_instr$write_1__VAL_1[24:20] ;
  assign stage2_fbox$req_v1 =
	     NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d2505 ?
	       x_out_data_to_stage2_val1__h10121 :
	       x_out_data_to_stage2_fval1__h10123 ;
  assign stage2_fbox$req_v2 = alu_outputs___1_fval2__h10701 ;
  assign stage2_fbox$req_v3 = x_out_data_to_stage2_fval3__h10125 ;
  assign stage2_fbox$EN_server_reset_request_put =
	     CAN_FIRE_RL_stage2_rl_reset_begin ;
  assign stage2_fbox$EN_server_reset_response_get =
	     CAN_FIRE_RL_stage2_rl_reset_end ;
  assign stage2_fbox$EN_req =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2591 ;
  // submodule stage2_mbox
  assign stage2_mbox$req_f3 = MUX_rg_trap_instr$write_1__VAL_1[14:12] ;
  assign stage2_mbox$req_is_OP_not_OP_32 =
	     !MUX_rg_trap_instr$write_1__VAL_1[3] ;
  assign stage2_mbox$req_v1 = x_out_data_to_stage2_val1__h10121 ;
  assign stage2_mbox$req_v2 = x_out_data_to_stage2_val2__h10122 ;
  assign stage2_mbox$set_verbosity_verbosity = 4'h0 ;
  assign stage2_mbox$EN_set_verbosity = 1'b0 ;
  assign stage2_mbox$EN_req_reset = 1'b0 ;
  assign stage2_mbox$EN_rsp_reset = 1'b0 ;
  assign stage2_mbox$EN_req =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2575 ;
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
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303 &&
	      stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334) ?
	       { CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q23,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[151:145] != 7'b1100011 ||
		 IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d432,
		 x_out_cf_info_fallthru_PC__h16274,
		 alu_outputs_cf_info_taken_PC__h16267 } :
	       195'h6AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ;
  assign stageF_branch_predictor$bp_train_instr = d_instr__h25360 ;
  assign stageF_branch_predictor$bp_train_is_i32_not_i16 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2072 ||
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
  assign stageF_branch_predictor$predict_rsp_instr = d_instr__h25360 ;
  assign stageF_branch_predictor$predict_rsp_is_i32_not_i16 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2072 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	     near_mem$imem_instr[1:0] == 2'b11 ;
  assign stageF_branch_predictor$EN_reset = 1'b0 ;
  assign stageF_branch_predictor$EN_predict_req =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  assign stageF_branch_predictor$EN_bp_train =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 ;
  // submodule stageF_f_reset_reqs
  assign stageF_f_reset_reqs$ENQ = CAN_FIRE_RL_rl_reset_start ;
  assign stageF_f_reset_reqs$DEQ = CAN_FIRE_RL_stageF_rl_reset ;
  assign stageF_f_reset_reqs$CLR = 1'b0 ;
  // submodule stageF_f_reset_rsps
  assign stageF_f_reset_rsps$ENQ = CAN_FIRE_RL_stageF_rl_reset ;
  assign stageF_f_reset_rsps$DEQ = MUX_rg_state$write_1__SEL_2 ;
  assign stageF_f_reset_rsps$CLR = 1'b0 ;
  // remaining internal signals
  assign IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1657 =
	     next_pc__h9847 == stage1_rg_stage_input[215:152] ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2310 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2306 ?
	       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	       !IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1657 &&
	       stageF_rg_full &&
	       (!near_mem$imem_valid ||
		NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2112) :
	       stage1_rg_full ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2313 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2310 &&
	     stageD_rg_full ||
	     !stageF_rg_full ||
	     !near_mem$imem_valid ||
	     NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2112 ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2325 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2313 ||
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2319 ||
	     (imem_rg_pc[1:0] == 2'b0 || near_mem$imem_exc ||
	      !imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2634 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2306 ?
	       !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	       IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1657 ||
	       !stageF_rg_full ||
	       near_mem$imem_valid &&
	       near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119 :
	       !stage1_rg_full ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 =
	     (IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2634 ||
	      !stageD_rg_full) &&
	     stageF_rg_full &&
	     near_mem$imem_valid &&
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119 ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2728 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2306 ?
	       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	       IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2347 :
	       stage1_rg_full ;
  assign IF_NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem__ETC___d2089 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2086 ?
	       { 16'b0,
		 imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ?
		   near_mem$imem_instr[31:16] :
		   imem_rg_cache_b16 } :
	       near_mem$imem_instr ;
  assign IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2347 =
	     !IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1657 &&
	     stageF_rg_full &&
	     (!near_mem$imem_valid ||
	      NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2112) ;
  assign IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2405 =
	     IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1657 ||
	     !stageF_rg_full ||
	     near_mem$imem_valid &&
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119 ;
  assign IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2589 =
	     IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2405 &&
	     NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d449 &&
	     stage1_rg_stage_input[151:145] != 7'b1100011 &&
	     stage1_rg_stage_input[151:145] != 7'b1101111 &&
	     stage1_rg_stage_input[151:145] != 7'b1100111 &&
	     stage1_rg_stage_input[151:145] != 7'b0010011 &&
	     stage1_rg_stage_input[151:145] != 7'b0110011 &&
	     stage1_rg_stage_input[151:145] != 7'b0011011 &&
	     stage1_rg_stage_input[151:145] != 7'b0111011 &&
	     stage1_rg_stage_input[151:145] != 7'b0110111 &&
	     stage1_rg_stage_input[151:145] != 7'b0010111 &&
	     stage1_rg_stage_input[151:145] != 7'b0000011 &&
	     stage1_rg_stage_input[151:145] != 7'b0100011 &&
	     stage1_rg_stage_input[151:145] != 7'b0101111 &&
	     stage1_rg_stage_input[151:145] != 7'b0000111 &&
	     stage1_rg_stage_input[151:145] != 7'b0100111 ;
  assign IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d343 =
	     x_out_fbypass_rd__h9453 == stage1_rg_stage_input[139:135] ;
  assign IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d344 =
	     x_out_fbypass_rd__h9453 == stage1_rg_stage_input[134:130] ;
  assign IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d347 =
	     x_out_fbypass_rd__h9453 == stage1_rg_stage_input[129:125] ;
  assign IF_csr_regfile_read_csr_rg_trap_instr_798_BITS_ETC___d2856 =
	     csr_regfile$read_csr[63:0] | rs1_val__h35329 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1930 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b001) ?
	       instr__h24785 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
		 stageD_rg_data[79:77] == 3'b101) ?
		  instr__h24936 :
		  32'h0) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1931 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b101) ?
	       instr__h24586 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1930 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1932 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b001 &&
	      csr_regfile$read_misa[3]) ?
	       instr__h24421 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1931 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1933 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b011 &&
	      csr_regfile$read_misa[5]) ?
	       instr__h23621 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1932 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1934 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b111) ?
	       instr__h23416 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1933 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1935 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b011) ?
	       instr__h23265 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1934 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1936 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b111) ?
	       instr__h23066 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1935 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1938 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:76] == 4'b1001 &&
	      stageD_rg_data[75:71] == 5'd0 &&
	      stageD_rg_data[70:66] == 5'd0) ?
	       instr__h22817 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
		 stageD_rg_data[75:71] != 5'd0 &&
		 stageD_rg_data[79:77] == 3'b011) ?
		  instr__h22913 :
		  IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1936) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1940 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:74] == 6'b100111 &&
	      stageD_rg_data[70:69] == 2'b01) ?
	       instr__h22521 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:74] == 6'b100111 &&
		 stageD_rg_data[70:69] == 2'b0) ?
		  instr__h22659 :
		  IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1938) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1942 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:74] == 6'b100011 &&
	      stageD_rg_data[70:69] == 2'b01) ?
	       instr__h22247 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:74] == 6'b100011 &&
		 stageD_rg_data[70:69] == 2'b0) ?
		  instr__h22383 :
		  IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1940) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1944 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:74] == 6'b100011 &&
	      stageD_rg_data[70:69] == 2'b11) ?
	       instr__h21975 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:74] == 6'b100011 &&
		 stageD_rg_data[70:69] == 2'b10) ?
		  instr__h22111 :
		  IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1942) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1945 =
	     (csr_regfile_read_misa__6_BIT_2_672_AND_stageD__ETC___d1753 &&
	      stageD_rg_data[70:66] != 5'd0) ?
	       instr__h21880 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1944 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1946 =
	     (csr_regfile_read_misa__6_BIT_2_672_AND_stageD__ETC___d1747 &&
	      stageD_rg_data[70:66] != 5'd0) ?
	       instr__h21761 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1945 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1948 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b100 &&
	      stageD_rg_data[75:74] == 2'b01 &&
	      imm6__h19874 != 6'd0) ?
	       instr__h21466 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:77] == 3'b100 &&
		 stageD_rg_data[75:74] == 2'b10) ?
		  instr__h21583 :
		  IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1946) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1949 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b100 &&
	      stageD_rg_data[75:74] == 2'b0 &&
	      imm6__h19874 != 6'd0) ?
	       instr__h21277 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1948 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1950 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b0 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      imm6__h19874 != 6'd0) ?
	       instr__h21088 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1949 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1952 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b011 &&
	      stageD_rg_data[75:71] == 5'd2 &&
	      nzimm10__h20543 != 10'd0) ?
	       instr__h20747 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
		 stageD_rg_data[79:77] == 3'b0 &&
		 nzimm10__h20758 != 10'd0) ?
		  instr__h20919 :
		  IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1950) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1954 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b0 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      imm6__h19874 != 6'd0 ||
	      csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b0 &&
	      stageD_rg_data[75:71] == 5'd0 &&
	      imm6__h19874 == 6'd0) ?
	       instr__h20265 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:77] == 3'b001 &&
		 stageD_rg_data[75:71] != 5'd0) ?
		  instr__h20492 :
		  IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1952) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1955 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b011 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      stageD_rg_data[75:71] != 5'd2 &&
	      imm6__h19874 != 6'd0) ?
	       instr__h20136 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1954 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1957 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b111) ?
	       instr__h19614 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:77] == 3'b010 &&
		 stageD_rg_data[75:71] != 5'd0) ?
		  instr__h19952 :
		  IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1955) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1958 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b110) ?
	       instr__h19297 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1957 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1959 =
	     (csr_regfile_read_misa__6_BIT_2_672_AND_stageD__ETC___d1753 &&
	      stageD_rg_data[70:66] == 5'd0) ?
	       instr__h19232 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1958 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1960 =
	     (csr_regfile_read_misa__6_BIT_2_672_AND_stageD__ETC___d1747 &&
	      stageD_rg_data[70:66] == 5'd0) ?
	       instr__h19116 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1959 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1961 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b101) ?
	       instr__h18663 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1960 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1962 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b110) ?
	       instr__h18434 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1961 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1963 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b010) ?
	       instr__h18239 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1962 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1964 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b110) ?
	       instr__h18047 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1963 ;
  assign IF_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg_p_ETC___d2090 =
	     (imem_rg_pc[1:0] == 2'b0 &&
	      imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	      near_mem$imem_instr[1:0] != 2'b11) ?
	       instr_out___1__h25384 :
	       IF_NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem__ETC___d2089 ;
  assign IF_stage1_rg_full_31_THEN_stage1_rg_stage_inpu_ETC___d2897 =
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     (NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d2884 ||
	      !stage1_rg_stage_input[332] &&
	      stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d2892) ;
  assign IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d2764 =
	     (stage1_rg_stage_input[112:110] == 3'd0) ?
	       NOT_stage1_rg_stage_input_32_BITS_144_TO_140_0_ETC___d1169 &&
	       (stage1_rg_stage_input[144:140] != 5'd0 ||
		stage1_rg_stage_input[139:135] != 5'd0 ||
		stage1_rg_stage_input[87:76] == 12'b0 ||
		stage1_rg_stage_input[87:76] == 12'b000000000001 ||
		(rg_cur_priv != 2'b11 ||
		 stage1_rg_stage_input[87:76] != 12'b001100000010) &&
		NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d2758) :
	       stage1_rg_stage_input[112:110] != 3'b001 &&
	       stage1_rg_stage_input[112:110] != 3'b101 &&
	       stage1_rg_stage_input[112:110] != 3'b010 &&
	       stage1_rg_stage_input[112:110] != 3'b110 &&
	       stage1_rg_stage_input[112:110] != 3'b011 &&
	       stage1_rg_stage_input[112:110] != 3'b111 ;
  assign IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d1260 =
	     rs1_val_bypassed__h5597 +
	     SEXT_stage1_rg_stage_input_32_BITS_87_TO_76_047___d1259 ;
  assign IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d421 =
	     rs1_val_bypassed__h5597 == rs2_val_bypassed__h5603 ;
  assign IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d423 =
	     (rs1_val_bypassed__h5597 ^ 64'h8000000000000000) <
	     (rs2_val_bypassed__h5603 ^ 64'h8000000000000000) ;
  assign IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d425 =
	     rs1_val_bypassed__h5597 < rs2_val_bypassed__h5603 ;
  assign IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC__q18 =
	     IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d1260[31:0] ;
  assign IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1521 =
	     ((stage1_rg_stage_input[151:145] == 7'b0010011 ||
	       stage1_rg_stage_input[151:145] == 7'b0110011) &&
	      (stage1_rg_stage_input[112:110] == 3'b001 ||
	       stage1_rg_stage_input[112:110] == 3'b101)) ?
	       alu_outputs___1_val1__h10496 :
	       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1520 ;
  assign IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1522 =
	     (stage1_rg_stage_input[151:145] == 7'b0110011 &&
	      stage1_rg_stage_input[104:98] == 7'b0000001 ||
	      stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d794) ?
	       rs1_val_bypassed__h5597 :
	       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1521 ;
  assign IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1531 =
	     (stage1_rg_stage_input[151:145] == 7'b0110011 &&
	      stage1_rg_stage_input[104:98] == 7'b0000001 ||
	      stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d794) ?
	       rs2_val_bypassed__h5603 :
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q19 ;
  assign IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       stage1_rg_stage_input[112:110] != 3'd0 &&
	       stage1_rg_stage_input[112:110] != 3'b001 &&
	       stage1_rg_stage_input[112:110] != 3'b100 &&
	       stage1_rg_stage_input[112:110] != 3'b101 &&
	       stage1_rg_stage_input[112:110] != 3'b110 &&
	       stage1_rg_stage_input[112:110] != 3'b111 ||
	       IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d432 :
	       stage1_rg_stage_input[151:145] == 7'b1101111 ||
	       stage1_rg_stage_input[151:145] == 7'b1100111 ||
	       NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d760 ;
  assign IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       stage1_rg_stage_input[112:110] != 3'd0 &&
	       stage1_rg_stage_input[112:110] != 3'b001 &&
	       stage1_rg_stage_input[112:110] != 3'b100 &&
	       stage1_rg_stage_input[112:110] != 3'b101 &&
	       stage1_rg_stage_input[112:110] != 3'b110 &&
	       stage1_rg_stage_input[112:110] != 3'b111 ||
	       IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d769 :
	       stage1_rg_stage_input[151:145] != 7'b1101111 &&
	       (stage1_rg_stage_input[151:145] != 7'b1100111 ||
		stage1_rg_stage_input[112:110] != 3'd0) ;
  assign IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       (stage1_rg_stage_input[112:110] == 3'd0 ||
		stage1_rg_stage_input[112:110] == 3'b001 ||
		stage1_rg_stage_input[112:110] == 3'b100 ||
		stage1_rg_stage_input[112:110] == 3'b101 ||
		stage1_rg_stage_input[112:110] == 3'b110 ||
		stage1_rg_stage_input[112:110] == 3'b111) &&
	       IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d769 :
	       stage1_rg_stage_input[151:145] != 7'b1101111 &&
	       stage1_rg_stage_input[151:145] != 7'b1100111 &&
	       stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d962 ;
  assign IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       (stage1_rg_stage_input[112:110] == 3'd0 ||
		stage1_rg_stage_input[112:110] == 3'b001 ||
		stage1_rg_stage_input[112:110] == 3'b100 ||
		stage1_rg_stage_input[112:110] == 3'b101 ||
		stage1_rg_stage_input[112:110] == 3'b110 ||
		stage1_rg_stage_input[112:110] == 3'b111) &&
	       IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d432 :
	       stage1_rg_stage_input[151:145] == 7'b1101111 ||
	       stage1_rg_stage_input[151:145] == 7'b1100111 &&
	       stage1_rg_stage_input[112:110] == 3'd0 ;
  assign IF_stage1_rg_stage_input_32_BITS_335_TO_334_33_ETC___d2511 =
	     { stage1_rg_stage_input[263:232],
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q22,
	       data_to_stage2_rd__h10102,
	       data_to_stage2_addr__h10103,
	       x_out_data_to_stage2_val1__h10121,
	       data_to_stage2_val2__h10105,
	       alu_outputs___1_fval1__h11709,
	       alu_outputs___1_fval2__h10701,
	       alu_outputs___1_fval3__h11711,
	       stage1_rg_stage_input[151:145] != 7'b1100011 &&
	       stage1_rg_stage_input[151:145] != 7'b1101111 &&
	       stage1_rg_stage_input[151:145] != 7'b1100111 &&
	       stage1_rg_stage_input[151:145] != 7'b0010011 &&
	       stage1_rg_stage_input[151:145] != 7'b0110011 &&
	       stage1_rg_stage_input[151:145] != 7'b0011011 &&
	       stage1_rg_stage_input[151:145] != 7'b0111011 &&
	       stage1_rg_stage_input[151:145] != 7'b0110111 &&
	       stage1_rg_stage_input[151:145] != 7'b0010111 &&
	       stage1_rg_stage_input[151:145] != 7'b0000011 &&
	       stage1_rg_stage_input[151:145] != 7'b0100011 &&
	       stage1_rg_stage_input[151:145] != 7'b0001111 &&
	       stage1_rg_stage_input[151:145] != 7'b1110011 &&
	       stage1_rg_stage_input[151:145] != 7'b0101111 &&
	       (stage1_rg_stage_input[151:145] == 7'b0000111 ||
		stage1_rg_stage_input[151:145] != 7'b0100111 &&
		NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d2461),
	       stage1_rg_stage_input[151:145] == 7'b0100111,
	       NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d2505,
	       rm__h10284 } ;
  assign IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d337 =
	     x_out_bypass_rd__h9271 == stage1_rg_stage_input[139:135] ;
  assign IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d339 =
	     x_out_bypass_rd__h9271 == stage1_rg_stage_input[134:130] ;
  assign NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 =
	     cur_verbosity__h3946 > 4'd1 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2298 =
	     !csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2295 ||
	      !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2306 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2298 &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299 ||
	      !stage2_rg_full) &&
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2315 =
	     (!csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2295) &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299 ||
	      !stage2_rg_full) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2319 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2315 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     !IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1657 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2342 =
	     !csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	     (!stage1_rg_full || stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763 &&
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775 ||
	      !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334) &&
	     (!stage1_rg_full ||
	      NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2334) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2346 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2342 ||
	     (!stage1_rg_full ||
	      stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2343) &&
	     (!stage1_rg_full ||
	      NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2334) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2401 =
	     (!csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2295 &&
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972) &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299 ||
	      !stage2_rg_full) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2407 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2401 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2405 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2541 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2401 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2405 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     (stage1_rg_stage_input[151:145] == 7'b0000011 ||
	      stage1_rg_stage_input[151:145] == 7'b0000111 ||
	      stage1_rg_stage_input[151:145] == 7'b0100011 ||
	      stage1_rg_stage_input[151:145] == 7'b0100111 ||
	      stage1_rg_stage_input[151:145] == 7'b0101111) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2575 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2401 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2405 &&
	     stage1_rg_stage_input[151:145] != 7'b0000011 &&
	     stage1_rg_stage_input[151:145] != 7'b0000111 &&
	     stage1_rg_stage_input[151:145] != 7'b0100011 &&
	     stage1_rg_stage_input[151:145] != 7'b0100111 &&
	     stage1_rg_stage_input[151:145] != 7'b0101111 &&
	     stage1_rg_stage_input[151:145] != 7'b1100011 &&
	     stage1_rg_stage_input[151:145] != 7'b1101111 &&
	     stage1_rg_stage_input[151:145] != 7'b1100111 &&
	     (stage1_rg_stage_input[151:145] == 7'b0110011 &&
	      stage1_rg_stage_input[104:98] == 7'b0000001 ||
	      stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d794) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2591 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2401 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2589 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2601 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2401 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2405 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2605 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2401 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2405 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1297 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2609 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2401 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2405 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     (stage1_rg_stage_input[151:145] == 7'b0000011 ||
	      stage1_rg_stage_input[151:145] == 7'b0000111) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2613 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2401 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2405 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1332 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2618 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2401 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2405 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2614 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2622 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2401 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2405 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     stage1_rg_stage_input[151:145] == 7'b0101111 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2630 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2401 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2405 &&
	     !IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1657 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2750 =
	     !csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	     !stage1_rg_stage_input[332] &&
	     (IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) ;
  assign NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d2461 =
	     NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d851 &&
	     (stage1_rg_stage_input_32_BITS_99_TO_98_74_EQ_0_ETC___d2440 ||
	      stage1_rg_stage_input[104:98] == 7'h69 &&
	      (stage1_rg_stage_input[134:130] == 5'b00010 ||
	       stage1_rg_stage_input[134:130] == 5'b00011) ||
	      stage1_rg_stage_input[104:98] == 7'h79 &&
	      stage1_rg_stage_input[134:130] == 5'd0 &&
	      rm__h10284 == 3'b0) &&
	     (stage1_rg_stage_input[104:98] != 7'h61 ||
	      stage1_rg_stage_input[134:130] != 5'd0) &&
	     (stage1_rg_stage_input[104:98] != 7'h61 ||
	      stage1_rg_stage_input[134:130] != 5'b00001) &&
	     (stage1_rg_stage_input[104:98] != 7'h61 ||
	      stage1_rg_stage_input[134:130] != 5'b00010) &&
	     (stage1_rg_stage_input[104:98] != 7'h61 ||
	      stage1_rg_stage_input[134:130] != 5'b00011) &&
	     stage1_rg_stage_input[104:98] != 7'h71 &&
	     stage1_rg_stage_input[104:98] != 7'h51 &&
	     (stage1_rg_stage_input[104:98] != 7'h60 ||
	      stage1_rg_stage_input[134:130] != 5'b00010) &&
	     (stage1_rg_stage_input[104:98] != 7'h60 ||
	      stage1_rg_stage_input[134:130] != 5'b00011) &&
	     (stage1_rg_stage_input[104:98] != 7'h60 ||
	      stage1_rg_stage_input[134:130] != 5'd0) &&
	     (stage1_rg_stage_input[104:98] != 7'h60 ||
	      stage1_rg_stage_input[134:130] != 5'b00001) &&
	     stage1_rg_stage_input[104:98] != 7'h70 &&
	     stage1_rg_stage_input[104:98] != 7'h50 ;
  assign NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d2505 =
	     NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d851 &&
	     (_0_OR_stage1_rg_stage_input_32_BITS_104_TO_98_3_ETC___d2484 ||
	      stage1_rg_stage_input[104:98] == 7'h61 &&
	      (stage1_rg_stage_input[134:130] == 5'b00010 ||
	       stage1_rg_stage_input[134:130] == 5'b00011) ||
	      stage1_rg_stage_input[104:98] == 7'h71 &&
	      stage1_rg_stage_input[134:130] == 5'd0 &&
	      rm__h10284 == 3'b0 ||
	      stage1_rg_stage_input[104:98] == 7'h69 &&
	      stage1_rg_stage_input[134:130] == 5'b00010 ||
	      stage1_rg_stage_input[104:98] == 7'h69 &&
	      stage1_rg_stage_input[134:130] == 5'b00011 ||
	      stage1_rg_stage_input[104:98] == 7'h79 &&
	      stage1_rg_stage_input[134:130] == 5'd0 &&
	      rm__h10284 == 3'b0) &&
	     stage1_rg_stage_input[151:145] == 7'b1010011 &&
	     (stage1_rg_stage_input[104:98] == 7'h69 &&
	      (stage1_rg_stage_input[134:130] == 5'd0 ||
	       stage1_rg_stage_input[134:130] == 5'b00001 ||
	       stage1_rg_stage_input[134:130] == 5'b00010 ||
	       stage1_rg_stage_input[134:130] == 5'b00011) ||
	      stage1_rg_stage_input[104:98] == 7'h79 ||
	      stage1_rg_stage_input[104:98] == 7'h68 &&
	      (stage1_rg_stage_input[134:130] == 5'd0 ||
	       stage1_rg_stage_input[134:130] == 5'b00001 ||
	       stage1_rg_stage_input[134:130] == 5'b00010 ||
	       stage1_rg_stage_input[134:130] == 5'b00011) ||
	      stage1_rg_stage_input[104:98] == 7'h78) ;
  assign NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d851 =
	     csr_regfile$read_mstatus[14:13] != 2'h0 &&
	     ((stage1_rg_stage_input[112:110] == 3'b111) ?
		csr_regfile$read_frm != 3'b101 &&
		csr_regfile$read_frm != 3'b110 &&
		csr_regfile$read_frm != 3'b111 :
		stage1_rg_stage_input[112:110] != 3'b101 &&
		stage1_rg_stage_input[112:110] != 3'b110) ;
  assign NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2072 =
	     imem_rg_pc[1:0] != 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d2064 &&
	     near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_066___d2067 &&
	     imem_rg_cache_b16[1:0] == 2'b11 ;
  assign NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2086 =
	     imem_rg_pc[1:0] != 2'b0 &&
	     (imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	      near_mem$imem_instr[17:16] != 2'b11 ||
	      imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d2064 &&
	      imem_rg_cache_b16[1:0] != 2'b11) ;
  assign NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2105 =
	     !near_mem$imem_exc &&
	     (imem_rg_pc[1:0] == 2'b0 ||
	      !imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d2064 ||
	      !near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_066___d2067 ||
	      imem_rg_cache_b16[1:0] != 2'b11) &&
	     (imem_rg_pc[1:0] != 2'b0 ||
	      !imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[1:0] != 2'b11) ;
  assign NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2112 =
	     NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2105 &&
	     imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d2109 &&
	     (imem_rg_pc[1:0] != 2'b0 ||
	      !imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[1:0] == 2'b11) ;
  assign NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d1104 =
	     (rg_cur_priv != 2'b11 &&
	      (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[20]) ||
	      stage1_rg_stage_input[104:98] != 7'b0001001) &&
	     stage1_rg_stage_input_32_BITS_144_TO_140_027_E_ETC___d1103 ;
  assign NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d1126 =
	     (rg_cur_priv != 2'b11 &&
	      (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[20]) ||
	      stage1_rg_stage_input[104:98] != 7'b0001001) &&
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     stage1_rg_stage_input[139:135] == 5'd0 &&
	     rg_cur_priv_8_EQ_0b11_059_OR_rg_cur_priv_8_EQ__ETC___d1124 ;
  assign NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d1201 =
	     rg_cur_priv != 2'b11 &&
	     (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[21]) &&
	     (rg_cur_priv != 2'b0 || !csr_regfile$read_misa[13]) ||
	     stage1_rg_stage_input[87:76] != 12'b000100000101 ;
  assign NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d1645 =
	     (rg_cur_priv != 2'b11 &&
	      (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[20]) ||
	      stage1_rg_stage_input[104:98] != 7'b0001001) &&
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     stage1_rg_stage_input[139:135] == 5'd0 &&
	     stage1_rg_stage_input[87:76] == 12'b000000000001 ;
  assign NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d2758 =
	     (rg_cur_priv != 2'b11 &&
	      (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[22]) ||
	      stage1_rg_stage_input[87:76] != 12'b000100000010) &&
	     NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d1201 ;
  assign NOT_rg_next_pc_867_BITS_1_TO_0_868_EQ_0b0_869__ETC___d2875 =
	     rg_next_pc[1:0] != 2'b0 && near_mem$imem_valid &&
	     !near_mem$imem_exc &&
	     addr_of_b32__h43884 == near_mem$imem_pc ;
  assign NOT_rg_run_on_reset_247_248_OR_imem_rg_pc_BITS_ETC___d2255 =
	     !rg_run_on_reset ||
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2251 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req ;
  assign NOT_soc_map_m_pc_reset_value__268_BITS_1_TO_0__ETC___d2284 =
	     soc_map$m_pc_reset_value[1:0] != 2'b0 && near_mem$imem_valid &&
	     !near_mem$imem_exc &&
	     addr_of_b32__h27393 == near_mem$imem_pc ;
  assign NOT_stage1_rg_stage_input_32_BITS_104_TO_98_38_ETC___d746 =
	     (stage1_rg_stage_input[104:98] != 7'h61 ||
	      stage1_rg_stage_input[134:130] != 5'b00010 &&
	      stage1_rg_stage_input[134:130] != 5'b00011) &&
	     (stage1_rg_stage_input[104:98] != 7'h71 ||
	      stage1_rg_stage_input[134:130] != 5'd0 ||
	      rm__h10284 != 3'b0) &&
	     (stage1_rg_stage_input[104:98] != 7'h69 ||
	      stage1_rg_stage_input[134:130] != 5'b00010) &&
	     (stage1_rg_stage_input[104:98] != 7'h69 ||
	      stage1_rg_stage_input[134:130] != 5'b00011) &&
	     (stage1_rg_stage_input[104:98] != 7'h79 ||
	      stage1_rg_stage_input[134:130] != 5'd0 ||
	      rm__h10284 != 3'b0) ;
  assign NOT_stage1_rg_stage_input_32_BITS_109_TO_105_2_ETC___d559 =
	     (stage1_rg_stage_input[109:105] != 5'b00010 ||
	      stage1_rg_stage_input[134:130] != 5'd0) &&
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
	     stage1_rg_stage_input[112:110] != 3'b011 ;
  assign NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1157 =
	     stage1_rg_stage_input[112:110] != 3'd0 ||
	     stage1_rg_stage_input[144:140] != 5'd0 ||
	     stage1_rg_stage_input[139:135] != 5'd0 ||
	     stage1_rg_stage_input[263:260] != 4'b0 &&
	     stage1_rg_stage_input[263:260] != 4'b1000 ;
  assign NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1164 =
	     stage1_rg_stage_input[112:110] != 3'b001 ||
	     stage1_rg_stage_input[144:140] != 5'd0 ||
	     stage1_rg_stage_input[139:135] != 5'd0 ||
	     stage1_rg_stage_input[87:76] != 12'b0 ;
  assign NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d479 =
	     (stage1_rg_stage_input[112:110] != 3'd0 ||
	      stage1_rg_stage_input[151:145] == 7'b0110011 &&
	      stage1_rg_stage_input[262]) &&
	     (stage1_rg_stage_input[112:110] != 3'd0 ||
	      stage1_rg_stage_input[151:145] != 7'b0110011 ||
	      !stage1_rg_stage_input[262]) &&
	     CASE_stage1_rg_stage_input_BITS_112_TO_110_0b1_ETC__q11 ;
  assign NOT_stage1_rg_stage_input_32_BITS_144_TO_140_0_ETC___d1169 =
	     stage1_rg_stage_input[144:140] != 5'd0 ||
	     rg_cur_priv != 2'b11 &&
	     (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[20]) ||
	     stage1_rg_stage_input[104:98] != 7'b0001001 ;
  assign NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d2774 =
	     (stage1_rg_stage_input[151:145] != 7'b0110011 ||
	      stage1_rg_stage_input[104:98] != 7'b0000001) &&
	     NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d449 &&
	     (((stage1_rg_stage_input[151:145] == 7'b0010011 ||
		stage1_rg_stage_input[151:145] == 7'b0110011) &&
	       (stage1_rg_stage_input[112:110] == 3'b001 ||
		stage1_rg_stage_input[112:110] == 3'b101)) ?
		stage1_rg_stage_input[263] ||
		stage1_rg_stage_input[261:258] != 4'b0 :
		IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2772) ;
  assign NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d449 =
	     stage1_rg_stage_input[151:145] != 7'b0111011 ||
	     stage1_rg_stage_input[104:98] != 7'b0000001 ||
	     stage1_rg_stage_input[112:110] == 3'b001 ||
	     stage1_rg_stage_input[112:110] == 3'b010 ||
	     stage1_rg_stage_input[112:110] == 3'b011 ;
  assign NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d760 =
	     (stage1_rg_stage_input[151:145] != 7'b0110011 ||
	      stage1_rg_stage_input[104:98] != 7'b0000001) &&
	     NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d449 &&
	     (((stage1_rg_stage_input[151:145] == 7'b0010011 ||
		stage1_rg_stage_input[151:145] == 7'b0110011) &&
	       (stage1_rg_stage_input[112:110] == 3'b001 ||
		stage1_rg_stage_input[112:110] == 3'b101)) ?
		stage1_rg_stage_input[263] ||
		stage1_rg_stage_input[261:258] != 4'b0 :
		IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d758) ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1230 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972) &&
	     stage1_rg_stage_input[151:145] != 7'b1100011 &&
	     stage1_rg_stage_input[151:145] != 7'b1101111 &&
	     stage1_rg_stage_input[151:145] != 7'b1100111 ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1238 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972) &&
	     stage1_rg_stage_input[151:145] == 7'b1100011 ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1243 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972) &&
	     (stage1_rg_stage_input[151:145] == 7'b1101111 ||
	      stage1_rg_stage_input[151:145] == 7'b1100111) ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1249 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972) &&
	     stage1_rg_stage_input[151:145] == 7'b1101111 ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1300 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1297) ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1660 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     !IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1657 ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1664 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1657 ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2334 =
	     !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	     !stage1_rg_stage_input[332] &&
	     (IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2948 =
	     !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969 ||
	     stage1_rg_stage_input[332] ||
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763 &&
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775 ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2950 =
	     (NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2334 &&
	      stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2343) &&
	     stage1_rg_full &&
	     NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2948 ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972) ;
  assign NOT_stage1_rg_stage_input_32_BITS_99_TO_98_74__ETC___d734 =
	     (stage1_rg_stage_input[99:98] != 2'b0 &&
	      stage1_rg_stage_input[99:98] != 2'b01 ||
	      stage1_rg_stage_input[151:145] != 7'b1000011 &&
	      stage1_rg_stage_input[151:145] != 7'b1000111 &&
	      stage1_rg_stage_input[151:145] != 7'b1001111 &&
	      stage1_rg_stage_input[151:145] != 7'b1001011) &&
	     stage1_rg_stage_input[104:98] != 7'h0 &&
	     stage1_rg_stage_input[104:98] != 7'h04 &&
	     stage1_rg_stage_input[104:98] != 7'h08 &&
	     stage1_rg_stage_input[104:98] != 7'h0C &&
	     (stage1_rg_stage_input[104:98] != 7'h2C ||
	      stage1_rg_stage_input[134:130] != 5'd0) &&
	     (stage1_rg_stage_input[104:98] != 7'h10 || rm__h10284 != 3'b0) &&
	     (stage1_rg_stage_input[104:98] != 7'h10 ||
	      rm__h10284 != 3'b001) &&
	     (stage1_rg_stage_input[104:98] != 7'h10 ||
	      rm__h10284 != 3'b010) &&
	     (stage1_rg_stage_input[104:98] != 7'h14 || rm__h10284 != 3'b0) &&
	     (stage1_rg_stage_input[104:98] != 7'h14 ||
	      rm__h10284 != 3'b001) &&
	     (stage1_rg_stage_input[104:98] != 7'h60 ||
	      stage1_rg_stage_input[134:130] != 5'd0) &&
	     (stage1_rg_stage_input[104:98] != 7'h60 ||
	      stage1_rg_stage_input[134:130] != 5'b00001) &&
	     (stage1_rg_stage_input[104:98] != 7'h70 ||
	      stage1_rg_stage_input[134:130] != 5'd0 ||
	      rm__h10284 != 3'b0) &&
	     (stage1_rg_stage_input[104:98] != 7'h50 ||
	      rm__h10284 != 3'b010) &&
	     (stage1_rg_stage_input[104:98] != 7'h50 ||
	      rm__h10284 != 3'b001) &&
	     (stage1_rg_stage_input[104:98] != 7'h50 || rm__h10284 != 3'b0) &&
	     (stage1_rg_stage_input[104:98] != 7'h70 ||
	      stage1_rg_stage_input[134:130] != 5'd0 ||
	      rm__h10284 != 3'b001) &&
	     (stage1_rg_stage_input[104:98] != 7'h68 ||
	      stage1_rg_stage_input[134:130] != 5'd0) &&
	     (stage1_rg_stage_input[104:98] != 7'h68 ||
	      stage1_rg_stage_input[134:130] != 5'b00001) &&
	     (stage1_rg_stage_input[104:98] != 7'h78 ||
	      stage1_rg_stage_input[134:130] != 5'd0 ||
	      rm__h10284 != 3'b0) &&
	     (stage1_rg_stage_input[104:98] != 7'h60 ||
	      stage1_rg_stage_input[134:130] != 5'b00010 &&
	      stage1_rg_stage_input[134:130] != 5'b00011) &&
	     (stage1_rg_stage_input[104:98] != 7'h68 ||
	      stage1_rg_stage_input[134:130] != 5'b00010) &&
	     (stage1_rg_stage_input[104:98] != 7'h68 ||
	      stage1_rg_stage_input[134:130] != 5'b00011) &&
	     stage1_rg_stage_input[104:98] != 7'b0000001 &&
	     stage1_rg_stage_input[104:98] != 7'h05 &&
	     stage1_rg_stage_input[104:98] != 7'b0001001 &&
	     stage1_rg_stage_input[104:98] != 7'h0D &&
	     (stage1_rg_stage_input[104:98] != 7'h2D ||
	      stage1_rg_stage_input[134:130] != 5'd0) &&
	     (stage1_rg_stage_input[104:98] != 7'h11 || rm__h10284 != 3'b0) &&
	     (stage1_rg_stage_input[104:98] != 7'h11 ||
	      rm__h10284 != 3'b001) &&
	     (stage1_rg_stage_input[104:98] != 7'h11 ||
	      rm__h10284 != 3'b010) &&
	     (stage1_rg_stage_input[104:98] != 7'h15 || rm__h10284 != 3'b0) &&
	     (stage1_rg_stage_input[104:98] != 7'h15 ||
	      rm__h10284 != 3'b001) &&
	     (stage1_rg_stage_input[104:98] != 7'h20 ||
	      stage1_rg_stage_input[134:130] != 5'b00001) &&
	     (stage1_rg_stage_input[104:98] != 7'h21 ||
	      stage1_rg_stage_input[134:130] != 5'd0) &&
	     (stage1_rg_stage_input[104:98] != 7'h51 ||
	      rm__h10284 != 3'b010) &&
	     (stage1_rg_stage_input[104:98] != 7'h51 ||
	      rm__h10284 != 3'b001) &&
	     (stage1_rg_stage_input[104:98] != 7'h51 || rm__h10284 != 3'b0) &&
	     (stage1_rg_stage_input[104:98] != 7'h71 ||
	      stage1_rg_stage_input[134:130] != 5'd0 ||
	      rm__h10284 != 3'b001) &&
	     (stage1_rg_stage_input[104:98] != 7'h61 ||
	      stage1_rg_stage_input[134:130] != 5'd0) &&
	     (stage1_rg_stage_input[104:98] != 7'h61 ||
	      stage1_rg_stage_input[134:130] != 5'b00001) &&
	     (stage1_rg_stage_input[104:98] != 7'h69 ||
	      stage1_rg_stage_input[134:130] != 5'd0) &&
	     (stage1_rg_stage_input[104:98] != 7'h69 ||
	      stage1_rg_stage_input[134:130] != 5'b00001) ;
  assign NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1004 =
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1110011 &&
	     (stage1_rg_stage_input[112:110] == 3'b001 ||
	      stage1_rg_stage_input[112:110] == 3'b101) ;
  assign NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1019 =
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1110011 &&
	     (stage1_rg_stage_input[112:110] == 3'b010 ||
	      stage1_rg_stage_input[112:110] == 3'b110 ||
	      stage1_rg_stage_input[112:110] == 3'b011 ||
	      stage1_rg_stage_input[112:110] == 3'b111) ;
  assign NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1068 =
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1110011 &&
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     stage1_rg_stage_input_32_BITS_144_TO_140_027_E_ETC___d1065 ;
  assign NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1129 =
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1110011 &&
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d1126 ;
  assign NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d2884 =
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1110011 &&
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     stage1_rg_stage_input[104:98] != 7'b0001001 &&
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     stage1_rg_stage_input[139:135] == 5'd0 &&
	     rg_cur_priv == 2'b11 &&
	     stage1_rg_stage_input[87:76] == 12'b001100000010 ;
  assign NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1219 =
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1216 ;
  assign NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1297 =
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     (stage1_rg_stage_input[151:145] == 7'b1100011 ||
	      stage1_rg_stage_input[151:145] == 7'b1101111 ||
	      stage1_rg_stage_input[151:145] == 7'b1100111 ||
	      (stage1_rg_stage_input[151:145] != 7'b0110011 ||
	       stage1_rg_stage_input[104:98] != 7'b0000001) &&
	      NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d449 &&
	      (stage1_rg_stage_input[151:145] == 7'b0010011 ||
	       stage1_rg_stage_input[151:145] == 7'b0110011 ||
	       stage1_rg_stage_input[151:145] == 7'b0011011 ||
	       stage1_rg_stage_input[151:145] == 7'b0111011 ||
	       stage1_rg_stage_input[151:145] == 7'b0110111 ||
	       stage1_rg_stage_input[151:145] == 7'b0010111)) ;
  assign NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1335 =
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1332 ;
  assign NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303 =
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     !stage1_rg_stage_input[332] &&
	     (IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) ;
  assign NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 =
	     !stage2_rg_full || stage2_rg_stage2[397:395] == 3'd0 ||
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d297 ||
	     !IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d337 &&
	     !IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d339 ;
  assign NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 =
	     !stage2_rg_full || stage2_rg_stage2[397:395] == 3'd0 ||
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d324 ||
	     !IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d343 &&
	     !IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d344 &&
	     !IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d347 ;
  assign NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778 =
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     (stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763 &&
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775) ;
  assign NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 =
	     (!stage2_rg_full || stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d297 ||
	      !IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d337) &&
	     (!stage2_rg_full || stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d297 ||
	      !IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d339) &&
	     (!stage2_rg_full || stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d324 ||
	      !IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d343) &&
	     (!stage2_rg_full || stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d324 ||
	      !IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d344) &&
	     (!stage2_rg_full || stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d324 ||
	      !IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d347) ;
  assign NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148 =
	     stage2_rg_stage2[397:395] != 3'd0 &&
	     CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_ne_ETC__q3 ;
  assign NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156 =
	     (stage2_rg_stage2[397:395] == 3'd1 ||
	      stage2_rg_stage2[397:395] == 3'd4 ||
	      stage2_rg_stage2[397:395] == 3'd2) &&
	     near_mem$dmem_valid &&
	     near_mem$dmem_exc ;
  assign NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d177 =
	     (stage2_rg_stage2[397:395] != 3'd1 &&
	      stage2_rg_stage2[397:395] != 3'd4 &&
	      stage2_rg_stage2[397:395] != 3'd2 ||
	      !near_mem$dmem_valid ||
	      !near_mem$dmem_exc) &&
	     stage2_rg_stage2[397:395] != 3'd0 &&
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d175 ;
  assign NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d289 =
	     stage2_rg_stage2[397:395] != 3'd2 &&
	     ((stage2_rg_stage2[397:395] == 3'd3) ?
		!stage2_mbox$valid :
		!stage2_rg_stage2[5] && !stage2_fbox$valid) ;
  assign NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d402 =
	     stage2_rg_stage2[397:395] != 3'd2 &&
	     ((stage2_rg_stage2[397:395] == 3'd3) ?
		stage2_mbox$valid :
		!stage2_rg_stage2[5] && stage2_fbox$valid) ;
  assign NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d2707 =
	     stageF_branch_predictor$predict_rsp[1:0] != 2'b0 &&
	     near_mem$imem_valid &&
	     !near_mem$imem_exc &&
	     addr_of_b32__h32333 == near_mem$imem_pc ;
  assign SEXT_stage1_rg_stage_input_32_BITS_87_TO_76_047___d1259 =
	     { {52{stage1_rg_stage_input_BITS_87_TO_76__q17[11]}},
	       stage1_rg_stage_input_BITS_87_TO_76__q17 } ;
  assign SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1737 =
	     { {9{offset__h18610[11]}}, offset__h18610 } ;
  assign SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1762 =
	     { {4{offset__h19241[8]}}, offset__h19241 } ;
  assign _0_OR_stage1_rg_stage_input_32_BITS_104_TO_98_3_ETC___d2484 =
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d893 ||
	     (stage1_rg_stage_input[104:98] == 7'h60 ||
	      stage1_rg_stage_input[104:98] == 7'h68) &&
	     (stage1_rg_stage_input[134:130] == 5'b00010 ||
	      stage1_rg_stage_input[134:130] == 5'b00011) ||
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d935 ||
	     stage1_rg_stage_input[104:98] == 7'h69 &&
	     stage1_rg_stage_input[134:130] == 5'b00001 ;
  assign _theResult_____1_fst__h12535 =
	     (stage1_rg_stage_input[112:110] == 3'd0 &&
	      stage1_rg_stage_input[151:145] == 7'b0110011 &&
	      stage1_rg_stage_input[262]) ?
	       rd_val___1__h12531 :
	       _theResult_____1_fst__h12542 ;
  assign _theResult_____1_fst__h12570 =
	     rs1_val_bypassed__h5597 & _theResult___snd_snd__h16701 ;
  assign _theResult____h33877 =
	     (delta_CPI_instrs__h33876 == 64'd0) ?
	       delta_CPI_instrs___1__h33921 :
	       delta_CPI_instrs__h33876 ;
  assign _theResult____h5881 = x_out_data_to_stage1_instr__h17651 ;
  assign _theResult___fst__h12706 =
	     (stage1_rg_stage_input[112:110] == 3'b001 &&
	      !stage1_rg_stage_input[263] &&
	      stage1_rg_stage_input[261:257] == 5'b0 &&
	      !stage1_rg_stage_input[262]) ?
	       rd_val___1__h16761 :
	       _theResult___fst__h12713 ;
  assign _theResult___fst__h12713 =
	     stage1_rg_stage_input[262] ?
	       rd_val___1__h16822 :
	       rd_val___1__h16793 ;
  assign _theResult___fst__h12794 =
	     { {32{rs1_val_bypassed597_BITS_31_TO_0_SRL_rs2_val_b_ETC__q8[31]}},
	       rs1_val_bypassed597_BITS_31_TO_0_SRL_rs2_val_b_ETC__q8 } ;
  assign _theResult___snd_fst_rd_val__h9435 =
	     stage2_rg_stage2[5] ?
	       stage2_fbox$word_fst :
	       stage2_rg_stage2[197:134] ;
  assign _theResult___snd_snd__h16701 =
	     (stage1_rg_stage_input[151:145] == 7'b0010011) ?
	       SEXT_stage1_rg_stage_input_32_BITS_87_TO_76_047___d1259 :
	       rs2_val_bypassed__h5603 ;
  assign _theResult___snd_snd_rd_val__h8290 =
	     stage2_rg_stage2[5] ?
	       stage2_rg_stage2[325:262] :
	       stage2_fbox$word_fst ;
  assign addr_of_b32___1__h27521 = addr_of_b32__h27393 + 64'd4 ;
  assign addr_of_b32___1__h32461 = addr_of_b32__h32333 + 64'd4 ;
  assign addr_of_b32___1__h44012 = addr_of_b32__h43884 + 64'd4 ;
  assign addr_of_b32__h27393 = { soc_map$m_pc_reset_value[63:2], 2'd0 } ;
  assign addr_of_b32__h32333 =
	     { stageF_branch_predictor$predict_rsp[63:2], 2'd0 } ;
  assign addr_of_b32__h43884 = { rg_next_pc[63:2], 2'd0 } ;
  assign alu_outputs___1_addr__h10323 =
	     IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d432 ?
	       branch_target__h10301 :
	       x_out_cf_info_fallthru_PC__h16274 ;
  assign alu_outputs___1_addr__h10697 =
	     rs1_val_bypassed__h5597 +
	     { {52{stage1_rg_stage_input_BITS_75_TO_64__q6[11]}},
	       stage1_rg_stage_input_BITS_75_TO_64__q6 } ;
  assign alu_outputs___1_exc_code__h10979 =
	     (stage1_rg_stage_input[112:110] == 3'd0) ?
	       (stage1_rg_stage_input_32_BITS_144_TO_140_027_E_ETC___d1065 ?
		  4'd2 :
		  ((stage1_rg_stage_input[144:140] == 5'd0 &&
		    stage1_rg_stage_input[139:135] == 5'd0) ?
		     CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q16 :
		     4'd2)) :
	       4'd2 ;
  assign alu_outputs___1_fval1__h11709 = x_out_data_to_stage2_fval1__h10123 ;
  assign alu_outputs___1_fval2__h10701 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1555 &&
	      IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d344) ?
	       x_out_fbypass_rd_val__h9454 :
	       rd_val__h9781 ;
  assign alu_outputs___1_fval3__h11711 = x_out_data_to_stage2_fval3__h10125 ;
  assign alu_outputs___1_val1__h10496 =
	     (stage1_rg_stage_input[112:110] == 3'b001) ?
	       rd_val__h16602 :
	       (stage1_rg_stage_input[262] ?
		  rd_val__h16675 :
		  rd_val__h16653) ;
  assign alu_outputs___1_val1__h10541 =
	     (stage1_rg_stage_input[112:110] == 3'd0 &&
	      (stage1_rg_stage_input[151:145] != 7'b0110011 ||
	       !stage1_rg_stage_input[262])) ?
	       rd_val___1__h12450 :
	       _theResult_____1_fst__h12535 ;
  assign alu_outputs___1_val1__h10570 =
	     (stage1_rg_stage_input[112:110] == 3'd0) ?
	       rd_val___1__h16730 :
	       _theResult___fst__h12706 ;
  assign alu_outputs___1_val1__h10983 =
	     stage1_rg_stage_input[112] ?
	       { 59'd0, stage1_rg_stage_input[139:135] } :
	       rs1_val_bypassed__h5597 ;
  assign alu_outputs___1_val1__h11011 =
	     { 57'd0, stage1_rg_stage_input[104:98] } ;
  assign alu_outputs_cf_info_taken_PC__h16267 =
	     x_out_cf_info_taken_PC__h16275 ;
  assign branch_target__h10301 =
	     stage1_rg_stage_input[401:338] +
	     { {51{stage1_rg_stage_input_BITS_63_TO_51__q2[12]}},
	       stage1_rg_stage_input_BITS_63_TO_51__q2 } ;
  assign cpi__h33879 = x__h33878 / 64'd10 ;
  assign cpifrac__h33880 = x__h33878 % 64'd10 ;
  assign csr_regfile_RDY_server_reset_request_put__219__ETC___d2231 =
	     csr_regfile$RDY_server_reset_request_put &&
	     f_reset_reqs$EMPTY_N &&
	     stageF_f_reset_reqs$FULL_N &&
	     stageD_f_reset_reqs$FULL_N &&
	     stage1_f_reset_reqs$FULL_N &&
	     stage2_f_reset_reqs$FULL_N &&
	     stage3_f_reset_reqs$FULL_N ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2685 =
	     (csr_regfile$interrupt_pending[4] || csr_regfile$nmi_pending) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     (IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 =
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2685 ||
	     stage2_rg_stage2[397:395] != 3'd0 &&
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2686 &&
	     stage2_rg_full ||
	     !stage1_rg_full ||
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2295 ||
	     !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	     IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1657 ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2735 =
	     (csr_regfile$interrupt_pending[4] || csr_regfile$nmi_pending) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     (IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) ||
	     stage2_rg_stage2[397:395] != 3'd0 &&
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2686 &&
	     stage2_rg_full ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2739 =
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2735 ||
	     !stage1_rg_full ||
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2295 ||
	     !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	     IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1657 ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2953 =
	     (csr_regfile$interrupt_pending[4] || csr_regfile$nmi_pending) &&
	     rg_state == 4'd3 &&
	     NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2950 &&
	     !stage2_rg_full &&
	     !stage3_rg_full ;
  assign csr_regfile_read_csr_mcycle__7_MINUS_rg_start__ETC___d2801 =
	     delta_CPI_cycles__h33875 * 64'd10 ;
  assign csr_regfile_read_misa__6_BIT_2_672_AND_stageD__ETC___d1747 =
	     csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	     stageD_rg_data[79:76] == 4'b1000 &&
	     stageD_rg_data[75:71] != 5'd0 ;
  assign csr_regfile_read_misa__6_BIT_2_672_AND_stageD__ETC___d1753 =
	     csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	     stageD_rg_data[79:76] == 4'b1001 &&
	     stageD_rg_data[75:71] != 5'd0 ;
  assign csr_regfile_read_mstatus__9_BITS_14_TO_13_1_EQ_ETC___d573 =
	     csr_regfile$read_mstatus[14:13] == 2'h0 ||
	     ((stage1_rg_stage_input[112:110] == 3'b111) ?
		csr_regfile$read_frm == 3'b101 ||
		csr_regfile$read_frm == 3'b110 ||
		csr_regfile$read_frm == 3'b111 :
		stage1_rg_stage_input[112:110] == 3'b101 ||
		stage1_rg_stage_input[112:110] == 3'b110) ;
  assign cur_verbosity__h3946 =
	     (csr_regfile$read_csr_minstret < cfg_logdelay) ?
	       4'd0 :
	       cfg_verbosity ;
  assign d_instr__h25360 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2072 ?
	       instr_out___1__h25362 :
	       IF_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg_p_ETC___d2090 ;
  assign data_to_stage2_addr__h10103 = x_out_data_to_stage2_addr__h10120 ;
  assign data_to_stage2_val2__h10105 = x_out_data_to_stage2_val2__h10122 ;
  assign decoded_instr_funct10__h30753 =
	     { _theResult____h5881[31:25], _theResult____h5881[14:12] } ;
  assign decoded_instr_imm12_S__h30755 =
	     { _theResult____h5881[31:25], _theResult____h5881[11:7] } ;
  assign decoded_instr_imm13_SB__h30756 =
	     { _theResult____h5881[31],
	       _theResult____h5881[7],
	       _theResult____h5881[30:25],
	       _theResult____h5881[11:8],
	       1'b0 } ;
  assign decoded_instr_imm21_UJ__h30758 =
	     { _theResult____h5881[31],
	       _theResult____h5881[19:12],
	       _theResult____h5881[20],
	       _theResult____h5881[30:21],
	       1'b0 } ;
  assign delta_CPI_cycles__h33875 =
	     csr_regfile$read_csr_mcycle - rg_start_CPI_cycles ;
  assign delta_CPI_instrs___1__h33921 = delta_CPI_instrs__h33876 + 64'd1 ;
  assign delta_CPI_instrs__h33876 =
	     csr_regfile$read_csr_minstret - rg_start_CPI_instrs ;
  assign fall_through_pc__h9846 =
	     stage1_rg_stage_input[401:338] +
	     (stage1_rg_stage_input[333] ? 64'd4 : 64'd2) ;
  assign imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d2109 =
	     imem_rg_pc[1:0] == 2'b0 ||
	     (!imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[17:16] == 2'b11) &&
	     (!imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d2064 ||
	      imem_rg_cache_b16[1:0] == 2'b11) ;
  assign imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2251 =
	     imem_rg_pc[1:0] == 2'b0 || !near_mem$imem_valid ||
	     near_mem$imem_exc ||
	     !imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ;
  assign imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d2064 =
	     imem_rg_pc[63:2] == imem_rg_cache_addr[63:2] ;
  assign imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 =
	     imem_rg_pc[63:2] == near_mem$imem_pc[63:2] ;
  assign imm12__h17903 = { 4'd0, offset__h17775 } ;
  assign imm12__h18240 = { 5'd0, offset__h18182 } ;
  assign imm12__h19876 = { {6{imm6__h19874[5]}}, imm6__h19874 } ;
  assign imm12__h20545 = { {2{nzimm10__h20543[9]}}, nzimm10__h20543 } ;
  assign imm12__h20760 = { 2'd0, nzimm10__h20758 } ;
  assign imm12__h20956 = { 6'b0, imm6__h19874 } ;
  assign imm12__h21293 = { 6'b010000, imm6__h19874 } ;
  assign imm12__h22914 = { 3'd0, offset__h22828 } ;
  assign imm12__h23266 = { 4'd0, offset__h23200 } ;
  assign imm20__h20004 = { {14{imm6__h19874[5]}}, imm6__h19874 } ;
  assign imm6__h19874 = { stageD_rg_data[76], stageD_rg_data[70:66] } ;
  assign instr___1__h17725 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      stageD_rg_data[79:77] == 3'b010) ?
	       instr__h17902 :
	       IF_csr_regfile_read_misa__6_BIT_2_672_AND_stag_ETC___d1964 ;
  assign instr__h17902 =
	     { imm12__h17903, 8'd18, stageD_rg_data[75:71], 7'b0000011 } ;
  assign instr__h18047 =
	     { 4'd0,
	       stageD_rg_data[72:71],
	       stageD_rg_data[76],
	       stageD_rg_data[70:66],
	       8'd18,
	       offset_BITS_4_TO_0___h18171,
	       7'b0100011 } ;
  assign instr__h18239 =
	     { imm12__h18240, rs1__h18241, 3'b010, rd__h18242, 7'b0000011 } ;
  assign instr__h18434 =
	     { 5'd0,
	       stageD_rg_data[69],
	       stageD_rg_data[76],
	       rd__h18242,
	       rs1__h18241,
	       3'b010,
	       offset_BITS_4_TO_0___h18602,
	       7'b0100011 } ;
  assign instr__h18663 =
	     { SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1737[20],
	       SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1737[10:1],
	       SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1737[11],
	       SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1737[19:12],
	       12'd111 } ;
  assign instr__h19116 = { 12'd0, stageD_rg_data[75:71], 15'd103 } ;
  assign instr__h19232 = { 12'd0, stageD_rg_data[75:71], 15'd231 } ;
  assign instr__h19297 =
	     { SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1762[12],
	       SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1762[10:5],
	       5'd0,
	       rs1__h18241,
	       3'b0,
	       SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1762[4:1],
	       SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1762[11],
	       7'b1100011 } ;
  assign instr__h19614 =
	     { SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1762[12],
	       SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1762[10:5],
	       5'd0,
	       rs1__h18241,
	       3'b001,
	       SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1762[4:1],
	       SEXT_stageD_rg_data_667_BIT_76_684_CONCAT_stag_ETC___d1762[11],
	       7'b1100011 } ;
  assign instr__h19952 =
	     { imm12__h19876, 8'd0, stageD_rg_data[75:71], 7'b0010011 } ;
  assign instr__h20136 =
	     { imm20__h20004, stageD_rg_data[75:71], 7'b0110111 } ;
  assign instr__h20265 =
	     { imm12__h19876,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0010011 } ;
  assign instr__h20492 =
	     { imm12__h19876,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0011011 } ;
  assign instr__h20747 =
	     { imm12__h20545,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0010011 } ;
  assign instr__h20919 = { imm12__h20760, 8'd16, rd__h18242, 7'b0010011 } ;
  assign instr__h21088 =
	     { imm12__h20956,
	       stageD_rg_data[75:71],
	       3'b001,
	       stageD_rg_data[75:71],
	       7'b0010011 } ;
  assign instr__h21277 =
	     { imm12__h20956, rs1__h18241, 3'b101, rs1__h18241, 7'b0010011 } ;
  assign instr__h21466 =
	     { imm12__h21293, rs1__h18241, 3'b101, rs1__h18241, 7'b0010011 } ;
  assign instr__h21583 =
	     { imm12__h19876, rs1__h18241, 3'b111, rs1__h18241, 7'b0010011 } ;
  assign instr__h21761 =
	     { 7'b0,
	       stageD_rg_data[70:66],
	       8'd0,
	       stageD_rg_data[75:71],
	       7'b0110011 } ;
  assign instr__h21880 =
	     { 7'b0,
	       stageD_rg_data[70:66],
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0110011 } ;
  assign instr__h21975 =
	     { 7'b0,
	       rd__h18242,
	       rs1__h18241,
	       3'b111,
	       rs1__h18241,
	       7'b0110011 } ;
  assign instr__h22111 =
	     { 7'b0,
	       rd__h18242,
	       rs1__h18241,
	       3'b110,
	       rs1__h18241,
	       7'b0110011 } ;
  assign instr__h22247 =
	     { 7'b0,
	       rd__h18242,
	       rs1__h18241,
	       3'b100,
	       rs1__h18241,
	       7'b0110011 } ;
  assign instr__h22383 =
	     { 7'b0100000,
	       rd__h18242,
	       rs1__h18241,
	       3'b0,
	       rs1__h18241,
	       7'b0110011 } ;
  assign instr__h22521 =
	     { 7'b0,
	       rd__h18242,
	       rs1__h18241,
	       3'b0,
	       rs1__h18241,
	       7'b0111011 } ;
  assign instr__h22659 =
	     { 7'b0100000,
	       rd__h18242,
	       rs1__h18241,
	       3'b0,
	       rs1__h18241,
	       7'b0111011 } ;
  assign instr__h22817 =
	     { 12'b000000000001,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b1110011 } ;
  assign instr__h22913 =
	     { imm12__h22914, 8'd19, stageD_rg_data[75:71], 7'b0000011 } ;
  assign instr__h23066 =
	     { 3'd0,
	       stageD_rg_data[73:71],
	       stageD_rg_data[76],
	       stageD_rg_data[70:66],
	       8'd19,
	       offset_BITS_4_TO_0___h23541,
	       7'b0100011 } ;
  assign instr__h23265 =
	     { imm12__h23266, rs1__h18241, 3'b011, rd__h18242, 7'b0000011 } ;
  assign instr__h23416 =
	     { 4'd0,
	       stageD_rg_data[70:69],
	       stageD_rg_data[76],
	       rd__h18242,
	       rs1__h18241,
	       3'b011,
	       offset_BITS_4_TO_0___h23541,
	       7'b0100011 } ;
  assign instr__h23621 =
	     { imm12__h17903, 8'd18, stageD_rg_data[75:71], 7'b0000111 } ;
  assign instr__h24421 =
	     { imm12__h22914, 8'd19, stageD_rg_data[75:71], 7'b0000111 } ;
  assign instr__h24586 =
	     { 3'd0,
	       stageD_rg_data[73:71],
	       stageD_rg_data[76],
	       stageD_rg_data[70:66],
	       8'd19,
	       offset_BITS_4_TO_0___h23541,
	       7'b0100111 } ;
  assign instr__h24785 =
	     { imm12__h23266, rs1__h18241, 3'b011, rd__h18242, 7'b0000111 } ;
  assign instr__h24936 =
	     { 4'd0,
	       stageD_rg_data[70:69],
	       stageD_rg_data[76],
	       rd__h18242,
	       rs1__h18241,
	       3'b011,
	       offset_BITS_4_TO_0___h23541,
	       7'b0100111 } ;
  assign instr_out___1__h25362 =
	     { near_mem$imem_instr[15:0], imem_rg_cache_b16 } ;
  assign instr_out___1__h25384 = { 16'b0, near_mem$imem_instr[15:0] } ;
  assign near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2117 =
	     near_mem$imem_exc ||
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2072 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	     near_mem$imem_instr[1:0] == 2'b11 ;
  assign near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119 =
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2117 ||
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2086 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	     near_mem$imem_instr[1:0] != 2'b11 ;
  assign near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_066___d2067 =
	     near_mem$imem_pc == imem_rg_pc + 64'd2 ;
  assign near_mem_imem_valid_AND_near_mem_imem_exc__1_A_ETC___d2214 =
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
  assign new_epoch__h26813 = rg_epoch + 2'd1 ;
  assign next_pc___1__h13967 = stage1_rg_stage_input[401:338] + 64'd2 ;
  assign next_pc__h10336 =
	     stage1_rg_stage_input[401:338] +
	     { {43{stage1_rg_stage_input_BITS_30_TO_10__q1[20]}},
	       stage1_rg_stage_input_BITS_30_TO_10__q1 } ;
  assign next_pc__h10371 =
	     { IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d1260[63:1],
	       1'd0 } ;
  assign next_pc__h13964 = stage1_rg_stage_input[401:338] + 64'd4 ;
  assign next_pc__h9847 = x_out_next_pc__h9864 ;
  assign nzimm10__h20543 =
	     { stageD_rg_data[76],
	       stageD_rg_data[68:67],
	       stageD_rg_data[69],
	       stageD_rg_data[66],
	       stageD_rg_data[70],
	       4'b0 } ;
  assign nzimm10__h20758 =
	     { stageD_rg_data[74:71],
	       stageD_rg_data[76:75],
	       stageD_rg_data[69],
	       stageD_rg_data[70],
	       2'b0 } ;
  assign offset_BITS_4_TO_0___h18171 = { stageD_rg_data[75:73], 2'b0 } ;
  assign offset_BITS_4_TO_0___h18602 =
	     { stageD_rg_data[75:74], stageD_rg_data[70], 2'b0 } ;
  assign offset_BITS_4_TO_0___h23541 = { stageD_rg_data[75:74], 3'b0 } ;
  assign offset__h17775 =
	     { stageD_rg_data[67:66],
	       stageD_rg_data[76],
	       stageD_rg_data[70:68],
	       2'b0 } ;
  assign offset__h18182 =
	     { stageD_rg_data[69],
	       stageD_rg_data[76:74],
	       stageD_rg_data[70],
	       2'b0 } ;
  assign offset__h18610 =
	     { stageD_rg_data[76],
	       stageD_rg_data[72],
	       stageD_rg_data[74:73],
	       stageD_rg_data[70],
	       stageD_rg_data[71],
	       stageD_rg_data[66],
	       stageD_rg_data[75],
	       stageD_rg_data[69:67],
	       1'b0 } ;
  assign offset__h19241 =
	     { stageD_rg_data[76],
	       stageD_rg_data[70:69],
	       stageD_rg_data[66],
	       stageD_rg_data[75:74],
	       stageD_rg_data[68:67],
	       1'b0 } ;
  assign offset__h22828 =
	     { stageD_rg_data[68:66],
	       stageD_rg_data[76],
	       stageD_rg_data[70:69],
	       3'b0 } ;
  assign offset__h23200 =
	     { stageD_rg_data[70:69], stageD_rg_data[76:74], 3'b0 } ;
  assign output_stage2___1_data_to_stage3_frd_val__h8219 =
	     stage2_rg_stage2[5] ?
	       ((stage2_rg_stage2[412:410] == 3'b010) ?
		  { 32'hFFFFFFFF, near_mem$dmem_word64[31:0] } :
		  near_mem$dmem_word64) :
	       stage2_rg_stage2[197:134] ;
  assign rd__h18242 = { 2'b01, stageD_rg_data[68:66] } ;
  assign rd_val___1__h12450 =
	     rs1_val_bypassed__h5597 + _theResult___snd_snd__h16701 ;
  assign rd_val___1__h12531 =
	     rs1_val_bypassed__h5597 - _theResult___snd_snd__h16701 ;
  assign rd_val___1__h12538 =
	     ((rs1_val_bypassed__h5597 ^ 64'h8000000000000000) <
	      (_theResult___snd_snd__h16701 ^ 64'h8000000000000000)) ?
	       64'd1 :
	       64'd0 ;
  assign rd_val___1__h12545 =
	     (rs1_val_bypassed__h5597 < _theResult___snd_snd__h16701) ?
	       64'd1 :
	       64'd0 ;
  assign rd_val___1__h12552 =
	     rs1_val_bypassed__h5597 ^ _theResult___snd_snd__h16701 ;
  assign rd_val___1__h12559 =
	     rs1_val_bypassed__h5597 | _theResult___snd_snd__h16701 ;
  assign rd_val___1__h16730 =
	     { {32{IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC__q18[31]}},
	       IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC__q18 } ;
  assign rd_val___1__h16761 = { {32{x__h16764[31]}}, x__h16764 } ;
  assign rd_val___1__h16793 = { {32{x__h16796[31]}}, x__h16796 } ;
  assign rd_val___1__h16822 = { {32{tmp__h16821[31]}}, tmp__h16821 } ;
  assign rd_val___1__h16874 =
	     { {32{rs1_val_bypassed597_BITS_31_TO_0_PLUS_rs2_val__ETC__q9[31]}},
	       rs1_val_bypassed597_BITS_31_TO_0_PLUS_rs2_val__ETC__q9 } ;
  assign rd_val___1__h16922 =
	     { {32{rs1_val_bypassed597_BITS_31_TO_0_MINUS_rs2_val_ETC__q10[31]}},
	       rs1_val_bypassed597_BITS_31_TO_0_MINUS_rs2_val_ETC__q10 } ;
  assign rd_val___1__h16928 = { {32{x__h16931[31]}}, x__h16931 } ;
  assign rd_val___1__h16973 = { {32{x__h16976[31]}}, x__h16976 } ;
  assign rd_val__h10612 = { {32{v32__h10610[31]}}, v32__h10610 } ;
  assign rd_val__h10633 = stage1_rg_stage_input[401:338] + rd_val__h10612 ;
  assign rd_val__h16602 = rs1_val_bypassed__h5597 << shamt__h10483 ;
  assign rd_val__h16653 = rs1_val_bypassed__h5597 >> shamt__h10483 ;
  assign rd_val__h16675 =
	     rs1_val_bypassed__h5597 >> shamt__h10483 |
	     ~(64'hFFFFFFFFFFFFFFFF >> shamt__h10483) &
	     {64{rs1_val_bypassed__h5597[63]}} ;
  assign rd_val__h9684 =
	     (!stage3_rg_stage3[69] && stage3_rg_full &&
	      stage3_rg_stage3[140] &&
	      stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d407) ?
	       stage3_rg_stage3[134:71] :
	       gpr_regfile$read_rs1 ;
  assign rd_val__h9717 =
	     (!stage3_rg_stage3[69] && stage3_rg_full &&
	      stage3_rg_stage3[140] &&
	      stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d415) ?
	       stage3_rg_stage3[134:71] :
	       gpr_regfile$read_rs2 ;
  assign rd_val__h9750 =
	     (stage3_rg_stage3[69] && stage3_rg_full &&
	      stage3_rg_stage3[140] &&
	      stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d407) ?
	       stage3_rg_stage3[63:0] :
	       fpr_regfile$read_rs1 ;
  assign rd_val__h9781 =
	     (stage3_rg_stage3[69] && stage3_rg_full &&
	      stage3_rg_stage3[140] &&
	      stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d415) ?
	       stage3_rg_stage3[63:0] :
	       fpr_regfile$read_rs2 ;
  assign rd_val__h9815 =
	     (stage3_rg_stage3[69] && stage3_rg_full &&
	      stage3_rg_stage3[140] &&
	      stage3_rg_stage3[139:135] == stage1_rg_stage_input[129:125]) ?
	       stage3_rg_stage3[63:0] :
	       fpr_regfile$read_rs3 ;
  assign rg_cur_priv_8_EQ_0b11_059_OR_rg_cur_priv_8_EQ__ETC___d1124 =
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[21] ||
	      rg_cur_priv == 2'b0 && csr_regfile$read_misa[13]) &&
	     stage1_rg_stage_input[87:76] == 12'b000100000101 ;
  assign rg_cur_priv_8_EQ_0b11_059_OR_rg_cur_priv_8_EQ__ETC___d1189 =
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[20]) &&
	     stage1_rg_stage_input[104:98] == 7'b0001001 ||
	     stage1_rg_stage_input[144:140] != 5'd0 ||
	     stage1_rg_stage_input[139:135] != 5'd0 ||
	     rg_cur_priv != 2'b11 &&
	     (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[22]) ||
	     stage1_rg_stage_input[87:76] != 12'b000100000010 ;
  assign rg_cur_priv_8_EQ_0b11_059_OR_rg_cur_priv_8_EQ__ETC___d1203 =
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[20]) &&
	     stage1_rg_stage_input[104:98] == 7'b0001001 ||
	     stage1_rg_stage_input[144:140] != 5'd0 ||
	     stage1_rg_stage_input[139:135] != 5'd0 ||
	     NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d1201 ;
  assign rg_cur_priv_8_EQ_0b11_059_OR_rg_cur_priv_8_EQ__ETC___d1635 =
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[20]) &&
	     stage1_rg_stage_input[104:98] == 7'b0001001 ||
	     stage1_rg_stage_input[144:140] != 5'd0 ||
	     stage1_rg_stage_input[139:135] != 5'd0 ||
	     stage1_rg_stage_input[87:76] != 12'b0 &&
	     stage1_rg_stage_input[87:76] != 12'b000000000001 ;
  assign rg_state_7_EQ_12_4_AND_csr_regfile_wfi_resume__ETC___d2937 =
	     rg_state == 4'd12 && csr_regfile$wfi_resume &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119) ;
  assign rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2753 =
	     rg_state == 4'd3 &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2750 &&
	     !stage3_rg_full &&
	     !stage2_rg_full ;
  assign rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2779 =
	     rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2753 &&
	     stage1_rg_full &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2343 &&
	     (stage1_rg_stage_input[332] ||
	      ((stage1_rg_stage_input[151:145] == 7'b1100011) ?
		 stage1_rg_stage_input[112:110] != 3'd0 &&
		 stage1_rg_stage_input[112:110] != 3'b001 &&
		 stage1_rg_stage_input[112:110] != 3'b100 &&
		 stage1_rg_stage_input[112:110] != 3'b101 &&
		 stage1_rg_stage_input[112:110] != 3'b110 &&
		 stage1_rg_stage_input[112:110] != 3'b111 :
		 stage1_rg_stage_input[151:145] != 7'b1101111 &&
		 ((stage1_rg_stage_input[151:145] == 7'b1100111) ?
		    stage1_rg_stage_input[112:110] != 3'd0 :
		    NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d2774))) ;
  assign rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2814 =
	     rg_state == 4'd3 &&
	     (!csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) ;
  assign rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2817 =
	     rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2814 &&
	     !stage3_rg_full &&
	     !stage2_rg_full &&
	     stage1_rg_full &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2343 ;
  assign rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2908 =
	     rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2817 &&
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b0001111 &&
	     stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1049 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119) ;
  assign rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2917 =
	     rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2817 &&
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b0001111 &&
	     stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1035 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119) ;
  assign rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2926 =
	     rg_state_7_EQ_3_326_AND_NOT_csr_regfile_interr_ETC___d2817 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1068 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119) ;
  assign rg_state_7_EQ_3_326_AND_stage3_rg_full_8_OR_st_ETC___d2338 =
	     rg_state == 4'd3 &&
	     (stage3_rg_full || stage2_rg_full || stage1_rg_full ||
	      stageD_rg_full ||
	      stageF_rg_full) &&
	     stage3_rg_full_8_OR_NOT_stage2_rg_full_14_71_O_ETC___d2337 ;
  assign rg_state_7_EQ_5_941_AND_NOT_stageF_rg_full_094_ETC___d2942 =
	     rg_state == 4'd5 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119) ;
  assign rg_state_7_EQ_8_864_AND_NOT_stageF_rg_full_094_ETC___d2865 =
	     rg_state == 4'd8 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119) ;
  assign rg_trap_info_787_BITS_131_TO_68_788_EQ_csr_reg_ETC___d2797 =
	     rg_trap_info[131:68] == csr_regfile$csr_trap_actions[193:130] ;
  assign rm__h10284 =
	     (stage1_rg_stage_input[112:110] == 3'b111) ?
	       csr_regfile$read_frm :
	       stage1_rg_stage_input[112:110] ;
  assign rs1__h18241 = { 2'b01, stageD_rg_data[73:71] } ;
  assign rs1_val__h34495 =
	     (rg_trap_instr[14:12] == 3'b001) ?
	       rg_csr_val1 :
	       { 59'd0, rg_trap_instr[19:15] } ;
  assign rs1_val_bypassed597_BITS_31_TO_0_MINUS_rs2_val_ETC__q10 =
	     rs1_val_bypassed__h5597[31:0] - rs2_val_bypassed__h5603[31:0] ;
  assign rs1_val_bypassed597_BITS_31_TO_0_PLUS_rs2_val__ETC__q9 =
	     rs1_val_bypassed__h5597[31:0] + rs2_val_bypassed__h5603[31:0] ;
  assign rs1_val_bypassed597_BITS_31_TO_0_SRL_rs2_val_b_ETC__q8 =
	     rs1_val_bypassed__h5597[31:0] >> rs2_val_bypassed__h5603[4:0] |
	     ~(32'hFFFFFFFF >> rs2_val_bypassed__h5603[4:0]) &
	     {32{rs1_val_bypassed597_BITS_31_TO_0__q7[31]}} ;
  assign rs1_val_bypassed597_BITS_31_TO_0__q7 =
	     rs1_val_bypassed__h5597[31:0] ;
  assign rs1_val_bypassed__h5597 =
	     (stage1_rg_stage_input[139:135] == 5'd0) ? 64'd0 : val__h9686 ;
  assign rs2_val_bypassed__h5603 =
	     (stage1_rg_stage_input[134:130] == 5'd0) ? 64'd0 : val__h9719 ;
  assign shamt__h10483 =
	     (stage1_rg_stage_input[151:145] == 7'b0010011) ?
	       stage1_rg_stage_input[81:76] :
	       rs2_val_bypassed__h5603[5:0] ;
  assign stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1317 =
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     (stage1_rg_stage_input[151:145] == 7'b0000011 ||
	      stage1_rg_stage_input[151:145] == 7'b0000111) ;
  assign stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1375 =
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     stage1_rg_stage_input[151:145] == 7'b0101111 ;
  assign stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1401 =
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d1398 ;
  assign stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d990 =
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     !stage1_rg_stage_input[332] &&
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ;
  assign stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d998 =
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d995 ;
  assign stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363 =
	     stage1_rg_full &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349) ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d2427 =
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d869 ||
	     stage1_rg_stage_input[104:98] == 7'h14 && rm__h10284 == 3'b001 ||
	     stage1_rg_stage_input[104:98] == 7'h68 &&
	     stage1_rg_stage_input[134:130] == 5'd0 ||
	     stage1_rg_stage_input[104:98] == 7'h68 &&
	     stage1_rg_stage_input[134:130] == 5'b00001 ||
	     stage1_rg_stage_input[104:98] == 7'h78 &&
	     stage1_rg_stage_input[134:130] == 5'd0 &&
	     rm__h10284 == 3'b0 ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d869 =
	     stage1_rg_stage_input[104:98] == 7'h0 ||
	     stage1_rg_stage_input[104:98] == 7'h04 ||
	     stage1_rg_stage_input[104:98] == 7'h08 ||
	     stage1_rg_stage_input[104:98] == 7'h0C ||
	     stage1_rg_stage_input[104:98] == 7'h2C &&
	     stage1_rg_stage_input[134:130] == 5'd0 ||
	     stage1_rg_stage_input[104:98] == 7'h10 && rm__h10284 == 3'b0 ||
	     stage1_rg_stage_input[104:98] == 7'h10 &&
	     (rm__h10284 == 3'b001 || rm__h10284 == 3'b010) ||
	     stage1_rg_stage_input[104:98] == 7'h14 && rm__h10284 == 3'b0 ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d878 =
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d869 ||
	     stage1_rg_stage_input[104:98] == 7'h14 && rm__h10284 == 3'b001 ||
	     stage1_rg_stage_input[104:98] == 7'h60 &&
	     stage1_rg_stage_input[134:130] == 5'd0 ||
	     stage1_rg_stage_input[104:98] == 7'h60 &&
	     stage1_rg_stage_input[134:130] == 5'b00001 ||
	     stage1_rg_stage_input[104:98] == 7'h70 &&
	     stage1_rg_stage_input[134:130] == 5'd0 &&
	     rm__h10284 == 3'b0 ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d886 =
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d878 ||
	     stage1_rg_stage_input[104:98] == 7'h50 &&
	     (rm__h10284 == 3'b010 || rm__h10284 == 3'b001 ||
	      rm__h10284 == 3'b0) ||
	     stage1_rg_stage_input[104:98] == 7'h70 &&
	     stage1_rg_stage_input[134:130] == 5'd0 &&
	     rm__h10284 == 3'b001 ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d893 =
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d886 ||
	     stage1_rg_stage_input[104:98] == 7'h68 &&
	     (stage1_rg_stage_input[134:130] == 5'd0 ||
	      stage1_rg_stage_input[134:130] == 5'b00001) ||
	     stage1_rg_stage_input[104:98] == 7'h78 &&
	     stage1_rg_stage_input[134:130] == 5'd0 &&
	     rm__h10284 == 3'b0 ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d918 =
	     stage1_rg_stage_input[104:98] == 7'b0000001 ||
	     stage1_rg_stage_input[104:98] == 7'h05 ||
	     stage1_rg_stage_input[104:98] == 7'b0001001 ||
	     stage1_rg_stage_input[104:98] == 7'h0D ||
	     stage1_rg_stage_input[104:98] == 7'h2D &&
	     stage1_rg_stage_input[134:130] == 5'd0 ||
	     stage1_rg_stage_input[104:98] == 7'h11 && rm__h10284 == 3'b0 ||
	     stage1_rg_stage_input[104:98] == 7'h11 &&
	     (rm__h10284 == 3'b001 || rm__h10284 == 3'b010) ||
	     stage1_rg_stage_input[104:98] == 7'h15 && rm__h10284 == 3'b0 ||
	     stage1_rg_stage_input[104:98] == 7'h15 && rm__h10284 == 3'b001 ||
	     stage1_rg_stage_input[104:98] == 7'h20 &&
	     stage1_rg_stage_input[134:130] == 5'b00001 ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d929 =
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d918 ||
	     stage1_rg_stage_input[104:98] == 7'h21 &&
	     stage1_rg_stage_input[134:130] == 5'd0 ||
	     stage1_rg_stage_input[104:98] == 7'h51 && rm__h10284 == 3'b010 ||
	     stage1_rg_stage_input[104:98] == 7'h51 &&
	     (rm__h10284 == 3'b001 || rm__h10284 == 3'b0) ||
	     stage1_rg_stage_input[104:98] == 7'h71 &&
	     stage1_rg_stage_input[134:130] == 5'd0 &&
	     rm__h10284 == 3'b001 ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d935 =
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d929 ||
	     stage1_rg_stage_input[104:98] == 7'h61 &&
	     (stage1_rg_stage_input[134:130] == 5'd0 ||
	      stage1_rg_stage_input[134:130] == 5'b00001) ||
	     stage1_rg_stage_input[104:98] == 7'h69 &&
	     stage1_rg_stage_input[134:130] == 5'd0 ;
  assign stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1035 =
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     stage1_rg_stage_input[139:135] == 5'd0 &&
	     (stage1_rg_stage_input[263:260] == 4'b0 ||
	      stage1_rg_stage_input[263:260] == 4'b1000) ;
  assign stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1049 =
	     stage1_rg_stage_input[112:110] == 3'b001 &&
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     stage1_rg_stage_input[139:135] == 5'd0 &&
	     stage1_rg_stage_input[87:76] == 12'b0 ;
  assign stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d806 =
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     (stage1_rg_stage_input[151:145] != 7'b0110011 ||
	      !stage1_rg_stage_input[262]) ||
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     stage1_rg_stage_input[151:145] == 7'b0110011 &&
	     stage1_rg_stage_input[262] ||
	     CASE_stage1_rg_stage_input_BITS_112_TO_110_0b1_ETC__q13 ;
  assign stage1_rg_stage_input_32_BITS_144_TO_140_027_E_ETC___d1065 =
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[20]) &&
	     stage1_rg_stage_input[104:98] == 7'b0001001 ;
  assign stage1_rg_stage_input_32_BITS_144_TO_140_027_E_ETC___d1103 =
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     stage1_rg_stage_input[139:135] == 5'd0 &&
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[22]) &&
	     stage1_rg_stage_input[87:76] == 12'b000100000010 ;
  assign stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d1341 =
	     stage1_rg_stage_input[151:145] == 7'b0110011 &&
	     stage1_rg_stage_input[104:98] == 7'b0000001 ||
	     stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d794 ||
	     stage1_rg_stage_input[151:145] != 7'b0010011 &&
	     stage1_rg_stage_input[151:145] != 7'b0110011 &&
	     stage1_rg_stage_input[151:145] != 7'b0011011 &&
	     stage1_rg_stage_input[151:145] != 7'b0111011 &&
	     stage1_rg_stage_input[151:145] != 7'b0110111 &&
	     stage1_rg_stage_input[151:145] != 7'b0010111 ;
  assign stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d2892 =
	     stage1_rg_stage_input[151:145] == 7'b1110011 &&
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     (rg_cur_priv != 2'b11 &&
	      (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[20]) ||
	      stage1_rg_stage_input[104:98] != 7'b0001001) &&
	     stage1_rg_stage_input_32_BITS_144_TO_140_027_E_ETC___d1103 ;
  assign stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d794 =
	     stage1_rg_stage_input[151:145] == 7'b0111011 &&
	     stage1_rg_stage_input[104:98] == 7'b0000001 &&
	     stage1_rg_stage_input[112:110] != 3'b001 &&
	     stage1_rg_stage_input[112:110] != 3'b010 &&
	     stage1_rg_stage_input[112:110] != 3'b011 ;
  assign stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d962 =
	     stage1_rg_stage_input[151:145] == 7'b0110011 &&
	     stage1_rg_stage_input[104:98] == 7'b0000001 ||
	     stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d794 ||
	     (((stage1_rg_stage_input[151:145] == 7'b0010011 ||
		stage1_rg_stage_input[151:145] == 7'b0110011) &&
	       (stage1_rg_stage_input[112:110] == 3'b001 ||
		stage1_rg_stage_input[112:110] == 3'b101)) ?
		!stage1_rg_stage_input[263] &&
		stage1_rg_stage_input[261:258] == 4'b0 :
		IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d960) ;
  assign stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d1398 =
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1379 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1350 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1360 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1395 ;
  assign stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d1588 =
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     !stage1_rg_stage_input[332] &&
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ;
  assign stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2343 =
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     (stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763 &&
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775) ;
  assign stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2626 =
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_76_OR_NOT_stage1_rg_s_ETC___d2405 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1379 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1350 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1360 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1395 ;
  assign stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 =
	     stage1_rg_stage_input[335:334] == rg_epoch ;
  assign stage1_rg_stage_input_32_BITS_99_TO_98_74_EQ_0_ETC___d2440 =
	     (stage1_rg_stage_input[99:98] == 2'b0 ||
	      stage1_rg_stage_input[99:98] == 2'b01) &&
	     (stage1_rg_stage_input[151:145] == 7'b1000011 ||
	      stage1_rg_stage_input[151:145] == 7'b1000111 ||
	      stage1_rg_stage_input[151:145] == 7'b1001111 ||
	      stage1_rg_stage_input[151:145] == 7'b1001011) ||
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d2427 ||
	     stage1_rg_stage_input[104:98] == 7'h68 &&
	     (stage1_rg_stage_input[134:130] == 5'b00010 ||
	      stage1_rg_stage_input[134:130] == 5'b00011) ||
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d918 ||
	     stage1_rg_stage_input[104:98] == 7'h21 &&
	     stage1_rg_stage_input[134:130] == 5'd0 ||
	     stage1_rg_stage_input[104:98] == 7'h69 &&
	     stage1_rg_stage_input[134:130] == 5'd0 ||
	     stage1_rg_stage_input[104:98] == 7'h69 &&
	     stage1_rg_stage_input[134:130] == 5'b00001 ;
  assign stage1_rg_stage_input_32_BITS_99_TO_98_74_EQ_0_ETC___d938 =
	     (stage1_rg_stage_input[99:98] == 2'b0 ||
	      stage1_rg_stage_input[99:98] == 2'b01) &&
	     (stage1_rg_stage_input[151:145] == 7'b1000011 ||
	      stage1_rg_stage_input[151:145] == 7'b1000111 ||
	      stage1_rg_stage_input[151:145] == 7'b1001111 ||
	      stage1_rg_stage_input[151:145] == 7'b1001011) ||
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d893 ||
	     (stage1_rg_stage_input[104:98] == 7'h60 ||
	      stage1_rg_stage_input[104:98] == 7'h68) &&
	     (stage1_rg_stage_input[134:130] == 5'b00010 ||
	      stage1_rg_stage_input[134:130] == 5'b00011) ||
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d935 ||
	     stage1_rg_stage_input[104:98] == 7'h69 &&
	     stage1_rg_stage_input[134:130] == 5'b00001 ;
  assign stage1_rg_stage_input_32_BIT_332_77_OR_NOT_rg__ETC___d1096 =
	     stage1_rg_stage_input[332] ||
	     rg_cur_priv != 2'b11 &&
	     (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[20]) ||
	     stage1_rg_stage_input[104:98] != 7'b0001001 ;
  assign stage1_rg_stage_input_BITS_30_TO_10__q1 =
	     stage1_rg_stage_input[30:10] ;
  assign stage1_rg_stage_input_BITS_63_TO_51__q2 =
	     stage1_rg_stage_input[63:51] ;
  assign stage1_rg_stage_input_BITS_75_TO_64__q6 =
	     stage1_rg_stage_input[75:64] ;
  assign stage1_rg_stage_input_BITS_87_TO_76__q17 =
	     stage1_rg_stage_input[87:76] ;
  assign stage2_rg_full_14_AND_IF_stage2_rg_stage2_15_B_ETC___d2379 =
	     stage2_rg_full &&
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     stage2_rg_stage2[397:395] != 3'd0 &&
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d175 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1006 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1004 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1007 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1006 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1009 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1007 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1021 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1019 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1022 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1021 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1024 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1022 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1039 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b0001111 &&
	     stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1035 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1040 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1039 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1042 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1040 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1053 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b0001111 &&
	     stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1049 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1054 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1053 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1056 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1054 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1070 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1068 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1071 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1070 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1073 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1071 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1085 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1110011 &&
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     stage1_rg_stage_input[104:98] != 7'b0001001 &&
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     stage1_rg_stage_input[139:135] == 5'd0 &&
	     rg_cur_priv == 2'b11 &&
	     stage1_rg_stage_input[87:76] == 12'b001100000010 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1086 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1085 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1088 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1086 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1109 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input_32_BIT_332_77_OR_NOT_rg__ETC___d1096) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1110011 &&
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d1104 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1110 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1109 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1111 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1110 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1113 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1111 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1131 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input_32_BIT_332_77_OR_NOT_rg__ETC___d1096) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_83_AND_ETC___d1129 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1132 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1131 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1133 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1132 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1135 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1133 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1208 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      stage1_rg_stage_input[151:145] != 7'b1110011 ||
	      stage1_rg_stage_input[112:110] != 3'd0 ||
	      rg_cur_priv_8_EQ_0b11_059_OR_rg_cur_priv_8_EQ__ETC___d1189) &&
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      stage1_rg_stage_input[151:145] != 7'b1110011 ||
	      stage1_rg_stage_input[112:110] != 3'd0 ||
	      rg_cur_priv_8_EQ_0b11_059_OR_rg_cur_priv_8_EQ__ETC___d1203) ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1209 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      stage1_rg_stage_input[151:145] != 7'b1110011 ||
	      stage1_rg_stage_input[112:110] != 3'd0 ||
	      stage1_rg_stage_input[104:98] == 7'b0001001 ||
	      stage1_rg_stage_input[144:140] != 5'd0 ||
	      stage1_rg_stage_input[139:135] != 5'd0 ||
	      rg_cur_priv != 2'b11 ||
	      stage1_rg_stage_input[87:76] != 12'b001100000010) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1208 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1210 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      stage1_rg_stage_input[151:145] != 7'b1110011 ||
	      stage1_rg_stage_input[112:110] != 3'd0 ||
	      NOT_stage1_rg_stage_input_32_BITS_144_TO_140_0_ETC___d1169) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1209 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1213 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      stage1_rg_stage_input[151:145] != 7'b1110011 ||
	      stage1_rg_stage_input[112:110] != 3'b010 &&
	      stage1_rg_stage_input[112:110] != 3'b110 &&
	      stage1_rg_stage_input[112:110] != 3'b011 &&
	      stage1_rg_stage_input[112:110] != 3'b111) &&
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      stage1_rg_stage_input[151:145] != 7'b0001111 ||
	      NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1157) &&
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      stage1_rg_stage_input[151:145] != 7'b0001111 ||
	      NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1164) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1210 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1214 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      stage1_rg_stage_input[151:145] != 7'b1110011 ||
	      stage1_rg_stage_input[112:110] != 3'b001 &&
	      stage1_rg_stage_input[112:110] != 3'b101) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1213 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1215 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1214 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1216 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1215 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1278 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1100111 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1332 =
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     (stage1_rg_stage_input[151:145] == 7'b0100011 ||
	      stage1_rg_stage_input[151:145] == 7'b0100111) ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1350 =
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	     stage1_rg_stage_input[151:145] != 7'b0000011 &&
	     stage1_rg_stage_input[151:145] != 7'b0000111 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1360 =
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	     stage1_rg_stage_input[151:145] != 7'b0100011 &&
	     stage1_rg_stage_input[151:145] != 7'b0100111 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1365 =
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1360 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     stage1_rg_stage_input[151:145] != 7'b1100011 &&
	     stage1_rg_stage_input[151:145] != 7'b1101111 &&
	     stage1_rg_stage_input[151:145] != 7'b1100111 &&
	     (stage1_rg_stage_input[151:145] == 7'b0110011 &&
	      stage1_rg_stage_input[104:98] == 7'b0000001 ||
	      stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d794) ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1368 =
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d1341) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1350 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1365 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1379 =
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	     stage1_rg_stage_input[151:145] != 7'b1100011 &&
	     stage1_rg_stage_input[151:145] != 7'b1101111 &&
	     stage1_rg_stage_input[151:145] != 7'b1100111 &&
	     stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d1341 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1395 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[151:145] == 7'b1100011 ||
	      stage1_rg_stage_input[151:145] == 7'b1101111 ||
	      stage1_rg_stage_input[151:145] == 7'b1100111 ||
	      (stage1_rg_stage_input[151:145] != 7'b0110011 ||
	       stage1_rg_stage_input[104:98] != 7'b0000001) &&
	      NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d449) &&
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[151:145] != 7'b0101111) ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1555 =
	     stage2_rg_full && stage2_rg_stage2[397:395] != 3'd0 &&
	     stage2_rg_stage2[397:395] != 3'd1 &&
	     stage2_rg_stage2[397:395] != 3'd4 &&
	     stage2_rg_stage2[397:395] != 3'd2 &&
	     stage2_rg_stage2[397:395] != 3'd3 &&
	     stage2_rg_stage2[5] &&
	     stage2_fbox$valid ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2295 =
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	     stage1_rg_stage_input[332] ||
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763 &&
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d775 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2614 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d1341) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1350 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1365 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 =
	     stage2_rg_full && stage2_rg_stage2[397:395] != 3'd0 &&
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d290 &&
	     (IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d337 ||
	      IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d339) ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 =
	     stage2_rg_full && stage2_rg_stage2[397:395] != 3'd0 &&
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d319 &&
	     (IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d343 ||
	      IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d344 ||
	      IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d347) ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d972 =
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	     !stage1_rg_stage_input[332] &&
	     (IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d965 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969) ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d995 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d763) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d985 &&
	     !stage1_rg_stage_input[332] &&
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969 ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170 =
	     stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152) &&
	     stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d168 ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2376 =
	     stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299) &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2381 =
	     stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299) &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d184) ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2383 =
	     stage2_rg_full &&
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     stage2_rg_stage2[397:395] != 3'd0 &&
	     stage2_rg_stage2[397:395] != 3'd1 &&
	     stage2_rg_stage2[397:395] != 3'd4 &&
	     stage2_rg_stage2[397:395] != 3'd2 &&
	     stage2_rg_stage2[397:395] != 3'd3 ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2385 =
	     stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299) &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      stage2_rg_stage2[397:395] == 3'd1 ||
	      stage2_rg_stage2[397:395] == 3'd4 ||
	      stage2_rg_stage2[397:395] == 3'd2 ||
	      stage2_rg_stage2[397:395] == 3'd3) ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2387 =
	     stage2_rg_full &&
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     stage2_rg_stage2[397:395] != 3'd0 &&
	     CASE_stage2_rg_stage2_BITS_397_TO_395_1_stage2_ETC__q4 ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2389 =
	     stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299) &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_st_ETC__q5) ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2395 =
	     stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299) &&
	     (cur_verbosity__h3946 != 4'd0 ||
	      csr_regfile$read_csr_minstret[19:0] == 20'd0) ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d405 =
	     stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      stage2_rg_stage2[397:395] != 3'd1 &&
	      stage2_rg_stage2[397:395] != 3'd4 &&
	      NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d402) ;
  assign stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d168 =
	     stage2_rg_stage2[397:395] != 3'd1 &&
	     stage2_rg_stage2[397:395] != 3'd4 &&
	     stage2_rg_stage2[397:395] != 3'd2 ||
	     !near_mem$dmem_valid ||
	     !near_mem$dmem_exc ;
  assign stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d215 =
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	     stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d168 &&
	     stage2_rg_stage2[397:395] != 3'd0 &&
	     CASE_stage2_rg_stage2_BITS_397_TO_395_1_stage2_ETC__q4 ;
  assign stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d244 =
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152) &&
	     stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d168 &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_st_ETC__q5) ;
  assign stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_2_21_ETC___d296 =
	     stage2_rg_stage2[397:395] == 3'd2 ||
	     ((stage2_rg_stage2[397:395] == 3'd3) ?
		stage2_mbox$valid :
		stage2_rg_stage2[5] || stage2_fbox$valid) ;
  assign stage3_rg_full_8_OR_NOT_stage2_rg_full_14_71_O_ETC___d2337 =
	     (stage3_rg_full || !stage2_rg_full ||
	      stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d168) &&
	     (stage3_rg_full || stage2_rg_full || !stage1_rg_full ||
	      NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2334) ;
  assign stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d407 =
	     stage3_rg_stage3[139:135] == stage1_rg_stage_input[139:135] ;
  assign stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d415 =
	     stage3_rg_stage3[139:135] == stage1_rg_stage_input[134:130] ;
  assign stageF_f_reset_rsps_i_notEmpty__241_AND_stageD_ETC___d2261 =
	     stageF_f_reset_rsps$EMPTY_N && stageD_f_reset_rsps$EMPTY_N &&
	     stage1_f_reset_rsps$EMPTY_N &&
	     stage2_f_reset_rsps$EMPTY_N &&
	     stage3_f_reset_rsps$EMPTY_N &&
	     f_reset_rsps$FULL_N &&
	     NOT_rg_run_on_reset_247_248_OR_imem_rg_pc_BITS_ETC___d2255 ;
  assign stageF_rg_full_094_AND_near_mem_imem_valid_AND_ETC___d2126 =
	     stageF_rg_full && near_mem$imem_valid &&
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119 &&
	     !near_mem$imem_exc ;
  assign sxl__h6937 =
	     (csr_regfile$read_misa[27:26] == 2'd2) ?
	       csr_regfile$read_mstatus[35:34] :
	       2'd0 ;
  assign tmp__h16821 =
	     rs1_val_bypassed__h5597[31:0] >> stage1_rg_stage_input[80:76] |
	     ~(32'hFFFFFFFF >> stage1_rg_stage_input[80:76]) &
	     {32{rs1_val_bypassed597_BITS_31_TO_0__q7[31]}} ;
  assign trap_info_tval__h15117 =
	     (stage1_rg_stage_input[151:145] != 7'b1101111 &&
	      stage1_rg_stage_input[151:145] != 7'b1100111 &&
	      (stage1_rg_stage_input[151:145] != 7'b1110011 ||
	       stage1_rg_stage_input[112:110] != 3'd0 ||
	       rg_cur_priv_8_EQ_0b11_059_OR_rg_cur_priv_8_EQ__ETC___d1635)) ?
	       (stage1_rg_stage_input[333] ?
		  { 32'd0, stage1_rg_stage_input[263:232] } :
		  { 48'd0, stage1_rg_stage_input[231:216] }) :
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q20 ;
  assign uxl__h6938 =
	     (csr_regfile$read_misa[27:26] == 2'd2) ?
	       csr_regfile$read_mstatus[33:32] :
	       2'd0 ;
  assign v32__h10610 = { stage1_rg_stage_input[50:31], 12'h0 } ;
  assign val__h9686 =
	     (stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d405 &&
	      IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d337) ?
	       x_out_bypass_rd_val__h9272 :
	       rd_val__h9684 ;
  assign val__h9719 =
	     (stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d405 &&
	      IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d339) ?
	       x_out_bypass_rd_val__h9272 :
	       rd_val__h9717 ;
  assign value__h15187 =
	     stage1_rg_stage_input[332] ?
	       stage1_rg_stage_input[327:264] :
	       trap_info_tval__h15117 ;
  assign x__h16764 =
	     rs1_val_bypassed__h5597[31:0] << stage1_rg_stage_input[80:76] ;
  assign x__h16796 =
	     rs1_val_bypassed__h5597[31:0] >> stage1_rg_stage_input[80:76] ;
  assign x__h16931 =
	     rs1_val_bypassed__h5597[31:0] << rs2_val_bypassed__h5603[4:0] ;
  assign x__h16976 =
	     rs1_val_bypassed__h5597[31:0] >> rs2_val_bypassed__h5603[4:0] ;
  assign x__h33878 =
	     csr_regfile_read_csr_mcycle__7_MINUS_rg_start__ETC___d2801[63:0] /
	     _theResult____h33877 ;
  assign x_exc_code__h44308 =
	     (csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending) ?
	       csr_regfile$interrupt_pending[3:0] :
	       4'd0 ;
  assign x_out_cf_info_fallthru_PC__h16274 =
	     stage1_rg_stage_input[333] ?
	       next_pc__h13964 :
	       next_pc___1__h13967 ;
  assign x_out_data_to_stage1_instr__h17651 =
	     stageD_rg_data[165] ? stageD_rg_data[95:64] : instr___1__h17725 ;
  assign x_out_data_to_stage2_fval1__h10123 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1555 &&
	      IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d343) ?
	       x_out_fbypass_rd_val__h9454 :
	       rd_val__h9750 ;
  assign x_out_data_to_stage2_fval3__h10125 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1555 &&
	      IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d347) ?
	       x_out_fbypass_rd_val__h9454 :
	       rd_val__h9815 ;
  assign x_out_data_to_stage2_rd__h10119 =
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ?
	       data_to_stage2_rd__h10102 :
	       5'd0 ;
  assign x_out_data_to_stage2_val2__h10122 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       branch_target__h10301 :
	       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1531 ;
  assign x_out_next_pc__h9864 =
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d969 ?
	       data_to_stage2_addr__h10103 :
	       fall_through_pc__h9846 ;
  assign x_out_trap_info_exc_code__h15122 =
	     stage1_rg_stage_input[332] ?
	       stage1_rg_stage_input[331:328] :
	       alu_outputs_exc_code__h11737 ;
  assign y__h35607 = ~rs1_val__h35329 ;
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4: value__h8670 = stage2_rg_stage2[493:430];
      default: value__h8670 = stage2_rg_stage2[493:430];
    endcase
  end
  always@(stage2_rg_stage2 or near_mem$dmem_exc_code)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4:
	  x_out_trap_info_exc_code__h8780 = near_mem$dmem_exc_code;
      default: x_out_trap_info_exc_code__h8780 = 4'd2;
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4: value__h8884 = stage2_rg_stage2[389:326];
      default: value__h8884 = 64'd0;
    endcase
  end
  always@(stage2_rg_stage2 or stage2_fbox$word_snd)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd1, 3'd2, 3'd3, 3'd4:
	  x_out_data_to_stage3_fpr_flags__h8344 = 5'd0;
      default: x_out_data_to_stage3_fpr_flags__h8344 = stage2_fbox$word_snd;
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd1, 3'd4:
	  x_out_data_to_stage3_rd__h8340 = stage2_rg_stage2[394:390];
      3'd2: x_out_data_to_stage3_rd__h8340 = 5'd0;
      default: x_out_data_to_stage3_rd__h8340 = stage2_rg_stage2[394:390];
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd1, 3'd4: x_out_bypass_rd__h9271 = stage2_rg_stage2[394:390];
      default: x_out_bypass_rd__h9271 = stage2_rg_stage2[394:390];
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4: x_out_fbypass_rd__h9453 = stage2_rg_stage2[394:390];
      default: x_out_fbypass_rd__h9453 = stage2_rg_stage2[394:390];
    endcase
  end
  always@(rg_trap_instr or rg_csr_val1)
  begin
    case (rg_trap_instr[14:12])
      3'b010, 3'b011: rs1_val__h35329 = rg_csr_val1;
      default: rs1_val__h35329 = { 59'd0, rg_trap_instr[19:15] };
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_fbox$word_fst or
	  output_stage2___1_data_to_stage3_frd_val__h8219)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd2, 3'd3:
	  x_out_data_to_stage3_frd_val__h8345 = stage2_rg_stage2[197:134];
      3'd1, 3'd4:
	  x_out_data_to_stage3_frd_val__h8345 =
	      output_stage2___1_data_to_stage3_frd_val__h8219;
      default: x_out_data_to_stage3_frd_val__h8345 = stage2_fbox$word_fst;
    endcase
  end
  always@(stage2_rg_stage2 or
	  _theResult___snd_snd_rd_val__h8290 or
	  near_mem$dmem_word64 or stage2_mbox$word)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd2:
	  x_out_data_to_stage3_rd_val__h8341 = stage2_rg_stage2[325:262];
      3'd1, 3'd4: x_out_data_to_stage3_rd_val__h8341 = near_mem$dmem_word64;
      3'd3: x_out_data_to_stage3_rd_val__h8341 = stage2_mbox$word;
      default: x_out_data_to_stage3_rd_val__h8341 =
		   _theResult___snd_snd_rd_val__h8290;
    endcase
  end
  always@(stage2_rg_stage2 or
	  _theResult___snd_snd_rd_val__h8290 or stage2_mbox$word)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd1, 3'd4:
	  x_out_bypass_rd_val__h9272 = stage2_rg_stage2[325:262];
      3'd3: x_out_bypass_rd_val__h9272 = stage2_mbox$word;
      default: x_out_bypass_rd_val__h9272 =
		   _theResult___snd_snd_rd_val__h8290;
    endcase
  end
  always@(stage2_rg_stage2 or _theResult___snd_fst_rd_val__h9435)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4: x_out_fbypass_rd_val__h9454 = stage2_rg_stage2[197:134];
      default: x_out_fbypass_rd_val__h9454 =
		   _theResult___snd_fst_rd_val__h9435;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011,
      7'b0000111,
      7'b0010011,
      7'b0010111,
      7'b0011011,
      7'b0110011,
      7'b0110111,
      7'b0111011,
      7'b1100111,
      7'b1101111:
	  data_to_stage2_rd__h10102 = stage1_rg_stage_input[144:140];
      7'b1100011: data_to_stage2_rd__h10102 = 5'd0;
      default: data_to_stage2_rd__h10102 = stage1_rg_stage_input[144:140];
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_fbox$valid or near_mem$dmem_valid or stage2_mbox$valid)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 =
	      near_mem$dmem_valid;
      3'd3:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 =
	      stage2_mbox$valid;
      default: IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 =
		   stage2_fbox$valid;
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_fbox$valid or near_mem$dmem_valid or stage2_mbox$valid)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4:
	  CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_ne_ETC__q3 =
	      !near_mem$dmem_valid;
      3'd3:
	  CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_ne_ETC__q3 =
	      !stage2_mbox$valid;
      default: CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_ne_ETC__q3 =
		   !stage2_fbox$valid;
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_fbox$valid or
	  near_mem$dmem_valid or near_mem$dmem_exc or stage2_mbox$valid)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d175 =
	      !near_mem$dmem_valid || near_mem$dmem_exc;
      3'd3:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d175 =
	      !stage2_mbox$valid;
      default: IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d175 =
		   stage2_rg_stage2[397:395] == 3'd5 && !stage2_fbox$valid;
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_fbox$valid or
	  near_mem$dmem_valid or near_mem$dmem_exc or stage2_mbox$valid)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d184 =
	      near_mem$dmem_valid && !near_mem$dmem_exc;
      3'd3:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d184 =
	      stage2_mbox$valid;
      default: IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d184 =
		   stage2_rg_stage2[397:395] != 3'd5 || stage2_fbox$valid;
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4:
	  CASE_stage2_rg_stage2_BITS_397_TO_395_1_stage2_ETC__q4 =
	      stage2_rg_stage2[5];
      default: CASE_stage2_rg_stage2_BITS_397_TO_395_1_stage2_ETC__q4 =
		   stage2_rg_stage2[397:395] != 3'd2 &&
		   stage2_rg_stage2[397:395] != 3'd3 &&
		   stage2_rg_stage2[5];
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4:
	  CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_st_ETC__q5 =
	      !stage2_rg_stage2[5];
      default: CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_st_ETC__q5 =
		   stage2_rg_stage2[397:395] == 3'd2 ||
		   stage2_rg_stage2[397:395] == 3'd3 ||
		   !stage2_rg_stage2[5];
    endcase
  end
  always@(stage2_rg_stage2 or near_mem$dmem_valid or near_mem$dmem_exc)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d273 =
	      near_mem$dmem_valid && near_mem$dmem_exc ||
	      stage2_rg_stage2[394:390] == 5'd0;
      default: IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d273 =
		   stage2_rg_stage2[397:395] == 3'd2 ||
		   stage2_rg_stage2[397:395] != 3'd3 && stage2_rg_stage2[5];
    endcase
  end
  always@(stage2_rg_stage2 or near_mem$dmem_valid or near_mem$dmem_exc)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d279 =
	      (!near_mem$dmem_valid || !near_mem$dmem_exc) &&
	      stage2_rg_stage2[394:390] != 5'd0;
      default: IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d279 =
		   stage2_rg_stage2[397:395] != 3'd2 &&
		   (stage2_rg_stage2[397:395] == 3'd3 ||
		    !stage2_rg_stage2[5]);
    endcase
  end
  always@(stage2_rg_stage2 or
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d289 or
	  near_mem$dmem_valid or near_mem$dmem_exc)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d290 =
	      (!near_mem$dmem_valid || !near_mem$dmem_exc) &&
	      stage2_rg_stage2[394:390] != 5'd0;
      default: IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d290 =
		   NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d289;
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_2_21_ETC___d296 or
	  near_mem$dmem_valid or near_mem$dmem_exc)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d297 =
	      near_mem$dmem_valid && near_mem$dmem_exc ||
	      stage2_rg_stage2[394:390] == 5'd0;
      default: IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d297 =
		   stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_2_21_ETC___d296;
    endcase
  end
  always@(stage2_rg_stage2 or near_mem$dmem_valid or near_mem$dmem_exc)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d305 =
	      near_mem$dmem_valid && near_mem$dmem_exc ||
	      !stage2_rg_stage2[5];
      default: IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d305 =
		   stage2_rg_stage2[397:395] == 3'd2 ||
		   stage2_rg_stage2[397:395] == 3'd3 ||
		   !stage2_rg_stage2[5];
    endcase
  end
  always@(stage2_rg_stage2 or near_mem$dmem_valid or near_mem$dmem_exc)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d310 =
	      (!near_mem$dmem_valid || !near_mem$dmem_exc) &&
	      stage2_rg_stage2[5];
      default: IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d310 =
		   stage2_rg_stage2[397:395] != 3'd2 &&
		   stage2_rg_stage2[397:395] != 3'd3 &&
		   stage2_rg_stage2[5];
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_fbox$valid or near_mem$dmem_valid or near_mem$dmem_exc)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d324 =
	      near_mem$dmem_valid && near_mem$dmem_exc ||
	      !stage2_rg_stage2[5];
      default: IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d324 =
		   stage2_rg_stage2[397:395] == 3'd2 ||
		   stage2_rg_stage2[397:395] == 3'd3 ||
		   !stage2_rg_stage2[5] ||
		   stage2_fbox$valid;
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_fbox$valid or near_mem$dmem_valid or near_mem$dmem_exc)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d319 =
	      (!near_mem$dmem_valid || !near_mem$dmem_exc) &&
	      stage2_rg_stage2[5];
      default: IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d319 =
		   stage2_rg_stage2[397:395] != 3'd2 &&
		   stage2_rg_stage2[397:395] != 3'd3 &&
		   stage2_rg_stage2[5] &&
		   !stage2_fbox$valid;
    endcase
  end
  always@(stage1_rg_stage_input or
	  _theResult___fst__h12794 or
	  rd_val___1__h16874 or
	  rd_val___1__h16928 or rd_val___1__h16973 or rd_val___1__h16922)
  begin
    case (stage1_rg_stage_input[97:88])
      10'b0: alu_outputs___1_val1__h10598 = rd_val___1__h16874;
      10'b0000000001: alu_outputs___1_val1__h10598 = rd_val___1__h16928;
      10'b0000000101: alu_outputs___1_val1__h10598 = rd_val___1__h16973;
      10'b0100000000: alu_outputs___1_val1__h10598 = rd_val___1__h16922;
      default: alu_outputs___1_val1__h10598 = _theResult___fst__h12794;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d425 or
	  IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d421 or
	  IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d423)
  begin
    case (stage1_rg_stage_input[112:110])
      3'd0:
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d769 =
	      !IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d421;
      3'b001:
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d769 =
	      IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d421;
      3'b100:
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d769 =
	      !IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d423;
      3'b101:
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d769 =
	      IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d423;
      3'b110:
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d769 =
	      !IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d425;
      default: IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d769 =
		   stage1_rg_stage_input[112:110] != 3'b111 ||
		   IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d425;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d425 or
	  IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d421 or
	  IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d423)
  begin
    case (stage1_rg_stage_input[112:110])
      3'd0:
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d432 =
	      IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d421;
      3'b001:
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d432 =
	      !IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d421;
      3'b100:
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d432 =
	      IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d423;
      3'b101:
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d432 =
	      !IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d423;
      3'b110:
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d432 =
	      IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d425;
      default: IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d432 =
		   stage1_rg_stage_input[112:110] == 3'b111 &&
		   !IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d425;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b010, 3'b011, 3'b100, 3'b110:
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b1_ETC__q11 =
	      stage1_rg_stage_input[151:145] != 7'b0010011 &&
	      stage1_rg_stage_input[263] &&
	      stage1_rg_stage_input[262] &&
	      stage1_rg_stage_input[261:257] != 5'b0;
      default: CASE_stage1_rg_stage_input_BITS_112_TO_110_0b1_ETC__q11 =
		   stage1_rg_stage_input[112:110] != 3'b111 ||
		   stage1_rg_stage_input[151:145] != 7'b0010011 &&
		   stage1_rg_stage_input[263] &&
		   stage1_rg_stage_input[262] &&
		   stage1_rg_stage_input[261:257] != 5'b0;
    endcase
  end
  always@(stage1_rg_stage_input or
	  csr_regfile_read_mstatus__9_BITS_14_TO_13_1_EQ_ETC___d573 or
	  NOT_stage1_rg_stage_input_32_BITS_99_TO_98_74__ETC___d734 or
	  NOT_stage1_rg_stage_input_32_BITS_104_TO_98_38_ETC___d746 or
	  csr_regfile$read_mstatus or
	  NOT_stage1_rg_stage_input_32_BITS_109_TO_105_2_ETC___d559)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000111, 7'b0100111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d750 =
	      csr_regfile$read_mstatus[14:13] == 2'h0 ||
	      stage1_rg_stage_input[112:110] != 3'b010 &&
	      stage1_rg_stage_input[112:110] != 3'b011;
      7'b0101111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d750 =
	      NOT_stage1_rg_stage_input_32_BITS_109_TO_105_2_ETC___d559;
      default: IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d750 =
		   csr_regfile_read_mstatus__9_BITS_14_TO_13_1_EQ_ETC___d573 ||
		   NOT_stage1_rg_stage_input_32_BITS_99_TO_98_74__ETC___d734 &&
		   NOT_stage1_rg_stage_input_32_BITS_104_TO_98_38_ETC___d746;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d750)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q12 =
	      stage1_rg_stage_input[112:110] != 3'd0 &&
	      stage1_rg_stage_input[112:110] != 3'b100 &&
	      stage1_rg_stage_input[112:110] != 3'b001 &&
	      stage1_rg_stage_input[112:110] != 3'b101 &&
	      stage1_rg_stage_input[112:110] != 3'b010 &&
	      stage1_rg_stage_input[112:110] != 3'b110 &&
	      stage1_rg_stage_input[112:110] != 3'b011;
      7'b0100011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q12 =
	      stage1_rg_stage_input[112:110] != 3'd0 &&
	      stage1_rg_stage_input[112:110] != 3'b001 &&
	      stage1_rg_stage_input[112:110] != 3'b010 &&
	      stage1_rg_stage_input[112:110] != 3'b011;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q12 =
		   stage1_rg_stage_input[151:145] == 7'b0001111 ||
		   stage1_rg_stage_input[151:145] == 7'b1110011 ||
		   IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d750;
    endcase
  end
  always@(stage1_rg_stage_input or
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q12 or
	  NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d479)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d758 =
	      NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d479;
      7'b0011011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d758 =
	      stage1_rg_stage_input[112:110] != 3'd0 &&
	      (stage1_rg_stage_input[112:110] != 3'b001 ||
	       stage1_rg_stage_input[263] ||
	       stage1_rg_stage_input[261:257] != 5'b0 ||
	       stage1_rg_stage_input[262]) &&
	      (stage1_rg_stage_input[112:110] != 3'b101 ||
	       stage1_rg_stage_input[263] ||
	       stage1_rg_stage_input[261:257] != 5'b0);
      7'b0111011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d758 =
	      stage1_rg_stage_input[97:88] != 10'b0 &&
	      stage1_rg_stage_input[97:88] != 10'b0100000000 &&
	      stage1_rg_stage_input[97:88] != 10'b0000000001 &&
	      stage1_rg_stage_input[97:88] != 10'b0000000101 &&
	      stage1_rg_stage_input[97:88] != 10'b0100000101;
      default: IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d758 =
		   stage1_rg_stage_input[151:145] != 7'b0110111 &&
		   stage1_rg_stage_input[151:145] != 7'b0010111 &&
		   CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q12;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b010, 3'b011, 3'b100, 3'b110:
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b1_ETC__q13 =
	      stage1_rg_stage_input[151:145] == 7'b0010011 ||
	      !stage1_rg_stage_input[263] ||
	      !stage1_rg_stage_input[262] ||
	      stage1_rg_stage_input[261:257] == 5'b0;
      default: CASE_stage1_rg_stage_input_BITS_112_TO_110_0b1_ETC__q13 =
		   stage1_rg_stage_input[112:110] == 3'b111 &&
		   (stage1_rg_stage_input[151:145] == 7'b0010011 ||
		    !stage1_rg_stage_input[263] ||
		    !stage1_rg_stage_input[262] ||
		    stage1_rg_stage_input[261:257] == 5'b0);
    endcase
  end
  always@(stage1_rg_stage_input or
	  NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d851 or
	  stage1_rg_stage_input_32_BITS_99_TO_98_74_EQ_0_ETC___d938 or
	  rm__h10284 or csr_regfile$read_mstatus)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000111, 7'b0100111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d952 =
	      csr_regfile$read_mstatus[14:13] != 2'h0 &&
	      (stage1_rg_stage_input[112:110] == 3'b010 ||
	       stage1_rg_stage_input[112:110] == 3'b011);
      7'b0101111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d952 =
	      (stage1_rg_stage_input[109:105] == 5'b00010 &&
	       stage1_rg_stage_input[134:130] == 5'd0 ||
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
      default: IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d952 =
		   NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d851 &&
		   (stage1_rg_stage_input_32_BITS_99_TO_98_74_EQ_0_ETC___d938 ||
		    stage1_rg_stage_input[104:98] == 7'h61 &&
		    (stage1_rg_stage_input[134:130] == 5'b00010 ||
		     stage1_rg_stage_input[134:130] == 5'b00011) ||
		    stage1_rg_stage_input[104:98] == 7'h71 &&
		    stage1_rg_stage_input[134:130] == 5'd0 &&
		    rm__h10284 == 3'b0 ||
		    stage1_rg_stage_input[104:98] == 7'h69 &&
		    stage1_rg_stage_input[134:130] == 5'b00010 ||
		    stage1_rg_stage_input[104:98] == 7'h69 &&
		    stage1_rg_stage_input[134:130] == 5'b00011 ||
		    stage1_rg_stage_input[104:98] == 7'h79 &&
		    stage1_rg_stage_input[134:130] == 5'd0 &&
		    rm__h10284 == 3'b0);
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d952)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14 =
	      stage1_rg_stage_input[112:110] == 3'd0 ||
	      stage1_rg_stage_input[112:110] == 3'b100 ||
	      stage1_rg_stage_input[112:110] == 3'b001 ||
	      stage1_rg_stage_input[112:110] == 3'b101 ||
	      stage1_rg_stage_input[112:110] == 3'b010 ||
	      stage1_rg_stage_input[112:110] == 3'b110 ||
	      stage1_rg_stage_input[112:110] == 3'b011;
      7'b0100011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14 =
	      stage1_rg_stage_input[112:110] == 3'd0 ||
	      stage1_rg_stage_input[112:110] == 3'b001 ||
	      stage1_rg_stage_input[112:110] == 3'b010 ||
	      stage1_rg_stage_input[112:110] == 3'b011;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14 =
		   stage1_rg_stage_input[151:145] != 7'b0001111 &&
		   stage1_rg_stage_input[151:145] != 7'b1110011 &&
		   IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d952;
    endcase
  end
  always@(stage1_rg_stage_input or
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14 or
	  stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d806)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d960 =
	      stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d806;
      7'b0011011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d960 =
	      stage1_rg_stage_input[112:110] == 3'd0 ||
	      stage1_rg_stage_input[112:110] == 3'b001 &&
	      !stage1_rg_stage_input[263] &&
	      stage1_rg_stage_input[261:257] == 5'b0 &&
	      !stage1_rg_stage_input[262] ||
	      stage1_rg_stage_input[112:110] == 3'b101 &&
	      !stage1_rg_stage_input[263] &&
	      stage1_rg_stage_input[261:257] == 5'b0;
      7'b0111011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d960 =
	      stage1_rg_stage_input[97:88] == 10'b0 ||
	      stage1_rg_stage_input[97:88] == 10'b0100000000 ||
	      stage1_rg_stage_input[97:88] == 10'b0000000001 ||
	      stage1_rg_stage_input[97:88] == 10'b0000000101 ||
	      stage1_rg_stage_input[97:88] == 10'b0100000101;
      default: IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d960 =
		   stage1_rg_stage_input[151:145] == 7'b0110111 ||
		   stage1_rg_stage_input[151:145] == 7'b0010111 ||
		   CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14;
    endcase
  end
  always@(rg_cur_priv)
  begin
    case (rg_cur_priv)
      2'b0: CASE_rg_cur_priv_0b0_8_0b1_9_11__q15 = 4'd8;
      2'b01: CASE_rg_cur_priv_0b0_8_0b1_9_11__q15 = 4'd9;
      default: CASE_rg_cur_priv_0b0_8_0b1_9_11__q15 = 4'd11;
    endcase
  end
  always@(stage1_rg_stage_input or CASE_rg_cur_priv_0b0_8_0b1_9_11__q15)
  begin
    case (stage1_rg_stage_input[87:76])
      12'b0:
	  CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q16 =
	      CASE_rg_cur_priv_0b0_8_0b1_9_11__q15;
      12'b000000000001:
	  CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q16 = 4'd3;
      default: CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q16 = 4'd2;
    endcase
  end
  always@(stage1_rg_stage_input or alu_outputs___1_exc_code__h10979)
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
	  alu_outputs_exc_code__h11737 = 4'd2;
      7'b1100111, 7'b1101111: alu_outputs_exc_code__h11737 = 4'd0;
      7'b1110011:
	  alu_outputs_exc_code__h11737 = alu_outputs___1_exc_code__h10979;
      default: alu_outputs_exc_code__h11737 = 4'd2;
    endcase
  end
  always@(stage1_rg_stage_input or
	  _theResult_____1_fst__h12570 or
	  rd_val___1__h12538 or
	  rd_val___1__h12545 or rd_val___1__h12552 or rd_val___1__h12559)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b010: _theResult_____1_fst__h12542 = rd_val___1__h12538;
      3'b011: _theResult_____1_fst__h12542 = rd_val___1__h12545;
      3'b100: _theResult_____1_fst__h12542 = rd_val___1__h12552;
      3'b110: _theResult_____1_fst__h12542 = rd_val___1__h12559;
      default: _theResult_____1_fst__h12542 = _theResult_____1_fst__h12570;
    endcase
  end
  always@(stage1_rg_stage_input or
	  alu_outputs___1_addr__h10697 or
	  IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d1260 or
	  rs1_val_bypassed__h5597 or
	  alu_outputs___1_addr__h10323 or next_pc__h10371 or next_pc__h10336)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011, 7'b0000111:
	  x_out_data_to_stage2_addr__h10120 =
	      IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d1260;
      7'b0100011:
	  x_out_data_to_stage2_addr__h10120 = alu_outputs___1_addr__h10697;
      7'b0101111: x_out_data_to_stage2_addr__h10120 = rs1_val_bypassed__h5597;
      7'b1100011:
	  x_out_data_to_stage2_addr__h10120 = alu_outputs___1_addr__h10323;
      7'b1100111: x_out_data_to_stage2_addr__h10120 = next_pc__h10371;
      7'b1101111: x_out_data_to_stage2_addr__h10120 = next_pc__h10336;
      default: x_out_data_to_stage2_addr__h10120 =
		   alu_outputs___1_addr__h10697;
    endcase
  end
  always@(stage1_rg_stage_input or
	  next_pc__h10371 or branch_target__h10301 or next_pc__h10336)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011: x_out_cf_info_taken_PC__h16275 = branch_target__h10301;
      7'b1101111: x_out_cf_info_taken_PC__h16275 = next_pc__h10336;
      default: x_out_cf_info_taken_PC__h16275 = next_pc__h10371;
    endcase
  end
  always@(stage1_rg_stage_input or rs2_val_bypassed__h5603)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0100011, 7'b0101111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q19 =
	      rs2_val_bypassed__h5603;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q19 =
		   rs2_val_bypassed__h5603;
    endcase
  end
  always@(stage1_rg_stage_input or
	  NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d1645 or
	  data_to_stage2_addr__h10103)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100111, 7'b1101111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q20 =
	      data_to_stage2_addr__h10103;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q20 =
		   (stage1_rg_stage_input[151:145] == 7'b1110011 &&
		    stage1_rg_stage_input[112:110] == 3'd0 &&
		    NOT_rg_cur_priv_8_EQ_0b11_059_091_AND_NOT_rg_c_ETC___d1645) ?
		     stage1_rg_stage_input[401:338] :
		     64'd0;
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_fbox$valid or
	  near_mem$dmem_valid or near_mem$dmem_exc or stage2_mbox$valid)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299 =
	      near_mem$dmem_valid && !near_mem$dmem_exc;
      3'd3:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299 =
	      stage2_mbox$valid;
      default: IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299 =
		   stage2_fbox$valid;
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_fbox$valid or
	  near_mem$dmem_valid or near_mem$dmem_exc or stage2_mbox$valid)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2686 =
	      !near_mem$dmem_valid || near_mem$dmem_exc;
      3'd3:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2686 =
	      !stage2_mbox$valid;
      default: IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2686 =
		   !stage2_fbox$valid;
    endcase
  end
  always@(stage1_rg_stage_input or
	  csr_regfile_read_mstatus__9_BITS_14_TO_13_1_EQ_ETC___d573 or
	  NOT_stage1_rg_stage_input_32_BITS_99_TO_98_74__ETC___d734 or
	  NOT_stage1_rg_stage_input_32_BITS_104_TO_98_38_ETC___d746 or
	  csr_regfile$read_mstatus or
	  NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1164 or
	  NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1157 or
	  NOT_stage1_rg_stage_input_32_BITS_109_TO_105_2_ETC___d559 or
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d2764)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2768 =
	      stage1_rg_stage_input[112:110] != 3'd0 &&
	      stage1_rg_stage_input[112:110] != 3'b100 &&
	      stage1_rg_stage_input[112:110] != 3'b001 &&
	      stage1_rg_stage_input[112:110] != 3'b101 &&
	      stage1_rg_stage_input[112:110] != 3'b010 &&
	      stage1_rg_stage_input[112:110] != 3'b110 &&
	      stage1_rg_stage_input[112:110] != 3'b011;
      7'b0000111, 7'b0100111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2768 =
	      csr_regfile$read_mstatus[14:13] == 2'h0 ||
	      stage1_rg_stage_input[112:110] != 3'b010 &&
	      stage1_rg_stage_input[112:110] != 3'b011;
      7'b0001111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2768 =
	      NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1164 &&
	      NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1157;
      7'b0100011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2768 =
	      stage1_rg_stage_input[112:110] != 3'd0 &&
	      stage1_rg_stage_input[112:110] != 3'b001 &&
	      stage1_rg_stage_input[112:110] != 3'b010 &&
	      stage1_rg_stage_input[112:110] != 3'b011;
      7'b0101111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2768 =
	      NOT_stage1_rg_stage_input_32_BITS_109_TO_105_2_ETC___d559;
      7'b1110011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2768 =
	      IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d2764;
      default: IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2768 =
		   csr_regfile_read_mstatus__9_BITS_14_TO_13_1_EQ_ETC___d573 ||
		   NOT_stage1_rg_stage_input_32_BITS_99_TO_98_74__ETC___d734 &&
		   NOT_stage1_rg_stage_input_32_BITS_104_TO_98_38_ETC___d746;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2768 or
	  NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d479)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2772 =
	      NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d479;
      7'b0011011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2772 =
	      stage1_rg_stage_input[112:110] != 3'd0 &&
	      (stage1_rg_stage_input[112:110] != 3'b001 ||
	       stage1_rg_stage_input[263] ||
	       stage1_rg_stage_input[261:257] != 5'b0 ||
	       stage1_rg_stage_input[262]) &&
	      (stage1_rg_stage_input[112:110] != 3'b101 ||
	       stage1_rg_stage_input[263] ||
	       stage1_rg_stage_input[261:257] != 5'b0);
      7'b0111011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2772 =
	      stage1_rg_stage_input[97:88] != 10'b0 &&
	      stage1_rg_stage_input[97:88] != 10'b0100000000 &&
	      stage1_rg_stage_input[97:88] != 10'b0000000001 &&
	      stage1_rg_stage_input[97:88] != 10'b0000000101 &&
	      stage1_rg_stage_input[97:88] != 10'b0100000101;
      default: IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2772 =
		   stage1_rg_stage_input[151:145] != 7'b0110111 &&
		   stage1_rg_stage_input[151:145] != 7'b0010111 &&
		   IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2768;
    endcase
  end
  always@(stage1_rg_stage_input or
	  rs1_val_bypassed__h5597 or
	  alu_outputs___1_val1__h10541 or
	  rd_val__h10633 or
	  alu_outputs___1_val1__h10570 or
	  alu_outputs___1_val1__h11011 or
	  rd_val__h10612 or
	  alu_outputs___1_val1__h10598 or alu_outputs___1_val1__h10983)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1520 =
	      alu_outputs___1_val1__h10541;
      7'b0010111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1520 =
	      rd_val__h10633;
      7'b0011011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1520 =
	      alu_outputs___1_val1__h10570;
      7'b0101111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1520 =
	      alu_outputs___1_val1__h11011;
      7'b0110111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1520 =
	      rd_val__h10612;
      7'b0111011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1520 =
	      alu_outputs___1_val1__h10598;
      7'b1110011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1520 =
	      alu_outputs___1_val1__h10983;
      default: IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1520 =
		   rs1_val_bypassed__h5597;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1522 or
	  x_out_cf_info_fallthru_PC__h16274)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100111, 7'b1101111:
	  x_out_data_to_stage2_val1__h10121 =
	      x_out_cf_info_fallthru_PC__h16274;
      default: x_out_data_to_stage2_val1__h10121 =
		   IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1522;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011, 7'b0000111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q21 = 3'd1;
      7'b0010011, 7'b0010111, 7'b0011011, 7'b0110011, 7'b0110111, 7'b0111011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q21 = 3'd0;
      7'b0100011, 7'b0100111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q21 = 3'd2;
      7'b0101111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q21 = 3'd4;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q21 = 3'd5;
    endcase
  end
  always@(stage1_rg_stage_input or
	  stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d794 or
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q21)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011, 7'b1100111, 7'b1101111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q22 = 3'd0;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q22 =
		   (stage1_rg_stage_input[151:145] == 7'b0110011 &&
		    stage1_rg_stage_input[104:98] == 7'b0000001 ||
		    stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d794) ?
		     3'd3 :
		     CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q21;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q23 = 2'd0;
      7'b1100111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q23 = 2'd2;
      7'b1101111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q23 = 2'd1;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q23 = 2'd3;
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
	496'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    stage3_rg_full = 1'h0;
    stage3_rg_stage3 =
	239'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
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
	$write(" sxl:%0d uxl:%0d", sxl__h6937, uxl__h6938);
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
	  (stage3_rg_stage3[69] || !stage3_rg_full || !stage3_rg_stage3[140]))
	$write("Rd -");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage3_rg_stage3[69] &&
	  stage3_rg_full &&
	  stage3_rg_stage3[140])
	$write("Rd %0d ", stage3_rg_stage3[139:135]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  (stage3_rg_stage3[69] || !stage3_rg_full || !stage3_rg_stage3[140]))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage3_rg_stage3[69] &&
	  stage3_rg_full &&
	  stage3_rg_stage3[140])
	$write("rd_val:%h", stage3_rg_stage3[134:71]);
    if (RST_N != `BSV_RESET_VALUE) if (WILL_FIRE_RL_rl_show_pipe) $write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        FBypass to Stage1: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("FBypass {");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  (!stage3_rg_stage3[69] || !stage3_rg_full ||
	   !stage3_rg_stage3[140]))
	$write("FRd -");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage3_rg_stage3[69] &&
	  stage3_rg_full &&
	  stage3_rg_stage3[140])
	$write("FRd %0d ", stage3_rg_stage3[139:135]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  (!stage3_rg_stage3[69] || !stage3_rg_full ||
	   !stage3_rg_stage3[140]))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage3_rg_stage3[69] &&
	  stage3_rg_full &&
	  stage3_rg_stage3[140])
	$write("frd_val:%h", stage3_rg_stage3[63:0]);
    if (RST_N != `BSV_RESET_VALUE) if (WILL_FIRE_RL_rl_show_pipe) $write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$display("    Stage2: pc 0x%08h instr 0x%08h priv %0d",
		 stage2_rg_stage2[493:430],
		 stage2_rg_stage2[429:398],
		 stage2_rg_stage2[495:494]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("Output_Stage2", " BUSY: pc:%0h", stage2_rg_stage2[493:430]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write("Output_Stage2", " NONPIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("Output_Stage2", " PIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full)
	$write("Output_Stage2", " EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("data_to_Stage3 {pc:%h  instr:%h  priv:%0d\n",
	       stage2_rg_stage2[493:430],
	       stage2_rg_stage2[429:398],
	       stage2_rg_stage2[495:494]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("        rd_valid:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d177)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  (stage2_rg_stage2[397:395] == 3'd0 ||
	   IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152) &&
	  stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d168 &&
	  (stage2_rg_stage2[397:395] == 3'd0 ||
	   IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d184))
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d168 &&
	  stage2_rg_stage2[397:395] != 3'd0 &&
	  stage2_rg_stage2[397:395] != 3'd1 &&
	  stage2_rg_stage2[397:395] != 3'd4 &&
	  stage2_rg_stage2[397:395] != 3'd2 &&
	  stage2_rg_stage2[397:395] != 3'd3)
	$write("  fflags: %05b",
	       "'h%h",
	       x_out_data_to_stage3_fpr_flags__h8344);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  (stage2_rg_stage2[397:395] == 3'd0 ||
	   IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152) &&
	  stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d168 &&
	  (stage2_rg_stage2[397:395] == 3'd0 ||
	   stage2_rg_stage2[397:395] == 3'd1 ||
	   stage2_rg_stage2[397:395] == 3'd4 ||
	   stage2_rg_stage2[397:395] == 3'd2 ||
	   stage2_rg_stage2[397:395] == 3'd3))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d215)
	$write("  frd:%0d  rd_val:%h\n",
	       x_out_data_to_stage3_rd__h8340,
	       x_out_data_to_stage3_frd_val__h8345);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d244)
	$write("  grd:%0d  rd_val:%h\n",
	       x_out_data_to_stage3_rd__h8340,
	       x_out_data_to_stage3_rd_val__h8341);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write("Trap_Info { ", "epc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write("'h%h", value__h8670);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write("'h%h", x_out_trap_info_exc_code__h8780);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write(", ", "tval: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write("'h%h", value__h8884, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write("Trap_Info { ", "epc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write("'h%h", value__h8670);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write("'h%h", x_out_trap_info_exc_code__h8780);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write(", ", "tval: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152 &&
	  NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156)
	$write("'h%h", value__h8884, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage2_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        Bypass  to Stage1: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("Bypass {");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  (!stage2_rg_full ||
	   stage2_rg_stage2[397:395] != 3'd0 &&
	   IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d273))
	$write("Rd -");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  (stage2_rg_stage2[397:395] == 3'd0 ||
	   IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d279))
	$write("Rd %0d ", x_out_bypass_rd__h9271);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  (!stage2_rg_full ||
	   stage2_rg_stage2[397:395] != 3'd0 &&
	   IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d273))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d279 &&
	  stage2_rg_stage2[397:395] != 3'd0 &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d290)
	$write("-");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  (stage2_rg_stage2[397:395] == 3'd0 ||
	   IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d279) &&
	  (stage2_rg_stage2[397:395] == 3'd0 ||
	   IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d297))
	$write("rd_val:%h", x_out_bypass_rd_val__h9272);
    if (RST_N != `BSV_RESET_VALUE) if (WILL_FIRE_RL_rl_show_pipe) $write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        FBypass to Stage1: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("FBypass {");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  (!stage2_rg_full || stage2_rg_stage2[397:395] == 3'd0 ||
	   IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d305))
	$write("FRd -");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  stage2_rg_stage2[397:395] != 3'd0 &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d310)
	$write("FRd %0d ", x_out_fbypass_rd__h9453);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  (!stage2_rg_full || stage2_rg_stage2[397:395] == 3'd0 ||
	   IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d305))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  stage2_rg_stage2[397:395] != 3'd0 &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d310 &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d319)
	$write("-");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  stage2_rg_stage2[397:395] != 3'd0 &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d310 &&
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d324)
	$write("frd_val:%h", x_out_fbypass_rd_val__h9454);
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
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("Output_Stage1",
	       " BUSY pc:%h",
	       stage1_rg_stage_input[401:338]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("Output_Stage1",
	       " NONPIPE: pc:%h",
	       stage1_rg_stage_input[401:338]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("Output_Stage1");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full)
	$write("Output_Stage1", " EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write(" PIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d990)
	$write("CONTROL_STRAIGHT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d998)
	$write("CONTROL_BRANCH");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1009)
	$write("CONTROL_CSRR_W");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1024)
	$write("CONTROL_CSRR_S_or_C");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1042)
	$write("CONTROL_FENCE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1056)
	$write("CONTROL_FENCE_I");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1073)
	$write("CONTROL_SFENCE_VMA");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1088)
	$write("CONTROL_MRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1113)
	$write("CONTROL_SRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1135)
	$write("CONTROL_WFI");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1219)
	$write("CONTROL_TRAP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334)
	$write("CONTROL_DISCARD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1230)
	$write("{", "CF_None");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1238)
	$write("{", "BR ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1243)
	$write("{");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1230)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1238)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1249)
	$write("JAL [%h->%h/%h]",
	       stage1_rg_stage_input[401:338],
	       x_out_cf_info_taken_PC__h16275,
	       x_out_cf_info_fallthru_PC__h16274);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1278)
	$write("JALR [%h->%h/%h]",
	       stage1_rg_stage_input[401:338],
	       x_out_cf_info_taken_PC__h16275,
	       x_out_cf_info_fallthru_PC__h16274);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1230)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1238)
	if (stage1_rg_stage_input[151:145] != 7'b1100011 ||
	    IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d432)
	  $write("taken ");
	else
	  $write("fallthru ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1243)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1230)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1238)
	$write("[%h->%h %h]",
	       stage1_rg_stage_input[401:338],
	       x_out_cf_info_fallthru_PC__h16274,
	       x_out_cf_info_taken_PC__h16275);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1243)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("data_to_Stage 2 {pc:%h  instr:%h  priv:%0d\n",
	       stage1_rg_stage_input[401:338],
	       stage1_rg_stage_input[263:232],
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("            op_stage2:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1300)
	$write("OP_Stage2_ALU");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1317)
	$write("OP_Stage2_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1335)
	$write("OP_Stage2_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1368)
	$write("OP_Stage2_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1375)
	$write("OP_Stage2_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1401)
	$write("OP_Stage2_FD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("  rd:%0d\n", x_out_data_to_stage2_rd__h10119);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("            addr:%h  val1:%h  val2:%h}",
	       x_out_data_to_stage2_addr__h10120,
	       x_out_data_to_stage2_val1__h10121,
	       x_out_data_to_stage2_val2__h10122);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("            fval1:%h  fval2:%h  fval3:%h}",
	       x_out_data_to_stage2_fval1__h10123,
	       alu_outputs___1_fval2__h10701,
	       x_out_data_to_stage2_fval3__h10125);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d1588)
	$write("CONTROL_STRAIGHT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d995)
	$write("CONTROL_BRANCH");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1007)
	$write("CONTROL_CSRR_W");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1022)
	$write("CONTROL_CSRR_S_or_C");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1040)
	$write("CONTROL_FENCE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1054)
	$write("CONTROL_FENCE_I");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1071)
	$write("CONTROL_SFENCE_VMA");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1086)
	$write("CONTROL_MRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1111)
	$write("CONTROL_SRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1133)
	$write("CONTROL_WFI");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1216)
	$write("CONTROL_TRAP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("Trap_Info { ", "epc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("'h%h", stage1_rg_stage_input[401:338]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("'h%h", x_out_trap_info_exc_code__h15122);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write(", ", "tval: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d778)
	$write("'h%h", value__h15187, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d974)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1660)
	$write("\n        redirect next_pc:%h", x_out_next_pc__h9864);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1664)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$display("    StageD: pc 0x%08h instr 0x%08h priv %0d epoch %0d",
		 stageD_rg_data[233:170],
		 x_out_data_to_stage1_instr__h17651,
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
	       x_out_data_to_stage1_instr__h17651,
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
		 d_instr__h25360,
		 stageF_rg_priv,
		 stageF_rg_epoch);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("Output_StageF");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2112))
	$write(" BUSY: pc:%h", imem_rg_pc);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119)
	$write(" PIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write(" EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2112))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119)
	$write("data_to_StageD {pc:%h  priv:%0d  epoch:%0d",
	       imem_rg_pc,
	       stageF_rg_priv,
	       stageF_rg_epoch);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2112))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc)
	$write("  ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_094_AND_near_mem_imem_valid_AND_ETC___d2126)
	$write("  instr:%h  pred_pc:%h",
	       d_instr__h25360,
	       stageF_branch_predictor$predict_rsp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2112))
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
	  near_mem_imem_valid_AND_near_mem_imem_exc__1_A_ETC___d2214)
	$write("unknown trap Exc_Code %d", near_mem$imem_exc_code);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_094_AND_near_mem_imem_valid_AND_ETC___d2126)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2112))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2119)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $display("----------------");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage2_nonpipe &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage2_nonpipe -> CPU_TRAP",
		 csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_trap &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage1_trap", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  rg_trap_info_787_BITS_131_TO_68_788_EQ_csr_reg_ETC___d2797)
	$display("%0d: %m.rl_stage1_trap: Tight infinite trap loop: pc 0x%0x instr 0x%08x",
		 csr_regfile$read_csr_mcycle,
		 csr_regfile$csr_trap_actions[193:130],
		 rg_trap_instr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  rg_trap_info_787_BITS_131_TO_68_788_EQ_csr_reg_ETC___d2797)
	$display("CPI: %0d.%0d = (%0d/%0d) since last 'continue'",
		 cpi__h33879,
		 cpifrac__h33880,
		 delta_CPI_cycles__h33875,
		 _theResult____h33877);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  rg_trap_info_787_BITS_131_TO_68_788_EQ_csr_reg_ETC___d2797)
	$finish(32'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  (cur_verbosity__h3946 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 rg_trap_info[131:68],
		 rg_trap_instr,
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap && cur_verbosity__h3946 != 4'd0)
	$display("    mcause:0x%0h  epc 0x%0h  tval:0x%0h  next_pc 0x%0h, new_priv %0d new_mstatus 0x%0h",
		 csr_regfile$csr_trap_actions[65:2],
		 rg_trap_info[131:68],
		 rg_trap_info[63:0],
		 csr_regfile$csr_trap_actions[193:130],
		 csr_regfile$csr_trap_actions[1:0],
		 csr_regfile$csr_trap_actions[129:66]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage1_CSRR_W", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W_2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage1_CSRR_W_2", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W_2 && csr_regfile$access_permitted_1 &&
	  (cur_verbosity__h3946 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 rg_csr_pc,
		 rg_trap_instr,
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W_2 && csr_regfile$access_permitted_1 &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    S1: write CSRRW/CSRRWI Rs1 %0d Rs1_val 0x%0h csr 0x%0h csr_val 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h34495,
		 rg_trap_instr[31:20],
		 csr_regfile$read_csr[63:0],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W_2 &&
	  !csr_regfile$access_permitted_1 &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    Trap on CSR permissions: Rs1 %0d Rs1_val 0x%0h csr 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h34495,
		 rg_trap_instr[31:20],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage1_CSRR_S_or_C",
		 csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage1_CSRR_S_or_C_2",
		 csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	  csr_regfile$access_permitted_2 &&
	  (cur_verbosity__h3946 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 rg_csr_pc,
		 rg_trap_instr,
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	  csr_regfile$access_permitted_2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    S1: write CSRR_S_or_C: Rs1 %0d Rs1_val 0x%0h csr 0x%0h csr_val 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h35329,
		 rg_trap_instr[31:20],
		 csr_regfile$read_csr[63:0],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	  !csr_regfile$access_permitted_2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    Trap on CSR permissions: Rs1 %0d Rs1_val 0x%0h csr 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h35329,
		 rg_trap_instr[31:20],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_restart_after_csrrx &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage1_restart_after_csrrx",
		 csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_restart_after_csrrx &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h26813,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_restart_after_csrrx &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_restart_after_csrrx &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_restart_after_csrrx &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h26813);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_xRET &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage1_xRET", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_xRET &&
	  (cur_verbosity__h3946 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_xRET && cur_verbosity__h3946 != 4'd0)
	$display("    xRET: next_pc:0x%0h  new mstatus:0x%0h  new priv:%0d",
		 csr_regfile$csr_ret_actions[129:66],
		 csr_regfile$csr_ret_actions[63:0],
		 csr_regfile$csr_ret_actions[65:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage1_FENCE_I", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_finish_FENCE_I", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  (cur_verbosity__h3946 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h26813,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h26813);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage1_FENCE", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_finish_FENCE", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  (cur_verbosity__h3946 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h26813,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h26813);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_SFENCE_VMA &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage1_SFENCE_VMA", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_SFENCE_VMA &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_finish_SFENCE_VMA", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_SFENCE_VMA &&
	  (cur_verbosity__h3946 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_SFENCE_VMA &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h26813,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_SFENCE_VMA &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_SFENCE_VMA &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_SFENCE_VMA &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h26813);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_WFI &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage1_WFI", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_WFI &&
	  (cur_verbosity__h3946 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_WFI &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    CPU.rl_stage1_WFI");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_WFI_resume &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_WFI_resume", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_WFI_resume &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h26813,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_WFI_resume &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_WFI_resume &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_WFI_resume &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h26813);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_from_WFI &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_reset_from_WFI", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap_fetch &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h26813,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap_fetch &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap_fetch &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap_fetch &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h26813);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_interrupt &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage1_interrupt", csr_regfile$read_csr_mcycle);
    if (WILL_FIRE_RL_imem_rl_assert_fail)
      begin
        v__h2667 = $stime;
	#0;
      end
    v__h2661 = v__h2667 / 32'd10;
    if (WILL_FIRE_RL_imem_rl_assert_fail)
      $display("%0d: ERROR: CPU_Fetch_C: imem32.is_i32_not_i16 is False",
	       v__h2661);
    if (WILL_FIRE_RL_imem_rl_assert_fail) $finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset)
	$display("%0d: %m.rl_reset_complete: restart at PC = 0x%0h",
		 csr_regfile$read_csr_mcycle,
		 soc_map$m_pc_reset_value);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       soc_map$m_pc_reset_value,
	       new_epoch__h26813,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_minstret,
		 soc_map$m_pc_reset_value,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h26813);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && !rg_run_on_reset)
	$display("%0d: %m.rl_reset_complete: entering DEBUG_MODE",
		 csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_pipe", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe && stage3_rg_full && stage3_rg_stage3[140] &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	  stage3_rg_stage3[69])
	$display("    S3.fa_deq: write FRd 0x%0h, rd_val 0x%0h",
		 stage3_rg_stage3[139:135],
		 stage3_rg_stage3[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe && stage3_rg_full && stage3_rg_stage3[140] &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	  !stage3_rg_stage3[69])
	$display("    S3.fa_deq: write GRd 0x%0h, rd_val 0x%0h",
		 stage3_rg_stage3[139:135],
		 stage3_rg_stage3[134:71]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2376)
	$write("    S3.enq: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2376)
	$write("data_to_Stage3 {pc:%h  instr:%h  priv:%0d\n",
	       stage2_rg_stage2[493:430],
	       stage2_rg_stage2[429:398],
	       stage2_rg_stage2[495:494]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2376)
	$write("        rd_valid:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_IF_stage2_rg_stage2_15_B_ETC___d2379)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2381)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2383)
	$write("  fflags: %05b",
	       "'h%h",
	       x_out_data_to_stage3_fpr_flags__h8344);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2385)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2387)
	$write("  frd:%0d  rd_val:%h\n",
	       x_out_data_to_stage3_rd__h8340,
	       x_out_data_to_stage3_frd_val__h8345);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2389)
	$write("  grd:%0d  rd_val:%h\n",
	       x_out_data_to_stage3_rd__h8340,
	       x_out_data_to_stage3_rd_val__h8341);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2376)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2395)
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage2_rg_stage2[493:430],
		 stage2_rg_stage2[429:398],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  (stage2_rg_stage2[397:395] == 3'd0 ||
	   IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2299 ||
	   !stage2_rg_full) &&
	  stage1_rg_full &&
	  !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    rl_pipe: Discarding stage1 due to redirection");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2601)
	$write("    CPU_Stage2.enq (Data_Stage1_to_Stage2) ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2601)
	$write("data_to_Stage 2 {pc:%h  instr:%h  priv:%0d\n",
	       stage1_rg_stage_input[401:338],
	       stage1_rg_stage_input[263:232],
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2601)
	$write("            op_stage2:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2605)
	$write("OP_Stage2_ALU");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2609)
	$write("OP_Stage2_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2613)
	$write("OP_Stage2_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2618)
	$write("OP_Stage2_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2622)
	$write("OP_Stage2_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2401 &&
	  stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2303 &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2626)
	$write("OP_Stage2_FD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2601)
	$write("  rd:%0d\n", x_out_data_to_stage2_rd__h10119);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2601)
	$write("            addr:%h  val1:%h  val2:%h}",
	       x_out_data_to_stage2_addr__h10120,
	       x_out_data_to_stage2_val1__h10121,
	       x_out_data_to_stage2_val2__h10122);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2601)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2601)
	$write("            fval1:%h  fval2:%h  fval3:%h}",
	       x_out_data_to_stage2_fval1__h10123,
	       alu_outputs___1_fval2__h10701,
	       x_out_data_to_stage2_fval3__h10125);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2601)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2634 &&
	  stageD_rg_full &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    CPU_Stage1.enq: 0x%08h", stageD_rg_data[233:170]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    CPU_StageD.enq (Data_StageF_to_StageD)");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	  csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       stageF_branch_predictor$predict_rsp,
	       stageF_rg_epoch,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	  csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	  csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
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