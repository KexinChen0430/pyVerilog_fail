module//
         .TXDATAVALID_SYMGEN_OUT        (txdatavalid_symgen_i),
           .RXUSRCLK2_IN                           (user_clk)
     );
     assign mmcm_not_locked_i = !mmcm_not_locked;
     //_____________________________ AXI DRP SHIM _______________________________
aurora_64b66b_25p4G_AXI_TO_DRP #
     (
        .DATA_WIDTH(32)
     )
     axi_to_drp_i
     (
            // AXI4-Lite input signals
          .S_AXI_AWADDR(s_axi_awaddr),
          .S_AXI_AWVALID(s_axi_awvalid),
          .S_AXI_AWREADY(s_axi_awready),
          .S_AXI_WDATA(s_axi_wdata),
          .S_AXI_WSTRB(s_axi_wstrb),
          .S_AXI_WVALID(s_axi_wvalid),
          .S_AXI_WREADY(s_axi_wready),
          .S_AXI_BVALID(s_axi_bvalid),
          .S_AXI_BRESP(s_axi_bresp),
          .S_AXI_BREADY(s_axi_bready),
          .S_AXI_ARADDR(s_axi_araddr),
          .S_AXI_ARVALID(s_axi_arvalid),
          .S_AXI_ARREADY(s_axi_arready),
          .S_AXI_RDATA(s_axi_rdata),
          .S_AXI_RVALID(s_axi_rvalid),
          .S_AXI_RRESP(s_axi_rresp),
          .S_AXI_RREADY(s_axi_rready),
          // DRP Interface
          .DRPADDR_IN(drpaddr_in_i),
          .DRPDI_IN(drpdi_in_i),
          .DRPDO_OUT(drpdo_out_i),
          .DRPRDY_OUT(drprdy_out_i),
          .DRPEN_IN(drpen_in_i),
          .DRPWE_IN(drpwe_in_i),
          // System Interface
          .DRP_CLK_IN (init_clk),
          .RESET(rst_drp)
     );
     //__________Instantiate Global Logic to combine Lanes into a Channel______
aurora_64b66b_25p4G_GLOBAL_LOGIC #
     (
        .INTER_CB_GAP(INTER_CB_GAP)
     )   global_logic_i
     (
         //GTX Interface
         .CH_BOND_DONE(ch_bond_done_i),
         .EN_CHAN_SYNC(en_chan_sync_i),
         .CHAN_BOND_RESET(chan_bond_reset_i),
         // Aurora Lane Interface
         .LANE_UP(lane_up_i),
         .HARD_ERR(hard_err_i),
         .GEN_NA_IDLES(gen_na_idles_i),
         .GEN_CH_BOND(gen_ch_bond_i),
         .RESET_LANES(reset_lanes_i),
         .GOT_NA_IDLES(got_na_idles_i),
         .GOT_CCS(got_cc_i),
         .REMOTE_READY(remote_ready_i),
         .GOT_CBS(got_cb_i),
         .GOT_IDLES(got_idles_i),
         // System Interface
         .USER_CLK(user_clk),
         .RESET(reset),
         .CHANNEL_UP_RX_IF(channel_up_rx_if),
         .CHANNEL_UP_TX_IF(channel_up_tx_if),
         .CHANNEL_HARD_ERR(hard_err),
         .TXDATAVALID_IN(txdatavalid_i)
     );
     //_____________________________ TX AXI SHIM _______________________________
     // Converts input AXI4-Stream signals to LocalLink
    // TX LOCALLINK
aurora_64b66b_25p4G_TX_LL tx_ll_i
     (
          // S_AXI_TX Interface
         .s_axi_tx_tdata  (s_axi_tx_tdata),
         .s_axi_tx_tkeep  (s_axi_tx_tkeep),
         .s_axi_tx_tlast  (s_axi_tx_tlast),
         .s_axi_tx_tvalid (s_axi_tx_tvalid),
         .s_axi_tx_tready (s_axi_tx_tready),
         // Clock Compenstaion Interface
         .DO_CC(do_cc_i),
         // Global Logic Interface
         .CHANNEL_UP(channel_up_tx_if),
         // Aurora Lane Interface
         .GEN_SEP(gen_sep_i),
         .GEN_SEP7(gen_sep7_i),
         .SEP_NB(sep_nb_i),
         .TX_PE_DATA_V(tx_pe_data_v_i),
         .TX_PE_DATA(tx_pe_data_i),
         .GEN_CC(gen_cc_i),
         // System Interface
         .USER_CLK(user_clk),
         .TXDATAVALID_IN(txdatavalid_i),
         .RESET(reset_lanes_i)
    );
 //_____________________________ RX AXI SHIM _______________________________
     // RX LOCALLINK
aurora_64b66b_25p4G_RX_LL rx_ll_i
    (
        //AXI4-Stream Interface
         .m_axi_rx_tdata  (m_axi_rx_tdata),
         .m_axi_rx_tkeep  (m_axi_rx_tkeep),
         .m_axi_rx_tvalid (m_axi_rx_tvalid),
         .m_axi_rx_tlast  (m_axi_rx_tlast),
         // Aurora Lane Interface
         .RX_PE_DATA(rx_pe_data_i),
         .RX_PE_DATA_V(rx_pe_data_v_i),
         .RX_SEP(rx_sep_i),
         .RX_SEP7(rx_sep7_i),
         .RX_SEP_NB(rx_sep_nb_i),
         .RXDATAVALID_TO_LL(rxdatavalid_to_ll_i),
           .RX_CC(got_cc_i),
         .RX_IDLE(got_idles_i),
         // Global Logic Interface
         .CHANNEL_UP(channel_up_rx_if),
         // System Interface
         .USER_CLK(user_clk),
         .RESET(reset_lanes_i)
    );
      assign rst_drp = pma_init_sync;
    // Standard CC Module
aurora_64b66b_25p4G_STANDARD_CC_MODULE #
(
    .CC_FREQ_FACTOR (CC_FREQ_FACTOR)
)
 standard_cc_module_i
    (
         .DO_CC         (do_cc_i),
         .USER_CLK      (user_clk),
         .CHANNEL_UP    (channel_up_rx_if)
    );
 endmodule