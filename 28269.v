module
alu my_alu
(
  .clk(clk),
  .reset(reset),
  .i_a(alu_a),
  .i_b(alu_b),
  .i_cmd(alu_cmd),
  .o_result(alu_result),
  .o_valid(alu_res_valid),
  .o_ready(alu_ready)
);
// Simulator (clock + reset)
sim my_sim(
  .clk(clk),
  .reset(reset)
);
endmodule