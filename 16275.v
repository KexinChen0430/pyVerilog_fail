module instantiation########################
     aurora_64b66b_25p4G_CLOCK_CORRECTION_CHANNEL_BONDING #
     (
     .INTER_CB_GAP                      (INTER_CB_GAP                   ),
     .EXAMPLE_SIMULATION                (EXAMPLE_SIMULATION             ),
     .wait_for_fifo_wr_rst_busy_value   (wait_for_fifo_wr_rst_busy_value),
     .LOW_WATER_MARK                    (LOW_WATER_MARK_MASTER          ),
     .HIGH_WATER_MARK                   (HIGH_WATER_MARK_MASTER         ),
     .BACKWARD_COMP_MODE3               (BACKWARD_COMP_MODE3),
     .CH_BOND_MAX_SKEW                  (2'b10),
     .CH_BOND_MODE                      (CHAN_BOND_MODE_0     )
     )
       cbcc_gtx0_i
     (
       //Write Interface
         .GTX_RX_DATA_IN                (rxdata_to_fifo_i     ),
         .GTX_RX_DATAVALID_IN           (rxdatavalid_to_fifo_i),
         .GTX_RX_HEADER_IN              (rxheader_to_fifo_i   ),
         .WR_ENABLE                     (enable_32_i                            ),
         .USER_CLK                      (rxusrclk_out),//(rxrecclk_to_fabric_i),//
         .RXLOSSOFSYNC_IN               (rxlossofsync_out_q   ),
         .ENCHANSYNC                    (ENCHANSYNC_IN        ),
         .CHAN_BOND_RESET               (CHAN_BOND_RESET                        ),
       //Read Interface
         .CC_RX_DATA_OUT(RXDATA_OUT),
         .CC_RX_BUF_STATUS_OUT          (rxbuferr_out_i       ),
         .CC_RX_DATAVALID_OUT           (RXDATAVALID_OUT      ),
         .CC_RX_HEADER_OUT              (RXHEADER_OUT         ),
         .CC_RX_HEADER_OUT_ERR          (RXHEADER_OUT_ERR     ),
         .CC_RXLOSSOFSYNC_OUT           (RXLOSSOFSYNC_OUT     ),
         .CHBONDI (chbondi),
         .CHBONDO                       (chbondo_to_slaves_i),
         .RXCHANISALIGNED               (CHBONDDONE_OUT       ),
         .CBCC_FIFO_RESET_WR_CLK        (cbcc_fifo_reset_wr_clk                 ),
         .CBCC_FIFO_RESET_TO_FIFO_WR_CLK( cbcc_fifo_reset_to_fifo_wr_clk        ),
         .cbcc_data_srst                 ( cbcc_data_srst              ),
         .CBCC_FIFO_RESET_RD_CLK        (cbcc_fifo_reset_rd_clk                 ),
         .CBCC_FIFO_RESET_TO_FIFO_RD_CLK(cbcc_fifo_reset_to_fifo_rd_clk         ),
         .CBCC_ONLY_RESET_RD_CLK        (cbcc_only_reset_rd_clk                 ),
         .CBCC_RESET_CBSTG2_RD_CLK      (cbcc_reset_cbstg2_rd_clk               ),
         .ANY_VLD_BTF_FLAG              (any_vld_btf_i        ),
         .START_CB_WRITES_OUT           (start_cb_writes_i    ),
         .ALL_START_CB_WRITES_IN        (all_start_cb_writes_i                  ),
         .ALL_VLD_BTF_FLAG_IN           (all_vld_btf_flag_i                     ),
         .PERLN_DO_RD_EN                (do_rd_en_i           ),
         .MASTER_DO_RD_EN               (master_do_rd_en_i                      ),
         .FIRST_CB_BITERR_CB_RESET_OUT  (bit_err_chan_bond_i  ),
         .FINAL_GATER_FOR_FIFO_DIN      (final_gater_for_fifo_din_i ),
         .RESET                         (new_gtx_rx_pcsreset_comb               ),
         .RD_CLK                        (RXUSRCLK2_IN                           ),
         .HPCNT_RESET_IN                (stableclk_gtx_reset_comb),//
         .GTXRESET_IN                   (GTXRESET_IN                            ),
         .INIT_CLK                      (INIT_CLK                               ),
         .LINK_RESET                    (link_reset_0_c               )
     );
    wire reset_initclk;
    aurora_64b66b_25p4G_rst_sync u_rst_sync_reset_initclk
      (
      .prmry_in (RESET),
          .scndry_aclk          (INIT_CLK),
          .scndry_out           (reset_initclk)
      );
         assign  rxfsm_reset_i                = hpreset_or_pma_init_in | cdr_reset_fsm_lnkreset;
         assign sys_and_fsm_reset_for_hpcnt  = rxfsm_reset_i ? 1'b0 : (reset_initclk | ~FSM_RESETDONE);
         assign  hp_reset_i                   = hpreset_in | cdr_reset_fsm_lnkreset;
         assign  HPCNT_RESET_IN = GTXRESET_IN | sys_and_fsm_reset_for_hpcnt | cdr_reset_fsm_lnkreset ;
         assign  blocksync_all_lanes_inrxclk  = blocksync_out_i ;
         assign rxlossofsync_out_i        = allow_block_sync_propagation_inrxclk ? blocksync_out_i : 1'b0;
     always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
     begin
         rxlossofsync_out_q <= `DLY rxlossofsync_out_i;
     end
    always @(posedge rxusrclk_out)//always @(posedge rxrecclk_to_fabric_i)//
    begin
        blocksync_all_lanes_inrxclk_q <= `DLY blocksync_all_lanes_inrxclk;
    end
    aurora_64b66b_25p4G_rst_sync u_rst_sync_blocksyncall_initclk_sync
      (
          .prmry_in             (blocksync_all_lanes_inrxclk_q),
          .scndry_aclk          (INIT_CLK),
          .scndry_out           (blocksync_all_lanes_instableclk)
      );
    aurora_64b66b_25p4G_rst_sync u_rst_sync_blocksyncprop_inrxclk_sync
      (
          .prmry_in             (allow_block_sync_propagation),
          .scndry_aclk          (rxusrclk_out),//(rxrecclk_to_fabric_i),//
          .scndry_out           (allow_block_sync_propagation_inrxclk)
      );
      always @(posedge INIT_CLK)  begin
         if(hpreset_or_pma_init_in | BACKWARD_COMP_MODE2) begin
             cdr_reset_fsm_r <= IDLE;
             cdr_reset_fsm_cntr_r <= 8'h0;
             cdr_reset_fsm_lnkreset <= 1'b0;
             allow_block_sync_propagation <= BACKWARD_COMP_MODE2;
         end else begin
             case(cdr_reset_fsm_r)
             IDLE: begin
                 cdr_reset_fsm_cntr_r <= 8'h0;
                 allow_block_sync_propagation <= 1'b0;
                 cdr_reset_fsm_lnkreset <= 1'b0;
                 if(blocksync_all_lanes_instableclk) begin
                     cdr_reset_fsm_r <= ASSERT_RXRESET;
                 end
             end
             ASSERT_RXRESET: begin
                 allow_block_sync_propagation <= 1'b0;
                 cdr_reset_fsm_lnkreset <= 1'b1;
                 if(cdr_reset_fsm_cntr_r == 8'hFF) begin
                     cdr_reset_fsm_r <= DONE;
                 end else begin
                     cdr_reset_fsm_cntr_r <= cdr_reset_fsm_cntr_r +  8'h1;
                 end
             end
             DONE: begin
                 cdr_reset_fsm_cntr_r <= 8'h0;
                 cdr_reset_fsm_r      <= DONE;
                 cdr_reset_fsm_lnkreset <= 1'b0;
                 allow_block_sync_propagation <= 1'b1;
             end
             endcase
         end
      end
 endmodule