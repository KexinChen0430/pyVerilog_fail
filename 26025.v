module outputs)
wire			ctu_dram_tx_sync_dly1;	// From u_ctu_dram_tx_sync_dly1 of dff_ns.v
wire			ctu_dram_tx_sync_dly2;	// From u_ctu_dram_tx_sync_dly2 of dff_ns.v
wire			ctu_jbus_rx_sync_dly1;	// From u_ctu_jbus_rx_sync_dly1 of dff_ns.v
wire			ctu_jbus_rx_sync_dly2;	// From u_ctu_jbus_rx_sync_dly2 of dff_ns.v
wire			ctu_jbus_rx_sync_dly3;	// From u_ctu_jbus_rx_sync_dly3 of dff_ns.v
wire			ctu_jbus_tx_sync_dly1;	// From u_ctu_jbus_tx_sync_dly1 of dff_ns.v
wire			ctu_jbus_tx_sync_dly2;	// From u_ctu_jbus_tx_sync_dly2 of dff_ns.v
wire			ctu_jbus_tx_sync_dly3;	// From u_ctu_jbus_tx_sync_dly3 of dff_ns.v
// End of automatics
wire                    ctu_dram_tx_sync_early_nxt;
wire                    jbus_tx_sync_nxt;
wire                    jbus_rx_sync_nxt;
wire                    jbus_tx_sync_local;	// From u_ctu_cluster_header_sync of cluster_header_sync.v
wire                    jbus_rx_sync_local;	// From u_ctu_cluster_header_sync of cluster_header_sync.v
wire                    dram_tx_sync_local;	// From u_ctu_cluster_header_sync of cluster_header_sync.v
wire pulse_cnt_dn_nxt;
wire [2:0] pulse_cnt_nxt;
wire [2:0] pulse_cnt;
wire pulse_filter;
 /* dff_ns AUTO_TEMPLATE (
          .q(ctu_dram_tx_sync_dly1),
          .din(ctu_dram_tx_sync),
          .clk(cmp_gclk),
      );
*/
     dff_ns u_ctu_dram_tx_sync_dly1 (/*AUTOINST*/
				     // Outputs
				     .q	(ctu_dram_tx_sync_dly1), // Templated
				     // Inputs
				     .din(ctu_dram_tx_sync),	 // Templated
				     .clk(cmp_gclk));		 // Templated
 /* dff_ns AUTO_TEMPLATE (
          .q(ctu_jbus_tx_sync_dly1),
          .din(ctu_jbus_tx_sync),
          .clk(cmp_gclk),
      );
*/
     dff_ns u_ctu_jbus_tx_sync_dly1 (/*AUTOINST*/
				     // Outputs
				     .q	(ctu_jbus_tx_sync_dly1), // Templated
				     // Inputs
				     .din(ctu_jbus_tx_sync),	 // Templated
				     .clk(cmp_gclk));		 // Templated
 /* dff_ns AUTO_TEMPLATE (
          .q(ctu_jbus_rx_sync_dly1),
          .din(ctu_jbus_rx_sync),
          .clk(cmp_gclk),
      );
*/
     dff_ns u_ctu_jbus_rx_sync_dly1 (/*AUTOINST*/
				     // Outputs
				     .q	(ctu_jbus_rx_sync_dly1), // Templated
				     // Inputs
				     .din(ctu_jbus_rx_sync),	 // Templated
				     .clk(cmp_gclk));		 // Templated
 /* dff_ns AUTO_TEMPLATE (
          .q(ctu_dram_tx_sync_dly2),
          .din(ctu_dram_tx_sync_dly1),
          .clk(cmp_gclk),
      );
*/
     dff_ns u_ctu_dram_tx_sync_dly2 (/*AUTOINST*/
				     // Outputs
				     .q	(ctu_dram_tx_sync_dly2), // Templated
				     // Inputs
				     .din(ctu_dram_tx_sync_dly1), // Templated
				     .clk(cmp_gclk));		 // Templated
 /* dff_ns AUTO_TEMPLATE (
          .q(ctu_jbus_tx_sync_dly2),
          .din(ctu_jbus_tx_sync_dly1),
          .clk(cmp_gclk),
      );
*/
     dff_ns u_ctu_jbus_tx_sync_dly2 (/*AUTOINST*/
				     // Outputs
				     .q	(ctu_jbus_tx_sync_dly2), // Templated
				     // Inputs
				     .din(ctu_jbus_tx_sync_dly1), // Templated
				     .clk(cmp_gclk));		 // Templated
 /* dff_ns AUTO_TEMPLATE (
          .q(ctu_jbus_rx_sync_dly2),
          .din(ctu_jbus_rx_sync_dly1),
          .clk(cmp_gclk),
      );
*/
     dff_ns u_ctu_jbus_rx_sync_dly2 (/*AUTOINST*/
				     // Outputs
				     .q	(ctu_jbus_rx_sync_dly2), // Templated
				     // Inputs
				     .din(ctu_jbus_rx_sync_dly1), // Templated
				     .clk(cmp_gclk));		 // Templated
 /* dff_ns AUTO_TEMPLATE (
          .q(ctu_jbus_tx_sync_dly3),
          .din(ctu_jbus_tx_sync_dly2),
          .clk(cmp_gclk),
      );
*/
     dff_ns u_ctu_jbus_tx_sync_dly3 (/*AUTOINST*/
				     // Outputs
				     .q	(ctu_jbus_tx_sync_dly3), // Templated
				     // Inputs
				     .din(ctu_jbus_tx_sync_dly2), // Templated
				     .clk(cmp_gclk));		 // Templated
 /* dff_ns AUTO_TEMPLATE (
          .q(ctu_jbus_rx_sync_dly3),
          .din(ctu_jbus_rx_sync_dly2),
          .clk(cmp_gclk),
      );
*/
     dff_ns u_ctu_jbus_rx_sync_dly3 (/*AUTOINST*/
				     // Outputs
				     .q	(ctu_jbus_rx_sync_dly3), // Templated
				     // Inputs
				     .din(ctu_jbus_rx_sync_dly2), // Templated
				     .clk(cmp_gclk));		 // Templated
 /* cluster_header_sync AUTO_TEMPLATE (
                                               .dram_rx_sync_global(1'b0),
                                               .dram_tx_sync_global(ctu_dram_tx_sync_dly2),
                                               .jbus_tx_sync_global(ctu_jbus_tx_sync_dly3),
                                               .jbus_rx_sync_global(ctu_jbus_rx_sync_dly3),
                                               .dram_tx_sync_local(dram_tx_sync_local),
                                               .jbus_rx_sync_local(jbus_rx_sync_local),
                                               .jbus_tx_sync_local(jbus_tx_sync_local),
                                               .so(so),
                                               .dram_rx_sync_local(),
                                               .si(si),
                                               .se(se),
                                               .cmp_rclk(cmp_clk),
      );
    */
