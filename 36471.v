module.
    */
   altera_std_synchronizer #(
       .depth(SYSCLK_TO_TCK_SYNC_DEPTH)
   ) synchronizer (
       .clk(tck),
       .reset_n(reset_n),
       .din(1'b1),
       .dout(jtag_clock_reset_n)
   );
   altera_jtag_streaming #(
       .PURPOSE(PURPOSE),
       .UPSTREAM_FIFO_SIZE(UPSTREAM_FIFO_SIZE),
       .DOWNSTREAM_FIFO_SIZE(DOWNSTREAM_FIFO_SIZE),
       .MGMT_CHANNEL_WIDTH(MGMT_CHANNEL_WIDTH)
   ) jtag_streaming (
       .tck              (tck),
       .tdi              (tdi),
       .tdo              (tdo),
       .ir_in            (ir_in),
       .virtual_state_cdr(virtual_state_cdr),
       .virtual_state_sdr(virtual_state_sdr),
       .virtual_state_udr(virtual_state_udr),
       .reset_n(jtag_clock_reset_n),
       .source_data(jtag_source_data),
       .source_valid(jtag_source_valid),
       .sink_data(jtag_sink_data),
       .sink_valid(jtag_sink_valid),
       .sink_ready(jtag_sink_ready),
       .clock_to_sample(clk),
       .reset_to_sample(reset_n),
       .resetrequest(resetrequest),
       .debug_reset(debug_reset),
       .mgmt_valid(mgmt_valid),
       .mgmt_channel(mgmt_channel),
       .mgmt_data(mgmt_data)
    );
   // synchronization in both clock domain crossings takes place in the "clk" system clock domain!
   altera_avalon_st_clock_crosser #(
       .SYMBOLS_PER_BEAT(1),
       .BITS_PER_SYMBOL(8),
       .FORWARD_SYNC_DEPTH(SYSCLK_TO_TCK_SYNC_DEPTH),
       .BACKWARD_SYNC_DEPTH(TCK_TO_SYSCLK_SYNC_DEPTH)
   ) sink_crosser (
       .in_clk(clk),
       .in_reset(~reset_n),
       .in_data(sink_data),
       .in_ready(sink_ready),
       .in_valid(sink_valid),
       .out_clk(tck),
       .out_reset(~jtag_clock_reset_n),
       .out_data(jtag_sink_data),
       .out_ready(jtag_sink_ready),
       .out_valid(jtag_sink_valid)
   );
   altera_jtag_src_crosser #(
       .SYNC_DEPTH(TCK_TO_SYSCLK_SYNC_DEPTH)
   ) source_crosser (
       .sink_clk(tck),
       .sink_reset_n(jtag_clock_reset_n),
       .sink_valid(jtag_source_valid),
       .sink_data(jtag_source_data),
       .src_clk(clk),
       .src_reset_n(reset_n),
       .src_valid(source_valid),
       .src_data(source_data)
   );
endmodule