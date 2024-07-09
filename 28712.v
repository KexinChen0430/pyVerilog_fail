module signal_split for only for simulation purposes if it's desired to insert skew
// in signals going to different PHASER blocks. Otherwise, use the code below to bypass any
// skew insertion.
assign mem_refclk_split       = mem_refclk;
assign sync_pulse_split       = sync_pulse;
assign freq_refclk_split      = freq_refclk;
assign mem_refclk_div4_split  = mem_refclk_div4;
assign data_offset_1_split1   = data_offset_1;
assign data_offset_2_split2   = data_offset_2;
assign phy_ctl_clk_split0     = phy_clk;
assign phy_ctl_wd_split0      = phy_ctl_wd;
assign phy_ctl_wr_split0      = phy_ctl_wr;
assign phy_clk_split0         = phy_clk;
assign phy_cmd_wr_en_split0   = phy_cmd_wr_en;
assign phy_data_wr_en_split0  = phy_data_wr_en;
assign phy_rd_en_split0       = phy_rd_en;
assign phy_dout_split0        = phy_dout;
assign phy_ctl_clk_split1     = phy_clk;
assign phy_ctl_wd_split1      = phy_ctl_wd;
assign phy_ctl_wr_split1      = phy_ctl_wr;
assign phy_clk_split1         = phy_clk;
assign phy_cmd_wr_en_split1   = phy_cmd_wr_en;
assign phy_data_wr_en_split1  = phy_data_wr_en;
assign phy_rd_en_split1       = phy_rd_en;
assign phy_dout_split1        = phy_dout;
assign phy_ctl_clk_split2     = phy_clk;
assign phy_ctl_wd_split2      = phy_ctl_wd;
assign phy_ctl_wr_split2      = phy_ctl_wr;
assign phy_clk_split2         = phy_clk;
assign phy_cmd_wr_en_split2   = phy_cmd_wr_en;
assign phy_data_wr_en_split2  = phy_data_wr_en;
assign phy_rd_en_split2       = phy_rd_en;
assign phy_dout_split2        = phy_dout;
/*
signal_split
 #(
     .BYTE_LANES_B0 (BYTE_LANES_B0),
     .BYTE_LANES_B1 (BYTE_LANES_B1),
     .BYTE_LANES_B2 (BYTE_LANES_B2),
     .BYTE_LANES_B3 (BYTE_LANES_B3),
     .BYTE_LANES_B4 (BYTE_LANES_B4)
 ) signal_split_i
 (
      .phy_clk                  (_phy_clk),
      .freq_refclk              (freq_refclk),
      .mem_refclk               (mem_refclk),
      .mem_refclk_div4          (mem_refclk_div4),
      .sync_pulse               (sync_pulse),
      .phy_dout                 (phy_dout),
      .phy_cmd_wr_en            (phy_cmd_wr_en),
      .phy_data_wr_en           (phy_data_wr_en),
      .phy_rd_en                (phy_rd_en),
      .phy_ctl_wd               (_phy_ctl_wd),
      .phy_ctl_wr               (_phy_ctl_wr),
      .data_offset_1            (data_offset_1),
      .data_offset_2            (data_offset_2),
      .mem_refclk_split         (mem_refclk_split),
      .freq_refclk_split        (freq_refclk_split),
      .mem_refclk_div4_split    (mem_refclk_div4_split),
      .sync_pulse_split         (sync_pulse_split),
      .phy_ctl_clk_split0       (phy_ctl_clk_split0),
      .phy_clk_split0           (phy_clk_split0),
      .phy_ctl_wd_split0        (phy_ctl_wd_split0),
      .phy_ctl_wr_split0        (phy_ctl_wr_split0),
      .phy_ctl_clk_split1       (phy_ctl_clk_split1),
      .phy_clk_split1           (phy_clk_split1),
      .phy_ctl_wd_split1        (phy_ctl_wd_split1),
      .data_offset_1_split1     (data_offset_1_split1),
      .phy_ctl_wr_split1        (phy_ctl_wr_split1),
      .phy_ctl_clk_split2       (phy_ctl_clk_split2),
      .phy_clk_split2           (phy_clk_split2),
      .phy_ctl_wd_split2        (phy_ctl_wd_split2),
      .data_offset_2_split2     (data_offset_2_split2),
      .phy_ctl_wr_split2        (phy_ctl_wr_split2),
      .phy_dout_split0          (phy_dout_split0),
      .phy_cmd_wr_en_split0     (phy_cmd_wr_en_split0),
      .phy_data_wr_en_split0    (phy_data_wr_en_split0),
      .phy_rd_en_split0         (phy_rd_en_split0),
      .phy_dout_split1          (phy_dout_split1),
      .phy_cmd_wr_en_split1     (phy_cmd_wr_en_split1),
      .phy_data_wr_en_split1    (phy_data_wr_en_split1),
      .phy_rd_en_split1         (phy_rd_en_split1),
      .phy_dout_split2          (phy_dout_split2),
      .phy_cmd_wr_en_split2     (phy_cmd_wr_en_split2),
      .phy_data_wr_en_split2    (phy_data_wr_en_split2),
      .phy_rd_en_split2         (phy_rd_en_split2)
 );
*/
assign pi_dqs_found_all      = & pi_dqs_found_all_w[HIGHEST_BANK-1:0];
assign pi_dqs_found_any      = | pi_dqs_found_any_w[HIGHEST_BANK-1:0];
assign pi_phase_locked_all   = & pi_phase_locked_all_w[HIGHEST_BANK-1:0];
assign calib_zero_inputs_int = {3'bxxx, calib_zero_inputs};
assign phy_ctl_ready = &phy_ctl_ready_w[HIGHEST_BANK-1:0];
assign phy_ctl_mstr_empty  = phy_ctl_empty[MASTER_PHY_CTL];
assign of_ctl_a_full  = |of_ctl_a_full_v;
assign of_ctl_full    = |of_ctl_full_v;
assign of_data_a_full = |of_data_a_full_v;
assign of_data_full   = |of_data_full_v;
// if if_empty_def == 1, empty is asserted only if all are empty;
// this allows the user to detect a skewed fifo depth and self-clear
// if desired. It avoids a reset to clear the flags.
//assign if_empty       = ! if_empty_def ? |if_empty_v : & if_empty_v;
generate
  begin
    if (HIGHEST_BANK==3)
      assign if_empty = !if_empty_def ? (mux_i0_v[0] | mux_i0_v[1] | mux_i0_v[2]) : (mux_i1_v[0] & mux_i1_v[1] & mux_i1_v[2]);
    else if (HIGHEST_BANK==2)
      assign if_empty = !if_empty_def ? (mux_i0_v[0] | mux_i0_v[1]) : (mux_i1_v[0] & mux_i1_v[1]);
    else
      assign if_empty = !if_empty_def ? (mux_i0_v[0]) : (mux_i1_v[0]);
  end
endgenerate
assign if_a_empty     = |if_a_empty_v;
assign ddr_clk = ddr_clk_w[DDR_CLK_SELECT_BANK];
assign rclk = rclk_w[RCLK_SELECT_BANK];
always @(*) begin
      rst_out_i <=  rst_out_w[RCLK_SELECT_BANK] & ddr_rst_in_n;
end
always @(posedge phy_clk or posedge rst) begin
    if ( rst)
       mcGo_r <= #(1) 0;
    else
    mcGo_r <=#(1) (mcGo_r << 1) |  (mcGo_w[RCLK_SELECT_BANK] && phy_ctl_ready);
end
assign mcGo = mcGo_r[3];
// Substitute OBUF with direct connection to prevent possible instantiation
// of extra output if rst_out from MC_PHY isn't used
//OBUF rst_buf(.O(rst_out), .I(rst_out_i));
assign rst_out = rst_out_i;
generate
if (PHYCTL_CMD_FIFO == "TRUE" ) begin
    assign _phy_ctl_wd = {if_q7, if_q6[3:0], if_q5[3:0], if_q4, if_q3, if_q2, if_q1, if_q0};
    assign aux_in_[1]      = if_q8;
    assign aux_in_[2]      = if_q9;
    assign phy_ctl_a_full  = _phy_ctl_a_full_f;
    assign phy_ctl_full    = _phy_ctl_full_f;
    assign _phy_ctl_wr     = ! _phy_ctl_empty_f;
    assign _phy_clk        = mem_refclk_div4;
end
else begin
    assign _phy_ctl_wd     = phy_ctl_wd;
    assign aux_in_[1]  = aux_in_1;
    assign aux_in_[2]  = aux_in_2;
    assign phy_ctl_a_full  = &_phy_ctl_a_full_p;
    assign phy_ctl_full    = &_phy_ctl_full_p;
    assign _phy_ctl_wr     = phy_ctl_wr;
    assign _phy_clk        = phy_clk;
end
endgenerate
// this code ties off dummy wires for unused dqs signals
// on control lanes and unused data signals on data lanes.
// this keeps the allocation of the busses simple
// all lanes allocate 10-bits of data plus 2-more at the high
// end of the bus.
assign dummy [0] =  (&dummy_data) & (& dummy_dqs);
// this fifo crosses domain for the phy control word from
// phy_clk to freq_refclk (ddr clk). It uses one in_fifo (4x4
// mode)  that  is  unused in the control-path.
// Set parameter PHYCTL_CMD_FIFO = "TRUE" to use.
// otherwise this fifo is trimmed in the mapper.
// It is required to be used if there are more than 1
// phy controllers to prevent asychronous domain crossing
// in phy controller causing a skew in when phy control
// words are registered and executed. Using this fifo keeps them
// synchronous and timing is simplified.
`ifdef FUJI_PHY_BLH
B_IN_FIFO #(
`else
IN_FIFO #(
`endif
  .ALMOST_EMPTY_VALUE          ( IF_ALMOST_EMPTY_VALUE ),
  .ALMOST_FULL_VALUE           ( IF_ALMOST_FULL_VALUE ),
  .ARRAY_MODE                  ( IF_ARRAY_MODE),
  .SYNCHRONOUS_MODE            ( IF_SYNCHRONOUS_MODE)
) in_fifo_i  (
  .ALMOSTEMPTY                 (_phy_ctl_a_empty_f),
  .ALMOSTFULL                  (_phy_ctl_a_full_f),
  .EMPTY                       (_phy_ctl_empty_f),
  .FULL                        (_phy_ctl_full_f),
  .Q0                          ({dummy_q[0],if_q0}),
  .Q1                          ({dummy_q[1],if_q1}),
  .Q2                          ({dummy_q[2],if_q2}),
  .Q3                          ({dummy_q[3],if_q3}),
  .Q4                          ({dummy_q[4],if_q4}),
  .Q5                          ({if_q5}),
  .Q6                          ({if_q6}),
  .Q7                          ({dummy_q[7],if_q7}),
  .Q8                          ({dummy_q[8],if_q8}),
  .Q9                          ({dummy_q[9],if_q9}),
//===
  .D0                          (phy_ctl_wd[3:0]),
  .D1                          (phy_ctl_wd[7:4]),
  .D2                          (phy_ctl_wd[11:8]),
  .D3                          (phy_ctl_wd[15:12]),
  .D4                          (phy_ctl_wd[19:16]),
  .D5                          ({phy_ctl_wd[23:20], phy_ctl_wd[23:20]}),
  .D6                          ({phy_ctl_wd[27:24], phy_ctl_wd[27:24]}),
  .D7                          (phy_ctl_wd[31:28]),
  .D8                          (aux_in_1),
  .D9                          (aux_in_2),
  .RDCLK                       (mem_refclk_div4_split0),
  .RDEN                        ( ! _phy_ctl_empty_f ),
  .RESET                       (rst),
  .WRCLK                       (phy_clk_split0),
  .WREN                        (phy_ctl_wr_split0)
);
// instance of four-lane phy
generate
if ( BYTE_LANES_B0 != 0)  begin : phy_4lanes_0
phy_4lanes #(
     .BYTE_LANES                (BYTE_LANES_B0),        /* four bits, one per lanes */
     .DATA_CTL_N                (PHY_0_DATA_CTL), /* four bits, one per lane */
     .PO_CTL_COARSE_BYPASS      (PO_CTL_COARSE_BYPASS),
     .PO_FINE_DELAY             (L_PHY_0_PO_FINE_DELAY),
     .BITLANES                  (PHY_0_BITLANES),
     .BITLANES_OUTONLY          (PHY_0_BITLANES_OUTONLY),
     .LAST_BANK                 (PHY_0_IS_LAST_BANK ),
     .LANE_REMAP                (PHY_0_LANE_REMAP),
     //.OF_ALMOST_FULL_VALUE      (PHY_O_OF_ALMOST_FULL_VALUE),
     //.IF_ALMOST_EMPTY_VALUE     (PHY_O_IF_ALMOST_EMPTY_VALUE),
     .GENERATE_IDELAYCTRL       (PHY_0_GENERATE_IDELAYCTRL),
     .GENERATE_DDR_CK           (PHY_0_GENERATE_DDR_CK),
     .NUM_DDR_CK                (PHY_0_NUM_DDR_CK),
     .DIFFERENTIAL_DQS          (PHY_0_DIFFERENTIAL_DQS),
     .TCK                       (TCK),
     .RCLK_SELECT_LANE          (RCLK_SELECT_LANE),
     .MC_DIVIDE                 (PHY_CLK_RATIO),
     .PC_CLK_RATIO              (PHY_CLK_RATIO),
     .PC_EVENTS_DELAY           (PHY_EVENTS_DELAY),
     .PC_FOUR_WINDOW_CLOCKS     (PHY_FOUR_WINDOW_CLOCKS),
     .PC_BURST_MODE             (PHY_0_A_BURST_MODE),
     .PC_SYNC_MODE              (PHY_SYNC_MODE),
     .PC_MULTI_REGION           (PHY_MULTI_REGION),
     .PC_PHY_COUNT_EN           (PHY_COUNT_EN),
     .PC_DISABLE_SEQ_MATCH      (PHY_DISABLE_SEQ_MATCH),
     .PC_CMD_OFFSET             (PHY_0_CMD_OFFSET),
     .PC_RD_CMD_OFFSET_0        (PHY_0_RD_CMD_OFFSET_0),
     .PC_RD_CMD_OFFSET_1        (PHY_0_RD_CMD_OFFSET_1),
     .PC_RD_CMD_OFFSET_2        (PHY_0_RD_CMD_OFFSET_2),
     .PC_RD_CMD_OFFSET_3        (PHY_0_RD_CMD_OFFSET_3),
     .PC_RD_DURATION_0          (PHY_0_RD_DURATION_0),
     .PC_RD_DURATION_1          (PHY_0_RD_DURATION_1),
     .PC_RD_DURATION_2          (PHY_0_RD_DURATION_2),
     .PC_RD_DURATION_3          (PHY_0_RD_DURATION_3),
     .PC_WR_CMD_OFFSET_0        (PHY_0_WR_CMD_OFFSET_0),
     .PC_WR_CMD_OFFSET_1        (PHY_0_WR_CMD_OFFSET_1),
     .PC_WR_CMD_OFFSET_2        (PHY_0_WR_CMD_OFFSET_2),
     .PC_WR_CMD_OFFSET_3        (PHY_0_WR_CMD_OFFSET_3),
     .PC_WR_DURATION_0          (PHY_0_WR_DURATION_0),
     .PC_WR_DURATION_1          (PHY_0_WR_DURATION_1),
     .PC_WR_DURATION_2          (PHY_0_WR_DURATION_2),
     .PC_WR_DURATION_3          (PHY_0_WR_DURATION_3),
     .PC_AO_WRLVL_EN            (PHY_0_AO_WRLVL_EN),
     .PC_AO_TOGGLE              (PHY_0_AO_TOGGLE),
     .A_PI_FINE_DELAY           (PHY_0_A_PI_FINE_DELAY),
     .B_PI_FINE_DELAY           (PHY_0_B_PI_FINE_DELAY),
     .C_PI_FINE_DELAY           (PHY_0_C_PI_FINE_DELAY),
     .D_PI_FINE_DELAY           (PHY_0_D_PI_FINE_DELAY),
     .A_PI_FREQ_REF_DIV         (PHY_0_A_PI_FREQ_REF_DIV),
     //.A_PI_CLKOUT_DIV           ( PHY_0_A_PI_CLKOUT_DIV),
     //.A_PO_CLKOUT_DIV           ( PHY_0_A_PO_CLKOUT_DIV),
     .A_PI_BURST_MODE           (PHY_0_A_BURST_MODE),
     .A_PI_OUTPUT_CLK_SRC       (_PHY_0_A_PI_OUTPUT_CLK_SRC),
     .B_PI_OUTPUT_CLK_SRC       (_PHY_0_B_PI_OUTPUT_CLK_SRC),
     .C_PI_OUTPUT_CLK_SRC       (_PHY_0_C_PI_OUTPUT_CLK_SRC),
     .D_PI_OUTPUT_CLK_SRC       (_PHY_0_D_PI_OUTPUT_CLK_SRC),
     .A_PO_OUTPUT_CLK_SRC       (PHY_0_A_PO_OUTPUT_CLK_SRC),
     .A_PO_OCLK_DELAY           (PHY_0_A_PO_OCLK_DELAY),
     .A_PO_OCLKDELAY_INV        (PHY_0_A_PO_OCLKDELAY_INV),
     .A_OF_ARRAY_MODE           (PHY_0_A_OF_ARRAY_MODE),
     .B_OF_ARRAY_MODE           (PHY_0_B_OF_ARRAY_MODE),
     .C_OF_ARRAY_MODE           (PHY_0_C_OF_ARRAY_MODE),
     .D_OF_ARRAY_MODE           (PHY_0_D_OF_ARRAY_MODE),
     .A_IF_ARRAY_MODE           (PHY_0_A_IF_ARRAY_MODE),
     .B_IF_ARRAY_MODE           (PHY_0_B_IF_ARRAY_MODE),
     .C_IF_ARRAY_MODE           (PHY_0_C_IF_ARRAY_MODE),
     .D_IF_ARRAY_MODE           (PHY_0_D_IF_ARRAY_MODE),
     .A_OS_DATA_RATE            (PHY_0_A_OSERDES_DATA_RATE),
     .A_OS_DATA_WIDTH           (PHY_0_A_OSERDES_DATA_WIDTH),
     .B_OS_DATA_RATE            (PHY_0_B_OSERDES_DATA_RATE),
     .B_OS_DATA_WIDTH           (PHY_0_B_OSERDES_DATA_WIDTH),
     .C_OS_DATA_RATE            (PHY_0_C_OSERDES_DATA_RATE),
     .C_OS_DATA_WIDTH           (PHY_0_C_OSERDES_DATA_WIDTH),
     .D_OS_DATA_RATE            (PHY_0_D_OSERDES_DATA_RATE),
     .D_OS_DATA_WIDTH           (PHY_0_D_OSERDES_DATA_WIDTH),
     .A_IDELAYE2_IDELAY_TYPE   (PHY_0_A_IDELAYE2_IDELAY_TYPE),
     .A_IDELAYE2_IDELAY_VALUE  (PHY_0_A_IDELAYE2_IDELAY_VALUE),
     .IODELAY_GRP              (IODELAY_GRP)
)
 phy_4lanes
(
      .rst                      (rst),
      .phy_clk                  (phy_clk_split0),
      .phy_ctl_clk              (phy_ctl_clk_split0),
      .phy_ctl_wd               (phy_ctl_wd_split0),
      .data_offset              (phy_ctl_wd_split0[`PC_OFFSET_RANGE]),
      .phy_ctl_wr               (phy_ctl_wr_split0),
      .mem_refclk               (mem_refclk_split),
      .freq_refclk              (freq_refclk_split),
      .mem_refclk_div4          (mem_refclk_div4_split),
      .sync_pulse               (sync_pulse_split),
      .phy_dout                 (phy_dout_split0[HIGHEST_LANE_B0*80-1:0]),
      .phy_cmd_wr_en            (phy_cmd_wr_en_split0),
      .phy_data_wr_en           (phy_data_wr_en_split0),
      .phy_rd_en                (phy_rd_en_split0),
      .pll_lock                 (pll_lock),
      .ddr_clk                  (ddr_clk_w[0]),
      .rclk                     (rclk_w[0]),
      .rst_out                  (rst_out_w[0]),
      .mcGo                     (mcGo_w[0]),
      .idelayctrl_refclk        (idelayctrl_refclk),
      .idelay_inc               (idelay_inc),
      .idelay_ce                (idelay_ce),
      .idelay_ld                (idelay_ld),
      .phy_ctl_mstr_empty       (phy_ctl_mstr_empty),
      .if_empty_def             (if_empty_def),
      .if_a_empty               (if_a_empty_v[0]),
      .if_empty                 (if_empty_v[0]),
      .mux_i0                   (mux_i0_v[0]),
      .mux_i1                   (mux_i1_v[0]),
      .of_ctl_a_full            (of_ctl_a_full_v[0]),
      .of_data_a_full           (of_data_a_full_v[0]),
      .of_ctl_full              (of_ctl_full_v[0]),
      .of_data_full             (of_data_full_v[0]),
      .phy_din                  (phy_din[HIGHEST_LANE_B0*80-1:0]),
      .phy_ctl_a_full           (_phy_ctl_a_full_p[0]),
      .phy_ctl_full             (_phy_ctl_full_p[0]),
      .phy_ctl_empty            (phy_ctl_empty[0]),
      .mem_dq_out               (mem_dq_out[HIGHEST_LANE_B0*12-1:0]),
      .mem_dq_ts                (mem_dq_ts[HIGHEST_LANE_B0*12-1:0]),
      .mem_dq_in                (mem_dq_in[HIGHEST_LANE_B0*10-1:0]),
      .mem_dqs_out              (mem_dqs_out[HIGHEST_LANE_B0-1:0]),
      .mem_dqs_ts               (mem_dqs_ts[HIGHEST_LANE_B0-1:0]),
      .mem_dqs_in               (mem_dqs_in[HIGHEST_LANE_B0-1:0]),
      .aux_out                  (aux_out_[3:0]),
      .phy_ctl_ready            (phy_ctl_ready_w[0]),
      .phy_write_calib          (phy_write_calib),
      .phy_read_calib           (phy_read_calib),
