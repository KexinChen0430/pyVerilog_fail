module BUFR (O, CE, CLR, I);
//BUFR #(.BUFR_DIVIDE ("1")) rclk_buf(.I(rclk_), .O(rclk), .CE (1'b1), .CLR (pi_iserdes_rst));
BUFIO rclk_buf(.I(rclk_), .O(rclk) );
if ( BYTE_LANES[0] ) begin : byte_lane_A
  assign phy_dout_remap[79:0] = part_select_80(phy_dout, (LANE_REMAP[1:0]));
  byte_lane#(
     .ABCD                   ("A"),
     .PO_DATA_CTL            (PC_DATA_CTL_N[0] ? "TRUE" : "FALSE"),
     .BITLANES               (BITLANES[11:0]),
     .BITLANES_OUTONLY       (BITLANES_OUTONLY[11:0]),
     .OF_ALMOST_EMPTY_VALUE  (OF_ALMOST_EMPTY_VALUE),
     .OF_ALMOST_FULL_VALUE   (OF_ALMOST_FULL_VALUE),
     .OF_SYNCHRONOUS_MODE    (OF_SYNCHRONOUS_MODE),
     //.OF_OUTPUT_DISABLE      (OF_OUTPUT_DISABLE),
     //.OF_ARRAY_MODE          (A_OF_ARRAY_MODE),
     //.IF_ARRAY_MODE          (IF_ARRAY_MODE),
     .IF_ALMOST_EMPTY_VALUE  (IF_ALMOST_EMPTY_VALUE),
     .IF_ALMOST_FULL_VALUE   (IF_ALMOST_FULL_VALUE),
     .IF_SYNCHRONOUS_MODE    (IF_SYNCHRONOUS_MODE),
     .DIFFERENTIAL_DQS       (DIFFERENTIAL_DQS),
     .GENERATE_DDR_CK        (GENERATE_DDR_CK),
     .NUM_DDR_CK             (NUM_DDR_CK),
     .RCLK_SELECT_LANE       (RCLK_SELECT_LANE),
     .TCK                    (TCK),
     .MC_DIVIDE              (MC_DIVIDE),
     .PI_BURST_MODE          (A_PI_BURST_MODE),
     .PI_CLKOUT_DIV          (A_PI_CLKOUT_DIV),
     .PI_FREQ_REF_DIV        (A_PI_FREQ_REF_DIV),
     .PI_FINE_DELAY          (A_PI_FINE_DELAY),
     .PI_OUTPUT_CLK_SRC      (A_PI_OUTPUT_CLK_SRC),
     .PI_SYNC_IN_DIV_RST     (A_PI_SYNC_IN_DIV_RST),
     .PO_CLKOUT_DIV          (A_PO_CLKOUT_DIV),
     .PO_FINE_DELAY          (A_PO_FINE_DELAY),
     .PO_COARSE_BYPASS       (A_PO_COARSE_BYPASS),
     .PO_COARSE_DELAY        (A_PO_COARSE_DELAY),
     .PO_OCLK_DELAY          (A_PO_OCLK_DELAY),
     .PO_OCLKDELAY_INV       (A_PO_OCLKDELAY_INV),
     .PO_OUTPUT_CLK_SRC      (A_PO_OUTPUT_CLK_SRC),
     .PO_SYNC_IN_DIV_RST     (A_PO_SYNC_IN_DIV_RST),
//     .OSERDES_DATA_RATE      (A_OS_DATA_RATE),
//     .OSERDES_DATA_WIDTH     (A_OS_DATA_WIDTH),
     .IDELAYE2_IDELAY_TYPE   (A_IDELAYE2_IDELAY_TYPE),
     .IDELAYE2_IDELAY_VALUE  (A_IDELAYE2_IDELAY_VALUE),
     .IODELAY_GRP            (IODELAY_GRP)
     )
   byte_lane_A(
      .mem_dq_out            (mem_dq_out[11:0]),
      .mem_dq_ts             (mem_dq_ts[11:0]),
      .mem_dq_in             (mem_dq_in[9:0]),
      .mem_dqs_out           (mem_dqs_out[0]),
      .mem_dqs_ts            (mem_dqs_ts[0]),
      .mem_dqs_in            (mem_dqs_in[0]),
      .rst                   (rst_primitives),
      .phy_clk               (phy_clk),
      .freq_refclk           (freq_refclk),
      .mem_refclk            (mem_refclk),
      .idelayctrl_refclk     (idelayctrl_refclk),
      .sync_pulse            (sync_pulse),
      .ddr_ck_out            (A_ddr_clk),
      .rclk                  (A_rclk),
      .pi_dqs_found          (A_pi_dqs_found),
      .dqs_out_of_range      (A_pi_dqs_out_of_range),
      .if_a_empty            (A_if_a_empty),
      .if_empty              (A_if_empty),
      .if_a_full             (if_a_full),
      .if_full               (A_if_full),
      .of_a_empty            (of_a_empty),
      .of_empty              (A_of_empty),
      .of_a_full             (A_of_a_full),
      .of_full               (A_of_full),
      .phy_din               (phy_din_remap[79:0]),
      .phy_dout              (phy_dout_remap[79:0]),
      .phy_cmd_wr_en         (phy_cmd_wr_en),
      .phy_data_wr_en        (phy_data_wr_en),
      .phy_rd_en             (phy_rd_en),
      .phaser_ctl_bus        (phaser_ctl_bus),
// calibration signals
      .idelay_inc            (idelay_inc),
      .idelay_ce             (A_idelay_ce),
      .idelay_ld             (idelay_ld),
      .pi_rst_dqs_find       (pi_rst_dqs_find),
      .po_en_calib           (phy_encalib),
      .po_fine_enable        (A_po_fine_enable),
      .po_coarse_enable      (A_po_coarse_enable),
      .po_fine_inc           (A_po_fine_inc),
      .po_coarse_inc         (A_po_coarse_inc),
      .po_counter_load_en    (A_po_counter_load_en),
      .po_counter_read_en    (A_po_counter_read_en),
      .po_counter_load_val   (A_po_counter_load_val),
      .po_coarse_overflow    (A_po_coarse_overflow),
      .po_fine_overflow      (A_po_fine_overflow),
      .po_counter_read_val   (A_po_counter_read_val),
      .po_sel_fine_oclk_delay(A_po_sel_fine_oclk_delay),
      .pi_en_calib           (phy_encalib),
      .pi_fine_enable        (A_pi_fine_enable),
      .pi_fine_inc           (A_pi_fine_inc),
      .pi_counter_load_en    (A_pi_counter_load_en),
      .pi_counter_read_en    (A_pi_counter_read_en),
      .pi_counter_load_val   (A_pi_counter_load_val),
      .pi_fine_overflow      (A_pi_fine_overflow),
      .pi_counter_read_val   (A_pi_counter_read_val),
      .pi_iserdes_rst        (A_pi_iserdes_rst),
      .pi_phase_locked       (A_pi_phase_locked)
);
end
else begin : no_byte_lane_A
       assign A_of_a_full = 1'b0;
       assign A_of_full = 1'b0;
       assign A_if_empty = 1'b0;
       assign A_if_a_empty = 1'b0;
       assign A_pi_phase_locked = 1;
       assign A_pi_dqs_found     = 1;
       assign A_rclk = 0;
       assign A_pi_counter_read_val = 0;
       assign A_po_counter_read_val = 0;
       assign A_pi_fine_overflow    = 0;
       assign A_po_coarse_overflow  = 0;
       assign A_po_fine_overflow    = 0;
