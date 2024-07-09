module outputs)
  wire [3:0] ram_init_addr;                     // From ui_rd_data0 of ui_rd_data.v
  wire                  ram_init_done_r;        // From ui_rd_data0 of ui_rd_data.v
  wire                  rd_accepted;            // From ui_cmd0 of ui_cmd.v
  wire                  rd_buf_full;            // From ui_rd_data0 of ui_rd_data.v
  wire [DATA_BUF_ADDR_WIDTH-1:0]rd_data_buf_addr_r;// From ui_rd_data0 of ui_rd_data.v
  wire                  wr_accepted;            // From ui_cmd0 of ui_cmd.v
  wire [DATA_BUF_ADDR_WIDTH-1:0] wr_data_buf_addr;// From ui_wr_data0 of ui_wr_data.v
  wire                  wr_req_16;              // From ui_wr_data0 of ui_wr_data.v
  // End of automatics
  // In the UI, the read and write buffers are allowed to be asymmetric to
  // to maximize read performance, but the MC's native interface requires
  // symmetry, so we zero-fill the write pointer
  generate
    if(DATA_BUF_ADDR_WIDTH > 4) begin
      assign wr_data_buf_addr[DATA_BUF_ADDR_WIDTH-1:4] = 0;
    end
  endgenerate
  ui_cmd #
    (/*AUTOINSTPARAM*/
     // Parameters
     .TCQ                               (TCQ),
     .ADDR_WIDTH                        (ADDR_WIDTH),
     .BANK_WIDTH                        (BANK_WIDTH),
     .COL_WIDTH                         (COL_WIDTH),
     .DATA_BUF_ADDR_WIDTH               (DATA_BUF_ADDR_WIDTH),
     .RANK_WIDTH                        (RANK_WIDTH),
     .ROW_WIDTH                         (ROW_WIDTH),
     .RANKS                             (RANKS),
     .MEM_ADDR_ORDER                    (MEM_ADDR_ORDER))
    ui_cmd0
      (/*AUTOINST*/
       // Outputs
       .app_rdy                         (app_rdy),
       .use_addr                        (use_addr),
       .rank                            (rank[RANK_WIDTH-1:0]),
       .bank                            (bank[BANK_WIDTH-1:0]),
       .row                             (row[ROW_WIDTH-1:0]),
       .col                             (col[COL_WIDTH-1:0]),
       .size                            (size),
       .cmd                             (cmd[2:0]),
       .hi_priority                     (hi_priority),
       .rd_accepted                     (rd_accepted),
       .wr_accepted                     (wr_accepted),
       .data_buf_addr                   (data_buf_addr),
       // Inputs
       .rst                             (rst),
       .clk                             (clk),
       .accept_ns                       (accept_ns),
       .rd_buf_full                     (rd_buf_full),
       .wr_req_16                       (wr_req_16),
       .app_addr                        (app_addr[ADDR_WIDTH-1:0]),
       .app_cmd                         (app_cmd[2:0]),
       .app_sz                          (app_sz),
       .app_hi_pri                      (app_hi_pri),
       .app_en                          (app_en),
       .wr_data_buf_addr                (wr_data_buf_addr),
       .rd_data_buf_addr_r              (rd_data_buf_addr_r));
  ui_wr_data #
    (/*AUTOINSTPARAM*/
     // Parameters
     .TCQ                               (TCQ),
     .APP_DATA_WIDTH                    (APP_DATA_WIDTH),
     .APP_MASK_WIDTH                    (APP_MASK_WIDTH),
     .nCK_PER_CLK                       (nCK_PER_CLK),
     .ECC                               (ECC),
     .ECC_TEST                          (ECC_TEST),
     .CWL                               (CWL_M))
    ui_wr_data0
      (/*AUTOINST*/
       // Outputs
       .app_wdf_rdy                     (app_wdf_rdy),
       .wr_req_16                       (wr_req_16),
       .wr_data_buf_addr                (wr_data_buf_addr[3:0]),
       .wr_data                         (wr_data[APP_DATA_WIDTH-1:0]),
       .wr_data_mask                    (wr_data_mask[APP_MASK_WIDTH-1:0]),
       .raw_not_ecc                     (raw_not_ecc[2*nCK_PER_CLK-1:0]),
       // Inputs
       .rst                             (rst),
       .clk                             (clk),
       .app_wdf_data                    (app_wdf_data[APP_DATA_WIDTH-1:0]),
       .app_wdf_mask                    (app_wdf_mask[APP_MASK_WIDTH-1:0]),
       .app_raw_not_ecc                 (app_raw_not_ecc[2*nCK_PER_CLK-1:0]),
       .app_wdf_wren                    (app_wdf_wren),
       .app_wdf_end                     (app_wdf_end),
       .wr_data_offset                  (wr_data_offset),
       .wr_data_addr                    (wr_data_addr[3:0]),
       .wr_data_en                      (wr_data_en),
       .wr_accepted                     (wr_accepted),
       .ram_init_done_r                 (ram_init_done_r),
       .ram_init_addr                   (ram_init_addr));
  ui_rd_data #
    (/*AUTOINSTPARAM*/
     // Parameters
     .TCQ                               (TCQ),
     .APP_DATA_WIDTH                    (APP_DATA_WIDTH),
     .DATA_BUF_ADDR_WIDTH               (DATA_BUF_ADDR_WIDTH),
     .nCK_PER_CLK                       (nCK_PER_CLK),
     .ECC                               (ECC),
     .ORDERING                          (ORDERING))
    ui_rd_data0
      (/*AUTOINST*/
       // Outputs
       .ram_init_done_r                 (ram_init_done_r),
       .ram_init_addr                   (ram_init_addr),
       .app_rd_data_valid               (app_rd_data_valid),
       .app_rd_data_end                 (app_rd_data_end),
       .app_rd_data                     (app_rd_data[APP_DATA_WIDTH-1:0]),
       .app_ecc_multiple_err            (app_ecc_multiple_err[2*nCK_PER_CLK-1:0]),
       .rd_buf_full                     (rd_buf_full),
       .rd_data_buf_addr_r              (rd_data_buf_addr_r),
       // Inputs
       .rst                             (rst),
       .clk                             (clk),
       .rd_data_en                      (rd_data_en),
       .rd_data_addr                    (rd_data_addr),
       .rd_data_offset                  (rd_data_offset),
       .rd_data_end                     (rd_data_end),
       .rd_data                         (rd_data[APP_DATA_WIDTH-1:0]),
       .ecc_multiple                    (ecc_multiple[3:0]),
       .rd_accepted                     (rd_accepted));
endmodule