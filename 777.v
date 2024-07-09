module bsg_channel_tunnel #(parameter width_p        = 1
                            , parameter `BSG_INV_PARAM(num_in_p)
                            , parameter `BSG_INV_PARAM(remote_credits_p)
                            , use_pseudo_large_fifo_p = 0
                            , harden_small_fifo_p    = 0
                            , lg_remote_credits_lp   = $clog2(remote_credits_p+1)
                            , lg_credit_decimation_p = `BSG_MIN(lg_remote_credits_lp,4)
                            , tag_width_lp           = $clog2(num_in_p+1)
                            , tagged_width_lp        = tag_width_lp + width_p
                            )
   (input clk_i
    ,input reset_i
    // incoming multiplexed data
    ,input  [tagged_width_lp-1:0]  multi_data_i
    ,input  multi_v_i
    ,output multi_yumi_o
    // outgoing multiplexed data
    , output [tagged_width_lp-1:0] multi_data_o
    , output multi_v_o
    , input  multi_yumi_i
    // incoming demultiplexed data
    , input  [num_in_p-1:0][width_p-1:0] data_i
    , input  [num_in_p-1:0] v_i
    , output [num_in_p-1:0] yumi_o
    // outgoing demultiplexed data
    , output [num_in_p-1:0][width_p-1:0] data_o
    , output [num_in_p-1:0]             v_o
    , input  [num_in_p-1:0]              yumi_i
    );
   // synopsys translate_off
   initial
     assert(lg_credit_decimation_p <= lg_remote_credits_lp)
       else
         begin
            $error("%m bad params; insufficient remote credits 2^%d to allow for decimation factor 2^%d"
                   ,lg_remote_credits_lp,lg_credit_decimation_p);
            $finish;
         end
   initial
     assert(width_p >= num_in_p*lg_remote_credits_lp)
       else
         begin
            $error("%m bad params; channel width (%d) must be at least wide enough to route back credits (%d)"
                   ,width_p
                   ,num_in_p*lg_remote_credits_lp);
            $finish;
         end
   // synopsys translate_on
   wire [num_in_p-1:0][lg_remote_credits_lp-1:0] credit_local_return_data_oi;
   wire                                          credit_local_return_v_oi;
   wire [num_in_p-1:0][lg_remote_credits_lp-1:0] credit_remote_return_data_oi;
   wire                                          credit_remote_return_yumi_io;
   bsg_channel_tunnel_out #(.width_p                (width_p)
                            ,.num_in_p              (num_in_p)
                            ,.remote_credits_p      (remote_credits_p)
                            ,.lg_credit_decimation_p(lg_credit_decimation_p)
                            ) bcto
     (.clk_i
      ,.reset_i
      ,.data_i
      ,.v_i
      ,.yumi_o
      ,.data_o (multi_data_o )
      ,.v_o(multi_v_o)
      ,.yumi_i (multi_yumi_i )
      ,.credit_local_return_data_i (credit_local_return_data_oi )
      ,.credit_local_return_v_i    (credit_local_return_v_oi    )
      ,.credit_remote_return_data_i(credit_remote_return_data_oi)
      ,.credit_remote_return_yumi_o(credit_remote_return_yumi_io)
      );
   bsg_channel_tunnel_in #(.width_p                (width_p  )
                           ,.num_in_p              (num_in_p )
                           ,.remote_credits_p      (remote_credits_p)
                           ,.use_pseudo_large_fifo_p(use_pseudo_large_fifo_p)
                           ,.harden_small_fifo_p   (harden_small_fifo_p)
                           ,.lg_credit_decimation_p(lg_credit_decimation_p)
                           ) bcti
     (.clk_i
      ,.reset_i
      ,.data_i (multi_data_i )
      ,.v_i    (multi_v_i)
      ,.yumi_o (multi_yumi_o )
      ,.data_o
      ,.v_o
      ,.yumi_i
      ,.credit_local_return_data_o (credit_local_return_data_oi )
      ,.credit_local_return_v_o    (credit_local_return_v_oi    )
      ,.credit_remote_return_data_o(credit_remote_return_data_oi)
      ,.credit_remote_return_yumi_i(credit_remote_return_yumi_io)
      );
endmodule