end
if ( BYTE_LANES[1] ) begin : byte_lane_B
  assign phy_dout_remap[159:80] = part_select_80(phy_dout, (LANE_REMAP[5:4]));
  byte_lane#(
     .ABCD                   ("B"),
     .PO_DATA_CTL            (PC_DATA_CTL_N[1] ? "TRUE" : "FALSE"),
     .BITLANES               (BITLANES[23:12]),
     .BITLANES_OUTONLY       (BITLANES_OUTONLY[23:12]),
     .OF_ALMOST_EMPTY_VALUE  (OF_ALMOST_EMPTY_VALUE),
     .OF_ALMOST_FULL_VALUE   (OF_ALMOST_FULL_VALUE),
     .OF_SYNCHRONOUS_MODE    (OF_SYNCHRONOUS_MODE),
     //.OF_OUTPUT_DISABLE      (OF_OUTPUT_DISABLE),
     //.OF_ARRAY_MODE          (B_OF_ARRAY_MODE),
     //.IF_ARRAY_MODE          (IF_ARRAY_MODE),
     .IF_ALMOST_EMPTY_VALUE  (IF_ALMOST_EMPTY_VALUE),
     .IF_ALMOST_FULL_VALUE   (IF_ALMOST_FULL_VALUE),
     .IF_SYNCHRONOUS_MODE    (IF_SYNCHRONOUS_MODE),
     .DIFFERENTIAL_DQS       (DIFFERENTIAL_DQS),
     .GENERATE_DDR_CK        (GENERATE_DDR_CK),
     .NUM_DDR_CK             (NUM_DDR_CK),
     .RCLK_SELECT_LANE       (RCLK_SELECT_LANE),
     .TCK                    (TCK),
     .MC_DIVIDE              (MC_DIVIDE),
     .PI_BURST_MODE          (B_PI_BURST_MODE),
     .PI_CLKOUT_DIV          (B_PI_CLKOUT_DIV),
     .PI_FREQ_REF_DIV        (B_PI_FREQ_REF_DIV),
     .PI_FINE_DELAY          (B_PI_FINE_DELAY),
     .PI_OUTPUT_CLK_SRC      (B_PI_OUTPUT_CLK_SRC),
     .PI_SYNC_IN_DIV_RST     (B_PI_SYNC_IN_DIV_RST),
     .PO_CLKOUT_DIV          (B_PO_CLKOUT_DIV),
     .PO_FINE_DELAY          (B_PO_FINE_DELAY),
     .PO_COARSE_BYPASS       (B_PO_COARSE_BYPASS),
     .PO_COARSE_DELAY        (B_PO_COARSE_DELAY),
     .PO_OCLK_DELAY          (B_PO_OCLK_DELAY),
     .PO_OCLKDELAY_INV       (B_PO_OCLKDELAY_INV),
     .PO_OUTPUT_CLK_SRC      (B_PO_OUTPUT_CLK_SRC),
     .PO_SYNC_IN_DIV_RST     (B_PO_SYNC_IN_DIV_RST),
     .OSERDES_DATA_RATE      (B_OS_DATA_RATE),
     .OSERDES_DATA_WIDTH     (B_OS_DATA_WIDTH),
     .IDELAYE2_IDELAY_TYPE   (B_IDELAYE2_IDELAY_TYPE),
     .IDELAYE2_IDELAY_VALUE  (B_IDELAYE2_IDELAY_VALUE),
     .IODELAY_GRP            (IODELAY_GRP)
     )
   byte_lane_B(
      .mem_dq_out            (mem_dq_out[23:12]),
      .mem_dq_ts             (mem_dq_ts[23:12]),
      .mem_dq_in             (mem_dq_in[19:10]),
      .mem_dqs_out           (mem_dqs_out[1]),
      .mem_dqs_ts            (mem_dqs_ts[1]),
      .mem_dqs_in            (mem_dqs_in[1]),
      .rst                   (rst_primitives),
      .phy_clk               (phy_clk),
      .freq_refclk           (freq_refclk),
      .mem_refclk            (mem_refclk),
      .idelayctrl_refclk     (idelayctrl_refclk),
      .sync_pulse            (sync_pulse),
      .ddr_ck_out            (B_ddr_clk),
      .rclk                  (B_rclk),
      .pi_dqs_found          (B_pi_dqs_found),
      .dqs_out_of_range      (B_pi_dqs_out_of_range),
      .if_a_empty            (B_if_a_empty),
      .if_empty              (B_if_empty),
      .if_a_full             (/*if_a_full*/),
      .if_full               (B_if_full),
      .of_a_empty            (/*of_a_empty*/),
      .of_empty              (B_of_empty),
      .of_a_full             (B_of_a_full),
      .of_full               (B_of_full),
      .phy_din               (phy_din_remap[159:80]),
      .phy_dout              (phy_dout_remap[159:80]),
      .phy_cmd_wr_en         (phy_cmd_wr_en),
      .phy_data_wr_en        (phy_data_wr_en),
      .phy_rd_en             (phy_rd_en),
      .phaser_ctl_bus        (phaser_ctl_bus),
// calibration signals
      .idelay_inc            (idelay_inc),
      .idelay_ce             (B_idelay_ce),
      .idelay_ld             (idelay_ld),
      .pi_rst_dqs_find       (pi_rst_dqs_find),
      .po_en_calib           (phy_encalib),
      .po_fine_enable        (B_po_fine_enable),
      .po_coarse_enable      (B_po_coarse_enable),
      .po_fine_inc           (B_po_fine_inc),
      .po_coarse_inc         (B_po_coarse_inc),
      .po_counter_load_en    (B_po_counter_load_en),
      .po_counter_read_en    (B_po_counter_read_en),
      .po_counter_load_val   (B_po_counter_load_val),
      .po_coarse_overflow    (B_po_coarse_overflow),
      .po_fine_overflow      (B_po_fine_overflow),
      .po_counter_read_val   (B_po_counter_read_val),
      .po_sel_fine_oclk_delay(B_po_sel_fine_oclk_delay),
      .pi_en_calib           (phy_encalib),
      .pi_fine_enable        (B_pi_fine_enable),
      .pi_fine_inc           (B_pi_fine_inc),
      .pi_counter_load_en    (B_pi_counter_load_en),
      .pi_counter_read_en    (B_pi_counter_read_en),
      .pi_counter_load_val   (B_pi_counter_load_val),
      .pi_fine_overflow      (B_pi_fine_overflow),
      .pi_counter_read_val   (B_pi_counter_read_val),
      .pi_iserdes_rst        (B_pi_iserdes_rst),
      .pi_phase_locked       (B_pi_phase_locked)
);
end
else begin : no_byte_lane_B
       assign B_of_a_full = 1'b0;
       assign B_of_full = 1'b0;
       assign B_if_empty = 1'b0;
       assign B_if_a_empty = 1'b0;
       assign B_pi_phase_locked = 1;
       assign B_pi_dqs_found     = 1;
       assign B_rclk = 0;
       assign B_pi_counter_read_val = 0;
       assign B_po_counter_read_val = 0;
       assign B_pi_fine_overflow    = 0;
       assign B_po_coarse_overflow = 0;
       assign B_po_fine_overflow   = 0;
