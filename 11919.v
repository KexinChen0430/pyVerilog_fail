module
  // and do not propogate out to other modules that may be attached, complicating
  // timing assertions.
  bsg_two_fifo
 #(.width_p(channel_width_p)
  ) twofer
  (.clk_i  (core_clk_i)
  ,.reset_i(core_link_reset_i)
  // we feed this into the local yumi, but only if it is valid
  ,.ready_o(core_async_fifo_ready_li)
  ,.data_i (core_async_fifo_data_lo)
  ,.v_i    (core_async_fifo_valid_lo)
  ,.v_o    (core_valid_o)
  ,.data_o (core_data_o)
  ,.yumi_i (core_yumi_i)
  );
   // a word was transferred to fifo if ...
   assign core_async_fifo_deque = core_async_fifo_valid_lo & core_async_fifo_ready_li;
  end
  else
  begin
    // keep async_fifo isolated when reset is asserted
    assign core_valid_o = (core_link_reset_i)? 1'b0 : core_async_fifo_valid_lo;
    assign core_data_o = core_async_fifo_data_lo;
    assign core_async_fifo_deque = core_yumi_i;
  end
// credit return
// these are credits coming from the receive end of the async fifo in the core clk
//  domain and passing to the io clk domain and out of the chip.
  logic [lg_credit_to_token_decimation_p+1-1:0] core_credits_sent_r;
  // which bit of the core_credits_sent_r counter we use determines
  // the value of the token line in credits
  // this signal's register should be placed right next to the I/O pad:
  //   glitch sensitive.
  assign core_token_r_o = core_credits_sent_r[lg_credit_to_token_decimation_p];
  // Increase token counter when dequeue from async fifo
  bsg_counter_clear_up
 #(.max_val_p({(lg_credit_to_token_decimation_p+1){1'b1}})
  ,.init_val_p(0)
  ,.disable_overflow_warning_p(1) // Allow overflow for this counter
  )
  token_counter
  (.clk_i  (core_clk_i)
  ,.reset_i(core_link_reset_i)
  ,.clear_i(1'b0)
  ,.up_i   (core_async_fifo_deque)
  ,.count_o(core_credits_sent_r)
  );
endmodule