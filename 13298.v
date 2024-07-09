module outputs
  wire [578 : 0] l2_to_l1_server_response_first;
  wire [511 : 0] axi4_s_rdata;
  wire [130 : 0] mmio_client_request_get;
  wire [68 : 0] l1_to_l2_client_request_first;
  wire [15 : 0] axi4_s_bid, axi4_s_rid;
  wire [1 : 0] axi4_s_bresp, axi4_s_rresp;
  wire RDY_l1_to_l2_client_request_deq,
       RDY_l1_to_l2_client_request_first,
       RDY_l1_to_l2_client_request_notEmpty,
       RDY_l1_to_l2_client_response_enq,
       RDY_l1_to_l2_client_response_notFull,
       RDY_l2_to_l1_server_request_enq,
       RDY_l2_to_l1_server_request_notFull,
       RDY_l2_to_l1_server_response_deq,
       RDY_l2_to_l1_server_response_first,
       RDY_l2_to_l1_server_response_notEmpty,
       RDY_mmio_client_request_get,
       RDY_mmio_client_response_put,
       axi4_s_arready,
       axi4_s_awready,
       axi4_s_bvalid,
       axi4_s_rlast,
       axi4_s_rvalid,
       axi4_s_wready,
       l1_to_l2_client_request_notEmpty,
       l1_to_l2_client_response_notFull,
       l2_to_l1_server_request_notFull,
       l2_to_l1_server_response_notEmpty;
  // register axi4_to_ld_rg_bytelane_hi
  reg [7 : 0] axi4_to_ld_rg_bytelane_hi;
  reg [7 : 0] axi4_to_ld_rg_bytelane_hi$D_IN;
  wire axi4_to_ld_rg_bytelane_hi$EN;
  // register axi4_to_ld_rg_bytelane_lo
  reg [7 : 0] axi4_to_ld_rg_bytelane_lo;
  reg [7 : 0] axi4_to_ld_rg_bytelane_lo$D_IN;
  wire axi4_to_ld_rg_bytelane_lo$EN;
  // register axi4_to_ld_rg_bytelane_slice_lo
  reg [7 : 0] axi4_to_ld_rg_bytelane_slice_lo;
  reg [7 : 0] axi4_to_ld_rg_bytelane_slice_lo$D_IN;
  wire axi4_to_ld_rg_bytelane_slice_lo$EN;
  // register axi4_to_ld_rg_cumulative_err
  reg axi4_to_ld_rg_cumulative_err;
  wire axi4_to_ld_rg_cumulative_err$D_IN, axi4_to_ld_rg_cumulative_err$EN;
  // register axi4_to_ld_rg_remaining_slices
  reg [3 : 0] axi4_to_ld_rg_remaining_slices;
  reg [3 : 0] axi4_to_ld_rg_remaining_slices$D_IN;
  wire axi4_to_ld_rg_remaining_slices$EN;
  // register axi4_to_ld_rg_slice
  reg [63 : 0] axi4_to_ld_rg_slice;
  wire [63 : 0] axi4_to_ld_rg_slice$D_IN;
  wire axi4_to_ld_rg_slice$EN;
  // register axi4_to_ld_rg_state
  reg [2 : 0] axi4_to_ld_rg_state;
  reg [2 : 0] axi4_to_ld_rg_state$D_IN;
  wire axi4_to_ld_rg_state$EN;
  // register axi4_to_ld_rg_v_slice
  reg [511 : 0] axi4_to_ld_rg_v_slice;
  wire [511 : 0] axi4_to_ld_rg_v_slice$D_IN;
  wire axi4_to_ld_rg_v_slice$EN;
  // register axi4_to_st_rg_bytelane_hi
  reg [7 : 0] axi4_to_st_rg_bytelane_hi;
  reg [7 : 0] axi4_to_st_rg_bytelane_hi$D_IN;
  wire axi4_to_st_rg_bytelane_hi$EN;
  // register axi4_to_st_rg_bytelane_lo
  reg [7 : 0] axi4_to_st_rg_bytelane_lo;
  reg [7 : 0] axi4_to_st_rg_bytelane_lo$D_IN;
  wire axi4_to_st_rg_bytelane_lo$EN;
  // register axi4_to_st_rg_bytelane_slice_lo
  reg [7 : 0] axi4_to_st_rg_bytelane_slice_lo;
  reg [7 : 0] axi4_to_st_rg_bytelane_slice_lo$D_IN;
  wire axi4_to_st_rg_bytelane_slice_lo$EN;
  // register axi4_to_st_rg_cumulative_err
  reg axi4_to_st_rg_cumulative_err;
  wire axi4_to_st_rg_cumulative_err$D_IN, axi4_to_st_rg_cumulative_err$EN;
  // register axi4_to_st_rg_discard_count
  reg [7 : 0] axi4_to_st_rg_discard_count;
  wire [7 : 0] axi4_to_st_rg_discard_count$D_IN;
  wire axi4_to_st_rg_discard_count$EN;
  // register axi4_to_st_rg_slice
  reg [63 : 0] axi4_to_st_rg_slice;
  reg [63 : 0] axi4_to_st_rg_slice$D_IN;
  wire axi4_to_st_rg_slice$EN;
  // register axi4_to_st_rg_state
  reg [2 : 0] axi4_to_st_rg_state;
  reg [2 : 0] axi4_to_st_rg_state$D_IN;
  wire axi4_to_st_rg_state$EN;
  // register axi4_to_st_rg_v_slice
  reg [511 : 0] axi4_to_st_rg_v_slice;
  reg [511 : 0] axi4_to_st_rg_v_slice$D_IN;
  wire axi4_to_st_rg_v_slice$EN;
  // register axi4_to_st_rg_v_strb
  reg [63 : 0] axi4_to_st_rg_v_strb;
  reg [63 : 0] axi4_to_st_rg_v_strb$D_IN;
  wire axi4_to_st_rg_v_strb$EN;
  // register rg_init_index
  reg [5 : 0] rg_init_index;
  wire [5 : 0] rg_init_index$D_IN;
  wire rg_init_index$EN;
  // register rg_state
  reg [1 : 0] rg_state;
  wire [1 : 0] rg_state$D_IN;
  wire rg_state$EN;
  // ports of submodule axi4_s_xactor_f_rd_addr
  wire [108 : 0] axi4_s_xactor_f_rd_addr$D_IN, axi4_s_xactor_f_rd_addr$D_OUT;
  wire axi4_s_xactor_f_rd_addr$CLR,
       axi4_s_xactor_f_rd_addr$DEQ,
       axi4_s_xactor_f_rd_addr$EMPTY_N,
       axi4_s_xactor_f_rd_addr$ENQ,
       axi4_s_xactor_f_rd_addr$FULL_N;
  // ports of submodule axi4_s_xactor_f_rd_data
  reg [530 : 0] axi4_s_xactor_f_rd_data$D_IN;
  wire [530 : 0] axi4_s_xactor_f_rd_data$D_OUT;
  wire axi4_s_xactor_f_rd_data$CLR,
       axi4_s_xactor_f_rd_data$DEQ,
       axi4_s_xactor_f_rd_data$EMPTY_N,
       axi4_s_xactor_f_rd_data$ENQ,
       axi4_s_xactor_f_rd_data$FULL_N;
  // ports of submodule axi4_s_xactor_f_wr_addr
  wire [108 : 0] axi4_s_xactor_f_wr_addr$D_IN, axi4_s_xactor_f_wr_addr$D_OUT;
  wire axi4_s_xactor_f_wr_addr$CLR,
       axi4_s_xactor_f_wr_addr$DEQ,
       axi4_s_xactor_f_wr_addr$EMPTY_N,
       axi4_s_xactor_f_wr_addr$ENQ,
       axi4_s_xactor_f_wr_addr$FULL_N;
  // ports of submodule axi4_s_xactor_f_wr_data
  wire [576 : 0] axi4_s_xactor_f_wr_data$D_IN, axi4_s_xactor_f_wr_data$D_OUT;
  wire axi4_s_xactor_f_wr_data$CLR,
       axi4_s_xactor_f_wr_data$DEQ,
       axi4_s_xactor_f_wr_data$EMPTY_N,
       axi4_s_xactor_f_wr_data$ENQ,
       axi4_s_xactor_f_wr_data$FULL_N;
  // ports of submodule axi4_s_xactor_f_wr_resp
  wire [17 : 0] axi4_s_xactor_f_wr_resp$D_IN, axi4_s_xactor_f_wr_resp$D_OUT;
  wire axi4_s_xactor_f_wr_resp$CLR,
       axi4_s_xactor_f_wr_resp$DEQ,
       axi4_s_xactor_f_wr_resp$EMPTY_N,
       axi4_s_xactor_f_wr_resp$ENQ,
       axi4_s_xactor_f_wr_resp$FULL_N;
  // ports of submodule axi4_to_ld_f_axi_rsp_info
  wire [16 : 0] axi4_to_ld_f_axi_rsp_info$D_IN,
		axi4_to_ld_f_axi_rsp_info$D_OUT;
  wire axi4_to_ld_f_axi_rsp_info$CLR,
       axi4_to_ld_f_axi_rsp_info$DEQ,
       axi4_to_ld_f_axi_rsp_info$EMPTY_N,
       axi4_to_ld_f_axi_rsp_info$ENQ,
       axi4_to_ld_f_axi_rsp_info$FULL_N;
  // ports of submodule axi4_to_ld_f_ld_rsp_info
  reg [9 : 0] axi4_to_ld_f_ld_rsp_info$D_IN;
  wire [9 : 0] axi4_to_ld_f_ld_rsp_info$D_OUT;
  wire axi4_to_ld_f_ld_rsp_info$CLR,
       axi4_to_ld_f_ld_rsp_info$DEQ,
       axi4_to_ld_f_ld_rsp_info$EMPTY_N,
       axi4_to_ld_f_ld_rsp_info$ENQ,
       axi4_to_ld_f_ld_rsp_info$FULL_N;
  // ports of submodule axi4_to_ld_f_reqs
  reg [65 : 0] axi4_to_ld_f_reqs$D_IN;
  wire [65 : 0] axi4_to_ld_f_reqs$D_OUT;
  wire axi4_to_ld_f_reqs$CLR,
       axi4_to_ld_f_reqs$DEQ,
       axi4_to_ld_f_reqs$EMPTY_N,
       axi4_to_ld_f_reqs$ENQ,
       axi4_to_ld_f_reqs$FULL_N;
  // ports of submodule axi4_to_ld_f_rsps
  wire [64 : 0] axi4_to_ld_f_rsps$D_IN, axi4_to_ld_f_rsps$D_OUT;
  wire axi4_to_ld_f_rsps$CLR,
       axi4_to_ld_f_rsps$DEQ,
       axi4_to_ld_f_rsps$EMPTY_N,
       axi4_to_ld_f_rsps$ENQ,
       axi4_to_ld_f_rsps$FULL_N;
  // ports of submodule axi4_to_st_f_axi_rsp_info
  wire [16 : 0] axi4_to_st_f_axi_rsp_info$D_IN,
		axi4_to_st_f_axi_rsp_info$D_OUT;
  wire axi4_to_st_f_axi_rsp_info$CLR,
       axi4_to_st_f_axi_rsp_info$DEQ,
       axi4_to_st_f_axi_rsp_info$EMPTY_N,
       axi4_to_st_f_axi_rsp_info$ENQ,
       axi4_to_st_f_axi_rsp_info$FULL_N;
  // ports of submodule axi4_to_st_f_reqs
  reg [129 : 0] axi4_to_st_f_reqs$D_IN;
  wire [129 : 0] axi4_to_st_f_reqs$D_OUT;
  wire axi4_to_st_f_reqs$CLR,
       axi4_to_st_f_reqs$DEQ,
       axi4_to_st_f_reqs$EMPTY_N,
       axi4_to_st_f_reqs$ENQ,
       axi4_to_st_f_reqs$FULL_N;
  // ports of submodule axi4_to_st_f_rsps
  wire axi4_to_st_f_rsps$CLR,
       axi4_to_st_f_rsps$DEQ,
       axi4_to_st_f_rsps$D_IN,
       axi4_to_st_f_rsps$D_OUT,
       axi4_to_st_f_rsps$EMPTY_N,
       axi4_to_st_f_rsps$ENQ,
       axi4_to_st_f_rsps$FULL_N;
  // ports of submodule axi4_to_st_f_st_rsp_info
  wire axi4_to_st_f_st_rsp_info$CLR,
       axi4_to_st_f_st_rsp_info$DEQ,
       axi4_to_st_f_st_rsp_info$D_IN,
       axi4_to_st_f_st_rsp_info$D_OUT,
       axi4_to_st_f_st_rsp_info$EMPTY_N,
       axi4_to_st_f_st_rsp_info$ENQ,
       axi4_to_st_f_st_rsp_info$FULL_N;
  // ports of submodule f_L1_to_L2_Reqs
  wire [68 : 0] f_L1_to_L2_Reqs$D_IN, f_L1_to_L2_Reqs$D_OUT;
  wire f_L1_to_L2_Reqs$CLR,
       f_L1_to_L2_Reqs$DEQ,
       f_L1_to_L2_Reqs$EMPTY_N,
       f_L1_to_L2_Reqs$ENQ,
       f_L1_to_L2_Reqs$FULL_N;
  // ports of submodule f_L1_to_L2_Rsps
  wire [578 : 0] f_L1_to_L2_Rsps$D_IN, f_L1_to_L2_Rsps$D_OUT;
  wire f_L1_to_L2_Rsps$CLR,
       f_L1_to_L2_Rsps$DEQ,
       f_L1_to_L2_Rsps$EMPTY_N,
       f_L1_to_L2_Rsps$ENQ,
       f_L1_to_L2_Rsps$FULL_N;
  // ports of submodule f_L2_to_L1_Reqs
  wire [65 : 0] f_L2_to_L1_Reqs$D_IN, f_L2_to_L1_Reqs$D_OUT;
  wire f_L2_to_L1_Reqs$CLR,
       f_L2_to_L1_Reqs$DEQ,
       f_L2_to_L1_Reqs$EMPTY_N,
       f_L2_to_L1_Reqs$ENQ,
       f_L2_to_L1_Reqs$FULL_N;
  // ports of submodule f_L2_to_L1_Rsps
  wire [578 : 0] f_L2_to_L1_Rsps$D_IN, f_L2_to_L1_Rsps$D_OUT;
  wire f_L2_to_L1_Rsps$CLR,
       f_L2_to_L1_Rsps$DEQ,
       f_L2_to_L1_Rsps$EMPTY_N,
       f_L2_to_L1_Rsps$ENQ,
       f_L2_to_L1_Rsps$FULL_N;
  // ports of submodule f_mmio_rsp_is_load
  wire f_mmio_rsp_is_load$CLR,
       f_mmio_rsp_is_load$DEQ,
       f_mmio_rsp_is_load$D_IN,
       f_mmio_rsp_is_load$D_OUT,
       f_mmio_rsp_is_load$EMPTY_N,
       f_mmio_rsp_is_load$ENQ,
       f_mmio_rsp_is_load$FULL_N;
  // ports of submodule f_rd_addr
  wire [108 : 0] f_rd_addr$D_IN, f_rd_addr$D_OUT;
  wire f_rd_addr$CLR,
       f_rd_addr$DEQ,
       f_rd_addr$EMPTY_N,
       f_rd_addr$ENQ,
       f_rd_addr$FULL_N;
  // ports of submodule f_rd_data
  wire [530 : 0] f_rd_data$D_IN, f_rd_data$D_OUT;
  wire f_rd_data$CLR,
       f_rd_data$DEQ,
       f_rd_data$EMPTY_N,
       f_rd_data$ENQ,
       f_rd_data$FULL_N;
  // ports of submodule f_reqs
  wire [685 : 0] f_reqs$D_IN, f_reqs$D_OUT;
  wire f_reqs$CLR, f_reqs$DEQ, f_reqs$EMPTY_N, f_reqs$ENQ, f_reqs$FULL_N;
  // ports of submodule f_single_reqs
  wire [130 : 0] f_single_reqs$D_IN, f_single_reqs$D_OUT;
  wire f_single_reqs$CLR,
       f_single_reqs$DEQ,
       f_single_reqs$EMPTY_N,
       f_single_reqs$ENQ,
       f_single_reqs$FULL_N;
  // ports of submodule f_single_rsps
  wire [64 : 0] f_single_rsps$D_IN, f_single_rsps$D_OUT;
  wire f_single_rsps$CLR,
       f_single_rsps$DEQ,
       f_single_rsps$EMPTY_N,
       f_single_rsps$ENQ,
       f_single_rsps$FULL_N;
  // ports of submodule f_wr_addr
  wire [108 : 0] f_wr_addr$D_IN, f_wr_addr$D_OUT;
  wire f_wr_addr$CLR,
       f_wr_addr$DEQ,
       f_wr_addr$EMPTY_N,
       f_wr_addr$ENQ,
       f_wr_addr$FULL_N;
  // ports of submodule f_wr_data
  wire [576 : 0] f_wr_data$D_IN, f_wr_data$D_OUT;
  wire f_wr_data$CLR,
       f_wr_data$DEQ,
       f_wr_data$EMPTY_N,
       f_wr_data$ENQ,
       f_wr_data$FULL_N;
  // ports of submodule f_wr_resp
  wire [17 : 0] f_wr_resp$D_IN, f_wr_resp$D_OUT;
  wire f_wr_resp$CLR,
       f_wr_resp$DEQ,
       f_wr_resp$EMPTY_N,
       f_wr_resp$ENQ,
       f_wr_resp$FULL_N;
  // ports of submodule rf_data_sets
  wire [511 : 0] rf_data_sets$D_IN, rf_data_sets$D_OUT_1;
  wire [5 : 0] rf_data_sets$ADDR_1,
	       rf_data_sets$ADDR_2,
	       rf_data_sets$ADDR_3,
	       rf_data_sets$ADDR_4,
	       rf_data_sets$ADDR_5,
	       rf_data_sets$ADDR_IN;
  wire rf_data_sets$WE;
  // ports of submodule rf_tag_sets
  reg [65 : 0] rf_tag_sets$D_IN;
  reg [5 : 0] rf_tag_sets$ADDR_IN;
  wire [65 : 0] rf_tag_sets$D_OUT_1, rf_tag_sets$D_OUT_2;
  wire [5 : 0] rf_tag_sets$ADDR_1,
	       rf_tag_sets$ADDR_2,
	       rf_tag_sets$ADDR_3,
	       rf_tag_sets$ADDR_4,
	       rf_tag_sets$ADDR_5;
  wire rf_tag_sets$WE;
  // rule scheduling signals
  wire CAN_FIRE_RL_axi4_to_ld_rl_finish_req,
       CAN_FIRE_RL_axi4_to_ld_rl_handle_ld_rsp,
       CAN_FIRE_RL_axi4_to_ld_rl_handle_ld_slice_ignore,
       CAN_FIRE_RL_axi4_to_ld_rl_illegal_req,
       CAN_FIRE_RL_axi4_to_ld_rl_next_slice,
       CAN_FIRE_RL_axi4_to_ld_rl_partial,
       CAN_FIRE_RL_axi4_to_ld_rl_send_axi_response,
       CAN_FIRE_RL_axi4_to_ld_rl_shift_tail_slices,
       CAN_FIRE_RL_axi4_to_ld_rl_start_xaction,
       CAN_FIRE_RL_axi4_to_st_rl_finish_req,
       CAN_FIRE_RL_axi4_to_st_rl_handle_st_rsps,
       CAN_FIRE_RL_axi4_to_st_rl_illegal_req,
       CAN_FIRE_RL_axi4_to_st_rl_next_slice,
       CAN_FIRE_RL_axi4_to_st_rl_partial,
       CAN_FIRE_RL_axi4_to_st_rl_send_axi_response,
       CAN_FIRE_RL_axi4_to_st_rl_start_xaction,
       CAN_FIRE_RL_rl_downgrade,
       CAN_FIRE_RL_rl_evict,
       CAN_FIRE_RL_rl_hit,
       CAN_FIRE_RL_rl_init,
       CAN_FIRE_RL_rl_merge_rd_req,
       CAN_FIRE_RL_rl_merge_wr_req,
       CAN_FIRE_RL_rl_mmio_AXI_rd_req,
       CAN_FIRE_RL_rl_mmio_AXI_rd_rsp,
       CAN_FIRE_RL_rl_mmio_LD_req,
       CAN_FIRE_RL_rl_mmio_LD_rsp,
       CAN_FIRE_RL_rl_mmio_ST_req,
       CAN_FIRE_RL_rl_mmio_axi_wr_req,
       CAN_FIRE_RL_rl_mmio_axi_wr_rsp,
       CAN_FIRE_RL_rl_mmio_st_rsp,
       CAN_FIRE_RL_rl_upgrade_req,
       CAN_FIRE_RL_rl_upgrade_rsp,
       CAN_FIRE_axi4_s_m_arvalid,
       CAN_FIRE_axi4_s_m_awvalid,
       CAN_FIRE_axi4_s_m_bready,
       CAN_FIRE_axi4_s_m_rready,
       CAN_FIRE_axi4_s_m_wvalid,
       CAN_FIRE_l1_to_l2_client_request_deq,
       CAN_FIRE_l1_to_l2_client_response_enq,
       CAN_FIRE_l2_to_l1_server_request_enq,
       CAN_FIRE_l2_to_l1_server_response_deq,
       CAN_FIRE_mmio_client_request_get,
       CAN_FIRE_mmio_client_response_put,
       WILL_FIRE_RL_axi4_to_ld_rl_finish_req,
       WILL_FIRE_RL_axi4_to_ld_rl_handle_ld_rsp,
       WILL_FIRE_RL_axi4_to_ld_rl_handle_ld_slice_ignore,
       WILL_FIRE_RL_axi4_to_ld_rl_illegal_req,
       WILL_FIRE_RL_axi4_to_ld_rl_next_slice,
       WILL_FIRE_RL_axi4_to_ld_rl_partial,
       WILL_FIRE_RL_axi4_to_ld_rl_send_axi_response,
       WILL_FIRE_RL_axi4_to_ld_rl_shift_tail_slices,
       WILL_FIRE_RL_axi4_to_ld_rl_start_xaction,
       WILL_FIRE_RL_axi4_to_st_rl_finish_req,
       WILL_FIRE_RL_axi4_to_st_rl_handle_st_rsps,
       WILL_FIRE_RL_axi4_to_st_rl_illegal_req,
       WILL_FIRE_RL_axi4_to_st_rl_next_slice,
       WILL_FIRE_RL_axi4_to_st_rl_partial,
       WILL_FIRE_RL_axi4_to_st_rl_send_axi_response,
       WILL_FIRE_RL_axi4_to_st_rl_start_xaction,
       WILL_FIRE_RL_rl_downgrade,
       WILL_FIRE_RL_rl_evict,
       WILL_FIRE_RL_rl_hit,
       WILL_FIRE_RL_rl_init,
       WILL_FIRE_RL_rl_merge_rd_req,
       WILL_FIRE_RL_rl_merge_wr_req,
       WILL_FIRE_RL_rl_mmio_AXI_rd_req,
       WILL_FIRE_RL_rl_mmio_AXI_rd_rsp,
       WILL_FIRE_RL_rl_mmio_LD_req,
       WILL_FIRE_RL_rl_mmio_LD_rsp,
       WILL_FIRE_RL_rl_mmio_ST_req,
       WILL_FIRE_RL_rl_mmio_axi_wr_req,
       WILL_FIRE_RL_rl_mmio_axi_wr_rsp,
       WILL_FIRE_RL_rl_mmio_st_rsp,
       WILL_FIRE_RL_rl_upgrade_req,
       WILL_FIRE_RL_rl_upgrade_rsp,
       WILL_FIRE_axi4_s_m_arvalid,
       WILL_FIRE_axi4_s_m_awvalid,
       WILL_FIRE_axi4_s_m_bready,
       WILL_FIRE_axi4_s_m_rready,
       WILL_FIRE_axi4_s_m_wvalid,
       WILL_FIRE_l1_to_l2_client_request_deq,
       WILL_FIRE_l1_to_l2_client_response_enq,
       WILL_FIRE_l2_to_l1_server_request_enq,
       WILL_FIRE_l2_to_l1_server_response_deq,
       WILL_FIRE_mmio_client_request_get,
       WILL_FIRE_mmio_client_response_put;
  // inputs to muxes for submodule ports
  wire [685 : 0] MUX_f_reqs$enq_1__VAL_1, MUX_f_reqs$enq_1__VAL_2;
  wire [578 : 0] MUX_f_L1_to_L2_Rsps$enq_1__VAL_1,
		 MUX_f_L1_to_L2_Rsps$enq_1__VAL_2;
  wire [530 : 0] MUX_axi4_s_xactor_f_rd_data$enq_1__VAL_1,
		 MUX_axi4_s_xactor_f_rd_data$enq_1__VAL_2;
  wire [511 : 0] MUX_axi4_to_ld_rg_v_slice$write_1__VAL_1,
		 MUX_axi4_to_ld_rg_v_slice$write_1__VAL_2,
		 MUX_axi4_to_st_rg_v_slice$write_1__VAL_1,
		 MUX_axi4_to_st_rg_v_slice$write_1__VAL_2,
		 MUX_rf_data_sets$upd_2__VAL_1,
		 MUX_rf_data_sets$upd_2__VAL_2;
  wire [130 : 0] MUX_f_single_reqs$enq_1__VAL_1,
		 MUX_f_single_reqs$enq_1__VAL_2;
  wire [129 : 0] MUX_axi4_to_st_f_reqs$enq_1__VAL_1,
		 MUX_axi4_to_st_f_reqs$enq_1__VAL_2,
		 MUX_axi4_to_st_f_reqs$enq_1__VAL_3;
  wire [65 : 0] MUX_axi4_to_ld_f_reqs$enq_1__VAL_1,
		MUX_axi4_to_ld_f_reqs$enq_1__VAL_2,
		MUX_axi4_to_ld_f_reqs$enq_1__VAL_3,
		MUX_rf_tag_sets$upd_2__VAL_1,
		MUX_rf_tag_sets$upd_2__VAL_3,
		MUX_rf_tag_sets$upd_2__VAL_4;
  wire [63 : 0] MUX_axi4_to_st_rg_v_strb$write_1__VAL_1,
		MUX_axi4_to_st_rg_v_strb$write_1__VAL_2;
  wire [17 : 0] MUX_axi4_s_xactor_f_wr_resp$enq_1__VAL_1;
  wire [16 : 0] MUX_axi4_to_ld_f_axi_rsp_info$enq_1__VAL_1,
		MUX_axi4_to_ld_f_axi_rsp_info$enq_1__VAL_2,
		MUX_axi4_to_st_f_axi_rsp_info$enq_1__VAL_1,
		MUX_axi4_to_st_f_axi_rsp_info$enq_1__VAL_2;
  wire [9 : 0] MUX_axi4_to_ld_f_ld_rsp_info$enq_1__VAL_1,
	       MUX_axi4_to_ld_f_ld_rsp_info$enq_1__VAL_3,
	       MUX_axi4_to_ld_f_ld_rsp_info$enq_1__VAL_4;
  wire [7 : 0] MUX_axi4_to_ld_rg_bytelane_lo$write_1__VAL_1,
	       MUX_axi4_to_ld_rg_bytelane_lo$write_1__VAL_2,
	       MUX_axi4_to_ld_rg_bytelane_lo$write_1__VAL_3,
	       MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__VAL_1,
	       MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__VAL_2,
	       MUX_axi4_to_st_rg_bytelane_lo$write_1__VAL_1,
	       MUX_axi4_to_st_rg_bytelane_lo$write_1__VAL_2,
	       MUX_axi4_to_st_rg_bytelane_lo$write_1__VAL_3,
	       MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__VAL_1,
	       MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__VAL_2,
	       MUX_axi4_to_st_rg_discard_count$write_1__VAL_2;
  wire [3 : 0] MUX_axi4_to_ld_rg_remaining_slices$write_1__VAL_1;
  wire [2 : 0] MUX_axi4_to_ld_rg_state$write_1__VAL_1,
	       MUX_axi4_to_ld_rg_state$write_1__VAL_2,
	       MUX_axi4_to_ld_rg_state$write_1__VAL_3,
	       MUX_axi4_to_st_rg_state$write_1__VAL_2,
	       MUX_axi4_to_st_rg_state$write_1__VAL_3,
	       MUX_axi4_to_st_rg_state$write_1__VAL_4;
  wire MUX_axi4_s_xactor_f_rd_data$enq_1__SEL_1,
       MUX_axi4_s_xactor_f_rd_data$enq_1__SEL_2,
       MUX_axi4_s_xactor_f_wr_resp$enq_1__PSEL_1,
       MUX_axi4_s_xactor_f_wr_resp$enq_1__SEL_1,
       MUX_axi4_to_ld_f_ld_rsp_info$enq_1__SEL_1,
       MUX_axi4_to_ld_f_ld_rsp_info$enq_1__SEL_2,
       MUX_axi4_to_ld_f_reqs$enq_1__SEL_1,
       MUX_axi4_to_ld_f_reqs$enq_1__SEL_2,
       MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__SEL_1,
       MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__SEL_2,
       MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__SEL_3,
       MUX_axi4_to_ld_rg_remaining_slices$write_1__SEL_1,
       MUX_axi4_to_ld_rg_remaining_slices$write_1__SEL_2,
       MUX_axi4_to_st_f_axi_rsp_info$enq_1__SEL_1,
       MUX_axi4_to_st_f_reqs$enq_1__SEL_1,
       MUX_axi4_to_st_f_reqs$enq_1__SEL_2,
       MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_1,
       MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_2,
       MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_3,
       MUX_axi4_to_st_rg_discard_count$write_1__SEL_1,
       MUX_f_L1_to_L2_Rsps$enq_1__SEL_1,
       MUX_f_single_reqs$enq_1__SEL_1,
       MUX_f_single_reqs$enq_1__SEL_2,
       MUX_rg_state$write_1__SEL_1,
       MUX_rg_state$write_1__SEL_2,
       MUX_rg_state$write_1__SEL_3;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h1963;
  reg [31 : 0] v__h2441;
  reg [31 : 0] v__h21995;
  reg [31 : 0] v__h22278;
  reg [31 : 0] v__h22510;
  reg [31 : 0] v__h41979;
  reg [31 : 0] v__h42147;
  reg [31 : 0] v__h52258;
  reg [31 : 0] v__h52431;
  reg [31 : 0] v__h52625;
  reg [31 : 0] v__h1957;
  reg [31 : 0] v__h2435;
  reg [31 : 0] v__h21989;
  reg [31 : 0] v__h22272;
  reg [31 : 0] v__h22504;
  reg [31 : 0] v__h41973;
  reg [31 : 0] v__h42141;
  reg [31 : 0] v__h52252;
  reg [31 : 0] v__h52425;
  reg [31 : 0] v__h52619;
  // synopsys translate_on
  // remaining internal signals
  wire [511 : 0] new_data___1__h23293, new_data___1__h4300, v__h22217;
  wire [63 : 0] addr_axi_bus_lo__h41811,
		addr_axi_bus_lo__h52058,
		f_rd_addrD_OUT_BITS_92_TO_29_AND_mask3380__q3,
		f_wr_addrD_OUT_BITS_92_TO_29_AND_mask6467__q4,
		line_addr__h2730,
		line_addr__h3158,
		mask__h43380,
		mask__h56467,
		shifted_slice__h55312,
		shifted_slice__h62392,
		shifted_slice__h65843,
		slice__h45713,
		x__h44701,
		x__h45249,
		x__h55604,
		x__h55986,
		x__h62659,
		x__h62662,
		x__h66112,
		x__h66115,
		y_avValue_snd_snd__h55988,
		y_avValue_snd_snd__h55990,
		y_avValue_snd_snd__h56237,
		y_avValue_snd_snd__h56239,
		y_avValue_snd_snd__h56244,
		y_avValue_snd_snd__h62664,
		y_avValue_snd_snd__h62666,
		y_avValue_snd_snd__h62908,
		y_avValue_snd_snd__h62910,
		y_avValue_snd_snd__h62915,
		y_avValue_snd_snd__h66117,
		y_avValue_snd_snd__h66119,
		y_avValue_snd_snd__h66150,
		y_avValue_snd_snd__h66152,
		y_avValue_snd_snd__h66157;
  wire [7 : 0] _1_SL_f_rd_addr_first__62_BITS_20_TO_18_66___d667,
	       _1_SL_f_wr_addr_first__24_BITS_20_TO_18_28___d929,
	       addr_bytelane__h52059,
	       axi4_to_st_rg_bytelane_lo_MINUS_axi4_to_st_rg__ETC__q2,
	       bytelane_hi__h52936,
	       bytelane_hi__h60054,
	       bytelane_lo0053_MINUS_axi4_to_st_rg_bytelane_s_ETC__q1,
	       bytelane_lo__h42399,
	       bytelane_lo__h44346,
	       bytelane_lo__h52935,
	       bytelane_lo__h60053,
	       bytelane_slice_hi__h44327,
	       bytelane_slice_hi__h60018,
	       bytes_processed__h42786,
	       bytes_processed__h44683,
	       bytes_processed__h45231,
	       bytes_processed__h55567,
	       bytes_processed__h62638,
	       bytes_processed__h66091,
	       num_bytes__h42529,
	       num_bytes__h44435,
	       num_bytes__h44981,
	       num_bytes__h55297,
	       num_bytes__h62377,
	       num_bytes__h65828,
	       num_lsb_zero_bytes__h60039,
	       num_msb_zero_bytes__h52922,
	       num_msb_zero_bytes__h60040,
	       szwindow_bytelane_hi__h41816,
	       szwindow_bytelane_hi__h52063,
	       szwindow_bytelane_lo__h41815,
	       szwindow_bytelane_lo__h52062,
	       v__h42404,
	       v__h42504,
	       v__h44351,
	       v__h44413,
	       v__h44974,
	       v__h52941,
	       v__h55273,
	       v__h60059,
	       v__h62356,
	       v__h65821,
	       x__h42568,
	       x__h44474,
	       x__h44726,
	       x__h45020,
	       x__h45274,
	       x__h55337,
	       x__h56212,
	       x__h62417,
	       x__h62883,
	       x__h65868,
	       x__h66125,
	       y__h43356,
	       y__h54481,
	       y__h56443,
	       y__h61591,
	       y__h61599,
	       y_avValue_snd__h42763,
	       y_avValue_snd__h42779,
	       y_avValue_snd__h44660,
	       y_avValue_snd__h44676,
	       y_avValue_snd__h45208,
	       y_avValue_snd__h45224,
	       y_avValue_snd_fst__h55989,
	       y_avValue_snd_fst__h56238,
	       y_avValue_snd_fst__h62665,
	       y_avValue_snd_fst__h62909,
	       y_avValue_snd_fst__h66118,
	       y_avValue_snd_fst__h66151;
  wire [3 : 0] x__h44141,
	       x__h53166,
	       x__h54490,
	       x__h57228,
	       x__h60276,
	       x__h61600;
  wire [2 : 0] IF_axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_5_ETC___d796,
	       IF_axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7__ETC___d1172;
  wire [1 : 0] rd_data_S_rresp__h49842,
	       x__h42811,
	       x__h44699,
	       x__h45247,
	       x__h55592,
	       x__h62654,
	       x__h66107,
	       y_avValue_fst__h42762,
	       y_avValue_fst__h42778,
	       y_avValue_fst__h44659,
	       y_avValue_fst__h44675,
	       y_avValue_fst__h45207,
	       y_avValue_fst__h45223,
	       y_avValue_fst__h55540,
	       y_avValue_fst__h55558,
	       y_avValue_fst__h62611,
	       y_avValue_fst__h62629,
	       y_avValue_fst__h66064,
	       y_avValue_fst__h66082;
  wire IF_f_reqs_first__05_BIT_685_24_THEN_axi4_s_xac_ETC___d127,
       NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452,
       NOT_f_rd_addr_first__62_BITS_28_TO_21_63_EQ_0__ETC___d679,
       NOT_f_reqs_first__05_BIT_685_24_29_AND_NOT_rf__ETC___d135,
       _0_CONCAT_IF_f_wr_data_first__21_BIT_1_36_THEN__ETC___d955,
       _0_CONCAT_f_rd_addr_first__62_BITS_34_TO_29_72__ETC___d674,
       _0_CONCAT_f_rd_addr_first__62_BITS_92_TO_29_90__ETC___d746,
       _0_CONCAT_f_wr_addr_first__24_BITS_92_TO_29_89__ETC___d1063,
       _1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668,
       _1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930,
       _7_MINUS_0_CONCAT_IF_f_wr_data_first__21_BIT_8__ETC___d1011,
       _7_MINUS_0_CONCAT_IF_f_wr_data_first__21_BIT_8__ETC___d969,
       _7_MINUS_0_CONCAT_f_rd_addr_first__62_BITS_34_T_ETC___d711,
       axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d12,
       axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d14,
       axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d16,
       axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d18,
       axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d42,
       axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d44,
       axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d46,
       axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d48,
       axi4_to_ld_rg_bytelane_hi_02_MINUS_axi4_to_ld__ETC___d813,
       axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_M_ETC___d777,
       axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d758,
       axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d793,
       axi4_to_st_rg_bytelane_hi_176_MINUS_axi4_to_st_ETC___d1187,
       axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1113,
       axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1129,
       axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1165,
       axi4_to_st_rg_v_strb_075_BITS_7_TO_0_076_EQ_0__ETC___d1116,
       f_wr_data_first__21_BITS_8_TO_1_34_EQ_0_35_OR__ETC___d957,
       f_wr_data_first__21_BITS_8_TO_1_34_EQ_0_35_OR__ETC___d975,
       f_wr_data_first__21_BIT_0_22_AND_f_wr_addr_fir_ETC___d1001,
       f_wr_data_first__21_BIT_0_22_AND_f_wr_addr_fir_ETC___d1066,
       rf_tag_sets_sub_f_L2_to_L1_Reqs_first__1_BITS__ETC___d77,
       rf_tag_sets_sub_f_L2_to_L1_Reqs_first__1_BITS__ETC___d82,
       rf_tag_sets_sub_f_reqs_first__05_BITS_616_TO_6_ETC___d114,
       rg_state_EQ_1_01_AND_NOT_f_L2_to_L1_Reqs_notEm_ETC___d438;
  // action method axi4_s_m_awvalid
  assign CAN_FIRE_axi4_s_m_awvalid = 1'd1 ;
  assign WILL_FIRE_axi4_s_m_awvalid = 1'd1 ;
  // value method axi4_s_m_awready
  assign axi4_s_awready = axi4_s_xactor_f_wr_addr$FULL_N ;
  // action method axi4_s_m_wvalid
  assign CAN_FIRE_axi4_s_m_wvalid = 1'd1 ;
  assign WILL_FIRE_axi4_s_m_wvalid = 1'd1 ;
  // value method axi4_s_m_wready
  assign axi4_s_wready = axi4_s_xactor_f_wr_data$FULL_N ;
  // value method axi4_s_m_bvalid
  assign axi4_s_bvalid = axi4_s_xactor_f_wr_resp$EMPTY_N ;
  // value method axi4_s_m_bid
  assign axi4_s_bid = axi4_s_xactor_f_wr_resp$D_OUT[17:2] ;
  // value method axi4_s_m_bresp
  assign axi4_s_bresp = axi4_s_xactor_f_wr_resp$D_OUT[1:0] ;
  // action method axi4_s_m_bready
  assign CAN_FIRE_axi4_s_m_bready = 1'd1 ;
  assign WILL_FIRE_axi4_s_m_bready = 1'd1 ;
  // action method axi4_s_m_arvalid
  assign CAN_FIRE_axi4_s_m_arvalid = 1'd1 ;
  assign WILL_FIRE_axi4_s_m_arvalid = 1'd1 ;
  // value method axi4_s_m_arready
  assign axi4_s_arready = axi4_s_xactor_f_rd_addr$FULL_N ;
  // value method axi4_s_m_rvalid
  assign axi4_s_rvalid = axi4_s_xactor_f_rd_data$EMPTY_N ;
  // value method axi4_s_m_rid
  assign axi4_s_rid = axi4_s_xactor_f_rd_data$D_OUT[530:515] ;
  // value method axi4_s_m_rdata
  assign axi4_s_rdata = axi4_s_xactor_f_rd_data$D_OUT[514:3] ;
  // value method axi4_s_m_rresp
  assign axi4_s_rresp = axi4_s_xactor_f_rd_data$D_OUT[2:1] ;
  // value method axi4_s_m_rlast
  assign axi4_s_rlast = axi4_s_xactor_f_rd_data$D_OUT[0] ;
  // action method axi4_s_m_rready
  assign CAN_FIRE_axi4_s_m_rready = 1'd1 ;
  assign WILL_FIRE_axi4_s_m_rready = 1'd1 ;
  // value method l1_to_l2_client_request_first
  assign l1_to_l2_client_request_first = f_L1_to_L2_Reqs$D_OUT ;
  assign RDY_l1_to_l2_client_request_first = f_L1_to_L2_Reqs$EMPTY_N ;
  // action method l1_to_l2_client_request_deq
  assign RDY_l1_to_l2_client_request_deq = f_L1_to_L2_Reqs$EMPTY_N ;
  assign CAN_FIRE_l1_to_l2_client_request_deq = f_L1_to_L2_Reqs$EMPTY_N ;
  assign WILL_FIRE_l1_to_l2_client_request_deq =
	     EN_l1_to_l2_client_request_deq ;
  // value method l1_to_l2_client_request_notEmpty
  assign l1_to_l2_client_request_notEmpty = f_L1_to_L2_Reqs$EMPTY_N ;
  assign RDY_l1_to_l2_client_request_notEmpty = 1'd1 ;
  // action method l1_to_l2_client_response_enq
  assign RDY_l1_to_l2_client_response_enq = f_L2_to_L1_Rsps$FULL_N ;
  assign CAN_FIRE_l1_to_l2_client_response_enq = f_L2_to_L1_Rsps$FULL_N ;
  assign WILL_FIRE_l1_to_l2_client_response_enq =
	     EN_l1_to_l2_client_response_enq ;
  // value method l1_to_l2_client_response_notFull
  assign l1_to_l2_client_response_notFull = f_L2_to_L1_Rsps$FULL_N ;
  assign RDY_l1_to_l2_client_response_notFull = 1'd1 ;
  // action method l2_to_l1_server_request_enq
  assign RDY_l2_to_l1_server_request_enq = f_L2_to_L1_Reqs$FULL_N ;
  assign CAN_FIRE_l2_to_l1_server_request_enq = f_L2_to_L1_Reqs$FULL_N ;
  assign WILL_FIRE_l2_to_l1_server_request_enq =
	     EN_l2_to_l1_server_request_enq ;
  // value method l2_to_l1_server_request_notFull
  assign l2_to_l1_server_request_notFull = f_L2_to_L1_Reqs$FULL_N ;
  assign RDY_l2_to_l1_server_request_notFull = 1'd1 ;
  // value method l2_to_l1_server_response_first
  assign l2_to_l1_server_response_first = f_L1_to_L2_Rsps$D_OUT ;
  assign RDY_l2_to_l1_server_response_first = f_L1_to_L2_Rsps$EMPTY_N ;
  // action method l2_to_l1_server_response_deq
  assign RDY_l2_to_l1_server_response_deq = f_L1_to_L2_Rsps$EMPTY_N ;
  assign CAN_FIRE_l2_to_l1_server_response_deq = f_L1_to_L2_Rsps$EMPTY_N ;
  assign WILL_FIRE_l2_to_l1_server_response_deq =
	     EN_l2_to_l1_server_response_deq ;
  // value method l2_to_l1_server_response_notEmpty
  assign l2_to_l1_server_response_notEmpty = f_L1_to_L2_Rsps$EMPTY_N ;
  assign RDY_l2_to_l1_server_response_notEmpty = 1'd1 ;
  // actionvalue method mmio_client_request_get
  assign mmio_client_request_get = f_single_reqs$D_OUT ;
  assign RDY_mmio_client_request_get = f_single_reqs$EMPTY_N ;
  assign CAN_FIRE_mmio_client_request_get = f_single_reqs$EMPTY_N ;
  assign WILL_FIRE_mmio_client_request_get = EN_mmio_client_request_get ;
  // action method mmio_client_response_put
  assign RDY_mmio_client_response_put = f_single_rsps$FULL_N ;
  assign CAN_FIRE_mmio_client_response_put = f_single_rsps$FULL_N ;
  assign WILL_FIRE_mmio_client_response_put = EN_mmio_client_response_put ;
  // submodule axi4_s_xactor_f_rd_addr
  FIFO2 #(.width(32'd109),
	  .guarded(1'd1)) axi4_s_xactor_f_rd_addr(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(axi4_s_xactor_f_rd_addr$D_IN),
						  .ENQ(axi4_s_xactor_f_rd_addr$ENQ),
						  .DEQ(axi4_s_xactor_f_rd_addr$DEQ),
						  .CLR(axi4_s_xactor_f_rd_addr$CLR),
						  .D_OUT(axi4_s_xactor_f_rd_addr$D_OUT),
						  .FULL_N(axi4_s_xactor_f_rd_addr$FULL_N),
						  .EMPTY_N(axi4_s_xactor_f_rd_addr$EMPTY_N));
  // submodule axi4_s_xactor_f_rd_data
  FIFO2 #(.width(32'd531),
	  .guarded(1'd1)) axi4_s_xactor_f_rd_data(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(axi4_s_xactor_f_rd_data$D_IN),
						  .ENQ(axi4_s_xactor_f_rd_data$ENQ),
						  .DEQ(axi4_s_xactor_f_rd_data$DEQ),
						  .CLR(axi4_s_xactor_f_rd_data$CLR),
						  .D_OUT(axi4_s_xactor_f_rd_data$D_OUT),
						  .FULL_N(axi4_s_xactor_f_rd_data$FULL_N),
						  .EMPTY_N(axi4_s_xactor_f_rd_data$EMPTY_N));
  // submodule axi4_s_xactor_f_wr_addr
  FIFO2 #(.width(32'd109),
	  .guarded(1'd1)) axi4_s_xactor_f_wr_addr(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(axi4_s_xactor_f_wr_addr$D_IN),
						  .ENQ(axi4_s_xactor_f_wr_addr$ENQ),
						  .DEQ(axi4_s_xactor_f_wr_addr$DEQ),
						  .CLR(axi4_s_xactor_f_wr_addr$CLR),
						  .D_OUT(axi4_s_xactor_f_wr_addr$D_OUT),
						  .FULL_N(axi4_s_xactor_f_wr_addr$FULL_N),
						  .EMPTY_N(axi4_s_xactor_f_wr_addr$EMPTY_N));
  // submodule axi4_s_xactor_f_wr_data
  FIFO2 #(.width(32'd577),
	  .guarded(1'd1)) axi4_s_xactor_f_wr_data(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(axi4_s_xactor_f_wr_data$D_IN),
						  .ENQ(axi4_s_xactor_f_wr_data$ENQ),
						  .DEQ(axi4_s_xactor_f_wr_data$DEQ),
						  .CLR(axi4_s_xactor_f_wr_data$CLR),
						  .D_OUT(axi4_s_xactor_f_wr_data$D_OUT),
						  .FULL_N(axi4_s_xactor_f_wr_data$FULL_N),
						  .EMPTY_N(axi4_s_xactor_f_wr_data$EMPTY_N));
  // submodule axi4_s_xactor_f_wr_resp
  FIFO2 #(.width(32'd18), .guarded(1'd1)) axi4_s_xactor_f_wr_resp(.RST(RST_N),
								  .CLK(CLK),
								  .D_IN(axi4_s_xactor_f_wr_resp$D_IN),
								  .ENQ(axi4_s_xactor_f_wr_resp$ENQ),
								  .DEQ(axi4_s_xactor_f_wr_resp$DEQ),
								  .CLR(axi4_s_xactor_f_wr_resp$CLR),
								  .D_OUT(axi4_s_xactor_f_wr_resp$D_OUT),
								  .FULL_N(axi4_s_xactor_f_wr_resp$FULL_N),
								  .EMPTY_N(axi4_s_xactor_f_wr_resp$EMPTY_N));
  // submodule axi4_to_ld_f_axi_rsp_info
  FIFO2 #(.width(32'd17),
	  .guarded(1'd1)) axi4_to_ld_f_axi_rsp_info(.RST(RST_N),
						    .CLK(CLK),
						    .D_IN(axi4_to_ld_f_axi_rsp_info$D_IN),
						    .ENQ(axi4_to_ld_f_axi_rsp_info$ENQ),
						    .DEQ(axi4_to_ld_f_axi_rsp_info$DEQ),
						    .CLR(axi4_to_ld_f_axi_rsp_info$CLR),
						    .D_OUT(axi4_to_ld_f_axi_rsp_info$D_OUT),
						    .FULL_N(axi4_to_ld_f_axi_rsp_info$FULL_N),
						    .EMPTY_N(axi4_to_ld_f_axi_rsp_info$EMPTY_N));
  // submodule axi4_to_ld_f_ld_rsp_info
  SizedFIFO #(.p1width(32'd10),
	      .p2depth(32'd16),
	      .p3cntr_width(32'd4),
	      .guarded(1'd1)) axi4_to_ld_f_ld_rsp_info(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(axi4_to_ld_f_ld_rsp_info$D_IN),
						       .ENQ(axi4_to_ld_f_ld_rsp_info$ENQ),
						       .DEQ(axi4_to_ld_f_ld_rsp_info$DEQ),
						       .CLR(axi4_to_ld_f_ld_rsp_info$CLR),
						       .D_OUT(axi4_to_ld_f_ld_rsp_info$D_OUT),
						       .FULL_N(axi4_to_ld_f_ld_rsp_info$FULL_N),
						       .EMPTY_N(axi4_to_ld_f_ld_rsp_info$EMPTY_N));
  // submodule axi4_to_ld_f_reqs
  FIFO2 #(.width(32'd66), .guarded(1'd1)) axi4_to_ld_f_reqs(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(axi4_to_ld_f_reqs$D_IN),
							    .ENQ(axi4_to_ld_f_reqs$ENQ),
							    .DEQ(axi4_to_ld_f_reqs$DEQ),
							    .CLR(axi4_to_ld_f_reqs$CLR),
							    .D_OUT(axi4_to_ld_f_reqs$D_OUT),
							    .FULL_N(axi4_to_ld_f_reqs$FULL_N),
							    .EMPTY_N(axi4_to_ld_f_reqs$EMPTY_N));
  // submodule axi4_to_ld_f_rsps
  FIFO2 #(.width(32'd65), .guarded(1'd1)) axi4_to_ld_f_rsps(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(axi4_to_ld_f_rsps$D_IN),
							    .ENQ(axi4_to_ld_f_rsps$ENQ),
							    .DEQ(axi4_to_ld_f_rsps$DEQ),
							    .CLR(axi4_to_ld_f_rsps$CLR),
							    .D_OUT(axi4_to_ld_f_rsps$D_OUT),
							    .FULL_N(axi4_to_ld_f_rsps$FULL_N),
							    .EMPTY_N(axi4_to_ld_f_rsps$EMPTY_N));
  // submodule axi4_to_st_f_axi_rsp_info
  FIFO2 #(.width(32'd17),
	  .guarded(1'd1)) axi4_to_st_f_axi_rsp_info(.RST(RST_N),
						    .CLK(CLK),
						    .D_IN(axi4_to_st_f_axi_rsp_info$D_IN),
						    .ENQ(axi4_to_st_f_axi_rsp_info$ENQ),
						    .DEQ(axi4_to_st_f_axi_rsp_info$DEQ),
						    .CLR(axi4_to_st_f_axi_rsp_info$CLR),
						    .D_OUT(axi4_to_st_f_axi_rsp_info$D_OUT),
						    .FULL_N(axi4_to_st_f_axi_rsp_info$FULL_N),
						    .EMPTY_N(axi4_to_st_f_axi_rsp_info$EMPTY_N));
  // submodule axi4_to_st_f_reqs
  FIFO2 #(.width(32'd130), .guarded(1'd1)) axi4_to_st_f_reqs(.RST(RST_N),
							     .CLK(CLK),
							     .D_IN(axi4_to_st_f_reqs$D_IN),
							     .ENQ(axi4_to_st_f_reqs$ENQ),
							     .DEQ(axi4_to_st_f_reqs$DEQ),
							     .CLR(axi4_to_st_f_reqs$CLR),
							     .D_OUT(axi4_to_st_f_reqs$D_OUT),
							     .FULL_N(axi4_to_st_f_reqs$FULL_N),
							     .EMPTY_N(axi4_to_st_f_reqs$EMPTY_N));
  // submodule axi4_to_st_f_rsps
  FIFO2 #(.width(32'd1), .guarded(1'd1)) axi4_to_st_f_rsps(.RST(RST_N),
							   .CLK(CLK),
							   .D_IN(axi4_to_st_f_rsps$D_IN),
							   .ENQ(axi4_to_st_f_rsps$ENQ),
							   .DEQ(axi4_to_st_f_rsps$DEQ),
							   .CLR(axi4_to_st_f_rsps$CLR),
							   .D_OUT(axi4_to_st_f_rsps$D_OUT),
							   .FULL_N(axi4_to_st_f_rsps$FULL_N),
							   .EMPTY_N(axi4_to_st_f_rsps$EMPTY_N));
  // submodule axi4_to_st_f_st_rsp_info
  SizedFIFO #(.p1width(32'd1),
	      .p2depth(32'd16),
	      .p3cntr_width(32'd4),
	      .guarded(1'd1)) axi4_to_st_f_st_rsp_info(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(axi4_to_st_f_st_rsp_info$D_IN),
						       .ENQ(axi4_to_st_f_st_rsp_info$ENQ),
						       .DEQ(axi4_to_st_f_st_rsp_info$DEQ),
						       .CLR(axi4_to_st_f_st_rsp_info$CLR),
						       .D_OUT(axi4_to_st_f_st_rsp_info$D_OUT),
						       .FULL_N(axi4_to_st_f_st_rsp_info$FULL_N),
						       .EMPTY_N(axi4_to_st_f_st_rsp_info$EMPTY_N));
  // submodule f_L1_to_L2_Reqs
  FIFO2 #(.width(32'd69), .guarded(1'd1)) f_L1_to_L2_Reqs(.RST(RST_N),
							  .CLK(CLK),
							  .D_IN(f_L1_to_L2_Reqs$D_IN),
							  .ENQ(f_L1_to_L2_Reqs$ENQ),
							  .DEQ(f_L1_to_L2_Reqs$DEQ),
							  .CLR(f_L1_to_L2_Reqs$CLR),
							  .D_OUT(f_L1_to_L2_Reqs$D_OUT),
							  .FULL_N(f_L1_to_L2_Reqs$FULL_N),
							  .EMPTY_N(f_L1_to_L2_Reqs$EMPTY_N));
  // submodule f_L1_to_L2_Rsps
  FIFO2 #(.width(32'd579), .guarded(1'd1)) f_L1_to_L2_Rsps(.RST(RST_N),
							   .CLK(CLK),
							   .D_IN(f_L1_to_L2_Rsps$D_IN),
							   .ENQ(f_L1_to_L2_Rsps$ENQ),
							   .DEQ(f_L1_to_L2_Rsps$DEQ),
							   .CLR(f_L1_to_L2_Rsps$CLR),
							   .D_OUT(f_L1_to_L2_Rsps$D_OUT),
							   .FULL_N(f_L1_to_L2_Rsps$FULL_N),
							   .EMPTY_N(f_L1_to_L2_Rsps$EMPTY_N));
  // submodule f_L2_to_L1_Reqs
  FIFO2 #(.width(32'd66), .guarded(1'd1)) f_L2_to_L1_Reqs(.RST(RST_N),
							  .CLK(CLK),
							  .D_IN(f_L2_to_L1_Reqs$D_IN),
							  .ENQ(f_L2_to_L1_Reqs$ENQ),
							  .DEQ(f_L2_to_L1_Reqs$DEQ),
							  .CLR(f_L2_to_L1_Reqs$CLR),
							  .D_OUT(f_L2_to_L1_Reqs$D_OUT),
							  .FULL_N(f_L2_to_L1_Reqs$FULL_N),
							  .EMPTY_N(f_L2_to_L1_Reqs$EMPTY_N));
  // submodule f_L2_to_L1_Rsps
  FIFO2 #(.width(32'd579), .guarded(1'd1)) f_L2_to_L1_Rsps(.RST(RST_N),
							   .CLK(CLK),
							   .D_IN(f_L2_to_L1_Rsps$D_IN),
							   .ENQ(f_L2_to_L1_Rsps$ENQ),
							   .DEQ(f_L2_to_L1_Rsps$DEQ),
							   .CLR(f_L2_to_L1_Rsps$CLR),
							   .D_OUT(f_L2_to_L1_Rsps$D_OUT),
							   .FULL_N(f_L2_to_L1_Rsps$FULL_N),
							   .EMPTY_N(f_L2_to_L1_Rsps$EMPTY_N));
  // submodule f_mmio_rsp_is_load
  SizedFIFO #(.p1width(32'd1),
	      .p2depth(32'd16),
	      .p3cntr_width(32'd4),
	      .guarded(1'd1)) f_mmio_rsp_is_load(.RST(RST_N),
						 .CLK(CLK),
						 .D_IN(f_mmio_rsp_is_load$D_IN),
						 .ENQ(f_mmio_rsp_is_load$ENQ),
						 .DEQ(f_mmio_rsp_is_load$DEQ),
						 .CLR(f_mmio_rsp_is_load$CLR),
						 .D_OUT(f_mmio_rsp_is_load$D_OUT),
						 .FULL_N(f_mmio_rsp_is_load$FULL_N),
						 .EMPTY_N(f_mmio_rsp_is_load$EMPTY_N));
  // submodule f_rd_addr
  FIFO2 #(.width(32'd109), .guarded(1'd1)) f_rd_addr(.RST(RST_N),
						     .CLK(CLK),
						     .D_IN(f_rd_addr$D_IN),
						     .ENQ(f_rd_addr$ENQ),
						     .DEQ(f_rd_addr$DEQ),
						     .CLR(f_rd_addr$CLR),
						     .D_OUT(f_rd_addr$D_OUT),
						     .FULL_N(f_rd_addr$FULL_N),
						     .EMPTY_N(f_rd_addr$EMPTY_N));
  // submodule f_rd_data
  FIFO2 #(.width(32'd531), .guarded(1'd1)) f_rd_data(.RST(RST_N),
						     .CLK(CLK),
						     .D_IN(f_rd_data$D_IN),
						     .ENQ(f_rd_data$ENQ),
						     .DEQ(f_rd_data$DEQ),
						     .CLR(f_rd_data$CLR),
						     .D_OUT(f_rd_data$D_OUT),
						     .FULL_N(f_rd_data$FULL_N),
						     .EMPTY_N(f_rd_data$EMPTY_N));
  // submodule f_reqs
  FIFO2 #(.width(32'd686), .guarded(1'd1)) f_reqs(.RST(RST_N),
						  .CLK(CLK),
						  .D_IN(f_reqs$D_IN),
						  .ENQ(f_reqs$ENQ),
						  .DEQ(f_reqs$DEQ),
						  .CLR(f_reqs$CLR),
						  .D_OUT(f_reqs$D_OUT),
						  .FULL_N(f_reqs$FULL_N),
						  .EMPTY_N(f_reqs$EMPTY_N));
  // submodule f_single_reqs
  FIFO2 #(.width(32'd131), .guarded(1'd1)) f_single_reqs(.RST(RST_N),
							 .CLK(CLK),
							 .D_IN(f_single_reqs$D_IN),
							 .ENQ(f_single_reqs$ENQ),
							 .DEQ(f_single_reqs$DEQ),
							 .CLR(f_single_reqs$CLR),
							 .D_OUT(f_single_reqs$D_OUT),
							 .FULL_N(f_single_reqs$FULL_N),
							 .EMPTY_N(f_single_reqs$EMPTY_N));
  // submodule f_single_rsps
  FIFO2 #(.width(32'd65), .guarded(1'd1)) f_single_rsps(.RST(RST_N),
							.CLK(CLK),
							.D_IN(f_single_rsps$D_IN),
							.ENQ(f_single_rsps$ENQ),
							.DEQ(f_single_rsps$DEQ),
							.CLR(f_single_rsps$CLR),
							.D_OUT(f_single_rsps$D_OUT),
							.FULL_N(f_single_rsps$FULL_N),
							.EMPTY_N(f_single_rsps$EMPTY_N));
  // submodule f_wr_addr
  FIFO2 #(.width(32'd109), .guarded(1'd1)) f_wr_addr(.RST(RST_N),
						     .CLK(CLK),
						     .D_IN(f_wr_addr$D_IN),
						     .ENQ(f_wr_addr$ENQ),
						     .DEQ(f_wr_addr$DEQ),
						     .CLR(f_wr_addr$CLR),
						     .D_OUT(f_wr_addr$D_OUT),
						     .FULL_N(f_wr_addr$FULL_N),
						     .EMPTY_N(f_wr_addr$EMPTY_N));
  // submodule f_wr_data
  FIFO2 #(.width(32'd577), .guarded(1'd1)) f_wr_data(.RST(RST_N),
						     .CLK(CLK),
						     .D_IN(f_wr_data$D_IN),
						     .ENQ(f_wr_data$ENQ),
						     .DEQ(f_wr_data$DEQ),
						     .CLR(f_wr_data$CLR),
						     .D_OUT(f_wr_data$D_OUT),
						     .FULL_N(f_wr_data$FULL_N),
						     .EMPTY_N(f_wr_data$EMPTY_N));
  // submodule f_wr_resp
  FIFO2 #(.width(32'd18), .guarded(1'd1)) f_wr_resp(.RST(RST_N),
						    .CLK(CLK),
						    .D_IN(f_wr_resp$D_IN),
						    .ENQ(f_wr_resp$ENQ),
						    .DEQ(f_wr_resp$DEQ),
						    .CLR(f_wr_resp$CLR),
						    .D_OUT(f_wr_resp$D_OUT),
						    .FULL_N(f_wr_resp$FULL_N),
						    .EMPTY_N(f_wr_resp$EMPTY_N));
  // submodule rf_data_sets
  RegFile #(.addr_width(32'd6),
	    .data_width(32'd512),
	    .lo(6'h0),
	    .hi(6'd63)) rf_data_sets(.CLK(CLK),
				     .ADDR_1(rf_data_sets$ADDR_1),
				     .ADDR_2(rf_data_sets$ADDR_2),
				     .ADDR_3(rf_data_sets$ADDR_3),
				     .ADDR_4(rf_data_sets$ADDR_4),
				     .ADDR_5(rf_data_sets$ADDR_5),
				     .ADDR_IN(rf_data_sets$ADDR_IN),
				     .D_IN(rf_data_sets$D_IN),
				     .WE(rf_data_sets$WE),
				     .D_OUT_1(rf_data_sets$D_OUT_1),
				     .D_OUT_2(),
				     .D_OUT_3(),
				     .D_OUT_4(),
				     .D_OUT_5());
  // submodule rf_tag_sets
  RegFile #(.addr_width(32'd6),
	    .data_width(32'd66),
	    .lo(6'h0),
	    .hi(6'd63)) rf_tag_sets(.CLK(CLK),
				    .ADDR_1(rf_tag_sets$ADDR_1),
				    .ADDR_2(rf_tag_sets$ADDR_2),
				    .ADDR_3(rf_tag_sets$ADDR_3),
				    .ADDR_4(rf_tag_sets$ADDR_4),
				    .ADDR_5(rf_tag_sets$ADDR_5),
				    .ADDR_IN(rf_tag_sets$ADDR_IN),
				    .D_IN(rf_tag_sets$D_IN),
				    .WE(rf_tag_sets$WE),
				    .D_OUT_1(rf_tag_sets$D_OUT_1),
				    .D_OUT_2(rf_tag_sets$D_OUT_2),
				    .D_OUT_3(),
				    .D_OUT_4(),
				    .D_OUT_5());
  // rule RL_rl_init
  assign CAN_FIRE_RL_rl_init = rg_state == 2'd0 ;
  assign WILL_FIRE_RL_rl_init = CAN_FIRE_RL_rl_init ;
  // rule RL_rl_merge_rd_req
  assign CAN_FIRE_RL_rl_merge_rd_req =
	     axi4_s_xactor_f_rd_addr$EMPTY_N && f_reqs$FULL_N &&
	     (!axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d12 &&
	      axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d14 ||
	      !axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d16 &&
	      axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d18) ;
  assign WILL_FIRE_RL_rl_merge_rd_req = CAN_FIRE_RL_rl_merge_rd_req ;
  // rule RL_rl_merge_wr_req
  assign CAN_FIRE_RL_rl_merge_wr_req =
	     f_reqs$FULL_N && axi4_s_xactor_f_wr_addr$EMPTY_N &&
	     axi4_s_xactor_f_wr_data$EMPTY_N &&
	     (!axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d42 &&
	      axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d44 ||
	      !axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d46 &&
	      axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d48) ;
  assign WILL_FIRE_RL_rl_merge_wr_req =
	     CAN_FIRE_RL_rl_merge_wr_req && !WILL_FIRE_RL_rl_merge_rd_req ;
  // rule RL_rl_downgrade
  assign CAN_FIRE_RL_rl_downgrade =
	     f_L2_to_L1_Reqs$EMPTY_N &&
	     (rf_tag_sets$D_OUT_2[65:64] == 2'd0 ||
	      rf_tag_sets_sub_f_L2_to_L1_Reqs_first__1_BITS__ETC___d77 ||
	      !rf_tag_sets_sub_f_L2_to_L1_Reqs_first__1_BITS__ETC___d82 ||
	      f_L1_to_L2_Rsps$FULL_N) &&
	     rg_state != 2'd0 ;
  assign WILL_FIRE_RL_rl_downgrade = CAN_FIRE_RL_rl_downgrade ;
  // rule RL_rl_evict
  assign CAN_FIRE_RL_rl_evict =
	     f_L1_to_L2_Rsps$FULL_N && f_reqs$EMPTY_N && rg_state == 2'd1 &&
	     !f_L2_to_L1_Reqs$EMPTY_N &&
	     rf_tag_sets$D_OUT_1[65:64] != 2'd0 &&
	     !rf_tag_sets_sub_f_reqs_first__05_BITS_616_TO_6_ETC___d114 ;
  assign WILL_FIRE_RL_rl_evict = CAN_FIRE_RL_rl_evict ;
  // rule RL_rl_hit
  assign CAN_FIRE_RL_rl_hit =
	     f_reqs$EMPTY_N &&
	     IF_f_reqs_first__05_BIT_685_24_THEN_axi4_s_xac_ETC___d127 &&
	     rg_state == 2'd1 &&
	     !f_L2_to_L1_Reqs$EMPTY_N &&
	     NOT_f_reqs_first__05_BIT_685_24_29_AND_NOT_rf__ETC___d135 ;
  assign WILL_FIRE_RL_rl_hit = CAN_FIRE_RL_rl_hit ;
  // rule RL_rl_upgrade_req
  assign CAN_FIRE_RL_rl_upgrade_req = MUX_rg_state$write_1__SEL_3 ;
  assign WILL_FIRE_RL_rl_upgrade_req = MUX_rg_state$write_1__SEL_3 ;
  // rule RL_rl_upgrade_rsp
  assign CAN_FIRE_RL_rl_upgrade_rsp = MUX_rg_state$write_1__SEL_2 ;
  assign WILL_FIRE_RL_rl_upgrade_rsp = MUX_rg_state$write_1__SEL_2 ;
  // rule RL_rl_mmio_AXI_rd_req
  assign CAN_FIRE_RL_rl_mmio_AXI_rd_req =
	     axi4_s_xactor_f_rd_addr$EMPTY_N && f_rd_addr$FULL_N &&
	     (axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d12 ||
	      !axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d14) &&
	     (axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d16 ||
	      !axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d18) ;
  assign WILL_FIRE_RL_rl_mmio_AXI_rd_req = CAN_FIRE_RL_rl_mmio_AXI_rd_req ;
  // rule RL_rl_mmio_LD_req
  assign CAN_FIRE_RL_rl_mmio_LD_req = MUX_f_single_reqs$enq_1__SEL_1 ;
  assign WILL_FIRE_RL_rl_mmio_LD_req = MUX_f_single_reqs$enq_1__SEL_1 ;
  // rule RL_rl_mmio_LD_rsp
  assign CAN_FIRE_RL_rl_mmio_LD_rsp =
	     f_mmio_rsp_is_load$EMPTY_N && f_single_rsps$EMPTY_N &&
	     axi4_to_ld_f_rsps$FULL_N &&
	     f_mmio_rsp_is_load$D_OUT ;
  assign WILL_FIRE_RL_rl_mmio_LD_rsp = CAN_FIRE_RL_rl_mmio_LD_rsp ;
  // rule RL_rl_mmio_AXI_rd_rsp
  assign CAN_FIRE_RL_rl_mmio_AXI_rd_rsp =
	     axi4_s_xactor_f_rd_data$FULL_N && f_rd_data$EMPTY_N ;
  assign WILL_FIRE_RL_rl_mmio_AXI_rd_rsp =
	     CAN_FIRE_RL_rl_mmio_AXI_rd_rsp && !WILL_FIRE_RL_rl_upgrade_rsp &&
	     !WILL_FIRE_RL_rl_hit ;
  // rule RL_rl_mmio_axi_wr_req
  assign CAN_FIRE_RL_rl_mmio_axi_wr_req =
	     axi4_s_xactor_f_wr_addr$EMPTY_N &&
	     axi4_s_xactor_f_wr_data$EMPTY_N &&
	     f_wr_addr$FULL_N &&
	     f_wr_data$FULL_N &&
	     (axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d42 ||
	      !axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d44) &&
	     (axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d46 ||
	      !axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d48) ;
  assign WILL_FIRE_RL_rl_mmio_axi_wr_req = CAN_FIRE_RL_rl_mmio_axi_wr_req ;
  // rule RL_rl_mmio_ST_req
  assign CAN_FIRE_RL_rl_mmio_ST_req =
	     f_single_reqs$FULL_N && f_mmio_rsp_is_load$FULL_N &&
	     axi4_to_st_f_reqs$EMPTY_N ;
  assign WILL_FIRE_RL_rl_mmio_ST_req = MUX_f_single_reqs$enq_1__SEL_2 ;
  // rule RL_rl_mmio_st_rsp
  assign CAN_FIRE_RL_rl_mmio_st_rsp =
	     f_mmio_rsp_is_load$EMPTY_N && axi4_to_st_f_rsps$FULL_N &&
	     !f_mmio_rsp_is_load$D_OUT ;
  assign WILL_FIRE_RL_rl_mmio_st_rsp = CAN_FIRE_RL_rl_mmio_st_rsp ;
  // rule RL_rl_mmio_axi_wr_rsp
  assign CAN_FIRE_RL_rl_mmio_axi_wr_rsp =
	     axi4_s_xactor_f_wr_resp$FULL_N && f_wr_resp$EMPTY_N ;
  assign WILL_FIRE_RL_rl_mmio_axi_wr_rsp =
	     CAN_FIRE_RL_rl_mmio_axi_wr_rsp && !WILL_FIRE_RL_rl_upgrade_rsp &&
	     !WILL_FIRE_RL_rl_hit ;
  // rule RL_axi4_to_ld_rl_start_xaction
  assign CAN_FIRE_RL_axi4_to_ld_rl_start_xaction =
	     f_rd_addr$EMPTY_N &&
	     NOT_f_rd_addr_first__62_BITS_28_TO_21_63_EQ_0__ETC___d679 &&
	     axi4_to_ld_rg_state == 3'd0 ;
  assign WILL_FIRE_RL_axi4_to_ld_rl_start_xaction =
	     CAN_FIRE_RL_axi4_to_ld_rl_start_xaction ;
  // rule RL_axi4_to_ld_rl_next_slice
  assign CAN_FIRE_RL_axi4_to_ld_rl_next_slice =
	     f_rd_addr$EMPTY_N && axi4_to_ld_f_ld_rsp_info$FULL_N &&
	     (axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d758 ||
	      axi4_to_ld_f_reqs$FULL_N) &&
	     axi4_to_ld_rg_state == 3'd2 ;
  assign WILL_FIRE_RL_axi4_to_ld_rl_next_slice =
	     CAN_FIRE_RL_axi4_to_ld_rl_next_slice ;
  // rule RL_axi4_to_ld_rl_partial
  assign CAN_FIRE_RL_axi4_to_ld_rl_partial =
	     f_rd_addr$EMPTY_N && axi4_to_ld_f_ld_rsp_info$FULL_N &&
	     axi4_to_ld_f_reqs$FULL_N &&
	     axi4_to_ld_rg_state == 3'd1 ;
  assign WILL_FIRE_RL_axi4_to_ld_rl_partial =
	     CAN_FIRE_RL_axi4_to_ld_rl_partial ;
  // rule RL_axi4_to_ld_rl_finish_req
  assign CAN_FIRE_RL_axi4_to_ld_rl_finish_req =
	     f_rd_addr$EMPTY_N && axi4_to_ld_f_ld_rsp_info$FULL_N &&
	     axi4_to_ld_f_axi_rsp_info$FULL_N &&
	     axi4_to_ld_rg_state == 3'd3 ;
  assign WILL_FIRE_RL_axi4_to_ld_rl_finish_req =
	     CAN_FIRE_RL_axi4_to_ld_rl_finish_req ;
  // rule RL_axi4_to_ld_rl_handle_ld_rsp
  assign CAN_FIRE_RL_axi4_to_ld_rl_handle_ld_rsp =
	     axi4_to_ld_f_ld_rsp_info$EMPTY_N && axi4_to_ld_f_rsps$EMPTY_N &&
	     (axi4_to_ld_f_ld_rsp_info$D_OUT[9:8] == 2'd0 ||
	      axi4_to_ld_f_ld_rsp_info$D_OUT[9:8] == 2'd1) ;
  assign WILL_FIRE_RL_axi4_to_ld_rl_handle_ld_rsp =
	     CAN_FIRE_RL_axi4_to_ld_rl_handle_ld_rsp ;
  // rule RL_axi4_to_ld_rl_handle_ld_slice_ignore
  assign CAN_FIRE_RL_axi4_to_ld_rl_handle_ld_slice_ignore =
	     axi4_to_ld_f_ld_rsp_info$EMPTY_N &&
	     axi4_to_ld_f_ld_rsp_info$D_OUT[9:8] == 2'd2 ;
  assign WILL_FIRE_RL_axi4_to_ld_rl_handle_ld_slice_ignore =
	     CAN_FIRE_RL_axi4_to_ld_rl_handle_ld_slice_ignore ;
  // rule RL_axi4_to_ld_rl_shift_tail_slices
  assign CAN_FIRE_RL_axi4_to_ld_rl_shift_tail_slices =
	     axi4_to_ld_f_ld_rsp_info$EMPTY_N &&
	     axi4_to_ld_f_ld_rsp_info$D_OUT[9:8] == 2'd3 &&
	     axi4_to_ld_rg_remaining_slices != 4'd0 ;
  assign WILL_FIRE_RL_axi4_to_ld_rl_shift_tail_slices =
	     CAN_FIRE_RL_axi4_to_ld_rl_shift_tail_slices ;
  // rule RL_axi4_to_ld_rl_send_axi_response
  assign CAN_FIRE_RL_axi4_to_ld_rl_send_axi_response =
	     axi4_to_ld_f_ld_rsp_info$EMPTY_N &&
	     axi4_to_ld_f_axi_rsp_info$EMPTY_N &&
	     f_rd_data$FULL_N &&
	     axi4_to_ld_f_ld_rsp_info$D_OUT[9:8] == 2'd3 &&
	     axi4_to_ld_rg_remaining_slices == 4'd0 ;
  assign WILL_FIRE_RL_axi4_to_ld_rl_send_axi_response =
	     CAN_FIRE_RL_axi4_to_ld_rl_send_axi_response ;
  // rule RL_axi4_to_ld_rl_illegal_req
  assign CAN_FIRE_RL_axi4_to_ld_rl_illegal_req =
	     f_rd_addr$EMPTY_N && axi4_to_ld_f_ld_rsp_info$FULL_N &&
	     axi4_to_ld_f_axi_rsp_info$FULL_N &&
	     axi4_to_ld_rg_state == 3'd4 ;
  assign WILL_FIRE_RL_axi4_to_ld_rl_illegal_req =
	     CAN_FIRE_RL_axi4_to_ld_rl_illegal_req ;
  // rule RL_axi4_to_st_rl_start_xaction
  assign CAN_FIRE_RL_axi4_to_st_rl_start_xaction =
	     f_wr_addr$EMPTY_N && f_wr_data$EMPTY_N &&
	     (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	      !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930 ||
	      f_wr_data_first__21_BITS_8_TO_1_34_EQ_0_35_OR__ETC___d975) &&
	     axi4_to_st_rg_state == 3'd0 ;
  assign WILL_FIRE_RL_axi4_to_st_rl_start_xaction =
	     CAN_FIRE_RL_axi4_to_st_rl_start_xaction ;
  // rule RL_axi4_to_st_rl_next_slice
  assign CAN_FIRE_RL_axi4_to_st_rl_next_slice =
	     (axi4_to_st_rg_v_strb[7:0] == 8'd0 || f_wr_addr$EMPTY_N) &&
	     axi4_to_st_rg_v_strb_075_BITS_7_TO_0_076_EQ_0__ETC___d1116 &&
	     (axi4_to_st_rg_v_strb[7:0] != 8'd0 &&
	      !axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1113 ||
	      v__h60059 != 8'd0 ||
	      f_wr_addr$EMPTY_N) &&
	     axi4_to_st_rg_state == 3'd2 ;
  assign WILL_FIRE_RL_axi4_to_st_rl_next_slice =
	     CAN_FIRE_RL_axi4_to_st_rl_next_slice ;
  // rule RL_axi4_to_st_rl_partial
  assign CAN_FIRE_RL_axi4_to_st_rl_partial =
	     f_wr_addr$EMPTY_N && axi4_to_st_f_reqs$FULL_N &&
	     axi4_to_st_f_st_rsp_info$FULL_N &&
	     axi4_to_st_rg_state == 3'd1 ;
  assign WILL_FIRE_RL_axi4_to_st_rl_partial =
	     CAN_FIRE_RL_axi4_to_st_rl_partial ;
  // rule RL_axi4_to_st_rl_finish_req
  assign CAN_FIRE_RL_axi4_to_st_rl_finish_req =
	     f_wr_addr$EMPTY_N && f_wr_data$EMPTY_N &&
	     axi4_to_st_f_st_rsp_info$FULL_N &&
	     axi4_to_st_f_axi_rsp_info$FULL_N &&
	     axi4_to_st_rg_state == 3'd3 ;
  assign WILL_FIRE_RL_axi4_to_st_rl_finish_req =
	     CAN_FIRE_RL_axi4_to_st_rl_finish_req ;
  // rule RL_axi4_to_st_rl_handle_st_rsps
  assign CAN_FIRE_RL_axi4_to_st_rl_handle_st_rsps =
	     axi4_to_st_f_st_rsp_info$EMPTY_N && axi4_to_st_f_rsps$EMPTY_N &&
	     !axi4_to_st_f_st_rsp_info$D_OUT ;
  assign WILL_FIRE_RL_axi4_to_st_rl_handle_st_rsps =
	     CAN_FIRE_RL_axi4_to_st_rl_handle_st_rsps ;
  // rule RL_axi4_to_st_rl_send_axi_response
  assign CAN_FIRE_RL_axi4_to_st_rl_send_axi_response =
	     axi4_to_st_f_st_rsp_info$EMPTY_N &&
	     axi4_to_st_f_axi_rsp_info$EMPTY_N &&
	     f_wr_resp$FULL_N &&
	     axi4_to_st_f_st_rsp_info$D_OUT ;
  assign WILL_FIRE_RL_axi4_to_st_rl_send_axi_response =
	     CAN_FIRE_RL_axi4_to_st_rl_send_axi_response ;
  // rule RL_axi4_to_st_rl_illegal_req
  assign CAN_FIRE_RL_axi4_to_st_rl_illegal_req =
	     f_wr_data$EMPTY_N &&
	     (axi4_to_st_rg_discard_count != 8'd0 ||
	      f_wr_addr$EMPTY_N && axi4_to_st_f_st_rsp_info$FULL_N &&
	      axi4_to_st_f_axi_rsp_info$FULL_N) &&
	     axi4_to_st_rg_state == 3'd4 ;
  assign WILL_FIRE_RL_axi4_to_st_rl_illegal_req =
	     CAN_FIRE_RL_axi4_to_st_rl_illegal_req ;
  // inputs to muxes for submodule ports
  assign MUX_axi4_s_xactor_f_rd_data$enq_1__SEL_1 =
	     WILL_FIRE_RL_rl_hit && !f_reqs$D_OUT[685] ;
  assign MUX_axi4_s_xactor_f_rd_data$enq_1__SEL_2 =
	     WILL_FIRE_RL_rl_upgrade_rsp && !f_reqs$D_OUT[685] ;
  assign MUX_axi4_s_xactor_f_wr_resp$enq_1__PSEL_1 =
	     WILL_FIRE_RL_rl_upgrade_rsp || WILL_FIRE_RL_rl_hit ;
  assign MUX_axi4_s_xactor_f_wr_resp$enq_1__SEL_1 =
	     MUX_axi4_s_xactor_f_wr_resp$enq_1__PSEL_1 && f_reqs$D_OUT[685] ;
  assign MUX_axi4_to_ld_f_ld_rsp_info$enq_1__SEL_1 =
	     WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	     f_rd_addr$D_OUT[28:21] == 8'd0 &&
	     _1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668 ;
  assign MUX_axi4_to_ld_f_ld_rsp_info$enq_1__SEL_2 =
	     WILL_FIRE_RL_axi4_to_ld_rl_illegal_req ||
	     WILL_FIRE_RL_axi4_to_ld_rl_finish_req ;
  assign MUX_axi4_to_ld_f_reqs$enq_1__SEL_1 =
	     WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	     f_rd_addr$D_OUT[28:21] == 8'd0 &&
	     _1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668 &&
	     _0_CONCAT_f_rd_addr_first__62_BITS_34_TO_29_72__ETC___d674 ;
  assign MUX_axi4_to_ld_f_reqs$enq_1__SEL_2 =
	     WILL_FIRE_RL_axi4_to_ld_rl_next_slice &&
	     !axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d758 ;
  assign MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__SEL_1 =
	     WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	     f_rd_addr$D_OUT[28:21] == 8'd0 &&
	     _1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668 &&
	     (v__h42404 != 8'd0 ||
	      !_0_CONCAT_f_rd_addr_first__62_BITS_92_TO_29_90__ETC___d746) ;
  assign MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__SEL_2 =
	     WILL_FIRE_RL_axi4_to_ld_rl_next_slice && v__h44351 == 8'd0 &&
	     axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d793 ;
  assign MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__SEL_3 =
	     WILL_FIRE_RL_axi4_to_ld_rl_partial && v__h44974 == 8'd0 &&
	     axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d793 ;
  assign MUX_axi4_to_ld_rg_remaining_slices$write_1__SEL_1 =
	     WILL_FIRE_RL_axi4_to_ld_rl_handle_ld_rsp &&
	     axi4_to_ld_f_ld_rsp_info$D_OUT[9:8] == 2'd0 ;
  assign MUX_axi4_to_ld_rg_remaining_slices$write_1__SEL_2 =
	     WILL_FIRE_RL_axi4_to_ld_rl_shift_tail_slices ||
	     WILL_FIRE_RL_axi4_to_ld_rl_handle_ld_slice_ignore ;
  assign MUX_axi4_to_st_f_axi_rsp_info$enq_1__SEL_1 =
	     WILL_FIRE_RL_axi4_to_st_rl_illegal_req &&
	     axi4_to_st_rg_discard_count == 8'd0 ;
  assign MUX_axi4_to_st_f_reqs$enq_1__SEL_1 =
	     WILL_FIRE_RL_axi4_to_st_rl_next_slice &&
	     axi4_to_st_rg_v_strb[7:0] != 8'd0 &&
	     !axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1113 ;
  assign MUX_axi4_to_st_f_reqs$enq_1__SEL_2 =
	     WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	     f_wr_data_first__21_BIT_0_22_AND_f_wr_addr_fir_ETC___d1001 ;
  assign MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_1 =
	     WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	     f_wr_data_first__21_BIT_0_22_AND_f_wr_addr_fir_ETC___d1066 ;
  assign MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_2 =
	     WILL_FIRE_RL_axi4_to_st_rl_next_slice && v__h60059 == 8'd0 &&
	     axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1165 ;
  assign MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_3 =
	     WILL_FIRE_RL_axi4_to_st_rl_partial && v__h65821 == 8'd0 &&
	     axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1165 ;
  assign MUX_axi4_to_st_rg_discard_count$write_1__SEL_1 =
	     WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	     (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	      !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930) ;
  assign MUX_f_L1_to_L2_Rsps$enq_1__SEL_1 =
	     WILL_FIRE_RL_rl_downgrade &&
	     rf_tag_sets$D_OUT_2[65:64] != 2'd0 &&
	     !rf_tag_sets_sub_f_L2_to_L1_Reqs_first__1_BITS__ETC___d77 &&
	     rf_tag_sets_sub_f_L2_to_L1_Reqs_first__1_BITS__ETC___d82 ;
  assign MUX_f_single_reqs$enq_1__SEL_1 =
	     axi4_to_ld_f_reqs$EMPTY_N && f_single_reqs$FULL_N &&
	     f_mmio_rsp_is_load$FULL_N ;
  assign MUX_f_single_reqs$enq_1__SEL_2 =
	     CAN_FIRE_RL_rl_mmio_ST_req && !WILL_FIRE_RL_rl_mmio_LD_req ;
  assign MUX_rg_state$write_1__SEL_1 =
	     WILL_FIRE_RL_rl_init && rg_init_index == 6'd63 ;
  assign MUX_rg_state$write_1__SEL_2 =
	     f_reqs$EMPTY_N && f_L2_to_L1_Rsps$EMPTY_N &&
	     IF_f_reqs_first__05_BIT_685_24_THEN_axi4_s_xac_ETC___d127 &&
	     rg_state == 2'd3 &&
	     !f_L2_to_L1_Reqs$EMPTY_N ;
  assign MUX_rg_state$write_1__SEL_3 =
	     f_reqs$EMPTY_N && f_L1_to_L2_Reqs$FULL_N &&
	     rg_state_EQ_1_01_AND_NOT_f_L2_to_L1_Reqs_notEm_ETC___d438 ;
  assign MUX_axi4_s_xactor_f_rd_data$enq_1__VAL_1 =
	     { f_reqs$D_OUT[684:669], rf_data_sets$D_OUT_1, 3'd1 } ;
  assign MUX_axi4_s_xactor_f_rd_data$enq_1__VAL_2 =
	     { f_reqs$D_OUT[684:669], v__h22217, 3'd1 } ;
  assign MUX_axi4_s_xactor_f_wr_resp$enq_1__VAL_1 =
	     { f_reqs$D_OUT[684:669], 2'd0 } ;
  assign MUX_axi4_to_ld_f_axi_rsp_info$enq_1__VAL_1 =
	     { 1'd0, f_rd_addr$D_OUT[108:93] } ;
  assign MUX_axi4_to_ld_f_axi_rsp_info$enq_1__VAL_2 =
	     { 1'd1, f_rd_addr$D_OUT[108:93] } ;
  assign MUX_axi4_to_ld_f_ld_rsp_info$enq_1__VAL_1 =
	     _0_CONCAT_f_rd_addr_first__62_BITS_34_TO_29_72__ETC___d674 ?
	       { 4'd0, f_rd_addr$D_OUT[34:29] } :
	       10'd682 ;
  assign MUX_axi4_to_ld_f_ld_rsp_info$enq_1__VAL_3 =
	     axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d758 ?
	       10'd682 :
	       { 2'd0, x__h44726 } ;
  assign MUX_axi4_to_ld_f_ld_rsp_info$enq_1__VAL_4 = { 2'd1, x__h45274 } ;
  assign MUX_axi4_to_ld_f_reqs$enq_1__VAL_1 =
	     { x__h42811, f_rd_addr$D_OUT[92:29] } ;
  assign MUX_axi4_to_ld_f_reqs$enq_1__VAL_2 = { x__h44699, x__h44701 } ;
  assign MUX_axi4_to_ld_f_reqs$enq_1__VAL_3 = { x__h45247, x__h45249 } ;
  assign MUX_axi4_to_ld_rg_bytelane_lo$write_1__VAL_1 =
	     bytelane_lo__h42399 + bytes_processed__h42786 ;
  assign MUX_axi4_to_ld_rg_bytelane_lo$write_1__VAL_2 =
	     bytelane_lo__h44346 + bytes_processed__h44683 ;
  assign MUX_axi4_to_ld_rg_bytelane_lo$write_1__VAL_3 =
	     axi4_to_ld_rg_bytelane_lo + bytes_processed__h45231 ;
  assign MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__VAL_1 =
	     (v__h42404 == 8'd0) ? 8'd8 : 8'd0 ;
  assign MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__VAL_2 =
	     axi4_to_ld_rg_bytelane_slice_lo + 8'd8 ;
  assign MUX_axi4_to_ld_rg_remaining_slices$write_1__VAL_1 =
	     axi4_to_ld_rg_remaining_slices - 4'd1 ;
  assign MUX_axi4_to_ld_rg_state$write_1__VAL_1 =
	     (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	      !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668) ?
	       3'd4 :
	       ((v__h42404 == 8'd0) ?
		  (_0_CONCAT_f_rd_addr_first__62_BITS_92_TO_29_90__ETC___d746 ?
		     3'd3 :
		     3'd2) :
		  3'd1) ;
  assign MUX_axi4_to_ld_rg_state$write_1__VAL_2 =
	     (v__h44351 == 8'd0) ?
	       IF_axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_5_ETC___d796 :
	       3'd1 ;
  assign MUX_axi4_to_ld_rg_state$write_1__VAL_3 =
	     (v__h44974 == 8'd0) ?
	       IF_axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_5_ETC___d796 :
	       3'd1 ;
  assign MUX_axi4_to_ld_rg_v_slice$write_1__VAL_1 =
	     { 64'd0, axi4_to_ld_rg_v_slice[511:64] } ;
  assign MUX_axi4_to_ld_rg_v_slice$write_1__VAL_2 =
	     (axi4_to_ld_f_ld_rsp_info$D_OUT[9:8] == 2'd0) ?
	       { slice__h45713, axi4_to_ld_rg_v_slice[511:64] } :
	       { axi4_to_ld_rg_v_slice[511:448] | slice__h45713,
		 axi4_to_ld_rg_v_slice[447:0] } ;
  assign MUX_axi4_to_st_f_axi_rsp_info$enq_1__VAL_1 =
	     { 1'd1, f_wr_addr$D_OUT[108:93] } ;
  assign MUX_axi4_to_st_f_axi_rsp_info$enq_1__VAL_2 =
	     { 1'd0, f_wr_addr$D_OUT[108:93] } ;
  assign MUX_axi4_to_st_f_reqs$enq_1__VAL_1 =
	     { x__h62654, x__h62659, x__h62662 } ;
  assign MUX_axi4_to_st_f_reqs$enq_1__VAL_2 =
	     { x__h55592, x__h55604, x__h55986 } ;
  assign MUX_axi4_to_st_f_reqs$enq_1__VAL_3 =
	     { x__h66107, x__h66112, x__h66115 } ;
  assign MUX_axi4_to_st_rg_bytelane_lo$write_1__VAL_1 =
	     bytelane_lo__h60053 + bytes_processed__h62638 ;
  assign MUX_axi4_to_st_rg_bytelane_lo$write_1__VAL_2 =
	     bytelane_lo__h52935 + bytes_processed__h55567 ;
  assign MUX_axi4_to_st_rg_bytelane_lo$write_1__VAL_3 =
	     axi4_to_st_rg_bytelane_lo + bytes_processed__h66091 ;
  assign MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__VAL_1 =
	     (v__h52941 == 8'd0) ? 8'd8 : 8'd0 ;
  assign MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__VAL_2 =
	     axi4_to_st_rg_bytelane_slice_lo + 8'd8 ;
  assign MUX_axi4_to_st_rg_discard_count$write_1__VAL_2 =
	     axi4_to_st_rg_discard_count - 8'd1 ;
  assign MUX_axi4_to_st_rg_state$write_1__VAL_2 =
	     (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	      !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930) ?
	       3'd4 :
	       ((v__h52941 == 8'd0) ?
		  (_0_CONCAT_f_wr_addr_first__24_BITS_92_TO_29_89__ETC___d1063 ?
		     3'd3 :
		     3'd2) :
		  3'd1) ;
  assign MUX_axi4_to_st_rg_state$write_1__VAL_3 =
	     (v__h60059 == 8'd0) ?
	       IF_axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7__ETC___d1172 :
	       3'd1 ;
  assign MUX_axi4_to_st_rg_state$write_1__VAL_4 =
	     (v__h65821 == 8'd0) ?
	       IF_axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7__ETC___d1172 :
	       3'd1 ;
  assign MUX_axi4_to_st_rg_v_slice$write_1__VAL_1 =
	     { 64'd0, f_wr_data$D_OUT[576:129] } ;
  assign MUX_axi4_to_st_rg_v_slice$write_1__VAL_2 =
	     { 64'd0, axi4_to_st_rg_v_slice[511:64] } ;
  assign MUX_axi4_to_st_rg_v_strb$write_1__VAL_1 =
	     { 8'd0, f_wr_data$D_OUT[64:9] } ;
  assign MUX_axi4_to_st_rg_v_strb$write_1__VAL_2 =
	     { 8'd0, axi4_to_st_rg_v_strb[63:8] } ;
  assign MUX_f_L1_to_L2_Rsps$enq_1__VAL_1 =
	     { line_addr__h2730,
	       f_L2_to_L1_Reqs$D_OUT[1:0],
	       rf_tag_sets$D_OUT_2[65:64] == 2'd3,
	       rf_data_sets$D_OUT_1 } ;
  assign MUX_f_L1_to_L2_Rsps$enq_1__VAL_2 =
	     { rf_tag_sets$D_OUT_1[63:0],
	       2'd0,
	       rf_tag_sets$D_OUT_1[65:64] == 2'd3,
	       rf_data_sets$D_OUT_1 } ;
  assign MUX_f_reqs$enq_1__VAL_1 =
	     { 1'd0,
	       axi4_s_xactor_f_rd_addr$D_OUT,
	       576'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA } ;
  assign MUX_f_reqs$enq_1__VAL_2 =
	     { 1'd1,
	       axi4_s_xactor_f_wr_addr$D_OUT,
	       axi4_s_xactor_f_wr_data$D_OUT[64:1],
	       axi4_s_xactor_f_wr_data$D_OUT[576:65] } ;
  assign MUX_f_single_reqs$enq_1__VAL_1 =
	     { 1'd1,
	       axi4_to_ld_f_reqs$D_OUT[63:0],
	       axi4_to_ld_f_reqs$D_OUT } ;
  assign MUX_f_single_reqs$enq_1__VAL_2 =
	     { 1'd0,
	       axi4_to_st_f_reqs$D_OUT[127:64],
	       axi4_to_st_f_reqs$D_OUT[129:128],
	       axi4_to_st_f_reqs$D_OUT[63:0] } ;
  assign MUX_rf_data_sets$upd_2__VAL_1 =
	     f_reqs$D_OUT[685] ? new_data___1__h4300 : rf_data_sets$D_OUT_1 ;
  assign MUX_rf_data_sets$upd_2__VAL_2 =
	     f_reqs$D_OUT[685] ? new_data___1__h23293 : v__h22217 ;
  assign MUX_rf_tag_sets$upd_2__VAL_1 =
	     { f_L2_to_L1_Reqs$D_OUT[1:0],
	       f_L2_to_L1_Reqs$D_OUT[65:8],
	       6'd0 } ;
  assign MUX_rf_tag_sets$upd_2__VAL_3 =
	     { f_reqs$D_OUT[685] ? 2'd3 : rf_tag_sets$D_OUT_1[65:64],
	       line_addr__h3158 } ;
  assign MUX_rf_tag_sets$upd_2__VAL_4 =
	     { f_reqs$D_OUT[685] ? 2'd3 : f_L2_to_L1_Rsps$D_OUT[514:513],
	       line_addr__h3158 } ;
  // register axi4_to_ld_rg_bytelane_hi
  always@(MUX_axi4_to_ld_f_reqs$enq_1__SEL_1 or
	  MUX_axi4_to_ld_f_reqs$enq_1__SEL_2 or
	  bytelane_slice_hi__h44327 or
	  WILL_FIRE_RL_axi4_to_ld_rl_partial or axi4_to_ld_rg_bytelane_hi)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_axi4_to_ld_f_reqs$enq_1__SEL_1:
	  axi4_to_ld_rg_bytelane_hi$D_IN = 8'd7;
      MUX_axi4_to_ld_f_reqs$enq_1__SEL_2:
	  axi4_to_ld_rg_bytelane_hi$D_IN = bytelane_slice_hi__h44327;
      WILL_FIRE_RL_axi4_to_ld_rl_partial:
	  axi4_to_ld_rg_bytelane_hi$D_IN = axi4_to_ld_rg_bytelane_hi;
      default: axi4_to_ld_rg_bytelane_hi$D_IN =
		   8'b10101010 /* unspecified value */ ;
    endcase
  end
  assign axi4_to_ld_rg_bytelane_hi$EN =
	     WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	     f_rd_addr$D_OUT[28:21] == 8'd0 &&
	     _1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668 &&
	     _0_CONCAT_f_rd_addr_first__62_BITS_34_TO_29_72__ETC___d674 ||
	     WILL_FIRE_RL_axi4_to_ld_rl_next_slice &&
	     !axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d758 ||
	     WILL_FIRE_RL_axi4_to_ld_rl_partial ;
  // register axi4_to_ld_rg_bytelane_lo
  always@(MUX_axi4_to_ld_f_reqs$enq_1__SEL_1 or
	  MUX_axi4_to_ld_rg_bytelane_lo$write_1__VAL_1 or
	  MUX_axi4_to_ld_f_reqs$enq_1__SEL_2 or
	  MUX_axi4_to_ld_rg_bytelane_lo$write_1__VAL_2 or
	  WILL_FIRE_RL_axi4_to_ld_rl_partial or
	  MUX_axi4_to_ld_rg_bytelane_lo$write_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_axi4_to_ld_f_reqs$enq_1__SEL_1:
	  axi4_to_ld_rg_bytelane_lo$D_IN =
	      MUX_axi4_to_ld_rg_bytelane_lo$write_1__VAL_1;
      MUX_axi4_to_ld_f_reqs$enq_1__SEL_2:
	  axi4_to_ld_rg_bytelane_lo$D_IN =
	      MUX_axi4_to_ld_rg_bytelane_lo$write_1__VAL_2;
      WILL_FIRE_RL_axi4_to_ld_rl_partial:
	  axi4_to_ld_rg_bytelane_lo$D_IN =
	      MUX_axi4_to_ld_rg_bytelane_lo$write_1__VAL_3;
      default: axi4_to_ld_rg_bytelane_lo$D_IN =
		   8'b10101010 /* unspecified value */ ;
    endcase
  end
  assign axi4_to_ld_rg_bytelane_lo$EN =
	     WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	     f_rd_addr$D_OUT[28:21] == 8'd0 &&
	     _1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668 &&
	     _0_CONCAT_f_rd_addr_first__62_BITS_34_TO_29_72__ETC___d674 ||
	     WILL_FIRE_RL_axi4_to_ld_rl_next_slice &&
	     !axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d758 ||
	     WILL_FIRE_RL_axi4_to_ld_rl_partial ;
  // register axi4_to_ld_rg_bytelane_slice_lo
  always@(MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__SEL_1 or
	  MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__VAL_1 or
	  MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__SEL_2 or
	  MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__VAL_2 or
	  MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__SEL_1:
	  axi4_to_ld_rg_bytelane_slice_lo$D_IN =
	      MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__VAL_1;
      MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__SEL_2:
	  axi4_to_ld_rg_bytelane_slice_lo$D_IN =
	      MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__VAL_2;
      MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__SEL_3:
	  axi4_to_ld_rg_bytelane_slice_lo$D_IN =
	      MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__VAL_2;
      default: axi4_to_ld_rg_bytelane_slice_lo$D_IN =
		   8'b10101010 /* unspecified value */ ;
    endcase
  end
  assign axi4_to_ld_rg_bytelane_slice_lo$EN =
	     MUX_axi4_to_ld_rg_bytelane_slice_lo$write_1__SEL_1 ||
	     WILL_FIRE_RL_axi4_to_ld_rl_next_slice && v__h44351 == 8'd0 &&
	     axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d793 ||
	     WILL_FIRE_RL_axi4_to_ld_rl_partial && v__h44974 == 8'd0 &&
	     axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d793 ;
  // register axi4_to_ld_rg_cumulative_err
  assign axi4_to_ld_rg_cumulative_err$D_IN =
	     axi4_to_ld_rg_cumulative_err || axi4_to_ld_f_rsps$D_OUT[64] ;
  assign axi4_to_ld_rg_cumulative_err$EN =
	     CAN_FIRE_RL_axi4_to_ld_rl_handle_ld_rsp ;
  // register axi4_to_ld_rg_remaining_slices
  always@(MUX_axi4_to_ld_rg_remaining_slices$write_1__SEL_1 or
	  MUX_axi4_to_ld_rg_remaining_slices$write_1__VAL_1 or
	  MUX_axi4_to_ld_rg_remaining_slices$write_1__SEL_2 or
	  WILL_FIRE_RL_axi4_to_ld_rl_send_axi_response)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_axi4_to_ld_rg_remaining_slices$write_1__SEL_1:
	  axi4_to_ld_rg_remaining_slices$D_IN =
	      MUX_axi4_to_ld_rg_remaining_slices$write_1__VAL_1;
      MUX_axi4_to_ld_rg_remaining_slices$write_1__SEL_2:
	  axi4_to_ld_rg_remaining_slices$D_IN =
	      MUX_axi4_to_ld_rg_remaining_slices$write_1__VAL_1;
      WILL_FIRE_RL_axi4_to_ld_rl_send_axi_response:
	  axi4_to_ld_rg_remaining_slices$D_IN = 4'd8;
      default: axi4_to_ld_rg_remaining_slices$D_IN =
		   4'b1010 /* unspecified value */ ;
    endcase
  end
  assign axi4_to_ld_rg_remaining_slices$EN =
	     WILL_FIRE_RL_axi4_to_ld_rl_handle_ld_rsp &&
	     axi4_to_ld_f_ld_rsp_info$D_OUT[9:8] == 2'd0 ||
	     WILL_FIRE_RL_axi4_to_ld_rl_shift_tail_slices ||
	     WILL_FIRE_RL_axi4_to_ld_rl_handle_ld_slice_ignore ||
	     WILL_FIRE_RL_axi4_to_ld_rl_send_axi_response ;
  // register axi4_to_ld_rg_slice
  assign axi4_to_ld_rg_slice$D_IN = 64'h0 ;
  assign axi4_to_ld_rg_slice$EN = 1'b0 ;
  // register axi4_to_ld_rg_state
  always@(WILL_FIRE_RL_axi4_to_ld_rl_start_xaction or
	  MUX_axi4_to_ld_rg_state$write_1__VAL_1 or
	  WILL_FIRE_RL_axi4_to_ld_rl_next_slice or
	  MUX_axi4_to_ld_rg_state$write_1__VAL_2 or
	  WILL_FIRE_RL_axi4_to_ld_rl_partial or
	  MUX_axi4_to_ld_rg_state$write_1__VAL_3 or
	  MUX_axi4_to_ld_f_ld_rsp_info$enq_1__SEL_2)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_axi4_to_ld_rl_start_xaction:
	  axi4_to_ld_rg_state$D_IN = MUX_axi4_to_ld_rg_state$write_1__VAL_1;
      WILL_FIRE_RL_axi4_to_ld_rl_next_slice:
	  axi4_to_ld_rg_state$D_IN = MUX_axi4_to_ld_rg_state$write_1__VAL_2;
      WILL_FIRE_RL_axi4_to_ld_rl_partial:
	  axi4_to_ld_rg_state$D_IN = MUX_axi4_to_ld_rg_state$write_1__VAL_3;
      MUX_axi4_to_ld_f_ld_rsp_info$enq_1__SEL_2:
	  axi4_to_ld_rg_state$D_IN = 3'd0;
      default: axi4_to_ld_rg_state$D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign axi4_to_ld_rg_state$EN =
	     WILL_FIRE_RL_axi4_to_ld_rl_start_xaction ||
	     WILL_FIRE_RL_axi4_to_ld_rl_next_slice ||
	     WILL_FIRE_RL_axi4_to_ld_rl_partial ||
	     WILL_FIRE_RL_axi4_to_ld_rl_illegal_req ||
	     WILL_FIRE_RL_axi4_to_ld_rl_finish_req ;
  // register axi4_to_ld_rg_v_slice
  assign axi4_to_ld_rg_v_slice$D_IN =
	     MUX_axi4_to_ld_rg_remaining_slices$write_1__SEL_2 ?
	       MUX_axi4_to_ld_rg_v_slice$write_1__VAL_1 :
	       MUX_axi4_to_ld_rg_v_slice$write_1__VAL_2 ;
  assign axi4_to_ld_rg_v_slice$EN =
	     WILL_FIRE_RL_axi4_to_ld_rl_shift_tail_slices ||
	     WILL_FIRE_RL_axi4_to_ld_rl_handle_ld_slice_ignore ||
	     WILL_FIRE_RL_axi4_to_ld_rl_handle_ld_rsp ;
  // register axi4_to_st_rg_bytelane_hi
  always@(MUX_axi4_to_st_f_reqs$enq_1__SEL_1 or
	  bytelane_hi__h60054 or
	  MUX_axi4_to_st_f_reqs$enq_1__SEL_2 or
	  bytelane_hi__h52936 or
	  WILL_FIRE_RL_axi4_to_st_rl_partial or axi4_to_st_rg_bytelane_hi)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_axi4_to_st_f_reqs$enq_1__SEL_1:
	  axi4_to_st_rg_bytelane_hi$D_IN = bytelane_hi__h60054;
      MUX_axi4_to_st_f_reqs$enq_1__SEL_2:
	  axi4_to_st_rg_bytelane_hi$D_IN = bytelane_hi__h52936;
      WILL_FIRE_RL_axi4_to_st_rl_partial:
	  axi4_to_st_rg_bytelane_hi$D_IN = axi4_to_st_rg_bytelane_hi;
      default: axi4_to_st_rg_bytelane_hi$D_IN =
		   8'b10101010 /* unspecified value */ ;
    endcase
  end
  assign axi4_to_st_rg_bytelane_hi$EN =
	     WILL_FIRE_RL_axi4_to_st_rl_next_slice &&
	     axi4_to_st_rg_v_strb[7:0] != 8'd0 &&
	     !axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1113 ||
	     WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	     f_wr_data_first__21_BIT_0_22_AND_f_wr_addr_fir_ETC___d1001 ||
	     WILL_FIRE_RL_axi4_to_st_rl_partial ;
  // register axi4_to_st_rg_bytelane_lo
  always@(MUX_axi4_to_st_f_reqs$enq_1__SEL_1 or
	  MUX_axi4_to_st_rg_bytelane_lo$write_1__VAL_1 or
	  MUX_axi4_to_st_f_reqs$enq_1__SEL_2 or
	  MUX_axi4_to_st_rg_bytelane_lo$write_1__VAL_2 or
	  WILL_FIRE_RL_axi4_to_st_rl_partial or
	  MUX_axi4_to_st_rg_bytelane_lo$write_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_axi4_to_st_f_reqs$enq_1__SEL_1:
	  axi4_to_st_rg_bytelane_lo$D_IN =
	      MUX_axi4_to_st_rg_bytelane_lo$write_1__VAL_1;
      MUX_axi4_to_st_f_reqs$enq_1__SEL_2:
	  axi4_to_st_rg_bytelane_lo$D_IN =
	      MUX_axi4_to_st_rg_bytelane_lo$write_1__VAL_2;
      WILL_FIRE_RL_axi4_to_st_rl_partial:
	  axi4_to_st_rg_bytelane_lo$D_IN =
	      MUX_axi4_to_st_rg_bytelane_lo$write_1__VAL_3;
      default: axi4_to_st_rg_bytelane_lo$D_IN =
		   8'b10101010 /* unspecified value */ ;
    endcase
  end
  assign axi4_to_st_rg_bytelane_lo$EN =
	     WILL_FIRE_RL_axi4_to_st_rl_next_slice &&
	     axi4_to_st_rg_v_strb[7:0] != 8'd0 &&
	     !axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1113 ||
	     WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	     f_wr_data_first__21_BIT_0_22_AND_f_wr_addr_fir_ETC___d1001 ||
	     WILL_FIRE_RL_axi4_to_st_rl_partial ;
  // register axi4_to_st_rg_bytelane_slice_lo
  always@(MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_1 or
	  MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__VAL_1 or
	  MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_2 or
	  MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__VAL_2 or
	  MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_1:
	  axi4_to_st_rg_bytelane_slice_lo$D_IN =
	      MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__VAL_1;
      MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_2:
	  axi4_to_st_rg_bytelane_slice_lo$D_IN =
	      MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__VAL_2;
      MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_3:
	  axi4_to_st_rg_bytelane_slice_lo$D_IN =
	      MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__VAL_2;
      default: axi4_to_st_rg_bytelane_slice_lo$D_IN =
		   8'b10101010 /* unspecified value */ ;
    endcase
  end
  assign axi4_to_st_rg_bytelane_slice_lo$EN =
	     WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	     f_wr_data_first__21_BIT_0_22_AND_f_wr_addr_fir_ETC___d1066 ||
	     WILL_FIRE_RL_axi4_to_st_rl_next_slice && v__h60059 == 8'd0 &&
	     axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1165 ||
	     WILL_FIRE_RL_axi4_to_st_rl_partial && v__h65821 == 8'd0 &&
	     axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1165 ;
  // register axi4_to_st_rg_cumulative_err
  assign axi4_to_st_rg_cumulative_err$D_IN =
	     axi4_to_st_rg_cumulative_err || axi4_to_st_f_rsps$D_OUT ;
  assign axi4_to_st_rg_cumulative_err$EN =
	     CAN_FIRE_RL_axi4_to_st_rl_handle_st_rsps ;
  // register axi4_to_st_rg_discard_count
  assign axi4_to_st_rg_discard_count$D_IN =
	     MUX_axi4_to_st_rg_discard_count$write_1__SEL_1 ?
	       f_wr_addr$D_OUT[28:21] :
	       MUX_axi4_to_st_rg_discard_count$write_1__VAL_2 ;
  assign axi4_to_st_rg_discard_count$EN =
	     WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	     (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	      !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930) ||
	     WILL_FIRE_RL_axi4_to_st_rl_illegal_req &&
	     axi4_to_st_rg_discard_count != 8'd0 ;
  // register axi4_to_st_rg_slice
  always@(MUX_axi4_to_st_f_reqs$enq_1__SEL_1 or
	  axi4_to_st_rg_v_slice or
	  MUX_axi4_to_st_f_reqs$enq_1__SEL_2 or
	  f_wr_data$D_OUT or
	  WILL_FIRE_RL_axi4_to_st_rl_partial or axi4_to_st_rg_slice)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_axi4_to_st_f_reqs$enq_1__SEL_1:
	  axi4_to_st_rg_slice$D_IN = axi4_to_st_rg_v_slice[63:0];
      MUX_axi4_to_st_f_reqs$enq_1__SEL_2:
	  axi4_to_st_rg_slice$D_IN = f_wr_data$D_OUT[128:65];
      WILL_FIRE_RL_axi4_to_st_rl_partial:
	  axi4_to_st_rg_slice$D_IN = axi4_to_st_rg_slice;
      default: axi4_to_st_rg_slice$D_IN =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign axi4_to_st_rg_slice$EN =
	     WILL_FIRE_RL_axi4_to_st_rl_next_slice &&
	     axi4_to_st_rg_v_strb[7:0] != 8'd0 &&
	     !axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1113 ||
	     WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	     f_wr_data_first__21_BIT_0_22_AND_f_wr_addr_fir_ETC___d1001 ||
	     WILL_FIRE_RL_axi4_to_st_rl_partial ;
  // register axi4_to_st_rg_state
  always@(WILL_FIRE_RL_axi4_to_st_rl_start_xaction or
	  MUX_axi4_to_st_rg_state$write_1__VAL_2 or
	  WILL_FIRE_RL_axi4_to_st_rl_next_slice or
	  MUX_axi4_to_st_rg_state$write_1__VAL_3 or
	  WILL_FIRE_RL_axi4_to_st_rl_partial or
	  MUX_axi4_to_st_rg_state$write_1__VAL_4 or
	  MUX_axi4_to_st_f_axi_rsp_info$enq_1__SEL_1 or
	  WILL_FIRE_RL_axi4_to_st_rl_finish_req)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_axi4_to_st_rl_start_xaction:
	  axi4_to_st_rg_state$D_IN = MUX_axi4_to_st_rg_state$write_1__VAL_2;
      WILL_FIRE_RL_axi4_to_st_rl_next_slice:
	  axi4_to_st_rg_state$D_IN = MUX_axi4_to_st_rg_state$write_1__VAL_3;
      WILL_FIRE_RL_axi4_to_st_rl_partial:
	  axi4_to_st_rg_state$D_IN = MUX_axi4_to_st_rg_state$write_1__VAL_4;
      MUX_axi4_to_st_f_axi_rsp_info$enq_1__SEL_1 ||
      WILL_FIRE_RL_axi4_to_st_rl_finish_req:
	  axi4_to_st_rg_state$D_IN = 3'd0;
      default: axi4_to_st_rg_state$D_IN = 3'b010 /* unspecified value */ ;
    endcase
  end
  assign axi4_to_st_rg_state$EN =
	     WILL_FIRE_RL_axi4_to_st_rl_illegal_req &&
	     axi4_to_st_rg_discard_count == 8'd0 ||
	     WILL_FIRE_RL_axi4_to_st_rl_start_xaction ||
	     WILL_FIRE_RL_axi4_to_st_rl_next_slice ||
	     WILL_FIRE_RL_axi4_to_st_rl_partial ||
	     WILL_FIRE_RL_axi4_to_st_rl_finish_req ;
  // register axi4_to_st_rg_v_slice
  always@(MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_1 or
	  MUX_axi4_to_st_rg_v_slice$write_1__VAL_1 or
	  MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_2 or
	  MUX_axi4_to_st_rg_v_slice$write_1__VAL_2 or
	  MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_1:
	  axi4_to_st_rg_v_slice$D_IN =
	      MUX_axi4_to_st_rg_v_slice$write_1__VAL_1;
      MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_2:
	  axi4_to_st_rg_v_slice$D_IN =
	      MUX_axi4_to_st_rg_v_slice$write_1__VAL_2;
      MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_3:
	  axi4_to_st_rg_v_slice$D_IN =
	      MUX_axi4_to_st_rg_v_slice$write_1__VAL_2;
      default: axi4_to_st_rg_v_slice$D_IN =
		   512'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign axi4_to_st_rg_v_slice$EN =
	     WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	     f_wr_data_first__21_BIT_0_22_AND_f_wr_addr_fir_ETC___d1066 ||
	     WILL_FIRE_RL_axi4_to_st_rl_next_slice && v__h60059 == 8'd0 &&
	     axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1165 ||
	     WILL_FIRE_RL_axi4_to_st_rl_partial && v__h65821 == 8'd0 &&
	     axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1165 ;
  // register axi4_to_st_rg_v_strb
  always@(MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_1 or
	  MUX_axi4_to_st_rg_v_strb$write_1__VAL_1 or
	  MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_2 or
	  MUX_axi4_to_st_rg_v_strb$write_1__VAL_2 or
	  MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_1:
	  axi4_to_st_rg_v_strb$D_IN = MUX_axi4_to_st_rg_v_strb$write_1__VAL_1;
      MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_2:
	  axi4_to_st_rg_v_strb$D_IN = MUX_axi4_to_st_rg_v_strb$write_1__VAL_2;
      MUX_axi4_to_st_rg_bytelane_slice_lo$write_1__SEL_3:
	  axi4_to_st_rg_v_strb$D_IN = MUX_axi4_to_st_rg_v_strb$write_1__VAL_2;
      default: axi4_to_st_rg_v_strb$D_IN =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign axi4_to_st_rg_v_strb$EN =
	     WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	     f_wr_data_first__21_BIT_0_22_AND_f_wr_addr_fir_ETC___d1066 ||
	     WILL_FIRE_RL_axi4_to_st_rl_next_slice && v__h60059 == 8'd0 &&
	     axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1165 ||
	     WILL_FIRE_RL_axi4_to_st_rl_partial && v__h65821 == 8'd0 &&
	     axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1165 ;
  // register rg_init_index
  assign rg_init_index$D_IN = rg_init_index + 6'd1 ;
  assign rg_init_index$EN = WILL_FIRE_RL_rl_init && rg_init_index != 6'd63 ;
  // register rg_state
  assign rg_state$D_IN =
	     (MUX_rg_state$write_1__SEL_1 || WILL_FIRE_RL_rl_upgrade_rsp) ?
	       2'd1 :
	       2'd3 ;
  assign rg_state$EN =
	     WILL_FIRE_RL_rl_init && rg_init_index == 6'd63 ||
	     WILL_FIRE_RL_rl_upgrade_rsp ||
	     WILL_FIRE_RL_rl_upgrade_req ;
  // submodule axi4_s_xactor_f_rd_addr
  assign axi4_s_xactor_f_rd_addr$D_IN =
	     { axi4_s_arid,
	       axi4_s_araddr,
	       axi4_s_arlen,
	       axi4_s_arsize,
	       axi4_s_arburst,
	       axi4_s_arlock,
	       axi4_s_arcache,
	       axi4_s_arprot,
	       axi4_s_arqos,
	       axi4_s_arregion } ;
  assign axi4_s_xactor_f_rd_addr$ENQ =
	     axi4_s_arvalid && axi4_s_xactor_f_rd_addr$FULL_N ;
  assign axi4_s_xactor_f_rd_addr$DEQ =
	     WILL_FIRE_RL_rl_mmio_AXI_rd_req || WILL_FIRE_RL_rl_merge_rd_req ;
  assign axi4_s_xactor_f_rd_addr$CLR = 1'b0 ;
  // submodule axi4_s_xactor_f_rd_data
  always@(MUX_axi4_s_xactor_f_rd_data$enq_1__SEL_1 or
	  MUX_axi4_s_xactor_f_rd_data$enq_1__VAL_1 or
	  MUX_axi4_s_xactor_f_rd_data$enq_1__SEL_2 or
	  MUX_axi4_s_xactor_f_rd_data$enq_1__VAL_2 or
	  WILL_FIRE_RL_rl_mmio_AXI_rd_rsp or f_rd_data$D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_axi4_s_xactor_f_rd_data$enq_1__SEL_1:
	  axi4_s_xactor_f_rd_data$D_IN =
	      MUX_axi4_s_xactor_f_rd_data$enq_1__VAL_1;
      MUX_axi4_s_xactor_f_rd_data$enq_1__SEL_2:
	  axi4_s_xactor_f_rd_data$D_IN =
	      MUX_axi4_s_xactor_f_rd_data$enq_1__VAL_2;
      WILL_FIRE_RL_rl_mmio_AXI_rd_rsp:
	  axi4_s_xactor_f_rd_data$D_IN = f_rd_data$D_OUT;
      default: axi4_s_xactor_f_rd_data$D_IN =
		   531'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign axi4_s_xactor_f_rd_data$ENQ =
	     WILL_FIRE_RL_rl_hit && !f_reqs$D_OUT[685] ||
	     WILL_FIRE_RL_rl_upgrade_rsp && !f_reqs$D_OUT[685] ||
	     WILL_FIRE_RL_rl_mmio_AXI_rd_rsp ;
  assign axi4_s_xactor_f_rd_data$DEQ =
	     axi4_s_rready && axi4_s_xactor_f_rd_data$EMPTY_N ;
  assign axi4_s_xactor_f_rd_data$CLR = 1'b0 ;
  // submodule axi4_s_xactor_f_wr_addr
  assign axi4_s_xactor_f_wr_addr$D_IN =
	     { axi4_s_awid,
	       axi4_s_awaddr,
	       axi4_s_awlen,
	       axi4_s_awsize,
	       axi4_s_awburst,
	       axi4_s_awlock,
	       axi4_s_awcache,
	       axi4_s_awprot,
	       axi4_s_awqos,
	       axi4_s_awregion } ;
  assign axi4_s_xactor_f_wr_addr$ENQ =
	     axi4_s_awvalid && axi4_s_xactor_f_wr_addr$FULL_N ;
  assign axi4_s_xactor_f_wr_addr$DEQ =
	     WILL_FIRE_RL_rl_mmio_axi_wr_req || WILL_FIRE_RL_rl_merge_wr_req ;
  assign axi4_s_xactor_f_wr_addr$CLR = 1'b0 ;
  // submodule axi4_s_xactor_f_wr_data
  assign axi4_s_xactor_f_wr_data$D_IN =
	     { axi4_s_wdata, axi4_s_wstrb, axi4_s_wlast } ;
  assign axi4_s_xactor_f_wr_data$ENQ =
	     axi4_s_wvalid && axi4_s_xactor_f_wr_data$FULL_N ;
  assign axi4_s_xactor_f_wr_data$DEQ =
	     WILL_FIRE_RL_rl_mmio_axi_wr_req || WILL_FIRE_RL_rl_merge_wr_req ;
  assign axi4_s_xactor_f_wr_data$CLR = 1'b0 ;
  // submodule axi4_s_xactor_f_wr_resp
  assign axi4_s_xactor_f_wr_resp$D_IN =
	     MUX_axi4_s_xactor_f_wr_resp$enq_1__SEL_1 ?
	       MUX_axi4_s_xactor_f_wr_resp$enq_1__VAL_1 :
	       f_wr_resp$D_OUT ;
  assign axi4_s_xactor_f_wr_resp$ENQ =
	     (WILL_FIRE_RL_rl_upgrade_rsp || WILL_FIRE_RL_rl_hit) &&
	     f_reqs$D_OUT[685] ||
	     WILL_FIRE_RL_rl_mmio_axi_wr_rsp ;
  assign axi4_s_xactor_f_wr_resp$DEQ =
	     axi4_s_bready && axi4_s_xactor_f_wr_resp$EMPTY_N ;
  assign axi4_s_xactor_f_wr_resp$CLR = 1'b0 ;
  // submodule axi4_to_ld_f_axi_rsp_info
  assign axi4_to_ld_f_axi_rsp_info$D_IN =
	     WILL_FIRE_RL_axi4_to_ld_rl_finish_req ?
	       MUX_axi4_to_ld_f_axi_rsp_info$enq_1__VAL_1 :
	       MUX_axi4_to_ld_f_axi_rsp_info$enq_1__VAL_2 ;
  assign axi4_to_ld_f_axi_rsp_info$ENQ =
	     WILL_FIRE_RL_axi4_to_ld_rl_finish_req ||
	     WILL_FIRE_RL_axi4_to_ld_rl_illegal_req ;
  assign axi4_to_ld_f_axi_rsp_info$DEQ =
	     CAN_FIRE_RL_axi4_to_ld_rl_send_axi_response ;
  assign axi4_to_ld_f_axi_rsp_info$CLR = 1'b0 ;
  // submodule axi4_to_ld_f_ld_rsp_info
  always@(MUX_axi4_to_ld_f_ld_rsp_info$enq_1__SEL_1 or
	  MUX_axi4_to_ld_f_ld_rsp_info$enq_1__VAL_1 or
	  MUX_axi4_to_ld_f_ld_rsp_info$enq_1__SEL_2 or
	  WILL_FIRE_RL_axi4_to_ld_rl_next_slice or
	  MUX_axi4_to_ld_f_ld_rsp_info$enq_1__VAL_3 or
	  WILL_FIRE_RL_axi4_to_ld_rl_partial or
	  MUX_axi4_to_ld_f_ld_rsp_info$enq_1__VAL_4)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_axi4_to_ld_f_ld_rsp_info$enq_1__SEL_1:
	  axi4_to_ld_f_ld_rsp_info$D_IN =
	      MUX_axi4_to_ld_f_ld_rsp_info$enq_1__VAL_1;
      MUX_axi4_to_ld_f_ld_rsp_info$enq_1__SEL_2:
	  axi4_to_ld_f_ld_rsp_info$D_IN = 10'd938;
      WILL_FIRE_RL_axi4_to_ld_rl_next_slice:
	  axi4_to_ld_f_ld_rsp_info$D_IN =
	      MUX_axi4_to_ld_f_ld_rsp_info$enq_1__VAL_3;
      WILL_FIRE_RL_axi4_to_ld_rl_partial:
	  axi4_to_ld_f_ld_rsp_info$D_IN =
	      MUX_axi4_to_ld_f_ld_rsp_info$enq_1__VAL_4;
      default: axi4_to_ld_f_ld_rsp_info$D_IN =
		   10'b1010101010 /* unspecified value */ ;
    endcase
  end
  assign axi4_to_ld_f_ld_rsp_info$ENQ =
	     WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	     f_rd_addr$D_OUT[28:21] == 8'd0 &&
	     _1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668 ||
	     WILL_FIRE_RL_axi4_to_ld_rl_illegal_req ||
	     WILL_FIRE_RL_axi4_to_ld_rl_finish_req ||
	     WILL_FIRE_RL_axi4_to_ld_rl_next_slice ||
	     WILL_FIRE_RL_axi4_to_ld_rl_partial ;
  assign axi4_to_ld_f_ld_rsp_info$DEQ =
	     WILL_FIRE_RL_axi4_to_ld_rl_send_axi_response ||
	     WILL_FIRE_RL_axi4_to_ld_rl_handle_ld_slice_ignore ||
	     WILL_FIRE_RL_axi4_to_ld_rl_handle_ld_rsp ;
  assign axi4_to_ld_f_ld_rsp_info$CLR = 1'b0 ;
  // submodule axi4_to_ld_f_reqs
  always@(MUX_axi4_to_ld_f_reqs$enq_1__SEL_1 or
	  MUX_axi4_to_ld_f_reqs$enq_1__VAL_1 or
	  MUX_axi4_to_ld_f_reqs$enq_1__SEL_2 or
	  MUX_axi4_to_ld_f_reqs$enq_1__VAL_2 or
	  WILL_FIRE_RL_axi4_to_ld_rl_partial or
	  MUX_axi4_to_ld_f_reqs$enq_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_axi4_to_ld_f_reqs$enq_1__SEL_1:
	  axi4_to_ld_f_reqs$D_IN = MUX_axi4_to_ld_f_reqs$enq_1__VAL_1;
      MUX_axi4_to_ld_f_reqs$enq_1__SEL_2:
	  axi4_to_ld_f_reqs$D_IN = MUX_axi4_to_ld_f_reqs$enq_1__VAL_2;
      WILL_FIRE_RL_axi4_to_ld_rl_partial:
	  axi4_to_ld_f_reqs$D_IN = MUX_axi4_to_ld_f_reqs$enq_1__VAL_3;
      default: axi4_to_ld_f_reqs$D_IN =
		   66'h2AAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign axi4_to_ld_f_reqs$ENQ =
	     WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	     f_rd_addr$D_OUT[28:21] == 8'd0 &&
	     _1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668 &&
	     _0_CONCAT_f_rd_addr_first__62_BITS_34_TO_29_72__ETC___d674 ||
	     WILL_FIRE_RL_axi4_to_ld_rl_next_slice &&
	     !axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d758 ||
	     WILL_FIRE_RL_axi4_to_ld_rl_partial ;
  assign axi4_to_ld_f_reqs$DEQ = MUX_f_single_reqs$enq_1__SEL_1 ;
  assign axi4_to_ld_f_reqs$CLR = 1'b0 ;
  // submodule axi4_to_ld_f_rsps
  assign axi4_to_ld_f_rsps$D_IN =
	     { !f_single_rsps$D_OUT[64], f_single_rsps$D_OUT[63:0] } ;
  assign axi4_to_ld_f_rsps$ENQ = CAN_FIRE_RL_rl_mmio_LD_rsp ;
  assign axi4_to_ld_f_rsps$DEQ = CAN_FIRE_RL_axi4_to_ld_rl_handle_ld_rsp ;
  assign axi4_to_ld_f_rsps$CLR = 1'b0 ;
  // submodule axi4_to_st_f_axi_rsp_info
  assign axi4_to_st_f_axi_rsp_info$D_IN =
	     MUX_axi4_to_st_f_axi_rsp_info$enq_1__SEL_1 ?
	       MUX_axi4_to_st_f_axi_rsp_info$enq_1__VAL_1 :
	       MUX_axi4_to_st_f_axi_rsp_info$enq_1__VAL_2 ;
  assign axi4_to_st_f_axi_rsp_info$ENQ =
	     WILL_FIRE_RL_axi4_to_st_rl_illegal_req &&
	     axi4_to_st_rg_discard_count == 8'd0 ||
	     WILL_FIRE_RL_axi4_to_st_rl_finish_req ;
  assign axi4_to_st_f_axi_rsp_info$DEQ =
	     CAN_FIRE_RL_axi4_to_st_rl_send_axi_response ;
  assign axi4_to_st_f_axi_rsp_info$CLR = 1'b0 ;
  // submodule axi4_to_st_f_reqs
  always@(MUX_axi4_to_st_f_reqs$enq_1__SEL_1 or
	  MUX_axi4_to_st_f_reqs$enq_1__VAL_1 or
	  MUX_axi4_to_st_f_reqs$enq_1__SEL_2 or
	  MUX_axi4_to_st_f_reqs$enq_1__VAL_2 or
	  WILL_FIRE_RL_axi4_to_st_rl_partial or
	  MUX_axi4_to_st_f_reqs$enq_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_axi4_to_st_f_reqs$enq_1__SEL_1:
	  axi4_to_st_f_reqs$D_IN = MUX_axi4_to_st_f_reqs$enq_1__VAL_1;
      MUX_axi4_to_st_f_reqs$enq_1__SEL_2:
	  axi4_to_st_f_reqs$D_IN = MUX_axi4_to_st_f_reqs$enq_1__VAL_2;
      WILL_FIRE_RL_axi4_to_st_rl_partial:
	  axi4_to_st_f_reqs$D_IN = MUX_axi4_to_st_f_reqs$enq_1__VAL_3;
      default: axi4_to_st_f_reqs$D_IN =
		   130'h2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign axi4_to_st_f_reqs$ENQ =
	     WILL_FIRE_RL_axi4_to_st_rl_next_slice &&
	     axi4_to_st_rg_v_strb[7:0] != 8'd0 &&
	     !axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1113 ||
	     WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	     f_wr_data_first__21_BIT_0_22_AND_f_wr_addr_fir_ETC___d1001 ||
	     WILL_FIRE_RL_axi4_to_st_rl_partial ;
  assign axi4_to_st_f_reqs$DEQ = MUX_f_single_reqs$enq_1__SEL_2 ;
  assign axi4_to_st_f_reqs$CLR = 1'b0 ;
  // submodule axi4_to_st_f_rsps
  assign axi4_to_st_f_rsps$D_IN = 1'd0 ;
  assign axi4_to_st_f_rsps$ENQ = CAN_FIRE_RL_rl_mmio_st_rsp ;
  assign axi4_to_st_f_rsps$DEQ = CAN_FIRE_RL_axi4_to_st_rl_handle_st_rsps ;
  assign axi4_to_st_f_rsps$CLR = 1'b0 ;
  // submodule axi4_to_st_f_st_rsp_info
  assign axi4_to_st_f_st_rsp_info$D_IN =
	     !MUX_axi4_to_st_f_reqs$enq_1__SEL_1 &&
	     !MUX_axi4_to_st_f_reqs$enq_1__SEL_2 &&
	     !WILL_FIRE_RL_axi4_to_st_rl_partial ;
  assign axi4_to_st_f_st_rsp_info$ENQ =
	     WILL_FIRE_RL_axi4_to_st_rl_next_slice &&
	     axi4_to_st_rg_v_strb[7:0] != 8'd0 &&
	     !axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1113 ||
	     WILL_FIRE_RL_axi4_to_st_rl_illegal_req &&
	     axi4_to_st_rg_discard_count == 8'd0 ||
	     WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	     f_wr_data_first__21_BIT_0_22_AND_f_wr_addr_fir_ETC___d1001 ||
	     WILL_FIRE_RL_axi4_to_st_rl_partial ||
	     WILL_FIRE_RL_axi4_to_st_rl_finish_req ;
  assign axi4_to_st_f_st_rsp_info$DEQ =
	     WILL_FIRE_RL_axi4_to_st_rl_send_axi_response ||
	     WILL_FIRE_RL_axi4_to_st_rl_handle_st_rsps ;
  assign axi4_to_st_f_st_rsp_info$CLR = 1'b0 ;
  // submodule f_L1_to_L2_Reqs
  assign f_L1_to_L2_Reqs$D_IN =
	     { line_addr__h3158,
	       rf_tag_sets$D_OUT_1[65:64],
	       f_reqs$D_OUT[685] ? 2'd2 : 2'd1,
	       f_reqs$D_OUT[685] } ;
  assign f_L1_to_L2_Reqs$ENQ = MUX_rg_state$write_1__SEL_3 ;
  assign f_L1_to_L2_Reqs$DEQ = EN_l1_to_l2_client_request_deq ;
  assign f_L1_to_L2_Reqs$CLR = 1'b0 ;
  // submodule f_L1_to_L2_Rsps
  assign f_L1_to_L2_Rsps$D_IN =
	     MUX_f_L1_to_L2_Rsps$enq_1__SEL_1 ?
	       MUX_f_L1_to_L2_Rsps$enq_1__VAL_1 :
	       MUX_f_L1_to_L2_Rsps$enq_1__VAL_2 ;
  assign f_L1_to_L2_Rsps$ENQ =
	     WILL_FIRE_RL_rl_downgrade &&
	     rf_tag_sets$D_OUT_2[65:64] != 2'd0 &&
	     !rf_tag_sets_sub_f_L2_to_L1_Reqs_first__1_BITS__ETC___d77 &&
	     rf_tag_sets_sub_f_L2_to_L1_Reqs_first__1_BITS__ETC___d82 ||
	     WILL_FIRE_RL_rl_evict ;
  assign f_L1_to_L2_Rsps$DEQ = EN_l2_to_l1_server_response_deq ;
  assign f_L1_to_L2_Rsps$CLR = 1'b0 ;
  // submodule f_L2_to_L1_Reqs
  assign f_L2_to_L1_Reqs$D_IN = l2_to_l1_server_request_enq_x ;
  assign f_L2_to_L1_Reqs$ENQ = EN_l2_to_l1_server_request_enq ;
  assign f_L2_to_L1_Reqs$DEQ = CAN_FIRE_RL_rl_downgrade ;
  assign f_L2_to_L1_Reqs$CLR = 1'b0 ;
  // submodule f_L2_to_L1_Rsps
  assign f_L2_to_L1_Rsps$D_IN = l1_to_l2_client_response_enq_x ;
  assign f_L2_to_L1_Rsps$ENQ = EN_l1_to_l2_client_response_enq ;
  assign f_L2_to_L1_Rsps$DEQ = MUX_rg_state$write_1__SEL_2 ;
  assign f_L2_to_L1_Rsps$CLR = 1'b0 ;
  // submodule f_mmio_rsp_is_load
  assign f_mmio_rsp_is_load$D_IN = !WILL_FIRE_RL_rl_mmio_ST_req ;
  assign f_mmio_rsp_is_load$ENQ =
	     WILL_FIRE_RL_rl_mmio_ST_req || WILL_FIRE_RL_rl_mmio_LD_req ;
  assign f_mmio_rsp_is_load$DEQ =
	     WILL_FIRE_RL_rl_mmio_st_rsp || WILL_FIRE_RL_rl_mmio_LD_rsp ;
  assign f_mmio_rsp_is_load$CLR = 1'b0 ;
  // submodule f_rd_addr
  assign f_rd_addr$D_IN = axi4_s_xactor_f_rd_addr$D_OUT ;
  assign f_rd_addr$ENQ = CAN_FIRE_RL_rl_mmio_AXI_rd_req ;
  assign f_rd_addr$DEQ = MUX_axi4_to_ld_f_ld_rsp_info$enq_1__SEL_2 ;
  assign f_rd_addr$CLR = 1'b0 ;
  // submodule f_rd_data
  assign f_rd_data$D_IN =
	     { axi4_to_ld_f_axi_rsp_info$D_OUT[15:0],
	       axi4_to_ld_rg_v_slice,
	       rd_data_S_rresp__h49842,
	       1'd1 } ;
  assign f_rd_data$ENQ = CAN_FIRE_RL_axi4_to_ld_rl_send_axi_response ;
  assign f_rd_data$DEQ = WILL_FIRE_RL_rl_mmio_AXI_rd_rsp ;
  assign f_rd_data$CLR = 1'b0 ;
  // submodule f_reqs
  assign f_reqs$D_IN =
	     WILL_FIRE_RL_rl_merge_rd_req ?
	       MUX_f_reqs$enq_1__VAL_1 :
	       MUX_f_reqs$enq_1__VAL_2 ;
  assign f_reqs$ENQ =
	     WILL_FIRE_RL_rl_merge_rd_req || WILL_FIRE_RL_rl_merge_wr_req ;
  assign f_reqs$DEQ = MUX_axi4_s_xactor_f_wr_resp$enq_1__PSEL_1 ;
  assign f_reqs$CLR = 1'b0 ;
  // submodule f_single_reqs
  assign f_single_reqs$D_IN =
	     WILL_FIRE_RL_rl_mmio_LD_req ?
	       MUX_f_single_reqs$enq_1__VAL_1 :
	       MUX_f_single_reqs$enq_1__VAL_2 ;
  assign f_single_reqs$ENQ =
	     WILL_FIRE_RL_rl_mmio_LD_req || WILL_FIRE_RL_rl_mmio_ST_req ;
  assign f_single_reqs$DEQ = EN_mmio_client_request_get ;
  assign f_single_reqs$CLR = 1'b0 ;
  // submodule f_single_rsps
  assign f_single_rsps$D_IN = mmio_client_response_put ;
  assign f_single_rsps$ENQ = EN_mmio_client_response_put ;
  assign f_single_rsps$DEQ =
	     f_mmio_rsp_is_load$EMPTY_N && f_single_rsps$EMPTY_N &&
	     axi4_to_ld_f_rsps$FULL_N &&
	     f_mmio_rsp_is_load$D_OUT ;
  assign f_single_rsps$CLR = 1'b0 ;
  // submodule f_wr_addr
  assign f_wr_addr$D_IN = axi4_s_xactor_f_wr_addr$D_OUT ;
  assign f_wr_addr$ENQ = CAN_FIRE_RL_rl_mmio_axi_wr_req ;
  assign f_wr_addr$DEQ =
	     WILL_FIRE_RL_axi4_to_st_rl_illegal_req &&
	     axi4_to_st_rg_discard_count == 8'd0 ||
	     WILL_FIRE_RL_axi4_to_st_rl_finish_req ;
  assign f_wr_addr$CLR = 1'b0 ;
  // submodule f_wr_data
  assign f_wr_data$D_IN = axi4_s_xactor_f_wr_data$D_OUT ;
  assign f_wr_data$ENQ = CAN_FIRE_RL_rl_mmio_axi_wr_req ;
  assign f_wr_data$DEQ =
	     WILL_FIRE_RL_axi4_to_st_rl_illegal_req ||
	     WILL_FIRE_RL_axi4_to_st_rl_finish_req ;
  assign f_wr_data$CLR = 1'b0 ;
  // submodule f_wr_resp
  assign f_wr_resp$D_IN =
	     { axi4_to_st_f_axi_rsp_info$D_OUT[15:0],
	       (axi4_to_st_f_axi_rsp_info$D_OUT[16] ||
		axi4_to_st_rg_cumulative_err) ?
		 2'b10 :
		 2'b0 } ;
  assign f_wr_resp$ENQ = CAN_FIRE_RL_axi4_to_st_rl_send_axi_response ;
  assign f_wr_resp$DEQ = WILL_FIRE_RL_rl_mmio_axi_wr_rsp ;
  assign f_wr_resp$CLR = 1'b0 ;
  // submodule rf_data_sets
  assign rf_data_sets$ADDR_1 =
	     WILL_FIRE_RL_rl_downgrade ?
	       f_L2_to_L1_Reqs$D_OUT[13:8] :
	       f_reqs$D_OUT[616:611] ;
  assign rf_data_sets$ADDR_2 = 6'h0 ;
  assign rf_data_sets$ADDR_3 = 6'h0 ;
  assign rf_data_sets$ADDR_4 = 6'h0 ;
  assign rf_data_sets$ADDR_5 = 6'h0 ;
  assign rf_data_sets$ADDR_IN = f_reqs$D_OUT[616:611] ;
  assign rf_data_sets$D_IN =
	     WILL_FIRE_RL_rl_hit ?
	       MUX_rf_data_sets$upd_2__VAL_1 :
	       MUX_rf_data_sets$upd_2__VAL_2 ;
  assign rf_data_sets$WE =
	     WILL_FIRE_RL_rl_hit || WILL_FIRE_RL_rl_upgrade_rsp ;
  // submodule rf_tag_sets
  assign rf_tag_sets$ADDR_1 = f_reqs$D_OUT[616:611] ;
  assign rf_tag_sets$ADDR_2 = f_L2_to_L1_Reqs$D_OUT[13:8] ;
  assign rf_tag_sets$ADDR_3 = 6'h0 ;
  assign rf_tag_sets$ADDR_4 = 6'h0 ;
  assign rf_tag_sets$ADDR_5 = 6'h0 ;
  always@(MUX_f_L1_to_L2_Rsps$enq_1__SEL_1 or
	  f_L2_to_L1_Reqs$D_OUT or
	  WILL_FIRE_RL_rl_evict or
	  WILL_FIRE_RL_rl_hit or
	  WILL_FIRE_RL_rl_upgrade_rsp or
	  f_reqs$D_OUT or WILL_FIRE_RL_rl_init or rg_init_index)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_f_L1_to_L2_Rsps$enq_1__SEL_1:
	  rf_tag_sets$ADDR_IN = f_L2_to_L1_Reqs$D_OUT[13:8];
      WILL_FIRE_RL_rl_evict || WILL_FIRE_RL_rl_hit ||
      WILL_FIRE_RL_rl_upgrade_rsp:
	  rf_tag_sets$ADDR_IN = f_reqs$D_OUT[616:611];
      WILL_FIRE_RL_rl_init: rf_tag_sets$ADDR_IN = rg_init_index;
      default: rf_tag_sets$ADDR_IN = 6'b101010 /* unspecified value */ ;
    endcase
  end
  always@(MUX_f_L1_to_L2_Rsps$enq_1__SEL_1 or
	  MUX_rf_tag_sets$upd_2__VAL_1 or
	  WILL_FIRE_RL_rl_evict or
	  WILL_FIRE_RL_rl_hit or
	  MUX_rf_tag_sets$upd_2__VAL_3 or
	  WILL_FIRE_RL_rl_upgrade_rsp or
	  MUX_rf_tag_sets$upd_2__VAL_4 or WILL_FIRE_RL_rl_init)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_f_L1_to_L2_Rsps$enq_1__SEL_1:
	  rf_tag_sets$D_IN = MUX_rf_tag_sets$upd_2__VAL_1;
      WILL_FIRE_RL_rl_evict: rf_tag_sets$D_IN = 66'h0AAAAAAAAAAAAAAAA;
      WILL_FIRE_RL_rl_hit: rf_tag_sets$D_IN = MUX_rf_tag_sets$upd_2__VAL_3;
      WILL_FIRE_RL_rl_upgrade_rsp:
	  rf_tag_sets$D_IN = MUX_rf_tag_sets$upd_2__VAL_4;
      WILL_FIRE_RL_rl_init: rf_tag_sets$D_IN = 66'd0;
      default: rf_tag_sets$D_IN =
		   66'h2AAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign rf_tag_sets$WE =
	     WILL_FIRE_RL_rl_downgrade &&
	     rf_tag_sets$D_OUT_2[65:64] != 2'd0 &&
	     !rf_tag_sets_sub_f_L2_to_L1_Reqs_first__1_BITS__ETC___d77 &&
	     rf_tag_sets_sub_f_L2_to_L1_Reqs_first__1_BITS__ETC___d82 ||
	     WILL_FIRE_RL_rl_evict ||
	     WILL_FIRE_RL_rl_hit ||
	     WILL_FIRE_RL_rl_upgrade_rsp ||
	     WILL_FIRE_RL_rl_init ;
  // remaining internal signals
  assign IF_axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_5_ETC___d796 =
	     axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d793 ?
	       3'd2 :
	       3'd3 ;
  assign IF_axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7__ETC___d1172 =
	     axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1165 ?
	       3'd2 :
	       3'd3 ;
  assign IF_f_reqs_first__05_BIT_685_24_THEN_axi4_s_xac_ETC___d127 =
	     f_reqs$D_OUT[685] ?
	       axi4_s_xactor_f_wr_resp$FULL_N :
	       axi4_s_xactor_f_rd_data$FULL_N ;
  assign NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452 =
	     f_L2_to_L1_Rsps$D_OUT[578:515] != line_addr__h3158 ;
  assign NOT_f_rd_addr_first__62_BITS_28_TO_21_63_EQ_0__ETC___d679 =
	     f_rd_addr$D_OUT[28:21] != 8'd0 ||
	     !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668 ||
	     axi4_to_ld_f_ld_rsp_info$FULL_N &&
	     (!_0_CONCAT_f_rd_addr_first__62_BITS_34_TO_29_72__ETC___d674 ||
	      axi4_to_ld_f_reqs$FULL_N) ;
  assign NOT_f_reqs_first__05_BIT_685_24_29_AND_NOT_rf__ETC___d135 =
	     (!f_reqs$D_OUT[685] && rf_tag_sets$D_OUT_1[65:64] != 2'd0 ||
	      f_reqs$D_OUT[685] && rf_tag_sets$D_OUT_1[65:64] >= 2'd2) &&
	     rf_tag_sets_sub_f_reqs_first__05_BITS_616_TO_6_ETC___d114 ;
  assign _0_CONCAT_IF_f_wr_data_first__21_BIT_1_36_THEN__ETC___d955 =
	     y__h54481 <= addr_bytelane__h52059 ;
  assign _0_CONCAT_f_rd_addr_first__62_BITS_34_TO_29_72__ETC___d674 =
	     bytelane_lo__h42399 <= 8'd7 ;
  assign _0_CONCAT_f_rd_addr_first__62_BITS_92_TO_29_90__ETC___d746 =
	     szwindow_bytelane_hi__h41816 <= 8'd7 ;
  assign _0_CONCAT_f_wr_addr_first__24_BITS_92_TO_29_89__ETC___d1063 =
	     szwindow_bytelane_hi__h52063 <= 8'd7 ;
  assign _1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668 =
	     _1_SL_f_rd_addr_first__62_BITS_20_TO_18_66___d667 <= 8'd64 ;
  assign _1_SL_f_rd_addr_first__62_BITS_20_TO_18_66___d667 =
	     8'd1 << f_rd_addr$D_OUT[20:18] ;
  assign _1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930 =
	     _1_SL_f_wr_addr_first__24_BITS_20_TO_18_28___d929 <= 8'd64 ;
  assign _1_SL_f_wr_addr_first__24_BITS_20_TO_18_28___d929 =
	     8'd1 << f_wr_addr$D_OUT[20:18] ;
  assign _7_MINUS_0_CONCAT_IF_f_wr_data_first__21_BIT_8__ETC___d1011 =
	     num_bytes__h55297 < 8'd8 ;
  assign _7_MINUS_0_CONCAT_IF_f_wr_data_first__21_BIT_8__ETC___d969 =
	     bytelane_hi__h52936 < bytelane_lo__h52935 ;
  assign _7_MINUS_0_CONCAT_f_rd_addr_first__62_BITS_34_T_ETC___d711 =
	     num_bytes__h42529 < 8'd8 ;
  assign addr_axi_bus_lo__h41811 = { f_rd_addr$D_OUT[92:35], 6'd0 } ;
  assign addr_axi_bus_lo__h52058 = { f_wr_addr$D_OUT[92:35], 6'd0 } ;
  assign addr_bytelane__h52059 = { 2'd0, f_wr_addr$D_OUT[34:29] } ;
  assign axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d12 =
	     axi4_s_xactor_f_rd_addr$D_OUT[92:29] < 64'h0000000000001000 ;
  assign axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d14 =
	     axi4_s_xactor_f_rd_addr$D_OUT[92:29] < 64'd8192 ;
  assign axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d16 =
	     axi4_s_xactor_f_rd_addr$D_OUT[92:29] < 64'h0000000080000000 ;
  assign axi4_s_xactor_f_rd_addr_first__0_BITS_92_TO_29_ETC___d18 =
	     axi4_s_xactor_f_rd_addr$D_OUT[92:29] < 64'h0000000090000000 ;
  assign axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d42 =
	     axi4_s_xactor_f_wr_addr$D_OUT[92:29] < 64'h0000000000001000 ;
  assign axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d44 =
	     axi4_s_xactor_f_wr_addr$D_OUT[92:29] < 64'd8192 ;
  assign axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d46 =
	     axi4_s_xactor_f_wr_addr$D_OUT[92:29] < 64'h0000000080000000 ;
  assign axi4_s_xactor_f_wr_addr_first__0_BITS_92_TO_29_ETC___d48 =
	     axi4_s_xactor_f_wr_addr$D_OUT[92:29] < 64'h0000000090000000 ;
  assign axi4_to_ld_rg_bytelane_hi_02_MINUS_axi4_to_ld__ETC___d813 =
	     num_bytes__h44981 < 8'd8 ;
  assign axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_M_ETC___d777 =
	     num_bytes__h44435 < 8'd8 ;
  assign axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d758 =
	     bytelane_slice_hi__h44327 < bytelane_lo__h44346 ;
  assign axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d793 =
	     bytelane_slice_hi__h44327 < szwindow_bytelane_hi__h41816 ;
  assign axi4_to_st_rg_bytelane_hi_176_MINUS_axi4_to_st_ETC___d1187 =
	     num_bytes__h65828 < 8'd8 ;
  assign axi4_to_st_rg_bytelane_lo_MINUS_axi4_to_st_rg__ETC__q2 =
	     axi4_to_st_rg_bytelane_lo - axi4_to_st_rg_bytelane_slice_lo ;
  assign axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1113 =
	     bytelane_hi__h60054 < bytelane_lo__h60053 ;
  assign axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1129 =
	     num_bytes__h62377 < 8'd8 ;
  assign axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1165 =
	     bytelane_slice_hi__h60018 < szwindow_bytelane_hi__h52063 ;
  assign axi4_to_st_rg_v_strb_075_BITS_7_TO_0_076_EQ_0__ETC___d1116 =
	     axi4_to_st_rg_v_strb[7:0] == 8'd0 ||
	     axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1113 ||
	     f_wr_addr$EMPTY_N && axi4_to_st_f_reqs$FULL_N &&
	     axi4_to_st_f_st_rsp_info$FULL_N ;
  assign bytelane_hi__h52936 = 8'd7 - num_msb_zero_bytes__h52922 ;
  assign bytelane_hi__h60054 =
	     bytelane_slice_hi__h60018 - num_msb_zero_bytes__h60040 ;
  assign bytelane_lo0053_MINUS_axi4_to_st_rg_bytelane_s_ETC__q1 =
	     bytelane_lo__h60053 - axi4_to_st_rg_bytelane_slice_lo ;
  assign bytelane_lo__h42399 = { 2'd0, f_rd_addr$D_OUT[34:29] } ;
  assign bytelane_lo__h44346 =
	     (axi4_to_ld_rg_bytelane_slice_lo <= bytelane_lo__h42399) ?
	       bytelane_lo__h42399 :
	       axi4_to_ld_rg_bytelane_slice_lo ;
  assign bytelane_lo__h52935 =
	     _0_CONCAT_IF_f_wr_data_first__21_BIT_1_36_THEN__ETC___d955 ?
	       addr_bytelane__h52059 :
	       y__h54481 ;
  assign bytelane_lo__h60053 =
	     (axi4_to_st_rg_bytelane_slice_lo <= y__h61599) ?
	       y__h61599 :
	       axi4_to_st_rg_bytelane_slice_lo ;
  assign bytelane_slice_hi__h44327 = axi4_to_ld_rg_bytelane_slice_lo + 8'd7 ;
  assign bytelane_slice_hi__h60018 = axi4_to_st_rg_bytelane_slice_lo + 8'd7 ;
  assign bytes_processed__h42786 =
	     (x__h42568 == 8'd0 || f_rd_addr$D_OUT[29]) ?
	       8'd1 :
	       y_avValue_snd__h42779 ;
  assign bytes_processed__h44683 =
	     (x__h44474 == 8'd0 || bytelane_lo__h44346[0]) ?
	       8'd1 :
	       y_avValue_snd__h44676 ;
  assign bytes_processed__h45231 =
	     (x__h45020 == 8'd0 || axi4_to_ld_rg_bytelane_lo[0]) ?
	       8'd1 :
	       y_avValue_snd__h45224 ;
  assign bytes_processed__h55567 =
	     (x__h55337 == 8'd0 || bytelane_lo__h52935[0]) ?
	       8'd1 :
	       y_avValue_snd_fst__h55989 ;
  assign bytes_processed__h62638 =
	     (x__h62417 == 8'd0 || bytelane_lo__h60053[0]) ?
	       8'd1 :
	       y_avValue_snd_fst__h62665 ;
  assign bytes_processed__h66091 =
	     (x__h65868 == 8'd0 || axi4_to_st_rg_bytelane_lo[0]) ?
	       8'd1 :
	       y_avValue_snd_fst__h66118 ;
  assign f_rd_addrD_OUT_BITS_92_TO_29_AND_mask3380__q3 =
	     f_rd_addr$D_OUT[92:29] & mask__h43380 ;
  assign f_wr_addrD_OUT_BITS_92_TO_29_AND_mask6467__q4 =
	     f_wr_addr$D_OUT[92:29] & mask__h56467 ;
  assign f_wr_data_first__21_BITS_8_TO_1_34_EQ_0_35_OR__ETC___d957 =
	     f_wr_data$D_OUT[8:1] == 8'd0 ||
	     (_0_CONCAT_IF_f_wr_data_first__21_BIT_1_36_THEN__ETC___d955 ?
		f_wr_addr$EMPTY_N :
		f_wr_data$EMPTY_N) ;
  assign f_wr_data_first__21_BITS_8_TO_1_34_EQ_0_35_OR__ETC___d975 =
	     f_wr_data_first__21_BITS_8_TO_1_34_EQ_0_35_OR__ETC___d957 &&
	     (f_wr_data$D_OUT[8:1] == 8'd0 ||
	      _7_MINUS_0_CONCAT_IF_f_wr_data_first__21_BIT_8__ETC___d969) ||
	     axi4_to_st_f_reqs$FULL_N && axi4_to_st_f_st_rsp_info$FULL_N ;
  assign f_wr_data_first__21_BIT_0_22_AND_f_wr_addr_fir_ETC___d1001 =
	     f_wr_data$D_OUT[0] && f_wr_addr$D_OUT[28:21] == 8'd0 &&
	     _1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930 &&
	     f_wr_data$D_OUT[8:1] != 8'd0 &&
	     !_7_MINUS_0_CONCAT_IF_f_wr_data_first__21_BIT_8__ETC___d969 ;
  assign f_wr_data_first__21_BIT_0_22_AND_f_wr_addr_fir_ETC___d1066 =
	     f_wr_data$D_OUT[0] && f_wr_addr$D_OUT[28:21] == 8'd0 &&
	     _1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930 &&
	     (v__h52941 != 8'd0 ||
	      !_0_CONCAT_f_wr_addr_first__24_BITS_92_TO_29_89__ETC___d1063) ;
  assign line_addr__h2730 = { f_L2_to_L1_Reqs$D_OUT[65:8], 6'd0 } ;
  assign line_addr__h3158 = { f_reqs$D_OUT[668:611], 6'd0 } ;
  assign mask__h43380 = 64'hFFFFFFFFFFFFFFFF << x__h44141 ;
  assign mask__h56467 = 64'hFFFFFFFFFFFFFFFF << x__h57228 ;
  assign new_data___1__h23293 =
	     { f_reqs$D_OUT[575] ? f_reqs$D_OUT[511:504] : v__h22217[511:504],
	       f_reqs$D_OUT[574] ? f_reqs$D_OUT[503:496] : v__h22217[503:496],
	       f_reqs$D_OUT[573] ? f_reqs$D_OUT[495:488] : v__h22217[495:488],
	       f_reqs$D_OUT[572] ? f_reqs$D_OUT[487:480] : v__h22217[487:480],
	       f_reqs$D_OUT[571] ? f_reqs$D_OUT[479:472] : v__h22217[479:472],
	       f_reqs$D_OUT[570] ? f_reqs$D_OUT[471:464] : v__h22217[471:464],
	       f_reqs$D_OUT[569] ? f_reqs$D_OUT[463:456] : v__h22217[463:456],
	       f_reqs$D_OUT[568] ? f_reqs$D_OUT[455:448] : v__h22217[455:448],
	       f_reqs$D_OUT[567] ? f_reqs$D_OUT[447:440] : v__h22217[447:440],
	       f_reqs$D_OUT[566] ? f_reqs$D_OUT[439:432] : v__h22217[439:432],
	       f_reqs$D_OUT[565] ? f_reqs$D_OUT[431:424] : v__h22217[431:424],
	       f_reqs$D_OUT[564] ? f_reqs$D_OUT[423:416] : v__h22217[423:416],
	       f_reqs$D_OUT[563] ? f_reqs$D_OUT[415:408] : v__h22217[415:408],
	       f_reqs$D_OUT[562] ? f_reqs$D_OUT[407:400] : v__h22217[407:400],
	       f_reqs$D_OUT[561] ? f_reqs$D_OUT[399:392] : v__h22217[399:392],
	       f_reqs$D_OUT[560] ? f_reqs$D_OUT[391:384] : v__h22217[391:384],
	       f_reqs$D_OUT[559] ? f_reqs$D_OUT[383:376] : v__h22217[383:376],
	       f_reqs$D_OUT[558] ? f_reqs$D_OUT[375:368] : v__h22217[375:368],
	       f_reqs$D_OUT[557] ? f_reqs$D_OUT[367:360] : v__h22217[367:360],
	       f_reqs$D_OUT[556] ? f_reqs$D_OUT[359:352] : v__h22217[359:352],
	       f_reqs$D_OUT[555] ? f_reqs$D_OUT[351:344] : v__h22217[351:344],
	       f_reqs$D_OUT[554] ? f_reqs$D_OUT[343:336] : v__h22217[343:336],
	       f_reqs$D_OUT[553] ? f_reqs$D_OUT[335:328] : v__h22217[335:328],
	       f_reqs$D_OUT[552] ? f_reqs$D_OUT[327:320] : v__h22217[327:320],
	       f_reqs$D_OUT[551] ? f_reqs$D_OUT[319:312] : v__h22217[319:312],
	       f_reqs$D_OUT[550] ? f_reqs$D_OUT[311:304] : v__h22217[311:304],
	       f_reqs$D_OUT[549] ? f_reqs$D_OUT[303:296] : v__h22217[303:296],
	       f_reqs$D_OUT[548] ? f_reqs$D_OUT[295:288] : v__h22217[295:288],
	       f_reqs$D_OUT[547] ? f_reqs$D_OUT[287:280] : v__h22217[287:280],
	       f_reqs$D_OUT[546] ? f_reqs$D_OUT[279:272] : v__h22217[279:272],
	       f_reqs$D_OUT[545] ? f_reqs$D_OUT[271:264] : v__h22217[271:264],
	       f_reqs$D_OUT[544] ? f_reqs$D_OUT[263:256] : v__h22217[263:256],
	       f_reqs$D_OUT[543] ? f_reqs$D_OUT[255:248] : v__h22217[255:248],
	       f_reqs$D_OUT[542] ? f_reqs$D_OUT[247:240] : v__h22217[247:240],
	       f_reqs$D_OUT[541] ? f_reqs$D_OUT[239:232] : v__h22217[239:232],
	       f_reqs$D_OUT[540] ? f_reqs$D_OUT[231:224] : v__h22217[231:224],
	       f_reqs$D_OUT[539] ? f_reqs$D_OUT[223:216] : v__h22217[223:216],
	       f_reqs$D_OUT[538] ? f_reqs$D_OUT[215:208] : v__h22217[215:208],
	       f_reqs$D_OUT[537] ? f_reqs$D_OUT[207:200] : v__h22217[207:200],
	       f_reqs$D_OUT[536] ? f_reqs$D_OUT[199:192] : v__h22217[199:192],
	       f_reqs$D_OUT[535] ? f_reqs$D_OUT[191:184] : v__h22217[191:184],
	       f_reqs$D_OUT[534] ? f_reqs$D_OUT[183:176] : v__h22217[183:176],
	       f_reqs$D_OUT[533] ? f_reqs$D_OUT[175:168] : v__h22217[175:168],
	       f_reqs$D_OUT[532] ? f_reqs$D_OUT[167:160] : v__h22217[167:160],
	       f_reqs$D_OUT[531] ? f_reqs$D_OUT[159:152] : v__h22217[159:152],
	       f_reqs$D_OUT[530] ? f_reqs$D_OUT[151:144] : v__h22217[151:144],
	       f_reqs$D_OUT[529] ? f_reqs$D_OUT[143:136] : v__h22217[143:136],
	       f_reqs$D_OUT[528] ? f_reqs$D_OUT[135:128] : v__h22217[135:128],
	       f_reqs$D_OUT[527] ? f_reqs$D_OUT[127:120] : v__h22217[127:120],
	       f_reqs$D_OUT[526] ? f_reqs$D_OUT[119:112] : v__h22217[119:112],
	       f_reqs$D_OUT[525] ? f_reqs$D_OUT[111:104] : v__h22217[111:104],
	       f_reqs$D_OUT[524] ? f_reqs$D_OUT[103:96] : v__h22217[103:96],
	       f_reqs$D_OUT[523] ? f_reqs$D_OUT[95:88] : v__h22217[95:88],
	       f_reqs$D_OUT[522] ? f_reqs$D_OUT[87:80] : v__h22217[87:80],
	       f_reqs$D_OUT[521] ? f_reqs$D_OUT[79:72] : v__h22217[79:72],
	       f_reqs$D_OUT[520] ? f_reqs$D_OUT[71:64] : v__h22217[71:64],
	       f_reqs$D_OUT[519] ? f_reqs$D_OUT[63:56] : v__h22217[63:56],
	       f_reqs$D_OUT[518] ? f_reqs$D_OUT[55:48] : v__h22217[55:48],
	       f_reqs$D_OUT[517] ? f_reqs$D_OUT[47:40] : v__h22217[47:40],
	       f_reqs$D_OUT[516] ? f_reqs$D_OUT[39:32] : v__h22217[39:32],
	       f_reqs$D_OUT[515] ? f_reqs$D_OUT[31:24] : v__h22217[31:24],
	       f_reqs$D_OUT[514] ? f_reqs$D_OUT[23:16] : v__h22217[23:16],
	       f_reqs$D_OUT[513] ? f_reqs$D_OUT[15:8] : v__h22217[15:8],
	       f_reqs$D_OUT[512] ? f_reqs$D_OUT[7:0] : v__h22217[7:0] } ;
  assign new_data___1__h4300 =
	     { f_reqs$D_OUT[575] ?
		 f_reqs$D_OUT[511:504] :
		 rf_data_sets$D_OUT_1[511:504],
	       f_reqs$D_OUT[574] ?
		 f_reqs$D_OUT[503:496] :
		 rf_data_sets$D_OUT_1[503:496],
	       f_reqs$D_OUT[573] ?
		 f_reqs$D_OUT[495:488] :
		 rf_data_sets$D_OUT_1[495:488],
	       f_reqs$D_OUT[572] ?
		 f_reqs$D_OUT[487:480] :
		 rf_data_sets$D_OUT_1[487:480],
	       f_reqs$D_OUT[571] ?
		 f_reqs$D_OUT[479:472] :
		 rf_data_sets$D_OUT_1[479:472],
	       f_reqs$D_OUT[570] ?
		 f_reqs$D_OUT[471:464] :
		 rf_data_sets$D_OUT_1[471:464],
	       f_reqs$D_OUT[569] ?
		 f_reqs$D_OUT[463:456] :
		 rf_data_sets$D_OUT_1[463:456],
	       f_reqs$D_OUT[568] ?
		 f_reqs$D_OUT[455:448] :
		 rf_data_sets$D_OUT_1[455:448],
	       f_reqs$D_OUT[567] ?
		 f_reqs$D_OUT[447:440] :
		 rf_data_sets$D_OUT_1[447:440],
	       f_reqs$D_OUT[566] ?
		 f_reqs$D_OUT[439:432] :
		 rf_data_sets$D_OUT_1[439:432],
	       f_reqs$D_OUT[565] ?
		 f_reqs$D_OUT[431:424] :
		 rf_data_sets$D_OUT_1[431:424],
	       f_reqs$D_OUT[564] ?
		 f_reqs$D_OUT[423:416] :
		 rf_data_sets$D_OUT_1[423:416],
	       f_reqs$D_OUT[563] ?
		 f_reqs$D_OUT[415:408] :
		 rf_data_sets$D_OUT_1[415:408],
	       f_reqs$D_OUT[562] ?
		 f_reqs$D_OUT[407:400] :
		 rf_data_sets$D_OUT_1[407:400],
	       f_reqs$D_OUT[561] ?
		 f_reqs$D_OUT[399:392] :
		 rf_data_sets$D_OUT_1[399:392],
	       f_reqs$D_OUT[560] ?
		 f_reqs$D_OUT[391:384] :
		 rf_data_sets$D_OUT_1[391:384],
	       f_reqs$D_OUT[559] ?
		 f_reqs$D_OUT[383:376] :
		 rf_data_sets$D_OUT_1[383:376],
	       f_reqs$D_OUT[558] ?
		 f_reqs$D_OUT[375:368] :
		 rf_data_sets$D_OUT_1[375:368],
	       f_reqs$D_OUT[557] ?
		 f_reqs$D_OUT[367:360] :
		 rf_data_sets$D_OUT_1[367:360],
	       f_reqs$D_OUT[556] ?
		 f_reqs$D_OUT[359:352] :
		 rf_data_sets$D_OUT_1[359:352],
	       f_reqs$D_OUT[555] ?
		 f_reqs$D_OUT[351:344] :
		 rf_data_sets$D_OUT_1[351:344],
	       f_reqs$D_OUT[554] ?
		 f_reqs$D_OUT[343:336] :
		 rf_data_sets$D_OUT_1[343:336],
	       f_reqs$D_OUT[553] ?
		 f_reqs$D_OUT[335:328] :
		 rf_data_sets$D_OUT_1[335:328],
	       f_reqs$D_OUT[552] ?
		 f_reqs$D_OUT[327:320] :
		 rf_data_sets$D_OUT_1[327:320],
	       f_reqs$D_OUT[551] ?
		 f_reqs$D_OUT[319:312] :
		 rf_data_sets$D_OUT_1[319:312],
	       f_reqs$D_OUT[550] ?
		 f_reqs$D_OUT[311:304] :
		 rf_data_sets$D_OUT_1[311:304],
	       f_reqs$D_OUT[549] ?
		 f_reqs$D_OUT[303:296] :
		 rf_data_sets$D_OUT_1[303:296],
	       f_reqs$D_OUT[548] ?
		 f_reqs$D_OUT[295:288] :
		 rf_data_sets$D_OUT_1[295:288],
	       f_reqs$D_OUT[547] ?
		 f_reqs$D_OUT[287:280] :
		 rf_data_sets$D_OUT_1[287:280],
	       f_reqs$D_OUT[546] ?
		 f_reqs$D_OUT[279:272] :
		 rf_data_sets$D_OUT_1[279:272],
	       f_reqs$D_OUT[545] ?
		 f_reqs$D_OUT[271:264] :
		 rf_data_sets$D_OUT_1[271:264],
	       f_reqs$D_OUT[544] ?
		 f_reqs$D_OUT[263:256] :
		 rf_data_sets$D_OUT_1[263:256],
	       f_reqs$D_OUT[543] ?
		 f_reqs$D_OUT[255:248] :
		 rf_data_sets$D_OUT_1[255:248],
	       f_reqs$D_OUT[542] ?
		 f_reqs$D_OUT[247:240] :
		 rf_data_sets$D_OUT_1[247:240],
	       f_reqs$D_OUT[541] ?
		 f_reqs$D_OUT[239:232] :
		 rf_data_sets$D_OUT_1[239:232],
	       f_reqs$D_OUT[540] ?
		 f_reqs$D_OUT[231:224] :
		 rf_data_sets$D_OUT_1[231:224],
	       f_reqs$D_OUT[539] ?
		 f_reqs$D_OUT[223:216] :
		 rf_data_sets$D_OUT_1[223:216],
	       f_reqs$D_OUT[538] ?
		 f_reqs$D_OUT[215:208] :
		 rf_data_sets$D_OUT_1[215:208],
	       f_reqs$D_OUT[537] ?
		 f_reqs$D_OUT[207:200] :
		 rf_data_sets$D_OUT_1[207:200],
	       f_reqs$D_OUT[536] ?
		 f_reqs$D_OUT[199:192] :
		 rf_data_sets$D_OUT_1[199:192],
	       f_reqs$D_OUT[535] ?
		 f_reqs$D_OUT[191:184] :
		 rf_data_sets$D_OUT_1[191:184],
	       f_reqs$D_OUT[534] ?
		 f_reqs$D_OUT[183:176] :
		 rf_data_sets$D_OUT_1[183:176],
	       f_reqs$D_OUT[533] ?
		 f_reqs$D_OUT[175:168] :
		 rf_data_sets$D_OUT_1[175:168],
	       f_reqs$D_OUT[532] ?
		 f_reqs$D_OUT[167:160] :
		 rf_data_sets$D_OUT_1[167:160],
	       f_reqs$D_OUT[531] ?
		 f_reqs$D_OUT[159:152] :
		 rf_data_sets$D_OUT_1[159:152],
	       f_reqs$D_OUT[530] ?
		 f_reqs$D_OUT[151:144] :
		 rf_data_sets$D_OUT_1[151:144],
	       f_reqs$D_OUT[529] ?
		 f_reqs$D_OUT[143:136] :
		 rf_data_sets$D_OUT_1[143:136],
	       f_reqs$D_OUT[528] ?
		 f_reqs$D_OUT[135:128] :
		 rf_data_sets$D_OUT_1[135:128],
	       f_reqs$D_OUT[527] ?
		 f_reqs$D_OUT[127:120] :
		 rf_data_sets$D_OUT_1[127:120],
	       f_reqs$D_OUT[526] ?
		 f_reqs$D_OUT[119:112] :
		 rf_data_sets$D_OUT_1[119:112],
	       f_reqs$D_OUT[525] ?
		 f_reqs$D_OUT[111:104] :
		 rf_data_sets$D_OUT_1[111:104],
	       f_reqs$D_OUT[524] ?
		 f_reqs$D_OUT[103:96] :
		 rf_data_sets$D_OUT_1[103:96],
	       f_reqs$D_OUT[523] ?
		 f_reqs$D_OUT[95:88] :
		 rf_data_sets$D_OUT_1[95:88],
	       f_reqs$D_OUT[522] ?
		 f_reqs$D_OUT[87:80] :
		 rf_data_sets$D_OUT_1[87:80],
	       f_reqs$D_OUT[521] ?
		 f_reqs$D_OUT[79:72] :
		 rf_data_sets$D_OUT_1[79:72],
	       f_reqs$D_OUT[520] ?
		 f_reqs$D_OUT[71:64] :
		 rf_data_sets$D_OUT_1[71:64],
	       f_reqs$D_OUT[519] ?
		 f_reqs$D_OUT[63:56] :
		 rf_data_sets$D_OUT_1[63:56],
	       f_reqs$D_OUT[518] ?
		 f_reqs$D_OUT[55:48] :
		 rf_data_sets$D_OUT_1[55:48],
	       f_reqs$D_OUT[517] ?
		 f_reqs$D_OUT[47:40] :
		 rf_data_sets$D_OUT_1[47:40],
	       f_reqs$D_OUT[516] ?
		 f_reqs$D_OUT[39:32] :
		 rf_data_sets$D_OUT_1[39:32],
	       f_reqs$D_OUT[515] ?
		 f_reqs$D_OUT[31:24] :
		 rf_data_sets$D_OUT_1[31:24],
	       f_reqs$D_OUT[514] ?
		 f_reqs$D_OUT[23:16] :
		 rf_data_sets$D_OUT_1[23:16],
	       f_reqs$D_OUT[513] ?
		 f_reqs$D_OUT[15:8] :
		 rf_data_sets$D_OUT_1[15:8],
	       f_reqs$D_OUT[512] ?
		 f_reqs$D_OUT[7:0] :
		 rf_data_sets$D_OUT_1[7:0] } ;
  assign num_bytes__h42529 = x__h42568 + 8'd1 ;
  assign num_bytes__h44435 = x__h44474 + 8'd1 ;
  assign num_bytes__h44981 = x__h45020 + 8'd1 ;
  assign num_bytes__h55297 = x__h55337 + 8'd1 ;
  assign num_bytes__h62377 = x__h62417 + 8'd1 ;
  assign num_bytes__h65828 = x__h65868 + 8'd1 ;
  assign num_lsb_zero_bytes__h60039 = { 4'd0, x__h61600 } ;
  assign num_msb_zero_bytes__h52922 = { 4'd0, x__h53166 } ;
  assign num_msb_zero_bytes__h60040 = { 4'd0, x__h60276 } ;
  assign rd_data_S_rresp__h49842 =
	     (axi4_to_ld_f_axi_rsp_info$D_OUT[16] ||
	      axi4_to_ld_rg_cumulative_err) ?
	       2'b10 :
	       2'b0 ;
  assign rf_tag_sets_sub_f_L2_to_L1_Reqs_first__1_BITS__ETC___d77 =
	     rf_tag_sets$D_OUT_2[65:64] <= f_L2_to_L1_Reqs$D_OUT[1:0] ;
  assign rf_tag_sets_sub_f_L2_to_L1_Reqs_first__1_BITS__ETC___d82 =
	     rf_tag_sets$D_OUT_2[63:0] == line_addr__h2730 ;
  assign rf_tag_sets_sub_f_reqs_first__05_BITS_616_TO_6_ETC___d114 =
	     rf_tag_sets$D_OUT_1[63:0] == line_addr__h3158 ;
  assign rg_state_EQ_1_01_AND_NOT_f_L2_to_L1_Reqs_notEm_ETC___d438 =
	     rg_state == 2'd1 && !f_L2_to_L1_Reqs$EMPTY_N &&
	     (rf_tag_sets$D_OUT_1[65:64] == 2'd0 ||
	      rf_tag_sets_sub_f_reqs_first__05_BITS_616_TO_6_ETC___d114 &&
	      f_reqs$D_OUT[685] &&
	      rf_tag_sets$D_OUT_1[65:64] == 2'd1) ;
  assign shifted_slice__h55312 = f_wr_data$D_OUT[128:65] >> x__h56212 ;
  assign shifted_slice__h62392 = axi4_to_st_rg_v_slice[63:0] >> x__h62883 ;
  assign shifted_slice__h65843 = axi4_to_st_rg_slice >> x__h66125 ;
  assign slice__h45713 =
	     axi4_to_ld_f_rsps$D_OUT[63:0] <<
	     { axi4_to_ld_f_ld_rsp_info$D_OUT[4:0], 3'd0 } ;
  assign szwindow_bytelane_hi__h41816 =
	     szwindow_bytelane_lo__h41815 + y__h43356 ;
  assign szwindow_bytelane_hi__h52063 =
	     szwindow_bytelane_lo__h52062 + y__h56443 ;
  assign szwindow_bytelane_lo__h41815 =
	     { 2'd0, f_rd_addrD_OUT_BITS_92_TO_29_AND_mask3380__q3[5:0] } ;
  assign szwindow_bytelane_lo__h52062 =
	     { 2'd0, f_wr_addrD_OUT_BITS_92_TO_29_AND_mask6467__q4[5:0] } ;
  assign v__h22217 =
	     f_L2_to_L1_Rsps$D_OUT[512] ?
	       f_L2_to_L1_Rsps$D_OUT[511:0] :
	       rf_data_sets$D_OUT_1 ;
  assign v__h42404 =
	     _0_CONCAT_f_rd_addr_first__62_BITS_34_TO_29_72__ETC___d674 ?
	       v__h42504 :
	       8'd0 ;
  assign v__h42504 = num_bytes__h42529 - bytes_processed__h42786 ;
  assign v__h44351 =
	     axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_U_ETC___d758 ?
	       8'd0 :
	       v__h44413 ;
  assign v__h44413 = num_bytes__h44435 - bytes_processed__h44683 ;
  assign v__h44974 = num_bytes__h44981 - bytes_processed__h45231 ;
  assign v__h52941 =
	     (f_wr_data$D_OUT[8:1] == 8'd0 ||
	      _7_MINUS_0_CONCAT_IF_f_wr_data_first__21_BIT_8__ETC___d969) ?
	       8'd0 :
	       v__h55273 ;
  assign v__h55273 = num_bytes__h55297 - bytes_processed__h55567 ;
  assign v__h60059 =
	     (axi4_to_st_rg_v_strb[7:0] == 8'd0 ||
	      axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1113) ?
	       8'd0 :
	       v__h62356 ;
  assign v__h62356 = num_bytes__h62377 - bytes_processed__h62638 ;
  assign v__h65821 = num_bytes__h65828 - bytes_processed__h66091 ;
  assign x__h42568 = 8'd7 - bytelane_lo__h42399 ;
  assign x__h42811 =
	     (x__h42568 == 8'd0 || f_rd_addr$D_OUT[29]) ?
	       2'b0 :
	       y_avValue_fst__h42778 ;
  assign x__h44141 =
	     _1_SL_f_rd_addr_first__62_BITS_20_TO_18_66___d667[0] ?
	       4'd0 :
	       (_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66___d667[1] ?
		  4'd1 :
		  (_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66___d667[2] ?
		     4'd2 :
		     (_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66___d667[3] ?
			4'd3 :
			(_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66___d667[4] ?
			   4'd4 :
			   (_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66___d667[5] ?
			      4'd5 :
			      (_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66___d667[6] ?
				 4'd6 :
				 (_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66___d667[7] ?
				    4'd7 :
				    4'd8))))))) ;
  assign x__h44474 = bytelane_slice_hi__h44327 - bytelane_lo__h44346 ;
  assign x__h44699 =
	     (x__h44474 == 8'd0 || bytelane_lo__h44346[0]) ?
	       2'b0 :
	       y_avValue_fst__h44675 ;
  assign x__h44701 =
	     addr_axi_bus_lo__h41811 | { 56'd0, bytelane_lo__h44346 } ;
  assign x__h44726 = bytelane_lo__h44346 - axi4_to_ld_rg_bytelane_slice_lo ;
  assign x__h45020 = axi4_to_ld_rg_bytelane_hi - axi4_to_ld_rg_bytelane_lo ;
  assign x__h45247 =
	     (x__h45020 == 8'd0 || axi4_to_ld_rg_bytelane_lo[0]) ?
	       2'b0 :
	       y_avValue_fst__h45223 ;
  assign x__h45249 =
	     addr_axi_bus_lo__h41811 | { 56'd0, axi4_to_ld_rg_bytelane_lo } ;
  assign x__h45274 =
	     axi4_to_ld_rg_bytelane_lo - axi4_to_ld_rg_bytelane_slice_lo ;
  assign x__h53166 =
	     f_wr_data$D_OUT[8] ?
	       4'd0 :
	       (f_wr_data$D_OUT[7] ?
		  4'd1 :
		  (f_wr_data$D_OUT[6] ?
		     4'd2 :
		     (f_wr_data$D_OUT[5] ?
			4'd3 :
			(f_wr_data$D_OUT[4] ?
			   4'd4 :
			   (f_wr_data$D_OUT[3] ?
			      4'd5 :
			      (f_wr_data$D_OUT[2] ?
				 4'd6 :
				 (f_wr_data$D_OUT[1] ? 4'd7 : 4'd8))))))) ;
  assign x__h54490 =
	     f_wr_data$D_OUT[1] ?
	       4'd0 :
	       (f_wr_data$D_OUT[2] ?
		  4'd1 :
		  (f_wr_data$D_OUT[3] ?
		     4'd2 :
		     (f_wr_data$D_OUT[4] ?
			4'd3 :
			(f_wr_data$D_OUT[5] ?
			   4'd4 :
			   (f_wr_data$D_OUT[6] ?
			      4'd5 :
			      (f_wr_data$D_OUT[7] ?
				 4'd6 :
				 (f_wr_data$D_OUT[8] ? 4'd7 : 4'd8))))))) ;
  assign x__h55337 = bytelane_hi__h52936 - bytelane_lo__h52935 ;
  assign x__h55592 =
	     (x__h55337 == 8'd0 || bytelane_lo__h52935[0]) ?
	       2'b0 :
	       y_avValue_fst__h55558 ;
  assign x__h55604 =
	     addr_axi_bus_lo__h52058 | { 56'd0, bytelane_lo__h52935 } ;
  assign x__h55986 =
	     (x__h55337 == 8'd0 || bytelane_lo__h52935[0]) ?
	       y_avValue_snd_snd__h55988 :
	       y_avValue_snd_snd__h55990 ;
  assign x__h56212 = { bytelane_lo__h52935[4:0], 3'd0 } ;
  assign x__h57228 =
	     _1_SL_f_wr_addr_first__24_BITS_20_TO_18_28___d929[0] ?
	       4'd0 :
	       (_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28___d929[1] ?
		  4'd1 :
		  (_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28___d929[2] ?
		     4'd2 :
		     (_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28___d929[3] ?
			4'd3 :
			(_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28___d929[4] ?
			   4'd4 :
			   (_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28___d929[5] ?
			      4'd5 :
			      (_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28___d929[6] ?
				 4'd6 :
				 (_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28___d929[7] ?
				    4'd7 :
				    4'd8))))))) ;
  assign x__h60276 =
	     axi4_to_st_rg_v_strb[7] ?
	       4'd0 :
	       (axi4_to_st_rg_v_strb[6] ?
		  4'd1 :
		  (axi4_to_st_rg_v_strb[5] ?
		     4'd2 :
		     (axi4_to_st_rg_v_strb[4] ?
			4'd3 :
			(axi4_to_st_rg_v_strb[3] ?
			   4'd4 :
			   (axi4_to_st_rg_v_strb[2] ?
			      4'd5 :
			      (axi4_to_st_rg_v_strb[1] ?
				 4'd6 :
				 (axi4_to_st_rg_v_strb[0] ?
				    4'd7 :
				    4'd8))))))) ;
  assign x__h61600 =
	     axi4_to_st_rg_v_strb[0] ?
	       4'd0 :
	       (axi4_to_st_rg_v_strb[1] ?
		  4'd1 :
		  (axi4_to_st_rg_v_strb[2] ?
		     4'd2 :
		     (axi4_to_st_rg_v_strb[3] ?
			4'd3 :
			(axi4_to_st_rg_v_strb[4] ?
			   4'd4 :
			   (axi4_to_st_rg_v_strb[5] ?
			      4'd5 :
			      (axi4_to_st_rg_v_strb[6] ?
				 4'd6 :
				 (axi4_to_st_rg_v_strb[7] ?
				    4'd7 :
				    4'd8))))))) ;
  assign x__h62417 = bytelane_hi__h60054 - bytelane_lo__h60053 ;
  assign x__h62654 =
	     (x__h62417 == 8'd0 || bytelane_lo__h60053[0]) ?
	       2'b0 :
	       y_avValue_fst__h62629 ;
  assign x__h62659 =
	     addr_axi_bus_lo__h52058 | { 56'd0, bytelane_lo__h60053 } ;
  assign x__h62662 =
	     (x__h62417 == 8'd0 || bytelane_lo__h60053[0]) ?
	       y_avValue_snd_snd__h62664 :
	       y_avValue_snd_snd__h62666 ;
  assign x__h62883 =
	     { bytelane_lo0053_MINUS_axi4_to_st_rg_bytelane_s_ETC__q1[4:0],
	       3'd0 } ;
  assign x__h65868 = axi4_to_st_rg_bytelane_hi - axi4_to_st_rg_bytelane_lo ;
  assign x__h66107 =
	     (x__h65868 == 8'd0 || axi4_to_st_rg_bytelane_lo[0]) ?
	       2'b0 :
	       y_avValue_fst__h66082 ;
  assign x__h66112 =
	     addr_axi_bus_lo__h52058 | { 56'd0, axi4_to_st_rg_bytelane_lo } ;
  assign x__h66115 =
	     (x__h65868 == 8'd0 || axi4_to_st_rg_bytelane_lo[0]) ?
	       y_avValue_snd_snd__h66117 :
	       y_avValue_snd_snd__h66119 ;
  assign x__h66125 =
	     { axi4_to_st_rg_bytelane_lo_MINUS_axi4_to_st_rg__ETC__q2[4:0],
	       3'd0 } ;
  assign y__h43356 =
	     _1_SL_f_rd_addr_first__62_BITS_20_TO_18_66___d667 - 8'd1 ;
  assign y__h54481 = { 4'd0, x__h54490 } ;
  assign y__h56443 =
	     _1_SL_f_wr_addr_first__24_BITS_20_TO_18_28___d929 - 8'd1 ;
  assign y__h61591 =
	     axi4_to_st_rg_bytelane_slice_lo + num_lsb_zero_bytes__h60039 ;
  assign y__h61599 =
	     (y__h61591 <= addr_bytelane__h52059) ?
	       addr_bytelane__h52059 :
	       y__h61591 ;
  assign y_avValue_fst__h42762 =
	     _7_MINUS_0_CONCAT_f_rd_addr_first__62_BITS_34_T_ETC___d711 ?
	       2'b10 :
	       2'b11 ;
  assign y_avValue_fst__h42778 =
	     (num_bytes__h42529 < 8'd4 || f_rd_addr$D_OUT[30:29] == 2'b10) ?
	       2'b01 :
	       y_avValue_fst__h42762 ;
  assign y_avValue_fst__h44659 =
	     axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_M_ETC___d777 ?
	       2'b10 :
	       2'b11 ;
  assign y_avValue_fst__h44675 =
	     (num_bytes__h44435 < 8'd4 || bytelane_lo__h44346[1:0] == 2'b10) ?
	       2'b01 :
	       y_avValue_fst__h44659 ;
  assign y_avValue_fst__h45207 =
	     axi4_to_ld_rg_bytelane_hi_02_MINUS_axi4_to_ld__ETC___d813 ?
	       2'b10 :
	       2'b11 ;
  assign y_avValue_fst__h45223 =
	     (num_bytes__h44981 < 8'd4 ||
	      axi4_to_ld_rg_bytelane_lo[1:0] == 2'b10) ?
	       2'b01 :
	       y_avValue_fst__h45207 ;
  assign y_avValue_fst__h55540 =
	     _7_MINUS_0_CONCAT_IF_f_wr_data_first__21_BIT_8__ETC___d1011 ?
	       2'b10 :
	       2'b11 ;
  assign y_avValue_fst__h55558 =
	     (num_bytes__h55297 < 8'd4 || bytelane_lo__h52935[1:0] == 2'b10) ?
	       2'b01 :
	       y_avValue_fst__h55540 ;
  assign y_avValue_fst__h62611 =
	     axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1129 ?
	       2'b10 :
	       2'b11 ;
  assign y_avValue_fst__h62629 =
	     (num_bytes__h62377 < 8'd4 || bytelane_lo__h60053[1:0] == 2'b10) ?
	       2'b01 :
	       y_avValue_fst__h62611 ;
  assign y_avValue_fst__h66064 =
	     axi4_to_st_rg_bytelane_hi_176_MINUS_axi4_to_st_ETC___d1187 ?
	       2'b10 :
	       2'b11 ;
  assign y_avValue_fst__h66082 =
	     (num_bytes__h65828 < 8'd4 ||
	      axi4_to_st_rg_bytelane_lo[1:0] == 2'b10) ?
	       2'b01 :
	       y_avValue_fst__h66064 ;
  assign y_avValue_snd__h42763 =
	     _7_MINUS_0_CONCAT_f_rd_addr_first__62_BITS_34_T_ETC___d711 ?
	       8'd4 :
	       8'd8 ;
  assign y_avValue_snd__h42779 =
	     (num_bytes__h42529 < 8'd4 || f_rd_addr$D_OUT[30:29] == 2'b10) ?
	       8'd2 :
	       y_avValue_snd__h42763 ;
  assign y_avValue_snd__h44660 =
	     axi4_to_ld_rg_bytelane_slice_lo_54_PLUS_7_55_M_ETC___d777 ?
	       8'd4 :
	       8'd8 ;
  assign y_avValue_snd__h44676 =
	     (num_bytes__h44435 < 8'd4 || bytelane_lo__h44346[1:0] == 2'b10) ?
	       8'd2 :
	       y_avValue_snd__h44660 ;
  assign y_avValue_snd__h45208 =
	     axi4_to_ld_rg_bytelane_hi_02_MINUS_axi4_to_ld__ETC___d813 ?
	       8'd4 :
	       8'd8 ;
  assign y_avValue_snd__h45224 =
	     (num_bytes__h44981 < 8'd4 ||
	      axi4_to_ld_rg_bytelane_lo[1:0] == 2'b10) ?
	       8'd2 :
	       y_avValue_snd__h45208 ;
  assign y_avValue_snd_fst__h55989 =
	     (num_bytes__h55297 < 8'd4 || bytelane_lo__h52935[1:0] == 2'b10) ?
	       8'd2 :
	       y_avValue_snd_fst__h56238 ;
  assign y_avValue_snd_fst__h56238 =
	     _7_MINUS_0_CONCAT_IF_f_wr_data_first__21_BIT_8__ETC___d1011 ?
	       8'd4 :
	       8'd8 ;
  assign y_avValue_snd_fst__h62665 =
	     (num_bytes__h62377 < 8'd4 || bytelane_lo__h60053[1:0] == 2'b10) ?
	       8'd2 :
	       y_avValue_snd_fst__h62909 ;
  assign y_avValue_snd_fst__h62909 =
	     axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1129 ?
	       8'd4 :
	       8'd8 ;
  assign y_avValue_snd_fst__h66118 =
	     (num_bytes__h65828 < 8'd4 ||
	      axi4_to_st_rg_bytelane_lo[1:0] == 2'b10) ?
	       8'd2 :
	       y_avValue_snd_fst__h66151 ;
  assign y_avValue_snd_fst__h66151 =
	     axi4_to_st_rg_bytelane_hi_176_MINUS_axi4_to_st_ETC___d1187 ?
	       8'd4 :
	       8'd8 ;
  assign y_avValue_snd_snd__h55988 = { 56'd0, shifted_slice__h55312[7:0] } ;
  assign y_avValue_snd_snd__h55990 =
	     (num_bytes__h55297 < 8'd4 || bytelane_lo__h52935[1:0] == 2'b10) ?
	       y_avValue_snd_snd__h56237 :
	       y_avValue_snd_snd__h56239 ;
  assign y_avValue_snd_snd__h56237 = { 48'd0, shifted_slice__h55312[15:0] } ;
  assign y_avValue_snd_snd__h56239 =
	     _7_MINUS_0_CONCAT_IF_f_wr_data_first__21_BIT_8__ETC___d1011 ?
	       y_avValue_snd_snd__h56244 :
	       shifted_slice__h55312 ;
  assign y_avValue_snd_snd__h56244 = { 32'd0, shifted_slice__h55312[31:0] } ;
  assign y_avValue_snd_snd__h62664 = { 56'd0, shifted_slice__h62392[7:0] } ;
  assign y_avValue_snd_snd__h62666 =
	     (num_bytes__h62377 < 8'd4 || bytelane_lo__h60053[1:0] == 2'b10) ?
	       y_avValue_snd_snd__h62908 :
	       y_avValue_snd_snd__h62910 ;
  assign y_avValue_snd_snd__h62908 = { 48'd0, shifted_slice__h62392[15:0] } ;
  assign y_avValue_snd_snd__h62910 =
	     axi4_to_st_rg_bytelane_slice_lo_079_PLUS_7_080_ETC___d1129 ?
	       y_avValue_snd_snd__h62915 :
	       shifted_slice__h62392 ;
  assign y_avValue_snd_snd__h62915 = { 32'd0, shifted_slice__h62392[31:0] } ;
  assign y_avValue_snd_snd__h66117 = { 56'd0, shifted_slice__h65843[7:0] } ;
  assign y_avValue_snd_snd__h66119 =
	     (num_bytes__h65828 < 8'd4 ||
	      axi4_to_st_rg_bytelane_lo[1:0] == 2'b10) ?
	       y_avValue_snd_snd__h66150 :
	       y_avValue_snd_snd__h66152 ;
  assign y_avValue_snd_snd__h66150 = { 48'd0, shifted_slice__h65843[15:0] } ;
  assign y_avValue_snd_snd__h66152 =
	     axi4_to_st_rg_bytelane_hi_176_MINUS_axi4_to_st_ETC___d1187 ?
	       y_avValue_snd_snd__h66157 :
	       shifted_slice__h65843 ;
  assign y_avValue_snd_snd__h66157 = { 32'd0, shifted_slice__h65843[31:0] } ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        axi4_to_ld_rg_cumulative_err <= `BSV_ASSIGNMENT_DELAY 1'd0;
	axi4_to_ld_rg_remaining_slices <= `BSV_ASSIGNMENT_DELAY 4'd8;
	axi4_to_ld_rg_state <= `BSV_ASSIGNMENT_DELAY 3'd0;
	axi4_to_st_rg_cumulative_err <= `BSV_ASSIGNMENT_DELAY 1'd0;
	axi4_to_st_rg_state <= `BSV_ASSIGNMENT_DELAY 3'd0;
	rg_init_index <= `BSV_ASSIGNMENT_DELAY 6'd0;
	rg_state <= `BSV_ASSIGNMENT_DELAY 2'd0;
      end
    else
      begin
        if (axi4_to_ld_rg_cumulative_err$EN)
	  axi4_to_ld_rg_cumulative_err <= `BSV_ASSIGNMENT_DELAY
	      axi4_to_ld_rg_cumulative_err$D_IN;
	if (axi4_to_ld_rg_remaining_slices$EN)
	  axi4_to_ld_rg_remaining_slices <= `BSV_ASSIGNMENT_DELAY
	      axi4_to_ld_rg_remaining_slices$D_IN;
	if (axi4_to_ld_rg_state$EN)
	  axi4_to_ld_rg_state <= `BSV_ASSIGNMENT_DELAY
	      axi4_to_ld_rg_state$D_IN;
	if (axi4_to_st_rg_cumulative_err$EN)
	  axi4_to_st_rg_cumulative_err <= `BSV_ASSIGNMENT_DELAY
	      axi4_to_st_rg_cumulative_err$D_IN;
	if (axi4_to_st_rg_state$EN)
	  axi4_to_st_rg_state <= `BSV_ASSIGNMENT_DELAY
	      axi4_to_st_rg_state$D_IN;
	if (rg_init_index$EN)
	  rg_init_index <= `BSV_ASSIGNMENT_DELAY rg_init_index$D_IN;
	if (rg_state$EN) rg_state <= `BSV_ASSIGNMENT_DELAY rg_state$D_IN;
      end
    if (axi4_to_ld_rg_bytelane_hi$EN)
      axi4_to_ld_rg_bytelane_hi <= `BSV_ASSIGNMENT_DELAY
	  axi4_to_ld_rg_bytelane_hi$D_IN;
    if (axi4_to_ld_rg_bytelane_lo$EN)
      axi4_to_ld_rg_bytelane_lo <= `BSV_ASSIGNMENT_DELAY
	  axi4_to_ld_rg_bytelane_lo$D_IN;
    if (axi4_to_ld_rg_bytelane_slice_lo$EN)
      axi4_to_ld_rg_bytelane_slice_lo <= `BSV_ASSIGNMENT_DELAY
	  axi4_to_ld_rg_bytelane_slice_lo$D_IN;
    if (axi4_to_ld_rg_slice$EN)
      axi4_to_ld_rg_slice <= `BSV_ASSIGNMENT_DELAY axi4_to_ld_rg_slice$D_IN;
    if (axi4_to_ld_rg_v_slice$EN)
      axi4_to_ld_rg_v_slice <= `BSV_ASSIGNMENT_DELAY
	  axi4_to_ld_rg_v_slice$D_IN;
    if (axi4_to_st_rg_bytelane_hi$EN)
      axi4_to_st_rg_bytelane_hi <= `BSV_ASSIGNMENT_DELAY
	  axi4_to_st_rg_bytelane_hi$D_IN;
    if (axi4_to_st_rg_bytelane_lo$EN)
      axi4_to_st_rg_bytelane_lo <= `BSV_ASSIGNMENT_DELAY
	  axi4_to_st_rg_bytelane_lo$D_IN;
    if (axi4_to_st_rg_bytelane_slice_lo$EN)
      axi4_to_st_rg_bytelane_slice_lo <= `BSV_ASSIGNMENT_DELAY
	  axi4_to_st_rg_bytelane_slice_lo$D_IN;
    if (axi4_to_st_rg_discard_count$EN)
      axi4_to_st_rg_discard_count <= `BSV_ASSIGNMENT_DELAY
	  axi4_to_st_rg_discard_count$D_IN;
    if (axi4_to_st_rg_slice$EN)
      axi4_to_st_rg_slice <= `BSV_ASSIGNMENT_DELAY axi4_to_st_rg_slice$D_IN;
    if (axi4_to_st_rg_v_slice$EN)
      axi4_to_st_rg_v_slice <= `BSV_ASSIGNMENT_DELAY
	  axi4_to_st_rg_v_slice$D_IN;
    if (axi4_to_st_rg_v_strb$EN)
      axi4_to_st_rg_v_strb <= `BSV_ASSIGNMENT_DELAY axi4_to_st_rg_v_strb$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    axi4_to_ld_rg_bytelane_hi = 8'hAA;
    axi4_to_ld_rg_bytelane_lo = 8'hAA;
    axi4_to_ld_rg_bytelane_slice_lo = 8'hAA;
    axi4_to_ld_rg_cumulative_err = 1'h0;
    axi4_to_ld_rg_remaining_slices = 4'hA;
    axi4_to_ld_rg_slice = 64'hAAAAAAAAAAAAAAAA;
    axi4_to_ld_rg_state = 3'h2;
    axi4_to_ld_rg_v_slice =
	512'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    axi4_to_st_rg_bytelane_hi = 8'hAA;
    axi4_to_st_rg_bytelane_lo = 8'hAA;
    axi4_to_st_rg_bytelane_slice_lo = 8'hAA;
    axi4_to_st_rg_cumulative_err = 1'h0;
    axi4_to_st_rg_discard_count = 8'hAA;
    axi4_to_st_rg_slice = 64'hAAAAAAAAAAAAAAAA;
    axi4_to_st_rg_state = 3'h2;
    axi4_to_st_rg_v_slice =
	512'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    axi4_to_st_rg_v_strb = 64'hAAAAAAAAAAAAAAAA;
    rg_init_index = 6'h2A;
    rg_state = 2'h2;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	begin
	  v__h1963 = $stime;
	  #0;
	end
    v__h1957 = v__h1963 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$display("%0d: ERROR: %m.rl_merge_rd_req: burst requests not supported",
		 v__h1957);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_rd_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_rd_req &&
	  axi4_s_xactor_f_rd_addr$D_OUT[28:21] != 8'd0)
	$finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	begin
	  v__h2441 = $stime;
	  #0;
	end
    v__h2435 = v__h2441 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$display("%0d: ERROR: %m.rl_merge_wr_req: burst requests not supported",
		 v__h2435);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_wr_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", axi4_s_xactor_f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_merge_wr_req &&
	  axi4_s_xactor_f_wr_addr$D_OUT[28:21] != 8'd0)
	$finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452)
	begin
	  v__h21995 = $stime;
	  #0;
	end
    v__h21989 = v__h21995 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452)
	$display("%0d: %m.rl_upgrade_rsp: ERROR: rsp is not for addr %0h",
		 v__h21989,
		 line_addr__h3158);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452)
	$write("L2_to_L1_Rsp { ", "addr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452)
	$write("'h%h", f_L2_to_L1_Rsps$D_OUT[578:515]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452)
	$write(", ", "to_state: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] != 2'd0 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] != 2'd1 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452)
	$write(", ", "m_cline: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452 &&
	  f_L2_to_L1_Rsps$D_OUT[512])
	$write("tagged Valid ", "'h%h", f_L2_to_L1_Rsps$D_OUT[511:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452 &&
	  !f_L2_to_L1_Rsps$D_OUT[512])
	$write("tagged Invalid ", "");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452)
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp &&
	  NOT_f_L2_to_L1_Rsps_first__49_BITS_578_TO_515__ETC___d452)
	$finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] != 2'd0)
	begin
	  v__h22278 = $stime;
	  #0;
	end
    v__h22272 = v__h22278 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] != 2'd0)
	$display("%0d: %m.rl_upgrade_rsp: ERROR: rsp has refill data for non-INVALID frame",
		 v__h22272);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] != 2'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] != 2'd0)
	$write("L2_to_L1_Rsp { ", "addr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] != 2'd0)
	$write("'h%h", f_L2_to_L1_Rsps$D_OUT[578:515]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] != 2'd0)
	$write(", ", "to_state: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] != 2'd0 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] != 2'd0 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] != 2'd0 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] != 2'd0 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] != 2'd0 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] != 2'd1 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] != 2'd0)
	$write(", ", "m_cline: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] != 2'd0)
	$write("tagged Valid ", "'h%h", f_L2_to_L1_Rsps$D_OUT[511:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] != 2'd0)
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] != 2'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] != 2'd0)
	$finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && !f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] == 2'd0)
	begin
	  v__h22510 = $stime;
	  #0;
	end
    v__h22504 = v__h22510 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && !f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] == 2'd0)
	$display("%0d: %m.rl_upgrade_rsp: ERROR: rsp has no data for INVALID frame",
		 v__h22504);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && !f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] == 2'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && !f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] == 2'd0)
	$write("L2_to_L1_Rsp { ", "addr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && !f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] == 2'd0)
	$write("'h%h", f_L2_to_L1_Rsps$D_OUT[578:515]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && !f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] == 2'd0)
	$write(", ", "to_state: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && !f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] == 2'd0 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] == 2'd0)
	$write("INVALID");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && !f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] == 2'd0 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] == 2'd1)
	$write("SHARED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && !f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] == 2'd0 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] == 2'd2)
	$write("EXCLUSIVE");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && !f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] == 2'd0 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] != 2'd0 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] != 2'd1 &&
	  f_L2_to_L1_Rsps$D_OUT[514:513] != 2'd2)
	$write("MODIFIED");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && !f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] == 2'd0)
	$write(", ", "m_cline: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && !f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] == 2'd0)
	$write("tagged Invalid ", "");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && !f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] == 2'd0)
	$write(" }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && !f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] == 2'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_upgrade_rsp && !f_L2_to_L1_Rsps$D_OUT[512] &&
	  rf_tag_sets$D_OUT_1[65:64] == 2'd0)
	$finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668)
	begin
	  v__h41979 = $stime;
	  #0;
	end
    v__h41973 = v__h41979 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668)
	$display("%0d: %m.AXI4_to_LD:rl_start_xaction ================",
		 v__h41973);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668)
	$display("  ERROR: illegal AXI4 request");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668)
	$display("    awsize 0x%0h bytes > axi data bus width 0x%0h bytes",
		 _1_SL_f_rd_addr_first__62_BITS_20_TO_18_66___d667,
		 $signed(32'd64));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  f_rd_addr$D_OUT[28:21] != 8'd0)
	begin
	  v__h42147 = $stime;
	  #0;
	end
    v__h42141 = v__h42147 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  f_rd_addr$D_OUT[28:21] != 8'd0)
	$display("%0d: %m.AXI4_to_LD:rl_start_xaction ================",
		 v__h42141);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  f_rd_addr$D_OUT[28:21] != 8'd0)
	$display("  ERROR: illegal AXI4 request");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  f_rd_addr$D_OUT[28:21] != 8'd0)
	$display("    arlen 0x%0h; only arlen 0 (1-beat bursts) supported",
		 f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write("  Discarding: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write("AXI4_Rd_Addr { ", "arid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write("'h%h", f_rd_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write(", ", "araddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write("'h%h", f_rd_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write(", ", "arlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write("'h%h", f_rd_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write(", ", "arsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write("'h%h", f_rd_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write(", ", "arburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write("'h%h", f_rd_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write(", ", "arlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write("'h%h", f_rd_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write(", ", "arcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write("'h%h", f_rd_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write(", ", "arprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write("'h%h", f_rd_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write(", ", "arqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write("'h%h", f_rd_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write(", ", "arregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write("'h%h", f_rd_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write(", ", "aruser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_ld_rl_start_xaction &&
	  (f_rd_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_rd_addr_first__62_BITS_20_TO_18_66_67_U_ETC___d668))
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930)
	begin
	  v__h52258 = $stime;
	  #0;
	end
    v__h52252 = v__h52258 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930)
	$display("%0d: %m.AXI4_to_ST:rl_start_xaction ================",
		 v__h52252);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930)
	$display("  ERROR: illegal AXI4 request");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930)
	$display("    awsize 0x%0h bytes > axi data bus width 0x%0h bytes",
		 _1_SL_f_wr_addr_first__24_BITS_20_TO_18_28___d929,
		 $signed(32'd64));
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  f_wr_addr$D_OUT[28:21] != 8'd0)
	begin
	  v__h52431 = $stime;
	  #0;
	end
    v__h52425 = v__h52431 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  f_wr_addr$D_OUT[28:21] != 8'd0)
	$display("%0d: %m.AXI4_to_ST:rl_start_xaction ================",
		 v__h52425);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  f_wr_addr$D_OUT[28:21] != 8'd0)
	$display("  ERROR: illegal AXI4 request");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  f_wr_addr$D_OUT[28:21] != 8'd0)
	$display("    awlen 0x%0h; only awlen 0 (1-beat bursts) supported",
		 f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction && !f_wr_data$D_OUT[0])
	begin
	  v__h52625 = $stime;
	  #0;
	end
    v__h52619 = v__h52625 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction && !f_wr_data$D_OUT[0])
	$display("%0d: %m.AXI4_to_ST:rl_start_xaction ================",
		 v__h52619);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction && !f_wr_data$D_OUT[0])
	$display("  ERROR: illegal AXI4 request");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction && !f_wr_data$D_OUT[0])
	$display("    wlast != 1; only 1-beat bursts supported");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write("  Discarding: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write("AXI4_Wr_Addr { ", "awid: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write("'h%h", f_wr_addr$D_OUT[108:93]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write(", ", "awaddr: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write("'h%h", f_wr_addr$D_OUT[92:29]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write(", ", "awlen: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write("'h%h", f_wr_addr$D_OUT[28:21]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write(", ", "awsize: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write("'h%h", f_wr_addr$D_OUT[20:18]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write(", ", "awburst: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write("'h%h", f_wr_addr$D_OUT[17:16]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write(", ", "awlock: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write("'h%h", f_wr_addr$D_OUT[15]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write(", ", "awcache: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write("'h%h", f_wr_addr$D_OUT[14:11]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write(", ", "awprot: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write("'h%h", f_wr_addr$D_OUT[10:8]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write(", ", "awqos: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write("'h%h", f_wr_addr$D_OUT[7:4]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write(", ", "awregion: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write("'h%h", f_wr_addr$D_OUT[3:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write(", ", "awuser: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write("'h%h", 1'd0, " }");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_axi4_to_st_rl_start_xaction &&
	  (!f_wr_data$D_OUT[0] || f_wr_addr$D_OUT[28:21] != 8'd0 ||
	   !_1_SL_f_wr_addr_first__24_BITS_20_TO_18_28_29_U_ETC___d930))
	$write("\n");
  end
  // synopsys translate_on
endmodule