end
if ( BYTE_LANES[2] ) begin : byte_lane_C
  assign phy_dout_remap[239:160] = part_select_80(phy_dout, (LANE_REMAP[9:8]));
  byte_lane#(
     .ABCD                   ("C"),
     .PO_DATA_CTL            (PC_DATA_CTL_N[2] ? "TRUE" : "FALSE"),
     .BITLANES               (BITLANES[35:24]),
     .BITLANES_OUTONLY       (BITLANES_OUTONLY[35:24]),
     .OF_ALMOST_EMPTY_VALUE  (OF_ALMOST_EMPTY_VALUE),
     .OF_ALMOST_FULL_VALUE   (OF_ALMOST_FULL_VALUE),
     .OF_SYNCHRONOUS_MODE    (OF_SYNCHRONOUS_MODE),
     //.OF_OUTPUT_DISABLE      (OF_OUTPUT_DISABLE),
     //.OF_ARRAY_MODE          (C_OF_ARRAY_MODE),
     //.IF_ARRAY_MODE          (IF_ARRAY_MODE),
     .IF_ALMOST_EMPTY_VALUE  (IF_ALMOST_EMPTY_VALUE),
     .IF_ALMOST_FULL_VALUE   (IF_ALMOST_FULL_VALUE),
     .IF_SYNCHRONOUS_MODE    (IF_SYNCHRONOUS_MODE),
     .DIFFERENTIAL_DQS       (DIFFERENTIAL_DQS),
     .GENERATE_DDR_CK        (GENERATE_DDR_CK),
     .NUM_DDR_CK             (NUM_DDR_CK),
     .RCLK_SELECT_LANE       (RCLK_SELECT_LANE),
     .TCK                    (TCK),
     .MC_DIVIDE              (MC_DIVIDE),
     .PI_BURST_MODE          (C_PI_BURST_MODE),
     .PI_CLKOUT_DIV          (C_PI_CLKOUT_DIV),
     .PI_FREQ_REF_DIV        (C_PI_FREQ_REF_DIV),
     .PI_FINE_DELAY          (C_PI_FINE_DELAY),
     .PI_OUTPUT_CLK_SRC      (C_PI_OUTPUT_CLK_SRC),
     .PI_SYNC_IN_DIV_RST     (C_PI_SYNC_IN_DIV_RST),
     .PO_CLKOUT_DIV          (C_PO_CLKOUT_DIV),
     .PO_FINE_DELAY          (C_PO_FINE_DELAY),
     .PO_COARSE_BYPASS       (C_PO_COARSE_BYPASS),
     .PO_COARSE_DELAY        (C_PO_COARSE_DELAY),
     .PO_OCLK_DELAY          (C_PO_OCLK_DELAY),
     .PO_OCLKDELAY_INV       (C_PO_OCLKDELAY_INV),
     .PO_OUTPUT_CLK_SRC      (C_PO_OUTPUT_CLK_SRC),
     .PO_SYNC_IN_DIV_RST     (C_PO_SYNC_IN_DIV_RST),
     .OSERDES_DATA_RATE      (C_OS_DATA_RATE),
     .OSERDES_DATA_WIDTH     (C_OS_DATA_WIDTH),
     .IDELAYE2_IDELAY_TYPE   (C_IDELAYE2_IDELAY_TYPE),
     .IDELAYE2_IDELAY_VALUE  (C_IDELAYE2_IDELAY_VALUE),
     .IODELAY_GRP            (IODELAY_GRP)
     )
   byte_lane_C(
      .mem_dq_out            (mem_dq_out[35:24]),
      .mem_dq_ts             (mem_dq_ts[35:24]),
      .mem_dq_in             (mem_dq_in[29:20]),
      .mem_dqs_out           (mem_dqs_out[2]),
      .mem_dqs_ts            (mem_dqs_ts[2]),
      .mem_dqs_in            (mem_dqs_in[2]),
      .rst                   (rst_primitives),
      .phy_clk               (phy_clk),
      .freq_refclk           (freq_refclk),
      .mem_refclk            (mem_refclk),
      .idelayctrl_refclk     (idelayctrl_refclk),
      .sync_pulse            (sync_pulse),
      .ddr_ck_out            (C_ddr_clk),
      .rclk                  (C_rclk),
      .pi_dqs_found          (C_pi_dqs_found),
      .dqs_out_of_range      (C_pi_dqs_out_of_range),
      .if_a_empty            (C_if_a_empty),
      .if_empty              (C_if_empty),
      .if_a_full             (/*if_a_full*/),
      .if_full               (C_if_full),
      .of_a_empty            (/*of_a_empty*/),
      .of_empty              (C_of_empty),
      .of_a_full             (C_of_a_full),
      .of_full               (C_of_full),
      .phy_din               (phy_din_remap[239:160]),
      .phy_dout              (phy_dout_remap[239:160]),
      .phy_cmd_wr_en         (phy_cmd_wr_en),
      .phy_data_wr_en        (phy_data_wr_en),
      .phy_rd_en             (phy_rd_en),
      .phaser_ctl_bus        (phaser_ctl_bus),
// calibration signals
      .idelay_inc            (idelay_inc),
      .idelay_ce             (C_idelay_ce),
      .idelay_ld             (idelay_ld),
      .pi_rst_dqs_find       (pi_rst_dqs_find),
      .po_en_calib           (phy_encalib),
      .po_fine_enable        (C_po_fine_enable),
      .po_coarse_enable      (C_po_coarse_enable),
      .po_fine_inc           (C_po_fine_inc),
      .po_coarse_inc         (C_po_coarse_inc),
      .po_counter_load_en    (C_po_counter_load_en),
      .po_counter_read_en    (C_po_counter_read_en),
      .po_counter_load_val   (C_po_counter_load_val),
      .po_coarse_overflow    (C_po_coarse_overflow),
      .po_fine_overflow      (C_po_fine_overflow),
      .po_counter_read_val   (C_po_counter_read_val),
      .po_sel_fine_oclk_delay(C_po_sel_fine_oclk_delay),
      .pi_en_calib           (phy_encalib),
      .pi_fine_enable        (C_pi_fine_enable),
      .pi_fine_inc           (C_pi_fine_inc),
      .pi_counter_load_en    (C_pi_counter_load_en),
      .pi_counter_read_en    (C_pi_counter_read_en),
      .pi_counter_load_val   (C_pi_counter_load_val),
      .pi_fine_overflow      (C_pi_fine_overflow),
      .pi_counter_read_val   (C_pi_counter_read_val),
      .pi_iserdes_rst        (C_pi_iserdes_rst),
      .pi_phase_locked       (C_pi_phase_locked)
);
end
else begin : no_byte_lane_C
       assign C_of_a_full = 1'b0;
       assign C_of_full = 1'b0;
       assign C_if_empty = 1'b0;
       assign C_if_a_empty = 1'b0;
       assign C_pi_phase_locked = 1;
       assign C_pi_dqs_found      = 1;
       assign C_rclk = 0;
       assign C_pi_counter_read_val = 0;
       assign C_po_counter_read_val = 0;
       assign C_pi_fine_overflow    = 0;
       assign C_po_coarse_overflow = 0;
       assign C_po_fine_overflow   = 0;
