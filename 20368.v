module
    , output r_credits_avail_o
    );
   // $clog2(x) is how many bits are required to represent
   // x unique values. we need to represent 0..max_credits_p = max_credits_p+1 values.
   localparam r_counter_width_lp = extra_margin_p+$clog2(max_tokens_p+1) + lg_credit_to_token_decimation_p;
   localparam w_counter_width_lp = extra_margin_p+$clog2(max_tokens_p+1);
   logic [r_counter_width_lp-1:0] r_counter_r;
   logic [w_counter_width_lp-1:0] w_counter_gray_r, w_counter_gray_r_rsync, w_counter_binary_r_rsync;
   always @(posedge r_clk_i)
     if (r_reset_i)
       // fixme? not sure this constant will always do as expected
       r_counter_r       <= { -max_tokens_p * start_full_p, { lg_credit_to_token_decimation_p  {1'b0} } };
     else
       r_counter_r       <= r_counter_r + r_dec_credit_i;
   bsg_async_ptr_gray #(.lg_size_p(w_counter_width_lp)
                        ,.use_negedge_for_launch_p(count_negedge_p)
                        ,.use_async_reset_p(use_async_w_reset_p)) bapg
   (.w_clk_i(w_clk_i)
    ,.w_reset_i(w_reset_i)
    ,.w_inc_i(w_inc_token_i)
    ,.r_clk_i(r_clk_i)
    ,.w_ptr_binary_r_o() // we don't care about the binary version of the ptr on w side
    ,.w_ptr_gray_r_o(w_counter_gray_r)             // synchronized with w clock domain
    ,.w_ptr_gray_r_rsync_o(w_counter_gray_r_rsync) // synchronized with r clock domain
    );
/*
    previously, we converted w_counter to binary, appended lg_credit_to_token_decimation 1'b0's and compared them
    but instead, we convert the other way now.
    assign r_credits_avail_o = r_infinite_credits_i | ~(w_counter_binary_r_rsync_padded == r_counter_r);
*/
   wire [w_counter_width_lp-1:0] r_counter_r_hi_bits         =   r_counter_r[lg_credit_to_token_decimation_p+:w_counter_width_lp];
   wire                          r_counter_r_lo_bits_nonzero;
   if (lg_credit_to_token_decimation_p == 0)
     assign r_counter_r_lo_bits_nonzero = 1'b0;
   else
     assign r_counter_r_lo_bits_nonzero = | r_counter_r[0+:lg_credit_to_token_decimation_p];
   wire [w_counter_width_lp-1:0] r_counter_r_hi_bits_gray    = (r_counter_r_hi_bits >> 1) ^ r_counter_r_hi_bits;
   assign r_credits_avail_o = r_infinite_credits_i | r_counter_r_lo_bits_nonzero | (r_counter_r_hi_bits_gray != w_counter_gray_r_rsync);
   //  for debug
   // synopsys translate_off
   bsg_gray_to_binary #(.width_p(w_counter_width_lp)) bsg_g2b
     (.gray_i(w_counter_gray_r_rsync)
      ,.binary_o(w_counter_binary_r_rsync)
      );
   wire [r_counter_width_lp-1:0]  w_counter_binary_r_rsync_padded = { w_counter_binary_r_rsync, { lg_credit_to_token_decimation_p {1'b0 } }};
   wire  [r_counter_width_lp-1:0] r_free_credits =  w_counter_binary_r_rsync_padded - r_counter_r;
   logic [r_counter_width_lp-1:0] r_free_credits_r;
   always @(posedge r_clk_i)
     r_free_credits_r <= r_free_credits;
   if (check_excess_credits_p)
     always @(r_free_credits_r)
       assert(r_reset_i
              |  r_infinite_credits_i
              | (r_free_credits_r <= (max_tokens_p << lg_credit_to_token_decimation_p)))
              else $error("too many credits in credit counter %d (> %3d)"
                          , r_free_credits_r
                          , max_tokens_p << lg_credit_to_token_decimation_p
                          );
   always @(negedge r_clk_i)
       assert (!(r_dec_credit_i===1 && r_credits_avail_o===0))
              else $error("decrementing empty credit counter");
   // synopsys translate_on
   // end debug
endmodule