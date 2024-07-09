module in outside of the GT
     //                          ___________
     //                         |           |------> user_clk (Tx/Rx userclk2_out)
     //                         |ultrascale |
     //                         | Tx CLK    |------> sync clk (Tx/Rx userclk_out)
     //                 CLK --->| Userclk   |
     //      (txoutclk_out)     | MODULE    |------> shim_clk - not connected
     //                         |           |
     //          CLK_LOCKED --->|           |------> pll_not_locked
     // (tx_pma_reset_done_out) |           |        (--> connect to userclk_tx_active_out in multi gt file)
     //                         |___________|------------> clk_o
      wire user_clk_i;
      assign USER_CLK = user_clk_i;
      assign SYNC_CLK = user_clk_i;
      aurora_64b66b_25p4G_ultrascale_tx_userclk ultrascale_tx_userclk_1
      (
       // port declaration
            .gtwiz_userclk_tx_srcclk_in     (CLK          ), // txoutclk_out (GT)                         input  wire
            .gtwiz_userclk_tx_reset_in      (CLK_LOCKED   ), // tx_pma_reset_done_out (GT)                input  wire
            .gtwiz_userclk_tx_usrclk_out    (user_clk_i   ), // usrclk_out                                output wire
            .gtwiz_userclk_tx_usrclk2_out   (             ), // usrclk2_out                               output wire
            .gtwiz_userclk_tx_active_out    (MMCM_NOT_LOCKED )//gtwiz_userclk_tx_active_out(GT)output reg = 1'b0
      );
endmodule