end
if ( BYTE_LANES[3] ) begin : byte_lane_D
  assign phy_dout_remap[319:240] = part_select_80(phy_dout, (LANE_REMAP[13:12]));
  byte_lane#(
     .ABCD                   ("D"),
     .PO_DATA_CTL            (PC_DATA_CTL_N[3] ? "TRUE" : "FALSE"),
     .BITLANES               (BITLANES[47:36]),
     .BITLANES_OUTONLY       (BITLANES_OUTONLY[47:36]),
     .OF_ALMOST_EMPTY_VALUE  (OF_ALMOST_EMPTY_VALUE),
     .OF_ALMOST_FULL_VALUE   (OF_ALMOST_FULL_VALUE),
     .OF_SYNCHRONOUS_MODE    (OF_SYNCHRONOUS_MODE),
     //.OF_OUTPUT_DISABLE      (OF_OUTPUT_DISABLE),
     //.OF_ARRAY_MODE          (D_OF_ARRAY_MODE),
     //.IF_ARRAY_MODE          (IF_ARRAY_MODE),
     .IF_ALMOST_EMPTY_VALUE  (IF_ALMOST_EMPTY_VALUE),
     .IF_ALMOST_FULL_VALUE   (IF_ALMOST_FULL_VALUE),
     .IF_SYNCHRONOUS_MODE    (IF_SYNCHRONOUS_MODE),
     .DIFFERENTIAL_DQS       (DIFFERENTIAL_DQS),
     .GENERATE_DDR_CK        (GENERATE_DDR_CK),
     .NUM_DDR_CK             (NUM_DDR_CK),
     .RCLK_SELECT_LANE       (RCLK_SELECT_LANE),
     .TCK                    (TCK),
     .MC_DIVIDE              (MC_DIVIDE),
     .PI_BURST_MODE          (D_PI_BURST_MODE),
     .PI_CLKOUT_DIV          (D_PI_CLKOUT_DIV),
     .PI_FREQ_REF_DIV        (D_PI_FREQ_REF_DIV),
     .PI_FINE_DELAY          (D_PI_FINE_DELAY),
     .PI_OUTPUT_CLK_SRC      (D_PI_OUTPUT_CLK_SRC),
     .PI_SYNC_IN_DIV_RST     (D_PI_SYNC_IN_DIV_RST),
     .PO_CLKOUT_DIV          (D_PO_CLKOUT_DIV),
     .PO_FINE_DELAY          (D_PO_FINE_DELAY),
     .PO_COARSE_BYPASS       (D_PO_COARSE_BYPASS),
     .PO_COARSE_DELAY        (D_PO_COARSE_DELAY),
     .PO_OCLK_DELAY          (D_PO_OCLK_DELAY),
     .PO_OCLKDELAY_INV       (D_PO_OCLKDELAY_INV),
     .PO_OUTPUT_CLK_SRC      (D_PO_OUTPUT_CLK_SRC),
     .PO_SYNC_IN_DIV_RST     (D_PO_SYNC_IN_DIV_RST),
     .OSERDES_DATA_RATE      (D_OS_DATA_RATE),
     .OSERDES_DATA_WIDTH     (D_OS_DATA_WIDTH),
     .IDELAYE2_IDELAY_TYPE   (D_IDELAYE2_IDELAY_TYPE),
     .IDELAYE2_IDELAY_VALUE  (D_IDELAYE2_IDELAY_VALUE),
     .IODELAY_GRP            (IODELAY_GRP)
     )
   byte_lane_D(
      .mem_dq_out            (mem_dq_out[47:36]),
      .mem_dq_ts             (mem_dq_ts[47:36]),
      .mem_dq_in             (mem_dq_in[39:30]),
      .mem_dqs_out           (mem_dqs_out[3]),
      .mem_dqs_ts            (mem_dqs_ts[3]),
      .mem_dqs_in            (mem_dqs_in[3]),
      .rst                   (rst_primitives),
      .phy_clk               (phy_clk),
      .freq_refclk           (freq_refclk),
      .mem_refclk            (mem_refclk),
      .idelayctrl_refclk     (idelayctrl_refclk),
      .sync_pulse            (sync_pulse),
      .ddr_ck_out            (D_ddr_clk),
      .rclk                  (D_rclk),
      .pi_dqs_found          (D_pi_dqs_found),
      .dqs_out_of_range      (D_pi_dqs_out_of_range),
      .if_a_empty            (D_if_a_empty),
      .if_empty              (D_if_empty),
      .if_a_full             (/*if_a_full*/),
      .if_full               (D_if_full),
      .of_a_empty            (/*of_a_empty*/),
      .of_empty              (D_of_empty),
      .of_a_full             (D_of_a_full),
      .of_full               (D_of_full),
      .phy_din               (phy_din_remap[319:240]),
      .phy_dout              (phy_dout_remap[319:240]),
      .phy_cmd_wr_en         (phy_cmd_wr_en),
      .phy_data_wr_en        (phy_data_wr_en),
      .phy_rd_en             (phy_rd_en),
      .phaser_ctl_bus        (phaser_ctl_bus),
      .idelay_inc            (idelay_inc),
      .idelay_ce             (D_idelay_ce),
      .idelay_ld             (idelay_ld),
// calibration signals
      .pi_rst_dqs_find       (pi_rst_dqs_find),
      .po_en_calib           (phy_encalib),
      .po_fine_enable        (D_po_fine_enable),
      .po_coarse_enable      (D_po_coarse_enable),
      .po_fine_inc           (D_po_fine_inc),
      .po_coarse_inc         (D_po_coarse_inc),
      .po_counter_load_en    (D_po_counter_load_en),
      .po_counter_read_en    (D_po_counter_read_en),
      .po_counter_load_val   (D_po_counter_load_val),
      .po_coarse_overflow    (D_po_coarse_overflow),
      .po_fine_overflow      (D_po_fine_overflow),
      .po_counter_read_val   (D_po_counter_read_val),
      .po_sel_fine_oclk_delay(D_po_sel_fine_oclk_delay),
      .pi_en_calib           (phy_encalib),
      .pi_fine_enable        (D_pi_fine_enable),
      .pi_fine_inc           (D_pi_fine_inc),
      .pi_counter_load_en    (D_pi_counter_load_en),
      .pi_counter_read_en    (D_pi_counter_read_en),
      .pi_counter_load_val   (D_pi_counter_load_val),
      .pi_fine_overflow      (D_pi_fine_overflow),
      .pi_counter_read_val   (D_pi_counter_read_val),
      .pi_iserdes_rst        (D_pi_iserdes_rst),
      .pi_phase_locked       (D_pi_phase_locked)
);
end
else begin : no_byte_lane_D
       assign D_of_a_full = 1'b0;
       assign D_of_full = 1'b0;
       assign D_if_empty = 1'b0;
       assign D_if_a_empty = 1'b0;
       assign D_rclk = 0;
       assign D_pi_dqs_found      = 1;
       assign D_pi_phase_locked   = 1;
       assign D_pi_counter_read_val = 0;
       assign D_po_counter_read_val = 0;
       assign D_pi_fine_overflow    = 0;
       assign D_po_coarse_overflow  = 0;
       assign D_po_fine_overflow   = 0;
