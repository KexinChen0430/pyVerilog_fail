module instantiated below drives traffic (patterns)
// on the application interface of the memory controller
  assign app_wr_addr0 = tg_addr[ADDR_WIDTH-1:0];
  assign app_rd_addr0 = tg_addr[ADDR_WIDTH-1:0];
  mig_7series_v2_0_traffic_gen_top #
    (
     .TCQ                 (TCQ),
     .SIMULATION          (SIMULATION),
     .FAMILY              ("VIRTEX7"),
     .MEM_TYPE            (MEM_TYPE),
     //.BL_WIDTH            (BL_WIDTH),
     .nCK_PER_CLK         (nCK_PER_CLK),
     .NUM_DQ_PINS         (DATA_WIDTH),
     .MEM_BURST_LEN       (BURST_LEN),
     .PORT_MODE           (PORT_MODE),
     .DATA_PATTERN        (DATA_PATTERN),
     .CMD_PATTERN         (CMD_PATTERN),
     .DATA_WIDTH          (APP_DATA_WIDTH),
     .ADDR_WIDTH          (ADDR_WIDTH),
     .DATA_MODE           (DATA_MODE),
     .BEGIN_ADDRESS       (BEGIN_ADDRESS),
     .END_ADDRESS         (END_ADDRESS),
     .PRBS_EADDR_MASK_POS (PRBS_EADDR_MASK_POS),
     .CMD_WDT             (CMD_WDT),
     .RD_WDT              (RD_WDT),
     .WR_WDT              (WR_WDT),
     .EYE_TEST            (EYE_TEST)
     )
    u_traffic_gen_top
      (
       .clk                  (clk),
       .rst                  (rst_clk),
       .tg_only_rst          (rst_clk),
       .manual_clear_error   (dbg_clear_error),
       .memc_init_done       (init_calib_complete),
       .memc_cmd_full        (1'b0),
       .memc_cmd_en          (),
       .memc_cmd_instr       (),
       .memc_cmd_bl          (),
       .memc_cmd_addr        (tg_addr[31:0]),
       .memc_wr_en           (),
       .memc_wr_end          (),
       .memc_wr_mask         (),
       .memc_wr_data         (app_wr_data0),
       .memc_wr_full         (1'b0),
       .memc_rd_en           (),
       .memc_rd_data         (app_rd_data0),
       .memc_rd_empty        (~app_rd_valid0),
       .qdr_wr_cmd_o         (app_wr_cmd0),
       .qdr_rd_cmd_o         (app_rd_cmd0),
       .vio_pause_traffic    (vio_pause_traffic),
       .vio_modify_enable    (vio_modify_enable),
       .vio_data_mode_value  (vio_data_mode_value),
       .vio_addr_mode_value  (vio_addr_mode_value),
       .vio_instr_mode_value (vio_instr_mode_value),
       .vio_bl_mode_value    (vio_bl_mode_value),
       .vio_fixed_bl_value   (vio_fixed_bl_value),
       .vio_fixed_instr_value(vio_fixed_instr_value),
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
       .wdt_en_i             (1'b1),
       .bram_cmd_i           (39'b0),
       .bram_valid_i         (1'b0),
       .bram_rdy_o           (),
       .cmp_data             (cmp_data),
       .cmp_data_valid       (),
       .cmp_error            (dbg_cmp_err),
       .wr_data_counts       (wr_data_counts),
       .rd_data_counts       (rd_data_counts),
       .cumlative_dq_lane_error (),
       .cmd_wdt_err_o        (),
       .wr_wdt_err_o         (),
       .rd_wdt_err_o         (),
       .mem_pattern_init_done(),
       .error                (tg_compare_error),
       .error_status         ()
       );
   // Default values are assigned to the debug inputs of the traffic
   // generator
   assign vio_modify_enable     = 1'b0;
   assign vio_data_mode_value   = 4'b0010;
   assign vio_addr_mode_value   = 3'b011;
   assign vio_instr_mode_value  = 4'b0010;
   assign vio_bl_mode_value     = 2'b10;
   assign vio_fixed_bl_value    = 8'd32;
   assign vio_data_mask_gen     = 1'b0;
   assign vio_pause_traffic     = 1'b0;
   assign vio_fixed_instr_value = 3'b001;
   assign dbg_clear_error       = 1'b0;
endmodule