module outputs)
   // End of automatics
   // Code Begins Here
   assign       clk = rclk;
   //  Test logic
   assign       int_clk1 = (~testmode_l) ? rclk : efc_spc_fuse_clk1;
   assign       int_clk2 = (~testmode_l) ? rclk : efc_spc_fuse_clk2;
   assign       int_scanout = 1'b0;
   // Need latch to avoid hold time problems
   // connect int_scanout to last flop in scan chain
   bw_u1_scanlg_2x so_lockup(.so (scanout),
                             .sd (int_scanout),
                             .ck (clk),  .se(se));
   // connect int_scanin to first flop in scan chain
   bw_u1_scanlg_2x si_lockup(.so (int_scanin),
                             .sd (scanin),
                             .ck (clk), .se(se));
   //  Shift registers
   //  Address
   assign   addr_shft_en = efc_spc_xfuse_ashift;
   assign   addr_shft_nxt = {addr_shft_ff[5:0], efc_spc_xfuse_data};
   dffe_s #(7) addr_shft_reg (.din  (addr_shft_nxt),
		                        .q    (addr_shft_ff),
                            .en   (addr_shft_en),
                            .clk  (int_clk1), .se(se), .si(), .so());
   assign   fuse_ary_rid[5:0] = addr_shft_ff[6:1];
   assign   wren_bit = addr_shft_ff[0];
   // Data
   assign   data_shft_en = efc_spc_xfuse_dshift | dshift_dly1_ff | rden_ph1;
   // mux2es
   assign   data_shft_nxt = rden_ph1
            ? {{3{ary_fuse_repair_en[1]}},
               ary_fuse_repair_value[7:0],
               ary_fuse_repair_en[0]}
            : {data_shft_ff[10:0],
               efc_spc_xfuse_data};
   // 10:9 is unused
   dffe_s #(12) 	 data_shft_reg (.din  (data_shft_nxt),
			                          .q    (data_shft_ff),
                                .en   (data_shft_en),
                                .clk  (int_clk1), .se(se), .si(), .so());
   assign   fuse_ary_repair_value = data_shft_ff[8:1];
   assign   fuse_ary_repair_en    = {(data_shft_ff[11] & wren_ff),
                                     (data_shft_ff[0] & wren_ff)};
   // Control
   dff_s #(1) ashift_dly1_reg (.din (efc_spc_xfuse_ashift),
                             .q   (ashift_dly1_ff),
				                     .clk (int_clk1), .se(se), .si(), .so());
   dff_s #(1) ashift_dly2_reg (.din (ashift_dly1_ff),
                             .q   (ashift_dly2_ff),
				                     .clk (int_clk1), .se(se), .si(), .so());
   dffrl_async #(1) dshift_dly1_reg (.din (efc_spc_xfuse_dshift),
                             .q   (dshift_dly1_ff),
                             .rst_l (arst_l),
				                     .clk (int_clk1), .se(se), .si(), .so());
   dffrl_async #(1) dshift_dly2_reg (.din (dshift_dly1_ff),
                             .q   (dshift_dly2_ff),
                             .rst_l (arst_l),
				                     .clk (int_clk1), .se(se), .si(), .so());
   assign   wren_ph1 = dshift_dly2_ff && ~dshift_dly1_ff && wren_bit;
   assign   rden_ph1 = ashift_dly2_ff && ~ashift_dly1_ff && ~wren_bit;
   // use phase two for wren since array writes in phase one
   dffrl_async #(1) wren_reg (.din  (wren_ph1),
                      .q     (wren_ff),
                      .rst_l (arst_l),
				              .clk   (int_clk2), .se(se), .si(), .so());
   // address is never shifted out
   assign   spc_efc_xfuse_data = data_shft_ff[11];
   assign   fuse_ary_wren = wren_ff & testmode_l;
`endif
endmodule