//      .scan_test_bus_A          (scan_test_bus_A),
//      .scan_test_bus_B          (),
//      .scan_test_bus_C          (),
//      .scan_test_bus_D          (),
      .input_sink               (),
      .calib_sel                ({calib_zero_inputs_int[0], calib_sel[1:0]}),
      .calib_zero_ctrl          (calib_zero_ctrl[0]),
      .calib_in_common          (calib_in_common),
      .phy_encalib              (phy_encalib),
      .po_coarse_enable         (po_coarse_enable),
      .po_fine_enable           (po_fine_enable),
      .po_fine_inc              (po_fine_inc),
      .po_coarse_inc            (po_coarse_inc),
      .po_counter_load_en       (po_counter_load_en),
      .po_sel_fine_oclk_delay   (po_sel_fine_oclk_delay),
      .po_counter_load_val      (po_counter_load_val),
      .po_counter_read_en       (po_counter_read_en),
      .po_coarse_overflow       (po_coarse_overflow_w[0]),
      .po_fine_overflow         (po_fine_overflow_w[0]),
      .po_counter_read_val      (po_counter_read_val_w[0]),
      .pi_rst_dqs_find          (pi_rst_dqs_find),
      .pi_fine_enable           (pi_fine_enable),
      .pi_fine_inc              (pi_fine_inc),
      .pi_counter_load_en       (pi_counter_load_en),
      .pi_counter_read_en       (pi_counter_read_en),
      .pi_counter_load_val      (pi_counter_load_val),
      .pi_fine_overflow         (pi_fine_overflow_w[0]),
      .pi_counter_read_val      (pi_counter_read_val_w[0]),
      .pi_dqs_found             (pi_dqs_found_w[0]),
      .pi_dqs_found_all         (pi_dqs_found_all_w[0]),
      .pi_dqs_found_any         (pi_dqs_found_any_w[0]),
      .pi_dqs_out_of_range      (pi_dqs_out_of_range_w[0]),
      .pi_phase_locked          (pi_phase_locked_w[0]),
      .pi_phase_locked_all      (pi_phase_locked_all_w[0])
);
if ( RCLK_SELECT_EDGE[0])
      always @(posedge rclk_w[0] or posedge rst)  begin
     if (rst)
         aux_out[3:0] <= #1 0;
     else
         aux_out[3:0] <= #1 aux_out_[3:0];
   end
   else
      always @(negedge rclk_w[0] or posedge rst)  begin
     if (rst)
         aux_out[3:0] <= #1 0;
     else
         aux_out[3:0] <= #1 aux_out_[3:0];
   end
