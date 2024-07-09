module
trn_rx_128 #(
   .TCQ( TCQ )
) trn_rx_128_i (
      .user_clk( user_clk ),
      .block_clk( block_clk ),
      .rst_n_250( rst_n_250 ),
      .rst_n_500( rst_n_500 ),
      .trn_rbar_hit_n_o( trn_rbar_hit_n_o ),
      .trn_rd_o( trn_rd_o ),
      .trn_recrc_err_n_o( trn_recrc_err_n_o ),
      .trn_rsof_n_o( trn_rsof_n_o ),
      .trn_reof_n_o( trn_reof_n_o ),
      .trn_rerrfwd_n_o( trn_rerrfwd_n_o ),
      .trn_rrem_n_o( trn_rrem_n_o ),
      .trn_rsrc_dsc_n_o( trn_rsrc_dsc_n_o ),
      .trn_rsrc_rdy_n_o( trn_rsrc_rdy_n_o ),
      .trn_rdst_rdy_n_i( trn_rdst_rdy_n_i ),
      .trn_rnpok_n_i( trn_rnpok_n_i ),
      .TRNRBARHITN_i( TRNRBARHITN_i ),
      .TRNRD_i( TRNRD_i ),
      .TRNRECRCERRN_i( TRNRECRCERRN_i ),
      .TRNRSOFN_i( TRNRSOFN_i ),
      .TRNREOFN_i( TRNREOFN_i ),
      .TRNRERRFWDN_i( TRNRERRFWDN_i ),
      .TRNRREMN_i( TRNRREMN_i ),
      .TRNRSRCDSCN_i( TRNRSRCDSCN_i ),
      .TRNRSRCRDYN_i( TRNRSRCRDYN_i ),
      .TRNRDSTRDYN_o( TRNRDSTRDYN_o ),
      .TRNRNPOKN_o( TRNRNPOKN_o )
);
endmodule