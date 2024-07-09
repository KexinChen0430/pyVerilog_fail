module for visualizing the kernel clock with 4 LEDs
  async_counter_30 AC30 (
        .clk 	(kernel_clk),
        .count	(fpga_internal_led)
    );
  assign fpga_led_output[3:0] = ~fpga_internal_led[29:26];
endmodule