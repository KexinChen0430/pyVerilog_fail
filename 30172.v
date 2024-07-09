module instantiation for Port-0
   init_mem_pattern_ctr #
     (
      .TCQ                           (TCQ),
      .DWIDTH                        (DATA_WIDTH),
      .TST_MEM_INSTR_MODE            (TST_MEM_INSTR_MODE),
   //   .nCK_PER_CLK                   (nCK_PER_CLK),
      .MEM_BURST_LEN                 (MEM_BURST_LEN),
      .NUM_DQ_PINS                   (NUM_DQ_PINS),
      .FAMILY                        (TG_FAMILY),
      .BL_WIDTH            (BL_WIDTH),
      .ADDR_WIDTH                    (ADDR_WIDTH),
      .BEGIN_ADDRESS                 (BEGIN_ADDRESS),
      .END_ADDRESS                   (END_ADDRESS),
      .CMD_SEED_VALUE                (32'h56456783),
      .DATA_SEED_VALUE               (32'h12345678),
      .DATA_MODE                     (DATA_MODE),
      .PORT_MODE                     (PORT_MODE)
    )
   u_init_mem_pattern_ctr
     (
      .clk_i                         (clk),
      .rst_i                         (rst),
      .memc_cmd_en_i                  (memc_cmd_en),
      .memc_wr_en_i                   (tg_memc_wr_en),
      .vio_modify_enable             (vio_modify_enable),
      .vio_instr_mode_value          (vio_instr_mode_value),
      .vio_data_mode_value           (vio_data_mode_value),
      .vio_addr_mode_value           (vio_addr_mode_value),
      .vio_bl_mode_value             (vio_bl_mode_value),  // always set to PRBS_BL mode
      .vio_fixed_bl_value            (vio_fixed_bl_value),  // always set to 64 in order to run PRBS data pattern
      .vio_data_mask_gen             (vio_data_mask_gen),
      .memc_init_done_i               (memc_init_done),
      .cmp_error                     (error),
      .run_traffic_o                 (tg_run_traffic),
      .start_addr_o                  (tg_start_addr),
      .end_addr_o                    (tg_end_addr),
      .cmd_seed_o                    (tg_cmd_seed),
      .data_seed_o                   (tg_data_seed),
      .load_seed_o                   (tg_load_seed),
      .addr_mode_o                   (tg_addr_mode),
      .instr_mode_o                  (tg_instr_mode),
      .bl_mode_o                     (tg_bl_mode),
      .data_mode_o                   (tg_data_mode),
      .mode_load_o                   (tg_mode_load),
      .fixed_bl_o                    (tg_fixed_bl),
      .fixed_instr_o                 (tg_fixed_instr),
      .mem_pattern_init_done_o         (mem_pattern_init_done)
     );
   // traffic generator instantiation for Port-0
   memc_traffic_gen #
     (
      .TCQ                           (TCQ),
      .MEM_BURST_LEN                 (MEM_BURST_LEN),
      .MEM_COL_WIDTH                 (MEM_COL_WIDTH),
      .NUM_DQ_PINS                   (NUM_DQ_PINS),
      .nCK_PER_CLK                   (nCK_PER_CLK),
      .PORT_MODE                     (PORT_MODE),
      .DWIDTH                        (DATA_WIDTH),
      .FAMILY                        (TG_FAMILY),
      .SIMULATION                    (SIMULATION),
      .DATA_PATTERN                  (DATA_PATTERN),
      .CMD_PATTERN                   (CMD_PATTERN ),
      .ADDR_WIDTH                    (ADDR_WIDTH),
      .BL_WIDTH                      (BL_WIDTH),
      .SEL_VICTIM_LINE               (SEL_VICTIM_LINE),
      .PRBS_SADDR_MASK_POS           (BEGIN_ADDRESS),
      .PRBS_EADDR_MASK_POS           (PRBS_EADDR_MASK_POS),
      .PRBS_SADDR                    (BEGIN_ADDRESS),
      .PRBS_EADDR                    (END_ADDRESS),
      .EYE_TEST                      (EYE_TEST)
     )
   u_memc_traffic_gen
     (
      .clk_i                         (clk),
      .rst_i                         (rst),
      .run_traffic_i                 (tg_run_traffic),
      .manual_clear_error            (manual_clear_error),
      .cmds_gap_delay_value         (cmds_gap_delay_value),
      // runtime parameter
      .mem_pattern_init_done_i       (mem_pattern_init_done),
      .start_addr_i                  (tg_start_addr),
      .end_addr_i                    (tg_end_addr),
      .cmd_seed_i                    (tg_cmd_seed),
      .data_seed_i                   (tg_data_seed),
      .load_seed_i                   (tg_load_seed),
      .addr_mode_i                   (tg_addr_mode),
      .instr_mode_i                  (tg_instr_mode),
      .bl_mode_i                     (tg_bl_mode),
      .data_mode_i                   (tg_data_mode),
      .mode_load_i                   (tg_mode_load),
      .wr_data_mask_gen_i             (vio_data_mask_gen),
      // fixed pattern inputs interface
      .fixed_bl_i                    (tg_fixed_bl),
      .fixed_instr_i                 (tg_fixed_instr),
      .fixed_addr_i                  (fixed_addr_i),
      .fixed_data_i                  (fixed_data_i),
      // BRAM interface.
      .bram_cmd_i                    (bram_cmd_i),
   //   .bram_addr_i                   (bram_addr_i ),
   //   .bram_instr_i                  ( bram_instr_i),
      .bram_valid_i                  (bram_valid_i),
      .bram_rdy_o                    (bram_rdy_o),
      //  MCB INTERFACE
      .memc_cmd_en_o                  (memc_cmd_en),
      .memc_cmd_instr_o               (memc_cmd_instr),
      .memc_cmd_bl_o                  (memc_cmd_bl),
      .memc_cmd_addr_o                (memc_cmd_addr),
      .memc_cmd_full_i                (memc_cmd_full),
      .memc_wr_en_o                   (memc_wr_en),
      .memc_wr_data_end_o             (memc_wr_end),
      .memc_wr_mask_o                 (memc_wr_mask),
      .memc_wr_data_o                 (memc_wr_data),
      .memc_wr_full_i                 (memc_wr_full),
      .memc_rd_en_o                   (memc_rd_en),
      .memc_rd_data_i                 (memc_rd_data),
      .memc_rd_empty_i                (memc_rd_empty),
      .qdr_wr_cmd_o                  (),
      .qdr_rd_cmd_o                  (),
      // status feedback
      .counts_rst                    (rst),
      .wr_data_counts                (),
      .rd_data_counts                (),
      .error                         (error),  // asserted whenever the read back data is not correct.
      .error_status                  (error_status),  // TBD how signals mapped
      .cmp_data                      (cmp_data),
      .cmp_data_valid                (cmp_data_valid),
      .cmp_error                     (cmp_error),
      .mem_rd_data                   (),
      .simple_data0                  (simple_data0),
      .simple_data1                  (simple_data1),
      .simple_data2                  (simple_data2),
      .simple_data3                  (simple_data3),
      .simple_data4                  (simple_data4),
      .simple_data5                  (simple_data5),
      .simple_data6                  (simple_data6),
      .simple_data7                  (simple_data7),
      .dq_error_bytelane_cmp         (),
      .cumlative_dq_lane_error       (),
      .cumlative_dq_r0_bit_error     (),
      .cumlative_dq_f0_bit_error     (),
      .cumlative_dq_r1_bit_error     (),
      .cumlative_dq_f1_bit_error     (),
      .dq_r0_bit_error_r             (),
      .dq_f0_bit_error_r             (),
      .dq_r1_bit_error_r             (),
      .dq_f1_bit_error_r             (),
      .dq_r0_read_bit                (),
      .dq_f0_read_bit                (),
      .dq_r1_read_bit                (),
      .dq_f1_read_bit                (),
      .dq_r0_expect_bit              (),
      .dq_f0_expect_bit              (),
      .dq_r1_expect_bit              (),
      .dq_f1_expect_bit              (),
      .error_addr                    ()
     );
endmodule