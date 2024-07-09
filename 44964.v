module
memory #(`ADDRESS_WIDTH, `DATA_WIDTH) my_mem(
  .clk(clk),
  .reset(reset),
  .i_address(mem_address),
  .i_res_ready(1'b1), //we are always ready to receive data
  .i_cmd(mem_cmd), //R/W
  .i_data(`DATA_WIDTH'bx),//no write data
  .i_valid(mem_valid),
  .o_data(mem_data_out),
  .o_res_valid(mem_res_valid),
  .o_ready(mem_ready)
);
// Simulator (clock + reset)
sim my_sim(
  .clk(clk),
  .reset(reset)
);
endmodule