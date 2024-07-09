module wants more tokens
       ,.extra_margin_p(2)
       ,.start_full_p(1)
       ,.use_async_w_reset_p(1'b1)
       ) neg_credit_ctr
       (
        .w_clk_i   (token_clk_i)
        ,.w_inc_token_i(1'b1)
        ,.w_reset_i(async_token_reset_i)
        // the I/O clock domain is responsible for tabulating tokens
        ,.r_clk_i             (io_clk_i                )
        ,.r_reset_i           (io_link_reset_i         )
        ,.r_dec_credit_i      (io_negedge_credits_deque)
        ,.r_infinite_credits_i(1'b0                    )
        ,.r_credits_avail_o   (io_negedge_credits_avail)
        );
endmodule