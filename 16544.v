module is included in the design
   assign gtwiz_userclk_rx_active_in = usrclk_rx_active_in_extend_cntr[7];
   assign txpmaresetdone_int        = txpmaresetdone_out;
   assign gtwiz_userclk_tx_reset_in = ~(&txpmaresetdone_int);
   assign bufg_gt_clr_out     = ~(&txpmaresetdone_int);
   assign rxpmaresetdone_int        = rxpmaresetdone_out;
   assign gtwiz_userclk_rx_reset_in = ~(&rxpmaresetdone_int);
      always @(posedge gtwiz_reset_clk_freerun_in)
          gtwiz_userclk_rx_reset_in_r <= `DLY gtwiz_userclk_rx_reset_in;
    // decision is made to use qpll0 only - note the 1 at the end of QPLL, so below changes are needed
    // to be incorporated
    assign qpll0outclk_out    = qpll0outclk_out;
    assign qpll0outrefclk_out = qpll0outrefclk_out;
 // dynamic GT instance call
   aurora_64b66b_25p4G_gt aurora_64b66b_25p4G_gt_i
  (
   .dmonitorout_out(dmonitorout_out),
   .drpaddr_in(drpaddr_in),
   .drpclk_in(drpclk_in),
   .drpdi_in(drpdi_in),
   .drpdo_out(drpdo_out),
   .drpen_in(drpen_in),
   .drprdy_out(drprdy_out),
   .drpwe_in(drpwe_in),
   .eyescandataerror_out(eyescandataerror_out),
   .eyescanreset_in(eyescanreset_in),
   .eyescantrigger_in(eyescantrigger_in),
   .gtpowergood_out(gtpowergood_out),
   .gtrefclk0_in(gtrefclk0_in),
   .gtwiz_reset_all_in(gtwiz_reset_all_in),
   .gtwiz_reset_clk_freerun_in(gtwiz_reset_clk_freerun_in),
   .gtwiz_reset_qpll0lock_in(gtwiz_reset_qpll0lock_in),
   .gtwiz_reset_qpll0reset_out(gtwiz_reset_qpll0reset_out),
   .gtwiz_reset_rx_cdr_stable_out(gtwiz_reset_rx_cdr_stable_out),
   .gtwiz_reset_rx_datapath_in(gtwiz_reset_rx_datapath_in),
   .gtwiz_reset_rx_done_out(gtwiz_reset_rx_done_out),
   .gtwiz_reset_rx_pll_and_datapath_in(gtwiz_reset_rx_pll_and_datapath_in),
   .gtwiz_reset_tx_datapath_in(gtwiz_reset_tx_datapath_in),
   .gtwiz_reset_tx_done_out(gtwiz_reset_tx_done_out),
   .gtwiz_reset_tx_pll_and_datapath_in(gtwiz_reset_tx_pll_and_datapath_in),
   .gtwiz_userclk_rx_active_in(gtwiz_userclk_rx_active_in),
   .gtwiz_userclk_tx_active_in(gtwiz_userclk_tx_active_in),
   .gtwiz_userdata_rx_out(gtwiz_userdata_rx_out),
   .gtwiz_userdata_tx_in(gtwiz_userdata_tx_in),
   .gtyrxn_in(gtyrxn_in),
   .gtyrxp_in(gtyrxp_in),
   .gtytxn_out(gtytxn_out),
   .gtytxp_out(gtytxp_out),
   .loopback_in(loopback_in),
   .pcsrsvdin_in(pcsrsvdin_in),
   .qpll0clk_in(qpll0clk_in),
   .qpll0refclk_in(qpll0refclk_in),
   .qpll1clk_in(qpll1clk_in),
   .qpll1refclk_in(qpll1refclk_in),
   .rxbufreset_in(rxbufreset_in),
   .rxbufstatus_out(rxbufstatus_out),
   .rxcdrhold_in(rxcdrhold_in),
   .rxcdrovrden_in(rxcdrovrden_in),
   .rxdatavalid_out(rxdatavalid_out),
   .rxdfelpmreset_in(rxdfelpmreset_in),
   .rxgearboxslip_in(rxgearboxslip_in),
   .rxheader_out(rxheader_out),
   .rxheadervalid_out(rxheadervalid_out),
   .rxlpmen_in(rxlpmen_in),
   .rxoutclk_out(rxoutclk_out),
   .rxpcsreset_in(rxpcsreset_in),
   .rxpmareset_in(rxpmareset_in),
   .rxpmaresetdone_out(rxpmaresetdone_out),
   .rxpolarity_in(rxpolarity_in),
   .rxprbscntreset_in(rxprbscntreset_in),
   .rxprbserr_out(rxprbserr_out),
   .rxprbssel_in(rxprbssel_in),
   .rxresetdone_out(rxresetdone_out),
   .rxstartofseq_out(rxstartofseq_out),
   .rxusrclk2_in(rxusrclk2_in),
   .rxusrclk_in(rxusrclk_in),
   .txbufstatus_out(txbufstatus_out),
   .txdiffctrl_in(txdiffctrl_in),
   .txheader_in(txheader_in),
   .txinhibit_in(txinhibit_in),
   .txoutclk_out(txoutclk_out),
   .txoutclkfabric_out(txoutclkfabric_out),
   .txoutclkpcs_out(txoutclkpcs_out),
   .txpcsreset_in(txpcsreset_in),
   .txpmareset_in(txpmareset_in),
   .txpmaresetdone_out(txpmaresetdone_out),
   .txpolarity_in(txpolarity_in),
   .txpostcursor_in(txpostcursor_in),
   .txprbsforceerr_in(txprbsforceerr_in),
   .txprbssel_in(txprbssel_in),
   .txprecursor_in(txprecursor_in),
   .txresetdone_out(txresetdone_out),
   .txsequence_in(txsequence_in),
   .txusrclk2_in(txusrclk2_in),
   .txusrclk_in(txusrclk_in)
  );
endmodule