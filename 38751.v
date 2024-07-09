module clk_gate (output gated_clk, input free_clk, func_en, pwr_en, gating_override);
   wire clk_en;
   reg latched_clk_en  /*verilator clock_enable*/;
   assign clk_en = func_en & (pwr_en | gating_override);
   `TLV_BLATCH(latched_clk_en, clk_en, free_clk)
   assign gated_clk = latched_clk_en & free_clk;
endmodule