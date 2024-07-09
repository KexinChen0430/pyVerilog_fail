module instantiated below drives traffic (patterns)
// on the application interface of the memory controller
  mig_7series_v4_0_traffic_gen_top #
    (
     .TCQ                 (TCQ),
     .SIMULATION          (SIMULATION),
     .FAMILY              ("VIRTEX7"),
     .MEM_TYPE            (DRAM_TYPE),
     .TST_MEM_INSTR_MODE  (TST_MEM_INSTR_MODE),
     //.BL_WIDTH            (BL_WIDTH),
     .nCK_PER_CLK         (nCK_PER_CLK),
     .NUM_DQ_PINS         (PAYLOAD_WIDTH),
     .MEM_BURST_LEN       (BURST_LENGTH),
     .MEM_COL_WIDTH       (COL_WIDTH),
     .PORT_MODE           (PORT_MODE),
     .DATA_PATTERN        (DATA_PATTERN),
     .CMD_PATTERN         (CMD_PATTERN),
     .DATA_WIDTH          (APP_DATA_WIDTH),
     .ADDR_WIDTH          (TG_ADDR_WIDTH),
     .MASK_SIZE           (MASK_SIZE),
     .BEGIN_ADDRESS       (BEGIN_ADDRESS),
     .DATA_MODE           (DATA_MODE),
     .END_ADDRESS         (END_ADDRESS),
     .PRBS_EADDR_MASK_POS (PRBS_EADDR_MASK_POS),
     .SEL_VICTIM_LINE     (SEL_VICTIM_LINE),
     .CMD_WDT             (CMD_WDT),
     .RD_WDT              (RD_WDT),
     .WR_WDT              (WR_WDT),
     .EYE_TEST            (EYE_TEST)
     )
    u_traffic_gen_top
      (
       .clk                  (clk),
       .rst                  (rst),
       .tg_only_rst          (po_win_tg_rst | vio_tg_rst),
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
       .qdr_wr_cmd_o         (),
       .qdr_rd_cmd_o         (),
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
       .wdt_en_i             (wdt_en_w),
       .bram_cmd_i           (39'b0),
       .bram_valid_i         (1'b0),
       .bram_rdy_o           (),
       .cmp_data             (cmp_data),
       .cmp_data_valid       (cmp_data_valid),
       .cmp_error            (cmp_error),
       .wr_data_counts       (tg_wr_data_counts),
       .rd_data_counts       (tg_rd_data_counts),
       .dq_error_bytelane_cmp (dq_error_bytelane_cmp),
       .error                (tg_compare_error),
       .error_status         (error_status),
       .cumlative_dq_lane_error (cumlative_dq_lane_error),
       .cmd_wdt_err_o         (cmd_wdt_err_w),
       .wr_wdt_err_o          (wr_wdt_err_w),
       .rd_wdt_err_o          (rd_wdt_err_w),
       .mem_pattern_init_done   (mem_pattern_init_done)
       );
   // Default values are assigned to the debug inputs of the traffic
   // generator
   assign vio_modify_enable     = 1'b0;
   assign vio_data_mode_value   = 4'b0010;
   assign vio_addr_mode_value   = 3'b011;
   assign vio_instr_mode_value  = 4'b0010;
   assign vio_bl_mode_value     = 2'b10;
   assign vio_fixed_bl_value    = 8'd16;
   assign vio_data_mask_gen     = 1'b0;
   assign vio_pause_traffic     = 1'b0;
   assign vio_fixed_instr_value = 3'b001;
   assign dbg_clear_error       = 1'b0;
   assign po_win_tg_rst         = 1'b0;
   assign vio_tg_rst            = 1'b0;
   assign wdt_en_w              = 1'b1;
   assign dbg_sel_pi_incdec       = 'b0;
   assign dbg_sel_po_incdec       = 'b0;
   assign dbg_pi_f_inc            = 'b0;
   assign dbg_pi_f_dec            = 'b0;
   assign dbg_po_f_inc            = 'b0;
   assign dbg_po_f_dec            = 'b0;
   assign dbg_po_f_stg23_sel      = 'b0;
`ifdef SKIP_CALIB
  // Skip calib test logic
  reg[3*DQS_WIDTH-1:0]        po_coarse_tap;
  reg[6*DQS_WIDTH-1:0]        po_stg3_taps;
  reg[6*DQS_WIDTH-1:0]        po_stg2_taps;
  reg[6*DQS_WIDTH-1:0]        pi_stg2_taps;
  reg[5*DQS_WIDTH-1:0]        idelay_taps;
  reg[11:0]                   cal_device_temp;
  always @(posedge clk) begin
    // tap values from golden run (factory)
    po_coarse_tap   <= #TCQ 'h2;
    po_stg3_taps    <= #TCQ 'h0D;
    po_stg2_taps    <= #TCQ 'h1D;
    pi_stg2_taps    <= #TCQ 'h1E;
    idelay_taps     <= #TCQ 'h08;
        cal_device_temp <= #TCQ 'h000;
  end
  always @(posedge clk) begin
    if (rst)
      calib_tap_load <= #TCQ 1'b0;
    else if (calib_tap_req)
      calib_tap_load <= #TCQ 1'b1;
  end
  always @(posedge clk) begin
    if (rst) begin
      calib_tap_addr      <= #TCQ 'd0;
      calib_tap_val       <= #TCQ po_coarse_tap[3*calib_tap_addr[6:3]+:3]; //'d1;
      calib_tap_load_done <= #TCQ 1'b0;
    end else if (calib_tap_load) begin
      case (calib_tap_addr[2:0])
        3'b000: begin
          calib_tap_addr[2:0] <= #TCQ 3'b001;
          calib_tap_val       <= #TCQ po_stg3_taps[6*calib_tap_addr[6:3]+:6]; //'d19;
        end
        3'b001: begin
          calib_tap_addr[2:0] <= #TCQ 3'b010;
          calib_tap_val       <= #TCQ po_stg2_taps[6*calib_tap_addr[6:3]+:6]; //'d45;
        end
        3'b010: begin
          calib_tap_addr[2:0] <= #TCQ 3'b011;
          calib_tap_val       <= #TCQ pi_stg2_taps[6*calib_tap_addr[6:3]+:6]; //'d20;
        end
        3'b011: begin
          calib_tap_addr[2:0] <= #TCQ 3'b100;
          calib_tap_val       <= #TCQ idelay_taps[5*calib_tap_addr[6:3]+:5]; //'d1;
        end
        3'b100: begin
          if (calib_tap_addr[6:3] < DQS_WIDTH-1) begin
            calib_tap_addr[2:0] <= #TCQ 3'b000;
            calib_tap_val       <= #TCQ po_coarse_tap[3*(calib_tap_addr[6:3]+1)+:3]; //'d1;
            calib_tap_addr[6:3] <= #TCQ calib_tap_addr[6:3] + 1;
          end else begin
            calib_tap_addr[2:0] <= #TCQ 3'b110;
            calib_tap_val       <= #TCQ cal_device_temp[7:0];
            calib_tap_addr[6:3] <= #TCQ 4'b1111;
          end
        end
        3'b110: begin
            calib_tap_addr[2:0] <= #TCQ 3'b111;
            calib_tap_val       <= #TCQ {4'h0,cal_device_temp[11:8]};
            calib_tap_addr[6:3] <= #TCQ 4'b1111;
        end
        3'b111: begin
            calib_tap_load_done <= #TCQ 1'b1;
        end
      endcase
    end
  end
`endif
endmodule