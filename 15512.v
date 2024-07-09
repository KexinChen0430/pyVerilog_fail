module
aurora_64b66b_25p4G_TX_LL_CONTROL_SM tx_ll_control_sm_i
     (
         // S_AXI_TX Interface
         .s_axi_tx_tlast  (s_axi_tx_tlast),
         .s_axi_tx_tkeep  (s_axi_tx_tkeep),
         .s_axi_tx_tvalid (s_axi_tx_tvalid),
         .s_axi_tx_tready (s_axi_tx_tready),
         // Clock Compensation Interface
         .DO_CC(DO_CC),
         // Global Logic Interface
         .CHANNEL_UP(CHANNEL_UP),
         // TX_LL Control Module Interface
         // Aurora Lane Interface
         .GEN_SEP(GEN_SEP),
         .GEN_SEP7(GEN_SEP7),
         .SEP_NB(SEP_NB),
         .GEN_CC(GEN_CC),
         // System Interface
         .USER_CLK(USER_CLK),
         .TXDATAVALID_IN(TXDATAVALID_IN)
     );
 endmodule