end
endgenerate
assign phaser_ctl_bus[MSB_RANK_SEL_I : MSB_RANK_SEL_I - 7] = in_rank;
`ifdef FUJI_PHY_BLH
B_PHY_CONTROL #(
`else
PHY_CONTROL #(
`endif
  .AO_WRLVL_EN          ( PC_AO_WRLVL_EN),
  .AO_TOGGLE            ( PC_AO_TOGGLE),
  .BURST_MODE           ( PC_BURST_MODE),
  .CO_DURATION          ( PC_CO_DURATION ),
  .CLK_RATIO            ( PC_CLK_RATIO),
  .DATA_CTL_A_N         ( PC_DATA_CTL_A),
  .DATA_CTL_B_N         ( PC_DATA_CTL_B),
  .DATA_CTL_C_N         ( PC_DATA_CTL_C),
  .DATA_CTL_D_N         ( PC_DATA_CTL_D),
  .DI_DURATION          ( PC_DI_DURATION ),
  .DO_DURATION          ( PC_DO_DURATION ),
  .EVENTS_DELAY         ( PC_EVENTS_DELAY),
  .FOUR_WINDOW_CLOCKS   ( PC_FOUR_WINDOW_CLOCKS),
  .MULTI_REGION         ( PC_MULTI_REGION ),
  .PHY_COUNT_ENABLE     ( PC_PHY_COUNT_EN),
  .DISABLE_SEQ_MATCH    ( PC_DISABLE_SEQ_MATCH),
  .SYNC_MODE            ( PC_SYNC_MODE),
  .CMD_OFFSET           ( PC_CMD_OFFSET),
  .RD_CMD_OFFSET_0      ( PC_RD_CMD_OFFSET_0),
  .RD_CMD_OFFSET_1      ( PC_RD_CMD_OFFSET_1),
  .RD_CMD_OFFSET_2      ( PC_RD_CMD_OFFSET_2),
  .RD_CMD_OFFSET_3      ( PC_RD_CMD_OFFSET_3),
  .RD_DURATION_0        ( PC_RD_DURATION_0),
  .RD_DURATION_1        ( PC_RD_DURATION_1),
  .RD_DURATION_2        ( PC_RD_DURATION_2),
  .RD_DURATION_3        ( PC_RD_DURATION_3),
  .WR_CMD_OFFSET_0      ( PC_WR_CMD_OFFSET_0),
  .WR_CMD_OFFSET_1      ( PC_WR_CMD_OFFSET_1),
  .WR_CMD_OFFSET_2      ( PC_WR_CMD_OFFSET_2),
  .WR_CMD_OFFSET_3      ( PC_WR_CMD_OFFSET_3),
  .WR_DURATION_0        ( PC_WR_DURATION_0),
  .WR_DURATION_1        ( PC_WR_DURATION_1),
  .WR_DURATION_2        ( PC_WR_DURATION_2),
  .WR_DURATION_3        ( PC_WR_DURATION_3)
) phy_control_i (
  .AUXOUTPUT            (aux_out),
  .INBURSTPENDING       (phaser_ctl_bus[MSB_BURST_PEND_PI:MSB_BURST_PEND_PI-3]),
  .INRANKA              (in_rank[1:0]),
  .INRANKB              (in_rank[3:2]),
  .INRANKC              (in_rank[5:4]),
  .INRANKD              (in_rank[7:6]),
  .OUTBURSTPENDING      (phaser_ctl_bus[MSB_BURST_PEND_PO:MSB_BURST_PEND_PO-3]),
  .PCENABLECALIB        (phy_encalib),
  .PHYCTLALMOSTFULL     (phy_ctl_a_full),
  .PHYCTLEMPTY          (phy_ctl_empty),
  .PHYCTLFULL           (phy_ctl_full),
  .PHYCTLREADY          (phy_ctl_ready),
  .MEMREFCLK            (mem_refclk),
  .PHYCLK               (phy_ctl_clk),
  .PHYCTLMSTREMPTY      (phy_ctl_mstr_empty),
  .PHYCTLWD             (_phy_ctl_wd),
  .PHYCTLWRENABLE       (phy_ctl_wr),
  .PLLLOCK              (pll_lock),
  .REFDLLLOCK           (ref_dll_lock),
  .RESET                (rst_primitives),
  .SYNCIN               (sync_pulse),
  .READCALIBENABLE      (phy_read_calib),
  .WRITECALIBENABLE     (phy_write_calib)
`ifdef USE_PHY_CONTROL_TEST
  , .TESTINPUT         (16'b0),
    .TESTOUTPUT        (test_output),
    .TESTSELECT        (test_select),
    .SCANENABLEN       (scan_enable)
`endif
);
// register outputs to give extra slack in timing
always @(posedge phy_clk or posedge rst) begin
  if (rst) begin
    pi_counter_read_val <= #1 0;
    pi_dqs_found        <= #1 0;
    pi_dqs_out_of_range <= #1 0;
    pi_fine_overflow    <= #1 0;
    pi_phase_locked     <= #1 0;
    po_coarse_overflow  <= #1 0;
    po_counter_read_val <= #1 0;
    po_fine_overflow    <= #1 0;
  end
  else begin
    case (calib_sel[1:0])
    2'h0: begin
       // TEMP: condition on whether this byte lane is
       // control/addr or data. If control/address, then
       // hardcode these outputs, and allow SYN/PAR to
       // trim out the PHASER_IN in this byte lane
       if (! PRESENT_DATA_A) begin
          po_coarse_overflow <= #1 1'b0;
          po_fine_overflow <= #1 1'b0;
          po_counter_read_val <= #1 9'b0;
          pi_fine_overflow <= #1 1'b0;
          pi_counter_read_val<= #1 6'b0;
          pi_phase_locked  <= #1 1'b0;
          pi_dqs_found     <= #1 1'b0;
          pi_dqs_out_of_range <= #1 1'b0;
       end
       else begin
          po_coarse_overflow <= #1 A_po_coarse_overflow;
          po_fine_overflow <= #1 A_po_fine_overflow;
          po_counter_read_val <= #1 A_po_counter_read_val;
          pi_fine_overflow <= #1 A_pi_fine_overflow;
          pi_counter_read_val<= #1 A_pi_counter_read_val;
          pi_phase_locked  <= #1 A_pi_phase_locked;
       if ( calib_in_common)
           pi_dqs_found     <= #1 pi_dqs_found_any;
       else
          pi_dqs_found     <= #1 A_pi_dqs_found;
          pi_dqs_out_of_range <= #1 A_pi_dqs_out_of_range;
       end
      end
    2'h1: begin
       if (! PRESENT_DATA_B) begin
          po_coarse_overflow <= #1 1'b0;
          po_fine_overflow <= #1 1'b0;
          po_counter_read_val <= #1 9'b0;
          pi_fine_overflow <= #1 1'b0;
          pi_counter_read_val<= #1 6'b0;
          pi_phase_locked  <= #1 1'b0;
          pi_dqs_found     <= #1 1'b0;
          pi_dqs_out_of_range <= #1 1'b0;
       end
       else begin
         po_coarse_overflow     <= #1 B_po_coarse_overflow;
         po_fine_overflow       <= #1 B_po_fine_overflow;
         po_counter_read_val    <= #1 B_po_counter_read_val;
         pi_fine_overflow       <= #1 B_pi_fine_overflow;
         pi_counter_read_val    <= #1 B_pi_counter_read_val;
         pi_phase_locked        <= #1 B_pi_phase_locked;
       if ( calib_in_common)
          pi_dqs_found           <= #1 pi_dqs_found_any;
       else
         pi_dqs_found           <= #1 B_pi_dqs_found;
         pi_dqs_out_of_range    <= #1 B_pi_dqs_out_of_range;
       end
      end
    2'h2: begin
       if (! PRESENT_DATA_C) begin
          po_coarse_overflow <= #1 1'b0;
          po_fine_overflow <= #1 1'b0;
          po_counter_read_val <= #1 9'b0;
          pi_fine_overflow <= #1 1'b0;
          pi_counter_read_val<= #1 6'b0;
          pi_phase_locked  <= #1 1'b0;
          pi_dqs_found     <= #1 1'b0;
          pi_dqs_out_of_range <= #1 1'b0;
       end
       else begin
          po_coarse_overflow     <= #1 C_po_coarse_overflow;
          po_fine_overflow       <= #1 C_po_fine_overflow;
          po_counter_read_val    <= #1 C_po_counter_read_val;
          pi_fine_overflow       <= #1 C_pi_fine_overflow;
          pi_counter_read_val    <= #1 C_pi_counter_read_val;
          pi_phase_locked        <= #1 C_pi_phase_locked;
       if ( calib_in_common)
           pi_dqs_found           <= #1 pi_dqs_found_any;
       else
          pi_dqs_found           <= #1 C_pi_dqs_found;
          pi_dqs_out_of_range    <= #1 C_pi_dqs_out_of_range;
       end
      end
    2'h3: begin
       if (! PRESENT_DATA_D) begin
          po_coarse_overflow <= #1 1'b0;
          po_fine_overflow <= #1 1'b0;
          po_counter_read_val <= #1 9'b0;
          pi_fine_overflow <= #1 1'b0;
          pi_counter_read_val<= #1 6'b0;
          pi_phase_locked  <= #1 1'b0;
          pi_dqs_found     <= #1 1'b0;
          pi_dqs_out_of_range <= #1 1'b0;
       end
       else begin
          po_coarse_overflow     <= #1 D_po_coarse_overflow;
          po_fine_overflow       <= #1 D_po_fine_overflow;
          po_counter_read_val    <= #1 D_po_counter_read_val;
          pi_fine_overflow       <= #1 D_pi_fine_overflow;
          pi_counter_read_val    <= #1 D_pi_counter_read_val;
          pi_phase_locked        <= #1 D_pi_phase_locked;
       if ( calib_in_common)
          pi_dqs_found           <= #1 pi_dqs_found_any;
       else
          pi_dqs_found           <= #1 D_pi_dqs_found;
          pi_dqs_out_of_range    <= #1 D_pi_dqs_out_of_range;
       end
      end
     default: begin
        po_coarse_overflow <= po_coarse_overflow;
     end
    endcase
  end
end
always @(*) begin
        A_pi_fine_enable          = 0;
        A_pi_fine_inc             = 0;
        A_pi_counter_load_en      = 0;
        A_pi_counter_read_en      = 0;
        A_pi_counter_load_val     = 0;
        A_po_fine_enable          = 0;
        A_po_coarse_enable        = 0;
        A_po_fine_inc             = 0;
        A_po_coarse_inc           = 0;
        A_po_counter_load_en      = 0;
        A_po_counter_read_en      = 0;
        A_po_counter_load_val     = 0;
        A_po_sel_fine_oclk_delay  = 0;
        A_idelay_ce               = 0;
        B_pi_fine_enable          = 0;
        B_pi_fine_inc   = 0;
        B_pi_counter_load_en      = 0;
        B_pi_counter_read_en      = 0;
        B_pi_counter_load_val     = 0;
        B_po_fine_enable          = 0;
        B_po_coarse_enable        = 0;
        B_po_fine_inc             = 0;
        B_po_coarse_inc           = 0;
        B_po_counter_load_en      = 0;
        B_po_counter_read_en      = 0;
        B_po_counter_load_val     = 0;
        B_po_sel_fine_oclk_delay  = 0;
        B_idelay_ce               = 0;
        C_pi_fine_enable    = 0;
        C_pi_fine_inc   = 0;
        C_pi_counter_load_en      = 0;
        C_pi_counter_read_en      = 0;
        C_pi_counter_load_val     = 0;
        C_po_fine_enable          = 0;
        C_po_coarse_enable        = 0;
        C_po_fine_inc             = 0;
        C_po_coarse_inc           = 0;
        C_po_counter_load_en      = 0;
        C_po_counter_read_en      = 0;
        C_po_counter_load_val     = 0;
        C_po_sel_fine_oclk_delay  = 0;
        C_idelay_ce               = 0;
        D_pi_fine_enable          = 0;
        D_pi_fine_inc             = 0;
        D_pi_counter_load_en      = 0;
        D_pi_counter_read_en      = 0;
        D_pi_counter_load_val     = 0;
        D_po_fine_enable          = 0;
        D_po_coarse_enable        = 0;
        D_po_fine_inc             = 0;
        D_po_coarse_inc           = 0;
        D_po_counter_load_en      = 0;
        D_po_counter_read_en      = 0;
        D_po_counter_load_val     = 0;
        D_po_sel_fine_oclk_delay  = 0;
        D_idelay_ce               = 0;
    if ( calib_sel[2]) begin
    // if this is asserted, all calib signals are deasserted
        A_pi_fine_enable     = 0;
        A_pi_fine_inc        = 0;
        A_pi_counter_load_en = 0;
        A_pi_counter_read_en = 0;
        A_pi_counter_load_val = 0;
        A_po_fine_enable     = 0;
        A_po_coarse_enable   = 0;
        A_po_fine_inc        = 0;
        A_po_coarse_inc      = 0;
        A_po_counter_load_en = 0;
        A_po_counter_read_en = 0;
        A_po_counter_load_val = 0;
        A_idelay_ce           = 0;
        B_pi_fine_enable     = 0;
        B_pi_fine_inc        = 0;
        B_pi_counter_load_en = 0;
        B_pi_counter_read_en = 0;
        B_pi_counter_load_val = 0;
        B_po_fine_enable     = 0;
        B_po_coarse_enable   = 0;
        B_po_fine_inc        = 0;
        B_po_coarse_inc      = 0;
        B_po_counter_load_en = 0;
        B_po_counter_read_en = 0;
        B_po_counter_load_val=  0;
        B_idelay_ce           = 0;
        C_pi_fine_enable     = 0;
        C_pi_fine_inc        = 0;
        C_pi_counter_load_en = 0;
        C_pi_counter_read_en = 0;
        C_pi_counter_load_val = 0;
        C_po_fine_enable     = 0;
        C_po_coarse_enable   = 0;
        C_po_fine_inc        = 0;
        C_po_coarse_inc      = 0;
        C_po_counter_load_en = 0;
        C_po_counter_read_en = 0;
        C_po_counter_load_val= 0;
        C_idelay_ce           = 0;
        D_pi_fine_enable     = 0;
        D_pi_fine_inc        = 0;
        D_pi_counter_load_en = 0;
        D_pi_counter_read_en = 0;
        D_pi_counter_load_val= 0;
        D_po_fine_enable     = 0;
        D_po_coarse_enable   = 0;
        D_po_fine_inc        = 0;
        D_po_coarse_inc      = 0;
        D_po_counter_load_en = 0;
        D_po_counter_read_en = 0;
        D_po_counter_load_val = 0;
        D_idelay_ce           = 0;
    end else
    if (calib_in_common) begin
       // if this is asserted, each signal is broadcast  to all phasers
       // in common
        if ( ! calib_zero_ctrl || DATA_CTL_N[0]) begin
        A_pi_fine_enable          = pi_fine_enable;
        A_pi_fine_inc             = pi_fine_inc;
        A_pi_counter_load_en      = pi_counter_load_en;
        A_pi_counter_read_en      = pi_counter_read_en;
        A_pi_counter_load_val     = pi_counter_load_val;
        A_po_fine_enable          = po_fine_enable;
        A_po_coarse_enable        = po_coarse_enable;
        A_po_fine_inc             = po_fine_inc;
        A_po_coarse_inc           = po_coarse_inc;
        A_po_counter_load_en      = po_counter_load_en;
        A_po_counter_read_en      = po_counter_read_en;
        A_po_counter_load_val     = po_counter_load_val;
        A_po_sel_fine_oclk_delay  = po_sel_fine_oclk_delay;
        A_idelay_ce               = idelay_ce;
        end
        if ( ! calib_zero_ctrl || DATA_CTL_N[1]) begin
        B_pi_fine_enable          = pi_fine_enable;
        B_pi_fine_inc             = pi_fine_inc;
        B_pi_counter_load_en      = pi_counter_load_en;
        B_pi_counter_read_en      = pi_counter_read_en;
        B_pi_counter_load_val     = pi_counter_load_val;
        B_po_fine_enable          = po_fine_enable;
        B_po_coarse_enable        = po_coarse_enable;
        B_po_fine_inc             = po_fine_inc;
        B_po_coarse_inc           = po_coarse_inc;
        B_po_counter_load_en      = po_counter_load_en;
        B_po_counter_read_en      = po_counter_read_en;
        B_po_counter_load_val     = po_counter_load_val;
        B_po_sel_fine_oclk_delay  = po_sel_fine_oclk_delay;
        B_idelay_ce               = idelay_ce;
        end
        if ( ! calib_zero_ctrl || DATA_CTL_N[2]) begin
        C_pi_fine_enable          = pi_fine_enable;
        C_pi_fine_inc             = pi_fine_inc;
        C_pi_counter_load_en      = pi_counter_load_en;
        C_pi_counter_read_en      = pi_counter_read_en;
        C_pi_counter_load_val     = pi_counter_load_val;
        C_po_fine_enable          = po_fine_enable;
        C_po_coarse_enable        = po_coarse_enable;
        C_po_fine_inc             = po_fine_inc;
        C_po_coarse_inc           = po_coarse_inc;
        C_po_counter_load_en      = po_counter_load_en;
        C_po_counter_read_en      = po_counter_read_en;
        C_po_counter_load_val     = po_counter_load_val;
        C_po_sel_fine_oclk_delay  = po_sel_fine_oclk_delay;
        C_idelay_ce               = idelay_ce;
        end
        if ( ! calib_zero_ctrl || DATA_CTL_N[3]) begin
        D_pi_fine_enable          = pi_fine_enable;
        D_pi_fine_inc             = pi_fine_inc;
        D_pi_counter_load_en      = pi_counter_load_en;
        D_pi_counter_read_en      = pi_counter_read_en;
        D_pi_counter_load_val     = pi_counter_load_val;
        D_po_fine_enable          = po_fine_enable;
        D_po_coarse_enable        = po_coarse_enable;
        D_po_fine_inc             = po_fine_inc;
        D_po_coarse_inc           = po_coarse_inc;
        D_po_counter_load_en      = po_counter_load_en;
        D_po_counter_read_en      = po_counter_read_en;
        D_po_counter_load_val     = po_counter_load_val;
        D_po_sel_fine_oclk_delay  = po_sel_fine_oclk_delay;
        D_idelay_ce               = idelay_ce;
    end
    end
    else begin
    // otherwise, only a single phaser is selected
    case (calib_sel[1:0])
    0:  begin
        A_pi_fine_enable          = pi_fine_enable;
        A_pi_fine_inc             = pi_fine_inc;
        A_pi_counter_load_en      = pi_counter_load_en;
        A_pi_counter_read_en      = pi_counter_read_en;
        A_pi_counter_load_val     = pi_counter_load_val;
        A_po_fine_enable          = po_fine_enable;
        A_po_coarse_enable        = po_coarse_enable;
        A_po_fine_inc             = po_fine_inc;
        A_po_coarse_inc           = po_coarse_inc;
        A_po_counter_load_en      = po_counter_load_en;
        A_po_counter_read_en      = po_counter_read_en;
        A_po_counter_load_val     = po_counter_load_val;
        A_idelay_ce               = idelay_ce;
     end
    1: begin
        B_pi_fine_enable          = pi_fine_enable;
        B_pi_fine_inc             = pi_fine_inc;
        B_pi_counter_load_en      = pi_counter_load_en;
        B_pi_counter_read_en      = pi_counter_read_en;
        B_pi_counter_load_val     = pi_counter_load_val;
        B_po_fine_enable          = po_fine_enable;
        B_po_coarse_enable        = po_coarse_enable;
        B_po_fine_inc             = po_fine_inc;
        B_po_coarse_inc           = po_coarse_inc;
        B_po_counter_load_en      = po_counter_load_en;
        B_po_counter_read_en      = po_counter_read_en;
        B_po_counter_load_val     = po_counter_load_val;
        B_idelay_ce               = idelay_ce;
     end
    2: begin
        C_pi_fine_enable          = pi_fine_enable;
        C_pi_fine_inc             = pi_fine_inc;
        C_pi_counter_load_en      = pi_counter_load_en;
        C_pi_counter_read_en      = pi_counter_read_en;
        C_pi_counter_load_val     = pi_counter_load_val;
        C_po_fine_enable          = po_fine_enable;
        C_po_coarse_enable        = po_coarse_enable;
        C_po_fine_inc             = po_fine_inc;
        C_po_coarse_inc           = po_coarse_inc;
        C_po_counter_load_en      = po_counter_load_en;
        C_po_counter_read_en      = po_counter_read_en;
        C_po_counter_load_val     = po_counter_load_val;
        C_idelay_ce               = idelay_ce;
     end
    3: begin
        D_pi_fine_enable          = pi_fine_enable;
        D_pi_fine_inc             = pi_fine_inc;
        D_pi_counter_load_en      = pi_counter_load_en;
        D_pi_counter_read_en      = pi_counter_read_en;
        D_pi_counter_load_val     = pi_counter_load_val;
        D_po_fine_enable          = po_fine_enable;
        D_po_coarse_enable        = po_coarse_enable;
        D_po_fine_inc             = po_fine_inc;
        D_po_coarse_inc           = po_coarse_inc;
        D_po_counter_load_en      = po_counter_load_en;
        D_po_counter_load_val     = po_counter_load_val;
        D_po_counter_read_en      = po_counter_read_en;
        D_idelay_ce               = idelay_ce;
     end
    endcase
    end
end
//obligatory phaser-ref
PHASER_REF phaser_ref_i(
 .LOCKED (ref_dll_lock),
 .CLKIN  (freq_refclk),
 .PWRDWN (1'b0),
 .RST    (rst)
);
// optional idelay_ctrl
generate
if ( GENERATE_IDELAYCTRL == "TRUE")
IDELAYCTRL idelayctrl (
    .RDY                (/*idelayctrl_rdy*/),
    .REFCLK             (idelayctrl_refclk),
    .RST                (rst)
);
endgenerate
endmodule