end
else begin
   if ( HIGHEST_BANK > 0) begin
       assign phy_din[319:0] = 0;
       assign _phy_ctl_a_full_p[0] = 0;
       assign of_ctl_a_full_v[0]   = 0;
       assign of_ctl_full_v[0]     = 0;
       assign of_data_a_full_v[0]  = 0;
       assign of_data_full_v[0]    = 0;
       assign if_empty_v[0]        = 0;
       assign mux_i0_v[0]          = 0;
       assign mux_i1_v[0]          = 0;
       always @(*)
           aux_out[3:0] = 0;
   end
       assign pi_dqs_found_w[0]    = 1;
       assign pi_dqs_found_all_w[0]    = 1;
       assign pi_dqs_found_any_w[0]    = 0;
       assign pi_dqs_out_of_range_w[0]    = 0;
       assign pi_phase_locked_w[0]    = 1;
       assign po_fine_overflow_w[0] = 0;
       assign po_coarse_overflow_w[0] = 0;
       assign po_fine_overflow_w[0] = 0;
       assign pi_fine_overflow_w[0] = 0;
       assign po_counter_read_val_w[0] = 0;
       assign pi_counter_read_val_w[0] = 0;
       if ( RCLK_SELECT_BANK == 0)
       always @(*)
           aux_out[3:0] = 0;
