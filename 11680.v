module
      .rdp_rdy_i               (rd_rdy),// (rd_rdy),
      .rdp_valid_o             (rd_valid),
      .rd_addr_o               (rd_addr),
      .rd_bl_o                 (rd_bl)
      );
  /* afifo #
   (
    .TCQ           (TCQ),
    .DSIZE         (DWIDTH),
    .FIFO_DEPTH    (32),
    .ASIZE         (5),
    .SYNC          (1)  // set the SYNC to 1 because rd_clk = wr_clk to reduce latency
   )
   rd_mdata_fifo
   (
    .wr_clk        (clk_i),
    .rst           (rst_rb[0]),
    .wr_en         (!memc_rd_empty_i),
    .wr_data       (memc_rd_data_i),
    .rd_en         (memc_rd_en_o),
    .rd_clk        (clk_i),
    .rd_data       (rd_v6_mdata),
    .full          (),
    .almost_full   (rd_mdata_fifo_afull),
    .empty         (rd_mdata_fifo_empty)
   );
*/
wire cmd_rd_en;
assign cmd_rd_en =  memc_cmd_en_o;
assign rdpath_data_valid_i =!memc_rd_empty_i ;
assign rdpath_rd_data_i = memc_rd_data_i ;
generate
if (PORT_MODE == "RD_MODE" || PORT_MODE == "BI_MODE")
begin : RD_PATH
   read_data_path
     #(
       .TCQ           (TCQ),
       .FAMILY            (FAMILY)  ,
       .MEM_TYPE           (MEM_TYPE),
       .BL_WIDTH          (BL_WIDTH),
       .nCK_PER_CLK       (nCK_PER_CLK),
       .MEM_BURST_LEN     (MEM_BURST_LEN),
       .START_ADDR        (PRBS_SADDR),
       .CMP_DATA_PIPE_STAGES (CMP_DATA_PIPE_STAGES),
       .ADDR_WIDTH        (ADDR_WIDTH),
       .SEL_VICTIM_LINE   (SEL_VICTIM_LINE),
       .DATA_PATTERN      (DATA_PATTERN),
       .DWIDTH            (DWIDTH),
       .NUM_DQ_PINS       (NUM_DQ_PINS),
       .MEM_COL_WIDTH     (MEM_COL_WIDTH)
       )
   read_data_path
     (
      .clk_i              (clk_i),
      .rst_i              (rst_rb),
      .manual_clear_error (manual_clear_error),
      .cmd_rdy_o          (rd_rdy),
      .cmd_valid_i        (rd_valid),
      .memc_cmd_full_i    (memc_cmd_full_i),
      .prbs_fseed_i         (data_seed_i),
      .cmd_sent                 (memc_cmd_instr_o),
      .bl_sent                  (memc_bl_o[5:0]),
      .cmd_en_i              (cmd_rd_en),
      .data_mode_i        (data_mode_r_b),
      .fixed_data_i         (fixed_data_i),
      .simple_data0       (simple_data0),
      .simple_data1       (simple_data1),
      .simple_data2       (simple_data2),
      .simple_data3       (simple_data3),
      .simple_data4       (simple_data4),
      .simple_data5       (simple_data5),
      .simple_data6       (simple_data6),
      .simple_data7       (simple_data7),
      .mode_load_i        (mode_load_i),
      .addr_i                 (rd_addr),
      .bl_i                   (rd_bl),
      .data_rdy_o             (memc_rd_en_o),
      .data_valid_i           (rdpath_data_valid_i),
      .data_i                 (rdpath_rd_data_i),
      .data_error_o           (cmp_error),
      .cmp_data_valid         (cmp_data_valid),
      .cmp_data_o             (cmp_data),
      .rd_mdata_o             (mem_rd_data ),
      .cmp_addr_o             (cmp_addr),
      .cmp_bl_o               (cmp_bl),
      .dq_error_bytelane_cmp     (dq_error_bytelane_cmp),
      .cumlative_dq_lane_error_r   (cumlative_dq_lane_error),
      .cumlative_dq_r0_bit_error_r  (cumlative_dq_r0_bit_error),
      .cumlative_dq_f0_bit_error_r  (cumlative_dq_f0_bit_error),
      .cumlative_dq_r1_bit_error_r  (cumlative_dq_r1_bit_error),
      .cumlative_dq_f1_bit_error_r  (cumlative_dq_f1_bit_error),
      .dq_r0_bit_error_r               (dq_r0_bit_error_r),
      .dq_f0_bit_error_r               (dq_f0_bit_error_r),
      .dq_r1_bit_error_r               (dq_r1_bit_error_r),
      .dq_f1_bit_error_r               (dq_f1_bit_error_r),
      .dq_r0_read_bit_r              (dq_r0_read_bit),
      .dq_f0_read_bit_r              (dq_f0_read_bit),
      .dq_r1_read_bit_r              (dq_r1_read_bit),
      .dq_f1_read_bit_r              (dq_f1_read_bit),
      .dq_r0_expect_bit_r           (dq_r0_expect_bit),
      .dq_f0_expect_bit_r           (dq_f0_expect_bit ),
      .dq_r1_expect_bit_r           (dq_r1_expect_bit),
      .dq_f1_expect_bit_r           (dq_f1_expect_bit ),
      .error_addr_o                 (error_addr)
      );
