module instantiated below drives traffic (patterns)
// on the application interface of the memory controller
   always @(posedge clk) begin
     aresetn <= ~rst;
   end
   mig_7series_v4_0_axi4_tg #(
     .C_AXI_ID_WIDTH                   (C_S_AXI_ID_WIDTH),
     .C_AXI_ADDR_WIDTH                 (C_S_AXI_ADDR_WIDTH),
     .C_AXI_DATA_WIDTH                 (C_S_AXI_DATA_WIDTH),
     .C_AXI_NBURST_SUPPORT             (C_AXI_NBURST_TEST),
     .C_EN_WRAP_TRANS                  (C_EN_WRAP_TRANS),
     .C_BEGIN_ADDRESS                  (BEGIN_ADDRESS),
     .C_END_ADDRESS                    (END_ADDRESS),
     .PRBS_EADDR_MASK_POS              (PRBS_EADDR_MASK_POS),
     .DBG_WR_STS_WIDTH                 (DBG_WR_STS_WIDTH),
     .DBG_RD_STS_WIDTH                 (DBG_RD_STS_WIDTH),
     .ENFORCE_RD_WR                    (ENFORCE_RD_WR),
     .ENFORCE_RD_WR_CMD                (ENFORCE_RD_WR_CMD),
     .EN_UPSIZER                       (C_S_AXI_SUPPORTS_NARROW_BURST),
     .ENFORCE_RD_WR_PATTERN            (ENFORCE_RD_WR_PATTERN)
   ) u_axi4_tg_inst
   (
     .aclk                             (clk),
     .aresetn                          (aresetn),
// Input control signals
     .init_cmptd                       (init_calib_complete),
     .init_test                        (1'b0),
     .wdog_mask                        (~init_calib_complete),
     .wrap_en                          (1'b0),
// AXI write address channel signals
     .axi_wready                       (s_axi_awready),
     .axi_wid                          (s_axi_awid),
     .axi_waddr                        (s_axi_awaddr),
     .axi_wlen                         (s_axi_awlen),
     .axi_wsize                        (s_axi_awsize),
     .axi_wburst                       (s_axi_awburst),
     .axi_wlock                        (s_axi_awlock),
     .axi_wcache                       (s_axi_awcache),
     .axi_wprot                        (s_axi_awprot),
     .axi_wvalid                       (s_axi_awvalid),
// AXI write data channel signals
     .axi_wd_wready                    (s_axi_wready),
     .axi_wd_wid                       (s_axi_wid),
     .axi_wd_data                      (s_axi_wdata),
     .axi_wd_strb                      (s_axi_wstrb),
     .axi_wd_last                      (s_axi_wlast),
     .axi_wd_valid                     (s_axi_wvalid),
// AXI write response channel signals
     .axi_wd_bid                       (s_axi_bid),
     .axi_wd_bresp                     (s_axi_bresp),
     .axi_wd_bvalid                    (s_axi_bvalid),
     .axi_wd_bready                    (s_axi_bready),
// AXI read address channel signals
     .axi_rready                       (s_axi_arready),
     .axi_rid                          (s_axi_arid),
     .axi_raddr                        (s_axi_araddr),
     .axi_rlen                         (s_axi_arlen),
     .axi_rsize                        (s_axi_arsize),
     .axi_rburst                       (s_axi_arburst),
     .axi_rlock                        (s_axi_arlock),
     .axi_rcache                       (s_axi_arcache),
     .axi_rprot                        (s_axi_arprot),
     .axi_rvalid                       (s_axi_arvalid),
// AXI read data channel signals
     .axi_rd_bid                       (s_axi_rid),
     .axi_rd_rresp                     (s_axi_rresp),
     .axi_rd_rvalid                    (s_axi_rvalid),
     .axi_rd_data                      (s_axi_rdata),
     .axi_rd_last                      (s_axi_rlast),
     .axi_rd_rready                    (s_axi_rready),
// Error status signals
     .cmd_err                          (cmd_err),
     .data_msmatch_err                 (data_msmatch_err),
     .write_err                        (write_err),
     .read_err                         (read_err),
     .test_cmptd                       (test_cmptd),
     .write_cmptd                      (write_cmptd),
     .read_cmptd                       (read_cmptd),
     .cmptd_one_wr_rd                  (cmptd_one_wr_rd),
// Debug status signals
     .cmp_data_en                      (cmp_data_valid),
     .cmp_data_o                       (cmp_data),
     .rdata_cmp                        (rdata_cmp),
     .dbg_wr_sts_vld                   (dbg_wr_sts_vld),
     .dbg_wr_sts                       (dbg_wr_sts),
     .dbg_rd_sts_vld                   (dbg_rd_sts_vld),
     .dbg_rd_sts                       (dbg_rd_sts)
);
   // Default values are assigned to the debug inputs
   assign dbg_sel_pi_incdec       = 'b0;
   assign dbg_sel_po_incdec       = 'b0;
   assign dbg_pi_f_inc            = 'b0;
   assign dbg_pi_f_dec            = 'b0;
   assign dbg_po_f_inc            = 'b0;
   assign dbg_po_f_dec            = 'b0;
   assign dbg_po_f_stg23_sel      = 'b0;
   assign po_win_tg_rst           = 'b0;
   assign vio_tg_rst              = 'b0;
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