end
if ( BYTE_LANES_B1 != 0) begin : phy_4lanes_1
phy_4lanes #(
     .BYTE_LANES                (BYTE_LANES_B1),        /* four bits, one per lanes */
     .DATA_CTL_N                (PHY_1_DATA_CTL), /* four bits, one per lane */
     .PO_CTL_COARSE_BYPASS      (PO_CTL_COARSE_BYPASS),
     .PO_FINE_DELAY             (L_PHY_1_PO_FINE_DELAY),
     .BITLANES                  (PHY_1_BITLANES),
     .BITLANES_OUTONLY          (PHY_1_BITLANES_OUTONLY),
     .LAST_BANK                 (PHY_1_IS_LAST_BANK ),
     .LANE_REMAP                (PHY_1_LANE_REMAP),
     //.OF_ALMOST_FULL_VALUE      (PHY_1_OF_ALMOST_FULL_VALUE),
     //.IF_ALMOST_EMPTY_VALUE     (PHY_1_IF_ALMOST_EMPTY_VALUE),
     .GENERATE_IDELAYCTRL       (PHY_1_GENERATE_IDELAYCTRL),
     .GENERATE_DDR_CK           (PHY_1_GENERATE_DDR_CK),
     .NUM_DDR_CK                (PHY_1_NUM_DDR_CK),
     .DIFFERENTIAL_DQS          (PHY_1_DIFFERENTIAL_DQS),
     .TCK                       (TCK),
     .RCLK_SELECT_LANE          (RCLK_SELECT_LANE),
     .MC_DIVIDE                 (PHY_CLK_RATIO),
     .PC_CLK_RATIO              (PHY_CLK_RATIO),
     .PC_EVENTS_DELAY           (PHY_EVENTS_DELAY),
     .PC_FOUR_WINDOW_CLOCKS     (PHY_FOUR_WINDOW_CLOCKS),
     .PC_BURST_MODE             (PHY_1_A_BURST_MODE),
     .PC_SYNC_MODE              (PHY_SYNC_MODE),
     .PC_MULTI_REGION           (PHY_MULTI_REGION),
     .PC_PHY_COUNT_EN           (PHY_COUNT_EN),
     .PC_DISABLE_SEQ_MATCH      (PHY_DISABLE_SEQ_MATCH),
     .PC_CMD_OFFSET             (PHY_1_CMD_OFFSET),
     .PC_RD_CMD_OFFSET_0        (PHY_1_RD_CMD_OFFSET_0),
     .PC_RD_CMD_OFFSET_1        (PHY_1_RD_CMD_OFFSET_1),
     .PC_RD_CMD_OFFSET_2        (PHY_1_RD_CMD_OFFSET_2),
     .PC_RD_CMD_OFFSET_3        (PHY_1_RD_CMD_OFFSET_3),
     .PC_RD_DURATION_0          (PHY_1_RD_DURATION_0),
     .PC_RD_DURATION_1          (PHY_1_RD_DURATION_1),
     .PC_RD_DURATION_2          (PHY_1_RD_DURATION_2),
     .PC_RD_DURATION_3          (PHY_1_RD_DURATION_3),
     .PC_WR_CMD_OFFSET_0        (PHY_1_WR_CMD_OFFSET_0),
     .PC_WR_CMD_OFFSET_1        (PHY_1_WR_CMD_OFFSET_1),
     .PC_WR_CMD_OFFSET_2        (PHY_1_WR_CMD_OFFSET_2),
     .PC_WR_CMD_OFFSET_3        (PHY_1_WR_CMD_OFFSET_3),
     .PC_WR_DURATION_0          (PHY_1_WR_DURATION_0),
     .PC_WR_DURATION_1          (PHY_1_WR_DURATION_1),
     .PC_WR_DURATION_2          (PHY_1_WR_DURATION_2),
     .PC_WR_DURATION_3          (PHY_1_WR_DURATION_3),
     .PC_AO_WRLVL_EN            (PHY_1_AO_WRLVL_EN),
     .PC_AO_TOGGLE              (PHY_1_AO_TOGGLE),
     .A_PI_FINE_DELAY           (PHY_1_A_PI_FINE_DELAY),
     .B_PI_FINE_DELAY           (PHY_1_B_PI_FINE_DELAY),
     .C_PI_FINE_DELAY           (PHY_1_C_PI_FINE_DELAY),
     .D_PI_FINE_DELAY           (PHY_1_D_PI_FINE_DELAY),
     .A_PI_FREQ_REF_DIV         (PHY_1_A_PI_FREQ_REF_DIV),
     //.A_PI_CLKOUT_DIV           (PHY_1_A_PI_CLKOUT_DIV),
     //.A_PO_CLKOUT_DIV           (PHY_1_A_PO_CLKOUT_DIV),
     .A_PI_BURST_MODE           (PHY_1_A_BURST_MODE),
     .A_PI_OUTPUT_CLK_SRC       (_PHY_1_A_PI_OUTPUT_CLK_SRC),
     .B_PI_OUTPUT_CLK_SRC       (_PHY_1_B_PI_OUTPUT_CLK_SRC),
     .C_PI_OUTPUT_CLK_SRC       (_PHY_1_C_PI_OUTPUT_CLK_SRC),
     .D_PI_OUTPUT_CLK_SRC       (_PHY_1_D_PI_OUTPUT_CLK_SRC),
     .A_PO_OUTPUT_CLK_SRC       (PHY_1_A_PO_OUTPUT_CLK_SRC),
     .A_PO_OCLK_DELAY           (PHY_1_A_PO_OCLK_DELAY),
     .A_PO_OCLKDELAY_INV        (PHY_1_A_PO_OCLKDELAY_INV),
     .A_OF_ARRAY_MODE           (PHY_1_A_OF_ARRAY_MODE),
     .B_OF_ARRAY_MODE           (PHY_1_B_OF_ARRAY_MODE),
     .C_OF_ARRAY_MODE           (PHY_1_C_OF_ARRAY_MODE),
     .D_OF_ARRAY_MODE           (PHY_1_D_OF_ARRAY_MODE),
     .A_IF_ARRAY_MODE           (PHY_1_A_IF_ARRAY_MODE),
     .B_IF_ARRAY_MODE           (PHY_1_B_IF_ARRAY_MODE),
     .C_IF_ARRAY_MODE           (PHY_1_C_IF_ARRAY_MODE),
     .D_IF_ARRAY_MODE           (PHY_1_D_IF_ARRAY_MODE),
     .A_OS_DATA_RATE            (PHY_1_A_OSERDES_DATA_RATE),
     .A_OS_DATA_WIDTH           (PHY_1_A_OSERDES_DATA_WIDTH),
     .B_OS_DATA_RATE            (PHY_1_B_OSERDES_DATA_RATE),
     .B_OS_DATA_WIDTH           (PHY_1_B_OSERDES_DATA_WIDTH),
     .C_OS_DATA_RATE            (PHY_1_C_OSERDES_DATA_RATE),
     .C_OS_DATA_WIDTH           (PHY_1_C_OSERDES_DATA_WIDTH),
     .D_OS_DATA_RATE            (PHY_1_D_OSERDES_DATA_RATE),
     .D_OS_DATA_WIDTH           (PHY_1_D_OSERDES_DATA_WIDTH),
     .A_IDELAYE2_IDELAY_TYPE    (PHY_1_A_IDELAYE2_IDELAY_TYPE),
     .A_IDELAYE2_IDELAY_VALUE   (PHY_1_A_IDELAYE2_IDELAY_VALUE),
     .IODELAY_GRP               (IODELAY_GRP)
)
 phy_4lanes