end
else
begin
  assign cmp_error  = 1'b0;
  assign cmp_data_valid = 1'b0;
  assign cmp_data ='b0;
end
endgenerate
assign wr_path_data_rdy_i = !(memc_wr_full_i );
generate
if (PORT_MODE == "WR_MODE" || PORT_MODE == "BI_MODE")
begin : WR_PATH
   write_data_path
     #(
       .TCQ           (TCQ),
       .FAMILY  (FAMILY),
       .nCK_PER_CLK       (nCK_PER_CLK),
       .MEM_TYPE           (MEM_TYPE),
       .START_ADDR        (PRBS_SADDR),
       .BL_WIDTH          (BL_WIDTH),
       .MEM_BURST_LEN     (MEM_BURST_LEN),
       .ADDR_WIDTH        (ADDR_WIDTH),
       .DATA_PATTERN      (DATA_PATTERN),
       .DWIDTH            (DWIDTH),
       .NUM_DQ_PINS       (NUM_DQ_PINS),
       .SEL_VICTIM_LINE   (SEL_VICTIM_LINE),
       .MEM_COL_WIDTH     (MEM_COL_WIDTH),
       .EYE_TEST          (EYE_TEST)
       )
   write_data_path
     (
      .clk_i(clk_i),
      .rst_i                (rst_rb),
      .cmd_rdy_o            (wr_rdy),
      .cmd_valid_i          (wr_valid),
      .cmd_validB_i         (wr_validB),
      .cmd_validC_i         (wr_validC),
      .prbs_fseed_i         (data_seed_i),
      .mode_load_i          (mode_load_i),
      .wr_data_mask_gen_i    (wr_data_mask_gen_i),
      .mem_init_done_i      (mem_init_done),
      .data_mode_i          (data_mode_r_c),
      .last_word_wr_o       (last_word_wr),
      .fixed_data_i         (fixed_data_i),
      .simple_data0       (simple_data0),
      .simple_data1       (simple_data1),
      .simple_data2       (simple_data2),
      .simple_data3       (simple_data3),
      .simple_data4       (simple_data4),
      .simple_data5       (simple_data5),
      .simple_data6       (simple_data6),
      .simple_data7       (simple_data7),
      .addr_i               (wr_addr),
      .bl_i                 (wr_bl),
      .data_rdy_i           (wr_path_data_rdy_i),
      .data_valid_o         (memc_wr_en),
      .data_o               (memc_wr_data),
      .data_mask_o          (memc_wr_mask_o),
      .data_wr_end_o        (memc_wr_data_end)
      );
end
else
begin
   assign memc_wr_en       = 1'b0;
   assign memc_wr_data     = 'b0;
   assign memc_wr_mask_o   = 'b0;
end
endgenerate
generate
if (MEM_TYPE != "QDR2PLUS" && (FAMILY == "VIRTEX6" || FAMILY == "SPARTAN6" ))
  begin: nonQDR_WR
    assign  memc_wr_en_o       = memc_wr_en;
    assign  memc_wr_data_o     = memc_wr_data    ;
    assign  memc_wr_data_end_o = (nCK_PER_CLK == 4) ? memc_wr_data_end: memc_wr_data_end;
  end
// QDR
else
  begin: QDR_WR
    always @ (posedge clk_i)
      memc_wr_data_r <= memc_wr_data;
    assign  memc_wr_en_o       = memc_wr_en;
    assign  memc_wr_data_o     = memc_wr_data_r    ;
    assign  memc_wr_data_end_o = memc_wr_data_end;
  end
endgenerate
//QDR
always @ (posedge clk_i)
begin
if (memc_wr_full_i)
   begin
   memc_wr_en_r       <= 1'b0;
   end
else
   begin
   memc_wr_en_r       <= memc_wr_en;
   end
end
   tg_status
     #(
       .TCQ           (TCQ),
       .DWIDTH            (DWIDTH)
       )
   tg_status
     (
      .clk_i              (clk_i),
      .rst_i              (rst_ra[2]),
      .manual_clear_error (manual_clear_error),
      .data_error_i       (cmp_error),
      .cmp_data_i         (cmp_data),
      .rd_data_i          (mem_rd_data ),
      .cmp_addr_i         (cmp_addr),
      .cmp_bl_i           (cmp_bl),
      .mcb_cmd_full_i     (memc_cmd_full_i),
      .mcb_wr_full_i      (memc_wr_full_i),
      .mcb_rd_empty_i     (memc_rd_empty_i),
      .error_status       (error_status),
      .error              (error)
      );
endmodule