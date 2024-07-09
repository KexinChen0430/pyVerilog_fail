module is used to cross the clock domains for
  // the ready signal
  bsg_launch_sync_sync #( .width_p(1)
                                         , .use_negedge_for_launch_p(0)
                       ) synchronizer
    ( .iclk_i(config_i.cfg_clk)
    , .iclk_reset_i(1'b0)  // mbt: was incorrectly set to reset; which is wrong clock domain
    , .oclk_i(clk)
    , .iclk_data_i(ready_r ^ cfg_reset)
    , .iclk_data_o()
    , .oclk_data_o(ready_synced)
    );
   if (default_p==0)
     begin: def
        bsg_dff_reset_en #(.width_p(data_bits_p),.harden_p(1'b1))
        data_r_reg
          (.clk_i(config_i.cfg_clk)
           ,.reset_i(cfg_reset)
           ,.en_i(data_en)
           ,.data_i(data_n)
           ,.data_o(data_r)
           );
        bsg_dff_reset_en #(.width_p(data_bits_p),.harden_p(1'b1))
        data_dst_reg
          (.clk_i(clk)
           ,.data_i(data_r)
           ,.en_i(data_dst_en)
           ,.reset_i(default_en)
           ,.data_o(data_dst_r)
           );
     end
   else
     begin: def
        // source register for crossing clock domains
        bsg_dff_en #(.width_p(data_bits_p),.harden_p(1'b1))
        data_r_reg
          (.clock_i(config_i.cfg_clk)
           ,.en_i(cfg_reset | data_en)
           ,.data_i(cfg_reset ? default_p : data_n)
           ,.data_o(data_r)
           );
        bsg_mux #(.width_p(data_bits_p)
                  ,.harden_p(1)
                  ,.els_p(2)
                  ) data_dst_mux
          (
           .sel_i(default_en)
           ,.data_i( { data_bits_p '(default_p), data_r})
           ,.data_o(data_dst_n)
           );
        bsg_dff_en #(.width_p(data_bits_p)
                     ,.harden_p(1)
                     ) data_dst_reg
          (.clock_i(clk)
           ,.data_i(data_dst_n)
           ,.en_i(default_en | data_dst_en)
           ,.data_o(data_dst_r)
           );
     end
  // Register for edge detection
  assign sync_shift_n = {ready_synced, sync_shift_r[1]};
  always_ff @ (posedge clk) begin
    if (reset) begin
      r_e_s_e_t_r <= 1;
    end else begin
      r_e_s_e_t_r <= 0;
    end
    data_new_r_o <= data_dst_en | default_en;
    sync_shift_r <= sync_shift_n;
  end
   if (debug_lp)
   always @(negedge clk)
     begin
        if (default_en)
          $display("## I: CONFIG NODE (id=%-d) dest_clk setting default: %x (%m)",id_p, default_p);
        if (data_new_r_o)
          $display("## I: CONFIG NODE (id=%-d) dest_clk received data: %x (%m)",id_p, data_dst_r);
     end
  // An inverted ready_r from config domain indicates a valid data_r word is ready to be captured.
  // If an edge occurs in ready_r, sooner or later the sync line detects it by having different bits in the least significant 2 positions.
  // This implementation depends on that the least significant 2 bits in sync line are *NOT* metastable. When they also go metastable,
  // the circuit may fail. Extend the length of sync_len_lp could increase mean time between failures.
  assign data_dst_en = sync_shift_r[0] ^ sync_shift_r[1];
  assign cfg_reset = & shift_r[0 +: reset_len_lp]; // reset sequence is an all '1' string of reset_len_lp length
  assign valid = (~count_non_zero) ? (shift_r.valid == 2'b10) : 1'b0; // shift_r.valid == "10" means a valid packet arrives
  assign packet_len = shift_r.len;
  assign node_id    = shift_r.id;
  assign data_rx    = shift_r.rx;
  // This generate block is to remove framing bits and wire only data payload
  // bits to the config data register of this node.
  genvar i;
  generate
    for(i = 0; i < data_rx_len_lp - frame_bit_size_lp; i++) begin // the end, or msb of a transferred data is always '0' which is discarded
      if((i + 1) % (data_frame_len_lp + frame_bit_size_lp)) begin // bit is payload when % returns non-zero
        assign data_n[i - i / (data_frame_len_lp + frame_bit_size_lp)] = data_rx[i];
      end
    end
  endgenerate
  assign match = node_id == id_p;
  assign data_en = valid & match;
  assign count_non_zero = | count_r;
  // Output signals
  assign data_r_o = data_dst_r; // data_dst_r is the inverted data_r
endmodule