(
      .rst                      (rst),
      .phy_clk                  (phy_clk_split1),
      .phy_ctl_clk              (phy_ctl_clk_split1),
      .phy_ctl_wd               (phy_ctl_wd_split1),
      .data_offset              (data_offset_1_split1),
      .phy_ctl_wr               (phy_ctl_wr_split1),
      .mem_refclk               (mem_refclk_split),
      .freq_refclk              (freq_refclk_split),
      .mem_refclk_div4          (mem_refclk_div4_split),
      .sync_pulse               (sync_pulse_split),
      .phy_dout                 (phy_dout_split1[HIGHEST_LANE_B1*80+320-1:320]),
      .phy_cmd_wr_en            (phy_cmd_wr_en_split1),
      .phy_data_wr_en           (phy_data_wr_en_split1),
      .phy_rd_en                (phy_rd_en_split1),
      .pll_lock                 (pll_lock),
      .ddr_clk                  (ddr_clk_w[1]),
      .rclk                     (rclk_w[1]),
      .rst_out                  (rst_out_w[1]),
      .mcGo                     (mcGo_w[1]),
      .idelayctrl_refclk        (idelayctrl_refclk),
      .idelay_inc               (idelay_inc),
      .idelay_ce                (idelay_ce),
      .idelay_ld                (idelay_ld),
      .phy_ctl_mstr_empty       (phy_ctl_mstr_empty),
      .if_empty_def             (if_empty_def),
      .if_a_empty               (if_a_empty_v[1]),
      .if_empty                 (if_empty_v[1]),
      .mux_i0                   (mux_i0_v[1]),
      .mux_i1                   (mux_i1_v[1]),
      .of_ctl_a_full            (of_ctl_a_full_v[1]),
      .of_data_a_full           (of_data_a_full_v[1]),
      .of_ctl_full              (of_ctl_full_v[1]),
      .of_data_full             (of_data_full_v[1]),
      .phy_din                  (phy_din[HIGHEST_LANE_B1*80+320-1:320]),
      .phy_ctl_a_full           (_phy_ctl_a_full_p[1]),
      .phy_ctl_full             (_phy_ctl_full_p[1]),
      .phy_ctl_empty            (phy_ctl_empty[1]),
      .mem_dq_out               (mem_dq_out[HIGHEST_LANE_B1*12+48-1:48]),
      .mem_dq_ts                (mem_dq_ts[HIGHEST_LANE_B1*12+48-1:48]),
      .mem_dq_in                (mem_dq_in[HIGHEST_LANE_B1*10+40-1:40]),
      .mem_dqs_out              (mem_dqs_out[HIGHEST_LANE_B1+4-1:4]),
      .mem_dqs_ts               (mem_dqs_ts[HIGHEST_LANE_B1+4-1:4]),
      .mem_dqs_in               (mem_dqs_in[HIGHEST_LANE_B1+4-1:4]),
      .aux_out                  (aux_out_[7:4]),
      .phy_ctl_ready            (phy_ctl_ready_w[1]),
      .phy_write_calib          (phy_write_calib),
      .phy_read_calib           (phy_read_calib),
//      .scan_test_bus_A          (scan_test_bus_A),
//      .scan_test_bus_B          (),
//      .scan_test_bus_C          (),
//      .scan_test_bus_D          (),
      .input_sink               (),
      .calib_sel                ({calib_zero_inputs_int[1], calib_sel[1:0]}),
      .calib_zero_ctrl          (calib_zero_ctrl[1]),
      .calib_in_common          (calib_in_common),
      .phy_encalib              (phy_encalib),
      .po_coarse_enable         (po_coarse_enable),
      .po_fine_enable           (po_fine_enable),
      .po_fine_inc              (po_fine_inc),
      .po_coarse_inc            (po_coarse_inc),
      .po_counter_load_en       (po_counter_load_en),
      .po_sel_fine_oclk_delay   (po_sel_fine_oclk_delay),
      .po_counter_load_val      (po_counter_load_val),
      .po_counter_read_en       (po_counter_read_en),
      .po_coarse_overflow       (po_coarse_overflow_w[1]),
      .po_fine_overflow         (po_fine_overflow_w[1]),
      .po_counter_read_val      (po_counter_read_val_w[1]),
      .pi_rst_dqs_find          (pi_rst_dqs_find),
      .pi_fine_enable           (pi_fine_enable),
      .pi_fine_inc              (pi_fine_inc),
      .pi_counter_load_en       (pi_counter_load_en),
      .pi_counter_read_en       (pi_counter_read_en),
      .pi_counter_load_val      (pi_counter_load_val),
      .pi_fine_overflow         (pi_fine_overflow_w[1]),
      .pi_counter_read_val      (pi_counter_read_val_w[1]),
      .pi_dqs_found             (pi_dqs_found_w[1]),
      .pi_dqs_found_all         (pi_dqs_found_all_w[1]),
      .pi_dqs_found_any         (pi_dqs_found_any_w[1]),
      .pi_dqs_out_of_range      (pi_dqs_out_of_range_w[1]),
      .pi_phase_locked          (pi_phase_locked_w[1]),
      .pi_phase_locked_all      (pi_phase_locked_all_w[1])
);
if ( RCLK_SELECT_EDGE[1])
   always @(posedge rclk_w[1] or posedge rst)  begin
     if (rst)
         aux_out[7:4] <= #1 0;
     else
         aux_out[7:4] <= #1 aux_out_[7:4];
   end
   else
   always @(negedge rclk_w[1] or posedge rst)  begin
     if (rst)
         aux_out[7:4] <= #1 0;
     else
         aux_out[7:4] <= #1 aux_out_[7:4];
   end
