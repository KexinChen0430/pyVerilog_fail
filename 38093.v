module fifoctrl_sim;
  wire sys_clk;
  sim_clk sysClk(sys_clk);
  wire slow_clk;
  sim_clk #(.T(8)) slowClk(slow_clk);
  fifoctrl_sim_pp m0(slow_clk, slow_clk);
  fifoctrl_sim_pp m1(sys_clk, slow_clk);
  fifoctrl_sim_pp m2(slow_clk, sys_clk);
  fifoctrl_sim_pp m3(sys_clk, sys_clk);
  initial begin
    $dumpfile(`VCD_PATH);
    $dumpvars();
    #100 $finish;
  end
endmodule