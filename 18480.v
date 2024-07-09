module outputs)
  wire                  maint_prescaler_tick_r; // From rank_common0 of rank_common.v
  wire                  refresh_tick;           // From rank_common0 of rank_common.v
  // End of automatics
  output [RANKS-1:0] inhbt_act_faw_r;
  output [RANKS-1:0] inhbt_rd_r;
  output [RANKS-1:0] wtr_inhbt_config_r;
  output [RANK_WIDTH-1:0] maint_rank_r;
  output maint_zq_r;
  wire [RANKS-1:0] refresh_request;
  wire [RANKS-1:0] periodic_rd_request;
  wire [RANKS-1:0] clear_periodic_rd_request;
  genvar ID;
  generate
    for (ID=0; ID<RANKS; ID=ID+1) begin:rank_cntrl
      rank_cntrl#
        (/*AUTOINSTPARAM*/
         // Parameters
         .BURST_MODE                    (BURST_MODE),
         .ID                            (ID),
         .nBANK_MACHS                   (nBANK_MACHS),
         .nCK_PER_CLK                   (nCK_PER_CLK),
         .CL                            (CL),
         .nFAW                          (nFAW),
         .nREFRESH_BANK                 (nREFRESH_BANK),
         .nRRD                          (nRRD),
         .nWTR                          (nWTR),
         .PERIODIC_RD_TIMER_DIV         (PERIODIC_RD_TIMER_DIV),
         .RANK_BM_BV_WIDTH              (RANK_BM_BV_WIDTH),
         .RANK_WIDTH                    (RANK_WIDTH),
         .RANKS                         (RANKS),
         .REFRESH_TIMER_DIV             (REFRESH_TIMER_DIV))
        rank_cntrl0
          (.clear_periodic_rd_request   (clear_periodic_rd_request[ID]),
           .inhbt_act_faw_r             (inhbt_act_faw_r[ID]),
           .inhbt_rd_r                  (inhbt_rd_r[ID]),
           .periodic_rd_request         (periodic_rd_request[ID]),
           .refresh_request             (refresh_request[ID]),
           .wtr_inhbt_config_r          (wtr_inhbt_config_r[ID]),
           /*AUTOINST*/
           // Inputs
           .clk                         (clk),
           .rst                         (rst),
           .sending_row                 (sending_row[nBANK_MACHS-1:0]),
           .act_this_rank_r             (act_this_rank_r[RANK_BM_BV_WIDTH-1:0]),
           .sending_col                 (sending_col[nBANK_MACHS-1:0]),
           .wr_this_rank_r              (wr_this_rank_r[RANK_BM_BV_WIDTH-1:0]),
           .app_ref_req                 (app_ref_req),
           .init_calib_complete           (init_calib_complete),
           .rank_busy_r                 (rank_busy_r[(RANKS*nBANK_MACHS)-1:0]),
           .refresh_tick                (refresh_tick),
           .insert_maint_r1             (insert_maint_r1),
           .maint_zq_r                  (maint_zq_r),
           .maint_rank_r                (maint_rank_r[RANK_WIDTH-1:0]),
           .app_periodic_rd_req         (app_periodic_rd_req),
           .maint_prescaler_tick_r      (maint_prescaler_tick_r),
           .rd_this_rank_r              (rd_this_rank_r[RANK_BM_BV_WIDTH-1:0]));
    end
  endgenerate
  rank_common#
    (/*AUTOINSTPARAM*/
     // Parameters
     .DRAM_TYPE                         (DRAM_TYPE),
     .MAINT_PRESCALER_DIV               (MAINT_PRESCALER_DIV),
     .nBANK_MACHS                       (nBANK_MACHS),
     .PERIODIC_RD_TIMER_DIV             (PERIODIC_RD_TIMER_DIV),
     .RANK_WIDTH                        (RANK_WIDTH),
     .RANKS                             (RANKS),
     .REFRESH_TIMER_DIV                 (REFRESH_TIMER_DIV),
     .ZQ_TIMER_DIV                      (ZQ_TIMER_DIV))
    rank_common0
    (.clear_periodic_rd_request         (clear_periodic_rd_request[RANKS-1:0]),
     /*AUTOINST*/
     // Outputs
     .maint_prescaler_tick_r            (maint_prescaler_tick_r),
     .refresh_tick                      (refresh_tick),
     .maint_zq_r                        (maint_zq_r),
     .maint_req_r                       (maint_req_r),
     .maint_rank_r                      (maint_rank_r[RANK_WIDTH-1:0]),
     .periodic_rd_r                     (periodic_rd_r),
     .periodic_rd_rank_r                (periodic_rd_rank_r[RANK_WIDTH-1:0]),
     // Inputs
     .clk                               (clk),
     .rst                               (rst),
     .init_calib_complete                 (init_calib_complete),
     .app_zq_req                        (app_zq_req),
     .insert_maint_r1                   (insert_maint_r1),
     .refresh_request                   (refresh_request[RANKS-1:0]),
     .maint_wip_r                       (maint_wip_r),
     .slot_0_present                    (slot_0_present[7:0]),
     .slot_1_present                    (slot_1_present[7:0]),
     .periodic_rd_request               (periodic_rd_request[RANKS-1:0]),
     .periodic_rd_ack_r                 (periodic_rd_ack_r));
endmodule