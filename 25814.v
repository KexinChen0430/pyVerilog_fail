module.
         .C_PORT_ENABLE                  (C3_PORT_ENABLE),
   	     .C_P0_MASK_SIZE                 (C3_P0_MASK_SIZE),
         .C_P0_DATA_PORT_SIZE            (C3_P0_DATA_PORT_SIZE),
         .C_P1_MASK_SIZE                 (C3_P1_MASK_SIZE),
         .C_P1_DATA_PORT_SIZE            (C3_P1_DATA_PORT_SIZE),
         .C_P0_PORT_MODE                 (C3_P0_PORT_MODE),
         .C_P1_PORT_MODE                 (C3_P1_PORT_MODE),
         .C_P2_PORT_MODE                 (C3_P2_PORT_MODE),
         .C_P3_PORT_MODE                 (C3_P3_PORT_MODE),
         .C_P4_PORT_MODE                 (C3_P4_PORT_MODE),
         .C_P5_PORT_MODE                 (C3_P5_PORT_MODE),
         .C_p0_BEGIN_ADDRESS             (C3_p0_BEGIN_ADDRESS),
         .C_p0_DATA_MODE                 (C3_p0_DATA_MODE),
         .C_p0_END_ADDRESS               (C3_p0_END_ADDRESS),
         .C_p0_PRBS_EADDR_MASK_POS       (C3_p0_PRBS_EADDR_MASK_POS),
         .C_p0_PRBS_SADDR_MASK_POS       (C3_p0_PRBS_SADDR_MASK_POS),
         .C_p1_BEGIN_ADDRESS             (C3_p1_BEGIN_ADDRESS),
         .C_p1_DATA_MODE                 (C3_p1_DATA_MODE),
         .C_p1_END_ADDRESS               (C3_p1_END_ADDRESS),
         .C_p1_PRBS_EADDR_MASK_POS       (C3_p1_PRBS_EADDR_MASK_POS),
         .C_p1_PRBS_SADDR_MASK_POS       (C3_p1_PRBS_SADDR_MASK_POS),
         .C_p2_BEGIN_ADDRESS             (C3_p2_BEGIN_ADDRESS),
         .C_p2_DATA_MODE                 (C3_p2_DATA_MODE),
         .C_p2_END_ADDRESS               (C3_p2_END_ADDRESS),
         .C_p2_PRBS_EADDR_MASK_POS       (C3_p2_PRBS_EADDR_MASK_POS),
         .C_p2_PRBS_SADDR_MASK_POS       (C3_p2_PRBS_SADDR_MASK_POS),
         .C_p3_BEGIN_ADDRESS             (C3_p3_BEGIN_ADDRESS),
         .C_p3_DATA_MODE                 (C3_p3_DATA_MODE),
         .C_p3_END_ADDRESS               (C3_p3_END_ADDRESS),
         .C_p3_PRBS_EADDR_MASK_POS       (C3_p3_PRBS_EADDR_MASK_POS),
         .C_p3_PRBS_SADDR_MASK_POS       (C3_p3_PRBS_SADDR_MASK_POS),
         .C_p4_BEGIN_ADDRESS             (C3_p4_BEGIN_ADDRESS),
         .C_p4_DATA_MODE                 (C3_p4_DATA_MODE),
         .C_p4_END_ADDRESS               (C3_p4_END_ADDRESS),
         .C_p4_PRBS_EADDR_MASK_POS       (C3_p4_PRBS_EADDR_MASK_POS),
         .C_p4_PRBS_SADDR_MASK_POS       (C3_p4_PRBS_SADDR_MASK_POS),
         .C_p5_BEGIN_ADDRESS             (C3_p5_BEGIN_ADDRESS),
         .C_p5_DATA_MODE                 (C3_p5_DATA_MODE),
         .C_p5_END_ADDRESS               (C3_p5_END_ADDRESS),
         .C_p5_PRBS_EADDR_MASK_POS       (C3_p5_PRBS_EADDR_MASK_POS),
         .C_p5_PRBS_SADDR_MASK_POS       (C3_p5_PRBS_SADDR_MASK_POS)
         )
      memc3_tb_top_inst
      (
         .error			                 (c3_error),
         .calib_done			         (c3_calib_done),
         .clk0			                 (c3_clk0),
         .rst0			                 (c3_rst0),
         .cmp_error			             (c3_cmp_error),
         .cmp_data_valid  	             (c3_cmp_data_valid),
         .cmp_data			             (c3_cmp_data),
         .vio_modify_enable              (c3_vio_modify_enable),
         .vio_data_mode_value            (c3_vio_data_mode_value),
         .vio_addr_mode_value            (c3_vio_addr_mode_value),
         .p0_error_status	             (c3_p0_error_status),
         .p1_error_status	             (c3_p1_error_status),
         .p2_error_status	             (c3_p2_error_status),
         .p3_error_status	             (c3_p3_error_status),
         .p4_error_status	             (c3_p4_error_status),
         .p5_error_status	             (c3_p5_error_status),
	 // The following port map shows that all the memory controller ports are connected
	 // to the test bench top. However, a traffic generator can be connected to the
	 // corresponding port only if the port is enabled, whose information can be obtained
	 // from the parameters C_PORT_ENABLE.
         // User Port-0 command interface will be active only when the port is enabled in
         // the port configurations Config-1, Config-2, Config-3, Config-4 and Config-5
         .p0_mcb_cmd_en                  (c3_p0_cmd_en),
         .p0_mcb_cmd_instr               (c3_p0_cmd_instr),
         .p0_mcb_cmd_bl                  (c3_p0_cmd_bl),
         .p0_mcb_cmd_addr                (c3_p0_cmd_byte_addr),
         .p0_mcb_cmd_full                (c3_p0_cmd_full),
         // User Port-0 data write interface will be active only when the port is enabled in
         // the port configurations Config-1, Config-2, Config-3, Config-4 and Config-5
         .p0_mcb_wr_en                   (c3_p0_wr_en),
         .p0_mcb_wr_mask                 (c3_p0_wr_mask),
         .p0_mcb_wr_data                 (c3_p0_wr_data),
         .p0_mcb_wr_full                 (c3_p0_wr_full),
         .p0_mcb_wr_fifo_counts          (c3_p0_wr_count),
         // User Port-0 data read interface will be active only when the port is enabled in
         // the port configurations Config-1, Config-2, Config-3, Config-4 and Config-5
         .p0_mcb_rd_en                   (c3_p0_rd_en),
         .p0_mcb_rd_data                 (c3_p0_rd_data),
         .p0_mcb_rd_empty                (c3_p0_rd_empty),
         .p0_mcb_rd_fifo_counts          (c3_p0_rd_count),
         // User Port-1 command interface will be active only when the port is enabled in
         // the port configurations Config-1, Config-2, Config-3 and Config-4
         .p1_mcb_cmd_en                  (c3_p1_cmd_en),
         .p1_mcb_cmd_instr               (c3_p1_cmd_instr),
         .p1_mcb_cmd_bl                  (c3_p1_cmd_bl),
         .p1_mcb_cmd_addr                (c3_p1_cmd_byte_addr),
         .p1_mcb_cmd_full                (c3_p1_cmd_full),
         // User Port-1 data write interface will be active only when the port is enabled in
         // the port configurations Config-1, Config-2, Config-3 and Config-4
         .p1_mcb_wr_en                   (c3_p1_wr_en),
         .p1_mcb_wr_mask                 (c3_p1_wr_mask),
         .p1_mcb_wr_data                 (c3_p1_wr_data),
         .p1_mcb_wr_full                 (c3_p1_wr_full),
         .p1_mcb_wr_fifo_counts          (c3_p1_wr_count),
         // User Port-1 data read interface will be active only when the port is enabled in
         // the port configurations Config-1, Config-2, Config-3 and Config-4
         .p1_mcb_rd_en                   (c3_p1_rd_en),
         .p1_mcb_rd_data                 (c3_p1_rd_data),
         .p1_mcb_rd_empty                (c3_p1_rd_empty),
         .p1_mcb_rd_fifo_counts          (c3_p1_rd_count),
         // User Port-2 command interface will be active only when the port is enabled in
         // the port configurations Config-1, Config-2 and Config-3
         .p2_mcb_cmd_en                  (c3_p2_cmd_en),
         .p2_mcb_cmd_instr               (c3_p2_cmd_instr),
         .p2_mcb_cmd_bl                  (c3_p2_cmd_bl),
         .p2_mcb_cmd_addr                (c3_p2_cmd_byte_addr),
         .p2_mcb_cmd_full                (c3_p2_cmd_full),
         // User Port-2 data write interface will be active only when the port is enabled in
         // the port configurations Config-1 write direction, Config-2 and Config-3
         .p2_mcb_wr_en                   (c3_p2_wr_en),
         .p2_mcb_wr_mask                 (c3_p2_wr_mask),
         .p2_mcb_wr_data                 (c3_p2_wr_data),
         .p2_mcb_wr_full                 (c3_p2_wr_full),
         .p2_mcb_wr_fifo_counts          (c3_p2_wr_count),
         // User Port-2 data read interface will be active only when the port is enabled in
         // the port configurations Config-1 read direction, Config-2 and Config-3
         .p2_mcb_rd_en                   (c3_p2_rd_en),
         .p2_mcb_rd_data                 (c3_p2_rd_data),
         .p2_mcb_rd_empty                (c3_p2_rd_empty),
         .p2_mcb_rd_fifo_counts          (c3_p2_rd_count),
         // User Port-3 command interface will be active only when the port is enabled in
         // the port configurations Config-1 and Config-2
         .p3_mcb_cmd_en                  (c3_p3_cmd_en),
         .p3_mcb_cmd_instr               (c3_p3_cmd_instr),
         .p3_mcb_cmd_bl                  (c3_p3_cmd_bl),
         .p3_mcb_cmd_addr                (c3_p3_cmd_byte_addr),
         .p3_mcb_cmd_full                (c3_p3_cmd_full),
         // User Port-3 data write interface will be active only when the port is enabled in
         // the port configurations Config-1 write direction and Config-2
         .p3_mcb_wr_en                   (c3_p3_wr_en),
         .p3_mcb_wr_mask                 (c3_p3_wr_mask),
         .p3_mcb_wr_data                 (c3_p3_wr_data),
         .p3_mcb_wr_full                 (c3_p3_wr_full),
         .p3_mcb_wr_fifo_counts          (c3_p3_wr_count),
         // User Port-3 data read interface will be active only when the port is enabled in
         // the port configurations Config-1 read direction and Config-2
         .p3_mcb_rd_en                   (c3_p3_rd_en),
         .p3_mcb_rd_data                 (c3_p3_rd_data),
         .p3_mcb_rd_empty                (c3_p3_rd_empty),
         .p3_mcb_rd_fifo_counts          (c3_p3_rd_count),
         // User Port-4 command interface will be active only when the port is enabled in
         // the port configuration Config-1
         .p4_mcb_cmd_en                  (c3_p4_cmd_en),
         .p4_mcb_cmd_instr               (c3_p4_cmd_instr),
         .p4_mcb_cmd_bl                  (c3_p4_cmd_bl),
         .p4_mcb_cmd_addr                (c3_p4_cmd_byte_addr),
         .p4_mcb_cmd_full                (c3_p4_cmd_full),
         // User Port-4 data write interface will be active only when the port is enabled in
         // the port configuration Config-1 write direction
         .p4_mcb_wr_en                   (c3_p4_wr_en),
         .p4_mcb_wr_mask                 (c3_p4_wr_mask),
         .p4_mcb_wr_data                 (c3_p4_wr_data),
         .p4_mcb_wr_full                 (c3_p4_wr_full),
         .p4_mcb_wr_fifo_counts          (c3_p4_wr_count),
         // User Port-4 data read interface will be active only when the port is enabled in
         // the port configuration Config-1 read direction
         .p4_mcb_rd_en                   (c3_p4_rd_en),
         .p4_mcb_rd_data                 (c3_p4_rd_data),
         .p4_mcb_rd_empty                (c3_p4_rd_empty),
         .p4_mcb_rd_fifo_counts          (c3_p4_rd_count),
         // User Port-5 command interface will be active only when the port is enabled in
         // the port configuration Config-1
         .p5_mcb_cmd_en                  (c3_p5_cmd_en),
         .p5_mcb_cmd_instr               (c3_p5_cmd_instr),
         .p5_mcb_cmd_bl                  (c3_p5_cmd_bl),
         .p5_mcb_cmd_addr                (c3_p5_cmd_byte_addr),
         .p5_mcb_cmd_full                (c3_p5_cmd_full),
         // User Port-5 data write interface will be active only when the port is enabled in
         // the port configuration Config-1 write direction
         .p5_mcb_wr_en                   (c3_p5_wr_en),
         .p5_mcb_wr_mask                 (c3_p5_wr_mask),
         .p5_mcb_wr_data                 (c3_p5_wr_data),
         .p5_mcb_wr_full                 (c3_p5_wr_full),
         .p5_mcb_wr_fifo_counts          (c3_p5_wr_count),
         // User Port-5 data read interface will be active only when the port is enabled in
         // the port configuration Config-1 read direction
         .p5_mcb_rd_en                   (c3_p5_rd_en),
         .p5_mcb_rd_data                 (c3_p5_rd_data),
         .p5_mcb_rd_empty                (c3_p5_rd_empty),
         .p5_mcb_rd_fifo_counts          (c3_p5_rd_count)
        );