end
else begin
   if ( HIGHEST_BANK > 1)  begin
       assign phy_din[2*320-1:320] = 0;
       assign _phy_ctl_a_full_p[1] = 0;
       assign of_ctl_a_full_v[1]   = 0;
       assign of_ctl_full_v[1]     = 0;
       assign of_data_a_full_v[1]  = 0;
       assign of_data_full_v[1]    = 0;
       assign if_empty_v[1]        = 0;
       assign mux_i0_v[1]          = 0;
       assign mux_i1_v[1]          = 0;
       always @(*)
          aux_out[7:4] = 0;
   end
       assign pi_dqs_found_w[1]    = 1;
       assign pi_dqs_found_all_w[1]    = 1;
       assign pi_dqs_found_any_w[1]    = 0;
       assign pi_dqs_out_of_range_w[1]    = 0;
       assign pi_phase_locked_w[1]    = 1;
       assign po_coarse_overflow_w[1] = 0;
       assign po_fine_overflow_w[1] = 0;
       assign pi_fine_overflow_w[1] = 0;
       assign po_counter_read_val_w[1] = 0;
       assign pi_counter_read_val_w[1] = 0;
end
if ( BYTE_LANES_B2 != 0) begin : phy_4lanes_2
phy_4lanes #(
     .BYTE_LANES                (BYTE_LANES_B2),        /* four bits, one per lanes */
     .DATA_CTL_N                (PHY_2_DATA_CTL), /* four bits, one per lane */
     .PO_CTL_COARSE_BYPASS      (PO_CTL_COARSE_BYPASS),
     .PO_FINE_DELAY             (L_PHY_2_PO_FINE_DELAY),
     .BITLANES                  (PHY_2_BITLANES),
     .BITLANES_OUTONLY          (PHY_2_BITLANES_OUTONLY),
     .LAST_BANK                 (PHY_2_IS_LAST_BANK ),
     .LANE_REMAP                (PHY_2_LANE_REMAP),
     //.OF_ALMOST_FULL_VALUE      (PHY_2_OF_ALMOST_FULL_VALUE),
     //.IF_ALMOST_EMPTY_VALUE     (PHY_2_IF_ALMOST_EMPTY_VALUE),
     .GENERATE_IDELAYCTRL       (PHY_2_GENERATE_IDELAYCTRL),
     .GENERATE_DDR_CK           (PHY_2_GENERATE_DDR_CK),
     .NUM_DDR_CK                (PHY_2_NUM_DDR_CK),
     .DIFFERENTIAL_DQS          (PHY_2_DIFFERENTIAL_DQS),
     .TCK                       (TCK),
     .RCLK_SELECT_LANE          (RCLK_SELECT_LANE),
     .PC_CLK_RATIO              (PHY_CLK_RATIO),
     .MC_DIVIDE                 (PHY_CLK_RATIO),
     .PC_EVENTS_DELAY           (PHY_EVENTS_DELAY),
     .PC_FOUR_WINDOW_CLOCKS     (PHY_FOUR_WINDOW_CLOCKS),
     .PC_BURST_MODE             (PHY_2_A_BURST_MODE),
     .PC_SYNC_MODE              (PHY_SYNC_MODE),
     .PC_MULTI_REGION           (PHY_MULTI_REGION),
     .PC_PHY_COUNT_EN           (PHY_COUNT_EN),
     .PC_DISABLE_SEQ_MATCH      (PHY_DISABLE_SEQ_MATCH),
     .PC_CMD_OFFSET             (PHY_2_CMD_OFFSET),
     .PC_RD_CMD_OFFSET_0        (PHY_2_RD_CMD_OFFSET_0),
     .PC_RD_CMD_OFFSET_1        (PHY_2_RD_CMD_OFFSET_1),
     .PC_RD_CMD_OFFSET_2        (PHY_2_RD_CMD_OFFSET_2),
     .PC_RD_CMD_OFFSET_3        (PHY_2_RD_CMD_OFFSET_3),
     .PC_RD_DURATION_0          (PHY_2_RD_DURATION_0),
     .PC_RD_DURATION_1          (PHY_2_RD_DURATION_1),
     .PC_RD_DURATION_2          (PHY_2_RD_DURATION_2),
     .PC_RD_DURATION_3          (PHY_2_RD_DURATION_3),
     .PC_WR_CMD_OFFSET_0        (PHY_2_WR_CMD_OFFSET_0),
     .PC_WR_CMD_OFFSET_1        (PHY_2_WR_CMD_OFFSET_1),
     .PC_WR_CMD_OFFSET_2        (PHY_2_WR_CMD_OFFSET_2),
     .PC_WR_CMD_OFFSET_3        (PHY_2_WR_CMD_OFFSET_3),
     .PC_WR_DURATION_0          (PHY_2_WR_DURATION_0),
     .PC_WR_DURATION_1          (PHY_2_WR_DURATION_1),
     .PC_WR_DURATION_2          (PHY_2_WR_DURATION_2),
     .PC_WR_DURATION_3          (PHY_2_WR_DURATION_3),
     .PC_AO_WRLVL_EN            (PHY_2_AO_WRLVL_EN),
     .PC_AO_TOGGLE              (PHY_2_AO_TOGGLE),
     .A_PI_FINE_DELAY           (PHY_2_A_PI_FINE_DELAY),
     .B_PI_FINE_DELAY           (PHY_2_B_PI_FINE_DELAY),
     .C_PI_FINE_DELAY           (PHY_2_C_PI_FINE_DELAY),
     .D_PI_FINE_DELAY           (PHY_2_D_PI_FINE_DELAY),
     .A_PI_FREQ_REF_DIV         (PHY_2_A_PI_FREQ_REF_DIV),
     //.A_PI_CLKOUT_DIV           (PHY_2_A_PI_CLKOUT_DIV),
     //.A_PO_CLKOUT_DIV           (PHY_2_A_PO_CLKOUT_DIV),
     .A_PI_BURST_MODE           (PHY_2_A_BURST_MODE),
     .A_PI_OUTPUT_CLK_SRC       (_PHY_2_A_PI_OUTPUT_CLK_SRC),
     .B_PI_OUTPUT_CLK_SRC       (_PHY_2_B_PI_OUTPUT_CLK_SRC),
     .C_PI_OUTPUT_CLK_SRC       (_PHY_2_C_PI_OUTPUT_CLK_SRC),
     .D_PI_OUTPUT_CLK_SRC       (_PHY_2_D_PI_OUTPUT_CLK_SRC),
     .A_PO_OUTPUT_CLK_SRC       (PHY_2_A_PO_OUTPUT_CLK_SRC),
     .A_PO_OCLK_DELAY           (PHY_2_A_PO_OCLK_DELAY),
     .A_PO_OCLKDELAY_INV        (PHY_2_A_PO_OCLKDELAY_INV),
     .A_OF_ARRAY_MODE           (PHY_2_A_OF_ARRAY_MODE),
     .B_OF_ARRAY_MODE           (PHY_2_B_OF_ARRAY_MODE),
     .C_OF_ARRAY_MODE           (PHY_2_C_OF_ARRAY_MODE),
     .D_OF_ARRAY_MODE           (PHY_2_D_OF_ARRAY_MODE),
     .A_IF_ARRAY_MODE           (PHY_2_A_IF_ARRAY_MODE),
     .B_IF_ARRAY_MODE           (PHY_2_B_IF_ARRAY_MODE),
     .C_IF_ARRAY_MODE           (PHY_2_C_IF_ARRAY_MODE),
     .D_IF_ARRAY_MODE           (PHY_2_D_IF_ARRAY_MODE),
     .A_OS_DATA_RATE            (PHY_2_A_OSERDES_DATA_RATE),
     .A_OS_DATA_WIDTH           (PHY_2_A_OSERDES_DATA_WIDTH),
     .B_OS_DATA_RATE            (PHY_2_B_OSERDES_DATA_RATE),
     .B_OS_DATA_WIDTH           (PHY_2_B_OSERDES_DATA_WIDTH),
     .C_OS_DATA_RATE            (PHY_2_C_OSERDES_DATA_RATE),
     .C_OS_DATA_WIDTH           (PHY_2_C_OSERDES_DATA_WIDTH),
     .D_OS_DATA_RATE            (PHY_2_D_OSERDES_DATA_RATE),
     .D_OS_DATA_WIDTH           (PHY_2_D_OSERDES_DATA_WIDTH),
     .A_IDELAYE2_IDELAY_TYPE    (PHY_2_A_IDELAYE2_IDELAY_TYPE),
     .A_IDELAYE2_IDELAY_VALUE   (PHY_2_A_IDELAYE2_IDELAY_VALUE),
     .IODELAY_GRP               (IODELAY_GRP)
)
 phy_4lanes
