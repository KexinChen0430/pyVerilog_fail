module outputs
  wire [511 : 0] dma_server_rdata;
  wire [63 : 0] imem_master_araddr,
		imem_master_awaddr,
		imem_master_wdata,
		mem_master_araddr,
		mem_master_awaddr,
		mem_master_wdata,
		mv_tohost_value;
  wire [15 : 0] dma_server_bid,
		dma_server_rid,
		imem_master_arid,
		imem_master_awid,
		mem_master_arid,
		mem_master_awid;
  wire [7 : 0] imem_master_arlen,
	       imem_master_awlen,
	       imem_master_wstrb,
	       mem_master_arlen,
	       mem_master_awlen,
	       mem_master_wstrb,
	       mv_status;
  wire [3 : 0] imem_master_arcache,
	       imem_master_arqos,
	       imem_master_arregion,
	       imem_master_awcache,
	       imem_master_awqos,
	       imem_master_awregion,
	       mem_master_arcache,
	       mem_master_arqos,
	       mem_master_arregion,
	       mem_master_awcache,
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
		near_mem$dma_server_rid,
		near_mem$imem_master_arid,
		near_mem$imem_master_awid,
		near_mem$imem_master_bid,
		near_mem$imem_master_rid,
		near_mem$mem_master_arid,
		near_mem$mem_master_awid,
		near_mem$mem_master_bid,
		near_mem$mem_master_rid;
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
	       near_mem$imem_master_arqos,
	       near_mem$imem_master_arregion,
	       near_mem$imem_master_awcache,
	       near_mem$imem_master_awqos,
	       near_mem$imem_master_awregion,
	       near_mem$mem_master_arcache,
	       near_mem$mem_master_arqos,
	       near_mem$mem_master_arregion,
	       near_mem$mem_master_awcache,
	       near_mem$mem_master_awqos,
	       near_mem$mem_master_awregion;
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
		MUX_imem_rg_tval$write_1__VAL_2,
		MUX_imem_rg_tval$write_1__VAL_3,
		MUX_imem_rg_tval$write_1__VAL_4,
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
       MUX_imem_rg_cache_b16$write_1__PSEL_1,
       MUX_rg_next_pc$write_1__SEL_1,
       MUX_rg_next_pc$write_1__SEL_2,
       MUX_rg_state$write_1__PSEL_1,
       MUX_rg_state$write_1__SEL_1,
       MUX_rg_state$write_1__SEL_2,
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
  reg [31 : 0] v__h2440;
  reg [31 : 0] v__h2434;
  // synopsys translate_on
  // remaining internal signals
  reg [63 : 0] CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q19,
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q20,
	       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1530,
	       _theResult_____1_fst__h12333,
	       alu_outputs___1_val1__h10371,
	       rs1_val__h35054,
	       value__h8443,
	       value__h8657,
	       x_out_bypass_rd_val__h9045,
	       x_out_cf_info_taken_PC__h16066,
	       x_out_data_to_stage2_addr__h9893,
	       x_out_data_to_stage2_val1__h9894,
	       x_out_data_to_stage3_frd_val__h8118,
	       x_out_data_to_stage3_rd_val__h8114,
	       x_out_fbypass_rd_val__h9227;
  reg [4 : 0] data_to_stage2_rd__h9875,
	      x_out_bypass_rd__h9044,
	      x_out_data_to_stage3_fpr_flags__h8117,
	      x_out_data_to_stage3_rd__h8113,
	      x_out_fbypass_rd__h9226;
  reg [3 : 0] CASE_rg_cur_priv_0b0_8_0b1_9_11__q15,
	      CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q16,
	      alu_outputs_exc_code__h11528,
	      x_out_trap_info_exc_code__h8553;
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
      IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d775,
      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2768,
      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d2772,
      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d756,
      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d764,
      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d962,
      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d970,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d175,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d184,
      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296,
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
		IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d1270,
		IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1531,
		IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1532,
		IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1541,
		SEXT_stage1_rg_stage_input_32_BITS_87_TO_76_057___d1269,
		_theResult_____1_fst__h12326,
		_theResult_____1_fst__h12361,
		_theResult____h33602,
		_theResult___fst__h12497,
		_theResult___fst__h12504,
		_theResult___fst__h12585,
		_theResult___snd_fst_rd_val__h9208,
		_theResult___snd_snd__h16492,
		_theResult___snd_snd_rd_val__h8063,
		addr_of_b32___1__h32186,
		addr_of_b32___1__h43719,
		addr_of_b32__h32058,
		addr_of_b32__h43591,
		alu_outputs___1_addr__h10096,
		alu_outputs___1_addr__h10470,
		alu_outputs___1_fval1__h11500,
		alu_outputs___1_fval2__h10474,
		alu_outputs___1_fval3__h11502,
		alu_outputs___1_val1__h10269,
		alu_outputs___1_val1__h10314,
		alu_outputs___1_val1__h10343,
		alu_outputs___1_val1__h10756,
		alu_outputs___1_val1__h10784,
		alu_outputs_cf_info_taken_PC__h16058,
		branch_target__h10074,
		cpi__h33604,
		cpifrac__h33605,
		data_to_stage2_addr__h9876,
		data_to_stage2_val2__h9878,
		delta_CPI_cycles__h33600,
		delta_CPI_instrs___1__h33646,
		delta_CPI_instrs__h33601,
		fall_through_pc__h9619,
		next_pc___1__h13758,
		next_pc__h10109,
		next_pc__h10144,
		next_pc__h13755,
		next_pc__h9620,
		output_stage2___1_data_to_stage3_frd_val__h7992,
		rd_val___1__h12241,
		rd_val___1__h12322,
		rd_val___1__h12329,
		rd_val___1__h12336,
		rd_val___1__h12343,
		rd_val___1__h12350,
		rd_val___1__h16521,
		rd_val___1__h16552,
		rd_val___1__h16584,
		rd_val___1__h16613,
		rd_val___1__h16665,
		rd_val___1__h16713,
		rd_val___1__h16719,
		rd_val___1__h16764,
		rd_val__h10385,
		rd_val__h10406,
		rd_val__h16393,
		rd_val__h16444,
		rd_val__h16466,
		rd_val__h9457,
		rd_val__h9490,
		rd_val__h9523,
		rd_val__h9554,
		rd_val__h9588,
		rs1_val__h34220,
		rs1_val_bypassed__h5370,
		rs2_val_bypassed__h5376,
		trap_info_tval__h14908,
		val__h9459,
		val__h9492,
		value__h14978,
		x__h33603,
		x_out_cf_info_fallthru_PC__h16065,
		x_out_data_to_stage2_fval1__h9896,
		x_out_data_to_stage2_fval3__h9898,
		x_out_data_to_stage2_val2__h9895,
		x_out_next_pc__h9637,
		y__h35332;
  wire [31 : 0] IF_NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem__ETC___d2099,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1940,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1941,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1942,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1943,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1944,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1945,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1946,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1948,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1950,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1952,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1954,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1955,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1956,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1958,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1959,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1960,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1962,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1964,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1965,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1967,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1968,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1969,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1970,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1971,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1972,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1973,
		IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1974,
		IF_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg_p_ETC___d2100,
		IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC__q18,
		_theResult____h5654,
		d_instr__h25151,
		instr___1__h17516,
		instr__h17693,
		instr__h17838,
		instr__h18030,
		instr__h18225,
		instr__h18454,
		instr__h18907,
		instr__h19023,
		instr__h19088,
		instr__h19405,
		instr__h19743,
		instr__h19927,
		instr__h20056,
		instr__h20283,
		instr__h20538,
		instr__h20710,
		instr__h20879,
		instr__h21068,
		instr__h21257,
		instr__h21374,
		instr__h21552,
		instr__h21671,
		instr__h21766,
		instr__h21902,
		instr__h22038,
		instr__h22174,
		instr__h22312,
		instr__h22450,
		instr__h22608,
		instr__h22704,
		instr__h22857,
		instr__h23056,
		instr__h23207,
		instr__h23412,
		instr__h24212,
		instr__h24377,
		instr__h24576,
		instr__h24727,
		instr_out___1__h25153,
		instr_out___1__h25175,
		rs1_val_bypassed370_BITS_31_TO_0_MINUS_rs2_val_ETC__q10,
		rs1_val_bypassed370_BITS_31_TO_0_PLUS_rs2_val__ETC__q9,
		rs1_val_bypassed370_BITS_31_TO_0_SRL_rs2_val_b_ETC__q8,
		rs1_val_bypassed370_BITS_31_TO_0__q7,
		tmp__h16612,
		v32__h10383,
		x__h16555,
		x__h16587,
		x__h16722,
		x__h16767,
		x_out_data_to_stage1_instr__h17442;
  wire [20 : 0] SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1747,
		decoded_instr_imm21_UJ__h30483,
		stage1_rg_stage_input_BITS_30_TO_10__q2;
  wire [19 : 0] imm20__h19795;
  wire [12 : 0] SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1772,
		decoded_instr_imm13_SB__h30481,
		stage1_rg_stage_input_BITS_63_TO_51__q1;
  wire [11 : 0] decoded_instr_imm12_S__h30480,
		imm12__h17694,
		imm12__h18031,
		imm12__h19667,
		imm12__h20336,
		imm12__h20551,
		imm12__h20747,
		imm12__h21084,
		imm12__h22705,
		imm12__h23057,
		offset__h18401,
		stage1_rg_stage_input_BITS_75_TO_64__q6,
		stage1_rg_stage_input_BITS_87_TO_76__q17;
  wire [9 : 0] decoded_instr_funct10__h30478,
	       nzimm10__h20334,
	       nzimm10__h20549;
  wire [8 : 0] offset__h19032, offset__h22619;
  wire [7 : 0] offset__h17566, offset__h22991;
  wire [6 : 0] offset__h17973;
  wire [5 : 0] imm6__h19665, shamt__h10256;
  wire [4 : 0] offset_BITS_4_TO_0___h17962,
	       offset_BITS_4_TO_0___h18393,
	       offset_BITS_4_TO_0___h23332,
	       rd__h18033,
	       rs1__h18032,
	       x_out_data_to_stage2_rd__h9892;
  wire [3 : 0] alu_outputs___1_exc_code__h10752,
	       cur_verbosity__h3719,
	       x_exc_code__h44015,
	       x_out_trap_info_exc_code__h14913;
  wire [2 : 0] rm__h10057;
  wire [1 : 0] new_epoch__h26600, sxl__h6710, uxl__h6711;
  wire IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1667,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2307,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2310,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2322,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2634,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2728,
       IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2344,
       IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2402,
       IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2589,
       IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d343,
       IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d344,
       IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d347,
       IF_stage1_rg_full_31_THEN_stage1_rg_stage_inpu_ETC___d2897,
       IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d2764,
       IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d421,
       IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d423,
       IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d425,
       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769,
       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781,
       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975,
       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979,
       IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d337,
       IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d339,
       NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2295,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2303,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2312,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2316,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2339,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2343,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2404,
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
       NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d2462,
       NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d2505,
       NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d857,
       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2082,
       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2096,
       NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2115,
       NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2122,
       NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d1114,
       NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d1136,
       NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d1211,
       NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d1655,
       NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d2758,
       NOT_rg_next_pc_867_BITS_1_TO_0_868_EQ_0b0_869__ETC___d2875,
       NOT_rg_run_on_reset_257_258_OR_imem_rg_pc_BITS_ETC___d2265,
       NOT_stage1_rg_stage_input_32_BITS_109_TO_105_2_ETC___d559,
       NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1167,
       NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1174,
       NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d479,
       NOT_stage1_rg_stage_input_32_BITS_144_TO_140_0_ETC___d1179,
       NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d2774,
       NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d449,
       NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d766,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1240,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1248,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1253,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1259,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1310,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1670,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1674,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2331,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2933,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2935,
       NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984,
       NOT_stage1_rg_stage_input_32_BITS_99_TO_98_74__ETC___d753,
       NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1014,
       NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1029,
       NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1078,
       NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1139,
       NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d2884,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1229,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1307,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1345,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784,
       NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995,
       NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d148,
       NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d156,
       NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d177,
       NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d289,
       NOT_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ__ETC___d402,
       NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d2707,
       _0_OR_stage1_rg_stage_input_32_BITS_104_TO_98_3_ETC___d2485,
       csr_regfile_RDY_server_reset_request_put__229__ETC___d2241,
       csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2685,
       csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693,
       csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2735,
       csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2739,
       csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2938,
       csr_regfile_read_misa__6_BIT_2_682_AND_stageD__ETC___d1757,
       csr_regfile_read_misa__6_BIT_2_682_AND_stageD__ETC___d1763,
       csr_regfile_read_mstatus__9_BITS_14_TO_13_1_EQ_ETC___d573,
       gpr_regfile_RDY_server_reset_request_put__226__ETC___d2244,
       imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d2119,
       imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2261,
       imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d2074,
       imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17,
       near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2127,
       near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129,
       near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_076___d2077,
       near_mem_imem_valid_AND_near_mem_imem_exc__1_A_ETC___d2224,
       rg_cur_priv_8_EQ_0b11_069_OR_rg_cur_priv_8_EQ__ETC___d1134,
       rg_cur_priv_8_EQ_0b11_069_OR_rg_cur_priv_8_EQ__ETC___d1199,
       rg_cur_priv_8_EQ_0b11_069_OR_rg_cur_priv_8_EQ__ETC___d1213,
       rg_cur_priv_8_EQ_0b11_069_OR_rg_cur_priv_8_EQ__ETC___d1645,
       rg_state_7_EQ_12_4_AND_csr_regfile_wfi_resume__ETC___d2922,
       rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2753,
       rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2779,
       rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2814,
       rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2817,
       rg_state_7_EQ_3_323_AND_stage3_rg_full_8_OR_st_ETC___d2335,
       rg_state_7_EQ_5_926_AND_NOT_stageF_rg_full_104_ETC___d2927,
       rg_state_7_EQ_8_864_AND_NOT_stageF_rg_full_104_ETC___d2865,
       rg_trap_info_787_BITS_131_TO_68_788_EQ_csr_reg_ETC___d2797,
       stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1000,
       stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1008,
       stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1327,
       stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1385,
       stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1411,
       stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d2424,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d875,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d884,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d892,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d899,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d926,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d937,
       stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d943,
       stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1045,
       stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1059,
       stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d812,
       stage1_rg_stage_input_32_BITS_144_TO_140_037_E_ETC___d1075,
       stage1_rg_stage_input_32_BITS_144_TO_140_037_E_ETC___d1113,
       stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d1351,
       stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d2892,
       stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d800,
       stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d972,
       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d1408,
       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d1598,
       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2340,
       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2626,
       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334,
       stage1_rg_stage_input_32_BITS_99_TO_98_74_EQ_0_ETC___d2445,
       stage1_rg_stage_input_32_BITS_99_TO_98_74_EQ_0_ETC___d959,
       stage1_rg_stage_input_32_BIT_332_77_OR_NOT_rg__ETC___d1106,
       stage2_rg_full_14_AND_IF_stage2_rg_stage2_15_B_ETC___d2376,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1005,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1016,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1017,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1019,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1031,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1032,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1034,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1049,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1050,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1052,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1063,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1064,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1066,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1080,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1081,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1083,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1095,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1096,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1098,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1119,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1120,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1121,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1123,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1141,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1142,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1143,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1145,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1218,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1219,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1220,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1223,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1224,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1225,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1226,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1288,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1342,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1360,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1370,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1375,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1378,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1389,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1405,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1565,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2292,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2614,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349,
       stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2373,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2378,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2380,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2382,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2384,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2386,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2392,
       stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d405,
       stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d168,
       stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d215,
       stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d244,
       stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_2_21_ETC___d296,
       stage3_rg_full_8_OR_NOT_stage2_rg_full_14_71_O_ETC___d2334,
       stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d407,
       stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d415,
       stageF_f_reset_rsps_i_notEmpty__251_AND_stageD_ETC___d2271,
       stageF_rg_full_104_AND_near_mem_imem_valid_AND_ETC___d2136;
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
		      .RDY_server_fence_i_request_put(),
		      .RDY_server_fence_i_response_get(),
		      .RDY_server_fence_request_put(),
		      .RDY_server_fence_response_get(),
		      .RDY_sfence_vma_server_request_put(),
		      .RDY_sfence_vma_server_response_get(),
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
	     rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2779 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129) ;
  assign WILL_FIRE_RL_rl_stage1_trap = CAN_FIRE_RL_rl_stage1_trap ;
  // rule RL_rl_trap
  assign CAN_FIRE_RL_rl_trap =
	     rg_state == 4'd4 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129) ;
  assign WILL_FIRE_RL_rl_trap = CAN_FIRE_RL_rl_trap ;
  // rule RL_rl_stage1_CSRR_W
  assign CAN_FIRE_RL_rl_stage1_CSRR_W =
	     rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2817 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1014 ;
  assign WILL_FIRE_RL_rl_stage1_CSRR_W = CAN_FIRE_RL_rl_stage1_CSRR_W ;
  // rule RL_rl_stage1_CSRR_W_2
  assign CAN_FIRE_RL_rl_stage1_CSRR_W_2 = rg_state == 4'd6 ;
  assign WILL_FIRE_RL_rl_stage1_CSRR_W_2 = rg_state == 4'd6 ;
  // rule RL_rl_stage1_CSRR_S_or_C
  assign CAN_FIRE_RL_rl_stage1_CSRR_S_or_C =
	     rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2817 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1029 ;
  assign WILL_FIRE_RL_rl_stage1_CSRR_S_or_C =
	     CAN_FIRE_RL_rl_stage1_CSRR_S_or_C ;
  // rule RL_rl_stage1_CSRR_S_or_C_2
  assign CAN_FIRE_RL_rl_stage1_CSRR_S_or_C_2 = rg_state == 4'd7 ;
  assign WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 = rg_state == 4'd7 ;
  // rule RL_rl_stage1_restart_after_csrrx
  assign CAN_FIRE_RL_rl_stage1_restart_after_csrrx =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2261 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state_7_EQ_8_864_AND_NOT_stageF_rg_full_104_ETC___d2865 ;
  assign WILL_FIRE_RL_rl_stage1_restart_after_csrrx =
	     CAN_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // rule RL_rl_stage1_xRET
  assign CAN_FIRE_RL_rl_stage1_xRET =
	     rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2753 &&
	     stage1_rg_full &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2340 &&
	     IF_stage1_rg_full_31_THEN_stage1_rg_stage_inpu_ETC___d2897 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129) ;
  assign WILL_FIRE_RL_rl_stage1_xRET = CAN_FIRE_RL_rl_stage1_xRET ;
  // rule RL_rl_stage1_FENCE_I
  assign CAN_FIRE_RL_rl_stage1_FENCE_I =
	     rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2817 &&
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b0001111 &&
	     stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1059 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129) ;
  assign WILL_FIRE_RL_rl_stage1_FENCE_I = CAN_FIRE_RL_rl_stage1_FENCE_I ;
  // rule RL_rl_finish_FENCE_I
  assign CAN_FIRE_RL_rl_finish_FENCE_I =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2261 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state == 4'd9 ;
  assign WILL_FIRE_RL_rl_finish_FENCE_I = CAN_FIRE_RL_rl_finish_FENCE_I ;
  // rule RL_rl_stage1_FENCE
  assign CAN_FIRE_RL_rl_stage1_FENCE =
	     rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2817 &&
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b0001111 &&
	     stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1045 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129) ;
  assign WILL_FIRE_RL_rl_stage1_FENCE = CAN_FIRE_RL_rl_stage1_FENCE ;
  // rule RL_rl_finish_FENCE
  assign CAN_FIRE_RL_rl_finish_FENCE =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2261 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state == 4'd10 ;
  assign WILL_FIRE_RL_rl_finish_FENCE = CAN_FIRE_RL_rl_finish_FENCE ;
  // rule RL_rl_stage1_SFENCE_VMA
  assign CAN_FIRE_RL_rl_stage1_SFENCE_VMA =
	     rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2817 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1078 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129) ;
  assign WILL_FIRE_RL_rl_stage1_SFENCE_VMA =
	     CAN_FIRE_RL_rl_stage1_SFENCE_VMA ;
  // rule RL_rl_finish_SFENCE_VMA
  assign CAN_FIRE_RL_rl_finish_SFENCE_VMA =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2261 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state == 4'd11 ;
  assign WILL_FIRE_RL_rl_finish_SFENCE_VMA =
	     CAN_FIRE_RL_rl_finish_SFENCE_VMA ;
  // rule RL_rl_stage1_WFI
  assign CAN_FIRE_RL_rl_stage1_WFI =
	     rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2817 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1139 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129) ;
  assign WILL_FIRE_RL_rl_stage1_WFI = CAN_FIRE_RL_rl_stage1_WFI ;
  // rule RL_rl_WFI_resume
  assign CAN_FIRE_RL_rl_WFI_resume =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2261 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state_7_EQ_12_4_AND_csr_regfile_wfi_resume__ETC___d2922 ;
  assign WILL_FIRE_RL_rl_WFI_resume = CAN_FIRE_RL_rl_WFI_resume ;
  // rule RL_rl_reset_from_WFI
  assign CAN_FIRE_RL_rl_reset_from_WFI =
	     rg_state == 4'd12 && f_reset_reqs$EMPTY_N ;
  assign WILL_FIRE_RL_rl_reset_from_WFI =
	     CAN_FIRE_RL_rl_reset_from_WFI && !WILL_FIRE_RL_rl_WFI_resume ;
  // rule RL_rl_trap_fetch
  assign CAN_FIRE_RL_rl_trap_fetch =
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2261 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state_7_EQ_5_926_AND_NOT_stageF_rg_full_104_ETC___d2927 ;
  assign WILL_FIRE_RL_rl_trap_fetch = CAN_FIRE_RL_rl_trap_fetch ;
  // rule RL_rl_stage1_interrupt
  assign CAN_FIRE_RL_rl_stage1_interrupt =
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2938 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129) ;
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
	     stageF_f_reset_rsps_i_notEmpty__251_AND_stageD_ETC___d2271 &&
	     rg_state == 4'd1 ;
  assign WILL_FIRE_RL_rl_reset_complete = MUX_rg_state$write_1__SEL_2 ;
  // rule RL_rl_pipe
  assign CAN_FIRE_RL_rl_pipe =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2322 &&
	     rg_state_7_EQ_3_323_AND_stage3_rg_full_8_OR_st_ETC___d2335 &&
	     (NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2343 ||
	      IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2344 ||
	      stage2_rg_full ||
	      stage3_rg_full) ;
  assign WILL_FIRE_RL_rl_pipe = MUX_rg_state$write_1__PSEL_1 ;
  // rule RL_rl_reset_start
  assign CAN_FIRE_RL_rl_reset_start =
	     gpr_regfile_RDY_server_reset_request_put__226__ETC___d2244 &&
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
  assign MUX_imem_rg_cache_b16$write_1__PSEL_1 =
	     WILL_FIRE_RL_rl_trap_fetch || WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  assign MUX_rg_next_pc$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2630 ;
  assign MUX_rg_next_pc$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_stage1_WFI || WILL_FIRE_RL_rl_stage1_FENCE ||
	     WILL_FIRE_RL_rl_stage1_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W ||
	     WILL_FIRE_RL_rl_stage1_SFENCE_VMA ;
  assign MUX_rg_state$write_1__PSEL_1 =
	     CAN_FIRE_RL_rl_pipe && !WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  assign MUX_rg_state$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2316 ;
  assign MUX_rg_state$write_1__SEL_2 =
	     CAN_FIRE_RL_rl_reset_complete &&
	     !WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  assign MUX_rg_state$write_1__SEL_8 =
	     WILL_FIRE_RL_rl_stage1_interrupt ||
	     WILL_FIRE_RL_rl_stage1_trap ||
	     WILL_FIRE_RL_rl_stage2_nonpipe ;
  assign MUX_rg_state$write_1__SEL_9 =
	     WILL_FIRE_RL_rl_stage1_xRET || WILL_FIRE_RL_rl_trap ;
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
	  y__h35332 or
	  IF_csr_regfile_read_csr_rg_trap_instr_798_BITS_ETC___d2856)
  begin
    case (rg_trap_instr[14:12])
      3'b010, 3'b110:
	  MUX_csr_regfile$mav_csr_write_2__VAL_2 =
	      IF_csr_regfile_read_csr_rg_trap_instr_798_BITS_ETC___d2856;
      default: MUX_csr_regfile$mav_csr_write_2__VAL_2 =
		   csr_regfile$read_csr[63:0] & y__h35332;
    endcase
  end
  assign MUX_imem_rg_cache_addr$write_1__VAL_1 =
	     (near_mem$imem_valid && !near_mem$imem_exc) ?
	       near_mem$imem_pc :
	       64'h0000000000000001 ;
  assign MUX_imem_rg_cache_addr$write_1__VAL_2 =
	     near_mem$imem_exc ? 64'h0000000000000001 : near_mem$imem_pc ;
  assign MUX_imem_rg_tval$write_1__VAL_2 =
	     (NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d2707 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h32186 :
	       stageF_branch_predictor$predict_rsp ;
  assign MUX_imem_rg_tval$write_1__VAL_3 =
	     (NOT_rg_next_pc_867_BITS_1_TO_0_868_EQ_0b0_869__ETC___d2875 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h43719 :
	       rg_next_pc ;
  assign MUX_imem_rg_tval$write_1__VAL_4 = near_mem$imem_pc + 64'd4 ;
  assign MUX_near_mem$imem_req_2__VAL_2 =
	     (NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d2707 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h32186 :
	       addr_of_b32__h32058 ;
  assign MUX_near_mem$imem_req_2__VAL_4 =
	     (NOT_rg_next_pc_867_BITS_1_TO_0_868_EQ_0b0_869__ETC___d2875 &&
	      near_mem$imem_instr[17:16] == 2'b11) ?
	       addr_of_b32___1__h43719 :
	       addr_of_b32__h43591 ;
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
		 trap_info_tval__h14908 } ;
  assign MUX_rg_trap_info$write_1__VAL_2 =
	     { value__h8443,
	       near_mem$dmem_exc_code,
	       stage2_rg_stage2[389:326] } ;
  assign MUX_rg_trap_info$write_1__VAL_3 =
	     { stage1_rg_stage_input[401:338],
	       stage1_rg_stage_input[332] ?
		 stage1_rg_stage_input[331:264] :
		 { alu_outputs_exc_code__h11528, trap_info_tval__h14908 } } ;
  assign MUX_rg_trap_info$write_1__VAL_4 =
	     { stage1_rg_stage_input[401:338], x_exc_code__h44015, 64'd0 } ;
  assign MUX_rg_trap_instr$write_1__VAL_1 = stage1_rg_stage_input[263:232] ;
  assign MUX_stage1_rg_full$write_1__VAL_2 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2634 &&
	     stageD_rg_full ||
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2728 ;
  assign MUX_stage2_rg_full$write_1__VAL_2 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2303 ?
	       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	       (IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2402 ||
		stage2_rg_stage2[397:395] != 3'd0 &&
		IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2686 &&
		stage2_rg_full) :
	       stage2_rg_stage2[397:395] != 3'd0 &&
	       IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2686 &&
	       stage2_rg_full ;
  assign MUX_stage3_rg_full$write_1__VAL_2 =
	     stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296) ;
  assign MUX_stageD_rg_full$write_1__VAL_2 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 ||
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2307 &&
	     stageD_rg_full ;
  assign MUX_stageF_rg_full$write_1__VAL_2 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 ?
	       csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2739 ||
	       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2307 &&
	       stageD_rg_full :
	       (IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2307 &&
		stageD_rg_full ||
		!near_mem$imem_valid ||
		NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2122) &&
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
	  near_mem$imem_pc or MUX_imem_rg_cache_b16$write_1__PSEL_1)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_cache_addr$write_1__SEL_1:
	  imem_rg_cache_addr$D_IN = MUX_imem_rg_cache_addr$write_1__VAL_1;
      MUX_imem_rg_cache_addr$write_1__SEL_2:
	  imem_rg_cache_addr$D_IN = MUX_imem_rg_cache_addr$write_1__VAL_2;
      WILL_FIRE_RL_imem_rl_fetch_next_32b:
	  imem_rg_cache_addr$D_IN = near_mem$imem_pc;
      MUX_imem_rg_cache_b16$write_1__PSEL_1:
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
	     MUX_imem_rg_cache_b16$write_1__PSEL_1 && near_mem$imem_valid &&
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
	  MUX_imem_rg_cache_addr$write_1__SEL_2 or
	  stageF_branch_predictor$predict_rsp or
	  MUX_imem_rg_cache_b16$write_1__PSEL_1 or rg_next_pc)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_cache_addr$write_1__SEL_1: imem_rg_pc$D_IN = 64'd4096;
      MUX_imem_rg_cache_addr$write_1__SEL_2:
	  imem_rg_pc$D_IN = stageF_branch_predictor$predict_rsp;
      MUX_imem_rg_cache_b16$write_1__PSEL_1: imem_rg_pc$D_IN = rg_next_pc;
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
	  MUX_imem_rg_cache_addr$write_1__SEL_2 or
	  MUX_imem_rg_tval$write_1__VAL_2 or
	  MUX_imem_rg_cache_b16$write_1__PSEL_1 or
	  MUX_imem_rg_tval$write_1__VAL_3 or
	  WILL_FIRE_RL_imem_rl_fetch_next_32b or
	  MUX_imem_rg_tval$write_1__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_cache_addr$write_1__SEL_1: imem_rg_tval$D_IN = 64'd4096;
      MUX_imem_rg_cache_addr$write_1__SEL_2:
	  imem_rg_tval$D_IN = MUX_imem_rg_tval$write_1__VAL_2;
      MUX_imem_rg_cache_b16$write_1__PSEL_1:
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
  assign rg_csr_val1$D_IN = x_out_data_to_stage2_val1__h9894 ;
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
	  new_epoch__h26600 or
	  MUX_imem_rg_cache_b16$write_1__PSEL_1 or
	  WILL_FIRE_RL_rl_reset_start)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_cache_addr$write_1__SEL_1:
	  rg_epoch$D_IN = new_epoch__h26600;
      MUX_imem_rg_cache_b16$write_1__PSEL_1:
	  rg_epoch$D_IN = new_epoch__h26600;
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
	  x_out_next_pc__h9637 or
	  MUX_rg_next_pc$write_1__SEL_2 or
	  WILL_FIRE_RL_rl_trap or
	  csr_regfile$csr_trap_actions or
	  WILL_FIRE_RL_rl_stage1_xRET or csr_regfile$csr_ret_actions)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_rg_next_pc$write_1__SEL_1: rg_next_pc$D_IN = x_out_next_pc__h9637;
      MUX_rg_next_pc$write_1__SEL_2: rg_next_pc$D_IN = x_out_next_pc__h9637;
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
	  MUX_imem_rg_cache_b16$write_1__PSEL_1 or
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
      MUX_imem_rg_cache_b16$write_1__PSEL_1: rg_state$D_IN = 4'd3;
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
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2316 ||
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
	       _theResult____h5654,
	       stageD_rg_data[79:0],
	       _theResult____h5654[6:0],
	       _theResult____h5654[11:7],
	       _theResult____h5654[19:15],
	       _theResult____h5654[24:20],
	       _theResult____h5654[31:27],
	       _theResult____h5654[31:20],
	       _theResult____h5654[14:12],
	       _theResult____h5654[31:27],
	       _theResult____h5654[31:25],
	       decoded_instr_funct10__h30478,
	       _theResult____h5654[31:20],
	       decoded_instr_imm12_S__h30480,
	       decoded_instr_imm13_SB__h30481,
	       _theResult____h5654[31:12],
	       decoded_instr_imm21_UJ__h30483,
	       _theResult____h5654[27:20],
	       _theResult____h5654[26:25] } ;
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
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2404 ;
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
	       x_out_data_to_stage3_rd__h8113,
	       x_out_data_to_stage3_rd_val__h8114,
	       stage2_rg_stage2[397:395] != 3'd0 &&
	       stage2_rg_stage2[397:395] != 3'd1 &&
	       stage2_rg_stage2[397:395] != 3'd4 &&
	       stage2_rg_stage2[397:395] != 3'd2 &&
	       stage2_rg_stage2[397:395] != 3'd3,
	       stage2_rg_stage2[397:395] != 3'd0 &&
	       CASE_stage2_rg_stage2_BITS_397_TO_395_1_stage2_ETC__q4,
	       x_out_data_to_stage3_fpr_flags__h8117,
	       x_out_data_to_stage3_frd_val__h8118 } ;
  assign stage3_rg_stage3$EN =
	     WILL_FIRE_RL_rl_pipe && stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296) ;
  // register stageD_rg_data
  assign stageD_rg_data$D_IN =
	     { imem_rg_pc,
	       stageF_rg_epoch,
	       stageF_rg_priv,
	       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2082 ||
	       imem_rg_pc[1:0] == 2'b0 &&
	       imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	       near_mem$imem_instr[1:0] == 2'b11,
	       near_mem$imem_exc,
	       near_mem$imem_exc_code,
	       imem_rg_tval,
	       d_instr__h25151,
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
	  new_epoch__h26600 or
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
	stageF_rg_epoch$D_IN = new_epoch__h26600;
    WILL_FIRE_RL_rl_trap_fetch: stageF_rg_epoch$D_IN = new_epoch__h26600;
    WILL_FIRE_RL_rl_WFI_resume: stageF_rg_epoch$D_IN = new_epoch__h26600;
    WILL_FIRE_RL_rl_finish_SFENCE_VMA:
	stageF_rg_epoch$D_IN = new_epoch__h26600;
    WILL_FIRE_RL_rl_finish_FENCE: stageF_rg_epoch$D_IN = new_epoch__h26600;
    WILL_FIRE_RL_rl_finish_FENCE_I: stageF_rg_epoch$D_IN = new_epoch__h26600;
    WILL_FIRE_RL_rl_stage1_restart_after_csrrx:
	stageF_rg_epoch$D_IN = new_epoch__h26600;
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
	     rs1_val__h35054 == 64'd0 ;
  assign csr_regfile$csr_counter_read_fault_csr_addr = 12'h0 ;
  assign csr_regfile$csr_counter_read_fault_priv = 2'h0 ;
  assign csr_regfile$csr_ret_actions_from_priv =
	     (stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	      NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d2884) ?
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
	       rs1_val__h34220 :
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
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296) ||
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
  assign f_reset_reqs$DEQ =
	     gpr_regfile_RDY_server_reset_request_put__226__ETC___d2244 &&
	     rg_state == 4'd0 ;
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
  assign near_mem$dmem_req_addr = x_out_data_to_stage2_addr__h9893 ;
  assign near_mem$dmem_req_amo_funct7 =
	     x_out_data_to_stage2_val1__h9894[6:0] ;
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
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1541 or
	  alu_outputs___1_fval2__h10474 or branch_target__h10074)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0100111:
	  near_mem$dmem_req_store_value = alu_outputs___1_fval2__h10474;
      7'b1100011: near_mem$dmem_req_store_value = branch_target__h10074;
      default: near_mem$dmem_req_store_value =
		   IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1541;
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
	  MUX_imem_rg_cache_addr$write_1__SEL_2 or
	  MUX_near_mem$imem_req_2__VAL_2 or
	  WILL_FIRE_RL_imem_rl_fetch_next_32b or
	  MUX_imem_rg_tval$write_1__VAL_4 or
	  MUX_imem_rg_cache_b16$write_1__PSEL_1 or
	  MUX_near_mem$imem_req_2__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_cache_addr$write_1__SEL_1:
	  near_mem$imem_req_addr = 64'd4096;
      MUX_imem_rg_cache_addr$write_1__SEL_2:
	  near_mem$imem_req_addr = MUX_near_mem$imem_req_2__VAL_2;
      WILL_FIRE_RL_imem_rl_fetch_next_32b:
	  near_mem$imem_req_addr = MUX_imem_rg_tval$write_1__VAL_4;
      MUX_imem_rg_cache_b16$write_1__PSEL_1:
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
	      MUX_imem_rg_cache_b16$write_1__PSEL_1) ?
	       csr_regfile$read_mstatus[19] :
	       imem_rg_mstatus_MXR ;
  assign near_mem$imem_req_priv =
	     (MUX_imem_rg_cache_addr$write_1__SEL_1 ||
	      MUX_imem_rg_cache_addr$write_1__SEL_2 ||
	      MUX_imem_rg_cache_b16$write_1__PSEL_1) ?
	       rg_cur_priv :
	       imem_rg_priv ;
  assign near_mem$imem_req_satp =
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ?
	       imem_rg_satp :
	       csr_regfile$read_satp ;
  assign near_mem$imem_req_sstatus_SUM =
	     (MUX_imem_rg_cache_addr$write_1__SEL_1 ||
	      MUX_imem_rg_cache_addr$write_1__SEL_2 ||
	      MUX_imem_rg_cache_b16$write_1__PSEL_1) ?
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
	     CAN_FIRE_RL_rl_stage1_FENCE_I ;
  assign near_mem$EN_server_fence_i_response_get =
	     CAN_FIRE_RL_rl_finish_FENCE_I ;
  assign near_mem$EN_server_fence_request_put = CAN_FIRE_RL_rl_stage1_FENCE ;
  assign near_mem$EN_server_fence_response_get = CAN_FIRE_RL_rl_finish_FENCE ;
  assign near_mem$EN_sfence_vma_server_request_put =
	     CAN_FIRE_RL_rl_stage1_SFENCE_VMA ;
  assign near_mem$EN_sfence_vma_server_response_get =
	     CAN_FIRE_RL_rl_finish_SFENCE_VMA ;
  assign near_mem$EN_set_watch_tohost = EN_set_watch_tohost ;
  assign near_mem$EN_ma_ddr4_ready = EN_ma_ddr4_ready ;
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
  assign stage2_fbox$req_rm = rm__h10057 ;
  assign stage2_fbox$req_rs2 = MUX_rg_trap_instr$write_1__VAL_1[24:20] ;
  assign stage2_fbox$req_v1 =
	     NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d2505 ?
	       x_out_data_to_stage2_val1__h9894 :
	       x_out_data_to_stage2_fval1__h9896 ;
  assign stage2_fbox$req_v2 = alu_outputs___1_fval2__h10474 ;
  assign stage2_fbox$req_v3 = x_out_data_to_stage2_fval3__h9898 ;
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
  assign stage2_mbox$req_v1 = x_out_data_to_stage2_val1__h9894 ;
  assign stage2_mbox$req_v2 = x_out_data_to_stage2_val2__h9895 ;
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
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300 &&
	      stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334) ?
	       { CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q23,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[151:145] != 7'b1100011 ||
		 IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d432,
		 x_out_cf_info_fallthru_PC__h16065,
		 alu_outputs_cf_info_taken_PC__h16058 } :
	       195'h6AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ;
  assign stageF_branch_predictor$bp_train_instr = d_instr__h25151 ;
  assign stageF_branch_predictor$bp_train_is_i32_not_i16 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2082 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	     near_mem$imem_instr[1:0] == 2'b11 ;
  assign stageF_branch_predictor$bp_train_pc = imem_rg_pc ;
  always@(MUX_imem_rg_cache_addr$write_1__SEL_1 or
	  MUX_imem_rg_cache_addr$write_1__SEL_2 or
	  stageF_branch_predictor$predict_rsp or
	  MUX_imem_rg_cache_b16$write_1__PSEL_1 or rg_next_pc)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_cache_addr$write_1__SEL_1:
	  stageF_branch_predictor$predict_req_pc = 64'd4096;
      MUX_imem_rg_cache_addr$write_1__SEL_2:
	  stageF_branch_predictor$predict_req_pc =
	      stageF_branch_predictor$predict_rsp;
      MUX_imem_rg_cache_b16$write_1__PSEL_1:
	  stageF_branch_predictor$predict_req_pc = rg_next_pc;
      default: stageF_branch_predictor$predict_req_pc =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign stageF_branch_predictor$predict_rsp_instr = d_instr__h25151 ;
  assign stageF_branch_predictor$predict_rsp_is_i32_not_i16 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2082 ||
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
  assign IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1667 =
	     next_pc__h9620 == stage1_rg_stage_input[215:152] ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2307 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2303 ?
	       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	       !IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1667 &&
	       stageF_rg_full &&
	       (!near_mem$imem_valid ||
		NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2122) :
	       stage1_rg_full ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2310 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2307 &&
	     stageD_rg_full ||
	     !stageF_rg_full ||
	     !near_mem$imem_valid ||
	     NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2122 ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2322 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2310 ||
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2316 ||
	     (imem_rg_pc[1:0] == 2'b0 || near_mem$imem_exc ||
	      !imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2634 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2303 ?
	       !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	       IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1667 ||
	       !stageF_rg_full ||
	       near_mem$imem_valid &&
	       near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129 :
	       !stage1_rg_full ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2675 =
	     (IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2634 ||
	      !stageD_rg_full) &&
	     stageF_rg_full &&
	     near_mem$imem_valid &&
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129 ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2728 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2303 ?
	       stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	       IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2344 :
	       stage1_rg_full ;
  assign IF_NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem__ETC___d2099 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2096 ?
	       { 16'b0,
		 imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ?
		   near_mem$imem_instr[31:16] :
		   imem_rg_cache_b16 } :
	       near_mem$imem_instr ;
  assign IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2344 =
	     !IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1667 &&
	     stageF_rg_full &&
	     (!near_mem$imem_valid ||
	      NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2122) ;
  assign IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2402 =
	     IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1667 ||
	     !stageF_rg_full ||
	     near_mem$imem_valid &&
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129 ;
  assign IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2589 =
	     IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2402 &&
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
	     x_out_fbypass_rd__h9226 == stage1_rg_stage_input[139:135] ;
  assign IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d344 =
	     x_out_fbypass_rd__h9226 == stage1_rg_stage_input[134:130] ;
  assign IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d347 =
	     x_out_fbypass_rd__h9226 == stage1_rg_stage_input[129:125] ;
  assign IF_csr_regfile_read_csr_rg_trap_instr_798_BITS_ETC___d2856 =
	     csr_regfile$read_csr[63:0] | rs1_val__h35054 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1940 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b001) ?
	       instr__h24576 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
		 stageD_rg_data[79:77] == 3'b101) ?
		  instr__h24727 :
		  32'h0) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1941 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b101) ?
	       instr__h24377 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1940 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1942 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b001 &&
	      csr_regfile$read_misa[3]) ?
	       instr__h24212 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1941 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1943 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b011 &&
	      csr_regfile$read_misa[5]) ?
	       instr__h23412 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1942 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1944 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b111) ?
	       instr__h23207 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1943 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1945 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b011) ?
	       instr__h23056 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1944 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1946 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b111) ?
	       instr__h22857 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1945 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1948 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:76] == 4'b1001 &&
	      stageD_rg_data[75:71] == 5'd0 &&
	      stageD_rg_data[70:66] == 5'd0) ?
	       instr__h22608 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
		 stageD_rg_data[75:71] != 5'd0 &&
		 stageD_rg_data[79:77] == 3'b011) ?
		  instr__h22704 :
		  IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1946) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1950 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:74] == 6'b100111 &&
	      stageD_rg_data[70:69] == 2'b01) ?
	       instr__h22312 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:74] == 6'b100111 &&
		 stageD_rg_data[70:69] == 2'b0) ?
		  instr__h22450 :
		  IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1948) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1952 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:74] == 6'b100011 &&
	      stageD_rg_data[70:69] == 2'b01) ?
	       instr__h22038 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:74] == 6'b100011 &&
		 stageD_rg_data[70:69] == 2'b0) ?
		  instr__h22174 :
		  IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1950) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1954 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:74] == 6'b100011 &&
	      stageD_rg_data[70:69] == 2'b11) ?
	       instr__h21766 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:74] == 6'b100011 &&
		 stageD_rg_data[70:69] == 2'b10) ?
		  instr__h21902 :
		  IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1952) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1955 =
	     (csr_regfile_read_misa__6_BIT_2_682_AND_stageD__ETC___d1763 &&
	      stageD_rg_data[70:66] != 5'd0) ?
	       instr__h21671 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1954 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1956 =
	     (csr_regfile_read_misa__6_BIT_2_682_AND_stageD__ETC___d1757 &&
	      stageD_rg_data[70:66] != 5'd0) ?
	       instr__h21552 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1955 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1958 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b100 &&
	      stageD_rg_data[75:74] == 2'b01 &&
	      imm6__h19665 != 6'd0) ?
	       instr__h21257 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:77] == 3'b100 &&
		 stageD_rg_data[75:74] == 2'b10) ?
		  instr__h21374 :
		  IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1956) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1959 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b100 &&
	      stageD_rg_data[75:74] == 2'b0 &&
	      imm6__h19665 != 6'd0) ?
	       instr__h21068 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1958 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1960 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b0 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      imm6__h19665 != 6'd0) ?
	       instr__h20879 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1959 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1962 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b011 &&
	      stageD_rg_data[75:71] == 5'd2 &&
	      nzimm10__h20334 != 10'd0) ?
	       instr__h20538 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
		 stageD_rg_data[79:77] == 3'b0 &&
		 nzimm10__h20549 != 10'd0) ?
		  instr__h20710 :
		  IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1960) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1964 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b0 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      imm6__h19665 != 6'd0 ||
	      csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b0 &&
	      stageD_rg_data[75:71] == 5'd0 &&
	      imm6__h19665 == 6'd0) ?
	       instr__h20056 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:77] == 3'b001 &&
		 stageD_rg_data[75:71] != 5'd0) ?
		  instr__h20283 :
		  IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1962) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1965 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b011 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      stageD_rg_data[75:71] != 5'd2 &&
	      imm6__h19665 != 6'd0) ?
	       instr__h19927 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1964 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1967 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b111) ?
	       instr__h19405 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:77] == 3'b010 &&
		 stageD_rg_data[75:71] != 5'd0) ?
		  instr__h19743 :
		  IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1965) ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1968 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b110) ?
	       instr__h19088 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1967 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1969 =
	     (csr_regfile_read_misa__6_BIT_2_682_AND_stageD__ETC___d1763 &&
	      stageD_rg_data[70:66] == 5'd0) ?
	       instr__h19023 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1968 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1970 =
	     (csr_regfile_read_misa__6_BIT_2_682_AND_stageD__ETC___d1757 &&
	      stageD_rg_data[70:66] == 5'd0) ?
	       instr__h18907 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1969 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1971 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b101) ?
	       instr__h18454 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1970 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1972 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b110) ?
	       instr__h18225 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1971 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1973 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b010) ?
	       instr__h18030 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1972 ;
  assign IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1974 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b110) ?
	       instr__h17838 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1973 ;
  assign IF_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg_p_ETC___d2100 =
	     (imem_rg_pc[1:0] == 2'b0 &&
	      imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	      near_mem$imem_instr[1:0] != 2'b11) ?
	       instr_out___1__h25175 :
	       IF_NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem__ETC___d2099 ;
  assign IF_stage1_rg_full_31_THEN_stage1_rg_stage_inpu_ETC___d2897 =
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     (NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d2884 ||
	      !stage1_rg_stage_input[332] &&
	      stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d2892) ;
  assign IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d2764 =
	     (stage1_rg_stage_input[112:110] == 3'd0) ?
	       NOT_stage1_rg_stage_input_32_BITS_144_TO_140_0_ETC___d1179 &&
	       (stage1_rg_stage_input[144:140] != 5'd0 ||
		stage1_rg_stage_input[139:135] != 5'd0 ||
		stage1_rg_stage_input[87:76] == 12'b0 ||
		stage1_rg_stage_input[87:76] == 12'b000000000001 ||
		(rg_cur_priv != 2'b11 ||
		 stage1_rg_stage_input[87:76] != 12'b001100000010) &&
		NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d2758) :
	       stage1_rg_stage_input[112:110] != 3'b001 &&
	       stage1_rg_stage_input[112:110] != 3'b101 &&
	       stage1_rg_stage_input[112:110] != 3'b010 &&
	       stage1_rg_stage_input[112:110] != 3'b110 &&
	       stage1_rg_stage_input[112:110] != 3'b011 &&
	       stage1_rg_stage_input[112:110] != 3'b111 ;
  assign IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d1270 =
	     rs1_val_bypassed__h5370 +
	     SEXT_stage1_rg_stage_input_32_BITS_87_TO_76_057___d1269 ;
  assign IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d421 =
	     rs1_val_bypassed__h5370 == rs2_val_bypassed__h5376 ;
  assign IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d423 =
	     (rs1_val_bypassed__h5370 ^ 64'h8000000000000000) <
	     (rs2_val_bypassed__h5376 ^ 64'h8000000000000000) ;
  assign IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d425 =
	     rs1_val_bypassed__h5370 < rs2_val_bypassed__h5376 ;
  assign IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC__q18 =
	     IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d1270[31:0] ;
  assign IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1531 =
	     ((stage1_rg_stage_input[151:145] == 7'b0010011 ||
	       stage1_rg_stage_input[151:145] == 7'b0110011) &&
	      (stage1_rg_stage_input[112:110] == 3'b001 ||
	       stage1_rg_stage_input[112:110] == 3'b101)) ?
	       alu_outputs___1_val1__h10269 :
	       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1530 ;
  assign IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1532 =
	     (stage1_rg_stage_input[151:145] == 7'b0110011 &&
	      stage1_rg_stage_input[104:98] == 7'b0000001 ||
	      stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d800) ?
	       rs1_val_bypassed__h5370 :
	       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1531 ;
  assign IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1541 =
	     (stage1_rg_stage_input[151:145] == 7'b0110011 &&
	      stage1_rg_stage_input[104:98] == 7'b0000001 ||
	      stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d800) ?
	       rs2_val_bypassed__h5376 :
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q19 ;
  assign IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769 =
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
	       NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d766 ;
  assign IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       stage1_rg_stage_input[112:110] != 3'd0 &&
	       stage1_rg_stage_input[112:110] != 3'b001 &&
	       stage1_rg_stage_input[112:110] != 3'b100 &&
	       stage1_rg_stage_input[112:110] != 3'b101 &&
	       stage1_rg_stage_input[112:110] != 3'b110 &&
	       stage1_rg_stage_input[112:110] != 3'b111 ||
	       IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d775 :
	       stage1_rg_stage_input[151:145] != 7'b1101111 &&
	       (stage1_rg_stage_input[151:145] != 7'b1100111 ||
		stage1_rg_stage_input[112:110] != 3'd0) ;
  assign IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       (stage1_rg_stage_input[112:110] == 3'd0 ||
		stage1_rg_stage_input[112:110] == 3'b001 ||
		stage1_rg_stage_input[112:110] == 3'b100 ||
		stage1_rg_stage_input[112:110] == 3'b101 ||
		stage1_rg_stage_input[112:110] == 3'b110 ||
		stage1_rg_stage_input[112:110] == 3'b111) &&
	       IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d775 :
	       stage1_rg_stage_input[151:145] != 7'b1101111 &&
	       stage1_rg_stage_input[151:145] != 7'b1100111 &&
	       stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d972 ;
  assign IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979 =
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
	       data_to_stage2_rd__h9875,
	       data_to_stage2_addr__h9876,
	       x_out_data_to_stage2_val1__h9894,
	       data_to_stage2_val2__h9878,
	       alu_outputs___1_fval1__h11500,
	       alu_outputs___1_fval2__h10474,
	       alu_outputs___1_fval3__h11502,
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
		NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d2462),
	       stage1_rg_stage_input[151:145] == 7'b0100111,
	       NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d2505,
	       rm__h10057 } ;
  assign IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d337 =
	     x_out_bypass_rd__h9044 == stage1_rg_stage_input[139:135] ;
  assign IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d339 =
	     x_out_bypass_rd__h9044 == stage1_rg_stage_input[134:130] ;
  assign NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 =
	     cur_verbosity__h3719 > 4'd1 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2295 =
	     !csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2292 ||
	      !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2303 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2295 &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296 ||
	      !stage2_rg_full) &&
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2312 =
	     (!csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2292) &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296 ||
	      !stage2_rg_full) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2316 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2312 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     !IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1667 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2339 =
	     !csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	     (!stage1_rg_full || stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769 &&
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781 ||
	      !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334) &&
	     (!stage1_rg_full ||
	      NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2331) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2343 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2339 ||
	     (!stage1_rg_full ||
	      stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2340) &&
	     (!stage1_rg_full ||
	      NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2331) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398 =
	     (!csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2292 &&
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982) &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296 ||
	      !stage2_rg_full) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2404 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2402 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2541 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2402 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     (stage1_rg_stage_input[151:145] == 7'b0000011 ||
	      stage1_rg_stage_input[151:145] == 7'b0000111 ||
	      stage1_rg_stage_input[151:145] == 7'b0100011 ||
	      stage1_rg_stage_input[151:145] == 7'b0100111 ||
	      stage1_rg_stage_input[151:145] == 7'b0101111) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2575 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2402 &&
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
	      stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d800) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2591 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2589 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2601 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2402 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2605 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2402 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1307 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2609 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2402 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     (stage1_rg_stage_input[151:145] == 7'b0000011 ||
	      stage1_rg_stage_input[151:145] == 7'b0000111) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2613 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2402 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1342 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2618 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2402 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2614 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2622 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2402 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     stage1_rg_stage_input[151:145] == 7'b0101111 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2630 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398 &&
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2402 &&
	     !IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1667 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2750 =
	     !csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	     !stage1_rg_stage_input[332] &&
	     (IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) ;
  assign NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d2462 =
	     NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d857 &&
	     stage1_rg_stage_input_32_BITS_99_TO_98_74_EQ_0_ETC___d2445 &&
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
	     NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d857 &&
	     (_0_OR_stage1_rg_stage_input_32_BITS_104_TO_98_3_ETC___d2485 ||
	      stage1_rg_stage_input[104:98] == 7'h61 &&
	      (stage1_rg_stage_input[134:130] == 5'b00010 ||
	       stage1_rg_stage_input[134:130] == 5'b00011) ||
	      stage1_rg_stage_input[104:98] == 7'h71 &&
	      stage1_rg_stage_input[134:130] == 5'd0 &&
	      rm__h10057 == 3'b0 ||
	      stage1_rg_stage_input[104:98] == 7'h69 &&
	      stage1_rg_stage_input[134:130] == 5'b00010 ||
	      stage1_rg_stage_input[104:98] == 7'h69 &&
	      stage1_rg_stage_input[134:130] == 5'b00011 ||
	      stage1_rg_stage_input[104:98] == 7'h79 &&
	      stage1_rg_stage_input[134:130] == 5'd0 &&
	      rm__h10057 == 3'b0) &&
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
  assign NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d857 =
	     csr_regfile$read_mstatus[14:13] != 2'h0 &&
	     ((stage1_rg_stage_input[112:110] == 3'b111) ?
		csr_regfile$read_frm != 3'b101 &&
		csr_regfile$read_frm != 3'b110 &&
		csr_regfile$read_frm != 3'b111 :
		stage1_rg_stage_input[112:110] != 3'b101 &&
		stage1_rg_stage_input[112:110] != 3'b110) ;
  assign NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2082 =
	     imem_rg_pc[1:0] != 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d2074 &&
	     near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_076___d2077 &&
	     imem_rg_cache_b16[1:0] == 2'b11 ;
  assign NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2096 =
	     imem_rg_pc[1:0] != 2'b0 &&
	     (imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	      near_mem$imem_instr[17:16] != 2'b11 ||
	      imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d2074 &&
	      imem_rg_cache_b16[1:0] != 2'b11) ;
  assign NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2115 =
	     !near_mem$imem_exc &&
	     (imem_rg_pc[1:0] == 2'b0 ||
	      !imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d2074 ||
	      !near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_076___d2077 ||
	      imem_rg_cache_b16[1:0] != 2'b11) &&
	     (imem_rg_pc[1:0] != 2'b0 ||
	      !imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[1:0] != 2'b11) ;
  assign NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2122 =
	     NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2115 &&
	     imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d2119 &&
	     (imem_rg_pc[1:0] != 2'b0 ||
	      !imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[1:0] == 2'b11) ;
  assign NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d1114 =
	     (rg_cur_priv != 2'b11 &&
	      (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[20]) ||
	      stage1_rg_stage_input[104:98] != 7'b0001001) &&
	     stage1_rg_stage_input_32_BITS_144_TO_140_037_E_ETC___d1113 ;
  assign NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d1136 =
	     (rg_cur_priv != 2'b11 &&
	      (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[20]) ||
	      stage1_rg_stage_input[104:98] != 7'b0001001) &&
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     stage1_rg_stage_input[139:135] == 5'd0 &&
	     rg_cur_priv_8_EQ_0b11_069_OR_rg_cur_priv_8_EQ__ETC___d1134 ;
  assign NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d1211 =
	     rg_cur_priv != 2'b11 &&
	     (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[21]) &&
	     (rg_cur_priv != 2'b0 || !csr_regfile$read_misa[13]) ||
	     stage1_rg_stage_input[87:76] != 12'b000100000101 ;
  assign NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d1655 =
	     (rg_cur_priv != 2'b11 &&
	      (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[20]) ||
	      stage1_rg_stage_input[104:98] != 7'b0001001) &&
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     stage1_rg_stage_input[139:135] == 5'd0 &&
	     stage1_rg_stage_input[87:76] == 12'b000000000001 ;
  assign NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d2758 =
	     (rg_cur_priv != 2'b11 &&
	      (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[22]) ||
	      stage1_rg_stage_input[87:76] != 12'b000100000010) &&
	     NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d1211 ;
  assign NOT_rg_next_pc_867_BITS_1_TO_0_868_EQ_0b0_869__ETC___d2875 =
	     rg_next_pc[1:0] != 2'b0 && near_mem$imem_valid &&
	     !near_mem$imem_exc &&
	     addr_of_b32__h43591 == near_mem$imem_pc ;
  assign NOT_rg_run_on_reset_257_258_OR_imem_rg_pc_BITS_ETC___d2265 =
	     !rg_run_on_reset ||
	     (imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2261 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req ;
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
  assign NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1167 =
	     stage1_rg_stage_input[112:110] != 3'd0 ||
	     stage1_rg_stage_input[144:140] != 5'd0 ||
	     stage1_rg_stage_input[139:135] != 5'd0 ||
	     stage1_rg_stage_input[263:260] != 4'b0 &&
	     stage1_rg_stage_input[263:260] != 4'b1000 ;
  assign NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1174 =
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
  assign NOT_stage1_rg_stage_input_32_BITS_144_TO_140_0_ETC___d1179 =
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
  assign NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d766 =
	     (stage1_rg_stage_input[151:145] != 7'b0110011 ||
	      stage1_rg_stage_input[104:98] != 7'b0000001) &&
	     NOT_stage1_rg_stage_input_32_BITS_151_TO_145_7_ETC___d449 &&
	     (((stage1_rg_stage_input[151:145] == 7'b0010011 ||
		stage1_rg_stage_input[151:145] == 7'b0110011) &&
	       (stage1_rg_stage_input[112:110] == 3'b001 ||
		stage1_rg_stage_input[112:110] == 3'b101)) ?
		stage1_rg_stage_input[263] ||
		stage1_rg_stage_input[261:258] != 4'b0 :
		IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d764) ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1240 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982) &&
	     stage1_rg_stage_input[151:145] != 7'b1100011 &&
	     stage1_rg_stage_input[151:145] != 7'b1101111 &&
	     stage1_rg_stage_input[151:145] != 7'b1100111 ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1248 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982) &&
	     stage1_rg_stage_input[151:145] == 7'b1100011 ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1253 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982) &&
	     (stage1_rg_stage_input[151:145] == 7'b1101111 ||
	      stage1_rg_stage_input[151:145] == 7'b1100111) ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1259 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982) &&
	     stage1_rg_stage_input[151:145] == 7'b1101111 ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1310 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1307) ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1670 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     !IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1667 ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1674 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1667 ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2331 =
	     !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	     !stage1_rg_stage_input[332] &&
	     (IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2933 =
	     !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979 ||
	     stage1_rg_stage_input[332] ||
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769 &&
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781 ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2935 =
	     (NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2331 &&
	      stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2340) &&
	     stage1_rg_full &&
	     NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2933 ;
  assign NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984 =
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	      NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375) &&
	     (!stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982) ;
  assign NOT_stage1_rg_stage_input_32_BITS_99_TO_98_74__ETC___d753 =
	     (stage1_rg_stage_input[99:98] != 2'b0 &&
	      stage1_rg_stage_input[99:98] != 2'b01 ||
	      stage1_rg_stage_input[151:145] != 7'b1000011 &&
	      stage1_rg_stage_input[151:145] != 7'b1000111 &&
	      stage1_rg_stage_input[151:145] != 7'b1001111 &&
	      stage1_rg_stage_input[151:145] != 7'b1001011) &&
	     (stage1_rg_stage_input[151:145] != 7'b1010011 ||
	      stage1_rg_stage_input[104:98] != 7'h0 &&
	      stage1_rg_stage_input[104:98] != 7'h04 &&
	      stage1_rg_stage_input[104:98] != 7'h08 &&
	      stage1_rg_stage_input[104:98] != 7'h0C &&
	      (stage1_rg_stage_input[104:98] != 7'h2C ||
	       stage1_rg_stage_input[134:130] != 5'd0) &&
	      (stage1_rg_stage_input[104:98] != 7'h10 ||
	       rm__h10057 != 3'b0) &&
	      (stage1_rg_stage_input[104:98] != 7'h10 ||
	       rm__h10057 != 3'b001) &&
	      (stage1_rg_stage_input[104:98] != 7'h10 ||
	       rm__h10057 != 3'b010) &&
	      (stage1_rg_stage_input[104:98] != 7'h14 ||
	       rm__h10057 != 3'b0) &&
	      (stage1_rg_stage_input[104:98] != 7'h14 ||
	       rm__h10057 != 3'b001) &&
	      (stage1_rg_stage_input[104:98] != 7'h60 ||
	       stage1_rg_stage_input[134:130] != 5'd0) &&
	      (stage1_rg_stage_input[104:98] != 7'h60 ||
	       stage1_rg_stage_input[134:130] != 5'b00001) &&
	      (stage1_rg_stage_input[104:98] != 7'h70 ||
	       stage1_rg_stage_input[134:130] != 5'd0 ||
	       rm__h10057 != 3'b0) &&
	      (stage1_rg_stage_input[104:98] != 7'h50 ||
	       rm__h10057 != 3'b010) &&
	      (stage1_rg_stage_input[104:98] != 7'h50 ||
	       rm__h10057 != 3'b001) &&
	      (stage1_rg_stage_input[104:98] != 7'h50 ||
	       rm__h10057 != 3'b0) &&
	      (stage1_rg_stage_input[104:98] != 7'h70 ||
	       stage1_rg_stage_input[134:130] != 5'd0 ||
	       rm__h10057 != 3'b001) &&
	      (stage1_rg_stage_input[104:98] != 7'h68 ||
	       stage1_rg_stage_input[134:130] != 5'd0) &&
	      (stage1_rg_stage_input[104:98] != 7'h68 ||
	       stage1_rg_stage_input[134:130] != 5'b00001) &&
	      (stage1_rg_stage_input[104:98] != 7'h78 ||
	       stage1_rg_stage_input[134:130] != 5'd0 ||
	       rm__h10057 != 3'b0)) &&
	     (stage1_rg_stage_input[151:145] != 7'b1010011 ||
	      (stage1_rg_stage_input[104:98] != 7'h60 ||
	       stage1_rg_stage_input[134:130] != 5'b00010 &&
	       stage1_rg_stage_input[134:130] != 5'b00011) &&
	      (stage1_rg_stage_input[104:98] != 7'h68 ||
	       stage1_rg_stage_input[134:130] != 5'b00010) &&
	      (stage1_rg_stage_input[104:98] != 7'h68 ||
	       stage1_rg_stage_input[134:130] != 5'b00011)) &&
	     (stage1_rg_stage_input[151:145] != 7'b1010011 ||
	      stage1_rg_stage_input[104:98] != 7'b0000001 &&
	      stage1_rg_stage_input[104:98] != 7'h05 &&
	      stage1_rg_stage_input[104:98] != 7'b0001001 &&
	      stage1_rg_stage_input[104:98] != 7'h0D &&
	      (stage1_rg_stage_input[104:98] != 7'h2D ||
	       stage1_rg_stage_input[134:130] != 5'd0) &&
	      (stage1_rg_stage_input[104:98] != 7'h11 ||
	       rm__h10057 != 3'b0) &&
	      (stage1_rg_stage_input[104:98] != 7'h11 ||
	       rm__h10057 != 3'b001) &&
	      (stage1_rg_stage_input[104:98] != 7'h11 ||
	       rm__h10057 != 3'b010) &&
	      (stage1_rg_stage_input[104:98] != 7'h15 ||
	       rm__h10057 != 3'b0) &&
	      (stage1_rg_stage_input[104:98] != 7'h15 ||
	       rm__h10057 != 3'b001) &&
	      (stage1_rg_stage_input[104:98] != 7'h20 ||
	       stage1_rg_stage_input[134:130] != 5'b00001) &&
	      (stage1_rg_stage_input[104:98] != 7'h21 ||
	       stage1_rg_stage_input[134:130] != 5'd0) &&
	      (stage1_rg_stage_input[104:98] != 7'h51 ||
	       rm__h10057 != 3'b010) &&
	      (stage1_rg_stage_input[104:98] != 7'h51 ||
	       rm__h10057 != 3'b001) &&
	      (stage1_rg_stage_input[104:98] != 7'h51 ||
	       rm__h10057 != 3'b0) &&
	      (stage1_rg_stage_input[104:98] != 7'h71 ||
	       stage1_rg_stage_input[134:130] != 5'd0 ||
	       rm__h10057 != 3'b001) &&
	      (stage1_rg_stage_input[104:98] != 7'h61 ||
	       stage1_rg_stage_input[134:130] != 5'd0) &&
	      (stage1_rg_stage_input[104:98] != 7'h61 ||
	       stage1_rg_stage_input[134:130] != 5'b00001) &&
	      (stage1_rg_stage_input[104:98] != 7'h69 ||
	       stage1_rg_stage_input[134:130] != 5'd0) &&
	      (stage1_rg_stage_input[104:98] != 7'h69 ||
	       stage1_rg_stage_input[134:130] != 5'b00001)) &&
	     (stage1_rg_stage_input[151:145] != 7'b1010011 ||
	      (stage1_rg_stage_input[104:98] != 7'h61 ||
	       stage1_rg_stage_input[134:130] != 5'b00010 &&
	       stage1_rg_stage_input[134:130] != 5'b00011) &&
	      (stage1_rg_stage_input[104:98] != 7'h71 ||
	       stage1_rg_stage_input[134:130] != 5'd0 ||
	       rm__h10057 != 3'b0) &&
	      (stage1_rg_stage_input[104:98] != 7'h69 ||
	       stage1_rg_stage_input[134:130] != 5'b00010) &&
	      (stage1_rg_stage_input[104:98] != 7'h69 ||
	       stage1_rg_stage_input[134:130] != 5'b00011) &&
	      (stage1_rg_stage_input[104:98] != 7'h79 ||
	       stage1_rg_stage_input[134:130] != 5'd0 ||
	       rm__h10057 != 3'b0)) ;
  assign NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1014 =
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1110011 &&
	     (stage1_rg_stage_input[112:110] == 3'b001 ||
	      stage1_rg_stage_input[112:110] == 3'b101) ;
  assign NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1029 =
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1110011 &&
	     (stage1_rg_stage_input[112:110] == 3'b010 ||
	      stage1_rg_stage_input[112:110] == 3'b110 ||
	      stage1_rg_stage_input[112:110] == 3'b011 ||
	      stage1_rg_stage_input[112:110] == 3'b111) ;
  assign NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1078 =
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1110011 &&
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     stage1_rg_stage_input_32_BITS_144_TO_140_037_E_ETC___d1075 ;
  assign NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1139 =
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1110011 &&
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d1136 ;
  assign NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d2884 =
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1110011 &&
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     stage1_rg_stage_input[104:98] != 7'b0001001 &&
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     stage1_rg_stage_input[139:135] == 5'd0 &&
	     rg_cur_priv == 2'b11 &&
	     stage1_rg_stage_input[87:76] == 12'b001100000010 ;
  assign NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1229 =
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1226 ;
  assign NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1307 =
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
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
  assign NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1345 =
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1342 ;
  assign NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300 =
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     !stage1_rg_stage_input[332] &&
	     (IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) ;
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
  assign NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784 =
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     (stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769 &&
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781) ;
  assign NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 =
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
	     addr_of_b32__h32058 == near_mem$imem_pc ;
  assign SEXT_stage1_rg_stage_input_32_BITS_87_TO_76_057___d1269 =
	     { {52{stage1_rg_stage_input_BITS_87_TO_76__q17[11]}},
	       stage1_rg_stage_input_BITS_87_TO_76__q17 } ;
  assign SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1747 =
	     { {9{offset__h18401[11]}}, offset__h18401 } ;
  assign SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1772 =
	     { {4{offset__h19032[8]}}, offset__h19032 } ;
  assign _0_OR_stage1_rg_stage_input_32_BITS_104_TO_98_3_ETC___d2485 =
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d899 ||
	     (stage1_rg_stage_input[104:98] == 7'h60 ||
	      stage1_rg_stage_input[104:98] == 7'h68) &&
	     (stage1_rg_stage_input[134:130] == 5'b00010 ||
	      stage1_rg_stage_input[134:130] == 5'b00011) ||
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d943 ||
	     stage1_rg_stage_input[104:98] == 7'h69 &&
	     stage1_rg_stage_input[134:130] == 5'b00001 ;
  assign _theResult_____1_fst__h12326 =
	     (stage1_rg_stage_input[112:110] == 3'd0 &&
	      stage1_rg_stage_input[151:145] == 7'b0110011 &&
	      stage1_rg_stage_input[262]) ?
	       rd_val___1__h12322 :
	       _theResult_____1_fst__h12333 ;
  assign _theResult_____1_fst__h12361 =
	     rs1_val_bypassed__h5370 & _theResult___snd_snd__h16492 ;
  assign _theResult____h33602 =
	     (delta_CPI_instrs__h33601 == 64'd0) ?
	       delta_CPI_instrs___1__h33646 :
	       delta_CPI_instrs__h33601 ;
  assign _theResult____h5654 = x_out_data_to_stage1_instr__h17442 ;
  assign _theResult___fst__h12497 =
	     (stage1_rg_stage_input[112:110] == 3'b001 &&
	      !stage1_rg_stage_input[263] &&
	      stage1_rg_stage_input[261:257] == 5'b0 &&
	      !stage1_rg_stage_input[262]) ?
	       rd_val___1__h16552 :
	       _theResult___fst__h12504 ;
  assign _theResult___fst__h12504 =
	     stage1_rg_stage_input[262] ?
	       rd_val___1__h16613 :
	       rd_val___1__h16584 ;
  assign _theResult___fst__h12585 =
	     { {32{rs1_val_bypassed370_BITS_31_TO_0_SRL_rs2_val_b_ETC__q8[31]}},
	       rs1_val_bypassed370_BITS_31_TO_0_SRL_rs2_val_b_ETC__q8 } ;
  assign _theResult___snd_fst_rd_val__h9208 =
	     stage2_rg_stage2[5] ?
	       stage2_fbox$word_fst :
	       stage2_rg_stage2[197:134] ;
  assign _theResult___snd_snd__h16492 =
	     (stage1_rg_stage_input[151:145] == 7'b0010011) ?
	       SEXT_stage1_rg_stage_input_32_BITS_87_TO_76_057___d1269 :
	       rs2_val_bypassed__h5376 ;
  assign _theResult___snd_snd_rd_val__h8063 =
	     stage2_rg_stage2[5] ?
	       stage2_rg_stage2[325:262] :
	       stage2_fbox$word_fst ;
  assign addr_of_b32___1__h32186 = addr_of_b32__h32058 + 64'd4 ;
  assign addr_of_b32___1__h43719 = addr_of_b32__h43591 + 64'd4 ;
  assign addr_of_b32__h32058 =
	     { stageF_branch_predictor$predict_rsp[63:2], 2'd0 } ;
  assign addr_of_b32__h43591 = { rg_next_pc[63:2], 2'd0 } ;
  assign alu_outputs___1_addr__h10096 =
	     IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d432 ?
	       branch_target__h10074 :
	       x_out_cf_info_fallthru_PC__h16065 ;
  assign alu_outputs___1_addr__h10470 =
	     rs1_val_bypassed__h5370 +
	     { {52{stage1_rg_stage_input_BITS_75_TO_64__q6[11]}},
	       stage1_rg_stage_input_BITS_75_TO_64__q6 } ;
  assign alu_outputs___1_exc_code__h10752 =
	     (stage1_rg_stage_input[112:110] == 3'd0) ?
	       (stage1_rg_stage_input_32_BITS_144_TO_140_037_E_ETC___d1075 ?
		  4'd2 :
		  ((stage1_rg_stage_input[144:140] == 5'd0 &&
		    stage1_rg_stage_input[139:135] == 5'd0) ?
		     CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q16 :
		     4'd2)) :
	       4'd2 ;
  assign alu_outputs___1_fval1__h11500 = x_out_data_to_stage2_fval1__h9896 ;
  assign alu_outputs___1_fval2__h10474 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1565 &&
	      IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d344) ?
	       x_out_fbypass_rd_val__h9227 :
	       rd_val__h9554 ;
  assign alu_outputs___1_fval3__h11502 = x_out_data_to_stage2_fval3__h9898 ;
  assign alu_outputs___1_val1__h10269 =
	     (stage1_rg_stage_input[112:110] == 3'b001) ?
	       rd_val__h16393 :
	       (stage1_rg_stage_input[262] ?
		  rd_val__h16466 :
		  rd_val__h16444) ;
  assign alu_outputs___1_val1__h10314 =
	     (stage1_rg_stage_input[112:110] == 3'd0 &&
	      (stage1_rg_stage_input[151:145] != 7'b0110011 ||
	       !stage1_rg_stage_input[262])) ?
	       rd_val___1__h12241 :
	       _theResult_____1_fst__h12326 ;
  assign alu_outputs___1_val1__h10343 =
	     (stage1_rg_stage_input[112:110] == 3'd0) ?
	       rd_val___1__h16521 :
	       _theResult___fst__h12497 ;
  assign alu_outputs___1_val1__h10756 =
	     stage1_rg_stage_input[112] ?
	       { 59'd0, stage1_rg_stage_input[139:135] } :
	       rs1_val_bypassed__h5370 ;
  assign alu_outputs___1_val1__h10784 =
	     { 57'd0, stage1_rg_stage_input[104:98] } ;
  assign alu_outputs_cf_info_taken_PC__h16058 =
	     x_out_cf_info_taken_PC__h16066 ;
  assign branch_target__h10074 =
	     stage1_rg_stage_input[401:338] +
	     { {51{stage1_rg_stage_input_BITS_63_TO_51__q1[12]}},
	       stage1_rg_stage_input_BITS_63_TO_51__q1 } ;
  assign cpi__h33604 = x__h33603 / 64'd10 ;
  assign cpifrac__h33605 = x__h33603 % 64'd10 ;
  assign csr_regfile_RDY_server_reset_request_put__229__ETC___d2241 =
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
	     (IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2693 =
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2685 ||
	     stage2_rg_stage2[397:395] != 3'd0 &&
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2686 &&
	     stage2_rg_full ||
	     !stage1_rg_full ||
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2292 ||
	     !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	     IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1667 ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2735 =
	     (csr_regfile$interrupt_pending[4] || csr_regfile$nmi_pending) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     (IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) ||
	     stage2_rg_stage2[397:395] != 3'd0 &&
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2686 &&
	     stage2_rg_full ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2739 =
	     csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2735 ||
	     !stage1_rg_full ||
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2292 ||
	     !stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ||
	     IF_IF_stage1_rg_stage_input_32_BITS_151_TO_145_ETC___d1667 ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_8_28_ETC___d2938 =
	     (csr_regfile$interrupt_pending[4] || csr_regfile$nmi_pending) &&
	     rg_state == 4'd3 &&
	     NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2935 &&
	     !stage2_rg_full &&
	     !stage3_rg_full ;
  assign csr_regfile_read_csr_mcycle__7_MINUS_rg_start__ETC___d2801 =
	     delta_CPI_cycles__h33600 * 64'd10 ;
  assign csr_regfile_read_misa__6_BIT_2_682_AND_stageD__ETC___d1757 =
	     csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	     stageD_rg_data[79:76] == 4'b1000 &&
	     stageD_rg_data[75:71] != 5'd0 ;
  assign csr_regfile_read_misa__6_BIT_2_682_AND_stageD__ETC___d1763 =
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
  assign cur_verbosity__h3719 =
	     (csr_regfile$read_csr_minstret < cfg_logdelay) ?
	       4'd0 :
	       cfg_verbosity ;
  assign d_instr__h25151 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2082 ?
	       instr_out___1__h25153 :
	       IF_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg_p_ETC___d2100 ;
  assign data_to_stage2_addr__h9876 = x_out_data_to_stage2_addr__h9893 ;
  assign data_to_stage2_val2__h9878 = x_out_data_to_stage2_val2__h9895 ;
  assign decoded_instr_funct10__h30478 =
	     { _theResult____h5654[31:25], _theResult____h5654[14:12] } ;
  assign decoded_instr_imm12_S__h30480 =
	     { _theResult____h5654[31:25], _theResult____h5654[11:7] } ;
  assign decoded_instr_imm13_SB__h30481 =
	     { _theResult____h5654[31],
	       _theResult____h5654[7],
	       _theResult____h5654[30:25],
	       _theResult____h5654[11:8],
	       1'b0 } ;
  assign decoded_instr_imm21_UJ__h30483 =
	     { _theResult____h5654[31],
	       _theResult____h5654[19:12],
	       _theResult____h5654[20],
	       _theResult____h5654[30:21],
	       1'b0 } ;
  assign delta_CPI_cycles__h33600 =
	     csr_regfile$read_csr_mcycle - rg_start_CPI_cycles ;
  assign delta_CPI_instrs___1__h33646 = delta_CPI_instrs__h33601 + 64'd1 ;
  assign delta_CPI_instrs__h33601 =
	     csr_regfile$read_csr_minstret - rg_start_CPI_instrs ;
  assign fall_through_pc__h9619 =
	     stage1_rg_stage_input[401:338] +
	     (stage1_rg_stage_input[333] ? 64'd4 : 64'd2) ;
  assign gpr_regfile_RDY_server_reset_request_put__226__ETC___d2244 =
	     gpr_regfile$RDY_server_reset_request_put &&
	     fpr_regfile$RDY_server_reset_request_put &&
	     near_mem$RDY_server_reset_request_put &&
	     csr_regfile_RDY_server_reset_request_put__229__ETC___d2241 ;
  assign imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d2119 =
	     imem_rg_pc[1:0] == 2'b0 ||
	     (!imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ||
	      near_mem$imem_instr[17:16] == 2'b11) &&
	     (!imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d2074 ||
	      imem_rg_cache_b16[1:0] == 2'b11) ;
  assign imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2261 =
	     imem_rg_pc[1:0] == 2'b0 || !near_mem$imem_valid ||
	     near_mem$imem_exc ||
	     !imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 ;
  assign imem_rg_pc_BITS_63_TO_2_4_EQ_imem_rg_cache_add_ETC___d2074 =
	     imem_rg_pc[63:2] == imem_rg_cache_addr[63:2] ;
  assign imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 =
	     imem_rg_pc[63:2] == near_mem$imem_pc[63:2] ;
  assign imm12__h17694 = { 4'd0, offset__h17566 } ;
  assign imm12__h18031 = { 5'd0, offset__h17973 } ;
  assign imm12__h19667 = { {6{imm6__h19665[5]}}, imm6__h19665 } ;
  assign imm12__h20336 = { {2{nzimm10__h20334[9]}}, nzimm10__h20334 } ;
  assign imm12__h20551 = { 2'd0, nzimm10__h20549 } ;
  assign imm12__h20747 = { 6'b0, imm6__h19665 } ;
  assign imm12__h21084 = { 6'b010000, imm6__h19665 } ;
  assign imm12__h22705 = { 3'd0, offset__h22619 } ;
  assign imm12__h23057 = { 4'd0, offset__h22991 } ;
  assign imm20__h19795 = { {14{imm6__h19665[5]}}, imm6__h19665 } ;
  assign imm6__h19665 = { stageD_rg_data[76], stageD_rg_data[70:66] } ;
  assign instr___1__h17516 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      stageD_rg_data[79:77] == 3'b010) ?
	       instr__h17693 :
	       IF_csr_regfile_read_misa__6_BIT_2_682_AND_stag_ETC___d1974 ;
  assign instr__h17693 =
	     { imm12__h17694, 8'd18, stageD_rg_data[75:71], 7'b0000011 } ;
  assign instr__h17838 =
	     { 4'd0,
	       stageD_rg_data[72:71],
	       stageD_rg_data[76],
	       stageD_rg_data[70:66],
	       8'd18,
	       offset_BITS_4_TO_0___h17962,
	       7'b0100011 } ;
  assign instr__h18030 =
	     { imm12__h18031, rs1__h18032, 3'b010, rd__h18033, 7'b0000011 } ;
  assign instr__h18225 =
	     { 5'd0,
	       stageD_rg_data[69],
	       stageD_rg_data[76],
	       rd__h18033,
	       rs1__h18032,
	       3'b010,
	       offset_BITS_4_TO_0___h18393,
	       7'b0100011 } ;
  assign instr__h18454 =
	     { SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1747[20],
	       SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1747[10:1],
	       SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1747[11],
	       SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1747[19:12],
	       12'd111 } ;
  assign instr__h18907 = { 12'd0, stageD_rg_data[75:71], 15'd103 } ;
  assign instr__h19023 = { 12'd0, stageD_rg_data[75:71], 15'd231 } ;
  assign instr__h19088 =
	     { SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1772[12],
	       SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1772[10:5],
	       5'd0,
	       rs1__h18032,
	       3'b0,
	       SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1772[4:1],
	       SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1772[11],
	       7'b1100011 } ;
  assign instr__h19405 =
	     { SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1772[12],
	       SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1772[10:5],
	       5'd0,
	       rs1__h18032,
	       3'b001,
	       SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1772[4:1],
	       SEXT_stageD_rg_data_677_BIT_76_694_CONCAT_stag_ETC___d1772[11],
	       7'b1100011 } ;
  assign instr__h19743 =
	     { imm12__h19667, 8'd0, stageD_rg_data[75:71], 7'b0010011 } ;
  assign instr__h19927 =
	     { imm20__h19795, stageD_rg_data[75:71], 7'b0110111 } ;
  assign instr__h20056 =
	     { imm12__h19667,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0010011 } ;
  assign instr__h20283 =
	     { imm12__h19667,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0011011 } ;
  assign instr__h20538 =
	     { imm12__h20336,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0010011 } ;
  assign instr__h20710 = { imm12__h20551, 8'd16, rd__h18033, 7'b0010011 } ;
  assign instr__h20879 =
	     { imm12__h20747,
	       stageD_rg_data[75:71],
	       3'b001,
	       stageD_rg_data[75:71],
	       7'b0010011 } ;
  assign instr__h21068 =
	     { imm12__h20747, rs1__h18032, 3'b101, rs1__h18032, 7'b0010011 } ;
  assign instr__h21257 =
	     { imm12__h21084, rs1__h18032, 3'b101, rs1__h18032, 7'b0010011 } ;
  assign instr__h21374 =
	     { imm12__h19667, rs1__h18032, 3'b111, rs1__h18032, 7'b0010011 } ;
  assign instr__h21552 =
	     { 7'b0,
	       stageD_rg_data[70:66],
	       8'd0,
	       stageD_rg_data[75:71],
	       7'b0110011 } ;
  assign instr__h21671 =
	     { 7'b0,
	       stageD_rg_data[70:66],
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0110011 } ;
  assign instr__h21766 =
	     { 7'b0,
	       rd__h18033,
	       rs1__h18032,
	       3'b111,
	       rs1__h18032,
	       7'b0110011 } ;
  assign instr__h21902 =
	     { 7'b0,
	       rd__h18033,
	       rs1__h18032,
	       3'b110,
	       rs1__h18032,
	       7'b0110011 } ;
  assign instr__h22038 =
	     { 7'b0,
	       rd__h18033,
	       rs1__h18032,
	       3'b100,
	       rs1__h18032,
	       7'b0110011 } ;
  assign instr__h22174 =
	     { 7'b0100000,
	       rd__h18033,
	       rs1__h18032,
	       3'b0,
	       rs1__h18032,
	       7'b0110011 } ;
  assign instr__h22312 =
	     { 7'b0,
	       rd__h18033,
	       rs1__h18032,
	       3'b0,
	       rs1__h18032,
	       7'b0111011 } ;
  assign instr__h22450 =
	     { 7'b0100000,
	       rd__h18033,
	       rs1__h18032,
	       3'b0,
	       rs1__h18032,
	       7'b0111011 } ;
  assign instr__h22608 =
	     { 12'b000000000001,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b1110011 } ;
  assign instr__h22704 =
	     { imm12__h22705, 8'd19, stageD_rg_data[75:71], 7'b0000011 } ;
  assign instr__h22857 =
	     { 3'd0,
	       stageD_rg_data[73:71],
	       stageD_rg_data[76],
	       stageD_rg_data[70:66],
	       8'd19,
	       offset_BITS_4_TO_0___h23332,
	       7'b0100011 } ;
  assign instr__h23056 =
	     { imm12__h23057, rs1__h18032, 3'b011, rd__h18033, 7'b0000011 } ;
  assign instr__h23207 =
	     { 4'd0,
	       stageD_rg_data[70:69],
	       stageD_rg_data[76],
	       rd__h18033,
	       rs1__h18032,
	       3'b011,
	       offset_BITS_4_TO_0___h23332,
	       7'b0100011 } ;
  assign instr__h23412 =
	     { imm12__h17694, 8'd18, stageD_rg_data[75:71], 7'b0000111 } ;
  assign instr__h24212 =
	     { imm12__h22705, 8'd19, stageD_rg_data[75:71], 7'b0000111 } ;
  assign instr__h24377 =
	     { 3'd0,
	       stageD_rg_data[73:71],
	       stageD_rg_data[76],
	       stageD_rg_data[70:66],
	       8'd19,
	       offset_BITS_4_TO_0___h23332,
	       7'b0100111 } ;
  assign instr__h24576 =
	     { imm12__h23057, rs1__h18032, 3'b011, rd__h18033, 7'b0000111 } ;
  assign instr__h24727 =
	     { 4'd0,
	       stageD_rg_data[70:69],
	       stageD_rg_data[76],
	       rd__h18033,
	       rs1__h18032,
	       3'b011,
	       offset_BITS_4_TO_0___h23332,
	       7'b0100111 } ;
  assign instr_out___1__h25153 =
	     { near_mem$imem_instr[15:0], imem_rg_cache_b16 } ;
  assign instr_out___1__h25175 = { 16'b0, near_mem$imem_instr[15:0] } ;
  assign near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2127 =
	     near_mem$imem_exc ||
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2082 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	     near_mem$imem_instr[1:0] == 2'b11 ;
  assign near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129 =
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2127 ||
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d2096 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_4_EQ_near_mem_imem_pc__ETC___d17 &&
	     near_mem$imem_instr[1:0] != 2'b11 ;
  assign near_mem_imem_pc__5_EQ_imem_rg_pc_PLUS_2_076___d2077 =
	     near_mem$imem_pc == imem_rg_pc + 64'd2 ;
  assign near_mem_imem_valid_AND_near_mem_imem_exc__1_A_ETC___d2224 =
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
  assign new_epoch__h26600 = rg_epoch + 2'd1 ;
  assign next_pc___1__h13758 = stage1_rg_stage_input[401:338] + 64'd2 ;
  assign next_pc__h10109 =
	     stage1_rg_stage_input[401:338] +
	     { {43{stage1_rg_stage_input_BITS_30_TO_10__q2[20]}},
	       stage1_rg_stage_input_BITS_30_TO_10__q2 } ;
  assign next_pc__h10144 =
	     { IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d1270[63:1],
	       1'd0 } ;
  assign next_pc__h13755 = stage1_rg_stage_input[401:338] + 64'd4 ;
  assign next_pc__h9620 = x_out_next_pc__h9637 ;
  assign nzimm10__h20334 =
	     { stageD_rg_data[76],
	       stageD_rg_data[68:67],
	       stageD_rg_data[69],
	       stageD_rg_data[66],
	       stageD_rg_data[70],
	       4'b0 } ;
  assign nzimm10__h20549 =
	     { stageD_rg_data[74:71],
	       stageD_rg_data[76:75],
	       stageD_rg_data[69],
	       stageD_rg_data[70],
	       2'b0 } ;
  assign offset_BITS_4_TO_0___h17962 = { stageD_rg_data[75:73], 2'b0 } ;
  assign offset_BITS_4_TO_0___h18393 =
	     { stageD_rg_data[75:74], stageD_rg_data[70], 2'b0 } ;
  assign offset_BITS_4_TO_0___h23332 = { stageD_rg_data[75:74], 3'b0 } ;
  assign offset__h17566 =
	     { stageD_rg_data[67:66],
	       stageD_rg_data[76],
	       stageD_rg_data[70:68],
	       2'b0 } ;
  assign offset__h17973 =
	     { stageD_rg_data[69],
	       stageD_rg_data[76:74],
	       stageD_rg_data[70],
	       2'b0 } ;
  assign offset__h18401 =
	     { stageD_rg_data[76],
	       stageD_rg_data[72],
	       stageD_rg_data[74:73],
	       stageD_rg_data[70],
	       stageD_rg_data[71],
	       stageD_rg_data[66],
	       stageD_rg_data[75],
	       stageD_rg_data[69:67],
	       1'b0 } ;
  assign offset__h19032 =
	     { stageD_rg_data[76],
	       stageD_rg_data[70:69],
	       stageD_rg_data[66],
	       stageD_rg_data[75:74],
	       stageD_rg_data[68:67],
	       1'b0 } ;
  assign offset__h22619 =
	     { stageD_rg_data[68:66],
	       stageD_rg_data[76],
	       stageD_rg_data[70:69],
	       3'b0 } ;
  assign offset__h22991 =
	     { stageD_rg_data[70:69], stageD_rg_data[76:74], 3'b0 } ;
  assign output_stage2___1_data_to_stage3_frd_val__h7992 =
	     stage2_rg_stage2[5] ?
	       ((stage2_rg_stage2[412:410] == 3'b010) ?
		  { 32'hFFFFFFFF, near_mem$dmem_word64[31:0] } :
		  near_mem$dmem_word64) :
	       stage2_rg_stage2[197:134] ;
  assign rd__h18033 = { 2'b01, stageD_rg_data[68:66] } ;
  assign rd_val___1__h12241 =
	     rs1_val_bypassed__h5370 + _theResult___snd_snd__h16492 ;
  assign rd_val___1__h12322 =
	     rs1_val_bypassed__h5370 - _theResult___snd_snd__h16492 ;
  assign rd_val___1__h12329 =
	     ((rs1_val_bypassed__h5370 ^ 64'h8000000000000000) <
	      (_theResult___snd_snd__h16492 ^ 64'h8000000000000000)) ?
	       64'd1 :
	       64'd0 ;
  assign rd_val___1__h12336 =
	     (rs1_val_bypassed__h5370 < _theResult___snd_snd__h16492) ?
	       64'd1 :
	       64'd0 ;
  assign rd_val___1__h12343 =
	     rs1_val_bypassed__h5370 ^ _theResult___snd_snd__h16492 ;
  assign rd_val___1__h12350 =
	     rs1_val_bypassed__h5370 | _theResult___snd_snd__h16492 ;
  assign rd_val___1__h16521 =
	     { {32{IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC__q18[31]}},
	       IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC__q18 } ;
  assign rd_val___1__h16552 = { {32{x__h16555[31]}}, x__h16555 } ;
  assign rd_val___1__h16584 = { {32{x__h16587[31]}}, x__h16587 } ;
  assign rd_val___1__h16613 = { {32{tmp__h16612[31]}}, tmp__h16612 } ;
  assign rd_val___1__h16665 =
	     { {32{rs1_val_bypassed370_BITS_31_TO_0_PLUS_rs2_val__ETC__q9[31]}},
	       rs1_val_bypassed370_BITS_31_TO_0_PLUS_rs2_val__ETC__q9 } ;
  assign rd_val___1__h16713 =
	     { {32{rs1_val_bypassed370_BITS_31_TO_0_MINUS_rs2_val_ETC__q10[31]}},
	       rs1_val_bypassed370_BITS_31_TO_0_MINUS_rs2_val_ETC__q10 } ;
  assign rd_val___1__h16719 = { {32{x__h16722[31]}}, x__h16722 } ;
  assign rd_val___1__h16764 = { {32{x__h16767[31]}}, x__h16767 } ;
  assign rd_val__h10385 = { {32{v32__h10383[31]}}, v32__h10383 } ;
  assign rd_val__h10406 = stage1_rg_stage_input[401:338] + rd_val__h10385 ;
  assign rd_val__h16393 = rs1_val_bypassed__h5370 << shamt__h10256 ;
  assign rd_val__h16444 = rs1_val_bypassed__h5370 >> shamt__h10256 ;
  assign rd_val__h16466 =
	     rs1_val_bypassed__h5370 >> shamt__h10256 |
	     ~(64'hFFFFFFFFFFFFFFFF >> shamt__h10256) &
	     {64{rs1_val_bypassed__h5370[63]}} ;
  assign rd_val__h9457 =
	     (!stage3_rg_stage3[69] && stage3_rg_full &&
	      stage3_rg_stage3[140] &&
	      stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d407) ?
	       stage3_rg_stage3[134:71] :
	       gpr_regfile$read_rs1 ;
  assign rd_val__h9490 =
	     (!stage3_rg_stage3[69] && stage3_rg_full &&
	      stage3_rg_stage3[140] &&
	      stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d415) ?
	       stage3_rg_stage3[134:71] :
	       gpr_regfile$read_rs2 ;
  assign rd_val__h9523 =
	     (stage3_rg_stage3[69] && stage3_rg_full &&
	      stage3_rg_stage3[140] &&
	      stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d407) ?
	       stage3_rg_stage3[63:0] :
	       fpr_regfile$read_rs1 ;
  assign rd_val__h9554 =
	     (stage3_rg_stage3[69] && stage3_rg_full &&
	      stage3_rg_stage3[140] &&
	      stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d415) ?
	       stage3_rg_stage3[63:0] :
	       fpr_regfile$read_rs2 ;
  assign rd_val__h9588 =
	     (stage3_rg_stage3[69] && stage3_rg_full &&
	      stage3_rg_stage3[140] &&
	      stage3_rg_stage3[139:135] == stage1_rg_stage_input[129:125]) ?
	       stage3_rg_stage3[63:0] :
	       fpr_regfile$read_rs3 ;
  assign rg_cur_priv_8_EQ_0b11_069_OR_rg_cur_priv_8_EQ__ETC___d1134 =
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[21] ||
	      rg_cur_priv == 2'b0 && csr_regfile$read_misa[13]) &&
	     stage1_rg_stage_input[87:76] == 12'b000100000101 ;
  assign rg_cur_priv_8_EQ_0b11_069_OR_rg_cur_priv_8_EQ__ETC___d1199 =
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[20]) &&
	     stage1_rg_stage_input[104:98] == 7'b0001001 ||
	     stage1_rg_stage_input[144:140] != 5'd0 ||
	     stage1_rg_stage_input[139:135] != 5'd0 ||
	     rg_cur_priv != 2'b11 &&
	     (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[22]) ||
	     stage1_rg_stage_input[87:76] != 12'b000100000010 ;
  assign rg_cur_priv_8_EQ_0b11_069_OR_rg_cur_priv_8_EQ__ETC___d1213 =
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[20]) &&
	     stage1_rg_stage_input[104:98] == 7'b0001001 ||
	     stage1_rg_stage_input[144:140] != 5'd0 ||
	     stage1_rg_stage_input[139:135] != 5'd0 ||
	     NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d1211 ;
  assign rg_cur_priv_8_EQ_0b11_069_OR_rg_cur_priv_8_EQ__ETC___d1645 =
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[20]) &&
	     stage1_rg_stage_input[104:98] == 7'b0001001 ||
	     stage1_rg_stage_input[144:140] != 5'd0 ||
	     stage1_rg_stage_input[139:135] != 5'd0 ||
	     stage1_rg_stage_input[87:76] != 12'b0 &&
	     stage1_rg_stage_input[87:76] != 12'b000000000001 ;
  assign rg_state_7_EQ_12_4_AND_csr_regfile_wfi_resume__ETC___d2922 =
	     rg_state == 4'd12 && csr_regfile$wfi_resume &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129) ;
  assign rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2753 =
	     rg_state == 4'd3 &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2750 &&
	     !stage3_rg_full &&
	     !stage2_rg_full ;
  assign rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2779 =
	     rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2753 &&
	     stage1_rg_full &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2340 &&
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
  assign rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2814 =
	     rg_state == 4'd3 &&
	     (!csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) ;
  assign rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2817 =
	     rg_state_7_EQ_3_323_AND_NOT_csr_regfile_interr_ETC___d2814 &&
	     !stage3_rg_full &&
	     !stage2_rg_full &&
	     stage1_rg_full &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2340 ;
  assign rg_state_7_EQ_3_323_AND_stage3_rg_full_8_OR_st_ETC___d2335 =
	     rg_state == 4'd3 &&
	     (stage3_rg_full || stage2_rg_full || stage1_rg_full ||
	      stageD_rg_full ||
	      stageF_rg_full) &&
	     stage3_rg_full_8_OR_NOT_stage2_rg_full_14_71_O_ETC___d2334 ;
  assign rg_state_7_EQ_5_926_AND_NOT_stageF_rg_full_104_ETC___d2927 =
	     rg_state == 4'd5 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129) ;
  assign rg_state_7_EQ_8_864_AND_NOT_stageF_rg_full_104_ETC___d2865 =
	     rg_state == 4'd8 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129) ;
  assign rg_trap_info_787_BITS_131_TO_68_788_EQ_csr_reg_ETC___d2797 =
	     rg_trap_info[131:68] == csr_regfile$csr_trap_actions[193:130] ;
  assign rm__h10057 =
	     (stage1_rg_stage_input[112:110] == 3'b111) ?
	       csr_regfile$read_frm :
	       stage1_rg_stage_input[112:110] ;
  assign rs1__h18032 = { 2'b01, stageD_rg_data[73:71] } ;
  assign rs1_val__h34220 =
	     (rg_trap_instr[14:12] == 3'b001) ?
	       rg_csr_val1 :
	       { 59'd0, rg_trap_instr[19:15] } ;
  assign rs1_val_bypassed370_BITS_31_TO_0_MINUS_rs2_val_ETC__q10 =
	     rs1_val_bypassed__h5370[31:0] - rs2_val_bypassed__h5376[31:0] ;
  assign rs1_val_bypassed370_BITS_31_TO_0_PLUS_rs2_val__ETC__q9 =
	     rs1_val_bypassed__h5370[31:0] + rs2_val_bypassed__h5376[31:0] ;
  assign rs1_val_bypassed370_BITS_31_TO_0_SRL_rs2_val_b_ETC__q8 =
	     rs1_val_bypassed__h5370[31:0] >> rs2_val_bypassed__h5376[4:0] |
	     ~(32'hFFFFFFFF >> rs2_val_bypassed__h5376[4:0]) &
	     {32{rs1_val_bypassed370_BITS_31_TO_0__q7[31]}} ;
  assign rs1_val_bypassed370_BITS_31_TO_0__q7 =
	     rs1_val_bypassed__h5370[31:0] ;
  assign rs1_val_bypassed__h5370 =
	     (stage1_rg_stage_input[139:135] == 5'd0) ? 64'd0 : val__h9459 ;
  assign rs2_val_bypassed__h5376 =
	     (stage1_rg_stage_input[134:130] == 5'd0) ? 64'd0 : val__h9492 ;
  assign shamt__h10256 =
	     (stage1_rg_stage_input[151:145] == 7'b0010011) ?
	       stage1_rg_stage_input[81:76] :
	       rs2_val_bypassed__h5376[5:0] ;
  assign stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1000 =
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     !stage1_rg_stage_input[332] &&
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ;
  assign stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1008 =
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1005 ;
  assign stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1327 =
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     (stage1_rg_stage_input[151:145] == 7'b0000011 ||
	      stage1_rg_stage_input[151:145] == 7'b0000111) ;
  assign stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1385 =
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     stage1_rg_stage_input[151:145] == 7'b0101111 ;
  assign stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1411 =
	     stage1_rg_full &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d1408 ;
  assign stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363 =
	     stage1_rg_full &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349) ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d2424 =
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d875 ||
	     stage1_rg_stage_input[104:98] == 7'h14 && rm__h10057 == 3'b001 ||
	     stage1_rg_stage_input[104:98] == 7'h68 &&
	     stage1_rg_stage_input[134:130] == 5'd0 ||
	     stage1_rg_stage_input[104:98] == 7'h68 &&
	     stage1_rg_stage_input[134:130] == 5'b00001 ||
	     stage1_rg_stage_input[104:98] == 7'h78 &&
	     stage1_rg_stage_input[134:130] == 5'd0 &&
	     rm__h10057 == 3'b0 ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d875 =
	     stage1_rg_stage_input[104:98] == 7'h0 ||
	     stage1_rg_stage_input[104:98] == 7'h04 ||
	     stage1_rg_stage_input[104:98] == 7'h08 ||
	     stage1_rg_stage_input[104:98] == 7'h0C ||
	     stage1_rg_stage_input[104:98] == 7'h2C &&
	     stage1_rg_stage_input[134:130] == 5'd0 ||
	     stage1_rg_stage_input[104:98] == 7'h10 && rm__h10057 == 3'b0 ||
	     stage1_rg_stage_input[104:98] == 7'h10 &&
	     (rm__h10057 == 3'b001 || rm__h10057 == 3'b010) ||
	     stage1_rg_stage_input[104:98] == 7'h14 && rm__h10057 == 3'b0 ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d884 =
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d875 ||
	     stage1_rg_stage_input[104:98] == 7'h14 && rm__h10057 == 3'b001 ||
	     stage1_rg_stage_input[104:98] == 7'h60 &&
	     stage1_rg_stage_input[134:130] == 5'd0 ||
	     stage1_rg_stage_input[104:98] == 7'h60 &&
	     stage1_rg_stage_input[134:130] == 5'b00001 ||
	     stage1_rg_stage_input[104:98] == 7'h70 &&
	     stage1_rg_stage_input[134:130] == 5'd0 &&
	     rm__h10057 == 3'b0 ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d892 =
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d884 ||
	     stage1_rg_stage_input[104:98] == 7'h50 &&
	     (rm__h10057 == 3'b010 || rm__h10057 == 3'b001 ||
	      rm__h10057 == 3'b0) ||
	     stage1_rg_stage_input[104:98] == 7'h70 &&
	     stage1_rg_stage_input[134:130] == 5'd0 &&
	     rm__h10057 == 3'b001 ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d899 =
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d892 ||
	     stage1_rg_stage_input[104:98] == 7'h68 &&
	     (stage1_rg_stage_input[134:130] == 5'd0 ||
	      stage1_rg_stage_input[134:130] == 5'b00001) ||
	     stage1_rg_stage_input[104:98] == 7'h78 &&
	     stage1_rg_stage_input[134:130] == 5'd0 &&
	     rm__h10057 == 3'b0 ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d926 =
	     stage1_rg_stage_input[104:98] == 7'b0000001 ||
	     stage1_rg_stage_input[104:98] == 7'h05 ||
	     stage1_rg_stage_input[104:98] == 7'b0001001 ||
	     stage1_rg_stage_input[104:98] == 7'h0D ||
	     stage1_rg_stage_input[104:98] == 7'h2D &&
	     stage1_rg_stage_input[134:130] == 5'd0 ||
	     stage1_rg_stage_input[104:98] == 7'h11 && rm__h10057 == 3'b0 ||
	     stage1_rg_stage_input[104:98] == 7'h11 &&
	     (rm__h10057 == 3'b001 || rm__h10057 == 3'b010) ||
	     stage1_rg_stage_input[104:98] == 7'h15 && rm__h10057 == 3'b0 ||
	     stage1_rg_stage_input[104:98] == 7'h15 && rm__h10057 == 3'b001 ||
	     stage1_rg_stage_input[104:98] == 7'h20 &&
	     stage1_rg_stage_input[134:130] == 5'b00001 ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d937 =
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d926 ||
	     stage1_rg_stage_input[104:98] == 7'h21 &&
	     stage1_rg_stage_input[134:130] == 5'd0 ||
	     stage1_rg_stage_input[104:98] == 7'h51 && rm__h10057 == 3'b010 ||
	     stage1_rg_stage_input[104:98] == 7'h51 &&
	     (rm__h10057 == 3'b001 || rm__h10057 == 3'b0) ||
	     stage1_rg_stage_input[104:98] == 7'h71 &&
	     stage1_rg_stage_input[134:130] == 5'd0 &&
	     rm__h10057 == 3'b001 ;
  assign stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d943 =
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d937 ||
	     stage1_rg_stage_input[104:98] == 7'h61 &&
	     (stage1_rg_stage_input[134:130] == 5'd0 ||
	      stage1_rg_stage_input[134:130] == 5'b00001) ||
	     stage1_rg_stage_input[104:98] == 7'h69 &&
	     stage1_rg_stage_input[134:130] == 5'd0 ;
  assign stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1045 =
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     stage1_rg_stage_input[139:135] == 5'd0 &&
	     (stage1_rg_stage_input[263:260] == 4'b0 ||
	      stage1_rg_stage_input[263:260] == 4'b1000) ;
  assign stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1059 =
	     stage1_rg_stage_input[112:110] == 3'b001 &&
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     stage1_rg_stage_input[139:135] == 5'd0 &&
	     stage1_rg_stage_input[87:76] == 12'b0 ;
  assign stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d812 =
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     (stage1_rg_stage_input[151:145] != 7'b0110011 ||
	      !stage1_rg_stage_input[262]) ||
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     stage1_rg_stage_input[151:145] == 7'b0110011 &&
	     stage1_rg_stage_input[262] ||
	     CASE_stage1_rg_stage_input_BITS_112_TO_110_0b1_ETC__q13 ;
  assign stage1_rg_stage_input_32_BITS_144_TO_140_037_E_ETC___d1075 =
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[20]) &&
	     stage1_rg_stage_input[104:98] == 7'b0001001 ;
  assign stage1_rg_stage_input_32_BITS_144_TO_140_037_E_ETC___d1113 =
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     stage1_rg_stage_input[139:135] == 5'd0 &&
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[22]) &&
	     stage1_rg_stage_input[87:76] == 12'b000100000010 ;
  assign stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d1351 =
	     stage1_rg_stage_input[151:145] == 7'b0110011 &&
	     stage1_rg_stage_input[104:98] == 7'b0000001 ||
	     stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d800 ||
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
	     stage1_rg_stage_input_32_BITS_144_TO_140_037_E_ETC___d1113 ;
  assign stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d800 =
	     stage1_rg_stage_input[151:145] == 7'b0111011 &&
	     stage1_rg_stage_input[104:98] == 7'b0000001 &&
	     stage1_rg_stage_input[112:110] != 3'b001 &&
	     stage1_rg_stage_input[112:110] != 3'b010 &&
	     stage1_rg_stage_input[112:110] != 3'b011 ;
  assign stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d972 =
	     stage1_rg_stage_input[151:145] == 7'b0110011 &&
	     stage1_rg_stage_input[104:98] == 7'b0000001 ||
	     stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d800 ||
	     (((stage1_rg_stage_input[151:145] == 7'b0010011 ||
		stage1_rg_stage_input[151:145] == 7'b0110011) &&
	       (stage1_rg_stage_input[112:110] == 3'b001 ||
		stage1_rg_stage_input[112:110] == 3'b101)) ?
		!stage1_rg_stage_input[263] &&
		stage1_rg_stage_input[261:258] == 4'b0 :
		IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d970) ;
  assign stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d1408 =
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1389 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1360 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1370 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1405 ;
  assign stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d1598 =
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     !stage1_rg_stage_input[332] &&
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ;
  assign stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2340 =
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     (stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769 &&
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781) ;
  assign stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2626 =
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     IF_NOT_stage1_rg_full_31_86_OR_NOT_stage1_rg_s_ETC___d2402 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1389 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1360 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1370 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1405 ;
  assign stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 =
	     stage1_rg_stage_input[335:334] == rg_epoch ;
  assign stage1_rg_stage_input_32_BITS_99_TO_98_74_EQ_0_ETC___d2445 =
	     (stage1_rg_stage_input[99:98] == 2'b0 ||
	      stage1_rg_stage_input[99:98] == 2'b01) &&
	     (stage1_rg_stage_input[151:145] == 7'b1000011 ||
	      stage1_rg_stage_input[151:145] == 7'b1000111 ||
	      stage1_rg_stage_input[151:145] == 7'b1001111 ||
	      stage1_rg_stage_input[151:145] == 7'b1001011) ||
	     stage1_rg_stage_input[151:145] == 7'b1010011 &&
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d2424 ||
	     stage1_rg_stage_input[151:145] == 7'b1010011 &&
	     stage1_rg_stage_input[104:98] == 7'h68 &&
	     (stage1_rg_stage_input[134:130] == 5'b00010 ||
	      stage1_rg_stage_input[134:130] == 5'b00011) ||
	     stage1_rg_stage_input[151:145] == 7'b1010011 &&
	     (stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d926 ||
	      stage1_rg_stage_input[104:98] == 7'h21 &&
	      stage1_rg_stage_input[134:130] == 5'd0 ||
	      stage1_rg_stage_input[104:98] == 7'h69 &&
	      stage1_rg_stage_input[134:130] == 5'd0 ||
	      stage1_rg_stage_input[104:98] == 7'h69 &&
	      stage1_rg_stage_input[134:130] == 5'b00001) ||
	     stage1_rg_stage_input[151:145] == 7'b1010011 &&
	     (stage1_rg_stage_input[104:98] == 7'h69 &&
	      (stage1_rg_stage_input[134:130] == 5'b00010 ||
	       stage1_rg_stage_input[134:130] == 5'b00011) ||
	      stage1_rg_stage_input[104:98] == 7'h79 &&
	      stage1_rg_stage_input[134:130] == 5'd0 &&
	      rm__h10057 == 3'b0) ;
  assign stage1_rg_stage_input_32_BITS_99_TO_98_74_EQ_0_ETC___d959 =
	     (stage1_rg_stage_input[99:98] == 2'b0 ||
	      stage1_rg_stage_input[99:98] == 2'b01) &&
	     (stage1_rg_stage_input[151:145] == 7'b1000011 ||
	      stage1_rg_stage_input[151:145] == 7'b1000111 ||
	      stage1_rg_stage_input[151:145] == 7'b1001111 ||
	      stage1_rg_stage_input[151:145] == 7'b1001011) ||
	     stage1_rg_stage_input[151:145] == 7'b1010011 &&
	     stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d899 ||
	     stage1_rg_stage_input[151:145] == 7'b1010011 &&
	     (stage1_rg_stage_input[104:98] == 7'h60 ||
	      stage1_rg_stage_input[104:98] == 7'h68) &&
	     (stage1_rg_stage_input[134:130] == 5'b00010 ||
	      stage1_rg_stage_input[134:130] == 5'b00011) ||
	     stage1_rg_stage_input[151:145] == 7'b1010011 &&
	     (stage1_rg_stage_input_32_BITS_104_TO_98_38_EQ__ETC___d943 ||
	      stage1_rg_stage_input[104:98] == 7'h69 &&
	      stage1_rg_stage_input[134:130] == 5'b00001) ||
	     stage1_rg_stage_input[151:145] == 7'b1010011 &&
	     (stage1_rg_stage_input[104:98] == 7'h61 &&
	      (stage1_rg_stage_input[134:130] == 5'b00010 ||
	       stage1_rg_stage_input[134:130] == 5'b00011) ||
	      stage1_rg_stage_input[104:98] == 7'h71 &&
	      stage1_rg_stage_input[134:130] == 5'd0 &&
	      rm__h10057 == 3'b0 ||
	      stage1_rg_stage_input[104:98] == 7'h69 &&
	      stage1_rg_stage_input[134:130] == 5'b00010 ||
	      stage1_rg_stage_input[104:98] == 7'h69 &&
	      stage1_rg_stage_input[134:130] == 5'b00011 ||
	      stage1_rg_stage_input[104:98] == 7'h79 &&
	      stage1_rg_stage_input[134:130] == 5'd0 &&
	      rm__h10057 == 3'b0) ;
  assign stage1_rg_stage_input_32_BIT_332_77_OR_NOT_rg__ETC___d1106 =
	     stage1_rg_stage_input[332] ||
	     rg_cur_priv != 2'b11 &&
	     (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[20]) ||
	     stage1_rg_stage_input[104:98] != 7'b0001001 ;
  assign stage1_rg_stage_input_BITS_30_TO_10__q2 =
	     stage1_rg_stage_input[30:10] ;
  assign stage1_rg_stage_input_BITS_63_TO_51__q1 =
	     stage1_rg_stage_input[63:51] ;
  assign stage1_rg_stage_input_BITS_75_TO_64__q6 =
	     stage1_rg_stage_input[75:64] ;
  assign stage1_rg_stage_input_BITS_87_TO_76__q17 =
	     stage1_rg_stage_input[87:76] ;
  assign stage2_rg_full_14_AND_IF_stage2_rg_stage2_15_B_ETC___d2376 =
	     stage2_rg_full &&
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     stage2_rg_stage2[397:395] != 3'd0 &&
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d175 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1005 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     !stage1_rg_stage_input[332] &&
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1016 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1014 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1017 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1016 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1019 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1017 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1031 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1029 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1032 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1031 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1034 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1032 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1049 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b0001111 &&
	     stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1045 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1050 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1049 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1052 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1050 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1063 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b0001111 &&
	     stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d1059 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1064 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1063 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1066 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1064 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1080 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1078 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1081 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1080 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1083 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1081 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1095 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1110011 &&
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     stage1_rg_stage_input[104:98] != 7'b0001001 &&
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     stage1_rg_stage_input[139:135] == 5'd0 &&
	     rg_cur_priv == 2'b11 &&
	     stage1_rg_stage_input[87:76] == 12'b001100000010 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1096 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1095 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1098 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1096 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1119 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input_32_BIT_332_77_OR_NOT_rg__ETC___d1106) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1110011 &&
	     stage1_rg_stage_input[112:110] == 3'd0 &&
	     NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d1114 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1120 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1119 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1121 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1120 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1123 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1121 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1141 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input_32_BIT_332_77_OR_NOT_rg__ETC___d1106) &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     NOT_stage1_rg_stage_input_32_BIT_332_77_89_AND_ETC___d1139 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1142 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1141 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1143 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1142 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1145 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1143 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1218 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      stage1_rg_stage_input[151:145] != 7'b1110011 ||
	      stage1_rg_stage_input[112:110] != 3'd0 ||
	      rg_cur_priv_8_EQ_0b11_069_OR_rg_cur_priv_8_EQ__ETC___d1199) &&
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      stage1_rg_stage_input[151:145] != 7'b1110011 ||
	      stage1_rg_stage_input[112:110] != 3'd0 ||
	      rg_cur_priv_8_EQ_0b11_069_OR_rg_cur_priv_8_EQ__ETC___d1213) ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1219 =
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
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1218 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1220 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      stage1_rg_stage_input[151:145] != 7'b1110011 ||
	      stage1_rg_stage_input[112:110] != 3'd0 ||
	      NOT_stage1_rg_stage_input_32_BITS_144_TO_140_0_ETC___d1179) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1219 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1223 =
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
	      NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1167) &&
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      stage1_rg_stage_input[151:145] != 7'b0001111 ||
	      NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1174) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1220 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1224 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      stage1_rg_stage_input[151:145] != 7'b1110011 ||
	      stage1_rg_stage_input[112:110] != 3'b001 &&
	      stage1_rg_stage_input[112:110] != 3'b101) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1223 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1225 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1224 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1226 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1225 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1288 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	     !stage1_rg_stage_input[332] &&
	     stage1_rg_stage_input[151:145] == 7'b1100111 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1342 =
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     (stage1_rg_stage_input[151:145] == 7'b0100011 ||
	      stage1_rg_stage_input[151:145] == 7'b0100111) ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1360 =
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	     stage1_rg_stage_input[151:145] != 7'b0000011 &&
	     stage1_rg_stage_input[151:145] != 7'b0000111 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1370 =
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	     stage1_rg_stage_input[151:145] != 7'b0100011 &&
	     stage1_rg_stage_input[151:145] != 7'b0100111 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1375 =
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1370 &&
	     NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d995 &&
	     stage1_rg_stage_input[151:145] != 7'b1100011 &&
	     stage1_rg_stage_input[151:145] != 7'b1101111 &&
	     stage1_rg_stage_input[151:145] != 7'b1100111 &&
	     (stage1_rg_stage_input[151:145] == 7'b0110011 &&
	      stage1_rg_stage_input[104:98] == 7'b0000001 ||
	      stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d800) ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1378 =
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982 &&
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d1351) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1360 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1375 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1389 =
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	     stage1_rg_stage_input[151:145] != 7'b1100011 &&
	     stage1_rg_stage_input[151:145] != 7'b1101111 &&
	     stage1_rg_stage_input[151:145] != 7'b1100111 &&
	     stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d1351 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1405 =
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
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1565 =
	     stage2_rg_full && stage2_rg_stage2[397:395] != 3'd0 &&
	     stage2_rg_stage2[397:395] != 3'd1 &&
	     stage2_rg_stage2[397:395] != 3'd4 &&
	     stage2_rg_stage2[397:395] != 3'd2 &&
	     stage2_rg_stage2[397:395] != 3'd3 &&
	     stage2_rg_stage2[5] &&
	     stage2_fbox$valid ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2292 =
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	     stage1_rg_stage_input[332] ||
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d769 &&
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d781 ;
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d2614 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	      stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	      stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d1351) &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1360 &&
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1375 ;
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
  assign stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d982 =
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d341 ||
	     stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d349 ||
	     !stage1_rg_stage_input[332] &&
	     (IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d975 ||
	      IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979) ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d170 =
	     stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d152) &&
	     stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d168 ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2373 =
	     stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296) &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2378 =
	     stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296) &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d184) ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2380 =
	     stage2_rg_full &&
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     stage2_rg_stage2[397:395] != 3'd0 &&
	     stage2_rg_stage2[397:395] != 3'd1 &&
	     stage2_rg_stage2[397:395] != 3'd4 &&
	     stage2_rg_stage2[397:395] != 3'd2 &&
	     stage2_rg_stage2[397:395] != 3'd3 ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2382 =
	     stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296) &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      stage2_rg_stage2[397:395] == 3'd1 ||
	      stage2_rg_stage2[397:395] == 3'd4 ||
	      stage2_rg_stage2[397:395] == 3'd2 ||
	      stage2_rg_stage2[397:395] == 3'd3) ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2384 =
	     stage2_rg_full &&
	     IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296 &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     stage2_rg_stage2[397:395] != 3'd0 &&
	     CASE_stage2_rg_stage2_BITS_397_TO_395_1_stage2_ETC__q4 ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2386 =
	     stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296) &&
	     NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56 &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_st_ETC__q5) ;
  assign stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2392 =
	     stage2_rg_full &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296) &&
	     (cur_verbosity__h3719 != 4'd0 ||
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
  assign stage3_rg_full_8_OR_NOT_stage2_rg_full_14_71_O_ETC___d2334 =
	     (stage3_rg_full || !stage2_rg_full ||
	      stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d168) &&
	     (stage3_rg_full || stage2_rg_full || !stage1_rg_full ||
	      NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d2331) ;
  assign stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d407 =
	     stage3_rg_stage3[139:135] == stage1_rg_stage_input[139:135] ;
  assign stage3_rg_stage3_00_BITS_139_TO_135_09_EQ_stag_ETC___d415 =
	     stage3_rg_stage3[139:135] == stage1_rg_stage_input[134:130] ;
  assign stageF_f_reset_rsps_i_notEmpty__251_AND_stageD_ETC___d2271 =
	     stageF_f_reset_rsps$EMPTY_N && stageD_f_reset_rsps$EMPTY_N &&
	     stage1_f_reset_rsps$EMPTY_N &&
	     stage2_f_reset_rsps$EMPTY_N &&
	     stage3_f_reset_rsps$EMPTY_N &&
	     f_reset_rsps$FULL_N &&
	     NOT_rg_run_on_reset_257_258_OR_imem_rg_pc_BITS_ETC___d2265 ;
  assign stageF_rg_full_104_AND_near_mem_imem_valid_AND_ETC___d2136 =
	     stageF_rg_full && near_mem$imem_valid &&
	     near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129 &&
	     !near_mem$imem_exc ;
  assign sxl__h6710 =
	     (csr_regfile$read_misa[27:26] == 2'd2) ?
	       csr_regfile$read_mstatus[35:34] :
	       2'd0 ;
  assign tmp__h16612 =
	     rs1_val_bypassed__h5370[31:0] >> stage1_rg_stage_input[80:76] |
	     ~(32'hFFFFFFFF >> stage1_rg_stage_input[80:76]) &
	     {32{rs1_val_bypassed370_BITS_31_TO_0__q7[31]}} ;
  assign trap_info_tval__h14908 =
	     (stage1_rg_stage_input[151:145] != 7'b1101111 &&
	      stage1_rg_stage_input[151:145] != 7'b1100111 &&
	      (stage1_rg_stage_input[151:145] != 7'b1110011 ||
	       stage1_rg_stage_input[112:110] != 3'd0 ||
	       rg_cur_priv_8_EQ_0b11_069_OR_rg_cur_priv_8_EQ__ETC___d1645)) ?
	       (stage1_rg_stage_input[333] ?
		  { 32'd0, stage1_rg_stage_input[263:232] } :
		  { 48'd0, stage1_rg_stage_input[231:216] }) :
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q20 ;
  assign uxl__h6711 =
	     (csr_regfile$read_misa[27:26] == 2'd2) ?
	       csr_regfile$read_mstatus[33:32] :
	       2'd0 ;
  assign v32__h10383 = { stage1_rg_stage_input[50:31], 12'h0 } ;
  assign val__h9459 =
	     (stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d405 &&
	      IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d337) ?
	       x_out_bypass_rd_val__h9045 :
	       rd_val__h9457 ;
  assign val__h9492 =
	     (stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d405 &&
	      IF_stage2_rg_full_14_THEN_IF_stage2_rg_stage2__ETC___d339) ?
	       x_out_bypass_rd_val__h9045 :
	       rd_val__h9490 ;
  assign value__h14978 =
	     stage1_rg_stage_input[332] ?
	       stage1_rg_stage_input[327:264] :
	       trap_info_tval__h14908 ;
  assign x__h16555 =
	     rs1_val_bypassed__h5370[31:0] << stage1_rg_stage_input[80:76] ;
  assign x__h16587 =
	     rs1_val_bypassed__h5370[31:0] >> stage1_rg_stage_input[80:76] ;
  assign x__h16722 =
	     rs1_val_bypassed__h5370[31:0] << rs2_val_bypassed__h5376[4:0] ;
  assign x__h16767 =
	     rs1_val_bypassed__h5370[31:0] >> rs2_val_bypassed__h5376[4:0] ;
  assign x__h33603 =
	     csr_regfile_read_csr_mcycle__7_MINUS_rg_start__ETC___d2801[63:0] /
	     _theResult____h33602 ;
  assign x_exc_code__h44015 =
	     (csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending) ?
	       csr_regfile$interrupt_pending[3:0] :
	       4'd0 ;
  assign x_out_cf_info_fallthru_PC__h16065 =
	     stage1_rg_stage_input[333] ?
	       next_pc__h13755 :
	       next_pc___1__h13758 ;
  assign x_out_data_to_stage1_instr__h17442 =
	     stageD_rg_data[165] ? stageD_rg_data[95:64] : instr___1__h17516 ;
  assign x_out_data_to_stage2_fval1__h9896 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1565 &&
	      IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d343) ?
	       x_out_fbypass_rd_val__h9227 :
	       rd_val__h9523 ;
  assign x_out_data_to_stage2_fval3__h9898 =
	     (stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1565 &&
	      IF_NOT_stage2_rg_full_14_71_OR_stage2_rg_stage_ETC___d347) ?
	       x_out_fbypass_rd_val__h9227 :
	       rd_val__h9588 ;
  assign x_out_data_to_stage2_rd__h9892 =
	     stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 ?
	       data_to_stage2_rd__h9875 :
	       5'd0 ;
  assign x_out_data_to_stage2_val2__h9895 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       branch_target__h10074 :
	       IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1541 ;
  assign x_out_next_pc__h9637 =
	     IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d979 ?
	       data_to_stage2_addr__h9876 :
	       fall_through_pc__h9619 ;
  assign x_out_trap_info_exc_code__h14913 =
	     stage1_rg_stage_input[332] ?
	       stage1_rg_stage_input[331:328] :
	       alu_outputs_exc_code__h11528 ;
  assign y__h35332 = ~rs1_val__h35054 ;
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4: value__h8443 = stage2_rg_stage2[493:430];
      default: value__h8443 = stage2_rg_stage2[493:430];
    endcase
  end
  always@(stage2_rg_stage2 or near_mem$dmem_exc_code)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4:
	  x_out_trap_info_exc_code__h8553 = near_mem$dmem_exc_code;
      default: x_out_trap_info_exc_code__h8553 = 4'd2;
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4: value__h8657 = stage2_rg_stage2[389:326];
      default: value__h8657 = 64'd0;
    endcase
  end
  always@(stage2_rg_stage2 or stage2_fbox$word_snd)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd1, 3'd2, 3'd3, 3'd4:
	  x_out_data_to_stage3_fpr_flags__h8117 = 5'd0;
      default: x_out_data_to_stage3_fpr_flags__h8117 = stage2_fbox$word_snd;
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd1, 3'd4:
	  x_out_data_to_stage3_rd__h8113 = stage2_rg_stage2[394:390];
      3'd2: x_out_data_to_stage3_rd__h8113 = 5'd0;
      default: x_out_data_to_stage3_rd__h8113 = stage2_rg_stage2[394:390];
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd1, 3'd4: x_out_bypass_rd__h9044 = stage2_rg_stage2[394:390];
      default: x_out_bypass_rd__h9044 = stage2_rg_stage2[394:390];
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4: x_out_fbypass_rd__h9226 = stage2_rg_stage2[394:390];
      default: x_out_fbypass_rd__h9226 = stage2_rg_stage2[394:390];
    endcase
  end
  always@(rg_trap_instr or rg_csr_val1)
  begin
    case (rg_trap_instr[14:12])
      3'b010, 3'b011: rs1_val__h35054 = rg_csr_val1;
      default: rs1_val__h35054 = { 59'd0, rg_trap_instr[19:15] };
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_fbox$word_fst or
	  output_stage2___1_data_to_stage3_frd_val__h7992)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd2, 3'd3:
	  x_out_data_to_stage3_frd_val__h8118 = stage2_rg_stage2[197:134];
      3'd1, 3'd4:
	  x_out_data_to_stage3_frd_val__h8118 =
	      output_stage2___1_data_to_stage3_frd_val__h7992;
      default: x_out_data_to_stage3_frd_val__h8118 = stage2_fbox$word_fst;
    endcase
  end
  always@(stage2_rg_stage2 or
	  _theResult___snd_snd_rd_val__h8063 or
	  near_mem$dmem_word64 or stage2_mbox$word)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd2:
	  x_out_data_to_stage3_rd_val__h8114 = stage2_rg_stage2[325:262];
      3'd1, 3'd4: x_out_data_to_stage3_rd_val__h8114 = near_mem$dmem_word64;
      3'd3: x_out_data_to_stage3_rd_val__h8114 = stage2_mbox$word;
      default: x_out_data_to_stage3_rd_val__h8114 =
		   _theResult___snd_snd_rd_val__h8063;
    endcase
  end
  always@(stage2_rg_stage2 or
	  _theResult___snd_snd_rd_val__h8063 or stage2_mbox$word)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd1, 3'd4:
	  x_out_bypass_rd_val__h9045 = stage2_rg_stage2[325:262];
      3'd3: x_out_bypass_rd_val__h9045 = stage2_mbox$word;
      default: x_out_bypass_rd_val__h9045 =
		   _theResult___snd_snd_rd_val__h8063;
    endcase
  end
  always@(stage2_rg_stage2 or _theResult___snd_fst_rd_val__h9208)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4: x_out_fbypass_rd_val__h9227 = stage2_rg_stage2[197:134];
      default: x_out_fbypass_rd_val__h9227 =
		   _theResult___snd_fst_rd_val__h9208;
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
	  data_to_stage2_rd__h9875 = stage1_rg_stage_input[144:140];
      7'b1100011: data_to_stage2_rd__h9875 = 5'd0;
      default: data_to_stage2_rd__h9875 = stage1_rg_stage_input[144:140];
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
	  _theResult___fst__h12585 or
	  rd_val___1__h16665 or
	  rd_val___1__h16719 or rd_val___1__h16764 or rd_val___1__h16713)
  begin
    case (stage1_rg_stage_input[97:88])
      10'b0: alu_outputs___1_val1__h10371 = rd_val___1__h16665;
      10'b0000000001: alu_outputs___1_val1__h10371 = rd_val___1__h16719;
      10'b0000000101: alu_outputs___1_val1__h10371 = rd_val___1__h16764;
      10'b0100000000: alu_outputs___1_val1__h10371 = rd_val___1__h16713;
      default: alu_outputs___1_val1__h10371 = _theResult___fst__h12585;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d425 or
	  IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d421 or
	  IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d423)
  begin
    case (stage1_rg_stage_input[112:110])
      3'd0:
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d775 =
	      !IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d421;
      3'b001:
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d775 =
	      IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d421;
      3'b100:
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d775 =
	      !IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d423;
      3'b101:
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d775 =
	      IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d423;
      3'b110:
	  IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d775 =
	      !IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d425;
      default: IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d775 =
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
	  NOT_stage1_rg_stage_input_32_BITS_99_TO_98_74__ETC___d753 or
	  csr_regfile$read_mstatus or
	  NOT_stage1_rg_stage_input_32_BITS_109_TO_105_2_ETC___d559)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000111, 7'b0100111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d756 =
	      csr_regfile$read_mstatus[14:13] == 2'h0 ||
	      stage1_rg_stage_input[112:110] != 3'b010 &&
	      stage1_rg_stage_input[112:110] != 3'b011;
      7'b0101111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d756 =
	      NOT_stage1_rg_stage_input_32_BITS_109_TO_105_2_ETC___d559;
      default: IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d756 =
		   csr_regfile_read_mstatus__9_BITS_14_TO_13_1_EQ_ETC___d573 ||
		   NOT_stage1_rg_stage_input_32_BITS_99_TO_98_74__ETC___d753;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d756)
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
		   IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d756;
    endcase
  end
  always@(stage1_rg_stage_input or
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q12 or
	  NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d479)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d764 =
	      NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d479;
      7'b0011011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d764 =
	      stage1_rg_stage_input[112:110] != 3'd0 &&
	      (stage1_rg_stage_input[112:110] != 3'b001 ||
	       stage1_rg_stage_input[263] ||
	       stage1_rg_stage_input[261:257] != 5'b0 ||
	       stage1_rg_stage_input[262]) &&
	      (stage1_rg_stage_input[112:110] != 3'b101 ||
	       stage1_rg_stage_input[263] ||
	       stage1_rg_stage_input[261:257] != 5'b0);
      7'b0111011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d764 =
	      stage1_rg_stage_input[97:88] != 10'b0 &&
	      stage1_rg_stage_input[97:88] != 10'b0100000000 &&
	      stage1_rg_stage_input[97:88] != 10'b0000000001 &&
	      stage1_rg_stage_input[97:88] != 10'b0000000101 &&
	      stage1_rg_stage_input[97:88] != 10'b0100000101;
      default: IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d764 =
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
	  NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d857 or
	  stage1_rg_stage_input_32_BITS_99_TO_98_74_EQ_0_ETC___d959 or
	  csr_regfile$read_mstatus)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000111, 7'b0100111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d962 =
	      csr_regfile$read_mstatus[14:13] != 2'h0 &&
	      (stage1_rg_stage_input[112:110] == 3'b010 ||
	       stage1_rg_stage_input[112:110] == 3'b011);
      7'b0101111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d962 =
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
      default: IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d962 =
		   NOT_csr_regfile_read_mstatus__9_BITS_14_TO_13__ETC___d857 &&
		   stage1_rg_stage_input_32_BITS_99_TO_98_74_EQ_0_ETC___d959;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d962)
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
		   IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d962;
    endcase
  end
  always@(stage1_rg_stage_input or
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14 or
	  stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d812)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d970 =
	      stage1_rg_stage_input_32_BITS_112_TO_110_80_EQ_ETC___d812;
      7'b0011011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d970 =
	      stage1_rg_stage_input[112:110] == 3'd0 ||
	      stage1_rg_stage_input[112:110] == 3'b001 &&
	      !stage1_rg_stage_input[263] &&
	      stage1_rg_stage_input[261:257] == 5'b0 &&
	      !stage1_rg_stage_input[262] ||
	      stage1_rg_stage_input[112:110] == 3'b101 &&
	      !stage1_rg_stage_input[263] &&
	      stage1_rg_stage_input[261:257] == 5'b0;
      7'b0111011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d970 =
	      stage1_rg_stage_input[97:88] == 10'b0 ||
	      stage1_rg_stage_input[97:88] == 10'b0100000000 ||
	      stage1_rg_stage_input[97:88] == 10'b0000000001 ||
	      stage1_rg_stage_input[97:88] == 10'b0000000101 ||
	      stage1_rg_stage_input[97:88] == 10'b0100000101;
      default: IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d970 =
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
  always@(stage1_rg_stage_input or alu_outputs___1_exc_code__h10752)
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
	  alu_outputs_exc_code__h11528 = 4'd2;
      7'b1100111, 7'b1101111: alu_outputs_exc_code__h11528 = 4'd0;
      7'b1110011:
	  alu_outputs_exc_code__h11528 = alu_outputs___1_exc_code__h10752;
      default: alu_outputs_exc_code__h11528 = 4'd2;
    endcase
  end
  always@(stage1_rg_stage_input or
	  _theResult_____1_fst__h12361 or
	  rd_val___1__h12329 or
	  rd_val___1__h12336 or rd_val___1__h12343 or rd_val___1__h12350)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b010: _theResult_____1_fst__h12333 = rd_val___1__h12329;
      3'b011: _theResult_____1_fst__h12333 = rd_val___1__h12336;
      3'b100: _theResult_____1_fst__h12333 = rd_val___1__h12343;
      3'b110: _theResult_____1_fst__h12333 = rd_val___1__h12350;
      default: _theResult_____1_fst__h12333 = _theResult_____1_fst__h12361;
    endcase
  end
  always@(stage1_rg_stage_input or
	  alu_outputs___1_addr__h10470 or
	  IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d1270 or
	  rs1_val_bypassed__h5370 or
	  alu_outputs___1_addr__h10096 or next_pc__h10144 or next_pc__h10109)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011, 7'b0000111:
	  x_out_data_to_stage2_addr__h9893 =
	      IF_stage1_rg_stage_input_32_BITS_139_TO_135_36_ETC___d1270;
      7'b0100011:
	  x_out_data_to_stage2_addr__h9893 = alu_outputs___1_addr__h10470;
      7'b0101111: x_out_data_to_stage2_addr__h9893 = rs1_val_bypassed__h5370;
      7'b1100011:
	  x_out_data_to_stage2_addr__h9893 = alu_outputs___1_addr__h10096;
      7'b1100111: x_out_data_to_stage2_addr__h9893 = next_pc__h10144;
      7'b1101111: x_out_data_to_stage2_addr__h9893 = next_pc__h10109;
      default: x_out_data_to_stage2_addr__h9893 =
		   alu_outputs___1_addr__h10470;
    endcase
  end
  always@(stage1_rg_stage_input or
	  next_pc__h10144 or branch_target__h10074 or next_pc__h10109)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011: x_out_cf_info_taken_PC__h16066 = branch_target__h10074;
      7'b1101111: x_out_cf_info_taken_PC__h16066 = next_pc__h10109;
      default: x_out_cf_info_taken_PC__h16066 = next_pc__h10144;
    endcase
  end
  always@(stage1_rg_stage_input or rs2_val_bypassed__h5376)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0100011, 7'b0101111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q19 =
	      rs2_val_bypassed__h5376;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q19 =
		   rs2_val_bypassed__h5376;
    endcase
  end
  always@(stage1_rg_stage_input or
	  NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d1655 or
	  data_to_stage2_addr__h9876)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100111, 7'b1101111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q20 =
	      data_to_stage2_addr__h9876;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q20 =
		   (stage1_rg_stage_input[151:145] == 7'b1110011 &&
		    stage1_rg_stage_input[112:110] == 3'd0 &&
		    NOT_rg_cur_priv_8_EQ_0b11_069_101_AND_NOT_rg_c_ETC___d1655) ?
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
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296 =
	      near_mem$dmem_valid && !near_mem$dmem_exc;
      3'd3:
	  IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296 =
	      stage2_mbox$valid;
      default: IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296 =
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
	  NOT_stage1_rg_stage_input_32_BITS_99_TO_98_74__ETC___d753 or
	  csr_regfile$read_mstatus or
	  NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1174 or
	  NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1167 or
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
	      NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1174 &&
	      NOT_stage1_rg_stage_input_32_BITS_112_TO_110_8_ETC___d1167;
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
		   NOT_stage1_rg_stage_input_32_BITS_99_TO_98_74__ETC___d753;
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
	  rs1_val_bypassed__h5370 or
	  alu_outputs___1_val1__h10314 or
	  rd_val__h10406 or
	  alu_outputs___1_val1__h10343 or
	  alu_outputs___1_val1__h10784 or
	  rd_val__h10385 or
	  alu_outputs___1_val1__h10371 or alu_outputs___1_val1__h10756)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1530 =
	      alu_outputs___1_val1__h10314;
      7'b0010111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1530 =
	      rd_val__h10406;
      7'b0011011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1530 =
	      alu_outputs___1_val1__h10343;
      7'b0101111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1530 =
	      alu_outputs___1_val1__h10784;
      7'b0110111:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1530 =
	      rd_val__h10385;
      7'b0111011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1530 =
	      alu_outputs___1_val1__h10371;
      7'b1110011:
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1530 =
	      alu_outputs___1_val1__h10756;
      default: IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1530 =
		   rs1_val_bypassed__h5370;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1532 or
	  x_out_cf_info_fallthru_PC__h16065)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100111, 7'b1101111:
	  x_out_data_to_stage2_val1__h9894 =
	      x_out_cf_info_fallthru_PC__h16065;
      default: x_out_data_to_stage2_val1__h9894 =
		   IF_stage1_rg_stage_input_32_BITS_151_TO_145_78_ETC___d1532;
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
	  stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d800 or
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q21)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011, 7'b1100111, 7'b1101111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q22 = 3'd0;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q22 =
		   (stage1_rg_stage_input[151:145] == 7'b0110011 &&
		    stage1_rg_stage_input[104:98] == 7'b0000001 ||
		    stage1_rg_stage_input_32_BITS_151_TO_145_78_EQ_ETC___d800) ?
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
	$write(" sxl:%0d uxl:%0d", sxl__h6710, uxl__h6711);
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
	       x_out_data_to_stage3_fpr_flags__h8117);
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
	       x_out_data_to_stage3_rd__h8113,
	       x_out_data_to_stage3_frd_val__h8118);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage2_rg_full &&
	  stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_0_17_ETC___d244)
	$write("  grd:%0d  rd_val:%h\n",
	       x_out_data_to_stage3_rd__h8113,
	       x_out_data_to_stage3_rd_val__h8114);
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
	$write("'h%h", value__h8443);
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
	$write("'h%h", x_out_trap_info_exc_code__h8553);
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
	$write("'h%h", value__h8657, " }");
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
	$write("'h%h", value__h8443);
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
	$write("'h%h", x_out_trap_info_exc_code__h8553);
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
	$write("'h%h", value__h8657, " }");
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
	$write("Rd %0d ", x_out_bypass_rd__h9044);
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
	$write("rd_val:%h", x_out_bypass_rd_val__h9045);
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
	$write("FRd %0d ", x_out_fbypass_rd__h9226);
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
	$write("frd_val:%h", x_out_fbypass_rd_val__h9227);
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("Output_Stage1",
	       " NONPIPE: pc:%h",
	       stage1_rg_stage_input[401:338]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1000)
	$write("CONTROL_STRAIGHT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1008)
	$write("CONTROL_BRANCH");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1019)
	$write("CONTROL_CSRR_W");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1034)
	$write("CONTROL_CSRR_S_or_C");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1052)
	$write("CONTROL_FENCE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1066)
	$write("CONTROL_FENCE_I");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1083)
	$write("CONTROL_SFENCE_VMA");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1098)
	$write("CONTROL_MRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1123)
	$write("CONTROL_SRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1145)
	$write("CONTROL_WFI");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1229)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1240)
	$write("{", "CF_None");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1248)
	$write("{", "BR ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1253)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1240)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1248)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1259)
	$write("JAL [%h->%h/%h]",
	       stage1_rg_stage_input[401:338],
	       x_out_cf_info_taken_PC__h16066,
	       x_out_cf_info_fallthru_PC__h16065);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1288)
	$write("JALR [%h->%h/%h]",
	       stage1_rg_stage_input[401:338],
	       x_out_cf_info_taken_PC__h16066,
	       x_out_cf_info_fallthru_PC__h16065);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1240)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1248)
	if (stage1_rg_stage_input[151:145] != 7'b1100011 ||
	    IF_stage1_rg_stage_input_32_BITS_112_TO_110_80_ETC___d432)
	  $write("taken ");
	else
	  $write("fallthru ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1253)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1240)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1248)
	$write("[%h->%h %h]",
	       stage1_rg_stage_input[401:338],
	       x_out_cf_info_fallthru_PC__h16065,
	       x_out_cf_info_taken_PC__h16066);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1253)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1310)
	$write("OP_Stage2_ALU");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1327)
	$write("OP_Stage2_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d1345)
	$write("OP_Stage2_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d368 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d375 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1378)
	$write("OP_Stage2_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1385)
	$write("OP_Stage2_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_NOT_stage2_rg_full_14_71_ETC___d1411)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
	$write("  rd:%0d\n", x_out_data_to_stage2_rd__h9892);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
	$write("            addr:%h  val1:%h  val2:%h}",
	       x_out_data_to_stage2_addr__h9893,
	       x_out_data_to_stage2_val1__h9894,
	       x_out_data_to_stage2_val2__h9895);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
	$write("            fval1:%h  fval2:%h  fval3:%h}",
	       x_out_data_to_stage2_fval1__h9896,
	       alu_outputs___1_fval2__h10474,
	       x_out_data_to_stage2_fval3__h9898);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d1598)
	$write("CONTROL_STRAIGHT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1005)
	$write("CONTROL_BRANCH");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1017)
	$write("CONTROL_CSRR_W");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1032)
	$write("CONTROL_CSRR_S_or_C");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1050)
	$write("CONTROL_FENCE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1064)
	$write("CONTROL_FENCE_I");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1081)
	$write("CONTROL_SFENCE_VMA");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1096)
	$write("CONTROL_MRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1121)
	$write("CONTROL_SRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1143)
	$write("CONTROL_WFI");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d334 &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784 &&
	  stage2_rg_full_14_AND_NOT_stage2_rg_stage2_15__ETC___d1226)
	$write("CONTROL_TRAP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("Trap_Info { ", "epc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("'h%h", stage1_rg_stage_input[401:338]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("'h%h", x_out_trap_info_exc_code__h14913);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write(", ", "tval: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
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
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d784)
	$write("'h%h", value__h14978, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d984)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_31_AND_stage1_rg_stage_input_32_ETC___d363)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1670)
	$write("\n        redirect next_pc:%h", x_out_next_pc__h9637);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_32_BITS_335_TO_334_3_ETC___d1674)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$display("    StageD: pc 0x%08h instr 0x%08h priv %0d epoch %0d",
		 stageD_rg_data[233:170],
		 x_out_data_to_stage1_instr__h17442,
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
	       x_out_data_to_stage1_instr__h17442,
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
		 d_instr__h25151,
		 stageF_rg_priv,
		 stageF_rg_epoch);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("Output_StageF");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2122))
	$write(" BUSY: pc:%h", imem_rg_pc);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129)
	$write(" PIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write(" EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2122))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129)
	$write("data_to_StageD {pc:%h  priv:%0d  epoch:%0d",
	       imem_rg_pc,
	       stageF_rg_priv,
	       stageF_rg_epoch);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2122))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem$imem_exc)
	$write("  ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_104_AND_near_mem_imem_valid_AND_ETC___d2136)
	$write("  instr:%h  pred_pc:%h",
	       d_instr__h25151,
	       stageF_branch_predictor$predict_rsp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2122))
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
	  near_mem_imem_valid_AND_near_mem_imem_exc__1_A_ETC___d2224)
	$write("unknown trap Exc_Code %d", near_mem$imem_exc_code);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_104_AND_near_mem_imem_valid_AND_ETC___d2136)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   NOT_near_mem_imem_exc__1_2_AND_imem_rg_pc_BITS_ETC___d2122))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  near_mem_imem_exc__1_OR_NOT_imem_rg_pc_BITS_1__ETC___d2129)
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
	$display("    CPI: %0d.%0d = (%0d/%0d) since last 'continue'",
		 cpi__h33604,
		 cpifrac__h33605,
		 delta_CPI_cycles__h33600,
		 _theResult____h33602);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  rg_trap_info_787_BITS_131_TO_68_788_EQ_csr_reg_ETC___d2797)
	$finish(32'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  (cur_verbosity__h3719 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 rg_trap_info[131:68],
		 rg_trap_instr,
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap && cur_verbosity__h3719 != 4'd0)
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
	  (cur_verbosity__h3719 != 4'd0 ||
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
		 rs1_val__h34220,
		 rg_trap_instr[31:20],
		 csr_regfile$read_csr[63:0],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W_2 &&
	  !csr_regfile$access_permitted_1 &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    Trap on CSR permissions: Rs1 %0d Rs1_val 0x%0h csr 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h34220,
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
	  (cur_verbosity__h3719 != 4'd0 ||
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
		 rs1_val__h35054,
		 rg_trap_instr[31:20],
		 csr_regfile$read_csr[63:0],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	  !csr_regfile$access_permitted_2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("    Trap on CSR permissions: Rs1 %0d Rs1_val 0x%0h csr 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h35054,
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
	       new_epoch__h26600,
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
		 new_epoch__h26600);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_xRET &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage1_xRET", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_xRET &&
	  (cur_verbosity__h3719 != 4'd0 ||
	   csr_regfile$read_csr_minstret[19:0] == 20'd0))
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_xRET && cur_verbosity__h3719 != 4'd0)
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
	  (cur_verbosity__h3719 != 4'd0 ||
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
	       new_epoch__h26600,
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
		 new_epoch__h26600);
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
	  (cur_verbosity__h3719 != 4'd0 ||
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
	       new_epoch__h26600,
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
		 new_epoch__h26600);
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
	  (cur_verbosity__h3719 != 4'd0 ||
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
	       new_epoch__h26600,
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
		 new_epoch__h26600);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_WFI &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage1_WFI", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_WFI &&
	  (cur_verbosity__h3719 != 4'd0 ||
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
	       new_epoch__h26600,
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
		 new_epoch__h26600);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_from_WFI &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_reset_from_WFI", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap_fetch &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h26600,
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
		 new_epoch__h26600);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_interrupt &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$display("%0d: %m.rl_stage1_interrupt", csr_regfile$read_csr_mcycle);
    if (WILL_FIRE_RL_imem_rl_assert_fail)
      begin
        v__h2440 = $stime;
	#0;
      end
    v__h2434 = v__h2440 / 32'd10;
    if (WILL_FIRE_RL_imem_rl_assert_fail)
      $display("%0d: ERROR: CPU_Fetch_C: imem32.is_i32_not_i16 is False",
	       v__h2434);
    if (WILL_FIRE_RL_imem_rl_assert_fail) $finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset)
	$display("%0d: %m.rl_reset_complete: restart at PC = 0x%0h",
		 csr_regfile$read_csr_mcycle,
		 64'd4096);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	  NOT_IF_csr_regfile_read_csr_minstret__0_ULT_cf_ETC___d56)
	$write("    %m.CPU_StageF.ma_enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       64'd4096,
	       new_epoch__h26600,
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
		 64'd4096,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h26600);
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
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2373)
	$write("    S3.enq: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2373)
	$write("data_to_Stage3 {pc:%h  instr:%h  priv:%0d\n",
	       stage2_rg_stage2[493:430],
	       stage2_rg_stage2[429:398],
	       stage2_rg_stage2[495:494]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2373)
	$write("        rd_valid:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_IF_stage2_rg_stage2_15_B_ETC___d2376)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2378)
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2380)
	$write("  fflags: %05b",
	       "'h%h",
	       x_out_data_to_stage3_fpr_flags__h8117);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2382)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2384)
	$write("  frd:%0d  rd_val:%h\n",
	       x_out_data_to_stage3_rd__h8113,
	       x_out_data_to_stage3_frd_val__h8118);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2386)
	$write("  grd:%0d  rd_val:%h\n",
	       x_out_data_to_stage3_rd__h8113,
	       x_out_data_to_stage3_rd_val__h8114);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2373)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  stage2_rg_full_14_AND_stage2_rg_stage2_15_BITS_ETC___d2392)
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage2_rg_stage2[493:430],
		 stage2_rg_stage2[429:398],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  (stage2_rg_stage2[397:395] == 3'd0 ||
	   IF_stage2_rg_stage2_15_BITS_397_TO_395_16_EQ_1_ETC___d2296 ||
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
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398 &&
	  stage1_rg_full &&
	  NOT_stage2_rg_full_14_71_OR_stage2_rg_stage2_1_ETC___d2300 &&
	  stage1_rg_stage_input_32_BITS_335_TO_334_33_EQ_ETC___d2626)
	$write("OP_Stage2_FD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2601)
	$write("  rd:%0d\n", x_out_data_to_stage2_rd__h9892);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2601)
	$write("            addr:%h  val1:%h  val2:%h}",
	       x_out_data_to_stage2_addr__h9893,
	       x_out_data_to_stage2_val1__h9894,
	       x_out_data_to_stage2_val2__h9895);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2601)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2601)
	$write("            fval1:%h  fval2:%h  fval3:%h}",
	       x_out_data_to_stage2_fval1__h9896,
	       alu_outputs___1_fval2__h10474,
	       x_out_data_to_stage2_fval3__h9898);
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
	$display("Copyright (c) 2016-2022 Bluespec, Inc. All Rights Reserved.");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_start)
	$display("================================================================");
  end
  // synopsys translate_on
endmodule