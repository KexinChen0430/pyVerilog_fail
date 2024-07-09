module outputs
  wire [511 : 0] dma_server_rdata;
  wire [63 : 0] dmem_st_amo_val,
		dmem_word64,
		imem_master_araddr,
		imem_master_awaddr,
		imem_master_wdata,
		imem_pc,
		imem_tval,
		mem_master_araddr,
		mem_master_awaddr,
		mem_master_wdata,
		mv_tohost_value;
  wire [31 : 0] imem_instr;
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
  wire [3 : 0] dmem_exc_code,
	       imem_exc_code,
	       imem_master_arcache,
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
  wire RDY_ma_ddr4_ready,
       RDY_mv_tohost_value,
       RDY_server_fence_i_request_put,
       RDY_server_fence_i_response_get,
       RDY_server_fence_request_put,
       RDY_server_fence_response_get,
       RDY_server_reset_request_put,
       RDY_server_reset_response_get,
       RDY_set_watch_tohost,
       RDY_sfence_vma_server_request_put,
       RDY_sfence_vma_server_response_get,
       dma_server_arready,
       dma_server_awready,
       dma_server_bvalid,
       dma_server_rlast,
       dma_server_rvalid,
       dma_server_wready,
       dmem_exc,
       dmem_valid,
       imem_exc,
       imem_is_i32_not_i16,
       imem_master_arlock,
       imem_master_arvalid,
       imem_master_awlock,
       imem_master_awvalid,
       imem_master_bready,
       imem_master_rready,
       imem_master_wlast,
       imem_master_wvalid,
       imem_valid,
       mem_master_arlock,
       mem_master_arvalid,
       mem_master_awlock,
       mem_master_awvalid,
       mem_master_bready,
       mem_master_rready,
       mem_master_wlast,
       mem_master_wvalid;
  // inlined wires
  wire [581 : 0] enqDst_1_0_lat_0$wget;
  wire [580 : 0] propDstData_1_0_lat_0$wget,
		 propDstData_1_1_lat_0$wget,
		 propDstData_1_2_lat_0$wget;
  wire [74 : 0] enqDst_0_lat_0$wget;
  wire [73 : 0] propDstData_0_lat_0$wget,
		propDstData_1_lat_0$wget,
		propDstData_2_lat_0$wget;
  wire [3 : 0] llc_axi4_adapter_ctr_wr_rsps_pending_crg$port0__write_1,
	       llc_axi4_adapter_ctr_wr_rsps_pending_crg$port1__write_1,
	       llc_axi4_adapter_ctr_wr_rsps_pending_crg$port2__read;
  wire llc_axi4_adapter_master_xactor_crg_rd_addr_full$EN_port1__write,
       llc_axi4_adapter_master_xactor_crg_rd_addr_full$port2__read,
       llc_axi4_adapter_master_xactor_crg_rd_addr_full$port3__read,
       llc_axi4_adapter_master_xactor_crg_rd_data_full$EN_port2__write,
       llc_axi4_adapter_master_xactor_crg_rd_data_full$port2__read,
       llc_axi4_adapter_master_xactor_crg_rd_data_full$port3__read,
       llc_axi4_adapter_master_xactor_crg_wr_addr_full$EN_port1__write,
       llc_axi4_adapter_master_xactor_crg_wr_addr_full$port2__read,
       llc_axi4_adapter_master_xactor_crg_wr_addr_full$port3__read,
       llc_axi4_adapter_master_xactor_crg_wr_data_full$EN_port1__write,
       llc_axi4_adapter_master_xactor_crg_wr_data_full$port2__read,
       llc_axi4_adapter_master_xactor_crg_wr_data_full$port3__read,
       llc_axi4_adapter_master_xactor_crg_wr_resp_full$EN_port2__write,
       llc_axi4_adapter_master_xactor_crg_wr_resp_full$port2__read,
       llc_axi4_adapter_master_xactor_crg_wr_resp_full$port3__read,
       propDstIdx_0_lat_1$whas,
       propDstIdx_1_0_lat_1$whas,
       propDstIdx_1_1_lat_1$whas,
       propDstIdx_1_2_lat_1$whas,
       propDstIdx_1_lat_1$whas,
       propDstIdx_2_lat_1$whas;
  // register cfg_verbosity
  reg [3 : 0] cfg_verbosity;
  wire [3 : 0] cfg_verbosity$D_IN;
  wire cfg_verbosity$EN;
  // register enqDst_0_rl
  reg [74 : 0] enqDst_0_rl;
  wire [74 : 0] enqDst_0_rl$D_IN;
  wire enqDst_0_rl$EN;
  // register enqDst_1_0_rl
  reg [581 : 0] enqDst_1_0_rl;
  wire [581 : 0] enqDst_1_0_rl$D_IN;
  wire enqDst_1_0_rl$EN;
  // register llc_axi4_adapter_ctr_wr_rsps_pending_crg
  reg [3 : 0] llc_axi4_adapter_ctr_wr_rsps_pending_crg;
  wire [3 : 0] llc_axi4_adapter_ctr_wr_rsps_pending_crg$D_IN;
  wire llc_axi4_adapter_ctr_wr_rsps_pending_crg$EN;
  // register llc_axi4_adapter_master_xactor_crg_rd_addr_full
  reg llc_axi4_adapter_master_xactor_crg_rd_addr_full;
  wire llc_axi4_adapter_master_xactor_crg_rd_addr_full$D_IN,
       llc_axi4_adapter_master_xactor_crg_rd_addr_full$EN;
  // register llc_axi4_adapter_master_xactor_crg_rd_data_full
  reg llc_axi4_adapter_master_xactor_crg_rd_data_full;
  wire llc_axi4_adapter_master_xactor_crg_rd_data_full$D_IN,
       llc_axi4_adapter_master_xactor_crg_rd_data_full$EN;
  // register llc_axi4_adapter_master_xactor_crg_wr_addr_full
  reg llc_axi4_adapter_master_xactor_crg_wr_addr_full;
  wire llc_axi4_adapter_master_xactor_crg_wr_addr_full$D_IN,
       llc_axi4_adapter_master_xactor_crg_wr_addr_full$EN;
  // register llc_axi4_adapter_master_xactor_crg_wr_data_full
  reg llc_axi4_adapter_master_xactor_crg_wr_data_full;
  wire llc_axi4_adapter_master_xactor_crg_wr_data_full$D_IN,
       llc_axi4_adapter_master_xactor_crg_wr_data_full$EN;
  // register llc_axi4_adapter_master_xactor_crg_wr_resp_full
  reg llc_axi4_adapter_master_xactor_crg_wr_resp_full;
  wire llc_axi4_adapter_master_xactor_crg_wr_resp_full$D_IN,
       llc_axi4_adapter_master_xactor_crg_wr_resp_full$EN;
  // register llc_axi4_adapter_master_xactor_rg_rd_addr
  reg [108 : 0] llc_axi4_adapter_master_xactor_rg_rd_addr;
  wire [108 : 0] llc_axi4_adapter_master_xactor_rg_rd_addr$D_IN;
  wire llc_axi4_adapter_master_xactor_rg_rd_addr$EN;
  // register llc_axi4_adapter_master_xactor_rg_rd_data
  reg [82 : 0] llc_axi4_adapter_master_xactor_rg_rd_data;
  wire [82 : 0] llc_axi4_adapter_master_xactor_rg_rd_data$D_IN;
  wire llc_axi4_adapter_master_xactor_rg_rd_data$EN;
  // register llc_axi4_adapter_master_xactor_rg_wr_addr
  reg [108 : 0] llc_axi4_adapter_master_xactor_rg_wr_addr;
  wire [108 : 0] llc_axi4_adapter_master_xactor_rg_wr_addr$D_IN;
  wire llc_axi4_adapter_master_xactor_rg_wr_addr$EN;
  // register llc_axi4_adapter_master_xactor_rg_wr_data
  reg [72 : 0] llc_axi4_adapter_master_xactor_rg_wr_data;
  wire [72 : 0] llc_axi4_adapter_master_xactor_rg_wr_data$D_IN;
  wire llc_axi4_adapter_master_xactor_rg_wr_data$EN;
  // register llc_axi4_adapter_master_xactor_rg_wr_resp
  reg [17 : 0] llc_axi4_adapter_master_xactor_rg_wr_resp;
  wire [17 : 0] llc_axi4_adapter_master_xactor_rg_wr_resp$D_IN;
  wire llc_axi4_adapter_master_xactor_rg_wr_resp$EN;
  // register llc_axi4_adapter_rg_AXI4_error
  reg llc_axi4_adapter_rg_AXI4_error;
  wire llc_axi4_adapter_rg_AXI4_error$D_IN, llc_axi4_adapter_rg_AXI4_error$EN;
  // register llc_axi4_adapter_rg_cline
  reg [511 : 0] llc_axi4_adapter_rg_cline;
  wire [511 : 0] llc_axi4_adapter_rg_cline$D_IN;
  wire llc_axi4_adapter_rg_cline$EN;
  // register llc_axi4_adapter_rg_ddr4_ready
  reg llc_axi4_adapter_rg_ddr4_ready;
  wire llc_axi4_adapter_rg_ddr4_ready$D_IN, llc_axi4_adapter_rg_ddr4_ready$EN;
  // register llc_axi4_adapter_rg_rd_req_beat
  reg [2 : 0] llc_axi4_adapter_rg_rd_req_beat;
  wire [2 : 0] llc_axi4_adapter_rg_rd_req_beat$D_IN;
  wire llc_axi4_adapter_rg_rd_req_beat$EN;
  // register llc_axi4_adapter_rg_rd_rsp_beat
  reg [2 : 0] llc_axi4_adapter_rg_rd_rsp_beat;
  wire [2 : 0] llc_axi4_adapter_rg_rd_rsp_beat$D_IN;
  wire llc_axi4_adapter_rg_rd_rsp_beat$EN;
  // register llc_axi4_adapter_rg_wr_req_beat
  reg [2 : 0] llc_axi4_adapter_rg_wr_req_beat;
  wire [2 : 0] llc_axi4_adapter_rg_wr_req_beat$D_IN;
  wire llc_axi4_adapter_rg_wr_req_beat$EN;
  // register llc_axi4_adapter_rg_wr_rsp_beat
  reg [2 : 0] llc_axi4_adapter_rg_wr_rsp_beat;
  wire [2 : 0] llc_axi4_adapter_rg_wr_rsp_beat$D_IN;
  wire llc_axi4_adapter_rg_wr_rsp_beat$EN;
  // register propDstData_0_rl
  reg [73 : 0] propDstData_0_rl;
  wire [73 : 0] propDstData_0_rl$D_IN;
  wire propDstData_0_rl$EN;
  // register propDstData_1_0_rl
  reg [580 : 0] propDstData_1_0_rl;
  wire [580 : 0] propDstData_1_0_rl$D_IN;
  wire propDstData_1_0_rl$EN;
  // register propDstData_1_1_rl
  reg [580 : 0] propDstData_1_1_rl;
  wire [580 : 0] propDstData_1_1_rl$D_IN;
  wire propDstData_1_1_rl$EN;
  // register propDstData_1_2_rl
  reg [580 : 0] propDstData_1_2_rl;
  wire [580 : 0] propDstData_1_2_rl$D_IN;
  wire propDstData_1_2_rl$EN;
  // register propDstData_1_rl
  reg [73 : 0] propDstData_1_rl;
  wire [73 : 0] propDstData_1_rl$D_IN;
  wire propDstData_1_rl$EN;
  // register propDstData_2_rl
  reg [73 : 0] propDstData_2_rl;
  wire [73 : 0] propDstData_2_rl$D_IN;
  wire propDstData_2_rl$EN;
  // register propDstIdx_0_rl
  reg propDstIdx_0_rl;
  wire propDstIdx_0_rl$D_IN, propDstIdx_0_rl$EN;
  // register propDstIdx_1_0_rl
  reg propDstIdx_1_0_rl;
  wire propDstIdx_1_0_rl$D_IN, propDstIdx_1_0_rl$EN;
  // register propDstIdx_1_1_rl
  reg propDstIdx_1_1_rl;
  wire propDstIdx_1_1_rl$D_IN, propDstIdx_1_1_rl$EN;
  // register propDstIdx_1_2_rl
  reg propDstIdx_1_2_rl;
  wire propDstIdx_1_2_rl$D_IN, propDstIdx_1_2_rl$EN;
  // register propDstIdx_1_rl
  reg propDstIdx_1_rl;
  wire propDstIdx_1_rl$D_IN, propDstIdx_1_rl$EN;
  // register propDstIdx_2_rl
  reg propDstIdx_2_rl;
  wire propDstIdx_2_rl$D_IN, propDstIdx_2_rl$EN;
  // register rg_state
  reg [1 : 0] rg_state;
  reg [1 : 0] rg_state$D_IN;
  wire rg_state$EN;
  // register srcRR_0
  reg [1 : 0] srcRR_0;
  wire [1 : 0] srcRR_0$D_IN;
  wire srcRR_0$EN;
  // register srcRR_1_0
  reg [1 : 0] srcRR_1_0;
  wire [1 : 0] srcRR_1_0$D_IN;
  wire srcRR_1_0$EN;
  // ports of submodule d_mmu_cache
  wire [578 : 0] d_mmu_cache$l1_to_l2_client_response_enq_x,
		 d_mmu_cache$l2_to_l1_server_response_first;
  wire [131 : 0] d_mmu_cache$imem_ptw_server_response_get;
  wire [130 : 0] d_mmu_cache$mmio_client_request_get;
  wire [127 : 0] d_mmu_cache$imem_pte_writeback_p_put,
		 d_mmu_cache$imem_ptw_server_request_put;
  wire [68 : 0] d_mmu_cache$l1_to_l2_client_request_first;
  wire [65 : 0] d_mmu_cache$l2_to_l1_server_request_enq_x;
  wire [64 : 0] d_mmu_cache$mmio_client_response_put;
  wire [63 : 0] d_mmu_cache$ma_req_satp,
		d_mmu_cache$ma_req_st_value,
		d_mmu_cache$ma_req_va,
		d_mmu_cache$mv_tohost_value,
		d_mmu_cache$set_watch_tohost_tohost_addr,
		d_mmu_cache$st_amo_val,
		d_mmu_cache$word64;
  wire [6 : 0] d_mmu_cache$ma_req_amo_funct7;
  wire [3 : 0] d_mmu_cache$exc_code;
  wire [2 : 0] d_mmu_cache$ma_req_f3;
  wire [1 : 0] d_mmu_cache$ma_req_op, d_mmu_cache$ma_req_priv;
  wire d_mmu_cache$EN_flush_server_request_put,
       d_mmu_cache$EN_flush_server_response_get,
       d_mmu_cache$EN_imem_pte_writeback_p_put,
       d_mmu_cache$EN_imem_ptw_server_request_put,
       d_mmu_cache$EN_imem_ptw_server_response_get,
       d_mmu_cache$EN_l1_to_l2_client_request_deq,
       d_mmu_cache$EN_l1_to_l2_client_response_enq,
       d_mmu_cache$EN_l2_to_l1_server_request_enq,
       d_mmu_cache$EN_l2_to_l1_server_response_deq,
       d_mmu_cache$EN_ma_req,
       d_mmu_cache$EN_mmio_client_request_get,
       d_mmu_cache$EN_mmio_client_response_put,
       d_mmu_cache$EN_set_watch_tohost,
       d_mmu_cache$EN_tlb_flush,
       d_mmu_cache$RDY_imem_pte_writeback_p_put,
       d_mmu_cache$RDY_imem_ptw_server_request_put,
       d_mmu_cache$RDY_imem_ptw_server_response_get,
       d_mmu_cache$RDY_l1_to_l2_client_request_deq,
       d_mmu_cache$RDY_l1_to_l2_client_request_first,
       d_mmu_cache$RDY_l1_to_l2_client_response_enq,
       d_mmu_cache$RDY_l2_to_l1_server_request_enq,
       d_mmu_cache$RDY_l2_to_l1_server_response_deq,
       d_mmu_cache$RDY_l2_to_l1_server_response_first,
       d_mmu_cache$RDY_mmio_client_request_get,
       d_mmu_cache$RDY_mmio_client_response_put,
       d_mmu_cache$exc,
       d_mmu_cache$flush_server_request_put,
       d_mmu_cache$ma_req_mstatus_MXR,
       d_mmu_cache$ma_req_sstatus_SUM,
       d_mmu_cache$set_watch_tohost_watch_tohost,
       d_mmu_cache$valid;
  // ports of submodule dma_cache
  wire [578 : 0] dma_cache$l1_to_l2_client_response_enq_x,
		 dma_cache$l2_to_l1_server_response_first;
  wire [511 : 0] dma_cache$axi4_s_rdata, dma_cache$axi4_s_wdata;
  wire [130 : 0] dma_cache$mmio_client_request_get;
  wire [68 : 0] dma_cache$l1_to_l2_client_request_first;
  wire [65 : 0] dma_cache$l2_to_l1_server_request_enq_x;
  wire [64 : 0] dma_cache$mmio_client_response_put;
  wire [63 : 0] dma_cache$axi4_s_araddr,
		dma_cache$axi4_s_awaddr,
		dma_cache$axi4_s_wstrb;
  wire [15 : 0] dma_cache$axi4_s_arid,
		dma_cache$axi4_s_awid,
		dma_cache$axi4_s_bid,
		dma_cache$axi4_s_rid;
  wire [7 : 0] dma_cache$axi4_s_arlen, dma_cache$axi4_s_awlen;
  wire [3 : 0] dma_cache$axi4_s_arcache,
	       dma_cache$axi4_s_arqos,
	       dma_cache$axi4_s_arregion,
	       dma_cache$axi4_s_awcache,
	       dma_cache$axi4_s_awqos,
	       dma_cache$axi4_s_awregion;
  wire [2 : 0] dma_cache$axi4_s_arprot,
	       dma_cache$axi4_s_arsize,
	       dma_cache$axi4_s_awprot,
	       dma_cache$axi4_s_awsize;
  wire [1 : 0] dma_cache$axi4_s_arburst,
	       dma_cache$axi4_s_awburst,
	       dma_cache$axi4_s_bresp,
	       dma_cache$axi4_s_rresp;
  wire dma_cache$EN_l1_to_l2_client_request_deq,
       dma_cache$EN_l1_to_l2_client_response_enq,
       dma_cache$EN_l2_to_l1_server_request_enq,
       dma_cache$EN_l2_to_l1_server_response_deq,
       dma_cache$EN_mmio_client_request_get,
       dma_cache$EN_mmio_client_response_put,
       dma_cache$RDY_l1_to_l2_client_request_deq,
       dma_cache$RDY_l1_to_l2_client_request_first,
       dma_cache$RDY_l1_to_l2_client_response_enq,
       dma_cache$RDY_l2_to_l1_server_request_enq,
       dma_cache$RDY_l2_to_l1_server_response_deq,
       dma_cache$RDY_l2_to_l1_server_response_first,
       dma_cache$RDY_mmio_client_request_get,
       dma_cache$RDY_mmio_client_response_put,
       dma_cache$axi4_s_arlock,
       dma_cache$axi4_s_arready,
       dma_cache$axi4_s_arvalid,
       dma_cache$axi4_s_awlock,
       dma_cache$axi4_s_awready,
       dma_cache$axi4_s_awvalid,
       dma_cache$axi4_s_bready,
       dma_cache$axi4_s_bvalid,
       dma_cache$axi4_s_rlast,
       dma_cache$axi4_s_rready,
       dma_cache$axi4_s_rvalid,
       dma_cache$axi4_s_wlast,
       dma_cache$axi4_s_wready,
       dma_cache$axi4_s_wvalid;
  // ports of submodule enqDst_0_dummy2_0
  wire enqDst_0_dummy2_0$D_IN, enqDst_0_dummy2_0$EN, enqDst_0_dummy2_0$Q_OUT;
  // ports of submodule enqDst_0_dummy2_1
  wire enqDst_0_dummy2_1$D_IN, enqDst_0_dummy2_1$EN, enqDst_0_dummy2_1$Q_OUT;
  // ports of submodule enqDst_1_0_dummy2_0
  wire enqDst_1_0_dummy2_0$D_IN,
       enqDst_1_0_dummy2_0$EN,
       enqDst_1_0_dummy2_0$Q_OUT;
  // ports of submodule enqDst_1_0_dummy2_1
  wire enqDst_1_0_dummy2_1$D_IN,
       enqDst_1_0_dummy2_1$EN,
       enqDst_1_0_dummy2_1$Q_OUT;
  // ports of submodule f_reset_rsps
  wire f_reset_rsps$CLR,
       f_reset_rsps$DEQ,
       f_reset_rsps$EMPTY_N,
       f_reset_rsps$ENQ,
       f_reset_rsps$FULL_N;
  // ports of submodule i_mmu_cache
  wire [578 : 0] i_mmu_cache$l1_to_l2_client_response_enq_x,
		 i_mmu_cache$l2_to_l1_server_response_first;
  wire [131 : 0] i_mmu_cache$ptw_client_response_put;
  wire [130 : 0] i_mmu_cache$mmio_client_request_get;
  wire [127 : 0] i_mmu_cache$pte_writeback_g_get,
		 i_mmu_cache$ptw_client_request_get;
  wire [68 : 0] i_mmu_cache$l1_to_l2_client_request_first;
  wire [65 : 0] i_mmu_cache$l2_to_l1_server_request_enq_x;
  wire [64 : 0] i_mmu_cache$mmio_client_response_put;
  wire [63 : 0] i_mmu_cache$addr,
		i_mmu_cache$ma_req_satp,
		i_mmu_cache$ma_req_va,
		i_mmu_cache$word64;
  wire [3 : 0] i_mmu_cache$exc_code;
  wire [1 : 0] i_mmu_cache$ma_req_priv;
  wire i_mmu_cache$EN_flush_server_request_put,
       i_mmu_cache$EN_flush_server_response_get,
       i_mmu_cache$EN_l1_to_l2_client_request_deq,
       i_mmu_cache$EN_l1_to_l2_client_response_enq,
       i_mmu_cache$EN_l2_to_l1_server_request_enq,
       i_mmu_cache$EN_l2_to_l1_server_response_deq,
       i_mmu_cache$EN_ma_req,
       i_mmu_cache$EN_mmio_client_request_get,
       i_mmu_cache$EN_mmio_client_response_put,
       i_mmu_cache$EN_pte_writeback_g_get,
       i_mmu_cache$EN_ptw_client_request_get,
       i_mmu_cache$EN_ptw_client_response_put,
       i_mmu_cache$EN_tlb_flush,
       i_mmu_cache$RDY_l1_to_l2_client_request_deq,
       i_mmu_cache$RDY_l1_to_l2_client_request_first,
       i_mmu_cache$RDY_l1_to_l2_client_response_enq,
       i_mmu_cache$RDY_l2_to_l1_server_request_enq,
       i_mmu_cache$RDY_l2_to_l1_server_response_deq,
       i_mmu_cache$RDY_l2_to_l1_server_response_first,
       i_mmu_cache$RDY_mmio_client_request_get,
       i_mmu_cache$RDY_mmio_client_response_put,
       i_mmu_cache$RDY_pte_writeback_g_get,
       i_mmu_cache$RDY_ptw_client_request_get,
       i_mmu_cache$RDY_ptw_client_response_put,
       i_mmu_cache$exc,
       i_mmu_cache$flush_server_request_put,
       i_mmu_cache$ma_req_mstatus_MXR,
       i_mmu_cache$ma_req_sstatus_SUM,
       i_mmu_cache$valid;
  // ports of submodule llc
  wire [655 : 0] llc$dma_memReq_enq_x;
  wire [640 : 0] llc$to_mem_toM_first;
  wire [584 : 0] llc$to_child_toC_first;
  wire [580 : 0] llc$to_child_rsFromC_enq_x;
  wire [516 : 0] llc$to_mem_rsFromM_enq_x;
  wire [73 : 0] llc$to_child_rqFromC_enq_x;
  wire [3 : 0] llc$perf_req_r;
  wire llc$EN_cRqStuck_get,
       llc$EN_dma_memReq_enq,
       llc$EN_dma_respLd_deq,
       llc$EN_dma_respSt_deq,
       llc$EN_perf_req,
       llc$EN_perf_resp,
       llc$EN_perf_setStatus,
       llc$EN_to_child_rqFromC_enq,
       llc$EN_to_child_rsFromC_enq,
       llc$EN_to_child_toC_deq,
       llc$EN_to_mem_rsFromM_enq,
       llc$EN_to_mem_toM_deq,
       llc$RDY_dma_respLd_deq,
       llc$RDY_dma_respSt_deq,
       llc$RDY_to_child_rqFromC_enq,
       llc$RDY_to_child_rsFromC_enq,
       llc$RDY_to_child_toC_deq,
       llc$RDY_to_child_toC_first,
       llc$RDY_to_mem_rsFromM_enq,
       llc$RDY_to_mem_toM_deq,
       llc$RDY_to_mem_toM_first,
       llc$perf_setStatus_doStats;
  // ports of submodule llc_axi4_adapter_f_pending_reads
  wire [68 : 0] llc_axi4_adapter_f_pending_reads$D_IN,
		llc_axi4_adapter_f_pending_reads$D_OUT;
  wire llc_axi4_adapter_f_pending_reads$CLR,
       llc_axi4_adapter_f_pending_reads$DEQ,
       llc_axi4_adapter_f_pending_reads$EMPTY_N,
       llc_axi4_adapter_f_pending_reads$ENQ,
       llc_axi4_adapter_f_pending_reads$FULL_N;
  // ports of submodule llc_axi4_adapter_f_pending_writes
  wire [639 : 0] llc_axi4_adapter_f_pending_writes$D_IN;
  wire llc_axi4_adapter_f_pending_writes$CLR,
       llc_axi4_adapter_f_pending_writes$DEQ,
       llc_axi4_adapter_f_pending_writes$EMPTY_N,
       llc_axi4_adapter_f_pending_writes$ENQ,
       llc_axi4_adapter_f_pending_writes$FULL_N;
  // ports of submodule mmio_axi4_adapter
  wire [130 : 0] mmio_axi4_adapter$v_mmio_server_0_request_put,
		 mmio_axi4_adapter$v_mmio_server_1_request_put,
		 mmio_axi4_adapter$v_mmio_server_2_request_put;
  wire [64 : 0] mmio_axi4_adapter$v_mmio_server_0_response_get,
		mmio_axi4_adapter$v_mmio_server_1_response_get,
		mmio_axi4_adapter$v_mmio_server_2_response_get;
  wire [63 : 0] mmio_axi4_adapter$mem_master_araddr,
		mmio_axi4_adapter$mem_master_awaddr,
		mmio_axi4_adapter$mem_master_rdata,
		mmio_axi4_adapter$mem_master_wdata;
  wire [15 : 0] mmio_axi4_adapter$mem_master_arid,
		mmio_axi4_adapter$mem_master_awid,
		mmio_axi4_adapter$mem_master_bid,
		mmio_axi4_adapter$mem_master_rid;
  wire [7 : 0] mmio_axi4_adapter$mem_master_arlen,
	       mmio_axi4_adapter$mem_master_awlen,
	       mmio_axi4_adapter$mem_master_wstrb;
  wire [3 : 0] mmio_axi4_adapter$mem_master_arcache,
	       mmio_axi4_adapter$mem_master_arqos,
	       mmio_axi4_adapter$mem_master_arregion,
	       mmio_axi4_adapter$mem_master_awcache,
	       mmio_axi4_adapter$mem_master_awqos,
	       mmio_axi4_adapter$mem_master_awregion;
  wire [2 : 0] mmio_axi4_adapter$mem_master_arprot,
	       mmio_axi4_adapter$mem_master_arsize,
	       mmio_axi4_adapter$mem_master_awprot,
	       mmio_axi4_adapter$mem_master_awsize;
  wire [1 : 0] mmio_axi4_adapter$mem_master_arburst,
	       mmio_axi4_adapter$mem_master_awburst,
	       mmio_axi4_adapter$mem_master_bresp,
	       mmio_axi4_adapter$mem_master_rresp;
  wire mmio_axi4_adapter$EN_v_mmio_server_0_request_put,
       mmio_axi4_adapter$EN_v_mmio_server_0_response_get,
       mmio_axi4_adapter$EN_v_mmio_server_1_request_put,
       mmio_axi4_adapter$EN_v_mmio_server_1_response_get,
       mmio_axi4_adapter$EN_v_mmio_server_2_request_put,
       mmio_axi4_adapter$EN_v_mmio_server_2_response_get,
       mmio_axi4_adapter$RDY_v_mmio_server_0_request_put,
       mmio_axi4_adapter$RDY_v_mmio_server_0_response_get,
       mmio_axi4_adapter$RDY_v_mmio_server_1_request_put,
       mmio_axi4_adapter$RDY_v_mmio_server_1_response_get,
       mmio_axi4_adapter$RDY_v_mmio_server_2_request_put,
       mmio_axi4_adapter$RDY_v_mmio_server_2_response_get,
       mmio_axi4_adapter$mem_master_arlock,
       mmio_axi4_adapter$mem_master_arready,
       mmio_axi4_adapter$mem_master_arvalid,
       mmio_axi4_adapter$mem_master_awlock,
       mmio_axi4_adapter$mem_master_awready,
       mmio_axi4_adapter$mem_master_awvalid,
       mmio_axi4_adapter$mem_master_bready,
       mmio_axi4_adapter$mem_master_bvalid,
       mmio_axi4_adapter$mem_master_rlast,
       mmio_axi4_adapter$mem_master_rready,
       mmio_axi4_adapter$mem_master_rvalid,
       mmio_axi4_adapter$mem_master_wlast,
       mmio_axi4_adapter$mem_master_wready,
       mmio_axi4_adapter$mem_master_wvalid;
  // ports of submodule propDstData_0_dummy2_0
  wire propDstData_0_dummy2_0$D_IN, propDstData_0_dummy2_0$EN;
  // ports of submodule propDstData_0_dummy2_1
  wire propDstData_0_dummy2_1$D_IN,
       propDstData_0_dummy2_1$EN,
       propDstData_0_dummy2_1$Q_OUT;
  // ports of submodule propDstData_1_0_dummy2_0
  wire propDstData_1_0_dummy2_0$D_IN, propDstData_1_0_dummy2_0$EN;
  // ports of submodule propDstData_1_0_dummy2_1
  wire propDstData_1_0_dummy2_1$D_IN,
       propDstData_1_0_dummy2_1$EN,
       propDstData_1_0_dummy2_1$Q_OUT;
  // ports of submodule propDstData_1_1_dummy2_0
  wire propDstData_1_1_dummy2_0$D_IN, propDstData_1_1_dummy2_0$EN;
  // ports of submodule propDstData_1_1_dummy2_1
  wire propDstData_1_1_dummy2_1$D_IN,
       propDstData_1_1_dummy2_1$EN,
       propDstData_1_1_dummy2_1$Q_OUT;
  // ports of submodule propDstData_1_2_dummy2_0
  wire propDstData_1_2_dummy2_0$D_IN, propDstData_1_2_dummy2_0$EN;
  // ports of submodule propDstData_1_2_dummy2_1
  wire propDstData_1_2_dummy2_1$D_IN,
       propDstData_1_2_dummy2_1$EN,
       propDstData_1_2_dummy2_1$Q_OUT;
  // ports of submodule propDstData_1_dummy2_0
  wire propDstData_1_dummy2_0$D_IN, propDstData_1_dummy2_0$EN;
  // ports of submodule propDstData_1_dummy2_1
  wire propDstData_1_dummy2_1$D_IN,
       propDstData_1_dummy2_1$EN,
       propDstData_1_dummy2_1$Q_OUT;
  // ports of submodule propDstData_2_dummy2_0
  wire propDstData_2_dummy2_0$D_IN, propDstData_2_dummy2_0$EN;
  // ports of submodule propDstData_2_dummy2_1
  wire propDstData_2_dummy2_1$D_IN,
       propDstData_2_dummy2_1$EN,
       propDstData_2_dummy2_1$Q_OUT;
  // ports of submodule propDstIdx_0_dummy2_0
  wire propDstIdx_0_dummy2_0$D_IN,
       propDstIdx_0_dummy2_0$EN,
       propDstIdx_0_dummy2_0$Q_OUT;
  // ports of submodule propDstIdx_0_dummy2_1
  wire propDstIdx_0_dummy2_1$D_IN,
       propDstIdx_0_dummy2_1$EN,
       propDstIdx_0_dummy2_1$Q_OUT;
  // ports of submodule propDstIdx_1_0_dummy2_0
  wire propDstIdx_1_0_dummy2_0$D_IN,
       propDstIdx_1_0_dummy2_0$EN,
       propDstIdx_1_0_dummy2_0$Q_OUT;
  // ports of submodule propDstIdx_1_0_dummy2_1
  wire propDstIdx_1_0_dummy2_1$D_IN,
       propDstIdx_1_0_dummy2_1$EN,
       propDstIdx_1_0_dummy2_1$Q_OUT;
  // ports of submodule propDstIdx_1_1_dummy2_0
  wire propDstIdx_1_1_dummy2_0$D_IN,
       propDstIdx_1_1_dummy2_0$EN,
       propDstIdx_1_1_dummy2_0$Q_OUT;
  // ports of submodule propDstIdx_1_1_dummy2_1
  wire propDstIdx_1_1_dummy2_1$D_IN,
       propDstIdx_1_1_dummy2_1$EN,
       propDstIdx_1_1_dummy2_1$Q_OUT;
  // ports of submodule propDstIdx_1_2_dummy2_0
  wire propDstIdx_1_2_dummy2_0$D_IN,
       propDstIdx_1_2_dummy2_0$EN,
       propDstIdx_1_2_dummy2_0$Q_OUT;
  // ports of submodule propDstIdx_1_2_dummy2_1
  wire propDstIdx_1_2_dummy2_1$D_IN,
       propDstIdx_1_2_dummy2_1$EN,
       propDstIdx_1_2_dummy2_1$Q_OUT;
  // ports of submodule propDstIdx_1_dummy2_0
  wire propDstIdx_1_dummy2_0$D_IN,
       propDstIdx_1_dummy2_0$EN,
       propDstIdx_1_dummy2_0$Q_OUT;
  // ports of submodule propDstIdx_1_dummy2_1
  wire propDstIdx_1_dummy2_1$D_IN,
       propDstIdx_1_dummy2_1$EN,
       propDstIdx_1_dummy2_1$Q_OUT;
  // ports of submodule propDstIdx_2_dummy2_0
  wire propDstIdx_2_dummy2_0$D_IN,
       propDstIdx_2_dummy2_0$EN,
       propDstIdx_2_dummy2_0$Q_OUT;
  // ports of submodule propDstIdx_2_dummy2_1
  wire propDstIdx_2_dummy2_1$D_IN,
       propDstIdx_2_dummy2_1$EN,
       propDstIdx_2_dummy2_1$Q_OUT;
  // rule scheduling signals
  wire CAN_FIRE_RL_ClientServerRequest,
       CAN_FIRE_RL_ClientServerRequest_1,
       CAN_FIRE_RL_ClientServerRequest_2,
       CAN_FIRE_RL_ClientServerRequest_3,
       CAN_FIRE_RL_ClientServerResponse,
       CAN_FIRE_RL_ClientServerResponse_1,
       CAN_FIRE_RL_ClientServerResponse_2,
       CAN_FIRE_RL_ClientServerResponse_3,
       CAN_FIRE_RL_doEnq,
       CAN_FIRE_RL_doEnq_1,
       CAN_FIRE_RL_dstSelectSrc,
       CAN_FIRE_RL_dstSelectSrc_1,
       CAN_FIRE_RL_enqDst_0_canon,
       CAN_FIRE_RL_enqDst_1_0_canon,
       CAN_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp,
       CAN_FIRE_RL_llc_axi4_adapter_rl_handle_read_req,
       CAN_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps,
       CAN_FIRE_RL_llc_axi4_adapter_rl_handle_write_req,
       CAN_FIRE_RL_mkConnectionGetPut_1,
       CAN_FIRE_RL_mkConnectionGetPut_2,
       CAN_FIRE_RL_mkConnectionGetPut_3,
       CAN_FIRE_RL_propDstData_0_canon,
       CAN_FIRE_RL_propDstData_1_0_canon,
       CAN_FIRE_RL_propDstData_1_1_canon,
       CAN_FIRE_RL_propDstData_1_2_canon,
       CAN_FIRE_RL_propDstData_1_canon,
       CAN_FIRE_RL_propDstData_2_canon,
       CAN_FIRE_RL_propDstIdx_0_canon,
       CAN_FIRE_RL_propDstIdx_1_0_canon,
       CAN_FIRE_RL_propDstIdx_1_1_canon,
       CAN_FIRE_RL_propDstIdx_1_2_canon,
       CAN_FIRE_RL_propDstIdx_1_canon,
       CAN_FIRE_RL_propDstIdx_2_canon,
       CAN_FIRE_RL_rl_reset,
       CAN_FIRE_RL_rl_reset_complete,
       CAN_FIRE_RL_sendPRq,
       CAN_FIRE_RL_sendPRq_1,
       CAN_FIRE_RL_sendPRq_2,
       CAN_FIRE_RL_sendPRs,
       CAN_FIRE_RL_sendPRs_1,
       CAN_FIRE_RL_sendPRs_2,
       CAN_FIRE_RL_srcPropose,
       CAN_FIRE_RL_srcPropose_1,
       CAN_FIRE_RL_srcPropose_2,
       CAN_FIRE_RL_srcPropose_3,
       CAN_FIRE_RL_srcPropose_4,
       CAN_FIRE_RL_srcPropose_5,
       CAN_FIRE_dma_server_m_arvalid,
       CAN_FIRE_dma_server_m_awvalid,
       CAN_FIRE_dma_server_m_bready,
       CAN_FIRE_dma_server_m_rready,
       CAN_FIRE_dma_server_m_wvalid,
       CAN_FIRE_dmem_req,
       CAN_FIRE_imem_master_m_arready,
       CAN_FIRE_imem_master_m_awready,
       CAN_FIRE_imem_master_m_bvalid,
       CAN_FIRE_imem_master_m_rvalid,
       CAN_FIRE_imem_master_m_wready,
       CAN_FIRE_imem_req,
       CAN_FIRE_ma_ddr4_ready,
       CAN_FIRE_mem_master_m_arready,
       CAN_FIRE_mem_master_m_awready,
       CAN_FIRE_mem_master_m_bvalid,
       CAN_FIRE_mem_master_m_rvalid,
       CAN_FIRE_mem_master_m_wready,
       CAN_FIRE_server_fence_i_request_put,
       CAN_FIRE_server_fence_i_response_get,
       CAN_FIRE_server_fence_request_put,
       CAN_FIRE_server_fence_response_get,
       CAN_FIRE_server_reset_request_put,
       CAN_FIRE_server_reset_response_get,
       CAN_FIRE_set_watch_tohost,
       CAN_FIRE_sfence_vma_server_request_put,
       CAN_FIRE_sfence_vma_server_response_get,
       WILL_FIRE_RL_ClientServerRequest,
       WILL_FIRE_RL_ClientServerRequest_1,
       WILL_FIRE_RL_ClientServerRequest_2,
       WILL_FIRE_RL_ClientServerRequest_3,
       WILL_FIRE_RL_ClientServerResponse,
       WILL_FIRE_RL_ClientServerResponse_1,
       WILL_FIRE_RL_ClientServerResponse_2,
       WILL_FIRE_RL_ClientServerResponse_3,
       WILL_FIRE_RL_doEnq,
       WILL_FIRE_RL_doEnq_1,
       WILL_FIRE_RL_dstSelectSrc,
       WILL_FIRE_RL_dstSelectSrc_1,
       WILL_FIRE_RL_enqDst_0_canon,
       WILL_FIRE_RL_enqDst_1_0_canon,
       WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp,
       WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_req,
       WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps,
       WILL_FIRE_RL_llc_axi4_adapter_rl_handle_write_req,
       WILL_FIRE_RL_mkConnectionGetPut_1,
       WILL_FIRE_RL_mkConnectionGetPut_2,
       WILL_FIRE_RL_mkConnectionGetPut_3,
       WILL_FIRE_RL_propDstData_0_canon,
       WILL_FIRE_RL_propDstData_1_0_canon,
       WILL_FIRE_RL_propDstData_1_1_canon,
       WILL_FIRE_RL_propDstData_1_2_canon,
       WILL_FIRE_RL_propDstData_1_canon,
       WILL_FIRE_RL_propDstData_2_canon,
       WILL_FIRE_RL_propDstIdx_0_canon,
       WILL_FIRE_RL_propDstIdx_1_0_canon,
       WILL_FIRE_RL_propDstIdx_1_1_canon,
       WILL_FIRE_RL_propDstIdx_1_2_canon,
       WILL_FIRE_RL_propDstIdx_1_canon,
       WILL_FIRE_RL_propDstIdx_2_canon,
       WILL_FIRE_RL_rl_reset,
       WILL_FIRE_RL_rl_reset_complete,
       WILL_FIRE_RL_sendPRq,
       WILL_FIRE_RL_sendPRq_1,
       WILL_FIRE_RL_sendPRq_2,
       WILL_FIRE_RL_sendPRs,
       WILL_FIRE_RL_sendPRs_1,
       WILL_FIRE_RL_sendPRs_2,
       WILL_FIRE_RL_srcPropose,
       WILL_FIRE_RL_srcPropose_1,
       WILL_FIRE_RL_srcPropose_2,
       WILL_FIRE_RL_srcPropose_3,
       WILL_FIRE_RL_srcPropose_4,
       WILL_FIRE_RL_srcPropose_5,
       WILL_FIRE_dma_server_m_arvalid,
       WILL_FIRE_dma_server_m_awvalid,
       WILL_FIRE_dma_server_m_bready,
       WILL_FIRE_dma_server_m_rready,
       WILL_FIRE_dma_server_m_wvalid,
       WILL_FIRE_dmem_req,
       WILL_FIRE_imem_master_m_arready,
       WILL_FIRE_imem_master_m_awready,
       WILL_FIRE_imem_master_m_bvalid,
       WILL_FIRE_imem_master_m_rvalid,
       WILL_FIRE_imem_master_m_wready,
       WILL_FIRE_imem_req,
       WILL_FIRE_ma_ddr4_ready,
       WILL_FIRE_mem_master_m_arready,
       WILL_FIRE_mem_master_m_awready,
       WILL_FIRE_mem_master_m_bvalid,
       WILL_FIRE_mem_master_m_rvalid,
       WILL_FIRE_mem_master_m_wready,
       WILL_FIRE_server_fence_i_request_put,
       WILL_FIRE_server_fence_i_response_get,
       WILL_FIRE_server_fence_request_put,
       WILL_FIRE_server_fence_response_get,
       WILL_FIRE_server_reset_request_put,
       WILL_FIRE_server_reset_response_get,
       WILL_FIRE_set_watch_tohost,
       WILL_FIRE_sfence_vma_server_request_put,
       WILL_FIRE_sfence_vma_server_response_get;
  // inputs to muxes for submodule ports
  wire MUX_rg_state$write_1__SEL_3;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h84135;
  reg [31 : 0] v__h84241;
  reg [31 : 0] v__h13951;
  reg [31 : 0] v__h85786;
  reg [31 : 0] v__h31896;
  reg [31 : 0] v__h13945;
  reg [31 : 0] v__h31890;
  reg [31 : 0] v__h84129;
  reg [31 : 0] v__h84235;
  reg [31 : 0] v__h85780;
  // synopsys translate_on
  // remaining internal signals
  reg [63 : 0] CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q10,
	       CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q11,
	       CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q13,
	       CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q5,
	       CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q6,
	       CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q7,
	       CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q8,
	       CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q9,
	       CASE_x1624_0_n__read_addr1844_1_n__read_addr19_ETC__q15,
	       CASE_x5600_0_n__read_addr5824_1_n__read_addr59_ETC__q4,
	       data64__h15525;
  reg [7 : 0] strb8__h15526;
  reg [2 : 0] x__h46058;
  reg [1 : 0] CASE_x1624_0_IF_propDstData_1_0_dummy2_1_read__ETC__q14,
	      CASE_x5600_0_IF_propDstData_0_dummy2_1_read__5_ETC__q2,
	      CASE_x5600_0_IF_propDstData_0_dummy2_1_read__5_ETC__q3,
	      x__h46068,
	      x__h74996;
  reg CASE_x1624_0_propDstData_1_0_dummy2_1_read__87_ETC__q12,
      CASE_x5600_0_propDstData_0_dummy2_1_read__54_A_ETC__q1,
      SEL_ARR_propDstIdx_0_dummy2_1_read__95_AND_IF__ETC___d242,
      SEL_ARR_propDstIdx_1_0_dummy2_1_read__28_AND_I_ETC___d475;
  wire [516 : 0] SEL_ARR_IF_propDstData_1_0_dummy2_1_read__87_T_ETC___d642;
  wire [512 : 0] SEL_ARR_propDstData_1_0_dummy2_1_read__87_AND__ETC___d627;
  wire [511 : 0] new_cline__h14098;
  wire [447 : 0] SEL_ARR_IF_propDstData_1_0_lat_0_whas__97_THEN_ETC___d615;
  wire [319 : 0] SEL_ARR_IF_propDstData_1_0_lat_0_whas__97_THEN_ETC___d592;
  wire [191 : 0] SEL_ARR_IF_propDstData_1_0_lat_0_whas__97_THEN_ETC___d569;
  wire [63 : 0] mem_req_rd_addr_araddr__h13577,
		mem_req_wr_addr_awaddr__h15613,
		n__read_addr__h45824,
		n__read_addr__h45909,
		n__read_addr__h45994,
		n__read_addr__h71844,
		n__read_addr__h71923,
		n__read_addr__h72002;
  wire [9 : 0] SEL_ARR_IF_propDstData_0_dummy2_1_read__54_THE_ETC___d346;
  wire [5 : 0] SEL_ARR_propDstData_0_dummy2_1_read__54_AND_IF_ETC___d345,
	       x__h13627,
	       x__h15647;
  wire [3 : 0] b__h13463;
  wire [2 : 0] n__read_id__h45828, n__read_id__h45913, n__read_id__h45998;
  wire [1 : 0] IF_propDstData_0_dummy2_1_read__54_THEN_IF_pro_ETC___d278,
	       IF_propDstData_0_dummy2_1_read__54_THEN_IF_pro_ETC___d292,
	       IF_propDstData_1_0_dummy2_1_read__87_THEN_IF_p_ETC___d511,
	       IF_propDstData_1_1_dummy2_1_read__92_THEN_IF_p_ETC___d515,
	       IF_propDstData_1_2_dummy2_1_read__97_THEN_IF_p_ETC___d519,
	       IF_propDstData_1_dummy2_1_read__59_THEN_IF_pro_ETC___d282,
	       IF_propDstData_1_dummy2_1_read__59_THEN_IF_pro_ETC___d296,
	       IF_propDstData_2_dummy2_1_read__64_THEN_IF_pro_ETC___d286,
	       IF_propDstData_2_dummy2_1_read__64_THEN_IF_pro_ETC___d300,
	       n__read_child__h45829,
	       n__read_child__h45914,
	       n__read_child__h45999,
	       n__read_child__h71847,
	       n__read_child__h71926,
	       n__read_child__h72005,
	       x__h45600,
	       x__h71624;
  wire IF_NOT_propDstIdx_0_dummy2_1_read__95_96_OR_IF_ETC___d250,
       IF_NOT_propDstIdx_0_dummy2_1_read__95_96_OR_IF_ETC___d251,
       IF_NOT_propDstIdx_1_0_dummy2_1_read__28_29_OR__ETC___d483,
       IF_NOT_propDstIdx_1_0_dummy2_1_read__28_29_OR__ETC___d484,
       IF_propDstIdx_0_lat_0_whas__43_THEN_propDstIdx_ETC___d146,
       IF_propDstIdx_1_0_lat_0_whas__76_THEN_propDstI_ETC___d379,
       IF_propDstIdx_1_1_lat_0_whas__83_THEN_propDstI_ETC___d386,
       IF_propDstIdx_1_2_lat_0_whas__90_THEN_propDstI_ETC___d393,
       IF_propDstIdx_1_lat_0_whas__50_THEN_propDstIdx_ETC___d153,
       IF_propDstIdx_2_lat_0_whas__57_THEN_propDstIdx_ETC___d160,
       NOT_cfg_verbosity_read__38_ULE_1_39___d740,
       NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253,
       NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486,
       NOT_llc_axi4_adapter_master_xactor_crg_wr_addr_ETC___d80,
       NOT_propDstIdx_0_dummy2_1_read__95_96_OR_IF_pr_ETC___d245,
       NOT_propDstIdx_1_0_dummy2_1_read__28_29_OR_IF__ETC___d478,
       NOT_propDstIdx_1_1_dummy2_1_read__41_42_OR_IF__ETC___d481,
       NOT_propDstIdx_1_2_dummy2_1_read__54_55_OR_IF__ETC___d659,
       NOT_propDstIdx_1_dummy2_1_read__08_09_OR_IF_pr_ETC___d248,
       NOT_propDstIdx_2_dummy2_1_read__21_22_OR_IF_pr_ETC___d363,
       enqDst_0_dummy2_1_read__31_AND_IF_enqDst_0_lat_ETC___d368,
       enqDst_1_0_dummy2_1_read__64_AND_IF_enqDst_1_0_ETC___d664,
       propDstData_0_dummy2_1_read__54_AND_IF_propDst_ETC___d306,
       propDstData_1_0_dummy2_1_read__87_AND_IF_propD_ETC___d525,
       propDstData_1_1_dummy2_1_read__92_AND_IF_propD_ETC___d529,
       propDstData_1_2_dummy2_1_read__97_AND_IF_propD_ETC___d533,
       propDstData_1_dummy2_1_read__59_AND_IF_propDst_ETC___d310,
       propDstData_2_dummy2_1_read__64_AND_IF_propDst_ETC___d314;
  // action method server_reset_request_put
  assign RDY_server_reset_request_put = rg_state == 2'd2 ;
  assign CAN_FIRE_server_reset_request_put = rg_state == 2'd2 ;
  assign WILL_FIRE_server_reset_request_put = EN_server_reset_request_put ;
  // action method server_reset_response_get
  assign RDY_server_reset_response_get = f_reset_rsps$EMPTY_N ;
  assign CAN_FIRE_server_reset_response_get = f_reset_rsps$EMPTY_N ;
  assign WILL_FIRE_server_reset_response_get = EN_server_reset_response_get ;
  // action method imem_req
  assign CAN_FIRE_imem_req = 1'd1 ;
  assign WILL_FIRE_imem_req = EN_imem_req ;
  // value method imem_valid
  assign imem_valid = i_mmu_cache$valid ;
  // value method imem_is_i32_not_i16
  assign imem_is_i32_not_i16 = 1'd1 ;
  // value method imem_pc
  assign imem_pc = i_mmu_cache$addr ;
  // value method imem_instr
  assign imem_instr = i_mmu_cache$word64[31:0] ;
  // value method imem_exc
  assign imem_exc = i_mmu_cache$exc ;
  // value method imem_exc_code
  assign imem_exc_code = i_mmu_cache$exc_code ;
  // value method imem_tval
  assign imem_tval = i_mmu_cache$addr ;
  // value method imem_master_m_awvalid
  assign imem_master_awvalid = mmio_axi4_adapter$mem_master_awvalid ;
  // value method imem_master_m_awid
  assign imem_master_awid = mmio_axi4_adapter$mem_master_awid ;
  // value method imem_master_m_awaddr
  assign imem_master_awaddr = mmio_axi4_adapter$mem_master_awaddr ;
  // value method imem_master_m_awlen
  assign imem_master_awlen = mmio_axi4_adapter$mem_master_awlen ;
  // value method imem_master_m_awsize
  assign imem_master_awsize = mmio_axi4_adapter$mem_master_awsize ;
  // value method imem_master_m_awburst
  assign imem_master_awburst = mmio_axi4_adapter$mem_master_awburst ;
  // value method imem_master_m_awlock
  assign imem_master_awlock = mmio_axi4_adapter$mem_master_awlock ;
  // value method imem_master_m_awcache
  assign imem_master_awcache = mmio_axi4_adapter$mem_master_awcache ;
  // value method imem_master_m_awprot
  assign imem_master_awprot = mmio_axi4_adapter$mem_master_awprot ;
  // value method imem_master_m_awqos
  assign imem_master_awqos = mmio_axi4_adapter$mem_master_awqos ;
  // value method imem_master_m_awregion
  assign imem_master_awregion = mmio_axi4_adapter$mem_master_awregion ;
  // action method imem_master_m_awready
  assign CAN_FIRE_imem_master_m_awready = 1'd1 ;
  assign WILL_FIRE_imem_master_m_awready = 1'd1 ;
  // value method imem_master_m_wvalid
  assign imem_master_wvalid = mmio_axi4_adapter$mem_master_wvalid ;
  // value method imem_master_m_wdata
  assign imem_master_wdata = mmio_axi4_adapter$mem_master_wdata ;
  // value method imem_master_m_wstrb
  assign imem_master_wstrb = mmio_axi4_adapter$mem_master_wstrb ;
  // value method imem_master_m_wlast
  assign imem_master_wlast = mmio_axi4_adapter$mem_master_wlast ;
  // action method imem_master_m_wready
  assign CAN_FIRE_imem_master_m_wready = 1'd1 ;
  assign WILL_FIRE_imem_master_m_wready = 1'd1 ;
  // action method imem_master_m_bvalid
  assign CAN_FIRE_imem_master_m_bvalid = 1'd1 ;
  assign WILL_FIRE_imem_master_m_bvalid = 1'd1 ;
  // value method imem_master_m_bready
  assign imem_master_bready = mmio_axi4_adapter$mem_master_bready ;
  // value method imem_master_m_arvalid
  assign imem_master_arvalid = mmio_axi4_adapter$mem_master_arvalid ;
  // value method imem_master_m_arid
  assign imem_master_arid = mmio_axi4_adapter$mem_master_arid ;
  // value method imem_master_m_araddr
  assign imem_master_araddr = mmio_axi4_adapter$mem_master_araddr ;
  // value method imem_master_m_arlen
  assign imem_master_arlen = mmio_axi4_adapter$mem_master_arlen ;
  // value method imem_master_m_arsize
  assign imem_master_arsize = mmio_axi4_adapter$mem_master_arsize ;
  // value method imem_master_m_arburst
  assign imem_master_arburst = mmio_axi4_adapter$mem_master_arburst ;
  // value method imem_master_m_arlock
  assign imem_master_arlock = mmio_axi4_adapter$mem_master_arlock ;
  // value method imem_master_m_arcache
  assign imem_master_arcache = mmio_axi4_adapter$mem_master_arcache ;
  // value method imem_master_m_arprot
  assign imem_master_arprot = mmio_axi4_adapter$mem_master_arprot ;
  // value method imem_master_m_arqos
  assign imem_master_arqos = mmio_axi4_adapter$mem_master_arqos ;
  // value method imem_master_m_arregion
  assign imem_master_arregion = mmio_axi4_adapter$mem_master_arregion ;
  // action method imem_master_m_arready
  assign CAN_FIRE_imem_master_m_arready = 1'd1 ;
  assign WILL_FIRE_imem_master_m_arready = 1'd1 ;
  // action method imem_master_m_rvalid
  assign CAN_FIRE_imem_master_m_rvalid = 1'd1 ;
  assign WILL_FIRE_imem_master_m_rvalid = 1'd1 ;
  // value method imem_master_m_rready
  assign imem_master_rready = mmio_axi4_adapter$mem_master_rready ;
  // action method dmem_req
  assign CAN_FIRE_dmem_req = 1'd1 ;
  assign WILL_FIRE_dmem_req = EN_dmem_req ;
  // value method dmem_valid
  assign dmem_valid = d_mmu_cache$valid ;
  // value method dmem_word64
  assign dmem_word64 = d_mmu_cache$word64 ;
  // value method dmem_st_amo_val
  assign dmem_st_amo_val = d_mmu_cache$st_amo_val ;
  // value method dmem_exc
  assign dmem_exc = d_mmu_cache$exc ;
  // value method dmem_exc_code
  assign dmem_exc_code = d_mmu_cache$exc_code ;
  // value method mem_master_m_awvalid
  assign mem_master_awvalid =
	     llc_axi4_adapter_master_xactor_crg_wr_addr_full ;
  // value method mem_master_m_awid
  assign mem_master_awid = llc_axi4_adapter_master_xactor_rg_wr_addr[108:93] ;
  // value method mem_master_m_awaddr
  assign mem_master_awaddr =
	     llc_axi4_adapter_master_xactor_rg_wr_addr[92:29] ;
  // value method mem_master_m_awlen
  assign mem_master_awlen = llc_axi4_adapter_master_xactor_rg_wr_addr[28:21] ;
  // value method mem_master_m_awsize
  assign mem_master_awsize =
	     llc_axi4_adapter_master_xactor_rg_wr_addr[20:18] ;
  // value method mem_master_m_awburst
  assign mem_master_awburst =
	     llc_axi4_adapter_master_xactor_rg_wr_addr[17:16] ;
  // value method mem_master_m_awlock
  assign mem_master_awlock = llc_axi4_adapter_master_xactor_rg_wr_addr[15] ;
  // value method mem_master_m_awcache
  assign mem_master_awcache =
	     llc_axi4_adapter_master_xactor_rg_wr_addr[14:11] ;
  // value method mem_master_m_awprot
  assign mem_master_awprot = llc_axi4_adapter_master_xactor_rg_wr_addr[10:8] ;
  // value method mem_master_m_awqos
  assign mem_master_awqos = llc_axi4_adapter_master_xactor_rg_wr_addr[7:4] ;
  // value method mem_master_m_awregion
  assign mem_master_awregion =
	     llc_axi4_adapter_master_xactor_rg_wr_addr[3:0] ;
  // action method mem_master_m_awready
  assign CAN_FIRE_mem_master_m_awready = 1'd1 ;
  assign WILL_FIRE_mem_master_m_awready = 1'd1 ;
  // value method mem_master_m_wvalid
  assign mem_master_wvalid = llc_axi4_adapter_master_xactor_crg_wr_data_full ;
  // value method mem_master_m_wdata
  assign mem_master_wdata = llc_axi4_adapter_master_xactor_rg_wr_data[72:9] ;
  // value method mem_master_m_wstrb
  assign mem_master_wstrb = llc_axi4_adapter_master_xactor_rg_wr_data[8:1] ;
  // value method mem_master_m_wlast
  assign mem_master_wlast = llc_axi4_adapter_master_xactor_rg_wr_data[0] ;
  // action method mem_master_m_wready
  assign CAN_FIRE_mem_master_m_wready = 1'd1 ;
  assign WILL_FIRE_mem_master_m_wready = 1'd1 ;
  // action method mem_master_m_bvalid
  assign CAN_FIRE_mem_master_m_bvalid = 1'd1 ;
  assign WILL_FIRE_mem_master_m_bvalid = 1'd1 ;
  // value method mem_master_m_bready
  assign mem_master_bready =
	     !llc_axi4_adapter_master_xactor_crg_wr_resp_full$port2__read ;
  // value method mem_master_m_arvalid
  assign mem_master_arvalid =
	     llc_axi4_adapter_master_xactor_crg_rd_addr_full ;
  // value method mem_master_m_arid
  assign mem_master_arid = llc_axi4_adapter_master_xactor_rg_rd_addr[108:93] ;
  // value method mem_master_m_araddr
  assign mem_master_araddr =
	     llc_axi4_adapter_master_xactor_rg_rd_addr[92:29] ;
  // value method mem_master_m_arlen
  assign mem_master_arlen = llc_axi4_adapter_master_xactor_rg_rd_addr[28:21] ;
  // value method mem_master_m_arsize
  assign mem_master_arsize =
	     llc_axi4_adapter_master_xactor_rg_rd_addr[20:18] ;
  // value method mem_master_m_arburst
  assign mem_master_arburst =
	     llc_axi4_adapter_master_xactor_rg_rd_addr[17:16] ;
  // value method mem_master_m_arlock
  assign mem_master_arlock = llc_axi4_adapter_master_xactor_rg_rd_addr[15] ;
  // value method mem_master_m_arcache
  assign mem_master_arcache =
	     llc_axi4_adapter_master_xactor_rg_rd_addr[14:11] ;
  // value method mem_master_m_arprot
  assign mem_master_arprot = llc_axi4_adapter_master_xactor_rg_rd_addr[10:8] ;
  // value method mem_master_m_arqos
  assign mem_master_arqos = llc_axi4_adapter_master_xactor_rg_rd_addr[7:4] ;
  // value method mem_master_m_arregion
  assign mem_master_arregion =
	     llc_axi4_adapter_master_xactor_rg_rd_addr[3:0] ;
  // action method mem_master_m_arready
  assign CAN_FIRE_mem_master_m_arready = 1'd1 ;
  assign WILL_FIRE_mem_master_m_arready = 1'd1 ;
  // action method mem_master_m_rvalid
  assign CAN_FIRE_mem_master_m_rvalid = 1'd1 ;
  assign WILL_FIRE_mem_master_m_rvalid = 1'd1 ;
  // value method mem_master_m_rready
  assign mem_master_rready =
	     !llc_axi4_adapter_master_xactor_crg_rd_data_full$port2__read ;
  // action method server_fence_i_request_put
  assign RDY_server_fence_i_request_put = 1'd1 ;
  assign CAN_FIRE_server_fence_i_request_put = 1'd1 ;
  assign WILL_FIRE_server_fence_i_request_put =
	     EN_server_fence_i_request_put ;
  // action method server_fence_i_response_get
  assign RDY_server_fence_i_response_get = 1'd1 ;
  assign CAN_FIRE_server_fence_i_response_get = 1'd1 ;
  assign WILL_FIRE_server_fence_i_response_get =
	     EN_server_fence_i_response_get ;
  // action method server_fence_request_put
  assign RDY_server_fence_request_put = 1'd1 ;
  assign CAN_FIRE_server_fence_request_put = 1'd1 ;
  assign WILL_FIRE_server_fence_request_put = EN_server_fence_request_put ;
  // action method server_fence_response_get
  assign RDY_server_fence_response_get = 1'd1 ;
  assign CAN_FIRE_server_fence_response_get = 1'd1 ;
  assign WILL_FIRE_server_fence_response_get = EN_server_fence_response_get ;
  // action method sfence_vma_server_request_put
  assign RDY_sfence_vma_server_request_put = 1'd1 ;
  assign CAN_FIRE_sfence_vma_server_request_put = 1'd1 ;
  assign WILL_FIRE_sfence_vma_server_request_put =
	     EN_sfence_vma_server_request_put ;
  // action method sfence_vma_server_response_get
  assign RDY_sfence_vma_server_response_get = 1'd1 ;
  assign CAN_FIRE_sfence_vma_server_response_get = 1'd1 ;
  assign WILL_FIRE_sfence_vma_server_response_get =
	     EN_sfence_vma_server_response_get ;
  // action method dma_server_m_awvalid
  assign CAN_FIRE_dma_server_m_awvalid = 1'd1 ;
  assign WILL_FIRE_dma_server_m_awvalid = 1'd1 ;
  // value method dma_server_m_awready
  assign dma_server_awready = dma_cache$axi4_s_awready ;
  // action method dma_server_m_wvalid
  assign CAN_FIRE_dma_server_m_wvalid = 1'd1 ;
  assign WILL_FIRE_dma_server_m_wvalid = 1'd1 ;
  // value method dma_server_m_wready
  assign dma_server_wready = dma_cache$axi4_s_wready ;
  // value method dma_server_m_bvalid
  assign dma_server_bvalid = dma_cache$axi4_s_bvalid ;
  // value method dma_server_m_bid
  assign dma_server_bid = dma_cache$axi4_s_bid ;
  // value method dma_server_m_bresp
  assign dma_server_bresp = dma_cache$axi4_s_bresp ;
  // action method dma_server_m_bready
  assign CAN_FIRE_dma_server_m_bready = 1'd1 ;
  assign WILL_FIRE_dma_server_m_bready = 1'd1 ;
  // action method dma_server_m_arvalid
  assign CAN_FIRE_dma_server_m_arvalid = 1'd1 ;
  assign WILL_FIRE_dma_server_m_arvalid = 1'd1 ;
  // value method dma_server_m_arready
  assign dma_server_arready = dma_cache$axi4_s_arready ;
  // value method dma_server_m_rvalid
  assign dma_server_rvalid = dma_cache$axi4_s_rvalid ;
  // value method dma_server_m_rid
  assign dma_server_rid = dma_cache$axi4_s_rid ;
  // value method dma_server_m_rdata
  assign dma_server_rdata = dma_cache$axi4_s_rdata ;
  // value method dma_server_m_rresp
  assign dma_server_rresp = dma_cache$axi4_s_rresp ;
  // value method dma_server_m_rlast
  assign dma_server_rlast = dma_cache$axi4_s_rlast ;
  // action method dma_server_m_rready
  assign CAN_FIRE_dma_server_m_rready = 1'd1 ;
  assign WILL_FIRE_dma_server_m_rready = 1'd1 ;
  // action method set_watch_tohost
  assign RDY_set_watch_tohost = 1'd1 ;
  assign CAN_FIRE_set_watch_tohost = 1'd1 ;
  assign WILL_FIRE_set_watch_tohost = EN_set_watch_tohost ;
  // value method mv_tohost_value
  assign mv_tohost_value = d_mmu_cache$mv_tohost_value ;
  assign RDY_mv_tohost_value = 1'd1 ;
  // action method ma_ddr4_ready
  assign RDY_ma_ddr4_ready = 1'd1 ;
  assign CAN_FIRE_ma_ddr4_ready = 1'd1 ;
  assign WILL_FIRE_ma_ddr4_ready = EN_ma_ddr4_ready ;
  // value method mv_status
  assign mv_status = llc_axi4_adapter_rg_AXI4_error ? 8'd1 : 8'd0 ;
  // submodule d_mmu_cache
  mkD_MMU_Cache d_mmu_cache(.CLK(CLK),
			    .RST_N(RST_N),
			    .flush_server_request_put(d_mmu_cache$flush_server_request_put),
			    .imem_pte_writeback_p_put(d_mmu_cache$imem_pte_writeback_p_put),
			    .imem_ptw_server_request_put(d_mmu_cache$imem_ptw_server_request_put),
			    .l1_to_l2_client_response_enq_x(d_mmu_cache$l1_to_l2_client_response_enq_x),
			    .l2_to_l1_server_request_enq_x(d_mmu_cache$l2_to_l1_server_request_enq_x),
			    .ma_req_amo_funct7(d_mmu_cache$ma_req_amo_funct7),
			    .ma_req_f3(d_mmu_cache$ma_req_f3),
			    .ma_req_mstatus_MXR(d_mmu_cache$ma_req_mstatus_MXR),
			    .ma_req_op(d_mmu_cache$ma_req_op),
			    .ma_req_priv(d_mmu_cache$ma_req_priv),
			    .ma_req_satp(d_mmu_cache$ma_req_satp),
			    .ma_req_sstatus_SUM(d_mmu_cache$ma_req_sstatus_SUM),
			    .ma_req_st_value(d_mmu_cache$ma_req_st_value),
			    .ma_req_va(d_mmu_cache$ma_req_va),
			    .mmio_client_response_put(d_mmu_cache$mmio_client_response_put),
			    .set_watch_tohost_tohost_addr(d_mmu_cache$set_watch_tohost_tohost_addr),
			    .set_watch_tohost_watch_tohost(d_mmu_cache$set_watch_tohost_watch_tohost),
			    .EN_ma_req(d_mmu_cache$EN_ma_req),
			    .EN_flush_server_request_put(d_mmu_cache$EN_flush_server_request_put),
			    .EN_flush_server_response_get(d_mmu_cache$EN_flush_server_response_get),
			    .EN_tlb_flush(d_mmu_cache$EN_tlb_flush),
			    .EN_imem_ptw_server_request_put(d_mmu_cache$EN_imem_ptw_server_request_put),
			    .EN_imem_ptw_server_response_get(d_mmu_cache$EN_imem_ptw_server_response_get),
			    .EN_imem_pte_writeback_p_put(d_mmu_cache$EN_imem_pte_writeback_p_put),
			    .EN_l1_to_l2_client_request_deq(d_mmu_cache$EN_l1_to_l2_client_request_deq),
			    .EN_l1_to_l2_client_response_enq(d_mmu_cache$EN_l1_to_l2_client_response_enq),
			    .EN_l2_to_l1_server_request_enq(d_mmu_cache$EN_l2_to_l1_server_request_enq),
			    .EN_l2_to_l1_server_response_deq(d_mmu_cache$EN_l2_to_l1_server_response_deq),
			    .EN_mmio_client_request_get(d_mmu_cache$EN_mmio_client_request_get),
			    .EN_mmio_client_response_put(d_mmu_cache$EN_mmio_client_response_put),
			    .EN_set_watch_tohost(d_mmu_cache$EN_set_watch_tohost),
			    .valid(d_mmu_cache$valid),
			    .addr(),
			    .word64(d_mmu_cache$word64),
			    .st_amo_val(d_mmu_cache$st_amo_val),
			    .exc(d_mmu_cache$exc),
			    .exc_code(d_mmu_cache$exc_code),
			    .RDY_flush_server_request_put(),
			    .RDY_flush_server_response_get(),
			    .RDY_tlb_flush(),
			    .RDY_imem_ptw_server_request_put(d_mmu_cache$RDY_imem_ptw_server_request_put),
			    .imem_ptw_server_response_get(d_mmu_cache$imem_ptw_server_response_get),
			    .RDY_imem_ptw_server_response_get(d_mmu_cache$RDY_imem_ptw_server_response_get),
			    .RDY_imem_pte_writeback_p_put(d_mmu_cache$RDY_imem_pte_writeback_p_put),
			    .l1_to_l2_client_request_first(d_mmu_cache$l1_to_l2_client_request_first),
			    .RDY_l1_to_l2_client_request_first(d_mmu_cache$RDY_l1_to_l2_client_request_first),
			    .RDY_l1_to_l2_client_request_deq(d_mmu_cache$RDY_l1_to_l2_client_request_deq),
			    .l1_to_l2_client_request_notEmpty(),
			    .RDY_l1_to_l2_client_request_notEmpty(),
			    .RDY_l1_to_l2_client_response_enq(d_mmu_cache$RDY_l1_to_l2_client_response_enq),
			    .l1_to_l2_client_response_notFull(),
			    .RDY_l1_to_l2_client_response_notFull(),
			    .RDY_l2_to_l1_server_request_enq(d_mmu_cache$RDY_l2_to_l1_server_request_enq),
			    .l2_to_l1_server_request_notFull(),
			    .RDY_l2_to_l1_server_request_notFull(),
			    .l2_to_l1_server_response_first(d_mmu_cache$l2_to_l1_server_response_first),
			    .RDY_l2_to_l1_server_response_first(d_mmu_cache$RDY_l2_to_l1_server_response_first),
			    .RDY_l2_to_l1_server_response_deq(d_mmu_cache$RDY_l2_to_l1_server_response_deq),
			    .l2_to_l1_server_response_notEmpty(),
			    .RDY_l2_to_l1_server_response_notEmpty(),
			    .mmio_client_request_get(d_mmu_cache$mmio_client_request_get),
			    .RDY_mmio_client_request_get(d_mmu_cache$RDY_mmio_client_request_get),
			    .RDY_mmio_client_response_put(d_mmu_cache$RDY_mmio_client_response_put),
			    .RDY_set_watch_tohost(),
			    .mv_tohost_value(d_mmu_cache$mv_tohost_value),
			    .RDY_mv_tohost_value());
  // submodule dma_cache
  mkDMA_Cache dma_cache(.CLK(CLK),
			.RST_N(RST_N),
			.axi4_s_araddr(dma_cache$axi4_s_araddr),
			.axi4_s_arburst(dma_cache$axi4_s_arburst),
			.axi4_s_arcache(dma_cache$axi4_s_arcache),
			.axi4_s_arid(dma_cache$axi4_s_arid),
			.axi4_s_arlen(dma_cache$axi4_s_arlen),
			.axi4_s_arlock(dma_cache$axi4_s_arlock),
			.axi4_s_arprot(dma_cache$axi4_s_arprot),
			.axi4_s_arqos(dma_cache$axi4_s_arqos),
			.axi4_s_arregion(dma_cache$axi4_s_arregion),
			.axi4_s_arsize(dma_cache$axi4_s_arsize),
			.axi4_s_arvalid(dma_cache$axi4_s_arvalid),
			.axi4_s_awaddr(dma_cache$axi4_s_awaddr),
			.axi4_s_awburst(dma_cache$axi4_s_awburst),
			.axi4_s_awcache(dma_cache$axi4_s_awcache),
			.axi4_s_awid(dma_cache$axi4_s_awid),
			.axi4_s_awlen(dma_cache$axi4_s_awlen),
			.axi4_s_awlock(dma_cache$axi4_s_awlock),
			.axi4_s_awprot(dma_cache$axi4_s_awprot),
			.axi4_s_awqos(dma_cache$axi4_s_awqos),
			.axi4_s_awregion(dma_cache$axi4_s_awregion),
			.axi4_s_awsize(dma_cache$axi4_s_awsize),
			.axi4_s_awvalid(dma_cache$axi4_s_awvalid),
			.axi4_s_bready(dma_cache$axi4_s_bready),
			.axi4_s_rready(dma_cache$axi4_s_rready),
			.axi4_s_wdata(dma_cache$axi4_s_wdata),
			.axi4_s_wlast(dma_cache$axi4_s_wlast),
			.axi4_s_wstrb(dma_cache$axi4_s_wstrb),
			.axi4_s_wvalid(dma_cache$axi4_s_wvalid),
			.l1_to_l2_client_response_enq_x(dma_cache$l1_to_l2_client_response_enq_x),
			.l2_to_l1_server_request_enq_x(dma_cache$l2_to_l1_server_request_enq_x),
			.mmio_client_response_put(dma_cache$mmio_client_response_put),
			.EN_l1_to_l2_client_request_deq(dma_cache$EN_l1_to_l2_client_request_deq),
			.EN_l1_to_l2_client_response_enq(dma_cache$EN_l1_to_l2_client_response_enq),
			.EN_l2_to_l1_server_request_enq(dma_cache$EN_l2_to_l1_server_request_enq),
			.EN_l2_to_l1_server_response_deq(dma_cache$EN_l2_to_l1_server_response_deq),
			.EN_mmio_client_request_get(dma_cache$EN_mmio_client_request_get),
			.EN_mmio_client_response_put(dma_cache$EN_mmio_client_response_put),
			.axi4_s_awready(dma_cache$axi4_s_awready),
			.axi4_s_wready(dma_cache$axi4_s_wready),
			.axi4_s_bvalid(dma_cache$axi4_s_bvalid),
			.axi4_s_bid(dma_cache$axi4_s_bid),
			.axi4_s_bresp(dma_cache$axi4_s_bresp),
			.axi4_s_arready(dma_cache$axi4_s_arready),
			.axi4_s_rvalid(dma_cache$axi4_s_rvalid),
			.axi4_s_rid(dma_cache$axi4_s_rid),
			.axi4_s_rdata(dma_cache$axi4_s_rdata),
			.axi4_s_rresp(dma_cache$axi4_s_rresp),
			.axi4_s_rlast(dma_cache$axi4_s_rlast),
			.l1_to_l2_client_request_first(dma_cache$l1_to_l2_client_request_first),
			.RDY_l1_to_l2_client_request_first(dma_cache$RDY_l1_to_l2_client_request_first),
			.RDY_l1_to_l2_client_request_deq(dma_cache$RDY_l1_to_l2_client_request_deq),
			.l1_to_l2_client_request_notEmpty(),
			.RDY_l1_to_l2_client_request_notEmpty(),
			.RDY_l1_to_l2_client_response_enq(dma_cache$RDY_l1_to_l2_client_response_enq),
			.l1_to_l2_client_response_notFull(),
			.RDY_l1_to_l2_client_response_notFull(),
			.RDY_l2_to_l1_server_request_enq(dma_cache$RDY_l2_to_l1_server_request_enq),
			.l2_to_l1_server_request_notFull(),
			.RDY_l2_to_l1_server_request_notFull(),
			.l2_to_l1_server_response_first(dma_cache$l2_to_l1_server_response_first),
			.RDY_l2_to_l1_server_response_first(dma_cache$RDY_l2_to_l1_server_response_first),
			.RDY_l2_to_l1_server_response_deq(dma_cache$RDY_l2_to_l1_server_response_deq),
			.l2_to_l1_server_response_notEmpty(),
			.RDY_l2_to_l1_server_response_notEmpty(),
			.mmio_client_request_get(dma_cache$mmio_client_request_get),
			.RDY_mmio_client_request_get(dma_cache$RDY_mmio_client_request_get),
			.RDY_mmio_client_response_put(dma_cache$RDY_mmio_client_response_put));
  // submodule enqDst_0_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) enqDst_0_dummy2_0(.CLK(CLK),
							    .D_IN(enqDst_0_dummy2_0$D_IN),
							    .EN(enqDst_0_dummy2_0$EN),
							    .Q_OUT(enqDst_0_dummy2_0$Q_OUT));
  // submodule enqDst_0_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) enqDst_0_dummy2_1(.CLK(CLK),
							    .D_IN(enqDst_0_dummy2_1$D_IN),
							    .EN(enqDst_0_dummy2_1$EN),
							    .Q_OUT(enqDst_0_dummy2_1$Q_OUT));
  // submodule enqDst_1_0_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) enqDst_1_0_dummy2_0(.CLK(CLK),
							      .D_IN(enqDst_1_0_dummy2_0$D_IN),
							      .EN(enqDst_1_0_dummy2_0$EN),
							      .Q_OUT(enqDst_1_0_dummy2_0$Q_OUT));
  // submodule enqDst_1_0_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) enqDst_1_0_dummy2_1(.CLK(CLK),
							      .D_IN(enqDst_1_0_dummy2_1$D_IN),
							      .EN(enqDst_1_0_dummy2_1$EN),
							      .Q_OUT(enqDst_1_0_dummy2_1$Q_OUT));
  // submodule f_reset_rsps
  FIFO20 #(.guarded(1'd1)) f_reset_rsps(.RST(RST_N),
					.CLK(CLK),
					.ENQ(f_reset_rsps$ENQ),
					.DEQ(f_reset_rsps$DEQ),
					.CLR(f_reset_rsps$CLR),
					.FULL_N(f_reset_rsps$FULL_N),
					.EMPTY_N(f_reset_rsps$EMPTY_N));
  // submodule i_mmu_cache
  mkI_MMU_Cache i_mmu_cache(.CLK(CLK),
			    .RST_N(RST_N),
			    .flush_server_request_put(i_mmu_cache$flush_server_request_put),
			    .l1_to_l2_client_response_enq_x(i_mmu_cache$l1_to_l2_client_response_enq_x),
			    .l2_to_l1_server_request_enq_x(i_mmu_cache$l2_to_l1_server_request_enq_x),
			    .ma_req_mstatus_MXR(i_mmu_cache$ma_req_mstatus_MXR),
			    .ma_req_priv(i_mmu_cache$ma_req_priv),
			    .ma_req_satp(i_mmu_cache$ma_req_satp),
			    .ma_req_sstatus_SUM(i_mmu_cache$ma_req_sstatus_SUM),
			    .ma_req_va(i_mmu_cache$ma_req_va),
			    .mmio_client_response_put(i_mmu_cache$mmio_client_response_put),
			    .ptw_client_response_put(i_mmu_cache$ptw_client_response_put),
			    .EN_ma_req(i_mmu_cache$EN_ma_req),
			    .EN_flush_server_request_put(i_mmu_cache$EN_flush_server_request_put),
			    .EN_flush_server_response_get(i_mmu_cache$EN_flush_server_response_get),
			    .EN_tlb_flush(i_mmu_cache$EN_tlb_flush),
			    .EN_ptw_client_request_get(i_mmu_cache$EN_ptw_client_request_get),
			    .EN_ptw_client_response_put(i_mmu_cache$EN_ptw_client_response_put),
			    .EN_pte_writeback_g_get(i_mmu_cache$EN_pte_writeback_g_get),
			    .EN_l1_to_l2_client_request_deq(i_mmu_cache$EN_l1_to_l2_client_request_deq),
			    .EN_l1_to_l2_client_response_enq(i_mmu_cache$EN_l1_to_l2_client_response_enq),
			    .EN_l2_to_l1_server_request_enq(i_mmu_cache$EN_l2_to_l1_server_request_enq),
			    .EN_l2_to_l1_server_response_deq(i_mmu_cache$EN_l2_to_l1_server_response_deq),
			    .EN_mmio_client_request_get(i_mmu_cache$EN_mmio_client_request_get),
			    .EN_mmio_client_response_put(i_mmu_cache$EN_mmio_client_response_put),
			    .valid(i_mmu_cache$valid),
			    .addr(i_mmu_cache$addr),
			    .word64(i_mmu_cache$word64),
			    .exc(i_mmu_cache$exc),
			    .exc_code(i_mmu_cache$exc_code),
			    .RDY_flush_server_request_put(),
			    .RDY_flush_server_response_get(),
			    .RDY_tlb_flush(),
			    .ptw_client_request_get(i_mmu_cache$ptw_client_request_get),
			    .RDY_ptw_client_request_get(i_mmu_cache$RDY_ptw_client_request_get),
			    .RDY_ptw_client_response_put(i_mmu_cache$RDY_ptw_client_response_put),
			    .pte_writeback_g_get(i_mmu_cache$pte_writeback_g_get),
			    .RDY_pte_writeback_g_get(i_mmu_cache$RDY_pte_writeback_g_get),
			    .l1_to_l2_client_request_first(i_mmu_cache$l1_to_l2_client_request_first),
			    .RDY_l1_to_l2_client_request_first(i_mmu_cache$RDY_l1_to_l2_client_request_first),
			    .RDY_l1_to_l2_client_request_deq(i_mmu_cache$RDY_l1_to_l2_client_request_deq),
			    .l1_to_l2_client_request_notEmpty(),
			    .RDY_l1_to_l2_client_request_notEmpty(),
			    .RDY_l1_to_l2_client_response_enq(i_mmu_cache$RDY_l1_to_l2_client_response_enq),
			    .l1_to_l2_client_response_notFull(),
			    .RDY_l1_to_l2_client_response_notFull(),
			    .RDY_l2_to_l1_server_request_enq(i_mmu_cache$RDY_l2_to_l1_server_request_enq),
			    .l2_to_l1_server_request_notFull(),
			    .RDY_l2_to_l1_server_request_notFull(),
			    .l2_to_l1_server_response_first(i_mmu_cache$l2_to_l1_server_response_first),
			    .RDY_l2_to_l1_server_response_first(i_mmu_cache$RDY_l2_to_l1_server_response_first),
			    .RDY_l2_to_l1_server_response_deq(i_mmu_cache$RDY_l2_to_l1_server_response_deq),
			    .l2_to_l1_server_response_notEmpty(),
			    .RDY_l2_to_l1_server_response_notEmpty(),
			    .mmio_client_request_get(i_mmu_cache$mmio_client_request_get),
			    .RDY_mmio_client_request_get(i_mmu_cache$RDY_mmio_client_request_get),
			    .RDY_mmio_client_response_put(i_mmu_cache$RDY_mmio_client_response_put));
  // submodule llc
  mkLLCache llc(.CLK(CLK),
		.RST_N(RST_N),
		.dma_memReq_enq_x(llc$dma_memReq_enq_x),
		.perf_req_r(llc$perf_req_r),
		.perf_setStatus_doStats(llc$perf_setStatus_doStats),
		.to_child_rqFromC_enq_x(llc$to_child_rqFromC_enq_x),
		.to_child_rsFromC_enq_x(llc$to_child_rsFromC_enq_x),
		.to_mem_rsFromM_enq_x(llc$to_mem_rsFromM_enq_x),
		.EN_to_child_rsFromC_enq(llc$EN_to_child_rsFromC_enq),
		.EN_to_child_rqFromC_enq(llc$EN_to_child_rqFromC_enq),
		.EN_to_child_toC_deq(llc$EN_to_child_toC_deq),
		.EN_dma_memReq_enq(llc$EN_dma_memReq_enq),
		.EN_dma_respLd_deq(llc$EN_dma_respLd_deq),
		.EN_dma_respSt_deq(llc$EN_dma_respSt_deq),
		.EN_to_mem_toM_deq(llc$EN_to_mem_toM_deq),
		.EN_to_mem_rsFromM_enq(llc$EN_to_mem_rsFromM_enq),
		.EN_cRqStuck_get(llc$EN_cRqStuck_get),
		.EN_perf_setStatus(llc$EN_perf_setStatus),
		.EN_perf_req(llc$EN_perf_req),
		.EN_perf_resp(llc$EN_perf_resp),
		.to_child_rsFromC_notFull(),
		.RDY_to_child_rsFromC_notFull(),
		.RDY_to_child_rsFromC_enq(llc$RDY_to_child_rsFromC_enq),
		.to_child_rqFromC_notFull(),
		.RDY_to_child_rqFromC_notFull(),
		.RDY_to_child_rqFromC_enq(llc$RDY_to_child_rqFromC_enq),
		.to_child_toC_notEmpty(),
		.RDY_to_child_toC_notEmpty(),
		.RDY_to_child_toC_deq(llc$RDY_to_child_toC_deq),
		.to_child_toC_first(llc$to_child_toC_first),
		.RDY_to_child_toC_first(llc$RDY_to_child_toC_first),
		.dma_memReq_notFull(),
		.RDY_dma_memReq_notFull(),
		.RDY_dma_memReq_enq(),
		.dma_respLd_notEmpty(),
		.RDY_dma_respLd_notEmpty(),
		.RDY_dma_respLd_deq(llc$RDY_dma_respLd_deq),
		.dma_respLd_first(),
		.RDY_dma_respLd_first(),
		.dma_respSt_notEmpty(),
		.RDY_dma_respSt_notEmpty(),
		.RDY_dma_respSt_deq(llc$RDY_dma_respSt_deq),
		.dma_respSt_first(),
		.RDY_dma_respSt_first(),
		.to_mem_toM_notEmpty(),
		.RDY_to_mem_toM_notEmpty(),
		.RDY_to_mem_toM_deq(llc$RDY_to_mem_toM_deq),
		.to_mem_toM_first(llc$to_mem_toM_first),
		.RDY_to_mem_toM_first(llc$RDY_to_mem_toM_first),
		.to_mem_rsFromM_notFull(),
		.RDY_to_mem_rsFromM_notFull(),
		.RDY_to_mem_rsFromM_enq(llc$RDY_to_mem_rsFromM_enq),
		.cRqStuck_get(),
		.RDY_cRqStuck_get(),
		.RDY_perf_setStatus(),
		.RDY_perf_req(),
		.perf_resp(),
		.RDY_perf_resp(),
		.perf_respValid(),
		.RDY_perf_respValid());
  // submodule llc_axi4_adapter_f_pending_reads
  FIFO2 #(.width(32'd69),
	  .guarded(1'd1)) llc_axi4_adapter_f_pending_reads(.RST(RST_N),
							   .CLK(CLK),
							   .D_IN(llc_axi4_adapter_f_pending_reads$D_IN),
							   .ENQ(llc_axi4_adapter_f_pending_reads$ENQ),
							   .DEQ(llc_axi4_adapter_f_pending_reads$DEQ),
							   .CLR(llc_axi4_adapter_f_pending_reads$CLR),
							   .D_OUT(llc_axi4_adapter_f_pending_reads$D_OUT),
							   .FULL_N(llc_axi4_adapter_f_pending_reads$FULL_N),
							   .EMPTY_N(llc_axi4_adapter_f_pending_reads$EMPTY_N));
  // submodule llc_axi4_adapter_f_pending_writes
  FIFO2 #(.width(32'd640),
	  .guarded(1'd1)) llc_axi4_adapter_f_pending_writes(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(llc_axi4_adapter_f_pending_writes$D_IN),
							    .ENQ(llc_axi4_adapter_f_pending_writes$ENQ),
							    .DEQ(llc_axi4_adapter_f_pending_writes$DEQ),
							    .CLR(llc_axi4_adapter_f_pending_writes$CLR),
							    .D_OUT(),
							    .FULL_N(llc_axi4_adapter_f_pending_writes$FULL_N),
							    .EMPTY_N(llc_axi4_adapter_f_pending_writes$EMPTY_N));
  // submodule mmio_axi4_adapter
  mkMMIO_AXI4_Adapter_2 #(.verbosity(3'd0)) mmio_axi4_adapter(.CLK(CLK),
							      .RST_N(RST_N),
							      .mem_master_arready(mmio_axi4_adapter$mem_master_arready),
							      .mem_master_awready(mmio_axi4_adapter$mem_master_awready),
							      .mem_master_bid(mmio_axi4_adapter$mem_master_bid),
							      .mem_master_bresp(mmio_axi4_adapter$mem_master_bresp),
							      .mem_master_bvalid(mmio_axi4_adapter$mem_master_bvalid),
							      .mem_master_rdata(mmio_axi4_adapter$mem_master_rdata),
							      .mem_master_rid(mmio_axi4_adapter$mem_master_rid),
							      .mem_master_rlast(mmio_axi4_adapter$mem_master_rlast),
							      .mem_master_rresp(mmio_axi4_adapter$mem_master_rresp),
							      .mem_master_rvalid(mmio_axi4_adapter$mem_master_rvalid),
							      .mem_master_wready(mmio_axi4_adapter$mem_master_wready),
							      .v_mmio_server_0_request_put(mmio_axi4_adapter$v_mmio_server_0_request_put),
							      .v_mmio_server_1_request_put(mmio_axi4_adapter$v_mmio_server_1_request_put),
							      .v_mmio_server_2_request_put(mmio_axi4_adapter$v_mmio_server_2_request_put),
							      .EN_v_mmio_server_0_request_put(mmio_axi4_adapter$EN_v_mmio_server_0_request_put),
							      .EN_v_mmio_server_0_response_get(mmio_axi4_adapter$EN_v_mmio_server_0_response_get),
							      .EN_v_mmio_server_1_request_put(mmio_axi4_adapter$EN_v_mmio_server_1_request_put),
							      .EN_v_mmio_server_1_response_get(mmio_axi4_adapter$EN_v_mmio_server_1_response_get),
							      .EN_v_mmio_server_2_request_put(mmio_axi4_adapter$EN_v_mmio_server_2_request_put),
							      .EN_v_mmio_server_2_response_get(mmio_axi4_adapter$EN_v_mmio_server_2_response_get),
							      .RDY_v_mmio_server_0_request_put(mmio_axi4_adapter$RDY_v_mmio_server_0_request_put),
							      .v_mmio_server_0_response_get(mmio_axi4_adapter$v_mmio_server_0_response_get),
							      .RDY_v_mmio_server_0_response_get(mmio_axi4_adapter$RDY_v_mmio_server_0_response_get),
							      .RDY_v_mmio_server_1_request_put(mmio_axi4_adapter$RDY_v_mmio_server_1_request_put),
							      .v_mmio_server_1_response_get(mmio_axi4_adapter$v_mmio_server_1_response_get),
							      .RDY_v_mmio_server_1_response_get(mmio_axi4_adapter$RDY_v_mmio_server_1_response_get),
							      .RDY_v_mmio_server_2_request_put(mmio_axi4_adapter$RDY_v_mmio_server_2_request_put),
							      .v_mmio_server_2_response_get(mmio_axi4_adapter$v_mmio_server_2_response_get),
							      .RDY_v_mmio_server_2_response_get(mmio_axi4_adapter$RDY_v_mmio_server_2_response_get),
							      .mem_master_awvalid(mmio_axi4_adapter$mem_master_awvalid),
							      .mem_master_awid(mmio_axi4_adapter$mem_master_awid),
							      .mem_master_awaddr(mmio_axi4_adapter$mem_master_awaddr),
							      .mem_master_awlen(mmio_axi4_adapter$mem_master_awlen),
							      .mem_master_awsize(mmio_axi4_adapter$mem_master_awsize),
							      .mem_master_awburst(mmio_axi4_adapter$mem_master_awburst),
							      .mem_master_awlock(mmio_axi4_adapter$mem_master_awlock),
							      .mem_master_awcache(mmio_axi4_adapter$mem_master_awcache),
							      .mem_master_awprot(mmio_axi4_adapter$mem_master_awprot),
							      .mem_master_awqos(mmio_axi4_adapter$mem_master_awqos),
							      .mem_master_awregion(mmio_axi4_adapter$mem_master_awregion),
							      .mem_master_wvalid(mmio_axi4_adapter$mem_master_wvalid),
							      .mem_master_wdata(mmio_axi4_adapter$mem_master_wdata),
							      .mem_master_wstrb(mmio_axi4_adapter$mem_master_wstrb),
							      .mem_master_wlast(mmio_axi4_adapter$mem_master_wlast),
							      .mem_master_bready(mmio_axi4_adapter$mem_master_bready),
							      .mem_master_arvalid(mmio_axi4_adapter$mem_master_arvalid),
							      .mem_master_arid(mmio_axi4_adapter$mem_master_arid),
							      .mem_master_araddr(mmio_axi4_adapter$mem_master_araddr),
							      .mem_master_arlen(mmio_axi4_adapter$mem_master_arlen),
							      .mem_master_arsize(mmio_axi4_adapter$mem_master_arsize),
							      .mem_master_arburst(mmio_axi4_adapter$mem_master_arburst),
							      .mem_master_arlock(mmio_axi4_adapter$mem_master_arlock),
							      .mem_master_arcache(mmio_axi4_adapter$mem_master_arcache),
							      .mem_master_arprot(mmio_axi4_adapter$mem_master_arprot),
							      .mem_master_arqos(mmio_axi4_adapter$mem_master_arqos),
							      .mem_master_arregion(mmio_axi4_adapter$mem_master_arregion),
							      .mem_master_rready(mmio_axi4_adapter$mem_master_rready),
							      .mv_write_error());
  // submodule propDstData_0_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) propDstData_0_dummy2_0(.CLK(CLK),
								 .D_IN(propDstData_0_dummy2_0$D_IN),
								 .EN(propDstData_0_dummy2_0$EN),
								 .Q_OUT());
  // submodule propDstData_0_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) propDstData_0_dummy2_1(.CLK(CLK),
								 .D_IN(propDstData_0_dummy2_1$D_IN),
								 .EN(propDstData_0_dummy2_1$EN),
								 .Q_OUT(propDstData_0_dummy2_1$Q_OUT));
  // submodule propDstData_1_0_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) propDstData_1_0_dummy2_0(.CLK(CLK),
								   .D_IN(propDstData_1_0_dummy2_0$D_IN),
								   .EN(propDstData_1_0_dummy2_0$EN),
								   .Q_OUT());
  // submodule propDstData_1_0_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) propDstData_1_0_dummy2_1(.CLK(CLK),
								   .D_IN(propDstData_1_0_dummy2_1$D_IN),
								   .EN(propDstData_1_0_dummy2_1$EN),
								   .Q_OUT(propDstData_1_0_dummy2_1$Q_OUT));
  // submodule propDstData_1_1_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) propDstData_1_1_dummy2_0(.CLK(CLK),
								   .D_IN(propDstData_1_1_dummy2_0$D_IN),
								   .EN(propDstData_1_1_dummy2_0$EN),
								   .Q_OUT());
  // submodule propDstData_1_1_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) propDstData_1_1_dummy2_1(.CLK(CLK),
								   .D_IN(propDstData_1_1_dummy2_1$D_IN),
								   .EN(propDstData_1_1_dummy2_1$EN),
								   .Q_OUT(propDstData_1_1_dummy2_1$Q_OUT));
  // submodule propDstData_1_2_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) propDstData_1_2_dummy2_0(.CLK(CLK),
								   .D_IN(propDstData_1_2_dummy2_0$D_IN),
								   .EN(propDstData_1_2_dummy2_0$EN),
								   .Q_OUT());
  // submodule propDstData_1_2_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) propDstData_1_2_dummy2_1(.CLK(CLK),
								   .D_IN(propDstData_1_2_dummy2_1$D_IN),
								   .EN(propDstData_1_2_dummy2_1$EN),
								   .Q_OUT(propDstData_1_2_dummy2_1$Q_OUT));
  // submodule propDstData_1_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) propDstData_1_dummy2_0(.CLK(CLK),
								 .D_IN(propDstData_1_dummy2_0$D_IN),
								 .EN(propDstData_1_dummy2_0$EN),
								 .Q_OUT());
  // submodule propDstData_1_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) propDstData_1_dummy2_1(.CLK(CLK),
								 .D_IN(propDstData_1_dummy2_1$D_IN),
								 .EN(propDstData_1_dummy2_1$EN),
								 .Q_OUT(propDstData_1_dummy2_1$Q_OUT));
  // submodule propDstData_2_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) propDstData_2_dummy2_0(.CLK(CLK),
								 .D_IN(propDstData_2_dummy2_0$D_IN),
								 .EN(propDstData_2_dummy2_0$EN),
								 .Q_OUT());
  // submodule propDstData_2_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) propDstData_2_dummy2_1(.CLK(CLK),
								 .D_IN(propDstData_2_dummy2_1$D_IN),
								 .EN(propDstData_2_dummy2_1$EN),
								 .Q_OUT(propDstData_2_dummy2_1$Q_OUT));
  // submodule propDstIdx_0_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) propDstIdx_0_dummy2_0(.CLK(CLK),
								.D_IN(propDstIdx_0_dummy2_0$D_IN),
								.EN(propDstIdx_0_dummy2_0$EN),
								.Q_OUT(propDstIdx_0_dummy2_0$Q_OUT));
  // submodule propDstIdx_0_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) propDstIdx_0_dummy2_1(.CLK(CLK),
								.D_IN(propDstIdx_0_dummy2_1$D_IN),
								.EN(propDstIdx_0_dummy2_1$EN),
								.Q_OUT(propDstIdx_0_dummy2_1$Q_OUT));
  // submodule propDstIdx_1_0_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) propDstIdx_1_0_dummy2_0(.CLK(CLK),
								  .D_IN(propDstIdx_1_0_dummy2_0$D_IN),
								  .EN(propDstIdx_1_0_dummy2_0$EN),
								  .Q_OUT(propDstIdx_1_0_dummy2_0$Q_OUT));
  // submodule propDstIdx_1_0_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) propDstIdx_1_0_dummy2_1(.CLK(CLK),
								  .D_IN(propDstIdx_1_0_dummy2_1$D_IN),
								  .EN(propDstIdx_1_0_dummy2_1$EN),
								  .Q_OUT(propDstIdx_1_0_dummy2_1$Q_OUT));
  // submodule propDstIdx_1_1_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) propDstIdx_1_1_dummy2_0(.CLK(CLK),
								  .D_IN(propDstIdx_1_1_dummy2_0$D_IN),
								  .EN(propDstIdx_1_1_dummy2_0$EN),
								  .Q_OUT(propDstIdx_1_1_dummy2_0$Q_OUT));
  // submodule propDstIdx_1_1_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) propDstIdx_1_1_dummy2_1(.CLK(CLK),
								  .D_IN(propDstIdx_1_1_dummy2_1$D_IN),
								  .EN(propDstIdx_1_1_dummy2_1$EN),
								  .Q_OUT(propDstIdx_1_1_dummy2_1$Q_OUT));
  // submodule propDstIdx_1_2_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) propDstIdx_1_2_dummy2_0(.CLK(CLK),
								  .D_IN(propDstIdx_1_2_dummy2_0$D_IN),
								  .EN(propDstIdx_1_2_dummy2_0$EN),
								  .Q_OUT(propDstIdx_1_2_dummy2_0$Q_OUT));
  // submodule propDstIdx_1_2_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) propDstIdx_1_2_dummy2_1(.CLK(CLK),
								  .D_IN(propDstIdx_1_2_dummy2_1$D_IN),
								  .EN(propDstIdx_1_2_dummy2_1$EN),
								  .Q_OUT(propDstIdx_1_2_dummy2_1$Q_OUT));
  // submodule propDstIdx_1_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) propDstIdx_1_dummy2_0(.CLK(CLK),
								.D_IN(propDstIdx_1_dummy2_0$D_IN),
								.EN(propDstIdx_1_dummy2_0$EN),
								.Q_OUT(propDstIdx_1_dummy2_0$Q_OUT));
  // submodule propDstIdx_1_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) propDstIdx_1_dummy2_1(.CLK(CLK),
								.D_IN(propDstIdx_1_dummy2_1$D_IN),
								.EN(propDstIdx_1_dummy2_1$EN),
								.Q_OUT(propDstIdx_1_dummy2_1$Q_OUT));
  // submodule propDstIdx_2_dummy2_0
  RevertReg #(.width(32'd1), .init(1'd1)) propDstIdx_2_dummy2_0(.CLK(CLK),
								.D_IN(propDstIdx_2_dummy2_0$D_IN),
								.EN(propDstIdx_2_dummy2_0$EN),
								.Q_OUT(propDstIdx_2_dummy2_0$Q_OUT));
  // submodule propDstIdx_2_dummy2_1
  RevertReg #(.width(32'd1), .init(1'd1)) propDstIdx_2_dummy2_1(.CLK(CLK),
								.D_IN(propDstIdx_2_dummy2_1$D_IN),
								.EN(propDstIdx_2_dummy2_1$EN),
								.Q_OUT(propDstIdx_2_dummy2_1$Q_OUT));
  // rule RL_mkConnectionGetPut_1
  assign CAN_FIRE_RL_mkConnectionGetPut_1 = llc$RDY_dma_respLd_deq ;
  assign WILL_FIRE_RL_mkConnectionGetPut_1 = llc$RDY_dma_respLd_deq ;
  // rule RL_mkConnectionGetPut_2
  assign CAN_FIRE_RL_mkConnectionGetPut_2 = llc$RDY_dma_respSt_deq ;
  assign WILL_FIRE_RL_mkConnectionGetPut_2 = llc$RDY_dma_respSt_deq ;
  // rule RL_ClientServerRequest
  assign CAN_FIRE_RL_ClientServerRequest =
	     d_mmu_cache$RDY_imem_ptw_server_request_put &&
	     i_mmu_cache$RDY_ptw_client_request_get ;
  assign WILL_FIRE_RL_ClientServerRequest = CAN_FIRE_RL_ClientServerRequest ;
  // rule RL_ClientServerResponse
  assign CAN_FIRE_RL_ClientServerResponse =
	     d_mmu_cache$RDY_imem_ptw_server_response_get &&
	     i_mmu_cache$RDY_ptw_client_response_put ;
  assign WILL_FIRE_RL_ClientServerResponse =
	     CAN_FIRE_RL_ClientServerResponse ;
  // rule RL_mkConnectionGetPut_3
  assign CAN_FIRE_RL_mkConnectionGetPut_3 =
	     d_mmu_cache$RDY_imem_pte_writeback_p_put &&
	     i_mmu_cache$RDY_pte_writeback_g_get ;
  assign WILL_FIRE_RL_mkConnectionGetPut_3 =
	     CAN_FIRE_RL_mkConnectionGetPut_3 ;
  // rule RL_srcPropose
  assign CAN_FIRE_RL_srcPropose =
	     i_mmu_cache$RDY_l1_to_l2_client_request_deq &&
	     i_mmu_cache$RDY_l1_to_l2_client_request_first &&
	     (!propDstIdx_0_dummy2_0$Q_OUT || !propDstIdx_0_dummy2_1$Q_OUT ||
	      !propDstIdx_0_rl) ;
  assign WILL_FIRE_RL_srcPropose = CAN_FIRE_RL_srcPropose ;
  // rule RL_srcPropose_1
  assign CAN_FIRE_RL_srcPropose_1 =
	     d_mmu_cache$RDY_l1_to_l2_client_request_deq &&
	     d_mmu_cache$RDY_l1_to_l2_client_request_first &&
	     (!propDstIdx_1_dummy2_0$Q_OUT || !propDstIdx_1_dummy2_1$Q_OUT ||
	      !propDstIdx_1_rl) ;
  assign WILL_FIRE_RL_srcPropose_1 = CAN_FIRE_RL_srcPropose_1 ;
  // rule RL_srcPropose_2
  assign CAN_FIRE_RL_srcPropose_2 =
	     dma_cache$RDY_l1_to_l2_client_request_deq &&
	     dma_cache$RDY_l1_to_l2_client_request_first &&
	     (!propDstIdx_2_dummy2_0$Q_OUT || !propDstIdx_2_dummy2_1$Q_OUT ||
	      !propDstIdx_2_rl) ;
  assign WILL_FIRE_RL_srcPropose_2 = CAN_FIRE_RL_srcPropose_2 ;
  // rule RL_dstSelectSrc
  assign CAN_FIRE_RL_dstSelectSrc = 1'd1 ;
  assign WILL_FIRE_RL_dstSelectSrc = 1'd1 ;
  // rule RL_doEnq
  assign CAN_FIRE_RL_doEnq =
	     llc$RDY_to_child_rqFromC_enq &&
	     enqDst_0_dummy2_1_read__31_AND_IF_enqDst_0_lat_ETC___d368 ;
  assign WILL_FIRE_RL_doEnq = CAN_FIRE_RL_doEnq ;
  // rule RL_srcPropose_3
  assign CAN_FIRE_RL_srcPropose_3 =
	     i_mmu_cache$RDY_l2_to_l1_server_response_deq &&
	     i_mmu_cache$RDY_l2_to_l1_server_response_first &&
	     (!propDstIdx_1_0_dummy2_0$Q_OUT ||
	      !propDstIdx_1_0_dummy2_1$Q_OUT ||
	      !propDstIdx_1_0_rl) ;
  assign WILL_FIRE_RL_srcPropose_3 = CAN_FIRE_RL_srcPropose_3 ;
  // rule RL_srcPropose_4
  assign CAN_FIRE_RL_srcPropose_4 =
	     d_mmu_cache$RDY_l2_to_l1_server_response_deq &&
	     d_mmu_cache$RDY_l2_to_l1_server_response_first &&
	     (!propDstIdx_1_1_dummy2_0$Q_OUT ||
	      !propDstIdx_1_1_dummy2_1$Q_OUT ||
	      !propDstIdx_1_1_rl) ;
  assign WILL_FIRE_RL_srcPropose_4 = CAN_FIRE_RL_srcPropose_4 ;
  // rule RL_srcPropose_5
  assign CAN_FIRE_RL_srcPropose_5 =
	     dma_cache$RDY_l2_to_l1_server_response_deq &&
	     dma_cache$RDY_l2_to_l1_server_response_first &&
	     (!propDstIdx_1_2_dummy2_0$Q_OUT ||
	      !propDstIdx_1_2_dummy2_1$Q_OUT ||
	      !propDstIdx_1_2_rl) ;
  assign WILL_FIRE_RL_srcPropose_5 = CAN_FIRE_RL_srcPropose_5 ;
  // rule RL_dstSelectSrc_1
  assign CAN_FIRE_RL_dstSelectSrc_1 = 1'd1 ;
  assign WILL_FIRE_RL_dstSelectSrc_1 = 1'd1 ;
  // rule RL_doEnq_1
  assign CAN_FIRE_RL_doEnq_1 =
	     llc$RDY_to_child_rsFromC_enq &&
	     enqDst_1_0_dummy2_1_read__64_AND_IF_enqDst_1_0_ETC___d664 ;
  assign WILL_FIRE_RL_doEnq_1 = CAN_FIRE_RL_doEnq_1 ;
  // rule RL_sendPRq
  assign CAN_FIRE_RL_sendPRq =
	     i_mmu_cache$RDY_l2_to_l1_server_request_enq &&
	     llc$RDY_to_child_toC_first &&
	     llc$RDY_to_child_toC_deq &&
	     !llc$to_child_toC_first[584] &&
	     llc$to_child_toC_first[1:0] == 2'd0 ;
  assign WILL_FIRE_RL_sendPRq = CAN_FIRE_RL_sendPRq ;
  // rule RL_sendPRs
  assign CAN_FIRE_RL_sendPRs =
	     i_mmu_cache$RDY_l1_to_l2_client_response_enq &&
	     llc$RDY_to_child_toC_first &&
	     llc$RDY_to_child_toC_deq &&
	     llc$to_child_toC_first[584] &&
	     llc$to_child_toC_first[517:516] == 2'd0 ;
  assign WILL_FIRE_RL_sendPRs = CAN_FIRE_RL_sendPRs ;
  // rule RL_sendPRq_1
  assign CAN_FIRE_RL_sendPRq_1 =
	     d_mmu_cache$RDY_l2_to_l1_server_request_enq &&
	     llc$RDY_to_child_toC_first &&
	     llc$RDY_to_child_toC_deq &&
	     !llc$to_child_toC_first[584] &&
	     llc$to_child_toC_first[1:0] == 2'd1 ;
  assign WILL_FIRE_RL_sendPRq_1 = CAN_FIRE_RL_sendPRq_1 ;
  // rule RL_sendPRs_1
  assign CAN_FIRE_RL_sendPRs_1 =
	     d_mmu_cache$RDY_l1_to_l2_client_response_enq &&
	     llc$RDY_to_child_toC_first &&
	     llc$RDY_to_child_toC_deq &&
	     llc$to_child_toC_first[584] &&
	     llc$to_child_toC_first[517:516] == 2'd1 ;
  assign WILL_FIRE_RL_sendPRs_1 = CAN_FIRE_RL_sendPRs_1 ;
  // rule RL_sendPRq_2
  assign CAN_FIRE_RL_sendPRq_2 =
	     dma_cache$RDY_l2_to_l1_server_request_enq &&
	     llc$RDY_to_child_toC_first &&
	     llc$RDY_to_child_toC_deq &&
	     !llc$to_child_toC_first[584] &&
	     llc$to_child_toC_first[1:0] == 2'd2 ;
  assign WILL_FIRE_RL_sendPRq_2 = CAN_FIRE_RL_sendPRq_2 ;
  // rule RL_sendPRs_2
  assign CAN_FIRE_RL_sendPRs_2 =
	     dma_cache$RDY_l1_to_l2_client_response_enq &&
	     llc$RDY_to_child_toC_first &&
	     llc$RDY_to_child_toC_deq &&
	     llc$to_child_toC_first[584] &&
	     llc$to_child_toC_first[517:516] == 2'd2 ;
  assign WILL_FIRE_RL_sendPRs_2 = CAN_FIRE_RL_sendPRs_2 ;
  // rule RL_ClientServerRequest_1
  assign CAN_FIRE_RL_ClientServerRequest_1 =
	     mmio_axi4_adapter$RDY_v_mmio_server_0_request_put &&
	     i_mmu_cache$RDY_mmio_client_request_get ;
  assign WILL_FIRE_RL_ClientServerRequest_1 =
	     CAN_FIRE_RL_ClientServerRequest_1 ;
  // rule RL_ClientServerResponse_1
  assign CAN_FIRE_RL_ClientServerResponse_1 =
	     mmio_axi4_adapter$RDY_v_mmio_server_0_response_get &&
	     i_mmu_cache$RDY_mmio_client_response_put ;
  assign WILL_FIRE_RL_ClientServerResponse_1 =
	     CAN_FIRE_RL_ClientServerResponse_1 ;
  // rule RL_ClientServerRequest_2
  assign CAN_FIRE_RL_ClientServerRequest_2 =
	     mmio_axi4_adapter$RDY_v_mmio_server_1_request_put &&
	     d_mmu_cache$RDY_mmio_client_request_get ;
  assign WILL_FIRE_RL_ClientServerRequest_2 =
	     CAN_FIRE_RL_ClientServerRequest_2 ;
  // rule RL_ClientServerResponse_2
  assign CAN_FIRE_RL_ClientServerResponse_2 =
	     mmio_axi4_adapter$RDY_v_mmio_server_1_response_get &&
	     d_mmu_cache$RDY_mmio_client_response_put ;
  assign WILL_FIRE_RL_ClientServerResponse_2 =
	     CAN_FIRE_RL_ClientServerResponse_2 ;
  // rule RL_ClientServerRequest_3
  assign CAN_FIRE_RL_ClientServerRequest_3 =
	     mmio_axi4_adapter$RDY_v_mmio_server_2_request_put &&
	     dma_cache$RDY_mmio_client_request_get ;
  assign WILL_FIRE_RL_ClientServerRequest_3 =
	     CAN_FIRE_RL_ClientServerRequest_3 ;
  // rule RL_ClientServerResponse_3
  assign CAN_FIRE_RL_ClientServerResponse_3 =
	     mmio_axi4_adapter$RDY_v_mmio_server_2_response_get &&
	     dma_cache$RDY_mmio_client_response_put ;
  assign WILL_FIRE_RL_ClientServerResponse_3 =
	     CAN_FIRE_RL_ClientServerResponse_3 ;
  // rule RL_rl_reset
  assign CAN_FIRE_RL_rl_reset = rg_state == 2'd0 ;
  assign WILL_FIRE_RL_rl_reset = rg_state == 2'd0 ;
  // rule RL_rl_reset_complete
  assign CAN_FIRE_RL_rl_reset_complete = MUX_rg_state$write_1__SEL_3 ;
  assign WILL_FIRE_RL_rl_reset_complete = MUX_rg_state$write_1__SEL_3 ;
  // rule RL_llc_axi4_adapter_rl_handle_read_rsps
  assign CAN_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps =
	     llc_axi4_adapter_master_xactor_crg_rd_data_full &&
	     (llc_axi4_adapter_rg_rd_rsp_beat != 3'd7 ||
	      llc$RDY_to_mem_rsFromM_enq &&
	      llc_axi4_adapter_f_pending_reads$EMPTY_N) ;
  assign WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps ;
  // rule RL_llc_axi4_adapter_rl_handle_write_req
  assign CAN_FIRE_RL_llc_axi4_adapter_rl_handle_write_req =
	     NOT_llc_axi4_adapter_master_xactor_crg_wr_addr_ETC___d80 &&
	     llc$to_mem_toM_first[640] &&
	     llc_axi4_adapter_rg_ddr4_ready ;
  assign WILL_FIRE_RL_llc_axi4_adapter_rl_handle_write_req =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_handle_write_req ;
  // rule RL_llc_axi4_adapter_rl_handle_read_req
  assign CAN_FIRE_RL_llc_axi4_adapter_rl_handle_read_req =
	     !llc_axi4_adapter_master_xactor_crg_rd_addr_full$port2__read &&
	     llc$RDY_to_mem_toM_first &&
	     (llc_axi4_adapter_rg_rd_req_beat != 3'd0 ||
	      llc_axi4_adapter_f_pending_reads$FULL_N) &&
	     (llc_axi4_adapter_rg_rd_req_beat != 3'd7 ||
	      llc$RDY_to_mem_toM_deq) &&
	     !llc$to_mem_toM_first[640] &&
	     b__h13463 == 4'd0 &&
	     llc_axi4_adapter_rg_ddr4_ready ;
  assign WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_req =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_handle_read_req ;
  // rule RL_llc_axi4_adapter_rl_discard_write_rsp
  assign CAN_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp =
	     b__h13463 != 4'd0 &&
	     llc_axi4_adapter_master_xactor_crg_wr_resp_full &&
	     (llc_axi4_adapter_rg_wr_rsp_beat != 3'd7 ||
	      llc_axi4_adapter_f_pending_writes$EMPTY_N) ;
  assign WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp ;
  // rule RL_propDstIdx_0_canon
  assign CAN_FIRE_RL_propDstIdx_0_canon = 1'd1 ;
  assign WILL_FIRE_RL_propDstIdx_0_canon = 1'd1 ;
  // rule RL_propDstIdx_1_canon
  assign CAN_FIRE_RL_propDstIdx_1_canon = 1'd1 ;
  assign WILL_FIRE_RL_propDstIdx_1_canon = 1'd1 ;
  // rule RL_propDstIdx_2_canon
  assign CAN_FIRE_RL_propDstIdx_2_canon = 1'd1 ;
  assign WILL_FIRE_RL_propDstIdx_2_canon = 1'd1 ;
  // rule RL_propDstData_0_canon
  assign CAN_FIRE_RL_propDstData_0_canon = 1'd1 ;
  assign WILL_FIRE_RL_propDstData_0_canon = 1'd1 ;
  // rule RL_propDstData_1_canon
  assign CAN_FIRE_RL_propDstData_1_canon = 1'd1 ;
  assign WILL_FIRE_RL_propDstData_1_canon = 1'd1 ;
  // rule RL_propDstData_2_canon
  assign CAN_FIRE_RL_propDstData_2_canon = 1'd1 ;
  assign WILL_FIRE_RL_propDstData_2_canon = 1'd1 ;
  // rule RL_enqDst_0_canon
  assign CAN_FIRE_RL_enqDst_0_canon = 1'd1 ;
  assign WILL_FIRE_RL_enqDst_0_canon = 1'd1 ;
  // rule RL_propDstIdx_1_0_canon
  assign CAN_FIRE_RL_propDstIdx_1_0_canon = 1'd1 ;
  assign WILL_FIRE_RL_propDstIdx_1_0_canon = 1'd1 ;
  // rule RL_propDstIdx_1_1_canon
  assign CAN_FIRE_RL_propDstIdx_1_1_canon = 1'd1 ;
  assign WILL_FIRE_RL_propDstIdx_1_1_canon = 1'd1 ;
  // rule RL_propDstIdx_1_2_canon
  assign CAN_FIRE_RL_propDstIdx_1_2_canon = 1'd1 ;
  assign WILL_FIRE_RL_propDstIdx_1_2_canon = 1'd1 ;
  // rule RL_propDstData_1_0_canon
  assign CAN_FIRE_RL_propDstData_1_0_canon = 1'd1 ;
  assign WILL_FIRE_RL_propDstData_1_0_canon = 1'd1 ;
  // rule RL_propDstData_1_1_canon
  assign CAN_FIRE_RL_propDstData_1_1_canon = 1'd1 ;
  assign WILL_FIRE_RL_propDstData_1_1_canon = 1'd1 ;
  // rule RL_propDstData_1_2_canon
  assign CAN_FIRE_RL_propDstData_1_2_canon = 1'd1 ;
  assign WILL_FIRE_RL_propDstData_1_2_canon = 1'd1 ;
  // rule RL_enqDst_1_0_canon
  assign CAN_FIRE_RL_enqDst_1_0_canon = 1'd1 ;
  assign WILL_FIRE_RL_enqDst_1_0_canon = 1'd1 ;
  // inputs to muxes for submodule ports
  assign MUX_rg_state$write_1__SEL_3 =
	     f_reset_rsps$FULL_N && rg_state == 2'd1 ;
  // inlined wires
  assign propDstIdx_0_lat_1$whas =
	     NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253 &&
	     x__h45600 == 2'd0 ;
  assign propDstIdx_1_lat_1$whas =
	     NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253 &&
	     x__h45600 == 2'd1 ;
  assign propDstIdx_2_lat_1$whas =
	     NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253 &&
	     x__h45600 == 2'd2 ;
  assign propDstData_0_lat_0$wget =
	     { i_mmu_cache$l1_to_l2_client_request_first, 5'h08 } ;
  assign propDstData_1_lat_0$wget =
	     { d_mmu_cache$l1_to_l2_client_request_first, 5'h09 } ;
  assign propDstData_2_lat_0$wget =
	     { dma_cache$l1_to_l2_client_request_first, 5'h0A } ;
  assign enqDst_0_lat_0$wget =
	     { 1'd1,
	       CASE_x5600_0_n__read_addr5824_1_n__read_addr59_ETC__q4,
	       SEL_ARR_IF_propDstData_0_dummy2_1_read__54_THE_ETC___d346 } ;
  assign propDstIdx_1_0_lat_1$whas =
	     NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486 &&
	     x__h71624 == 2'd0 ;
  assign propDstIdx_1_1_lat_1$whas =
	     NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486 &&
	     x__h71624 == 2'd1 ;
  assign propDstIdx_1_2_lat_1$whas =
	     NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486 &&
	     x__h71624 == 2'd2 ;
  assign propDstData_1_0_lat_0$wget =
	     { i_mmu_cache$l2_to_l1_server_response_first, 2'd0 } ;
  assign propDstData_1_1_lat_0$wget =
	     { d_mmu_cache$l2_to_l1_server_response_first, 2'd1 } ;
  assign propDstData_1_2_lat_0$wget =
	     { dma_cache$l2_to_l1_server_response_first, 2'd2 } ;
  assign enqDst_1_0_lat_0$wget =
	     { 1'd1,
	       CASE_x1624_0_n__read_addr1844_1_n__read_addr19_ETC__q15,
	       SEL_ARR_IF_propDstData_1_0_dummy2_1_read__87_T_ETC___d642 } ;
  assign llc_axi4_adapter_master_xactor_crg_wr_addr_full$EN_port1__write =
	     llc_axi4_adapter_master_xactor_crg_wr_addr_full &&
	     mem_master_awready ;
  assign llc_axi4_adapter_master_xactor_crg_wr_addr_full$port2__read =
	     !llc_axi4_adapter_master_xactor_crg_wr_addr_full$EN_port1__write &&
	     llc_axi4_adapter_master_xactor_crg_wr_addr_full ;
  assign llc_axi4_adapter_master_xactor_crg_wr_addr_full$port3__read =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_handle_write_req ||
	     llc_axi4_adapter_master_xactor_crg_wr_addr_full$port2__read ;
  assign llc_axi4_adapter_master_xactor_crg_wr_data_full$EN_port1__write =
	     llc_axi4_adapter_master_xactor_crg_wr_data_full &&
	     mem_master_wready ;
  assign llc_axi4_adapter_master_xactor_crg_wr_data_full$port2__read =
	     !llc_axi4_adapter_master_xactor_crg_wr_data_full$EN_port1__write &&
	     llc_axi4_adapter_master_xactor_crg_wr_data_full ;
  assign llc_axi4_adapter_master_xactor_crg_wr_data_full$port3__read =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_handle_write_req ||
	     llc_axi4_adapter_master_xactor_crg_wr_data_full$port2__read ;
  assign llc_axi4_adapter_master_xactor_crg_wr_resp_full$port2__read =
	     !CAN_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp &&
	     llc_axi4_adapter_master_xactor_crg_wr_resp_full ;
  assign llc_axi4_adapter_master_xactor_crg_wr_resp_full$EN_port2__write =
	     mem_master_bvalid &&
	     !llc_axi4_adapter_master_xactor_crg_wr_resp_full$port2__read ;
  assign llc_axi4_adapter_master_xactor_crg_wr_resp_full$port3__read =
	     llc_axi4_adapter_master_xactor_crg_wr_resp_full$EN_port2__write ||
	     llc_axi4_adapter_master_xactor_crg_wr_resp_full$port2__read ;
  assign llc_axi4_adapter_master_xactor_crg_rd_addr_full$EN_port1__write =
	     llc_axi4_adapter_master_xactor_crg_rd_addr_full &&
	     mem_master_arready ;
  assign llc_axi4_adapter_master_xactor_crg_rd_addr_full$port2__read =
	     !llc_axi4_adapter_master_xactor_crg_rd_addr_full$EN_port1__write &&
	     llc_axi4_adapter_master_xactor_crg_rd_addr_full ;
  assign llc_axi4_adapter_master_xactor_crg_rd_addr_full$port3__read =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_handle_read_req ||
	     llc_axi4_adapter_master_xactor_crg_rd_addr_full$port2__read ;
  assign llc_axi4_adapter_master_xactor_crg_rd_data_full$port2__read =
	     !CAN_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	     llc_axi4_adapter_master_xactor_crg_rd_data_full ;
  assign llc_axi4_adapter_master_xactor_crg_rd_data_full$EN_port2__write =
	     mem_master_rvalid &&
	     !llc_axi4_adapter_master_xactor_crg_rd_data_full$port2__read ;
  assign llc_axi4_adapter_master_xactor_crg_rd_data_full$port3__read =
	     llc_axi4_adapter_master_xactor_crg_rd_data_full$EN_port2__write ||
	     llc_axi4_adapter_master_xactor_crg_rd_data_full$port2__read ;
  assign llc_axi4_adapter_ctr_wr_rsps_pending_crg$port0__write_1 =
	     llc_axi4_adapter_ctr_wr_rsps_pending_crg + 4'd1 ;
  assign llc_axi4_adapter_ctr_wr_rsps_pending_crg$port1__write_1 =
	     b__h13463 - 4'd1 ;
  assign llc_axi4_adapter_ctr_wr_rsps_pending_crg$port2__read =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp ?
	       llc_axi4_adapter_ctr_wr_rsps_pending_crg$port1__write_1 :
	       b__h13463 ;
  // register cfg_verbosity
  assign cfg_verbosity$D_IN = 4'h0 ;
  assign cfg_verbosity$EN = 1'b0 ;
  // register enqDst_0_rl
  assign enqDst_0_rl$D_IN =
	     CAN_FIRE_RL_doEnq ?
	       75'h2AAAAAAAAAAAAAAAAAA :
	       (NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253 ?
		  enqDst_0_lat_0$wget :
		  enqDst_0_rl) ;
  assign enqDst_0_rl$EN = 1'd1 ;
  // register enqDst_1_0_rl
  assign enqDst_1_0_rl$D_IN =
	     CAN_FIRE_RL_doEnq_1 ?
	       582'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA :
	       (NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486 ?
		  enqDst_1_0_lat_0$wget :
		  enqDst_1_0_rl) ;
  assign enqDst_1_0_rl$EN = 1'd1 ;
  // register llc_axi4_adapter_ctr_wr_rsps_pending_crg
  assign llc_axi4_adapter_ctr_wr_rsps_pending_crg$D_IN =
	     llc_axi4_adapter_ctr_wr_rsps_pending_crg$port2__read ;
  assign llc_axi4_adapter_ctr_wr_rsps_pending_crg$EN = 1'b1 ;
  // register llc_axi4_adapter_master_xactor_crg_rd_addr_full
  assign llc_axi4_adapter_master_xactor_crg_rd_addr_full$D_IN =
	     llc_axi4_adapter_master_xactor_crg_rd_addr_full$port3__read ;
  assign llc_axi4_adapter_master_xactor_crg_rd_addr_full$EN = 1'b1 ;
  // register llc_axi4_adapter_master_xactor_crg_rd_data_full
  assign llc_axi4_adapter_master_xactor_crg_rd_data_full$D_IN =
	     llc_axi4_adapter_master_xactor_crg_rd_data_full$port3__read ;
  assign llc_axi4_adapter_master_xactor_crg_rd_data_full$EN = 1'b1 ;
  // register llc_axi4_adapter_master_xactor_crg_wr_addr_full
  assign llc_axi4_adapter_master_xactor_crg_wr_addr_full$D_IN =
	     llc_axi4_adapter_master_xactor_crg_wr_addr_full$port3__read ;
  assign llc_axi4_adapter_master_xactor_crg_wr_addr_full$EN = 1'b1 ;
  // register llc_axi4_adapter_master_xactor_crg_wr_data_full
  assign llc_axi4_adapter_master_xactor_crg_wr_data_full$D_IN =
	     llc_axi4_adapter_master_xactor_crg_wr_data_full$port3__read ;
  assign llc_axi4_adapter_master_xactor_crg_wr_data_full$EN = 1'b1 ;
  // register llc_axi4_adapter_master_xactor_crg_wr_resp_full
  assign llc_axi4_adapter_master_xactor_crg_wr_resp_full$D_IN =
	     llc_axi4_adapter_master_xactor_crg_wr_resp_full$port3__read ;
  assign llc_axi4_adapter_master_xactor_crg_wr_resp_full$EN = 1'b1 ;
  // register llc_axi4_adapter_master_xactor_rg_rd_addr
  assign llc_axi4_adapter_master_xactor_rg_rd_addr$D_IN =
	     { 16'd0, mem_req_rd_addr_araddr__h13577, 29'd851968 } ;
  assign llc_axi4_adapter_master_xactor_rg_rd_addr$EN =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_handle_read_req ;
  // register llc_axi4_adapter_master_xactor_rg_rd_data
  assign llc_axi4_adapter_master_xactor_rg_rd_data$D_IN =
	     { mem_master_rid,
	       mem_master_rdata,
	       mem_master_rresp,
	       mem_master_rlast } ;
  assign llc_axi4_adapter_master_xactor_rg_rd_data$EN = 1'd1 ;
  // register llc_axi4_adapter_master_xactor_rg_wr_addr
  assign llc_axi4_adapter_master_xactor_rg_wr_addr$D_IN =
	     { 16'd0, mem_req_wr_addr_awaddr__h15613, 29'd851968 } ;
  assign llc_axi4_adapter_master_xactor_rg_wr_addr$EN =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_handle_write_req ;
  // register llc_axi4_adapter_master_xactor_rg_wr_data
  assign llc_axi4_adapter_master_xactor_rg_wr_data$D_IN =
	     { data64__h15525, strb8__h15526, 1'd1 } ;
  assign llc_axi4_adapter_master_xactor_rg_wr_data$EN =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_handle_write_req ;
  // register llc_axi4_adapter_master_xactor_rg_wr_resp
  assign llc_axi4_adapter_master_xactor_rg_wr_resp$D_IN =
	     { mem_master_bid, mem_master_bresp } ;
  assign llc_axi4_adapter_master_xactor_rg_wr_resp$EN =
	     mem_master_bvalid &&
	     !llc_axi4_adapter_master_xactor_crg_wr_resp_full$port2__read ;
  // register llc_axi4_adapter_rg_AXI4_error
  assign llc_axi4_adapter_rg_AXI4_error$D_IN = 1'd1 ;
  assign llc_axi4_adapter_rg_AXI4_error$EN =
	     WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp &&
	     llc_axi4_adapter_master_xactor_rg_wr_resp[1:0] != 2'b0 ;
  // register llc_axi4_adapter_rg_cline
  assign llc_axi4_adapter_rg_cline$D_IN = new_cline__h14098 ;
  assign llc_axi4_adapter_rg_cline$EN =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps ;
  // register llc_axi4_adapter_rg_ddr4_ready
  assign llc_axi4_adapter_rg_ddr4_ready$D_IN = 1'd1 ;
  assign llc_axi4_adapter_rg_ddr4_ready$EN = EN_ma_ddr4_ready ;
  // register llc_axi4_adapter_rg_rd_req_beat
  assign llc_axi4_adapter_rg_rd_req_beat$D_IN =
	     llc_axi4_adapter_rg_rd_req_beat + 3'd1 ;
  assign llc_axi4_adapter_rg_rd_req_beat$EN =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_handle_read_req ;
  // register llc_axi4_adapter_rg_rd_rsp_beat
  assign llc_axi4_adapter_rg_rd_rsp_beat$D_IN =
	     llc_axi4_adapter_rg_rd_rsp_beat + 3'd1 ;
  assign llc_axi4_adapter_rg_rd_rsp_beat$EN =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps ;
  // register llc_axi4_adapter_rg_wr_req_beat
  assign llc_axi4_adapter_rg_wr_req_beat$D_IN =
	     llc_axi4_adapter_rg_wr_req_beat + 3'd1 ;
  assign llc_axi4_adapter_rg_wr_req_beat$EN =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_handle_write_req ;
  // register llc_axi4_adapter_rg_wr_rsp_beat
  assign llc_axi4_adapter_rg_wr_rsp_beat$D_IN =
	     llc_axi4_adapter_rg_wr_rsp_beat + 3'd1 ;
  assign llc_axi4_adapter_rg_wr_rsp_beat$EN =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp ;
  // register propDstData_0_rl
  assign propDstData_0_rl$D_IN =
	     CAN_FIRE_RL_srcPropose ?
	       propDstData_0_lat_0$wget :
	       propDstData_0_rl ;
  assign propDstData_0_rl$EN = 1'd1 ;
  // register propDstData_1_0_rl
  assign propDstData_1_0_rl$D_IN =
	     CAN_FIRE_RL_srcPropose_3 ?
	       propDstData_1_0_lat_0$wget :
	       propDstData_1_0_rl ;
  assign propDstData_1_0_rl$EN = 1'd1 ;
  // register propDstData_1_1_rl
  assign propDstData_1_1_rl$D_IN =
	     CAN_FIRE_RL_srcPropose_4 ?
	       propDstData_1_1_lat_0$wget :
	       propDstData_1_1_rl ;
  assign propDstData_1_1_rl$EN = 1'd1 ;
  // register propDstData_1_2_rl
  assign propDstData_1_2_rl$D_IN =
	     CAN_FIRE_RL_srcPropose_5 ?
	       propDstData_1_2_lat_0$wget :
	       propDstData_1_2_rl ;
  assign propDstData_1_2_rl$EN = 1'd1 ;
  // register propDstData_1_rl
  assign propDstData_1_rl$D_IN =
	     CAN_FIRE_RL_srcPropose_1 ?
	       propDstData_1_lat_0$wget :
	       propDstData_1_rl ;
  assign propDstData_1_rl$EN = 1'd1 ;
  // register propDstData_2_rl
  assign propDstData_2_rl$D_IN =
	     CAN_FIRE_RL_srcPropose_2 ?
	       propDstData_2_lat_0$wget :
	       propDstData_2_rl ;
  assign propDstData_2_rl$EN = 1'd1 ;
  // register propDstIdx_0_rl
  assign propDstIdx_0_rl$D_IN =
	     !propDstIdx_0_lat_1$whas &&
	     IF_propDstIdx_0_lat_0_whas__43_THEN_propDstIdx_ETC___d146 ;
  assign propDstIdx_0_rl$EN = 1'd1 ;
  // register propDstIdx_1_0_rl
  assign propDstIdx_1_0_rl$D_IN =
	     !propDstIdx_1_0_lat_1$whas &&
	     IF_propDstIdx_1_0_lat_0_whas__76_THEN_propDstI_ETC___d379 ;
  assign propDstIdx_1_0_rl$EN = 1'd1 ;
  // register propDstIdx_1_1_rl
  assign propDstIdx_1_1_rl$D_IN =
	     !propDstIdx_1_1_lat_1$whas &&
	     IF_propDstIdx_1_1_lat_0_whas__83_THEN_propDstI_ETC___d386 ;
  assign propDstIdx_1_1_rl$EN = 1'd1 ;
  // register propDstIdx_1_2_rl
  assign propDstIdx_1_2_rl$D_IN =
	     !propDstIdx_1_2_lat_1$whas &&
	     IF_propDstIdx_1_2_lat_0_whas__90_THEN_propDstI_ETC___d393 ;
  assign propDstIdx_1_2_rl$EN = 1'd1 ;
  // register propDstIdx_1_rl
  assign propDstIdx_1_rl$D_IN =
	     !propDstIdx_1_lat_1$whas &&
	     IF_propDstIdx_1_lat_0_whas__50_THEN_propDstIdx_ETC___d153 ;
  assign propDstIdx_1_rl$EN = 1'd1 ;
  // register propDstIdx_2_rl
  assign propDstIdx_2_rl$D_IN =
	     !propDstIdx_2_lat_1$whas &&
	     IF_propDstIdx_2_lat_0_whas__57_THEN_propDstIdx_ETC___d160 ;
  assign propDstIdx_2_rl$EN = 1'd1 ;
  // register rg_state
  always@(EN_server_reset_request_put or
	  WILL_FIRE_RL_rl_reset or WILL_FIRE_RL_rl_reset_complete)
  begin
    case (1'b1) // synopsys parallel_case
      EN_server_reset_request_put: rg_state$D_IN = 2'd0;
      WILL_FIRE_RL_rl_reset: rg_state$D_IN = 2'd1;
      WILL_FIRE_RL_rl_reset_complete: rg_state$D_IN = 2'd2;
      default: rg_state$D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign rg_state$EN =
	     EN_server_reset_request_put || WILL_FIRE_RL_rl_reset ||
	     WILL_FIRE_RL_rl_reset_complete ;
  // register srcRR_0
  assign srcRR_0$D_IN = (srcRR_0 == 2'd2) ? 2'd0 : srcRR_0 + 2'd1 ;
  assign srcRR_0$EN =
	     NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253 ;
  // register srcRR_1_0
  assign srcRR_1_0$D_IN = (srcRR_1_0 == 2'd2) ? 2'd0 : srcRR_1_0 + 2'd1 ;
  assign srcRR_1_0$EN =
	     NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486 ;
  // submodule d_mmu_cache
  assign d_mmu_cache$flush_server_request_put = 1'b0 ;
  assign d_mmu_cache$imem_pte_writeback_p_put =
	     i_mmu_cache$pte_writeback_g_get ;
  assign d_mmu_cache$imem_ptw_server_request_put =
	     i_mmu_cache$ptw_client_request_get ;
  assign d_mmu_cache$l1_to_l2_client_response_enq_x =
	     { llc$to_child_toC_first[583:518],
	       llc$to_child_toC_first[515:3] } ;
  assign d_mmu_cache$l2_to_l1_server_request_enq_x =
	     llc$to_child_toC_first[67:2] ;
  assign d_mmu_cache$ma_req_amo_funct7 = dmem_req_amo_funct7 ;
  assign d_mmu_cache$ma_req_f3 = dmem_req_f3 ;
  assign d_mmu_cache$ma_req_mstatus_MXR = dmem_req_mstatus_MXR ;
  assign d_mmu_cache$ma_req_op = dmem_req_op ;
  assign d_mmu_cache$ma_req_priv = dmem_req_priv ;
  assign d_mmu_cache$ma_req_satp = dmem_req_satp ;
  assign d_mmu_cache$ma_req_sstatus_SUM = dmem_req_sstatus_SUM ;
  assign d_mmu_cache$ma_req_st_value = dmem_req_store_value ;
  assign d_mmu_cache$ma_req_va = dmem_req_addr ;
  assign d_mmu_cache$mmio_client_response_put =
	     mmio_axi4_adapter$v_mmio_server_1_response_get ;
  assign d_mmu_cache$set_watch_tohost_tohost_addr =
	     set_watch_tohost_tohost_addr ;
  assign d_mmu_cache$set_watch_tohost_watch_tohost =
	     set_watch_tohost_watch_tohost ;
  assign d_mmu_cache$EN_ma_req = EN_dmem_req ;
  assign d_mmu_cache$EN_flush_server_request_put = 1'b0 ;
  assign d_mmu_cache$EN_flush_server_response_get = 1'b0 ;
  assign d_mmu_cache$EN_tlb_flush = EN_sfence_vma_server_request_put ;
  assign d_mmu_cache$EN_imem_ptw_server_request_put =
	     CAN_FIRE_RL_ClientServerRequest ;
  assign d_mmu_cache$EN_imem_ptw_server_response_get =
	     CAN_FIRE_RL_ClientServerResponse ;
  assign d_mmu_cache$EN_imem_pte_writeback_p_put =
	     CAN_FIRE_RL_mkConnectionGetPut_3 ;
  assign d_mmu_cache$EN_l1_to_l2_client_request_deq =
	     CAN_FIRE_RL_srcPropose_1 ;
  assign d_mmu_cache$EN_l1_to_l2_client_response_enq = CAN_FIRE_RL_sendPRs_1 ;
  assign d_mmu_cache$EN_l2_to_l1_server_request_enq = CAN_FIRE_RL_sendPRq_1 ;
  assign d_mmu_cache$EN_l2_to_l1_server_response_deq =
	     CAN_FIRE_RL_srcPropose_4 ;
  assign d_mmu_cache$EN_mmio_client_request_get =
	     CAN_FIRE_RL_ClientServerRequest_2 ;
  assign d_mmu_cache$EN_mmio_client_response_put =
	     CAN_FIRE_RL_ClientServerResponse_2 ;
  assign d_mmu_cache$EN_set_watch_tohost = EN_set_watch_tohost ;
  // submodule dma_cache
  assign dma_cache$axi4_s_araddr = dma_server_araddr ;
  assign dma_cache$axi4_s_arburst = dma_server_arburst ;
  assign dma_cache$axi4_s_arcache = dma_server_arcache ;
  assign dma_cache$axi4_s_arid = dma_server_arid ;
  assign dma_cache$axi4_s_arlen = dma_server_arlen ;
  assign dma_cache$axi4_s_arlock = dma_server_arlock ;
  assign dma_cache$axi4_s_arprot = dma_server_arprot ;
  assign dma_cache$axi4_s_arqos = dma_server_arqos ;
  assign dma_cache$axi4_s_arregion = dma_server_arregion ;
  assign dma_cache$axi4_s_arsize = dma_server_arsize ;
  assign dma_cache$axi4_s_arvalid = dma_server_arvalid ;
  assign dma_cache$axi4_s_awaddr = dma_server_awaddr ;
  assign dma_cache$axi4_s_awburst = dma_server_awburst ;
  assign dma_cache$axi4_s_awcache = dma_server_awcache ;
  assign dma_cache$axi4_s_awid = dma_server_awid ;
  assign dma_cache$axi4_s_awlen = dma_server_awlen ;
  assign dma_cache$axi4_s_awlock = dma_server_awlock ;
  assign dma_cache$axi4_s_awprot = dma_server_awprot ;
  assign dma_cache$axi4_s_awqos = dma_server_awqos ;
  assign dma_cache$axi4_s_awregion = dma_server_awregion ;
  assign dma_cache$axi4_s_awsize = dma_server_awsize ;
  assign dma_cache$axi4_s_awvalid = dma_server_awvalid ;
  assign dma_cache$axi4_s_bready = dma_server_bready ;
  assign dma_cache$axi4_s_rready = dma_server_rready ;
  assign dma_cache$axi4_s_wdata = dma_server_wdata ;
  assign dma_cache$axi4_s_wlast = dma_server_wlast ;
  assign dma_cache$axi4_s_wstrb = dma_server_wstrb ;
  assign dma_cache$axi4_s_wvalid = dma_server_wvalid ;
  assign dma_cache$l1_to_l2_client_response_enq_x =
	     d_mmu_cache$l1_to_l2_client_response_enq_x ;
  assign dma_cache$l2_to_l1_server_request_enq_x =
	     llc$to_child_toC_first[67:2] ;
  assign dma_cache$mmio_client_response_put =
	     mmio_axi4_adapter$v_mmio_server_2_response_get ;
  assign dma_cache$EN_l1_to_l2_client_request_deq = CAN_FIRE_RL_srcPropose_2 ;
  assign dma_cache$EN_l1_to_l2_client_response_enq = CAN_FIRE_RL_sendPRs_2 ;
  assign dma_cache$EN_l2_to_l1_server_request_enq = CAN_FIRE_RL_sendPRq_2 ;
  assign dma_cache$EN_l2_to_l1_server_response_deq =
	     CAN_FIRE_RL_srcPropose_5 ;
  assign dma_cache$EN_mmio_client_request_get =
	     CAN_FIRE_RL_ClientServerRequest_3 ;
  assign dma_cache$EN_mmio_client_response_put =
	     CAN_FIRE_RL_ClientServerResponse_3 ;
  // submodule enqDst_0_dummy2_0
  assign enqDst_0_dummy2_0$D_IN = 1'd1 ;
  assign enqDst_0_dummy2_0$EN =
	     NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253 ;
  // submodule enqDst_0_dummy2_1
  assign enqDst_0_dummy2_1$D_IN = 1'd1 ;
  assign enqDst_0_dummy2_1$EN = CAN_FIRE_RL_doEnq ;
  // submodule enqDst_1_0_dummy2_0
  assign enqDst_1_0_dummy2_0$D_IN = 1'd1 ;
  assign enqDst_1_0_dummy2_0$EN =
	     NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486 ;
  // submodule enqDst_1_0_dummy2_1
  assign enqDst_1_0_dummy2_1$D_IN = 1'd1 ;
  assign enqDst_1_0_dummy2_1$EN = CAN_FIRE_RL_doEnq_1 ;
  // submodule f_reset_rsps
  assign f_reset_rsps$ENQ = MUX_rg_state$write_1__SEL_3 ;
  assign f_reset_rsps$DEQ = EN_server_reset_response_get ;
  assign f_reset_rsps$CLR = 1'b0 ;
  // submodule i_mmu_cache
  assign i_mmu_cache$flush_server_request_put = 1'b0 ;
  assign i_mmu_cache$l1_to_l2_client_response_enq_x =
	     d_mmu_cache$l1_to_l2_client_response_enq_x ;
  assign i_mmu_cache$l2_to_l1_server_request_enq_x =
	     llc$to_child_toC_first[67:2] ;
  assign i_mmu_cache$ma_req_mstatus_MXR = imem_req_mstatus_MXR ;
  assign i_mmu_cache$ma_req_priv = imem_req_priv ;
  assign i_mmu_cache$ma_req_satp = imem_req_satp ;
  assign i_mmu_cache$ma_req_sstatus_SUM = imem_req_sstatus_SUM ;
  assign i_mmu_cache$ma_req_va = imem_req_addr ;
  assign i_mmu_cache$mmio_client_response_put =
	     mmio_axi4_adapter$v_mmio_server_0_response_get ;
  assign i_mmu_cache$ptw_client_response_put =
	     d_mmu_cache$imem_ptw_server_response_get ;
  assign i_mmu_cache$EN_ma_req = EN_imem_req ;
  assign i_mmu_cache$EN_flush_server_request_put = 1'b0 ;
  assign i_mmu_cache$EN_flush_server_response_get = 1'b0 ;
  assign i_mmu_cache$EN_tlb_flush = EN_sfence_vma_server_request_put ;
  assign i_mmu_cache$EN_ptw_client_request_get =
	     CAN_FIRE_RL_ClientServerRequest ;
  assign i_mmu_cache$EN_ptw_client_response_put =
	     CAN_FIRE_RL_ClientServerResponse ;
  assign i_mmu_cache$EN_pte_writeback_g_get =
	     CAN_FIRE_RL_mkConnectionGetPut_3 ;
  assign i_mmu_cache$EN_l1_to_l2_client_request_deq = CAN_FIRE_RL_srcPropose ;
  assign i_mmu_cache$EN_l1_to_l2_client_response_enq = CAN_FIRE_RL_sendPRs ;
  assign i_mmu_cache$EN_l2_to_l1_server_request_enq = CAN_FIRE_RL_sendPRq ;
  assign i_mmu_cache$EN_l2_to_l1_server_response_deq =
	     CAN_FIRE_RL_srcPropose_3 ;
  assign i_mmu_cache$EN_mmio_client_request_get =
	     CAN_FIRE_RL_ClientServerRequest_1 ;
  assign i_mmu_cache$EN_mmio_client_response_put =
	     CAN_FIRE_RL_ClientServerResponse_1 ;
  // submodule llc
  assign llc$dma_memReq_enq_x = 656'h0 ;
  assign llc$perf_req_r = 4'h0 ;
  assign llc$perf_setStatus_doStats = 1'b0 ;
  assign llc$to_child_rqFromC_enq_x =
	     NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253 ?
	       enqDst_0_lat_0$wget[73:0] :
	       enqDst_0_rl[73:0] ;
  assign llc$to_child_rsFromC_enq_x =
	     NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486 ?
	       enqDst_1_0_lat_0$wget[580:0] :
	       enqDst_1_0_rl[580:0] ;
  assign llc$to_mem_rsFromM_enq_x =
	     { new_cline__h14098,
	       llc_axi4_adapter_f_pending_reads$D_OUT[4:0] } ;
  assign llc$EN_to_child_rsFromC_enq = CAN_FIRE_RL_doEnq_1 ;
  assign llc$EN_to_child_rqFromC_enq = CAN_FIRE_RL_doEnq ;
  assign llc$EN_to_child_toC_deq =
	     WILL_FIRE_RL_sendPRs_2 || WILL_FIRE_RL_sendPRq_2 ||
	     WILL_FIRE_RL_sendPRs_1 ||
	     WILL_FIRE_RL_sendPRq_1 ||
	     WILL_FIRE_RL_sendPRs ||
	     WILL_FIRE_RL_sendPRq ;
  assign llc$EN_dma_memReq_enq = 1'b0 ;
  assign llc$EN_dma_respLd_deq = llc$RDY_dma_respLd_deq ;
  assign llc$EN_dma_respSt_deq = llc$RDY_dma_respSt_deq ;
  assign llc$EN_to_mem_toM_deq =
	     WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_req &&
	     llc_axi4_adapter_rg_rd_req_beat == 3'd7 ||
	     WILL_FIRE_RL_llc_axi4_adapter_rl_handle_write_req &&
	     llc_axi4_adapter_rg_wr_req_beat == 3'd7 ;
  assign llc$EN_to_mem_rsFromM_enq =
	     WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	     llc_axi4_adapter_rg_rd_rsp_beat == 3'd7 ;
  assign llc$EN_cRqStuck_get = 1'b0 ;
  assign llc$EN_perf_setStatus = 1'b0 ;
  assign llc$EN_perf_req = 1'b0 ;
  assign llc$EN_perf_resp = 1'b0 ;
  // submodule llc_axi4_adapter_f_pending_reads
  assign llc_axi4_adapter_f_pending_reads$D_IN = llc$to_mem_toM_first[68:0] ;
  assign llc_axi4_adapter_f_pending_reads$ENQ =
	     WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_req &&
	     llc_axi4_adapter_rg_rd_req_beat == 3'd0 ;
  assign llc_axi4_adapter_f_pending_reads$DEQ =
	     WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	     llc_axi4_adapter_rg_rd_rsp_beat == 3'd7 ;
  assign llc_axi4_adapter_f_pending_reads$CLR = 1'b0 ;
  // submodule llc_axi4_adapter_f_pending_writes
  assign llc_axi4_adapter_f_pending_writes$D_IN =
	     llc$to_mem_toM_first[639:0] ;
  assign llc_axi4_adapter_f_pending_writes$ENQ =
	     WILL_FIRE_RL_llc_axi4_adapter_rl_handle_write_req &&
	     llc_axi4_adapter_rg_wr_req_beat == 3'd0 ;
  assign llc_axi4_adapter_f_pending_writes$DEQ =
	     WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp &&
	     llc_axi4_adapter_rg_wr_rsp_beat == 3'd7 ;
  assign llc_axi4_adapter_f_pending_writes$CLR = 1'b0 ;
  // submodule mmio_axi4_adapter
  assign mmio_axi4_adapter$mem_master_arready = imem_master_arready ;
  assign mmio_axi4_adapter$mem_master_awready = imem_master_awready ;
  assign mmio_axi4_adapter$mem_master_bid = imem_master_bid ;
  assign mmio_axi4_adapter$mem_master_bresp = imem_master_bresp ;
  assign mmio_axi4_adapter$mem_master_bvalid = imem_master_bvalid ;
  assign mmio_axi4_adapter$mem_master_rdata = imem_master_rdata ;
  assign mmio_axi4_adapter$mem_master_rid = imem_master_rid ;
  assign mmio_axi4_adapter$mem_master_rlast = imem_master_rlast ;
  assign mmio_axi4_adapter$mem_master_rresp = imem_master_rresp ;
  assign mmio_axi4_adapter$mem_master_rvalid = imem_master_rvalid ;
  assign mmio_axi4_adapter$mem_master_wready = imem_master_wready ;
  assign mmio_axi4_adapter$v_mmio_server_0_request_put =
	     i_mmu_cache$mmio_client_request_get ;
  assign mmio_axi4_adapter$v_mmio_server_1_request_put =
	     d_mmu_cache$mmio_client_request_get ;
  assign mmio_axi4_adapter$v_mmio_server_2_request_put =
	     dma_cache$mmio_client_request_get ;
  assign mmio_axi4_adapter$EN_v_mmio_server_0_request_put =
	     CAN_FIRE_RL_ClientServerRequest_1 ;
  assign mmio_axi4_adapter$EN_v_mmio_server_0_response_get =
	     CAN_FIRE_RL_ClientServerResponse_1 ;
  assign mmio_axi4_adapter$EN_v_mmio_server_1_request_put =
	     CAN_FIRE_RL_ClientServerRequest_2 ;
  assign mmio_axi4_adapter$EN_v_mmio_server_1_response_get =
	     CAN_FIRE_RL_ClientServerResponse_2 ;
  assign mmio_axi4_adapter$EN_v_mmio_server_2_request_put =
	     CAN_FIRE_RL_ClientServerRequest_3 ;
  assign mmio_axi4_adapter$EN_v_mmio_server_2_response_get =
	     CAN_FIRE_RL_ClientServerResponse_3 ;
  // submodule propDstData_0_dummy2_0
  assign propDstData_0_dummy2_0$D_IN = 1'd1 ;
  assign propDstData_0_dummy2_0$EN = CAN_FIRE_RL_srcPropose ;
  // submodule propDstData_0_dummy2_1
  assign propDstData_0_dummy2_1$D_IN = 1'b0 ;
  assign propDstData_0_dummy2_1$EN = 1'b0 ;
  // submodule propDstData_1_0_dummy2_0
  assign propDstData_1_0_dummy2_0$D_IN = 1'd1 ;
  assign propDstData_1_0_dummy2_0$EN = CAN_FIRE_RL_srcPropose_3 ;
  // submodule propDstData_1_0_dummy2_1
  assign propDstData_1_0_dummy2_1$D_IN = 1'b0 ;
  assign propDstData_1_0_dummy2_1$EN = 1'b0 ;
  // submodule propDstData_1_1_dummy2_0
  assign propDstData_1_1_dummy2_0$D_IN = 1'd1 ;
  assign propDstData_1_1_dummy2_0$EN = CAN_FIRE_RL_srcPropose_4 ;
  // submodule propDstData_1_1_dummy2_1
  assign propDstData_1_1_dummy2_1$D_IN = 1'b0 ;
  assign propDstData_1_1_dummy2_1$EN = 1'b0 ;
  // submodule propDstData_1_2_dummy2_0
  assign propDstData_1_2_dummy2_0$D_IN = 1'd1 ;
  assign propDstData_1_2_dummy2_0$EN = CAN_FIRE_RL_srcPropose_5 ;
  // submodule propDstData_1_2_dummy2_1
  assign propDstData_1_2_dummy2_1$D_IN = 1'b0 ;
  assign propDstData_1_2_dummy2_1$EN = 1'b0 ;
  // submodule propDstData_1_dummy2_0
  assign propDstData_1_dummy2_0$D_IN = 1'd1 ;
  assign propDstData_1_dummy2_0$EN = CAN_FIRE_RL_srcPropose_1 ;
  // submodule propDstData_1_dummy2_1
  assign propDstData_1_dummy2_1$D_IN = 1'b0 ;
  assign propDstData_1_dummy2_1$EN = 1'b0 ;
  // submodule propDstData_2_dummy2_0
  assign propDstData_2_dummy2_0$D_IN = 1'd1 ;
  assign propDstData_2_dummy2_0$EN = CAN_FIRE_RL_srcPropose_2 ;
  // submodule propDstData_2_dummy2_1
  assign propDstData_2_dummy2_1$D_IN = 1'b0 ;
  assign propDstData_2_dummy2_1$EN = 1'b0 ;
  // submodule propDstIdx_0_dummy2_0
  assign propDstIdx_0_dummy2_0$D_IN = 1'd1 ;
  assign propDstIdx_0_dummy2_0$EN = CAN_FIRE_RL_srcPropose ;
  // submodule propDstIdx_0_dummy2_1
  assign propDstIdx_0_dummy2_1$D_IN = 1'd1 ;
  assign propDstIdx_0_dummy2_1$EN = propDstIdx_0_lat_1$whas ;
  // submodule propDstIdx_1_0_dummy2_0
  assign propDstIdx_1_0_dummy2_0$D_IN = 1'd1 ;
  assign propDstIdx_1_0_dummy2_0$EN = CAN_FIRE_RL_srcPropose_3 ;
  // submodule propDstIdx_1_0_dummy2_1
  assign propDstIdx_1_0_dummy2_1$D_IN = 1'd1 ;
  assign propDstIdx_1_0_dummy2_1$EN = propDstIdx_1_0_lat_1$whas ;
  // submodule propDstIdx_1_1_dummy2_0
  assign propDstIdx_1_1_dummy2_0$D_IN = 1'd1 ;
  assign propDstIdx_1_1_dummy2_0$EN = CAN_FIRE_RL_srcPropose_4 ;
  // submodule propDstIdx_1_1_dummy2_1
  assign propDstIdx_1_1_dummy2_1$D_IN = 1'd1 ;
  assign propDstIdx_1_1_dummy2_1$EN = propDstIdx_1_1_lat_1$whas ;
  // submodule propDstIdx_1_2_dummy2_0
  assign propDstIdx_1_2_dummy2_0$D_IN = 1'd1 ;
  assign propDstIdx_1_2_dummy2_0$EN = CAN_FIRE_RL_srcPropose_5 ;
  // submodule propDstIdx_1_2_dummy2_1
  assign propDstIdx_1_2_dummy2_1$D_IN = 1'd1 ;
  assign propDstIdx_1_2_dummy2_1$EN = propDstIdx_1_2_lat_1$whas ;
  // submodule propDstIdx_1_dummy2_0
  assign propDstIdx_1_dummy2_0$D_IN = 1'd1 ;
  assign propDstIdx_1_dummy2_0$EN = CAN_FIRE_RL_srcPropose_1 ;
  // submodule propDstIdx_1_dummy2_1
  assign propDstIdx_1_dummy2_1$D_IN = 1'd1 ;
  assign propDstIdx_1_dummy2_1$EN = propDstIdx_1_lat_1$whas ;
  // submodule propDstIdx_2_dummy2_0
  assign propDstIdx_2_dummy2_0$D_IN = 1'd1 ;
  assign propDstIdx_2_dummy2_0$EN = CAN_FIRE_RL_srcPropose_2 ;
  // submodule propDstIdx_2_dummy2_1
  assign propDstIdx_2_dummy2_1$D_IN = 1'd1 ;
  assign propDstIdx_2_dummy2_1$EN = propDstIdx_2_lat_1$whas ;
  // remaining internal signals
  assign IF_NOT_propDstIdx_0_dummy2_1_read__95_96_OR_IF_ETC___d250 =
	     NOT_propDstIdx_0_dummy2_1_read__95_96_OR_IF_pr_ETC___d245 ?
	       propDstIdx_1_dummy2_1$Q_OUT &&
	       IF_propDstIdx_1_lat_0_whas__50_THEN_propDstIdx_ETC___d153 :
	       propDstIdx_0_dummy2_1$Q_OUT &&
	       IF_propDstIdx_0_lat_0_whas__43_THEN_propDstIdx_ETC___d146 ;
  assign IF_NOT_propDstIdx_0_dummy2_1_read__95_96_OR_IF_ETC___d251 =
	     (NOT_propDstIdx_0_dummy2_1_read__95_96_OR_IF_pr_ETC___d245 &&
	      NOT_propDstIdx_1_dummy2_1_read__08_09_OR_IF_pr_ETC___d248) ?
	       propDstIdx_2_dummy2_1$Q_OUT &&
	       IF_propDstIdx_2_lat_0_whas__57_THEN_propDstIdx_ETC___d160 :
	       IF_NOT_propDstIdx_0_dummy2_1_read__95_96_OR_IF_ETC___d250 ;
  assign IF_NOT_propDstIdx_1_0_dummy2_1_read__28_29_OR__ETC___d483 =
	     NOT_propDstIdx_1_0_dummy2_1_read__28_29_OR_IF__ETC___d478 ?
	       propDstIdx_1_1_dummy2_1$Q_OUT &&
	       IF_propDstIdx_1_1_lat_0_whas__83_THEN_propDstI_ETC___d386 :
	       propDstIdx_1_0_dummy2_1$Q_OUT &&
	       IF_propDstIdx_1_0_lat_0_whas__76_THEN_propDstI_ETC___d379 ;
  assign IF_NOT_propDstIdx_1_0_dummy2_1_read__28_29_OR__ETC___d484 =
	     (NOT_propDstIdx_1_0_dummy2_1_read__28_29_OR_IF__ETC___d478 &&
	      NOT_propDstIdx_1_1_dummy2_1_read__41_42_OR_IF__ETC___d481) ?
	       propDstIdx_1_2_dummy2_1$Q_OUT &&
	       IF_propDstIdx_1_2_lat_0_whas__90_THEN_propDstI_ETC___d393 :
	       IF_NOT_propDstIdx_1_0_dummy2_1_read__28_29_OR__ETC___d483 ;
  assign IF_propDstData_0_dummy2_1_read__54_THEN_IF_pro_ETC___d278 =
	     propDstData_0_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose ?
		  propDstData_0_lat_0$wget[9:8] :
		  propDstData_0_rl[9:8]) :
	       2'd0 ;
  assign IF_propDstData_0_dummy2_1_read__54_THEN_IF_pro_ETC___d292 =
	     propDstData_0_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose ?
		  propDstData_0_lat_0$wget[7:6] :
		  propDstData_0_rl[7:6]) :
	       2'd0 ;
  assign IF_propDstData_1_0_dummy2_1_read__87_THEN_IF_p_ETC___d511 =
	     propDstData_1_0_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_3 ?
		  propDstData_1_0_lat_0$wget[516:515] :
		  propDstData_1_0_rl[516:515]) :
	       2'd0 ;
  assign IF_propDstData_1_1_dummy2_1_read__92_THEN_IF_p_ETC___d515 =
	     propDstData_1_1_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_4 ?
		  propDstData_1_1_lat_0$wget[516:515] :
		  propDstData_1_1_rl[516:515]) :
	       2'd0 ;
  assign IF_propDstData_1_2_dummy2_1_read__97_THEN_IF_p_ETC___d519 =
	     propDstData_1_2_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_5 ?
		  propDstData_1_2_lat_0$wget[516:515] :
		  propDstData_1_2_rl[516:515]) :
	       2'd0 ;
  assign IF_propDstData_1_dummy2_1_read__59_THEN_IF_pro_ETC___d282 =
	     propDstData_1_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_1 ?
		  propDstData_1_lat_0$wget[9:8] :
		  propDstData_1_rl[9:8]) :
	       2'd0 ;
  assign IF_propDstData_1_dummy2_1_read__59_THEN_IF_pro_ETC___d296 =
	     propDstData_1_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_1 ?
		  propDstData_1_lat_0$wget[7:6] :
		  propDstData_1_rl[7:6]) :
	       2'd0 ;
  assign IF_propDstData_2_dummy2_1_read__64_THEN_IF_pro_ETC___d286 =
	     propDstData_2_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_2 ?
		  propDstData_2_lat_0$wget[9:8] :
		  propDstData_2_rl[9:8]) :
	       2'd0 ;
  assign IF_propDstData_2_dummy2_1_read__64_THEN_IF_pro_ETC___d300 =
	     propDstData_2_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_2 ?
		  propDstData_2_lat_0$wget[7:6] :
		  propDstData_2_rl[7:6]) :
	       2'd0 ;
  assign IF_propDstIdx_0_lat_0_whas__43_THEN_propDstIdx_ETC___d146 =
	     CAN_FIRE_RL_srcPropose || propDstIdx_0_rl ;
  assign IF_propDstIdx_1_0_lat_0_whas__76_THEN_propDstI_ETC___d379 =
	     CAN_FIRE_RL_srcPropose_3 || propDstIdx_1_0_rl ;
  assign IF_propDstIdx_1_1_lat_0_whas__83_THEN_propDstI_ETC___d386 =
	     CAN_FIRE_RL_srcPropose_4 || propDstIdx_1_1_rl ;
  assign IF_propDstIdx_1_2_lat_0_whas__90_THEN_propDstI_ETC___d393 =
	     CAN_FIRE_RL_srcPropose_5 || propDstIdx_1_2_rl ;
  assign IF_propDstIdx_1_lat_0_whas__50_THEN_propDstIdx_ETC___d153 =
	     CAN_FIRE_RL_srcPropose_1 || propDstIdx_1_rl ;
  assign IF_propDstIdx_2_lat_0_whas__57_THEN_propDstIdx_ETC___d160 =
	     CAN_FIRE_RL_srcPropose_2 || propDstIdx_2_rl ;
  assign NOT_cfg_verbosity_read__38_ULE_1_39___d740 = cfg_verbosity > 4'd1 ;
  assign NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253 =
	     (!enqDst_0_dummy2_0$Q_OUT || !enqDst_0_dummy2_1$Q_OUT ||
	      !enqDst_0_rl[74]) &&
	     (SEL_ARR_propDstIdx_0_dummy2_1_read__95_AND_IF__ETC___d242 ||
	      IF_NOT_propDstIdx_0_dummy2_1_read__95_96_OR_IF_ETC___d251) ;
  assign NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486 =
	     (!enqDst_1_0_dummy2_0$Q_OUT || !enqDst_1_0_dummy2_1$Q_OUT ||
	      !enqDst_1_0_rl[581]) &&
	     (SEL_ARR_propDstIdx_1_0_dummy2_1_read__28_AND_I_ETC___d475 ||
	      IF_NOT_propDstIdx_1_0_dummy2_1_read__28_29_OR__ETC___d484) ;
  assign NOT_llc_axi4_adapter_master_xactor_crg_wr_addr_ETC___d80 =
	     !llc_axi4_adapter_master_xactor_crg_wr_addr_full$port2__read &&
	     !llc_axi4_adapter_master_xactor_crg_wr_data_full$port2__read &&
	     llc_axi4_adapter_ctr_wr_rsps_pending_crg != 4'd15 &&
	     llc$RDY_to_mem_toM_first &&
	     (llc_axi4_adapter_rg_wr_req_beat != 3'd0 ||
	      llc_axi4_adapter_f_pending_writes$FULL_N) &&
	     (llc_axi4_adapter_rg_wr_req_beat != 3'd7 ||
	      llc$RDY_to_mem_toM_deq) ;
  assign NOT_propDstIdx_0_dummy2_1_read__95_96_OR_IF_pr_ETC___d245 =
	     !propDstIdx_0_dummy2_1$Q_OUT ||
	     !CAN_FIRE_RL_srcPropose && !propDstIdx_0_rl ;
  assign NOT_propDstIdx_1_0_dummy2_1_read__28_29_OR_IF__ETC___d478 =
	     !propDstIdx_1_0_dummy2_1$Q_OUT ||
	     !CAN_FIRE_RL_srcPropose_3 && !propDstIdx_1_0_rl ;
  assign NOT_propDstIdx_1_1_dummy2_1_read__41_42_OR_IF__ETC___d481 =
	     !propDstIdx_1_1_dummy2_1$Q_OUT ||
	     !CAN_FIRE_RL_srcPropose_4 && !propDstIdx_1_1_rl ;
  assign NOT_propDstIdx_1_2_dummy2_1_read__54_55_OR_IF__ETC___d659 =
	     !propDstIdx_1_2_dummy2_1$Q_OUT ||
	     !CAN_FIRE_RL_srcPropose_5 && !propDstIdx_1_2_rl ;
  assign NOT_propDstIdx_1_dummy2_1_read__08_09_OR_IF_pr_ETC___d248 =
	     !propDstIdx_1_dummy2_1$Q_OUT ||
	     !CAN_FIRE_RL_srcPropose_1 && !propDstIdx_1_rl ;
  assign NOT_propDstIdx_2_dummy2_1_read__21_22_OR_IF_pr_ETC___d363 =
	     !propDstIdx_2_dummy2_1$Q_OUT ||
	     !CAN_FIRE_RL_srcPropose_2 && !propDstIdx_2_rl ;
  assign SEL_ARR_IF_propDstData_0_dummy2_1_read__54_THE_ETC___d346 =
	     { CASE_x5600_0_IF_propDstData_0_dummy2_1_read__5_ETC__q2,
	       CASE_x5600_0_IF_propDstData_0_dummy2_1_read__5_ETC__q3,
	       SEL_ARR_propDstData_0_dummy2_1_read__54_AND_IF_ETC___d345 } ;
  assign SEL_ARR_IF_propDstData_1_0_dummy2_1_read__87_T_ETC___d642 =
	     { CASE_x1624_0_IF_propDstData_1_0_dummy2_1_read__ETC__q14,
	       SEL_ARR_propDstData_1_0_dummy2_1_read__87_AND__ETC___d627,
	       x__h74996 } ;
  assign SEL_ARR_IF_propDstData_1_0_lat_0_whas__97_THEN_ETC___d569 =
	     { CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q5,
	       CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q6,
	       CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q7 } ;
  assign SEL_ARR_IF_propDstData_1_0_lat_0_whas__97_THEN_ETC___d592 =
	     { SEL_ARR_IF_propDstData_1_0_lat_0_whas__97_THEN_ETC___d569,
	       CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q8,
	       CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q9 } ;
  assign SEL_ARR_IF_propDstData_1_0_lat_0_whas__97_THEN_ETC___d615 =
	     { SEL_ARR_IF_propDstData_1_0_lat_0_whas__97_THEN_ETC___d592,
	       CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q10,
	       CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q11 } ;
  assign SEL_ARR_propDstData_0_dummy2_1_read__54_AND_IF_ETC___d345 =
	     { CASE_x5600_0_propDstData_0_dummy2_1_read__54_A_ETC__q1,
	       x__h46058,
	       x__h46068 } ;
  assign SEL_ARR_propDstData_1_0_dummy2_1_read__87_AND__ETC___d627 =
	     { CASE_x1624_0_propDstData_1_0_dummy2_1_read__87_ETC__q12,
	       SEL_ARR_IF_propDstData_1_0_lat_0_whas__97_THEN_ETC___d615,
	       CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q13 } ;
  assign b__h13463 =
	     CAN_FIRE_RL_llc_axi4_adapter_rl_handle_write_req ?
	       llc_axi4_adapter_ctr_wr_rsps_pending_crg$port0__write_1 :
	       llc_axi4_adapter_ctr_wr_rsps_pending_crg ;
  assign enqDst_0_dummy2_1_read__31_AND_IF_enqDst_0_lat_ETC___d368 =
	     enqDst_0_dummy2_1$Q_OUT &&
	     (NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253 ?
		enqDst_0_lat_0$wget[74] :
		enqDst_0_rl[74]) ;
  assign enqDst_1_0_dummy2_1_read__64_AND_IF_enqDst_1_0_ETC___d664 =
	     enqDst_1_0_dummy2_1$Q_OUT &&
	     (NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486 ?
		enqDst_1_0_lat_0$wget[581] :
		enqDst_1_0_rl[581]) ;
  assign mem_req_rd_addr_araddr__h13577 =
	     { llc$to_mem_toM_first[68:11], x__h13627 } ;
  assign mem_req_wr_addr_awaddr__h15613 =
	     { llc$to_mem_toM_first[639:582], x__h15647 } ;
  assign n__read_addr__h45824 =
	     propDstData_0_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose ?
		  propDstData_0_lat_0$wget[73:10] :
		  propDstData_0_rl[73:10]) :
	       64'd0 ;
  assign n__read_addr__h45909 =
	     propDstData_1_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_1 ?
		  propDstData_1_lat_0$wget[73:10] :
		  propDstData_1_rl[73:10]) :
	       64'd0 ;
  assign n__read_addr__h45994 =
	     propDstData_2_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_2 ?
		  propDstData_2_lat_0$wget[73:10] :
		  propDstData_2_rl[73:10]) :
	       64'd0 ;
  assign n__read_addr__h71844 =
	     propDstData_1_0_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_3 ?
		  propDstData_1_0_lat_0$wget[580:517] :
		  propDstData_1_0_rl[580:517]) :
	       64'd0 ;
  assign n__read_addr__h71923 =
	     propDstData_1_1_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_4 ?
		  propDstData_1_1_lat_0$wget[580:517] :
		  propDstData_1_1_rl[580:517]) :
	       64'd0 ;
  assign n__read_addr__h72002 =
	     propDstData_1_2_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_5 ?
		  propDstData_1_2_lat_0$wget[580:517] :
		  propDstData_1_2_rl[580:517]) :
	       64'd0 ;
  assign n__read_child__h45829 =
	     propDstData_0_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose ?
		  propDstData_0_lat_0$wget[1:0] :
		  propDstData_0_rl[1:0]) :
	       2'd0 ;
  assign n__read_child__h45914 =
	     propDstData_1_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_1 ?
		  propDstData_1_lat_0$wget[1:0] :
		  propDstData_1_rl[1:0]) :
	       2'd0 ;
  assign n__read_child__h45999 =
	     propDstData_2_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_2 ?
		  propDstData_2_lat_0$wget[1:0] :
		  propDstData_2_rl[1:0]) :
	       2'd0 ;
  assign n__read_child__h71847 =
	     propDstData_1_0_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_3 ?
		  propDstData_1_0_lat_0$wget[1:0] :
		  propDstData_1_0_rl[1:0]) :
	       2'd0 ;
  assign n__read_child__h71926 =
	     propDstData_1_1_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_4 ?
		  propDstData_1_1_lat_0$wget[1:0] :
		  propDstData_1_1_rl[1:0]) :
	       2'd0 ;
  assign n__read_child__h72005 =
	     propDstData_1_2_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_5 ?
		  propDstData_1_2_lat_0$wget[1:0] :
		  propDstData_1_2_rl[1:0]) :
	       2'd0 ;
  assign n__read_id__h45828 =
	     propDstData_0_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose ?
		  propDstData_0_lat_0$wget[4:2] :
		  propDstData_0_rl[4:2]) :
	       3'd0 ;
  assign n__read_id__h45913 =
	     propDstData_1_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_1 ?
		  propDstData_1_lat_0$wget[4:2] :
		  propDstData_1_rl[4:2]) :
	       3'd0 ;
  assign n__read_id__h45998 =
	     propDstData_2_dummy2_1$Q_OUT ?
	       (CAN_FIRE_RL_srcPropose_2 ?
		  propDstData_2_lat_0$wget[4:2] :
		  propDstData_2_rl[4:2]) :
	       3'd0 ;
  assign new_cline__h14098 =
	     { llc_axi4_adapter_master_xactor_rg_rd_data[66:3],
	       llc_axi4_adapter_rg_cline[511:64] } ;
  assign propDstData_0_dummy2_1_read__54_AND_IF_propDst_ETC___d306 =
	     propDstData_0_dummy2_1$Q_OUT &&
	     (CAN_FIRE_RL_srcPropose ?
		propDstData_0_lat_0$wget[5] :
		propDstData_0_rl[5]) ;
  assign propDstData_1_0_dummy2_1_read__87_AND_IF_propD_ETC___d525 =
	     propDstData_1_0_dummy2_1$Q_OUT &&
	     (CAN_FIRE_RL_srcPropose_3 ?
		propDstData_1_0_lat_0$wget[514] :
		propDstData_1_0_rl[514]) ;
  assign propDstData_1_1_dummy2_1_read__92_AND_IF_propD_ETC___d529 =
	     propDstData_1_1_dummy2_1$Q_OUT &&
	     (CAN_FIRE_RL_srcPropose_4 ?
		propDstData_1_1_lat_0$wget[514] :
		propDstData_1_1_rl[514]) ;
  assign propDstData_1_2_dummy2_1_read__97_AND_IF_propD_ETC___d533 =
	     propDstData_1_2_dummy2_1$Q_OUT &&
	     (CAN_FIRE_RL_srcPropose_5 ?
		propDstData_1_2_lat_0$wget[514] :
		propDstData_1_2_rl[514]) ;
  assign propDstData_1_dummy2_1_read__59_AND_IF_propDst_ETC___d310 =
	     propDstData_1_dummy2_1$Q_OUT &&
	     (CAN_FIRE_RL_srcPropose_1 ?
		propDstData_1_lat_0$wget[5] :
		propDstData_1_rl[5]) ;
  assign propDstData_2_dummy2_1_read__64_AND_IF_propDst_ETC___d314 =
	     propDstData_2_dummy2_1$Q_OUT &&
	     (CAN_FIRE_RL_srcPropose_2 ?
		propDstData_2_lat_0$wget[5] :
		propDstData_2_rl[5]) ;
  assign x__h13627 = { llc_axi4_adapter_rg_rd_req_beat, 3'b0 } ;
  assign x__h15647 = { llc_axi4_adapter_rg_wr_req_beat, 3'b0 } ;
  assign x__h45600 =
	     SEL_ARR_propDstIdx_0_dummy2_1_read__95_AND_IF__ETC___d242 ?
	       srcRR_0 :
	       ((NOT_propDstIdx_0_dummy2_1_read__95_96_OR_IF_pr_ETC___d245 &&
		 NOT_propDstIdx_1_dummy2_1_read__08_09_OR_IF_pr_ETC___d248) ?
		  2'd2 :
		  (NOT_propDstIdx_0_dummy2_1_read__95_96_OR_IF_pr_ETC___d245 ?
		     2'd1 :
		     2'd0)) ;
  assign x__h71624 =
	     SEL_ARR_propDstIdx_1_0_dummy2_1_read__28_AND_I_ETC___d475 ?
	       srcRR_1_0 :
	       ((NOT_propDstIdx_1_0_dummy2_1_read__28_29_OR_IF__ETC___d478 &&
		 NOT_propDstIdx_1_1_dummy2_1_read__41_42_OR_IF__ETC___d481) ?
		  2'd2 :
		  (NOT_propDstIdx_1_0_dummy2_1_read__28_29_OR_IF__ETC___d478 ?
		     2'd1 :
		     2'd0)) ;
  always@(llc_axi4_adapter_rg_wr_req_beat or llc$to_mem_toM_first)
  begin
    case (llc_axi4_adapter_rg_wr_req_beat)
      3'd0: data64__h15525 = llc$to_mem_toM_first[63:0];
      3'd1: data64__h15525 = llc$to_mem_toM_first[127:64];
      3'd2: data64__h15525 = llc$to_mem_toM_first[191:128];
      3'd3: data64__h15525 = llc$to_mem_toM_first[255:192];
      3'd4: data64__h15525 = llc$to_mem_toM_first[319:256];
      3'd5: data64__h15525 = llc$to_mem_toM_first[383:320];
      3'd6: data64__h15525 = llc$to_mem_toM_first[447:384];
      3'd7: data64__h15525 = llc$to_mem_toM_first[511:448];
    endcase
  end
  always@(llc_axi4_adapter_rg_wr_req_beat or llc$to_mem_toM_first)
  begin
    case (llc_axi4_adapter_rg_wr_req_beat)
      3'd0: strb8__h15526 = llc$to_mem_toM_first[519:512];
      3'd1: strb8__h15526 = llc$to_mem_toM_first[527:520];
      3'd2: strb8__h15526 = llc$to_mem_toM_first[535:528];
      3'd3: strb8__h15526 = llc$to_mem_toM_first[543:536];
      3'd4: strb8__h15526 = llc$to_mem_toM_first[551:544];
      3'd5: strb8__h15526 = llc$to_mem_toM_first[559:552];
      3'd6: strb8__h15526 = llc$to_mem_toM_first[567:560];
      3'd7: strb8__h15526 = llc$to_mem_toM_first[575:568];
    endcase
  end
  always@(srcRR_0 or
	  propDstIdx_0_dummy2_1$Q_OUT or
	  IF_propDstIdx_0_lat_0_whas__43_THEN_propDstIdx_ETC___d146 or
	  propDstIdx_1_dummy2_1$Q_OUT or
	  IF_propDstIdx_1_lat_0_whas__50_THEN_propDstIdx_ETC___d153 or
	  propDstIdx_2_dummy2_1$Q_OUT or
	  IF_propDstIdx_2_lat_0_whas__57_THEN_propDstIdx_ETC___d160)
  begin
    case (srcRR_0)
      2'd0:
	  SEL_ARR_propDstIdx_0_dummy2_1_read__95_AND_IF__ETC___d242 =
	      propDstIdx_0_dummy2_1$Q_OUT &&
	      IF_propDstIdx_0_lat_0_whas__43_THEN_propDstIdx_ETC___d146;
      2'd1:
	  SEL_ARR_propDstIdx_0_dummy2_1_read__95_AND_IF__ETC___d242 =
	      propDstIdx_1_dummy2_1$Q_OUT &&
	      IF_propDstIdx_1_lat_0_whas__50_THEN_propDstIdx_ETC___d153;
      2'd2:
	  SEL_ARR_propDstIdx_0_dummy2_1_read__95_AND_IF__ETC___d242 =
	      propDstIdx_2_dummy2_1$Q_OUT &&
	      IF_propDstIdx_2_lat_0_whas__57_THEN_propDstIdx_ETC___d160;
      2'd3:
	  SEL_ARR_propDstIdx_0_dummy2_1_read__95_AND_IF__ETC___d242 =
	      1'b0 /* unspecified value */ ;
    endcase
  end
  always@(srcRR_1_0 or
	  propDstIdx_1_0_dummy2_1$Q_OUT or
	  IF_propDstIdx_1_0_lat_0_whas__76_THEN_propDstI_ETC___d379 or
	  propDstIdx_1_1_dummy2_1$Q_OUT or
	  IF_propDstIdx_1_1_lat_0_whas__83_THEN_propDstI_ETC___d386 or
	  propDstIdx_1_2_dummy2_1$Q_OUT or
	  IF_propDstIdx_1_2_lat_0_whas__90_THEN_propDstI_ETC___d393)
  begin
    case (srcRR_1_0)
      2'd0:
	  SEL_ARR_propDstIdx_1_0_dummy2_1_read__28_AND_I_ETC___d475 =
	      propDstIdx_1_0_dummy2_1$Q_OUT &&
	      IF_propDstIdx_1_0_lat_0_whas__76_THEN_propDstI_ETC___d379;
      2'd1:
	  SEL_ARR_propDstIdx_1_0_dummy2_1_read__28_AND_I_ETC___d475 =
	      propDstIdx_1_1_dummy2_1$Q_OUT &&
	      IF_propDstIdx_1_1_lat_0_whas__83_THEN_propDstI_ETC___d386;
      2'd2:
	  SEL_ARR_propDstIdx_1_0_dummy2_1_read__28_AND_I_ETC___d475 =
	      propDstIdx_1_2_dummy2_1$Q_OUT &&
	      IF_propDstIdx_1_2_lat_0_whas__90_THEN_propDstI_ETC___d393;
      2'd3:
	  SEL_ARR_propDstIdx_1_0_dummy2_1_read__28_AND_I_ETC___d475 =
	      1'b0 /* unspecified value */ ;
    endcase
  end
  always@(x__h45600 or
	  n__read_id__h45828 or n__read_id__h45913 or n__read_id__h45998)
  begin
    case (x__h45600)
      2'd0: x__h46058 = n__read_id__h45828;
      2'd1: x__h46058 = n__read_id__h45913;
      2'd2: x__h46058 = n__read_id__h45998;
      2'd3: x__h46058 = 3'b010 /* unspecified value */ ;
    endcase
  end
  always@(x__h45600 or
	  n__read_child__h45829 or
	  n__read_child__h45914 or n__read_child__h45999)
  begin
    case (x__h45600)
      2'd0: x__h46068 = n__read_child__h45829;
      2'd1: x__h46068 = n__read_child__h45914;
      2'd2: x__h46068 = n__read_child__h45999;
      2'd3: x__h46068 = 2'b10 /* unspecified value */ ;
    endcase
  end
  always@(x__h45600 or
	  propDstData_0_dummy2_1_read__54_AND_IF_propDst_ETC___d306 or
	  propDstData_1_dummy2_1_read__59_AND_IF_propDst_ETC___d310 or
	  propDstData_2_dummy2_1_read__64_AND_IF_propDst_ETC___d314)
  begin
    case (x__h45600)
      2'd0:
	  CASE_x5600_0_propDstData_0_dummy2_1_read__54_A_ETC__q1 =
	      propDstData_0_dummy2_1_read__54_AND_IF_propDst_ETC___d306;
      2'd1:
	  CASE_x5600_0_propDstData_0_dummy2_1_read__54_A_ETC__q1 =
	      propDstData_1_dummy2_1_read__59_AND_IF_propDst_ETC___d310;
      2'd2:
	  CASE_x5600_0_propDstData_0_dummy2_1_read__54_A_ETC__q1 =
	      propDstData_2_dummy2_1_read__64_AND_IF_propDst_ETC___d314;
      2'd3:
	  CASE_x5600_0_propDstData_0_dummy2_1_read__54_A_ETC__q1 =
	      1'b0 /* unspecified value */ ;
    endcase
  end
  always@(x__h45600 or
	  IF_propDstData_0_dummy2_1_read__54_THEN_IF_pro_ETC___d278 or
	  IF_propDstData_1_dummy2_1_read__59_THEN_IF_pro_ETC___d282 or
	  IF_propDstData_2_dummy2_1_read__64_THEN_IF_pro_ETC___d286)
  begin
    case (x__h45600)
      2'd0:
	  CASE_x5600_0_IF_propDstData_0_dummy2_1_read__5_ETC__q2 =
	      IF_propDstData_0_dummy2_1_read__54_THEN_IF_pro_ETC___d278;
      2'd1:
	  CASE_x5600_0_IF_propDstData_0_dummy2_1_read__5_ETC__q2 =
	      IF_propDstData_1_dummy2_1_read__59_THEN_IF_pro_ETC___d282;
      2'd2:
	  CASE_x5600_0_IF_propDstData_0_dummy2_1_read__5_ETC__q2 =
	      IF_propDstData_2_dummy2_1_read__64_THEN_IF_pro_ETC___d286;
      2'd3:
	  CASE_x5600_0_IF_propDstData_0_dummy2_1_read__5_ETC__q2 =
	      2'b10 /* unspecified value */ ;
    endcase
  end
  always@(x__h45600 or
	  IF_propDstData_0_dummy2_1_read__54_THEN_IF_pro_ETC___d292 or
	  IF_propDstData_1_dummy2_1_read__59_THEN_IF_pro_ETC___d296 or
	  IF_propDstData_2_dummy2_1_read__64_THEN_IF_pro_ETC___d300)
  begin
    case (x__h45600)
      2'd0:
	  CASE_x5600_0_IF_propDstData_0_dummy2_1_read__5_ETC__q3 =
	      IF_propDstData_0_dummy2_1_read__54_THEN_IF_pro_ETC___d292;
      2'd1:
	  CASE_x5600_0_IF_propDstData_0_dummy2_1_read__5_ETC__q3 =
	      IF_propDstData_1_dummy2_1_read__59_THEN_IF_pro_ETC___d296;
      2'd2:
	  CASE_x5600_0_IF_propDstData_0_dummy2_1_read__5_ETC__q3 =
	      IF_propDstData_2_dummy2_1_read__64_THEN_IF_pro_ETC___d300;
      2'd3:
	  CASE_x5600_0_IF_propDstData_0_dummy2_1_read__5_ETC__q3 =
	      2'b10 /* unspecified value */ ;
    endcase
  end
  always@(x__h45600 or
	  n__read_addr__h45824 or
	  n__read_addr__h45909 or n__read_addr__h45994)
  begin
    case (x__h45600)
      2'd0:
	  CASE_x5600_0_n__read_addr5824_1_n__read_addr59_ETC__q4 =
	      n__read_addr__h45824;
      2'd1:
	  CASE_x5600_0_n__read_addr5824_1_n__read_addr59_ETC__q4 =
	      n__read_addr__h45909;
      2'd2:
	  CASE_x5600_0_n__read_addr5824_1_n__read_addr59_ETC__q4 =
	      n__read_addr__h45994;
      2'd3:
	  CASE_x5600_0_n__read_addr5824_1_n__read_addr59_ETC__q4 =
	      64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(x__h71624 or
	  n__read_child__h71847 or
	  n__read_child__h71926 or n__read_child__h72005)
  begin
    case (x__h71624)
      2'd0: x__h74996 = n__read_child__h71847;
      2'd1: x__h74996 = n__read_child__h71926;
      2'd2: x__h74996 = n__read_child__h72005;
      2'd3: x__h74996 = 2'b10 /* unspecified value */ ;
    endcase
  end
  always@(x__h71624 or
	  CAN_FIRE_RL_srcPropose_3 or
	  propDstData_1_0_lat_0$wget or
	  propDstData_1_0_rl or
	  CAN_FIRE_RL_srcPropose_4 or
	  propDstData_1_1_lat_0$wget or
	  propDstData_1_1_rl or
	  CAN_FIRE_RL_srcPropose_5 or
	  propDstData_1_2_lat_0$wget or propDstData_1_2_rl)
  begin
    case (x__h71624)
      2'd0:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q5 =
	      CAN_FIRE_RL_srcPropose_3 ?
		propDstData_1_0_lat_0$wget[513:450] :
		propDstData_1_0_rl[513:450];
      2'd1:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q5 =
	      CAN_FIRE_RL_srcPropose_4 ?
		propDstData_1_1_lat_0$wget[513:450] :
		propDstData_1_1_rl[513:450];
      2'd2:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q5 =
	      CAN_FIRE_RL_srcPropose_5 ?
		propDstData_1_2_lat_0$wget[513:450] :
		propDstData_1_2_rl[513:450];
      2'd3:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q5 =
	      64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(x__h71624 or
	  CAN_FIRE_RL_srcPropose_3 or
	  propDstData_1_0_lat_0$wget or
	  propDstData_1_0_rl or
	  CAN_FIRE_RL_srcPropose_4 or
	  propDstData_1_1_lat_0$wget or
	  propDstData_1_1_rl or
	  CAN_FIRE_RL_srcPropose_5 or
	  propDstData_1_2_lat_0$wget or propDstData_1_2_rl)
  begin
    case (x__h71624)
      2'd0:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q6 =
	      CAN_FIRE_RL_srcPropose_3 ?
		propDstData_1_0_lat_0$wget[449:386] :
		propDstData_1_0_rl[449:386];
      2'd1:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q6 =
	      CAN_FIRE_RL_srcPropose_4 ?
		propDstData_1_1_lat_0$wget[449:386] :
		propDstData_1_1_rl[449:386];
      2'd2:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q6 =
	      CAN_FIRE_RL_srcPropose_5 ?
		propDstData_1_2_lat_0$wget[449:386] :
		propDstData_1_2_rl[449:386];
      2'd3:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q6 =
	      64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(x__h71624 or
	  CAN_FIRE_RL_srcPropose_3 or
	  propDstData_1_0_lat_0$wget or
	  propDstData_1_0_rl or
	  CAN_FIRE_RL_srcPropose_4 or
	  propDstData_1_1_lat_0$wget or
	  propDstData_1_1_rl or
	  CAN_FIRE_RL_srcPropose_5 or
	  propDstData_1_2_lat_0$wget or propDstData_1_2_rl)
  begin
    case (x__h71624)
      2'd0:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q7 =
	      CAN_FIRE_RL_srcPropose_3 ?
		propDstData_1_0_lat_0$wget[385:322] :
		propDstData_1_0_rl[385:322];
      2'd1:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q7 =
	      CAN_FIRE_RL_srcPropose_4 ?
		propDstData_1_1_lat_0$wget[385:322] :
		propDstData_1_1_rl[385:322];
      2'd2:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q7 =
	      CAN_FIRE_RL_srcPropose_5 ?
		propDstData_1_2_lat_0$wget[385:322] :
		propDstData_1_2_rl[385:322];
      2'd3:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q7 =
	      64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(x__h71624 or
	  CAN_FIRE_RL_srcPropose_3 or
	  propDstData_1_0_lat_0$wget or
	  propDstData_1_0_rl or
	  CAN_FIRE_RL_srcPropose_4 or
	  propDstData_1_1_lat_0$wget or
	  propDstData_1_1_rl or
	  CAN_FIRE_RL_srcPropose_5 or
	  propDstData_1_2_lat_0$wget or propDstData_1_2_rl)
  begin
    case (x__h71624)
      2'd0:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q8 =
	      CAN_FIRE_RL_srcPropose_3 ?
		propDstData_1_0_lat_0$wget[321:258] :
		propDstData_1_0_rl[321:258];
      2'd1:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q8 =
	      CAN_FIRE_RL_srcPropose_4 ?
		propDstData_1_1_lat_0$wget[321:258] :
		propDstData_1_1_rl[321:258];
      2'd2:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q8 =
	      CAN_FIRE_RL_srcPropose_5 ?
		propDstData_1_2_lat_0$wget[321:258] :
		propDstData_1_2_rl[321:258];
      2'd3:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q8 =
	      64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(x__h71624 or
	  CAN_FIRE_RL_srcPropose_3 or
	  propDstData_1_0_lat_0$wget or
	  propDstData_1_0_rl or
	  CAN_FIRE_RL_srcPropose_4 or
	  propDstData_1_1_lat_0$wget or
	  propDstData_1_1_rl or
	  CAN_FIRE_RL_srcPropose_5 or
	  propDstData_1_2_lat_0$wget or propDstData_1_2_rl)
  begin
    case (x__h71624)
      2'd0:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q9 =
	      CAN_FIRE_RL_srcPropose_3 ?
		propDstData_1_0_lat_0$wget[257:194] :
		propDstData_1_0_rl[257:194];
      2'd1:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q9 =
	      CAN_FIRE_RL_srcPropose_4 ?
		propDstData_1_1_lat_0$wget[257:194] :
		propDstData_1_1_rl[257:194];
      2'd2:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q9 =
	      CAN_FIRE_RL_srcPropose_5 ?
		propDstData_1_2_lat_0$wget[257:194] :
		propDstData_1_2_rl[257:194];
      2'd3:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q9 =
	      64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(x__h71624 or
	  CAN_FIRE_RL_srcPropose_3 or
	  propDstData_1_0_lat_0$wget or
	  propDstData_1_0_rl or
	  CAN_FIRE_RL_srcPropose_4 or
	  propDstData_1_1_lat_0$wget or
	  propDstData_1_1_rl or
	  CAN_FIRE_RL_srcPropose_5 or
	  propDstData_1_2_lat_0$wget or propDstData_1_2_rl)
  begin
    case (x__h71624)
      2'd0:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q10 =
	      CAN_FIRE_RL_srcPropose_3 ?
		propDstData_1_0_lat_0$wget[193:130] :
		propDstData_1_0_rl[193:130];
      2'd1:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q10 =
	      CAN_FIRE_RL_srcPropose_4 ?
		propDstData_1_1_lat_0$wget[193:130] :
		propDstData_1_1_rl[193:130];
      2'd2:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q10 =
	      CAN_FIRE_RL_srcPropose_5 ?
		propDstData_1_2_lat_0$wget[193:130] :
		propDstData_1_2_rl[193:130];
      2'd3:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q10 =
	      64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(x__h71624 or
	  CAN_FIRE_RL_srcPropose_3 or
	  propDstData_1_0_lat_0$wget or
	  propDstData_1_0_rl or
	  CAN_FIRE_RL_srcPropose_4 or
	  propDstData_1_1_lat_0$wget or
	  propDstData_1_1_rl or
	  CAN_FIRE_RL_srcPropose_5 or
	  propDstData_1_2_lat_0$wget or propDstData_1_2_rl)
  begin
    case (x__h71624)
      2'd0:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q11 =
	      CAN_FIRE_RL_srcPropose_3 ?
		propDstData_1_0_lat_0$wget[129:66] :
		propDstData_1_0_rl[129:66];
      2'd1:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q11 =
	      CAN_FIRE_RL_srcPropose_4 ?
		propDstData_1_1_lat_0$wget[129:66] :
		propDstData_1_1_rl[129:66];
      2'd2:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q11 =
	      CAN_FIRE_RL_srcPropose_5 ?
		propDstData_1_2_lat_0$wget[129:66] :
		propDstData_1_2_rl[129:66];
      2'd3:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q11 =
	      64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(x__h71624 or
	  propDstData_1_0_dummy2_1_read__87_AND_IF_propD_ETC___d525 or
	  propDstData_1_1_dummy2_1_read__92_AND_IF_propD_ETC___d529 or
	  propDstData_1_2_dummy2_1_read__97_AND_IF_propD_ETC___d533)
  begin
    case (x__h71624)
      2'd0:
	  CASE_x1624_0_propDstData_1_0_dummy2_1_read__87_ETC__q12 =
	      propDstData_1_0_dummy2_1_read__87_AND_IF_propD_ETC___d525;
      2'd1:
	  CASE_x1624_0_propDstData_1_0_dummy2_1_read__87_ETC__q12 =
	      propDstData_1_1_dummy2_1_read__92_AND_IF_propD_ETC___d529;
      2'd2:
	  CASE_x1624_0_propDstData_1_0_dummy2_1_read__87_ETC__q12 =
	      propDstData_1_2_dummy2_1_read__97_AND_IF_propD_ETC___d533;
      2'd3:
	  CASE_x1624_0_propDstData_1_0_dummy2_1_read__87_ETC__q12 =
	      1'b0 /* unspecified value */ ;
    endcase
  end
  always@(x__h71624 or
	  CAN_FIRE_RL_srcPropose_3 or
	  propDstData_1_0_lat_0$wget or
	  propDstData_1_0_rl or
	  CAN_FIRE_RL_srcPropose_4 or
	  propDstData_1_1_lat_0$wget or
	  propDstData_1_1_rl or
	  CAN_FIRE_RL_srcPropose_5 or
	  propDstData_1_2_lat_0$wget or propDstData_1_2_rl)
  begin
    case (x__h71624)
      2'd0:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q13 =
	      CAN_FIRE_RL_srcPropose_3 ?
		propDstData_1_0_lat_0$wget[65:2] :
		propDstData_1_0_rl[65:2];
      2'd1:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q13 =
	      CAN_FIRE_RL_srcPropose_4 ?
		propDstData_1_1_lat_0$wget[65:2] :
		propDstData_1_1_rl[65:2];
      2'd2:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q13 =
	      CAN_FIRE_RL_srcPropose_5 ?
		propDstData_1_2_lat_0$wget[65:2] :
		propDstData_1_2_rl[65:2];
      2'd3:
	  CASE_x1624_0_IF_CAN_FIRE_RL_srcPropose_3_THEN__ETC__q13 =
	      64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(x__h71624 or
	  IF_propDstData_1_0_dummy2_1_read__87_THEN_IF_p_ETC___d511 or
	  IF_propDstData_1_1_dummy2_1_read__92_THEN_IF_p_ETC___d515 or
	  IF_propDstData_1_2_dummy2_1_read__97_THEN_IF_p_ETC___d519)
  begin
    case (x__h71624)
      2'd0:
	  CASE_x1624_0_IF_propDstData_1_0_dummy2_1_read__ETC__q14 =
	      IF_propDstData_1_0_dummy2_1_read__87_THEN_IF_p_ETC___d511;
      2'd1:
	  CASE_x1624_0_IF_propDstData_1_0_dummy2_1_read__ETC__q14 =
	      IF_propDstData_1_1_dummy2_1_read__92_THEN_IF_p_ETC___d515;
      2'd2:
	  CASE_x1624_0_IF_propDstData_1_0_dummy2_1_read__ETC__q14 =
	      IF_propDstData_1_2_dummy2_1_read__97_THEN_IF_p_ETC___d519;
      2'd3:
	  CASE_x1624_0_IF_propDstData_1_0_dummy2_1_read__ETC__q14 =
	      2'b10 /* unspecified value */ ;
    endcase
  end
  always@(x__h71624 or
	  n__read_addr__h71844 or
	  n__read_addr__h71923 or n__read_addr__h72002)
  begin
    case (x__h71624)
      2'd0:
	  CASE_x1624_0_n__read_addr1844_1_n__read_addr19_ETC__q15 =
	      n__read_addr__h71844;
      2'd1:
	  CASE_x1624_0_n__read_addr1844_1_n__read_addr19_ETC__q15 =
	      n__read_addr__h71923;
      2'd2:
	  CASE_x1624_0_n__read_addr1844_1_n__read_addr19_ETC__q15 =
	      n__read_addr__h72002;
      2'd3:
	  CASE_x1624_0_n__read_addr1844_1_n__read_addr19_ETC__q15 =
	      64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cfg_verbosity <= `BSV_ASSIGNMENT_DELAY 4'd0;
	enqDst_0_rl <= `BSV_ASSIGNMENT_DELAY 75'h2AAAAAAAAAAAAAAAAAA;
	enqDst_1_0_rl <= `BSV_ASSIGNMENT_DELAY
	    582'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	llc_axi4_adapter_ctr_wr_rsps_pending_crg <= `BSV_ASSIGNMENT_DELAY
	    4'd0;
	llc_axi4_adapter_master_xactor_crg_rd_addr_full <= `BSV_ASSIGNMENT_DELAY
	    1'd0;
	llc_axi4_adapter_master_xactor_crg_rd_data_full <= `BSV_ASSIGNMENT_DELAY
	    1'd0;
	llc_axi4_adapter_master_xactor_crg_wr_addr_full <= `BSV_ASSIGNMENT_DELAY
	    1'd0;
	llc_axi4_adapter_master_xactor_crg_wr_data_full <= `BSV_ASSIGNMENT_DELAY
	    1'd0;
	llc_axi4_adapter_master_xactor_crg_wr_resp_full <= `BSV_ASSIGNMENT_DELAY
	    1'd0;
	llc_axi4_adapter_rg_AXI4_error <= `BSV_ASSIGNMENT_DELAY 1'd0;
	llc_axi4_adapter_rg_ddr4_ready <= `BSV_ASSIGNMENT_DELAY 1'd0;
	llc_axi4_adapter_rg_rd_req_beat <= `BSV_ASSIGNMENT_DELAY 3'd0;
	llc_axi4_adapter_rg_rd_rsp_beat <= `BSV_ASSIGNMENT_DELAY 3'd0;
	llc_axi4_adapter_rg_wr_req_beat <= `BSV_ASSIGNMENT_DELAY 3'd0;
	llc_axi4_adapter_rg_wr_rsp_beat <= `BSV_ASSIGNMENT_DELAY 3'd0;
	propDstData_0_rl <= `BSV_ASSIGNMENT_DELAY 74'h2AAAAAAAAAAAAAAAAAA;
	propDstData_1_0_rl <= `BSV_ASSIGNMENT_DELAY
	    581'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	propDstData_1_1_rl <= `BSV_ASSIGNMENT_DELAY
	    581'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	propDstData_1_2_rl <= `BSV_ASSIGNMENT_DELAY
	    581'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	propDstData_1_rl <= `BSV_ASSIGNMENT_DELAY 74'h2AAAAAAAAAAAAAAAAAA;
	propDstData_2_rl <= `BSV_ASSIGNMENT_DELAY 74'h2AAAAAAAAAAAAAAAAAA;
	propDstIdx_0_rl <= `BSV_ASSIGNMENT_DELAY 1'd0;
	propDstIdx_1_0_rl <= `BSV_ASSIGNMENT_DELAY 1'd0;
	propDstIdx_1_1_rl <= `BSV_ASSIGNMENT_DELAY 1'd0;
	propDstIdx_1_2_rl <= `BSV_ASSIGNMENT_DELAY 1'd0;
	propDstIdx_1_rl <= `BSV_ASSIGNMENT_DELAY 1'd0;
	propDstIdx_2_rl <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_state <= `BSV_ASSIGNMENT_DELAY 2'd2;
	srcRR_0 <= `BSV_ASSIGNMENT_DELAY 2'd0;
	srcRR_1_0 <= `BSV_ASSIGNMENT_DELAY 2'd0;
      end
    else
      begin
        if (cfg_verbosity$EN)
	  cfg_verbosity <= `BSV_ASSIGNMENT_DELAY cfg_verbosity$D_IN;
	if (enqDst_0_rl$EN)
	  enqDst_0_rl <= `BSV_ASSIGNMENT_DELAY enqDst_0_rl$D_IN;
	if (enqDst_1_0_rl$EN)
	  enqDst_1_0_rl <= `BSV_ASSIGNMENT_DELAY enqDst_1_0_rl$D_IN;
	if (llc_axi4_adapter_ctr_wr_rsps_pending_crg$EN)
	  llc_axi4_adapter_ctr_wr_rsps_pending_crg <= `BSV_ASSIGNMENT_DELAY
	      llc_axi4_adapter_ctr_wr_rsps_pending_crg$D_IN;
	if (llc_axi4_adapter_master_xactor_crg_rd_addr_full$EN)
	  llc_axi4_adapter_master_xactor_crg_rd_addr_full <= `BSV_ASSIGNMENT_DELAY
	      llc_axi4_adapter_master_xactor_crg_rd_addr_full$D_IN;
	if (llc_axi4_adapter_master_xactor_crg_rd_data_full$EN)
	  llc_axi4_adapter_master_xactor_crg_rd_data_full <= `BSV_ASSIGNMENT_DELAY
	      llc_axi4_adapter_master_xactor_crg_rd_data_full$D_IN;
	if (llc_axi4_adapter_master_xactor_crg_wr_addr_full$EN)
	  llc_axi4_adapter_master_xactor_crg_wr_addr_full <= `BSV_ASSIGNMENT_DELAY
	      llc_axi4_adapter_master_xactor_crg_wr_addr_full$D_IN;
	if (llc_axi4_adapter_master_xactor_crg_wr_data_full$EN)
	  llc_axi4_adapter_master_xactor_crg_wr_data_full <= `BSV_ASSIGNMENT_DELAY
	      llc_axi4_adapter_master_xactor_crg_wr_data_full$D_IN;
	if (llc_axi4_adapter_master_xactor_crg_wr_resp_full$EN)
	  llc_axi4_adapter_master_xactor_crg_wr_resp_full <= `BSV_ASSIGNMENT_DELAY
	      llc_axi4_adapter_master_xactor_crg_wr_resp_full$D_IN;
	if (llc_axi4_adapter_rg_AXI4_error$EN)
	  llc_axi4_adapter_rg_AXI4_error <= `BSV_ASSIGNMENT_DELAY
	      llc_axi4_adapter_rg_AXI4_error$D_IN;
	if (llc_axi4_adapter_rg_ddr4_ready$EN)
	  llc_axi4_adapter_rg_ddr4_ready <= `BSV_ASSIGNMENT_DELAY
	      llc_axi4_adapter_rg_ddr4_ready$D_IN;
	if (llc_axi4_adapter_rg_rd_req_beat$EN)
	  llc_axi4_adapter_rg_rd_req_beat <= `BSV_ASSIGNMENT_DELAY
	      llc_axi4_adapter_rg_rd_req_beat$D_IN;
	if (llc_axi4_adapter_rg_rd_rsp_beat$EN)
	  llc_axi4_adapter_rg_rd_rsp_beat <= `BSV_ASSIGNMENT_DELAY
	      llc_axi4_adapter_rg_rd_rsp_beat$D_IN;
	if (llc_axi4_adapter_rg_wr_req_beat$EN)
	  llc_axi4_adapter_rg_wr_req_beat <= `BSV_ASSIGNMENT_DELAY
	      llc_axi4_adapter_rg_wr_req_beat$D_IN;
	if (llc_axi4_adapter_rg_wr_rsp_beat$EN)
	  llc_axi4_adapter_rg_wr_rsp_beat <= `BSV_ASSIGNMENT_DELAY
	      llc_axi4_adapter_rg_wr_rsp_beat$D_IN;
	if (propDstData_0_rl$EN)
	  propDstData_0_rl <= `BSV_ASSIGNMENT_DELAY propDstData_0_rl$D_IN;
	if (propDstData_1_0_rl$EN)
	  propDstData_1_0_rl <= `BSV_ASSIGNMENT_DELAY propDstData_1_0_rl$D_IN;
	if (propDstData_1_1_rl$EN)
	  propDstData_1_1_rl <= `BSV_ASSIGNMENT_DELAY propDstData_1_1_rl$D_IN;
	if (propDstData_1_2_rl$EN)
	  propDstData_1_2_rl <= `BSV_ASSIGNMENT_DELAY propDstData_1_2_rl$D_IN;
	if (propDstData_1_rl$EN)
	  propDstData_1_rl <= `BSV_ASSIGNMENT_DELAY propDstData_1_rl$D_IN;
	if (propDstData_2_rl$EN)
	  propDstData_2_rl <= `BSV_ASSIGNMENT_DELAY propDstData_2_rl$D_IN;
	if (propDstIdx_0_rl$EN)
	  propDstIdx_0_rl <= `BSV_ASSIGNMENT_DELAY propDstIdx_0_rl$D_IN;
	if (propDstIdx_1_0_rl$EN)
	  propDstIdx_1_0_rl <= `BSV_ASSIGNMENT_DELAY propDstIdx_1_0_rl$D_IN;
	if (propDstIdx_1_1_rl$EN)
	  propDstIdx_1_1_rl <= `BSV_ASSIGNMENT_DELAY propDstIdx_1_1_rl$D_IN;
	if (propDstIdx_1_2_rl$EN)
	  propDstIdx_1_2_rl <= `BSV_ASSIGNMENT_DELAY propDstIdx_1_2_rl$D_IN;
	if (propDstIdx_1_rl$EN)
	  propDstIdx_1_rl <= `BSV_ASSIGNMENT_DELAY propDstIdx_1_rl$D_IN;
	if (propDstIdx_2_rl$EN)
	  propDstIdx_2_rl <= `BSV_ASSIGNMENT_DELAY propDstIdx_2_rl$D_IN;
	if (rg_state$EN) rg_state <= `BSV_ASSIGNMENT_DELAY rg_state$D_IN;
	if (srcRR_0$EN) srcRR_0 <= `BSV_ASSIGNMENT_DELAY srcRR_0$D_IN;
	if (srcRR_1_0$EN) srcRR_1_0 <= `BSV_ASSIGNMENT_DELAY srcRR_1_0$D_IN;
      end
    if (llc_axi4_adapter_master_xactor_rg_rd_addr$EN)
      llc_axi4_adapter_master_xactor_rg_rd_addr <= `BSV_ASSIGNMENT_DELAY
	  llc_axi4_adapter_master_xactor_rg_rd_addr$D_IN;
    if (llc_axi4_adapter_master_xactor_rg_rd_data$EN)
      llc_axi4_adapter_master_xactor_rg_rd_data <= `BSV_ASSIGNMENT_DELAY
	  llc_axi4_adapter_master_xactor_rg_rd_data$D_IN;
    if (llc_axi4_adapter_master_xactor_rg_wr_addr$EN)
      llc_axi4_adapter_master_xactor_rg_wr_addr <= `BSV_ASSIGNMENT_DELAY
	  llc_axi4_adapter_master_xactor_rg_wr_addr$D_IN;
    if (llc_axi4_adapter_master_xactor_rg_wr_data$EN)
      llc_axi4_adapter_master_xactor_rg_wr_data <= `BSV_ASSIGNMENT_DELAY
	  llc_axi4_adapter_master_xactor_rg_wr_data$D_IN;
    if (llc_axi4_adapter_master_xactor_rg_wr_resp$EN)
      llc_axi4_adapter_master_xactor_rg_wr_resp <= `BSV_ASSIGNMENT_DELAY
	  llc_axi4_adapter_master_xactor_rg_wr_resp$D_IN;
    if (llc_axi4_adapter_rg_cline$EN)
      llc_axi4_adapter_rg_cline <= `BSV_ASSIGNMENT_DELAY
	  llc_axi4_adapter_rg_cline$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cfg_verbosity = 4'hA;
    enqDst_0_rl = 75'h2AAAAAAAAAAAAAAAAAA;
    enqDst_1_0_rl =
	582'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    llc_axi4_adapter_ctr_wr_rsps_pending_crg = 4'hA;
    llc_axi4_adapter_master_xactor_crg_rd_addr_full = 1'h0;
    llc_axi4_adapter_master_xactor_crg_rd_data_full = 1'h0;
    llc_axi4_adapter_master_xactor_crg_wr_addr_full = 1'h0;
    llc_axi4_adapter_master_xactor_crg_wr_data_full = 1'h0;
    llc_axi4_adapter_master_xactor_crg_wr_resp_full = 1'h0;
    llc_axi4_adapter_master_xactor_rg_rd_addr =
	109'h0AAAAAAAAAAAAAAAAAAAAAAAAAAA;
    llc_axi4_adapter_master_xactor_rg_rd_data = 83'h2AAAAAAAAAAAAAAAAAAAA;
    llc_axi4_adapter_master_xactor_rg_wr_addr =
	109'h0AAAAAAAAAAAAAAAAAAAAAAAAAAA;
    llc_axi4_adapter_master_xactor_rg_wr_data = 73'h0AAAAAAAAAAAAAAAAAA;
    llc_axi4_adapter_master_xactor_rg_wr_resp = 18'h2AAAA;
    llc_axi4_adapter_rg_AXI4_error = 1'h0;
    llc_axi4_adapter_rg_cline =
	512'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    llc_axi4_adapter_rg_ddr4_ready = 1'h0;
    llc_axi4_adapter_rg_rd_req_beat = 3'h2;
    llc_axi4_adapter_rg_rd_rsp_beat = 3'h2;
    llc_axi4_adapter_rg_wr_req_beat = 3'h2;
    llc_axi4_adapter_rg_wr_rsp_beat = 3'h2;
    propDstData_0_rl = 74'h2AAAAAAAAAAAAAAAAAA;
    propDstData_1_0_rl =
	581'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    propDstData_1_1_rl =
	581'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    propDstData_1_2_rl =
	581'h0AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    propDstData_1_rl = 74'h2AAAAAAAAAAAAAAAAAA;
    propDstData_2_rl = 74'h2AAAAAAAAAAAAAAAAAA;
    propDstIdx_0_rl = 1'h0;
    propDstIdx_1_0_rl = 1'h0;
    propDstIdx_1_1_rl = 1'h0;
    propDstIdx_1_2_rl = 1'h0;
    propDstIdx_1_rl = 1'h0;
    propDstIdx_2_rl = 1'h0;
    rg_state = 2'h2;
    srcRR_0 = 2'h2;
    srcRR_1_0 = 2'h2;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253 &&
	  x__h45600 == 2'd0 &&
	  NOT_propDstIdx_0_dummy2_1_read__95_96_OR_IF_pr_ETC___d245)
	$display("Dynamic assertion failed: \"../../src_Core/Near_Mem_VM_WB_L1_L2/src_LLCache/coherence/src/CrossBar.bsv\", line 123, column 53\nsrc must be proposing");
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253 &&
	  x__h45600 == 2'd0 &&
	  NOT_propDstIdx_0_dummy2_1_read__95_96_OR_IF_pr_ETC___d245)
	$finish(32'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253 &&
	  x__h45600 == 2'd1 &&
	  NOT_propDstIdx_1_dummy2_1_read__08_09_OR_IF_pr_ETC___d248)
	$display("Dynamic assertion failed: \"../../src_Core/Near_Mem_VM_WB_L1_L2/src_LLCache/coherence/src/CrossBar.bsv\", line 123, column 53\nsrc must be proposing");
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253 &&
	  x__h45600 == 2'd1 &&
	  NOT_propDstIdx_1_dummy2_1_read__08_09_OR_IF_pr_ETC___d248)
	$finish(32'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253 &&
	  x__h45600 == 2'd2 &&
	  NOT_propDstIdx_2_dummy2_1_read__21_22_OR_IF_pr_ETC___d363)
	$display("Dynamic assertion failed: \"../../src_Core/Near_Mem_VM_WB_L1_L2/src_LLCache/coherence/src/CrossBar.bsv\", line 123, column 53\nsrc must be proposing");
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_enqDst_0_dummy2_0_read__29_30_OR_NOT_enqDs_ETC___d253 &&
	  x__h45600 == 2'd2 &&
	  NOT_propDstIdx_2_dummy2_1_read__21_22_OR_IF_pr_ETC___d363)
	$finish(32'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486 &&
	  x__h71624 == 2'd0 &&
	  NOT_propDstIdx_1_0_dummy2_1_read__28_29_OR_IF__ETC___d478)
	$display("Dynamic assertion failed: \"../../src_Core/Near_Mem_VM_WB_L1_L2/src_LLCache/coherence/src/CrossBar.bsv\", line 123, column 53\nsrc must be proposing");
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486 &&
	  x__h71624 == 2'd0 &&
	  NOT_propDstIdx_1_0_dummy2_1_read__28_29_OR_IF__ETC___d478)
	$finish(32'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486 &&
	  x__h71624 == 2'd1 &&
	  NOT_propDstIdx_1_1_dummy2_1_read__41_42_OR_IF__ETC___d481)
	$display("Dynamic assertion failed: \"../../src_Core/Near_Mem_VM_WB_L1_L2/src_LLCache/coherence/src/CrossBar.bsv\", line 123, column 53\nsrc must be proposing");
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486 &&
	  x__h71624 == 2'd1 &&
	  NOT_propDstIdx_1_1_dummy2_1_read__41_42_OR_IF__ETC___d481)
	$finish(32'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486 &&
	  x__h71624 == 2'd2 &&
	  NOT_propDstIdx_1_2_dummy2_1_read__54_55_OR_IF__ETC___d659)
	$display("Dynamic assertion failed: \"../../src_Core/Near_Mem_VM_WB_L1_L2/src_LLCache/coherence/src/CrossBar.bsv\", line 123, column 53\nsrc must be proposing");
    if (RST_N != `BSV_RESET_VALUE)
      if (NOT_enqDst_1_0_dummy2_0_read__62_63_OR_NOT_enq_ETC___d486 &&
	  x__h71624 == 2'd2 &&
	  NOT_propDstIdx_1_2_dummy2_1_read__54_55_OR_IF__ETC___d659)
	$finish(32'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && NOT_cfg_verbosity_read__38_ULE_1_39___d740)
	begin
	  v__h84135 = $stime;
	  #0;
	end
    v__h84129 = v__h84135 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && NOT_cfg_verbosity_read__38_ULE_1_39___d740)
	$display("%0d: Near_Mem.rl_reset", v__h84129);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete &&
	  NOT_cfg_verbosity_read__38_ULE_1_39___d740)
	begin
	  v__h84241 = $stime;
	  #0;
	end
    v__h84235 = v__h84241 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete &&
	  NOT_cfg_verbosity_read__38_ULE_1_39___d740)
	$display("%0d: Near_Mem.rl_reset_complete", v__h84235);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0)
	begin
	  v__h13951 = $stime;
	  #0;
	end
    v__h13945 = v__h13951 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0)
	$display("%0d: LLC_AXI4_Adapter.rl_handle_read_rsp: fabric response error; exit",
		 v__h13945);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0)
	$write("AXI4_Rd_Data { ", "rid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0)
	$write("'h%h", llc_axi4_adapter_master_xactor_rg_rd_data[82:67]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0)
	$write(", ", "rdata: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0)
	$write("'h%h", llc_axi4_adapter_master_xactor_rg_rd_data[66:3]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0)
	$write(", ", "rresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0)
	$write("'h%h", llc_axi4_adapter_master_xactor_rg_rd_data[2:1]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0)
	$write(", ", "rlast: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0 &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[0])
	$write("True");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0 &&
	  !llc_axi4_adapter_master_xactor_rg_rd_data[0])
	$write("False");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0)
	$write(", ", "ruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_handle_read_rsps &&
	  llc_axi4_adapter_master_xactor_rg_rd_data[2:1] != 2'b0)
	$finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_ddr4_ready)
	begin
	  v__h85786 = $stime;
	  #0;
	end
    v__h85780 = v__h85786 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_ddr4_ready)
	$display("%0d: %m.LLC_AXI4_Adapter.ma_ddr4_ready: enabling all rules",
		 v__h85780);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp &&
	  llc_axi4_adapter_master_xactor_rg_wr_resp[1:0] != 2'b0)
	begin
	  v__h31896 = $stime;
	  #0;
	end
    v__h31890 = v__h31896 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp &&
	  llc_axi4_adapter_master_xactor_rg_wr_resp[1:0] != 2'b0)
	$display("%0d: %m.LLC_AXI4_Adapter.rl_discard_write_rsp", v__h31890);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp &&
	  llc_axi4_adapter_master_xactor_rg_wr_resp[1:0] != 2'b0)
	$display("    ERROR: fabric response error: exit");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp &&
	  llc_axi4_adapter_master_xactor_rg_wr_resp[1:0] != 2'b0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp &&
	  llc_axi4_adapter_master_xactor_rg_wr_resp[1:0] != 2'b0)
	$write("AXI4_Wr_Resp { ", "bid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp &&
	  llc_axi4_adapter_master_xactor_rg_wr_resp[1:0] != 2'b0)
	$write("'h%h", llc_axi4_adapter_master_xactor_rg_wr_resp[17:2]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp &&
	  llc_axi4_adapter_master_xactor_rg_wr_resp[1:0] != 2'b0)
	$write(", ", "bresp: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp &&
	  llc_axi4_adapter_master_xactor_rg_wr_resp[1:0] != 2'b0)
	$write("'h%h", llc_axi4_adapter_master_xactor_rg_wr_resp[1:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp &&
	  llc_axi4_adapter_master_xactor_rg_wr_resp[1:0] != 2'b0)
	$write(", ", "buser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp &&
	  llc_axi4_adapter_master_xactor_rg_wr_resp[1:0] != 2'b0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp &&
	  llc_axi4_adapter_master_xactor_rg_wr_resp[1:0] != 2'b0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_llc_axi4_adapter_rl_discard_write_rsp &&
	  llc_axi4_adapter_master_xactor_rg_wr_resp[1:0] != 2'b0)
	$finish(32'd1);
  end
  // synopsys translate_on
endmodule