module outputs)
  wire                  cs_en0;                 // From arb_row_col0 of arb_row_col.v
  wire                  cs_en1;                 // From arb_row_col0 of arb_row_col.v
  wire [nBANK_MACHS-1:0] grant_col_r;           // From arb_row_col0 of arb_row_col.v
  wire [nBANK_MACHS-1:0] grant_col_wr;          // From arb_row_col0 of arb_row_col.v
  wire [nBANK_MACHS-1:0] grant_config_r;        // From arb_row_col0 of arb_row_col.v
  wire [nBANK_MACHS-1:0] grant_row_r;           // From arb_row_col0 of arb_row_col.v
  wire [nBANK_MACHS-1:0] grant_pre_r;           // From arb_row_col0 of arb_row_col.v
  wire                  send_cmd0_row;          // From arb_row_col0 of arb_row_col.v
  wire                  send_cmd0_col;          // From arb_row_col0 of arb_row_col.v
  wire                  send_cmd1_row;          // From arb_row_col0 of arb_row_col.v
  wire                  send_cmd1_col;
  wire                  send_cmd2_row;
  wire                  send_cmd2_col;
  wire                  send_cmd2_pre;
  wire                  send_cmd3_col;
  wire [5:0]            col_channel_offset;
  // End of automatics
  wire                  sent_col_i;
  wire                  cs_en2;
  wire                  cs_en3;
  assign sent_col = sent_col_i;
  mig_7series_v2_0_arb_row_col #
    (/*AUTOINSTPARAM*/
     // Parameters
     .TCQ                               (TCQ),
     .ADDR_CMD_MODE                     (ADDR_CMD_MODE),
     .CWL                               (CWL),
     .EARLY_WR_DATA_ADDR                (EARLY_WR_DATA_ADDR),
     .nBANK_MACHS                       (nBANK_MACHS),
     .nCK_PER_CLK                       (nCK_PER_CLK),
     .nRAS                              (nRAS),
     .nRCD                              (nRCD),
     .nWR                               (nWR))
    arb_row_col0
      (/*AUTOINST*/
       // Outputs
       .grant_row_r                     (grant_row_r[nBANK_MACHS-1:0]),
       .grant_pre_r                     (grant_pre_r[nBANK_MACHS-1:0]),
       .sent_row                        (sent_row),
       .sending_row                     (sending_row[nBANK_MACHS-1:0]),
       .sending_pre                     (sending_pre[nBANK_MACHS-1:0]),
       .grant_config_r                  (grant_config_r[nBANK_MACHS-1:0]),
       .rnk_config_strobe               (rnk_config_strobe),
       .rnk_config_kill_rts_col         (rnk_config_kill_rts_col),
       .rnk_config_valid_r              (rnk_config_valid_r),
       .grant_col_r                     (grant_col_r[nBANK_MACHS-1:0]),
       .sending_col                     (sending_col[nBANK_MACHS-1:0]),
       .sent_col                        (sent_col_i),
       .sent_col_r                      (sent_col_r),
       .grant_col_wr                    (grant_col_wr[nBANK_MACHS-1:0]),
       .send_cmd0_row                   (send_cmd0_row),
       .send_cmd0_col                   (send_cmd0_col),
       .send_cmd1_row                   (send_cmd1_row),
       .send_cmd1_col                   (send_cmd1_col),
       .send_cmd2_row                   (send_cmd2_row),
       .send_cmd2_col                   (send_cmd2_col),
       .send_cmd2_pre                   (send_cmd2_pre),
       .send_cmd3_col                   (send_cmd3_col),
       .col_channel_offset              (col_channel_offset),
       .cs_en0                          (cs_en0),
       .cs_en1                          (cs_en1),
       .cs_en2                          (cs_en2),
       .cs_en3                          (cs_en3),
       .insert_maint_r1                 (insert_maint_r1),
       // Inputs
       .clk                             (clk),
       .rst                             (rst),
       .rts_row                         (rts_row[nBANK_MACHS-1:0]),
       .rts_pre                         (rts_pre[nBANK_MACHS-1:0]),
       .insert_maint_r                  (insert_maint_r),
       .rts_col                         (rts_col[nBANK_MACHS-1:0]),
       .rtc                             (rtc[nBANK_MACHS-1:0]),
       .col_rdy_wr                      (col_rdy_wr[nBANK_MACHS-1:0]));
  mig_7series_v2_0_arb_select #
    (/*AUTOINSTPARAM*/
     // Parameters
     .TCQ                               (TCQ),
     .EVEN_CWL_2T_MODE                  (EVEN_CWL_2T_MODE),
     .ADDR_CMD_MODE                     (ADDR_CMD_MODE),
     .BANK_VECT_INDX                    (BANK_VECT_INDX),
     .BANK_WIDTH                        (BANK_WIDTH),
     .BURST_MODE                        (BURST_MODE),
     .CS_WIDTH                          (CS_WIDTH),
     .CL                                (CL),
     .CWL                               (CWL),
     .DATA_BUF_ADDR_VECT_INDX           (DATA_BUF_ADDR_VECT_INDX),
     .DATA_BUF_ADDR_WIDTH               (DATA_BUF_ADDR_WIDTH),
     .DRAM_TYPE                         (DRAM_TYPE),
     .EARLY_WR_DATA_ADDR                (EARLY_WR_DATA_ADDR),
     .ECC                               (ECC),
     .CKE_ODT_AUX                       (CKE_ODT_AUX),
     .nBANK_MACHS                       (nBANK_MACHS),
     .nCK_PER_CLK                       (nCK_PER_CLK),
     .nCS_PER_RANK                      (nCS_PER_RANK),
     .nSLOTS                            (nSLOTS),
     .RANKS                             (RANKS),
     .RANK_VECT_INDX                    (RANK_VECT_INDX),
     .RANK_WIDTH                        (RANK_WIDTH),
     .ROW_VECT_INDX                     (ROW_VECT_INDX),
     .ROW_WIDTH                         (ROW_WIDTH),
     .RTT_NOM                           (RTT_NOM),
     .RTT_WR                            (RTT_WR),
     .SLOT_0_CONFIG                     (SLOT_0_CONFIG),
     .SLOT_1_CONFIG                     (SLOT_1_CONFIG))
    arb_select0
      (/*AUTOINST*/
       // Outputs
       .col_periodic_rd                 (col_periodic_rd),
       .col_ra                          (col_ra[RANK_WIDTH-1:0]),
       .col_ba                          (col_ba[BANK_WIDTH-1:0]),
       .col_a                           (col_a[ROW_WIDTH-1:0]),
       .col_rmw                         (col_rmw),
       .col_rd_wr                       (col_rd_wr),
       .col_size                        (col_size),
       .col_row                         (col_row[ROW_WIDTH-1:0]),
       .col_data_buf_addr               (col_data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
       .col_wr_data_buf_addr            (col_wr_data_buf_addr[DATA_BUF_ADDR_WIDTH-1:0]),
       .mc_bank                         (mc_bank),
       .mc_address                      (mc_address),
       .mc_ras_n                        (mc_ras_n),
       .mc_cas_n                        (mc_cas_n),
       .mc_we_n                         (mc_we_n),
       .mc_cs_n                         (mc_cs_n),
       .mc_odt                          (mc_odt),
       .mc_cke                          (mc_cke),
       .mc_aux_out0                     (mc_aux_out0),
       .mc_aux_out1                     (mc_aux_out1),
       .mc_cmd                          (mc_cmd),
       .mc_data_offset                  (mc_data_offset),
       .mc_data_offset_1                (mc_data_offset_1),
       .mc_data_offset_2                (mc_data_offset_2),
       .mc_cas_slot                     (mc_cas_slot),
       .col_channel_offset              (col_channel_offset),
       .rnk_config                      (rnk_config),
       // Inputs
       .clk                             (clk),
       .rst                             (rst),
       .init_calib_complete             (init_calib_complete),
       .calib_rddata_offset             (calib_rddata_offset),
       .calib_rddata_offset_1           (calib_rddata_offset_1),
       .calib_rddata_offset_2           (calib_rddata_offset_2),
       .req_rank_r                      (req_rank_r[RANK_VECT_INDX:0]),
       .req_bank_r                      (req_bank_r[BANK_VECT_INDX:0]),
       .req_ras                         (req_ras[nBANK_MACHS-1:0]),
       .req_cas                         (req_cas[nBANK_MACHS-1:0]),
       .req_wr_r                        (req_wr_r[nBANK_MACHS-1:0]),
       .grant_row_r                     (grant_row_r[nBANK_MACHS-1:0]),
       .grant_pre_r                     (grant_pre_r[nBANK_MACHS-1:0]),
       .row_addr                        (row_addr[ROW_VECT_INDX:0]),
       .row_cmd_wr                      (row_cmd_wr[nBANK_MACHS-1:0]),
       .insert_maint_r1                 (insert_maint_r1),
       .maint_zq_r                      (maint_zq_r),
       .maint_sre_r                     (maint_sre_r),
       .maint_srx_r                     (maint_srx_r),
       .maint_rank_r                    (maint_rank_r[RANK_WIDTH-1:0]),
       .req_periodic_rd_r               (req_periodic_rd_r[nBANK_MACHS-1:0]),
       .req_size_r                      (req_size_r[nBANK_MACHS-1:0]),
       .rd_wr_r                         (rd_wr_r[nBANK_MACHS-1:0]),
       .req_row_r                       (req_row_r[ROW_VECT_INDX:0]),
       .col_addr                        (col_addr[ROW_VECT_INDX:0]),
       .req_data_buf_addr_r             (req_data_buf_addr_r[DATA_BUF_ADDR_VECT_INDX:0]),
       .grant_col_r                     (grant_col_r[nBANK_MACHS-1:0]),
       .grant_col_wr                    (grant_col_wr[nBANK_MACHS-1:0]),
       .send_cmd0_row                   (send_cmd0_row),
       .send_cmd0_col                   (send_cmd0_col),
       .send_cmd1_row                   (send_cmd1_row),
       .send_cmd1_col                   (send_cmd1_col),
       .send_cmd2_row                   (send_cmd2_row),
       .send_cmd2_col                   (send_cmd2_col),
       .send_cmd2_pre                   (send_cmd2_pre),
       .send_cmd3_col                   (send_cmd3_col),
       .sent_col                        (EVEN_CWL_2T_MODE == "ON" ? sent_col_r : sent_col),
       .cs_en0                          (cs_en0),
       .cs_en1                          (cs_en1),
       .cs_en2                          (cs_en2),
       .cs_en3                          (cs_en3),
       .grant_config_r                  (grant_config_r[nBANK_MACHS-1:0]),
       .rnk_config_strobe               (rnk_config_strobe),
       .slot_0_present                  (slot_0_present[7:0]),
       .slot_1_present                  (slot_1_present[7:0]));
endmodule