// ========================================================================== //
// Memory model instances                                                     //
// ========================================================================== //
   generate
   if(C1_NUM_DQ_PINS == 16) begin : MEM_INST1
     ddr3_model_c1 u_mem_c1(
      .ck         (mcb1_dram_ck),
      .ck_n       (mcb1_dram_ck_n),
      .cke        (mcb1_dram_cke),
      .cs_n       (1'b0),
      .ras_n      (mcb1_dram_ras_n),
      .cas_n      (mcb1_dram_cas_n),
      .we_n       (mcb1_dram_we_n),
      .dm_tdqs    ({mcb1_dram_udm,mcb1_dram_dm}),
      .ba         (mcb1_dram_ba),
      .addr       (mcb1_dram_a),
      .dq         (mcb1_dram_dq),
      .dqs        ({mcb1_dram_udqs,mcb1_dram_dqs}),
      .dqs_n      ({mcb1_dram_udqs_n,mcb1_dram_dqs_n}),
      .tdqs_n     (),
      .odt        (mcb1_dram_odt),
      .rst_n      (mcb1_dram_reset_n)
      );
   end else begin
     ddr3_model_c1 u_mem_c1(
      .ck         (mcb1_dram_ck),
      .ck_n       (mcb1_dram_ck_n),
      .cke        (mcb1_dram_cke),
      .cs_n       (1'b0),
      .ras_n      (mcb1_dram_ras_n),
      .cas_n      (mcb1_dram_cas_n),
      .we_n       (mcb1_dram_we_n),
      .dm_tdqs    (mcb1_dram_dm),
      .ba         (mcb1_dram_ba),
      .addr       (mcb1_dram_a),
      .dq         (mcb1_dram_dq),
      .dqs        (mcb1_dram_dqs),
      .dqs_n      (mcb1_dram_dqs_n),
      .tdqs_n     (),
      .odt        (mcb1_dram_odt),
      .rst_n      (mcb1_dram_reset_n)
     );
  end
endgenerate
   generate
   if(C3_NUM_DQ_PINS == 16) begin : MEM_INST3
     ddr3_model_c3 u_mem_c3(
      .ck         (mcb3_dram_ck),
      .ck_n       (mcb3_dram_ck_n),
      .cke        (mcb3_dram_cke),
      .cs_n       (1'b0),
      .ras_n      (mcb3_dram_ras_n),
      .cas_n      (mcb3_dram_cas_n),
      .we_n       (mcb3_dram_we_n),
      .dm_tdqs    ({mcb3_dram_udm,mcb3_dram_dm}),
      .ba         (mcb3_dram_ba),
      .addr       (mcb3_dram_a),
      .dq         (mcb3_dram_dq),
      .dqs        ({mcb3_dram_udqs,mcb3_dram_dqs}),
      .dqs_n      ({mcb3_dram_udqs_n,mcb3_dram_dqs_n}),
      .tdqs_n     (),
      .odt        (mcb3_dram_odt),
      .rst_n      (mcb3_dram_reset_n)
      );
   end else begin
     ddr3_model_c3 u_mem_c3(
      .ck         (mcb3_dram_ck),
      .ck_n       (mcb3_dram_ck_n),
      .cke        (mcb3_dram_cke),
      .cs_n       (1'b0),
      .ras_n      (mcb3_dram_ras_n),
      .cas_n      (mcb3_dram_cas_n),
      .we_n       (mcb3_dram_we_n),
      .dm_tdqs    (mcb3_dram_dm),
      .ba         (mcb3_dram_ba),
      .addr       (mcb3_dram_a),
      .dq         (mcb3_dram_dq),
      .dqs        (mcb3_dram_dqs),
      .dqs_n      (mcb3_dram_dqs_n),
      .tdqs_n     (),
      .odt        (mcb3_dram_odt),
      .rst_n      (mcb3_dram_reset_n)
     );
  end
endgenerate
// ========================================================================== //
// Reporting the test case status
// ========================================================================== //
   initial
   begin : Logging
      fork
         begin : calibration_done
            wait (calib_done);
            $display("Calibration Done");
            #50000000;
            if (!error) begin
               $display("TEST PASSED");
            end
            else begin
               $display("TEST FAILED: DATA ERROR");
            end
            disable calib_not_done;
	    $finish;
         end
         begin : calib_not_done
            #200000000;
            if (!calib_done) begin
               $display("TEST FAILED: INITIALIZATION DID NOT COMPLETE");
            end
            disable calibration_done;
	    $finish;
         end
      join
   end
endmodule