cluster_header_sync u_ctu_cluster_header_sync (
					       .dram_tx_sync_local(dram_tx_sync_local),
					       .jbus_rx_sync_local(jbus_rx_sync_local),
					       .jbus_tx_sync_local(jbus_tx_sync_local),
                                               /*AUTOINST*/
					       // Outputs
					       .dram_rx_sync_local(), // Templated
					       .so(so),		 // Templated
					       // Inputs
					       .dram_rx_sync_global(1'b0), // Templated
					       .dram_tx_sync_global(ctu_dram_tx_sync_dly2), // Templated
					       .jbus_rx_sync_global(ctu_jbus_rx_sync_dly3), // Templated
					       .jbus_tx_sync_global(ctu_jbus_tx_sync_dly3), // Templated
					       .cmp_gclk(cmp_gclk),
					       .cmp_rclk(cmp_clk), // Templated
					       .si(si),		 // Templated
					       .se(se));		 // Templated
//  pulse counter:
    assign pulse_cnt_dn_nxt = (pulse_cnt == 3'b111) ;
    assign pulse_cnt_nxt = ~pulse_cnt_dn_nxt? pulse_cnt + 3'b001 :
                           pulse_cnt;
    dffrl_async_ns #(3) u_pulse_cnt(
                      .din ( pulse_cnt_nxt),
                      .clk (cmp_clk),
                      .rst_l(start_clk_early_jl),
                      .q (pulse_cnt));
    dffrl_async_ns  u_filter_pulse(
                      .din ( pulse_cnt_dn_nxt),
                      .clk (cmp_clk),
                      .rst_l(start_clk_early_jl),
                      .q (pulse_filter));
    assign    jbus_rx_sync_nxt = jbus_rx_sync_local & pulse_filter;
 /* dff_ns AUTO_TEMPLATE (
          .q(jbus_rx_sync),
          .din(jbus_rx_sync_nxt),
          .clk(cmp_clk),
      );
   */
      dff_ns u_jbus_rx_sync (/*AUTOINST*/
			     // Outputs
			     .q		(jbus_rx_sync),		 // Templated
			     // Inputs
			     .din	(jbus_rx_sync_nxt),	 // Templated
			     .clk	(cmp_clk));		 // Templated
    assign    jbus_tx_sync_nxt = jbus_tx_sync_local & pulse_filter;
   /* dff_ns AUTO_TEMPLATE (
          .q(jbus_tx_sync),
          .din(jbus_tx_sync_nxt),
          .clk(cmp_clk),
      );
   */
      dff_ns u_jbus_tx_sync (/*AUTOINST*/
			     // Outputs
			     .q		(jbus_tx_sync),		 // Templated
			     // Inputs
			     .din	(jbus_tx_sync_nxt),	 // Templated
			     .clk	(cmp_clk));		 // Templated
    assign    ctu_dram_tx_sync_early_nxt = dram_tx_sync_local & pulse_filter;
   /* dff_ns AUTO_TEMPLATE (
          .q(ctu_dram_tx_sync_early),
          .din(ctu_dram_tx_sync_early_nxt ),
          .clk(cmp_clk),
      );
   */
      dff_ns u_dram_tx_sync_early (/*AUTOINST*/
				   // Outputs
				   .q	(ctu_dram_tx_sync_early), // Templated
				   // Inputs
				   .din	(ctu_dram_tx_sync_early_nxt ), // Templated
				   .clk	(cmp_clk));		 // Templated
endmodule