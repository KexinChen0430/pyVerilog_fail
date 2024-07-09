module tb ();
   reg reset, n_clk, p_clk;
   cpci_clock_checker cc (
      .error (error),
      .clk_chk_p_max   ('d3333333),
      .clk_chk_n_exp   ('d6250000),
      .reset (reset),
      .shift_amount(4'd3),
      .p_clk (p_clk),
      .n_clk (n_clk)
   );
   always #15 p_clk = ~p_clk;
   always #8 n_clk = ~n_clk;
   initial begin
      n_clk = 0;
      p_clk = 0;
      reset  =1;
      #200 reset = 0;
      // $monitor("st: %d ", cc.state);
      wait (cc.state == 3); #100;
      $display("%t Error is %d. n_count is %d p_count is %d",
         $time, error, cc.n_count, cc.p_count);
      if (error == 0) $display("(That was good - error should be 0");
      else begin $display ("BAD - error should be 0"); $finish; end
      wait (cc.state == 0);
      #100000 begin  end
      force n_clk  = 0;
      $display($time,"Stopping n_clk");
      #1600000 release n_clk;
      wait (cc.state == 3); #100 begin end
      $display("%t Error is %d. n_count is %d p_count is %d",
         $time, error, cc.n_count, cc.p_count);
      if (error == 1) $display("(That was good - error should be 1");
      else begin $display ("BAD - error should be 1"); $finish; end
      #100 $finish;
   end
//   always @(posedge p_clk)
//      if (($time > 1000) && (cc.p_count[19:0] == 'h0)) $display($time, "p_cnt: %d", cc.p_count);
endmodule