(
      .rst                      (rst),
      .phy_clk                  (phy_clk_split2),
      .phy_ctl_clk              (phy_ctl_clk_split2),
      .phy_ctl_wd               (phy_ctl_wd_split2),
      .data_offset              (data_offset_2_split2),
      .phy_ctl_wr               (phy_ctl_wr_split2),
      .mem_refclk               (mem_refclk_split),
      .freq_refclk              (freq_refclk_split),
      .mem_refclk_div4          (mem_refclk_div4_split),
      .sync_pulse               (sync_pulse_split),
      .phy_dout                 (phy_dout_split2[HIGHEST_LANE_B2*80+640-1:640]),
      .phy_cmd_wr_en            (phy_cmd_wr_en_split2),
      .phy_data_wr_en           (phy_data_wr_en_split2),
      .phy_rd_en                (phy_rd_en_split2),
      .pll_lock                 (pll_lock),
      .ddr_clk                  (ddr_clk_w[2]),
      .rclk                     (rclk_w[2]),
      .rst_out                  (rst_out_w[2]),
      .mcGo                     (mcGo_w[2]),
      .idelayctrl_refclk        (idelayctrl_refclk),
      .idelay_inc               (idelay_inc),
      .idelay_ce                (idelay_ce),
      .idelay_ld                (idelay_ld),
      .phy_ctl_mstr_empty       (phy_ctl_mstr_empty),
      .if_empty_def             (if_empty_def),
      .if_a_empty               (if_a_empty_v[2]),
      .if_empty                 (if_empty_v[2]),
      .mux_i0                   (mux_i0_v[2]),
      .mux_i1                   (mux_i1_v[2]),
      .of_ctl_a_full            (of_ctl_a_full_v[2]),
      .of_data_a_full           (of_data_a_full_v[2]),
      .of_ctl_full              (of_ctl_full_v[2]),
      .of_data_full             (of_data_full_v[2]),
      .phy_din                  (phy_din[HIGHEST_LANE_B2*80+640-1:640]),
      .phy_ctl_a_full           (_phy_ctl_a_full_p[2]),
      .phy_ctl_full             (_phy_ctl_full_p[2]),
      .phy_ctl_empty            (phy_ctl_empty[2]),
      .mem_dq_out               (mem_dq_out[HIGHEST_LANE_B2*12+96-1:96]),
      .mem_dq_ts                (mem_dq_ts[HIGHEST_LANE_B2*12+96-1:96]),
      .mem_dq_in                (mem_dq_in[HIGHEST_LANE_B2*10+80-1:80]),
      .mem_dqs_out              (mem_dqs_out[HIGHEST_LANE_B2-1+8:8]),
      .mem_dqs_ts               (mem_dqs_ts[HIGHEST_LANE_B2-1+8:8]),
      .mem_dqs_in               (mem_dqs_in[HIGHEST_LANE_B2-1+8:8]),
      .aux_out                  (aux_out_[11:8]),
      .phy_ctl_ready            (phy_ctl_ready_w[2]),
      .phy_write_calib          (phy_write_calib),
      .phy_read_calib           (phy_read_calib),
//      .scan_test_bus_A          (scan_test_bus_A),
//      .scan_test_bus_B          (),
//      .scan_test_bus_C          (),
//      .scan_test_bus_D          (),
      .input_sink               (),
      .calib_sel                ({calib_zero_inputs_int[2], calib_sel[1:0]}),
      .calib_zero_ctrl          (calib_zero_ctrl[2]),
      .calib_in_common          (calib_in_common),
      .phy_encalib              (phy_encalib),
      .po_coarse_enable         (po_coarse_enable),
      .po_fine_enable           (po_fine_enable),
      .po_fine_inc              (po_fine_inc),
      .po_coarse_inc            (po_coarse_inc),
      .po_counter_load_en       (po_counter_load_en),
      .po_sel_fine_oclk_delay   (po_sel_fine_oclk_delay),
      .po_counter_load_val      (po_counter_load_val),
      .po_counter_read_en       (po_counter_read_en),
      .po_coarse_overflow       (po_coarse_overflow_w[2]),
      .po_fine_overflow         (po_fine_overflow_w[2]),
      .po_counter_read_val      (po_counter_read_val_w[2]),
      .pi_rst_dqs_find          (pi_rst_dqs_find),
      .pi_fine_enable           (pi_fine_enable),
      .pi_fine_inc              (pi_fine_inc),
      .pi_counter_load_en       (pi_counter_load_en),
      .pi_counter_read_en       (pi_counter_read_en),
      .pi_counter_load_val      (pi_counter_load_val),
      .pi_fine_overflow         (pi_fine_overflow_w[2]),
      .pi_counter_read_val      (pi_counter_read_val_w[2]),
      .pi_dqs_found             (pi_dqs_found_w[2]),
      .pi_dqs_found_all         (pi_dqs_found_all_w[2]),
      .pi_dqs_found_any         (pi_dqs_found_any_w[2]),
      .pi_dqs_out_of_range      (pi_dqs_out_of_range_w[2]),
      .pi_phase_locked          (pi_phase_locked_w[2]),
      .pi_phase_locked_all      (pi_phase_locked_all_w[2])
);
if (RCLK_SELECT_EDGE[2])
   always @(posedge rclk_w[2]  or posedge rst)  begin
     if (rst)
         aux_out[11:8] <= #1 0;
     else
         aux_out[11:8] <= #1 aux_out_[11:8];
     end
