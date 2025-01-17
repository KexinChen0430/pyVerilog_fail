module outputs
  wire [63 : 0] dmem_master_araddr,
		dmem_master_awaddr,
		dmem_master_wdata,
		imem_master_araddr,
		imem_master_awaddr,
		imem_master_wdata;
  wire [7 : 0] dmem_master_arlen,
	       dmem_master_awlen,
	       dmem_master_wstrb,
	       imem_master_arlen,
	       imem_master_awlen,
	       imem_master_wstrb;
  wire [3 : 0] dmem_master_arcache,
	       dmem_master_arid,
	       dmem_master_arqos,
	       dmem_master_arregion,
	       dmem_master_awcache,
	       dmem_master_awid,
	       dmem_master_awqos,
	       dmem_master_awregion,
	       imem_master_arcache,
	       imem_master_arid,
	       imem_master_arqos,
	       imem_master_arregion,
	       imem_master_awcache,
	       imem_master_awid,
	       imem_master_awqos,
	       imem_master_awregion;
  wire [2 : 0] dmem_master_arprot,
	       dmem_master_arsize,
	       dmem_master_awprot,
	       dmem_master_awsize,
	       imem_master_arprot,
	       imem_master_arsize,
	       imem_master_awprot,
	       imem_master_awsize;
  wire [1 : 0] dmem_master_arburst,
	       dmem_master_awburst,
	       imem_master_arburst,
	       imem_master_awburst;
  wire RDY_hart0_server_reset_request_put,
       RDY_hart0_server_reset_response_get,
       RDY_set_verbosity,
       dmem_master_arlock,
       dmem_master_arvalid,
       dmem_master_awlock,
       dmem_master_awvalid,
       dmem_master_bready,
       dmem_master_rready,
       dmem_master_wlast,
       dmem_master_wvalid,
       hart0_server_reset_response_get,
       imem_master_arlock,
       imem_master_arvalid,
       imem_master_awlock,
       imem_master_awvalid,
       imem_master_bready,
       imem_master_rready,
       imem_master_wlast,
       imem_master_wvalid;
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
  wire [63 : 0] imem_rg_cache_addr$D_IN;
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
  reg [1 : 0] near_mem$dmem_req_op;
  wire [63 : 0] near_mem$dmem_master_araddr,
		near_mem$dmem_master_awaddr,
		near_mem$dmem_master_rdata,
		near_mem$dmem_master_wdata,
		near_mem$dmem_req_addr,
		near_mem$dmem_req_satp,
		near_mem$dmem_word64,
		near_mem$imem_master_araddr,
		near_mem$imem_master_awaddr,
		near_mem$imem_master_rdata,
		near_mem$imem_master_wdata,
		near_mem$imem_pc,
		near_mem$imem_req_satp;
  wire [31 : 0] near_mem$imem_instr;
  wire [7 : 0] near_mem$dmem_master_arlen,
	       near_mem$dmem_master_awlen,
	       near_mem$dmem_master_wstrb,
	       near_mem$imem_master_arlen,
	       near_mem$imem_master_awlen,
	       near_mem$imem_master_wstrb,
	       near_mem$server_fence_request_put;
  wire [6 : 0] near_mem$dmem_req_amo_funct7;
  wire [3 : 0] near_mem$dmem_exc_code,
	       near_mem$dmem_master_arcache,
	       near_mem$dmem_master_arid,
	       near_mem$dmem_master_arqos,
	       near_mem$dmem_master_arregion,
	       near_mem$dmem_master_awcache,
	       near_mem$dmem_master_awid,
	       near_mem$dmem_master_awqos,
	       near_mem$dmem_master_awregion,
	       near_mem$dmem_master_bid,
	       near_mem$dmem_master_rid,
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
	       near_mem$imem_master_rid;
  wire [2 : 0] near_mem$dmem_master_arprot,
	       near_mem$dmem_master_arsize,
	       near_mem$dmem_master_awprot,
	       near_mem$dmem_master_awsize,
	       near_mem$dmem_req_f3,
	       near_mem$imem_master_arprot,
	       near_mem$imem_master_arsize,
	       near_mem$imem_master_awprot,
	       near_mem$imem_master_awsize,
	       near_mem$imem_req_f3;
  wire [1 : 0] near_mem$dmem_master_arburst,
	       near_mem$dmem_master_awburst,
	       near_mem$dmem_master_bresp,
	       near_mem$dmem_master_rresp,
	       near_mem$dmem_req_priv,
	       near_mem$imem_master_arburst,
	       near_mem$imem_master_awburst,
	       near_mem$imem_master_bresp,
	       near_mem$imem_master_rresp,
	       near_mem$imem_req_priv;
  wire near_mem$EN_dmem_req,
       near_mem$EN_imem_req,
       near_mem$EN_server_fence_i_request_put,
       near_mem$EN_server_fence_i_response_get,
       near_mem$EN_server_fence_request_put,
       near_mem$EN_server_fence_response_get,
       near_mem$EN_server_reset_request_put,
       near_mem$EN_server_reset_response_get,
       near_mem$EN_sfence_vma,
       near_mem$RDY_server_fence_i_request_put,
       near_mem$RDY_server_fence_i_response_get,
       near_mem$RDY_server_fence_request_put,
       near_mem$RDY_server_fence_response_get,
       near_mem$RDY_server_reset_request_put,
       near_mem$RDY_server_reset_response_get,
       near_mem$dmem_exc,
       near_mem$dmem_master_arlock,
       near_mem$dmem_master_arready,
       near_mem$dmem_master_arvalid,
       near_mem$dmem_master_awlock,
       near_mem$dmem_master_awready,
       near_mem$dmem_master_awvalid,
       near_mem$dmem_master_bready,
       near_mem$dmem_master_bvalid,
       near_mem$dmem_master_rlast,
       near_mem$dmem_master_rready,
       near_mem$dmem_master_rvalid,
       near_mem$dmem_master_wlast,
       near_mem$dmem_master_wready,
       near_mem$dmem_master_wvalid,
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
       near_mem$imem_valid;
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
       CAN_FIRE_dmem_master_m_arready,
       CAN_FIRE_dmem_master_m_awready,
       CAN_FIRE_dmem_master_m_bvalid,
       CAN_FIRE_dmem_master_m_rvalid,
       CAN_FIRE_dmem_master_m_wready,
       CAN_FIRE_hart0_server_reset_request_put,
       CAN_FIRE_hart0_server_reset_response_get,
       CAN_FIRE_imem_master_m_arready,
       CAN_FIRE_imem_master_m_awready,
       CAN_FIRE_imem_master_m_bvalid,
       CAN_FIRE_imem_master_m_rvalid,
       CAN_FIRE_imem_master_m_wready,
       CAN_FIRE_m_external_interrupt_req,
       CAN_FIRE_nmi_req,
       CAN_FIRE_s_external_interrupt_req,
       CAN_FIRE_set_verbosity,
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
       WILL_FIRE_dmem_master_m_arready,
       WILL_FIRE_dmem_master_m_awready,
       WILL_FIRE_dmem_master_m_bvalid,
       WILL_FIRE_dmem_master_m_rvalid,
       WILL_FIRE_dmem_master_m_wready,
       WILL_FIRE_hart0_server_reset_request_put,
       WILL_FIRE_hart0_server_reset_response_get,
       WILL_FIRE_imem_master_m_arready,
       WILL_FIRE_imem_master_m_awready,
       WILL_FIRE_imem_master_m_bvalid,
       WILL_FIRE_imem_master_m_rvalid,
       WILL_FIRE_imem_master_m_wready,
       WILL_FIRE_m_external_interrupt_req,
       WILL_FIRE_nmi_req,
       WILL_FIRE_s_external_interrupt_req,
       WILL_FIRE_set_verbosity,
       WILL_FIRE_software_interrupt_req,
       WILL_FIRE_timer_interrupt_req;
  // inputs to muxes for submodule ports
  reg [131 : 0] MUX_rg_trap_info$write_1__VAL_2;
  reg [63 : 0] MUX_csr_regfile$mav_csr_write_2__VAL_2;
  wire [131 : 0] MUX_rg_trap_info$write_1__VAL_1,
		 MUX_rg_trap_info$write_1__VAL_3,
		 MUX_rg_trap_info$write_1__VAL_4;
  wire [63 : 0] MUX_imem_rg_tval$write_1__VAL_4,
		MUX_near_mem$imem_req_2__VAL_1,
		MUX_near_mem$imem_req_2__VAL_2,
		MUX_near_mem$imem_req_2__VAL_4;
  wire [31 : 0] MUX_rg_trap_instr$write_1__VAL_1;
  wire [3 : 0] MUX_rg_state$write_1__VAL_2,
	       MUX_rg_state$write_1__VAL_3,
	       MUX_rg_state$write_1__VAL_4;
  wire MUX_csr_regfile$mav_csr_write_1__SEL_1,
       MUX_gpr_regfile$write_rd_1__SEL_2,
       MUX_imem_rg_cache_addr$write_1__SEL_3,
       MUX_imem_rg_f3$write_1__SEL_1,
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
       MUX_stageD_rg_full$write_1__VAL_2,
       MUX_stageF_rg_full$write_1__VAL_2;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h2327;
  reg [31 : 0] v__h2321;
  // synopsys translate_on
  // remaining internal signals
  reg [63 : 0] CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q23,
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q24,
	       IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1299,
	       _theResult_____1_fst__h10382,
	       alu_outputs___1_val1__h9176,
	       rs1_val__h29435,
	       value__h7948,
	       value__h8009,
	       x_out_bypass_rd_val__h8251,
	       x_out_cf_info_taken_PC__h12677,
	       x_out_data_to_stage2_addr__h8768,
	       x_out_data_to_stage2_val1__h8769,
	       x_out_data_to_stage3_frd_val__h7710,
	       x_out_data_to_stage3_rd_val__h7706,
	       x_out_fbypass_rd_val__h8379;
  reg [4 : 0] data_to_stage2_rd__h8750,
	      x_out_bypass_rd__h8250,
	      x_out_data_to_stage3_fpr_flags__h7709,
	      x_out_data_to_stage3_rd__h7705,
	      x_out_fbypass_rd__h8378;
  reg [3 : 0] CASE_rg_cur_priv_0b0_8_0b1_9_11__q7,
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q17,
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q18,
	      CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q8,
	      IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d992,
	      IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d995,
	      IF_stage1_rg_stage_input_11_BITS_87_TO_76_47_E_ETC___d970,
	      alu_outputs_exc_code__h9734,
	      x_out_trap_info_exc_code__h7985;
  reg [2 : 0] CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q21,
	      CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q22;
  reg [1 : 0] CASE_stage2_rg_stage2_BITS_397_TO_395_0_2_1_IF_ETC__q3,
	      CASE_stage2_rg_stage2_BITS_397_TO_395_0_2_1_IF_ETC__q4,
	      CASE_stage2_rg_stage2_BITS_397_TO_395_1_IF_NOT_ETC__q5,
	      IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d1080;
  reg CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q13,
      CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14,
      CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q15,
      CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q16,
      CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_st_ETC__q26,
      CASE_stage2_rg_stage2_BITS_397_TO_395_1_stage2_ETC__q25,
      IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d401,
      IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d725,
      IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d708,
      IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d716,
      IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d901,
      IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d909,
      IF_stage2_rg_stage2_12_BITS_397_TO_395_13_EQ_1_ETC___d163,
      IF_stage2_rg_stage2_12_BITS_397_TO_395_13_EQ_1_ETC___d173;
  wire [127 : 0] csr_regfile_read_csr_mcycle__4_MINUS_rg_start__ETC___d2426;
  wire [63 : 0] IF_csr_regfile_read_csr_rg_trap_instr_423_BITS_ETC___d2478,
		IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d1109,
		IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1300,
		IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1301,
		IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1310,
		SEXT_stage1_rg_stage_input_11_BITS_87_TO_76_47___d1108,
		_theResult_____1_fst__h10375,
		_theResult_____1_fst__h10410,
		_theResult____h28277,
		_theResult___fst__h10501,
		_theResult___fst__h10508,
		_theResult___fst__h10589,
		_theResult___snd__h13025,
		_theResult___snd_fst_rd_val__h8370,
		_theResult___snd_snd_rd_val__h7681,
		addr_of_b32___1__h23411,
		addr_of_b32___1__h27220,
		addr_of_b32___1__h36407,
		addr_of_b32__h23299,
		addr_of_b32__h27108,
		addr_of_b32__h36295,
		alu_outputs___1_addr__h8931,
		alu_outputs___1_addr__h9276,
		alu_outputs___1_fval2__h9280,
		alu_outputs___1_val1__h9077,
		alu_outputs___1_val1__h9120,
		alu_outputs___1_val1__h9148,
		alu_outputs___1_val1__h9559,
		alu_outputs___1_val1__h9586,
		alu_outputs_cf_info_fallthru_PC__h12668,
		alu_outputs_cf_info_taken_PC__h12669,
		branch_target__h8909,
		cpi__h28279,
		cpifrac__h28280,
		data_to_stage2_addr__h8751,
		delta_CPI_cycles__h28275,
		delta_CPI_instrs___1__h28312,
		delta_CPI_instrs__h28276,
		fall_through_pc__h8685,
		next_pc___1__h12208,
		next_pc__h12205,
		next_pc__h8686,
		next_pc__h8944,
		next_pc__h8978,
		output_stage2___1_data_to_stage3_frd_val__h7610,
		rd_val___1__h10363,
		rd_val___1__h10371,
		rd_val___1__h10378,
		rd_val___1__h10385,
		rd_val___1__h10392,
		rd_val___1__h10399,
		rd_val___1__h13054,
		rd_val___1__h13085,
		rd_val___1__h13138,
		rd_val___1__h13167,
		rd_val___1__h13219,
		rd_val___1__h13267,
		rd_val___1__h13273,
		rd_val___1__h13318,
		rd_val__h12922,
		rd_val__h12973,
		rd_val__h12995,
		rd_val__h8563,
		rd_val__h8588,
		rd_val__h8613,
		rd_val__h8636,
		rd_val__h8662,
		rd_val__h9190,
		rd_val__h9211,
		rs1_val__h28755,
		rs1_val_bypassed__h5224,
		rs2_val_bypassed__h5230,
		trap_info_tval__h12430,
		val__h8565,
		val__h8590,
		value__h12540,
		x__h28278,
		x_out_cf_info_fallthru_PC__h12676,
		x_out_data_to_stage2_fval1__h8771,
		x_out_data_to_stage2_fval3__h8773,
		x_out_data_to_stage2_val2__h8770,
		x_out_next_pc__h8703,
		y__h29704;
  wire [31 : 0] IF_NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem__ETC___d1877,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1718,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1719,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1720,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1721,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1722,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1723,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1724,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1726,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1728,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1730,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1732,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1733,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1734,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1736,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1737,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1738,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1740,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1742,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1743,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1745,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1746,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1747,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1748,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1749,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1750,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1751,
		IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1752,
		IF_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg_p_ETC___d1878,
		IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC__q20,
		_theResult____h5511,
		d_instr__h21381,
		instr___1__h13798,
		instr__h13975,
		instr__h14120,
		instr__h14312,
		instr__h14507,
		instr__h14736,
		instr__h15189,
		instr__h15305,
		instr__h15370,
		instr__h15687,
		instr__h16025,
		instr__h16209,
		instr__h16338,
		instr__h16565,
		instr__h16820,
		instr__h16992,
		instr__h17161,
		instr__h17350,
		instr__h17539,
		instr__h17656,
		instr__h17834,
		instr__h17953,
		instr__h18048,
		instr__h18184,
		instr__h18320,
		instr__h18456,
		instr__h18594,
		instr__h18732,
		instr__h18890,
		instr__h18986,
		instr__h19139,
		instr__h19338,
		instr__h19489,
		instr__h19694,
		instr__h20502,
		instr__h20675,
		instr__h20874,
		instr__h21025,
		instr_out___1__h21383,
		instr_out___1__h21405,
		rs1_val_bypassed224_BITS_31_TO_0_MINUS_rs2_val_ETC__q12,
		rs1_val_bypassed224_BITS_31_TO_0_PLUS_rs2_val__ETC__q11,
		rs1_val_bypassed224_BITS_31_TO_0_SRL_rs2_val_b_ETC__q10,
		rs1_val_bypassed224_BITS_31_TO_0__q9,
		tmp__h13166,
		v32__h9188,
		x__h13088,
		x__h13141,
		x__h13276,
		x__h13321,
		x_out_data_to_stage1_instr__h13762;
  wire [20 : 0] SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1525,
		decoded_instr_imm21_UJ__h25802,
		stage1_rg_stage_input_BITS_30_TO_10__q2;
  wire [19 : 0] imm20__h16077;
  wire [12 : 0] SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1550,
		decoded_instr_imm13_SB__h25800,
		stage1_rg_stage_input_BITS_63_TO_51__q1;
  wire [11 : 0] decoded_instr_imm12_S__h25799,
		imm12__h13976,
		imm12__h14313,
		imm12__h15949,
		imm12__h16618,
		imm12__h16833,
		imm12__h17029,
		imm12__h17366,
		imm12__h18987,
		imm12__h19339,
		offset__h14683,
		stage1_rg_stage_input_BITS_75_TO_64__q6,
		stage1_rg_stage_input_BITS_87_TO_76__q19;
  wire [9 : 0] decoded_instr_funct10__h25797,
	       nzimm10__h16616,
	       nzimm10__h16831;
  wire [8 : 0] offset__h15314, offset__h18901;
  wire [7 : 0] offset__h13848, offset__h19273;
  wire [6 : 0] offset__h14255;
  wire [5 : 0] imm6__h15947, shamt__h9064;
  wire [4 : 0] offset_BITS_4_TO_0___h14244,
	       offset_BITS_4_TO_0___h14675,
	       offset_BITS_4_TO_0___h19614,
	       rd__h14315,
	       rs1__h14314,
	       x_out_data_to_stage2_rd__h8767;
  wire [3 : 0] IF_NOT_csr_regfile_read_mstatus__6_BITS_14_TO__ETC___d980,
	       IF_NOT_stage1_rg_stage_input_11_BITS_112_TO_11_ETC___d924,
	       IF_rg_cur_priv_5_EQ_0b11_39_OR_rg_cur_priv_5_E_ETC___d968,
	       IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d930,
	       IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d934,
	       IF_stage1_rg_stage_input_11_BITS_144_TO_140_37_ETC___d972,
	       IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998,
	       alu_outputs___1_exc_code__h9555,
	       cur_verbosity__h3508,
	       x_exc_code__h36657,
	       x_out_trap_info_exc_code__h12435;
  wire [2 : 0] IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147,
	       rm__h9688,
	       x_out_data_to_stage2_rounding_mode__h8777;
  wire [1 : 0] IF_NOT_near_mem_dmem_valid__35_57_OR_NOT_near__ETC___d270,
	       IF_NOT_near_mem_dmem_valid__35_57_OR_NOT_near__ETC___d290,
	       IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d295,
	       IF_near_mem_dmem_valid__35_THEN_IF_near_mem_dm_ETC___d138,
	       IF_stage2_fbox_valid__41_THEN_2_ELSE_1___d142,
	       IF_stage2_mbox_valid__39_THEN_2_ELSE_1___d140,
	       IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147,
	       IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d277,
	       new_epoch__h22810,
	       sxl__h6552,
	       uxl__h6553;
  wire IF_IF_stage1_rg_stage_input_11_BITS_151_TO_145_ETC___d1445,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2093,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2096,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2291,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2332,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2339,
       IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351,
       IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d2178,
       IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d320,
       IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d321,
       IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d324,
       IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d390,
       IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d392,
       IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d394,
       IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d719,
       IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d730,
       IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d912,
       IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d914,
       IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d2078,
       IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d2162,
       IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d2164,
       IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d315,
       IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d317,
       IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327,
       IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917,
       NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53,
       NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d2086,
       NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351,
       NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2085,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2089,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2098,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2100,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2106,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2168,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2175,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2261,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2288,
       NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398,
       NOT_csr_regfile_read_mstatus__6_BITS_14_TO_13__ETC___d897,
       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1860,
       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1874,
       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1903,
       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905,
       NOT_rg_cur_priv_5_EQ_0b11_39_427_AND_NOT_rg_cu_ETC___d1433,
       NOT_rg_next_pc_489_BITS_1_TO_0_490_EQ_0b0_491__ETC___d2498,
       NOT_soc_map_m_pc_reset_value__054_BITS_1_TO_0__ETC___d2069,
       NOT_stage1_rg_full_10_21_OR_stage1_rg_stage_in_ETC___d2121,
       NOT_stage1_rg_full_10_21_OR_stage1_rg_stage_in_ETC___d2123,
       NOT_stage1_rg_stage_input_11_BITS_112_TO_110_5_ETC___d437,
       NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1071,
       NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1083,
       NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1087,
       NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1093,
       NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d2546,
       NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d2550,
       NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d2360,
       csr_regfile_RDY_server_reset_request_put__006__ETC___d2018,
       csr_regfile_RDY_server_reset_response_get__027_ETC___d2048,
       csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2342,
       csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2346,
       csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2349,
       csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2385,
       csr_regfile_read_misa__3_BIT_2_460_AND_stageD__ETC___d1535,
       csr_regfile_read_misa__3_BIT_2_460_AND_stageD__ETC___d1541,
       csr_regfile_read_mstatus__6_BITS_14_TO_13_8_EQ_ETC___d704,
       f_reset_rsps_i_notFull__033_AND_NOT_rg_run_on__ETC___d2042,
       gpr_regfile_RDY_server_reset_request_put__003__ETC___d2021,
       imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1892,
       imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1896,
       imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1899,
       imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2038,
       imem_rg_pc_BITS_63_TO_2_0_EQ_imem_rg_cache_add_ETC___d1852,
       imem_rg_pc_BITS_63_TO_2_0_EQ_near_mem_imem_pc__ETC___d13,
       near_mem_imem_pc__1_EQ_imem_rg_pc_PLUS_2_854___d1855,
       near_mem_imem_valid_AND_NOT_imem_rg_pc_BITS_1__ETC___d2001,
       rg_cur_priv_5_EQ_0b11_39_OR_rg_cur_priv_5_EQ_0_ETC___d1418,
       rg_cur_priv_5_EQ_0b11_39_OR_rg_cur_priv_5_EQ_0_ETC___d966,
       rg_state_4_EQ_12_1_AND_csr_regfile_wfi_resume__ETC___d2537,
       rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2402,
       rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2513,
       rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2522,
       rg_state_4_EQ_3_108_AND_stage3_rg_full_5_OR_NO_ETC___d2118,
       rg_state_4_EQ_3_108_AND_stage3_rg_full_5_OR_NO_ETC___d2127,
       rg_state_4_EQ_5_541_AND_NOT_stageF_rg_full_882_ETC___d2542,
       rg_state_4_EQ_8_486_AND_NOT_stageF_rg_full_882_ETC___d2487,
       rg_trap_info_412_BITS_131_TO_68_413_EQ_csr_reg_ETC___d2422,
       stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d1180,
       stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920,
       stage1_rg_stage_input_11_BITS_112_TO_110_55_EQ_ETC___d757,
       stage1_rg_stage_input_11_BITS_144_TO_140_37_EQ_ETC___d945,
       stage1_rg_stage_input_11_BITS_151_TO_145_53_EQ_ETC___d2223,
       stage1_rg_stage_input_11_BITS_151_TO_145_53_EQ_ETC___d750,
       stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d1387,
       stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d2081,
       stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313,
       stage3_rg_full_5_OR_NOT_IF_stage2_rg_full_11_T_ETC___d2116,
       stage3_rg_stage3_7_BITS_139_TO_135_06_EQ_stage_ETC___d376,
       stage3_rg_stage3_7_BITS_139_TO_135_06_EQ_stage_ETC___d384,
       stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1914,
       stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1920,
       stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1924,
       stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1928,
       stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1932,
       stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1936,
       stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1940,
       stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1944,
       stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1948,
       stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1952,
       stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1956,
       stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1960,
       stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1964,
       stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1968,
       stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1972;
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
  // value method dmem_master_m_awvalid
  assign dmem_master_awvalid = near_mem$dmem_master_awvalid ;
  // value method dmem_master_m_awid
  assign dmem_master_awid = near_mem$dmem_master_awid ;
  // value method dmem_master_m_awaddr
  assign dmem_master_awaddr = near_mem$dmem_master_awaddr ;
  // value method dmem_master_m_awlen
  assign dmem_master_awlen = near_mem$dmem_master_awlen ;
  // value method dmem_master_m_awsize
  assign dmem_master_awsize = near_mem$dmem_master_awsize ;
  // value method dmem_master_m_awburst
  assign dmem_master_awburst = near_mem$dmem_master_awburst ;
  // value method dmem_master_m_awlock
  assign dmem_master_awlock = near_mem$dmem_master_awlock ;
  // value method dmem_master_m_awcache
  assign dmem_master_awcache = near_mem$dmem_master_awcache ;
  // value method dmem_master_m_awprot
  assign dmem_master_awprot = near_mem$dmem_master_awprot ;
  // value method dmem_master_m_awqos
  assign dmem_master_awqos = near_mem$dmem_master_awqos ;
  // value method dmem_master_m_awregion
  assign dmem_master_awregion = near_mem$dmem_master_awregion ;
  // action method dmem_master_m_awready
  assign CAN_FIRE_dmem_master_m_awready = 1'd1 ;
  assign WILL_FIRE_dmem_master_m_awready = 1'd1 ;
  // value method dmem_master_m_wvalid
  assign dmem_master_wvalid = near_mem$dmem_master_wvalid ;
  // value method dmem_master_m_wdata
  assign dmem_master_wdata = near_mem$dmem_master_wdata ;
  // value method dmem_master_m_wstrb
  assign dmem_master_wstrb = near_mem$dmem_master_wstrb ;
  // value method dmem_master_m_wlast
  assign dmem_master_wlast = near_mem$dmem_master_wlast ;
  // action method dmem_master_m_wready
  assign CAN_FIRE_dmem_master_m_wready = 1'd1 ;
  assign WILL_FIRE_dmem_master_m_wready = 1'd1 ;
  // action method dmem_master_m_bvalid
  assign CAN_FIRE_dmem_master_m_bvalid = 1'd1 ;
  assign WILL_FIRE_dmem_master_m_bvalid = 1'd1 ;
  // value method dmem_master_m_bready
  assign dmem_master_bready = near_mem$dmem_master_bready ;
  // value method dmem_master_m_arvalid
  assign dmem_master_arvalid = near_mem$dmem_master_arvalid ;
  // value method dmem_master_m_arid
  assign dmem_master_arid = near_mem$dmem_master_arid ;
  // value method dmem_master_m_araddr
  assign dmem_master_araddr = near_mem$dmem_master_araddr ;
  // value method dmem_master_m_arlen
  assign dmem_master_arlen = near_mem$dmem_master_arlen ;
  // value method dmem_master_m_arsize
  assign dmem_master_arsize = near_mem$dmem_master_arsize ;
  // value method dmem_master_m_arburst
  assign dmem_master_arburst = near_mem$dmem_master_arburst ;
  // value method dmem_master_m_arlock
  assign dmem_master_arlock = near_mem$dmem_master_arlock ;
  // value method dmem_master_m_arcache
  assign dmem_master_arcache = near_mem$dmem_master_arcache ;
  // value method dmem_master_m_arprot
  assign dmem_master_arprot = near_mem$dmem_master_arprot ;
  // value method dmem_master_m_arqos
  assign dmem_master_arqos = near_mem$dmem_master_arqos ;
  // value method dmem_master_m_arregion
  assign dmem_master_arregion = near_mem$dmem_master_arregion ;
  // action method dmem_master_m_arready
  assign CAN_FIRE_dmem_master_m_arready = 1'd1 ;
  assign WILL_FIRE_dmem_master_m_arready = 1'd1 ;
  // action method dmem_master_m_rvalid
  assign CAN_FIRE_dmem_master_m_rvalid = 1'd1 ;
  assign WILL_FIRE_dmem_master_m_rvalid = 1'd1 ;
  // value method dmem_master_m_rready
  assign dmem_master_rready = near_mem$dmem_master_rready ;
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
		      .dmem_master_arready(near_mem$dmem_master_arready),
		      .dmem_master_awready(near_mem$dmem_master_awready),
		      .dmem_master_bid(near_mem$dmem_master_bid),
		      .dmem_master_bresp(near_mem$dmem_master_bresp),
		      .dmem_master_bvalid(near_mem$dmem_master_bvalid),
		      .dmem_master_rdata(near_mem$dmem_master_rdata),
		      .dmem_master_rid(near_mem$dmem_master_rid),
		      .dmem_master_rlast(near_mem$dmem_master_rlast),
		      .dmem_master_rresp(near_mem$dmem_master_rresp),
		      .dmem_master_rvalid(near_mem$dmem_master_rvalid),
		      .dmem_master_wready(near_mem$dmem_master_wready),
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
		      .server_fence_request_put(near_mem$server_fence_request_put),
		      .EN_server_reset_request_put(near_mem$EN_server_reset_request_put),
		      .EN_server_reset_response_get(near_mem$EN_server_reset_response_get),
		      .EN_imem_req(near_mem$EN_imem_req),
		      .EN_dmem_req(near_mem$EN_dmem_req),
		      .EN_server_fence_i_request_put(near_mem$EN_server_fence_i_request_put),
		      .EN_server_fence_i_response_get(near_mem$EN_server_fence_i_response_get),
		      .EN_server_fence_request_put(near_mem$EN_server_fence_request_put),
		      .EN_server_fence_response_get(near_mem$EN_server_fence_response_get),
		      .EN_sfence_vma(near_mem$EN_sfence_vma),
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
		      .dmem_master_awvalid(near_mem$dmem_master_awvalid),
		      .dmem_master_awid(near_mem$dmem_master_awid),
		      .dmem_master_awaddr(near_mem$dmem_master_awaddr),
		      .dmem_master_awlen(near_mem$dmem_master_awlen),
		      .dmem_master_awsize(near_mem$dmem_master_awsize),
		      .dmem_master_awburst(near_mem$dmem_master_awburst),
		      .dmem_master_awlock(near_mem$dmem_master_awlock),
		      .dmem_master_awcache(near_mem$dmem_master_awcache),
		      .dmem_master_awprot(near_mem$dmem_master_awprot),
		      .dmem_master_awqos(near_mem$dmem_master_awqos),
		      .dmem_master_awregion(near_mem$dmem_master_awregion),
		      .dmem_master_wvalid(near_mem$dmem_master_wvalid),
		      .dmem_master_wdata(near_mem$dmem_master_wdata),
		      .dmem_master_wstrb(near_mem$dmem_master_wstrb),
		      .dmem_master_wlast(near_mem$dmem_master_wlast),
		      .dmem_master_bready(near_mem$dmem_master_bready),
		      .dmem_master_arvalid(near_mem$dmem_master_arvalid),
		      .dmem_master_arid(near_mem$dmem_master_arid),
		      .dmem_master_araddr(near_mem$dmem_master_araddr),
		      .dmem_master_arlen(near_mem$dmem_master_arlen),
		      .dmem_master_arsize(near_mem$dmem_master_arsize),
		      .dmem_master_arburst(near_mem$dmem_master_arburst),
		      .dmem_master_arlock(near_mem$dmem_master_arlock),
		      .dmem_master_arcache(near_mem$dmem_master_arcache),
		      .dmem_master_arprot(near_mem$dmem_master_arprot),
		      .dmem_master_arqos(near_mem$dmem_master_arqos),
		      .dmem_master_arregion(near_mem$dmem_master_arregion),
		      .dmem_master_rready(near_mem$dmem_master_rready),
		      .RDY_server_fence_i_request_put(near_mem$RDY_server_fence_i_request_put),
		      .RDY_server_fence_i_response_get(near_mem$RDY_server_fence_i_response_get),
		      .RDY_server_fence_request_put(near_mem$RDY_server_fence_request_put),
		      .RDY_server_fence_response_get(near_mem$RDY_server_fence_response_get),
		      .RDY_sfence_vma());
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
	     NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 &&
	     rg_state != 4'd0 &&
	     rg_state != 4'd1 &&
	     rg_state != 4'd12 ;
  assign WILL_FIRE_RL_rl_show_pipe = CAN_FIRE_RL_rl_show_pipe ;
  // rule RL_rl_stage2_nonpipe
  assign CAN_FIRE_RL_rl_stage2_nonpipe =
	     rg_state == 4'd3 && !stage3_rg_full &&
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 ==
	     2'd3 ;
  assign WILL_FIRE_RL_rl_stage2_nonpipe = CAN_FIRE_RL_rl_stage2_nonpipe ;
  // rule RL_rl_stage1_trap
  assign CAN_FIRE_RL_rl_stage1_trap =
	     rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2402 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	     4'd12 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905) ;
  assign WILL_FIRE_RL_rl_stage1_trap = CAN_FIRE_RL_rl_stage1_trap ;
  // rule RL_rl_trap
  assign CAN_FIRE_RL_rl_trap =
	     rg_state == 4'd4 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905) ;
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
	     imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2038 &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state_4_EQ_8_486_AND_NOT_stageF_rg_full_882_ETC___d2487 ;
  assign WILL_FIRE_RL_rl_stage1_restart_after_csrrx =
	     CAN_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // rule RL_rl_stage1_xRET
  assign CAN_FIRE_RL_rl_stage1_xRET =
	     rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2402 &&
	     (IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	      4'd8 ||
	      IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	      4'd9 ||
	      IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	      4'd10) &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905) ;
  assign WILL_FIRE_RL_rl_stage1_xRET = CAN_FIRE_RL_rl_stage1_xRET ;
  // rule RL_rl_stage1_FENCE_I
  assign CAN_FIRE_RL_rl_stage1_FENCE_I = MUX_rg_state$write_1__SEL_12 ;
  assign WILL_FIRE_RL_rl_stage1_FENCE_I = MUX_rg_state$write_1__SEL_12 ;
  // rule RL_rl_finish_FENCE_I
  assign CAN_FIRE_RL_rl_finish_FENCE_I =
	     imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2038 &&
	     stageF_branch_predictor$RDY_predict_req &&
	     near_mem$RDY_server_fence_i_response_get &&
	     rg_state == 4'd9 ;
  assign WILL_FIRE_RL_rl_finish_FENCE_I = CAN_FIRE_RL_rl_finish_FENCE_I ;
  // rule RL_rl_stage1_FENCE
  assign CAN_FIRE_RL_rl_stage1_FENCE = MUX_rg_state$write_1__SEL_13 ;
  assign WILL_FIRE_RL_rl_stage1_FENCE = MUX_rg_state$write_1__SEL_13 ;
  // rule RL_rl_finish_FENCE
  assign CAN_FIRE_RL_rl_finish_FENCE =
	     imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2038 &&
	     stageF_branch_predictor$RDY_predict_req &&
	     near_mem$RDY_server_fence_response_get &&
	     rg_state == 4'd10 ;
  assign WILL_FIRE_RL_rl_finish_FENCE = CAN_FIRE_RL_rl_finish_FENCE ;
  // rule RL_rl_finish_SFENCE_VMA
  assign CAN_FIRE_RL_rl_finish_SFENCE_VMA =
	     imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2038 &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state == 4'd11 ;
  assign WILL_FIRE_RL_rl_finish_SFENCE_VMA =
	     CAN_FIRE_RL_rl_finish_SFENCE_VMA ;
  // rule RL_rl_stage1_WFI
  assign CAN_FIRE_RL_rl_stage1_WFI = MUX_rg_state$write_1__SEL_15 ;
  assign WILL_FIRE_RL_rl_stage1_WFI = MUX_rg_state$write_1__SEL_15 ;
  // rule RL_rl_WFI_resume
  assign CAN_FIRE_RL_rl_WFI_resume =
	     imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2038 &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state_4_EQ_12_1_AND_csr_regfile_wfi_resume__ETC___d2537 ;
  assign WILL_FIRE_RL_rl_WFI_resume = CAN_FIRE_RL_rl_WFI_resume ;
  // rule RL_rl_reset_from_WFI
  assign CAN_FIRE_RL_rl_reset_from_WFI =
	     rg_state == 4'd12 && f_reset_reqs$EMPTY_N ;
  assign WILL_FIRE_RL_rl_reset_from_WFI = MUX_rg_state$write_1__SEL_5 ;
  // rule RL_rl_trap_fetch
  assign CAN_FIRE_RL_rl_trap_fetch =
	     imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2038 &&
	     stageF_branch_predictor$RDY_predict_req &&
	     rg_state_4_EQ_5_541_AND_NOT_stageF_rg_full_882_ETC___d2542 ;
  assign WILL_FIRE_RL_rl_trap_fetch = CAN_FIRE_RL_rl_trap_fetch ;
  // rule RL_rl_stage1_interrupt
  assign CAN_FIRE_RL_rl_stage1_interrupt =
	     (csr_regfile$interrupt_pending[4] || csr_regfile$nmi_pending) &&
	     rg_state == 4'd3 &&
	     NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d2550 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905) ;
  assign WILL_FIRE_RL_rl_stage1_interrupt = CAN_FIRE_RL_rl_stage1_interrupt ;
  // rule RL_imem_rl_assert_fail
  assign CAN_FIRE_RL_imem_rl_assert_fail = !near_mem$imem_is_i32_not_i16 ;
  assign WILL_FIRE_RL_imem_rl_assert_fail = CAN_FIRE_RL_imem_rl_assert_fail ;
  // rule RL_rl_reset_complete
  assign CAN_FIRE_RL_rl_reset_complete =
	     gpr_regfile$RDY_server_reset_response_get &&
	     fpr_regfile$RDY_server_reset_response_get &&
	     near_mem$RDY_server_reset_response_get &&
	     csr_regfile_RDY_server_reset_response_get__027_ETC___d2048 &&
	     rg_state == 4'd1 ;
  assign WILL_FIRE_RL_rl_reset_complete = MUX_rg_state$write_1__SEL_2 ;
  // rule RL_rl_pipe
  assign CAN_FIRE_RL_rl_pipe =
	     (IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2096 ||
	      NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2106) &&
	     rg_state_4_EQ_3_108_AND_stage3_rg_full_5_OR_NO_ETC___d2127 ;
  assign WILL_FIRE_RL_rl_pipe =
	     CAN_FIRE_RL_rl_pipe && !WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  // rule RL_rl_stage1_SFENCE_VMA
  assign CAN_FIRE_RL_rl_stage1_SFENCE_VMA =
	     rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2402 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	     4'd7 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905) ;
  assign WILL_FIRE_RL_rl_stage1_SFENCE_VMA = MUX_rg_state$write_1__SEL_14 ;
  // rule RL_rl_reset_start
  assign CAN_FIRE_RL_rl_reset_start =
	     gpr_regfile_RDY_server_reset_request_put__003__ETC___d2021 &&
	     rg_state == 4'd0 ;
  assign WILL_FIRE_RL_rl_reset_start = CAN_FIRE_RL_rl_reset_start ;
  // rule RL_imem_rl_fetch_next_32b
  assign CAN_FIRE_RL_imem_rl_fetch_next_32b =
	     near_mem$imem_valid && imem_rg_pc[1:0] != 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_0_EQ_near_mem_imem_pc__ETC___d13 &&
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
  assign MUX_imem_rg_cache_addr$write_1__SEL_3 =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351 ;
  assign MUX_imem_rg_f3$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ;
  assign MUX_rg_next_pc$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2288 ;
  assign MUX_rg_next_pc$write_1__SEL_2 =
	     WILL_FIRE_RL_rl_stage1_WFI || WILL_FIRE_RL_rl_stage1_FENCE ||
	     WILL_FIRE_RL_rl_stage1_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W ||
	     WILL_FIRE_RL_rl_stage1_SFENCE_VMA ;
  assign MUX_rg_state$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2339 ;
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
	     rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2402 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	     4'd3 ;
  assign MUX_rg_state$write_1__SEL_11 =
	     rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2402 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	     4'd4 ;
  assign MUX_rg_state$write_1__SEL_12 =
	     near_mem$RDY_server_fence_i_request_put &&
	     rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2513 ;
  assign MUX_rg_state$write_1__SEL_13 =
	     near_mem$RDY_server_fence_request_put &&
	     rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2522 ;
  assign MUX_rg_state$write_1__SEL_14 =
	     CAN_FIRE_RL_rl_stage1_SFENCE_VMA &&
	     !WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  assign MUX_rg_state$write_1__SEL_15 =
	     rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2402 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	     4'd11 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905) ;
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
	  y__h29704 or
	  IF_csr_regfile_read_csr_rg_trap_instr_423_BITS_ETC___d2478)
  begin
    case (rg_trap_instr[14:12])
      3'b010, 3'b110:
	  MUX_csr_regfile$mav_csr_write_2__VAL_2 =
	      IF_csr_regfile_read_csr_rg_trap_instr_423_BITS_ETC___d2478;
      default: MUX_csr_regfile$mav_csr_write_2__VAL_2 =
		   csr_regfile$read_csr[63:0] & y__h29704;
    endcase
  end
  assign MUX_imem_rg_tval$write_1__VAL_4 = near_mem$imem_pc + 64'd4 ;
  assign MUX_near_mem$imem_req_2__VAL_1 =
	     NOT_soc_map_m_pc_reset_value__054_BITS_1_TO_0__ETC___d2069 ?
	       addr_of_b32___1__h23411 :
	       addr_of_b32__h23299 ;
  assign MUX_near_mem$imem_req_2__VAL_2 =
	     NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d2360 ?
	       addr_of_b32___1__h27220 :
	       addr_of_b32__h27108 ;
  assign MUX_near_mem$imem_req_2__VAL_4 =
	     NOT_rg_next_pc_489_BITS_1_TO_0_490_EQ_0b0_491__ETC___d2498 ?
	       addr_of_b32___1__h36407 :
	       addr_of_b32__h36295 ;
  assign MUX_rg_state$write_1__VAL_2 = rg_run_on_reset ? 4'd3 : 4'd2 ;
  assign MUX_rg_state$write_1__VAL_3 =
	     csr_regfile$access_permitted_1 ? 4'd8 : 4'd4 ;
  assign MUX_rg_state$write_1__VAL_4 =
	     csr_regfile$access_permitted_2 ? 4'd8 : 4'd4 ;
  assign MUX_rg_trap_info$write_1__VAL_1 =
	     { stage1_rg_stage_input[401:338], 4'd2, value__h12540 } ;
  always@(stage2_rg_stage2 or near_mem$dmem_exc_code)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4:
	  MUX_rg_trap_info$write_1__VAL_2 =
	      { stage2_rg_stage2[493:430],
		near_mem$dmem_exc_code,
		stage2_rg_stage2[389:326] };
      default: MUX_rg_trap_info$write_1__VAL_2 =
		   { stage2_rg_stage2[493:430], 68'h20000000000000000 };
    endcase
  end
  assign MUX_rg_trap_info$write_1__VAL_3 =
	     { stage1_rg_stage_input[401:338],
	       stage1_rg_stage_input[332] ?
		 stage1_rg_stage_input[331:264] :
		 { alu_outputs_exc_code__h9734, trap_info_tval__h12430 } } ;
  assign MUX_rg_trap_info$write_1__VAL_4 =
	     { stage1_rg_stage_input[401:338], x_exc_code__h36657, 64'd0 } ;
  assign MUX_rg_trap_instr$write_1__VAL_1 = stage1_rg_stage_input[263:232] ;
  assign MUX_stage1_rg_full$write_1__VAL_2 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2291 &&
	     stageD_rg_full ||
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2093 ;
  assign MUX_stage2_rg_full$write_1__VAL_2 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2089 ?
	       IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	       4'd0 &&
	       IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d2178 :
	       IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 !=
	       2'd2 &&
	       IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 !=
	       2'd0 ;
  assign MUX_stageD_rg_full$write_1__VAL_2 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2332 ||
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2093 &&
	     stageD_rg_full ;
  assign MUX_stageF_rg_full$write_1__VAL_2 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2332 ?
	       csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2385 :
	       (IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2093 &&
		stageD_rg_full ||
		!near_mem$imem_valid ||
		imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1899) &&
	       stageF_rg_full ;
  // register cfg_logdelay
  assign cfg_logdelay$D_IN = set_verbosity_logdelay ;
  assign cfg_logdelay$EN = EN_set_verbosity ;
  // register cfg_verbosity
  assign cfg_verbosity$D_IN = set_verbosity_verbosity ;
  assign cfg_verbosity$EN = EN_set_verbosity ;
  // register imem_rg_cache_addr
  assign imem_rg_cache_addr$D_IN = near_mem$imem_pc ;
  assign imem_rg_cache_addr$EN =
	     MUX_rg_state$write_1__SEL_7 && near_mem$imem_valid ||
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	     near_mem$imem_valid ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351 ||
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  // register imem_rg_cache_b16
  assign imem_rg_cache_b16$D_IN = near_mem$imem_instr[31:16] ;
  assign imem_rg_cache_b16$EN =
	     MUX_rg_state$write_1__SEL_7 && near_mem$imem_valid ||
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	     near_mem$imem_valid ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351 ||
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ;
  // register imem_rg_f3
  assign imem_rg_f3$D_IN = 3'b010 ;
  assign imem_rg_f3$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351 ||
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // register imem_rg_pc
  always@(MUX_imem_rg_f3$write_1__SEL_1 or
	  soc_map$m_pc_reset_value or
	  MUX_imem_rg_cache_addr$write_1__SEL_3 or
	  stageF_branch_predictor$predict_rsp or
	  MUX_rg_state$write_1__SEL_7 or rg_next_pc)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_f3$write_1__SEL_1:
	  imem_rg_pc$D_IN = soc_map$m_pc_reset_value;
      MUX_imem_rg_cache_addr$write_1__SEL_3:
	  imem_rg_pc$D_IN = stageF_branch_predictor$predict_rsp;
      MUX_rg_state$write_1__SEL_7: imem_rg_pc$D_IN = rg_next_pc;
      default: imem_rg_pc$D_IN =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign imem_rg_pc$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351 ||
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351 ||
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351 ||
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  // register imem_rg_tval
  always@(MUX_imem_rg_f3$write_1__SEL_1 or
	  soc_map$m_pc_reset_value or
	  MUX_imem_rg_cache_addr$write_1__SEL_3 or
	  stageF_branch_predictor$predict_rsp or
	  MUX_rg_state$write_1__SEL_7 or
	  rg_next_pc or
	  WILL_FIRE_RL_imem_rl_fetch_next_32b or
	  MUX_imem_rg_tval$write_1__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_f3$write_1__SEL_1:
	  imem_rg_tval$D_IN = soc_map$m_pc_reset_value;
      MUX_imem_rg_cache_addr$write_1__SEL_3:
	  imem_rg_tval$D_IN = stageF_branch_predictor$predict_rsp;
      MUX_rg_state$write_1__SEL_7: imem_rg_tval$D_IN = rg_next_pc;
      WILL_FIRE_RL_imem_rl_fetch_next_32b:
	  imem_rg_tval$D_IN = MUX_imem_rg_tval$write_1__VAL_4;
      default: imem_rg_tval$D_IN =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign imem_rg_tval$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351 ||
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
  assign rg_csr_val1$D_IN = x_out_data_to_stage2_val1__h8769 ;
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
  always@(MUX_imem_rg_f3$write_1__SEL_1 or
	  new_epoch__h22810 or
	  MUX_rg_state$write_1__SEL_7 or WILL_FIRE_RL_rl_reset_start)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_f3$write_1__SEL_1: rg_epoch$D_IN = new_epoch__h22810;
      MUX_rg_state$write_1__SEL_7: rg_epoch$D_IN = new_epoch__h22810;
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
	  x_out_next_pc__h8703 or
	  MUX_rg_next_pc$write_1__SEL_2 or
	  WILL_FIRE_RL_rl_trap or
	  csr_regfile$csr_trap_actions or
	  WILL_FIRE_RL_rl_stage1_xRET or csr_regfile$csr_ret_actions)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_rg_next_pc$write_1__SEL_1: rg_next_pc$D_IN = x_out_next_pc__h8703;
      MUX_rg_next_pc$write_1__SEL_2: rg_next_pc$D_IN = x_out_next_pc__h8703;
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
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2288 ||
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
  assign rg_start_CPI_cycles$EN = MUX_imem_rg_f3$write_1__SEL_1 ;
  // register rg_start_CPI_instrs
  assign rg_start_CPI_instrs$D_IN = csr_regfile$read_csr_minstret ;
  assign rg_start_CPI_instrs$EN = MUX_imem_rg_f3$write_1__SEL_1 ;
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2339 ||
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
	  MUX_imem_rg_f3$write_1__SEL_1 or
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
    MUX_imem_rg_f3$write_1__SEL_1 || WILL_FIRE_RL_rl_stage1_WFI ||
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
	       _theResult____h5511,
	       stageD_rg_data[79:0],
	       _theResult____h5511[6:0],
	       _theResult____h5511[11:7],
	       _theResult____h5511[19:15],
	       _theResult____h5511[24:20],
	       _theResult____h5511[31:27],
	       _theResult____h5511[31:20],
	       _theResult____h5511[14:12],
	       _theResult____h5511[31:27],
	       _theResult____h5511[31:25],
	       decoded_instr_funct10__h25797,
	       _theResult____h5511[31:20],
	       decoded_instr_imm12_S__h25799,
	       decoded_instr_imm13_SB__h25800,
	       _theResult____h5511[31:12],
	       decoded_instr_imm21_UJ__h25802,
	       _theResult____h5511[27:20],
	       _theResult____h5511[26:25] } ;
  assign stage1_rg_stage_input$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2291 &&
	     stageD_rg_full ;
  // register stage2_rg_full
  always@(WILL_FIRE_RL_stage2_rl_reset_begin or
	  WILL_FIRE_RL_rl_pipe or
	  MUX_stage2_rg_full$write_1__VAL_2 or
	  MUX_imem_rg_f3$write_1__SEL_1 or WILL_FIRE_RL_rl_trap)
  case (1'b1)
    WILL_FIRE_RL_stage2_rl_reset_begin: stage2_rg_full$D_IN = 1'd0;
    WILL_FIRE_RL_rl_pipe:
	stage2_rg_full$D_IN = MUX_stage2_rg_full$write_1__VAL_2;
    MUX_imem_rg_f3$write_1__SEL_1 || WILL_FIRE_RL_rl_trap:
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
	       stage1_rg_stage_input[263:232],
	       IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147,
	       x_out_data_to_stage2_rd__h8767,
	       x_out_data_to_stage2_addr__h8768,
	       x_out_data_to_stage2_val1__h8769,
	       x_out_data_to_stage2_val2__h8770,
	       x_out_data_to_stage2_fval1__h8771,
	       alu_outputs___1_fval2__h9280,
	       x_out_data_to_stage2_fval3__h8773,
	       stage1_rg_stage_input[151:145] == 7'b0000111 ||
	       (stage1_rg_stage_input[151:145] == 7'b1010011 ||
		stage1_rg_stage_input[151:145] == 7'b1000011 ||
		stage1_rg_stage_input[151:145] == 7'b1000111 ||
		stage1_rg_stage_input[151:145] == 7'b1001011 ||
		stage1_rg_stage_input[151:145] == 7'b1001111) &&
	       (stage1_rg_stage_input[104:98] != 7'h61 ||
		stage1_rg_stage_input[134:130] != 5'd0) &&
	       (stage1_rg_stage_input[104:98] != 7'h61 ||
		stage1_rg_stage_input[134:130] != 5'd1) &&
	       (stage1_rg_stage_input[104:98] != 7'h61 ||
		stage1_rg_stage_input[134:130] != 5'd2) &&
	       (stage1_rg_stage_input[104:98] != 7'h61 ||
		stage1_rg_stage_input[134:130] != 5'd3) &&
	       stage1_rg_stage_input[104:98] != 7'h71 &&
	       stage1_rg_stage_input[104:98] != 7'h51 &&
	       (stage1_rg_stage_input[104:98] != 7'h60 ||
		stage1_rg_stage_input[134:130] != 5'd2) &&
	       (stage1_rg_stage_input[104:98] != 7'h60 ||
		stage1_rg_stage_input[134:130] != 5'd3) &&
	       (stage1_rg_stage_input[104:98] != 7'h60 ||
		stage1_rg_stage_input[134:130] != 5'd0) &&
	       (stage1_rg_stage_input[104:98] != 7'h60 ||
		stage1_rg_stage_input[134:130] != 5'd1) &&
	       stage1_rg_stage_input[104:98] != 7'h70 &&
	       stage1_rg_stage_input[104:98] != 7'h50,
	       stage1_rg_stage_input[151:145] == 7'b0100111,
	       stage1_rg_stage_input_11_BITS_151_TO_145_53_EQ_ETC___d2223,
	       x_out_data_to_stage2_rounding_mode__h8777 } ;
  assign stage2_rg_stage2$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2175 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd0 &&
	     IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d2178 ;
  // register stage3_rg_full
  always@(WILL_FIRE_RL_stage3_rl_reset or
	  WILL_FIRE_RL_rl_pipe or
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 or
	  MUX_imem_rg_f3$write_1__SEL_1)
  case (1'b1)
    WILL_FIRE_RL_stage3_rl_reset: stage3_rg_full$D_IN = 1'd0;
    WILL_FIRE_RL_rl_pipe:
	stage3_rg_full$D_IN =
	    IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd2;
    MUX_imem_rg_f3$write_1__SEL_1: stage3_rg_full$D_IN = 1'd0;
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
	       stage2_rg_stage2[397:395] == 3'd0 ||
	       IF_stage2_rg_stage2_12_BITS_397_TO_395_13_EQ_1_ETC___d173,
	       x_out_data_to_stage3_rd__h7705,
	       x_out_data_to_stage3_rd_val__h7706,
	       stage2_rg_stage2[397:395] != 3'd0 &&
	       stage2_rg_stage2[397:395] != 3'd1 &&
	       stage2_rg_stage2[397:395] != 3'd4 &&
	       stage2_rg_stage2[397:395] != 3'd2 &&
	       stage2_rg_stage2[397:395] != 3'd3,
	       stage2_rg_stage2[397:395] != 3'd0 &&
	       CASE_stage2_rg_stage2_BITS_397_TO_395_1_stage2_ETC__q25,
	       x_out_data_to_stage3_fpr_flags__h7709,
	       x_out_data_to_stage3_frd_val__h7710 } ;
  assign stage3_rg_stage3$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 ==
	     2'd2 ;
  // register stageD_rg_data
  assign stageD_rg_data$D_IN =
	     { imem_rg_pc,
	       stageF_rg_epoch,
	       stageF_rg_priv,
	       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1903,
	       near_mem$imem_exc,
	       near_mem$imem_exc_code,
	       imem_rg_tval,
	       d_instr__h21381,
	       stageF_branch_predictor$predict_rsp } ;
  assign stageD_rg_data$EN =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2332 ;
  // register stageD_rg_full
  always@(WILL_FIRE_RL_stageD_rl_reset or
	  WILL_FIRE_RL_rl_pipe or
	  MUX_stageD_rg_full$write_1__VAL_2 or
	  MUX_imem_rg_f3$write_1__SEL_1 or
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
    MUX_imem_rg_f3$write_1__SEL_1 || WILL_FIRE_RL_rl_trap_fetch ||
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
	  MUX_imem_rg_cache_addr$write_1__SEL_3 or
	  stageF_rg_epoch or
	  MUX_imem_rg_f3$write_1__SEL_1 or
	  new_epoch__h22810 or
	  WILL_FIRE_RL_rl_trap_fetch or
	  WILL_FIRE_RL_rl_WFI_resume or
	  WILL_FIRE_RL_rl_finish_SFENCE_VMA or
	  WILL_FIRE_RL_rl_finish_FENCE or
	  WILL_FIRE_RL_rl_finish_FENCE_I or
	  WILL_FIRE_RL_rl_stage1_restart_after_csrrx)
  case (1'b1)
    WILL_FIRE_RL_stageF_rl_reset: stageF_rg_epoch$D_IN = 2'd0;
    MUX_imem_rg_cache_addr$write_1__SEL_3:
	stageF_rg_epoch$D_IN = stageF_rg_epoch;
    MUX_imem_rg_f3$write_1__SEL_1: stageF_rg_epoch$D_IN = new_epoch__h22810;
    WILL_FIRE_RL_rl_trap_fetch: stageF_rg_epoch$D_IN = new_epoch__h22810;
    WILL_FIRE_RL_rl_WFI_resume: stageF_rg_epoch$D_IN = new_epoch__h22810;
    WILL_FIRE_RL_rl_finish_SFENCE_VMA:
	stageF_rg_epoch$D_IN = new_epoch__h22810;
    WILL_FIRE_RL_rl_finish_FENCE: stageF_rg_epoch$D_IN = new_epoch__h22810;
    WILL_FIRE_RL_rl_finish_FENCE_I: stageF_rg_epoch$D_IN = new_epoch__h22810;
    WILL_FIRE_RL_rl_stage1_restart_after_csrrx:
	stageF_rg_epoch$D_IN = new_epoch__h22810;
    default: stageF_rg_epoch$D_IN = 2'b10 /* unspecified value */ ;
  endcase
  assign stageF_rg_epoch$EN =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351 ||
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
	  MUX_imem_rg_f3$write_1__SEL_1 or
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
    MUX_imem_rg_f3$write_1__SEL_1 || WILL_FIRE_RL_rl_trap_fetch ||
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
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351 ||
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
	     rs1_val__h29435 == 64'd0 ;
  assign csr_regfile$csr_counter_read_fault_csr_addr = 12'h0 ;
  assign csr_regfile$csr_counter_read_fault_priv = 2'h0 ;
  always@(IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998)
  begin
    case (IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998)
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
  assign csr_regfile$ma_update_fcsr_fflags_flags = stage3_rg_stage3[68:64] ;
  assign csr_regfile$ma_update_mstatus_fs_fs = 2'h3 ;
  assign csr_regfile$mav_csr_write_csr_addr = rg_trap_instr[31:20] ;
  assign csr_regfile$mav_csr_write_word =
	     MUX_csr_regfile$mav_csr_write_1__SEL_1 ?
	       rs1_val__h28755 :
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
	     WILL_FIRE_RL_rl_pipe &&
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 ==
	     2'd2 ||
	     WILL_FIRE_RL_rl_stage1_CSRR_W_2 &&
	     csr_regfile$access_permitted_1 ||
	     WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	     csr_regfile$access_permitted_2 ||
	     WILL_FIRE_RL_rl_stage1_WFI ||
	     WILL_FIRE_RL_rl_stage1_FENCE ||
	     WILL_FIRE_RL_rl_stage1_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_xRET ||
	     WILL_FIRE_RL_rl_stage1_SFENCE_VMA ;
  assign csr_regfile$EN_debug = 1'b0 ;
  // submodule f_reset_reqs
  assign f_reset_reqs$D_IN = hart0_server_reset_request_put ;
  assign f_reset_reqs$ENQ = EN_hart0_server_reset_request_put ;
  assign f_reset_reqs$DEQ =
	     gpr_regfile_RDY_server_reset_request_put__003__ETC___d2021 &&
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
  assign near_mem$dmem_master_arready = dmem_master_arready ;
  assign near_mem$dmem_master_awready = dmem_master_awready ;
  assign near_mem$dmem_master_bid = dmem_master_bid ;
  assign near_mem$dmem_master_bresp = dmem_master_bresp ;
  assign near_mem$dmem_master_bvalid = dmem_master_bvalid ;
  assign near_mem$dmem_master_rdata = dmem_master_rdata ;
  assign near_mem$dmem_master_rid = dmem_master_rid ;
  assign near_mem$dmem_master_rlast = dmem_master_rlast ;
  assign near_mem$dmem_master_rresp = dmem_master_rresp ;
  assign near_mem$dmem_master_rvalid = dmem_master_rvalid ;
  assign near_mem$dmem_master_wready = dmem_master_wready ;
  assign near_mem$dmem_req_addr = x_out_data_to_stage2_addr__h8768 ;
  assign near_mem$dmem_req_amo_funct7 =
	     x_out_data_to_stage2_val1__h8769[6:0] ;
  assign near_mem$dmem_req_f3 = MUX_rg_trap_instr$write_1__VAL_1[14:12] ;
  assign near_mem$dmem_req_mstatus_MXR = csr_regfile$read_mstatus[19] ;
  always@(IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147)
  begin
    case (IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147)
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
  assign near_mem$dmem_req_sstatus_SUM = csr_regfile$read_sstatus[18] ;
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1310 or
	  alu_outputs___1_fval2__h9280 or branch_target__h8909)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0100111:
	  near_mem$dmem_req_store_value = alu_outputs___1_fval2__h9280;
      7'b1100011: near_mem$dmem_req_store_value = branch_target__h8909;
      default: near_mem$dmem_req_store_value =
		   IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1310;
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
  always@(MUX_imem_rg_f3$write_1__SEL_1 or
	  MUX_near_mem$imem_req_2__VAL_1 or
	  MUX_imem_rg_cache_addr$write_1__SEL_3 or
	  MUX_near_mem$imem_req_2__VAL_2 or
	  WILL_FIRE_RL_imem_rl_fetch_next_32b or
	  MUX_imem_rg_tval$write_1__VAL_4 or
	  MUX_rg_state$write_1__SEL_7 or MUX_near_mem$imem_req_2__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_f3$write_1__SEL_1:
	  near_mem$imem_req_addr = MUX_near_mem$imem_req_2__VAL_1;
      MUX_imem_rg_cache_addr$write_1__SEL_3:
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
	     (MUX_imem_rg_f3$write_1__SEL_1 ||
	      MUX_imem_rg_cache_addr$write_1__SEL_3 ||
	      MUX_rg_state$write_1__SEL_7) ?
	       csr_regfile$read_mstatus[19] :
	       imem_rg_mstatus_MXR ;
  assign near_mem$imem_req_priv =
	     (MUX_imem_rg_f3$write_1__SEL_1 ||
	      MUX_imem_rg_cache_addr$write_1__SEL_3 ||
	      MUX_rg_state$write_1__SEL_7) ?
	       rg_cur_priv :
	       imem_rg_priv ;
  assign near_mem$imem_req_satp =
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ?
	       imem_rg_satp :
	       csr_regfile$read_satp ;
  assign near_mem$imem_req_sstatus_SUM =
	     (MUX_imem_rg_f3$write_1__SEL_1 ||
	      MUX_imem_rg_cache_addr$write_1__SEL_3 ||
	      MUX_rg_state$write_1__SEL_7) ?
	       csr_regfile$read_sstatus[18] :
	       imem_rg_sstatus_SUM ;
  assign near_mem$server_fence_request_put =
	     8'b10101010 /* unspecified value */  ;
  assign near_mem$EN_server_reset_request_put = CAN_FIRE_RL_rl_reset_start ;
  assign near_mem$EN_server_reset_response_get = MUX_rg_state$write_1__SEL_2 ;
  assign near_mem$EN_imem_req =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351 ||
	     WILL_FIRE_RL_imem_rl_fetch_next_32b ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  assign near_mem$EN_dmem_req =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2175 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd0 &&
	     IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d2178 &&
	     (IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 ==
	      3'd1 ||
	      IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 ==
	      3'd2 ||
	      IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 ==
	      3'd4) ;
  assign near_mem$EN_server_fence_i_request_put =
	     MUX_rg_state$write_1__SEL_12 ;
  assign near_mem$EN_server_fence_i_response_get =
	     CAN_FIRE_RL_rl_finish_FENCE_I ;
  assign near_mem$EN_server_fence_request_put = MUX_rg_state$write_1__SEL_13 ;
  assign near_mem$EN_server_fence_response_get = CAN_FIRE_RL_rl_finish_FENCE ;
  assign near_mem$EN_sfence_vma = MUX_rg_state$write_1__SEL_14 ;
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
  assign stage2_fbox$req_rm = x_out_data_to_stage2_rounding_mode__h8777 ;
  assign stage2_fbox$req_rs2 = MUX_rg_trap_instr$write_1__VAL_1[24:20] ;
  assign stage2_fbox$req_v1 =
	     stage1_rg_stage_input_11_BITS_151_TO_145_53_EQ_ETC___d2223 ?
	       x_out_data_to_stage2_val1__h8769 :
	       x_out_data_to_stage2_fval1__h8771 ;
  assign stage2_fbox$req_v2 = alu_outputs___1_fval2__h9280 ;
  assign stage2_fbox$req_v3 = x_out_data_to_stage2_fval3__h8773 ;
  assign stage2_fbox$EN_server_reset_request_put =
	     CAN_FIRE_RL_stage2_rl_reset_begin ;
  assign stage2_fbox$EN_server_reset_response_get =
	     CAN_FIRE_RL_stage2_rl_reset_end ;
  assign stage2_fbox$EN_req =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2175 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd0 &&
	     IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d2178 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 ==
	     3'd5 ;
  // submodule stage2_mbox
  assign stage2_mbox$req_f3 = MUX_rg_trap_instr$write_1__VAL_1[14:12] ;
  assign stage2_mbox$req_is_OP_not_OP_32 =
	     !MUX_rg_trap_instr$write_1__VAL_1[3] ;
  assign stage2_mbox$req_v1 = x_out_data_to_stage2_val1__h8769 ;
  assign stage2_mbox$req_v2 = x_out_data_to_stage2_val2__h8770 ;
  assign stage2_mbox$set_verbosity_verbosity = 4'h0 ;
  assign stage2_mbox$EN_set_verbosity = 1'b0 ;
  assign stage2_mbox$EN_req_reset = 1'b0 ;
  assign stage2_mbox$EN_rsp_reset = 1'b0 ;
  assign stage2_mbox$EN_req =
	     WILL_FIRE_RL_rl_pipe &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2175 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd0 &&
	     IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d2178 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 ==
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
	      (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	       NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d2086) &&
	      IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	      4'd0) ?
	       { IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d1080,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[151:145] != 7'b1100011 ||
		 IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d401,
		 alu_outputs_cf_info_fallthru_PC__h12668,
		 alu_outputs_cf_info_taken_PC__h12669 } :
	       195'h6AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ;
  assign stageF_branch_predictor$bp_train_instr = d_instr__h21381 ;
  assign stageF_branch_predictor$bp_train_is_i32_not_i16 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1903 ;
  assign stageF_branch_predictor$bp_train_pc = imem_rg_pc ;
  always@(MUX_imem_rg_f3$write_1__SEL_1 or
	  soc_map$m_pc_reset_value or
	  MUX_imem_rg_cache_addr$write_1__SEL_3 or
	  stageF_branch_predictor$predict_rsp or
	  MUX_rg_state$write_1__SEL_7 or rg_next_pc)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_imem_rg_f3$write_1__SEL_1:
	  stageF_branch_predictor$predict_req_pc = soc_map$m_pc_reset_value;
      MUX_imem_rg_cache_addr$write_1__SEL_3:
	  stageF_branch_predictor$predict_req_pc =
	      stageF_branch_predictor$predict_rsp;
      MUX_rg_state$write_1__SEL_7:
	  stageF_branch_predictor$predict_req_pc = rg_next_pc;
      default: stageF_branch_predictor$predict_req_pc =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign stageF_branch_predictor$predict_rsp_instr = d_instr__h21381 ;
  assign stageF_branch_predictor$predict_rsp_is_i32_not_i16 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1903 ;
  assign stageF_branch_predictor$EN_reset = 1'b0 ;
  assign stageF_branch_predictor$EN_predict_req =
	     WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset ||
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351 ||
	     WILL_FIRE_RL_rl_trap_fetch ||
	     WILL_FIRE_RL_rl_WFI_resume ||
	     WILL_FIRE_RL_rl_finish_SFENCE_VMA ||
	     WILL_FIRE_RL_rl_finish_FENCE ||
	     WILL_FIRE_RL_rl_finish_FENCE_I ||
	     WILL_FIRE_RL_rl_stage1_restart_after_csrrx ;
  assign stageF_branch_predictor$EN_bp_train =
	     WILL_FIRE_RL_rl_pipe &&
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2332 ;
  // submodule stageF_f_reset_reqs
  assign stageF_f_reset_reqs$ENQ = CAN_FIRE_RL_rl_reset_start ;
  assign stageF_f_reset_reqs$DEQ = CAN_FIRE_RL_stageF_rl_reset ;
  assign stageF_f_reset_reqs$CLR = 1'b0 ;
  // submodule stageF_f_reset_rsps
  assign stageF_f_reset_rsps$ENQ = CAN_FIRE_RL_stageF_rl_reset ;
  assign stageF_f_reset_rsps$DEQ = MUX_rg_state$write_1__SEL_2 ;
  assign stageF_f_reset_rsps$CLR = 1'b0 ;
  // remaining internal signals
  assign IF_IF_stage1_rg_stage_input_11_BITS_151_TO_145_ETC___d1445 =
	     next_pc__h8686 == stage1_rg_stage_input[215:152] ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2093 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2089 ?
	       IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	       4'd0 &&
	       !IF_IF_stage1_rg_stage_input_11_BITS_151_TO_145_ETC___d1445 &&
	       stageF_rg_full &&
	       (!near_mem$imem_valid ||
		imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1899) :
	       stage1_rg_full ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2096 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2093 &&
	     stageD_rg_full ||
	     !stageF_rg_full ||
	     !near_mem$imem_valid ||
	     imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1899 ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2291 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2089 ?
	       IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	       4'd0 ||
	       IF_IF_stage1_rg_stage_input_11_BITS_151_TO_145_ETC___d1445 ||
	       !stageF_rg_full ||
	       near_mem$imem_valid &&
	       NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 :
	       !stage1_rg_full ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2332 =
	     (IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2291 ||
	      !stageD_rg_full) &&
	     stageF_rg_full &&
	     near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2339 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2332 &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2100 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd0 &&
	     !IF_IF_stage1_rg_stage_input_11_BITS_151_TO_145_ETC___d1445 ;
  assign IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2351 =
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2332 &&
	     (csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2346 ||
	      IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	      4'd0 ||
	      IF_IF_stage1_rg_stage_input_11_BITS_151_TO_145_ETC___d1445) ;
  assign IF_NOT_csr_regfile_read_mstatus__6_BITS_14_TO__ETC___d980 =
	     NOT_csr_regfile_read_mstatus__6_BITS_14_TO_13__ETC___d897 ?
	       4'd1 :
	       4'd12 ;
  assign IF_NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem__ETC___d1877 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1874 ?
	       { 16'b0,
		 imem_rg_pc_BITS_63_TO_2_0_EQ_near_mem_imem_pc__ETC___d13 ?
		   near_mem$imem_instr[31:16] :
		   imem_rg_cache_b16 } :
	       near_mem$imem_instr ;
  assign IF_NOT_near_mem_dmem_valid__35_57_OR_NOT_near__ETC___d270 =
	     (!near_mem$dmem_valid || !near_mem$dmem_exc) ?
	       ((stage2_rg_stage2[394:390] == 5'd0) ? 2'd0 : 2'd1) :
	       2'd0 ;
  assign IF_NOT_near_mem_dmem_valid__35_57_OR_NOT_near__ETC___d290 =
	     (!near_mem$dmem_valid || !near_mem$dmem_exc) ?
	       (stage2_rg_stage2[5] ? 2'd1 : 2'd0) :
	       2'd0 ;
  assign IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d2178 =
	     IF_IF_stage1_rg_stage_input_11_BITS_151_TO_145_ETC___d1445 ||
	     !stageF_rg_full ||
	     near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 ;
  assign IF_NOT_stage1_rg_stage_input_11_BITS_112_TO_11_ETC___d924 =
	     NOT_stage1_rg_stage_input_11_BITS_112_TO_110_5_ETC___d437 ?
	       4'd12 :
	       4'd1 ;
  assign IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d295 =
	     (!stage2_rg_full || stage2_rg_stage2[397:395] == 3'd0) ?
	       2'd0 :
	       CASE_stage2_rg_stage2_BITS_397_TO_395_1_IF_NOT_ETC__q5 ;
  assign IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d320 =
	     x_out_fbypass_rd__h8378 == stage1_rg_stage_input[139:135] ;
  assign IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d321 =
	     x_out_fbypass_rd__h8378 == stage1_rg_stage_input[134:130] ;
  assign IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d324 =
	     x_out_fbypass_rd__h8378 == stage1_rg_stage_input[129:125] ;
  assign IF_csr_regfile_read_csr_rg_trap_instr_423_BITS_ETC___d2478 =
	     csr_regfile$read_csr[63:0] | rs1_val__h29435 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1718 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b001) ?
	       instr__h20874 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
		 stageD_rg_data[79:77] == 3'b101) ?
		  instr__h21025 :
		  32'h0) ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1719 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b101) ?
	       instr__h20675 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1718 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1720 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b001 &&
	      csr_regfile$read_misa[3]) ?
	       instr__h20502 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1719 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1721 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b011 &&
	      csr_regfile$read_misa[5]) ?
	       instr__h19694 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1720 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1722 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b111) ?
	       instr__h19489 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1721 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1723 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b011) ?
	       instr__h19338 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1722 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1724 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b111) ?
	       instr__h19139 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1723 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1726 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:76] == 4'b1001 &&
	      stageD_rg_data[75:71] == 5'd0 &&
	      stageD_rg_data[70:66] == 5'd0) ?
	       instr__h18890 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
		 stageD_rg_data[75:71] != 5'd0 &&
		 stageD_rg_data[79:77] == 3'b011) ?
		  instr__h18986 :
		  IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1724) ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1728 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:74] == 6'b100111 &&
	      stageD_rg_data[70:69] == 2'b01) ?
	       instr__h18594 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:74] == 6'b100111 &&
		 stageD_rg_data[70:69] == 2'b0) ?
		  instr__h18732 :
		  IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1726) ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1730 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:74] == 6'b100011 &&
	      stageD_rg_data[70:69] == 2'b01) ?
	       instr__h18320 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:74] == 6'b100011 &&
		 stageD_rg_data[70:69] == 2'b0) ?
		  instr__h18456 :
		  IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1728) ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1732 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:74] == 6'b100011 &&
	      stageD_rg_data[70:69] == 2'b11) ?
	       instr__h18048 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:74] == 6'b100011 &&
		 stageD_rg_data[70:69] == 2'b10) ?
		  instr__h18184 :
		  IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1730) ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1733 =
	     (csr_regfile_read_misa__3_BIT_2_460_AND_stageD__ETC___d1541 &&
	      stageD_rg_data[70:66] != 5'd0) ?
	       instr__h17953 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1732 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1734 =
	     (csr_regfile_read_misa__3_BIT_2_460_AND_stageD__ETC___d1535 &&
	      stageD_rg_data[70:66] != 5'd0) ?
	       instr__h17834 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1733 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1736 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b100 &&
	      stageD_rg_data[75:74] == 2'b01 &&
	      imm6__h15947 != 6'd0) ?
	       instr__h17539 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:77] == 3'b100 &&
		 stageD_rg_data[75:74] == 2'b10) ?
		  instr__h17656 :
		  IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1734) ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1737 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b100 &&
	      stageD_rg_data[75:74] == 2'b0 &&
	      imm6__h15947 != 6'd0) ?
	       instr__h17350 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1736 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1738 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b0 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      imm6__h15947 != 6'd0) ?
	       instr__h17161 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1737 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1740 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b011 &&
	      stageD_rg_data[75:71] == 5'd2 &&
	      nzimm10__h16616 != 10'd0) ?
	       instr__h16820 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
		 stageD_rg_data[79:77] == 3'b0 &&
		 nzimm10__h16831 != 10'd0) ?
		  instr__h16992 :
		  IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1738) ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1742 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b0 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      imm6__h15947 != 6'd0 ||
	      csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b0 &&
	      stageD_rg_data[75:71] == 5'd0 &&
	      imm6__h15947 == 6'd0) ?
	       instr__h16338 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:77] == 3'b001 &&
		 stageD_rg_data[75:71] != 5'd0) ?
		  instr__h16565 :
		  IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1740) ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1743 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b011 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      stageD_rg_data[75:71] != 5'd2 &&
	      imm6__h15947 != 6'd0) ?
	       instr__h16209 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1742 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1745 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b111) ?
	       instr__h15687 :
	       ((csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
		 stageD_rg_data[79:77] == 3'b010 &&
		 stageD_rg_data[75:71] != 5'd0) ?
		  instr__h16025 :
		  IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1743) ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1746 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b110) ?
	       instr__h15370 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1745 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1747 =
	     (csr_regfile_read_misa__3_BIT_2_460_AND_stageD__ETC___d1541 &&
	      stageD_rg_data[70:66] == 5'd0) ?
	       instr__h15305 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1746 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1748 =
	     (csr_regfile_read_misa__3_BIT_2_460_AND_stageD__ETC___d1535 &&
	      stageD_rg_data[70:66] == 5'd0) ?
	       instr__h15189 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1747 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1749 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b01 &&
	      stageD_rg_data[79:77] == 3'b101) ?
	       instr__h14736 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1748 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1750 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b110) ?
	       instr__h14507 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1749 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1751 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b0 &&
	      stageD_rg_data[79:77] == 3'b010) ?
	       instr__h14312 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1750 ;
  assign IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1752 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[79:77] == 3'b110) ?
	       instr__h14120 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1751 ;
  assign IF_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg_p_ETC___d1878 =
	     (imem_rg_pc[1:0] == 2'b0 &&
	      imem_rg_pc_BITS_63_TO_2_0_EQ_near_mem_imem_pc__ETC___d13 &&
	      near_mem$imem_instr[1:0] != 2'b11) ?
	       instr_out___1__h21405 :
	       IF_NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem__ETC___d1877 ;
  assign IF_near_mem_dmem_valid__35_THEN_IF_near_mem_dm_ETC___d138 =
	     near_mem$dmem_valid ? (near_mem$dmem_exc ? 2'd3 : 2'd2) : 2'd1 ;
  assign IF_rg_cur_priv_5_EQ_0b11_39_OR_rg_cur_priv_5_E_ETC___d968 =
	     ((rg_cur_priv == 2'b11 ||
	       rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[22]) &&
	      stage1_rg_stage_input[87:76] == 12'b000100000010) ?
	       4'd9 :
	       (rg_cur_priv_5_EQ_0b11_39_OR_rg_cur_priv_5_EQ_0_ETC___d966 ?
		  4'd11 :
		  4'd12) ;
  assign IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d930 =
	     ((stage1_rg_stage_input[112:110] == 3'b0 ||
	       stage1_rg_stage_input[112:110] == 3'b100 ||
	       stage1_rg_stage_input[112:110] == 3'b001 ||
	       stage1_rg_stage_input[112:110] == 3'b101 ||
	       stage1_rg_stage_input[112:110] == 3'b010 ||
	       stage1_rg_stage_input[112:110] == 3'b110 ||
	       stage1_rg_stage_input[112:110] == 3'b011) &&
	      (stage1_rg_stage_input[151:145] != 7'b0000111 ||
	       csr_regfile$read_mstatus[14:13] != 2'h0)) ?
	       4'd1 :
	       4'd12 ;
  assign IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d934 =
	     ((stage1_rg_stage_input[112:110] == 3'b0 ||
	       stage1_rg_stage_input[112:110] == 3'b001 ||
	       stage1_rg_stage_input[112:110] == 3'b010 ||
	       stage1_rg_stage_input[112:110] == 3'b011) &&
	      (stage1_rg_stage_input[151:145] != 7'b0100111 ||
	       csr_regfile$read_mstatus[14:13] != 2'h0)) ?
	       4'd1 :
	       4'd12 ;
  assign IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d1109 =
	     rs1_val_bypassed__h5224 +
	     SEXT_stage1_rg_stage_input_11_BITS_87_TO_76_47___d1108 ;
  assign IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d390 =
	     rs1_val_bypassed__h5224 == rs2_val_bypassed__h5230 ;
  assign IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d392 =
	     (rs1_val_bypassed__h5224 ^ 64'h8000000000000000) <
	     (rs2_val_bypassed__h5230 ^ 64'h8000000000000000) ;
  assign IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d394 =
	     rs1_val_bypassed__h5224 < rs2_val_bypassed__h5230 ;
  assign IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC__q20 =
	     IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d1109[31:0] ;
  assign IF_stage1_rg_stage_input_11_BITS_144_TO_140_37_ETC___d972 =
	     stage1_rg_stage_input_11_BITS_144_TO_140_37_EQ_ETC___d945 ?
	       4'd7 :
	       ((stage1_rg_stage_input[144:140] == 5'd0 &&
		 stage1_rg_stage_input[139:135] == 5'd0) ?
		  IF_stage1_rg_stage_input_11_BITS_87_TO_76_47_E_ETC___d970 :
		  4'd12) ;
  assign IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1300 =
	     ((stage1_rg_stage_input[151:145] == 7'b0010011 ||
	       stage1_rg_stage_input[151:145] == 7'b0110011) &&
	      (stage1_rg_stage_input[112:110] == 3'b001 ||
	       stage1_rg_stage_input[112:110] == 3'b101)) ?
	       alu_outputs___1_val1__h9077 :
	       IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1299 ;
  assign IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1301 =
	     ((stage1_rg_stage_input[151:145] == 7'b0110011 ||
	       stage1_rg_stage_input[151:145] == 7'b0111011) &&
	      stage1_rg_stage_input[104:98] == 7'b0000001) ?
	       rs1_val_bypassed__h5224 :
	       IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1300 ;
  assign IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1310 =
	     ((stage1_rg_stage_input[151:145] == 7'b0110011 ||
	       stage1_rg_stage_input[151:145] == 7'b0111011) &&
	      stage1_rg_stage_input[104:98] == 7'b0000001) ?
	       rs2_val_bypassed__h5230 :
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q23 ;
  assign IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d719 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       stage1_rg_stage_input[112:110] != 3'b0 &&
	       stage1_rg_stage_input[112:110] != 3'b001 &&
	       stage1_rg_stage_input[112:110] != 3'b100 &&
	       stage1_rg_stage_input[112:110] != 3'b101 &&
	       stage1_rg_stage_input[112:110] != 3'b110 &&
	       stage1_rg_stage_input[112:110] != 3'b111 ||
	       IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d401 :
	       stage1_rg_stage_input[151:145] == 7'b1101111 ||
	       stage1_rg_stage_input[151:145] == 7'b1100111 ||
	       (stage1_rg_stage_input[151:145] != 7'b0110011 ||
		stage1_rg_stage_input[104:98] != 7'b0000001) &&
	       (stage1_rg_stage_input[151:145] != 7'b0111011 ||
		stage1_rg_stage_input[104:98] != 7'b0000001) &&
	       (stage1_rg_stage_input[151:145] != 7'b0010011 &&
		stage1_rg_stage_input[151:145] != 7'b0110011 ||
		stage1_rg_stage_input[112:110] != 3'b001 &&
		stage1_rg_stage_input[112:110] != 3'b101) &&
	       IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d716 ;
  assign IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d730 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       stage1_rg_stage_input[112:110] != 3'b0 &&
	       stage1_rg_stage_input[112:110] != 3'b001 &&
	       stage1_rg_stage_input[112:110] != 3'b100 &&
	       stage1_rg_stage_input[112:110] != 3'b101 &&
	       stage1_rg_stage_input[112:110] != 3'b110 &&
	       stage1_rg_stage_input[112:110] != 3'b111 ||
	       IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d725 :
	       stage1_rg_stage_input[151:145] != 7'b1101111 &&
	       stage1_rg_stage_input[151:145] != 7'b1100111 ;
  assign IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d912 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       (stage1_rg_stage_input[112:110] == 3'b0 ||
		stage1_rg_stage_input[112:110] == 3'b001 ||
		stage1_rg_stage_input[112:110] == 3'b100 ||
		stage1_rg_stage_input[112:110] == 3'b101 ||
		stage1_rg_stage_input[112:110] == 3'b110 ||
		stage1_rg_stage_input[112:110] == 3'b111) &&
	       IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d725 :
	       stage1_rg_stage_input[151:145] != 7'b1101111 &&
	       stage1_rg_stage_input[151:145] != 7'b1100111 &&
	       (stage1_rg_stage_input_11_BITS_151_TO_145_53_EQ_ETC___d750 ||
		IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d909) ;
  assign IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d914 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       (stage1_rg_stage_input[112:110] == 3'b0 ||
		stage1_rg_stage_input[112:110] == 3'b001 ||
		stage1_rg_stage_input[112:110] == 3'b100 ||
		stage1_rg_stage_input[112:110] == 3'b101 ||
		stage1_rg_stage_input[112:110] == 3'b110 ||
		stage1_rg_stage_input[112:110] == 3'b111) &&
	       IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d401 :
	       stage1_rg_stage_input[151:145] == 7'b1101111 ||
	       stage1_rg_stage_input[151:145] == 7'b1100111 ;
  assign IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 =
	     stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ?
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q22 :
	       3'd0 ;
  assign IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 =
	     stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ?
	       (stage1_rg_stage_input[332] ?
		  4'd12 :
		  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d995) :
	       4'd0 ;
  assign IF_stage2_fbox_valid__41_THEN_2_ELSE_1___d142 =
	     stage2_fbox$valid ? 2'd2 : 2'd1 ;
  assign IF_stage2_mbox_valid__39_THEN_2_ELSE_1___d140 =
	     stage2_mbox$valid ? 2'd2 : 2'd1 ;
  assign IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 =
	     stage2_rg_full ?
	       CASE_stage2_rg_stage2_BITS_397_TO_395_0_2_1_IF_ETC__q3 :
	       2'd0 ;
  assign IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d2078 =
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327 ||
	     stage1_rg_stage_input[332] ||
	     IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d719 &&
	     IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d730 ;
  assign IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d2162 =
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 ==
	     2'd2 &&
	     NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 &&
	     stage2_rg_stage2[397:395] != 3'd0 &&
	     CASE_stage2_rg_stage2_BITS_397_TO_395_1_stage2_ETC__q25 ;
  assign IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d2164 =
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 ==
	     2'd2 &&
	     NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 &&
	     (stage2_rg_stage2[397:395] == 3'd0 ||
	      CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_st_ETC__q26) ;
  assign IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d277 =
	     stage2_rg_full ?
	       CASE_stage2_rg_stage2_BITS_397_TO_395_0_2_1_IF_ETC__q4 :
	       2'd0 ;
  assign IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d315 =
	     x_out_bypass_rd__h8250 == stage1_rg_stage_input[139:135] ;
  assign IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d317 =
	     x_out_bypass_rd__h8250 == stage1_rg_stage_input[134:130] ;
  assign IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327 =
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d277 ==
	     2'd1 &&
	     (IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d315 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d317) ||
	     IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d295 ==
	     2'd1 &&
	     (IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d320 ||
	      IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d321 ||
	      IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d324) ;
  assign IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917 =
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327 ||
	     !stage1_rg_stage_input[332] &&
	     (IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d912 ||
	      IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d914) ;
  assign NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 =
	     cur_verbosity__h3508 > 4'd1 ;
  assign NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d2086 =
	     NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351 &&
	     !stage1_rg_stage_input[332] &&
	     (IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d912 ||
	      IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d914) ;
  assign NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351 =
	     (IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d277 !=
	      2'd1 ||
	      !IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d315 &&
	      !IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d317) &&
	     (IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d295 !=
	      2'd1 ||
	      !IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d320 &&
	      !IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d321 &&
	      !IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d324) ;
  assign NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 =
	     NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351 &&
	     (stage1_rg_stage_input[332] ||
	      IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d719 &&
	      IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d730) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2085 =
	     (!csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	      stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d2081) &&
	     (IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 ==
	      2'd2 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 ==
	      2'd0) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2089 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2085 &&
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d2086) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2098 =
	     !csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	     stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d2078 &&
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2100 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2098 &&
	     (IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 ==
	      2'd2 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 ==
	      2'd0) &&
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d2086) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2106 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2100 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd0 &&
	     !IF_IF_stage1_rg_stage_input_11_BITS_151_TO_145_ETC___d1445 ||
	     (imem_rg_pc[1:0] == 2'b0 ||
	      !imem_rg_pc_BITS_63_TO_2_0_EQ_near_mem_imem_pc__ETC___d13 ||
	      near_mem$imem_instr[17:16] != 2'b11) &&
	     stageF_branch_predictor$RDY_predict_req ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2168 =
	     (!csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	      !stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	     (IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 ==
	      2'd2 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 ==
	      2'd0) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2175 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2098 &&
	     (IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 ==
	      2'd2 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 ==
	      2'd0) &&
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d2086) ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2261 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2175 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd0 &&
	     IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d2178 &&
	     NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2288 =
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2175 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd0 &&
	     IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d2178 &&
	     !IF_IF_stage1_rg_stage_input_11_BITS_151_TO_145_ETC___d1445 ;
  assign NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398 =
	     !csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	     !stage1_rg_stage_input[332] &&
	     (IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d912 ||
	      IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d914) ;
  assign NOT_csr_regfile_read_mstatus__6_BITS_14_TO_13__ETC___d897 =
	     csr_regfile$read_mstatus[14:13] != 2'h0 &&
	     CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q15 &&
	     ((stage1_rg_stage_input[112:110] == 3'b111) ?
		csr_regfile$read_frm != 3'b101 &&
		csr_regfile$read_frm != 3'b110 &&
		csr_regfile$read_frm != 3'b111 :
		stage1_rg_stage_input[112:110] != 3'b101 &&
		stage1_rg_stage_input[112:110] != 3'b110) ;
  assign NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1860 =
	     imem_rg_pc[1:0] != 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_0_EQ_imem_rg_cache_add_ETC___d1852 &&
	     near_mem_imem_pc__1_EQ_imem_rg_pc_PLUS_2_854___d1855 &&
	     imem_rg_cache_b16[1:0] == 2'b11 ;
  assign NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1874 =
	     imem_rg_pc[1:0] != 2'b0 &&
	     (imem_rg_pc_BITS_63_TO_2_0_EQ_near_mem_imem_pc__ETC___d13 &&
	      near_mem$imem_instr[17:16] != 2'b11 ||
	      imem_rg_pc_BITS_63_TO_2_0_EQ_imem_rg_cache_add_ETC___d1852 &&
	      imem_rg_cache_b16[1:0] != 2'b11) ;
  assign NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1903 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1860 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_0_EQ_near_mem_imem_pc__ETC___d13 &&
	     near_mem$imem_instr[1:0] == 2'b11 ;
  assign NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1903 ||
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1874 ||
	     imem_rg_pc[1:0] == 2'b0 &&
	     imem_rg_pc_BITS_63_TO_2_0_EQ_near_mem_imem_pc__ETC___d13 &&
	     near_mem$imem_instr[1:0] != 2'b11 ;
  assign NOT_rg_cur_priv_5_EQ_0b11_39_427_AND_NOT_rg_cu_ETC___d1433 =
	     (rg_cur_priv != 2'b11 &&
	      (rg_cur_priv != 2'b01 || csr_regfile$read_mstatus[20]) ||
	      stage1_rg_stage_input[104:98] != 7'b0001001) &&
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     stage1_rg_stage_input[139:135] == 5'd0 &&
	     stage1_rg_stage_input[87:76] == 12'b000000000001 ;
  assign NOT_rg_next_pc_489_BITS_1_TO_0_490_EQ_0b0_491__ETC___d2498 =
	     rg_next_pc[1:0] != 2'b0 && near_mem$imem_valid &&
	     addr_of_b32__h36295 == near_mem$imem_pc &&
	     near_mem$imem_instr[17:16] == 2'b11 ;
  assign NOT_soc_map_m_pc_reset_value__054_BITS_1_TO_0__ETC___d2069 =
	     soc_map$m_pc_reset_value[1:0] != 2'b0 && near_mem$imem_valid &&
	     addr_of_b32__h23299 == near_mem$imem_pc &&
	     near_mem$imem_instr[17:16] == 2'b11 ;
  assign NOT_stage1_rg_full_10_21_OR_stage1_rg_stage_in_ETC___d2121 =
	     (!stage1_rg_full ||
	      stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d2078 ||
	      IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	      4'd0) &&
	     (!stage1_rg_full ||
	      !stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) ;
  assign NOT_stage1_rg_full_10_21_OR_stage1_rg_stage_in_ETC___d2123 =
	     (!stage1_rg_full ||
	      stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d2078) &&
	     (!stage1_rg_full ||
	      !stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) ;
  assign NOT_stage1_rg_stage_input_11_BITS_112_TO_110_5_ETC___d437 =
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
  assign NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1071 =
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd0 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd1 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd2 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd3 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd4 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd5 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd6 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd7 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd8 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd9 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd10 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd11 ;
  assign NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1083 =
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	     IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d1080 ==
	     2'd3 ;
  assign NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1087 =
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	     IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d1080 ==
	     2'd0 ;
  assign NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1093 =
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	     IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d1080 !=
	     2'd3 &&
	     IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d1080 !=
	     2'd0 ;
  assign NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d2546 =
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d2086) &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd0 ||
	     stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	     NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 ;
  assign NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d2550 =
	     NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d2546 &&
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d2086 ||
	      NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733) &&
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 ==
	     2'd0 &&
	     !stage3_rg_full ;
  assign NOT_stageF_branch_predictor_predict_rsp_NOT_im_ETC___d2360 =
	     stageF_branch_predictor$predict_rsp[1:0] != 2'b0 &&
	     near_mem$imem_valid &&
	     addr_of_b32__h27108 == near_mem$imem_pc &&
	     near_mem$imem_instr[17:16] == 2'b11 ;
  assign SEXT_stage1_rg_stage_input_11_BITS_87_TO_76_47___d1108 =
	     { {52{stage1_rg_stage_input_BITS_87_TO_76__q19[11]}},
	       stage1_rg_stage_input_BITS_87_TO_76__q19 } ;
  assign SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1525 =
	     { {9{offset__h14683[11]}}, offset__h14683 } ;
  assign SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1550 =
	     { {4{offset__h15314[8]}}, offset__h15314 } ;
  assign _theResult_____1_fst__h10375 =
	     (stage1_rg_stage_input[112:110] == 3'b0 &&
	      stage1_rg_stage_input[151:145] == 7'b0110011 &&
	      stage1_rg_stage_input[262]) ?
	       rd_val___1__h10371 :
	       _theResult_____1_fst__h10382 ;
  assign _theResult_____1_fst__h10410 =
	     rs1_val_bypassed__h5224 & _theResult___snd__h13025 ;
  assign _theResult____h28277 =
	     (delta_CPI_instrs__h28276 == 64'd0) ?
	       delta_CPI_instrs___1__h28312 :
	       delta_CPI_instrs__h28276 ;
  assign _theResult____h5511 = x_out_data_to_stage1_instr__h13762 ;
  assign _theResult___fst__h10501 =
	     (stage1_rg_stage_input[112:110] == 3'b001 &&
	      !stage1_rg_stage_input[257]) ?
	       rd_val___1__h13085 :
	       _theResult___fst__h10508 ;
  assign _theResult___fst__h10508 =
	     stage1_rg_stage_input[262] ?
	       rd_val___1__h13167 :
	       rd_val___1__h13138 ;
  assign _theResult___fst__h10589 =
	     { {32{rs1_val_bypassed224_BITS_31_TO_0_SRL_rs2_val_b_ETC__q10[31]}},
	       rs1_val_bypassed224_BITS_31_TO_0_SRL_rs2_val_b_ETC__q10 } ;
  assign _theResult___snd__h13025 =
	     (stage1_rg_stage_input[151:145] == 7'b0010011) ?
	       SEXT_stage1_rg_stage_input_11_BITS_87_TO_76_47___d1108 :
	       rs2_val_bypassed__h5230 ;
  assign _theResult___snd_fst_rd_val__h8370 =
	     stage2_rg_stage2[5] ?
	       stage2_fbox$word_fst :
	       stage2_rg_stage2[197:134] ;
  assign _theResult___snd_snd_rd_val__h7681 =
	     stage2_rg_stage2[5] ?
	       stage2_rg_stage2[325:262] :
	       stage2_fbox$word_fst ;
  assign addr_of_b32___1__h23411 = addr_of_b32__h23299 + 64'd4 ;
  assign addr_of_b32___1__h27220 = addr_of_b32__h27108 + 64'd4 ;
  assign addr_of_b32___1__h36407 = addr_of_b32__h36295 + 64'd4 ;
  assign addr_of_b32__h23299 = { soc_map$m_pc_reset_value[63:2], 2'd0 } ;
  assign addr_of_b32__h27108 =
	     { stageF_branch_predictor$predict_rsp[63:2], 2'd0 } ;
  assign addr_of_b32__h36295 = { rg_next_pc[63:2], 2'd0 } ;
  assign alu_outputs___1_addr__h8931 =
	     IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d401 ?
	       branch_target__h8909 :
	       x_out_cf_info_fallthru_PC__h12676 ;
  assign alu_outputs___1_addr__h9276 =
	     rs1_val_bypassed__h5224 +
	     { {52{stage1_rg_stage_input_BITS_75_TO_64__q6[11]}},
	       stage1_rg_stage_input_BITS_75_TO_64__q6 } ;
  assign alu_outputs___1_exc_code__h9555 =
	     (stage1_rg_stage_input[112:110] == 3'b0) ?
	       (stage1_rg_stage_input_11_BITS_144_TO_140_37_EQ_ETC___d945 ?
		  4'd2 :
		  ((stage1_rg_stage_input[144:140] == 5'd0 &&
		    stage1_rg_stage_input[139:135] == 5'd0) ?
		     CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q8 :
		     4'd2)) :
	       4'd2 ;
  assign alu_outputs___1_fval2__h9280 =
	     (IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d295 ==
	      2'd2 &&
	      IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d321) ?
	       x_out_fbypass_rd_val__h8379 :
	       rd_val__h8636 ;
  assign alu_outputs___1_val1__h9077 =
	     (stage1_rg_stage_input[112:110] == 3'b001) ?
	       rd_val__h12922 :
	       (stage1_rg_stage_input[262] ?
		  rd_val__h12995 :
		  rd_val__h12973) ;
  assign alu_outputs___1_val1__h9120 =
	     (stage1_rg_stage_input[112:110] == 3'b0 &&
	      (stage1_rg_stage_input[151:145] != 7'b0110011 ||
	       !stage1_rg_stage_input[262])) ?
	       rd_val___1__h10363 :
	       _theResult_____1_fst__h10375 ;
  assign alu_outputs___1_val1__h9148 =
	     (stage1_rg_stage_input[112:110] == 3'b0) ?
	       rd_val___1__h13054 :
	       _theResult___fst__h10501 ;
  assign alu_outputs___1_val1__h9559 =
	     stage1_rg_stage_input[112] ?
	       { 59'd0, stage1_rg_stage_input[139:135] } :
	       rs1_val_bypassed__h5224 ;
  assign alu_outputs___1_val1__h9586 =
	     { 57'd0, stage1_rg_stage_input[104:98] } ;
  assign alu_outputs_cf_info_fallthru_PC__h12668 =
	     x_out_cf_info_fallthru_PC__h12676 ;
  assign alu_outputs_cf_info_taken_PC__h12669 =
	     x_out_cf_info_taken_PC__h12677 ;
  assign branch_target__h8909 =
	     stage1_rg_stage_input[401:338] +
	     { {51{stage1_rg_stage_input_BITS_63_TO_51__q1[12]}},
	       stage1_rg_stage_input_BITS_63_TO_51__q1 } ;
  assign cpi__h28279 = x__h28278 / 64'd10 ;
  assign cpifrac__h28280 = x__h28278 % 64'd10 ;
  assign csr_regfile_RDY_server_reset_request_put__006__ETC___d2018 =
	     csr_regfile$RDY_server_reset_request_put &&
	     f_reset_reqs$EMPTY_N &&
	     stageF_f_reset_reqs$FULL_N &&
	     stageD_f_reset_reqs$FULL_N &&
	     stage1_f_reset_reqs$FULL_N &&
	     stage2_f_reset_reqs$FULL_N &&
	     stage3_f_reset_reqs$FULL_N ;
  assign csr_regfile_RDY_server_reset_response_get__027_ETC___d2048 =
	     csr_regfile$RDY_server_reset_response_get &&
	     stageF_f_reset_rsps$EMPTY_N &&
	     stageD_f_reset_rsps$EMPTY_N &&
	     stage1_f_reset_rsps$EMPTY_N &&
	     stage2_f_reset_rsps$EMPTY_N &&
	     stage3_f_reset_rsps$EMPTY_N &&
	     f_reset_rsps_i_notFull__033_AND_NOT_rg_run_on__ETC___d2042 ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2342 =
	     (csr_regfile$interrupt_pending[4] || csr_regfile$nmi_pending) &&
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d2086 ||
	      NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733) ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2346 =
	     csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2342 ||
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 !=
	     2'd2 &&
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 !=
	     2'd0 ||
	     !stage1_rg_full ||
	     stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d2078 ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2349 =
	     (csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2346 ||
	      IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	      4'd0 ||
	      IF_IF_stage1_rg_stage_input_11_BITS_151_TO_145_ETC___d1445) &&
	     NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 ;
  assign csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2385 =
	     csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2346 ||
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	     4'd0 ||
	     IF_IF_stage1_rg_stage_input_11_BITS_151_TO_145_ETC___d1445 ||
	     IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2093 &&
	     stageD_rg_full ;
  assign csr_regfile_read_csr_mcycle__4_MINUS_rg_start__ETC___d2426 =
	     delta_CPI_cycles__h28275 * 64'd10 ;
  assign csr_regfile_read_misa__3_BIT_2_460_AND_stageD__ETC___d1535 =
	     csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	     stageD_rg_data[79:76] == 4'b1000 &&
	     stageD_rg_data[75:71] != 5'd0 ;
  assign csr_regfile_read_misa__3_BIT_2_460_AND_stageD__ETC___d1541 =
	     csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	     stageD_rg_data[79:76] == 4'b1001 &&
	     stageD_rg_data[75:71] != 5'd0 ;
  assign csr_regfile_read_mstatus__6_BITS_14_TO_13_8_EQ_ETC___d704 =
	     csr_regfile$read_mstatus[14:13] == 2'h0 ||
	     CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q13 ||
	     ((stage1_rg_stage_input[112:110] == 3'b111) ?
		csr_regfile$read_frm == 3'b101 ||
		csr_regfile$read_frm == 3'b110 ||
		csr_regfile$read_frm == 3'b111 :
		stage1_rg_stage_input[112:110] == 3'b101 ||
		stage1_rg_stage_input[112:110] == 3'b110) ;
  assign cur_verbosity__h3508 =
	     (csr_regfile$read_csr_minstret < cfg_logdelay) ?
	       4'd0 :
	       cfg_verbosity ;
  assign d_instr__h21381 =
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1860 ?
	       instr_out___1__h21383 :
	       IF_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg_p_ETC___d1878 ;
  assign data_to_stage2_addr__h8751 = x_out_data_to_stage2_addr__h8768 ;
  assign decoded_instr_funct10__h25797 =
	     { _theResult____h5511[31:25], _theResult____h5511[14:12] } ;
  assign decoded_instr_imm12_S__h25799 =
	     { _theResult____h5511[31:25], _theResult____h5511[11:7] } ;
  assign decoded_instr_imm13_SB__h25800 =
	     { _theResult____h5511[31],
	       _theResult____h5511[7],
	       _theResult____h5511[30:25],
	       _theResult____h5511[11:8],
	       1'b0 } ;
  assign decoded_instr_imm21_UJ__h25802 =
	     { _theResult____h5511[31],
	       _theResult____h5511[19:12],
	       _theResult____h5511[20],
	       _theResult____h5511[30:21],
	       1'b0 } ;
  assign delta_CPI_cycles__h28275 =
	     csr_regfile$read_csr_mcycle - rg_start_CPI_cycles ;
  assign delta_CPI_instrs___1__h28312 = delta_CPI_instrs__h28276 + 64'd1 ;
  assign delta_CPI_instrs__h28276 =
	     csr_regfile$read_csr_minstret - rg_start_CPI_instrs ;
  assign f_reset_rsps_i_notFull__033_AND_NOT_rg_run_on__ETC___d2042 =
	     f_reset_rsps$FULL_N &&
	     (!rg_run_on_reset ||
	      imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2038 &&
	      stageF_branch_predictor$RDY_predict_req) ;
  assign fall_through_pc__h8685 =
	     stage1_rg_stage_input[401:338] +
	     (stage1_rg_stage_input[333] ? 64'd4 : 64'd2) ;
  assign gpr_regfile_RDY_server_reset_request_put__003__ETC___d2021 =
	     gpr_regfile$RDY_server_reset_request_put &&
	     fpr_regfile$RDY_server_reset_request_put &&
	     near_mem$RDY_server_reset_request_put &&
	     csr_regfile_RDY_server_reset_request_put__006__ETC___d2018 ;
  assign imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1892 =
	     (imem_rg_pc[1:0] == 2'b0 ||
	      !imem_rg_pc_BITS_63_TO_2_0_EQ_imem_rg_cache_add_ETC___d1852 ||
	      !near_mem_imem_pc__1_EQ_imem_rg_pc_PLUS_2_854___d1855 ||
	      imem_rg_cache_b16[1:0] != 2'b11) &&
	     (imem_rg_pc[1:0] != 2'b0 ||
	      !imem_rg_pc_BITS_63_TO_2_0_EQ_near_mem_imem_pc__ETC___d13 ||
	      near_mem$imem_instr[1:0] != 2'b11) ;
  assign imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1896 =
	     imem_rg_pc[1:0] == 2'b0 ||
	     (!imem_rg_pc_BITS_63_TO_2_0_EQ_near_mem_imem_pc__ETC___d13 ||
	      near_mem$imem_instr[17:16] == 2'b11) &&
	     (!imem_rg_pc_BITS_63_TO_2_0_EQ_imem_rg_cache_add_ETC___d1852 ||
	      imem_rg_cache_b16[1:0] == 2'b11) ;
  assign imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1899 =
	     imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1892 &&
	     imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1896 &&
	     (imem_rg_pc[1:0] != 2'b0 ||
	      !imem_rg_pc_BITS_63_TO_2_0_EQ_near_mem_imem_pc__ETC___d13 ||
	      near_mem$imem_instr[1:0] == 2'b11) ;
  assign imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_near_mem__ETC___d2038 =
	     imem_rg_pc[1:0] == 2'b0 || !near_mem$imem_valid ||
	     !imem_rg_pc_BITS_63_TO_2_0_EQ_near_mem_imem_pc__ETC___d13 ||
	     near_mem$imem_instr[17:16] != 2'b11 ;
  assign imem_rg_pc_BITS_63_TO_2_0_EQ_imem_rg_cache_add_ETC___d1852 =
	     imem_rg_pc[63:2] == imem_rg_cache_addr[63:2] ;
  assign imem_rg_pc_BITS_63_TO_2_0_EQ_near_mem_imem_pc__ETC___d13 =
	     imem_rg_pc[63:2] == near_mem$imem_pc[63:2] ;
  assign imm12__h13976 = { 4'd0, offset__h13848 } ;
  assign imm12__h14313 = { 5'd0, offset__h14255 } ;
  assign imm12__h15949 = { {6{imm6__h15947[5]}}, imm6__h15947 } ;
  assign imm12__h16618 = { {2{nzimm10__h16616[9]}}, nzimm10__h16616 } ;
  assign imm12__h16833 = { 2'd0, nzimm10__h16831 } ;
  assign imm12__h17029 = { 6'b0, imm6__h15947 } ;
  assign imm12__h17366 = { 6'b010000, imm6__h15947 } ;
  assign imm12__h18987 = { 3'd0, offset__h18901 } ;
  assign imm12__h19339 = { 4'd0, offset__h19273 } ;
  assign imm20__h16077 = { {14{imm6__h15947[5]}}, imm6__h15947 } ;
  assign imm6__h15947 = { stageD_rg_data[76], stageD_rg_data[70:66] } ;
  assign instr___1__h13798 =
	     (csr_regfile$read_misa[2] && stageD_rg_data[65:64] == 2'b10 &&
	      stageD_rg_data[75:71] != 5'd0 &&
	      stageD_rg_data[79:77] == 3'b010) ?
	       instr__h13975 :
	       IF_csr_regfile_read_misa__3_BIT_2_460_AND_stag_ETC___d1752 ;
  assign instr__h13975 =
	     { imm12__h13976, 8'd18, stageD_rg_data[75:71], 7'b0000011 } ;
  assign instr__h14120 =
	     { 4'd0,
	       stageD_rg_data[72:71],
	       stageD_rg_data[76],
	       stageD_rg_data[70:66],
	       8'd18,
	       offset_BITS_4_TO_0___h14244,
	       7'b0100011 } ;
  assign instr__h14312 =
	     { imm12__h14313, rs1__h14314, 3'b010, rd__h14315, 7'b0000011 } ;
  assign instr__h14507 =
	     { 5'd0,
	       stageD_rg_data[69],
	       stageD_rg_data[76],
	       rd__h14315,
	       rs1__h14314,
	       3'b010,
	       offset_BITS_4_TO_0___h14675,
	       7'b0100011 } ;
  assign instr__h14736 =
	     { SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1525[20],
	       SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1525[10:1],
	       SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1525[11],
	       SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1525[19:12],
	       12'd111 } ;
  assign instr__h15189 = { 12'd0, stageD_rg_data[75:71], 15'd103 } ;
  assign instr__h15305 = { 12'd0, stageD_rg_data[75:71], 15'd231 } ;
  assign instr__h15370 =
	     { SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1550[12],
	       SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1550[10:5],
	       5'd0,
	       rs1__h14314,
	       3'b0,
	       SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1550[4:1],
	       SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1550[11],
	       7'b1100011 } ;
  assign instr__h15687 =
	     { SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1550[12],
	       SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1550[10:5],
	       5'd0,
	       rs1__h14314,
	       3'b001,
	       SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1550[4:1],
	       SEXT_stageD_rg_data_455_BIT_76_472_CONCAT_stag_ETC___d1550[11],
	       7'b1100011 } ;
  assign instr__h16025 =
	     { imm12__h15949, 8'd0, stageD_rg_data[75:71], 7'b0010011 } ;
  assign instr__h16209 =
	     { imm20__h16077, stageD_rg_data[75:71], 7'b0110111 } ;
  assign instr__h16338 =
	     { imm12__h15949,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0010011 } ;
  assign instr__h16565 =
	     { imm12__h15949,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0011011 } ;
  assign instr__h16820 =
	     { imm12__h16618,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0010011 } ;
  assign instr__h16992 = { imm12__h16833, 8'd16, rd__h14315, 7'b0010011 } ;
  assign instr__h17161 =
	     { imm12__h17029,
	       stageD_rg_data[75:71],
	       3'b001,
	       stageD_rg_data[75:71],
	       7'b0010011 } ;
  assign instr__h17350 =
	     { imm12__h17029, rs1__h14314, 3'b101, rs1__h14314, 7'b0010011 } ;
  assign instr__h17539 =
	     { imm12__h17366, rs1__h14314, 3'b101, rs1__h14314, 7'b0010011 } ;
  assign instr__h17656 =
	     { imm12__h15949, rs1__h14314, 3'b111, rs1__h14314, 7'b0010011 } ;
  assign instr__h17834 =
	     { 7'b0,
	       stageD_rg_data[70:66],
	       8'd0,
	       stageD_rg_data[75:71],
	       7'b0110011 } ;
  assign instr__h17953 =
	     { 7'b0,
	       stageD_rg_data[70:66],
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b0110011 } ;
  assign instr__h18048 =
	     { 7'b0,
	       rd__h14315,
	       rs1__h14314,
	       3'b111,
	       rs1__h14314,
	       7'b0110011 } ;
  assign instr__h18184 =
	     { 7'b0,
	       rd__h14315,
	       rs1__h14314,
	       3'b110,
	       rs1__h14314,
	       7'b0110011 } ;
  assign instr__h18320 =
	     { 7'b0,
	       rd__h14315,
	       rs1__h14314,
	       3'b100,
	       rs1__h14314,
	       7'b0110011 } ;
  assign instr__h18456 =
	     { 7'b0100000,
	       rd__h14315,
	       rs1__h14314,
	       3'b0,
	       rs1__h14314,
	       7'b0110011 } ;
  assign instr__h18594 =
	     { 7'b0,
	       rd__h14315,
	       rs1__h14314,
	       3'b0,
	       rs1__h14314,
	       7'b0111011 } ;
  assign instr__h18732 =
	     { 7'b0100000,
	       rd__h14315,
	       rs1__h14314,
	       3'b0,
	       rs1__h14314,
	       7'b0111011 } ;
  assign instr__h18890 =
	     { 12'b000000000001,
	       stageD_rg_data[75:71],
	       3'b0,
	       stageD_rg_data[75:71],
	       7'b1110011 } ;
  assign instr__h18986 =
	     { imm12__h18987, 8'd19, stageD_rg_data[75:71], 7'b0000011 } ;
  assign instr__h19139 =
	     { 3'd0,
	       stageD_rg_data[73:71],
	       stageD_rg_data[76],
	       stageD_rg_data[70:66],
	       8'd19,
	       offset_BITS_4_TO_0___h19614,
	       7'b0100011 } ;
  assign instr__h19338 =
	     { imm12__h19339, rs1__h14314, 3'b011, rd__h14315, 7'b0000011 } ;
  assign instr__h19489 =
	     { 4'd0,
	       stageD_rg_data[70:69],
	       stageD_rg_data[76],
	       rd__h14315,
	       rs1__h14314,
	       3'b011,
	       offset_BITS_4_TO_0___h19614,
	       7'b0100011 } ;
  assign instr__h19694 =
	     { imm12__h13976, 8'd18, stageD_rg_data[75:71], 7'b0000111 } ;
  assign instr__h20502 =
	     { imm12__h18987, 8'd19, stageD_rg_data[75:71], 7'b0000111 } ;
  assign instr__h20675 =
	     { 3'd0,
	       stageD_rg_data[73:71],
	       stageD_rg_data[76],
	       stageD_rg_data[70:66],
	       8'd19,
	       offset_BITS_4_TO_0___h19614,
	       7'b0100111 } ;
  assign instr__h20874 =
	     { imm12__h19339, rs1__h14314, 3'b011, rd__h14315, 7'b0000111 } ;
  assign instr__h21025 =
	     { 4'd0,
	       stageD_rg_data[70:69],
	       stageD_rg_data[76],
	       rd__h14315,
	       rs1__h14314,
	       3'b011,
	       offset_BITS_4_TO_0___h19614,
	       7'b0100111 } ;
  assign instr_out___1__h21383 =
	     { near_mem$imem_instr[15:0], imem_rg_cache_b16 } ;
  assign instr_out___1__h21405 = { 16'b0, near_mem$imem_instr[15:0] } ;
  assign near_mem_imem_pc__1_EQ_imem_rg_pc_PLUS_2_854___d1855 =
	     near_mem$imem_pc == imem_rg_pc + 64'd2 ;
  assign near_mem_imem_valid_AND_NOT_imem_rg_pc_BITS_1__ETC___d2001 =
	     near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     near_mem$imem_exc &&
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
  assign new_epoch__h22810 = rg_epoch + 2'd1 ;
  assign next_pc___1__h12208 = stage1_rg_stage_input[401:338] + 64'd2 ;
  assign next_pc__h12205 = stage1_rg_stage_input[401:338] + 64'd4 ;
  assign next_pc__h8686 = x_out_next_pc__h8703 ;
  assign next_pc__h8944 =
	     stage1_rg_stage_input[401:338] +
	     { {43{stage1_rg_stage_input_BITS_30_TO_10__q2[20]}},
	       stage1_rg_stage_input_BITS_30_TO_10__q2 } ;
  assign next_pc__h8978 =
	     { IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d1109[63:1],
	       1'd0 } ;
  assign nzimm10__h16616 =
	     { stageD_rg_data[76],
	       stageD_rg_data[68:67],
	       stageD_rg_data[69],
	       stageD_rg_data[66],
	       stageD_rg_data[70],
	       4'b0 } ;
  assign nzimm10__h16831 =
	     { stageD_rg_data[74:71],
	       stageD_rg_data[76:75],
	       stageD_rg_data[69],
	       stageD_rg_data[70],
	       2'b0 } ;
  assign offset_BITS_4_TO_0___h14244 = { stageD_rg_data[75:73], 2'b0 } ;
  assign offset_BITS_4_TO_0___h14675 =
	     { stageD_rg_data[75:74], stageD_rg_data[70], 2'b0 } ;
  assign offset_BITS_4_TO_0___h19614 = { stageD_rg_data[75:74], 3'b0 } ;
  assign offset__h13848 =
	     { stageD_rg_data[67:66],
	       stageD_rg_data[76],
	       stageD_rg_data[70:68],
	       2'b0 } ;
  assign offset__h14255 =
	     { stageD_rg_data[69],
	       stageD_rg_data[76:74],
	       stageD_rg_data[70],
	       2'b0 } ;
  assign offset__h14683 =
	     { stageD_rg_data[76],
	       stageD_rg_data[72],
	       stageD_rg_data[74:73],
	       stageD_rg_data[70],
	       stageD_rg_data[71],
	       stageD_rg_data[66],
	       stageD_rg_data[75],
	       stageD_rg_data[69:67],
	       1'b0 } ;
  assign offset__h15314 =
	     { stageD_rg_data[76],
	       stageD_rg_data[70:69],
	       stageD_rg_data[66],
	       stageD_rg_data[75:74],
	       stageD_rg_data[68:67],
	       1'b0 } ;
  assign offset__h18901 =
	     { stageD_rg_data[68:66],
	       stageD_rg_data[76],
	       stageD_rg_data[70:69],
	       3'b0 } ;
  assign offset__h19273 =
	     { stageD_rg_data[70:69], stageD_rg_data[76:74], 3'b0 } ;
  assign output_stage2___1_data_to_stage3_frd_val__h7610 =
	     stage2_rg_stage2[5] ?
	       ((stage2_rg_stage2[412:410] == 3'b010) ?
		  { 32'hFFFFFFFF, near_mem$dmem_word64[31:0] } :
		  near_mem$dmem_word64) :
	       stage2_rg_stage2[197:134] ;
  assign rd__h14315 = { 2'b01, stageD_rg_data[68:66] } ;
  assign rd_val___1__h10363 =
	     rs1_val_bypassed__h5224 + _theResult___snd__h13025 ;
  assign rd_val___1__h10371 =
	     rs1_val_bypassed__h5224 - _theResult___snd__h13025 ;
  assign rd_val___1__h10378 =
	     ((rs1_val_bypassed__h5224 ^ 64'h8000000000000000) <
	      (_theResult___snd__h13025 ^ 64'h8000000000000000)) ?
	       64'd1 :
	       64'd0 ;
  assign rd_val___1__h10385 =
	     (rs1_val_bypassed__h5224 < _theResult___snd__h13025) ?
	       64'd1 :
	       64'd0 ;
  assign rd_val___1__h10392 =
	     rs1_val_bypassed__h5224 ^ _theResult___snd__h13025 ;
  assign rd_val___1__h10399 =
	     rs1_val_bypassed__h5224 | _theResult___snd__h13025 ;
  assign rd_val___1__h13054 =
	     { {32{IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC__q20[31]}},
	       IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC__q20 } ;
  assign rd_val___1__h13085 = { {32{x__h13088[31]}}, x__h13088 } ;
  assign rd_val___1__h13138 = { {32{x__h13141[31]}}, x__h13141 } ;
  assign rd_val___1__h13167 = { {32{tmp__h13166[31]}}, tmp__h13166 } ;
  assign rd_val___1__h13219 =
	     { {32{rs1_val_bypassed224_BITS_31_TO_0_PLUS_rs2_val__ETC__q11[31]}},
	       rs1_val_bypassed224_BITS_31_TO_0_PLUS_rs2_val__ETC__q11 } ;
  assign rd_val___1__h13267 =
	     { {32{rs1_val_bypassed224_BITS_31_TO_0_MINUS_rs2_val_ETC__q12[31]}},
	       rs1_val_bypassed224_BITS_31_TO_0_MINUS_rs2_val_ETC__q12 } ;
  assign rd_val___1__h13273 = { {32{x__h13276[31]}}, x__h13276 } ;
  assign rd_val___1__h13318 = { {32{x__h13321[31]}}, x__h13321 } ;
  assign rd_val__h12922 = rs1_val_bypassed__h5224 << shamt__h9064 ;
  assign rd_val__h12973 = rs1_val_bypassed__h5224 >> shamt__h9064 ;
  assign rd_val__h12995 =
	     rs1_val_bypassed__h5224 >> shamt__h9064 |
	     ~(64'hFFFFFFFFFFFFFFFF >> shamt__h9064) &
	     {64{rs1_val_bypassed__h5224[63]}} ;
  assign rd_val__h8563 =
	     (!stage3_rg_stage3[69] && stage3_rg_full &&
	      stage3_rg_stage3[140] &&
	      stage3_rg_stage3_7_BITS_139_TO_135_06_EQ_stage_ETC___d376) ?
	       stage3_rg_stage3[134:71] :
	       gpr_regfile$read_rs1 ;
  assign rd_val__h8588 =
	     (!stage3_rg_stage3[69] && stage3_rg_full &&
	      stage3_rg_stage3[140] &&
	      stage3_rg_stage3_7_BITS_139_TO_135_06_EQ_stage_ETC___d384) ?
	       stage3_rg_stage3[134:71] :
	       gpr_regfile$read_rs2 ;
  assign rd_val__h8613 =
	     (stage3_rg_stage3[69] && stage3_rg_full &&
	      stage3_rg_stage3[140] &&
	      stage3_rg_stage3_7_BITS_139_TO_135_06_EQ_stage_ETC___d376) ?
	       stage3_rg_stage3[63:0] :
	       fpr_regfile$read_rs1 ;
  assign rd_val__h8636 =
	     (stage3_rg_stage3[69] && stage3_rg_full &&
	      stage3_rg_stage3[140] &&
	      stage3_rg_stage3_7_BITS_139_TO_135_06_EQ_stage_ETC___d384) ?
	       stage3_rg_stage3[63:0] :
	       fpr_regfile$read_rs2 ;
  assign rd_val__h8662 =
	     (stage3_rg_stage3[69] && stage3_rg_full &&
	      stage3_rg_stage3[140] &&
	      stage3_rg_stage3[139:135] == stage1_rg_stage_input[129:125]) ?
	       stage3_rg_stage3[63:0] :
	       fpr_regfile$read_rs3 ;
  assign rd_val__h9190 = { {32{v32__h9188[31]}}, v32__h9188 } ;
  assign rd_val__h9211 = stage1_rg_stage_input[401:338] + rd_val__h9190 ;
  assign rg_cur_priv_5_EQ_0b11_39_OR_rg_cur_priv_5_EQ_0_ETC___d1418 =
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[20]) &&
	     stage1_rg_stage_input[104:98] == 7'b0001001 ||
	     stage1_rg_stage_input[144:140] != 5'd0 ||
	     stage1_rg_stage_input[139:135] != 5'd0 ||
	     stage1_rg_stage_input[87:76] != 12'b0 &&
	     stage1_rg_stage_input[87:76] != 12'b000000000001 ;
  assign rg_cur_priv_5_EQ_0b11_39_OR_rg_cur_priv_5_EQ_0_ETC___d966 =
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[21] ||
	      rg_cur_priv == 2'b0 && csr_regfile$read_misa[13]) &&
	     stage1_rg_stage_input[87:76] == 12'b000100000101 ;
  assign rg_state_4_EQ_12_1_AND_csr_regfile_wfi_resume__ETC___d2537 =
	     rg_state == 4'd12 && csr_regfile$wfi_resume &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905) ;
  assign rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2402 =
	     rg_state == 4'd3 &&
	     NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2398 &&
	     !stage3_rg_full &&
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 ==
	     2'd0 &&
	     stage1_rg_full &&
	     stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	     NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 ;
  assign rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2513 =
	     rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2402 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	     4'd6 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905) ;
  assign rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2522 =
	     rg_state_4_EQ_3_108_AND_NOT_csr_regfile_interr_ETC___d2402 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	     4'd5 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905) ;
  assign rg_state_4_EQ_3_108_AND_stage3_rg_full_5_OR_NO_ETC___d2118 =
	     rg_state == 4'd3 &&
	     (stage3_rg_full ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 !=
	      2'd0 ||
	      stage1_rg_full ||
	      stageD_rg_full ||
	      stageF_rg_full) &&
	     (stage3_rg_full ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 !=
	      2'd3) &&
	     stage3_rg_full_5_OR_NOT_IF_stage2_rg_full_11_T_ETC___d2116 ;
  assign rg_state_4_EQ_3_108_AND_stage3_rg_full_5_OR_NO_ETC___d2127 =
	     rg_state_4_EQ_3_108_AND_stage3_rg_full_5_OR_NO_ETC___d2118 &&
	     (!csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending ||
	      NOT_stage1_rg_full_10_21_OR_stage1_rg_stage_in_ETC___d2121 ||
	      NOT_stage1_rg_full_10_21_OR_stage1_rg_stage_in_ETC___d2123 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 !=
	      2'd0 ||
	      stage3_rg_full) ;
  assign rg_state_4_EQ_5_541_AND_NOT_stageF_rg_full_882_ETC___d2542 =
	     rg_state == 4'd5 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905) ;
  assign rg_state_4_EQ_8_486_AND_NOT_stageF_rg_full_882_ETC___d2487 =
	     rg_state == 4'd8 &&
	     (!stageF_rg_full ||
	      near_mem$imem_valid &&
	      NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905) ;
  assign rg_trap_info_412_BITS_131_TO_68_413_EQ_csr_reg_ETC___d2422 =
	     rg_trap_info[131:68] == csr_regfile$csr_trap_actions[193:130] ;
  assign rm__h9688 = x_out_data_to_stage2_rounding_mode__h8777 ;
  assign rs1__h14314 = { 2'b01, stageD_rg_data[73:71] } ;
  assign rs1_val__h28755 =
	     (rg_trap_instr[14:12] == 3'b001) ?
	       rg_csr_val1 :
	       { 59'd0, rg_trap_instr[19:15] } ;
  assign rs1_val_bypassed224_BITS_31_TO_0_MINUS_rs2_val_ETC__q12 =
	     rs1_val_bypassed__h5224[31:0] - rs2_val_bypassed__h5230[31:0] ;
  assign rs1_val_bypassed224_BITS_31_TO_0_PLUS_rs2_val__ETC__q11 =
	     rs1_val_bypassed__h5224[31:0] + rs2_val_bypassed__h5230[31:0] ;
  assign rs1_val_bypassed224_BITS_31_TO_0_SRL_rs2_val_b_ETC__q10 =
	     rs1_val_bypassed__h5224[31:0] >> rs2_val_bypassed__h5230[4:0] |
	     ~(32'hFFFFFFFF >> rs2_val_bypassed__h5230[4:0]) &
	     {32{rs1_val_bypassed224_BITS_31_TO_0__q9[31]}} ;
  assign rs1_val_bypassed224_BITS_31_TO_0__q9 =
	     rs1_val_bypassed__h5224[31:0] ;
  assign rs1_val_bypassed__h5224 =
	     (stage1_rg_stage_input[139:135] == 5'd0) ? 64'd0 : val__h8565 ;
  assign rs2_val_bypassed__h5230 =
	     (stage1_rg_stage_input[134:130] == 5'd0) ? 64'd0 : val__h8590 ;
  assign shamt__h9064 =
	     (stage1_rg_stage_input[151:145] == 7'b0010011) ?
	       stage1_rg_stage_input[81:76] :
	       rs2_val_bypassed__h5230[5:0] ;
  assign stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d1180 =
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 !=
	     3'd0 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 !=
	     3'd1 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 !=
	     3'd2 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 !=
	     3'd3 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 !=
	     3'd4 ;
  assign stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920 =
	     stage1_rg_full &&
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) ;
  assign stage1_rg_stage_input_11_BITS_112_TO_110_55_EQ_ETC___d757 =
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
  assign stage1_rg_stage_input_11_BITS_144_TO_140_37_EQ_ETC___d945 =
	     stage1_rg_stage_input[144:140] == 5'd0 &&
	     (rg_cur_priv == 2'b11 ||
	      rg_cur_priv == 2'b01 && !csr_regfile$read_mstatus[20]) &&
	     stage1_rg_stage_input[104:98] == 7'b0001001 ;
  assign stage1_rg_stage_input_11_BITS_151_TO_145_53_EQ_ETC___d2223 =
	     stage1_rg_stage_input[151:145] == 7'b1010011 &&
	     (stage1_rg_stage_input[104:98] == 7'h69 &&
	      (stage1_rg_stage_input[134:130] == 5'd0 ||
	       stage1_rg_stage_input[134:130] == 5'd1 ||
	       stage1_rg_stage_input[134:130] == 5'd2 ||
	       stage1_rg_stage_input[134:130] == 5'd3) ||
	      stage1_rg_stage_input[104:98] == 7'h79 ||
	      stage1_rg_stage_input[104:98] == 7'h68 &&
	      (stage1_rg_stage_input[134:130] == 5'd0 ||
	       stage1_rg_stage_input[134:130] == 5'd1 ||
	       stage1_rg_stage_input[134:130] == 5'd2 ||
	       stage1_rg_stage_input[134:130] == 5'd3) ||
	      stage1_rg_stage_input[104:98] == 7'h78) ;
  assign stage1_rg_stage_input_11_BITS_151_TO_145_53_EQ_ETC___d750 =
	     stage1_rg_stage_input[151:145] == 7'b0110011 &&
	     stage1_rg_stage_input[104:98] == 7'b0000001 ||
	     stage1_rg_stage_input[151:145] == 7'b0111011 &&
	     stage1_rg_stage_input[104:98] == 7'b0000001 ||
	     (stage1_rg_stage_input[151:145] == 7'b0010011 ||
	      stage1_rg_stage_input[151:145] == 7'b0110011) &&
	     (stage1_rg_stage_input[112:110] == 3'b001 ||
	      stage1_rg_stage_input[112:110] == 3'b101) ;
  assign stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d1387 =
	     stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	     NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd0 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd1 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd2 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd3 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd4 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd5 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd6 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd7 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd8 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd9 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd10 &&
	     IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 !=
	     4'd11 ;
  assign stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d2081 =
	     (stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d2078 ||
	      IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 ==
	      4'd0) &&
	     (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) ;
  assign stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 =
	     stage1_rg_stage_input[335:334] == rg_epoch ;
  assign stage1_rg_stage_input_BITS_30_TO_10__q2 =
	     stage1_rg_stage_input[30:10] ;
  assign stage1_rg_stage_input_BITS_63_TO_51__q1 =
	     stage1_rg_stage_input[63:51] ;
  assign stage1_rg_stage_input_BITS_75_TO_64__q6 =
	     stage1_rg_stage_input[75:64] ;
  assign stage1_rg_stage_input_BITS_87_TO_76__q19 =
	     stage1_rg_stage_input[87:76] ;
  assign stage3_rg_full_5_OR_NOT_IF_stage2_rg_full_11_T_ETC___d2116 =
	     stage3_rg_full ||
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 !=
	     2'd0 ||
	     !stage1_rg_full ||
	     !stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	     IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917 ;
  assign stage3_rg_stage3_7_BITS_139_TO_135_06_EQ_stage_ETC___d376 =
	     stage3_rg_stage3[139:135] == stage1_rg_stage_input[139:135] ;
  assign stage3_rg_stage3_7_BITS_139_TO_135_06_EQ_stage_ETC___d384 =
	     stage3_rg_stage3[139:135] == stage1_rg_stage_input[134:130] ;
  assign stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1914 =
	     stageF_rg_full && near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     !near_mem$imem_exc ;
  assign stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1920 =
	     stageF_rg_full && near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     near_mem$imem_exc &&
	     near_mem$imem_exc_code == 4'd0 ;
  assign stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1924 =
	     stageF_rg_full && near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     near_mem$imem_exc &&
	     near_mem$imem_exc_code == 4'd1 ;
  assign stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1928 =
	     stageF_rg_full && near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     near_mem$imem_exc &&
	     near_mem$imem_exc_code == 4'd2 ;
  assign stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1932 =
	     stageF_rg_full && near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     near_mem$imem_exc &&
	     near_mem$imem_exc_code == 4'd3 ;
  assign stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1936 =
	     stageF_rg_full && near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     near_mem$imem_exc &&
	     near_mem$imem_exc_code == 4'd4 ;
  assign stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1940 =
	     stageF_rg_full && near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     near_mem$imem_exc &&
	     near_mem$imem_exc_code == 4'd5 ;
  assign stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1944 =
	     stageF_rg_full && near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     near_mem$imem_exc &&
	     near_mem$imem_exc_code == 4'd6 ;
  assign stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1948 =
	     stageF_rg_full && near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     near_mem$imem_exc &&
	     near_mem$imem_exc_code == 4'd7 ;
  assign stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1952 =
	     stageF_rg_full && near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     near_mem$imem_exc &&
	     near_mem$imem_exc_code == 4'd8 ;
  assign stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1956 =
	     stageF_rg_full && near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     near_mem$imem_exc &&
	     near_mem$imem_exc_code == 4'd9 ;
  assign stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1960 =
	     stageF_rg_full && near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     near_mem$imem_exc &&
	     near_mem$imem_exc_code == 4'd11 ;
  assign stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1964 =
	     stageF_rg_full && near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     near_mem$imem_exc &&
	     near_mem$imem_exc_code == 4'd12 ;
  assign stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1968 =
	     stageF_rg_full && near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     near_mem$imem_exc &&
	     near_mem$imem_exc_code == 4'd13 ;
  assign stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1972 =
	     stageF_rg_full && near_mem$imem_valid &&
	     NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	     near_mem$imem_exc &&
	     near_mem$imem_exc_code == 4'd15 ;
  assign sxl__h6552 =
	     (csr_regfile$read_misa[27:26] == 2'd2) ?
	       csr_regfile$read_mstatus[35:34] :
	       2'd0 ;
  assign tmp__h13166 =
	     rs1_val_bypassed__h5224[31:0] >> stage1_rg_stage_input[80:76] |
	     ~(32'hFFFFFFFF >> stage1_rg_stage_input[80:76]) &
	     {32{rs1_val_bypassed224_BITS_31_TO_0__q9[31]}} ;
  assign trap_info_tval__h12430 =
	     (stage1_rg_stage_input[151:145] != 7'b1101111 &&
	      stage1_rg_stage_input[151:145] != 7'b1100111 &&
	      (stage1_rg_stage_input[151:145] != 7'b1110011 ||
	       stage1_rg_stage_input[112:110] != 3'b0 ||
	       rg_cur_priv_5_EQ_0b11_39_OR_rg_cur_priv_5_EQ_0_ETC___d1418)) ?
	       (stage1_rg_stage_input[333] ?
		  { 32'd0, stage1_rg_stage_input[263:232] } :
		  { 48'd0, stage1_rg_stage_input[231:216] }) :
	       CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q24 ;
  assign uxl__h6553 =
	     (csr_regfile$read_misa[27:26] == 2'd2) ?
	       csr_regfile$read_mstatus[33:32] :
	       2'd0 ;
  assign v32__h9188 = { stage1_rg_stage_input[50:31], 12'h0 } ;
  assign val__h8565 =
	     (IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d277 ==
	      2'd2 &&
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d315) ?
	       x_out_bypass_rd_val__h8251 :
	       rd_val__h8563 ;
  assign val__h8590 =
	     (IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d277 ==
	      2'd2 &&
	      IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d317) ?
	       x_out_bypass_rd_val__h8251 :
	       rd_val__h8588 ;
  assign value__h12540 =
	     stage1_rg_stage_input[332] ?
	       stage1_rg_stage_input[327:264] :
	       trap_info_tval__h12430 ;
  assign x__h13088 =
	     rs1_val_bypassed__h5224[31:0] << stage1_rg_stage_input[80:76] ;
  assign x__h13141 =
	     rs1_val_bypassed__h5224[31:0] >> stage1_rg_stage_input[80:76] ;
  assign x__h13276 =
	     rs1_val_bypassed__h5224[31:0] << rs2_val_bypassed__h5230[4:0] ;
  assign x__h13321 =
	     rs1_val_bypassed__h5224[31:0] >> rs2_val_bypassed__h5230[4:0] ;
  assign x__h28278 =
	     csr_regfile_read_csr_mcycle__4_MINUS_rg_start__ETC___d2426[63:0] /
	     _theResult____h28277 ;
  assign x_exc_code__h36657 =
	     (csr_regfile$interrupt_pending[4] && !csr_regfile$nmi_pending) ?
	       csr_regfile$interrupt_pending[3:0] :
	       4'd0 ;
  assign x_out_cf_info_fallthru_PC__h12676 =
	     stage1_rg_stage_input[333] ?
	       next_pc__h12205 :
	       next_pc___1__h12208 ;
  assign x_out_data_to_stage1_instr__h13762 =
	     stageD_rg_data[165] ? stageD_rg_data[95:64] : instr___1__h13798 ;
  assign x_out_data_to_stage2_fval1__h8771 =
	     (IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d295 ==
	      2'd2 &&
	      IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d320) ?
	       x_out_fbypass_rd_val__h8379 :
	       rd_val__h8613 ;
  assign x_out_data_to_stage2_fval3__h8773 =
	     (IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d295 ==
	      2'd2 &&
	      IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d324) ?
	       x_out_fbypass_rd_val__h8379 :
	       rd_val__h8662 ;
  assign x_out_data_to_stage2_rd__h8767 =
	     stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ?
	       data_to_stage2_rd__h8750 :
	       5'd0 ;
  assign x_out_data_to_stage2_rounding_mode__h8777 =
	     (stage1_rg_stage_input[112:110] == 3'b111) ?
	       csr_regfile$read_frm :
	       stage1_rg_stage_input[112:110] ;
  assign x_out_data_to_stage2_val2__h8770 =
	     (stage1_rg_stage_input[151:145] == 7'b1100011) ?
	       branch_target__h8909 :
	       IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1310 ;
  assign x_out_next_pc__h8703 =
	     IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d914 ?
	       data_to_stage2_addr__h8751 :
	       fall_through_pc__h8685 ;
  assign x_out_trap_info_exc_code__h12435 =
	     stage1_rg_stage_input[332] ?
	       stage1_rg_stage_input[331:328] :
	       alu_outputs_exc_code__h9734 ;
  assign y__h29704 = ~rs1_val__h29435 ;
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4: value__h7948 = stage2_rg_stage2[493:430];
      default: value__h7948 = stage2_rg_stage2[493:430];
    endcase
  end
  always@(stage2_rg_stage2 or near_mem$dmem_exc_code)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4:
	  x_out_trap_info_exc_code__h7985 = near_mem$dmem_exc_code;
      default: x_out_trap_info_exc_code__h7985 = 4'd2;
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4: value__h8009 = stage2_rg_stage2[389:326];
      default: value__h8009 = 64'd0;
    endcase
  end
  always@(stage2_rg_stage2 or stage2_fbox$word_snd)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd1, 3'd2, 3'd3, 3'd4:
	  x_out_data_to_stage3_fpr_flags__h7709 = 5'd0;
      default: x_out_data_to_stage3_fpr_flags__h7709 = stage2_fbox$word_snd;
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd1, 3'd4:
	  x_out_data_to_stage3_rd__h7705 = stage2_rg_stage2[394:390];
      3'd2: x_out_data_to_stage3_rd__h7705 = 5'd0;
      default: x_out_data_to_stage3_rd__h7705 = stage2_rg_stage2[394:390];
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd1, 3'd4: x_out_bypass_rd__h8250 = stage2_rg_stage2[394:390];
      default: x_out_bypass_rd__h8250 = stage2_rg_stage2[394:390];
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4: x_out_fbypass_rd__h8378 = stage2_rg_stage2[394:390];
      default: x_out_fbypass_rd__h8378 = stage2_rg_stage2[394:390];
    endcase
  end
  always@(rg_trap_instr or rg_csr_val1)
  begin
    case (rg_trap_instr[14:12])
      3'b010, 3'b011: rs1_val__h29435 = rg_csr_val1;
      default: rs1_val__h29435 = { 59'd0, rg_trap_instr[19:15] };
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_fbox$word_fst or
	  output_stage2___1_data_to_stage3_frd_val__h7610)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd2, 3'd3:
	  x_out_data_to_stage3_frd_val__h7710 = stage2_rg_stage2[197:134];
      3'd1, 3'd4:
	  x_out_data_to_stage3_frd_val__h7710 =
	      output_stage2___1_data_to_stage3_frd_val__h7610;
      default: x_out_data_to_stage3_frd_val__h7710 = stage2_fbox$word_fst;
    endcase
  end
  always@(stage2_rg_stage2 or
	  _theResult___snd_snd_rd_val__h7681 or
	  near_mem$dmem_word64 or stage2_mbox$word)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd2:
	  x_out_data_to_stage3_rd_val__h7706 = stage2_rg_stage2[325:262];
      3'd1, 3'd4: x_out_data_to_stage3_rd_val__h7706 = near_mem$dmem_word64;
      3'd3: x_out_data_to_stage3_rd_val__h7706 = stage2_mbox$word;
      default: x_out_data_to_stage3_rd_val__h7706 =
		   _theResult___snd_snd_rd_val__h7681;
    endcase
  end
  always@(stage2_rg_stage2 or
	  _theResult___snd_snd_rd_val__h7681 or stage2_mbox$word)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0, 3'd1, 3'd4:
	  x_out_bypass_rd_val__h8251 = stage2_rg_stage2[325:262];
      3'd3: x_out_bypass_rd_val__h8251 = stage2_mbox$word;
      default: x_out_bypass_rd_val__h8251 =
		   _theResult___snd_snd_rd_val__h7681;
    endcase
  end
  always@(stage2_rg_stage2 or _theResult___snd_fst_rd_val__h8370)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4: x_out_fbypass_rd_val__h8379 = stage2_rg_stage2[197:134];
      default: x_out_fbypass_rd_val__h8379 =
		   _theResult___snd_fst_rd_val__h8370;
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
	  data_to_stage2_rd__h8750 = stage1_rg_stage_input[144:140];
      7'b1100011: data_to_stage2_rd__h8750 = 5'd0;
      default: data_to_stage2_rd__h8750 = stage1_rg_stage_input[144:140];
    endcase
  end
  always@(stage2_rg_stage2 or
	  IF_stage2_fbox_valid__41_THEN_2_ELSE_1___d142 or
	  IF_near_mem_dmem_valid__35_THEN_IF_near_mem_dm_ETC___d138 or
	  IF_stage2_mbox_valid__39_THEN_2_ELSE_1___d140)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0: CASE_stage2_rg_stage2_BITS_397_TO_395_0_2_1_IF_ETC__q3 = 2'd2;
      3'd1, 3'd2, 3'd4:
	  CASE_stage2_rg_stage2_BITS_397_TO_395_0_2_1_IF_ETC__q3 =
	      IF_near_mem_dmem_valid__35_THEN_IF_near_mem_dm_ETC___d138;
      3'd3:
	  CASE_stage2_rg_stage2_BITS_397_TO_395_0_2_1_IF_ETC__q3 =
	      IF_stage2_mbox_valid__39_THEN_2_ELSE_1___d140;
      default: CASE_stage2_rg_stage2_BITS_397_TO_395_0_2_1_IF_ETC__q3 =
		   IF_stage2_fbox_valid__41_THEN_2_ELSE_1___d142;
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_fbox$valid or
	  near_mem$dmem_valid or near_mem$dmem_exc or stage2_mbox$valid)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4:
	  IF_stage2_rg_stage2_12_BITS_397_TO_395_13_EQ_1_ETC___d163 =
	      !near_mem$dmem_valid || near_mem$dmem_exc;
      3'd3:
	  IF_stage2_rg_stage2_12_BITS_397_TO_395_13_EQ_1_ETC___d163 =
	      !stage2_mbox$valid;
      default: IF_stage2_rg_stage2_12_BITS_397_TO_395_13_EQ_1_ETC___d163 =
		   !stage2_fbox$valid;
    endcase
  end
  always@(stage2_rg_stage2 or
	  stage2_fbox$valid or
	  near_mem$dmem_valid or near_mem$dmem_exc or stage2_mbox$valid)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd2, 3'd4:
	  IF_stage2_rg_stage2_12_BITS_397_TO_395_13_EQ_1_ETC___d173 =
	      near_mem$dmem_valid && !near_mem$dmem_exc;
      3'd3:
	  IF_stage2_rg_stage2_12_BITS_397_TO_395_13_EQ_1_ETC___d173 =
	      stage2_mbox$valid;
      default: IF_stage2_rg_stage2_12_BITS_397_TO_395_13_EQ_1_ETC___d173 =
		   stage2_fbox$valid;
    endcase
  end
  always@(stage2_rg_stage2 or
	  IF_stage2_fbox_valid__41_THEN_2_ELSE_1___d142 or
	  IF_NOT_near_mem_dmem_valid__35_57_OR_NOT_near__ETC___d270 or
	  IF_stage2_mbox_valid__39_THEN_2_ELSE_1___d140)
  begin
    case (stage2_rg_stage2[397:395])
      3'd0: CASE_stage2_rg_stage2_BITS_397_TO_395_0_2_1_IF_ETC__q4 = 2'd2;
      3'd1, 3'd4:
	  CASE_stage2_rg_stage2_BITS_397_TO_395_0_2_1_IF_ETC__q4 =
	      IF_NOT_near_mem_dmem_valid__35_57_OR_NOT_near__ETC___d270;
      3'd2: CASE_stage2_rg_stage2_BITS_397_TO_395_0_2_1_IF_ETC__q4 = 2'd0;
      3'd3:
	  CASE_stage2_rg_stage2_BITS_397_TO_395_0_2_1_IF_ETC__q4 =
	      IF_stage2_mbox_valid__39_THEN_2_ELSE_1___d140;
      default: CASE_stage2_rg_stage2_BITS_397_TO_395_0_2_1_IF_ETC__q4 =
		   stage2_rg_stage2[5] ?
		     2'd0 :
		     IF_stage2_fbox_valid__41_THEN_2_ELSE_1___d142;
    endcase
  end
  always@(stage2_rg_stage2 or
	  IF_stage2_fbox_valid__41_THEN_2_ELSE_1___d142 or
	  IF_NOT_near_mem_dmem_valid__35_57_OR_NOT_near__ETC___d290)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4:
	  CASE_stage2_rg_stage2_BITS_397_TO_395_1_IF_NOT_ETC__q5 =
	      IF_NOT_near_mem_dmem_valid__35_57_OR_NOT_near__ETC___d290;
      3'd2, 3'd3:
	  CASE_stage2_rg_stage2_BITS_397_TO_395_1_IF_NOT_ETC__q5 = 2'd0;
      default: CASE_stage2_rg_stage2_BITS_397_TO_395_1_IF_NOT_ETC__q5 =
		   stage2_rg_stage2[5] ?
		     IF_stage2_fbox_valid__41_THEN_2_ELSE_1___d142 :
		     2'd0;
    endcase
  end
  always@(rg_cur_priv)
  begin
    case (rg_cur_priv)
      2'b0: CASE_rg_cur_priv_0b0_8_0b1_9_11__q7 = 4'd8;
      2'b01: CASE_rg_cur_priv_0b0_8_0b1_9_11__q7 = 4'd9;
      default: CASE_rg_cur_priv_0b0_8_0b1_9_11__q7 = 4'd11;
    endcase
  end
  always@(stage1_rg_stage_input or CASE_rg_cur_priv_0b0_8_0b1_9_11__q7)
  begin
    case (stage1_rg_stage_input[87:76])
      12'b0:
	  CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q8 =
	      CASE_rg_cur_priv_0b0_8_0b1_9_11__q7;
      12'b000000000001:
	  CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q8 = 4'd3;
      default: CASE_stage1_rg_stage_input_BITS_87_TO_76_0b0_C_ETC__q8 = 4'd2;
    endcase
  end
  always@(stage1_rg_stage_input or alu_outputs___1_exc_code__h9555)
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
	  alu_outputs_exc_code__h9734 = 4'd2;
      7'b1100111, 7'b1101111: alu_outputs_exc_code__h9734 = 4'd0;
      7'b1110011:
	  alu_outputs_exc_code__h9734 = alu_outputs___1_exc_code__h9555;
      default: alu_outputs_exc_code__h9734 = 4'd2;
    endcase
  end
  always@(stage1_rg_stage_input or
	  _theResult___fst__h10589 or
	  rd_val___1__h13219 or
	  rd_val___1__h13273 or rd_val___1__h13318 or rd_val___1__h13267)
  begin
    case (stage1_rg_stage_input[97:88])
      10'b0: alu_outputs___1_val1__h9176 = rd_val___1__h13219;
      10'b0000000001: alu_outputs___1_val1__h9176 = rd_val___1__h13273;
      10'b0000000101: alu_outputs___1_val1__h9176 = rd_val___1__h13318;
      10'b0100000000: alu_outputs___1_val1__h9176 = rd_val___1__h13267;
      default: alu_outputs___1_val1__h9176 = _theResult___fst__h10589;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d394 or
	  IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d390 or
	  IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d392)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b0:
	  IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d725 =
	      !IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d390;
      3'b001:
	  IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d725 =
	      IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d390;
      3'b100:
	  IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d725 =
	      !IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d392;
      3'b101:
	  IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d725 =
	      IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d392;
      3'b110:
	  IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d725 =
	      !IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d394;
      default: IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d725 =
		   stage1_rg_stage_input[112:110] != 3'b111 ||
		   IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d394;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d394 or
	  IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d390 or
	  IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d392)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b0:
	  IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d401 =
	      IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d390;
      3'b001:
	  IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d401 =
	      !IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d390;
      3'b100:
	  IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d401 =
	      IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d392;
      3'b101:
	  IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d401 =
	      !IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d392;
      3'b110:
	  IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d401 =
	      IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d394;
      default: IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d401 =
		   stage1_rg_stage_input[112:110] == 3'b111 &&
		   !IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d394;
    endcase
  end
  always@(stage1_rg_stage_input or rm__h9688)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1000011, 7'b1000111, 7'b1001011, 7'b1001111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q13 =
	      stage1_rg_stage_input[99:98] != 2'b0 &&
	      stage1_rg_stage_input[99:98] != 2'b01;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q13 =
		   stage1_rg_stage_input[104:98] != 7'h0 &&
		   stage1_rg_stage_input[104:98] != 7'h04 &&
		   stage1_rg_stage_input[104:98] != 7'h08 &&
		   stage1_rg_stage_input[104:98] != 7'h0C &&
		   stage1_rg_stage_input[104:98] != 7'h2C &&
		   (stage1_rg_stage_input[104:98] != 7'h10 ||
		    rm__h9688 != 3'd0) &&
		   (stage1_rg_stage_input[104:98] != 7'h10 ||
		    rm__h9688 != 3'd1) &&
		   (stage1_rg_stage_input[104:98] != 7'h10 ||
		    rm__h9688 != 3'd2) &&
		   (stage1_rg_stage_input[104:98] != 7'h60 ||
		    stage1_rg_stage_input[134:130] != 5'd0) &&
		   (stage1_rg_stage_input[104:98] != 7'h60 ||
		    stage1_rg_stage_input[134:130] != 5'd1) &&
		   (stage1_rg_stage_input[104:98] != 7'h60 ||
		    stage1_rg_stage_input[134:130] != 5'd2) &&
		   (stage1_rg_stage_input[104:98] != 7'h60 ||
		    stage1_rg_stage_input[134:130] != 5'd3) &&
		   (stage1_rg_stage_input[104:98] != 7'h68 ||
		    stage1_rg_stage_input[134:130] != 5'd0) &&
		   (stage1_rg_stage_input[104:98] != 7'h68 ||
		    stage1_rg_stage_input[134:130] != 5'd1) &&
		   (stage1_rg_stage_input[104:98] != 7'h68 ||
		    stage1_rg_stage_input[134:130] != 5'd2) &&
		   (stage1_rg_stage_input[104:98] != 7'h68 ||
		    stage1_rg_stage_input[134:130] != 5'd3) &&
		   (stage1_rg_stage_input[104:98] != 7'h14 ||
		    rm__h9688 != 3'd0) &&
		   (stage1_rg_stage_input[104:98] != 7'h14 ||
		    rm__h9688 != 3'd1) &&
		   (stage1_rg_stage_input[104:98] != 7'h50 ||
		    rm__h9688 != 3'd0) &&
		   (stage1_rg_stage_input[104:98] != 7'h50 ||
		    rm__h9688 != 3'd1) &&
		   (stage1_rg_stage_input[104:98] != 7'h50 ||
		    rm__h9688 != 3'd2) &&
		   (stage1_rg_stage_input[104:98] != 7'h70 ||
		    rm__h9688 != 3'd0) &&
		   (stage1_rg_stage_input[104:98] != 7'h78 ||
		    rm__h9688 != 3'd0) &&
		   (stage1_rg_stage_input[104:98] != 7'h70 ||
		    rm__h9688 != 3'd1) &&
		   stage1_rg_stage_input[104:98] != 7'b0000001 &&
		   stage1_rg_stage_input[104:98] != 7'h05 &&
		   stage1_rg_stage_input[104:98] != 7'b0001001 &&
		   stage1_rg_stage_input[104:98] != 7'h0D &&
		   stage1_rg_stage_input[104:98] != 7'h2D &&
		   (stage1_rg_stage_input[104:98] != 7'h11 ||
		    rm__h9688 != 3'd0) &&
		   (stage1_rg_stage_input[104:98] != 7'h11 ||
		    rm__h9688 != 3'd1) &&
		   (stage1_rg_stage_input[104:98] != 7'h11 ||
		    rm__h9688 != 3'd2) &&
		   (stage1_rg_stage_input[104:98] != 7'h61 ||
		    stage1_rg_stage_input[134:130] != 5'd0) &&
		   (stage1_rg_stage_input[104:98] != 7'h61 ||
		    stage1_rg_stage_input[134:130] != 5'd1) &&
		   (stage1_rg_stage_input[104:98] != 7'h61 ||
		    stage1_rg_stage_input[134:130] != 5'd2) &&
		   (stage1_rg_stage_input[104:98] != 7'h61 ||
		    stage1_rg_stage_input[134:130] != 5'd3) &&
		   (stage1_rg_stage_input[104:98] != 7'h69 ||
		    stage1_rg_stage_input[134:130] != 5'd0) &&
		   (stage1_rg_stage_input[104:98] != 7'h69 ||
		    stage1_rg_stage_input[134:130] != 5'd1) &&
		   (stage1_rg_stage_input[104:98] != 7'h69 ||
		    stage1_rg_stage_input[134:130] != 5'd2) &&
		   (stage1_rg_stage_input[104:98] != 7'h69 ||
		    stage1_rg_stage_input[134:130] != 5'd3) &&
		   (stage1_rg_stage_input[104:98] != 7'h21 ||
		    stage1_rg_stage_input[134:130] != 5'd0) &&
		   (stage1_rg_stage_input[104:98] != 7'h20 ||
		    stage1_rg_stage_input[134:130] != 5'd1) &&
		   (stage1_rg_stage_input[104:98] != 7'h15 ||
		    rm__h9688 != 3'd0) &&
		   (stage1_rg_stage_input[104:98] != 7'h15 ||
		    rm__h9688 != 3'd1) &&
		   (stage1_rg_stage_input[104:98] != 7'h51 ||
		    rm__h9688 != 3'd0) &&
		   (stage1_rg_stage_input[104:98] != 7'h51 ||
		    rm__h9688 != 3'd1) &&
		   (stage1_rg_stage_input[104:98] != 7'h51 ||
		    rm__h9688 != 3'd2) &&
		   (stage1_rg_stage_input[104:98] != 7'h71 ||
		    rm__h9688 != 3'd0) &&
		   (stage1_rg_stage_input[104:98] != 7'h79 ||
		    rm__h9688 != 3'd0) &&
		   (stage1_rg_stage_input[104:98] != 7'h71 ||
		    rm__h9688 != 3'd1);
    endcase
  end
  always@(stage1_rg_stage_input or
	  csr_regfile_read_mstatus__6_BITS_14_TO_13_8_EQ_ETC___d704 or
	  csr_regfile$read_mstatus)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000111:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d708 =
	      stage1_rg_stage_input[112:110] != 3'b0 &&
	      stage1_rg_stage_input[112:110] != 3'b100 &&
	      stage1_rg_stage_input[112:110] != 3'b001 &&
	      stage1_rg_stage_input[112:110] != 3'b101 &&
	      stage1_rg_stage_input[112:110] != 3'b010 &&
	      stage1_rg_stage_input[112:110] != 3'b110 &&
	      stage1_rg_stage_input[112:110] != 3'b011 ||
	      csr_regfile$read_mstatus[14:13] == 2'h0;
      7'b0100111:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d708 =
	      stage1_rg_stage_input[112:110] != 3'b0 &&
	      stage1_rg_stage_input[112:110] != 3'b001 &&
	      stage1_rg_stage_input[112:110] != 3'b010 &&
	      stage1_rg_stage_input[112:110] != 3'b011 ||
	      csr_regfile$read_mstatus[14:13] == 2'h0;
      7'b0101111:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d708 =
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
      default: IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d708 =
		   stage1_rg_stage_input[151:145] != 7'b1010011 &&
		   stage1_rg_stage_input[151:145] != 7'b1000011 &&
		   stage1_rg_stage_input[151:145] != 7'b1000111 &&
		   stage1_rg_stage_input[151:145] != 7'b1001011 &&
		   stage1_rg_stage_input[151:145] != 7'b1001111 ||
		   csr_regfile_read_mstatus__6_BITS_14_TO_13_8_EQ_ETC___d704;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d708)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14 =
	      stage1_rg_stage_input[112:110] != 3'b0 &&
	      stage1_rg_stage_input[112:110] != 3'b100 &&
	      stage1_rg_stage_input[112:110] != 3'b001 &&
	      stage1_rg_stage_input[112:110] != 3'b101 &&
	      stage1_rg_stage_input[112:110] != 3'b010 &&
	      stage1_rg_stage_input[112:110] != 3'b110 &&
	      stage1_rg_stage_input[112:110] != 3'b011;
      7'b0100011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14 =
	      stage1_rg_stage_input[112:110] != 3'b0 &&
	      stage1_rg_stage_input[112:110] != 3'b001 &&
	      stage1_rg_stage_input[112:110] != 3'b010 &&
	      stage1_rg_stage_input[112:110] != 3'b011;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14 =
		   stage1_rg_stage_input[151:145] == 7'b0001111 ||
		   stage1_rg_stage_input[151:145] == 7'b1110011 ||
		   IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d708;
    endcase
  end
  always@(stage1_rg_stage_input or
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14 or
	  NOT_stage1_rg_stage_input_11_BITS_112_TO_110_5_ETC___d437)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d716 =
	      NOT_stage1_rg_stage_input_11_BITS_112_TO_110_5_ETC___d437;
      7'b0011011:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d716 =
	      stage1_rg_stage_input[112:110] != 3'b0 &&
	      (stage1_rg_stage_input[112:110] != 3'b001 ||
	       stage1_rg_stage_input[257]) &&
	      (stage1_rg_stage_input[112:110] != 3'b101 ||
	       stage1_rg_stage_input[257]);
      7'b0111011:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d716 =
	      stage1_rg_stage_input[97:88] != 10'b0 &&
	      stage1_rg_stage_input[97:88] != 10'b0100000000 &&
	      stage1_rg_stage_input[97:88] != 10'b0000000001 &&
	      stage1_rg_stage_input[97:88] != 10'b0000000101 &&
	      stage1_rg_stage_input[97:88] != 10'b0100000101;
      default: IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d716 =
		   stage1_rg_stage_input[151:145] != 7'b0110111 &&
		   stage1_rg_stage_input[151:145] != 7'b0010111 &&
		   CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q14;
    endcase
  end
  always@(stage1_rg_stage_input or rm__h9688)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1000011, 7'b1000111, 7'b1001011, 7'b1001111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q15 =
	      stage1_rg_stage_input[99:98] == 2'b0 ||
	      stage1_rg_stage_input[99:98] == 2'b01;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q15 =
		   stage1_rg_stage_input[104:98] == 7'h0 ||
		   stage1_rg_stage_input[104:98] == 7'h04 ||
		   stage1_rg_stage_input[104:98] == 7'h08 ||
		   stage1_rg_stage_input[104:98] == 7'h0C ||
		   stage1_rg_stage_input[104:98] == 7'h2C ||
		   stage1_rg_stage_input[104:98] == 7'h10 &&
		   (rm__h9688 == 3'd0 || rm__h9688 == 3'd1 ||
		    rm__h9688 == 3'd2) ||
		   stage1_rg_stage_input[104:98] == 7'h60 &&
		   stage1_rg_stage_input[134:130] == 5'd0 ||
		   stage1_rg_stage_input[104:98] == 7'h60 &&
		   (stage1_rg_stage_input[134:130] == 5'd1 ||
		    stage1_rg_stage_input[134:130] == 5'd2 ||
		    stage1_rg_stage_input[134:130] == 5'd3) ||
		   stage1_rg_stage_input[104:98] == 7'h68 &&
		   (stage1_rg_stage_input[134:130] == 5'd0 ||
		    stage1_rg_stage_input[134:130] == 5'd1 ||
		    stage1_rg_stage_input[134:130] == 5'd2) ||
		   stage1_rg_stage_input[104:98] == 7'h68 &&
		   stage1_rg_stage_input[134:130] == 5'd3 ||
		   stage1_rg_stage_input[104:98] == 7'h14 &&
		   rm__h9688 == 3'd0 ||
		   stage1_rg_stage_input[104:98] == 7'h14 &&
		   rm__h9688 == 3'd1 ||
		   stage1_rg_stage_input[104:98] == 7'h50 &&
		   (rm__h9688 == 3'd0 || rm__h9688 == 3'd1) ||
		   stage1_rg_stage_input[104:98] == 7'h50 &&
		   rm__h9688 == 3'd2 ||
		   (stage1_rg_stage_input[104:98] == 7'h70 ||
		    stage1_rg_stage_input[104:98] == 7'h78) &&
		   rm__h9688 == 3'd0 ||
		   stage1_rg_stage_input[104:98] == 7'h70 &&
		   rm__h9688 == 3'd1 ||
		   stage1_rg_stage_input[104:98] == 7'b0000001 ||
		   stage1_rg_stage_input[104:98] == 7'h05 ||
		   stage1_rg_stage_input[104:98] == 7'b0001001 ||
		   stage1_rg_stage_input[104:98] == 7'h0D ||
		   stage1_rg_stage_input[104:98] == 7'h2D ||
		   stage1_rg_stage_input[104:98] == 7'h11 &&
		   rm__h9688 == 3'd0 ||
		   stage1_rg_stage_input[104:98] == 7'h11 &&
		   (rm__h9688 == 3'd1 || rm__h9688 == 3'd2) ||
		   stage1_rg_stage_input[104:98] == 7'h61 &&
		   stage1_rg_stage_input[134:130] == 5'd0 ||
		   stage1_rg_stage_input[104:98] == 7'h61 &&
		   (stage1_rg_stage_input[134:130] == 5'd1 ||
		    stage1_rg_stage_input[134:130] == 5'd2 ||
		    stage1_rg_stage_input[134:130] == 5'd3) ||
		   stage1_rg_stage_input[104:98] == 7'h69 &&
		   (stage1_rg_stage_input[134:130] == 5'd0 ||
		    stage1_rg_stage_input[134:130] == 5'd1 ||
		    stage1_rg_stage_input[134:130] == 5'd2) ||
		   stage1_rg_stage_input[104:98] == 7'h69 &&
		   stage1_rg_stage_input[134:130] == 5'd3 ||
		   stage1_rg_stage_input[104:98] == 7'h21 &&
		   stage1_rg_stage_input[134:130] == 5'd0 ||
		   stage1_rg_stage_input[104:98] == 7'h20 &&
		   stage1_rg_stage_input[134:130] == 5'd1 ||
		   stage1_rg_stage_input[104:98] == 7'h15 &&
		   (rm__h9688 == 3'd0 || rm__h9688 == 3'd1) ||
		   stage1_rg_stage_input[104:98] == 7'h51 &&
		   rm__h9688 == 3'd0 ||
		   stage1_rg_stage_input[104:98] == 7'h51 &&
		   (rm__h9688 == 3'd1 || rm__h9688 == 3'd2) ||
		   stage1_rg_stage_input[104:98] == 7'h71 &&
		   rm__h9688 == 3'd0 ||
		   stage1_rg_stage_input[104:98] == 7'h79 &&
		   rm__h9688 == 3'd0 ||
		   stage1_rg_stage_input[104:98] == 7'h71 &&
		   rm__h9688 == 3'd1;
    endcase
  end
  always@(stage1_rg_stage_input or
	  NOT_csr_regfile_read_mstatus__6_BITS_14_TO_13__ETC___d897 or
	  csr_regfile$read_mstatus)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000111:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d901 =
	      (stage1_rg_stage_input[112:110] == 3'b0 ||
	       stage1_rg_stage_input[112:110] == 3'b100 ||
	       stage1_rg_stage_input[112:110] == 3'b001 ||
	       stage1_rg_stage_input[112:110] == 3'b101 ||
	       stage1_rg_stage_input[112:110] == 3'b010 ||
	       stage1_rg_stage_input[112:110] == 3'b110 ||
	       stage1_rg_stage_input[112:110] == 3'b011) &&
	      csr_regfile$read_mstatus[14:13] != 2'h0;
      7'b0100111:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d901 =
	      (stage1_rg_stage_input[112:110] == 3'b0 ||
	       stage1_rg_stage_input[112:110] == 3'b001 ||
	       stage1_rg_stage_input[112:110] == 3'b010 ||
	       stage1_rg_stage_input[112:110] == 3'b011) &&
	      csr_regfile$read_mstatus[14:13] != 2'h0;
      7'b0101111:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d901 =
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
      default: IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d901 =
		   (stage1_rg_stage_input[151:145] == 7'b1010011 ||
		    stage1_rg_stage_input[151:145] == 7'b1000011 ||
		    stage1_rg_stage_input[151:145] == 7'b1000111 ||
		    stage1_rg_stage_input[151:145] == 7'b1001011 ||
		    stage1_rg_stage_input[151:145] == 7'b1001111) &&
		   NOT_csr_regfile_read_mstatus__6_BITS_14_TO_13__ETC___d897;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d901)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q16 =
	      stage1_rg_stage_input[112:110] == 3'b0 ||
	      stage1_rg_stage_input[112:110] == 3'b100 ||
	      stage1_rg_stage_input[112:110] == 3'b001 ||
	      stage1_rg_stage_input[112:110] == 3'b101 ||
	      stage1_rg_stage_input[112:110] == 3'b010 ||
	      stage1_rg_stage_input[112:110] == 3'b110 ||
	      stage1_rg_stage_input[112:110] == 3'b011;
      7'b0100011:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q16 =
	      stage1_rg_stage_input[112:110] == 3'b0 ||
	      stage1_rg_stage_input[112:110] == 3'b001 ||
	      stage1_rg_stage_input[112:110] == 3'b010 ||
	      stage1_rg_stage_input[112:110] == 3'b011;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q16 =
		   stage1_rg_stage_input[151:145] != 7'b0001111 &&
		   stage1_rg_stage_input[151:145] != 7'b1110011 &&
		   IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d901;
    endcase
  end
  always@(stage1_rg_stage_input or
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q16 or
	  stage1_rg_stage_input_11_BITS_112_TO_110_55_EQ_ETC___d757)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d909 =
	      stage1_rg_stage_input_11_BITS_112_TO_110_55_EQ_ETC___d757;
      7'b0011011:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d909 =
	      stage1_rg_stage_input[112:110] == 3'b0 ||
	      (stage1_rg_stage_input[112:110] == 3'b001 ||
	       stage1_rg_stage_input[112:110] == 3'b101) &&
	      !stage1_rg_stage_input[257];
      7'b0111011:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d909 =
	      stage1_rg_stage_input[97:88] == 10'b0 ||
	      stage1_rg_stage_input[97:88] == 10'b0100000000 ||
	      stage1_rg_stage_input[97:88] == 10'b0000000001 ||
	      stage1_rg_stage_input[97:88] == 10'b0000000101 ||
	      stage1_rg_stage_input[97:88] == 10'b0100000101;
      default: IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d909 =
		   stage1_rg_stage_input[151:145] == 7'b0110111 ||
		   stage1_rg_stage_input[151:145] == 7'b0010111 ||
		   CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q16;
    endcase
  end
  always@(stage1_rg_stage_input or
	  rg_cur_priv or
	  IF_rg_cur_priv_5_EQ_0b11_39_OR_rg_cur_priv_5_E_ETC___d968)
  begin
    case (stage1_rg_stage_input[87:76])
      12'b0, 12'b000000000001:
	  IF_stage1_rg_stage_input_11_BITS_87_TO_76_47_E_ETC___d970 = 4'd12;
      default: IF_stage1_rg_stage_input_11_BITS_87_TO_76_47_E_ETC___d970 =
		   (rg_cur_priv == 2'b11 &&
		    stage1_rg_stage_input[87:76] == 12'b001100000010) ?
		     4'd8 :
		     IF_rg_cur_priv_5_EQ_0b11_39_OR_rg_cur_priv_5_E_ETC___d968;
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
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_11_BITS_144_TO_140_37_ETC___d972)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b0:
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q18 =
	      IF_stage1_rg_stage_input_11_BITS_144_TO_140_37_ETC___d972;
      3'b001, 3'b101:
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q18 = 4'd3;
      3'b010, 3'b011, 3'b110, 3'b111:
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q18 = 4'd4;
      3'd4: CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q18 = 4'd12;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d930 or
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q17 or
	  IF_NOT_stage1_rg_stage_input_11_BITS_112_TO_11_ETC___d924 or
	  IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d934 or
	  IF_NOT_csr_regfile_read_mstatus__6_BITS_14_TO__ETC___d980 or
	  CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q18)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011, 7'b0000111:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d992 =
	      IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d930;
      7'b0001111:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d992 =
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q17;
      7'b0010011, 7'b0110011:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d992 =
	      IF_NOT_stage1_rg_stage_input_11_BITS_112_TO_11_ETC___d924;
      7'b0010111, 7'b0110111:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d992 = 4'd1;
      7'b0011011:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d992 =
	      (stage1_rg_stage_input[112:110] != 3'b0 &&
	       (stage1_rg_stage_input[112:110] != 3'b001 ||
		stage1_rg_stage_input[257]) &&
	       (stage1_rg_stage_input[112:110] != 3'b101 ||
		stage1_rg_stage_input[257])) ?
		4'd12 :
		4'd1;
      7'b0100011, 7'b0100111:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d992 =
	      IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d934;
      7'b0101111:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d992 =
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
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d992 =
	      (stage1_rg_stage_input[97:88] != 10'b0 &&
	       stage1_rg_stage_input[97:88] != 10'b0100000000 &&
	       stage1_rg_stage_input[97:88] != 10'b0000000001 &&
	       stage1_rg_stage_input[97:88] != 10'b0000000101 &&
	       stage1_rg_stage_input[97:88] != 10'b0100000101) ?
		4'd12 :
		4'd1;
      7'b1000011, 7'b1000111, 7'b1001011, 7'b1001111, 7'b1010011:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d992 =
	      IF_NOT_csr_regfile_read_mstatus__6_BITS_14_TO__ETC___d980;
      7'b1110011:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d992 =
	      CASE_stage1_rg_stage_input_BITS_112_TO_110_0b0_ETC__q18;
      default: IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d992 =
		   4'd12;
    endcase
  end
  always@(stage1_rg_stage_input or
	  stage1_rg_stage_input_11_BITS_151_TO_145_53_EQ_ETC___d750 or
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d992 or
	  IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d401)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d995 =
	      (stage1_rg_stage_input[112:110] != 3'b0 &&
	       stage1_rg_stage_input[112:110] != 3'b001 &&
	       stage1_rg_stage_input[112:110] != 3'b100 &&
	       stage1_rg_stage_input[112:110] != 3'b101 &&
	       stage1_rg_stage_input[112:110] != 3'b110 &&
	       stage1_rg_stage_input[112:110] != 3'b111) ?
		4'd12 :
		(IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d401 ?
		   4'd2 :
		   4'd1);
      7'b1100111, 7'b1101111:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d995 = 4'd2;
      default: IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d995 =
		   stage1_rg_stage_input_11_BITS_151_TO_145_53_EQ_ETC___d750 ?
		     4'd1 :
		     IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d992;
    endcase
  end
  always@(stage1_rg_stage_input)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011:
	  IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d1080 = 2'd0;
      7'b1100111:
	  IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d1080 = 2'd2;
      7'b1101111:
	  IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d1080 = 2'd1;
      default: IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d1080 =
		   2'd3;
    endcase
  end
  always@(stage1_rg_stage_input or
	  _theResult_____1_fst__h10410 or
	  rd_val___1__h10378 or
	  rd_val___1__h10385 or rd_val___1__h10392 or rd_val___1__h10399)
  begin
    case (stage1_rg_stage_input[112:110])
      3'b010: _theResult_____1_fst__h10382 = rd_val___1__h10378;
      3'b011: _theResult_____1_fst__h10382 = rd_val___1__h10385;
      3'b100: _theResult_____1_fst__h10382 = rd_val___1__h10392;
      3'b110: _theResult_____1_fst__h10382 = rd_val___1__h10399;
      default: _theResult_____1_fst__h10382 = _theResult_____1_fst__h10410;
    endcase
  end
  always@(stage1_rg_stage_input or
	  alu_outputs___1_addr__h9276 or
	  IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d1109 or
	  rs1_val_bypassed__h5224 or
	  alu_outputs___1_addr__h8931 or next_pc__h8978 or next_pc__h8944)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0000011, 7'b0000111:
	  x_out_data_to_stage2_addr__h8768 =
	      IF_stage1_rg_stage_input_11_BITS_139_TO_135_14_ETC___d1109;
      7'b0100011:
	  x_out_data_to_stage2_addr__h8768 = alu_outputs___1_addr__h9276;
      7'b0101111: x_out_data_to_stage2_addr__h8768 = rs1_val_bypassed__h5224;
      7'b1100011:
	  x_out_data_to_stage2_addr__h8768 = alu_outputs___1_addr__h8931;
      7'b1100111: x_out_data_to_stage2_addr__h8768 = next_pc__h8978;
      7'b1101111: x_out_data_to_stage2_addr__h8768 = next_pc__h8944;
      default: x_out_data_to_stage2_addr__h8768 = alu_outputs___1_addr__h9276;
    endcase
  end
  always@(stage1_rg_stage_input or
	  next_pc__h8978 or branch_target__h8909 or next_pc__h8944)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011: x_out_cf_info_taken_PC__h12677 = branch_target__h8909;
      7'b1101111: x_out_cf_info_taken_PC__h12677 = next_pc__h8944;
      default: x_out_cf_info_taken_PC__h12677 = next_pc__h8978;
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
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q21)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100011, 7'b1100111, 7'b1101111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q22 = 3'd0;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q22 =
		   ((stage1_rg_stage_input[151:145] == 7'b0110011 ||
		     stage1_rg_stage_input[151:145] == 7'b0111011) &&
		    stage1_rg_stage_input[104:98] == 7'b0000001) ?
		     3'd3 :
		     CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q21;
    endcase
  end
  always@(stage1_rg_stage_input or rs2_val_bypassed__h5230)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0100011, 7'b0101111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q23 =
	      rs2_val_bypassed__h5230;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q23 =
		   rs2_val_bypassed__h5230;
    endcase
  end
  always@(stage1_rg_stage_input or
	  NOT_rg_cur_priv_5_EQ_0b11_39_427_AND_NOT_rg_cu_ETC___d1433 or
	  data_to_stage2_addr__h8751)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100111, 7'b1101111:
	  CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q24 =
	      data_to_stage2_addr__h8751;
      default: CASE_stage1_rg_stage_input_BITS_151_TO_145_0b1_ETC__q24 =
		   (stage1_rg_stage_input[151:145] == 7'b1110011 &&
		    stage1_rg_stage_input[112:110] == 3'b0 &&
		    NOT_rg_cur_priv_5_EQ_0b11_39_427_AND_NOT_rg_cu_ETC___d1433) ?
		     stage1_rg_stage_input[401:338] :
		     64'd0;
    endcase
  end
  always@(stage1_rg_stage_input or
	  rs1_val_bypassed__h5224 or
	  alu_outputs___1_val1__h9120 or
	  rd_val__h9211 or
	  alu_outputs___1_val1__h9148 or
	  alu_outputs___1_val1__h9586 or
	  rd_val__h9190 or
	  alu_outputs___1_val1__h9176 or alu_outputs___1_val1__h9559)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b0010011, 7'b0110011:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1299 =
	      alu_outputs___1_val1__h9120;
      7'b0010111:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1299 =
	      rd_val__h9211;
      7'b0011011:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1299 =
	      alu_outputs___1_val1__h9148;
      7'b0101111:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1299 =
	      alu_outputs___1_val1__h9586;
      7'b0110111:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1299 =
	      rd_val__h9190;
      7'b0111011:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1299 =
	      alu_outputs___1_val1__h9176;
      7'b1110011:
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1299 =
	      alu_outputs___1_val1__h9559;
      default: IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1299 =
		   rs1_val_bypassed__h5224;
    endcase
  end
  always@(stage1_rg_stage_input or
	  IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1301 or
	  x_out_cf_info_fallthru_PC__h12676)
  begin
    case (stage1_rg_stage_input[151:145])
      7'b1100111, 7'b1101111:
	  x_out_data_to_stage2_val1__h8769 =
	      x_out_cf_info_fallthru_PC__h12676;
      default: x_out_data_to_stage2_val1__h8769 =
		   IF_stage1_rg_stage_input_11_BITS_151_TO_145_53_ETC___d1301;
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4:
	  CASE_stage2_rg_stage2_BITS_397_TO_395_1_stage2_ETC__q25 =
	      stage2_rg_stage2[5];
      default: CASE_stage2_rg_stage2_BITS_397_TO_395_1_stage2_ETC__q25 =
		   stage2_rg_stage2[397:395] != 3'd2 &&
		   stage2_rg_stage2[397:395] != 3'd3 &&
		   stage2_rg_stage2[5];
    endcase
  end
  always@(stage2_rg_stage2)
  begin
    case (stage2_rg_stage2[397:395])
      3'd1, 3'd4:
	  CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_st_ETC__q26 =
	      !stage2_rg_stage2[5];
      default: CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_st_ETC__q26 =
		   stage2_rg_stage2[397:395] == 3'd2 ||
		   stage2_rg_stage2[397:395] == 3'd3 ||
		   !stage2_rg_stage2[5];
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
	$write(" sxl:%0d uxl:%0d", sxl__h6552, uxl__h6553);
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
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("Output_Stage2", " EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("Output_Stage2", " BUSY: pc:%0h", stage2_rg_stage2[493:430]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write("Output_Stage2", " NONPIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("Output_Stage2", " PIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("data_to_Stage3 {pc:%h  instr:%h  priv:%0d\n",
	       stage2_rg_stage2[493:430],
	       stage2_rg_stage2[429:398],
	       stage2_rg_stage2[495:494]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("        rd_valid:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3 &&
	  stage2_rg_stage2[397:395] != 3'd0 &&
	  IF_stage2_rg_stage2_12_BITS_397_TO_395_13_EQ_1_ETC___d163)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3 &&
	  (stage2_rg_stage2[397:395] == 3'd0 ||
	   IF_stage2_rg_stage2_12_BITS_397_TO_395_13_EQ_1_ETC___d173))
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3 &&
	  stage2_rg_stage2[397:395] != 3'd0 &&
	  stage2_rg_stage2[397:395] != 3'd1 &&
	  stage2_rg_stage2[397:395] != 3'd4 &&
	  stage2_rg_stage2[397:395] != 3'd2 &&
	  stage2_rg_stage2[397:395] != 3'd3)
	$write("  fflags: %05b",
	       "'h%h",
	       x_out_data_to_stage3_fpr_flags__h7709);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3 &&
	  (stage2_rg_stage2[397:395] == 3'd0 ||
	   stage2_rg_stage2[397:395] == 3'd1 ||
	   stage2_rg_stage2[397:395] == 3'd4 ||
	   stage2_rg_stage2[397:395] == 3'd2 ||
	   stage2_rg_stage2[397:395] == 3'd3))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3 &&
	  stage2_rg_stage2[397:395] != 3'd0 &&
	  CASE_stage2_rg_stage2_BITS_397_TO_395_1_stage2_ETC__q25)
	$write("  frd:%0d  rd_val:%h\n",
	       x_out_data_to_stage3_rd__h7705,
	       x_out_data_to_stage3_frd_val__h7710);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3 &&
	  (stage2_rg_stage2[397:395] == 3'd0 ||
	   CASE_stage2_rg_stage2_BITS_397_TO_395_1_NOT_st_ETC__q26))
	$write("  grd:%0d  rd_val:%h\n",
	       x_out_data_to_stage3_rd__h7705,
	       x_out_data_to_stage3_rd_val__h7706);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write("Trap_Info { ", "epc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write("'h%h", value__h7948);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write("'h%h", x_out_trap_info_exc_code__h7985);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write(", ", "tval: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write("'h%h", value__h8009, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write("Trap_Info { ", "epc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write("'h%h", value__h7948);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write("'h%h", x_out_trap_info_exc_code__h7985);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write(", ", "tval: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd3)
	$write("'h%h", value__h8009, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd1 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 != 2'd3)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        Bypass  to Stage1: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("Bypass {");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d277 == 2'd0)
	$write("Rd -");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d277 != 2'd0)
	$write("Rd %0d ", x_out_bypass_rd__h8250);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d277 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d277 == 2'd1)
	$write("-");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d277 != 2'd0 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d277 != 2'd1)
	$write("rd_val:%h", x_out_bypass_rd_val__h8251);
    if (RST_N != `BSV_RESET_VALUE) if (WILL_FIRE_RL_rl_show_pipe) $write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        FBypass to Stage1: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("FBypass {");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d295 == 2'd0)
	$write("FRd -");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d295 != 2'd0)
	$write("FRd %0d ", x_out_fbypass_rd__h8378);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d295 == 2'd0)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d295 == 2'd1)
	$write("-");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d295 != 2'd0 &&
	  IF_NOT_stage2_rg_full_11_51_OR_stage2_rg_stage_ETC___d295 != 2'd1)
	$write("frd_val:%h", x_out_fbypass_rd_val__h8379);
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
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("Output_Stage1",
	       " BUSY pc:%h",
	       stage1_rg_stage_input[401:338]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("Output_Stage1",
	       " NONPIPE: pc:%h",
	       stage1_rg_stage_input[401:338]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("Output_Stage1");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full)
	$write("Output_Stage1", " EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write(" PIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd0)
	$write("CONTROL_DISCARD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd1)
	$write("CONTROL_STRAIGHT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd2)
	$write("CONTROL_BRANCH");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd3)
	$write("CONTROL_CSRR_W");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd4)
	$write("CONTROL_CSRR_S_or_C");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd5)
	$write("CONTROL_FENCE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd6)
	$write("CONTROL_FENCE_I");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd7)
	$write("CONTROL_SFENCE_VMA");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd8)
	$write("CONTROL_MRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd9)
	$write("CONTROL_SRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd10)
	$write("CONTROL_URET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd11)
	$write("CONTROL_WFI");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1071)
	$write("CONTROL_TRAP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1083)
	$write("{", "CF_None");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1087)
	$write("{", "BR ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1093)
	$write("{");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1083)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1087)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d1080 == 2'd1)
	$write("JAL [%h->%h/%h]",
	       stage1_rg_stage_input[401:338],
	       x_out_cf_info_taken_PC__h12677,
	       x_out_cf_info_fallthru_PC__h12676);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d1080 == 2'd2)
	$write("JALR [%h->%h/%h]",
	       stage1_rg_stage_input[401:338],
	       x_out_cf_info_taken_PC__h12677,
	       x_out_cf_info_fallthru_PC__h12676);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1083)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1087)
	if (stage1_rg_stage_input[151:145] != 7'b1100011 ||
	    IF_stage1_rg_stage_input_11_BITS_112_TO_110_55_ETC___d401)
	  $write("taken ");
	else
	  $write("fallthru ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1093)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1083)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1087)
	$write("[%h->%h %h]",
	       stage1_rg_stage_input[401:338],
	       x_out_cf_info_fallthru_PC__h12676,
	       x_out_cf_info_taken_PC__h12677);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  NOT_stage1_rg_stage_input_11_BITS_335_TO_334_1_ETC___d1093)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("data_to_Stage 2 {pc:%h  instr:%h  priv:%0d\n",
	       stage1_rg_stage_input[401:338],
	       stage1_rg_stage_input[263:232],
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("            op_stage2:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 == 3'd0)
	$write("OP_Stage2_ALU");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 == 3'd1)
	$write("OP_Stage2_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 == 3'd2)
	$write("OP_Stage2_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 == 3'd3)
	$write("OP_Stage2_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d917) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 == 3'd4)
	$write("OP_Stage2_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d1180)
	$write("OP_Stage2_FD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("  rd:%0d\n", x_out_data_to_stage2_rd__h8767);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("            addr:%h  val1:%h  val2:%h}",
	       x_out_data_to_stage2_addr__h8768,
	       x_out_data_to_stage2_val1__h8769,
	       x_out_data_to_stage2_val2__h8770);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("            fval1:%h  fval2:%h  fval3:%h}",
	       x_out_data_to_stage2_fval1__h8771,
	       alu_outputs___1_fval2__h9280,
	       x_out_data_to_stage2_fval3__h8773);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd0)
	$write("CONTROL_DISCARD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd1)
	$write("CONTROL_STRAIGHT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd2)
	$write("CONTROL_BRANCH");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd3)
	$write("CONTROL_CSRR_W");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd4)
	$write("CONTROL_CSRR_S_or_C");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd5)
	$write("CONTROL_FENCE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd6)
	$write("CONTROL_FENCE_I");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd7)
	$write("CONTROL_SFENCE_VMA");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd8)
	$write("CONTROL_MRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd9)
	$write("CONTROL_SRET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd10)
	$write("CONTROL_URET");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd11)
	$write("CONTROL_WFI");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d1387)
	$write("CONTROL_TRAP");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("Trap_Info { ", "epc: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("'h%h", stage1_rg_stage_input[401:338]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write(", ", "exc_code: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("'h%h", x_out_trap_info_exc_code__h12435);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write(", ", "tval: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d733)
	$write("'h%h", value__h12540, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stage1_rg_full_10_AND_NOT_stage1_rg_stage_inpu_ETC___d920)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d327)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  !IF_IF_stage1_rg_stage_input_11_BITS_151_TO_145_ETC___d1445)
	$write("\n        redirect next_pc:%h", x_out_next_pc__h8703);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d351) &&
	  IF_IF_stage1_rg_stage_input_11_BITS_151_TO_145_ETC___d1445)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stage1_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe)
	$display("    StageD: pc 0x%08h instr 0x%08h priv %0d epoch %0d",
		 stageD_rg_data[233:170],
		 x_out_data_to_stage1_instr__h13762,
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
	       x_out_data_to_stage1_instr__h13762,
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
		 d_instr__h21381,
		 stageF_rg_priv,
		 stageF_rg_epoch);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("        ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("Output_StageF");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1899))
	$write(" BUSY: pc:%h", imem_rg_pc);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905)
	$write(" PIPE: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write(" EMPTY");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1899))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905)
	$write("data_to_StageD {pc:%h  priv:%0d  epoch:%0d",
	       imem_rg_pc,
	       stageF_rg_priv,
	       stageF_rg_epoch);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1899))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905 &&
	  near_mem$imem_exc)
	$write("  ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1914)
	$write("  instr:%h  pred_pc:%h",
	       d_instr__h21381,
	       stageF_branch_predictor$predict_rsp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1899))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1920)
	$write("INSTRUCTION_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1924)
	$write("INSTRUCTION_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1928)
	$write("ILLEGAL_INSTRUCTION");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1932)
	$write("BREAKPOINT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1936)
	$write("LOAD_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1940)
	$write("LOAD_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1944)
	$write("STORE_AMO_ADDR_MISALIGNED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1948)
	$write("STORE_AMO_ACCESS_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1952)
	$write("ECALL_FROM_U");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1956)
	$write("ECALL_FROM_S");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1960)
	$write("ECALL_FROM_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1964)
	$write("INSTRUCTION_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1968)
	$write("LOAD_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1972)
	$write("STORE_AMO_PAGE_FAULT");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem_imem_valid_AND_NOT_imem_rg_pc_BITS_1__ETC___d2001)
	$write("unknown trap Exc_Code %d", near_mem$imem_exc_code);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe &&
	  stageF_rg_full_882_AND_near_mem_imem_valid_AND_ETC___d1914)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  (!near_mem$imem_valid ||
	   imem_rg_pc_BITS_1_TO_0_EQ_0b0_OR_NOT_imem_rg_p_ETC___d1899))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && stageF_rg_full &&
	  near_mem$imem_valid &&
	  NOT_imem_rg_pc_BITS_1_TO_0_EQ_0b0_AND_imem_rg__ETC___d1905)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe && !stageF_rg_full) $write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_show_pipe) $display("----------------");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage2_nonpipe &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage2_nonpipe", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_trap &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage1_trap", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  rg_trap_info_412_BITS_131_TO_68_413_EQ_csr_reg_ETC___d2422)
	$display("%0d: %m.rl_stage1_trap: Tight infinite trap loop: pc 0x%0x instr 0x%08x",
		 csr_regfile$read_csr_mcycle,
		 csr_regfile$csr_trap_actions[193:130],
		 rg_trap_instr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  rg_trap_info_412_BITS_131_TO_68_413_EQ_csr_reg_ETC___d2422)
	$display("CPI: %0d.%0d = (%0d/%0d) since last 'continue'",
		 cpi__h28279,
		 cpifrac__h28280,
		 delta_CPI_cycles__h28275,
		 _theResult____h28277);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap &&
	  rg_trap_info_412_BITS_131_TO_68_413_EQ_csr_reg_ETC___d2422)
	$finish(32'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap && cur_verbosity__h3508 == 4'd1)
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 rg_trap_info[131:68],
		 rg_trap_instr,
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap && cur_verbosity__h3508 != 4'd0)
	$display("    mcause:0x%0h  epc 0x%0h  tval:0x%0h  next_pc 0x%0h, new_priv %0d new_mstatus 0x%0h",
		 csr_regfile$csr_trap_actions[65:2],
		 rg_trap_info[131:68],
		 rg_trap_info[63:0],
		 csr_regfile$csr_trap_actions[193:130],
		 csr_regfile$csr_trap_actions[1:0],
		 csr_regfile$csr_trap_actions[129:66]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage1_CSRR_W", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W_2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage1_CSRR_W_2", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W_2 && csr_regfile$access_permitted_1 &&
	  cur_verbosity__h3508 == 4'd1)
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 rg_csr_pc,
		 rg_trap_instr,
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W_2 && csr_regfile$access_permitted_1 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    S1: write CSRRW/CSRRWI Rs1 %0d Rs1_val 0x%0h csr 0x%0h csr_val 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h28755,
		 rg_trap_instr[31:20],
		 csr_regfile$read_csr[63:0],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_W_2 &&
	  !csr_regfile$access_permitted_1 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    Trap on CSR permissions: Rs1 %0d Rs1_val 0x%0h csr 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h28755,
		 rg_trap_instr[31:20],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage1_CSRR_S_or_C",
		 csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage1_CSRR_S_or_C_2",
		 csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	  csr_regfile$access_permitted_2 &&
	  cur_verbosity__h3508 == 4'd1)
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 rg_csr_pc,
		 rg_trap_instr,
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	  csr_regfile$access_permitted_2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    S1: write CSRR_S_or_C: Rs1 %0d Rs1_val 0x%0h csr 0x%0h csr_val 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h29435,
		 rg_trap_instr[31:20],
		 csr_regfile$read_csr[63:0],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_CSRR_S_or_C_2 &&
	  !csr_regfile$access_permitted_2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    Trap on CSR permissions: Rs1 %0d Rs1_val 0x%0h csr 0x%0h Rd %0d",
		 rg_trap_instr[19:15],
		 rs1_val__h29435,
		 rg_trap_instr[31:20],
		 rg_trap_instr[11:7]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_restart_after_csrrx &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage1_restart_after_csrrx",
		 csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_restart_after_csrrx &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("    %m.enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h22810,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_restart_after_csrrx &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_restart_after_csrrx &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_restart_after_csrrx &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_mcycle,
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h22810);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_xRET &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage1_xRET", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_xRET && cur_verbosity__h3508 == 4'd1)
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_xRET && cur_verbosity__h3508 != 4'd0)
	$display("    xRET: next_pc:0x%0h  new mstatus:0x%0h  new priv:%0d",
		 csr_regfile$csr_ret_actions[129:66],
		 csr_regfile$csr_ret_actions[63:0],
		 csr_regfile$csr_ret_actions[65:64]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage1_FENCE_I", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_FENCE_I && cur_verbosity__h3508 == 4'd1)
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage1_FENCE_I", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_finish_FENCE_I", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("    %m.enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h22810,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_mcycle,
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h22810);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE_I &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    CPU.rl_finish_FENCE_I");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage1_FENCE", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_FENCE && cur_verbosity__h3508 == 4'd1)
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage1_FENCE", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_finish_FENCE", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("    %m.enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h22810,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_mcycle,
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h22810);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_FENCE &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    CPU.rl_finish_FENCE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_SFENCE_VMA &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_finish_SFENCE_VMA", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_SFENCE_VMA &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("    %m.enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h22810,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_SFENCE_VMA &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_SFENCE_VMA &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_SFENCE_VMA &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_mcycle,
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h22810);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_finish_SFENCE_VMA &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    CPU.rl_finish_SFENCE_VMA");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_WFI &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage1_WFI", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_WFI && cur_verbosity__h3508 == 4'd1)
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_WFI &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    CPU.rl_stage1_WFI");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_WFI_resume &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_WFI_resume", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_WFI_resume &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("    %m.enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h22810,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_WFI_resume &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_WFI_resume &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_WFI_resume &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_mcycle,
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h22810);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_from_WFI &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_reset_from_WFI", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap_fetch &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("    %m.enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       rg_next_pc,
	       new_epoch__h22810,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap_fetch &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap_fetch &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_trap_fetch &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_mcycle,
		 csr_regfile$read_csr_minstret,
		 rg_next_pc,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h22810);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_interrupt &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage1_interrupt", csr_regfile$read_csr_mcycle);
    if (WILL_FIRE_RL_imem_rl_assert_fail)
      begin
        v__h2327 = $stime;
	#0;
      end
    v__h2321 = v__h2327 / 32'd10;
    if (WILL_FIRE_RL_imem_rl_assert_fail)
      $display("%0d: ERROR: CPU_Fetch_C: imem32.is_i32_not_i16 is False",
	       v__h2321);
    if (WILL_FIRE_RL_imem_rl_assert_fail) $finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset)
	$display("%0d: %m.rl_reset_complete: restart at PC = 0x%0h",
		 csr_regfile$read_csr_mcycle,
		 soc_map$m_pc_reset_value);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("    %m.enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       soc_map$m_pc_reset_value,
	       new_epoch__h22810,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && rg_run_on_reset &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    fa_stageF_redirect: minstret:%0d  new_pc:%0x  cur_priv:%0d, epoch %0d->%0d",
		 csr_regfile$read_csr_mcycle,
		 csr_regfile$read_csr_minstret,
		 soc_map$m_pc_reset_value,
		 rg_cur_priv,
		 rg_epoch,
		 new_epoch__h22810);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && !rg_run_on_reset)
	$display("%0d: %m.rl_reset_complete: entering DEBUG_MODE",
		 csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_pipe", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe && stage3_rg_full && stage3_rg_stage3[140] &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 &&
	  stage3_rg_stage3[69])
	$display("    S3.fa_deq: write FRd 0x%0h, rd_val 0x%0h",
		 stage3_rg_stage3[139:135],
		 stage3_rg_stage3[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe && stage3_rg_full && stage3_rg_stage3[140] &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 &&
	  !stage3_rg_stage3[69])
	$display("    S3.fa_deq: write GRd 0x%0h, rd_val 0x%0h",
		 stage3_rg_stage3[139:135],
		 stage3_rg_stage3[134:71]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("    S3.enq: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("data_to_Stage3 {pc:%h  instr:%h  priv:%0d\n",
	       stage2_rg_stage2[493:430],
	       stage2_rg_stage2[429:398],
	       stage2_rg_stage2[495:494]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("        rd_valid:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 &&
	  stage2_rg_stage2[397:395] != 3'd0 &&
	  IF_stage2_rg_stage2_12_BITS_397_TO_395_13_EQ_1_ETC___d163)
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 &&
	  (stage2_rg_stage2[397:395] == 3'd0 ||
	   IF_stage2_rg_stage2_12_BITS_397_TO_395_13_EQ_1_ETC___d173))
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 &&
	  stage2_rg_stage2[397:395] != 3'd0 &&
	  stage2_rg_stage2[397:395] != 3'd1 &&
	  stage2_rg_stage2[397:395] != 3'd4 &&
	  stage2_rg_stage2[397:395] != 3'd2 &&
	  stage2_rg_stage2[397:395] != 3'd3)
	$write("  fflags: %05b",
	       "'h%h",
	       x_out_data_to_stage3_fpr_flags__h7709);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 &&
	  (stage2_rg_stage2[397:395] == 3'd0 ||
	   stage2_rg_stage2[397:395] == 3'd1 ||
	   stage2_rg_stage2[397:395] == 3'd4 ||
	   stage2_rg_stage2[397:395] == 3'd2 ||
	   stage2_rg_stage2[397:395] == 3'd3))
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d2162)
	$write("  frd:%0d  rd_val:%h\n",
	       x_out_data_to_stage3_rd__h7705,
	       x_out_data_to_stage3_frd_val__h7710);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d2164)
	$write("  grd:%0d  rd_val:%h\n",
	       x_out_data_to_stage3_rd__h7705,
	       x_out_data_to_stage3_rd_val__h7706);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd2 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_stage2_rg_full_11_THEN_IF_stage2_rg_stage2__ETC___d147 == 2'd2 &&
	  cur_verbosity__h3508 == 4'd1)
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage2_rg_stage2[493:430],
		 stage2_rg_stage2[429:398],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2168 &&
	  stage1_rg_full &&
	  (!stage1_rg_stage_input_11_BITS_335_TO_334_12_EQ_ETC___d313 ||
	   NOT_IF_stage2_rg_full_11_THEN_IF_stage2_rg_sta_ETC___d2086) &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 == 4'd0 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    rl_pipe: Discarding stage1 due to redirection");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2261)
	$write("    CPU_Stage2.enq (Data_Stage1_to_Stage2) ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2261)
	$write("data_to_Stage 2 {pc:%h  instr:%h  priv:%0d\n",
	       stage1_rg_stage_input[401:338],
	       stage1_rg_stage_input[263:232],
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2261)
	$write("            op_stage2:");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2175 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 != 4'd0 &&
	  IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d2178 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 == 3'd0)
	$write("OP_Stage2_ALU");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2175 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 != 4'd0 &&
	  IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d2178 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 == 3'd1)
	$write("OP_Stage2_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2175 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 != 4'd0 &&
	  IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d2178 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 == 3'd2)
	$write("OP_Stage2_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2175 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 != 4'd0 &&
	  IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d2178 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 == 3'd3)
	$write("OP_Stage2_M");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2175 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 != 4'd0 &&
	  IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d2178 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 == 3'd4)
	$write("OP_Stage2_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2175 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d998 != 4'd0 &&
	  IF_NOT_stage1_rg_full_10_21_OR_NOT_stage1_rg_s_ETC___d2178 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 !=
	  3'd0 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 !=
	  3'd1 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 !=
	  3'd2 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 !=
	  3'd3 &&
	  IF_stage1_rg_stage_input_11_BITS_335_TO_334_12_ETC___d1147 != 3'd4)
	$write("OP_Stage2_FD");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2261)
	$write("  rd:%0d\n", x_out_data_to_stage2_rd__h8767);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2261)
	$write("            addr:%h  val1:%h  val2:%h}",
	       x_out_data_to_stage2_addr__h8768,
	       x_out_data_to_stage2_val1__h8769,
	       x_out_data_to_stage2_val2__h8770);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2261)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2261)
	$write("            fval1:%h  fval2:%h  fval3:%h}",
	       x_out_data_to_stage2_fval1__h8771,
	       alu_outputs___1_fval2__h9280,
	       x_out_data_to_stage2_fval3__h8773);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  NOT_csr_regfile_interrupt_pending_rg_cur_priv__ETC___d2261)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2291 &&
	  stageD_rg_full &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    CPU_Stage1.enq: 0x%08h", stageD_rg_data[233:170]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2332 &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("    CPU_StageD.enq (Data_StageF_to_StageD)");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2332 &&
	  csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2349)
	$write("    %m.enq:  pc:0x%0h  epoch:%0d  priv:%0d",
	       stageF_branch_predictor$predict_rsp,
	       stageF_rg_epoch,
	       rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2332 &&
	  csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2349)
	$write("  sstatus_SUM:%0d  mstatus_MXR:%0d  satp:0x%0h",
	       csr_regfile$read_sstatus[18],
	       csr_regfile$read_mstatus[19],
	       csr_regfile$read_satp);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pipe &&
	  IF_NOT_csr_regfile_interrupt_pending_rg_cur_pr_ETC___d2332 &&
	  csr_regfile_interrupt_pending_rg_cur_priv_5_07_ETC___d2349)
	$display("");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_SFENCE_VMA &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage1_SFENCE_VMA", csr_regfile$read_csr_mcycle);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_SFENCE_VMA && cur_verbosity__h3508 == 4'd1)
	$display("instret:%0d  PC:0x%0h  instr:0x%0h  priv:%0d",
		 csr_regfile$read_csr_minstret,
		 stage1_rg_stage_input[401:338],
		 stage1_rg_stage_input[263:232],
		 rg_cur_priv);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_stage1_SFENCE_VMA &&
	  NOT_IF_csr_regfile_read_csr_minstret__7_ULT_cf_ETC___d53)
	$display("%0d: %m.rl_stage1_SFENCE_VMA", csr_regfile$read_csr_mcycle);
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