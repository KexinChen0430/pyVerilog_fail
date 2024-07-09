module, this width is parameterized by OVL_FIRE_WIDTH-1.
   wire [2:0] fire;
   ovl_always_on_edge ovl_aoe_t(.clock(clk),
                                .reset(reset),
                                .enable(enable),
                                .sampling_event(sampling_event),
                                .test_expr(test_expr),
                                .fire(fire),
                                .edge_type(1),
                                .property_type(3),
                                .clock_edge(1),
                                .reset_polarity(0),
                                .gating_type(0),
                                .severity_level(3));
   initial begin
      clk = 0;
      reset = 1;
      enable = 0;
      sampling_event = 0;
      test_expr = 0;
   end
   always begin
      clk = #5 !clk;
   end
endmodule