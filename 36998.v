module wasca_uart_0_rx (
                         // inputs:
                          baud_divisor,
                          begintransfer,
                          clk,
                          clk_en,
                          reset_n,
                          rx_rd_strobe,
                          rxd,
                          status_wr_strobe,
                         // outputs:
                          break_detect,
                          framing_error,
                          parity_error,
                          rx_char_ready,
                          rx_data,
                          rx_overrun
                       )
;
  output           break_detect;
  output           framing_error;
  output           parity_error;
  output           rx_char_ready;
  output  [  7: 0] rx_data;
  output           rx_overrun;
  input   [  9: 0] baud_divisor;
  input            begintransfer;
  input            clk;
  input            clk_en;
  input            reset_n;
  input            rx_rd_strobe;
  input            rxd;
  input            status_wr_strobe;
  reg              baud_clk_en;
  wire    [  9: 0] baud_load_value;
  reg     [  9: 0] baud_rate_counter;
  wire             baud_rate_counter_is_zero;
  reg              break_detect;
  reg              delayed_unxrx_in_processxx3;
  reg              delayed_unxsync_rxdxx1;
  reg              delayed_unxsync_rxdxx2;
  reg              do_start_rx;
  reg              framing_error;
  wire             got_new_char;
  wire    [  8: 0] half_bit_cell_divisor;
  wire             is_break;
  wire             is_framing_error;
  wire             parity_error;
  wire    [  7: 0] raw_data_in;
  reg              rx_char_ready;
  reg     [  7: 0] rx_data;
  wire             rx_in_process;
  reg              rx_overrun;
  wire             rx_rd_strobe_onset;
  wire             rxd_edge;
  wire             rxd_falling;
  wire    [  9: 0] rxd_shift_reg;
  wire             sample_enable;
  wire             shift_reg_start_bit_n;
  wire             source_rxd;
  wire             stop_bit;
  wire             sync_rxd;
  wire             unused_start_bit;
  wire    [  9: 0] unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_in;
  reg     [  9: 0] unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out;
  wasca_uart_0_rx_stimulus_source the_wasca_uart_0_rx_stimulus_source
    (
      .baud_divisor  (baud_divisor),
      .clk           (clk),
      .clk_en        (clk_en),
      .reset_n       (reset_n),
      .rx_char_ready (rx_char_ready),
      .rxd           (rxd),
      .source_rxd    (source_rxd)
    );
  altera_std_synchronizer the_altera_std_synchronizer
    (
      .clk (clk),
      .din (source_rxd),
      .dout (sync_rxd),
      .reset_n (reset_n)
    );
  defparam the_altera_std_synchronizer.depth = 2;
  //delayed_unxsync_rxdxx1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          delayed_unxsync_rxdxx1 <= 0;
      else if (clk_en)
          delayed_unxsync_rxdxx1 <= sync_rxd;
    end
  assign rxd_falling = ~(sync_rxd) &  (delayed_unxsync_rxdxx1);
  //delayed_unxsync_rxdxx2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          delayed_unxsync_rxdxx2 <= 0;
      else if (clk_en)
          delayed_unxsync_rxdxx2 <= sync_rxd;
    end
  assign rxd_edge = (sync_rxd) ^  (delayed_unxsync_rxdxx2);
  assign rx_rd_strobe_onset = rx_rd_strobe && begintransfer;
  assign half_bit_cell_divisor = baud_divisor[9 : 1];
  assign baud_load_value = (rxd_edge)? half_bit_cell_divisor :
    baud_divisor;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          baud_rate_counter <= 0;
      else if (clk_en)
          if (baud_rate_counter_is_zero || rxd_edge)
              baud_rate_counter <= baud_load_value;
          else
            baud_rate_counter <= baud_rate_counter - 1;
    end
  assign baud_rate_counter_is_zero = baud_rate_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          baud_clk_en <= 0;
      else if (clk_en)
          if (rxd_edge)
              baud_clk_en <= 0;
          else
            baud_clk_en <= baud_rate_counter_is_zero;
    end
  assign sample_enable = baud_clk_en && rx_in_process;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          do_start_rx <= 0;
      else if (clk_en)
          if (~rx_in_process && rxd_falling)
              do_start_rx <= 1;
          else
            do_start_rx <= 0;
    end
  assign rx_in_process = shift_reg_start_bit_n;
  assign {stop_bit,
raw_data_in,
unused_start_bit} = rxd_shift_reg;
  assign is_break = ~(|rxd_shift_reg);
  assign is_framing_error = ~stop_bit && ~is_break;
  //delayed_unxrx_in_processxx3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          delayed_unxrx_in_processxx3 <= 0;
      else if (clk_en)
          delayed_unxrx_in_processxx3 <= rx_in_process;
    end
  assign got_new_char = ~(rx_in_process) &  (delayed_unxrx_in_processxx3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          rx_data <= 0;
      else if (got_new_char)
          rx_data <= raw_data_in;
    end
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          framing_error <= 0;
      else if (clk_en)
          if (status_wr_strobe)
              framing_error <= 0;
          else if (got_new_char && is_framing_error)
              framing_error <= -1;
    end
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          break_detect <= 0;
      else if (clk_en)
          if (status_wr_strobe)
              break_detect <= 0;
          else if (got_new_char && is_break)
              break_detect <= -1;
    end
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          rx_overrun <= 0;
      else if (clk_en)
          if (status_wr_strobe)
              rx_overrun <= 0;
          else if (got_new_char && rx_char_ready)
              rx_overrun <= -1;
    end
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          rx_char_ready <= 0;
      else if (clk_en)
          if (rx_rd_strobe_onset)
              rx_char_ready <= 0;
          else if (got_new_char)
              rx_char_ready <= -1;
    end
  assign parity_error = 0;
  //_reg, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out <= 0;
      else if (clk_en)
          unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out <= unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_in;
    end
  assign unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_in = (do_start_rx)? {10{1'b1}} :
    (sample_enable)? {sync_rxd,
    unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out[9 : 1]} :
    unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out;
  assign rxd_shift_reg = unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out;
  assign shift_reg_start_bit_n = unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out[0];
endmodule