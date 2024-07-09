module instantiated below drives traffic (patterns)
// on the application interface of the memory controller
  traffic_gen_top #
    (
     .TCQ                 (TCQ),
     .SIMULATION          (SIMULATION),
     .FAMILY              ("VIRTEX7"),
     .BL_WIDTH            (BL_WIDTH),
     .nCK_PER_CLK         (nCK_PER_CLK),
     .NUM_DQ_PINS         (DQ_WIDTH),
     .MEM_BURST_LEN       (BURST_LENGTH),
     .MEM_COL_WIDTH       (COL_WIDTH),
     .PORT_MODE           (PORT_MODE),
     .DATA_PATTERN        (DATA_PATTERN),
     .CMD_PATTERN         (CMD_PATTERN),
     .DATA_WIDTH          (APP_DATA_WIDTH),
     .ADDR_WIDTH          (ADDR_WIDTH),
     .MASK_SIZE           (MASK_SIZE),
     .BEGIN_ADDRESS       (BEGIN_ADDRESS),
     .DATA_MODE           (DATA_MODE),
     .END_ADDRESS         (END_ADDRESS),
     .PRBS_EADDR_MASK_POS (PRBS_EADDR_MASK_POS),
     .SEL_VICTIM_LINE     (SEL_VICTIM_LINE),
     .EYE_TEST            (EYE_TEST)
     )
    u_traffic_gen_top
      (
       .clk                  (clk),
       .rst                  (rst),
       .manual_clear_error   (manual_clear_error),
       .memc_init_done       (init_calib_complete),
       .memc_cmd_full        (~app_rdy),
       .memc_cmd_en          (app_en),
       .memc_cmd_instr       (app_cmd),
       .memc_cmd_bl          (),
       .memc_cmd_addr        (app_addr),
       .memc_wr_en           (app_wdf_wren),
       .memc_wr_end          (app_wdf_end),
       .memc_wr_mask         (app_wdf_mask),
       .memc_wr_data         (app_wdf_data),
       .memc_wr_full         (~app_wdf_rdy),
       .memc_rd_en           (),
       .memc_rd_data         (app_rd_data),
       .memc_rd_empty        (~app_rd_data_valid),
       .vio_modify_enable    (vio_modify_enable),
       .vio_data_mode_value  (vio_data_mode_value),
       .vio_addr_mode_value  (vio_addr_mode_value),
       .vio_instr_mode_value (vio_instr_mode_value),
       .vio_bl_mode_value    (vio_bl_mode_value),
       .vio_fixed_bl_value   (vio_fixed_bl_value),
       .vio_data_mask_gen    (vio_data_mask_gen),
       .fixed_addr_i         (32'b0),
       .fixed_data_i         (32'b0),
       .simple_data0         (32'b0),
       .simple_data1         (32'b0),
       .simple_data2         (32'b0),
       .simple_data3         (32'b0),
       .simple_data4         (32'b0),
       .simple_data5         (32'b0),
       .simple_data6         (32'b0),
       .simple_data7         (32'b0),
       .bram_cmd_i           (39'b0),
       .bram_valid_i         (1'b0),
       .bram_rdy_o           (),
       .cmp_data             (cmp_data),
       .cmp_data_valid       (cmp_data_valid),
       .cmp_error            (cmp_error),
       .error                (error),
       .error_status         (error_status)
       );
  assign vio_modify_enable    = 1'b1;
  assign vio_data_mode_value  = 4'b0010;
  assign vio_addr_mode_value  = 3'b011;
  assign vio_instr_mode_value = 4'b0010;
  assign vio_bl_mode_value    = 2'b10;
  assign vio_fixed_bl_value   = 16;
  assign vio_data_mask_gen    = 1'b0;
endmodule