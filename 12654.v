module outputs)
   wire                 act_wait_r;             // From bank_state0 of bank_state.v
   wire                 allow_auto_pre;         // From bank_state0 of bank_state.v
   wire                 auto_pre_r;             // From bank_queue0 of bank_queue.v
   wire                 bank_wait_in_progress;  // From bank_state0 of bank_state.v
   wire                 order_q_zero;           // From bank_queue0 of bank_queue.v
   wire                 pass_open_bank_ns;      // From bank_queue0 of bank_queue.v
   wire                 pass_open_bank_r;       // From bank_queue0 of bank_queue.v
   wire                 pre_wait_r;             // From bank_state0 of bank_state.v
   wire                 precharge_bm_end;       // From bank_state0 of bank_state.v
   wire                 q_has_priority;         // From bank_queue0 of bank_queue.v
   wire                 q_has_rd;               // From bank_queue0 of bank_queue.v
   wire [nBANK_MACHS*2-1:0] rb_hit_busies_r;    // From bank_queue0 of bank_queue.v
   wire                 rcv_open_bank;          // From bank_queue0 of bank_queue.v
   wire                 rd_half_rmw;            // From bank_state0 of bank_state.v
   wire                 req_priority_r;         // From bank_compare0 of bank_compare.v
   wire                 row_hit_r;              // From bank_compare0 of bank_compare.v
   wire                 tail_r;                 // From bank_queue0 of bank_queue.v
   wire                 wait_for_maint_r;       // From bank_queue0 of bank_queue.v
   // End of automatics
  output idle_ns;
  output req_wr_r;
  output rd_wr_r;
  output bm_end;
  output idle_r;
  output head_r;
  output [RANK_WIDTH-1:0] req_rank_r;
  output rb_hit_busy_r;
  output passing_open_bank;
  output maint_hit;
  output [DATA_BUF_ADDR_WIDTH-1:0] req_data_buf_addr_r;
  bank_compare #
    (/*AUTOINSTPARAM*/
     // Parameters
     .BANK_WIDTH                        (BANK_WIDTH),
     .TCQ                               (TCQ),
     .BURST_MODE                        (BURST_MODE),
     .COL_WIDTH                         (COL_WIDTH),
     .DATA_BUF_ADDR_WIDTH               (DATA_BUF_ADDR_WIDTH),
     .ECC                               (ECC),
     .RANK_WIDTH                        (RANK_WIDTH),
     .RANKS                             (RANKS),
     .ROW_WIDTH                         (ROW_WIDTH))
    bank_compare0
      (/*AUTOINST*/
       // Outputs
       .req_data_buf_addr_r             (req_data_buf_addr_r[DATA_BUF_ADDR_WIDTH-1:0]),
       .req_periodic_rd_r               (req_periodic_rd_r),
       .req_size_r                      (req_size_r),
       .rd_wr_r                         (rd_wr_r),
       .req_rank_r                      (req_rank_r[RANK_WIDTH-1:0]),
       .req_bank_r                      (req_bank_r[BANK_WIDTH-1:0]),
       .req_row_r                       (req_row_r[ROW_WIDTH-1:0]),
       .req_wr_r                        (req_wr_r),
       .req_priority_r                  (req_priority_r),
       .rb_hit_busy_r                   (rb_hit_busy_r),
       .rb_hit_busy_ns                  (rb_hit_busy_ns),
       .row_hit_r                       (row_hit_r),
       .maint_hit                       (maint_hit),
       .col_addr                        (col_addr[ROW_WIDTH-1:0]),
       .req_ras                         (req_ras),
       .req_cas                         (req_cas),
       .row_cmd_wr                      (row_cmd_wr),
       .row_addr                        (row_addr[ROW_WIDTH-1:0]),
       .rank_busy_r                     (rank_busy_r[RANKS-1:0]),
       // Inputs
       .clk                             (clk),
       .idle_ns                         (idle_ns),
       .idle_r                          (idle_r),
       .data_buf_addr                   (data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
       .periodic_rd_insert              (periodic_rd_insert),
       .size                            (size),
       .cmd                             (cmd[2:0]),
       .sending_col                     (sending_col),
       .rank                            (rank[RANK_WIDTH-1:0]),
       .periodic_rd_rank_r              (periodic_rd_rank_r[RANK_WIDTH-1:0]),
       .bank                            (bank[BANK_WIDTH-1:0]),
       .row                             (row[ROW_WIDTH-1:0]),
       .col                             (col[COL_WIDTH-1:0]),
       .hi_priority                     (hi_priority),
       .maint_rank_r                    (maint_rank_r[RANK_WIDTH-1:0]),
       .maint_zq_r                      (maint_zq_r),
       .auto_pre_r                      (auto_pre_r),
       .rd_half_rmw                     (rd_half_rmw),
       .act_wait_r                      (act_wait_r));
  bank_state #
    (/*AUTOINSTPARAM*/
     // Parameters
     .TCQ                               (TCQ),
     .ADDR_CMD_MODE                     (ADDR_CMD_MODE),
     .BM_CNT_WIDTH                      (BM_CNT_WIDTH),
     .BURST_MODE                        (BURST_MODE),
     .CWL                               (CWL),
     .DATA_BUF_ADDR_WIDTH               (DATA_BUF_ADDR_WIDTH),
     .DRAM_TYPE                         (DRAM_TYPE),
     .ECC                               (ECC),
     .ID                                (ID),
     .nBANK_MACHS                       (nBANK_MACHS),
     .nCK_PER_CLK                       (nCK_PER_CLK),
     .nCNFG2RD_EN                       (nCNFG2RD_EN),
     .nCNFG2WR                          (nCNFG2WR),
     .nOP_WAIT                          (nOP_WAIT),
     .nRAS_CLKS                         (nRAS_CLKS),
     .nRP                               (nRP),
     .nRTP                              (nRTP),
     .nRCD                              (nRCD),
     .nWTP_CLKS                         (nWTP_CLKS),
     .ORDERING                          (ORDERING),
     .RANKS                             (RANKS),
     .RANK_WIDTH                        (RANK_WIDTH),
     .RAS_TIMER_WIDTH                   (RAS_TIMER_WIDTH),
     .STARVE_LIMIT                      (STARVE_LIMIT))
    bank_state0
      (/*AUTOINST*/
       // Outputs
       .start_rcd                       (start_rcd),
       .act_wait_r                      (act_wait_r),
       .rd_half_rmw                     (rd_half_rmw),
       .ras_timer_ns                    (ras_timer_ns[RAS_TIMER_WIDTH-1:0]),
       .end_rtp                         (end_rtp),
       .bank_wait_in_progress           (bank_wait_in_progress),
       .start_pre_wait                  (start_pre_wait),
       .op_exit_req                     (op_exit_req),
       .pre_wait_r                      (pre_wait_r),
       .allow_auto_pre                  (allow_auto_pre),
       .precharge_bm_end                (precharge_bm_end),
       .demand_act_priority             (demand_act_priority),
       .rts_row                         (rts_row),
       .rts_pre                         (rts_pre),
       .act_this_rank_r                 (act_this_rank_r[RANKS-1:0]),
       .demand_priority                 (demand_priority),
       .rtc                             (rtc),
       .col_rdy_wr                      (col_rdy_wr),
       .rts_col                         (rts_col),
       .wr_this_rank_r                  (wr_this_rank_r[RANKS-1:0]),
       .rd_this_rank_r                  (rd_this_rank_r[RANKS-1:0]),
       // Inputs
       .clk                             (clk),
       .rst                             (rst),
       .bm_end                          (bm_end),
       .pass_open_bank_r                (pass_open_bank_r),
       .sending_row                     (sending_row),
       .sending_pre                     (sending_pre),
       .rcv_open_bank                   (rcv_open_bank),
       .sending_col                     (sending_col),
       .rd_wr_r                         (rd_wr_r),
       .req_wr_r                        (req_wr_r),
       .rd_data_addr                    (rd_data_addr[DATA_BUF_ADDR_WIDTH-1:0]),
       .req_data_buf_addr_r             (req_data_buf_addr_r[DATA_BUF_ADDR_WIDTH-1:0]),
       .phy_rddata_valid                (phy_rddata_valid),
       .rd_rmw                          (rd_rmw),
       .ras_timer_ns_in                 (ras_timer_ns_in[(2*(RAS_TIMER_WIDTH*nBANK_MACHS))-1:0]),
       .rb_hit_busies_r                 (rb_hit_busies_r[(nBANK_MACHS*2)-1:0]),
       .idle_r                          (idle_r),
       .passing_open_bank               (passing_open_bank),
       .low_idle_cnt_r                  (low_idle_cnt_r),
       .op_exit_grant                   (op_exit_grant),
       .tail_r                          (tail_r),
       .auto_pre_r                      (auto_pre_r),
       .pass_open_bank_ns               (pass_open_bank_ns),
       .req_rank_r                      (req_rank_r[RANK_WIDTH-1:0]),
       .req_rank_r_in                   (req_rank_r_in[(RANK_WIDTH*nBANK_MACHS*2)-1:0]),
       .start_rcd_in                    (start_rcd_in[(nBANK_MACHS*2)-1:0]),
       .inhbt_act_faw_r                 (inhbt_act_faw_r[RANKS-1:0]),
       .wait_for_maint_r                (wait_for_maint_r),
       .head_r                          (head_r),
       .sent_row                        (sent_row),
       .demand_act_priority_in          (demand_act_priority_in[(nBANK_MACHS*2)-1:0]),
       .order_q_zero                    (order_q_zero),
       .sent_col                        (sent_col),
       .q_has_rd                        (q_has_rd),
       .q_has_priority                  (q_has_priority),
       .req_priority_r                  (req_priority_r),
       .idle_ns                         (idle_ns),
       .demand_priority_in              (demand_priority_in[(nBANK_MACHS*2)-1:0]),
       .io_config_strobe                (io_config_strobe),
       .io_config_valid_r               (io_config_valid_r),
       .io_config                       (io_config[RANK_WIDTH:0]),
       .wtr_inhbt_config_r              (wtr_inhbt_config_r[RANKS-1:0]),
       .inhbt_rd_config                 (inhbt_rd_config),
       .inhbt_wr_config                 (inhbt_wr_config),
       .inhbt_rd_r                      (inhbt_rd_r[RANKS-1:0]),
       .inhbt_wr_r                      (inhbt_wr_r[RANKS-1:0]),
       .dq_busy_data                    (dq_busy_data));
  bank_queue #
    (/*AUTOINSTPARAM*/
     // Parameters
     .TCQ                               (TCQ),
     .BM_CNT_WIDTH                      (BM_CNT_WIDTH),
     .nBANK_MACHS                       (nBANK_MACHS),
     .ORDERING                          (ORDERING),
     .ID                                (ID))
    bank_queue0
      (/*AUTOINST*/
       // Outputs
       .head_r                          (head_r),
       .tail_r                          (tail_r),
       .idle_ns                         (idle_ns),
       .idle_r                          (idle_r),
       .pass_open_bank_ns               (pass_open_bank_ns),
       .pass_open_bank_r                (pass_open_bank_r),
       .auto_pre_r                      (auto_pre_r),
       .bm_end                          (bm_end),
       .passing_open_bank               (passing_open_bank),
       .ordered_issued                  (ordered_issued),
       .ordered_r                       (ordered_r),
       .order_q_zero                    (order_q_zero),
       .rcv_open_bank                   (rcv_open_bank),
       .rb_hit_busies_r                 (rb_hit_busies_r[nBANK_MACHS*2-1:0]),
       .q_has_rd                        (q_has_rd),
       .q_has_priority                  (q_has_priority),
       .wait_for_maint_r                (wait_for_maint_r),
       // Inputs
       .clk                             (clk),
       .rst                             (rst),
       .accept_internal_r               (accept_internal_r),
       .use_addr                        (use_addr),
       .periodic_rd_ack_r               (periodic_rd_ack_r),
       .bm_end_in                       (bm_end_in[(nBANK_MACHS*2)-1:0]),
       .idle_cnt                        (idle_cnt[BM_CNT_WIDTH-1:0]),
       .rb_hit_busy_cnt                 (rb_hit_busy_cnt[BM_CNT_WIDTH-1:0]),
       .accept_req                      (accept_req),
       .rb_hit_busy_r                   (rb_hit_busy_r),
       .maint_idle                      (maint_idle),
       .maint_hit                       (maint_hit),
       .row_hit_r                       (row_hit_r),
       .pre_wait_r                      (pre_wait_r),
       .allow_auto_pre                  (allow_auto_pre),
       .sending_col                     (sending_col),
       .req_wr_r                        (req_wr_r),
       .rd_wr_r                         (rd_wr_r),
       .bank_wait_in_progress           (bank_wait_in_progress),
       .precharge_bm_end                (precharge_bm_end),
       .adv_order_q                     (adv_order_q),
       .order_cnt                       (order_cnt[BM_CNT_WIDTH-1:0]),
       .rb_hit_busy_ns_in               (rb_hit_busy_ns_in[(nBANK_MACHS*2)-1:0]),
       .passing_open_bank_in            (passing_open_bank_in[(nBANK_MACHS*2)-1:0]),
       .was_wr                          (was_wr),
       .maint_req_r                     (maint_req_r),
       .was_priority                    (was_priority));
endmodule