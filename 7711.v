module
   //     ring and then returns the replies back
   //     to the core
   udp_reg_master #(
      .UDP_REG_SRC_WIDTH (UDP_REG_SRC_WIDTH)
   ) udp_reg_master (
      // Core register interface signals
      .core_reg_req                          (reg_req),
      .core_reg_ack                          (reg_ack),
      .core_reg_rd_wr_L                      (reg_rd_wr_L),
      .core_reg_addr                         (reg_addr),
      .core_reg_rd_data                      (reg_rd_data),
      .core_reg_wr_data                      (reg_wr_data),
      // UDP register interface signals (output)
      .reg_req_out                           (in_arb_in_reg_req),
      .reg_ack_out                           (in_arb_in_reg_ack),
      .reg_rd_wr_L_out                       (in_arb_in_reg_rd_wr_L),
      .reg_addr_out                          (in_arb_in_reg_addr),
      .reg_data_out                          (in_arb_in_reg_data),
      .reg_src_out                           (in_arb_in_reg_src),
      // UDP register interface signals (input)
      .reg_req_in                            (udp_reg_req_in),
      .reg_ack_in                            (udp_reg_ack_in),
      .reg_rd_wr_L_in                        (udp_reg_rd_wr_L_in),
      .reg_addr_in                           (udp_reg_addr_in),
      .reg_data_in                           (udp_reg_data_in),
      .reg_src_in                            (udp_reg_src_in),
      .clk                                   (clk),
      .reset                                 (reset)
   );
endmodule