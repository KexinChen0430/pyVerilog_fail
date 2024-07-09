module
  logic tx_v_li;
  logic tx_ready_lo;
  bsg_cache_to_dram_ctrl_tx #(
    .num_cache_p(num_cache_p)
    ,.data_width_p(data_width_p)
    ,.block_size_in_words_p(block_size_in_words_p)
    ,.dram_ctrl_burst_len_p(dram_ctrl_burst_len_p)
  ) tx (
    .clk_i(clk_i)
    ,.reset_i(reset_i)
    ,.v_i(tx_v_li)
    ,.tag_i(tag_r)
    ,.ready_o(tx_ready_lo)
    ,.dma_data_i(dma_data_i)
    ,.dma_data_v_i(dma_data_v_i)
    ,.dma_data_yumi_o(dma_data_yumi_o)
    ,.app_wdf_wren_o(app_wdf_wren_o)
    ,.app_wdf_rdy_i(app_wdf_rdy_i)
    ,.app_wdf_data_o(app_wdf_data_o)
    ,.app_wdf_mask_o(app_wdf_mask_o)
    ,.app_wdf_end_o(app_wdf_end_o)
  );
  // dma request
  typedef enum logic {
    WAIT,
    SEND_REQ
  } req_state_e;
  req_state_e req_state_r, req_state_n;
  logic [addr_width_p-1:0] addr_r, addr_n;
  logic write_not_read_r, write_not_read_n;
  logic [`BSG_SAFE_CLOG2(num_req_lp)-1:0] req_cnt_r, req_cnt_n;
  always_comb begin
    app_en_o = 1'b0;
    app_cmd_o = WR;
    rr_yumi_li = 1'b0;
    tag_n = tag_r;
    write_not_read_n = write_not_read_r;
    rx_v_li = 1'b0;
    tx_v_li = 1'b0;
    req_state_n = req_state_r;
    req_cnt_n = req_cnt_r;
    addr_n = addr_r;
    case (req_state_r)
      WAIT: begin
        if (rr_v_lo) begin
          rr_yumi_li = 1'b1;
          tag_n = rr_tag_lo;
          addr_n = dma_pkt.addr;
          write_not_read_n = dma_pkt.write_not_read;
          req_cnt_n = '0;
          req_state_n = SEND_REQ;
        end
      end
      SEND_REQ: begin
        app_en_o = (write_not_read_r
          ? tx_ready_lo
          : rx_ready_lo);
        app_cmd_o = write_not_read_r
          ? WR
          : RD;
        rx_v_li = ~write_not_read_r & rx_ready_lo & app_rdy_i;
        tx_v_li = write_not_read_r & tx_ready_lo & app_rdy_i;
        addr_n = (app_rdy_i & app_en_o)
          ? addr_r + (1 << `BSG_SAFE_CLOG2(dram_ctrl_burst_len_p*data_width_p/8))
          : addr_r;
        req_cnt_n = (app_rdy_i & app_en_o)
          ? req_cnt_r + 1
          : req_cnt_r;
        req_state_n = app_rdy_i & app_en_o & (req_cnt_r == num_req_lp-1)
          ? WAIT
          : SEND_REQ;
      end
    endcase
  end
  // Append tag_r to top bits of dram address
  // tag_r not used when only 1 cache exists
  always_comb
    case (dram_size_i)
      0: app_addr_o = dram_ctrl_addr_width_p'({tag_r, addr_r[25-$clog2(num_cache_p)-1:0]});
      1: app_addr_o = dram_ctrl_addr_width_p'({tag_r, addr_r[26-$clog2(num_cache_p)-1:0]});
      2: app_addr_o = dram_ctrl_addr_width_p'({tag_r, addr_r[27-$clog2(num_cache_p)-1:0]});
      3: app_addr_o = dram_ctrl_addr_width_p'({tag_r, addr_r[28-$clog2(num_cache_p)-1:0]});
      4: app_addr_o = dram_ctrl_addr_width_p'({tag_r, addr_r[29-$clog2(num_cache_p)-1:0]});
      default: app_addr_o = {tag_r, addr_r};
    endcase
  // sequential
  always_ff @ (posedge clk_i) begin
    if (reset_i) begin
      req_state_r <= WAIT;
      tag_r <= '0;
      addr_r <= '0;
      req_cnt_r <= '0;
      write_not_read_r <= 1'b0;
    end
    else begin
      req_state_r <= req_state_n;
      tag_r <= tag_n;
      addr_r <= addr_n;
      req_cnt_r <= req_cnt_n;
      write_not_read_r <= write_not_read_n;
    end
  end
endmodule