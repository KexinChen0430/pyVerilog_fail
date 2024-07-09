module
                                .rdy(channel_ready[3:0]),           // channels ready (leading edge - became ready, trailing - no more data, use zero)
                                .nxt(channel_next[3:0]),           // pulses to modules to output next word
                                .channel(channel[1:0]),       // decoded channel number (2 bits)
                                .ts_sel(timestamp_sel[1:0]),        // select timestamp word to be output (0..3)
                                .ts_en(ts_en),         // 1 - use timestamp, 0 - channel data (or 16'h0 if !ready)
                                .dv(mux_data_valid),            // output data valid (from registered mux - 2 stage - first selects data and ready, second ts/data/zero)
                                .sample_counter(sample_counter));// number of 64-byte samples logged
buf_xclk_mclk16 i_buf_xclk_mclk16(.xclk(xclk), // posedge
                                  .mclk(clk), // posedge!
                                  .rst(config_rst),  // @posedge xclk
                                  .din(mux_data_final[15:0]),
                                  .din_stb(mux_data_valid),
                                  .dout(data_out[15:0]),
                                  .dout_stb(data_out_stb));
endmodule