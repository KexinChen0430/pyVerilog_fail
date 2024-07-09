module bsg_nonsynth_clock_gen_plusarg #( parameter `BSG_INV_PARAM(default_clk_per_p) )
(
  output logic o
);
`ifndef VERILATOR
  // We start logic hi so the first pos-edge occurs at T=<clk_per>. The first
  // negative edge will occur at T=<clk_per>/2.
  logic clk_lo = 1'b1;
  initial begin
    // Here we grab the clock_period from the command line plusarg and generate
    // the clock signal. If the plusarg doesn't exist, the value is unchanged
    // and no error/warning is issued.
    integer clock_period = default_clk_per_p;
    $value$plusargs("clock-period=%d", clock_period);
    $display("[INFO - %L]: Clock Period = %d", clock_period);
    forever #(clock_period/2.0) clk_lo = ~clk_lo;
  end
  // Assign clock to output port
  assign o = clk_lo;
`else
  initial begin
    $error("bsg_nonsynth_clock_gen_plusarg is not supported in Verilator due to delay statement (#)");
  end
`endif
endmodule