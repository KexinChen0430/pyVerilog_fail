module
    address_swap_module_8 client_side_asm (
       .rx_ll_clock         (ll_clk_i),
       .rx_ll_reset         (ll_reset_i),
       .rx_ll_data_in       (rx_ll_data_i),
       .rx_ll_sof_in_n      (rx_ll_sof_n_i),
       .rx_ll_eof_in_n      (rx_ll_eof_n_i),
       .rx_ll_src_rdy_in_n  (rx_ll_src_rdy_n_i),
       .rx_ll_data_out      (tx_ll_data_i),
       .rx_ll_sof_out_n     (tx_ll_sof_n_i),
       .rx_ll_eof_out_n     (tx_ll_eof_n_i),
       .rx_ll_src_rdy_out_n (tx_ll_src_rdy_n_i),
       .rx_ll_dst_rdy_in_n  (tx_ll_dst_rdy_n_i)
    );
    assign rx_ll_dst_rdy_n_i = tx_ll_dst_rdy_n_i;
    // Create synchronous reset in the transmitter clock domain
    always @(posedge ll_clk_i, posedge reset_i)
    begin
      if (reset_i === 1'b1)
      begin
        ll_pre_reset_i <= 6'h3F;
        ll_reset_i     <= 1'b1;
      end
      else
      begin
        ll_pre_reset_i[0]   <= 1'b0;
        ll_pre_reset_i[5:1] <= ll_pre_reset_i[4:0];
        ll_reset_i          <= ll_pre_reset_i[5];
      end
    end
    // Globally-buffer the reference clock used for
    // the IODELAYCTRL primitive
    IBUFG refclk_ibufg (
       .I (REFCLK),
       .O (refclk_ibufg_i)
    );
    BUFG refclk_bufg (
       .I (refclk_ibufg_i),
       .O (refclk_bufg_i)
    );
    // Prepare the GTX_CLK for a BUFG
    IBUFG gtx_clk_ibufg (
       .I (GTX_CLK),
       .O (gtx_clk_i)
    );
endmodule