else
   always @(negedge rclk_w[2] or posedge rst)  begin
     if (rst)
         aux_out[11:8] <= #1 0;
     else
         aux_out[11:8] <= #1 aux_out_[11:8];
     end
end
else begin
   if ( HIGHEST_BANK > 2)  begin
       assign phy_din[3*320-1:640] = 0;
       assign _phy_ctl_a_full_p[2] = 0;
       assign of_ctl_a_full_v[2]   = 0;
       assign of_ctl_full_v[2]     = 0;
       assign of_data_a_full_v[2]  = 0;
       assign of_data_full_v[2]    = 0;
       assign if_empty_v[2]        = 0;
       assign mux_i0_v[2]          = 0;
       assign mux_i1_v[2]          = 0;
       always @(*)
         aux_out[11:8] = 0;
   end
       assign pi_dqs_found_w[2]    = 1;
       assign pi_dqs_found_all_w[2]    = 1;
       assign pi_dqs_found_any_w[2]    = 0;
       assign pi_dqs_out_of_range_w[2]    = 0;
       assign pi_phase_locked_w[2]    = 1;
       assign po_coarse_overflow_w[2] = 0;
       assign po_fine_overflow_w[2] = 0;
       assign po_counter_read_val_w[2] = 0;
       assign pi_counter_read_val_w[2] = 0;
end
endgenerate
generate
// emit an extra phaser_in to generate rclk
// so that rst and auxout can be placed in another region
// if desired
if ( BYTE_LANES_B1 == 0 && BYTE_LANES_B2 == 0 && RCLK_SELECT_BANK>0)
begin : phaser_in_rclk
`ifdef FUJI_PHY_BLH
B_PHASER_IN_PHY #(
`else
PHASER_IN_PHY #(
`endif
  .BURST_MODE                       ( PHY_0_A_BURST_MODE),
  .CLKOUT_DIV                       ( PHY_0_A_PI_CLKOUT_DIV),
  .FREQ_REF_DIV                     ( PHY_0_A_PI_FREQ_REF_DIV),
  .REFCLK_PERIOD                    ( FREQ_REF_PER_NS),
  .OUTPUT_CLK_SRC                   ( RCLK_PI_OUTPUT_CLK_SRC)
) phaser_in_rclk (
  .DQSFOUND                         (),
  .DQSOUTOFRANGE                    (),
  .FINEOVERFLOW                     (),
  .PHASELOCKED                      (),
  .ISERDESRST                       (),
  .ICLKDIV                          (),
  .ICLK                             (),
  .COUNTERREADVAL                   (),
  .RCLK                             (rclk_w[RCLK_SELECT_BANK]),
  .WRENABLE                         (),
  .BURSTPENDINGPHY                  (),
  .ENCALIBPHY                       (),
  .FINEENABLE                       (0),
  .FREQREFCLK                       (freq_refclk),
  .MEMREFCLK                        (mem_refclk),
  .RANKSELPHY                       (0),
  .PHASEREFCLK                      (),
  .RSTDQSFIND                       (0),
  .RST                              (rst),
  .FINEINC                          (),
  .COUNTERLOADEN                    (),
  .COUNTERREADEN                    (),
  .COUNTERLOADVAL                   (),
  .SYNCIN                           (sync_pulse),
  .SYSCLK                           (phy_clk)
);
end
endgenerate
always @(*) begin
      case (calib_sel[5:3])
      3'b000: begin
          po_coarse_overflow  = po_coarse_overflow_w[0];
          po_fine_overflow    = po_fine_overflow_w[0];
          po_counter_read_val = po_counter_read_val_w[0];
          pi_fine_overflow    = pi_fine_overflow_w[0];
          pi_counter_read_val = pi_counter_read_val_w[0];
          pi_phase_locked     = pi_phase_locked_w[0];
          if ( calib_in_common)
             pi_dqs_found        = pi_dqs_found_any;
          else
          pi_dqs_found        = pi_dqs_found_w[0];
          pi_dqs_out_of_range = pi_dqs_out_of_range_w[0];
        end
      3'b001: begin
          po_coarse_overflow  = po_coarse_overflow_w[1];
          po_fine_overflow    = po_fine_overflow_w[1];
          po_counter_read_val = po_counter_read_val_w[1];
          pi_fine_overflow    = pi_fine_overflow_w[1];
          pi_counter_read_val = pi_counter_read_val_w[1];
          pi_phase_locked     = pi_phase_locked_w[1];
          if ( calib_in_common)
              pi_dqs_found        = pi_dqs_found_any;
          else
          pi_dqs_found        = pi_dqs_found_w[1];
          pi_dqs_out_of_range = pi_dqs_out_of_range_w[1];
        end
      3'b010: begin
          po_coarse_overflow  = po_coarse_overflow_w[2];
          po_fine_overflow    = po_fine_overflow_w[2];
          po_counter_read_val = po_counter_read_val_w[2];
          pi_fine_overflow    = pi_fine_overflow_w[2];
          pi_counter_read_val = pi_counter_read_val_w[2];
          pi_phase_locked     = pi_phase_locked_w[2];
          if ( calib_in_common)
             pi_dqs_found        = pi_dqs_found_any;
          else
          pi_dqs_found        = pi_dqs_found_w[2];
          pi_dqs_out_of_range = pi_dqs_out_of_range_w[2];
        end
       default: begin
          po_coarse_overflow  = 0;
          po_fine_overflow    = 0;
          po_counter_read_val = 0;
          pi_fine_overflow    = 0;
          pi_counter_read_val = 0;
          pi_phase_locked     = 0;
          pi_dqs_found        = 0;
          pi_dqs_out_of_range = 0;
        end
       endcase
end
endmodule