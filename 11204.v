module
   // and do not propogate out to other modules that may be attached, complicating
   // timing assertions.
   bsg_two_fifo #(.width_p(channel_width_p)) twofer
     (.clk_i(core_clk_i)
      ,.reset_i(core_reset_i)
      // we feed this into the local yumi, but only if it is valid
      ,.ready_o(core_twofer_ready)
      ,.data_i(core_data_o_pre_twofer)
      ,.v_i(core_valid_o_pre_twofer)
      ,.v_o(core_valid_o)
      ,.data_o(core_data_o)
      ,.yumi_i(core_yumi_i)
      );
   // a word was transferred to the two input fifo if ...
   wire core_transfer_success = core_valid_o_tmp & core_twofer_ready;
/*
                               // deque if there was an actual transfer, AND (
   assign   core_actual_deque  = core_transfer_success
                               // we sent the 0th word already,
                               // and just sent the 1st word, OR
                               & ((core_sent_0_want_to_send_1_r & core_valid_1)
                                  // we sent the 0th word and there is no 1st word OR
                                  // we sent the 1st word, and there is no 0th word
                                  | (core_valid_0 ^ core_valid_1));
*/
   assign core_actual_deque = core_transfer_success & ~(~core_sent_0_want_to_send_1_r & core_valid_1 & core_valid_0);
   always @(posedge core_clk_i)
     begin
        if (core_reset_i)
          core_sent_0_want_to_send_1_r  <= 0;
        else
          // if we transferred data, but do not deque, we must have another word to
          // transfer. mbt fixme: this was originally:
          // core_transfer_success & ~core_actual_deque
          // but had a bug. review further.
          core_sent_0_want_to_send_1_r  <= core_transfer_success
                                           ? ~core_actual_deque
                                           : core_sent_0_want_to_send_1_r;
     end
// credit return
// these are credits coming from the receive end of the async fifo in the core clk
//  domain and passing to the io clk domain and out of the chip.
   logic [lg_fifo_depth_p+1-1:0] core_credits_gray_r_iosync
                                 , core_credits_binary_r_iosync
                                 , io_credits_sent_r, io_credits_sent_r_gray
                                 , io_credits_sent_r_p1, io_credits_sent_r_p2;
   bsg_async_ptr_gray #(.lg_size_p(lg_fifo_depth_p+1)) bapg
   (.w_clk_i   (core_clk_i)
    ,.w_reset_i(core_reset_i)
    ,.w_inc_i  (core_transfer_success)
    ,.r_clk_i  (io_clk_i)
    ,.w_ptr_binary_r_o() // not needed
    ,.w_ptr_gray_r_o()   // not needed
    ,.w_ptr_gray_r_rsync_o(core_credits_gray_r_iosync)
    );
   // this logic allows us to return two credits at a time
   // note: generally relies on power-of-twoness of io_credits_sent_r
   // to do correct wrap around.
   always_comb io_credits_sent_r_p1 = io_credits_sent_r+1;
   always_comb io_credits_sent_r_p2 = io_credits_sent_r+2;
   // which bit of the io_credits_sent_r counter we use determines
   // the value of the token line in credits
   // this signal's register should be placed right next to the I/O pad:
   //   glitch sensitive.
   assign io_token_r_o = io_credits_sent_r[lg_credit_to_token_decimation_p];
   // we actually absorb credits one or two at a time rather as fast as we can.
   // this because otherwise we would not be slowing transition rates on the token
   // signal, which is the whole point of tokens! this is slightly suboptimal,
   // because if enough cycles have passed from the last
   // time we sent a token, we could actually acknowledge things faster if we
   // absorbed more than one credit at a time.
   // that's okay. we skip this optimization.
   // during token bypass mode, we hardwire the credit signal to the trigger mode signals;
   // this gives the output channel control over the credit signal which
   // allows it to toggle and reset the credit logic.
   // the use of this trigger signal means that we should avoid the use of these
   // two signals for calibration codes, so that we do not mix calibration codes
   // when reset goes low with token reset operation, which would be difficult to avoid
   // since generally we cannot control the timing of these reset signals when
   // they cross asynchronous boundaries
   // this is an optimized token increment system
   // we actually gray code two options and compare against
   // the incoming greycoded pointer. this is because it's cheaper
   // to grey code than to de-gray code. moreover, we theorize it's cheaper
   // to compute an incremented gray code than to add one to a pointer.
   assign io_credits_sent_r_gray = (io_credits_sent_r >> 1) ^ io_credits_sent_r;
   logic [lg_fifo_depth_p+1-1:0] io_credits_sent_p1_r_gray;
   bsg_binary_plus_one_to_gray #(.width_p(lg_fifo_depth_p+1)) bsg_bp1_2g
     (.binary_i(io_credits_sent_r)
      ,.gray_o(io_credits_sent_p1_r_gray)
      );
   wire empty_1 = (core_credits_gray_r_iosync != io_credits_sent_p1_r_gray);
   wire empty_0 = (core_credits_gray_r_iosync != io_credits_sent_r_gray);
   always @(posedge io_clk_i)
     begin
        if (io_token_bypass_i)
          io_credits_sent_r <= { lg_fifo_depth_p+1
                                 { io_trigger_mode_1 & io_trigger_mode_0 } };
        else
          // we absorb up to two credits per cycles, since we receive at DDR,
          // we need this to rate match the incoming data
	  // code is written like this because empty_1 is late relative to empty_0
          io_credits_sent_r <= (empty_1
                                ? (empty_0 ? io_credits_sent_r_p2 : io_credits_sent_r)
                                : (empty_0 ? io_credits_sent_r_p1 : io_credits_sent_r));
     end
endmodule