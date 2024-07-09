module
      .tx_timeout                            (tx_timeout),
      // Register interface
      .reg_req                               (reg_req),
      .reg_rd_wr_L                           (reg_rd_wr_L),
      .reg_addr                              (reg_addr),
      .reg_wr_data                           (reg_wr_data),
      .reg_rd_data                           (reg_rd_data),
      .reg_ack                               (reg_ack),
      .reset                                 (reset),
      .clk                                   (clk)
   );
endmodule