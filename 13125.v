module
   cygraph cygraph_inst (
      // control signals
      .clk                 (clk_per),               // in
      .rst                 (reset_per),             // in
      .enable              (cygraph_enable),        // in
      .busy                (cygraph_busy),          // out
      .done                (cygraph_done),          // out
      // ae-to-ae signals
      .ae_id               (i_aeid),                // in
      .nxtae_rx_data       (nxtae_rx_data),         // in 32
      .nxtae_rx_vld        (nxtae_rx_vld),          // in
      .prvae_rx_data       (prvae_rx_data),         // in 32
      .prvae_rx_vld        (prvae_rx_vld),          // in
      .nxtae_tx_data       (nxtae_tx_data),         // out 32
      .nxtae_tx_vld        (nxtae_tx_vld),          // out
      .prvae_tx_data       (prvae_tx_data),         // out 32
      .prvae_tx_vld        (prvae_tx_vld),          // out
      // Graph Parameters
      .n_in                (cy_n),                  // in 64
      .non_zeros_in        (non_zeros),             // in 64
      .current_level_in    (current_level),         // in 64
      .cq_count_in         (cq_count),              // in 64
      .nq_count_out        (nq_count),              // out 64
      // Input Graph Pointers (Represented in Custom CSR)
      .graphData_in        (graphData),             // in 64
      .graphInfo_in        (graphInfo),             // in 64
      // Queue pointers
      .queue1_address_in   (queue1_address),        // in 64
      .queue2_address_in   (queue2_address),        // in 64
      // MC0 port signals
      .mc0_req_ld          (mc0_req_ld_e),          // out
      .mc0_req_st          (mc0_req_st_e),          // out
      .mc0_req_size        (mc0_req_size_e),        // out2
      .mc0_req_vaddr       (mc0_req_vadr_e),        // out48
      .mc0_req_wrd_rdctl   (mc0_req_wrd_rdctl_e),   // out64
      .mc0_req_flush       (mc0_req_flush_e),       // out
      .mc0_rd_rq_stall     (mc0_rd_rq_stall_e),     // in
      .mc0_wr_rq_stall     (mc0_wr_rq_stall_e),     // in
      .mc0_rsp_push        (mc0_rsp_push_e),        // in
      .mc0_rsp_stall       (mc0_rsp_stall_e),       // out
      .mc0_rsp_data        (mc0_rsp_data_e),        // in 64
      .mc0_rsp_rdctl       (mc0_rsp_rdctl_e),       // in 32
      .mc0_rsp_flush_cmplt (mc0_rsp_flush_cmplt_e),  // in
      // MC1 port signals
      .mc1_req_ld          (mc0_req_ld_o),          // out
      .mc1_req_st          (mc0_req_st_o),          // out
      .mc1_req_size        (mc0_req_size_o),        // out2
      .mc1_req_vaddr       (mc0_req_vadr_o),        // out48
      .mc1_req_wrd_rdctl   (mc0_req_wrd_rdctl_o),   // out64
      .mc1_req_flush       (mc0_req_flush_o),       // out
      .mc1_rd_rq_stall     (mc0_rd_rq_stall_o),     // in
      .mc1_wr_rq_stall     (mc0_wr_rq_stall_o),     // in
      .mc1_rsp_push        (mc0_rsp_push_o),        // in
      .mc1_rsp_stall       (mc0_rsp_stall_o),       // out
      .mc1_rsp_data        (mc0_rsp_data_o),        // in 64
      .mc1_rsp_rdctl       (mc0_rsp_rdctl_o),       // in 32
      .mc1_rsp_flush_cmplt (mc0_rsp_flush_cmplt_o), // in
      // MC2 port signals
      .mc2_req_ld          (mc1_req_ld_e),          // out
      .mc2_req_st          (mc1_req_st_e),          // out
      .mc2_req_size        (mc1_req_size_e),        // out2
      .mc2_req_vaddr       (mc1_req_vadr_e),        // out48
      .mc2_req_wrd_rdctl   (mc1_req_wrd_rdctl_e),   // out64
      .mc2_req_flush       (mc1_req_flush_e),       // out
      .mc2_rd_rq_stall     (mc1_rd_rq_stall_e),     // in
      .mc2_wr_rq_stall     (mc1_wr_rq_stall_e),     // in
      .mc2_rsp_push        (mc1_rsp_push_e),        // in
      .mc2_rsp_stall       (mc1_rsp_stall_e),       // out
      .mc2_rsp_data        (mc1_rsp_data_e),        // in 64
      .mc2_rsp_rdctl       (mc1_rsp_rdctl_e),       // in 32
      .mc2_rsp_flush_cmplt (mc1_rsp_flush_cmplt_e), // in
      // MC3 port signals
      .mc3_req_ld          (mc1_req_ld_o),          // out
      .mc3_req_st          (mc1_req_st_o),          // out
      .mc3_req_size        (mc1_req_size_o),        // out2
      .mc3_req_vaddr       (mc1_req_vadr_o),        // out48
      .mc3_req_wrd_rdctl   (mc1_req_wrd_rdctl_o),   // out64
      .mc3_req_flush       (mc1_req_flush_o),       // out
      .mc3_rd_rq_stall     (mc1_rd_rq_stall_o),     // in
      .mc3_wr_rq_stall     (mc1_wr_rq_stall_o),     // in
      .mc3_rsp_push        (mc1_rsp_push_o),        // in
      .mc3_rsp_stall       (mc1_rsp_stall_o),       // out
      .mc3_rsp_data        (mc1_rsp_data_o),        // in 64
      .mc3_rsp_rdctl       (mc1_rsp_rdctl_o),       // in 32
      .mc3_rsp_flush_cmplt (mc1_rsp_flush_cmplt_o), // in
      // MC4 port signals
      .mc4_req_ld          (mc2_req_ld_e),          // out
      .mc4_req_st          (mc2_req_st_e),          // out
      .mc4_req_size        (mc2_req_size_e),        // out2
      .mc4_req_vaddr       (mc2_req_vadr_e),        // out48
      .mc4_req_wrd_rdctl   (mc2_req_wrd_rdctl_e),   // out64
      .mc4_req_flush       (mc2_req_flush_e),       // out
      .mc4_rd_rq_stall     (mc2_rd_rq_stall_e),     // in
      .mc4_wr_rq_stall     (mc2_wr_rq_stall_e),     // in
      .mc4_rsp_push        (mc2_rsp_push_e),        // in
      .mc4_rsp_stall       (mc2_rsp_stall_e),       // out
      .mc4_rsp_data        (mc2_rsp_data_e),        // in 64
      .mc4_rsp_rdctl       (mc2_rsp_rdctl_e),       // in 32
      .mc4_rsp_flush_cmplt (mc2_rsp_flush_cmplt_e), // in
      // MC5 port signals
      .mc5_req_ld          (mc2_req_ld_o),          // out
      .mc5_req_st          (mc2_req_st_o),          // out
      .mc5_req_size        (mc2_req_size_o),        // out2
      .mc5_req_vaddr       (mc2_req_vadr_o),        // out48
      .mc5_req_wrd_rdctl   (mc2_req_wrd_rdctl_o),   // out64
      .mc5_req_flush       (mc2_req_flush_o),       // out
      .mc5_rd_rq_stall     (mc2_rd_rq_stall_o),     // in
      .mc5_wr_rq_stall     (mc2_wr_rq_stall_o),     // in
      .mc5_rsp_push        (mc2_rsp_push_o),        // in
      .mc5_rsp_stall       (mc2_rsp_stall_o),       // out
      .mc5_rsp_data        (mc2_rsp_data_o),        // in 64
      .mc5_rsp_rdctl       (mc2_rsp_rdctl_o),       // in 32
      .mc5_rsp_flush_cmplt (mc2_rsp_flush_cmplt_o), // in
      // MC6 port signals
      .mc6_req_ld          (mc3_req_ld_e),          // out
      .mc6_req_st          (mc3_req_st_e),          // out
      .mc6_req_size        (mc3_req_size_e),        // out2
      .mc6_req_vaddr       (mc3_req_vadr_e),        // out48
      .mc6_req_wrd_rdctl   (mc3_req_wrd_rdctl_e),   // out64
      .mc6_req_flush       (mc3_req_flush_e),       // out
      .mc6_rd_rq_stall     (mc3_rd_rq_stall_e),     // in
      .mc6_wr_rq_stall     (mc3_wr_rq_stall_e),     // in
      .mc6_rsp_push        (mc3_rsp_push_e),        // in
      .mc6_rsp_stall       (mc3_rsp_stall_e),       // out
      .mc6_rsp_data        (mc3_rsp_data_e),        // in 64
      .mc6_rsp_rdctl       (mc3_rsp_rdctl_e),       // in 32
      .mc6_rsp_flush_cmplt (mc3_rsp_flush_cmplt_e), // in
      // MC7 port signals
      .mc7_req_ld          (mc3_req_ld_o),          // out
      .mc7_req_st          (mc3_req_st_o),          // out
      .mc7_req_size        (mc3_req_size_o),        // out2
      .mc7_req_vaddr       (mc3_req_vadr_o),        // out48
      .mc7_req_wrd_rdctl   (mc3_req_wrd_rdctl_o),   // out64
      .mc7_req_flush       (mc3_req_flush_o),       // out
      .mc7_rd_rq_stall     (mc3_rd_rq_stall_o),     // in
      .mc7_wr_rq_stall     (mc3_wr_rq_stall_o),     // in
      .mc7_rsp_push        (mc3_rsp_push_o),        // in
      .mc7_rsp_stall       (mc3_rsp_stall_o),       // out
      .mc7_rsp_data        (mc3_rsp_data_o),        // in 64
      .mc7_rsp_rdctl       (mc3_rsp_rdctl_o),       // in 32
      .mc7_rsp_flush_cmplt (mc3_rsp_flush_cmplt_o), // in
      // MC8 port signals
      .mc8_req_ld          (mc4_req_ld_e),          // out
      .mc8_req_st          (mc4_req_st_e),          // out
      .mc8_req_size        (mc4_req_size_e),        // out2
      .mc8_req_vaddr       (mc4_req_vadr_e),        // out48
      .mc8_req_wrd_rdctl   (mc4_req_wrd_rdctl_e),   // out64
      .mc8_req_flush       (mc4_req_flush_e),       // out
      .mc8_rd_rq_stall     (mc4_rd_rq_stall_e),     // in
      .mc8_wr_rq_stall     (mc4_wr_rq_stall_e),     // in
      .mc8_rsp_push        (mc4_rsp_push_e),        // in
      .mc8_rsp_stall       (mc4_rsp_stall_e),       // out
      .mc8_rsp_data        (mc4_rsp_data_e),        // in 64
      .mc8_rsp_rdctl       (mc4_rsp_rdctl_e),       // in 32
      .mc8_rsp_flush_cmplt (mc4_rsp_flush_cmplt_e), // in
      // MC9 port signals
      .mc9_req_ld          (mc4_req_ld_o),          // out
      .mc9_req_st          (mc4_req_st_o),          // out
      .mc9_req_size        (mc4_req_size_o),        // out2
      .mc9_req_vaddr       (mc4_req_vadr_o),        // out48
      .mc9_req_wrd_rdctl   (mc4_req_wrd_rdctl_o),   // out64
      .mc9_req_flush       (mc4_req_flush_o),       // out
      .mc9_rd_rq_stall     (mc4_rd_rq_stall_o),     // in
      .mc9_wr_rq_stall     (mc4_wr_rq_stall_o),     // in
      .mc9_rsp_push        (mc4_rsp_push_o),        // in
      .mc9_rsp_stall       (mc4_rsp_stall_o),       // out
      .mc9_rsp_data        (mc4_rsp_data_o),        // in 64
      .mc9_rsp_rdctl       (mc4_rsp_rdctl_o),       // in 32
      .mc9_rsp_flush_cmplt (mc4_rsp_flush_cmplt_o), // in
      // MC10 port signals
      .mc10_req_ld          (mc5_req_ld_e),          // out
      .mc10_req_st          (mc5_req_st_e),          // out
      .mc10_req_size        (mc5_req_size_e),        // out2
      .mc10_req_vaddr       (mc5_req_vadr_e),        // out48
      .mc10_req_wrd_rdctl   (mc5_req_wrd_rdctl_e),   // out64
      .mc10_req_flush       (mc5_req_flush_e),       // out
      .mc10_rd_rq_stall     (mc5_rd_rq_stall_e),     // in
      .mc10_wr_rq_stall     (mc5_wr_rq_stall_e),     // in
      .mc10_rsp_push        (mc5_rsp_push_e),        // in
      .mc10_rsp_stall       (mc5_rsp_stall_e),       // out
      .mc10_rsp_data        (mc5_rsp_data_e),        // in 64
      .mc10_rsp_rdctl       (mc5_rsp_rdctl_e),       // in 32
      .mc10_rsp_flush_cmplt (mc5_rsp_flush_cmplt_e), // in
      // MC11 port signals
      .mc11_req_ld          (mc5_req_ld_o),          // out
      .mc11_req_st          (mc5_req_st_o),          // out
      .mc11_req_size        (mc5_req_size_o),        // out2
      .mc11_req_vaddr       (mc5_req_vadr_o),        // out48
      .mc11_req_wrd_rdctl   (mc5_req_wrd_rdctl_o),   // out64
      .mc11_req_flush       (mc5_req_flush_o),       // out
      .mc11_rd_rq_stall     (mc5_rd_rq_stall_o),     // in
      .mc11_wr_rq_stall     (mc5_wr_rq_stall_o),     // in
      .mc11_rsp_push        (mc5_rsp_push_o),        // in
      .mc11_rsp_stall       (mc5_rsp_stall_o),       // out
      .mc11_rsp_data        (mc5_rsp_data_o),        // in 64
      .mc11_rsp_rdctl       (mc5_rsp_rdctl_o),       // in 32
      .mc11_rsp_flush_cmplt (mc5_rsp_flush_cmplt_o), // in
      // MC12 port signals
      .mc12_req_ld          (mc6_req_ld_e),          // out
      .mc12_req_st          (mc6_req_st_e),          // out
      .mc12_req_size        (mc6_req_size_e),        // out2
      .mc12_req_vaddr       (mc6_req_vadr_e),        // out48
      .mc12_req_wrd_rdctl   (mc6_req_wrd_rdctl_e),   // out64
      .mc12_req_flush       (mc6_req_flush_e),       // out
      .mc12_rd_rq_stall     (mc6_rd_rq_stall_e),     // in
      .mc12_wr_rq_stall     (mc6_wr_rq_stall_e),     // in
      .mc12_rsp_push        (mc6_rsp_push_e),        // in
      .mc12_rsp_stall       (mc6_rsp_stall_e),       // out
      .mc12_rsp_data        (mc6_rsp_data_e),        // in 64
      .mc12_rsp_rdctl       (mc6_rsp_rdctl_e),       // in 32
      .mc12_rsp_flush_cmplt (mc6_rsp_flush_cmplt_e), // in
      // MC13 port signals
      .mc13_req_ld          (mc6_req_ld_o),          // out
      .mc13_req_st          (mc6_req_st_o),          // out
      .mc13_req_size        (mc6_req_size_o),        // out2
      .mc13_req_vaddr       (mc6_req_vadr_o),        // out48
      .mc13_req_wrd_rdctl   (mc6_req_wrd_rdctl_o),   // out64
      .mc13_req_flush       (mc6_req_flush_o),       // out
      .mc13_rd_rq_stall     (mc6_rd_rq_stall_o),     // in
      .mc13_wr_rq_stall     (mc6_wr_rq_stall_o),     // in
      .mc13_rsp_push        (mc6_rsp_push_o),        // in
      .mc13_rsp_stall       (mc6_rsp_stall_o),       // out
      .mc13_rsp_data        (mc6_rsp_data_o),        // in 64
      .mc13_rsp_rdctl       (mc6_rsp_rdctl_o),       // in 32
      .mc13_rsp_flush_cmplt (mc6_rsp_flush_cmplt_o), // in
      // MC14 port signals
      .mc14_req_ld          (mc7_req_ld_e),          // out
      .mc14_req_st          (mc7_req_st_e),          // out
      .mc14_req_size        (mc7_req_size_e),        // out2
      .mc14_req_vaddr       (mc7_req_vadr_e),        // out48
      .mc14_req_wrd_rdctl   (mc7_req_wrd_rdctl_e),   // out64
      .mc14_req_flush       (mc7_req_flush_e),       // out
      .mc14_rd_rq_stall     (mc7_rd_rq_stall_e),     // in
      .mc14_wr_rq_stall     (mc7_wr_rq_stall_e),     // in
      .mc14_rsp_push        (mc7_rsp_push_e),        // in
      .mc14_rsp_stall       (mc7_rsp_stall_e),       // out
      .mc14_rsp_data        (mc7_rsp_data_e),        // in 64
      .mc14_rsp_rdctl       (mc7_rsp_rdctl_e),       // in 32
      .mc14_rsp_flush_cmplt (mc7_rsp_flush_cmplt_e), // in
      // MC15 port signals
      .mc15_req_ld          (mc7_req_ld_o),          // out
      .mc15_req_st          (mc7_req_st_o),          // out
      .mc15_req_size        (mc7_req_size_o),        // out2
      .mc15_req_vaddr       (mc7_req_vadr_o),        // out48
      .mc15_req_wrd_rdctl   (mc7_req_wrd_rdctl_o),   // out64
      .mc15_req_flush       (mc7_req_flush_o),       // out
      .mc15_rd_rq_stall     (mc7_rd_rq_stall_o),     // in
      .mc15_wr_rq_stall     (mc7_wr_rq_stall_o),     // in
      .mc15_rsp_push        (mc7_rsp_push_o),        // in
      .mc15_rsp_stall       (mc7_rsp_stall_o),       // out
      .mc15_rsp_data        (mc7_rsp_data_o),        // in 64
      .mc15_rsp_rdctl       (mc7_rsp_rdctl_o),       // in 32
      .mc15_rsp_flush_cmplt (mc7_rsp_flush_cmplt_o)  // in
   );
    /* ---------- debug & synopsys off blocks  ---------- */
    // synopsys translate_off
    // Parameters: 1-Severity: Don't Stop, 2-start check only after negedge of reset
    //assert_never #(1, 2, "***ERROR ASSERT: unimplemented instruction cracked") a0 (.clk(clk), .reset_n(~reset), .test_expr(r_unimplemented_inst));
    // synopsys translate_on
endmodule